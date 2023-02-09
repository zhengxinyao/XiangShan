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
import xiangshan.cache._

// 1 in 2 out vector load store decode "skid" buffer
class VLSDecodeSkidBuffer(implicit p: Parameters) extends XSModule {
  val io = IO(new Bundle() {
    val in = Flipped(Decoupled(new BaseVecDecodeEnqReq))
    val out = Vec(2, Decoupled(new VlsfqEnqIO))
  })

    val remainCounter = RegInit(0.U(5.W))
    val haveRemain = remainCounter > 0.U
    val inBitsReg = RegEnable(io.in.bits, in.fire() && outBlocked)
    val decodeSrc = Mux(haveRemain, inBitsReg, io.in.bits)

    val mop = decodeSrc.bits.uop.cf.inst(27,26)
    val isIndexed = mop(0)
    val vwidth = decodeSrc.bits.uop.cf.inst(14,12)
    val lmul = decodeSrc.bits.config.lmul
    val sew = decodeSrc.bits.config.sew
    val eew_raw = Mux(isIndexed, sew(1,0), vwidth(1,0))

    val vl = VLEN.U << sew(1,0) >> lmul // TODO
    val datasize = vl << eew_raw << 3

    val vend = vstart(5,0) +& datasize(5,0)
    val crossline = vend(6)

    // case 1: not cross line
    val bytemaskNocrossline = UIntToMask(vstart(5,0)) ^ UIntToMask(vend(5,0))

    // case 2: cross line
    val bytemaskCrossline1 = UIntToMask.rightmask(vstart(5,0))
    val bytemaskCrossline2 = UIntToMask.leftmask(vend(5,0))
    val vstart2 = vstart + (1.U << 6)

    // update remainCounter
    when (haveRemain) {
      remainCounter := remainCounter - (io.out(1).fire() +& io.out(1).fire())
    }.otherwise {
      remainCounter := Mux(bytemaskNocrossline, 1.U, 2.U)
    }

    // multi cycle decode
    // remain counter > 0, decode uop in remain reg inBitsReg first
    when (haveRemain) {
      io.out(0).valid := true.B 
      io.out(0).bits := ......
      io.out(1).valid := counter > 1.U
      io.out(1).bits := ......
    }.otherwise {
      io.out(0).valid := io.in.valid 
      io.out(0).bits := ......
      io.out(1).valid := crossline
      io.out(1).bits := ......
    }

    // input ctrl
    io.in.valid := !haveRemain
}

