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
import chisel3.{util, _}
import chisel3.util._
import utils._
import utility._
import xiangshan._

class VluopPtr(implicit p: Parameters) extends CircularQueuePtr[VluopPtr](
  p => p(XSCoreParamsKey).VlUopSize
){
}

object VluopPtr {
  def apply(f: Bool, v: UInt)(implicit p: Parameters): VluopPtr = {
    val ptr = Wire(new VluopPtr)
    ptr.flag := f
    ptr.value := v
    ptr
  }
}
/**
 * *////////////
class VluopBundle(implicit p: Parameters) extends XSBundle {
  val inner_idx = UInt(3.W)
  val rob_idx   = UInt(log2Ceil(RobSize).W)
  val wb_dest   = UInt(PhyRegIdxWidth.W)//TODO:vector PhyReg
  val emul      = UInt(3.W)
  val dataVMask = Vec(VLEN/8,Bool())
  val data      = Vec(VLEN/8,UInt(8.W))

  def apply(uop: VecOperand, emul: UInt, is_pre: Bool = false.B, is_allo: Bool = false.B) = {
    when (is_pre) {
      this.inner_idx := uop.inner_idx
      this.rob_idx := uop.uop.robIdx.value
      this.emul    := emul
    }.elsewhen (is_allo) {
      this.wb_dest := uop.uop.pdest  // TODO: this is scalar reg,we need vector reg
    }.otherwise {
      this.inner_idx := uop.inner_idx
      this.rob_idx := uop.uop.robIdx.value
      this.wb_dest := uop.uop.pdest
      this.emul    := emul
    }
    this
  }
}

class VluopQueueIOBundle(implicit p: Parameters) extends XSBundle {
  val loadRegIn   = Vec(VecLoadPipelineWidth, Flipped(Decoupled(new VecOperand())))
  val instType    = Vec(VecLoadPipelineWidth, Input(UInt(3.W)))
  val emul        = Vec(VecLoadPipelineWidth, Input(UInt(3.W)))
  val loadPipeIn  = Vec(VecLoadPipelineWidth, Flipped(Decoupled(new VecExuOutput)))
  val vecFeedback = Vec(2,Output(Bool()))
  val vecLoadWriteback = Vec(2,DecoupledIO(new ExuOutput(true.B)))
  //val vecData = Vec(2,DecoupledIO(UInt(VLEN.W)))
}

class VluopQueue(implicit p: Parameters) extends XSModule with HasCircularQueuePtrHelper
{
  val io = IO(new VluopQueueIOBundle())

  println("LoadUopQueue: size:" + VlUopSize)

  val VluopEntry = Reg(Vec(VlUopSize, new VluopBundle))
  val Vluop2robEntry = Reg(Vec(VlUopSize, new ExuOutput))
  // For example, an inst -> 4 uops,
  // When first uop comes, 4 entries are all valid and pre_allocated
  val valid = RegInit(VecInit(Seq.fill(VlUopSize)(false.B)))
  val pre_allocated = RegInit(VecInit(Seq.fill(VlUopSize)(false.B)))
  // When an uop really comes, an entry will be allocated
  val allocated = RegInit(VecInit(Seq.fill(VlUopSize)(false.B)))
  // When both data and pdest are readym, this entry is finished
  val finished = RegInit(VecInit(Seq.fill(VlUopSize)(false.B)))

  val enqPtr = RegInit(0.U.asTypeOf(new VluopPtr))
  val deqPtr = RegInit(0.U.asTypeOf(new VluopPtr))
  val already_in = WireInit(VecInit(Seq.fill(VecLoadPipelineWidth)(false.B)))
  val enq_valid = WireInit(VecInit(Seq.fill(VecLoadPipelineWidth)(false.B)))
  val instType = Wire(Vec(VecLoadPipelineWidth, UInt(3.W)))

  //First-level buffer
  val buffer_valid_s0  = RegInit(VecInit(Seq.fill(VecLoadPipelineWidth)(false.B)))
  val data_buffer_s0   = RegInit(VecInit(Seq.fill(VecLoadPipelineWidth)(0.U(VLEN.W))))
  val mask_buffer_s0   = RegInit(VecInit(Seq.fill(VecLoadPipelineWidth)(VecInit(Seq.fill(2)(0.U((VLEN/8).W))))))
  val rob_idx_valid_s0 = RegInit(VecInit(Seq.fill(VecLoadPipelineWidth)(VecInit(Seq.fill(2)(false.B)))))
  val inner_idx_s0     = RegInit(VecInit(Seq.fill(VecLoadPipelineWidth)(VecInit(Seq.fill(2)(UInt(3.W))))))
  val rob_idx_s0       = RegInit(VecInit(Seq.fill(VecLoadPipelineWidth)(VecInit(Seq.fill(2)(0.U(log2Ceil(RobSize).W))))))
  val reg_offset_s0    = RegInit(VecInit(Seq.fill(VecLoadPipelineWidth)(VecInit(Seq.fill(2)(0.U(4.W))))))
  val offset_s0        = RegInit(VecInit(Seq.fill(VecLoadPipelineWidth)(VecInit(Seq.fill(2)(0.U(4.W))))))
  val uop_s0           = RegInit(VecInit(Seq.fill(VecLoadPipelineWidth)(0.U.asTypeOf(new MicroOp))))
  //Second-level buffer
  val buffer_valid_s1  = RegInit(VecInit(Seq.fill(VecLoadPipelineWidth)(VecInit(Seq.fill(2)(false.B)))))
  val data_buffer_s1   = RegInit(VecInit(Seq.fill(VecLoadPipelineWidth)(VecInit(Seq.fill(2)(0.U(VLEN.W))))))
  val mask_buffer_s1   = RegInit(VecInit(Seq.fill(VecLoadPipelineWidth)(VecInit(Seq.fill(2)(0.U((VLEN/8).W))))))
  val rob_idx_valid_s1 = RegInit(VecInit(Seq.fill(VecLoadPipelineWidth)(VecInit(Seq.fill(2)(false.B)))))
  val inner_idx_s1     = RegInit(VecInit(Seq.fill(VecLoadPipelineWidth)(VecInit(Seq.fill(2)(UInt(3.W))))))
  val rob_idx_s1       = RegInit(VecInit(Seq.fill(VecLoadPipelineWidth)(VecInit(Seq.fill(2)(0.U(log2Ceil(RobSize).W))))))
  val uop_s1           = RegInit(VecInit(Seq.fill(VecLoadPipelineWidth)(0.U.asTypeOf(new MicroOp))))
/**
 * Only unit-stride instructions use vecFeedback;
 * PopCount(valid) >= 24.U, Only pre_allocated uop can enqueue*/
  for (i <- 0 until VecLoadPipelineWidth) {
    io.vecFeedback(i) := already_in(i)
    //io.loadRegIn(i).ready := true.B // TODO: should always ready? or count valid_entry?????
    io.loadRegIn(i).ready := PopCount(valid) < 24.U
    io.loadPipeIn(i).ready := true.B
  }

  for (i <- 0 until VecLoadPipelineWidth) {
    already_in(i) := Cat((0 until VlUopSize).map(j => VluopEntry(j).rob_idx === io.loadRegIn(i).bits.uop.robIdx.value &&
                                                      VluopEntry(j).inner_idx === io.loadRegIn(i).bits.inner_idx &&
                                                      io.loadRegIn(i).valid && pre_allocated(j))).orR
    enq_valid(i)  := io.loadRegIn(i).fire && !already_in(i)
    instType(i)   := io.instType(i)
  }

  // TODO: How to simplify these codes?
  //  And timing...?
  dontTouch(io.loadRegIn)
  when (enq_valid(0) && enq_valid(1)) {
    when (instType(0) === "b000".U && instType(1) === "b000".U ) {
      when (io.loadRegIn(0).bits.uop.robIdx.value === io.loadRegIn(1).bits.uop.robIdx.value) {
        enqPtr.value := enqPtr.value + io.loadRegIn(0).bits.total_num + 1.U
        for (i <- 0 until 8) {
          when (i.U <= io.loadRegIn(0).bits.total_num) {
            val inUop = WireInit(io.loadRegIn(0).bits)
            val isPer = !(i.U === io.loadRegIn(0).bits.inner_idx || i.U === io.loadRegIn(1).bits.inner_idx)
            //inUop.uop.robIdx.value := io.loadRegIn(0).bits.uop.robIdx.value - io.loadRegIn(0).bits.inner_idx + i.U
            inUop.inner_idx := i.U
            VluopEntry(enqPtr.value + i.U).apply(uop = inUop, emul = io.emul(0), is_pre = isPer)
            valid(enqPtr.value + i.U) := true.B
            pre_allocated(enqPtr.value + i.U) := true.B
            when (i.U === io.loadRegIn(0).bits.inner_idx || i.U === io.loadRegIn(1).bits.inner_idx) {
              allocated(enqPtr.value + i.U) := true.B
            }
          }
        }
      }.otherwise {
        enqPtr.value := enqPtr.value + io.loadRegIn(0).bits.total_num + io.loadRegIn(1).bits.total_num + 2.U
        for (i <- 0 until 8) {
          when (i.U <= io.loadRegIn(0).bits.total_num) {
            val inUop = WireInit(io.loadRegIn(0).bits)
            val isPer = !(i.U === io.loadRegIn(0).bits.inner_idx)
            //inUop.uop.robIdx.value := io.loadRegIn(0).bits.uop.robIdx.value - io.loadRegIn(0).bits.inner_idx + i.U
            inUop.inner_idx := i.U
            VluopEntry(enqPtr.value + i.U).apply(uop = inUop, emul = io.emul(0), is_pre = isPer)
            valid(enqPtr.value + i.U) := true.B
            pre_allocated(enqPtr.value + i.U) := true.B
            when (i.U === io.loadRegIn(0).bits.inner_idx) {
              allocated(enqPtr.value + i.U) := true.B
            }
            //printf(p"***************************************\n")
            //printf(p"totalNum = ${io.loadRegIn(0).bits.total_num}\n")
            //printf(p"robIdx = ${io.loadRegIn(0).bits.uop.robIdx.value}, innerIdx = ${io.loadRegIn(0).bits.inner_idx}, i = ${i.U}, res = ${inUop.uop.robIdx.value}\n")
            //printf(p"ptr = ${enqPtr.value + i.U}\n")
          }
        }
        for (i <- 0 until 8) {
          when (i.U <= io.loadRegIn(1).bits.total_num) {
            val inUop = WireInit(io.loadRegIn(1).bits)
            val isPer = !(i.U === io.loadRegIn(1).bits.inner_idx)
            //inUop.uop.robIdx.value := io.loadRegIn(1).bits.uop.robIdx.value - io.loadRegIn(1).bits.inner_idx + i.U
            inUop.inner_idx := i.U
            VluopEntry(enqPtr.value + io.loadRegIn(0).bits.total_num + 1.U + i.U).apply(uop = inUop, emul = io.emul(1), is_pre = isPer)
            valid(enqPtr.value + io.loadRegIn(0).bits.total_num + 1.U + i.U) := true.B
            pre_allocated(enqPtr.value + io.loadRegIn(0).bits.total_num + 1.U + i.U) := true.B
            when (i.U === io.loadRegIn(1).bits.inner_idx) {
              allocated(enqPtr.value + io.loadRegIn(0).bits.total_num + 1.U + i.U) := true.B
            }
            //printf(p"++++++++++++++++++++++++++++\n")
            //printf(p"totalNum = ${io.loadRegIn(1).bits.total_num}\n")
            //printf(p"robIdx = ${io.loadRegIn(1).bits.uop.robIdx.value}, innerIdx = ${io.loadRegIn(1).bits.inner_idx}, i = ${i.U}, res = ${inUop.uop.robIdx.value}\n")
            //printf(p"ptr = ${enqPtr.value + io.loadRegIn(0).bits.total_num + i.U}\n")
          }
        }
      }
    }.elsewhen (instType(0) === "b000".U && instType(1) =/= "b000".U ) {
      enqPtr.value := enqPtr.value + io.loadRegIn(0).bits.total_num + 2.U
      for (i <- 0 until 8) {
        when (i.U <= io.loadRegIn(0).bits.total_num) {
          val inUop = WireInit(io.loadRegIn(0).bits)
          val isPer = !(i.U === io.loadRegIn(0).bits.inner_idx)
          //inUop.uop.robIdx.value := io.loadRegIn(0).bits.uop.robIdx.value - io.loadRegIn(0).bits.inner_idx + i.U
          inUop.inner_idx := i.U
          VluopEntry(enqPtr.value + i.U).apply(uop = inUop, emul = io.emul(0), is_pre = isPer)
          valid(enqPtr.value + i.U) := true.B
          pre_allocated(enqPtr.value + i.U) := true.B
          when (i.U === io.loadRegIn(0).bits.inner_idx) {
            allocated(enqPtr.value + i.U) := true.B
          }
        }
      }
      VluopEntry   (enqPtr.value + io.loadRegIn(0).bits.total_num + 1.U).apply(uop = io.loadRegIn(1).bits, emul = io.emul(1))
      valid        (enqPtr.value + io.loadRegIn(0).bits.total_num + 1.U) := true.B
      pre_allocated(enqPtr.value + io.loadRegIn(0).bits.total_num + 1.U) := true.B
      allocated    (enqPtr.value + io.loadRegIn(0).bits.total_num + 1.U) := true.B

    }.elsewhen (instType(0) =/= "b000".U && instType(1) === "b000".U ) {
      enqPtr.value := enqPtr.value + io.loadRegIn(1).bits.total_num + 2.U
      for (i <- 0 until 8) {
        when (i.U <= io.loadRegIn(1).bits.total_num) {
          val inUop = WireInit(io.loadRegIn(1).bits)
          val isPer = !(i.U === io.loadRegIn(1).bits.inner_idx)
          //inUop.uop.robIdx.value := io.loadRegIn(0).bits.uop.robIdx.value - io.loadRegIn(0).bits.inner_idx + i.U
          inUop.inner_idx := i.U
          VluopEntry(enqPtr.value + i.U).apply(uop = inUop, emul = io.emul(1), is_pre = isPer)
          valid(enqPtr.value + i.U) := true.B
          pre_allocated(enqPtr.value + i.U) := true.B
          when (i.U === io.loadRegIn(1).bits.inner_idx) {
            allocated(enqPtr.value + i.U) := true.B
          }
        }
      }
      VluopEntry   (enqPtr.value + io.loadRegIn(1).bits.total_num + 1.U).apply(uop = io.loadRegIn(0).bits, emul = io.emul(0))
      valid        (enqPtr.value + io.loadRegIn(1).bits.total_num + 1.U) := true.B
      pre_allocated(enqPtr.value + io.loadRegIn(1).bits.total_num + 1.U) := true.B
      allocated    (enqPtr.value + io.loadRegIn(1).bits.total_num + 1.U) := true.B
    }.otherwise {
      enqPtr.value := enqPtr.value + 2.U
      for (i <- 0 until 2) {
        VluopEntry   (enqPtr.value + i.U).apply(uop = io.loadRegIn(i).bits,emul = io.emul(i))
        valid        (enqPtr.value + i.U) := true.B
        pre_allocated(enqPtr.value + i.U) := true.B
        allocated    (enqPtr.value + i.U) := true.B
      }
    }
  }.elsewhen (enq_valid(0) && !enq_valid(1)) {
    when (instType(0) === "b000".U) {
      enqPtr.value := enqPtr.value + io.loadRegIn(0).bits.total_num + 1.U
      for (i <- 0 until 8) {
        when (i.U <= io.loadRegIn(0).bits.total_num) {
          val inUop = WireInit(io.loadRegIn(0).bits)
          val isPer = !(i.U === io.loadRegIn(0).bits.inner_idx)
          //inUop.uop.robIdx.value := io.loadRegIn(0).bits.uop.robIdx.value - io.loadRegIn(0).bits.inner_idx + i.U
          inUop.inner_idx := i.U
          VluopEntry(enqPtr.value + i.U).apply(uop = inUop, emul = io.emul(0), is_pre = isPer)
          valid(enqPtr.value + i.U) := true.B
          pre_allocated(enqPtr.value + i.U) := true.B
          when (i.U === io.loadRegIn(0).bits.inner_idx) {
            allocated(enqPtr.value + i.U) := true.B
          }
        }
      }
    }.otherwise {
      enqPtr.value := enqPtr.value + 1.U
      VluopEntry   (enqPtr.value).apply(uop = io.loadRegIn(0).bits, emul = io.emul(0))
      valid        (enqPtr.value) := true.B
      pre_allocated(enqPtr.value) := true.B
      allocated    (enqPtr.value) := true.B
    }
  }.elsewhen (!enq_valid(0) && enq_valid(1)) {
    when (instType(1) === "b000".U) {
      enqPtr.value := enqPtr.value + io.loadRegIn(1).bits.total_num + 1.U
      for (i <- 0 until 8) {
        when (i.U <= io.loadRegIn(1).bits.total_num) {
          val inUop = WireInit(io.loadRegIn(1).bits)
          val isPer = !(i.U === io.loadRegIn(1).bits.inner_idx)
          //inUop.uop.robIdx.value := io.loadRegIn(0).bits.uop.robIdx.value - io.loadRegIn(0).bits.inner_idx + i.U
          inUop.inner_idx := i.U
          VluopEntry(enqPtr.value + i.U).apply(uop = inUop, emul = io.emul(1), is_pre = isPer)
          valid(enqPtr.value + i.U) := true.B
          pre_allocated(enqPtr.value + i.U) := true.B
          when (i.U === io.loadRegIn(1).bits.inner_idx) {
            allocated(enqPtr.value + i.U) := true.B
          }
        }
      }
    }.otherwise {
      enqPtr.value := enqPtr.value + 1.U
      VluopEntry   (enqPtr.value).apply(uop = io.loadRegIn(1).bits, emul = io.emul(1))
      valid        (enqPtr.value) := true.B
      pre_allocated(enqPtr.value) := true.B
      allocated    (enqPtr.value) := true.B
    }
  }.otherwise {
    enqPtr.value := enqPtr.value
  }

  for (i <- 0 until VecLoadPipelineWidth) {
    when (already_in(i)) {
      val debug_hit = WireInit(VecInit(Seq.fill(VlUopSize)(false.B))) // for debug
      for (entry <- 0 until VlUopSize) {
        when (VluopEntry(entry).rob_idx === io.loadRegIn(i).bits.uop.robIdx.value &&
              VluopEntry(entry).inner_idx === io.loadRegIn(i).bits.inner_idx &&
              valid(entry) && pre_allocated(i)) {
          VluopEntry(entry).apply(uop = io.loadRegIn(i).bits, emul = io.emul(i), is_allo = true.B)
          allocated(entry)     := true.B
          debug_hit(entry)     := true.B
        }
        assert(PopCount(debug_hit) <= 1.U, "VluopQueue Multi-Hit!")
      }
    }
  }

  for (entry <- 0 until VlUopSize) {
    when (VluopEntry(entry).emul(2) === 0.U ) {
     finished(entry) := valid(entry) && allocated(entry) && VluopEntry(entry).dataVMask.asUInt.andR
    }.elsewhen (VluopEntry(entry).emul === "b111".U) { // 1/2
      finished(entry) := valid(entry) && allocated(entry) && VluopEntry(entry).dataVMask.asUInt(7,0).andR
    }.elsewhen(VluopEntry(entry).emul === "b110".U) { // 1/4
      finished(entry) := valid(entry) && allocated(entry) && VluopEntry(entry).dataVMask.asUInt(3,0).andR
    }.elsewhen(VluopEntry(entry).emul === "b101".U) { // 1/8
      finished(entry) := valid(entry) && allocated(entry) && VluopEntry(entry).dataVMask.asUInt(1,0).andR
    }
  }

  // write data from loadpipe to first_level buffer
  for (i <- 0 until VecLoadPipelineWidth) {
    when (io.loadPipeIn(i).fire) {
      buffer_valid_s0(i)  := true.B
      data_buffer_s0(i)   := io.loadPipeIn(i).bits.vecdata
      //mask_buffer_s0(i)   := io.loadPipeIn(i).bits.mask
      inner_idx_s0(i)     := io.loadPipeIn(i).bits.inner_idx
      rob_idx_s0(i)       := io.loadPipeIn(i).bits.rob_idx
      rob_idx_valid_s0(i) := io.loadPipeIn(i).bits.rob_idx_valid
      reg_offset_s0(i)    := io.loadPipeIn(i).bits.reg_offset
      offset_s0(i)        := io.loadPipeIn(i).bits.offset
      uop_s0(i)           := io.loadPipeIn(i).bits.uop
      for (j <- 0 until 2) {
        mask_buffer_s0(i)(j) := io.loadPipeIn(i).bits.mask << io.loadPipeIn(i).bits.offset(j)
      }
      //printf{p"buffer_valid_s0 = ${data_buffer_s0(i)}"}
    }.otherwise {
      buffer_valid_s0(i)  := false.B
    }
  }
  // write data from first_level buffer to second_level buffer
  for (i <- 0 until VecLoadPipelineWidth) {
    when (buffer_valid_s0(i) === true.B) {
      buffer_valid_s1(i)  := VecInit(Seq.fill(2)(true.B))
      mask_buffer_s1(i)   := VecGenMask(rob_idx_valid = rob_idx_valid_s0(i), reg_offset = reg_offset_s0(i), offset = offset_s0(i), mask = mask_buffer_s0(i))
      data_buffer_s1(i)   := VecGenData(rob_idx_valid = rob_idx_valid_s0(i), reg_offset = reg_offset_s0(i), offset = offset_s0(i), data = data_buffer_s0(i))
      rob_idx_valid_s1(i) := rob_idx_valid_s0(i)
      inner_idx_s1(i)     := inner_idx_s0(i)
      rob_idx_s1(i)       := rob_idx_s0(i)
      uop_s1(i)           := uop_s0(i)
    }.otherwise {
      buffer_valid_s1(i)  := VecInit(Seq.fill(2)(false.B))
    }
  }

  //write data from second_level buffer to VluopEntry
  for (i <- 0 until VecLoadPipelineWidth) {
    for (j <- 0 until 2) {
      when (buffer_valid_s1(i)(j) === true.B && rob_idx_valid_s1(i)(j) === true.B) {
        for (entry <- 0 until VlUopSize) {
          when (rob_idx_s1(i)(j) === VluopEntry(entry).rob_idx && inner_idx_s1(i)(j) === VluopEntry(entry).inner_idx) {
            for (k <- 0 until VLEN/8) {
              when (mask_buffer_s1(i)(j)(k)) {
                VluopEntry(entry).data(k)      := data_buffer_s1(i)(j)(k*8 + 7,k*8)
                VluopEntry(entry).dataVMask(k) := mask_buffer_s1(i)(j)(k)
              }
            }
          }
        }
      }
    }
  }

  // writeback to regfile/rob (two ports)
  //eg: if 0-port is not fire, 1-port‘s valid signal must be invalid
  io.vecLoadWriteback(0).valid := valid(deqPtr.value) && finished(deqPtr.value)
  io.vecLoadWriteback(1).valid := io.vecLoadWriteback(0).fire && valid(deqPtr.value + 1.U) && finished(deqPtr.value + 1.U)
  for (i <- 0 until 2) {
    io.vecLoadWriteback(i).bits := DontCare
    val deq_index = deqPtr.value + i.U
    when (io.vecLoadWriteback(i).fire) {//TODO:need optimization?
      io.vecLoadWriteback(i).bits                  := Vluop2robEntry(deq_index)
      io.vecLoadWriteback(i).bits.uop.robIdx.value := VluopEntry(deq_index).rob_idx
      io.vecLoadWriteback(i).bits.data             := VluopEntry(deq_index).data.asUInt
      io.vecLoadWriteback(i).bits.uop.pdest        := VluopEntry(deq_index).wb_dest
      valid(deq_index)                             := false.B
      allocated(deq_index)                         := false.B
      pre_allocated(deq_index)                     := false.B
      finished(deq_index)                          := false.B
      VluopEntry(deq_index).dataVMask              := VecInit(Seq.fill(VLEN/8)(false.B))
    }
  }

  when(io.vecLoadWriteback(0).fire && io.vecLoadWriteback(1).fire) {
    deqPtr := deqPtr + 2.U
  }.elsewhen(io.vecLoadWriteback(0).fire) {
    deqPtr := deqPtr + 1.U
  }

}