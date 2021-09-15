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
import freechips.rocketchip.diplomacy.{LazyModule, LazyModuleImp, IdRange}
import freechips.rocketchip.tilelink._
import xiangshan._
import xiangshan.cache._
import utils._

case class ICacheParameters(
    nSets: Int = 256,
    nWays: Int = 8,
    rowBits: Int = 64,
    nTLBEntries: Int = 32,
    tagECC: Option[String] = None,
    dataECC: Option[String] = None,
    replacer: Option[String] = Some("random"),
    nMissEntries: Int = 1,
    nMMIOs: Int = 1,
    blockBytes: Int = 64
)extends L1CacheParameters {

  def tagCode: Code = Code.fromString(tagECC)
  def dataCode: Code = Code.fromString(dataECC)
  def replacement = ReplacementPolicy.fromString(replacer,nWays,nSets)
}

trait HasICacheParameters extends HasL1CacheParameters with HasInstrMMIOConst {
  val cacheParams = icacheParameters
  val mshtIDWidth = log2Ceil(cacheParams.nMissEntries)
  
  require(isPow2(nSets), s"nSets($nSets) must be pow2")
  require(isPow2(nWays), s"nWays($nWays) must be pow2")
}

abstract class ICacheBundle(implicit p: Parameters) extends XSBundle
  with HasICacheParameters

abstract class ICacheModule(implicit p: Parameters) extends XSModule
  with HasICacheParameters

abstract class ICacheArray(implicit p: Parameters) extends XSModule
  with HasICacheParameters

class ICacheReadBundle(implicit p: Parameters) extends ICacheBundle 
{
  val vSetIdx       = UInt(log2Ceil(nSets).W)
}

class ICacheMetaRespBundle(implicit p: Parameters) extends ICacheBundle
{
  val tags  = Vec(nWays ,UInt(tagBits.W))
  val valid = Vec(nWays ,Bool())
}

class ICacheMetaWriteBundle(implicit p: Parameters) extends ICacheBundle
{
  val virIdx  = UInt(idxBits.W)
  val phyTag  = UInt(tagBits.W)
  val waymask = UInt(nWays.W)

  def generate(tag:UInt, idx:UInt, waymask:UInt){
    this.virIdx  := idx
    this.phyTag  := tag
    this.waymask := waymask
  }

}

class ICacheDataWriteBundle(implicit p: Parameters) extends ICacheBundle
{
  val virIdx  = UInt(idxBits.W)
  val data    = UInt(blockBits.W)
  val waymask = UInt(nWays.W)

  def generate(data:UInt, idx:UInt, waymask:UInt){
    this.virIdx  := idx
    this.data    := data
    this.waymask := waymask
  }

}

class ICacheDataRespBundle(implicit p: Parameters) extends ICacheBundle
{
  val datas = Vec(nWays,UInt(blockBits.W))
}

class ICacheMetaReadBundle(implicit p: Parameters) extends ICacheBundle
{
    val req     = Flipped(DecoupledIO(new ICacheReadBundle))
    val resp = Output(new ICacheMetaRespBundle)
}

class ICacheCommonReadBundle(isMeta: Boolean)(implicit p: Parameters) extends ICacheBundle
{
    val req     = Flipped(DecoupledIO(new ICacheReadBundle))
    val resp    = if(isMeta) Output(new ICacheMetaRespBundle) else Output(new ICacheDataRespBundle)
}


class ICacheMetaArray(implicit p: Parameters) extends ICacheArray
{
  val io=IO{new Bundle{
    val write    = Flipped(DecoupledIO(new ICacheMetaWriteBundle))
    val read     = Flipped(DecoupledIO(new ICacheReadBundle))
    val readResp = Output(new ICacheMetaRespBundle)
  }}

  io.read.ready := !io.write.valid

  val tagArray = Module(new SRAMTemplate(
      UInt(tagBits.W),
      set=nSets,
      way=nWays,
      shouldReset = true,
      holdRead = true,
      singlePort = true
    ))

    //meta connection
    tagArray.io.r.req.valid := io.read.valid
    tagArray.io.r.req.valid := io.read.valid
    tagArray.io.r.req.bits.apply(setIdx=io.read.bits.vSetIdx)

    tagArray.io.w.req.valid := io.write.valid 
    tagArray.io.w.req.bits.apply(data=io.write.bits.phyTag, setIdx=io.write.bits.virIdx, waymask=io.write.bits.waymask)
   
    tagArray

  val readIdxNext = RegEnable(next = io.read.bits.vSetIdx, enable = io.read.fire())
  val validArray = RegInit(0.U((nSets * nWays).W))
  val validMeta = Cat((0 until nWays).map{w => validArray( Cat(readIdxNext, w.U(log2Ceil(nWays).W)) )}.reverse).asUInt


  val wayNum   = OHToUInt(io.write.bits.waymask)
  val validPtr = Cat(io.write.bits.virIdx, wayNum)
  when(io.write.valid){
    validArray := validArray.bitSet(validPtr, true.B)
  }

  io.readResp.tags := tagArray.io.r.resp.asTypeOf(Vec(nWays, UInt(tagBits.W)))
  io.readResp.valid := validMeta.asTypeOf(Vec(nWays,Bool()))

  io.write.ready := DontCare
}


class ICacheDataArray(implicit p: Parameters) extends ICacheArray
{
  val io=IO{new Bundle{
    val write    = Flipped(DecoupledIO(new ICacheDataWriteBundle))
    val read     = Flipped(DecoupledIO(new ICacheReadBundle))
    val readResp = Output(new ICacheDataRespBundle)
  }}

  io.read.ready := !io.write.valid
  
  val dataArray = Module(new SRAMTemplate(
    UInt(blockBits.W),
    set=nSets,
    way=nWays,
    shouldReset = true,
    holdRead = true,
    singlePort = true
  ))

  //meta connection
  dataArray.io.r.req.valid := io.read.valid
  dataArray.io.r.req.valid := io.read.valid && io.read.bits.isDoubleLine
  dataArray.io.r.req.bits.apply(setIdx=io.read.bits.vSetIdx)

  dataArray.io.w.req.valid := io.write.valid
  dataArray.io.w.req.bits.apply(data=io.write.bits.data, setIdx=io.write.bits.virIdx, waymask=io.write.bits.waymask)

  io.readResp.datas :=  dataArray.io.r.resp.data.asTypeOf(Vec(nWays, UInt(blockBits.W)))

  io.write.ready := true.B
}


abstract class ICacheMissQueueModule(implicit p: Parameters) extends XSModule
  with HasICacheParameters 

abstract class ICacheMissQueueBundle(implicit p: Parameters) extends XSBundle
  with HasICacheParameters

class ICacheMissReq(implicit p: Parameters) extends ICacheBundle
{
    val addr      = UInt(PAddrBits.W)
    val vSetIdx   = UInt(idxBits.W)
    val waymask   = UInt(16.W)
    val clientID  = UInt(1.W)
    def generate(missAddr:UInt, missIdx:UInt, missWaymask:UInt, source:UInt) = {
      this.addr := missAddr
      this.vSetIdx  := missIdx
      this.waymask := missWaymask
      this.clientID := source
    }
    override def toPrintable: Printable = {
      p"addr=0x${Hexadecimal(addr)} vSetIdx=0x${Hexadecimal(vSetIdx)} waymask=${Binary(waymask)} clientID=${Binary(clientID)}"
    }
}

class ICacheMissResp(implicit p: Parameters) extends ICacheBundle
{
    val data     = UInt(blockBits.W)
    val clientID = UInt(mshtIDWidth.W)
}

class ICacheMissBundle(implicit p: Parameters) extends ICacheBundle{
    val req         = Flipped(DecoupledIO(new ICacheMissReq))
    val resp        = DecoupledIO(new ICacheMissResp)
    val flush       = Input(Bool())
}

class ICacheMissEntry(edge: TLEdgeOut)(implicit p: Parameters) extends ICacheMissQueueModule
{
    val io = IO(new Bundle{
        // MSHR ID
        val id          = Input(UInt(mshtIDWidth.W))

        val req         = Flipped(DecoupledIO(new ICacheMissReq))
        val resp        = DecoupledIO(new ICacheMissResp)
        
        val mem_acquire = DecoupledIO(new TLBundleA(edge.bundle))
        val mem_grant   = Flipped(DecoupledIO(new TLBundleD(edge.bundle)))

        val meta_write  = DecoupledIO(new ICacheMetaWriteBundle)
        val data_write  = DecoupledIO(new ICacheDataWriteBundle)
    
        val flush = Input(Bool())
    })

    val s_idle :: s_memReadReq :: s_memReadResp :: s_write_back :: s_wait_resp :: Nil = Enum(5)
    val state = RegInit(s_idle)

    //req register
    val req = Reg(new ICacheMissReq)
    val req_idx = req.vSetIdx         //virtual index
    val req_tag = get_tag(req.addr)           //physical tag
    val req_waymask = req.waymask

    val (_, _, refill_done, refill_address_inc) = edge.addr_inc(io.mem_grant)

    //8 for 64 bits bus and 2 for 256 bits
    val readBeatCnt = Reg(UInt(log2Up(refillCycles).W))
    val respDataReg = Reg(Vec(refillCycles,UInt(beatBits.W)))

    //initial
    io.resp.bits := DontCare
    io.mem_acquire.bits := DontCare
    io.mem_grant.ready := true.B   
    io.meta_write.bits := DontCare
    io.data_write.bits := DontCare

    io.req.ready := state === s_idle
    io.mem_acquire.valid := state === s_memReadReq

    //flush register
    val needFlush = RegInit(false.B)
    when(io.flush && (state =/= s_idle) && (state =/= s_wait_resp)){ needFlush := true.B }
    .elsewhen((state=== s_wait_resp) && needFlush){ needFlush := false.B }

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
              state := Mux(needFlush || io.flush, s_wait_resp, s_write_back)
            }
          }
        }
      }

      is(s_write_back){
          state := s_wait_resp
      }

      is(s_wait_resp){
        io.resp.bits.data := respDataReg.asUInt
	      io.resp.bits.clientID := req.clientID
        when(io.resp.fire() || needFlush ){ state := s_idle }
      }

    }

    //refill write and meta write
    //WARNING: Maybe could not finish refill in 1 cycle
    io.meta_write.valid := (state === s_write_back) && !needFlush
    io.meta_write.bits.generate(tag=req_tag, idx=req_idx, waymask=req_waymask)
   
    io.data_write.valid := (state === s_write_back) && !needFlush
    io.data_write.bits.generate(data=respDataReg.asUInt, idx=req_idx, waymask=req_waymask)

    //mem request
    io.mem_acquire.bits  := edge.Get(
      fromSource      = io.id,
      toAddress       = Cat(req.addr(PAddrBits - 1, log2Ceil(blockBytes)), 0.U(log2Ceil(blockBytes).W)),
      lgSize          = (log2Up(cacheParams.blockBytes)).U)._2


    //resp to icache
    io.resp.valid := (state === s_wait_resp) && !needFlush

    XSDebug("[ICache MSHR %d] (req)valid:%d  ready:%d req.addr:%x waymask:%b  || Register: req:%x  \n",io.id.asUInt,io.req.valid,io.req.ready,io.req.bits.addr,io.req.bits.waymask,req.asUInt)
    XSDebug("[ICache MSHR %d] (Info)state:%d  needFlush:%d\n",io.id.asUInt,state,needFlush)
    XSDebug("[ICache MSHR %d] (mem_acquire) valid%d ready:%d\n",io.id.asUInt,io.mem_acquire.valid,io.mem_acquire.ready)
    XSDebug("[ICache MSHR %d] (mem_grant)   valid%d ready:%d data:%x \n",io.id.asUInt,io.mem_grant.valid,io.mem_grant.ready,io.mem_grant.bits.data)
    XSDebug("[ICache MSHR %d] (meta_write)  valid%d ready:%d  tag:%x \n",io.id.asUInt,io.meta_write.valid,io.meta_write.ready,io.meta_write.bits.phyTag)
    XSDebug("[ICache MSHR %d] (refill)  valid%d ready:%d  data:%x \n",io.id.asUInt,io.data_write.valid,io.data_write.ready,io.data_write.bits.data.asUInt())
    XSDebug("[ICache MSHR %d] (resp)  valid%d ready:%d \n",io.id.asUInt,io.resp.valid,io.resp.ready)


}


class ICacheMissQueue(edge: TLEdgeOut)(implicit p: Parameters) extends ICacheMissQueueModule
{
  val io = IO(new Bundle{
    val req         = Flipped(DecoupledIO(new ICacheMissReq))
    val resp        = DecoupledIO(new ICacheMissResp)
    
    val mem_acquire = DecoupledIO(new TLBundleA(edge.bundle))
    val mem_grant   = Flipped(DecoupledIO(new TLBundleD(edge.bundle)))

    val meta_write  = DecoupledIO(new ICacheMetaWriteBundle)
    val data_write  = DecoupledIO(new ICacheDataWriteBundle)

    val flush       = Input(Bool())

  })

  io.mem_grant.ready := false.B

  val meta_write_arb = Module(new Arbiter(new ICacheMetaWriteBundle,  cacheParams.nMissEntries))
  val refill_arb     = Module(new Arbiter(new ICacheDataWriteBundle,  cacheParams.nMissEntries))
  val resp_arb       = Module(new Arbiter(new ICacheMissResp,         cacheParams.nMissEntries))

  io.mem_grant.ready := true.B

  val entries = (0 until 2) map { i =>
    val entry = Module(new ICacheMissEntry(edge))

    entry.io.id := i.U(mshtIDWidth.W)
    entry.io.flush := io.flush

    // entry req
    entry.io.req.valid := io.req.valid
    entry.io.req.bits  := io.req.bits
    io.req.ready    := entry.io.req.ready

    // entry resp
    meta_write_arb.io.in    <>  entry.io.meta_write
    refill_arb.io.in        <>  entry.io.data_write

    entry.io.mem_grant.valid := false.B
    entry.io.mem_grant.bits  := DontCare
    when (io.mem_grant.bits.source === i.U) {
      entry.io.mem_grant <> io.mem_grant
    }

    resp_arb.io.in(i)       <>  entry.io.resp

    XSPerfAccumulate(
      "entryPenalty" + Integer.toString(i, 10),
      BoolStopWatch(
        start = entry.io.req.fire(),
        stop = entry.io.resp.fire() || entry.io.flush,
        startHighPriority = true)
    )
    XSPerfAccumulate("entryReq" + Integer.toString(i, 10), entry.io.req.fire())

    entry
  }

  TLArbiter.lowestFromSeq(edge, io.mem_acquire, entries.map(_.io.mem_acquire))

  io.meta_write     <> meta_write_arb.io.out
  io.data_write     <> refill_arb.io.out
  io.resp <> resp_arb.io.out

}

class ICacheIO(implicit p: Parameters) extends ICacheBundle
{
  val metaRead    = new ICacheCommonReadBundle(isMeta = true)
  val dataRead    = new ICacheCommonReadBundle(isMeta = false)
  val missQueue   = new ICacheMissBundle
}

class ICache()(implicit p: Parameters) extends LazyModule with HasICacheParameters {

  val clientParameters = TLMasterPortParameters.v1(
    Seq(TLMasterParameters.v1(
      name = "icache",
      sourceId = IdRange(0, cacheParams.nMissEntries)
    ))
  )

  val clientNode = TLClientNode(Seq(clientParameters))

  lazy val module = new ICacheImp(this)
}

class ICacheImp(outer: ICache) extends LazyModuleImp(outer) with HasICacheParameters {
  val io = IO(new ICacheIO)

  val (bus, edge) = outer.clientNode.out.head
  
  val metaArray      = Module(new ICacheMetaArray)
  val dataArray      = Module(new ICacheDataArray)
  val missQueue      = Module(new ICacheMissQueue(edge))

  metaArray.io.write <> missQueue.io.meta_write
  dataArray.io.write <> missQueue.io.data_write

  metaArray.io.read      <> io.metaRead.req 
  metaArray.io.readResp  <> io.metaRead.resp

  dataArray.io.read      <> io.dataRead.req 
  dataArray.io.readResp  <> io.dataRead.resp

  missQueue.io.req           <> io.missQueue.req
  missQueue.io.resp          <> io.missQueue.resp

  missQueue.io.flush := io.missQueue.flush
  bus.a <> missQueue.io.mem_acquire  
  missQueue.io.mem_grant      <> bus.d

  bus.b.ready := false.B
  bus.c.valid := false.B
  bus.c.bits  := DontCare
  bus.e.valid := false.B
  bus.e.bits  := DontCare
}