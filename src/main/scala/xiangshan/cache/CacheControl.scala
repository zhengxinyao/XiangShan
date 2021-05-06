package xiangshan.cache

import chisel3._
import chisel3.util._
import xiangshan._
import xiangshan.frontend._
import utils._
import chipsalliance.rocketchip.config.Parameters


object CCOpMap{
    def apply(opcode: String, optype: String, name: String ): Map[String, String] = {
        Map(
            "opcode" -> opcode,
            "optype" -> optype,
            "name"   -> name,
        )
    }
}

object CCRegMap{ 
    def apply(offset: String, optype: String, width: String, name: String ): Map[String, String] = {
        Map(
            "offset" -> offset,
            "optype" -> optype,
            "width"  -> width,
            "name"   -> name,
        )
    }
}

object CCOperation{
    def CCOperationList = List(
        //     opcode   type     name
        CCOpMap("b00000", "CHECK", "META_CHECK_INJECTION"),
        CCOpMap("b00001", "CHECK", "DATA_CHECK_INJECTION"),
        CCOpMap("b00002", "LOAD",  "META_SPECIFIED_LOAD"),
        CCOpMap("b00003", "LOAD",  "DATA_SPECIFIED_LOAD"),
        CCOpMap("b00005", "FLUSH", "SPECIFIED_FLUSH"),
        CCOpMap("b00004", "WAY",   "WAY_MASK"),
    )

    def CCRegisterInfoList = List(
        //      offset   type      width    name
        CCRegMap("0",    "CHECK",  "64",    "MetaCheckErrorAddr"),
        CCRegMap("1",    "CHECK",   "64",   "DataCheckErrorAddr"),
        CCRegMap("2",    "LOAD",   "64",    "MetaLoad"),
        CCRegMap("3",    "LOAD",   "64",    "DataLoad0"),
        CCRegMap("4",    "LOAD",   "64",    "DataLoad1"),
        CCRegMap("5",    "LOAD",   "64",    "DataLoad2"),
        CCRegMap("6",    "LOAD",   "64",    "DataLoad3"),
        CCRegMap("7",    "LOAD",   "64",    "DataLoad4"),
        CCRegMap("8",    "LOAD",   "64",    "DataLoad5"),
        CCRegMap("9",    "LOAD",   "64",    "DataLoad6"),
        CCRegMap("10",   "LOAD",   "64",    "DataLoad7"),
        CCRegMap("11",   "FLUSH",  "64",    "FlushTarget"),
        CCRegMap("12",   "WAY",    "64",    "WayMask"),
        CCRegMap("13",   "CHECK",  "64",    "MetaCheckErrorCounter"),
        CCRegMap("14",   "CHECK",  "64",    "DataCheckErrorCounter"),
    )

    val opList = CCOperationList
    val regInfoList = CCRegisterInfoList

    def getOpCode(operation: String): UInt = {
        var opcode :UInt = 0.U
        opList.map{ entry =>
            if(entry("name") == operation){
               opcode = entry("opcode").U
            }
        }
        opcode
    }

    def getOpType(operation: String): String = {
        var optype :String = "CHECK"
        opList.map{ entry =>
            if(entry("name") == operation){
                entry("type")
            }
        }
        optype
    }

    def getRegInfo(reg: String): (Int , Int ) = {
        var offset:Int = 0;
        var width :Int = 0;
        regInfoList.map{ entry =>
            if(entry("name") == reg){
                offset = entry("offset").toInt
                width  = entry("width").toInt
            }
        }
        (offset, width)
    }

    def generateRegMap: Map[String, UInt] = {
        var mapping:Map[String,UInt] = Map()
        regInfoList.map(entry => 
            mapping += (entry("name") -> RegInit(UInt(entry("width").toInt.W), 0.U))
        )
        mapping
    }
}

class CacheController(implicit p: Parameters) extends XSModule with HasICacheParameters
{
    val io = IO(new Bundle() {
        val fromCSR = Input(new CSRInfo)
        val toCSR   = DecoupledIO(new CSRWrite)
        val CacheControlOp   = DecoupledIO(new CacheControlOp)
        val CacheControlResp = Flipped(DecoupledIO(new CacheControlResp))
    })

    /* way mask register
     *        Bits                                                              Field
     *        >log(nWays) + log(nSets)+ nWays + 7                             Reserved
     *        log(nWays) + log(nSets)+ nWays + 6 - log(nSets)+7  + nWays    Specified way
     *        log(nSets)+ nWays + 6 - 7 + nWays                              Specified set
     *        nWays + 6 -  7                                                    waymask
     *        6 - 1                                                            operation
     *        0                                                            cache control valid
    */
    val wayMaskReg      = io.fromCSR.wayMask
    val flushTargetReg  = io.fromCSR.flushTarget
    val (flush_way, flush_set ,waymask ,ccop, ccvalid) = (
        flushTargetReg(log2Ceil(nWays) + log2Ceil(nSets) - 1, log2Ceil(nSets)),
        flushTargetReg(log2Ceil(nSets) -1 ,0),
        wayMaskReg(nWays + 6 ,7 ),
        wayMaskReg(6,1),
        wayMaskReg(0))

    io.CacheControlOp.valid          := ccvalid
    io.CacheControlOp.bits.operation := ccop
    io.CacheControlOp.bits.waymask   := waymask
    io.CacheControlOp.bits.flush_way := flush_way
    io.CacheControlOp.bits.flush_set := flush_set

    val waiting = RegInit(false.B)
    when(ccvalid && !waiting) { waiting := true.B }
    .elsewhen(waiting && io.CacheControlResp.valid) { waiting := false.B }


    io.CacheControlResp.ready := false.B
    io.toCSR.valid           := io.CacheControlResp.valid && waiting
    io.toCSR.bits.resp_meta       := Cat(0.U, io.CacheControlResp.bits.resp_meta)
    for(i <- (0 until blockRows)) {io.toCSR.bits.resp_data(i) := Cat(0.U, io.CacheControlResp.bits.resp_data(i))}
    io.toCSR.bits.meta_error_addr := io.CacheControlResp.bits.meta_error_addr
    io.toCSR.bits.data_error_addr := io.CacheControlResp.bits.data_error_addr
    io.toCSR.bits.meta_error_cnt  := io.CacheControlResp.bits.meta_error_cnt
    io.toCSR.bits.data_error_cnt  := io.CacheControlResp.bits.data_error_cnt


}