package xiangshan.frontend.icache

import chisel3._
import chisel3.util._
import xiangshan._
import xiangshan.cache._
import chipsalliance.rocketchip.config.Parameters

trait WayPredictorParameters extends L1CacheParameters with HasICacheParameters{
  def ptagBits = tagBits
  def vtagBits = VAddrBits - untagBits
  
  def update_algorithm_list = List("MRU","uTag")
}

trait uTagParameters extends L1CacheParameters {
  def utagWays:    Int = nWays
  def utagWayBits: Int = log2Up(utagWays)
}

trait HasWayPredictorParameters extends WayPredictorParameters with uTagParameters

abstract class WPModule(implicit p: Parameters) extends XSModule with HasWayPredictorParameters
abstract class WPBundle(implicit p: Parameters) extends XSBundle with HasWayPredictorParameters

class WayPredictorBus(implicit p: Parameters) extends WPBundle{
  val predict_enable = Input(Bool())
  val idx = Input(UInt(idxBits.W))
  val predict_way = Output(UInt(wayBits.W))

  val update = Input(Bool())
  val update_idx = Input(UInt(idxBits.W))
  val correct_way = Input(UInt(wayBits.W))
}
class uTagBasedWayPredictorBus(implicit p: Parameters) extends WayPredictorBus{
  val req_vtag = Input(UInt(vtagBits.W))
  val lookup_miss = Output(Bool())

  val update_way = Input(UInt(utagWayBits.W))
  val update_vtag = Input(UInt(vtagBits.W))
}

class MRUBasedWayPredictor(implicit p: Parameters) extends WPModule {
  val io = IO(new WayPredictorBus)
  val predict_regs = RegInit(VecInit(Seq.fill(nSets)(0.U(wayBits.W))))

  io.predict_way := predict_regs(io.idx)

  //Update algorithm : MRU
  when(io.update){
    predict_regs(io.update_idx) := io.correct_way
  }
}

class uTagBasedWayPredictor(val mode:String = "Hash",val utagBits:Int = 8)(implicit p: Parameters) extends WPModule {
  val io = IO(new uTagBasedWayPredictorBus)
  val uTag_regs = RegInit(VecInit(Seq.fill(nSets)(VecInit((0 until utagWays).map(x => x.U(utagBits.W)).toList))))
  val uTag_valid_regs = RegInit(VecInit(Seq.fill(nSets)(VecInit(Seq.fill(utagWays)(true.B)))))
  val idx = io.idx

  //predict the cache way
  val req_tag = Wire(UInt(utagBits.W))
  val req_vtag = io.req_vtag
  if(mode == "Hash"){
    req_tag := req_vtag(15,8) ^ req_vtag(7,0)
  }else{
    req_tag := req_vtag
  }
  
  val predict_way = MuxCase(nWays.U,
    uTag_regs(idx).zipWithIndex.map{case(x,i) => ((x === req_tag) && (uTag_valid_regs(idx)(i) =/= false.B),i.U)}
  )

  val lookup_miss = (predict_way === nWays.U)
  val lookup_miss_reg = RegEnable(lookup_miss,io.predict_enable)
  val predict_way_reg = RegEnable(predict_way,io.predict_enable)
  
  //update the predictor, algorithm : uTag
  val update_utag = Wire(UInt(utagBits.W))
  val vtag = io.update_vtag
  if(mode == "Hash"){
    update_utag := vtag(15,8) ^ vtag(7,0)
  }else{
    update_utag := vtag
  }

  when(io.update){
    uTag_valid_regs(io.update_idx)(io.update_way) := true.B
    uTag_regs(io.update_idx)(io.update_way) := update_utag
    when((lookup_miss_reg === false.B) && (predict_way_reg =/= io.update_way)){
      uTag_valid_regs(io.update_idx)(predict_way_reg) := false.B
    }
  }

  io.predict_way := Mux(lookup_miss,0.U,predict_way)
  io.lookup_miss := lookup_miss
}