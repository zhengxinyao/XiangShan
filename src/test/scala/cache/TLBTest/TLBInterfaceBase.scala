package cache.TLBTest

import scala.collection.mutable.ArrayBuffer

class TLBInterfaceBase(width: Int) {
  val tlbReq: ArrayBuffer[Option[LitTlbReq]] = ArrayBuffer.fill(width)(None)
  val tlbResp: ArrayBuffer[Option[LitTlbResp]] = ArrayBuffer.fill(width)(None)
  var ptwReq: Option[LitPtwReq] = None
  var ptwResp: Option[LitPtwResp] = None
  var sfence: Option[LitSfenceBundle] = None
  var csr: LitTlbCsrBundle = new LitTlbCsrBundle()
}
