package fu

import chisel3.stage.ChiselGeneratorAnnotation
import freechips.rocketchip.tile.XLen
import top.DefaultConfig
import xiangshan.{XSCoreParamsKey, XSTileKey}
import xiangshan.backend.fu.{AluDataModule, ArrayMulDataModule, Bku, SRT16DividerDataModule}

object FuGen extends App {

  override def main(args: Array[String]): Unit = {
    val usage =
      """
        |usage: mill -i XiangShan.test.runMain fu.FuGen <ALU|IntDiv|IntMul|BKU> [-td <target_dir>] [other chisel params]
        |""".stripMargin
    require(args.nonEmpty, usage)

    implicit val config = new DefaultConfig().alter((site, here, up) => {
      case XSCoreParamsKey => site(XSTileKey).head
    })
    val xlen = config(XLen)
    val mod = args.head match {
      case "ALU" => () => new AluDataModule()
      case "IntDiv" => () => new SRT16DividerDataModule(xlen)
      case "IntMul" => () => new ArrayMulDataModule(xlen + 1)
      case "BKU" => () => new Bku()
      case _ =>
        require(requirement = false, usage)
        null
    }
    (new chisel3.stage.ChiselStage).execute(args, Seq(
      ChiselGeneratorAnnotation(mod)
    ))
  }

}
