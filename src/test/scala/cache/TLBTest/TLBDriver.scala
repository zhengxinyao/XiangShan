package cache.TLBTest

import cache.TestComponentBase

import scala.collection.mutable
import scala.collection.mutable.{ArrayBuffer, ListBuffer}

class TLBDriverInterface(width: Int = 4) extends TLBInterfaceBase(width = width) {
  //tlbReqReady is in Option
  val tlbRespReady: ArrayBuffer[Boolean] = ArrayBuffer.fill(width)(true)
  var ptwReqReady: Boolean = false
  //ptwRespValid is in Option

  val tlbReqFire: ArrayBuffer[Boolean] = ArrayBuffer.fill(width)(false)
  val tlbRespFire: ArrayBuffer[Boolean] = ArrayBuffer.fill(width)(false)
  var ptwReqFire: Boolean = false
  var ptwRespFire: Boolean = false
}

class TLBDriver(isDtlb: Boolean, tlbWidth: Int) extends TestComponentBase(ID = 1, name = "TLBDriver", start_clock = 0) {
  //driver and sequencer has no duty for recording tlb result
  val tlbDriverIf = new TLBDriverInterface(tlbWidth)

  val tlbCallerPort: ArrayBuffer[Option[TLBCallerTransaction]] = ArrayBuffer.fill(tlbWidth)(None)
  val tlbNextCallerPort: ArrayBuffer[Option[TLBCallerTransaction]] = ArrayBuffer.fill(tlbWidth)(None)
  var ptwRespPort: Option[(BigInt, PTWCalleeTransaction)] = None

  def pokeCsr(sequencer: TLBSequencer): Unit = {
    //TODO
  }

  //let seq to decide whether flush tlb and the reqs in sfence cycles (if is DTLB)
  def pokeSfence(sequencer: TLBSequencer): Unit = {
    //TODO
  }

  def pokeTlbReq(sequencer: TLBSequencer): Unit = {
    //call sequencer to issue, decide TLB req valid
    for (i <- 0 until tlbWidth) {
      if (tlbDriverIf.tlbReq(i).isEmpty) {
        val newOptTlb = sequencer.issueTlbReqTrans()
        if (newOptTlb.isDefined) {
          tlbDriverIf.tlbReq(i) = newOptTlb.get.req
          tlbCallerPort(i) = newOptTlb
        }
      }
    }
  }

  def pokeTlbResp(sequencer: TLBSequencer): Unit = {
    //no backup pressure for now
    for (i <- 0 until tlbWidth) {
      tlbDriverIf.tlbRespReady(i) = true
    }
  }

  def pokePtwReq(sequencer: TLBSequencer): Unit = {
    //decide PTW req ready
    tlbDriverIf.ptwReqReady = sequencer.checkPtwAvailable()
  }

  def pokePtwResp(sequencer: TLBSequencer): Unit = {
    //call sequencer to issue, put PTW resp on the output port
    if (ptwRespPort.isEmpty) {
      val idPtwT = sequencer.issuePtwRespTrans()
      if (idPtwT.isDefined){
        tlbDriverIf.ptwResp = idPtwT.get._2.resp
        ptwRespPort = idPtwT
      }
    }
  }

  def peekTlbReq(sequencer: TLBSequencer): Unit = {
    //no need to report to sequencer
  }

  def peekTlbResp(sequencer: TLBSequencer): Unit = {
    for (i <- 0 until tlbWidth) {
      if (tlbDriverIf.tlbRespFire(i)) {
        tlbDriverIf.tlbRespFire(i) = false
        //notify sequencer to decide replay or release source
        val pairT = if (isDtlb) tlbNextCallerPort(i).get else tlbCallerPort(i).get
        pairT.pairResp(tlbDriverIf.tlbResp(i).get)
        sequencer.handleTlbRespTrans(pairT)
      }
    }
  }

  def peekPtwReq(sequencer: TLBSequencer): Unit = {
    //if fire PTW, new a transaction, pass to sequencer
    if (tlbDriverIf.ptwReqFire) {
      tlbDriverIf.ptwReqFire = false
      val newT = new PTWCalleeTransaction()
      newT.pairReq(tlbDriverIf.ptwReq.get)
      val id = 0
      sequencer.handlePtwReqTrans(id, newT)
    }
  }

  def peekPtwResp(sequencer: TLBSequencer): Unit = {
    //check PTW resp fire, no need to report to sequencer
    if (tlbDriverIf.ptwRespFire) {
      tlbDriverIf.ptwRespFire = false
      tlbDriverIf.ptwResp = None
      ptwRespPort = None
    }
  }

  def driverPoke(sequencer: TLBSequencer): Unit = {
    pokeCsr(sequencer)
    pokeSfence(sequencer)
    pokeTlbReq(sequencer)
    pokeTlbResp(sequencer)
    pokePtwReq(sequencer)
    pokePtwResp(sequencer)
  }

  def driverPeek(sequencer: TLBSequencer): Unit = {
    peekTlbReq(sequencer)
    peekTlbResp(sequencer)
    peekPtwReq(sequencer)
    peekPtwResp(sequencer)
  }

  override def step(): Unit = {
    //operation related to sequential circuit behaviour
    for (i <- 0 until tlbWidth) {
      if (tlbDriverIf.tlbReqFire(i)) {
        tlbDriverIf.tlbReqFire(i) = false
        tlbDriverIf.tlbReq(i) = None
        if (isDtlb) {
          tlbNextCallerPort(i) = tlbCallerPort(i)
        }
      }
    }
    super.step()
  }
}
