package cache.TLBTest

import scala.collection.mutable.ArrayBuffer

class TLBDriverInterface(width: Int = 4) extends TLBInterfaceBase(width = width){
  //tlbReqReady is in Option
  val tlbRespReady:ArrayBuffer[Boolean] = ArrayBuffer.fill(width)(true)
  val ptwReqReady: Boolean = false
  //ptwRespValid is in Option

  val tlbReqFire:ArrayBuffer[Boolean] = ArrayBuffer.fill(width)(false)
  val tlbRespFire:ArrayBuffer[Boolean] = ArrayBuffer.fill(width)(false)
  var ptwReqFire: Boolean = false
  var ptwRespFire: Boolean = false
}

class TLBDriver(isDtlb: Boolean, tlbWidth: Int) {

}
