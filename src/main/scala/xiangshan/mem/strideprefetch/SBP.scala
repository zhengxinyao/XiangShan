package xiangshan.mem.strideprefetch

import chipsalliance.rocketchip.config.{Parameters, Field}
import chisel3._
import chisel3.util._
import xiangshan._
import xiangshan.cache.mmu.{HasTlbConst}
import xiangshan.backend._
import xiangshan.mem._
import utils._

// case class SBPParameters(
//   rptEntries: Int,
//   rptTagBits: Int,
//   preVaddrBits: Int,
//   rptStrideBits: Int,
//   rptStateBits: Int,
//   rptTimeMax: Int,
//   prefetchCostTimeMax: Int
// ) {
//   def rptIdxBits = log2Up(rptEntries)
//   def rptTimeBits = log2Up(rptTimeMax)
// }

// class RptResp(implicit p: Parameters) extends XSBundle {
//   val respVaddr = UInt(VAddrBits.W)
// }

class RptIO(implicit p: Parameters) extends XSBundle {
  val req = DecoupledIO(new ToStrideReq)
  val resp = Flipped(DecoupledIO(new RptResp))
}

class SBP(implicit p: Parameters) extends XSModule with HasTlbConst {
  val io = IO(new Bundle{
      val train = Flipped(new RptIO)
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
  //use reqVaddr(11, 2) tp be the preVaddr, use the new and old reqVaddr's difference to be teh stride
  //Also, the reqVaddr(1, 0) was ignored because the Granularity of calculate addr is 32bits(4B)
  //use the state to record the stride's credibility
  //when tag dosen't match, use the time to decide abandone it or not(when pc miss/hit, time -/+1. when time ==0, abandone the tag)
  def usedPc(pc: UInt) = pc(VAddrBits - 1, 2) //pc(38, 2), except pc(1, 0), 37.W
  def hash1(pc: UInt) = usedPc(pc)(rptIdxBits - 1, 0) //pc(9. 2), 8.W
  def hash2(pc: UInt) = usedPc(pc)(2 * rptIdxBits - 1, rptIdxBits)//pc(17, 10), 8.W
  def idx(pc: UInt) = hash1(pc) ^ hash2(pc)//8.W
  def tag(pc: UInt) = usedPc(pc)(rptTagBits + rptIdxBits - 1, rptIdxBits)//pc(21, 10)//12.W
  //above is relevant about pc
  def usedVaddr(vaddr: UInt) = vaddr((preVaddrBits - 1), 2)//12.W
  //def getPageNum(vaddr: UInt) = vaddr(VAddrBits - 1, untagBits)//vaddr(38, 14), 25.W
  def getIdxNum(vaddr: UInt) = vaddr(offLen - 1, log2Up(dcacheBlockBytes))
  
  def rptTableEntry() = new Bundle {
    val tag = UInt(rptTagBits.W)//12bits
    val preVaddr = UInt(preVaddrBits.W)//12bits
    val stride = UInt(rptStrideBits.W)//12bits
    val state = UInt(rptStateBits.W)//3bits
    val cc = UInt(rptTimeBits.W)
  }

  val s_idle :: s_init :: s_tran :: s_stand :: s_steady :: Nil = Enum(5)
  //below is entry for write
  val tag_new = RegInit(0.U(rptTagBits.W))
  val preVaddr_new = RegInit(0.U(preVaddrBits.W))
  val stride_new = RegInit(0.U(rptStrideBits.W))
  val state_new = RegInit(s_idle)
  val cc_new = RegInit(0.U(rptTimeBits.W))

  //below is for update, which's 1 cycle before writs
  val pc_forupdate = RegNext(io.train.req.bits.pc)
  val vaddr_forupdate = RegNext(io.train.req.bits.reqVaddr)
  val valid_forupdate = RegNext(io.train.req.valid)
  //below is for write             
  val pc_forwrite = RegNext(pc_forupdate)
  val vaddr_forout = RegNext(vaddr_forupdate)
  val valid_forwrite = RegNext(valid_forupdate)
  //below is req from ld0 & ld1, they read different, write in the same  
  val rAddr0 = io.train.req.bits.pc
  val oldEntryRespToSelfRpt = Wire(rptTableEntry())
  val wAddr = pc_forwrite

//   when (io.train.req.fire()) {
//     printf("time=[%d] pc 0x%x vaddr 0x%x input\n", GTimer(), 
//     io.train.req.bits.pc, 
//     io.train.req.bits.reqVaddr)
//   }

  val rptTable = Module(new SRAMTemplate(rptTableEntry(), set = rptEntries, way = 1, shouldReset = true, singlePort = false))
  // connection
  rptTable.io.r.req.valid := io.train.req.fire()
  rptTable.io.r.req.bits.setIdx := idx(rAddr0)
  oldEntryRespToSelfRpt.tag := rptTable.io.r.resp.data(0).tag
  oldEntryRespToSelfRpt.preVaddr := rptTable.io.r.resp.data(0).preVaddr
  oldEntryRespToSelfRpt.stride := rptTable.io.r.resp.data(0).stride
  oldEntryRespToSelfRpt.state := rptTable.io.r.resp.data(0).state
  oldEntryRespToSelfRpt.cc := rptTable.io.r.resp.data(0).cc
  rptTable.io.w.req.valid := valid_forwrite
  rptTable.io.w.req.bits.setIdx := idx(wAddr)
  rptTable.io.w.req.bits.data(0).tag := tag_new
  rptTable.io.w.req.bits.data(0).preVaddr := preVaddr_new
  rptTable.io.w.req.bits.data(0).stride := stride_new
  rptTable.io.w.req.bits.data(0).state := state_new
  rptTable.io.w.req.bits.data(0).cc := cc_new

  //to solve the r/w in the same address and time
  val rw_same_self = RegInit(false.B)
  rw_same_self := (idx(io.train.req.bits.pc) === idx(pc_forwrite)) && io.train.req.valid && valid_forwrite
  //to solve write&&read at the same entry in the same time
  when(rw_same_self) {
    oldEntryRespToSelfRpt.tag := RegNext(tag_new)
    oldEntryRespToSelfRpt.preVaddr := RegNext(preVaddr_new)
    oldEntryRespToSelfRpt.stride := RegNext(stride_new)
    oldEntryRespToSelfRpt.state := RegNext(state_new)
    oldEntryRespToSelfRpt.cc := RegNext(cc_new)
  }
  //to solve r/r back to back
  val rr_same_self = RegInit(false.B)
  rr_same_self := idx(io.train.req.bits.pc) === idx(pc_forupdate) && io.train.req.valid && valid_forupdate
  when(rr_same_self) {
    oldEntryRespToSelfRpt.tag := tag_new
    oldEntryRespToSelfRpt.preVaddr := preVaddr_new
    oldEntryRespToSelfRpt.stride := stride_new
    oldEntryRespToSelfRpt.state := state_new
    oldEntryRespToSelfRpt.cc := cc_new
  }

  val clock_in_stride = Counter(rptTimeMax)
  clock_in_stride.inc()

  val cc_forupdate = RegInit(0.U(rptTimeBits.W))  
  cc_forupdate := clock_in_stride.value
  cc_new := cc_forupdate

  val stride            = usedVaddr(vaddr_forupdate) - oldEntryRespToSelfRpt.preVaddr
  val stride_is_good    = stride === oldEntryRespToSelfRpt.stride && stride =/= 0.U
  val tag_is_good       = oldEntryRespToSelfRpt.tag === tag(pc_forupdate) 
  val self_is_good      = stride_is_good && tag_is_good
  val engage_cc         = oldEntryRespToSelfRpt.cc
  val engage_state      = oldEntryRespToSelfRpt.state

  //statemachine
  when(engage_state === s_idle) {
    when(!(tag_is_good)) {
      tag_new := tag(pc_forupdate)
      preVaddr_new := usedVaddr(vaddr_forupdate)
      stride_new := 0.U
      state_new := s_idle
    }.otherwise {
      tag_new := tag(pc_forupdate)
      preVaddr_new := usedVaddr(vaddr_forupdate)
      stride_new := stride
      state_new := s_init
    }
  }

  when(engage_state === s_init) {
    when(self_is_good) {
      tag_new := tag(pc_forupdate)
      preVaddr_new := usedVaddr(vaddr_forupdate)
      stride_new := stride
      state_new := s_tran
    }.elsewhen(!(tag_is_good)) {
      tag_new := tag(pc_forupdate)
      preVaddr_new := usedVaddr(vaddr_forupdate)
      stride_new := 0.U
      state_new := s_idle
    }.elsewhen(!(stride_is_good)) {
      tag_new := tag(pc_forupdate)
      preVaddr_new := usedVaddr(vaddr_forupdate)
      stride_new := stride
      state_new := s_init
    }
  }

  when(engage_state === s_tran) {
    when(self_is_good) {
      tag_new := tag(pc_forupdate)
      preVaddr_new := usedVaddr(vaddr_forupdate)
      stride_new := stride
      state_new := s_stand
    }.elsewhen(!(tag_is_good)) {
      tag_new := tag(pc_forupdate)
      preVaddr_new := usedVaddr(vaddr_forupdate)
      stride_new := 0.U
      state_new := s_idle
    }.elsewhen(!(stride_is_good)) {
      tag_new := tag(pc_forupdate)
      preVaddr_new := usedVaddr(vaddr_forupdate)
      stride_new := stride
      state_new := s_init
    }
  }

  when(engage_state === s_stand) {
    when(self_is_good) {
      tag_new := tag(pc_forupdate)
      preVaddr_new := usedVaddr(vaddr_forupdate)
      stride_new := stride
      state_new := s_steady
    }.elsewhen(!(tag_is_good)) {
      tag_new := tag(pc_forupdate)
      preVaddr_new := usedVaddr(vaddr_forupdate)
      stride_new := 0.U
      state_new := s_idle
    }.elsewhen(!(stride_is_good)) {
      tag_new := tag(pc_forupdate)
      preVaddr_new := usedVaddr(vaddr_forupdate)
      stride_new := stride
      state_new := s_init
    }
  }

  when(engage_state === s_steady) {
    when(self_is_good) {
      tag_new := tag(pc_forupdate)
      preVaddr_new := usedVaddr(vaddr_forupdate)
      stride_new := stride
      state_new := s_steady
    }.elsewhen(!(tag_is_good)) {
      tag_new := tag(pc_forupdate)
      preVaddr_new := usedVaddr(vaddr_forupdate)
      stride_new := 0.U
      state_new := s_idle
    }.elsewhen(!(stride_is_good)) {
      tag_new := tag(pc_forupdate)
      preVaddr_new := usedVaddr(vaddr_forupdate)
      stride_new := stride
      state_new := s_init
    }
  }

  io.train.req.ready := true.B

  val finalPredict_vaddr = WireInit(0.U(VAddrBits.W))
  val timeChecker = RegInit(0.U(rptTimeBits.W))
  when(cc_forupdate < engage_cc) {
      timeChecker := cc_forupdate +& rptTimeMax.U - engage_cc
  }.otherwise {
      timeChecker := cc_forupdate - engage_cc
  }

  when(state_new === s_stand || state_new === s_steady) {
    when(timeChecker <= (prefetchCostTimeMax >> 2).U) {
      finalPredict_vaddr := vaddr_forout + ((stride_new << (log2Up(prefetchCostTimeMax >> 4) + 2)))
    }.otherwise {
      finalPredict_vaddr := vaddr_forout + (stride_new << 3)
    }
  }
    
  io.train.resp.bits.respVaddr := Cat(finalPredict_vaddr(VAddrBits - 1, log2Up(dcacheBlockBytes)), 0.U((log2Up(dcacheBlockBytes)).W))

  val sameline = getIdxNum(finalPredict_vaddr) === getIdxNum(vaddr_forout)
  
  when((state_new === s_stand || state_new === s_steady) && valid_forwrite) {
    when(sameline) {
      io.train.resp.valid := false.B
    }.otherwise {
      io.train.resp.valid := true.B 
    }
  }.otherwise {
    io.train.resp.valid := false.B
  }

//   when (io.train.resp.fire()) {
//     printf("time=[%d]pc 0x%x vaddr 0x%x issue prefetch\n", GTimer(), 
//     pc_forwrite,
//     io.train.resp.bits.respVaddr)
//   }

//   when(io.train.req.fire()) {
//     XSDebug("rptpcReqSelf: %x rptVaddrReq: %x rptvalidReq: %d\n", rAddr0 ,io.train.req.bits.reqVaddr, rptTables(0).io.r.req.valid)
//     XSDebug("rptpcReqOther: %x rptVaddrReq: %x rptvalidReq: %d\n", rAddr1 ,io.train.reqFromAnotherRpt.bits.reqVaddr, rptTables(1).io.r.req.valid)    
//   }
//   when(valid_forupdate) {
//     XSDebug("pc_forupdate: %x vaddr_forupdate: %x cc_forupdate: %d valid_forupdate: %d\n", pc_forupdate, vaddr_forupdate, cc_forupdate ,valid_forupdate)
//     XSDebug("tag_old: %x preVaddr_old: %x stride_old: %x state_old: %x cc_old: %d updown_old: %d\n", oldEntryRespToSelfRpt.tag, oldEntryRespToSelfRpt.preVaddr, oldEntryRespToSelfRpt.stride, oldEntryRespToSelfRpt.state, oldEntryRespToSelfRpt.cc, oldEntryRespToSelfRpt.updown)
//     XSDebug("tag_from_ot: %x preVaddr_from_ot: %x stride_from_ot: %x state_from_ot: %x cc_from_ot: %x updown_from_ot: %x", oldEntryRespFromAnotherRpt.bits.tag, oldEntryRespFromAnotherRpt.bits.preVaddr, oldEntryRespFromAnotherRpt.bits.stride, oldEntryRespFromAnotherRpt.bits.state, oldEntryRespFromAnotherRpt.bits.cc, oldEntryRespFromAnotherRpt.bits.updown)
//   }
//   when(valid_forwrite) {
//     XSDebug("pc_forwrite: %x vaddr_forout: %x valid_forwrite: %d\n", pc_forwrite, vaddr_forout, valid_forwrite)
//     XSDebug("valid_forwrite: %d finaltag: %x finalpreVaddr: %x finalstride: %x finalstate: %x finalcc: %d timeChecker: %d : %d\n", valid_forwrite, tag_new, finalPredict_vaddr, stride_new, state_new, cc_new, timeChecker, )
//     XSDebug("vaddr_forout: %x finalpreVaddr: %x finalstride: %x timeChecker: %d upORdown: %d\n", vaddr_forout, finalPredict_vaddr, stride_new, timeChecker, )
//   }
//   XSPerfAccumulate("fire_pefetch_numbers", io.train.resp.fire())
}
