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
import xiangshan.ExceptionNO._
import xiangshan._
import xiangshan.backend.fu.PMPRespBundle
import xiangshan.cache._
import xiangshan.cache.dcache.ReplayCarry
import xiangshan.cache.mmu.{TlbCmd, TlbReq, TlbRequestIO, TlbResp}

// IO to send fast replay request
class LoadToLsqFastIO(implicit p: Parameters) extends XSBundle {
  val valid = Output(Bool())
  val ld_ld_check_ok = Output(Bool())
  val st_ld_check_ok = Output(Bool())
  val cache_bank_no_conflict = Output(Bool())
  val ld_idx = Output(UInt(log2Ceil(LoadQueueSize).W))
}

// IO to send slow replay replay request
class LoadToLsqSlowIO(implicit p: Parameters) extends XSBundle {
  val valid = Output(Bool())
  val tlb_hited = Output(Bool())
  val st_ld_check_ok = Output(Bool())
  val cache_no_replay = Output(Bool())
  val forward_data_valid = Output(Bool())
  val ld_idx = Output(UInt(log2Ceil(LoadQueueSize).W))
  val data_invalid_sq_idx = Output(UInt(log2Ceil(StoreQueueSize).W))
  val replayCarry = Output(new ReplayCarry)
}

// Load Pipeline / Load Queue interface
class LoadToLsqIO(implicit p: Parameters) extends XSBundle {
  val loadIn = ValidIO(new LqWriteBundle)
  val loadPaddrIn = ValidIO(new LqPaddrWriteBundle)
  val loadVaddrIn = ValidIO(new LqVaddrWriteBundle)
  val ldout = Flipped(DecoupledIO(new ExuOutput))
  val ldRawData = Input(new LoadDataFromLQBundle)
  val s2_load_data_forwarded = Output(Bool())
  val s3_delayed_load_error = Output(Bool())
  val s2_dcache_require_replay = Output(Bool())
  val s3_replay_from_fetch = Output(Bool()) // update uop.ctrl.replayInst in load queue in s3
  val forward = new PipeLoadForwardQueryIO
  val loadViolationQuery = new LoadViolationQueryIO
  val trigger = Flipped(new LqTriggerIO)

  // for load replay
  val replayCarry = Input(new ReplayCarry)
  val replayFast = new LoadToLsqFastIO
  val replaySlow = new LoadToLsqSlowIO
}

// Load to load fast forward IO
class LoadToLoadIO(implicit p: Parameters) extends XSBundle {
  // load to load fast path is limited to ld (64 bit) used as vaddr src1 only
  val data = UInt(XLEN.W)
  val valid = Bool()
}

// Load pipeline debug trigger IO
class LoadUnitTriggerIO(implicit p: Parameters) extends XSBundle {
  val tdata2 = Input(UInt(64.W))
  val matchType = Input(UInt(2.W))
  val tEnable = Input(Bool()) // timing is calculated before this
  val addrHit = Output(Bool())
  val lastDataHit = Output(Bool())
}

class LoadUnit(implicit p: Parameters) extends XSModule
  with HasLoadHelper
  with HasPerfEvents
  with HasDCacheParameters
  with HasCircularQueuePtrHelper
{
  val io = IO(new Bundle() {
    val ldin = Flipped(Decoupled(new ExuInput))
    val ldout = Decoupled(new ExuOutput)
    val redirect = Flipped(ValidIO(new Redirect))
    val feedbackSlow = ValidIO(new RSFeedback)
    val feedbackFast = ValidIO(new RSFeedback)
    val rsIdx = Input(UInt(log2Up(IssQueSize).W))
    val isFirstIssue = Input(Bool())
    val dcache = new DCacheLoadIO
    val sbuffer = new LoadForwardQueryIO
    val lsq = new LoadToLsqIO
    val refill = Flipped(ValidIO(new Refill))
    val fastUop = ValidIO(new MicroOp) // early wakeup signal generated in load_s1, send to RS in load_s2
    val trigger = Vec(3, new LoadUnitTriggerIO)

    val tlb = new TlbRequestIO(2)
    val pmp = Flipped(new PMPRespBundle()) // arrive same to tlb now

    val fastpathOut = Output(new LoadToLoadIO)
    val fastpathIn = Input(new LoadToLoadIO)
    val loadFastMatch = Input(Bool())
    val loadFastImm = Input(UInt(12.W))

    val s3_delayed_load_error = Output(Bool()) // load ecc error
    // Note that io.s3_delayedLoadError and io.lsq.s3_delayedLoadError is different

    val csrCtrl = Flipped(new CustomCSRCtrlIO)
    val reExecuteQuery = Flipped(Vec(StorePipelineWidth, Valid(new LoadReExecuteQueryIO)))    // load replay
    val lsqOut = Flipped(Decoupled(new LsPipelineBundle))
  })

  require(LoadPipelineWidth == exuParameters.LduCnt)

  // -------------------------------------------------------------
  // Load Pipeline Stage 0
  // Generate addr, use addr to query DCache and DTLB
  // -------------------------------------------------------------
  
  val s0_valid = Wire(Bool())
  val s0_flush = Wire(Bool())
  val s0_vaddr = Wire(UInt(VAddrBits.W))
  val s0_mask = Wire(UInt(8.W))
  val s0_uop = Wire(new MicroOp) // s0_uop has 3 sources, and exception bit may be updated by addr align check
  val s0_isFirstIssue = Wire(Bool())
  val s0_rsIdx = Wire(UInt(log2Up(IssQueSize).W))
  val s0_sqIdx = Wire(new SqPtr)
  val s0_tryFastpath = WireInit(false.B)
  val s0_replayCarry = Wire(new ReplayCarry)
  val s0_isLoadReplay = Wire(Bool())
  val s0_kill = WireInit(false.B) // used by l2l 
  
  val debug_s0_src_isq = WireInit(false.B) // source: load issue queue
  val debug_s0_src_lrq = WireInit(false.B) // source: load replay queue
  val debug_s0_src_l2l = WireInit(false.B) // source: load 2 load fast forward

  val s0_fire = Wire(Bool())

  // default value
  s0_replayCarry.valid := false.B
  s0_replayCarry.real_way_en := 0.U

  // load unit s0 is valid 
  s0_valid := io.ldin.valid || io.lsqOut.valid || s0_tryFastpath

  // assign default value
  s0_uop := DontCare

  // generate vaddr and ctrl signal for pointerchasing
  // we try pointerchasing when (1. no rs-issued load and 2. no LSQ replayed load)
  val s0_tryPointerChasing = !io.ldin.valid && !io.lsqOut.valid && io.fastpathIn.valid
  val s0_pointerChasingVaddrOffset = io.fastpathIn.data(5, 0) +& io.loadFastImm(5, 0)
  val s0_pointerChasingVaddr = Cat(io.fastpathIn.data(XLEN-1, 6), s0_pointerChasingVaddrOffset(5,0))
  // when S0 has opportunity to try pointerchasing, make sure it truely goes to S1
  // which is S0's out is ready and dcache is ready
  val s0_doTryPointerChasing = s0_tryPointerChasing && s0_fire

  // load unit s0 input source selection
  //
  // there are three sources of load pipeline's input
  // * 1. load issued by RS  (io.ldin)
  // * 2. load replayed by LSQ  (io.lsqOut)
  // * 3. load try pointchaising when no issued or replayed load  (io.fastpath)
  //
  // the priority is 
  // 1 > 2 > 3
  // now in S0, choise a load according to priority
  when(io.ldin.valid) {
    val imm12 = io.ldin.bits.uop.ctrl.imm(11, 0)
    s0_vaddr := io.ldin.bits.src(0) + SignExt(imm12, VAddrBits)
    s0_mask := genWmask(s0_vaddr, io.ldin.bits.uop.ctrl.fuOpType(1,0))
    s0_uop := io.ldin.bits.uop
    s0_isFirstIssue := io.isFirstIssue
    s0_rsIdx := io.rsIdx
    s0_sqIdx := io.ldin.bits.uop.sqIdx
    debug_s0_src_isq := true.B
  }.elsewhen(io.lsqOut.valid) {
    s0_vaddr := io.lsqOut.bits.vaddr
    s0_mask := io.lsqOut.bits.mask
    s0_uop := io.lsqOut.bits.uop
    s0_isFirstIssue := io.lsqOut.bits.isFirstIssue
    s0_rsIdx := io.lsqOut.bits.rsIdx
    s0_sqIdx := io.lsqOut.bits.uop.sqIdx
    s0_replayCarry := io.lsq.replayCarry // TODO: better IO def
    debug_s0_src_lrq := true.B
  }.otherwise {
    if (EnableLoadToLoadForward) {
      s0_tryFastpath := io.fastpathIn.valid
      // When there's no valid instruction from RS and LSQ, we try the load-to-load forwarding.
      s0_vaddr := s0_pointerChasingVaddr
      // Assume the pointer chasing is always ld.
      s0_uop.ctrl.fuOpType := LSUOpType.ld
      s0_mask := genWmask(0.U, LSUOpType.ld)
      // we dont care s0_isFirstIssue and s0_rsIdx and s0_sqIdx in S0 when trying pointchasing 
      // because these signals will be updated in S1
      s0_isFirstIssue := DontCare
      s0_rsIdx := DontCare
      s0_sqIdx := DontCare
      debug_s0_src_l2l := true.B
    }
  }
  
  // io.ldin (input from rs/iq) has highest priority
  io.ldin.ready := !io.ldin.valid || io.dcache.req.ready
  // io.lsqOut (input from load replay queue) can fire only when there in no RS-issued load
  io.lsqOut.ready := io.dcache.req.ready && !io.ldin.valid
  s0_isLoadReplay := !io.ldin.valid && io.lsqOut.valid
  
  // address alignment check
  val s0_addrAligned = LookupTree(s0_uop.ctrl.fuOpType(1, 0), List(
    "b00".U   -> true.B,                   //b
    "b01".U   -> (s0_vaddr(0)    === 0.U), //h
    "b10".U   -> (s0_vaddr(1, 0) === 0.U), //w
    "b11".U   -> (s0_vaddr(2, 0) === 0.U)  //d
  ))
  s0_uop.cf.exceptionVec(loadAddrMisaligned) := !s0_addrAligned

  // soft prefetch decoder
  val s0_isSoftPrefetch = LSUOpType.isPrefetch(s0_uop.ctrl.fuOpType)
  val s0_isSoftPrefetchRead = s0_uop.ctrl.fuOpType === LSUOpType.prefetch_r
  val s0_isSoftPrefetchWrite = s0_uop.ctrl.fuOpType === LSUOpType.prefetch_w

  // query DTLB
  io.tlb.req.valid := s0_valid
  io.tlb.req.bits.vaddr := s0_vaddr
  io.tlb.req.bits.cmd := TlbCmd.read
  io.tlb.req.bits.size := LSUOpType.size(s0_uop.ctrl.fuOpType)
  io.tlb.req.bits.kill := DontCare
  io.tlb.req.bits.debug.robIdx := s0_uop.robIdx
  io.tlb.req.bits.debug.pc := s0_uop.cf.pc
  io.tlb.req.bits.debug.isFirstIssue := s0_isFirstIssue

  io.tlb.req_kill := false.B // not used for now

  // query DCache
  io.dcache.req.valid := s0_valid
  io.dcache.req.bits.cmd := Mux(
    s0_isSoftPrefetchRead,
    MemoryOpConstants.M_PFR,
    Mux(
      s0_isSoftPrefetchWrite,
      MemoryOpConstants.M_PFW,
      MemoryOpConstants.M_XRD
    )
  )
  io.dcache.req.bits.addr := s0_vaddr
  io.dcache.req.bits.mask := s0_mask
  io.dcache.req.bits.data := DontCare
  io.dcache.req.bits.replayCarry := s0_replayCarry
  io.dcache.req.bits.id   := DontCare
  io.dcache.req.bits.instrtype := Mux(
    s0_isSoftPrefetch,
    SOFT_PREFETCH.U,
    LOAD_SOURCE.U
  )

  // load unit will accept at least 1 input if dcache is ready to accept a load req
  s0_fire := s0_valid && io.dcache.req.ready && !s0_kill
  s0_flush := s0_uop.robIdx.needFlush(io.redirect)

  XSDebug(io.dcache.req.fire,
    p"[DCACHE LOAD REQ] pc ${Hexadecimal(s0_uop.cf.pc)}, vaddr ${Hexadecimal(s0_vaddr)}\n"
  )

  // load unit s0 perf counters
  XSPerfAccumulate("s0_rs_in_valid", io.ldin.valid)
  XSPerfAccumulate("s0_rs_in_block", io.ldin.valid && !s0_fire)
  XSPerfAccumulate("s0_rs_in_fire", io.ldin.fire)
  XSPerfAccumulate("s0_rs_in_fire_first_issue", io.ldin.fire && io.isFirstIssue)
  XSPerfAccumulate("s0_lsq_in_valid", io.lsqOut.valid)
  XSPerfAccumulate("s0_lsq_in_block_priority", io.lsqOut.valid && !debug_s0_src_lrq)
  XSPerfAccumulate("s0_lsq_in_block_dcache", io.lsqOut.valid && debug_s0_src_lrq && !s0_fire)
  XSPerfAccumulate("s0_lsq_in_fire", io.lsqOut.valid && debug_s0_src_lrq && s0_fire)
  XSPerfAccumulate("s0_l2l_in_valid", io.lsqOut.valid)
  XSPerfAccumulate("s0_l2l_in_block_priority", io.lsqOut.valid && !debug_s0_src_l2l)
  XSPerfAccumulate("s0_l2l_in_block_dcache", io.lsqOut.valid && debug_s0_src_l2l && !s0_fire)
  XSPerfAccumulate("s0_l2l_in_fire", io.lsqOut.valid && debug_s0_src_l2l && s0_fire)
  XSPerfAccumulate("s0_ld_fire", s0_fire)
  XSPerfAccumulate("s0_ld_dcache_block", s0_valid && !io.dcache.req.ready)
  // XSPerfAccumulate("addr_spec_success", s0_fire && s0_vaddr(VAddrBits-1, 12) === io.ldin.bits.src(0)(VAddrBits-1, 12))
  // XSPerfAccumulate("addr_spec_failed", s0_fire && s0_vaddr(VAddrBits-1, 12) =/= io.ldin.bits.src(0)(VAddrBits-1, 12))
  // XSPerfAccumulate("addr_spec_success_once", s0_fire && s0_vaddr(VAddrBits-1, 12) === io.ldin.bits.src(0)(VAddrBits-1, 12) && io.isFirstIssue)
  // XSPerfAccumulate("addr_spec_failed_once", s0_fire && s0_vaddr(VAddrBits-1, 12) =/= io.ldin.bits.src(0)(VAddrBits-1, 12) && io.isFirstIssue)
  
  // -------------------------------------------------------------
  // Load Pipeline Stage 1
  // Get paddr froom DTLB, use paddr to query DCache, SQ and sbuffer
  // -------------------------------------------------------------

  val s1_valid = RegNext(s0_fire && !s0_flush)
  val s1_fire = Wire(Bool())
  val s1_flush = Wire(Bool())
  // s1_kill now is used by pointer chasing cancel logic
  val s1_kill = WireInit(false.B)
  val s1_vaddr = WireInit(RegEnable(s0_vaddr, s0_fire)) // may be overwritten by l2l
  val s1_mask = RegEnable(s0_mask, s0_fire)
  val s1_uop = WireInit(RegEnable(s0_uop, s0_fire)) // may be overwritten by l2l
  val s1_rsIdx = WireInit(RegEnable(s0_rsIdx, s0_fire)) // may be overwritten by l2l
  val s1_isFirstIssue = WireInit(RegEnable(s0_isFirstIssue, s0_fire)) // may be overwritten by l2l
  val s1_isSoftPrefetch = RegEnable(s0_isSoftPrefetch, s0_fire)
  val s1_isLoadReplay = RegEnable(s0_isLoadReplay, s0_fire)
  val s1_paddr_dup_lsu = WireInit(io.tlb.resp.bits.paddr(0)) // may be overwritten by l2l
  val s1_paddr_dup_dcache = WireInit(io.tlb.resp.bits.paddr(1)) // may be overwritten by l2l
  // af & pf exception were modified below.
  val s1_exception = ExceptionNO.selectByFu(s1_uop.cf.exceptionVec, lduCfg).asUInt.orR
  val s1_tlbMiss = io.tlb.resp.bits.miss
  val s1_bankConflict = io.dcache.s1_bank_conflict
  // pointer tracing flags and data
  val s1_tryPointerChasing = RegNext(s0_doTryPointerChasing, false.B)
  val s1_pointerChasingVAddr = RegEnable(s0_pointerChasingVaddrOffset, s0_doTryPointerChasing)
  val s1_cancelPointerChasing = WireInit(false.B)
  val s1_spec_vaddr = RegNext(s0_vaddr)

  // Note: s1_uop and some other ctrl info have multiple sources
  // source 1: uop from load_s0-load_s1 pipeline reg
  // source 2: l2l uop from load_s0, if l2l path is working and l2l inst has come to load_s1

  // always ready to accept tlb resp
  io.tlb.resp.ready := true.B

  // provide paddr and vaddr for lq
  io.lsq.loadPaddrIn.valid := s1_fire
  io.lsq.loadPaddrIn.bits.lqIdx := s1_uop.lqIdx
  io.lsq.loadPaddrIn.bits.paddr := s1_paddr_dup_lsu
  io.lsq.loadVaddrIn.valid := s1_fire // TODO: double check: s1_valid && !s1_kill 
  io.lsq.loadVaddrIn.bits.lqIdx := s1_uop.lqIdx
  io.lsq.loadVaddrIn.bits.vaddr := s1_vaddr
  
  // provide paddr for dcache
  io.dcache.s1_paddr_dup_lsu := s1_paddr_dup_lsu
  io.dcache.s1_paddr_dup_dcache := s1_paddr_dup_dcache 

  // cancel dcache access for safety reasons
  // cancel dcache access if:
  // 1. tlb miss
  // 2. exception 
  //io.dcache.s1_kill := s1_tlbMiss || s1_exception || s1_mmio
  io.dcache.s1_kill := s1_tlbMiss || s1_exception || s1_kill

  // load forward query datapath
  // query sbuffer
  io.sbuffer.valid := s1_valid && !(s1_exception || s1_tlbMiss || s1_kill)
  io.sbuffer.vaddr := s1_vaddr
  io.sbuffer.paddr := s1_paddr_dup_lsu
  io.sbuffer.uop := s1_uop
  io.sbuffer.sqIdx := s1_uop.sqIdx
  io.sbuffer.mask := s1_mask
  io.sbuffer.pc := s1_uop.cf.pc // for debug only
  // query store queue
  io.lsq.forward.valid := s1_valid && !(s1_exception || s1_tlbMiss || s1_kill)
  io.lsq.forward.vaddr := s1_vaddr
  io.lsq.forward.paddr := s1_paddr_dup_lsu
  io.lsq.forward.uop := s1_uop
  io.lsq.forward.sqIdx := s1_uop.sqIdx
  io.lsq.forward.sqIdxMask := DontCare // will be overwritten by sqIdxMask pre-generated in s0
  io.lsq.forward.mask := s1_mask
  io.lsq.forward.pc := s1_uop.cf.pc // for debug only
  // pre-calcuate sqIdx mask in s0, then send it to lsq in s1 for forwarding
  val s1_sqIdxMask = RegEnable(UIntToMask(s0_sqIdx.value, StoreQueueSize), s0_valid) 
  io.lsq.forward.sqIdxMask := s1_sqIdxMask // may be overwritten by l2l

  // ld-ld violation query
  io.lsq.loadViolationQuery.req.valid := s1_valid && !(s1_exception || s1_tlbMiss || s1_kill)
  io.lsq.loadViolationQuery.req.bits.paddr := s1_paddr_dup_lsu
  io.lsq.loadViolationQuery.req.bits.uop := s1_uop
  // if ld-ld violation check is busy, schedule replay
  val s1_needLdVioCheckRedo = io.lsq.loadViolationQuery.req.valid && 
    !io.lsq.loadViolationQuery.req.ready &&
    RegNext(io.csrCtrl.ldld_vio_check_enable)

  // st-ld violation fast recovery (replay instead of flush) query
  val s1_needReExecuteVec = Wire(Vec(StorePipelineWidth, Bool()))
  val s1_needReExecute = Wire(Bool()) // l-s violation detected, replay load inst can fix it

  for (w <- 0 until StorePipelineWidth) {
    //  s1_needReExecute valid when 
    //  1. ReExecute query request valid.
    //  2. Load instruction is younger than requestors(store instructions).
    //  3. Physical address match. 
    //  4. Data contains.    

    s1_needReExecuteVec(w) := io.reExecuteQuery(w).valid &&
                          isAfter(s1_uop.robIdx, io.reExecuteQuery(w).bits.robIdx) && 
                          !s1_tlbMiss &&
                          (s1_paddr_dup_lsu(PAddrBits-1, 3) === io.reExecuteQuery(w).bits.paddr(PAddrBits-1, 3)) &&
                          (s1_mask & io.reExecuteQuery(w).bits.mask).orR
  }
  s1_needReExecute := s1_needReExecuteVec.asUInt.orR

  val s1_ptwBack = io.tlb.resp.bits.ptwBack

  // Outdated: a temp patch to make nanhu rs happy, to be removed
  io.feedbackFast.valid := RegNext(
    Mux(s1_isLoadReplay, false.B, s1_valid && !s1_kill) &&
    !s1_uop.robIdx.needFlush(io.redirect)
  )
  io.feedbackFast.bits.hit := true.B // we have found s1_bankConflict / re do ld-ld violation check
  io.feedbackFast.bits.rsIdx := RegNext(s1_rsIdx)
  io.feedbackFast.bits.flushState := DontCare
  io.feedbackFast.bits.sourceType := RegNext(Mux(s1_bankConflict, RSFeedbackType.bankConflict, RSFeedbackType.ldVioCheckRedo))
  io.feedbackFast.bits.dataInvalidSqIdx := DontCare

  // Load inst fast replay request
  io.lsq.replayFast.valid := s1_valid && !s1_kill
  io.lsq.replayFast.ld_ld_check_ok := !s1_needLdVioCheckRedo
  io.lsq.replayFast.st_ld_check_ok := !s1_needReExecute
  io.lsq.replayFast.cache_bank_no_conflict := !s1_bankConflict
  io.lsq.replayFast.ld_idx := s1_uop.lqIdx.value

  // if replay is detected in load_s1,
  // load inst will be canceled immediately
  s1_fire := s1_valid && (!s1_needLdVioCheckRedo && !s1_bankConflict && !s1_needReExecute) && !s1_kill

  // current ori test will cause the case of ldest == 0, below will be modifeid in the future.
  // af & pf exception
  val s1_loadPageFault = io.tlb.resp.bits.excp(0).pf.ld
  val s1_loadAccessFault = io.tlb.resp.bits.excp(0).af.ld
  s1_uop.cf.exceptionVec(s1_loadPageFault) := s1_loadPageFault
  s1_uop.cf.exceptionVec(loadAccessFault) := s1_loadAccessFault

  // if pointer tracing failed, uop in load_s1 should be cancelled
  s1_flush := s1_uop.robIdx.needFlush(io.redirect) || s1_cancelPointerChasing

  // s1 pointer tracing logic
  //
  // check if pointer tracing need to be canceled:
  // if pointer tracing need to be canceled, redo that load from load_s0, cancel fast load in load_s1
  // otherwise, cancel load in load_s0 and keep fast load in load_s1
  if (EnableLoadToLoadForward) {
    // Sometimes, we need to cancel the load-load forwarding.
    // These can be put at S0 if timing is bad at S1.
    // Case 0: CACHE_SET(base + offset) != CACHE_SET(base) (lowest 6-bit addition has an overflow)
    val s1_l2lAddressMisMatch = s1_pointerChasingVAddr(6) || RegEnable(io.loadFastImm(11, 6).orR, s0_doTryPointerChasing)
    // Case 1: the address is not 64-bit aligned or the fuOpType is not LD
    val s1_l2lAddressNotAligned = s1_pointerChasingVAddr(2, 0).orR
    val s1_l2lFuOpTypeIsNotLd = io.ldin.bits.uop.ctrl.fuOpType =/= LSUOpType.ld // real uop for l2l is sent to load unit in load_s1
    // Case 2: this is not a valid load-load pair
    val s1_l2lNotFastMatch = RegEnable(!io.loadFastMatch, s0_tryPointerChasing)
    // Case 3: this load-load uop is cancelled
    val s1_l2lIsCancelled = !io.ldin.valid
    when (s1_tryPointerChasing) {
      s1_cancelPointerChasing := s1_l2lAddressMisMatch || s1_l2lAddressNotAligned || s1_l2lFuOpTypeIsNotLd || s1_l2lNotFastMatch || s1_l2lIsCancelled
      s1_uop := io.ldin.bits.uop
      s1_rsIdx := io.rsIdx
      s1_isFirstIssue := io.isFirstIssue
      val spec_vaddr = s1_spec_vaddr // TODO: double check it
      val vaddr = Cat(spec_vaddr(VAddrBits - 1, 6), s1_pointerChasingVAddr(5, 3), 0.U(3.W))
      s1_vaddr := vaddr
      // We need to replace vaddr(5, 3).
      s1_paddr_dup_lsu := Cat(io.tlb.resp.bits.paddr(0)(PAddrBits - 1, 6), s1_pointerChasingVAddr(5, 3), 0.U(3.W))
      s1_paddr_dup_dcache := Cat(io.tlb.resp.bits.paddr(1)(PAddrBits - 1, 6), s1_pointerChasingVAddr(5, 3), 0.U(3.W))
      // to enable load-load, sqIdxMask must be calculated based on ldin.uop
      // if timing is bad, we can calculate sqIdxMask earlier
      io.lsq.forward.sqIdxMask := UIntToMask(io.ldin.bits.uop.sqIdx.value, StoreQueueSize)
    }
    when (s1_cancelPointerChasing) {
      s1_kill := true.B
    }.otherwise {
      s0_kill := s1_tryPointerChasing // uop for l2l is already in s1, kill uop in s0
      when (s1_tryPointerChasing) {
        io.ldin.ready := true.B // accept current uop if we are trying pointer tracing in load_s1
      }
    }
    
    // pointer tracing perf counters (load_s0 and load_s1)
    XSPerfAccumulate("load_to_load_forward", s1_tryPointerChasing && !s1_cancelPointerChasing)
    XSPerfAccumulate("load_to_load_forward_try", s1_tryPointerChasing)
    XSPerfAccumulate("load_to_load_forward_fail", s1_cancelPointerChasing)
    XSPerfAccumulate("load_to_load_forward_fail_cancelled", s1_cancelPointerChasing && s1_l2lIsCancelled)
    XSPerfAccumulate("load_to_load_forward_fail_wakeup_mismatch", s1_cancelPointerChasing && !s1_l2lIsCancelled && s1_l2lNotFastMatch)
    XSPerfAccumulate("load_to_load_forward_fail_op_not_ld",
    s1_cancelPointerChasing && !s1_l2lIsCancelled && !s1_l2lNotFastMatch && s1_l2lFuOpTypeIsNotLd)
    XSPerfAccumulate("load_to_load_forward_fail_addr_align",
    s1_cancelPointerChasing && !s1_l2lIsCancelled && !s1_l2lNotFastMatch && !s1_l2lFuOpTypeIsNotLd && s1_l2lAddressNotAligned)
    XSPerfAccumulate("load_to_load_forward_fail_set_mismatch",
    s1_cancelPointerChasing && !s1_l2lIsCancelled && !s1_l2lNotFastMatch && !s1_l2lFuOpTypeIsNotLd && !s1_l2lAddressNotAligned && s1_l2lAddressMisMatch)
  }

  // load unit s1 perf counters
  XSPerfAccumulate("s1_in_valid", s1_valid)
  XSPerfAccumulate("s1_in_fire", s1_fire)
  XSPerfAccumulate("s1_in_fire_first_issue", s1_fire && s1_isFirstIssue)
  XSPerfAccumulate("s1_tlbMiss", s1_fire && s1_tlbMiss)
  XSPerfAccumulate("s1_tlbMiss_first_issue", s1_fire && s1_tlbMiss && s1_isFirstIssue)

  // -------------------------------------------------------------
  // Load Pipeline Stage 2
  // Read dcache data SRAM, start to update LQ
  // -------------------------------------------------------------
  
  val s2_valid = RegNext(s1_fire && !s1_flush)
  val s2_fire = Wire(Bool())
  val s2_vaddr = RegEnable(s1_vaddr, s1_fire)
  val s2_paddr = RegEnable(s1_paddr_dup_lsu, s1_fire)
  val s2_mask = RegEnable(s1_mask, s1_fire)
  val s2_tlbMiss = RegEnable(s1_tlbMiss, s1_fire)
  val s2_ptwBack = RegEnable(io.tlb.resp.bits.ptwBack, s1_fire)
  val s2_rsIdx = RegEnable(s1_rsIdx, s1_fire)
  val s2_isSoftPrefetch = RegEnable(s1_isSoftPrefetch, s1_fire)
  val s2_static_pm = RegNext(io.tlb.resp.bits.static_pm)
  val s2_loadPageFault = RegEnable(s1_loadPageFault, s1_fire)
  val s2_loadAccessFault = RegEnable(s1_loadAccessFault, s1_fire)
  val s2_isFirstIssue = RegEnable(s1_isFirstIssue, s1_fire)
  val s2_uop = WireInit(RegEnable(s1_uop, s0_fire)) // may be overwritten by l2l
  val s2_uop_updated = WireInit(s2_uop) // may be overwritten by l2l
  val s2_miss = Wire(Bool())
  val s2_exception = Wire(Bool())

  // generate real pmp check result
  val s2_pmp = WireInit(io.pmp)
  when (s2_static_pm.valid) {
    s2_pmp.ld := false.B
    s2_pmp.st := false.B
    s2_pmp.instr := false.B
    s2_pmp.mmio := s2_static_pm.bits
  }
  val s2_dcacheHit = io.dcache.s2_hit // dcache hit dup in lsu side
  val s2_isPrefetch = s2_isSoftPrefetch
  val s2_actuallyMmio = s2_pmp.mmio
  val s2_mmio = !s2_isPrefetch && s2_actuallyMmio && !s2_exception
  val s2_cacheMiss = io.dcache.resp.bits.miss
  val s2_cacheReplay = io.dcache.resp.bits.replay
  val s2_cacheTagError = io.dcache.resp.bits.tag_error
  val s2_forwardFail = io.lsq.forward.matchInvalid || io.sbuffer.matchInvalid
  val s2_ldldViolation = io.lsq.loadViolationQuery.resp.valid &&
    io.lsq.loadViolationQuery.resp.bits.have_violation &&
    RegNext(io.csrCtrl.ldld_vio_check_enable)
  val s2_dataInvalid = io.lsq.forward.dataInvalid && !s2_ldldViolation && !s2_exception

  // exception that may cause load addr to be invalid / illegal
  //
  // if such exception happen, that inst and its exception info
  // will be force writebacked to rob
  val s2_exceptionVec = WireInit(s2_uop.cf.exceptionVec)
  s2_exceptionVec(loadAccessFault) := s2_uop.cf.exceptionVec(loadAccessFault) || s2_pmp.ld
  // soft prefetch will not trigger any exception (but ecc error interrupt may be triggered)
  when (s2_isPrefetch) {
    s2_exceptionVec := 0.U.asTypeOf(s2_exceptionVec.cloneType)
  }
  s2_exception := ExceptionNO.selectByFu(s2_exceptionVec, lduCfg).asUInt.orR && !s2_tlbMiss

  // load_s2 dcache interface
  io.dcache.s2_kill := s2_pmp.ld || s2_pmp.mmio // kill dcache req if pmp report access fault / mmio (for security)
  io.dcache.resp.ready := true.B // always accept dcache resp
  val dcacheShouldResp = !(s2_tlbMiss || s2_exception || s2_mmio || s2_isPrefetch) // for debug only
  assert(!(s2_valid && (dcacheShouldResp && !io.dcache.resp.valid)), "DCache response got lost")

  // get forward result, merge sq / sbuffer forward result
  // lsq has higher priority than sbuffer
  val s2_forwardMask = Wire(Vec(8, Bool()))
  val s2_forwardData = Wire(Vec(8, UInt(8.W)))
  // generate XLEN/8 Muxs
  for (i <- 0 until XLEN / 8) {
    s2_forwardMask(i) := io.lsq.forward.forwardMask(i) || io.sbuffer.forwardMask(i)
    s2_forwardData(i) := Mux(io.lsq.forward.forwardMask(i), io.lsq.forward.forwardData(i), io.sbuffer.forwardData(i))
  }
  XSDebug(s2_fire, "[FWD LOAD RESP] pc %x fwd %x(%b)\n",
    s2_uop.cf.pc,
    io.lsq.forward.forwardData.asUInt, io.lsq.forward.forwardMask.asUInt
  )

  // full forward check, timing is bad, use it with care
  val s2_fullForward = ((~s2_forwardMask.asUInt).asUInt & s2_mask) === 0.U && !io.lsq.forward.dataInvalid

  // s2 dcache hit check
  if (EnableFastForward) {
    s2_miss := s2_cacheMiss &&
      !s2_exception &&
      !s2_fullForward &&
      !s2_isPrefetch
  } else {
    // s2_fullForward is not used to generate s2_miss
    s2_miss := s2_cacheMiss &&
      !s2_exception &&
      !s2_isPrefetch
  }

  // do not write fp regfile if there is exception
  s2_uop_updated.ctrl.fpWen := s2_uop.ctrl.fpWen && !s2_exception

  // generate can_replay_from_fetch signal in load_s2 for better timing
  // can_replay_from_fetch will be used in load_s3
  val s2_canReplayFromFetch = !s2_mmio && !s2_isPrefetch && !s2_tlbMiss
  // if forward fail, replay this inst from fetch
  val debug_forwardFailReplay = s2_forwardFail && !s2_mmio && !s2_isPrefetch && !s2_tlbMiss
  // if ld-ld violation is detected, replay from this inst from fetch
  val debug_ldldVioReplay = s2_ldldViolation && !s2_mmio && !s2_isPrefetch && !s2_tlbMiss

  // For timing reasons, sometimes we can not let
  // io.out.bits.miss := s2_cacheMiss && !s2_exception && !s2_fullForward
  // We use io.dataForwarded instead. It means:
  // 1. Forward logic have prepared all data needed,
  //    and dcache query is no longer needed.
  // 2. ... or data cache tag error is detected, this kind of inst
  //    will not update miss queue. That is to say, if miss, that inst
  //    may not be refilled
  // Such inst will be writebacked from load queue.
  val s2_dataForwarded = s2_cacheMiss && !s2_exception &&
    (s2_fullForward || io.csrCtrl.cache_error_enable && s2_cacheTagError)
  io.lsq.s2_load_data_forwarded := s2_dataForwarded

  // st-ld violation query
  val s2_needReExecuteVec = Wire(Vec(StorePipelineWidth, Bool()))  
  val s2_needReExecute = Wire(Bool())

  // load_s2 st-ld violation fast recovery (replay instead of flush) query
  for (i <- 0 until StorePipelineWidth) {
    //  NeedFastRecovery Valid when 
    //  1. Fast recovery query request Valid.
    //  2. Load instruction is younger than requestors(store instructions).
    //  3. Physical address match. 
    //  4. Data contains.
    s2_needReExecuteVec(i) := io.reExecuteQuery(i).valid &&
                              isAfter(s2_uop.robIdx, io.reExecuteQuery(i).bits.robIdx) && 
                              !s2_tlbMiss &&
                              (s2_paddr(PAddrBits-1,3) === io.reExecuteQuery(i).bits.paddr(PAddrBits-1, 3)) && 
                              (s2_mask & io.reExecuteQuery(i).bits.mask).orR 
  }
  s2_needReExecute := s2_needReExecuteVec.asUInt.orR

  // TODO: to be removed later
  io.feedbackSlow.valid := false.B
  io.feedbackSlow.bits := DontCare

  // TODO: to be removed later
  val s2_need_replay_from_rs = Wire(Bool())
  if (EnableFastForward) {
    s2_need_replay_from_rs :=
      s2_needReExecute ||
      s2_tlbMiss || // replay if dtlb miss
      s2_cacheReplay && !s2_isPrefetch && !s2_mmio && !s2_exception && !s2_fullForward || // replay if dcache miss queue full / busy
      s2_dataInvalid && !s2_isPrefetch // replay if store to load forward data is not ready
  } else {
    // Note that if all parts of data are available in sq / sbuffer, replay required by dcache will not be scheduled
    s2_need_replay_from_rs :=
      s2_needReExecute ||
      s2_tlbMiss || // replay if dtlb miss
      s2_cacheReplay && !s2_isPrefetch && !s2_mmio && !s2_exception && !s2_dataForwarded || // replay if dcache miss queue full / busy
      s2_dataInvalid && !s2_isPrefetch // replay if store to load forward data is not ready
  }

  // update slow replay info to lq
  io.lsq.replaySlow.valid := s2_valid && !s2_uop.robIdx.needFlush(io.redirect)
  io.lsq.replaySlow.tlb_hited := !s2_tlbMiss
  io.lsq.replaySlow.st_ld_check_ok := !s2_needReExecute
  if (EnableFastForward) {
    io.lsq.replaySlow.cache_no_replay := !s2_cacheReplay || s2_isPrefetch || s2_mmio || s2_exception || s2_fullForward
  }else {
    io.lsq.replaySlow.cache_no_replay := !s2_cacheReplay || s2_isPrefetch || s2_mmio || s2_exception || s2_dataForwarded
  }
  io.lsq.replaySlow.forward_data_valid := !s2_dataInvalid || s2_isPrefetch
  io.lsq.replaySlow.ld_idx := s2_uop.lqIdx.value
  io.lsq.replaySlow.data_invalid_sq_idx := io.lsq.forward.dataInvalidSqIdx // provide dataInvalidSqIdx to make wakeup faster
  io.lsq.replaySlow.replayCarry := io.dcache.resp.bits.replayCarry

  // s2_cacheReplay is quite slow to generate, send it separately to LQ
  //
  // in nanhu lq, s2_dcache_require_replay signal will be RegNexted, then used in s3
  // TODO: refactor
  if (EnableFastForward) {
    io.lsq.s2_dcache_require_replay := s2_cacheReplay && !s2_fullForward
  } else {
    io.lsq.s2_dcache_require_replay := s2_cacheReplay &&
      s2_need_replay_from_rs &&
      !s2_dataForwarded &&
      !s2_isPrefetch &&
      s2_miss
  }

  // update s2_uop -> s2_uop_updated according to fast wakeup cancel result and exception info
  s2_uop_updated.ctrl.flushPipe := s2_mmio && io.fastUop.valid // cancel normal load fast wakeup if it it an mmio load
  s2_uop_updated.cf.exceptionVec := s2_exceptionVec // cache error not included

  // cancel load in load_s2 (load replay queue has been updated) if:
  // 1. tlb miss
  // 2. fwd data invalid (std not executed)
  // 3. ld-st violation detected
  // replay will be scheduled in load replay queue for these cases
  s2_fire := s2_valid && !s2_tlbMiss && !s2_dataInvalid && !s2_needReExecute

  // RS fast wakeup singal
  // now io.fastUop.valid is sent to RS in load_s2
  // failed to set io.fastUop.valid to true.B foor a succeed load will add 1 cycle extra latency for that load
  //
  // Note: if io.fastUop.valid is set to true.B in load_s2, that load MUST be successfully writebacked in load_s3
  // otherwise, we must flush pipeline from that load inst (i.e. set uop.ctrl.flushPipe to true.B)
  // failed to do so will make RS crazy
  io.fastUop.valid := RegNext(
      !io.dcache.s1_disable_fast_wakeup &&  // load fast wakeup should be disabled when dcache data read is not ready
      s1_valid && // valid load request
      !s1_kill && // killed by load-load forwarding
      !io.tlb.resp.bits.fast_miss && // not mmio or tlb miss, pf / af not included here
      !io.lsq.forward.dataInvalidFast // forward succeed
    ) && 
    !RegNext(s1_needLdVioCheckRedo) && // load-load violation check: load paddr cam struct hazard
    !RegNext(s1_needReExecute) && // no st-ld violation detected in s1
    s2_valid && // still valid in load_s2, not flushed
    !s2_needReExecute && // no st-ld violation detected in s1
    s2_dcacheHit // dcache hit in lsu side
  
  io.fastUop.bits := s2_uop_updated

  // writeback to LSQ
  // load queue will be updated at s2 for both hit/miss int/fp load
  io.lsq.loadIn.valid := s2_fire
  // prepare 
  io.lsq.loadIn.bits.vaddr := s2_vaddr
  io.lsq.loadIn.bits.paddr := s2_paddr
  io.lsq.loadIn.bits.mask := s2_mask
  io.lsq.loadIn.bits.data := DontCare // // TODO: remove that
  io.lsq.loadIn.bits.uop := s2_uop_updated
  io.lsq.loadIn.bits.wlineflag := false.B // TODO: fix wlineflag
  io.lsq.loadIn.bits.miss := s2_miss
  io.lsq.loadIn.bits.tlbMiss := s2_tlbMiss
  io.lsq.loadIn.bits.ptwBack := s2_ptwBack
  io.lsq.loadIn.bits.mmio := s2_mmio
  io.lsq.loadIn.bits.atomic := false.B // mmio atomic bit in load pipeline is not used for now 
  io.lsq.loadIn.bits.rsIdx := s2_rsIdx
  // data from dcache is not included in io.out.bits.forwardData
  io.lsq.loadIn.bits.forwardMask := s2_forwardMask // TODO: remove that
  io.lsq.loadIn.bits.forwardData := s2_forwardData // TODO: remove that
  io.lsq.loadIn.bits.isSoftPrefetch := s2_isSoftPrefetch
  io.lsq.loadIn.bits.isFirstIssue := s2_isFirstIssue
  io.lsq.loadIn.bits.isLoadReplay := DontCare // TODO: remove that

  // generate duplicated load queue data wen
  val load_s2_valid_vec = RegInit(0.U(6.W))
  // val write_lq_safe = load_s2.io.write_lq_safe
  load_s2_valid_vec := 0x0.U(6.W)
  when (s1_fire) { load_s2_valid_vec := 0x3f.U(6.W)}
  when (s1_flush) { load_s2_valid_vec := 0x0.U(6.W) }
  assert(RegNext(s2_valid === load_s2_valid_vec(0)))
  io.lsq.loadIn.bits.lq_data_wen_dup := load_s2_valid_vec.asBools()

  // write to rob and writeback bus
  val s2_dcachePathValid = s2_fire && !s2_miss && !s2_mmio

  // int load, if hit, will be writebacked at s3
  // in load_s2, we prepare ctrl info and wait for dcache data resp
  // dcache data will come in later in load_s3 
  val dcacheHitLoadOutGen = Wire(Valid(new ExuOutput))
  dcacheHitLoadOutGen.valid := s2_dcachePathValid
  dcacheHitLoadOutGen.bits.uop := s2_uop_updated
  dcacheHitLoadOutGen.bits.data := DontCare
  dcacheHitLoadOutGen.bits.redirectValid := false.B
  dcacheHitLoadOutGen.bits.redirect := DontCare
  dcacheHitLoadOutGen.bits.debug.isMMIO := s2_mmio
  dcacheHitLoadOutGen.bits.debug.isPerfCnt := false.B
  dcacheHitLoadOutGen.bits.debug.paddr := s2_paddr
  dcacheHitLoadOutGen.bits.debug.vaddr := s2_vaddr
  dcacheHitLoadOutGen.bits.fflags := DontCare

  // load unit s2 perf counters
  XSPerfAccumulate("s2_valid", s2_valid)
  XSPerfAccumulate("s2_fire", s2_fire)
  XSPerfAccumulate("s2_fire_first_issue", s2_fire && s2_isFirstIssue)
  XSPerfAccumulate("s2_dcache_miss", s2_fire && s2_cacheMiss)
  XSPerfAccumulate("s2_dcache_miss_first_issue", s2_fire && s2_cacheMiss && s2_isFirstIssue)
  XSPerfAccumulate("full_forward", s2_valid && s2_fullForward)
  XSPerfAccumulate("dcache_miss_full_forward", s2_valid && s2_cacheMiss && s2_fullForward)
  XSPerfAccumulate("replay_from_fetch_forward", s2_fire && debug_forwardFailReplay)
  XSPerfAccumulate("replay_from_fetch_load_vio", s2_fire && debug_ldldVioReplay)
  XSPerfAccumulate("replay_lq",  io.lsq.replaySlow.valid && (!io.lsq.replaySlow.tlb_hited || !io.lsq.replaySlow.cache_no_replay || !io.lsq.replaySlow.forward_data_valid))
  XSPerfAccumulate("replay_tlb_miss", io.lsq.replaySlow.valid && !io.lsq.replaySlow.tlb_hited)
  XSPerfAccumulate("replay_sl_vio", io.lsq.replaySlow.valid && io.lsq.replaySlow.tlb_hited && !io.lsq.replaySlow.st_ld_check_ok)
  XSPerfAccumulate("replay_cache_rej", io.lsq.replaySlow.valid && io.lsq.replaySlow.tlb_hited && io.lsq.replaySlow.st_ld_check_ok && !io.lsq.replaySlow.cache_no_replay)

  // -------------------------------------------------------------
  // Load Pipeline Stage 3
  // Do data merge and select, then writeback data
  // -------------------------------------------------------------

  val s3_valid = RegNext(s2_fire)
  val s3_load_wb_meta_reg = RegNext(Mux(dcacheHitLoadOutGen.valid, dcacheHitLoadOutGen.bits, io.lsq.ldout.bits))
  val s3_mmio = RegEnable(s2_mmio, s2_fire)

  val s3_delayedLoadError = WireInit(false.B)
  
  // data from load queue refill
  val s3_loadDataFromLQ = RegEnable(io.lsq.ldRawData, io.lsq.ldout.valid)
  val s3_rdataLQ = s3_loadDataFromLQ.mergedData()
  val s3_rdataSelLQ = LookupTree(s3_loadDataFromLQ.addrOffset, List(
    "b000".U -> s3_rdataLQ(63, 0),
    "b001".U -> s3_rdataLQ(63, 8),
    "b010".U -> s3_rdataLQ(63, 16),
    "b011".U -> s3_rdataLQ(63, 24),
    "b100".U -> s3_rdataLQ(63, 32),
    "b101".U -> s3_rdataLQ(63, 40),
    "b110".U -> s3_rdataLQ(63, 48),
    "b111".U -> s3_rdataLQ(63, 56)
  ))
  val s3_rdataPartialLoadLQ = rdataHelper(s3_loadDataFromLQ.uop, s3_rdataSelLQ)

  // data from dcache hit
  val s3_loadDataFromDcache = Wire(new LoadDataFromDcacheBundle)
  s3_loadDataFromDcache.dcacheData := io.dcache.resp.bits.data_delayed
  s3_loadDataFromDcache.forwardMask := RegEnable(s2_forwardMask, s2_valid)
  s3_loadDataFromDcache.forwardData := RegEnable(s2_forwardData, s2_valid)
  s3_loadDataFromDcache.uop := RegEnable(s2_uop_updated, s2_valid)
  s3_loadDataFromDcache.addrOffset := RegEnable(s2_paddr(2, 0), s2_valid)
  val s3_rdataDcache = s3_loadDataFromDcache.mergedData()
  val s3_rdataSelDcache = LookupTree(s3_loadDataFromDcache.addrOffset, List(
    "b000".U -> s3_rdataDcache(63, 0),
    "b001".U -> s3_rdataDcache(63, 8),
    "b010".U -> s3_rdataDcache(63, 16),
    "b011".U -> s3_rdataDcache(63, 24),
    "b100".U -> s3_rdataDcache(63, 32),
    "b101".U -> s3_rdataDcache(63, 40),
    "b110".U -> s3_rdataDcache(63, 48),
    "b111".U -> s3_rdataDcache(63, 56)
  ))
  val s3_rdataPartialLoadDcache = rdataHelper(s3_loadDataFromDcache.uop, s3_rdataSelDcache)

  // Inst will be canceled in store queue / lsq,
  // so we do not need to care about current flush in load / store unit's out.valid
  // TODO: ldout logic will be updated soon by LQ no data
  io.ldout.bits := s3_load_wb_meta_reg
  io.ldout.bits.data := Mux(RegNext(dcacheHitLoadOutGen.valid), s3_rdataPartialLoadDcache, s3_rdataPartialLoadLQ)
  io.ldout.valid := RegNext(dcacheHitLoadOutGen.valid) && !RegNext(s2_uop.robIdx.needFlush(io.redirect)) ||
    RegNext(io.lsq.ldout.valid) && !RegNext(io.lsq.ldout.bits.uop.robIdx.needFlush(io.redirect)) && !RegNext(dcacheHitLoadOutGen.valid)

  io.ldout.bits.uop.cf.exceptionVec(loadAccessFault) := s3_load_wb_meta_reg.uop.cf.exceptionVec(loadAccessFault) ||
    RegNext(dcacheHitLoadOutGen.valid) && s3_delayedLoadError

  // fast load to load forward
  io.fastpathOut.valid := s3_valid
  io.fastpathOut.data := s3_loadDataFromDcache.mergedData() // fastpath is for ld only

  // TODO: to be removed
  // * io.fastUop.valid should not be reported
  assert(!RegNext(io.feedbackFast.valid && !io.feedbackFast.bits.hit && io.fastUop.valid))

  // load forward_fail/ldld_violation check
  // check for inst in load pipeline
  val s3_forwardFail = RegNext(io.lsq.forward.matchInvalid || io.sbuffer.matchInvalid)
  val s3_ldldViolation = RegNext(
    io.lsq.loadViolationQuery.resp.valid &&
    io.lsq.loadViolationQuery.resp.bits.have_violation &&
    RegNext(io.csrCtrl.ldld_vio_check_enable)
  )
  val s3_needReplayFromFetch = s3_forwardFail || s3_ldldViolation
  val s3_canReplayFromFetch = RegEnable(s2_canReplayFromFetch, s2_fire)
  // 1) use load pipe check result generated in load_s3 iff load_hit
  when (RegNext(dcacheHitLoadOutGen.valid)) {
    io.ldout.bits.uop.ctrl.replayInst := s3_needReplayFromFetch
  }
  // 2) otherwise, write check result to load queue
  io.lsq.s3_replay_from_fetch := s3_needReplayFromFetch && s3_canReplayFromFetch

  // writeback access fault caused by ecc error / bus error
  //
  // * ecc data error is slow to generate, so we will not use it until load stage 3
  // * in load stage 3, an extra signal io.load_error will be used to
  //
  // now cache ecc error will raise an access fault
  // at the same time, error info (including error paddr) will be write to
  // an customized CSR "CACHE_ERROR"
  if (EnableAccurateLoadError) {
    io.s3_delayed_load_error := io.dcache.resp.bits.error_delayed &&
      io.csrCtrl.cache_error_enable &&
      RegNext(s2_fire)
  }
  // s3_delayedLoadError path is not used for now, as we writeback load result in load_s3
  // but we keep this path for future use
  io.s3_delayed_load_error := false.B
  io.lsq.s3_delayed_load_error := false.B

  io.lsq.ldout.ready := !dcacheHitLoadOutGen.valid

  // load trigger
  val lastValidData = RegEnable(io.ldout.bits.data, io.ldout.fire)
  val hitLoadAddrTriggerHitVec = Wire(Vec(3, Bool()))
  val lqLoadAddrTriggerHitVec = io.lsq.trigger.lqLoadAddrTriggerHitVec
  (0 until 3).map{i => {
    val tdata2 = io.trigger(i).tdata2
    val matchType = io.trigger(i).matchType
    val tEnable = io.trigger(i).tEnable

    hitLoadAddrTriggerHitVec(i) := TriggerCmp(s2_vaddr, tdata2, matchType, tEnable)
    io.trigger(i).addrHit := Mux(dcacheHitLoadOutGen.valid, hitLoadAddrTriggerHitVec(i), lqLoadAddrTriggerHitVec(i))
    io.trigger(i).lastDataHit := TriggerCmp(lastValidData, tdata2, matchType, tEnable)
  }}
  io.lsq.trigger.hitLoadAddrTriggerHitVec := hitLoadAddrTriggerHitVec

  val perfEvents = Seq(
    ("load_s0_fire            ", s0_fire),
    ("load_s1_fire            ", s1_fire),
    ("load_s2_fire            ", s2_fire),
    ("load_s3_fire            ", s3_valid),
    ("load_to_load_forward    ", s1_valid && s1_tryPointerChasing && !s1_cancelPointerChasing),
    ("stall_dcache            ", s0_valid && !io.dcache.req.ready),
    ("load_s1_tlbMiss         ", s1_fire && io.tlb.resp.bits.miss),
    ("load_s2_dcache_miss     ", s2_fire && io.dcache.resp.bits.miss),
  )
  generatePerfEvent()

  when(io.ldout.fire){
    XSDebug("ldout %x\n", io.ldout.bits.uop.cf.pc)
  }
}
