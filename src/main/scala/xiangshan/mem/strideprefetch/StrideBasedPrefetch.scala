package xiangshan.mem
//add by tjz
import chipsalliance.rocketchip.config.{Parameters, Field}
import chisel3._
import chisel3.util._
import xiangshan._
import xiangshan.cache.mmu.{HasTlbConst}
import xiangshan.backend._
import xiangshan.mem.strideprefetch._
import utils._

case class SBPParameters(
  rptEntries: Int,
  rptTagBits: Int,
  preVaddrBits: Int,
  rptStrideBits: Int,
  rptStateBits: Int,
  rptTimeMax: Int,
  prefetchCostTimeMax: Int
) {
  def rptIdxBits = log2Up(rptEntries)
  def rptTimeBits = log2Up(rptTimeMax)
}

class RptResp(implicit p: Parameters) extends XSBundle {
  val respVaddr = UInt(VAddrBits.W)
  //val exuin = new ExuInput
}

class RptEntryResp(implicit p: Parameters) extends XSBundle {
  val tag = UInt((l1dStrideParameters.rptTagBits).W)//12bits
  val preVaddr = UInt((l1dStrideParameters.preVaddrBits).W)//12bits
  val stride = UInt((l1dStrideParameters.rptStrideBits).W)//12bits
  val state = UInt((l1dStrideParameters.rptStateBits).W)//3bits
  val cc = UInt((l1dStrideParameters.rptTimeBits).W)
  val updown = Bool()
}

class RptBundle(implicit p: Parameters) extends XSBundle {
  val reqFromAnotherRpt = DecoupledIO(new ToStrideReq)
  val reqToAnotherRpt = Flipped(DecoupledIO(new ToStrideReq))
  val respToAnotherRpt = Flipped(DecoupledIO(new RptEntryResp))
  val respFromAnotherRpt = DecoupledIO(new RptEntryResp)
  val req = DecoupledIO(new ToStrideReq)
  val resp = Flipped(DecoupledIO(new RptResp))
}

class StrideBasedPrefetch(implicit p: Parameters) extends XSModule with HasTlbConst {
  val io = IO(new Bundle{
      //id
      val train = Flipped(new RptBundle)
  })
  def rptIdxBits = l1dStrideParameters.rptIdxBits
  def rptTagBits = l1dStrideParameters.rptTagBits
  def preVaddrBits = l1dStrideParameters.preVaddrBits
  def rptStateBits = l1dStrideParameters.rptStateBits
  def rptEntries = l1dStrideParameters.rptEntries
  def rptStrideBits = l1dStrideParameters.rptStrideBits
  def rptTimeMax = l1dStrideParameters.rptTimeMax
  def rptTimeBits = l1dStrideParameters.rptTimeBits
  def prefetchCostTimeMax = l1dStrideParameters.prefetchCostTimeMax
  def dcachenSets = dcacheParameters.nSets
  def dcacheBlockBytes = dcacheParameters.blockBytes
  def untagBits = log2Up(dcachenSets) + log2Up(dcacheBlockBytes)
  //rpt table is directly mapped, using hashed partial addrs to access
  //each entry holds these: tag(12bits), prevaddrs(10bits), stride(10bits), state(2bits), time(2bits), totally 36bits
  //use PC(9, 2) ^ PC(17, 10) = idx, use idx(8bits) to access Rpt table
  //use PC(21, 10) to be the tag(12 bits)
  //use reqVaddr(11, 2) tp be the preVaddr, use the new and old reqVaddr's difference to be teh stide
  //Also, the reqVaddr(1, 0) was ignored because the Granularity of calculate addr is 32bits(4B)
  //use the state to record the stride's credibility
  //when tag dosen't match, use the time to decide abandone it or not(when pc miss/hit, time -/+1. when time ==0, abandone the tag)
  def usedPc(pc: UInt) = pc(VAddrBits - 1, 2) //pc(38, 2), except pc(1, 0), 37.W
  def hash1(pc: UInt) = usedPc(pc)(rptIdxBits - 1, 0) //pc(9. 2), 8.W
  def hash2(pc: UInt) = usedPc(pc)(2 * rptIdxBits - 1, rptIdxBits)//pc(17, 10), 8.W
  def idx(pc: UInt) = hash1(pc) ^ hash2(pc)//8.W
  def tag(pc: UInt) = usedPc(pc)(rptTagBits + rptIdxBits - 1, rptIdxBits)//pc(21, 10)//12.W
  //above is relevant about pc
  def usedVaddr(vaddr: UInt) = vaddr(untagBits - 1, 2)//12.W
  def getPageNum(vaddr: UInt) = vaddr(VAddrBits - 1, untagBits)//vaddr(38, 14), 25.W
  def getIdxNum(vaddr: UInt) = vaddr(offLen - 1, 6)
  
  def rptTableEntry() = new Bundle {
    val tag = UInt(rptTagBits.W)//12bits
    val preVaddr = UInt(preVaddrBits.W)//12bits
    val stride = UInt(rptStrideBits.W)//12bits
    val state = UInt(rptStateBits.W)//3bits
    val cc = UInt(rptTimeBits.W)
    val updown = Bool()
  }

  val clock_in_stride = Counter(rptTimeMax)
  clock_in_stride.inc()

  //check whether crosspage
  val crosspage = Wire(Bool())
  //check whether the addr is at the same cacheline
  val sameline = Wire(Bool())
  //stride is good
  val stride_is_good = Wire(Bool())
  //tag is good
  val tag_is_good = Wire(Bool())
  //for all the possible stride
  val nstride = Wire(Vec((untagBits - 2), Bool()))
  nstride(0) := false.B
  //create the new members

  val s_idle :: s_init :: s_tran :: s_stand :: s_steady :: Nil = Enum(5)
  //below is entry for write
  val entry_new = Reg(rptTableEntry)

  //below is for update, which's 1 cycle before writs
  val pc_forupdate = RegNext(io.train.req.bits.pc)
  val vaddr_forupdate = RegNext(io.train.req.bits.reqVaddr)
  val valid_forupdate = RegNext(io.train.req.valid)
  //below is from another apt's req
  val req_fromAnotherRpt = RegNext(io.train.reqFromAnotherRpt)
  //below is for write             
  val pc_forwrite = RegNext(pc_forupdate)
  val vaddr_forout = RegNext(vaddr_forupdate)
  val valid_forwrite = RegNext(valid_forupdate)
  //below is req from ld0 & ld1, they read different, write in the same  
  val rAddr0 = io.train.req.bits.pc
  val rAddr1 = io.train.reqFromAnotherRpt.bits.pc
  val oldEntryRespToSelfRpt = Wire(rptTableEntry())
  val oldEntryRespToAnotherRpt = Wire(rptTableEntry())
  val wAddr = pc_forwrite

  val rptTables = (0 until SbpPrefetchSize) map { bank =>
    val rptTable = Module(new SRAMTemplate(rptTableEntry(), set = rptEntries, way = 1, shouldReset = true, singlePort = false))
    // connection
    if(bank == 0) {
      rptTable.io.r.req.valid := io.train.reqFromAnotherRpt.fire() && (idx(rAddr0) =/= idx(pc_forwrite))
      rptTable.io.r.req.bits.setIdx := idx(rAddr0)
      oldEntryRespToSelfRpt <> rptTable.io.r.resp.data(0)
    }else{
      rptTable.io.r.req.valid := io.train.req.fire() && (idx(rAddr1) =/= idx(pc_forwrite))
      rptTable.io.r.req.bits.setIdx := idx(rAddr1)
      oldEntryRespToAnotherRpt <> rptTable.io.r.resp.data(0)
    }
    rptTable.io.w.req.valid := valid_forwrite
    rptTable.io.w.req.bits.setIdx := idx(wAddr)
    rptTable.io.w.req.bits.data(0) <> entry_new

    rptTable
  }

  //to solve the r/w in the same address and time
  val rw_same = RegInit(false.B)
  rw_same := idx(io.train.req.bits.pc) === idx(pc_forwrite)
  //to solve write&&read at the same entry in the same time
  when(rw_same) {
    oldEntryRespToSelfRpt <> RegNext(entry_new)
    oldEntryRespToAnotherRpt <> RegNext(entry_new)
  }
  //to solve r/r back to back
  val rr_same = RegInit(false.B)
  rr_same := idx(io.train.req.bits.pc) === idx(pc_forupdate)
  when(rr_same) {
    oldEntryRespToSelfRpt <> entry_new
    oldEntryRespToAnotherRpt <> entry_new
  }

  val cc_forupdate = RegInit(0.U(rptTimeBits.W))  
  cc_forupdate := clock_in_stride.value
  entry_new.cc := cc_forupdate

  // now, we get two oldEntries, one comes from selfRpt, one comes from anotherRpt
  val oldEntryRespFromAnotherRpt = io.train.respFromAnotherRpt
//and oldEntryRespToSelfRpt
  // we will compare three vaddrs
  // 1.vaddr_forupdate; 2.oldEntryRespToSelfRpt.respVadr; 3.oldEntryRespFromAnotherRpt.respVaddr.
  val stride_min  = WireInit(0.U(rptStrideBits.W))
  val strideSubSelf = WireInit(0.U(rptStrideBits.W))
  val strideSubAnother = WireInit(0.U(rptStrideBits.W))
  val updown_update = Bool()
  //to get the minest stride, for example, stride 2
  //0 4 10 56  76
  //2 6 8  44  66
  //above is two loadlines but they have the same pc, we need to find out the stride = 2
  when(pc_forupdate === req_fromAnotherRpt.bits.pc) {
    stride_min := Mux(vaddr_forupdate >= req_fromAnotherRpt.bits.reqVaddr, 
    vaddr_forupdate - req_fromAnotherRpt.bits.reqVaddr,
    req_fromAnotherRpt.bits.reqVaddr - vaddr_forupdate
    )
    updown_update := true.B
  }.otherwise {
    when(vaddr_forupdate >= oldEntryRespToSelfRpt){
      strideSubSelf := vaddr_forupdate - oldEntryRespToSelfRpt.preVaddr
      updown_update := true.B
    }.otherwise {
      strideSubSelf := oldEntryRespToSelfRpt.preVaddr - vaddr_forupdate
      updown_update := false.B
    }
    when(vaddr_forupdate >= oldEntryRespFromAnotherRpt){
      strideSubAnother := vaddr_forupdate - oldEntryRespFromAnotherRpt.respVaddr
      updown_update := true.B
    }.otherwise {
      strideSubAnother := oldEntryRespFromAnotherRpt.respVaddr - vaddr_forupdate
      updown_update := false.B
    }
    stride_min := Mux(strideSubAnother >= strideSubSelf, strideSubSelf, strideSubAnother)
  }
  when(oldEntryRespToSelfRpt.state === s_steady){
    stride_is_good := stride_min === oldEntryRespToSelfRpt.stride
  }.otherwise{
    stride_is_good := (stride_min === oldEntryRespToSelfRpt.stride) && (updown_update === oldEntryRespToSelfRpt.updown)
  }
  tag_is_good := oldEntryRespToSelfRpt.tag === tag(pc_forupdate)
  //statemachine
  when(oldEntryRespToSelfRpt.state === s_idle) {
    when(!tag_is_good) {
      entry_new.tag := tag(pc_forupdate)
      entry_new.preVaddr := usedVaddr(vaddr_forupdate)
      entry_new.stride := 0.U
      entry_new.state := s_idle
      entry_new.updown := true.B
    }.otherwise {
      entry_new.tag := oldEntryRespToSelfRpt.tag
      entry_new.preVaddr := usedVaddr(vaddr_forupdate)
      entry_new.stride := stride_min
      entry_new.updown := updown_update
      entry_new.state := s_init
    }
  }

  when(oldEntryRespToSelfRpt.state === s_init) {
    when(tag_is_good && stride_is_good) {
      entry_new.tag := oldEntryRespToSelfRpt.tag
      entry_new.preVaddr := usedVaddr(vaddr_forupdate)
      entry_new.stride := oldEntryRespToSelfRpt.stride
      entry_new.state := s_tran
      entry_new.updown := oldEntryRespToSelfRpt.updown
    }.elsewhen(!tag_is_good) {
      entry_new.tag := tag(pc_forupdate)
      entry_new.preVaddr := usedVaddr(vaddr_forupdate)
      entry_new.stride := 0.U
      entry_new.state := s_idle
      entry_new.updown := true.B
    }.elsewhen(!stride_is_good) {
      entry_new.tag := oldEntryRespToSelfRpt.tag
      entry_new.preVaddr := usedVaddr(vaddr_forupdate)
      entry_new.stride := stride_min
      entry_new.updown := updown_update
      entry_new.state := s_init
    }
  }

  when(state_old === s_tran) {
    when(tag_is_good && stride_is_good) {
      entry_new.tag := oldEntryRespToSelfRpt.tag
      entry_new.preVaddr := usedVaddr(vaddr_forupdate)
      entry_new.stride := oldEntryRespToSelfRpt.stride
      entry_new.state := s_stand
      entry_new.updown := oldEntryRespToSelfRpt.updown
    }.elsewhen(!tag_is_good) {
      entry_new.tag := tag(pc_forupdate)
      entry_new.preVaddr := usedVaddr(vaddr_forupdate)
      entry_new.stride := 0.U
      entry_new.state := s_idle
      entry_new.updown := true.B
    }.elsewhen(!stride_is_good) {
      entry_new.tag := oldEntryRespToSelfRpt.tag
      entry_new.preVaddr := usedVaddr(vaddr_forupdate)
      entry_new.stride := stride_min
      entry_new.updown := updown_update
      entry_new.state := s_init
    }
  }

  when(oldEntryRespToSelfRpt.state === s_stand) {
    when(tag_is_good && stride_is_good) {
      entry_new.tag := oldEntryRespToSelfRpt.tag
      entry_new.preVaddr := usedVaddr(vaddr_forupdate)
      entry_new.stride := oldEntryRespToSelfRpt.stride
      entry_new.state := s_steady
      entry_new.updown := oldEntryRespToSelfRpt.updown
    }.elsewhen(!tag_is_good) {
      entry_new.tag := tag(pc_forupdate)
      entry_new.preVaddr := usedVaddr(vaddr_forupdate)
      entry_new.stride := 0.U
      entry_new.state := s_idle
      entry_new.updown := true.B
    }.elsewhen(!stride_is_good) {
      entry_new.tag := oldEntryRespToSelfRpt.tag
      entry_new.preVaddr := usedVaddr(vaddr_forupdate)
      entry_new.state := s_init
      entry_new.stride := stride_min
      entry_new.updown := updown_update
    }
  }

  when(oldEntryRespToSelfRpt.state === s_steady) {
    when(tag_is_good && stride_is_good) {
      entry_new.tag := oldEntryRespToSelfRpt.tag
      entry_new.preVaddr := usedVaddr(vaddr_forupdate)
      entry_new.stride := oldEntryRespToSelfRpt.stride
      entry_new.state := s_steady
      entry_new.updown := oldEntryRespToSelfRpt.updown
    }.elsewhen(!tag_is_good) {
      entry_new.tag := tag(pc_forupdate)
      entry_new.preVaddr := usedVaddr(vaddr_forupdate)
      entry_new.stride := 0.U
      entry_new.state := s_idle
      entry_new.updown := true.B
    }.elsewhen(!stride_is_good) {
      entry_new.tag := tag(pc_forupdate)
      entry_new.preVaddr := usedVaddr(vaddr_forupdate)
      entry_new.stride := stride_min
      entry_new.state := s_idle
      entry_new.updown := updown_update
    }
  }

  //contol the in ready
  io.train.req.ready := true.B
  io.train.reqFromAnotherRpt.ready := true.B
  io.train.respFromAnotherRpt.ready := true.B

  io.train.reqToAnotherRpt.valid := io.train.req.valid
  io.train.respToAnotherRpt.valid := req_fromAnotherRpt.valid//1 cyclie later

  //control the out data and out valid
  //check whether cross page
  //check whether in the same cacheline
  val finalPredict_vaddr = WireInit(0.U(VAddrBits.W))
  val timeChecker = RegInit(0.U(rptTimeBits.W))
  when(cc_forupdate < oldEntryRespToSelfRpt.cc) {
      timeChecker := cc_forupdate +& rptTimeMax.U - oldEntryRespToSelfRpt.cc
  }.otherwise {
      timeChecker := cc_forupdate - oldEntryRespToSelfRpt.cc
  }

  when(entry_new.state === s_stand || entry_new.state === s_steady) {
    when(timeChecker <= (prefetchCostTimeMax >> 2).U) {
      when(entry_new.updown){
        finalPredict_vaddr := vaddr_forout + ((entry_new.stride << (log2Up(prefetchCostTimeMax >> 4) + 2)))
      }.otherwise{
        finalPredict_vaddr := vaddr_forout - ((entry_new.stride << (log2Up(prefetchCostTimeMax >> 4) + 2)))
      }
    }.otherwise {
      when(entry_new.updown){
        finalPredict_vaddr := vaddr_forout + (entry_new.stride << 3)
      }.otherwise{
        finalPredict_vaddr := vaddr_forout - (entry_new.stride << 3)
      }
    }
  }
    
  io.train.resp.bits.respVaddr := finalPredict_vaddr

  crosspage := getPageNum(finalPredict_vaddr) =/= getPageNum(vaddr_forout)
  sameline := getIdxNum(finalPredict_vaddr) === getIdxNum(vaddr_forout)
  
  when((entry_new.state === s_stand || entry_new.state === s_steady) && valid_forwrite) {
    when(sameline) {
      io.train.resp.valid := false.B
    }.otherwise {
      io.train.resp.valid := true.B 
    }
  }.otherwise {
    io.train.resp.valid := false.B
  }

  when(io.train.req.fire()) {
    XSDebug("rptpcReq: %x rptVaddrReq: %x rptvalidReq: %d\n", rAddr, io.train.req.bits.reqVaddr, rptTable.io.r.req.valid)
  }
  when(valid_forupdate) {
    XSDebug("pc_forupdate: %x vaddr_forupdate: %x cc_forupdate: %d valid_forupdate: %d\n", pc_forupdate, vaddr_forupdate, cc_forupdate ,valid_forupdate)
    XSDebug("tag_old: %x preVaddr_old: %x stride_old: %x state_old: %x cc_old: %d updown_old: %d\n", oldEntryRespToSelfRpt.tag, oldEntryRespToSelfRpt.preVaddr, oldEntryRespToSelfRpt.stride, oldEntryRespToSelfRpt.state, oldEntryRespToSelfRpt.cc, oldEntryRespToSelfRpt.updown)
  }
  when(valid_forwrite) {
    XSDebug("pc_forwrite: %x vaddr_forout: %x valid_forwrite: %d\n", pc_forwrite, vaddr_forout, valid_forwrite)
    XSDebug("valid_forwrite: %d finaltag: %x finalpreVaddr: %x finalstride: %x finalstate: %x finalcc: %d timeChecker: %d updown_new: %d\n", valid_forwrite, entry_new.tag, finalPredict_vaddr, entry_new.stride, entry_new.state, entry_new.cc, timeChecker, entry_new.updown)
    XSDebug("vaddr_forout: %x finalpreVaddr: %x finalstride: %x timeChecker: %d upORdown: %d\n", vaddr_forout, finalPredict_vaddr, stride_new, timeChecker, updown_new)
  }
  XSPerfAccumulate("fire_pefetch_numbers", io.train.resp.fire())
}
