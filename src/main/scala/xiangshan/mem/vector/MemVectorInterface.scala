/***************************************************************************************
* Copyright (c) 2020-2021 Institute of Computing Technology, Chinese Academy of Sciences
* Copyright (c) 2020-2021 Peng Cheng Laboratory
*
* XiangShan is licensed under Mulan PSL v2.
* You can use this software according to the terms and conditions of the Mulan PSL v2.
* You may obtain a copy of Mulan PSL v2 at:
*          http://license.coscl.org.cn/MulanPSL2
*
* THIS SOFTWARE IS PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OF ANY KIND,
* EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO NON-INFRINGEMENT,
* MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
*
* See the Mulan PSL v2 for more details.
***************************************************************************************/

package xiangshan.mem

import chipsalliance.rocketchip.config.Parameters
import chisel3._
import chisel3.util._
import utils._
import utility._
import xiangshan._
import xiangshan.cache._

class VlsqPtr(implicit p: Parameters) extends CircularQueuePtr[VlsqPtr](
  p => p(XSCoreParamsKey).VlsQueueSize
){
}

object VlsqPtr {
  def apply(f: Bool, v: UInt)(implicit p: Parameters): VlsqPtr = {
    val ptr = Wire(new VlsqPtr)
    ptr.flag := f
    ptr.value := v
    ptr
  }
}

// Intblock to VLSU IO
class Int2VLSUIO(implicit p: Parameters) extends XSBundle {
  // base addr and stride from int block
  val in = Vec(LoadPipelineWidth, Decoupled(new ExuInput)) // base addr and stride from int block
  // For now, load RS only support 1 src operand,
  // therefore only VL* unit-stride inst is supported
}

// Vecblock to VLSU IO
class Vec2VLSUIO(implicit p: Parameters) extends XSBundle {
  // mask, address offsets, store data from vec block
  val in = Vec(VecMemSrcInWidth, Decoupled(new VecMemOperand)) 
}

// VLSU to Vecblock IO
class VLSU2VecIO(implicit p: Parameters) extends XSBundle {
  val out = Vec(LoadPipelineWidth, Decoupled(new VecLoadResult))
}

// VLSU to Intblock IO
class VLSU2IntIO(implicit p: Parameters) extends XSBundle {
  // commit vector load and store
  // data field in ExuOutput is not used here
  val out = Vec(VecMemInstWbWidth, Decoupled(new ExuOutput))
}

// VLSU to Ctrlblock IO
class VLSU2CtrlIO(implicit p: Parameters) extends XSBundle {
  // provide vlsqidx for ctrl block
  val enq = new VlsqEnqIO
}

// Vector specualtive CSR input
class VecMemConfig(implicit p: Parameters) extends XSBundle {
  val lmul = UInt(3.W)
  val sew = UInt(2.W)
}

// Vector load/store source operand input
class VecMemOperand(implicit p: Parameters) extends XSBundleWithMicroOp {
  val vmask = UInt(VLEN.W)
  val baseaddr = UInt(VAddrBits.W) // base address from rs1
  val stride = UInt(XLEN.W) // stride from rs2
  val index = UInt(VLEN.W) // index from vs2
  val data = UInt(VLEN.W) // store data from vs3
  val avd = UInt(5.W) // architectural vector register destinaton
  // CHANGEME: update physical vector register destination width
  val pvd = UInt(8.W) // physical vector register destinaton
  val vlsqidx = new VlsqPtr
  val segidx = new UInt(VLSSegIdxBits.W)
  val config = new VecMemConfig
}

// Vector load/store ctrl info
class VecMemCtrl(implicit p: Parameters) extends XSBundle {
  val vm = Bool()
  val vwidth = UInt(3.W) // width field in inst
  val mew = Bool()
  val mop = UInt(2.W)
  val nf = UInt(2.W)
  val xumop = UInt(5.W) // lumop or sumop
  val vma = Bool()
  val vta = Bool()
  
  def Inst2VecMemCtrl(inst: UInt): VecMemCtrl = {
    val ctrl = Wire(new VecMemCtrl)
    ctrl.nf := inst(31, 29)
    ctrl.mew := inst(28)
    ctrl.mop := inst(27, 26)
    ctrl.vm := inst(25)
    ctrl.xumop := inst(24, 20)
    ctrl.vwidth := inst(14, 12)
    ctrl.vma := inst(7)
    ctrl.vta := inst(6)
    ctrl
  }
  
  def fromInst(inst: UInt) = {
    nf := inst(31, 29)
    mew := inst(28)
    mop := inst(27, 26)
    vm := inst(25)
    xumop := inst(24, 20)
    vwidth := inst(14, 12)
    vma := inst(7)
    vta := inst(6)
  }
}

// Vector Load/Store Decode Buffer Input Req
class BaseVecDecodeEnqReq (implicit p: Parameters) extends VecMemOperand

class VecLoadDecodeEnqReq (implicit p: Parameters) extends BaseVecDecodeEnqReq {
}

class VecStoreDecodeEnqReq (implicit p: Parameters) extends BaseVecDecodeEnqReq {
}

// Extended micro-op for vector load/store
class VecMicroOp(implicit p: Parameters) extends MicroOp {
  val vecmemCtrl = new VecMemCtrl
}

// Vector load result
class VecLoadResult(implicit p: Parameters) extends XSBundle {
  val data = UInt(128.W) // hardcoded for now
  val debug = new DebugBundle
}

// Vector load store queue enqueue IO
class VlsqEnqIO(implicit p: Parameters) extends XSBundle {
  val canAccept = Output(Bool())
  val needAlloc = Vec(exuParameters.LsExuCnt, Input(Bool()))
  val req = Vec(VecMemDispatchWidth, Flipped(ValidIO(new VecMicroOp)))
  val resp = Vec(VecMemDispatchWidth, Output(new VlsqPtr))
}

class BaseVectorLsq(implicit p: Parameters) extends XSModule {
  val io = IO(new Bundle() {
    // val int2vlsu = Flipped(new Int2VLSUIO)
    val vec2vlsu = Flipped(new Vec2VLSUIO)
    val vlsu2vec = new VLSU2VecIO
    val vlsu2int = new VLSU2IntIO
    val vlsu2ctrl = new VLSU2CtrlIO
  })

}

// Vector load/store flow queue enq IO
class VlsfqEnqIO(implicit p: Parameters) extends XSBundle {
  val rawOperand = new VecMemOperand
  val vaddr = UInt(VAddrBits.W)
  val bytemask = UInt((CacheLineSize/8).W)
  val uopidx = UInt(4.W)
}

class VectorLSFlowQueue(implicit p: Parameters) extends XSModule {
  val io = IO(new Bundle() {
    val in = Vec(VecMemSrcInWidth, Flipped(Decoupled(new VlsfqEnqIO)))
  })
}