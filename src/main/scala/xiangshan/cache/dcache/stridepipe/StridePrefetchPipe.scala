package xiangshan.cache
//add by tjz
import chipsalliance.rocketchip.config.Parameters
import chisel3._
import chisel3.util._
import freechips.rocketchip.tilelink.ClientMetadata
import utils.{XSDebug, XSPerfAccumulate}

class StridePrefetchPipe(implicit p: Parameters) extends DCacheModule{
  def metaBits = (new L1Metadata).getWidth
  def encMetaBits = cacheParams.tagCode.width(metaBits)
  def getMeta(encMeta: UInt): UInt = {
    require(encMeta.getWidth == encMetaBits)
    encMeta(metaBits - 1, 0)
  }

  val io = IO(new DCacheBundle {
      val l1dprefetch = Flipped(new DCacheToL1DPrefetch)

      val meta_read = DecoupledIO(new L1MetaReadReq)
      val meta_resp = Input(Vec(nWays, UInt(encMetaBits.W)))

      val miss_req = DecoupledIO(new MissReq)
  })

  val s1_ready = Wire(Bool())
  val s2_ready = Wire(Bool())

  //in ready
  io.l1dprefetch.prefetch.req.ready := io.meta_read.ready && s1_ready
  io.meta_read.valid := io.l1dprefetch.prefetch.req.fire()
  
  val meta_read = io.meta_read.bits

  //Tag read for new requests
  meta_read.idx := get_idx(io.l1dprefetch.prefetch.req.bits.addr)
  meta_read.way_en := ~0.U(nWays.W)
  meta_read.tag := DontCare

  // Pipeline
  // -----------------------------------------------------------------------------------------------
  // stage 0
  val s0_valid = io.l1dprefetch.prefetch.req.fire()
  val s0_req = io.l1dprefetch.prefetch.req.bits
  val s0_fire = s0_valid && s1_ready

  dump_pipeline_reqs("StridePipe s0", s0_valid, s0_req)

  // -----------------------------------------------------------------------------------------------
  //stage 1
  val s1_valid = RegInit(false.B)
  val s1_req = RegEnable(s0_req, s0_fire)
  //in stage 1, we get paddr(tag)
  //Also, we can send missReq to missqueue
  val s1_addr = io.l1dprefetch.s1_paddr
  val s1_fire = s1_valid && s2_ready
  s1_ready := !s1_valid || s1_fire
  
  when(s0_fire) { s1_valid := true.B}
  .elsewhen (s1_fire) {s1_valid := false.B}

  dump_pipeline_reqs("StridePipe s1", s1_valid, s1_req)

  //tag check
  val meta_resp = VecInit(io.meta_resp.map(r => getMeta(r).asTypeOf(new L1Metadata)))
  def wayMap[T <: Data](f: Int => T) = VecInit((0 until nWays).map(f))
  val s1_tag_eq_way = wayMap((w: Int) => meta_resp(w).tag === (get_tag(s1_addr))).asUInt
  val s1_tag_match_way = wayMap((w: Int) => s1_tag_eq_way(w) && meta_resp(w).coh.isValid()).asUInt
  val s1_tag_match = s1_tag_match_way.orR
  assert(RegNext(PopCount(s1_tag_match_way) <= 1.U), "tag should not match with more than 1 way")

  val s1_fake_meta = Wire(new L1Metadata)
  s1_fake_meta.tag := get_tag(s1_addr)
  s1_fake_meta.coh := ClientMetadata.onReset

  // when there are no tag match, we give it a Fake Meta
  // this simplifies our logic in s2 stage
  val s1_hit_meta = Mux(s1_tag_match, Mux1H(s1_tag_match_way, wayMap((w: Int) => meta_resp(w))), s1_fake_meta)
  val s1_hit_coh = s1_hit_meta.coh

  //we don't need read data or create fake meta somestuff

  // -----------------------------------------------------------------------------------------------
  //stage 2
  val s2_valid = RegInit(false.B)
  val s2_req = RegEnable(s1_req, s1_fire)
  val s2_addr = RegEnable(s1_addr, s1_fire)
  s2_ready := true.B

  when (s1_fire) { s2_valid := !io.l1dprefetch.s1_kill}
  .elsewhen(io.l1dprefetch.prefetch.resp.fire()) { s2_valid := false.B}

  dump_pipeline_reqs("LoadPipe s2", s2_valid, s2_req)

  //check hit, miss
  val s2_tag_match_way = RegEnable(s1_tag_match_way, s1_fire)
  val s2_tag_match = RegEnable(s1_tag_match, s1_fire)
  
  val s2_hit_meta = RegEnable(s1_hit_meta, s1_fire)
  val s2_hit_coh = RegEnable(s1_hit_coh, s1_fire)
  val s2_has_permission = s2_hit_coh.onAccess(s2_req.cmd)._1
  val s2_new_hit_coh = s2_hit_coh.onAccess(s2_req.cmd)._3

  val s2_hit = s2_tag_match && s2_has_permission && s2_hit_coh === s2_new_hit_coh
  dump_pipeline_valids("LoadPipe s2", "s2_hit", s2_valid && s2_hit)
  //send miss
  // send load miss to miss queue

  io.miss_req.valid := s2_valid && !s2_hit
  io.miss_req.bits := DontCare
  io.miss_req.bits.source := LOAD_SOURCE.U
  io.miss_req.bits.cmd := s2_req.cmd
  io.miss_req.bits.addr := get_block_addr(s2_addr)
  io.miss_req.bits.coh := s2_hit_coh

  //send back response
  val resp = Wire(ValidIO(new DCacheWordResp))
  resp.valid := s2_valid
  resp.bits := DontCare
  resp.bits.miss := !s2_hit 

  io.l1dprefetch.prefetch.resp.valid := resp.valid
  io.l1dprefetch.prefetch.resp.bits := resp.bits

  when (resp.valid) {
    resp.bits.dump()
  }
  
  def dump_pipeline_reqs(pipeline_stage_name: String, valid: Bool,
    req: DCacheWordReq ) = {
      when (valid) {
        XSDebug(s"$pipeline_stage_name: ")
        req.dump()
      }
  }

  def dump_pipeline_valids(pipeline_stage_name: String, signal_name: String, valid: Bool) = {
    when (valid) {
      XSDebug(s"$pipeline_stage_name $signal_name\n")
    }
  }

  XSPerfAccumulate("prefetch_req", io.l1dprefetch.prefetch.req.fire())
  XSPerfAccumulate("prefetch_s1_kill", s1_fire && io.l1dprefetch.s1_kill)
  XSPerfAccumulate("prefetch_hit_way", s1_fire && s1_tag_match)
  XSPerfAccumulate("prefetch_hit", io.l1dprefetch.prefetch.resp.fire() && !resp.bits.miss)
  XSPerfAccumulate("prefetch_miss", io.l1dprefetch.prefetch.resp.fire() && resp.bits.miss)
}