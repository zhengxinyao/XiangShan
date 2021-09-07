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
import freechips.rocketchip.rocket.{RVCDecoder, ExpandedInstruction}
import chisel3.{util, _}
import chisel3.util._
import utils._
import xiangshan._
import xiangshan.backend.decode.isa.predecode.PreDecodeInst
import xiangshan.cache._

trait HasPdConst extends HasXSParameter with HasICacheParameters with HasIFUConst{
  def isRVC(inst: UInt) = (inst(1,0) =/= 3.U)
  def isLink(reg:UInt) = reg === 1.U || reg === 5.U
  def brInfo(instr: UInt) = {
    val brType::Nil = ListLookup(instr, List(BrType.notCFI), PreDecodeInst.brTable)
    val rd = Mux(isRVC(instr), instr(12), instr(11,7))
    val rs = Mux(isRVC(instr), Mux(brType === BrType.jal, 0.U, instr(11, 7)), instr(19, 15))
    val isCall = (brType === BrType.jal && !isRVC(instr) || brType === BrType.jalr) && isLink(rd) // Only for RV64
    val isRet = brType === BrType.jalr && isLink(rs) && !isCall
    List(brType, isCall, isRet)
  }
  def jal_offset(inst: UInt, rvc: Bool): UInt = {
    val rvc_offset = Cat(inst(12), inst(8), inst(10, 9), inst(6), inst(7), inst(2), inst(11), inst(5, 3), 0.U(1.W))
    val rvi_offset = Cat(inst(31), inst(19, 12), inst(20), inst(30, 21), 0.U(1.W))
    val max_width = rvi_offset.getWidth
    SignExt(Mux(rvc, SignExt(rvc_offset, max_width), SignExt(rvi_offset, max_width)), XLEN)
  }
  def br_offset(inst: UInt, rvc: Bool): UInt = {
    val rvc_offset = Cat(inst(12), inst(6, 5), inst(2), inst(11, 10), inst(4, 3), 0.U(1.W))
    val rvi_offset = Cat(inst(31), inst(7), inst(30, 25), inst(11, 8), 0.U(1.W))
    val max_width = rvi_offset.getWidth
    SignExt(Mux(rvc, SignExt(rvc_offset, max_width), SignExt(rvi_offset, max_width)), XLEN)
  }
  def getBasicBlockIdx( pc: UInt, start:  UInt ): UInt = {
    val byteOffset = pc - start
    (byteOffset - instBytes.U)(log2Ceil(PredictWidth),instOffsetBits)
  }

  def NOP = "h4501".U(16.W)
}

object BrType {
  def notCFI   = "b00".U
  def branch  = "b01".U
  def jal     = "b10".U
  def jalr    = "b11".U
  def apply() = UInt(2.W)
}

object ExcType {  //TODO:add exctype
  def notExc = "b000".U
  def apply() = UInt(3.W)
}

class PreDecodeInfo extends Bundle {  // 8 bit
  val valid   = Bool()
  val isRVC   = Bool()
  val brType  = UInt(2.W)
  val isCall  = Bool()
  val isRet   = Bool()
  //val excType = UInt(3.W)
  def isBr    = brType === BrType.branch
  def isJal   = brType === BrType.jal
  def isJalr  = brType === BrType.jalr
  def notCFI  = brType === BrType.notCFI
}

class PreDecodeResp(implicit p: Parameters) extends XSBundle with HasPdConst {
  val pc          = Vec(PredictWidth, UInt(VAddrBits.W))
  val instrs      = Vec(PredictWidth, UInt(32.W))
  val pd          = Vec(PredictWidth, (new PreDecodeInfo))
  val takens      = Vec(PredictWidth, Bool())
  val misOffset    = ValidUndirectioned(UInt(log2Ceil(PredictWidth).W))
  val cfiOffset    = ValidUndirectioned(UInt(log2Ceil(PredictWidth).W))
  val target       = UInt(VAddrBits.W)
  val jalTarget    = UInt(VAddrBits.W)
  val hasLastHalf  = Bool()
  val realEndPC    = UInt(VAddrBits.W)
  val instrRange   = Vec(PredictWidth, Bool())
  val pageFault    = Vec(PredictWidth, Bool())
  val accessFault  = Vec(PredictWidth, Bool())
  val crossPageIPF = Vec(PredictWidth, Bool())
}

class Stage1Resp(implicit p: Parameters) extends XSBundle with HasPdConst{
  val pc          = Vec(PredictWidth, UInt(VAddrBits.W))
  val instrs      = if(HasCExtension) Vec(PredictWidth, UInt(16.W)) else Vec(PredictWidth, UInt(32.W))  
  val pds         = Vec(PredictWidth, new PreDecodeInfo)
  val targets     = Vec(PredictWidth, UInt(VAddrBits.W))
  val pageFault    = Vec(PredictWidth, Bool())
  val accessFault  = Vec(PredictWidth, Bool())
  val nextLinePC = UInt(VAddrBits.W)
}

class Stage2Resp(implicit p: Parameters) extends XSBundle with HasPdConst{
  val takens      = Vec(PredictWidth, Bool())
  val misOffset    = ValidUndirectioned(UInt(log2Ceil(PredictWidth).W))
  val cfiOffset    = ValidUndirectioned(UInt(log2Ceil(PredictWidth).W))
  val target       = UInt(VAddrBits.W)
  val jalTarget    = UInt(VAddrBits.W)
  val hasLastHalf  = Bool()
  val realEndPC    = UInt(VAddrBits.W)
  val instrRange   = Vec(PredictWidth, Bool())
  val pageFault    = Vec(PredictWidth, Bool())
  val accessFault  = Vec(PredictWidth, Bool())
  val crossPageIPF = Vec(PredictWidth, Bool())
}

class PreDecodeStage1(implicit p: Parameters) extends XSModule with HasPdConst{
  val io = IO(new Bundle() {
    val in = Input(new IfuToPdStage1)
    val out = Output(new Stage1Resp)
  })

  val instValid     = io.in.instValid 
  val data          = io.in.data
  val pcStart       = io.in.startAddr
  val pcEnd         = io.in.fallThruAddr
  val pcEndError    = io.in.fallThruError
  val isDoubleLine  = io.in.isDoubleLine
  val pageFault     = io.in.pageFault
  val accessFault   = io.in.accessFault

  val validStart , validEnd            = Wire(Vec(PredictWidth, Bool()))
  dontTouch(validStart)
  val rawInsts = if (HasCExtension) VecInit((0 until PredictWidth).map(i => Cat(data(i+1), data(i))))  
                       else         VecInit((0 until PredictWidth).map(i => data(i)))
  
  def getNextLineStart(pc: UInt) = Cat(pc(VAddrBits-1, log2Ceil(blockBytes) + 1), 1.U(1.W) , 0.U(log2Ceil(blockBytes).W))
  def compNextLineStart(pc: UInt, nextLineStart: UInt) : Bool = {
    //if pc < nextLineStart return true.B
    pc(log2Ceil(blockBytes))  ^  nextLineStart(log2Ceil(blockBytes))
  }
  val nextLinePC =  getNextLineStart(pcStart)
  io.out.nextLinePC := nextLinePC

  for (i <- 0 until PredictWidth) {
    //TODO: Terrible timing for pc comparing
    val isNextLine      = !compNextLineStart(io.out.pc(i), nextLinePC)
    val nullInstruction = isNextLine && !isDoubleLine
    val hasPageFault   = validStart(i) && (!isNextLine && pageFault(0)   ||  isNextLine && pageFault(1))
    val hasAccessFault = validStart(i) && (!isNextLine && accessFault(0) ||  isNextLine && accessFault(1))
    val exception      = hasPageFault || hasAccessFault
    val inst           = Mux(exception || nullInstruction , NOP, WireInit(rawInsts(i)))

    val isFirstInBlock = i.U === 0.U
    val isLastInBlock  = (i == PredictWidth - 1).B
    val currentPC      = pcStart + (i << 1).U((log2Ceil(PredictWidth)+1).W)
    val currentIsRVC   = isRVC(inst) && HasCExtension.B

    val lastIsValidEnd = if(i == 0) true.B else  validEnd(i-1) || isFirstInBlock || !HasCExtension.B
    
    validStart(i)   := (lastIsValidEnd || !HasCExtension.B)
    validEnd(i)     := validStart(i) && currentIsRVC || !validStart(i) || !HasCExtension.B

    val brType::isCall::isRet::Nil = brInfo(inst)
    val jalOffset = jal_offset(inst, currentIsRVC)
    val brOffset  = br_offset(inst, currentIsRVC)

    io.out.pageFault(i)        := hasPageFault
    io.out.accessFault(i)      := hasAccessFault

    io.out.pds(i).valid         := (lastIsValidEnd || !HasCExtension.B)
    io.out.pds(i).isRVC         := currentIsRVC
    io.out.pds(i).brType        := brType
    io.out.pds(i).isCall        := isCall 
    io.out.pds(i).isRet         := isRet
    io.out.pc(i)               := currentPC
    io.out.instrs(i)           := inst
    io.out.targets(i)          := io.out.pc(i) + Mux( io.out.pds(i).isBr, brOffset, jalOffset)
  }

  // for (i <- 0 until PredictWidth) {
  //   XSDebug(true.B,
  //     p"instr ${Hexadecimal(io.out.instrs(i))}, " +
  //     p"validStart ${Binary(validStart(i))}, " +
  //     p"validEnd ${Binary(validEnd(i))}, " +
  //     p"pc ${Hexadecimal(io.out.pc(i))}, " +
  //     p"isRVC ${Binary(io.out.pd(i).isRVC)}, " +
  //     p"brType ${Binary(io.out.pd(i).brType)}, " +
  //     p"isRet ${Binary(io.out.pd(i).isRet)}, " +
  //     p"isCall ${Binary(io.out.pd(i).isCall)}\n"
  //   )
  // }
}

class PreDecodeStage2(implicit p: Parameters) extends XSModule with HasPdConst{
  val io = IO(new Bundle() {
    val in = Input(new IfuToPdStage2)
    val out = Output(new PreDecodeResp)
  })

  val pcStart       = io.in.startAddr
  val pcEnd         = io.in.fallThruAddr
  val pcEndError    = io.in.fallThruError
  val isDoubleLine  = io.in.isDoubleLine
  val bbOffset      = io.in.ftqOffset.bits
  val bbTaken       = io.in.ftqOffset.valid
  val bbTarget      = io.in.target
  val oversize      = io.in.oversize
  val maxBoundPC    = io.in.maxBoundPC
  val insts         = io.in.stage1Resp.instrs
  val pc            = io.in.stage1Resp.pc 
  val pd            = io.in.stage1Resp.pds
  val targets       = io.in.stage1Resp.targets
  val valids        = io.in.stage1Resp.pds.map(_.valid)
  val pageFault     = io.in.stage1Resp.pageFault
  val accessFault   = io.in.stage1Resp.accessFault
  val instValid     = io.in.instValid
  val nextLinePC    = io.in.stage1Resp.nextLinePC


  val misPred, takens, falseHit, instRange                   = Wire(Vec(PredictWidth, Bool()))
  //"real" means signals that are genrated by repaired end pc of this basic block using predecode information
  val realEndPC                                   = Wire(UInt(VAddrBits.W))
  val realHasLastHalf, realMissPred, realTakens   = Wire(Vec(PredictWidth, Bool()))

  for (i <- 0 until PredictWidth) {
    val expander       = Module(new RVCExpander)
    expander.io.in             := insts(i)
    io.out.instrs(i)           := expander.io.out.bits

    val currentIsRVC   = isRVC(insts(i)) && HasCExtension.B

    takens(i)    := (valids(i)  && (bbTaken && bbOffset === i.U && !pd(i).notCFI || pd(i).isJal || pd(i).isRet))
                       //Banch and jal have wrong targets
    val targetFault    = (valids(i)  && i.U === bbOffset && bbTaken && (pd(i).isBr || pd(i).isJal) && bbTarget =/= targets(i))  
                       //An not-CFI instruction is predicted taken
    val notCFIFault    = (valids(i)  && i.U === bbOffset && pd(i).notCFI && bbTaken) 
                       //A jal instruction is predicted not taken
    val jalFault       = (valids(i)  && !bbTaken && pd(i).isJal)
                       //A ret instruction is predicted not taken
    val retFault       = (valids(i)  && !bbTaken && pd(i).isRet) 
                       //An invalid instruction is predicted taken
    val invalidInsFault  = (!valids(i)  && i.U === bbOffset && bbTaken)

    misPred(i)   := targetFault  || notCFIFault || jalFault || retFault || invalidInsFault || pcEndError
    falseHit(i)  := invalidInsFault || notCFIFault

    io.out.crossPageIPF(i)     := (io.out.pc(i) === align(realEndPC, 64) - 2.U) && !pageFault(0) && pageFault(1) && !currentIsRVC
    io.out.pageFault(i)        := pageFault(i)
    io.out.accessFault(i)      := accessFault(i)

    realMissPred(i)     := misPred(i) && instRange(i)
    realHasLastHalf(i)  := instValid && pc(i) === (realEndPC - 2.U) && valids(i) && instRange(i) && !currentIsRVC
    realTakens(i)       := takens(i) && instRange(i)  
  }

  def pcGreatThan(pc1: UInt, pc2: UInt): Bool = {
    (pc1(6) ^ pc2(6)) && (pc1(5,1) <  pc2(5,1)) || !(pc1(6) ^ pc2(6)) && (pc1(5,1) >  pc2(5,1))
  }


  val jumpOH                  =  VecInit(pd.zipWithIndex.map{ case(inst, i) => inst.isJal  && valids(i) }) //TODO: need jalr?
  val jumpOffset              =  PriorityEncoder(jumpOH)
  val rvcOH                   =  VecInit(pd.map(inst => inst.isRVC))
  val jumpPC                  =  ParallelPriorityMux(jumpOH, io.out.pc)
  val jumpTarget              =  ParallelPriorityMux(jumpOH, targets)
  val jumpIsRVC               =  ParallelPriorityMux(jumpOH, rvcOH)
  val jumpNextPC              =  jumpPC + Mux(jumpIsRVC, 2.U, 4.U)
  val (hasFalseHit, hasJump)  =  (ParallelOR(falseHit), ParallelOR(jumpOH))
  val endRange                =  ((Fill(PredictWidth, 1.U(1.W)) >> (~getBasicBlockIdx(realEndPC, pcStart))) | (Fill(PredictWidth, oversize)))
  val takeRange               =  Fill(PredictWidth, !ParallelOR(takens))   | Fill(PredictWidth, 1.U(1.W)) >> (~PriorityEncoder(takens))
  val fixCross                =  pcGreatThan(maxBoundPC, nextLinePC) && !isDoubleLine
  val boundPC                 =  Mux(fixCross, nextLinePC - 2.U  ,maxBoundPC)

  instRange               :=  VecInit((0 until PredictWidth).map(i => endRange(i) &&  takeRange(i)))
  realEndPC               :=  Mux( hasFalseHit , Mux(hasJump && !pcGreatThan(jumpNextPC, boundPC), jumpNextPC, boundPC), pcEnd)

  val validLastOffset     = Mux(pd((PredictWidth - 1).U).valid, (PredictWidth - 1).U, (PredictWidth - 2).U)
  io.out.misOffset.valid  := ParallelOR(realMissPred)
  io.out.misOffset.bits   := Mux(pcEndError,validLastOffset,PriorityEncoder(realMissPred))
  io.out.instrRange.zipWithIndex.map{case (bit,i) => bit := instRange(i).asBool()}

  io.out.cfiOffset.valid  := ParallelOR(realTakens)
  io.out.cfiOffset.bits   := PriorityEncoder(realTakens)

  io.out.target           := Mux(io.out.cfiOffset.valid, targets(io.out.cfiOffset.bits), realEndPC)
  io.out.takens           := realTakens

  io.out.jalTarget        :=  jumpTarget

  io.out.hasLastHalf      := realHasLastHalf.reduce(_||_)
  io.out.realEndPC        := realEndPC
  io.out.pc               := pc 
  io.out.pd               := pd
  
}


class RVCExpander(implicit p: Parameters) extends XSModule {
  val io = IO(new Bundle {
    val in = Input(UInt(32.W))
    val out = Output(new ExpandedInstruction)
  })

  if (HasCExtension) {
    io.out := new RVCDecoder(io.in, XLEN).decode
  } else {
    io.out := new RVCDecoder(io.in, XLEN).passthrough
  }
}
