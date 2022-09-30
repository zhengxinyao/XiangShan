package pftest

import chipsalliance.rocketchip.config.Parameters
import chisel3._
import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}
import huancun.prefetch.BestOffsetPrefetch
import top.DefaultConfig
import xiangshan.{XSCoreParameters, XSCoreParamsKey}
import xiangshan.mem.prefetch._

class TestWrapper(prefetcher: String = "sms")(implicit p: Parameters) extends BasePrefecher {

  val pf = prefetcher match {
    case "sms" =>
      val mod = Module(new SMSPrefetcher())
      mod.io <> io
      mod.io_agt_en := true.B
      mod.io_pht_en := true.B
      mod.io_act_stride := 20.U
      mod.io_act_threshold := 12.U
      mod
    case _ => assert(cond = false, "unknown prefetcher name")
  }

}

object TestWrapper extends App {
  override def main(args: Array[String]) = {
    val config = (new DefaultConfig()).alterPartial({
      case XSCoreParamsKey => XSCoreParameters()
    })
    (new ChiselStage).execute(args, Seq(
      ChiselGeneratorAnnotation(() => new TestWrapper()(config))
    ))
  }
}
