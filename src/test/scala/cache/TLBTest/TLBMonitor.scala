package cache.TLBTest

import cache.TestAgentBase
import xiangshan.cache.TlbPermBundle

import scala.collection.mutable
import scala.collection.mutable.ArrayBuffer

trait LitRVMode {
  val mmode = BigInt(2)
  val smode = BigInt(1)
  val umode = BigInt(0)
}

trait pageParam extends LitTlbCmd with LitRVMode {
  val ptePermOffset = 0
  val ptePermMask = BigInt(0xff)
  val pteRswOffset = 8
  val pteRswMask = BigInt(0x3)
  val vpnMask = 0x1ff
  val vpnBits = 9

  def extractBits(in: BigInt, mask: BigInt, offset: Int): BigInt = {
    (in >> offset) & mask
  }

  def cmdFaultTypeCheck(req: LitTlbReq, faultBundle: LitFaultBundle): Unit = {
    val cmd = req.cmd
    if (faultBundle.instr) {
      assert(isTlbExec(cmd), f"wrong instr fault type at vaddr:${req.addr}%x, cmd:${req.cmd}, pc:${req.pc}%x\n")
    }
    else if (faultBundle.st) {
      assert(isTlbWrite(cmd), f"wrong store fault type at vaddr:${req.addr}%x, cmd:${req.cmd}, pc:${req.pc}%x\n")
    }
    else if (faultBundle.ld) {
      assert(isTlbRead(cmd), f"wrong load fault type at vaddr:${req.addr}%x, cmd:${req.cmd}, pc:${req.pc}%x\n")
    }
  }

  def passTlbPermCheck(req: LitTlbReq, perms: LitPtePermBundle, csr: LitTlbCsrBundle, mode: BigInt): Boolean = {
    assert(perms.r || perms.w || perms.x, "call perm check of a non-leaf pte perm bundle")
    val cmd = req.cmd
    //TODO: AD is set by software and TLB will omit check of AD bit. Need add AD check in future work
    val umodeCheck = if (mode == umode) {
      perms.u
    } else {
      csr.privSum && !isTlbExec(cmd)
    }

    val execCheck = (!isTlbExec(cmd)) || perms.x
    val loadCheck = (!isTlbRead(cmd)) || perms.r || (csr.privMxr && perms.x)
    val storeCheck = (!isTlbWrite(cmd)) || perms.w

    umodeCheck && execCheck && loadCheck && storeCheck
  }
}

//only support for sv39 and sv48
trait sv39Param extends pageParam {
  val ptePpnOffset = 10
  val ptePpnFullMask = BigInt(0xfffffffffffL)
  val ppnLevelMask: Array[BigInt] = Array(0x3ffff, 0x1ff, 0x0)
  val pgOffset: Array[Int] = Array(30, 21, 12)
  val pgOffsetMask: Array[BigInt] = Array(BigInt(0x3fffffff), BigInt(0x1fffff), BigInt(0xfff))
  val maxLevel = 2

  def getVpn(vpn: BigInt, idx: Int): BigInt = {
    extractBits(vpn, vpnMask, vpnBits * idx)
  }

  def getPageTag(inAddr: BigInt, level: Int): BigInt = {
    (inAddr >> pgOffset(level)) << (pgOffset(level) - 12)
  }

  def getPageOffset(inAddr: BigInt, level: Int): BigInt = {
    inAddr & pgOffsetMask(level)
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

trait usesvParam extends sv39Param

class PTEData extends usesvParam {
  var pteAddr: BigInt = 0
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


trait PageLevelWalker extends usesvParam {
  def findVPLevel(vaddr: BigInt, ptsb: mutable.Map[BigInt, PTEData], level: Int = 2): Option[Int] = {
    if (level < 0) {
      None
    }
    else {
      val tag = getPageTag(vaddr, level)
      if (ptsb.contains(tag)) {
        Some(ptsb(tag).level.toInt)
      }
      else {
        findVPLevel(vaddr, ptsb, level - 1)
      }
    }
  }
}

class TLBMonitor(isDtlb: Boolean, tlbWidth: Int, ID: Int = 0, name: String = "TLBMonitor", start_clock: Int = 0)
  extends TestAgentBase(ID, name, start_clock) with
    usesvParam with PageLevelWalker {

  val tlbMonitorIf = new TLBInterfaceBase(tlbWidth)

  val tlbScoreBoard: mutable.Map[BigInt, PTEData] = mutable.Map[BigInt, PTEData]()
  val tlbReq: ArrayBuffer[Option[LitTlbReq]] = ArrayBuffer.fill(tlbWidth)(None)
  val tlbNextReq: ArrayBuffer[Option[LitTlbReq]] = ArrayBuffer.fill(tlbWidth)(None)
  var ptwQueryingVPN: mutable.Map[BigInt, LitPtwReq] = mutable.Map[BigInt, LitPtwReq]()

  override def transStep(): Unit = {
    //assume there is no time out in TLB
  }

  override def step(): Unit = {
    if (isDtlb) {
      for (i <- 0 until tlbWidth) {
        tlbNextReq(i) = tlbReq(i)
      }
    }
    super.step()
  }

  def snoop(bus: TLBInterfaceBase): Unit = {
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
      else {
        tlbReq(i) = None
      }
      if (bus.tlbResp(i).isDefined) {
        handleTlbResp(bus.tlbResp(i).get, i, bus.csr)
      }
    }
    //handle sfence at last to override results above
    if (bus.sfence.isDefined) {
      handleSfence(bus.sfence.get)
    }
  }

  def handleTlbReq(req: LitTlbReq, idx: Int): Unit = {
    tlbReq(idx) = Some(req)
  }

  def handleTlbResp(resp: LitTlbResp, idx: Int, csr: LitTlbCsrBundle): Unit = {
    val req = if (isDtlb) tlbNextReq(idx).get else tlbReq(idx).get
    val vaddr = req.addr
    val cmd = req.cmd
    val effectMode = if (isTlbExec(cmd)) csr.privImode else csr.privDmode
    if (resp.miss) {
      Unit
    }
    else if (csr.satpMode == 0 || effectMode == mmode) { //no translation
      val vaddr = req.addr
      //TODO:add access fault check(PMA PMP)
      assert(vaddr == resp.paddr, "addr change when satp in bare mode!\n")
    }
    else {
      val lvOption = findVPLevel(vaddr, tlbScoreBoard)
      if (lvOption.isDefined) {
        val lv = lvOption.get
        val paddr = resp.paddr
        val vpn = getPageTag(vaddr, lv)
        val pte = tlbScoreBoard(vpn)
        if (passTlbPermCheck(req, pte.perm, csr, effectMode)) {
          assert(!resp.pf.isFault(), f"addr:${req.addr}%x should not fault!\n")
          //TODO:add access fault check(PMA PMP)
          assert(getPageOffset(vaddr, lv) == getPageOffset(paddr, lv),
            f"wrong offset between vaddr:$vaddr%x & paddr:$paddr%x\n")
          assert(pte.ppn == getPageTag(paddr, lv),
            f"wrong translated ppn of vaddr: $vaddr%x, paddr: $paddr%x, ppn in SB is: ${pte.ppn}%x\n")

        }
        else {
          assert(resp.pf.isFault(), f"addr:${req.addr}%x should fault!\n")
          cmdFaultTypeCheck(req, resp.pf)
        }
      }
      else {
        assert(resp.pf.isFault(), f"addr:${req.addr}%x should fault!\n")
        cmdFaultTypeCheck(req, resp.pf)
      }
    }
  }

  //TODO: PTW now doesn't support outstanding
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
    if (isDtlb) {
      assert(tlbReq.forall(_.isEmpty) && tlbNextReq.forall(_.isEmpty),
        "some req in dtlb when sfence")
    }
  }
}