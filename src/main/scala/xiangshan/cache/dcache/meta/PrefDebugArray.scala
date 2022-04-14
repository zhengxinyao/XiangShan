package xiangshan.cache

import chipsalliance.rocketchip.config.Parameters
import chisel3._
import chisel3.util._
import utils.SRAMTemplate
import xiangshan.cache.CacheInstrucion._

class PrefDebugdata(implicit p: Parameters) extends DCacheBundle {
  //prefdebug(0)：prefetch
  //prefdebug(1)：used
  //val prefdebug = UInt(prefDebugBits.W)
  val prefetch = Bool()   //prefetch request issued
  val used = Bool()       //prefetch data used
  val dataValid = Bool()  //prefetch data arrived
}

class PrefDebugReadReq(implicit p: Parameters) extends DCacheBundle {
  val idx = UInt(idxBits.W)
  val way_en = UInt(nWays.W)
}

class PrefDebugWriteReq(implicit p: Parameters) extends PrefDebugReadReq {
  val data = new PrefDebugdata
}

class DuplicatedPrefDebugArray(readPorts: Int, writePorts: Int)(implicit p: Parameters) extends DCacheModule {
  val io = IO(new Bundle() {
    val read = Vec(readPorts, Flipped(DecoupledIO(new PrefDebugReadReq)))
    val resp = Output(Vec(readPorts, Vec(nWays, new PrefDebugdata)))
    val write = Vec(writePorts, Flipped(DecoupledIO(new PrefDebugWriteReq)))
  })

  val prefDebug_array = Reg(Vec(nSets, Vec(nWays, new PrefDebugdata)))
  when (reset.asBool()) {
    prefDebug_array := 0.U.asTypeOf(prefDebug_array.cloneType)
  }

  (io.read.zip(io.resp)).zipWithIndex.foreach {
    case ((read, resp), i) =>
      read.ready := true.B
      resp := RegEnable(prefDebug_array(read.bits.idx), read.valid)
  }

  io.write.foreach {
    case write =>
      write.ready := true.B
      write.bits.way_en.asBools.zipWithIndex.foreach {
        case (wen, i) =>
          when (write.valid && wen) {
            prefDebug_array(write.bits.idx)(i) := write.bits.data
          }
      }
  }

}
