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

class VlflowPtr(implicit p: Parameters) extends CircularQueuePtr[VlflowPtr](
  p => p(XSCoreParamsKey).VlFlowSize
){
}

object VlflowPtr {
  def apply(f: Bool, v: UInt)(implicit p: Parameters): VlflowPtr = {
    val ptr = Wire(new VlflowPtr)
    ptr.flag := f
    ptr.value := v
    ptr
  }
}
/*
object EmulDataMask {
  def apply (emul: UInt, offset: UInt): UInt = {
    (LookupTree(emul,List(
      "b101".U -> ((UIntToOH(2.U ) - 1.U) << offset).asUInt, // 1/8
      "b110".U -> ((UIntToOH(4.U ) - 1.U) << offset).asUInt, // 1/4
      "b111".U -> ((UIntToOH(8.U ) - 1.U) << offset).asUInt, // 1/2
      "b000".U -> ( UIntToOH(16.U) - 1.U           ),        // 1
      "b001".U -> ( UIntToOH(16.U) - 1.U           ),        // 2
      "b010".U -> ( UIntToOH(16.U) - 1.U           ),        // 4
      "b011".U -> ( UIntToOH(16.U) - 1.U           )         // 8
    )))}
}*/
/**
 * when emul is greater than or equal to 1, this means the entire register needs to be written;
 * otherwise, only write the specified number of bytes */
object EmulDataSize {
  def apply (emul: UInt): UInt = {
    (LookupTree(emul,List(
      "b101".U -> 2.U  , // 1/8
      "b110".U -> 4.U  , // 1/4
      "b111".U -> 8.U  , // 1/2
      "b000".U -> 16.U , // 1
      "b001".U -> 16.U , // 2
      "b010".U -> 16.U , // 4
      "b011".U -> 16.U   // 8
    )))}
}

//index inst read data byte
object SewDataSize {
  def apply (sew: UInt): UInt = {
    (LookupTree(sew,List(
      "b000".U -> 1.U , // 1
      "b001".U -> 2.U , // 2
      "b010".U -> 4.U , // 4
      "b011".U -> 8.U   // 8
    )))}
}

// strided inst read data byte
object EewDataSize {
  def apply (eew: UInt): UInt = {
    (LookupTree(eew,List(
      "b000".U -> 1.U , // 1
      "b101".U -> 2.U , // 2
      "b110".U -> 4.U , // 4
      "b111".U -> 8.U   // 8
    )))}
}

object dataSize {
  def apply (instType: UInt, emul: UInt, eew: UInt, sew: UInt): UInt = {
    (LookupTree(instType,List(
      "b000".U ->  EmulDataSize(emul), // unit-stride, do not use
      "b010".U ->  EewDataSize(eew)  , // strided
      "b001".U ->  SewDataSize(sew)  , // indexed-unordered
      "b011".U ->  SewDataSize(sew)  , // indexed-ordered
      "b100".U ->  EewDataSize(eew)  , // segment unit-stride
      "b110".U ->  EewDataSize(eew)  , // segment strided
      "b101".U ->  SewDataSize(sew)  , // segment indexed-unordered
      "b111".U ->  SewDataSize(sew)    // segment indexed-ordered
    )))}
}

object GenVecMask {
  def apply (instType: UInt, emul: UInt, eew: UInt, sew: UInt): UInt = {
    val mask = Wire(UInt(16.W))
    mask := UIntToOH(dataSize(instType = instType, emul = emul, eew = eew, sew = sew)) - 1.U
    mask
  }
}

/**
 * these are used to obtain immediate addresses for  index instruction */
object EewEq8 {
  def apply(index:UInt, flow_inner_idx: UInt): UInt = {
    (LookupTree(flow_inner_idx,List(
      0.U  -> index(7 ,0   ),
      1.U  -> index(15,8   ),
      2.U  -> index(23,16  ),
      3.U  -> index(31,24  ),
      4.U  -> index(39,32  ),
      5.U  -> index(47,40  ),
      6.U  -> index(55,48  ),
      7.U  -> index(63,56  ),
      8.U  -> index(71,64  ),
      9.U  -> index(79,72  ),
      10.U -> index(87,80  ),
      11.U -> index(95,88  ),
      12.U -> index(103,96 ),
      13.U -> index(111,104),
      14.U -> index(119,112),
      15.U -> index(127,120)
    )))}
}

object EewEq16 {
  def apply(index: UInt, flow_inner_idx: UInt): UInt = {
    (LookupTree(flow_inner_idx, List(
      0.U -> index(15, 0),
      1.U -> index(31, 16),
      2.U -> index(47, 32),
      3.U -> index(63, 48),
      4.U -> index(79, 64),
      5.U -> index(95, 80),
      6.U -> index(111, 96),
      7.U -> index(127, 112)
    )))}
}

object EewEq32 {
  def apply(index: UInt, flow_inner_idx: UInt): UInt = {
    (LookupTree(flow_inner_idx, List(
      0.U -> index(31, 0),
      1.U -> index(63, 32),
      2.U -> index(95, 64),
      3.U -> index(127, 96)
    )))}
}

object EewEq64 {
  def apply (index: UInt, flow_inner_idx: UInt): UInt = {
    (LookupTree(flow_inner_idx, List(
      0.U -> index(63, 0),
      1.U -> index(127, 64)
    )))}
}

object IndexAddr {
  def apply (index: UInt, flow_inner_idx: UInt, eew: UInt): UInt = {
    (LookupTree(eew,List(
      "b000".U -> EewEq8 (index = index, flow_inner_idx = flow_inner_idx ), // Imm is 1 Byte // TODO: If need to allocate all at once, need to modify this
      "b101".U -> EewEq16(index = index, flow_inner_idx = flow_inner_idx ), // Imm is 2 Byte
      "b110".U -> EewEq32(index = index, flow_inner_idx = flow_inner_idx ), // Imm is 4 Byte
      "b111".U -> EewEq64(index = index, flow_inner_idx = flow_inner_idx )  // Imm is 8 Byte
    )))}
}
/**
 * unit-stride instructions don't use this method;
 * other instructions generate realFlowNum by EmulDataSize >> eew(1,0),
 * EmulDataSize means the number of bytes that need to be written to the register,
 * eew(1,0) means the number of bytes written at once*/
object GenRealFlowNum {
  def apply (instType: UInt, emul: UInt, eew: UInt, sew: UInt): UInt = {
    (LookupTree(instType,List(
      "b000".U ->  0.U                               , // unit-stride, do not use
      "b010".U ->  (EmulDataSize(emul) >> eew(1,0)).asUInt, // strided
      "b001".U ->  (EmulDataSize(emul) >> sew(1,0)).asUInt, // indexed-unordered
      "b011".U ->  (EmulDataSize(emul) >> sew(1,0)).asUInt, // indexed-ordered
      "b100".U ->  (EmulDataSize(emul) >> eew(1,0)).asUInt, // segment unit-stride
      "b110".U ->  (EmulDataSize(emul) >> eew(1,0)).asUInt, // segment strided
      "b101".U ->  (EmulDataSize(emul) >> sew(1,0)).asUInt, // segment indexed-unordered
      "b111".U ->  (EmulDataSize(emul) >> sew(1,0)).asUInt  // segment indexed-ordered
    )))}
}

object Log2Num {
  def apply (num: UInt): UInt = {
    (LookupTree(num,List(
      16.U -> 4.U,
      8.U  -> 3.U,
      4.U  -> 2.U,
      2.U  -> 1.U,
      1.U  -> 0.U
    )))}
}
/**
 * when emul is less than or equal to 1, the nf is equal to uop_inner_idx;
 * when emul is equal to 2, the nf is equal to uop_inner_idx(2,1), and so on*/
object GenSegNfIdx {
  def apply (emul: UInt, inner_Idx: UInt):UInt = {
    (LookupTree(emul,List(
      "b101".U -> inner_Idx     ,
      "b110".U -> inner_Idx     ,
      "b111".U -> inner_Idx     ,
      "b000".U -> inner_Idx     ,
      "b001".U -> inner_Idx(2,1),
      "b010".U -> inner_Idx(2)  ,
      "b011".U -> 0.U
    )))}
}
/**
 * when emul is less than or equal to 1, only one segEmulIdx, so the segEmulIdx is 0.U;
 * when emul is equal to 2, the segEmulIdx is equal to inner_Idx(0), and so on*/
object GenSegEmulIdx {
  def apply (emul: UInt, inner_Idx: UInt): UInt = {
    (LookupTree(emul,List(
      "b101".U -> 0.U           ,
      "b110".U -> 0.U           ,
      "b111".U -> 0.U           ,
      "b000".U -> 0.U           ,
      "b001".U -> inner_Idx(0)  ,
      "b010".U -> inner_Idx(1,0),
      "b011".U -> inner_Idx(2,0)
    )))}
}
/**
 * (1) unit-stride instructions access to memory continously, so calculate the address by adding 16 directly (flow_inner_idx << 4.U)
 * (2) stride instructions: flow_inner_idx means the current number of UOP memory accesses,
 *     inner_Idx << Log2Num(GenRealFlowNum(instType,emul,eew,sew)) means the number of all previous UOP memory accesses
 * (3) index instructions: According to flow_ inner_idx obtains immediate value from index, than Calculate address
 * (4) segment instructions: To calculate the address, segment instructions need calculate segEmulIdx and segNfIdx;
 * */
object GenVecAddr {
  def apply (instType: UInt, baseaddr: UInt, emul:UInt, inner_Idx:UInt, flow_inner_idx: UInt, stride: UInt,
             index: UInt, eew: UInt, sew: UInt, nf:UInt, segNfIdx: UInt, segEmulIdx: UInt): UInt = {
    (LookupTree(instType,List(
      "b000".U -> (baseaddr + flow_inner_idx << 4.U).asUInt,// unit-stride
      "b010".U -> (baseaddr + stride * (flow_inner_idx + inner_Idx << Log2Num(GenRealFlowNum(instType,emul,eew,sew)))),// strided
      "b001".U -> (baseaddr +
                    IndexAddr(index= index, flow_inner_idx = (flow_inner_idx + inner_Idx << Log2Num(GenRealFlowNum(instType,emul,eew,sew))).asUInt, eew = eew)), // indexed-unordered
      "b011".U -> (baseaddr +
                    IndexAddr(index= index, flow_inner_idx = (flow_inner_idx + inner_Idx << Log2Num(GenRealFlowNum(instType,emul,eew,sew))).asUInt, eew = eew)), // indexed-ordered
      "b100".U -> (baseaddr +
                    (((flow_inner_idx + segEmulIdx << Log2Num(GenRealFlowNum(instType,emul,eew,sew))).asUInt * nf) << eew(1,0)).asUInt +
                    (segNfIdx << eew(1,0)).asUInt),// segment unit-stride
      "b110".U -> (baseaddr +
                    (flow_inner_idx + segEmulIdx << Log2Num(GenRealFlowNum(instType,emul,eew,sew))).asUInt * stride +
                    (segNfIdx << eew(1,0)).asUInt), // segment strided
      "b101".U -> (baseaddr +
                    IndexAddr(index= index, flow_inner_idx = (flow_inner_idx + segEmulIdx << Log2Num(GenRealFlowNum(instType,emul,eew,sew))).asUInt, eew = eew) +
                    (segNfIdx << sew(1,0)).asUInt), // segment indexed-unordered
      "b111".U -> (baseaddr +
                    IndexAddr(index= index, flow_inner_idx = (flow_inner_idx + segEmulIdx << Log2Num(GenRealFlowNum(instType,emul,eew,sew))).asUInt, eew = eew) +
                    (segNfIdx << sew(1,0)).asUInt)  // segment indexed-ordered
    )))}
}
/*
object GenRobIdx {
  def apply (instType: UInt, robIdx:UInt, startRobIdx: UInt, flow_inner_idx: UInt): UInt = {
    (LookupTree(instType,List(
      "b000".U ->  (startRobIdx + flow_inner_idx),// unit-stride, do not use
      "b010".U ->  (robIdx), // strided
      "b001".U ->  (robIdx), // indexed-unordered
      "b011".U ->  (robIdx), // indexed-ordered
      "b100".U ->  (robIdx), // segment unit-stride
      "b110".U ->  (robIdx), // segment strided
      "b101".U ->  (robIdx), // segment indexed-unordered
      "b111".U ->  (robIdx)  // segment indexed-ordered
    )))}
}*/

object GenRegOffset0 {
  def apply (instType: UInt, flow_inner_idx: UInt, eew: UInt, sew: UInt): UInt = {
    (LookupTree(instType,List(
      "b000".U ->  0.U                           , // unit-stride
      "b010".U ->  (flow_inner_idx << eew).asUInt, // strided
      "b001".U ->  (flow_inner_idx << sew).asUInt, // indexed-unordered
      "b011".U ->  (flow_inner_idx << sew).asUInt, // indexed-ordered
      "b100".U ->  (flow_inner_idx << eew).asUInt, // segment unit-stride
      "b110".U ->  (flow_inner_idx << eew).asUInt, // segment strided
      "b101".U ->  (flow_inner_idx << sew).asUInt, // segment indexed-unordered
      "b111".U ->  (flow_inner_idx << sew).asUInt  // segment indexed-ordered
    )))}
}

class VecLoadPipelineBundle(implicit p: Parameters) extends XSBundleWithMicroOp{
  val vaddr               = UInt(VAddrBits.W)
  val mask                = UInt((VLEN/8).W)
  val uop_unit_stride_fof = Bool()
  val rob_idx_valid       = Vec(2,Bool())
  val rob_idx             = Vec(2,UInt(log2Up(RobSize).W))
  val inner_idx           = Vec(2,UInt(3.W))
  val reg_offset          = Vec(2,UInt(4.W))
  val offset              = Vec(2,UInt(4.W))
}

class VlflowQueueIOBundle(implicit p: Parameters) extends XSBundle {
  val loadRegIn   = Vec(2, Flipped(Decoupled(new VecOperand())))
  val eew         = Vec(2, Input(UInt(3.W)))
  val sew         = Vec(2, Input(UInt(3.W)))
  val emul        = Vec(2, Input(UInt(3.W)))
  val instType    = Vec(2, Input(UInt(3.W)))
  val uop_unit_stride_fof = Vec(2, Input(Bool()))
  val uop_segment_num = Vec(2, Input(UInt(3.W)))
  val loadPipeOut = Vec(LoadPipelineWidth, Decoupled(new VecLoadPipelineBundle))
}

class VlflowBundle(implicit p: Parameters) extends XSBundle {
  val uop               = new MicroOp
  val vaddr             = UInt(VAddrBits.W)
  val mask              = UInt((VLEN/8).W)
  val unit_stride_fof   = Bool()
  val rob_idx_valid     = Vec(2,Bool())
  val rob_idx           = Vec(2,UInt(log2Up(RobSize).W))
  val inner_idx         = Vec(2,UInt(3.W))
  val reg_offset        = Vec(2,UInt(4.W)) //Which element to write
  val offset            = Vec(2,UInt(4.W))
}

class VlflowQueue(implicit p: Parameters) extends XSModule with HasCircularQueuePtrHelper
{
  val io = IO(new VlflowQueueIOBundle())
  println("LoadFlowQueue: size:" + VlFlowSize)

  dontTouch(io.loadRegIn)
  // TODO: merge these to an FlowQueue Entry?
  val flow_entry       = RegInit(VecInit(Seq.fill(2)(VecInit(Seq.fill(VlFlowSize)(0.U.asTypeOf(new VlflowBundle))))))
  val flow_entry_valid = RegInit(VecInit(Seq.fill(2)(VecInit(Seq.fill(VlFlowSize)(false.B)))))

  val needAlloc       = Wire(Vec(VecLoadPipelineWidth, Bool()))
  val baseAddr        = Wire(Vec(VecLoadPipelineWidth, UInt(VAddrBits.W)))
  val dataWidth       = Wire(Vec(VecLoadPipelineWidth, UInt(8.W))) // only unit-stride use
  val vend            = Wire(Vec(VecLoadPipelineWidth,UInt(8.W)))
  val realFlowNum     = Wire(Vec(VecLoadPipelineWidth, UInt(4.W)))

  //val loadInstDec = Wire(Vec(VecLoadPipelineWidth,new VecDecode()))
  val cross128    = Wire(Vec(VecLoadPipelineWidth, Bool()))
  //val startRobIdx = Wire(Vec(VecLoadPipelineWidth,UInt(log2Ceil(RobSize).W)))
  //val isSegment   = Wire(Vec(VecLoadPipelineWidth, Bool()))
  val instType    = Wire(Vec(VecLoadPipelineWidth, UInt(3.W)))
  val stride      = Wire(Vec(VecLoadPipelineWidth, UInt(XLEN.W)))
  val index       = Wire(Vec(VecLoadPipelineWidth, UInt(VLEN.W)))
  val eew         = Wire(Vec(VecLoadPipelineWidth, UInt(3.W)))
  val sew         = Wire(Vec(VecLoadPipelineWidth, UInt(3.W)))
  //val lmul        = Wire(Vec(VecLoadPipelineWidth, UInt(3.W)))
  val emul        = Wire(Vec(VecLoadPipelineWidth, UInt(3.W)))
  val segEmulIdx  = Wire(Vec(VecLoadPipelineWidth, UInt(3.W)))
  val segNfIdx    = Wire(Vec(VecLoadPipelineWidth, UInt(3.W)))


  val validCount   = Wire(Vec(VecLoadPipelineWidth, UInt(4.W)))
  val allowEnqueue = Wire(Vec(VecLoadPipelineWidth, Bool()))

  val enqPtr = RegInit(VecInit(Seq.fill(VecLoadPipelineWidth)(0.U.asTypeOf(new VlflowPtr))))
  val deqPtr = RegInit(VecInit(Seq.fill(VecLoadPipelineWidth)(0.U.asTypeOf(new VlflowPtr))))

  for(i <- 0 until VecLoadPipelineWidth) {
    when (needAlloc(i)) {
      enqPtr(i).value := enqPtr(i).value + realFlowNum(i)
    }
  }

  for(i <- 0 until VecLoadPipelineWidth) {
    validCount(i) := PopCount(flow_entry_valid(i))
    allowEnqueue(i) := validCount(i) <= 16.U
    io.loadRegIn(i).ready := allowEnqueue(i)
  }

  val sameInst = io.loadRegIn(0).fire && io.loadRegIn(1).fire && instType(0) === "b000".U && instType(1) === "b000".U
                  (io.loadRegIn(0).bits.uop.robIdx.value === io.loadRegIn(1).bits.uop.robIdx.value)

  for (i <- 0 until VecLoadPipelineWidth) {
    when (instType(i) === "b000".U) {// unit-stride Inst
      when (sameInst) {
        when (i.U === 0.U) {
          needAlloc(i)  := !(0 until 2).map(j => (0 until VlFlowSize).map(entry =>
            flow_entry(j)(entry).rob_idx(0) === io.loadRegIn(i).bits.uop.robIdx.value &&
            flow_entry(j)(entry).inner_idx(0) === io.loadRegIn(i).bits.inner_idx  &&
            flow_entry(j)(entry).rob_idx_valid(0)).reduce(_||_)).reduce(_||_) && io.loadRegIn(i).fire
        }.otherwise {
          needAlloc(i) := false.B
        }
      }.otherwise {
        needAlloc(i)  := !(0 until 2).map(j => (0 until VlFlowSize).map(entry =>
          flow_entry(j)(entry).rob_idx(0) === io.loadRegIn(i).bits.uop.robIdx.value &&
            flow_entry(j)(entry).inner_idx(0) === io.loadRegIn(i).bits.inner_idx  &&
            flow_entry(j)(entry).rob_idx_valid(0)).reduce(_||_)).reduce(_||_) && io.loadRegIn(i).fire
      }
    }.otherwise {
      needAlloc(i)  := io.loadRegIn(i).fire
    }
  }

  for (i <- 0 until VecLoadPipelineWidth) {
    //loadInstDec(i).apply(io.loadRegIn(i).bits.uop.cf.instr)
    stride(i)          := io.loadRegIn(i).bits.stride
    index(i)           := io.loadRegIn(i).bits.index
    eew(i)             := io.eew(i)
    sew(i)             := io.sew(i)
    //lmul(i)            := io.loadRegIn(i).bits.lmul
    emul(i)            := io.emul(i)
    //isSegment(i)       := loadInstDec(i).uop_segment_num =/= "b000".U && !loadInstDec(i).uop_unit_stride_whole_reg
    instType(i)        := io.instType(i)
    baseAddr(i)        := io.loadRegIn(i).bits.baseaddr
    dataWidth(i)       := io.loadRegIn(i).bits.vl << eew(i)(1,0)// only unit-stride use
    vend(i)            := baseAddr(i)(3,0) + dataWidth(i)
    segEmulIdx(i)      := GenSegEmulIdx(emul = emul(i), inner_Idx = io.loadRegIn(i).bits.inner_idx)
    segNfIdx(i)        := GenSegNfIdx(emul = emul(i),inner_Idx = io.loadRegIn(i).bits.inner_idx)
  }

  for (i <- 0 until VecLoadPipelineWidth) {
    when (instType(i) === "b000".U) { // unit-stride Inst
      realFlowNum(i)  := vend(i)(7,4) + (vend(i)(3,0) =/= 0.U).asUInt//TODO:************
      cross128(i)     := baseAddr(i)(3, 0) =/= 0.U(4.W)
    }.otherwise {
      realFlowNum(i)  := GenRealFlowNum(instType = instType(i), emul = emul(i), eew = eew(i), sew = sew(i))
      cross128(i)     := false.B
    }
  }

  /**
   * Update flowQueue status bits
   * instType(i) === "b000".U means only unit-stride instructions use this logic*/
  for (i <- 0 until VecLoadPipelineWidth) {
    //startRobIdx(i) := DontCare
    when(needAlloc(i)) {
      //startRobIdx(i) := io.loadRegIn(i).bits.uop.robIdx.value - io.loadRegIn(i).bits.inner_idx
      for (j <- 0 until 16) {
        when(j.U < realFlowNum(i)) {
          val queueIdx = Wire(UInt(5.W))
          val vaddr = Wire(UInt(VAddrBits.W))
          queueIdx := enqPtr(i).value + j.U
          flow_entry(i)(queueIdx) := DontCare
          flow_entry_valid(i)(queueIdx) := true.B
          flow_entry(i)(queueIdx).uop := io.loadRegIn(i).bits.uop
          flow_entry(i)(queueIdx).unit_stride_fof := io.uop_unit_stride_fof(i)
          vaddr := GenVecAddr(instType = instType(i), baseaddr = baseAddr(i), emul = emul(i), inner_Idx = io.loadRegIn(i).bits.inner_idx,
                              flow_inner_idx = j.U, stride = stride(i), index = index(i), eew = eew(i), sew = sew(i),
                              nf = io.uop_segment_num(i) + 1.U, segNfIdx = segNfIdx(i), segEmulIdx = segEmulIdx(i))
          flow_entry(i)(queueIdx).mask := GenVecMask(instType = instType(i), emul = emul(i), eew = eew(i), sew = sew(i))
          flow_entry(i)(queueIdx).vaddr := vaddr

          when(realFlowNum(i) === 1.U && instType(i) === "b000".U) {
            flow_entry(i)(queueIdx).rob_idx_valid(0) := true.B
            //flow_entry(i)(queueIdx).rob_idx(0) := GenRobIdx(instType = instType(i), robIdx = io.loadRegIn(i).bits.uop.robIdx.value,
            //  startRobIdx = startRobIdx(i), flow_inner_idx = j.U)
            flow_entry(i)(queueIdx).rob_idx(0)    := io.loadRegIn(i).bits.uop.robIdx.value
            flow_entry(i)(queueIdx).inner_idx(0)  := Mux(instType(i) === "b000".U,j.U,io.loadRegIn(i).bits.inner_idx)
            flow_entry(i)(queueIdx).offset(0)     := vaddr(3, 0)
            flow_entry(i)(queueIdx).reg_offset(0) := GenRegOffset0(instType = instType(i), flow_inner_idx = j.U, eew = eew(i), sew = sew(i))
          }.otherwise {
            when(j.U =/= realFlowNum(i) - 1.U) {
              flow_entry(i)(queueIdx).rob_idx_valid(0) := true.B
              //flow_entry(i)(queueIdx).rob_idx(0) := GenRobIdx(instType = instType(i), robIdx = io.loadRegIn(i).bits.uop.robIdx.value,
              //  startRobIdx = startRobIdx(i), flow_inner_idx = j.U)
              flow_entry(i)(queueIdx).rob_idx(0) := io.loadRegIn(i).bits.uop.robIdx.value
              flow_entry(i)(queueIdx).inner_idx(0)  := Mux(instType(i) === "b000".U,j.U,io.loadRegIn(i).bits.inner_idx)
              flow_entry(i)(queueIdx).offset(0) := vaddr(3, 0)
              flow_entry(i)(queueIdx).reg_offset(0) := GenRegOffset0(instType = instType(i), flow_inner_idx = j.U, eew = eew(i), sew = sew(i))
            }.elsewhen(j.U === realFlowNum(i) - 1.U && !cross128(i)) {
              flow_entry(i)(queueIdx).rob_idx_valid(0) := true.B
              //flow_entry(i)(queueIdx).rob_idx(0) := GenRobIdx(instType = instType(i), robIdx = io.loadRegIn(i).bits.uop.robIdx.value,
              //  startRobIdx = startRobIdx(i), flow_inner_idx = j.U)
              flow_entry(i)(queueIdx).rob_idx(0) := io.loadRegIn(i).bits.uop.robIdx.value
              flow_entry(i)(queueIdx).inner_idx(0)  := Mux(instType(i) === "b000".U,j.U,io.loadRegIn(i).bits.inner_idx)
              flow_entry(i)(queueIdx).offset(0) := vaddr(3, 0)
              flow_entry(i)(queueIdx).reg_offset(0) := GenRegOffset0(instType = instType(i), flow_inner_idx = j.U, eew = eew(i), sew = sew(i))
            }.elsewhen(j.U === realFlowNum(i) - 1.U && cross128(i)) {
              flow_entry(i)(queueIdx).rob_idx_valid(0) := false.B
            }

            when (j.U =/= 0.U && instType(i) === "b000".U) {
              flow_entry(i)(queueIdx).rob_idx_valid(1) := cross128(i)
              flow_entry(i)(queueIdx).rob_idx(1)       := io.loadRegIn(i).bits.uop.robIdx.value
              flow_entry(i)(queueIdx).inner_idx(1)     := j.U - cross128(i).asUInt
              flow_entry(i)(queueIdx).offset(1)        := 0.U
              flow_entry(i)(queueIdx).reg_offset(1)    := 16.U - vaddr(3, 0)
            }.elsewhen(j.U === 0.U) {
              flow_entry(i)(queueIdx).rob_idx_valid(1) := false.B
            }
          }
        }
      }
    }
  }


  // flow deqPtr
  for (i <- 0 until LoadPipelineWidth) {
    // TODO: Need to do some changes
    //  1. DontCare?
    //  2. Other information?
    io.loadPipeOut(i).bits := DontCare
    io.loadPipeOut(i).valid := false.B
    when (flow_entry_valid(i)(deqPtr(i).value)){
      io.loadPipeOut(i).valid                    := true.B
      io.loadPipeOut(i).bits.uop_unit_stride_fof := flow_entry(i)(deqPtr(i).value).unit_stride_fof
      io.loadPipeOut(i).bits.vaddr               := flow_entry(i)(deqPtr(i).value).vaddr
      io.loadPipeOut(i).bits.mask                := flow_entry(i)(deqPtr(i).value).mask
      io.loadPipeOut(i).bits.rob_idx_valid       := flow_entry(i)(deqPtr(i).value).rob_idx_valid
      io.loadPipeOut(i).bits.rob_idx             := flow_entry(i)(deqPtr(i).value).rob_idx
      io.loadPipeOut(i).bits.inner_idx           := flow_entry(i)(deqPtr(i).value).inner_idx
      io.loadPipeOut(i).bits.offset              := flow_entry(i)(deqPtr(i).value).offset
      io.loadPipeOut(i).bits.reg_offset          := flow_entry(i)(deqPtr(i).value).reg_offset
      io.loadPipeOut(i).bits.uop.lqIdx           := flow_entry(i)(deqPtr(i).value).uop.lqIdx
    }
  }

  for (i <- 0 until LoadPipelineWidth) {
    when (io.loadPipeOut(i).fire) {
      flow_entry_valid(i)(deqPtr(i).value) := false.B
      flow_entry(i)(deqPtr(i).value).mask := 0.U
      flow_entry(i)(deqPtr(i).value).rob_idx_valid := VecInit(Seq.fill(2)(false.B))
      deqPtr(i) := deqPtr(i) + 1.U
    }
  }

}
