package cache.TLBTest

import cache.TLCTest._
import chipsalliance.rocketchip.config.Parameters
import chisel3._
import chisel3.experimental.BundleLiterals.AddBundleLiteralConstructor
import chisel3.util._
import chiseltest.{ChiselScalatestTester, _}
import chiseltest.experimental.TestOptionBuilder._
import chiseltest.internal.{LineCoverageAnnotation, ToggleCoverageAnnotation, VerilatorBackendAnnotation}
import chiseltest.legacy.backends.verilator.VerilatorFlags
import firrtl.stage.RunFirrtlTransformAnnotation
import freechips.rocketchip.diplomacy.{LazyModule, LazyModuleImp}
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.must.Matchers
import xiangshan.HasXSLog
import xiangshan.cache._
import xiangshan.{TlbCsrBundle}
import xiangshan.testutils.AddSinks
import xstransforms.PrintModuleName

import scala.collection.mutable
import scala.collection.mutable.{ArrayBuffer, ListBuffer, Seq}
import scala.util.Random

class TLBTestTop(width: Int, isDtlb: Boolean)(implicit p: Parameters) extends LazyModule {
  lazy val module = new LazyModuleImp(this) with HasXSLog {
    val io = IO(new TlbIO(width))
    val tlb = Module(new TLB(width, isDtlb))
    tlb.io <> io
  }
}

class TLBTestTopWrapper(width: Int, isDtlb: Boolean)(implicit p: Parameters) extends LazyModule {
  val testTop = LazyModule(new TLBTestTop(width, isDtlb))
  lazy val module = new LazyModuleImp(this) {
    val io = IO(new TlbIO(width))
    AddSinks()
    io <> testTop.module.io
  }
}


class TLBTest extends AnyFlatSpec with ChiselScalatestTester with Matchers with TLCOp with RandomSampleUtil {
  top.Parameters.set(top.Parameters.debugParameters)

  it should "run" in {
    implicit val p = Parameters((site, up, here) => {
      case TLCCacheTestKey =>
        TLCCacheTestParams()
    })

    val isDtlb = true
    val tlbWidth = if (isDtlb) 4 else 1

    val rand = new Random(0xbeef)

    val addr_pool = {
      for (_ <- 0 until 128) yield BigInt(rand.nextInt(0x7ffff) << 12) | 0x80000000L.U.litValue()
    }.distinct.toList

    val addr_list_len = addr_pool.length
    println(f"addr pool length: $addr_list_len")
    val probeProbMap = Map(nothing -> 0.4, branch -> 0.5, trunk -> 0.1)

    def peekBigInt(source: Data): BigInt = {
      source.peek().litValue()
    }

    def peekBoolean(source: Bool): Boolean = {
      source.peek().litToBoolean
    }

    test(LazyModule(new TLBTestTopWrapper(tlbWidth, isDtlb)).module)
      .withAnnotations(Seq(VerilatorBackendAnnotation,
        //        LineCoverageAnnotation,
        //        ToggleCoverageAnnotation,
        VerilatorFlags(Seq("--output-split 5000", "--output-split-cfuncs 5000",
          "+define+RANDOMIZE_REG_INIT", "+define+RANDOMIZE_MEM_INIT")),
        RunFirrtlTransformAnnotation(new PrintModuleName))) { c =>
        c.io.requestor.foreach { l =>
          l.req.initSource().setSourceClock(c.clock)
          l.resp.initSink().setSinkClock(c.clock)
          l.req.valid.poke(false.B)
          l.resp.ready.poke(false.B)
        }
        c.io.requestor.foreach(l => l.req.bits.roqIdx.poke(chiselTypeOf(l.req.bits.roqIdx).Lit(
          _.flag -> true.B,
          _.value -> 15.U
        )))
        c.io.ptw.req.initSink().setSinkClock(c.clock)
        c.io.ptw.req.ready.poke(false.B)
        c.io.ptw.resp.initSource().setSourceClock(c.clock)
        c.io.ptw.resp.valid.poke(false.B)
        c.io.sfence.valid.poke(false.B)
        c.io.csr.satp.mode.poke(3.U)

        val total_clock = 150000

        c.reset.poke(true.B)
        c.clock.step(100)
        c.reset.poke(false.B)
        c.clock.setTimeout(200)

        val tlbModuleReqs = c.io.requestor.map(_.req)
        val tlbModuleResps = c.io.requestor.map(_.resp)
        val tlbModulePtwReq = c.io.ptw.req
        val tlbModulePtwResp = c.io.ptw.resp

        val tlbModuleSfence = c.io.sfence
        val tlbModuleCsr = c.io.csr

        val tlbDriver = new TLBDriver(isDtlb, tlbWidth)
        val tlbMonitor = new TLBMonitor(isDtlb, tlbWidth)
        val tlbSequencer = new TLBSequencer(isDtlb, tlbWidth)
        val tlbMonitorIf = tlbMonitor.tlbMonitorIf
        val tlbDriverIf = tlbDriver.tlbDriverIf


        for (cl <- 0 until total_clock) {
          //prepare poke
          //poke
          tlbDriver.driverPoke(tlbSequencer)
          for (i <- 0 until tlbWidth) {
            //req
            if (tlbDriverIf.tlbReq(i).isDefined) {
              val dreq = tlbDriverIf.tlbReq(i).get
              tlbModuleReqs(i).bits.vaddr.poke(dreq.addr.U)
              tlbModuleReqs(i).bits.cmd.poke(dreq.cmd.U)
              tlbModuleReqs(i).bits.roqIdx.flag.poke(dreq.roqIdx.flag.B)
              tlbModuleReqs(i).bits.roqIdx.value.poke(dreq.roqIdx.value.U)
              tlbModuleReqs(i).bits.debug.pc.poke(dreq.pc.U)
              tlbModuleReqs(i).valid.poke(true.B)
            }
            else {
              tlbModuleReqs(i).valid.poke(false.B)
            }
            //resp
            tlbModuleResps(i).ready.poke(tlbDriverIf.tlbRespReady(i).B)
          }
          //ptw
          tlbModulePtwReq.ready.poke(tlbDriverIf.ptwReqReady.B)

          if (tlbDriverIf.ptwResp.isDefined) {
            val presp = tlbDriverIf.ptwResp.get
            tlbModulePtwResp.bits.entry.poke(chiselTypeOf(tlbModulePtwResp.bits.entry).Lit(
              _.tag -> presp.entry.vpn.U,
              _.ppn -> presp.entry.ppn.U,
              _.perm.get -> chiselTypeOf(tlbModulePtwResp.bits.entry.perm.get).Lit(
                _.d -> presp.entry.perm.d.B,
                _.a -> presp.entry.perm.a.B,
                _.g -> presp.entry.perm.g.B,
                _.u -> presp.entry.perm.u.B,
                _.x -> presp.entry.perm.x.B,
                _.w -> presp.entry.perm.w.B,
                _.r -> presp.entry.perm.r.B,
              ),
              _.level.get -> presp.entry.level.U,
            ))
            tlbModulePtwResp.bits.pf.poke(presp.pf.B)
            tlbModulePtwResp.valid.poke(true.B)
          }
          else {
            tlbModulePtwResp.valid.poke(false.B)
          }
          //sfence
          if (tlbDriverIf.sfence.isDefined) {
            tlbModuleSfence.valid.poke(true.B)
            tlbModuleSfence.bits.rs1.poke(tlbDriverIf.sfence.get.rs1.B)
            tlbModuleSfence.bits.rs2.poke(tlbDriverIf.sfence.get.rs2.B)
            tlbModuleSfence.bits.addr.poke(tlbDriverIf.sfence.get.addr.B)
            tlbMonitorIf.sfence = tlbDriverIf.sfence
          }
          else {
            tlbModuleSfence.valid.poke(false.B)
            tlbMonitorIf.sfence = None
          }
          //csr
          tlbModuleCsr.poke(chiselTypeOf(tlbModuleCsr).Lit(
            _.satp -> chiselTypeOf(tlbModuleCsr.satp).Lit(
              _.mode -> tlbDriverIf.csr.satpMode.U,
              _.asid -> tlbDriverIf.csr.satpAsid.U,
              _.ppn -> tlbDriverIf.csr.satpPpn.U,
            ),
            _.priv -> chiselTypeOf(tlbModuleCsr.priv).Lit(
              _.mxr -> tlbDriverIf.csr.privMxr.B,
              _.sum -> tlbDriverIf.csr.privSum.B,
              _.imode -> tlbDriverIf.csr.privImode.U,
              _.dmode -> tlbDriverIf.csr.privDmode.U,
            )
          ))
          tlbMonitorIf.csr.satpMode = tlbDriverIf.csr.satpMode
          tlbMonitorIf.csr.satpAsid = tlbDriverIf.csr.satpAsid
          tlbMonitorIf.csr.satpPpn = tlbDriverIf.csr.satpPpn
          tlbMonitorIf.csr.privMxr = tlbDriverIf.csr.privMxr
          tlbMonitorIf.csr.privSum = tlbDriverIf.csr.privSum
          tlbMonitorIf.csr.privImode = tlbDriverIf.csr.privImode
          tlbMonitorIf.csr.privDmode = tlbDriverIf.csr.privDmode

          //peek
          for (i <- 0 until tlbWidth) {
            //req
            val req_ready = peekBoolean(tlbModuleReqs(i).ready)
            if (tlbDriverIf.tlbReq(i).isDefined && req_ready) {
              tlbMonitorIf.tlbReq(i) = tlbDriverIf.tlbReq(i)
              tlbDriverIf.tlbReqFire(i) = true
            } else {
              tlbMonitorIf.tlbReq(i) = None
              tlbDriverIf.tlbReqFire(i) = false
            }
            //resp
            val resp_valid = peekBoolean(tlbModuleResps(i).valid)
            if (tlbDriverIf.tlbRespReady(i) && resp_valid) {
              val dresp = new LitTlbResp(
                paddr = peekBigInt(tlbModuleResps(i).bits.paddr),
                miss = peekBoolean(tlbModuleResps(i).bits.miss),
                mmio = peekBoolean(tlbModuleResps(i).bits.mmio),
                pf = new LitFaultBundle(
                  ld = peekBoolean(tlbModuleResps(i).bits.excp.pf.ld),
                  st = peekBoolean(tlbModuleResps(i).bits.excp.pf.st),
                  instr = peekBoolean(tlbModuleResps(i).bits.excp.pf.instr),
                ),
                af = new LitFaultBundle(
                  ld = peekBoolean(tlbModuleResps(i).bits.excp.af.ld),
                  st = peekBoolean(tlbModuleResps(i).bits.excp.af.st),
                  instr = peekBoolean(tlbModuleResps(i).bits.excp.af.instr),
                ),
              )
              tlbDriverIf.tlbResp(i) = Some(dresp)
              tlbDriverIf.tlbRespFire(i) = true
              tlbMonitorIf.tlbResp(i) = Some(dresp)

            }
            else {
              tlbDriverIf.tlbResp(i) = None
              tlbDriverIf.tlbRespFire(i) = false
              tlbMonitorIf.tlbResp(i) = None
            }
          }
          //ptw
          val ptwReqValid = peekBoolean(tlbModulePtwReq.valid)
          if (ptwReqValid && tlbDriverIf.ptwReqReady) {
            tlbDriverIf.ptwReqFire = true
            tlbDriverIf.ptwReq = Some(new LitPtwReq(
              vpn = peekBigInt(tlbModulePtwReq.bits.vpn)
            ))
            tlbMonitorIf.ptwReq = tlbDriverIf.ptwReq
          }
          else {
            tlbDriverIf.ptwReqFire = false
            tlbDriverIf.ptwReq = None
            tlbMonitorIf.ptwReq = None
          }
          val ptwRespReady = peekBoolean(tlbModulePtwResp.ready)
          if (tlbDriverIf.ptwResp.isDefined && ptwRespReady) {
            tlbDriverIf.ptwRespFire = true
            tlbMonitorIf.ptwResp = tlbDriverIf.ptwResp
          }
          else {
            tlbDriverIf.ptwRespFire = false
            tlbMonitorIf.ptwResp = None
          }

          tlbDriver.driverPeek(tlbSequencer)
          tlbDriver.step()
          tlbMonitor.snoop(tlbMonitorIf)
          tlbMonitor.step()
          c.clock.step()
        }
        c.io.requestor.foreach { l =>
          l.req.valid.poke(false.B)
          l.resp.ready.poke(true.B)
        }
        c.clock.step(100)
      }
  }
}
