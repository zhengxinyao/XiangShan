package xiangshan.mem.strideprefetch

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

class RptReq(implicit p: Parameters) extends XSBundle {
  val req = Vec(L1DPrefetchPipelineWidth, DecoupledIO(new ToStrideReq))
}

class RptResp(implicit p: Parameters) extends XSBundle {
  val respVaddr = UInt(VAddrBits.W)
}

class IssueIO(implicit p: Parameters) extends XSBundle {
  val req = Vec(LoadPipelineWidth, DecoupledIO(new ToStrideReq))
  val resp = Vec(LoadPipelineWidth, Flipped(DecoupledIO(new RptResp)))
}

class SBP(implicit p: Parameters) extends XSModule with HasTlbConst {
  val io = IO(new Bundle{
      val train = Flipped(new RptReq)
      val issue = Flipped(new IssueIO)
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
  }

  val s_idle :: s_init :: s_tran :: s_stand :: s_steady :: Nil = Enum(5)
  //below is entry for write
  val tag_new       = RegInit(0.U(rptTagBits.W))
  val preVaddr_new  = RegInit(0.U(preVaddrBits.W))
  val stride_new    = RegInit(0.U(rptStrideBits.W))
  val state_new     = RegInit(s_idle)

  val s0_pc     = io.train.req(0).bits.pc
  val s0_vaddr  = io.train.req(0).bits.reqVaddr
  val s0_update = io.train.req(0).valid

  val s1_pc     = RegNext(s0_pc)
  val s1_vaddr  = RegNext(s0_vaddr)
  val s1_update = RegNext(s0_update)
             
  val s2_pc     = RegNext(s1_pc)
  val s2_vaddr  = RegNext(s1_vaddr)
  val s2_update = RegNext(s1_update)

  val rpt   = Wire(rptTableEntry())
  val ren   = s0_update
  val wen   = s2_update
  val raddr = s0_pc
  val waddr = s2_pc

  val rptTable = Module(new SyncDataModuleTemplate(rptTableEntry(), rptEntries, numRead = 3, numWrite = 1))
  //read channel
  rptTable.io.raddr(0)          := idx(raddr)
  rpt.tag                       := rptTable.io.rdata(0).tag
  rpt.preVaddr                  := rptTable.io.rdata(0).preVaddr
  rpt.stride                    := rptTable.io.rdata(0).stride
  rpt.state                     := rptTable.io.rdata(0).state
  //write channel
  rptTable.io.wen(0)            := wen
  rptTable.io.waddr(0)          := idx(waddr)
  rptTable.io.wdata(0).tag      := tag_new
  rptTable.io.wdata(0).preVaddr := preVaddr_new
  rptTable.io.wdata(0).stride   := stride_new
  rptTable.io.wdata(0).state    := state_new

  //bypass
  val s2_to_s0 = RegInit(false.B)
  val s1_to_s0 = RegInit(false.B)
  s2_to_s0 := idx(s0_pc) === idx(s2_pc) && s0_update && s2_update
  s1_to_s0 := idx(s0_pc) === idx(s1_pc) && s0_update && s1_update
  when(s2_to_s0) {
    rpt.tag       := RegNext(tag_new)
    rpt.preVaddr  := RegNext(preVaddr_new)
    rpt.stride    := RegNext(stride_new)
    rpt.state     := RegNext(state_new)
  }
  when(s1_to_s0) {
    rpt.tag       := tag_new
    rpt.preVaddr  := preVaddr_new
    rpt.stride    := stride_new
    rpt.state     := state_new
  }

  val stride          = usedVaddr(s1_vaddr) - rpt.preVaddr
  val engage_state    = rpt.state

  val tag_is_good     = rpt.tag === tag(s1_pc) 
  val stride_is_good  = stride === rpt.stride && stride =/= 0.U
  val good            = stride_is_good && tag_is_good && s1_update

  //statemachine
  when(engage_state === s_idle) {
    when(!(tag_is_good)) {
      tag_new       := tag(s1_pc)
      preVaddr_new  := usedVaddr(s1_vaddr)
      stride_new    := 0.U
      state_new     := s_idle
    }.otherwise {
      tag_new       := tag(s1_pc)
      preVaddr_new  := usedVaddr(s1_vaddr)
      stride_new    := stride
      state_new     := s_init
    }
  }

  when(engage_state === s_init) {
    when(good) {
      tag_new       := tag(s1_pc)
      preVaddr_new  := usedVaddr(s1_vaddr)
      stride_new    := stride
      state_new     := s_tran
    }.elsewhen(!(tag_is_good)) {
      tag_new       := tag(s1_pc)
      preVaddr_new  := usedVaddr(s1_vaddr)
      stride_new    := 0.U
      state_new     := s_idle
    }.elsewhen(!(stride_is_good)) {
      tag_new       := tag(s1_pc)
      preVaddr_new  := usedVaddr(s1_vaddr)
      stride_new    := stride
      state_new     := s_init
    }
  }

  when(engage_state === s_tran) {
    when(good) {
      tag_new       := tag(s1_pc)
      preVaddr_new  := usedVaddr(s1_vaddr)
      stride_new    := stride
      state_new     := s_stand
    }.elsewhen(!(tag_is_good)) {
      tag_new       := tag(s1_pc)
      preVaddr_new  := usedVaddr(s1_vaddr)
      stride_new    := 0.U
      state_new     := s_idle
    }.elsewhen(!(stride_is_good)) {
      tag_new       := tag(s1_pc)
      preVaddr_new  := usedVaddr(s1_vaddr)
      stride_new    := stride
      state_new     := s_init
    }
  }

  when(engage_state === s_stand) {
    when(good) {
      tag_new       := tag(s1_pc)
      preVaddr_new  := usedVaddr(s1_vaddr)
      stride_new    := stride
      state_new     := s_steady
    }.elsewhen(!(tag_is_good)) {
      tag_new       := tag(s1_pc)
      preVaddr_new  := usedVaddr(s1_vaddr)
      stride_new    := 0.U
      state_new     := s_idle
    }.elsewhen(!(stride_is_good)) {
      tag_new       := tag(s1_pc)
      preVaddr_new  := usedVaddr(s1_vaddr)
      stride_new    := stride
      state_new   := s_init
    }
  }

  when(engage_state === s_steady) {
    when(good) {
      tag_new       := tag(s1_pc)
      preVaddr_new  := usedVaddr(s1_vaddr)
      stride_new    := stride
      state_new     := s_steady
    }.elsewhen(!(tag_is_good)) {
      tag_new       := tag(s1_pc)
      preVaddr_new  := usedVaddr(s1_vaddr)
      stride_new    := 0.U
      state_new     := s_idle
    }.elsewhen(!(stride_is_good)) {
      tag_new       := tag(s1_pc)
      preVaddr_new  := usedVaddr(s1_vaddr)
      stride_new    := stride
      state_new     := s_init
    }
  }

  io.train.req(0).ready := true.B

  //To ensure Timeliness
  val time_old  = Wire(Vec(LoadPipelineWidth, UInt(rptTimeBits.W)))
  val time_new  = RegInit(0.U(rptTimeBits.W))
  val timeTable = Module(new SyncDataModuleTemplate(UInt(rptTimeBits.W), rptEntries, numRead = 2, numWrite = 2))
  val time_wen  = Wire(Vec(LoadPipelineWidth, Bool()))
  val merge     = idx(RegNext(io.issue.req(0).bits.pc)) === idx(RegNext(io.issue.req(1).bits.pc))
  time_wen(0)   := RegNext(io.issue.req(0).valid)
  time_wen(1)   := Mux(RegNext(io.issue.req(0).valid) && merge, false.B, RegNext(io.issue.req(1).valid))

  val clock_in_stride = Counter(rptTimeMax)
  clock_in_stride.inc()
  time_new := clock_in_stride.value

  for (i <- 0 until LoadPipelineWidth) {
    timeTable.io.raddr(i) := idx(io.issue.req(i).bits.pc)
    time_old(i)           := timeTable.io.rdata(i)

    timeTable.io.wen(i)   := time_wen(i)
    timeTable.io.waddr(i) := idx(RegNext(io.issue.req(i).bits.pc))
    timeTable.io.wdata(i) := time_new
  }

  val finalPredict_vaddr = WireInit(0.U(VAddrBits.W))
  val timeChecker = Wire(Vec(LoadPipelineWidth, UInt(rptTimeBits.W)))
  for (i <- 0 until LoadPipelineWidth) {
    when(time_new < time_old(i)) {
      timeChecker(i) := time_new +& rptTimeMax.U - time_old(i)
    }.otherwise {
      timeChecker(i) := time_new - time_old(i)
    }
  }
  
  for (i <- 0 until LoadPipelineWidth) {
    rptTable.io.raddr(i+1) := idx(io.issue.req(i).bits.pc)

    io.issue.req(i).ready := true.B
  }

  for (i <- 0 until LoadPipelineWidth) {
    when (rptTable.io.rdata(i+1).state === s_stand || rptTable.io.rdata(i+1).state === s_steady) {
      when(timeChecker(i) <= (prefetchCostTimeMax >> 2).U) {
        finalPredict_vaddr := RegNext(io.issue.req(i).bits.reqVaddr) + ((rptTable.io.rdata(i+1).stride << (log2Up(prefetchCostTimeMax >> 4) + 2)))
      }.otherwise {
        finalPredict_vaddr := RegNext(io.issue.req(i).bits.reqVaddr) + (rptTable.io.rdata(i+1).stride << 3)
      }
    }
  }

  for (i <- 0 until LoadPipelineWidth) {
    when ((rptTable.io.rdata(i+1).state === s_stand || rptTable.io.rdata(i+1).state === s_steady) && RegNext(io.issue.req(i).valid)) {
      val sameline = getIdxNum(finalPredict_vaddr) === getIdxNum(RegNext(io.issue.req(i).bits.reqVaddr))
      when (sameline) {
        io.issue.resp(i).valid := false.B
      }.otherwise {
        io.issue.resp(i).valid := true.B
      }
    }.otherwise {
      io.issue.resp(i).valid := false.B
    }

    io.issue.resp(i).bits.respVaddr := Cat(finalPredict_vaddr(VAddrBits - 1, log2Up(dcacheBlockBytes)), 0.U((log2Up(dcacheBlockBytes)).W))

    // when (io.issue.resp(i).fire()) {
    //   printf("time=[%d]vaddr 0x%x SBP fired\n", GTimer(), 
    //   io.issue.resp(i).bits.respVaddr)
    // }

    XSPerfAccumulate("fire_pefetch_numbers", io.issue.resp(i).fire())
  }
}
