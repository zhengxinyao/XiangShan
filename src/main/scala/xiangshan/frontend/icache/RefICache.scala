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

package xiangshan.frontend.icache

import chipsalliance.rocketchip.config.Parameters
import chisel3._
import chisel3.util._
import xiangshan._
import utils._
import device._
import xiangshan.cache.mmu._


class reqQueuePtr(implicit p:Parameters) extends CircularQueuePtr[reqQueuePtr](
  64
){
}

object reqQueuePtr {
  def apply(flag: Bool, value: UInt)(implicit p:Parameters):reqQueuePtr = {
    val ptr = Wire(new reqQueuePtr)
    ptr.flag := flag
    ptr.value := value
    ptr
  }
}

object entryMeta {
  val width = 2

  def Invalid = 0.U(width.W)
  def VaddrMiss = 1.U(width.W)
  def PaddrGet = 2.U(width.W)
  def FetchFinish    = 3.U(width.W)

}

object addressMeta {
  val width =2

  def TLB_IDLE   = 0.U(width.W)
  def TLB_MISS   = 1.U(width.W)
  def TLB_HIT    = 3.U(width.W)
  def TLB_REFILL = 4.U(width.W)
}

class reqQueueEntry(implicit  p:Parameters) extends XSBundle{
  val reqInfo = new RefICacheReq
  val paddr   = Vec(3, UInt(PAddrBits.W))
  val except  = Vec(3, new Bundle() {
    val pf = new TlbExceptionBundle()
    val af = new TlbExceptionBundle()
  })
}

class RefICacheReq(implicit p:Parameters) extends XSBundle
{
  val brFlag      = UInt(3.W)
  val addrs       = Vec(3, UInt(VAddrBits.W))
}

class RefICacheResp(implicit p:Parameters) extends XSBundle
{
  val data = UInt((4 * 64).W)
}
class RefICacheIO(implicit p:Parameters) extends XSBundle
{
  val req   = Flipped(DecoupledIO(new RefICacheReq))
  val resp  = ValidIO(new RefICacheResp)
  val itlb  = Vec(3, new BlockTlbRequestIO)
  val pmp   = Vec(3, new ICachePMPBundle)
}

class RefICache(implicit p:Parameters) extends XSModule
{
  val io = IO(new RefICacheIO)

  val reqQueue = RegInit(VecInit(Seq.fill(64)(new reqQueueEntry)))
  val addrStateQueue = RegInit(VecInit(Seq.fill(64)( VecInit(Seq.fill(3)(addressMeta.TLB_IDLE )))))
  val entryStateQueue = RegInit(VecInit(Seq.fill(64)(entryMeta.Invalid)))

  val headPtr = RegInit(reqQueuePtr(false.B, 0.U))
  val fetchPtr = RegInit(reqQueuePtr(false.B, 0.U))
  val tailPtr = RegInit(reqQueuePtr(false.B, 0.U))

  /** itlb logic */
  for(i <- (0 until 3)){
    val toITLB = io.itlb(i).req
    toITLB.valid := ((i == 0).B || io.req.bits.brFlag(i).asBool) && (io.req.fire())
    toITLB.bits.size  := 3.U
    toITLB.bits.vaddr := io.req.bits.addrs(i)
    toITLB.bits.debug.pc := io.req.bits.addrs(i)

    when(RegNext(io.itlb(i).req.fire() && !io.itlb(i).resp.bits.miss)) {
      reqQueue(headPtr.value).paddr(i) := io.itlb(i).resp.bits.paddr
      reqQueue(headPtr.value).except(i) := io.itlb(i).resp.bits.excp
    }
  }

  val tlb_miss_vec   = VecInit((0 until 3).map( i => io.itlb(i).req.valid && io.itlb(i).resp.bits.miss ))
  val tlb_hit_vec   = VecInit((0 until 3).map( i => io.itlb(i).req.valid && !io.itlb(i).resp.bits.miss))

  val tlb_has_miss   = tlb_miss_vec.reduce(_||_)

  when(io.req.fire()){
    reqQueue(headPtr.value).reqInfo := io.req.bits
    entryStateQueue(headPtr.value) := Mux(tlb_has_miss, entryMeta.VaddrMiss, entryMeta.PaddrGet)
    addrStateQueue(headPtr.value).zipWithIndex.map{ case(addrState, index) =>
      addrState := Mux(tlb_miss_vec(index),addressMeta.TLB_MISS,
        Mux(tlb_hit_vec(index),addressMeta.TLB_HIT,addressMeta.TLB_IDLE))
    }
  }

  when(entryStateQueue(headPtr.value) === entryMeta.PaddrGet){
    headPtr := headPtr + 1.U
  }

  addrStateQueue(headPtr.value).zipWithIndex.map{case(addrState, index) =>
    val refill_finish = addrState === addressMeta.TLB_MISS && io.itlb(index).req.valid && !io.itlb(index).resp.bits.miss
    when(refill_finish){
      addrState := addressMeta.TLB_REFILL
    }
  }

  when(entryStateQueue(headPtr.value) === entryMeta.VaddrMiss){
    // take of tlb request channel
    for(i <- (0 until 3)){
      val toITLB = io.itlb(i).req
      toITLB.valid := true.B
      toITLB.bits.size  := 3.U
      toITLB.bits.vaddr     := reqQueue(headPtr.value).reqInfo.addrs(i)
      toITLB.bits.debug.pc  := reqQueue(headPtr.value).reqInfo.addrs(i)
    }

    //stop enqueue until entry tlb request all finish
    val finish_condition = addrStateQueue(headPtr.value).map(_ =/= addressMeta.TLB_MISS).reduce((_&&_))
    when(finish_condition) {headPtr := headPtr + 1.U}
  }

  //fetch instruction code


  val startPaddr = reqQueue(fetchPtr.value).paddr(0)
  val addrs = (0 until 4).map(i => startPaddr + (8 * i).U)

  val readEnable = entryStateQueue(fetchPtr.value) === entryMeta.PaddrGet

  when(readEnable){
    fetchPtr := fetchPtr + 1.U
    entryStateQueue(fetchPtr.value) := entryMeta.FetchFinish
  }

  val rams = (0 until 4).map{ w =>
    val word = Module(new RAMHelper(memByte =8))
    word.clk    := clock
    word.en     := readEnable
    word.rIdx   := addrs(w)
    word
  }

  when(entryStateQueue(tailPtr.value) === entryMeta.FetchFinish){
    entryStateQueue(tailPtr.value) := entryMeta.Invalid
    addrStateQueue(tailPtr.value).map(_ := addressMeta.TLB_IDLE )
  }

  io.resp.valid     := RegNext(readEnable)
  io.resp.bits.data := RegNext(Cat(rams.map(_.rdata).reverse))

}