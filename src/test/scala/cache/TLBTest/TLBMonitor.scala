package cache.TLBTest

import cache.TestAgentBase

import scala.collection.mutable
import scala.collection.mutable.{ArrayBuffer, ListBuffer}
import chipsalliance.rocketchip.config.Parameters

import scala.util.Random
import chisel3.util._

class TLBScoreBoardData {
  var vpn: BigInt = 0
  var ppn: BigInt = 0


}

class TLBMonitor(isDtlb: Boolean, tlbWidth: Int, ID: Int = 0, name: String = "TLBMonitor", start_clock: Int = 0)
  extends TestAgentBase(ID, name, start_clock) {

  def snoop(bus: TLBInterfaceBase): Unit = {

  }
}