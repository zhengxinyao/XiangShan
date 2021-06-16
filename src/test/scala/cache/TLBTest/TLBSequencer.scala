package cache.TLBTest

import cache.TestComponentBase

import scala.collection.mutable
import scala.collection.mutable.ListBuffer

class TLBSequencer(isDtlb: Boolean, tlbWidth: Int, ID: Int = 2, name: String = "TLBSequencer", start_clock: Int = 0)
  extends TestComponentBase(ID, name, start_clock) with TlbCsrConst
{

  val tlbTransList: ListBuffer[TLBCallerTransaction] = ListBuffer()
  val ptwTransList: ListBuffer[(BigInt, PTWCalleeTransaction)] = ListBuffer()

  def changeCsr(): Option[LitTlbCsrBundle] = {
    //TODO
    val csr = new LitTlbCsrBundle()
    csr.privDmode = umode
    csr.privImode = umode
    csr.privSum = false
    csr.privMxr = false
    csr.satpPpn = 0
    csr.satpAsid = 0
    csr.satpMode = 0
    None
  }

  def decideSfence(): Option[LitSfenceBundle] = {
    //TODO
    None
  }

  def issueTlbReqTrans(): Option[TLBCallerTransaction] = {
    val newTrans = new TLBCallerTransaction()

    None
  }

  def handleTlbRespTrans(trans: TLBCallerTransaction): Unit = {

  }

  def checkPtwAvailable(): Boolean = {
    true
  }

  def handlePtwReqTrans(id: BigInt, trans: PTWCalleeTransaction): Unit = {

  }

  def issuePtwRespTrans(): Option[(BigInt, PTWCalleeTransaction)] = {
    None
  }
}