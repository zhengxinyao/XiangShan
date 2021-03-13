package cache.TLBTest

import cache.TestAgentBase

import scala.collection.mutable
import scala.collection.mutable.ArrayBuffer

trait pageParam {
  val ptePermOffset = 0
  val ptePermMask = BigInt(0xff)
  val pteRswOffset = 8
  val pteRswMask = BigInt(0x3)
  val pgOffset = 12
  val pgOffsetMask = 0xfff
  val vpnMask = 0x1ff
  val vpnBits = 9

  def extractBits(in: BigInt, mask: BigInt, offset: Int): BigInt = {
    (in >> offset) & mask
  }

  def getPageTag(inAddr: BigInt): BigInt = {
    inAddr >> pgOffset
  }

  def getPageOffset(inAddr: BigInt): BigInt = {
    inAddr & pgOffsetMask
  }
}

//only support for sv39 and sv48
trait sv39Param extends pageParam {
  val ptePpnOffset = 10
  val ptePpnFullMask = BigInt(0xfffffffffffL)
  val ppnLevelMask: Array[BigInt] = Array(0x3ffff, 0x1ff, 0x0)

  def getVpn(vpn: BigInt, idx: Int): BigInt = {
    extractBits(vpn, vpnMask, vpnBits * idx)
  }

  def checkPpnAlign(ppn: BigInt, endLevel: BigInt): Boolean = {
    if (endLevel == 2) {
      true
    }
    else {
      extractBits(ppn, ppnLevelMask(endLevel.toInt), 0) == 0
    }
  }
}

class PTEData extends sv39Param {
  var addr: BigInt = 0
  var level: BigInt = 0
  var ppn: BigInt = 0
  var rsw: BigInt = 0
  var perm: LitPtePermBundle = new LitPtePermBundle()

  def ziptoPte(): BigInt = {
    perm.ziptoBigInt() | (rsw << pteRswOffset) | (ppn << ptePpnOffset)
  }

  def unzipFromPte(pte: BigInt): Unit = {
    ppn = extractBits(pte, ptePpnFullMask, ptePpnOffset)
    rsw = extractBits(pte, pteRswMask, pteRswOffset)
    perm.unzipFromPerm(extractBits(pte, ptePermMask, ptePermOffset))
  }
}

class TLBMonitor(isDtlb: Boolean, tlbWidth: Int, ID: Int = 0, name: String = "TLBMonitor", start_clock: Int = 0)
  extends TestAgentBase(ID, name, start_clock) with
    sv39Param {

  val tlbScoreBoard: mutable.Map[BigInt, PTEData] = mutable.Map[BigInt, PTEData]()
  val tlbReq: ArrayBuffer[Option[LitTlbReq]] = ArrayBuffer.fill(tlbWidth)(None)
  var ptwQueryingVPN: mutable.Map[BigInt, LitPtwReq] = mutable.Map[BigInt, LitPtwReq]()

  def snoop(bus: TLBInterfaceBase): Unit = {
    if (bus.sfence.isDefined) {
      handleSfence(bus.sfence.get)
    }
    if (bus.ptwReq.isDefined) {
      handlePtwReq(bus.ptwReq.get)
    }
    if (bus.ptwResp.isDefined) {
      handlePtwResp(bus.ptwResp.get)
    }
    for (i <- 0 until tlbWidth) {
      if (bus.tlbReq(i).isDefined) {
        handleTlbReq(bus.tlbReq(i).get, i)
      }
      if (bus.tlbResp(i).isDefined) {
        handleTlbResp(bus.tlbResp(i).get, i, bus.csr)
      }
    }

  }

  def handleTlbReq(req: LitTlbReq, idx: Int): Unit = {
    tlbReq(idx) = Some(req)
    //!!TODO
  }

  def handleTlbResp(resp: LitTlbResp, idx: Int, csr: LitTlbCsrBundle): Unit = {
    if (resp.miss) {
      tlbReq(idx) = None
    }
    else {
      val req = tlbReq(idx).get
      val vaddr = req.addr
      val cmd = req.cmd
      val paddr = resp.paddr
    }

  }

  def handlePtwReq(req: LitPtwReq): Unit = {
    val id = 0
    ptwQueryingVPN(id) = req
  }

  def handlePtwResp(resp: LitPtwResp): Unit = {
    val id = 0
    if (resp.pf) {
      ptwQueryingVPN.remove(id)
    }
    else {
      val req = ptwQueryingVPN(id)
      assert(req.vpn == resp.entry.vpn)
      val pte = new PTEData()
      pte.level = resp.entry.level
      pte.ppn = resp.entry.ppn
      pte.perm.copyVals(resp.entry.perm)
      tlbScoreBoard(req.vpn) = pte
    }
  }

  def handleSfence(sf: LitSfenceBundle): Unit = {
    tlbScoreBoard.clear()
    for (i <- 0 until tlbWidth) {
      tlbReq(i) = None
    }
  }
}