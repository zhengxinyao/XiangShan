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

//package xiangshan.backed.trigger
//
//import chipsalliance.rocketchip.config.Parameters
//import chisel3._
//import chisel3.util._
//import utils._
//import xiangshan._
//import xiangshan.backend._
//import utils.XSDebug
//
//class GenericBroadcastIO (implicit p: Parameters) extends XSBundle {
//  val action = Bool()
//  val enable = Bool() // priv mode enable signal, is calculated in csr
//}
//
//class Mcontrol (implicit p: Parameters) extends GenericBroadcastIO {
//  val timing = Bool()
//  val select = Bool()
//  val action = Bool()
//  val chain = Bool()
//  val matchType = UInt(2.W)
//}
//
//  /*
//   * Example Trigger Comparison Component
//   *
//   */
//
//object TriggerCmp {
//  def apply(actual: UInt, tdata: UInt, action: UInt, enable: Bool) = {
//      val equal = actual === tdata
//      val greater = actual >= tdata
//      val less = actual <= tdata
//      val res = MuxLookup(action, false.B,
//        Seq(0.U -> equal,
//            2.U -> greater,
//            3.U -> less))
//      res && enable
//  }
//}
