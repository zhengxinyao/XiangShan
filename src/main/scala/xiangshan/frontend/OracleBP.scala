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

package xiangshan.frontend
import chisel3._
import chisel3.util._
import chipsalliance.rocketchip.config.Parameters
import xiangshan._
import chisel3.util.ImplicitConversions.booleanToBool
import Chisel.BlackBox

trait OracleBPParams extends HasXSParameter with HasBPUParameter {
  // By default, enable OracleBranch but disable right branch target
  // Note that OracleBranch and OracleIndirect should NOT be set false

  val OracleBranch = true
  val rightTarget = true
  val OracleBranchTarget = if (!OracleBranch) false else rightTarget
  val OracleIndirect = true
  val rightIndirectTarget = true
  val OracleIndirectTarget = if (!OracleIndirect) false else rightIndirectTarget
  val type_br = 0
  val type_jr = 1
}

trait OracleBPPredictWidth {
  val OraclePredictWidth = 16
}

class OracleBPMeta(implicit p: Parameters) extends XSBundle with OracleBPParams {
  val brIdx = UInt(64.W)
}

class BranchPredictionHelper(implicit p: Parameters) extends BlackBox {
  val OraclePredictWidth = 16 // at most 16 rvc i.e. 8 rvi aka 32 bytes
  val io = IO(new Bundle {
    val rIdx = Input(UInt(64.W))
    val target = Output(UInt((64*OraclePredictWidth).W))
    val pc = Output(UInt((64*OraclePredictWidth).W))
    val taken = Output(UInt(OraclePredictWidth.W))
    val brtype = Output(UInt(OraclePredictWidth.W))
    val redirectIdx = Input(UInt(64.W))
    val redirectpc = Output(UInt((64*16).W))
  })
}

class OracleBP(implicit p: Parameters) extends BasePredictor with OracleBPParams with OracleBPPredictWidth {
  /*
  * todo:
  *  1. handle mispred update in this module
  *  2. deal with different trace configs in cpp part
  *  3. deal with command lines
  * */
  override val meta_size = 0.U.asTypeOf(new OracleBPMeta).getWidth
  val bphelper = Module(new BranchPredictionHelper()).io
  val brIdx = RegInit(0.U(64.W))
  bphelper.rIdx := brIdx
  val takens = VecInit((0 until OraclePredictWidth).map(i => bphelper.taken(i)))
  val pcs = VecInit((0 until OraclePredictWidth).map(i => bphelper.pc((i+1)*64-1, i*64)))
  val targets = VecInit((0 until OraclePredictWidth).map(i => bphelper.target((i+1)*64-1, i*64)))
  val types = VecInit((0 until OraclePredictWidth).map(i => bphelper.brtype(i)))

  val s2_ftb_entry = io.in.bits.resp_in(0).s2.ftb_entry

  val pc_hit_br_slot = VecInit((0 until OraclePredictWidth).map(i => pcs(i) === s2_pc + s2_ftb_entry.brSlots(0).offset * 2.U))
  val pc_hit_jr_slot = VecInit((0 until OraclePredictWidth).map(i => pcs(i) === s2_pc + s2_ftb_entry.tailSlot.offset * 2.U))

  val pc_hit_br = pc_hit_br_slot.asUInt().orR()
  val pc_hit_jr = pc_hit_jr_slot.asUInt().orR()

  val pc_hit_br_pos = PriorityEncoder(pc_hit_br_slot) + 1.U
  val pc_hit_jr_pos = PriorityEncoder(pc_hit_jr_slot) + 1.U

  val currentBrCnt = Wire(UInt(64.W))
  when (pc_hit_br && takens(pc_hit_br_pos - 1.U)) {
    // use hit info from jr slot
    currentBrCnt := pc_hit_br_pos
  } .elsewhen (pc_hit_jr) {
    // use hit info from br slot
    currentBrCnt := pc_hit_jr_pos
  } .elsewhen (pc_hit_br) {
    // even if not taken, br should still be stepped over
    currentBrCnt := pc_hit_br_pos
  } .otherwise {
    // no hit for this slot
    currentBrCnt := 0.U
  }


  
  when (io.redirect.valid) {
    bphelper.redirectIdx := io.redirect.bits.cfiUpdate.brIdx
  } .otherwise {
    bphelper.redirectIdx := 0.U
  }
  val redirectpcs = VecInit((0 until 16).map(i => bphelper.redirectpc((i+1)*64-1, i*64)))
  val redirectpchit = VecInit((0 until 15).map(i => 
      redirectpcs(i) === io.redirect.bits.cfiUpdate.pc || (redirectpcs(i) < io.redirect.bits.cfiUpdate.pc && redirectpcs(i+1) > io.redirect.bits.cfiUpdate.pc)
      ))
  // at most 16 pcs
  val redirectAdder = Wire(UInt(5.W))

  val redirectpchitAddr = PriorityEncoder(redirectpchit)

  redirectAdder := redirectpchitAddr + 1.U

  if (OracleBranch) {
    for (i <- 0 until numBr) {
      io.out.resp.s3.preds.br_taken_mask(i) := RegEnable(io.out.resp.s2.preds.br_taken_mask(i), io.s2_fire)
      io.out.resp.s3.preds.targets(i) := RegEnable(io.out.resp.s2.preds.targets(i), io.s2_fire)
    }
  }
  if (OracleIndirect) {
    io.out.resp.s3.preds.targets.last := RegEnable(io.out.resp.s2.preds.targets.last, io.s2_fire)
  }

  io.out.resp.s3.brIdx := RegEnable(io.out.resp.s2.brIdx, io.s2_fire)
  io.out.resp.s2.brIdx := brIdx

  val reach_mem = RegInit(0.B)

  when (io.s2_fire && reach_mem) {
    brIdx := brIdx + currentBrCnt
  }


  when (s2_pc === 0x80000000L.U) {
    reach_mem := 1.B
  }

  when (io.redirect.valid && io.redirect.bits.cfiUpdate.isMisPred && reach_mem) {
    brIdx := io.redirect.bits.cfiUpdate.brIdx + redirectAdder
  }

  if (OracleBranch) {
    for (i <- 0 until numBr) {
      io.out.resp.s2.preds.br_taken_mask(i) := 0.U
    }
    when (pc_hit_br) {
      io.out.resp.s2.preds.br_taken_mask(0) := takens(pc_hit_br_pos - 1.U)
      if (OracleBranchTarget) {
        io.out.resp.s2.preds.targets(0) := targets(pc_hit_br_pos - 1.U)
      }
    }
  }
  when (pc_hit_jr) {
    if (OracleBranch)
      io.out.resp.s2.preds.br_taken_mask(1) := takens(pc_hit_jr_pos - 1.U) && !types(pc_hit_jr_pos - 1.U)
    if (OracleIndirect && OracleIndirectTarget) {
      when (types(pc_hit_jr_pos - 1.U)) {
        io.out.resp.s2.preds.targets(1) := targets(pc_hit_jr_pos - 1.U)
      }
    }
    if (OracleBranch && OracleBranchTarget) {
      when (!types(pc_hit_jr_pos - 1.U)) {
        io.out.resp.s2.preds.targets(1) := targets(pc_hit_jr_pos - 1.U)
      }
    }
  }

  val resp_meta = WireInit(0.U.asTypeOf(new OracleBPMeta))

  resp_meta.brIdx := brIdx
  io.out.s3_meta := RegEnable(RegEnable(resp_meta.asUInt, io.s1_fire), io.s2_fire)

}
