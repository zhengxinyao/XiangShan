package xiangshan.frontend

import chipsalliance.rocketchip.config.Parameters
import chisel3._
import chisel3.util._
import freechips.rocketchip.tilelink._
import xiangshan._
import xiangshan.cache._
import utils.{GTimer, _}
import xiangshan.cache.mmu.BlockTlbRequestIO


trait HasIPredfetchConst extends HasICacheParameters with HasIFUConst{
  val PIQEntries = cacheParams.nPIQEntries
  val PBufferSize = PIQEntries
  val PrefetchLineNum = cacheParams.nPrefetchLine

  def FetchPort = 0
  def PrefetchPort  = 1

  def generateControlReg(flush: Bool, enable: Bool, release: Bool): Bool = {
    val controlReg = RegInit(false.B)
    when(flush)        {controlReg := false.B}
      .elsewhen(enable)  {controlReg := true.B }
      .elsewhen(release) {controlReg := false.B}
    controlReg
  }

  def generateState(enable: Bool, release: Bool): Bool = {
    val stateReg = RegInit(false.B)
    val state    = Wire(Bool())
    when(enable)       {stateReg := true.B }
    .elsewhen(release && stateReg) {stateReg := false.B}

    state := stateReg || enable

    state
  }
}

abstract class IPrefetchBundle(implicit p: Parameters) extends XSBundle
  with HasIPredfetchConst

abstract class IPrefetchModule(implicit p: Parameters) extends XSModule
  with HasIPredfetchConst

class IPredfetchIO(implicit p: Parameters) extends IPrefetchBundle {
  val iTLBInter       = new BlockTlbRequestIO
  val ifuInter        = new IfuPrefechBundle
  val toIMeta         = Decoupled(new ICacheReadBundle)
  val fromIMeta       = Input(new ICacheMetaRespBundle)
  val fromFtq         = Flipped(new FtqPrefechBundle)
  val toMissQueue     = new IPrefetchToMissQueue
  val fromMissQueue   = new IPrefetchResp
  val flush           = Input(Bool())
}

class IPrefetchToMissQueue(implicit  p: Parameters) extends IPrefetchBundle{
  val enqReq  = DecoupledIO(new PIQReq)
  val freeReq = new PIQFreeReq
}

class IPrefetchResp(implicit p: Parameters) extends IPrefetchBundle{
  val pref_meta_write   = Vec(PIQEntries,Flipped(ValidIO(new PIQMetaWrite)))
  val pref_data_write   = Vec(PIQEntries,Flipped(ValidIO(new PIQDataWrite)))
}

class PIQReq(implicit p: Parameters) extends IPrefetchBundle {
  val addr      = UInt(PAddrBits.W)
  val vSetIdx   = UInt(idxBits.W)
}

class PIQFreeReq(implicit p: Parameters) extends IPrefetchBundle{
  val rFreeIdx = ValidIO(UInt(log2Ceil(PIQEntries).W))
  val hFreeIdx = ValidIO(UInt(log2Ceil(PIQEntries).W))
}

class PIQMetaWrite(implicit p: Parameters) extends  IPrefetchBundle{
  val tag = UInt(tagBits.W)
  val index = UInt(idxBits.W)
}

class PIQDataWrite(implicit p: Parameters) extends  IPrefetchBundle{
  val data = UInt(blockBits.W)
}

class IPrefetch(implicit p: Parameters) extends IPrefetchModule{
  val io = IO(new IPredfetchIO)
  val (toIMeta, fromIMeta) = (io.toIMeta,io.fromIMeta)
  val (toITLB,  fromITLB)  = (io.iTLBInter.req, io.iTLBInter.resp)
  val (piq_enq , piq_write) = (io.toMissQueue.enqReq, io.fromMissQueue)

  val p0_fire, p1_fire, p2_fire =  WireInit(false.B)
  val p0_ready, p1_ready, p2_ready = WireInit(false.B)

  /** Prefetch Stage 0: req from Ftq */
  val p0_valid  =    io.fromFtq.req.valid
  val p0_vaddr  =   io.fromFtq.req.bits.firstBlockAddr
  p0_fire   :=   io.fromFtq.req.fire()

  toIMeta.valid     := p0_fire
  toIMeta.bits.vSetIdx(0) := get_idx(io.fromFtq.req.bits.target)

  toIMeta.bits.vSetIdx(1) := DontCare
  toIMeta.bits.isDoubleLine := false.B

  io.fromFtq.req.ready := toIMeta.ready && p1_ready && GTimer() > 500.U


  /** Prefetch Stage 1: cache probe filter */
  val p1_valid =   generateControlReg(flush = io.flush, enable = p0_fire && !io.flush, release = p1_fire)

  val p1_vaddr   =  RegEnable(next = p0_vaddr,    enable=p0_fire)

  toITLB.valid      := p1_valid
  toITLB.bits       := DontCare
  toITLB.bits.vaddr := p1_vaddr

  fromITLB.ready := true.B

  //tlb resp
  val (tlb_resp_valid, tlb_resp_paddr) = (fromITLB.valid, fromITLB.bits.paddr)
  val (tlb_resp_pf, tlb_resp_af)       = (fromITLB.bits.excp.pf.instr && tlb_resp_valid, fromITLB.bits.excp.af.instr && tlb_resp_valid)
  val tlb_mmio                         = fromITLB.bits.mmio && tlb_resp_valid
  val p1_exception = VecInit(Seq(tlb_resp_pf, tlb_resp_af, tlb_mmio))
  //tlb exception should make this req invalid and overrided
  val tlb_finish = tlb_resp_valid //&& toITLB.fire() //&& !tlb_resp_pf && !tlb_resp_af

  //ICache meta resp
  val (icache_meta_resp, icahce_meta_valids) = (fromIMeta.tags(0), fromIMeta.valid(0))
  val req_hit_vec = VecInit((0 until nWays).map(w => icache_meta_resp(w) === get_phy_tag(tlb_resp_paddr) && icahce_meta_valids(w)))
  val req_hit     = req_hit_vec.asUInt.orR

  //overriding the invalid req
  val p1_req_invalid = (req_hit || (tlb_finish && p1_exception.reduce(_ || _))) && p1_valid
  val p1_req_valid   = p1_valid && tlb_finish && !req_hit && !p1_exception.reduce(_ || _)

  p1_ready :=   piq_enq.ready && tlb_finish || !p1_valid || p1_req_invalid
  p1_fire  :=   p1_valid && p1_req_valid && p1_ready

  /** Prefetch Stage 2: filtered req PIQ enqueue */
  val p2_valid = generateControlReg(flush = io.flush, enable = p1_fire && !io.flush, release = p2_fire)

  val (p2_vaddr, p2_paddr) = (RegEnable(next = p1_vaddr,  enable = p1_fire), RegEnable(next = tlb_resp_paddr,  enable = p1_fire))

  p2_fire := piq_enq.fire()

  //TODO: PIQ Flush
  io.toMissQueue.enqReq.valid            := p2_valid
  io.toMissQueue.enqReq.bits.addr        := p2_paddr
  io.toMissQueue.enqReq.bits.vSetIdx     := get_idx(p2_vaddr)

  /** PIQ write back Prefetch Buffer */
  class PrefetchBufferEntry(implicit p: Parameters) extends XSBundle{
    val phy_tag    =  UInt(tagBits.W)
    val vir_index  =  UInt(idxBits.W)
    val data       =  UInt(blockBits.W)
  }

  val entryValidArray  = VecInit(Seq.fill(PBufferSize)(RegInit(false.B)))
  val prefetchBuffer   = Reg(Vec(PBufferSize, new PrefetchBufferEntry()))

  for(i <- 0 until PIQEntries){
    when(io.fromMissQueue.pref_meta_write(i).valid) {
      entryValidArray(i)          := true.B
      prefetchBuffer(i).phy_tag   := io.fromMissQueue.pref_meta_write(i).bits.tag
      prefetchBuffer(i).vir_index := io.fromMissQueue.pref_meta_write(i).bits.index
    }

    when(io.fromMissQueue.pref_data_write(i).valid) {
      prefetchBuffer(i).data := io.fromMissQueue.pref_data_write(i).bits.data
    }
  }

  when(io.flush)      { entryValidArray.foreach(_ := false.B) }

  /** ifu fetch */
  val (fetch_req, fetch_resp, fetch_move) = (io.ifuInter.prefetch_req, io.ifuInter.prefetch_resp, io.ifuInter.ifu_move)

  //read resp to IFU
  val fetch_req_wire = Wire(ValidUndirectioned(new ICacheReadBundle))
  val fetch_req_reg = RegNext(fetch_req_wire)
  val fetch_req_valid = Reg(Bool())
  val fetch_index   = fetch_req_reg.bits.vSetIdx

  fetch_req_wire.valid := fetch_req.fire()
  fetch_req_wire.bits  := fetch_req.bits

  fetch_resp.valid := fetch_req_reg.valid
  fetch_resp.bits.prefetch_meta_resp    := VecInit(prefetchBuffer.map(entry => entry.phy_tag))
  fetch_resp.bits.prefetch_meta_vindex  := VecInit(prefetchBuffer.map(entry => entry.vir_index))
  fetch_resp.bits.prefetch_meta_valids  := VecInit(entryValidArray.map(entry => entry))
  fetch_resp.bits.prefetch_data_resp    := VecInit(prefetchBuffer.map(entry => entry.data))

  fetch_req.ready := true.B

  /** only when I$ Miss and Prefetch hit */
  val move_req = RegNext( fetch_move )

  //free PIQ entry
  io.toMissQueue.freeReq.hFreeIdx.valid           := fetch_move.valid
  io.toMissQueue.freeReq.hFreeIdx.bits            := fetch_move.valid

  //dequeue PBuffer entry
  when(move_req.valid){
    entryValidArray(move_req.bits.move_idx) := false.B
  }

  //replace PIQ entry
  //val replacer = ReplacementPolicy.fromString(Some("random"), PIQEntries)
  val victim = 0.U//PriorityEncoder(entryValidArray)  //TODO: replacement policy

  io.toMissQueue.freeReq.rFreeIdx.valid           := piq_enq.valid && !piq_enq.ready
  io.toMissQueue.freeReq.rFreeIdx.bits            := victim

  when(io.toMissQueue.freeReq.rFreeIdx.valid ){
    entryValidArray(victim) := false.B
  }

}

class PIQEntry(edge: TLEdgeOut)(implicit p: Parameters) extends IPrefetchModule
{
  val io = IO(new Bundle{
    val id          = Input(UInt(log2Ceil(PIQEntries).W))

    val req         = Flipped(DecoupledIO(new PIQReq))

    val mem_acquire = DecoupledIO(new TLBundleA(edge.bundle))
    val mem_grant   = Flipped(DecoupledIO(new TLBundleD(edge.bundle)))

    //write back to Prefetch Buffer
    val pfbuffer_data_write  = ValidIO(new PIQDataWrite)
    val pfbuffer_meta_write  = ValidIO(new PIQMetaWrite)

    //write back to ICache
    val meta_refill  = DecoupledIO(new ICacheMetaWriteBundle)
    val data_refill  = DecoupledIO(new ICacheDataWriteBundle)

    //branch miss prediction
    val flush       = Input(Bool())
    //hit in prefetch buffer
    val hitFree     = Input(Bool())
    //free as a victim
    val replaceFree = Input(Bool())
  })

  val s_idle :: s_memReadReq :: s_memReadResp :: s_write_back :: s_wait_free :: Nil = Enum(5)
  val state = RegInit(s_idle)

  //req register
  val req = Reg(new PIQReq)
  val req_idx = req.vSetIdx                     //virtual index
  val req_tag = get_phy_tag(req.addr)           //physical tag

  val (_, _, refill_done, refill_address_inc) = edge.addr_inc(io.mem_grant)

  //8 for 64 bits bus and 2 for 256 bits
  val readBeatCnt = Reg(UInt(log2Up(refillCycles).W))
  val respDataReg = Reg(Vec(refillCycles,UInt(beatBits.W)))

  //initial
  io.mem_acquire.bits := DontCare
  io.mem_grant.ready := true.B
  io.pfbuffer_meta_write.bits := DontCare
  io.pfbuffer_data_write.bits := DontCare

  io.req.ready := state === s_idle
  io.mem_acquire.valid := state === s_memReadReq

  //flush register
  val needFlush = generateState(enable = io.flush && (state =/= s_idle) && (state =/= s_wait_free), release = (state=== s_wait_free))

  val freeEntry   = io.hitFree || io.replaceFree
  val refill_finish = io.meta_refill.fire() && io.data_refill.fire()
  val needFree    = generateState(enable = freeEntry && (state === s_wait_free),  release = (state=== s_wait_free))
  val needRefill  = generateState(enable = io.hitFree && (state === s_wait_free), release = (state=== s_wait_free) && refill_finish)

  //state change
  switch(state){
    is(s_idle){
      when(io.req.fire()){
        readBeatCnt := 0.U
        state := s_memReadReq
        req := io.req.bits
      }
    }

    // memory request
    is(s_memReadReq){
      when(io.mem_acquire.fire()){
        state := s_memReadResp
      }
    }

    is(s_memReadResp){
      when (edge.hasData(io.mem_grant.bits)) {
        when (io.mem_grant.fire()) {
          readBeatCnt := readBeatCnt + 1.U
          respDataReg(readBeatCnt) := io.mem_grant.bits.data
          when (readBeatCnt === (refillCycles - 1).U) {
            assert(refill_done, "refill not done!")
            state := Mux(needFlush, s_idle, s_write_back)
          }
        }
      }
    }

    is(s_write_back){
      state := Mux(needFlush, s_idle, s_wait_free)
    }

    is(s_wait_free){
      when(needRefill){
        state := Mux(refill_finish, s_idle, s_wait_free)
      }.elsewhen(needFlush || needFree){
        state := s_idle
      }
    }
  }

  //refill write and meta write
  //WARNING: Maybe could not finish refill in 1 cycle
  io.pfbuffer_meta_write.valid := (state === s_write_back) && !needFlush
  io.pfbuffer_meta_write.bits.tag := req_tag
  io.pfbuffer_meta_write.bits.index := req_idx

  io.pfbuffer_data_write.valid := (state === s_write_back) && !needFlush
  io.pfbuffer_data_write.bits.data := respDataReg.asUInt

  io.meta_refill.valid := (state === s_wait_free) && needRefill && !needFlush
  io.meta_refill.bits.apply(tag=req_tag, idx=req_idx, waymask=0.U, bankIdx=req_idx(0))

  io.data_refill.valid := (state === s_wait_free) && needRefill && !needFlush
  io.data_refill.bits.apply(data=respDataReg.asUInt, idx=req_idx, waymask=0.U, bankIdx=req_idx(0))

  //mem request
  io.mem_acquire.bits  := edge.Get(
    fromSource      = io.id,
    toAddress       = Cat(req.addr(PAddrBits - 1, log2Ceil(blockBytes)), 0.U(log2Ceil(blockBytes).W)),
    lgSize          = (log2Up(cacheParams.blockBytes)).U)._2

}
