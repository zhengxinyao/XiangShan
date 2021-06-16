package cache.TLBTest

import cache.TLCTest.TLCTrans
import xiangshan.cache.TlbCmd

class LitPtePermBundle(
                        var d: Boolean = false,
                        var a: Boolean = false,
                        var g: Boolean = false,
                        var u: Boolean = false,
                        var x: Boolean = false,
                        var w: Boolean = false,
                        var r: Boolean = false,
                        var v: Boolean = true,
                      ) {
  def copyVals(in: LitPtePermBundle): Unit = {
    d = in.d
    a = in.a
    g = in.g
    u = in.u
    x = in.x
    w = in.w
    r = in.r
    v = in.v
  }

  def ziptoBigInt(): BigInt = {
    var res = BigInt(0)
    if (d) res |= (1 << 7)
    if (a) res |= (1 << 6)
    if (g) res |= (1 << 5)
    if (u) res |= (1 << 4)
    if (x) res |= (1 << 3)
    if (w) res |= (1 << 2)
    if (r) res |= (1 << 1)
    if (v) res |= (1 << 0)
    res
  }

  def unzipFromPerm(p: BigInt): Unit = {
    v = p.testBit(0)
    r = p.testBit(1)
    w = p.testBit(2)
    x = p.testBit(3)
    u = p.testBit(4)
    g = p.testBit(5)
    a = p.testBit(6)
    d = p.testBit(7)
  }
}

class LitFaultBundle(
                      var ld: Boolean = false,
                      var st: Boolean = false,
                      var instr: Boolean = false
                    ) {
  def isFault(): Boolean = {
    ld || st || instr
  }
}

class LitCircularQueuePtr(
                           var flag: Boolean = false,
                           var value: BigInt = 0,
                         )

class LitTlbReq(
                 var addr: BigInt,
                 var cmd: BigInt,
                 var roqIdx: LitCircularQueuePtr,
                 var pc: BigInt = 0,
               )

class LitTlbResp(
                  var paddr: BigInt,
                  var miss: Boolean,
                  var mmio: Boolean,
                  var pf: LitFaultBundle,
                  var af: LitFaultBundle,
                )

class LitPtwReq(
                 var vpn: BigInt
               )

class LitSfenceBundle(
                       var rs1: Boolean = false,
                       var rs2: Boolean = false,
                       var addr: BigInt = 0,
                     )

class LitTlbCsrBundle(
                       var satpMode: BigInt = 0,
                       var satpAsid: BigInt = 0,
                       var satpPpn: BigInt = 0,
                       var privMxr: Boolean = false,
                       var privSum: Boolean = false,
                       var privImode: BigInt = 0,
                       var privDmode: BigInt = 0,
                     )

trait LitRVMode {
  val mmode = BigInt(3)
  val smode = BigInt(1)
  val umode = BigInt(0)
}
trait TlbCsrConst extends LitRVMode {
}

/*
  level 0  /* vpnn2 */
  level 1  /* vpnn2 * vpnn1 */
  level 2  /* vpnn2 * vpnn1 * vpnn0*/
 */
class LitPtwEntry(
                   val vpn: BigInt,
                   val ppn: BigInt,
                   val perm: LitPtePermBundle,
                   val level: BigInt,
                 )

class LitPtwResp(
                  val entry: LitPtwEntry,
                  val pf: Boolean,
                )

trait LitTlbCmd {
  val tlbRead: BigInt = TlbCmd.read.litValue()
  val tlbWrite = TlbCmd.write.litValue()
  val tlbExec = TlbCmd.exec.litValue()

  val tlbAtomRead = TlbCmd.atom_read.litValue() // lr
  val tlbAtomWrite = TlbCmd.atom_write.litValue() // sc / amo

  def isTlbRead(cmd: BigInt) = cmd == tlbRead || cmd == tlbAtomRead

  def isTlbWrite(cmd: BigInt) = cmd == tlbWrite || cmd == tlbAtomWrite

  def isTlbExec(cmd: BigInt) = cmd == tlbExec

  def isTlbAtom(cmd: BigInt) = cmd == tlbAtomRead || cmd == tlbAtomRead
}

class TLBTransaction extends TLCTrans {
  var req: Option[LitTlbReq] = None
  var resp: Option[LitTlbResp] = None
}

class TLBCallerTransaction extends TLBTransaction {
  private var replayCnt = 0

  var reqIssued: Boolean = false

  def prepareReq(reqAddr: BigInt, cmd: BigInt, pc: BigInt): Unit = {
    val newReq = new LitTlbReq(
      addr = reqAddr,
      cmd = cmd,
      roqIdx = new LitCircularQueuePtr(),
      pc = pc,
    )
    req = Some(newReq)
  }

  def issueReq(): LitTlbReq = {
    reqIssued = true
    req.get
  }

  def replayReq(): Unit = {
    reqIssued = false
    replayCnt += 1
    assert(replayCnt <= 100, f"TLB req at ${req.get.addr}%x replay more than 100 times!\n")
  }

  def pairResp(tlbResp: LitTlbResp): Unit = {
    resp = Some(tlbResp)
  }
}

class PTWTransaction extends TLCTrans {
  var req: Option[LitPtwReq] = None
  var resp: Option[LitPtwResp] = None

}

class PTWCalleeTransaction extends PTWTransaction {
  var respIssued: Boolean = false

  def pairReq(ptwReq: LitPtwReq): Unit = {
    req = Some(ptwReq)
  }

  def issueResp(ppn: BigInt, perm: LitPtePermBundle, level: BigInt, pf: Boolean): LitPtwResp = {
    val pte = new LitPtwEntry(
      vpn = req.get.vpn,
      ppn = ppn,
      perm = perm,
      level = level,
    )
    resp = Some(new LitPtwResp(
      entry = pte,
      pf = pf
    ))
    respIssued = true
    resp.get
  }

}



