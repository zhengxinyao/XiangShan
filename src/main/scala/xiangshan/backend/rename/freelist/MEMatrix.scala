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

package xiangshan.backend.rename.freelist

import chipsalliance.rocketchip.config.Parameters
import chisel3._
import chisel3.util._
import xiangshan._

class METable extends Bundle {
  val table = MixedVec(Seq.tabulate(30)(i => Vec(30 - i, Bool())))

  def getBit(row: Int, col: Int): Bool =
    if (row == 0 || col == 0 || row == col)
      WireDefault(false.B)
    else if (col > row)
      table(row - 1)(col - row - 1)
    else
      getBit(col, row)

  def read(addr: UInt): UInt =
    Mux1H(UIntToOH(addr), Seq.tabulate(32)(i => VecInit.tabulate(32)(j => getBit(i, j)).asUInt))

  def write(addr: UInt, data: UInt): Unit =
    for (i <- 0 until 32)
      when(addr === i.U) {
        for (j <- 0 until 32)
          getBit(i, j) := data(j)
      }
}

class MEMatrix(implicit p: Parameters) extends XSModule {
  val io = IO(new Bundle {
    val freeRegs = Vec(CommitWidth, ValidIO(UInt(PhyRegIdxWidth.W)))
    val commit = Input(new RobCommitIO)
  })

  val table = RegInit(0.U.asTypeOf(new METable))
  val tableNext = WireDefault(VecInit.fill(CommitWidth + 1)(table))
  val commit = RegNext(io.commit, 0.U.asTypeOf(io.commit))
  val isMove = commit.info.map(_.isMove)
  val isVset = commit.info.map(_ => false.B) // commit.info.map(_.ldest(5)) // ldest == 32

  val freeValid = WireDefault(VecInit.fill(CommitWidth)(false.B))
  for (i <- 0 until CommitWidth) {
    val ldstArray = tableNext(i).read(commit.info(i).ldest(4, 0))
    val lsrcArray = tableNext(i).read(commit.info(i).lsrc)
    val maskArray = UIntToOH(commit.info(i).lsrc)
    val isSelfMove = isMove(i) && commit.info(i).ldest(4, 0) === commit.info(i).lsrc
    tableNext(i + 1) := tableNext(i)
    when(commit.isCommit && commit.commitValid(i) && commit.info(i).rfWen) {
      // safe for vset as the lower 5 bits are 0s
      tableNext(i + 1).write(commit.info(i).ldest(4, 0), (lsrcArray | maskArray) & VecInit.fill(32)(isMove(i)).asUInt)
      // preg 0 should never be freed
      // vset always frees old_pdest which is not preg 0
      when(!isSelfMove && (!ldstArray.orR || isVset(i)) && commit.info(i).old_pdest =/= 0.U) {
        freeValid(i) := true.B
      }
    }
    io.freeRegs(i).valid := RegNext(freeValid(i), false.B)
    io.freeRegs(i).bits := RegNext(commit.info(i).old_pdest)
  }
  table := tableNext.last
}
