package xiangshan.frontend

import chipsalliance.rocketchip.config.Parameters
import chisel3._
import chisel3.util._
import freechips.rocketchip.rocket.{ExpandedInstruction, RVCDecoder}
import xiangshan._
import xiangshan.backend.fu._
import utils._

trait IBufConst extends HasXSParameter
    with HasICacheParameters
    with HasIFUConst
    with HasExceptionNO
{
    val lastInstrIdx         = PredictWidth - 1
    val InstrLen             = blockBytes/PredictWidth

    def isRVC(inst: UInt) = (inst(1,0) =/= 3.U)
    def getNextLineStart(pc: UInt) = Cat(pc(VAddrBits-1, log2Ceil(blockBytes) + 1), 1.U(1.W) , 0.U(log2Ceil(blockBytes).W))

    //WARNING: This could be timing critical
    def genValids(isRVC: Vec[Bool], range: Vec[Bool], lastHalf: Bool) ={
        val validStart, validEnd = Wire(Vec(PredictWidth, Bool()))
        for(i <- 0 until PredictWidth){
            val lastIsValidEnd =  if (i == 0) { lastHalf } else { validEnd(i-1) || !HasCExtension.B }
            validStart(i)   := (lastIsValidEnd || !HasCExtension.B)
            validEnd(i)     := validStart(i) && isRVC(i) || !validStart(i) || !HasCExtension.B
        }
        validStart
    }
}

class IbufPtr(implicit p: Parameters) extends CircularQueuePtr[IbufPtr](
    p => p(XSCoreParamsKey).IBufSize
){
    override def cloneType = (new IbufPtr).asInstanceOf[this.type]
}

object IbufPtr {
    def apply(flag: Bool, value: UInt)(implicit p: Parameters): IbufPtr = {
        val ptr = Wire(new IbufPtr)
        ptr.flag := flag
        ptr.value := value
        ptr
    }
}

class IbufferIO(implicit p: Parameters) extends XSBundle with IBufConst {
    val flush = Input(Bool())
    val in  = DecoupledIO(new FetchToIBuffer)
    val out = Vec(DecodeWidth, DecoupledIO(new CtrlFlow))
    val full = Output(Bool())
}

class NewIbuffer(implicit p: Parameters ) extends XSModule with HasCircularQueuePtrHelper
    with IBufConst
{
    class IBufEntry(implicit p: Parameters) extends XSBundle {
        val cacheline = UInt(blockBits.W)
        val lastHalfInst = UInt(InstrLen.W)
        val linePC = UInt(VAddrBits.W)
        val foldpc = UInt(MemPredPCWidth.W)
        val pred_taken = Bool()
        val ftqPtr = new FtqPtr
        val ipf = Bool()
        val acf = Bool()
    }

    class LastHalf(implicit  p: Parameters) extends XSBundle {
        val hasLastHalf     = Bool()
        val lastPageFaut    = Bool()
        val halfInstr       = UInt(16.W)
        val lastEndPC       = UInt(VAddrBits.W)

        def matchThisBlock(lineStart: UInt) = hasLastHalf && lastEndPC === lineStart
    }

    val io = IO(new IbufferIO)

    val enqPtr, deqPtr = RegInit(IbufPtr(false.B, 0.U))
    val ibuffer = Module(new SyncDataModuleTemplate(new IBufEntry, numEntries =  IBufSize, numRead =  1, numWrite = 1))
    val validVecQueue = Module(new SyncDataModuleTemplate(Vec(PredictWidth, Bool()), numEntries =  IBufSize, numRead =  1, numWrite = 1))
    val lastHalf = RegInit(0.U.asTypeOf((new LastHalf)))

    /** enq logic */
    val enqEntry = Wire(new IBufEntry)

    enqEntry.cacheline := io.in.bits.cacheline
    enqEntry.linePC    := io.in.bits.linePC

    ibuffer.io.waddr(0) := enqPtr.value
    ibuffer.io.wen(0)   := io.in.fire()
    ibuffer.io.wdata(0) := enqEntry

    //generate valid bits vector
    val cacheline = enqEntry.cacheline.asTypeOf((Vec(PredictWidth, UInt(16.W))))
    val isRVCVec = VecInit(cacheline.map(isRVC(_)))
    val rangeVec = io.in.bits.rangeVec
    val validVec = genValids(isRVCVec, rangeVec, lastHalf.hasLastHalf)

    validVecQueue.io.waddr(0) := enqPtr.value
    validVecQueue.io.wen(0)   := io.in.fire()
    validVecQueue.io.wdata(0) := validVec

    //save the last half RVI intstruction, as well as the middle pc and the page fault bit
    val lastIsHalfRVI = !isRVCVec(lastInstrIdx)  && validVec(lastInstrIdx) && io.in.fire()
    val lastHalfMet   = lastHalf.matchThisBlock(io.in.bits.linePC)

    when(io.flush){
        lastHalf.hasLastHalf := false.B
    }.elsewhen(lastIsHalfRVI){
        lastHalf.lastPageFaut   := io.in.bits.ipf
        lastHalf.halfInstr      := cacheline(lastInstrIdx)
        lastHalf.lastEndPC      := getNextLineStart(io.in.bits.linePC)
    }.elsewhen(lastHalfMet){
        lastHalf.hasLastHalf := false.B
    }

    enqPtr := enqPtr + io.in.fire()

    /** deq logic */
    val s_valid :: s_sendOut :: Nil = Enum(2)

    val deqEntry     = ibuffer.io.rdata(0)
    val deqValids    = validVecQueue.io.rdata(0)
    val deqNextValids = Wire(Vec(PredictWidth, Bool()))
    val deqEntries   = PopCount(deqValids)
    val deqCacheline = deqEntry.cacheline

    val rawInsts = if (HasCExtension) VecInit((0 until PredictWidth - 1).map(i => Cat(deqCacheline(i+1), deqCacheline(i))))
                    else         VecInit((0 until PredictWidth).map(i => deqCacheline(i)))

    // validInstrCnt indicates how many instructions in the dequeuing entry cacheline
    // acceptCnt indicates how many instructions that can be accepted by DecodeStage
    val (validInstrCnt, acceptCnt) =  (PopCount(deqValids), PopCount(VecInit(io.out.map(_.ready))))

    //outPtrs is the pointers of the instructions that ready to send to DecodeStage
    val outInsts = Wire(Vec(DecodeWidth, UInt(32.W)))
    val outPtrs  = Wire(Vec(DecodeWidth, UInt(log2Ceil(DecodeWidth).W)))

    val canDeque = validInstrCnt === 0.U
    val deqExpVec = Wire(ExceptionVec())

    deqExpVec := DontCare
    deqExpVec(instrPageFault) := deqEntry.ipf
    deqExpVec(instrAccessFault) := deqEntry.acf

    ibuffer.io.raddr(0) := deqPtr.value
    validVecQueue.io.raddr(0) := deqPtr.value

    validVecQueue.io.waddr(0) := deqPtr.value
    validVecQueue.io.wen(0)   := validInstrCnt > acceptCnt
    validVecQueue.io.wdata(0) := deqNextValids

    outPtrs.zipWithIndex.foreach{case(ptr, idx) =>
        val validSeq = deqValids.drop(idx)
        ptr := ParallelPriorityEncoder(validSeq)
        deqNextValids(ptr) := deqValids(ptr) && !io.out(idx).ready
    }

    deqPtr := deqPtr + canDeque

    /** out to decode logic */
    //expand instructions to 32 bits
    val expanders       = (0 until DecodeWidth).map{ i =>
        val expander = Module(new RVCExpander)
        expander.io.in := rawInsts(outPtrs(i))
        expander
    }


    for(i <- 0 until DecodeWidth){
        //ignore the backend info in CtrFlow
        io.out(i).bits := DontCare
        //assign the frontend info to CtrFlow
        io.out(i).bits.instr  := RegNext(expanders(i).io.out)
        io.out(i).bits.pc     := RegNext(deqEntry.linePC + outPtrs(i))
        io.out(i).bits.foldpc := RegNext(XORFold(io.out(i).bits.pc(VAddrBits-1,1), MemPredPCWidth)) //TODO: this maybe timing critical
        io.out(i).bits.exceptionVec := RegNext(deqExpVec)
        io.out(i).bits.ftqPtr       := RegNext(deqEntry.ftqPtr)
        io.out(i).bits.pred_taken   := RegNext(deqEntry.pred_taken)
        io.out(i).bits.ftqOffset    := RegNext(outPtrs(i))
    }

    /** flush logic */
    when(io.flush){
        enqPtr := IbufPtr(false.B, 0.U)
        deqPtr := IbufPtr(false.B, 0.U)
    }
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
