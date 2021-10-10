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

import chipsalliance.rocketchip.config.Parameters
import chisel3._
import chisel3.util._
import xiangshan._
import utils._
import chisel3.experimental.chiselName
import xiangshan.cache.mmu.CAMTemplate

trait HasIUMParameter extends TageParams {
  val nRows = 64
}

class IUMPtr(implicit p: Parameters) extends CircularQueuePtr[IUMPtr](
  p => p(XSCoreParamsKey).FtqSize // Use IUMSize
){
  override def cloneType = (new IUMPtr).asInstanceOf[this.type]
}

object IUMPtr {
  def apply(f: Bool, v: UInt)(implicit p: Parameters): IUMPtr = {
    val ptr = Wire(new IUMPtr)
    ptr.flag := f
    ptr.value := v
    ptr
  }
  def inverse(ptr: IUMPtr)(implicit p: Parameters): IUMPtr = {
    apply(!ptr.flag, ptr.value)
  }
}

class IUMMeta(val useIUM: Boolean)(implicit p: Parameters) extends XSBundle with HasIUMParameter { // For redirect
  // val ium_ptr = if (useIUM) new IUMPtr else UInt(0.W)
  // val ium_enq = if (useIUM) Bool() else UInt(0.W)
  // val r_mask = if (useIUM) UInt(nRows.W) else UInt(0.W)
  val tag = if (useIUM) UInt(15.W) else UInt(0.W)
}

@chiselName
class IUMTable(val nRows: Int, tableSize: Int, maxSetIdxBits: Int)(implicit p: Parameters) extends TageModule with HasCircularQueuePtrHelper {
  val tableBits = log2Ceil(tableSize)

  class IUMTag extends XSBundle {
    val tag = UInt((1 + tableBits + maxSetIdxBits).W) // UInt(1 + 3 + 11 = 15
  }

  object IUMTag {
    def apply(tag: UInt): IUMTag = {
      val meta = Wire(new IUMTag)
      meta.tag := tag
      meta
    }
  }

  class IUMData extends XSBundle {
    val pred = Bool()
    val ftq_ptr = new FtqPtr()
  }

  object IUMData {
    def apply(d: Bool, ptr: FtqPtr): IUMData = {
      val data = Wire(new IUMData)
      data.pred := d
      data.ftq_ptr := ptr
      data
    }
  }

  // class IUMRedirect extends XSBundle {
  //   val ftq_ptr = new FtqPtr()
  //   val ium_ptr = new IUMPtr()
  //   val taken = Bool()
  // }

  class IUMIO extends XSBundle {
    val req = Flipped(ValidIO(Vec(tableSize, UInt(maxSetIdxBits.W)))) // Send on s1
    val provider = Flipped(ValidIO(UInt(tableBits.W))) // Send on s2
    val resp = ValidIO(new IUMData) // Response on s2
    val resp_tag = Output(UInt(15.W))

    val enq_data = Flipped(ValidIO(new IUMData))
    val enq_tag = Input(UInt(15.W))
    // val enq_ptr = Output(new IUMPtr)

    val deq = Input(Bool())
    val misPred = Input(Bool())
    // val deq_tag = Input(UInt(15.W))
    val deq_ftq_ptr = Input(new FtqPtr)

    // val redirect = Input(Valid(new IUMRedirect))
  }

  val io = IO(new IUMIO)

  val tagCam  = Module(new CAMTemplate(new IUMTag, nRows, tableSize + 1 + 1)) // pred + enq + deq
  val table   = Module(new AsyncDataModuleTemplate(new IUMData, nRows, numRead = 1 + nRows, numWrite = 1))

  val valid_mask = RegInit(VecInit(Seq.fill(nRows)(false.B)))
  val validEntries = PopCount(valid_mask)

  // Search logic
  // tagCam.io.r.req := VecInit((0 until tableSize).map(i => IUMTag(Cat(0.U(1.W), i.U(tableBits.W), io.req.bits(i))))
  //   :+ IUMTag(Cat(1.U(1.W), 0.U(tableBits.W), io.req.bits(0))))
  (0 until tableSize).foreach { i =>
    tagCam.io.r.req(i) := IUMTag(Cat(0.U(1.W), i.U(tableBits.W), io.req.bits(i)))
  }
  tagCam.io.r.req(tableSize) := IUMTag(Cat(Cat(1.U(1.W), 0.U(tableBits.W), io.req.bits(0))))

  val hit_vecs = RegEnable(VecInit((0 until tableSize+1).map {t =>
    VecInit((0 until nRows).map(i => valid_mask(i) && tagCam.io.r.resp(t)(i)))
  }), VecInit(Seq.fill(tableSize+1)(VecInit(Seq.fill(nRows)(false.B)))), io.req.valid)

  val hit_vec = Mux(io.provider.valid, hit_vecs(io.provider.bits), hit_vecs(tableSize.U))

  // val hit_idx = Wire(UInt(maxSetIdxBits.W))
  val hit_idx = OHToUInt(hit_vec)
  val req_hit = ParallelOR(hit_vec)

  assert(hit_vec.asUInt === 0.U || PopCount(hit_vec) === 1.U)

  // when (head_ptr.flag === tail_ptr.flag) { // NOTE: Will the movement of the s1 to s2 pointer affect the result?
  //   hit_idx := OHToUInt(PriorityEncoderOH(hit_vec.reverse).reverse)
  // }.otherwise {
  //   when((hit_vec.asUInt & right_mask) =/= 0.U) {
  //     hit_idx := OHToUInt(Reverse(PriorityEncoderOH(Reverse(hit_vec.asUInt & right_mask))))
  //   }.otherwise {
  //     hit_idx := OHToUInt(Reverse(PriorityEncoderOH(Reverse(hit_vec.asUInt & left_mask))))
  //   }
  // }
  val s2_req = RegEnable(io.req.bits, io.req.valid)

  table.io.raddr(0) := hit_idx
  io.resp.bits := table.io.rdata(0)
  io.resp.valid := req_hit
  io.resp_tag := Mux(io.provider.valid,
    Cat(0.U(1.W), io.provider.bits, s2_req(io.provider.bits)),
    Cat(1.U(1.W), 0.U(tableBits.W), s2_req(0)))

  // Enqueue logic on s2
  tagCam.io.r.req.last := IUMTag(io.enq_tag)
  val enq_hit_vec = tagCam.io.r.resp.last
  val enq_hit = ParallelOR(enq_hit_vec)
  val enq_hit_idx = OHToUInt(enq_hit_vec)
  assert(enq_hit_vec.asUInt === 0.U || PopCount(enq_hit_vec) === 1.U)

  val alloc = Wire(UInt(log2Ceil(nRows).W))
  val invalid_mask = ~(valid_mask.asUInt)
  // when(valid_mask.asUInt === "hffff_ffff_ffff_ffff".U) {
  when(invalid_mask === 0.U) {
    alloc := LFSR64()(log2Ceil(nRows)-1, 0)
  }.otherwise {
    alloc := PriorityEncoder(invalid_mask)
  }

  val enq_idx = Mux(enq_hit, enq_hit_idx, alloc)

  // val enqTag = Wire(new IUMTag)
  tagCam.io.w.valid := io.enq_data.valid
  tagCam.io.w.bits.index := enq_idx
  tagCam.io.w.bits.data := IUMTag(io.enq_tag)

  // val s2_req = RegEnable(io.req.bits, io.req.valid)
  // when (io.provider.valid) {
  //   enqTag := IUMTag(Cat(0.U(1.W), io.provider.bits, s2_req(io.provider.bits)))
  // }.otherwise {
  //   enqTag := IUMTag(Cat(1.U(1.W), 0.U(tableBits.W), s2_req(0)))
  // }

  table.io.wen(0) := io.enq_data.valid
  table.io.waddr(0) := enq_idx
  table.io.wdata(0) := io.enq_data.bits

  // io.enq_ptr :=
  // io.r_mask := right_mask
  // tail_ptr := tail_ptr + io.enq_data.valid

  // when(io.enq_data.valid) {
  //   right_mask := update_right_mask(right_mask, nRows)
  //   io.r_mask := update_right_mask(right_mask, nRows)
  // }.otherwise {
  //   io.r_mask := right_mask
  // }

  // Dequeue logic
  // tagCam.io.r.req.last := IUMTag(io.deq_tag)
  // val deq_hit_vec = tagCam.io.r.resp.last
  // val deq_hit = ParallelOR(deq_hit_vec)
  // val deq_hit_idx = OHToUInt(deq_hit_vec)

  (0 until nRows).foreach { i =>
    table.io.raddr(i+1) := i.U
  }

  // val real_deq = io.deq && table.io.rdata(1).ftq_ptr === io.deq_ftq_ptr
  when(io.deq) {
    (0 until nRows).foreach{ i =>
      when(isAfter(io.deq_ftq_ptr, table.io.rdata(i+1).ftq_ptr) || io.deq_ftq_ptr === table.io.rdata(i+1).ftq_ptr) {
        valid_mask(i) := false.B
      }
    }
    // valid_mask(deq_hit_idx) := false.B
  }

  when(io.enq_data.valid) {
    valid_mask(enq_idx) := true.B
  }

  // Redirect logic
  // when(io.redirect.valid) { // TODO: redirect diff bank
  //   valid_mask := update_mask(head_ptr + io.deq, io.redirect.bits.ptr + io.redirect.bits.ium_enq, nRows)
  //   right_mask := io.redirect.bits.recover_mask
  //   tail_ptr := io.redirect.bits.ptr + io.redirect.bits.ium_enq
  // }.otherwise {
  //   valid_mask := update_mask(head_ptr + io.deq, tail_ptr + io.enq_data.valid, nRows)
  // }

  // // TODO: Write conflict
  // table.io.wen(1) := io.redirect.valid && io.redirect.bits.need_recover
  // table.io.waddr(1) := io.redirect.bits.ptr.value
  // table.io.wdata(1) := IUMData(io.redirect.bits.taken, true.B)

  // assert(!(io.enq_data.valid && isFull(tail_ptr, head_ptr)))
  // assert(nRows.U - PopCount(left_mask) === head_ptr.value)
  // assert(PopCount(right_mask) === tail_ptr.value)

  // table.io.raddr(1) := io.redirect.bits.ptr.value

  if (BPUDebug && debug) {
    // val r_data = table.io.rdata(1)
    XSDebug(p"validEntries: ${validEntries}\n")
    // XSDebug(p"head_ptr: f:${head_ptr.flag} v:${head_ptr.value}, tail_ptr: f:${tail_ptr.flag} v:${tail_ptr.value}\n")
    // XSDebug(p"v_mask: ${Hexadecimal(valid_mask)}, l_mask: ${Hexadecimal(left_mask)}, r_mask: ${Hexadecimal(right_mask)}\n")
    XSDebug(p"v_mask: ${Hexadecimal(valid_mask.asUInt)}\n")
    // XSDebug(p"pred_by_tage: ${io.provider.valid}, table_idx: ${io.provider.bits}, s2_hit_vecs: ${Hexadecimal(hit_vec.asUInt)}, hit_idx: ${hit_idx}\n")
    // XSDebug(io.enq_data.valid, s"IUMEnqueue, enq_data: ${io.enq_data.bits.pred}\n")
    // XSDebug(io.deq, "IUMDequeue\n")
    // XSDebug(io.redirect.valid, s"IUMRedirect, need_recover:${io.redirect.bits.need_recover}, redirect ptr: f:${io.redirect.bits.ptr.flag} v:${io.redirect.bits.ptr.value}, taken: ${io.redirect.bits.taken}\n")
    // XSPerfAccumulate("IUMTable_need_recover", io.redirect.valid && io.redirect.bits.need_recover)
    // XSPerfAccumulate("IUMTable_recovered", io.resp.valid && io.resp.bits.recovered)
    // XSPerfAccumulate("IUMTable_recovered_and_wrong", io.redirect.valid && io.redirect.bits.need_recover && r_data.recovered)
    // // XSPerfAccumulate("IUMTable_recovered_and_right", io.deq && !io.misPred && deq_data.recovered)
    // XSPerfAccumulate("IUMTable_unrecovered_and_wrong", io.redirect.valid && io.redirect.bits.need_recover && !r_data.recovered)
    XSPerfAccumulate("IUM_enq_hit", io.enq_data.valid && enq_hit)
    XSPerfAccumulate("IUM_enq_no_hit", io.enq_data.valid && !enq_hit)
    XSPerfAccumulate("IUM_enq_hit_full", io.enq_data.valid && invalid_mask === 0.U && enq_hit)
    XSPerfAccumulate("IUM_enq_no_hit_full", io.enq_data.valid && invalid_mask === 0.U && !enq_hit)
    XSPerfAccumulate("IUM_enq", io.enq_data.valid)
    XSPerfAccumulate("IUM_req_hit", req_hit)
    // // XSPerfAccumulate("IUMTable_unrecovered_and_right", io.deq && !io.misPred && !deq_data.recovered)
  }
}

trait HasIUM extends HasIUMParameter { this: Tage =>
  val maxSetIdx = TableInfo.map(_._1).max
  val maxSetIdxBits = log2Ceil(maxSetIdx)

  val tableSize = TableInfo.size
  val tableBits = log2Ceil(tableSize)

  def getUnhashedIdx(pc: UInt): UInt = pc >> instOffsetBits

  val s1_idxes = bank_tables.zipWithIndex.map {
    case (tables, b) =>
      tables.map {
        t =>
          t.compute_tag_and_hash(getUnhashedIdx(s1_pc), io.in.bits.ghist<<b, io.in.bits.phist)._1
      }
  }

  val bank_IUMTables = Seq.fill(2)(Module(new IUMTable(nRows, tableSize, maxSetIdxBits))) // tableSize = 6, maxSetIdxBits = 11
  println(s"IUM_Argument: tableSize = $tableSize")
  println(s"IUM_Argument: maxSetIdxBits = $maxSetIdxBits\n")

  bank_IUMTables.zipWithIndex.foreach {case (t, i) =>
    t.io.req.valid := io.s1_fire
    t.io.req.bits  := s1_idxes(i)
    t.io.provider.valid := s2_provideds(i)
    t.io.provider.bits := s2_providers(i)
    // use ium returen data
    when(t.io.resp.valid) { resp_s2.preds.taken_mask(i) := t.io.resp.bits.pred || ftb_entry.always_taken(i)}

    resp_meta(i).iumHit := t.io.resp.valid // Update
    resp_meta(i).iumPred := t.io.resp.bits.pred // Update
    io.out.resp.s2.iumMeta(i).tag := t.io.resp_tag // Redirect

    val cfi = io.redirect.bits.cfiUpdate

    // val needEnq = ftb_hit && !ftb_entry.always_taken(i) && ftb_entry.brValids(i) && io.s2_fire
    val needEnq = io.redirect.valid && cfi.isMisPred &&
      cfi.bankIdx.valid && cfi.bankIdx.bits === i.U

    t.io.enq_data.valid := needEnq
    t.io.enq_data.bits.pred := cfi.taken
    t.io.enq_data.bits.ftq_ptr := io.redirect.bits.ftqIdx
    t.io.enq_tag := cfi.iumMeta(i).tag

    t.io.deq := io.update.valid // && updateMetas(i).iumEnq.asBool // NOTE: Will it be update when commit?
    t.io.misPred := io.update.valid && io.update.bits.mispred_mask(i)
    // t.io.deq_tag := updateMetas(i).iumTag
    t.io.deq_ftq_ptr := io.update.bits.ftq_idx

    // t.io.redirect.valid := io.redirect.valid

    // t.io.redirect.bits.need_recover := cfi.isMisPred &&
    //   cfi.bankIdx.valid && cfi.bankIdx.bits === i.U &&
    //   cfi.iumMeta(i).ium_enq.asBool // TODO: This can be delete

    // t.io.redirect.bits.ium_enq := cfi.iumMeta(i).ium_enq.asBool

    // t.io.redirect.bits.ptr := cfi.iumMeta(i).ium_ptr
    // t.io.redirect.bits.taken := io.redirect.bits.cfiUpdate.taken
    // t.io.redirect.bits.recover_mask := cfi.iumMeta(i).r_mask

    if (BPUDebug && debug) {
      XSDebug(p"ium_bank${i} provided: ${s2_provideds(i)},provider: ${s2_providers(i)} \n")
      XSDebug(p"ium_bank${i} hit: ${t.io.resp.valid}, pred: ${t.io.resp.bits.pred}\n")
      XSDebug(p"ium_bank${i} enq: ${t.io.enq_data.valid}, enq_data: ${s2_tageTakens(i)}\n")

      XSPerfAccumulate(f"ium_bank${i}_hit", t.io.resp.valid && RegNext(io.s1_fire))
      XSPerfAccumulate(f"ium_bank${i}_ium_hit_mispred", io.update.valid && io.update.bits.mispred_mask(i) && updateMetas(i).iumHit.asBool)
      XSPerfAccumulate(f"ium_bank${i}_ium_no_hit_mispred", io.update.valid && io.update.bits.mispred_mask(i) && !updateMetas(i).iumHit.asBool)

      XSPerfAccumulate(f"ium_bank${i}_ium_misp_but_tage_corr", io.update.valid && io.update.bits.mispred_mask(i) && updateMetas(i).iumHit.asBool &&
        updateMetas(i).iumPred =/= Mux(updateMetas(i).scMeta.scCovered.asBool, updateMetas(i).scMeta.scPred, updateMetas(i).scMeta.tageTaken)) // TODO: Add SC result
      XSPerfAccumulate(f"ium_bank${i}_ium_corr_but_tage_misp", io.update.valid && !io.update.bits.mispred_mask(i) && updateMetas(i).iumHit.asBool &&
        updateMetas(i).iumPred =/= Mux(updateMetas(i).scMeta.scCovered.asBool, updateMetas(i).scMeta.scPred, updateMetas(i).scMeta.tageTaken)) // TODO: Add SC result
    }
  }
}
