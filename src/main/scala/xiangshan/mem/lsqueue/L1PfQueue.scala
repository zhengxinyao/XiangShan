package xiangshan.mem.strideprefetch

import chipsalliance.rocketchip.config.{Parameters, Field}
import chisel3._
import chisel3.util._
import utils._
import xiangshan._
import xiangshan.backend.decode.ImmUnion
import xiangshan.cache._
import xiangshan.mem._

class L1PfPtr(implicit p: Parameters) extends CircularQueuePtr[L1PfPtr](
    p => p(XSCoreParamsKey).L1PfSize
){
}

class L1PfQueueReq(implicit p: Parameters) extends XSBundle {
    val vaddr   = UInt(VAddrBits.W)
    val uop     = new MicroOp
}

class L1PfQueueIO(implicit p: Parameters) extends XSBundle {
    val in = Vec(CommitWidth, Flipped(DecoupledIO(new L1PfQueueReq)))       //6
    val out = Vec(L1DPrefetchPipelineWidth, DecoupledIO(new ToStrideReq))   //1
}

class L1PfQueue(implicit p: Parameters) extends XSModule with HasCircularQueuePtrHelper {
    val io = IO(new L1PfQueueIO)

    class L1PfQueueEntry(implicit p: Parameters) extends XSBundle {
        val prefetchIO = new ToStrideReq
        val uop        = new MicroOp
    }

    val l1pfq    = Module(new SyncDataModuleTemplate(new L1PfQueueEntry, L1PfSize, L1DPrefetchPipelineWidth, CommitWidth))
    val bufMask  = VecInit(io.in.map(_.valid)).asUInt()
    val head_vec = RegInit(VecInit((0 until L1DPrefetchPipelineWidth).map(_.U.asTypeOf(new L1PfPtr))))
    val tail_vec = RegInit(VecInit((0 until CommitWidth).map(_.U.asTypeOf(new L1PfPtr))))
    val head_ptr = head_vec(0)
    val tail_ptr = tail_vec(0)

    val validEntries = distanceBetween(tail_ptr, head_ptr)
    val full_flush = RegInit(false.B)

    val numberEnq = Mux(Cat(io.in.map(_.valid)).orR, PopCount(bufMask), 0.U)
    val numberShouldDeq = Mux(validEntries >= L1DPrefetchPipelineWidth.U, L1DPrefetchPipelineWidth.U, validEntries)
    val numberRealDeq = PopCount(io.out.map(_.fire))

    val numberAfterEnq = validEntries +& numberEnq
    val nextValidEntries = Mux(io.out(0).ready, numberAfterEnq - numberShouldDeq, numberAfterEnq)

    full_flush := (L1PfSize - CommitWidth).U <= nextValidEntries

    // the input stuff
    val offset = Wire(Vec(CommitWidth, UInt(log2Up(CommitWidth).W)))

    for(i <- 0 until CommitWidth) {
        if(i == 0) {
            offset(i) := 0.U
        } else {
            offset(i) := PopCount(bufMask(i - 1, 0))
        }
    }

    for(i <- 0 until CommitWidth) {
        val inputWire = Wire(new L1PfQueueEntry)
        inputWire.prefetchIO.reqVaddr := io.in(i).bits.vaddr
        inputWire.prefetchIO.pc := io.in(i).bits.uop.cf.pc
        inputWire.uop <> io.in(i).bits.uop

        l1pfq.io.waddr(i) := tail_vec(offset(i)).value
        l1pfq.io.wdata(i) := inputWire
        l1pfq.io.wen(i) := bufMask(i) && io.in(i).fire

        io.in(i).ready := true.B

        when (bufMask(i) && io.in(i).fire) {
            printf("time=[%d] pc 0x%x robIdx %d lqIdx %d vaddr 0x%x input\n", GTimer(), 
            io.in(i).bits.uop.cf.pc, 
            io.in(i).bits.uop.robIdx.asUInt, 
            io.in(i).bits.uop.lqIdx.asUInt, 
            io.in(i).bits.vaddr)    
        }
        
    }

    when (Cat(io.in.map(_.fire())).orR && !full_flush) {
        tail_vec := VecInit(tail_vec.map(_ +PopCount(bufMask)))
    }

    // the output stuff
    val validVec = Mux(validEntries >= L1DPrefetchPipelineWidth.U, ((1 << L1DPrefetchPipelineWidth) - 1).U, UIntToMask(validEntries, L1DPrefetchPipelineWidth))

    for (i <- 0 until L1DPrefetchPipelineWidth) {
        io.out(i).valid := validVec(i)
        val outputWire = l1pfq.io.rdata(i)
        io.out(i).bits.reqVaddr := outputWire.prefetchIO.reqVaddr
        io.out(i).bits.pc := outputWire.prefetchIO.pc

        when (validVec(i)) {
            printf("time=[%d] pc 0x%x robIdx %d lqIdx %d vaddr 0x%x output\n", GTimer(), 
            outputWire.prefetchIO.pc, 
            outputWire.uop.robIdx.asUInt, 
            outputWire.uop.lqIdx.asUInt, 
            outputWire.prefetchIO.reqVaddr)    
        }
        
    }

    val next_head_vec = VecInit(head_vec.map(_ + numberRealDeq))
    head_vec := next_head_vec
    l1pfq.io.raddr := VecInit(next_head_vec.map(_.value))

    //when the buffer can't enq more data, just flush all
    when (full_flush) {
        val head_vec = VecInit((0 until L1DPrefetchPipelineWidth).map(_.U.asTypeOf(new L1PfPtr)))
        val tail_vec = VecInit((0 until L1DPrefetchPipelineWidth).map(_.U.asTypeOf(new L1PfPtr)))
        full_flush := false.B
    }

    // when(io.in.fire()) {
    //     XSDebug(p"prebufMASK=${Binary(bufMask)} Enque = ${Hexadecimal(numberEnq)}\n")
    //     for(i <- 0 until CommitWidth){
    //         XSDebug(bufMask(i), p"prepaddr=${Hexadecimal(io.in.bits.vaddr(i))}\n")
    //     }
    // }
  

    // for (i <- 0 until L1DPrefetchPipelineWidth) {
    //     XSDebug(io.out(i).fire(), p"deq: reqVaddr=${Hexadecimal(io.out(i).bits.respVaddr)} valid=${io.out(i).valid}\n")
    // }

    XSDebug(p"ValidEntries: ${validEntries}\n")
    XSPerfAccumulate("flash_times", full_flush)
}
