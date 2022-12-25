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

// Load Pipeline Stage 2
// DCache resp
class LoadUnit_S2(implicit p: Parameters) extends XSModule with HasLoadHelper with HasCircularQueuePtrHelper {
  val io = IO(new Bundle() {
    val in = Flipped(Decoupled(new LsPipelineBundle))
    val out = Decoupled(new LsPipelineBundle)
    val rsFeedback = ValidIO(new RSFeedback)
    val replaySlow = new LoadToLsqSlowIO
    val dcacheResp = Flipped(DecoupledIO(new DCacheWordResp))
    val pmpResp = Flipped(new PMPRespBundle())
    val lsq = new LoadForwardQueryIO
    val dataInvalidSqIdx = Input(UInt())
    val sbuffer = new LoadForwardQueryIO
    val dataForwarded = Output(Bool())
    val s2_dcache_require_replay = Output(Bool())
    val fullForward = Output(Bool())
    val dcache_kill = Output(Bool())
    val s3_delayed_load_error = Output(Bool())
    val loadViolationQueryResp = Flipped(Valid(new LoadViolationQueryResp))
    val csrCtrl = Flipped(new CustomCSRCtrlIO)
    val sentFastUop = Input(Bool())
    val static_pm = Input(Valid(Bool())) // valid for static, bits for mmio
    val s2_can_replay_from_fetch = Output(Bool()) // dirty code
    val loadDataFromDcache = Output(new LoadDataFromDcacheBundle)
    val reExecuteQuery = Flipped(Vec(StorePipelineWidth, Valid(new LoadReExecuteQueryIO)))
    val s1_needReExecute = Output(Bool())
    // val write_lq_safe = Output(Bool()) // used by duplicate wen signals
  })

  val pmp = WireInit(io.pmpResp)
  when (io.static_pm.valid) {
    pmp.ld := false.B
    pmp.st := false.B
    pmp.instr := false.B
    pmp.mmio := io.static_pm.bits
  }

  val s2_is_prefetch = io.in.bits.s0_isSoftPrefetch

  // exception that may cause load addr to be invalid / illegal
  //
  // if such exception happen, that inst and its exception info
  // will be force writebacked to rob
  val s2_exception_vec = WireInit(io.in.bits.uop.cf.exceptionVec)
  s2_exception_vec(loadAccessFault) := io.in.bits.uop.cf.exceptionVec(loadAccessFault) || pmp.ld
  // soft prefetch will not trigger any exception (but ecc error interrupt may be triggered)
  when (s2_is_prefetch) {
    s2_exception_vec := 0.U.asTypeOf(s2_exception_vec.cloneType)
  }
  val s2_exception = ExceptionNO.selectByFu(s2_exception_vec, lduCfg).asUInt.orR && !io.in.bits.tlbMiss // ????????

  // writeback access fault caused by ecc error / bus error
  //
  // * ecc data error is slow to generate, so we will not use it until load stage 3
  // * in load stage 3, an extra signal io.load_error will be used to

  // now cache ecc error will raise an access fault
  // at the same time, error info (including error paddr) will be write to
  // an customized CSR "CACHE_ERROR"
  if (EnableAccurateLoadError) {
    io.s3_delayed_load_error := io.dcacheResp.bits.error_delayed &&
      io.csrCtrl.cache_error_enable &&
      RegNext(io.out.valid)
  } else {
    io.s3_delayed_load_error := false.B
  }

  val actually_mmio = pmp.mmio
  val s2_uop = io.in.bits.uop
  val s2_mask = io.in.bits.mask
  val s2_paddr = io.in.bits.paddr
  val s2_tlb_miss = io.in.bits.tlbMiss
  val s2_mmio = !s2_is_prefetch && actually_mmio && !s2_exception
  val s2_cache_miss = io.dcacheResp.bits.miss
  val s2_cache_replay = io.dcacheResp.bits.replay
  val s2_cache_tag_error = io.dcacheResp.bits.tag_error
  val s2_forward_fail = io.lsq.matchInvalid || io.sbuffer.matchInvalid
  val s2_ldld_violation = io.loadViolationQueryResp.valid &&
    io.loadViolationQueryResp.bits.have_violation &&
    RegNext(io.csrCtrl.ldld_vio_check_enable)
  val s2_data_invalid = io.lsq.dataInvalid && !s2_ldld_violation && !s2_exception

  io.dcache_kill := pmp.ld || pmp.mmio // move pmp resp kill to outside
  io.dcacheResp.ready := true.B
  val dcacheShouldResp = !(s2_tlb_miss || s2_exception || s2_mmio || s2_is_prefetch)
  assert(!(io.in.valid && (dcacheShouldResp && !io.dcacheResp.valid)), "DCache response got lost")

  // merge forward result
  // lsq has higher priority than sbuffer
  val forwardMask = Wire(Vec(8, Bool()))
  val forwardData = Wire(Vec(8, UInt(8.W)))

  val fullForward = ((~forwardMask.asUInt).asUInt & s2_mask) === 0.U && !io.lsq.dataInvalid
  io.lsq := DontCare
  io.sbuffer := DontCare
  io.fullForward := fullForward

  // generate XLEN/8 Muxs
  for (i <- 0 until XLEN / 8) {
    forwardMask(i) := io.lsq.forwardMask(i) || io.sbuffer.forwardMask(i)
    forwardData(i) := Mux(io.lsq.forwardMask(i), io.lsq.forwardData(i), io.sbuffer.forwardData(i))
  }

  XSDebug(io.out.fire, "[FWD LOAD RESP] pc %x fwd %x(%b) + %x(%b)\n",
    s2_uop.cf.pc,
    io.lsq.forwardData.asUInt, io.lsq.forwardMask.asUInt,
    io.in.bits.forwardData.asUInt, io.in.bits.forwardMask.asUInt
  )

  // data merge
  // val rdataVec = VecInit((0 until XLEN / 8).map(j =>
  //   Mux(forwardMask(j), forwardData(j), io.dcacheResp.bits.data(8*(j+1)-1, 8*j))
  // )) // s2_rdataVec will be write to load queue
  // val rdata = rdataVec.asUInt
  // val rdataSel = LookupTree(s2_paddr(2, 0), List(
  //   "b000".U -> rdata(63, 0),
  //   "b001".U -> rdata(63, 8),
  //   "b010".U -> rdata(63, 16),
  //   "b011".U -> rdata(63, 24),
  //   "b100".U -> rdata(63, 32),
  //   "b101".U -> rdata(63, 40),
  //   "b110".U -> rdata(63, 48),
  //   "b111".U -> rdata(63, 56)
  // ))
  // val rdataPartialLoad = rdataHelper(s2_uop, rdataSel) // s2_rdataPartialLoad is not used

  io.out.valid := io.in.valid && !s2_tlb_miss && !s2_data_invalid && !io.s1_needReExecute
  // write_lq_safe is needed by dup logic
  // io.write_lq_safe := !s2_tlb_miss && !s2_data_invalid
  // Inst will be canceled in store queue / lsq,
  // so we do not need to care about flush in load / store unit's out.valid
  io.out.bits := io.in.bits
  // io.out.bits.data := rdataPartialLoad
  io.out.bits.data := 0.U // data will be generated in load_s3
  // when exception occurs, set it to not miss and let it write back to rob (via int port)
  if (EnableFastForward) {
    io.out.bits.miss := s2_cache_miss &&
      !s2_exception &&
      !fullForward &&
      !s2_is_prefetch
  } else {
    io.out.bits.miss := s2_cache_miss &&
      !s2_exception &&
      !s2_is_prefetch
  }
  io.out.bits.uop.ctrl.fpWen := io.in.bits.uop.ctrl.fpWen && !s2_exception

  // io.loadDataFromDcache.bankedDcacheData := io.dcacheResp.bits.bank_data
  // io.loadDataFromDcache.bank_oh := io.dcacheResp.bits.bank_oh
  /* 
  io.loadDataFromDcache.dcacheData := io.dcacheResp.bits.data
  io.loadDataFromDcache.forwardMask := forwardMask
  io.loadDataFromDcache.forwardData := forwardData
  io.loadDataFromDcache.uop := io.out.bits.uop
  io.loadDataFromDcache.addrOffset := s2_paddr(2, 0)
  */
  io.loadDataFromDcache.dcacheData := io.dcacheResp.bits.data_delayed
  io.loadDataFromDcache.forwardMask := RegEnable(forwardMask, io.in.valid)
  io.loadDataFromDcache.forwardData := RegEnable(forwardData, io.in.valid)
  io.loadDataFromDcache.uop := RegEnable(io.out.bits.uop, io.in.valid)
  io.loadDataFromDcache.addrOffset := RegEnable(s2_paddr(2, 0), io.in.valid)

  io.s2_can_replay_from_fetch := !s2_mmio && !s2_is_prefetch && !s2_tlb_miss
  // if forward fail, replay this inst from fetch
  val debug_forwardFailReplay = s2_forward_fail && !s2_mmio && !s2_is_prefetch && !s2_tlb_miss
  // if ld-ld violation is detected, replay from this inst from fetch
  val debug_ldldVioReplay = s2_ldld_violation && !s2_mmio && !s2_is_prefetch && !s2_tlb_miss
  // io.out.bits.uop.ctrl.replayInst := false.B

  io.out.bits.mmio := s2_mmio
  io.out.bits.uop.ctrl.flushPipe := s2_mmio && io.sentFastUop
  io.out.bits.uop.cf.exceptionVec := s2_exception_vec // cache error not included

  // For timing reasons, sometimes we can not let
  // io.out.bits.miss := s2_cache_miss && !s2_exception && !fullForward
  // We use io.dataForwarded instead. It means:
  // 1. Forward logic have prepared all data needed,
  //    and dcache query is no longer needed.
  // 2. ... or data cache tag error is detected, this kind of inst
  //    will not update miss queue. That is to say, if miss, that inst
  //    may not be refilled
  // Such inst will be writebacked from load queue.
  io.dataForwarded := s2_cache_miss && !s2_exception &&
    (fullForward || io.csrCtrl.cache_error_enable && s2_cache_tag_error)
  // io.out.bits.forwardX will be send to lq
  io.out.bits.forwardMask := forwardMask
  // data from dcache is not included in io.out.bits.forwardData
  io.out.bits.forwardData := forwardData

  io.in.ready := io.out.ready || !io.in.valid


  // st-ld violation query
  val s2_needReExecuteVec = Wire(Vec(StorePipelineWidth, Bool()))  
  val s2_needReExecute = Wire(Bool())

  for (i <- 0 until StorePipelineWidth) {
    //  NeedFastRecovery Valid when 
    //  1. Fast recovery query request Valid.
    //  2. Load instruction is younger than requestors(store instructions).
    //  3. Physical address match. 
    //  4. Data contains.
    s2_needReExecuteVec(i) := io.reExecuteQuery(i).valid &&
                              isAfter(io.in.bits.uop.robIdx, io.reExecuteQuery(i).bits.robIdx) && 
                              !s2_tlb_miss &&
                              (s2_paddr(PAddrBits-1,3) === io.reExecuteQuery(i).bits.paddr(PAddrBits-1, 3)) && 
                              (s2_mask & io.reExecuteQuery(i).bits.mask).orR 
  }
  s2_needReExecute := s2_needReExecuteVec.asUInt.orR

  // feedback tlb result to RS
  io.rsFeedback.valid := false.B
  val s2_need_replay_from_rs = Wire(Bool())
  if (EnableFastForward) {
    s2_need_replay_from_rs :=
      s2_needReExecute ||
      s2_tlb_miss || // replay if dtlb miss
      s2_cache_replay && !s2_is_prefetch && !s2_mmio && !s2_exception && !fullForward || // replay if dcache miss queue full / busy
      s2_data_invalid && !s2_is_prefetch // replay if store to load forward data is not ready
  } else {
    // Note that if all parts of data are available in sq / sbuffer, replay required by dcache will not be scheduled
    s2_need_replay_from_rs :=
      s2_needReExecute ||
      s2_tlb_miss || // replay if dtlb miss
      s2_cache_replay && !s2_is_prefetch && !s2_mmio && !s2_exception && !io.dataForwarded || // replay if dcache miss queue full / busy
      s2_data_invalid && !s2_is_prefetch // replay if store to load forward data is not ready
  }
  io.rsFeedback.bits.hit := !s2_need_replay_from_rs
  io.rsFeedback.bits.rsIdx := io.in.bits.rsIdx
  io.rsFeedback.bits.flushState := io.in.bits.ptwBack
  // feedback source priority: tlbMiss > dataInvalid > mshrFull
  // general case priority: tlbMiss > exception (include forward_fail / ldld_violation) > mmio > dataInvalid > mshrFull > normal miss / hit
  io.rsFeedback.bits.sourceType := Mux(s2_tlb_miss, RSFeedbackType.tlbMiss,
    Mux(s2_data_invalid,
      RSFeedbackType.dataInvalid,
      RSFeedbackType.mshrFull
    )
  )
  io.rsFeedback.bits.dataInvalidSqIdx.value := io.dataInvalidSqIdx
  io.rsFeedback.bits.dataInvalidSqIdx.flag := DontCare

  io.replaySlow.valid := io.in.valid
  io.replaySlow.tlb_hited := !s2_tlb_miss
  io.replaySlow.st_ld_check_ok := !s1_needReExecute
  if (EnableFastForward) {
    io.replaySlow.cache_no_replay := !s2_cache_replay || s2_is_prefetch || s2_mmio || s2_exception || fullForward
  }else {
    io.replaySlow.cache_no_replay := !s2_cache_replay || s2_is_prefetch || s2_mmio || s2_exception || io.dataForwarded
  }
  io.replaySlow.forward_data_valid := !s2_data_invalid || s2_is_prefetch
  io.replaySlow.ld_idx := io.in.bits.uop.lqIdx.value
  io.replaySlow.data_invalid_sq_idx := io.dataInvalidSqIdx
  io.replaySlow.replayCarry := io.dcacheResp.bits.replayCarry

  // s2_cache_replay is quite slow to generate, send it separately to LQ
  if (EnableFastForward) {
    io.s2_dcache_require_replay := s2_cache_replay && !fullForward
  } else {
    io.s2_dcache_require_replay := s2_cache_replay &&
      s2_need_replay_from_rs &&
      !io.dataForwarded &&
      !s2_is_prefetch &&
      io.out.bits.miss
  }

  XSPerfAccumulate("in_valid", io.in.valid)
  XSPerfAccumulate("in_fire", io.in.fire)
  XSPerfAccumulate("in_fire_first_issue", io.in.fire && io.in.bits.isFirstIssue)
  XSPerfAccumulate("dcache_miss", io.in.fire && s2_cache_miss)
  XSPerfAccumulate("dcache_miss_first_issue", io.in.fire && s2_cache_miss && io.in.bits.isFirstIssue)
  XSPerfAccumulate("full_forward", io.in.valid && fullForward)
  XSPerfAccumulate("dcache_miss_full_forward", io.in.valid && s2_cache_miss && fullForward)
  XSPerfAccumulate("replay",  io.rsFeedback.valid && !io.rsFeedback.bits.hit)
  XSPerfAccumulate("replay_tlb_miss", io.rsFeedback.valid && !io.rsFeedback.bits.hit && s2_tlb_miss)
  XSPerfAccumulate("replay_cache", io.rsFeedback.valid && !io.rsFeedback.bits.hit && !s2_tlb_miss && s2_cache_replay)
  XSPerfAccumulate("stall_out", io.out.valid && !io.out.ready)
  XSPerfAccumulate("replay_from_fetch_forward", io.out.valid && debug_forwardFailReplay)
  XSPerfAccumulate("replay_from_fetch_load_vio", io.out.valid && debug_ldldVioReplay)

  XSPerfAccumulate("replay_lq",  io.replaySlow.valid && (!io.replaySlow.tlb_hited || !io.replaySlow.cache_no_replay || !io.replaySlow.forward_data_valid))
  XSPerfAccumulate("replay_tlb_miss_lq", io.replaySlow.valid && !io.replaySlow.tlb_hited)
  XSPerfAccumulate("replay_sl_vio", io.replaySlow.valid && io.replaySlow.tlb_hited && !io.replaySlow.st_ld_check_ok)
  XSPerfAccumulate("replay_cache_lq", io.replaySlow.valid && io.replaySlow.tlb_hited && io.replaySlow.st_ld_check_ok && !io.replaySlow.cache_no_replay)
}

class LoadUnit(implicit p: Parameters) extends XSModule
  with HasLoadHelper
  with HasPerfEvents
  with HasDCacheParameters
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
    // Note that io.s3_delayed_load_error and io.lsq.s3_delayed_load_error is different

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
  val s0_uop = Wire(new MicroOp)
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
  
  // io.s0_sqIdx := s0_sqIdx
  
  s0_valid := io.ldin.valid || io.lsqOut.valid || s0_tryFastpath
  
  // assign default value
  s0_uop := DontCare

  // generate vaddr and ctrl signal for pointerchasing
  // we try pointerchasing when (1. no rs-issued load and 2. no LSQ replayed load)
  val s0_tryPointerChasing = !io.ldin.valid && !io.lsqOut.valid && io.fastpathIn.valid
  val s0_pointerChasingVaddrOffset = io.fastpathIn.data(5, 0) +& io.loadFastImm(5, 0)
  val s0_pointerChasingVaddr := Cat(io.fastpathIn.data(XLEN-1, 6), s0_pointerChasingVaddrOffset(5,0))
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
  io.ldin.ready := !io.ldin.valid || (io.out.ready && io.dcache.req.ready)
  // io.lsqOut (input from load replay queue) can fire only when there in no RS-issued load
  io.lsqOut.ready := (io.out.ready && io.dcache.req.ready && !io.ldin.valid)
  s0_isLoadReplay := !io.ldin.valid && io.lsqOut.valid
  
  // address alignment check
  val s0_addrAligned = LookupTree(s0_uop.ctrl.fuOpType(1, 0), List(
    "b00".U   -> true.B,                   //b
    "b01".U   -> (s0_vaddr(0)    === 0.U), //h
    "b10".U   -> (s0_vaddr(1, 0) === 0.U), //w
    "b11".U   -> (s0_vaddr(2, 0) === 0.U)  //d
  ))

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

  // load unit will accept at least 1 input if dcache is ready to 
  s0_fire := s0_valid && io.dcache.req.ready && !s0_kill
  s0_flush := s0_uop.robIdx.needFlush(io.redirect) // && !s0_tryPointerChasing

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
  val s1_uop_update = WireInit(s1_uop)
  val s1_loadAddrMisaligned = RegEnable(!s0_addrAligned, s0_fire)
  val s1_rsIdx = WireInit(RegEnable(s0_rsIdx, s0_fire)) // may be overwritten by l2l
  val s1_isFirstIssue = WireInit(RegEnable(s0_isFirstIssue, s0_fire)) // may be overwritten by l2l
  val s1_isSoftPrefetch = RegEnable(s0_isSoftPrefetch, s0_fire)
  val s1_isLoadReplay = RegEnable(s0_isLoadReplay, s0_fire)
  val s1_paddr_dup_lsu = WireInit(io.tlb.resp.bits.paddr(0)) // may be overwritten by l2l
  val s1_paddr_dup_dcache = WireInit(io.tlb.resp.bits.paddr(1)) // may be overwritten by l2l
  // af & pf exception were modified below.
  val s1_exception = ExceptionNO.selectByFu(s1_uop.cf.exceptionVec, lduCfg).asUInt.orR
  val s1_tlb_miss = io.tlb.resp.bits.miss
  val s1_bank_conflict = io.dcache.s1_bank_conflict

  // Note: s1_uop and some other ctrl info have multiple sources
  // source 1: uop from load_s0-load_s1 pipeline reg
  // source 2: l2l uop from load_s0, if l2l path is working and l2l inst has come to load_s1

  // TODO: forwardXX field will be updated in s1

  io.tlb.resp.ready := true.B

  // provide paddr and vaddr for lq
  io.lsq.loadPaddrIn.valid := s1_fire
  io.lsq.loadPaddrIn.bits.lqIdx := s1_uop.lqIdx
  io.lsq.loadPaddrIn.bits.paddr := s1_paddr_dup_lsu

  io.lsq.loadVaddrIn.valid := s1_valid && !s1_kill
  io.lsq.loadVaddrIn.bits.lqIdx := s1_uop.lqIdx
  io.lsq.loadVaddrIn.bits.vaddr := s1_vaddr
  
  // provide paddr for dcache
  io.dcache.s1_paddr_dup_lsu := s1_paddr_dup_lsu
  io.dcache.s1_paddr_dup_dcache := s1_paddr_dup_dcache 

  // cancel dcache access for safety reasons
  // cancel dcache access if:
  // 1. tlb miss
  // 2. exception 
  //io.dcache.s1_kill := s1_tlb_miss || s1_exception || s1_mmio
  io.dcache.s1_kill := s1_tlb_miss || s1_exception || s1_kill

  // load forward query datapath
  // query sbuffer
  io.sbuffer.valid := s1_valid && !(s1_exception || s1_tlb_miss || s1_kill)
  io.sbuffer.vaddr := s1_vaddr
  io.sbuffer.paddr := s1_paddr_dup_lsu
  io.sbuffer.uop := s1_uop
  io.sbuffer.sqIdx := s1_uop.sqIdx
  io.sbuffer.mask := s1_mask
  io.sbuffer.pc := s1_uop.cf.pc // for debug only
  // query store queue
  io.lsq.forward.valid := s1_valid && !(s1_exception || s1_tlb_miss || s1_kill)
  io.lsq.forward.vaddr := s1_vaddr
  io.lsq.forward.paddr := s1_paddr_dup_lsu
  io.lsq.forward.uop := s1_uop
  io.lsq.forward.sqIdx := s1_uop.sqIdx
  io.lsq.forward.sqIdxMask := DontCare // will be overwritten by sqIdxMask pre-generated in s0
  io.lsq.forward.mask := s1_mask
  io.lsq.forward.pc := s1_uop.cf.pc // for debug only

  // ld-ld violation query
  io.lsq.loadViolationQuery.req.valid := s1_valid && !(s1_exception || s1_tlb_miss || s1_kill)
  io.lsq.loadViolationQuery.req.bits.paddr := s1_paddr_dup_lsu
  io.lsq.loadViolationQuery.req.bits.uop := s1_uop

  // st-ld violation query
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
                          !s1_tlb_miss &&
                          (s1_paddr_dup_lsu(PAddrBits-1, 3) === io.reExecuteQuery(w).bits.paddr(PAddrBits-1, 3)) &&
                          (s1_mask & io.reExecuteQuery(w).bits.mask).orR
  }
  s1_needReExecute := s1_needReExecuteVec.asUInt.orR
  io.s1_needReExecute := s1_needReExecute

  val s1_ptwBack = io.dtlb.resp.bits.ptwBack

  // Generate forwardMaskFast to wake up insts earlier, not used for now
  // val s1_forwardMaskFast = io.lsq.forward.forwardMaskFast.asUInt | io.sbuffer.forwardMaskFast.asUInt
  // val s1_fullForwardFast = ((~forwardMaskFast).asUInt & s1_mask) === 0.U

  // Generate feedback signal caused by:
  // * dcache bank conflict
  // * need redo ld-ld violation check
  val s1_needLdVioCheckRedo = io.lsq.loadViolationQuery.req.valid &&
    !io.lsq.loadViolationQuery.req.ready &&
    RegNext(io.csrCtrl.ldld_vio_check_enable)

  // Outdated: feedback bank conflict / ld-vio check struct hazard to rs, to be removed
  io.rsFeedback.valid := RegNext(
    Mux(s1_isLoadReplay, false.B, s1_valid && !s1_kill) &&
    && !s1_uop.robIdx.needFlush(io.redirect)
  )
  io.rsFeedback.bits.hit := true.B // we have found s1_bank_conflict / re do ld-ld violation check
  io.rsFeedback.bits.rsIdx := RegNext(s1_rsIdx)
  io.rsFeedback.bits.flushState := DontCare
  io.rsFeedback.bits.sourceType := RegNext(Mux(s1_bank_conflict, RSFeedbackType.bankConflict, RSFeedbackType.ldVioCheckRedo))
  io.rsFeedback.bits.dataInvalidSqIdx := DontCare

  // Load inst fast replay request
  io.replayFast.valid := s1_valid && !s1_kill
  io.replayFast.ld_ld_check_ok := !s1_needLdVioCheckRedo
  io.replayFast.st_ld_check_ok := !s1_needReExecute
  io.replayFast.cache_bank_no_conflict := !s1_bank_conflict
  io.replayFast.ld_idx := io.in.bits.uop.lqIdx.value

  // if replay is detected in load_s1,
  // load inst will be canceled immediately
  s1_fire := s1_valid && (!s1_needLdVioCheckRedo && !s1_bank_conflict && !s1_needReExecute) && !s1_kill

  // current ori test will cause the case of ldest == 0, below will be modifeid in the future.
  // af & pf exception
  val s1_loadPageFault = io.tlb.resp.bits.excp(0).pf.ld
  val s1_loadAccessFault = io.tlb.resp.bits.excp(0).af.ld

  s1_flush := s1_uop.robIdx.needFlush(io.redirect) || s1_cancelPointerChasing

  // s1 pointer tracing logic
  val s1_tryPointerChasing = RegNext(s0_doTryPointerChasing, false.B)
  val s1_pointerChasingVAddr = RegEnable(s0_pointerChasingVaddrOffset, s0_doTryPointerChasing)
  val s1_cancelPointerChasing = WireInit(false.B)
  val s1_spec_vaddr = RegNext(s0_vaddr)
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
    }
    when (s1_cancelPointerChasing) {
      s1_kill := true.B
    }.otherwise {
      s0_kill := s1_tryPointerChasing // uop for l2l is already in s1, kill uop in s0
      when (s1_tryPointerChasing) {
        io.ldin.ready := true.B // accept current uop if we are trying pointer tracing in load_s1
      }
    }
    
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
  XSPerfAccumulate("s1_tlb_miss", s1_fire && s1_tlb_miss)
  XSPerfAccumulate("s1_tlb_miss_first_issue", s1_fire && s1_tlb_miss && s1_isFirstIssue)

  // -------------------------------------------------------------
  // Load Pipeline Stage 2
  // Read dcache data SRAM, start to update LQ
  // -------------------------------------------------------------

  val s2_valid = RegNext(s1_fire && !s1_flush)
  val s2_paddr = RegEnable(s1_paddr_dup_lsu, s1_fire)
  val s2_tlbMiss = RegEnable(s1_tlb_miss)
  val s2_ptwBack = RegEnable(io.tlb.resp.bits.ptwBack, s1_fire)
  val s2_rsIdx = RegEnable(s1_rsIdx, s1_fire)
  val s2_isSoftPrefetch = RegEnable(s1_isSoftPrefetch, s1_fire)
 
  // load s2
  io.dcache.s2_kill := load_s2.io.dcache_kill // to kill mmio resp which are redirected
  load_s2.io.dcacheResp <> io.dcache.resp
  load_s2.io.pmpResp <> io.pmp
  load_s2.io.static_pm := RegNext(io.tlb.resp.bits.static_pm)
  load_s2.io.lsq.forwardData <> io.lsq.forward.forwardData
  load_s2.io.lsq.forwardMask <> io.lsq.forward.forwardMask
  load_s2.io.lsq.forwardMaskFast <> io.lsq.forward.forwardMaskFast // should not be used in load_s2
  load_s2.io.lsq.dataInvalid <> io.lsq.forward.dataInvalid
  load_s2.io.lsq.matchInvalid <> io.lsq.forward.matchInvalid
  load_s2.io.sbuffer.forwardData <> io.sbuffer.forwardData
  load_s2.io.sbuffer.forwardMask <> io.sbuffer.forwardMask
  load_s2.io.sbuffer.forwardMaskFast <> io.sbuffer.forwardMaskFast // should not be used in load_s2
  load_s2.io.sbuffer.dataInvalid <> io.sbuffer.dataInvalid // always false
  load_s2.io.sbuffer.matchInvalid <> io.sbuffer.matchInvalid
  load_s2.io.dataForwarded <> io.lsq.s2_load_data_forwarded
  load_s2.io.dataInvalidSqIdx := io.lsq.forward.dataInvalidSqIdx // provide dataInvalidSqIdx to make wakeup faster
  load_s2.io.loadViolationQueryResp <> io.lsq.loadViolationQuery.resp
  load_s2.io.csrCtrl <> io.csrCtrl
  load_s2.io.sentFastUop := io.fastUop.valid
  load_s2.io.reExecuteQuery := io.reExecuteQuery

  // pre-calcuate sqIdx mask in s0, then send it to lsq in s1 for forwarding
  val sqIdxMaskReg = RegNext(UIntToMask(load_s0.io.s0_sqIdx.value, StoreQueueSize)) 
  // to enable load-load, sqIdxMask must be calculated based on ldin.uop
  // If the timing here is not OK, load-load forwarding has to be disabled.
  // Or we calculate sqIdxMask at RS??
  io.lsq.forward.sqIdxMask := sqIdxMaskReg
  if (EnableLoadToLoadForward) {
    when (s1_tryPointerChasing) {
      io.lsq.forward.sqIdxMask := UIntToMask(io.ldin.bits.uop.sqIdx.value, StoreQueueSize)
    }
  }

  // // use s2_hit_way to select data received in s1
  // load_s2.io.dcacheResp.bits.data := Mux1H(RegNext(io.dcache.s1_hit_way), RegNext(io.dcache.s1_data))
  // assert(load_s2.io.dcacheResp.bits.data === io.dcache.resp.bits.data)

  // now io.fastUop.valid is sent to RS in load_s2
  val s2_dcache_hit = io.dcache.s2_hit // dcache hit dup in lsu side

  io.fastUop.valid := RegNext(
      !io.dcache.s1_disable_fast_wakeup &&  // load fast wakeup should be disabled when dcache data read is not ready
      s1_valid && // valid load request
      !s1_kill && // killed by load-load forwarding
      !io.tlb.resp.bits.fast_miss && // not mmio or tlb miss, pf / af not included here
      !io.lsq.forward.dataInvalidFast // forward failed
    ) && 
    !RegNext(s1_needLdVioCheckRedo) && // load-load violation check: load paddr cam struct hazard
    !RegNext(s1_needReExecute) &&
    !RegNext(s1_uop.robIdx.needFlush(io.redirect)) &&
    (s2_valid && !s2_needReExecute && s2_dcache_hit) // dcache hit in lsu side
  
  io.fastUop.bits := RegNext(load_s1.io.out.bits.uop)

  XSDebug(load_s0.io.out.valid,
    p"S0: pc ${Hexadecimal(load_s0.io.out.bits.uop.cf.pc)}, lId ${Hexadecimal(load_s0.io.out.bits.uop.lqIdx.asUInt)}, " +
    p"vaddr ${Hexadecimal(load_s0.io.out.bits.vaddr)}, mask ${Hexadecimal(load_s0.io.out.bits.mask)}\n")
  XSDebug(load_s1.io.out.valid,
    p"S1: pc ${Hexadecimal(load_s1.io.out.bits.uop.cf.pc)}, lId ${Hexadecimal(load_s1.io.out.bits.uop.lqIdx.asUInt)}, tlb_miss ${io.tlb.resp.bits.miss}, " +
    p"paddr ${Hexadecimal(load_s1.io.out.bits.paddr)}, mmio ${load_s1.io.out.bits.mmio}\n")

  // writeback to LSQ
  // Current dcache use MSHR
  // Load queue will be updated at s2 for both hit/miss int/fp load
  io.lsq.loadIn.valid := load_s2.io.out.valid
  // generate LqWriteBundle from LsPipelineBundle
  io.lsq.loadIn.bits.fromLsPipelineBundle(load_s2.io.out.bits)
  
  io.lsq.replayFast := load_s1.io.replayFast
  io.lsq.replaySlow := load_s2.io.replaySlow
  io.lsq.replaySlow.valid := load_s2.io.replaySlow.valid && !load_s2.io.out.bits.uop.robIdx.needFlush(io.redirect)
  
  // generate duplicated load queue data wen
  val load_s2_valid_vec = RegInit(0.U(6.W))
  val load_s2_leftFire = load_s1.io.out.valid && load_s2.io.in.ready
  // val write_lq_safe = load_s2.io.write_lq_safe
  load_s2_valid_vec := 0x0.U(6.W)
  when (load_s2_leftFire) { load_s2_valid_vec := 0x3f.U(6.W)}
  when (load_s1.io.out.bits.uop.robIdx.needFlush(io.redirect)) { load_s2_valid_vec := 0x0.U(6.W) }
  assert(RegNext(load_s2.io.in.valid === load_s2_valid_vec(0)))
  io.lsq.loadIn.bits.lq_data_wen_dup := load_s2_valid_vec.asBools()

  // s2_dcache_require_replay signal will be RegNexted, then used in s3
  io.lsq.s2_dcache_require_replay := load_s2.io.s2_dcache_require_replay

  // write to rob and writeback bus
  val s2_wb_valid = load_s2.io.out.valid && !load_s2.io.out.bits.miss && !load_s2.io.out.bits.mmio

  // Int load, if hit, will be writebacked at s2
  val hitLoadOut = Wire(Valid(new ExuOutput))
  hitLoadOut.valid := s2_wb_valid
  hitLoadOut.bits.uop := load_s2.io.out.bits.uop
  hitLoadOut.bits.data := load_s2.io.out.bits.data
  hitLoadOut.bits.redirectValid := false.B
  hitLoadOut.bits.redirect := DontCare
  hitLoadOut.bits.debug.isMMIO := load_s2.io.out.bits.mmio
  hitLoadOut.bits.debug.isPerfCnt := false.B
  hitLoadOut.bits.debug.paddr := load_s2.io.out.bits.paddr
  hitLoadOut.bits.debug.vaddr := load_s2.io.out.bits.vaddr
  hitLoadOut.bits.fflags := DontCare

  load_s2.io.out.ready := true.B

  // load s3
  val s3_load_wb_meta_reg = RegNext(Mux(hitLoadOut.valid, hitLoadOut.bits, io.lsq.ldout.bits))

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
  val s3_loadDataFromDcache = load_s2.io.loadDataFromDcache
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

  io.ldout.bits := s3_load_wb_meta_reg
  io.ldout.bits.data := Mux(RegNext(hitLoadOut.valid), s3_rdataPartialLoadDcache, s3_rdataPartialLoadLQ)
  io.ldout.valid := RegNext(hitLoadOut.valid) && !RegNext(load_s2.io.out.bits.uop.robIdx.needFlush(io.redirect)) ||
    RegNext(io.lsq.ldout.valid) && !RegNext(io.lsq.ldout.bits.uop.robIdx.needFlush(io.redirect)) && !RegNext(hitLoadOut.valid)

  io.ldout.bits.uop.cf.exceptionVec(loadAccessFault) := s3_load_wb_meta_reg.uop.cf.exceptionVec(loadAccessFault) ||
    RegNext(hitLoadOut.valid) && load_s2.io.s3_delayed_load_error

  // fast load to load forward
  io.fastpathOut.valid := RegNext(load_s2.io.out.valid) // for debug only
  io.fastpathOut.data := s3_loadDataFromDcache.mergedData() // fastpath is for ld only

  // feedback tlb miss / dcache miss queue full
  io.feedbackSlow.bits := RegNext(load_s2.io.rsFeedback.bits)
  io.feedbackSlow.valid := RegNext(load_s2.io.rsFeedback.valid && !load_s2.io.out.bits.uop.robIdx.needFlush(io.redirect))
  // If replay is reported at load_s1, inst will be canceled (will not enter load_s2),
  // in that case:
  // * replay should not be reported twice
  assert(!(RegNext(io.feedbackFast.valid) && io.feedbackSlow.valid))
  // * io.fastUop.valid should not be reported
  assert(!RegNext(io.feedbackFast.valid && !io.feedbackFast.bits.hit && io.fastUop.valid))

  // load forward_fail/ldld_violation check
  // check for inst in load pipeline
  val s3_forward_fail = RegNext(io.lsq.forward.matchInvalid || io.sbuffer.matchInvalid)
  val s3_ldld_violation = RegNext(
    io.lsq.loadViolationQuery.resp.valid &&
    io.lsq.loadViolationQuery.resp.bits.have_violation &&
    RegNext(io.csrCtrl.ldld_vio_check_enable)
  )
  val s3_need_replay_from_fetch = s3_forward_fail || s3_ldld_violation
  val s3_can_replay_from_fetch = RegEnable(load_s2.io.s2_can_replay_from_fetch, load_s2.io.out.valid)
  // 1) use load pipe check result generated in load_s3 iff load_hit
  when (RegNext(hitLoadOut.valid)) {
    io.ldout.bits.uop.ctrl.replayInst := s3_need_replay_from_fetch
  }
  // 2) otherwise, write check result to load queue
  io.lsq.s3_replay_from_fetch := s3_need_replay_from_fetch && s3_can_replay_from_fetch

  // s3_delayed_load_error path is not used for now, as we writeback load result in load_s3
  // but we keep this path for future use
  io.s3_delayed_load_error := false.B
  io.lsq.s3_delayed_load_error := false.B //load_s2.io.s3_delayed_load_error

  io.lsq.ldout.ready := !hitLoadOut.valid

  when(io.feedbackSlow.valid && !io.feedbackSlow.bits.hit){
    // when need replay from rs, inst should not be writebacked to rob
    assert(RegNext(!hitLoadOut.valid))
    assert(RegNext(!io.lsq.loadIn.valid) || RegNext(load_s2.io.s2_dcache_require_replay))
  }

  val lastValidData = RegEnable(io.ldout.bits.data, io.ldout.fire)
  val hitLoadAddrTriggerHitVec = Wire(Vec(3, Bool()))
  val lqLoadAddrTriggerHitVec = io.lsq.trigger.lqLoadAddrTriggerHitVec
  (0 until 3).map{i => {
    val tdata2 = io.trigger(i).tdata2
    val matchType = io.trigger(i).matchType
    val tEnable = io.trigger(i).tEnable

    hitLoadAddrTriggerHitVec(i) := TriggerCmp(load_s2.io.out.bits.vaddr, tdata2, matchType, tEnable)
    io.trigger(i).addrHit := Mux(hitLoadOut.valid, hitLoadAddrTriggerHitVec(i), lqLoadAddrTriggerHitVec(i))
    io.trigger(i).lastDataHit := TriggerCmp(lastValidData, tdata2, matchType, tEnable)
  }}
  io.lsq.trigger.hitLoadAddrTriggerHitVec := hitLoadAddrTriggerHitVec

  val perfEvents = Seq(
    ("load_s0_in_fire         ", load_s0.io.in.fire                                                                                                              ),
    ("load_to_load_forward    ", load_s1.io.out.valid && s1_tryPointerChasing && !s1_cancelPointerChasing                                                           ),
    ("stall_dcache            ", load_s0.io.out.valid && load_s0.io.out.ready && !io.dcache.req.ready                                                     ),
    ("load_s1_in_fire         ", load_s1.io.in.fire                                                                                                              ),
    ("load_s1_tlb_miss        ", load_s1.io.in.fire && io.tlb.resp.bits.miss                                                                             ),
    ("load_s2_in_fire         ", load_s2.io.in.fire                                                                                                              ),
    ("load_s2_dcache_miss     ", load_s2.io.in.fire && load_s2.io.dcacheResp.bits.miss                                                                           ),
    ("load_s2_replay          ", load_s2.io.rsFeedback.valid && !load_s2.io.rsFeedback.bits.hit                                                                  ),
    ("load_s2_replay_tlb_miss ", load_s2.io.rsFeedback.valid && !load_s2.io.rsFeedback.bits.hit && load_s2.io.in.bits.tlbMiss                                    ),
    ("load_s2_replay_cache    ", load_s2.io.rsFeedback.valid && !load_s2.io.rsFeedback.bits.hit && !load_s2.io.in.bits.tlbMiss && load_s2.io.dcacheResp.bits.miss),
  )
  generatePerfEvent()

  when(io.ldout.fire){
    XSDebug("ldout %x\n", io.ldout.bits.uop.cf.pc)
  }
}
