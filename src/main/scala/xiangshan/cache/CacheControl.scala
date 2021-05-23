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
        CCOpMap("b00000", "CHECK", "META_ERROR_INJECTION"),
        CCOpMap("b00001", "CHECK", "DATA_ERROR_INJECTION"),
        CCOpMap("b00010", "LOAD",  "META_SPECIFIED_LOAD"),
        CCOpMap("b00011", "LOAD",  "DATA_SPECIFIED_LOAD"),
        CCOpMap("b00100", "WAY",   "WAY_MASK"),
        CCOpMap("b00101", "FLUSH", "SPECIFIED_FLUSH"),
        CCOpMap("b00110", "CHECK", "META_CHECK_ADDR"),
        CCOpMap("b00111", "CHECK", "DATA_CHECK_ADDR"),
        CCOpMap("b01000", "CHECK", "META_CHECK_CNT"),
        CCOpMap("b01001", "CHECK", "DATA_CHECK_CNT"),
        CCOpMap("b01010", "CHECK", "META_ERROR_CANCEL"),
        CCOpMap("b01011", "CHECK", "DATA_ERROR_CANCEL"),
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
    val typeMap = Map(
        "CHECK" -> 0.U,
        "LOAD"  -> 1.U,
        "WAY"   -> 2.U,
        "FLUSH" -> 3.U,
    )

    def getOpCode(operation: String): UInt = {
        var opcode :UInt = 0.U
        opList.map{ entry =>
            if(entry("name") == operation){
               opcode = entry("opcode").U
            }
        }
        opcode
    }

    def getOpType(operation: UInt): UInt = {
        val mapping = opList.map(p => p("opcode").U -> typeMap(p("optype")) )
        LookupTree(operation, mapping)
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


    def isMetaInject(cc_operation: UInt)            = cc_operation === "b00000".U
    def isDataInject(cc_operation: UInt)            = cc_operation === "b00001".U
    def isMetaLoad(cc_operation: UInt)              = cc_operation === "b00010".U
    def isDataLoad(cc_operation: UInt)              = cc_operation === "b00011".U
    def isWayMask(cc_operation: UInt)               = cc_operation === "b00100".U
    def isFlush(cc_operation: UInt)                 = cc_operation === "b00101".U
    def isMetaErrAddr(cc_operation: UInt)           = cc_operation === "b00110".U
    def isMetaErrCnt(cc_operation: UInt)            = cc_operation === "b01000".U
    def isDataErrCnt(cc_operation: UInt)            = cc_operation === "b01001".U
    def isMetaErrCancle(cc_operation: UInt)         = cc_operation === "b01010".U
    def isDataErrCancle(cc_operation: UInt)         = cc_operation === "b01011".U

}

trait CCConst {
    val maxWays = 16
    val maxSets = 256
    val maxTagBits = 32
    val blockRows = 8
    val wordBits = 64
}

class CacheController(implicit p: Parameters) extends XSModule with CCConst
{
    val io = IO(new Bundle() {
        val fromCSR = Input(new CSRInfo)
        val toCSR   = ValidIO(new CSRWrite)
        val CacheControlOp   = ValidIO(new CacheControlOp)
        val CacheControlResp = Flipped(ValidIO(new CacheControlResp))
    })

    /* way mask register
     *        Bits                                                              Field
     *        log(maxWays) + log(maxSets)+ maxWays + 7                              Reserved
     *
     *        log(maxWays) + log(maxSets)+ maxWays + 6 - log(maxSets)+7  + maxWays    Specified way
     *        log(maxSets)+ maxWays + 6 - 7 + maxWays                              Specified set
     *        maxWays + 6 -  7                                                    waymask
     *        6 - 1                                                            operation
     *        0                                                            cache control valid
    */
    val wayMaskReg      = io.fromCSR.wayMask
    val flushTargetReg  = io.fromCSR.flushTarget
    val (flush_way, flush_set ,waymask ,ccop, ccvalid) = (
        flushTargetReg(log2Ceil(maxWays) + log2Ceil(maxSets) - 1, log2Ceil(maxSets)),
        flushTargetReg(log2Ceil(maxSets) -1 ,0),
        wayMaskReg(maxWays + 6 ,7 ),
        wayMaskReg(6,1),
        wayMaskReg(0))

    io.CacheControlOp.valid          := ccvalid
    io.CacheControlOp.bits.operation := RegNext(ccop)
    io.CacheControlOp.bits.waymask   := RegNext(waymask)
    io.CacheControlOp.bits.flush_way := RegNext(flush_way)
    io.CacheControlOp.bits.flush_set := RegNext(flush_set)

    val waiting = RegInit(false.B)
    when(ccvalid && !waiting) { waiting := true.B }
    .elsewhen(waiting && io.CacheControlResp.valid) { waiting := false.B }


    io.toCSR.valid                := io.CacheControlResp.valid && waiting
    io.toCSR.bits.resp_meta       := Cat(0.U, io.CacheControlResp.bits.resp_meta)
    for(i <- (0 until blockRows)) {io.toCSR.bits.resp_data(i) := Cat(0.U, io.CacheControlResp.bits.resp_data(i))}
    io.toCSR.bits.meta_error_addr := io.CacheControlResp.bits.meta_error_addr
    io.toCSR.bits.meta_error_cnt  := io.CacheControlResp.bits.meta_error_cnt


}