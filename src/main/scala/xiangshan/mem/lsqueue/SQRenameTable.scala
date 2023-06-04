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

package xiangshan.mem

import chipsalliance.rocketchip.config.Parameters
import chisel3._
import chisel3.util._
import utils._
import utility._
import xiangshan._
import xiangshan.backend.rob.RobPtr

class SQRatReadPort(implicit p: Parameters) extends XSBundleWithMicroOp {
  val addr = UInt()
  val data = Output(new SqPtr)
}

class SQRatWritePort(implicit p: Parameters) extends XSBundleWithMicroOp {
  val addr = UInt()
  val data = new SqPtr
}

class SQRatValidGen(size: Int, numReadPorts: Int, numWritePorts: Int)(implicit p: Parameters) extends XSModule 
  with HasCircularQueuePtrHelper 
{
  val io = IO(new Bundle() {
    val redirect = Flipped(Valid(new Redirect))
    val writePorts = Vec(numWritePorts, Flipped(Valid(new SQRatWritePort)))
    val commit = Input(UInt(log2Up(CommitWidth + 1).W)) 
    val validVec = Vec(size, Output(Bool()))
  })

  val validVec = RegInit(Seq.fill(size)(false.B))
  val meta = Reg(Vec(size, new MicroOp))

  class RatPtr extends CircularQueuePtr[RatPtr](size)
  object RatPtr {
    def apply(f: Boolean, v: Int): RatPtr = {
      val ptr = Wire(new RatPtr)
      ptr.flag := f.B
      ptr.value := v.U
      ptr
    }
  } 
  val headPtr = RegInit(0.U.asTypeOf(new RatPtr))
  val tailPtr = RegInit(0.U.asTypeOf(new RatPtr))

  // update
  val canAllocate = io.writePorts.map(x => x.valid && !x.bits.uop.robIdx.needFlush(io.redirect))
  for ((write, w) <- io.writePorts.zipWithIndex) {
    val addr = write.bits.addr

    when (canAllocate(w)) {
      validVec(addr) := true.B 
      meta(addr) := write.bits.uop
    }
  }

  headPtr := headPtr + PopCount(canAllocate)
  XSError(isAfter(tailPtr, headPtr), s"headPtr is after tailPtr!\n")

  /**
    * Store commits
    *
    * When store commited, mark it as !valid and move tailPtr forward.
    */
  val commitCount = RegNext(io.commit)
  for (i <- 0 until CommitWidth) {
    when (commitCount > i.U) {
      valid((tailPtr + i.U).value) := false.B
      XSError(!valid((tailPtr+i.U).value), s"why commit invalid entry $i?\n")
    }
  }

  // Release
  for (i <- 0 until size) {
    val needCancel = meta(i).robIdx.needFlush(io.redirect) 
    when (needCancel) {
      validVec(i) := false.B
    }
  }

  io.validVec := validVec
  //  end
}

class SQRenameTable(size: Int, numReadPorts: Int, numWritePorts: Int, enableBypass: Boolean = false)(implicit p: Parameters) extends XSModule {
  val io = IO(new Bundle() {
    val redirect = Flipped(Valid(new Redirect))
    val readPorts = Vec(numReadPorts, new SQRatReadPort)
    val writePorts = Vec(numWritePorts, Flipped(Valid(new SQRatWritePort)))
    val commit = Input(UInt(log2Up(CommitWidth + 1).W)) 
  })

  val ratValidGen = Module(new SQRatValidGen)
  val renameTableInit = VecInit.tabulate(size)(i => i.U.asTypeOf(new SqPtr))
  val renameTable = RegInit(renameTableInit)

  ratValidGen.io.redirect <> io.redirect
  ratValidGen.io.writePorts <> io.writePorts
  ratValidGen.io.commit <> io.commit
  val validVec = ratValidGen.io.validVec

  // read real sqIdx
  val readReq = RegNext(io.readPorts)
  val writeReq = (0 until numWritePorts).map(i => {
    val writePorts = RegNext(io.writePorts(i))
    val req = Wire(io.writePorts(i).cloneType)
    req.valid := writePorts(i).valid && 
                 !writePorts(i).bits.uop.robIdx.needFlush(io.redirect) && 
                 !writePorts(i).bits.uop.robIdx.needFlush(RegNext(io.redirect))
    req.bits := writePorts.bits
    req
  })
  for ((read, w) <- io.readPorts.zipWithIndex) {
    val addr = RegNext(read.addr)
    read.data := Mux(!validVec(addr), readReq(w).bits.uop.sqIdx, (0 until numWritePorts).foldLeft(renameTable(addr)) ((p, k) =>  
      Mux(enableBypass.B && writeReq(k).valid && writeReq(k).bits.addr === addr, writeReq(k).bits.data, p)
    ))
  }

  // write real sqIdx
  val canAllocate = io.writePorts.map(x => x.valid && !x.bits.uop.robIdx.needFlush(io.redirect))
  for ((write, w) <- io.writePorts.zipWithIndex) {
    val addr = write.bits.addr 

    when (canAllocate(w)) {
      renameTable(addr) := write.bits.data
    }
  }

  // end
}