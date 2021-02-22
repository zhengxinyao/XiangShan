package cache.L1DTest

import cache.TLCTest.{TLCCallerTrans, TLCTrans}
import xiangshan.cache.MemoryOpConstants

class LitDCacheWordReq(
                        val cmd: BigInt,
                        val addr: BigInt,
                        var data: BigInt = 0,
                        val mask: BigInt,
                        var id: BigInt = 0,
                      ) {
}

class LitDCacheWordResp(
                         val data: BigInt,
                         val miss: Boolean,
                         val replay: Boolean,
                         var id: BigInt = 0,
                       ) {

}

class LitDCacheLineReq(
                        val cmd: BigInt,
                        val addr: BigInt,
                        val data: BigInt,
                        val mask: BigInt,
                        var id: BigInt = 0
                      ) {
}

class LitDCacheLineResp(
                         val data: BigInt,
                         val paddr: BigInt,
                         val id: BigInt,
                       ) {

}

trait LitMemOp {
  val M_XRD: BigInt = MemoryOpConstants.M_XRD.litValue()
  val M_XWR: BigInt = MemoryOpConstants.M_XWR.litValue()
  val M_XA_SWAP: BigInt = MemoryOpConstants.M_XA_SWAP.litValue()
}

class DCacheLoadTrans extends TLCTrans with LitMemOp {
  var req: Option[LitDCacheWordReq] = None
  var resp: Option[LitDCacheWordResp] = None
  var lsqResp: Option[LitDCacheLineResp] = None

  def dumpReq(): Unit = {
    if (req.isDefined) {
      println(f"Req addr: ${req.get.addr} cmd: ${req.get.cmd} id: ${req.get.id} mask: ${req.get.mask}")
    }
  }

  def dumpResp(): Unit = {
    if (resp.isDefined) {
      println(f"Resp data: ${resp.get.data} miss: ${resp.get.miss} replay: ${resp.get.replay}")
    }
  }
}

class DCacheLoadCallerTrans extends DCacheLoadTrans with TLCCallerTrans {
  var reqIssued: Option[Boolean] = None
  var replayCnt = 0

  override def dumpInfo(): Unit = {
    println("===DCacheLoadCallerTrans begin===")
    println("reqIssued:" + reqIssued)
    dumpReq()
    dumpResp()
    println("replayCnt:" + replayCnt)
    println("===DCacheLoadCallerTrans end===")
  }

  def prepareLoad(addr: BigInt, mask: BigInt): Unit = {
    req = Some(
      new LitDCacheWordReq(
        cmd = M_XRD,
        addr = addr,
        mask = mask,
      )
    )
    reqIssued = Some(false)
  }

  def issueLoadReq(): LitDCacheWordReq = {
    reqIssued = Some(true)
    startTimer()
    req.get
  }

  def replayLoad(): Unit = {
    reqIssued = Some(false)
    resetTimer()
    replayCnt += 1
    assert(replayCnt <= 50, f"load at ${req.get.addr}%x replay more than 50 times!\n")
  }

  def pairLoadResp(inResp: LitDCacheWordResp): Unit = {
    resp = Some(inResp)
    resetTimer()
    if (inResp.miss && !inResp.replay) { //if it will be placed into lsq
      startTimer()
    }
  }

  def pairLsqResp(inResp: LitDCacheLineResp): Unit = {
    lsqResp = Some(inResp)
    resetTimer()
  }
}

class DCacheStoreTrans extends TLCTrans with LitMemOp {
  var req: Option[LitDCacheLineReq] = None
  var resp: Option[LitDCacheLineResp] = None

  def dumpReq(): Unit = {
    if (req.isDefined) {
      println(f"Req addr: ${req.get.addr} cmd: ${req.get.cmd} id: ${req.get.id} " +
        f"data: ${req.get.data} mask: ${req.get.mask}")
    }
  }

  def dumpResp(): Unit = {
    if (resp.isDefined) {
      println(f"Resp data: ${resp.get.data} id: ${resp.get.id} paddr: ${resp.get.paddr}")
    }
  }
}

class DCacheStoreCallerTrans extends DCacheStoreTrans with TLCCallerTrans {
  var reqIssued: Option[Boolean] = None

  override def dumpInfo(): Unit = {
    println("===DCacheStoreCallerTrans begin===")
    println("reqIssued:" + reqIssued)
    dumpReq()
    dumpResp()
    println("===DCacheStoreCallerTrans end===")
  }

  def prepareStore(addr: BigInt, data: BigInt, mask: BigInt): Unit = {
    req = Some(
      new LitDCacheLineReq(
        cmd = M_XWR,
        addr = addr,
        data = data,
        mask = mask,
      )
    )
    reqIssued = Some(false)
  }

  def issueStoreReq(allocId: BigInt): LitDCacheLineReq = {
    req.get.id = allocId
    reqIssued = Some(true)
    startTimer()
    req.get
  }

  def pairStoreResp(inResp: LitDCacheLineResp): Unit = {
    resp = Some(inResp)
    resetTimer()
  }

}

class DCacheAMOTrans extends TLCTrans with LitMemOp {
  var req: Option[LitDCacheWordReq] = None
  var resp: Option[LitDCacheWordResp] = None

  def dumpReq(): Unit = {
    if (req.isDefined) {
      println(f"Req addr: ${req.get.addr} cmd: ${req.get.cmd} id: ${req.get.id} " +
        f"data: ${req.get.data} mask: ${req.get.mask}")
    }
  }

  def dumpResp(): Unit = {
    if (resp.isDefined) {
      println(f"Resp data: ${resp.get.data} id: ${resp.get.id}")
    }
  }
}

class DCacheAMOCallerTrans extends DCacheAMOTrans with TLCCallerTrans {
  var reqIssued: Option[Boolean] = None

  override def dumpInfo(): Unit = {
    println("===DCacheAMOCallerTrans begin===")
    println("reqIssued:" + reqIssued)
    dumpReq()
    dumpResp()
    println("===DCacheAMOCallerTrans end===")
  }

  def prepareAMOSwap(addr: BigInt, data: BigInt, mask: BigInt): Unit = {
    req = Some(
      new LitDCacheWordReq(
        cmd = M_XA_SWAP,
        addr = addr,
        data = data,
        mask = mask,
      )
    )
    reqIssued = Some(false)
  }

  def issueReq(allodId: BigInt): LitDCacheWordReq = {
    req.get.id = allodId
    reqIssued = Some(true)
    startTimer()
    req.get
  }

  def pairResp(inResp: LitDCacheWordResp): Unit = {
    resp = Some(inResp)
    resetTimer()
  }
}

