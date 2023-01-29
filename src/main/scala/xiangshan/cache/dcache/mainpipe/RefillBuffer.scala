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

package xiangshan.cache

import chipsalliance.rocketchip.config.Parameters
import chisel3._
import chisel3.util._
import utility._
import xiangshan._
import utils._
import mem.{AddPipelineReg}

class RefillBufferPtr(implicit p: Parameters) extends CircularQueuePtr[RefillBufferPtr](
  p => p(XSCoreParamsKey).DcacheRefillBufferSize
){
}

object RefillBufferPtr {
  def apply(f: Bool, v: UInt)(implicit p: Parameters): RefillBufferPtr = {
    val ptr = Wire(new RefillBufferPtr)
    ptr.flag := f
    ptr.value := v
    ptr
  }
}

class RefillBufferEntry(implicit p: Parameters) extends DCacheModule {
    val io = IO(new Bundle() {
        // to refill pipe
        val refill_pipe_req = DecoupledIO(new RefillPipeReq)
        // come from miss queue
        val miss_queue_req = Flipped(DecoupledIO(new RefillPipeReq))
        // forward information
        val forwardInfo = Output(new RefillBufferForwardIO)
    })

    val req = RegInit(0.U.asTypeOf(new RefillPipeReq))
    val req_valid = RegInit(false.B)

    when(io.miss_queue_req.fire()) {
        req_valid := true.B
        req := io.miss_queue_req.bits
    }
    io.miss_queue_req.ready := !req_valid

    when(io.refill_pipe_req.fire()) {
        req_valid := false.B
    }
    io.refill_pipe_req.valid := req_valid
    io.refill_pipe_req.bits := req

    io.forwardInfo.apply(req_valid, req.addr, req.data.asTypeOf(Vec(blockBytes/beatBytes, UInt(beatBits.W))))
}

class RefillBuffer(implicit p: Parameters) extends DCacheModule with HasCircularQueuePtrHelper{
    val io = IO(new Bundle() {
        // to refill pipe
        val refill_pipe_req = DecoupledIO(new RefillPipeReq)
        // dup to reduce fanout
        val refill_pipe_req_dup = Vec(nDupStatus, DecoupledIO(new RefillPipeReqCtrl))
        // come from miss queue
        val miss_queue_req = Flipped(DecoupledIO(new RefillPipeReq))
        // incoming forward req
        val forward = Vec(LoadPipelineWidth, new LduToRefillBufferForwardIO)
    })

    io := DontCare
    
    val enqPtrExt = RegInit(0.U.asTypeOf(new RefillBufferPtr))
    val deqPtrExt = RegInit(0.U.asTypeOf(new RefillBufferPtr))

    val enqPtr = enqPtrExt.value
    val deqPtr = deqPtrExt.value

    val entries = Seq.fill(DcacheRefillBufferSize)(Module(new RefillBufferEntry))

    val forwardInfo_vec = VecInit(entries.map(_.io.forwardInfo))
    
    entries.zipWithIndex.foreach {
        case (e, i) =>
            // incoming req from miss queue
            e.io.miss_queue_req.valid := false.B
            e.io.miss_queue_req.bits := DontCare
            when(enqPtr === i.U) {
                io.miss_queue_req.ready := e.io.miss_queue_req.ready
                e.io.miss_queue_req.valid := io.miss_queue_req.valid
                e.io.miss_queue_req.bits := io.miss_queue_req.bits
            }
            // outgoing req to refill pipe
            e.io.refill_pipe_req.ready := false.B
            when(deqPtr === i.U) {
                val out_refill_pipe_req_ctrl = Wire(Decoupled(new RefillPipeReqCtrl))
                out_refill_pipe_req_ctrl.valid := e.io.refill_pipe_req.valid
                out_refill_pipe_req_ctrl.bits := e.io.refill_pipe_req.bits.getCtrl
                e.io.refill_pipe_req.ready := out_refill_pipe_req_ctrl.ready
                for (dup <- io.refill_pipe_req_dup) {
                    AddPipelineReg(out_refill_pipe_req_ctrl, dup, false.B)
                }
                AddPipelineReg(e.io.refill_pipe_req, io.refill_pipe_req, false.B)
            }
    }

    when(io.miss_queue_req.fire()) {
        enqPtrExt := enqPtrExt + 1.U;
    }
    when(io.refill_pipe_req.fire()) {
        deqPtrExt := deqPtrExt + 1.U;
    }

    // forward logic
    (0 until LoadPipelineWidth).map(i => {
        val req_valid = io.forward(i).valid
        val paddr = io.forward(i).paddr

        val (forward_valid_vec, forwardData_vec) = forwardInfo_vec.map{info => info.forward(req_valid, paddr)}.unzip
        io.forward(i) := DontCare
        io.forward(i).forward_refill_buffer := Cat(forward_valid_vec).orR
        io.forward(i).forwardData := ParallelMux(forward_valid_vec zip forwardData_vec)
        assert(!io.forward(i).forward_refill_buffer || (PopCount(forward_valid_vec) === 0.U || PopCount(forward_valid_vec) === 1.U), s"port{$i} can not forward 2 or more entries in refillBuffer")
        // io.forward(i).forward_data := forwardData_vec.zip(forward_valid_vec).reduce(Mux(_._2, _._1, 0.U) | Mux(_._2, _._1, 0.U))
  })

    // perf 
    val validCount = distanceBetween(enqPtrExt, deqPtrExt)
    QueuePerf(DcacheRefillBufferSize, validCount, validCount === DcacheRefillBufferSize.U)
    XSPerfAccumulate(PopCount((0 until LoadPipelineWidth).map(i => io.forward(i).forward_refill_buffer)), "forward_refill_buffer")
}
