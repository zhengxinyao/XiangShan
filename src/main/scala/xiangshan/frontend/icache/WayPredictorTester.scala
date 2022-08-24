import chisel3._
import chisel3.util._
import xiangshan.frontend.icache._

class WayPredictorTester(val update_algorithm:String = "uTag",val uTag_mode:String = "Hash",val utagBits:Int = 8) extends Module with WayPredictorParameters with uTagParameters{
  val io = IO(new Bundle{
    val pd_en = Input(Bool())
    val idx = Input(UInt(idxBits.W))
    val req_ptag = Input(UInt(tagBits.W))
    val req_vtag = Input(UInt(vtagBits.W))
    val meta_ptags = Input(Vec(8,UInt(tagBits.W)))
    val predict_way = Output(UInt(wayBits.W))
    val predict_hit = Output(Bool())
    val match_miss = Output(Bool())
    val total_cnt = Output(UInt(64.W))
    val hit_cnt_mul100 = Output(UInt(64.W))

    val true_way = Output(UInt(wayBits.W))

    val update = Input(Bool())
    val update_idx = Input(UInt(idxBits.W))
    
    val update_way = Input(UInt(utagWayBits.W))
    val update_vtag = Input(UInt(vtagBits.W))
  })
  val total_cnt = RegInit(0.U(64.W))
  val hit_cnt = RegInit(0.U(64.W))
  io.total_cnt := total_cnt
  io.hit_cnt_mul100 := hit_cnt * 100.U

  if(update_algorithm == "MRU"){
    val wp = Module(new MRUBasedWayPredictor)
    val predict_way = wp.io.predict_way

    val true_way = MuxLookup(io.req_ptag,8.U,
      io.meta_ptags.zipWithIndex.map{case(x,i) => (x,i.U)}
    )
    io.true_way := true_way

    val match_miss = true_way === 8.U
    val predict_hit = true_way === predict_way

    when(io.pd_en){
      total_cnt := total_cnt + 1.U
    }
    when(predict_hit && io.pd_en){
      hit_cnt := hit_cnt + 1.U
    }
    io.predict_hit := predict_hit
    io.predict_way := predict_way
    io.match_miss := match_miss

    wp.io.idx := io.idx
    wp.io.predict_enable := io.pd_en
    
    wp.io.update := io.update
    wp.io.update_idx := io.update_idx
    wp.io.correct_way := true_way
  } else {
    val wp = Module(new uTagBasedWayPredictor(uTag_mode,utagBits))
    val predict_way = wp.io.predict_way

    val true_way = MuxLookup(io.req_ptag,8.U,
      io.meta_ptags.zipWithIndex.map{case(x,i) => (x,i.U)}
    )
    io.true_way := true_way
    val match_miss = true_way === 8.U
    val predict_hit = true_way === predict_way

    when(io.pd_en){
      total_cnt := total_cnt + 1.U
    }
    when(predict_hit && io.pd_en){
      hit_cnt := hit_cnt + 1.U
    }
    io.predict_hit := predict_hit
    io.predict_way := predict_way
    io.match_miss := match_miss

    wp.io.idx := io.idx
    wp.io.predict_enable := io.pd_en
    wp.io.req_vtag := io.req_vtag
    
    wp.io.update := io.update
    wp.io.update_idx := io.update_idx
    wp.io.update_way := io.update_way
    wp.io.correct_way := true_way
    wp.io.update_vtag := io.update_vtag
  }

}