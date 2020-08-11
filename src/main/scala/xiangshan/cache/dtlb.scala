package xiangshan.cache

import chisel3._
import chisel3.util._
import xiangshan._
import utils._
import chisel3.util.experimental.BoringUtils
import xiangshan.backend.decode.XSTrap
import xiangshan.mem._
import xiangshan.mem.pipeline._
import bus.simplebus._
import xiangshan.backend.fu.HasCSRConst

trait HasTlbConst extends HasXSParameter {
  val Level = 3

  val offLen  = 12
  val ppn0Len = 9
  val ppn1Len = 9
  val ppn2Len = PAddrBits - offLen - ppn0Len - ppn1Len
  val ppnnLen = 9
  val ppnLen  = PAddrBits - offLen
  val vpnnLen = 9
  val vpnLen  = VAddrBits - offLen

  val entryLen = XLEN
  val flagLen = 8
  val pteResLen = XLEN - ppnLen - 2 - flagLen
  val asidLen = 16

  def vaBundle = new Bundle {
    val vpn2 = UInt(vpnnLen.W)
    val vpn1 = UInt(vpnnLen.W)
    val vpn0 = UInt(vpnnLen.W)
    val off  = UInt( offLen.W)
  }

  def vaBundle2 = new Bundle {
    val vpn  = UInt(vpnLen.W)
    val off  = UInt(offLen.W)
  }

  def paBundle = new Bundle {
    val ppn2 = UInt(ppn2Len.W)
    val ppn1 = UInt(ppn1Len.W)
    val ppn0 = UInt(ppn0Len.W)
    val off  = UInt( offLen.W)
  }

  def paBundle2 = new Bundle {
    val ppn  = UInt(ppnLen.W)
    val off  = UInt(offLen.W)
  }

  def pteBundle = new Bundle {
    val reserved  = UInt(pteResLen.W)
    val ppn  = UInt(ppnLen.W)
    val rsw  = UInt(2.W)
    val perm = new Bundle {
      val d    = Bool()
      val a    = Bool()
      val g    = Bool()
      val u    = Bool()
      val x    = Bool()
      val w    = Bool()
      val r    = Bool()
      val v    = Bool()
    }
  }
}

abstract class TlbBundle extends XSBundle with HasTlbConst
abstract class TlbModule extends XSModule with HasTlbConst

class PermBundle(val hasV: Boolean = true) extends TlbBundle {
  val d = Bool()
  val a = Bool()
  val g = Bool()
  val u = Bool()
  val x = Bool()
  val w = Bool()
  val r = Bool()
  if (hasV) { val v = Bool() }

  override def toPrintable: Printable = {
    p"d:${d} a:${a} g:${g} u:${u} x:${x} w:${w} r:${r}"// + 
    //(if(hasV) (p"v:${v}") else p"")
  }
}

class TlbEntry extends TlbBundle {
  val vpn = UInt(vpnLen.W) // tag is vpn
  val ppn = UInt(ppnLen.W)
  val level = UInt(log2Up(Level).W) // 0 for 4KB, 1 for 2MB, 2 for 1GB
  // val asid = UInt(asidLen.W), asid maybe expensive to support, but useless
  // val v = Bool() // v&g is special, may need sperate storage?
  val perm = new PermBundle(hasV = false)

  def vpnHit(vpn: UInt):Bool = {
    val fullMask = VecInit((Seq.fill(vpnLen)(true.B))).asUInt
    val maskLevel = VecInit((Level-1 to 0 by -1).map{i => // NOTE: level 2 for 4KB, 1 for 2MB, 0 for 1GB
      VecInit(Seq.fill(vpnLen-i*vpnnLen)(true.B) ++ Seq.fill(i*vpnnLen)(false.B)).asUInt})
    val mask = maskLevel(level)
    (mask&this.vpn) === (mask&vpn)
  }

  // def asidHit(asid: UInt) = {
  //   this.asid === asid
  // }

  def hit(vpn: UInt/*, asid: UInt*/):Bool = {
    vpnHit(vpn)// && asidHit(asid)
  }

  def genTlbEntry(pte: UInt, level: UInt, vpn: UInt/*, asid: UInt*/) = {
    val e = Wire(new TlbEntry)
    e.ppn := pte.asTypeOf(pteBundle).ppn
    e.level := level
    e.vpn := vpn
    e.perm := pte.asTypeOf(pteBundle).perm
    // e.asid := asid
    e
  }

  override def toPrintable: Printable = {
    p"vpn:0x${Hexadecimal(vpn)} ppn:0x${Hexadecimal(ppn)} level:${level} perm:${perm}"
  }
}

object TlbCmd {
  def read  = "b00".U
  def write = "b01".U
  def exec  = "b10".U

  def apply() = UInt(2.W)
  def isRead(a: UInt) = a===read
  def isWrite(a: UInt) = a===write
  def isExec(a: UInt) = a===exec
}

class TlbReq extends TlbBundle {
  val vaddr = UInt(VAddrBits.W)
  val idx = UInt(RoqIdxWidth.W)
  val cmd = TlbCmd()

  override def toPrintable: Printable = {
    p"vaddr:0x${Hexadecimal(vaddr)} idx:${idx} cmd:${cmd}"
  }
}

class TlbResp extends TlbBundle {
  val paddr = UInt(PAddrBits.W)
  val miss = Bool()
  val excp = new Bundle {
    val pf = new Bundle {
      val ld = Bool()
      val st = Bool()
      val instr = Bool()
    }
    // val ma = new Bundle { // may handle in other module
    //   val ld = Bool()
    //   val st = Bool()
    //   val instr = Bool()
    // }
    // val af = new Bundle {
    //   val ld = Bool()
    //   val st = Bool()
    //   val instr = Bool()
    // }
  }
  override def toPrintable: Printable = {
    p"paddr:0x${Hexadecimal(paddr)} miss:${miss} excp.pf: ld:${excp.pf.ld} st:${excp.pf.st} instr:${excp.pf.instr}"
  }
}

class TlbRequestIO() extends TlbBundle {
  val req = Valid(new TlbReq)
  val resp = Flipped(Valid(new TlbResp))

  // override def cloneType: this.type = (new TlbRequestIO(Width)).asInstanceOf[this.type]
}

class TlbPtwIO extends TlbBundle {
  val req = DecoupledIO(new PtwReq)
  val resp = Flipped(DecoupledIO(new PtwResp))
}

class TlbIO(Width: Int) extends TlbBundle {
  val requestor = Vec(Width, Flipped(new TlbRequestIO))
  val ptw = new TlbPtwIO

  override def cloneType: this.type = (new TlbIO(Width)).asInstanceOf[this.type]
}

class FakeTlb(Width: Int = 1) extends TlbModule {
  val io = IO(new TlbIO(Width))
  // Tlb has 4 ports: 2 for load, 2 for store
  io <> DontCare
  // fake Tlb
  (0 until LoadPipelineWidth + StorePipelineWidth).map(i => {
    io.requestor(i).resp.valid := io.requestor(i).req.valid
    io.requestor(i).resp.bits.paddr := io.requestor(i).req.bits.vaddr
    io.requestor(i).resp.bits.miss := false.B
  })
}

class TLB(Width: Int, isDtlb: Boolean) extends TlbModule with HasCSRConst{
  val io = IO(new TlbIO(Width))

  val req    = io.requestor.map(_.req)
  val resp   = io.requestor.map(_.resp)
  val ptw    = io.ptw

  val sfence = WireInit(0.U.asTypeOf(new SfenceBundle))
  val csr    = WireInit(0.U.asTypeOf(new TlbCsrBundle))
  val satp   = csr.satp
  val priv   = csr.priv
  val ifecth = if (isDtlb) false.B else true.B
  val mode   = if (isDtlb) priv.dmode else priv.imode
  val vmEnable = satp.mode === 8.U // && (mode < ModeM) // FIXME: fix me when boot xv6/linux...
  BoringUtils.addSink(sfence, "SfenceBundle")
  BoringUtils.addSink(csr, "TLBCSRIO")

  val reqAddr = req.map(_.bits.vaddr.asTypeOf(vaBundle2))
  val cmd     = req.map(_.bits.cmd)
  val valid   = req.map(_.valid)

  def widthMapSeq[T <: Seq[Data]](f: Int => T) = (0 until Width).map(f)
  def widthMap[T <: Data](f: Int => T) = (0 until Width).map(f)

  val v = RegInit(0.U(TlbEntrySize.W))
  val entry = Reg(Vec(TlbEntrySize, new TlbEntry))

  val ptwIdx = Reg(UInt(RoqIdxWidth.W))
  val ptwPf  = RegInit(false.B) // TODO: add redirect. also for ptw, add redirect
  val ptwPfHit = widthMap{i => ptwPf && req(i).valid && req(i).bits.idx === ptwIdx }

  val hitVec = widthMapSeq{ i => 
    (v.asBools zip VecInit(entry.map(_.hit(reqAddr(i).vpn/*, satp.asid*/)))).map{ case (a,b) => a&b } }
  val hit = widthMap{i => ParallelOR(hitVec(i)).asBool && valid(i) && vmEnable && !ptwPfHit(i)}
  val miss = widthMap{i => !hit(i) && valid(i) && vmEnable && !ptwPfHit(i)}
  val hitppn = widthMap{ i => ParallelMux(hitVec(i) zip entry.map(_.ppn)) }
  val hitPerm = widthMap{ i => ParallelMux(hitVec(i) zip entry.map(_.perm)) }
  val multiHit = {
    val hitSum = widthMap{ i => PopCount(hitVec(i)) }
    ParallelOR(widthMap{ i => !(hitSum(i) === 0.U || hitSum(i) === 1.U) })
  }
  assert(!multiHit) // add multiHit here, later it should be removed (maybe), turn to miss and flush

  // resp  // TODO: A/D has not being concerned
  for(i <- 0 until Width) {
    when (ptwPfHit(i)) { ptwPf := false.B }
    // req(i).ready := resp(i).ready // true.B // ValidIO
    resp(i).valid := valid(i) // TODO: check it's func in outer module
    resp(i).bits.paddr := Mux(vmEnable, Cat(hitppn(i), reqAddr(i).off), SignExt(req(i).bits.vaddr, PAddrBits))
    resp(i).bits.miss := miss(i)

    val perm = hitPerm(i) // NOTE: given the excp, the out module choose one to use?
    val modeCheck = !(mode === ModeU && !perm.u || mode === ModeS && perm.u && (!priv.sum || ifecth))
    resp(i).bits.excp.pf.ld    := (ptwPfHit(i) && TlbCmd.isRead(cmd(i))) || hit(i) && !(modeCheck && (perm.r || priv.mxr && perm.x)) && (TlbCmd.isRead(cmd(i)) && true.B/*!isAMO*/)
    resp(i).bits.excp.pf.st    := (ptwPfHit(i) && TlbCmd.isWrite(cmd(i))) || hit(i) && !(modeCheck && perm.w) && (TlbCmd.isWrite(cmd(i)) || false.B/*TODO isAMO. */)
    resp(i).bits.excp.pf.instr := (ptwPfHit(i) && TlbCmd.isExec(cmd(i))) || hit(i) && !(modeCheck && perm.x) && TlbCmd.isExec(cmd(i))
  }

  // sfence (flush)
  when (sfence.valid) {
    when (sfence.bits.rs1) { // virtual address *.rs1 <- (rs1===0.U)
      when (sfence.bits.rs2) { // asid, but i do not want to support asid, *.rs2 <- (rs2===0.U)
        v := 0.U // all should be flush
      }.otherwise { // all pte but only spec asid
        v := v & ~VecInit(entry.map(e => /*e.asid === sfence.bits.asid && */!e.perm.g)).asUInt
      }
    }.otherwise { // virtual rs1=/=0.U
      when (sfence.bits.rs2) { // asid
        v := v & ~VecInit(entry.map(_.vpn === sfence.bits.addr.asTypeOf(vaBundle2).vpn)).asUInt
      }.otherwise { // particular va and asid
        v := v & ~VecInit(entry.map(e => e.vpn === sfence.bits.addr.asTypeOf(vaBundle2).vpn && (/*e.asid === sfence.bits.asid && */!e.perm.g))).asUInt
      }
    }
  }

  // ptw
  val state_idle :: state_wait :: Nil = Enum(2)
  val state = RegInit(state_idle)

  ptw <> DontCare // TODO: need check it
  when (!ptwPf && ptw.resp.valid) {
    ptwPf := ptw.resp.bits.pf
    ptwIdx := ptw.resp.bits.idx
  }
  ptw.req.valid := ParallelOR(miss).asBool && state===state_idle
  ptw.resp.ready := state===state_wait && !ptwPf
  for(i <- Width-1 to 0 by -1) {
    when (miss(i)) {
      ptw.req.bits.vpn := reqAddr(i).vpn
      ptw.req.bits.idx := req(i).bits.idx
    }
  }

  switch (state) {
    is (state_idle) {
      when (ParallelOR(miss).asBool) {
        state := state_wait
      }
      assert(!ptw.resp.valid)
    }

    is (state_wait) {
      when (ptw.resp.fire()) {
        state := state_idle
      }
    }
  }

  // refill
  val refill = ptw.resp.fire() && !ptw.resp.bits.pf
  val refillIdx = LFSR64()(log2Up(TlbEntrySize)-1,0)
  when (refill) {
    v := v | (1.U << refillIdx)
    entry(refillIdx) := ptw.resp.bits.entry
  }

  for(i <- 0 until Width) {
    XSDebug(req(i).valid, p"req(${i.U}): ${req(i).bits}\n")
    XSDebug(resp(i).valid, p"resp(${i.U}): ${resp(i).bits}\n")
  }

  XSDebug(sfence.valid, p"Sfence: ${sfence}\n")
  XSDebug(ParallelOR(valid), p"CSR: ${csr}\n")
  XSDebug(ParallelOR(valid), p"vmEnable:${vmEnable} hit:${Binary(VecInit(hit).asUInt)} miss:${Binary(VecInit(miss).asUInt)} v:${Hexadecimal(v)}\n")
  XSDebug(ParallelOR(valid)/* || state=/=state_idle || ptwPf*/, p"state:${state} ptwPf:${ptwPf} ptwIdx:${ptwIdx}\n")
  XSDebug(ptw.req.fire(), p"PTW req:${ptw.req.bits}\n")
  XSDebug(ptw.resp.fire(), p"PTW resp:${ptw.resp.bits}\n")
}
