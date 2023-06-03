package xiangshan.mem

import chipsalliance.rocketchip.config.Parameters
import chisel3._
import chisel3.util._
import utils._
import utility._
import xiangshan._
import xiangshan.backend.rob.RobPtr

class VsExcSignalIObundle (implicit p: Parameters) extends XSBundle {
  val storeOut  = Vec(VecStorePipelineWidth,Decoupled(new ExuInput(isVpu = true)))
  val vstartOut = Vec(VecStorePipelineWidth,Output(UInt(8.W)))
}

class VsExcSignal (implicit p: Parameters) extends XSModule {
  val io =  IO(new VsExcSignalIObundle)

  val s_idle :: s_1 :: s_2 :: s_3 :: s_4 :: s_5 :: s_6 :: s_7 :: s_8 :: s_9 :: s_10 :: s_11 :: s_12 :: s_13 :: s_14 :: s_15 :: s_16 :: s_17 :: s_18 :: Nil = Enum(19)
  val state_0 = RegInit(s_idle)
  val state_1 = RegInit(s_idle)

  val storeOUt = Wire(Vec(VecStorePipelineWidth,new ExuInput(isVpu = true)))
  val vstart = Wire(Vec(VecStorePipelineWidth,UInt(8.W)))
  val storeOutValid = WireInit(VecInit(Seq.fill(VecStorePipelineWidth)(false.B)))
  val counter   = RegInit(0.U(10.W))
  counter := counter + 1.U

  for (i <- 0 until VecStorePipelineWidth) {
    vstart(i) := DontCare
    storeOUt(i) := DontCare
  }

  /**
    * uopQueue enqPtr and deqPtr update
    * uopQueue mask generate
    *(flush todo)
    *
    *flowQueue enqPtr and deqPtr update
    * issue logical
    * mask, data
    * feedBack
    * (flush todo)
    * (replay todo)
    */

  /**
    * unit-stride
    *
    */
  //0-3, 4 uop
  val src0_0      = 0x80000000L.U + 0x1007.U
  val src1_0      = LFSR64(seed = Some(3L))(XLEN-1,0)
  val src2_0      = "h112233445566778899aabbccddeeff00".U
  val robIdx_0    = 1.U.asTypeOf(new RobPtr)
  val uopIdx_0    = 3.U
  val sqIdx_0     = 3.U.asTypeOf(new SqPtr)
  val vsew_0      = "b001".U // sew = 2
  val vlmul_0     = "b011".U //lmul =8
  val total_num_0 = 3.U
  val vstart_0    = 5.U
  val vl_0        = 60.U
  val vmask_0     = "hffffffffffffffffffffffffffffffff".U
  val vma_0       = false.B
  val vta_0       = true.B
  val instr_0     = 0x00000000.U // eew=1
  val src0_1      = 0x80000000L.U + 0x1007.U
  val src1_1      = LFSR64(seed = Some(3L))(XLEN-1,0)
  val src2_1      = "h112233445566778899aabbccddeeff00".U
  val robIdx_1    = 1.U.asTypeOf(new RobPtr)
  val uopIdx_1    = 2.U
  val sqIdx_1     = 2.U.asTypeOf(new SqPtr)
  val vsew_1      = "b001".U // sew = 2
  val vlmul_1     = "b011".U //lmul =8
  val total_num_1 = 3.U
  val vstart_1    = 5.U
  val vl_1        = 60.U
  val vmask_1     = "hffffffffffffffffffffffffffffffff".U
  val vma_1       = false.B
  val vta_1       = true.B
  val instr_1     = 0x00000000.U // eew=1

  val src0_2      = 0x80000000L.U + 0x1007.U
  val src1_2      = LFSR64(seed = Some(3L))(XLEN-1,0)
  val src2_2      = "h112233445566778899aabbccddeeff00".U
  val robIdx_2    = 1.U.asTypeOf(new RobPtr)
  val uopIdx_2    = 1.U
  val sqIdx_2     = 1.U.asTypeOf(new SqPtr)
  val vsew_2      = "b001".U // sew = 2
  val vlmul_2     = "b011".U //lmul =8
  val total_num_2 = 3.U
  val vstart_2    = 5.U
  val vl_2        = 60.U
  val vmask_2     = "hffffffffffffffffffffffffffffffff".U
  val vma_2       = false.B
  val vta_2       = true.B
  val instr_2     = 0x00000000.U // eew=1
  val src0_3      = 0x80000000L.U + 0x1007.U
  val src1_3      = LFSR64(seed = Some(3L))(XLEN-1,0)
  val src2_3      = "h112233445566778899aabbccddeeff00".U
  val robIdx_3    = 1.U.asTypeOf(new RobPtr)
  val uopIdx_3    = 0.U
  val sqIdx_3     = 0.U.asTypeOf(new SqPtr)
  val vsew_3      = "b001".U // sew = 2
  val vlmul_3     = "b011".U //lmul =8
  val total_num_3 = 3.U
  val vstart_3    = 5.U
  val vl_3        = 60.U
  val vmask_3     = "hffffffffffffffffffffffffffffffff".U
  val vma_3       = false.B
  val vta_3       = true.B
  val instr_3     = 0x00000000.U // eew=1

  /**
    * stride
    */
  val src0_4      = 0x80000000L.U + 0x1002.U //FALSE.B
  val src1_4      = 4.U
  val src2_4      = "h0123456789abcdef0123456789abcdef".U
  val robIdx_4    = 2.U.asTypeOf(new RobPtr)
  val uopIdx_4    = 0.U
  val sqIdx_4     = 4.U.asTypeOf(new SqPtr)
  val vsew_4      = "b010".U  //sew = 4
  val vlmul_4     = "b000".U  //lmul = 1
  val total_num_4 = 0.U
  val vstart_4    = 0.U
  val vl_4        = 5.U
  val vmask_4     = 1.U
  val vma_4       = true.B
  val vta_4       = true.B
  val instr_4     = 0x08005000.U // eew = 2
  val src0_5      = 0x80000000L.U + 0x1004.U
  val src1_5      = 16.U
  val src2_5      = "h0123456789abcdef0123456789abcdef".U
  val robIdx_5    = 3.U.asTypeOf(new RobPtr)
  val uopIdx_5    = 0.U
  val sqIdx_5     = 5.U.asTypeOf(new SqPtr)
  val vsew_5      = "b001".U //sew = 2
  val vlmul_5     = "b001".U //lmul = 2
  val total_num_5 = 0.U
  val vstart_5    = 0.U
  val vl_5        = 15.U
  val vmask_5     = 1.U
  val vma_5       = true.B
  val vta_5       = false.B
  val instr_5     = 0x08000000.U // eew = 1

  val src0_6      = 0x80000000L.U + 0x1000c.U
  val src1_6      = 4.U
  val src2_6      = "h00112233445566778899aabbccddeeff".U
  val robIdx_6    = 4.U.asTypeOf(new RobPtr)
  val uopIdx_6    = 2.U
  val sqIdx_6     = 6.U.asTypeOf(new SqPtr)
  val vsew_6      = "b010".U //4
  val vlmul_6     = "b010".U //4
  val total_num_6 = 3.U
  val vstart_6    = 3.U
  val vl_6        = 16.U
  val vmask_6     = "h0000eeffeeff".U
  val vma_6       = true.B
  val vta_6       = false.B
  val instr_6     = 0x08006000.U  //eew = 4
  val src0_7      = 0x80000000L.U + 0x1000c.U
  val src1_7      = 4.U
  val src2_7      = "h0123456789abcdef0123456789abcdef".U
  val robIdx_7    = 4.U.asTypeOf(new RobPtr)
  val uopIdx_7    = 0.U
  val sqIdx_7     = 7.U.asTypeOf(new SqPtr)
  val vsew_7      = "b010".U //4
  val vlmul_7     = "b010".U //4
  val total_num_7 = 3.U
  val vstart_7    = 3.U
  val vl_7        = 16.U
  val vmask_7     = "h0000eeffeeff".U
  val vma_7       = true.B
  val vta_7       = false.B
  val instr_7     = 0x08006000.U  //eew = 4

  val src0_8      = 0x80000000L.U + 0x1000c.U
  val src1_8      = 4.U
  val src2_8      = "h00112233445566778899aabbccddeeff".U
  val robIdx_8    = 4.U.asTypeOf(new RobPtr)
  val uopIdx_8    = 1.U
  val sqIdx_8     = 8.U.asTypeOf(new SqPtr)
  val vsew_8      = "b010".U //4
  val vlmul_8     = "b010".U //4
  val total_num_8 = 3.U
  val vstart_8    = 3.U
  val vl_8        = 16.U
  val vmask_8     = "h0000eeffeeff".U
  val vma_8       = true.B
  val vta_8       = false.B
  val instr_8     = 0x08006000.U  //eew = 4
  val src0_9      = 0x80000000L.U + 0x1000c.U
  val src1_9      = 4.U
  val src2_9      = "h0123456789abcdef0123456789abcdef".U
  val robIdx_9    = 4.U.asTypeOf(new RobPtr)
  val uopIdx_9    = 3.U
  val sqIdx_9     = 9.U.asTypeOf(new SqPtr)
  val vsew_9      = "b010".U //4
  val vlmul_9     = "b010".U //4
  val total_num_9 = 3.U
  val vstart_9    = 3.U
  val vl_9        = 16.U
  val vmask_9     = "h000000000000000000000000eeffeeff".U
  val vma_9       = true.B
  val vta_9       = false.B
  val instr_9     = 0x08006000.U  //eew = 4

  /**
    * index
    */
  val src0_10      = 0x80000000L.U + 0x10008.U // 10 and 12
  val src1_10      = "h00112233445566778899aabbccddeeff".U
  val src2_10      = "h00001111222233334444555566667777".U
  val robIdx_10    = 14.U.asTypeOf(new RobPtr)
  val uopIdx_10    = 0.U
  val sqIdx_10     = 10.U.asTypeOf(new SqPtr)
  val vsew_10      = "b010".U //4
  val vlmul_10     = "b001".U//2
  val total_num_10 = 1.U
  val vstart_10    = 0.U
  val vl_10        = 7.U
  val vmask_10     = "h000000000000000000000000eeff7777".U
  val vma_10       = true.B
  val vta_10       = true.B
  val instr_10     = 0x0c000000.U //eew = 1
  val src0_11      = 0x80000000L.U + 0x10006.U//11 and 13
  val src1_11      = "h00002222444466668888aaaaccccceeee".U
  val src2_11      = "h00112233445566778899aabbccddeeff".U
  val robIdx_11    = 5.U.asTypeOf(new RobPtr)
  val uopIdx_11    = 0.U
  val sqIdx_11     = 11.U.asTypeOf(new SqPtr)
  val vsew_11      = "b001".U //2
  val vlmul_11     = "b001".U//2
  val total_num_11 = 1.U
  val vstart_11    = 3.U
  val vl_11        = 16.U
  val vmask_11     = "h000000000000000000000000eeff8877".U
  val vma_11       = false.B
  val vta_11       = true.B
  val instr_11     = 0x0c000000.U //eew = 1

  val src0_12      = 0x80000000L.U + 0x10008.U
  val src1_12      = "h00112233445566778899aabbccddeeff".U
  val src2_12      = "h00001111222233334444555566667777".U
  val robIdx_12    = 14.U.asTypeOf(new RobPtr)
  val uopIdx_12    = 1.U
  val sqIdx_12     = 12.U.asTypeOf(new SqPtr)
  val vsew_12      = "b010".U //4
  val vlmul_12     = "b001".U//2
  val total_num_12 = 1.U
  val vstart_12    = 0.U
  val vl_12        = 7.U
  val vmask_12     = "h000000000000000000000000eeff7777".U
  val vma_12       = true.B
  val vta_12       = true.B
  val instr_12     = 0x0c000000.U //eew = 1
  val src0_13      = 0x80000000L.U + 0x10006.U
  val src1_13      = "h00002222444466668888aaaaccccceeee".U
  val src2_13      = "h00112233445566778899aabbccddeeff".U
  val robIdx_13    = 5.U.asTypeOf(new RobPtr)
  val uopIdx_13    = 1.U
  val sqIdx_13     = 12.U.asTypeOf(new SqPtr)
  val vsew_13      = "b001".U // 2
  val vlmul_13     = "b001".U//2
  val total_num_13 = 1.U
  val vstart_13    = 3.U
  val vl_13        = 16.U
  val vmask_13     = "h000000000000000000000000eeff8877".U
  val vma_13       = false.B
  val vta_13       = true.B
  val instr_13     = 0x0c000000.U //eew = 1

  val src0_14      = 0x80000000L.U + 0x10001.U
  val src1_14      = "h00112233445566778899aabbccddeeff".U
  val src2_14      = "h00002222444466668888aaaacccceeee".U
  val robIdx_14    = 16.U.asTypeOf(new RobPtr)
  val uopIdx_14    = 0.U
  val sqIdx_14     = 14.U.asTypeOf(new SqPtr)
  val vsew_14      = "b000".U //1
  val vlmul_14     = "b000".U // 1
  val total_num_14 = 0.U
  val vstart_14    = 9.U
  val vl_14        = 8.U
  val vmask_14     = "h00002222444466668888aaaacccceeff".U
  val vma_14       = false.B
  val vta_14       = true.B
  val instr_14     = 0x0c000000.U // eew = 1
  val src0_15      = 0x80000000L.U + 0x10004.U
  val src1_15      = "h00004444000044440000444400004444".U
  val src2_15      = "h00002222444466668888aaaaccccceeee".U
  val robIdx_15    = 17.U.asTypeOf(new RobPtr)
  val uopIdx_15    = 0.U
  val sqIdx_15     = 15.U.asTypeOf(new SqPtr)
  val vsew_15      = "b010".U //4
  val vlmul_15     = "b000".U // 1
  val total_num_15 = 0.U
  val vstart_15    = 8.U
  val vl_15        = 0.U
  val vmask_15     = "h00002222444466668888aaaaccccee00".U
  val vma_15       = false.B
  val vta_15       = true.B
  val instr_15     = 0x0c005000.U // eew = 2

  /**
    * segment unit-stride
    */
  val src0_16      = 0x80000000L.U + 0x10003.U
  val src1_16      = LFSR64(seed = Some(3L))(XLEN-1,0)
  val src2_16      = "h00112233445566778899aabbccddeeff".U
  val robIdx_16    = 16.U.asTypeOf(new RobPtr)
  val uopIdx_16    = 7.U
  val sqIdx_16     =  16.U.asTypeOf(new SqPtr)
  val vsew_16      = "b001".U //SEW=2
  val vlmul_16     = "b000".U //1
  val total_num_16 = 7.U
  val vstart_16    = 4.U
  val vl_16        = 60.U
  val vmask_16     = "h11111111111111111111111111111111".U
  val vma_16       = false.B
  val vta_16       = true.B
  val instr_16     = "he0000000".U // nf = 8; eew = 1
  val src0_17      = 0x80000000L.U + 0x10003.U
  val src1_17      = LFSR64(seed = Some(3L))(XLEN-1,0)
  val src2_17      = "h00112233445566778899aabbccddeeff".U
  val robIdx_17    = 16.U.asTypeOf(new RobPtr)
  val uopIdx_17    = 6.U
  val sqIdx_17     = 17.U.asTypeOf(new SqPtr)
  val vsew_17      = "b001".U //SEW=2
  val vlmul_17     = "b000".U //1
  val total_num_17 = 7.U
  val vstart_17    = 4.U
  val vl_17        = 60.U
  val vmask_17     = "h11111111111111111111111111111111".U
  val vma_17       = false.B
  val vta_17       = true.B
  val instr_17     = "he0000000".U // nf = 8; eew = 1

  val src0_18      = 0x80000000L.U + 0x10003.U
  val src1_18      = LFSR64(seed = Some(3L))(XLEN-1,0)
  val src2_18      = "h00112233445566778899aabbccddeeff".U
  val robIdx_18    = 16.U.asTypeOf(new RobPtr)
  val uopIdx_18    = 5.U
  val sqIdx_18     = 18.U.asTypeOf(new SqPtr)
  val vsew_18      = "b001".U //SEW=2
  val vlmul_18     = "b000".U //1
  val total_num_18 = 7.U
  val vstart_18    = 4.U
  val vl_18        = 60.U
  val vmask_18     = "h11111111111111111111111111111111".U
  val vma_18       = false.B
  val vta_18       = true.B
  val instr_18     = "he0000000".U // nf = 8; eew = 1
  val src0_19      = 0x80000000L.U + 0x10003.U
  val src1_19      = LFSR64(seed = Some(3L))(XLEN-1,0)
  val src2_19      = "h00112233445566778899aabbccddeeff".U
  val robIdx_19    = 16.U.asTypeOf(new RobPtr)
  val uopIdx_19    = 4.U
  val sqIdx_19     = 19.U.asTypeOf(new SqPtr)
  val vsew_19      = "b001".U //SEW=2
  val vlmul_19     = "b000".U //1
  val total_num_19 = 7.U
  val vstart_19    = 4.U
  val vl_19        = 60.U
  val vmask_19     = "h11111111111111111111111111111111".U
  val vma_19       = false.B
  val vta_19       = true.B
  val instr_19     = "he0000000".U // nf = 8; eew = 1

  val src0_20      = 0x80000000L.U + 0x10003.U
  val src1_20      = LFSR64(seed = Some(3L))(XLEN-1,0)
  val src2_20      = "h00112233445566778899aabbccddeeff".U
  val robIdx_20    = 16.U.asTypeOf(new RobPtr)
  val uopIdx_20    = 3.U
  val sqIdx_20     = 20.U.asTypeOf(new SqPtr)
  val vsew_20      = "b001".U //SEW=2
  val vlmul_20     = "b000".U //1
  val total_num_20 = 7.U
  val vstart_20    = 4.U
  val vl_20        = 60.U
  val vmask_20     = "h11111111111111111111111111111111".U
  val vma_20       = false.B
  val vta_20       = true.B
  val instr_20     = "he0000000".U // nf = 8; eew = 1
  val src0_21      = 0x80000000L.U + 0x10003.U
  val src1_21      = LFSR64(seed = Some(3L))(XLEN-1,0)
  val src2_21      = "h00112233445566778899aabbccddeeff".U
  val robIdx_21    = 16.U.asTypeOf(new RobPtr)
  val uopIdx_21    = 2.U
  val sqIdx_21     = 21.U.asTypeOf(new SqPtr)
  val vsew_21      = "b001".U //SEW=2
  val vlmul_21     = "b000".U //1
  val total_num_21 = 7.U
  val vstart_21    = 4.U
  val vl_21        = 60.U
  val vmask_21     = "h11111111111111111111111111111111".U
  val vma_21       = false.B
  val vta_21       = true.B
  val instr_21     = "he0000000".U // nf = 8; eew = 1

  val src0_22      = 0x80000000L.U + 0x10003.U
  val src1_22      = LFSR64(seed = Some(3L))(XLEN-1,0)
  val src2_22      = "h00112233445566778899aabbccddeeff".U
  val robIdx_22    = 16.U.asTypeOf(new RobPtr)
  val uopIdx_22    = 1.U
  val sqIdx_22     = 22.U.asTypeOf(new SqPtr)
  val vsew_22      = "b001".U //SEW=2
  val vlmul_22     = "b000".U //1
  val total_num_22 = 7.U
  val vstart_22    = 4.U
  val vl_22        = 60.U
  val vmask_22     = "h11111111111111111111111111111111".U
  val vma_22       = false.B
  val vta_22       = true.B
  val instr_22     = "he0000000".U // nf = 8; eew = 1
  val src0_23      = 0x80000000L.U + 0x10003.U
  val src1_23      = LFSR64(seed = Some(3L))(XLEN-1,0)
  val src2_23      = "h00112233445566778899aabbccddeeff".U
  val robIdx_23    = 16.U.asTypeOf(new RobPtr)
  val uopIdx_23    = 0.U
  val sqIdx_23     = 23.U.asTypeOf(new SqPtr)
  val vsew_23      = "b001".U //SEW=2
  val vlmul_23     = "b000".U //1
  val total_num_23 = 7.U
  val vstart_23    = 4.U
  val vl_23        = 60.U
  val vmask_23     = "h11111111111111111111111111111111".U
  val vma_23       = false.B
  val vta_23       = true.B
  val instr_23     = "he0000000".U // nf = 8; eew = 1

  /**
    * segment stride
    */
  val src0_24      = 0x80000000L.U + 0x10012.U
  val src1_24      = 4.U
  val src2_24      = "h00001111222233334444555566667777".U
  val robIdx_24    = 17.U.asTypeOf(new RobPtr)
  val uopIdx_24    = 0.U
  val sqIdx_24     = 24.U.asTypeOf(new SqPtr)
  val vsew_24      = "b000".U //1
  val vlmul_24     = "b000".U // 1
  val total_num_24 = 7.U
  val vstart_24    = 2.U
  val vl_24        = 62.U
  val vmask_24     = "h77777777777777777777777777777777".U
  val vma_24       = false.B
  val vta_24       = false.B
  val instr_24     = 0x68005000.U // nf = 4; eew = 2
  val src0_25      = 0x80000000L.U + 0x10012.U
  val src1_25      = 4.U
  val src2_25      = "h00001111222233334444555566667777".U
  val robIdx_25    = 17.U.asTypeOf(new RobPtr)
  val uopIdx_25    = 2.U
  val sqIdx_25     = 25.U.asTypeOf(new SqPtr)
  val vsew_25      = "b000".U //1
  val vlmul_25     = "b000".U // 1
  val total_num_25 = 7.U
  val vstart_25    = 2.U
  val vl_25        = 62.U
  val vmask_25     = "h77777777777777777777777777777777".U
  val vma_25       = false.B
  val vta_25       = false.B
  val instr_25     = 0x68005000.U // nf = 4; eew = 2

  val src0_26      = 0x80000000L.U + 0x10012.U
  val src1_26      = 4.U
  val src2_26      = "h00001111222233334444555566667777".U
  val robIdx_26    = 17.U.asTypeOf(new RobPtr)
  val uopIdx_26    = 4.U
  val sqIdx_26     = 26.U.asTypeOf(new SqPtr)
  val vsew_26      = "b000".U //1
  val vlmul_26     = "b000".U // 1
  val total_num_26 = 7.U
  val vstart_26    = 2.U
  val vl_26        = 62.U
  val vmask_26     = "h77777777777777777777777777777777".U
  val vma_26       = false.B
  val vta_26       = false.B
  val instr_26     = 0x68005000.U // nf = 4; eew = 2
  val src0_27      = 0x80000000L.U + 0x10012.U
  val src1_27      = 4.U
  val src2_27      = "h00001111222233334444555566667777".U
  val robIdx_27    = 17.U.asTypeOf(new RobPtr)
  val uopIdx_27    = 5.U
  val sqIdx_27     = 27.U.asTypeOf(new SqPtr)
  val vsew_27      = "b000".U //1
  val vlmul_27     = "b000".U // 1
  val total_num_27 = 7.U
  val vstart_27    = 2.U
  val vl_27        = 62.U
  val vmask_27     = "h77777777777777777777777777777777".U
  val vma_27       = false.B
  val vta_27       = false.B
  val instr_27     = 0x68005000.U // nf = 4; eew = 2

  val src0_28      = 0x80000000L.U + 0x10012.U
  val src1_28      = 4.U
  val src2_28      = "h00001111222233334444555566667777".U
  val robIdx_28    = 17.U.asTypeOf(new RobPtr)
  val uopIdx_28    = 1.U
  val sqIdx_28     = 28.U.asTypeOf(new SqPtr)
  val vsew_28      = "b000".U //1
  val vlmul_28     = "b000".U // 1
  val total_num_28 = 7.U
  val vstart_28    = 2.U
  val vl_28        = 62.U
  val vmask_28     = "h77777777777777777777777777777777".U
  val vma_28       = false.B
  val vta_28       = false.B
  val instr_28     = 0x68005000.U // nf = 4; eew = 2
  val src0_29      = 0x80000000L.U + 0x10012.U
  val src1_29      = 4.U
  val src2_29      = "h00001111222233334444555566667777".U
  val robIdx_29    = 17.U.asTypeOf(new RobPtr)
  val uopIdx_29    = 3.U
  val sqIdx_29     = 29.U.asTypeOf(new SqPtr)
  val vsew_29      = "b000".U //1
  val vlmul_29     = "b000".U // 1
  val total_num_29 = 7.U
  val vstart_29    = 2.U
  val vl_29        = 62.U
  val vmask_29     = "h77777777777777777777777777777777".U
  val vma_29       = false.B
  val vta_29       = false.B
  val instr_29     = 0x68005000.U // nf = 4; eew = 2

  val src0_30      = 0x80000000L.U + 0x10012.U
  val src1_30      = 4.U
  val src2_30      = "h00001111222233334444555566667777".U
  val robIdx_30    = 17.U.asTypeOf(new RobPtr)
  val uopIdx_30    = 6.U
  val sqIdx_30     = 30.U.asTypeOf(new SqPtr)
  val vsew_30      = "b000".U //1
  val vlmul_30     = "b000".U // 1
  val total_num_30 = 7.U
  val vstart_30    = 2.U
  val vl_30        = 62.U
  val vmask_30     = "h77777777777777777777777777777777".U
  val vma_30       = false.B
  val vta_30       = false.B
  val instr_30     = 0x68005000.U // nf = 4; eew = 2
  val src0_31      = 0x80000000L.U + 0x10012.U
  val src1_31      = 4.U
  val src2_31      = "h00001111222233334444555566667777".U
  val robIdx_31    = 17.U.asTypeOf(new RobPtr)
  val uopIdx_31    = 7.U
  val sqIdx_31     = 31.U.asTypeOf(new SqPtr)
  val vsew_31      = "b000".U //1
  val vlmul_31     = "b000".U // 1
  val total_num_31 = 7.U
  val vstart_31    = 2.U
  val vl_31        = 62.U
  val vmask_31     = "h77777777777777777777777777777777".U
  val vma_31       = false.B
  val vta_31       = false.B
  val instr_31     = 0x68005000.U // nf = 4; eew = 2

  /**
    * segment index
    */
  val src0_32      = 0x80000000L.U + 0x1000.U
  val src1_32      = "h000044448888ccccc000044448888ccccc".U
  val src2_32      = "h00001111222233334444555566667777".U
  val robIdx_32    = 18.U.asTypeOf(new RobPtr)
  val uopIdx_32    = 1.U
  val sqIdx_32     = 32.U.asTypeOf(new SqPtr)
  val vsew_32      = "b010".U // SEW=4
  val vlmul_32     = "b001".U //2
  val total_num_32 = 3.U
  val vstart_32    = 4.U
  val vl_32        = 16.U
  val vmask_32     = "h33773377337733773377337733773377".U
  val vma_32       = false.B
  val vta_32       = false.B
  val instr_32     = 0x2c000000.U // nf =2; eew= 1
  val src0_33      = 0x80000000L.U + 0x1000.U
  val src1_33      = "h000044448888ccccc000044448888ccccc".U
  val src2_33      = "h00001111222233334444555566667777".U
  val robIdx_33    = 18.U.asTypeOf(new RobPtr)
  val uopIdx_33    = 2.U
  val sqIdx_33     = 33.U.asTypeOf(new SqPtr)
  val vsew_33      = "b010".U // SEW=4
  val vlmul_33     = "b001".U //2
  val total_num_33 = 3.U
  val vstart_33    = 4.U
  val vl_33        = 16.U
  val vmask_33     = "h33773377337733773377337733773377".U
  val vma_33       = false.B
  val vta_33       = false.B
  val instr_33     = 0x2c000000.U // nf =2; eew= 1

  val src0_34      = 0x80000000L.U + 0x1000.U
  val src1_34      = "h000044448888ccccc000044448888ccccc".U
  val src2_34      = "h00001111222233334444555566667777".U
  val robIdx_34    = 18.U.asTypeOf(new RobPtr)
  val uopIdx_34    = 0.U
  val sqIdx_34     = 34.U.asTypeOf(new SqPtr)
  val vsew_34      = "b010".U // SEW=4
  val vlmul_34     = "b001".U //2
  val total_num_34 = 3.U
  val vstart_34    = 4.U
  val vl_34        = 16.U
  val vmask_34     = "h33773377337733773377337733773377".U
  val vma_34       = false.B
  val vta_34       = false.B
  val instr_34     = 0x2c000000.U // nf =2; eew= 1
  val src0_35      = 0x80000000L.U + 0x1000.U
  val src1_35      = "h000044448888ccccc000044448888ccccc".U
  val src2_35      = "h00001111222233334444555566667777".U
  val robIdx_35    = 18.U.asTypeOf(new RobPtr)
  val uopIdx_35    = 3.U
  val sqIdx_35     = 35.U.asTypeOf(new SqPtr)
  val vsew_35      = "b010".U // SEW=4
  val vlmul_35     = "b001".U //2
  val total_num_35 = 3.U
  val vstart_35    = 4.U
  val vl_35        = 16.U
  val vmask_35     = "h33773377337733773377337733773377".U
  val vma_35       = false.B
  val vta_35       = false.B
  val instr_35     = 0x2c000000.U // nf =2; eew= 1

  val src0_36      = 0x80000000L.U + 0x1008.U
  val src1_36      = "h000044448888ccccc000044448888ccccc".U
  val src2_36      = "h00112233445566778899aabbccddeeff".U
  val robIdx_36    = 19.U.asTypeOf(new RobPtr)
  val uopIdx_36    = 0.U
  val sqIdx_36     = 36.U.asTypeOf(new SqPtr)
  val vsew_36      = "b010".U //SEW = 4
  val vlmul_36     = "b111".U //LMUL = 1/2
  val total_num_36 = 2.U
  val vstart_36    = 0.U
  val vl_36        = 4.U
  val vmask_36     = "h33333333333333333333333333333333".U
  val vma_36       = true.B
  val vta_36       = true.B
  val instr_36     = 0x2c005000.U // nf =2; eew= 2
  val src0_37      = 0x80000000L.U + 0x1008.U
  val src1_37      = "h000044448888ccccc000044448888ccccc".U
  val src2_37      = "h00112233445566778899aabbccddeeff".U
  val robIdx_37    = 19.U.asTypeOf(new RobPtr)
  val uopIdx_37    = 1.U
  val sqIdx_37     = 37.U.asTypeOf(new SqPtr)
  val vsew_37      = "b010".U //SEW = 4
  val vlmul_37     = "b111".U //LMUL = 1/2
  val total_num_37 = 2.U
  val vstart_37    = 0.U
  val vl_37        = 4.U
  val vmask_37     = "h33333333333333333333333333333333".U
  val vma_37       = true.B
  val vta_37       = true.B
  val instr_37     = 0x2c005000.U // nf =2; eew= 2

  switch (state_0) {
    is (s_idle) {
      when(counter === 100.U) {
        storeOutValid(0) := true.B
      }.otherwise {
        storeOutValid(0) := false.B
      }
      storeOUt(0).src(0)                       := src0_0       //baseAddr
      storeOUt(0).src(1)                       := src1_0       //stride, index
      storeOUt(0).src(2)                       := src2_0       //data
      storeOUt(0).uop.robIdx                   := robIdx_0
      storeOUt(0).uop.ctrl.uopIdx              := uopIdx_0
      storeOUt(0).uop.sqIdx                    := sqIdx_0
      storeOUt(0).uop.ctrl.vconfig.vtype.vsew  := vsew_0
      storeOUt(0).uop.ctrl.vconfig.vtype.vlmul := vlmul_0
      storeOUt(0).uop.ctrl.total_num           := total_num_0
      vstart(0)                                := vstart_0
      storeOUt(0).uop.ctrl.vconfig.vl          :=  vl_0
      storeOUt(0).src(3)                       :=  vmask_0
      storeOUt(0).uop.ctrl.vconfig.vtype.vma   :=  vma_0
      storeOUt(0).uop.ctrl.vconfig.vtype.vta   :=  vta_0
      storeOUt(0).uop.cf.instr                 := instr_0
      when (counter === 101.U) {
        state_0 := s_1
      }
    }
    is (s_1) {
      storeOutValid(0) := true.B
      storeOUt(0).src(0)                       := src0_2      //baseAddr
      storeOUt(0).src(1)                       := src1_2      //stride, index
      storeOUt(0).src(2)                       := src2_2      //data
      storeOUt(0).uop.robIdx                   := robIdx_2
      storeOUt(0).uop.ctrl.uopIdx              := uopIdx_2
      storeOUt(0).uop.sqIdx                    := sqIdx_2
      storeOUt(0).uop.ctrl.vconfig.vtype.vsew  := vsew_2
      storeOUt(0).uop.ctrl.vconfig.vtype.vlmul := vlmul_2
      storeOUt(0).uop.ctrl.total_num           := total_num_2
      vstart(0)                                := vstart_2
      storeOUt(0).uop.ctrl.vconfig.vl          := vl_2
      storeOUt(0).src(3)                       := vmask_2
      storeOUt(0).uop.ctrl.vconfig.vtype.vma   := vma_2
      storeOUt(0).uop.ctrl.vconfig.vtype.vta   := vta_2
      storeOUt(0).uop.cf.instr                 := instr_2
      state_0 := s_2
    }
    is (s_2) {
      when(counter === 200.U) {
        storeOutValid(0) := false.B
      }.otherwise {
        storeOutValid(0) := false.B
      }
      storeOUt(0).src(0)                       := src0_4
      storeOUt(0).src(1)                       := src1_4
      storeOUt(0).src(2)                       := src2_4
      storeOUt(0).uop.robIdx                   := robIdx_4
      storeOUt(0).uop.ctrl.uopIdx              := uopIdx_4
      storeOUt(0).uop.sqIdx                    := sqIdx_4
      storeOUt(0).uop.ctrl.vconfig.vtype.vsew  := vsew_4
      storeOUt(0).uop.ctrl.vconfig.vtype.vlmul := vlmul_4
      storeOUt(0).uop.ctrl.total_num           := total_num_4
      vstart(0)                                := vstart_4
      storeOUt(0).uop.ctrl.vconfig.vl          := vl_4
      storeOUt(0).src(3)                       := vmask_4
      storeOUt(0).uop.ctrl.vconfig.vtype.vma   := vma_4
      storeOUt(0).uop.ctrl.vconfig.vtype.vta   := vta_4
      storeOUt(0).uop.cf.instr                 := instr_4
      when(counter === 201.U) {
        state_0 := s_3
      }
    }
    is(s_3) {
      storeOutValid(0) := true.B
      storeOUt(0).src(0)                       := src0_6
      storeOUt(0).src(1)                       := src1_6
      storeOUt(0).src(2)                       := src2_6
      storeOUt(0).uop.robIdx                   := robIdx_6
      storeOUt(0).uop.ctrl.uopIdx              := uopIdx_6
      storeOUt(0).uop.sqIdx                    := sqIdx_6
      storeOUt(0).uop.ctrl.vconfig.vtype.vsew  := vsew_6
      storeOUt(0).uop.ctrl.vconfig.vtype.vlmul := vlmul_6
      storeOUt(0).uop.ctrl.total_num           := total_num_6
      vstart(0)                                := vstart_6
      storeOUt(0).uop.ctrl.vconfig.vl          := vl_6
      storeOUt(0).src(3)                       := vmask_6
      storeOUt(0).uop.ctrl.vconfig.vtype.vma   := vma_6
      storeOUt(0).uop.ctrl.vconfig.vtype.vta   := vta_6
      storeOUt(0).uop.cf.instr                 := instr_6
      state_0 := s_4
    }
    is(s_4) {
      when(counter === 300.U) {
        storeOutValid(0) := true.B
      }.otherwise {
        storeOutValid(0) := false.B
      }
      storeOUt(0).src(0)                       := src0_8
      storeOUt(0).src(1)                       := src1_8
      storeOUt(0).src(2)                       := src2_8
      storeOUt(0).uop.robIdx                   := robIdx_8
      storeOUt(0).uop.ctrl.uopIdx              := uopIdx_8
      storeOUt(0).uop.sqIdx                    := sqIdx_8
      storeOUt(0).uop.ctrl.vconfig.vtype.vsew  := vsew_8
      storeOUt(0).uop.ctrl.vconfig.vtype.vlmul := vlmul_8
      storeOUt(0).uop.ctrl.total_num           := total_num_8
      vstart(0)                                := vstart_8
      storeOUt(0).uop.ctrl.vconfig.vl          := vl_8
      storeOUt(0).src(3)                       := vmask_8
      storeOUt(0).uop.ctrl.vconfig.vtype.vma   := vma_8
      storeOUt(0).uop.ctrl.vconfig.vtype.vta   := vta_8
      storeOUt(0).uop.cf.instr                 := instr_8
      when(counter === 301.U) {
        state_0 := s_5
      }
    }
    is(s_5) {
      storeOutValid(0) := true.B
      storeOUt(0).src(0)                       := src0_10
      storeOUt(0).src(1)                       := src1_10
      storeOUt(0).src(2)                       := src2_10
      storeOUt(0).uop.robIdx                   := robIdx_10
      storeOUt(0).uop.ctrl.uopIdx              := uopIdx_10
      storeOUt(0).uop.sqIdx                    := sqIdx_10
      storeOUt(0).uop.ctrl.vconfig.vtype.vsew  := vsew_10
      storeOUt(0).uop.ctrl.vconfig.vtype.vlmul := vlmul_10
      storeOUt(0).uop.ctrl.total_num           := total_num_10
      vstart(0)                                := vstart_10
      storeOUt(0).uop.ctrl.vconfig.vl          := vl_10
      storeOUt(0).src(3)                       := vmask_10
      storeOUt(0).uop.ctrl.vconfig.vtype.vma   := vma_10
      storeOUt(0).uop.ctrl.vconfig.vtype.vta   := vta_10
      storeOUt(0).uop.cf.instr                 := instr_10
      state_0 := s_6
    }
    is(s_6) {
      when(counter === 400.U) {
        storeOutValid(0) := true.B
      }.otherwise {
        storeOutValid(0) := false.B
      }
      storeOUt(0).src(0)                       := src0_12
      storeOUt(0).src(1)                       := src1_12
      storeOUt(0).src(2)                       := src2_12
      storeOUt(0).uop.robIdx                   := robIdx_12
      storeOUt(0).uop.ctrl.uopIdx              := uopIdx_12
      storeOUt(0).uop.sqIdx                    := sqIdx_12
      storeOUt(0).uop.ctrl.vconfig.vtype.vsew  := vsew_12
      storeOUt(0).uop.ctrl.vconfig.vtype.vlmul := vlmul_12
      storeOUt(0).uop.ctrl.total_num           := total_num_12
      vstart(0)                                := vstart_12
      storeOUt(0).uop.ctrl.vconfig.vl          := vl_12
      storeOUt(0).src(3)                       := vmask_12
      storeOUt(0).uop.ctrl.vconfig.vtype.vma   := vma_12
      storeOUt(0).uop.ctrl.vconfig.vtype.vta   := vta_12
      storeOUt(0).uop.cf.instr                 := instr_12
      when(counter === 401.U) {
        state_0 := s_7
      }
    }
    is(s_7) {
      storeOutValid(0) := true.B
      storeOUt(0).src(0)                       := src0_14
      storeOUt(0).src(1)                       := src1_14
      storeOUt(0).src(2)                       := src2_14
      storeOUt(0).uop.robIdx                   := robIdx_14
      storeOUt(0).uop.ctrl.uopIdx              := uopIdx_14
      storeOUt(0).uop.sqIdx                    := sqIdx_14
      storeOUt(0).uop.ctrl.vconfig.vtype.vsew  := vsew_14
      storeOUt(0).uop.ctrl.vconfig.vtype.vlmul := vlmul_14
      storeOUt(0).uop.ctrl.total_num           := total_num_14
      vstart(0)                                := vstart_14
      storeOUt(0).uop.ctrl.vconfig.vl          := vl_14
      storeOUt(0).src(3)                       := vmask_14
      storeOUt(0).uop.ctrl.vconfig.vtype.vma   := vma_14
      storeOUt(0).uop.ctrl.vconfig.vtype.vta   := vta_14
      storeOUt(0).uop.cf.instr                 := instr_14
      state_0 := s_8
    }
    is(s_8) {
      when(counter === 500.U) {
        storeOutValid(0) := true.B
      }.otherwise {
        storeOutValid(0) := false.B
      }
      storeOUt(0).src(0)                       := src0_16
      storeOUt(0).src(1)                       := src1_16
      storeOUt(0).src(2)                       := src2_16
      storeOUt(0).uop.robIdx                   := robIdx_16
      storeOUt(0).uop.ctrl.uopIdx              := uopIdx_16
      storeOUt(0).uop.sqIdx                    := sqIdx_16
      storeOUt(0).uop.ctrl.vconfig.vtype.vsew  := vsew_16
      storeOUt(0).uop.ctrl.vconfig.vtype.vlmul := vlmul_16
      storeOUt(0).uop.ctrl.total_num           := total_num_16
      vstart(0)                                := vstart_16
      storeOUt(0).uop.ctrl.vconfig.vl          := vl_16
      storeOUt(0).src(3)                       := vmask_16
      storeOUt(0).uop.ctrl.vconfig.vtype.vma   := vma_16
      storeOUt(0).uop.ctrl.vconfig.vtype.vta   := vta_16
      storeOUt(0).uop.cf.instr                 := instr_16
      when(counter === 501.U) {
        state_0 := s_9
      }
    }
    is(s_9) {
      storeOutValid(0) := true.B
      storeOUt(0).src(0)                       := src0_18
      storeOUt(0).src(1)                       := src1_18
      storeOUt(0).src(2)                       := src2_18
      storeOUt(0).uop.robIdx                   := robIdx_18
      storeOUt(0).uop.ctrl.uopIdx              := uopIdx_18
      storeOUt(0).uop.sqIdx                    := sqIdx_18
      storeOUt(0).uop.ctrl.vconfig.vtype.vsew  := vsew_18
      storeOUt(0).uop.ctrl.vconfig.vtype.vlmul := vlmul_18
      storeOUt(0).uop.ctrl.total_num           := total_num_18
      vstart(0)                                := vstart_18
      storeOUt(0).uop.ctrl.vconfig.vl          := vl_18
      storeOUt(0).src(3)                       := vmask_18
      storeOUt(0).uop.ctrl.vconfig.vtype.vma   := vma_18
      storeOUt(0).uop.ctrl.vconfig.vtype.vta   := vta_18
      storeOUt(0).uop.cf.instr                 := instr_18
      state_0 := s_10
    }
    is(s_10) {
      when(counter === 600.U) {
        storeOutValid(0) := true.B
      }.otherwise {
        storeOutValid(0) := false.B
      }
      storeOUt(0).src(0)                       := src0_20
      storeOUt(0).src(1)                       := src1_20
      storeOUt(0).src(2)                       := src2_20
      storeOUt(0).uop.robIdx                   := robIdx_20
      storeOUt(0).uop.ctrl.uopIdx              := uopIdx_20
      storeOUt(0).uop.sqIdx                    := sqIdx_20
      storeOUt(0).uop.ctrl.vconfig.vtype.vsew  := vsew_20
      storeOUt(0).uop.ctrl.vconfig.vtype.vlmul := vlmul_20
      storeOUt(0).uop.ctrl.total_num           := total_num_20
      vstart(0)                                := vstart_20
      storeOUt(0).uop.ctrl.vconfig.vl          := vl_20
      storeOUt(0).src(3)                       := vmask_20
      storeOUt(0).uop.ctrl.vconfig.vtype.vma   := vma_20
      storeOUt(0).uop.ctrl.vconfig.vtype.vta   := vta_20
      storeOUt(0).uop.cf.instr                 := instr_20
      when(counter === 601.U) {
        state_0 := s_11
      }
    }
    is(s_11) {
      storeOutValid(0) := true.B
      storeOUt(0).src(0)                       := src0_22
      storeOUt(0).src(1)                       := src1_22
      storeOUt(0).src(2)                       := src2_22
      storeOUt(0).uop.robIdx                   := robIdx_22
      storeOUt(0).uop.ctrl.uopIdx              := uopIdx_22
      storeOUt(0).uop.sqIdx                    := sqIdx_22
      storeOUt(0).uop.ctrl.vconfig.vtype.vsew  := vsew_22
      storeOUt(0).uop.ctrl.vconfig.vtype.vlmul := vlmul_22
      storeOUt(0).uop.ctrl.total_num           := total_num_22
      vstart(0)                                := vstart_22
      storeOUt(0).uop.ctrl.vconfig.vl          := vl_22
      storeOUt(0).src(3)                       := vmask_22
      storeOUt(0).uop.ctrl.vconfig.vtype.vma   := vma_22
      storeOUt(0).uop.ctrl.vconfig.vtype.vta   := vta_22
      storeOUt(0).uop.cf.instr                 := instr_22
      state_0 := s_12
    }
    is(s_12) {
      when(counter === 700.U) {
        storeOutValid(0) := true.B
      }.otherwise {
        storeOutValid(0) := false.B
      }
      storeOUt(0).src(0)                       := src0_24
      storeOUt(0).src(1)                       := src1_24
      storeOUt(0).src(2)                       := src2_24
      storeOUt(0).uop.robIdx                   := robIdx_24
      storeOUt(0).uop.ctrl.uopIdx              := uopIdx_24
      storeOUt(0).uop.sqIdx                    := sqIdx_24
      storeOUt(0).uop.ctrl.vconfig.vtype.vsew  := vsew_24
      storeOUt(0).uop.ctrl.vconfig.vtype.vlmul := vlmul_24
      storeOUt(0).uop.ctrl.total_num           := total_num_24
      vstart(0)                                := vstart_24
      storeOUt(0).uop.ctrl.vconfig.vl          := vl_24
      storeOUt(0).src(3)                       := vmask_24
      storeOUt(0).uop.ctrl.vconfig.vtype.vma   := vma_24
      storeOUt(0).uop.ctrl.vconfig.vtype.vta   := vta_24
      storeOUt(0).uop.cf.instr                 := instr_24
      when(counter === 701.U) {
        state_0 := s_13
      }
    }
    is(s_13) {
      storeOutValid(0) := true.B
      storeOUt(0).src(0)                       := src0_26
      storeOUt(0).src(1)                       := src1_26
      storeOUt(0).src(2)                       := src2_26
      storeOUt(0).uop.robIdx                   := robIdx_26
      storeOUt(0).uop.ctrl.uopIdx              := uopIdx_26
      storeOUt(0).uop.sqIdx                    := sqIdx_26
      storeOUt(0).uop.ctrl.vconfig.vtype.vsew  := vsew_26
      storeOUt(0).uop.ctrl.vconfig.vtype.vlmul := vlmul_26
      storeOUt(0).uop.ctrl.total_num           := total_num_26
      vstart(0)                                := vstart_26
      storeOUt(0).uop.ctrl.vconfig.vl          := vl_26
      storeOUt(0).src(3)                       := vmask_26
      storeOUt(0).uop.ctrl.vconfig.vtype.vma   := vma_26
      storeOUt(0).uop.ctrl.vconfig.vtype.vta   := vta_26
      storeOUt(0).uop.cf.instr                 := instr_26
      state_0 := s_14
    }
    is(s_14) {
      when(counter === 800.U) {
        storeOutValid(0) := true.B
      }.otherwise {
        storeOutValid(0) := false.B
      }
      storeOUt(0).src(0)                       := src0_28
      storeOUt(0).src(1)                       := src1_28
      storeOUt(0).src(2)                       := src2_28
      storeOUt(0).uop.robIdx                   := robIdx_28
      storeOUt(0).uop.ctrl.uopIdx              := uopIdx_28
      storeOUt(0).uop.sqIdx                    := sqIdx_28
      storeOUt(0).uop.ctrl.vconfig.vtype.vsew  := vsew_28
      storeOUt(0).uop.ctrl.vconfig.vtype.vlmul := vlmul_28
      storeOUt(0).uop.ctrl.total_num           := total_num_28
      vstart(0)                                := vstart_28
      storeOUt(0).uop.ctrl.vconfig.vl          := vl_28
      storeOUt(0).src(3)                       := vmask_28
      storeOUt(0).uop.ctrl.vconfig.vtype.vma   := vma_28
      storeOUt(0).uop.ctrl.vconfig.vtype.vta   := vta_28
      storeOUt(0).uop.cf.instr                 := instr_28
      when(counter === 801.U) {
        state_0 := s_15
      }
    }
    is(s_15) {
      storeOutValid(0) := true.B
      storeOUt(0).src(0)                       := src0_30
      storeOUt(0).src(1)                       := src1_30
      storeOUt(0).src(2)                       := src2_30
      storeOUt(0).uop.robIdx                   := robIdx_30
      storeOUt(0).uop.ctrl.uopIdx              := uopIdx_30
      storeOUt(0).uop.sqIdx                    := sqIdx_30
      storeOUt(0).uop.ctrl.vconfig.vtype.vsew  := vsew_30
      storeOUt(0).uop.ctrl.vconfig.vtype.vlmul := vlmul_30
      storeOUt(0).uop.ctrl.total_num           := total_num_30
      vstart(0)                                := vstart_30
      storeOUt(0).uop.ctrl.vconfig.vl          := vl_30
      storeOUt(0).src(3)                       := vmask_30
      storeOUt(0).uop.ctrl.vconfig.vtype.vma   := vma_30
      storeOUt(0).uop.ctrl.vconfig.vtype.vta   := vta_30
      storeOUt(0).uop.cf.instr                 := instr_30
      state_0 := s_16
    }
    is(s_16) {
      when(counter === 900.U) {
        storeOutValid(0) := true.B
      }.otherwise {
        storeOutValid(0) := false.B
      }
      storeOUt(0).src(0)                       := src0_32
      storeOUt(0).src(1)                       := src1_32
      storeOUt(0).src(2)                       := src2_32
      storeOUt(0).uop.robIdx                   := robIdx_32
      storeOUt(0).uop.ctrl.uopIdx              := uopIdx_32
      storeOUt(0).uop.sqIdx                    := sqIdx_32
      storeOUt(0).uop.ctrl.vconfig.vtype.vsew  := vsew_32
      storeOUt(0).uop.ctrl.vconfig.vtype.vlmul := vlmul_32
      storeOUt(0).uop.ctrl.total_num           := total_num_32
      vstart(0)                                := vstart_32
      storeOUt(0).uop.ctrl.vconfig.vl          := vl_32
      storeOUt(0).src(3)                       := vmask_32
      storeOUt(0).uop.ctrl.vconfig.vtype.vma   := vma_32
      storeOUt(0).uop.ctrl.vconfig.vtype.vta   := vta_32
      storeOUt(0).uop.cf.instr                 := instr_32
      when(counter === 901.U) {
        state_0 := s_17
      }
    }
    is(s_17) {
      storeOutValid(0) := true.B
      storeOUt(0).src(0)                       := src0_34
      storeOUt(0).src(1)                       := src1_34
      storeOUt(0).src(2)                       := src2_34
      storeOUt(0).uop.robIdx                   := robIdx_34
      storeOUt(0).uop.ctrl.uopIdx              := uopIdx_34
      storeOUt(0).uop.sqIdx                    := sqIdx_34
      storeOUt(0).uop.ctrl.vconfig.vtype.vsew  := vsew_34
      storeOUt(0).uop.ctrl.vconfig.vtype.vlmul := vlmul_34
      storeOUt(0).uop.ctrl.total_num           := total_num_34
      vstart(0)                                := vstart_34
      storeOUt(0).uop.ctrl.vconfig.vl          := vl_34
      storeOUt(0).src(3)                       := vmask_34
      storeOUt(0).uop.ctrl.vconfig.vtype.vma   := vma_34
      storeOUt(0).uop.ctrl.vconfig.vtype.vta   := vta_34
      storeOUt(0).uop.cf.instr                 := instr_34
      state_0 := s_18
    }
    is(s_18) {
      when(counter === 1000.U) {
        storeOutValid(0) := true.B
      }.otherwise {
        storeOutValid(0) := false.B
      }
      storeOUt(0).src(0)                       := src0_36
      storeOUt(0).src(1)                       := src1_36
      storeOUt(0).src(2)                       := src2_36
      storeOUt(0).uop.robIdx                   := robIdx_36
      storeOUt(0).uop.ctrl.uopIdx              := uopIdx_36
      storeOUt(0).uop.sqIdx                    := sqIdx_36
      storeOUt(0).uop.ctrl.vconfig.vtype.vsew  := vsew_36
      storeOUt(0).uop.ctrl.vconfig.vtype.vlmul := vlmul_36
      storeOUt(0).uop.ctrl.total_num           := total_num_36
      vstart(0)                                := vstart_36
      storeOUt(0).uop.ctrl.vconfig.vl          := vl_36
      storeOUt(0).src(3)                       := vmask_36
      storeOUt(0).uop.ctrl.vconfig.vtype.vma   := vma_36
      storeOUt(0).uop.ctrl.vconfig.vtype.vta   := vta_36
      storeOUt(0).uop.cf.instr                 := instr_36
      when(counter === 1001.U) {
        state_0 := s_idle
      }
    }
  }

  switch(state_1) {
    is(s_idle) {
      when(counter === 100.U) {
        storeOutValid(1) := true.B
      }.otherwise {
        storeOutValid(1) := false.B
      }
      storeOUt(1).src(0)                       := src0_1
      storeOUt(1).src(1)                       := src1_1
      storeOUt(1).src(2)                       := src2_1
      storeOUt(1).uop.robIdx                   := robIdx_1
      storeOUt(1).uop.ctrl.uopIdx              := uopIdx_1
      storeOUt(1).uop.sqIdx                    := sqIdx_1
      storeOUt(1).uop.ctrl.vconfig.vtype.vsew  := vsew_1
      storeOUt(1).uop.ctrl.vconfig.vtype.vlmul := vlmul_1
      storeOUt(1).uop.ctrl.total_num           := total_num_1
      vstart(1)                                := vstart_1
      storeOUt(1).uop.ctrl.vconfig.vl          := vl_1
      storeOUt(1).src(3)                       := vmask_1
      storeOUt(1).uop.ctrl.vconfig.vtype.vma   := vma_1
      storeOUt(1).uop.ctrl.vconfig.vtype.vta   := vta_1
      storeOUt(1).uop.cf.instr                 := instr_1
      when(counter === 101.U) {
        state_1 := s_1
      }
    }
    is(s_1) {
      storeOutValid(1) := true.B
      storeOUt(1).src(0)                       := src0_3
      storeOUt(1).src(1)                       := src1_3
      storeOUt(1).src(2)                       := src2_3
      storeOUt(1).uop.robIdx                   := robIdx_3
      storeOUt(1).uop.ctrl.uopIdx              := uopIdx_3
      storeOUt(1).uop.sqIdx                    := sqIdx_3
      storeOUt(1).uop.ctrl.vconfig.vtype.vsew  := vsew_3
      storeOUt(1).uop.ctrl.vconfig.vtype.vlmul := vlmul_3
      storeOUt(1).uop.ctrl.total_num           := total_num_3
      vstart(1)                                := vstart_3
      storeOUt(1).uop.ctrl.vconfig.vl          := vl_3
      storeOUt(1).src(3)                       := vmask_3
      storeOUt(1).uop.ctrl.vconfig.vtype.vma   := vma_3
      storeOUt(1).uop.ctrl.vconfig.vtype.vta   := vta_3
      storeOUt(1).uop.cf.instr                 := instr_3
      state_1 := s_2
    }
    is(s_2) {
      when(counter === 200.U) {
        storeOutValid(1) := true.B
      }.otherwise {
        storeOutValid(1) := false.B
      }
      storeOUt(1).src(0)                       := src0_5
      storeOUt(1).src(1)                       := src1_5
      storeOUt(1).src(2)                       := src2_5
      storeOUt(1).uop.robIdx                   := robIdx_5
      storeOUt(1).uop.ctrl.uopIdx              := uopIdx_5
      storeOUt(1).uop.sqIdx                    := sqIdx_5
      storeOUt(1).uop.ctrl.vconfig.vtype.vsew  := vsew_5
      storeOUt(1).uop.ctrl.vconfig.vtype.vlmul := vlmul_5
      storeOUt(1).uop.ctrl.total_num           := total_num_5
      vstart(1)                                := vstart_5
      storeOUt(1).uop.ctrl.vconfig.vl          := vl_5
      storeOUt(1).src(3)                       := vmask_5
      storeOUt(1).uop.ctrl.vconfig.vtype.vma   := vma_5
      storeOUt(1).uop.ctrl.vconfig.vtype.vta   := vta_5
      storeOUt(1).uop.cf.instr                 := instr_5
      when(counter === 201.U) {
        state_1 := s_3
      }
    }
    is(s_3) {
      storeOutValid(1) := true.B
      storeOUt(1).src(0)                       := src0_7
      storeOUt(1).src(1)                       := src1_7
      storeOUt(1).src(2)                       := src2_7
      storeOUt(1).uop.robIdx                   := robIdx_7
      storeOUt(1).uop.ctrl.uopIdx              := uopIdx_7
      storeOUt(1).uop.sqIdx                    := sqIdx_7
      storeOUt(1).uop.ctrl.vconfig.vtype.vsew  := vsew_7
      storeOUt(1).uop.ctrl.vconfig.vtype.vlmul := vlmul_7
      storeOUt(1).uop.ctrl.total_num           := total_num_7
      vstart(1)                                := vstart_7
      storeOUt(1).uop.ctrl.vconfig.vl          := vl_7
      storeOUt(1).src(3)                       := vmask_7
      storeOUt(1).uop.ctrl.vconfig.vtype.vma   := vma_7
      storeOUt(1).uop.ctrl.vconfig.vtype.vta   := vta_7
      storeOUt(1).uop.cf.instr                 := instr_7
      state_1 := s_4
    }
    is(s_4) {
      when(counter === 300.U) {
        storeOutValid(1) := true.B
      }.otherwise {
        storeOutValid(1) := false.B
      }
      storeOUt(1).src(0)                       := src0_9
      storeOUt(1).src(1)                       := src1_9
      storeOUt(1).src(2)                       := src2_9
      storeOUt(1).uop.robIdx                   := robIdx_9
      storeOUt(1).uop.ctrl.uopIdx              := uopIdx_9
      storeOUt(1).uop.sqIdx                    := sqIdx_9
      storeOUt(1).uop.ctrl.vconfig.vtype.vsew  := vsew_9
      storeOUt(1).uop.ctrl.vconfig.vtype.vlmul := vlmul_9
      storeOUt(1).uop.ctrl.total_num           := total_num_9
      vstart(1)                                := vstart_9
      storeOUt(1).uop.ctrl.vconfig.vl          := vl_9
      storeOUt(1).src(3)                       := vmask_9
      storeOUt(1).uop.ctrl.vconfig.vtype.vma   := vma_9
      storeOUt(1).uop.ctrl.vconfig.vtype.vta   := vta_9
      storeOUt(1).uop.cf.instr                 := instr_9
      when(counter === 301.U) {
        state_1 := s_5
      }
    }
    is(s_5) {
      storeOutValid(1) := true.B
      storeOUt(1).src(0)                       := src0_11
      storeOUt(1).src(1)                       := src1_11
      storeOUt(1).src(2)                       := src2_11
      storeOUt(1).uop.robIdx                   := robIdx_11
      storeOUt(1).uop.ctrl.uopIdx              := uopIdx_11
      storeOUt(1).uop.sqIdx                    := sqIdx_11
      storeOUt(1).uop.ctrl.vconfig.vtype.vsew  := vsew_11
      storeOUt(1).uop.ctrl.vconfig.vtype.vlmul := vlmul_11
      storeOUt(1).uop.ctrl.total_num           := total_num_11
      vstart(1)                                := vstart_11
      storeOUt(1).uop.ctrl.vconfig.vl          := vl_11
      storeOUt(1).src(3)                       := vmask_11
      storeOUt(1).uop.ctrl.vconfig.vtype.vma   := vma_11
      storeOUt(1).uop.ctrl.vconfig.vtype.vta   := vta_11
      storeOUt(1).uop.cf.instr                 := instr_11
      state_1 := s_6
    }
    is(s_6) {
      when(counter === 400.U) {
        storeOutValid(1) := true.B
      }.otherwise {
        storeOutValid(1) := false.B
      }
      storeOUt(1).src(0)                       := src0_13
      storeOUt(1).src(1)                       := src1_13
      storeOUt(1).src(2)                       := src2_13
      storeOUt(1).uop.robIdx                   := robIdx_13
      storeOUt(1).uop.ctrl.uopIdx              := uopIdx_13
      storeOUt(1).uop.sqIdx                    := sqIdx_13
      storeOUt(1).uop.ctrl.vconfig.vtype.vsew  := vsew_13
      storeOUt(1).uop.ctrl.vconfig.vtype.vlmul := vlmul_13
      storeOUt(1).uop.ctrl.total_num           := total_num_13
      vstart(1)                                := vstart_13
      storeOUt(1).uop.ctrl.vconfig.vl          := vl_13
      storeOUt(1).src(3)                       := vmask_13
      storeOUt(1).uop.ctrl.vconfig.vtype.vma   := vma_13
      storeOUt(1).uop.ctrl.vconfig.vtype.vta   := vta_13
      storeOUt(1).uop.cf.instr                 := instr_13
      when(counter === 401.U) {
        state_1 := s_7
      }
    }
    is(s_7) {
      storeOutValid(1) := true.B
      storeOUt(1).src(0)                       := src0_15
      storeOUt(1).src(1)                       := src1_15
      storeOUt(1).src(2)                       := src2_15
      storeOUt(1).uop.robIdx                   := robIdx_15
      storeOUt(1).uop.ctrl.uopIdx              := uopIdx_15
      storeOUt(1).uop.sqIdx                    := sqIdx_15
      storeOUt(1).uop.ctrl.vconfig.vtype.vsew  := vsew_15
      storeOUt(1).uop.ctrl.vconfig.vtype.vlmul := vlmul_15
      storeOUt(1).uop.ctrl.total_num           := total_num_15
      vstart(1)                                := vstart_15
      storeOUt(1).uop.ctrl.vconfig.vl          := vl_15
      storeOUt(1).src(3)                       := vmask_15
      storeOUt(1).uop.ctrl.vconfig.vtype.vma   := vma_15
      storeOUt(1).uop.ctrl.vconfig.vtype.vta   := vta_15
      storeOUt(1).uop.cf.instr                 := instr_15
      state_1 := s_8
    }
    is(s_8) {
      when(counter === 500.U) {
        storeOutValid(1) := true.B
      }.otherwise {
        storeOutValid(1) := false.B
      }
      storeOUt(1).src(0)                       := src0_17
      storeOUt(1).src(1)                       := src1_17
      storeOUt(1).src(2)                       := src2_17
      storeOUt(1).uop.robIdx                   := robIdx_17
      storeOUt(1).uop.ctrl.uopIdx              := uopIdx_17
      storeOUt(1).uop.sqIdx                    := sqIdx_17
      storeOUt(1).uop.ctrl.vconfig.vtype.vsew  := vsew_17
      storeOUt(1).uop.ctrl.vconfig.vtype.vlmul := vlmul_17
      storeOUt(1).uop.ctrl.total_num           := total_num_17
      vstart(1)                                := vstart_17
      storeOUt(1).uop.ctrl.vconfig.vl          := vl_17
      storeOUt(1).src(3)                       := vmask_17
      storeOUt(1).uop.ctrl.vconfig.vtype.vma   := vma_17
      storeOUt(1).uop.ctrl.vconfig.vtype.vta   := vta_17
      storeOUt(1).uop.cf.instr                 := instr_17
      when(counter === 500.U) {
        state_1 := s_9
      }
    }
    is(s_9) {
      storeOutValid(1) := true.B
      storeOUt(1).src(0)                       := src0_19
      storeOUt(1).src(1)                       := src1_19
      storeOUt(1).src(2)                       := src2_19
      storeOUt(1).uop.robIdx                   := robIdx_19
      storeOUt(1).uop.ctrl.uopIdx              := uopIdx_19
      storeOUt(1).uop.sqIdx                    := sqIdx_19
      storeOUt(1).uop.ctrl.vconfig.vtype.vsew  := vsew_19
      storeOUt(1).uop.ctrl.vconfig.vtype.vlmul := vlmul_19
      storeOUt(1).uop.ctrl.total_num           := total_num_19
      vstart(1)                                := vstart_19
      storeOUt(1).uop.ctrl.vconfig.vl          := vl_19
      storeOUt(1).src(3)                       := vmask_19
      storeOUt(1).uop.ctrl.vconfig.vtype.vma   := vma_19
      storeOUt(1).uop.ctrl.vconfig.vtype.vta   := vta_19
      storeOUt(1).uop.cf.instr                 := instr_19
      state_1 := s_10
    }
    is(s_10) {
      when(counter === 600.U) {
        storeOutValid(1) := true.B
      }.otherwise {
        storeOutValid(1) := false.B
      }
      storeOUt(1).src(0)                       := src0_21
      storeOUt(1).src(1)                       := src1_21
      storeOUt(1).src(2)                       := src2_21
      storeOUt(1).uop.robIdx                   := robIdx_21
      storeOUt(1).uop.ctrl.uopIdx              := uopIdx_21
      storeOUt(1).uop.sqIdx                    := sqIdx_21
      storeOUt(1).uop.ctrl.vconfig.vtype.vsew  := vsew_21
      storeOUt(1).uop.ctrl.vconfig.vtype.vlmul := vlmul_21
      storeOUt(1).uop.ctrl.total_num           := total_num_21
      vstart(1)                                := vstart_21
      storeOUt(1).uop.ctrl.vconfig.vl          := vl_21
      storeOUt(1).src(3)                       := vmask_21
      storeOUt(1).uop.ctrl.vconfig.vtype.vma   := vma_21
      storeOUt(1).uop.ctrl.vconfig.vtype.vta   := vta_21
      storeOUt(1).uop.cf.instr                 := instr_21
      when(counter === 601.U) {
        state_1 := s_11
      }
    }
    is(s_11) {
      storeOutValid(1) := true.B
      storeOUt(1).src(0)                       := src0_23
      storeOUt(1).src(1)                       := src1_23
      storeOUt(1).src(2)                       := src2_23
      storeOUt(1).uop.robIdx                   := robIdx_23
      storeOUt(1).uop.ctrl.uopIdx              := uopIdx_23
      storeOUt(1).uop.sqIdx                    := sqIdx_23
      storeOUt(1).uop.ctrl.vconfig.vtype.vsew  := vsew_23
      storeOUt(1).uop.ctrl.vconfig.vtype.vlmul := vlmul_23
      storeOUt(1).uop.ctrl.total_num           := total_num_23
      vstart(1)                                := vstart_23
      storeOUt(1).uop.ctrl.vconfig.vl          := vl_23
      storeOUt(1).src(3)                       := vmask_23
      storeOUt(1).uop.ctrl.vconfig.vtype.vma   := vma_23
      storeOUt(1).uop.ctrl.vconfig.vtype.vta   := vta_23
      storeOUt(1).uop.cf.instr                 := instr_23
      state_1 := s_12
    }
    is(s_12) {
      when(counter === 700.U) {
        storeOutValid(1) := true.B
      }.otherwise {
        storeOutValid(1) := false.B
      }
      storeOUt(1).src(0)                       := src0_25
      storeOUt(1).src(1)                       := src1_25
      storeOUt(1).src(2)                       := src2_25
      storeOUt(1).uop.robIdx                   := robIdx_25
      storeOUt(1).uop.ctrl.uopIdx              := uopIdx_25
      storeOUt(1).uop.sqIdx                    := sqIdx_25
      storeOUt(1).uop.ctrl.vconfig.vtype.vsew  := vsew_25
      storeOUt(1).uop.ctrl.vconfig.vtype.vlmul := vlmul_25
      storeOUt(1).uop.ctrl.total_num           := total_num_25
      vstart(1)                                := vstart_25
      storeOUt(1).uop.ctrl.vconfig.vl          := vl_25
      storeOUt(1).src(3)                       := vmask_25
      storeOUt(1).uop.ctrl.vconfig.vtype.vma   := vma_25
      storeOUt(1).uop.ctrl.vconfig.vtype.vta   := vta_25
      storeOUt(1).uop.cf.instr                 := instr_25
      when(counter === 701.U) {
        state_1 := s_13
      }
    }
    is(s_13) {
      storeOutValid(1) := true.B
      storeOUt(1).src(0)                       := src0_27
      storeOUt(1).src(1)                       := src1_27
      storeOUt(1).src(2)                       := src2_27
      storeOUt(1).uop.robIdx                   := robIdx_27
      storeOUt(1).uop.ctrl.uopIdx              := uopIdx_27
      storeOUt(1).uop.sqIdx                    := sqIdx_27
      storeOUt(1).uop.ctrl.vconfig.vtype.vsew  := vsew_27
      storeOUt(1).uop.ctrl.vconfig.vtype.vlmul := vlmul_27
      storeOUt(1).uop.ctrl.total_num           := total_num_27
      vstart(1)                                := vstart_27
      storeOUt(1).uop.ctrl.vconfig.vl          := vl_27
      storeOUt(1).src(3)                       := vmask_27
      storeOUt(1).uop.ctrl.vconfig.vtype.vma   := vma_27
      storeOUt(1).uop.ctrl.vconfig.vtype.vta   := vta_27
      storeOUt(1).uop.cf.instr                 := instr_27
      state_1 := s_14
    }
    is(s_14) {
      when(counter === 800.U) {
        storeOutValid(1) := true.B
      }.otherwise {
        storeOutValid(1) := false.B
      }
      storeOUt(1).src(0)                       := src0_29
      storeOUt(1).src(1)                       := src1_29
      storeOUt(1).src(2)                       := src2_29
      storeOUt(1).uop.robIdx                   := robIdx_29
      storeOUt(1).uop.ctrl.uopIdx              := uopIdx_29
      storeOUt(1).uop.sqIdx                    := sqIdx_29
      storeOUt(1).uop.ctrl.vconfig.vtype.vsew  := vsew_29
      storeOUt(1).uop.ctrl.vconfig.vtype.vlmul := vlmul_29
      storeOUt(1).uop.ctrl.total_num           := total_num_29
      vstart(1)                                := vstart_29
      storeOUt(1).uop.ctrl.vconfig.vl          := vl_29
      storeOUt(1).src(3)                       := vmask_29
      storeOUt(1).uop.ctrl.vconfig.vtype.vma   := vma_29
      storeOUt(1).uop.ctrl.vconfig.vtype.vta   := vta_29
      storeOUt(1).uop.cf.instr                 := instr_29
      when(counter === 801.U) {
        state_1 := s_15
      }
    }
    is(s_15) {
      storeOutValid(1) := true.B
      storeOUt(1).src(0)                       := src0_31
      storeOUt(1).src(1)                       := src1_31
      storeOUt(1).src(2)                       := src2_31
      storeOUt(1).uop.robIdx                   := robIdx_31
      storeOUt(1).uop.ctrl.uopIdx              := uopIdx_31
      storeOUt(1).uop.sqIdx                    := sqIdx_31
      storeOUt(1).uop.ctrl.vconfig.vtype.vsew  := vsew_31
      storeOUt(1).uop.ctrl.vconfig.vtype.vlmul := vlmul_31
      storeOUt(1).uop.ctrl.total_num           := total_num_31
      vstart(1)                                := vstart_31
      storeOUt(1).uop.ctrl.vconfig.vl          := vl_31
      storeOUt(1).src(3)                       := vmask_31
      storeOUt(1).uop.ctrl.vconfig.vtype.vma   := vma_31
      storeOUt(1).uop.ctrl.vconfig.vtype.vta   := vta_31
      storeOUt(1).uop.cf.instr                 := instr_31
      state_1 := s_16
    }
    is(s_16) {
      when(counter === 900.U) {
        storeOutValid(1) := true.B
      }.otherwise {
        storeOutValid(1) := false.B
      }
      storeOUt(1).src(0)                       := src0_33
      storeOUt(1).src(1)                       := src1_33
      storeOUt(1).src(2)                       := src2_33
      storeOUt(1).uop.robIdx                   := robIdx_33
      storeOUt(1).uop.ctrl.uopIdx              := uopIdx_33
      storeOUt(1).uop.sqIdx                    := sqIdx_33
      storeOUt(1).uop.ctrl.vconfig.vtype.vsew  := vsew_33
      storeOUt(1).uop.ctrl.vconfig.vtype.vlmul := vlmul_33
      storeOUt(1).uop.ctrl.total_num           := total_num_33
      vstart(1)                                := vstart_33
      storeOUt(1).uop.ctrl.vconfig.vl          := vl_33
      storeOUt(1).src(3)                       := vmask_33
      storeOUt(1).uop.ctrl.vconfig.vtype.vma   := vma_33
      storeOUt(1).uop.ctrl.vconfig.vtype.vta   := vta_33
      storeOUt(1).uop.cf.instr                 := instr_33
      when(counter === 901.U) {
        state_1 := s_17
      }
    }
    is(s_17) {
      storeOutValid(1) := true.B
      storeOUt(1).src(0)                       := src0_35
      storeOUt(1).src(1)                       := src1_35
      storeOUt(1).src(2)                       := src2_35
      storeOUt(1).uop.robIdx                   := robIdx_35
      storeOUt(1).uop.ctrl.uopIdx              := uopIdx_35
      storeOUt(1).uop.sqIdx                    := sqIdx_35
      storeOUt(1).uop.ctrl.vconfig.vtype.vsew  := vsew_35
      storeOUt(1).uop.ctrl.vconfig.vtype.vlmul := vlmul_35
      storeOUt(1).uop.ctrl.total_num           := total_num_35
      vstart(1)                                := vstart_35
      storeOUt(1).uop.ctrl.vconfig.vl          := vl_35
      storeOUt(1).src(3)                       := vmask_35
      storeOUt(1).uop.ctrl.vconfig.vtype.vma   := vma_35
      storeOUt(1).uop.ctrl.vconfig.vtype.vta   := vta_35
      storeOUt(1).uop.cf.instr                 := instr_35
      state_1 := s_18
    }
    is(s_18) {
      when(counter === 1000.U) {
        storeOutValid(1) := true.B
      }.otherwise {
        storeOutValid(1) := false.B
      }
      storeOUt(1).src(0)                       := src0_37
      storeOUt(1).src(1)                       := src1_37
      storeOUt(1).src(2)                       := src2_37
      storeOUt(1).uop.robIdx                   := robIdx_37
      storeOUt(1).uop.ctrl.uopIdx              := uopIdx_37
      storeOUt(1).uop.sqIdx                    := sqIdx_37
      storeOUt(1).uop.ctrl.vconfig.vtype.vsew  := vsew_37
      storeOUt(1).uop.ctrl.vconfig.vtype.vlmul := vlmul_37
      storeOUt(1).uop.ctrl.total_num           := total_num_37
      vstart(1)                                := vstart_37
      storeOUt(1).uop.ctrl.vconfig.vl          := vl_37
      storeOUt(1).src(3)                       := vmask_37
      storeOUt(1).uop.ctrl.vconfig.vtype.vma   := vma_37
      storeOUt(1).uop.ctrl.vconfig.vtype.vta   := vta_37
      storeOUt(1).uop.cf.instr                 := instr_37
      when(counter === 1001.U) {
        state_1 := s_idle
      }
    }
  }


  for (i <- 0 until VecStorePipelineWidth) {
    io.storeOut(i).bits := DontCare
    io.storeOut(i).bits := storeOUt(i)
    io.vstartOut(i) := vstart(i)
    io.storeOut(i).valid := storeOutValid(i)
  }

}