//commit 8ed44a2794e2fd7e49a0b1d5882acaaaaa93b52d
//Author: 22041071-Ma Jian lu <majianlu_0521@163.com>
//Date:   Fri Mar 17 13:40:17 2023 +0800
//
//    Fix the bug after reverting
//diff --git a/src/main/scala/xiangshan/cache/dcache/data/BankedDataArray.scala b/src/main/scala/xiangshan/cache/dcache/data/BankedDataArray.scala
//index 7bdbc2000..2e63076a9 100644
//--- a/src/main/scala/xiangshan/cache/dcache/data/BankedDataArray.scala
//+++ b/src/main/scala/xiangshan/cache/dcache/data/BankedDataArray.scala
//@@ -46,7 +46,7 @@ class L1BankedDataReadReqWithMask(implicit p: Parameters) extends DCacheBundle
//   val way_en = Bits(DCacheWays.W)
//   val addr = Bits(PAddrBits.W)
//   val bankMask = Bits(DCacheBanks.W)
//-  val rlineflag = Bool()
//+  //val rlineflag = Bool()
// }
// 
// class L1BankedDataReadLineReq(implicit p: Parameters) extends L1BankedDataReadReq
//diff --git a/src/main/scala/xiangshan/mem/vector/VlExcSignal.scala b/src/main/scala/xiangshan/mem/vector/VlExcSignal.scala
//index 6ff6d4517..876942196 100644
//--- a/src/main/scala/xiangshan/mem/vector/VlExcSignal.scala
//+++ b/src/main/scala/xiangshan/mem/vector/VlExcSignal.scala
//@@ -20,29 +20,214 @@ class VlExcSignal(implicit p: Parameters) extends XSModule{
//   val loadRegIn = Wire(Vec(2,new VecOperand()))
//   val loadRegIn_valid = Wire(Vec(2,Bool()))
// 
//-  for(i <- 0 until LoadPipelineWidth){
//-    loadRegIn(i).uop       := DontCare
//-    loadRegIn_valid(i)     := LFSR64(seed=Some(123L))(3,0) === 0.U
//-    loadRegIn(i).vmask     := LFSR64(seed = Some(23L))(63,0)
//-    loadRegIn(i).baseaddr  := 0x80000000L.U + LFSR64(seed = Some(231L))(8,0)
//-    loadRegIn(i).stride    := LFSR64(seed = Some(3L))(XLEN-1,0)
//-    loadRegIn(i).index     := LFSR64(seed = Some(12L))(63,0)
//-    loadRegIn(i).pvd       := LFSR64(seed = Some(11L))(4,0)
//-    loadRegIn(i).lmul      := LFSR64(seed = Some(31L))(2,0)
//-    loadRegIn(i).sew       := LFSR64(seed = Some(41L))(1,0)
//-    loadRegIn(i).vma       := LFSR64(seed = Some(52L))(5,0) === 0.U
//-    loadRegIn(i).vta       := LFSR64(seed = Some(47L))(4,0) === 0.U
//-    loadRegIn(i).inner_idx := LFSR64(seed = Some(98L))(2,0)
//-    loadRegIn(i).vl        := LFSR64(seed = Some(100L))(7,0)
//-    loadRegIn(i).total_num := LFSR64(seed = Some(71L))(3,0)
//-    loadRegIn(i).uop.robIdx.value := LFSR64(seed = Some(78L))(7,0)
//-    loadRegIn(i).uop.cf.instr     := LFSR64(seed = Some(56L))(32,0)
//-    loadRegIn(i).uop.pdest        := LFSR64(seed = Some(99L))(PhyRegIdxWidth-1,0)
//+  //for(i <- 0 until LoadPipelineWidth){
//+  //  loadRegIn(i).uop       := DontCare
//+  //  loadRegIn_valid(i)     := LFSR64(seed=Some(123L))(3,0) === 0.U
//+  //  //loadRegIn(i).vmask     := LFSR64(seed = Some(23L))(63,0)
//+  //  loadRegIn(i).baseaddr  := 0x80000000L.U + LFSR64(seed = Some(231L))(8,0)
//+  //  //loadRegIn(i).stride    := LFSR64(seed = Some(3L))(XLEN-1,0)
//+  //  //loadRegIn(i).index     := LFSR64(seed = Some(12L))(63,0)
//+  //  //loadRegIn(i).pvd       := LFSR64(seed = Some(11L))(4,0)
//+  //  loadRegIn(i).lmul      := LFSR64(seed = Some(31L))(2,0)
//+  //  loadRegIn(i).sew       := LFSR64(seed = Some(41L))(1,0)
//+  //  //loadRegIn(i).vma       := LFSR64(seed = Some(52L))(5,0) === 0.U
//+  //  //loadRegIn(i).vta       := LFSR64(seed = Some(47L))(4,0) === 0.U
//+  //  loadRegIn(i).inner_idx := LFSR64(seed = Some(98L))(2,0)
//+  //  loadRegIn(i).vl        := LFSR64(seed = Some(100L))(7,0)
//+  //  loadRegIn(i).total_num := LFSR64(seed = Some(71L))(3,0)
//+  //  loadRegIn(i).uop.robIdx.value := LFSR64(seed = Some(78L))(7,0)
//+  //  loadRegIn(i).uop.cf.instr     := LFSR64(seed = Some(56L))(32,0)
//+  //  loadRegIn(i).uop.pdest        := LFSR64(seed = Some(99L))(PhyRegIdxWidth-1,0)
//+  //}
//+
//+  val s_idle::s1::s2::s3::Nil = Enum(4)
//+  val state_0 = RegInit(s_idle)
//+  val state_1 = RegInit(s_idle)
//+  val baseaddr_0 = 0x80000000L.U + 0x1000.U
//+  val baseaddr_1 = 0x80000000L.U + 0x1100.U
//+  val robIdx_0 = 16.U
//+  val robIdx_1 = 64.U
//+
//+  loadRegIn(0) := DontCare
//+  loadRegIn(1) := DontCare
//+  loadRegIn_valid(0) := DontCare
//+  loadRegIn_valid(1) := DontCare
//+
//+
//+  switch (state_0) {
//+    is (s_idle) {
//+        loadRegIn_valid(0)     := LFSR64(seed=Some(123L))(3,0) === 0.U
//+        //loadRegIn(0).vmask     := LFSR64(seed = Some(23L))(63,0)
//+        loadRegIn(0).baseaddr  := baseaddr_0
//+        //loadRegIn(0).stride    := LFSR64(seed = Some(3L))(XLEN-1,0)
//+        //loadRegIn(0).index     := LFSR64(seed = Some(12L))(63,0)
//+        //loadRegIn(0).pvd       := LFSR64(seed = Some(11L))(4,0)
//+        loadRegIn(0).lmul      := 4.U
//+        //loadRegIn(0).sew       := LFSR64(seed = Some(41L))(1,0)
//+        //loadRegIn(0).vma       := LFSR64(seed = Some(52L))(5,0) === 0.U
//+        //loadRegIn(0).vta       := LFSR64(seed = Some(47L))(4,0) === 0.U
//+        loadRegIn(0).inner_idx := 0.U
//+        loadRegIn(0).vl        := (128 * 4).U
//+        loadRegIn(0).total_num := 4.U
//+        loadRegIn(0).uop.robIdx.value := robIdx_0
//+        loadRegIn(0).uop.cf.instr     := 0x00000000.U
//+        loadRegIn(0).uop.pdest        := LFSR64(seed = Some(99L))(PhyRegIdxWidth-1,0)
//+      state_0 := DelayN(s1,1)
//+    }
//+    is (s1) {
//+        //loadRegIn(0).uop       := DontCare
//+        loadRegIn_valid(0)     := true.B
//+        loadRegIn(0).vmask     := LFSR64(seed = Some(23L))(63,0)
//+        loadRegIn(0).baseaddr  := baseaddr_0 + 16.U
//+        //loadRegIn(i).stride    := LFSR64(seed = Some(3L))(XLEN-1,0)
//+        //loadRegIn(i).index     := LFSR64(seed = Some(12L))(63,0)
//+        //loadRegIn(i).pvd       := LFSR64(seed = Some(11L))(4,0)
//+        loadRegIn(0).lmul      := 4.U
//+        //loadRegIn(i).sew       := LFSR64(seed = Some(41L))(1,0)
//+        //loadRegIn(i).vma       := LFSR64(seed = Some(52L))(5,0) === 0.U
//+        //loadRegIn(i).vta       := LFSR64(seed = Some(47L))(4,0) === 0.U
//+        loadRegIn(0).inner_idx := 1.U
//+        loadRegIn(0).vl        := (128 * 4).U
//+        loadRegIn(0).total_num := 4.U
//+        loadRegIn(0).uop.robIdx.value := robIdx_0 + 1.U
//+        loadRegIn(0).uop.cf.instr     := 0x00000000.U
//+        loadRegIn(0).uop.pdest        := LFSR64(seed = Some(99L))(PhyRegIdxWidth-1,0)
//+      state_0 := DelayN(s2,1)
//+    }
//+    is (s2) {
//+        //loadRegIn(0).uop       := DontCare
//+        loadRegIn_valid(0)     := true.B
//+        //loadRegIn(i).vmask     := LFSR64(seed = Some(23L))(63,0)
//+        loadRegIn(0).baseaddr  := baseaddr_0 + 32.U
//+        //loadRegIn(i).stride    := LFSR64(seed = Some(3L))(XLEN-1,0)
//+        //loadRegIn(i).index     := LFSR64(seed = Some(12L))(63,0)
//+        //loadRegIn(i).pvd       := LFSR64(seed = Some(11L))(4,0)
//+        loadRegIn(0).lmul      := 4.U
//+        //loadRegIn(i).sew       := LFSR64(seed = Some(41L))(1,0)
//+        //loadRegIn(i).vma       := LFSR64(seed = Some(52L))(5,0) === 0.U
//+        //loadRegIn(i).vta       := LFSR64(seed = Some(47L))(4,0) === 0.U
//+        loadRegIn(0).inner_idx := 2.U
//+        loadRegIn(0).vl        := (128 * 4).U
//+        loadRegIn(0).total_num := 4.U
//+        loadRegIn(0).uop.robIdx.value := robIdx_0 + 2.U
//+        loadRegIn(0).uop.cf.instr     := 0x00000000.U
//+        loadRegIn(0).uop.pdest        := LFSR64(seed = Some(99L))(PhyRegIdxWidth-1,0)
//+      state_0 := DelayN(s3,1)
//+    }
//+    is (s3) {
//+        //loadRegIn(0).uop       := DontCare
//+        loadRegIn_valid(0)     := true.B
//+        //loadRegIn(i).vmask     := LFSR64(seed = Some(23L))(63,0)
//+        loadRegIn(0).baseaddr  := baseaddr_0 + 48.U
//+        //loadRegIn(i).stride    := LFSR64(seed = Some(3L))(XLEN-1,0)
//+        //loadRegIn(i).index     := LFSR64(seed = Some(12L))(63,0)
//+        //loadRegIn(i).pvd       := LFSR64(seed = Some(11L))(4,0)
//+        loadRegIn(0).lmul      := 4.U
//+        //loadRegIn(i).sew       := LFSR64(seed = Some(41L))(1,0)
//+        //loadRegIn(i).vma       := LFSR64(seed = Some(52L))(5,0) === 0.U
//+        //loadRegIn(i).vta       := LFSR64(seed = Some(47L))(4,0) === 0.U
//+        loadRegIn(0).inner_idx := 3.U
//+        loadRegIn(0).vl        := (128 * 4).U
//+        loadRegIn(0).total_num := 4.U
//+        loadRegIn(0).uop.robIdx.value := robIdx_0 + 3.U
//+        loadRegIn(0).uop.cf.instr     := 0x00000000.U
//+        loadRegIn(0).uop.pdest        := LFSR64(seed = Some(99L))(PhyRegIdxWidth-1,0)
//+      state_0 := DelayN(s_idle,1)
//+    }
//+  }
//+
//+
//+
//+  switch (state_1) {
//+    is (s_idle) {
//+      //loadRegIn(1).uop       := DontCare
//+      loadRegIn_valid(1)     := LFSR64(seed=Some(1200L))(4,0) === 0.U
//+      //loadRegIn(i).vmask     := LFSR64(seed = Some(23L))(63,0)
//+      loadRegIn(1).baseaddr  := baseaddr_1
//+      //loadRegIn(i).stride    := LFSR64(seed = Some(3L))(XLEN-1,0)
//+      //loadRegIn(i).index     := LFSR64(seed = Some(12L))(63,0)
//+      //loadRegIn(i).pvd       := LFSR64(seed = Some(11L))(4,0)
//+      loadRegIn(1).lmul      := 4.U
//+      //loadRegIn(i).sew       := LFSR64(seed = Some(41L))(1,0)
//+      //loadRegIn(i).vma       := LFSR64(seed = Some(52L))(5,0) === 0.U
//+      //loadRegIn(i).vta       := LFSR64(seed = Some(47L))(4,0) === 0.U
//+      loadRegIn(1).inner_idx := 2.U
//+      loadRegIn(1).vl        := (128 * 4).U
//+      loadRegIn(1).total_num := 4.U
//+      loadRegIn(1).uop.robIdx.value := robIdx_1 + 2.U
//+      loadRegIn(1).uop.cf.instr     := 0x00000000.U
//+      loadRegIn(1).uop.pdest        := LFSR64(seed = Some(99L))(PhyRegIdxWidth-1,0)
//+      state_1 := DelayN(s1,1)
//+    }
//+    is (s1) {
//+      //loadRegIn(1).uop       := DontCare
//+      loadRegIn_valid(1)     := true.B
//+      //loadRegIn(i).vmask     := LFSR64(seed = Some(23L))(63,0)
//+      loadRegIn(1).baseaddr  := baseaddr_1 + 16.U
//+      //loadRegIn(i).stride    := LFSR64(seed = Some(3L))(XLEN-1,0)
//+      //loadRegIn(i).index     := LFSR64(seed = Some(12L))(63,0)
//+      //loadRegIn(i).pvd       := LFSR64(seed = Some(11L))(4,0)
//+      loadRegIn(1).lmul      := 4.U
//+      //loadRegIn(i).sew       := LFSR64(seed = Some(41L))(1,0)
//+      //loadRegIn(i).vma       := LFSR64(seed = Some(52L))(5,0) === 0.U
//+      //loadRegIn(i).vta       := LFSR64(seed = Some(47L))(4,0) === 0.U
//+      loadRegIn(1).inner_idx := 1.U
//+      loadRegIn(1).vl        := (128 * 4).U
//+      loadRegIn(1).total_num := 4.U
//+      loadRegIn(1).uop.robIdx.value := robIdx_1 + 1.U
//+      loadRegIn(1).uop.cf.instr     := 0x00000000.U
//+      loadRegIn(1).uop.pdest        := LFSR64(seed = Some(99L))(PhyRegIdxWidth-1,0)
//+      state_1 := DelayN(s2,1)
//+    }
//+    is (s2) {
//+      //loadRegIn(1).uop       := DontCare
//+      loadRegIn_valid(1)     := true.B
//+      //loadRegIn(i).vmask     := LFSR64(seed = Some(23L))(63,0)
//+      loadRegIn(1).baseaddr  := baseaddr_1 + 32.U
//+      //loadRegIn(i).stride    := LFSR64(seed = Some(3L))(XLEN-1,0)
//+      //loadRegIn(i).index     := LFSR64(seed = Some(12L))(63,0)
//+      //loadRegIn(i).pvd       := LFSR64(seed = Some(11L))(4,0)
//+      loadRegIn(1).lmul      := 4.U
//+      //loadRegIn(i).sew       := LFSR64(seed = Some(41L))(1,0)
//+      //loadRegIn(i).vma       := LFSR64(seed = Some(52L))(5,0) === 0.U
//+      //loadRegIn(i).vta       := LFSR64(seed = Some(47L))(4,0) === 0.U
//+      loadRegIn(1).inner_idx := 0.U
//+      loadRegIn(1).vl        := (128 * 4).U
//+      loadRegIn(1).total_num := 4.U
//+      loadRegIn(1).uop.robIdx.value := robIdx_1 + 0.U
//+      loadRegIn(1).uop.cf.instr     := 0x00000000.U
//+      loadRegIn(1).uop.pdest        := LFSR64(seed = Some(99L))(PhyRegIdxWidth-1,0)
//+      state_1 := DelayN(s3,1)
//+    }
//+    is (s3) {
//+      //loadRegIn(1).uop       := DontCare
//+      loadRegIn_valid(1)     := true.B
//+      //loadRegIn(i).vmask     := LFSR64(seed = Some(23L))(63,0)
//+      loadRegIn(1).baseaddr  := baseaddr_1 + 48.U
//+      //loadRegIn(i).stride    := LFSR64(seed = Some(3L))(XLEN-1,0)
//+      //loadRegIn(i).index     := LFSR64(seed = Some(12L))(63,0)
//+      //loadRegIn(i).pvd       := LFSR64(seed = Some(11L))(4,0)
//+      loadRegIn(1).lmul      := 4.U
//+      //loadRegIn(i).sew       := LFSR64(seed = Some(41L))(1,0)
//+      //loadRegIn(i).vma       := LFSR64(seed = Some(52L))(5,0) === 0.U
//+      //loadRegIn(i).vta       := LFSR64(seed = Some(47L))(4,0) === 0.U
//+      loadRegIn(1).inner_idx := 3.U
//+      loadRegIn(1).vl        := (128 * 4).U
//+      loadRegIn(1).total_num := 4.U
//+      loadRegIn(1).uop.robIdx.value := robIdx_1 + 3.U
//+      loadRegIn(1).uop.cf.instr     := 0x00000000.U
//+      loadRegIn(1).uop.pdest        := LFSR64(seed = Some(99L))(PhyRegIdxWidth-1,0)
//+      state_1 := DelayN(s_idle,1)
//+    }
//   }
// 
//+
//   for(i <- 0 until LoadPipelineWidth){
//-    io.vecloadRegIn(i).valid := DelayN(loadRegIn_valid(i),1)
//-    io.vecloadRegIn(i).bits  := DelayN(loadRegIn(i),1)
//+    io.vecloadRegIn(i).bits  := DontCare
//+    io.vecloadRegIn(i).valid := loadRegIn_valid(i)
//+    io.vecloadRegIn(i).bits  := loadRegIn(i)
//   }
//+
//   io.vecwriteback.map(_.ready := LFSR64(seed=Some(123L))(3,0) === 0.U)
//+
// }
//\ No newline at end of file
//diff --git a/src/main/scala/xiangshan/mem/vector/Vlflowqueue.scala b/src/main/scala/xiangshan/mem/vector/Vlflowqueue.scala
//index c09b01b2b..3cad41020 100644
//--- a/src/main/scala/xiangshan/mem/vector/Vlflowqueue.scala
//+++ b/src/main/scala/xiangshan/mem/vector/Vlflowqueue.scala
//@@ -160,7 +160,7 @@ class VlflowQueue(implicit p: Parameters) extends XSModule with HasCircularQueue
//     //  Should be confirmed
//     needAlloc(i)    := !flow_entry.map(_.map(_.uop.robIdx.value === io.loadRegIn(i).bits.uop.robIdx.value).reduce(_ || _)).reduce(_ || _) && io.loadRegIn(i).valid
//     loadInstDec(i)  := LoadInstDec(i).apply(io.loadRegIn(i).bits.uop.cf.instr)
//-    dataWidth(i)    := io.loadRegIn(i).bits.vl << loadInstDec(i).uop_eew(1,0)
//+    dataWidth(i)    := io.loadRegIn(i).bits.vl << loadInstDec(i).uop_eew(1,0)//TODO: for index inst need modify
//     vend_0(i)       := baseAddr(i)(3,0) + dataWidth(i)(3,0)
//     vend_1(i)       := baseAddr(i)(4,0) + dataWidth(i)(4,0)
//     vend_2(i)       := baseAddr(i)(5,0) + dataWidth(i)(5,0)
module BankBinder(
  output         auto_in_a_ready,
  input          auto_in_a_valid,
  input  [2:0]   auto_in_a_bits_opcode,
  input  [2:0]   auto_in_a_bits_param,
  input  [2:0]   auto_in_a_bits_size,
  input  [3:0]   auto_in_a_bits_source,
  input  [35:0]  auto_in_a_bits_address,
  input  [31:0]  auto_in_a_bits_mask,
  input  [255:0] auto_in_a_bits_data,
  output         auto_in_c_ready,
  input          auto_in_c_valid,
  input  [2:0]   auto_in_c_bits_opcode,
  input  [2:0]   auto_in_c_bits_size,
  input  [3:0]   auto_in_c_bits_source,
  input  [35:0]  auto_in_c_bits_address,
  input  [255:0] auto_in_c_bits_data,
  input          auto_in_d_ready,
  output         auto_in_d_valid,
  output [2:0]   auto_in_d_bits_opcode,
  output [1:0]   auto_in_d_bits_param,
  output [2:0]   auto_in_d_bits_size,
  output [3:0]   auto_in_d_bits_source,
  output [2:0]   auto_in_d_bits_sink,
  output         auto_in_d_bits_denied,
  output [255:0] auto_in_d_bits_data,
  input          auto_in_e_valid,
  input  [2:0]   auto_in_e_bits_sink,
  input          auto_out_a_ready,
  output         auto_out_a_valid,
  output [2:0]   auto_out_a_bits_opcode,
  output [2:0]   auto_out_a_bits_param,
  output [2:0]   auto_out_a_bits_size,
  output [3:0]   auto_out_a_bits_source,
  output [35:0]  auto_out_a_bits_address,
  output [31:0]  auto_out_a_bits_mask,
  output [255:0] auto_out_a_bits_data,
  input          auto_out_c_ready,
  output         auto_out_c_valid,
  output [2:0]   auto_out_c_bits_opcode,
  output [2:0]   auto_out_c_bits_size,
  output [3:0]   auto_out_c_bits_source,
  output [35:0]  auto_out_c_bits_address,
  output [255:0] auto_out_c_bits_data,
  output         auto_out_d_ready,
  input          auto_out_d_valid,
  input  [2:0]   auto_out_d_bits_opcode,
  input  [1:0]   auto_out_d_bits_param,
  input  [2:0]   auto_out_d_bits_size,
  input  [3:0]   auto_out_d_bits_source,
  input  [2:0]   auto_out_d_bits_sink,
  input          auto_out_d_bits_denied,
  input  [255:0] auto_out_d_bits_data,
  output         auto_out_e_valid,
  output [2:0]   auto_out_e_bits_sink
);
  assign auto_in_a_ready = auto_out_a_ready; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_c_ready = auto_out_c_ready; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_d_valid = auto_out_d_valid; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_d_bits_opcode = auto_out_d_bits_opcode; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_d_bits_param = auto_out_d_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_d_bits_size = auto_out_d_bits_size; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_d_bits_source = auto_out_d_bits_source; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_d_bits_sink = auto_out_d_bits_sink; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_d_bits_denied = auto_out_d_bits_denied; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_d_bits_data = auto_out_d_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_out_a_valid = auto_in_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_a_bits_opcode = auto_in_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_a_bits_param = auto_in_a_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_a_bits_size = auto_in_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_a_bits_source = auto_in_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_a_bits_address = auto_in_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_a_bits_mask = auto_in_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_a_bits_data = auto_in_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_c_valid = auto_in_c_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_c_bits_opcode = auto_in_c_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_c_bits_size = auto_in_c_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_c_bits_source = auto_in_c_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_c_bits_address = auto_in_c_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_c_bits_data = auto_in_c_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_d_ready = auto_in_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_e_valid = auto_in_e_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_e_bits_sink = auto_in_e_bits_sink; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
endmodule

