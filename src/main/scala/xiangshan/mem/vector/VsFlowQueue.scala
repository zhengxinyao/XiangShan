
package xiangshan.mem

import chipsalliance.rocketchip.config.Parameters
import chisel3._
import chisel3.util._
import utils._
import utility._
import xiangshan._

class VsFlowPtr(implicit p: Parameters) extends CircularQueuePtr[VsFlowPtr](
  p => p(XSCoreParamsKey).VsFlowSize
){
}

object VsFlowPtr {
  def apply(f: Bool, v: UInt)(implicit p: Parameters): VsFlowPtr = {
    val ptr = Wire(new VsFlowPtr)
    ptr.flag := f
    ptr.value := v
    ptr
  }
}

object VSRegOffset {
  def apply (instType: UInt, flowIdx: UInt, eew: UInt, sew: UInt):UInt = {
    (LookupTree(instType,List(
    "b000".U -> (flowIdx << eew(1,0)).asUInt, // unit-stride, do not use
    "b010".U -> (flowIdx << eew(1,0)).asUInt, // strided
    "b001".U -> (flowIdx << sew(1,0)).asUInt, // indexed-unordered
    "b011".U -> (flowIdx << sew(1,0)).asUInt, // indexed-ordered
    "b100".U -> (flowIdx << eew(1,0)).asUInt, // segment unit-stride
    "b110".U -> (flowIdx << eew(1,0)).asUInt, // segment strided
    "b101".U -> (flowIdx << sew(1,0)).asUInt, // segment indexed-unordered
    "b111".U -> (flowIdx << sew(1,0)).asUInt // segment indexed-ordered
    )))}
}

/**
  * (1) unit-stride instructions access to memory continously, so calculate the address by adding 16 directly (flow_inner_idx << 4.U)
  * (2) stride instructions: flow_inner_idx means the current number of UOP memory accesses,
  *     inner_Idx << Log2Num(GenRealFlowNum(instType,emul,eew,sew)) means the number of all previous UOP memory accesses
  * (3) index instructions: According to flow_ inner_idx obtains immediate value from index, than Calculate address
  * (4) segment instructions: To calculate the address, segment instructions need calculate segEmulIdx and segNfIdx;
  * */
object GenVSAddr {
  def apply (instType: UInt, baseaddr: UInt, emul:UInt, inner_Idx:UInt, flow_inner_idx: UInt, stride: UInt,
             index: UInt, eew: UInt, sew: UInt, nf:UInt, segNfIdx: UInt, segEmulIdx: UInt): UInt = {
    (LookupTree(instType,List(
      "b000".U -> (baseaddr + ((flow_inner_idx + (inner_Idx << Log2Num(GenRealFlowNum(instType,emul,eew,sew))).asUInt) << eew(1,0)).asUInt).asUInt,// unit-stride
      "b010".U -> (baseaddr + stride * (flow_inner_idx + (inner_Idx << Log2Num(GenRealFlowNum(instType,emul,eew,sew))).asUInt)),// strided
      "b001".U -> (baseaddr +
        IndexAddr(index= index, flow_inner_idx = (flow_inner_idx + (inner_Idx << Log2Num(GenRealFlowNum(instType,emul,eew,sew))).asUInt).asUInt, eew = eew)), // indexed-unordered
      "b011".U -> (baseaddr +
        IndexAddr(index= index, flow_inner_idx = (flow_inner_idx + (inner_Idx << Log2Num(GenRealFlowNum(instType,emul,eew,sew))).asUInt).asUInt, eew = eew)), // indexed-ordered
      "b100".U -> (baseaddr +
        (((flow_inner_idx + (segEmulIdx << Log2Num(GenRealFlowNum(instType,emul,eew,sew))).asUInt).asUInt * nf) << eew(1,0)).asUInt +
        (segNfIdx << eew(1,0)).asUInt),// segment unit-stride
      "b110".U -> (baseaddr +
        (flow_inner_idx + (segEmulIdx << Log2Num(GenRealFlowNum(instType,emul,eew,sew))).asUInt).asUInt * stride +
        (segNfIdx << eew(1,0)).asUInt), // segment strided
      "b101".U -> (baseaddr +
        IndexAddr(index= index, flow_inner_idx = (flow_inner_idx + (segEmulIdx << Log2Num(GenRealFlowNum(instType,emul,eew,sew))).asUInt).asUInt, eew = eew) +
        (segNfIdx << sew(1,0)).asUInt), // segment indexed-unordered
      "b111".U -> (baseaddr +
        IndexAddr(index= index, flow_inner_idx = (flow_inner_idx + (segEmulIdx << Log2Num(GenRealFlowNum(instType,emul,eew,sew))).asUInt).asUInt, eew = eew) +
        (segNfIdx << sew(1,0)).asUInt)  // segment indexed-ordered
    )))}
}

object GenVSMask {
  def apply(reg_offset: UInt, offset: UInt, mask: UInt):UInt = {
    val vMask = Wire(UInt(16.W))
    when (offset <= reg_offset) {
      vMask := mask >> (reg_offset - offset)
    }.otherwise {
      vMask := mask << (offset - reg_offset)
    }
    vMask
  }
}

object GenVSData {
    def apply(reg_offset: UInt, offset: UInt, data: UInt):UInt = {
      val vData = Wire(UInt(128.W))
      when (offset <= reg_offset) {
        vData := data >> ((reg_offset - offset) << 3.U)
      }.otherwise {
        vData := data << ((offset - reg_offset) << 3.U)
      }
      vData
    }
}

class VecFlowEntry(implicit p: Parameters) extends ExuInput(isVpu = true) {
  val mask                = UInt((VLEN/8).W)
  val uop_unit_stride_fof = Bool()
  val alignedType         = UInt(2.W)
  val reg_offset          = UInt(4.W)

  def apply = {
    this.mask := 0.U((VLEN/8).W)
  }
}

class VecPipeBundle(implicit p: Parameters) extends ExuInput(isVpu = true) {
  val mask                = UInt((VLEN/8).W)
  val uop_unit_stride_fof = Bool()
  val alignedType         = UInt(2.W)
}

class VsFlowBundle(implicit p: Parameters) extends XSBundle {
  val uopIn        = Vec(VecStorePipelineWidth,Flipped(Decoupled(new Uop2Flow())))
  val storePipeOut = Vec(VecStorePipelineWidth,Decoupled(new VecPipeBundle()))
  //val isFirstIssue = Vec(VecStorePipelineWidth,Bool())
}

class VsFlowQueue(implicit p: Parameters) extends XSModule with HasCircularQueuePtrHelper
{
  val io = IO(new VsFlowBundle())

  val valid     = RegInit(VecInit(Seq.fill(VecStorePipelineWidth)(VecInit(Seq.fill(VsFlowSize)(false.B)))))
  val flowEntry = Reg(Vec(VecStorePipelineWidth,Vec(VsFlowSize,new VecFlowEntry)))

  val realFlowNum     = Wire(Vec(VecStorePipelineWidth, UInt(5.W)))
  val eew             = Wire(Vec(VecStorePipelineWidth, UInt(3.W)))
  val sew             = Wire(Vec(VecStorePipelineWidth, UInt(3.W)))
  val emul            = Wire(Vec(VecStorePipelineWidth, UInt(3.W)))
  val instType        = Wire(Vec(VecStorePipelineWidth, UInt(3.W)))
  val uop_segment_num = Wire(Vec(VecStorePipelineWidth,UInt(4.W)))
  val stride          = Wire(Vec(VecStorePipelineWidth, UInt(XLEN.W)))
  val index           = Wire(Vec(VecStorePipelineWidth, UInt(VLEN.W)))
  val baseaddr        = Wire(Vec(VecStorePipelineWidth, UInt(VAddrBits.W)))
  val segNfIdx        = Wire(Vec(VecStorePipelineWidth, UInt(3.W)))
  val segEmulIdx      = Wire(Vec(VecStorePipelineWidth, UInt(3.W)))


  val enqPtr = RegInit(VecInit(Seq.fill(VecStorePipelineWidth)(0.U.asTypeOf(new VsFlowPtr))))
  val deqPtr = RegInit(VecInit(Seq.fill(VecStorePipelineWidth)(0.U.asTypeOf(new VsFlowPtr))))

  for (i <- 0 until VecStorePipelineWidth) {
    io.uopIn(i).ready := PopCount(valid(i)) <= 16.U
  }

/**
  * enqPtr updata*/
  for (i <- 0 until VecStorePipelineWidth) {
    when (io.uopIn(i).fire) {
      enqPtr(i).value := enqPtr(i).value + realFlowNum(i)
    }
  }

/**
  * deqPtr updata*/
  for (i <- 0 until VecStorePipelineWidth) {
    when (io.storePipeOut(i).fire) {
      deqPtr(i).value := deqPtr(i).value + 1.U
      valid(i)(deqPtr(i).value) := false.B
      flowEntry(i)(deqPtr(i).value).mask := 0.U
    }
  }

  for (i <- 0 until VecStorePipelineWidth) {
    eew(i)             := io.uopIn(i).bits.eew
    sew(i)             := io.uopIn(i).bits.uop.ctrl.vconfig.vtype.vsew
    emul(i)            := io.uopIn(i).bits.emul
    instType(i)        := io.uopIn(i).bits.instType
    uop_segment_num(i) := io.uopIn(i).bits.uop_segment_num + 1.U
    realFlowNum(i)     := GenRealFlowNum(instType=instType(i), emul=emul(i), eew=eew(i), sew=sew(i))
    stride(i)          := io.uopIn(i).bits.src(1)
    index(i)           := io.uopIn(i).bits.src(1)
    baseaddr(i)        := io.uopIn(i).bits.src(0)
    segEmulIdx(i)      := GenSegEmulIdx(emul = emul(i), inner_Idx = io.uopIn(i).bits.uop.ctrl.uopIdx)
    segNfIdx(i)        := GenSegNfIdx(emul = emul(i),inner_Idx = io.uopIn(i).bits.uop.ctrl.uopIdx)
  }

  //enqueue
  for (i <- 0 until VecStorePipelineWidth) {
    when (io.uopIn(i).fire) {
      for (j <- 0 until 16) {
        when (j.U < realFlowNum(i)) {
          val enqValue = Wire(UInt(5.W))
          enqValue := enqPtr(i).value + j.U
          flowEntry(i)(enqValue) := DontCare
          valid(i)(enqValue) := true.B
          flowEntry(i)(enqValue).mask := io.uopIn(i).bits.mask << VSRegOffset(instType=instType(i), flowIdx=j.U, eew=eew(i), sew=sew(i))
          flowEntry(i)(enqValue).uop_unit_stride_fof := io.uopIn(i).bits.uop_unit_stride_fof
          flowEntry(i)(enqValue).alignedType := Mux(instType(i)(1,0) === "b00".U || instType(i)(1,0) === "b10".U,eew(i)(1,0),sew(i)(1,0))
          flowEntry(i)(enqValue).src(0) := GenVSAddr(instType=instType(i), baseaddr=baseaddr(i), emul=emul(i),
                                                    inner_Idx=io.uopIn(i).bits.uop.ctrl.uopIdx, flow_inner_idx=j.U,
                                                    stride=stride(i), index=index(i), eew=eew(i), sew=sew(i),
                                                    nf=uop_segment_num(i), segNfIdx=segNfIdx(i), segEmulIdx=segEmulIdx(i))
          flowEntry(i)(enqValue).src(2) := io.uopIn(i).bits.src(2)
          flowEntry(i)(enqValue).reg_offset := VSRegOffset(instType=instType(i), flowIdx=j.U, eew=eew(i), sew=sew(i))
          flowEntry(i)(enqValue).uop := io.uopIn(i).bits.uop
        }
      }
    }
  }

  for (i <- 0 until VecStorePipelineWidth) {
    io.storePipeOut(i).valid := valid(i)(deqPtr(i).value)
    io.storePipeOut(i).bits := DontCare
  }

  for (i <- 0 until VecStorePipelineWidth) {
    io.storePipeOut(i).bits.mask := GenVSMask(reg_offset = flowEntry(i)(deqPtr(i).value).reg_offset,
                                              offset = flowEntry(i)(deqPtr(i).value).src(0)(3,0),
                                              mask = flowEntry(i)(deqPtr(i).value).mask)
    io.storePipeOut(i).bits.src(2) := GenVSData(reg_offset = flowEntry(i)(deqPtr(i).value).reg_offset,
                                                offset = flowEntry(i)(deqPtr(i).value).src(0)(3,0),
                                                data = flowEntry(i)(deqPtr(i).value).src(2))
    io.storePipeOut(i).bits.src(0) := flowEntry(i)(deqPtr(i).value).src(0)
    io.storePipeOut(i).bits.uop_unit_stride_fof := flowEntry(i)(deqPtr(i).value).uop_unit_stride_fof
    io.storePipeOut(i).bits.alignedType := flowEntry(i)(deqPtr(i).value).alignedType
    io.storePipeOut(i).bits.uop := flowEntry(i)(deqPtr(i).value).uop
    //io.isFirstIssue(i) := true.B
  }

}
