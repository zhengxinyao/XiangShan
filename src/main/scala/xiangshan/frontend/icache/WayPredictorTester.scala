package xiangshan.frontend.icache

import chisel3._
import chisel3.util._
import xiangshan._
import chipsalliance.rocketchip.config.Parameters

abstract class WPTesterModule(implicit p: Parameters) extends XSModule with HasWayPredictorParameters

class WayPredictorTester(val update_algorithm:String = "uTag",val uTag_mode:String = "Hash",val utagBits:Int = 8)(implicit p: Parameters) extends WPTesterModule{
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
    val predict_miss = Input(Bool())
    val match_miss = Input(Bool())

    //WPTester => ICache
    val total_cnt = Output(UInt(32.W))
    val hit_cnt = Output(UInt(32.W))
    val match_miss_cnt = Output(UInt(32.W))
    val hit_rate_front = Output(UInt(8.W))
    val hit_rate_back = Output(UInt(10.W))
    val hit_miss_cnt = Output(UInt(32.W))
  })
  val total_cnt = RegInit(0.U(32.W))
  val hit_cnt = RegInit(0.U(32.W))
  val predict_miss_cnt = RegInit(0.U(32.W))

  val match_miss_cnt = RegInit(0.U(32.W))
  val hit_rate_e5 =  hit_cnt * 100000.U / total_cnt
  val hit_rate_front = Wire(UInt(8.W))
  hit_rate_front := hit_rate_e5 / 1000.U
  val hit_rate_back  = hit_rate_e5 % 1000.U
  val hit_miss_cnt = total_cnt - hit_cnt

  io.total_cnt := total_cnt
  io.hit_cnt := hit_cnt
  io.match_miss_cnt := match_miss_cnt
  io.hit_rate_front := hit_rate_front
  io.hit_rate_back := hit_rate_back
  io.hit_miss_cnt := hit_miss_cnt

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

    //s1 update
    when(predict_hit){
        hit_cnt := hit_cnt + 1.U
    }.elsewhen(match_miss){
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
    when(io.predict_miss){
      predict_miss_cnt := predict_miss_cnt +1.U
    } 

    wp.io.update := io.update
    wp.io.update_idx := io.update_idx
    wp.io.correct_way := io.correct_way
    wp.io.update_way := io.update_way
    wp.io.update_vtag := io.update_vtag
  }
}