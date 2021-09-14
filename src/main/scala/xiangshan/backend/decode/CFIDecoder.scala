package xiangshan.backend.decode

import chipsalliance.rocketchip.config.Parameters
import chisel3.{util, _}
import chisel3.util._
import utils._
import xiangshan._
import xiangshan.frontend._
import scala.math.pow

trait HasCFIDecConst extends HasXSParameter with HasICacheParameters with HasIFUConst{
  def isRVC(inst: UInt) = (inst(1,0) =/= 3.U)
  def isLink(reg:UInt) = reg === 1.U || reg === 5.U
  def brInfo(instr: UInt) = {
    val brType::Nil = ListLookup(instr, List(BrType.notCFI), CFIDecodeInst.brTable)
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
  def getFtqOffset(pc: UInt): UInt = pc(log2Ceil(PredictWidth), 1)
}

object CFIDecodeInst {
  // def C_JAL     = BitPat("b????????????????_?01_?_??_???_??_???_01") // RV32C
  def C_J       = BitPat("b????????????????_101_?_??_???_??_???_01")
  def C_JALR    = BitPat("b????????????????_100_?_??_???_00_000_10")  //c.jalr & c.jr
  def C_BRANCH  = BitPat("b????????????????_11?_?_??_???_??_???_01")
  def JAL       = BitPat("b????????????????_???_?????_1101111")
  def JALR      = BitPat("b????????????????_000_?????_1100111")
  def BRANCH    = BitPat("b????????????????_???_?????_1100011")
  def NOP       = BitPat("b???????????????0_100_01010_0000001")   //li	a0,0


  val brTable = Array(
    // C_JAL     -> List(BrType.jal),
    C_J       -> List(BrType.jal),
    C_JALR    -> List(BrType.jalr),
    C_BRANCH  -> List(BrType.branch),
    JAL       -> List(BrType.jal),
    JALR      -> List(BrType.jalr),
    BRANCH    -> List(BrType.branch)
  )
}

object BrType {
  def notCFI   = "b00".U
  def branch  = "b01".U
  def jal     = "b10".U
  def jalr    = "b11".U
  def apply() = UInt(2.W)
}

class CFIInfo extends Bundle {
  // 8 bits
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

class CFIDecIO(implicit p: Parameters) extends XSBundle{
  val in    = Vec(DecodeWidth, Flipped(Valid(new CtrlFlow)))
  val out   = Vec(DecodeWidth, Output(new CFIInfo))
  val toFtq = Valid(new PredecodeWritebackBundle)
}

class CFIDecoder(implicit p: Parameters) extends XSModule with HasCFIDecConst{
  val io = IO(new CFIDecIO)

  val realTargets = Wire(Vec(DecodeWidth, UInt(VAddrBits.W)))
  val misPred, falseHit, instrMask, takens = Wire(Vec(DecodeWidth, Bool()))

  for(i <- 0 until DecodeWidth){
    val instr       = io.in(i).bits.instr
    val pc          = io.in(i).bits.pc
    val predTaken   = io.in(i).bits.pred_taken
    val predTarget  = io.in(i).bits.target

    val brType::isCall::isRet::Nil = brInfo(instr)
    val jalOffset = jal_offset(instr, false.B)
    val brOffset  = br_offset(instr, false.B)

    io.out(i).brType := brType
    io.out(i).isCall := isCall
    io.out(i).isRet  := isRet
    io.out(i).isRVC  := isRVC(instr)

    io.toFtq.bits.pc(i)   := pc
    io.toFtq.bits.cfi(i) := io.out(i)
    io.toFtq.bits.ftqOffset(i) := getFtqOffset(pc)

    realTargets(i)      := pc + Mux(io.out(i).isBr, brOffset, jalOffset)
    takens(i)       := io.in(i).valid && (predTaken && !io.out(i).notCFI ||  io.out(i).isJal || io.out(i).isRet)

    val targetFault    = predTaken && (io.out(i).isBr || io.out(i).isJal) && predTarget =/= realTargets(i)
    //An not-CFI instruction is predicted taken
    val notCFIFault    = predTaken && io.out(i).notCFI
    //A jal instruction is predicted not taken
    val jalFault       = !predTaken && io.out(i).isJal
    //A ret instruction is predicted not taken
    val retFault       = !predTaken && io.out(i).isRet
    //An invalid instruction is predicted taken
    val invalidInsFault  = (!io.in(i).valid && predTaken)

    misPred(i)   := targetFault  || notCFIFault || jalFault || retFault || invalidInsFault
    falseHit(i)  := invalidInsFault || notCFIFault
  }

  //find the first jump and mask the flow instrucitons
  val extendWidth             = pow(2, log2Ceil(DecodeWidth)).toInt
  val takeRange               = Fill(extendWidth, 1.U(1.W)) >> (~PriorityEncoder(takens))

  io.out.zipWithIndex.map{case(out, i) => out.valid := io.in(i).valid && takeRange(i)}

  val missPredIdx = PriorityEncoder(misPred)
  val jumpIdx     = PriorityEncoder(takens)
  val jalIdx      = PriorityEncoder(io.out.map(_.isJal))

  io.toFtq.valid := VecInit(io.out.map(_.valid)).reduce(_ || _)
  io.toFtq.bits.ftqIdx      := io.in(0).bits.ftqPtr
  io.toFtq.bits.target      := realTargets(jumpIdx)
  io.toFtq.bits.jalTarget   := realTargets(jalIdx)
  io.toFtq.bits.instrValids := VecInit(io.out.map(_.valid))

  //io.toFtq.bits.ftqOffset := io.in(0).bits.ftqOffset



}
