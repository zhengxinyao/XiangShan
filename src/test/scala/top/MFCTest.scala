package top

import chisel3._
import chisel3.util._

class MFCTest(aLen: Int = 16, w: Int = 2) extends Module {
  val io = IO(new Bundle() {
    val valids = Input(Vec(aLen, Bool()))
    val index = Input(UInt(log2Up(aLen).W))
    val out = Output(Vec(aLen, Bool()))
  })

  val entries = Reg(Vec(aLen, UInt(w.W)))

  for ((v, i) <- io.valids.zipWithIndex) {
    when(v) {
      entries(io.index) := 1.U
    }.otherwise({
      entries(io.index) := 2.U
    })
  }

  io.out := entries

}

object MFCTest extends App {
  override def main(args: Array[String]): Unit = {
    val (_, firrtlOpts, firrtlComplier) = ArgParser.parse(args)
    Generator.execute(firrtlOpts, new MFCTest, firrtlComplier)
  }

}
