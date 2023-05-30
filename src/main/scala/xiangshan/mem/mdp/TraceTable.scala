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
import xiangshan.mem._
import utils._
import utility._
import xiangshan.backend.rob.RobPtr


class TraceTable(implicit p: Parameters) extends XSModule {
  val io = IO(new Bundle() {
    val redirect = Flipped(ValidIO(new Redirect))

    // from load unit s1
    val issue = Vec(LoadPipelineWidth, Flipped(Valid(new MicroOp)))

    // to load unit s2
    val resp = Vec(LoadPipelineWidth, Output(Valid(new SqPtr())))

    // from dispatch
    val update = Vec(StorePipelineWidth, Input(Valid(new MicroOp)))
  })

  /**
   * Update
   */
  val canUpdate = io.update.map(_.valid) 
  val updateCancel = io.update.map(_.bits.robIdx.needFlush(io.redirect))

  /**
   * Look up
   */


  // end
}