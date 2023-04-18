module InputBuffer_1(
  input         clock,
  input         reset,
  input         io_redirect_valid,
  input         io_redirect_bits_robIdx_flag,
  input  [4:0]  io_redirect_bits_robIdx_value,
  input         io_redirect_bits_level,
  output        io_in_ready,
  input         io_in_valid,
  input  [63:0] io_in_bits_src_0,
  input  [63:0] io_in_bits_src_1,
  input         io_in_bits_uop_ctrl_rfWen,
  input         io_in_bits_uop_ctrl_fpWen,
  input         io_in_bits_uop_ctrl_fpu_typeTagIn,
  input         io_in_bits_uop_ctrl_fpu_sqrt,
  input  [2:0]  io_in_bits_uop_ctrl_fpu_rm,
  input  [5:0]  io_in_bits_uop_pdest,
  input         io_in_bits_uop_robIdx_flag,
  input  [4:0]  io_in_bits_uop_robIdx_value,
  input         io_out_ready,
  output        io_out_valid,
  output [63:0] io_out_bits_src_0,
  output [63:0] io_out_bits_src_1,
  output        io_out_bits_uop_ctrl_rfWen,
  output        io_out_bits_uop_ctrl_fpWen,
  output        io_out_bits_uop_ctrl_fpu_typeTagIn,
  output        io_out_bits_uop_ctrl_fpu_sqrt,
  output [2:0]  io_out_bits_uop_ctrl_fpu_rm,
  output [5:0]  io_out_bits_uop_pdest,
  output        io_out_bits_uop_robIdx_flag,
  output [4:0]  io_out_bits_uop_robIdx_value
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [63:0] _RAND_10;
  reg [63:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [63:0] _RAND_20;
  reg [63:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [63:0] _RAND_30;
  reg [63:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [63:0] _RAND_40;
  reg [63:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [63:0] _RAND_50;
  reg [63:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [63:0] _RAND_60;
  reg [63:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [63:0] _RAND_70;
  reg [63:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_78;
  reg [31:0] _RAND_79;
  reg [31:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_85;
  reg [31:0] _RAND_86;
  reg [31:0] _RAND_87;
  reg [31:0] _RAND_88;
  reg [31:0] _RAND_89;
  reg [31:0] _RAND_90;
`endif // RANDOMIZE_REG_INIT
  wire  age_clock; // @[InputBuffer.scala 62:19]
  wire  age_reset; // @[InputBuffer.scala 62:19]
  wire [7:0] age_io_enq_0; // @[InputBuffer.scala 62:19]
  wire [7:0] age_io_deq; // @[InputBuffer.scala 62:19]
  wire [7:0] age_io_out; // @[InputBuffer.scala 62:19]
  reg [63:0] data_0_src_0; // @[InputBuffer.scala 35:17]
  reg [63:0] data_0_src_1; // @[InputBuffer.scala 35:17]
  reg  data_0_uop_ctrl_rfWen; // @[InputBuffer.scala 35:17]
  reg  data_0_uop_ctrl_fpWen; // @[InputBuffer.scala 35:17]
  reg  data_0_uop_ctrl_fpu_typeTagIn; // @[InputBuffer.scala 35:17]
  reg  data_0_uop_ctrl_fpu_sqrt; // @[InputBuffer.scala 35:17]
  reg [2:0] data_0_uop_ctrl_fpu_rm; // @[InputBuffer.scala 35:17]
  reg [5:0] data_0_uop_pdest; // @[InputBuffer.scala 35:17]
  reg  data_0_uop_robIdx_flag; // @[InputBuffer.scala 35:17]
  reg [4:0] data_0_uop_robIdx_value; // @[InputBuffer.scala 35:17]
  reg [63:0] data_1_src_0; // @[InputBuffer.scala 35:17]
  reg [63:0] data_1_src_1; // @[InputBuffer.scala 35:17]
  reg  data_1_uop_ctrl_rfWen; // @[InputBuffer.scala 35:17]
  reg  data_1_uop_ctrl_fpWen; // @[InputBuffer.scala 35:17]
  reg  data_1_uop_ctrl_fpu_typeTagIn; // @[InputBuffer.scala 35:17]
  reg  data_1_uop_ctrl_fpu_sqrt; // @[InputBuffer.scala 35:17]
  reg [2:0] data_1_uop_ctrl_fpu_rm; // @[InputBuffer.scala 35:17]
  reg [5:0] data_1_uop_pdest; // @[InputBuffer.scala 35:17]
  reg  data_1_uop_robIdx_flag; // @[InputBuffer.scala 35:17]
  reg [4:0] data_1_uop_robIdx_value; // @[InputBuffer.scala 35:17]
  reg [63:0] data_2_src_0; // @[InputBuffer.scala 35:17]
  reg [63:0] data_2_src_1; // @[InputBuffer.scala 35:17]
  reg  data_2_uop_ctrl_rfWen; // @[InputBuffer.scala 35:17]
  reg  data_2_uop_ctrl_fpWen; // @[InputBuffer.scala 35:17]
  reg  data_2_uop_ctrl_fpu_typeTagIn; // @[InputBuffer.scala 35:17]
  reg  data_2_uop_ctrl_fpu_sqrt; // @[InputBuffer.scala 35:17]
  reg [2:0] data_2_uop_ctrl_fpu_rm; // @[InputBuffer.scala 35:17]
  reg [5:0] data_2_uop_pdest; // @[InputBuffer.scala 35:17]
  reg  data_2_uop_robIdx_flag; // @[InputBuffer.scala 35:17]
  reg [4:0] data_2_uop_robIdx_value; // @[InputBuffer.scala 35:17]
  reg [63:0] data_3_src_0; // @[InputBuffer.scala 35:17]
  reg [63:0] data_3_src_1; // @[InputBuffer.scala 35:17]
  reg  data_3_uop_ctrl_rfWen; // @[InputBuffer.scala 35:17]
  reg  data_3_uop_ctrl_fpWen; // @[InputBuffer.scala 35:17]
  reg  data_3_uop_ctrl_fpu_typeTagIn; // @[InputBuffer.scala 35:17]
  reg  data_3_uop_ctrl_fpu_sqrt; // @[InputBuffer.scala 35:17]
  reg [2:0] data_3_uop_ctrl_fpu_rm; // @[InputBuffer.scala 35:17]
  reg [5:0] data_3_uop_pdest; // @[InputBuffer.scala 35:17]
  reg  data_3_uop_robIdx_flag; // @[InputBuffer.scala 35:17]
  reg [4:0] data_3_uop_robIdx_value; // @[InputBuffer.scala 35:17]
  reg [63:0] data_4_src_0; // @[InputBuffer.scala 35:17]
  reg [63:0] data_4_src_1; // @[InputBuffer.scala 35:17]
  reg  data_4_uop_ctrl_rfWen; // @[InputBuffer.scala 35:17]
  reg  data_4_uop_ctrl_fpWen; // @[InputBuffer.scala 35:17]
  reg  data_4_uop_ctrl_fpu_typeTagIn; // @[InputBuffer.scala 35:17]
  reg  data_4_uop_ctrl_fpu_sqrt; // @[InputBuffer.scala 35:17]
  reg [2:0] data_4_uop_ctrl_fpu_rm; // @[InputBuffer.scala 35:17]
  reg [5:0] data_4_uop_pdest; // @[InputBuffer.scala 35:17]
  reg  data_4_uop_robIdx_flag; // @[InputBuffer.scala 35:17]
  reg [4:0] data_4_uop_robIdx_value; // @[InputBuffer.scala 35:17]
  reg [63:0] data_5_src_0; // @[InputBuffer.scala 35:17]
  reg [63:0] data_5_src_1; // @[InputBuffer.scala 35:17]
  reg  data_5_uop_ctrl_rfWen; // @[InputBuffer.scala 35:17]
  reg  data_5_uop_ctrl_fpWen; // @[InputBuffer.scala 35:17]
  reg  data_5_uop_ctrl_fpu_typeTagIn; // @[InputBuffer.scala 35:17]
  reg  data_5_uop_ctrl_fpu_sqrt; // @[InputBuffer.scala 35:17]
  reg [2:0] data_5_uop_ctrl_fpu_rm; // @[InputBuffer.scala 35:17]
  reg [5:0] data_5_uop_pdest; // @[InputBuffer.scala 35:17]
  reg  data_5_uop_robIdx_flag; // @[InputBuffer.scala 35:17]
  reg [4:0] data_5_uop_robIdx_value; // @[InputBuffer.scala 35:17]
  reg [63:0] data_6_src_0; // @[InputBuffer.scala 35:17]
  reg [63:0] data_6_src_1; // @[InputBuffer.scala 35:17]
  reg  data_6_uop_ctrl_rfWen; // @[InputBuffer.scala 35:17]
  reg  data_6_uop_ctrl_fpWen; // @[InputBuffer.scala 35:17]
  reg  data_6_uop_ctrl_fpu_typeTagIn; // @[InputBuffer.scala 35:17]
  reg  data_6_uop_ctrl_fpu_sqrt; // @[InputBuffer.scala 35:17]
  reg [2:0] data_6_uop_ctrl_fpu_rm; // @[InputBuffer.scala 35:17]
  reg [5:0] data_6_uop_pdest; // @[InputBuffer.scala 35:17]
  reg  data_6_uop_robIdx_flag; // @[InputBuffer.scala 35:17]
  reg [4:0] data_6_uop_robIdx_value; // @[InputBuffer.scala 35:17]
  reg [63:0] data_7_src_0; // @[InputBuffer.scala 35:17]
  reg [63:0] data_7_src_1; // @[InputBuffer.scala 35:17]
  reg  data_7_uop_ctrl_rfWen; // @[InputBuffer.scala 35:17]
  reg  data_7_uop_ctrl_fpWen; // @[InputBuffer.scala 35:17]
  reg  data_7_uop_ctrl_fpu_typeTagIn; // @[InputBuffer.scala 35:17]
  reg  data_7_uop_ctrl_fpu_sqrt; // @[InputBuffer.scala 35:17]
  reg [2:0] data_7_uop_ctrl_fpu_rm; // @[InputBuffer.scala 35:17]
  reg [5:0] data_7_uop_pdest; // @[InputBuffer.scala 35:17]
  reg  data_7_uop_robIdx_flag; // @[InputBuffer.scala 35:17]
  reg [4:0] data_7_uop_robIdx_value; // @[InputBuffer.scala 35:17]
  reg  emptyVec_0; // @[InputBuffer.scala 36:25]
  reg  emptyVec_1; // @[InputBuffer.scala 36:25]
  reg  emptyVec_2; // @[InputBuffer.scala 36:25]
  reg  emptyVec_3; // @[InputBuffer.scala 36:25]
  reg  emptyVec_4; // @[InputBuffer.scala 36:25]
  reg  emptyVec_5; // @[InputBuffer.scala 36:25]
  reg  emptyVec_6; // @[InputBuffer.scala 36:25]
  reg  emptyVec_7; // @[InputBuffer.scala 36:25]
  wire  matrix_1_0 = ~(|emptyVec_0); // @[BitUtils.scala 257:50]
  wire [1:0] _matrix_2_0_T = {emptyVec_0,emptyVec_1}; // @[Cat.scala 31:58]
  wire  matrix_2_0 = ~(|_matrix_2_0_T); // @[BitUtils.scala 257:50]
  wire [2:0] _matrix_3_0_T = {emptyVec_0,emptyVec_1,emptyVec_2}; // @[Cat.scala 31:58]
  wire  matrix_3_0 = ~(|_matrix_3_0_T); // @[BitUtils.scala 257:50]
  wire [3:0] _matrix_4_0_T = {emptyVec_0,emptyVec_1,emptyVec_2,emptyVec_3}; // @[Cat.scala 31:58]
  wire  matrix_4_0 = ~(|_matrix_4_0_T); // @[BitUtils.scala 257:50]
  wire [4:0] _matrix_5_0_T = {emptyVec_0,emptyVec_1,emptyVec_2,emptyVec_3,emptyVec_4}; // @[Cat.scala 31:58]
  wire  matrix_5_0 = ~(|_matrix_5_0_T); // @[BitUtils.scala 257:50]
  wire [5:0] _matrix_6_0_T = {emptyVec_0,emptyVec_1,emptyVec_2,emptyVec_3,emptyVec_4,emptyVec_5}; // @[Cat.scala 31:58]
  wire  matrix_6_0 = ~(|_matrix_6_0_T); // @[BitUtils.scala 257:50]
  wire [6:0] _matrix_7_0_T = {emptyVec_0,emptyVec_1,emptyVec_2,emptyVec_3,emptyVec_4,emptyVec_5,emptyVec_6}; // @[Cat.scala 31:58]
  wire  matrix_7_0 = ~(|_matrix_7_0_T); // @[BitUtils.scala 257:50]
  wire  enqVec_1 = emptyVec_1 & matrix_1_0; // @[BitUtils.scala 274:62]
  wire  enqVec_2 = emptyVec_2 & matrix_2_0; // @[BitUtils.scala 274:62]
  wire  enqVec_3 = emptyVec_3 & matrix_3_0; // @[BitUtils.scala 274:62]
  wire  enqVec_4 = emptyVec_4 & matrix_4_0; // @[BitUtils.scala 274:62]
  wire  enqVec_5 = emptyVec_5 & matrix_5_0; // @[BitUtils.scala 274:62]
  wire  enqVec_6 = emptyVec_6 & matrix_6_0; // @[BitUtils.scala 274:62]
  wire  enqVec_7 = emptyVec_7 & matrix_7_0; // @[BitUtils.scala 274:62]
  reg  hasEmpty; // @[InputBuffer.scala 41:25]
  wire [5:0] _flushVec_flushItself_T_5 = {data_1_uop_robIdx_flag,data_1_uop_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire [5:0] _flushVec_flushItself_T_6 = {io_redirect_bits_robIdx_flag,io_redirect_bits_robIdx_value}; // @[CircularQueuePtr.scala 61:70]
  wire  _flushVec_flushItself_T_7 = _flushVec_flushItself_T_5 == _flushVec_flushItself_T_6; // @[CircularQueuePtr.scala 61:52]
  wire  flushVec_flushItself_1 = io_redirect_bits_level & _flushVec_flushItself_T_7; // @[Rob.scala 122:51]
  wire  flushVec_differentFlag_1 = data_1_uop_robIdx_flag ^ io_redirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  flushVec_compare_1 = data_1_uop_robIdx_value > io_redirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _flushVec_T_5 = flushVec_differentFlag_1 ^ flushVec_compare_1; // @[CircularQueuePtr.scala 88:19]
  wire  _flushVec_T_7 = io_redirect_valid & (flushVec_flushItself_1 | _flushVec_T_5); // @[Rob.scala 123:20]
  wire  flushVec_1 = ~emptyVec_1 & _flushVec_T_7; // @[InputBuffer.scala 93:78]
  wire  _doDequeue_T = io_out_ready & io_out_valid; // @[Decoupled.scala 50:35]
  reg  isEmpty; // @[InputBuffer.scala 82:26]
  wire  doBypass = io_in_valid & io_out_ready & isEmpty; // @[InputBuffer.scala 89:45]
  wire  _doDequeue_T_1 = ~doBypass; // @[InputBuffer.scala 70:34]
  wire  doDequeue = _doDequeue_T & ~doBypass; // @[InputBuffer.scala 70:31]
  wire  _doEnqueue_T = io_in_ready & io_in_valid; // @[Decoupled.scala 50:35]
  wire [5:0] _doEnqueue_flushItself_T_1 = {io_in_bits_uop_robIdx_flag,io_in_bits_uop_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _doEnqueue_flushItself_T_3 = _doEnqueue_flushItself_T_1 == _flushVec_flushItself_T_6; // @[CircularQueuePtr.scala 61:52]
  wire  doEnqueue_flushItself = io_redirect_bits_level & _doEnqueue_flushItself_T_3; // @[Rob.scala 122:51]
  wire  doEnqueue_differentFlag = io_in_bits_uop_robIdx_flag ^ io_redirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  doEnqueue_compare = io_in_bits_uop_robIdx_value > io_redirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _doEnqueue_T_3 = doEnqueue_differentFlag ^ doEnqueue_compare; // @[CircularQueuePtr.scala 88:19]
  wire  _doEnqueue_T_5 = io_redirect_valid & (doEnqueue_flushItself | _doEnqueue_T_3); // @[Rob.scala 123:20]
  wire  doEnqueue = _doEnqueue_T & _doDequeue_T_1 & ~_doEnqueue_T_5; // @[InputBuffer.scala 51:43]
  wire  _GEN_223 = enqVec_1 ? 1'h0 : emptyVec_1; // @[InputBuffer.scala 54:24 56:25]
  wire  _GEN_1119 = doEnqueue ? _GEN_223 : emptyVec_1; // @[InputBuffer.scala 52:20]
  wire  _GEN_1793 = age_io_out[1] | _GEN_1119; // @[InputBuffer.scala 73:28 74:25]
  wire  _GEN_1801 = doDequeue ? _GEN_1793 : _GEN_1119; // @[InputBuffer.scala 71:20]
  wire  emptyVecNext_1 = flushVec_1 | _GEN_1801; // @[InputBuffer.scala 95:24 96:23]
  wire [5:0] _flushVec_flushItself_T_1 = {data_0_uop_robIdx_flag,data_0_uop_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _flushVec_flushItself_T_3 = _flushVec_flushItself_T_1 == _flushVec_flushItself_T_6; // @[CircularQueuePtr.scala 61:52]
  wire  flushVec_flushItself = io_redirect_bits_level & _flushVec_flushItself_T_3; // @[Rob.scala 122:51]
  wire  flushVec_differentFlag = data_0_uop_robIdx_flag ^ io_redirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  flushVec_compare = data_0_uop_robIdx_value > io_redirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _flushVec_T_1 = flushVec_differentFlag ^ flushVec_compare; // @[CircularQueuePtr.scala 88:19]
  wire  _flushVec_T_3 = io_redirect_valid & (flushVec_flushItself | _flushVec_T_1); // @[Rob.scala 123:20]
  wire  flushVec_0 = ~emptyVec_0 & _flushVec_T_3; // @[InputBuffer.scala 93:78]
  wire  _GEN_111 = emptyVec_0 ? 1'h0 : emptyVec_0; // @[InputBuffer.scala 54:24 56:25]
  wire  _GEN_1007 = doEnqueue ? _GEN_111 : emptyVec_0; // @[InputBuffer.scala 52:20]
  wire  _GEN_1792 = age_io_out[0] | _GEN_1007; // @[InputBuffer.scala 73:28 74:25]
  wire  _GEN_1800 = doDequeue ? _GEN_1792 : _GEN_1007; // @[InputBuffer.scala 71:20]
  wire  emptyVecNext_0 = flushVec_0 | _GEN_1800; // @[InputBuffer.scala 95:24 96:23]
  wire [5:0] _flushVec_flushItself_T_13 = {data_3_uop_robIdx_flag,data_3_uop_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _flushVec_flushItself_T_15 = _flushVec_flushItself_T_13 == _flushVec_flushItself_T_6; // @[CircularQueuePtr.scala 61:52]
  wire  flushVec_flushItself_3 = io_redirect_bits_level & _flushVec_flushItself_T_15; // @[Rob.scala 122:51]
  wire  flushVec_differentFlag_3 = data_3_uop_robIdx_flag ^ io_redirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  flushVec_compare_3 = data_3_uop_robIdx_value > io_redirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _flushVec_T_13 = flushVec_differentFlag_3 ^ flushVec_compare_3; // @[CircularQueuePtr.scala 88:19]
  wire  _flushVec_T_15 = io_redirect_valid & (flushVec_flushItself_3 | _flushVec_T_13); // @[Rob.scala 123:20]
  wire  flushVec_3 = ~emptyVec_3 & _flushVec_T_15; // @[InputBuffer.scala 93:78]
  wire  _GEN_447 = enqVec_3 ? 1'h0 : emptyVec_3; // @[InputBuffer.scala 54:24 56:25]
  wire  _GEN_1343 = doEnqueue ? _GEN_447 : emptyVec_3; // @[InputBuffer.scala 52:20]
  wire  _GEN_1795 = age_io_out[3] | _GEN_1343; // @[InputBuffer.scala 73:28 74:25]
  wire  _GEN_1803 = doDequeue ? _GEN_1795 : _GEN_1343; // @[InputBuffer.scala 71:20]
  wire  emptyVecNext_3 = flushVec_3 | _GEN_1803; // @[InputBuffer.scala 95:24 96:23]
  wire [5:0] _flushVec_flushItself_T_9 = {data_2_uop_robIdx_flag,data_2_uop_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _flushVec_flushItself_T_11 = _flushVec_flushItself_T_9 == _flushVec_flushItself_T_6; // @[CircularQueuePtr.scala 61:52]
  wire  flushVec_flushItself_2 = io_redirect_bits_level & _flushVec_flushItself_T_11; // @[Rob.scala 122:51]
  wire  flushVec_differentFlag_2 = data_2_uop_robIdx_flag ^ io_redirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  flushVec_compare_2 = data_2_uop_robIdx_value > io_redirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _flushVec_T_9 = flushVec_differentFlag_2 ^ flushVec_compare_2; // @[CircularQueuePtr.scala 88:19]
  wire  _flushVec_T_11 = io_redirect_valid & (flushVec_flushItself_2 | _flushVec_T_9); // @[Rob.scala 123:20]
  wire  flushVec_2 = ~emptyVec_2 & _flushVec_T_11; // @[InputBuffer.scala 93:78]
  wire  _GEN_335 = enqVec_2 ? 1'h0 : emptyVec_2; // @[InputBuffer.scala 54:24 56:25]
  wire  _GEN_1231 = doEnqueue ? _GEN_335 : emptyVec_2; // @[InputBuffer.scala 52:20]
  wire  _GEN_1794 = age_io_out[2] | _GEN_1231; // @[InputBuffer.scala 73:28 74:25]
  wire  _GEN_1802 = doDequeue ? _GEN_1794 : _GEN_1231; // @[InputBuffer.scala 71:20]
  wire  emptyVecNext_2 = flushVec_2 | _GEN_1802; // @[InputBuffer.scala 95:24 96:23]
  wire [5:0] _flushVec_flushItself_T_21 = {data_5_uop_robIdx_flag,data_5_uop_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _flushVec_flushItself_T_23 = _flushVec_flushItself_T_21 == _flushVec_flushItself_T_6; // @[CircularQueuePtr.scala 61:52]
  wire  flushVec_flushItself_5 = io_redirect_bits_level & _flushVec_flushItself_T_23; // @[Rob.scala 122:51]
  wire  flushVec_differentFlag_5 = data_5_uop_robIdx_flag ^ io_redirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  flushVec_compare_5 = data_5_uop_robIdx_value > io_redirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _flushVec_T_21 = flushVec_differentFlag_5 ^ flushVec_compare_5; // @[CircularQueuePtr.scala 88:19]
  wire  _flushVec_T_23 = io_redirect_valid & (flushVec_flushItself_5 | _flushVec_T_21); // @[Rob.scala 123:20]
  wire  flushVec_5 = ~emptyVec_5 & _flushVec_T_23; // @[InputBuffer.scala 93:78]
  wire  _GEN_671 = enqVec_5 ? 1'h0 : emptyVec_5; // @[InputBuffer.scala 54:24 56:25]
  wire  _GEN_1567 = doEnqueue ? _GEN_671 : emptyVec_5; // @[InputBuffer.scala 52:20]
  wire  _GEN_1797 = age_io_out[5] | _GEN_1567; // @[InputBuffer.scala 73:28 74:25]
  wire  _GEN_1805 = doDequeue ? _GEN_1797 : _GEN_1567; // @[InputBuffer.scala 71:20]
  wire  emptyVecNext_5 = flushVec_5 | _GEN_1805; // @[InputBuffer.scala 95:24 96:23]
  wire [5:0] _flushVec_flushItself_T_17 = {data_4_uop_robIdx_flag,data_4_uop_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _flushVec_flushItself_T_19 = _flushVec_flushItself_T_17 == _flushVec_flushItself_T_6; // @[CircularQueuePtr.scala 61:52]
  wire  flushVec_flushItself_4 = io_redirect_bits_level & _flushVec_flushItself_T_19; // @[Rob.scala 122:51]
  wire  flushVec_differentFlag_4 = data_4_uop_robIdx_flag ^ io_redirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  flushVec_compare_4 = data_4_uop_robIdx_value > io_redirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _flushVec_T_17 = flushVec_differentFlag_4 ^ flushVec_compare_4; // @[CircularQueuePtr.scala 88:19]
  wire  _flushVec_T_19 = io_redirect_valid & (flushVec_flushItself_4 | _flushVec_T_17); // @[Rob.scala 123:20]
  wire  flushVec_4 = ~emptyVec_4 & _flushVec_T_19; // @[InputBuffer.scala 93:78]
  wire  _GEN_559 = enqVec_4 ? 1'h0 : emptyVec_4; // @[InputBuffer.scala 54:24 56:25]
  wire  _GEN_1455 = doEnqueue ? _GEN_559 : emptyVec_4; // @[InputBuffer.scala 52:20]
  wire  _GEN_1796 = age_io_out[4] | _GEN_1455; // @[InputBuffer.scala 73:28 74:25]
  wire  _GEN_1804 = doDequeue ? _GEN_1796 : _GEN_1455; // @[InputBuffer.scala 71:20]
  wire  emptyVecNext_4 = flushVec_4 | _GEN_1804; // @[InputBuffer.scala 95:24 96:23]
  wire [5:0] _flushVec_flushItself_T_29 = {data_7_uop_robIdx_flag,data_7_uop_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _flushVec_flushItself_T_31 = _flushVec_flushItself_T_29 == _flushVec_flushItself_T_6; // @[CircularQueuePtr.scala 61:52]
  wire  flushVec_flushItself_7 = io_redirect_bits_level & _flushVec_flushItself_T_31; // @[Rob.scala 122:51]
  wire  flushVec_differentFlag_7 = data_7_uop_robIdx_flag ^ io_redirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  flushVec_compare_7 = data_7_uop_robIdx_value > io_redirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _flushVec_T_29 = flushVec_differentFlag_7 ^ flushVec_compare_7; // @[CircularQueuePtr.scala 88:19]
  wire  _flushVec_T_31 = io_redirect_valid & (flushVec_flushItself_7 | _flushVec_T_29); // @[Rob.scala 123:20]
  wire  flushVec_7 = ~emptyVec_7 & _flushVec_T_31; // @[InputBuffer.scala 93:78]
  wire  _GEN_895 = enqVec_7 ? 1'h0 : emptyVec_7; // @[InputBuffer.scala 54:24 56:25]
  wire  _GEN_1791 = doEnqueue ? _GEN_895 : emptyVec_7; // @[InputBuffer.scala 52:20]
  wire  _GEN_1799 = age_io_out[7] | _GEN_1791; // @[InputBuffer.scala 73:28 74:25]
  wire  _GEN_1807 = doDequeue ? _GEN_1799 : _GEN_1791; // @[InputBuffer.scala 71:20]
  wire  emptyVecNext_7 = flushVec_7 | _GEN_1807; // @[InputBuffer.scala 95:24 96:23]
  wire [5:0] _flushVec_flushItself_T_25 = {data_6_uop_robIdx_flag,data_6_uop_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _flushVec_flushItself_T_27 = _flushVec_flushItself_T_25 == _flushVec_flushItself_T_6; // @[CircularQueuePtr.scala 61:52]
  wire  flushVec_flushItself_6 = io_redirect_bits_level & _flushVec_flushItself_T_27; // @[Rob.scala 122:51]
  wire  flushVec_differentFlag_6 = data_6_uop_robIdx_flag ^ io_redirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  flushVec_compare_6 = data_6_uop_robIdx_value > io_redirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _flushVec_T_25 = flushVec_differentFlag_6 ^ flushVec_compare_6; // @[CircularQueuePtr.scala 88:19]
  wire  _flushVec_T_27 = io_redirect_valid & (flushVec_flushItself_6 | _flushVec_T_25); // @[Rob.scala 123:20]
  wire  flushVec_6 = ~emptyVec_6 & _flushVec_T_27; // @[InputBuffer.scala 93:78]
  wire  _GEN_783 = enqVec_6 ? 1'h0 : emptyVec_6; // @[InputBuffer.scala 54:24 56:25]
  wire  _GEN_1679 = doEnqueue ? _GEN_783 : emptyVec_6; // @[InputBuffer.scala 52:20]
  wire  _GEN_1798 = age_io_out[6] | _GEN_1679; // @[InputBuffer.scala 73:28 74:25]
  wire  _GEN_1806 = doDequeue ? _GEN_1798 : _GEN_1679; // @[InputBuffer.scala 71:20]
  wire  emptyVecNext_6 = flushVec_6 | _GEN_1806; // @[InputBuffer.scala 95:24 96:23]
  wire [7:0] _hasEmpty_T = {emptyVecNext_7,emptyVecNext_6,emptyVecNext_5,emptyVecNext_4,emptyVecNext_3,emptyVecNext_2,
    emptyVecNext_1,emptyVecNext_0}; // @[InputBuffer.scala 42:28]
  wire [7:0] _age_io_enq_0_T = {enqVec_7,enqVec_6,enqVec_5,enqVec_4,enqVec_3,enqVec_2,enqVec_1,emptyVec_0}; // @[InputBuffer.scala 63:42]
  reg  notEmpty; // @[InputBuffer.scala 65:25]
  wire [4:0] _io_out_bits_T_233 = age_io_out[0] ? data_0_uop_robIdx_value : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_out_bits_T_234 = age_io_out[1] ? data_1_uop_robIdx_value : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_out_bits_T_235 = age_io_out[2] ? data_2_uop_robIdx_value : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_out_bits_T_236 = age_io_out[3] ? data_3_uop_robIdx_value : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_out_bits_T_237 = age_io_out[4] ? data_4_uop_robIdx_value : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_out_bits_T_238 = age_io_out[5] ? data_5_uop_robIdx_value : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_out_bits_T_239 = age_io_out[6] ? data_6_uop_robIdx_value : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_out_bits_T_240 = age_io_out[7] ? data_7_uop_robIdx_value : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_out_bits_T_241 = _io_out_bits_T_233 | _io_out_bits_T_234; // @[Mux.scala 27:73]
  wire [4:0] _io_out_bits_T_242 = _io_out_bits_T_241 | _io_out_bits_T_235; // @[Mux.scala 27:73]
  wire [4:0] _io_out_bits_T_243 = _io_out_bits_T_242 | _io_out_bits_T_236; // @[Mux.scala 27:73]
  wire [4:0] _io_out_bits_T_244 = _io_out_bits_T_243 | _io_out_bits_T_237; // @[Mux.scala 27:73]
  wire [4:0] _io_out_bits_T_245 = _io_out_bits_T_244 | _io_out_bits_T_238; // @[Mux.scala 27:73]
  wire [4:0] _io_out_bits_T_246 = _io_out_bits_T_245 | _io_out_bits_T_239; // @[Mux.scala 27:73]
  wire [4:0] _io_out_bits_T_247 = _io_out_bits_T_246 | _io_out_bits_T_240; // @[Mux.scala 27:73]
  wire  _io_out_bits_T_262 = age_io_out[0] & data_0_uop_robIdx_flag | age_io_out[1] & data_1_uop_robIdx_flag |
    age_io_out[2] & data_2_uop_robIdx_flag | age_io_out[3] & data_3_uop_robIdx_flag | age_io_out[4] &
    data_4_uop_robIdx_flag | age_io_out[5] & data_5_uop_robIdx_flag | age_io_out[6] & data_6_uop_robIdx_flag |
    age_io_out[7] & data_7_uop_robIdx_flag; // @[Mux.scala 27:73]
  wire [5:0] _io_out_bits_T_278 = age_io_out[0] ? data_0_uop_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_out_bits_T_279 = age_io_out[1] ? data_1_uop_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_out_bits_T_280 = age_io_out[2] ? data_2_uop_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_out_bits_T_281 = age_io_out[3] ? data_3_uop_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_out_bits_T_282 = age_io_out[4] ? data_4_uop_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_out_bits_T_283 = age_io_out[5] ? data_5_uop_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_out_bits_T_284 = age_io_out[6] ? data_6_uop_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_out_bits_T_285 = age_io_out[7] ? data_7_uop_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_out_bits_T_286 = _io_out_bits_T_278 | _io_out_bits_T_279; // @[Mux.scala 27:73]
  wire [5:0] _io_out_bits_T_287 = _io_out_bits_T_286 | _io_out_bits_T_280; // @[Mux.scala 27:73]
  wire [5:0] _io_out_bits_T_288 = _io_out_bits_T_287 | _io_out_bits_T_281; // @[Mux.scala 27:73]
  wire [5:0] _io_out_bits_T_289 = _io_out_bits_T_288 | _io_out_bits_T_282; // @[Mux.scala 27:73]
  wire [5:0] _io_out_bits_T_290 = _io_out_bits_T_289 | _io_out_bits_T_283; // @[Mux.scala 27:73]
  wire [5:0] _io_out_bits_T_291 = _io_out_bits_T_290 | _io_out_bits_T_284; // @[Mux.scala 27:73]
  wire [5:0] _io_out_bits_T_292 = _io_out_bits_T_291 | _io_out_bits_T_285; // @[Mux.scala 27:73]
  wire [2:0] _io_out_bits_T_428 = age_io_out[0] ? data_0_uop_ctrl_fpu_rm : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_out_bits_T_429 = age_io_out[1] ? data_1_uop_ctrl_fpu_rm : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_out_bits_T_430 = age_io_out[2] ? data_2_uop_ctrl_fpu_rm : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_out_bits_T_431 = age_io_out[3] ? data_3_uop_ctrl_fpu_rm : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_out_bits_T_432 = age_io_out[4] ? data_4_uop_ctrl_fpu_rm : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_out_bits_T_433 = age_io_out[5] ? data_5_uop_ctrl_fpu_rm : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_out_bits_T_434 = age_io_out[6] ? data_6_uop_ctrl_fpu_rm : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_out_bits_T_435 = age_io_out[7] ? data_7_uop_ctrl_fpu_rm : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_out_bits_T_436 = _io_out_bits_T_428 | _io_out_bits_T_429; // @[Mux.scala 27:73]
  wire [2:0] _io_out_bits_T_437 = _io_out_bits_T_436 | _io_out_bits_T_430; // @[Mux.scala 27:73]
  wire [2:0] _io_out_bits_T_438 = _io_out_bits_T_437 | _io_out_bits_T_431; // @[Mux.scala 27:73]
  wire [2:0] _io_out_bits_T_439 = _io_out_bits_T_438 | _io_out_bits_T_432; // @[Mux.scala 27:73]
  wire [2:0] _io_out_bits_T_440 = _io_out_bits_T_439 | _io_out_bits_T_433; // @[Mux.scala 27:73]
  wire [2:0] _io_out_bits_T_441 = _io_out_bits_T_440 | _io_out_bits_T_434; // @[Mux.scala 27:73]
  wire [2:0] _io_out_bits_T_442 = _io_out_bits_T_441 | _io_out_bits_T_435; // @[Mux.scala 27:73]
  wire  _io_out_bits_T_517 = age_io_out[0] & data_0_uop_ctrl_fpu_sqrt | age_io_out[1] & data_1_uop_ctrl_fpu_sqrt |
    age_io_out[2] & data_2_uop_ctrl_fpu_sqrt | age_io_out[3] & data_3_uop_ctrl_fpu_sqrt | age_io_out[4] &
    data_4_uop_ctrl_fpu_sqrt | age_io_out[5] & data_5_uop_ctrl_fpu_sqrt | age_io_out[6] & data_6_uop_ctrl_fpu_sqrt |
    age_io_out[7] & data_7_uop_ctrl_fpu_sqrt; // @[Mux.scala 27:73]
  wire  _io_out_bits_T_622 = age_io_out[0] & data_0_uop_ctrl_fpu_typeTagIn | age_io_out[1] &
    data_1_uop_ctrl_fpu_typeTagIn | age_io_out[2] & data_2_uop_ctrl_fpu_typeTagIn | age_io_out[3] &
    data_3_uop_ctrl_fpu_typeTagIn | age_io_out[4] & data_4_uop_ctrl_fpu_typeTagIn | age_io_out[5] &
    data_5_uop_ctrl_fpu_typeTagIn | age_io_out[6] & data_6_uop_ctrl_fpu_typeTagIn | age_io_out[7] &
    data_7_uop_ctrl_fpu_typeTagIn; // @[Mux.scala 27:73]
  wire  _io_out_bits_T_757 = age_io_out[0] & data_0_uop_ctrl_fpWen | age_io_out[1] & data_1_uop_ctrl_fpWen | age_io_out[
    2] & data_2_uop_ctrl_fpWen | age_io_out[3] & data_3_uop_ctrl_fpWen | age_io_out[4] & data_4_uop_ctrl_fpWen |
    age_io_out[5] & data_5_uop_ctrl_fpWen | age_io_out[6] & data_6_uop_ctrl_fpWen | age_io_out[7] &
    data_7_uop_ctrl_fpWen; // @[Mux.scala 27:73]
  wire  _io_out_bits_T_772 = age_io_out[0] & data_0_uop_ctrl_rfWen | age_io_out[1] & data_1_uop_ctrl_rfWen | age_io_out[
    2] & data_2_uop_ctrl_rfWen | age_io_out[3] & data_3_uop_ctrl_rfWen | age_io_out[4] & data_4_uop_ctrl_rfWen |
    age_io_out[5] & data_5_uop_ctrl_rfWen | age_io_out[6] & data_6_uop_ctrl_rfWen | age_io_out[7] &
    data_7_uop_ctrl_rfWen; // @[Mux.scala 27:73]
  wire [63:0] _io_out_bits_T_1628 = age_io_out[0] ? data_0_src_0 : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _io_out_bits_T_1629 = age_io_out[1] ? data_1_src_0 : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _io_out_bits_T_1630 = age_io_out[2] ? data_2_src_0 : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _io_out_bits_T_1631 = age_io_out[3] ? data_3_src_0 : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _io_out_bits_T_1632 = age_io_out[4] ? data_4_src_0 : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _io_out_bits_T_1633 = age_io_out[5] ? data_5_src_0 : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _io_out_bits_T_1634 = age_io_out[6] ? data_6_src_0 : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _io_out_bits_T_1635 = age_io_out[7] ? data_7_src_0 : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _io_out_bits_T_1636 = _io_out_bits_T_1628 | _io_out_bits_T_1629; // @[Mux.scala 27:73]
  wire [63:0] _io_out_bits_T_1637 = _io_out_bits_T_1636 | _io_out_bits_T_1630; // @[Mux.scala 27:73]
  wire [63:0] _io_out_bits_T_1638 = _io_out_bits_T_1637 | _io_out_bits_T_1631; // @[Mux.scala 27:73]
  wire [63:0] _io_out_bits_T_1639 = _io_out_bits_T_1638 | _io_out_bits_T_1632; // @[Mux.scala 27:73]
  wire [63:0] _io_out_bits_T_1640 = _io_out_bits_T_1639 | _io_out_bits_T_1633; // @[Mux.scala 27:73]
  wire [63:0] _io_out_bits_T_1641 = _io_out_bits_T_1640 | _io_out_bits_T_1634; // @[Mux.scala 27:73]
  wire [63:0] _io_out_bits_T_1642 = _io_out_bits_T_1641 | _io_out_bits_T_1635; // @[Mux.scala 27:73]
  wire [63:0] _io_out_bits_T_1643 = age_io_out[0] ? data_0_src_1 : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _io_out_bits_T_1644 = age_io_out[1] ? data_1_src_1 : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _io_out_bits_T_1645 = age_io_out[2] ? data_2_src_1 : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _io_out_bits_T_1646 = age_io_out[3] ? data_3_src_1 : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _io_out_bits_T_1647 = age_io_out[4] ? data_4_src_1 : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _io_out_bits_T_1648 = age_io_out[5] ? data_5_src_1 : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _io_out_bits_T_1649 = age_io_out[6] ? data_6_src_1 : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _io_out_bits_T_1650 = age_io_out[7] ? data_7_src_1 : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _io_out_bits_T_1651 = _io_out_bits_T_1643 | _io_out_bits_T_1644; // @[Mux.scala 27:73]
  wire [63:0] _io_out_bits_T_1652 = _io_out_bits_T_1651 | _io_out_bits_T_1645; // @[Mux.scala 27:73]
  wire [63:0] _io_out_bits_T_1653 = _io_out_bits_T_1652 | _io_out_bits_T_1646; // @[Mux.scala 27:73]
  wire [63:0] _io_out_bits_T_1654 = _io_out_bits_T_1653 | _io_out_bits_T_1647; // @[Mux.scala 27:73]
  wire [63:0] _io_out_bits_T_1655 = _io_out_bits_T_1654 | _io_out_bits_T_1648; // @[Mux.scala 27:73]
  wire [63:0] _io_out_bits_T_1656 = _io_out_bits_T_1655 | _io_out_bits_T_1649; // @[Mux.scala 27:73]
  wire [63:0] _io_out_bits_T_1657 = _io_out_bits_T_1656 | _io_out_bits_T_1650; // @[Mux.scala 27:73]
  wire [7:0] flushDeq = {flushVec_7,flushVec_6,flushVec_5,flushVec_4,flushVec_3,flushVec_2,flushVec_1,flushVec_0}; // @[InputBuffer.scala 100:36]
  wire [7:0] _age_io_deq_T = doDequeue ? age_io_out : 8'h0; // @[InputBuffer.scala 101:20]
  AgeDetector_2 age ( // @[InputBuffer.scala 62:19]
    .clock(age_clock),
    .reset(age_reset),
    .io_enq_0(age_io_enq_0),
    .io_deq(age_io_deq),
    .io_out(age_io_out)
  );
  assign io_in_ready = hasEmpty; // @[InputBuffer.scala 43:15]
  assign io_out_valid = notEmpty | io_in_valid; // @[InputBuffer.scala 67:28]
  assign io_out_bits_src_0 = isEmpty ? io_in_bits_src_0 : _io_out_bits_T_1642; // @[InputBuffer.scala 68:15 86:20 87:19]
  assign io_out_bits_src_1 = isEmpty ? io_in_bits_src_1 : _io_out_bits_T_1657; // @[InputBuffer.scala 68:15 86:20 87:19]
  assign io_out_bits_uop_ctrl_rfWen = isEmpty ? io_in_bits_uop_ctrl_rfWen : _io_out_bits_T_772; // @[InputBuffer.scala 68:15 86:20 87:19]
  assign io_out_bits_uop_ctrl_fpWen = isEmpty ? io_in_bits_uop_ctrl_fpWen : _io_out_bits_T_757; // @[InputBuffer.scala 68:15 86:20 87:19]
  assign io_out_bits_uop_ctrl_fpu_typeTagIn = isEmpty ? io_in_bits_uop_ctrl_fpu_typeTagIn : _io_out_bits_T_622; // @[InputBuffer.scala 68:15 86:20 87:19]
  assign io_out_bits_uop_ctrl_fpu_sqrt = isEmpty ? io_in_bits_uop_ctrl_fpu_sqrt : _io_out_bits_T_517; // @[InputBuffer.scala 68:15 86:20 87:19]
  assign io_out_bits_uop_ctrl_fpu_rm = isEmpty ? io_in_bits_uop_ctrl_fpu_rm : _io_out_bits_T_442; // @[InputBuffer.scala 68:15 86:20 87:19]
  assign io_out_bits_uop_pdest = isEmpty ? io_in_bits_uop_pdest : _io_out_bits_T_292; // @[InputBuffer.scala 68:15 86:20 87:19]
  assign io_out_bits_uop_robIdx_flag = isEmpty ? io_in_bits_uop_robIdx_flag : _io_out_bits_T_262; // @[InputBuffer.scala 68:15 86:20 87:19]
  assign io_out_bits_uop_robIdx_value = isEmpty ? io_in_bits_uop_robIdx_value : _io_out_bits_T_247; // @[InputBuffer.scala 68:15 86:20 87:19]
  assign age_clock = clock;
  assign age_reset = reset;
  assign age_io_enq_0 = doEnqueue ? _age_io_enq_0_T : 8'h0; // @[InputBuffer.scala 63:23]
  assign age_io_deq = _age_io_deq_T | flushDeq; // @[InputBuffer.scala 101:49]
  always @(posedge clock) begin
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (emptyVec_0) begin // @[InputBuffer.scala 54:24]
        data_0_src_0 <= io_in_bits_src_0; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (emptyVec_0) begin // @[InputBuffer.scala 54:24]
        data_0_src_1 <= io_in_bits_src_1; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (emptyVec_0) begin // @[InputBuffer.scala 54:24]
        data_0_uop_ctrl_rfWen <= io_in_bits_uop_ctrl_rfWen; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (emptyVec_0) begin // @[InputBuffer.scala 54:24]
        data_0_uop_ctrl_fpWen <= io_in_bits_uop_ctrl_fpWen; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (emptyVec_0) begin // @[InputBuffer.scala 54:24]
        data_0_uop_ctrl_fpu_typeTagIn <= io_in_bits_uop_ctrl_fpu_typeTagIn; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (emptyVec_0) begin // @[InputBuffer.scala 54:24]
        data_0_uop_ctrl_fpu_sqrt <= io_in_bits_uop_ctrl_fpu_sqrt; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (emptyVec_0) begin // @[InputBuffer.scala 54:24]
        data_0_uop_ctrl_fpu_rm <= io_in_bits_uop_ctrl_fpu_rm; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (emptyVec_0) begin // @[InputBuffer.scala 54:24]
        data_0_uop_pdest <= io_in_bits_uop_pdest; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (emptyVec_0) begin // @[InputBuffer.scala 54:24]
        data_0_uop_robIdx_flag <= io_in_bits_uop_robIdx_flag; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (emptyVec_0) begin // @[InputBuffer.scala 54:24]
        data_0_uop_robIdx_value <= io_in_bits_uop_robIdx_value; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_1) begin // @[InputBuffer.scala 54:24]
        data_1_src_0 <= io_in_bits_src_0; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_1) begin // @[InputBuffer.scala 54:24]
        data_1_src_1 <= io_in_bits_src_1; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_1) begin // @[InputBuffer.scala 54:24]
        data_1_uop_ctrl_rfWen <= io_in_bits_uop_ctrl_rfWen; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_1) begin // @[InputBuffer.scala 54:24]
        data_1_uop_ctrl_fpWen <= io_in_bits_uop_ctrl_fpWen; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_1) begin // @[InputBuffer.scala 54:24]
        data_1_uop_ctrl_fpu_typeTagIn <= io_in_bits_uop_ctrl_fpu_typeTagIn; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_1) begin // @[InputBuffer.scala 54:24]
        data_1_uop_ctrl_fpu_sqrt <= io_in_bits_uop_ctrl_fpu_sqrt; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_1) begin // @[InputBuffer.scala 54:24]
        data_1_uop_ctrl_fpu_rm <= io_in_bits_uop_ctrl_fpu_rm; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_1) begin // @[InputBuffer.scala 54:24]
        data_1_uop_pdest <= io_in_bits_uop_pdest; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_1) begin // @[InputBuffer.scala 54:24]
        data_1_uop_robIdx_flag <= io_in_bits_uop_robIdx_flag; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_1) begin // @[InputBuffer.scala 54:24]
        data_1_uop_robIdx_value <= io_in_bits_uop_robIdx_value; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_2) begin // @[InputBuffer.scala 54:24]
        data_2_src_0 <= io_in_bits_src_0; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_2) begin // @[InputBuffer.scala 54:24]
        data_2_src_1 <= io_in_bits_src_1; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_2) begin // @[InputBuffer.scala 54:24]
        data_2_uop_ctrl_rfWen <= io_in_bits_uop_ctrl_rfWen; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_2) begin // @[InputBuffer.scala 54:24]
        data_2_uop_ctrl_fpWen <= io_in_bits_uop_ctrl_fpWen; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_2) begin // @[InputBuffer.scala 54:24]
        data_2_uop_ctrl_fpu_typeTagIn <= io_in_bits_uop_ctrl_fpu_typeTagIn; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_2) begin // @[InputBuffer.scala 54:24]
        data_2_uop_ctrl_fpu_sqrt <= io_in_bits_uop_ctrl_fpu_sqrt; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_2) begin // @[InputBuffer.scala 54:24]
        data_2_uop_ctrl_fpu_rm <= io_in_bits_uop_ctrl_fpu_rm; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_2) begin // @[InputBuffer.scala 54:24]
        data_2_uop_pdest <= io_in_bits_uop_pdest; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_2) begin // @[InputBuffer.scala 54:24]
        data_2_uop_robIdx_flag <= io_in_bits_uop_robIdx_flag; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_2) begin // @[InputBuffer.scala 54:24]
        data_2_uop_robIdx_value <= io_in_bits_uop_robIdx_value; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_3) begin // @[InputBuffer.scala 54:24]
        data_3_src_0 <= io_in_bits_src_0; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_3) begin // @[InputBuffer.scala 54:24]
        data_3_src_1 <= io_in_bits_src_1; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_3) begin // @[InputBuffer.scala 54:24]
        data_3_uop_ctrl_rfWen <= io_in_bits_uop_ctrl_rfWen; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_3) begin // @[InputBuffer.scala 54:24]
        data_3_uop_ctrl_fpWen <= io_in_bits_uop_ctrl_fpWen; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_3) begin // @[InputBuffer.scala 54:24]
        data_3_uop_ctrl_fpu_typeTagIn <= io_in_bits_uop_ctrl_fpu_typeTagIn; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_3) begin // @[InputBuffer.scala 54:24]
        data_3_uop_ctrl_fpu_sqrt <= io_in_bits_uop_ctrl_fpu_sqrt; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_3) begin // @[InputBuffer.scala 54:24]
        data_3_uop_ctrl_fpu_rm <= io_in_bits_uop_ctrl_fpu_rm; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_3) begin // @[InputBuffer.scala 54:24]
        data_3_uop_pdest <= io_in_bits_uop_pdest; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_3) begin // @[InputBuffer.scala 54:24]
        data_3_uop_robIdx_flag <= io_in_bits_uop_robIdx_flag; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_3) begin // @[InputBuffer.scala 54:24]
        data_3_uop_robIdx_value <= io_in_bits_uop_robIdx_value; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_4) begin // @[InputBuffer.scala 54:24]
        data_4_src_0 <= io_in_bits_src_0; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_4) begin // @[InputBuffer.scala 54:24]
        data_4_src_1 <= io_in_bits_src_1; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_4) begin // @[InputBuffer.scala 54:24]
        data_4_uop_ctrl_rfWen <= io_in_bits_uop_ctrl_rfWen; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_4) begin // @[InputBuffer.scala 54:24]
        data_4_uop_ctrl_fpWen <= io_in_bits_uop_ctrl_fpWen; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_4) begin // @[InputBuffer.scala 54:24]
        data_4_uop_ctrl_fpu_typeTagIn <= io_in_bits_uop_ctrl_fpu_typeTagIn; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_4) begin // @[InputBuffer.scala 54:24]
        data_4_uop_ctrl_fpu_sqrt <= io_in_bits_uop_ctrl_fpu_sqrt; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_4) begin // @[InputBuffer.scala 54:24]
        data_4_uop_ctrl_fpu_rm <= io_in_bits_uop_ctrl_fpu_rm; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_4) begin // @[InputBuffer.scala 54:24]
        data_4_uop_pdest <= io_in_bits_uop_pdest; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_4) begin // @[InputBuffer.scala 54:24]
        data_4_uop_robIdx_flag <= io_in_bits_uop_robIdx_flag; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_4) begin // @[InputBuffer.scala 54:24]
        data_4_uop_robIdx_value <= io_in_bits_uop_robIdx_value; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_5) begin // @[InputBuffer.scala 54:24]
        data_5_src_0 <= io_in_bits_src_0; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_5) begin // @[InputBuffer.scala 54:24]
        data_5_src_1 <= io_in_bits_src_1; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_5) begin // @[InputBuffer.scala 54:24]
        data_5_uop_ctrl_rfWen <= io_in_bits_uop_ctrl_rfWen; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_5) begin // @[InputBuffer.scala 54:24]
        data_5_uop_ctrl_fpWen <= io_in_bits_uop_ctrl_fpWen; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_5) begin // @[InputBuffer.scala 54:24]
        data_5_uop_ctrl_fpu_typeTagIn <= io_in_bits_uop_ctrl_fpu_typeTagIn; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_5) begin // @[InputBuffer.scala 54:24]
        data_5_uop_ctrl_fpu_sqrt <= io_in_bits_uop_ctrl_fpu_sqrt; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_5) begin // @[InputBuffer.scala 54:24]
        data_5_uop_ctrl_fpu_rm <= io_in_bits_uop_ctrl_fpu_rm; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_5) begin // @[InputBuffer.scala 54:24]
        data_5_uop_pdest <= io_in_bits_uop_pdest; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_5) begin // @[InputBuffer.scala 54:24]
        data_5_uop_robIdx_flag <= io_in_bits_uop_robIdx_flag; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_5) begin // @[InputBuffer.scala 54:24]
        data_5_uop_robIdx_value <= io_in_bits_uop_robIdx_value; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_6) begin // @[InputBuffer.scala 54:24]
        data_6_src_0 <= io_in_bits_src_0; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_6) begin // @[InputBuffer.scala 54:24]
        data_6_src_1 <= io_in_bits_src_1; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_6) begin // @[InputBuffer.scala 54:24]
        data_6_uop_ctrl_rfWen <= io_in_bits_uop_ctrl_rfWen; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_6) begin // @[InputBuffer.scala 54:24]
        data_6_uop_ctrl_fpWen <= io_in_bits_uop_ctrl_fpWen; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_6) begin // @[InputBuffer.scala 54:24]
        data_6_uop_ctrl_fpu_typeTagIn <= io_in_bits_uop_ctrl_fpu_typeTagIn; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_6) begin // @[InputBuffer.scala 54:24]
        data_6_uop_ctrl_fpu_sqrt <= io_in_bits_uop_ctrl_fpu_sqrt; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_6) begin // @[InputBuffer.scala 54:24]
        data_6_uop_ctrl_fpu_rm <= io_in_bits_uop_ctrl_fpu_rm; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_6) begin // @[InputBuffer.scala 54:24]
        data_6_uop_pdest <= io_in_bits_uop_pdest; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_6) begin // @[InputBuffer.scala 54:24]
        data_6_uop_robIdx_flag <= io_in_bits_uop_robIdx_flag; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_6) begin // @[InputBuffer.scala 54:24]
        data_6_uop_robIdx_value <= io_in_bits_uop_robIdx_value; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_7) begin // @[InputBuffer.scala 54:24]
        data_7_src_0 <= io_in_bits_src_0; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_7) begin // @[InputBuffer.scala 54:24]
        data_7_src_1 <= io_in_bits_src_1; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_7) begin // @[InputBuffer.scala 54:24]
        data_7_uop_ctrl_rfWen <= io_in_bits_uop_ctrl_rfWen; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_7) begin // @[InputBuffer.scala 54:24]
        data_7_uop_ctrl_fpWen <= io_in_bits_uop_ctrl_fpWen; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_7) begin // @[InputBuffer.scala 54:24]
        data_7_uop_ctrl_fpu_typeTagIn <= io_in_bits_uop_ctrl_fpu_typeTagIn; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_7) begin // @[InputBuffer.scala 54:24]
        data_7_uop_ctrl_fpu_sqrt <= io_in_bits_uop_ctrl_fpu_sqrt; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_7) begin // @[InputBuffer.scala 54:24]
        data_7_uop_ctrl_fpu_rm <= io_in_bits_uop_ctrl_fpu_rm; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_7) begin // @[InputBuffer.scala 54:24]
        data_7_uop_pdest <= io_in_bits_uop_pdest; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_7) begin // @[InputBuffer.scala 54:24]
        data_7_uop_robIdx_flag <= io_in_bits_uop_robIdx_flag; // @[InputBuffer.scala 55:17]
      end
    end
    if (doEnqueue) begin // @[InputBuffer.scala 52:20]
      if (enqVec_7) begin // @[InputBuffer.scala 54:24]
        data_7_uop_robIdx_value <= io_in_bits_uop_robIdx_value; // @[InputBuffer.scala 55:17]
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[InputBuffer.scala 95:24]
      emptyVec_0 <= 1'h1; // @[InputBuffer.scala 96:23]
    end else begin
      emptyVec_0 <= flushVec_0 | _GEN_1800;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[InputBuffer.scala 95:24]
      emptyVec_1 <= 1'h1; // @[InputBuffer.scala 96:23]
    end else begin
      emptyVec_1 <= flushVec_1 | _GEN_1801;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[InputBuffer.scala 95:24]
      emptyVec_2 <= 1'h1; // @[InputBuffer.scala 96:23]
    end else begin
      emptyVec_2 <= flushVec_2 | _GEN_1802;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[InputBuffer.scala 95:24]
      emptyVec_3 <= 1'h1; // @[InputBuffer.scala 96:23]
    end else begin
      emptyVec_3 <= flushVec_3 | _GEN_1803;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[InputBuffer.scala 95:24]
      emptyVec_4 <= 1'h1; // @[InputBuffer.scala 96:23]
    end else begin
      emptyVec_4 <= flushVec_4 | _GEN_1804;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[InputBuffer.scala 95:24]
      emptyVec_5 <= 1'h1; // @[InputBuffer.scala 96:23]
    end else begin
      emptyVec_5 <= flushVec_5 | _GEN_1805;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[InputBuffer.scala 95:24]
      emptyVec_6 <= 1'h1; // @[InputBuffer.scala 96:23]
    end else begin
      emptyVec_6 <= flushVec_6 | _GEN_1806;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[InputBuffer.scala 95:24]
      emptyVec_7 <= 1'h1; // @[InputBuffer.scala 96:23]
    end else begin
      emptyVec_7 <= flushVec_7 | _GEN_1807;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[InputBuffer.scala 42:35]
      hasEmpty <= 1'h1;
    end else begin
      hasEmpty <= |_hasEmpty_T;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[InputBuffer.scala 83:36]
      isEmpty <= 1'h0;
    end else begin
      isEmpty <= &_hasEmpty_T;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[InputBuffer.scala 66:15]
      notEmpty <= 1'h0;
    end else begin
      notEmpty <= ~(&_hasEmpty_T);
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {2{`RANDOM}};
  data_0_src_0 = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  data_0_src_1 = _RAND_1[63:0];
  _RAND_2 = {1{`RANDOM}};
  data_0_uop_ctrl_rfWen = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  data_0_uop_ctrl_fpWen = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  data_0_uop_ctrl_fpu_typeTagIn = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  data_0_uop_ctrl_fpu_sqrt = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  data_0_uop_ctrl_fpu_rm = _RAND_6[2:0];
  _RAND_7 = {1{`RANDOM}};
  data_0_uop_pdest = _RAND_7[5:0];
  _RAND_8 = {1{`RANDOM}};
  data_0_uop_robIdx_flag = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  data_0_uop_robIdx_value = _RAND_9[4:0];
  _RAND_10 = {2{`RANDOM}};
  data_1_src_0 = _RAND_10[63:0];
  _RAND_11 = {2{`RANDOM}};
  data_1_src_1 = _RAND_11[63:0];
  _RAND_12 = {1{`RANDOM}};
  data_1_uop_ctrl_rfWen = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  data_1_uop_ctrl_fpWen = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  data_1_uop_ctrl_fpu_typeTagIn = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  data_1_uop_ctrl_fpu_sqrt = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  data_1_uop_ctrl_fpu_rm = _RAND_16[2:0];
  _RAND_17 = {1{`RANDOM}};
  data_1_uop_pdest = _RAND_17[5:0];
  _RAND_18 = {1{`RANDOM}};
  data_1_uop_robIdx_flag = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  data_1_uop_robIdx_value = _RAND_19[4:0];
  _RAND_20 = {2{`RANDOM}};
  data_2_src_0 = _RAND_20[63:0];
  _RAND_21 = {2{`RANDOM}};
  data_2_src_1 = _RAND_21[63:0];
  _RAND_22 = {1{`RANDOM}};
  data_2_uop_ctrl_rfWen = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  data_2_uop_ctrl_fpWen = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  data_2_uop_ctrl_fpu_typeTagIn = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  data_2_uop_ctrl_fpu_sqrt = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  data_2_uop_ctrl_fpu_rm = _RAND_26[2:0];
  _RAND_27 = {1{`RANDOM}};
  data_2_uop_pdest = _RAND_27[5:0];
  _RAND_28 = {1{`RANDOM}};
  data_2_uop_robIdx_flag = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  data_2_uop_robIdx_value = _RAND_29[4:0];
  _RAND_30 = {2{`RANDOM}};
  data_3_src_0 = _RAND_30[63:0];
  _RAND_31 = {2{`RANDOM}};
  data_3_src_1 = _RAND_31[63:0];
  _RAND_32 = {1{`RANDOM}};
  data_3_uop_ctrl_rfWen = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  data_3_uop_ctrl_fpWen = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  data_3_uop_ctrl_fpu_typeTagIn = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  data_3_uop_ctrl_fpu_sqrt = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  data_3_uop_ctrl_fpu_rm = _RAND_36[2:0];
  _RAND_37 = {1{`RANDOM}};
  data_3_uop_pdest = _RAND_37[5:0];
  _RAND_38 = {1{`RANDOM}};
  data_3_uop_robIdx_flag = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  data_3_uop_robIdx_value = _RAND_39[4:0];
  _RAND_40 = {2{`RANDOM}};
  data_4_src_0 = _RAND_40[63:0];
  _RAND_41 = {2{`RANDOM}};
  data_4_src_1 = _RAND_41[63:0];
  _RAND_42 = {1{`RANDOM}};
  data_4_uop_ctrl_rfWen = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  data_4_uop_ctrl_fpWen = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  data_4_uop_ctrl_fpu_typeTagIn = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  data_4_uop_ctrl_fpu_sqrt = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  data_4_uop_ctrl_fpu_rm = _RAND_46[2:0];
  _RAND_47 = {1{`RANDOM}};
  data_4_uop_pdest = _RAND_47[5:0];
  _RAND_48 = {1{`RANDOM}};
  data_4_uop_robIdx_flag = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  data_4_uop_robIdx_value = _RAND_49[4:0];
  _RAND_50 = {2{`RANDOM}};
  data_5_src_0 = _RAND_50[63:0];
  _RAND_51 = {2{`RANDOM}};
  data_5_src_1 = _RAND_51[63:0];
  _RAND_52 = {1{`RANDOM}};
  data_5_uop_ctrl_rfWen = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  data_5_uop_ctrl_fpWen = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  data_5_uop_ctrl_fpu_typeTagIn = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  data_5_uop_ctrl_fpu_sqrt = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  data_5_uop_ctrl_fpu_rm = _RAND_56[2:0];
  _RAND_57 = {1{`RANDOM}};
  data_5_uop_pdest = _RAND_57[5:0];
  _RAND_58 = {1{`RANDOM}};
  data_5_uop_robIdx_flag = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  data_5_uop_robIdx_value = _RAND_59[4:0];
  _RAND_60 = {2{`RANDOM}};
  data_6_src_0 = _RAND_60[63:0];
  _RAND_61 = {2{`RANDOM}};
  data_6_src_1 = _RAND_61[63:0];
  _RAND_62 = {1{`RANDOM}};
  data_6_uop_ctrl_rfWen = _RAND_62[0:0];
  _RAND_63 = {1{`RANDOM}};
  data_6_uop_ctrl_fpWen = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  data_6_uop_ctrl_fpu_typeTagIn = _RAND_64[0:0];
  _RAND_65 = {1{`RANDOM}};
  data_6_uop_ctrl_fpu_sqrt = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  data_6_uop_ctrl_fpu_rm = _RAND_66[2:0];
  _RAND_67 = {1{`RANDOM}};
  data_6_uop_pdest = _RAND_67[5:0];
  _RAND_68 = {1{`RANDOM}};
  data_6_uop_robIdx_flag = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  data_6_uop_robIdx_value = _RAND_69[4:0];
  _RAND_70 = {2{`RANDOM}};
  data_7_src_0 = _RAND_70[63:0];
  _RAND_71 = {2{`RANDOM}};
  data_7_src_1 = _RAND_71[63:0];
  _RAND_72 = {1{`RANDOM}};
  data_7_uop_ctrl_rfWen = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  data_7_uop_ctrl_fpWen = _RAND_73[0:0];
  _RAND_74 = {1{`RANDOM}};
  data_7_uop_ctrl_fpu_typeTagIn = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  data_7_uop_ctrl_fpu_sqrt = _RAND_75[0:0];
  _RAND_76 = {1{`RANDOM}};
  data_7_uop_ctrl_fpu_rm = _RAND_76[2:0];
  _RAND_77 = {1{`RANDOM}};
  data_7_uop_pdest = _RAND_77[5:0];
  _RAND_78 = {1{`RANDOM}};
  data_7_uop_robIdx_flag = _RAND_78[0:0];
  _RAND_79 = {1{`RANDOM}};
  data_7_uop_robIdx_value = _RAND_79[4:0];
  _RAND_80 = {1{`RANDOM}};
  emptyVec_0 = _RAND_80[0:0];
  _RAND_81 = {1{`RANDOM}};
  emptyVec_1 = _RAND_81[0:0];
  _RAND_82 = {1{`RANDOM}};
  emptyVec_2 = _RAND_82[0:0];
  _RAND_83 = {1{`RANDOM}};
  emptyVec_3 = _RAND_83[0:0];
  _RAND_84 = {1{`RANDOM}};
  emptyVec_4 = _RAND_84[0:0];
  _RAND_85 = {1{`RANDOM}};
  emptyVec_5 = _RAND_85[0:0];
  _RAND_86 = {1{`RANDOM}};
  emptyVec_6 = _RAND_86[0:0];
  _RAND_87 = {1{`RANDOM}};
  emptyVec_7 = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  hasEmpty = _RAND_88[0:0];
  _RAND_89 = {1{`RANDOM}};
  isEmpty = _RAND_89[0:0];
  _RAND_90 = {1{`RANDOM}};
  notEmpty = _RAND_90[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    emptyVec_0 = 1'h1;
  end
  if (reset) begin
    emptyVec_1 = 1'h1;
  end
  if (reset) begin
    emptyVec_2 = 1'h1;
  end
  if (reset) begin
    emptyVec_3 = 1'h1;
  end
  if (reset) begin
    emptyVec_4 = 1'h1;
  end
  if (reset) begin
    emptyVec_5 = 1'h1;
  end
  if (reset) begin
    emptyVec_6 = 1'h1;
  end
  if (reset) begin
    emptyVec_7 = 1'h1;
  end
  if (reset) begin
    hasEmpty = 1'h1;
  end
  if (reset) begin
    isEmpty = 1'h0;
  end
  if (reset) begin
    notEmpty = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

