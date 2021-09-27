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

class IUMMeta(val useIUM: Boolean)(implicit p: Parameters) extends XSBundle with HasIUMParameter {
  val ium_ptr = if (useIUM) new IUMPtr else UInt(0.W)
  val ium_enq = if (useIUM) Bool() else UInt(0.W)
  val r_mask = if (useIUM) UInt(nRows.W) else UInt(0.W)
}

@chiselName
class IUMTable(val nRows: Int, tableSize: Int, maxSetIdxBits: Int)(implicit p: Parameters) extends TageModule with HasCircularQueuePtrHelper {
  def update_mask(head: IUMPtr, tail: IUMPtr, len: Int): UInt = {
    val mask = Wire(Vec(len, Bool()))
    when (head.flag === tail.flag) {
      (0 until len).foreach(i => mask(i) := i.U >= head.value && i.U < tail.value)
    }.otherwise {
      (0 until len).foreach(i => mask(i) := i.U >= head.value || i.U < tail.value)
    }
    mask.asUInt
  }

  def update_left_mask(mask: UInt, len: Int): UInt = {
    val new_mask = Wire(UInt(len.W))
    // when (mask === (1<<(len-1)).U(len.W)) {
    when (mask === Cat(1.U +: Seq.fill(len-1)(0.U))) {
      new_mask :=  ~(0.U(len.W))
    }.otherwise {
      new_mask := (mask << 1).asUInt
    }
    new_mask
  }

  def update_right_mask(mask: UInt, len: Int): UInt = {
    val new_mask = Wire(UInt(len.W))
    // when(mask === (~(1<<(len-1))).U(len.W)) {
    when (mask === Cat(0.U +: Seq.fill(len-1)(1.U))) {
      new_mask := 0.U(len.W)
    }.otherwise {
      new_mask := (mask << 1).asUInt + 1.U
    }
    new_mask
  }

  val tableBits = log2Ceil(tableSize)
  // val idxBits = log2Ceil(nRow)

  class IUMTag extends XSBundle {
    // val tableIdx = if (useIUM) UInt(tableBits.W) else UInt(0.W)
    // val setIdx = if (useIUM) UInt(log2Ceil(max(TableInfo.map(_(0)))).W) else UInt(0.W)
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
    val recovered = Bool()
  }

  object IUMData {
    def apply(d: Bool, r: Bool): IUMData = {
      val data = Wire(new IUMData)
      data.pred := d
      data.recovered := r
      data
    }
  }

  class IUMRedirect extends XSBundle {
    val ptr = new IUMPtr
    val taken = Bool()
    val recover_mask = UInt(nRows.W)
    val need_recover = Bool()
    val ium_enq = Bool()
  }

  class IUMIO extends XSBundle {
    val req = Flipped(ValidIO(Vec(tableSize, UInt(maxSetIdxBits.W)))) // Send on s1
    val provider = Flipped(ValidIO(UInt(tableBits.W))) // Send on s2
    val resp = ValidIO(new IUMData) // Response on s2

    val enq_data = Flipped(ValidIO(new IUMData))
    val enq_ptr = Output(new IUMPtr)
    val r_mask = Output(UInt(nRows.W))

    val deq = Input(Bool())
    val misPred = Input(Bool())
    
    val redirect = Input(Valid(new IUMRedirect))
  }

  val io = IO(new IUMIO)

  val tagCam  = Module(new CAMTemplate(new IUMTag, nRows, tableSize + 1))
  val table   = Module(new AsyncDataModuleTemplate(new IUMData, nRows, numRead = 2, numWrite = 2))

  val head_ptr, tail_ptr = RegInit(IUMPtr(false.B, 0.U))
  val valid_mask, right_mask = RegInit(0.U(nRows.W))
  // val left_mask = RegInit(((1<<nRows) - 1).U(nRows.W))
  val left_mask = RegInit("hffffffffffffffff".U)

  val validEntries = distanceBetween(tail_ptr, head_ptr)
  dontTouch(validEntries)

  // Search logic
  tagCam.io.r.req := VecInit((0 until tableSize).map(i => IUMTag(Cat(0.U(1.W), i.U(tableBits.W), io.req.bits(i))))
    :+ IUMTag(Cat(1.U(1.W), 0.U(tableBits.W), io.req.bits(0))))

  val hit_vecs = RegEnable(VecInit((0 until tableSize+1).map {t =>
    VecInit((0 until nRows).map(i => valid_mask(i) && tagCam.io.r.resp(t)(i)))
  }), VecInit(Seq.fill(tableSize+1)(VecInit(Seq.fill(nRows)(false.B)))), io.req.valid)

  val hit_vec = Mux(io.provider.valid, hit_vecs(io.provider.bits), hit_vecs(tableSize.U))

  val hit_idx = Wire(UInt(maxSetIdxBits.W))

  when (head_ptr.flag === tail_ptr.flag) { // NOTE: Will the movement of the s1 to s2 pointer affect the result?
    hit_idx := OHToUInt(PriorityEncoderOH(hit_vec.reverse).reverse)
  }.otherwise {
    when((hit_vec.asUInt & right_mask) =/= 0.U) {
      hit_idx := OHToUInt(Reverse(PriorityEncoderOH(Reverse(hit_vec.asUInt & right_mask))))
    }.otherwise {
      hit_idx := OHToUInt(Reverse(PriorityEncoderOH(Reverse(hit_vec.asUInt & left_mask))))
    }
  }

  table.io.raddr(0) := hit_idx
  io.resp.bits := table.io.rdata(0)
  io.resp.valid := ParallelOR(hit_vec)

  // Enqueue logic on s2
  val enqTag = Wire(new IUMTag)
  tagCam.io.w.valid := io.enq_data.valid
  tagCam.io.w.bits.index := tail_ptr.value
  tagCam.io.w.bits.data := enqTag

  val s2_req = RegEnable(io.req.bits, io.req.valid)
  when (io.provider.valid) {
    enqTag := IUMTag(Cat(0.U(1.W), io.provider.bits, s2_req(io.provider.bits)))
  }.otherwise {
    enqTag := IUMTag(Cat(1.U(1.W), 0.U(tableBits.W), s2_req(0)))
  }

  table.io.wen(0) := io.enq_data.valid
  table.io.waddr(0) := tail_ptr.value
  table.io.wdata(0) := io.enq_data.bits

  io.enq_ptr := tail_ptr
  // io.r_mask := right_mask
  tail_ptr := tail_ptr + io.enq_data.valid

  when(io.enq_data.valid) {
    right_mask := update_right_mask(right_mask, nRows)
    io.r_mask := update_right_mask(right_mask, nRows)
  }.otherwise {
    io.r_mask := right_mask
  }
  
  // Dequeue logic
  when (io.deq) {
    head_ptr := head_ptr + 1.U
    left_mask := update_left_mask(left_mask, nRows)
  }

  // Redirect logic
  when(io.redirect.valid) { // TODO: redirect diff bank
    valid_mask := update_mask(head_ptr + io.deq, io.redirect.bits.ptr + io.redirect.bits.ium_enq, nRows)
    right_mask := io.redirect.bits.recover_mask
    tail_ptr := io.redirect.bits.ptr + io.redirect.bits.ium_enq
  }.otherwise {
    valid_mask := update_mask(head_ptr + io.deq, tail_ptr + io.enq_data.valid, nRows)
  }

  // TODO: Write conflict
  table.io.wen(1) := io.redirect.valid && io.redirect.bits.need_recover
  table.io.waddr(1) := io.redirect.bits.ptr.value
  table.io.wdata(1) := IUMData(io.redirect.bits.taken, true.B)

  assert(!(io.enq_data.valid && isFull(tail_ptr, head_ptr)))
  assert(nRows.U - PopCount(left_mask) === head_ptr.value)
  assert(PopCount(right_mask) === tail_ptr.value)

  table.io.raddr(1) := head_ptr.value

  if (BPUDebug && debug) {
    val deq_data = table.io.rdata(1)
    XSDebug(p"validEntries: ${validEntries}\n")
    XSDebug(p"head_ptr: f:${head_ptr.flag} v:${head_ptr.value}, tail_ptr: f:${tail_ptr.flag} v:${tail_ptr.value}\n")
    XSDebug(p"v_mask: ${Hexadecimal(valid_mask)}, l_mask: ${Hexadecimal(left_mask)}, r_mask: ${Hexadecimal(right_mask)}\n")
    XSDebug(p"pred_by_tage: ${io.provider.valid}, table_idx: ${io.provider.bits}, s2_hit_vecs: ${Hexadecimal(hit_vec.asUInt)}, hit_idx: ${hit_idx}\n")
    XSDebug(io.enq_data.valid, s"IUMEnqueue, enq_data: ${io.enq_data.bits.pred}\n")
    XSDebug(io.deq, "IUMDequeue\n")
    XSDebug(io.redirect.valid, s"IUMRedirect, need_recover:${io.redirect.bits.need_recover}, redirect ptr: f:${io.redirect.bits.ptr.flag} v:${io.redirect.bits.ptr.value}, taken: ${io.redirect.bits.taken}\n")
    XSPerfAccumulate("IUMTable_need_recover", io.redirect.valid && io.redirect.bits.need_recover)
    XSPerfAccumulate("IUMTable_recovered", io.resp.valid && io.resp.bits.recovered)
    XSPerfAccumulate("IUMTable_recovered_and_wrong", io.deq && io.misPred && deq_data.recovered)
    XSPerfAccumulate("IUMTable_recovered_and_right", io.deq && !io.misPred && deq_data.recovered)
    XSPerfAccumulate("IUMTable_unrecovered_and_wrong", io.deq && io.misPred && !deq_data.recovered)
    XSPerfAccumulate("IUMTable_unrecovered_and_right", io.deq && !io.misPred && !deq_data.recovered)
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
      tables.zipWithIndex.map {
        case (t, i) =>
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
    when(t.io.resp.valid) { s2_tageTakens(i) := t.io.resp.bits.pred }

    val needEnq = io.in.bits.resp_in(0).s2.preds.hit && io.in.bits.resp_in(0).s2.ftb_entry.brValids(i) && io.s2_fire
    t.io.enq_data.valid := needEnq
    t.io.enq_data.bits.pred := s2_tageTakens(i)
    t.io.enq_data.bits.recovered := false.B

    resp_meta(i).iumEnq := needEnq // Update

    io.out.resp.s2.iumMeta(i).ium_ptr := t.io.enq_ptr
    io.out.resp.s2.iumMeta(i).ium_enq := needEnq // Redirect
    io.out.resp.s2.iumMeta(i).r_mask := t.io.r_mask

    t.io.deq := io.update.valid && updateMetas(i).iumEnq.asBool // NOTE: Will it be update when commit?
    t.io.misPred := io.update.valid && updateMetas(i).iumEnq.asBool && io.update.bits.mispred_mask(i)

    val cfi = io.redirect.bits.cfiUpdate

    t.io.redirect.valid := io.redirect.valid

    t.io.redirect.bits.need_recover := cfi.isMisPred &&
      cfi.bankIdx.valid && cfi.bankIdx.bits === i.U &&
      cfi.iumMeta(i).ium_enq.asBool // TODO: This can be delete

    t.io.redirect.bits.ium_enq := cfi.iumMeta(i).ium_enq.asBool

    t.io.redirect.bits.ptr := cfi.iumMeta(i).ium_ptr
    t.io.redirect.bits.taken := io.redirect.bits.cfiUpdate.taken
    t.io.redirect.bits.recover_mask := cfi.iumMeta(i).r_mask

    if (BPUDebug && debug) {
      XSDebug(p"ium_bank${i} provided: ${s2_provideds(i)},provider: ${s2_providers(i)} \n")
      XSDebug(p"ium_bank${i} hit: ${t.io.resp.valid}, pred: ${t.io.resp.bits.pred}\n")
      XSDebug(p"ium_bank${i} enq: ${t.io.enq_data.valid}, enq_data: ${s2_tageTakens(i)}\n")

      XSPerfAccumulate(f"ium_bank${i}_hit", t.io.resp.valid && RegNext(io.s1_fire))
    }
  }
}
