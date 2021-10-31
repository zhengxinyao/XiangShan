package xiangshan.mem.strideprefetch
//add by tjz
import chipsalliance.rocketchip.config.{Parameters, Field}
import chisel3._
import chisel3.util._
import xiangshan._
import xiangshan.cache.mmu.{HasTlbConst}
import xiangshan.backend._
import xiangshan.mem._
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
  val cc = UInt((l1dStrideParameters.rptTimeBits).W)//10bits
  val updown = Bool()//1bits
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
  //def getPageNum(vaddr: UInt) = vaddr(VAddrBits - 1, untagBits)//vaddr(38, 14), 25.W
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
  //val crosspage = Wire(Bool())
  //check whether the addr is at the same cacheline
  val sameline = Wire(Bool())
  //stride is good
  val stride_is_good = Wire(Bool())
  //tag is good
  val tag_is_good = Wire(Bool())

  val s_idle :: s_init :: s_tran :: s_stand :: s_steady :: Nil = Enum(5)
  //below is entry for write
  val entry_new = Reg(rptTableEntry())

  //below is for update, which's 1 cycle before writs
  val pc_forupdate = RegNext(io.train.req.bits.pc)
  val vaddr_forupdate = RegNext(io.train.req.bits.reqVaddr)
  val valid_forupdate = RegNext(io.train.req.valid)
  //below is from another apt's req
  val req_fromAnotherRpt_pcUpdate = RegNext(io.train.reqFromAnotherRpt.bits.pc)
  val req_fromAnotherRpt_vaddrUpdate = RegNext(io.train.reqFromAnotherRpt.bits.reqVaddr)
  val req_fromAnotherRpt_validUpdate = RegNext(io.train.reqFromAnotherRpt.valid)
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
    oldEntryRespToSelfRpt.tag := RegNext(entry_new.tag)
    oldEntryRespToSelfRpt.preVaddr := RegNext(entry_new.preVaddr)
    oldEntryRespToSelfRpt.stride := RegNext(entry_new.stride)
    oldEntryRespToSelfRpt.state := RegNext(entry_new.state)
    oldEntryRespToSelfRpt.cc := RegNext(entry_new.cc)
    oldEntryRespToSelfRpt.updown := RegNext(entry_new.updown)

    oldEntryRespToAnotherRpt.tag := RegNext(entry_new.tag)
    oldEntryRespToAnotherRpt.preVaddr := RegNext(entry_new.preVaddr)
    oldEntryRespToAnotherRpt.stride := RegNext(entry_new.stride)
    oldEntryRespToAnotherRpt.state := RegNext(entry_new.state)
    oldEntryRespToAnotherRpt.cc := RegNext(entry_new.cc)
    oldEntryRespToAnotherRpt.updown := RegNext(entry_new.updown)
  }
  //to solve r/r back to back
  val rr_same = RegInit(false.B)
  rr_same := idx(io.train.req.bits.pc) === idx(pc_forupdate)
  when(rr_same) {
    oldEntryRespToSelfRpt.tag := entry_new.tag
    oldEntryRespToSelfRpt.preVaddr := entry_new.preVaddr
    oldEntryRespToSelfRpt.stride := entry_new.stride
    oldEntryRespToSelfRpt.state := entry_new.state
    oldEntryRespToSelfRpt.cc := entry_new.cc
    oldEntryRespToSelfRpt.updown := entry_new.updown

    oldEntryRespToAnotherRpt.tag := entry_new.tag
    oldEntryRespToAnotherRpt.preVaddr := entry_new.preVaddr
    oldEntryRespToAnotherRpt.stride := entry_new.stride
    oldEntryRespToAnotherRpt.state := entry_new.state
    oldEntryRespToAnotherRpt.cc := entry_new.cc
    oldEntryRespToAnotherRpt.updown := entry_new.updown
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
  val updown_update = WireInit(true.B)
  val engage_state = Mux(oldEntryRespFromAnotherRpt.bits.state >= oldEntryRespToSelfRpt.state, oldEntryRespFromAnotherRpt.bits.state, oldEntryRespToSelfRpt.state)
  val engage_cc = WireInit(0.U(rptTimeBits.W))
  //to get the minest stride, for example, stride 2
  //0 4 10 56  76
  //2 6 8  44  66
  //above is two loadlines but they have the same pc, we need to find out the stride = 2
  when(pc_forupdate === req_fromAnotherRpt_pcUpdate) {
    stride_min := Mux(vaddr_forupdate >= req_fromAnotherRpt_vaddrUpdate, 
    vaddr_forupdate - req_fromAnotherRpt_vaddrUpdate,
    req_fromAnotherRpt_vaddrUpdate - vaddr_forupdate
    )
    updown_update := true.B
    engage_cc := cc_forupdate
  }.otherwise {
    when(vaddr_forupdate >= oldEntryRespToSelfRpt.preVaddr){
      strideSubSelf := vaddr_forupdate - oldEntryRespToSelfRpt.preVaddr
      updown_update := true.B
    }.otherwise {
      strideSubSelf := oldEntryRespToSelfRpt.preVaddr - vaddr_forupdate
      updown_update := false.B
    }
    when(vaddr_forupdate >= oldEntryRespFromAnotherRpt.bits.preVaddr){
      strideSubAnother := vaddr_forupdate - oldEntryRespFromAnotherRpt.bits.preVaddr
      updown_update := true.B
    }.otherwise {
      strideSubAnother := oldEntryRespFromAnotherRpt.bits.preVaddr - vaddr_forupdate
      updown_update := false.B
    }
    stride_min := Mux(strideSubAnother >= strideSubSelf, strideSubSelf, strideSubAnother)
    engage_cc := Mux(oldEntryRespToSelfRpt.cc >= oldEntryRespFromAnotherRpt.bits.cc, oldEntryRespToSelfRpt.cc, oldEntryRespFromAnotherRpt.bits.cc)
  }
  when(engage_state === s_steady){
    stride_is_good := stride_min === oldEntryRespToSelfRpt.stride
  }.otherwise{
    stride_is_good := (stride_min === oldEntryRespToSelfRpt.stride) && (updown_update === oldEntryRespToSelfRpt.updown)
  }
  tag_is_good := oldEntryRespToSelfRpt.tag === tag(pc_forupdate)
  //statemachine
  when(engage_state === s_idle) {
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

  when(engage_state === s_init) {
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

  when(engage_state === s_tran) {
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

  when(engage_state === s_stand) {
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

  when(engage_state === s_steady) {
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
  io.train.reqToAnotherRpt.bits.reqVaddr := io.train.req.bits.reqVaddr
  io.train.reqToAnotherRpt.bits.pc := io.train.req.bits.pc

  io.train.respToAnotherRpt.valid := req_fromAnotherRpt_validUpdate//1 cyclie later
  io.train.respToAnotherRpt.bits.tag := oldEntryRespToAnotherRpt.tag
  io.train.respToAnotherRpt.bits.preVaddr := oldEntryRespToAnotherRpt.preVaddr
  io.train.respToAnotherRpt.bits.stride := oldEntryRespToAnotherRpt.stride
  io.train.respToAnotherRpt.bits.state := oldEntryRespToAnotherRpt.state
  io.train.respToAnotherRpt.bits.cc := oldEntryRespToAnotherRpt.cc
  io.train.respToAnotherRpt.bits.updown := oldEntryRespToAnotherRpt.updown
  //control the out data and out valid
  //check whether cross page
  //check whether in the same cacheline
  val finalPredict_vaddr = WireInit(0.U(VAddrBits.W))
  val timeChecker = RegInit(0.U(rptTimeBits.W))
  when(cc_forupdate < engage_cc) {
      timeChecker := cc_forupdate +& rptTimeMax.U - engage_cc
  }.otherwise {
      timeChecker := cc_forupdate - engage_cc
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

  //crosspage := getPageNum(finalPredict_vaddr) =/= getPageNum(vaddr_forout)
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
    XSDebug("rptpcReqSelf: %x rptVaddrReq: %x rptvalidReq: %d\n", rAddr0 ,io.train.req.bits.reqVaddr, rptTables(0).io.r.req.valid)
    XSDebug("rptpcReqOther: %x rptVaddrReq: %x rptvalidReq: %d\n", rAddr1 ,io.train.req.bits.reqVaddr, rptTables(1).io.r.req.valid)    
  }
  when(valid_forupdate) {
    XSDebug("pc_forupdate: %x vaddr_forupdate: %x cc_forupdate: %d valid_forupdate: %d\n", pc_forupdate, vaddr_forupdate, cc_forupdate ,valid_forupdate)
    XSDebug("tag_old: %x preVaddr_old: %x stride_old: %x state_old: %x cc_old: %d updown_old: %d\n", oldEntryRespToSelfRpt.tag, oldEntryRespToSelfRpt.preVaddr, oldEntryRespToSelfRpt.stride, oldEntryRespToSelfRpt.state, oldEntryRespToSelfRpt.cc, oldEntryRespToSelfRpt.updown)
    XSDebug("tag_from_ot: %x preVaddr_from_ot: %x stride_from_ot: %x state_from_ot: %x cc_from_ot: %x updown_from_ot: %x", oldEntryRespFromAnotherRpt.bits.tag, oldEntryRespFromAnotherRpt.bits.preVaddr, oldEntryRespFromAnotherRpt.bits.stride, oldEntryRespFromAnotherRpt.bits.state, oldEntryRespFromAnotherRpt.bits.cc, oldEntryRespFromAnotherRpt.bits.updown)
  }
  when(valid_forwrite) {
    XSDebug("pc_forwrite: %x vaddr_forout: %x valid_forwrite: %d\n", pc_forwrite, vaddr_forout, valid_forwrite)
    XSDebug("valid_forwrite: %d finaltag: %x finalpreVaddr: %x finalstride: %x finalstate: %x finalcc: %d timeChecker: %d updown_new: %d\n", valid_forwrite, entry_new.tag, finalPredict_vaddr, entry_new.stride, entry_new.state, entry_new.cc, timeChecker, entry_new.updown)
    XSDebug("vaddr_forout: %x finalpreVaddr: %x finalstride: %x timeChecker: %d upORdown: %d\n", vaddr_forout, finalPredict_vaddr, entry_new.stride, timeChecker, entry_new.updown)
  }
  XSPerfAccumulate("fire_pefetch_numbers", io.train.resp.fire())
}
