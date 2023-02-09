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

class VLSDecodeBuffer(implicit p: Parameters) extends XSModule {
  val io = IO(new Bundle() {
    val in = Vec(VecMemSrcInWidth, Flipped(Decoupled(new BaseVecDecodeEnqReq)))
    val out = Vec(2, Decoupled(new BaseVecDecodeEnqReq))
  })

  val port0divto2 = WireInit(false.B)

  (0 until 2).map{i => {
    // default value
    io.in(i).ready := true.B
    io.out(i).valid := false.B
    io.out(i).bits := DontCare
  }}

  (0 until 2).map{i => {
    // val ctrl = Wire(new VecMemCtrl)
    // ctrl.fromInst(io.in(i).bits.inst)
    val mop = io.in(i).bits.uop.cf.inst(27,26)
    val isIndexed = mop(0)
    val vwidth = io.in(i).bits.uop.cf.inst(14,12)
    val lmul = io.in(i).bits.config.lmul
    val sew = io.in(i).bits.config.sew
    val eew_raw = Mux(isIndexed, sew(1,0), vwidth(1,0))

    val vl = VLEN.U << sew(1,0) >> lmul // TODO
    val datasize = vl << eew_raw << 3

    val vend = vstart(5,0) +& datasize(5,0)
    val crossline = vend(6)

  //   // case 1: not cross line
  //   val bytemaskNocrossline = UIntToMask(vstart(5,0)) ^ UIntToMask(vend(5,0))
  //   when (bytemaskNocrossline) {
  //     io.out(i).bits := ......
  //     io.out(i).valid := true.B
  //   }
  //   // case 2: cross line
  //   val bytemaskCrossline1 = UIntToMask.rightmask(vstart(5,0))
  //   val bytemaskCrossline2 = UIntToMask.leftmask(vend(5,0))
  //   val vstart2 = vstart + (1.U << 6)
  //   if (i == 0) {
  //     when (!bytemaskNocrossline) {
  //       port0divto2 := true.B
  //       io.out(0).valid := true.B
  //       io.out(0).bits := .....
  //       io.out(1).valid := true.B
  //       io.out(1).bits := .....
  //     }
  //   }
  }}
}

