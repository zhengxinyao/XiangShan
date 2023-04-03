package xiangshan.mem

import chipsalliance.rocketchip.config.Parameters
import chisel3.{util, _}
import chisel3.util._
import utils._
import utility._
import xiangshan._

class VsUopPtr(implicit p: Parameters) extends CircularQueuePtr[VsUopPtr](
  p => p(XSCoreParamsKey).VsUopSize
){
}

object VsUopPtr {
  def apply(f: Bool, v: UInt)(implicit p: Parameters): VsUopPtr = {
    val ptr = Wire(new VsUopPtr)
    ptr.flag := f
    ptr.value := v
    ptr
  }
}

class VsUopQueueIOBundle (implicit p: Parameters) extends XSBundle {
  val storeIn = Vec(2,Flipped(Decoupled(new VecOperand())))
  val uop2Flow = Vec(2,Decoupled(new VecOperand()))
}

class VsUopQueue(implicit p: Parameters) extends XSModule with HasCircularQueuePtrHelper
{
  val io = IO(new VsUopQueueIOBundle())

  println("StoreUopQueue: size:" + VsUopSize)

  val valid = RegInit(VecInit(Seq.fill(VsUopSize)(false.B)))
  val vsUopEntry = Reg(Vec(VsUopSize,new VecOperand()))

  val enqPtr = RegInit(0.U.asTypeOf(new VsUopPtr))
  val deqPtr = RegInit(0.U.asTypeOf(new VsUopPtr))

  for (i <- 0 until VecStorePipelineWidth) {
    io.storeIn(i).ready := PopCount(valid) < VsUopSize.U - 1.U
  }
/**
 *VsUopQueue enq */
  when (io.storeIn(0).fire && io.storeIn(1).fire) {
    enqPtr := enqPtr + 2.U
    for (i <- 0 until VecStorePipelineWidth) {
      valid(enqPtr.value + i.U) := true.B
      vsUopEntry(enqPtr.value + i.U) := io.storeIn(i).bits
    }
  }.elsewhen(io.storeIn(0).fire && !io.storeIn(1).fire || !io.storeIn(0).fire && io.storeIn(1).fire) {
    enqPtr := enqPtr + 1.U
    valid(enqPtr.value) := true.B
    vsUopEntry(enqPtr.value) := Mux(io.storeIn(0).fire,io.storeIn(0).bits,io.storeIn(1).bits)
  }.otherwise {
    enqPtr := enqPtr
  }

  /**
   *VsUopQueue to VsFlowQueue  */

  for (i <- 0 until VecStorePipelineWidth) {
    io.uop2Flow(i).valid := valid(deqPtr.value + i.U)
  }

  when (io.uop2Flow(0).fire && io.uop2Flow(1).fire) {
    for (i <- 0 until StorePipelineWidth) {
      io.uop2Flow(i).bits := vsUopEntry(deqPtr.value + i.U)
      valid(deqPtr.value + i.U) := false.B
    }
  }.elsewhen(io.uop2Flow(0).fire && !io.uop2Flow(1).fire) {
    io.uop2Flow(0).bits := vsUopEntry(deqPtr.value)
    valid(deqPtr.value) := false.B
  }.elsewhen (!io.uop2Flow(0).fire && io.uop2Flow(1).fire){
    io.uop2Flow(1).bits := vsUopEntry(deqPtr.value)
    valid(deqPtr.value) := false.B
  }

//deqPtr update
  when (io.uop2Flow(0).fire && io.uop2Flow(1).fire) {
    deqPtr := deqPtr + 2.U
  }.elsewhen(io.uop2Flow(0).fire && !io.uop2Flow(1).fire || !io.uop2Flow(0).fire && io.uop2Flow(1).fire) {
    deqPtr := deqPtr + 1.U
  }.otherwise {
    deqPtr := deqPtr
  }

}