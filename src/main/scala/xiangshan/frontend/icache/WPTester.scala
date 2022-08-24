import chisel3._
import chisel3.util._
import xiangshan.frontend.icache._

class WayPredictorTester(val update_algorithm:String = "uTag",val uTag_mode:String = "Hash",val utagBits:Int = 8) extends Module with WayPredictorParameters with uTagParameters{
  val io = IO(new Bundle{
    // ICache => WPTester => WayPredictor
    val pd_en = Input(Bool())
    val idx = Input(UInt(idxBits.W))
    val predict_way = Output(UInt(wayBits.W))

    val req_vtag = Input(UInt(vtagBits.W))
    val lookup_miss = Output(Bool())

    val update = Input(Bool())
    val update_idx = Input(UInt(idxBits.W))
    val correct_way = Input(UInt(wayBits.W))

    val update_way = Input(UInt(utagWayBits.W))
    val update_vtag = Input(UInt(vtagBits.W))

    // ICache => WPTester
    val predict_hit = Input(Bool())
    val match_miss = Input(Bool())
  })
  val total_cnt = RegInit(0.U(64.W))
  val hit_cnt = RegInit(0.U(64.W))
  val match_miss_cnt = RegInit(0.U(64.W))

  io.total_cnt := total_cnt
  io.hit_cnt_mul100 := hit_cnt * 100.U

  if(update_algorithm == "MRU"){
    val wp = Module(new MRUBasedWayPredictor)
    val predict_way = wp.io.predict_way

    val predict_hit = io.predict_hit
    val match_miss = io.match_miss

    //s0 predict
    when(io.pd_en){
        total_cnt := total_cnt + 1.U
    }
    wp.io.idx := io.idx
    wp.io.predict_enable := io.pd_en

    io.predict_way := predict_way
    io.lookup_miss := false.B

    val pd_en_reg = RegEnable(io.pd_en, io.s0_fire)
    //s1 update

    when(predict_hit && pd_en_reg){
        hit_cnt := hit_cnt + 1.U
    }.elsewhen(match_miss && pd_en_reg){
        match_miss_cnt := match_miss_cnt + 1.U
    }
    
    wp.io.update := io.update
    wp.io.update_idx := io.update_idx
    wp.io.correct_way := io.correct_way
  } else {
    val wp = Module(new uTagBasedWayPredictor(uTag_mode,utagBits))
    val predict_way = wp.io.predict_way

    val predict_hit = io.predict_hit
    val match_miss = io.match_miss

    //s0 predict
    when(io.pd_en){
        total_cnt := total_cnt + 1.U
    }
    wp.io.idx := io.idx
    wp.io.predict_enable := io.pd_en
    wp.io.req_vtag := io.req_vtag

    io.predict_way := predict_way
    io.lookup_miss := wp.io.lookup_miss

    //s1 update
    when(predict_hit){
        hit_cnt := hit_cnt + 1.U
    }.elsewhen(match_miss){
        match_miss_cnt := match_miss_cnt + 1.U
    }

    wp.io.update := io.update
    wp.io.correct_way := io.correct_way
    wp.io.update_way := io.update_way
    wp.io.update_vtag := io.update_vtag
  }
}