package xiangshan.mem

import chipsalliance.rocketchip.config.Parameters
import chisel3._
import chisel3.util._
import utils._
import utility._
import xiangshan._
import xiangshan.backend.rob.RobPtr

class vlExcSignalBundle(implicit p: Parameters) extends XSBundle{
  val vecloadRegIn = Vec(2,Decoupled(new ExuInput(isVpu = true)))
  val vecwriteback = Vec(2,Flipped(Decoupled(new ExuOutput(isVpu = true))))
  //val vecData = Vec(2,Flipped(Valid(UInt(VLEN.W))))
  val vecFeedback = Vec(2,Flipped(ValidIO(Bool())))
}


class VlExcSignal(implicit p: Parameters) extends XSModule{
  val io = IO(new vlExcSignalBundle)

  //dontTouch(io.vecData)
  //val data_0 = io.vecData(0).bits
  //val data_1 = io.vecData(1).bits
  dontTouch(io.vecwriteback)
  val loadRegIn = Wire(Vec(2,new ExuInput(isVpu = true)))
  val loadRegIn_valid = Wire(Vec(2,Bool()))

  val s_idle::s_1::s_2::s_3::s_4::s_5::s_6::s_7::s_8::s_9::s_10::s_11::s_12::s_13::s_14::s_15::s_16::s_17::s_18::Nil = Enum(19)
  val state_0 = RegInit(s_idle)
  val state_1 = RegInit(s_idle)

  val counter = RegInit(0.U(10.W))

  loadRegIn(0) := DontCare
  loadRegIn(1) := DontCare
  loadRegIn_valid(0) := DontCare
  loadRegIn_valid(1) := DontCare

  counter := counter + 1.U

  //unit-stride 0-3
  val src0_0      = 0x80000000L.U + 0x3.U
  val src1_0      = LFSR64(seed = Some(3L))(XLEN-1,0)
  val vl_0        = 64.U
  val robIdx_0    = 0.U.asTypeOf(new RobPtr)
  val uopIdx_0    = 3.U
  val lqIdx_0     = 0.U.asTypeOf(new LqPtr)
  val sew_0       = "b001".U // sew = 2
  val lmul_0      = "b011".U // lmul = 8
  val total_num_0 = 3.U
  val instr_0     = 0x00000000.U // eew=1
  val pdest_0     = 3.U
  val src0_1      = 0x80000000L.U + 0x3.U
  val src1_1      = LFSR64(seed = Some(3L))(XLEN-1,0)
  val vl_1        = 64.U
  val robIdx_1    = 0.U.asTypeOf(new RobPtr)
  val uopIdx_1    = 2.U
  val lqIdx_1     = 1.U.asTypeOf(new LqPtr)
  val sew_1       = "b001".U // sew = 2
  val lmul_1      = "b011".U // lmul = 8
  val total_num_1 = 3.U
  val instr_1     = 0x00000000.U // eew=1
  val pdest_1     = 2.U

  val src0_2      = 0x80000000L.U + 0x3.U
  val src1_2      = LFSR64(seed = Some(3L))(XLEN-1,0)
  val vl_2        = 64.U
  val robIdx_2    = 0.U.asTypeOf(new RobPtr)
  val uopIdx_2    = 1.U
  val lqIdx_2     = 2.U.asTypeOf(new LqPtr)
  val sew_2       = "b001".U // sew = 2
  val lmul_2      = "b011".U // lmul = 8
  val total_num_2 = 3.U
  val instr_2     = 0x00000000.U // eew=1
  val pdest_2     = 1.U
  val src0_3      = 0x80000000L.U + 0x3.U
  val src1_3      = LFSR64(seed = Some(3L))(XLEN-1,0)
  val vl_3        = 64.U
  val robIdx_3    = 0.U.asTypeOf(new RobPtr)
  val uopIdx_3    = 0.U
  val lqIdx_3     = 3.U.asTypeOf(new LqPtr)
  val sew_3       = "b001".U // sew = 2
  val lmul_3      = "b011".U // lmul = 8
  val total_num_3 = 3.U
  val instr_3     = 0x00000000.U // eew=1
  val pdest_3     = 0.U

  //stride
  val src0_4      = 0x80000000L.U + 0x4.U//4-11
  val src1_4      = 4.U
  val vl_4        = 32.U
  val robIdx_4    = 2.U.asTypeOf(new RobPtr)
  val uopIdx_4    = 7.U
  val lqIdx_4     = 4.U.asTypeOf(new LqPtr)
  val sew_4       = "b010".U // sew = 4
  val lmul_4      = "b011".U // lmul = 8
  val total_num_4 = 7.U
  val instr_4     = 0x08006000.U  //eew = 4
  val pdest_4     = 8.U
  val src0_5      = 0x80000000L.U + 0x4.U
  val src1_5      = 4.U
  val vl_5        = 32.U
  val robIdx_5    = 2.U.asTypeOf(new RobPtr)
  val uopIdx_5    = 6.U
  val lqIdx_5     = 5.U.asTypeOf(new LqPtr)
  val sew_5       = "b010".U // sew = 4
  val lmul_5      = "b011".U // lmul = 8
  val total_num_5 = 7.U
  val instr_5     = 0x08006000.U  //eew = 4
  val pdest_5     = 9.U

  val src0_6      = 0x80000000L.U + 0x4.U
  val src1_6      = 4.U
  val vl_6        = 32.U
  val robIdx_6    = 2.U.asTypeOf(new RobPtr)
  val uopIdx_6    = 5.U
  val lqIdx_6     = 6.U.asTypeOf(new LqPtr)
  val sew_6       = "b010".U // sew = 4
  val lmul_6      = "b011".U // lmul = 8
  val total_num_6 = 7.U
  val instr_6     = 0x08006000.U  //eew = 4
  val pdest_6     = 10.U
  val src0_7      = 0x80000000L.U + 0x4.U
  val src1_7      = 4.U
  val vl_7        = 32.U
  val robIdx_7    = 2.U.asTypeOf(new RobPtr)
  val uopIdx_7    = 4.U
  val lqIdx_7     = 7.U.asTypeOf(new LqPtr)
  val sew_7       = "b010".U // sew = 4
  val lmul_7      = "b011".U // lmul = 8
  val total_num_7 = 7.U
  val instr_7     = 0x08006000.U  //eew = 4
  val pdest_7     = 11.U

  val src0_8      = 0x80000000L.U + 0x4.U
  val src1_8      = 4.U
  val vl_8        = 32.U
  val robIdx_8    = 2.U.asTypeOf(new RobPtr)
  val uopIdx_8    = 3.U
  val lqIdx_8     = 8.U.asTypeOf(new LqPtr)
  val sew_8       = "b010".U // sew = 4
  val lmul_8      = "b011".U // lmul = 8
  val total_num_8 = 7.U
  val instr_8     = 0x08006000.U  //eew = 4
  val pdest_8     = 12.U
  val src0_9      = 0x80000000L.U + 0x4.U
  val src1_9      = 4.U
  val vl_9        = 32.U
  val robIdx_9    = 2.U.asTypeOf(new RobPtr)
  val uopIdx_9    = 2.U
  val lqIdx_9     = 9.U.asTypeOf(new LqPtr)
  val sew_9       = "b010".U // sew = 4
  val lmul_9      = "b011".U // lmul = 8
  val total_num_9 = 7.U
  val instr_9     = 0x08006000.U  //eew = 4
  val pdest_9     = 13.U

  val src0_10      = 0x80000000L.U + 0x4.U
  val src1_10      = 4.U
  val vl_10        = 32.U
  val robIdx_10    = 2.U.asTypeOf(new RobPtr)
  val uopIdx_10    = 1.U
  val lqIdx_10     = 10.U.asTypeOf(new LqPtr)
  val sew_10       = "b010".U // sew = 4
  val lmul_10      = "b011".U // lmul = 8
  val total_num_10 = 7.U
  val instr_10     = 0x08006000.U  //eew = 4
  val pdest_10     = 14.U
  val src0_11      = 0x80000000L.U + 0x4.U
  val src1_11      = 4.U
  val vl_11        = 32.U
  val robIdx_11    = 2.U.asTypeOf(new RobPtr)
  val uopIdx_11    = 0.U
  val lqIdx_11     = 11.U.asTypeOf(new LqPtr)
  val sew_11       = "b010".U // sew = 4
  val lmul_11      = "b011".U // lmul = 8
  val total_num_11 = 7.U
  val instr_11     = 0x08006000.U  //eew = 4
  val pdest_11     = 15.U

  val src0_12      = 0x80000000L.U + 0x9.U
  val src1_12      = 8.U
  val vl_12        = 8.U
  val robIdx_12    = 3.U.asTypeOf(new RobPtr)
  val uopIdx_12    = 0.U
  val lqIdx_12     = 12.U.asTypeOf(new LqPtr)
  val sew_12       = "b001".U // SEW=2
  val lmul_12      = "b000".U // lmul = 1
  val total_num_12 = 0.U
  val instr_12     = 0x08000000.U // eew = 1
  val pdest_12     = 16.U
  val src0_13      = 0x80000000L.U + 0x6.U
  val src1_13      = 2.U
  val vl_13        = 8.U
  val robIdx_13    = 4.U.asTypeOf(new RobPtr)
  val uopIdx_13    = 0.U
  val lqIdx_13     = 13.U.asTypeOf(new LqPtr)
  val sew_13       = "b010".U //SEW = 4
  val lmul_13      = "b001".U // LMUL = 2
  val total_num_13 = 0.U
  val instr_13     = 0x08005000.U // eew = 2
  val pdest_13     = 17.U

  //index
  val src0_14      = 0x80000000L.U + 0xa.U //14-17
  val src1_14      = "h00002222444466668888aaaaccccceeee".U
  val vl_14        = 32.U
  val robIdx_14    = 5.U.asTypeOf(new RobPtr)
  val uopIdx_14    = 3.U
  val lqIdx_14     = 14.U.asTypeOf(new LqPtr)
  val sew_14       = "b001".U // 2
  val lmul_14      = "b010".U // 4
  val total_num_14 = 3.U
  val instr_14     = 0x0c000000.U //eew = 1
  val pdest_14     = 18.U
  val src0_15      = 0x80000000L.U + 0xa.U
  val src1_15      = "h00002222444466668888aaaaccccceeee".U
  val vl_15        = 32.U
  val robIdx_15    = 5.U.asTypeOf(new RobPtr)
  val uopIdx_15    = 2.U
  val lqIdx_15     = 15.U.asTypeOf(new LqPtr)
  val sew_15       = "b001".U // 2
  val lmul_15      = "b010".U // 4
  val total_num_15 = 3.U
  val instr_15     = 0x0c000000.U //eew = 1
  val pdest_15     = 19.U

  val src0_16      = 0x80000000L.U + 0xa.U
  val src1_16      = "h004444880088cc00cee0022226666aaaa".U
  val vl_16        = 32.U
  val robIdx_16    = 5.U.asTypeOf(new RobPtr)
  val uopIdx_16    = 1.U
  val lqIdx_16     = 16.U.asTypeOf(new LqPtr)
  val sew_16       = "b001".U // 2
  val lmul_16      = "b010".U // 4
  val total_num_16 = 3.U
  val instr_16     = 0x0c000000.U //eew = 1
  val pdest_16     = 20.U
  val src0_17      = 0x80000000L.U + 0xa.U
  val src1_17      = "h004444880088cc00cee0022226666aaaa".U
  val vl_17        = 32.U
  val robIdx_17    = 5.U.asTypeOf(new RobPtr)
  val uopIdx_17    = 0.U
  val lqIdx_17     = 17.U.asTypeOf(new LqPtr)
  val sew_17       = "b001".U // 2
  val lmul_17      = "b010".U // 4
  val total_num_17 = 3.U
  val instr_17     = 0x0c000000.U //eew = 1
  val pdest_17     = 21.U

  val src0_18      = 0x80000000L.U + 0xa.U //18-21
  val src1_18      = "h00112233445566778899aabbccddeeff".U
  val vl_18        = 32.U
  val robIdx_18    = 6.U.asTypeOf(new RobPtr)
  val uopIdx_18    = 0.U
  val lqIdx_18     = 18.U.asTypeOf(new LqPtr)
  val sew_18       = "b000".U // 1
  val lmul_18      = "b001".U // 2
  val total_num_18 = 3.U
  val instr_18     = 0x0c005000.U // eew = 2
  val pdest_18     = 22.U
  val src0_19      = 0x80000000L.U + 0xa.U
  val src1_19      = "h0123456789abcdef0123456789abcdef".U
  val vl_19        = 32.U
  val robIdx_19    = 6.U.asTypeOf(new RobPtr)
  val uopIdx_19    = 1.U
  val lqIdx_19     = 19.U.asTypeOf(new LqPtr)
  val sew_19       = "b000".U // 1
  val lmul_19      = "b001".U // 2
  val total_num_19 = 3.U
  val instr_19     = 0x0c005000.U // eew = 2
  val pdest_19     = 22.U

  val src0_20      = 0x80000000L.U + 0xa.U
  val src1_20      = "h00001111222233334444555566667777".U
  val vl_20        = 32.U
  val robIdx_20    = 6.U.asTypeOf(new RobPtr)
  val uopIdx_20    = 2.U
  val lqIdx_20     = 20.U.asTypeOf(new LqPtr)
  val sew_20       = "b000".U // 1
  val lmul_20      = "b001".U // 2
  val total_num_20 = 3.U
  val instr_20     = 0x0c005000.U // eew = 2
  val pdest_20     = 23.U
  val src0_21      = 0x80000000L.U + 0xa.U
  val src1_21      = "h00001111222233334444555566667777".U
  val vl_21        = 32.U
  val robIdx_21    = 6.U.asTypeOf(new RobPtr)
  val uopIdx_21    = 3.U
  val lqIdx_21     = 21.U.asTypeOf(new LqPtr)
  val sew_21       = "b000".U // 1
  val lmul_21      = "b001".U // 2
  val total_num_21 = 3.U
  val instr_21     = 0x0c005000.U // eew = 2
  val pdest_21     = 23.U

  //segment unit-stride
  val src0_22      = 0x80000000L.U + 0xa.U //22-29
  val src1_22      = LFSR64(seed = Some(3L))(XLEN-1,0)
  val vl_22        = 32.U
  val robIdx_22    = 7.U.asTypeOf(new RobPtr)
  val uopIdx_22    = 0.U
  val lqIdx_22     = 22.U.asTypeOf(new LqPtr)
  val sew_22       = "b010".U //SEW = 4
  val lmul_22      = "b001".U //2
  val total_num_22 = 7.U
  val instr_22     = 0x60006000.U // nf = 4; eew = 4
  val pdest_22     = 24.U
  val src0_23      = 0x80000000L.U + 0xa.U //22-29
  val src1_23      = LFSR64(seed = Some(3L))(XLEN-1,0)
  val vl_23        = 32.U
  val robIdx_23    = 7.U.asTypeOf(new RobPtr)
  val uopIdx_23    = 2.U
  val lqIdx_23     = 23.U.asTypeOf(new LqPtr)
  val sew_23       = "b010".U //SEW = 4
  val lmul_23      = "b001".U //2
  val total_num_23 = 7.U
  val instr_23     = 0x60006000.U // nf = 4; eew = 4
  val pdest_23     = 25.U

  val src0_24      = 0x80000000L.U + 0xa.U //22-29
  val src1_24      = LFSR64(seed = Some(3L))(XLEN-1,0)
  val vl_24        = 32.U
  val robIdx_24    = 7.U.asTypeOf(new RobPtr)
  val uopIdx_24    = 4.U
  val lqIdx_24     = 24.U.asTypeOf(new LqPtr)
  val sew_24       = "b010".U //SEW = 4
  val lmul_24      = "b001".U //2
  val total_num_24 = 7.U
  val instr_24     = 0x60006000.U // nf = 4; eew = 4
  val pdest_24     = 26.U
  val src0_25      = 0x80000000L.U + 0xa.U //22-29
  val src1_25      = LFSR64(seed = Some(3L))(XLEN-1,0)
  val vl_25        = 32.U
  val robIdx_25    = 7.U.asTypeOf(new RobPtr)
  val uopIdx_25    = 6.U
  val lqIdx_25     = 25.U.asTypeOf(new LqPtr)
  val sew_25       = "b010".U //SEW = 4
  val lmul_25      = "b001".U //2
  val total_num_25 = 7.U
  val instr_25     = 0x60006000.U // nf = 4; eew = 4
  val pdest_25     = 27.U

  val src0_26      = 0x80000000L.U + 0xa.U //22-29
  val src1_26      = LFSR64(seed = Some(3L))(XLEN-1,0)
  val vl_26        = 32.U
  val robIdx_26    = 7.U.asTypeOf(new RobPtr)
  val uopIdx_26    = 1.U
  val lqIdx_26     = 26.U.asTypeOf(new LqPtr)
  val sew_26       = "b010".U //SEW = 4
  val lmul_26      = "b001".U //2
  val total_num_26 = 7.U
  val instr_26     = 0x60006000.U // nf = 4; eew = 4
  val pdest_26     = 28.U
  val src0_27      = 0x80000000L.U + 0xa.U //22-29
  val src1_27      = LFSR64(seed = Some(3L))(XLEN-1,0)
  val vl_27        = 32.U
  val robIdx_27    = 7.U.asTypeOf(new RobPtr)
  val uopIdx_27    = 3.U
  val lqIdx_27     = 27.U.asTypeOf(new LqPtr)
  val sew_27       = "b010".U //SEW = 4
  val lmul_27      = "b001".U //2
  val total_num_27 = 7.U
  val instr_27     = 0x60006000.U // nf = 4; eew = 4
  val pdest_27     = 29.U

  val src0_28      = 0x80000000L.U + 0xa.U //22-29
  val src1_28      = LFSR64(seed = Some(3L))(XLEN-1,0)
  val vl_28        = 32.U
  val robIdx_28    = 7.U.asTypeOf(new RobPtr)
  val uopIdx_28    = 5.U
  val lqIdx_28     = 28.U.asTypeOf(new LqPtr)
  val sew_28       = "b010".U //SEW = 4
  val lmul_28      = "b001".U //2
  val total_num_28 = 7.U
  val instr_28     = 0x60006000.U // nf = 4; eew = 4
  val pdest_28     = 30.U
  val src0_29      = 0x80000000L.U + 0xa.U //22-29
  val src1_29      = LFSR64(seed = Some(3L))(XLEN-1,0)
  val vl_29        = 32.U
  val robIdx_29    = 7.U.asTypeOf(new RobPtr)
  val uopIdx_29    = 7.U
  val lqIdx_29     = 29.U.asTypeOf(new LqPtr)
  val sew_29       = "b010".U //SEW = 4
  val lmul_29      = "b001".U //2
  val total_num_29 = 7.U
  val instr_29     = 0x60006000.U // nf = 4; eew = 4
  val pdest_29     = 31.U

  //segment stride
  val src0_30      = 0x80000000L.U + 0x4.U //30-31
  val src1_30      = 8.U
  val vl_30        = 16.U
  val robIdx_30    = 8.U.asTypeOf(new RobPtr)
  val uopIdx_30    = 0.U
  val lqIdx_30     = 30.U.asTypeOf(new LqPtr)
  val sew_30       = "b010".U // 4
  val lmul_30      = "b001".U // 2
  val total_num_30 = 1.U
  val instr_30     = 0x28005000.U // nf = 2; eew = 2
  val pdest_30     = 5.U
  val src0_31      = 0x80000000L.U + 0x4.U //30-31
  val src1_31      = 8.U
  val vl_31        = 16.U
  val robIdx_31    = 8.U.asTypeOf(new RobPtr)
  val uopIdx_31    = 1.U
  val lqIdx_31     = 31.U.asTypeOf(new LqPtr)
  val sew_31       = "b010".U // 4
  val lmul_31      = "b001".U // 2
  val total_num_31 = 1.U
  val instr_31     = 0x28005000.U // nf = 2; eew = 2
  val pdest_31     = 6.U

  //segment index
  val src0_32      = 0x80000000L.U + 0xc.U //32-35
  val src1_32      = "h222244448888aaaa222244448888aaaa".U
  val vl_32        = 16.U
  val robIdx_32    = 9.U.asTypeOf(new RobPtr)
  val uopIdx_32    = 0.U
  val lqIdx_32     = 32.U.asTypeOf(new LqPtr)
  val sew_32       = "b001".U //SEW = 2
  val lmul_32      = "b000".U //LMUL = 1
  val total_num_32 = 3.U
  val instr_32     = 0x2c006000.U // nf =2; eew= 4
  val pdest_32     = 7.U
  val src0_33      = 0x80000000L.U + 0xc.U //32-35
  val src1_33      = "h222244448888aaaa222244448888aaaa".U
  val vl_33        = 16.U
  val robIdx_33    = 9.U.asTypeOf(new RobPtr)
  val uopIdx_33    = 1.U
  val lqIdx_33     = 33.U.asTypeOf(new LqPtr)
  val sew_33       = "b001".U //SEW = 2
  val lmul_33      = "b000".U //LMUL = 1
  val total_num_33 = 3.U
  val instr_33     = 0x2c006000.U // nf =2; eew= 4
  val pdest_33     = 7.U

  val src0_34      = 0x80000000L.U + 0xc.U //32-35
  val src1_34      = "h8888aaaaccccceeee0000222244446666".U
  val vl_34        = 16.U
  val robIdx_34    = 9.U.asTypeOf(new RobPtr)
  val uopIdx_34    = 2.U
  val lqIdx_34     = 34.U.asTypeOf(new LqPtr)
  val sew_34       = "b001".U //SEW = 2
  val lmul_34      = "b000".U //LMUL = 1
  val total_num_34 = 3.U
  val instr_34     = 0x2c006000.U // nf =2; eew= 4
  val pdest_34     = 8.U
  val src0_35      = 0x80000000L.U + 0xc.U //32-35
  val src1_35      = "h8888aaaaccccceeee0000222244446666".U
  val vl_35        = 16.U
  val robIdx_35    = 9.U.asTypeOf(new RobPtr)
  val uopIdx_35    = 3.U
  val lqIdx_35     = 35.U.asTypeOf(new LqPtr)
  val sew_35       = "b001".U //SEW = 2
  val lmul_35      = "b000".U //LMUL = 1
  val total_num_35 = 3.U
  val instr_35     = 0x2c006000.U // nf =2; eew= 4
  val pdest_35     = 8.U

  val src0_36      = 0x80000000L.U + 0x8.U //36-37
  val src1_36      = "h88880000888800008888000088880000".U
  val vl_36        = 4.U
  val robIdx_36    = 10.U.asTypeOf(new RobPtr)
  val uopIdx_36    = 0.U
  val lqIdx_36     = 36.U.asTypeOf(new LqPtr)
  val sew_36       = "b011".U //8
  val lmul_36      = "b000".U // 1
  val total_num_36 = 1.U
  val instr_36     = 0x2c006000.U // nf =2; eew= 1
  val pdest_36     = 11.U
  val src0_37      = 0x80000000L.U + 0x8.U //36-37
  val src1_37      = "h88880000888800008888000088880000".U
  val vl_37        = 4.U
  val robIdx_37    = 10.U.asTypeOf(new RobPtr)
  val uopIdx_37    = 1.U
  val lqIdx_37     = 37.U.asTypeOf(new LqPtr)
  val sew_37       = "b011".U //8
  val lmul_37      = "b000".U // 1
  val total_num_37 = 1.U
  val instr_37     = 0x2c006000.U // nf =2; eew= 1
  val pdest_37     = 12.U

    switch (state_0) {
    is (s_idle) {
      when (counter === 100.U) {
        loadRegIn_valid(0)     := true.B
      }.otherwise {
        loadRegIn_valid(0)     := false.B
      }
      loadRegIn(0).src(0)                       := src0_0 //baseAddr
      loadRegIn(0).src(1)                       := src1_0 //stride, index
      loadRegIn(0).uop.ctrl.vconfig.vl          := vl_0
      loadRegIn(0).uop.robIdx                   := robIdx_0
      loadRegIn(0).uop.ctrl.uopIdx              := uopIdx_0
      loadRegIn(0).uop.lqIdx                    := lqIdx_0
      loadRegIn(0).uop.ctrl.vconfig.vtype.vsew  := sew_0
      loadRegIn(0).uop.ctrl.vconfig.vtype.vlmul := lmul_0
      loadRegIn(0).uop.ctrl.total_num           := total_num_0
      loadRegIn(0).uop.cf.instr                 := instr_0
      loadRegIn(0).uop.pdest                    := pdest_0
      when (counter === 101.U) {
        state_0 := s_1
      }
    }
    is (s_1) {
      loadRegIn_valid(0)     := true.B
      loadRegIn(0).src(0)                       := src0_2
      loadRegIn(0).src(1)                       := src1_2
      loadRegIn(0).uop.ctrl.vconfig.vl          := vl_2
      loadRegIn(0).uop.robIdx                   := robIdx_2
      loadRegIn(0).uop.ctrl.uopIdx              := uopIdx_2
      loadRegIn(0).uop.lqIdx                    := lqIdx_2
      loadRegIn(0).uop.ctrl.vconfig.vtype.vsew  := sew_2
      loadRegIn(0).uop.ctrl.vconfig.vtype.vlmul := lmul_2
      loadRegIn(0).uop.ctrl.total_num           := total_num_2
      loadRegIn(0).uop.cf.instr                 := instr_2
      loadRegIn(0).uop.pdest                    := pdest_2
      state_0 := s_2
    }
    is (s_2) {
      when (counter === 200.U) {
        loadRegIn_valid(0)     := true.B
      }.otherwise {
        loadRegIn_valid(0)     := false.B
      }
      loadRegIn(0).src(0)                        := src0_4
      loadRegIn(0).src(1)                        := src1_4
      loadRegIn(0).uop.ctrl.vconfig.vl           := vl_4
      loadRegIn(0).uop.robIdx                    := robIdx_4
      loadRegIn(0).uop.ctrl.uopIdx               := uopIdx_4
      loadRegIn(0).uop.lqIdx                     := lqIdx_4
      loadRegIn(0).uop.ctrl.vconfig.vtype.vsew   := sew_4
      loadRegIn(0).uop.ctrl.vconfig.vtype.vlmul  := lmul_4
      loadRegIn(0).uop.ctrl.total_num            := total_num_4
      loadRegIn(0).uop.cf.instr                  := instr_4
      loadRegIn(0).uop.pdest                     := pdest_4
      when (counter === 201.U) {
        state_0 := s_3
      }
    }
    is (s_3) {
      loadRegIn_valid(0)     := true.B
      loadRegIn(0).src(0)                       := src0_6
      loadRegIn(0).src(1)                       := src1_6
      loadRegIn(0).uop.ctrl.vconfig.vl          := vl_6
      loadRegIn(0).uop.robIdx                   := robIdx_6
      loadRegIn(0).uop.ctrl.uopIdx              := uopIdx_6
      loadRegIn(0).uop.lqIdx                    := lqIdx_6
      loadRegIn(0).uop.ctrl.vconfig.vtype.vsew  := sew_6
      loadRegIn(0).uop.ctrl.vconfig.vtype.vlmul := lmul_6
      loadRegIn(0).uop.ctrl.total_num           := total_num_6
      loadRegIn(0).uop.cf.instr                 := instr_6
      loadRegIn(0).uop.pdest                    := pdest_6

      state_0 := s_4
    }
    is (s_4) {
      when (counter === 300.U) {
        loadRegIn_valid(0)     := true.B
      }.otherwise {
        loadRegIn_valid(0)     := false.B
      }
      loadRegIn(0).src(0)                       := src0_8
      loadRegIn(0).src(1)                       := src1_8
      loadRegIn(0).uop.ctrl.vconfig.vl          := vl_8
      loadRegIn(0).uop.robIdx                   := robIdx_8
      loadRegIn(0).uop.ctrl.uopIdx              := uopIdx_8
      loadRegIn(0).uop.lqIdx                    := lqIdx_8
      loadRegIn(0).uop.ctrl.vconfig.vtype.vsew  := sew_8
      loadRegIn(0).uop.ctrl.vconfig.vtype.vlmul := lmul_8
      loadRegIn(0).uop.ctrl.total_num           := total_num_8
      loadRegIn(0).uop.cf.instr                 := instr_8
      loadRegIn(0).uop.pdest                    := pdest_8

      when (counter === 301.U) {
        state_0 := s_5
      }
    }
    is (s_5) {
      loadRegIn_valid(0)     := true.B
      loadRegIn(0).src(0)                       := src0_10
      loadRegIn(0).src(1)                       := src1_10
      loadRegIn(0).uop.ctrl.vconfig.vl          := vl_10
      loadRegIn(0).uop.robIdx                   := robIdx_10
      loadRegIn(0).uop.ctrl.uopIdx              := uopIdx_10
      loadRegIn(0).uop.lqIdx                    := lqIdx_10
      loadRegIn(0).uop.ctrl.vconfig.vtype.vsew  := sew_10
      loadRegIn(0).uop.ctrl.vconfig.vtype.vlmul := lmul_10
      loadRegIn(0).uop.ctrl.total_num           := total_num_10
      loadRegIn(0).uop.cf.instr                 := instr_10
      loadRegIn(0).uop.pdest                    := pdest_10
      state_0 := s_6
    }
    is (s_6) {
      when (counter === 400.U) {
        loadRegIn_valid(0)     := true.B
      }.otherwise {
        loadRegIn_valid(0)     := false.B
      }
      loadRegIn(0).src(0)                       := src0_12
      loadRegIn(0).src(1)                       := src1_12
      loadRegIn(0).uop.ctrl.vconfig.vl          := vl_12
      loadRegIn(0).uop.robIdx                   := robIdx_12
      loadRegIn(0).uop.ctrl.uopIdx              := uopIdx_12
      loadRegIn(0).uop.lqIdx                    := lqIdx_12
      loadRegIn(0).uop.ctrl.vconfig.vtype.vsew  := sew_12
      loadRegIn(0).uop.ctrl.vconfig.vtype.vlmul := lmul_12
      loadRegIn(0).uop.ctrl.total_num           := total_num_12
      loadRegIn(0).uop.cf.instr                 := instr_12
      loadRegIn(0).uop.pdest                    := pdest_12
      when (counter === 401.U) {
        state_0 := s_7
      }
    }
    is (s_7) {
      loadRegIn_valid(0)     := true.B
      loadRegIn(0).src(0)                       := src0_14
      loadRegIn(0).src(1)                       := src1_14
      loadRegIn(0).uop.ctrl.vconfig.vl          := vl_14
      loadRegIn(0).uop.robIdx                   := robIdx_14
      loadRegIn(0).uop.ctrl.uopIdx              := uopIdx_14
      loadRegIn(0).uop.lqIdx                    := lqIdx_14
      loadRegIn(0).uop.ctrl.vconfig.vtype.vsew  := sew_14
      loadRegIn(0).uop.ctrl.vconfig.vtype.vlmul := lmul_14
      loadRegIn(0).uop.ctrl.total_num           := total_num_14
      loadRegIn(0).uop.cf.instr                 := instr_14
      loadRegIn(0).uop.pdest                    := pdest_14
      state_0 := s_8
    }
    is (s_8) {
      when (counter === 500.U) {
        loadRegIn_valid(0)     := true.B
      }.otherwise {
        loadRegIn_valid(0)     := false.B
      }
      loadRegIn(0).src(0)                       := src0_16
      loadRegIn(0).src(1)                       := src1_16
      loadRegIn(0).uop.ctrl.vconfig.vl          := vl_16
      loadRegIn(0).uop.robIdx                   := robIdx_16
      loadRegIn(0).uop.ctrl.uopIdx              := uopIdx_16
      loadRegIn(0).uop.lqIdx                    := lqIdx_16
      loadRegIn(0).uop.ctrl.vconfig.vtype.vsew  := sew_16
      loadRegIn(0).uop.ctrl.vconfig.vtype.vlmul := lmul_16
      loadRegIn(0).uop.ctrl.total_num           := total_num_16
      loadRegIn(0).uop.cf.instr                 := instr_16
      loadRegIn(0).uop.pdest                    := pdest_16
      when (counter === 501.U) {
        state_0 := s_9
      }
    }
    is (s_9) {
      loadRegIn_valid(0)     := true.B
      loadRegIn(0).src(0)                       := src0_18
      loadRegIn(0).src(1)                       := src1_18
      loadRegIn(0).uop.ctrl.vconfig.vl          := vl_18
      loadRegIn(0).uop.robIdx                   := robIdx_18
      loadRegIn(0).uop.ctrl.uopIdx              := uopIdx_18
      loadRegIn(0).uop.lqIdx                    := lqIdx_18
      loadRegIn(0).uop.ctrl.vconfig.vtype.vsew  := sew_18
      loadRegIn(0).uop.ctrl.vconfig.vtype.vlmul := lmul_18
      loadRegIn(0).uop.ctrl.total_num           := total_num_18
      loadRegIn(0).uop.cf.instr                 := instr_18
      loadRegIn(0).uop.pdest                    := pdest_18
      state_0 := s_10
    }
    is (s_10) {
      when (counter === 600.U) {
        loadRegIn_valid(0)     := true.B
      }.otherwise {
        loadRegIn_valid(0)     := false.B
      }
      loadRegIn(0).src(0)                       := src0_20
      loadRegIn(0).src(1)                       := src1_20
      loadRegIn(0).uop.ctrl.vconfig.vl          := vl_20
      loadRegIn(0).uop.robIdx                   := robIdx_20
      loadRegIn(0).uop.ctrl.uopIdx              := uopIdx_20
      loadRegIn(0).uop.lqIdx                    := lqIdx_20
      loadRegIn(0).uop.ctrl.vconfig.vtype.vsew  := sew_20
      loadRegIn(0).uop.ctrl.vconfig.vtype.vlmul := lmul_20
      loadRegIn(0).uop.ctrl.total_num           := total_num_20
      loadRegIn(0).uop.cf.instr                 := instr_20
      loadRegIn(0).uop.pdest                    := pdest_20
      when (counter === 601.U) {
        state_0 := s_11
      }
    }
    is (s_11) {
      loadRegIn_valid(0)     := true.B
      loadRegIn(0).src(0)                       := src0_22
      loadRegIn(0).src(1)                       := src1_22
      loadRegIn(0).uop.ctrl.vconfig.vl          := vl_22
      loadRegIn(0).uop.robIdx                   := robIdx_22
      loadRegIn(0).uop.ctrl.uopIdx              := uopIdx_22
      loadRegIn(0).uop.lqIdx                    := lqIdx_22
      loadRegIn(0).uop.ctrl.vconfig.vtype.vsew  := sew_22
      loadRegIn(0).uop.ctrl.vconfig.vtype.vlmul := lmul_22
      loadRegIn(0).uop.ctrl.total_num           := total_num_22
      loadRegIn(0).uop.cf.instr                 := instr_22
      loadRegIn(0).uop.pdest                    := pdest_22
      state_0 := s_12
    }
    is (s_12) {
      when (counter === 700.U) {
        loadRegIn_valid(0)     := true.B
      }.otherwise {
        loadRegIn_valid(0)     := false.B
      }
      loadRegIn(0).src(0)                       := src0_24
      loadRegIn(0).src(1)                       := src1_24
      loadRegIn(0).uop.ctrl.vconfig.vl          := vl_24
      loadRegIn(0).uop.robIdx                   := robIdx_24
      loadRegIn(0).uop.ctrl.uopIdx              := uopIdx_24
      loadRegIn(0).uop.lqIdx                    := lqIdx_24
      loadRegIn(0).uop.ctrl.vconfig.vtype.vsew  := sew_24
      loadRegIn(0).uop.ctrl.vconfig.vtype.vlmul := lmul_24
      loadRegIn(0).uop.ctrl.total_num           := total_num_24
      loadRegIn(0).uop.cf.instr                 := instr_24
      loadRegIn(0).uop.pdest                    := pdest_24
      when (counter === 701.U) {
        state_0 := s_13
      }
    }
    is (s_13) {
      loadRegIn_valid(0)     := true.B
      loadRegIn(0).src(0)                       := src0_26
      loadRegIn(0).src(1)                       := src1_26
      loadRegIn(0).uop.ctrl.vconfig.vl          := vl_26
      loadRegIn(0).uop.robIdx                   := robIdx_26
      loadRegIn(0).uop.ctrl.uopIdx              := uopIdx_26
      loadRegIn(0).uop.lqIdx                    := lqIdx_26
      loadRegIn(0).uop.ctrl.vconfig.vtype.vsew  := sew_26
      loadRegIn(0).uop.ctrl.vconfig.vtype.vlmul := lmul_26
      loadRegIn(0).uop.ctrl.total_num           := total_num_26
      loadRegIn(0).uop.cf.instr                 := instr_26
      loadRegIn(0).uop.pdest                    := pdest_26
      state_0 := s_14
    }
    is (s_14) {
      when (counter === 800.U) {
        loadRegIn_valid(0)     := true.B
      }.otherwise {
        loadRegIn_valid(0)     := false.B
      }
      loadRegIn(0).src(0)                       := src0_28
      loadRegIn(0).src(1)                       := src1_28
      loadRegIn(0).uop.ctrl.vconfig.vl          := vl_28
      loadRegIn(0).uop.robIdx                   := robIdx_28
      loadRegIn(0).uop.ctrl.uopIdx              := uopIdx_28
      loadRegIn(0).uop.lqIdx                    := lqIdx_28
      loadRegIn(0).uop.ctrl.vconfig.vtype.vsew  := sew_28
      loadRegIn(0).uop.ctrl.vconfig.vtype.vlmul := lmul_28
      loadRegIn(0).uop.ctrl.total_num           := total_num_28
      loadRegIn(0).uop.cf.instr                 := instr_28
      loadRegIn(0).uop.pdest                    := pdest_28

      when (counter === 801.U) {
        state_0 := s_15
      }
    }
    is (s_15) {
      loadRegIn_valid(0)     := true.B
      loadRegIn(0).src(0)                       := src0_30
      loadRegIn(0).src(1)                       := src1_30
      loadRegIn(0).uop.ctrl.vconfig.vl          := vl_30
      loadRegIn(0).uop.robIdx                   := robIdx_30
      loadRegIn(0).uop.ctrl.uopIdx              := uopIdx_30
      loadRegIn(0).uop.lqIdx                    := lqIdx_30
      loadRegIn(0).uop.ctrl.vconfig.vtype.vsew  := sew_30
      loadRegIn(0).uop.ctrl.vconfig.vtype.vlmul := lmul_30
      loadRegIn(0).uop.ctrl.total_num           := total_num_30
      loadRegIn(0).uop.cf.instr                 := instr_30
      loadRegIn(0).uop.pdest                    := pdest_30
      state_0 := s_16
    }
    is (s_16) {
      when (counter === 900.U) {
        loadRegIn_valid(0)     := true.B
      }.otherwise {
        loadRegIn_valid(0)     := false.B
      }
      loadRegIn(0).src(0)                       := src0_32
      loadRegIn(0).src(1)                       := src1_32
      loadRegIn(0).uop.ctrl.vconfig.vl          := vl_32
      loadRegIn(0).uop.robIdx                   := robIdx_32
      loadRegIn(0).uop.ctrl.uopIdx              := uopIdx_32
      loadRegIn(0).uop.lqIdx                    := lqIdx_32
      loadRegIn(0).uop.ctrl.vconfig.vtype.vsew  := sew_32
      loadRegIn(0).uop.ctrl.vconfig.vtype.vlmul := lmul_32
      loadRegIn(0).uop.ctrl.total_num           := total_num_32
      loadRegIn(0).uop.cf.instr                 := instr_32
      loadRegIn(0).uop.pdest                    := pdest_32
      when (counter === 901.U) {
        state_0 := s_17
      }
    }
    is (s_17) {
      loadRegIn_valid(0)     := true.B
      loadRegIn(0).src(0)                       := src0_34
      loadRegIn(0).src(1)                       := src1_34
      loadRegIn(0).uop.ctrl.vconfig.vl          := vl_34
      loadRegIn(0).uop.robIdx                   := robIdx_34
      loadRegIn(0).uop.ctrl.uopIdx              := uopIdx_34
      loadRegIn(0).uop.lqIdx                    := lqIdx_34
      loadRegIn(0).uop.ctrl.vconfig.vtype.vsew  := sew_34
      loadRegIn(0).uop.ctrl.vconfig.vtype.vlmul := lmul_34
      loadRegIn(0).uop.ctrl.total_num           := total_num_34
      loadRegIn(0).uop.cf.instr                 := instr_34
      loadRegIn(0).uop.pdest                    := pdest_34

      state_0 := s_18
    }
    is (s_18) {
      when (counter === 1000.U) {
        loadRegIn_valid(0)     := true.B
      }.otherwise {
        loadRegIn_valid(0)     := false.B
      }
      loadRegIn(0).src(0)                        := src0_36
      loadRegIn(0).src(1)                        := src1_36
      loadRegIn(0).uop.ctrl.vconfig.vl           := vl_36
      loadRegIn(0).uop.robIdx                    := robIdx_36
      loadRegIn(0).uop.ctrl.uopIdx               := uopIdx_36
      loadRegIn(0).uop.lqIdx                     := lqIdx_36
      loadRegIn(0).uop.ctrl.vconfig.vtype.vsew   := sew_36
      loadRegIn(0).uop.ctrl.vconfig.vtype.vlmul  := lmul_36
      loadRegIn(0).uop.ctrl.total_num            := total_num_36
      loadRegIn(0).uop.cf.instr                  := instr_36
      loadRegIn(0).uop.pdest                     := pdest_36
      when (counter === 1001.U) {
        state_0 := s_idle
      }
    }
  }



  switch (state_1) {
    is (s_idle) {
      when (counter === 100.U) {
        loadRegIn_valid(1)     := true.B
      }.otherwise {
        loadRegIn_valid(1)     := false.B
      }
      loadRegIn(1).src(0)                        := src0_1
      loadRegIn(1).src(1)                        := src1_1
      loadRegIn(1).uop.ctrl.vconfig.vl           := vl_1
      loadRegIn(1).uop.robIdx                    := robIdx_1
      loadRegIn(1).uop.ctrl.uopIdx               := uopIdx_1
      loadRegIn(1).uop.lqIdx                     := lqIdx_1
      loadRegIn(1).uop.ctrl.vconfig.vtype.vsew   := sew_1
      loadRegIn(1).uop.ctrl.vconfig.vtype.vlmul  := lmul_1
      loadRegIn(1).uop.ctrl.total_num            := total_num_1
      loadRegIn(1).uop.cf.instr                  := instr_1
      loadRegIn(1).uop.pdest                     := pdest_1

      when (counter === 101.U) {
        state_1 := s_1
      }
    }
    is (s_1) {
      loadRegIn_valid(1)     := true.B
      loadRegIn(1).src(0)                        := src0_3
      loadRegIn(1).src(1)                        := src1_3
      loadRegIn(1).uop.ctrl.vconfig.vl           := vl_3
      loadRegIn(1).uop.robIdx                    := robIdx_3
      loadRegIn(1).uop.ctrl.uopIdx               := uopIdx_3
      loadRegIn(1).uop.lqIdx                     := lqIdx_3
      loadRegIn(1).uop.ctrl.vconfig.vtype.vsew   := sew_3
      loadRegIn(1).uop.ctrl.vconfig.vtype.vlmul  := lmul_3
      loadRegIn(1).uop.ctrl.total_num            := total_num_3
      loadRegIn(1).uop.cf.instr                  := instr_3
      loadRegIn(1).uop.pdest                     := pdest_3

      state_1 := s_2
    }
    is (s_2) {
      when (counter === 200.U) {
        loadRegIn_valid(1)     := true.B
      }.otherwise {
        loadRegIn_valid(1)     := false.B
      }
      loadRegIn(1).src(0)                        := src0_5
      loadRegIn(1).src(1)                        := src1_5
      loadRegIn(1).uop.ctrl.vconfig.vl           := vl_5
      loadRegIn(1).uop.robIdx                    := robIdx_5
      loadRegIn(1).uop.ctrl.uopIdx               := uopIdx_5
      loadRegIn(1).uop.lqIdx                     := lqIdx_5
      loadRegIn(1).uop.ctrl.vconfig.vtype.vsew   := sew_5
      loadRegIn(1).uop.ctrl.vconfig.vtype.vlmul  := lmul_5
      loadRegIn(1).uop.ctrl.total_num            := total_num_5
      loadRegIn(1).uop.cf.instr                  := instr_5
      loadRegIn(1).uop.pdest                     := pdest_5

      when (counter === 201.U) {
        state_1 := s_3
      }
    }
    is (s_3) {
      loadRegIn_valid(1)     := true.B
      loadRegIn(1).src(0)                        := src0_7
      loadRegIn(1).src(1)                        := src1_7
      loadRegIn(1).uop.ctrl.vconfig.vl           := vl_7
      loadRegIn(1).uop.robIdx                    := robIdx_7
      loadRegIn(1).uop.ctrl.uopIdx               := uopIdx_7
      loadRegIn(1).uop.lqIdx                     := lqIdx_7
      loadRegIn(1).uop.ctrl.vconfig.vtype.vsew   := sew_7
      loadRegIn(1).uop.ctrl.vconfig.vtype.vlmul  := lmul_7
      loadRegIn(1).uop.ctrl.total_num            := total_num_7
      loadRegIn(1).uop.cf.instr                  := instr_7
      loadRegIn(1).uop.pdest                     := pdest_7
      state_1 := s_4
    }
    is (s_4) {
      when (counter === 300.U) {
        loadRegIn_valid(1)     := true.B
      }.otherwise {
        loadRegIn_valid(1)     := false.B
      }
      loadRegIn(1).src(0)                        := src0_9
      loadRegIn(1).src(1)                        := src1_9
      loadRegIn(1).uop.ctrl.vconfig.vl           := vl_9
      loadRegIn(1).uop.robIdx                    := robIdx_9
      loadRegIn(1).uop.ctrl.uopIdx               := uopIdx_9
      loadRegIn(1).uop.lqIdx                     := lqIdx_9
      loadRegIn(1).uop.ctrl.vconfig.vtype.vsew   := sew_9
      loadRegIn(1).uop.ctrl.vconfig.vtype.vlmul  := lmul_9
      loadRegIn(1).uop.ctrl.total_num            := total_num_9
      loadRegIn(1).uop.cf.instr                  := instr_9
      loadRegIn(1).uop.pdest                     := pdest_9
      when (counter === 301.U) {
        state_1 := s_5
      }
    }
    is (s_5) {
      loadRegIn_valid(1)     := true.B
      loadRegIn(1).src(0)                        := src0_11
      loadRegIn(1).src(1)                        := src1_11
      loadRegIn(1).uop.ctrl.vconfig.vl           := vl_11
      loadRegIn(1).uop.robIdx                    := robIdx_11
      loadRegIn(1).uop.ctrl.uopIdx               := uopIdx_11
      loadRegIn(1).uop.lqIdx                     := lqIdx_11
      loadRegIn(1).uop.ctrl.vconfig.vtype.vsew   := sew_11
      loadRegIn(1).uop.ctrl.vconfig.vtype.vlmul  := lmul_11
      loadRegIn(1).uop.ctrl.total_num            := total_num_11
      loadRegIn(1).uop.cf.instr                  := instr_11
      loadRegIn(1).uop.pdest                     := pdest_11

      state_1 := s_6
    }
    is (s_6) {
      when (counter === 400.U) {
        loadRegIn_valid(1)     := true.B
      }.otherwise {
        loadRegIn_valid(1)     := false.B
      }
      loadRegIn(1).src(0)                        := src0_13
      loadRegIn(1).src(1)                        := src1_13
      loadRegIn(1).uop.ctrl.vconfig.vl           := vl_13
      loadRegIn(1).uop.robIdx                    := robIdx_13
      loadRegIn(1).uop.ctrl.uopIdx               := uopIdx_13
      loadRegIn(1).uop.lqIdx                     := lqIdx_13
      loadRegIn(1).uop.ctrl.vconfig.vtype.vsew   := sew_13
      loadRegIn(1).uop.ctrl.vconfig.vtype.vlmul  := lmul_13
      loadRegIn(1).uop.ctrl.total_num            := total_num_13
      loadRegIn(1).uop.cf.instr                  := instr_13
      loadRegIn(1).uop.pdest                     := pdest_13
      when (counter === 401.U) {
        state_1 := s_7
      }
    }
    is (s_7) {
      loadRegIn_valid(1)     := true.B
      loadRegIn(1).src(0)                        := src0_15
      loadRegIn(1).src(1)                        := src1_15
      loadRegIn(1).uop.ctrl.vconfig.vl           := vl_15
      loadRegIn(1).uop.robIdx                    := robIdx_15
      loadRegIn(1).uop.ctrl.uopIdx               := uopIdx_15
      loadRegIn(1).uop.lqIdx                     := lqIdx_15
      loadRegIn(1).uop.ctrl.vconfig.vtype.vsew   := sew_15
      loadRegIn(1).uop.ctrl.vconfig.vtype.vlmul  := lmul_15
      loadRegIn(1).uop.ctrl.total_num            := total_num_15
      loadRegIn(1).uop.cf.instr                  := instr_15
      loadRegIn(1).uop.pdest                     := pdest_15
      state_1 := s_8
    }
    is (s_8) {
      when (counter === 500.U) {
        loadRegIn_valid(1)     := true.B
      }.otherwise {
        loadRegIn_valid(1)     := false.B
      }
      loadRegIn(1).src(0)                        := src0_17
      loadRegIn(1).src(1)                        := src1_17
      loadRegIn(1).uop.ctrl.vconfig.vl           := vl_17
      loadRegIn(1).uop.robIdx                    := robIdx_17
      loadRegIn(1).uop.ctrl.uopIdx               := uopIdx_17
      loadRegIn(1).uop.lqIdx                     := lqIdx_17
      loadRegIn(1).uop.ctrl.vconfig.vtype.vsew   := sew_17
      loadRegIn(1).uop.ctrl.vconfig.vtype.vlmul  := lmul_17
      loadRegIn(1).uop.ctrl.total_num            := total_num_17
      loadRegIn(1).uop.cf.instr                  := instr_17
      loadRegIn(1).uop.pdest                     := pdest_17

      when (counter === 501.U) {
        state_1 := s_9
      }
    }
    is (s_9) {
      loadRegIn_valid(1)     := true.B
      loadRegIn(1).src(0)                        := src0_19
      loadRegIn(1).src(1)                        := src1_19
      loadRegIn(1).uop.ctrl.vconfig.vl           := vl_19
      loadRegIn(1).uop.robIdx                    := robIdx_19
      loadRegIn(1).uop.ctrl.uopIdx               := uopIdx_19
      loadRegIn(1).uop.lqIdx                     := lqIdx_19
      loadRegIn(1).uop.ctrl.vconfig.vtype.vsew   := sew_19
      loadRegIn(1).uop.ctrl.vconfig.vtype.vlmul  := lmul_19
      loadRegIn(1).uop.ctrl.total_num            := total_num_19
      loadRegIn(1).uop.cf.instr                  := instr_19
      loadRegIn(1).uop.pdest                     := pdest_19
      state_1 := s_10
    }
    is (s_10) {
      when (counter === 600.U) {
        loadRegIn_valid(1)     := true.B
      }.otherwise {
        loadRegIn_valid(1)     := false.B
      }
      loadRegIn(1).src(0)                        := src0_21
      loadRegIn(1).src(1)                        := src1_21
      loadRegIn(1).uop.ctrl.vconfig.vl           := vl_21
      loadRegIn(1).uop.robIdx                    := robIdx_21
      loadRegIn(1).uop.ctrl.uopIdx               := uopIdx_21
      loadRegIn(1).uop.lqIdx                     := lqIdx_21
      loadRegIn(1).uop.ctrl.vconfig.vtype.vsew   := sew_21
      loadRegIn(1).uop.ctrl.vconfig.vtype.vlmul  := lmul_21
      loadRegIn(1).uop.ctrl.total_num            := total_num_21
      loadRegIn(1).uop.cf.instr                  := instr_21
      loadRegIn(1).uop.pdest                     := pdest_21
      when (counter === 601.U) {
        state_1 := s_11
      }
    }
    is (s_11) {
      loadRegIn_valid(1)     := true.B
      loadRegIn(1).src(0)                        := src0_23
      loadRegIn(1).src(1)                        := src1_23
      loadRegIn(1).uop.ctrl.vconfig.vl           := vl_23
      loadRegIn(1).uop.robIdx                    := robIdx_23
      loadRegIn(1).uop.ctrl.uopIdx               := uopIdx_23
      loadRegIn(1).uop.lqIdx                     := lqIdx_23
      loadRegIn(1).uop.ctrl.vconfig.vtype.vsew   := sew_23
      loadRegIn(1).uop.ctrl.vconfig.vtype.vlmul  := lmul_23
      loadRegIn(1).uop.ctrl.total_num            := total_num_23
      loadRegIn(1).uop.cf.instr                  := instr_23
      loadRegIn(1).uop.pdest                     := pdest_23
      state_1 := s_12
    }
    is (s_12) {
      when (counter === 700.U) {
        loadRegIn_valid(1)     := true.B
      }.otherwise {
        loadRegIn_valid(1)     := false.B
      }
      loadRegIn(1).src(0)                        := src0_25
      loadRegIn(1).src(1)                        := src1_25
      loadRegIn(1).uop.ctrl.vconfig.vl           := vl_25
      loadRegIn(1).uop.robIdx                    := robIdx_25
      loadRegIn(1).uop.ctrl.uopIdx               := uopIdx_25
      loadRegIn(1).uop.lqIdx                     := lqIdx_25
      loadRegIn(1).uop.ctrl.vconfig.vtype.vsew   := sew_25
      loadRegIn(1).uop.ctrl.vconfig.vtype.vlmul  := lmul_25
      loadRegIn(1).uop.ctrl.total_num            := total_num_25
      loadRegIn(1).uop.cf.instr                  := instr_25
      loadRegIn(1).uop.pdest                     := pdest_25
      when (counter === 701.U) {
        state_1 := s_13
      }
    }
    is (s_13) {
      loadRegIn_valid(1)     := true.B
      loadRegIn(1).src(0)                        := src0_27
      loadRegIn(1).src(1)                        := src1_27
      loadRegIn(1).uop.ctrl.vconfig.vl           := vl_27
      loadRegIn(1).uop.robIdx                    := robIdx_27
      loadRegIn(1).uop.ctrl.uopIdx               := uopIdx_27
      loadRegIn(1).uop.lqIdx                     := lqIdx_27
      loadRegIn(1).uop.ctrl.vconfig.vtype.vsew   := sew_27
      loadRegIn(1).uop.ctrl.vconfig.vtype.vlmul  := lmul_27
      loadRegIn(1).uop.ctrl.total_num            := total_num_27
      loadRegIn(1).uop.cf.instr                  := instr_27
      loadRegIn(1).uop.pdest                     := pdest_27
      state_1 := s_14
    }
    is (s_14) {
      when (counter === 800.U) {
        loadRegIn_valid(1)     := true.B
      }.otherwise {
        loadRegIn_valid(1)     := false.B
      }

      loadRegIn(1).src(0)                        := src0_29
      loadRegIn(1).src(1)                        := src1_29
      loadRegIn(1).uop.ctrl.vconfig.vl           := vl_29
      loadRegIn(1).uop.robIdx                    := robIdx_29
      loadRegIn(1).uop.ctrl.uopIdx               := uopIdx_29
      loadRegIn(1).uop.lqIdx                     := lqIdx_29
      loadRegIn(1).uop.ctrl.vconfig.vtype.vsew   := sew_29
      loadRegIn(1).uop.ctrl.vconfig.vtype.vlmul  := lmul_29
      loadRegIn(1).uop.ctrl.total_num            := total_num_29
      loadRegIn(1).uop.cf.instr                  := instr_29
      loadRegIn(1).uop.pdest                     := pdest_29
      when (counter === 801.U) {
        state_1 := s_15
      }
    }
    is (s_15) {
      loadRegIn_valid(1)     := true.B
      loadRegIn(1).src(0)                        := src0_31
      loadRegIn(1).src(1)                        := src1_31
      loadRegIn(1).uop.ctrl.vconfig.vl           := vl_31
      loadRegIn(1).uop.robIdx                    := robIdx_31
      loadRegIn(1).uop.ctrl.uopIdx               := uopIdx_31
      loadRegIn(1).uop.lqIdx                     := lqIdx_31
      loadRegIn(1).uop.ctrl.vconfig.vtype.vsew   := sew_31
      loadRegIn(1).uop.ctrl.vconfig.vtype.vlmul  := lmul_31
      loadRegIn(1).uop.ctrl.total_num            := total_num_31
      loadRegIn(1).uop.cf.instr                  := instr_31
      loadRegIn(1).uop.pdest                     := pdest_31

      state_1 := s_16
    }
    is (s_16) {
      when (counter === 900.U) {
        loadRegIn_valid(1)     := true.B
      }.otherwise {
        loadRegIn_valid(1)     := false.B
      }

      loadRegIn(1).src(0)                        := src0_33
      loadRegIn(1).src(1)                        := src1_33
      loadRegIn(1).uop.ctrl.vconfig.vl           := vl_33
      loadRegIn(1).uop.robIdx                    := robIdx_33
      loadRegIn(1).uop.ctrl.uopIdx               := uopIdx_33
      loadRegIn(1).uop.lqIdx                     := lqIdx_33
      loadRegIn(1).uop.ctrl.vconfig.vtype.vsew   := sew_33
      loadRegIn(1).uop.ctrl.vconfig.vtype.vlmul  := lmul_33
      loadRegIn(1).uop.ctrl.total_num            := total_num_33
      loadRegIn(1).uop.cf.instr                  := instr_33
      loadRegIn(1).uop.pdest                     := pdest_33

      when (counter === 901.U) {
        state_1 := s_17
      }
    }
    is (s_17) {
      loadRegIn_valid(1)     := true.B
      loadRegIn(1).src(0)                        := src0_35
      loadRegIn(1).src(1)                        := src1_35
      loadRegIn(1).uop.ctrl.vconfig.vl           := vl_35
      loadRegIn(1).uop.robIdx                    := robIdx_35
      loadRegIn(1).uop.ctrl.uopIdx               := uopIdx_35
      loadRegIn(1).uop.lqIdx                     := lqIdx_35
      loadRegIn(1).uop.ctrl.vconfig.vtype.vsew   := sew_35
      loadRegIn(1).uop.ctrl.vconfig.vtype.vlmul  := lmul_35
      loadRegIn(1).uop.ctrl.total_num            := total_num_35
      loadRegIn(1).uop.cf.instr                  := instr_35
      loadRegIn(1).uop.pdest                     := pdest_35
      state_1 := s_18
    }
    is (s_18) {
      when (counter === 1000.U) {
        loadRegIn_valid(1)     := true.B
      }.otherwise {
        loadRegIn_valid(1)     := false.B
      }

      loadRegIn(1).src(0)                        := src0_37
      loadRegIn(1).src(1)                        := src1_37
      loadRegIn(1).uop.ctrl.vconfig.vl           := vl_37
      loadRegIn(1).uop.robIdx                    := robIdx_37
      loadRegIn(1).uop.ctrl.uopIdx               := uopIdx_37
      loadRegIn(1).uop.lqIdx                     := lqIdx_37
      loadRegIn(1).uop.ctrl.vconfig.vtype.vsew   := sew_37
      loadRegIn(1).uop.ctrl.vconfig.vtype.vlmul  := lmul_37
      loadRegIn(1).uop.ctrl.total_num            := total_num_37
      loadRegIn(1).uop.cf.instr                  := instr_37
      loadRegIn(1).uop.pdest                     := pdest_37
      when (counter === 1001.U) {
        state_1 := s_idle
      }
    }

  }

  for(i <- 0 until LoadPipelineWidth){
    io.vecloadRegIn(i).bits  := DontCare
    io.vecloadRegIn(i).valid := loadRegIn_valid(i)
    io.vecloadRegIn(i).bits  := loadRegIn(i)
  }

  io.vecwriteback.map(_.ready := true.B)
}