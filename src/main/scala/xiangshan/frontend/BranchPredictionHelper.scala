package xiangshan.frontend

import chisel3._
import chisel3.util._

import xiangshan._
import chipsalliance.rocketchip.config.Parameters

class BranchPredictionHelper(implicit p: Parameters) extends BlackBox{
  val PredictWidth = 16
  val io = IO(new Bundle {
    val rIdx = Input(UInt(64.W))
    val target = Output(UInt((64*PredictWidth).W))
    val pc = Output(UInt((64*PredictWidth).W))
    val taken = Output(UInt(PredictWidth.W))
  })
}