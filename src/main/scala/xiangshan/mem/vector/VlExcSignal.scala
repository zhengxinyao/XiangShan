package xiangshan.mem

import chipsalliance.rocketchip.config.Parameters
import chisel3._
import chisel3.util._
import utils._
import utility._
import xiangshan._

class vlExcSignalBundle(implicit p: Parameters) extends XSBundle{
  val vecloadRegIn = Vec(2,Decoupled(new VecOperand()))
  val vecwriteback = Vec(2,Flipped(Decoupled(new ExuOutput)))
  val vecData = Vec(2,Flipped(Valid(UInt(VLEN.W))))
  val vecFeedback = Vec(2,Input(Bool()))
}


class VlExcSignal(implicit p: Parameters) extends XSModule{
  val io = IO(new vlExcSignalBundle)

  dontTouch(io.vecData)
  val data_0 = io.vecData(0).bits
  val data_1 = io.vecData(1).bits
  val loadRegIn = Wire(Vec(2,new VecOperand()))
  val loadRegIn_valid = Wire(Vec(2,Bool()))

  val s_idle::s_1::s_2::s_3::s_4::s_5::s_6::s_7::s_8::s_9::Nil = Enum(10)
  val state_0 = RegInit(s_idle)
  val state_1 = RegInit(s_idle)

  val counter = RegInit(0.U(10.W))

  loadRegIn(0) := DontCare
  loadRegIn(1) := DontCare
  loadRegIn_valid(0) := DontCare
  loadRegIn_valid(1) := DontCare

  counter := counter + 1.U

  //unit-stride
  // 1   1 =
  val robIdx_0 = 16.U
  val baseaddr_0 = 0x80000000L.U + 0x1005.U
  val lqIdx_0 = 0.U
  val stride_0 = LFSR64(seed = Some(3L))(XLEN-1,0)
  val index_0 = Cat(LFSR64(seed = Some(999L)),LFSR64(seed = Some(888L)))(VLEN-1,0)
  val robIdx_1 = 16.U
  val baseaddr_1 = 0x80000000L.U + 0x1005.U
  val lqIdx_1 = 0.U
  val stride_1 = LFSR64(seed = Some(3L))(XLEN-1,0)
  val index_1 = Cat(LFSR64(seed = Some(999L)),LFSR64(seed = Some(888L)))(VLEN-1,0)
  // 1   1 !=
  val robIdx_2 = 16.U
  val baseaddr_2 = 0x80000000L.U + 0x1005.U
  val lqIdx_2 = 0.U
  val stride_2 = LFSR64(seed = Some(3L))(XLEN-1,0)
  val index_2 = Cat(LFSR64(seed = Some(999L)),LFSR64(seed = Some(888L)))(VLEN-1,0)
  val robIdx_3 = 16.U
  val baseaddr_3 = 0x80000000L.U + 0x1005.U
  val lqIdx_3 = 0.U
  val stride_3 = LFSR64(seed = Some(3L))(XLEN-1,0)
  val index_3 = Cat(LFSR64(seed = Some(999L)),LFSR64(seed = Some(888L)))(VLEN-1,0)
  // 1   0
  val robIdx_4 = 16.U
  val baseaddr_4 = 0x80000000L.U + 0x1005.U
  val lqIdx_4 = 0.U
  val stride_4 = LFSR64(seed = Some(3L))(XLEN-1,0)
  val index_4 = Cat(LFSR64(seed = Some(999L)),LFSR64(seed = Some(888L)))(VLEN-1,0)
  val robIdx_5 = 16.U
  val baseaddr_5 = 0x80000000L.U + 0x1005.U
  val lqIdx_5 = 0.U
  val stride_5 = LFSR64(seed = Some(3L))(XLEN-1,0)
  val index_5 = Cat(LFSR64(seed = Some(999L)),LFSR64(seed = Some(888L)))(VLEN-1,0)
  // 0   1
  val robIdx_6 = 16.U
  val baseaddr_6 = 0x80000000L.U + 0x1005.U
  val lqIdx_6 = 0.U
  val stride_6 = LFSR64(seed = Some(3L))(XLEN-1,0)
  val index_6 = Cat(LFSR64(seed = Some(999L)),LFSR64(seed = Some(888L)))(VLEN-1,0)
  val robIdx_7 = 16.U
  val baseaddr_7 = 0x80000000L.U + 0x1005.U
  val lqIdx_7 = 0.U
  val stride_7 = LFSR64(seed = Some(3L))(XLEN-1,0)
  val index_7 = Cat(LFSR64(seed = Some(999L)),LFSR64(seed = Some(888L)))(VLEN-1,0)

  //stride
  // 1   1 =
  val robIdx_8 = 16.U
  val baseaddr_8 = 0x80000000L.U + 0x1005.U
  val lqIdx_8 = 0.U
  val stride_8 = LFSR64(seed = Some(3L))(XLEN-1,0)
  val index_8 = Cat(LFSR64(seed = Some(999L)),LFSR64(seed = Some(888L)))(VLEN-1,0)
  val robIdx_9 = 16.U
  val baseaddr_9 = 0x80000000L.U + 0x1005.U
  val lqIdx_9 = 0.U
  val stride_9 = LFSR64(seed = Some(3L))(XLEN-1,0)
  val index_9 = Cat(LFSR64(seed = Some(999L)),LFSR64(seed = Some(888L)))(VLEN-1,0)
  // 1   1 !=
  val robIdx_10 = 16.U
  val baseaddr_10 = 0x80000000L.U + 0x1005.U
  val lqIdx_10 = 0.U
  val stride_10 = LFSR64(seed = Some(3L))(XLEN-1,0)
  val index_10 = Cat(LFSR64(seed = Some(999L)),LFSR64(seed = Some(888L)))(VLEN-1,0)
  val robIdx_11 = 16.U
  val baseaddr_11 = 0x80000000L.U + 0x1005.U
  val lqIdx_11 = 0.U
  val stride_11 = LFSR64(seed = Some(3L))(XLEN-1,0)
  val index_11 = Cat(LFSR64(seed = Some(999L)),LFSR64(seed = Some(888L)))(VLEN-1,0)
  // 1   0
  val robIdx_12 = 16.U
  val baseaddr_12 = 0x80000000L.U + 0x1005.U
  val lqIdx_12 = 0.U
  val stride_12 = LFSR64(seed = Some(3L))(XLEN-1,0)
  val index_12 = Cat(LFSR64(seed = Some(999L)),LFSR64(seed = Some(888L)))(VLEN-1,0)
  val robIdx_13 = 16.U
  val baseaddr_13 = 0x80000000L.U + 0x1005.U
  val lqIdx_13 = 0.U
  val stride_13 = LFSR64(seed = Some(3L))(XLEN-1,0)
  val index_13 = Cat(LFSR64(seed = Some(999L)),LFSR64(seed = Some(888L)))(VLEN-1,0)
  // index
  // 1   1 =
  val robIdx_14 = 16.U
  val baseaddr_14 = 0x80000000L.U + 0x1005.U
  val lqIdx_14 = 0.U
  val stride_14 = LFSR64(seed = Some(3L))(XLEN-1,0)
  val index_14 = Cat(LFSR64(seed = Some(999L)),LFSR64(seed = Some(888L)))(VLEN-1,0)
  val robIdx_15 = 16.U
  val baseaddr_15 = 0x80000000L.U + 0x1005.U
  val lqIdx_15 = 0.U
  val stride_15 = LFSR64(seed = Some(3L))(XLEN-1,0)
  val index_15 = Cat(LFSR64(seed = Some(999L)),LFSR64(seed = Some(888L)))(VLEN-1,0)
  // 1   1 !=
  val robIdx_16 = 16.U
  val baseaddr_16 = 0x80000000L.U + 0x1005.U
  val lqIdx_16 = 0.U
  val stride_16 = LFSR64(seed = Some(3L))(XLEN-1,0)
  val index_16 = Cat(LFSR64(seed = Some(999L)),LFSR64(seed = Some(888L)))(VLEN-1,0)
  val robIdx_17 = 16.U
  val baseaddr_17 = 0x80000000L.U + 0x1005.U
  val lqIdx_17 = 0.U
  val stride_17 = LFSR64(seed = Some(3L))(XLEN-1,0)
  val index_17 = Cat(LFSR64(seed = Some(999L)),LFSR64(seed = Some(888L)))(VLEN-1,0)
  // 1   0 !=
  val robIdx_18 = 16.U
  val baseaddr_18 = 0x80000000L.U + 0x1005.U
  val lqIdx_18 = 0.U
  val stride_18 = LFSR64(seed = Some(3L))(XLEN-1,0)
  val index_18 = Cat(LFSR64(seed = Some(999L)),LFSR64(seed = Some(888L)))(VLEN-1,0)
  val robIdx_19 = 16.U
  val baseaddr_19 = 0x80000000L.U + 0x1005.U
  val lqIdx_19 = 0.U
  val stride_19 = LFSR64(seed = Some(3L))(XLEN-1,0)
  val index_19 = Cat(LFSR64(seed = Some(999L)),LFSR64(seed = Some(888L)))(VLEN-1,0)

  switch (state_0) {
    is (s_idle) {
      when (counter === 100.U) {
        loadRegIn_valid(0)     := true.B
      }.otherwise {
        loadRegIn_valid(0)     := false.B
      }
      //loadRegIn(0).vmask     := LFSR64(seed = Some(23L))(63,0)
      loadRegIn(0).baseaddr  := baseaddr_0
      loadRegIn(0).stride    := stride_0
      loadRegIn(0).index     := index_0
      loadRegIn(0).pvd       := LFSR64(seed = Some(110L))(4,0)
      loadRegIn(0).lmul      := "b010".U
      loadRegIn(0).sew       := "b000".U
      //loadRegIn(0).vma       := LFSR64(seed = Some(52L))(5,0) === 0.U
      //loadRegIn(0).vta       := LFSR64(seed = Some(47L))(4,0) === 0.U
      loadRegIn(0).inner_idx := 0.U
      loadRegIn(0).vl        := (16 * 4).U
      loadRegIn(0).total_num := 4.U
      loadRegIn(0).uop.robIdx.value := robIdx_0
      loadRegIn(0).uop.lqIdx.value  := lqIdx_0
      loadRegIn(0).uop.cf.instr     := 0x00000000.U
      when (counter === 101.U) {
        state_0 := s_1
      }
    }
    is (s_1) {
      //loadRegIn(0).vmask     := LFSR64(seed = Some(23L))(63,0)
      loadRegIn(0).baseaddr  := baseaddr_2
      loadRegIn(0).stride    := stride_2
      loadRegIn(0).index     := index_2
      loadRegIn(0).pvd       := LFSR64(seed = Some(110L))(4,0)
      loadRegIn(0).lmul      := "b010".U
      loadRegIn(0).sew       := "b000".U
      //loadRegIn(0).vma       := LFSR64(seed = Some(52L))(5,0) === 0.U
      //loadRegIn(0).vta       := LFSR64(seed = Some(47L))(4,0) === 0.U
      loadRegIn(0).inner_idx := 0.U
      loadRegIn(0).vl        := (16 * 4).U
      loadRegIn(0).total_num := 4.U
      loadRegIn(0).uop.robIdx.value := robIdx_2
      loadRegIn(0).uop.lqIdx.value  := lqIdx_2
      loadRegIn(0).uop.cf.instr     := 0x00000000.U
      state_0 := s_2
    }
    is (s_2) {
      when (counter === 200.U) {
        loadRegIn_valid(0)     := true.B
      }.otherwise {
        loadRegIn_valid(0)     := false.B
      }
      //loadRegIn(0).vmask     := LFSR64(seed = Some(23L))(63,0)
      loadRegIn(0).baseaddr  := baseaddr_4
      loadRegIn(0).stride    := stride_4
      loadRegIn(0).index     := index_4
      loadRegIn(0).pvd       := LFSR64(seed = Some(110L))(4,0)
      loadRegIn(0).lmul      := "b010".U
      loadRegIn(0).sew       := "b000".U
      //loadRegIn(0).vma       := LFSR64(seed = Some(52L))(5,0) === 0.U
      //loadRegIn(0).vta       := LFSR64(seed = Some(47L))(4,0) === 0.U
      loadRegIn(0).inner_idx := 0.U
      loadRegIn(0).vl        := (16 * 4).U
      loadRegIn(0).total_num := 4.U
      loadRegIn(0).uop.robIdx.value := robIdx_4
      loadRegIn(0).uop.lqIdx.value  := lqIdx_4
      loadRegIn(0).uop.cf.instr     := 0x00000000.U
      when (counter === 201.U) {
        state_0 := s_3
      }
    }
    is (s_3) {
      //loadRegIn(0).vmask     := LFSR64(seed = Some(23L))(63,0)
      loadRegIn(0).baseaddr  := baseaddr_6
      loadRegIn(0).stride    := stride_6
      loadRegIn(0).index     := index_6
      loadRegIn(0).pvd       := LFSR64(seed = Some(110L))(4,0)
      loadRegIn(0).lmul      := "b010".U
      loadRegIn(0).sew       := "b000".U
      //loadRegIn(0).vma       := LFSR64(seed = Some(52L))(5,0) === 0.U
      //loadRegIn(0).vta       := LFSR64(seed = Some(47L))(4,0) === 0.U
      loadRegIn(0).inner_idx := 0.U
      loadRegIn(0).vl        := (16 * 4).U
      loadRegIn(0).total_num := 4.U
      loadRegIn(0).uop.robIdx.value := robIdx_6
      loadRegIn(0).uop.lqIdx.value  := lqIdx_6
      loadRegIn(0).uop.cf.instr     := 0x00000000.U
      state_0 := s_4
    }
    is (s_4) {
      when (counter === 300.U) {
        loadRegIn_valid(0)     := true.B
      }.otherwise {
        loadRegIn_valid(0)     := false.B
      }
      //loadRegIn(0).vmask     := LFSR64(seed = Some(23L))(63,0)
      loadRegIn(0).baseaddr  := baseaddr_8
      loadRegIn(0).stride    := stride_8
      loadRegIn(0).index     := index_8
      loadRegIn(0).pvd       := LFSR64(seed = Some(110L))(4,0)
      loadRegIn(0).lmul      := "b010".U
      loadRegIn(0).sew       := "b000".U
      //loadRegIn(0).vma       := LFSR64(seed = Some(52L))(5,0) === 0.U
      //loadRegIn(0).vta       := LFSR64(seed = Some(47L))(4,0) === 0.U
      loadRegIn(0).inner_idx := 0.U
      loadRegIn(0).vl        := (16 * 4).U
      loadRegIn(0).total_num := 4.U
      loadRegIn(0).uop.robIdx.value := robIdx_8
      loadRegIn(0).uop.lqIdx.value  := lqIdx_8
      loadRegIn(0).uop.cf.instr     := 0x00000000.U
      when (counter === 301.U) {
        state_0 := s_5
      }
    }
    is (s_5) {
      //loadRegIn(0).vmask     := LFSR64(seed = Some(23L))(63,0)
      loadRegIn(0).baseaddr  := baseaddr_10
      loadRegIn(0).stride    := stride_10
      loadRegIn(0).index     := index_10
      loadRegIn(0).pvd       := LFSR64(seed = Some(110L))(4,0)
      loadRegIn(0).lmul      := "b010".U
      loadRegIn(0).sew       := "b000".U
      //loadRegIn(0).vma       := LFSR64(seed = Some(52L))(5,0) === 0.U
      //loadRegIn(0).vta       := LFSR64(seed = Some(47L))(4,0) === 0.U
      loadRegIn(0).inner_idx := 0.U
      loadRegIn(0).vl        := (16 * 4).U
      loadRegIn(0).total_num := 4.U
      loadRegIn(0).uop.robIdx.value := robIdx_10
      loadRegIn(0).uop.lqIdx.value  := lqIdx_10
      loadRegIn(0).uop.cf.instr     := 0x00000000.U
      state_0 := s_6
    }
    is (s_6) {
      when (counter === 400.U) {
        loadRegIn_valid(0)     := true.B
      }.otherwise {
        loadRegIn_valid(0)     := false.B
      }
      //loadRegIn(0).vmask     := LFSR64(seed = Some(23L))(63,0)
      loadRegIn(0).baseaddr  := baseaddr_12
      loadRegIn(0).stride    := stride_12
      loadRegIn(0).index     := index_12
      loadRegIn(0).pvd       := LFSR64(seed = Some(110L))(4,0)
      loadRegIn(0).lmul      := "b010".U
      loadRegIn(0).sew       := "b000".U
      //loadRegIn(0).vma       := LFSR64(seed = Some(52L))(5,0) === 0.U
      //loadRegIn(0).vta       := LFSR64(seed = Some(47L))(4,0) === 0.U
      loadRegIn(0).inner_idx := 0.U
      loadRegIn(0).vl        := (16 * 4).U
      loadRegIn(0).total_num := 4.U
      loadRegIn(0).uop.robIdx.value := robIdx_12
      loadRegIn(0).uop.lqIdx.value  := lqIdx_12
      loadRegIn(0).uop.cf.instr     := 0x00000000.U
      when (counter === 401.U) {
        state_0 := s_7
      }
    }
    is (s_7) {
      //loadRegIn(0).vmask     := LFSR64(seed = Some(23L))(63,0)
      loadRegIn(0).baseaddr  := baseaddr_14
      loadRegIn(0).stride    := stride_14
      loadRegIn(0).index     := index_14
      loadRegIn(0).pvd       := LFSR64(seed = Some(110L))(4,0)
      loadRegIn(0).lmul      := "b010".U
      loadRegIn(0).sew       := "b000".U
      //loadRegIn(0).vma       := LFSR64(seed = Some(52L))(5,0) === 0.U
      //loadRegIn(0).vta       := LFSR64(seed = Some(47L))(4,0) === 0.U
      loadRegIn(0).inner_idx := 0.U
      loadRegIn(0).vl        := (16 * 4).U
      loadRegIn(0).total_num := 4.U
      loadRegIn(0).uop.robIdx.value := robIdx_14
      loadRegIn(0).uop.lqIdx.value  := lqIdx_14
      loadRegIn(0).uop.cf.instr     := 0x00000000.U
      state_0 := s_8
    }
    is (s_8) {
      when (counter === 500.U) {
        loadRegIn_valid(0)     := true.B
      }.otherwise {
        loadRegIn_valid(0)     := false.B
      }
      //loadRegIn(0).vmask     := LFSR64(seed = Some(23L))(63,0)
      loadRegIn(0).baseaddr  := baseaddr_16
      loadRegIn(0).stride    := stride_16
      loadRegIn(0).index     := index_16
      loadRegIn(0).pvd       := LFSR64(seed = Some(110L))(4,0)
      loadRegIn(0).lmul      := "b010".U
      loadRegIn(0).sew       := "b000".U
      //loadRegIn(0).vma       := LFSR64(seed = Some(52L))(5,0) === 0.U
      //loadRegIn(0).vta       := LFSR64(seed = Some(47L))(4,0) === 0.U
      loadRegIn(0).inner_idx := 0.U
      loadRegIn(0).vl        := (16 * 4).U
      loadRegIn(0).total_num := 4.U
      loadRegIn(0).uop.robIdx.value := robIdx_16
      loadRegIn(0).uop.lqIdx.value  := lqIdx_16
      loadRegIn(0).uop.cf.instr     := 0x00000000.U
      when (counter === 501.U) {
        state_0 := s_9
      }
    }
    is (s_9) {
      //loadRegIn(0).vmask     := LFSR64(seed = Some(23L))(63,0)
      loadRegIn(0).baseaddr  := baseaddr_18
      loadRegIn(0).stride    := stride_18
      loadRegIn(0).index     := index_18
      loadRegIn(0).pvd       := LFSR64(seed = Some(110L))(4,0)
      loadRegIn(0).lmul      := "b010".U
      loadRegIn(0).sew       := "b000".U
      //loadRegIn(0).vma       := LFSR64(seed = Some(52L))(5,0) === 0.U
      //loadRegIn(0).vta       := LFSR64(seed = Some(47L))(4,0) === 0.U
      loadRegIn(0).inner_idx := 0.U
      loadRegIn(0).vl        := (16 * 4).U
      loadRegIn(0).total_num := 4.U
      loadRegIn(0).uop.robIdx.value := robIdx_18
      loadRegIn(0).uop.lqIdx.value  := lqIdx_19
      loadRegIn(0).uop.cf.instr     := 0x00000000.U
      state_0 := s_idle
    }
  }



  switch (state_1) {
    is (s_idle) {
      when (counter === 100.U) {
        loadRegIn_valid(1)     := true.B
      }.otherwise {
        loadRegIn_valid(1)     := false.B
      }
      //loadRegIn(1).vmask     := LFSR64(seed = Some(23L))(63,0)
      loadRegIn(1).baseaddr  := baseaddr_1
      loadRegIn(1).stride    := stride_1
      loadRegIn(1).index     := index_1
      loadRegIn(1).pvd       := LFSR64(seed = Some(11L))(4,0)
      loadRegIn(1).lmul      := "b010".U
      loadRegIn(1).sew       := "b000".U
      //loadRegIn(1).vma       := LFSR64(seed = Some(52L))(5,0) === 0.U
      //loadRegIn(1).vta       := LFSR64(seed = Some(47L))(4,0) === 0.U
      loadRegIn(1).inner_idx := 0.U
      loadRegIn(1).vl        := (16 * 4).U
      loadRegIn(1).total_num := 4.U
      loadRegIn(1).uop.robIdx.value := robIdx_1
      loadRegIn(1).uop.lqIdx.value := lqIdx_1
      loadRegIn(1).uop.cf.instr     := 0x00000000.U
      when (counter === 101.U) {
        state_0 := s_1
      }
    }
    is (s_1) {
      //loadRegIn(1).vmask     := LFSR64(seed = Some(23L))(63,0)
      loadRegIn(1).baseaddr  := baseaddr_3
      loadRegIn(1).stride    := stride_3
      loadRegIn(1).index     := index_3
      loadRegIn(1).pvd       := LFSR64(seed = Some(11L))(4,0)
      loadRegIn(1).lmul      := "b010".U
      loadRegIn(1).sew       := "b000".U
      //loadRegIn(1).vma       := LFSR64(seed = Some(52L))(5,0) === 0.U
      //loadRegIn(1).vta       := LFSR64(seed = Some(47L))(4,0) === 0.U
      loadRegIn(1).inner_idx := 0.U
      loadRegIn(1).vl        := (16 * 4).U
      loadRegIn(1).total_num := 4.U
      loadRegIn(1).uop.robIdx.value := robIdx_3
      loadRegIn(1).uop.lqIdx.value := lqIdx_3
      loadRegIn(1).uop.cf.instr     := 0x00000000.U
      state_0 := s_2
    }
    is (s_2) {
      when (counter === 200.U) {
        loadRegIn_valid(1)     := true.B
      }.otherwise {
        loadRegIn_valid(1)     := false.B
      }
      //loadRegIn(1).vmask     := LFSR64(seed = Some(23L))(63,0)
      loadRegIn(1).baseaddr  := baseaddr_5
      loadRegIn(1).stride    := stride_5
      loadRegIn(1).index     := index_5
      loadRegIn(1).pvd       := LFSR64(seed = Some(11L))(4,0)
      loadRegIn(1).lmul      := "b010".U
      loadRegIn(1).sew       := "b000".U
      //loadRegIn(1).vma       := LFSR64(seed = Some(52L))(5,0) === 0.U
      //loadRegIn(1).vta       := LFSR64(seed = Some(47L))(4,0) === 0.U
      loadRegIn(1).inner_idx := 0.U
      loadRegIn(1).vl        := (16 * 4).U
      loadRegIn(1).total_num := 4.U
      loadRegIn(1).uop.robIdx.value := robIdx_5
      loadRegIn(1).uop.lqIdx.value := lqIdx_5
      loadRegIn(1).uop.cf.instr     := 0x00000000.U
      when (counter === 201.U) {
        state_0 := s_3
      }
    }
    is (s_3) {
      //loadRegIn(1).vmask     := LFSR64(seed = Some(23L))(63,0)
      loadRegIn(1).baseaddr  := baseaddr_7
      loadRegIn(1).stride    := stride_7
      loadRegIn(1).index     := index_7
      loadRegIn(1).pvd       := LFSR64(seed = Some(11L))(4,0)
      loadRegIn(1).lmul      := "b010".U
      loadRegIn(1).sew       := "b000".U
      //loadRegIn(1).vma       := LFSR64(seed = Some(52L))(5,0) === 0.U
      //loadRegIn(1).vta       := LFSR64(seed = Some(47L))(4,0) === 0.U
      loadRegIn(1).inner_idx := 0.U
      loadRegIn(1).vl        := (16 * 4).U
      loadRegIn(1).total_num := 4.U
      loadRegIn(1).uop.robIdx.value := robIdx_7
      loadRegIn(1).uop.lqIdx.value := lqIdx_7
      loadRegIn(1).uop.cf.instr     := 0x00000000.U
      state_0 := s_4
    }
    is (s_4) {
      when (counter === 300.U) {
        loadRegIn_valid(1)     := true.B
      }.otherwise {
        loadRegIn_valid(1)     := false.B
      }
      //loadRegIn(1).vmask     := LFSR64(seed = Some(23L))(63,0)
      loadRegIn(1).baseaddr  := baseaddr_9
      loadRegIn(1).stride    := stride_9
      loadRegIn(1).index     := index_9
      loadRegIn(1).pvd       := LFSR64(seed = Some(11L))(4,0)
      loadRegIn(1).lmul      := "b010".U
      loadRegIn(1).sew       := "b000".U
      //loadRegIn(1).vma       := LFSR64(seed = Some(52L))(5,0) === 0.U
      //loadRegIn(1).vta       := LFSR64(seed = Some(47L))(4,0) === 0.U
      loadRegIn(1).inner_idx := 0.U
      loadRegIn(1).vl        := (16 * 4).U
      loadRegIn(1).total_num := 4.U
      loadRegIn(1).uop.robIdx.value := robIdx_9
      loadRegIn(1).uop.lqIdx.value := lqIdx_9
      loadRegIn(1).uop.cf.instr     := 0x00000000.U
      when (counter === 301.U) {
        state_0 := s_5
      }
    }
    is (s_5) {
      //loadRegIn(1).vmask     := LFSR64(seed = Some(23L))(63,0)
      loadRegIn(1).baseaddr  := baseaddr_11
      loadRegIn(1).stride    := stride_11
      loadRegIn(1).index     := index_11
      loadRegIn(1).pvd       := LFSR64(seed = Some(11L))(4,0)
      loadRegIn(1).lmul      := "b010".U
      loadRegIn(1).sew       := "b000".U
      //loadRegIn(1).vma       := LFSR64(seed = Some(52L))(5,0) === 0.U
      //loadRegIn(1).vta       := LFSR64(seed = Some(47L))(4,0) === 0.U
      loadRegIn(1).inner_idx := 0.U
      loadRegIn(1).vl        := (16 * 4).U
      loadRegIn(1).total_num := 4.U
      loadRegIn(1).uop.robIdx.value := robIdx_11
      loadRegIn(1).uop.lqIdx.value := lqIdx_11
      loadRegIn(1).uop.cf.instr     := 0x00000000.U
      state_0 := s_6
    }
    is (s_6) {
      when (counter === 400.U) {
        loadRegIn_valid(1)     := true.B
      }.otherwise {
        loadRegIn_valid(1)     := false.B
      }
      //loadRegIn(1).vmask     := LFSR64(seed = Some(23L))(63,0)
      loadRegIn(1).baseaddr  := baseaddr_13
      loadRegIn(1).stride    := stride_13
      loadRegIn(1).index     := index_13
      loadRegIn(1).pvd       := LFSR64(seed = Some(11L))(4,0)
      loadRegIn(1).lmul      := "b010".U
      loadRegIn(1).sew       := "b000".U
      //loadRegIn(1).vma       := LFSR64(seed = Some(52L))(5,0) === 0.U
      //loadRegIn(1).vta       := LFSR64(seed = Some(47L))(4,0) === 0.U
      loadRegIn(1).inner_idx := 0.U
      loadRegIn(1).vl        := (16 * 4).U
      loadRegIn(1).total_num := 4.U
      loadRegIn(1).uop.robIdx.value := robIdx_13
      loadRegIn(1).uop.lqIdx.value := lqIdx_13
      loadRegIn(1).uop.cf.instr     := 0x00000000.U
      when (counter === 401.U) {
        state_0 := s_7
      }
    }
    is (s_7) {
      //loadRegIn(1).vmask     := LFSR64(seed = Some(23L))(63,0)
      loadRegIn(1).baseaddr  := baseaddr_15
      loadRegIn(1).stride    := stride_15
      loadRegIn(1).index     := index_15
      loadRegIn(1).pvd       := LFSR64(seed = Some(11L))(4,0)
      loadRegIn(1).lmul      := "b010".U
      loadRegIn(1).sew       := "b000".U
      //loadRegIn(1).vma       := LFSR64(seed = Some(52L))(5,0) === 0.U
      //loadRegIn(1).vta       := LFSR64(seed = Some(47L))(4,0) === 0.U
      loadRegIn(1).inner_idx := 0.U
      loadRegIn(1).vl        := (16 * 4).U
      loadRegIn(1).total_num := 4.U
      loadRegIn(1).uop.robIdx.value := robIdx_15
      loadRegIn(1).uop.lqIdx.value := lqIdx_15
      loadRegIn(1).uop.cf.instr     := 0x00000000.U
      state_0 := s_8
    }
    is (s_8) {
      when (counter === 500.U) {
        loadRegIn_valid(1)     := true.B
      }.otherwise {
        loadRegIn_valid(1)     := false.B
      }
      //loadRegIn(1).vmask     := LFSR64(seed = Some(23L))(63,0)
      loadRegIn(1).baseaddr  := baseaddr_17
      loadRegIn(1).stride    := stride_17
      loadRegIn(1).index     := index_17
      loadRegIn(1).pvd       := LFSR64(seed = Some(11L))(4,0)
      loadRegIn(1).lmul      := "b010".U
      loadRegIn(1).sew       := "b000".U
      //loadRegIn(1).vma       := LFSR64(seed = Some(52L))(5,0) === 0.U
      //loadRegIn(1).vta       := LFSR64(seed = Some(47L))(4,0) === 0.U
      loadRegIn(1).inner_idx := 0.U
      loadRegIn(1).vl        := (16 * 4).U
      loadRegIn(1).total_num := 4.U
      loadRegIn(1).uop.robIdx.value := robIdx_17
      loadRegIn(1).uop.lqIdx.value := lqIdx_17
      loadRegIn(1).uop.cf.instr     := 0x00000000.U
      when (counter === 501.U) {
        state_0 := s_9
      }
    }
    is (s_9) {
      //loadRegIn(1).vmask     := LFSR64(seed = Some(23L))(63,0)
      loadRegIn(1).baseaddr  := baseaddr_19
      loadRegIn(1).stride    := stride_19
      loadRegIn(1).index     := index_19
      loadRegIn(1).pvd       := LFSR64(seed = Some(11L))(4,0)
      loadRegIn(1).lmul      := "b010".U
      loadRegIn(1).sew       := "b000".U
      //loadRegIn(1).vma       := LFSR64(seed = Some(52L))(5,0) === 0.U
      //loadRegIn(1).vta       := LFSR64(seed = Some(47L))(4,0) === 0.U
      loadRegIn(1).inner_idx := 0.U
      loadRegIn(1).vl        := (16 * 4).U
      loadRegIn(1).total_num := 4.U
      loadRegIn(1).uop.robIdx.value := robIdx_19
      loadRegIn(1).uop.lqIdx.value := lqIdx_19
      loadRegIn(1).uop.cf.instr     := 0x00000000.U
      state_0 := s_idle
    }
  }

  for(i <- 0 until LoadPipelineWidth){
    io.vecloadRegIn(i).bits  := DontCare
    io.vecloadRegIn(i).valid := loadRegIn_valid(i)
    io.vecloadRegIn(i).bits  := loadRegIn(i)
  }

  io.vecwriteback.map(_.ready := true.B)
}