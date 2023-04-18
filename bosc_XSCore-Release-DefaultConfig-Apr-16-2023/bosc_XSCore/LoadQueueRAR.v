module LoadQueueRAR(
  input         clock,
  input         reset,
  input         io_redirect_valid,
  input         io_redirect_bits_robIdx_flag,
  input  [4:0]  io_redirect_bits_robIdx_value,
  input         io_redirect_bits_level,
  input         io_query_0_req_valid,
  input         io_query_0_req_bits_uop_robIdx_flag,
  input  [4:0]  io_query_0_req_bits_uop_robIdx_value,
  input         io_query_0_req_bits_uop_lqIdx_flag,
  input  [3:0]  io_query_0_req_bits_uop_lqIdx_value,
  input  [3:0]  io_query_0_req_bits_index,
  input         io_query_0_req_bits_allocated,
  input         io_query_0_req_bits_datavalid,
  input         io_query_0_req_bits_miss,
  input  [35:0] io_query_0_req_bits_paddr,
  output        io_query_0_resp_valid,
  output [3:0]  io_query_0_resp_bits_index,
  output        io_query_0_resp_bits_canAccept,
  output        io_query_0_resp_bits_allocated,
  output        io_query_0_resp_bits_replayFromFetch,
  input         io_query_1_req_valid,
  input         io_query_1_req_bits_uop_robIdx_flag,
  input  [4:0]  io_query_1_req_bits_uop_robIdx_value,
  input         io_query_1_req_bits_uop_lqIdx_flag,
  input  [3:0]  io_query_1_req_bits_uop_lqIdx_value,
  input  [3:0]  io_query_1_req_bits_index,
  input         io_query_1_req_bits_allocated,
  input         io_query_1_req_bits_datavalid,
  input         io_query_1_req_bits_miss,
  input  [35:0] io_query_1_req_bits_paddr,
  output        io_query_1_resp_valid,
  output [3:0]  io_query_1_resp_bits_index,
  output        io_query_1_resp_bits_canAccept,
  output        io_query_1_resp_bits_allocated,
  output        io_query_1_resp_bits_replayFromFetch,
  input         io_release_valid,
  input  [35:0] io_release_bits_paddr,
  input         io_ldIssuePtr_flag,
  input  [3:0]  io_ldIssuePtr_value,
  output [5:0]  io_perf_0_value,
  output [5:0]  io_perf_1_value,
  output [5:0]  io_perf_2_value
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
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
  reg [31:0] _RAND_91;
  reg [31:0] _RAND_92;
  reg [31:0] _RAND_93;
  reg [31:0] _RAND_94;
  reg [31:0] _RAND_95;
  reg [31:0] _RAND_96;
  reg [63:0] _RAND_97;
  reg [31:0] _RAND_98;
  reg [31:0] _RAND_99;
  reg [31:0] _RAND_100;
  reg [31:0] _RAND_101;
  reg [31:0] _RAND_102;
  reg [31:0] _RAND_103;
  reg [31:0] _RAND_104;
  reg [31:0] _RAND_105;
  reg [31:0] _RAND_106;
  reg [31:0] _RAND_107;
  reg [31:0] _RAND_108;
  reg [31:0] _RAND_109;
  reg [31:0] _RAND_110;
  reg [31:0] _RAND_111;
  reg [31:0] _RAND_112;
  reg [31:0] _RAND_113;
  reg [31:0] _RAND_114;
  reg [31:0] _RAND_115;
  reg [31:0] _RAND_116;
  reg [31:0] _RAND_117;
  reg [31:0] _RAND_118;
  reg [31:0] _RAND_119;
  reg [31:0] _RAND_120;
  reg [31:0] _RAND_121;
  reg [31:0] _RAND_122;
  reg [31:0] _RAND_123;
  reg [31:0] _RAND_124;
  reg [31:0] _RAND_125;
  reg [31:0] _RAND_126;
  reg [31:0] _RAND_127;
  reg [31:0] _RAND_128;
  reg [31:0] _RAND_129;
  reg [31:0] _RAND_130;
  reg [31:0] _RAND_131;
  reg [31:0] _RAND_132;
`endif // RANDOMIZE_REG_INIT
  wire  paddrModule_clock; // @[LoadQueueRAR.scala 56:27]
  wire  paddrModule_io_wen_0; // @[LoadQueueRAR.scala 56:27]
  wire  paddrModule_io_wen_1; // @[LoadQueueRAR.scala 56:27]
  wire [3:0] paddrModule_io_waddr_0; // @[LoadQueueRAR.scala 56:27]
  wire [3:0] paddrModule_io_waddr_1; // @[LoadQueueRAR.scala 56:27]
  wire [35:0] paddrModule_io_wdata_0; // @[LoadQueueRAR.scala 56:27]
  wire [35:0] paddrModule_io_wdata_1; // @[LoadQueueRAR.scala 56:27]
  wire [35:0] paddrModule_io_releaseMdata_1; // @[LoadQueueRAR.scala 56:27]
  wire  paddrModule_io_releaseMmask_1_0; // @[LoadQueueRAR.scala 56:27]
  wire  paddrModule_io_releaseMmask_1_1; // @[LoadQueueRAR.scala 56:27]
  wire  paddrModule_io_releaseMmask_1_2; // @[LoadQueueRAR.scala 56:27]
  wire  paddrModule_io_releaseMmask_1_3; // @[LoadQueueRAR.scala 56:27]
  wire  paddrModule_io_releaseMmask_1_4; // @[LoadQueueRAR.scala 56:27]
  wire  paddrModule_io_releaseMmask_1_5; // @[LoadQueueRAR.scala 56:27]
  wire  paddrModule_io_releaseMmask_1_6; // @[LoadQueueRAR.scala 56:27]
  wire  paddrModule_io_releaseMmask_1_7; // @[LoadQueueRAR.scala 56:27]
  wire  paddrModule_io_releaseMmask_1_8; // @[LoadQueueRAR.scala 56:27]
  wire  paddrModule_io_releaseMmask_1_9; // @[LoadQueueRAR.scala 56:27]
  wire  paddrModule_io_releaseMmask_1_10; // @[LoadQueueRAR.scala 56:27]
  wire  paddrModule_io_releaseMmask_1_11; // @[LoadQueueRAR.scala 56:27]
  wire [35:0] paddrModule_io_releaseViolationMdata_0; // @[LoadQueueRAR.scala 56:27]
  wire [35:0] paddrModule_io_releaseViolationMdata_1; // @[LoadQueueRAR.scala 56:27]
  wire  paddrModule_io_releaseViolationMmask_0_0; // @[LoadQueueRAR.scala 56:27]
  wire  paddrModule_io_releaseViolationMmask_0_1; // @[LoadQueueRAR.scala 56:27]
  wire  paddrModule_io_releaseViolationMmask_0_2; // @[LoadQueueRAR.scala 56:27]
  wire  paddrModule_io_releaseViolationMmask_0_3; // @[LoadQueueRAR.scala 56:27]
  wire  paddrModule_io_releaseViolationMmask_0_4; // @[LoadQueueRAR.scala 56:27]
  wire  paddrModule_io_releaseViolationMmask_0_5; // @[LoadQueueRAR.scala 56:27]
  wire  paddrModule_io_releaseViolationMmask_0_6; // @[LoadQueueRAR.scala 56:27]
  wire  paddrModule_io_releaseViolationMmask_0_7; // @[LoadQueueRAR.scala 56:27]
  wire  paddrModule_io_releaseViolationMmask_0_8; // @[LoadQueueRAR.scala 56:27]
  wire  paddrModule_io_releaseViolationMmask_0_9; // @[LoadQueueRAR.scala 56:27]
  wire  paddrModule_io_releaseViolationMmask_0_10; // @[LoadQueueRAR.scala 56:27]
  wire  paddrModule_io_releaseViolationMmask_0_11; // @[LoadQueueRAR.scala 56:27]
  wire  paddrModule_io_releaseViolationMmask_1_0; // @[LoadQueueRAR.scala 56:27]
  wire  paddrModule_io_releaseViolationMmask_1_1; // @[LoadQueueRAR.scala 56:27]
  wire  paddrModule_io_releaseViolationMmask_1_2; // @[LoadQueueRAR.scala 56:27]
  wire  paddrModule_io_releaseViolationMmask_1_3; // @[LoadQueueRAR.scala 56:27]
  wire  paddrModule_io_releaseViolationMmask_1_4; // @[LoadQueueRAR.scala 56:27]
  wire  paddrModule_io_releaseViolationMmask_1_5; // @[LoadQueueRAR.scala 56:27]
  wire  paddrModule_io_releaseViolationMmask_1_6; // @[LoadQueueRAR.scala 56:27]
  wire  paddrModule_io_releaseViolationMmask_1_7; // @[LoadQueueRAR.scala 56:27]
  wire  paddrModule_io_releaseViolationMmask_1_8; // @[LoadQueueRAR.scala 56:27]
  wire  paddrModule_io_releaseViolationMmask_1_9; // @[LoadQueueRAR.scala 56:27]
  wire  paddrModule_io_releaseViolationMmask_1_10; // @[LoadQueueRAR.scala 56:27]
  wire  paddrModule_io_releaseViolationMmask_1_11; // @[LoadQueueRAR.scala 56:27]
  reg  allocated_0; // @[LoadQueueRAR.scala 54:26]
  reg  allocated_1; // @[LoadQueueRAR.scala 54:26]
  reg  allocated_2; // @[LoadQueueRAR.scala 54:26]
  reg  allocated_3; // @[LoadQueueRAR.scala 54:26]
  reg  allocated_4; // @[LoadQueueRAR.scala 54:26]
  reg  allocated_5; // @[LoadQueueRAR.scala 54:26]
  reg  allocated_6; // @[LoadQueueRAR.scala 54:26]
  reg  allocated_7; // @[LoadQueueRAR.scala 54:26]
  reg  allocated_8; // @[LoadQueueRAR.scala 54:26]
  reg  allocated_9; // @[LoadQueueRAR.scala 54:26]
  reg  allocated_10; // @[LoadQueueRAR.scala 54:26]
  reg  allocated_11; // @[LoadQueueRAR.scala 54:26]
  reg  uop_0_robIdx_flag; // @[LoadQueueRAR.scala 55:16]
  reg [4:0] uop_0_robIdx_value; // @[LoadQueueRAR.scala 55:16]
  reg  uop_0_lqIdx_flag; // @[LoadQueueRAR.scala 55:16]
  reg [3:0] uop_0_lqIdx_value; // @[LoadQueueRAR.scala 55:16]
  reg  uop_1_robIdx_flag; // @[LoadQueueRAR.scala 55:16]
  reg [4:0] uop_1_robIdx_value; // @[LoadQueueRAR.scala 55:16]
  reg  uop_1_lqIdx_flag; // @[LoadQueueRAR.scala 55:16]
  reg [3:0] uop_1_lqIdx_value; // @[LoadQueueRAR.scala 55:16]
  reg  uop_2_robIdx_flag; // @[LoadQueueRAR.scala 55:16]
  reg [4:0] uop_2_robIdx_value; // @[LoadQueueRAR.scala 55:16]
  reg  uop_2_lqIdx_flag; // @[LoadQueueRAR.scala 55:16]
  reg [3:0] uop_2_lqIdx_value; // @[LoadQueueRAR.scala 55:16]
  reg  uop_3_robIdx_flag; // @[LoadQueueRAR.scala 55:16]
  reg [4:0] uop_3_robIdx_value; // @[LoadQueueRAR.scala 55:16]
  reg  uop_3_lqIdx_flag; // @[LoadQueueRAR.scala 55:16]
  reg [3:0] uop_3_lqIdx_value; // @[LoadQueueRAR.scala 55:16]
  reg  uop_4_robIdx_flag; // @[LoadQueueRAR.scala 55:16]
  reg [4:0] uop_4_robIdx_value; // @[LoadQueueRAR.scala 55:16]
  reg  uop_4_lqIdx_flag; // @[LoadQueueRAR.scala 55:16]
  reg [3:0] uop_4_lqIdx_value; // @[LoadQueueRAR.scala 55:16]
  reg  uop_5_robIdx_flag; // @[LoadQueueRAR.scala 55:16]
  reg [4:0] uop_5_robIdx_value; // @[LoadQueueRAR.scala 55:16]
  reg  uop_5_lqIdx_flag; // @[LoadQueueRAR.scala 55:16]
  reg [3:0] uop_5_lqIdx_value; // @[LoadQueueRAR.scala 55:16]
  reg  uop_6_robIdx_flag; // @[LoadQueueRAR.scala 55:16]
  reg [4:0] uop_6_robIdx_value; // @[LoadQueueRAR.scala 55:16]
  reg  uop_6_lqIdx_flag; // @[LoadQueueRAR.scala 55:16]
  reg [3:0] uop_6_lqIdx_value; // @[LoadQueueRAR.scala 55:16]
  reg  uop_7_robIdx_flag; // @[LoadQueueRAR.scala 55:16]
  reg [4:0] uop_7_robIdx_value; // @[LoadQueueRAR.scala 55:16]
  reg  uop_7_lqIdx_flag; // @[LoadQueueRAR.scala 55:16]
  reg [3:0] uop_7_lqIdx_value; // @[LoadQueueRAR.scala 55:16]
  reg  uop_8_robIdx_flag; // @[LoadQueueRAR.scala 55:16]
  reg [4:0] uop_8_robIdx_value; // @[LoadQueueRAR.scala 55:16]
  reg  uop_8_lqIdx_flag; // @[LoadQueueRAR.scala 55:16]
  reg [3:0] uop_8_lqIdx_value; // @[LoadQueueRAR.scala 55:16]
  reg  uop_9_robIdx_flag; // @[LoadQueueRAR.scala 55:16]
  reg [4:0] uop_9_robIdx_value; // @[LoadQueueRAR.scala 55:16]
  reg  uop_9_lqIdx_flag; // @[LoadQueueRAR.scala 55:16]
  reg [3:0] uop_9_lqIdx_value; // @[LoadQueueRAR.scala 55:16]
  reg  uop_10_robIdx_flag; // @[LoadQueueRAR.scala 55:16]
  reg [4:0] uop_10_robIdx_value; // @[LoadQueueRAR.scala 55:16]
  reg  uop_10_lqIdx_flag; // @[LoadQueueRAR.scala 55:16]
  reg [3:0] uop_10_lqIdx_value; // @[LoadQueueRAR.scala 55:16]
  reg  uop_11_robIdx_flag; // @[LoadQueueRAR.scala 55:16]
  reg [4:0] uop_11_robIdx_value; // @[LoadQueueRAR.scala 55:16]
  reg  uop_11_lqIdx_flag; // @[LoadQueueRAR.scala 55:16]
  reg [3:0] uop_11_lqIdx_value; // @[LoadQueueRAR.scala 55:16]
  reg  released_0; // @[LoadQueueRAR.scala 65:25]
  reg  released_1; // @[LoadQueueRAR.scala 65:25]
  reg  released_2; // @[LoadQueueRAR.scala 65:25]
  reg  released_3; // @[LoadQueueRAR.scala 65:25]
  reg  released_4; // @[LoadQueueRAR.scala 65:25]
  reg  released_5; // @[LoadQueueRAR.scala 65:25]
  reg  released_6; // @[LoadQueueRAR.scala 65:25]
  reg  released_7; // @[LoadQueueRAR.scala 65:25]
  reg  released_8; // @[LoadQueueRAR.scala 65:25]
  reg  released_9; // @[LoadQueueRAR.scala 65:25]
  reg  released_10; // @[LoadQueueRAR.scala 65:25]
  reg  released_11; // @[LoadQueueRAR.scala 65:25]
  reg  datavalid_0; // @[LoadQueueRAR.scala 66:26]
  reg  datavalid_1; // @[LoadQueueRAR.scala 66:26]
  reg  datavalid_2; // @[LoadQueueRAR.scala 66:26]
  reg  datavalid_3; // @[LoadQueueRAR.scala 66:26]
  reg  datavalid_4; // @[LoadQueueRAR.scala 66:26]
  reg  datavalid_5; // @[LoadQueueRAR.scala 66:26]
  reg  datavalid_6; // @[LoadQueueRAR.scala 66:26]
  reg  datavalid_7; // @[LoadQueueRAR.scala 66:26]
  reg  datavalid_8; // @[LoadQueueRAR.scala 66:26]
  reg  datavalid_9; // @[LoadQueueRAR.scala 66:26]
  reg  datavalid_10; // @[LoadQueueRAR.scala 66:26]
  reg  datavalid_11; // @[LoadQueueRAR.scala 66:26]
  reg  miss_0; // @[LoadQueueRAR.scala 67:21]
  reg  miss_1; // @[LoadQueueRAR.scala 67:21]
  reg  miss_2; // @[LoadQueueRAR.scala 67:21]
  reg  miss_3; // @[LoadQueueRAR.scala 67:21]
  reg  miss_4; // @[LoadQueueRAR.scala 67:21]
  reg  miss_5; // @[LoadQueueRAR.scala 67:21]
  reg  miss_6; // @[LoadQueueRAR.scala 67:21]
  reg  miss_7; // @[LoadQueueRAR.scala 67:21]
  reg  miss_8; // @[LoadQueueRAR.scala 67:21]
  reg  miss_9; // @[LoadQueueRAR.scala 67:21]
  reg  miss_10; // @[LoadQueueRAR.scala 67:21]
  reg  miss_11; // @[LoadQueueRAR.scala 67:21]
  wire [1:0] _freeNums_T = allocated_1 + allocated_2; // @[Bitwise.scala 48:55]
  wire [1:0] _GEN_5551 = {{1'd0}, allocated_0}; // @[Bitwise.scala 48:55]
  wire [2:0] _freeNums_T_2 = _GEN_5551 + _freeNums_T; // @[Bitwise.scala 48:55]
  wire [1:0] _freeNums_T_4 = allocated_4 + allocated_5; // @[Bitwise.scala 48:55]
  wire [1:0] _GEN_5552 = {{1'd0}, allocated_3}; // @[Bitwise.scala 48:55]
  wire [2:0] _freeNums_T_6 = _GEN_5552 + _freeNums_T_4; // @[Bitwise.scala 48:55]
  wire [2:0] _freeNums_T_8 = _freeNums_T_2[1:0] + _freeNums_T_6[1:0]; // @[Bitwise.scala 48:55]
  wire [1:0] _freeNums_T_10 = allocated_7 + allocated_8; // @[Bitwise.scala 48:55]
  wire [1:0] _GEN_5553 = {{1'd0}, allocated_6}; // @[Bitwise.scala 48:55]
  wire [2:0] _freeNums_T_12 = _GEN_5553 + _freeNums_T_10; // @[Bitwise.scala 48:55]
  wire [1:0] _freeNums_T_14 = allocated_10 + allocated_11; // @[Bitwise.scala 48:55]
  wire [1:0] _GEN_5554 = {{1'd0}, allocated_9}; // @[Bitwise.scala 48:55]
  wire [2:0] _freeNums_T_16 = _GEN_5554 + _freeNums_T_14; // @[Bitwise.scala 48:55]
  wire [2:0] _freeNums_T_18 = _freeNums_T_12[1:0] + _freeNums_T_16[1:0]; // @[Bitwise.scala 48:55]
  wire [3:0] _freeNums_T_20 = _freeNums_T_8 + _freeNums_T_18; // @[Bitwise.scala 48:55]
  wire [3:0] freeNums = 4'hc - _freeNums_T_20; // @[LoadQueueRAR.scala 70:37]
  reg  release2Cycle_valid; // @[LoadQueueRAR.scala 74:30]
  reg [35:0] release2Cycle_bits_paddr; // @[LoadQueueRAR.scala 74:30]
  wire  canEnqueue_0 = io_query_0_req_valid & ~io_query_0_req_bits_allocated; // @[LoadQueueRAR.scala 77:61]
  wire  canEnqueue_1 = io_query_1_req_valid & ~io_query_1_req_bits_allocated; // @[LoadQueueRAR.scala 77:61]
  wire [5:0] _cancelEnqueue_flushItself_T_1 = {io_query_0_req_bits_uop_robIdx_flag,io_query_0_req_bits_uop_robIdx_value}
    ; // @[CircularQueuePtr.scala 61:50]
  wire [5:0] _cancelEnqueue_flushItself_T_2 = {io_redirect_bits_robIdx_flag,io_redirect_bits_robIdx_value}; // @[CircularQueuePtr.scala 61:70]
  wire  _cancelEnqueue_flushItself_T_3 = _cancelEnqueue_flushItself_T_1 == _cancelEnqueue_flushItself_T_2; // @[CircularQueuePtr.scala 61:52]
  wire  cancelEnqueue_flushItself = io_redirect_bits_level & _cancelEnqueue_flushItself_T_3; // @[Rob.scala 122:51]
  wire  cancelEnqueue_differentFlag = io_query_0_req_bits_uop_robIdx_flag ^ io_redirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  cancelEnqueue_compare = io_query_0_req_bits_uop_robIdx_value > io_redirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _cancelEnqueue_T = cancelEnqueue_differentFlag ^ cancelEnqueue_compare; // @[CircularQueuePtr.scala 88:19]
  wire  cancelEnqueue_0 = io_redirect_valid & (cancelEnqueue_flushItself | _cancelEnqueue_T); // @[Rob.scala 123:20]
  wire [5:0] _cancelEnqueue_flushItself_T_5 = {io_query_1_req_bits_uop_robIdx_flag,io_query_1_req_bits_uop_robIdx_value}
    ; // @[CircularQueuePtr.scala 61:50]
  wire  _cancelEnqueue_flushItself_T_7 = _cancelEnqueue_flushItself_T_5 == _cancelEnqueue_flushItself_T_2; // @[CircularQueuePtr.scala 61:52]
  wire  cancelEnqueue_flushItself_1 = io_redirect_bits_level & _cancelEnqueue_flushItself_T_7; // @[Rob.scala 122:51]
  wire  cancelEnqueue_differentFlag_1 = io_query_1_req_bits_uop_robIdx_flag ^ io_redirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  cancelEnqueue_compare_1 = io_query_1_req_bits_uop_robIdx_value > io_redirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _cancelEnqueue_T_2 = cancelEnqueue_differentFlag_1 ^ cancelEnqueue_compare_1; // @[CircularQueuePtr.scala 88:19]
  wire  cancelEnqueue_1 = io_redirect_valid & (cancelEnqueue_flushItself_1 | _cancelEnqueue_T_2); // @[Rob.scala 123:20]
  wire  hasNotWritebackedLoad_differentFlag = io_query_0_req_bits_uop_lqIdx_flag ^ io_ldIssuePtr_flag; // @[CircularQueuePtr.scala 86:35]
  wire  hasNotWritebackedLoad_compare = io_query_0_req_bits_uop_lqIdx_value > io_ldIssuePtr_value; // @[CircularQueuePtr.scala 87:30]
  wire  hasNotWritebackedLoad_0 = hasNotWritebackedLoad_differentFlag ^ hasNotWritebackedLoad_compare; // @[CircularQueuePtr.scala 88:19]
  wire  hasNotWritebackedLoad_differentFlag_1 = io_query_1_req_bits_uop_lqIdx_flag ^ io_ldIssuePtr_flag; // @[CircularQueuePtr.scala 86:35]
  wire  hasNotWritebackedLoad_compare_1 = io_query_1_req_bits_uop_lqIdx_value > io_ldIssuePtr_value; // @[CircularQueuePtr.scala 87:30]
  wire  hasNotWritebackedLoad_1 = hasNotWritebackedLoad_differentFlag_1 ^ hasNotWritebackedLoad_compare_1; // @[CircularQueuePtr.scala 88:19]
  wire  needEnqueue_0 = canEnqueue_0 & hasNotWritebackedLoad_0 & ~cancelEnqueue_0; // @[LoadQueueRAR.scala 80:111]
  wire  needEnqueue_1 = canEnqueue_1 & hasNotWritebackedLoad_1 & ~cancelEnqueue_1; // @[LoadQueueRAR.scala 80:111]
  wire [5:0] enqIdxOH_lo = {allocated_5,allocated_4,allocated_3,allocated_2,allocated_1,allocated_0}; // @[LoadQueueRAR.scala 81:42]
  wire [5:0] enqIdxOH_hi = {allocated_11,allocated_10,allocated_9,allocated_8,allocated_7,allocated_6}; // @[LoadQueueRAR.scala 81:42]
  wire [11:0] _enqIdxOH_T = {allocated_11,allocated_10,allocated_9,allocated_8,allocated_7,allocated_6,enqIdxOH_lo}; // @[LoadQueueRAR.scala 81:42]
  wire [11:0] _enqIdxOH_T_1 = ~_enqIdxOH_T; // @[LoadQueueRAR.scala 81:31]
  wire [3:0] _GEN_5555 = {{3'd0}, needEnqueue_0}; // @[LoadQueueRAR.scala 89:33]
  wire  canAcceptVec_1 = freeNums > _GEN_5555; // @[LoadQueueRAR.scala 89:33]
  wire  canEnqVec_1 = needEnqueue_1 & canAcceptVec_1; // @[LoadQueueRAR.scala 91:26]
  wire  canAcceptVec_0 = freeNums > 4'h0; // @[LoadQueueRAR.scala 89:33]
  wire  canEnqVec_0 = needEnqueue_0 & canAcceptVec_0; // @[LoadQueueRAR.scala 91:26]
  wire [1:0] _enqIdxOH_T_2 = {canEnqVec_1,canEnqVec_0}; // @[LoadQueueRAR.scala 81:79]
  wire [11:0] _enqIdxOH_sels_0_T_12 = _enqIdxOH_T_1[11] ? 12'h800 : 12'h0; // @[Mux.scala 47:70]
  wire [11:0] _enqIdxOH_sels_0_T_13 = _enqIdxOH_T_1[10] ? 12'h400 : _enqIdxOH_sels_0_T_12; // @[Mux.scala 47:70]
  wire [11:0] _enqIdxOH_sels_0_T_14 = _enqIdxOH_T_1[9] ? 12'h200 : _enqIdxOH_sels_0_T_13; // @[Mux.scala 47:70]
  wire [11:0] _enqIdxOH_sels_0_T_15 = _enqIdxOH_T_1[8] ? 12'h100 : _enqIdxOH_sels_0_T_14; // @[Mux.scala 47:70]
  wire [11:0] _enqIdxOH_sels_0_T_16 = _enqIdxOH_T_1[7] ? 12'h80 : _enqIdxOH_sels_0_T_15; // @[Mux.scala 47:70]
  wire [11:0] _enqIdxOH_sels_0_T_17 = _enqIdxOH_T_1[6] ? 12'h40 : _enqIdxOH_sels_0_T_16; // @[Mux.scala 47:70]
  wire [11:0] _enqIdxOH_sels_0_T_18 = _enqIdxOH_T_1[5] ? 12'h20 : _enqIdxOH_sels_0_T_17; // @[Mux.scala 47:70]
  wire [11:0] _enqIdxOH_sels_0_T_19 = _enqIdxOH_T_1[4] ? 12'h10 : _enqIdxOH_sels_0_T_18; // @[Mux.scala 47:70]
  wire [11:0] _enqIdxOH_sels_0_T_20 = _enqIdxOH_T_1[3] ? 12'h8 : _enqIdxOH_sels_0_T_19; // @[Mux.scala 47:70]
  wire [11:0] _enqIdxOH_sels_0_T_21 = _enqIdxOH_T_1[2] ? 12'h4 : _enqIdxOH_sels_0_T_20; // @[Mux.scala 47:70]
  wire [11:0] _enqIdxOH_sels_0_T_22 = _enqIdxOH_T_1[1] ? 12'h2 : _enqIdxOH_sels_0_T_21; // @[Mux.scala 47:70]
  wire [11:0] _enqIdxOH_sels_0_T_23 = _enqIdxOH_T_1[0] ? 12'h1 : _enqIdxOH_sels_0_T_22; // @[Mux.scala 47:70]
  wire [11:0] _enqIdxOH_sels_0_T_26 = _enqIdxOH_T_2[0] ? 12'hfff : 12'h0; // @[Bitwise.scala 74:12]
  wire [11:0] enqIdxOH_0 = _enqIdxOH_sels_0_T_23 & _enqIdxOH_sels_0_T_26; // @[BitUtils.scala 360:42]
  wire [11:0] _enqIdxOH_T_3 = ~enqIdxOH_0; // @[BitUtils.scala 361:21]
  wire [11:0] _enqIdxOH_T_4 = _enqIdxOH_T_1 & _enqIdxOH_T_3; // @[BitUtils.scala 361:19]
  wire [11:0] _enqIdxOH_sels_1_T_12 = _enqIdxOH_T_4[11] ? 12'h800 : 12'h0; // @[Mux.scala 47:70]
  wire [11:0] _enqIdxOH_sels_1_T_13 = _enqIdxOH_T_4[10] ? 12'h400 : _enqIdxOH_sels_1_T_12; // @[Mux.scala 47:70]
  wire [11:0] _enqIdxOH_sels_1_T_14 = _enqIdxOH_T_4[9] ? 12'h200 : _enqIdxOH_sels_1_T_13; // @[Mux.scala 47:70]
  wire [11:0] _enqIdxOH_sels_1_T_15 = _enqIdxOH_T_4[8] ? 12'h100 : _enqIdxOH_sels_1_T_14; // @[Mux.scala 47:70]
  wire [11:0] _enqIdxOH_sels_1_T_16 = _enqIdxOH_T_4[7] ? 12'h80 : _enqIdxOH_sels_1_T_15; // @[Mux.scala 47:70]
  wire [11:0] _enqIdxOH_sels_1_T_17 = _enqIdxOH_T_4[6] ? 12'h40 : _enqIdxOH_sels_1_T_16; // @[Mux.scala 47:70]
  wire [11:0] _enqIdxOH_sels_1_T_18 = _enqIdxOH_T_4[5] ? 12'h20 : _enqIdxOH_sels_1_T_17; // @[Mux.scala 47:70]
  wire [11:0] _enqIdxOH_sels_1_T_19 = _enqIdxOH_T_4[4] ? 12'h10 : _enqIdxOH_sels_1_T_18; // @[Mux.scala 47:70]
  wire [11:0] _enqIdxOH_sels_1_T_20 = _enqIdxOH_T_4[3] ? 12'h8 : _enqIdxOH_sels_1_T_19; // @[Mux.scala 47:70]
  wire [11:0] _enqIdxOH_sels_1_T_21 = _enqIdxOH_T_4[2] ? 12'h4 : _enqIdxOH_sels_1_T_20; // @[Mux.scala 47:70]
  wire [11:0] _enqIdxOH_sels_1_T_22 = _enqIdxOH_T_4[1] ? 12'h2 : _enqIdxOH_sels_1_T_21; // @[Mux.scala 47:70]
  wire [11:0] _enqIdxOH_sels_1_T_23 = _enqIdxOH_T_4[0] ? 12'h1 : _enqIdxOH_sels_1_T_22; // @[Mux.scala 47:70]
  wire [11:0] _enqIdxOH_sels_1_T_26 = _enqIdxOH_T_2[1] ? 12'hfff : 12'h0; // @[Bitwise.scala 74:12]
  wire [11:0] enqIdxOH_1 = _enqIdxOH_sels_1_T_23 & _enqIdxOH_sels_1_T_26; // @[BitUtils.scala 360:42]
  wire [3:0] enqIdx_hi = enqIdxOH_0[11:8]; // @[OneHot.scala 30:18]
  wire [7:0] enqIdx_lo = enqIdxOH_0[7:0]; // @[OneHot.scala 31:18]
  wire  _enqIdx_T = |enqIdx_hi; // @[OneHot.scala 32:14]
  wire [7:0] _GEN_5556 = {{4'd0}, enqIdx_hi}; // @[OneHot.scala 32:28]
  wire [7:0] _enqIdx_T_1 = _GEN_5556 | enqIdx_lo; // @[OneHot.scala 32:28]
  wire [3:0] enqIdx_hi_1 = _enqIdx_T_1[7:4]; // @[OneHot.scala 30:18]
  wire [3:0] enqIdx_lo_1 = _enqIdx_T_1[3:0]; // @[OneHot.scala 31:18]
  wire  _enqIdx_T_2 = |enqIdx_hi_1; // @[OneHot.scala 32:14]
  wire [3:0] _enqIdx_T_3 = enqIdx_hi_1 | enqIdx_lo_1; // @[OneHot.scala 32:28]
  wire [1:0] enqIdx_hi_2 = _enqIdx_T_3[3:2]; // @[OneHot.scala 30:18]
  wire [1:0] enqIdx_lo_2 = _enqIdx_T_3[1:0]; // @[OneHot.scala 31:18]
  wire  _enqIdx_T_4 = |enqIdx_hi_2; // @[OneHot.scala 32:14]
  wire [1:0] _enqIdx_T_5 = enqIdx_hi_2 | enqIdx_lo_2; // @[OneHot.scala 32:28]
  wire [2:0] _enqIdx_T_8 = {_enqIdx_T_2,_enqIdx_T_4,_enqIdx_T_5[1]}; // @[Cat.scala 31:58]
  wire [3:0] enqIdx = {_enqIdx_T,_enqIdx_T_2,_enqIdx_T_4,_enqIdx_T_5[1]}; // @[Cat.scala 31:58]
  wire  _GEN_0 = 4'h0 == enqIdx | allocated_0; // @[LoadQueueRAR.scala 96:{25,25} 54:26]
  wire  _GEN_1 = 4'h1 == enqIdx | allocated_1; // @[LoadQueueRAR.scala 96:{25,25} 54:26]
  wire  _GEN_2 = 4'h2 == enqIdx | allocated_2; // @[LoadQueueRAR.scala 96:{25,25} 54:26]
  wire  _GEN_3 = 4'h3 == enqIdx | allocated_3; // @[LoadQueueRAR.scala 96:{25,25} 54:26]
  wire  _GEN_4 = 4'h4 == enqIdx | allocated_4; // @[LoadQueueRAR.scala 96:{25,25} 54:26]
  wire  _GEN_5 = 4'h5 == enqIdx | allocated_5; // @[LoadQueueRAR.scala 96:{25,25} 54:26]
  wire  _GEN_6 = 4'h6 == enqIdx | allocated_6; // @[LoadQueueRAR.scala 96:{25,25} 54:26]
  wire  _GEN_7 = 4'h7 == enqIdx | allocated_7; // @[LoadQueueRAR.scala 96:{25,25} 54:26]
  wire  _GEN_8 = 4'h8 == enqIdx | allocated_8; // @[LoadQueueRAR.scala 96:{25,25} 54:26]
  wire  _GEN_9 = 4'h9 == enqIdx | allocated_9; // @[LoadQueueRAR.scala 96:{25,25} 54:26]
  wire  _GEN_10 = 4'ha == enqIdx | allocated_10; // @[LoadQueueRAR.scala 96:{25,25} 54:26]
  wire  _GEN_11 = 4'hb == enqIdx | allocated_11; // @[LoadQueueRAR.scala 96:{25,25} 54:26]
  wire  _GEN_1104 = 4'h0 == enqIdx ? io_query_0_req_bits_uop_robIdx_flag : uop_0_robIdx_flag; // @[LoadQueueRAR.scala 104:{19,19} 55:16]
  wire  _GEN_1105 = 4'h1 == enqIdx ? io_query_0_req_bits_uop_robIdx_flag : uop_1_robIdx_flag; // @[LoadQueueRAR.scala 104:{19,19} 55:16]
  wire  _GEN_1106 = 4'h2 == enqIdx ? io_query_0_req_bits_uop_robIdx_flag : uop_2_robIdx_flag; // @[LoadQueueRAR.scala 104:{19,19} 55:16]
  wire  _GEN_1107 = 4'h3 == enqIdx ? io_query_0_req_bits_uop_robIdx_flag : uop_3_robIdx_flag; // @[LoadQueueRAR.scala 104:{19,19} 55:16]
  wire  _GEN_1108 = 4'h4 == enqIdx ? io_query_0_req_bits_uop_robIdx_flag : uop_4_robIdx_flag; // @[LoadQueueRAR.scala 104:{19,19} 55:16]
  wire  _GEN_1109 = 4'h5 == enqIdx ? io_query_0_req_bits_uop_robIdx_flag : uop_5_robIdx_flag; // @[LoadQueueRAR.scala 104:{19,19} 55:16]
  wire  _GEN_1110 = 4'h6 == enqIdx ? io_query_0_req_bits_uop_robIdx_flag : uop_6_robIdx_flag; // @[LoadQueueRAR.scala 104:{19,19} 55:16]
  wire  _GEN_1111 = 4'h7 == enqIdx ? io_query_0_req_bits_uop_robIdx_flag : uop_7_robIdx_flag; // @[LoadQueueRAR.scala 104:{19,19} 55:16]
  wire  _GEN_1112 = 4'h8 == enqIdx ? io_query_0_req_bits_uop_robIdx_flag : uop_8_robIdx_flag; // @[LoadQueueRAR.scala 104:{19,19} 55:16]
  wire  _GEN_1113 = 4'h9 == enqIdx ? io_query_0_req_bits_uop_robIdx_flag : uop_9_robIdx_flag; // @[LoadQueueRAR.scala 104:{19,19} 55:16]
  wire  _GEN_1114 = 4'ha == enqIdx ? io_query_0_req_bits_uop_robIdx_flag : uop_10_robIdx_flag; // @[LoadQueueRAR.scala 104:{19,19} 55:16]
  wire  _GEN_1115 = 4'hb == enqIdx ? io_query_0_req_bits_uop_robIdx_flag : uop_11_robIdx_flag; // @[LoadQueueRAR.scala 104:{19,19} 55:16]
  wire [4:0] _GEN_1116 = 4'h0 == enqIdx ? io_query_0_req_bits_uop_robIdx_value : uop_0_robIdx_value; // @[LoadQueueRAR.scala 104:{19,19} 55:16]
  wire [4:0] _GEN_1117 = 4'h1 == enqIdx ? io_query_0_req_bits_uop_robIdx_value : uop_1_robIdx_value; // @[LoadQueueRAR.scala 104:{19,19} 55:16]
  wire [4:0] _GEN_1118 = 4'h2 == enqIdx ? io_query_0_req_bits_uop_robIdx_value : uop_2_robIdx_value; // @[LoadQueueRAR.scala 104:{19,19} 55:16]
  wire [4:0] _GEN_1119 = 4'h3 == enqIdx ? io_query_0_req_bits_uop_robIdx_value : uop_3_robIdx_value; // @[LoadQueueRAR.scala 104:{19,19} 55:16]
  wire [4:0] _GEN_1120 = 4'h4 == enqIdx ? io_query_0_req_bits_uop_robIdx_value : uop_4_robIdx_value; // @[LoadQueueRAR.scala 104:{19,19} 55:16]
  wire [4:0] _GEN_1121 = 4'h5 == enqIdx ? io_query_0_req_bits_uop_robIdx_value : uop_5_robIdx_value; // @[LoadQueueRAR.scala 104:{19,19} 55:16]
  wire [4:0] _GEN_1122 = 4'h6 == enqIdx ? io_query_0_req_bits_uop_robIdx_value : uop_6_robIdx_value; // @[LoadQueueRAR.scala 104:{19,19} 55:16]
  wire [4:0] _GEN_1123 = 4'h7 == enqIdx ? io_query_0_req_bits_uop_robIdx_value : uop_7_robIdx_value; // @[LoadQueueRAR.scala 104:{19,19} 55:16]
  wire [4:0] _GEN_1124 = 4'h8 == enqIdx ? io_query_0_req_bits_uop_robIdx_value : uop_8_robIdx_value; // @[LoadQueueRAR.scala 104:{19,19} 55:16]
  wire [4:0] _GEN_1125 = 4'h9 == enqIdx ? io_query_0_req_bits_uop_robIdx_value : uop_9_robIdx_value; // @[LoadQueueRAR.scala 104:{19,19} 55:16]
  wire [4:0] _GEN_1126 = 4'ha == enqIdx ? io_query_0_req_bits_uop_robIdx_value : uop_10_robIdx_value; // @[LoadQueueRAR.scala 104:{19,19} 55:16]
  wire [4:0] _GEN_1127 = 4'hb == enqIdx ? io_query_0_req_bits_uop_robIdx_value : uop_11_robIdx_value; // @[LoadQueueRAR.scala 104:{19,19} 55:16]
  wire  _GEN_1128 = 4'h0 == enqIdx ? io_query_0_req_bits_uop_lqIdx_flag : uop_0_lqIdx_flag; // @[LoadQueueRAR.scala 104:{19,19} 55:16]
  wire  _GEN_1129 = 4'h1 == enqIdx ? io_query_0_req_bits_uop_lqIdx_flag : uop_1_lqIdx_flag; // @[LoadQueueRAR.scala 104:{19,19} 55:16]
  wire  _GEN_1130 = 4'h2 == enqIdx ? io_query_0_req_bits_uop_lqIdx_flag : uop_2_lqIdx_flag; // @[LoadQueueRAR.scala 104:{19,19} 55:16]
  wire  _GEN_1131 = 4'h3 == enqIdx ? io_query_0_req_bits_uop_lqIdx_flag : uop_3_lqIdx_flag; // @[LoadQueueRAR.scala 104:{19,19} 55:16]
  wire  _GEN_1132 = 4'h4 == enqIdx ? io_query_0_req_bits_uop_lqIdx_flag : uop_4_lqIdx_flag; // @[LoadQueueRAR.scala 104:{19,19} 55:16]
  wire  _GEN_1133 = 4'h5 == enqIdx ? io_query_0_req_bits_uop_lqIdx_flag : uop_5_lqIdx_flag; // @[LoadQueueRAR.scala 104:{19,19} 55:16]
  wire  _GEN_1134 = 4'h6 == enqIdx ? io_query_0_req_bits_uop_lqIdx_flag : uop_6_lqIdx_flag; // @[LoadQueueRAR.scala 104:{19,19} 55:16]
  wire  _GEN_1135 = 4'h7 == enqIdx ? io_query_0_req_bits_uop_lqIdx_flag : uop_7_lqIdx_flag; // @[LoadQueueRAR.scala 104:{19,19} 55:16]
  wire  _GEN_1136 = 4'h8 == enqIdx ? io_query_0_req_bits_uop_lqIdx_flag : uop_8_lqIdx_flag; // @[LoadQueueRAR.scala 104:{19,19} 55:16]
  wire  _GEN_1137 = 4'h9 == enqIdx ? io_query_0_req_bits_uop_lqIdx_flag : uop_9_lqIdx_flag; // @[LoadQueueRAR.scala 104:{19,19} 55:16]
  wire  _GEN_1138 = 4'ha == enqIdx ? io_query_0_req_bits_uop_lqIdx_flag : uop_10_lqIdx_flag; // @[LoadQueueRAR.scala 104:{19,19} 55:16]
  wire  _GEN_1139 = 4'hb == enqIdx ? io_query_0_req_bits_uop_lqIdx_flag : uop_11_lqIdx_flag; // @[LoadQueueRAR.scala 104:{19,19} 55:16]
  wire [3:0] _GEN_1140 = 4'h0 == enqIdx ? io_query_0_req_bits_uop_lqIdx_value : uop_0_lqIdx_value; // @[LoadQueueRAR.scala 104:{19,19} 55:16]
  wire [3:0] _GEN_1141 = 4'h1 == enqIdx ? io_query_0_req_bits_uop_lqIdx_value : uop_1_lqIdx_value; // @[LoadQueueRAR.scala 104:{19,19} 55:16]
  wire [3:0] _GEN_1142 = 4'h2 == enqIdx ? io_query_0_req_bits_uop_lqIdx_value : uop_2_lqIdx_value; // @[LoadQueueRAR.scala 104:{19,19} 55:16]
  wire [3:0] _GEN_1143 = 4'h3 == enqIdx ? io_query_0_req_bits_uop_lqIdx_value : uop_3_lqIdx_value; // @[LoadQueueRAR.scala 104:{19,19} 55:16]
  wire [3:0] _GEN_1144 = 4'h4 == enqIdx ? io_query_0_req_bits_uop_lqIdx_value : uop_4_lqIdx_value; // @[LoadQueueRAR.scala 104:{19,19} 55:16]
  wire [3:0] _GEN_1145 = 4'h5 == enqIdx ? io_query_0_req_bits_uop_lqIdx_value : uop_5_lqIdx_value; // @[LoadQueueRAR.scala 104:{19,19} 55:16]
  wire [3:0] _GEN_1146 = 4'h6 == enqIdx ? io_query_0_req_bits_uop_lqIdx_value : uop_6_lqIdx_value; // @[LoadQueueRAR.scala 104:{19,19} 55:16]
  wire [3:0] _GEN_1147 = 4'h7 == enqIdx ? io_query_0_req_bits_uop_lqIdx_value : uop_7_lqIdx_value; // @[LoadQueueRAR.scala 104:{19,19} 55:16]
  wire [3:0] _GEN_1148 = 4'h8 == enqIdx ? io_query_0_req_bits_uop_lqIdx_value : uop_8_lqIdx_value; // @[LoadQueueRAR.scala 104:{19,19} 55:16]
  wire [3:0] _GEN_1149 = 4'h9 == enqIdx ? io_query_0_req_bits_uop_lqIdx_value : uop_9_lqIdx_value; // @[LoadQueueRAR.scala 104:{19,19} 55:16]
  wire [3:0] _GEN_1150 = 4'ha == enqIdx ? io_query_0_req_bits_uop_lqIdx_value : uop_10_lqIdx_value; // @[LoadQueueRAR.scala 104:{19,19} 55:16]
  wire [3:0] _GEN_1151 = 4'hb == enqIdx ? io_query_0_req_bits_uop_lqIdx_value : uop_11_lqIdx_value; // @[LoadQueueRAR.scala 104:{19,19} 55:16]
  wire  _released_T_2 = io_query_0_req_bits_paddr[35:6] == release2Cycle_bits_paddr[35:6]; // @[LoadQueueRAR.scala 107:55]
  wire  _released_T_3 = release2Cycle_valid & _released_T_2; // @[LoadQueueRAR.scala 106:29]
  wire  _released_T_6 = io_query_0_req_bits_paddr[35:6] == io_release_bits_paddr[35:6]; // @[LoadQueueRAR.scala 109:55]
  wire  _released_T_7 = io_release_valid & _released_T_6; // @[LoadQueueRAR.scala 108:29]
  wire  _released_T_8 = _released_T_3 | _released_T_7; // @[LoadQueueRAR.scala 107:115]
  wire  _GEN_1308 = 4'h0 == enqIdx ? _released_T_8 : released_0; // @[LoadQueueRAR.scala 105:{24,24} 65:25]
  wire  _GEN_1309 = 4'h1 == enqIdx ? _released_T_8 : released_1; // @[LoadQueueRAR.scala 105:{24,24} 65:25]
  wire  _GEN_1310 = 4'h2 == enqIdx ? _released_T_8 : released_2; // @[LoadQueueRAR.scala 105:{24,24} 65:25]
  wire  _GEN_1311 = 4'h3 == enqIdx ? _released_T_8 : released_3; // @[LoadQueueRAR.scala 105:{24,24} 65:25]
  wire  _GEN_1312 = 4'h4 == enqIdx ? _released_T_8 : released_4; // @[LoadQueueRAR.scala 105:{24,24} 65:25]
  wire  _GEN_1313 = 4'h5 == enqIdx ? _released_T_8 : released_5; // @[LoadQueueRAR.scala 105:{24,24} 65:25]
  wire  _GEN_1314 = 4'h6 == enqIdx ? _released_T_8 : released_6; // @[LoadQueueRAR.scala 105:{24,24} 65:25]
  wire  _GEN_1315 = 4'h7 == enqIdx ? _released_T_8 : released_7; // @[LoadQueueRAR.scala 105:{24,24} 65:25]
  wire  _GEN_1316 = 4'h8 == enqIdx ? _released_T_8 : released_8; // @[LoadQueueRAR.scala 105:{24,24} 65:25]
  wire  _GEN_1317 = 4'h9 == enqIdx ? _released_T_8 : released_9; // @[LoadQueueRAR.scala 105:{24,24} 65:25]
  wire  _GEN_1318 = 4'ha == enqIdx ? _released_T_8 : released_10; // @[LoadQueueRAR.scala 105:{24,24} 65:25]
  wire  _GEN_1319 = 4'hb == enqIdx ? _released_T_8 : released_11; // @[LoadQueueRAR.scala 105:{24,24} 65:25]
  wire  _GEN_1320 = 4'h0 == enqIdx ? io_query_0_req_bits_datavalid : datavalid_0; // @[LoadQueueRAR.scala 110:{25,25} 66:26]
  wire  _GEN_1321 = 4'h1 == enqIdx ? io_query_0_req_bits_datavalid : datavalid_1; // @[LoadQueueRAR.scala 110:{25,25} 66:26]
  wire  _GEN_1322 = 4'h2 == enqIdx ? io_query_0_req_bits_datavalid : datavalid_2; // @[LoadQueueRAR.scala 110:{25,25} 66:26]
  wire  _GEN_1323 = 4'h3 == enqIdx ? io_query_0_req_bits_datavalid : datavalid_3; // @[LoadQueueRAR.scala 110:{25,25} 66:26]
  wire  _GEN_1324 = 4'h4 == enqIdx ? io_query_0_req_bits_datavalid : datavalid_4; // @[LoadQueueRAR.scala 110:{25,25} 66:26]
  wire  _GEN_1325 = 4'h5 == enqIdx ? io_query_0_req_bits_datavalid : datavalid_5; // @[LoadQueueRAR.scala 110:{25,25} 66:26]
  wire  _GEN_1326 = 4'h6 == enqIdx ? io_query_0_req_bits_datavalid : datavalid_6; // @[LoadQueueRAR.scala 110:{25,25} 66:26]
  wire  _GEN_1327 = 4'h7 == enqIdx ? io_query_0_req_bits_datavalid : datavalid_7; // @[LoadQueueRAR.scala 110:{25,25} 66:26]
  wire  _GEN_1328 = 4'h8 == enqIdx ? io_query_0_req_bits_datavalid : datavalid_8; // @[LoadQueueRAR.scala 110:{25,25} 66:26]
  wire  _GEN_1329 = 4'h9 == enqIdx ? io_query_0_req_bits_datavalid : datavalid_9; // @[LoadQueueRAR.scala 110:{25,25} 66:26]
  wire  _GEN_1330 = 4'ha == enqIdx ? io_query_0_req_bits_datavalid : datavalid_10; // @[LoadQueueRAR.scala 110:{25,25} 66:26]
  wire  _GEN_1331 = 4'hb == enqIdx ? io_query_0_req_bits_datavalid : datavalid_11; // @[LoadQueueRAR.scala 110:{25,25} 66:26]
  wire  _GEN_1332 = 4'h0 == enqIdx ? io_query_0_req_bits_miss : miss_0; // @[LoadQueueRAR.scala 111:{20,20} 67:21]
  wire  _GEN_1333 = 4'h1 == enqIdx ? io_query_0_req_bits_miss : miss_1; // @[LoadQueueRAR.scala 111:{20,20} 67:21]
  wire  _GEN_1334 = 4'h2 == enqIdx ? io_query_0_req_bits_miss : miss_2; // @[LoadQueueRAR.scala 111:{20,20} 67:21]
  wire  _GEN_1335 = 4'h3 == enqIdx ? io_query_0_req_bits_miss : miss_3; // @[LoadQueueRAR.scala 111:{20,20} 67:21]
  wire  _GEN_1336 = 4'h4 == enqIdx ? io_query_0_req_bits_miss : miss_4; // @[LoadQueueRAR.scala 111:{20,20} 67:21]
  wire  _GEN_1337 = 4'h5 == enqIdx ? io_query_0_req_bits_miss : miss_5; // @[LoadQueueRAR.scala 111:{20,20} 67:21]
  wire  _GEN_1338 = 4'h6 == enqIdx ? io_query_0_req_bits_miss : miss_6; // @[LoadQueueRAR.scala 111:{20,20} 67:21]
  wire  _GEN_1339 = 4'h7 == enqIdx ? io_query_0_req_bits_miss : miss_7; // @[LoadQueueRAR.scala 111:{20,20} 67:21]
  wire  _GEN_1340 = 4'h8 == enqIdx ? io_query_0_req_bits_miss : miss_8; // @[LoadQueueRAR.scala 111:{20,20} 67:21]
  wire  _GEN_1341 = 4'h9 == enqIdx ? io_query_0_req_bits_miss : miss_9; // @[LoadQueueRAR.scala 111:{20,20} 67:21]
  wire  _GEN_1342 = 4'ha == enqIdx ? io_query_0_req_bits_miss : miss_10; // @[LoadQueueRAR.scala 111:{20,20} 67:21]
  wire  _GEN_1343 = 4'hb == enqIdx ? io_query_0_req_bits_miss : miss_11; // @[LoadQueueRAR.scala 111:{20,20} 67:21]
  wire  _GEN_1345 = canEnqVec_0 ? _GEN_0 : allocated_0; // @[LoadQueueRAR.scala 54:26 91:46]
  wire  _GEN_1346 = canEnqVec_0 ? _GEN_1 : allocated_1; // @[LoadQueueRAR.scala 54:26 91:46]
  wire  _GEN_1347 = canEnqVec_0 ? _GEN_2 : allocated_2; // @[LoadQueueRAR.scala 54:26 91:46]
  wire  _GEN_1348 = canEnqVec_0 ? _GEN_3 : allocated_3; // @[LoadQueueRAR.scala 54:26 91:46]
  wire  _GEN_1349 = canEnqVec_0 ? _GEN_4 : allocated_4; // @[LoadQueueRAR.scala 54:26 91:46]
  wire  _GEN_1350 = canEnqVec_0 ? _GEN_5 : allocated_5; // @[LoadQueueRAR.scala 54:26 91:46]
  wire  _GEN_1351 = canEnqVec_0 ? _GEN_6 : allocated_6; // @[LoadQueueRAR.scala 54:26 91:46]
  wire  _GEN_1352 = canEnqVec_0 ? _GEN_7 : allocated_7; // @[LoadQueueRAR.scala 54:26 91:46]
  wire  _GEN_1353 = canEnqVec_0 ? _GEN_8 : allocated_8; // @[LoadQueueRAR.scala 54:26 91:46]
  wire  _GEN_1354 = canEnqVec_0 ? _GEN_9 : allocated_9; // @[LoadQueueRAR.scala 54:26 91:46]
  wire  _GEN_1355 = canEnqVec_0 ? _GEN_10 : allocated_10; // @[LoadQueueRAR.scala 54:26 91:46]
  wire  _GEN_1356 = canEnqVec_0 ? _GEN_11 : allocated_11; // @[LoadQueueRAR.scala 54:26 91:46]
  wire  _GEN_2451 = canEnqVec_0 ? _GEN_1104 : uop_0_robIdx_flag; // @[LoadQueueRAR.scala 55:16 91:46]
  wire  _GEN_2452 = canEnqVec_0 ? _GEN_1105 : uop_1_robIdx_flag; // @[LoadQueueRAR.scala 55:16 91:46]
  wire  _GEN_2453 = canEnqVec_0 ? _GEN_1106 : uop_2_robIdx_flag; // @[LoadQueueRAR.scala 55:16 91:46]
  wire  _GEN_2454 = canEnqVec_0 ? _GEN_1107 : uop_3_robIdx_flag; // @[LoadQueueRAR.scala 55:16 91:46]
  wire  _GEN_2455 = canEnqVec_0 ? _GEN_1108 : uop_4_robIdx_flag; // @[LoadQueueRAR.scala 55:16 91:46]
  wire  _GEN_2456 = canEnqVec_0 ? _GEN_1109 : uop_5_robIdx_flag; // @[LoadQueueRAR.scala 55:16 91:46]
  wire  _GEN_2457 = canEnqVec_0 ? _GEN_1110 : uop_6_robIdx_flag; // @[LoadQueueRAR.scala 55:16 91:46]
  wire  _GEN_2458 = canEnqVec_0 ? _GEN_1111 : uop_7_robIdx_flag; // @[LoadQueueRAR.scala 55:16 91:46]
  wire  _GEN_2459 = canEnqVec_0 ? _GEN_1112 : uop_8_robIdx_flag; // @[LoadQueueRAR.scala 55:16 91:46]
  wire  _GEN_2460 = canEnqVec_0 ? _GEN_1113 : uop_9_robIdx_flag; // @[LoadQueueRAR.scala 55:16 91:46]
  wire  _GEN_2461 = canEnqVec_0 ? _GEN_1114 : uop_10_robIdx_flag; // @[LoadQueueRAR.scala 55:16 91:46]
  wire  _GEN_2462 = canEnqVec_0 ? _GEN_1115 : uop_11_robIdx_flag; // @[LoadQueueRAR.scala 55:16 91:46]
  wire [4:0] _GEN_2463 = canEnqVec_0 ? _GEN_1116 : uop_0_robIdx_value; // @[LoadQueueRAR.scala 55:16 91:46]
  wire [4:0] _GEN_2464 = canEnqVec_0 ? _GEN_1117 : uop_1_robIdx_value; // @[LoadQueueRAR.scala 55:16 91:46]
  wire [4:0] _GEN_2465 = canEnqVec_0 ? _GEN_1118 : uop_2_robIdx_value; // @[LoadQueueRAR.scala 55:16 91:46]
  wire [4:0] _GEN_2466 = canEnqVec_0 ? _GEN_1119 : uop_3_robIdx_value; // @[LoadQueueRAR.scala 55:16 91:46]
  wire [4:0] _GEN_2467 = canEnqVec_0 ? _GEN_1120 : uop_4_robIdx_value; // @[LoadQueueRAR.scala 55:16 91:46]
  wire [4:0] _GEN_2468 = canEnqVec_0 ? _GEN_1121 : uop_5_robIdx_value; // @[LoadQueueRAR.scala 55:16 91:46]
  wire [4:0] _GEN_2469 = canEnqVec_0 ? _GEN_1122 : uop_6_robIdx_value; // @[LoadQueueRAR.scala 55:16 91:46]
  wire [4:0] _GEN_2470 = canEnqVec_0 ? _GEN_1123 : uop_7_robIdx_value; // @[LoadQueueRAR.scala 55:16 91:46]
  wire [4:0] _GEN_2471 = canEnqVec_0 ? _GEN_1124 : uop_8_robIdx_value; // @[LoadQueueRAR.scala 55:16 91:46]
  wire [4:0] _GEN_2472 = canEnqVec_0 ? _GEN_1125 : uop_9_robIdx_value; // @[LoadQueueRAR.scala 55:16 91:46]
  wire [4:0] _GEN_2473 = canEnqVec_0 ? _GEN_1126 : uop_10_robIdx_value; // @[LoadQueueRAR.scala 55:16 91:46]
  wire [4:0] _GEN_2474 = canEnqVec_0 ? _GEN_1127 : uop_11_robIdx_value; // @[LoadQueueRAR.scala 55:16 91:46]
  wire  _GEN_2475 = canEnqVec_0 ? _GEN_1128 : uop_0_lqIdx_flag; // @[LoadQueueRAR.scala 55:16 91:46]
  wire  _GEN_2476 = canEnqVec_0 ? _GEN_1129 : uop_1_lqIdx_flag; // @[LoadQueueRAR.scala 55:16 91:46]
  wire  _GEN_2477 = canEnqVec_0 ? _GEN_1130 : uop_2_lqIdx_flag; // @[LoadQueueRAR.scala 55:16 91:46]
  wire  _GEN_2478 = canEnqVec_0 ? _GEN_1131 : uop_3_lqIdx_flag; // @[LoadQueueRAR.scala 55:16 91:46]
  wire  _GEN_2479 = canEnqVec_0 ? _GEN_1132 : uop_4_lqIdx_flag; // @[LoadQueueRAR.scala 55:16 91:46]
  wire  _GEN_2480 = canEnqVec_0 ? _GEN_1133 : uop_5_lqIdx_flag; // @[LoadQueueRAR.scala 55:16 91:46]
  wire  _GEN_2481 = canEnqVec_0 ? _GEN_1134 : uop_6_lqIdx_flag; // @[LoadQueueRAR.scala 55:16 91:46]
  wire  _GEN_2482 = canEnqVec_0 ? _GEN_1135 : uop_7_lqIdx_flag; // @[LoadQueueRAR.scala 55:16 91:46]
  wire  _GEN_2483 = canEnqVec_0 ? _GEN_1136 : uop_8_lqIdx_flag; // @[LoadQueueRAR.scala 55:16 91:46]
  wire  _GEN_2484 = canEnqVec_0 ? _GEN_1137 : uop_9_lqIdx_flag; // @[LoadQueueRAR.scala 55:16 91:46]
  wire  _GEN_2485 = canEnqVec_0 ? _GEN_1138 : uop_10_lqIdx_flag; // @[LoadQueueRAR.scala 55:16 91:46]
  wire  _GEN_2486 = canEnqVec_0 ? _GEN_1139 : uop_11_lqIdx_flag; // @[LoadQueueRAR.scala 55:16 91:46]
  wire [3:0] _GEN_2487 = canEnqVec_0 ? _GEN_1140 : uop_0_lqIdx_value; // @[LoadQueueRAR.scala 55:16 91:46]
  wire [3:0] _GEN_2488 = canEnqVec_0 ? _GEN_1141 : uop_1_lqIdx_value; // @[LoadQueueRAR.scala 55:16 91:46]
  wire [3:0] _GEN_2489 = canEnqVec_0 ? _GEN_1142 : uop_2_lqIdx_value; // @[LoadQueueRAR.scala 55:16 91:46]
  wire [3:0] _GEN_2490 = canEnqVec_0 ? _GEN_1143 : uop_3_lqIdx_value; // @[LoadQueueRAR.scala 55:16 91:46]
  wire [3:0] _GEN_2491 = canEnqVec_0 ? _GEN_1144 : uop_4_lqIdx_value; // @[LoadQueueRAR.scala 55:16 91:46]
  wire [3:0] _GEN_2492 = canEnqVec_0 ? _GEN_1145 : uop_5_lqIdx_value; // @[LoadQueueRAR.scala 55:16 91:46]
  wire [3:0] _GEN_2493 = canEnqVec_0 ? _GEN_1146 : uop_6_lqIdx_value; // @[LoadQueueRAR.scala 55:16 91:46]
  wire [3:0] _GEN_2494 = canEnqVec_0 ? _GEN_1147 : uop_7_lqIdx_value; // @[LoadQueueRAR.scala 55:16 91:46]
  wire [3:0] _GEN_2495 = canEnqVec_0 ? _GEN_1148 : uop_8_lqIdx_value; // @[LoadQueueRAR.scala 55:16 91:46]
  wire [3:0] _GEN_2496 = canEnqVec_0 ? _GEN_1149 : uop_9_lqIdx_value; // @[LoadQueueRAR.scala 55:16 91:46]
  wire [3:0] _GEN_2497 = canEnqVec_0 ? _GEN_1150 : uop_10_lqIdx_value; // @[LoadQueueRAR.scala 55:16 91:46]
  wire [3:0] _GEN_2498 = canEnqVec_0 ? _GEN_1151 : uop_11_lqIdx_value; // @[LoadQueueRAR.scala 55:16 91:46]
  wire  _GEN_2655 = canEnqVec_0 ? _GEN_1308 : released_0; // @[LoadQueueRAR.scala 65:25 91:46]
  wire  _GEN_2656 = canEnqVec_0 ? _GEN_1309 : released_1; // @[LoadQueueRAR.scala 65:25 91:46]
  wire  _GEN_2657 = canEnqVec_0 ? _GEN_1310 : released_2; // @[LoadQueueRAR.scala 65:25 91:46]
  wire  _GEN_2658 = canEnqVec_0 ? _GEN_1311 : released_3; // @[LoadQueueRAR.scala 65:25 91:46]
  wire  _GEN_2659 = canEnqVec_0 ? _GEN_1312 : released_4; // @[LoadQueueRAR.scala 65:25 91:46]
  wire  _GEN_2660 = canEnqVec_0 ? _GEN_1313 : released_5; // @[LoadQueueRAR.scala 65:25 91:46]
  wire  _GEN_2661 = canEnqVec_0 ? _GEN_1314 : released_6; // @[LoadQueueRAR.scala 65:25 91:46]
  wire  _GEN_2662 = canEnqVec_0 ? _GEN_1315 : released_7; // @[LoadQueueRAR.scala 65:25 91:46]
  wire  _GEN_2663 = canEnqVec_0 ? _GEN_1316 : released_8; // @[LoadQueueRAR.scala 65:25 91:46]
  wire  _GEN_2664 = canEnqVec_0 ? _GEN_1317 : released_9; // @[LoadQueueRAR.scala 65:25 91:46]
  wire  _GEN_2665 = canEnqVec_0 ? _GEN_1318 : released_10; // @[LoadQueueRAR.scala 65:25 91:46]
  wire  _GEN_2666 = canEnqVec_0 ? _GEN_1319 : released_11; // @[LoadQueueRAR.scala 65:25 91:46]
  wire  _GEN_2667 = canEnqVec_0 ? _GEN_1320 : datavalid_0; // @[LoadQueueRAR.scala 66:26 91:46]
  wire  _GEN_2668 = canEnqVec_0 ? _GEN_1321 : datavalid_1; // @[LoadQueueRAR.scala 66:26 91:46]
  wire  _GEN_2669 = canEnqVec_0 ? _GEN_1322 : datavalid_2; // @[LoadQueueRAR.scala 66:26 91:46]
  wire  _GEN_2670 = canEnqVec_0 ? _GEN_1323 : datavalid_3; // @[LoadQueueRAR.scala 66:26 91:46]
  wire  _GEN_2671 = canEnqVec_0 ? _GEN_1324 : datavalid_4; // @[LoadQueueRAR.scala 66:26 91:46]
  wire  _GEN_2672 = canEnqVec_0 ? _GEN_1325 : datavalid_5; // @[LoadQueueRAR.scala 66:26 91:46]
  wire  _GEN_2673 = canEnqVec_0 ? _GEN_1326 : datavalid_6; // @[LoadQueueRAR.scala 66:26 91:46]
  wire  _GEN_2674 = canEnqVec_0 ? _GEN_1327 : datavalid_7; // @[LoadQueueRAR.scala 66:26 91:46]
  wire  _GEN_2675 = canEnqVec_0 ? _GEN_1328 : datavalid_8; // @[LoadQueueRAR.scala 66:26 91:46]
  wire  _GEN_2676 = canEnqVec_0 ? _GEN_1329 : datavalid_9; // @[LoadQueueRAR.scala 66:26 91:46]
  wire  _GEN_2677 = canEnqVec_0 ? _GEN_1330 : datavalid_10; // @[LoadQueueRAR.scala 66:26 91:46]
  wire  _GEN_2678 = canEnqVec_0 ? _GEN_1331 : datavalid_11; // @[LoadQueueRAR.scala 66:26 91:46]
  wire  _GEN_2679 = canEnqVec_0 ? _GEN_1332 : miss_0; // @[LoadQueueRAR.scala 67:21 91:46]
  wire  _GEN_2680 = canEnqVec_0 ? _GEN_1333 : miss_1; // @[LoadQueueRAR.scala 67:21 91:46]
  wire  _GEN_2681 = canEnqVec_0 ? _GEN_1334 : miss_2; // @[LoadQueueRAR.scala 67:21 91:46]
  wire  _GEN_2682 = canEnqVec_0 ? _GEN_1335 : miss_3; // @[LoadQueueRAR.scala 67:21 91:46]
  wire  _GEN_2683 = canEnqVec_0 ? _GEN_1336 : miss_4; // @[LoadQueueRAR.scala 67:21 91:46]
  wire  _GEN_2684 = canEnqVec_0 ? _GEN_1337 : miss_5; // @[LoadQueueRAR.scala 67:21 91:46]
  wire  _GEN_2685 = canEnqVec_0 ? _GEN_1338 : miss_6; // @[LoadQueueRAR.scala 67:21 91:46]
  wire  _GEN_2686 = canEnqVec_0 ? _GEN_1339 : miss_7; // @[LoadQueueRAR.scala 67:21 91:46]
  wire  _GEN_2687 = canEnqVec_0 ? _GEN_1340 : miss_8; // @[LoadQueueRAR.scala 67:21 91:46]
  wire  _GEN_2688 = canEnqVec_0 ? _GEN_1341 : miss_9; // @[LoadQueueRAR.scala 67:21 91:46]
  wire  _GEN_2689 = canEnqVec_0 ? _GEN_1342 : miss_10; // @[LoadQueueRAR.scala 67:21 91:46]
  wire  _GEN_2690 = canEnqVec_0 ? _GEN_1343 : miss_11; // @[LoadQueueRAR.scala 67:21 91:46]
  wire  _GEN_2692 = 4'h1 == io_query_0_req_bits_index ? uop_1_robIdx_flag : uop_0_robIdx_flag; // @[CircularQueuePtr.scala 61:{70,70}]
  wire  _GEN_2693 = 4'h2 == io_query_0_req_bits_index ? uop_2_robIdx_flag : _GEN_2692; // @[CircularQueuePtr.scala 61:{70,70}]
  wire  _GEN_2694 = 4'h3 == io_query_0_req_bits_index ? uop_3_robIdx_flag : _GEN_2693; // @[CircularQueuePtr.scala 61:{70,70}]
  wire  _GEN_2695 = 4'h4 == io_query_0_req_bits_index ? uop_4_robIdx_flag : _GEN_2694; // @[CircularQueuePtr.scala 61:{70,70}]
  wire  _GEN_2696 = 4'h5 == io_query_0_req_bits_index ? uop_5_robIdx_flag : _GEN_2695; // @[CircularQueuePtr.scala 61:{70,70}]
  wire  _GEN_2697 = 4'h6 == io_query_0_req_bits_index ? uop_6_robIdx_flag : _GEN_2696; // @[CircularQueuePtr.scala 61:{70,70}]
  wire  _GEN_2698 = 4'h7 == io_query_0_req_bits_index ? uop_7_robIdx_flag : _GEN_2697; // @[CircularQueuePtr.scala 61:{70,70}]
  wire  _GEN_2699 = 4'h8 == io_query_0_req_bits_index ? uop_8_robIdx_flag : _GEN_2698; // @[CircularQueuePtr.scala 61:{70,70}]
  wire  _GEN_2700 = 4'h9 == io_query_0_req_bits_index ? uop_9_robIdx_flag : _GEN_2699; // @[CircularQueuePtr.scala 61:{70,70}]
  wire  _GEN_2701 = 4'ha == io_query_0_req_bits_index ? uop_10_robIdx_flag : _GEN_2700; // @[CircularQueuePtr.scala 61:{70,70}]
  wire  _GEN_2702 = 4'hb == io_query_0_req_bits_index ? uop_11_robIdx_flag : _GEN_2701; // @[CircularQueuePtr.scala 61:{70,70}]
  wire [4:0] _GEN_2704 = 4'h1 == io_query_0_req_bits_index ? uop_1_robIdx_value : uop_0_robIdx_value; // @[CircularQueuePtr.scala 61:{70,70}]
  wire [4:0] _GEN_2705 = 4'h2 == io_query_0_req_bits_index ? uop_2_robIdx_value : _GEN_2704; // @[CircularQueuePtr.scala 61:{70,70}]
  wire [4:0] _GEN_2706 = 4'h3 == io_query_0_req_bits_index ? uop_3_robIdx_value : _GEN_2705; // @[CircularQueuePtr.scala 61:{70,70}]
  wire [4:0] _GEN_2707 = 4'h4 == io_query_0_req_bits_index ? uop_4_robIdx_value : _GEN_2706; // @[CircularQueuePtr.scala 61:{70,70}]
  wire [4:0] _GEN_2708 = 4'h5 == io_query_0_req_bits_index ? uop_5_robIdx_value : _GEN_2707; // @[CircularQueuePtr.scala 61:{70,70}]
  wire [4:0] _GEN_2709 = 4'h6 == io_query_0_req_bits_index ? uop_6_robIdx_value : _GEN_2708; // @[CircularQueuePtr.scala 61:{70,70}]
  wire [4:0] _GEN_2710 = 4'h7 == io_query_0_req_bits_index ? uop_7_robIdx_value : _GEN_2709; // @[CircularQueuePtr.scala 61:{70,70}]
  wire [4:0] _GEN_2711 = 4'h8 == io_query_0_req_bits_index ? uop_8_robIdx_value : _GEN_2710; // @[CircularQueuePtr.scala 61:{70,70}]
  wire [4:0] _GEN_2712 = 4'h9 == io_query_0_req_bits_index ? uop_9_robIdx_value : _GEN_2711; // @[CircularQueuePtr.scala 61:{70,70}]
  wire [4:0] _GEN_2713 = 4'ha == io_query_0_req_bits_index ? uop_10_robIdx_value : _GEN_2712; // @[CircularQueuePtr.scala 61:{70,70}]
  wire [4:0] _GEN_2714 = 4'hb == io_query_0_req_bits_index ? uop_11_robIdx_value : _GEN_2713; // @[CircularQueuePtr.scala 61:{70,70}]
  wire [5:0] _T_5 = {_GEN_2702,_GEN_2714}; // @[CircularQueuePtr.scala 61:70]
  wire  _T_6 = _cancelEnqueue_flushItself_T_1 == _T_5; // @[CircularQueuePtr.scala 61:52]
  wire  _GEN_2715 = 4'h0 == io_query_0_req_bits_index ? io_query_0_req_bits_datavalid : _GEN_2667; // @[LoadQueueRAR.scala 115:{33,33}]
  wire  _GEN_2716 = 4'h1 == io_query_0_req_bits_index ? io_query_0_req_bits_datavalid : _GEN_2668; // @[LoadQueueRAR.scala 115:{33,33}]
  wire  _GEN_2717 = 4'h2 == io_query_0_req_bits_index ? io_query_0_req_bits_datavalid : _GEN_2669; // @[LoadQueueRAR.scala 115:{33,33}]
  wire  _GEN_2718 = 4'h3 == io_query_0_req_bits_index ? io_query_0_req_bits_datavalid : _GEN_2670; // @[LoadQueueRAR.scala 115:{33,33}]
  wire  _GEN_2719 = 4'h4 == io_query_0_req_bits_index ? io_query_0_req_bits_datavalid : _GEN_2671; // @[LoadQueueRAR.scala 115:{33,33}]
  wire  _GEN_2720 = 4'h5 == io_query_0_req_bits_index ? io_query_0_req_bits_datavalid : _GEN_2672; // @[LoadQueueRAR.scala 115:{33,33}]
  wire  _GEN_2721 = 4'h6 == io_query_0_req_bits_index ? io_query_0_req_bits_datavalid : _GEN_2673; // @[LoadQueueRAR.scala 115:{33,33}]
  wire  _GEN_2722 = 4'h7 == io_query_0_req_bits_index ? io_query_0_req_bits_datavalid : _GEN_2674; // @[LoadQueueRAR.scala 115:{33,33}]
  wire  _GEN_2723 = 4'h8 == io_query_0_req_bits_index ? io_query_0_req_bits_datavalid : _GEN_2675; // @[LoadQueueRAR.scala 115:{33,33}]
  wire  _GEN_2724 = 4'h9 == io_query_0_req_bits_index ? io_query_0_req_bits_datavalid : _GEN_2676; // @[LoadQueueRAR.scala 115:{33,33}]
  wire  _GEN_2725 = 4'ha == io_query_0_req_bits_index ? io_query_0_req_bits_datavalid : _GEN_2677; // @[LoadQueueRAR.scala 115:{33,33}]
  wire  _GEN_2726 = 4'hb == io_query_0_req_bits_index ? io_query_0_req_bits_datavalid : _GEN_2678; // @[LoadQueueRAR.scala 115:{33,33}]
  wire  _GEN_2727 = 4'h0 == io_query_0_req_bits_index ? io_query_0_req_bits_miss : _GEN_2679; // @[LoadQueueRAR.scala 116:{28,28}]
  wire  _GEN_2728 = 4'h1 == io_query_0_req_bits_index ? io_query_0_req_bits_miss : _GEN_2680; // @[LoadQueueRAR.scala 116:{28,28}]
  wire  _GEN_2729 = 4'h2 == io_query_0_req_bits_index ? io_query_0_req_bits_miss : _GEN_2681; // @[LoadQueueRAR.scala 116:{28,28}]
  wire  _GEN_2730 = 4'h3 == io_query_0_req_bits_index ? io_query_0_req_bits_miss : _GEN_2682; // @[LoadQueueRAR.scala 116:{28,28}]
  wire  _GEN_2731 = 4'h4 == io_query_0_req_bits_index ? io_query_0_req_bits_miss : _GEN_2683; // @[LoadQueueRAR.scala 116:{28,28}]
  wire  _GEN_2732 = 4'h5 == io_query_0_req_bits_index ? io_query_0_req_bits_miss : _GEN_2684; // @[LoadQueueRAR.scala 116:{28,28}]
  wire  _GEN_2733 = 4'h6 == io_query_0_req_bits_index ? io_query_0_req_bits_miss : _GEN_2685; // @[LoadQueueRAR.scala 116:{28,28}]
  wire  _GEN_2734 = 4'h7 == io_query_0_req_bits_index ? io_query_0_req_bits_miss : _GEN_2686; // @[LoadQueueRAR.scala 116:{28,28}]
  wire  _GEN_2735 = 4'h8 == io_query_0_req_bits_index ? io_query_0_req_bits_miss : _GEN_2687; // @[LoadQueueRAR.scala 116:{28,28}]
  wire  _GEN_2736 = 4'h9 == io_query_0_req_bits_index ? io_query_0_req_bits_miss : _GEN_2688; // @[LoadQueueRAR.scala 116:{28,28}]
  wire  _GEN_2737 = 4'ha == io_query_0_req_bits_index ? io_query_0_req_bits_miss : _GEN_2689; // @[LoadQueueRAR.scala 116:{28,28}]
  wire  _GEN_2738 = 4'hb == io_query_0_req_bits_index ? io_query_0_req_bits_miss : _GEN_2690; // @[LoadQueueRAR.scala 116:{28,28}]
  wire  _GEN_2739 = io_query_0_req_valid & io_query_0_req_bits_allocated & _T_6 ? _GEN_2715 : _GEN_2667; // @[LoadQueueRAR.scala 114:98]
  wire  _GEN_2740 = io_query_0_req_valid & io_query_0_req_bits_allocated & _T_6 ? _GEN_2716 : _GEN_2668; // @[LoadQueueRAR.scala 114:98]
  wire  _GEN_2741 = io_query_0_req_valid & io_query_0_req_bits_allocated & _T_6 ? _GEN_2717 : _GEN_2669; // @[LoadQueueRAR.scala 114:98]
  wire  _GEN_2742 = io_query_0_req_valid & io_query_0_req_bits_allocated & _T_6 ? _GEN_2718 : _GEN_2670; // @[LoadQueueRAR.scala 114:98]
  wire  _GEN_2743 = io_query_0_req_valid & io_query_0_req_bits_allocated & _T_6 ? _GEN_2719 : _GEN_2671; // @[LoadQueueRAR.scala 114:98]
  wire  _GEN_2744 = io_query_0_req_valid & io_query_0_req_bits_allocated & _T_6 ? _GEN_2720 : _GEN_2672; // @[LoadQueueRAR.scala 114:98]
  wire  _GEN_2745 = io_query_0_req_valid & io_query_0_req_bits_allocated & _T_6 ? _GEN_2721 : _GEN_2673; // @[LoadQueueRAR.scala 114:98]
  wire  _GEN_2746 = io_query_0_req_valid & io_query_0_req_bits_allocated & _T_6 ? _GEN_2722 : _GEN_2674; // @[LoadQueueRAR.scala 114:98]
  wire  _GEN_2747 = io_query_0_req_valid & io_query_0_req_bits_allocated & _T_6 ? _GEN_2723 : _GEN_2675; // @[LoadQueueRAR.scala 114:98]
  wire  _GEN_2748 = io_query_0_req_valid & io_query_0_req_bits_allocated & _T_6 ? _GEN_2724 : _GEN_2676; // @[LoadQueueRAR.scala 114:98]
  wire  _GEN_2749 = io_query_0_req_valid & io_query_0_req_bits_allocated & _T_6 ? _GEN_2725 : _GEN_2677; // @[LoadQueueRAR.scala 114:98]
  wire  _GEN_2750 = io_query_0_req_valid & io_query_0_req_bits_allocated & _T_6 ? _GEN_2726 : _GEN_2678; // @[LoadQueueRAR.scala 114:98]
  wire  _GEN_2751 = io_query_0_req_valid & io_query_0_req_bits_allocated & _T_6 ? _GEN_2727 : _GEN_2679; // @[LoadQueueRAR.scala 114:98]
  wire  _GEN_2752 = io_query_0_req_valid & io_query_0_req_bits_allocated & _T_6 ? _GEN_2728 : _GEN_2680; // @[LoadQueueRAR.scala 114:98]
  wire  _GEN_2753 = io_query_0_req_valid & io_query_0_req_bits_allocated & _T_6 ? _GEN_2729 : _GEN_2681; // @[LoadQueueRAR.scala 114:98]
  wire  _GEN_2754 = io_query_0_req_valid & io_query_0_req_bits_allocated & _T_6 ? _GEN_2730 : _GEN_2682; // @[LoadQueueRAR.scala 114:98]
  wire  _GEN_2755 = io_query_0_req_valid & io_query_0_req_bits_allocated & _T_6 ? _GEN_2731 : _GEN_2683; // @[LoadQueueRAR.scala 114:98]
  wire  _GEN_2756 = io_query_0_req_valid & io_query_0_req_bits_allocated & _T_6 ? _GEN_2732 : _GEN_2684; // @[LoadQueueRAR.scala 114:98]
  wire  _GEN_2757 = io_query_0_req_valid & io_query_0_req_bits_allocated & _T_6 ? _GEN_2733 : _GEN_2685; // @[LoadQueueRAR.scala 114:98]
  wire  _GEN_2758 = io_query_0_req_valid & io_query_0_req_bits_allocated & _T_6 ? _GEN_2734 : _GEN_2686; // @[LoadQueueRAR.scala 114:98]
  wire  _GEN_2759 = io_query_0_req_valid & io_query_0_req_bits_allocated & _T_6 ? _GEN_2735 : _GEN_2687; // @[LoadQueueRAR.scala 114:98]
  wire  _GEN_2760 = io_query_0_req_valid & io_query_0_req_bits_allocated & _T_6 ? _GEN_2736 : _GEN_2688; // @[LoadQueueRAR.scala 114:98]
  wire  _GEN_2761 = io_query_0_req_valid & io_query_0_req_bits_allocated & _T_6 ? _GEN_2737 : _GEN_2689; // @[LoadQueueRAR.scala 114:98]
  wire  _GEN_2762 = io_query_0_req_valid & io_query_0_req_bits_allocated & _T_6 ? _GEN_2738 : _GEN_2690; // @[LoadQueueRAR.scala 114:98]
  wire [3:0] enqIdx_hi_3 = enqIdxOH_1[11:8]; // @[OneHot.scala 30:18]
  wire [7:0] enqIdx_lo_3 = enqIdxOH_1[7:0]; // @[OneHot.scala 31:18]
  wire  _enqIdx_T_9 = |enqIdx_hi_3; // @[OneHot.scala 32:14]
  wire [7:0] _GEN_5569 = {{4'd0}, enqIdx_hi_3}; // @[OneHot.scala 32:28]
  wire [7:0] _enqIdx_T_10 = _GEN_5569 | enqIdx_lo_3; // @[OneHot.scala 32:28]
  wire [3:0] enqIdx_hi_4 = _enqIdx_T_10[7:4]; // @[OneHot.scala 30:18]
  wire [3:0] enqIdx_lo_4 = _enqIdx_T_10[3:0]; // @[OneHot.scala 31:18]
  wire  _enqIdx_T_11 = |enqIdx_hi_4; // @[OneHot.scala 32:14]
  wire [3:0] _enqIdx_T_12 = enqIdx_hi_4 | enqIdx_lo_4; // @[OneHot.scala 32:28]
  wire [1:0] enqIdx_hi_5 = _enqIdx_T_12[3:2]; // @[OneHot.scala 30:18]
  wire [1:0] enqIdx_lo_5 = _enqIdx_T_12[1:0]; // @[OneHot.scala 31:18]
  wire  _enqIdx_T_13 = |enqIdx_hi_5; // @[OneHot.scala 32:14]
  wire [1:0] _enqIdx_T_14 = enqIdx_hi_5 | enqIdx_lo_5; // @[OneHot.scala 32:28]
  wire [2:0] _enqIdx_T_17 = {_enqIdx_T_11,_enqIdx_T_13,_enqIdx_T_14[1]}; // @[Cat.scala 31:58]
  wire [3:0] enqIdx_1 = {_enqIdx_T_9,_enqIdx_T_11,_enqIdx_T_13,_enqIdx_T_14[1]}; // @[Cat.scala 31:58]
  wire  _GEN_2763 = 4'h0 == enqIdx_1 | _GEN_1345; // @[LoadQueueRAR.scala 96:{25,25}]
  wire  _GEN_2764 = 4'h1 == enqIdx_1 | _GEN_1346; // @[LoadQueueRAR.scala 96:{25,25}]
  wire  _GEN_2765 = 4'h2 == enqIdx_1 | _GEN_1347; // @[LoadQueueRAR.scala 96:{25,25}]
  wire  _GEN_2766 = 4'h3 == enqIdx_1 | _GEN_1348; // @[LoadQueueRAR.scala 96:{25,25}]
  wire  _GEN_2767 = 4'h4 == enqIdx_1 | _GEN_1349; // @[LoadQueueRAR.scala 96:{25,25}]
  wire  _GEN_2768 = 4'h5 == enqIdx_1 | _GEN_1350; // @[LoadQueueRAR.scala 96:{25,25}]
  wire  _GEN_2769 = 4'h6 == enqIdx_1 | _GEN_1351; // @[LoadQueueRAR.scala 96:{25,25}]
  wire  _GEN_2770 = 4'h7 == enqIdx_1 | _GEN_1352; // @[LoadQueueRAR.scala 96:{25,25}]
  wire  _GEN_2771 = 4'h8 == enqIdx_1 | _GEN_1353; // @[LoadQueueRAR.scala 96:{25,25}]
  wire  _GEN_2772 = 4'h9 == enqIdx_1 | _GEN_1354; // @[LoadQueueRAR.scala 96:{25,25}]
  wire  _GEN_2773 = 4'ha == enqIdx_1 | _GEN_1355; // @[LoadQueueRAR.scala 96:{25,25}]
  wire  _GEN_2774 = 4'hb == enqIdx_1 | _GEN_1356; // @[LoadQueueRAR.scala 96:{25,25}]
  wire  _released_T_11 = io_query_1_req_bits_paddr[35:6] == release2Cycle_bits_paddr[35:6]; // @[LoadQueueRAR.scala 107:55]
  wire  _released_T_12 = release2Cycle_valid & _released_T_11; // @[LoadQueueRAR.scala 106:29]
  wire  _released_T_15 = io_query_1_req_bits_paddr[35:6] == io_release_bits_paddr[35:6]; // @[LoadQueueRAR.scala 109:55]
  wire  _released_T_16 = io_release_valid & _released_T_15; // @[LoadQueueRAR.scala 108:29]
  wire  _released_T_17 = _released_T_12 | _released_T_16; // @[LoadQueueRAR.scala 107:115]
  wire  _GEN_4071 = 4'h0 == enqIdx_1 ? _released_T_17 : _GEN_2655; // @[LoadQueueRAR.scala 105:{24,24}]
  wire  _GEN_4072 = 4'h1 == enqIdx_1 ? _released_T_17 : _GEN_2656; // @[LoadQueueRAR.scala 105:{24,24}]
  wire  _GEN_4073 = 4'h2 == enqIdx_1 ? _released_T_17 : _GEN_2657; // @[LoadQueueRAR.scala 105:{24,24}]
  wire  _GEN_4074 = 4'h3 == enqIdx_1 ? _released_T_17 : _GEN_2658; // @[LoadQueueRAR.scala 105:{24,24}]
  wire  _GEN_4075 = 4'h4 == enqIdx_1 ? _released_T_17 : _GEN_2659; // @[LoadQueueRAR.scala 105:{24,24}]
  wire  _GEN_4076 = 4'h5 == enqIdx_1 ? _released_T_17 : _GEN_2660; // @[LoadQueueRAR.scala 105:{24,24}]
  wire  _GEN_4077 = 4'h6 == enqIdx_1 ? _released_T_17 : _GEN_2661; // @[LoadQueueRAR.scala 105:{24,24}]
  wire  _GEN_4078 = 4'h7 == enqIdx_1 ? _released_T_17 : _GEN_2662; // @[LoadQueueRAR.scala 105:{24,24}]
  wire  _GEN_4079 = 4'h8 == enqIdx_1 ? _released_T_17 : _GEN_2663; // @[LoadQueueRAR.scala 105:{24,24}]
  wire  _GEN_4080 = 4'h9 == enqIdx_1 ? _released_T_17 : _GEN_2664; // @[LoadQueueRAR.scala 105:{24,24}]
  wire  _GEN_4081 = 4'ha == enqIdx_1 ? _released_T_17 : _GEN_2665; // @[LoadQueueRAR.scala 105:{24,24}]
  wire  _GEN_4082 = 4'hb == enqIdx_1 ? _released_T_17 : _GEN_2666; // @[LoadQueueRAR.scala 105:{24,24}]
  wire  _GEN_4083 = 4'h0 == enqIdx_1 ? io_query_1_req_bits_datavalid : _GEN_2739; // @[LoadQueueRAR.scala 110:{25,25}]
  wire  _GEN_4084 = 4'h1 == enqIdx_1 ? io_query_1_req_bits_datavalid : _GEN_2740; // @[LoadQueueRAR.scala 110:{25,25}]
  wire  _GEN_4085 = 4'h2 == enqIdx_1 ? io_query_1_req_bits_datavalid : _GEN_2741; // @[LoadQueueRAR.scala 110:{25,25}]
  wire  _GEN_4086 = 4'h3 == enqIdx_1 ? io_query_1_req_bits_datavalid : _GEN_2742; // @[LoadQueueRAR.scala 110:{25,25}]
  wire  _GEN_4087 = 4'h4 == enqIdx_1 ? io_query_1_req_bits_datavalid : _GEN_2743; // @[LoadQueueRAR.scala 110:{25,25}]
  wire  _GEN_4088 = 4'h5 == enqIdx_1 ? io_query_1_req_bits_datavalid : _GEN_2744; // @[LoadQueueRAR.scala 110:{25,25}]
  wire  _GEN_4089 = 4'h6 == enqIdx_1 ? io_query_1_req_bits_datavalid : _GEN_2745; // @[LoadQueueRAR.scala 110:{25,25}]
  wire  _GEN_4090 = 4'h7 == enqIdx_1 ? io_query_1_req_bits_datavalid : _GEN_2746; // @[LoadQueueRAR.scala 110:{25,25}]
  wire  _GEN_4091 = 4'h8 == enqIdx_1 ? io_query_1_req_bits_datavalid : _GEN_2747; // @[LoadQueueRAR.scala 110:{25,25}]
  wire  _GEN_4092 = 4'h9 == enqIdx_1 ? io_query_1_req_bits_datavalid : _GEN_2748; // @[LoadQueueRAR.scala 110:{25,25}]
  wire  _GEN_4093 = 4'ha == enqIdx_1 ? io_query_1_req_bits_datavalid : _GEN_2749; // @[LoadQueueRAR.scala 110:{25,25}]
  wire  _GEN_4094 = 4'hb == enqIdx_1 ? io_query_1_req_bits_datavalid : _GEN_2750; // @[LoadQueueRAR.scala 110:{25,25}]
  wire  _GEN_4095 = 4'h0 == enqIdx_1 ? io_query_1_req_bits_miss : _GEN_2751; // @[LoadQueueRAR.scala 111:{20,20}]
  wire  _GEN_4096 = 4'h1 == enqIdx_1 ? io_query_1_req_bits_miss : _GEN_2752; // @[LoadQueueRAR.scala 111:{20,20}]
  wire  _GEN_4097 = 4'h2 == enqIdx_1 ? io_query_1_req_bits_miss : _GEN_2753; // @[LoadQueueRAR.scala 111:{20,20}]
  wire  _GEN_4098 = 4'h3 == enqIdx_1 ? io_query_1_req_bits_miss : _GEN_2754; // @[LoadQueueRAR.scala 111:{20,20}]
  wire  _GEN_4099 = 4'h4 == enqIdx_1 ? io_query_1_req_bits_miss : _GEN_2755; // @[LoadQueueRAR.scala 111:{20,20}]
  wire  _GEN_4100 = 4'h5 == enqIdx_1 ? io_query_1_req_bits_miss : _GEN_2756; // @[LoadQueueRAR.scala 111:{20,20}]
  wire  _GEN_4101 = 4'h6 == enqIdx_1 ? io_query_1_req_bits_miss : _GEN_2757; // @[LoadQueueRAR.scala 111:{20,20}]
  wire  _GEN_4102 = 4'h7 == enqIdx_1 ? io_query_1_req_bits_miss : _GEN_2758; // @[LoadQueueRAR.scala 111:{20,20}]
  wire  _GEN_4103 = 4'h8 == enqIdx_1 ? io_query_1_req_bits_miss : _GEN_2759; // @[LoadQueueRAR.scala 111:{20,20}]
  wire  _GEN_4104 = 4'h9 == enqIdx_1 ? io_query_1_req_bits_miss : _GEN_2760; // @[LoadQueueRAR.scala 111:{20,20}]
  wire  _GEN_4105 = 4'ha == enqIdx_1 ? io_query_1_req_bits_miss : _GEN_2761; // @[LoadQueueRAR.scala 111:{20,20}]
  wire  _GEN_4106 = 4'hb == enqIdx_1 ? io_query_1_req_bits_miss : _GEN_2762; // @[LoadQueueRAR.scala 111:{20,20}]
  wire  _GEN_5418 = canEnqVec_1 ? _GEN_4071 : _GEN_2655; // @[LoadQueueRAR.scala 91:46]
  wire  _GEN_5419 = canEnqVec_1 ? _GEN_4072 : _GEN_2656; // @[LoadQueueRAR.scala 91:46]
  wire  _GEN_5420 = canEnqVec_1 ? _GEN_4073 : _GEN_2657; // @[LoadQueueRAR.scala 91:46]
  wire  _GEN_5421 = canEnqVec_1 ? _GEN_4074 : _GEN_2658; // @[LoadQueueRAR.scala 91:46]
  wire  _GEN_5422 = canEnqVec_1 ? _GEN_4075 : _GEN_2659; // @[LoadQueueRAR.scala 91:46]
  wire  _GEN_5423 = canEnqVec_1 ? _GEN_4076 : _GEN_2660; // @[LoadQueueRAR.scala 91:46]
  wire  _GEN_5424 = canEnqVec_1 ? _GEN_4077 : _GEN_2661; // @[LoadQueueRAR.scala 91:46]
  wire  _GEN_5425 = canEnqVec_1 ? _GEN_4078 : _GEN_2662; // @[LoadQueueRAR.scala 91:46]
  wire  _GEN_5426 = canEnqVec_1 ? _GEN_4079 : _GEN_2663; // @[LoadQueueRAR.scala 91:46]
  wire  _GEN_5427 = canEnqVec_1 ? _GEN_4080 : _GEN_2664; // @[LoadQueueRAR.scala 91:46]
  wire  _GEN_5428 = canEnqVec_1 ? _GEN_4081 : _GEN_2665; // @[LoadQueueRAR.scala 91:46]
  wire  _GEN_5429 = canEnqVec_1 ? _GEN_4082 : _GEN_2666; // @[LoadQueueRAR.scala 91:46]
  wire  _GEN_5430 = canEnqVec_1 ? _GEN_4083 : _GEN_2739; // @[LoadQueueRAR.scala 91:46]
  wire  _GEN_5431 = canEnqVec_1 ? _GEN_4084 : _GEN_2740; // @[LoadQueueRAR.scala 91:46]
  wire  _GEN_5432 = canEnqVec_1 ? _GEN_4085 : _GEN_2741; // @[LoadQueueRAR.scala 91:46]
  wire  _GEN_5433 = canEnqVec_1 ? _GEN_4086 : _GEN_2742; // @[LoadQueueRAR.scala 91:46]
  wire  _GEN_5434 = canEnqVec_1 ? _GEN_4087 : _GEN_2743; // @[LoadQueueRAR.scala 91:46]
  wire  _GEN_5435 = canEnqVec_1 ? _GEN_4088 : _GEN_2744; // @[LoadQueueRAR.scala 91:46]
  wire  _GEN_5436 = canEnqVec_1 ? _GEN_4089 : _GEN_2745; // @[LoadQueueRAR.scala 91:46]
  wire  _GEN_5437 = canEnqVec_1 ? _GEN_4090 : _GEN_2746; // @[LoadQueueRAR.scala 91:46]
  wire  _GEN_5438 = canEnqVec_1 ? _GEN_4091 : _GEN_2747; // @[LoadQueueRAR.scala 91:46]
  wire  _GEN_5439 = canEnqVec_1 ? _GEN_4092 : _GEN_2748; // @[LoadQueueRAR.scala 91:46]
  wire  _GEN_5440 = canEnqVec_1 ? _GEN_4093 : _GEN_2749; // @[LoadQueueRAR.scala 91:46]
  wire  _GEN_5441 = canEnqVec_1 ? _GEN_4094 : _GEN_2750; // @[LoadQueueRAR.scala 91:46]
  wire  _GEN_5442 = canEnqVec_1 ? _GEN_4095 : _GEN_2751; // @[LoadQueueRAR.scala 91:46]
  wire  _GEN_5443 = canEnqVec_1 ? _GEN_4096 : _GEN_2752; // @[LoadQueueRAR.scala 91:46]
  wire  _GEN_5444 = canEnqVec_1 ? _GEN_4097 : _GEN_2753; // @[LoadQueueRAR.scala 91:46]
  wire  _GEN_5445 = canEnqVec_1 ? _GEN_4098 : _GEN_2754; // @[LoadQueueRAR.scala 91:46]
  wire  _GEN_5446 = canEnqVec_1 ? _GEN_4099 : _GEN_2755; // @[LoadQueueRAR.scala 91:46]
  wire  _GEN_5447 = canEnqVec_1 ? _GEN_4100 : _GEN_2756; // @[LoadQueueRAR.scala 91:46]
  wire  _GEN_5448 = canEnqVec_1 ? _GEN_4101 : _GEN_2757; // @[LoadQueueRAR.scala 91:46]
  wire  _GEN_5449 = canEnqVec_1 ? _GEN_4102 : _GEN_2758; // @[LoadQueueRAR.scala 91:46]
  wire  _GEN_5450 = canEnqVec_1 ? _GEN_4103 : _GEN_2759; // @[LoadQueueRAR.scala 91:46]
  wire  _GEN_5451 = canEnqVec_1 ? _GEN_4104 : _GEN_2760; // @[LoadQueueRAR.scala 91:46]
  wire  _GEN_5452 = canEnqVec_1 ? _GEN_4105 : _GEN_2761; // @[LoadQueueRAR.scala 91:46]
  wire  _GEN_5453 = canEnqVec_1 ? _GEN_4106 : _GEN_2762; // @[LoadQueueRAR.scala 91:46]
  wire  _GEN_5455 = 4'h1 == io_query_1_req_bits_index ? uop_1_robIdx_flag : uop_0_robIdx_flag; // @[CircularQueuePtr.scala 61:{70,70}]
  wire  _GEN_5456 = 4'h2 == io_query_1_req_bits_index ? uop_2_robIdx_flag : _GEN_5455; // @[CircularQueuePtr.scala 61:{70,70}]
  wire  _GEN_5457 = 4'h3 == io_query_1_req_bits_index ? uop_3_robIdx_flag : _GEN_5456; // @[CircularQueuePtr.scala 61:{70,70}]
  wire  _GEN_5458 = 4'h4 == io_query_1_req_bits_index ? uop_4_robIdx_flag : _GEN_5457; // @[CircularQueuePtr.scala 61:{70,70}]
  wire  _GEN_5459 = 4'h5 == io_query_1_req_bits_index ? uop_5_robIdx_flag : _GEN_5458; // @[CircularQueuePtr.scala 61:{70,70}]
  wire  _GEN_5460 = 4'h6 == io_query_1_req_bits_index ? uop_6_robIdx_flag : _GEN_5459; // @[CircularQueuePtr.scala 61:{70,70}]
  wire  _GEN_5461 = 4'h7 == io_query_1_req_bits_index ? uop_7_robIdx_flag : _GEN_5460; // @[CircularQueuePtr.scala 61:{70,70}]
  wire  _GEN_5462 = 4'h8 == io_query_1_req_bits_index ? uop_8_robIdx_flag : _GEN_5461; // @[CircularQueuePtr.scala 61:{70,70}]
  wire  _GEN_5463 = 4'h9 == io_query_1_req_bits_index ? uop_9_robIdx_flag : _GEN_5462; // @[CircularQueuePtr.scala 61:{70,70}]
  wire  _GEN_5464 = 4'ha == io_query_1_req_bits_index ? uop_10_robIdx_flag : _GEN_5463; // @[CircularQueuePtr.scala 61:{70,70}]
  wire  _GEN_5465 = 4'hb == io_query_1_req_bits_index ? uop_11_robIdx_flag : _GEN_5464; // @[CircularQueuePtr.scala 61:{70,70}]
  wire [4:0] _GEN_5467 = 4'h1 == io_query_1_req_bits_index ? uop_1_robIdx_value : uop_0_robIdx_value; // @[CircularQueuePtr.scala 61:{70,70}]
  wire [4:0] _GEN_5468 = 4'h2 == io_query_1_req_bits_index ? uop_2_robIdx_value : _GEN_5467; // @[CircularQueuePtr.scala 61:{70,70}]
  wire [4:0] _GEN_5469 = 4'h3 == io_query_1_req_bits_index ? uop_3_robIdx_value : _GEN_5468; // @[CircularQueuePtr.scala 61:{70,70}]
  wire [4:0] _GEN_5470 = 4'h4 == io_query_1_req_bits_index ? uop_4_robIdx_value : _GEN_5469; // @[CircularQueuePtr.scala 61:{70,70}]
  wire [4:0] _GEN_5471 = 4'h5 == io_query_1_req_bits_index ? uop_5_robIdx_value : _GEN_5470; // @[CircularQueuePtr.scala 61:{70,70}]
  wire [4:0] _GEN_5472 = 4'h6 == io_query_1_req_bits_index ? uop_6_robIdx_value : _GEN_5471; // @[CircularQueuePtr.scala 61:{70,70}]
  wire [4:0] _GEN_5473 = 4'h7 == io_query_1_req_bits_index ? uop_7_robIdx_value : _GEN_5472; // @[CircularQueuePtr.scala 61:{70,70}]
  wire [4:0] _GEN_5474 = 4'h8 == io_query_1_req_bits_index ? uop_8_robIdx_value : _GEN_5473; // @[CircularQueuePtr.scala 61:{70,70}]
  wire [4:0] _GEN_5475 = 4'h9 == io_query_1_req_bits_index ? uop_9_robIdx_value : _GEN_5474; // @[CircularQueuePtr.scala 61:{70,70}]
  wire [4:0] _GEN_5476 = 4'ha == io_query_1_req_bits_index ? uop_10_robIdx_value : _GEN_5475; // @[CircularQueuePtr.scala 61:{70,70}]
  wire [4:0] _GEN_5477 = 4'hb == io_query_1_req_bits_index ? uop_11_robIdx_value : _GEN_5476; // @[CircularQueuePtr.scala 61:{70,70}]
  wire [5:0] _T_17 = {_GEN_5465,_GEN_5477}; // @[CircularQueuePtr.scala 61:70]
  wire  _T_18 = _cancelEnqueue_flushItself_T_5 == _T_17; // @[CircularQueuePtr.scala 61:52]
  reg [11:0] allocatedUInt; // @[LoadQueueRAR.scala 123:30]
  reg  io_query_0_resp_valid_REG; // @[LoadQueueRAR.scala 128:32]
  reg  io_query_0_resp_bits_canAccept_REG; // @[LoadQueueRAR.scala 129:41]
  reg  io_query_0_resp_bits_allocated_REG; // @[LoadQueueRAR.scala 130:41]
  wire  robIdxMask_differentFlag = uop_0_robIdx_flag ^ io_query_0_req_bits_uop_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  robIdxMask_compare = uop_0_robIdx_value > io_query_0_req_bits_uop_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  robIdxMask__0 = robIdxMask_differentFlag ^ robIdxMask_compare; // @[CircularQueuePtr.scala 88:19]
  wire  robIdxMask_differentFlag_1 = uop_1_robIdx_flag ^ io_query_0_req_bits_uop_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  robIdxMask_compare_1 = uop_1_robIdx_value > io_query_0_req_bits_uop_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  robIdxMask__1 = robIdxMask_differentFlag_1 ^ robIdxMask_compare_1; // @[CircularQueuePtr.scala 88:19]
  wire  robIdxMask_differentFlag_2 = uop_2_robIdx_flag ^ io_query_0_req_bits_uop_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  robIdxMask_compare_2 = uop_2_robIdx_value > io_query_0_req_bits_uop_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  robIdxMask__2 = robIdxMask_differentFlag_2 ^ robIdxMask_compare_2; // @[CircularQueuePtr.scala 88:19]
  wire  robIdxMask_differentFlag_3 = uop_3_robIdx_flag ^ io_query_0_req_bits_uop_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  robIdxMask_compare_3 = uop_3_robIdx_value > io_query_0_req_bits_uop_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  robIdxMask__3 = robIdxMask_differentFlag_3 ^ robIdxMask_compare_3; // @[CircularQueuePtr.scala 88:19]
  wire  robIdxMask_differentFlag_4 = uop_4_robIdx_flag ^ io_query_0_req_bits_uop_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  robIdxMask_compare_4 = uop_4_robIdx_value > io_query_0_req_bits_uop_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  robIdxMask__4 = robIdxMask_differentFlag_4 ^ robIdxMask_compare_4; // @[CircularQueuePtr.scala 88:19]
  wire  robIdxMask_differentFlag_5 = uop_5_robIdx_flag ^ io_query_0_req_bits_uop_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  robIdxMask_compare_5 = uop_5_robIdx_value > io_query_0_req_bits_uop_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  robIdxMask__5 = robIdxMask_differentFlag_5 ^ robIdxMask_compare_5; // @[CircularQueuePtr.scala 88:19]
  wire  robIdxMask_differentFlag_6 = uop_6_robIdx_flag ^ io_query_0_req_bits_uop_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  robIdxMask_compare_6 = uop_6_robIdx_value > io_query_0_req_bits_uop_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  robIdxMask__6 = robIdxMask_differentFlag_6 ^ robIdxMask_compare_6; // @[CircularQueuePtr.scala 88:19]
  wire  robIdxMask_differentFlag_7 = uop_7_robIdx_flag ^ io_query_0_req_bits_uop_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  robIdxMask_compare_7 = uop_7_robIdx_value > io_query_0_req_bits_uop_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  robIdxMask__7 = robIdxMask_differentFlag_7 ^ robIdxMask_compare_7; // @[CircularQueuePtr.scala 88:19]
  wire  robIdxMask_differentFlag_8 = uop_8_robIdx_flag ^ io_query_0_req_bits_uop_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  robIdxMask_compare_8 = uop_8_robIdx_value > io_query_0_req_bits_uop_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  robIdxMask__8 = robIdxMask_differentFlag_8 ^ robIdxMask_compare_8; // @[CircularQueuePtr.scala 88:19]
  wire  robIdxMask_differentFlag_9 = uop_9_robIdx_flag ^ io_query_0_req_bits_uop_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  robIdxMask_compare_9 = uop_9_robIdx_value > io_query_0_req_bits_uop_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  robIdxMask__9 = robIdxMask_differentFlag_9 ^ robIdxMask_compare_9; // @[CircularQueuePtr.scala 88:19]
  wire  robIdxMask_differentFlag_10 = uop_10_robIdx_flag ^ io_query_0_req_bits_uop_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  robIdxMask_compare_10 = uop_10_robIdx_value > io_query_0_req_bits_uop_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  robIdxMask__10 = robIdxMask_differentFlag_10 ^ robIdxMask_compare_10; // @[CircularQueuePtr.scala 88:19]
  wire  robIdxMask_differentFlag_11 = uop_11_robIdx_flag ^ io_query_0_req_bits_uop_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  robIdxMask_compare_11 = uop_11_robIdx_value > io_query_0_req_bits_uop_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  robIdxMask__11 = robIdxMask_differentFlag_11 ^ robIdxMask_compare_11; // @[CircularQueuePtr.scala 88:19]
  wire [5:0] matchMask_lo = {paddrModule_io_releaseViolationMmask_0_5,paddrModule_io_releaseViolationMmask_0_4,
    paddrModule_io_releaseViolationMmask_0_3,paddrModule_io_releaseViolationMmask_0_2,
    paddrModule_io_releaseViolationMmask_0_1,paddrModule_io_releaseViolationMmask_0_0}; // @[LoadQueueRAR.scala 135:69]
  wire [5:0] matchMask_hi = {paddrModule_io_releaseViolationMmask_0_11,paddrModule_io_releaseViolationMmask_0_10,
    paddrModule_io_releaseViolationMmask_0_9,paddrModule_io_releaseViolationMmask_0_8,
    paddrModule_io_releaseViolationMmask_0_7,paddrModule_io_releaseViolationMmask_0_6}; // @[LoadQueueRAR.scala 135:69]
  reg [11:0] matchMask_REG; // @[LoadQueueRAR.scala 135:28]
  wire [11:0] _matchMask_T_1 = allocatedUInt & matchMask_REG; // @[LoadQueueRAR.scala 134:35]
  wire [5:0] matchMask_lo_1 = {robIdxMask__5,robIdxMask__4,robIdxMask__3,robIdxMask__2,robIdxMask__1,robIdxMask__0}; // @[LoadQueueRAR.scala 136:42]
  wire [5:0] matchMask_hi_1 = {robIdxMask__11,robIdxMask__10,robIdxMask__9,robIdxMask__8,robIdxMask__7,robIdxMask__6}; // @[LoadQueueRAR.scala 136:42]
  reg [11:0] matchMask_REG_1; // @[LoadQueueRAR.scala 136:30]
  wire [11:0] matchMask = _matchMask_T_1 & matchMask_REG_1; // @[LoadQueueRAR.scala 135:77]
  wire [5:0] ldLdViolationMask_lo = {released_5,released_4,released_3,released_2,released_1,released_0}; // @[LoadQueueRAR.scala 138:67]
  wire [11:0] _ldLdViolationMask_T = {released_11,released_10,released_9,released_8,released_7,released_6,
    ldLdViolationMask_lo}; // @[LoadQueueRAR.scala 138:67]
  wire [5:0] ldLdViolationMask_lo_1 = {datavalid_5,datavalid_4,datavalid_3,datavalid_2,datavalid_1,datavalid_0}; // @[LoadQueueRAR.scala 138:87]
  wire [11:0] _ldLdViolationMask_T_1 = {datavalid_11,datavalid_10,datavalid_9,datavalid_8,datavalid_7,datavalid_6,
    ldLdViolationMask_lo_1}; // @[LoadQueueRAR.scala 138:87]
  wire [5:0] ldLdViolationMask_lo_2 = {miss_5,miss_4,miss_3,miss_2,miss_1,miss_0}; // @[LoadQueueRAR.scala 138:101]
  wire [11:0] _ldLdViolationMask_T_2 = {miss_11,miss_10,miss_9,miss_8,miss_7,miss_6,ldLdViolationMask_lo_2}; // @[LoadQueueRAR.scala 138:101]
  wire [11:0] _ldLdViolationMask_T_3 = _ldLdViolationMask_T_1 | _ldLdViolationMask_T_2; // @[LoadQueueRAR.scala 138:94]
  reg [11:0] ldLdViolationMask_REG; // @[LoadQueueRAR.scala 138:57]
  wire [11:0] ldLdViolationMask_0 = matchMask & ldLdViolationMask_REG; // @[LoadQueueRAR.scala 138:48]
  reg  io_query_0_resp_bits_replayFromFetch_REG; // @[LoadQueueRAR.scala 141:72]
  reg [3:0] io_query_0_resp_bits_index_REG; // @[LoadQueueRAR.scala 142:37]
  reg  io_query_1_resp_valid_REG; // @[LoadQueueRAR.scala 128:32]
  reg  io_query_1_resp_bits_canAccept_REG; // @[LoadQueueRAR.scala 129:41]
  reg  io_query_1_resp_bits_allocated_REG; // @[LoadQueueRAR.scala 130:41]
  wire  robIdxMask_differentFlag_12 = uop_0_robIdx_flag ^ io_query_1_req_bits_uop_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  robIdxMask_compare_12 = uop_0_robIdx_value > io_query_1_req_bits_uop_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  robIdxMask_1_0 = robIdxMask_differentFlag_12 ^ robIdxMask_compare_12; // @[CircularQueuePtr.scala 88:19]
  wire  robIdxMask_differentFlag_13 = uop_1_robIdx_flag ^ io_query_1_req_bits_uop_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  robIdxMask_compare_13 = uop_1_robIdx_value > io_query_1_req_bits_uop_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  robIdxMask_1_1 = robIdxMask_differentFlag_13 ^ robIdxMask_compare_13; // @[CircularQueuePtr.scala 88:19]
  wire  robIdxMask_differentFlag_14 = uop_2_robIdx_flag ^ io_query_1_req_bits_uop_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  robIdxMask_compare_14 = uop_2_robIdx_value > io_query_1_req_bits_uop_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  robIdxMask_1_2 = robIdxMask_differentFlag_14 ^ robIdxMask_compare_14; // @[CircularQueuePtr.scala 88:19]
  wire  robIdxMask_differentFlag_15 = uop_3_robIdx_flag ^ io_query_1_req_bits_uop_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  robIdxMask_compare_15 = uop_3_robIdx_value > io_query_1_req_bits_uop_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  robIdxMask_1_3 = robIdxMask_differentFlag_15 ^ robIdxMask_compare_15; // @[CircularQueuePtr.scala 88:19]
  wire  robIdxMask_differentFlag_16 = uop_4_robIdx_flag ^ io_query_1_req_bits_uop_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  robIdxMask_compare_16 = uop_4_robIdx_value > io_query_1_req_bits_uop_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  robIdxMask_1_4 = robIdxMask_differentFlag_16 ^ robIdxMask_compare_16; // @[CircularQueuePtr.scala 88:19]
  wire  robIdxMask_differentFlag_17 = uop_5_robIdx_flag ^ io_query_1_req_bits_uop_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  robIdxMask_compare_17 = uop_5_robIdx_value > io_query_1_req_bits_uop_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  robIdxMask_1_5 = robIdxMask_differentFlag_17 ^ robIdxMask_compare_17; // @[CircularQueuePtr.scala 88:19]
  wire  robIdxMask_differentFlag_18 = uop_6_robIdx_flag ^ io_query_1_req_bits_uop_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  robIdxMask_compare_18 = uop_6_robIdx_value > io_query_1_req_bits_uop_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  robIdxMask_1_6 = robIdxMask_differentFlag_18 ^ robIdxMask_compare_18; // @[CircularQueuePtr.scala 88:19]
  wire  robIdxMask_differentFlag_19 = uop_7_robIdx_flag ^ io_query_1_req_bits_uop_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  robIdxMask_compare_19 = uop_7_robIdx_value > io_query_1_req_bits_uop_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  robIdxMask_1_7 = robIdxMask_differentFlag_19 ^ robIdxMask_compare_19; // @[CircularQueuePtr.scala 88:19]
  wire  robIdxMask_differentFlag_20 = uop_8_robIdx_flag ^ io_query_1_req_bits_uop_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  robIdxMask_compare_20 = uop_8_robIdx_value > io_query_1_req_bits_uop_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  robIdxMask_1_8 = robIdxMask_differentFlag_20 ^ robIdxMask_compare_20; // @[CircularQueuePtr.scala 88:19]
  wire  robIdxMask_differentFlag_21 = uop_9_robIdx_flag ^ io_query_1_req_bits_uop_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  robIdxMask_compare_21 = uop_9_robIdx_value > io_query_1_req_bits_uop_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  robIdxMask_1_9 = robIdxMask_differentFlag_21 ^ robIdxMask_compare_21; // @[CircularQueuePtr.scala 88:19]
  wire  robIdxMask_differentFlag_22 = uop_10_robIdx_flag ^ io_query_1_req_bits_uop_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  robIdxMask_compare_22 = uop_10_robIdx_value > io_query_1_req_bits_uop_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  robIdxMask_1_10 = robIdxMask_differentFlag_22 ^ robIdxMask_compare_22; // @[CircularQueuePtr.scala 88:19]
  wire  robIdxMask_differentFlag_23 = uop_11_robIdx_flag ^ io_query_1_req_bits_uop_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  robIdxMask_compare_23 = uop_11_robIdx_value > io_query_1_req_bits_uop_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  robIdxMask_1_11 = robIdxMask_differentFlag_23 ^ robIdxMask_compare_23; // @[CircularQueuePtr.scala 88:19]
  wire [5:0] matchMask_lo_2 = {paddrModule_io_releaseViolationMmask_1_5,paddrModule_io_releaseViolationMmask_1_4,
    paddrModule_io_releaseViolationMmask_1_3,paddrModule_io_releaseViolationMmask_1_2,
    paddrModule_io_releaseViolationMmask_1_1,paddrModule_io_releaseViolationMmask_1_0}; // @[LoadQueueRAR.scala 135:69]
  wire [5:0] matchMask_hi_2 = {paddrModule_io_releaseViolationMmask_1_11,paddrModule_io_releaseViolationMmask_1_10,
    paddrModule_io_releaseViolationMmask_1_9,paddrModule_io_releaseViolationMmask_1_8,
    paddrModule_io_releaseViolationMmask_1_7,paddrModule_io_releaseViolationMmask_1_6}; // @[LoadQueueRAR.scala 135:69]
  reg [11:0] matchMask_REG_2; // @[LoadQueueRAR.scala 135:28]
  wire [11:0] _matchMask_T_4 = allocatedUInt & matchMask_REG_2; // @[LoadQueueRAR.scala 134:35]
  wire [5:0] matchMask_lo_3 = {robIdxMask_1_5,robIdxMask_1_4,robIdxMask_1_3,robIdxMask_1_2,robIdxMask_1_1,robIdxMask_1_0
    }; // @[LoadQueueRAR.scala 136:42]
  wire [5:0] matchMask_hi_3 = {robIdxMask_1_11,robIdxMask_1_10,robIdxMask_1_9,robIdxMask_1_8,robIdxMask_1_7,
    robIdxMask_1_6}; // @[LoadQueueRAR.scala 136:42]
  reg [11:0] matchMask_REG_3; // @[LoadQueueRAR.scala 136:30]
  wire [11:0] matchMask_1 = _matchMask_T_4 & matchMask_REG_3; // @[LoadQueueRAR.scala 135:77]
  reg [11:0] ldLdViolationMask_REG_1; // @[LoadQueueRAR.scala 138:57]
  wire [11:0] ldLdViolationMask_1 = matchMask_1 & ldLdViolationMask_REG_1; // @[LoadQueueRAR.scala 138:48]
  reg  io_query_1_resp_bits_replayFromFetch_REG; // @[LoadQueueRAR.scala 141:72]
  reg [3:0] io_query_1_resp_bits_index_REG; // @[LoadQueueRAR.scala 142:37]
  wire  deqNotBlock_differentFlag = io_ldIssuePtr_flag ^ uop_0_lqIdx_flag; // @[CircularQueuePtr.scala 92:35]
  wire  deqNotBlock_compare = io_ldIssuePtr_value < uop_0_lqIdx_value; // @[CircularQueuePtr.scala 93:30]
  wire  _deqNotBlock_T = deqNotBlock_differentFlag ^ deqNotBlock_compare; // @[CircularQueuePtr.scala 94:19]
  wire  deqNotBlock = ~_deqNotBlock_T; // @[LoadQueueRAR.scala 152:23]
  wire [5:0] _needFlush_flushItself_T_1 = {uop_0_robIdx_flag,uop_0_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _needFlush_flushItself_T_3 = _needFlush_flushItself_T_1 == _cancelEnqueue_flushItself_T_2; // @[CircularQueuePtr.scala 61:52]
  wire  needFlush_flushItself = io_redirect_bits_level & _needFlush_flushItself_T_3; // @[Rob.scala 122:51]
  wire  needFlush_differentFlag = uop_0_robIdx_flag ^ io_redirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  needFlush_compare = uop_0_robIdx_value > io_redirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _needFlush_T = needFlush_differentFlag ^ needFlush_compare; // @[CircularQueuePtr.scala 88:19]
  wire  needFlush = io_redirect_valid & (needFlush_flushItself | _needFlush_T); // @[Rob.scala 123:20]
  wire  deqNotBlock_differentFlag_1 = io_ldIssuePtr_flag ^ uop_1_lqIdx_flag; // @[CircularQueuePtr.scala 92:35]
  wire  deqNotBlock_compare_1 = io_ldIssuePtr_value < uop_1_lqIdx_value; // @[CircularQueuePtr.scala 93:30]
  wire  _deqNotBlock_T_1 = deqNotBlock_differentFlag_1 ^ deqNotBlock_compare_1; // @[CircularQueuePtr.scala 94:19]
  wire  deqNotBlock_1 = ~_deqNotBlock_T_1; // @[LoadQueueRAR.scala 152:23]
  wire [5:0] _needFlush_flushItself_T_5 = {uop_1_robIdx_flag,uop_1_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _needFlush_flushItself_T_7 = _needFlush_flushItself_T_5 == _cancelEnqueue_flushItself_T_2; // @[CircularQueuePtr.scala 61:52]
  wire  needFlush_flushItself_1 = io_redirect_bits_level & _needFlush_flushItself_T_7; // @[Rob.scala 122:51]
  wire  needFlush_differentFlag_1 = uop_1_robIdx_flag ^ io_redirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  needFlush_compare_1 = uop_1_robIdx_value > io_redirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _needFlush_T_2 = needFlush_differentFlag_1 ^ needFlush_compare_1; // @[CircularQueuePtr.scala 88:19]
  wire  needFlush_1 = io_redirect_valid & (needFlush_flushItself_1 | _needFlush_T_2); // @[Rob.scala 123:20]
  wire  deqNotBlock_differentFlag_2 = io_ldIssuePtr_flag ^ uop_2_lqIdx_flag; // @[CircularQueuePtr.scala 92:35]
  wire  deqNotBlock_compare_2 = io_ldIssuePtr_value < uop_2_lqIdx_value; // @[CircularQueuePtr.scala 93:30]
  wire  _deqNotBlock_T_2 = deqNotBlock_differentFlag_2 ^ deqNotBlock_compare_2; // @[CircularQueuePtr.scala 94:19]
  wire  deqNotBlock_2 = ~_deqNotBlock_T_2; // @[LoadQueueRAR.scala 152:23]
  wire [5:0] _needFlush_flushItself_T_9 = {uop_2_robIdx_flag,uop_2_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _needFlush_flushItself_T_11 = _needFlush_flushItself_T_9 == _cancelEnqueue_flushItself_T_2; // @[CircularQueuePtr.scala 61:52]
  wire  needFlush_flushItself_2 = io_redirect_bits_level & _needFlush_flushItself_T_11; // @[Rob.scala 122:51]
  wire  needFlush_differentFlag_2 = uop_2_robIdx_flag ^ io_redirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  needFlush_compare_2 = uop_2_robIdx_value > io_redirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _needFlush_T_4 = needFlush_differentFlag_2 ^ needFlush_compare_2; // @[CircularQueuePtr.scala 88:19]
  wire  needFlush_2 = io_redirect_valid & (needFlush_flushItself_2 | _needFlush_T_4); // @[Rob.scala 123:20]
  wire  deqNotBlock_differentFlag_3 = io_ldIssuePtr_flag ^ uop_3_lqIdx_flag; // @[CircularQueuePtr.scala 92:35]
  wire  deqNotBlock_compare_3 = io_ldIssuePtr_value < uop_3_lqIdx_value; // @[CircularQueuePtr.scala 93:30]
  wire  _deqNotBlock_T_3 = deqNotBlock_differentFlag_3 ^ deqNotBlock_compare_3; // @[CircularQueuePtr.scala 94:19]
  wire  deqNotBlock_3 = ~_deqNotBlock_T_3; // @[LoadQueueRAR.scala 152:23]
  wire [5:0] _needFlush_flushItself_T_13 = {uop_3_robIdx_flag,uop_3_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _needFlush_flushItself_T_15 = _needFlush_flushItself_T_13 == _cancelEnqueue_flushItself_T_2; // @[CircularQueuePtr.scala 61:52]
  wire  needFlush_flushItself_3 = io_redirect_bits_level & _needFlush_flushItself_T_15; // @[Rob.scala 122:51]
  wire  needFlush_differentFlag_3 = uop_3_robIdx_flag ^ io_redirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  needFlush_compare_3 = uop_3_robIdx_value > io_redirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _needFlush_T_6 = needFlush_differentFlag_3 ^ needFlush_compare_3; // @[CircularQueuePtr.scala 88:19]
  wire  needFlush_3 = io_redirect_valid & (needFlush_flushItself_3 | _needFlush_T_6); // @[Rob.scala 123:20]
  wire  deqNotBlock_differentFlag_4 = io_ldIssuePtr_flag ^ uop_4_lqIdx_flag; // @[CircularQueuePtr.scala 92:35]
  wire  deqNotBlock_compare_4 = io_ldIssuePtr_value < uop_4_lqIdx_value; // @[CircularQueuePtr.scala 93:30]
  wire  _deqNotBlock_T_4 = deqNotBlock_differentFlag_4 ^ deqNotBlock_compare_4; // @[CircularQueuePtr.scala 94:19]
  wire  deqNotBlock_4 = ~_deqNotBlock_T_4; // @[LoadQueueRAR.scala 152:23]
  wire [5:0] _needFlush_flushItself_T_17 = {uop_4_robIdx_flag,uop_4_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _needFlush_flushItself_T_19 = _needFlush_flushItself_T_17 == _cancelEnqueue_flushItself_T_2; // @[CircularQueuePtr.scala 61:52]
  wire  needFlush_flushItself_4 = io_redirect_bits_level & _needFlush_flushItself_T_19; // @[Rob.scala 122:51]
  wire  needFlush_differentFlag_4 = uop_4_robIdx_flag ^ io_redirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  needFlush_compare_4 = uop_4_robIdx_value > io_redirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _needFlush_T_8 = needFlush_differentFlag_4 ^ needFlush_compare_4; // @[CircularQueuePtr.scala 88:19]
  wire  needFlush_4 = io_redirect_valid & (needFlush_flushItself_4 | _needFlush_T_8); // @[Rob.scala 123:20]
  wire  deqNotBlock_differentFlag_5 = io_ldIssuePtr_flag ^ uop_5_lqIdx_flag; // @[CircularQueuePtr.scala 92:35]
  wire  deqNotBlock_compare_5 = io_ldIssuePtr_value < uop_5_lqIdx_value; // @[CircularQueuePtr.scala 93:30]
  wire  _deqNotBlock_T_5 = deqNotBlock_differentFlag_5 ^ deqNotBlock_compare_5; // @[CircularQueuePtr.scala 94:19]
  wire  deqNotBlock_5 = ~_deqNotBlock_T_5; // @[LoadQueueRAR.scala 152:23]
  wire [5:0] _needFlush_flushItself_T_21 = {uop_5_robIdx_flag,uop_5_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _needFlush_flushItself_T_23 = _needFlush_flushItself_T_21 == _cancelEnqueue_flushItself_T_2; // @[CircularQueuePtr.scala 61:52]
  wire  needFlush_flushItself_5 = io_redirect_bits_level & _needFlush_flushItself_T_23; // @[Rob.scala 122:51]
  wire  needFlush_differentFlag_5 = uop_5_robIdx_flag ^ io_redirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  needFlush_compare_5 = uop_5_robIdx_value > io_redirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _needFlush_T_10 = needFlush_differentFlag_5 ^ needFlush_compare_5; // @[CircularQueuePtr.scala 88:19]
  wire  needFlush_5 = io_redirect_valid & (needFlush_flushItself_5 | _needFlush_T_10); // @[Rob.scala 123:20]
  wire  deqNotBlock_differentFlag_6 = io_ldIssuePtr_flag ^ uop_6_lqIdx_flag; // @[CircularQueuePtr.scala 92:35]
  wire  deqNotBlock_compare_6 = io_ldIssuePtr_value < uop_6_lqIdx_value; // @[CircularQueuePtr.scala 93:30]
  wire  _deqNotBlock_T_6 = deqNotBlock_differentFlag_6 ^ deqNotBlock_compare_6; // @[CircularQueuePtr.scala 94:19]
  wire  deqNotBlock_6 = ~_deqNotBlock_T_6; // @[LoadQueueRAR.scala 152:23]
  wire [5:0] _needFlush_flushItself_T_25 = {uop_6_robIdx_flag,uop_6_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _needFlush_flushItself_T_27 = _needFlush_flushItself_T_25 == _cancelEnqueue_flushItself_T_2; // @[CircularQueuePtr.scala 61:52]
  wire  needFlush_flushItself_6 = io_redirect_bits_level & _needFlush_flushItself_T_27; // @[Rob.scala 122:51]
  wire  needFlush_differentFlag_6 = uop_6_robIdx_flag ^ io_redirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  needFlush_compare_6 = uop_6_robIdx_value > io_redirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _needFlush_T_12 = needFlush_differentFlag_6 ^ needFlush_compare_6; // @[CircularQueuePtr.scala 88:19]
  wire  needFlush_6 = io_redirect_valid & (needFlush_flushItself_6 | _needFlush_T_12); // @[Rob.scala 123:20]
  wire  deqNotBlock_differentFlag_7 = io_ldIssuePtr_flag ^ uop_7_lqIdx_flag; // @[CircularQueuePtr.scala 92:35]
  wire  deqNotBlock_compare_7 = io_ldIssuePtr_value < uop_7_lqIdx_value; // @[CircularQueuePtr.scala 93:30]
  wire  _deqNotBlock_T_7 = deqNotBlock_differentFlag_7 ^ deqNotBlock_compare_7; // @[CircularQueuePtr.scala 94:19]
  wire  deqNotBlock_7 = ~_deqNotBlock_T_7; // @[LoadQueueRAR.scala 152:23]
  wire [5:0] _needFlush_flushItself_T_29 = {uop_7_robIdx_flag,uop_7_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _needFlush_flushItself_T_31 = _needFlush_flushItself_T_29 == _cancelEnqueue_flushItself_T_2; // @[CircularQueuePtr.scala 61:52]
  wire  needFlush_flushItself_7 = io_redirect_bits_level & _needFlush_flushItself_T_31; // @[Rob.scala 122:51]
  wire  needFlush_differentFlag_7 = uop_7_robIdx_flag ^ io_redirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  needFlush_compare_7 = uop_7_robIdx_value > io_redirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _needFlush_T_14 = needFlush_differentFlag_7 ^ needFlush_compare_7; // @[CircularQueuePtr.scala 88:19]
  wire  needFlush_7 = io_redirect_valid & (needFlush_flushItself_7 | _needFlush_T_14); // @[Rob.scala 123:20]
  wire  deqNotBlock_differentFlag_8 = io_ldIssuePtr_flag ^ uop_8_lqIdx_flag; // @[CircularQueuePtr.scala 92:35]
  wire  deqNotBlock_compare_8 = io_ldIssuePtr_value < uop_8_lqIdx_value; // @[CircularQueuePtr.scala 93:30]
  wire  _deqNotBlock_T_8 = deqNotBlock_differentFlag_8 ^ deqNotBlock_compare_8; // @[CircularQueuePtr.scala 94:19]
  wire  deqNotBlock_8 = ~_deqNotBlock_T_8; // @[LoadQueueRAR.scala 152:23]
  wire [5:0] _needFlush_flushItself_T_33 = {uop_8_robIdx_flag,uop_8_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _needFlush_flushItself_T_35 = _needFlush_flushItself_T_33 == _cancelEnqueue_flushItself_T_2; // @[CircularQueuePtr.scala 61:52]
  wire  needFlush_flushItself_8 = io_redirect_bits_level & _needFlush_flushItself_T_35; // @[Rob.scala 122:51]
  wire  needFlush_differentFlag_8 = uop_8_robIdx_flag ^ io_redirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  needFlush_compare_8 = uop_8_robIdx_value > io_redirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _needFlush_T_16 = needFlush_differentFlag_8 ^ needFlush_compare_8; // @[CircularQueuePtr.scala 88:19]
  wire  needFlush_8 = io_redirect_valid & (needFlush_flushItself_8 | _needFlush_T_16); // @[Rob.scala 123:20]
  wire  deqNotBlock_differentFlag_9 = io_ldIssuePtr_flag ^ uop_9_lqIdx_flag; // @[CircularQueuePtr.scala 92:35]
  wire  deqNotBlock_compare_9 = io_ldIssuePtr_value < uop_9_lqIdx_value; // @[CircularQueuePtr.scala 93:30]
  wire  _deqNotBlock_T_9 = deqNotBlock_differentFlag_9 ^ deqNotBlock_compare_9; // @[CircularQueuePtr.scala 94:19]
  wire  deqNotBlock_9 = ~_deqNotBlock_T_9; // @[LoadQueueRAR.scala 152:23]
  wire [5:0] _needFlush_flushItself_T_37 = {uop_9_robIdx_flag,uop_9_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _needFlush_flushItself_T_39 = _needFlush_flushItself_T_37 == _cancelEnqueue_flushItself_T_2; // @[CircularQueuePtr.scala 61:52]
  wire  needFlush_flushItself_9 = io_redirect_bits_level & _needFlush_flushItself_T_39; // @[Rob.scala 122:51]
  wire  needFlush_differentFlag_9 = uop_9_robIdx_flag ^ io_redirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  needFlush_compare_9 = uop_9_robIdx_value > io_redirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _needFlush_T_18 = needFlush_differentFlag_9 ^ needFlush_compare_9; // @[CircularQueuePtr.scala 88:19]
  wire  needFlush_9 = io_redirect_valid & (needFlush_flushItself_9 | _needFlush_T_18); // @[Rob.scala 123:20]
  wire  deqNotBlock_differentFlag_10 = io_ldIssuePtr_flag ^ uop_10_lqIdx_flag; // @[CircularQueuePtr.scala 92:35]
  wire  deqNotBlock_compare_10 = io_ldIssuePtr_value < uop_10_lqIdx_value; // @[CircularQueuePtr.scala 93:30]
  wire  _deqNotBlock_T_10 = deqNotBlock_differentFlag_10 ^ deqNotBlock_compare_10; // @[CircularQueuePtr.scala 94:19]
  wire  deqNotBlock_10 = ~_deqNotBlock_T_10; // @[LoadQueueRAR.scala 152:23]
  wire [5:0] _needFlush_flushItself_T_41 = {uop_10_robIdx_flag,uop_10_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _needFlush_flushItself_T_43 = _needFlush_flushItself_T_41 == _cancelEnqueue_flushItself_T_2; // @[CircularQueuePtr.scala 61:52]
  wire  needFlush_flushItself_10 = io_redirect_bits_level & _needFlush_flushItself_T_43; // @[Rob.scala 122:51]
  wire  needFlush_differentFlag_10 = uop_10_robIdx_flag ^ io_redirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  needFlush_compare_10 = uop_10_robIdx_value > io_redirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _needFlush_T_20 = needFlush_differentFlag_10 ^ needFlush_compare_10; // @[CircularQueuePtr.scala 88:19]
  wire  needFlush_10 = io_redirect_valid & (needFlush_flushItself_10 | _needFlush_T_20); // @[Rob.scala 123:20]
  wire  deqNotBlock_differentFlag_11 = io_ldIssuePtr_flag ^ uop_11_lqIdx_flag; // @[CircularQueuePtr.scala 92:35]
  wire  deqNotBlock_compare_11 = io_ldIssuePtr_value < uop_11_lqIdx_value; // @[CircularQueuePtr.scala 93:30]
  wire  _deqNotBlock_T_11 = deqNotBlock_differentFlag_11 ^ deqNotBlock_compare_11; // @[CircularQueuePtr.scala 94:19]
  wire  deqNotBlock_11 = ~_deqNotBlock_T_11; // @[LoadQueueRAR.scala 152:23]
  wire [5:0] _needFlush_flushItself_T_45 = {uop_11_robIdx_flag,uop_11_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _needFlush_flushItself_T_47 = _needFlush_flushItself_T_45 == _cancelEnqueue_flushItself_T_2; // @[CircularQueuePtr.scala 61:52]
  wire  needFlush_flushItself_11 = io_redirect_bits_level & _needFlush_flushItself_T_47; // @[Rob.scala 122:51]
  wire  needFlush_differentFlag_11 = uop_11_robIdx_flag ^ io_redirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  needFlush_compare_11 = uop_11_robIdx_value > io_redirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _needFlush_T_22 = needFlush_differentFlag_11 ^ needFlush_compare_11; // @[CircularQueuePtr.scala 88:19]
  wire  needFlush_11 = io_redirect_valid & (needFlush_flushItself_11 | _needFlush_T_22); // @[Rob.scala 123:20]
  reg  REG; // @[LoadQueueRAR.scala 168:18]
  reg  REG_1; // @[LoadQueueRAR.scala 168:18]
  reg  REG_2; // @[LoadQueueRAR.scala 168:18]
  reg  REG_3; // @[LoadQueueRAR.scala 168:18]
  reg  REG_4; // @[LoadQueueRAR.scala 168:18]
  reg  REG_5; // @[LoadQueueRAR.scala 168:18]
  reg  REG_6; // @[LoadQueueRAR.scala 168:18]
  reg  REG_7; // @[LoadQueueRAR.scala 168:18]
  reg  REG_8; // @[LoadQueueRAR.scala 168:18]
  reg  REG_9; // @[LoadQueueRAR.scala 168:18]
  reg  REG_10; // @[LoadQueueRAR.scala 168:18]
  reg  REG_11; // @[LoadQueueRAR.scala 168:18]
  wire  _ldLdViolationCount_T = io_query_0_resp_valid & io_query_0_resp_bits_replayFromFetch; // @[LoadQueueRAR.scala 178:81]
  wire  _ldLdViolationCount_T_1 = io_query_1_resp_valid & io_query_1_resp_bits_replayFromFetch; // @[LoadQueueRAR.scala 178:81]
  reg [1:0] io_perf_0_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg [1:0] io_perf_0_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg  io_perf_1_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg  io_perf_1_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg [1:0] io_perf_2_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg [1:0] io_perf_2_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  LqPAddrModule paddrModule ( // @[LoadQueueRAR.scala 56:27]
    .clock(paddrModule_clock),
    .io_wen_0(paddrModule_io_wen_0),
    .io_wen_1(paddrModule_io_wen_1),
    .io_waddr_0(paddrModule_io_waddr_0),
    .io_waddr_1(paddrModule_io_waddr_1),
    .io_wdata_0(paddrModule_io_wdata_0),
    .io_wdata_1(paddrModule_io_wdata_1),
    .io_releaseMdata_1(paddrModule_io_releaseMdata_1),
    .io_releaseMmask_1_0(paddrModule_io_releaseMmask_1_0),
    .io_releaseMmask_1_1(paddrModule_io_releaseMmask_1_1),
    .io_releaseMmask_1_2(paddrModule_io_releaseMmask_1_2),
    .io_releaseMmask_1_3(paddrModule_io_releaseMmask_1_3),
    .io_releaseMmask_1_4(paddrModule_io_releaseMmask_1_4),
    .io_releaseMmask_1_5(paddrModule_io_releaseMmask_1_5),
    .io_releaseMmask_1_6(paddrModule_io_releaseMmask_1_6),
    .io_releaseMmask_1_7(paddrModule_io_releaseMmask_1_7),
    .io_releaseMmask_1_8(paddrModule_io_releaseMmask_1_8),
    .io_releaseMmask_1_9(paddrModule_io_releaseMmask_1_9),
    .io_releaseMmask_1_10(paddrModule_io_releaseMmask_1_10),
    .io_releaseMmask_1_11(paddrModule_io_releaseMmask_1_11),
    .io_releaseViolationMdata_0(paddrModule_io_releaseViolationMdata_0),
    .io_releaseViolationMdata_1(paddrModule_io_releaseViolationMdata_1),
    .io_releaseViolationMmask_0_0(paddrModule_io_releaseViolationMmask_0_0),
    .io_releaseViolationMmask_0_1(paddrModule_io_releaseViolationMmask_0_1),
    .io_releaseViolationMmask_0_2(paddrModule_io_releaseViolationMmask_0_2),
    .io_releaseViolationMmask_0_3(paddrModule_io_releaseViolationMmask_0_3),
    .io_releaseViolationMmask_0_4(paddrModule_io_releaseViolationMmask_0_4),
    .io_releaseViolationMmask_0_5(paddrModule_io_releaseViolationMmask_0_5),
    .io_releaseViolationMmask_0_6(paddrModule_io_releaseViolationMmask_0_6),
    .io_releaseViolationMmask_0_7(paddrModule_io_releaseViolationMmask_0_7),
    .io_releaseViolationMmask_0_8(paddrModule_io_releaseViolationMmask_0_8),
    .io_releaseViolationMmask_0_9(paddrModule_io_releaseViolationMmask_0_9),
    .io_releaseViolationMmask_0_10(paddrModule_io_releaseViolationMmask_0_10),
    .io_releaseViolationMmask_0_11(paddrModule_io_releaseViolationMmask_0_11),
    .io_releaseViolationMmask_1_0(paddrModule_io_releaseViolationMmask_1_0),
    .io_releaseViolationMmask_1_1(paddrModule_io_releaseViolationMmask_1_1),
    .io_releaseViolationMmask_1_2(paddrModule_io_releaseViolationMmask_1_2),
    .io_releaseViolationMmask_1_3(paddrModule_io_releaseViolationMmask_1_3),
    .io_releaseViolationMmask_1_4(paddrModule_io_releaseViolationMmask_1_4),
    .io_releaseViolationMmask_1_5(paddrModule_io_releaseViolationMmask_1_5),
    .io_releaseViolationMmask_1_6(paddrModule_io_releaseViolationMmask_1_6),
    .io_releaseViolationMmask_1_7(paddrModule_io_releaseViolationMmask_1_7),
    .io_releaseViolationMmask_1_8(paddrModule_io_releaseViolationMmask_1_8),
    .io_releaseViolationMmask_1_9(paddrModule_io_releaseViolationMmask_1_9),
    .io_releaseViolationMmask_1_10(paddrModule_io_releaseViolationMmask_1_10),
    .io_releaseViolationMmask_1_11(paddrModule_io_releaseViolationMmask_1_11)
  );
  assign io_query_0_resp_valid = io_query_0_resp_valid_REG; // @[LoadQueueRAR.scala 128:22]
  assign io_query_0_resp_bits_index = io_query_0_resp_bits_index_REG; // @[LoadQueueRAR.scala 142:27]
  assign io_query_0_resp_bits_canAccept = io_query_0_resp_bits_canAccept_REG; // @[LoadQueueRAR.scala 129:31]
  assign io_query_0_resp_bits_allocated = io_query_0_resp_bits_allocated_REG; // @[LoadQueueRAR.scala 130:31]
  assign io_query_0_resp_bits_replayFromFetch = |ldLdViolationMask_0 | io_query_0_resp_bits_replayFromFetch_REG; // @[LoadQueueRAR.scala 141:62]
  assign io_query_1_resp_valid = io_query_1_resp_valid_REG; // @[LoadQueueRAR.scala 128:22]
  assign io_query_1_resp_bits_index = io_query_1_resp_bits_index_REG; // @[LoadQueueRAR.scala 142:27]
  assign io_query_1_resp_bits_canAccept = io_query_1_resp_bits_canAccept_REG; // @[LoadQueueRAR.scala 129:31]
  assign io_query_1_resp_bits_allocated = io_query_1_resp_bits_allocated_REG; // @[LoadQueueRAR.scala 130:31]
  assign io_query_1_resp_bits_replayFromFetch = |ldLdViolationMask_1 | io_query_1_resp_bits_replayFromFetch_REG; // @[LoadQueueRAR.scala 141:62]
  assign io_perf_0_value = {{4'd0}, io_perf_0_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_1_value = {{5'd0}, io_perf_1_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_2_value = {{4'd0}, io_perf_2_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign paddrModule_clock = clock;
  assign paddrModule_io_wen_0 = needEnqueue_0 & canAcceptVec_0; // @[LoadQueueRAR.scala 91:26]
  assign paddrModule_io_wen_1 = needEnqueue_1 & canAcceptVec_1; // @[LoadQueueRAR.scala 91:26]
  assign paddrModule_io_waddr_0 = {_enqIdx_T,_enqIdx_T_8}; // @[Cat.scala 31:58]
  assign paddrModule_io_waddr_1 = {_enqIdx_T_9,_enqIdx_T_17}; // @[Cat.scala 31:58]
  assign paddrModule_io_wdata_0 = io_query_0_req_bits_paddr; // @[LoadQueueRAR.scala 101:31 91:46]
  assign paddrModule_io_wdata_1 = io_query_1_req_bits_paddr; // @[LoadQueueRAR.scala 101:31 91:46]
  assign paddrModule_io_releaseMdata_1 = io_release_bits_paddr; // @[LoadQueueRAR.scala 163:30 164:49]
  assign paddrModule_io_releaseViolationMdata_0 = io_query_0_req_bits_paddr; // @[LoadQueueRAR.scala 126:45]
  assign paddrModule_io_releaseViolationMdata_1 = io_query_1_req_bits_paddr; // @[LoadQueueRAR.scala 126:45]
  always @(posedge clock) begin
    if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      if (4'h0 == enqIdx_1) begin // @[LoadQueueRAR.scala 104:19]
        uop_0_robIdx_flag <= io_query_1_req_bits_uop_robIdx_flag; // @[LoadQueueRAR.scala 104:19]
      end else begin
        uop_0_robIdx_flag <= _GEN_2451;
      end
    end else begin
      uop_0_robIdx_flag <= _GEN_2451;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      if (4'h0 == enqIdx_1) begin // @[LoadQueueRAR.scala 104:19]
        uop_0_robIdx_value <= io_query_1_req_bits_uop_robIdx_value; // @[LoadQueueRAR.scala 104:19]
      end else begin
        uop_0_robIdx_value <= _GEN_2463;
      end
    end else begin
      uop_0_robIdx_value <= _GEN_2463;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      if (4'h0 == enqIdx_1) begin // @[LoadQueueRAR.scala 104:19]
        uop_0_lqIdx_flag <= io_query_1_req_bits_uop_lqIdx_flag; // @[LoadQueueRAR.scala 104:19]
      end else begin
        uop_0_lqIdx_flag <= _GEN_2475;
      end
    end else begin
      uop_0_lqIdx_flag <= _GEN_2475;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      if (4'h0 == enqIdx_1) begin // @[LoadQueueRAR.scala 104:19]
        uop_0_lqIdx_value <= io_query_1_req_bits_uop_lqIdx_value; // @[LoadQueueRAR.scala 104:19]
      end else begin
        uop_0_lqIdx_value <= _GEN_2487;
      end
    end else begin
      uop_0_lqIdx_value <= _GEN_2487;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      if (4'h1 == enqIdx_1) begin // @[LoadQueueRAR.scala 104:19]
        uop_1_robIdx_flag <= io_query_1_req_bits_uop_robIdx_flag; // @[LoadQueueRAR.scala 104:19]
      end else begin
        uop_1_robIdx_flag <= _GEN_2452;
      end
    end else begin
      uop_1_robIdx_flag <= _GEN_2452;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      if (4'h1 == enqIdx_1) begin // @[LoadQueueRAR.scala 104:19]
        uop_1_robIdx_value <= io_query_1_req_bits_uop_robIdx_value; // @[LoadQueueRAR.scala 104:19]
      end else begin
        uop_1_robIdx_value <= _GEN_2464;
      end
    end else begin
      uop_1_robIdx_value <= _GEN_2464;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      if (4'h1 == enqIdx_1) begin // @[LoadQueueRAR.scala 104:19]
        uop_1_lqIdx_flag <= io_query_1_req_bits_uop_lqIdx_flag; // @[LoadQueueRAR.scala 104:19]
      end else begin
        uop_1_lqIdx_flag <= _GEN_2476;
      end
    end else begin
      uop_1_lqIdx_flag <= _GEN_2476;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      if (4'h1 == enqIdx_1) begin // @[LoadQueueRAR.scala 104:19]
        uop_1_lqIdx_value <= io_query_1_req_bits_uop_lqIdx_value; // @[LoadQueueRAR.scala 104:19]
      end else begin
        uop_1_lqIdx_value <= _GEN_2488;
      end
    end else begin
      uop_1_lqIdx_value <= _GEN_2488;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      if (4'h2 == enqIdx_1) begin // @[LoadQueueRAR.scala 104:19]
        uop_2_robIdx_flag <= io_query_1_req_bits_uop_robIdx_flag; // @[LoadQueueRAR.scala 104:19]
      end else begin
        uop_2_robIdx_flag <= _GEN_2453;
      end
    end else begin
      uop_2_robIdx_flag <= _GEN_2453;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      if (4'h2 == enqIdx_1) begin // @[LoadQueueRAR.scala 104:19]
        uop_2_robIdx_value <= io_query_1_req_bits_uop_robIdx_value; // @[LoadQueueRAR.scala 104:19]
      end else begin
        uop_2_robIdx_value <= _GEN_2465;
      end
    end else begin
      uop_2_robIdx_value <= _GEN_2465;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      if (4'h2 == enqIdx_1) begin // @[LoadQueueRAR.scala 104:19]
        uop_2_lqIdx_flag <= io_query_1_req_bits_uop_lqIdx_flag; // @[LoadQueueRAR.scala 104:19]
      end else begin
        uop_2_lqIdx_flag <= _GEN_2477;
      end
    end else begin
      uop_2_lqIdx_flag <= _GEN_2477;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      if (4'h2 == enqIdx_1) begin // @[LoadQueueRAR.scala 104:19]
        uop_2_lqIdx_value <= io_query_1_req_bits_uop_lqIdx_value; // @[LoadQueueRAR.scala 104:19]
      end else begin
        uop_2_lqIdx_value <= _GEN_2489;
      end
    end else begin
      uop_2_lqIdx_value <= _GEN_2489;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      if (4'h3 == enqIdx_1) begin // @[LoadQueueRAR.scala 104:19]
        uop_3_robIdx_flag <= io_query_1_req_bits_uop_robIdx_flag; // @[LoadQueueRAR.scala 104:19]
      end else begin
        uop_3_robIdx_flag <= _GEN_2454;
      end
    end else begin
      uop_3_robIdx_flag <= _GEN_2454;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      if (4'h3 == enqIdx_1) begin // @[LoadQueueRAR.scala 104:19]
        uop_3_robIdx_value <= io_query_1_req_bits_uop_robIdx_value; // @[LoadQueueRAR.scala 104:19]
      end else begin
        uop_3_robIdx_value <= _GEN_2466;
      end
    end else begin
      uop_3_robIdx_value <= _GEN_2466;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      if (4'h3 == enqIdx_1) begin // @[LoadQueueRAR.scala 104:19]
        uop_3_lqIdx_flag <= io_query_1_req_bits_uop_lqIdx_flag; // @[LoadQueueRAR.scala 104:19]
      end else begin
        uop_3_lqIdx_flag <= _GEN_2478;
      end
    end else begin
      uop_3_lqIdx_flag <= _GEN_2478;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      if (4'h3 == enqIdx_1) begin // @[LoadQueueRAR.scala 104:19]
        uop_3_lqIdx_value <= io_query_1_req_bits_uop_lqIdx_value; // @[LoadQueueRAR.scala 104:19]
      end else begin
        uop_3_lqIdx_value <= _GEN_2490;
      end
    end else begin
      uop_3_lqIdx_value <= _GEN_2490;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      if (4'h4 == enqIdx_1) begin // @[LoadQueueRAR.scala 104:19]
        uop_4_robIdx_flag <= io_query_1_req_bits_uop_robIdx_flag; // @[LoadQueueRAR.scala 104:19]
      end else begin
        uop_4_robIdx_flag <= _GEN_2455;
      end
    end else begin
      uop_4_robIdx_flag <= _GEN_2455;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      if (4'h4 == enqIdx_1) begin // @[LoadQueueRAR.scala 104:19]
        uop_4_robIdx_value <= io_query_1_req_bits_uop_robIdx_value; // @[LoadQueueRAR.scala 104:19]
      end else begin
        uop_4_robIdx_value <= _GEN_2467;
      end
    end else begin
      uop_4_robIdx_value <= _GEN_2467;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      if (4'h4 == enqIdx_1) begin // @[LoadQueueRAR.scala 104:19]
        uop_4_lqIdx_flag <= io_query_1_req_bits_uop_lqIdx_flag; // @[LoadQueueRAR.scala 104:19]
      end else begin
        uop_4_lqIdx_flag <= _GEN_2479;
      end
    end else begin
      uop_4_lqIdx_flag <= _GEN_2479;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      if (4'h4 == enqIdx_1) begin // @[LoadQueueRAR.scala 104:19]
        uop_4_lqIdx_value <= io_query_1_req_bits_uop_lqIdx_value; // @[LoadQueueRAR.scala 104:19]
      end else begin
        uop_4_lqIdx_value <= _GEN_2491;
      end
    end else begin
      uop_4_lqIdx_value <= _GEN_2491;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      if (4'h5 == enqIdx_1) begin // @[LoadQueueRAR.scala 104:19]
        uop_5_robIdx_flag <= io_query_1_req_bits_uop_robIdx_flag; // @[LoadQueueRAR.scala 104:19]
      end else begin
        uop_5_robIdx_flag <= _GEN_2456;
      end
    end else begin
      uop_5_robIdx_flag <= _GEN_2456;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      if (4'h5 == enqIdx_1) begin // @[LoadQueueRAR.scala 104:19]
        uop_5_robIdx_value <= io_query_1_req_bits_uop_robIdx_value; // @[LoadQueueRAR.scala 104:19]
      end else begin
        uop_5_robIdx_value <= _GEN_2468;
      end
    end else begin
      uop_5_robIdx_value <= _GEN_2468;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      if (4'h5 == enqIdx_1) begin // @[LoadQueueRAR.scala 104:19]
        uop_5_lqIdx_flag <= io_query_1_req_bits_uop_lqIdx_flag; // @[LoadQueueRAR.scala 104:19]
      end else begin
        uop_5_lqIdx_flag <= _GEN_2480;
      end
    end else begin
      uop_5_lqIdx_flag <= _GEN_2480;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      if (4'h5 == enqIdx_1) begin // @[LoadQueueRAR.scala 104:19]
        uop_5_lqIdx_value <= io_query_1_req_bits_uop_lqIdx_value; // @[LoadQueueRAR.scala 104:19]
      end else begin
        uop_5_lqIdx_value <= _GEN_2492;
      end
    end else begin
      uop_5_lqIdx_value <= _GEN_2492;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      if (4'h6 == enqIdx_1) begin // @[LoadQueueRAR.scala 104:19]
        uop_6_robIdx_flag <= io_query_1_req_bits_uop_robIdx_flag; // @[LoadQueueRAR.scala 104:19]
      end else begin
        uop_6_robIdx_flag <= _GEN_2457;
      end
    end else begin
      uop_6_robIdx_flag <= _GEN_2457;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      if (4'h6 == enqIdx_1) begin // @[LoadQueueRAR.scala 104:19]
        uop_6_robIdx_value <= io_query_1_req_bits_uop_robIdx_value; // @[LoadQueueRAR.scala 104:19]
      end else begin
        uop_6_robIdx_value <= _GEN_2469;
      end
    end else begin
      uop_6_robIdx_value <= _GEN_2469;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      if (4'h6 == enqIdx_1) begin // @[LoadQueueRAR.scala 104:19]
        uop_6_lqIdx_flag <= io_query_1_req_bits_uop_lqIdx_flag; // @[LoadQueueRAR.scala 104:19]
      end else begin
        uop_6_lqIdx_flag <= _GEN_2481;
      end
    end else begin
      uop_6_lqIdx_flag <= _GEN_2481;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      if (4'h6 == enqIdx_1) begin // @[LoadQueueRAR.scala 104:19]
        uop_6_lqIdx_value <= io_query_1_req_bits_uop_lqIdx_value; // @[LoadQueueRAR.scala 104:19]
      end else begin
        uop_6_lqIdx_value <= _GEN_2493;
      end
    end else begin
      uop_6_lqIdx_value <= _GEN_2493;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      if (4'h7 == enqIdx_1) begin // @[LoadQueueRAR.scala 104:19]
        uop_7_robIdx_flag <= io_query_1_req_bits_uop_robIdx_flag; // @[LoadQueueRAR.scala 104:19]
      end else begin
        uop_7_robIdx_flag <= _GEN_2458;
      end
    end else begin
      uop_7_robIdx_flag <= _GEN_2458;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      if (4'h7 == enqIdx_1) begin // @[LoadQueueRAR.scala 104:19]
        uop_7_robIdx_value <= io_query_1_req_bits_uop_robIdx_value; // @[LoadQueueRAR.scala 104:19]
      end else begin
        uop_7_robIdx_value <= _GEN_2470;
      end
    end else begin
      uop_7_robIdx_value <= _GEN_2470;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      if (4'h7 == enqIdx_1) begin // @[LoadQueueRAR.scala 104:19]
        uop_7_lqIdx_flag <= io_query_1_req_bits_uop_lqIdx_flag; // @[LoadQueueRAR.scala 104:19]
      end else begin
        uop_7_lqIdx_flag <= _GEN_2482;
      end
    end else begin
      uop_7_lqIdx_flag <= _GEN_2482;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      if (4'h7 == enqIdx_1) begin // @[LoadQueueRAR.scala 104:19]
        uop_7_lqIdx_value <= io_query_1_req_bits_uop_lqIdx_value; // @[LoadQueueRAR.scala 104:19]
      end else begin
        uop_7_lqIdx_value <= _GEN_2494;
      end
    end else begin
      uop_7_lqIdx_value <= _GEN_2494;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      if (4'h8 == enqIdx_1) begin // @[LoadQueueRAR.scala 104:19]
        uop_8_robIdx_flag <= io_query_1_req_bits_uop_robIdx_flag; // @[LoadQueueRAR.scala 104:19]
      end else begin
        uop_8_robIdx_flag <= _GEN_2459;
      end
    end else begin
      uop_8_robIdx_flag <= _GEN_2459;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      if (4'h8 == enqIdx_1) begin // @[LoadQueueRAR.scala 104:19]
        uop_8_robIdx_value <= io_query_1_req_bits_uop_robIdx_value; // @[LoadQueueRAR.scala 104:19]
      end else begin
        uop_8_robIdx_value <= _GEN_2471;
      end
    end else begin
      uop_8_robIdx_value <= _GEN_2471;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      if (4'h8 == enqIdx_1) begin // @[LoadQueueRAR.scala 104:19]
        uop_8_lqIdx_flag <= io_query_1_req_bits_uop_lqIdx_flag; // @[LoadQueueRAR.scala 104:19]
      end else begin
        uop_8_lqIdx_flag <= _GEN_2483;
      end
    end else begin
      uop_8_lqIdx_flag <= _GEN_2483;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      if (4'h8 == enqIdx_1) begin // @[LoadQueueRAR.scala 104:19]
        uop_8_lqIdx_value <= io_query_1_req_bits_uop_lqIdx_value; // @[LoadQueueRAR.scala 104:19]
      end else begin
        uop_8_lqIdx_value <= _GEN_2495;
      end
    end else begin
      uop_8_lqIdx_value <= _GEN_2495;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      if (4'h9 == enqIdx_1) begin // @[LoadQueueRAR.scala 104:19]
        uop_9_robIdx_flag <= io_query_1_req_bits_uop_robIdx_flag; // @[LoadQueueRAR.scala 104:19]
      end else begin
        uop_9_robIdx_flag <= _GEN_2460;
      end
    end else begin
      uop_9_robIdx_flag <= _GEN_2460;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      if (4'h9 == enqIdx_1) begin // @[LoadQueueRAR.scala 104:19]
        uop_9_robIdx_value <= io_query_1_req_bits_uop_robIdx_value; // @[LoadQueueRAR.scala 104:19]
      end else begin
        uop_9_robIdx_value <= _GEN_2472;
      end
    end else begin
      uop_9_robIdx_value <= _GEN_2472;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      if (4'h9 == enqIdx_1) begin // @[LoadQueueRAR.scala 104:19]
        uop_9_lqIdx_flag <= io_query_1_req_bits_uop_lqIdx_flag; // @[LoadQueueRAR.scala 104:19]
      end else begin
        uop_9_lqIdx_flag <= _GEN_2484;
      end
    end else begin
      uop_9_lqIdx_flag <= _GEN_2484;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      if (4'h9 == enqIdx_1) begin // @[LoadQueueRAR.scala 104:19]
        uop_9_lqIdx_value <= io_query_1_req_bits_uop_lqIdx_value; // @[LoadQueueRAR.scala 104:19]
      end else begin
        uop_9_lqIdx_value <= _GEN_2496;
      end
    end else begin
      uop_9_lqIdx_value <= _GEN_2496;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      if (4'ha == enqIdx_1) begin // @[LoadQueueRAR.scala 104:19]
        uop_10_robIdx_flag <= io_query_1_req_bits_uop_robIdx_flag; // @[LoadQueueRAR.scala 104:19]
      end else begin
        uop_10_robIdx_flag <= _GEN_2461;
      end
    end else begin
      uop_10_robIdx_flag <= _GEN_2461;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      if (4'ha == enqIdx_1) begin // @[LoadQueueRAR.scala 104:19]
        uop_10_robIdx_value <= io_query_1_req_bits_uop_robIdx_value; // @[LoadQueueRAR.scala 104:19]
      end else begin
        uop_10_robIdx_value <= _GEN_2473;
      end
    end else begin
      uop_10_robIdx_value <= _GEN_2473;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      if (4'ha == enqIdx_1) begin // @[LoadQueueRAR.scala 104:19]
        uop_10_lqIdx_flag <= io_query_1_req_bits_uop_lqIdx_flag; // @[LoadQueueRAR.scala 104:19]
      end else begin
        uop_10_lqIdx_flag <= _GEN_2485;
      end
    end else begin
      uop_10_lqIdx_flag <= _GEN_2485;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      if (4'ha == enqIdx_1) begin // @[LoadQueueRAR.scala 104:19]
        uop_10_lqIdx_value <= io_query_1_req_bits_uop_lqIdx_value; // @[LoadQueueRAR.scala 104:19]
      end else begin
        uop_10_lqIdx_value <= _GEN_2497;
      end
    end else begin
      uop_10_lqIdx_value <= _GEN_2497;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      if (4'hb == enqIdx_1) begin // @[LoadQueueRAR.scala 104:19]
        uop_11_robIdx_flag <= io_query_1_req_bits_uop_robIdx_flag; // @[LoadQueueRAR.scala 104:19]
      end else begin
        uop_11_robIdx_flag <= _GEN_2462;
      end
    end else begin
      uop_11_robIdx_flag <= _GEN_2462;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      if (4'hb == enqIdx_1) begin // @[LoadQueueRAR.scala 104:19]
        uop_11_robIdx_value <= io_query_1_req_bits_uop_robIdx_value; // @[LoadQueueRAR.scala 104:19]
      end else begin
        uop_11_robIdx_value <= _GEN_2474;
      end
    end else begin
      uop_11_robIdx_value <= _GEN_2474;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      if (4'hb == enqIdx_1) begin // @[LoadQueueRAR.scala 104:19]
        uop_11_lqIdx_flag <= io_query_1_req_bits_uop_lqIdx_flag; // @[LoadQueueRAR.scala 104:19]
      end else begin
        uop_11_lqIdx_flag <= _GEN_2486;
      end
    end else begin
      uop_11_lqIdx_flag <= _GEN_2486;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      if (4'hb == enqIdx_1) begin // @[LoadQueueRAR.scala 104:19]
        uop_11_lqIdx_value <= io_query_1_req_bits_uop_lqIdx_value; // @[LoadQueueRAR.scala 104:19]
      end else begin
        uop_11_lqIdx_value <= _GEN_2498;
      end
    end else begin
      uop_11_lqIdx_value <= _GEN_2498;
    end
    release2Cycle_valid <= io_release_valid; // @[LoadQueueRAR.scala 74:30]
    release2Cycle_bits_paddr <= io_release_bits_paddr; // @[LoadQueueRAR.scala 74:30]
    allocatedUInt <= {enqIdxOH_hi,enqIdxOH_lo}; // @[LoadQueueRAR.scala 123:41]
    io_query_0_resp_valid_REG <= io_query_0_req_valid; // @[LoadQueueRAR.scala 128:32]
    if (needEnqueue_0) begin // @[LoadQueueRAR.scala 129:45]
      io_query_0_resp_bits_canAccept_REG <= canEnqVec_0;
    end else begin
      io_query_0_resp_bits_canAccept_REG <= 1'h1;
    end
    io_query_0_resp_bits_allocated_REG <= needEnqueue_0 & canAcceptVec_0; // @[LoadQueueRAR.scala 91:26]
    matchMask_REG <= {matchMask_hi,matchMask_lo}; // @[LoadQueueRAR.scala 135:69]
    matchMask_REG_1 <= {matchMask_hi_1,matchMask_lo_1}; // @[LoadQueueRAR.scala 136:42]
    ldLdViolationMask_REG <= _ldLdViolationMask_T & _ldLdViolationMask_T_3; // @[LoadQueueRAR.scala 138:74]
    io_query_0_resp_bits_replayFromFetch_REG <= _released_T_7 | _released_T_3; // @[LoadQueueRAR.scala 146:168]
    if (io_query_0_req_bits_allocated) begin // @[LoadQueueRAR.scala 142:41]
      io_query_0_resp_bits_index_REG <= io_query_0_req_bits_index;
    end else begin
      io_query_0_resp_bits_index_REG <= enqIdx;
    end
    io_query_1_resp_valid_REG <= io_query_1_req_valid; // @[LoadQueueRAR.scala 128:32]
    if (needEnqueue_1) begin // @[LoadQueueRAR.scala 129:45]
      io_query_1_resp_bits_canAccept_REG <= canEnqVec_1;
    end else begin
      io_query_1_resp_bits_canAccept_REG <= 1'h1;
    end
    io_query_1_resp_bits_allocated_REG <= needEnqueue_1 & canAcceptVec_1; // @[LoadQueueRAR.scala 91:26]
    matchMask_REG_2 <= {matchMask_hi_2,matchMask_lo_2}; // @[LoadQueueRAR.scala 135:69]
    matchMask_REG_3 <= {matchMask_hi_3,matchMask_lo_3}; // @[LoadQueueRAR.scala 136:42]
    ldLdViolationMask_REG_1 <= _ldLdViolationMask_T & _ldLdViolationMask_T_3; // @[LoadQueueRAR.scala 138:74]
    io_query_1_resp_bits_replayFromFetch_REG <= _released_T_16 | _released_T_12; // @[LoadQueueRAR.scala 146:168]
    if (io_query_1_req_bits_allocated) begin // @[LoadQueueRAR.scala 142:41]
      io_query_1_resp_bits_index_REG <= io_query_1_req_bits_index;
    end else begin
      io_query_1_resp_bits_index_REG <= enqIdx_1;
    end
    REG <= paddrModule_io_releaseMmask_1_0 & allocated_0 & io_release_valid; // @[LoadQueueRAR.scala 168:82]
    REG_1 <= paddrModule_io_releaseMmask_1_1 & allocated_1 & io_release_valid; // @[LoadQueueRAR.scala 168:82]
    REG_2 <= paddrModule_io_releaseMmask_1_2 & allocated_2 & io_release_valid; // @[LoadQueueRAR.scala 168:82]
    REG_3 <= paddrModule_io_releaseMmask_1_3 & allocated_3 & io_release_valid; // @[LoadQueueRAR.scala 168:82]
    REG_4 <= paddrModule_io_releaseMmask_1_4 & allocated_4 & io_release_valid; // @[LoadQueueRAR.scala 168:82]
    REG_5 <= paddrModule_io_releaseMmask_1_5 & allocated_5 & io_release_valid; // @[LoadQueueRAR.scala 168:82]
    REG_6 <= paddrModule_io_releaseMmask_1_6 & allocated_6 & io_release_valid; // @[LoadQueueRAR.scala 168:82]
    REG_7 <= paddrModule_io_releaseMmask_1_7 & allocated_7 & io_release_valid; // @[LoadQueueRAR.scala 168:82]
    REG_8 <= paddrModule_io_releaseMmask_1_8 & allocated_8 & io_release_valid; // @[LoadQueueRAR.scala 168:82]
    REG_9 <= paddrModule_io_releaseMmask_1_9 & allocated_9 & io_release_valid; // @[LoadQueueRAR.scala 168:82]
    REG_10 <= paddrModule_io_releaseMmask_1_10 & allocated_10 & io_release_valid; // @[LoadQueueRAR.scala 168:82]
    REG_11 <= paddrModule_io_releaseMmask_1_11 & allocated_11 & io_release_valid; // @[LoadQueueRAR.scala 168:82]
    io_perf_0_value_REG <= canEnqVec_0 + canEnqVec_1; // @[Bitwise.scala 48:55]
    io_perf_0_value_REG_1 <= io_perf_0_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_1_value_REG <= freeNums == 4'h0; // @[LoadQueueRAR.scala 177:23]
    io_perf_1_value_REG_1 <= io_perf_1_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_2_value_REG <= _ldLdViolationCount_T + _ldLdViolationCount_T_1; // @[Bitwise.scala 48:55]
    io_perf_2_value_REG_1 <= io_perf_2_value_REG; // @[PerfCounterUtils.scala 188:27]
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAR.scala 155:55]
      allocated_0 <= 1'h0; // @[LoadQueueRAR.scala 156:20]
    end else if (allocated_0 & (deqNotBlock | needFlush)) begin // @[LoadQueueRAR.scala 91:46]
      allocated_0 <= 1'h0;
    end else if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      allocated_0 <= _GEN_2763;
    end else if (canEnqVec_0) begin // @[LoadQueueRAR.scala 54:26]
      allocated_0 <= _GEN_0;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAR.scala 155:55]
      allocated_1 <= 1'h0; // @[LoadQueueRAR.scala 156:20]
    end else if (allocated_1 & (deqNotBlock_1 | needFlush_1)) begin // @[LoadQueueRAR.scala 91:46]
      allocated_1 <= 1'h0;
    end else if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      allocated_1 <= _GEN_2764;
    end else if (canEnqVec_0) begin // @[LoadQueueRAR.scala 54:26]
      allocated_1 <= _GEN_1;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAR.scala 155:55]
      allocated_2 <= 1'h0; // @[LoadQueueRAR.scala 156:20]
    end else if (allocated_2 & (deqNotBlock_2 | needFlush_2)) begin // @[LoadQueueRAR.scala 91:46]
      allocated_2 <= 1'h0;
    end else if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      allocated_2 <= _GEN_2765;
    end else if (canEnqVec_0) begin // @[LoadQueueRAR.scala 54:26]
      allocated_2 <= _GEN_2;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAR.scala 155:55]
      allocated_3 <= 1'h0; // @[LoadQueueRAR.scala 156:20]
    end else if (allocated_3 & (deqNotBlock_3 | needFlush_3)) begin // @[LoadQueueRAR.scala 91:46]
      allocated_3 <= 1'h0;
    end else if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      allocated_3 <= _GEN_2766;
    end else if (canEnqVec_0) begin // @[LoadQueueRAR.scala 54:26]
      allocated_3 <= _GEN_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAR.scala 155:55]
      allocated_4 <= 1'h0; // @[LoadQueueRAR.scala 156:20]
    end else if (allocated_4 & (deqNotBlock_4 | needFlush_4)) begin // @[LoadQueueRAR.scala 91:46]
      allocated_4 <= 1'h0;
    end else if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      allocated_4 <= _GEN_2767;
    end else if (canEnqVec_0) begin // @[LoadQueueRAR.scala 54:26]
      allocated_4 <= _GEN_4;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAR.scala 155:55]
      allocated_5 <= 1'h0; // @[LoadQueueRAR.scala 156:20]
    end else if (allocated_5 & (deqNotBlock_5 | needFlush_5)) begin // @[LoadQueueRAR.scala 91:46]
      allocated_5 <= 1'h0;
    end else if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      allocated_5 <= _GEN_2768;
    end else if (canEnqVec_0) begin // @[LoadQueueRAR.scala 54:26]
      allocated_5 <= _GEN_5;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAR.scala 155:55]
      allocated_6 <= 1'h0; // @[LoadQueueRAR.scala 156:20]
    end else if (allocated_6 & (deqNotBlock_6 | needFlush_6)) begin // @[LoadQueueRAR.scala 91:46]
      allocated_6 <= 1'h0;
    end else if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      allocated_6 <= _GEN_2769;
    end else if (canEnqVec_0) begin // @[LoadQueueRAR.scala 54:26]
      allocated_6 <= _GEN_6;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAR.scala 155:55]
      allocated_7 <= 1'h0; // @[LoadQueueRAR.scala 156:20]
    end else if (allocated_7 & (deqNotBlock_7 | needFlush_7)) begin // @[LoadQueueRAR.scala 91:46]
      allocated_7 <= 1'h0;
    end else if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      allocated_7 <= _GEN_2770;
    end else if (canEnqVec_0) begin // @[LoadQueueRAR.scala 54:26]
      allocated_7 <= _GEN_7;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAR.scala 155:55]
      allocated_8 <= 1'h0; // @[LoadQueueRAR.scala 156:20]
    end else if (allocated_8 & (deqNotBlock_8 | needFlush_8)) begin // @[LoadQueueRAR.scala 91:46]
      allocated_8 <= 1'h0;
    end else if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      allocated_8 <= _GEN_2771;
    end else if (canEnqVec_0) begin // @[LoadQueueRAR.scala 54:26]
      allocated_8 <= _GEN_8;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAR.scala 155:55]
      allocated_9 <= 1'h0; // @[LoadQueueRAR.scala 156:20]
    end else if (allocated_9 & (deqNotBlock_9 | needFlush_9)) begin // @[LoadQueueRAR.scala 91:46]
      allocated_9 <= 1'h0;
    end else if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      allocated_9 <= _GEN_2772;
    end else if (canEnqVec_0) begin // @[LoadQueueRAR.scala 54:26]
      allocated_9 <= _GEN_9;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAR.scala 155:55]
      allocated_10 <= 1'h0; // @[LoadQueueRAR.scala 156:20]
    end else if (allocated_10 & (deqNotBlock_10 | needFlush_10)) begin // @[LoadQueueRAR.scala 91:46]
      allocated_10 <= 1'h0;
    end else if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      allocated_10 <= _GEN_2773;
    end else if (canEnqVec_0) begin // @[LoadQueueRAR.scala 54:26]
      allocated_10 <= _GEN_10;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAR.scala 155:55]
      allocated_11 <= 1'h0; // @[LoadQueueRAR.scala 156:20]
    end else if (allocated_11 & (deqNotBlock_11 | needFlush_11)) begin // @[LoadQueueRAR.scala 91:46]
      allocated_11 <= 1'h0;
    end else if (canEnqVec_1) begin // @[LoadQueueRAR.scala 91:46]
      allocated_11 <= _GEN_2774;
    end else if (canEnqVec_0) begin // @[LoadQueueRAR.scala 54:26]
      allocated_11 <= _GEN_11;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAR.scala 168:107]
      released_0 <= 1'h0; // @[LoadQueueRAR.scala 171:19]
    end else begin
      released_0 <= REG | _GEN_5418;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAR.scala 168:107]
      released_1 <= 1'h0; // @[LoadQueueRAR.scala 171:19]
    end else begin
      released_1 <= REG_1 | _GEN_5419;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAR.scala 168:107]
      released_2 <= 1'h0; // @[LoadQueueRAR.scala 171:19]
    end else begin
      released_2 <= REG_2 | _GEN_5420;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAR.scala 168:107]
      released_3 <= 1'h0; // @[LoadQueueRAR.scala 171:19]
    end else begin
      released_3 <= REG_3 | _GEN_5421;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAR.scala 168:107]
      released_4 <= 1'h0; // @[LoadQueueRAR.scala 171:19]
    end else begin
      released_4 <= REG_4 | _GEN_5422;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAR.scala 168:107]
      released_5 <= 1'h0; // @[LoadQueueRAR.scala 171:19]
    end else begin
      released_5 <= REG_5 | _GEN_5423;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAR.scala 168:107]
      released_6 <= 1'h0; // @[LoadQueueRAR.scala 171:19]
    end else begin
      released_6 <= REG_6 | _GEN_5424;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAR.scala 168:107]
      released_7 <= 1'h0; // @[LoadQueueRAR.scala 171:19]
    end else begin
      released_7 <= REG_7 | _GEN_5425;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAR.scala 168:107]
      released_8 <= 1'h0; // @[LoadQueueRAR.scala 171:19]
    end else begin
      released_8 <= REG_8 | _GEN_5426;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAR.scala 168:107]
      released_9 <= 1'h0; // @[LoadQueueRAR.scala 171:19]
    end else begin
      released_9 <= REG_9 | _GEN_5427;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAR.scala 168:107]
      released_10 <= 1'h0; // @[LoadQueueRAR.scala 171:19]
    end else begin
      released_10 <= REG_10 | _GEN_5428;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAR.scala 168:107]
      released_11 <= 1'h0; // @[LoadQueueRAR.scala 171:19]
    end else begin
      released_11 <= REG_11 | _GEN_5429;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAR.scala 114:98]
      datavalid_0 <= 1'h0; // @[LoadQueueRAR.scala 115:{33,33}]
    end else if (io_query_1_req_valid & io_query_1_req_bits_allocated & _T_18) begin
      if (4'h0 == io_query_1_req_bits_index) begin
        datavalid_0 <= io_query_1_req_bits_datavalid;
      end else begin
        datavalid_0 <= _GEN_5430;
      end
    end else begin
      datavalid_0 <= _GEN_5430;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAR.scala 114:98]
      datavalid_1 <= 1'h0; // @[LoadQueueRAR.scala 115:{33,33}]
    end else if (io_query_1_req_valid & io_query_1_req_bits_allocated & _T_18) begin
      if (4'h1 == io_query_1_req_bits_index) begin
        datavalid_1 <= io_query_1_req_bits_datavalid;
      end else begin
        datavalid_1 <= _GEN_5431;
      end
    end else begin
      datavalid_1 <= _GEN_5431;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAR.scala 114:98]
      datavalid_2 <= 1'h0; // @[LoadQueueRAR.scala 115:{33,33}]
    end else if (io_query_1_req_valid & io_query_1_req_bits_allocated & _T_18) begin
      if (4'h2 == io_query_1_req_bits_index) begin
        datavalid_2 <= io_query_1_req_bits_datavalid;
      end else begin
        datavalid_2 <= _GEN_5432;
      end
    end else begin
      datavalid_2 <= _GEN_5432;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAR.scala 114:98]
      datavalid_3 <= 1'h0; // @[LoadQueueRAR.scala 115:{33,33}]
    end else if (io_query_1_req_valid & io_query_1_req_bits_allocated & _T_18) begin
      if (4'h3 == io_query_1_req_bits_index) begin
        datavalid_3 <= io_query_1_req_bits_datavalid;
      end else begin
        datavalid_3 <= _GEN_5433;
      end
    end else begin
      datavalid_3 <= _GEN_5433;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAR.scala 114:98]
      datavalid_4 <= 1'h0; // @[LoadQueueRAR.scala 115:{33,33}]
    end else if (io_query_1_req_valid & io_query_1_req_bits_allocated & _T_18) begin
      if (4'h4 == io_query_1_req_bits_index) begin
        datavalid_4 <= io_query_1_req_bits_datavalid;
      end else begin
        datavalid_4 <= _GEN_5434;
      end
    end else begin
      datavalid_4 <= _GEN_5434;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAR.scala 114:98]
      datavalid_5 <= 1'h0; // @[LoadQueueRAR.scala 115:{33,33}]
    end else if (io_query_1_req_valid & io_query_1_req_bits_allocated & _T_18) begin
      if (4'h5 == io_query_1_req_bits_index) begin
        datavalid_5 <= io_query_1_req_bits_datavalid;
      end else begin
        datavalid_5 <= _GEN_5435;
      end
    end else begin
      datavalid_5 <= _GEN_5435;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAR.scala 114:98]
      datavalid_6 <= 1'h0; // @[LoadQueueRAR.scala 115:{33,33}]
    end else if (io_query_1_req_valid & io_query_1_req_bits_allocated & _T_18) begin
      if (4'h6 == io_query_1_req_bits_index) begin
        datavalid_6 <= io_query_1_req_bits_datavalid;
      end else begin
        datavalid_6 <= _GEN_5436;
      end
    end else begin
      datavalid_6 <= _GEN_5436;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAR.scala 114:98]
      datavalid_7 <= 1'h0; // @[LoadQueueRAR.scala 115:{33,33}]
    end else if (io_query_1_req_valid & io_query_1_req_bits_allocated & _T_18) begin
      if (4'h7 == io_query_1_req_bits_index) begin
        datavalid_7 <= io_query_1_req_bits_datavalid;
      end else begin
        datavalid_7 <= _GEN_5437;
      end
    end else begin
      datavalid_7 <= _GEN_5437;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAR.scala 114:98]
      datavalid_8 <= 1'h0; // @[LoadQueueRAR.scala 115:{33,33}]
    end else if (io_query_1_req_valid & io_query_1_req_bits_allocated & _T_18) begin
      if (4'h8 == io_query_1_req_bits_index) begin
        datavalid_8 <= io_query_1_req_bits_datavalid;
      end else begin
        datavalid_8 <= _GEN_5438;
      end
    end else begin
      datavalid_8 <= _GEN_5438;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAR.scala 114:98]
      datavalid_9 <= 1'h0; // @[LoadQueueRAR.scala 115:{33,33}]
    end else if (io_query_1_req_valid & io_query_1_req_bits_allocated & _T_18) begin
      if (4'h9 == io_query_1_req_bits_index) begin
        datavalid_9 <= io_query_1_req_bits_datavalid;
      end else begin
        datavalid_9 <= _GEN_5439;
      end
    end else begin
      datavalid_9 <= _GEN_5439;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAR.scala 114:98]
      datavalid_10 <= 1'h0; // @[LoadQueueRAR.scala 115:{33,33}]
    end else if (io_query_1_req_valid & io_query_1_req_bits_allocated & _T_18) begin
      if (4'ha == io_query_1_req_bits_index) begin
        datavalid_10 <= io_query_1_req_bits_datavalid;
      end else begin
        datavalid_10 <= _GEN_5440;
      end
    end else begin
      datavalid_10 <= _GEN_5440;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAR.scala 114:98]
      datavalid_11 <= 1'h0; // @[LoadQueueRAR.scala 115:{33,33}]
    end else if (io_query_1_req_valid & io_query_1_req_bits_allocated & _T_18) begin
      if (4'hb == io_query_1_req_bits_index) begin
        datavalid_11 <= io_query_1_req_bits_datavalid;
      end else begin
        datavalid_11 <= _GEN_5441;
      end
    end else begin
      datavalid_11 <= _GEN_5441;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAR.scala 114:98]
      miss_0 <= 1'h0; // @[LoadQueueRAR.scala 116:{28,28}]
    end else if (io_query_1_req_valid & io_query_1_req_bits_allocated & _T_18) begin
      if (4'h0 == io_query_1_req_bits_index) begin
        miss_0 <= io_query_1_req_bits_miss;
      end else begin
        miss_0 <= _GEN_5442;
      end
    end else begin
      miss_0 <= _GEN_5442;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAR.scala 114:98]
      miss_1 <= 1'h0; // @[LoadQueueRAR.scala 116:{28,28}]
    end else if (io_query_1_req_valid & io_query_1_req_bits_allocated & _T_18) begin
      if (4'h1 == io_query_1_req_bits_index) begin
        miss_1 <= io_query_1_req_bits_miss;
      end else begin
        miss_1 <= _GEN_5443;
      end
    end else begin
      miss_1 <= _GEN_5443;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAR.scala 114:98]
      miss_2 <= 1'h0; // @[LoadQueueRAR.scala 116:{28,28}]
    end else if (io_query_1_req_valid & io_query_1_req_bits_allocated & _T_18) begin
      if (4'h2 == io_query_1_req_bits_index) begin
        miss_2 <= io_query_1_req_bits_miss;
      end else begin
        miss_2 <= _GEN_5444;
      end
    end else begin
      miss_2 <= _GEN_5444;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAR.scala 114:98]
      miss_3 <= 1'h0; // @[LoadQueueRAR.scala 116:{28,28}]
    end else if (io_query_1_req_valid & io_query_1_req_bits_allocated & _T_18) begin
      if (4'h3 == io_query_1_req_bits_index) begin
        miss_3 <= io_query_1_req_bits_miss;
      end else begin
        miss_3 <= _GEN_5445;
      end
    end else begin
      miss_3 <= _GEN_5445;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAR.scala 114:98]
      miss_4 <= 1'h0; // @[LoadQueueRAR.scala 116:{28,28}]
    end else if (io_query_1_req_valid & io_query_1_req_bits_allocated & _T_18) begin
      if (4'h4 == io_query_1_req_bits_index) begin
        miss_4 <= io_query_1_req_bits_miss;
      end else begin
        miss_4 <= _GEN_5446;
      end
    end else begin
      miss_4 <= _GEN_5446;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAR.scala 114:98]
      miss_5 <= 1'h0; // @[LoadQueueRAR.scala 116:{28,28}]
    end else if (io_query_1_req_valid & io_query_1_req_bits_allocated & _T_18) begin
      if (4'h5 == io_query_1_req_bits_index) begin
        miss_5 <= io_query_1_req_bits_miss;
      end else begin
        miss_5 <= _GEN_5447;
      end
    end else begin
      miss_5 <= _GEN_5447;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAR.scala 114:98]
      miss_6 <= 1'h0; // @[LoadQueueRAR.scala 116:{28,28}]
    end else if (io_query_1_req_valid & io_query_1_req_bits_allocated & _T_18) begin
      if (4'h6 == io_query_1_req_bits_index) begin
        miss_6 <= io_query_1_req_bits_miss;
      end else begin
        miss_6 <= _GEN_5448;
      end
    end else begin
      miss_6 <= _GEN_5448;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAR.scala 114:98]
      miss_7 <= 1'h0; // @[LoadQueueRAR.scala 116:{28,28}]
    end else if (io_query_1_req_valid & io_query_1_req_bits_allocated & _T_18) begin
      if (4'h7 == io_query_1_req_bits_index) begin
        miss_7 <= io_query_1_req_bits_miss;
      end else begin
        miss_7 <= _GEN_5449;
      end
    end else begin
      miss_7 <= _GEN_5449;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAR.scala 114:98]
      miss_8 <= 1'h0; // @[LoadQueueRAR.scala 116:{28,28}]
    end else if (io_query_1_req_valid & io_query_1_req_bits_allocated & _T_18) begin
      if (4'h8 == io_query_1_req_bits_index) begin
        miss_8 <= io_query_1_req_bits_miss;
      end else begin
        miss_8 <= _GEN_5450;
      end
    end else begin
      miss_8 <= _GEN_5450;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAR.scala 114:98]
      miss_9 <= 1'h0; // @[LoadQueueRAR.scala 116:{28,28}]
    end else if (io_query_1_req_valid & io_query_1_req_bits_allocated & _T_18) begin
      if (4'h9 == io_query_1_req_bits_index) begin
        miss_9 <= io_query_1_req_bits_miss;
      end else begin
        miss_9 <= _GEN_5451;
      end
    end else begin
      miss_9 <= _GEN_5451;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAR.scala 114:98]
      miss_10 <= 1'h0; // @[LoadQueueRAR.scala 116:{28,28}]
    end else if (io_query_1_req_valid & io_query_1_req_bits_allocated & _T_18) begin
      if (4'ha == io_query_1_req_bits_index) begin
        miss_10 <= io_query_1_req_bits_miss;
      end else begin
        miss_10 <= _GEN_5452;
      end
    end else begin
      miss_10 <= _GEN_5452;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAR.scala 114:98]
      miss_11 <= 1'h0; // @[LoadQueueRAR.scala 116:{28,28}]
    end else if (io_query_1_req_valid & io_query_1_req_bits_allocated & _T_18) begin
      if (4'hb == io_query_1_req_bits_index) begin
        miss_11 <= io_query_1_req_bits_miss;
      end else begin
        miss_11 <= _GEN_5453;
      end
    end else begin
      miss_11 <= _GEN_5453;
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
  _RAND_0 = {1{`RANDOM}};
  allocated_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  allocated_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  allocated_2 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  allocated_3 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  allocated_4 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  allocated_5 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  allocated_6 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  allocated_7 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  allocated_8 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  allocated_9 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  allocated_10 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  allocated_11 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  uop_0_robIdx_flag = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  uop_0_robIdx_value = _RAND_13[4:0];
  _RAND_14 = {1{`RANDOM}};
  uop_0_lqIdx_flag = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  uop_0_lqIdx_value = _RAND_15[3:0];
  _RAND_16 = {1{`RANDOM}};
  uop_1_robIdx_flag = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  uop_1_robIdx_value = _RAND_17[4:0];
  _RAND_18 = {1{`RANDOM}};
  uop_1_lqIdx_flag = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  uop_1_lqIdx_value = _RAND_19[3:0];
  _RAND_20 = {1{`RANDOM}};
  uop_2_robIdx_flag = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  uop_2_robIdx_value = _RAND_21[4:0];
  _RAND_22 = {1{`RANDOM}};
  uop_2_lqIdx_flag = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  uop_2_lqIdx_value = _RAND_23[3:0];
  _RAND_24 = {1{`RANDOM}};
  uop_3_robIdx_flag = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  uop_3_robIdx_value = _RAND_25[4:0];
  _RAND_26 = {1{`RANDOM}};
  uop_3_lqIdx_flag = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  uop_3_lqIdx_value = _RAND_27[3:0];
  _RAND_28 = {1{`RANDOM}};
  uop_4_robIdx_flag = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  uop_4_robIdx_value = _RAND_29[4:0];
  _RAND_30 = {1{`RANDOM}};
  uop_4_lqIdx_flag = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  uop_4_lqIdx_value = _RAND_31[3:0];
  _RAND_32 = {1{`RANDOM}};
  uop_5_robIdx_flag = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  uop_5_robIdx_value = _RAND_33[4:0];
  _RAND_34 = {1{`RANDOM}};
  uop_5_lqIdx_flag = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  uop_5_lqIdx_value = _RAND_35[3:0];
  _RAND_36 = {1{`RANDOM}};
  uop_6_robIdx_flag = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  uop_6_robIdx_value = _RAND_37[4:0];
  _RAND_38 = {1{`RANDOM}};
  uop_6_lqIdx_flag = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  uop_6_lqIdx_value = _RAND_39[3:0];
  _RAND_40 = {1{`RANDOM}};
  uop_7_robIdx_flag = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  uop_7_robIdx_value = _RAND_41[4:0];
  _RAND_42 = {1{`RANDOM}};
  uop_7_lqIdx_flag = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  uop_7_lqIdx_value = _RAND_43[3:0];
  _RAND_44 = {1{`RANDOM}};
  uop_8_robIdx_flag = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  uop_8_robIdx_value = _RAND_45[4:0];
  _RAND_46 = {1{`RANDOM}};
  uop_8_lqIdx_flag = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  uop_8_lqIdx_value = _RAND_47[3:0];
  _RAND_48 = {1{`RANDOM}};
  uop_9_robIdx_flag = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  uop_9_robIdx_value = _RAND_49[4:0];
  _RAND_50 = {1{`RANDOM}};
  uop_9_lqIdx_flag = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  uop_9_lqIdx_value = _RAND_51[3:0];
  _RAND_52 = {1{`RANDOM}};
  uop_10_robIdx_flag = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  uop_10_robIdx_value = _RAND_53[4:0];
  _RAND_54 = {1{`RANDOM}};
  uop_10_lqIdx_flag = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  uop_10_lqIdx_value = _RAND_55[3:0];
  _RAND_56 = {1{`RANDOM}};
  uop_11_robIdx_flag = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  uop_11_robIdx_value = _RAND_57[4:0];
  _RAND_58 = {1{`RANDOM}};
  uop_11_lqIdx_flag = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  uop_11_lqIdx_value = _RAND_59[3:0];
  _RAND_60 = {1{`RANDOM}};
  released_0 = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  released_1 = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  released_2 = _RAND_62[0:0];
  _RAND_63 = {1{`RANDOM}};
  released_3 = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  released_4 = _RAND_64[0:0];
  _RAND_65 = {1{`RANDOM}};
  released_5 = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  released_6 = _RAND_66[0:0];
  _RAND_67 = {1{`RANDOM}};
  released_7 = _RAND_67[0:0];
  _RAND_68 = {1{`RANDOM}};
  released_8 = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  released_9 = _RAND_69[0:0];
  _RAND_70 = {1{`RANDOM}};
  released_10 = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  released_11 = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  datavalid_0 = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  datavalid_1 = _RAND_73[0:0];
  _RAND_74 = {1{`RANDOM}};
  datavalid_2 = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  datavalid_3 = _RAND_75[0:0];
  _RAND_76 = {1{`RANDOM}};
  datavalid_4 = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  datavalid_5 = _RAND_77[0:0];
  _RAND_78 = {1{`RANDOM}};
  datavalid_6 = _RAND_78[0:0];
  _RAND_79 = {1{`RANDOM}};
  datavalid_7 = _RAND_79[0:0];
  _RAND_80 = {1{`RANDOM}};
  datavalid_8 = _RAND_80[0:0];
  _RAND_81 = {1{`RANDOM}};
  datavalid_9 = _RAND_81[0:0];
  _RAND_82 = {1{`RANDOM}};
  datavalid_10 = _RAND_82[0:0];
  _RAND_83 = {1{`RANDOM}};
  datavalid_11 = _RAND_83[0:0];
  _RAND_84 = {1{`RANDOM}};
  miss_0 = _RAND_84[0:0];
  _RAND_85 = {1{`RANDOM}};
  miss_1 = _RAND_85[0:0];
  _RAND_86 = {1{`RANDOM}};
  miss_2 = _RAND_86[0:0];
  _RAND_87 = {1{`RANDOM}};
  miss_3 = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  miss_4 = _RAND_88[0:0];
  _RAND_89 = {1{`RANDOM}};
  miss_5 = _RAND_89[0:0];
  _RAND_90 = {1{`RANDOM}};
  miss_6 = _RAND_90[0:0];
  _RAND_91 = {1{`RANDOM}};
  miss_7 = _RAND_91[0:0];
  _RAND_92 = {1{`RANDOM}};
  miss_8 = _RAND_92[0:0];
  _RAND_93 = {1{`RANDOM}};
  miss_9 = _RAND_93[0:0];
  _RAND_94 = {1{`RANDOM}};
  miss_10 = _RAND_94[0:0];
  _RAND_95 = {1{`RANDOM}};
  miss_11 = _RAND_95[0:0];
  _RAND_96 = {1{`RANDOM}};
  release2Cycle_valid = _RAND_96[0:0];
  _RAND_97 = {2{`RANDOM}};
  release2Cycle_bits_paddr = _RAND_97[35:0];
  _RAND_98 = {1{`RANDOM}};
  allocatedUInt = _RAND_98[11:0];
  _RAND_99 = {1{`RANDOM}};
  io_query_0_resp_valid_REG = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  io_query_0_resp_bits_canAccept_REG = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  io_query_0_resp_bits_allocated_REG = _RAND_101[0:0];
  _RAND_102 = {1{`RANDOM}};
  matchMask_REG = _RAND_102[11:0];
  _RAND_103 = {1{`RANDOM}};
  matchMask_REG_1 = _RAND_103[11:0];
  _RAND_104 = {1{`RANDOM}};
  ldLdViolationMask_REG = _RAND_104[11:0];
  _RAND_105 = {1{`RANDOM}};
  io_query_0_resp_bits_replayFromFetch_REG = _RAND_105[0:0];
  _RAND_106 = {1{`RANDOM}};
  io_query_0_resp_bits_index_REG = _RAND_106[3:0];
  _RAND_107 = {1{`RANDOM}};
  io_query_1_resp_valid_REG = _RAND_107[0:0];
  _RAND_108 = {1{`RANDOM}};
  io_query_1_resp_bits_canAccept_REG = _RAND_108[0:0];
  _RAND_109 = {1{`RANDOM}};
  io_query_1_resp_bits_allocated_REG = _RAND_109[0:0];
  _RAND_110 = {1{`RANDOM}};
  matchMask_REG_2 = _RAND_110[11:0];
  _RAND_111 = {1{`RANDOM}};
  matchMask_REG_3 = _RAND_111[11:0];
  _RAND_112 = {1{`RANDOM}};
  ldLdViolationMask_REG_1 = _RAND_112[11:0];
  _RAND_113 = {1{`RANDOM}};
  io_query_1_resp_bits_replayFromFetch_REG = _RAND_113[0:0];
  _RAND_114 = {1{`RANDOM}};
  io_query_1_resp_bits_index_REG = _RAND_114[3:0];
  _RAND_115 = {1{`RANDOM}};
  REG = _RAND_115[0:0];
  _RAND_116 = {1{`RANDOM}};
  REG_1 = _RAND_116[0:0];
  _RAND_117 = {1{`RANDOM}};
  REG_2 = _RAND_117[0:0];
  _RAND_118 = {1{`RANDOM}};
  REG_3 = _RAND_118[0:0];
  _RAND_119 = {1{`RANDOM}};
  REG_4 = _RAND_119[0:0];
  _RAND_120 = {1{`RANDOM}};
  REG_5 = _RAND_120[0:0];
  _RAND_121 = {1{`RANDOM}};
  REG_6 = _RAND_121[0:0];
  _RAND_122 = {1{`RANDOM}};
  REG_7 = _RAND_122[0:0];
  _RAND_123 = {1{`RANDOM}};
  REG_8 = _RAND_123[0:0];
  _RAND_124 = {1{`RANDOM}};
  REG_9 = _RAND_124[0:0];
  _RAND_125 = {1{`RANDOM}};
  REG_10 = _RAND_125[0:0];
  _RAND_126 = {1{`RANDOM}};
  REG_11 = _RAND_126[0:0];
  _RAND_127 = {1{`RANDOM}};
  io_perf_0_value_REG = _RAND_127[1:0];
  _RAND_128 = {1{`RANDOM}};
  io_perf_0_value_REG_1 = _RAND_128[1:0];
  _RAND_129 = {1{`RANDOM}};
  io_perf_1_value_REG = _RAND_129[0:0];
  _RAND_130 = {1{`RANDOM}};
  io_perf_1_value_REG_1 = _RAND_130[0:0];
  _RAND_131 = {1{`RANDOM}};
  io_perf_2_value_REG = _RAND_131[1:0];
  _RAND_132 = {1{`RANDOM}};
  io_perf_2_value_REG_1 = _RAND_132[1:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    allocated_0 = 1'h0;
  end
  if (reset) begin
    allocated_1 = 1'h0;
  end
  if (reset) begin
    allocated_2 = 1'h0;
  end
  if (reset) begin
    allocated_3 = 1'h0;
  end
  if (reset) begin
    allocated_4 = 1'h0;
  end
  if (reset) begin
    allocated_5 = 1'h0;
  end
  if (reset) begin
    allocated_6 = 1'h0;
  end
  if (reset) begin
    allocated_7 = 1'h0;
  end
  if (reset) begin
    allocated_8 = 1'h0;
  end
  if (reset) begin
    allocated_9 = 1'h0;
  end
  if (reset) begin
    allocated_10 = 1'h0;
  end
  if (reset) begin
    allocated_11 = 1'h0;
  end
  if (reset) begin
    released_0 = 1'h0;
  end
  if (reset) begin
    released_1 = 1'h0;
  end
  if (reset) begin
    released_2 = 1'h0;
  end
  if (reset) begin
    released_3 = 1'h0;
  end
  if (reset) begin
    released_4 = 1'h0;
  end
  if (reset) begin
    released_5 = 1'h0;
  end
  if (reset) begin
    released_6 = 1'h0;
  end
  if (reset) begin
    released_7 = 1'h0;
  end
  if (reset) begin
    released_8 = 1'h0;
  end
  if (reset) begin
    released_9 = 1'h0;
  end
  if (reset) begin
    released_10 = 1'h0;
  end
  if (reset) begin
    released_11 = 1'h0;
  end
  if (reset) begin
    datavalid_0 = 1'h0;
  end
  if (reset) begin
    datavalid_1 = 1'h0;
  end
  if (reset) begin
    datavalid_2 = 1'h0;
  end
  if (reset) begin
    datavalid_3 = 1'h0;
  end
  if (reset) begin
    datavalid_4 = 1'h0;
  end
  if (reset) begin
    datavalid_5 = 1'h0;
  end
  if (reset) begin
    datavalid_6 = 1'h0;
  end
  if (reset) begin
    datavalid_7 = 1'h0;
  end
  if (reset) begin
    datavalid_8 = 1'h0;
  end
  if (reset) begin
    datavalid_9 = 1'h0;
  end
  if (reset) begin
    datavalid_10 = 1'h0;
  end
  if (reset) begin
    datavalid_11 = 1'h0;
  end
  if (reset) begin
    miss_0 = 1'h0;
  end
  if (reset) begin
    miss_1 = 1'h0;
  end
  if (reset) begin
    miss_2 = 1'h0;
  end
  if (reset) begin
    miss_3 = 1'h0;
  end
  if (reset) begin
    miss_4 = 1'h0;
  end
  if (reset) begin
    miss_5 = 1'h0;
  end
  if (reset) begin
    miss_6 = 1'h0;
  end
  if (reset) begin
    miss_7 = 1'h0;
  end
  if (reset) begin
    miss_8 = 1'h0;
  end
  if (reset) begin
    miss_9 = 1'h0;
  end
  if (reset) begin
    miss_10 = 1'h0;
  end
  if (reset) begin
    miss_11 = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

