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

  def getBit(row: Int, col: Int, isWrite: Boolean): Bool =
    if (row == 0 || col == 0 || row == col)
      if (isWrite) WireDefault(false.B) else false.B
    else if (col > row)
      table(row - 1)(col - row - 1)
    else
      getBit(col, row, isWrite)

  def read(addr: UInt): UInt =
    Mux1H(addr, Seq.tabulate(32)(i => VecInit.tabulate(32)(j => getBit(i, j, false)).asUInt))

  def write(addr: UInt, data: UInt): Unit =
    for (i <- 1 until 32)
      when(addr(i)) {
        for (j <- 1 until 32)
          getBit(i, j, true) := data(j)
      }
}

class MEMatrix(implicit p: Parameters) extends XSModule {
  val io = IO(new Bundle {
    val freeRegs = Vec(CommitWidth, ValidIO(UInt(PhyRegIdxWidth.W)))
    val commit = Input(new RobCommitIO)
  })

  val table = RegInit(0.U.asTypeOf(new METable))
  val tableNext = WireDefault(VecInit.fill(CommitWidth + 1)(table))
  val isMove = io.commit.info.map(x => RegNext(x.isMove))
  val isVset = io.commit.info.map(x => false.B) // commit.info.map(_.ldest(5)) // ldest == 32
  val lsrcOH = io.commit.info.map(x => RegNext(UIntToOH(x.lsrc)))
  val ldestOH = io.commit.info.map(x => RegNext(UIntToOH(x.ldest(4, 0))))
  val old_pdest = io.commit.info.map(x => RegNext(x.old_pdest))

  val freeValid = WireDefault(VecInit.fill(CommitWidth)(false.B))
  for (i <- 0 until CommitWidth) {
    val ldstArray = tableNext(i).read(ldestOH(i))
    val lsrcArray = tableNext(i).read(lsrcOH(i))
    val isSelfMove = RegNext(io.commit.info(i).isMove && io.commit.info(i).ldest(4, 0) === io.commit.info(i).lsrc)
    val do_write = RegNext(io.commit.isCommit && io.commit.commitValid(i) && io.commit.info(i).rfWen, false.B)
    tableNext(i + 1) := tableNext(i)
    when(do_write) {
      if (i >= 3) {
        tableNext(i + 1).write(ldestOH(i), 0.U(32.W))
        when((!ldstArray.orR || isVset(i))) {
          freeValid(i) := true.B
        }
      } else {
        // safe for vset as the lower 5 bits are 0s
        tableNext(i + 1).write(ldestOH(i), (lsrcArray | lsrcOH(i)) & VecInit.fill(32)(isMove(i)).asUInt)
        // preg 0 should never be freed
        // vset always frees old_pdest which is not preg 0
        when(!isSelfMove && (!ldstArray.orR || isVset(i))) {
          freeValid(i) := true.B
        }
      }
    }
    io.freeRegs(i).valid := RegNext(freeValid(i), false.B) && RegNext(old_pdest(i) =/= 0.U)
    io.freeRegs(i).bits := RegNext(old_pdest(i))
  }
  table := tableNext.last
}
