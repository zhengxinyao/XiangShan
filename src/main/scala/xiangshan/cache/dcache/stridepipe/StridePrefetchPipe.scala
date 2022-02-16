package xiangshan.cache
//add by tjz
import chipsalliance.rocketchip.config.Parameters
import chisel3._
import chisel3.util._
import freechips.rocketchip.tilelink.ClientMetadata
import utils.{HasPerfEvents, XSDebug, XSPerfAccumulate}

class StridePrefetchPipe(implicit p: Parameters) extends DCacheModule{
  /*def metaBits = (new Meta).getWidth
  def encMetaBits = cacheParams.tagCode.width((new MetaAndTag).getWidth) - tagBits
  def getMeta(encMeta: UInt): UInt = {
    require(encMeta.getWidth == encMetaBits)
    encMeta(metaBits - 1, 0)
  }*/

  val io = IO(new DCacheBundle {
    val l1dprefetch = Flipped(new DCacheToPrefetchIO)

    val meta_read = DecoupledIO(new MetaReadReq)
    val meta_resp = Input(Vec(nWays, new Meta))

    val tag_read = DecoupledIO(new TagReadReq)
    val tag_resp = Input(Vec(nWays, UInt(encTagBits.W)))

    val miss_req = DecoupledIO(new MissReq)

    val replace_access = ValidIO(new ReplacementAccessBundle)
    val replace_way = new ReplacementWayReqIO
  })

  assert(RegNext(io.meta_read.ready))
  val s1_ready = Wire(Bool())
  val s2_ready = Wire(Bool())

  //in ready
  io.l1dprefetch.req.ready := io.meta_read.ready && io.tag_read.ready && s1_ready
  io.meta_read.valid := io.l1dprefetch.req.fire()
  io.tag_read.valid := io.l1dprefetch.req.fire()
  
  val meta_read = io.meta_read.bits
  val tag_read = io.tag_read.bits

  //Tag read for new requests
  meta_read.idx := get_idx(io.l1dprefetch.req.bits.addr)
  meta_read.way_en := ~0.U(nWays.W)
  
  tag_read.idx := get_idx(io.l1dprefetch.req.bits.addr)
  tag_read.way_en := ~0.U(nWays.W)

  // Pipeline
  // -----------------------------------------------------------------------------------------------
  // stage 0
  val s0_valid = io.l1dprefetch.req.fire()
  val s0_req = io.l1dprefetch.req.bits
  val s0_fire = s0_valid && s1_ready

  dump_pipeline_reqs("StridePipe s0", s0_valid, s0_req)

  // -----------------------------------------------------------------------------------------------
  //stage 1
  val s1_valid = RegInit(false.B)
  val s1_req = RegEnable(s0_req, s0_fire)
  //in stage 1, we get paddr(tag)
  //Also, we can send missReq to missqueue
  val s1_addr = io.l1dprefetch.s1_paddr
  val s1_vaddr = s1_req.addr
  val s1_bank_oh = UIntToOH(addr_to_dcache_bank(s1_req.addr))
  val s1_fire = s1_valid && s2_ready
  s1_ready := !s1_valid || s1_fire
  
  when(s0_fire) { s1_valid := true.B}
  .elsewhen (s1_fire) {s1_valid := false.B}

  dump_pipeline_reqs("StridePipe s1", s1_valid, s1_req)

  //tag check
  val meta_resp = io.meta_resp
  val tag_resp = io.tag_resp.map(r => r(tagBits - 1, 0))
  def wayMap[T <: Data](f: Int => T) = VecInit((0 until nWays).map(f))
  val s1_tag_eq_way = wayMap((w: Int) => tag_resp(w) === (get_tag(s1_addr))).asUInt
  val s1_tag_match_way = wayMap((w: Int) => s1_tag_eq_way(w) && meta_resp(w).coh.isValid()).asUInt
  val s1_tag_match = s1_tag_match_way.orR
  assert(RegNext(PopCount(s1_tag_match_way) <= 1.U), "tag should not match with more than 1 way")

  val s1_fake_meta = Wire(new Meta)
  //s1_fake_meta.tag := get_tag(s1_addr)
  s1_fake_meta.coh := ClientMetadata.onReset
  val s1_fake_tag = get_tag(s1_addr)

  // when there are no tag match, we give it a Fake Meta
  // this simplifies our logic in s2 stage
  val s1_hit_meta = Mux(s1_tag_match, Mux1H(s1_tag_match_way, wayMap((w: Int) => meta_resp(w))), s1_fake_meta)
  val s1_hit_coh = s1_hit_meta.coh

  io.replace_way.set.valid := RegNext(s0_fire)
  io.replace_way.set.bits := get_idx(s1_vaddr)
  val s1_repl_way_en = UIntToOH(io.replace_way.way)
  val s1_repl_tag = Mux1H(s1_repl_way_en, wayMap(w => tag_resp(w)))
  val s1_repl_coh = Mux1H(s1_repl_way_en, wayMap(w => meta_resp(w).coh))

  val s1_need_replacement = !s1_tag_match
  val s1_way_en = Mux(s1_need_replacement, s1_repl_way_en, s1_tag_match_way)
  val s1_coh = Mux(s1_need_replacement, s1_repl_coh, s1_hit_coh)
  val s1_tag = Mux(s1_need_replacement, s1_repl_tag, get_tag(s1_addr))

  io.replace_access.valid := RegNext(RegNext(io.meta_read.fire()) && s1_tag_match && s1_valid)
  io.replace_access.bits.set := RegNext(get_idx(s1_req.addr))
  io.replace_access.bits.way := RegNext(OHToUInt(s1_tag_match_way))
  //we don't need read data or create fake meta somestuff

  // -----------------------------------------------------------------------------------------------
  //stage 2
  val s2_valid = RegInit(false.B)
  val s2_req = RegEnable(s1_req, s1_fire)
  val s2_addr = RegEnable(s1_addr, s1_fire)
  val s2_vaddr = RegEnable(s1_vaddr, s1_fire)
  val s2_bank_oh = RegEnable(s1_bank_oh, s1_fire)
  s2_ready := true.B

  when (s1_fire) { s2_valid := !io.l1dprefetch.s1_kill}
  .elsewhen(io.l1dprefetch.resp.fire()) { s2_valid := false.B}

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
  val s2_way_en = RegEnable(s1_way_en, s1_fire)
  val s2_repl_coh = RegEnable(s1_repl_coh, s1_fire)
  val s2_repl_tag = RegEnable(s1_repl_tag, s1_fire)
  //send miss
  // send load miss to miss queue

  io.miss_req.valid := s2_valid && !s2_hit && !io.l1dprefetch.s2_kill
  io.miss_req.bits := DontCare
  io.miss_req.bits.source := LOAD_SOURCE.U
  io.miss_req.bits.cmd := s2_req.cmd
  io.miss_req.bits.addr := get_block_addr(s2_addr)
  io.miss_req.bits.vaddr := s2_vaddr
  io.miss_req.bits.way_en := s2_way_en
  io.miss_req.bits.req_coh := s2_hit_coh
  io.miss_req.bits.replace_coh := s2_repl_coh
  io.miss_req.bits.replace_tag := s2_repl_tag

  //send back response
  val resp = Wire(ValidIO(new DCacheWordResp))
  resp.valid := s2_valid
  resp.bits := DontCare
  resp.bits.miss := !s2_hit 

  io.l1dprefetch.resp.valid := resp.valid
  io.l1dprefetch.resp.bits := resp.bits

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

  XSPerfAccumulate("prefetch_req", io.l1dprefetch.req.fire())
  XSPerfAccumulate("prefetch_s1_kill", s1_fire && io.l1dprefetch.s1_kill)
  XSPerfAccumulate("prefetch_hit_way", s1_fire && s1_tag_match)
  XSPerfAccumulate("prefetch_hit", io.l1dprefetch.resp.fire() && !resp.bits.miss)
  XSPerfAccumulate("prefetch_miss", io.l1dprefetch.resp.fire() && resp.bits.miss)
}