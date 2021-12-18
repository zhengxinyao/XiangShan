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

package xiangshan.mem.mdp

import chipsalliance.rocketchip.config.Parameters
import chisel3._
import chisel3.util._
import xiangshan._
import utils._
import utils._
import xiangshan.mem._
import xiangshan.cache._
import xiangshan.backend.rob.RobPtr

class MDPFeedbackQuery(implicit p: Parameters) extends XSBundle {
  val ssid = UInt(SSIDWidth.W) // store set identifier
  val vaddr = UInt(VAddrBits.W) // load vaddr
  val ld_foldpc = UInt(MemPredPCWidth.W) // load inst's foldpc
  val hit_store_queue = Bool() // from store to load forward result
}

class MDPFeedback(implicit p: Parameters) extends XSBundle {
  val ssid = UInt(SSIDWidth.W) // store set identifier
  val ld_foldpc = UInt(MemPredPCWidth.W) // load inst's foldpc
  val hit_store_queue = Bool() // load vaddr hit in sq vaddr module cam
  val hit_store_fifo = Bool() // load vaddr hit in issued store fifo
}

// class TimeoutCounter(numEntries: Int, initValue: UInt) extends XSModule {
//   val io = IO(new Bundle {
//   })
// }

// Memory Dependency Predictor Feedback Generater
class MDPFeedbackGen(numEntries: Int, inputDelay: Int = 0, outputDelay: Int = 0)(implicit p: Parameters) extends XSModule
  with HasDCacheParameters 
{
  val io = IO(new Bundle {
    val storeIn = Vec(exuParameters.StuCnt, Flipped(Valid(new LsPipelineBundle))) // get issued store addr
    val req = Vec(exuParameters.LduCnt, Flipped(Valid(new MDPFeedbackQuery)))
    val resp = Vec(exuParameters.LduCnt, Valid(new MDPFeedback))
  })

  // TODO: add input / output delay

  val writePtr = RegInit(0.U(log2Up(numEntries).W))
  val data = Reg(Vec(numEntries, UInt(VAddrBits.W)))
  val valid = RegInit(VecInit(Seq.tabulate(numEntries)(false.B)))
  // val timeout_counter = RegInit(VecInit(Seq.tabulate(numEntries)(0.U(5.W))))

  // write ports
  for (i <- 0 until exuParameters.StuCnt) {
    when (io.storeIn(i).valid) {
      data(writePtr + i.U) := io.storeIn(i).bits.vaddr
      valid(writePtr + i.U) := true.B
      // timeout_counter()
    }
  }
  writePtr := writePtr + PopCount(VecInit((0 until exuParameters.StuCnt).map(i => io.storeIn(i).valid)))

  // content addressed match
  for (i <- 0 until exuParameters.LduCnt) {
    io.resp(i).bits.hit_store_fifo := VecInit((0 until numEntries).map(j => 
      io.req(i).bits.vaddr(VAddrBits-1, log2Up(DCacheWordBytes)) === data(j)(VAddrBits-1, log2Up(DCacheWordBytes))
    )).asUInt.orR
    io.resp(i).bits.hit_store_queue := io.req(i).bits.hit_store_queue
    io.resp(i).bits.ssid := io.req(i).bits.ssid
    io.resp(i).bits.ld_foldpc := io.req(i).bits.ld_foldpc
    io.resp(i).valid := io.req(i).valid
    when(io.resp(i).valid){
      printf("%d: memory dependency predictor feedback: hit %d (fifo %d sq %d) ssid %x ldfpc %x\n", 
        GTimer(),
        io.resp(i).bits.hit_store_queue || io.resp(i).bits.hit_store_fifo,
        io.resp(i).bits.hit_store_fifo,
        io.resp(i).bits.hit_store_queue,
        io.resp(i).bits.ssid,
        io.resp(i).bits.ld_foldpc
      )
    }
  }
}