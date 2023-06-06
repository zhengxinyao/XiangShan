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
import xiangshan.ExceptionNO._
import xiangshan._
import xiangshan.backend.fu.PMPRespBundle
import xiangshan.backend.rob.{DebugLsInfoBundle, LsTopdownInfo, RobPtr}
import xiangshan.cache._
import xiangshan.cache.dcache.ReplayCarry
import xiangshan.cache.mmu.{TlbCmd, TlbReq, TlbRequestIO, TlbResp}
import xiangshan.mem.mdp._


class MixedFlow_WriteBack(implicit p: Parameters) extends XSModule {
  val io = IO(new Bundle() {
    val redirect = Flipped(Valid(new Redirect))
    // flow in
    val in = Flipped(Decoupled(new ExuOutput()))
    // flow out
    val out = DecoupledIO(new ExuOutput)
  })

  io.in.ready := true.B

  val SelectGroupSize = RollbackGroupSize
  val lgSelectGroupSize = log2Ceil(SelectGroupSize)
  val TotalSelectCycles = scala.math.ceil(log2Ceil(LoadQueueRAWSize).toFloat / lgSelectGroupSize).toInt + 1

  // delay TotalSelectCycles - 2 cycle(s)
  var valid = io.in.valid
  var bits = io.in.bits

  for (i <- 0 until TotalSelectCycles - 2) {
    valid = RegNext(valid && !bits.uop.robIdx.needFlush(io.redirect))
    bits = RegNext(bits)
  }
  io.out.valid := valid && !bits.uop.robIdx.needFlush(io.redirect)
  io.out.bits := bits  
}

class MixedFlow(implicit p: Parameters) extends XSModule 
  with HasLoadHelper
  with HasPerfEvents
  with HasDCacheParameters
  with HasCircularQueuePtrHelper
{

  val io = IO(new Bundle() {
    val redirect = Flipped(Valid(new Redirect))
    val csrCtrl = Flipped(new CustomCSRCtrlIO)

    // flow in
    val in = Flipped(Decoupled(new ExuInput))
    val rsIdx = Input(UInt(log2Up(IssQueSize).W))
    val isFirstIssue = Input(Bool())

    // flow out
    val out_toRS = Decoupled(new ExuOutput) // to RS
    val out_toROB = Decoupled(new ExuOutput) // to ROB

    // load flow io
    val loadFlowIO = new Bundle() {
      val sbuffer = new LoadForwardQueryIO
      val lsq = new LoadForwardQueryIO

      // early wakeup signal generated in load_s1, send to RS in load_s2
      val fastUop = ValidIO(new MicroOp) 

      // load trigger
      val trigger = Vec(3, new LoadFlowTriggerIO)

      // refill
      val refill = Flipped(ValidIO(new Refill))

      // bus data forward
      val tlDchannel = Input(new DcacheToLduForwardIO)
      val forward_mshr = Flipped(new LduToMissqueueForwardIO)

      // provide prefetch info
      val prefetch_train = ValidIO(new LdPrefetchTrainBundle())
      // hardware prefetch to l1 cache req
      val prefetch_req = Flipped(ValidIO(new L1PrefetchReq))

      // load to load fast path
      val fastpathIn = Input(new LoadToLoadIO)
      val fastpathOut = Output(new LoadToLoadIO)
      val loadFastMatch = Input(Bool())
      val loadFastImm = Input(UInt(12.W))

      // provide right pc for hw prefetch
      val s2IsPointerChasing = Output(Bool()) 

      // load ecc error
      val s3_delayedLoadError = Output(Bool()) // Note that io.s3_delayed_load_error and io.lsq.s3_delayed_load_error is different

      // Load fast replay path
      val fastReplayIn = Flipped(Decoupled(new LqWriteBundle))
      val fastReplayOut = Decoupled(new LqWriteBundle)

      // load Queue based replay
      val replay = Flipped(Decoupled(new LsPipelineBundle))
      val lqReplayFull = Input(Bool())

      // l2 dcache hint
      val l2Hint = Input(Valid(new L2ToL1Hint))

      // store-load violation check
      val reExecuteQueryIn = Flipped(Vec(StorePipelineWidth, Valid(new LoadReExecuteQueryIO)))

      // debug
      val debug_ls = Output(new DebugLsInfoBundle)

      // topdown
      val lsTopdownInfo = Output(new LsTopdownInfo)
    }

    // store flow io 
    val storeFlowIO = new Bundle() {
      // to lsq
      val lsq = ValidIO(new LsPipelineBundle)
      val lsq_replenish = Output(new LsPipelineBundle())

      // store mask, send to sq in store_s0
      val storeMaskOut = Valid(new StoreMaskBundle)

      // store-load violation check
      val reExecuteQueryOut = Valid(new LoadReExecuteQueryIO)

      // store issue 
      val issue = Valid(new ExuInput)

      // debug
      val debug_ls = Output(new DebugLsInfoBundle)
    }

    // general ports
    val tlb = new TlbRequestIO(2)
    val dcache = new DCacheLoadIO
    val pmp = Flipped(new PMPRespBundle)

    // rs feedback
    val feedbackFast = ValidIO(new RSFeedback) // stage 2
    val feedbackSlow = ValidIO(new RSFeedback) // stage 3
  })

  val loadFlow = Module(new LoadFlow())
  val loadFlowIO = io.loadFlowIO
  val storeFlow = Module(new StoreFlow())
  val storeFlowIO = io.storeFlowIO
  val mixedFlow_wb = Module(new MixedFlow_WriteBack())

  val flowIsLoad = WireInit(false.B)

  // load flow
  loadFlow.io.redirect <> io.redirect

  // flow in
  loadFlow.io.loadIn.valid := io.in.valid && flowIsLoad
  loadFlow.io.loadIn.bits := io.in.bits
  loadFlow.io.rsIdx <> io.rsIdx
  loadFlow.io.isFirstIssue <> io.isFirstIssue
  loadFlow.io.replay <> loadFlowIO.replay

  //
  loadFlowIO.sbuffer <> loadFlow.io.sbuffer
  loadFlowIO.lsq <> loadFlow.io.lsq
  loadFlowIO.trigger <> loadFlow.io.trigger
  loadFlowIO.fastUop <> loadFlow.io.fastUop
  loadFlowIO.refill <> loadFlow.io.refill
  loadFlowIO.prefetch_train <> loadFlow.io.prefetch_train
  loadFlowIO.prefetch_req <> loadFlow.io.prefetch_req
  loadFlowIO.fastpathOut <> loadFlow.io.fastpathOut
  loadFlowIO.fastReplayOut <> loadFlow.io.fastReplayOut
  loadFlowIO.s3_delayedLoadError <> loadFlow.io.s3_delayedLoadError
  loadFlow.io.fastpathIn <> loadFlowIO.fastpathIn
  loadFlow.io.loadFastMatch <> loadFlowIO.loadFastMatch
  loadFlow.io.loadFastImm <> loadFlowIO.loadFastImm 
  loadFlow.io.csrCtrl <> io.csrCtrl
  loadFlow.io.debug_ls <> loadFlowIO.debug_ls
  loadFlow.io.lsTopdownInfo <> loadFlowIO.lsTopdownInfo
  loadFlow.io.s2IsPointerChasing <> loadFlowIO.s2IsPointerChasing
  loadFlow.io.lqReplayFull <> loadFlowIO.lqReplayFull
  loadFlow.io.fastReplayIn <> loadFlowIO.fastReplayIn
  loadFlow.io.l2Hint <> loadFlowIO.l2Hint
  loadFlow.io.tlDchannel <> loadFlowIO.tlDchannel
  loadFlow.io.forward_mshr <> loadFlowIO.forward_mshr
  loadFlow.io.reExecuteQuery <> loadFlowIO.reExecuteQueryIn
  loadFlow.io.pmp <> io.pmp

  // store flow
  storeFlow.io.redirect <> io.redirect
  // flow in
  storeFlow.io.stin.valid := io.in.valid && !flowIsLoad
  storeFlow.io.stin.bits := io.in.bits
  storeFlow.io.rsIdx <> io.rsIdx
  storeFlow.io.isFirstIssue <> io.isFirstIssue
  storeFlow.io.pmp <> io.pmp

  storeFlowIO.lsq <> storeFlow.io.lsq
  storeFlowIO.lsq_replenish <> storeFlow.io.lsq_replenish
  storeFlowIO.storeMaskOut <> storeFlow.io.storeMaskOut
  storeFlowIO.reExecuteQueryOut <> storeFlow.io.reExecuteQuery
  storeFlowIO.issue <> storeFlow.io.issue
  storeFlowIO.debug_ls <> storeFlow.io.debug_ls

  // flow in ready
  io.in.ready := Mux(flowIsLoad, loadFlow.io.loadIn.ready, storeFlow.io.stin.ready)

  // tlb request
  io.tlb.req_kill := loadFlow.io.tlb.req_kill || storeFlow.io.tlb.req_kill

  loadFlow.io.tlb.req.ready := false.B
  storeFlow.io.tlb.req.ready := false.B
  when (loadFlow.io.tlb.req.valid) {
    io.tlb.req <> loadFlow.io.tlb.req
  } .otherwise {
    io.tlb.req <> storeFlow.io.tlb.req
  }

  io.tlb.resp.ready := false.B
  when (RegNext(loadFlow.io.tlb.req.valid)) {
    loadFlow.io.tlb.resp <> io.tlb.resp
  } .otherwise {
    storeFlow.io.tlb.resp <> io.tlb.resp
  }

  // dcache request
  io.dcache <> loadFlow.io.dcache

  // rs feedback
  io.feedbackFast <> loadFlow.io.feedbackFast
  io.feedbackSlow.valid := loadFlow.io.feedbackSlow.valid || storeFlow.io.feedbackSlow.valid
  io.feedbackSlow.bits := Mux(loadFlow.io.feedbackSlow.valid, loadFlow.io.feedbackSlow.bits, storeFlow.io.feedbackSlow.bits)
  

  // memory flow writeback
  mixedFlow_wb.io.redirect <> io.redirect
  mixedFlow_wb.io.in.valid := loadFlow.io.loadOut.valid || storeFlow.io.stout.valid
  mixedFlow_wb.io.in.bits := Mux(loadFlow.io.loadOut.valid, loadFlow.io.loadOut.bits, storeFlow.io.stout.bits)
  loadFlow.io.loadOut.ready := mixedFlow_wb.io.in.ready
  storeFlow.io.stout.ready := mixedFlow_wb.io.in.ready

  io.out_toRS <> loadFlow.io.loadOut
  io.out_toROB <> mixedFlow_wb.io.out

  val perfEvents = Seq()
  generatePerfEvent()  
  when (io.out_toROB.fire) {
    XSDebug("loadOut %x\n", io.out_toROB.bits.uop.cf.pc)    
  }
  // end
}