module LoadQueueRAW(
  input         clock,
  input         reset,
  input         io_redirect_valid,
  input         io_redirect_bits_robIdx_flag,
  input  [4:0]  io_redirect_bits_robIdx_value,
  input         io_redirect_bits_level,
  input         io_query_0_req_valid,
  input  [9:0]  io_query_0_req_bits_uop_cf_foldpc,
  input         io_query_0_req_bits_uop_cf_ftqPtr_flag,
  input  [2:0]  io_query_0_req_bits_uop_cf_ftqPtr_value,
  input  [2:0]  io_query_0_req_bits_uop_cf_ftqOffset,
  input         io_query_0_req_bits_uop_robIdx_flag,
  input  [4:0]  io_query_0_req_bits_uop_robIdx_value,
  input         io_query_0_req_bits_uop_sqIdx_flag,
  input  [3:0]  io_query_0_req_bits_uop_sqIdx_value,
  input  [2:0]  io_query_0_req_bits_index,
  input         io_query_0_req_bits_allocated,
  input         io_query_0_req_bits_datavalid,
  input  [7:0]  io_query_0_req_bits_mask,
  input  [35:0] io_query_0_req_bits_paddr,
  output [2:0]  io_query_0_resp_bits_index,
  output        io_query_0_resp_bits_canAccept,
  output        io_query_0_resp_bits_allocated,
  input         io_query_1_req_valid,
  input  [9:0]  io_query_1_req_bits_uop_cf_foldpc,
  input         io_query_1_req_bits_uop_cf_ftqPtr_flag,
  input  [2:0]  io_query_1_req_bits_uop_cf_ftqPtr_value,
  input  [2:0]  io_query_1_req_bits_uop_cf_ftqOffset,
  input         io_query_1_req_bits_uop_robIdx_flag,
  input  [4:0]  io_query_1_req_bits_uop_robIdx_value,
  input         io_query_1_req_bits_uop_sqIdx_flag,
  input  [3:0]  io_query_1_req_bits_uop_sqIdx_value,
  input  [2:0]  io_query_1_req_bits_index,
  input         io_query_1_req_bits_allocated,
  input         io_query_1_req_bits_datavalid,
  input  [7:0]  io_query_1_req_bits_mask,
  input  [35:0] io_query_1_req_bits_paddr,
  output [2:0]  io_query_1_resp_bits_index,
  output        io_query_1_resp_bits_canAccept,
  output        io_query_1_resp_bits_allocated,
  input         io_storeIn_0_valid,
  input  [2:0]  io_storeIn_0_bits_uop_cf_ftqPtr_value,
  input  [2:0]  io_storeIn_0_bits_uop_cf_ftqOffset,
  input         io_storeIn_0_bits_uop_robIdx_flag,
  input  [4:0]  io_storeIn_0_bits_uop_robIdx_value,
  input  [35:0] io_storeIn_0_bits_paddr,
  input  [15:0] io_storeIn_0_bits_mask,
  input         io_storeIn_0_bits_miss,
  input         io_storeIn_1_valid,
  input  [2:0]  io_storeIn_1_bits_uop_cf_ftqPtr_value,
  input  [2:0]  io_storeIn_1_bits_uop_cf_ftqOffset,
  input         io_storeIn_1_bits_uop_robIdx_flag,
  input  [4:0]  io_storeIn_1_bits_uop_robIdx_value,
  input  [35:0] io_storeIn_1_bits_paddr,
  input  [15:0] io_storeIn_1_bits_mask,
  input         io_storeIn_1_bits_miss,
  output        io_rollback_valid,
  output        io_rollback_bits_robIdx_flag,
  output [4:0]  io_rollback_bits_robIdx_value,
  output        io_rollback_bits_ftqIdx_flag,
  output [2:0]  io_rollback_bits_ftqIdx_value,
  output [2:0]  io_rollback_bits_ftqOffset,
  output [2:0]  io_rollback_bits_stFtqIdx_value,
  output [2:0]  io_rollback_bits_stFtqOffset,
  output        io_correctTableUpdate_valid,
  output [9:0]  io_correctTableUpdate_bits_addr,
  input         io_stAddrReadySqPtr_flag,
  input  [3:0]  io_stAddrReadySqPtr_value,
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
  reg [63:0] _RAND_90;
  reg [31:0] _RAND_91;
  reg [31:0] _RAND_92;
  reg [31:0] _RAND_93;
  reg [31:0] _RAND_94;
  reg [31:0] _RAND_95;
  reg [31:0] _RAND_96;
  reg [31:0] _RAND_97;
  reg [31:0] _RAND_98;
  reg [31:0] _RAND_99;
  reg [31:0] _RAND_100;
  reg [31:0] _RAND_101;
  reg [63:0] _RAND_102;
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
  reg [31:0] _RAND_133;
  reg [31:0] _RAND_134;
  reg [31:0] _RAND_135;
  reg [31:0] _RAND_136;
  reg [31:0] _RAND_137;
  reg [31:0] _RAND_138;
  reg [31:0] _RAND_139;
  reg [31:0] _RAND_140;
  reg [31:0] _RAND_141;
  reg [31:0] _RAND_142;
  reg [31:0] _RAND_143;
  reg [31:0] _RAND_144;
  reg [31:0] _RAND_145;
  reg [31:0] _RAND_146;
  reg [31:0] _RAND_147;
  reg [31:0] _RAND_148;
  reg [31:0] _RAND_149;
  reg [31:0] _RAND_150;
  reg [31:0] _RAND_151;
  reg [31:0] _RAND_152;
  reg [31:0] _RAND_153;
  reg [31:0] _RAND_154;
  reg [31:0] _RAND_155;
  reg [31:0] _RAND_156;
  reg [31:0] _RAND_157;
  reg [31:0] _RAND_158;
  reg [31:0] _RAND_159;
  reg [31:0] _RAND_160;
  reg [31:0] _RAND_161;
  reg [31:0] _RAND_162;
  reg [31:0] _RAND_163;
  reg [31:0] _RAND_164;
  reg [31:0] _RAND_165;
`endif // RANDOMIZE_REG_INIT
  wire  paddrModule_clock; // @[LoadQueueRAW.scala 62:27]
  wire  paddrModule_io_wen_0; // @[LoadQueueRAW.scala 62:27]
  wire  paddrModule_io_wen_1; // @[LoadQueueRAW.scala 62:27]
  wire [2:0] paddrModule_io_waddr_0; // @[LoadQueueRAW.scala 62:27]
  wire [2:0] paddrModule_io_waddr_1; // @[LoadQueueRAW.scala 62:27]
  wire [35:0] paddrModule_io_wdata_0; // @[LoadQueueRAW.scala 62:27]
  wire [35:0] paddrModule_io_wdata_1; // @[LoadQueueRAW.scala 62:27]
  wire [35:0] paddrModule_io_violationMdata_0; // @[LoadQueueRAW.scala 62:27]
  wire [35:0] paddrModule_io_violationMdata_1; // @[LoadQueueRAW.scala 62:27]
  wire  paddrModule_io_violationMmask_0_0; // @[LoadQueueRAW.scala 62:27]
  wire  paddrModule_io_violationMmask_0_1; // @[LoadQueueRAW.scala 62:27]
  wire  paddrModule_io_violationMmask_0_2; // @[LoadQueueRAW.scala 62:27]
  wire  paddrModule_io_violationMmask_0_3; // @[LoadQueueRAW.scala 62:27]
  wire  paddrModule_io_violationMmask_0_4; // @[LoadQueueRAW.scala 62:27]
  wire  paddrModule_io_violationMmask_0_5; // @[LoadQueueRAW.scala 62:27]
  wire  paddrModule_io_violationMmask_0_6; // @[LoadQueueRAW.scala 62:27]
  wire  paddrModule_io_violationMmask_0_7; // @[LoadQueueRAW.scala 62:27]
  wire  paddrModule_io_violationMmask_1_0; // @[LoadQueueRAW.scala 62:27]
  wire  paddrModule_io_violationMmask_1_1; // @[LoadQueueRAW.scala 62:27]
  wire  paddrModule_io_violationMmask_1_2; // @[LoadQueueRAW.scala 62:27]
  wire  paddrModule_io_violationMmask_1_3; // @[LoadQueueRAW.scala 62:27]
  wire  paddrModule_io_violationMmask_1_4; // @[LoadQueueRAW.scala 62:27]
  wire  paddrModule_io_violationMmask_1_5; // @[LoadQueueRAW.scala 62:27]
  wire  paddrModule_io_violationMmask_1_6; // @[LoadQueueRAW.scala 62:27]
  wire  paddrModule_io_violationMmask_1_7; // @[LoadQueueRAW.scala 62:27]
  wire  maskModule_clock; // @[LoadQueueRAW.scala 71:26]
  wire  maskModule_io_wen_0; // @[LoadQueueRAW.scala 71:26]
  wire  maskModule_io_wen_1; // @[LoadQueueRAW.scala 71:26]
  wire [2:0] maskModule_io_waddr_0; // @[LoadQueueRAW.scala 71:26]
  wire [2:0] maskModule_io_waddr_1; // @[LoadQueueRAW.scala 71:26]
  wire [7:0] maskModule_io_wdata_0; // @[LoadQueueRAW.scala 71:26]
  wire [7:0] maskModule_io_wdata_1; // @[LoadQueueRAW.scala 71:26]
  wire [7:0] maskModule_io_violationMdata_0; // @[LoadQueueRAW.scala 71:26]
  wire [7:0] maskModule_io_violationMdata_1; // @[LoadQueueRAW.scala 71:26]
  wire  maskModule_io_violationMmask_0_0; // @[LoadQueueRAW.scala 71:26]
  wire  maskModule_io_violationMmask_0_1; // @[LoadQueueRAW.scala 71:26]
  wire  maskModule_io_violationMmask_0_2; // @[LoadQueueRAW.scala 71:26]
  wire  maskModule_io_violationMmask_0_3; // @[LoadQueueRAW.scala 71:26]
  wire  maskModule_io_violationMmask_0_4; // @[LoadQueueRAW.scala 71:26]
  wire  maskModule_io_violationMmask_0_5; // @[LoadQueueRAW.scala 71:26]
  wire  maskModule_io_violationMmask_0_6; // @[LoadQueueRAW.scala 71:26]
  wire  maskModule_io_violationMmask_0_7; // @[LoadQueueRAW.scala 71:26]
  wire  maskModule_io_violationMmask_1_0; // @[LoadQueueRAW.scala 71:26]
  wire  maskModule_io_violationMmask_1_1; // @[LoadQueueRAW.scala 71:26]
  wire  maskModule_io_violationMmask_1_2; // @[LoadQueueRAW.scala 71:26]
  wire  maskModule_io_violationMmask_1_3; // @[LoadQueueRAW.scala 71:26]
  wire  maskModule_io_violationMmask_1_4; // @[LoadQueueRAW.scala 71:26]
  wire  maskModule_io_violationMmask_1_5; // @[LoadQueueRAW.scala 71:26]
  wire  maskModule_io_violationMmask_1_6; // @[LoadQueueRAW.scala 71:26]
  wire  maskModule_io_violationMmask_1_7; // @[LoadQueueRAW.scala 71:26]
  reg  allocated_0; // @[LoadQueueRAW.scala 60:26]
  reg  allocated_1; // @[LoadQueueRAW.scala 60:26]
  reg  allocated_2; // @[LoadQueueRAW.scala 60:26]
  reg  allocated_3; // @[LoadQueueRAW.scala 60:26]
  reg  allocated_4; // @[LoadQueueRAW.scala 60:26]
  reg  allocated_5; // @[LoadQueueRAW.scala 60:26]
  reg  allocated_6; // @[LoadQueueRAW.scala 60:26]
  reg  allocated_7; // @[LoadQueueRAW.scala 60:26]
  reg [9:0] uop_0_cf_foldpc; // @[LoadQueueRAW.scala 61:16]
  reg  uop_0_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 61:16]
  reg [2:0] uop_0_cf_ftqPtr_value; // @[LoadQueueRAW.scala 61:16]
  reg [2:0] uop_0_cf_ftqOffset; // @[LoadQueueRAW.scala 61:16]
  reg  uop_0_robIdx_flag; // @[LoadQueueRAW.scala 61:16]
  reg [4:0] uop_0_robIdx_value; // @[LoadQueueRAW.scala 61:16]
  reg  uop_0_sqIdx_flag; // @[LoadQueueRAW.scala 61:16]
  reg [3:0] uop_0_sqIdx_value; // @[LoadQueueRAW.scala 61:16]
  reg [9:0] uop_1_cf_foldpc; // @[LoadQueueRAW.scala 61:16]
  reg  uop_1_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 61:16]
  reg [2:0] uop_1_cf_ftqPtr_value; // @[LoadQueueRAW.scala 61:16]
  reg [2:0] uop_1_cf_ftqOffset; // @[LoadQueueRAW.scala 61:16]
  reg  uop_1_robIdx_flag; // @[LoadQueueRAW.scala 61:16]
  reg [4:0] uop_1_robIdx_value; // @[LoadQueueRAW.scala 61:16]
  reg  uop_1_sqIdx_flag; // @[LoadQueueRAW.scala 61:16]
  reg [3:0] uop_1_sqIdx_value; // @[LoadQueueRAW.scala 61:16]
  reg [9:0] uop_2_cf_foldpc; // @[LoadQueueRAW.scala 61:16]
  reg  uop_2_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 61:16]
  reg [2:0] uop_2_cf_ftqPtr_value; // @[LoadQueueRAW.scala 61:16]
  reg [2:0] uop_2_cf_ftqOffset; // @[LoadQueueRAW.scala 61:16]
  reg  uop_2_robIdx_flag; // @[LoadQueueRAW.scala 61:16]
  reg [4:0] uop_2_robIdx_value; // @[LoadQueueRAW.scala 61:16]
  reg  uop_2_sqIdx_flag; // @[LoadQueueRAW.scala 61:16]
  reg [3:0] uop_2_sqIdx_value; // @[LoadQueueRAW.scala 61:16]
  reg [9:0] uop_3_cf_foldpc; // @[LoadQueueRAW.scala 61:16]
  reg  uop_3_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 61:16]
  reg [2:0] uop_3_cf_ftqPtr_value; // @[LoadQueueRAW.scala 61:16]
  reg [2:0] uop_3_cf_ftqOffset; // @[LoadQueueRAW.scala 61:16]
  reg  uop_3_robIdx_flag; // @[LoadQueueRAW.scala 61:16]
  reg [4:0] uop_3_robIdx_value; // @[LoadQueueRAW.scala 61:16]
  reg  uop_3_sqIdx_flag; // @[LoadQueueRAW.scala 61:16]
  reg [3:0] uop_3_sqIdx_value; // @[LoadQueueRAW.scala 61:16]
  reg [9:0] uop_4_cf_foldpc; // @[LoadQueueRAW.scala 61:16]
  reg  uop_4_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 61:16]
  reg [2:0] uop_4_cf_ftqPtr_value; // @[LoadQueueRAW.scala 61:16]
  reg [2:0] uop_4_cf_ftqOffset; // @[LoadQueueRAW.scala 61:16]
  reg  uop_4_robIdx_flag; // @[LoadQueueRAW.scala 61:16]
  reg [4:0] uop_4_robIdx_value; // @[LoadQueueRAW.scala 61:16]
  reg  uop_4_sqIdx_flag; // @[LoadQueueRAW.scala 61:16]
  reg [3:0] uop_4_sqIdx_value; // @[LoadQueueRAW.scala 61:16]
  reg [9:0] uop_5_cf_foldpc; // @[LoadQueueRAW.scala 61:16]
  reg  uop_5_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 61:16]
  reg [2:0] uop_5_cf_ftqPtr_value; // @[LoadQueueRAW.scala 61:16]
  reg [2:0] uop_5_cf_ftqOffset; // @[LoadQueueRAW.scala 61:16]
  reg  uop_5_robIdx_flag; // @[LoadQueueRAW.scala 61:16]
  reg [4:0] uop_5_robIdx_value; // @[LoadQueueRAW.scala 61:16]
  reg  uop_5_sqIdx_flag; // @[LoadQueueRAW.scala 61:16]
  reg [3:0] uop_5_sqIdx_value; // @[LoadQueueRAW.scala 61:16]
  reg [9:0] uop_6_cf_foldpc; // @[LoadQueueRAW.scala 61:16]
  reg  uop_6_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 61:16]
  reg [2:0] uop_6_cf_ftqPtr_value; // @[LoadQueueRAW.scala 61:16]
  reg [2:0] uop_6_cf_ftqOffset; // @[LoadQueueRAW.scala 61:16]
  reg  uop_6_robIdx_flag; // @[LoadQueueRAW.scala 61:16]
  reg [4:0] uop_6_robIdx_value; // @[LoadQueueRAW.scala 61:16]
  reg  uop_6_sqIdx_flag; // @[LoadQueueRAW.scala 61:16]
  reg [3:0] uop_6_sqIdx_value; // @[LoadQueueRAW.scala 61:16]
  reg [9:0] uop_7_cf_foldpc; // @[LoadQueueRAW.scala 61:16]
  reg  uop_7_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 61:16]
  reg [2:0] uop_7_cf_ftqPtr_value; // @[LoadQueueRAW.scala 61:16]
  reg [2:0] uop_7_cf_ftqOffset; // @[LoadQueueRAW.scala 61:16]
  reg  uop_7_robIdx_flag; // @[LoadQueueRAW.scala 61:16]
  reg [4:0] uop_7_robIdx_value; // @[LoadQueueRAW.scala 61:16]
  reg  uop_7_sqIdx_flag; // @[LoadQueueRAW.scala 61:16]
  reg [3:0] uop_7_sqIdx_value; // @[LoadQueueRAW.scala 61:16]
  reg  datavalid_0; // @[LoadQueueRAW.scala 80:26]
  reg  datavalid_1; // @[LoadQueueRAW.scala 80:26]
  reg  datavalid_2; // @[LoadQueueRAW.scala 80:26]
  reg  datavalid_3; // @[LoadQueueRAW.scala 80:26]
  reg  datavalid_4; // @[LoadQueueRAW.scala 80:26]
  reg  datavalid_5; // @[LoadQueueRAW.scala 80:26]
  reg  datavalid_6; // @[LoadQueueRAW.scala 80:26]
  reg  datavalid_7; // @[LoadQueueRAW.scala 80:26]
  wire [1:0] _freeNums_T = allocated_0 + allocated_1; // @[Bitwise.scala 48:55]
  wire [1:0] _freeNums_T_2 = allocated_2 + allocated_3; // @[Bitwise.scala 48:55]
  wire [2:0] _freeNums_T_4 = _freeNums_T + _freeNums_T_2; // @[Bitwise.scala 48:55]
  wire [1:0] _freeNums_T_6 = allocated_4 + allocated_5; // @[Bitwise.scala 48:55]
  wire [1:0] _freeNums_T_8 = allocated_6 + allocated_7; // @[Bitwise.scala 48:55]
  wire [2:0] _freeNums_T_10 = _freeNums_T_6 + _freeNums_T_8; // @[Bitwise.scala 48:55]
  wire [3:0] _freeNums_T_12 = _freeNums_T_4 + _freeNums_T_10; // @[Bitwise.scala 48:55]
  wire [3:0] freeNums = 4'h8 - _freeNums_T_12; // @[LoadQueueRAW.scala 83:37]
  wire  canEnqueue_0 = io_query_0_req_valid & ~io_query_0_req_bits_allocated; // @[LoadQueueRAW.scala 87:61]
  wire  canEnqueue_1 = io_query_1_req_valid & ~io_query_1_req_bits_allocated; // @[LoadQueueRAW.scala 87:61]
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
  wire  hasAddrInvalidStore_differentFlag = io_stAddrReadySqPtr_flag ^ io_query_0_req_bits_uop_sqIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  hasAddrInvalidStore_compare = io_stAddrReadySqPtr_value > io_query_0_req_bits_uop_sqIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _hasAddrInvalidStore_T = hasAddrInvalidStore_differentFlag ^ hasAddrInvalidStore_compare; // @[CircularQueuePtr.scala 88:19]
  wire [4:0] _hasAddrInvalidStore_T_2 = {io_stAddrReadySqPtr_flag,io_stAddrReadySqPtr_value}; // @[CircularQueuePtr.scala 63:50]
  wire [4:0] _hasAddrInvalidStore_T_3 = {io_query_0_req_bits_uop_sqIdx_flag,io_query_0_req_bits_uop_sqIdx_value}; // @[CircularQueuePtr.scala 63:70]
  wire  _hasAddrInvalidStore_T_4 = _hasAddrInvalidStore_T_2 != _hasAddrInvalidStore_T_3; // @[CircularQueuePtr.scala 63:52]
  wire  hasAddrInvalidStore_0 = ~_hasAddrInvalidStore_T & _hasAddrInvalidStore_T_4; // @[LoadQueueRAW.scala 89:114]
  wire  hasAddrInvalidStore_differentFlag_1 = io_stAddrReadySqPtr_flag ^ io_query_1_req_bits_uop_sqIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  hasAddrInvalidStore_compare_1 = io_stAddrReadySqPtr_value > io_query_1_req_bits_uop_sqIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _hasAddrInvalidStore_T_5 = hasAddrInvalidStore_differentFlag_1 ^ hasAddrInvalidStore_compare_1; // @[CircularQueuePtr.scala 88:19]
  wire [4:0] _hasAddrInvalidStore_T_8 = {io_query_1_req_bits_uop_sqIdx_flag,io_query_1_req_bits_uop_sqIdx_value}; // @[CircularQueuePtr.scala 63:70]
  wire  _hasAddrInvalidStore_T_9 = _hasAddrInvalidStore_T_2 != _hasAddrInvalidStore_T_8; // @[CircularQueuePtr.scala 63:52]
  wire  hasAddrInvalidStore_1 = ~_hasAddrInvalidStore_T_5 & _hasAddrInvalidStore_T_9; // @[LoadQueueRAW.scala 89:114]
  wire  needEnqueue_0 = canEnqueue_0 & hasAddrInvalidStore_0 & ~cancelEnqueue_0; // @[LoadQueueRAW.scala 90:109]
  wire  needEnqueue_1 = canEnqueue_1 & hasAddrInvalidStore_1 & ~cancelEnqueue_1; // @[LoadQueueRAW.scala 90:109]
  wire [7:0] _enqIdxOH_T = {allocated_7,allocated_6,allocated_5,allocated_4,allocated_3,allocated_2,allocated_1,
    allocated_0}; // @[LoadQueueRAW.scala 91:42]
  wire [7:0] _enqIdxOH_T_1 = ~_enqIdxOH_T; // @[LoadQueueRAW.scala 91:31]
  wire [3:0] _GEN_3824 = {{3'd0}, needEnqueue_0}; // @[LoadQueueRAW.scala 100:33]
  wire  canAcceptVec_1 = freeNums > _GEN_3824; // @[LoadQueueRAW.scala 100:33]
  wire  canEnqVec_1 = needEnqueue_1 & canAcceptVec_1; // @[LoadQueueRAW.scala 102:26]
  wire  canAcceptVec_0 = freeNums > 4'h0; // @[LoadQueueRAW.scala 100:33]
  wire  canEnqVec_0 = needEnqueue_0 & canAcceptVec_0; // @[LoadQueueRAW.scala 102:26]
  wire [1:0] _enqIdxOH_T_2 = {canEnqVec_1,canEnqVec_0}; // @[LoadQueueRAW.scala 91:79]
  wire [7:0] _enqIdxOH_sels_0_T_8 = _enqIdxOH_T_1[7] ? 8'h80 : 8'h0; // @[Mux.scala 47:70]
  wire [7:0] _enqIdxOH_sels_0_T_9 = _enqIdxOH_T_1[6] ? 8'h40 : _enqIdxOH_sels_0_T_8; // @[Mux.scala 47:70]
  wire [7:0] _enqIdxOH_sels_0_T_10 = _enqIdxOH_T_1[5] ? 8'h20 : _enqIdxOH_sels_0_T_9; // @[Mux.scala 47:70]
  wire [7:0] _enqIdxOH_sels_0_T_11 = _enqIdxOH_T_1[4] ? 8'h10 : _enqIdxOH_sels_0_T_10; // @[Mux.scala 47:70]
  wire [7:0] _enqIdxOH_sels_0_T_12 = _enqIdxOH_T_1[3] ? 8'h8 : _enqIdxOH_sels_0_T_11; // @[Mux.scala 47:70]
  wire [7:0] _enqIdxOH_sels_0_T_13 = _enqIdxOH_T_1[2] ? 8'h4 : _enqIdxOH_sels_0_T_12; // @[Mux.scala 47:70]
  wire [7:0] _enqIdxOH_sels_0_T_14 = _enqIdxOH_T_1[1] ? 8'h2 : _enqIdxOH_sels_0_T_13; // @[Mux.scala 47:70]
  wire [7:0] _enqIdxOH_sels_0_T_15 = _enqIdxOH_T_1[0] ? 8'h1 : _enqIdxOH_sels_0_T_14; // @[Mux.scala 47:70]
  wire [7:0] _enqIdxOH_sels_0_T_18 = _enqIdxOH_T_2[0] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] enqIdxOH_0 = _enqIdxOH_sels_0_T_15 & _enqIdxOH_sels_0_T_18; // @[BitUtils.scala 360:42]
  wire [7:0] _enqIdxOH_T_3 = ~enqIdxOH_0; // @[BitUtils.scala 361:21]
  wire [7:0] _enqIdxOH_T_4 = _enqIdxOH_T_1 & _enqIdxOH_T_3; // @[BitUtils.scala 361:19]
  wire [7:0] _enqIdxOH_sels_1_T_8 = _enqIdxOH_T_4[7] ? 8'h80 : 8'h0; // @[Mux.scala 47:70]
  wire [7:0] _enqIdxOH_sels_1_T_9 = _enqIdxOH_T_4[6] ? 8'h40 : _enqIdxOH_sels_1_T_8; // @[Mux.scala 47:70]
  wire [7:0] _enqIdxOH_sels_1_T_10 = _enqIdxOH_T_4[5] ? 8'h20 : _enqIdxOH_sels_1_T_9; // @[Mux.scala 47:70]
  wire [7:0] _enqIdxOH_sels_1_T_11 = _enqIdxOH_T_4[4] ? 8'h10 : _enqIdxOH_sels_1_T_10; // @[Mux.scala 47:70]
  wire [7:0] _enqIdxOH_sels_1_T_12 = _enqIdxOH_T_4[3] ? 8'h8 : _enqIdxOH_sels_1_T_11; // @[Mux.scala 47:70]
  wire [7:0] _enqIdxOH_sels_1_T_13 = _enqIdxOH_T_4[2] ? 8'h4 : _enqIdxOH_sels_1_T_12; // @[Mux.scala 47:70]
  wire [7:0] _enqIdxOH_sels_1_T_14 = _enqIdxOH_T_4[1] ? 8'h2 : _enqIdxOH_sels_1_T_13; // @[Mux.scala 47:70]
  wire [7:0] _enqIdxOH_sels_1_T_15 = _enqIdxOH_T_4[0] ? 8'h1 : _enqIdxOH_sels_1_T_14; // @[Mux.scala 47:70]
  wire [7:0] _enqIdxOH_sels_1_T_18 = _enqIdxOH_T_2[1] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] enqIdxOH_1 = _enqIdxOH_sels_1_T_15 & _enqIdxOH_sels_1_T_18; // @[BitUtils.scala 360:42]
  wire [3:0] enqIdx_hi = enqIdxOH_0[7:4]; // @[OneHot.scala 30:18]
  wire [3:0] enqIdx_lo = enqIdxOH_0[3:0]; // @[OneHot.scala 31:18]
  wire  _enqIdx_T = |enqIdx_hi; // @[OneHot.scala 32:14]
  wire [3:0] _enqIdx_T_1 = enqIdx_hi | enqIdx_lo; // @[OneHot.scala 32:28]
  wire [1:0] enqIdx_hi_1 = _enqIdx_T_1[3:2]; // @[OneHot.scala 30:18]
  wire [1:0] enqIdx_lo_1 = _enqIdx_T_1[1:0]; // @[OneHot.scala 31:18]
  wire  _enqIdx_T_2 = |enqIdx_hi_1; // @[OneHot.scala 32:14]
  wire [1:0] _enqIdx_T_3 = enqIdx_hi_1 | enqIdx_lo_1; // @[OneHot.scala 32:28]
  wire [1:0] _enqIdx_T_5 = {_enqIdx_T_2,_enqIdx_T_3[1]}; // @[Cat.scala 31:58]
  wire [2:0] enqIdx = {_enqIdx_T,_enqIdx_T_2,_enqIdx_T_3[1]}; // @[Cat.scala 31:58]
  wire  _GEN_0 = 3'h0 == enqIdx | allocated_0; // @[LoadQueueRAW.scala 107:{25,25} 60:26]
  wire  _GEN_1 = 3'h1 == enqIdx | allocated_1; // @[LoadQueueRAW.scala 107:{25,25} 60:26]
  wire  _GEN_2 = 3'h2 == enqIdx | allocated_2; // @[LoadQueueRAW.scala 107:{25,25} 60:26]
  wire  _GEN_3 = 3'h3 == enqIdx | allocated_3; // @[LoadQueueRAW.scala 107:{25,25} 60:26]
  wire  _GEN_4 = 3'h4 == enqIdx | allocated_4; // @[LoadQueueRAW.scala 107:{25,25} 60:26]
  wire  _GEN_5 = 3'h5 == enqIdx | allocated_5; // @[LoadQueueRAW.scala 107:{25,25} 60:26]
  wire  _GEN_6 = 3'h6 == enqIdx | allocated_6; // @[LoadQueueRAW.scala 107:{25,25} 60:26]
  wire  _GEN_7 = 3'h7 == enqIdx | allocated_7; // @[LoadQueueRAW.scala 107:{25,25} 60:26]
  wire [9:0] _GEN_24 = 3'h0 == enqIdx ? io_query_0_req_bits_uop_cf_foldpc : uop_0_cf_foldpc; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire [9:0] _GEN_25 = 3'h1 == enqIdx ? io_query_0_req_bits_uop_cf_foldpc : uop_1_cf_foldpc; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire [9:0] _GEN_26 = 3'h2 == enqIdx ? io_query_0_req_bits_uop_cf_foldpc : uop_2_cf_foldpc; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire [9:0] _GEN_27 = 3'h3 == enqIdx ? io_query_0_req_bits_uop_cf_foldpc : uop_3_cf_foldpc; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire [9:0] _GEN_28 = 3'h4 == enqIdx ? io_query_0_req_bits_uop_cf_foldpc : uop_4_cf_foldpc; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire [9:0] _GEN_29 = 3'h5 == enqIdx ? io_query_0_req_bits_uop_cf_foldpc : uop_5_cf_foldpc; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire [9:0] _GEN_30 = 3'h6 == enqIdx ? io_query_0_req_bits_uop_cf_foldpc : uop_6_cf_foldpc; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire [9:0] _GEN_31 = 3'h7 == enqIdx ? io_query_0_req_bits_uop_cf_foldpc : uop_7_cf_foldpc; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire  _GEN_360 = 3'h0 == enqIdx ? io_query_0_req_bits_uop_cf_ftqPtr_flag : uop_0_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire  _GEN_361 = 3'h1 == enqIdx ? io_query_0_req_bits_uop_cf_ftqPtr_flag : uop_1_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire  _GEN_362 = 3'h2 == enqIdx ? io_query_0_req_bits_uop_cf_ftqPtr_flag : uop_2_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire  _GEN_363 = 3'h3 == enqIdx ? io_query_0_req_bits_uop_cf_ftqPtr_flag : uop_3_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire  _GEN_364 = 3'h4 == enqIdx ? io_query_0_req_bits_uop_cf_ftqPtr_flag : uop_4_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire  _GEN_365 = 3'h5 == enqIdx ? io_query_0_req_bits_uop_cf_ftqPtr_flag : uop_5_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire  _GEN_366 = 3'h6 == enqIdx ? io_query_0_req_bits_uop_cf_ftqPtr_flag : uop_6_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire  _GEN_367 = 3'h7 == enqIdx ? io_query_0_req_bits_uop_cf_ftqPtr_flag : uop_7_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire [2:0] _GEN_368 = 3'h0 == enqIdx ? io_query_0_req_bits_uop_cf_ftqPtr_value : uop_0_cf_ftqPtr_value; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire [2:0] _GEN_369 = 3'h1 == enqIdx ? io_query_0_req_bits_uop_cf_ftqPtr_value : uop_1_cf_ftqPtr_value; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire [2:0] _GEN_370 = 3'h2 == enqIdx ? io_query_0_req_bits_uop_cf_ftqPtr_value : uop_2_cf_ftqPtr_value; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire [2:0] _GEN_371 = 3'h3 == enqIdx ? io_query_0_req_bits_uop_cf_ftqPtr_value : uop_3_cf_ftqPtr_value; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire [2:0] _GEN_372 = 3'h4 == enqIdx ? io_query_0_req_bits_uop_cf_ftqPtr_value : uop_4_cf_ftqPtr_value; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire [2:0] _GEN_373 = 3'h5 == enqIdx ? io_query_0_req_bits_uop_cf_ftqPtr_value : uop_5_cf_ftqPtr_value; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire [2:0] _GEN_374 = 3'h6 == enqIdx ? io_query_0_req_bits_uop_cf_ftqPtr_value : uop_6_cf_ftqPtr_value; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire [2:0] _GEN_375 = 3'h7 == enqIdx ? io_query_0_req_bits_uop_cf_ftqPtr_value : uop_7_cf_ftqPtr_value; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire [2:0] _GEN_376 = 3'h0 == enqIdx ? io_query_0_req_bits_uop_cf_ftqOffset : uop_0_cf_ftqOffset; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire [2:0] _GEN_377 = 3'h1 == enqIdx ? io_query_0_req_bits_uop_cf_ftqOffset : uop_1_cf_ftqOffset; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire [2:0] _GEN_378 = 3'h2 == enqIdx ? io_query_0_req_bits_uop_cf_ftqOffset : uop_2_cf_ftqOffset; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire [2:0] _GEN_379 = 3'h3 == enqIdx ? io_query_0_req_bits_uop_cf_ftqOffset : uop_3_cf_ftqOffset; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire [2:0] _GEN_380 = 3'h4 == enqIdx ? io_query_0_req_bits_uop_cf_ftqOffset : uop_4_cf_ftqOffset; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire [2:0] _GEN_381 = 3'h5 == enqIdx ? io_query_0_req_bits_uop_cf_ftqOffset : uop_5_cf_ftqOffset; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire [2:0] _GEN_382 = 3'h6 == enqIdx ? io_query_0_req_bits_uop_cf_ftqOffset : uop_6_cf_ftqOffset; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire [2:0] _GEN_383 = 3'h7 == enqIdx ? io_query_0_req_bits_uop_cf_ftqOffset : uop_7_cf_ftqOffset; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire  _GEN_736 = 3'h0 == enqIdx ? io_query_0_req_bits_uop_robIdx_flag : uop_0_robIdx_flag; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire  _GEN_737 = 3'h1 == enqIdx ? io_query_0_req_bits_uop_robIdx_flag : uop_1_robIdx_flag; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire  _GEN_738 = 3'h2 == enqIdx ? io_query_0_req_bits_uop_robIdx_flag : uop_2_robIdx_flag; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire  _GEN_739 = 3'h3 == enqIdx ? io_query_0_req_bits_uop_robIdx_flag : uop_3_robIdx_flag; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire  _GEN_740 = 3'h4 == enqIdx ? io_query_0_req_bits_uop_robIdx_flag : uop_4_robIdx_flag; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire  _GEN_741 = 3'h5 == enqIdx ? io_query_0_req_bits_uop_robIdx_flag : uop_5_robIdx_flag; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire  _GEN_742 = 3'h6 == enqIdx ? io_query_0_req_bits_uop_robIdx_flag : uop_6_robIdx_flag; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire  _GEN_743 = 3'h7 == enqIdx ? io_query_0_req_bits_uop_robIdx_flag : uop_7_robIdx_flag; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire [4:0] _GEN_744 = 3'h0 == enqIdx ? io_query_0_req_bits_uop_robIdx_value : uop_0_robIdx_value; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire [4:0] _GEN_745 = 3'h1 == enqIdx ? io_query_0_req_bits_uop_robIdx_value : uop_1_robIdx_value; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire [4:0] _GEN_746 = 3'h2 == enqIdx ? io_query_0_req_bits_uop_robIdx_value : uop_2_robIdx_value; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire [4:0] _GEN_747 = 3'h3 == enqIdx ? io_query_0_req_bits_uop_robIdx_value : uop_3_robIdx_value; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire [4:0] _GEN_748 = 3'h4 == enqIdx ? io_query_0_req_bits_uop_robIdx_value : uop_4_robIdx_value; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire [4:0] _GEN_749 = 3'h5 == enqIdx ? io_query_0_req_bits_uop_robIdx_value : uop_5_robIdx_value; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire [4:0] _GEN_750 = 3'h6 == enqIdx ? io_query_0_req_bits_uop_robIdx_value : uop_6_robIdx_value; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire [4:0] _GEN_751 = 3'h7 == enqIdx ? io_query_0_req_bits_uop_robIdx_value : uop_7_robIdx_value; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire  _GEN_768 = 3'h0 == enqIdx ? io_query_0_req_bits_uop_sqIdx_flag : uop_0_sqIdx_flag; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire  _GEN_769 = 3'h1 == enqIdx ? io_query_0_req_bits_uop_sqIdx_flag : uop_1_sqIdx_flag; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire  _GEN_770 = 3'h2 == enqIdx ? io_query_0_req_bits_uop_sqIdx_flag : uop_2_sqIdx_flag; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire  _GEN_771 = 3'h3 == enqIdx ? io_query_0_req_bits_uop_sqIdx_flag : uop_3_sqIdx_flag; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire  _GEN_772 = 3'h4 == enqIdx ? io_query_0_req_bits_uop_sqIdx_flag : uop_4_sqIdx_flag; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire  _GEN_773 = 3'h5 == enqIdx ? io_query_0_req_bits_uop_sqIdx_flag : uop_5_sqIdx_flag; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire  _GEN_774 = 3'h6 == enqIdx ? io_query_0_req_bits_uop_sqIdx_flag : uop_6_sqIdx_flag; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire  _GEN_775 = 3'h7 == enqIdx ? io_query_0_req_bits_uop_sqIdx_flag : uop_7_sqIdx_flag; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire [3:0] _GEN_776 = 3'h0 == enqIdx ? io_query_0_req_bits_uop_sqIdx_value : uop_0_sqIdx_value; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire [3:0] _GEN_777 = 3'h1 == enqIdx ? io_query_0_req_bits_uop_sqIdx_value : uop_1_sqIdx_value; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire [3:0] _GEN_778 = 3'h2 == enqIdx ? io_query_0_req_bits_uop_sqIdx_value : uop_2_sqIdx_value; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire [3:0] _GEN_779 = 3'h3 == enqIdx ? io_query_0_req_bits_uop_sqIdx_value : uop_3_sqIdx_value; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire [3:0] _GEN_780 = 3'h4 == enqIdx ? io_query_0_req_bits_uop_sqIdx_value : uop_4_sqIdx_value; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire [3:0] _GEN_781 = 3'h5 == enqIdx ? io_query_0_req_bits_uop_sqIdx_value : uop_5_sqIdx_value; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire [3:0] _GEN_782 = 3'h6 == enqIdx ? io_query_0_req_bits_uop_sqIdx_value : uop_6_sqIdx_value; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire [3:0] _GEN_783 = 3'h7 == enqIdx ? io_query_0_req_bits_uop_sqIdx_value : uop_7_sqIdx_value; // @[LoadQueueRAW.scala 120:{19,19} 61:16]
  wire  _GEN_872 = 3'h0 == enqIdx ? 1'h0 : datavalid_0; // @[LoadQueueRAW.scala 121:{25,25} 80:26]
  wire  _GEN_873 = 3'h1 == enqIdx ? 1'h0 : datavalid_1; // @[LoadQueueRAW.scala 121:{25,25} 80:26]
  wire  _GEN_874 = 3'h2 == enqIdx ? 1'h0 : datavalid_2; // @[LoadQueueRAW.scala 121:{25,25} 80:26]
  wire  _GEN_875 = 3'h3 == enqIdx ? 1'h0 : datavalid_3; // @[LoadQueueRAW.scala 121:{25,25} 80:26]
  wire  _GEN_876 = 3'h4 == enqIdx ? 1'h0 : datavalid_4; // @[LoadQueueRAW.scala 121:{25,25} 80:26]
  wire  _GEN_877 = 3'h5 == enqIdx ? 1'h0 : datavalid_5; // @[LoadQueueRAW.scala 121:{25,25} 80:26]
  wire  _GEN_878 = 3'h6 == enqIdx ? 1'h0 : datavalid_6; // @[LoadQueueRAW.scala 121:{25,25} 80:26]
  wire  _GEN_879 = 3'h7 == enqIdx ? 1'h0 : datavalid_7; // @[LoadQueueRAW.scala 121:{25,25} 80:26]
  wire  _GEN_881 = canEnqVec_0 ? _GEN_0 : allocated_0; // @[LoadQueueRAW.scala 102:46 60:26]
  wire  _GEN_882 = canEnqVec_0 ? _GEN_1 : allocated_1; // @[LoadQueueRAW.scala 102:46 60:26]
  wire  _GEN_883 = canEnqVec_0 ? _GEN_2 : allocated_2; // @[LoadQueueRAW.scala 102:46 60:26]
  wire  _GEN_884 = canEnqVec_0 ? _GEN_3 : allocated_3; // @[LoadQueueRAW.scala 102:46 60:26]
  wire  _GEN_885 = canEnqVec_0 ? _GEN_4 : allocated_4; // @[LoadQueueRAW.scala 102:46 60:26]
  wire  _GEN_886 = canEnqVec_0 ? _GEN_5 : allocated_5; // @[LoadQueueRAW.scala 102:46 60:26]
  wire  _GEN_887 = canEnqVec_0 ? _GEN_6 : allocated_6; // @[LoadQueueRAW.scala 102:46 60:26]
  wire  _GEN_888 = canEnqVec_0 ? _GEN_7 : allocated_7; // @[LoadQueueRAW.scala 102:46 60:26]
  wire [9:0] _GEN_908 = canEnqVec_0 ? _GEN_24 : uop_0_cf_foldpc; // @[LoadQueueRAW.scala 102:46 61:16]
  wire [9:0] _GEN_909 = canEnqVec_0 ? _GEN_25 : uop_1_cf_foldpc; // @[LoadQueueRAW.scala 102:46 61:16]
  wire [9:0] _GEN_910 = canEnqVec_0 ? _GEN_26 : uop_2_cf_foldpc; // @[LoadQueueRAW.scala 102:46 61:16]
  wire [9:0] _GEN_911 = canEnqVec_0 ? _GEN_27 : uop_3_cf_foldpc; // @[LoadQueueRAW.scala 102:46 61:16]
  wire [9:0] _GEN_912 = canEnqVec_0 ? _GEN_28 : uop_4_cf_foldpc; // @[LoadQueueRAW.scala 102:46 61:16]
  wire [9:0] _GEN_913 = canEnqVec_0 ? _GEN_29 : uop_5_cf_foldpc; // @[LoadQueueRAW.scala 102:46 61:16]
  wire [9:0] _GEN_914 = canEnqVec_0 ? _GEN_30 : uop_6_cf_foldpc; // @[LoadQueueRAW.scala 102:46 61:16]
  wire [9:0] _GEN_915 = canEnqVec_0 ? _GEN_31 : uop_7_cf_foldpc; // @[LoadQueueRAW.scala 102:46 61:16]
  wire  _GEN_1244 = canEnqVec_0 ? _GEN_360 : uop_0_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 102:46 61:16]
  wire  _GEN_1245 = canEnqVec_0 ? _GEN_361 : uop_1_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 102:46 61:16]
  wire  _GEN_1246 = canEnqVec_0 ? _GEN_362 : uop_2_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 102:46 61:16]
  wire  _GEN_1247 = canEnqVec_0 ? _GEN_363 : uop_3_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 102:46 61:16]
  wire  _GEN_1248 = canEnqVec_0 ? _GEN_364 : uop_4_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 102:46 61:16]
  wire  _GEN_1249 = canEnqVec_0 ? _GEN_365 : uop_5_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 102:46 61:16]
  wire  _GEN_1250 = canEnqVec_0 ? _GEN_366 : uop_6_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 102:46 61:16]
  wire  _GEN_1251 = canEnqVec_0 ? _GEN_367 : uop_7_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 102:46 61:16]
  wire [2:0] _GEN_1252 = canEnqVec_0 ? _GEN_368 : uop_0_cf_ftqPtr_value; // @[LoadQueueRAW.scala 102:46 61:16]
  wire [2:0] _GEN_1253 = canEnqVec_0 ? _GEN_369 : uop_1_cf_ftqPtr_value; // @[LoadQueueRAW.scala 102:46 61:16]
  wire [2:0] _GEN_1254 = canEnqVec_0 ? _GEN_370 : uop_2_cf_ftqPtr_value; // @[LoadQueueRAW.scala 102:46 61:16]
  wire [2:0] _GEN_1255 = canEnqVec_0 ? _GEN_371 : uop_3_cf_ftqPtr_value; // @[LoadQueueRAW.scala 102:46 61:16]
  wire [2:0] _GEN_1256 = canEnqVec_0 ? _GEN_372 : uop_4_cf_ftqPtr_value; // @[LoadQueueRAW.scala 102:46 61:16]
  wire [2:0] _GEN_1257 = canEnqVec_0 ? _GEN_373 : uop_5_cf_ftqPtr_value; // @[LoadQueueRAW.scala 102:46 61:16]
  wire [2:0] _GEN_1258 = canEnqVec_0 ? _GEN_374 : uop_6_cf_ftqPtr_value; // @[LoadQueueRAW.scala 102:46 61:16]
  wire [2:0] _GEN_1259 = canEnqVec_0 ? _GEN_375 : uop_7_cf_ftqPtr_value; // @[LoadQueueRAW.scala 102:46 61:16]
  wire [2:0] _GEN_1260 = canEnqVec_0 ? _GEN_376 : uop_0_cf_ftqOffset; // @[LoadQueueRAW.scala 102:46 61:16]
  wire [2:0] _GEN_1261 = canEnqVec_0 ? _GEN_377 : uop_1_cf_ftqOffset; // @[LoadQueueRAW.scala 102:46 61:16]
  wire [2:0] _GEN_1262 = canEnqVec_0 ? _GEN_378 : uop_2_cf_ftqOffset; // @[LoadQueueRAW.scala 102:46 61:16]
  wire [2:0] _GEN_1263 = canEnqVec_0 ? _GEN_379 : uop_3_cf_ftqOffset; // @[LoadQueueRAW.scala 102:46 61:16]
  wire [2:0] _GEN_1264 = canEnqVec_0 ? _GEN_380 : uop_4_cf_ftqOffset; // @[LoadQueueRAW.scala 102:46 61:16]
  wire [2:0] _GEN_1265 = canEnqVec_0 ? _GEN_381 : uop_5_cf_ftqOffset; // @[LoadQueueRAW.scala 102:46 61:16]
  wire [2:0] _GEN_1266 = canEnqVec_0 ? _GEN_382 : uop_6_cf_ftqOffset; // @[LoadQueueRAW.scala 102:46 61:16]
  wire [2:0] _GEN_1267 = canEnqVec_0 ? _GEN_383 : uop_7_cf_ftqOffset; // @[LoadQueueRAW.scala 102:46 61:16]
  wire  _GEN_1620 = canEnqVec_0 ? _GEN_736 : uop_0_robIdx_flag; // @[LoadQueueRAW.scala 102:46 61:16]
  wire  _GEN_1621 = canEnqVec_0 ? _GEN_737 : uop_1_robIdx_flag; // @[LoadQueueRAW.scala 102:46 61:16]
  wire  _GEN_1622 = canEnqVec_0 ? _GEN_738 : uop_2_robIdx_flag; // @[LoadQueueRAW.scala 102:46 61:16]
  wire  _GEN_1623 = canEnqVec_0 ? _GEN_739 : uop_3_robIdx_flag; // @[LoadQueueRAW.scala 102:46 61:16]
  wire  _GEN_1624 = canEnqVec_0 ? _GEN_740 : uop_4_robIdx_flag; // @[LoadQueueRAW.scala 102:46 61:16]
  wire  _GEN_1625 = canEnqVec_0 ? _GEN_741 : uop_5_robIdx_flag; // @[LoadQueueRAW.scala 102:46 61:16]
  wire  _GEN_1626 = canEnqVec_0 ? _GEN_742 : uop_6_robIdx_flag; // @[LoadQueueRAW.scala 102:46 61:16]
  wire  _GEN_1627 = canEnqVec_0 ? _GEN_743 : uop_7_robIdx_flag; // @[LoadQueueRAW.scala 102:46 61:16]
  wire [4:0] _GEN_1628 = canEnqVec_0 ? _GEN_744 : uop_0_robIdx_value; // @[LoadQueueRAW.scala 102:46 61:16]
  wire [4:0] _GEN_1629 = canEnqVec_0 ? _GEN_745 : uop_1_robIdx_value; // @[LoadQueueRAW.scala 102:46 61:16]
  wire [4:0] _GEN_1630 = canEnqVec_0 ? _GEN_746 : uop_2_robIdx_value; // @[LoadQueueRAW.scala 102:46 61:16]
  wire [4:0] _GEN_1631 = canEnqVec_0 ? _GEN_747 : uop_3_robIdx_value; // @[LoadQueueRAW.scala 102:46 61:16]
  wire [4:0] _GEN_1632 = canEnqVec_0 ? _GEN_748 : uop_4_robIdx_value; // @[LoadQueueRAW.scala 102:46 61:16]
  wire [4:0] _GEN_1633 = canEnqVec_0 ? _GEN_749 : uop_5_robIdx_value; // @[LoadQueueRAW.scala 102:46 61:16]
  wire [4:0] _GEN_1634 = canEnqVec_0 ? _GEN_750 : uop_6_robIdx_value; // @[LoadQueueRAW.scala 102:46 61:16]
  wire [4:0] _GEN_1635 = canEnqVec_0 ? _GEN_751 : uop_7_robIdx_value; // @[LoadQueueRAW.scala 102:46 61:16]
  wire  _GEN_1652 = canEnqVec_0 ? _GEN_768 : uop_0_sqIdx_flag; // @[LoadQueueRAW.scala 102:46 61:16]
  wire  _GEN_1653 = canEnqVec_0 ? _GEN_769 : uop_1_sqIdx_flag; // @[LoadQueueRAW.scala 102:46 61:16]
  wire  _GEN_1654 = canEnqVec_0 ? _GEN_770 : uop_2_sqIdx_flag; // @[LoadQueueRAW.scala 102:46 61:16]
  wire  _GEN_1655 = canEnqVec_0 ? _GEN_771 : uop_3_sqIdx_flag; // @[LoadQueueRAW.scala 102:46 61:16]
  wire  _GEN_1656 = canEnqVec_0 ? _GEN_772 : uop_4_sqIdx_flag; // @[LoadQueueRAW.scala 102:46 61:16]
  wire  _GEN_1657 = canEnqVec_0 ? _GEN_773 : uop_5_sqIdx_flag; // @[LoadQueueRAW.scala 102:46 61:16]
  wire  _GEN_1658 = canEnqVec_0 ? _GEN_774 : uop_6_sqIdx_flag; // @[LoadQueueRAW.scala 102:46 61:16]
  wire  _GEN_1659 = canEnqVec_0 ? _GEN_775 : uop_7_sqIdx_flag; // @[LoadQueueRAW.scala 102:46 61:16]
  wire [3:0] _GEN_1660 = canEnqVec_0 ? _GEN_776 : uop_0_sqIdx_value; // @[LoadQueueRAW.scala 102:46 61:16]
  wire [3:0] _GEN_1661 = canEnqVec_0 ? _GEN_777 : uop_1_sqIdx_value; // @[LoadQueueRAW.scala 102:46 61:16]
  wire [3:0] _GEN_1662 = canEnqVec_0 ? _GEN_778 : uop_2_sqIdx_value; // @[LoadQueueRAW.scala 102:46 61:16]
  wire [3:0] _GEN_1663 = canEnqVec_0 ? _GEN_779 : uop_3_sqIdx_value; // @[LoadQueueRAW.scala 102:46 61:16]
  wire [3:0] _GEN_1664 = canEnqVec_0 ? _GEN_780 : uop_4_sqIdx_value; // @[LoadQueueRAW.scala 102:46 61:16]
  wire [3:0] _GEN_1665 = canEnqVec_0 ? _GEN_781 : uop_5_sqIdx_value; // @[LoadQueueRAW.scala 102:46 61:16]
  wire [3:0] _GEN_1666 = canEnqVec_0 ? _GEN_782 : uop_6_sqIdx_value; // @[LoadQueueRAW.scala 102:46 61:16]
  wire [3:0] _GEN_1667 = canEnqVec_0 ? _GEN_783 : uop_7_sqIdx_value; // @[LoadQueueRAW.scala 102:46 61:16]
  wire  _GEN_1756 = canEnqVec_0 ? _GEN_872 : datavalid_0; // @[LoadQueueRAW.scala 102:46 80:26]
  wire  _GEN_1757 = canEnqVec_0 ? _GEN_873 : datavalid_1; // @[LoadQueueRAW.scala 102:46 80:26]
  wire  _GEN_1758 = canEnqVec_0 ? _GEN_874 : datavalid_2; // @[LoadQueueRAW.scala 102:46 80:26]
  wire  _GEN_1759 = canEnqVec_0 ? _GEN_875 : datavalid_3; // @[LoadQueueRAW.scala 102:46 80:26]
  wire  _GEN_1760 = canEnqVec_0 ? _GEN_876 : datavalid_4; // @[LoadQueueRAW.scala 102:46 80:26]
  wire  _GEN_1761 = canEnqVec_0 ? _GEN_877 : datavalid_5; // @[LoadQueueRAW.scala 102:46 80:26]
  wire  _GEN_1762 = canEnqVec_0 ? _GEN_878 : datavalid_6; // @[LoadQueueRAW.scala 102:46 80:26]
  wire  _GEN_1763 = canEnqVec_0 ? _GEN_879 : datavalid_7; // @[LoadQueueRAW.scala 102:46 80:26]
  reg  lastEnqValid_REG; // @[LoadQueueRAW.scala 125:31]
  reg [2:0] lastEnqValid_REG_1; // @[LoadQueueRAW.scala 125:80]
  reg  lastEnqValid_REG_2_flag; // @[LoadQueueRAW.scala 125:116]
  reg [4:0] lastEnqValid_REG_2_value; // @[LoadQueueRAW.scala 125:116]
  wire  _GEN_1765 = 3'h1 == lastEnqValid_REG_1 ? uop_1_robIdx_flag : uop_0_robIdx_flag; // @[CircularQueuePtr.scala 61:{50,50}]
  wire  _GEN_1766 = 3'h2 == lastEnqValid_REG_1 ? uop_2_robIdx_flag : _GEN_1765; // @[CircularQueuePtr.scala 61:{50,50}]
  wire  _GEN_1767 = 3'h3 == lastEnqValid_REG_1 ? uop_3_robIdx_flag : _GEN_1766; // @[CircularQueuePtr.scala 61:{50,50}]
  wire  _GEN_1768 = 3'h4 == lastEnqValid_REG_1 ? uop_4_robIdx_flag : _GEN_1767; // @[CircularQueuePtr.scala 61:{50,50}]
  wire  _GEN_1769 = 3'h5 == lastEnqValid_REG_1 ? uop_5_robIdx_flag : _GEN_1768; // @[CircularQueuePtr.scala 61:{50,50}]
  wire  _GEN_1770 = 3'h6 == lastEnqValid_REG_1 ? uop_6_robIdx_flag : _GEN_1769; // @[CircularQueuePtr.scala 61:{50,50}]
  wire  _GEN_1771 = 3'h7 == lastEnqValid_REG_1 ? uop_7_robIdx_flag : _GEN_1770; // @[CircularQueuePtr.scala 61:{50,50}]
  wire [4:0] _GEN_1773 = 3'h1 == lastEnqValid_REG_1 ? uop_1_robIdx_value : uop_0_robIdx_value; // @[CircularQueuePtr.scala 61:{50,50}]
  wire [4:0] _GEN_1774 = 3'h2 == lastEnqValid_REG_1 ? uop_2_robIdx_value : _GEN_1773; // @[CircularQueuePtr.scala 61:{50,50}]
  wire [4:0] _GEN_1775 = 3'h3 == lastEnqValid_REG_1 ? uop_3_robIdx_value : _GEN_1774; // @[CircularQueuePtr.scala 61:{50,50}]
  wire [4:0] _GEN_1776 = 3'h4 == lastEnqValid_REG_1 ? uop_4_robIdx_value : _GEN_1775; // @[CircularQueuePtr.scala 61:{50,50}]
  wire [4:0] _GEN_1777 = 3'h5 == lastEnqValid_REG_1 ? uop_5_robIdx_value : _GEN_1776; // @[CircularQueuePtr.scala 61:{50,50}]
  wire [4:0] _GEN_1778 = 3'h6 == lastEnqValid_REG_1 ? uop_6_robIdx_value : _GEN_1777; // @[CircularQueuePtr.scala 61:{50,50}]
  wire [4:0] _GEN_1779 = 3'h7 == lastEnqValid_REG_1 ? uop_7_robIdx_value : _GEN_1778; // @[CircularQueuePtr.scala 61:{50,50}]
  wire [5:0] _lastEnqValid_T_3 = {_GEN_1771,_GEN_1779}; // @[CircularQueuePtr.scala 61:50]
  wire [5:0] _lastEnqValid_T_4 = {lastEnqValid_REG_2_flag,lastEnqValid_REG_2_value}; // @[CircularQueuePtr.scala 61:70]
  wire  _lastEnqValid_T_5 = _lastEnqValid_T_3 == _lastEnqValid_T_4; // @[CircularQueuePtr.scala 61:52]
  wire  lastEnqValid = lastEnqValid_REG & _lastEnqValid_T_5 | canEnqVec_0; // @[LoadQueueRAW.scala 125:139]
  reg  lastEnqBits_uop_robIdx_flag; // @[LoadQueueRAW.scala 126:30]
  reg [4:0] lastEnqBits_uop_robIdx_value; // @[LoadQueueRAW.scala 126:30]
  reg [2:0] lastEnqBits_index; // @[LoadQueueRAW.scala 126:30]
  reg  lastEnqBits_allocated; // @[LoadQueueRAW.scala 126:30]
  reg  lastEnqBits_datavalid; // @[LoadQueueRAW.scala 126:30]
  reg [7:0] lastEnqBits_mask; // @[LoadQueueRAW.scala 126:30]
  reg [35:0] lastEnqBits_paddr; // @[LoadQueueRAW.scala 126:30]
  reg [2:0] lastEnqIndex_REG; // @[LoadQueueRAW.scala 128:74]
  wire [2:0] lastEnqIndex = lastEnqBits_allocated ? lastEnqBits_index : lastEnqIndex_REG; // @[LoadQueueRAW.scala 128:24]
  wire  _schedError_T = ~io_storeIn_0_bits_miss; // @[LoadQueueRAW.scala 131:7]
  wire  _schedError_T_1 = io_storeIn_0_valid & _schedError_T; // @[LoadQueueRAW.scala 130:27]
  wire  schedError_differentFlag = lastEnqBits_uop_robIdx_flag ^ io_storeIn_0_bits_uop_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  schedError_compare = lastEnqBits_uop_robIdx_value > io_storeIn_0_bits_uop_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _schedError_T_2 = schedError_differentFlag ^ schedError_compare; // @[CircularQueuePtr.scala 88:19]
  wire  _schedError_T_3 = _schedError_T_1 & _schedError_T_2; // @[LoadQueueRAW.scala 131:32]
  wire  _schedError_T_6 = lastEnqBits_paddr[35:3] == io_storeIn_0_bits_paddr[35:3]; // @[LoadQueueRAW.scala 133:41]
  wire  _schedError_T_7 = _schedError_T_3 & _schedError_T_6; // @[LoadQueueRAW.scala 132:70]
  wire [15:0] _GEN_3833 = {{8'd0}, lastEnqBits_mask}; // @[LoadQueueRAW.scala 134:25]
  wire [15:0] _schedError_T_8 = _GEN_3833 & io_storeIn_0_bits_mask; // @[LoadQueueRAW.scala 134:25]
  wire  _schedError_T_9 = |_schedError_T_8; // @[LoadQueueRAW.scala 134:52]
  wire  _schedError_T_10 = _schedError_T_7 & _schedError_T_9; // @[LoadQueueRAW.scala 133:87]
  wire  _schedError_T_11 = ~io_storeIn_1_bits_miss; // @[LoadQueueRAW.scala 131:7]
  wire  _schedError_T_12 = io_storeIn_1_valid & _schedError_T_11; // @[LoadQueueRAW.scala 130:27]
  wire  schedError_differentFlag_1 = lastEnqBits_uop_robIdx_flag ^ io_storeIn_1_bits_uop_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  schedError_compare_1 = lastEnqBits_uop_robIdx_value > io_storeIn_1_bits_uop_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _schedError_T_13 = schedError_differentFlag_1 ^ schedError_compare_1; // @[CircularQueuePtr.scala 88:19]
  wire  _schedError_T_14 = _schedError_T_12 & _schedError_T_13; // @[LoadQueueRAW.scala 131:32]
  wire  _schedError_T_17 = lastEnqBits_paddr[35:3] == io_storeIn_1_bits_paddr[35:3]; // @[LoadQueueRAW.scala 133:41]
  wire  _schedError_T_18 = _schedError_T_14 & _schedError_T_17; // @[LoadQueueRAW.scala 132:70]
  wire [15:0] _schedError_T_19 = _GEN_3833 & io_storeIn_1_bits_mask; // @[LoadQueueRAW.scala 134:25]
  wire  _schedError_T_20 = |_schedError_T_19; // @[LoadQueueRAW.scala 134:52]
  wire  _schedError_T_21 = _schedError_T_18 & _schedError_T_20; // @[LoadQueueRAW.scala 133:87]
  wire [1:0] _schedError_T_22 = {_schedError_T_21,_schedError_T_10}; // @[LoadQueueRAW.scala 134:58]
  wire  schedError = |_schedError_T_22; // @[LoadQueueRAW.scala 134:65]
  wire  _GEN_1780 = 3'h0 == lastEnqIndex ? lastEnqBits_datavalid & ~schedError : _GEN_1756; // @[LoadQueueRAW.scala 137:{31,31}]
  wire  _GEN_1781 = 3'h1 == lastEnqIndex ? lastEnqBits_datavalid & ~schedError : _GEN_1757; // @[LoadQueueRAW.scala 137:{31,31}]
  wire  _GEN_1782 = 3'h2 == lastEnqIndex ? lastEnqBits_datavalid & ~schedError : _GEN_1758; // @[LoadQueueRAW.scala 137:{31,31}]
  wire  _GEN_1783 = 3'h3 == lastEnqIndex ? lastEnqBits_datavalid & ~schedError : _GEN_1759; // @[LoadQueueRAW.scala 137:{31,31}]
  wire  _GEN_1784 = 3'h4 == lastEnqIndex ? lastEnqBits_datavalid & ~schedError : _GEN_1760; // @[LoadQueueRAW.scala 137:{31,31}]
  wire  _GEN_1785 = 3'h5 == lastEnqIndex ? lastEnqBits_datavalid & ~schedError : _GEN_1761; // @[LoadQueueRAW.scala 137:{31,31}]
  wire  _GEN_1786 = 3'h6 == lastEnqIndex ? lastEnqBits_datavalid & ~schedError : _GEN_1762; // @[LoadQueueRAW.scala 137:{31,31}]
  wire  _GEN_1787 = 3'h7 == lastEnqIndex ? lastEnqBits_datavalid & ~schedError : _GEN_1763; // @[LoadQueueRAW.scala 137:{31,31}]
  wire  _GEN_1788 = lastEnqValid ? _GEN_1780 : _GEN_1756; // @[LoadQueueRAW.scala 136:25]
  wire  _GEN_1789 = lastEnqValid ? _GEN_1781 : _GEN_1757; // @[LoadQueueRAW.scala 136:25]
  wire  _GEN_1790 = lastEnqValid ? _GEN_1782 : _GEN_1758; // @[LoadQueueRAW.scala 136:25]
  wire  _GEN_1791 = lastEnqValid ? _GEN_1783 : _GEN_1759; // @[LoadQueueRAW.scala 136:25]
  wire  _GEN_1792 = lastEnqValid ? _GEN_1784 : _GEN_1760; // @[LoadQueueRAW.scala 136:25]
  wire  _GEN_1793 = lastEnqValid ? _GEN_1785 : _GEN_1761; // @[LoadQueueRAW.scala 136:25]
  wire  _GEN_1794 = lastEnqValid ? _GEN_1786 : _GEN_1762; // @[LoadQueueRAW.scala 136:25]
  wire  _GEN_1795 = lastEnqValid ? _GEN_1787 : _GEN_1763; // @[LoadQueueRAW.scala 136:25]
  wire [3:0] enqIdx_hi_2 = enqIdxOH_1[7:4]; // @[OneHot.scala 30:18]
  wire [3:0] enqIdx_lo_2 = enqIdxOH_1[3:0]; // @[OneHot.scala 31:18]
  wire  _enqIdx_T_6 = |enqIdx_hi_2; // @[OneHot.scala 32:14]
  wire [3:0] _enqIdx_T_7 = enqIdx_hi_2 | enqIdx_lo_2; // @[OneHot.scala 32:28]
  wire [1:0] enqIdx_hi_3 = _enqIdx_T_7[3:2]; // @[OneHot.scala 30:18]
  wire [1:0] enqIdx_lo_3 = _enqIdx_T_7[1:0]; // @[OneHot.scala 31:18]
  wire  _enqIdx_T_8 = |enqIdx_hi_3; // @[OneHot.scala 32:14]
  wire [1:0] _enqIdx_T_9 = enqIdx_hi_3 | enqIdx_lo_3; // @[OneHot.scala 32:28]
  wire [1:0] _enqIdx_T_11 = {_enqIdx_T_8,_enqIdx_T_9[1]}; // @[Cat.scala 31:58]
  wire [2:0] enqIdx_1 = {_enqIdx_T_6,_enqIdx_T_8,_enqIdx_T_9[1]}; // @[Cat.scala 31:58]
  wire  _GEN_1796 = 3'h0 == enqIdx_1 | _GEN_881; // @[LoadQueueRAW.scala 107:{25,25}]
  wire  _GEN_1797 = 3'h1 == enqIdx_1 | _GEN_882; // @[LoadQueueRAW.scala 107:{25,25}]
  wire  _GEN_1798 = 3'h2 == enqIdx_1 | _GEN_883; // @[LoadQueueRAW.scala 107:{25,25}]
  wire  _GEN_1799 = 3'h3 == enqIdx_1 | _GEN_884; // @[LoadQueueRAW.scala 107:{25,25}]
  wire  _GEN_1800 = 3'h4 == enqIdx_1 | _GEN_885; // @[LoadQueueRAW.scala 107:{25,25}]
  wire  _GEN_1801 = 3'h5 == enqIdx_1 | _GEN_886; // @[LoadQueueRAW.scala 107:{25,25}]
  wire  _GEN_1802 = 3'h6 == enqIdx_1 | _GEN_887; // @[LoadQueueRAW.scala 107:{25,25}]
  wire  _GEN_1803 = 3'h7 == enqIdx_1 | _GEN_888; // @[LoadQueueRAW.scala 107:{25,25}]
  wire  _GEN_2668 = 3'h0 == enqIdx_1 ? 1'h0 : _GEN_1788; // @[LoadQueueRAW.scala 121:{25,25}]
  wire  _GEN_2669 = 3'h1 == enqIdx_1 ? 1'h0 : _GEN_1789; // @[LoadQueueRAW.scala 121:{25,25}]
  wire  _GEN_2670 = 3'h2 == enqIdx_1 ? 1'h0 : _GEN_1790; // @[LoadQueueRAW.scala 121:{25,25}]
  wire  _GEN_2671 = 3'h3 == enqIdx_1 ? 1'h0 : _GEN_1791; // @[LoadQueueRAW.scala 121:{25,25}]
  wire  _GEN_2672 = 3'h4 == enqIdx_1 ? 1'h0 : _GEN_1792; // @[LoadQueueRAW.scala 121:{25,25}]
  wire  _GEN_2673 = 3'h5 == enqIdx_1 ? 1'h0 : _GEN_1793; // @[LoadQueueRAW.scala 121:{25,25}]
  wire  _GEN_2674 = 3'h6 == enqIdx_1 ? 1'h0 : _GEN_1794; // @[LoadQueueRAW.scala 121:{25,25}]
  wire  _GEN_2675 = 3'h7 == enqIdx_1 ? 1'h0 : _GEN_1795; // @[LoadQueueRAW.scala 121:{25,25}]
  wire  _GEN_3552 = canEnqVec_1 ? _GEN_2668 : _GEN_1788; // @[LoadQueueRAW.scala 102:46]
  wire  _GEN_3553 = canEnqVec_1 ? _GEN_2669 : _GEN_1789; // @[LoadQueueRAW.scala 102:46]
  wire  _GEN_3554 = canEnqVec_1 ? _GEN_2670 : _GEN_1790; // @[LoadQueueRAW.scala 102:46]
  wire  _GEN_3555 = canEnqVec_1 ? _GEN_2671 : _GEN_1791; // @[LoadQueueRAW.scala 102:46]
  wire  _GEN_3556 = canEnqVec_1 ? _GEN_2672 : _GEN_1792; // @[LoadQueueRAW.scala 102:46]
  wire  _GEN_3557 = canEnqVec_1 ? _GEN_2673 : _GEN_1793; // @[LoadQueueRAW.scala 102:46]
  wire  _GEN_3558 = canEnqVec_1 ? _GEN_2674 : _GEN_1794; // @[LoadQueueRAW.scala 102:46]
  wire  _GEN_3559 = canEnqVec_1 ? _GEN_2675 : _GEN_1795; // @[LoadQueueRAW.scala 102:46]
  reg  lastEnqValid_REG_3; // @[LoadQueueRAW.scala 125:31]
  reg [2:0] lastEnqValid_REG_4; // @[LoadQueueRAW.scala 125:80]
  reg  lastEnqValid_REG_5_flag; // @[LoadQueueRAW.scala 125:116]
  reg [4:0] lastEnqValid_REG_5_value; // @[LoadQueueRAW.scala 125:116]
  wire  _GEN_3561 = 3'h1 == lastEnqValid_REG_4 ? uop_1_robIdx_flag : uop_0_robIdx_flag; // @[CircularQueuePtr.scala 61:{50,50}]
  wire  _GEN_3562 = 3'h2 == lastEnqValid_REG_4 ? uop_2_robIdx_flag : _GEN_3561; // @[CircularQueuePtr.scala 61:{50,50}]
  wire  _GEN_3563 = 3'h3 == lastEnqValid_REG_4 ? uop_3_robIdx_flag : _GEN_3562; // @[CircularQueuePtr.scala 61:{50,50}]
  wire  _GEN_3564 = 3'h4 == lastEnqValid_REG_4 ? uop_4_robIdx_flag : _GEN_3563; // @[CircularQueuePtr.scala 61:{50,50}]
  wire  _GEN_3565 = 3'h5 == lastEnqValid_REG_4 ? uop_5_robIdx_flag : _GEN_3564; // @[CircularQueuePtr.scala 61:{50,50}]
  wire  _GEN_3566 = 3'h6 == lastEnqValid_REG_4 ? uop_6_robIdx_flag : _GEN_3565; // @[CircularQueuePtr.scala 61:{50,50}]
  wire  _GEN_3567 = 3'h7 == lastEnqValid_REG_4 ? uop_7_robIdx_flag : _GEN_3566; // @[CircularQueuePtr.scala 61:{50,50}]
  wire [4:0] _GEN_3569 = 3'h1 == lastEnqValid_REG_4 ? uop_1_robIdx_value : uop_0_robIdx_value; // @[CircularQueuePtr.scala 61:{50,50}]
  wire [4:0] _GEN_3570 = 3'h2 == lastEnqValid_REG_4 ? uop_2_robIdx_value : _GEN_3569; // @[CircularQueuePtr.scala 61:{50,50}]
  wire [4:0] _GEN_3571 = 3'h3 == lastEnqValid_REG_4 ? uop_3_robIdx_value : _GEN_3570; // @[CircularQueuePtr.scala 61:{50,50}]
  wire [4:0] _GEN_3572 = 3'h4 == lastEnqValid_REG_4 ? uop_4_robIdx_value : _GEN_3571; // @[CircularQueuePtr.scala 61:{50,50}]
  wire [4:0] _GEN_3573 = 3'h5 == lastEnqValid_REG_4 ? uop_5_robIdx_value : _GEN_3572; // @[CircularQueuePtr.scala 61:{50,50}]
  wire [4:0] _GEN_3574 = 3'h6 == lastEnqValid_REG_4 ? uop_6_robIdx_value : _GEN_3573; // @[CircularQueuePtr.scala 61:{50,50}]
  wire [4:0] _GEN_3575 = 3'h7 == lastEnqValid_REG_4 ? uop_7_robIdx_value : _GEN_3574; // @[CircularQueuePtr.scala 61:{50,50}]
  wire [5:0] _lastEnqValid_T_10 = {_GEN_3567,_GEN_3575}; // @[CircularQueuePtr.scala 61:50]
  wire [5:0] _lastEnqValid_T_11 = {lastEnqValid_REG_5_flag,lastEnqValid_REG_5_value}; // @[CircularQueuePtr.scala 61:70]
  wire  _lastEnqValid_T_12 = _lastEnqValid_T_10 == _lastEnqValid_T_11; // @[CircularQueuePtr.scala 61:52]
  wire  lastEnqValid_1 = lastEnqValid_REG_3 & _lastEnqValid_T_12 | canEnqVec_1; // @[LoadQueueRAW.scala 125:139]
  reg  lastEnqBits_1_uop_robIdx_flag; // @[LoadQueueRAW.scala 126:30]
  reg [4:0] lastEnqBits_1_uop_robIdx_value; // @[LoadQueueRAW.scala 126:30]
  reg [2:0] lastEnqBits_1_index; // @[LoadQueueRAW.scala 126:30]
  reg  lastEnqBits_1_allocated; // @[LoadQueueRAW.scala 126:30]
  reg  lastEnqBits_1_datavalid; // @[LoadQueueRAW.scala 126:30]
  reg [7:0] lastEnqBits_1_mask; // @[LoadQueueRAW.scala 126:30]
  reg [35:0] lastEnqBits_1_paddr; // @[LoadQueueRAW.scala 126:30]
  reg [2:0] lastEnqIndex_REG_1; // @[LoadQueueRAW.scala 128:74]
  wire [2:0] lastEnqIndex_1 = lastEnqBits_1_allocated ? lastEnqBits_1_index : lastEnqIndex_REG_1; // @[LoadQueueRAW.scala 128:24]
  wire  schedError_differentFlag_2 = lastEnqBits_1_uop_robIdx_flag ^ io_storeIn_0_bits_uop_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  schedError_compare_2 = lastEnqBits_1_uop_robIdx_value > io_storeIn_0_bits_uop_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _schedError_T_25 = schedError_differentFlag_2 ^ schedError_compare_2; // @[CircularQueuePtr.scala 88:19]
  wire  _schedError_T_26 = _schedError_T_1 & _schedError_T_25; // @[LoadQueueRAW.scala 131:32]
  wire  _schedError_T_29 = lastEnqBits_1_paddr[35:3] == io_storeIn_0_bits_paddr[35:3]; // @[LoadQueueRAW.scala 133:41]
  wire  _schedError_T_30 = _schedError_T_26 & _schedError_T_29; // @[LoadQueueRAW.scala 132:70]
  wire [15:0] _GEN_3843 = {{8'd0}, lastEnqBits_1_mask}; // @[LoadQueueRAW.scala 134:25]
  wire [15:0] _schedError_T_31 = _GEN_3843 & io_storeIn_0_bits_mask; // @[LoadQueueRAW.scala 134:25]
  wire  _schedError_T_32 = |_schedError_T_31; // @[LoadQueueRAW.scala 134:52]
  wire  _schedError_T_33 = _schedError_T_30 & _schedError_T_32; // @[LoadQueueRAW.scala 133:87]
  wire  schedError_differentFlag_3 = lastEnqBits_1_uop_robIdx_flag ^ io_storeIn_1_bits_uop_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  schedError_compare_3 = lastEnqBits_1_uop_robIdx_value > io_storeIn_1_bits_uop_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _schedError_T_36 = schedError_differentFlag_3 ^ schedError_compare_3; // @[CircularQueuePtr.scala 88:19]
  wire  _schedError_T_37 = _schedError_T_12 & _schedError_T_36; // @[LoadQueueRAW.scala 131:32]
  wire  _schedError_T_40 = lastEnqBits_1_paddr[35:3] == io_storeIn_1_bits_paddr[35:3]; // @[LoadQueueRAW.scala 133:41]
  wire  _schedError_T_41 = _schedError_T_37 & _schedError_T_40; // @[LoadQueueRAW.scala 132:70]
  wire [15:0] _schedError_T_42 = _GEN_3843 & io_storeIn_1_bits_mask; // @[LoadQueueRAW.scala 134:25]
  wire  _schedError_T_43 = |_schedError_T_42; // @[LoadQueueRAW.scala 134:52]
  wire  _schedError_T_44 = _schedError_T_41 & _schedError_T_43; // @[LoadQueueRAW.scala 133:87]
  wire [1:0] _schedError_T_45 = {_schedError_T_44,_schedError_T_33}; // @[LoadQueueRAW.scala 134:58]
  wire  schedError_1 = |_schedError_T_45; // @[LoadQueueRAW.scala 134:65]
  reg  io_query_0_resp_bits_canAccept_REG; // @[LoadQueueRAW.scala 143:36]
  reg  io_query_0_resp_bits_allocated_REG; // @[LoadQueueRAW.scala 144:36]
  reg [2:0] io_query_0_resp_bits_index_REG; // @[LoadQueueRAW.scala 146:32]
  reg  io_query_1_resp_bits_canAccept_REG; // @[LoadQueueRAW.scala 143:36]
  reg  io_query_1_resp_bits_allocated_REG; // @[LoadQueueRAW.scala 144:36]
  reg [2:0] io_query_1_resp_bits_index_REG; // @[LoadQueueRAW.scala 146:32]
  wire  deqNotBlock_differentFlag = io_stAddrReadySqPtr_flag ^ uop_0_sqIdx_flag; // @[CircularQueuePtr.scala 92:35]
  wire  deqNotBlock_compare = io_stAddrReadySqPtr_value < uop_0_sqIdx_value; // @[CircularQueuePtr.scala 93:30]
  wire  _deqNotBlock_T = deqNotBlock_differentFlag ^ deqNotBlock_compare; // @[CircularQueuePtr.scala 94:19]
  wire  deqNotBlock = ~_deqNotBlock_T; // @[LoadQueueRAW.scala 152:23]
  wire [5:0] _needFlush_flushItself_T_1 = {uop_0_robIdx_flag,uop_0_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _needFlush_flushItself_T_3 = _needFlush_flushItself_T_1 == _cancelEnqueue_flushItself_T_2; // @[CircularQueuePtr.scala 61:52]
  wire  needFlush_flushItself = io_redirect_bits_level & _needFlush_flushItself_T_3; // @[Rob.scala 122:51]
  wire  needFlush_differentFlag = uop_0_robIdx_flag ^ io_redirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  needFlush_compare = uop_0_robIdx_value > io_redirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _needFlush_T = needFlush_differentFlag ^ needFlush_compare; // @[CircularQueuePtr.scala 88:19]
  wire  needFlush = io_redirect_valid & (needFlush_flushItself | _needFlush_T); // @[Rob.scala 123:20]
  wire  deqNotBlock_differentFlag_1 = io_stAddrReadySqPtr_flag ^ uop_1_sqIdx_flag; // @[CircularQueuePtr.scala 92:35]
  wire  deqNotBlock_compare_1 = io_stAddrReadySqPtr_value < uop_1_sqIdx_value; // @[CircularQueuePtr.scala 93:30]
  wire  _deqNotBlock_T_1 = deqNotBlock_differentFlag_1 ^ deqNotBlock_compare_1; // @[CircularQueuePtr.scala 94:19]
  wire  deqNotBlock_1 = ~_deqNotBlock_T_1; // @[LoadQueueRAW.scala 152:23]
  wire [5:0] _needFlush_flushItself_T_5 = {uop_1_robIdx_flag,uop_1_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _needFlush_flushItself_T_7 = _needFlush_flushItself_T_5 == _cancelEnqueue_flushItself_T_2; // @[CircularQueuePtr.scala 61:52]
  wire  needFlush_flushItself_1 = io_redirect_bits_level & _needFlush_flushItself_T_7; // @[Rob.scala 122:51]
  wire  needFlush_differentFlag_1 = uop_1_robIdx_flag ^ io_redirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  needFlush_compare_1 = uop_1_robIdx_value > io_redirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _needFlush_T_2 = needFlush_differentFlag_1 ^ needFlush_compare_1; // @[CircularQueuePtr.scala 88:19]
  wire  needFlush_1 = io_redirect_valid & (needFlush_flushItself_1 | _needFlush_T_2); // @[Rob.scala 123:20]
  wire  deqNotBlock_differentFlag_2 = io_stAddrReadySqPtr_flag ^ uop_2_sqIdx_flag; // @[CircularQueuePtr.scala 92:35]
  wire  deqNotBlock_compare_2 = io_stAddrReadySqPtr_value < uop_2_sqIdx_value; // @[CircularQueuePtr.scala 93:30]
  wire  _deqNotBlock_T_2 = deqNotBlock_differentFlag_2 ^ deqNotBlock_compare_2; // @[CircularQueuePtr.scala 94:19]
  wire  deqNotBlock_2 = ~_deqNotBlock_T_2; // @[LoadQueueRAW.scala 152:23]
  wire [5:0] _needFlush_flushItself_T_9 = {uop_2_robIdx_flag,uop_2_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _needFlush_flushItself_T_11 = _needFlush_flushItself_T_9 == _cancelEnqueue_flushItself_T_2; // @[CircularQueuePtr.scala 61:52]
  wire  needFlush_flushItself_2 = io_redirect_bits_level & _needFlush_flushItself_T_11; // @[Rob.scala 122:51]
  wire  needFlush_differentFlag_2 = uop_2_robIdx_flag ^ io_redirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  needFlush_compare_2 = uop_2_robIdx_value > io_redirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _needFlush_T_4 = needFlush_differentFlag_2 ^ needFlush_compare_2; // @[CircularQueuePtr.scala 88:19]
  wire  needFlush_2 = io_redirect_valid & (needFlush_flushItself_2 | _needFlush_T_4); // @[Rob.scala 123:20]
  wire  deqNotBlock_differentFlag_3 = io_stAddrReadySqPtr_flag ^ uop_3_sqIdx_flag; // @[CircularQueuePtr.scala 92:35]
  wire  deqNotBlock_compare_3 = io_stAddrReadySqPtr_value < uop_3_sqIdx_value; // @[CircularQueuePtr.scala 93:30]
  wire  _deqNotBlock_T_3 = deqNotBlock_differentFlag_3 ^ deqNotBlock_compare_3; // @[CircularQueuePtr.scala 94:19]
  wire  deqNotBlock_3 = ~_deqNotBlock_T_3; // @[LoadQueueRAW.scala 152:23]
  wire [5:0] _needFlush_flushItself_T_13 = {uop_3_robIdx_flag,uop_3_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _needFlush_flushItself_T_15 = _needFlush_flushItself_T_13 == _cancelEnqueue_flushItself_T_2; // @[CircularQueuePtr.scala 61:52]
  wire  needFlush_flushItself_3 = io_redirect_bits_level & _needFlush_flushItself_T_15; // @[Rob.scala 122:51]
  wire  needFlush_differentFlag_3 = uop_3_robIdx_flag ^ io_redirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  needFlush_compare_3 = uop_3_robIdx_value > io_redirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _needFlush_T_6 = needFlush_differentFlag_3 ^ needFlush_compare_3; // @[CircularQueuePtr.scala 88:19]
  wire  needFlush_3 = io_redirect_valid & (needFlush_flushItself_3 | _needFlush_T_6); // @[Rob.scala 123:20]
  wire  deqNotBlock_differentFlag_4 = io_stAddrReadySqPtr_flag ^ uop_4_sqIdx_flag; // @[CircularQueuePtr.scala 92:35]
  wire  deqNotBlock_compare_4 = io_stAddrReadySqPtr_value < uop_4_sqIdx_value; // @[CircularQueuePtr.scala 93:30]
  wire  _deqNotBlock_T_4 = deqNotBlock_differentFlag_4 ^ deqNotBlock_compare_4; // @[CircularQueuePtr.scala 94:19]
  wire  deqNotBlock_4 = ~_deqNotBlock_T_4; // @[LoadQueueRAW.scala 152:23]
  wire [5:0] _needFlush_flushItself_T_17 = {uop_4_robIdx_flag,uop_4_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _needFlush_flushItself_T_19 = _needFlush_flushItself_T_17 == _cancelEnqueue_flushItself_T_2; // @[CircularQueuePtr.scala 61:52]
  wire  needFlush_flushItself_4 = io_redirect_bits_level & _needFlush_flushItself_T_19; // @[Rob.scala 122:51]
  wire  needFlush_differentFlag_4 = uop_4_robIdx_flag ^ io_redirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  needFlush_compare_4 = uop_4_robIdx_value > io_redirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _needFlush_T_8 = needFlush_differentFlag_4 ^ needFlush_compare_4; // @[CircularQueuePtr.scala 88:19]
  wire  needFlush_4 = io_redirect_valid & (needFlush_flushItself_4 | _needFlush_T_8); // @[Rob.scala 123:20]
  wire  deqNotBlock_differentFlag_5 = io_stAddrReadySqPtr_flag ^ uop_5_sqIdx_flag; // @[CircularQueuePtr.scala 92:35]
  wire  deqNotBlock_compare_5 = io_stAddrReadySqPtr_value < uop_5_sqIdx_value; // @[CircularQueuePtr.scala 93:30]
  wire  _deqNotBlock_T_5 = deqNotBlock_differentFlag_5 ^ deqNotBlock_compare_5; // @[CircularQueuePtr.scala 94:19]
  wire  deqNotBlock_5 = ~_deqNotBlock_T_5; // @[LoadQueueRAW.scala 152:23]
  wire [5:0] _needFlush_flushItself_T_21 = {uop_5_robIdx_flag,uop_5_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _needFlush_flushItself_T_23 = _needFlush_flushItself_T_21 == _cancelEnqueue_flushItself_T_2; // @[CircularQueuePtr.scala 61:52]
  wire  needFlush_flushItself_5 = io_redirect_bits_level & _needFlush_flushItself_T_23; // @[Rob.scala 122:51]
  wire  needFlush_differentFlag_5 = uop_5_robIdx_flag ^ io_redirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  needFlush_compare_5 = uop_5_robIdx_value > io_redirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _needFlush_T_10 = needFlush_differentFlag_5 ^ needFlush_compare_5; // @[CircularQueuePtr.scala 88:19]
  wire  needFlush_5 = io_redirect_valid & (needFlush_flushItself_5 | _needFlush_T_10); // @[Rob.scala 123:20]
  wire  deqNotBlock_differentFlag_6 = io_stAddrReadySqPtr_flag ^ uop_6_sqIdx_flag; // @[CircularQueuePtr.scala 92:35]
  wire  deqNotBlock_compare_6 = io_stAddrReadySqPtr_value < uop_6_sqIdx_value; // @[CircularQueuePtr.scala 93:30]
  wire  _deqNotBlock_T_6 = deqNotBlock_differentFlag_6 ^ deqNotBlock_compare_6; // @[CircularQueuePtr.scala 94:19]
  wire  deqNotBlock_6 = ~_deqNotBlock_T_6; // @[LoadQueueRAW.scala 152:23]
  wire [5:0] _needFlush_flushItself_T_25 = {uop_6_robIdx_flag,uop_6_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _needFlush_flushItself_T_27 = _needFlush_flushItself_T_25 == _cancelEnqueue_flushItself_T_2; // @[CircularQueuePtr.scala 61:52]
  wire  needFlush_flushItself_6 = io_redirect_bits_level & _needFlush_flushItself_T_27; // @[Rob.scala 122:51]
  wire  needFlush_differentFlag_6 = uop_6_robIdx_flag ^ io_redirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  needFlush_compare_6 = uop_6_robIdx_value > io_redirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _needFlush_T_12 = needFlush_differentFlag_6 ^ needFlush_compare_6; // @[CircularQueuePtr.scala 88:19]
  wire  needFlush_6 = io_redirect_valid & (needFlush_flushItself_6 | _needFlush_T_12); // @[Rob.scala 123:20]
  wire  deqNotBlock_differentFlag_7 = io_stAddrReadySqPtr_flag ^ uop_7_sqIdx_flag; // @[CircularQueuePtr.scala 92:35]
  wire  deqNotBlock_compare_7 = io_stAddrReadySqPtr_value < uop_7_sqIdx_value; // @[CircularQueuePtr.scala 93:30]
  wire  _deqNotBlock_T_7 = deqNotBlock_differentFlag_7 ^ deqNotBlock_compare_7; // @[CircularQueuePtr.scala 94:19]
  wire  deqNotBlock_7 = ~_deqNotBlock_T_7; // @[LoadQueueRAW.scala 152:23]
  wire [5:0] _needFlush_flushItself_T_29 = {uop_7_robIdx_flag,uop_7_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _needFlush_flushItself_T_31 = _needFlush_flushItself_T_29 == _cancelEnqueue_flushItself_T_2; // @[CircularQueuePtr.scala 61:52]
  wire  needFlush_flushItself_7 = io_redirect_bits_level & _needFlush_flushItself_T_31; // @[Rob.scala 122:51]
  wire  needFlush_differentFlag_7 = uop_7_robIdx_flag ^ io_redirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  needFlush_compare_7 = uop_7_robIdx_value > io_redirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _needFlush_T_14 = needFlush_differentFlag_7 ^ needFlush_compare_7; // @[CircularQueuePtr.scala 88:19]
  wire  needFlush_7 = io_redirect_valid & (needFlush_flushItself_7 | _needFlush_T_14); // @[Rob.scala 123:20]
  reg  lastCycleRedirect_valid; // @[LoadQueueRAW.scala 248:34]
  reg  lastCycleRedirect_bits_robIdx_flag; // @[LoadQueueRAW.scala 248:34]
  reg [4:0] lastCycleRedirect_bits_robIdx_value; // @[LoadQueueRAW.scala 248:34]
  reg  lastlastCycleRedirect_valid; // @[LoadQueueRAW.scala 249:38]
  reg  lastlastCycleRedirect_bits_robIdx_flag; // @[LoadQueueRAW.scala 249:38]
  reg [4:0] lastlastCycleRedirect_bits_robIdx_value; // @[LoadQueueRAW.scala 249:38]
  wire [7:0] _addrMaskMatch_T = {paddrModule_io_violationMmask_0_7,paddrModule_io_violationMmask_0_6,
    paddrModule_io_violationMmask_0_5,paddrModule_io_violationMmask_0_4,paddrModule_io_violationMmask_0_3,
    paddrModule_io_violationMmask_0_2,paddrModule_io_violationMmask_0_1,paddrModule_io_violationMmask_0_0}; // @[LoadQueueRAW.scala 222:66]
  wire [7:0] _addrMaskMatch_T_1 = {maskModule_io_violationMmask_0_7,maskModule_io_violationMmask_0_6,
    maskModule_io_violationMmask_0_5,maskModule_io_violationMmask_0_4,maskModule_io_violationMmask_0_3,
    maskModule_io_violationMmask_0_2,maskModule_io_violationMmask_0_1,maskModule_io_violationMmask_0_0}; // @[LoadQueueRAW.scala 222:107]
  reg [7:0] addrMaskMatch; // @[LoadQueueRAW.scala 222:32]
  wire  entryNeedCheck_differentFlag = uop_0_robIdx_flag ^ io_storeIn_0_bits_uop_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  entryNeedCheck_compare = uop_0_robIdx_value > io_storeIn_0_bits_uop_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _entryNeedCheck_T = entryNeedCheck_differentFlag ^ entryNeedCheck_compare; // @[CircularQueuePtr.scala 88:19]
  wire  entryNeedCheck_differentFlag_1 = uop_1_robIdx_flag ^ io_storeIn_0_bits_uop_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  entryNeedCheck_compare_1 = uop_1_robIdx_value > io_storeIn_0_bits_uop_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _entryNeedCheck_T_3 = entryNeedCheck_differentFlag_1 ^ entryNeedCheck_compare_1; // @[CircularQueuePtr.scala 88:19]
  wire  entryNeedCheck_differentFlag_2 = uop_2_robIdx_flag ^ io_storeIn_0_bits_uop_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  entryNeedCheck_compare_2 = uop_2_robIdx_value > io_storeIn_0_bits_uop_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _entryNeedCheck_T_6 = entryNeedCheck_differentFlag_2 ^ entryNeedCheck_compare_2; // @[CircularQueuePtr.scala 88:19]
  wire  entryNeedCheck_differentFlag_3 = uop_3_robIdx_flag ^ io_storeIn_0_bits_uop_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  entryNeedCheck_compare_3 = uop_3_robIdx_value > io_storeIn_0_bits_uop_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _entryNeedCheck_T_9 = entryNeedCheck_differentFlag_3 ^ entryNeedCheck_compare_3; // @[CircularQueuePtr.scala 88:19]
  wire  entryNeedCheck_differentFlag_4 = uop_4_robIdx_flag ^ io_storeIn_0_bits_uop_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  entryNeedCheck_compare_4 = uop_4_robIdx_value > io_storeIn_0_bits_uop_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _entryNeedCheck_T_12 = entryNeedCheck_differentFlag_4 ^ entryNeedCheck_compare_4; // @[CircularQueuePtr.scala 88:19]
  wire  entryNeedCheck_differentFlag_5 = uop_5_robIdx_flag ^ io_storeIn_0_bits_uop_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  entryNeedCheck_compare_5 = uop_5_robIdx_value > io_storeIn_0_bits_uop_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _entryNeedCheck_T_15 = entryNeedCheck_differentFlag_5 ^ entryNeedCheck_compare_5; // @[CircularQueuePtr.scala 88:19]
  wire  entryNeedCheck_differentFlag_6 = uop_6_robIdx_flag ^ io_storeIn_0_bits_uop_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  entryNeedCheck_compare_6 = uop_6_robIdx_value > io_storeIn_0_bits_uop_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _entryNeedCheck_T_18 = entryNeedCheck_differentFlag_6 ^ entryNeedCheck_compare_6; // @[CircularQueuePtr.scala 88:19]
  wire  entryNeedCheck_differentFlag_7 = uop_7_robIdx_flag ^ io_storeIn_0_bits_uop_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  entryNeedCheck_compare_7 = uop_7_robIdx_value > io_storeIn_0_bits_uop_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _entryNeedCheck_T_21 = entryNeedCheck_differentFlag_7 ^ entryNeedCheck_compare_7; // @[CircularQueuePtr.scala 88:19]
  reg  entryNeedCheck__0; // @[LoadQueueRAW.scala 223:33]
  reg  entryNeedCheck__1; // @[LoadQueueRAW.scala 223:33]
  reg  entryNeedCheck__2; // @[LoadQueueRAW.scala 223:33]
  reg  entryNeedCheck__3; // @[LoadQueueRAW.scala 223:33]
  reg  entryNeedCheck__4; // @[LoadQueueRAW.scala 223:33]
  reg  entryNeedCheck__5; // @[LoadQueueRAW.scala 223:33]
  reg  entryNeedCheck__6; // @[LoadQueueRAW.scala 223:33]
  reg  entryNeedCheck__7; // @[LoadQueueRAW.scala 223:33]
  wire  lqViolationVec__0 = addrMaskMatch[0] & entryNeedCheck__0; // @[LoadQueueRAW.scala 227:24]
  wire  lqViolationVec__1 = addrMaskMatch[1] & entryNeedCheck__1; // @[LoadQueueRAW.scala 227:24]
  wire  lqViolationVec__2 = addrMaskMatch[2] & entryNeedCheck__2; // @[LoadQueueRAW.scala 227:24]
  wire  lqViolationVec__3 = addrMaskMatch[3] & entryNeedCheck__3; // @[LoadQueueRAW.scala 227:24]
  wire  lqViolationVec__4 = addrMaskMatch[4] & entryNeedCheck__4; // @[LoadQueueRAW.scala 227:24]
  wire  lqViolationVec__5 = addrMaskMatch[5] & entryNeedCheck__5; // @[LoadQueueRAW.scala 227:24]
  wire  lqViolationVec__6 = addrMaskMatch[6] & entryNeedCheck__6; // @[LoadQueueRAW.scala 227:24]
  wire  lqViolationVec__7 = addrMaskMatch[7] & entryNeedCheck__7; // @[LoadQueueRAW.scala 227:24]
  wire [7:0] _lqViolation_T = {lqViolationVec__7,lqViolationVec__6,lqViolationVec__5,lqViolationVec__4,lqViolationVec__3
    ,lqViolationVec__2,lqViolationVec__1,lqViolationVec__0}; // @[LoadQueueRAW.scala 229:38]
  reg  lqViolation_REG; // @[LoadQueueRAW.scala 229:59]
  wire  lqViolation = |_lqViolation_T & lqViolation_REG; // @[LoadQueueRAW.scala 229:49]
  wire  lqViolationUop_oldest_differentFlag = uop_0_robIdx_flag ^ uop_1_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  lqViolationUop_oldest_compare = uop_0_robIdx_value > uop_1_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _lqViolationUop_oldest_T_1 = lqViolationUop_oldest_differentFlag ^ lqViolationUop_oldest_compare; // @[CircularQueuePtr.scala 88:19]
  wire  _lqViolationUop_oldest_T_2_valid = _lqViolationUop_oldest_T_1 ? lqViolationVec__1 : lqViolationVec__0; // @[LoadQueueRAW.scala 209:49]
  wire [9:0] _lqViolationUop_oldest_T_2_bits_uop_cf_foldpc = _lqViolationUop_oldest_T_1 ? uop_1_cf_foldpc :
    uop_0_cf_foldpc; // @[LoadQueueRAW.scala 209:49]
  wire  _lqViolationUop_oldest_T_2_bits_uop_cf_ftqPtr_flag = _lqViolationUop_oldest_T_1 ? uop_1_cf_ftqPtr_flag :
    uop_0_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 209:49]
  wire [2:0] _lqViolationUop_oldest_T_2_bits_uop_cf_ftqPtr_value = _lqViolationUop_oldest_T_1 ? uop_1_cf_ftqPtr_value :
    uop_0_cf_ftqPtr_value; // @[LoadQueueRAW.scala 209:49]
  wire [2:0] _lqViolationUop_oldest_T_2_bits_uop_cf_ftqOffset = _lqViolationUop_oldest_T_1 ? uop_1_cf_ftqOffset :
    uop_0_cf_ftqOffset; // @[LoadQueueRAW.scala 209:49]
  wire  _lqViolationUop_oldest_T_2_bits_uop_robIdx_flag = _lqViolationUop_oldest_T_1 ? uop_1_robIdx_flag :
    uop_0_robIdx_flag; // @[LoadQueueRAW.scala 209:49]
  wire [4:0] _lqViolationUop_oldest_T_2_bits_uop_robIdx_value = _lqViolationUop_oldest_T_1 ? uop_1_robIdx_value :
    uop_0_robIdx_value; // @[LoadQueueRAW.scala 209:49]
  wire  _lqViolationUop_oldest_T_5_valid = lqViolationVec__0 & ~lqViolationVec__1 ? lqViolationVec__0 :
    lqViolationVec__1; // @[LoadQueueRAW.scala 209:119]
  wire [9:0] _lqViolationUop_oldest_T_5_bits_uop_cf_foldpc = lqViolationVec__0 & ~lqViolationVec__1 ? uop_0_cf_foldpc :
    uop_1_cf_foldpc; // @[LoadQueueRAW.scala 209:119]
  wire  _lqViolationUop_oldest_T_5_bits_uop_cf_ftqPtr_flag = lqViolationVec__0 & ~lqViolationVec__1 ?
    uop_0_cf_ftqPtr_flag : uop_1_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 209:119]
  wire [2:0] _lqViolationUop_oldest_T_5_bits_uop_cf_ftqPtr_value = lqViolationVec__0 & ~lqViolationVec__1 ?
    uop_0_cf_ftqPtr_value : uop_1_cf_ftqPtr_value; // @[LoadQueueRAW.scala 209:119]
  wire [2:0] _lqViolationUop_oldest_T_5_bits_uop_cf_ftqOffset = lqViolationVec__0 & ~lqViolationVec__1 ?
    uop_0_cf_ftqOffset : uop_1_cf_ftqOffset; // @[LoadQueueRAW.scala 209:119]
  wire  _lqViolationUop_oldest_T_5_bits_uop_robIdx_flag = lqViolationVec__0 & ~lqViolationVec__1 ? uop_0_robIdx_flag :
    uop_1_robIdx_flag; // @[LoadQueueRAW.scala 209:119]
  wire [4:0] _lqViolationUop_oldest_T_5_bits_uop_robIdx_value = lqViolationVec__0 & ~lqViolationVec__1 ?
    uop_0_robIdx_value : uop_1_robIdx_value; // @[LoadQueueRAW.scala 209:119]
  wire  lqViolationUop_oldest_valid = lqViolationVec__0 & lqViolationVec__1 ? _lqViolationUop_oldest_T_2_valid :
    _lqViolationUop_oldest_T_5_valid; // @[LoadQueueRAW.scala 209:23]
  wire [9:0] lqViolationUop_oldest_bits_uop_cf_foldpc = lqViolationVec__0 & lqViolationVec__1 ?
    _lqViolationUop_oldest_T_2_bits_uop_cf_foldpc : _lqViolationUop_oldest_T_5_bits_uop_cf_foldpc; // @[LoadQueueRAW.scala 209:23]
  wire  lqViolationUop_oldest_bits_uop_cf_ftqPtr_flag = lqViolationVec__0 & lqViolationVec__1 ?
    _lqViolationUop_oldest_T_2_bits_uop_cf_ftqPtr_flag : _lqViolationUop_oldest_T_5_bits_uop_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 209:23]
  wire [2:0] lqViolationUop_oldest_bits_uop_cf_ftqPtr_value = lqViolationVec__0 & lqViolationVec__1 ?
    _lqViolationUop_oldest_T_2_bits_uop_cf_ftqPtr_value : _lqViolationUop_oldest_T_5_bits_uop_cf_ftqPtr_value; // @[LoadQueueRAW.scala 209:23]
  wire [2:0] lqViolationUop_oldest_bits_uop_cf_ftqOffset = lqViolationVec__0 & lqViolationVec__1 ?
    _lqViolationUop_oldest_T_2_bits_uop_cf_ftqOffset : _lqViolationUop_oldest_T_5_bits_uop_cf_ftqOffset; // @[LoadQueueRAW.scala 209:23]
  wire  lqViolationUop_oldest_bits_uop_robIdx_flag = lqViolationVec__0 & lqViolationVec__1 ?
    _lqViolationUop_oldest_T_2_bits_uop_robIdx_flag : _lqViolationUop_oldest_T_5_bits_uop_robIdx_flag; // @[LoadQueueRAW.scala 209:23]
  wire [4:0] lqViolationUop_oldest_bits_uop_robIdx_value = lqViolationVec__0 & lqViolationVec__1 ?
    _lqViolationUop_oldest_T_2_bits_uop_robIdx_value : _lqViolationUop_oldest_T_5_bits_uop_robIdx_value; // @[LoadQueueRAW.scala 209:23]
  wire  lqViolationUop_oldest_differentFlag_1 = uop_2_robIdx_flag ^ uop_3_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  lqViolationUop_oldest_compare_1 = uop_2_robIdx_value > uop_3_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _lqViolationUop_oldest_T_7 = lqViolationUop_oldest_differentFlag_1 ^ lqViolationUop_oldest_compare_1; // @[CircularQueuePtr.scala 88:19]
  wire  _lqViolationUop_oldest_T_8_valid = _lqViolationUop_oldest_T_7 ? lqViolationVec__3 : lqViolationVec__2; // @[LoadQueueRAW.scala 209:49]
  wire [9:0] _lqViolationUop_oldest_T_8_bits_uop_cf_foldpc = _lqViolationUop_oldest_T_7 ? uop_3_cf_foldpc :
    uop_2_cf_foldpc; // @[LoadQueueRAW.scala 209:49]
  wire  _lqViolationUop_oldest_T_8_bits_uop_cf_ftqPtr_flag = _lqViolationUop_oldest_T_7 ? uop_3_cf_ftqPtr_flag :
    uop_2_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 209:49]
  wire [2:0] _lqViolationUop_oldest_T_8_bits_uop_cf_ftqPtr_value = _lqViolationUop_oldest_T_7 ? uop_3_cf_ftqPtr_value :
    uop_2_cf_ftqPtr_value; // @[LoadQueueRAW.scala 209:49]
  wire [2:0] _lqViolationUop_oldest_T_8_bits_uop_cf_ftqOffset = _lqViolationUop_oldest_T_7 ? uop_3_cf_ftqOffset :
    uop_2_cf_ftqOffset; // @[LoadQueueRAW.scala 209:49]
  wire  _lqViolationUop_oldest_T_8_bits_uop_robIdx_flag = _lqViolationUop_oldest_T_7 ? uop_3_robIdx_flag :
    uop_2_robIdx_flag; // @[LoadQueueRAW.scala 209:49]
  wire [4:0] _lqViolationUop_oldest_T_8_bits_uop_robIdx_value = _lqViolationUop_oldest_T_7 ? uop_3_robIdx_value :
    uop_2_robIdx_value; // @[LoadQueueRAW.scala 209:49]
  wire  _lqViolationUop_oldest_T_11_valid = lqViolationVec__2 & ~lqViolationVec__3 ? lqViolationVec__2 :
    lqViolationVec__3; // @[LoadQueueRAW.scala 209:119]
  wire [9:0] _lqViolationUop_oldest_T_11_bits_uop_cf_foldpc = lqViolationVec__2 & ~lqViolationVec__3 ? uop_2_cf_foldpc
     : uop_3_cf_foldpc; // @[LoadQueueRAW.scala 209:119]
  wire  _lqViolationUop_oldest_T_11_bits_uop_cf_ftqPtr_flag = lqViolationVec__2 & ~lqViolationVec__3 ?
    uop_2_cf_ftqPtr_flag : uop_3_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 209:119]
  wire [2:0] _lqViolationUop_oldest_T_11_bits_uop_cf_ftqPtr_value = lqViolationVec__2 & ~lqViolationVec__3 ?
    uop_2_cf_ftqPtr_value : uop_3_cf_ftqPtr_value; // @[LoadQueueRAW.scala 209:119]
  wire [2:0] _lqViolationUop_oldest_T_11_bits_uop_cf_ftqOffset = lqViolationVec__2 & ~lqViolationVec__3 ?
    uop_2_cf_ftqOffset : uop_3_cf_ftqOffset; // @[LoadQueueRAW.scala 209:119]
  wire  _lqViolationUop_oldest_T_11_bits_uop_robIdx_flag = lqViolationVec__2 & ~lqViolationVec__3 ? uop_2_robIdx_flag :
    uop_3_robIdx_flag; // @[LoadQueueRAW.scala 209:119]
  wire [4:0] _lqViolationUop_oldest_T_11_bits_uop_robIdx_value = lqViolationVec__2 & ~lqViolationVec__3 ?
    uop_2_robIdx_value : uop_3_robIdx_value; // @[LoadQueueRAW.scala 209:119]
  wire  lqViolationUop_oldest_1_valid = lqViolationVec__2 & lqViolationVec__3 ? _lqViolationUop_oldest_T_8_valid :
    _lqViolationUop_oldest_T_11_valid; // @[LoadQueueRAW.scala 209:23]
  wire [9:0] lqViolationUop_oldest_1_bits_uop_cf_foldpc = lqViolationVec__2 & lqViolationVec__3 ?
    _lqViolationUop_oldest_T_8_bits_uop_cf_foldpc : _lqViolationUop_oldest_T_11_bits_uop_cf_foldpc; // @[LoadQueueRAW.scala 209:23]
  wire  lqViolationUop_oldest_1_bits_uop_cf_ftqPtr_flag = lqViolationVec__2 & lqViolationVec__3 ?
    _lqViolationUop_oldest_T_8_bits_uop_cf_ftqPtr_flag : _lqViolationUop_oldest_T_11_bits_uop_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 209:23]
  wire [2:0] lqViolationUop_oldest_1_bits_uop_cf_ftqPtr_value = lqViolationVec__2 & lqViolationVec__3 ?
    _lqViolationUop_oldest_T_8_bits_uop_cf_ftqPtr_value : _lqViolationUop_oldest_T_11_bits_uop_cf_ftqPtr_value; // @[LoadQueueRAW.scala 209:23]
  wire [2:0] lqViolationUop_oldest_1_bits_uop_cf_ftqOffset = lqViolationVec__2 & lqViolationVec__3 ?
    _lqViolationUop_oldest_T_8_bits_uop_cf_ftqOffset : _lqViolationUop_oldest_T_11_bits_uop_cf_ftqOffset; // @[LoadQueueRAW.scala 209:23]
  wire  lqViolationUop_oldest_1_bits_uop_robIdx_flag = lqViolationVec__2 & lqViolationVec__3 ?
    _lqViolationUop_oldest_T_8_bits_uop_robIdx_flag : _lqViolationUop_oldest_T_11_bits_uop_robIdx_flag; // @[LoadQueueRAW.scala 209:23]
  wire [4:0] lqViolationUop_oldest_1_bits_uop_robIdx_value = lqViolationVec__2 & lqViolationVec__3 ?
    _lqViolationUop_oldest_T_8_bits_uop_robIdx_value : _lqViolationUop_oldest_T_11_bits_uop_robIdx_value; // @[LoadQueueRAW.scala 209:23]
  wire  lqViolationUop_oldest_differentFlag_2 = lqViolationUop_oldest_bits_uop_robIdx_flag ^
    lqViolationUop_oldest_1_bits_uop_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  lqViolationUop_oldest_compare_2 = lqViolationUop_oldest_bits_uop_robIdx_value >
    lqViolationUop_oldest_1_bits_uop_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _lqViolationUop_oldest_T_13 = lqViolationUop_oldest_differentFlag_2 ^ lqViolationUop_oldest_compare_2; // @[CircularQueuePtr.scala 88:19]
  wire  _lqViolationUop_oldest_T_14_valid = _lqViolationUop_oldest_T_13 ? lqViolationUop_oldest_1_valid :
    lqViolationUop_oldest_valid; // @[LoadQueueRAW.scala 209:49]
  wire [9:0] _lqViolationUop_oldest_T_14_bits_uop_cf_foldpc = _lqViolationUop_oldest_T_13 ?
    lqViolationUop_oldest_1_bits_uop_cf_foldpc : lqViolationUop_oldest_bits_uop_cf_foldpc; // @[LoadQueueRAW.scala 209:49]
  wire  _lqViolationUop_oldest_T_14_bits_uop_cf_ftqPtr_flag = _lqViolationUop_oldest_T_13 ?
    lqViolationUop_oldest_1_bits_uop_cf_ftqPtr_flag : lqViolationUop_oldest_bits_uop_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 209:49]
  wire [2:0] _lqViolationUop_oldest_T_14_bits_uop_cf_ftqPtr_value = _lqViolationUop_oldest_T_13 ?
    lqViolationUop_oldest_1_bits_uop_cf_ftqPtr_value : lqViolationUop_oldest_bits_uop_cf_ftqPtr_value; // @[LoadQueueRAW.scala 209:49]
  wire [2:0] _lqViolationUop_oldest_T_14_bits_uop_cf_ftqOffset = _lqViolationUop_oldest_T_13 ?
    lqViolationUop_oldest_1_bits_uop_cf_ftqOffset : lqViolationUop_oldest_bits_uop_cf_ftqOffset; // @[LoadQueueRAW.scala 209:49]
  wire  _lqViolationUop_oldest_T_14_bits_uop_robIdx_flag = _lqViolationUop_oldest_T_13 ?
    lqViolationUop_oldest_1_bits_uop_robIdx_flag : lqViolationUop_oldest_bits_uop_robIdx_flag; // @[LoadQueueRAW.scala 209:49]
  wire [4:0] _lqViolationUop_oldest_T_14_bits_uop_robIdx_value = _lqViolationUop_oldest_T_13 ?
    lqViolationUop_oldest_1_bits_uop_robIdx_value : lqViolationUop_oldest_bits_uop_robIdx_value; // @[LoadQueueRAW.scala 209:49]
  wire  _lqViolationUop_oldest_T_17_valid = lqViolationUop_oldest_valid & ~lqViolationUop_oldest_1_valid ?
    lqViolationUop_oldest_valid : lqViolationUop_oldest_1_valid; // @[LoadQueueRAW.scala 209:119]
  wire [9:0] _lqViolationUop_oldest_T_17_bits_uop_cf_foldpc = lqViolationUop_oldest_valid & ~
    lqViolationUop_oldest_1_valid ? lqViolationUop_oldest_bits_uop_cf_foldpc :
    lqViolationUop_oldest_1_bits_uop_cf_foldpc; // @[LoadQueueRAW.scala 209:119]
  wire  _lqViolationUop_oldest_T_17_bits_uop_cf_ftqPtr_flag = lqViolationUop_oldest_valid & ~
    lqViolationUop_oldest_1_valid ? lqViolationUop_oldest_bits_uop_cf_ftqPtr_flag :
    lqViolationUop_oldest_1_bits_uop_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 209:119]
  wire [2:0] _lqViolationUop_oldest_T_17_bits_uop_cf_ftqPtr_value = lqViolationUop_oldest_valid & ~
    lqViolationUop_oldest_1_valid ? lqViolationUop_oldest_bits_uop_cf_ftqPtr_value :
    lqViolationUop_oldest_1_bits_uop_cf_ftqPtr_value; // @[LoadQueueRAW.scala 209:119]
  wire [2:0] _lqViolationUop_oldest_T_17_bits_uop_cf_ftqOffset = lqViolationUop_oldest_valid & ~
    lqViolationUop_oldest_1_valid ? lqViolationUop_oldest_bits_uop_cf_ftqOffset :
    lqViolationUop_oldest_1_bits_uop_cf_ftqOffset; // @[LoadQueueRAW.scala 209:119]
  wire  _lqViolationUop_oldest_T_17_bits_uop_robIdx_flag = lqViolationUop_oldest_valid & ~lqViolationUop_oldest_1_valid
     ? lqViolationUop_oldest_bits_uop_robIdx_flag : lqViolationUop_oldest_1_bits_uop_robIdx_flag; // @[LoadQueueRAW.scala 209:119]
  wire [4:0] _lqViolationUop_oldest_T_17_bits_uop_robIdx_value = lqViolationUop_oldest_valid & ~
    lqViolationUop_oldest_1_valid ? lqViolationUop_oldest_bits_uop_robIdx_value :
    lqViolationUop_oldest_1_bits_uop_robIdx_value; // @[LoadQueueRAW.scala 209:119]
  wire  lqViolationUop_oldest_2_valid = lqViolationUop_oldest_valid & lqViolationUop_oldest_1_valid ?
    _lqViolationUop_oldest_T_14_valid : _lqViolationUop_oldest_T_17_valid; // @[LoadQueueRAW.scala 209:23]
  wire [9:0] lqViolationUop_oldest_2_bits_uop_cf_foldpc = lqViolationUop_oldest_valid & lqViolationUop_oldest_1_valid ?
    _lqViolationUop_oldest_T_14_bits_uop_cf_foldpc : _lqViolationUop_oldest_T_17_bits_uop_cf_foldpc; // @[LoadQueueRAW.scala 209:23]
  wire  lqViolationUop_oldest_2_bits_uop_cf_ftqPtr_flag = lqViolationUop_oldest_valid & lqViolationUop_oldest_1_valid ?
    _lqViolationUop_oldest_T_14_bits_uop_cf_ftqPtr_flag : _lqViolationUop_oldest_T_17_bits_uop_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 209:23]
  wire [2:0] lqViolationUop_oldest_2_bits_uop_cf_ftqPtr_value = lqViolationUop_oldest_valid &
    lqViolationUop_oldest_1_valid ? _lqViolationUop_oldest_T_14_bits_uop_cf_ftqPtr_value :
    _lqViolationUop_oldest_T_17_bits_uop_cf_ftqPtr_value; // @[LoadQueueRAW.scala 209:23]
  wire [2:0] lqViolationUop_oldest_2_bits_uop_cf_ftqOffset = lqViolationUop_oldest_valid & lqViolationUop_oldest_1_valid
     ? _lqViolationUop_oldest_T_14_bits_uop_cf_ftqOffset : _lqViolationUop_oldest_T_17_bits_uop_cf_ftqOffset; // @[LoadQueueRAW.scala 209:23]
  wire  lqViolationUop_oldest_2_bits_uop_robIdx_flag = lqViolationUop_oldest_valid & lqViolationUop_oldest_1_valid ?
    _lqViolationUop_oldest_T_14_bits_uop_robIdx_flag : _lqViolationUop_oldest_T_17_bits_uop_robIdx_flag; // @[LoadQueueRAW.scala 209:23]
  wire [4:0] lqViolationUop_oldest_2_bits_uop_robIdx_value = lqViolationUop_oldest_valid & lqViolationUop_oldest_1_valid
     ? _lqViolationUop_oldest_T_14_bits_uop_robIdx_value : _lqViolationUop_oldest_T_17_bits_uop_robIdx_value; // @[LoadQueueRAW.scala 209:23]
  wire  lqViolationUop_oldest_differentFlag_3 = uop_4_robIdx_flag ^ uop_5_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  lqViolationUop_oldest_compare_3 = uop_4_robIdx_value > uop_5_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _lqViolationUop_oldest_T_19 = lqViolationUop_oldest_differentFlag_3 ^ lqViolationUop_oldest_compare_3; // @[CircularQueuePtr.scala 88:19]
  wire  _lqViolationUop_oldest_T_20_valid = _lqViolationUop_oldest_T_19 ? lqViolationVec__5 : lqViolationVec__4; // @[LoadQueueRAW.scala 209:49]
  wire [9:0] _lqViolationUop_oldest_T_20_bits_uop_cf_foldpc = _lqViolationUop_oldest_T_19 ? uop_5_cf_foldpc :
    uop_4_cf_foldpc; // @[LoadQueueRAW.scala 209:49]
  wire  _lqViolationUop_oldest_T_20_bits_uop_cf_ftqPtr_flag = _lqViolationUop_oldest_T_19 ? uop_5_cf_ftqPtr_flag :
    uop_4_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 209:49]
  wire [2:0] _lqViolationUop_oldest_T_20_bits_uop_cf_ftqPtr_value = _lqViolationUop_oldest_T_19 ? uop_5_cf_ftqPtr_value
     : uop_4_cf_ftqPtr_value; // @[LoadQueueRAW.scala 209:49]
  wire [2:0] _lqViolationUop_oldest_T_20_bits_uop_cf_ftqOffset = _lqViolationUop_oldest_T_19 ? uop_5_cf_ftqOffset :
    uop_4_cf_ftqOffset; // @[LoadQueueRAW.scala 209:49]
  wire  _lqViolationUop_oldest_T_20_bits_uop_robIdx_flag = _lqViolationUop_oldest_T_19 ? uop_5_robIdx_flag :
    uop_4_robIdx_flag; // @[LoadQueueRAW.scala 209:49]
  wire [4:0] _lqViolationUop_oldest_T_20_bits_uop_robIdx_value = _lqViolationUop_oldest_T_19 ? uop_5_robIdx_value :
    uop_4_robIdx_value; // @[LoadQueueRAW.scala 209:49]
  wire  _lqViolationUop_oldest_T_23_valid = lqViolationVec__4 & ~lqViolationVec__5 ? lqViolationVec__4 :
    lqViolationVec__5; // @[LoadQueueRAW.scala 209:119]
  wire [9:0] _lqViolationUop_oldest_T_23_bits_uop_cf_foldpc = lqViolationVec__4 & ~lqViolationVec__5 ? uop_4_cf_foldpc
     : uop_5_cf_foldpc; // @[LoadQueueRAW.scala 209:119]
  wire  _lqViolationUop_oldest_T_23_bits_uop_cf_ftqPtr_flag = lqViolationVec__4 & ~lqViolationVec__5 ?
    uop_4_cf_ftqPtr_flag : uop_5_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 209:119]
  wire [2:0] _lqViolationUop_oldest_T_23_bits_uop_cf_ftqPtr_value = lqViolationVec__4 & ~lqViolationVec__5 ?
    uop_4_cf_ftqPtr_value : uop_5_cf_ftqPtr_value; // @[LoadQueueRAW.scala 209:119]
  wire [2:0] _lqViolationUop_oldest_T_23_bits_uop_cf_ftqOffset = lqViolationVec__4 & ~lqViolationVec__5 ?
    uop_4_cf_ftqOffset : uop_5_cf_ftqOffset; // @[LoadQueueRAW.scala 209:119]
  wire  _lqViolationUop_oldest_T_23_bits_uop_robIdx_flag = lqViolationVec__4 & ~lqViolationVec__5 ? uop_4_robIdx_flag :
    uop_5_robIdx_flag; // @[LoadQueueRAW.scala 209:119]
  wire [4:0] _lqViolationUop_oldest_T_23_bits_uop_robIdx_value = lqViolationVec__4 & ~lqViolationVec__5 ?
    uop_4_robIdx_value : uop_5_robIdx_value; // @[LoadQueueRAW.scala 209:119]
  wire  lqViolationUop_oldest_3_valid = lqViolationVec__4 & lqViolationVec__5 ? _lqViolationUop_oldest_T_20_valid :
    _lqViolationUop_oldest_T_23_valid; // @[LoadQueueRAW.scala 209:23]
  wire [9:0] lqViolationUop_oldest_3_bits_uop_cf_foldpc = lqViolationVec__4 & lqViolationVec__5 ?
    _lqViolationUop_oldest_T_20_bits_uop_cf_foldpc : _lqViolationUop_oldest_T_23_bits_uop_cf_foldpc; // @[LoadQueueRAW.scala 209:23]
  wire  lqViolationUop_oldest_3_bits_uop_cf_ftqPtr_flag = lqViolationVec__4 & lqViolationVec__5 ?
    _lqViolationUop_oldest_T_20_bits_uop_cf_ftqPtr_flag : _lqViolationUop_oldest_T_23_bits_uop_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 209:23]
  wire [2:0] lqViolationUop_oldest_3_bits_uop_cf_ftqPtr_value = lqViolationVec__4 & lqViolationVec__5 ?
    _lqViolationUop_oldest_T_20_bits_uop_cf_ftqPtr_value : _lqViolationUop_oldest_T_23_bits_uop_cf_ftqPtr_value; // @[LoadQueueRAW.scala 209:23]
  wire [2:0] lqViolationUop_oldest_3_bits_uop_cf_ftqOffset = lqViolationVec__4 & lqViolationVec__5 ?
    _lqViolationUop_oldest_T_20_bits_uop_cf_ftqOffset : _lqViolationUop_oldest_T_23_bits_uop_cf_ftqOffset; // @[LoadQueueRAW.scala 209:23]
  wire  lqViolationUop_oldest_3_bits_uop_robIdx_flag = lqViolationVec__4 & lqViolationVec__5 ?
    _lqViolationUop_oldest_T_20_bits_uop_robIdx_flag : _lqViolationUop_oldest_T_23_bits_uop_robIdx_flag; // @[LoadQueueRAW.scala 209:23]
  wire [4:0] lqViolationUop_oldest_3_bits_uop_robIdx_value = lqViolationVec__4 & lqViolationVec__5 ?
    _lqViolationUop_oldest_T_20_bits_uop_robIdx_value : _lqViolationUop_oldest_T_23_bits_uop_robIdx_value; // @[LoadQueueRAW.scala 209:23]
  wire  lqViolationUop_oldest_differentFlag_4 = uop_6_robIdx_flag ^ uop_7_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  lqViolationUop_oldest_compare_4 = uop_6_robIdx_value > uop_7_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _lqViolationUop_oldest_T_25 = lqViolationUop_oldest_differentFlag_4 ^ lqViolationUop_oldest_compare_4; // @[CircularQueuePtr.scala 88:19]
  wire  _lqViolationUop_oldest_T_26_valid = _lqViolationUop_oldest_T_25 ? lqViolationVec__7 : lqViolationVec__6; // @[LoadQueueRAW.scala 209:49]
  wire [9:0] _lqViolationUop_oldest_T_26_bits_uop_cf_foldpc = _lqViolationUop_oldest_T_25 ? uop_7_cf_foldpc :
    uop_6_cf_foldpc; // @[LoadQueueRAW.scala 209:49]
  wire  _lqViolationUop_oldest_T_26_bits_uop_cf_ftqPtr_flag = _lqViolationUop_oldest_T_25 ? uop_7_cf_ftqPtr_flag :
    uop_6_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 209:49]
  wire [2:0] _lqViolationUop_oldest_T_26_bits_uop_cf_ftqPtr_value = _lqViolationUop_oldest_T_25 ? uop_7_cf_ftqPtr_value
     : uop_6_cf_ftqPtr_value; // @[LoadQueueRAW.scala 209:49]
  wire [2:0] _lqViolationUop_oldest_T_26_bits_uop_cf_ftqOffset = _lqViolationUop_oldest_T_25 ? uop_7_cf_ftqOffset :
    uop_6_cf_ftqOffset; // @[LoadQueueRAW.scala 209:49]
  wire  _lqViolationUop_oldest_T_26_bits_uop_robIdx_flag = _lqViolationUop_oldest_T_25 ? uop_7_robIdx_flag :
    uop_6_robIdx_flag; // @[LoadQueueRAW.scala 209:49]
  wire [4:0] _lqViolationUop_oldest_T_26_bits_uop_robIdx_value = _lqViolationUop_oldest_T_25 ? uop_7_robIdx_value :
    uop_6_robIdx_value; // @[LoadQueueRAW.scala 209:49]
  wire  _lqViolationUop_oldest_T_29_valid = lqViolationVec__6 & ~lqViolationVec__7 ? lqViolationVec__6 :
    lqViolationVec__7; // @[LoadQueueRAW.scala 209:119]
  wire [9:0] _lqViolationUop_oldest_T_29_bits_uop_cf_foldpc = lqViolationVec__6 & ~lqViolationVec__7 ? uop_6_cf_foldpc
     : uop_7_cf_foldpc; // @[LoadQueueRAW.scala 209:119]
  wire  _lqViolationUop_oldest_T_29_bits_uop_cf_ftqPtr_flag = lqViolationVec__6 & ~lqViolationVec__7 ?
    uop_6_cf_ftqPtr_flag : uop_7_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 209:119]
  wire [2:0] _lqViolationUop_oldest_T_29_bits_uop_cf_ftqPtr_value = lqViolationVec__6 & ~lqViolationVec__7 ?
    uop_6_cf_ftqPtr_value : uop_7_cf_ftqPtr_value; // @[LoadQueueRAW.scala 209:119]
  wire [2:0] _lqViolationUop_oldest_T_29_bits_uop_cf_ftqOffset = lqViolationVec__6 & ~lqViolationVec__7 ?
    uop_6_cf_ftqOffset : uop_7_cf_ftqOffset; // @[LoadQueueRAW.scala 209:119]
  wire  _lqViolationUop_oldest_T_29_bits_uop_robIdx_flag = lqViolationVec__6 & ~lqViolationVec__7 ? uop_6_robIdx_flag :
    uop_7_robIdx_flag; // @[LoadQueueRAW.scala 209:119]
  wire [4:0] _lqViolationUop_oldest_T_29_bits_uop_robIdx_value = lqViolationVec__6 & ~lqViolationVec__7 ?
    uop_6_robIdx_value : uop_7_robIdx_value; // @[LoadQueueRAW.scala 209:119]
  wire  lqViolationUop_oldest_4_valid = lqViolationVec__6 & lqViolationVec__7 ? _lqViolationUop_oldest_T_26_valid :
    _lqViolationUop_oldest_T_29_valid; // @[LoadQueueRAW.scala 209:23]
  wire [9:0] lqViolationUop_oldest_4_bits_uop_cf_foldpc = lqViolationVec__6 & lqViolationVec__7 ?
    _lqViolationUop_oldest_T_26_bits_uop_cf_foldpc : _lqViolationUop_oldest_T_29_bits_uop_cf_foldpc; // @[LoadQueueRAW.scala 209:23]
  wire  lqViolationUop_oldest_4_bits_uop_cf_ftqPtr_flag = lqViolationVec__6 & lqViolationVec__7 ?
    _lqViolationUop_oldest_T_26_bits_uop_cf_ftqPtr_flag : _lqViolationUop_oldest_T_29_bits_uop_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 209:23]
  wire [2:0] lqViolationUop_oldest_4_bits_uop_cf_ftqPtr_value = lqViolationVec__6 & lqViolationVec__7 ?
    _lqViolationUop_oldest_T_26_bits_uop_cf_ftqPtr_value : _lqViolationUop_oldest_T_29_bits_uop_cf_ftqPtr_value; // @[LoadQueueRAW.scala 209:23]
  wire [2:0] lqViolationUop_oldest_4_bits_uop_cf_ftqOffset = lqViolationVec__6 & lqViolationVec__7 ?
    _lqViolationUop_oldest_T_26_bits_uop_cf_ftqOffset : _lqViolationUop_oldest_T_29_bits_uop_cf_ftqOffset; // @[LoadQueueRAW.scala 209:23]
  wire  lqViolationUop_oldest_4_bits_uop_robIdx_flag = lqViolationVec__6 & lqViolationVec__7 ?
    _lqViolationUop_oldest_T_26_bits_uop_robIdx_flag : _lqViolationUop_oldest_T_29_bits_uop_robIdx_flag; // @[LoadQueueRAW.scala 209:23]
  wire [4:0] lqViolationUop_oldest_4_bits_uop_robIdx_value = lqViolationVec__6 & lqViolationVec__7 ?
    _lqViolationUop_oldest_T_26_bits_uop_robIdx_value : _lqViolationUop_oldest_T_29_bits_uop_robIdx_value; // @[LoadQueueRAW.scala 209:23]
  wire  lqViolationUop_oldest_differentFlag_5 = lqViolationUop_oldest_3_bits_uop_robIdx_flag ^
    lqViolationUop_oldest_4_bits_uop_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  lqViolationUop_oldest_compare_5 = lqViolationUop_oldest_3_bits_uop_robIdx_value >
    lqViolationUop_oldest_4_bits_uop_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _lqViolationUop_oldest_T_31 = lqViolationUop_oldest_differentFlag_5 ^ lqViolationUop_oldest_compare_5; // @[CircularQueuePtr.scala 88:19]
  wire  _lqViolationUop_oldest_T_32_valid = _lqViolationUop_oldest_T_31 ? lqViolationUop_oldest_4_valid :
    lqViolationUop_oldest_3_valid; // @[LoadQueueRAW.scala 209:49]
  wire [9:0] _lqViolationUop_oldest_T_32_bits_uop_cf_foldpc = _lqViolationUop_oldest_T_31 ?
    lqViolationUop_oldest_4_bits_uop_cf_foldpc : lqViolationUop_oldest_3_bits_uop_cf_foldpc; // @[LoadQueueRAW.scala 209:49]
  wire  _lqViolationUop_oldest_T_32_bits_uop_cf_ftqPtr_flag = _lqViolationUop_oldest_T_31 ?
    lqViolationUop_oldest_4_bits_uop_cf_ftqPtr_flag : lqViolationUop_oldest_3_bits_uop_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 209:49]
  wire [2:0] _lqViolationUop_oldest_T_32_bits_uop_cf_ftqPtr_value = _lqViolationUop_oldest_T_31 ?
    lqViolationUop_oldest_4_bits_uop_cf_ftqPtr_value : lqViolationUop_oldest_3_bits_uop_cf_ftqPtr_value; // @[LoadQueueRAW.scala 209:49]
  wire [2:0] _lqViolationUop_oldest_T_32_bits_uop_cf_ftqOffset = _lqViolationUop_oldest_T_31 ?
    lqViolationUop_oldest_4_bits_uop_cf_ftqOffset : lqViolationUop_oldest_3_bits_uop_cf_ftqOffset; // @[LoadQueueRAW.scala 209:49]
  wire  _lqViolationUop_oldest_T_32_bits_uop_robIdx_flag = _lqViolationUop_oldest_T_31 ?
    lqViolationUop_oldest_4_bits_uop_robIdx_flag : lqViolationUop_oldest_3_bits_uop_robIdx_flag; // @[LoadQueueRAW.scala 209:49]
  wire [4:0] _lqViolationUop_oldest_T_32_bits_uop_robIdx_value = _lqViolationUop_oldest_T_31 ?
    lqViolationUop_oldest_4_bits_uop_robIdx_value : lqViolationUop_oldest_3_bits_uop_robIdx_value; // @[LoadQueueRAW.scala 209:49]
  wire  _lqViolationUop_oldest_T_35_valid = lqViolationUop_oldest_3_valid & ~lqViolationUop_oldest_4_valid ?
    lqViolationUop_oldest_3_valid : lqViolationUop_oldest_4_valid; // @[LoadQueueRAW.scala 209:119]
  wire [9:0] _lqViolationUop_oldest_T_35_bits_uop_cf_foldpc = lqViolationUop_oldest_3_valid & ~
    lqViolationUop_oldest_4_valid ? lqViolationUop_oldest_3_bits_uop_cf_foldpc :
    lqViolationUop_oldest_4_bits_uop_cf_foldpc; // @[LoadQueueRAW.scala 209:119]
  wire  _lqViolationUop_oldest_T_35_bits_uop_cf_ftqPtr_flag = lqViolationUop_oldest_3_valid & ~
    lqViolationUop_oldest_4_valid ? lqViolationUop_oldest_3_bits_uop_cf_ftqPtr_flag :
    lqViolationUop_oldest_4_bits_uop_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 209:119]
  wire [2:0] _lqViolationUop_oldest_T_35_bits_uop_cf_ftqPtr_value = lqViolationUop_oldest_3_valid & ~
    lqViolationUop_oldest_4_valid ? lqViolationUop_oldest_3_bits_uop_cf_ftqPtr_value :
    lqViolationUop_oldest_4_bits_uop_cf_ftqPtr_value; // @[LoadQueueRAW.scala 209:119]
  wire [2:0] _lqViolationUop_oldest_T_35_bits_uop_cf_ftqOffset = lqViolationUop_oldest_3_valid & ~
    lqViolationUop_oldest_4_valid ? lqViolationUop_oldest_3_bits_uop_cf_ftqOffset :
    lqViolationUop_oldest_4_bits_uop_cf_ftqOffset; // @[LoadQueueRAW.scala 209:119]
  wire  _lqViolationUop_oldest_T_35_bits_uop_robIdx_flag = lqViolationUop_oldest_3_valid & ~
    lqViolationUop_oldest_4_valid ? lqViolationUop_oldest_3_bits_uop_robIdx_flag :
    lqViolationUop_oldest_4_bits_uop_robIdx_flag; // @[LoadQueueRAW.scala 209:119]
  wire [4:0] _lqViolationUop_oldest_T_35_bits_uop_robIdx_value = lqViolationUop_oldest_3_valid & ~
    lqViolationUop_oldest_4_valid ? lqViolationUop_oldest_3_bits_uop_robIdx_value :
    lqViolationUop_oldest_4_bits_uop_robIdx_value; // @[LoadQueueRAW.scala 209:119]
  wire  lqViolationUop_oldest_5_valid = lqViolationUop_oldest_3_valid & lqViolationUop_oldest_4_valid ?
    _lqViolationUop_oldest_T_32_valid : _lqViolationUop_oldest_T_35_valid; // @[LoadQueueRAW.scala 209:23]
  wire [9:0] lqViolationUop_oldest_5_bits_uop_cf_foldpc = lqViolationUop_oldest_3_valid & lqViolationUop_oldest_4_valid
     ? _lqViolationUop_oldest_T_32_bits_uop_cf_foldpc : _lqViolationUop_oldest_T_35_bits_uop_cf_foldpc; // @[LoadQueueRAW.scala 209:23]
  wire  lqViolationUop_oldest_5_bits_uop_cf_ftqPtr_flag = lqViolationUop_oldest_3_valid & lqViolationUop_oldest_4_valid
     ? _lqViolationUop_oldest_T_32_bits_uop_cf_ftqPtr_flag : _lqViolationUop_oldest_T_35_bits_uop_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 209:23]
  wire [2:0] lqViolationUop_oldest_5_bits_uop_cf_ftqPtr_value = lqViolationUop_oldest_3_valid &
    lqViolationUop_oldest_4_valid ? _lqViolationUop_oldest_T_32_bits_uop_cf_ftqPtr_value :
    _lqViolationUop_oldest_T_35_bits_uop_cf_ftqPtr_value; // @[LoadQueueRAW.scala 209:23]
  wire [2:0] lqViolationUop_oldest_5_bits_uop_cf_ftqOffset = lqViolationUop_oldest_3_valid &
    lqViolationUop_oldest_4_valid ? _lqViolationUop_oldest_T_32_bits_uop_cf_ftqOffset :
    _lqViolationUop_oldest_T_35_bits_uop_cf_ftqOffset; // @[LoadQueueRAW.scala 209:23]
  wire  lqViolationUop_oldest_5_bits_uop_robIdx_flag = lqViolationUop_oldest_3_valid & lqViolationUop_oldest_4_valid ?
    _lqViolationUop_oldest_T_32_bits_uop_robIdx_flag : _lqViolationUop_oldest_T_35_bits_uop_robIdx_flag; // @[LoadQueueRAW.scala 209:23]
  wire [4:0] lqViolationUop_oldest_5_bits_uop_robIdx_value = lqViolationUop_oldest_3_valid &
    lqViolationUop_oldest_4_valid ? _lqViolationUop_oldest_T_32_bits_uop_robIdx_value :
    _lqViolationUop_oldest_T_35_bits_uop_robIdx_value; // @[LoadQueueRAW.scala 209:23]
  wire  lqViolationUop_oldest_differentFlag_6 = lqViolationUop_oldest_2_bits_uop_robIdx_flag ^
    lqViolationUop_oldest_5_bits_uop_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  lqViolationUop_oldest_compare_6 = lqViolationUop_oldest_2_bits_uop_robIdx_value >
    lqViolationUop_oldest_5_bits_uop_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _lqViolationUop_oldest_T_37 = lqViolationUop_oldest_differentFlag_6 ^ lqViolationUop_oldest_compare_6; // @[CircularQueuePtr.scala 88:19]
  reg  rollbackLq_0_valid_REG; // @[LoadQueueRAW.scala 259:58]
  wire  rollbackLq_0_valid = lqViolation & rollbackLq_0_valid_REG; // @[LoadQueueRAW.scala 259:48]
  reg [2:0] stFtqIdxS2_0_REG_value; // @[LoadQueueRAW.scala 262:29]
  reg [2:0] stFtqOffsetS2_0_REG; // @[LoadQueueRAW.scala 263:32]
  wire [7:0] _addrMaskMatch_T_3 = {paddrModule_io_violationMmask_1_7,paddrModule_io_violationMmask_1_6,
    paddrModule_io_violationMmask_1_5,paddrModule_io_violationMmask_1_4,paddrModule_io_violationMmask_1_3,
    paddrModule_io_violationMmask_1_2,paddrModule_io_violationMmask_1_1,paddrModule_io_violationMmask_1_0}; // @[LoadQueueRAW.scala 222:66]
  wire [7:0] _addrMaskMatch_T_4 = {maskModule_io_violationMmask_1_7,maskModule_io_violationMmask_1_6,
    maskModule_io_violationMmask_1_5,maskModule_io_violationMmask_1_4,maskModule_io_violationMmask_1_3,
    maskModule_io_violationMmask_1_2,maskModule_io_violationMmask_1_1,maskModule_io_violationMmask_1_0}; // @[LoadQueueRAW.scala 222:107]
  reg [7:0] addrMaskMatch_1; // @[LoadQueueRAW.scala 222:32]
  wire  entryNeedCheck_differentFlag_8 = uop_0_robIdx_flag ^ io_storeIn_1_bits_uop_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  entryNeedCheck_compare_8 = uop_0_robIdx_value > io_storeIn_1_bits_uop_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _entryNeedCheck_T_24 = entryNeedCheck_differentFlag_8 ^ entryNeedCheck_compare_8; // @[CircularQueuePtr.scala 88:19]
  wire  entryNeedCheck_differentFlag_9 = uop_1_robIdx_flag ^ io_storeIn_1_bits_uop_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  entryNeedCheck_compare_9 = uop_1_robIdx_value > io_storeIn_1_bits_uop_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _entryNeedCheck_T_27 = entryNeedCheck_differentFlag_9 ^ entryNeedCheck_compare_9; // @[CircularQueuePtr.scala 88:19]
  wire  entryNeedCheck_differentFlag_10 = uop_2_robIdx_flag ^ io_storeIn_1_bits_uop_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  entryNeedCheck_compare_10 = uop_2_robIdx_value > io_storeIn_1_bits_uop_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _entryNeedCheck_T_30 = entryNeedCheck_differentFlag_10 ^ entryNeedCheck_compare_10; // @[CircularQueuePtr.scala 88:19]
  wire  entryNeedCheck_differentFlag_11 = uop_3_robIdx_flag ^ io_storeIn_1_bits_uop_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  entryNeedCheck_compare_11 = uop_3_robIdx_value > io_storeIn_1_bits_uop_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _entryNeedCheck_T_33 = entryNeedCheck_differentFlag_11 ^ entryNeedCheck_compare_11; // @[CircularQueuePtr.scala 88:19]
  wire  entryNeedCheck_differentFlag_12 = uop_4_robIdx_flag ^ io_storeIn_1_bits_uop_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  entryNeedCheck_compare_12 = uop_4_robIdx_value > io_storeIn_1_bits_uop_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _entryNeedCheck_T_36 = entryNeedCheck_differentFlag_12 ^ entryNeedCheck_compare_12; // @[CircularQueuePtr.scala 88:19]
  wire  entryNeedCheck_differentFlag_13 = uop_5_robIdx_flag ^ io_storeIn_1_bits_uop_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  entryNeedCheck_compare_13 = uop_5_robIdx_value > io_storeIn_1_bits_uop_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _entryNeedCheck_T_39 = entryNeedCheck_differentFlag_13 ^ entryNeedCheck_compare_13; // @[CircularQueuePtr.scala 88:19]
  wire  entryNeedCheck_differentFlag_14 = uop_6_robIdx_flag ^ io_storeIn_1_bits_uop_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  entryNeedCheck_compare_14 = uop_6_robIdx_value > io_storeIn_1_bits_uop_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _entryNeedCheck_T_42 = entryNeedCheck_differentFlag_14 ^ entryNeedCheck_compare_14; // @[CircularQueuePtr.scala 88:19]
  wire  entryNeedCheck_differentFlag_15 = uop_7_robIdx_flag ^ io_storeIn_1_bits_uop_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  entryNeedCheck_compare_15 = uop_7_robIdx_value > io_storeIn_1_bits_uop_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _entryNeedCheck_T_45 = entryNeedCheck_differentFlag_15 ^ entryNeedCheck_compare_15; // @[CircularQueuePtr.scala 88:19]
  reg  entryNeedCheck_1_0; // @[LoadQueueRAW.scala 223:33]
  reg  entryNeedCheck_1_1; // @[LoadQueueRAW.scala 223:33]
  reg  entryNeedCheck_1_2; // @[LoadQueueRAW.scala 223:33]
  reg  entryNeedCheck_1_3; // @[LoadQueueRAW.scala 223:33]
  reg  entryNeedCheck_1_4; // @[LoadQueueRAW.scala 223:33]
  reg  entryNeedCheck_1_5; // @[LoadQueueRAW.scala 223:33]
  reg  entryNeedCheck_1_6; // @[LoadQueueRAW.scala 223:33]
  reg  entryNeedCheck_1_7; // @[LoadQueueRAW.scala 223:33]
  wire  lqViolationVec_1_0 = addrMaskMatch_1[0] & entryNeedCheck_1_0; // @[LoadQueueRAW.scala 227:24]
  wire  lqViolationVec_1_1 = addrMaskMatch_1[1] & entryNeedCheck_1_1; // @[LoadQueueRAW.scala 227:24]
  wire  lqViolationVec_1_2 = addrMaskMatch_1[2] & entryNeedCheck_1_2; // @[LoadQueueRAW.scala 227:24]
  wire  lqViolationVec_1_3 = addrMaskMatch_1[3] & entryNeedCheck_1_3; // @[LoadQueueRAW.scala 227:24]
  wire  lqViolationVec_1_4 = addrMaskMatch_1[4] & entryNeedCheck_1_4; // @[LoadQueueRAW.scala 227:24]
  wire  lqViolationVec_1_5 = addrMaskMatch_1[5] & entryNeedCheck_1_5; // @[LoadQueueRAW.scala 227:24]
  wire  lqViolationVec_1_6 = addrMaskMatch_1[6] & entryNeedCheck_1_6; // @[LoadQueueRAW.scala 227:24]
  wire  lqViolationVec_1_7 = addrMaskMatch_1[7] & entryNeedCheck_1_7; // @[LoadQueueRAW.scala 227:24]
  wire [7:0] _lqViolation_T_3 = {lqViolationVec_1_7,lqViolationVec_1_6,lqViolationVec_1_5,lqViolationVec_1_4,
    lqViolationVec_1_3,lqViolationVec_1_2,lqViolationVec_1_1,lqViolationVec_1_0}; // @[LoadQueueRAW.scala 229:38]
  reg  lqViolation_REG_1; // @[LoadQueueRAW.scala 229:59]
  wire  lqViolation_1 = |_lqViolation_T_3 & lqViolation_REG_1; // @[LoadQueueRAW.scala 229:49]
  wire  _lqViolationUop_oldest_T_44_valid = _lqViolationUop_oldest_T_1 ? lqViolationVec_1_1 : lqViolationVec_1_0; // @[LoadQueueRAW.scala 209:49]
  wire  _lqViolationUop_oldest_T_47_valid = lqViolationVec_1_0 & ~lqViolationVec_1_1 ? lqViolationVec_1_0 :
    lqViolationVec_1_1; // @[LoadQueueRAW.scala 209:119]
  wire [9:0] _lqViolationUop_oldest_T_47_bits_uop_cf_foldpc = lqViolationVec_1_0 & ~lqViolationVec_1_1 ? uop_0_cf_foldpc
     : uop_1_cf_foldpc; // @[LoadQueueRAW.scala 209:119]
  wire  _lqViolationUop_oldest_T_47_bits_uop_cf_ftqPtr_flag = lqViolationVec_1_0 & ~lqViolationVec_1_1 ?
    uop_0_cf_ftqPtr_flag : uop_1_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 209:119]
  wire [2:0] _lqViolationUop_oldest_T_47_bits_uop_cf_ftqPtr_value = lqViolationVec_1_0 & ~lqViolationVec_1_1 ?
    uop_0_cf_ftqPtr_value : uop_1_cf_ftqPtr_value; // @[LoadQueueRAW.scala 209:119]
  wire [2:0] _lqViolationUop_oldest_T_47_bits_uop_cf_ftqOffset = lqViolationVec_1_0 & ~lqViolationVec_1_1 ?
    uop_0_cf_ftqOffset : uop_1_cf_ftqOffset; // @[LoadQueueRAW.scala 209:119]
  wire  _lqViolationUop_oldest_T_47_bits_uop_robIdx_flag = lqViolationVec_1_0 & ~lqViolationVec_1_1 ? uop_0_robIdx_flag
     : uop_1_robIdx_flag; // @[LoadQueueRAW.scala 209:119]
  wire [4:0] _lqViolationUop_oldest_T_47_bits_uop_robIdx_value = lqViolationVec_1_0 & ~lqViolationVec_1_1 ?
    uop_0_robIdx_value : uop_1_robIdx_value; // @[LoadQueueRAW.scala 209:119]
  wire  lqViolationUop_oldest_7_valid = lqViolationVec_1_0 & lqViolationVec_1_1 ? _lqViolationUop_oldest_T_44_valid :
    _lqViolationUop_oldest_T_47_valid; // @[LoadQueueRAW.scala 209:23]
  wire [9:0] lqViolationUop_oldest_7_bits_uop_cf_foldpc = lqViolationVec_1_0 & lqViolationVec_1_1 ?
    _lqViolationUop_oldest_T_2_bits_uop_cf_foldpc : _lqViolationUop_oldest_T_47_bits_uop_cf_foldpc; // @[LoadQueueRAW.scala 209:23]
  wire  lqViolationUop_oldest_7_bits_uop_cf_ftqPtr_flag = lqViolationVec_1_0 & lqViolationVec_1_1 ?
    _lqViolationUop_oldest_T_2_bits_uop_cf_ftqPtr_flag : _lqViolationUop_oldest_T_47_bits_uop_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 209:23]
  wire [2:0] lqViolationUop_oldest_7_bits_uop_cf_ftqPtr_value = lqViolationVec_1_0 & lqViolationVec_1_1 ?
    _lqViolationUop_oldest_T_2_bits_uop_cf_ftqPtr_value : _lqViolationUop_oldest_T_47_bits_uop_cf_ftqPtr_value; // @[LoadQueueRAW.scala 209:23]
  wire [2:0] lqViolationUop_oldest_7_bits_uop_cf_ftqOffset = lqViolationVec_1_0 & lqViolationVec_1_1 ?
    _lqViolationUop_oldest_T_2_bits_uop_cf_ftqOffset : _lqViolationUop_oldest_T_47_bits_uop_cf_ftqOffset; // @[LoadQueueRAW.scala 209:23]
  wire  lqViolationUop_oldest_7_bits_uop_robIdx_flag = lqViolationVec_1_0 & lqViolationVec_1_1 ?
    _lqViolationUop_oldest_T_2_bits_uop_robIdx_flag : _lqViolationUop_oldest_T_47_bits_uop_robIdx_flag; // @[LoadQueueRAW.scala 209:23]
  wire [4:0] lqViolationUop_oldest_7_bits_uop_robIdx_value = lqViolationVec_1_0 & lqViolationVec_1_1 ?
    _lqViolationUop_oldest_T_2_bits_uop_robIdx_value : _lqViolationUop_oldest_T_47_bits_uop_robIdx_value; // @[LoadQueueRAW.scala 209:23]
  wire  _lqViolationUop_oldest_T_50_valid = _lqViolationUop_oldest_T_7 ? lqViolationVec_1_3 : lqViolationVec_1_2; // @[LoadQueueRAW.scala 209:49]
  wire  _lqViolationUop_oldest_T_53_valid = lqViolationVec_1_2 & ~lqViolationVec_1_3 ? lqViolationVec_1_2 :
    lqViolationVec_1_3; // @[LoadQueueRAW.scala 209:119]
  wire [9:0] _lqViolationUop_oldest_T_53_bits_uop_cf_foldpc = lqViolationVec_1_2 & ~lqViolationVec_1_3 ? uop_2_cf_foldpc
     : uop_3_cf_foldpc; // @[LoadQueueRAW.scala 209:119]
  wire  _lqViolationUop_oldest_T_53_bits_uop_cf_ftqPtr_flag = lqViolationVec_1_2 & ~lqViolationVec_1_3 ?
    uop_2_cf_ftqPtr_flag : uop_3_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 209:119]
  wire [2:0] _lqViolationUop_oldest_T_53_bits_uop_cf_ftqPtr_value = lqViolationVec_1_2 & ~lqViolationVec_1_3 ?
    uop_2_cf_ftqPtr_value : uop_3_cf_ftqPtr_value; // @[LoadQueueRAW.scala 209:119]
  wire [2:0] _lqViolationUop_oldest_T_53_bits_uop_cf_ftqOffset = lqViolationVec_1_2 & ~lqViolationVec_1_3 ?
    uop_2_cf_ftqOffset : uop_3_cf_ftqOffset; // @[LoadQueueRAW.scala 209:119]
  wire  _lqViolationUop_oldest_T_53_bits_uop_robIdx_flag = lqViolationVec_1_2 & ~lqViolationVec_1_3 ? uop_2_robIdx_flag
     : uop_3_robIdx_flag; // @[LoadQueueRAW.scala 209:119]
  wire [4:0] _lqViolationUop_oldest_T_53_bits_uop_robIdx_value = lqViolationVec_1_2 & ~lqViolationVec_1_3 ?
    uop_2_robIdx_value : uop_3_robIdx_value; // @[LoadQueueRAW.scala 209:119]
  wire  lqViolationUop_oldest_8_valid = lqViolationVec_1_2 & lqViolationVec_1_3 ? _lqViolationUop_oldest_T_50_valid :
    _lqViolationUop_oldest_T_53_valid; // @[LoadQueueRAW.scala 209:23]
  wire [9:0] lqViolationUop_oldest_8_bits_uop_cf_foldpc = lqViolationVec_1_2 & lqViolationVec_1_3 ?
    _lqViolationUop_oldest_T_8_bits_uop_cf_foldpc : _lqViolationUop_oldest_T_53_bits_uop_cf_foldpc; // @[LoadQueueRAW.scala 209:23]
  wire  lqViolationUop_oldest_8_bits_uop_cf_ftqPtr_flag = lqViolationVec_1_2 & lqViolationVec_1_3 ?
    _lqViolationUop_oldest_T_8_bits_uop_cf_ftqPtr_flag : _lqViolationUop_oldest_T_53_bits_uop_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 209:23]
  wire [2:0] lqViolationUop_oldest_8_bits_uop_cf_ftqPtr_value = lqViolationVec_1_2 & lqViolationVec_1_3 ?
    _lqViolationUop_oldest_T_8_bits_uop_cf_ftqPtr_value : _lqViolationUop_oldest_T_53_bits_uop_cf_ftqPtr_value; // @[LoadQueueRAW.scala 209:23]
  wire [2:0] lqViolationUop_oldest_8_bits_uop_cf_ftqOffset = lqViolationVec_1_2 & lqViolationVec_1_3 ?
    _lqViolationUop_oldest_T_8_bits_uop_cf_ftqOffset : _lqViolationUop_oldest_T_53_bits_uop_cf_ftqOffset; // @[LoadQueueRAW.scala 209:23]
  wire  lqViolationUop_oldest_8_bits_uop_robIdx_flag = lqViolationVec_1_2 & lqViolationVec_1_3 ?
    _lqViolationUop_oldest_T_8_bits_uop_robIdx_flag : _lqViolationUop_oldest_T_53_bits_uop_robIdx_flag; // @[LoadQueueRAW.scala 209:23]
  wire [4:0] lqViolationUop_oldest_8_bits_uop_robIdx_value = lqViolationVec_1_2 & lqViolationVec_1_3 ?
    _lqViolationUop_oldest_T_8_bits_uop_robIdx_value : _lqViolationUop_oldest_T_53_bits_uop_robIdx_value; // @[LoadQueueRAW.scala 209:23]
  wire  lqViolationUop_oldest_differentFlag_9 = lqViolationUop_oldest_7_bits_uop_robIdx_flag ^
    lqViolationUop_oldest_8_bits_uop_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  lqViolationUop_oldest_compare_9 = lqViolationUop_oldest_7_bits_uop_robIdx_value >
    lqViolationUop_oldest_8_bits_uop_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _lqViolationUop_oldest_T_55 = lqViolationUop_oldest_differentFlag_9 ^ lqViolationUop_oldest_compare_9; // @[CircularQueuePtr.scala 88:19]
  wire  _lqViolationUop_oldest_T_56_valid = _lqViolationUop_oldest_T_55 ? lqViolationUop_oldest_8_valid :
    lqViolationUop_oldest_7_valid; // @[LoadQueueRAW.scala 209:49]
  wire [9:0] _lqViolationUop_oldest_T_56_bits_uop_cf_foldpc = _lqViolationUop_oldest_T_55 ?
    lqViolationUop_oldest_8_bits_uop_cf_foldpc : lqViolationUop_oldest_7_bits_uop_cf_foldpc; // @[LoadQueueRAW.scala 209:49]
  wire  _lqViolationUop_oldest_T_56_bits_uop_cf_ftqPtr_flag = _lqViolationUop_oldest_T_55 ?
    lqViolationUop_oldest_8_bits_uop_cf_ftqPtr_flag : lqViolationUop_oldest_7_bits_uop_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 209:49]
  wire [2:0] _lqViolationUop_oldest_T_56_bits_uop_cf_ftqPtr_value = _lqViolationUop_oldest_T_55 ?
    lqViolationUop_oldest_8_bits_uop_cf_ftqPtr_value : lqViolationUop_oldest_7_bits_uop_cf_ftqPtr_value; // @[LoadQueueRAW.scala 209:49]
  wire [2:0] _lqViolationUop_oldest_T_56_bits_uop_cf_ftqOffset = _lqViolationUop_oldest_T_55 ?
    lqViolationUop_oldest_8_bits_uop_cf_ftqOffset : lqViolationUop_oldest_7_bits_uop_cf_ftqOffset; // @[LoadQueueRAW.scala 209:49]
  wire  _lqViolationUop_oldest_T_56_bits_uop_robIdx_flag = _lqViolationUop_oldest_T_55 ?
    lqViolationUop_oldest_8_bits_uop_robIdx_flag : lqViolationUop_oldest_7_bits_uop_robIdx_flag; // @[LoadQueueRAW.scala 209:49]
  wire [4:0] _lqViolationUop_oldest_T_56_bits_uop_robIdx_value = _lqViolationUop_oldest_T_55 ?
    lqViolationUop_oldest_8_bits_uop_robIdx_value : lqViolationUop_oldest_7_bits_uop_robIdx_value; // @[LoadQueueRAW.scala 209:49]
  wire  _lqViolationUop_oldest_T_59_valid = lqViolationUop_oldest_7_valid & ~lqViolationUop_oldest_8_valid ?
    lqViolationUop_oldest_7_valid : lqViolationUop_oldest_8_valid; // @[LoadQueueRAW.scala 209:119]
  wire [9:0] _lqViolationUop_oldest_T_59_bits_uop_cf_foldpc = lqViolationUop_oldest_7_valid & ~
    lqViolationUop_oldest_8_valid ? lqViolationUop_oldest_7_bits_uop_cf_foldpc :
    lqViolationUop_oldest_8_bits_uop_cf_foldpc; // @[LoadQueueRAW.scala 209:119]
  wire  _lqViolationUop_oldest_T_59_bits_uop_cf_ftqPtr_flag = lqViolationUop_oldest_7_valid & ~
    lqViolationUop_oldest_8_valid ? lqViolationUop_oldest_7_bits_uop_cf_ftqPtr_flag :
    lqViolationUop_oldest_8_bits_uop_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 209:119]
  wire [2:0] _lqViolationUop_oldest_T_59_bits_uop_cf_ftqPtr_value = lqViolationUop_oldest_7_valid & ~
    lqViolationUop_oldest_8_valid ? lqViolationUop_oldest_7_bits_uop_cf_ftqPtr_value :
    lqViolationUop_oldest_8_bits_uop_cf_ftqPtr_value; // @[LoadQueueRAW.scala 209:119]
  wire [2:0] _lqViolationUop_oldest_T_59_bits_uop_cf_ftqOffset = lqViolationUop_oldest_7_valid & ~
    lqViolationUop_oldest_8_valid ? lqViolationUop_oldest_7_bits_uop_cf_ftqOffset :
    lqViolationUop_oldest_8_bits_uop_cf_ftqOffset; // @[LoadQueueRAW.scala 209:119]
  wire  _lqViolationUop_oldest_T_59_bits_uop_robIdx_flag = lqViolationUop_oldest_7_valid & ~
    lqViolationUop_oldest_8_valid ? lqViolationUop_oldest_7_bits_uop_robIdx_flag :
    lqViolationUop_oldest_8_bits_uop_robIdx_flag; // @[LoadQueueRAW.scala 209:119]
  wire [4:0] _lqViolationUop_oldest_T_59_bits_uop_robIdx_value = lqViolationUop_oldest_7_valid & ~
    lqViolationUop_oldest_8_valid ? lqViolationUop_oldest_7_bits_uop_robIdx_value :
    lqViolationUop_oldest_8_bits_uop_robIdx_value; // @[LoadQueueRAW.scala 209:119]
  wire  lqViolationUop_oldest_9_valid = lqViolationUop_oldest_7_valid & lqViolationUop_oldest_8_valid ?
    _lqViolationUop_oldest_T_56_valid : _lqViolationUop_oldest_T_59_valid; // @[LoadQueueRAW.scala 209:23]
  wire [9:0] lqViolationUop_oldest_9_bits_uop_cf_foldpc = lqViolationUop_oldest_7_valid & lqViolationUop_oldest_8_valid
     ? _lqViolationUop_oldest_T_56_bits_uop_cf_foldpc : _lqViolationUop_oldest_T_59_bits_uop_cf_foldpc; // @[LoadQueueRAW.scala 209:23]
  wire  lqViolationUop_oldest_9_bits_uop_cf_ftqPtr_flag = lqViolationUop_oldest_7_valid & lqViolationUop_oldest_8_valid
     ? _lqViolationUop_oldest_T_56_bits_uop_cf_ftqPtr_flag : _lqViolationUop_oldest_T_59_bits_uop_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 209:23]
  wire [2:0] lqViolationUop_oldest_9_bits_uop_cf_ftqPtr_value = lqViolationUop_oldest_7_valid &
    lqViolationUop_oldest_8_valid ? _lqViolationUop_oldest_T_56_bits_uop_cf_ftqPtr_value :
    _lqViolationUop_oldest_T_59_bits_uop_cf_ftqPtr_value; // @[LoadQueueRAW.scala 209:23]
  wire [2:0] lqViolationUop_oldest_9_bits_uop_cf_ftqOffset = lqViolationUop_oldest_7_valid &
    lqViolationUop_oldest_8_valid ? _lqViolationUop_oldest_T_56_bits_uop_cf_ftqOffset :
    _lqViolationUop_oldest_T_59_bits_uop_cf_ftqOffset; // @[LoadQueueRAW.scala 209:23]
  wire  lqViolationUop_oldest_9_bits_uop_robIdx_flag = lqViolationUop_oldest_7_valid & lqViolationUop_oldest_8_valid ?
    _lqViolationUop_oldest_T_56_bits_uop_robIdx_flag : _lqViolationUop_oldest_T_59_bits_uop_robIdx_flag; // @[LoadQueueRAW.scala 209:23]
  wire [4:0] lqViolationUop_oldest_9_bits_uop_robIdx_value = lqViolationUop_oldest_7_valid &
    lqViolationUop_oldest_8_valid ? _lqViolationUop_oldest_T_56_bits_uop_robIdx_value :
    _lqViolationUop_oldest_T_59_bits_uop_robIdx_value; // @[LoadQueueRAW.scala 209:23]
  wire  _lqViolationUop_oldest_T_62_valid = _lqViolationUop_oldest_T_19 ? lqViolationVec_1_5 : lqViolationVec_1_4; // @[LoadQueueRAW.scala 209:49]
  wire  _lqViolationUop_oldest_T_65_valid = lqViolationVec_1_4 & ~lqViolationVec_1_5 ? lqViolationVec_1_4 :
    lqViolationVec_1_5; // @[LoadQueueRAW.scala 209:119]
  wire [9:0] _lqViolationUop_oldest_T_65_bits_uop_cf_foldpc = lqViolationVec_1_4 & ~lqViolationVec_1_5 ? uop_4_cf_foldpc
     : uop_5_cf_foldpc; // @[LoadQueueRAW.scala 209:119]
  wire  _lqViolationUop_oldest_T_65_bits_uop_cf_ftqPtr_flag = lqViolationVec_1_4 & ~lqViolationVec_1_5 ?
    uop_4_cf_ftqPtr_flag : uop_5_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 209:119]
  wire [2:0] _lqViolationUop_oldest_T_65_bits_uop_cf_ftqPtr_value = lqViolationVec_1_4 & ~lqViolationVec_1_5 ?
    uop_4_cf_ftqPtr_value : uop_5_cf_ftqPtr_value; // @[LoadQueueRAW.scala 209:119]
  wire [2:0] _lqViolationUop_oldest_T_65_bits_uop_cf_ftqOffset = lqViolationVec_1_4 & ~lqViolationVec_1_5 ?
    uop_4_cf_ftqOffset : uop_5_cf_ftqOffset; // @[LoadQueueRAW.scala 209:119]
  wire  _lqViolationUop_oldest_T_65_bits_uop_robIdx_flag = lqViolationVec_1_4 & ~lqViolationVec_1_5 ? uop_4_robIdx_flag
     : uop_5_robIdx_flag; // @[LoadQueueRAW.scala 209:119]
  wire [4:0] _lqViolationUop_oldest_T_65_bits_uop_robIdx_value = lqViolationVec_1_4 & ~lqViolationVec_1_5 ?
    uop_4_robIdx_value : uop_5_robIdx_value; // @[LoadQueueRAW.scala 209:119]
  wire  lqViolationUop_oldest_10_valid = lqViolationVec_1_4 & lqViolationVec_1_5 ? _lqViolationUop_oldest_T_62_valid :
    _lqViolationUop_oldest_T_65_valid; // @[LoadQueueRAW.scala 209:23]
  wire [9:0] lqViolationUop_oldest_10_bits_uop_cf_foldpc = lqViolationVec_1_4 & lqViolationVec_1_5 ?
    _lqViolationUop_oldest_T_20_bits_uop_cf_foldpc : _lqViolationUop_oldest_T_65_bits_uop_cf_foldpc; // @[LoadQueueRAW.scala 209:23]
  wire  lqViolationUop_oldest_10_bits_uop_cf_ftqPtr_flag = lqViolationVec_1_4 & lqViolationVec_1_5 ?
    _lqViolationUop_oldest_T_20_bits_uop_cf_ftqPtr_flag : _lqViolationUop_oldest_T_65_bits_uop_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 209:23]
  wire [2:0] lqViolationUop_oldest_10_bits_uop_cf_ftqPtr_value = lqViolationVec_1_4 & lqViolationVec_1_5 ?
    _lqViolationUop_oldest_T_20_bits_uop_cf_ftqPtr_value : _lqViolationUop_oldest_T_65_bits_uop_cf_ftqPtr_value; // @[LoadQueueRAW.scala 209:23]
  wire [2:0] lqViolationUop_oldest_10_bits_uop_cf_ftqOffset = lqViolationVec_1_4 & lqViolationVec_1_5 ?
    _lqViolationUop_oldest_T_20_bits_uop_cf_ftqOffset : _lqViolationUop_oldest_T_65_bits_uop_cf_ftqOffset; // @[LoadQueueRAW.scala 209:23]
  wire  lqViolationUop_oldest_10_bits_uop_robIdx_flag = lqViolationVec_1_4 & lqViolationVec_1_5 ?
    _lqViolationUop_oldest_T_20_bits_uop_robIdx_flag : _lqViolationUop_oldest_T_65_bits_uop_robIdx_flag; // @[LoadQueueRAW.scala 209:23]
  wire [4:0] lqViolationUop_oldest_10_bits_uop_robIdx_value = lqViolationVec_1_4 & lqViolationVec_1_5 ?
    _lqViolationUop_oldest_T_20_bits_uop_robIdx_value : _lqViolationUop_oldest_T_65_bits_uop_robIdx_value; // @[LoadQueueRAW.scala 209:23]
  wire  _lqViolationUop_oldest_T_68_valid = _lqViolationUop_oldest_T_25 ? lqViolationVec_1_7 : lqViolationVec_1_6; // @[LoadQueueRAW.scala 209:49]
  wire  _lqViolationUop_oldest_T_71_valid = lqViolationVec_1_6 & ~lqViolationVec_1_7 ? lqViolationVec_1_6 :
    lqViolationVec_1_7; // @[LoadQueueRAW.scala 209:119]
  wire [9:0] _lqViolationUop_oldest_T_71_bits_uop_cf_foldpc = lqViolationVec_1_6 & ~lqViolationVec_1_7 ? uop_6_cf_foldpc
     : uop_7_cf_foldpc; // @[LoadQueueRAW.scala 209:119]
  wire  _lqViolationUop_oldest_T_71_bits_uop_cf_ftqPtr_flag = lqViolationVec_1_6 & ~lqViolationVec_1_7 ?
    uop_6_cf_ftqPtr_flag : uop_7_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 209:119]
  wire [2:0] _lqViolationUop_oldest_T_71_bits_uop_cf_ftqPtr_value = lqViolationVec_1_6 & ~lqViolationVec_1_7 ?
    uop_6_cf_ftqPtr_value : uop_7_cf_ftqPtr_value; // @[LoadQueueRAW.scala 209:119]
  wire [2:0] _lqViolationUop_oldest_T_71_bits_uop_cf_ftqOffset = lqViolationVec_1_6 & ~lqViolationVec_1_7 ?
    uop_6_cf_ftqOffset : uop_7_cf_ftqOffset; // @[LoadQueueRAW.scala 209:119]
  wire  _lqViolationUop_oldest_T_71_bits_uop_robIdx_flag = lqViolationVec_1_6 & ~lqViolationVec_1_7 ? uop_6_robIdx_flag
     : uop_7_robIdx_flag; // @[LoadQueueRAW.scala 209:119]
  wire [4:0] _lqViolationUop_oldest_T_71_bits_uop_robIdx_value = lqViolationVec_1_6 & ~lqViolationVec_1_7 ?
    uop_6_robIdx_value : uop_7_robIdx_value; // @[LoadQueueRAW.scala 209:119]
  wire  lqViolationUop_oldest_11_valid = lqViolationVec_1_6 & lqViolationVec_1_7 ? _lqViolationUop_oldest_T_68_valid :
    _lqViolationUop_oldest_T_71_valid; // @[LoadQueueRAW.scala 209:23]
  wire [9:0] lqViolationUop_oldest_11_bits_uop_cf_foldpc = lqViolationVec_1_6 & lqViolationVec_1_7 ?
    _lqViolationUop_oldest_T_26_bits_uop_cf_foldpc : _lqViolationUop_oldest_T_71_bits_uop_cf_foldpc; // @[LoadQueueRAW.scala 209:23]
  wire  lqViolationUop_oldest_11_bits_uop_cf_ftqPtr_flag = lqViolationVec_1_6 & lqViolationVec_1_7 ?
    _lqViolationUop_oldest_T_26_bits_uop_cf_ftqPtr_flag : _lqViolationUop_oldest_T_71_bits_uop_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 209:23]
  wire [2:0] lqViolationUop_oldest_11_bits_uop_cf_ftqPtr_value = lqViolationVec_1_6 & lqViolationVec_1_7 ?
    _lqViolationUop_oldest_T_26_bits_uop_cf_ftqPtr_value : _lqViolationUop_oldest_T_71_bits_uop_cf_ftqPtr_value; // @[LoadQueueRAW.scala 209:23]
  wire [2:0] lqViolationUop_oldest_11_bits_uop_cf_ftqOffset = lqViolationVec_1_6 & lqViolationVec_1_7 ?
    _lqViolationUop_oldest_T_26_bits_uop_cf_ftqOffset : _lqViolationUop_oldest_T_71_bits_uop_cf_ftqOffset; // @[LoadQueueRAW.scala 209:23]
  wire  lqViolationUop_oldest_11_bits_uop_robIdx_flag = lqViolationVec_1_6 & lqViolationVec_1_7 ?
    _lqViolationUop_oldest_T_26_bits_uop_robIdx_flag : _lqViolationUop_oldest_T_71_bits_uop_robIdx_flag; // @[LoadQueueRAW.scala 209:23]
  wire [4:0] lqViolationUop_oldest_11_bits_uop_robIdx_value = lqViolationVec_1_6 & lqViolationVec_1_7 ?
    _lqViolationUop_oldest_T_26_bits_uop_robIdx_value : _lqViolationUop_oldest_T_71_bits_uop_robIdx_value; // @[LoadQueueRAW.scala 209:23]
  wire  lqViolationUop_oldest_differentFlag_12 = lqViolationUop_oldest_10_bits_uop_robIdx_flag ^
    lqViolationUop_oldest_11_bits_uop_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  lqViolationUop_oldest_compare_12 = lqViolationUop_oldest_10_bits_uop_robIdx_value >
    lqViolationUop_oldest_11_bits_uop_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _lqViolationUop_oldest_T_73 = lqViolationUop_oldest_differentFlag_12 ^ lqViolationUop_oldest_compare_12; // @[CircularQueuePtr.scala 88:19]
  wire  _lqViolationUop_oldest_T_74_valid = _lqViolationUop_oldest_T_73 ? lqViolationUop_oldest_11_valid :
    lqViolationUop_oldest_10_valid; // @[LoadQueueRAW.scala 209:49]
  wire [9:0] _lqViolationUop_oldest_T_74_bits_uop_cf_foldpc = _lqViolationUop_oldest_T_73 ?
    lqViolationUop_oldest_11_bits_uop_cf_foldpc : lqViolationUop_oldest_10_bits_uop_cf_foldpc; // @[LoadQueueRAW.scala 209:49]
  wire  _lqViolationUop_oldest_T_74_bits_uop_cf_ftqPtr_flag = _lqViolationUop_oldest_T_73 ?
    lqViolationUop_oldest_11_bits_uop_cf_ftqPtr_flag : lqViolationUop_oldest_10_bits_uop_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 209:49]
  wire [2:0] _lqViolationUop_oldest_T_74_bits_uop_cf_ftqPtr_value = _lqViolationUop_oldest_T_73 ?
    lqViolationUop_oldest_11_bits_uop_cf_ftqPtr_value : lqViolationUop_oldest_10_bits_uop_cf_ftqPtr_value; // @[LoadQueueRAW.scala 209:49]
  wire [2:0] _lqViolationUop_oldest_T_74_bits_uop_cf_ftqOffset = _lqViolationUop_oldest_T_73 ?
    lqViolationUop_oldest_11_bits_uop_cf_ftqOffset : lqViolationUop_oldest_10_bits_uop_cf_ftqOffset; // @[LoadQueueRAW.scala 209:49]
  wire  _lqViolationUop_oldest_T_74_bits_uop_robIdx_flag = _lqViolationUop_oldest_T_73 ?
    lqViolationUop_oldest_11_bits_uop_robIdx_flag : lqViolationUop_oldest_10_bits_uop_robIdx_flag; // @[LoadQueueRAW.scala 209:49]
  wire [4:0] _lqViolationUop_oldest_T_74_bits_uop_robIdx_value = _lqViolationUop_oldest_T_73 ?
    lqViolationUop_oldest_11_bits_uop_robIdx_value : lqViolationUop_oldest_10_bits_uop_robIdx_value; // @[LoadQueueRAW.scala 209:49]
  wire  _lqViolationUop_oldest_T_77_valid = lqViolationUop_oldest_10_valid & ~lqViolationUop_oldest_11_valid ?
    lqViolationUop_oldest_10_valid : lqViolationUop_oldest_11_valid; // @[LoadQueueRAW.scala 209:119]
  wire [9:0] _lqViolationUop_oldest_T_77_bits_uop_cf_foldpc = lqViolationUop_oldest_10_valid & ~
    lqViolationUop_oldest_11_valid ? lqViolationUop_oldest_10_bits_uop_cf_foldpc :
    lqViolationUop_oldest_11_bits_uop_cf_foldpc; // @[LoadQueueRAW.scala 209:119]
  wire  _lqViolationUop_oldest_T_77_bits_uop_cf_ftqPtr_flag = lqViolationUop_oldest_10_valid & ~
    lqViolationUop_oldest_11_valid ? lqViolationUop_oldest_10_bits_uop_cf_ftqPtr_flag :
    lqViolationUop_oldest_11_bits_uop_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 209:119]
  wire [2:0] _lqViolationUop_oldest_T_77_bits_uop_cf_ftqPtr_value = lqViolationUop_oldest_10_valid & ~
    lqViolationUop_oldest_11_valid ? lqViolationUop_oldest_10_bits_uop_cf_ftqPtr_value :
    lqViolationUop_oldest_11_bits_uop_cf_ftqPtr_value; // @[LoadQueueRAW.scala 209:119]
  wire [2:0] _lqViolationUop_oldest_T_77_bits_uop_cf_ftqOffset = lqViolationUop_oldest_10_valid & ~
    lqViolationUop_oldest_11_valid ? lqViolationUop_oldest_10_bits_uop_cf_ftqOffset :
    lqViolationUop_oldest_11_bits_uop_cf_ftqOffset; // @[LoadQueueRAW.scala 209:119]
  wire  _lqViolationUop_oldest_T_77_bits_uop_robIdx_flag = lqViolationUop_oldest_10_valid & ~
    lqViolationUop_oldest_11_valid ? lqViolationUop_oldest_10_bits_uop_robIdx_flag :
    lqViolationUop_oldest_11_bits_uop_robIdx_flag; // @[LoadQueueRAW.scala 209:119]
  wire [4:0] _lqViolationUop_oldest_T_77_bits_uop_robIdx_value = lqViolationUop_oldest_10_valid & ~
    lqViolationUop_oldest_11_valid ? lqViolationUop_oldest_10_bits_uop_robIdx_value :
    lqViolationUop_oldest_11_bits_uop_robIdx_value; // @[LoadQueueRAW.scala 209:119]
  wire  lqViolationUop_oldest_12_valid = lqViolationUop_oldest_10_valid & lqViolationUop_oldest_11_valid ?
    _lqViolationUop_oldest_T_74_valid : _lqViolationUop_oldest_T_77_valid; // @[LoadQueueRAW.scala 209:23]
  wire [9:0] lqViolationUop_oldest_12_bits_uop_cf_foldpc = lqViolationUop_oldest_10_valid &
    lqViolationUop_oldest_11_valid ? _lqViolationUop_oldest_T_74_bits_uop_cf_foldpc :
    _lqViolationUop_oldest_T_77_bits_uop_cf_foldpc; // @[LoadQueueRAW.scala 209:23]
  wire  lqViolationUop_oldest_12_bits_uop_cf_ftqPtr_flag = lqViolationUop_oldest_10_valid &
    lqViolationUop_oldest_11_valid ? _lqViolationUop_oldest_T_74_bits_uop_cf_ftqPtr_flag :
    _lqViolationUop_oldest_T_77_bits_uop_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 209:23]
  wire [2:0] lqViolationUop_oldest_12_bits_uop_cf_ftqPtr_value = lqViolationUop_oldest_10_valid &
    lqViolationUop_oldest_11_valid ? _lqViolationUop_oldest_T_74_bits_uop_cf_ftqPtr_value :
    _lqViolationUop_oldest_T_77_bits_uop_cf_ftqPtr_value; // @[LoadQueueRAW.scala 209:23]
  wire [2:0] lqViolationUop_oldest_12_bits_uop_cf_ftqOffset = lqViolationUop_oldest_10_valid &
    lqViolationUop_oldest_11_valid ? _lqViolationUop_oldest_T_74_bits_uop_cf_ftqOffset :
    _lqViolationUop_oldest_T_77_bits_uop_cf_ftqOffset; // @[LoadQueueRAW.scala 209:23]
  wire  lqViolationUop_oldest_12_bits_uop_robIdx_flag = lqViolationUop_oldest_10_valid & lqViolationUop_oldest_11_valid
     ? _lqViolationUop_oldest_T_74_bits_uop_robIdx_flag : _lqViolationUop_oldest_T_77_bits_uop_robIdx_flag; // @[LoadQueueRAW.scala 209:23]
  wire [4:0] lqViolationUop_oldest_12_bits_uop_robIdx_value = lqViolationUop_oldest_10_valid &
    lqViolationUop_oldest_11_valid ? _lqViolationUop_oldest_T_74_bits_uop_robIdx_value :
    _lqViolationUop_oldest_T_77_bits_uop_robIdx_value; // @[LoadQueueRAW.scala 209:23]
  wire  lqViolationUop_oldest_differentFlag_13 = lqViolationUop_oldest_9_bits_uop_robIdx_flag ^
    lqViolationUop_oldest_12_bits_uop_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  lqViolationUop_oldest_compare_13 = lqViolationUop_oldest_9_bits_uop_robIdx_value >
    lqViolationUop_oldest_12_bits_uop_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _lqViolationUop_oldest_T_79 = lqViolationUop_oldest_differentFlag_13 ^ lqViolationUop_oldest_compare_13; // @[CircularQueuePtr.scala 88:19]
  reg  rollbackLq_1_valid_REG; // @[LoadQueueRAW.scala 259:58]
  wire  rollbackLq_1_valid = lqViolation_1 & rollbackLq_1_valid_REG; // @[LoadQueueRAW.scala 259:48]
  reg [2:0] stFtqIdxS2_1_REG_value; // @[LoadQueueRAW.scala 262:29]
  reg [2:0] stFtqOffsetS2_1_REG; // @[LoadQueueRAW.scala 263:32]
  reg  rollbackLqVReg_0; // @[LoadQueueRAW.scala 266:51]
  reg  rollbackLqVReg_1; // @[LoadQueueRAW.scala 266:51]
  reg [9:0] rollbackLqReg_0_uop_cf_foldpc; // @[Reg.scala 16:16]
  reg  rollbackLqReg_0_uop_cf_ftqPtr_flag; // @[Reg.scala 16:16]
  reg [2:0] rollbackLqReg_0_uop_cf_ftqPtr_value; // @[Reg.scala 16:16]
  reg [2:0] rollbackLqReg_0_uop_cf_ftqOffset; // @[Reg.scala 16:16]
  reg  rollbackLqReg_0_uop_robIdx_flag; // @[Reg.scala 16:16]
  reg [4:0] rollbackLqReg_0_uop_robIdx_value; // @[Reg.scala 16:16]
  reg [9:0] rollbackLqReg_1_uop_cf_foldpc; // @[Reg.scala 16:16]
  reg  rollbackLqReg_1_uop_cf_ftqPtr_flag; // @[Reg.scala 16:16]
  reg [2:0] rollbackLqReg_1_uop_cf_ftqPtr_value; // @[Reg.scala 16:16]
  reg [2:0] rollbackLqReg_1_uop_cf_ftqOffset; // @[Reg.scala 16:16]
  reg  rollbackLqReg_1_uop_robIdx_flag; // @[Reg.scala 16:16]
  reg [4:0] rollbackLqReg_1_uop_robIdx_value; // @[Reg.scala 16:16]
  wire  oldest_differentFlag = rollbackLqReg_0_uop_robIdx_flag ^ rollbackLqReg_1_uop_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  oldest_compare = rollbackLqReg_0_uop_robIdx_value > rollbackLqReg_1_uop_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _oldest_T_1 = oldest_differentFlag ^ oldest_compare; // @[CircularQueuePtr.scala 88:19]
  wire [9:0] _oldest_T_2_bits_uop_cf_foldpc = _oldest_T_1 ? rollbackLqReg_1_uop_cf_foldpc :
    rollbackLqReg_0_uop_cf_foldpc; // @[LoadQueueRAW.scala 209:49]
  wire  _oldest_T_2_bits_uop_cf_ftqPtr_flag = _oldest_T_1 ? rollbackLqReg_1_uop_cf_ftqPtr_flag :
    rollbackLqReg_0_uop_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 209:49]
  wire [2:0] _oldest_T_2_bits_uop_cf_ftqPtr_value = _oldest_T_1 ? rollbackLqReg_1_uop_cf_ftqPtr_value :
    rollbackLqReg_0_uop_cf_ftqPtr_value; // @[LoadQueueRAW.scala 209:49]
  wire [2:0] _oldest_T_2_bits_uop_cf_ftqOffset = _oldest_T_1 ? rollbackLqReg_1_uop_cf_ftqOffset :
    rollbackLqReg_0_uop_cf_ftqOffset; // @[LoadQueueRAW.scala 209:49]
  wire  _oldest_T_2_bits_uop_robIdx_flag = _oldest_T_1 ? rollbackLqReg_1_uop_robIdx_flag :
    rollbackLqReg_0_uop_robIdx_flag; // @[LoadQueueRAW.scala 209:49]
  wire [4:0] _oldest_T_2_bits_uop_robIdx_value = _oldest_T_1 ? rollbackLqReg_1_uop_robIdx_value :
    rollbackLqReg_0_uop_robIdx_value; // @[LoadQueueRAW.scala 209:49]
  wire [9:0] _oldest_T_5_bits_uop_cf_foldpc = rollbackLqVReg_0 & ~rollbackLqVReg_1 ? rollbackLqReg_0_uop_cf_foldpc :
    rollbackLqReg_1_uop_cf_foldpc; // @[LoadQueueRAW.scala 209:119]
  wire  _oldest_T_5_bits_uop_cf_ftqPtr_flag = rollbackLqVReg_0 & ~rollbackLqVReg_1 ? rollbackLqReg_0_uop_cf_ftqPtr_flag
     : rollbackLqReg_1_uop_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 209:119]
  wire [2:0] _oldest_T_5_bits_uop_cf_ftqPtr_value = rollbackLqVReg_0 & ~rollbackLqVReg_1 ?
    rollbackLqReg_0_uop_cf_ftqPtr_value : rollbackLqReg_1_uop_cf_ftqPtr_value; // @[LoadQueueRAW.scala 209:119]
  wire [2:0] _oldest_T_5_bits_uop_cf_ftqOffset = rollbackLqVReg_0 & ~rollbackLqVReg_1 ? rollbackLqReg_0_uop_cf_ftqOffset
     : rollbackLqReg_1_uop_cf_ftqOffset; // @[LoadQueueRAW.scala 209:119]
  wire  _oldest_T_5_bits_uop_robIdx_flag = rollbackLqVReg_0 & ~rollbackLqVReg_1 ? rollbackLqReg_0_uop_robIdx_flag :
    rollbackLqReg_1_uop_robIdx_flag; // @[LoadQueueRAW.scala 209:119]
  wire [4:0] _oldest_T_5_bits_uop_robIdx_value = rollbackLqVReg_0 & ~rollbackLqVReg_1 ? rollbackLqReg_0_uop_robIdx_value
     : rollbackLqReg_1_uop_robIdx_value; // @[LoadQueueRAW.scala 209:119]
  wire  _oldest_T_5_bits_flag = rollbackLqVReg_0 & ~rollbackLqVReg_1 ? 1'h0 : 1'h1; // @[LoadQueueRAW.scala 209:119]
  wire  oldest_bits_uop_robIdx_flag = rollbackLqVReg_0 & rollbackLqVReg_1 ? _oldest_T_2_bits_uop_robIdx_flag :
    _oldest_T_5_bits_uop_robIdx_flag; // @[LoadQueueRAW.scala 209:23]
  wire [4:0] oldest_bits_uop_robIdx_value = rollbackLqVReg_0 & rollbackLqVReg_1 ? _oldest_T_2_bits_uop_robIdx_value :
    _oldest_T_5_bits_uop_robIdx_value; // @[LoadQueueRAW.scala 209:23]
  wire  oldest_bits_flag = rollbackLqVReg_0 & rollbackLqVReg_1 ? _oldest_T_1 : _oldest_T_5_bits_flag; // @[LoadQueueRAW.scala 209:23]
  reg [2:0] stFtqIdxS3_0_value; // @[LoadQueueRAW.scala 276:27]
  reg [2:0] stFtqIdxS3_1_value; // @[LoadQueueRAW.scala 276:27]
  reg [2:0] stFtqOffsetS3_0; // @[LoadQueueRAW.scala 277:30]
  reg [2:0] stFtqOffsetS3_1; // @[LoadQueueRAW.scala 277:30]
  wire  io_rollback_valid_differentFlag = oldest_bits_uop_robIdx_flag ^ lastCycleRedirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 92:35]
  wire  io_rollback_valid_compare = oldest_bits_uop_robIdx_value < lastCycleRedirect_bits_robIdx_value; // @[CircularQueuePtr.scala 93:30]
  wire  _io_rollback_valid_T_2 = io_rollback_valid_differentFlag ^ io_rollback_valid_compare; // @[CircularQueuePtr.scala 94:19]
  wire  _io_rollback_valid_T_3 = ~lastCycleRedirect_valid | _io_rollback_valid_T_2; // @[LoadQueueRAW.scala 296:51]
  wire  _io_rollback_valid_T_4 = (rollbackLqVReg_0 | rollbackLqVReg_1) & _io_rollback_valid_T_3; // @[LoadQueueRAW.scala 295:51]
  wire  io_rollback_valid_differentFlag_1 = oldest_bits_uop_robIdx_flag ^ lastlastCycleRedirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 92:35]
  wire  io_rollback_valid_compare_1 = oldest_bits_uop_robIdx_value < lastlastCycleRedirect_bits_robIdx_value; // @[CircularQueuePtr.scala 93:30]
  wire  _io_rollback_valid_T_6 = io_rollback_valid_differentFlag_1 ^ io_rollback_valid_compare_1; // @[CircularQueuePtr.scala 94:19]
  wire  _io_rollback_valid_T_7 = ~lastlastCycleRedirect_valid | _io_rollback_valid_T_6; // @[LoadQueueRAW.scala 297:55]
  reg [1:0] io_perf_0_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg [1:0] io_perf_0_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg  io_perf_1_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg  io_perf_1_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg  io_perf_2_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg  io_perf_2_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  LqPAddrModule_1 paddrModule ( // @[LoadQueueRAW.scala 62:27]
    .clock(paddrModule_clock),
    .io_wen_0(paddrModule_io_wen_0),
    .io_wen_1(paddrModule_io_wen_1),
    .io_waddr_0(paddrModule_io_waddr_0),
    .io_waddr_1(paddrModule_io_waddr_1),
    .io_wdata_0(paddrModule_io_wdata_0),
    .io_wdata_1(paddrModule_io_wdata_1),
    .io_violationMdata_0(paddrModule_io_violationMdata_0),
    .io_violationMdata_1(paddrModule_io_violationMdata_1),
    .io_violationMmask_0_0(paddrModule_io_violationMmask_0_0),
    .io_violationMmask_0_1(paddrModule_io_violationMmask_0_1),
    .io_violationMmask_0_2(paddrModule_io_violationMmask_0_2),
    .io_violationMmask_0_3(paddrModule_io_violationMmask_0_3),
    .io_violationMmask_0_4(paddrModule_io_violationMmask_0_4),
    .io_violationMmask_0_5(paddrModule_io_violationMmask_0_5),
    .io_violationMmask_0_6(paddrModule_io_violationMmask_0_6),
    .io_violationMmask_0_7(paddrModule_io_violationMmask_0_7),
    .io_violationMmask_1_0(paddrModule_io_violationMmask_1_0),
    .io_violationMmask_1_1(paddrModule_io_violationMmask_1_1),
    .io_violationMmask_1_2(paddrModule_io_violationMmask_1_2),
    .io_violationMmask_1_3(paddrModule_io_violationMmask_1_3),
    .io_violationMmask_1_4(paddrModule_io_violationMmask_1_4),
    .io_violationMmask_1_5(paddrModule_io_violationMmask_1_5),
    .io_violationMmask_1_6(paddrModule_io_violationMmask_1_6),
    .io_violationMmask_1_7(paddrModule_io_violationMmask_1_7)
  );
  LqMaskModule maskModule ( // @[LoadQueueRAW.scala 71:26]
    .clock(maskModule_clock),
    .io_wen_0(maskModule_io_wen_0),
    .io_wen_1(maskModule_io_wen_1),
    .io_waddr_0(maskModule_io_waddr_0),
    .io_waddr_1(maskModule_io_waddr_1),
    .io_wdata_0(maskModule_io_wdata_0),
    .io_wdata_1(maskModule_io_wdata_1),
    .io_violationMdata_0(maskModule_io_violationMdata_0),
    .io_violationMdata_1(maskModule_io_violationMdata_1),
    .io_violationMmask_0_0(maskModule_io_violationMmask_0_0),
    .io_violationMmask_0_1(maskModule_io_violationMmask_0_1),
    .io_violationMmask_0_2(maskModule_io_violationMmask_0_2),
    .io_violationMmask_0_3(maskModule_io_violationMmask_0_3),
    .io_violationMmask_0_4(maskModule_io_violationMmask_0_4),
    .io_violationMmask_0_5(maskModule_io_violationMmask_0_5),
    .io_violationMmask_0_6(maskModule_io_violationMmask_0_6),
    .io_violationMmask_0_7(maskModule_io_violationMmask_0_7),
    .io_violationMmask_1_0(maskModule_io_violationMmask_1_0),
    .io_violationMmask_1_1(maskModule_io_violationMmask_1_1),
    .io_violationMmask_1_2(maskModule_io_violationMmask_1_2),
    .io_violationMmask_1_3(maskModule_io_violationMmask_1_3),
    .io_violationMmask_1_4(maskModule_io_violationMmask_1_4),
    .io_violationMmask_1_5(maskModule_io_violationMmask_1_5),
    .io_violationMmask_1_6(maskModule_io_violationMmask_1_6),
    .io_violationMmask_1_7(maskModule_io_violationMmask_1_7)
  );
  assign io_query_0_resp_bits_index = io_query_0_resp_bits_index_REG; // @[LoadQueueRAW.scala 146:22]
  assign io_query_0_resp_bits_canAccept = io_query_0_resp_bits_canAccept_REG; // @[LoadQueueRAW.scala 143:26]
  assign io_query_0_resp_bits_allocated = io_query_0_resp_bits_allocated_REG; // @[LoadQueueRAW.scala 144:26]
  assign io_query_1_resp_bits_index = io_query_1_resp_bits_index_REG; // @[LoadQueueRAW.scala 146:22]
  assign io_query_1_resp_bits_canAccept = io_query_1_resp_bits_canAccept_REG; // @[LoadQueueRAW.scala 143:26]
  assign io_query_1_resp_bits_allocated = io_query_1_resp_bits_allocated_REG; // @[LoadQueueRAW.scala 144:26]
  assign io_rollback_valid = _io_rollback_valid_T_4 & _io_rollback_valid_T_7; // @[LoadQueueRAW.scala 296:115]
  assign io_rollback_bits_robIdx_flag = rollbackLqVReg_0 & rollbackLqVReg_1 ? _oldest_T_2_bits_uop_robIdx_flag :
    _oldest_T_5_bits_uop_robIdx_flag; // @[LoadQueueRAW.scala 209:23]
  assign io_rollback_bits_robIdx_value = rollbackLqVReg_0 & rollbackLqVReg_1 ? _oldest_T_2_bits_uop_robIdx_value :
    _oldest_T_5_bits_uop_robIdx_value; // @[LoadQueueRAW.scala 209:23]
  assign io_rollback_bits_ftqIdx_flag = rollbackLqVReg_0 & rollbackLqVReg_1 ? _oldest_T_2_bits_uop_cf_ftqPtr_flag :
    _oldest_T_5_bits_uop_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 209:23]
  assign io_rollback_bits_ftqIdx_value = rollbackLqVReg_0 & rollbackLqVReg_1 ? _oldest_T_2_bits_uop_cf_ftqPtr_value :
    _oldest_T_5_bits_uop_cf_ftqPtr_value; // @[LoadQueueRAW.scala 209:23]
  assign io_rollback_bits_ftqOffset = rollbackLqVReg_0 & rollbackLqVReg_1 ? _oldest_T_2_bits_uop_cf_ftqOffset :
    _oldest_T_5_bits_uop_cf_ftqOffset; // @[LoadQueueRAW.scala 209:23]
  assign io_rollback_bits_stFtqIdx_value = oldest_bits_flag ? stFtqIdxS3_1_value : stFtqIdxS3_0_value; // @[LoadQueueRAW.scala 285:{29,29}]
  assign io_rollback_bits_stFtqOffset = oldest_bits_flag ? stFtqOffsetS3_1 : stFtqOffsetS3_0; // @[LoadQueueRAW.scala 287:{32,32}]
  assign io_correctTableUpdate_valid = rollbackLqVReg_0 | rollbackLqVReg_1; // @[LoadQueueRAW.scala 300:57]
  assign io_correctTableUpdate_bits_addr = rollbackLqVReg_0 & rollbackLqVReg_1 ? _oldest_T_2_bits_uop_cf_foldpc :
    _oldest_T_5_bits_uop_cf_foldpc; // @[LoadQueueRAW.scala 209:23]
  assign io_perf_0_value = {{4'd0}, io_perf_0_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_1_value = {{5'd0}, io_perf_1_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_2_value = {{5'd0}, io_perf_2_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign paddrModule_clock = clock;
  assign paddrModule_io_wen_0 = needEnqueue_0 & canAcceptVec_0; // @[LoadQueueRAW.scala 102:26]
  assign paddrModule_io_wen_1 = needEnqueue_1 & canAcceptVec_1; // @[LoadQueueRAW.scala 102:26]
  assign paddrModule_io_waddr_0 = {_enqIdx_T,_enqIdx_T_5}; // @[Cat.scala 31:58]
  assign paddrModule_io_waddr_1 = {_enqIdx_T_6,_enqIdx_T_11}; // @[Cat.scala 31:58]
  assign paddrModule_io_wdata_0 = io_query_0_req_bits_paddr; // @[LoadQueueRAW.scala 102:46 112:31]
  assign paddrModule_io_wdata_1 = io_query_1_req_bits_paddr; // @[LoadQueueRAW.scala 102:46 112:31]
  assign paddrModule_io_violationMdata_0 = io_storeIn_0_bits_paddr; // @[LoadQueueRAW.scala 219:38]
  assign paddrModule_io_violationMdata_1 = io_storeIn_1_bits_paddr; // @[LoadQueueRAW.scala 219:38]
  assign maskModule_clock = clock;
  assign maskModule_io_wen_0 = needEnqueue_0 & canAcceptVec_0; // @[LoadQueueRAW.scala 102:26]
  assign maskModule_io_wen_1 = needEnqueue_1 & canAcceptVec_1; // @[LoadQueueRAW.scala 102:26]
  assign maskModule_io_waddr_0 = {_enqIdx_T,_enqIdx_T_5}; // @[Cat.scala 31:58]
  assign maskModule_io_waddr_1 = {_enqIdx_T_6,_enqIdx_T_11}; // @[Cat.scala 31:58]
  assign maskModule_io_wdata_0 = io_query_0_req_bits_mask; // @[LoadQueueRAW.scala 102:46 117:30]
  assign maskModule_io_wdata_1 = io_query_1_req_bits_mask; // @[LoadQueueRAW.scala 102:46 117:30]
  assign maskModule_io_violationMdata_0 = io_storeIn_0_bits_mask[7:0]; // @[LoadQueueRAW.scala 220:37]
  assign maskModule_io_violationMdata_1 = io_storeIn_1_bits_mask[7:0]; // @[LoadQueueRAW.scala 220:37]
  always @(posedge clock) begin
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h0 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_0_cf_foldpc <= io_query_1_req_bits_uop_cf_foldpc; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_0_cf_foldpc <= _GEN_908;
      end
    end else begin
      uop_0_cf_foldpc <= _GEN_908;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h0 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_0_cf_ftqPtr_flag <= io_query_1_req_bits_uop_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_0_cf_ftqPtr_flag <= _GEN_1244;
      end
    end else begin
      uop_0_cf_ftqPtr_flag <= _GEN_1244;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h0 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_0_cf_ftqPtr_value <= io_query_1_req_bits_uop_cf_ftqPtr_value; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_0_cf_ftqPtr_value <= _GEN_1252;
      end
    end else begin
      uop_0_cf_ftqPtr_value <= _GEN_1252;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h0 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_0_cf_ftqOffset <= io_query_1_req_bits_uop_cf_ftqOffset; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_0_cf_ftqOffset <= _GEN_1260;
      end
    end else begin
      uop_0_cf_ftqOffset <= _GEN_1260;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h0 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_0_robIdx_flag <= io_query_1_req_bits_uop_robIdx_flag; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_0_robIdx_flag <= _GEN_1620;
      end
    end else begin
      uop_0_robIdx_flag <= _GEN_1620;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h0 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_0_robIdx_value <= io_query_1_req_bits_uop_robIdx_value; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_0_robIdx_value <= _GEN_1628;
      end
    end else begin
      uop_0_robIdx_value <= _GEN_1628;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h0 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_0_sqIdx_flag <= io_query_1_req_bits_uop_sqIdx_flag; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_0_sqIdx_flag <= _GEN_1652;
      end
    end else begin
      uop_0_sqIdx_flag <= _GEN_1652;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h0 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_0_sqIdx_value <= io_query_1_req_bits_uop_sqIdx_value; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_0_sqIdx_value <= _GEN_1660;
      end
    end else begin
      uop_0_sqIdx_value <= _GEN_1660;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h1 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_1_cf_foldpc <= io_query_1_req_bits_uop_cf_foldpc; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_1_cf_foldpc <= _GEN_909;
      end
    end else begin
      uop_1_cf_foldpc <= _GEN_909;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h1 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_1_cf_ftqPtr_flag <= io_query_1_req_bits_uop_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_1_cf_ftqPtr_flag <= _GEN_1245;
      end
    end else begin
      uop_1_cf_ftqPtr_flag <= _GEN_1245;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h1 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_1_cf_ftqPtr_value <= io_query_1_req_bits_uop_cf_ftqPtr_value; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_1_cf_ftqPtr_value <= _GEN_1253;
      end
    end else begin
      uop_1_cf_ftqPtr_value <= _GEN_1253;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h1 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_1_cf_ftqOffset <= io_query_1_req_bits_uop_cf_ftqOffset; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_1_cf_ftqOffset <= _GEN_1261;
      end
    end else begin
      uop_1_cf_ftqOffset <= _GEN_1261;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h1 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_1_robIdx_flag <= io_query_1_req_bits_uop_robIdx_flag; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_1_robIdx_flag <= _GEN_1621;
      end
    end else begin
      uop_1_robIdx_flag <= _GEN_1621;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h1 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_1_robIdx_value <= io_query_1_req_bits_uop_robIdx_value; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_1_robIdx_value <= _GEN_1629;
      end
    end else begin
      uop_1_robIdx_value <= _GEN_1629;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h1 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_1_sqIdx_flag <= io_query_1_req_bits_uop_sqIdx_flag; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_1_sqIdx_flag <= _GEN_1653;
      end
    end else begin
      uop_1_sqIdx_flag <= _GEN_1653;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h1 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_1_sqIdx_value <= io_query_1_req_bits_uop_sqIdx_value; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_1_sqIdx_value <= _GEN_1661;
      end
    end else begin
      uop_1_sqIdx_value <= _GEN_1661;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h2 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_2_cf_foldpc <= io_query_1_req_bits_uop_cf_foldpc; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_2_cf_foldpc <= _GEN_910;
      end
    end else begin
      uop_2_cf_foldpc <= _GEN_910;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h2 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_2_cf_ftqPtr_flag <= io_query_1_req_bits_uop_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_2_cf_ftqPtr_flag <= _GEN_1246;
      end
    end else begin
      uop_2_cf_ftqPtr_flag <= _GEN_1246;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h2 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_2_cf_ftqPtr_value <= io_query_1_req_bits_uop_cf_ftqPtr_value; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_2_cf_ftqPtr_value <= _GEN_1254;
      end
    end else begin
      uop_2_cf_ftqPtr_value <= _GEN_1254;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h2 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_2_cf_ftqOffset <= io_query_1_req_bits_uop_cf_ftqOffset; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_2_cf_ftqOffset <= _GEN_1262;
      end
    end else begin
      uop_2_cf_ftqOffset <= _GEN_1262;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h2 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_2_robIdx_flag <= io_query_1_req_bits_uop_robIdx_flag; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_2_robIdx_flag <= _GEN_1622;
      end
    end else begin
      uop_2_robIdx_flag <= _GEN_1622;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h2 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_2_robIdx_value <= io_query_1_req_bits_uop_robIdx_value; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_2_robIdx_value <= _GEN_1630;
      end
    end else begin
      uop_2_robIdx_value <= _GEN_1630;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h2 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_2_sqIdx_flag <= io_query_1_req_bits_uop_sqIdx_flag; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_2_sqIdx_flag <= _GEN_1654;
      end
    end else begin
      uop_2_sqIdx_flag <= _GEN_1654;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h2 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_2_sqIdx_value <= io_query_1_req_bits_uop_sqIdx_value; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_2_sqIdx_value <= _GEN_1662;
      end
    end else begin
      uop_2_sqIdx_value <= _GEN_1662;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h3 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_3_cf_foldpc <= io_query_1_req_bits_uop_cf_foldpc; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_3_cf_foldpc <= _GEN_911;
      end
    end else begin
      uop_3_cf_foldpc <= _GEN_911;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h3 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_3_cf_ftqPtr_flag <= io_query_1_req_bits_uop_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_3_cf_ftqPtr_flag <= _GEN_1247;
      end
    end else begin
      uop_3_cf_ftqPtr_flag <= _GEN_1247;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h3 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_3_cf_ftqPtr_value <= io_query_1_req_bits_uop_cf_ftqPtr_value; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_3_cf_ftqPtr_value <= _GEN_1255;
      end
    end else begin
      uop_3_cf_ftqPtr_value <= _GEN_1255;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h3 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_3_cf_ftqOffset <= io_query_1_req_bits_uop_cf_ftqOffset; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_3_cf_ftqOffset <= _GEN_1263;
      end
    end else begin
      uop_3_cf_ftqOffset <= _GEN_1263;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h3 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_3_robIdx_flag <= io_query_1_req_bits_uop_robIdx_flag; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_3_robIdx_flag <= _GEN_1623;
      end
    end else begin
      uop_3_robIdx_flag <= _GEN_1623;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h3 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_3_robIdx_value <= io_query_1_req_bits_uop_robIdx_value; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_3_robIdx_value <= _GEN_1631;
      end
    end else begin
      uop_3_robIdx_value <= _GEN_1631;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h3 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_3_sqIdx_flag <= io_query_1_req_bits_uop_sqIdx_flag; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_3_sqIdx_flag <= _GEN_1655;
      end
    end else begin
      uop_3_sqIdx_flag <= _GEN_1655;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h3 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_3_sqIdx_value <= io_query_1_req_bits_uop_sqIdx_value; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_3_sqIdx_value <= _GEN_1663;
      end
    end else begin
      uop_3_sqIdx_value <= _GEN_1663;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h4 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_4_cf_foldpc <= io_query_1_req_bits_uop_cf_foldpc; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_4_cf_foldpc <= _GEN_912;
      end
    end else begin
      uop_4_cf_foldpc <= _GEN_912;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h4 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_4_cf_ftqPtr_flag <= io_query_1_req_bits_uop_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_4_cf_ftqPtr_flag <= _GEN_1248;
      end
    end else begin
      uop_4_cf_ftqPtr_flag <= _GEN_1248;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h4 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_4_cf_ftqPtr_value <= io_query_1_req_bits_uop_cf_ftqPtr_value; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_4_cf_ftqPtr_value <= _GEN_1256;
      end
    end else begin
      uop_4_cf_ftqPtr_value <= _GEN_1256;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h4 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_4_cf_ftqOffset <= io_query_1_req_bits_uop_cf_ftqOffset; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_4_cf_ftqOffset <= _GEN_1264;
      end
    end else begin
      uop_4_cf_ftqOffset <= _GEN_1264;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h4 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_4_robIdx_flag <= io_query_1_req_bits_uop_robIdx_flag; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_4_robIdx_flag <= _GEN_1624;
      end
    end else begin
      uop_4_robIdx_flag <= _GEN_1624;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h4 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_4_robIdx_value <= io_query_1_req_bits_uop_robIdx_value; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_4_robIdx_value <= _GEN_1632;
      end
    end else begin
      uop_4_robIdx_value <= _GEN_1632;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h4 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_4_sqIdx_flag <= io_query_1_req_bits_uop_sqIdx_flag; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_4_sqIdx_flag <= _GEN_1656;
      end
    end else begin
      uop_4_sqIdx_flag <= _GEN_1656;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h4 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_4_sqIdx_value <= io_query_1_req_bits_uop_sqIdx_value; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_4_sqIdx_value <= _GEN_1664;
      end
    end else begin
      uop_4_sqIdx_value <= _GEN_1664;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h5 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_5_cf_foldpc <= io_query_1_req_bits_uop_cf_foldpc; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_5_cf_foldpc <= _GEN_913;
      end
    end else begin
      uop_5_cf_foldpc <= _GEN_913;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h5 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_5_cf_ftqPtr_flag <= io_query_1_req_bits_uop_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_5_cf_ftqPtr_flag <= _GEN_1249;
      end
    end else begin
      uop_5_cf_ftqPtr_flag <= _GEN_1249;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h5 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_5_cf_ftqPtr_value <= io_query_1_req_bits_uop_cf_ftqPtr_value; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_5_cf_ftqPtr_value <= _GEN_1257;
      end
    end else begin
      uop_5_cf_ftqPtr_value <= _GEN_1257;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h5 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_5_cf_ftqOffset <= io_query_1_req_bits_uop_cf_ftqOffset; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_5_cf_ftqOffset <= _GEN_1265;
      end
    end else begin
      uop_5_cf_ftqOffset <= _GEN_1265;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h5 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_5_robIdx_flag <= io_query_1_req_bits_uop_robIdx_flag; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_5_robIdx_flag <= _GEN_1625;
      end
    end else begin
      uop_5_robIdx_flag <= _GEN_1625;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h5 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_5_robIdx_value <= io_query_1_req_bits_uop_robIdx_value; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_5_robIdx_value <= _GEN_1633;
      end
    end else begin
      uop_5_robIdx_value <= _GEN_1633;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h5 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_5_sqIdx_flag <= io_query_1_req_bits_uop_sqIdx_flag; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_5_sqIdx_flag <= _GEN_1657;
      end
    end else begin
      uop_5_sqIdx_flag <= _GEN_1657;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h5 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_5_sqIdx_value <= io_query_1_req_bits_uop_sqIdx_value; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_5_sqIdx_value <= _GEN_1665;
      end
    end else begin
      uop_5_sqIdx_value <= _GEN_1665;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h6 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_6_cf_foldpc <= io_query_1_req_bits_uop_cf_foldpc; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_6_cf_foldpc <= _GEN_914;
      end
    end else begin
      uop_6_cf_foldpc <= _GEN_914;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h6 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_6_cf_ftqPtr_flag <= io_query_1_req_bits_uop_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_6_cf_ftqPtr_flag <= _GEN_1250;
      end
    end else begin
      uop_6_cf_ftqPtr_flag <= _GEN_1250;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h6 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_6_cf_ftqPtr_value <= io_query_1_req_bits_uop_cf_ftqPtr_value; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_6_cf_ftqPtr_value <= _GEN_1258;
      end
    end else begin
      uop_6_cf_ftqPtr_value <= _GEN_1258;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h6 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_6_cf_ftqOffset <= io_query_1_req_bits_uop_cf_ftqOffset; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_6_cf_ftqOffset <= _GEN_1266;
      end
    end else begin
      uop_6_cf_ftqOffset <= _GEN_1266;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h6 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_6_robIdx_flag <= io_query_1_req_bits_uop_robIdx_flag; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_6_robIdx_flag <= _GEN_1626;
      end
    end else begin
      uop_6_robIdx_flag <= _GEN_1626;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h6 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_6_robIdx_value <= io_query_1_req_bits_uop_robIdx_value; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_6_robIdx_value <= _GEN_1634;
      end
    end else begin
      uop_6_robIdx_value <= _GEN_1634;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h6 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_6_sqIdx_flag <= io_query_1_req_bits_uop_sqIdx_flag; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_6_sqIdx_flag <= _GEN_1658;
      end
    end else begin
      uop_6_sqIdx_flag <= _GEN_1658;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h6 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_6_sqIdx_value <= io_query_1_req_bits_uop_sqIdx_value; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_6_sqIdx_value <= _GEN_1666;
      end
    end else begin
      uop_6_sqIdx_value <= _GEN_1666;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h7 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_7_cf_foldpc <= io_query_1_req_bits_uop_cf_foldpc; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_7_cf_foldpc <= _GEN_915;
      end
    end else begin
      uop_7_cf_foldpc <= _GEN_915;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h7 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_7_cf_ftqPtr_flag <= io_query_1_req_bits_uop_cf_ftqPtr_flag; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_7_cf_ftqPtr_flag <= _GEN_1251;
      end
    end else begin
      uop_7_cf_ftqPtr_flag <= _GEN_1251;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h7 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_7_cf_ftqPtr_value <= io_query_1_req_bits_uop_cf_ftqPtr_value; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_7_cf_ftqPtr_value <= _GEN_1259;
      end
    end else begin
      uop_7_cf_ftqPtr_value <= _GEN_1259;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h7 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_7_cf_ftqOffset <= io_query_1_req_bits_uop_cf_ftqOffset; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_7_cf_ftqOffset <= _GEN_1267;
      end
    end else begin
      uop_7_cf_ftqOffset <= _GEN_1267;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h7 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_7_robIdx_flag <= io_query_1_req_bits_uop_robIdx_flag; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_7_robIdx_flag <= _GEN_1627;
      end
    end else begin
      uop_7_robIdx_flag <= _GEN_1627;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h7 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_7_robIdx_value <= io_query_1_req_bits_uop_robIdx_value; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_7_robIdx_value <= _GEN_1635;
      end
    end else begin
      uop_7_robIdx_value <= _GEN_1635;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h7 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_7_sqIdx_flag <= io_query_1_req_bits_uop_sqIdx_flag; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_7_sqIdx_flag <= _GEN_1659;
      end
    end else begin
      uop_7_sqIdx_flag <= _GEN_1659;
    end
    if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      if (3'h7 == enqIdx_1) begin // @[LoadQueueRAW.scala 120:19]
        uop_7_sqIdx_value <= io_query_1_req_bits_uop_sqIdx_value; // @[LoadQueueRAW.scala 120:19]
      end else begin
        uop_7_sqIdx_value <= _GEN_1667;
      end
    end else begin
      uop_7_sqIdx_value <= _GEN_1667;
    end
    lastEnqValid_REG <= io_query_0_req_valid & io_query_0_req_bits_allocated; // @[LoadQueueRAW.scala 125:42]
    lastEnqValid_REG_1 <= io_query_0_req_bits_index; // @[LoadQueueRAW.scala 125:80]
    lastEnqValid_REG_2_flag <= io_query_0_req_bits_uop_robIdx_flag; // @[LoadQueueRAW.scala 125:116]
    lastEnqValid_REG_2_value <= io_query_0_req_bits_uop_robIdx_value; // @[LoadQueueRAW.scala 125:116]
    lastEnqBits_uop_robIdx_flag <= io_query_0_req_bits_uop_robIdx_flag; // @[LoadQueueRAW.scala 126:30]
    lastEnqBits_uop_robIdx_value <= io_query_0_req_bits_uop_robIdx_value; // @[LoadQueueRAW.scala 126:30]
    lastEnqBits_index <= io_query_0_req_bits_index; // @[LoadQueueRAW.scala 126:30]
    lastEnqBits_allocated <= io_query_0_req_bits_allocated; // @[LoadQueueRAW.scala 126:30]
    lastEnqBits_datavalid <= io_query_0_req_bits_datavalid; // @[LoadQueueRAW.scala 126:30]
    lastEnqBits_mask <= io_query_0_req_bits_mask; // @[LoadQueueRAW.scala 126:30]
    lastEnqBits_paddr <= io_query_0_req_bits_paddr; // @[LoadQueueRAW.scala 126:30]
    lastEnqIndex_REG <= {_enqIdx_T,_enqIdx_T_5}; // @[Cat.scala 31:58]
    lastEnqValid_REG_3 <= io_query_1_req_valid & io_query_1_req_bits_allocated; // @[LoadQueueRAW.scala 125:42]
    lastEnqValid_REG_4 <= io_query_1_req_bits_index; // @[LoadQueueRAW.scala 125:80]
    lastEnqValid_REG_5_flag <= io_query_1_req_bits_uop_robIdx_flag; // @[LoadQueueRAW.scala 125:116]
    lastEnqValid_REG_5_value <= io_query_1_req_bits_uop_robIdx_value; // @[LoadQueueRAW.scala 125:116]
    lastEnqBits_1_uop_robIdx_flag <= io_query_1_req_bits_uop_robIdx_flag; // @[LoadQueueRAW.scala 126:30]
    lastEnqBits_1_uop_robIdx_value <= io_query_1_req_bits_uop_robIdx_value; // @[LoadQueueRAW.scala 126:30]
    lastEnqBits_1_index <= io_query_1_req_bits_index; // @[LoadQueueRAW.scala 126:30]
    lastEnqBits_1_allocated <= io_query_1_req_bits_allocated; // @[LoadQueueRAW.scala 126:30]
    lastEnqBits_1_datavalid <= io_query_1_req_bits_datavalid; // @[LoadQueueRAW.scala 126:30]
    lastEnqBits_1_mask <= io_query_1_req_bits_mask; // @[LoadQueueRAW.scala 126:30]
    lastEnqBits_1_paddr <= io_query_1_req_bits_paddr; // @[LoadQueueRAW.scala 126:30]
    lastEnqIndex_REG_1 <= {_enqIdx_T_6,_enqIdx_T_11}; // @[Cat.scala 31:58]
    if (needEnqueue_0) begin // @[LoadQueueRAW.scala 143:40]
      io_query_0_resp_bits_canAccept_REG <= canEnqVec_0;
    end else begin
      io_query_0_resp_bits_canAccept_REG <= 1'h1;
    end
    io_query_0_resp_bits_allocated_REG <= needEnqueue_0 & canAcceptVec_0; // @[LoadQueueRAW.scala 102:26]
    if (io_query_0_req_bits_allocated) begin // @[LoadQueueRAW.scala 146:36]
      io_query_0_resp_bits_index_REG <= io_query_0_req_bits_index;
    end else begin
      io_query_0_resp_bits_index_REG <= enqIdx;
    end
    if (needEnqueue_1) begin // @[LoadQueueRAW.scala 143:40]
      io_query_1_resp_bits_canAccept_REG <= canEnqVec_1;
    end else begin
      io_query_1_resp_bits_canAccept_REG <= 1'h1;
    end
    io_query_1_resp_bits_allocated_REG <= needEnqueue_1 & canAcceptVec_1; // @[LoadQueueRAW.scala 102:26]
    if (io_query_1_req_bits_allocated) begin // @[LoadQueueRAW.scala 146:36]
      io_query_1_resp_bits_index_REG <= io_query_1_req_bits_index;
    end else begin
      io_query_1_resp_bits_index_REG <= enqIdx_1;
    end
    lastCycleRedirect_valid <= io_redirect_valid; // @[LoadQueueRAW.scala 248:34]
    lastCycleRedirect_bits_robIdx_flag <= io_redirect_bits_robIdx_flag; // @[LoadQueueRAW.scala 248:34]
    lastCycleRedirect_bits_robIdx_value <= io_redirect_bits_robIdx_value; // @[LoadQueueRAW.scala 248:34]
    lastlastCycleRedirect_valid <= lastCycleRedirect_valid; // @[LoadQueueRAW.scala 249:38]
    lastlastCycleRedirect_bits_robIdx_flag <= lastCycleRedirect_bits_robIdx_flag; // @[LoadQueueRAW.scala 249:38]
    lastlastCycleRedirect_bits_robIdx_value <= lastCycleRedirect_bits_robIdx_value; // @[LoadQueueRAW.scala 249:38]
    addrMaskMatch <= _addrMaskMatch_T & _addrMaskMatch_T_1; // @[LoadQueueRAW.scala 222:73]
    entryNeedCheck__0 <= allocated_0 & _entryNeedCheck_T & datavalid_0; // @[LoadQueueRAW.scala 224:77]
    entryNeedCheck__1 <= allocated_1 & _entryNeedCheck_T_3 & datavalid_1; // @[LoadQueueRAW.scala 224:77]
    entryNeedCheck__2 <= allocated_2 & _entryNeedCheck_T_6 & datavalid_2; // @[LoadQueueRAW.scala 224:77]
    entryNeedCheck__3 <= allocated_3 & _entryNeedCheck_T_9 & datavalid_3; // @[LoadQueueRAW.scala 224:77]
    entryNeedCheck__4 <= allocated_4 & _entryNeedCheck_T_12 & datavalid_4; // @[LoadQueueRAW.scala 224:77]
    entryNeedCheck__5 <= allocated_5 & _entryNeedCheck_T_15 & datavalid_5; // @[LoadQueueRAW.scala 224:77]
    entryNeedCheck__6 <= allocated_6 & _entryNeedCheck_T_18 & datavalid_6; // @[LoadQueueRAW.scala 224:77]
    entryNeedCheck__7 <= allocated_7 & _entryNeedCheck_T_21 & datavalid_7; // @[LoadQueueRAW.scala 224:77]
    lqViolation_REG <= ~io_storeIn_0_bits_miss; // @[LoadQueueRAW.scala 229:60]
    rollbackLq_0_valid_REG <= io_storeIn_0_valid; // @[LoadQueueRAW.scala 259:58]
    stFtqIdxS2_0_REG_value <= io_storeIn_0_bits_uop_cf_ftqPtr_value; // @[LoadQueueRAW.scala 262:29]
    stFtqOffsetS2_0_REG <= io_storeIn_0_bits_uop_cf_ftqOffset; // @[LoadQueueRAW.scala 263:32]
    addrMaskMatch_1 <= _addrMaskMatch_T_3 & _addrMaskMatch_T_4; // @[LoadQueueRAW.scala 222:73]
    entryNeedCheck_1_0 <= allocated_0 & _entryNeedCheck_T_24 & datavalid_0; // @[LoadQueueRAW.scala 224:77]
    entryNeedCheck_1_1 <= allocated_1 & _entryNeedCheck_T_27 & datavalid_1; // @[LoadQueueRAW.scala 224:77]
    entryNeedCheck_1_2 <= allocated_2 & _entryNeedCheck_T_30 & datavalid_2; // @[LoadQueueRAW.scala 224:77]
    entryNeedCheck_1_3 <= allocated_3 & _entryNeedCheck_T_33 & datavalid_3; // @[LoadQueueRAW.scala 224:77]
    entryNeedCheck_1_4 <= allocated_4 & _entryNeedCheck_T_36 & datavalid_4; // @[LoadQueueRAW.scala 224:77]
    entryNeedCheck_1_5 <= allocated_5 & _entryNeedCheck_T_39 & datavalid_5; // @[LoadQueueRAW.scala 224:77]
    entryNeedCheck_1_6 <= allocated_6 & _entryNeedCheck_T_42 & datavalid_6; // @[LoadQueueRAW.scala 224:77]
    entryNeedCheck_1_7 <= allocated_7 & _entryNeedCheck_T_45 & datavalid_7; // @[LoadQueueRAW.scala 224:77]
    lqViolation_REG_1 <= ~io_storeIn_1_bits_miss; // @[LoadQueueRAW.scala 229:60]
    rollbackLq_1_valid_REG <= io_storeIn_1_valid; // @[LoadQueueRAW.scala 259:58]
    stFtqIdxS2_1_REG_value <= io_storeIn_1_bits_uop_cf_ftqPtr_value; // @[LoadQueueRAW.scala 262:29]
    stFtqOffsetS2_1_REG <= io_storeIn_1_bits_uop_cf_ftqOffset; // @[LoadQueueRAW.scala 263:32]
    rollbackLqVReg_0 <= lqViolation & rollbackLq_0_valid_REG; // @[LoadQueueRAW.scala 259:48]
    rollbackLqVReg_1 <= lqViolation_1 & rollbackLq_1_valid_REG; // @[LoadQueueRAW.scala 259:48]
    if (rollbackLq_0_valid) begin // @[Reg.scala 17:18]
      if (lqViolationUop_oldest_2_valid & lqViolationUop_oldest_5_valid) begin // @[LoadQueueRAW.scala 209:23]
        if (_lqViolationUop_oldest_T_37) begin // @[LoadQueueRAW.scala 209:49]
          rollbackLqReg_0_uop_cf_foldpc <= lqViolationUop_oldest_5_bits_uop_cf_foldpc;
        end else begin
          rollbackLqReg_0_uop_cf_foldpc <= lqViolationUop_oldest_2_bits_uop_cf_foldpc;
        end
      end else if (lqViolationUop_oldest_2_valid & ~lqViolationUop_oldest_5_valid) begin // @[LoadQueueRAW.scala 209:119]
        rollbackLqReg_0_uop_cf_foldpc <= lqViolationUop_oldest_2_bits_uop_cf_foldpc;
      end else begin
        rollbackLqReg_0_uop_cf_foldpc <= lqViolationUop_oldest_5_bits_uop_cf_foldpc;
      end
    end
    if (rollbackLq_0_valid) begin // @[Reg.scala 17:18]
      if (lqViolationUop_oldest_2_valid & lqViolationUop_oldest_5_valid) begin // @[LoadQueueRAW.scala 209:23]
        if (_lqViolationUop_oldest_T_37) begin // @[LoadQueueRAW.scala 209:49]
          rollbackLqReg_0_uop_cf_ftqPtr_flag <= lqViolationUop_oldest_5_bits_uop_cf_ftqPtr_flag;
        end else begin
          rollbackLqReg_0_uop_cf_ftqPtr_flag <= lqViolationUop_oldest_2_bits_uop_cf_ftqPtr_flag;
        end
      end else if (lqViolationUop_oldest_2_valid & ~lqViolationUop_oldest_5_valid) begin // @[LoadQueueRAW.scala 209:119]
        rollbackLqReg_0_uop_cf_ftqPtr_flag <= lqViolationUop_oldest_2_bits_uop_cf_ftqPtr_flag;
      end else begin
        rollbackLqReg_0_uop_cf_ftqPtr_flag <= lqViolationUop_oldest_5_bits_uop_cf_ftqPtr_flag;
      end
    end
    if (rollbackLq_0_valid) begin // @[Reg.scala 17:18]
      if (lqViolationUop_oldest_2_valid & lqViolationUop_oldest_5_valid) begin // @[LoadQueueRAW.scala 209:23]
        if (_lqViolationUop_oldest_T_37) begin // @[LoadQueueRAW.scala 209:49]
          rollbackLqReg_0_uop_cf_ftqPtr_value <= lqViolationUop_oldest_5_bits_uop_cf_ftqPtr_value;
        end else begin
          rollbackLqReg_0_uop_cf_ftqPtr_value <= lqViolationUop_oldest_2_bits_uop_cf_ftqPtr_value;
        end
      end else if (lqViolationUop_oldest_2_valid & ~lqViolationUop_oldest_5_valid) begin // @[LoadQueueRAW.scala 209:119]
        rollbackLqReg_0_uop_cf_ftqPtr_value <= lqViolationUop_oldest_2_bits_uop_cf_ftqPtr_value;
      end else begin
        rollbackLqReg_0_uop_cf_ftqPtr_value <= lqViolationUop_oldest_5_bits_uop_cf_ftqPtr_value;
      end
    end
    if (rollbackLq_0_valid) begin // @[Reg.scala 17:18]
      if (lqViolationUop_oldest_2_valid & lqViolationUop_oldest_5_valid) begin // @[LoadQueueRAW.scala 209:23]
        if (_lqViolationUop_oldest_T_37) begin // @[LoadQueueRAW.scala 209:49]
          rollbackLqReg_0_uop_cf_ftqOffset <= lqViolationUop_oldest_5_bits_uop_cf_ftqOffset;
        end else begin
          rollbackLqReg_0_uop_cf_ftqOffset <= lqViolationUop_oldest_2_bits_uop_cf_ftqOffset;
        end
      end else if (lqViolationUop_oldest_2_valid & ~lqViolationUop_oldest_5_valid) begin // @[LoadQueueRAW.scala 209:119]
        rollbackLqReg_0_uop_cf_ftqOffset <= lqViolationUop_oldest_2_bits_uop_cf_ftqOffset;
      end else begin
        rollbackLqReg_0_uop_cf_ftqOffset <= lqViolationUop_oldest_5_bits_uop_cf_ftqOffset;
      end
    end
    if (rollbackLq_0_valid) begin // @[Reg.scala 17:18]
      if (lqViolationUop_oldest_2_valid & lqViolationUop_oldest_5_valid) begin // @[LoadQueueRAW.scala 209:23]
        if (_lqViolationUop_oldest_T_37) begin // @[LoadQueueRAW.scala 209:49]
          rollbackLqReg_0_uop_robIdx_flag <= lqViolationUop_oldest_5_bits_uop_robIdx_flag;
        end else begin
          rollbackLqReg_0_uop_robIdx_flag <= lqViolationUop_oldest_2_bits_uop_robIdx_flag;
        end
      end else if (lqViolationUop_oldest_2_valid & ~lqViolationUop_oldest_5_valid) begin // @[LoadQueueRAW.scala 209:119]
        rollbackLqReg_0_uop_robIdx_flag <= lqViolationUop_oldest_2_bits_uop_robIdx_flag;
      end else begin
        rollbackLqReg_0_uop_robIdx_flag <= lqViolationUop_oldest_5_bits_uop_robIdx_flag;
      end
    end
    if (rollbackLq_0_valid) begin // @[Reg.scala 17:18]
      if (lqViolationUop_oldest_2_valid & lqViolationUop_oldest_5_valid) begin // @[LoadQueueRAW.scala 209:23]
        if (_lqViolationUop_oldest_T_37) begin // @[LoadQueueRAW.scala 209:49]
          rollbackLqReg_0_uop_robIdx_value <= lqViolationUop_oldest_5_bits_uop_robIdx_value;
        end else begin
          rollbackLqReg_0_uop_robIdx_value <= lqViolationUop_oldest_2_bits_uop_robIdx_value;
        end
      end else if (lqViolationUop_oldest_2_valid & ~lqViolationUop_oldest_5_valid) begin // @[LoadQueueRAW.scala 209:119]
        rollbackLqReg_0_uop_robIdx_value <= lqViolationUop_oldest_2_bits_uop_robIdx_value;
      end else begin
        rollbackLqReg_0_uop_robIdx_value <= lqViolationUop_oldest_5_bits_uop_robIdx_value;
      end
    end
    if (rollbackLq_1_valid) begin // @[Reg.scala 17:18]
      if (lqViolationUop_oldest_9_valid & lqViolationUop_oldest_12_valid) begin // @[LoadQueueRAW.scala 209:23]
        if (_lqViolationUop_oldest_T_79) begin // @[LoadQueueRAW.scala 209:49]
          rollbackLqReg_1_uop_cf_foldpc <= lqViolationUop_oldest_12_bits_uop_cf_foldpc;
        end else begin
          rollbackLqReg_1_uop_cf_foldpc <= lqViolationUop_oldest_9_bits_uop_cf_foldpc;
        end
      end else if (lqViolationUop_oldest_9_valid & ~lqViolationUop_oldest_12_valid) begin // @[LoadQueueRAW.scala 209:119]
        rollbackLqReg_1_uop_cf_foldpc <= lqViolationUop_oldest_9_bits_uop_cf_foldpc;
      end else begin
        rollbackLqReg_1_uop_cf_foldpc <= lqViolationUop_oldest_12_bits_uop_cf_foldpc;
      end
    end
    if (rollbackLq_1_valid) begin // @[Reg.scala 17:18]
      if (lqViolationUop_oldest_9_valid & lqViolationUop_oldest_12_valid) begin // @[LoadQueueRAW.scala 209:23]
        if (_lqViolationUop_oldest_T_79) begin // @[LoadQueueRAW.scala 209:49]
          rollbackLqReg_1_uop_cf_ftqPtr_flag <= lqViolationUop_oldest_12_bits_uop_cf_ftqPtr_flag;
        end else begin
          rollbackLqReg_1_uop_cf_ftqPtr_flag <= lqViolationUop_oldest_9_bits_uop_cf_ftqPtr_flag;
        end
      end else if (lqViolationUop_oldest_9_valid & ~lqViolationUop_oldest_12_valid) begin // @[LoadQueueRAW.scala 209:119]
        rollbackLqReg_1_uop_cf_ftqPtr_flag <= lqViolationUop_oldest_9_bits_uop_cf_ftqPtr_flag;
      end else begin
        rollbackLqReg_1_uop_cf_ftqPtr_flag <= lqViolationUop_oldest_12_bits_uop_cf_ftqPtr_flag;
      end
    end
    if (rollbackLq_1_valid) begin // @[Reg.scala 17:18]
      if (lqViolationUop_oldest_9_valid & lqViolationUop_oldest_12_valid) begin // @[LoadQueueRAW.scala 209:23]
        if (_lqViolationUop_oldest_T_79) begin // @[LoadQueueRAW.scala 209:49]
          rollbackLqReg_1_uop_cf_ftqPtr_value <= lqViolationUop_oldest_12_bits_uop_cf_ftqPtr_value;
        end else begin
          rollbackLqReg_1_uop_cf_ftqPtr_value <= lqViolationUop_oldest_9_bits_uop_cf_ftqPtr_value;
        end
      end else if (lqViolationUop_oldest_9_valid & ~lqViolationUop_oldest_12_valid) begin // @[LoadQueueRAW.scala 209:119]
        rollbackLqReg_1_uop_cf_ftqPtr_value <= lqViolationUop_oldest_9_bits_uop_cf_ftqPtr_value;
      end else begin
        rollbackLqReg_1_uop_cf_ftqPtr_value <= lqViolationUop_oldest_12_bits_uop_cf_ftqPtr_value;
      end
    end
    if (rollbackLq_1_valid) begin // @[Reg.scala 17:18]
      if (lqViolationUop_oldest_9_valid & lqViolationUop_oldest_12_valid) begin // @[LoadQueueRAW.scala 209:23]
        if (_lqViolationUop_oldest_T_79) begin // @[LoadQueueRAW.scala 209:49]
          rollbackLqReg_1_uop_cf_ftqOffset <= lqViolationUop_oldest_12_bits_uop_cf_ftqOffset;
        end else begin
          rollbackLqReg_1_uop_cf_ftqOffset <= lqViolationUop_oldest_9_bits_uop_cf_ftqOffset;
        end
      end else if (lqViolationUop_oldest_9_valid & ~lqViolationUop_oldest_12_valid) begin // @[LoadQueueRAW.scala 209:119]
        rollbackLqReg_1_uop_cf_ftqOffset <= lqViolationUop_oldest_9_bits_uop_cf_ftqOffset;
      end else begin
        rollbackLqReg_1_uop_cf_ftqOffset <= lqViolationUop_oldest_12_bits_uop_cf_ftqOffset;
      end
    end
    if (rollbackLq_1_valid) begin // @[Reg.scala 17:18]
      if (lqViolationUop_oldest_9_valid & lqViolationUop_oldest_12_valid) begin // @[LoadQueueRAW.scala 209:23]
        if (_lqViolationUop_oldest_T_79) begin // @[LoadQueueRAW.scala 209:49]
          rollbackLqReg_1_uop_robIdx_flag <= lqViolationUop_oldest_12_bits_uop_robIdx_flag;
        end else begin
          rollbackLqReg_1_uop_robIdx_flag <= lqViolationUop_oldest_9_bits_uop_robIdx_flag;
        end
      end else if (lqViolationUop_oldest_9_valid & ~lqViolationUop_oldest_12_valid) begin // @[LoadQueueRAW.scala 209:119]
        rollbackLqReg_1_uop_robIdx_flag <= lqViolationUop_oldest_9_bits_uop_robIdx_flag;
      end else begin
        rollbackLqReg_1_uop_robIdx_flag <= lqViolationUop_oldest_12_bits_uop_robIdx_flag;
      end
    end
    if (rollbackLq_1_valid) begin // @[Reg.scala 17:18]
      if (lqViolationUop_oldest_9_valid & lqViolationUop_oldest_12_valid) begin // @[LoadQueueRAW.scala 209:23]
        if (_lqViolationUop_oldest_T_79) begin // @[LoadQueueRAW.scala 209:49]
          rollbackLqReg_1_uop_robIdx_value <= lqViolationUop_oldest_12_bits_uop_robIdx_value;
        end else begin
          rollbackLqReg_1_uop_robIdx_value <= lqViolationUop_oldest_9_bits_uop_robIdx_value;
        end
      end else if (lqViolationUop_oldest_9_valid & ~lqViolationUop_oldest_12_valid) begin // @[LoadQueueRAW.scala 209:119]
        rollbackLqReg_1_uop_robIdx_value <= lqViolationUop_oldest_9_bits_uop_robIdx_value;
      end else begin
        rollbackLqReg_1_uop_robIdx_value <= lqViolationUop_oldest_12_bits_uop_robIdx_value;
      end
    end
    stFtqIdxS3_0_value <= stFtqIdxS2_0_REG_value; // @[LoadQueueRAW.scala 255:24 262:19]
    stFtqIdxS3_1_value <= stFtqIdxS2_1_REG_value; // @[LoadQueueRAW.scala 255:24 262:19]
    stFtqOffsetS3_0 <= stFtqOffsetS2_0_REG; // @[LoadQueueRAW.scala 256:27 263:22]
    stFtqOffsetS3_1 <= stFtqOffsetS2_1_REG; // @[LoadQueueRAW.scala 256:27 263:22]
    io_perf_0_value_REG <= canEnqVec_0 + canEnqVec_1; // @[Bitwise.scala 48:55]
    io_perf_0_value_REG_1 <= io_perf_0_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_1_value_REG <= freeNums == 4'h0; // @[LoadQueueRAW.scala 310:23]
    io_perf_1_value_REG_1 <= io_perf_1_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_2_value_REG <= io_rollback_valid; // @[PerfCounterUtils.scala 188:35]
    io_perf_2_value_REG_1 <= io_perf_2_value_REG; // @[PerfCounterUtils.scala 188:27]
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAW.scala 155:55]
      allocated_0 <= 1'h0; // @[LoadQueueRAW.scala 156:20]
    end else if (allocated_0 & (deqNotBlock | needFlush)) begin // @[LoadQueueRAW.scala 102:46]
      allocated_0 <= 1'h0;
    end else if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      allocated_0 <= _GEN_1796;
    end else if (canEnqVec_0) begin // @[LoadQueueRAW.scala 60:26]
      allocated_0 <= _GEN_0;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAW.scala 155:55]
      allocated_1 <= 1'h0; // @[LoadQueueRAW.scala 156:20]
    end else if (allocated_1 & (deqNotBlock_1 | needFlush_1)) begin // @[LoadQueueRAW.scala 102:46]
      allocated_1 <= 1'h0;
    end else if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      allocated_1 <= _GEN_1797;
    end else if (canEnqVec_0) begin // @[LoadQueueRAW.scala 60:26]
      allocated_1 <= _GEN_1;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAW.scala 155:55]
      allocated_2 <= 1'h0; // @[LoadQueueRAW.scala 156:20]
    end else if (allocated_2 & (deqNotBlock_2 | needFlush_2)) begin // @[LoadQueueRAW.scala 102:46]
      allocated_2 <= 1'h0;
    end else if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      allocated_2 <= _GEN_1798;
    end else if (canEnqVec_0) begin // @[LoadQueueRAW.scala 60:26]
      allocated_2 <= _GEN_2;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAW.scala 155:55]
      allocated_3 <= 1'h0; // @[LoadQueueRAW.scala 156:20]
    end else if (allocated_3 & (deqNotBlock_3 | needFlush_3)) begin // @[LoadQueueRAW.scala 102:46]
      allocated_3 <= 1'h0;
    end else if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      allocated_3 <= _GEN_1799;
    end else if (canEnqVec_0) begin // @[LoadQueueRAW.scala 60:26]
      allocated_3 <= _GEN_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAW.scala 155:55]
      allocated_4 <= 1'h0; // @[LoadQueueRAW.scala 156:20]
    end else if (allocated_4 & (deqNotBlock_4 | needFlush_4)) begin // @[LoadQueueRAW.scala 102:46]
      allocated_4 <= 1'h0;
    end else if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      allocated_4 <= _GEN_1800;
    end else if (canEnqVec_0) begin // @[LoadQueueRAW.scala 60:26]
      allocated_4 <= _GEN_4;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAW.scala 155:55]
      allocated_5 <= 1'h0; // @[LoadQueueRAW.scala 156:20]
    end else if (allocated_5 & (deqNotBlock_5 | needFlush_5)) begin // @[LoadQueueRAW.scala 102:46]
      allocated_5 <= 1'h0;
    end else if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      allocated_5 <= _GEN_1801;
    end else if (canEnqVec_0) begin // @[LoadQueueRAW.scala 60:26]
      allocated_5 <= _GEN_5;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAW.scala 155:55]
      allocated_6 <= 1'h0; // @[LoadQueueRAW.scala 156:20]
    end else if (allocated_6 & (deqNotBlock_6 | needFlush_6)) begin // @[LoadQueueRAW.scala 102:46]
      allocated_6 <= 1'h0;
    end else if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      allocated_6 <= _GEN_1802;
    end else if (canEnqVec_0) begin // @[LoadQueueRAW.scala 60:26]
      allocated_6 <= _GEN_6;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAW.scala 155:55]
      allocated_7 <= 1'h0; // @[LoadQueueRAW.scala 156:20]
    end else if (allocated_7 & (deqNotBlock_7 | needFlush_7)) begin // @[LoadQueueRAW.scala 102:46]
      allocated_7 <= 1'h0;
    end else if (canEnqVec_1) begin // @[LoadQueueRAW.scala 102:46]
      allocated_7 <= _GEN_1803;
    end else if (canEnqVec_0) begin // @[LoadQueueRAW.scala 60:26]
      allocated_7 <= _GEN_7;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAW.scala 136:25]
      datavalid_0 <= 1'h0; // @[LoadQueueRAW.scala 137:{31,31}]
    end else if (lastEnqValid_1) begin
      if (3'h0 == lastEnqIndex_1) begin
        datavalid_0 <= lastEnqBits_1_datavalid & ~schedError_1;
      end else begin
        datavalid_0 <= _GEN_3552;
      end
    end else begin
      datavalid_0 <= _GEN_3552;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAW.scala 136:25]
      datavalid_1 <= 1'h0; // @[LoadQueueRAW.scala 137:{31,31}]
    end else if (lastEnqValid_1) begin
      if (3'h1 == lastEnqIndex_1) begin
        datavalid_1 <= lastEnqBits_1_datavalid & ~schedError_1;
      end else begin
        datavalid_1 <= _GEN_3553;
      end
    end else begin
      datavalid_1 <= _GEN_3553;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAW.scala 136:25]
      datavalid_2 <= 1'h0; // @[LoadQueueRAW.scala 137:{31,31}]
    end else if (lastEnqValid_1) begin
      if (3'h2 == lastEnqIndex_1) begin
        datavalid_2 <= lastEnqBits_1_datavalid & ~schedError_1;
      end else begin
        datavalid_2 <= _GEN_3554;
      end
    end else begin
      datavalid_2 <= _GEN_3554;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAW.scala 136:25]
      datavalid_3 <= 1'h0; // @[LoadQueueRAW.scala 137:{31,31}]
    end else if (lastEnqValid_1) begin
      if (3'h3 == lastEnqIndex_1) begin
        datavalid_3 <= lastEnqBits_1_datavalid & ~schedError_1;
      end else begin
        datavalid_3 <= _GEN_3555;
      end
    end else begin
      datavalid_3 <= _GEN_3555;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAW.scala 136:25]
      datavalid_4 <= 1'h0; // @[LoadQueueRAW.scala 137:{31,31}]
    end else if (lastEnqValid_1) begin
      if (3'h4 == lastEnqIndex_1) begin
        datavalid_4 <= lastEnqBits_1_datavalid & ~schedError_1;
      end else begin
        datavalid_4 <= _GEN_3556;
      end
    end else begin
      datavalid_4 <= _GEN_3556;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAW.scala 136:25]
      datavalid_5 <= 1'h0; // @[LoadQueueRAW.scala 137:{31,31}]
    end else if (lastEnqValid_1) begin
      if (3'h5 == lastEnqIndex_1) begin
        datavalid_5 <= lastEnqBits_1_datavalid & ~schedError_1;
      end else begin
        datavalid_5 <= _GEN_3557;
      end
    end else begin
      datavalid_5 <= _GEN_3557;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAW.scala 136:25]
      datavalid_6 <= 1'h0; // @[LoadQueueRAW.scala 137:{31,31}]
    end else if (lastEnqValid_1) begin
      if (3'h6 == lastEnqIndex_1) begin
        datavalid_6 <= lastEnqBits_1_datavalid & ~schedError_1;
      end else begin
        datavalid_6 <= _GEN_3558;
      end
    end else begin
      datavalid_6 <= _GEN_3558;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueRAW.scala 136:25]
      datavalid_7 <= 1'h0; // @[LoadQueueRAW.scala 137:{31,31}]
    end else if (lastEnqValid_1) begin
      if (3'h7 == lastEnqIndex_1) begin
        datavalid_7 <= lastEnqBits_1_datavalid & ~schedError_1;
      end else begin
        datavalid_7 <= _GEN_3559;
      end
    end else begin
      datavalid_7 <= _GEN_3559;
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
  uop_0_cf_foldpc = _RAND_8[9:0];
  _RAND_9 = {1{`RANDOM}};
  uop_0_cf_ftqPtr_flag = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  uop_0_cf_ftqPtr_value = _RAND_10[2:0];
  _RAND_11 = {1{`RANDOM}};
  uop_0_cf_ftqOffset = _RAND_11[2:0];
  _RAND_12 = {1{`RANDOM}};
  uop_0_robIdx_flag = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  uop_0_robIdx_value = _RAND_13[4:0];
  _RAND_14 = {1{`RANDOM}};
  uop_0_sqIdx_flag = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  uop_0_sqIdx_value = _RAND_15[3:0];
  _RAND_16 = {1{`RANDOM}};
  uop_1_cf_foldpc = _RAND_16[9:0];
  _RAND_17 = {1{`RANDOM}};
  uop_1_cf_ftqPtr_flag = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  uop_1_cf_ftqPtr_value = _RAND_18[2:0];
  _RAND_19 = {1{`RANDOM}};
  uop_1_cf_ftqOffset = _RAND_19[2:0];
  _RAND_20 = {1{`RANDOM}};
  uop_1_robIdx_flag = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  uop_1_robIdx_value = _RAND_21[4:0];
  _RAND_22 = {1{`RANDOM}};
  uop_1_sqIdx_flag = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  uop_1_sqIdx_value = _RAND_23[3:0];
  _RAND_24 = {1{`RANDOM}};
  uop_2_cf_foldpc = _RAND_24[9:0];
  _RAND_25 = {1{`RANDOM}};
  uop_2_cf_ftqPtr_flag = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  uop_2_cf_ftqPtr_value = _RAND_26[2:0];
  _RAND_27 = {1{`RANDOM}};
  uop_2_cf_ftqOffset = _RAND_27[2:0];
  _RAND_28 = {1{`RANDOM}};
  uop_2_robIdx_flag = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  uop_2_robIdx_value = _RAND_29[4:0];
  _RAND_30 = {1{`RANDOM}};
  uop_2_sqIdx_flag = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  uop_2_sqIdx_value = _RAND_31[3:0];
  _RAND_32 = {1{`RANDOM}};
  uop_3_cf_foldpc = _RAND_32[9:0];
  _RAND_33 = {1{`RANDOM}};
  uop_3_cf_ftqPtr_flag = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  uop_3_cf_ftqPtr_value = _RAND_34[2:0];
  _RAND_35 = {1{`RANDOM}};
  uop_3_cf_ftqOffset = _RAND_35[2:0];
  _RAND_36 = {1{`RANDOM}};
  uop_3_robIdx_flag = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  uop_3_robIdx_value = _RAND_37[4:0];
  _RAND_38 = {1{`RANDOM}};
  uop_3_sqIdx_flag = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  uop_3_sqIdx_value = _RAND_39[3:0];
  _RAND_40 = {1{`RANDOM}};
  uop_4_cf_foldpc = _RAND_40[9:0];
  _RAND_41 = {1{`RANDOM}};
  uop_4_cf_ftqPtr_flag = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  uop_4_cf_ftqPtr_value = _RAND_42[2:0];
  _RAND_43 = {1{`RANDOM}};
  uop_4_cf_ftqOffset = _RAND_43[2:0];
  _RAND_44 = {1{`RANDOM}};
  uop_4_robIdx_flag = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  uop_4_robIdx_value = _RAND_45[4:0];
  _RAND_46 = {1{`RANDOM}};
  uop_4_sqIdx_flag = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  uop_4_sqIdx_value = _RAND_47[3:0];
  _RAND_48 = {1{`RANDOM}};
  uop_5_cf_foldpc = _RAND_48[9:0];
  _RAND_49 = {1{`RANDOM}};
  uop_5_cf_ftqPtr_flag = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  uop_5_cf_ftqPtr_value = _RAND_50[2:0];
  _RAND_51 = {1{`RANDOM}};
  uop_5_cf_ftqOffset = _RAND_51[2:0];
  _RAND_52 = {1{`RANDOM}};
  uop_5_robIdx_flag = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  uop_5_robIdx_value = _RAND_53[4:0];
  _RAND_54 = {1{`RANDOM}};
  uop_5_sqIdx_flag = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  uop_5_sqIdx_value = _RAND_55[3:0];
  _RAND_56 = {1{`RANDOM}};
  uop_6_cf_foldpc = _RAND_56[9:0];
  _RAND_57 = {1{`RANDOM}};
  uop_6_cf_ftqPtr_flag = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  uop_6_cf_ftqPtr_value = _RAND_58[2:0];
  _RAND_59 = {1{`RANDOM}};
  uop_6_cf_ftqOffset = _RAND_59[2:0];
  _RAND_60 = {1{`RANDOM}};
  uop_6_robIdx_flag = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  uop_6_robIdx_value = _RAND_61[4:0];
  _RAND_62 = {1{`RANDOM}};
  uop_6_sqIdx_flag = _RAND_62[0:0];
  _RAND_63 = {1{`RANDOM}};
  uop_6_sqIdx_value = _RAND_63[3:0];
  _RAND_64 = {1{`RANDOM}};
  uop_7_cf_foldpc = _RAND_64[9:0];
  _RAND_65 = {1{`RANDOM}};
  uop_7_cf_ftqPtr_flag = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  uop_7_cf_ftqPtr_value = _RAND_66[2:0];
  _RAND_67 = {1{`RANDOM}};
  uop_7_cf_ftqOffset = _RAND_67[2:0];
  _RAND_68 = {1{`RANDOM}};
  uop_7_robIdx_flag = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  uop_7_robIdx_value = _RAND_69[4:0];
  _RAND_70 = {1{`RANDOM}};
  uop_7_sqIdx_flag = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  uop_7_sqIdx_value = _RAND_71[3:0];
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
  lastEnqValid_REG = _RAND_80[0:0];
  _RAND_81 = {1{`RANDOM}};
  lastEnqValid_REG_1 = _RAND_81[2:0];
  _RAND_82 = {1{`RANDOM}};
  lastEnqValid_REG_2_flag = _RAND_82[0:0];
  _RAND_83 = {1{`RANDOM}};
  lastEnqValid_REG_2_value = _RAND_83[4:0];
  _RAND_84 = {1{`RANDOM}};
  lastEnqBits_uop_robIdx_flag = _RAND_84[0:0];
  _RAND_85 = {1{`RANDOM}};
  lastEnqBits_uop_robIdx_value = _RAND_85[4:0];
  _RAND_86 = {1{`RANDOM}};
  lastEnqBits_index = _RAND_86[2:0];
  _RAND_87 = {1{`RANDOM}};
  lastEnqBits_allocated = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  lastEnqBits_datavalid = _RAND_88[0:0];
  _RAND_89 = {1{`RANDOM}};
  lastEnqBits_mask = _RAND_89[7:0];
  _RAND_90 = {2{`RANDOM}};
  lastEnqBits_paddr = _RAND_90[35:0];
  _RAND_91 = {1{`RANDOM}};
  lastEnqIndex_REG = _RAND_91[2:0];
  _RAND_92 = {1{`RANDOM}};
  lastEnqValid_REG_3 = _RAND_92[0:0];
  _RAND_93 = {1{`RANDOM}};
  lastEnqValid_REG_4 = _RAND_93[2:0];
  _RAND_94 = {1{`RANDOM}};
  lastEnqValid_REG_5_flag = _RAND_94[0:0];
  _RAND_95 = {1{`RANDOM}};
  lastEnqValid_REG_5_value = _RAND_95[4:0];
  _RAND_96 = {1{`RANDOM}};
  lastEnqBits_1_uop_robIdx_flag = _RAND_96[0:0];
  _RAND_97 = {1{`RANDOM}};
  lastEnqBits_1_uop_robIdx_value = _RAND_97[4:0];
  _RAND_98 = {1{`RANDOM}};
  lastEnqBits_1_index = _RAND_98[2:0];
  _RAND_99 = {1{`RANDOM}};
  lastEnqBits_1_allocated = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  lastEnqBits_1_datavalid = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  lastEnqBits_1_mask = _RAND_101[7:0];
  _RAND_102 = {2{`RANDOM}};
  lastEnqBits_1_paddr = _RAND_102[35:0];
  _RAND_103 = {1{`RANDOM}};
  lastEnqIndex_REG_1 = _RAND_103[2:0];
  _RAND_104 = {1{`RANDOM}};
  io_query_0_resp_bits_canAccept_REG = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  io_query_0_resp_bits_allocated_REG = _RAND_105[0:0];
  _RAND_106 = {1{`RANDOM}};
  io_query_0_resp_bits_index_REG = _RAND_106[2:0];
  _RAND_107 = {1{`RANDOM}};
  io_query_1_resp_bits_canAccept_REG = _RAND_107[0:0];
  _RAND_108 = {1{`RANDOM}};
  io_query_1_resp_bits_allocated_REG = _RAND_108[0:0];
  _RAND_109 = {1{`RANDOM}};
  io_query_1_resp_bits_index_REG = _RAND_109[2:0];
  _RAND_110 = {1{`RANDOM}};
  lastCycleRedirect_valid = _RAND_110[0:0];
  _RAND_111 = {1{`RANDOM}};
  lastCycleRedirect_bits_robIdx_flag = _RAND_111[0:0];
  _RAND_112 = {1{`RANDOM}};
  lastCycleRedirect_bits_robIdx_value = _RAND_112[4:0];
  _RAND_113 = {1{`RANDOM}};
  lastlastCycleRedirect_valid = _RAND_113[0:0];
  _RAND_114 = {1{`RANDOM}};
  lastlastCycleRedirect_bits_robIdx_flag = _RAND_114[0:0];
  _RAND_115 = {1{`RANDOM}};
  lastlastCycleRedirect_bits_robIdx_value = _RAND_115[4:0];
  _RAND_116 = {1{`RANDOM}};
  addrMaskMatch = _RAND_116[7:0];
  _RAND_117 = {1{`RANDOM}};
  entryNeedCheck__0 = _RAND_117[0:0];
  _RAND_118 = {1{`RANDOM}};
  entryNeedCheck__1 = _RAND_118[0:0];
  _RAND_119 = {1{`RANDOM}};
  entryNeedCheck__2 = _RAND_119[0:0];
  _RAND_120 = {1{`RANDOM}};
  entryNeedCheck__3 = _RAND_120[0:0];
  _RAND_121 = {1{`RANDOM}};
  entryNeedCheck__4 = _RAND_121[0:0];
  _RAND_122 = {1{`RANDOM}};
  entryNeedCheck__5 = _RAND_122[0:0];
  _RAND_123 = {1{`RANDOM}};
  entryNeedCheck__6 = _RAND_123[0:0];
  _RAND_124 = {1{`RANDOM}};
  entryNeedCheck__7 = _RAND_124[0:0];
  _RAND_125 = {1{`RANDOM}};
  lqViolation_REG = _RAND_125[0:0];
  _RAND_126 = {1{`RANDOM}};
  rollbackLq_0_valid_REG = _RAND_126[0:0];
  _RAND_127 = {1{`RANDOM}};
  stFtqIdxS2_0_REG_value = _RAND_127[2:0];
  _RAND_128 = {1{`RANDOM}};
  stFtqOffsetS2_0_REG = _RAND_128[2:0];
  _RAND_129 = {1{`RANDOM}};
  addrMaskMatch_1 = _RAND_129[7:0];
  _RAND_130 = {1{`RANDOM}};
  entryNeedCheck_1_0 = _RAND_130[0:0];
  _RAND_131 = {1{`RANDOM}};
  entryNeedCheck_1_1 = _RAND_131[0:0];
  _RAND_132 = {1{`RANDOM}};
  entryNeedCheck_1_2 = _RAND_132[0:0];
  _RAND_133 = {1{`RANDOM}};
  entryNeedCheck_1_3 = _RAND_133[0:0];
  _RAND_134 = {1{`RANDOM}};
  entryNeedCheck_1_4 = _RAND_134[0:0];
  _RAND_135 = {1{`RANDOM}};
  entryNeedCheck_1_5 = _RAND_135[0:0];
  _RAND_136 = {1{`RANDOM}};
  entryNeedCheck_1_6 = _RAND_136[0:0];
  _RAND_137 = {1{`RANDOM}};
  entryNeedCheck_1_7 = _RAND_137[0:0];
  _RAND_138 = {1{`RANDOM}};
  lqViolation_REG_1 = _RAND_138[0:0];
  _RAND_139 = {1{`RANDOM}};
  rollbackLq_1_valid_REG = _RAND_139[0:0];
  _RAND_140 = {1{`RANDOM}};
  stFtqIdxS2_1_REG_value = _RAND_140[2:0];
  _RAND_141 = {1{`RANDOM}};
  stFtqOffsetS2_1_REG = _RAND_141[2:0];
  _RAND_142 = {1{`RANDOM}};
  rollbackLqVReg_0 = _RAND_142[0:0];
  _RAND_143 = {1{`RANDOM}};
  rollbackLqVReg_1 = _RAND_143[0:0];
  _RAND_144 = {1{`RANDOM}};
  rollbackLqReg_0_uop_cf_foldpc = _RAND_144[9:0];
  _RAND_145 = {1{`RANDOM}};
  rollbackLqReg_0_uop_cf_ftqPtr_flag = _RAND_145[0:0];
  _RAND_146 = {1{`RANDOM}};
  rollbackLqReg_0_uop_cf_ftqPtr_value = _RAND_146[2:0];
  _RAND_147 = {1{`RANDOM}};
  rollbackLqReg_0_uop_cf_ftqOffset = _RAND_147[2:0];
  _RAND_148 = {1{`RANDOM}};
  rollbackLqReg_0_uop_robIdx_flag = _RAND_148[0:0];
  _RAND_149 = {1{`RANDOM}};
  rollbackLqReg_0_uop_robIdx_value = _RAND_149[4:0];
  _RAND_150 = {1{`RANDOM}};
  rollbackLqReg_1_uop_cf_foldpc = _RAND_150[9:0];
  _RAND_151 = {1{`RANDOM}};
  rollbackLqReg_1_uop_cf_ftqPtr_flag = _RAND_151[0:0];
  _RAND_152 = {1{`RANDOM}};
  rollbackLqReg_1_uop_cf_ftqPtr_value = _RAND_152[2:0];
  _RAND_153 = {1{`RANDOM}};
  rollbackLqReg_1_uop_cf_ftqOffset = _RAND_153[2:0];
  _RAND_154 = {1{`RANDOM}};
  rollbackLqReg_1_uop_robIdx_flag = _RAND_154[0:0];
  _RAND_155 = {1{`RANDOM}};
  rollbackLqReg_1_uop_robIdx_value = _RAND_155[4:0];
  _RAND_156 = {1{`RANDOM}};
  stFtqIdxS3_0_value = _RAND_156[2:0];
  _RAND_157 = {1{`RANDOM}};
  stFtqIdxS3_1_value = _RAND_157[2:0];
  _RAND_158 = {1{`RANDOM}};
  stFtqOffsetS3_0 = _RAND_158[2:0];
  _RAND_159 = {1{`RANDOM}};
  stFtqOffsetS3_1 = _RAND_159[2:0];
  _RAND_160 = {1{`RANDOM}};
  io_perf_0_value_REG = _RAND_160[1:0];
  _RAND_161 = {1{`RANDOM}};
  io_perf_0_value_REG_1 = _RAND_161[1:0];
  _RAND_162 = {1{`RANDOM}};
  io_perf_1_value_REG = _RAND_162[0:0];
  _RAND_163 = {1{`RANDOM}};
  io_perf_1_value_REG_1 = _RAND_163[0:0];
  _RAND_164 = {1{`RANDOM}};
  io_perf_2_value_REG = _RAND_164[0:0];
  _RAND_165 = {1{`RANDOM}};
  io_perf_2_value_REG_1 = _RAND_165[0:0];
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
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

