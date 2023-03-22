package utils

import chisel3._
import chisel3.util._
import freechips.rocketchip.amba.axi4._
import freechips.rocketchip.config.Parameters
import freechips.rocketchip.diplomacy._

/**
  * Add shapper to AXI4 channels
  *
  * Currently only one id (0) is supported, so no interleaving can occur
  */
class AXI4Shaper()(implicit p: Parameters) extends LazyModule {
  val interval = 50
  val idle::req::res::fakeReq::fakeRes::Nil = Enum(5)

  val node = AXI4AdapterNode()

  lazy val module = new LazyModuleImp(this) {
    require(node.in.length == 1)

    (node.in zip node.out) foreach { case ((in, edgeIn), (out, edgeOut)) =>
		  0 until edgeOut.master.endId foreach { _ =>
        val state = RegInit(idle)
        val timeout = Counter(state === idle, interval)._2
        out.aw <> in .aw
        out.w  <> in .w
        in .b  <> out.b
        out.ar <> in .ar
        in .r  <> out.r
        switch(state) {
          is(idle) {
            in.ar.ready := false.B
            out.ar.valid := false.B
            state := Mux(timeout, Mux(in.ar.valid, req, fakeReq), idle)
          }
          is(req) {
            state := Mux(in.ar.fire, res, req)
          }
          is(res) {
            in.ar.ready := false.B
            out.ar.valid := false.B
            state := Mux(in.r.fire, idle, res)
          }
          is(fakeReq) {
            out.ar.valid := true.B
            in.ar.ready := false.B
            state := Mux(out.ar.fire, fakeRes, fakeReq)
          }
          is(fakeRes) {
            out.r.ready := true.B
            in.r.valid := false.B
            in.ar.ready := false.B
            out.ar.valid := false.B
            state := Mux(out.r.fire && out.r.bits.last, idle, fakeRes)
          }
        }
      }
    }
  }
}

object AXI4Shaper {
  def apply()(implicit p: Parameters): AXI4Node = {
    val axi4shaper = LazyModule(new AXI4Shaper())
    axi4shaper.node
  }
}
