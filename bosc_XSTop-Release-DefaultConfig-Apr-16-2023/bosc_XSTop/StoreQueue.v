module StoreQueue(
  input          clock,
  input          reset,
  output         io_enq_canAccept,
  input          io_enq_lqCanAccept,
  input          io_enq_req_0_valid,
  input          io_enq_req_0_bits_cf_trigger_backendEn_0,
  input  [6:0]   io_enq_req_0_bits_ctrl_fuOpType,
  input          io_enq_req_0_bits_robIdx_flag,
  input  [4:0]   io_enq_req_0_bits_robIdx_value,
  input  [3:0]   io_enq_req_0_bits_sqIdx_value,
  input          io_enq_req_1_valid,
  input          io_enq_req_1_bits_cf_trigger_backendEn_0,
  input  [6:0]   io_enq_req_1_bits_ctrl_fuOpType,
  input          io_enq_req_1_bits_robIdx_flag,
  input  [4:0]   io_enq_req_1_bits_robIdx_value,
  input  [3:0]   io_enq_req_1_bits_sqIdx_value,
  input          io_enq_req_2_valid,
  input          io_enq_req_2_bits_cf_trigger_backendEn_0,
  input  [6:0]   io_enq_req_2_bits_ctrl_fuOpType,
  input          io_enq_req_2_bits_robIdx_flag,
  input  [4:0]   io_enq_req_2_bits_robIdx_value,
  input  [3:0]   io_enq_req_2_bits_sqIdx_value,
  input          io_enq_req_3_valid,
  input          io_enq_req_3_bits_cf_trigger_backendEn_0,
  input  [6:0]   io_enq_req_3_bits_ctrl_fuOpType,
  input          io_enq_req_3_bits_robIdx_flag,
  input  [4:0]   io_enq_req_3_bits_robIdx_value,
  input  [3:0]   io_enq_req_3_bits_sqIdx_value,
  input          io_brqRedirect_valid,
  input          io_brqRedirect_bits_robIdx_flag,
  input  [4:0]   io_brqRedirect_bits_robIdx_value,
  input          io_brqRedirect_bits_level,
  input          io_storeAddrIn_0_valid,
  input  [6:0]   io_storeAddrIn_0_bits_uop_ctrl_fuOpType,
  input  [3:0]   io_storeAddrIn_0_bits_uop_sqIdx_value,
  input  [38:0]  io_storeAddrIn_0_bits_vaddr,
  input  [35:0]  io_storeAddrIn_0_bits_paddr,
  input          io_storeAddrIn_0_bits_wlineflag,
  input          io_storeAddrIn_0_bits_miss,
  input          io_storeAddrIn_1_valid,
  input  [6:0]   io_storeAddrIn_1_bits_uop_ctrl_fuOpType,
  input  [3:0]   io_storeAddrIn_1_bits_uop_sqIdx_value,
  input  [38:0]  io_storeAddrIn_1_bits_vaddr,
  input  [35:0]  io_storeAddrIn_1_bits_paddr,
  input          io_storeAddrIn_1_bits_wlineflag,
  input          io_storeAddrIn_1_bits_miss,
  input          io_storeAddrInRe_0_mmio,
  input          io_storeAddrInRe_0_atomic,
  input          io_storeAddrInRe_1_mmio,
  input          io_storeAddrInRe_1_atomic,
  input          io_storeDataIn_0_valid,
  input  [6:0]   io_storeDataIn_0_bits_uop_ctrl_fuOpType,
  input  [3:0]   io_storeDataIn_0_bits_uop_sqIdx_value,
  input  [63:0]  io_storeDataIn_0_bits_data,
  input          io_storeDataIn_1_valid,
  input  [6:0]   io_storeDataIn_1_bits_uop_ctrl_fuOpType,
  input  [3:0]   io_storeDataIn_1_bits_uop_sqIdx_value,
  input  [63:0]  io_storeDataIn_1_bits_data,
  input          io_storeMaskIn_0_valid,
  input  [3:0]   io_storeMaskIn_0_bits_sqIdx_value,
  input  [15:0]  io_storeMaskIn_0_bits_mask,
  input          io_storeMaskIn_1_valid,
  input  [3:0]   io_storeMaskIn_1_bits_sqIdx_value,
  input  [15:0]  io_storeMaskIn_1_bits_mask,
  input          io_sbuffer_0_ready,
  output         io_sbuffer_0_valid,
  output [35:0]  io_sbuffer_0_bits_addr,
  output [127:0] io_sbuffer_0_bits_data,
  output [15:0]  io_sbuffer_0_bits_mask,
  output [38:0]  io_sbuffer_0_bits_vaddr,
  output         io_sbuffer_0_bits_wline,
  input          io_sbuffer_1_ready,
  output         io_sbuffer_1_valid,
  output [35:0]  io_sbuffer_1_bits_addr,
  output [127:0] io_sbuffer_1_bits_data,
  output [15:0]  io_sbuffer_1_bits_mask,
  output [38:0]  io_sbuffer_1_bits_vaddr,
  output         io_sbuffer_1_bits_wline,
  input          io_uncacheOutstanding,
  input          io_mmioStout_ready,
  output         io_mmioStout_valid,
  output         io_mmioStout_bits_uop_cf_trigger_backendEn_0,
  output         io_mmioStout_bits_uop_robIdx_flag,
  output [4:0]   io_mmioStout_bits_uop_robIdx_value,
  input  [38:0]  io_forward_0_vaddr,
  input  [35:0]  io_forward_0_paddr,
  input          io_forward_0_uop_cf_waitForRobIdx_flag,
  input  [4:0]   io_forward_0_uop_cf_waitForRobIdx_value,
  input          io_forward_0_uop_sqIdx_flag,
  input  [3:0]   io_forward_0_uop_sqIdx_value,
  input          io_forward_0_valid,
  output         io_forward_0_forwardMask_0,
  output         io_forward_0_forwardMask_1,
  output         io_forward_0_forwardMask_2,
  output         io_forward_0_forwardMask_3,
  output         io_forward_0_forwardMask_4,
  output         io_forward_0_forwardMask_5,
  output         io_forward_0_forwardMask_6,
  output         io_forward_0_forwardMask_7,
  output         io_forward_0_forwardMask_8,
  output         io_forward_0_forwardMask_9,
  output         io_forward_0_forwardMask_10,
  output         io_forward_0_forwardMask_11,
  output         io_forward_0_forwardMask_12,
  output         io_forward_0_forwardMask_13,
  output         io_forward_0_forwardMask_14,
  output         io_forward_0_forwardMask_15,
  output [7:0]   io_forward_0_forwardData_0,
  output [7:0]   io_forward_0_forwardData_1,
  output [7:0]   io_forward_0_forwardData_2,
  output [7:0]   io_forward_0_forwardData_3,
  output [7:0]   io_forward_0_forwardData_4,
  output [7:0]   io_forward_0_forwardData_5,
  output [7:0]   io_forward_0_forwardData_6,
  output [7:0]   io_forward_0_forwardData_7,
  output [7:0]   io_forward_0_forwardData_8,
  output [7:0]   io_forward_0_forwardData_9,
  output [7:0]   io_forward_0_forwardData_10,
  output [7:0]   io_forward_0_forwardData_11,
  output [7:0]   io_forward_0_forwardData_12,
  output [7:0]   io_forward_0_forwardData_13,
  output [7:0]   io_forward_0_forwardData_14,
  output [7:0]   io_forward_0_forwardData_15,
  input          io_forward_0_sqIdx_flag,
  output         io_forward_0_dataInvalid,
  output         io_forward_0_matchInvalid,
  output         io_forward_0_schedWait,
  input  [11:0]  io_forward_0_sqIdxMask,
  output         io_forward_0_dataInvalidFast,
  output         io_forward_0_dataInvalidSqIdx_flag,
  output [3:0]   io_forward_0_dataInvalidSqIdx_value,
  output         io_forward_0_addrInvalidSqIdx_flag,
  output [3:0]   io_forward_0_addrInvalidSqIdx_value,
  input  [38:0]  io_forward_1_vaddr,
  input  [35:0]  io_forward_1_paddr,
  input          io_forward_1_uop_cf_waitForRobIdx_flag,
  input  [4:0]   io_forward_1_uop_cf_waitForRobIdx_value,
  input          io_forward_1_uop_sqIdx_flag,
  input  [3:0]   io_forward_1_uop_sqIdx_value,
  input          io_forward_1_valid,
  output         io_forward_1_forwardMask_0,
  output         io_forward_1_forwardMask_1,
  output         io_forward_1_forwardMask_2,
  output         io_forward_1_forwardMask_3,
  output         io_forward_1_forwardMask_4,
  output         io_forward_1_forwardMask_5,
  output         io_forward_1_forwardMask_6,
  output         io_forward_1_forwardMask_7,
  output         io_forward_1_forwardMask_8,
  output         io_forward_1_forwardMask_9,
  output         io_forward_1_forwardMask_10,
  output         io_forward_1_forwardMask_11,
  output         io_forward_1_forwardMask_12,
  output         io_forward_1_forwardMask_13,
  output         io_forward_1_forwardMask_14,
  output         io_forward_1_forwardMask_15,
  output [7:0]   io_forward_1_forwardData_0,
  output [7:0]   io_forward_1_forwardData_1,
  output [7:0]   io_forward_1_forwardData_2,
  output [7:0]   io_forward_1_forwardData_3,
  output [7:0]   io_forward_1_forwardData_4,
  output [7:0]   io_forward_1_forwardData_5,
  output [7:0]   io_forward_1_forwardData_6,
  output [7:0]   io_forward_1_forwardData_7,
  output [7:0]   io_forward_1_forwardData_8,
  output [7:0]   io_forward_1_forwardData_9,
  output [7:0]   io_forward_1_forwardData_10,
  output [7:0]   io_forward_1_forwardData_11,
  output [7:0]   io_forward_1_forwardData_12,
  output [7:0]   io_forward_1_forwardData_13,
  output [7:0]   io_forward_1_forwardData_14,
  output [7:0]   io_forward_1_forwardData_15,
  input          io_forward_1_sqIdx_flag,
  output         io_forward_1_dataInvalid,
  output         io_forward_1_matchInvalid,
  output         io_forward_1_schedWait,
  input  [11:0]  io_forward_1_sqIdxMask,
  output         io_forward_1_dataInvalidFast,
  output         io_forward_1_dataInvalidSqIdx_flag,
  output [3:0]   io_forward_1_dataInvalidSqIdx_value,
  output         io_forward_1_addrInvalidSqIdx_flag,
  output [3:0]   io_forward_1_addrInvalidSqIdx_value,
  input  [1:0]   io_rob_scommit,
  input          io_rob_pendingst,
  input          io_uncache_req_ready,
  output         io_uncache_req_valid,
  output [35:0]  io_uncache_req_bits_addr,
  output [63:0]  io_uncache_req_bits_data,
  output [7:0]   io_uncache_req_bits_mask,
  output         io_uncache_req_bits_atomic,
  output         io_uncache_resp_ready,
  input          io_uncache_resp_valid,
  output [38:0]  io_exceptionAddr_vaddr,
  output         io_sqEmpty,
  output         io_stAddrReadySqPtr_flag,
  output [3:0]   io_stAddrReadySqPtr_value,
  output         io_stDataReadySqPtr_flag,
  output [3:0]   io_stDataReadySqPtr_value,
  output [3:0]   io_sqCancelCnt,
  output [1:0]   io_sqDeq,
  output [5:0]   io_perf_0_value,
  output [5:0]   io_perf_1_value,
  output [5:0]   io_perf_2_value,
  output [5:0]   io_perf_3_value,
  output [5:0]   io_perf_4_value,
  output [5:0]   io_perf_5_value,
  output [5:0]   io_perf_6_value,
  output [5:0]   io_perf_7_value
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
  reg [31:0] _RAND_97;
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
  reg [31:0] _RAND_166;
  reg [31:0] _RAND_167;
  reg [31:0] _RAND_168;
  reg [31:0] _RAND_169;
  reg [31:0] _RAND_170;
  reg [31:0] _RAND_171;
  reg [31:0] _RAND_172;
  reg [31:0] _RAND_173;
  reg [31:0] _RAND_174;
  reg [31:0] _RAND_175;
  reg [31:0] _RAND_176;
  reg [31:0] _RAND_177;
  reg [31:0] _RAND_178;
  reg [31:0] _RAND_179;
  reg [31:0] _RAND_180;
  reg [31:0] _RAND_181;
  reg [31:0] _RAND_182;
  reg [31:0] _RAND_183;
  reg [31:0] _RAND_184;
  reg [31:0] _RAND_185;
  reg [31:0] _RAND_186;
  reg [31:0] _RAND_187;
  reg [31:0] _RAND_188;
  reg [31:0] _RAND_189;
  reg [31:0] _RAND_190;
  reg [31:0] _RAND_191;
  reg [31:0] _RAND_192;
  reg [31:0] _RAND_193;
  reg [31:0] _RAND_194;
  reg [31:0] _RAND_195;
  reg [31:0] _RAND_196;
  reg [31:0] _RAND_197;
  reg [31:0] _RAND_198;
  reg [31:0] _RAND_199;
  reg [31:0] _RAND_200;
  reg [31:0] _RAND_201;
  reg [31:0] _RAND_202;
  reg [31:0] _RAND_203;
  reg [31:0] _RAND_204;
  reg [31:0] _RAND_205;
  reg [31:0] _RAND_206;
  reg [31:0] _RAND_207;
  reg [31:0] _RAND_208;
  reg [31:0] _RAND_209;
  reg [31:0] _RAND_210;
  reg [31:0] _RAND_211;
  reg [31:0] _RAND_212;
  reg [31:0] _RAND_213;
  reg [31:0] _RAND_214;
  reg [31:0] _RAND_215;
  reg [31:0] _RAND_216;
  reg [31:0] _RAND_217;
  reg [31:0] _RAND_218;
  reg [31:0] _RAND_219;
  reg [31:0] _RAND_220;
  reg [31:0] _RAND_221;
  reg [31:0] _RAND_222;
  reg [31:0] _RAND_223;
  reg [31:0] _RAND_224;
  reg [31:0] _RAND_225;
  reg [31:0] _RAND_226;
  reg [31:0] _RAND_227;
  reg [31:0] _RAND_228;
  reg [31:0] _RAND_229;
  reg [31:0] _RAND_230;
  reg [31:0] _RAND_231;
  reg [31:0] _RAND_232;
  reg [31:0] _RAND_233;
  reg [31:0] _RAND_234;
  reg [31:0] _RAND_235;
  reg [31:0] _RAND_236;
  reg [31:0] _RAND_237;
  reg [31:0] _RAND_238;
  reg [31:0] _RAND_239;
  reg [31:0] _RAND_240;
  reg [31:0] _RAND_241;
  reg [31:0] _RAND_242;
  reg [31:0] _RAND_243;
  reg [31:0] _RAND_244;
  reg [31:0] _RAND_245;
  reg [31:0] _RAND_246;
  reg [31:0] _RAND_247;
  reg [31:0] _RAND_248;
  reg [31:0] _RAND_249;
  reg [31:0] _RAND_250;
  reg [31:0] _RAND_251;
  reg [31:0] _RAND_252;
  reg [31:0] _RAND_253;
  reg [31:0] _RAND_254;
  reg [31:0] _RAND_255;
  reg [31:0] _RAND_256;
  reg [31:0] _RAND_257;
  reg [31:0] _RAND_258;
  reg [31:0] _RAND_259;
  reg [31:0] _RAND_260;
  reg [31:0] _RAND_261;
  reg [31:0] _RAND_262;
  reg [31:0] _RAND_263;
  reg [31:0] _RAND_264;
  reg [31:0] _RAND_265;
  reg [31:0] _RAND_266;
  reg [31:0] _RAND_267;
  reg [31:0] _RAND_268;
  reg [31:0] _RAND_269;
  reg [31:0] _RAND_270;
  reg [31:0] _RAND_271;
  reg [31:0] _RAND_272;
  reg [31:0] _RAND_273;
  reg [31:0] _RAND_274;
  reg [31:0] _RAND_275;
  reg [31:0] _RAND_276;
  reg [31:0] _RAND_277;
`endif // RANDOMIZE_REG_INIT
  wire  dataModule_clock; // @[StoreQueue.scala 95:26]
  wire [3:0] dataModule_io_raddr_0; // @[StoreQueue.scala 95:26]
  wire [3:0] dataModule_io_raddr_1; // @[StoreQueue.scala 95:26]
  wire [15:0] dataModule_io_rdata_0_mask; // @[StoreQueue.scala 95:26]
  wire [127:0] dataModule_io_rdata_0_data; // @[StoreQueue.scala 95:26]
  wire [15:0] dataModule_io_rdata_1_mask; // @[StoreQueue.scala 95:26]
  wire [127:0] dataModule_io_rdata_1_data; // @[StoreQueue.scala 95:26]
  wire  dataModule_io_data_wen_0; // @[StoreQueue.scala 95:26]
  wire  dataModule_io_data_wen_1; // @[StoreQueue.scala 95:26]
  wire [3:0] dataModule_io_data_waddr_0; // @[StoreQueue.scala 95:26]
  wire [3:0] dataModule_io_data_waddr_1; // @[StoreQueue.scala 95:26]
  wire [127:0] dataModule_io_data_wdata_0; // @[StoreQueue.scala 95:26]
  wire [127:0] dataModule_io_data_wdata_1; // @[StoreQueue.scala 95:26]
  wire  dataModule_io_mask_wen_0; // @[StoreQueue.scala 95:26]
  wire  dataModule_io_mask_wen_1; // @[StoreQueue.scala 95:26]
  wire [3:0] dataModule_io_mask_waddr_0; // @[StoreQueue.scala 95:26]
  wire [3:0] dataModule_io_mask_waddr_1; // @[StoreQueue.scala 95:26]
  wire [15:0] dataModule_io_mask_wdata_0; // @[StoreQueue.scala 95:26]
  wire [15:0] dataModule_io_mask_wdata_1; // @[StoreQueue.scala 95:26]
  wire [11:0] dataModule_io_needForward_0_0; // @[StoreQueue.scala 95:26]
  wire [11:0] dataModule_io_needForward_0_1; // @[StoreQueue.scala 95:26]
  wire [11:0] dataModule_io_needForward_1_0; // @[StoreQueue.scala 95:26]
  wire [11:0] dataModule_io_needForward_1_1; // @[StoreQueue.scala 95:26]
  wire  dataModule_io_forwardMask_0_0; // @[StoreQueue.scala 95:26]
  wire  dataModule_io_forwardMask_0_1; // @[StoreQueue.scala 95:26]
  wire  dataModule_io_forwardMask_0_2; // @[StoreQueue.scala 95:26]
  wire  dataModule_io_forwardMask_0_3; // @[StoreQueue.scala 95:26]
  wire  dataModule_io_forwardMask_0_4; // @[StoreQueue.scala 95:26]
  wire  dataModule_io_forwardMask_0_5; // @[StoreQueue.scala 95:26]
  wire  dataModule_io_forwardMask_0_6; // @[StoreQueue.scala 95:26]
  wire  dataModule_io_forwardMask_0_7; // @[StoreQueue.scala 95:26]
  wire  dataModule_io_forwardMask_0_8; // @[StoreQueue.scala 95:26]
  wire  dataModule_io_forwardMask_0_9; // @[StoreQueue.scala 95:26]
  wire  dataModule_io_forwardMask_0_10; // @[StoreQueue.scala 95:26]
  wire  dataModule_io_forwardMask_0_11; // @[StoreQueue.scala 95:26]
  wire  dataModule_io_forwardMask_0_12; // @[StoreQueue.scala 95:26]
  wire  dataModule_io_forwardMask_0_13; // @[StoreQueue.scala 95:26]
  wire  dataModule_io_forwardMask_0_14; // @[StoreQueue.scala 95:26]
  wire  dataModule_io_forwardMask_0_15; // @[StoreQueue.scala 95:26]
  wire  dataModule_io_forwardMask_1_0; // @[StoreQueue.scala 95:26]
  wire  dataModule_io_forwardMask_1_1; // @[StoreQueue.scala 95:26]
  wire  dataModule_io_forwardMask_1_2; // @[StoreQueue.scala 95:26]
  wire  dataModule_io_forwardMask_1_3; // @[StoreQueue.scala 95:26]
  wire  dataModule_io_forwardMask_1_4; // @[StoreQueue.scala 95:26]
  wire  dataModule_io_forwardMask_1_5; // @[StoreQueue.scala 95:26]
  wire  dataModule_io_forwardMask_1_6; // @[StoreQueue.scala 95:26]
  wire  dataModule_io_forwardMask_1_7; // @[StoreQueue.scala 95:26]
  wire  dataModule_io_forwardMask_1_8; // @[StoreQueue.scala 95:26]
  wire  dataModule_io_forwardMask_1_9; // @[StoreQueue.scala 95:26]
  wire  dataModule_io_forwardMask_1_10; // @[StoreQueue.scala 95:26]
  wire  dataModule_io_forwardMask_1_11; // @[StoreQueue.scala 95:26]
  wire  dataModule_io_forwardMask_1_12; // @[StoreQueue.scala 95:26]
  wire  dataModule_io_forwardMask_1_13; // @[StoreQueue.scala 95:26]
  wire  dataModule_io_forwardMask_1_14; // @[StoreQueue.scala 95:26]
  wire  dataModule_io_forwardMask_1_15; // @[StoreQueue.scala 95:26]
  wire [7:0] dataModule_io_forwardData_0_0; // @[StoreQueue.scala 95:26]
  wire [7:0] dataModule_io_forwardData_0_1; // @[StoreQueue.scala 95:26]
  wire [7:0] dataModule_io_forwardData_0_2; // @[StoreQueue.scala 95:26]
  wire [7:0] dataModule_io_forwardData_0_3; // @[StoreQueue.scala 95:26]
  wire [7:0] dataModule_io_forwardData_0_4; // @[StoreQueue.scala 95:26]
  wire [7:0] dataModule_io_forwardData_0_5; // @[StoreQueue.scala 95:26]
  wire [7:0] dataModule_io_forwardData_0_6; // @[StoreQueue.scala 95:26]
  wire [7:0] dataModule_io_forwardData_0_7; // @[StoreQueue.scala 95:26]
  wire [7:0] dataModule_io_forwardData_0_8; // @[StoreQueue.scala 95:26]
  wire [7:0] dataModule_io_forwardData_0_9; // @[StoreQueue.scala 95:26]
  wire [7:0] dataModule_io_forwardData_0_10; // @[StoreQueue.scala 95:26]
  wire [7:0] dataModule_io_forwardData_0_11; // @[StoreQueue.scala 95:26]
  wire [7:0] dataModule_io_forwardData_0_12; // @[StoreQueue.scala 95:26]
  wire [7:0] dataModule_io_forwardData_0_13; // @[StoreQueue.scala 95:26]
  wire [7:0] dataModule_io_forwardData_0_14; // @[StoreQueue.scala 95:26]
  wire [7:0] dataModule_io_forwardData_0_15; // @[StoreQueue.scala 95:26]
  wire [7:0] dataModule_io_forwardData_1_0; // @[StoreQueue.scala 95:26]
  wire [7:0] dataModule_io_forwardData_1_1; // @[StoreQueue.scala 95:26]
  wire [7:0] dataModule_io_forwardData_1_2; // @[StoreQueue.scala 95:26]
  wire [7:0] dataModule_io_forwardData_1_3; // @[StoreQueue.scala 95:26]
  wire [7:0] dataModule_io_forwardData_1_4; // @[StoreQueue.scala 95:26]
  wire [7:0] dataModule_io_forwardData_1_5; // @[StoreQueue.scala 95:26]
  wire [7:0] dataModule_io_forwardData_1_6; // @[StoreQueue.scala 95:26]
  wire [7:0] dataModule_io_forwardData_1_7; // @[StoreQueue.scala 95:26]
  wire [7:0] dataModule_io_forwardData_1_8; // @[StoreQueue.scala 95:26]
  wire [7:0] dataModule_io_forwardData_1_9; // @[StoreQueue.scala 95:26]
  wire [7:0] dataModule_io_forwardData_1_10; // @[StoreQueue.scala 95:26]
  wire [7:0] dataModule_io_forwardData_1_11; // @[StoreQueue.scala 95:26]
  wire [7:0] dataModule_io_forwardData_1_12; // @[StoreQueue.scala 95:26]
  wire [7:0] dataModule_io_forwardData_1_13; // @[StoreQueue.scala 95:26]
  wire [7:0] dataModule_io_forwardData_1_14; // @[StoreQueue.scala 95:26]
  wire [7:0] dataModule_io_forwardData_1_15; // @[StoreQueue.scala 95:26]
  wire  paddrModule_clock; // @[StoreQueue.scala 102:27]
  wire [3:0] paddrModule_io_raddr_0; // @[StoreQueue.scala 102:27]
  wire [3:0] paddrModule_io_raddr_1; // @[StoreQueue.scala 102:27]
  wire [35:0] paddrModule_io_rdata_0; // @[StoreQueue.scala 102:27]
  wire [35:0] paddrModule_io_rdata_1; // @[StoreQueue.scala 102:27]
  wire  paddrModule_io_rlineflag_0; // @[StoreQueue.scala 102:27]
  wire  paddrModule_io_rlineflag_1; // @[StoreQueue.scala 102:27]
  wire  paddrModule_io_wen_0; // @[StoreQueue.scala 102:27]
  wire  paddrModule_io_wen_1; // @[StoreQueue.scala 102:27]
  wire [3:0] paddrModule_io_waddr_0; // @[StoreQueue.scala 102:27]
  wire [3:0] paddrModule_io_waddr_1; // @[StoreQueue.scala 102:27]
  wire [35:0] paddrModule_io_wdata_0; // @[StoreQueue.scala 102:27]
  wire [35:0] paddrModule_io_wdata_1; // @[StoreQueue.scala 102:27]
  wire  paddrModule_io_wlineflag_0; // @[StoreQueue.scala 102:27]
  wire  paddrModule_io_wlineflag_1; // @[StoreQueue.scala 102:27]
  wire [35:0] paddrModule_io_forwardMdata_0; // @[StoreQueue.scala 102:27]
  wire [35:0] paddrModule_io_forwardMdata_1; // @[StoreQueue.scala 102:27]
  wire  paddrModule_io_forwardMmask_0_0; // @[StoreQueue.scala 102:27]
  wire  paddrModule_io_forwardMmask_0_1; // @[StoreQueue.scala 102:27]
  wire  paddrModule_io_forwardMmask_0_2; // @[StoreQueue.scala 102:27]
  wire  paddrModule_io_forwardMmask_0_3; // @[StoreQueue.scala 102:27]
  wire  paddrModule_io_forwardMmask_0_4; // @[StoreQueue.scala 102:27]
  wire  paddrModule_io_forwardMmask_0_5; // @[StoreQueue.scala 102:27]
  wire  paddrModule_io_forwardMmask_0_6; // @[StoreQueue.scala 102:27]
  wire  paddrModule_io_forwardMmask_0_7; // @[StoreQueue.scala 102:27]
  wire  paddrModule_io_forwardMmask_0_8; // @[StoreQueue.scala 102:27]
  wire  paddrModule_io_forwardMmask_0_9; // @[StoreQueue.scala 102:27]
  wire  paddrModule_io_forwardMmask_0_10; // @[StoreQueue.scala 102:27]
  wire  paddrModule_io_forwardMmask_0_11; // @[StoreQueue.scala 102:27]
  wire  paddrModule_io_forwardMmask_1_0; // @[StoreQueue.scala 102:27]
  wire  paddrModule_io_forwardMmask_1_1; // @[StoreQueue.scala 102:27]
  wire  paddrModule_io_forwardMmask_1_2; // @[StoreQueue.scala 102:27]
  wire  paddrModule_io_forwardMmask_1_3; // @[StoreQueue.scala 102:27]
  wire  paddrModule_io_forwardMmask_1_4; // @[StoreQueue.scala 102:27]
  wire  paddrModule_io_forwardMmask_1_5; // @[StoreQueue.scala 102:27]
  wire  paddrModule_io_forwardMmask_1_6; // @[StoreQueue.scala 102:27]
  wire  paddrModule_io_forwardMmask_1_7; // @[StoreQueue.scala 102:27]
  wire  paddrModule_io_forwardMmask_1_8; // @[StoreQueue.scala 102:27]
  wire  paddrModule_io_forwardMmask_1_9; // @[StoreQueue.scala 102:27]
  wire  paddrModule_io_forwardMmask_1_10; // @[StoreQueue.scala 102:27]
  wire  paddrModule_io_forwardMmask_1_11; // @[StoreQueue.scala 102:27]
  wire  vaddrModule_clock; // @[StoreQueue.scala 110:27]
  wire [3:0] vaddrModule_io_raddr_0; // @[StoreQueue.scala 110:27]
  wire [3:0] vaddrModule_io_raddr_1; // @[StoreQueue.scala 110:27]
  wire [3:0] vaddrModule_io_raddr_2; // @[StoreQueue.scala 110:27]
  wire [38:0] vaddrModule_io_rdata_0; // @[StoreQueue.scala 110:27]
  wire [38:0] vaddrModule_io_rdata_1; // @[StoreQueue.scala 110:27]
  wire [38:0] vaddrModule_io_rdata_2; // @[StoreQueue.scala 110:27]
  wire  vaddrModule_io_wen_0; // @[StoreQueue.scala 110:27]
  wire  vaddrModule_io_wen_1; // @[StoreQueue.scala 110:27]
  wire [3:0] vaddrModule_io_waddr_0; // @[StoreQueue.scala 110:27]
  wire [3:0] vaddrModule_io_waddr_1; // @[StoreQueue.scala 110:27]
  wire [38:0] vaddrModule_io_wdata_0; // @[StoreQueue.scala 110:27]
  wire [38:0] vaddrModule_io_wdata_1; // @[StoreQueue.scala 110:27]
  wire  vaddrModule_io_wlineflag_0; // @[StoreQueue.scala 110:27]
  wire  vaddrModule_io_wlineflag_1; // @[StoreQueue.scala 110:27]
  wire [38:0] vaddrModule_io_forwardMdata_0; // @[StoreQueue.scala 110:27]
  wire [38:0] vaddrModule_io_forwardMdata_1; // @[StoreQueue.scala 110:27]
  wire  vaddrModule_io_forwardMmask_0_0; // @[StoreQueue.scala 110:27]
  wire  vaddrModule_io_forwardMmask_0_1; // @[StoreQueue.scala 110:27]
  wire  vaddrModule_io_forwardMmask_0_2; // @[StoreQueue.scala 110:27]
  wire  vaddrModule_io_forwardMmask_0_3; // @[StoreQueue.scala 110:27]
  wire  vaddrModule_io_forwardMmask_0_4; // @[StoreQueue.scala 110:27]
  wire  vaddrModule_io_forwardMmask_0_5; // @[StoreQueue.scala 110:27]
  wire  vaddrModule_io_forwardMmask_0_6; // @[StoreQueue.scala 110:27]
  wire  vaddrModule_io_forwardMmask_0_7; // @[StoreQueue.scala 110:27]
  wire  vaddrModule_io_forwardMmask_0_8; // @[StoreQueue.scala 110:27]
  wire  vaddrModule_io_forwardMmask_0_9; // @[StoreQueue.scala 110:27]
  wire  vaddrModule_io_forwardMmask_0_10; // @[StoreQueue.scala 110:27]
  wire  vaddrModule_io_forwardMmask_0_11; // @[StoreQueue.scala 110:27]
  wire  vaddrModule_io_forwardMmask_1_0; // @[StoreQueue.scala 110:27]
  wire  vaddrModule_io_forwardMmask_1_1; // @[StoreQueue.scala 110:27]
  wire  vaddrModule_io_forwardMmask_1_2; // @[StoreQueue.scala 110:27]
  wire  vaddrModule_io_forwardMmask_1_3; // @[StoreQueue.scala 110:27]
  wire  vaddrModule_io_forwardMmask_1_4; // @[StoreQueue.scala 110:27]
  wire  vaddrModule_io_forwardMmask_1_5; // @[StoreQueue.scala 110:27]
  wire  vaddrModule_io_forwardMmask_1_6; // @[StoreQueue.scala 110:27]
  wire  vaddrModule_io_forwardMmask_1_7; // @[StoreQueue.scala 110:27]
  wire  vaddrModule_io_forwardMmask_1_8; // @[StoreQueue.scala 110:27]
  wire  vaddrModule_io_forwardMmask_1_9; // @[StoreQueue.scala 110:27]
  wire  vaddrModule_io_forwardMmask_1_10; // @[StoreQueue.scala 110:27]
  wire  vaddrModule_io_forwardMmask_1_11; // @[StoreQueue.scala 110:27]
  wire  dataBuffer_clock; // @[StoreQueue.scala 118:26]
  wire  dataBuffer_reset; // @[StoreQueue.scala 118:26]
  wire  dataBuffer_io_enq_0_ready; // @[StoreQueue.scala 118:26]
  wire  dataBuffer_io_enq_0_valid; // @[StoreQueue.scala 118:26]
  wire [35:0] dataBuffer_io_enq_0_bits_addr; // @[StoreQueue.scala 118:26]
  wire [38:0] dataBuffer_io_enq_0_bits_vaddr; // @[StoreQueue.scala 118:26]
  wire [127:0] dataBuffer_io_enq_0_bits_data; // @[StoreQueue.scala 118:26]
  wire [15:0] dataBuffer_io_enq_0_bits_mask; // @[StoreQueue.scala 118:26]
  wire  dataBuffer_io_enq_0_bits_wline; // @[StoreQueue.scala 118:26]
  wire [3:0] dataBuffer_io_enq_0_bits_sqPtr_value; // @[StoreQueue.scala 118:26]
  wire  dataBuffer_io_enq_1_ready; // @[StoreQueue.scala 118:26]
  wire  dataBuffer_io_enq_1_valid; // @[StoreQueue.scala 118:26]
  wire [35:0] dataBuffer_io_enq_1_bits_addr; // @[StoreQueue.scala 118:26]
  wire [38:0] dataBuffer_io_enq_1_bits_vaddr; // @[StoreQueue.scala 118:26]
  wire [127:0] dataBuffer_io_enq_1_bits_data; // @[StoreQueue.scala 118:26]
  wire [15:0] dataBuffer_io_enq_1_bits_mask; // @[StoreQueue.scala 118:26]
  wire  dataBuffer_io_enq_1_bits_wline; // @[StoreQueue.scala 118:26]
  wire [3:0] dataBuffer_io_enq_1_bits_sqPtr_value; // @[StoreQueue.scala 118:26]
  wire  dataBuffer_io_deq_0_ready; // @[StoreQueue.scala 118:26]
  wire  dataBuffer_io_deq_0_valid; // @[StoreQueue.scala 118:26]
  wire [35:0] dataBuffer_io_deq_0_bits_addr; // @[StoreQueue.scala 118:26]
  wire [38:0] dataBuffer_io_deq_0_bits_vaddr; // @[StoreQueue.scala 118:26]
  wire [127:0] dataBuffer_io_deq_0_bits_data; // @[StoreQueue.scala 118:26]
  wire [15:0] dataBuffer_io_deq_0_bits_mask; // @[StoreQueue.scala 118:26]
  wire  dataBuffer_io_deq_0_bits_wline; // @[StoreQueue.scala 118:26]
  wire [3:0] dataBuffer_io_deq_0_bits_sqPtr_value; // @[StoreQueue.scala 118:26]
  wire  dataBuffer_io_deq_1_ready; // @[StoreQueue.scala 118:26]
  wire  dataBuffer_io_deq_1_valid; // @[StoreQueue.scala 118:26]
  wire [35:0] dataBuffer_io_deq_1_bits_addr; // @[StoreQueue.scala 118:26]
  wire [38:0] dataBuffer_io_deq_1_bits_vaddr; // @[StoreQueue.scala 118:26]
  wire [127:0] dataBuffer_io_deq_1_bits_data; // @[StoreQueue.scala 118:26]
  wire [15:0] dataBuffer_io_deq_1_bits_mask; // @[StoreQueue.scala 118:26]
  wire  dataBuffer_io_deq_1_bits_wline; // @[StoreQueue.scala 118:26]
  wire [3:0] dataBuffer_io_deq_1_bits_sqPtr_value; // @[StoreQueue.scala 118:26]
  reg  uop_0_cf_trigger_backendEn_0; // @[StoreQueue.scala 93:16]
  reg [6:0] uop_0_ctrl_fuOpType; // @[StoreQueue.scala 93:16]
  reg  uop_0_robIdx_flag; // @[StoreQueue.scala 93:16]
  reg [4:0] uop_0_robIdx_value; // @[StoreQueue.scala 93:16]
  reg  uop_1_cf_trigger_backendEn_0; // @[StoreQueue.scala 93:16]
  reg [6:0] uop_1_ctrl_fuOpType; // @[StoreQueue.scala 93:16]
  reg  uop_1_robIdx_flag; // @[StoreQueue.scala 93:16]
  reg [4:0] uop_1_robIdx_value; // @[StoreQueue.scala 93:16]
  reg  uop_2_cf_trigger_backendEn_0; // @[StoreQueue.scala 93:16]
  reg [6:0] uop_2_ctrl_fuOpType; // @[StoreQueue.scala 93:16]
  reg  uop_2_robIdx_flag; // @[StoreQueue.scala 93:16]
  reg [4:0] uop_2_robIdx_value; // @[StoreQueue.scala 93:16]
  reg  uop_3_cf_trigger_backendEn_0; // @[StoreQueue.scala 93:16]
  reg [6:0] uop_3_ctrl_fuOpType; // @[StoreQueue.scala 93:16]
  reg  uop_3_robIdx_flag; // @[StoreQueue.scala 93:16]
  reg [4:0] uop_3_robIdx_value; // @[StoreQueue.scala 93:16]
  reg  uop_4_cf_trigger_backendEn_0; // @[StoreQueue.scala 93:16]
  reg [6:0] uop_4_ctrl_fuOpType; // @[StoreQueue.scala 93:16]
  reg  uop_4_robIdx_flag; // @[StoreQueue.scala 93:16]
  reg [4:0] uop_4_robIdx_value; // @[StoreQueue.scala 93:16]
  reg  uop_5_cf_trigger_backendEn_0; // @[StoreQueue.scala 93:16]
  reg [6:0] uop_5_ctrl_fuOpType; // @[StoreQueue.scala 93:16]
  reg  uop_5_robIdx_flag; // @[StoreQueue.scala 93:16]
  reg [4:0] uop_5_robIdx_value; // @[StoreQueue.scala 93:16]
  reg  uop_6_cf_trigger_backendEn_0; // @[StoreQueue.scala 93:16]
  reg [6:0] uop_6_ctrl_fuOpType; // @[StoreQueue.scala 93:16]
  reg  uop_6_robIdx_flag; // @[StoreQueue.scala 93:16]
  reg [4:0] uop_6_robIdx_value; // @[StoreQueue.scala 93:16]
  reg  uop_7_cf_trigger_backendEn_0; // @[StoreQueue.scala 93:16]
  reg [6:0] uop_7_ctrl_fuOpType; // @[StoreQueue.scala 93:16]
  reg  uop_7_robIdx_flag; // @[StoreQueue.scala 93:16]
  reg [4:0] uop_7_robIdx_value; // @[StoreQueue.scala 93:16]
  reg  uop_8_cf_trigger_backendEn_0; // @[StoreQueue.scala 93:16]
  reg [6:0] uop_8_ctrl_fuOpType; // @[StoreQueue.scala 93:16]
  reg  uop_8_robIdx_flag; // @[StoreQueue.scala 93:16]
  reg [4:0] uop_8_robIdx_value; // @[StoreQueue.scala 93:16]
  reg  uop_9_cf_trigger_backendEn_0; // @[StoreQueue.scala 93:16]
  reg [6:0] uop_9_ctrl_fuOpType; // @[StoreQueue.scala 93:16]
  reg  uop_9_robIdx_flag; // @[StoreQueue.scala 93:16]
  reg [4:0] uop_9_robIdx_value; // @[StoreQueue.scala 93:16]
  reg  uop_10_cf_trigger_backendEn_0; // @[StoreQueue.scala 93:16]
  reg [6:0] uop_10_ctrl_fuOpType; // @[StoreQueue.scala 93:16]
  reg  uop_10_robIdx_flag; // @[StoreQueue.scala 93:16]
  reg [4:0] uop_10_robIdx_value; // @[StoreQueue.scala 93:16]
  reg  uop_11_cf_trigger_backendEn_0; // @[StoreQueue.scala 93:16]
  reg [6:0] uop_11_ctrl_fuOpType; // @[StoreQueue.scala 93:16]
  reg  uop_11_robIdx_flag; // @[StoreQueue.scala 93:16]
  reg [4:0] uop_11_robIdx_value; // @[StoreQueue.scala 93:16]
  reg  allocated_0; // @[StoreQueue.scala 124:26]
  reg  allocated_1; // @[StoreQueue.scala 124:26]
  reg  allocated_2; // @[StoreQueue.scala 124:26]
  reg  allocated_3; // @[StoreQueue.scala 124:26]
  reg  allocated_4; // @[StoreQueue.scala 124:26]
  reg  allocated_5; // @[StoreQueue.scala 124:26]
  reg  allocated_6; // @[StoreQueue.scala 124:26]
  reg  allocated_7; // @[StoreQueue.scala 124:26]
  reg  allocated_8; // @[StoreQueue.scala 124:26]
  reg  allocated_9; // @[StoreQueue.scala 124:26]
  reg  allocated_10; // @[StoreQueue.scala 124:26]
  reg  allocated_11; // @[StoreQueue.scala 124:26]
  reg  addrvalid_0; // @[StoreQueue.scala 125:26]
  reg  addrvalid_1; // @[StoreQueue.scala 125:26]
  reg  addrvalid_2; // @[StoreQueue.scala 125:26]
  reg  addrvalid_3; // @[StoreQueue.scala 125:26]
  reg  addrvalid_4; // @[StoreQueue.scala 125:26]
  reg  addrvalid_5; // @[StoreQueue.scala 125:26]
  reg  addrvalid_6; // @[StoreQueue.scala 125:26]
  reg  addrvalid_7; // @[StoreQueue.scala 125:26]
  reg  addrvalid_8; // @[StoreQueue.scala 125:26]
  reg  addrvalid_9; // @[StoreQueue.scala 125:26]
  reg  addrvalid_10; // @[StoreQueue.scala 125:26]
  reg  addrvalid_11; // @[StoreQueue.scala 125:26]
  reg  datavalid_0; // @[StoreQueue.scala 126:26]
  reg  datavalid_1; // @[StoreQueue.scala 126:26]
  reg  datavalid_2; // @[StoreQueue.scala 126:26]
  reg  datavalid_3; // @[StoreQueue.scala 126:26]
  reg  datavalid_4; // @[StoreQueue.scala 126:26]
  reg  datavalid_5; // @[StoreQueue.scala 126:26]
  reg  datavalid_6; // @[StoreQueue.scala 126:26]
  reg  datavalid_7; // @[StoreQueue.scala 126:26]
  reg  datavalid_8; // @[StoreQueue.scala 126:26]
  reg  datavalid_9; // @[StoreQueue.scala 126:26]
  reg  datavalid_10; // @[StoreQueue.scala 126:26]
  reg  datavalid_11; // @[StoreQueue.scala 126:26]
  wire  allvalid_0 = addrvalid_0 & datavalid_0; // @[StoreQueue.scala 127:74]
  wire  allvalid_1 = addrvalid_1 & datavalid_1; // @[StoreQueue.scala 127:74]
  wire  allvalid_2 = addrvalid_2 & datavalid_2; // @[StoreQueue.scala 127:74]
  wire  allvalid_3 = addrvalid_3 & datavalid_3; // @[StoreQueue.scala 127:74]
  wire  allvalid_4 = addrvalid_4 & datavalid_4; // @[StoreQueue.scala 127:74]
  wire  allvalid_5 = addrvalid_5 & datavalid_5; // @[StoreQueue.scala 127:74]
  wire  allvalid_6 = addrvalid_6 & datavalid_6; // @[StoreQueue.scala 127:74]
  wire  allvalid_7 = addrvalid_7 & datavalid_7; // @[StoreQueue.scala 127:74]
  wire  allvalid_8 = addrvalid_8 & datavalid_8; // @[StoreQueue.scala 127:74]
  wire  allvalid_9 = addrvalid_9 & datavalid_9; // @[StoreQueue.scala 127:74]
  wire  allvalid_10 = addrvalid_10 & datavalid_10; // @[StoreQueue.scala 127:74]
  wire  allvalid_11 = addrvalid_11 & datavalid_11; // @[StoreQueue.scala 127:74]
  reg  committed_0; // @[StoreQueue.scala 128:22]
  reg  committed_1; // @[StoreQueue.scala 128:22]
  reg  committed_2; // @[StoreQueue.scala 128:22]
  reg  committed_3; // @[StoreQueue.scala 128:22]
  reg  committed_4; // @[StoreQueue.scala 128:22]
  reg  committed_5; // @[StoreQueue.scala 128:22]
  reg  committed_6; // @[StoreQueue.scala 128:22]
  reg  committed_7; // @[StoreQueue.scala 128:22]
  reg  committed_8; // @[StoreQueue.scala 128:22]
  reg  committed_9; // @[StoreQueue.scala 128:22]
  reg  committed_10; // @[StoreQueue.scala 128:22]
  reg  committed_11; // @[StoreQueue.scala 128:22]
  reg  pending_0; // @[StoreQueue.scala 129:20]
  reg  pending_1; // @[StoreQueue.scala 129:20]
  reg  pending_2; // @[StoreQueue.scala 129:20]
  reg  pending_3; // @[StoreQueue.scala 129:20]
  reg  pending_4; // @[StoreQueue.scala 129:20]
  reg  pending_5; // @[StoreQueue.scala 129:20]
  reg  pending_6; // @[StoreQueue.scala 129:20]
  reg  pending_7; // @[StoreQueue.scala 129:20]
  reg  pending_8; // @[StoreQueue.scala 129:20]
  reg  pending_9; // @[StoreQueue.scala 129:20]
  reg  pending_10; // @[StoreQueue.scala 129:20]
  reg  pending_11; // @[StoreQueue.scala 129:20]
  reg  mmio_0; // @[StoreQueue.scala 130:17]
  reg  mmio_1; // @[StoreQueue.scala 130:17]
  reg  mmio_2; // @[StoreQueue.scala 130:17]
  reg  mmio_3; // @[StoreQueue.scala 130:17]
  reg  mmio_4; // @[StoreQueue.scala 130:17]
  reg  mmio_5; // @[StoreQueue.scala 130:17]
  reg  mmio_6; // @[StoreQueue.scala 130:17]
  reg  mmio_7; // @[StoreQueue.scala 130:17]
  reg  mmio_8; // @[StoreQueue.scala 130:17]
  reg  mmio_9; // @[StoreQueue.scala 130:17]
  reg  mmio_10; // @[StoreQueue.scala 130:17]
  reg  mmio_11; // @[StoreQueue.scala 130:17]
  reg  atomic_0; // @[StoreQueue.scala 131:19]
  reg  atomic_1; // @[StoreQueue.scala 131:19]
  reg  atomic_2; // @[StoreQueue.scala 131:19]
  reg  atomic_3; // @[StoreQueue.scala 131:19]
  reg  atomic_4; // @[StoreQueue.scala 131:19]
  reg  atomic_5; // @[StoreQueue.scala 131:19]
  reg  atomic_6; // @[StoreQueue.scala 131:19]
  reg  atomic_7; // @[StoreQueue.scala 131:19]
  reg  atomic_8; // @[StoreQueue.scala 131:19]
  reg  atomic_9; // @[StoreQueue.scala 131:19]
  reg  atomic_10; // @[StoreQueue.scala 131:19]
  reg  atomic_11; // @[StoreQueue.scala 131:19]
  reg  tosbuffer_0; // @[StoreQueue.scala 132:26]
  reg  tosbuffer_1; // @[StoreQueue.scala 132:26]
  reg  tosbuffer_2; // @[StoreQueue.scala 132:26]
  reg  tosbuffer_3; // @[StoreQueue.scala 132:26]
  reg  tosbuffer_4; // @[StoreQueue.scala 132:26]
  reg  tosbuffer_5; // @[StoreQueue.scala 132:26]
  reg  tosbuffer_6; // @[StoreQueue.scala 132:26]
  reg  tosbuffer_7; // @[StoreQueue.scala 132:26]
  reg  tosbuffer_8; // @[StoreQueue.scala 132:26]
  reg  tosbuffer_9; // @[StoreQueue.scala 132:26]
  reg  tosbuffer_10; // @[StoreQueue.scala 132:26]
  reg  tosbuffer_11; // @[StoreQueue.scala 132:26]
  reg  enqPtrExt_0_flag; // @[StoreQueue.scala 135:26]
  reg [3:0] enqPtrExt_0_value; // @[StoreQueue.scala 135:26]
  reg [3:0] rdataPtrExt_0_value; // @[StoreQueue.scala 136:28]
  reg [3:0] rdataPtrExt_1_value; // @[StoreQueue.scala 136:28]
  reg  deqPtrExt_0_flag; // @[StoreQueue.scala 137:26]
  reg [3:0] deqPtrExt_0_value; // @[StoreQueue.scala 137:26]
  reg  cmtPtrExt_0_flag; // @[StoreQueue.scala 138:26]
  reg [3:0] cmtPtrExt_0_value; // @[StoreQueue.scala 138:26]
  reg [3:0] cmtPtrExt_1_value; // @[StoreQueue.scala 138:26]
  reg  addrReadyPtrExt_flag; // @[StoreQueue.scala 139:32]
  reg [3:0] addrReadyPtrExt_value; // @[StoreQueue.scala 139:32]
  reg  dataReadyPtrExt_flag; // @[StoreQueue.scala 140:32]
  reg [3:0] dataReadyPtrExt_value; // @[StoreQueue.scala 140:32]
  wire  _validCount_T = enqPtrExt_0_flag == deqPtrExt_0_flag; // @[CircularQueuePtr.scala 80:22]
  wire [3:0] _validCount_T_2 = enqPtrExt_0_value - deqPtrExt_0_value; // @[CircularQueuePtr.scala 81:21]
  wire [3:0] _validCount_T_4 = 4'hc + enqPtrExt_0_value; // @[CircularQueuePtr.scala 82:25]
  wire [3:0] _validCount_T_6 = _validCount_T_4 - deqPtrExt_0_value; // @[CircularQueuePtr.scala 82:41]
  wire [3:0] validCount = enqPtrExt_0_flag == deqPtrExt_0_flag ? _validCount_T_2 : _validCount_T_6; // @[CircularQueuePtr.scala 80:8]
  wire [15:0] _deqMask_T = 16'h1 << deqPtrExt_0_value; // @[OneHot.scala 57:35]
  wire [11:0] deqMask = _deqMask_T[11:0] - 12'h1; // @[BitUtils.scala 179:75]
  reg [1:0] commitCount; // @[StoreQueue.scala 153:28]
  wire  _rdataPtrExtNext_T = dataBuffer_io_enq_1_ready & dataBuffer_io_enq_1_valid; // @[Decoupled.scala 50:35]
  wire [4:0] rdataPtrExtNext_new_value = rdataPtrExt_0_value + 4'h2; // @[CircularQueuePtr.scala 41:34]
  wire [5:0] _rdataPtrExtNext_diff_T_1 = {1'h0,rdataPtrExtNext_new_value}; // @[CircularQueuePtr.scala 42:49]
  wire [5:0] rdataPtrExtNext_diff = $signed(_rdataPtrExtNext_diff_T_1) - 6'shc; // @[CircularQueuePtr.scala 42:52]
  wire  rdataPtrExtNext_reverse_flag = $signed(rdataPtrExtNext_diff) >= 6'sh0; // @[CircularQueuePtr.scala 43:31]
  wire [5:0] _rdataPtrExtNext_new_ptr_value_T = $signed(_rdataPtrExtNext_diff_T_1) - 6'shc; // @[CircularQueuePtr.scala 46:20]
  wire [5:0] _rdataPtrExtNext_new_ptr_value_T_1 = rdataPtrExtNext_reverse_flag ? _rdataPtrExtNext_new_ptr_value_T : {{1
    'd0}, rdataPtrExtNext_new_value}; // @[CircularQueuePtr.scala 45:27]
  wire [4:0] rdataPtrExtNext_new_value_1 = rdataPtrExt_1_value + 4'h2; // @[CircularQueuePtr.scala 41:34]
  wire [5:0] _rdataPtrExtNext_diff_T_7 = {1'h0,rdataPtrExtNext_new_value_1}; // @[CircularQueuePtr.scala 42:49]
  wire [5:0] rdataPtrExtNext_diff_1 = $signed(_rdataPtrExtNext_diff_T_7) - 6'shc; // @[CircularQueuePtr.scala 42:52]
  wire  rdataPtrExtNext_reverse_flag_1 = $signed(rdataPtrExtNext_diff_1) >= 6'sh0; // @[CircularQueuePtr.scala 43:31]
  wire [5:0] _rdataPtrExtNext_new_ptr_value_T_2 = $signed(_rdataPtrExtNext_diff_T_7) - 6'shc; // @[CircularQueuePtr.scala 46:20]
  wire [5:0] _rdataPtrExtNext_new_ptr_value_T_3 = rdataPtrExtNext_reverse_flag_1 ? _rdataPtrExtNext_new_ptr_value_T_2 :
    {{1'd0}, rdataPtrExtNext_new_value_1}; // @[CircularQueuePtr.scala 45:27]
  wire  _rdataPtrExtNext_T_1 = dataBuffer_io_enq_0_ready & dataBuffer_io_enq_0_valid; // @[Decoupled.scala 50:35]
  wire  _rdataPtrExtNext_T_2 = io_mmioStout_ready & io_mmioStout_valid; // @[Decoupled.scala 50:35]
  wire [4:0] rdataPtrExtNext_new_value_2 = rdataPtrExt_0_value + 4'h1; // @[CircularQueuePtr.scala 41:34]
  wire [5:0] _rdataPtrExtNext_diff_T_13 = {1'h0,rdataPtrExtNext_new_value_2}; // @[CircularQueuePtr.scala 42:49]
  wire [5:0] rdataPtrExtNext_diff_2 = $signed(_rdataPtrExtNext_diff_T_13) - 6'shc; // @[CircularQueuePtr.scala 42:52]
  wire  rdataPtrExtNext_reverse_flag_2 = $signed(rdataPtrExtNext_diff_2) >= 6'sh0; // @[CircularQueuePtr.scala 43:31]
  wire [5:0] _rdataPtrExtNext_new_ptr_value_T_4 = $signed(_rdataPtrExtNext_diff_T_13) - 6'shc; // @[CircularQueuePtr.scala 46:20]
  wire [5:0] _rdataPtrExtNext_new_ptr_value_T_5 = rdataPtrExtNext_reverse_flag_2 ? _rdataPtrExtNext_new_ptr_value_T_4 :
    {{1'd0}, rdataPtrExtNext_new_value_2}; // @[CircularQueuePtr.scala 45:27]
  wire [4:0] rdataPtrExtNext_new_value_3 = rdataPtrExt_1_value + 4'h1; // @[CircularQueuePtr.scala 41:34]
  wire [5:0] _rdataPtrExtNext_diff_T_19 = {1'h0,rdataPtrExtNext_new_value_3}; // @[CircularQueuePtr.scala 42:49]
  wire [5:0] rdataPtrExtNext_diff_3 = $signed(_rdataPtrExtNext_diff_T_19) - 6'shc; // @[CircularQueuePtr.scala 42:52]
  wire  rdataPtrExtNext_reverse_flag_3 = $signed(rdataPtrExtNext_diff_3) >= 6'sh0; // @[CircularQueuePtr.scala 43:31]
  wire [5:0] _rdataPtrExtNext_new_ptr_value_T_6 = $signed(_rdataPtrExtNext_diff_T_19) - 6'shc; // @[CircularQueuePtr.scala 46:20]
  wire [5:0] _rdataPtrExtNext_new_ptr_value_T_7 = rdataPtrExtNext_reverse_flag_3 ? _rdataPtrExtNext_new_ptr_value_T_6 :
    {{1'd0}, rdataPtrExtNext_new_value_3}; // @[CircularQueuePtr.scala 45:27]
  wire [3:0] rdataPtrExtNext_new_ptr_2_value = _rdataPtrExtNext_new_ptr_value_T_5[3:0]; // @[CircularQueuePtr.scala 37:23 45:21]
  wire [3:0] _rdataPtrExtNext_T_4_0_value = _rdataPtrExtNext_T_1 | _rdataPtrExtNext_T_2 ?
    rdataPtrExtNext_new_ptr_2_value : rdataPtrExt_0_value; // @[StoreQueue.scala 164:8]
  wire [3:0] rdataPtrExtNext_new_ptr_3_value = _rdataPtrExtNext_new_ptr_value_T_7[3:0]; // @[CircularQueuePtr.scala 37:23 45:21]
  wire [3:0] _rdataPtrExtNext_T_4_1_value = _rdataPtrExtNext_T_1 | _rdataPtrExtNext_T_2 ?
    rdataPtrExtNext_new_ptr_3_value : rdataPtrExt_1_value; // @[StoreQueue.scala 164:8]
  wire [3:0] rdataPtrExtNext_new_ptr_value = _rdataPtrExtNext_new_ptr_value_T_1[3:0]; // @[CircularQueuePtr.scala 37:23 45:21]
  wire [3:0] rdataPtrExtNext_new_ptr_1_value = _rdataPtrExtNext_new_ptr_value_T_3[3:0]; // @[CircularQueuePtr.scala 37:23 45:21]
  wire  _deqPtrExtNext_T = io_sbuffer_1_ready & io_sbuffer_1_valid; // @[Decoupled.scala 50:35]
  reg  deqPtrExtNext_REG; // @[StoreQueue.scala 178:34]
  wire [4:0] deqPtrExtNext_new_value = deqPtrExt_0_value + 4'h2; // @[CircularQueuePtr.scala 41:34]
  wire [5:0] _deqPtrExtNext_diff_T_1 = {1'h0,deqPtrExtNext_new_value}; // @[CircularQueuePtr.scala 42:49]
  wire [5:0] deqPtrExtNext_diff = $signed(_deqPtrExtNext_diff_T_1) - 6'shc; // @[CircularQueuePtr.scala 42:52]
  wire  deqPtrExtNext_reverse_flag = $signed(deqPtrExtNext_diff) >= 6'sh0; // @[CircularQueuePtr.scala 43:31]
  wire [5:0] _deqPtrExtNext_new_ptr_value_T = $signed(_deqPtrExtNext_diff_T_1) - 6'shc; // @[CircularQueuePtr.scala 46:20]
  wire [5:0] _deqPtrExtNext_new_ptr_value_T_1 = deqPtrExtNext_reverse_flag ? _deqPtrExtNext_new_ptr_value_T : {{1'd0},
    deqPtrExtNext_new_value}; // @[CircularQueuePtr.scala 45:27]
  wire  _deqPtrExtNext_T_1 = io_sbuffer_0_ready & io_sbuffer_0_valid; // @[Decoupled.scala 50:35]
  reg  deqPtrExtNext_REG_1; // @[StoreQueue.scala 180:16]
  wire [4:0] deqPtrExtNext_new_value_2 = deqPtrExt_0_value + 4'h1; // @[CircularQueuePtr.scala 41:34]
  wire [5:0] _deqPtrExtNext_diff_T_13 = {1'h0,deqPtrExtNext_new_value_2}; // @[CircularQueuePtr.scala 42:49]
  wire [5:0] deqPtrExtNext_diff_2 = $signed(_deqPtrExtNext_diff_T_13) - 6'shc; // @[CircularQueuePtr.scala 42:52]
  wire  deqPtrExtNext_reverse_flag_2 = $signed(deqPtrExtNext_diff_2) >= 6'sh0; // @[CircularQueuePtr.scala 43:31]
  wire  deqPtrExtNext_new_ptr_2_flag = deqPtrExtNext_reverse_flag_2 ? ~deqPtrExt_0_flag : deqPtrExt_0_flag; // @[CircularQueuePtr.scala 44:26]
  wire [5:0] _deqPtrExtNext_new_ptr_value_T_4 = $signed(_deqPtrExtNext_diff_T_13) - 6'shc; // @[CircularQueuePtr.scala 46:20]
  wire [5:0] _deqPtrExtNext_new_ptr_value_T_5 = deqPtrExtNext_reverse_flag_2 ? _deqPtrExtNext_new_ptr_value_T_4 : {{1
    'd0}, deqPtrExtNext_new_value_2}; // @[CircularQueuePtr.scala 45:27]
  wire [3:0] deqPtrExtNext_new_ptr_2_value = _deqPtrExtNext_new_ptr_value_T_5[3:0]; // @[CircularQueuePtr.scala 37:23 45:21]
  wire [3:0] deqPtrExtNext_new_ptr_value = _deqPtrExtNext_new_ptr_value_T_1[3:0]; // @[CircularQueuePtr.scala 37:23 45:21]
  reg  io_sqDeq_REG; // @[StoreQueue.scala 185:34]
  reg  io_sqDeq_REG_1; // @[StoreQueue.scala 186:16]
  wire  _io_sqDeq_T_3 = io_sqDeq_REG_1 | _rdataPtrExtNext_T_2; // @[StoreQueue.scala 186:39]
  reg [1:0] io_sqDeq_REG_2; // @[StoreQueue.scala 185:22]
  wire [3:0] _GEN_15564 = {{2'd0}, commitCount}; // @[CircularQueuePtr.scala 41:34]
  wire [4:0] vaddrModule_io_raddr_2_new_value = cmtPtrExt_0_value + _GEN_15564; // @[CircularQueuePtr.scala 41:34]
  wire [5:0] _vaddrModule_io_raddr_2_diff_T_1 = {1'h0,vaddrModule_io_raddr_2_new_value}; // @[CircularQueuePtr.scala 42:49]
  wire [5:0] vaddrModule_io_raddr_2_diff = $signed(_vaddrModule_io_raddr_2_diff_T_1) - 6'shc; // @[CircularQueuePtr.scala 42:52]
  wire  vaddrModule_io_raddr_2_reverse_flag = $signed(vaddrModule_io_raddr_2_diff) >= 6'sh0; // @[CircularQueuePtr.scala 43:31]
  wire [5:0] _vaddrModule_io_raddr_2_new_ptr_value_T = $signed(_vaddrModule_io_raddr_2_diff_T_1) - 6'shc; // @[CircularQueuePtr.scala 46:20]
  wire [5:0] _vaddrModule_io_raddr_2_new_ptr_value_T_1 = vaddrModule_io_raddr_2_reverse_flag ?
    _vaddrModule_io_raddr_2_new_ptr_value_T : {{1'd0}, vaddrModule_io_raddr_2_new_value}; // @[CircularQueuePtr.scala 45:27]
  wire [5:0] _enqCancel_flushItself_T_1 = {io_enq_req_0_bits_robIdx_flag,io_enq_req_0_bits_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire [5:0] _enqCancel_flushItself_T_2 = {io_brqRedirect_bits_robIdx_flag,io_brqRedirect_bits_robIdx_value}; // @[CircularQueuePtr.scala 61:70]
  wire  _enqCancel_flushItself_T_3 = _enqCancel_flushItself_T_1 == _enqCancel_flushItself_T_2; // @[CircularQueuePtr.scala 61:52]
  wire  enqCancel_flushItself = io_brqRedirect_bits_level & _enqCancel_flushItself_T_3; // @[Rob.scala 122:51]
  wire  enqCancel_differentFlag = io_enq_req_0_bits_robIdx_flag ^ io_brqRedirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  enqCancel_compare = io_enq_req_0_bits_robIdx_value > io_brqRedirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _enqCancel_T = enqCancel_differentFlag ^ enqCancel_compare; // @[CircularQueuePtr.scala 88:19]
  wire  enqCancel_0 = io_brqRedirect_valid & (enqCancel_flushItself | _enqCancel_T); // @[Rob.scala 123:20]
  wire [5:0] _enqCancel_flushItself_T_5 = {io_enq_req_1_bits_robIdx_flag,io_enq_req_1_bits_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _enqCancel_flushItself_T_7 = _enqCancel_flushItself_T_5 == _enqCancel_flushItself_T_2; // @[CircularQueuePtr.scala 61:52]
  wire  enqCancel_flushItself_1 = io_brqRedirect_bits_level & _enqCancel_flushItself_T_7; // @[Rob.scala 122:51]
  wire  enqCancel_differentFlag_1 = io_enq_req_1_bits_robIdx_flag ^ io_brqRedirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  enqCancel_compare_1 = io_enq_req_1_bits_robIdx_value > io_brqRedirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _enqCancel_T_2 = enqCancel_differentFlag_1 ^ enqCancel_compare_1; // @[CircularQueuePtr.scala 88:19]
  wire  enqCancel_1 = io_brqRedirect_valid & (enqCancel_flushItself_1 | _enqCancel_T_2); // @[Rob.scala 123:20]
  wire [5:0] _enqCancel_flushItself_T_9 = {io_enq_req_2_bits_robIdx_flag,io_enq_req_2_bits_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _enqCancel_flushItself_T_11 = _enqCancel_flushItself_T_9 == _enqCancel_flushItself_T_2; // @[CircularQueuePtr.scala 61:52]
  wire  enqCancel_flushItself_2 = io_brqRedirect_bits_level & _enqCancel_flushItself_T_11; // @[Rob.scala 122:51]
  wire  enqCancel_differentFlag_2 = io_enq_req_2_bits_robIdx_flag ^ io_brqRedirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  enqCancel_compare_2 = io_enq_req_2_bits_robIdx_value > io_brqRedirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _enqCancel_T_4 = enqCancel_differentFlag_2 ^ enqCancel_compare_2; // @[CircularQueuePtr.scala 88:19]
  wire  enqCancel_2 = io_brqRedirect_valid & (enqCancel_flushItself_2 | _enqCancel_T_4); // @[Rob.scala 123:20]
  wire [5:0] _enqCancel_flushItself_T_13 = {io_enq_req_3_bits_robIdx_flag,io_enq_req_3_bits_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _enqCancel_flushItself_T_15 = _enqCancel_flushItself_T_13 == _enqCancel_flushItself_T_2; // @[CircularQueuePtr.scala 61:52]
  wire  enqCancel_flushItself_3 = io_brqRedirect_bits_level & _enqCancel_flushItself_T_15; // @[Rob.scala 122:51]
  wire  enqCancel_differentFlag_3 = io_enq_req_3_bits_robIdx_flag ^ io_brqRedirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  enqCancel_compare_3 = io_enq_req_3_bits_robIdx_value > io_brqRedirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _enqCancel_T_6 = enqCancel_differentFlag_3 ^ enqCancel_compare_3; // @[CircularQueuePtr.scala 88:19]
  wire  enqCancel_3 = io_brqRedirect_valid & (enqCancel_flushItself_3 | _enqCancel_T_6); // @[Rob.scala 123:20]
  wire  _GEN_276 = 4'h0 == io_enq_req_0_bits_sqIdx_value ? io_enq_req_0_bits_cf_trigger_backendEn_0 :
    uop_0_cf_trigger_backendEn_0; // @[StoreQueue.scala 212:{18,18} 93:16]
  wire  _GEN_277 = 4'h1 == io_enq_req_0_bits_sqIdx_value ? io_enq_req_0_bits_cf_trigger_backendEn_0 :
    uop_1_cf_trigger_backendEn_0; // @[StoreQueue.scala 212:{18,18} 93:16]
  wire  _GEN_278 = 4'h2 == io_enq_req_0_bits_sqIdx_value ? io_enq_req_0_bits_cf_trigger_backendEn_0 :
    uop_2_cf_trigger_backendEn_0; // @[StoreQueue.scala 212:{18,18} 93:16]
  wire  _GEN_279 = 4'h3 == io_enq_req_0_bits_sqIdx_value ? io_enq_req_0_bits_cf_trigger_backendEn_0 :
    uop_3_cf_trigger_backendEn_0; // @[StoreQueue.scala 212:{18,18} 93:16]
  wire  _GEN_280 = 4'h4 == io_enq_req_0_bits_sqIdx_value ? io_enq_req_0_bits_cf_trigger_backendEn_0 :
    uop_4_cf_trigger_backendEn_0; // @[StoreQueue.scala 212:{18,18} 93:16]
  wire  _GEN_281 = 4'h5 == io_enq_req_0_bits_sqIdx_value ? io_enq_req_0_bits_cf_trigger_backendEn_0 :
    uop_5_cf_trigger_backendEn_0; // @[StoreQueue.scala 212:{18,18} 93:16]
  wire  _GEN_282 = 4'h6 == io_enq_req_0_bits_sqIdx_value ? io_enq_req_0_bits_cf_trigger_backendEn_0 :
    uop_6_cf_trigger_backendEn_0; // @[StoreQueue.scala 212:{18,18} 93:16]
  wire  _GEN_283 = 4'h7 == io_enq_req_0_bits_sqIdx_value ? io_enq_req_0_bits_cf_trigger_backendEn_0 :
    uop_7_cf_trigger_backendEn_0; // @[StoreQueue.scala 212:{18,18} 93:16]
  wire  _GEN_284 = 4'h8 == io_enq_req_0_bits_sqIdx_value ? io_enq_req_0_bits_cf_trigger_backendEn_0 :
    uop_8_cf_trigger_backendEn_0; // @[StoreQueue.scala 212:{18,18} 93:16]
  wire  _GEN_285 = 4'h9 == io_enq_req_0_bits_sqIdx_value ? io_enq_req_0_bits_cf_trigger_backendEn_0 :
    uop_9_cf_trigger_backendEn_0; // @[StoreQueue.scala 212:{18,18} 93:16]
  wire  _GEN_286 = 4'ha == io_enq_req_0_bits_sqIdx_value ? io_enq_req_0_bits_cf_trigger_backendEn_0 :
    uop_10_cf_trigger_backendEn_0; // @[StoreQueue.scala 212:{18,18} 93:16]
  wire  _GEN_287 = 4'hb == io_enq_req_0_bits_sqIdx_value ? io_enq_req_0_bits_cf_trigger_backendEn_0 :
    uop_11_cf_trigger_backendEn_0; // @[StoreQueue.scala 212:{18,18} 93:16]
  wire [6:0] _GEN_672 = 4'h0 == io_enq_req_0_bits_sqIdx_value ? io_enq_req_0_bits_ctrl_fuOpType : uop_0_ctrl_fuOpType; // @[StoreQueue.scala 212:{18,18} 93:16]
  wire [6:0] _GEN_673 = 4'h1 == io_enq_req_0_bits_sqIdx_value ? io_enq_req_0_bits_ctrl_fuOpType : uop_1_ctrl_fuOpType; // @[StoreQueue.scala 212:{18,18} 93:16]
  wire [6:0] _GEN_674 = 4'h2 == io_enq_req_0_bits_sqIdx_value ? io_enq_req_0_bits_ctrl_fuOpType : uop_2_ctrl_fuOpType; // @[StoreQueue.scala 212:{18,18} 93:16]
  wire [6:0] _GEN_675 = 4'h3 == io_enq_req_0_bits_sqIdx_value ? io_enq_req_0_bits_ctrl_fuOpType : uop_3_ctrl_fuOpType; // @[StoreQueue.scala 212:{18,18} 93:16]
  wire [6:0] _GEN_676 = 4'h4 == io_enq_req_0_bits_sqIdx_value ? io_enq_req_0_bits_ctrl_fuOpType : uop_4_ctrl_fuOpType; // @[StoreQueue.scala 212:{18,18} 93:16]
  wire [6:0] _GEN_677 = 4'h5 == io_enq_req_0_bits_sqIdx_value ? io_enq_req_0_bits_ctrl_fuOpType : uop_5_ctrl_fuOpType; // @[StoreQueue.scala 212:{18,18} 93:16]
  wire [6:0] _GEN_678 = 4'h6 == io_enq_req_0_bits_sqIdx_value ? io_enq_req_0_bits_ctrl_fuOpType : uop_6_ctrl_fuOpType; // @[StoreQueue.scala 212:{18,18} 93:16]
  wire [6:0] _GEN_679 = 4'h7 == io_enq_req_0_bits_sqIdx_value ? io_enq_req_0_bits_ctrl_fuOpType : uop_7_ctrl_fuOpType; // @[StoreQueue.scala 212:{18,18} 93:16]
  wire [6:0] _GEN_680 = 4'h8 == io_enq_req_0_bits_sqIdx_value ? io_enq_req_0_bits_ctrl_fuOpType : uop_8_ctrl_fuOpType; // @[StoreQueue.scala 212:{18,18} 93:16]
  wire [6:0] _GEN_681 = 4'h9 == io_enq_req_0_bits_sqIdx_value ? io_enq_req_0_bits_ctrl_fuOpType : uop_9_ctrl_fuOpType; // @[StoreQueue.scala 212:{18,18} 93:16]
  wire [6:0] _GEN_682 = 4'ha == io_enq_req_0_bits_sqIdx_value ? io_enq_req_0_bits_ctrl_fuOpType : uop_10_ctrl_fuOpType; // @[StoreQueue.scala 212:{18,18} 93:16]
  wire [6:0] _GEN_683 = 4'hb == io_enq_req_0_bits_sqIdx_value ? io_enq_req_0_bits_ctrl_fuOpType : uop_11_ctrl_fuOpType; // @[StoreQueue.scala 212:{18,18} 93:16]
  wire  _GEN_1092 = 4'h0 == io_enq_req_0_bits_sqIdx_value ? io_enq_req_0_bits_robIdx_flag : uop_0_robIdx_flag; // @[StoreQueue.scala 212:{18,18} 93:16]
  wire  _GEN_1093 = 4'h1 == io_enq_req_0_bits_sqIdx_value ? io_enq_req_0_bits_robIdx_flag : uop_1_robIdx_flag; // @[StoreQueue.scala 212:{18,18} 93:16]
  wire  _GEN_1094 = 4'h2 == io_enq_req_0_bits_sqIdx_value ? io_enq_req_0_bits_robIdx_flag : uop_2_robIdx_flag; // @[StoreQueue.scala 212:{18,18} 93:16]
  wire  _GEN_1095 = 4'h3 == io_enq_req_0_bits_sqIdx_value ? io_enq_req_0_bits_robIdx_flag : uop_3_robIdx_flag; // @[StoreQueue.scala 212:{18,18} 93:16]
  wire  _GEN_1096 = 4'h4 == io_enq_req_0_bits_sqIdx_value ? io_enq_req_0_bits_robIdx_flag : uop_4_robIdx_flag; // @[StoreQueue.scala 212:{18,18} 93:16]
  wire  _GEN_1097 = 4'h5 == io_enq_req_0_bits_sqIdx_value ? io_enq_req_0_bits_robIdx_flag : uop_5_robIdx_flag; // @[StoreQueue.scala 212:{18,18} 93:16]
  wire  _GEN_1098 = 4'h6 == io_enq_req_0_bits_sqIdx_value ? io_enq_req_0_bits_robIdx_flag : uop_6_robIdx_flag; // @[StoreQueue.scala 212:{18,18} 93:16]
  wire  _GEN_1099 = 4'h7 == io_enq_req_0_bits_sqIdx_value ? io_enq_req_0_bits_robIdx_flag : uop_7_robIdx_flag; // @[StoreQueue.scala 212:{18,18} 93:16]
  wire  _GEN_1100 = 4'h8 == io_enq_req_0_bits_sqIdx_value ? io_enq_req_0_bits_robIdx_flag : uop_8_robIdx_flag; // @[StoreQueue.scala 212:{18,18} 93:16]
  wire  _GEN_1101 = 4'h9 == io_enq_req_0_bits_sqIdx_value ? io_enq_req_0_bits_robIdx_flag : uop_9_robIdx_flag; // @[StoreQueue.scala 212:{18,18} 93:16]
  wire  _GEN_1102 = 4'ha == io_enq_req_0_bits_sqIdx_value ? io_enq_req_0_bits_robIdx_flag : uop_10_robIdx_flag; // @[StoreQueue.scala 212:{18,18} 93:16]
  wire  _GEN_1103 = 4'hb == io_enq_req_0_bits_sqIdx_value ? io_enq_req_0_bits_robIdx_flag : uop_11_robIdx_flag; // @[StoreQueue.scala 212:{18,18} 93:16]
  wire [4:0] _GEN_1104 = 4'h0 == io_enq_req_0_bits_sqIdx_value ? io_enq_req_0_bits_robIdx_value : uop_0_robIdx_value; // @[StoreQueue.scala 212:{18,18} 93:16]
  wire [4:0] _GEN_1105 = 4'h1 == io_enq_req_0_bits_sqIdx_value ? io_enq_req_0_bits_robIdx_value : uop_1_robIdx_value; // @[StoreQueue.scala 212:{18,18} 93:16]
  wire [4:0] _GEN_1106 = 4'h2 == io_enq_req_0_bits_sqIdx_value ? io_enq_req_0_bits_robIdx_value : uop_2_robIdx_value; // @[StoreQueue.scala 212:{18,18} 93:16]
  wire [4:0] _GEN_1107 = 4'h3 == io_enq_req_0_bits_sqIdx_value ? io_enq_req_0_bits_robIdx_value : uop_3_robIdx_value; // @[StoreQueue.scala 212:{18,18} 93:16]
  wire [4:0] _GEN_1108 = 4'h4 == io_enq_req_0_bits_sqIdx_value ? io_enq_req_0_bits_robIdx_value : uop_4_robIdx_value; // @[StoreQueue.scala 212:{18,18} 93:16]
  wire [4:0] _GEN_1109 = 4'h5 == io_enq_req_0_bits_sqIdx_value ? io_enq_req_0_bits_robIdx_value : uop_5_robIdx_value; // @[StoreQueue.scala 212:{18,18} 93:16]
  wire [4:0] _GEN_1110 = 4'h6 == io_enq_req_0_bits_sqIdx_value ? io_enq_req_0_bits_robIdx_value : uop_6_robIdx_value; // @[StoreQueue.scala 212:{18,18} 93:16]
  wire [4:0] _GEN_1111 = 4'h7 == io_enq_req_0_bits_sqIdx_value ? io_enq_req_0_bits_robIdx_value : uop_7_robIdx_value; // @[StoreQueue.scala 212:{18,18} 93:16]
  wire [4:0] _GEN_1112 = 4'h8 == io_enq_req_0_bits_sqIdx_value ? io_enq_req_0_bits_robIdx_value : uop_8_robIdx_value; // @[StoreQueue.scala 212:{18,18} 93:16]
  wire [4:0] _GEN_1113 = 4'h9 == io_enq_req_0_bits_sqIdx_value ? io_enq_req_0_bits_robIdx_value : uop_9_robIdx_value; // @[StoreQueue.scala 212:{18,18} 93:16]
  wire [4:0] _GEN_1114 = 4'ha == io_enq_req_0_bits_sqIdx_value ? io_enq_req_0_bits_robIdx_value : uop_10_robIdx_value; // @[StoreQueue.scala 212:{18,18} 93:16]
  wire [4:0] _GEN_1115 = 4'hb == io_enq_req_0_bits_sqIdx_value ? io_enq_req_0_bits_robIdx_value : uop_11_robIdx_value; // @[StoreQueue.scala 212:{18,18} 93:16]
  wire  _GEN_1320 = 4'h0 == io_enq_req_0_bits_sqIdx_value | allocated_0; // @[StoreQueue.scala 215:{24,24} 124:26]
  wire  _GEN_1321 = 4'h1 == io_enq_req_0_bits_sqIdx_value | allocated_1; // @[StoreQueue.scala 215:{24,24} 124:26]
  wire  _GEN_1322 = 4'h2 == io_enq_req_0_bits_sqIdx_value | allocated_2; // @[StoreQueue.scala 215:{24,24} 124:26]
  wire  _GEN_1323 = 4'h3 == io_enq_req_0_bits_sqIdx_value | allocated_3; // @[StoreQueue.scala 215:{24,24} 124:26]
  wire  _GEN_1324 = 4'h4 == io_enq_req_0_bits_sqIdx_value | allocated_4; // @[StoreQueue.scala 215:{24,24} 124:26]
  wire  _GEN_1325 = 4'h5 == io_enq_req_0_bits_sqIdx_value | allocated_5; // @[StoreQueue.scala 215:{24,24} 124:26]
  wire  _GEN_1326 = 4'h6 == io_enq_req_0_bits_sqIdx_value | allocated_6; // @[StoreQueue.scala 215:{24,24} 124:26]
  wire  _GEN_1327 = 4'h7 == io_enq_req_0_bits_sqIdx_value | allocated_7; // @[StoreQueue.scala 215:{24,24} 124:26]
  wire  _GEN_1328 = 4'h8 == io_enq_req_0_bits_sqIdx_value | allocated_8; // @[StoreQueue.scala 215:{24,24} 124:26]
  wire  _GEN_1329 = 4'h9 == io_enq_req_0_bits_sqIdx_value | allocated_9; // @[StoreQueue.scala 215:{24,24} 124:26]
  wire  _GEN_1330 = 4'ha == io_enq_req_0_bits_sqIdx_value | allocated_10; // @[StoreQueue.scala 215:{24,24} 124:26]
  wire  _GEN_1331 = 4'hb == io_enq_req_0_bits_sqIdx_value | allocated_11; // @[StoreQueue.scala 215:{24,24} 124:26]
  wire  _GEN_1332 = 4'h0 == io_enq_req_0_bits_sqIdx_value ? 1'h0 : datavalid_0; // @[StoreQueue.scala 216:{24,24} 126:26]
  wire  _GEN_1333 = 4'h1 == io_enq_req_0_bits_sqIdx_value ? 1'h0 : datavalid_1; // @[StoreQueue.scala 216:{24,24} 126:26]
  wire  _GEN_1334 = 4'h2 == io_enq_req_0_bits_sqIdx_value ? 1'h0 : datavalid_2; // @[StoreQueue.scala 216:{24,24} 126:26]
  wire  _GEN_1335 = 4'h3 == io_enq_req_0_bits_sqIdx_value ? 1'h0 : datavalid_3; // @[StoreQueue.scala 216:{24,24} 126:26]
  wire  _GEN_1336 = 4'h4 == io_enq_req_0_bits_sqIdx_value ? 1'h0 : datavalid_4; // @[StoreQueue.scala 216:{24,24} 126:26]
  wire  _GEN_1337 = 4'h5 == io_enq_req_0_bits_sqIdx_value ? 1'h0 : datavalid_5; // @[StoreQueue.scala 216:{24,24} 126:26]
  wire  _GEN_1338 = 4'h6 == io_enq_req_0_bits_sqIdx_value ? 1'h0 : datavalid_6; // @[StoreQueue.scala 216:{24,24} 126:26]
  wire  _GEN_1339 = 4'h7 == io_enq_req_0_bits_sqIdx_value ? 1'h0 : datavalid_7; // @[StoreQueue.scala 216:{24,24} 126:26]
  wire  _GEN_1340 = 4'h8 == io_enq_req_0_bits_sqIdx_value ? 1'h0 : datavalid_8; // @[StoreQueue.scala 216:{24,24} 126:26]
  wire  _GEN_1341 = 4'h9 == io_enq_req_0_bits_sqIdx_value ? 1'h0 : datavalid_9; // @[StoreQueue.scala 216:{24,24} 126:26]
  wire  _GEN_1342 = 4'ha == io_enq_req_0_bits_sqIdx_value ? 1'h0 : datavalid_10; // @[StoreQueue.scala 216:{24,24} 126:26]
  wire  _GEN_1343 = 4'hb == io_enq_req_0_bits_sqIdx_value ? 1'h0 : datavalid_11; // @[StoreQueue.scala 216:{24,24} 126:26]
  wire  _GEN_1344 = 4'h0 == io_enq_req_0_bits_sqIdx_value ? 1'h0 : addrvalid_0; // @[StoreQueue.scala 217:{24,24} 125:26]
  wire  _GEN_1345 = 4'h1 == io_enq_req_0_bits_sqIdx_value ? 1'h0 : addrvalid_1; // @[StoreQueue.scala 217:{24,24} 125:26]
  wire  _GEN_1346 = 4'h2 == io_enq_req_0_bits_sqIdx_value ? 1'h0 : addrvalid_2; // @[StoreQueue.scala 217:{24,24} 125:26]
  wire  _GEN_1347 = 4'h3 == io_enq_req_0_bits_sqIdx_value ? 1'h0 : addrvalid_3; // @[StoreQueue.scala 217:{24,24} 125:26]
  wire  _GEN_1348 = 4'h4 == io_enq_req_0_bits_sqIdx_value ? 1'h0 : addrvalid_4; // @[StoreQueue.scala 217:{24,24} 125:26]
  wire  _GEN_1349 = 4'h5 == io_enq_req_0_bits_sqIdx_value ? 1'h0 : addrvalid_5; // @[StoreQueue.scala 217:{24,24} 125:26]
  wire  _GEN_1350 = 4'h6 == io_enq_req_0_bits_sqIdx_value ? 1'h0 : addrvalid_6; // @[StoreQueue.scala 217:{24,24} 125:26]
  wire  _GEN_1351 = 4'h7 == io_enq_req_0_bits_sqIdx_value ? 1'h0 : addrvalid_7; // @[StoreQueue.scala 217:{24,24} 125:26]
  wire  _GEN_1352 = 4'h8 == io_enq_req_0_bits_sqIdx_value ? 1'h0 : addrvalid_8; // @[StoreQueue.scala 217:{24,24} 125:26]
  wire  _GEN_1353 = 4'h9 == io_enq_req_0_bits_sqIdx_value ? 1'h0 : addrvalid_9; // @[StoreQueue.scala 217:{24,24} 125:26]
  wire  _GEN_1354 = 4'ha == io_enq_req_0_bits_sqIdx_value ? 1'h0 : addrvalid_10; // @[StoreQueue.scala 217:{24,24} 125:26]
  wire  _GEN_1355 = 4'hb == io_enq_req_0_bits_sqIdx_value ? 1'h0 : addrvalid_11; // @[StoreQueue.scala 217:{24,24} 125:26]
  wire  _GEN_1356 = 4'h0 == io_enq_req_0_bits_sqIdx_value ? 1'h0 : committed_0; // @[StoreQueue.scala 128:22 218:{24,24}]
  wire  _GEN_1357 = 4'h1 == io_enq_req_0_bits_sqIdx_value ? 1'h0 : committed_1; // @[StoreQueue.scala 128:22 218:{24,24}]
  wire  _GEN_1358 = 4'h2 == io_enq_req_0_bits_sqIdx_value ? 1'h0 : committed_2; // @[StoreQueue.scala 128:22 218:{24,24}]
  wire  _GEN_1359 = 4'h3 == io_enq_req_0_bits_sqIdx_value ? 1'h0 : committed_3; // @[StoreQueue.scala 128:22 218:{24,24}]
  wire  _GEN_1360 = 4'h4 == io_enq_req_0_bits_sqIdx_value ? 1'h0 : committed_4; // @[StoreQueue.scala 128:22 218:{24,24}]
  wire  _GEN_1361 = 4'h5 == io_enq_req_0_bits_sqIdx_value ? 1'h0 : committed_5; // @[StoreQueue.scala 128:22 218:{24,24}]
  wire  _GEN_1362 = 4'h6 == io_enq_req_0_bits_sqIdx_value ? 1'h0 : committed_6; // @[StoreQueue.scala 128:22 218:{24,24}]
  wire  _GEN_1363 = 4'h7 == io_enq_req_0_bits_sqIdx_value ? 1'h0 : committed_7; // @[StoreQueue.scala 128:22 218:{24,24}]
  wire  _GEN_1364 = 4'h8 == io_enq_req_0_bits_sqIdx_value ? 1'h0 : committed_8; // @[StoreQueue.scala 128:22 218:{24,24}]
  wire  _GEN_1365 = 4'h9 == io_enq_req_0_bits_sqIdx_value ? 1'h0 : committed_9; // @[StoreQueue.scala 128:22 218:{24,24}]
  wire  _GEN_1366 = 4'ha == io_enq_req_0_bits_sqIdx_value ? 1'h0 : committed_10; // @[StoreQueue.scala 128:22 218:{24,24}]
  wire  _GEN_1367 = 4'hb == io_enq_req_0_bits_sqIdx_value ? 1'h0 : committed_11; // @[StoreQueue.scala 128:22 218:{24,24}]
  wire  _GEN_1368 = 4'h0 == io_enq_req_0_bits_sqIdx_value ? 1'h0 : pending_0; // @[StoreQueue.scala 129:20 219:{22,22}]
  wire  _GEN_1369 = 4'h1 == io_enq_req_0_bits_sqIdx_value ? 1'h0 : pending_1; // @[StoreQueue.scala 129:20 219:{22,22}]
  wire  _GEN_1370 = 4'h2 == io_enq_req_0_bits_sqIdx_value ? 1'h0 : pending_2; // @[StoreQueue.scala 129:20 219:{22,22}]
  wire  _GEN_1371 = 4'h3 == io_enq_req_0_bits_sqIdx_value ? 1'h0 : pending_3; // @[StoreQueue.scala 129:20 219:{22,22}]
  wire  _GEN_1372 = 4'h4 == io_enq_req_0_bits_sqIdx_value ? 1'h0 : pending_4; // @[StoreQueue.scala 129:20 219:{22,22}]
  wire  _GEN_1373 = 4'h5 == io_enq_req_0_bits_sqIdx_value ? 1'h0 : pending_5; // @[StoreQueue.scala 129:20 219:{22,22}]
  wire  _GEN_1374 = 4'h6 == io_enq_req_0_bits_sqIdx_value ? 1'h0 : pending_6; // @[StoreQueue.scala 129:20 219:{22,22}]
  wire  _GEN_1375 = 4'h7 == io_enq_req_0_bits_sqIdx_value ? 1'h0 : pending_7; // @[StoreQueue.scala 129:20 219:{22,22}]
  wire  _GEN_1376 = 4'h8 == io_enq_req_0_bits_sqIdx_value ? 1'h0 : pending_8; // @[StoreQueue.scala 129:20 219:{22,22}]
  wire  _GEN_1377 = 4'h9 == io_enq_req_0_bits_sqIdx_value ? 1'h0 : pending_9; // @[StoreQueue.scala 129:20 219:{22,22}]
  wire  _GEN_1378 = 4'ha == io_enq_req_0_bits_sqIdx_value ? 1'h0 : pending_10; // @[StoreQueue.scala 129:20 219:{22,22}]
  wire  _GEN_1379 = 4'hb == io_enq_req_0_bits_sqIdx_value ? 1'h0 : pending_11; // @[StoreQueue.scala 129:20 219:{22,22}]
  wire  _GEN_1380 = 4'h0 == io_enq_req_0_bits_sqIdx_value ? 1'h0 : tosbuffer_0; // @[StoreQueue.scala 220:{24,24} 132:26]
  wire  _GEN_1381 = 4'h1 == io_enq_req_0_bits_sqIdx_value ? 1'h0 : tosbuffer_1; // @[StoreQueue.scala 220:{24,24} 132:26]
  wire  _GEN_1382 = 4'h2 == io_enq_req_0_bits_sqIdx_value ? 1'h0 : tosbuffer_2; // @[StoreQueue.scala 220:{24,24} 132:26]
  wire  _GEN_1383 = 4'h3 == io_enq_req_0_bits_sqIdx_value ? 1'h0 : tosbuffer_3; // @[StoreQueue.scala 220:{24,24} 132:26]
  wire  _GEN_1384 = 4'h4 == io_enq_req_0_bits_sqIdx_value ? 1'h0 : tosbuffer_4; // @[StoreQueue.scala 220:{24,24} 132:26]
  wire  _GEN_1385 = 4'h5 == io_enq_req_0_bits_sqIdx_value ? 1'h0 : tosbuffer_5; // @[StoreQueue.scala 220:{24,24} 132:26]
  wire  _GEN_1386 = 4'h6 == io_enq_req_0_bits_sqIdx_value ? 1'h0 : tosbuffer_6; // @[StoreQueue.scala 220:{24,24} 132:26]
  wire  _GEN_1387 = 4'h7 == io_enq_req_0_bits_sqIdx_value ? 1'h0 : tosbuffer_7; // @[StoreQueue.scala 220:{24,24} 132:26]
  wire  _GEN_1388 = 4'h8 == io_enq_req_0_bits_sqIdx_value ? 1'h0 : tosbuffer_8; // @[StoreQueue.scala 220:{24,24} 132:26]
  wire  _GEN_1389 = 4'h9 == io_enq_req_0_bits_sqIdx_value ? 1'h0 : tosbuffer_9; // @[StoreQueue.scala 220:{24,24} 132:26]
  wire  _GEN_1390 = 4'ha == io_enq_req_0_bits_sqIdx_value ? 1'h0 : tosbuffer_10; // @[StoreQueue.scala 220:{24,24} 132:26]
  wire  _GEN_1391 = 4'hb == io_enq_req_0_bits_sqIdx_value ? 1'h0 : tosbuffer_11; // @[StoreQueue.scala 220:{24,24} 132:26]
  wire  _GEN_1668 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_276 : uop_0_cf_trigger_backendEn_0; // @[StoreQueue.scala 211:43 93:16]
  wire  _GEN_1669 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_277 : uop_1_cf_trigger_backendEn_0; // @[StoreQueue.scala 211:43 93:16]
  wire  _GEN_1670 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_278 : uop_2_cf_trigger_backendEn_0; // @[StoreQueue.scala 211:43 93:16]
  wire  _GEN_1671 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_279 : uop_3_cf_trigger_backendEn_0; // @[StoreQueue.scala 211:43 93:16]
  wire  _GEN_1672 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_280 : uop_4_cf_trigger_backendEn_0; // @[StoreQueue.scala 211:43 93:16]
  wire  _GEN_1673 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_281 : uop_5_cf_trigger_backendEn_0; // @[StoreQueue.scala 211:43 93:16]
  wire  _GEN_1674 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_282 : uop_6_cf_trigger_backendEn_0; // @[StoreQueue.scala 211:43 93:16]
  wire  _GEN_1675 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_283 : uop_7_cf_trigger_backendEn_0; // @[StoreQueue.scala 211:43 93:16]
  wire  _GEN_1676 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_284 : uop_8_cf_trigger_backendEn_0; // @[StoreQueue.scala 211:43 93:16]
  wire  _GEN_1677 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_285 : uop_9_cf_trigger_backendEn_0; // @[StoreQueue.scala 211:43 93:16]
  wire  _GEN_1678 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_286 : uop_10_cf_trigger_backendEn_0; // @[StoreQueue.scala 211:43 93:16]
  wire  _GEN_1679 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_287 : uop_11_cf_trigger_backendEn_0; // @[StoreQueue.scala 211:43 93:16]
  wire [6:0] _GEN_2064 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_672 : uop_0_ctrl_fuOpType; // @[StoreQueue.scala 211:43 93:16]
  wire [6:0] _GEN_2065 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_673 : uop_1_ctrl_fuOpType; // @[StoreQueue.scala 211:43 93:16]
  wire [6:0] _GEN_2066 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_674 : uop_2_ctrl_fuOpType; // @[StoreQueue.scala 211:43 93:16]
  wire [6:0] _GEN_2067 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_675 : uop_3_ctrl_fuOpType; // @[StoreQueue.scala 211:43 93:16]
  wire [6:0] _GEN_2068 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_676 : uop_4_ctrl_fuOpType; // @[StoreQueue.scala 211:43 93:16]
  wire [6:0] _GEN_2069 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_677 : uop_5_ctrl_fuOpType; // @[StoreQueue.scala 211:43 93:16]
  wire [6:0] _GEN_2070 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_678 : uop_6_ctrl_fuOpType; // @[StoreQueue.scala 211:43 93:16]
  wire [6:0] _GEN_2071 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_679 : uop_7_ctrl_fuOpType; // @[StoreQueue.scala 211:43 93:16]
  wire [6:0] _GEN_2072 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_680 : uop_8_ctrl_fuOpType; // @[StoreQueue.scala 211:43 93:16]
  wire [6:0] _GEN_2073 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_681 : uop_9_ctrl_fuOpType; // @[StoreQueue.scala 211:43 93:16]
  wire [6:0] _GEN_2074 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_682 : uop_10_ctrl_fuOpType; // @[StoreQueue.scala 211:43 93:16]
  wire [6:0] _GEN_2075 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_683 : uop_11_ctrl_fuOpType; // @[StoreQueue.scala 211:43 93:16]
  wire  _GEN_2484 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1092 : uop_0_robIdx_flag; // @[StoreQueue.scala 211:43 93:16]
  wire  _GEN_2485 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1093 : uop_1_robIdx_flag; // @[StoreQueue.scala 211:43 93:16]
  wire  _GEN_2486 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1094 : uop_2_robIdx_flag; // @[StoreQueue.scala 211:43 93:16]
  wire  _GEN_2487 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1095 : uop_3_robIdx_flag; // @[StoreQueue.scala 211:43 93:16]
  wire  _GEN_2488 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1096 : uop_4_robIdx_flag; // @[StoreQueue.scala 211:43 93:16]
  wire  _GEN_2489 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1097 : uop_5_robIdx_flag; // @[StoreQueue.scala 211:43 93:16]
  wire  _GEN_2490 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1098 : uop_6_robIdx_flag; // @[StoreQueue.scala 211:43 93:16]
  wire  _GEN_2491 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1099 : uop_7_robIdx_flag; // @[StoreQueue.scala 211:43 93:16]
  wire  _GEN_2492 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1100 : uop_8_robIdx_flag; // @[StoreQueue.scala 211:43 93:16]
  wire  _GEN_2493 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1101 : uop_9_robIdx_flag; // @[StoreQueue.scala 211:43 93:16]
  wire  _GEN_2494 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1102 : uop_10_robIdx_flag; // @[StoreQueue.scala 211:43 93:16]
  wire  _GEN_2495 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1103 : uop_11_robIdx_flag; // @[StoreQueue.scala 211:43 93:16]
  wire [4:0] _GEN_2496 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1104 : uop_0_robIdx_value; // @[StoreQueue.scala 211:43 93:16]
  wire [4:0] _GEN_2497 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1105 : uop_1_robIdx_value; // @[StoreQueue.scala 211:43 93:16]
  wire [4:0] _GEN_2498 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1106 : uop_2_robIdx_value; // @[StoreQueue.scala 211:43 93:16]
  wire [4:0] _GEN_2499 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1107 : uop_3_robIdx_value; // @[StoreQueue.scala 211:43 93:16]
  wire [4:0] _GEN_2500 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1108 : uop_4_robIdx_value; // @[StoreQueue.scala 211:43 93:16]
  wire [4:0] _GEN_2501 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1109 : uop_5_robIdx_value; // @[StoreQueue.scala 211:43 93:16]
  wire [4:0] _GEN_2502 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1110 : uop_6_robIdx_value; // @[StoreQueue.scala 211:43 93:16]
  wire [4:0] _GEN_2503 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1111 : uop_7_robIdx_value; // @[StoreQueue.scala 211:43 93:16]
  wire [4:0] _GEN_2504 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1112 : uop_8_robIdx_value; // @[StoreQueue.scala 211:43 93:16]
  wire [4:0] _GEN_2505 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1113 : uop_9_robIdx_value; // @[StoreQueue.scala 211:43 93:16]
  wire [4:0] _GEN_2506 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1114 : uop_10_robIdx_value; // @[StoreQueue.scala 211:43 93:16]
  wire [4:0] _GEN_2507 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1115 : uop_11_robIdx_value; // @[StoreQueue.scala 211:43 93:16]
  wire  _GEN_2688 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1320 : allocated_0; // @[StoreQueue.scala 124:26 211:43]
  wire  _GEN_2689 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1321 : allocated_1; // @[StoreQueue.scala 124:26 211:43]
  wire  _GEN_2690 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1322 : allocated_2; // @[StoreQueue.scala 124:26 211:43]
  wire  _GEN_2691 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1323 : allocated_3; // @[StoreQueue.scala 124:26 211:43]
  wire  _GEN_2692 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1324 : allocated_4; // @[StoreQueue.scala 124:26 211:43]
  wire  _GEN_2693 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1325 : allocated_5; // @[StoreQueue.scala 124:26 211:43]
  wire  _GEN_2694 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1326 : allocated_6; // @[StoreQueue.scala 124:26 211:43]
  wire  _GEN_2695 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1327 : allocated_7; // @[StoreQueue.scala 124:26 211:43]
  wire  _GEN_2696 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1328 : allocated_8; // @[StoreQueue.scala 124:26 211:43]
  wire  _GEN_2697 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1329 : allocated_9; // @[StoreQueue.scala 124:26 211:43]
  wire  _GEN_2698 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1330 : allocated_10; // @[StoreQueue.scala 124:26 211:43]
  wire  _GEN_2699 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1331 : allocated_11; // @[StoreQueue.scala 124:26 211:43]
  wire  _GEN_2700 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1332 : datavalid_0; // @[StoreQueue.scala 126:26 211:43]
  wire  _GEN_2701 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1333 : datavalid_1; // @[StoreQueue.scala 126:26 211:43]
  wire  _GEN_2702 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1334 : datavalid_2; // @[StoreQueue.scala 126:26 211:43]
  wire  _GEN_2703 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1335 : datavalid_3; // @[StoreQueue.scala 126:26 211:43]
  wire  _GEN_2704 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1336 : datavalid_4; // @[StoreQueue.scala 126:26 211:43]
  wire  _GEN_2705 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1337 : datavalid_5; // @[StoreQueue.scala 126:26 211:43]
  wire  _GEN_2706 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1338 : datavalid_6; // @[StoreQueue.scala 126:26 211:43]
  wire  _GEN_2707 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1339 : datavalid_7; // @[StoreQueue.scala 126:26 211:43]
  wire  _GEN_2708 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1340 : datavalid_8; // @[StoreQueue.scala 126:26 211:43]
  wire  _GEN_2709 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1341 : datavalid_9; // @[StoreQueue.scala 126:26 211:43]
  wire  _GEN_2710 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1342 : datavalid_10; // @[StoreQueue.scala 126:26 211:43]
  wire  _GEN_2711 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1343 : datavalid_11; // @[StoreQueue.scala 126:26 211:43]
  wire  _GEN_2712 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1344 : addrvalid_0; // @[StoreQueue.scala 125:26 211:43]
  wire  _GEN_2713 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1345 : addrvalid_1; // @[StoreQueue.scala 125:26 211:43]
  wire  _GEN_2714 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1346 : addrvalid_2; // @[StoreQueue.scala 125:26 211:43]
  wire  _GEN_2715 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1347 : addrvalid_3; // @[StoreQueue.scala 125:26 211:43]
  wire  _GEN_2716 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1348 : addrvalid_4; // @[StoreQueue.scala 125:26 211:43]
  wire  _GEN_2717 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1349 : addrvalid_5; // @[StoreQueue.scala 125:26 211:43]
  wire  _GEN_2718 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1350 : addrvalid_6; // @[StoreQueue.scala 125:26 211:43]
  wire  _GEN_2719 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1351 : addrvalid_7; // @[StoreQueue.scala 125:26 211:43]
  wire  _GEN_2720 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1352 : addrvalid_8; // @[StoreQueue.scala 125:26 211:43]
  wire  _GEN_2721 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1353 : addrvalid_9; // @[StoreQueue.scala 125:26 211:43]
  wire  _GEN_2722 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1354 : addrvalid_10; // @[StoreQueue.scala 125:26 211:43]
  wire  _GEN_2723 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1355 : addrvalid_11; // @[StoreQueue.scala 125:26 211:43]
  wire  _GEN_2724 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1356 : committed_0; // @[StoreQueue.scala 128:22 211:43]
  wire  _GEN_2725 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1357 : committed_1; // @[StoreQueue.scala 128:22 211:43]
  wire  _GEN_2726 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1358 : committed_2; // @[StoreQueue.scala 128:22 211:43]
  wire  _GEN_2727 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1359 : committed_3; // @[StoreQueue.scala 128:22 211:43]
  wire  _GEN_2728 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1360 : committed_4; // @[StoreQueue.scala 128:22 211:43]
  wire  _GEN_2729 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1361 : committed_5; // @[StoreQueue.scala 128:22 211:43]
  wire  _GEN_2730 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1362 : committed_6; // @[StoreQueue.scala 128:22 211:43]
  wire  _GEN_2731 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1363 : committed_7; // @[StoreQueue.scala 128:22 211:43]
  wire  _GEN_2732 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1364 : committed_8; // @[StoreQueue.scala 128:22 211:43]
  wire  _GEN_2733 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1365 : committed_9; // @[StoreQueue.scala 128:22 211:43]
  wire  _GEN_2734 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1366 : committed_10; // @[StoreQueue.scala 128:22 211:43]
  wire  _GEN_2735 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1367 : committed_11; // @[StoreQueue.scala 128:22 211:43]
  wire  _GEN_2736 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1368 : pending_0; // @[StoreQueue.scala 129:20 211:43]
  wire  _GEN_2737 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1369 : pending_1; // @[StoreQueue.scala 129:20 211:43]
  wire  _GEN_2738 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1370 : pending_2; // @[StoreQueue.scala 129:20 211:43]
  wire  _GEN_2739 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1371 : pending_3; // @[StoreQueue.scala 129:20 211:43]
  wire  _GEN_2740 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1372 : pending_4; // @[StoreQueue.scala 129:20 211:43]
  wire  _GEN_2741 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1373 : pending_5; // @[StoreQueue.scala 129:20 211:43]
  wire  _GEN_2742 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1374 : pending_6; // @[StoreQueue.scala 129:20 211:43]
  wire  _GEN_2743 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1375 : pending_7; // @[StoreQueue.scala 129:20 211:43]
  wire  _GEN_2744 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1376 : pending_8; // @[StoreQueue.scala 129:20 211:43]
  wire  _GEN_2745 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1377 : pending_9; // @[StoreQueue.scala 129:20 211:43]
  wire  _GEN_2746 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1378 : pending_10; // @[StoreQueue.scala 129:20 211:43]
  wire  _GEN_2747 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1379 : pending_11; // @[StoreQueue.scala 129:20 211:43]
  wire  _GEN_2748 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1380 : tosbuffer_0; // @[StoreQueue.scala 132:26 211:43]
  wire  _GEN_2749 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1381 : tosbuffer_1; // @[StoreQueue.scala 132:26 211:43]
  wire  _GEN_2750 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1382 : tosbuffer_2; // @[StoreQueue.scala 132:26 211:43]
  wire  _GEN_2751 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1383 : tosbuffer_3; // @[StoreQueue.scala 132:26 211:43]
  wire  _GEN_2752 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1384 : tosbuffer_4; // @[StoreQueue.scala 132:26 211:43]
  wire  _GEN_2753 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1385 : tosbuffer_5; // @[StoreQueue.scala 132:26 211:43]
  wire  _GEN_2754 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1386 : tosbuffer_6; // @[StoreQueue.scala 132:26 211:43]
  wire  _GEN_2755 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1387 : tosbuffer_7; // @[StoreQueue.scala 132:26 211:43]
  wire  _GEN_2756 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1388 : tosbuffer_8; // @[StoreQueue.scala 132:26 211:43]
  wire  _GEN_2757 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1389 : tosbuffer_9; // @[StoreQueue.scala 132:26 211:43]
  wire  _GEN_2758 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1390 : tosbuffer_10; // @[StoreQueue.scala 132:26 211:43]
  wire  _GEN_2759 = io_enq_req_0_valid & ~enqCancel_0 ? _GEN_1391 : tosbuffer_11; // @[StoreQueue.scala 132:26 211:43]
  wire  _GEN_3036 = 4'h0 == io_enq_req_1_bits_sqIdx_value ? io_enq_req_1_bits_cf_trigger_backendEn_0 : _GEN_1668; // @[StoreQueue.scala 212:{18,18}]
  wire  _GEN_3037 = 4'h1 == io_enq_req_1_bits_sqIdx_value ? io_enq_req_1_bits_cf_trigger_backendEn_0 : _GEN_1669; // @[StoreQueue.scala 212:{18,18}]
  wire  _GEN_3038 = 4'h2 == io_enq_req_1_bits_sqIdx_value ? io_enq_req_1_bits_cf_trigger_backendEn_0 : _GEN_1670; // @[StoreQueue.scala 212:{18,18}]
  wire  _GEN_3039 = 4'h3 == io_enq_req_1_bits_sqIdx_value ? io_enq_req_1_bits_cf_trigger_backendEn_0 : _GEN_1671; // @[StoreQueue.scala 212:{18,18}]
  wire  _GEN_3040 = 4'h4 == io_enq_req_1_bits_sqIdx_value ? io_enq_req_1_bits_cf_trigger_backendEn_0 : _GEN_1672; // @[StoreQueue.scala 212:{18,18}]
  wire  _GEN_3041 = 4'h5 == io_enq_req_1_bits_sqIdx_value ? io_enq_req_1_bits_cf_trigger_backendEn_0 : _GEN_1673; // @[StoreQueue.scala 212:{18,18}]
  wire  _GEN_3042 = 4'h6 == io_enq_req_1_bits_sqIdx_value ? io_enq_req_1_bits_cf_trigger_backendEn_0 : _GEN_1674; // @[StoreQueue.scala 212:{18,18}]
  wire  _GEN_3043 = 4'h7 == io_enq_req_1_bits_sqIdx_value ? io_enq_req_1_bits_cf_trigger_backendEn_0 : _GEN_1675; // @[StoreQueue.scala 212:{18,18}]
  wire  _GEN_3044 = 4'h8 == io_enq_req_1_bits_sqIdx_value ? io_enq_req_1_bits_cf_trigger_backendEn_0 : _GEN_1676; // @[StoreQueue.scala 212:{18,18}]
  wire  _GEN_3045 = 4'h9 == io_enq_req_1_bits_sqIdx_value ? io_enq_req_1_bits_cf_trigger_backendEn_0 : _GEN_1677; // @[StoreQueue.scala 212:{18,18}]
  wire  _GEN_3046 = 4'ha == io_enq_req_1_bits_sqIdx_value ? io_enq_req_1_bits_cf_trigger_backendEn_0 : _GEN_1678; // @[StoreQueue.scala 212:{18,18}]
  wire  _GEN_3047 = 4'hb == io_enq_req_1_bits_sqIdx_value ? io_enq_req_1_bits_cf_trigger_backendEn_0 : _GEN_1679; // @[StoreQueue.scala 212:{18,18}]
  wire [6:0] _GEN_3432 = 4'h0 == io_enq_req_1_bits_sqIdx_value ? io_enq_req_1_bits_ctrl_fuOpType : _GEN_2064; // @[StoreQueue.scala 212:{18,18}]
  wire [6:0] _GEN_3433 = 4'h1 == io_enq_req_1_bits_sqIdx_value ? io_enq_req_1_bits_ctrl_fuOpType : _GEN_2065; // @[StoreQueue.scala 212:{18,18}]
  wire [6:0] _GEN_3434 = 4'h2 == io_enq_req_1_bits_sqIdx_value ? io_enq_req_1_bits_ctrl_fuOpType : _GEN_2066; // @[StoreQueue.scala 212:{18,18}]
  wire [6:0] _GEN_3435 = 4'h3 == io_enq_req_1_bits_sqIdx_value ? io_enq_req_1_bits_ctrl_fuOpType : _GEN_2067; // @[StoreQueue.scala 212:{18,18}]
  wire [6:0] _GEN_3436 = 4'h4 == io_enq_req_1_bits_sqIdx_value ? io_enq_req_1_bits_ctrl_fuOpType : _GEN_2068; // @[StoreQueue.scala 212:{18,18}]
  wire [6:0] _GEN_3437 = 4'h5 == io_enq_req_1_bits_sqIdx_value ? io_enq_req_1_bits_ctrl_fuOpType : _GEN_2069; // @[StoreQueue.scala 212:{18,18}]
  wire [6:0] _GEN_3438 = 4'h6 == io_enq_req_1_bits_sqIdx_value ? io_enq_req_1_bits_ctrl_fuOpType : _GEN_2070; // @[StoreQueue.scala 212:{18,18}]
  wire [6:0] _GEN_3439 = 4'h7 == io_enq_req_1_bits_sqIdx_value ? io_enq_req_1_bits_ctrl_fuOpType : _GEN_2071; // @[StoreQueue.scala 212:{18,18}]
  wire [6:0] _GEN_3440 = 4'h8 == io_enq_req_1_bits_sqIdx_value ? io_enq_req_1_bits_ctrl_fuOpType : _GEN_2072; // @[StoreQueue.scala 212:{18,18}]
  wire [6:0] _GEN_3441 = 4'h9 == io_enq_req_1_bits_sqIdx_value ? io_enq_req_1_bits_ctrl_fuOpType : _GEN_2073; // @[StoreQueue.scala 212:{18,18}]
  wire [6:0] _GEN_3442 = 4'ha == io_enq_req_1_bits_sqIdx_value ? io_enq_req_1_bits_ctrl_fuOpType : _GEN_2074; // @[StoreQueue.scala 212:{18,18}]
  wire [6:0] _GEN_3443 = 4'hb == io_enq_req_1_bits_sqIdx_value ? io_enq_req_1_bits_ctrl_fuOpType : _GEN_2075; // @[StoreQueue.scala 212:{18,18}]
  wire  _GEN_3852 = 4'h0 == io_enq_req_1_bits_sqIdx_value ? io_enq_req_1_bits_robIdx_flag : _GEN_2484; // @[StoreQueue.scala 212:{18,18}]
  wire  _GEN_3853 = 4'h1 == io_enq_req_1_bits_sqIdx_value ? io_enq_req_1_bits_robIdx_flag : _GEN_2485; // @[StoreQueue.scala 212:{18,18}]
  wire  _GEN_3854 = 4'h2 == io_enq_req_1_bits_sqIdx_value ? io_enq_req_1_bits_robIdx_flag : _GEN_2486; // @[StoreQueue.scala 212:{18,18}]
  wire  _GEN_3855 = 4'h3 == io_enq_req_1_bits_sqIdx_value ? io_enq_req_1_bits_robIdx_flag : _GEN_2487; // @[StoreQueue.scala 212:{18,18}]
  wire  _GEN_3856 = 4'h4 == io_enq_req_1_bits_sqIdx_value ? io_enq_req_1_bits_robIdx_flag : _GEN_2488; // @[StoreQueue.scala 212:{18,18}]
  wire  _GEN_3857 = 4'h5 == io_enq_req_1_bits_sqIdx_value ? io_enq_req_1_bits_robIdx_flag : _GEN_2489; // @[StoreQueue.scala 212:{18,18}]
  wire  _GEN_3858 = 4'h6 == io_enq_req_1_bits_sqIdx_value ? io_enq_req_1_bits_robIdx_flag : _GEN_2490; // @[StoreQueue.scala 212:{18,18}]
  wire  _GEN_3859 = 4'h7 == io_enq_req_1_bits_sqIdx_value ? io_enq_req_1_bits_robIdx_flag : _GEN_2491; // @[StoreQueue.scala 212:{18,18}]
  wire  _GEN_3860 = 4'h8 == io_enq_req_1_bits_sqIdx_value ? io_enq_req_1_bits_robIdx_flag : _GEN_2492; // @[StoreQueue.scala 212:{18,18}]
  wire  _GEN_3861 = 4'h9 == io_enq_req_1_bits_sqIdx_value ? io_enq_req_1_bits_robIdx_flag : _GEN_2493; // @[StoreQueue.scala 212:{18,18}]
  wire  _GEN_3862 = 4'ha == io_enq_req_1_bits_sqIdx_value ? io_enq_req_1_bits_robIdx_flag : _GEN_2494; // @[StoreQueue.scala 212:{18,18}]
  wire  _GEN_3863 = 4'hb == io_enq_req_1_bits_sqIdx_value ? io_enq_req_1_bits_robIdx_flag : _GEN_2495; // @[StoreQueue.scala 212:{18,18}]
  wire [4:0] _GEN_3864 = 4'h0 == io_enq_req_1_bits_sqIdx_value ? io_enq_req_1_bits_robIdx_value : _GEN_2496; // @[StoreQueue.scala 212:{18,18}]
  wire [4:0] _GEN_3865 = 4'h1 == io_enq_req_1_bits_sqIdx_value ? io_enq_req_1_bits_robIdx_value : _GEN_2497; // @[StoreQueue.scala 212:{18,18}]
  wire [4:0] _GEN_3866 = 4'h2 == io_enq_req_1_bits_sqIdx_value ? io_enq_req_1_bits_robIdx_value : _GEN_2498; // @[StoreQueue.scala 212:{18,18}]
  wire [4:0] _GEN_3867 = 4'h3 == io_enq_req_1_bits_sqIdx_value ? io_enq_req_1_bits_robIdx_value : _GEN_2499; // @[StoreQueue.scala 212:{18,18}]
  wire [4:0] _GEN_3868 = 4'h4 == io_enq_req_1_bits_sqIdx_value ? io_enq_req_1_bits_robIdx_value : _GEN_2500; // @[StoreQueue.scala 212:{18,18}]
  wire [4:0] _GEN_3869 = 4'h5 == io_enq_req_1_bits_sqIdx_value ? io_enq_req_1_bits_robIdx_value : _GEN_2501; // @[StoreQueue.scala 212:{18,18}]
  wire [4:0] _GEN_3870 = 4'h6 == io_enq_req_1_bits_sqIdx_value ? io_enq_req_1_bits_robIdx_value : _GEN_2502; // @[StoreQueue.scala 212:{18,18}]
  wire [4:0] _GEN_3871 = 4'h7 == io_enq_req_1_bits_sqIdx_value ? io_enq_req_1_bits_robIdx_value : _GEN_2503; // @[StoreQueue.scala 212:{18,18}]
  wire [4:0] _GEN_3872 = 4'h8 == io_enq_req_1_bits_sqIdx_value ? io_enq_req_1_bits_robIdx_value : _GEN_2504; // @[StoreQueue.scala 212:{18,18}]
  wire [4:0] _GEN_3873 = 4'h9 == io_enq_req_1_bits_sqIdx_value ? io_enq_req_1_bits_robIdx_value : _GEN_2505; // @[StoreQueue.scala 212:{18,18}]
  wire [4:0] _GEN_3874 = 4'ha == io_enq_req_1_bits_sqIdx_value ? io_enq_req_1_bits_robIdx_value : _GEN_2506; // @[StoreQueue.scala 212:{18,18}]
  wire [4:0] _GEN_3875 = 4'hb == io_enq_req_1_bits_sqIdx_value ? io_enq_req_1_bits_robIdx_value : _GEN_2507; // @[StoreQueue.scala 212:{18,18}]
  wire  _GEN_4088 = 4'h0 == io_enq_req_1_bits_sqIdx_value | _GEN_2688; // @[StoreQueue.scala 215:{24,24}]
  wire  _GEN_4089 = 4'h1 == io_enq_req_1_bits_sqIdx_value | _GEN_2689; // @[StoreQueue.scala 215:{24,24}]
  wire  _GEN_4090 = 4'h2 == io_enq_req_1_bits_sqIdx_value | _GEN_2690; // @[StoreQueue.scala 215:{24,24}]
  wire  _GEN_4091 = 4'h3 == io_enq_req_1_bits_sqIdx_value | _GEN_2691; // @[StoreQueue.scala 215:{24,24}]
  wire  _GEN_4092 = 4'h4 == io_enq_req_1_bits_sqIdx_value | _GEN_2692; // @[StoreQueue.scala 215:{24,24}]
  wire  _GEN_4093 = 4'h5 == io_enq_req_1_bits_sqIdx_value | _GEN_2693; // @[StoreQueue.scala 215:{24,24}]
  wire  _GEN_4094 = 4'h6 == io_enq_req_1_bits_sqIdx_value | _GEN_2694; // @[StoreQueue.scala 215:{24,24}]
  wire  _GEN_4095 = 4'h7 == io_enq_req_1_bits_sqIdx_value | _GEN_2695; // @[StoreQueue.scala 215:{24,24}]
  wire  _GEN_4096 = 4'h8 == io_enq_req_1_bits_sqIdx_value | _GEN_2696; // @[StoreQueue.scala 215:{24,24}]
  wire  _GEN_4097 = 4'h9 == io_enq_req_1_bits_sqIdx_value | _GEN_2697; // @[StoreQueue.scala 215:{24,24}]
  wire  _GEN_4098 = 4'ha == io_enq_req_1_bits_sqIdx_value | _GEN_2698; // @[StoreQueue.scala 215:{24,24}]
  wire  _GEN_4099 = 4'hb == io_enq_req_1_bits_sqIdx_value | _GEN_2699; // @[StoreQueue.scala 215:{24,24}]
  wire  _GEN_4100 = 4'h0 == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2700; // @[StoreQueue.scala 216:{24,24}]
  wire  _GEN_4101 = 4'h1 == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2701; // @[StoreQueue.scala 216:{24,24}]
  wire  _GEN_4102 = 4'h2 == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2702; // @[StoreQueue.scala 216:{24,24}]
  wire  _GEN_4103 = 4'h3 == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2703; // @[StoreQueue.scala 216:{24,24}]
  wire  _GEN_4104 = 4'h4 == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2704; // @[StoreQueue.scala 216:{24,24}]
  wire  _GEN_4105 = 4'h5 == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2705; // @[StoreQueue.scala 216:{24,24}]
  wire  _GEN_4106 = 4'h6 == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2706; // @[StoreQueue.scala 216:{24,24}]
  wire  _GEN_4107 = 4'h7 == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2707; // @[StoreQueue.scala 216:{24,24}]
  wire  _GEN_4108 = 4'h8 == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2708; // @[StoreQueue.scala 216:{24,24}]
  wire  _GEN_4109 = 4'h9 == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2709; // @[StoreQueue.scala 216:{24,24}]
  wire  _GEN_4110 = 4'ha == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2710; // @[StoreQueue.scala 216:{24,24}]
  wire  _GEN_4111 = 4'hb == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2711; // @[StoreQueue.scala 216:{24,24}]
  wire  _GEN_4112 = 4'h0 == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2712; // @[StoreQueue.scala 217:{24,24}]
  wire  _GEN_4113 = 4'h1 == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2713; // @[StoreQueue.scala 217:{24,24}]
  wire  _GEN_4114 = 4'h2 == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2714; // @[StoreQueue.scala 217:{24,24}]
  wire  _GEN_4115 = 4'h3 == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2715; // @[StoreQueue.scala 217:{24,24}]
  wire  _GEN_4116 = 4'h4 == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2716; // @[StoreQueue.scala 217:{24,24}]
  wire  _GEN_4117 = 4'h5 == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2717; // @[StoreQueue.scala 217:{24,24}]
  wire  _GEN_4118 = 4'h6 == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2718; // @[StoreQueue.scala 217:{24,24}]
  wire  _GEN_4119 = 4'h7 == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2719; // @[StoreQueue.scala 217:{24,24}]
  wire  _GEN_4120 = 4'h8 == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2720; // @[StoreQueue.scala 217:{24,24}]
  wire  _GEN_4121 = 4'h9 == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2721; // @[StoreQueue.scala 217:{24,24}]
  wire  _GEN_4122 = 4'ha == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2722; // @[StoreQueue.scala 217:{24,24}]
  wire  _GEN_4123 = 4'hb == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2723; // @[StoreQueue.scala 217:{24,24}]
  wire  _GEN_4124 = 4'h0 == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2724; // @[StoreQueue.scala 218:{24,24}]
  wire  _GEN_4125 = 4'h1 == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2725; // @[StoreQueue.scala 218:{24,24}]
  wire  _GEN_4126 = 4'h2 == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2726; // @[StoreQueue.scala 218:{24,24}]
  wire  _GEN_4127 = 4'h3 == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2727; // @[StoreQueue.scala 218:{24,24}]
  wire  _GEN_4128 = 4'h4 == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2728; // @[StoreQueue.scala 218:{24,24}]
  wire  _GEN_4129 = 4'h5 == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2729; // @[StoreQueue.scala 218:{24,24}]
  wire  _GEN_4130 = 4'h6 == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2730; // @[StoreQueue.scala 218:{24,24}]
  wire  _GEN_4131 = 4'h7 == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2731; // @[StoreQueue.scala 218:{24,24}]
  wire  _GEN_4132 = 4'h8 == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2732; // @[StoreQueue.scala 218:{24,24}]
  wire  _GEN_4133 = 4'h9 == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2733; // @[StoreQueue.scala 218:{24,24}]
  wire  _GEN_4134 = 4'ha == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2734; // @[StoreQueue.scala 218:{24,24}]
  wire  _GEN_4135 = 4'hb == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2735; // @[StoreQueue.scala 218:{24,24}]
  wire  _GEN_4136 = 4'h0 == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2736; // @[StoreQueue.scala 219:{22,22}]
  wire  _GEN_4137 = 4'h1 == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2737; // @[StoreQueue.scala 219:{22,22}]
  wire  _GEN_4138 = 4'h2 == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2738; // @[StoreQueue.scala 219:{22,22}]
  wire  _GEN_4139 = 4'h3 == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2739; // @[StoreQueue.scala 219:{22,22}]
  wire  _GEN_4140 = 4'h4 == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2740; // @[StoreQueue.scala 219:{22,22}]
  wire  _GEN_4141 = 4'h5 == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2741; // @[StoreQueue.scala 219:{22,22}]
  wire  _GEN_4142 = 4'h6 == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2742; // @[StoreQueue.scala 219:{22,22}]
  wire  _GEN_4143 = 4'h7 == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2743; // @[StoreQueue.scala 219:{22,22}]
  wire  _GEN_4144 = 4'h8 == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2744; // @[StoreQueue.scala 219:{22,22}]
  wire  _GEN_4145 = 4'h9 == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2745; // @[StoreQueue.scala 219:{22,22}]
  wire  _GEN_4146 = 4'ha == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2746; // @[StoreQueue.scala 219:{22,22}]
  wire  _GEN_4147 = 4'hb == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2747; // @[StoreQueue.scala 219:{22,22}]
  wire  _GEN_4148 = 4'h0 == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2748; // @[StoreQueue.scala 220:{24,24}]
  wire  _GEN_4149 = 4'h1 == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2749; // @[StoreQueue.scala 220:{24,24}]
  wire  _GEN_4150 = 4'h2 == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2750; // @[StoreQueue.scala 220:{24,24}]
  wire  _GEN_4151 = 4'h3 == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2751; // @[StoreQueue.scala 220:{24,24}]
  wire  _GEN_4152 = 4'h4 == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2752; // @[StoreQueue.scala 220:{24,24}]
  wire  _GEN_4153 = 4'h5 == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2753; // @[StoreQueue.scala 220:{24,24}]
  wire  _GEN_4154 = 4'h6 == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2754; // @[StoreQueue.scala 220:{24,24}]
  wire  _GEN_4155 = 4'h7 == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2755; // @[StoreQueue.scala 220:{24,24}]
  wire  _GEN_4156 = 4'h8 == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2756; // @[StoreQueue.scala 220:{24,24}]
  wire  _GEN_4157 = 4'h9 == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2757; // @[StoreQueue.scala 220:{24,24}]
  wire  _GEN_4158 = 4'ha == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2758; // @[StoreQueue.scala 220:{24,24}]
  wire  _GEN_4159 = 4'hb == io_enq_req_1_bits_sqIdx_value ? 1'h0 : _GEN_2759; // @[StoreQueue.scala 220:{24,24}]
  wire  _GEN_4436 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_3036 : _GEN_1668; // @[StoreQueue.scala 211:43]
  wire  _GEN_4437 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_3037 : _GEN_1669; // @[StoreQueue.scala 211:43]
  wire  _GEN_4438 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_3038 : _GEN_1670; // @[StoreQueue.scala 211:43]
  wire  _GEN_4439 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_3039 : _GEN_1671; // @[StoreQueue.scala 211:43]
  wire  _GEN_4440 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_3040 : _GEN_1672; // @[StoreQueue.scala 211:43]
  wire  _GEN_4441 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_3041 : _GEN_1673; // @[StoreQueue.scala 211:43]
  wire  _GEN_4442 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_3042 : _GEN_1674; // @[StoreQueue.scala 211:43]
  wire  _GEN_4443 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_3043 : _GEN_1675; // @[StoreQueue.scala 211:43]
  wire  _GEN_4444 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_3044 : _GEN_1676; // @[StoreQueue.scala 211:43]
  wire  _GEN_4445 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_3045 : _GEN_1677; // @[StoreQueue.scala 211:43]
  wire  _GEN_4446 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_3046 : _GEN_1678; // @[StoreQueue.scala 211:43]
  wire  _GEN_4447 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_3047 : _GEN_1679; // @[StoreQueue.scala 211:43]
  wire [6:0] _GEN_4832 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_3432 : _GEN_2064; // @[StoreQueue.scala 211:43]
  wire [6:0] _GEN_4833 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_3433 : _GEN_2065; // @[StoreQueue.scala 211:43]
  wire [6:0] _GEN_4834 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_3434 : _GEN_2066; // @[StoreQueue.scala 211:43]
  wire [6:0] _GEN_4835 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_3435 : _GEN_2067; // @[StoreQueue.scala 211:43]
  wire [6:0] _GEN_4836 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_3436 : _GEN_2068; // @[StoreQueue.scala 211:43]
  wire [6:0] _GEN_4837 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_3437 : _GEN_2069; // @[StoreQueue.scala 211:43]
  wire [6:0] _GEN_4838 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_3438 : _GEN_2070; // @[StoreQueue.scala 211:43]
  wire [6:0] _GEN_4839 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_3439 : _GEN_2071; // @[StoreQueue.scala 211:43]
  wire [6:0] _GEN_4840 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_3440 : _GEN_2072; // @[StoreQueue.scala 211:43]
  wire [6:0] _GEN_4841 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_3441 : _GEN_2073; // @[StoreQueue.scala 211:43]
  wire [6:0] _GEN_4842 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_3442 : _GEN_2074; // @[StoreQueue.scala 211:43]
  wire [6:0] _GEN_4843 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_3443 : _GEN_2075; // @[StoreQueue.scala 211:43]
  wire  _GEN_5252 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_3852 : _GEN_2484; // @[StoreQueue.scala 211:43]
  wire  _GEN_5253 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_3853 : _GEN_2485; // @[StoreQueue.scala 211:43]
  wire  _GEN_5254 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_3854 : _GEN_2486; // @[StoreQueue.scala 211:43]
  wire  _GEN_5255 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_3855 : _GEN_2487; // @[StoreQueue.scala 211:43]
  wire  _GEN_5256 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_3856 : _GEN_2488; // @[StoreQueue.scala 211:43]
  wire  _GEN_5257 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_3857 : _GEN_2489; // @[StoreQueue.scala 211:43]
  wire  _GEN_5258 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_3858 : _GEN_2490; // @[StoreQueue.scala 211:43]
  wire  _GEN_5259 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_3859 : _GEN_2491; // @[StoreQueue.scala 211:43]
  wire  _GEN_5260 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_3860 : _GEN_2492; // @[StoreQueue.scala 211:43]
  wire  _GEN_5261 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_3861 : _GEN_2493; // @[StoreQueue.scala 211:43]
  wire  _GEN_5262 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_3862 : _GEN_2494; // @[StoreQueue.scala 211:43]
  wire  _GEN_5263 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_3863 : _GEN_2495; // @[StoreQueue.scala 211:43]
  wire [4:0] _GEN_5264 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_3864 : _GEN_2496; // @[StoreQueue.scala 211:43]
  wire [4:0] _GEN_5265 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_3865 : _GEN_2497; // @[StoreQueue.scala 211:43]
  wire [4:0] _GEN_5266 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_3866 : _GEN_2498; // @[StoreQueue.scala 211:43]
  wire [4:0] _GEN_5267 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_3867 : _GEN_2499; // @[StoreQueue.scala 211:43]
  wire [4:0] _GEN_5268 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_3868 : _GEN_2500; // @[StoreQueue.scala 211:43]
  wire [4:0] _GEN_5269 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_3869 : _GEN_2501; // @[StoreQueue.scala 211:43]
  wire [4:0] _GEN_5270 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_3870 : _GEN_2502; // @[StoreQueue.scala 211:43]
  wire [4:0] _GEN_5271 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_3871 : _GEN_2503; // @[StoreQueue.scala 211:43]
  wire [4:0] _GEN_5272 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_3872 : _GEN_2504; // @[StoreQueue.scala 211:43]
  wire [4:0] _GEN_5273 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_3873 : _GEN_2505; // @[StoreQueue.scala 211:43]
  wire [4:0] _GEN_5274 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_3874 : _GEN_2506; // @[StoreQueue.scala 211:43]
  wire [4:0] _GEN_5275 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_3875 : _GEN_2507; // @[StoreQueue.scala 211:43]
  wire  _GEN_5456 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4088 : _GEN_2688; // @[StoreQueue.scala 211:43]
  wire  _GEN_5457 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4089 : _GEN_2689; // @[StoreQueue.scala 211:43]
  wire  _GEN_5458 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4090 : _GEN_2690; // @[StoreQueue.scala 211:43]
  wire  _GEN_5459 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4091 : _GEN_2691; // @[StoreQueue.scala 211:43]
  wire  _GEN_5460 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4092 : _GEN_2692; // @[StoreQueue.scala 211:43]
  wire  _GEN_5461 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4093 : _GEN_2693; // @[StoreQueue.scala 211:43]
  wire  _GEN_5462 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4094 : _GEN_2694; // @[StoreQueue.scala 211:43]
  wire  _GEN_5463 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4095 : _GEN_2695; // @[StoreQueue.scala 211:43]
  wire  _GEN_5464 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4096 : _GEN_2696; // @[StoreQueue.scala 211:43]
  wire  _GEN_5465 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4097 : _GEN_2697; // @[StoreQueue.scala 211:43]
  wire  _GEN_5466 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4098 : _GEN_2698; // @[StoreQueue.scala 211:43]
  wire  _GEN_5467 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4099 : _GEN_2699; // @[StoreQueue.scala 211:43]
  wire  _GEN_5468 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4100 : _GEN_2700; // @[StoreQueue.scala 211:43]
  wire  _GEN_5469 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4101 : _GEN_2701; // @[StoreQueue.scala 211:43]
  wire  _GEN_5470 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4102 : _GEN_2702; // @[StoreQueue.scala 211:43]
  wire  _GEN_5471 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4103 : _GEN_2703; // @[StoreQueue.scala 211:43]
  wire  _GEN_5472 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4104 : _GEN_2704; // @[StoreQueue.scala 211:43]
  wire  _GEN_5473 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4105 : _GEN_2705; // @[StoreQueue.scala 211:43]
  wire  _GEN_5474 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4106 : _GEN_2706; // @[StoreQueue.scala 211:43]
  wire  _GEN_5475 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4107 : _GEN_2707; // @[StoreQueue.scala 211:43]
  wire  _GEN_5476 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4108 : _GEN_2708; // @[StoreQueue.scala 211:43]
  wire  _GEN_5477 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4109 : _GEN_2709; // @[StoreQueue.scala 211:43]
  wire  _GEN_5478 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4110 : _GEN_2710; // @[StoreQueue.scala 211:43]
  wire  _GEN_5479 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4111 : _GEN_2711; // @[StoreQueue.scala 211:43]
  wire  _GEN_5480 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4112 : _GEN_2712; // @[StoreQueue.scala 211:43]
  wire  _GEN_5481 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4113 : _GEN_2713; // @[StoreQueue.scala 211:43]
  wire  _GEN_5482 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4114 : _GEN_2714; // @[StoreQueue.scala 211:43]
  wire  _GEN_5483 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4115 : _GEN_2715; // @[StoreQueue.scala 211:43]
  wire  _GEN_5484 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4116 : _GEN_2716; // @[StoreQueue.scala 211:43]
  wire  _GEN_5485 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4117 : _GEN_2717; // @[StoreQueue.scala 211:43]
  wire  _GEN_5486 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4118 : _GEN_2718; // @[StoreQueue.scala 211:43]
  wire  _GEN_5487 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4119 : _GEN_2719; // @[StoreQueue.scala 211:43]
  wire  _GEN_5488 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4120 : _GEN_2720; // @[StoreQueue.scala 211:43]
  wire  _GEN_5489 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4121 : _GEN_2721; // @[StoreQueue.scala 211:43]
  wire  _GEN_5490 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4122 : _GEN_2722; // @[StoreQueue.scala 211:43]
  wire  _GEN_5491 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4123 : _GEN_2723; // @[StoreQueue.scala 211:43]
  wire  _GEN_5492 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4124 : _GEN_2724; // @[StoreQueue.scala 211:43]
  wire  _GEN_5493 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4125 : _GEN_2725; // @[StoreQueue.scala 211:43]
  wire  _GEN_5494 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4126 : _GEN_2726; // @[StoreQueue.scala 211:43]
  wire  _GEN_5495 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4127 : _GEN_2727; // @[StoreQueue.scala 211:43]
  wire  _GEN_5496 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4128 : _GEN_2728; // @[StoreQueue.scala 211:43]
  wire  _GEN_5497 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4129 : _GEN_2729; // @[StoreQueue.scala 211:43]
  wire  _GEN_5498 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4130 : _GEN_2730; // @[StoreQueue.scala 211:43]
  wire  _GEN_5499 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4131 : _GEN_2731; // @[StoreQueue.scala 211:43]
  wire  _GEN_5500 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4132 : _GEN_2732; // @[StoreQueue.scala 211:43]
  wire  _GEN_5501 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4133 : _GEN_2733; // @[StoreQueue.scala 211:43]
  wire  _GEN_5502 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4134 : _GEN_2734; // @[StoreQueue.scala 211:43]
  wire  _GEN_5503 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4135 : _GEN_2735; // @[StoreQueue.scala 211:43]
  wire  _GEN_5504 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4136 : _GEN_2736; // @[StoreQueue.scala 211:43]
  wire  _GEN_5505 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4137 : _GEN_2737; // @[StoreQueue.scala 211:43]
  wire  _GEN_5506 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4138 : _GEN_2738; // @[StoreQueue.scala 211:43]
  wire  _GEN_5507 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4139 : _GEN_2739; // @[StoreQueue.scala 211:43]
  wire  _GEN_5508 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4140 : _GEN_2740; // @[StoreQueue.scala 211:43]
  wire  _GEN_5509 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4141 : _GEN_2741; // @[StoreQueue.scala 211:43]
  wire  _GEN_5510 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4142 : _GEN_2742; // @[StoreQueue.scala 211:43]
  wire  _GEN_5511 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4143 : _GEN_2743; // @[StoreQueue.scala 211:43]
  wire  _GEN_5512 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4144 : _GEN_2744; // @[StoreQueue.scala 211:43]
  wire  _GEN_5513 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4145 : _GEN_2745; // @[StoreQueue.scala 211:43]
  wire  _GEN_5514 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4146 : _GEN_2746; // @[StoreQueue.scala 211:43]
  wire  _GEN_5515 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4147 : _GEN_2747; // @[StoreQueue.scala 211:43]
  wire  _GEN_5516 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4148 : _GEN_2748; // @[StoreQueue.scala 211:43]
  wire  _GEN_5517 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4149 : _GEN_2749; // @[StoreQueue.scala 211:43]
  wire  _GEN_5518 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4150 : _GEN_2750; // @[StoreQueue.scala 211:43]
  wire  _GEN_5519 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4151 : _GEN_2751; // @[StoreQueue.scala 211:43]
  wire  _GEN_5520 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4152 : _GEN_2752; // @[StoreQueue.scala 211:43]
  wire  _GEN_5521 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4153 : _GEN_2753; // @[StoreQueue.scala 211:43]
  wire  _GEN_5522 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4154 : _GEN_2754; // @[StoreQueue.scala 211:43]
  wire  _GEN_5523 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4155 : _GEN_2755; // @[StoreQueue.scala 211:43]
  wire  _GEN_5524 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4156 : _GEN_2756; // @[StoreQueue.scala 211:43]
  wire  _GEN_5525 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4157 : _GEN_2757; // @[StoreQueue.scala 211:43]
  wire  _GEN_5526 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4158 : _GEN_2758; // @[StoreQueue.scala 211:43]
  wire  _GEN_5527 = io_enq_req_1_valid & ~enqCancel_1 ? _GEN_4159 : _GEN_2759; // @[StoreQueue.scala 211:43]
  wire  _GEN_5804 = 4'h0 == io_enq_req_2_bits_sqIdx_value ? io_enq_req_2_bits_cf_trigger_backendEn_0 : _GEN_4436; // @[StoreQueue.scala 212:{18,18}]
  wire  _GEN_5805 = 4'h1 == io_enq_req_2_bits_sqIdx_value ? io_enq_req_2_bits_cf_trigger_backendEn_0 : _GEN_4437; // @[StoreQueue.scala 212:{18,18}]
  wire  _GEN_5806 = 4'h2 == io_enq_req_2_bits_sqIdx_value ? io_enq_req_2_bits_cf_trigger_backendEn_0 : _GEN_4438; // @[StoreQueue.scala 212:{18,18}]
  wire  _GEN_5807 = 4'h3 == io_enq_req_2_bits_sqIdx_value ? io_enq_req_2_bits_cf_trigger_backendEn_0 : _GEN_4439; // @[StoreQueue.scala 212:{18,18}]
  wire  _GEN_5808 = 4'h4 == io_enq_req_2_bits_sqIdx_value ? io_enq_req_2_bits_cf_trigger_backendEn_0 : _GEN_4440; // @[StoreQueue.scala 212:{18,18}]
  wire  _GEN_5809 = 4'h5 == io_enq_req_2_bits_sqIdx_value ? io_enq_req_2_bits_cf_trigger_backendEn_0 : _GEN_4441; // @[StoreQueue.scala 212:{18,18}]
  wire  _GEN_5810 = 4'h6 == io_enq_req_2_bits_sqIdx_value ? io_enq_req_2_bits_cf_trigger_backendEn_0 : _GEN_4442; // @[StoreQueue.scala 212:{18,18}]
  wire  _GEN_5811 = 4'h7 == io_enq_req_2_bits_sqIdx_value ? io_enq_req_2_bits_cf_trigger_backendEn_0 : _GEN_4443; // @[StoreQueue.scala 212:{18,18}]
  wire  _GEN_5812 = 4'h8 == io_enq_req_2_bits_sqIdx_value ? io_enq_req_2_bits_cf_trigger_backendEn_0 : _GEN_4444; // @[StoreQueue.scala 212:{18,18}]
  wire  _GEN_5813 = 4'h9 == io_enq_req_2_bits_sqIdx_value ? io_enq_req_2_bits_cf_trigger_backendEn_0 : _GEN_4445; // @[StoreQueue.scala 212:{18,18}]
  wire  _GEN_5814 = 4'ha == io_enq_req_2_bits_sqIdx_value ? io_enq_req_2_bits_cf_trigger_backendEn_0 : _GEN_4446; // @[StoreQueue.scala 212:{18,18}]
  wire  _GEN_5815 = 4'hb == io_enq_req_2_bits_sqIdx_value ? io_enq_req_2_bits_cf_trigger_backendEn_0 : _GEN_4447; // @[StoreQueue.scala 212:{18,18}]
  wire [6:0] _GEN_6200 = 4'h0 == io_enq_req_2_bits_sqIdx_value ? io_enq_req_2_bits_ctrl_fuOpType : _GEN_4832; // @[StoreQueue.scala 212:{18,18}]
  wire [6:0] _GEN_6201 = 4'h1 == io_enq_req_2_bits_sqIdx_value ? io_enq_req_2_bits_ctrl_fuOpType : _GEN_4833; // @[StoreQueue.scala 212:{18,18}]
  wire [6:0] _GEN_6202 = 4'h2 == io_enq_req_2_bits_sqIdx_value ? io_enq_req_2_bits_ctrl_fuOpType : _GEN_4834; // @[StoreQueue.scala 212:{18,18}]
  wire [6:0] _GEN_6203 = 4'h3 == io_enq_req_2_bits_sqIdx_value ? io_enq_req_2_bits_ctrl_fuOpType : _GEN_4835; // @[StoreQueue.scala 212:{18,18}]
  wire [6:0] _GEN_6204 = 4'h4 == io_enq_req_2_bits_sqIdx_value ? io_enq_req_2_bits_ctrl_fuOpType : _GEN_4836; // @[StoreQueue.scala 212:{18,18}]
  wire [6:0] _GEN_6205 = 4'h5 == io_enq_req_2_bits_sqIdx_value ? io_enq_req_2_bits_ctrl_fuOpType : _GEN_4837; // @[StoreQueue.scala 212:{18,18}]
  wire [6:0] _GEN_6206 = 4'h6 == io_enq_req_2_bits_sqIdx_value ? io_enq_req_2_bits_ctrl_fuOpType : _GEN_4838; // @[StoreQueue.scala 212:{18,18}]
  wire [6:0] _GEN_6207 = 4'h7 == io_enq_req_2_bits_sqIdx_value ? io_enq_req_2_bits_ctrl_fuOpType : _GEN_4839; // @[StoreQueue.scala 212:{18,18}]
  wire [6:0] _GEN_6208 = 4'h8 == io_enq_req_2_bits_sqIdx_value ? io_enq_req_2_bits_ctrl_fuOpType : _GEN_4840; // @[StoreQueue.scala 212:{18,18}]
  wire [6:0] _GEN_6209 = 4'h9 == io_enq_req_2_bits_sqIdx_value ? io_enq_req_2_bits_ctrl_fuOpType : _GEN_4841; // @[StoreQueue.scala 212:{18,18}]
  wire [6:0] _GEN_6210 = 4'ha == io_enq_req_2_bits_sqIdx_value ? io_enq_req_2_bits_ctrl_fuOpType : _GEN_4842; // @[StoreQueue.scala 212:{18,18}]
  wire [6:0] _GEN_6211 = 4'hb == io_enq_req_2_bits_sqIdx_value ? io_enq_req_2_bits_ctrl_fuOpType : _GEN_4843; // @[StoreQueue.scala 212:{18,18}]
  wire  _GEN_6620 = 4'h0 == io_enq_req_2_bits_sqIdx_value ? io_enq_req_2_bits_robIdx_flag : _GEN_5252; // @[StoreQueue.scala 212:{18,18}]
  wire  _GEN_6621 = 4'h1 == io_enq_req_2_bits_sqIdx_value ? io_enq_req_2_bits_robIdx_flag : _GEN_5253; // @[StoreQueue.scala 212:{18,18}]
  wire  _GEN_6622 = 4'h2 == io_enq_req_2_bits_sqIdx_value ? io_enq_req_2_bits_robIdx_flag : _GEN_5254; // @[StoreQueue.scala 212:{18,18}]
  wire  _GEN_6623 = 4'h3 == io_enq_req_2_bits_sqIdx_value ? io_enq_req_2_bits_robIdx_flag : _GEN_5255; // @[StoreQueue.scala 212:{18,18}]
  wire  _GEN_6624 = 4'h4 == io_enq_req_2_bits_sqIdx_value ? io_enq_req_2_bits_robIdx_flag : _GEN_5256; // @[StoreQueue.scala 212:{18,18}]
  wire  _GEN_6625 = 4'h5 == io_enq_req_2_bits_sqIdx_value ? io_enq_req_2_bits_robIdx_flag : _GEN_5257; // @[StoreQueue.scala 212:{18,18}]
  wire  _GEN_6626 = 4'h6 == io_enq_req_2_bits_sqIdx_value ? io_enq_req_2_bits_robIdx_flag : _GEN_5258; // @[StoreQueue.scala 212:{18,18}]
  wire  _GEN_6627 = 4'h7 == io_enq_req_2_bits_sqIdx_value ? io_enq_req_2_bits_robIdx_flag : _GEN_5259; // @[StoreQueue.scala 212:{18,18}]
  wire  _GEN_6628 = 4'h8 == io_enq_req_2_bits_sqIdx_value ? io_enq_req_2_bits_robIdx_flag : _GEN_5260; // @[StoreQueue.scala 212:{18,18}]
  wire  _GEN_6629 = 4'h9 == io_enq_req_2_bits_sqIdx_value ? io_enq_req_2_bits_robIdx_flag : _GEN_5261; // @[StoreQueue.scala 212:{18,18}]
  wire  _GEN_6630 = 4'ha == io_enq_req_2_bits_sqIdx_value ? io_enq_req_2_bits_robIdx_flag : _GEN_5262; // @[StoreQueue.scala 212:{18,18}]
  wire  _GEN_6631 = 4'hb == io_enq_req_2_bits_sqIdx_value ? io_enq_req_2_bits_robIdx_flag : _GEN_5263; // @[StoreQueue.scala 212:{18,18}]
  wire [4:0] _GEN_6632 = 4'h0 == io_enq_req_2_bits_sqIdx_value ? io_enq_req_2_bits_robIdx_value : _GEN_5264; // @[StoreQueue.scala 212:{18,18}]
  wire [4:0] _GEN_6633 = 4'h1 == io_enq_req_2_bits_sqIdx_value ? io_enq_req_2_bits_robIdx_value : _GEN_5265; // @[StoreQueue.scala 212:{18,18}]
  wire [4:0] _GEN_6634 = 4'h2 == io_enq_req_2_bits_sqIdx_value ? io_enq_req_2_bits_robIdx_value : _GEN_5266; // @[StoreQueue.scala 212:{18,18}]
  wire [4:0] _GEN_6635 = 4'h3 == io_enq_req_2_bits_sqIdx_value ? io_enq_req_2_bits_robIdx_value : _GEN_5267; // @[StoreQueue.scala 212:{18,18}]
  wire [4:0] _GEN_6636 = 4'h4 == io_enq_req_2_bits_sqIdx_value ? io_enq_req_2_bits_robIdx_value : _GEN_5268; // @[StoreQueue.scala 212:{18,18}]
  wire [4:0] _GEN_6637 = 4'h5 == io_enq_req_2_bits_sqIdx_value ? io_enq_req_2_bits_robIdx_value : _GEN_5269; // @[StoreQueue.scala 212:{18,18}]
  wire [4:0] _GEN_6638 = 4'h6 == io_enq_req_2_bits_sqIdx_value ? io_enq_req_2_bits_robIdx_value : _GEN_5270; // @[StoreQueue.scala 212:{18,18}]
  wire [4:0] _GEN_6639 = 4'h7 == io_enq_req_2_bits_sqIdx_value ? io_enq_req_2_bits_robIdx_value : _GEN_5271; // @[StoreQueue.scala 212:{18,18}]
  wire [4:0] _GEN_6640 = 4'h8 == io_enq_req_2_bits_sqIdx_value ? io_enq_req_2_bits_robIdx_value : _GEN_5272; // @[StoreQueue.scala 212:{18,18}]
  wire [4:0] _GEN_6641 = 4'h9 == io_enq_req_2_bits_sqIdx_value ? io_enq_req_2_bits_robIdx_value : _GEN_5273; // @[StoreQueue.scala 212:{18,18}]
  wire [4:0] _GEN_6642 = 4'ha == io_enq_req_2_bits_sqIdx_value ? io_enq_req_2_bits_robIdx_value : _GEN_5274; // @[StoreQueue.scala 212:{18,18}]
  wire [4:0] _GEN_6643 = 4'hb == io_enq_req_2_bits_sqIdx_value ? io_enq_req_2_bits_robIdx_value : _GEN_5275; // @[StoreQueue.scala 212:{18,18}]
  wire  _GEN_6856 = 4'h0 == io_enq_req_2_bits_sqIdx_value | _GEN_5456; // @[StoreQueue.scala 215:{24,24}]
  wire  _GEN_6857 = 4'h1 == io_enq_req_2_bits_sqIdx_value | _GEN_5457; // @[StoreQueue.scala 215:{24,24}]
  wire  _GEN_6858 = 4'h2 == io_enq_req_2_bits_sqIdx_value | _GEN_5458; // @[StoreQueue.scala 215:{24,24}]
  wire  _GEN_6859 = 4'h3 == io_enq_req_2_bits_sqIdx_value | _GEN_5459; // @[StoreQueue.scala 215:{24,24}]
  wire  _GEN_6860 = 4'h4 == io_enq_req_2_bits_sqIdx_value | _GEN_5460; // @[StoreQueue.scala 215:{24,24}]
  wire  _GEN_6861 = 4'h5 == io_enq_req_2_bits_sqIdx_value | _GEN_5461; // @[StoreQueue.scala 215:{24,24}]
  wire  _GEN_6862 = 4'h6 == io_enq_req_2_bits_sqIdx_value | _GEN_5462; // @[StoreQueue.scala 215:{24,24}]
  wire  _GEN_6863 = 4'h7 == io_enq_req_2_bits_sqIdx_value | _GEN_5463; // @[StoreQueue.scala 215:{24,24}]
  wire  _GEN_6864 = 4'h8 == io_enq_req_2_bits_sqIdx_value | _GEN_5464; // @[StoreQueue.scala 215:{24,24}]
  wire  _GEN_6865 = 4'h9 == io_enq_req_2_bits_sqIdx_value | _GEN_5465; // @[StoreQueue.scala 215:{24,24}]
  wire  _GEN_6866 = 4'ha == io_enq_req_2_bits_sqIdx_value | _GEN_5466; // @[StoreQueue.scala 215:{24,24}]
  wire  _GEN_6867 = 4'hb == io_enq_req_2_bits_sqIdx_value | _GEN_5467; // @[StoreQueue.scala 215:{24,24}]
  wire  _GEN_6868 = 4'h0 == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5468; // @[StoreQueue.scala 216:{24,24}]
  wire  _GEN_6869 = 4'h1 == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5469; // @[StoreQueue.scala 216:{24,24}]
  wire  _GEN_6870 = 4'h2 == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5470; // @[StoreQueue.scala 216:{24,24}]
  wire  _GEN_6871 = 4'h3 == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5471; // @[StoreQueue.scala 216:{24,24}]
  wire  _GEN_6872 = 4'h4 == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5472; // @[StoreQueue.scala 216:{24,24}]
  wire  _GEN_6873 = 4'h5 == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5473; // @[StoreQueue.scala 216:{24,24}]
  wire  _GEN_6874 = 4'h6 == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5474; // @[StoreQueue.scala 216:{24,24}]
  wire  _GEN_6875 = 4'h7 == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5475; // @[StoreQueue.scala 216:{24,24}]
  wire  _GEN_6876 = 4'h8 == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5476; // @[StoreQueue.scala 216:{24,24}]
  wire  _GEN_6877 = 4'h9 == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5477; // @[StoreQueue.scala 216:{24,24}]
  wire  _GEN_6878 = 4'ha == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5478; // @[StoreQueue.scala 216:{24,24}]
  wire  _GEN_6879 = 4'hb == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5479; // @[StoreQueue.scala 216:{24,24}]
  wire  _GEN_6880 = 4'h0 == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5480; // @[StoreQueue.scala 217:{24,24}]
  wire  _GEN_6881 = 4'h1 == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5481; // @[StoreQueue.scala 217:{24,24}]
  wire  _GEN_6882 = 4'h2 == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5482; // @[StoreQueue.scala 217:{24,24}]
  wire  _GEN_6883 = 4'h3 == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5483; // @[StoreQueue.scala 217:{24,24}]
  wire  _GEN_6884 = 4'h4 == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5484; // @[StoreQueue.scala 217:{24,24}]
  wire  _GEN_6885 = 4'h5 == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5485; // @[StoreQueue.scala 217:{24,24}]
  wire  _GEN_6886 = 4'h6 == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5486; // @[StoreQueue.scala 217:{24,24}]
  wire  _GEN_6887 = 4'h7 == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5487; // @[StoreQueue.scala 217:{24,24}]
  wire  _GEN_6888 = 4'h8 == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5488; // @[StoreQueue.scala 217:{24,24}]
  wire  _GEN_6889 = 4'h9 == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5489; // @[StoreQueue.scala 217:{24,24}]
  wire  _GEN_6890 = 4'ha == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5490; // @[StoreQueue.scala 217:{24,24}]
  wire  _GEN_6891 = 4'hb == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5491; // @[StoreQueue.scala 217:{24,24}]
  wire  _GEN_6892 = 4'h0 == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5492; // @[StoreQueue.scala 218:{24,24}]
  wire  _GEN_6893 = 4'h1 == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5493; // @[StoreQueue.scala 218:{24,24}]
  wire  _GEN_6894 = 4'h2 == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5494; // @[StoreQueue.scala 218:{24,24}]
  wire  _GEN_6895 = 4'h3 == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5495; // @[StoreQueue.scala 218:{24,24}]
  wire  _GEN_6896 = 4'h4 == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5496; // @[StoreQueue.scala 218:{24,24}]
  wire  _GEN_6897 = 4'h5 == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5497; // @[StoreQueue.scala 218:{24,24}]
  wire  _GEN_6898 = 4'h6 == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5498; // @[StoreQueue.scala 218:{24,24}]
  wire  _GEN_6899 = 4'h7 == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5499; // @[StoreQueue.scala 218:{24,24}]
  wire  _GEN_6900 = 4'h8 == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5500; // @[StoreQueue.scala 218:{24,24}]
  wire  _GEN_6901 = 4'h9 == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5501; // @[StoreQueue.scala 218:{24,24}]
  wire  _GEN_6902 = 4'ha == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5502; // @[StoreQueue.scala 218:{24,24}]
  wire  _GEN_6903 = 4'hb == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5503; // @[StoreQueue.scala 218:{24,24}]
  wire  _GEN_6904 = 4'h0 == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5504; // @[StoreQueue.scala 219:{22,22}]
  wire  _GEN_6905 = 4'h1 == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5505; // @[StoreQueue.scala 219:{22,22}]
  wire  _GEN_6906 = 4'h2 == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5506; // @[StoreQueue.scala 219:{22,22}]
  wire  _GEN_6907 = 4'h3 == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5507; // @[StoreQueue.scala 219:{22,22}]
  wire  _GEN_6908 = 4'h4 == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5508; // @[StoreQueue.scala 219:{22,22}]
  wire  _GEN_6909 = 4'h5 == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5509; // @[StoreQueue.scala 219:{22,22}]
  wire  _GEN_6910 = 4'h6 == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5510; // @[StoreQueue.scala 219:{22,22}]
  wire  _GEN_6911 = 4'h7 == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5511; // @[StoreQueue.scala 219:{22,22}]
  wire  _GEN_6912 = 4'h8 == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5512; // @[StoreQueue.scala 219:{22,22}]
  wire  _GEN_6913 = 4'h9 == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5513; // @[StoreQueue.scala 219:{22,22}]
  wire  _GEN_6914 = 4'ha == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5514; // @[StoreQueue.scala 219:{22,22}]
  wire  _GEN_6915 = 4'hb == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5515; // @[StoreQueue.scala 219:{22,22}]
  wire  _GEN_6916 = 4'h0 == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5516; // @[StoreQueue.scala 220:{24,24}]
  wire  _GEN_6917 = 4'h1 == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5517; // @[StoreQueue.scala 220:{24,24}]
  wire  _GEN_6918 = 4'h2 == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5518; // @[StoreQueue.scala 220:{24,24}]
  wire  _GEN_6919 = 4'h3 == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5519; // @[StoreQueue.scala 220:{24,24}]
  wire  _GEN_6920 = 4'h4 == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5520; // @[StoreQueue.scala 220:{24,24}]
  wire  _GEN_6921 = 4'h5 == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5521; // @[StoreQueue.scala 220:{24,24}]
  wire  _GEN_6922 = 4'h6 == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5522; // @[StoreQueue.scala 220:{24,24}]
  wire  _GEN_6923 = 4'h7 == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5523; // @[StoreQueue.scala 220:{24,24}]
  wire  _GEN_6924 = 4'h8 == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5524; // @[StoreQueue.scala 220:{24,24}]
  wire  _GEN_6925 = 4'h9 == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5525; // @[StoreQueue.scala 220:{24,24}]
  wire  _GEN_6926 = 4'ha == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5526; // @[StoreQueue.scala 220:{24,24}]
  wire  _GEN_6927 = 4'hb == io_enq_req_2_bits_sqIdx_value ? 1'h0 : _GEN_5527; // @[StoreQueue.scala 220:{24,24}]
  wire  _GEN_7204 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_5804 : _GEN_4436; // @[StoreQueue.scala 211:43]
  wire  _GEN_7205 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_5805 : _GEN_4437; // @[StoreQueue.scala 211:43]
  wire  _GEN_7206 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_5806 : _GEN_4438; // @[StoreQueue.scala 211:43]
  wire  _GEN_7207 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_5807 : _GEN_4439; // @[StoreQueue.scala 211:43]
  wire  _GEN_7208 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_5808 : _GEN_4440; // @[StoreQueue.scala 211:43]
  wire  _GEN_7209 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_5809 : _GEN_4441; // @[StoreQueue.scala 211:43]
  wire  _GEN_7210 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_5810 : _GEN_4442; // @[StoreQueue.scala 211:43]
  wire  _GEN_7211 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_5811 : _GEN_4443; // @[StoreQueue.scala 211:43]
  wire  _GEN_7212 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_5812 : _GEN_4444; // @[StoreQueue.scala 211:43]
  wire  _GEN_7213 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_5813 : _GEN_4445; // @[StoreQueue.scala 211:43]
  wire  _GEN_7214 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_5814 : _GEN_4446; // @[StoreQueue.scala 211:43]
  wire  _GEN_7215 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_5815 : _GEN_4447; // @[StoreQueue.scala 211:43]
  wire [6:0] _GEN_7600 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6200 : _GEN_4832; // @[StoreQueue.scala 211:43]
  wire [6:0] _GEN_7601 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6201 : _GEN_4833; // @[StoreQueue.scala 211:43]
  wire [6:0] _GEN_7602 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6202 : _GEN_4834; // @[StoreQueue.scala 211:43]
  wire [6:0] _GEN_7603 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6203 : _GEN_4835; // @[StoreQueue.scala 211:43]
  wire [6:0] _GEN_7604 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6204 : _GEN_4836; // @[StoreQueue.scala 211:43]
  wire [6:0] _GEN_7605 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6205 : _GEN_4837; // @[StoreQueue.scala 211:43]
  wire [6:0] _GEN_7606 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6206 : _GEN_4838; // @[StoreQueue.scala 211:43]
  wire [6:0] _GEN_7607 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6207 : _GEN_4839; // @[StoreQueue.scala 211:43]
  wire [6:0] _GEN_7608 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6208 : _GEN_4840; // @[StoreQueue.scala 211:43]
  wire [6:0] _GEN_7609 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6209 : _GEN_4841; // @[StoreQueue.scala 211:43]
  wire [6:0] _GEN_7610 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6210 : _GEN_4842; // @[StoreQueue.scala 211:43]
  wire [6:0] _GEN_7611 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6211 : _GEN_4843; // @[StoreQueue.scala 211:43]
  wire  _GEN_8020 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6620 : _GEN_5252; // @[StoreQueue.scala 211:43]
  wire  _GEN_8021 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6621 : _GEN_5253; // @[StoreQueue.scala 211:43]
  wire  _GEN_8022 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6622 : _GEN_5254; // @[StoreQueue.scala 211:43]
  wire  _GEN_8023 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6623 : _GEN_5255; // @[StoreQueue.scala 211:43]
  wire  _GEN_8024 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6624 : _GEN_5256; // @[StoreQueue.scala 211:43]
  wire  _GEN_8025 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6625 : _GEN_5257; // @[StoreQueue.scala 211:43]
  wire  _GEN_8026 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6626 : _GEN_5258; // @[StoreQueue.scala 211:43]
  wire  _GEN_8027 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6627 : _GEN_5259; // @[StoreQueue.scala 211:43]
  wire  _GEN_8028 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6628 : _GEN_5260; // @[StoreQueue.scala 211:43]
  wire  _GEN_8029 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6629 : _GEN_5261; // @[StoreQueue.scala 211:43]
  wire  _GEN_8030 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6630 : _GEN_5262; // @[StoreQueue.scala 211:43]
  wire  _GEN_8031 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6631 : _GEN_5263; // @[StoreQueue.scala 211:43]
  wire [4:0] _GEN_8032 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6632 : _GEN_5264; // @[StoreQueue.scala 211:43]
  wire [4:0] _GEN_8033 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6633 : _GEN_5265; // @[StoreQueue.scala 211:43]
  wire [4:0] _GEN_8034 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6634 : _GEN_5266; // @[StoreQueue.scala 211:43]
  wire [4:0] _GEN_8035 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6635 : _GEN_5267; // @[StoreQueue.scala 211:43]
  wire [4:0] _GEN_8036 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6636 : _GEN_5268; // @[StoreQueue.scala 211:43]
  wire [4:0] _GEN_8037 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6637 : _GEN_5269; // @[StoreQueue.scala 211:43]
  wire [4:0] _GEN_8038 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6638 : _GEN_5270; // @[StoreQueue.scala 211:43]
  wire [4:0] _GEN_8039 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6639 : _GEN_5271; // @[StoreQueue.scala 211:43]
  wire [4:0] _GEN_8040 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6640 : _GEN_5272; // @[StoreQueue.scala 211:43]
  wire [4:0] _GEN_8041 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6641 : _GEN_5273; // @[StoreQueue.scala 211:43]
  wire [4:0] _GEN_8042 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6642 : _GEN_5274; // @[StoreQueue.scala 211:43]
  wire [4:0] _GEN_8043 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6643 : _GEN_5275; // @[StoreQueue.scala 211:43]
  wire  _GEN_8224 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6856 : _GEN_5456; // @[StoreQueue.scala 211:43]
  wire  _GEN_8225 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6857 : _GEN_5457; // @[StoreQueue.scala 211:43]
  wire  _GEN_8226 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6858 : _GEN_5458; // @[StoreQueue.scala 211:43]
  wire  _GEN_8227 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6859 : _GEN_5459; // @[StoreQueue.scala 211:43]
  wire  _GEN_8228 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6860 : _GEN_5460; // @[StoreQueue.scala 211:43]
  wire  _GEN_8229 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6861 : _GEN_5461; // @[StoreQueue.scala 211:43]
  wire  _GEN_8230 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6862 : _GEN_5462; // @[StoreQueue.scala 211:43]
  wire  _GEN_8231 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6863 : _GEN_5463; // @[StoreQueue.scala 211:43]
  wire  _GEN_8232 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6864 : _GEN_5464; // @[StoreQueue.scala 211:43]
  wire  _GEN_8233 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6865 : _GEN_5465; // @[StoreQueue.scala 211:43]
  wire  _GEN_8234 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6866 : _GEN_5466; // @[StoreQueue.scala 211:43]
  wire  _GEN_8235 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6867 : _GEN_5467; // @[StoreQueue.scala 211:43]
  wire  _GEN_8236 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6868 : _GEN_5468; // @[StoreQueue.scala 211:43]
  wire  _GEN_8237 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6869 : _GEN_5469; // @[StoreQueue.scala 211:43]
  wire  _GEN_8238 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6870 : _GEN_5470; // @[StoreQueue.scala 211:43]
  wire  _GEN_8239 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6871 : _GEN_5471; // @[StoreQueue.scala 211:43]
  wire  _GEN_8240 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6872 : _GEN_5472; // @[StoreQueue.scala 211:43]
  wire  _GEN_8241 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6873 : _GEN_5473; // @[StoreQueue.scala 211:43]
  wire  _GEN_8242 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6874 : _GEN_5474; // @[StoreQueue.scala 211:43]
  wire  _GEN_8243 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6875 : _GEN_5475; // @[StoreQueue.scala 211:43]
  wire  _GEN_8244 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6876 : _GEN_5476; // @[StoreQueue.scala 211:43]
  wire  _GEN_8245 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6877 : _GEN_5477; // @[StoreQueue.scala 211:43]
  wire  _GEN_8246 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6878 : _GEN_5478; // @[StoreQueue.scala 211:43]
  wire  _GEN_8247 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6879 : _GEN_5479; // @[StoreQueue.scala 211:43]
  wire  _GEN_8248 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6880 : _GEN_5480; // @[StoreQueue.scala 211:43]
  wire  _GEN_8249 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6881 : _GEN_5481; // @[StoreQueue.scala 211:43]
  wire  _GEN_8250 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6882 : _GEN_5482; // @[StoreQueue.scala 211:43]
  wire  _GEN_8251 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6883 : _GEN_5483; // @[StoreQueue.scala 211:43]
  wire  _GEN_8252 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6884 : _GEN_5484; // @[StoreQueue.scala 211:43]
  wire  _GEN_8253 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6885 : _GEN_5485; // @[StoreQueue.scala 211:43]
  wire  _GEN_8254 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6886 : _GEN_5486; // @[StoreQueue.scala 211:43]
  wire  _GEN_8255 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6887 : _GEN_5487; // @[StoreQueue.scala 211:43]
  wire  _GEN_8256 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6888 : _GEN_5488; // @[StoreQueue.scala 211:43]
  wire  _GEN_8257 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6889 : _GEN_5489; // @[StoreQueue.scala 211:43]
  wire  _GEN_8258 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6890 : _GEN_5490; // @[StoreQueue.scala 211:43]
  wire  _GEN_8259 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6891 : _GEN_5491; // @[StoreQueue.scala 211:43]
  wire  _GEN_8260 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6892 : _GEN_5492; // @[StoreQueue.scala 211:43]
  wire  _GEN_8261 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6893 : _GEN_5493; // @[StoreQueue.scala 211:43]
  wire  _GEN_8262 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6894 : _GEN_5494; // @[StoreQueue.scala 211:43]
  wire  _GEN_8263 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6895 : _GEN_5495; // @[StoreQueue.scala 211:43]
  wire  _GEN_8264 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6896 : _GEN_5496; // @[StoreQueue.scala 211:43]
  wire  _GEN_8265 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6897 : _GEN_5497; // @[StoreQueue.scala 211:43]
  wire  _GEN_8266 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6898 : _GEN_5498; // @[StoreQueue.scala 211:43]
  wire  _GEN_8267 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6899 : _GEN_5499; // @[StoreQueue.scala 211:43]
  wire  _GEN_8268 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6900 : _GEN_5500; // @[StoreQueue.scala 211:43]
  wire  _GEN_8269 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6901 : _GEN_5501; // @[StoreQueue.scala 211:43]
  wire  _GEN_8270 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6902 : _GEN_5502; // @[StoreQueue.scala 211:43]
  wire  _GEN_8271 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6903 : _GEN_5503; // @[StoreQueue.scala 211:43]
  wire  _GEN_8272 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6904 : _GEN_5504; // @[StoreQueue.scala 211:43]
  wire  _GEN_8273 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6905 : _GEN_5505; // @[StoreQueue.scala 211:43]
  wire  _GEN_8274 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6906 : _GEN_5506; // @[StoreQueue.scala 211:43]
  wire  _GEN_8275 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6907 : _GEN_5507; // @[StoreQueue.scala 211:43]
  wire  _GEN_8276 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6908 : _GEN_5508; // @[StoreQueue.scala 211:43]
  wire  _GEN_8277 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6909 : _GEN_5509; // @[StoreQueue.scala 211:43]
  wire  _GEN_8278 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6910 : _GEN_5510; // @[StoreQueue.scala 211:43]
  wire  _GEN_8279 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6911 : _GEN_5511; // @[StoreQueue.scala 211:43]
  wire  _GEN_8280 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6912 : _GEN_5512; // @[StoreQueue.scala 211:43]
  wire  _GEN_8281 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6913 : _GEN_5513; // @[StoreQueue.scala 211:43]
  wire  _GEN_8282 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6914 : _GEN_5514; // @[StoreQueue.scala 211:43]
  wire  _GEN_8283 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6915 : _GEN_5515; // @[StoreQueue.scala 211:43]
  wire  _GEN_8284 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6916 : _GEN_5516; // @[StoreQueue.scala 211:43]
  wire  _GEN_8285 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6917 : _GEN_5517; // @[StoreQueue.scala 211:43]
  wire  _GEN_8286 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6918 : _GEN_5518; // @[StoreQueue.scala 211:43]
  wire  _GEN_8287 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6919 : _GEN_5519; // @[StoreQueue.scala 211:43]
  wire  _GEN_8288 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6920 : _GEN_5520; // @[StoreQueue.scala 211:43]
  wire  _GEN_8289 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6921 : _GEN_5521; // @[StoreQueue.scala 211:43]
  wire  _GEN_8290 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6922 : _GEN_5522; // @[StoreQueue.scala 211:43]
  wire  _GEN_8291 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6923 : _GEN_5523; // @[StoreQueue.scala 211:43]
  wire  _GEN_8292 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6924 : _GEN_5524; // @[StoreQueue.scala 211:43]
  wire  _GEN_8293 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6925 : _GEN_5525; // @[StoreQueue.scala 211:43]
  wire  _GEN_8294 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6926 : _GEN_5526; // @[StoreQueue.scala 211:43]
  wire  _GEN_8295 = io_enq_req_2_valid & ~enqCancel_2 ? _GEN_6927 : _GEN_5527; // @[StoreQueue.scala 211:43]
  wire [6:0] _GEN_8968 = 4'h0 == io_enq_req_3_bits_sqIdx_value ? io_enq_req_3_bits_ctrl_fuOpType : _GEN_7600; // @[StoreQueue.scala 212:{18,18}]
  wire [6:0] _GEN_8969 = 4'h1 == io_enq_req_3_bits_sqIdx_value ? io_enq_req_3_bits_ctrl_fuOpType : _GEN_7601; // @[StoreQueue.scala 212:{18,18}]
  wire [6:0] _GEN_8970 = 4'h2 == io_enq_req_3_bits_sqIdx_value ? io_enq_req_3_bits_ctrl_fuOpType : _GEN_7602; // @[StoreQueue.scala 212:{18,18}]
  wire [6:0] _GEN_8971 = 4'h3 == io_enq_req_3_bits_sqIdx_value ? io_enq_req_3_bits_ctrl_fuOpType : _GEN_7603; // @[StoreQueue.scala 212:{18,18}]
  wire [6:0] _GEN_8972 = 4'h4 == io_enq_req_3_bits_sqIdx_value ? io_enq_req_3_bits_ctrl_fuOpType : _GEN_7604; // @[StoreQueue.scala 212:{18,18}]
  wire [6:0] _GEN_8973 = 4'h5 == io_enq_req_3_bits_sqIdx_value ? io_enq_req_3_bits_ctrl_fuOpType : _GEN_7605; // @[StoreQueue.scala 212:{18,18}]
  wire [6:0] _GEN_8974 = 4'h6 == io_enq_req_3_bits_sqIdx_value ? io_enq_req_3_bits_ctrl_fuOpType : _GEN_7606; // @[StoreQueue.scala 212:{18,18}]
  wire [6:0] _GEN_8975 = 4'h7 == io_enq_req_3_bits_sqIdx_value ? io_enq_req_3_bits_ctrl_fuOpType : _GEN_7607; // @[StoreQueue.scala 212:{18,18}]
  wire [6:0] _GEN_8976 = 4'h8 == io_enq_req_3_bits_sqIdx_value ? io_enq_req_3_bits_ctrl_fuOpType : _GEN_7608; // @[StoreQueue.scala 212:{18,18}]
  wire [6:0] _GEN_8977 = 4'h9 == io_enq_req_3_bits_sqIdx_value ? io_enq_req_3_bits_ctrl_fuOpType : _GEN_7609; // @[StoreQueue.scala 212:{18,18}]
  wire [6:0] _GEN_8978 = 4'ha == io_enq_req_3_bits_sqIdx_value ? io_enq_req_3_bits_ctrl_fuOpType : _GEN_7610; // @[StoreQueue.scala 212:{18,18}]
  wire [6:0] _GEN_8979 = 4'hb == io_enq_req_3_bits_sqIdx_value ? io_enq_req_3_bits_ctrl_fuOpType : _GEN_7611; // @[StoreQueue.scala 212:{18,18}]
  wire  _GEN_9624 = 4'h0 == io_enq_req_3_bits_sqIdx_value | _GEN_8224; // @[StoreQueue.scala 215:{24,24}]
  wire  _GEN_9625 = 4'h1 == io_enq_req_3_bits_sqIdx_value | _GEN_8225; // @[StoreQueue.scala 215:{24,24}]
  wire  _GEN_9626 = 4'h2 == io_enq_req_3_bits_sqIdx_value | _GEN_8226; // @[StoreQueue.scala 215:{24,24}]
  wire  _GEN_9627 = 4'h3 == io_enq_req_3_bits_sqIdx_value | _GEN_8227; // @[StoreQueue.scala 215:{24,24}]
  wire  _GEN_9628 = 4'h4 == io_enq_req_3_bits_sqIdx_value | _GEN_8228; // @[StoreQueue.scala 215:{24,24}]
  wire  _GEN_9629 = 4'h5 == io_enq_req_3_bits_sqIdx_value | _GEN_8229; // @[StoreQueue.scala 215:{24,24}]
  wire  _GEN_9630 = 4'h6 == io_enq_req_3_bits_sqIdx_value | _GEN_8230; // @[StoreQueue.scala 215:{24,24}]
  wire  _GEN_9631 = 4'h7 == io_enq_req_3_bits_sqIdx_value | _GEN_8231; // @[StoreQueue.scala 215:{24,24}]
  wire  _GEN_9632 = 4'h8 == io_enq_req_3_bits_sqIdx_value | _GEN_8232; // @[StoreQueue.scala 215:{24,24}]
  wire  _GEN_9633 = 4'h9 == io_enq_req_3_bits_sqIdx_value | _GEN_8233; // @[StoreQueue.scala 215:{24,24}]
  wire  _GEN_9634 = 4'ha == io_enq_req_3_bits_sqIdx_value | _GEN_8234; // @[StoreQueue.scala 215:{24,24}]
  wire  _GEN_9635 = 4'hb == io_enq_req_3_bits_sqIdx_value | _GEN_8235; // @[StoreQueue.scala 215:{24,24}]
  wire  _GEN_9636 = 4'h0 == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8236; // @[StoreQueue.scala 216:{24,24}]
  wire  _GEN_9637 = 4'h1 == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8237; // @[StoreQueue.scala 216:{24,24}]
  wire  _GEN_9638 = 4'h2 == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8238; // @[StoreQueue.scala 216:{24,24}]
  wire  _GEN_9639 = 4'h3 == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8239; // @[StoreQueue.scala 216:{24,24}]
  wire  _GEN_9640 = 4'h4 == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8240; // @[StoreQueue.scala 216:{24,24}]
  wire  _GEN_9641 = 4'h5 == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8241; // @[StoreQueue.scala 216:{24,24}]
  wire  _GEN_9642 = 4'h6 == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8242; // @[StoreQueue.scala 216:{24,24}]
  wire  _GEN_9643 = 4'h7 == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8243; // @[StoreQueue.scala 216:{24,24}]
  wire  _GEN_9644 = 4'h8 == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8244; // @[StoreQueue.scala 216:{24,24}]
  wire  _GEN_9645 = 4'h9 == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8245; // @[StoreQueue.scala 216:{24,24}]
  wire  _GEN_9646 = 4'ha == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8246; // @[StoreQueue.scala 216:{24,24}]
  wire  _GEN_9647 = 4'hb == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8247; // @[StoreQueue.scala 216:{24,24}]
  wire  _GEN_9648 = 4'h0 == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8248; // @[StoreQueue.scala 217:{24,24}]
  wire  _GEN_9649 = 4'h1 == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8249; // @[StoreQueue.scala 217:{24,24}]
  wire  _GEN_9650 = 4'h2 == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8250; // @[StoreQueue.scala 217:{24,24}]
  wire  _GEN_9651 = 4'h3 == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8251; // @[StoreQueue.scala 217:{24,24}]
  wire  _GEN_9652 = 4'h4 == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8252; // @[StoreQueue.scala 217:{24,24}]
  wire  _GEN_9653 = 4'h5 == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8253; // @[StoreQueue.scala 217:{24,24}]
  wire  _GEN_9654 = 4'h6 == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8254; // @[StoreQueue.scala 217:{24,24}]
  wire  _GEN_9655 = 4'h7 == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8255; // @[StoreQueue.scala 217:{24,24}]
  wire  _GEN_9656 = 4'h8 == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8256; // @[StoreQueue.scala 217:{24,24}]
  wire  _GEN_9657 = 4'h9 == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8257; // @[StoreQueue.scala 217:{24,24}]
  wire  _GEN_9658 = 4'ha == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8258; // @[StoreQueue.scala 217:{24,24}]
  wire  _GEN_9659 = 4'hb == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8259; // @[StoreQueue.scala 217:{24,24}]
  wire  _GEN_9660 = 4'h0 == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8260; // @[StoreQueue.scala 218:{24,24}]
  wire  _GEN_9661 = 4'h1 == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8261; // @[StoreQueue.scala 218:{24,24}]
  wire  _GEN_9662 = 4'h2 == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8262; // @[StoreQueue.scala 218:{24,24}]
  wire  _GEN_9663 = 4'h3 == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8263; // @[StoreQueue.scala 218:{24,24}]
  wire  _GEN_9664 = 4'h4 == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8264; // @[StoreQueue.scala 218:{24,24}]
  wire  _GEN_9665 = 4'h5 == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8265; // @[StoreQueue.scala 218:{24,24}]
  wire  _GEN_9666 = 4'h6 == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8266; // @[StoreQueue.scala 218:{24,24}]
  wire  _GEN_9667 = 4'h7 == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8267; // @[StoreQueue.scala 218:{24,24}]
  wire  _GEN_9668 = 4'h8 == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8268; // @[StoreQueue.scala 218:{24,24}]
  wire  _GEN_9669 = 4'h9 == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8269; // @[StoreQueue.scala 218:{24,24}]
  wire  _GEN_9670 = 4'ha == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8270; // @[StoreQueue.scala 218:{24,24}]
  wire  _GEN_9671 = 4'hb == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8271; // @[StoreQueue.scala 218:{24,24}]
  wire  _GEN_9672 = 4'h0 == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8272; // @[StoreQueue.scala 219:{22,22}]
  wire  _GEN_9673 = 4'h1 == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8273; // @[StoreQueue.scala 219:{22,22}]
  wire  _GEN_9674 = 4'h2 == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8274; // @[StoreQueue.scala 219:{22,22}]
  wire  _GEN_9675 = 4'h3 == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8275; // @[StoreQueue.scala 219:{22,22}]
  wire  _GEN_9676 = 4'h4 == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8276; // @[StoreQueue.scala 219:{22,22}]
  wire  _GEN_9677 = 4'h5 == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8277; // @[StoreQueue.scala 219:{22,22}]
  wire  _GEN_9678 = 4'h6 == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8278; // @[StoreQueue.scala 219:{22,22}]
  wire  _GEN_9679 = 4'h7 == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8279; // @[StoreQueue.scala 219:{22,22}]
  wire  _GEN_9680 = 4'h8 == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8280; // @[StoreQueue.scala 219:{22,22}]
  wire  _GEN_9681 = 4'h9 == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8281; // @[StoreQueue.scala 219:{22,22}]
  wire  _GEN_9682 = 4'ha == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8282; // @[StoreQueue.scala 219:{22,22}]
  wire  _GEN_9683 = 4'hb == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8283; // @[StoreQueue.scala 219:{22,22}]
  wire  _GEN_9684 = 4'h0 == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8284; // @[StoreQueue.scala 220:{24,24}]
  wire  _GEN_9685 = 4'h1 == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8285; // @[StoreQueue.scala 220:{24,24}]
  wire  _GEN_9686 = 4'h2 == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8286; // @[StoreQueue.scala 220:{24,24}]
  wire  _GEN_9687 = 4'h3 == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8287; // @[StoreQueue.scala 220:{24,24}]
  wire  _GEN_9688 = 4'h4 == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8288; // @[StoreQueue.scala 220:{24,24}]
  wire  _GEN_9689 = 4'h5 == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8289; // @[StoreQueue.scala 220:{24,24}]
  wire  _GEN_9690 = 4'h6 == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8290; // @[StoreQueue.scala 220:{24,24}]
  wire  _GEN_9691 = 4'h7 == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8291; // @[StoreQueue.scala 220:{24,24}]
  wire  _GEN_9692 = 4'h8 == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8292; // @[StoreQueue.scala 220:{24,24}]
  wire  _GEN_9693 = 4'h9 == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8293; // @[StoreQueue.scala 220:{24,24}]
  wire  _GEN_9694 = 4'ha == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8294; // @[StoreQueue.scala 220:{24,24}]
  wire  _GEN_9695 = 4'hb == io_enq_req_3_bits_sqIdx_value ? 1'h0 : _GEN_8295; // @[StoreQueue.scala 220:{24,24}]
  wire [6:0] _GEN_10368 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_8968 : _GEN_7600; // @[StoreQueue.scala 211:43]
  wire [6:0] _GEN_10369 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_8969 : _GEN_7601; // @[StoreQueue.scala 211:43]
  wire [6:0] _GEN_10370 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_8970 : _GEN_7602; // @[StoreQueue.scala 211:43]
  wire [6:0] _GEN_10371 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_8971 : _GEN_7603; // @[StoreQueue.scala 211:43]
  wire [6:0] _GEN_10372 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_8972 : _GEN_7604; // @[StoreQueue.scala 211:43]
  wire [6:0] _GEN_10373 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_8973 : _GEN_7605; // @[StoreQueue.scala 211:43]
  wire [6:0] _GEN_10374 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_8974 : _GEN_7606; // @[StoreQueue.scala 211:43]
  wire [6:0] _GEN_10375 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_8975 : _GEN_7607; // @[StoreQueue.scala 211:43]
  wire [6:0] _GEN_10376 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_8976 : _GEN_7608; // @[StoreQueue.scala 211:43]
  wire [6:0] _GEN_10377 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_8977 : _GEN_7609; // @[StoreQueue.scala 211:43]
  wire [6:0] _GEN_10378 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_8978 : _GEN_7610; // @[StoreQueue.scala 211:43]
  wire [6:0] _GEN_10379 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_8979 : _GEN_7611; // @[StoreQueue.scala 211:43]
  wire  _GEN_10992 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9624 : _GEN_8224; // @[StoreQueue.scala 211:43]
  wire  _GEN_10993 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9625 : _GEN_8225; // @[StoreQueue.scala 211:43]
  wire  _GEN_10994 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9626 : _GEN_8226; // @[StoreQueue.scala 211:43]
  wire  _GEN_10995 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9627 : _GEN_8227; // @[StoreQueue.scala 211:43]
  wire  _GEN_10996 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9628 : _GEN_8228; // @[StoreQueue.scala 211:43]
  wire  _GEN_10997 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9629 : _GEN_8229; // @[StoreQueue.scala 211:43]
  wire  _GEN_10998 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9630 : _GEN_8230; // @[StoreQueue.scala 211:43]
  wire  _GEN_10999 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9631 : _GEN_8231; // @[StoreQueue.scala 211:43]
  wire  _GEN_11000 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9632 : _GEN_8232; // @[StoreQueue.scala 211:43]
  wire  _GEN_11001 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9633 : _GEN_8233; // @[StoreQueue.scala 211:43]
  wire  _GEN_11002 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9634 : _GEN_8234; // @[StoreQueue.scala 211:43]
  wire  _GEN_11003 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9635 : _GEN_8235; // @[StoreQueue.scala 211:43]
  wire  _GEN_11004 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9636 : _GEN_8236; // @[StoreQueue.scala 211:43]
  wire  _GEN_11005 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9637 : _GEN_8237; // @[StoreQueue.scala 211:43]
  wire  _GEN_11006 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9638 : _GEN_8238; // @[StoreQueue.scala 211:43]
  wire  _GEN_11007 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9639 : _GEN_8239; // @[StoreQueue.scala 211:43]
  wire  _GEN_11008 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9640 : _GEN_8240; // @[StoreQueue.scala 211:43]
  wire  _GEN_11009 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9641 : _GEN_8241; // @[StoreQueue.scala 211:43]
  wire  _GEN_11010 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9642 : _GEN_8242; // @[StoreQueue.scala 211:43]
  wire  _GEN_11011 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9643 : _GEN_8243; // @[StoreQueue.scala 211:43]
  wire  _GEN_11012 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9644 : _GEN_8244; // @[StoreQueue.scala 211:43]
  wire  _GEN_11013 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9645 : _GEN_8245; // @[StoreQueue.scala 211:43]
  wire  _GEN_11014 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9646 : _GEN_8246; // @[StoreQueue.scala 211:43]
  wire  _GEN_11015 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9647 : _GEN_8247; // @[StoreQueue.scala 211:43]
  wire  _GEN_11016 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9648 : _GEN_8248; // @[StoreQueue.scala 211:43]
  wire  _GEN_11017 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9649 : _GEN_8249; // @[StoreQueue.scala 211:43]
  wire  _GEN_11018 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9650 : _GEN_8250; // @[StoreQueue.scala 211:43]
  wire  _GEN_11019 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9651 : _GEN_8251; // @[StoreQueue.scala 211:43]
  wire  _GEN_11020 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9652 : _GEN_8252; // @[StoreQueue.scala 211:43]
  wire  _GEN_11021 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9653 : _GEN_8253; // @[StoreQueue.scala 211:43]
  wire  _GEN_11022 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9654 : _GEN_8254; // @[StoreQueue.scala 211:43]
  wire  _GEN_11023 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9655 : _GEN_8255; // @[StoreQueue.scala 211:43]
  wire  _GEN_11024 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9656 : _GEN_8256; // @[StoreQueue.scala 211:43]
  wire  _GEN_11025 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9657 : _GEN_8257; // @[StoreQueue.scala 211:43]
  wire  _GEN_11026 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9658 : _GEN_8258; // @[StoreQueue.scala 211:43]
  wire  _GEN_11027 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9659 : _GEN_8259; // @[StoreQueue.scala 211:43]
  wire  _GEN_11028 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9660 : _GEN_8260; // @[StoreQueue.scala 211:43]
  wire  _GEN_11029 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9661 : _GEN_8261; // @[StoreQueue.scala 211:43]
  wire  _GEN_11030 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9662 : _GEN_8262; // @[StoreQueue.scala 211:43]
  wire  _GEN_11031 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9663 : _GEN_8263; // @[StoreQueue.scala 211:43]
  wire  _GEN_11032 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9664 : _GEN_8264; // @[StoreQueue.scala 211:43]
  wire  _GEN_11033 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9665 : _GEN_8265; // @[StoreQueue.scala 211:43]
  wire  _GEN_11034 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9666 : _GEN_8266; // @[StoreQueue.scala 211:43]
  wire  _GEN_11035 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9667 : _GEN_8267; // @[StoreQueue.scala 211:43]
  wire  _GEN_11036 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9668 : _GEN_8268; // @[StoreQueue.scala 211:43]
  wire  _GEN_11037 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9669 : _GEN_8269; // @[StoreQueue.scala 211:43]
  wire  _GEN_11038 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9670 : _GEN_8270; // @[StoreQueue.scala 211:43]
  wire  _GEN_11039 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9671 : _GEN_8271; // @[StoreQueue.scala 211:43]
  wire  _GEN_11040 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9672 : _GEN_8272; // @[StoreQueue.scala 211:43]
  wire  _GEN_11041 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9673 : _GEN_8273; // @[StoreQueue.scala 211:43]
  wire  _GEN_11042 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9674 : _GEN_8274; // @[StoreQueue.scala 211:43]
  wire  _GEN_11043 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9675 : _GEN_8275; // @[StoreQueue.scala 211:43]
  wire  _GEN_11044 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9676 : _GEN_8276; // @[StoreQueue.scala 211:43]
  wire  _GEN_11045 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9677 : _GEN_8277; // @[StoreQueue.scala 211:43]
  wire  _GEN_11046 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9678 : _GEN_8278; // @[StoreQueue.scala 211:43]
  wire  _GEN_11047 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9679 : _GEN_8279; // @[StoreQueue.scala 211:43]
  wire  _GEN_11048 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9680 : _GEN_8280; // @[StoreQueue.scala 211:43]
  wire  _GEN_11049 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9681 : _GEN_8281; // @[StoreQueue.scala 211:43]
  wire  _GEN_11050 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9682 : _GEN_8282; // @[StoreQueue.scala 211:43]
  wire  _GEN_11051 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9683 : _GEN_8283; // @[StoreQueue.scala 211:43]
  wire  _GEN_11052 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9684 : _GEN_8284; // @[StoreQueue.scala 211:43]
  wire  _GEN_11053 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9685 : _GEN_8285; // @[StoreQueue.scala 211:43]
  wire  _GEN_11054 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9686 : _GEN_8286; // @[StoreQueue.scala 211:43]
  wire  _GEN_11055 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9687 : _GEN_8287; // @[StoreQueue.scala 211:43]
  wire  _GEN_11056 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9688 : _GEN_8288; // @[StoreQueue.scala 211:43]
  wire  _GEN_11057 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9689 : _GEN_8289; // @[StoreQueue.scala 211:43]
  wire  _GEN_11058 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9690 : _GEN_8290; // @[StoreQueue.scala 211:43]
  wire  _GEN_11059 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9691 : _GEN_8291; // @[StoreQueue.scala 211:43]
  wire  _GEN_11060 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9692 : _GEN_8292; // @[StoreQueue.scala 211:43]
  wire  _GEN_11061 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9693 : _GEN_8293; // @[StoreQueue.scala 211:43]
  wire  _GEN_11062 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9694 : _GEN_8294; // @[StoreQueue.scala 211:43]
  wire  _GEN_11063 = io_enq_req_3_valid & ~enqCancel_3 ? _GEN_9695 : _GEN_8295; // @[StoreQueue.scala 211:43]
  wire [4:0] addrReadyLookupVec_new_value = {{1'd0}, addrReadyPtrExt_value}; // @[CircularQueuePtr.scala 41:34]
  wire [5:0] _addrReadyLookupVec_diff_T_1 = {1'h0,addrReadyLookupVec_new_value}; // @[CircularQueuePtr.scala 42:49]
  wire [5:0] addrReadyLookupVec_diff = $signed(_addrReadyLookupVec_diff_T_1) - 6'shc; // @[CircularQueuePtr.scala 42:52]
  wire  addrReadyLookupVec_reverse_flag = $signed(addrReadyLookupVec_diff) >= 6'sh0; // @[CircularQueuePtr.scala 43:31]
  wire  addrReadyLookupVec_0_flag = addrReadyLookupVec_reverse_flag ? ~addrReadyPtrExt_flag : addrReadyPtrExt_flag; // @[CircularQueuePtr.scala 44:26]
  wire [5:0] _addrReadyLookupVec_new_ptr_value_T = $signed(_addrReadyLookupVec_diff_T_1) - 6'shc; // @[CircularQueuePtr.scala 46:20]
  wire [5:0] _addrReadyLookupVec_new_ptr_value_T_1 = addrReadyLookupVec_reverse_flag ?
    _addrReadyLookupVec_new_ptr_value_T : {{1'd0}, addrReadyLookupVec_new_value}; // @[CircularQueuePtr.scala 45:27]
  wire [4:0] addrReadyLookupVec_new_value_1 = addrReadyPtrExt_value + 4'h1; // @[CircularQueuePtr.scala 41:34]
  wire [5:0] _addrReadyLookupVec_diff_T_7 = {1'h0,addrReadyLookupVec_new_value_1}; // @[CircularQueuePtr.scala 42:49]
  wire [5:0] addrReadyLookupVec_diff_1 = $signed(_addrReadyLookupVec_diff_T_7) - 6'shc; // @[CircularQueuePtr.scala 42:52]
  wire  addrReadyLookupVec_reverse_flag_1 = $signed(addrReadyLookupVec_diff_1) >= 6'sh0; // @[CircularQueuePtr.scala 43:31]
  wire  addrReadyLookupVec_1_flag = addrReadyLookupVec_reverse_flag_1 ? ~addrReadyPtrExt_flag : addrReadyPtrExt_flag; // @[CircularQueuePtr.scala 44:26]
  wire [5:0] _addrReadyLookupVec_new_ptr_value_T_2 = $signed(_addrReadyLookupVec_diff_T_7) - 6'shc; // @[CircularQueuePtr.scala 46:20]
  wire [5:0] _addrReadyLookupVec_new_ptr_value_T_3 = addrReadyLookupVec_reverse_flag_1 ?
    _addrReadyLookupVec_new_ptr_value_T_2 : {{1'd0}, addrReadyLookupVec_new_value_1}; // @[CircularQueuePtr.scala 45:27]
  wire [4:0] addrReadyLookupVec_new_value_2 = addrReadyPtrExt_value + 4'h2; // @[CircularQueuePtr.scala 41:34]
  wire [5:0] _addrReadyLookupVec_diff_T_13 = {1'h0,addrReadyLookupVec_new_value_2}; // @[CircularQueuePtr.scala 42:49]
  wire [5:0] addrReadyLookupVec_diff_2 = $signed(_addrReadyLookupVec_diff_T_13) - 6'shc; // @[CircularQueuePtr.scala 42:52]
  wire  addrReadyLookupVec_reverse_flag_2 = $signed(addrReadyLookupVec_diff_2) >= 6'sh0; // @[CircularQueuePtr.scala 43:31]
  wire  addrReadyLookupVec_2_flag = addrReadyLookupVec_reverse_flag_2 ? ~addrReadyPtrExt_flag : addrReadyPtrExt_flag; // @[CircularQueuePtr.scala 44:26]
  wire [5:0] _addrReadyLookupVec_new_ptr_value_T_4 = $signed(_addrReadyLookupVec_diff_T_13) - 6'shc; // @[CircularQueuePtr.scala 46:20]
  wire [5:0] _addrReadyLookupVec_new_ptr_value_T_5 = addrReadyLookupVec_reverse_flag_2 ?
    _addrReadyLookupVec_new_ptr_value_T_4 : {{1'd0}, addrReadyLookupVec_new_value_2}; // @[CircularQueuePtr.scala 45:27]
  wire [4:0] addrReadyLookupVec_new_value_3 = addrReadyPtrExt_value + 4'h3; // @[CircularQueuePtr.scala 41:34]
  wire [5:0] _addrReadyLookupVec_diff_T_19 = {1'h0,addrReadyLookupVec_new_value_3}; // @[CircularQueuePtr.scala 42:49]
  wire [5:0] addrReadyLookupVec_diff_3 = $signed(_addrReadyLookupVec_diff_T_19) - 6'shc; // @[CircularQueuePtr.scala 42:52]
  wire  addrReadyLookupVec_reverse_flag_3 = $signed(addrReadyLookupVec_diff_3) >= 6'sh0; // @[CircularQueuePtr.scala 43:31]
  wire  addrReadyLookupVec_3_flag = addrReadyLookupVec_reverse_flag_3 ? ~addrReadyPtrExt_flag : addrReadyPtrExt_flag; // @[CircularQueuePtr.scala 44:26]
  wire [5:0] _addrReadyLookupVec_new_ptr_value_T_6 = $signed(_addrReadyLookupVec_diff_T_19) - 6'shc; // @[CircularQueuePtr.scala 46:20]
  wire [5:0] _addrReadyLookupVec_new_ptr_value_T_7 = addrReadyLookupVec_reverse_flag_3 ?
    _addrReadyLookupVec_new_ptr_value_T_6 : {{1'd0}, addrReadyLookupVec_new_value_3}; // @[CircularQueuePtr.scala 45:27]
  wire [3:0] addrReadyLookupVec_0_value = _addrReadyLookupVec_new_ptr_value_T_1[3:0]; // @[CircularQueuePtr.scala 37:23 45:21]
  wire  _GEN_11065 = 4'h1 == addrReadyLookupVec_0_value ? allocated_1 : allocated_0; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11066 = 4'h2 == addrReadyLookupVec_0_value ? allocated_2 : _GEN_11065; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11067 = 4'h3 == addrReadyLookupVec_0_value ? allocated_3 : _GEN_11066; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11068 = 4'h4 == addrReadyLookupVec_0_value ? allocated_4 : _GEN_11067; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11069 = 4'h5 == addrReadyLookupVec_0_value ? allocated_5 : _GEN_11068; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11070 = 4'h6 == addrReadyLookupVec_0_value ? allocated_6 : _GEN_11069; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11071 = 4'h7 == addrReadyLookupVec_0_value ? allocated_7 : _GEN_11070; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11072 = 4'h8 == addrReadyLookupVec_0_value ? allocated_8 : _GEN_11071; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11073 = 4'h9 == addrReadyLookupVec_0_value ? allocated_9 : _GEN_11072; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11074 = 4'ha == addrReadyLookupVec_0_value ? allocated_10 : _GEN_11073; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11075 = 4'hb == addrReadyLookupVec_0_value ? allocated_11 : _GEN_11074; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11077 = 4'h1 == addrReadyLookupVec_0_value ? addrvalid_1 : addrvalid_0; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11078 = 4'h2 == addrReadyLookupVec_0_value ? addrvalid_2 : _GEN_11077; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11079 = 4'h3 == addrReadyLookupVec_0_value ? addrvalid_3 : _GEN_11078; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11080 = 4'h4 == addrReadyLookupVec_0_value ? addrvalid_4 : _GEN_11079; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11081 = 4'h5 == addrReadyLookupVec_0_value ? addrvalid_5 : _GEN_11080; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11082 = 4'h6 == addrReadyLookupVec_0_value ? addrvalid_6 : _GEN_11081; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11083 = 4'h7 == addrReadyLookupVec_0_value ? addrvalid_7 : _GEN_11082; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11084 = 4'h8 == addrReadyLookupVec_0_value ? addrvalid_8 : _GEN_11083; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11085 = 4'h9 == addrReadyLookupVec_0_value ? addrvalid_9 : _GEN_11084; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11086 = 4'ha == addrReadyLookupVec_0_value ? addrvalid_10 : _GEN_11085; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11087 = 4'hb == addrReadyLookupVec_0_value ? addrvalid_11 : _GEN_11086; // @[StoreQueue.scala 237:{76,76}]
  wire [4:0] _addrReadyLookup_T_1 = {addrReadyLookupVec_0_flag,addrReadyLookupVec_0_value}; // @[CircularQueuePtr.scala 63:50]
  wire [4:0] _addrReadyLookup_T_2 = {enqPtrExt_0_flag,enqPtrExt_0_value}; // @[CircularQueuePtr.scala 63:70]
  wire  _addrReadyLookup_T_3 = _addrReadyLookup_T_1 != _addrReadyLookup_T_2; // @[CircularQueuePtr.scala 63:52]
  wire  addrReadyLookup_0 = _GEN_11075 & _GEN_11087 & _addrReadyLookup_T_3; // @[StoreQueue.scala 237:100]
  wire [3:0] addrReadyLookupVec_1_value = _addrReadyLookupVec_new_ptr_value_T_3[3:0]; // @[CircularQueuePtr.scala 37:23 45:21]
  wire  _GEN_11089 = 4'h1 == addrReadyLookupVec_1_value ? allocated_1 : allocated_0; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11090 = 4'h2 == addrReadyLookupVec_1_value ? allocated_2 : _GEN_11089; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11091 = 4'h3 == addrReadyLookupVec_1_value ? allocated_3 : _GEN_11090; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11092 = 4'h4 == addrReadyLookupVec_1_value ? allocated_4 : _GEN_11091; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11093 = 4'h5 == addrReadyLookupVec_1_value ? allocated_5 : _GEN_11092; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11094 = 4'h6 == addrReadyLookupVec_1_value ? allocated_6 : _GEN_11093; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11095 = 4'h7 == addrReadyLookupVec_1_value ? allocated_7 : _GEN_11094; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11096 = 4'h8 == addrReadyLookupVec_1_value ? allocated_8 : _GEN_11095; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11097 = 4'h9 == addrReadyLookupVec_1_value ? allocated_9 : _GEN_11096; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11098 = 4'ha == addrReadyLookupVec_1_value ? allocated_10 : _GEN_11097; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11099 = 4'hb == addrReadyLookupVec_1_value ? allocated_11 : _GEN_11098; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11101 = 4'h1 == addrReadyLookupVec_1_value ? addrvalid_1 : addrvalid_0; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11102 = 4'h2 == addrReadyLookupVec_1_value ? addrvalid_2 : _GEN_11101; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11103 = 4'h3 == addrReadyLookupVec_1_value ? addrvalid_3 : _GEN_11102; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11104 = 4'h4 == addrReadyLookupVec_1_value ? addrvalid_4 : _GEN_11103; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11105 = 4'h5 == addrReadyLookupVec_1_value ? addrvalid_5 : _GEN_11104; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11106 = 4'h6 == addrReadyLookupVec_1_value ? addrvalid_6 : _GEN_11105; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11107 = 4'h7 == addrReadyLookupVec_1_value ? addrvalid_7 : _GEN_11106; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11108 = 4'h8 == addrReadyLookupVec_1_value ? addrvalid_8 : _GEN_11107; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11109 = 4'h9 == addrReadyLookupVec_1_value ? addrvalid_9 : _GEN_11108; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11110 = 4'ha == addrReadyLookupVec_1_value ? addrvalid_10 : _GEN_11109; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11111 = 4'hb == addrReadyLookupVec_1_value ? addrvalid_11 : _GEN_11110; // @[StoreQueue.scala 237:{76,76}]
  wire [4:0] _addrReadyLookup_T_5 = {addrReadyLookupVec_1_flag,addrReadyLookupVec_1_value}; // @[CircularQueuePtr.scala 63:50]
  wire  _addrReadyLookup_T_7 = _addrReadyLookup_T_5 != _addrReadyLookup_T_2; // @[CircularQueuePtr.scala 63:52]
  wire  addrReadyLookup_1 = _GEN_11099 & _GEN_11111 & _addrReadyLookup_T_7; // @[StoreQueue.scala 237:100]
  wire [3:0] addrReadyLookupVec_2_value = _addrReadyLookupVec_new_ptr_value_T_5[3:0]; // @[CircularQueuePtr.scala 37:23 45:21]
  wire  _GEN_11113 = 4'h1 == addrReadyLookupVec_2_value ? allocated_1 : allocated_0; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11114 = 4'h2 == addrReadyLookupVec_2_value ? allocated_2 : _GEN_11113; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11115 = 4'h3 == addrReadyLookupVec_2_value ? allocated_3 : _GEN_11114; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11116 = 4'h4 == addrReadyLookupVec_2_value ? allocated_4 : _GEN_11115; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11117 = 4'h5 == addrReadyLookupVec_2_value ? allocated_5 : _GEN_11116; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11118 = 4'h6 == addrReadyLookupVec_2_value ? allocated_6 : _GEN_11117; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11119 = 4'h7 == addrReadyLookupVec_2_value ? allocated_7 : _GEN_11118; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11120 = 4'h8 == addrReadyLookupVec_2_value ? allocated_8 : _GEN_11119; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11121 = 4'h9 == addrReadyLookupVec_2_value ? allocated_9 : _GEN_11120; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11122 = 4'ha == addrReadyLookupVec_2_value ? allocated_10 : _GEN_11121; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11123 = 4'hb == addrReadyLookupVec_2_value ? allocated_11 : _GEN_11122; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11125 = 4'h1 == addrReadyLookupVec_2_value ? addrvalid_1 : addrvalid_0; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11126 = 4'h2 == addrReadyLookupVec_2_value ? addrvalid_2 : _GEN_11125; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11127 = 4'h3 == addrReadyLookupVec_2_value ? addrvalid_3 : _GEN_11126; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11128 = 4'h4 == addrReadyLookupVec_2_value ? addrvalid_4 : _GEN_11127; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11129 = 4'h5 == addrReadyLookupVec_2_value ? addrvalid_5 : _GEN_11128; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11130 = 4'h6 == addrReadyLookupVec_2_value ? addrvalid_6 : _GEN_11129; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11131 = 4'h7 == addrReadyLookupVec_2_value ? addrvalid_7 : _GEN_11130; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11132 = 4'h8 == addrReadyLookupVec_2_value ? addrvalid_8 : _GEN_11131; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11133 = 4'h9 == addrReadyLookupVec_2_value ? addrvalid_9 : _GEN_11132; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11134 = 4'ha == addrReadyLookupVec_2_value ? addrvalid_10 : _GEN_11133; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11135 = 4'hb == addrReadyLookupVec_2_value ? addrvalid_11 : _GEN_11134; // @[StoreQueue.scala 237:{76,76}]
  wire [4:0] _addrReadyLookup_T_9 = {addrReadyLookupVec_2_flag,addrReadyLookupVec_2_value}; // @[CircularQueuePtr.scala 63:50]
  wire  _addrReadyLookup_T_11 = _addrReadyLookup_T_9 != _addrReadyLookup_T_2; // @[CircularQueuePtr.scala 63:52]
  wire  addrReadyLookup_2 = _GEN_11123 & _GEN_11135 & _addrReadyLookup_T_11; // @[StoreQueue.scala 237:100]
  wire [3:0] addrReadyLookupVec_3_value = _addrReadyLookupVec_new_ptr_value_T_7[3:0]; // @[CircularQueuePtr.scala 37:23 45:21]
  wire  _GEN_11137 = 4'h1 == addrReadyLookupVec_3_value ? allocated_1 : allocated_0; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11138 = 4'h2 == addrReadyLookupVec_3_value ? allocated_2 : _GEN_11137; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11139 = 4'h3 == addrReadyLookupVec_3_value ? allocated_3 : _GEN_11138; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11140 = 4'h4 == addrReadyLookupVec_3_value ? allocated_4 : _GEN_11139; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11141 = 4'h5 == addrReadyLookupVec_3_value ? allocated_5 : _GEN_11140; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11142 = 4'h6 == addrReadyLookupVec_3_value ? allocated_6 : _GEN_11141; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11143 = 4'h7 == addrReadyLookupVec_3_value ? allocated_7 : _GEN_11142; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11144 = 4'h8 == addrReadyLookupVec_3_value ? allocated_8 : _GEN_11143; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11145 = 4'h9 == addrReadyLookupVec_3_value ? allocated_9 : _GEN_11144; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11146 = 4'ha == addrReadyLookupVec_3_value ? allocated_10 : _GEN_11145; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11147 = 4'hb == addrReadyLookupVec_3_value ? allocated_11 : _GEN_11146; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11149 = 4'h1 == addrReadyLookupVec_3_value ? addrvalid_1 : addrvalid_0; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11150 = 4'h2 == addrReadyLookupVec_3_value ? addrvalid_2 : _GEN_11149; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11151 = 4'h3 == addrReadyLookupVec_3_value ? addrvalid_3 : _GEN_11150; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11152 = 4'h4 == addrReadyLookupVec_3_value ? addrvalid_4 : _GEN_11151; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11153 = 4'h5 == addrReadyLookupVec_3_value ? addrvalid_5 : _GEN_11152; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11154 = 4'h6 == addrReadyLookupVec_3_value ? addrvalid_6 : _GEN_11153; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11155 = 4'h7 == addrReadyLookupVec_3_value ? addrvalid_7 : _GEN_11154; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11156 = 4'h8 == addrReadyLookupVec_3_value ? addrvalid_8 : _GEN_11155; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11157 = 4'h9 == addrReadyLookupVec_3_value ? addrvalid_9 : _GEN_11156; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11158 = 4'ha == addrReadyLookupVec_3_value ? addrvalid_10 : _GEN_11157; // @[StoreQueue.scala 237:{76,76}]
  wire  _GEN_11159 = 4'hb == addrReadyLookupVec_3_value ? addrvalid_11 : _GEN_11158; // @[StoreQueue.scala 237:{76,76}]
  wire [4:0] _addrReadyLookup_T_13 = {addrReadyLookupVec_3_flag,addrReadyLookupVec_3_value}; // @[CircularQueuePtr.scala 63:50]
  wire  _addrReadyLookup_T_15 = _addrReadyLookup_T_13 != _addrReadyLookup_T_2; // @[CircularQueuePtr.scala 63:52]
  wire  addrReadyLookup_3 = _GEN_11147 & _GEN_11159 & _addrReadyLookup_T_15; // @[StoreQueue.scala 237:100]
  wire  _nextAddrReadyPtr_T = ~addrReadyLookup_0; // @[StoreQueue.scala 238:88]
  wire  _nextAddrReadyPtr_T_1 = ~addrReadyLookup_1; // @[StoreQueue.scala 238:88]
  wire  _nextAddrReadyPtr_T_2 = ~addrReadyLookup_2; // @[StoreQueue.scala 238:88]
  wire  _nextAddrReadyPtr_T_3 = ~addrReadyLookup_3; // @[StoreQueue.scala 238:88]
  wire [2:0] _nextAddrReadyPtr_T_4 = _nextAddrReadyPtr_T_3 ? 3'h3 : 3'h4; // @[Mux.scala 47:70]
  wire [2:0] _nextAddrReadyPtr_T_5 = _nextAddrReadyPtr_T_2 ? 3'h2 : _nextAddrReadyPtr_T_4; // @[Mux.scala 47:70]
  wire [2:0] _nextAddrReadyPtr_T_6 = _nextAddrReadyPtr_T_1 ? 3'h1 : _nextAddrReadyPtr_T_5; // @[Mux.scala 47:70]
  wire [2:0] _nextAddrReadyPtr_T_7 = _nextAddrReadyPtr_T ? 3'h0 : _nextAddrReadyPtr_T_6; // @[Mux.scala 47:70]
  wire [3:0] _GEN_15618 = {{1'd0}, _nextAddrReadyPtr_T_7}; // @[CircularQueuePtr.scala 41:34]
  wire [4:0] nextAddrReadyPtr_new_value = addrReadyPtrExt_value + _GEN_15618; // @[CircularQueuePtr.scala 41:34]
  wire [5:0] _nextAddrReadyPtr_diff_T_1 = {1'h0,nextAddrReadyPtr_new_value}; // @[CircularQueuePtr.scala 42:49]
  wire [5:0] nextAddrReadyPtr_diff = $signed(_nextAddrReadyPtr_diff_T_1) - 6'shc; // @[CircularQueuePtr.scala 42:52]
  wire  nextAddrReadyPtr_reverse_flag = $signed(nextAddrReadyPtr_diff) >= 6'sh0; // @[CircularQueuePtr.scala 43:31]
  wire [5:0] _nextAddrReadyPtr_new_ptr_value_T = $signed(_nextAddrReadyPtr_diff_T_1) - 6'shc; // @[CircularQueuePtr.scala 46:20]
  wire [5:0] _nextAddrReadyPtr_new_ptr_value_T_1 = nextAddrReadyPtr_reverse_flag ? _nextAddrReadyPtr_new_ptr_value_T :
    {{1'd0}, nextAddrReadyPtr_new_value}; // @[CircularQueuePtr.scala 45:27]
  wire  addrReadyPtrExt_differentFlag = cmtPtrExt_0_flag ^ deqPtrExt_0_flag; // @[CircularQueuePtr.scala 86:35]
  wire  addrReadyPtrExt_compare = cmtPtrExt_0_value > deqPtrExt_0_value; // @[CircularQueuePtr.scala 87:30]
  wire  _addrReadyPtrExt_T = addrReadyPtrExt_differentFlag ^ addrReadyPtrExt_compare; // @[CircularQueuePtr.scala 88:19]
  wire [3:0] nextAddrReadyPtr_value = _nextAddrReadyPtr_new_ptr_value_T_1[3:0]; // @[CircularQueuePtr.scala 37:23 45:21]
  wire [4:0] dataReadyLookupVec_new_value = {{1'd0}, dataReadyPtrExt_value}; // @[CircularQueuePtr.scala 41:34]
  wire [5:0] _dataReadyLookupVec_diff_T_1 = {1'h0,dataReadyLookupVec_new_value}; // @[CircularQueuePtr.scala 42:49]
  wire [5:0] dataReadyLookupVec_diff = $signed(_dataReadyLookupVec_diff_T_1) - 6'shc; // @[CircularQueuePtr.scala 42:52]
  wire  dataReadyLookupVec_reverse_flag = $signed(dataReadyLookupVec_diff) >= 6'sh0; // @[CircularQueuePtr.scala 43:31]
  wire  dataReadyLookupVec_0_flag = dataReadyLookupVec_reverse_flag ? ~dataReadyPtrExt_flag : dataReadyPtrExt_flag; // @[CircularQueuePtr.scala 44:26]
  wire [5:0] _dataReadyLookupVec_new_ptr_value_T = $signed(_dataReadyLookupVec_diff_T_1) - 6'shc; // @[CircularQueuePtr.scala 46:20]
  wire [5:0] _dataReadyLookupVec_new_ptr_value_T_1 = dataReadyLookupVec_reverse_flag ?
    _dataReadyLookupVec_new_ptr_value_T : {{1'd0}, dataReadyLookupVec_new_value}; // @[CircularQueuePtr.scala 45:27]
  wire [4:0] dataReadyLookupVec_new_value_1 = dataReadyPtrExt_value + 4'h1; // @[CircularQueuePtr.scala 41:34]
  wire [5:0] _dataReadyLookupVec_diff_T_7 = {1'h0,dataReadyLookupVec_new_value_1}; // @[CircularQueuePtr.scala 42:49]
  wire [5:0] dataReadyLookupVec_diff_1 = $signed(_dataReadyLookupVec_diff_T_7) - 6'shc; // @[CircularQueuePtr.scala 42:52]
  wire  dataReadyLookupVec_reverse_flag_1 = $signed(dataReadyLookupVec_diff_1) >= 6'sh0; // @[CircularQueuePtr.scala 43:31]
  wire  dataReadyLookupVec_1_flag = dataReadyLookupVec_reverse_flag_1 ? ~dataReadyPtrExt_flag : dataReadyPtrExt_flag; // @[CircularQueuePtr.scala 44:26]
  wire [5:0] _dataReadyLookupVec_new_ptr_value_T_2 = $signed(_dataReadyLookupVec_diff_T_7) - 6'shc; // @[CircularQueuePtr.scala 46:20]
  wire [5:0] _dataReadyLookupVec_new_ptr_value_T_3 = dataReadyLookupVec_reverse_flag_1 ?
    _dataReadyLookupVec_new_ptr_value_T_2 : {{1'd0}, dataReadyLookupVec_new_value_1}; // @[CircularQueuePtr.scala 45:27]
  wire [4:0] dataReadyLookupVec_new_value_2 = dataReadyPtrExt_value + 4'h2; // @[CircularQueuePtr.scala 41:34]
  wire [5:0] _dataReadyLookupVec_diff_T_13 = {1'h0,dataReadyLookupVec_new_value_2}; // @[CircularQueuePtr.scala 42:49]
  wire [5:0] dataReadyLookupVec_diff_2 = $signed(_dataReadyLookupVec_diff_T_13) - 6'shc; // @[CircularQueuePtr.scala 42:52]
  wire  dataReadyLookupVec_reverse_flag_2 = $signed(dataReadyLookupVec_diff_2) >= 6'sh0; // @[CircularQueuePtr.scala 43:31]
  wire  dataReadyLookupVec_2_flag = dataReadyLookupVec_reverse_flag_2 ? ~dataReadyPtrExt_flag : dataReadyPtrExt_flag; // @[CircularQueuePtr.scala 44:26]
  wire [5:0] _dataReadyLookupVec_new_ptr_value_T_4 = $signed(_dataReadyLookupVec_diff_T_13) - 6'shc; // @[CircularQueuePtr.scala 46:20]
  wire [5:0] _dataReadyLookupVec_new_ptr_value_T_5 = dataReadyLookupVec_reverse_flag_2 ?
    _dataReadyLookupVec_new_ptr_value_T_4 : {{1'd0}, dataReadyLookupVec_new_value_2}; // @[CircularQueuePtr.scala 45:27]
  wire [4:0] dataReadyLookupVec_new_value_3 = dataReadyPtrExt_value + 4'h3; // @[CircularQueuePtr.scala 41:34]
  wire [5:0] _dataReadyLookupVec_diff_T_19 = {1'h0,dataReadyLookupVec_new_value_3}; // @[CircularQueuePtr.scala 42:49]
  wire [5:0] dataReadyLookupVec_diff_3 = $signed(_dataReadyLookupVec_diff_T_19) - 6'shc; // @[CircularQueuePtr.scala 42:52]
  wire  dataReadyLookupVec_reverse_flag_3 = $signed(dataReadyLookupVec_diff_3) >= 6'sh0; // @[CircularQueuePtr.scala 43:31]
  wire  dataReadyLookupVec_3_flag = dataReadyLookupVec_reverse_flag_3 ? ~dataReadyPtrExt_flag : dataReadyPtrExt_flag; // @[CircularQueuePtr.scala 44:26]
  wire [5:0] _dataReadyLookupVec_new_ptr_value_T_6 = $signed(_dataReadyLookupVec_diff_T_19) - 6'shc; // @[CircularQueuePtr.scala 46:20]
  wire [5:0] _dataReadyLookupVec_new_ptr_value_T_7 = dataReadyLookupVec_reverse_flag_3 ?
    _dataReadyLookupVec_new_ptr_value_T_6 : {{1'd0}, dataReadyLookupVec_new_value_3}; // @[CircularQueuePtr.scala 45:27]
  wire [3:0] dataReadyLookupVec_0_value = _dataReadyLookupVec_new_ptr_value_T_1[3:0]; // @[CircularQueuePtr.scala 37:23 45:21]
  wire  _GEN_11163 = 4'h1 == dataReadyLookupVec_0_value ? allocated_1 : allocated_0; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11164 = 4'h2 == dataReadyLookupVec_0_value ? allocated_2 : _GEN_11163; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11165 = 4'h3 == dataReadyLookupVec_0_value ? allocated_3 : _GEN_11164; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11166 = 4'h4 == dataReadyLookupVec_0_value ? allocated_4 : _GEN_11165; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11167 = 4'h5 == dataReadyLookupVec_0_value ? allocated_5 : _GEN_11166; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11168 = 4'h6 == dataReadyLookupVec_0_value ? allocated_6 : _GEN_11167; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11169 = 4'h7 == dataReadyLookupVec_0_value ? allocated_7 : _GEN_11168; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11170 = 4'h8 == dataReadyLookupVec_0_value ? allocated_8 : _GEN_11169; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11171 = 4'h9 == dataReadyLookupVec_0_value ? allocated_9 : _GEN_11170; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11172 = 4'ha == dataReadyLookupVec_0_value ? allocated_10 : _GEN_11171; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11173 = 4'hb == dataReadyLookupVec_0_value ? allocated_11 : _GEN_11172; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11175 = 4'h1 == dataReadyLookupVec_0_value ? datavalid_1 : datavalid_0; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11176 = 4'h2 == dataReadyLookupVec_0_value ? datavalid_2 : _GEN_11175; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11177 = 4'h3 == dataReadyLookupVec_0_value ? datavalid_3 : _GEN_11176; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11178 = 4'h4 == dataReadyLookupVec_0_value ? datavalid_4 : _GEN_11177; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11179 = 4'h5 == dataReadyLookupVec_0_value ? datavalid_5 : _GEN_11178; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11180 = 4'h6 == dataReadyLookupVec_0_value ? datavalid_6 : _GEN_11179; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11181 = 4'h7 == dataReadyLookupVec_0_value ? datavalid_7 : _GEN_11180; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11182 = 4'h8 == dataReadyLookupVec_0_value ? datavalid_8 : _GEN_11181; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11183 = 4'h9 == dataReadyLookupVec_0_value ? datavalid_9 : _GEN_11182; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11184 = 4'ha == dataReadyLookupVec_0_value ? datavalid_10 : _GEN_11183; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11185 = 4'hb == dataReadyLookupVec_0_value ? datavalid_11 : _GEN_11184; // @[StoreQueue.scala 254:{76,76}]
  wire [4:0] _dataReadyLookup_T_1 = {dataReadyLookupVec_0_flag,dataReadyLookupVec_0_value}; // @[CircularQueuePtr.scala 63:50]
  wire  _dataReadyLookup_T_3 = _dataReadyLookup_T_1 != _addrReadyLookup_T_2; // @[CircularQueuePtr.scala 63:52]
  wire  dataReadyLookup_0 = _GEN_11173 & _GEN_11185 & _dataReadyLookup_T_3; // @[StoreQueue.scala 254:100]
  wire [3:0] dataReadyLookupVec_1_value = _dataReadyLookupVec_new_ptr_value_T_3[3:0]; // @[CircularQueuePtr.scala 37:23 45:21]
  wire  _GEN_11187 = 4'h1 == dataReadyLookupVec_1_value ? allocated_1 : allocated_0; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11188 = 4'h2 == dataReadyLookupVec_1_value ? allocated_2 : _GEN_11187; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11189 = 4'h3 == dataReadyLookupVec_1_value ? allocated_3 : _GEN_11188; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11190 = 4'h4 == dataReadyLookupVec_1_value ? allocated_4 : _GEN_11189; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11191 = 4'h5 == dataReadyLookupVec_1_value ? allocated_5 : _GEN_11190; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11192 = 4'h6 == dataReadyLookupVec_1_value ? allocated_6 : _GEN_11191; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11193 = 4'h7 == dataReadyLookupVec_1_value ? allocated_7 : _GEN_11192; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11194 = 4'h8 == dataReadyLookupVec_1_value ? allocated_8 : _GEN_11193; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11195 = 4'h9 == dataReadyLookupVec_1_value ? allocated_9 : _GEN_11194; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11196 = 4'ha == dataReadyLookupVec_1_value ? allocated_10 : _GEN_11195; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11197 = 4'hb == dataReadyLookupVec_1_value ? allocated_11 : _GEN_11196; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11199 = 4'h1 == dataReadyLookupVec_1_value ? datavalid_1 : datavalid_0; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11200 = 4'h2 == dataReadyLookupVec_1_value ? datavalid_2 : _GEN_11199; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11201 = 4'h3 == dataReadyLookupVec_1_value ? datavalid_3 : _GEN_11200; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11202 = 4'h4 == dataReadyLookupVec_1_value ? datavalid_4 : _GEN_11201; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11203 = 4'h5 == dataReadyLookupVec_1_value ? datavalid_5 : _GEN_11202; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11204 = 4'h6 == dataReadyLookupVec_1_value ? datavalid_6 : _GEN_11203; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11205 = 4'h7 == dataReadyLookupVec_1_value ? datavalid_7 : _GEN_11204; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11206 = 4'h8 == dataReadyLookupVec_1_value ? datavalid_8 : _GEN_11205; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11207 = 4'h9 == dataReadyLookupVec_1_value ? datavalid_9 : _GEN_11206; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11208 = 4'ha == dataReadyLookupVec_1_value ? datavalid_10 : _GEN_11207; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11209 = 4'hb == dataReadyLookupVec_1_value ? datavalid_11 : _GEN_11208; // @[StoreQueue.scala 254:{76,76}]
  wire [4:0] _dataReadyLookup_T_5 = {dataReadyLookupVec_1_flag,dataReadyLookupVec_1_value}; // @[CircularQueuePtr.scala 63:50]
  wire  _dataReadyLookup_T_7 = _dataReadyLookup_T_5 != _addrReadyLookup_T_2; // @[CircularQueuePtr.scala 63:52]
  wire  dataReadyLookup_1 = _GEN_11197 & _GEN_11209 & _dataReadyLookup_T_7; // @[StoreQueue.scala 254:100]
  wire [3:0] dataReadyLookupVec_2_value = _dataReadyLookupVec_new_ptr_value_T_5[3:0]; // @[CircularQueuePtr.scala 37:23 45:21]
  wire  _GEN_11211 = 4'h1 == dataReadyLookupVec_2_value ? allocated_1 : allocated_0; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11212 = 4'h2 == dataReadyLookupVec_2_value ? allocated_2 : _GEN_11211; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11213 = 4'h3 == dataReadyLookupVec_2_value ? allocated_3 : _GEN_11212; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11214 = 4'h4 == dataReadyLookupVec_2_value ? allocated_4 : _GEN_11213; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11215 = 4'h5 == dataReadyLookupVec_2_value ? allocated_5 : _GEN_11214; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11216 = 4'h6 == dataReadyLookupVec_2_value ? allocated_6 : _GEN_11215; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11217 = 4'h7 == dataReadyLookupVec_2_value ? allocated_7 : _GEN_11216; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11218 = 4'h8 == dataReadyLookupVec_2_value ? allocated_8 : _GEN_11217; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11219 = 4'h9 == dataReadyLookupVec_2_value ? allocated_9 : _GEN_11218; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11220 = 4'ha == dataReadyLookupVec_2_value ? allocated_10 : _GEN_11219; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11221 = 4'hb == dataReadyLookupVec_2_value ? allocated_11 : _GEN_11220; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11223 = 4'h1 == dataReadyLookupVec_2_value ? datavalid_1 : datavalid_0; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11224 = 4'h2 == dataReadyLookupVec_2_value ? datavalid_2 : _GEN_11223; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11225 = 4'h3 == dataReadyLookupVec_2_value ? datavalid_3 : _GEN_11224; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11226 = 4'h4 == dataReadyLookupVec_2_value ? datavalid_4 : _GEN_11225; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11227 = 4'h5 == dataReadyLookupVec_2_value ? datavalid_5 : _GEN_11226; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11228 = 4'h6 == dataReadyLookupVec_2_value ? datavalid_6 : _GEN_11227; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11229 = 4'h7 == dataReadyLookupVec_2_value ? datavalid_7 : _GEN_11228; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11230 = 4'h8 == dataReadyLookupVec_2_value ? datavalid_8 : _GEN_11229; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11231 = 4'h9 == dataReadyLookupVec_2_value ? datavalid_9 : _GEN_11230; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11232 = 4'ha == dataReadyLookupVec_2_value ? datavalid_10 : _GEN_11231; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11233 = 4'hb == dataReadyLookupVec_2_value ? datavalid_11 : _GEN_11232; // @[StoreQueue.scala 254:{76,76}]
  wire [4:0] _dataReadyLookup_T_9 = {dataReadyLookupVec_2_flag,dataReadyLookupVec_2_value}; // @[CircularQueuePtr.scala 63:50]
  wire  _dataReadyLookup_T_11 = _dataReadyLookup_T_9 != _addrReadyLookup_T_2; // @[CircularQueuePtr.scala 63:52]
  wire  dataReadyLookup_2 = _GEN_11221 & _GEN_11233 & _dataReadyLookup_T_11; // @[StoreQueue.scala 254:100]
  wire [3:0] dataReadyLookupVec_3_value = _dataReadyLookupVec_new_ptr_value_T_7[3:0]; // @[CircularQueuePtr.scala 37:23 45:21]
  wire  _GEN_11235 = 4'h1 == dataReadyLookupVec_3_value ? allocated_1 : allocated_0; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11236 = 4'h2 == dataReadyLookupVec_3_value ? allocated_2 : _GEN_11235; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11237 = 4'h3 == dataReadyLookupVec_3_value ? allocated_3 : _GEN_11236; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11238 = 4'h4 == dataReadyLookupVec_3_value ? allocated_4 : _GEN_11237; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11239 = 4'h5 == dataReadyLookupVec_3_value ? allocated_5 : _GEN_11238; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11240 = 4'h6 == dataReadyLookupVec_3_value ? allocated_6 : _GEN_11239; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11241 = 4'h7 == dataReadyLookupVec_3_value ? allocated_7 : _GEN_11240; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11242 = 4'h8 == dataReadyLookupVec_3_value ? allocated_8 : _GEN_11241; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11243 = 4'h9 == dataReadyLookupVec_3_value ? allocated_9 : _GEN_11242; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11244 = 4'ha == dataReadyLookupVec_3_value ? allocated_10 : _GEN_11243; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11245 = 4'hb == dataReadyLookupVec_3_value ? allocated_11 : _GEN_11244; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11247 = 4'h1 == dataReadyLookupVec_3_value ? datavalid_1 : datavalid_0; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11248 = 4'h2 == dataReadyLookupVec_3_value ? datavalid_2 : _GEN_11247; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11249 = 4'h3 == dataReadyLookupVec_3_value ? datavalid_3 : _GEN_11248; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11250 = 4'h4 == dataReadyLookupVec_3_value ? datavalid_4 : _GEN_11249; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11251 = 4'h5 == dataReadyLookupVec_3_value ? datavalid_5 : _GEN_11250; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11252 = 4'h6 == dataReadyLookupVec_3_value ? datavalid_6 : _GEN_11251; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11253 = 4'h7 == dataReadyLookupVec_3_value ? datavalid_7 : _GEN_11252; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11254 = 4'h8 == dataReadyLookupVec_3_value ? datavalid_8 : _GEN_11253; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11255 = 4'h9 == dataReadyLookupVec_3_value ? datavalid_9 : _GEN_11254; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11256 = 4'ha == dataReadyLookupVec_3_value ? datavalid_10 : _GEN_11255; // @[StoreQueue.scala 254:{76,76}]
  wire  _GEN_11257 = 4'hb == dataReadyLookupVec_3_value ? datavalid_11 : _GEN_11256; // @[StoreQueue.scala 254:{76,76}]
  wire [4:0] _dataReadyLookup_T_13 = {dataReadyLookupVec_3_flag,dataReadyLookupVec_3_value}; // @[CircularQueuePtr.scala 63:50]
  wire  _dataReadyLookup_T_15 = _dataReadyLookup_T_13 != _addrReadyLookup_T_2; // @[CircularQueuePtr.scala 63:52]
  wire  dataReadyLookup_3 = _GEN_11245 & _GEN_11257 & _dataReadyLookup_T_15; // @[StoreQueue.scala 254:100]
  wire  _nextDataReadyPtr_T = ~dataReadyLookup_0; // @[StoreQueue.scala 255:88]
  wire  _nextDataReadyPtr_T_1 = ~dataReadyLookup_1; // @[StoreQueue.scala 255:88]
  wire  _nextDataReadyPtr_T_2 = ~dataReadyLookup_2; // @[StoreQueue.scala 255:88]
  wire  _nextDataReadyPtr_T_3 = ~dataReadyLookup_3; // @[StoreQueue.scala 255:88]
  wire [2:0] _nextDataReadyPtr_T_4 = _nextDataReadyPtr_T_3 ? 3'h3 : 3'h4; // @[Mux.scala 47:70]
  wire [2:0] _nextDataReadyPtr_T_5 = _nextDataReadyPtr_T_2 ? 3'h2 : _nextDataReadyPtr_T_4; // @[Mux.scala 47:70]
  wire [2:0] _nextDataReadyPtr_T_6 = _nextDataReadyPtr_T_1 ? 3'h1 : _nextDataReadyPtr_T_5; // @[Mux.scala 47:70]
  wire [2:0] _nextDataReadyPtr_T_7 = _nextDataReadyPtr_T ? 3'h0 : _nextDataReadyPtr_T_6; // @[Mux.scala 47:70]
  wire [3:0] _GEN_15619 = {{1'd0}, _nextDataReadyPtr_T_7}; // @[CircularQueuePtr.scala 41:34]
  wire [4:0] nextDataReadyPtr_new_value = dataReadyPtrExt_value + _GEN_15619; // @[CircularQueuePtr.scala 41:34]
  wire [5:0] _nextDataReadyPtr_diff_T_1 = {1'h0,nextDataReadyPtr_new_value}; // @[CircularQueuePtr.scala 42:49]
  wire [5:0] nextDataReadyPtr_diff = $signed(_nextDataReadyPtr_diff_T_1) - 6'shc; // @[CircularQueuePtr.scala 42:52]
  wire  nextDataReadyPtr_reverse_flag = $signed(nextDataReadyPtr_diff) >= 6'sh0; // @[CircularQueuePtr.scala 43:31]
  wire [5:0] _nextDataReadyPtr_new_ptr_value_T = $signed(_nextDataReadyPtr_diff_T_1) - 6'shc; // @[CircularQueuePtr.scala 46:20]
  wire [5:0] _nextDataReadyPtr_new_ptr_value_T_1 = nextDataReadyPtr_reverse_flag ? _nextDataReadyPtr_new_ptr_value_T :
    {{1'd0}, nextDataReadyPtr_new_value}; // @[CircularQueuePtr.scala 45:27]
  wire [3:0] nextDataReadyPtr_value = _nextDataReadyPtr_new_ptr_value_T_1[3:0]; // @[CircularQueuePtr.scala 37:23 45:21]
  wire  addr_valid = ~io_storeAddrIn_0_bits_miss; // @[StoreQueue.scala 289:24]
  wire  _GEN_11260 = 4'h0 == io_storeAddrIn_0_bits_uop_sqIdx_value ? addr_valid : _GEN_11016; // @[StoreQueue.scala 290:{28,28}]
  wire  _GEN_11261 = 4'h1 == io_storeAddrIn_0_bits_uop_sqIdx_value ? addr_valid : _GEN_11017; // @[StoreQueue.scala 290:{28,28}]
  wire  _GEN_11262 = 4'h2 == io_storeAddrIn_0_bits_uop_sqIdx_value ? addr_valid : _GEN_11018; // @[StoreQueue.scala 290:{28,28}]
  wire  _GEN_11263 = 4'h3 == io_storeAddrIn_0_bits_uop_sqIdx_value ? addr_valid : _GEN_11019; // @[StoreQueue.scala 290:{28,28}]
  wire  _GEN_11264 = 4'h4 == io_storeAddrIn_0_bits_uop_sqIdx_value ? addr_valid : _GEN_11020; // @[StoreQueue.scala 290:{28,28}]
  wire  _GEN_11265 = 4'h5 == io_storeAddrIn_0_bits_uop_sqIdx_value ? addr_valid : _GEN_11021; // @[StoreQueue.scala 290:{28,28}]
  wire  _GEN_11266 = 4'h6 == io_storeAddrIn_0_bits_uop_sqIdx_value ? addr_valid : _GEN_11022; // @[StoreQueue.scala 290:{28,28}]
  wire  _GEN_11267 = 4'h7 == io_storeAddrIn_0_bits_uop_sqIdx_value ? addr_valid : _GEN_11023; // @[StoreQueue.scala 290:{28,28}]
  wire  _GEN_11268 = 4'h8 == io_storeAddrIn_0_bits_uop_sqIdx_value ? addr_valid : _GEN_11024; // @[StoreQueue.scala 290:{28,28}]
  wire  _GEN_11269 = 4'h9 == io_storeAddrIn_0_bits_uop_sqIdx_value ? addr_valid : _GEN_11025; // @[StoreQueue.scala 290:{28,28}]
  wire  _GEN_11270 = 4'ha == io_storeAddrIn_0_bits_uop_sqIdx_value ? addr_valid : _GEN_11026; // @[StoreQueue.scala 290:{28,28}]
  wire  _GEN_11271 = 4'hb == io_storeAddrIn_0_bits_uop_sqIdx_value ? addr_valid : _GEN_11027; // @[StoreQueue.scala 290:{28,28}]
  wire [6:0] _GEN_11392 = 4'h0 == io_storeAddrIn_0_bits_uop_sqIdx_value ? io_storeAddrIn_0_bits_uop_ctrl_fuOpType :
    _GEN_10368; // @[StoreQueue.scala 307:{27,27}]
  wire [6:0] _GEN_11393 = 4'h1 == io_storeAddrIn_0_bits_uop_sqIdx_value ? io_storeAddrIn_0_bits_uop_ctrl_fuOpType :
    _GEN_10369; // @[StoreQueue.scala 307:{27,27}]
  wire [6:0] _GEN_11394 = 4'h2 == io_storeAddrIn_0_bits_uop_sqIdx_value ? io_storeAddrIn_0_bits_uop_ctrl_fuOpType :
    _GEN_10370; // @[StoreQueue.scala 307:{27,27}]
  wire [6:0] _GEN_11395 = 4'h3 == io_storeAddrIn_0_bits_uop_sqIdx_value ? io_storeAddrIn_0_bits_uop_ctrl_fuOpType :
    _GEN_10371; // @[StoreQueue.scala 307:{27,27}]
  wire [6:0] _GEN_11396 = 4'h4 == io_storeAddrIn_0_bits_uop_sqIdx_value ? io_storeAddrIn_0_bits_uop_ctrl_fuOpType :
    _GEN_10372; // @[StoreQueue.scala 307:{27,27}]
  wire [6:0] _GEN_11397 = 4'h5 == io_storeAddrIn_0_bits_uop_sqIdx_value ? io_storeAddrIn_0_bits_uop_ctrl_fuOpType :
    _GEN_10373; // @[StoreQueue.scala 307:{27,27}]
  wire [6:0] _GEN_11398 = 4'h6 == io_storeAddrIn_0_bits_uop_sqIdx_value ? io_storeAddrIn_0_bits_uop_ctrl_fuOpType :
    _GEN_10374; // @[StoreQueue.scala 307:{27,27}]
  wire [6:0] _GEN_11399 = 4'h7 == io_storeAddrIn_0_bits_uop_sqIdx_value ? io_storeAddrIn_0_bits_uop_ctrl_fuOpType :
    _GEN_10375; // @[StoreQueue.scala 307:{27,27}]
  wire [6:0] _GEN_11400 = 4'h8 == io_storeAddrIn_0_bits_uop_sqIdx_value ? io_storeAddrIn_0_bits_uop_ctrl_fuOpType :
    _GEN_10376; // @[StoreQueue.scala 307:{27,27}]
  wire [6:0] _GEN_11401 = 4'h9 == io_storeAddrIn_0_bits_uop_sqIdx_value ? io_storeAddrIn_0_bits_uop_ctrl_fuOpType :
    _GEN_10377; // @[StoreQueue.scala 307:{27,27}]
  wire [6:0] _GEN_11402 = 4'ha == io_storeAddrIn_0_bits_uop_sqIdx_value ? io_storeAddrIn_0_bits_uop_ctrl_fuOpType :
    _GEN_10378; // @[StoreQueue.scala 307:{27,27}]
  wire [6:0] _GEN_11403 = 4'hb == io_storeAddrIn_0_bits_uop_sqIdx_value ? io_storeAddrIn_0_bits_uop_ctrl_fuOpType :
    _GEN_10379; // @[StoreQueue.scala 307:{27,27}]
  wire  _GEN_11836 = io_storeAddrIn_0_valid ? _GEN_11260 : _GEN_11016; // @[StoreQueue.scala 288:37]
  wire  _GEN_11837 = io_storeAddrIn_0_valid ? _GEN_11261 : _GEN_11017; // @[StoreQueue.scala 288:37]
  wire  _GEN_11838 = io_storeAddrIn_0_valid ? _GEN_11262 : _GEN_11018; // @[StoreQueue.scala 288:37]
  wire  _GEN_11839 = io_storeAddrIn_0_valid ? _GEN_11263 : _GEN_11019; // @[StoreQueue.scala 288:37]
  wire  _GEN_11840 = io_storeAddrIn_0_valid ? _GEN_11264 : _GEN_11020; // @[StoreQueue.scala 288:37]
  wire  _GEN_11841 = io_storeAddrIn_0_valid ? _GEN_11265 : _GEN_11021; // @[StoreQueue.scala 288:37]
  wire  _GEN_11842 = io_storeAddrIn_0_valid ? _GEN_11266 : _GEN_11022; // @[StoreQueue.scala 288:37]
  wire  _GEN_11843 = io_storeAddrIn_0_valid ? _GEN_11267 : _GEN_11023; // @[StoreQueue.scala 288:37]
  wire  _GEN_11844 = io_storeAddrIn_0_valid ? _GEN_11268 : _GEN_11024; // @[StoreQueue.scala 288:37]
  wire  _GEN_11845 = io_storeAddrIn_0_valid ? _GEN_11269 : _GEN_11025; // @[StoreQueue.scala 288:37]
  wire  _GEN_11846 = io_storeAddrIn_0_valid ? _GEN_11270 : _GEN_11026; // @[StoreQueue.scala 288:37]
  wire  _GEN_11847 = io_storeAddrIn_0_valid ? _GEN_11271 : _GEN_11027; // @[StoreQueue.scala 288:37]
  wire [6:0] _GEN_11973 = io_storeAddrIn_0_valid ? _GEN_11392 : _GEN_10368; // @[StoreQueue.scala 288:37]
  wire [6:0] _GEN_11974 = io_storeAddrIn_0_valid ? _GEN_11393 : _GEN_10369; // @[StoreQueue.scala 288:37]
  wire [6:0] _GEN_11975 = io_storeAddrIn_0_valid ? _GEN_11394 : _GEN_10370; // @[StoreQueue.scala 288:37]
  wire [6:0] _GEN_11976 = io_storeAddrIn_0_valid ? _GEN_11395 : _GEN_10371; // @[StoreQueue.scala 288:37]
  wire [6:0] _GEN_11977 = io_storeAddrIn_0_valid ? _GEN_11396 : _GEN_10372; // @[StoreQueue.scala 288:37]
  wire [6:0] _GEN_11978 = io_storeAddrIn_0_valid ? _GEN_11397 : _GEN_10373; // @[StoreQueue.scala 288:37]
  wire [6:0] _GEN_11979 = io_storeAddrIn_0_valid ? _GEN_11398 : _GEN_10374; // @[StoreQueue.scala 288:37]
  wire [6:0] _GEN_11980 = io_storeAddrIn_0_valid ? _GEN_11399 : _GEN_10375; // @[StoreQueue.scala 288:37]
  wire [6:0] _GEN_11981 = io_storeAddrIn_0_valid ? _GEN_11400 : _GEN_10376; // @[StoreQueue.scala 288:37]
  wire [6:0] _GEN_11982 = io_storeAddrIn_0_valid ? _GEN_11401 : _GEN_10377; // @[StoreQueue.scala 288:37]
  wire [6:0] _GEN_11983 = io_storeAddrIn_0_valid ? _GEN_11402 : _GEN_10378; // @[StoreQueue.scala 288:37]
  wire [6:0] _GEN_11984 = io_storeAddrIn_0_valid ? _GEN_11403 : _GEN_10379; // @[StoreQueue.scala 288:37]
  reg  storeAddrInFireReg; // @[StoreQueue.scala 320:37]
  reg [3:0] stWbIndexReg; // @[StoreQueue.scala 321:31]
  wire  _GEN_12417 = 4'h0 == stWbIndexReg ? io_storeAddrInRe_0_mmio : _GEN_11040; // @[StoreQueue.scala 323:{29,29}]
  wire  _GEN_12418 = 4'h1 == stWbIndexReg ? io_storeAddrInRe_0_mmio : _GEN_11041; // @[StoreQueue.scala 323:{29,29}]
  wire  _GEN_12419 = 4'h2 == stWbIndexReg ? io_storeAddrInRe_0_mmio : _GEN_11042; // @[StoreQueue.scala 323:{29,29}]
  wire  _GEN_12420 = 4'h3 == stWbIndexReg ? io_storeAddrInRe_0_mmio : _GEN_11043; // @[StoreQueue.scala 323:{29,29}]
  wire  _GEN_12421 = 4'h4 == stWbIndexReg ? io_storeAddrInRe_0_mmio : _GEN_11044; // @[StoreQueue.scala 323:{29,29}]
  wire  _GEN_12422 = 4'h5 == stWbIndexReg ? io_storeAddrInRe_0_mmio : _GEN_11045; // @[StoreQueue.scala 323:{29,29}]
  wire  _GEN_12423 = 4'h6 == stWbIndexReg ? io_storeAddrInRe_0_mmio : _GEN_11046; // @[StoreQueue.scala 323:{29,29}]
  wire  _GEN_12424 = 4'h7 == stWbIndexReg ? io_storeAddrInRe_0_mmio : _GEN_11047; // @[StoreQueue.scala 323:{29,29}]
  wire  _GEN_12425 = 4'h8 == stWbIndexReg ? io_storeAddrInRe_0_mmio : _GEN_11048; // @[StoreQueue.scala 323:{29,29}]
  wire  _GEN_12426 = 4'h9 == stWbIndexReg ? io_storeAddrInRe_0_mmio : _GEN_11049; // @[StoreQueue.scala 323:{29,29}]
  wire  _GEN_12427 = 4'ha == stWbIndexReg ? io_storeAddrInRe_0_mmio : _GEN_11050; // @[StoreQueue.scala 323:{29,29}]
  wire  _GEN_12428 = 4'hb == stWbIndexReg ? io_storeAddrInRe_0_mmio : _GEN_11051; // @[StoreQueue.scala 323:{29,29}]
  wire  _GEN_12429 = 4'h0 == stWbIndexReg ? io_storeAddrInRe_0_mmio : mmio_0; // @[StoreQueue.scala 130:17 324:{26,26}]
  wire  _GEN_12430 = 4'h1 == stWbIndexReg ? io_storeAddrInRe_0_mmio : mmio_1; // @[StoreQueue.scala 130:17 324:{26,26}]
  wire  _GEN_12431 = 4'h2 == stWbIndexReg ? io_storeAddrInRe_0_mmio : mmio_2; // @[StoreQueue.scala 130:17 324:{26,26}]
  wire  _GEN_12432 = 4'h3 == stWbIndexReg ? io_storeAddrInRe_0_mmio : mmio_3; // @[StoreQueue.scala 130:17 324:{26,26}]
  wire  _GEN_12433 = 4'h4 == stWbIndexReg ? io_storeAddrInRe_0_mmio : mmio_4; // @[StoreQueue.scala 130:17 324:{26,26}]
  wire  _GEN_12434 = 4'h5 == stWbIndexReg ? io_storeAddrInRe_0_mmio : mmio_5; // @[StoreQueue.scala 130:17 324:{26,26}]
  wire  _GEN_12435 = 4'h6 == stWbIndexReg ? io_storeAddrInRe_0_mmio : mmio_6; // @[StoreQueue.scala 130:17 324:{26,26}]
  wire  _GEN_12436 = 4'h7 == stWbIndexReg ? io_storeAddrInRe_0_mmio : mmio_7; // @[StoreQueue.scala 130:17 324:{26,26}]
  wire  _GEN_12437 = 4'h8 == stWbIndexReg ? io_storeAddrInRe_0_mmio : mmio_8; // @[StoreQueue.scala 130:17 324:{26,26}]
  wire  _GEN_12438 = 4'h9 == stWbIndexReg ? io_storeAddrInRe_0_mmio : mmio_9; // @[StoreQueue.scala 130:17 324:{26,26}]
  wire  _GEN_12439 = 4'ha == stWbIndexReg ? io_storeAddrInRe_0_mmio : mmio_10; // @[StoreQueue.scala 130:17 324:{26,26}]
  wire  _GEN_12440 = 4'hb == stWbIndexReg ? io_storeAddrInRe_0_mmio : mmio_11; // @[StoreQueue.scala 130:17 324:{26,26}]
  wire  _GEN_12441 = 4'h0 == stWbIndexReg ? io_storeAddrInRe_0_atomic : atomic_0; // @[StoreQueue.scala 131:19 325:{28,28}]
  wire  _GEN_12442 = 4'h1 == stWbIndexReg ? io_storeAddrInRe_0_atomic : atomic_1; // @[StoreQueue.scala 131:19 325:{28,28}]
  wire  _GEN_12443 = 4'h2 == stWbIndexReg ? io_storeAddrInRe_0_atomic : atomic_2; // @[StoreQueue.scala 131:19 325:{28,28}]
  wire  _GEN_12444 = 4'h3 == stWbIndexReg ? io_storeAddrInRe_0_atomic : atomic_3; // @[StoreQueue.scala 131:19 325:{28,28}]
  wire  _GEN_12445 = 4'h4 == stWbIndexReg ? io_storeAddrInRe_0_atomic : atomic_4; // @[StoreQueue.scala 131:19 325:{28,28}]
  wire  _GEN_12446 = 4'h5 == stWbIndexReg ? io_storeAddrInRe_0_atomic : atomic_5; // @[StoreQueue.scala 131:19 325:{28,28}]
  wire  _GEN_12447 = 4'h6 == stWbIndexReg ? io_storeAddrInRe_0_atomic : atomic_6; // @[StoreQueue.scala 131:19 325:{28,28}]
  wire  _GEN_12448 = 4'h7 == stWbIndexReg ? io_storeAddrInRe_0_atomic : atomic_7; // @[StoreQueue.scala 131:19 325:{28,28}]
  wire  _GEN_12449 = 4'h8 == stWbIndexReg ? io_storeAddrInRe_0_atomic : atomic_8; // @[StoreQueue.scala 131:19 325:{28,28}]
  wire  _GEN_12450 = 4'h9 == stWbIndexReg ? io_storeAddrInRe_0_atomic : atomic_9; // @[StoreQueue.scala 131:19 325:{28,28}]
  wire  _GEN_12451 = 4'ha == stWbIndexReg ? io_storeAddrInRe_0_atomic : atomic_10; // @[StoreQueue.scala 131:19 325:{28,28}]
  wire  _GEN_12452 = 4'hb == stWbIndexReg ? io_storeAddrInRe_0_atomic : atomic_11; // @[StoreQueue.scala 131:19 325:{28,28}]
  wire  _GEN_12453 = storeAddrInFireReg ? _GEN_12417 : _GEN_11040; // @[StoreQueue.scala 322:31]
  wire  _GEN_12454 = storeAddrInFireReg ? _GEN_12418 : _GEN_11041; // @[StoreQueue.scala 322:31]
  wire  _GEN_12455 = storeAddrInFireReg ? _GEN_12419 : _GEN_11042; // @[StoreQueue.scala 322:31]
  wire  _GEN_12456 = storeAddrInFireReg ? _GEN_12420 : _GEN_11043; // @[StoreQueue.scala 322:31]
  wire  _GEN_12457 = storeAddrInFireReg ? _GEN_12421 : _GEN_11044; // @[StoreQueue.scala 322:31]
  wire  _GEN_12458 = storeAddrInFireReg ? _GEN_12422 : _GEN_11045; // @[StoreQueue.scala 322:31]
  wire  _GEN_12459 = storeAddrInFireReg ? _GEN_12423 : _GEN_11046; // @[StoreQueue.scala 322:31]
  wire  _GEN_12460 = storeAddrInFireReg ? _GEN_12424 : _GEN_11047; // @[StoreQueue.scala 322:31]
  wire  _GEN_12461 = storeAddrInFireReg ? _GEN_12425 : _GEN_11048; // @[StoreQueue.scala 322:31]
  wire  _GEN_12462 = storeAddrInFireReg ? _GEN_12426 : _GEN_11049; // @[StoreQueue.scala 322:31]
  wire  _GEN_12463 = storeAddrInFireReg ? _GEN_12427 : _GEN_11050; // @[StoreQueue.scala 322:31]
  wire  _GEN_12464 = storeAddrInFireReg ? _GEN_12428 : _GEN_11051; // @[StoreQueue.scala 322:31]
  wire  _GEN_12465 = storeAddrInFireReg ? _GEN_12429 : mmio_0; // @[StoreQueue.scala 130:17 322:31]
  wire  _GEN_12466 = storeAddrInFireReg ? _GEN_12430 : mmio_1; // @[StoreQueue.scala 130:17 322:31]
  wire  _GEN_12467 = storeAddrInFireReg ? _GEN_12431 : mmio_2; // @[StoreQueue.scala 130:17 322:31]
  wire  _GEN_12468 = storeAddrInFireReg ? _GEN_12432 : mmio_3; // @[StoreQueue.scala 130:17 322:31]
  wire  _GEN_12469 = storeAddrInFireReg ? _GEN_12433 : mmio_4; // @[StoreQueue.scala 130:17 322:31]
  wire  _GEN_12470 = storeAddrInFireReg ? _GEN_12434 : mmio_5; // @[StoreQueue.scala 130:17 322:31]
  wire  _GEN_12471 = storeAddrInFireReg ? _GEN_12435 : mmio_6; // @[StoreQueue.scala 130:17 322:31]
  wire  _GEN_12472 = storeAddrInFireReg ? _GEN_12436 : mmio_7; // @[StoreQueue.scala 130:17 322:31]
  wire  _GEN_12473 = storeAddrInFireReg ? _GEN_12437 : mmio_8; // @[StoreQueue.scala 130:17 322:31]
  wire  _GEN_12474 = storeAddrInFireReg ? _GEN_12438 : mmio_9; // @[StoreQueue.scala 130:17 322:31]
  wire  _GEN_12475 = storeAddrInFireReg ? _GEN_12439 : mmio_10; // @[StoreQueue.scala 130:17 322:31]
  wire  _GEN_12476 = storeAddrInFireReg ? _GEN_12440 : mmio_11; // @[StoreQueue.scala 130:17 322:31]
  wire  _GEN_12477 = storeAddrInFireReg ? _GEN_12441 : atomic_0; // @[StoreQueue.scala 131:19 322:31]
  wire  _GEN_12478 = storeAddrInFireReg ? _GEN_12442 : atomic_1; // @[StoreQueue.scala 131:19 322:31]
  wire  _GEN_12479 = storeAddrInFireReg ? _GEN_12443 : atomic_2; // @[StoreQueue.scala 131:19 322:31]
  wire  _GEN_12480 = storeAddrInFireReg ? _GEN_12444 : atomic_3; // @[StoreQueue.scala 131:19 322:31]
  wire  _GEN_12481 = storeAddrInFireReg ? _GEN_12445 : atomic_4; // @[StoreQueue.scala 131:19 322:31]
  wire  _GEN_12482 = storeAddrInFireReg ? _GEN_12446 : atomic_5; // @[StoreQueue.scala 131:19 322:31]
  wire  _GEN_12483 = storeAddrInFireReg ? _GEN_12447 : atomic_6; // @[StoreQueue.scala 131:19 322:31]
  wire  _GEN_12484 = storeAddrInFireReg ? _GEN_12448 : atomic_7; // @[StoreQueue.scala 131:19 322:31]
  wire  _GEN_12485 = storeAddrInFireReg ? _GEN_12449 : atomic_8; // @[StoreQueue.scala 131:19 322:31]
  wire  _GEN_12486 = storeAddrInFireReg ? _GEN_12450 : atomic_9; // @[StoreQueue.scala 131:19 322:31]
  wire  _GEN_12487 = storeAddrInFireReg ? _GEN_12451 : atomic_10; // @[StoreQueue.scala 131:19 322:31]
  wire  _GEN_12488 = storeAddrInFireReg ? _GEN_12452 : atomic_11; // @[StoreQueue.scala 131:19 322:31]
  wire  addr_valid_1 = ~io_storeAddrIn_1_bits_miss; // @[StoreQueue.scala 289:24]
  reg  storeAddrInFireReg_1; // @[StoreQueue.scala 320:37]
  reg [3:0] stWbIndexReg_1; // @[StoreQueue.scala 321:31]
  wire  _GEN_13670 = 4'h0 == stWbIndexReg_1 ? io_storeAddrInRe_1_mmio : _GEN_12453; // @[StoreQueue.scala 323:{29,29}]
  wire  _GEN_13671 = 4'h1 == stWbIndexReg_1 ? io_storeAddrInRe_1_mmio : _GEN_12454; // @[StoreQueue.scala 323:{29,29}]
  wire  _GEN_13672 = 4'h2 == stWbIndexReg_1 ? io_storeAddrInRe_1_mmio : _GEN_12455; // @[StoreQueue.scala 323:{29,29}]
  wire  _GEN_13673 = 4'h3 == stWbIndexReg_1 ? io_storeAddrInRe_1_mmio : _GEN_12456; // @[StoreQueue.scala 323:{29,29}]
  wire  _GEN_13674 = 4'h4 == stWbIndexReg_1 ? io_storeAddrInRe_1_mmio : _GEN_12457; // @[StoreQueue.scala 323:{29,29}]
  wire  _GEN_13675 = 4'h5 == stWbIndexReg_1 ? io_storeAddrInRe_1_mmio : _GEN_12458; // @[StoreQueue.scala 323:{29,29}]
  wire  _GEN_13676 = 4'h6 == stWbIndexReg_1 ? io_storeAddrInRe_1_mmio : _GEN_12459; // @[StoreQueue.scala 323:{29,29}]
  wire  _GEN_13677 = 4'h7 == stWbIndexReg_1 ? io_storeAddrInRe_1_mmio : _GEN_12460; // @[StoreQueue.scala 323:{29,29}]
  wire  _GEN_13678 = 4'h8 == stWbIndexReg_1 ? io_storeAddrInRe_1_mmio : _GEN_12461; // @[StoreQueue.scala 323:{29,29}]
  wire  _GEN_13679 = 4'h9 == stWbIndexReg_1 ? io_storeAddrInRe_1_mmio : _GEN_12462; // @[StoreQueue.scala 323:{29,29}]
  wire  _GEN_13680 = 4'ha == stWbIndexReg_1 ? io_storeAddrInRe_1_mmio : _GEN_12463; // @[StoreQueue.scala 323:{29,29}]
  wire  _GEN_13681 = 4'hb == stWbIndexReg_1 ? io_storeAddrInRe_1_mmio : _GEN_12464; // @[StoreQueue.scala 323:{29,29}]
  wire  _GEN_13706 = storeAddrInFireReg_1 ? _GEN_13670 : _GEN_12453; // @[StoreQueue.scala 322:31]
  wire  _GEN_13707 = storeAddrInFireReg_1 ? _GEN_13671 : _GEN_12454; // @[StoreQueue.scala 322:31]
  wire  _GEN_13708 = storeAddrInFireReg_1 ? _GEN_13672 : _GEN_12455; // @[StoreQueue.scala 322:31]
  wire  _GEN_13709 = storeAddrInFireReg_1 ? _GEN_13673 : _GEN_12456; // @[StoreQueue.scala 322:31]
  wire  _GEN_13710 = storeAddrInFireReg_1 ? _GEN_13674 : _GEN_12457; // @[StoreQueue.scala 322:31]
  wire  _GEN_13711 = storeAddrInFireReg_1 ? _GEN_13675 : _GEN_12458; // @[StoreQueue.scala 322:31]
  wire  _GEN_13712 = storeAddrInFireReg_1 ? _GEN_13676 : _GEN_12459; // @[StoreQueue.scala 322:31]
  wire  _GEN_13713 = storeAddrInFireReg_1 ? _GEN_13677 : _GEN_12460; // @[StoreQueue.scala 322:31]
  wire  _GEN_13714 = storeAddrInFireReg_1 ? _GEN_13678 : _GEN_12461; // @[StoreQueue.scala 322:31]
  wire  _GEN_13715 = storeAddrInFireReg_1 ? _GEN_13679 : _GEN_12462; // @[StoreQueue.scala 322:31]
  wire  _GEN_13716 = storeAddrInFireReg_1 ? _GEN_13680 : _GEN_12463; // @[StoreQueue.scala 322:31]
  wire  _GEN_13717 = storeAddrInFireReg_1 ? _GEN_13681 : _GEN_12464; // @[StoreQueue.scala 322:31]
  wire [63:0] _dataModule_io_data_wdata_0_T_5 = {io_storeDataIn_0_bits_data[7:0],io_storeDataIn_0_bits_data[7:0],
    io_storeDataIn_0_bits_data[7:0],io_storeDataIn_0_bits_data[7:0],io_storeDataIn_0_bits_data[7:0],
    io_storeDataIn_0_bits_data[7:0],io_storeDataIn_0_bits_data[7:0],io_storeDataIn_0_bits_data[7:0]}; // @[Cat.scala 31:58]
  wire [127:0] _dataModule_io_data_wdata_0_T_6 = {io_storeDataIn_0_bits_data[7:0],io_storeDataIn_0_bits_data[7:0],
    io_storeDataIn_0_bits_data[7:0],io_storeDataIn_0_bits_data[7:0],io_storeDataIn_0_bits_data[7:0],
    io_storeDataIn_0_bits_data[7:0],io_storeDataIn_0_bits_data[7:0],io_storeDataIn_0_bits_data[7:0],
    _dataModule_io_data_wdata_0_T_5}; // @[Cat.scala 31:58]
  wire [127:0] _dataModule_io_data_wdata_0_T_10 = {io_storeDataIn_0_bits_data[15:0],io_storeDataIn_0_bits_data[15:0],
    io_storeDataIn_0_bits_data[15:0],io_storeDataIn_0_bits_data[15:0],io_storeDataIn_0_bits_data[15:0],
    io_storeDataIn_0_bits_data[15:0],io_storeDataIn_0_bits_data[15:0],io_storeDataIn_0_bits_data[15:0]}; // @[Cat.scala 31:58]
  wire [127:0] _dataModule_io_data_wdata_0_T_13 = {io_storeDataIn_0_bits_data[31:0],io_storeDataIn_0_bits_data[31:0],
    io_storeDataIn_0_bits_data[31:0],io_storeDataIn_0_bits_data[31:0]}; // @[Cat.scala 31:58]
  wire [127:0] _dataModule_io_data_wdata_0_T_15 = {io_storeDataIn_0_bits_data,io_storeDataIn_0_bits_data}; // @[Cat.scala 31:58]
  wire  _dataModule_io_data_wdata_0_T_16 = 2'h0 == io_storeDataIn_0_bits_uop_ctrl_fuOpType[1:0]; // @[LookupTree.scala 24:34]
  wire  _dataModule_io_data_wdata_0_T_17 = 2'h1 == io_storeDataIn_0_bits_uop_ctrl_fuOpType[1:0]; // @[LookupTree.scala 24:34]
  wire  _dataModule_io_data_wdata_0_T_18 = 2'h2 == io_storeDataIn_0_bits_uop_ctrl_fuOpType[1:0]; // @[LookupTree.scala 24:34]
  wire  _dataModule_io_data_wdata_0_T_19 = 2'h3 == io_storeDataIn_0_bits_uop_ctrl_fuOpType[1:0]; // @[LookupTree.scala 24:34]
  wire [127:0] _dataModule_io_data_wdata_0_T_20 = _dataModule_io_data_wdata_0_T_16 ? _dataModule_io_data_wdata_0_T_6 : 128'h0
    ; // @[Mux.scala 27:73]
  wire [127:0] _dataModule_io_data_wdata_0_T_21 = _dataModule_io_data_wdata_0_T_17 ? _dataModule_io_data_wdata_0_T_10 : 128'h0
    ; // @[Mux.scala 27:73]
  wire [127:0] _dataModule_io_data_wdata_0_T_22 = _dataModule_io_data_wdata_0_T_18 ? _dataModule_io_data_wdata_0_T_13 : 128'h0
    ; // @[Mux.scala 27:73]
  wire [127:0] _dataModule_io_data_wdata_0_T_23 = _dataModule_io_data_wdata_0_T_19 ? _dataModule_io_data_wdata_0_T_15 : 128'h0
    ; // @[Mux.scala 27:73]
  wire [127:0] _dataModule_io_data_wdata_0_T_24 = _dataModule_io_data_wdata_0_T_20 | _dataModule_io_data_wdata_0_T_21; // @[Mux.scala 27:73]
  wire [127:0] _dataModule_io_data_wdata_0_T_25 = _dataModule_io_data_wdata_0_T_24 | _dataModule_io_data_wdata_0_T_22; // @[Mux.scala 27:73]
  wire [127:0] _dataModule_io_data_wdata_0_T_26 = _dataModule_io_data_wdata_0_T_25 | _dataModule_io_data_wdata_0_T_23; // @[Mux.scala 27:73]
  reg  REG_2; // @[StoreQueue.scala 360:14]
  reg [3:0] REG_3; // @[StoreQueue.scala 363:24]
  wire  _GEN_13793 = 4'h0 == REG_3 | _GEN_11004; // @[StoreQueue.scala 363:{37,37}]
  wire  _GEN_13794 = 4'h1 == REG_3 | _GEN_11005; // @[StoreQueue.scala 363:{37,37}]
  wire  _GEN_13795 = 4'h2 == REG_3 | _GEN_11006; // @[StoreQueue.scala 363:{37,37}]
  wire  _GEN_13796 = 4'h3 == REG_3 | _GEN_11007; // @[StoreQueue.scala 363:{37,37}]
  wire  _GEN_13797 = 4'h4 == REG_3 | _GEN_11008; // @[StoreQueue.scala 363:{37,37}]
  wire  _GEN_13798 = 4'h5 == REG_3 | _GEN_11009; // @[StoreQueue.scala 363:{37,37}]
  wire  _GEN_13799 = 4'h6 == REG_3 | _GEN_11010; // @[StoreQueue.scala 363:{37,37}]
  wire  _GEN_13800 = 4'h7 == REG_3 | _GEN_11011; // @[StoreQueue.scala 363:{37,37}]
  wire  _GEN_13801 = 4'h8 == REG_3 | _GEN_11012; // @[StoreQueue.scala 363:{37,37}]
  wire  _GEN_13802 = 4'h9 == REG_3 | _GEN_11013; // @[StoreQueue.scala 363:{37,37}]
  wire  _GEN_13803 = 4'ha == REG_3 | _GEN_11014; // @[StoreQueue.scala 363:{37,37}]
  wire  _GEN_13804 = 4'hb == REG_3 | _GEN_11015; // @[StoreQueue.scala 363:{37,37}]
  wire  _GEN_13805 = REG_2 ? _GEN_13793 : _GEN_11004; // @[StoreQueue.scala 362:7]
  wire  _GEN_13806 = REG_2 ? _GEN_13794 : _GEN_11005; // @[StoreQueue.scala 362:7]
  wire  _GEN_13807 = REG_2 ? _GEN_13795 : _GEN_11006; // @[StoreQueue.scala 362:7]
  wire  _GEN_13808 = REG_2 ? _GEN_13796 : _GEN_11007; // @[StoreQueue.scala 362:7]
  wire  _GEN_13809 = REG_2 ? _GEN_13797 : _GEN_11008; // @[StoreQueue.scala 362:7]
  wire  _GEN_13810 = REG_2 ? _GEN_13798 : _GEN_11009; // @[StoreQueue.scala 362:7]
  wire  _GEN_13811 = REG_2 ? _GEN_13799 : _GEN_11010; // @[StoreQueue.scala 362:7]
  wire  _GEN_13812 = REG_2 ? _GEN_13800 : _GEN_11011; // @[StoreQueue.scala 362:7]
  wire  _GEN_13813 = REG_2 ? _GEN_13801 : _GEN_11012; // @[StoreQueue.scala 362:7]
  wire  _GEN_13814 = REG_2 ? _GEN_13802 : _GEN_11013; // @[StoreQueue.scala 362:7]
  wire  _GEN_13815 = REG_2 ? _GEN_13803 : _GEN_11014; // @[StoreQueue.scala 362:7]
  wire  _GEN_13816 = REG_2 ? _GEN_13804 : _GEN_11015; // @[StoreQueue.scala 362:7]
  wire [63:0] _dataModule_io_data_wdata_1_T_5 = {io_storeDataIn_1_bits_data[7:0],io_storeDataIn_1_bits_data[7:0],
    io_storeDataIn_1_bits_data[7:0],io_storeDataIn_1_bits_data[7:0],io_storeDataIn_1_bits_data[7:0],
    io_storeDataIn_1_bits_data[7:0],io_storeDataIn_1_bits_data[7:0],io_storeDataIn_1_bits_data[7:0]}; // @[Cat.scala 31:58]
  wire [127:0] _dataModule_io_data_wdata_1_T_6 = {io_storeDataIn_1_bits_data[7:0],io_storeDataIn_1_bits_data[7:0],
    io_storeDataIn_1_bits_data[7:0],io_storeDataIn_1_bits_data[7:0],io_storeDataIn_1_bits_data[7:0],
    io_storeDataIn_1_bits_data[7:0],io_storeDataIn_1_bits_data[7:0],io_storeDataIn_1_bits_data[7:0],
    _dataModule_io_data_wdata_1_T_5}; // @[Cat.scala 31:58]
  wire [127:0] _dataModule_io_data_wdata_1_T_10 = {io_storeDataIn_1_bits_data[15:0],io_storeDataIn_1_bits_data[15:0],
    io_storeDataIn_1_bits_data[15:0],io_storeDataIn_1_bits_data[15:0],io_storeDataIn_1_bits_data[15:0],
    io_storeDataIn_1_bits_data[15:0],io_storeDataIn_1_bits_data[15:0],io_storeDataIn_1_bits_data[15:0]}; // @[Cat.scala 31:58]
  wire [127:0] _dataModule_io_data_wdata_1_T_13 = {io_storeDataIn_1_bits_data[31:0],io_storeDataIn_1_bits_data[31:0],
    io_storeDataIn_1_bits_data[31:0],io_storeDataIn_1_bits_data[31:0]}; // @[Cat.scala 31:58]
  wire [127:0] _dataModule_io_data_wdata_1_T_15 = {io_storeDataIn_1_bits_data,io_storeDataIn_1_bits_data}; // @[Cat.scala 31:58]
  wire  _dataModule_io_data_wdata_1_T_16 = 2'h0 == io_storeDataIn_1_bits_uop_ctrl_fuOpType[1:0]; // @[LookupTree.scala 24:34]
  wire  _dataModule_io_data_wdata_1_T_17 = 2'h1 == io_storeDataIn_1_bits_uop_ctrl_fuOpType[1:0]; // @[LookupTree.scala 24:34]
  wire  _dataModule_io_data_wdata_1_T_18 = 2'h2 == io_storeDataIn_1_bits_uop_ctrl_fuOpType[1:0]; // @[LookupTree.scala 24:34]
  wire  _dataModule_io_data_wdata_1_T_19 = 2'h3 == io_storeDataIn_1_bits_uop_ctrl_fuOpType[1:0]; // @[LookupTree.scala 24:34]
  wire [127:0] _dataModule_io_data_wdata_1_T_20 = _dataModule_io_data_wdata_1_T_16 ? _dataModule_io_data_wdata_1_T_6 : 128'h0
    ; // @[Mux.scala 27:73]
  wire [127:0] _dataModule_io_data_wdata_1_T_21 = _dataModule_io_data_wdata_1_T_17 ? _dataModule_io_data_wdata_1_T_10 : 128'h0
    ; // @[Mux.scala 27:73]
  wire [127:0] _dataModule_io_data_wdata_1_T_22 = _dataModule_io_data_wdata_1_T_18 ? _dataModule_io_data_wdata_1_T_13 : 128'h0
    ; // @[Mux.scala 27:73]
  wire [127:0] _dataModule_io_data_wdata_1_T_23 = _dataModule_io_data_wdata_1_T_19 ? _dataModule_io_data_wdata_1_T_15 : 128'h0
    ; // @[Mux.scala 27:73]
  wire [127:0] _dataModule_io_data_wdata_1_T_24 = _dataModule_io_data_wdata_1_T_20 | _dataModule_io_data_wdata_1_T_21; // @[Mux.scala 27:73]
  wire [127:0] _dataModule_io_data_wdata_1_T_25 = _dataModule_io_data_wdata_1_T_24 | _dataModule_io_data_wdata_1_T_22; // @[Mux.scala 27:73]
  wire [127:0] _dataModule_io_data_wdata_1_T_26 = _dataModule_io_data_wdata_1_T_25 | _dataModule_io_data_wdata_1_T_23; // @[Mux.scala 27:73]
  reg  REG_4; // @[StoreQueue.scala 360:14]
  reg [3:0] REG_5; // @[StoreQueue.scala 363:24]
  wire  _GEN_13844 = 4'h0 == REG_5 | _GEN_13805; // @[StoreQueue.scala 363:{37,37}]
  wire  _GEN_13845 = 4'h1 == REG_5 | _GEN_13806; // @[StoreQueue.scala 363:{37,37}]
  wire  _GEN_13846 = 4'h2 == REG_5 | _GEN_13807; // @[StoreQueue.scala 363:{37,37}]
  wire  _GEN_13847 = 4'h3 == REG_5 | _GEN_13808; // @[StoreQueue.scala 363:{37,37}]
  wire  _GEN_13848 = 4'h4 == REG_5 | _GEN_13809; // @[StoreQueue.scala 363:{37,37}]
  wire  _GEN_13849 = 4'h5 == REG_5 | _GEN_13810; // @[StoreQueue.scala 363:{37,37}]
  wire  _GEN_13850 = 4'h6 == REG_5 | _GEN_13811; // @[StoreQueue.scala 363:{37,37}]
  wire  _GEN_13851 = 4'h7 == REG_5 | _GEN_13812; // @[StoreQueue.scala 363:{37,37}]
  wire  _GEN_13852 = 4'h8 == REG_5 | _GEN_13813; // @[StoreQueue.scala 363:{37,37}]
  wire  _GEN_13853 = 4'h9 == REG_5 | _GEN_13814; // @[StoreQueue.scala 363:{37,37}]
  wire  _GEN_13854 = 4'ha == REG_5 | _GEN_13815; // @[StoreQueue.scala 363:{37,37}]
  wire  _GEN_13855 = 4'hb == REG_5 | _GEN_13816; // @[StoreQueue.scala 363:{37,37}]
  wire  differentFlag = deqPtrExt_0_flag != io_forward_0_sqIdx_flag; // @[StoreQueue.scala 393:43]
  wire  addrValidVec__0 = addrvalid_0 & allocated_0; // @[StoreQueue.scala 396:88]
  wire  addrValidVec__1 = addrvalid_1 & allocated_1; // @[StoreQueue.scala 396:88]
  wire  addrValidVec__2 = addrvalid_2 & allocated_2; // @[StoreQueue.scala 396:88]
  wire  addrValidVec__3 = addrvalid_3 & allocated_3; // @[StoreQueue.scala 396:88]
  wire  addrValidVec__4 = addrvalid_4 & allocated_4; // @[StoreQueue.scala 396:88]
  wire  addrValidVec__5 = addrvalid_5 & allocated_5; // @[StoreQueue.scala 396:88]
  wire  addrValidVec__6 = addrvalid_6 & allocated_6; // @[StoreQueue.scala 396:88]
  wire  addrValidVec__7 = addrvalid_7 & allocated_7; // @[StoreQueue.scala 396:88]
  wire  addrValidVec__8 = addrvalid_8 & allocated_8; // @[StoreQueue.scala 396:88]
  wire  addrValidVec__9 = addrvalid_9 & allocated_9; // @[StoreQueue.scala 396:88]
  wire  addrValidVec__10 = addrvalid_10 & allocated_10; // @[StoreQueue.scala 396:88]
  wire  addrValidVec__11 = addrvalid_11 & allocated_11; // @[StoreQueue.scala 396:88]
  wire [5:0] _robMatchVec_T = {uop_0_robIdx_flag,uop_0_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire [5:0] _robMatchVec_T_1 = {io_forward_0_uop_cf_waitForRobIdx_flag,io_forward_0_uop_cf_waitForRobIdx_value}; // @[CircularQueuePtr.scala 61:70]
  wire  _robMatchVec_T_2 = _robMatchVec_T == _robMatchVec_T_1; // @[CircularQueuePtr.scala 61:52]
  wire [5:0] _robMatchVec_T_4 = {uop_1_robIdx_flag,uop_1_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _robMatchVec_T_6 = _robMatchVec_T_4 == _robMatchVec_T_1; // @[CircularQueuePtr.scala 61:52]
  wire [5:0] _robMatchVec_T_8 = {uop_2_robIdx_flag,uop_2_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _robMatchVec_T_10 = _robMatchVec_T_8 == _robMatchVec_T_1; // @[CircularQueuePtr.scala 61:52]
  wire [5:0] _robMatchVec_T_12 = {uop_3_robIdx_flag,uop_3_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _robMatchVec_T_14 = _robMatchVec_T_12 == _robMatchVec_T_1; // @[CircularQueuePtr.scala 61:52]
  wire [5:0] _robMatchVec_T_16 = {uop_4_robIdx_flag,uop_4_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _robMatchVec_T_18 = _robMatchVec_T_16 == _robMatchVec_T_1; // @[CircularQueuePtr.scala 61:52]
  wire [5:0] _robMatchVec_T_20 = {uop_5_robIdx_flag,uop_5_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _robMatchVec_T_22 = _robMatchVec_T_20 == _robMatchVec_T_1; // @[CircularQueuePtr.scala 61:52]
  wire [5:0] _robMatchVec_T_24 = {uop_6_robIdx_flag,uop_6_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _robMatchVec_T_26 = _robMatchVec_T_24 == _robMatchVec_T_1; // @[CircularQueuePtr.scala 61:52]
  wire [5:0] _robMatchVec_T_28 = {uop_7_robIdx_flag,uop_7_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _robMatchVec_T_30 = _robMatchVec_T_28 == _robMatchVec_T_1; // @[CircularQueuePtr.scala 61:52]
  wire [5:0] _robMatchVec_T_32 = {uop_8_robIdx_flag,uop_8_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _robMatchVec_T_34 = _robMatchVec_T_32 == _robMatchVec_T_1; // @[CircularQueuePtr.scala 61:52]
  wire [5:0] _robMatchVec_T_36 = {uop_9_robIdx_flag,uop_9_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _robMatchVec_T_38 = _robMatchVec_T_36 == _robMatchVec_T_1; // @[CircularQueuePtr.scala 61:52]
  wire [5:0] _robMatchVec_T_40 = {uop_10_robIdx_flag,uop_10_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _robMatchVec_T_42 = _robMatchVec_T_40 == _robMatchVec_T_1; // @[CircularQueuePtr.scala 61:52]
  wire [5:0] _robMatchVec_T_44 = {uop_11_robIdx_flag,uop_11_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _robMatchVec_T_46 = _robMatchVec_T_44 == _robMatchVec_T_1; // @[CircularQueuePtr.scala 61:52]
  reg  robMatchVec__0; // @[StoreQueue.scala 398:30]
  reg  robMatchVec__1; // @[StoreQueue.scala 398:30]
  reg  robMatchVec__2; // @[StoreQueue.scala 398:30]
  reg  robMatchVec__3; // @[StoreQueue.scala 398:30]
  reg  robMatchVec__4; // @[StoreQueue.scala 398:30]
  reg  robMatchVec__5; // @[StoreQueue.scala 398:30]
  reg  robMatchVec__6; // @[StoreQueue.scala 398:30]
  reg  robMatchVec__7; // @[StoreQueue.scala 398:30]
  reg  robMatchVec__8; // @[StoreQueue.scala 398:30]
  reg  robMatchVec__9; // @[StoreQueue.scala 398:30]
  reg  robMatchVec__10; // @[StoreQueue.scala 398:30]
  reg  robMatchVec__11; // @[StoreQueue.scala 398:30]
  wire  allValidVec__0 = allvalid_0 & allocated_0; // @[StoreQueue.scala 399:103]
  wire  allValidVec__1 = allvalid_1 & allocated_1; // @[StoreQueue.scala 399:103]
  wire  allValidVec__2 = allvalid_2 & allocated_2; // @[StoreQueue.scala 399:103]
  wire  allValidVec__3 = allvalid_3 & allocated_3; // @[StoreQueue.scala 399:103]
  wire  allValidVec__4 = allvalid_4 & allocated_4; // @[StoreQueue.scala 399:103]
  wire  allValidVec__5 = allvalid_5 & allocated_5; // @[StoreQueue.scala 399:103]
  wire  allValidVec__6 = allvalid_6 & allocated_6; // @[StoreQueue.scala 399:103]
  wire  allValidVec__7 = allvalid_7 & allocated_7; // @[StoreQueue.scala 399:103]
  wire  allValidVec__8 = allvalid_8 & allocated_8; // @[StoreQueue.scala 399:103]
  wire  allValidVec__9 = allvalid_9 & allocated_9; // @[StoreQueue.scala 399:103]
  wire  allValidVec__10 = allvalid_10 & allocated_10; // @[StoreQueue.scala 399:103]
  wire  allValidVec__11 = allvalid_11 & allocated_11; // @[StoreQueue.scala 399:103]
  wire [11:0] _canForward1_T = ~deqMask; // @[StoreQueue.scala 400:42]
  wire [11:0] _canForward1_T_1 = deqMask ^ io_forward_0_sqIdxMask; // @[StoreQueue.scala 400:60]
  wire [11:0] _canForward1_T_2 = differentFlag ? _canForward1_T : _canForward1_T_1; // @[StoreQueue.scala 400:26]
  wire [5:0] canForward1_lo = {allValidVec__5,allValidVec__4,allValidVec__3,allValidVec__2,allValidVec__1,allValidVec__0
    }; // @[StoreQueue.scala 400:89]
  wire [11:0] _canForward1_T_3 = {allValidVec__11,allValidVec__10,allValidVec__9,allValidVec__8,allValidVec__7,
    allValidVec__6,canForward1_lo}; // @[StoreQueue.scala 400:89]
  wire [11:0] canForward1 = _canForward1_T_2 & _canForward1_T_3; // @[StoreQueue.scala 400:75]
  wire [11:0] _canForward2_T = differentFlag ? io_forward_0_sqIdxMask : 12'h0; // @[StoreQueue.scala 401:26]
  wire [11:0] canForward2 = _canForward2_T & _canForward1_T_3; // @[StoreQueue.scala 401:78]
  wire [11:0] _needForward_T_1 = _canForward1_T | io_forward_0_sqIdxMask; // @[StoreQueue.scala 402:51]
  wire [11:0] needForward = differentFlag ? _needForward_T_1 : _canForward1_T_1; // @[StoreQueue.scala 402:26]
  wire [5:0] dataModule_io_needForward_0_0_lo = {vaddrModule_io_forwardMmask_0_5,vaddrModule_io_forwardMmask_0_4,
    vaddrModule_io_forwardMmask_0_3,vaddrModule_io_forwardMmask_0_2,vaddrModule_io_forwardMmask_0_1,
    vaddrModule_io_forwardMmask_0_0}; // @[StoreQueue.scala 409:85]
  wire [5:0] dataModule_io_needForward_0_0_hi = {vaddrModule_io_forwardMmask_0_11,vaddrModule_io_forwardMmask_0_10,
    vaddrModule_io_forwardMmask_0_9,vaddrModule_io_forwardMmask_0_8,vaddrModule_io_forwardMmask_0_7,
    vaddrModule_io_forwardMmask_0_6}; // @[StoreQueue.scala 409:85]
  wire [11:0] _dataModule_io_needForward_0_0_T = {vaddrModule_io_forwardMmask_0_11,vaddrModule_io_forwardMmask_0_10,
    vaddrModule_io_forwardMmask_0_9,vaddrModule_io_forwardMmask_0_8,vaddrModule_io_forwardMmask_0_7,
    vaddrModule_io_forwardMmask_0_6,dataModule_io_needForward_0_0_lo}; // @[StoreQueue.scala 409:85]
  wire [11:0] _dataModule_io_needForward_0_0_T_1 = canForward1 & _dataModule_io_needForward_0_0_T; // @[StoreQueue.scala 409:52]
  wire [5:0] dataModule_io_needForward_0_0_lo_1 = {tosbuffer_5,tosbuffer_4,tosbuffer_3,tosbuffer_2,tosbuffer_1,
    tosbuffer_0}; // @[StoreQueue.scala 409:105]
  wire [11:0] _dataModule_io_needForward_0_0_T_2 = {tosbuffer_11,tosbuffer_10,tosbuffer_9,tosbuffer_8,tosbuffer_7,
    tosbuffer_6,dataModule_io_needForward_0_0_lo_1}; // @[StoreQueue.scala 409:105]
  wire [11:0] _dataModule_io_needForward_0_0_T_3 = ~_dataModule_io_needForward_0_0_T_2; // @[StoreQueue.scala 409:94]
  wire [11:0] _dataModule_io_needForward_0_1_T_1 = canForward2 & _dataModule_io_needForward_0_0_T; // @[StoreQueue.scala 410:52]
  wire [5:0] vpmaskNotEqual_lo = {paddrModule_io_forwardMmask_0_5,paddrModule_io_forwardMmask_0_4,
    paddrModule_io_forwardMmask_0_3,paddrModule_io_forwardMmask_0_2,paddrModule_io_forwardMmask_0_1,
    paddrModule_io_forwardMmask_0_0}; // @[StoreQueue.scala 420:47]
  wire [5:0] vpmaskNotEqual_hi = {paddrModule_io_forwardMmask_0_11,paddrModule_io_forwardMmask_0_10,
    paddrModule_io_forwardMmask_0_9,paddrModule_io_forwardMmask_0_8,paddrModule_io_forwardMmask_0_7,
    paddrModule_io_forwardMmask_0_6}; // @[StoreQueue.scala 420:47]
  reg [11:0] vpmaskNotEqual_REG; // @[StoreQueue.scala 420:15]
  reg [11:0] vpmaskNotEqual_REG_1; // @[StoreQueue.scala 420:64]
  wire [11:0] _vpmaskNotEqual_T_2 = vpmaskNotEqual_REG ^ vpmaskNotEqual_REG_1; // @[StoreQueue.scala 420:55]
  reg [11:0] vpmaskNotEqual_REG_2; // @[StoreQueue.scala 421:14]
  wire [11:0] _vpmaskNotEqual_T_3 = _vpmaskNotEqual_T_2 & vpmaskNotEqual_REG_2; // @[StoreQueue.scala 420:105]
  wire [5:0] vpmaskNotEqual_lo_2 = {addrValidVec__5,addrValidVec__4,addrValidVec__3,addrValidVec__2,addrValidVec__1,
    addrValidVec__0}; // @[StoreQueue.scala 422:28]
  wire [5:0] vpmaskNotEqual_hi_2 = {addrValidVec__11,addrValidVec__10,addrValidVec__9,addrValidVec__8,addrValidVec__7,
    addrValidVec__6}; // @[StoreQueue.scala 422:28]
  wire [11:0] _vpmaskNotEqual_T_4 = {addrValidVec__11,addrValidVec__10,addrValidVec__9,addrValidVec__8,addrValidVec__7,
    addrValidVec__6,vpmaskNotEqual_lo_2}; // @[StoreQueue.scala 422:28]
  reg [11:0] vpmaskNotEqual_REG_3; // @[StoreQueue.scala 422:14]
  wire [11:0] _vpmaskNotEqual_T_5 = _vpmaskNotEqual_T_3 & vpmaskNotEqual_REG_3; // @[StoreQueue.scala 421:28]
  wire  vpmaskNotEqual = _vpmaskNotEqual_T_5 != 12'h0; // @[StoreQueue.scala 423:7]
  reg  vaddrMatchFailed_REG; // @[StoreQueue.scala 424:53]
  wire [5:0] dataInvalidMask_lo_1 = {datavalid_5,datavalid_4,datavalid_3,datavalid_2,datavalid_1,datavalid_0}; // @[StoreQueue.scala 444:66]
  wire [11:0] _dataInvalidMask_T_1 = {datavalid_11,datavalid_10,datavalid_9,datavalid_8,datavalid_7,datavalid_6,
    dataInvalidMask_lo_1}; // @[StoreQueue.scala 444:66]
  wire [11:0] _dataInvalidMask_T_2 = ~_dataInvalidMask_T_1; // @[StoreQueue.scala 444:52]
  wire [11:0] _dataInvalidMask_T_3 = _vpmaskNotEqual_T_4 & _dataInvalidMask_T_2; // @[StoreQueue.scala 444:50]
  wire [11:0] _dataInvalidMask_T_5 = _dataInvalidMask_T_3 | _dataModule_io_needForward_0_0_T_2; // @[StoreQueue.scala 444:74]
  wire [11:0] _dataInvalidMask_T_7 = _dataInvalidMask_T_5 & _dataModule_io_needForward_0_0_T; // @[StoreQueue.scala 444:94]
  wire [11:0] dataInvalidMask = _dataInvalidMask_T_7 & needForward; // @[StoreQueue.scala 444:134]
  reg [11:0] dataInvalidMaskReg; // @[StoreQueue.scala 446:37]
  reg  io_forward_0_dataInvalid_REG; // @[StoreQueue.scala 448:41]
  reg  s2_differentFlag; // @[StoreQueue.scala 455:35]
  reg  s2_enqPtrExt_flag; // @[StoreQueue.scala 456:31]
  reg  s2_deqPtrExt_flag; // @[StoreQueue.scala 457:31]
  reg [3:0] s2_deqPtrExt_value; // @[StoreQueue.scala 457:31]
  wire [3:0] _dataInvalidSqIdx_T_12 = dataInvalidMaskReg[10] ? 4'ha : 4'hb; // @[Mux.scala 47:70]
  wire [3:0] _dataInvalidSqIdx_T_13 = dataInvalidMaskReg[9] ? 4'h9 : _dataInvalidSqIdx_T_12; // @[Mux.scala 47:70]
  wire [3:0] _dataInvalidSqIdx_T_14 = dataInvalidMaskReg[8] ? 4'h8 : _dataInvalidSqIdx_T_13; // @[Mux.scala 47:70]
  wire [3:0] _dataInvalidSqIdx_T_15 = dataInvalidMaskReg[7] ? 4'h7 : _dataInvalidSqIdx_T_14; // @[Mux.scala 47:70]
  wire [3:0] _dataInvalidSqIdx_T_16 = dataInvalidMaskReg[6] ? 4'h6 : _dataInvalidSqIdx_T_15; // @[Mux.scala 47:70]
  wire [3:0] _dataInvalidSqIdx_T_17 = dataInvalidMaskReg[5] ? 4'h5 : _dataInvalidSqIdx_T_16; // @[Mux.scala 47:70]
  wire [3:0] _dataInvalidSqIdx_T_18 = dataInvalidMaskReg[4] ? 4'h4 : _dataInvalidSqIdx_T_17; // @[Mux.scala 47:70]
  wire [3:0] _dataInvalidSqIdx_T_19 = dataInvalidMaskReg[3] ? 4'h3 : _dataInvalidSqIdx_T_18; // @[Mux.scala 47:70]
  wire [3:0] _dataInvalidSqIdx_T_20 = dataInvalidMaskReg[2] ? 4'h2 : _dataInvalidSqIdx_T_19; // @[Mux.scala 47:70]
  wire [3:0] _dataInvalidSqIdx_T_21 = dataInvalidMaskReg[1] ? 4'h1 : _dataInvalidSqIdx_T_20; // @[Mux.scala 47:70]
  wire [3:0] dataInvalidSqIdx = dataInvalidMaskReg[0] ? 4'h0 : _dataInvalidSqIdx_T_21; // @[Mux.scala 47:70]
  wire  _io_forward_0_dataInvalidSqIdx_flag_T = ~s2_differentFlag; // @[StoreQueue.scala 465:50]
  wire  _io_forward_0_dataInvalidSqIdx_flag_T_3 = ~s2_differentFlag | dataInvalidSqIdx >= s2_deqPtrExt_value ?
    s2_deqPtrExt_flag : s2_enqPtrExt_flag; // @[StoreQueue.scala 465:49]
  reg  io_forward_0_dataInvalidSqIdx_REG_flag; // @[StoreQueue.scala 469:48]
  reg [3:0] io_forward_0_dataInvalidSqIdx_REG_value; // @[StoreQueue.scala 469:48]
  wire [5:0] addrInvalidSqIdx_lo = {robMatchVec__5,robMatchVec__4,robMatchVec__3,robMatchVec__2,robMatchVec__1,
    robMatchVec__0}; // @[StoreQueue.scala 473:56]
  wire [11:0] _addrInvalidSqIdx_T = {robMatchVec__11,robMatchVec__10,robMatchVec__9,robMatchVec__8,robMatchVec__7,
    robMatchVec__6,addrInvalidSqIdx_lo}; // @[StoreQueue.scala 473:56]
  wire [3:0] _addrInvalidSqIdx_T_13 = _addrInvalidSqIdx_T[10] ? 4'ha : 4'hb; // @[Mux.scala 47:70]
  wire [3:0] _addrInvalidSqIdx_T_14 = _addrInvalidSqIdx_T[9] ? 4'h9 : _addrInvalidSqIdx_T_13; // @[Mux.scala 47:70]
  wire [3:0] _addrInvalidSqIdx_T_15 = _addrInvalidSqIdx_T[8] ? 4'h8 : _addrInvalidSqIdx_T_14; // @[Mux.scala 47:70]
  wire [3:0] _addrInvalidSqIdx_T_16 = _addrInvalidSqIdx_T[7] ? 4'h7 : _addrInvalidSqIdx_T_15; // @[Mux.scala 47:70]
  wire [3:0] _addrInvalidSqIdx_T_17 = _addrInvalidSqIdx_T[6] ? 4'h6 : _addrInvalidSqIdx_T_16; // @[Mux.scala 47:70]
  wire [3:0] _addrInvalidSqIdx_T_18 = _addrInvalidSqIdx_T[5] ? 4'h5 : _addrInvalidSqIdx_T_17; // @[Mux.scala 47:70]
  wire [3:0] _addrInvalidSqIdx_T_19 = _addrInvalidSqIdx_T[4] ? 4'h4 : _addrInvalidSqIdx_T_18; // @[Mux.scala 47:70]
  wire [3:0] _addrInvalidSqIdx_T_20 = _addrInvalidSqIdx_T[3] ? 4'h3 : _addrInvalidSqIdx_T_19; // @[Mux.scala 47:70]
  wire [3:0] _addrInvalidSqIdx_T_21 = _addrInvalidSqIdx_T[2] ? 4'h2 : _addrInvalidSqIdx_T_20; // @[Mux.scala 47:70]
  wire [3:0] _addrInvalidSqIdx_T_22 = _addrInvalidSqIdx_T[1] ? 4'h1 : _addrInvalidSqIdx_T_21; // @[Mux.scala 47:70]
  wire [3:0] addrInvalidSqIdx = _addrInvalidSqIdx_T[0] ? 4'h0 : _addrInvalidSqIdx_T_22; // @[Mux.scala 47:70]
  wire  _io_forward_0_addrInvalidSqIdx_flag_T_3 = _io_forward_0_dataInvalidSqIdx_flag_T | addrInvalidSqIdx >=
    s2_deqPtrExt_value ? s2_deqPtrExt_flag : s2_enqPtrExt_flag; // @[StoreQueue.scala 475:49]
  reg  io_forward_0_addrInvalidSqIdx_REG_flag; // @[StoreQueue.scala 479:48]
  reg [3:0] io_forward_0_addrInvalidSqIdx_REG_value; // @[StoreQueue.scala 479:48]
  reg [11:0] io_forward_0_schedWait_REG; // @[StoreQueue.scala 484:15]
  reg [11:0] io_forward_0_schedWait_REG_1; // @[StoreQueue.scala 484:64]
  wire [11:0] _io_forward_0_schedWait_T_2 = io_forward_0_schedWait_REG & io_forward_0_schedWait_REG_1; // @[StoreQueue.scala 484:55]
  reg [11:0] io_forward_0_schedWait_REG_2; // @[StoreQueue.scala 485:14]
  wire [11:0] _io_forward_0_schedWait_T_3 = _io_forward_0_schedWait_T_2 & io_forward_0_schedWait_REG_2; // @[StoreQueue.scala 484:105]
  reg [11:0] io_forward_0_schedWait_REG_3; // @[StoreQueue.scala 486:14]
  wire [11:0] _io_forward_0_schedWait_T_5 = _io_forward_0_schedWait_T_3 & io_forward_0_schedWait_REG_3; // @[StoreQueue.scala 485:28]
  wire [11:0] _io_forward_0_schedWait_T_7 = _io_forward_0_schedWait_T_5 & _addrInvalidSqIdx_T; // @[StoreQueue.scala 486:36]
  wire  differentFlag_1 = deqPtrExt_0_flag != io_forward_1_sqIdx_flag; // @[StoreQueue.scala 393:43]
  wire [5:0] _robMatchVec_T_49 = {io_forward_1_uop_cf_waitForRobIdx_flag,io_forward_1_uop_cf_waitForRobIdx_value}; // @[CircularQueuePtr.scala 61:70]
  wire  _robMatchVec_T_50 = _robMatchVec_T == _robMatchVec_T_49; // @[CircularQueuePtr.scala 61:52]
  wire  _robMatchVec_T_54 = _robMatchVec_T_4 == _robMatchVec_T_49; // @[CircularQueuePtr.scala 61:52]
  wire  _robMatchVec_T_58 = _robMatchVec_T_8 == _robMatchVec_T_49; // @[CircularQueuePtr.scala 61:52]
  wire  _robMatchVec_T_62 = _robMatchVec_T_12 == _robMatchVec_T_49; // @[CircularQueuePtr.scala 61:52]
  wire  _robMatchVec_T_66 = _robMatchVec_T_16 == _robMatchVec_T_49; // @[CircularQueuePtr.scala 61:52]
  wire  _robMatchVec_T_70 = _robMatchVec_T_20 == _robMatchVec_T_49; // @[CircularQueuePtr.scala 61:52]
  wire  _robMatchVec_T_74 = _robMatchVec_T_24 == _robMatchVec_T_49; // @[CircularQueuePtr.scala 61:52]
  wire  _robMatchVec_T_78 = _robMatchVec_T_28 == _robMatchVec_T_49; // @[CircularQueuePtr.scala 61:52]
  wire  _robMatchVec_T_82 = _robMatchVec_T_32 == _robMatchVec_T_49; // @[CircularQueuePtr.scala 61:52]
  wire  _robMatchVec_T_86 = _robMatchVec_T_36 == _robMatchVec_T_49; // @[CircularQueuePtr.scala 61:52]
  wire  _robMatchVec_T_90 = _robMatchVec_T_40 == _robMatchVec_T_49; // @[CircularQueuePtr.scala 61:52]
  wire  _robMatchVec_T_94 = _robMatchVec_T_44 == _robMatchVec_T_49; // @[CircularQueuePtr.scala 61:52]
  reg  robMatchVec_1_0; // @[StoreQueue.scala 398:30]
  reg  robMatchVec_1_1; // @[StoreQueue.scala 398:30]
  reg  robMatchVec_1_2; // @[StoreQueue.scala 398:30]
  reg  robMatchVec_1_3; // @[StoreQueue.scala 398:30]
  reg  robMatchVec_1_4; // @[StoreQueue.scala 398:30]
  reg  robMatchVec_1_5; // @[StoreQueue.scala 398:30]
  reg  robMatchVec_1_6; // @[StoreQueue.scala 398:30]
  reg  robMatchVec_1_7; // @[StoreQueue.scala 398:30]
  reg  robMatchVec_1_8; // @[StoreQueue.scala 398:30]
  reg  robMatchVec_1_9; // @[StoreQueue.scala 398:30]
  reg  robMatchVec_1_10; // @[StoreQueue.scala 398:30]
  reg  robMatchVec_1_11; // @[StoreQueue.scala 398:30]
  wire [11:0] _canForward1_T_5 = deqMask ^ io_forward_1_sqIdxMask; // @[StoreQueue.scala 400:60]
  wire [11:0] _canForward1_T_6 = differentFlag_1 ? _canForward1_T : _canForward1_T_5; // @[StoreQueue.scala 400:26]
  wire [11:0] canForward1_1 = _canForward1_T_6 & _canForward1_T_3; // @[StoreQueue.scala 400:75]
  wire [11:0] _canForward2_T_2 = differentFlag_1 ? io_forward_1_sqIdxMask : 12'h0; // @[StoreQueue.scala 401:26]
  wire [11:0] canForward2_1 = _canForward2_T_2 & _canForward1_T_3; // @[StoreQueue.scala 401:78]
  wire [11:0] _needForward_T_4 = _canForward1_T | io_forward_1_sqIdxMask; // @[StoreQueue.scala 402:51]
  wire [11:0] needForward_1 = differentFlag_1 ? _needForward_T_4 : _canForward1_T_5; // @[StoreQueue.scala 402:26]
  wire [5:0] dataModule_io_needForward_1_0_lo = {vaddrModule_io_forwardMmask_1_5,vaddrModule_io_forwardMmask_1_4,
    vaddrModule_io_forwardMmask_1_3,vaddrModule_io_forwardMmask_1_2,vaddrModule_io_forwardMmask_1_1,
    vaddrModule_io_forwardMmask_1_0}; // @[StoreQueue.scala 409:85]
  wire [5:0] dataModule_io_needForward_1_0_hi = {vaddrModule_io_forwardMmask_1_11,vaddrModule_io_forwardMmask_1_10,
    vaddrModule_io_forwardMmask_1_9,vaddrModule_io_forwardMmask_1_8,vaddrModule_io_forwardMmask_1_7,
    vaddrModule_io_forwardMmask_1_6}; // @[StoreQueue.scala 409:85]
  wire [11:0] _dataModule_io_needForward_1_0_T = {vaddrModule_io_forwardMmask_1_11,vaddrModule_io_forwardMmask_1_10,
    vaddrModule_io_forwardMmask_1_9,vaddrModule_io_forwardMmask_1_8,vaddrModule_io_forwardMmask_1_7,
    vaddrModule_io_forwardMmask_1_6,dataModule_io_needForward_1_0_lo}; // @[StoreQueue.scala 409:85]
  wire [11:0] _dataModule_io_needForward_1_0_T_1 = canForward1_1 & _dataModule_io_needForward_1_0_T; // @[StoreQueue.scala 409:52]
  wire [11:0] _dataModule_io_needForward_1_1_T_1 = canForward2_1 & _dataModule_io_needForward_1_0_T; // @[StoreQueue.scala 410:52]
  wire [5:0] vpmaskNotEqual_lo_3 = {paddrModule_io_forwardMmask_1_5,paddrModule_io_forwardMmask_1_4,
    paddrModule_io_forwardMmask_1_3,paddrModule_io_forwardMmask_1_2,paddrModule_io_forwardMmask_1_1,
    paddrModule_io_forwardMmask_1_0}; // @[StoreQueue.scala 420:47]
  wire [5:0] vpmaskNotEqual_hi_3 = {paddrModule_io_forwardMmask_1_11,paddrModule_io_forwardMmask_1_10,
    paddrModule_io_forwardMmask_1_9,paddrModule_io_forwardMmask_1_8,paddrModule_io_forwardMmask_1_7,
    paddrModule_io_forwardMmask_1_6}; // @[StoreQueue.scala 420:47]
  reg [11:0] vpmaskNotEqual_REG_4; // @[StoreQueue.scala 420:15]
  reg [11:0] vpmaskNotEqual_REG_5; // @[StoreQueue.scala 420:64]
  wire [11:0] _vpmaskNotEqual_T_8 = vpmaskNotEqual_REG_4 ^ vpmaskNotEqual_REG_5; // @[StoreQueue.scala 420:55]
  reg [11:0] vpmaskNotEqual_REG_6; // @[StoreQueue.scala 421:14]
  wire [11:0] _vpmaskNotEqual_T_9 = _vpmaskNotEqual_T_8 & vpmaskNotEqual_REG_6; // @[StoreQueue.scala 420:105]
  reg [11:0] vpmaskNotEqual_REG_7; // @[StoreQueue.scala 422:14]
  wire [11:0] _vpmaskNotEqual_T_11 = _vpmaskNotEqual_T_9 & vpmaskNotEqual_REG_7; // @[StoreQueue.scala 421:28]
  wire  vpmaskNotEqual_1 = _vpmaskNotEqual_T_11 != 12'h0; // @[StoreQueue.scala 423:7]
  reg  vaddrMatchFailed_REG_1; // @[StoreQueue.scala 424:53]
  wire [11:0] _dataInvalidMask_T_15 = _dataInvalidMask_T_5 & _dataModule_io_needForward_1_0_T; // @[StoreQueue.scala 444:94]
  wire [11:0] dataInvalidMask_1 = _dataInvalidMask_T_15 & needForward_1; // @[StoreQueue.scala 444:134]
  reg [11:0] dataInvalidMaskReg_1; // @[StoreQueue.scala 446:37]
  reg  io_forward_1_dataInvalid_REG; // @[StoreQueue.scala 448:41]
  reg  s2_differentFlag_1; // @[StoreQueue.scala 455:35]
  reg  s2_enqPtrExt_1_flag; // @[StoreQueue.scala 456:31]
  reg  s2_deqPtrExt_1_flag; // @[StoreQueue.scala 457:31]
  reg [3:0] s2_deqPtrExt_1_value; // @[StoreQueue.scala 457:31]
  wire [3:0] _dataInvalidSqIdx_T_34 = dataInvalidMaskReg_1[10] ? 4'ha : 4'hb; // @[Mux.scala 47:70]
  wire [3:0] _dataInvalidSqIdx_T_35 = dataInvalidMaskReg_1[9] ? 4'h9 : _dataInvalidSqIdx_T_34; // @[Mux.scala 47:70]
  wire [3:0] _dataInvalidSqIdx_T_36 = dataInvalidMaskReg_1[8] ? 4'h8 : _dataInvalidSqIdx_T_35; // @[Mux.scala 47:70]
  wire [3:0] _dataInvalidSqIdx_T_37 = dataInvalidMaskReg_1[7] ? 4'h7 : _dataInvalidSqIdx_T_36; // @[Mux.scala 47:70]
  wire [3:0] _dataInvalidSqIdx_T_38 = dataInvalidMaskReg_1[6] ? 4'h6 : _dataInvalidSqIdx_T_37; // @[Mux.scala 47:70]
  wire [3:0] _dataInvalidSqIdx_T_39 = dataInvalidMaskReg_1[5] ? 4'h5 : _dataInvalidSqIdx_T_38; // @[Mux.scala 47:70]
  wire [3:0] _dataInvalidSqIdx_T_40 = dataInvalidMaskReg_1[4] ? 4'h4 : _dataInvalidSqIdx_T_39; // @[Mux.scala 47:70]
  wire [3:0] _dataInvalidSqIdx_T_41 = dataInvalidMaskReg_1[3] ? 4'h3 : _dataInvalidSqIdx_T_40; // @[Mux.scala 47:70]
  wire [3:0] _dataInvalidSqIdx_T_42 = dataInvalidMaskReg_1[2] ? 4'h2 : _dataInvalidSqIdx_T_41; // @[Mux.scala 47:70]
  wire [3:0] _dataInvalidSqIdx_T_43 = dataInvalidMaskReg_1[1] ? 4'h1 : _dataInvalidSqIdx_T_42; // @[Mux.scala 47:70]
  wire [3:0] dataInvalidSqIdx_1 = dataInvalidMaskReg_1[0] ? 4'h0 : _dataInvalidSqIdx_T_43; // @[Mux.scala 47:70]
  wire  _io_forward_1_dataInvalidSqIdx_flag_T = ~s2_differentFlag_1; // @[StoreQueue.scala 465:50]
  wire  _io_forward_1_dataInvalidSqIdx_flag_T_3 = ~s2_differentFlag_1 | dataInvalidSqIdx_1 >= s2_deqPtrExt_1_value ?
    s2_deqPtrExt_1_flag : s2_enqPtrExt_1_flag; // @[StoreQueue.scala 465:49]
  reg  io_forward_1_dataInvalidSqIdx_REG_flag; // @[StoreQueue.scala 469:48]
  reg [3:0] io_forward_1_dataInvalidSqIdx_REG_value; // @[StoreQueue.scala 469:48]
  wire [5:0] addrInvalidSqIdx_lo_1 = {robMatchVec_1_5,robMatchVec_1_4,robMatchVec_1_3,robMatchVec_1_2,robMatchVec_1_1,
    robMatchVec_1_0}; // @[StoreQueue.scala 473:56]
  wire [11:0] _addrInvalidSqIdx_T_23 = {robMatchVec_1_11,robMatchVec_1_10,robMatchVec_1_9,robMatchVec_1_8,
    robMatchVec_1_7,robMatchVec_1_6,addrInvalidSqIdx_lo_1}; // @[StoreQueue.scala 473:56]
  wire [3:0] _addrInvalidSqIdx_T_36 = _addrInvalidSqIdx_T_23[10] ? 4'ha : 4'hb; // @[Mux.scala 47:70]
  wire [3:0] _addrInvalidSqIdx_T_37 = _addrInvalidSqIdx_T_23[9] ? 4'h9 : _addrInvalidSqIdx_T_36; // @[Mux.scala 47:70]
  wire [3:0] _addrInvalidSqIdx_T_38 = _addrInvalidSqIdx_T_23[8] ? 4'h8 : _addrInvalidSqIdx_T_37; // @[Mux.scala 47:70]
  wire [3:0] _addrInvalidSqIdx_T_39 = _addrInvalidSqIdx_T_23[7] ? 4'h7 : _addrInvalidSqIdx_T_38; // @[Mux.scala 47:70]
  wire [3:0] _addrInvalidSqIdx_T_40 = _addrInvalidSqIdx_T_23[6] ? 4'h6 : _addrInvalidSqIdx_T_39; // @[Mux.scala 47:70]
  wire [3:0] _addrInvalidSqIdx_T_41 = _addrInvalidSqIdx_T_23[5] ? 4'h5 : _addrInvalidSqIdx_T_40; // @[Mux.scala 47:70]
  wire [3:0] _addrInvalidSqIdx_T_42 = _addrInvalidSqIdx_T_23[4] ? 4'h4 : _addrInvalidSqIdx_T_41; // @[Mux.scala 47:70]
  wire [3:0] _addrInvalidSqIdx_T_43 = _addrInvalidSqIdx_T_23[3] ? 4'h3 : _addrInvalidSqIdx_T_42; // @[Mux.scala 47:70]
  wire [3:0] _addrInvalidSqIdx_T_44 = _addrInvalidSqIdx_T_23[2] ? 4'h2 : _addrInvalidSqIdx_T_43; // @[Mux.scala 47:70]
  wire [3:0] _addrInvalidSqIdx_T_45 = _addrInvalidSqIdx_T_23[1] ? 4'h1 : _addrInvalidSqIdx_T_44; // @[Mux.scala 47:70]
  wire [3:0] addrInvalidSqIdx_1 = _addrInvalidSqIdx_T_23[0] ? 4'h0 : _addrInvalidSqIdx_T_45; // @[Mux.scala 47:70]
  wire  _io_forward_1_addrInvalidSqIdx_flag_T_3 = _io_forward_1_dataInvalidSqIdx_flag_T | addrInvalidSqIdx_1 >=
    s2_deqPtrExt_1_value ? s2_deqPtrExt_1_flag : s2_enqPtrExt_1_flag; // @[StoreQueue.scala 475:49]
  reg  io_forward_1_addrInvalidSqIdx_REG_flag; // @[StoreQueue.scala 479:48]
  reg [3:0] io_forward_1_addrInvalidSqIdx_REG_value; // @[StoreQueue.scala 479:48]
  reg [11:0] io_forward_1_schedWait_REG; // @[StoreQueue.scala 484:15]
  reg [11:0] io_forward_1_schedWait_REG_1; // @[StoreQueue.scala 484:64]
  wire [11:0] _io_forward_1_schedWait_T_2 = io_forward_1_schedWait_REG & io_forward_1_schedWait_REG_1; // @[StoreQueue.scala 484:55]
  reg [11:0] io_forward_1_schedWait_REG_2; // @[StoreQueue.scala 485:14]
  wire [11:0] _io_forward_1_schedWait_T_3 = _io_forward_1_schedWait_T_2 & io_forward_1_schedWait_REG_2; // @[StoreQueue.scala 484:105]
  reg [11:0] io_forward_1_schedWait_REG_3; // @[StoreQueue.scala 486:14]
  wire [11:0] _io_forward_1_schedWait_T_5 = _io_forward_1_schedWait_T_3 & io_forward_1_schedWait_REG_3; // @[StoreQueue.scala 485:28]
  wire [11:0] _io_forward_1_schedWait_T_7 = _io_forward_1_schedWait_T_5 & _addrInvalidSqIdx_T_23; // @[StoreQueue.scala 486:36]
  reg [2:0] uncacheState; // @[StoreQueue.scala 506:29]
  wire  _GEN_13883 = 4'h1 == deqPtrExt_0_value ? pending_1 : pending_0; // @[StoreQueue.scala 509:{37,37}]
  wire  _GEN_13884 = 4'h2 == deqPtrExt_0_value ? pending_2 : _GEN_13883; // @[StoreQueue.scala 509:{37,37}]
  wire  _GEN_13885 = 4'h3 == deqPtrExt_0_value ? pending_3 : _GEN_13884; // @[StoreQueue.scala 509:{37,37}]
  wire  _GEN_13886 = 4'h4 == deqPtrExt_0_value ? pending_4 : _GEN_13885; // @[StoreQueue.scala 509:{37,37}]
  wire  _GEN_13887 = 4'h5 == deqPtrExt_0_value ? pending_5 : _GEN_13886; // @[StoreQueue.scala 509:{37,37}]
  wire  _GEN_13888 = 4'h6 == deqPtrExt_0_value ? pending_6 : _GEN_13887; // @[StoreQueue.scala 509:{37,37}]
  wire  _GEN_13889 = 4'h7 == deqPtrExt_0_value ? pending_7 : _GEN_13888; // @[StoreQueue.scala 509:{37,37}]
  wire  _GEN_13890 = 4'h8 == deqPtrExt_0_value ? pending_8 : _GEN_13889; // @[StoreQueue.scala 509:{37,37}]
  wire  _GEN_13891 = 4'h9 == deqPtrExt_0_value ? pending_9 : _GEN_13890; // @[StoreQueue.scala 509:{37,37}]
  wire  _GEN_13892 = 4'ha == deqPtrExt_0_value ? pending_10 : _GEN_13891; // @[StoreQueue.scala 509:{37,37}]
  wire  _GEN_13893 = 4'hb == deqPtrExt_0_value ? pending_11 : _GEN_13892; // @[StoreQueue.scala 509:{37,37}]
  wire  _GEN_13895 = 4'h1 == deqPtrExt_0_value ? allocated_1 : allocated_0; // @[StoreQueue.scala 509:{56,56}]
  wire  _GEN_13896 = 4'h2 == deqPtrExt_0_value ? allocated_2 : _GEN_13895; // @[StoreQueue.scala 509:{56,56}]
  wire  _GEN_13897 = 4'h3 == deqPtrExt_0_value ? allocated_3 : _GEN_13896; // @[StoreQueue.scala 509:{56,56}]
  wire  _GEN_13898 = 4'h4 == deqPtrExt_0_value ? allocated_4 : _GEN_13897; // @[StoreQueue.scala 509:{56,56}]
  wire  _GEN_13899 = 4'h5 == deqPtrExt_0_value ? allocated_5 : _GEN_13898; // @[StoreQueue.scala 509:{56,56}]
  wire  _GEN_13900 = 4'h6 == deqPtrExt_0_value ? allocated_6 : _GEN_13899; // @[StoreQueue.scala 509:{56,56}]
  wire  _GEN_13901 = 4'h7 == deqPtrExt_0_value ? allocated_7 : _GEN_13900; // @[StoreQueue.scala 509:{56,56}]
  wire  _GEN_13902 = 4'h8 == deqPtrExt_0_value ? allocated_8 : _GEN_13901; // @[StoreQueue.scala 509:{56,56}]
  wire  _GEN_13903 = 4'h9 == deqPtrExt_0_value ? allocated_9 : _GEN_13902; // @[StoreQueue.scala 509:{56,56}]
  wire  _GEN_13904 = 4'ha == deqPtrExt_0_value ? allocated_10 : _GEN_13903; // @[StoreQueue.scala 509:{56,56}]
  wire  _GEN_13905 = 4'hb == deqPtrExt_0_value ? allocated_11 : _GEN_13904; // @[StoreQueue.scala 509:{56,56}]
  wire  _GEN_13907 = 4'h1 == deqPtrExt_0_value ? datavalid_1 : datavalid_0; // @[StoreQueue.scala 509:{77,77}]
  wire  _GEN_13908 = 4'h2 == deqPtrExt_0_value ? datavalid_2 : _GEN_13907; // @[StoreQueue.scala 509:{77,77}]
  wire  _GEN_13909 = 4'h3 == deqPtrExt_0_value ? datavalid_3 : _GEN_13908; // @[StoreQueue.scala 509:{77,77}]
  wire  _GEN_13910 = 4'h4 == deqPtrExt_0_value ? datavalid_4 : _GEN_13909; // @[StoreQueue.scala 509:{77,77}]
  wire  _GEN_13911 = 4'h5 == deqPtrExt_0_value ? datavalid_5 : _GEN_13910; // @[StoreQueue.scala 509:{77,77}]
  wire  _GEN_13912 = 4'h6 == deqPtrExt_0_value ? datavalid_6 : _GEN_13911; // @[StoreQueue.scala 509:{77,77}]
  wire  _GEN_13913 = 4'h7 == deqPtrExt_0_value ? datavalid_7 : _GEN_13912; // @[StoreQueue.scala 509:{77,77}]
  wire  _GEN_13914 = 4'h8 == deqPtrExt_0_value ? datavalid_8 : _GEN_13913; // @[StoreQueue.scala 509:{77,77}]
  wire  _GEN_13915 = 4'h9 == deqPtrExt_0_value ? datavalid_9 : _GEN_13914; // @[StoreQueue.scala 509:{77,77}]
  wire  _GEN_13916 = 4'ha == deqPtrExt_0_value ? datavalid_10 : _GEN_13915; // @[StoreQueue.scala 509:{77,77}]
  wire  _GEN_13917 = 4'hb == deqPtrExt_0_value ? datavalid_11 : _GEN_13916; // @[StoreQueue.scala 509:{77,77}]
  wire  _GEN_13919 = 4'h1 == deqPtrExt_0_value ? addrvalid_1 : addrvalid_0; // @[StoreQueue.scala 509:{98,98}]
  wire  _GEN_13920 = 4'h2 == deqPtrExt_0_value ? addrvalid_2 : _GEN_13919; // @[StoreQueue.scala 509:{98,98}]
  wire  _GEN_13921 = 4'h3 == deqPtrExt_0_value ? addrvalid_3 : _GEN_13920; // @[StoreQueue.scala 509:{98,98}]
  wire  _GEN_13922 = 4'h4 == deqPtrExt_0_value ? addrvalid_4 : _GEN_13921; // @[StoreQueue.scala 509:{98,98}]
  wire  _GEN_13923 = 4'h5 == deqPtrExt_0_value ? addrvalid_5 : _GEN_13922; // @[StoreQueue.scala 509:{98,98}]
  wire  _GEN_13924 = 4'h6 == deqPtrExt_0_value ? addrvalid_6 : _GEN_13923; // @[StoreQueue.scala 509:{98,98}]
  wire  _GEN_13925 = 4'h7 == deqPtrExt_0_value ? addrvalid_7 : _GEN_13924; // @[StoreQueue.scala 509:{98,98}]
  wire  _GEN_13926 = 4'h8 == deqPtrExt_0_value ? addrvalid_8 : _GEN_13925; // @[StoreQueue.scala 509:{98,98}]
  wire  _GEN_13927 = 4'h9 == deqPtrExt_0_value ? addrvalid_9 : _GEN_13926; // @[StoreQueue.scala 509:{98,98}]
  wire  _GEN_13928 = 4'ha == deqPtrExt_0_value ? addrvalid_10 : _GEN_13927; // @[StoreQueue.scala 509:{98,98}]
  wire  _GEN_13929 = 4'hb == deqPtrExt_0_value ? addrvalid_11 : _GEN_13928; // @[StoreQueue.scala 509:{98,98}]
  reg  REG_12; // @[StoreQueue.scala 509:19]
  wire  _T_68 = io_uncache_req_ready & io_uncache_req_valid; // @[Decoupled.scala 50:35]
  wire  _T_70 = io_uncache_resp_ready & io_uncache_resp_valid; // @[Decoupled.scala 50:35]
  wire [2:0] _GEN_13934 = _rdataPtrExtNext_T_2 ? 3'h4 : uncacheState; // @[StoreQueue.scala 528:34 529:22 506:29]
  wire  _T_74 = commitCount > 2'h0; // @[StoreQueue.scala 533:24]
  wire [2:0] _GEN_13935 = commitCount > 2'h0 ? 3'h0 : uncacheState; // @[StoreQueue.scala 533:31 534:22 506:29]
  wire [2:0] _GEN_13936 = 3'h4 == uncacheState ? _GEN_13935 : uncacheState; // @[StoreQueue.scala 507:24 506:29]
  wire [127:0] _io_uncache_req_bits_data_T_2 = paddrModule_io_rdata_0[3] ? {{64'd0}, dataModule_io_rdata_0_data[127:64]}
     : dataModule_io_rdata_0_data; // @[MemCommon.scala 67:8]
  wire [15:0] _io_uncache_req_bits_mask_T_2 = paddrModule_io_rdata_0[3] ? {{8'd0}, dataModule_io_rdata_0_mask[15:8]} :
    dataModule_io_rdata_0_mask; // @[MemCommon.scala 72:8]
  wire [6:0] _GEN_13942 = 4'h1 == deqPtrExt_0_value ? uop_1_ctrl_fuOpType : uop_0_ctrl_fuOpType; // @[package.scala 405:{35,35}]
  wire [6:0] _GEN_13943 = 4'h2 == deqPtrExt_0_value ? uop_2_ctrl_fuOpType : _GEN_13942; // @[package.scala 405:{35,35}]
  wire [6:0] _GEN_13944 = 4'h3 == deqPtrExt_0_value ? uop_3_ctrl_fuOpType : _GEN_13943; // @[package.scala 405:{35,35}]
  wire [6:0] _GEN_13945 = 4'h4 == deqPtrExt_0_value ? uop_4_ctrl_fuOpType : _GEN_13944; // @[package.scala 405:{35,35}]
  wire [6:0] _GEN_13946 = 4'h5 == deqPtrExt_0_value ? uop_5_ctrl_fuOpType : _GEN_13945; // @[package.scala 405:{35,35}]
  wire [6:0] _GEN_13947 = 4'h6 == deqPtrExt_0_value ? uop_6_ctrl_fuOpType : _GEN_13946; // @[package.scala 405:{35,35}]
  wire [6:0] _GEN_13948 = 4'h7 == deqPtrExt_0_value ? uop_7_ctrl_fuOpType : _GEN_13947; // @[package.scala 405:{35,35}]
  wire [6:0] _GEN_13949 = 4'h8 == deqPtrExt_0_value ? uop_8_ctrl_fuOpType : _GEN_13948; // @[package.scala 405:{35,35}]
  wire [6:0] _GEN_13950 = 4'h9 == deqPtrExt_0_value ? uop_9_ctrl_fuOpType : _GEN_13949; // @[package.scala 405:{35,35}]
  wire [6:0] _GEN_13951 = 4'ha == deqPtrExt_0_value ? uop_10_ctrl_fuOpType : _GEN_13950; // @[package.scala 405:{35,35}]
  wire [6:0] _GEN_13952 = 4'hb == deqPtrExt_0_value ? uop_11_ctrl_fuOpType : _GEN_13951; // @[package.scala 405:{35,35}]
  reg  REG_13; // @[StoreQueue.scala 550:15]
  wire [127:0] _GEN_13954 = REG_13 ? {{92'd0}, paddrModule_io_rdata_0} : _io_uncache_req_bits_data_T_2; // @[StoreQueue.scala 542:28 550:60 552:30]
  reg [3:0] io_uncache_req_bits_atomic_REG_value; // @[StoreQueue.scala 559:47]
  wire  _GEN_13957 = 4'h1 == io_uncache_req_bits_atomic_REG_value ? atomic_1 : atomic_0; // @[StoreQueue.scala 559:{30,30}]
  wire  _GEN_13958 = 4'h2 == io_uncache_req_bits_atomic_REG_value ? atomic_2 : _GEN_13957; // @[StoreQueue.scala 559:{30,30}]
  wire  _GEN_13959 = 4'h3 == io_uncache_req_bits_atomic_REG_value ? atomic_3 : _GEN_13958; // @[StoreQueue.scala 559:{30,30}]
  wire  _GEN_13960 = 4'h4 == io_uncache_req_bits_atomic_REG_value ? atomic_4 : _GEN_13959; // @[StoreQueue.scala 559:{30,30}]
  wire  _GEN_13961 = 4'h5 == io_uncache_req_bits_atomic_REG_value ? atomic_5 : _GEN_13960; // @[StoreQueue.scala 559:{30,30}]
  wire  _GEN_13962 = 4'h6 == io_uncache_req_bits_atomic_REG_value ? atomic_6 : _GEN_13961; // @[StoreQueue.scala 559:{30,30}]
  wire  _GEN_13963 = 4'h7 == io_uncache_req_bits_atomic_REG_value ? atomic_7 : _GEN_13962; // @[StoreQueue.scala 559:{30,30}]
  wire  _GEN_13964 = 4'h8 == io_uncache_req_bits_atomic_REG_value ? atomic_8 : _GEN_13963; // @[StoreQueue.scala 559:{30,30}]
  wire  _GEN_13965 = 4'h9 == io_uncache_req_bits_atomic_REG_value ? atomic_9 : _GEN_13964; // @[StoreQueue.scala 559:{30,30}]
  wire  _GEN_13966 = 4'ha == io_uncache_req_bits_atomic_REG_value ? atomic_10 : _GEN_13965; // @[StoreQueue.scala 559:{30,30}]
  wire  _GEN_14269 = 4'h1 == deqPtrExt_0_value ? uop_1_cf_trigger_backendEn_0 : uop_0_cf_trigger_backendEn_0; // @[StoreQueue.scala 579:{25,25}]
  wire  _GEN_14270 = 4'h2 == deqPtrExt_0_value ? uop_2_cf_trigger_backendEn_0 : _GEN_14269; // @[StoreQueue.scala 579:{25,25}]
  wire  _GEN_14271 = 4'h3 == deqPtrExt_0_value ? uop_3_cf_trigger_backendEn_0 : _GEN_14270; // @[StoreQueue.scala 579:{25,25}]
  wire  _GEN_14272 = 4'h4 == deqPtrExt_0_value ? uop_4_cf_trigger_backendEn_0 : _GEN_14271; // @[StoreQueue.scala 579:{25,25}]
  wire  _GEN_14273 = 4'h5 == deqPtrExt_0_value ? uop_5_cf_trigger_backendEn_0 : _GEN_14272; // @[StoreQueue.scala 579:{25,25}]
  wire  _GEN_14274 = 4'h6 == deqPtrExt_0_value ? uop_6_cf_trigger_backendEn_0 : _GEN_14273; // @[StoreQueue.scala 579:{25,25}]
  wire  _GEN_14275 = 4'h7 == deqPtrExt_0_value ? uop_7_cf_trigger_backendEn_0 : _GEN_14274; // @[StoreQueue.scala 579:{25,25}]
  wire  _GEN_14276 = 4'h8 == deqPtrExt_0_value ? uop_8_cf_trigger_backendEn_0 : _GEN_14275; // @[StoreQueue.scala 579:{25,25}]
  wire  _GEN_14277 = 4'h9 == deqPtrExt_0_value ? uop_9_cf_trigger_backendEn_0 : _GEN_14276; // @[StoreQueue.scala 579:{25,25}]
  wire  _GEN_14278 = 4'ha == deqPtrExt_0_value ? uop_10_cf_trigger_backendEn_0 : _GEN_14277; // @[StoreQueue.scala 579:{25,25}]
  wire  _GEN_15073 = 4'h1 == deqPtrExt_0_value ? uop_1_robIdx_flag : uop_0_robIdx_flag; // @[StoreQueue.scala 579:{25,25}]
  wire  _GEN_15074 = 4'h2 == deqPtrExt_0_value ? uop_2_robIdx_flag : _GEN_15073; // @[StoreQueue.scala 579:{25,25}]
  wire  _GEN_15075 = 4'h3 == deqPtrExt_0_value ? uop_3_robIdx_flag : _GEN_15074; // @[StoreQueue.scala 579:{25,25}]
  wire  _GEN_15076 = 4'h4 == deqPtrExt_0_value ? uop_4_robIdx_flag : _GEN_15075; // @[StoreQueue.scala 579:{25,25}]
  wire  _GEN_15077 = 4'h5 == deqPtrExt_0_value ? uop_5_robIdx_flag : _GEN_15076; // @[StoreQueue.scala 579:{25,25}]
  wire  _GEN_15078 = 4'h6 == deqPtrExt_0_value ? uop_6_robIdx_flag : _GEN_15077; // @[StoreQueue.scala 579:{25,25}]
  wire  _GEN_15079 = 4'h7 == deqPtrExt_0_value ? uop_7_robIdx_flag : _GEN_15078; // @[StoreQueue.scala 579:{25,25}]
  wire  _GEN_15080 = 4'h8 == deqPtrExt_0_value ? uop_8_robIdx_flag : _GEN_15079; // @[StoreQueue.scala 579:{25,25}]
  wire  _GEN_15081 = 4'h9 == deqPtrExt_0_value ? uop_9_robIdx_flag : _GEN_15080; // @[StoreQueue.scala 579:{25,25}]
  wire  _GEN_15082 = 4'ha == deqPtrExt_0_value ? uop_10_robIdx_flag : _GEN_15081; // @[StoreQueue.scala 579:{25,25}]
  wire [4:0] _GEN_15085 = 4'h1 == deqPtrExt_0_value ? uop_1_robIdx_value : uop_0_robIdx_value; // @[StoreQueue.scala 579:{25,25}]
  wire [4:0] _GEN_15086 = 4'h2 == deqPtrExt_0_value ? uop_2_robIdx_value : _GEN_15085; // @[StoreQueue.scala 579:{25,25}]
  wire [4:0] _GEN_15087 = 4'h3 == deqPtrExt_0_value ? uop_3_robIdx_value : _GEN_15086; // @[StoreQueue.scala 579:{25,25}]
  wire [4:0] _GEN_15088 = 4'h4 == deqPtrExt_0_value ? uop_4_robIdx_value : _GEN_15087; // @[StoreQueue.scala 579:{25,25}]
  wire [4:0] _GEN_15089 = 4'h5 == deqPtrExt_0_value ? uop_5_robIdx_value : _GEN_15088; // @[StoreQueue.scala 579:{25,25}]
  wire [4:0] _GEN_15090 = 4'h6 == deqPtrExt_0_value ? uop_6_robIdx_value : _GEN_15089; // @[StoreQueue.scala 579:{25,25}]
  wire [4:0] _GEN_15091 = 4'h7 == deqPtrExt_0_value ? uop_7_robIdx_value : _GEN_15090; // @[StoreQueue.scala 579:{25,25}]
  wire [4:0] _GEN_15092 = 4'h8 == deqPtrExt_0_value ? uop_8_robIdx_value : _GEN_15091; // @[StoreQueue.scala 579:{25,25}]
  wire [4:0] _GEN_15093 = 4'h9 == deqPtrExt_0_value ? uop_9_robIdx_value : _GEN_15092; // @[StoreQueue.scala 579:{25,25}]
  wire [4:0] _GEN_15094 = 4'ha == deqPtrExt_0_value ? uop_10_robIdx_value : _GEN_15093; // @[StoreQueue.scala 579:{25,25}]
  wire  _GEN_15276 = 4'h0 == deqPtrExt_0_value ? 1'h0 : _GEN_10992; // @[StoreQueue.scala 592:{23,23}]
  wire  _GEN_15277 = 4'h1 == deqPtrExt_0_value ? 1'h0 : _GEN_10993; // @[StoreQueue.scala 592:{23,23}]
  wire  _GEN_15278 = 4'h2 == deqPtrExt_0_value ? 1'h0 : _GEN_10994; // @[StoreQueue.scala 592:{23,23}]
  wire  _GEN_15279 = 4'h3 == deqPtrExt_0_value ? 1'h0 : _GEN_10995; // @[StoreQueue.scala 592:{23,23}]
  wire  _GEN_15280 = 4'h4 == deqPtrExt_0_value ? 1'h0 : _GEN_10996; // @[StoreQueue.scala 592:{23,23}]
  wire  _GEN_15281 = 4'h5 == deqPtrExt_0_value ? 1'h0 : _GEN_10997; // @[StoreQueue.scala 592:{23,23}]
  wire  _GEN_15282 = 4'h6 == deqPtrExt_0_value ? 1'h0 : _GEN_10998; // @[StoreQueue.scala 592:{23,23}]
  wire  _GEN_15283 = 4'h7 == deqPtrExt_0_value ? 1'h0 : _GEN_10999; // @[StoreQueue.scala 592:{23,23}]
  wire  _GEN_15284 = 4'h8 == deqPtrExt_0_value ? 1'h0 : _GEN_11000; // @[StoreQueue.scala 592:{23,23}]
  wire  _GEN_15285 = 4'h9 == deqPtrExt_0_value ? 1'h0 : _GEN_11001; // @[StoreQueue.scala 592:{23,23}]
  wire  _GEN_15286 = 4'ha == deqPtrExt_0_value ? 1'h0 : _GEN_11002; // @[StoreQueue.scala 592:{23,23}]
  wire  _GEN_15287 = 4'hb == deqPtrExt_0_value ? 1'h0 : _GEN_11003; // @[StoreQueue.scala 592:{23,23}]
  wire  _GEN_15288 = _rdataPtrExtNext_T_2 ? _GEN_15276 : _GEN_10992; // @[StoreQueue.scala 591:30]
  wire  _GEN_15289 = _rdataPtrExtNext_T_2 ? _GEN_15277 : _GEN_10993; // @[StoreQueue.scala 591:30]
  wire  _GEN_15290 = _rdataPtrExtNext_T_2 ? _GEN_15278 : _GEN_10994; // @[StoreQueue.scala 591:30]
  wire  _GEN_15291 = _rdataPtrExtNext_T_2 ? _GEN_15279 : _GEN_10995; // @[StoreQueue.scala 591:30]
  wire  _GEN_15292 = _rdataPtrExtNext_T_2 ? _GEN_15280 : _GEN_10996; // @[StoreQueue.scala 591:30]
  wire  _GEN_15293 = _rdataPtrExtNext_T_2 ? _GEN_15281 : _GEN_10997; // @[StoreQueue.scala 591:30]
  wire  _GEN_15294 = _rdataPtrExtNext_T_2 ? _GEN_15282 : _GEN_10998; // @[StoreQueue.scala 591:30]
  wire  _GEN_15295 = _rdataPtrExtNext_T_2 ? _GEN_15283 : _GEN_10999; // @[StoreQueue.scala 591:30]
  wire  _GEN_15296 = _rdataPtrExtNext_T_2 ? _GEN_15284 : _GEN_11000; // @[StoreQueue.scala 591:30]
  wire  _GEN_15297 = _rdataPtrExtNext_T_2 ? _GEN_15285 : _GEN_11001; // @[StoreQueue.scala 591:30]
  wire  _GEN_15298 = _rdataPtrExtNext_T_2 ? _GEN_15286 : _GEN_11002; // @[StoreQueue.scala 591:30]
  wire  _GEN_15299 = _rdataPtrExtNext_T_2 ? _GEN_15287 : _GEN_11003; // @[StoreQueue.scala 591:30]
  wire  _GEN_15300 = 4'h0 == cmtPtrExt_0_value | _GEN_11028; // @[StoreQueue.scala 609:{41,41}]
  wire  _GEN_15301 = 4'h1 == cmtPtrExt_0_value | _GEN_11029; // @[StoreQueue.scala 609:{41,41}]
  wire  _GEN_15302 = 4'h2 == cmtPtrExt_0_value | _GEN_11030; // @[StoreQueue.scala 609:{41,41}]
  wire  _GEN_15303 = 4'h3 == cmtPtrExt_0_value | _GEN_11031; // @[StoreQueue.scala 609:{41,41}]
  wire  _GEN_15304 = 4'h4 == cmtPtrExt_0_value | _GEN_11032; // @[StoreQueue.scala 609:{41,41}]
  wire  _GEN_15305 = 4'h5 == cmtPtrExt_0_value | _GEN_11033; // @[StoreQueue.scala 609:{41,41}]
  wire  _GEN_15306 = 4'h6 == cmtPtrExt_0_value | _GEN_11034; // @[StoreQueue.scala 609:{41,41}]
  wire  _GEN_15307 = 4'h7 == cmtPtrExt_0_value | _GEN_11035; // @[StoreQueue.scala 609:{41,41}]
  wire  _GEN_15308 = 4'h8 == cmtPtrExt_0_value | _GEN_11036; // @[StoreQueue.scala 609:{41,41}]
  wire  _GEN_15309 = 4'h9 == cmtPtrExt_0_value | _GEN_11037; // @[StoreQueue.scala 609:{41,41}]
  wire  _GEN_15310 = 4'ha == cmtPtrExt_0_value | _GEN_11038; // @[StoreQueue.scala 609:{41,41}]
  wire  _GEN_15311 = 4'hb == cmtPtrExt_0_value | _GEN_11039; // @[StoreQueue.scala 609:{41,41}]
  wire  _GEN_15312 = uncacheState == 3'h0 ? _GEN_15300 : _GEN_11028; // @[StoreQueue.scala 608:38]
  wire  _GEN_15313 = uncacheState == 3'h0 ? _GEN_15301 : _GEN_11029; // @[StoreQueue.scala 608:38]
  wire  _GEN_15314 = uncacheState == 3'h0 ? _GEN_15302 : _GEN_11030; // @[StoreQueue.scala 608:38]
  wire  _GEN_15315 = uncacheState == 3'h0 ? _GEN_15303 : _GEN_11031; // @[StoreQueue.scala 608:38]
  wire  _GEN_15316 = uncacheState == 3'h0 ? _GEN_15304 : _GEN_11032; // @[StoreQueue.scala 608:38]
  wire  _GEN_15317 = uncacheState == 3'h0 ? _GEN_15305 : _GEN_11033; // @[StoreQueue.scala 608:38]
  wire  _GEN_15318 = uncacheState == 3'h0 ? _GEN_15306 : _GEN_11034; // @[StoreQueue.scala 608:38]
  wire  _GEN_15319 = uncacheState == 3'h0 ? _GEN_15307 : _GEN_11035; // @[StoreQueue.scala 608:38]
  wire  _GEN_15320 = uncacheState == 3'h0 ? _GEN_15308 : _GEN_11036; // @[StoreQueue.scala 608:38]
  wire  _GEN_15321 = uncacheState == 3'h0 ? _GEN_15309 : _GEN_11037; // @[StoreQueue.scala 608:38]
  wire  _GEN_15322 = uncacheState == 3'h0 ? _GEN_15310 : _GEN_11038; // @[StoreQueue.scala 608:38]
  wire  _GEN_15323 = uncacheState == 3'h0 ? _GEN_15311 : _GEN_11039; // @[StoreQueue.scala 608:38]
  wire  _GEN_15324 = _T_74 ? _GEN_15312 : _GEN_11028; // @[StoreQueue.scala 604:30]
  wire  _GEN_15325 = _T_74 ? _GEN_15313 : _GEN_11029; // @[StoreQueue.scala 604:30]
  wire  _GEN_15326 = _T_74 ? _GEN_15314 : _GEN_11030; // @[StoreQueue.scala 604:30]
  wire  _GEN_15327 = _T_74 ? _GEN_15315 : _GEN_11031; // @[StoreQueue.scala 604:30]
  wire  _GEN_15328 = _T_74 ? _GEN_15316 : _GEN_11032; // @[StoreQueue.scala 604:30]
  wire  _GEN_15329 = _T_74 ? _GEN_15317 : _GEN_11033; // @[StoreQueue.scala 604:30]
  wire  _GEN_15330 = _T_74 ? _GEN_15318 : _GEN_11034; // @[StoreQueue.scala 604:30]
  wire  _GEN_15331 = _T_74 ? _GEN_15319 : _GEN_11035; // @[StoreQueue.scala 604:30]
  wire  _GEN_15332 = _T_74 ? _GEN_15320 : _GEN_11036; // @[StoreQueue.scala 604:30]
  wire  _GEN_15333 = _T_74 ? _GEN_15321 : _GEN_11037; // @[StoreQueue.scala 604:30]
  wire  _GEN_15334 = _T_74 ? _GEN_15322 : _GEN_11038; // @[StoreQueue.scala 604:30]
  wire  _GEN_15335 = _T_74 ? _GEN_15323 : _GEN_11039; // @[StoreQueue.scala 604:30]
  wire  _GEN_15336 = 4'h0 == cmtPtrExt_1_value | _GEN_15324; // @[StoreQueue.scala 612:{39,39}]
  wire  _GEN_15337 = 4'h1 == cmtPtrExt_1_value | _GEN_15325; // @[StoreQueue.scala 612:{39,39}]
  wire  _GEN_15338 = 4'h2 == cmtPtrExt_1_value | _GEN_15326; // @[StoreQueue.scala 612:{39,39}]
  wire  _GEN_15339 = 4'h3 == cmtPtrExt_1_value | _GEN_15327; // @[StoreQueue.scala 612:{39,39}]
  wire  _GEN_15340 = 4'h4 == cmtPtrExt_1_value | _GEN_15328; // @[StoreQueue.scala 612:{39,39}]
  wire  _GEN_15341 = 4'h5 == cmtPtrExt_1_value | _GEN_15329; // @[StoreQueue.scala 612:{39,39}]
  wire  _GEN_15342 = 4'h6 == cmtPtrExt_1_value | _GEN_15330; // @[StoreQueue.scala 612:{39,39}]
  wire  _GEN_15343 = 4'h7 == cmtPtrExt_1_value | _GEN_15331; // @[StoreQueue.scala 612:{39,39}]
  wire  _GEN_15344 = 4'h8 == cmtPtrExt_1_value | _GEN_15332; // @[StoreQueue.scala 612:{39,39}]
  wire  _GEN_15345 = 4'h9 == cmtPtrExt_1_value | _GEN_15333; // @[StoreQueue.scala 612:{39,39}]
  wire  _GEN_15346 = 4'ha == cmtPtrExt_1_value | _GEN_15334; // @[StoreQueue.scala 612:{39,39}]
  wire  _GEN_15347 = 4'hb == cmtPtrExt_1_value | _GEN_15335; // @[StoreQueue.scala 612:{39,39}]
  wire [4:0] new_value_1 = cmtPtrExt_1_value + _GEN_15564; // @[CircularQueuePtr.scala 41:34]
  wire [5:0] _diff_T_7 = {1'h0,new_value_1}; // @[CircularQueuePtr.scala 42:49]
  wire [5:0] diff_1 = $signed(_diff_T_7) - 6'shc; // @[CircularQueuePtr.scala 42:52]
  wire  reverse_flag_1 = $signed(diff_1) >= 6'sh0; // @[CircularQueuePtr.scala 43:31]
  wire [5:0] _new_ptr_value_T_2 = $signed(_diff_T_7) - 6'shc; // @[CircularQueuePtr.scala 46:20]
  wire [5:0] _new_ptr_value_T_3 = reverse_flag_1 ? _new_ptr_value_T_2 : {{1'd0}, new_value_1}; // @[CircularQueuePtr.scala 45:27]
  wire  _GEN_15361 = 4'h1 == rdataPtrExt_0_value ? allocated_1 : allocated_0; // @[StoreQueue.scala 628:{50,50}]
  wire  _GEN_15362 = 4'h2 == rdataPtrExt_0_value ? allocated_2 : _GEN_15361; // @[StoreQueue.scala 628:{50,50}]
  wire  _GEN_15363 = 4'h3 == rdataPtrExt_0_value ? allocated_3 : _GEN_15362; // @[StoreQueue.scala 628:{50,50}]
  wire  _GEN_15364 = 4'h4 == rdataPtrExt_0_value ? allocated_4 : _GEN_15363; // @[StoreQueue.scala 628:{50,50}]
  wire  _GEN_15365 = 4'h5 == rdataPtrExt_0_value ? allocated_5 : _GEN_15364; // @[StoreQueue.scala 628:{50,50}]
  wire  _GEN_15366 = 4'h6 == rdataPtrExt_0_value ? allocated_6 : _GEN_15365; // @[StoreQueue.scala 628:{50,50}]
  wire  _GEN_15367 = 4'h7 == rdataPtrExt_0_value ? allocated_7 : _GEN_15366; // @[StoreQueue.scala 628:{50,50}]
  wire  _GEN_15368 = 4'h8 == rdataPtrExt_0_value ? allocated_8 : _GEN_15367; // @[StoreQueue.scala 628:{50,50}]
  wire  _GEN_15369 = 4'h9 == rdataPtrExt_0_value ? allocated_9 : _GEN_15368; // @[StoreQueue.scala 628:{50,50}]
  wire  _GEN_15370 = 4'ha == rdataPtrExt_0_value ? allocated_10 : _GEN_15369; // @[StoreQueue.scala 628:{50,50}]
  wire  _GEN_15371 = 4'hb == rdataPtrExt_0_value ? allocated_11 : _GEN_15370; // @[StoreQueue.scala 628:{50,50}]
  wire  _GEN_15373 = 4'h1 == rdataPtrExt_0_value ? committed_1 : committed_0; // @[StoreQueue.scala 628:{50,50}]
  wire  _GEN_15374 = 4'h2 == rdataPtrExt_0_value ? committed_2 : _GEN_15373; // @[StoreQueue.scala 628:{50,50}]
  wire  _GEN_15375 = 4'h3 == rdataPtrExt_0_value ? committed_3 : _GEN_15374; // @[StoreQueue.scala 628:{50,50}]
  wire  _GEN_15376 = 4'h4 == rdataPtrExt_0_value ? committed_4 : _GEN_15375; // @[StoreQueue.scala 628:{50,50}]
  wire  _GEN_15377 = 4'h5 == rdataPtrExt_0_value ? committed_5 : _GEN_15376; // @[StoreQueue.scala 628:{50,50}]
  wire  _GEN_15378 = 4'h6 == rdataPtrExt_0_value ? committed_6 : _GEN_15377; // @[StoreQueue.scala 628:{50,50}]
  wire  _GEN_15379 = 4'h7 == rdataPtrExt_0_value ? committed_7 : _GEN_15378; // @[StoreQueue.scala 628:{50,50}]
  wire  _GEN_15380 = 4'h8 == rdataPtrExt_0_value ? committed_8 : _GEN_15379; // @[StoreQueue.scala 628:{50,50}]
  wire  _GEN_15381 = 4'h9 == rdataPtrExt_0_value ? committed_9 : _GEN_15380; // @[StoreQueue.scala 628:{50,50}]
  wire  _GEN_15382 = 4'ha == rdataPtrExt_0_value ? committed_10 : _GEN_15381; // @[StoreQueue.scala 628:{50,50}]
  wire  _GEN_15383 = 4'hb == rdataPtrExt_0_value ? committed_11 : _GEN_15382; // @[StoreQueue.scala 628:{50,50}]
  wire  _GEN_15385 = 4'h1 == rdataPtrExt_0_value ? mmio_1 : mmio_0; // @[StoreQueue.scala 628:{71,71}]
  wire  _GEN_15386 = 4'h2 == rdataPtrExt_0_value ? mmio_2 : _GEN_15385; // @[StoreQueue.scala 628:{71,71}]
  wire  _GEN_15387 = 4'h3 == rdataPtrExt_0_value ? mmio_3 : _GEN_15386; // @[StoreQueue.scala 628:{71,71}]
  wire  _GEN_15388 = 4'h4 == rdataPtrExt_0_value ? mmio_4 : _GEN_15387; // @[StoreQueue.scala 628:{71,71}]
  wire  _GEN_15389 = 4'h5 == rdataPtrExt_0_value ? mmio_5 : _GEN_15388; // @[StoreQueue.scala 628:{71,71}]
  wire  _GEN_15390 = 4'h6 == rdataPtrExt_0_value ? mmio_6 : _GEN_15389; // @[StoreQueue.scala 628:{71,71}]
  wire  _GEN_15391 = 4'h7 == rdataPtrExt_0_value ? mmio_7 : _GEN_15390; // @[StoreQueue.scala 628:{71,71}]
  wire  _GEN_15392 = 4'h8 == rdataPtrExt_0_value ? mmio_8 : _GEN_15391; // @[StoreQueue.scala 628:{71,71}]
  wire  _GEN_15393 = 4'h9 == rdataPtrExt_0_value ? mmio_9 : _GEN_15392; // @[StoreQueue.scala 628:{71,71}]
  wire  _GEN_15394 = 4'ha == rdataPtrExt_0_value ? mmio_10 : _GEN_15393; // @[StoreQueue.scala 628:{71,71}]
  wire  _GEN_15395 = 4'hb == rdataPtrExt_0_value ? mmio_11 : _GEN_15394; // @[StoreQueue.scala 628:{71,71}]
  wire  _GEN_15409 = 4'h1 == rdataPtrExt_1_value ? allocated_1 : allocated_0; // @[StoreQueue.scala 628:{50,50}]
  wire  _GEN_15410 = 4'h2 == rdataPtrExt_1_value ? allocated_2 : _GEN_15409; // @[StoreQueue.scala 628:{50,50}]
  wire  _GEN_15411 = 4'h3 == rdataPtrExt_1_value ? allocated_3 : _GEN_15410; // @[StoreQueue.scala 628:{50,50}]
  wire  _GEN_15412 = 4'h4 == rdataPtrExt_1_value ? allocated_4 : _GEN_15411; // @[StoreQueue.scala 628:{50,50}]
  wire  _GEN_15413 = 4'h5 == rdataPtrExt_1_value ? allocated_5 : _GEN_15412; // @[StoreQueue.scala 628:{50,50}]
  wire  _GEN_15414 = 4'h6 == rdataPtrExt_1_value ? allocated_6 : _GEN_15413; // @[StoreQueue.scala 628:{50,50}]
  wire  _GEN_15415 = 4'h7 == rdataPtrExt_1_value ? allocated_7 : _GEN_15414; // @[StoreQueue.scala 628:{50,50}]
  wire  _GEN_15416 = 4'h8 == rdataPtrExt_1_value ? allocated_8 : _GEN_15415; // @[StoreQueue.scala 628:{50,50}]
  wire  _GEN_15417 = 4'h9 == rdataPtrExt_1_value ? allocated_9 : _GEN_15416; // @[StoreQueue.scala 628:{50,50}]
  wire  _GEN_15418 = 4'ha == rdataPtrExt_1_value ? allocated_10 : _GEN_15417; // @[StoreQueue.scala 628:{50,50}]
  wire  _GEN_15419 = 4'hb == rdataPtrExt_1_value ? allocated_11 : _GEN_15418; // @[StoreQueue.scala 628:{50,50}]
  wire  _GEN_15421 = 4'h1 == rdataPtrExt_1_value ? committed_1 : committed_0; // @[StoreQueue.scala 628:{50,50}]
  wire  _GEN_15422 = 4'h2 == rdataPtrExt_1_value ? committed_2 : _GEN_15421; // @[StoreQueue.scala 628:{50,50}]
  wire  _GEN_15423 = 4'h3 == rdataPtrExt_1_value ? committed_3 : _GEN_15422; // @[StoreQueue.scala 628:{50,50}]
  wire  _GEN_15424 = 4'h4 == rdataPtrExt_1_value ? committed_4 : _GEN_15423; // @[StoreQueue.scala 628:{50,50}]
  wire  _GEN_15425 = 4'h5 == rdataPtrExt_1_value ? committed_5 : _GEN_15424; // @[StoreQueue.scala 628:{50,50}]
  wire  _GEN_15426 = 4'h6 == rdataPtrExt_1_value ? committed_6 : _GEN_15425; // @[StoreQueue.scala 628:{50,50}]
  wire  _GEN_15427 = 4'h7 == rdataPtrExt_1_value ? committed_7 : _GEN_15426; // @[StoreQueue.scala 628:{50,50}]
  wire  _GEN_15428 = 4'h8 == rdataPtrExt_1_value ? committed_8 : _GEN_15427; // @[StoreQueue.scala 628:{50,50}]
  wire  _GEN_15429 = 4'h9 == rdataPtrExt_1_value ? committed_9 : _GEN_15428; // @[StoreQueue.scala 628:{50,50}]
  wire  _GEN_15430 = 4'ha == rdataPtrExt_1_value ? committed_10 : _GEN_15429; // @[StoreQueue.scala 628:{50,50}]
  wire  _GEN_15431 = 4'hb == rdataPtrExt_1_value ? committed_11 : _GEN_15430; // @[StoreQueue.scala 628:{50,50}]
  reg  REG_14; // @[StoreQueue.scala 660:18]
  reg [3:0] r; // @[Reg.scala 16:16]
  wire  _GEN_15445 = 4'h0 == r ? 1'h0 : _GEN_15288; // @[StoreQueue.scala 661:{53,53}]
  wire  _GEN_15446 = 4'h1 == r ? 1'h0 : _GEN_15289; // @[StoreQueue.scala 661:{53,53}]
  wire  _GEN_15447 = 4'h2 == r ? 1'h0 : _GEN_15290; // @[StoreQueue.scala 661:{53,53}]
  wire  _GEN_15448 = 4'h3 == r ? 1'h0 : _GEN_15291; // @[StoreQueue.scala 661:{53,53}]
  wire  _GEN_15449 = 4'h4 == r ? 1'h0 : _GEN_15292; // @[StoreQueue.scala 661:{53,53}]
  wire  _GEN_15450 = 4'h5 == r ? 1'h0 : _GEN_15293; // @[StoreQueue.scala 661:{53,53}]
  wire  _GEN_15451 = 4'h6 == r ? 1'h0 : _GEN_15294; // @[StoreQueue.scala 661:{53,53}]
  wire  _GEN_15452 = 4'h7 == r ? 1'h0 : _GEN_15295; // @[StoreQueue.scala 661:{53,53}]
  wire  _GEN_15453 = 4'h8 == r ? 1'h0 : _GEN_15296; // @[StoreQueue.scala 661:{53,53}]
  wire  _GEN_15454 = 4'h9 == r ? 1'h0 : _GEN_15297; // @[StoreQueue.scala 661:{53,53}]
  wire  _GEN_15455 = 4'ha == r ? 1'h0 : _GEN_15298; // @[StoreQueue.scala 661:{53,53}]
  wire  _GEN_15456 = 4'hb == r ? 1'h0 : _GEN_15299; // @[StoreQueue.scala 661:{53,53}]
  reg [3:0] r_1; // @[Reg.scala 16:16]
  wire  _GEN_15458 = 4'h0 == r_1 | _GEN_11052; // @[StoreQueue.scala 662:{53,53}]
  wire  _GEN_15459 = 4'h1 == r_1 | _GEN_11053; // @[StoreQueue.scala 662:{53,53}]
  wire  _GEN_15460 = 4'h2 == r_1 | _GEN_11054; // @[StoreQueue.scala 662:{53,53}]
  wire  _GEN_15461 = 4'h3 == r_1 | _GEN_11055; // @[StoreQueue.scala 662:{53,53}]
  wire  _GEN_15462 = 4'h4 == r_1 | _GEN_11056; // @[StoreQueue.scala 662:{53,53}]
  wire  _GEN_15463 = 4'h5 == r_1 | _GEN_11057; // @[StoreQueue.scala 662:{53,53}]
  wire  _GEN_15464 = 4'h6 == r_1 | _GEN_11058; // @[StoreQueue.scala 662:{53,53}]
  wire  _GEN_15465 = 4'h7 == r_1 | _GEN_11059; // @[StoreQueue.scala 662:{53,53}]
  wire  _GEN_15466 = 4'h8 == r_1 | _GEN_11060; // @[StoreQueue.scala 662:{53,53}]
  wire  _GEN_15467 = 4'h9 == r_1 | _GEN_11061; // @[StoreQueue.scala 662:{53,53}]
  wire  _GEN_15468 = 4'ha == r_1 | _GEN_11062; // @[StoreQueue.scala 662:{53,53}]
  wire  _GEN_15469 = 4'hb == r_1 | _GEN_11063; // @[StoreQueue.scala 662:{53,53}]
  wire  _GEN_15470 = REG_14 ? _GEN_15445 : _GEN_15288; // @[StoreQueue.scala 660:42]
  wire  _GEN_15471 = REG_14 ? _GEN_15446 : _GEN_15289; // @[StoreQueue.scala 660:42]
  wire  _GEN_15472 = REG_14 ? _GEN_15447 : _GEN_15290; // @[StoreQueue.scala 660:42]
  wire  _GEN_15473 = REG_14 ? _GEN_15448 : _GEN_15291; // @[StoreQueue.scala 660:42]
  wire  _GEN_15474 = REG_14 ? _GEN_15449 : _GEN_15292; // @[StoreQueue.scala 660:42]
  wire  _GEN_15475 = REG_14 ? _GEN_15450 : _GEN_15293; // @[StoreQueue.scala 660:42]
  wire  _GEN_15476 = REG_14 ? _GEN_15451 : _GEN_15294; // @[StoreQueue.scala 660:42]
  wire  _GEN_15477 = REG_14 ? _GEN_15452 : _GEN_15295; // @[StoreQueue.scala 660:42]
  wire  _GEN_15478 = REG_14 ? _GEN_15453 : _GEN_15296; // @[StoreQueue.scala 660:42]
  wire  _GEN_15479 = REG_14 ? _GEN_15454 : _GEN_15297; // @[StoreQueue.scala 660:42]
  wire  _GEN_15480 = REG_14 ? _GEN_15455 : _GEN_15298; // @[StoreQueue.scala 660:42]
  wire  _GEN_15481 = REG_14 ? _GEN_15456 : _GEN_15299; // @[StoreQueue.scala 660:42]
  wire  _GEN_15482 = REG_14 ? _GEN_15458 : _GEN_11052; // @[StoreQueue.scala 660:42]
  wire  _GEN_15483 = REG_14 ? _GEN_15459 : _GEN_11053; // @[StoreQueue.scala 660:42]
  wire  _GEN_15484 = REG_14 ? _GEN_15460 : _GEN_11054; // @[StoreQueue.scala 660:42]
  wire  _GEN_15485 = REG_14 ? _GEN_15461 : _GEN_11055; // @[StoreQueue.scala 660:42]
  wire  _GEN_15486 = REG_14 ? _GEN_15462 : _GEN_11056; // @[StoreQueue.scala 660:42]
  wire  _GEN_15487 = REG_14 ? _GEN_15463 : _GEN_11057; // @[StoreQueue.scala 660:42]
  wire  _GEN_15488 = REG_14 ? _GEN_15464 : _GEN_11058; // @[StoreQueue.scala 660:42]
  wire  _GEN_15489 = REG_14 ? _GEN_15465 : _GEN_11059; // @[StoreQueue.scala 660:42]
  wire  _GEN_15490 = REG_14 ? _GEN_15466 : _GEN_11060; // @[StoreQueue.scala 660:42]
  wire  _GEN_15491 = REG_14 ? _GEN_15467 : _GEN_11061; // @[StoreQueue.scala 660:42]
  wire  _GEN_15492 = REG_14 ? _GEN_15468 : _GEN_11062; // @[StoreQueue.scala 660:42]
  wire  _GEN_15493 = REG_14 ? _GEN_15469 : _GEN_11063; // @[StoreQueue.scala 660:42]
  reg  REG_15; // @[StoreQueue.scala 660:18]
  reg [3:0] r_2; // @[Reg.scala 16:16]
  reg [3:0] r_3; // @[Reg.scala 16:16]
  wire  _GEN_15508 = 4'h0 == r_3 | _GEN_15482; // @[StoreQueue.scala 662:{53,53}]
  wire  _GEN_15509 = 4'h1 == r_3 | _GEN_15483; // @[StoreQueue.scala 662:{53,53}]
  wire  _GEN_15510 = 4'h2 == r_3 | _GEN_15484; // @[StoreQueue.scala 662:{53,53}]
  wire  _GEN_15511 = 4'h3 == r_3 | _GEN_15485; // @[StoreQueue.scala 662:{53,53}]
  wire  _GEN_15512 = 4'h4 == r_3 | _GEN_15486; // @[StoreQueue.scala 662:{53,53}]
  wire  _GEN_15513 = 4'h5 == r_3 | _GEN_15487; // @[StoreQueue.scala 662:{53,53}]
  wire  _GEN_15514 = 4'h6 == r_3 | _GEN_15488; // @[StoreQueue.scala 662:{53,53}]
  wire  _GEN_15515 = 4'h7 == r_3 | _GEN_15489; // @[StoreQueue.scala 662:{53,53}]
  wire  _GEN_15516 = 4'h8 == r_3 | _GEN_15490; // @[StoreQueue.scala 662:{53,53}]
  wire  _GEN_15517 = 4'h9 == r_3 | _GEN_15491; // @[StoreQueue.scala 662:{53,53}]
  wire  _GEN_15518 = 4'ha == r_3 | _GEN_15492; // @[StoreQueue.scala 662:{53,53}]
  wire  _GEN_15519 = 4'hb == r_3 | _GEN_15493; // @[StoreQueue.scala 662:{53,53}]
  wire  _needCancel_0_flushItself_T_3 = _robMatchVec_T == _enqCancel_flushItself_T_2; // @[CircularQueuePtr.scala 61:52]
  wire  needCancel_0_flushItself = io_brqRedirect_bits_level & _needCancel_0_flushItself_T_3; // @[Rob.scala 122:51]
  wire  needCancel_0_differentFlag = uop_0_robIdx_flag ^ io_brqRedirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  needCancel_0_compare = uop_0_robIdx_value > io_brqRedirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _needCancel_0_T = needCancel_0_differentFlag ^ needCancel_0_compare; // @[CircularQueuePtr.scala 88:19]
  wire  _needCancel_0_T_2 = io_brqRedirect_valid & (needCancel_0_flushItself | _needCancel_0_T); // @[Rob.scala 123:20]
  wire  needCancel_0 = _needCancel_0_T_2 & allocated_0 & ~committed_0; // @[StoreQueue.scala 711:78]
  wire  _needCancel_1_flushItself_T_3 = _robMatchVec_T_4 == _enqCancel_flushItself_T_2; // @[CircularQueuePtr.scala 61:52]
  wire  needCancel_1_flushItself = io_brqRedirect_bits_level & _needCancel_1_flushItself_T_3; // @[Rob.scala 122:51]
  wire  needCancel_1_differentFlag = uop_1_robIdx_flag ^ io_brqRedirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  needCancel_1_compare = uop_1_robIdx_value > io_brqRedirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _needCancel_1_T = needCancel_1_differentFlag ^ needCancel_1_compare; // @[CircularQueuePtr.scala 88:19]
  wire  _needCancel_1_T_2 = io_brqRedirect_valid & (needCancel_1_flushItself | _needCancel_1_T); // @[Rob.scala 123:20]
  wire  needCancel_1 = _needCancel_1_T_2 & allocated_1 & ~committed_1; // @[StoreQueue.scala 711:78]
  wire  _needCancel_2_flushItself_T_3 = _robMatchVec_T_8 == _enqCancel_flushItself_T_2; // @[CircularQueuePtr.scala 61:52]
  wire  needCancel_2_flushItself = io_brqRedirect_bits_level & _needCancel_2_flushItself_T_3; // @[Rob.scala 122:51]
  wire  needCancel_2_differentFlag = uop_2_robIdx_flag ^ io_brqRedirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  needCancel_2_compare = uop_2_robIdx_value > io_brqRedirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _needCancel_2_T = needCancel_2_differentFlag ^ needCancel_2_compare; // @[CircularQueuePtr.scala 88:19]
  wire  _needCancel_2_T_2 = io_brqRedirect_valid & (needCancel_2_flushItself | _needCancel_2_T); // @[Rob.scala 123:20]
  wire  needCancel_2 = _needCancel_2_T_2 & allocated_2 & ~committed_2; // @[StoreQueue.scala 711:78]
  wire  _needCancel_3_flushItself_T_3 = _robMatchVec_T_12 == _enqCancel_flushItself_T_2; // @[CircularQueuePtr.scala 61:52]
  wire  needCancel_3_flushItself = io_brqRedirect_bits_level & _needCancel_3_flushItself_T_3; // @[Rob.scala 122:51]
  wire  needCancel_3_differentFlag = uop_3_robIdx_flag ^ io_brqRedirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  needCancel_3_compare = uop_3_robIdx_value > io_brqRedirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _needCancel_3_T = needCancel_3_differentFlag ^ needCancel_3_compare; // @[CircularQueuePtr.scala 88:19]
  wire  _needCancel_3_T_2 = io_brqRedirect_valid & (needCancel_3_flushItself | _needCancel_3_T); // @[Rob.scala 123:20]
  wire  needCancel_3 = _needCancel_3_T_2 & allocated_3 & ~committed_3; // @[StoreQueue.scala 711:78]
  wire  _needCancel_4_flushItself_T_3 = _robMatchVec_T_16 == _enqCancel_flushItself_T_2; // @[CircularQueuePtr.scala 61:52]
  wire  needCancel_4_flushItself = io_brqRedirect_bits_level & _needCancel_4_flushItself_T_3; // @[Rob.scala 122:51]
  wire  needCancel_4_differentFlag = uop_4_robIdx_flag ^ io_brqRedirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  needCancel_4_compare = uop_4_robIdx_value > io_brqRedirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _needCancel_4_T = needCancel_4_differentFlag ^ needCancel_4_compare; // @[CircularQueuePtr.scala 88:19]
  wire  _needCancel_4_T_2 = io_brqRedirect_valid & (needCancel_4_flushItself | _needCancel_4_T); // @[Rob.scala 123:20]
  wire  needCancel_4 = _needCancel_4_T_2 & allocated_4 & ~committed_4; // @[StoreQueue.scala 711:78]
  wire  _needCancel_5_flushItself_T_3 = _robMatchVec_T_20 == _enqCancel_flushItself_T_2; // @[CircularQueuePtr.scala 61:52]
  wire  needCancel_5_flushItself = io_brqRedirect_bits_level & _needCancel_5_flushItself_T_3; // @[Rob.scala 122:51]
  wire  needCancel_5_differentFlag = uop_5_robIdx_flag ^ io_brqRedirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  needCancel_5_compare = uop_5_robIdx_value > io_brqRedirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _needCancel_5_T = needCancel_5_differentFlag ^ needCancel_5_compare; // @[CircularQueuePtr.scala 88:19]
  wire  _needCancel_5_T_2 = io_brqRedirect_valid & (needCancel_5_flushItself | _needCancel_5_T); // @[Rob.scala 123:20]
  wire  needCancel_5 = _needCancel_5_T_2 & allocated_5 & ~committed_5; // @[StoreQueue.scala 711:78]
  wire  _needCancel_6_flushItself_T_3 = _robMatchVec_T_24 == _enqCancel_flushItself_T_2; // @[CircularQueuePtr.scala 61:52]
  wire  needCancel_6_flushItself = io_brqRedirect_bits_level & _needCancel_6_flushItself_T_3; // @[Rob.scala 122:51]
  wire  needCancel_6_differentFlag = uop_6_robIdx_flag ^ io_brqRedirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  needCancel_6_compare = uop_6_robIdx_value > io_brqRedirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _needCancel_6_T = needCancel_6_differentFlag ^ needCancel_6_compare; // @[CircularQueuePtr.scala 88:19]
  wire  _needCancel_6_T_2 = io_brqRedirect_valid & (needCancel_6_flushItself | _needCancel_6_T); // @[Rob.scala 123:20]
  wire  needCancel_6 = _needCancel_6_T_2 & allocated_6 & ~committed_6; // @[StoreQueue.scala 711:78]
  wire  _needCancel_7_flushItself_T_3 = _robMatchVec_T_28 == _enqCancel_flushItself_T_2; // @[CircularQueuePtr.scala 61:52]
  wire  needCancel_7_flushItself = io_brqRedirect_bits_level & _needCancel_7_flushItself_T_3; // @[Rob.scala 122:51]
  wire  needCancel_7_differentFlag = uop_7_robIdx_flag ^ io_brqRedirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  needCancel_7_compare = uop_7_robIdx_value > io_brqRedirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _needCancel_7_T = needCancel_7_differentFlag ^ needCancel_7_compare; // @[CircularQueuePtr.scala 88:19]
  wire  _needCancel_7_T_2 = io_brqRedirect_valid & (needCancel_7_flushItself | _needCancel_7_T); // @[Rob.scala 123:20]
  wire  needCancel_7 = _needCancel_7_T_2 & allocated_7 & ~committed_7; // @[StoreQueue.scala 711:78]
  wire  _needCancel_8_flushItself_T_3 = _robMatchVec_T_32 == _enqCancel_flushItself_T_2; // @[CircularQueuePtr.scala 61:52]
  wire  needCancel_8_flushItself = io_brqRedirect_bits_level & _needCancel_8_flushItself_T_3; // @[Rob.scala 122:51]
  wire  needCancel_8_differentFlag = uop_8_robIdx_flag ^ io_brqRedirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  needCancel_8_compare = uop_8_robIdx_value > io_brqRedirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _needCancel_8_T = needCancel_8_differentFlag ^ needCancel_8_compare; // @[CircularQueuePtr.scala 88:19]
  wire  _needCancel_8_T_2 = io_brqRedirect_valid & (needCancel_8_flushItself | _needCancel_8_T); // @[Rob.scala 123:20]
  wire  needCancel_8 = _needCancel_8_T_2 & allocated_8 & ~committed_8; // @[StoreQueue.scala 711:78]
  wire  _needCancel_9_flushItself_T_3 = _robMatchVec_T_36 == _enqCancel_flushItself_T_2; // @[CircularQueuePtr.scala 61:52]
  wire  needCancel_9_flushItself = io_brqRedirect_bits_level & _needCancel_9_flushItself_T_3; // @[Rob.scala 122:51]
  wire  needCancel_9_differentFlag = uop_9_robIdx_flag ^ io_brqRedirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  needCancel_9_compare = uop_9_robIdx_value > io_brqRedirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _needCancel_9_T = needCancel_9_differentFlag ^ needCancel_9_compare; // @[CircularQueuePtr.scala 88:19]
  wire  _needCancel_9_T_2 = io_brqRedirect_valid & (needCancel_9_flushItself | _needCancel_9_T); // @[Rob.scala 123:20]
  wire  needCancel_9 = _needCancel_9_T_2 & allocated_9 & ~committed_9; // @[StoreQueue.scala 711:78]
  wire  _needCancel_10_flushItself_T_3 = _robMatchVec_T_40 == _enqCancel_flushItself_T_2; // @[CircularQueuePtr.scala 61:52]
  wire  needCancel_10_flushItself = io_brqRedirect_bits_level & _needCancel_10_flushItself_T_3; // @[Rob.scala 122:51]
  wire  needCancel_10_differentFlag = uop_10_robIdx_flag ^ io_brqRedirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  needCancel_10_compare = uop_10_robIdx_value > io_brqRedirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _needCancel_10_T = needCancel_10_differentFlag ^ needCancel_10_compare; // @[CircularQueuePtr.scala 88:19]
  wire  _needCancel_10_T_2 = io_brqRedirect_valid & (needCancel_10_flushItself | _needCancel_10_T); // @[Rob.scala 123:20]
  wire  needCancel_10 = _needCancel_10_T_2 & allocated_10 & ~committed_10; // @[StoreQueue.scala 711:78]
  wire  _needCancel_11_flushItself_T_3 = _robMatchVec_T_44 == _enqCancel_flushItself_T_2; // @[CircularQueuePtr.scala 61:52]
  wire  needCancel_11_flushItself = io_brqRedirect_bits_level & _needCancel_11_flushItself_T_3; // @[Rob.scala 122:51]
  wire  needCancel_11_differentFlag = uop_11_robIdx_flag ^ io_brqRedirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  needCancel_11_compare = uop_11_robIdx_value > io_brqRedirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _needCancel_11_T = needCancel_11_differentFlag ^ needCancel_11_compare; // @[CircularQueuePtr.scala 88:19]
  wire  _needCancel_11_T_2 = io_brqRedirect_valid & (needCancel_11_flushItself | _needCancel_11_T); // @[Rob.scala 123:20]
  wire  needCancel_11 = _needCancel_11_T_2 & allocated_11 & ~committed_11; // @[StoreQueue.scala 711:78]
  reg  lastEnqCancel_REG_0; // @[StoreQueue.scala 720:39]
  reg  lastEnqCancel_REG_1; // @[StoreQueue.scala 720:39]
  reg  lastEnqCancel_REG_2; // @[StoreQueue.scala 720:39]
  reg  lastEnqCancel_REG_3; // @[StoreQueue.scala 720:39]
  wire [1:0] _lastEnqCancel_T_4 = lastEnqCancel_REG_0 + lastEnqCancel_REG_1; // @[Bitwise.scala 48:55]
  wire [1:0] _lastEnqCancel_T_6 = lastEnqCancel_REG_2 + lastEnqCancel_REG_3; // @[Bitwise.scala 48:55]
  wire [2:0] lastEnqCancel = _lastEnqCancel_T_4 + _lastEnqCancel_T_6; // @[Bitwise.scala 48:55]
  reg  lastCycleRedirect; // @[StoreQueue.scala 721:34]
  reg  lastCycleCancelCount_REG_0; // @[StoreQueue.scala 722:46]
  reg  lastCycleCancelCount_REG_1; // @[StoreQueue.scala 722:46]
  reg  lastCycleCancelCount_REG_2; // @[StoreQueue.scala 722:46]
  reg  lastCycleCancelCount_REG_3; // @[StoreQueue.scala 722:46]
  reg  lastCycleCancelCount_REG_4; // @[StoreQueue.scala 722:46]
  reg  lastCycleCancelCount_REG_5; // @[StoreQueue.scala 722:46]
  reg  lastCycleCancelCount_REG_6; // @[StoreQueue.scala 722:46]
  reg  lastCycleCancelCount_REG_7; // @[StoreQueue.scala 722:46]
  reg  lastCycleCancelCount_REG_8; // @[StoreQueue.scala 722:46]
  reg  lastCycleCancelCount_REG_9; // @[StoreQueue.scala 722:46]
  reg  lastCycleCancelCount_REG_10; // @[StoreQueue.scala 722:46]
  reg  lastCycleCancelCount_REG_11; // @[StoreQueue.scala 722:46]
  wire [1:0] _lastCycleCancelCount_T = lastCycleCancelCount_REG_1 + lastCycleCancelCount_REG_2; // @[Bitwise.scala 48:55]
  wire [1:0] _GEN_15694 = {{1'd0}, lastCycleCancelCount_REG_0}; // @[Bitwise.scala 48:55]
  wire [2:0] _lastCycleCancelCount_T_2 = _GEN_15694 + _lastCycleCancelCount_T; // @[Bitwise.scala 48:55]
  wire [1:0] _lastCycleCancelCount_T_4 = lastCycleCancelCount_REG_4 + lastCycleCancelCount_REG_5; // @[Bitwise.scala 48:55]
  wire [1:0] _GEN_15695 = {{1'd0}, lastCycleCancelCount_REG_3}; // @[Bitwise.scala 48:55]
  wire [2:0] _lastCycleCancelCount_T_6 = _GEN_15695 + _lastCycleCancelCount_T_4; // @[Bitwise.scala 48:55]
  wire [2:0] _lastCycleCancelCount_T_8 = _lastCycleCancelCount_T_2[1:0] + _lastCycleCancelCount_T_6[1:0]; // @[Bitwise.scala 48:55]
  wire [1:0] _lastCycleCancelCount_T_10 = lastCycleCancelCount_REG_7 + lastCycleCancelCount_REG_8; // @[Bitwise.scala 48:55]
  wire [1:0] _GEN_15696 = {{1'd0}, lastCycleCancelCount_REG_6}; // @[Bitwise.scala 48:55]
  wire [2:0] _lastCycleCancelCount_T_12 = _GEN_15696 + _lastCycleCancelCount_T_10; // @[Bitwise.scala 48:55]
  wire [1:0] _lastCycleCancelCount_T_14 = lastCycleCancelCount_REG_10 + lastCycleCancelCount_REG_11; // @[Bitwise.scala 48:55]
  wire [1:0] _GEN_15697 = {{1'd0}, lastCycleCancelCount_REG_9}; // @[Bitwise.scala 48:55]
  wire [2:0] _lastCycleCancelCount_T_16 = _GEN_15697 + _lastCycleCancelCount_T_14; // @[Bitwise.scala 48:55]
  wire [2:0] _lastCycleCancelCount_T_18 = _lastCycleCancelCount_T_12[1:0] + _lastCycleCancelCount_T_16[1:0]; // @[Bitwise.scala 48:55]
  wire [3:0] lastCycleCancelCount = _lastCycleCancelCount_T_8 + _lastCycleCancelCount_T_18; // @[Bitwise.scala 48:55]
  wire [1:0] _enqNumber_T_1 = io_enq_req_0_valid + io_enq_req_1_valid; // @[Bitwise.scala 48:55]
  wire [1:0] _enqNumber_T_3 = io_enq_req_2_valid + io_enq_req_3_valid; // @[Bitwise.scala 48:55]
  wire [2:0] _enqNumber_T_5 = _enqNumber_T_1 + _enqNumber_T_3; // @[Bitwise.scala 48:55]
  wire [2:0] enqNumber = io_enq_canAccept & io_enq_lqCanAccept ? _enqNumber_T_5 : 3'h0; // @[StoreQueue.scala 723:22]
  wire [3:0] _GEN_15698 = {{1'd0}, lastEnqCancel}; // @[StoreQueue.scala 726:66]
  wire [3:0] _T_125 = lastCycleCancelCount + _GEN_15698; // @[StoreQueue.scala 726:66]
  wire [3:0] _flipped_new_ptr_T_1 = 4'hc - _T_125; // @[CircularQueuePtr.scala 54:50]
  wire [4:0] flipped_new_ptr_new_value = enqPtrExt_0_value + _flipped_new_ptr_T_1; // @[CircularQueuePtr.scala 41:34]
  wire [5:0] _flipped_new_ptr_diff_T_1 = {1'h0,flipped_new_ptr_new_value}; // @[CircularQueuePtr.scala 42:49]
  wire [5:0] flipped_new_ptr_diff = $signed(_flipped_new_ptr_diff_T_1) - 6'shc; // @[CircularQueuePtr.scala 42:52]
  wire  flipped_new_ptr_reverse_flag = $signed(flipped_new_ptr_diff) >= 6'sh0; // @[CircularQueuePtr.scala 43:31]
  wire  flipped_new_ptr_flag = flipped_new_ptr_reverse_flag ? ~enqPtrExt_0_flag : enqPtrExt_0_flag; // @[CircularQueuePtr.scala 44:26]
  wire [5:0] _flipped_new_ptr_new_ptr_value_T = $signed(_flipped_new_ptr_diff_T_1) - 6'shc; // @[CircularQueuePtr.scala 46:20]
  wire [5:0] _flipped_new_ptr_new_ptr_value_T_1 = flipped_new_ptr_reverse_flag ? _flipped_new_ptr_new_ptr_value_T : {{1
    'd0}, flipped_new_ptr_new_value}; // @[CircularQueuePtr.scala 45:27]
  wire  new_ptr_2_flag = ~flipped_new_ptr_flag; // @[CircularQueuePtr.scala 56:21]
  wire [3:0] _GEN_15702 = {{1'd0}, enqNumber}; // @[CircularQueuePtr.scala 41:34]
  wire [4:0] new_value_2 = enqPtrExt_0_value + _GEN_15702; // @[CircularQueuePtr.scala 41:34]
  wire [5:0] _diff_T_13 = {1'h0,new_value_2}; // @[CircularQueuePtr.scala 42:49]
  wire [5:0] diff_2 = $signed(_diff_T_13) - 6'shc; // @[CircularQueuePtr.scala 42:52]
  wire  reverse_flag_2 = $signed(diff_2) >= 6'sh0; // @[CircularQueuePtr.scala 43:31]
  wire [5:0] _new_ptr_value_T_4 = $signed(_diff_T_13) - 6'shc; // @[CircularQueuePtr.scala 46:20]
  wire [5:0] _new_ptr_value_T_5 = reverse_flag_2 ? _new_ptr_value_T_4 : {{1'd0}, new_value_2}; // @[CircularQueuePtr.scala 45:27]
  wire [3:0] flipped_new_ptr_value = _flipped_new_ptr_new_ptr_value_T_1[3:0]; // @[CircularQueuePtr.scala 37:23 45:21]
  wire [3:0] new_ptr_6_value = _new_ptr_value_T_5[3:0]; // @[CircularQueuePtr.scala 37:23 45:21]
  reg [3:0] io_sqCancelCnt_REG; // @[StoreQueue.scala 737:28]
  reg  io_sqEmpty_REG; // @[StoreQueue.scala 743:24]
  wire  _T_136 = ~io_mmioStout_ready; // @[StoreQueue.scala 754:61]
  wire [3:0] _T_167 = 4'hc / 3'h4; // @[StoreQueue.scala 765:60]
  wire [3:0] _T_171 = 4'hc / 2'h2; // @[StoreQueue.scala 766:105]
  wire [5:0] _T_176 = 4'hc * 2'h3; // @[StoreQueue.scala 767:105]
  wire [5:0] _T_177 = _T_176 / 3'h4; // @[StoreQueue.scala 767:109]
  wire [5:0] _GEN_15707 = {{2'd0}, validCount}; // @[StoreQueue.scala 767:85]
  reg  io_perf_0_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg  io_perf_0_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg  io_perf_1_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg  io_perf_1_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg  io_perf_2_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg  io_perf_2_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg  io_perf_3_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg  io_perf_3_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg  io_perf_4_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg  io_perf_4_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg  io_perf_5_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg  io_perf_5_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg  io_perf_6_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg  io_perf_6_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg  io_perf_7_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg  io_perf_7_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  SQDataModule dataModule ( // @[StoreQueue.scala 95:26]
    .clock(dataModule_clock),
    .io_raddr_0(dataModule_io_raddr_0),
    .io_raddr_1(dataModule_io_raddr_1),
    .io_rdata_0_mask(dataModule_io_rdata_0_mask),
    .io_rdata_0_data(dataModule_io_rdata_0_data),
    .io_rdata_1_mask(dataModule_io_rdata_1_mask),
    .io_rdata_1_data(dataModule_io_rdata_1_data),
    .io_data_wen_0(dataModule_io_data_wen_0),
    .io_data_wen_1(dataModule_io_data_wen_1),
    .io_data_waddr_0(dataModule_io_data_waddr_0),
    .io_data_waddr_1(dataModule_io_data_waddr_1),
    .io_data_wdata_0(dataModule_io_data_wdata_0),
    .io_data_wdata_1(dataModule_io_data_wdata_1),
    .io_mask_wen_0(dataModule_io_mask_wen_0),
    .io_mask_wen_1(dataModule_io_mask_wen_1),
    .io_mask_waddr_0(dataModule_io_mask_waddr_0),
    .io_mask_waddr_1(dataModule_io_mask_waddr_1),
    .io_mask_wdata_0(dataModule_io_mask_wdata_0),
    .io_mask_wdata_1(dataModule_io_mask_wdata_1),
    .io_needForward_0_0(dataModule_io_needForward_0_0),
    .io_needForward_0_1(dataModule_io_needForward_0_1),
    .io_needForward_1_0(dataModule_io_needForward_1_0),
    .io_needForward_1_1(dataModule_io_needForward_1_1),
    .io_forwardMask_0_0(dataModule_io_forwardMask_0_0),
    .io_forwardMask_0_1(dataModule_io_forwardMask_0_1),
    .io_forwardMask_0_2(dataModule_io_forwardMask_0_2),
    .io_forwardMask_0_3(dataModule_io_forwardMask_0_3),
    .io_forwardMask_0_4(dataModule_io_forwardMask_0_4),
    .io_forwardMask_0_5(dataModule_io_forwardMask_0_5),
    .io_forwardMask_0_6(dataModule_io_forwardMask_0_6),
    .io_forwardMask_0_7(dataModule_io_forwardMask_0_7),
    .io_forwardMask_0_8(dataModule_io_forwardMask_0_8),
    .io_forwardMask_0_9(dataModule_io_forwardMask_0_9),
    .io_forwardMask_0_10(dataModule_io_forwardMask_0_10),
    .io_forwardMask_0_11(dataModule_io_forwardMask_0_11),
    .io_forwardMask_0_12(dataModule_io_forwardMask_0_12),
    .io_forwardMask_0_13(dataModule_io_forwardMask_0_13),
    .io_forwardMask_0_14(dataModule_io_forwardMask_0_14),
    .io_forwardMask_0_15(dataModule_io_forwardMask_0_15),
    .io_forwardMask_1_0(dataModule_io_forwardMask_1_0),
    .io_forwardMask_1_1(dataModule_io_forwardMask_1_1),
    .io_forwardMask_1_2(dataModule_io_forwardMask_1_2),
    .io_forwardMask_1_3(dataModule_io_forwardMask_1_3),
    .io_forwardMask_1_4(dataModule_io_forwardMask_1_4),
    .io_forwardMask_1_5(dataModule_io_forwardMask_1_5),
    .io_forwardMask_1_6(dataModule_io_forwardMask_1_6),
    .io_forwardMask_1_7(dataModule_io_forwardMask_1_7),
    .io_forwardMask_1_8(dataModule_io_forwardMask_1_8),
    .io_forwardMask_1_9(dataModule_io_forwardMask_1_9),
    .io_forwardMask_1_10(dataModule_io_forwardMask_1_10),
    .io_forwardMask_1_11(dataModule_io_forwardMask_1_11),
    .io_forwardMask_1_12(dataModule_io_forwardMask_1_12),
    .io_forwardMask_1_13(dataModule_io_forwardMask_1_13),
    .io_forwardMask_1_14(dataModule_io_forwardMask_1_14),
    .io_forwardMask_1_15(dataModule_io_forwardMask_1_15),
    .io_forwardData_0_0(dataModule_io_forwardData_0_0),
    .io_forwardData_0_1(dataModule_io_forwardData_0_1),
    .io_forwardData_0_2(dataModule_io_forwardData_0_2),
    .io_forwardData_0_3(dataModule_io_forwardData_0_3),
    .io_forwardData_0_4(dataModule_io_forwardData_0_4),
    .io_forwardData_0_5(dataModule_io_forwardData_0_5),
    .io_forwardData_0_6(dataModule_io_forwardData_0_6),
    .io_forwardData_0_7(dataModule_io_forwardData_0_7),
    .io_forwardData_0_8(dataModule_io_forwardData_0_8),
    .io_forwardData_0_9(dataModule_io_forwardData_0_9),
    .io_forwardData_0_10(dataModule_io_forwardData_0_10),
    .io_forwardData_0_11(dataModule_io_forwardData_0_11),
    .io_forwardData_0_12(dataModule_io_forwardData_0_12),
    .io_forwardData_0_13(dataModule_io_forwardData_0_13),
    .io_forwardData_0_14(dataModule_io_forwardData_0_14),
    .io_forwardData_0_15(dataModule_io_forwardData_0_15),
    .io_forwardData_1_0(dataModule_io_forwardData_1_0),
    .io_forwardData_1_1(dataModule_io_forwardData_1_1),
    .io_forwardData_1_2(dataModule_io_forwardData_1_2),
    .io_forwardData_1_3(dataModule_io_forwardData_1_3),
    .io_forwardData_1_4(dataModule_io_forwardData_1_4),
    .io_forwardData_1_5(dataModule_io_forwardData_1_5),
    .io_forwardData_1_6(dataModule_io_forwardData_1_6),
    .io_forwardData_1_7(dataModule_io_forwardData_1_7),
    .io_forwardData_1_8(dataModule_io_forwardData_1_8),
    .io_forwardData_1_9(dataModule_io_forwardData_1_9),
    .io_forwardData_1_10(dataModule_io_forwardData_1_10),
    .io_forwardData_1_11(dataModule_io_forwardData_1_11),
    .io_forwardData_1_12(dataModule_io_forwardData_1_12),
    .io_forwardData_1_13(dataModule_io_forwardData_1_13),
    .io_forwardData_1_14(dataModule_io_forwardData_1_14),
    .io_forwardData_1_15(dataModule_io_forwardData_1_15)
  );
  SQAddrModule paddrModule ( // @[StoreQueue.scala 102:27]
    .clock(paddrModule_clock),
    .io_raddr_0(paddrModule_io_raddr_0),
    .io_raddr_1(paddrModule_io_raddr_1),
    .io_rdata_0(paddrModule_io_rdata_0),
    .io_rdata_1(paddrModule_io_rdata_1),
    .io_rlineflag_0(paddrModule_io_rlineflag_0),
    .io_rlineflag_1(paddrModule_io_rlineflag_1),
    .io_wen_0(paddrModule_io_wen_0),
    .io_wen_1(paddrModule_io_wen_1),
    .io_waddr_0(paddrModule_io_waddr_0),
    .io_waddr_1(paddrModule_io_waddr_1),
    .io_wdata_0(paddrModule_io_wdata_0),
    .io_wdata_1(paddrModule_io_wdata_1),
    .io_wlineflag_0(paddrModule_io_wlineflag_0),
    .io_wlineflag_1(paddrModule_io_wlineflag_1),
    .io_forwardMdata_0(paddrModule_io_forwardMdata_0),
    .io_forwardMdata_1(paddrModule_io_forwardMdata_1),
    .io_forwardMmask_0_0(paddrModule_io_forwardMmask_0_0),
    .io_forwardMmask_0_1(paddrModule_io_forwardMmask_0_1),
    .io_forwardMmask_0_2(paddrModule_io_forwardMmask_0_2),
    .io_forwardMmask_0_3(paddrModule_io_forwardMmask_0_3),
    .io_forwardMmask_0_4(paddrModule_io_forwardMmask_0_4),
    .io_forwardMmask_0_5(paddrModule_io_forwardMmask_0_5),
    .io_forwardMmask_0_6(paddrModule_io_forwardMmask_0_6),
    .io_forwardMmask_0_7(paddrModule_io_forwardMmask_0_7),
    .io_forwardMmask_0_8(paddrModule_io_forwardMmask_0_8),
    .io_forwardMmask_0_9(paddrModule_io_forwardMmask_0_9),
    .io_forwardMmask_0_10(paddrModule_io_forwardMmask_0_10),
    .io_forwardMmask_0_11(paddrModule_io_forwardMmask_0_11),
    .io_forwardMmask_1_0(paddrModule_io_forwardMmask_1_0),
    .io_forwardMmask_1_1(paddrModule_io_forwardMmask_1_1),
    .io_forwardMmask_1_2(paddrModule_io_forwardMmask_1_2),
    .io_forwardMmask_1_3(paddrModule_io_forwardMmask_1_3),
    .io_forwardMmask_1_4(paddrModule_io_forwardMmask_1_4),
    .io_forwardMmask_1_5(paddrModule_io_forwardMmask_1_5),
    .io_forwardMmask_1_6(paddrModule_io_forwardMmask_1_6),
    .io_forwardMmask_1_7(paddrModule_io_forwardMmask_1_7),
    .io_forwardMmask_1_8(paddrModule_io_forwardMmask_1_8),
    .io_forwardMmask_1_9(paddrModule_io_forwardMmask_1_9),
    .io_forwardMmask_1_10(paddrModule_io_forwardMmask_1_10),
    .io_forwardMmask_1_11(paddrModule_io_forwardMmask_1_11)
  );
  SQAddrModule_1 vaddrModule ( // @[StoreQueue.scala 110:27]
    .clock(vaddrModule_clock),
    .io_raddr_0(vaddrModule_io_raddr_0),
    .io_raddr_1(vaddrModule_io_raddr_1),
    .io_raddr_2(vaddrModule_io_raddr_2),
    .io_rdata_0(vaddrModule_io_rdata_0),
    .io_rdata_1(vaddrModule_io_rdata_1),
    .io_rdata_2(vaddrModule_io_rdata_2),
    .io_wen_0(vaddrModule_io_wen_0),
    .io_wen_1(vaddrModule_io_wen_1),
    .io_waddr_0(vaddrModule_io_waddr_0),
    .io_waddr_1(vaddrModule_io_waddr_1),
    .io_wdata_0(vaddrModule_io_wdata_0),
    .io_wdata_1(vaddrModule_io_wdata_1),
    .io_wlineflag_0(vaddrModule_io_wlineflag_0),
    .io_wlineflag_1(vaddrModule_io_wlineflag_1),
    .io_forwardMdata_0(vaddrModule_io_forwardMdata_0),
    .io_forwardMdata_1(vaddrModule_io_forwardMdata_1),
    .io_forwardMmask_0_0(vaddrModule_io_forwardMmask_0_0),
    .io_forwardMmask_0_1(vaddrModule_io_forwardMmask_0_1),
    .io_forwardMmask_0_2(vaddrModule_io_forwardMmask_0_2),
    .io_forwardMmask_0_3(vaddrModule_io_forwardMmask_0_3),
    .io_forwardMmask_0_4(vaddrModule_io_forwardMmask_0_4),
    .io_forwardMmask_0_5(vaddrModule_io_forwardMmask_0_5),
    .io_forwardMmask_0_6(vaddrModule_io_forwardMmask_0_6),
    .io_forwardMmask_0_7(vaddrModule_io_forwardMmask_0_7),
    .io_forwardMmask_0_8(vaddrModule_io_forwardMmask_0_8),
    .io_forwardMmask_0_9(vaddrModule_io_forwardMmask_0_9),
    .io_forwardMmask_0_10(vaddrModule_io_forwardMmask_0_10),
    .io_forwardMmask_0_11(vaddrModule_io_forwardMmask_0_11),
    .io_forwardMmask_1_0(vaddrModule_io_forwardMmask_1_0),
    .io_forwardMmask_1_1(vaddrModule_io_forwardMmask_1_1),
    .io_forwardMmask_1_2(vaddrModule_io_forwardMmask_1_2),
    .io_forwardMmask_1_3(vaddrModule_io_forwardMmask_1_3),
    .io_forwardMmask_1_4(vaddrModule_io_forwardMmask_1_4),
    .io_forwardMmask_1_5(vaddrModule_io_forwardMmask_1_5),
    .io_forwardMmask_1_6(vaddrModule_io_forwardMmask_1_6),
    .io_forwardMmask_1_7(vaddrModule_io_forwardMmask_1_7),
    .io_forwardMmask_1_8(vaddrModule_io_forwardMmask_1_8),
    .io_forwardMmask_1_9(vaddrModule_io_forwardMmask_1_9),
    .io_forwardMmask_1_10(vaddrModule_io_forwardMmask_1_10),
    .io_forwardMmask_1_11(vaddrModule_io_forwardMmask_1_11)
  );
  DatamoduleResultBuffer dataBuffer ( // @[StoreQueue.scala 118:26]
    .clock(dataBuffer_clock),
    .reset(dataBuffer_reset),
    .io_enq_0_ready(dataBuffer_io_enq_0_ready),
    .io_enq_0_valid(dataBuffer_io_enq_0_valid),
    .io_enq_0_bits_addr(dataBuffer_io_enq_0_bits_addr),
    .io_enq_0_bits_vaddr(dataBuffer_io_enq_0_bits_vaddr),
    .io_enq_0_bits_data(dataBuffer_io_enq_0_bits_data),
    .io_enq_0_bits_mask(dataBuffer_io_enq_0_bits_mask),
    .io_enq_0_bits_wline(dataBuffer_io_enq_0_bits_wline),
    .io_enq_0_bits_sqPtr_value(dataBuffer_io_enq_0_bits_sqPtr_value),
    .io_enq_1_ready(dataBuffer_io_enq_1_ready),
    .io_enq_1_valid(dataBuffer_io_enq_1_valid),
    .io_enq_1_bits_addr(dataBuffer_io_enq_1_bits_addr),
    .io_enq_1_bits_vaddr(dataBuffer_io_enq_1_bits_vaddr),
    .io_enq_1_bits_data(dataBuffer_io_enq_1_bits_data),
    .io_enq_1_bits_mask(dataBuffer_io_enq_1_bits_mask),
    .io_enq_1_bits_wline(dataBuffer_io_enq_1_bits_wline),
    .io_enq_1_bits_sqPtr_value(dataBuffer_io_enq_1_bits_sqPtr_value),
    .io_deq_0_ready(dataBuffer_io_deq_0_ready),
    .io_deq_0_valid(dataBuffer_io_deq_0_valid),
    .io_deq_0_bits_addr(dataBuffer_io_deq_0_bits_addr),
    .io_deq_0_bits_vaddr(dataBuffer_io_deq_0_bits_vaddr),
    .io_deq_0_bits_data(dataBuffer_io_deq_0_bits_data),
    .io_deq_0_bits_mask(dataBuffer_io_deq_0_bits_mask),
    .io_deq_0_bits_wline(dataBuffer_io_deq_0_bits_wline),
    .io_deq_0_bits_sqPtr_value(dataBuffer_io_deq_0_bits_sqPtr_value),
    .io_deq_1_ready(dataBuffer_io_deq_1_ready),
    .io_deq_1_valid(dataBuffer_io_deq_1_valid),
    .io_deq_1_bits_addr(dataBuffer_io_deq_1_bits_addr),
    .io_deq_1_bits_vaddr(dataBuffer_io_deq_1_bits_vaddr),
    .io_deq_1_bits_data(dataBuffer_io_deq_1_bits_data),
    .io_deq_1_bits_mask(dataBuffer_io_deq_1_bits_mask),
    .io_deq_1_bits_wline(dataBuffer_io_deq_1_bits_wline),
    .io_deq_1_bits_sqPtr_value(dataBuffer_io_deq_1_bits_sqPtr_value)
  );
  assign io_enq_canAccept = validCount <= 4'ha; // @[StoreQueue.scala 148:33]
  assign io_sbuffer_0_valid = dataBuffer_io_deq_0_valid; // @[StoreQueue.scala 641:25]
  assign io_sbuffer_0_bits_addr = dataBuffer_io_deq_0_bits_addr; // @[StoreQueue.scala 646:30]
  assign io_sbuffer_0_bits_data = dataBuffer_io_deq_0_bits_data; // @[StoreQueue.scala 648:30]
  assign io_sbuffer_0_bits_mask = dataBuffer_io_deq_0_bits_mask; // @[StoreQueue.scala 649:30]
  assign io_sbuffer_0_bits_vaddr = dataBuffer_io_deq_0_bits_vaddr; // @[StoreQueue.scala 647:30]
  assign io_sbuffer_0_bits_wline = dataBuffer_io_deq_0_bits_wline; // @[StoreQueue.scala 650:30]
  assign io_sbuffer_1_valid = dataBuffer_io_deq_1_valid; // @[StoreQueue.scala 641:25]
  assign io_sbuffer_1_bits_addr = dataBuffer_io_deq_1_bits_addr; // @[StoreQueue.scala 646:30]
  assign io_sbuffer_1_bits_data = dataBuffer_io_deq_1_bits_data; // @[StoreQueue.scala 648:30]
  assign io_sbuffer_1_bits_mask = dataBuffer_io_deq_1_bits_mask; // @[StoreQueue.scala 649:30]
  assign io_sbuffer_1_bits_vaddr = dataBuffer_io_deq_1_bits_vaddr; // @[StoreQueue.scala 647:30]
  assign io_sbuffer_1_bits_wline = dataBuffer_io_deq_1_bits_wline; // @[StoreQueue.scala 650:30]
  assign io_mmioStout_valid = uncacheState == 3'h3; // @[StoreQueue.scala 578:38]
  assign io_mmioStout_bits_uop_cf_trigger_backendEn_0 = 4'hb == deqPtrExt_0_value ? uop_11_cf_trigger_backendEn_0 :
    _GEN_14278; // @[StoreQueue.scala 579:{25,25}]
  assign io_mmioStout_bits_uop_robIdx_flag = 4'hb == deqPtrExt_0_value ? uop_11_robIdx_flag : _GEN_15082; // @[StoreQueue.scala 579:{25,25}]
  assign io_mmioStout_bits_uop_robIdx_value = 4'hb == deqPtrExt_0_value ? uop_11_robIdx_value : _GEN_15094; // @[StoreQueue.scala 579:{25,25}]
  assign io_forward_0_forwardMask_0 = dataModule_io_forwardMask_0_0; // @[StoreQueue.scala 439:31]
  assign io_forward_0_forwardMask_1 = dataModule_io_forwardMask_0_1; // @[StoreQueue.scala 439:31]
  assign io_forward_0_forwardMask_2 = dataModule_io_forwardMask_0_2; // @[StoreQueue.scala 439:31]
  assign io_forward_0_forwardMask_3 = dataModule_io_forwardMask_0_3; // @[StoreQueue.scala 439:31]
  assign io_forward_0_forwardMask_4 = dataModule_io_forwardMask_0_4; // @[StoreQueue.scala 439:31]
  assign io_forward_0_forwardMask_5 = dataModule_io_forwardMask_0_5; // @[StoreQueue.scala 439:31]
  assign io_forward_0_forwardMask_6 = dataModule_io_forwardMask_0_6; // @[StoreQueue.scala 439:31]
  assign io_forward_0_forwardMask_7 = dataModule_io_forwardMask_0_7; // @[StoreQueue.scala 439:31]
  assign io_forward_0_forwardMask_8 = dataModule_io_forwardMask_0_8; // @[StoreQueue.scala 439:31]
  assign io_forward_0_forwardMask_9 = dataModule_io_forwardMask_0_9; // @[StoreQueue.scala 439:31]
  assign io_forward_0_forwardMask_10 = dataModule_io_forwardMask_0_10; // @[StoreQueue.scala 439:31]
  assign io_forward_0_forwardMask_11 = dataModule_io_forwardMask_0_11; // @[StoreQueue.scala 439:31]
  assign io_forward_0_forwardMask_12 = dataModule_io_forwardMask_0_12; // @[StoreQueue.scala 439:31]
  assign io_forward_0_forwardMask_13 = dataModule_io_forwardMask_0_13; // @[StoreQueue.scala 439:31]
  assign io_forward_0_forwardMask_14 = dataModule_io_forwardMask_0_14; // @[StoreQueue.scala 439:31]
  assign io_forward_0_forwardMask_15 = dataModule_io_forwardMask_0_15; // @[StoreQueue.scala 439:31]
  assign io_forward_0_forwardData_0 = dataModule_io_forwardData_0_0; // @[StoreQueue.scala 440:31]
  assign io_forward_0_forwardData_1 = dataModule_io_forwardData_0_1; // @[StoreQueue.scala 440:31]
  assign io_forward_0_forwardData_2 = dataModule_io_forwardData_0_2; // @[StoreQueue.scala 440:31]
  assign io_forward_0_forwardData_3 = dataModule_io_forwardData_0_3; // @[StoreQueue.scala 440:31]
  assign io_forward_0_forwardData_4 = dataModule_io_forwardData_0_4; // @[StoreQueue.scala 440:31]
  assign io_forward_0_forwardData_5 = dataModule_io_forwardData_0_5; // @[StoreQueue.scala 440:31]
  assign io_forward_0_forwardData_6 = dataModule_io_forwardData_0_6; // @[StoreQueue.scala 440:31]
  assign io_forward_0_forwardData_7 = dataModule_io_forwardData_0_7; // @[StoreQueue.scala 440:31]
  assign io_forward_0_forwardData_8 = dataModule_io_forwardData_0_8; // @[StoreQueue.scala 440:31]
  assign io_forward_0_forwardData_9 = dataModule_io_forwardData_0_9; // @[StoreQueue.scala 440:31]
  assign io_forward_0_forwardData_10 = dataModule_io_forwardData_0_10; // @[StoreQueue.scala 440:31]
  assign io_forward_0_forwardData_11 = dataModule_io_forwardData_0_11; // @[StoreQueue.scala 440:31]
  assign io_forward_0_forwardData_12 = dataModule_io_forwardData_0_12; // @[StoreQueue.scala 440:31]
  assign io_forward_0_forwardData_13 = dataModule_io_forwardData_0_13; // @[StoreQueue.scala 440:31]
  assign io_forward_0_forwardData_14 = dataModule_io_forwardData_0_14; // @[StoreQueue.scala 440:31]
  assign io_forward_0_forwardData_15 = dataModule_io_forwardData_0_15; // @[StoreQueue.scala 440:31]
  assign io_forward_0_dataInvalid = io_forward_0_dataInvalid_REG; // @[StoreQueue.scala 448:31]
  assign io_forward_0_matchInvalid = vpmaskNotEqual & vaddrMatchFailed_REG; // @[StoreQueue.scala 424:43]
  assign io_forward_0_schedWait = _io_forward_0_schedWait_T_7 != 12'h0; // @[StoreQueue.scala 488:7]
  assign io_forward_0_dataInvalidFast = |dataInvalidMask; // @[StoreQueue.scala 445:54]
  assign io_forward_0_dataInvalidSqIdx_flag = |dataInvalidMaskReg ? _io_forward_0_dataInvalidSqIdx_flag_T_3 :
    io_forward_0_dataInvalidSqIdx_REG_flag; // @[StoreQueue.scala 464:46 465:43 469:38]
  assign io_forward_0_dataInvalidSqIdx_value = |dataInvalidMaskReg ? dataInvalidSqIdx :
    io_forward_0_dataInvalidSqIdx_REG_value; // @[StoreQueue.scala 464:46 466:44 469:38]
  assign io_forward_0_addrInvalidSqIdx_flag = |_addrInvalidSqIdx_T ? _io_forward_0_addrInvalidSqIdx_flag_T_3 :
    io_forward_0_addrInvalidSqIdx_REG_flag; // @[StoreQueue.scala 474:35 475:43 479:38]
  assign io_forward_0_addrInvalidSqIdx_value = |_addrInvalidSqIdx_T ? addrInvalidSqIdx :
    io_forward_0_addrInvalidSqIdx_REG_value; // @[StoreQueue.scala 474:35 476:44 479:38]
  assign io_forward_1_forwardMask_0 = dataModule_io_forwardMask_1_0; // @[StoreQueue.scala 439:31]
  assign io_forward_1_forwardMask_1 = dataModule_io_forwardMask_1_1; // @[StoreQueue.scala 439:31]
  assign io_forward_1_forwardMask_2 = dataModule_io_forwardMask_1_2; // @[StoreQueue.scala 439:31]
  assign io_forward_1_forwardMask_3 = dataModule_io_forwardMask_1_3; // @[StoreQueue.scala 439:31]
  assign io_forward_1_forwardMask_4 = dataModule_io_forwardMask_1_4; // @[StoreQueue.scala 439:31]
  assign io_forward_1_forwardMask_5 = dataModule_io_forwardMask_1_5; // @[StoreQueue.scala 439:31]
  assign io_forward_1_forwardMask_6 = dataModule_io_forwardMask_1_6; // @[StoreQueue.scala 439:31]
  assign io_forward_1_forwardMask_7 = dataModule_io_forwardMask_1_7; // @[StoreQueue.scala 439:31]
  assign io_forward_1_forwardMask_8 = dataModule_io_forwardMask_1_8; // @[StoreQueue.scala 439:31]
  assign io_forward_1_forwardMask_9 = dataModule_io_forwardMask_1_9; // @[StoreQueue.scala 439:31]
  assign io_forward_1_forwardMask_10 = dataModule_io_forwardMask_1_10; // @[StoreQueue.scala 439:31]
  assign io_forward_1_forwardMask_11 = dataModule_io_forwardMask_1_11; // @[StoreQueue.scala 439:31]
  assign io_forward_1_forwardMask_12 = dataModule_io_forwardMask_1_12; // @[StoreQueue.scala 439:31]
  assign io_forward_1_forwardMask_13 = dataModule_io_forwardMask_1_13; // @[StoreQueue.scala 439:31]
  assign io_forward_1_forwardMask_14 = dataModule_io_forwardMask_1_14; // @[StoreQueue.scala 439:31]
  assign io_forward_1_forwardMask_15 = dataModule_io_forwardMask_1_15; // @[StoreQueue.scala 439:31]
  assign io_forward_1_forwardData_0 = dataModule_io_forwardData_1_0; // @[StoreQueue.scala 440:31]
  assign io_forward_1_forwardData_1 = dataModule_io_forwardData_1_1; // @[StoreQueue.scala 440:31]
  assign io_forward_1_forwardData_2 = dataModule_io_forwardData_1_2; // @[StoreQueue.scala 440:31]
  assign io_forward_1_forwardData_3 = dataModule_io_forwardData_1_3; // @[StoreQueue.scala 440:31]
  assign io_forward_1_forwardData_4 = dataModule_io_forwardData_1_4; // @[StoreQueue.scala 440:31]
  assign io_forward_1_forwardData_5 = dataModule_io_forwardData_1_5; // @[StoreQueue.scala 440:31]
  assign io_forward_1_forwardData_6 = dataModule_io_forwardData_1_6; // @[StoreQueue.scala 440:31]
  assign io_forward_1_forwardData_7 = dataModule_io_forwardData_1_7; // @[StoreQueue.scala 440:31]
  assign io_forward_1_forwardData_8 = dataModule_io_forwardData_1_8; // @[StoreQueue.scala 440:31]
  assign io_forward_1_forwardData_9 = dataModule_io_forwardData_1_9; // @[StoreQueue.scala 440:31]
  assign io_forward_1_forwardData_10 = dataModule_io_forwardData_1_10; // @[StoreQueue.scala 440:31]
  assign io_forward_1_forwardData_11 = dataModule_io_forwardData_1_11; // @[StoreQueue.scala 440:31]
  assign io_forward_1_forwardData_12 = dataModule_io_forwardData_1_12; // @[StoreQueue.scala 440:31]
  assign io_forward_1_forwardData_13 = dataModule_io_forwardData_1_13; // @[StoreQueue.scala 440:31]
  assign io_forward_1_forwardData_14 = dataModule_io_forwardData_1_14; // @[StoreQueue.scala 440:31]
  assign io_forward_1_forwardData_15 = dataModule_io_forwardData_1_15; // @[StoreQueue.scala 440:31]
  assign io_forward_1_dataInvalid = io_forward_1_dataInvalid_REG; // @[StoreQueue.scala 448:31]
  assign io_forward_1_matchInvalid = vpmaskNotEqual_1 & vaddrMatchFailed_REG_1; // @[StoreQueue.scala 424:43]
  assign io_forward_1_schedWait = _io_forward_1_schedWait_T_7 != 12'h0; // @[StoreQueue.scala 488:7]
  assign io_forward_1_dataInvalidFast = |dataInvalidMask_1; // @[StoreQueue.scala 445:54]
  assign io_forward_1_dataInvalidSqIdx_flag = |dataInvalidMaskReg_1 ? _io_forward_1_dataInvalidSqIdx_flag_T_3 :
    io_forward_1_dataInvalidSqIdx_REG_flag; // @[StoreQueue.scala 464:46 465:43 469:38]
  assign io_forward_1_dataInvalidSqIdx_value = |dataInvalidMaskReg_1 ? dataInvalidSqIdx_1 :
    io_forward_1_dataInvalidSqIdx_REG_value; // @[StoreQueue.scala 464:46 466:44 469:38]
  assign io_forward_1_addrInvalidSqIdx_flag = |_addrInvalidSqIdx_T_23 ? _io_forward_1_addrInvalidSqIdx_flag_T_3 :
    io_forward_1_addrInvalidSqIdx_REG_flag; // @[StoreQueue.scala 474:35 475:43 479:38]
  assign io_forward_1_addrInvalidSqIdx_value = |_addrInvalidSqIdx_T_23 ? addrInvalidSqIdx_1 :
    io_forward_1_addrInvalidSqIdx_REG_value; // @[StoreQueue.scala 474:35 476:44 479:38]
  assign io_uncache_req_valid = uncacheState == 3'h1; // @[StoreQueue.scala 538:40]
  assign io_uncache_req_bits_addr = paddrModule_io_rdata_0; // @[StoreQueue.scala 541:28 550:60]
  assign io_uncache_req_bits_data = _GEN_13954[63:0];
  assign io_uncache_req_bits_mask = _io_uncache_req_bits_mask_T_2[7:0];
  assign io_uncache_req_bits_atomic = 4'hb == io_uncache_req_bits_atomic_REG_value ? atomic_11 : _GEN_13966; // @[StoreQueue.scala 559:{30,30}]
  assign io_uncache_resp_ready = 1'h1; // @[StoreQueue.scala 575:25]
  assign io_exceptionAddr_vaddr = vaddrModule_io_rdata_2; // @[StoreQueue.scala 705:26]
  assign io_sqEmpty = io_sqEmpty_REG; // @[StoreQueue.scala 743:14]
  assign io_stAddrReadySqPtr_flag = addrReadyPtrExt_flag; // @[StoreQueue.scala 250:23]
  assign io_stAddrReadySqPtr_value = addrReadyPtrExt_value; // @[StoreQueue.scala 250:23]
  assign io_stDataReadySqPtr_flag = dataReadyPtrExt_flag; // @[StoreQueue.scala 266:23]
  assign io_stDataReadySqPtr_value = dataReadyPtrExt_value; // @[StoreQueue.scala 266:23]
  assign io_sqCancelCnt = io_sqCancelCnt_REG; // @[StoreQueue.scala 737:18]
  assign io_sqDeq = io_sqDeq_REG_2; // @[StoreQueue.scala 185:12]
  assign io_perf_0_value = {{5'd0}, io_perf_0_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_1_value = {{5'd0}, io_perf_1_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_2_value = {{5'd0}, io_perf_2_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_3_value = {{5'd0}, io_perf_3_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_4_value = {{5'd0}, io_perf_4_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_5_value = {{5'd0}, io_perf_5_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_6_value = {{5'd0}, io_perf_6_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_7_value = {{5'd0}, io_perf_7_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign dataModule_clock = clock;
  assign dataModule_io_raddr_0 = _rdataPtrExtNext_T ? rdataPtrExtNext_new_ptr_value : _rdataPtrExtNext_T_4_0_value; // @[StoreQueue.scala 162:37]
  assign dataModule_io_raddr_1 = _rdataPtrExtNext_T ? rdataPtrExtNext_new_ptr_1_value : _rdataPtrExtNext_T_4_1_value; // @[StoreQueue.scala 162:37]
  assign dataModule_io_data_wen_0 = io_storeDataIn_0_valid; // @[StoreQueue.scala 336:31 340:37 347:33]
  assign dataModule_io_data_wen_1 = io_storeDataIn_1_valid; // @[StoreQueue.scala 336:31 340:37 347:33]
  assign dataModule_io_data_waddr_0 = io_storeDataIn_0_bits_uop_sqIdx_value; // @[StoreQueue.scala 340:37 342:35]
  assign dataModule_io_data_waddr_1 = io_storeDataIn_1_bits_uop_sqIdx_value; // @[StoreQueue.scala 340:37 342:35]
  assign dataModule_io_data_wdata_0 = io_storeDataIn_0_bits_uop_ctrl_fuOpType == 7'h7 ? 128'h0 :
    _dataModule_io_data_wdata_0_T_26; // @[StoreQueue.scala 343:41]
  assign dataModule_io_data_wdata_1 = io_storeDataIn_1_bits_uop_ctrl_fuOpType == 7'h7 ? 128'h0 :
    _dataModule_io_data_wdata_1_T_26; // @[StoreQueue.scala 343:41]
  assign dataModule_io_mask_wen_0 = io_storeMaskIn_0_valid; // @[StoreQueue.scala 286:31 371:37 375:33]
  assign dataModule_io_mask_wen_1 = io_storeMaskIn_1_valid; // @[StoreQueue.scala 286:31 371:37 375:33]
  assign dataModule_io_mask_waddr_0 = io_storeMaskIn_0_bits_sqIdx_value; // @[StoreQueue.scala 371:37 373:35]
  assign dataModule_io_mask_waddr_1 = io_storeMaskIn_1_bits_sqIdx_value; // @[StoreQueue.scala 371:37 373:35]
  assign dataModule_io_mask_wdata_0 = io_storeMaskIn_0_bits_mask; // @[StoreQueue.scala 371:37 374:35]
  assign dataModule_io_mask_wdata_1 = io_storeMaskIn_1_bits_mask; // @[StoreQueue.scala 371:37 374:35]
  assign dataModule_io_needForward_0_0 = _dataModule_io_needForward_0_0_T_1 & _dataModule_io_needForward_0_0_T_3; // @[StoreQueue.scala 409:92]
  assign dataModule_io_needForward_0_1 = _dataModule_io_needForward_0_1_T_1 & _dataModule_io_needForward_0_0_T_3; // @[StoreQueue.scala 410:92]
  assign dataModule_io_needForward_1_0 = _dataModule_io_needForward_1_0_T_1 & _dataModule_io_needForward_0_0_T_3; // @[StoreQueue.scala 409:92]
  assign dataModule_io_needForward_1_1 = _dataModule_io_needForward_1_1_T_1 & _dataModule_io_needForward_0_0_T_3; // @[StoreQueue.scala 410:92]
  assign paddrModule_clock = clock;
  assign paddrModule_io_raddr_0 = _rdataPtrExtNext_T ? rdataPtrExtNext_new_ptr_value : _rdataPtrExtNext_T_4_0_value; // @[StoreQueue.scala 162:37]
  assign paddrModule_io_raddr_1 = _rdataPtrExtNext_T ? rdataPtrExtNext_new_ptr_1_value : _rdataPtrExtNext_T_4_1_value; // @[StoreQueue.scala 162:37]
  assign paddrModule_io_wen_0 = io_storeAddrIn_0_valid; // @[StoreQueue.scala 284:27 288:37 296:29]
  assign paddrModule_io_wen_1 = io_storeAddrIn_1_valid; // @[StoreQueue.scala 284:27 288:37 296:29]
  assign paddrModule_io_waddr_0 = io_storeAddrIn_0_bits_uop_sqIdx_value; // @[StoreQueue.scala 288:37 293:31]
  assign paddrModule_io_waddr_1 = io_storeAddrIn_1_bits_uop_sqIdx_value; // @[StoreQueue.scala 288:37 293:31]
  assign paddrModule_io_wdata_0 = io_storeAddrIn_0_bits_paddr; // @[StoreQueue.scala 288:37 294:31]
  assign paddrModule_io_wdata_1 = io_storeAddrIn_1_bits_paddr; // @[StoreQueue.scala 288:37 294:31]
  assign paddrModule_io_wlineflag_0 = io_storeAddrIn_0_bits_wlineflag; // @[StoreQueue.scala 288:37 295:35]
  assign paddrModule_io_wlineflag_1 = io_storeAddrIn_1_bits_wlineflag; // @[StoreQueue.scala 288:37 295:35]
  assign paddrModule_io_forwardMdata_0 = io_forward_0_paddr; // @[StoreQueue.scala 413:36]
  assign paddrModule_io_forwardMdata_1 = io_forward_1_paddr; // @[StoreQueue.scala 413:36]
  assign vaddrModule_clock = clock;
  assign vaddrModule_io_raddr_0 = _rdataPtrExtNext_T ? rdataPtrExtNext_new_ptr_value : _rdataPtrExtNext_T_4_0_value; // @[StoreQueue.scala 162:37]
  assign vaddrModule_io_raddr_1 = _rdataPtrExtNext_T ? rdataPtrExtNext_new_ptr_1_value : _rdataPtrExtNext_T_4_1_value; // @[StoreQueue.scala 162:37]
  assign vaddrModule_io_raddr_2 = _vaddrModule_io_raddr_2_new_ptr_value_T_1[3:0]; // @[CircularQueuePtr.scala 37:23 45:21]
  assign vaddrModule_io_wen_0 = io_storeAddrIn_0_valid; // @[StoreQueue.scala 284:27 288:37 296:29]
  assign vaddrModule_io_wen_1 = io_storeAddrIn_1_valid; // @[StoreQueue.scala 284:27 288:37 296:29]
  assign vaddrModule_io_waddr_0 = io_storeAddrIn_0_bits_uop_sqIdx_value; // @[StoreQueue.scala 288:37 293:31]
  assign vaddrModule_io_waddr_1 = io_storeAddrIn_1_bits_uop_sqIdx_value; // @[StoreQueue.scala 288:37 293:31]
  assign vaddrModule_io_wdata_0 = io_storeAddrIn_0_bits_vaddr; // @[StoreQueue.scala 288:37 299:31]
  assign vaddrModule_io_wdata_1 = io_storeAddrIn_1_bits_vaddr; // @[StoreQueue.scala 288:37 299:31]
  assign vaddrModule_io_wlineflag_0 = io_storeAddrIn_0_bits_wlineflag; // @[StoreQueue.scala 288:37 295:35]
  assign vaddrModule_io_wlineflag_1 = io_storeAddrIn_1_bits_wlineflag; // @[StoreQueue.scala 288:37 295:35]
  assign vaddrModule_io_forwardMdata_0 = io_forward_0_vaddr; // @[StoreQueue.scala 412:36]
  assign vaddrModule_io_forwardMdata_1 = io_forward_1_vaddr; // @[StoreQueue.scala 412:36]
  assign dataBuffer_clock = clock;
  assign dataBuffer_reset = reset;
  assign dataBuffer_io_enq_0_valid = _GEN_15371 & _GEN_15383 & ~_GEN_15395; // @[StoreQueue.scala 628:68]
  assign dataBuffer_io_enq_0_bits_addr = paddrModule_io_rdata_0; // @[StoreQueue.scala 631:37]
  assign dataBuffer_io_enq_0_bits_vaddr = vaddrModule_io_rdata_0; // @[StoreQueue.scala 632:37]
  assign dataBuffer_io_enq_0_bits_data = dataModule_io_rdata_0_data; // @[StoreQueue.scala 633:37]
  assign dataBuffer_io_enq_0_bits_mask = dataModule_io_rdata_0_mask; // @[StoreQueue.scala 634:37]
  assign dataBuffer_io_enq_0_bits_wline = paddrModule_io_rlineflag_0; // @[StoreQueue.scala 635:37]
  assign dataBuffer_io_enq_0_bits_sqPtr_value = rdataPtrExt_0_value; // @[StoreQueue.scala 636:37]
  assign dataBuffer_io_enq_1_valid = _GEN_15419 & _GEN_15431 & ~_GEN_15395; // @[StoreQueue.scala 628:68]
  assign dataBuffer_io_enq_1_bits_addr = paddrModule_io_rdata_1; // @[StoreQueue.scala 631:37]
  assign dataBuffer_io_enq_1_bits_vaddr = vaddrModule_io_rdata_1; // @[StoreQueue.scala 632:37]
  assign dataBuffer_io_enq_1_bits_data = dataModule_io_rdata_1_data; // @[StoreQueue.scala 633:37]
  assign dataBuffer_io_enq_1_bits_mask = dataModule_io_rdata_1_mask; // @[StoreQueue.scala 634:37]
  assign dataBuffer_io_enq_1_bits_wline = paddrModule_io_rlineflag_1; // @[StoreQueue.scala 635:37]
  assign dataBuffer_io_enq_1_bits_sqPtr_value = rdataPtrExt_1_value; // @[StoreQueue.scala 636:37]
  assign dataBuffer_io_deq_0_ready = io_sbuffer_0_ready; // @[StoreQueue.scala 642:32]
  assign dataBuffer_io_deq_1_ready = io_sbuffer_1_ready; // @[StoreQueue.scala 642:32]
  always @(posedge clock) begin
    if (io_enq_req_3_valid & ~enqCancel_3) begin // @[StoreQueue.scala 211:43]
      if (4'h0 == io_enq_req_3_bits_sqIdx_value) begin // @[StoreQueue.scala 212:18]
        uop_0_cf_trigger_backendEn_0 <= io_enq_req_3_bits_cf_trigger_backendEn_0; // @[StoreQueue.scala 212:18]
      end else begin
        uop_0_cf_trigger_backendEn_0 <= _GEN_7204;
      end
    end else begin
      uop_0_cf_trigger_backendEn_0 <= _GEN_7204;
    end
    if (io_storeAddrIn_1_valid) begin // @[StoreQueue.scala 288:37]
      if (4'h0 == io_storeAddrIn_1_bits_uop_sqIdx_value) begin // @[StoreQueue.scala 307:27]
        uop_0_ctrl_fuOpType <= io_storeAddrIn_1_bits_uop_ctrl_fuOpType; // @[StoreQueue.scala 307:27]
      end else begin
        uop_0_ctrl_fuOpType <= _GEN_11973;
      end
    end else begin
      uop_0_ctrl_fuOpType <= _GEN_11973;
    end
    if (io_enq_req_3_valid & ~enqCancel_3) begin // @[StoreQueue.scala 211:43]
      if (4'h0 == io_enq_req_3_bits_sqIdx_value) begin // @[StoreQueue.scala 212:18]
        uop_0_robIdx_flag <= io_enq_req_3_bits_robIdx_flag; // @[StoreQueue.scala 212:18]
      end else begin
        uop_0_robIdx_flag <= _GEN_8020;
      end
    end else begin
      uop_0_robIdx_flag <= _GEN_8020;
    end
    if (io_enq_req_3_valid & ~enqCancel_3) begin // @[StoreQueue.scala 211:43]
      if (4'h0 == io_enq_req_3_bits_sqIdx_value) begin // @[StoreQueue.scala 212:18]
        uop_0_robIdx_value <= io_enq_req_3_bits_robIdx_value; // @[StoreQueue.scala 212:18]
      end else begin
        uop_0_robIdx_value <= _GEN_8032;
      end
    end else begin
      uop_0_robIdx_value <= _GEN_8032;
    end
    if (io_enq_req_3_valid & ~enqCancel_3) begin // @[StoreQueue.scala 211:43]
      if (4'h1 == io_enq_req_3_bits_sqIdx_value) begin // @[StoreQueue.scala 212:18]
        uop_1_cf_trigger_backendEn_0 <= io_enq_req_3_bits_cf_trigger_backendEn_0; // @[StoreQueue.scala 212:18]
      end else begin
        uop_1_cf_trigger_backendEn_0 <= _GEN_7205;
      end
    end else begin
      uop_1_cf_trigger_backendEn_0 <= _GEN_7205;
    end
    if (io_storeAddrIn_1_valid) begin // @[StoreQueue.scala 288:37]
      if (4'h1 == io_storeAddrIn_1_bits_uop_sqIdx_value) begin // @[StoreQueue.scala 307:27]
        uop_1_ctrl_fuOpType <= io_storeAddrIn_1_bits_uop_ctrl_fuOpType; // @[StoreQueue.scala 307:27]
      end else begin
        uop_1_ctrl_fuOpType <= _GEN_11974;
      end
    end else begin
      uop_1_ctrl_fuOpType <= _GEN_11974;
    end
    if (io_enq_req_3_valid & ~enqCancel_3) begin // @[StoreQueue.scala 211:43]
      if (4'h1 == io_enq_req_3_bits_sqIdx_value) begin // @[StoreQueue.scala 212:18]
        uop_1_robIdx_flag <= io_enq_req_3_bits_robIdx_flag; // @[StoreQueue.scala 212:18]
      end else begin
        uop_1_robIdx_flag <= _GEN_8021;
      end
    end else begin
      uop_1_robIdx_flag <= _GEN_8021;
    end
    if (io_enq_req_3_valid & ~enqCancel_3) begin // @[StoreQueue.scala 211:43]
      if (4'h1 == io_enq_req_3_bits_sqIdx_value) begin // @[StoreQueue.scala 212:18]
        uop_1_robIdx_value <= io_enq_req_3_bits_robIdx_value; // @[StoreQueue.scala 212:18]
      end else begin
        uop_1_robIdx_value <= _GEN_8033;
      end
    end else begin
      uop_1_robIdx_value <= _GEN_8033;
    end
    if (io_enq_req_3_valid & ~enqCancel_3) begin // @[StoreQueue.scala 211:43]
      if (4'h2 == io_enq_req_3_bits_sqIdx_value) begin // @[StoreQueue.scala 212:18]
        uop_2_cf_trigger_backendEn_0 <= io_enq_req_3_bits_cf_trigger_backendEn_0; // @[StoreQueue.scala 212:18]
      end else begin
        uop_2_cf_trigger_backendEn_0 <= _GEN_7206;
      end
    end else begin
      uop_2_cf_trigger_backendEn_0 <= _GEN_7206;
    end
    if (io_storeAddrIn_1_valid) begin // @[StoreQueue.scala 288:37]
      if (4'h2 == io_storeAddrIn_1_bits_uop_sqIdx_value) begin // @[StoreQueue.scala 307:27]
        uop_2_ctrl_fuOpType <= io_storeAddrIn_1_bits_uop_ctrl_fuOpType; // @[StoreQueue.scala 307:27]
      end else begin
        uop_2_ctrl_fuOpType <= _GEN_11975;
      end
    end else begin
      uop_2_ctrl_fuOpType <= _GEN_11975;
    end
    if (io_enq_req_3_valid & ~enqCancel_3) begin // @[StoreQueue.scala 211:43]
      if (4'h2 == io_enq_req_3_bits_sqIdx_value) begin // @[StoreQueue.scala 212:18]
        uop_2_robIdx_flag <= io_enq_req_3_bits_robIdx_flag; // @[StoreQueue.scala 212:18]
      end else begin
        uop_2_robIdx_flag <= _GEN_8022;
      end
    end else begin
      uop_2_robIdx_flag <= _GEN_8022;
    end
    if (io_enq_req_3_valid & ~enqCancel_3) begin // @[StoreQueue.scala 211:43]
      if (4'h2 == io_enq_req_3_bits_sqIdx_value) begin // @[StoreQueue.scala 212:18]
        uop_2_robIdx_value <= io_enq_req_3_bits_robIdx_value; // @[StoreQueue.scala 212:18]
      end else begin
        uop_2_robIdx_value <= _GEN_8034;
      end
    end else begin
      uop_2_robIdx_value <= _GEN_8034;
    end
    if (io_enq_req_3_valid & ~enqCancel_3) begin // @[StoreQueue.scala 211:43]
      if (4'h3 == io_enq_req_3_bits_sqIdx_value) begin // @[StoreQueue.scala 212:18]
        uop_3_cf_trigger_backendEn_0 <= io_enq_req_3_bits_cf_trigger_backendEn_0; // @[StoreQueue.scala 212:18]
      end else begin
        uop_3_cf_trigger_backendEn_0 <= _GEN_7207;
      end
    end else begin
      uop_3_cf_trigger_backendEn_0 <= _GEN_7207;
    end
    if (io_storeAddrIn_1_valid) begin // @[StoreQueue.scala 288:37]
      if (4'h3 == io_storeAddrIn_1_bits_uop_sqIdx_value) begin // @[StoreQueue.scala 307:27]
        uop_3_ctrl_fuOpType <= io_storeAddrIn_1_bits_uop_ctrl_fuOpType; // @[StoreQueue.scala 307:27]
      end else begin
        uop_3_ctrl_fuOpType <= _GEN_11976;
      end
    end else begin
      uop_3_ctrl_fuOpType <= _GEN_11976;
    end
    if (io_enq_req_3_valid & ~enqCancel_3) begin // @[StoreQueue.scala 211:43]
      if (4'h3 == io_enq_req_3_bits_sqIdx_value) begin // @[StoreQueue.scala 212:18]
        uop_3_robIdx_flag <= io_enq_req_3_bits_robIdx_flag; // @[StoreQueue.scala 212:18]
      end else begin
        uop_3_robIdx_flag <= _GEN_8023;
      end
    end else begin
      uop_3_robIdx_flag <= _GEN_8023;
    end
    if (io_enq_req_3_valid & ~enqCancel_3) begin // @[StoreQueue.scala 211:43]
      if (4'h3 == io_enq_req_3_bits_sqIdx_value) begin // @[StoreQueue.scala 212:18]
        uop_3_robIdx_value <= io_enq_req_3_bits_robIdx_value; // @[StoreQueue.scala 212:18]
      end else begin
        uop_3_robIdx_value <= _GEN_8035;
      end
    end else begin
      uop_3_robIdx_value <= _GEN_8035;
    end
    if (io_enq_req_3_valid & ~enqCancel_3) begin // @[StoreQueue.scala 211:43]
      if (4'h4 == io_enq_req_3_bits_sqIdx_value) begin // @[StoreQueue.scala 212:18]
        uop_4_cf_trigger_backendEn_0 <= io_enq_req_3_bits_cf_trigger_backendEn_0; // @[StoreQueue.scala 212:18]
      end else begin
        uop_4_cf_trigger_backendEn_0 <= _GEN_7208;
      end
    end else begin
      uop_4_cf_trigger_backendEn_0 <= _GEN_7208;
    end
    if (io_storeAddrIn_1_valid) begin // @[StoreQueue.scala 288:37]
      if (4'h4 == io_storeAddrIn_1_bits_uop_sqIdx_value) begin // @[StoreQueue.scala 307:27]
        uop_4_ctrl_fuOpType <= io_storeAddrIn_1_bits_uop_ctrl_fuOpType; // @[StoreQueue.scala 307:27]
      end else begin
        uop_4_ctrl_fuOpType <= _GEN_11977;
      end
    end else begin
      uop_4_ctrl_fuOpType <= _GEN_11977;
    end
    if (io_enq_req_3_valid & ~enqCancel_3) begin // @[StoreQueue.scala 211:43]
      if (4'h4 == io_enq_req_3_bits_sqIdx_value) begin // @[StoreQueue.scala 212:18]
        uop_4_robIdx_flag <= io_enq_req_3_bits_robIdx_flag; // @[StoreQueue.scala 212:18]
      end else begin
        uop_4_robIdx_flag <= _GEN_8024;
      end
    end else begin
      uop_4_robIdx_flag <= _GEN_8024;
    end
    if (io_enq_req_3_valid & ~enqCancel_3) begin // @[StoreQueue.scala 211:43]
      if (4'h4 == io_enq_req_3_bits_sqIdx_value) begin // @[StoreQueue.scala 212:18]
        uop_4_robIdx_value <= io_enq_req_3_bits_robIdx_value; // @[StoreQueue.scala 212:18]
      end else begin
        uop_4_robIdx_value <= _GEN_8036;
      end
    end else begin
      uop_4_robIdx_value <= _GEN_8036;
    end
    if (io_enq_req_3_valid & ~enqCancel_3) begin // @[StoreQueue.scala 211:43]
      if (4'h5 == io_enq_req_3_bits_sqIdx_value) begin // @[StoreQueue.scala 212:18]
        uop_5_cf_trigger_backendEn_0 <= io_enq_req_3_bits_cf_trigger_backendEn_0; // @[StoreQueue.scala 212:18]
      end else begin
        uop_5_cf_trigger_backendEn_0 <= _GEN_7209;
      end
    end else begin
      uop_5_cf_trigger_backendEn_0 <= _GEN_7209;
    end
    if (io_storeAddrIn_1_valid) begin // @[StoreQueue.scala 288:37]
      if (4'h5 == io_storeAddrIn_1_bits_uop_sqIdx_value) begin // @[StoreQueue.scala 307:27]
        uop_5_ctrl_fuOpType <= io_storeAddrIn_1_bits_uop_ctrl_fuOpType; // @[StoreQueue.scala 307:27]
      end else begin
        uop_5_ctrl_fuOpType <= _GEN_11978;
      end
    end else begin
      uop_5_ctrl_fuOpType <= _GEN_11978;
    end
    if (io_enq_req_3_valid & ~enqCancel_3) begin // @[StoreQueue.scala 211:43]
      if (4'h5 == io_enq_req_3_bits_sqIdx_value) begin // @[StoreQueue.scala 212:18]
        uop_5_robIdx_flag <= io_enq_req_3_bits_robIdx_flag; // @[StoreQueue.scala 212:18]
      end else begin
        uop_5_robIdx_flag <= _GEN_8025;
      end
    end else begin
      uop_5_robIdx_flag <= _GEN_8025;
    end
    if (io_enq_req_3_valid & ~enqCancel_3) begin // @[StoreQueue.scala 211:43]
      if (4'h5 == io_enq_req_3_bits_sqIdx_value) begin // @[StoreQueue.scala 212:18]
        uop_5_robIdx_value <= io_enq_req_3_bits_robIdx_value; // @[StoreQueue.scala 212:18]
      end else begin
        uop_5_robIdx_value <= _GEN_8037;
      end
    end else begin
      uop_5_robIdx_value <= _GEN_8037;
    end
    if (io_enq_req_3_valid & ~enqCancel_3) begin // @[StoreQueue.scala 211:43]
      if (4'h6 == io_enq_req_3_bits_sqIdx_value) begin // @[StoreQueue.scala 212:18]
        uop_6_cf_trigger_backendEn_0 <= io_enq_req_3_bits_cf_trigger_backendEn_0; // @[StoreQueue.scala 212:18]
      end else begin
        uop_6_cf_trigger_backendEn_0 <= _GEN_7210;
      end
    end else begin
      uop_6_cf_trigger_backendEn_0 <= _GEN_7210;
    end
    if (io_storeAddrIn_1_valid) begin // @[StoreQueue.scala 288:37]
      if (4'h6 == io_storeAddrIn_1_bits_uop_sqIdx_value) begin // @[StoreQueue.scala 307:27]
        uop_6_ctrl_fuOpType <= io_storeAddrIn_1_bits_uop_ctrl_fuOpType; // @[StoreQueue.scala 307:27]
      end else begin
        uop_6_ctrl_fuOpType <= _GEN_11979;
      end
    end else begin
      uop_6_ctrl_fuOpType <= _GEN_11979;
    end
    if (io_enq_req_3_valid & ~enqCancel_3) begin // @[StoreQueue.scala 211:43]
      if (4'h6 == io_enq_req_3_bits_sqIdx_value) begin // @[StoreQueue.scala 212:18]
        uop_6_robIdx_flag <= io_enq_req_3_bits_robIdx_flag; // @[StoreQueue.scala 212:18]
      end else begin
        uop_6_robIdx_flag <= _GEN_8026;
      end
    end else begin
      uop_6_robIdx_flag <= _GEN_8026;
    end
    if (io_enq_req_3_valid & ~enqCancel_3) begin // @[StoreQueue.scala 211:43]
      if (4'h6 == io_enq_req_3_bits_sqIdx_value) begin // @[StoreQueue.scala 212:18]
        uop_6_robIdx_value <= io_enq_req_3_bits_robIdx_value; // @[StoreQueue.scala 212:18]
      end else begin
        uop_6_robIdx_value <= _GEN_8038;
      end
    end else begin
      uop_6_robIdx_value <= _GEN_8038;
    end
    if (io_enq_req_3_valid & ~enqCancel_3) begin // @[StoreQueue.scala 211:43]
      if (4'h7 == io_enq_req_3_bits_sqIdx_value) begin // @[StoreQueue.scala 212:18]
        uop_7_cf_trigger_backendEn_0 <= io_enq_req_3_bits_cf_trigger_backendEn_0; // @[StoreQueue.scala 212:18]
      end else begin
        uop_7_cf_trigger_backendEn_0 <= _GEN_7211;
      end
    end else begin
      uop_7_cf_trigger_backendEn_0 <= _GEN_7211;
    end
    if (io_storeAddrIn_1_valid) begin // @[StoreQueue.scala 288:37]
      if (4'h7 == io_storeAddrIn_1_bits_uop_sqIdx_value) begin // @[StoreQueue.scala 307:27]
        uop_7_ctrl_fuOpType <= io_storeAddrIn_1_bits_uop_ctrl_fuOpType; // @[StoreQueue.scala 307:27]
      end else begin
        uop_7_ctrl_fuOpType <= _GEN_11980;
      end
    end else begin
      uop_7_ctrl_fuOpType <= _GEN_11980;
    end
    if (io_enq_req_3_valid & ~enqCancel_3) begin // @[StoreQueue.scala 211:43]
      if (4'h7 == io_enq_req_3_bits_sqIdx_value) begin // @[StoreQueue.scala 212:18]
        uop_7_robIdx_flag <= io_enq_req_3_bits_robIdx_flag; // @[StoreQueue.scala 212:18]
      end else begin
        uop_7_robIdx_flag <= _GEN_8027;
      end
    end else begin
      uop_7_robIdx_flag <= _GEN_8027;
    end
    if (io_enq_req_3_valid & ~enqCancel_3) begin // @[StoreQueue.scala 211:43]
      if (4'h7 == io_enq_req_3_bits_sqIdx_value) begin // @[StoreQueue.scala 212:18]
        uop_7_robIdx_value <= io_enq_req_3_bits_robIdx_value; // @[StoreQueue.scala 212:18]
      end else begin
        uop_7_robIdx_value <= _GEN_8039;
      end
    end else begin
      uop_7_robIdx_value <= _GEN_8039;
    end
    if (io_enq_req_3_valid & ~enqCancel_3) begin // @[StoreQueue.scala 211:43]
      if (4'h8 == io_enq_req_3_bits_sqIdx_value) begin // @[StoreQueue.scala 212:18]
        uop_8_cf_trigger_backendEn_0 <= io_enq_req_3_bits_cf_trigger_backendEn_0; // @[StoreQueue.scala 212:18]
      end else begin
        uop_8_cf_trigger_backendEn_0 <= _GEN_7212;
      end
    end else begin
      uop_8_cf_trigger_backendEn_0 <= _GEN_7212;
    end
    if (io_storeAddrIn_1_valid) begin // @[StoreQueue.scala 288:37]
      if (4'h8 == io_storeAddrIn_1_bits_uop_sqIdx_value) begin // @[StoreQueue.scala 307:27]
        uop_8_ctrl_fuOpType <= io_storeAddrIn_1_bits_uop_ctrl_fuOpType; // @[StoreQueue.scala 307:27]
      end else begin
        uop_8_ctrl_fuOpType <= _GEN_11981;
      end
    end else begin
      uop_8_ctrl_fuOpType <= _GEN_11981;
    end
    if (io_enq_req_3_valid & ~enqCancel_3) begin // @[StoreQueue.scala 211:43]
      if (4'h8 == io_enq_req_3_bits_sqIdx_value) begin // @[StoreQueue.scala 212:18]
        uop_8_robIdx_flag <= io_enq_req_3_bits_robIdx_flag; // @[StoreQueue.scala 212:18]
      end else begin
        uop_8_robIdx_flag <= _GEN_8028;
      end
    end else begin
      uop_8_robIdx_flag <= _GEN_8028;
    end
    if (io_enq_req_3_valid & ~enqCancel_3) begin // @[StoreQueue.scala 211:43]
      if (4'h8 == io_enq_req_3_bits_sqIdx_value) begin // @[StoreQueue.scala 212:18]
        uop_8_robIdx_value <= io_enq_req_3_bits_robIdx_value; // @[StoreQueue.scala 212:18]
      end else begin
        uop_8_robIdx_value <= _GEN_8040;
      end
    end else begin
      uop_8_robIdx_value <= _GEN_8040;
    end
    if (io_enq_req_3_valid & ~enqCancel_3) begin // @[StoreQueue.scala 211:43]
      if (4'h9 == io_enq_req_3_bits_sqIdx_value) begin // @[StoreQueue.scala 212:18]
        uop_9_cf_trigger_backendEn_0 <= io_enq_req_3_bits_cf_trigger_backendEn_0; // @[StoreQueue.scala 212:18]
      end else begin
        uop_9_cf_trigger_backendEn_0 <= _GEN_7213;
      end
    end else begin
      uop_9_cf_trigger_backendEn_0 <= _GEN_7213;
    end
    if (io_storeAddrIn_1_valid) begin // @[StoreQueue.scala 288:37]
      if (4'h9 == io_storeAddrIn_1_bits_uop_sqIdx_value) begin // @[StoreQueue.scala 307:27]
        uop_9_ctrl_fuOpType <= io_storeAddrIn_1_bits_uop_ctrl_fuOpType; // @[StoreQueue.scala 307:27]
      end else begin
        uop_9_ctrl_fuOpType <= _GEN_11982;
      end
    end else begin
      uop_9_ctrl_fuOpType <= _GEN_11982;
    end
    if (io_enq_req_3_valid & ~enqCancel_3) begin // @[StoreQueue.scala 211:43]
      if (4'h9 == io_enq_req_3_bits_sqIdx_value) begin // @[StoreQueue.scala 212:18]
        uop_9_robIdx_flag <= io_enq_req_3_bits_robIdx_flag; // @[StoreQueue.scala 212:18]
      end else begin
        uop_9_robIdx_flag <= _GEN_8029;
      end
    end else begin
      uop_9_robIdx_flag <= _GEN_8029;
    end
    if (io_enq_req_3_valid & ~enqCancel_3) begin // @[StoreQueue.scala 211:43]
      if (4'h9 == io_enq_req_3_bits_sqIdx_value) begin // @[StoreQueue.scala 212:18]
        uop_9_robIdx_value <= io_enq_req_3_bits_robIdx_value; // @[StoreQueue.scala 212:18]
      end else begin
        uop_9_robIdx_value <= _GEN_8041;
      end
    end else begin
      uop_9_robIdx_value <= _GEN_8041;
    end
    if (io_enq_req_3_valid & ~enqCancel_3) begin // @[StoreQueue.scala 211:43]
      if (4'ha == io_enq_req_3_bits_sqIdx_value) begin // @[StoreQueue.scala 212:18]
        uop_10_cf_trigger_backendEn_0 <= io_enq_req_3_bits_cf_trigger_backendEn_0; // @[StoreQueue.scala 212:18]
      end else begin
        uop_10_cf_trigger_backendEn_0 <= _GEN_7214;
      end
    end else begin
      uop_10_cf_trigger_backendEn_0 <= _GEN_7214;
    end
    if (io_storeAddrIn_1_valid) begin // @[StoreQueue.scala 288:37]
      if (4'ha == io_storeAddrIn_1_bits_uop_sqIdx_value) begin // @[StoreQueue.scala 307:27]
        uop_10_ctrl_fuOpType <= io_storeAddrIn_1_bits_uop_ctrl_fuOpType; // @[StoreQueue.scala 307:27]
      end else begin
        uop_10_ctrl_fuOpType <= _GEN_11983;
      end
    end else begin
      uop_10_ctrl_fuOpType <= _GEN_11983;
    end
    if (io_enq_req_3_valid & ~enqCancel_3) begin // @[StoreQueue.scala 211:43]
      if (4'ha == io_enq_req_3_bits_sqIdx_value) begin // @[StoreQueue.scala 212:18]
        uop_10_robIdx_flag <= io_enq_req_3_bits_robIdx_flag; // @[StoreQueue.scala 212:18]
      end else begin
        uop_10_robIdx_flag <= _GEN_8030;
      end
    end else begin
      uop_10_robIdx_flag <= _GEN_8030;
    end
    if (io_enq_req_3_valid & ~enqCancel_3) begin // @[StoreQueue.scala 211:43]
      if (4'ha == io_enq_req_3_bits_sqIdx_value) begin // @[StoreQueue.scala 212:18]
        uop_10_robIdx_value <= io_enq_req_3_bits_robIdx_value; // @[StoreQueue.scala 212:18]
      end else begin
        uop_10_robIdx_value <= _GEN_8042;
      end
    end else begin
      uop_10_robIdx_value <= _GEN_8042;
    end
    if (io_enq_req_3_valid & ~enqCancel_3) begin // @[StoreQueue.scala 211:43]
      if (4'hb == io_enq_req_3_bits_sqIdx_value) begin // @[StoreQueue.scala 212:18]
        uop_11_cf_trigger_backendEn_0 <= io_enq_req_3_bits_cf_trigger_backendEn_0; // @[StoreQueue.scala 212:18]
      end else begin
        uop_11_cf_trigger_backendEn_0 <= _GEN_7215;
      end
    end else begin
      uop_11_cf_trigger_backendEn_0 <= _GEN_7215;
    end
    if (io_storeAddrIn_1_valid) begin // @[StoreQueue.scala 288:37]
      if (4'hb == io_storeAddrIn_1_bits_uop_sqIdx_value) begin // @[StoreQueue.scala 307:27]
        uop_11_ctrl_fuOpType <= io_storeAddrIn_1_bits_uop_ctrl_fuOpType; // @[StoreQueue.scala 307:27]
      end else begin
        uop_11_ctrl_fuOpType <= _GEN_11984;
      end
    end else begin
      uop_11_ctrl_fuOpType <= _GEN_11984;
    end
    if (io_enq_req_3_valid & ~enqCancel_3) begin // @[StoreQueue.scala 211:43]
      if (4'hb == io_enq_req_3_bits_sqIdx_value) begin // @[StoreQueue.scala 212:18]
        uop_11_robIdx_flag <= io_enq_req_3_bits_robIdx_flag; // @[StoreQueue.scala 212:18]
      end else begin
        uop_11_robIdx_flag <= _GEN_8031;
      end
    end else begin
      uop_11_robIdx_flag <= _GEN_8031;
    end
    if (io_enq_req_3_valid & ~enqCancel_3) begin // @[StoreQueue.scala 211:43]
      if (4'hb == io_enq_req_3_bits_sqIdx_value) begin // @[StoreQueue.scala 212:18]
        uop_11_robIdx_value <= io_enq_req_3_bits_robIdx_value; // @[StoreQueue.scala 212:18]
      end else begin
        uop_11_robIdx_value <= _GEN_8043;
      end
    end else begin
      uop_11_robIdx_value <= _GEN_8043;
    end
    if (commitCount > 2'h1) begin // @[StoreQueue.scala 604:30]
      committed_0 <= _GEN_15336;
    end else if (_T_74) begin // @[StoreQueue.scala 604:30]
      if (uncacheState == 3'h0) begin // @[StoreQueue.scala 608:38]
        committed_0 <= _GEN_15300;
      end else begin
        committed_0 <= _GEN_11028;
      end
    end else begin
      committed_0 <= _GEN_11028;
    end
    if (commitCount > 2'h1) begin // @[StoreQueue.scala 604:30]
      committed_1 <= _GEN_15337;
    end else if (_T_74) begin // @[StoreQueue.scala 604:30]
      if (uncacheState == 3'h0) begin // @[StoreQueue.scala 608:38]
        committed_1 <= _GEN_15301;
      end else begin
        committed_1 <= _GEN_11029;
      end
    end else begin
      committed_1 <= _GEN_11029;
    end
    if (commitCount > 2'h1) begin // @[StoreQueue.scala 604:30]
      committed_2 <= _GEN_15338;
    end else if (_T_74) begin // @[StoreQueue.scala 604:30]
      if (uncacheState == 3'h0) begin // @[StoreQueue.scala 608:38]
        committed_2 <= _GEN_15302;
      end else begin
        committed_2 <= _GEN_11030;
      end
    end else begin
      committed_2 <= _GEN_11030;
    end
    if (commitCount > 2'h1) begin // @[StoreQueue.scala 604:30]
      committed_3 <= _GEN_15339;
    end else if (_T_74) begin // @[StoreQueue.scala 604:30]
      if (uncacheState == 3'h0) begin // @[StoreQueue.scala 608:38]
        committed_3 <= _GEN_15303;
      end else begin
        committed_3 <= _GEN_11031;
      end
    end else begin
      committed_3 <= _GEN_11031;
    end
    if (commitCount > 2'h1) begin // @[StoreQueue.scala 604:30]
      committed_4 <= _GEN_15340;
    end else if (_T_74) begin // @[StoreQueue.scala 604:30]
      if (uncacheState == 3'h0) begin // @[StoreQueue.scala 608:38]
        committed_4 <= _GEN_15304;
      end else begin
        committed_4 <= _GEN_11032;
      end
    end else begin
      committed_4 <= _GEN_11032;
    end
    if (commitCount > 2'h1) begin // @[StoreQueue.scala 604:30]
      committed_5 <= _GEN_15341;
    end else if (_T_74) begin // @[StoreQueue.scala 604:30]
      if (uncacheState == 3'h0) begin // @[StoreQueue.scala 608:38]
        committed_5 <= _GEN_15305;
      end else begin
        committed_5 <= _GEN_11033;
      end
    end else begin
      committed_5 <= _GEN_11033;
    end
    if (commitCount > 2'h1) begin // @[StoreQueue.scala 604:30]
      committed_6 <= _GEN_15342;
    end else if (_T_74) begin // @[StoreQueue.scala 604:30]
      if (uncacheState == 3'h0) begin // @[StoreQueue.scala 608:38]
        committed_6 <= _GEN_15306;
      end else begin
        committed_6 <= _GEN_11034;
      end
    end else begin
      committed_6 <= _GEN_11034;
    end
    if (commitCount > 2'h1) begin // @[StoreQueue.scala 604:30]
      committed_7 <= _GEN_15343;
    end else if (_T_74) begin // @[StoreQueue.scala 604:30]
      if (uncacheState == 3'h0) begin // @[StoreQueue.scala 608:38]
        committed_7 <= _GEN_15307;
      end else begin
        committed_7 <= _GEN_11035;
      end
    end else begin
      committed_7 <= _GEN_11035;
    end
    if (commitCount > 2'h1) begin // @[StoreQueue.scala 604:30]
      committed_8 <= _GEN_15344;
    end else if (_T_74) begin // @[StoreQueue.scala 604:30]
      if (uncacheState == 3'h0) begin // @[StoreQueue.scala 608:38]
        committed_8 <= _GEN_15308;
      end else begin
        committed_8 <= _GEN_11036;
      end
    end else begin
      committed_8 <= _GEN_11036;
    end
    if (commitCount > 2'h1) begin // @[StoreQueue.scala 604:30]
      committed_9 <= _GEN_15345;
    end else if (_T_74) begin // @[StoreQueue.scala 604:30]
      if (uncacheState == 3'h0) begin // @[StoreQueue.scala 608:38]
        committed_9 <= _GEN_15309;
      end else begin
        committed_9 <= _GEN_11037;
      end
    end else begin
      committed_9 <= _GEN_11037;
    end
    if (commitCount > 2'h1) begin // @[StoreQueue.scala 604:30]
      committed_10 <= _GEN_15346;
    end else if (_T_74) begin // @[StoreQueue.scala 604:30]
      if (uncacheState == 3'h0) begin // @[StoreQueue.scala 608:38]
        committed_10 <= _GEN_15310;
      end else begin
        committed_10 <= _GEN_11038;
      end
    end else begin
      committed_10 <= _GEN_11038;
    end
    if (commitCount > 2'h1) begin // @[StoreQueue.scala 604:30]
      committed_11 <= _GEN_15347;
    end else if (_T_74) begin // @[StoreQueue.scala 604:30]
      if (uncacheState == 3'h0) begin // @[StoreQueue.scala 608:38]
        committed_11 <= _GEN_15311;
      end else begin
        committed_11 <= _GEN_11039;
      end
    end else begin
      committed_11 <= _GEN_11039;
    end
    if (_T_68) begin // @[StoreQueue.scala 561:30]
      if (4'h0 == deqPtrExt_0_value) begin // @[StoreQueue.scala 563:21]
        pending_0 <= 1'h0; // @[StoreQueue.scala 563:21]
      end else begin
        pending_0 <= _GEN_13706;
      end
    end else begin
      pending_0 <= _GEN_13706;
    end
    if (_T_68) begin // @[StoreQueue.scala 561:30]
      if (4'h1 == deqPtrExt_0_value) begin // @[StoreQueue.scala 563:21]
        pending_1 <= 1'h0; // @[StoreQueue.scala 563:21]
      end else begin
        pending_1 <= _GEN_13707;
      end
    end else begin
      pending_1 <= _GEN_13707;
    end
    if (_T_68) begin // @[StoreQueue.scala 561:30]
      if (4'h2 == deqPtrExt_0_value) begin // @[StoreQueue.scala 563:21]
        pending_2 <= 1'h0; // @[StoreQueue.scala 563:21]
      end else begin
        pending_2 <= _GEN_13708;
      end
    end else begin
      pending_2 <= _GEN_13708;
    end
    if (_T_68) begin // @[StoreQueue.scala 561:30]
      if (4'h3 == deqPtrExt_0_value) begin // @[StoreQueue.scala 563:21]
        pending_3 <= 1'h0; // @[StoreQueue.scala 563:21]
      end else begin
        pending_3 <= _GEN_13709;
      end
    end else begin
      pending_3 <= _GEN_13709;
    end
    if (_T_68) begin // @[StoreQueue.scala 561:30]
      if (4'h4 == deqPtrExt_0_value) begin // @[StoreQueue.scala 563:21]
        pending_4 <= 1'h0; // @[StoreQueue.scala 563:21]
      end else begin
        pending_4 <= _GEN_13710;
      end
    end else begin
      pending_4 <= _GEN_13710;
    end
    if (_T_68) begin // @[StoreQueue.scala 561:30]
      if (4'h5 == deqPtrExt_0_value) begin // @[StoreQueue.scala 563:21]
        pending_5 <= 1'h0; // @[StoreQueue.scala 563:21]
      end else begin
        pending_5 <= _GEN_13711;
      end
    end else begin
      pending_5 <= _GEN_13711;
    end
    if (_T_68) begin // @[StoreQueue.scala 561:30]
      if (4'h6 == deqPtrExt_0_value) begin // @[StoreQueue.scala 563:21]
        pending_6 <= 1'h0; // @[StoreQueue.scala 563:21]
      end else begin
        pending_6 <= _GEN_13712;
      end
    end else begin
      pending_6 <= _GEN_13712;
    end
    if (_T_68) begin // @[StoreQueue.scala 561:30]
      if (4'h7 == deqPtrExt_0_value) begin // @[StoreQueue.scala 563:21]
        pending_7 <= 1'h0; // @[StoreQueue.scala 563:21]
      end else begin
        pending_7 <= _GEN_13713;
      end
    end else begin
      pending_7 <= _GEN_13713;
    end
    if (_T_68) begin // @[StoreQueue.scala 561:30]
      if (4'h8 == deqPtrExt_0_value) begin // @[StoreQueue.scala 563:21]
        pending_8 <= 1'h0; // @[StoreQueue.scala 563:21]
      end else begin
        pending_8 <= _GEN_13714;
      end
    end else begin
      pending_8 <= _GEN_13714;
    end
    if (_T_68) begin // @[StoreQueue.scala 561:30]
      if (4'h9 == deqPtrExt_0_value) begin // @[StoreQueue.scala 563:21]
        pending_9 <= 1'h0; // @[StoreQueue.scala 563:21]
      end else begin
        pending_9 <= _GEN_13715;
      end
    end else begin
      pending_9 <= _GEN_13715;
    end
    if (_T_68) begin // @[StoreQueue.scala 561:30]
      if (4'ha == deqPtrExt_0_value) begin // @[StoreQueue.scala 563:21]
        pending_10 <= 1'h0; // @[StoreQueue.scala 563:21]
      end else begin
        pending_10 <= _GEN_13716;
      end
    end else begin
      pending_10 <= _GEN_13716;
    end
    if (_T_68) begin // @[StoreQueue.scala 561:30]
      if (4'hb == deqPtrExt_0_value) begin // @[StoreQueue.scala 563:21]
        pending_11 <= 1'h0; // @[StoreQueue.scala 563:21]
      end else begin
        pending_11 <= _GEN_13717;
      end
    end else begin
      pending_11 <= _GEN_13717;
    end
    if (storeAddrInFireReg_1) begin // @[StoreQueue.scala 322:31]
      if (4'h0 == stWbIndexReg_1) begin // @[StoreQueue.scala 324:26]
        mmio_0 <= io_storeAddrInRe_1_mmio; // @[StoreQueue.scala 324:26]
      end else begin
        mmio_0 <= _GEN_12465;
      end
    end else begin
      mmio_0 <= _GEN_12465;
    end
    if (storeAddrInFireReg_1) begin // @[StoreQueue.scala 322:31]
      if (4'h1 == stWbIndexReg_1) begin // @[StoreQueue.scala 324:26]
        mmio_1 <= io_storeAddrInRe_1_mmio; // @[StoreQueue.scala 324:26]
      end else begin
        mmio_1 <= _GEN_12466;
      end
    end else begin
      mmio_1 <= _GEN_12466;
    end
    if (storeAddrInFireReg_1) begin // @[StoreQueue.scala 322:31]
      if (4'h2 == stWbIndexReg_1) begin // @[StoreQueue.scala 324:26]
        mmio_2 <= io_storeAddrInRe_1_mmio; // @[StoreQueue.scala 324:26]
      end else begin
        mmio_2 <= _GEN_12467;
      end
    end else begin
      mmio_2 <= _GEN_12467;
    end
    if (storeAddrInFireReg_1) begin // @[StoreQueue.scala 322:31]
      if (4'h3 == stWbIndexReg_1) begin // @[StoreQueue.scala 324:26]
        mmio_3 <= io_storeAddrInRe_1_mmio; // @[StoreQueue.scala 324:26]
      end else begin
        mmio_3 <= _GEN_12468;
      end
    end else begin
      mmio_3 <= _GEN_12468;
    end
    if (storeAddrInFireReg_1) begin // @[StoreQueue.scala 322:31]
      if (4'h4 == stWbIndexReg_1) begin // @[StoreQueue.scala 324:26]
        mmio_4 <= io_storeAddrInRe_1_mmio; // @[StoreQueue.scala 324:26]
      end else begin
        mmio_4 <= _GEN_12469;
      end
    end else begin
      mmio_4 <= _GEN_12469;
    end
    if (storeAddrInFireReg_1) begin // @[StoreQueue.scala 322:31]
      if (4'h5 == stWbIndexReg_1) begin // @[StoreQueue.scala 324:26]
        mmio_5 <= io_storeAddrInRe_1_mmio; // @[StoreQueue.scala 324:26]
      end else begin
        mmio_5 <= _GEN_12470;
      end
    end else begin
      mmio_5 <= _GEN_12470;
    end
    if (storeAddrInFireReg_1) begin // @[StoreQueue.scala 322:31]
      if (4'h6 == stWbIndexReg_1) begin // @[StoreQueue.scala 324:26]
        mmio_6 <= io_storeAddrInRe_1_mmio; // @[StoreQueue.scala 324:26]
      end else begin
        mmio_6 <= _GEN_12471;
      end
    end else begin
      mmio_6 <= _GEN_12471;
    end
    if (storeAddrInFireReg_1) begin // @[StoreQueue.scala 322:31]
      if (4'h7 == stWbIndexReg_1) begin // @[StoreQueue.scala 324:26]
        mmio_7 <= io_storeAddrInRe_1_mmio; // @[StoreQueue.scala 324:26]
      end else begin
        mmio_7 <= _GEN_12472;
      end
    end else begin
      mmio_7 <= _GEN_12472;
    end
    if (storeAddrInFireReg_1) begin // @[StoreQueue.scala 322:31]
      if (4'h8 == stWbIndexReg_1) begin // @[StoreQueue.scala 324:26]
        mmio_8 <= io_storeAddrInRe_1_mmio; // @[StoreQueue.scala 324:26]
      end else begin
        mmio_8 <= _GEN_12473;
      end
    end else begin
      mmio_8 <= _GEN_12473;
    end
    if (storeAddrInFireReg_1) begin // @[StoreQueue.scala 322:31]
      if (4'h9 == stWbIndexReg_1) begin // @[StoreQueue.scala 324:26]
        mmio_9 <= io_storeAddrInRe_1_mmio; // @[StoreQueue.scala 324:26]
      end else begin
        mmio_9 <= _GEN_12474;
      end
    end else begin
      mmio_9 <= _GEN_12474;
    end
    if (storeAddrInFireReg_1) begin // @[StoreQueue.scala 322:31]
      if (4'ha == stWbIndexReg_1) begin // @[StoreQueue.scala 324:26]
        mmio_10 <= io_storeAddrInRe_1_mmio; // @[StoreQueue.scala 324:26]
      end else begin
        mmio_10 <= _GEN_12475;
      end
    end else begin
      mmio_10 <= _GEN_12475;
    end
    if (storeAddrInFireReg_1) begin // @[StoreQueue.scala 322:31]
      if (4'hb == stWbIndexReg_1) begin // @[StoreQueue.scala 324:26]
        mmio_11 <= io_storeAddrInRe_1_mmio; // @[StoreQueue.scala 324:26]
      end else begin
        mmio_11 <= _GEN_12476;
      end
    end else begin
      mmio_11 <= _GEN_12476;
    end
    if (storeAddrInFireReg_1) begin // @[StoreQueue.scala 322:31]
      if (4'h0 == stWbIndexReg_1) begin // @[StoreQueue.scala 325:28]
        atomic_0 <= io_storeAddrInRe_1_atomic; // @[StoreQueue.scala 325:28]
      end else begin
        atomic_0 <= _GEN_12477;
      end
    end else begin
      atomic_0 <= _GEN_12477;
    end
    if (storeAddrInFireReg_1) begin // @[StoreQueue.scala 322:31]
      if (4'h1 == stWbIndexReg_1) begin // @[StoreQueue.scala 325:28]
        atomic_1 <= io_storeAddrInRe_1_atomic; // @[StoreQueue.scala 325:28]
      end else begin
        atomic_1 <= _GEN_12478;
      end
    end else begin
      atomic_1 <= _GEN_12478;
    end
    if (storeAddrInFireReg_1) begin // @[StoreQueue.scala 322:31]
      if (4'h2 == stWbIndexReg_1) begin // @[StoreQueue.scala 325:28]
        atomic_2 <= io_storeAddrInRe_1_atomic; // @[StoreQueue.scala 325:28]
      end else begin
        atomic_2 <= _GEN_12479;
      end
    end else begin
      atomic_2 <= _GEN_12479;
    end
    if (storeAddrInFireReg_1) begin // @[StoreQueue.scala 322:31]
      if (4'h3 == stWbIndexReg_1) begin // @[StoreQueue.scala 325:28]
        atomic_3 <= io_storeAddrInRe_1_atomic; // @[StoreQueue.scala 325:28]
      end else begin
        atomic_3 <= _GEN_12480;
      end
    end else begin
      atomic_3 <= _GEN_12480;
    end
    if (storeAddrInFireReg_1) begin // @[StoreQueue.scala 322:31]
      if (4'h4 == stWbIndexReg_1) begin // @[StoreQueue.scala 325:28]
        atomic_4 <= io_storeAddrInRe_1_atomic; // @[StoreQueue.scala 325:28]
      end else begin
        atomic_4 <= _GEN_12481;
      end
    end else begin
      atomic_4 <= _GEN_12481;
    end
    if (storeAddrInFireReg_1) begin // @[StoreQueue.scala 322:31]
      if (4'h5 == stWbIndexReg_1) begin // @[StoreQueue.scala 325:28]
        atomic_5 <= io_storeAddrInRe_1_atomic; // @[StoreQueue.scala 325:28]
      end else begin
        atomic_5 <= _GEN_12482;
      end
    end else begin
      atomic_5 <= _GEN_12482;
    end
    if (storeAddrInFireReg_1) begin // @[StoreQueue.scala 322:31]
      if (4'h6 == stWbIndexReg_1) begin // @[StoreQueue.scala 325:28]
        atomic_6 <= io_storeAddrInRe_1_atomic; // @[StoreQueue.scala 325:28]
      end else begin
        atomic_6 <= _GEN_12483;
      end
    end else begin
      atomic_6 <= _GEN_12483;
    end
    if (storeAddrInFireReg_1) begin // @[StoreQueue.scala 322:31]
      if (4'h7 == stWbIndexReg_1) begin // @[StoreQueue.scala 325:28]
        atomic_7 <= io_storeAddrInRe_1_atomic; // @[StoreQueue.scala 325:28]
      end else begin
        atomic_7 <= _GEN_12484;
      end
    end else begin
      atomic_7 <= _GEN_12484;
    end
    if (storeAddrInFireReg_1) begin // @[StoreQueue.scala 322:31]
      if (4'h8 == stWbIndexReg_1) begin // @[StoreQueue.scala 325:28]
        atomic_8 <= io_storeAddrInRe_1_atomic; // @[StoreQueue.scala 325:28]
      end else begin
        atomic_8 <= _GEN_12485;
      end
    end else begin
      atomic_8 <= _GEN_12485;
    end
    if (storeAddrInFireReg_1) begin // @[StoreQueue.scala 322:31]
      if (4'h9 == stWbIndexReg_1) begin // @[StoreQueue.scala 325:28]
        atomic_9 <= io_storeAddrInRe_1_atomic; // @[StoreQueue.scala 325:28]
      end else begin
        atomic_9 <= _GEN_12486;
      end
    end else begin
      atomic_9 <= _GEN_12486;
    end
    if (storeAddrInFireReg_1) begin // @[StoreQueue.scala 322:31]
      if (4'ha == stWbIndexReg_1) begin // @[StoreQueue.scala 325:28]
        atomic_10 <= io_storeAddrInRe_1_atomic; // @[StoreQueue.scala 325:28]
      end else begin
        atomic_10 <= _GEN_12487;
      end
    end else begin
      atomic_10 <= _GEN_12487;
    end
    if (storeAddrInFireReg_1) begin // @[StoreQueue.scala 322:31]
      if (4'hb == stWbIndexReg_1) begin // @[StoreQueue.scala 325:28]
        atomic_11 <= io_storeAddrInRe_1_atomic; // @[StoreQueue.scala 325:28]
      end else begin
        atomic_11 <= _GEN_12488;
      end
    end else begin
      atomic_11 <= _GEN_12488;
    end
    commitCount <= io_rob_scommit; // @[StoreQueue.scala 153:28]
    deqPtrExtNext_REG <= io_sbuffer_1_ready & io_sbuffer_1_valid; // @[Decoupled.scala 50:35]
    deqPtrExtNext_REG_1 <= io_sbuffer_0_ready & io_sbuffer_0_valid; // @[Decoupled.scala 50:35]
    io_sqDeq_REG <= io_sbuffer_1_ready & io_sbuffer_1_valid; // @[Decoupled.scala 50:35]
    io_sqDeq_REG_1 <= io_sbuffer_0_ready & io_sbuffer_0_valid; // @[Decoupled.scala 50:35]
    if (io_sqDeq_REG) begin // @[StoreQueue.scala 185:26]
      io_sqDeq_REG_2 <= 2'h2;
    end else begin
      io_sqDeq_REG_2 <= {{1'd0}, _io_sqDeq_T_3};
    end
    storeAddrInFireReg <= io_storeAddrIn_0_valid & addr_valid; // @[StoreQueue.scala 320:63]
    stWbIndexReg <= io_storeAddrIn_0_bits_uop_sqIdx_value; // @[StoreQueue.scala 321:31]
    storeAddrInFireReg_1 <= io_storeAddrIn_1_valid & addr_valid_1; // @[StoreQueue.scala 320:63]
    stWbIndexReg_1 <= io_storeAddrIn_1_bits_uop_sqIdx_value; // @[StoreQueue.scala 321:31]
    REG_2 <= io_storeDataIn_0_valid; // @[StoreQueue.scala 360:14]
    REG_3 <= io_storeDataIn_0_bits_uop_sqIdx_value; // @[StoreQueue.scala 363:24]
    REG_4 <= io_storeDataIn_1_valid; // @[StoreQueue.scala 360:14]
    REG_5 <= io_storeDataIn_1_bits_uop_sqIdx_value; // @[StoreQueue.scala 363:24]
    robMatchVec__0 <= allocated_0 & _robMatchVec_T_2; // @[StoreQueue.scala 398:86]
    robMatchVec__1 <= allocated_1 & _robMatchVec_T_6; // @[StoreQueue.scala 398:86]
    robMatchVec__2 <= allocated_2 & _robMatchVec_T_10; // @[StoreQueue.scala 398:86]
    robMatchVec__3 <= allocated_3 & _robMatchVec_T_14; // @[StoreQueue.scala 398:86]
    robMatchVec__4 <= allocated_4 & _robMatchVec_T_18; // @[StoreQueue.scala 398:86]
    robMatchVec__5 <= allocated_5 & _robMatchVec_T_22; // @[StoreQueue.scala 398:86]
    robMatchVec__6 <= allocated_6 & _robMatchVec_T_26; // @[StoreQueue.scala 398:86]
    robMatchVec__7 <= allocated_7 & _robMatchVec_T_30; // @[StoreQueue.scala 398:86]
    robMatchVec__8 <= allocated_8 & _robMatchVec_T_34; // @[StoreQueue.scala 398:86]
    robMatchVec__9 <= allocated_9 & _robMatchVec_T_38; // @[StoreQueue.scala 398:86]
    robMatchVec__10 <= allocated_10 & _robMatchVec_T_42; // @[StoreQueue.scala 398:86]
    robMatchVec__11 <= allocated_11 & _robMatchVec_T_46; // @[StoreQueue.scala 398:86]
    vpmaskNotEqual_REG <= {vpmaskNotEqual_hi,vpmaskNotEqual_lo}; // @[StoreQueue.scala 420:47]
    vpmaskNotEqual_REG_1 <= {dataModule_io_needForward_0_0_hi,dataModule_io_needForward_0_0_lo}; // @[StoreQueue.scala 420:96]
    if (differentFlag) begin // @[StoreQueue.scala 402:26]
      vpmaskNotEqual_REG_2 <= _needForward_T_1;
    end else begin
      vpmaskNotEqual_REG_2 <= _canForward1_T_1;
    end
    vpmaskNotEqual_REG_3 <= {vpmaskNotEqual_hi_2,vpmaskNotEqual_lo_2}; // @[StoreQueue.scala 422:28]
    vaddrMatchFailed_REG <= io_forward_0_valid; // @[StoreQueue.scala 424:53]
    dataInvalidMaskReg <= _dataInvalidMask_T_7 & needForward; // @[StoreQueue.scala 444:134]
    io_forward_0_dataInvalid_REG <= io_forward_0_dataInvalidFast; // @[StoreQueue.scala 448:41]
    s2_differentFlag <= deqPtrExt_0_flag != io_forward_0_sqIdx_flag; // @[StoreQueue.scala 393:43]
    s2_enqPtrExt_flag <= enqPtrExt_0_flag; // @[StoreQueue.scala 456:31]
    s2_deqPtrExt_flag <= deqPtrExt_0_flag; // @[StoreQueue.scala 457:31]
    s2_deqPtrExt_value <= deqPtrExt_0_value; // @[StoreQueue.scala 457:31]
    io_forward_0_dataInvalidSqIdx_REG_flag <= io_forward_0_uop_sqIdx_flag; // @[StoreQueue.scala 469:48]
    io_forward_0_dataInvalidSqIdx_REG_value <= io_forward_0_uop_sqIdx_value; // @[StoreQueue.scala 469:48]
    io_forward_0_addrInvalidSqIdx_REG_flag <= io_forward_0_uop_sqIdx_flag; // @[StoreQueue.scala 479:48]
    io_forward_0_addrInvalidSqIdx_REG_value <= io_forward_0_uop_sqIdx_value; // @[StoreQueue.scala 479:48]
    io_forward_0_schedWait_REG <= {vpmaskNotEqual_hi,vpmaskNotEqual_lo}; // @[StoreQueue.scala 484:47]
    io_forward_0_schedWait_REG_1 <= {dataModule_io_needForward_0_0_hi,dataModule_io_needForward_0_0_lo}; // @[StoreQueue.scala 484:96]
    if (differentFlag) begin // @[StoreQueue.scala 402:26]
      io_forward_0_schedWait_REG_2 <= _needForward_T_1;
    end else begin
      io_forward_0_schedWait_REG_2 <= _canForward1_T_1;
    end
    io_forward_0_schedWait_REG_3 <= {vpmaskNotEqual_hi_2,vpmaskNotEqual_lo_2}; // @[StoreQueue.scala 486:28]
    robMatchVec_1_0 <= allocated_0 & _robMatchVec_T_50; // @[StoreQueue.scala 398:86]
    robMatchVec_1_1 <= allocated_1 & _robMatchVec_T_54; // @[StoreQueue.scala 398:86]
    robMatchVec_1_2 <= allocated_2 & _robMatchVec_T_58; // @[StoreQueue.scala 398:86]
    robMatchVec_1_3 <= allocated_3 & _robMatchVec_T_62; // @[StoreQueue.scala 398:86]
    robMatchVec_1_4 <= allocated_4 & _robMatchVec_T_66; // @[StoreQueue.scala 398:86]
    robMatchVec_1_5 <= allocated_5 & _robMatchVec_T_70; // @[StoreQueue.scala 398:86]
    robMatchVec_1_6 <= allocated_6 & _robMatchVec_T_74; // @[StoreQueue.scala 398:86]
    robMatchVec_1_7 <= allocated_7 & _robMatchVec_T_78; // @[StoreQueue.scala 398:86]
    robMatchVec_1_8 <= allocated_8 & _robMatchVec_T_82; // @[StoreQueue.scala 398:86]
    robMatchVec_1_9 <= allocated_9 & _robMatchVec_T_86; // @[StoreQueue.scala 398:86]
    robMatchVec_1_10 <= allocated_10 & _robMatchVec_T_90; // @[StoreQueue.scala 398:86]
    robMatchVec_1_11 <= allocated_11 & _robMatchVec_T_94; // @[StoreQueue.scala 398:86]
    vpmaskNotEqual_REG_4 <= {vpmaskNotEqual_hi_3,vpmaskNotEqual_lo_3}; // @[StoreQueue.scala 420:47]
    vpmaskNotEqual_REG_5 <= {dataModule_io_needForward_1_0_hi,dataModule_io_needForward_1_0_lo}; // @[StoreQueue.scala 420:96]
    if (differentFlag_1) begin // @[StoreQueue.scala 402:26]
      vpmaskNotEqual_REG_6 <= _needForward_T_4;
    end else begin
      vpmaskNotEqual_REG_6 <= _canForward1_T_5;
    end
    vpmaskNotEqual_REG_7 <= {vpmaskNotEqual_hi_2,vpmaskNotEqual_lo_2}; // @[StoreQueue.scala 422:28]
    vaddrMatchFailed_REG_1 <= io_forward_1_valid; // @[StoreQueue.scala 424:53]
    dataInvalidMaskReg_1 <= _dataInvalidMask_T_15 & needForward_1; // @[StoreQueue.scala 444:134]
    io_forward_1_dataInvalid_REG <= io_forward_1_dataInvalidFast; // @[StoreQueue.scala 448:41]
    s2_differentFlag_1 <= deqPtrExt_0_flag != io_forward_1_sqIdx_flag; // @[StoreQueue.scala 393:43]
    s2_enqPtrExt_1_flag <= enqPtrExt_0_flag; // @[StoreQueue.scala 456:31]
    s2_deqPtrExt_1_flag <= deqPtrExt_0_flag; // @[StoreQueue.scala 457:31]
    s2_deqPtrExt_1_value <= deqPtrExt_0_value; // @[StoreQueue.scala 457:31]
    io_forward_1_dataInvalidSqIdx_REG_flag <= io_forward_1_uop_sqIdx_flag; // @[StoreQueue.scala 469:48]
    io_forward_1_dataInvalidSqIdx_REG_value <= io_forward_1_uop_sqIdx_value; // @[StoreQueue.scala 469:48]
    io_forward_1_addrInvalidSqIdx_REG_flag <= io_forward_1_uop_sqIdx_flag; // @[StoreQueue.scala 479:48]
    io_forward_1_addrInvalidSqIdx_REG_value <= io_forward_1_uop_sqIdx_value; // @[StoreQueue.scala 479:48]
    io_forward_1_schedWait_REG <= {vpmaskNotEqual_hi_3,vpmaskNotEqual_lo_3}; // @[StoreQueue.scala 484:47]
    io_forward_1_schedWait_REG_1 <= {dataModule_io_needForward_1_0_hi,dataModule_io_needForward_1_0_lo}; // @[StoreQueue.scala 484:96]
    if (differentFlag_1) begin // @[StoreQueue.scala 402:26]
      io_forward_1_schedWait_REG_2 <= _needForward_T_4;
    end else begin
      io_forward_1_schedWait_REG_2 <= _canForward1_T_5;
    end
    io_forward_1_schedWait_REG_3 <= {vpmaskNotEqual_hi_2,vpmaskNotEqual_lo_2}; // @[StoreQueue.scala 486:28]
    REG_12 <= io_rob_pendingst & _GEN_13893 & _GEN_13905 & _GEN_13917 & _GEN_13929; // @[StoreQueue.scala 509:98]
    REG_13 <= _GEN_13952[3:2] == 2'h3; // @[package.scala 405:42]
    if (_rdataPtrExtNext_T) begin // @[StoreQueue.scala 162:37]
      io_uncache_req_bits_atomic_REG_value <= rdataPtrExtNext_new_ptr_value;
    end else if (_rdataPtrExtNext_T_1 | _rdataPtrExtNext_T_2) begin // @[StoreQueue.scala 164:8]
      io_uncache_req_bits_atomic_REG_value <= rdataPtrExtNext_new_ptr_2_value;
    end else begin
      io_uncache_req_bits_atomic_REG_value <= rdataPtrExt_0_value;
    end
    REG_14 <= io_sbuffer_0_ready & io_sbuffer_0_valid; // @[Decoupled.scala 50:35]
    if (_deqPtrExtNext_T_1) begin // @[Reg.scala 17:18]
      r <= dataBuffer_io_deq_0_bits_sqPtr_value; // @[Reg.scala 17:22]
    end
    if (_deqPtrExtNext_T_1) begin // @[Reg.scala 17:18]
      r_1 <= dataBuffer_io_deq_0_bits_sqPtr_value; // @[Reg.scala 17:22]
    end
    REG_15 <= io_sbuffer_1_ready & io_sbuffer_1_valid; // @[Decoupled.scala 50:35]
    if (_deqPtrExtNext_T) begin // @[Reg.scala 17:18]
      r_2 <= dataBuffer_io_deq_1_bits_sqPtr_value; // @[Reg.scala 17:22]
    end
    if (_deqPtrExtNext_T) begin // @[Reg.scala 17:18]
      r_3 <= dataBuffer_io_deq_1_bits_sqPtr_value; // @[Reg.scala 17:22]
    end
    lastEnqCancel_REG_0 <= io_enq_req_0_valid & enqCancel_0; // @[StoreQueue.scala 720:88]
    lastEnqCancel_REG_1 <= io_enq_req_1_valid & enqCancel_1; // @[StoreQueue.scala 720:88]
    lastEnqCancel_REG_2 <= io_enq_req_2_valid & enqCancel_2; // @[StoreQueue.scala 720:88]
    lastEnqCancel_REG_3 <= io_enq_req_3_valid & enqCancel_3; // @[StoreQueue.scala 720:88]
    lastCycleRedirect <= io_brqRedirect_valid; // @[StoreQueue.scala 721:34]
    lastCycleCancelCount_REG_0 <= _needCancel_0_T_2 & allocated_0 & ~committed_0; // @[StoreQueue.scala 711:78]
    lastCycleCancelCount_REG_1 <= _needCancel_1_T_2 & allocated_1 & ~committed_1; // @[StoreQueue.scala 711:78]
    lastCycleCancelCount_REG_2 <= _needCancel_2_T_2 & allocated_2 & ~committed_2; // @[StoreQueue.scala 711:78]
    lastCycleCancelCount_REG_3 <= _needCancel_3_T_2 & allocated_3 & ~committed_3; // @[StoreQueue.scala 711:78]
    lastCycleCancelCount_REG_4 <= _needCancel_4_T_2 & allocated_4 & ~committed_4; // @[StoreQueue.scala 711:78]
    lastCycleCancelCount_REG_5 <= _needCancel_5_T_2 & allocated_5 & ~committed_5; // @[StoreQueue.scala 711:78]
    lastCycleCancelCount_REG_6 <= _needCancel_6_T_2 & allocated_6 & ~committed_6; // @[StoreQueue.scala 711:78]
    lastCycleCancelCount_REG_7 <= _needCancel_7_T_2 & allocated_7 & ~committed_7; // @[StoreQueue.scala 711:78]
    lastCycleCancelCount_REG_8 <= _needCancel_8_T_2 & allocated_8 & ~committed_8; // @[StoreQueue.scala 711:78]
    lastCycleCancelCount_REG_9 <= _needCancel_9_T_2 & allocated_9 & ~committed_9; // @[StoreQueue.scala 711:78]
    lastCycleCancelCount_REG_10 <= _needCancel_10_T_2 & allocated_10 & ~committed_10; // @[StoreQueue.scala 711:78]
    lastCycleCancelCount_REG_11 <= _needCancel_11_T_2 & allocated_11 & ~committed_11; // @[StoreQueue.scala 711:78]
    io_sqCancelCnt_REG <= lastCycleCancelCount + _GEN_15698; // @[StoreQueue.scala 737:50]
    io_sqEmpty_REG <= enqPtrExt_0_value == deqPtrExt_0_value & _validCount_T; // @[StoreQueue.scala 744:47]
    io_perf_0_value_REG <= uncacheState != 3'h0; // @[StoreQueue.scala 761:38]
    io_perf_0_value_REG_1 <= io_perf_0_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_1_value_REG <= io_uncache_req_ready & io_uncache_req_valid; // @[Decoupled.scala 50:35]
    io_perf_1_value_REG_1 <= io_perf_1_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_2_value_REG <= io_mmioStout_ready & io_mmioStout_valid; // @[Decoupled.scala 50:35]
    io_perf_2_value_REG_1 <= io_perf_2_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_3_value_REG <= io_mmioStout_valid & _T_136; // @[StoreQueue.scala 764:44]
    io_perf_3_value_REG_1 <= io_perf_3_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_4_value_REG <= validCount < _T_167; // @[StoreQueue.scala 765:41]
    io_perf_4_value_REG_1 <= io_perf_4_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_5_value_REG <= validCount > _T_167 & validCount <= _T_171; // @[StoreQueue.scala 766:67]
    io_perf_5_value_REG_1 <= io_perf_5_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_6_value_REG <= validCount > _T_171 & _GEN_15707 <= _T_177; // @[StoreQueue.scala 767:67]
    io_perf_6_value_REG_1 <= io_perf_6_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_7_value_REG <= _GEN_15707 > _T_177; // @[StoreQueue.scala 768:41]
    io_perf_7_value_REG_1 <= io_perf_7_value_REG; // @[PerfCounterUtils.scala 188:27]
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 712:26]
      allocated_0 <= 1'h0; // @[StoreQueue.scala 713:20]
    end else if (needCancel_0) begin // @[StoreQueue.scala 660:42]
      allocated_0 <= 1'h0; // @[StoreQueue.scala 661:{53,53}]
    end else if (REG_15) begin
      if (4'h0 == r_2) begin
        allocated_0 <= 1'h0;
      end else begin
        allocated_0 <= _GEN_15470;
      end
    end else begin
      allocated_0 <= _GEN_15470;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 712:26]
      allocated_1 <= 1'h0; // @[StoreQueue.scala 713:20]
    end else if (needCancel_1) begin // @[StoreQueue.scala 660:42]
      allocated_1 <= 1'h0; // @[StoreQueue.scala 661:{53,53}]
    end else if (REG_15) begin
      if (4'h1 == r_2) begin
        allocated_1 <= 1'h0;
      end else begin
        allocated_1 <= _GEN_15471;
      end
    end else begin
      allocated_1 <= _GEN_15471;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 712:26]
      allocated_2 <= 1'h0; // @[StoreQueue.scala 713:20]
    end else if (needCancel_2) begin // @[StoreQueue.scala 660:42]
      allocated_2 <= 1'h0; // @[StoreQueue.scala 661:{53,53}]
    end else if (REG_15) begin
      if (4'h2 == r_2) begin
        allocated_2 <= 1'h0;
      end else begin
        allocated_2 <= _GEN_15472;
      end
    end else begin
      allocated_2 <= _GEN_15472;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 712:26]
      allocated_3 <= 1'h0; // @[StoreQueue.scala 713:20]
    end else if (needCancel_3) begin // @[StoreQueue.scala 660:42]
      allocated_3 <= 1'h0; // @[StoreQueue.scala 661:{53,53}]
    end else if (REG_15) begin
      if (4'h3 == r_2) begin
        allocated_3 <= 1'h0;
      end else begin
        allocated_3 <= _GEN_15473;
      end
    end else begin
      allocated_3 <= _GEN_15473;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 712:26]
      allocated_4 <= 1'h0; // @[StoreQueue.scala 713:20]
    end else if (needCancel_4) begin // @[StoreQueue.scala 660:42]
      allocated_4 <= 1'h0; // @[StoreQueue.scala 661:{53,53}]
    end else if (REG_15) begin
      if (4'h4 == r_2) begin
        allocated_4 <= 1'h0;
      end else begin
        allocated_4 <= _GEN_15474;
      end
    end else begin
      allocated_4 <= _GEN_15474;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 712:26]
      allocated_5 <= 1'h0; // @[StoreQueue.scala 713:20]
    end else if (needCancel_5) begin // @[StoreQueue.scala 660:42]
      allocated_5 <= 1'h0; // @[StoreQueue.scala 661:{53,53}]
    end else if (REG_15) begin
      if (4'h5 == r_2) begin
        allocated_5 <= 1'h0;
      end else begin
        allocated_5 <= _GEN_15475;
      end
    end else begin
      allocated_5 <= _GEN_15475;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 712:26]
      allocated_6 <= 1'h0; // @[StoreQueue.scala 713:20]
    end else if (needCancel_6) begin // @[StoreQueue.scala 660:42]
      allocated_6 <= 1'h0; // @[StoreQueue.scala 661:{53,53}]
    end else if (REG_15) begin
      if (4'h6 == r_2) begin
        allocated_6 <= 1'h0;
      end else begin
        allocated_6 <= _GEN_15476;
      end
    end else begin
      allocated_6 <= _GEN_15476;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 712:26]
      allocated_7 <= 1'h0; // @[StoreQueue.scala 713:20]
    end else if (needCancel_7) begin // @[StoreQueue.scala 660:42]
      allocated_7 <= 1'h0; // @[StoreQueue.scala 661:{53,53}]
    end else if (REG_15) begin
      if (4'h7 == r_2) begin
        allocated_7 <= 1'h0;
      end else begin
        allocated_7 <= _GEN_15477;
      end
    end else begin
      allocated_7 <= _GEN_15477;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 712:26]
      allocated_8 <= 1'h0; // @[StoreQueue.scala 713:20]
    end else if (needCancel_8) begin // @[StoreQueue.scala 660:42]
      allocated_8 <= 1'h0; // @[StoreQueue.scala 661:{53,53}]
    end else if (REG_15) begin
      if (4'h8 == r_2) begin
        allocated_8 <= 1'h0;
      end else begin
        allocated_8 <= _GEN_15478;
      end
    end else begin
      allocated_8 <= _GEN_15478;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 712:26]
      allocated_9 <= 1'h0; // @[StoreQueue.scala 713:20]
    end else if (needCancel_9) begin // @[StoreQueue.scala 660:42]
      allocated_9 <= 1'h0; // @[StoreQueue.scala 661:{53,53}]
    end else if (REG_15) begin
      if (4'h9 == r_2) begin
        allocated_9 <= 1'h0;
      end else begin
        allocated_9 <= _GEN_15479;
      end
    end else begin
      allocated_9 <= _GEN_15479;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 712:26]
      allocated_10 <= 1'h0; // @[StoreQueue.scala 713:20]
    end else if (needCancel_10) begin // @[StoreQueue.scala 660:42]
      allocated_10 <= 1'h0; // @[StoreQueue.scala 661:{53,53}]
    end else if (REG_15) begin
      if (4'ha == r_2) begin
        allocated_10 <= 1'h0;
      end else begin
        allocated_10 <= _GEN_15480;
      end
    end else begin
      allocated_10 <= _GEN_15480;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 712:26]
      allocated_11 <= 1'h0; // @[StoreQueue.scala 713:20]
    end else if (needCancel_11) begin // @[StoreQueue.scala 660:42]
      allocated_11 <= 1'h0; // @[StoreQueue.scala 661:{53,53}]
    end else if (REG_15) begin
      if (4'hb == r_2) begin
        allocated_11 <= 1'h0;
      end else begin
        allocated_11 <= _GEN_15481;
      end
    end else begin
      allocated_11 <= _GEN_15481;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 288:37]
      addrvalid_0 <= 1'h0; // @[StoreQueue.scala 290:{28,28}]
    end else if (io_storeAddrIn_1_valid) begin
      if (4'h0 == io_storeAddrIn_1_bits_uop_sqIdx_value) begin
        addrvalid_0 <= addr_valid_1;
      end else begin
        addrvalid_0 <= _GEN_11836;
      end
    end else begin
      addrvalid_0 <= _GEN_11836;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 288:37]
      addrvalid_1 <= 1'h0; // @[StoreQueue.scala 290:{28,28}]
    end else if (io_storeAddrIn_1_valid) begin
      if (4'h1 == io_storeAddrIn_1_bits_uop_sqIdx_value) begin
        addrvalid_1 <= addr_valid_1;
      end else begin
        addrvalid_1 <= _GEN_11837;
      end
    end else begin
      addrvalid_1 <= _GEN_11837;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 288:37]
      addrvalid_2 <= 1'h0; // @[StoreQueue.scala 290:{28,28}]
    end else if (io_storeAddrIn_1_valid) begin
      if (4'h2 == io_storeAddrIn_1_bits_uop_sqIdx_value) begin
        addrvalid_2 <= addr_valid_1;
      end else begin
        addrvalid_2 <= _GEN_11838;
      end
    end else begin
      addrvalid_2 <= _GEN_11838;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 288:37]
      addrvalid_3 <= 1'h0; // @[StoreQueue.scala 290:{28,28}]
    end else if (io_storeAddrIn_1_valid) begin
      if (4'h3 == io_storeAddrIn_1_bits_uop_sqIdx_value) begin
        addrvalid_3 <= addr_valid_1;
      end else begin
        addrvalid_3 <= _GEN_11839;
      end
    end else begin
      addrvalid_3 <= _GEN_11839;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 288:37]
      addrvalid_4 <= 1'h0; // @[StoreQueue.scala 290:{28,28}]
    end else if (io_storeAddrIn_1_valid) begin
      if (4'h4 == io_storeAddrIn_1_bits_uop_sqIdx_value) begin
        addrvalid_4 <= addr_valid_1;
      end else begin
        addrvalid_4 <= _GEN_11840;
      end
    end else begin
      addrvalid_4 <= _GEN_11840;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 288:37]
      addrvalid_5 <= 1'h0; // @[StoreQueue.scala 290:{28,28}]
    end else if (io_storeAddrIn_1_valid) begin
      if (4'h5 == io_storeAddrIn_1_bits_uop_sqIdx_value) begin
        addrvalid_5 <= addr_valid_1;
      end else begin
        addrvalid_5 <= _GEN_11841;
      end
    end else begin
      addrvalid_5 <= _GEN_11841;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 288:37]
      addrvalid_6 <= 1'h0; // @[StoreQueue.scala 290:{28,28}]
    end else if (io_storeAddrIn_1_valid) begin
      if (4'h6 == io_storeAddrIn_1_bits_uop_sqIdx_value) begin
        addrvalid_6 <= addr_valid_1;
      end else begin
        addrvalid_6 <= _GEN_11842;
      end
    end else begin
      addrvalid_6 <= _GEN_11842;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 288:37]
      addrvalid_7 <= 1'h0; // @[StoreQueue.scala 290:{28,28}]
    end else if (io_storeAddrIn_1_valid) begin
      if (4'h7 == io_storeAddrIn_1_bits_uop_sqIdx_value) begin
        addrvalid_7 <= addr_valid_1;
      end else begin
        addrvalid_7 <= _GEN_11843;
      end
    end else begin
      addrvalid_7 <= _GEN_11843;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 288:37]
      addrvalid_8 <= 1'h0; // @[StoreQueue.scala 290:{28,28}]
    end else if (io_storeAddrIn_1_valid) begin
      if (4'h8 == io_storeAddrIn_1_bits_uop_sqIdx_value) begin
        addrvalid_8 <= addr_valid_1;
      end else begin
        addrvalid_8 <= _GEN_11844;
      end
    end else begin
      addrvalid_8 <= _GEN_11844;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 288:37]
      addrvalid_9 <= 1'h0; // @[StoreQueue.scala 290:{28,28}]
    end else if (io_storeAddrIn_1_valid) begin
      if (4'h9 == io_storeAddrIn_1_bits_uop_sqIdx_value) begin
        addrvalid_9 <= addr_valid_1;
      end else begin
        addrvalid_9 <= _GEN_11845;
      end
    end else begin
      addrvalid_9 <= _GEN_11845;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 288:37]
      addrvalid_10 <= 1'h0; // @[StoreQueue.scala 290:{28,28}]
    end else if (io_storeAddrIn_1_valid) begin
      if (4'ha == io_storeAddrIn_1_bits_uop_sqIdx_value) begin
        addrvalid_10 <= addr_valid_1;
      end else begin
        addrvalid_10 <= _GEN_11846;
      end
    end else begin
      addrvalid_10 <= _GEN_11846;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 288:37]
      addrvalid_11 <= 1'h0; // @[StoreQueue.scala 290:{28,28}]
    end else if (io_storeAddrIn_1_valid) begin
      if (4'hb == io_storeAddrIn_1_bits_uop_sqIdx_value) begin
        addrvalid_11 <= addr_valid_1;
      end else begin
        addrvalid_11 <= _GEN_11847;
      end
    end else begin
      addrvalid_11 <= _GEN_11847;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 362:7]
      datavalid_0 <= 1'h0;
    end else if (REG_4) begin // @[StoreQueue.scala 362:7]
      datavalid_0 <= _GEN_13844;
    end else if (REG_2) begin // @[StoreQueue.scala 211:43]
      datavalid_0 <= _GEN_13793; // @[StoreQueue.scala 216:{24,24}]
    end else if (io_enq_req_3_valid & ~enqCancel_3) begin
      if (4'h0 == io_enq_req_3_bits_sqIdx_value) begin
        datavalid_0 <= 1'h0;
      end else begin
        datavalid_0 <= _GEN_8236;
      end
    end else begin
      datavalid_0 <= _GEN_8236;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 362:7]
      datavalid_1 <= 1'h0;
    end else if (REG_4) begin // @[StoreQueue.scala 362:7]
      datavalid_1 <= _GEN_13845;
    end else if (REG_2) begin // @[StoreQueue.scala 211:43]
      datavalid_1 <= _GEN_13794; // @[StoreQueue.scala 216:{24,24}]
    end else if (io_enq_req_3_valid & ~enqCancel_3) begin
      if (4'h1 == io_enq_req_3_bits_sqIdx_value) begin
        datavalid_1 <= 1'h0;
      end else begin
        datavalid_1 <= _GEN_8237;
      end
    end else begin
      datavalid_1 <= _GEN_8237;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 362:7]
      datavalid_2 <= 1'h0;
    end else if (REG_4) begin // @[StoreQueue.scala 362:7]
      datavalid_2 <= _GEN_13846;
    end else if (REG_2) begin // @[StoreQueue.scala 211:43]
      datavalid_2 <= _GEN_13795; // @[StoreQueue.scala 216:{24,24}]
    end else if (io_enq_req_3_valid & ~enqCancel_3) begin
      if (4'h2 == io_enq_req_3_bits_sqIdx_value) begin
        datavalid_2 <= 1'h0;
      end else begin
        datavalid_2 <= _GEN_8238;
      end
    end else begin
      datavalid_2 <= _GEN_8238;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 362:7]
      datavalid_3 <= 1'h0;
    end else if (REG_4) begin // @[StoreQueue.scala 362:7]
      datavalid_3 <= _GEN_13847;
    end else if (REG_2) begin // @[StoreQueue.scala 211:43]
      datavalid_3 <= _GEN_13796; // @[StoreQueue.scala 216:{24,24}]
    end else if (io_enq_req_3_valid & ~enqCancel_3) begin
      if (4'h3 == io_enq_req_3_bits_sqIdx_value) begin
        datavalid_3 <= 1'h0;
      end else begin
        datavalid_3 <= _GEN_8239;
      end
    end else begin
      datavalid_3 <= _GEN_8239;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 362:7]
      datavalid_4 <= 1'h0;
    end else if (REG_4) begin // @[StoreQueue.scala 362:7]
      datavalid_4 <= _GEN_13848;
    end else if (REG_2) begin // @[StoreQueue.scala 211:43]
      datavalid_4 <= _GEN_13797; // @[StoreQueue.scala 216:{24,24}]
    end else if (io_enq_req_3_valid & ~enqCancel_3) begin
      if (4'h4 == io_enq_req_3_bits_sqIdx_value) begin
        datavalid_4 <= 1'h0;
      end else begin
        datavalid_4 <= _GEN_8240;
      end
    end else begin
      datavalid_4 <= _GEN_8240;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 362:7]
      datavalid_5 <= 1'h0;
    end else if (REG_4) begin // @[StoreQueue.scala 362:7]
      datavalid_5 <= _GEN_13849;
    end else if (REG_2) begin // @[StoreQueue.scala 211:43]
      datavalid_5 <= _GEN_13798; // @[StoreQueue.scala 216:{24,24}]
    end else if (io_enq_req_3_valid & ~enqCancel_3) begin
      if (4'h5 == io_enq_req_3_bits_sqIdx_value) begin
        datavalid_5 <= 1'h0;
      end else begin
        datavalid_5 <= _GEN_8241;
      end
    end else begin
      datavalid_5 <= _GEN_8241;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 362:7]
      datavalid_6 <= 1'h0;
    end else if (REG_4) begin // @[StoreQueue.scala 362:7]
      datavalid_6 <= _GEN_13850;
    end else if (REG_2) begin // @[StoreQueue.scala 211:43]
      datavalid_6 <= _GEN_13799; // @[StoreQueue.scala 216:{24,24}]
    end else if (io_enq_req_3_valid & ~enqCancel_3) begin
      if (4'h6 == io_enq_req_3_bits_sqIdx_value) begin
        datavalid_6 <= 1'h0;
      end else begin
        datavalid_6 <= _GEN_8242;
      end
    end else begin
      datavalid_6 <= _GEN_8242;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 362:7]
      datavalid_7 <= 1'h0;
    end else if (REG_4) begin // @[StoreQueue.scala 362:7]
      datavalid_7 <= _GEN_13851;
    end else if (REG_2) begin // @[StoreQueue.scala 211:43]
      datavalid_7 <= _GEN_13800; // @[StoreQueue.scala 216:{24,24}]
    end else if (io_enq_req_3_valid & ~enqCancel_3) begin
      if (4'h7 == io_enq_req_3_bits_sqIdx_value) begin
        datavalid_7 <= 1'h0;
      end else begin
        datavalid_7 <= _GEN_8243;
      end
    end else begin
      datavalid_7 <= _GEN_8243;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 362:7]
      datavalid_8 <= 1'h0;
    end else if (REG_4) begin // @[StoreQueue.scala 362:7]
      datavalid_8 <= _GEN_13852;
    end else if (REG_2) begin // @[StoreQueue.scala 211:43]
      datavalid_8 <= _GEN_13801; // @[StoreQueue.scala 216:{24,24}]
    end else if (io_enq_req_3_valid & ~enqCancel_3) begin
      if (4'h8 == io_enq_req_3_bits_sqIdx_value) begin
        datavalid_8 <= 1'h0;
      end else begin
        datavalid_8 <= _GEN_8244;
      end
    end else begin
      datavalid_8 <= _GEN_8244;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 362:7]
      datavalid_9 <= 1'h0;
    end else if (REG_4) begin // @[StoreQueue.scala 362:7]
      datavalid_9 <= _GEN_13853;
    end else if (REG_2) begin // @[StoreQueue.scala 211:43]
      datavalid_9 <= _GEN_13802; // @[StoreQueue.scala 216:{24,24}]
    end else if (io_enq_req_3_valid & ~enqCancel_3) begin
      if (4'h9 == io_enq_req_3_bits_sqIdx_value) begin
        datavalid_9 <= 1'h0;
      end else begin
        datavalid_9 <= _GEN_8245;
      end
    end else begin
      datavalid_9 <= _GEN_8245;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 362:7]
      datavalid_10 <= 1'h0;
    end else if (REG_4) begin // @[StoreQueue.scala 362:7]
      datavalid_10 <= _GEN_13854;
    end else if (REG_2) begin // @[StoreQueue.scala 211:43]
      datavalid_10 <= _GEN_13803; // @[StoreQueue.scala 216:{24,24}]
    end else if (io_enq_req_3_valid & ~enqCancel_3) begin
      if (4'ha == io_enq_req_3_bits_sqIdx_value) begin
        datavalid_10 <= 1'h0;
      end else begin
        datavalid_10 <= _GEN_8246;
      end
    end else begin
      datavalid_10 <= _GEN_8246;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 362:7]
      datavalid_11 <= 1'h0;
    end else if (REG_4) begin // @[StoreQueue.scala 362:7]
      datavalid_11 <= _GEN_13855;
    end else if (REG_2) begin // @[StoreQueue.scala 211:43]
      datavalid_11 <= _GEN_13804; // @[StoreQueue.scala 216:{24,24}]
    end else if (io_enq_req_3_valid & ~enqCancel_3) begin
      if (4'hb == io_enq_req_3_bits_sqIdx_value) begin
        datavalid_11 <= 1'h0;
      end else begin
        datavalid_11 <= _GEN_8247;
      end
    end else begin
      datavalid_11 <= _GEN_8247;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 660:42]
      tosbuffer_0 <= 1'h0;
    end else if (REG_15) begin // @[StoreQueue.scala 660:42]
      tosbuffer_0 <= _GEN_15508;
    end else if (REG_14) begin // @[StoreQueue.scala 211:43]
      tosbuffer_0 <= _GEN_15458; // @[StoreQueue.scala 220:{24,24}]
    end else if (io_enq_req_3_valid & ~enqCancel_3) begin
      if (4'h0 == io_enq_req_3_bits_sqIdx_value) begin
        tosbuffer_0 <= 1'h0;
      end else begin
        tosbuffer_0 <= _GEN_8284;
      end
    end else begin
      tosbuffer_0 <= _GEN_8284;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 660:42]
      tosbuffer_1 <= 1'h0;
    end else if (REG_15) begin // @[StoreQueue.scala 660:42]
      tosbuffer_1 <= _GEN_15509;
    end else if (REG_14) begin // @[StoreQueue.scala 211:43]
      tosbuffer_1 <= _GEN_15459; // @[StoreQueue.scala 220:{24,24}]
    end else if (io_enq_req_3_valid & ~enqCancel_3) begin
      if (4'h1 == io_enq_req_3_bits_sqIdx_value) begin
        tosbuffer_1 <= 1'h0;
      end else begin
        tosbuffer_1 <= _GEN_8285;
      end
    end else begin
      tosbuffer_1 <= _GEN_8285;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 660:42]
      tosbuffer_2 <= 1'h0;
    end else if (REG_15) begin // @[StoreQueue.scala 660:42]
      tosbuffer_2 <= _GEN_15510;
    end else if (REG_14) begin // @[StoreQueue.scala 211:43]
      tosbuffer_2 <= _GEN_15460; // @[StoreQueue.scala 220:{24,24}]
    end else if (io_enq_req_3_valid & ~enqCancel_3) begin
      if (4'h2 == io_enq_req_3_bits_sqIdx_value) begin
        tosbuffer_2 <= 1'h0;
      end else begin
        tosbuffer_2 <= _GEN_8286;
      end
    end else begin
      tosbuffer_2 <= _GEN_8286;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 660:42]
      tosbuffer_3 <= 1'h0;
    end else if (REG_15) begin // @[StoreQueue.scala 660:42]
      tosbuffer_3 <= _GEN_15511;
    end else if (REG_14) begin // @[StoreQueue.scala 211:43]
      tosbuffer_3 <= _GEN_15461; // @[StoreQueue.scala 220:{24,24}]
    end else if (io_enq_req_3_valid & ~enqCancel_3) begin
      if (4'h3 == io_enq_req_3_bits_sqIdx_value) begin
        tosbuffer_3 <= 1'h0;
      end else begin
        tosbuffer_3 <= _GEN_8287;
      end
    end else begin
      tosbuffer_3 <= _GEN_8287;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 660:42]
      tosbuffer_4 <= 1'h0;
    end else if (REG_15) begin // @[StoreQueue.scala 660:42]
      tosbuffer_4 <= _GEN_15512;
    end else if (REG_14) begin // @[StoreQueue.scala 211:43]
      tosbuffer_4 <= _GEN_15462; // @[StoreQueue.scala 220:{24,24}]
    end else if (io_enq_req_3_valid & ~enqCancel_3) begin
      if (4'h4 == io_enq_req_3_bits_sqIdx_value) begin
        tosbuffer_4 <= 1'h0;
      end else begin
        tosbuffer_4 <= _GEN_8288;
      end
    end else begin
      tosbuffer_4 <= _GEN_8288;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 660:42]
      tosbuffer_5 <= 1'h0;
    end else if (REG_15) begin // @[StoreQueue.scala 660:42]
      tosbuffer_5 <= _GEN_15513;
    end else if (REG_14) begin // @[StoreQueue.scala 211:43]
      tosbuffer_5 <= _GEN_15463; // @[StoreQueue.scala 220:{24,24}]
    end else if (io_enq_req_3_valid & ~enqCancel_3) begin
      if (4'h5 == io_enq_req_3_bits_sqIdx_value) begin
        tosbuffer_5 <= 1'h0;
      end else begin
        tosbuffer_5 <= _GEN_8289;
      end
    end else begin
      tosbuffer_5 <= _GEN_8289;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 660:42]
      tosbuffer_6 <= 1'h0;
    end else if (REG_15) begin // @[StoreQueue.scala 660:42]
      tosbuffer_6 <= _GEN_15514;
    end else if (REG_14) begin // @[StoreQueue.scala 211:43]
      tosbuffer_6 <= _GEN_15464; // @[StoreQueue.scala 220:{24,24}]
    end else if (io_enq_req_3_valid & ~enqCancel_3) begin
      if (4'h6 == io_enq_req_3_bits_sqIdx_value) begin
        tosbuffer_6 <= 1'h0;
      end else begin
        tosbuffer_6 <= _GEN_8290;
      end
    end else begin
      tosbuffer_6 <= _GEN_8290;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 660:42]
      tosbuffer_7 <= 1'h0;
    end else if (REG_15) begin // @[StoreQueue.scala 660:42]
      tosbuffer_7 <= _GEN_15515;
    end else if (REG_14) begin // @[StoreQueue.scala 211:43]
      tosbuffer_7 <= _GEN_15465; // @[StoreQueue.scala 220:{24,24}]
    end else if (io_enq_req_3_valid & ~enqCancel_3) begin
      if (4'h7 == io_enq_req_3_bits_sqIdx_value) begin
        tosbuffer_7 <= 1'h0;
      end else begin
        tosbuffer_7 <= _GEN_8291;
      end
    end else begin
      tosbuffer_7 <= _GEN_8291;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 660:42]
      tosbuffer_8 <= 1'h0;
    end else if (REG_15) begin // @[StoreQueue.scala 660:42]
      tosbuffer_8 <= _GEN_15516;
    end else if (REG_14) begin // @[StoreQueue.scala 211:43]
      tosbuffer_8 <= _GEN_15466; // @[StoreQueue.scala 220:{24,24}]
    end else if (io_enq_req_3_valid & ~enqCancel_3) begin
      if (4'h8 == io_enq_req_3_bits_sqIdx_value) begin
        tosbuffer_8 <= 1'h0;
      end else begin
        tosbuffer_8 <= _GEN_8292;
      end
    end else begin
      tosbuffer_8 <= _GEN_8292;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 660:42]
      tosbuffer_9 <= 1'h0;
    end else if (REG_15) begin // @[StoreQueue.scala 660:42]
      tosbuffer_9 <= _GEN_15517;
    end else if (REG_14) begin // @[StoreQueue.scala 211:43]
      tosbuffer_9 <= _GEN_15467; // @[StoreQueue.scala 220:{24,24}]
    end else if (io_enq_req_3_valid & ~enqCancel_3) begin
      if (4'h9 == io_enq_req_3_bits_sqIdx_value) begin
        tosbuffer_9 <= 1'h0;
      end else begin
        tosbuffer_9 <= _GEN_8293;
      end
    end else begin
      tosbuffer_9 <= _GEN_8293;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 660:42]
      tosbuffer_10 <= 1'h0;
    end else if (REG_15) begin // @[StoreQueue.scala 660:42]
      tosbuffer_10 <= _GEN_15518;
    end else if (REG_14) begin // @[StoreQueue.scala 211:43]
      tosbuffer_10 <= _GEN_15468; // @[StoreQueue.scala 220:{24,24}]
    end else if (io_enq_req_3_valid & ~enqCancel_3) begin
      if (4'ha == io_enq_req_3_bits_sqIdx_value) begin
        tosbuffer_10 <= 1'h0;
      end else begin
        tosbuffer_10 <= _GEN_8294;
      end
    end else begin
      tosbuffer_10 <= _GEN_8294;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 660:42]
      tosbuffer_11 <= 1'h0;
    end else if (REG_15) begin // @[StoreQueue.scala 660:42]
      tosbuffer_11 <= _GEN_15519;
    end else if (REG_14) begin // @[StoreQueue.scala 211:43]
      tosbuffer_11 <= _GEN_15469; // @[StoreQueue.scala 220:{24,24}]
    end else if (io_enq_req_3_valid & ~enqCancel_3) begin
      if (4'hb == io_enq_req_3_bits_sqIdx_value) begin
        tosbuffer_11 <= 1'h0;
      end else begin
        tosbuffer_11 <= _GEN_8295;
      end
    end else begin
      tosbuffer_11 <= _GEN_8295;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 724:28]
      enqPtrExt_0_flag <= 1'h0; // @[StoreQueue.scala 726:15]
    end else if (lastCycleRedirect) begin // @[CircularQueuePtr.scala 44:26]
      enqPtrExt_0_flag <= new_ptr_2_flag;
    end else if (reverse_flag_2) begin
      enqPtrExt_0_flag <= ~enqPtrExt_0_flag;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 724:28]
      enqPtrExt_0_value <= 4'h0; // @[StoreQueue.scala 726:15]
    end else if (lastCycleRedirect) begin // @[StoreQueue.scala 728:15]
      enqPtrExt_0_value <= flipped_new_ptr_value;
    end else begin
      enqPtrExt_0_value <= new_ptr_6_value;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 162:37]
      rdataPtrExt_0_value <= 4'h0;
    end else if (_rdataPtrExtNext_T) begin // @[StoreQueue.scala 164:8]
      rdataPtrExt_0_value <= rdataPtrExtNext_new_ptr_value;
    end else if (_rdataPtrExtNext_T_1 | _rdataPtrExtNext_T_2) begin
      rdataPtrExt_0_value <= rdataPtrExtNext_new_ptr_2_value;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 162:37]
      rdataPtrExt_1_value <= 4'h1;
    end else if (_rdataPtrExtNext_T) begin // @[StoreQueue.scala 164:8]
      rdataPtrExt_1_value <= rdataPtrExtNext_new_ptr_1_value;
    end else if (_rdataPtrExtNext_T_1 | _rdataPtrExtNext_T_2) begin
      rdataPtrExt_1_value <= rdataPtrExtNext_new_ptr_3_value;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 178:26]
      deqPtrExt_0_flag <= 1'h0; // @[CircularQueuePtr.scala 44:26]
    end else if (deqPtrExtNext_REG) begin // @[StoreQueue.scala 180:8]
      if (deqPtrExtNext_reverse_flag) begin // @[CircularQueuePtr.scala 44:26]
        deqPtrExt_0_flag <= ~deqPtrExt_0_flag;
      end
    end else if (deqPtrExtNext_REG_1 | _rdataPtrExtNext_T_2) begin
      if (deqPtrExtNext_reverse_flag_2) begin
        deqPtrExt_0_flag <= ~deqPtrExt_0_flag;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 178:26]
      deqPtrExt_0_value <= 4'h0;
    end else if (deqPtrExtNext_REG) begin // @[StoreQueue.scala 180:8]
      deqPtrExt_0_value <= deqPtrExtNext_new_ptr_value;
    end else if (deqPtrExtNext_REG_1 | _rdataPtrExtNext_T_2) begin
      deqPtrExt_0_value <= deqPtrExtNext_new_ptr_2_value;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[CircularQueuePtr.scala 44:26]
      cmtPtrExt_0_flag <= 1'h0;
    end else if (vaddrModule_io_raddr_2_reverse_flag) begin
      cmtPtrExt_0_flag <= ~cmtPtrExt_0_flag;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[CircularQueuePtr.scala 37:23 45:21]
      cmtPtrExt_0_value <= 4'h0;
    end else begin
      cmtPtrExt_0_value <= _vaddrModule_io_raddr_2_new_ptr_value_T_1[3:0];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[CircularQueuePtr.scala 37:23 45:21]
      cmtPtrExt_1_value <= 4'h1;
    end else begin
      cmtPtrExt_1_value <= _new_ptr_value_T_3[3:0];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 242:31]
      addrReadyPtrExt_flag <= 1'h0; // @[StoreQueue.scala 178:26 243:27 CircularQueuePtr.scala 44:26 StoreQueue.scala 180:8]
    end else if (io_brqRedirect_valid) begin // @[CircularQueuePtr.scala 44:26]
      if (_addrReadyPtrExt_T) begin
        addrReadyPtrExt_flag <= cmtPtrExt_0_flag;
      end else if (deqPtrExtNext_REG) begin
        if (deqPtrExtNext_reverse_flag) begin
          addrReadyPtrExt_flag <= ~deqPtrExt_0_flag;
        end else begin
          addrReadyPtrExt_flag <= deqPtrExt_0_flag;
        end
      end else if (deqPtrExtNext_REG_1 | _rdataPtrExtNext_T_2) begin
        addrReadyPtrExt_flag <= deqPtrExtNext_new_ptr_2_flag;
      end else begin
        addrReadyPtrExt_flag <= deqPtrExt_0_flag;
      end
    end else if (nextAddrReadyPtr_reverse_flag) begin
      addrReadyPtrExt_flag <= ~addrReadyPtrExt_flag;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 242:31]
      addrReadyPtrExt_value <= 4'h0; // @[StoreQueue.scala 178:26 243:27 180:8]
    end else if (io_brqRedirect_valid) begin // @[StoreQueue.scala 239:19]
      if (_addrReadyPtrExt_T) begin
        addrReadyPtrExt_value <= cmtPtrExt_0_value;
      end else if (deqPtrExtNext_REG) begin
        addrReadyPtrExt_value <= deqPtrExtNext_new_ptr_value;
      end else if (deqPtrExtNext_REG_1 | _rdataPtrExtNext_T_2) begin
        addrReadyPtrExt_value <= deqPtrExtNext_new_ptr_2_value;
      end else begin
        addrReadyPtrExt_value <= deqPtrExt_0_value;
      end
    end else begin
      addrReadyPtrExt_value <= nextAddrReadyPtr_value;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 258:31]
      dataReadyPtrExt_flag <= 1'h0; // @[StoreQueue.scala 178:26 243:27 CircularQueuePtr.scala 44:26 StoreQueue.scala 180:8]
    end else if (io_brqRedirect_valid) begin // @[CircularQueuePtr.scala 44:26]
      if (_addrReadyPtrExt_T) begin
        dataReadyPtrExt_flag <= cmtPtrExt_0_flag;
      end else if (deqPtrExtNext_REG) begin
        if (deqPtrExtNext_reverse_flag) begin
          dataReadyPtrExt_flag <= ~deqPtrExt_0_flag;
        end else begin
          dataReadyPtrExt_flag <= deqPtrExt_0_flag;
        end
      end else if (deqPtrExtNext_REG_1 | _rdataPtrExtNext_T_2) begin
        dataReadyPtrExt_flag <= deqPtrExtNext_new_ptr_2_flag;
      end else begin
        dataReadyPtrExt_flag <= deqPtrExt_0_flag;
      end
    end else if (nextDataReadyPtr_reverse_flag) begin
      dataReadyPtrExt_flag <= ~dataReadyPtrExt_flag;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 258:31]
      dataReadyPtrExt_value <= 4'h0; // @[StoreQueue.scala 178:26 243:27 180:8]
    end else if (io_brqRedirect_valid) begin // @[StoreQueue.scala 256:19]
      if (_addrReadyPtrExt_T) begin
        dataReadyPtrExt_value <= cmtPtrExt_0_value;
      end else if (deqPtrExtNext_REG) begin
        dataReadyPtrExt_value <= deqPtrExtNext_new_ptr_value;
      end else if (deqPtrExtNext_REG_1 | _rdataPtrExtNext_T_2) begin
        dataReadyPtrExt_value <= deqPtrExtNext_new_ptr_2_value;
      end else begin
        dataReadyPtrExt_value <= deqPtrExt_0_value;
      end
    end else begin
      dataReadyPtrExt_value <= nextDataReadyPtr_value;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[StoreQueue.scala 507:24]
      uncacheState <= 3'h0; // @[StoreQueue.scala 509:121 510:22 506:29]
    end else if (3'h0 == uncacheState) begin // @[StoreQueue.scala 507:24]
      if (REG_12) begin // @[StoreQueue.scala 514:34]
        uncacheState <= 3'h1; // @[StoreQueue.scala 515:38 516:24 518:24]
      end
    end else if (3'h1 == uncacheState) begin // @[StoreQueue.scala 507:24]
      if (_T_68) begin // @[StoreQueue.scala 523:36]
        if (io_uncacheOutstanding) begin // @[StoreQueue.scala 524:22]
          uncacheState <= 3'h3;
        end else begin
          uncacheState <= 3'h2;
        end
      end
    end else if (3'h2 == uncacheState) begin // @[StoreQueue.scala 507:24]
      if (_T_70) begin
        uncacheState <= 3'h3;
      end
    end else if (3'h3 == uncacheState) begin
      uncacheState <= _GEN_13934;
    end else begin
      uncacheState <= _GEN_13936;
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
  uop_0_cf_trigger_backendEn_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  uop_0_ctrl_fuOpType = _RAND_1[6:0];
  _RAND_2 = {1{`RANDOM}};
  uop_0_robIdx_flag = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  uop_0_robIdx_value = _RAND_3[4:0];
  _RAND_4 = {1{`RANDOM}};
  uop_1_cf_trigger_backendEn_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  uop_1_ctrl_fuOpType = _RAND_5[6:0];
  _RAND_6 = {1{`RANDOM}};
  uop_1_robIdx_flag = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  uop_1_robIdx_value = _RAND_7[4:0];
  _RAND_8 = {1{`RANDOM}};
  uop_2_cf_trigger_backendEn_0 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  uop_2_ctrl_fuOpType = _RAND_9[6:0];
  _RAND_10 = {1{`RANDOM}};
  uop_2_robIdx_flag = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  uop_2_robIdx_value = _RAND_11[4:0];
  _RAND_12 = {1{`RANDOM}};
  uop_3_cf_trigger_backendEn_0 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  uop_3_ctrl_fuOpType = _RAND_13[6:0];
  _RAND_14 = {1{`RANDOM}};
  uop_3_robIdx_flag = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  uop_3_robIdx_value = _RAND_15[4:0];
  _RAND_16 = {1{`RANDOM}};
  uop_4_cf_trigger_backendEn_0 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  uop_4_ctrl_fuOpType = _RAND_17[6:0];
  _RAND_18 = {1{`RANDOM}};
  uop_4_robIdx_flag = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  uop_4_robIdx_value = _RAND_19[4:0];
  _RAND_20 = {1{`RANDOM}};
  uop_5_cf_trigger_backendEn_0 = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  uop_5_ctrl_fuOpType = _RAND_21[6:0];
  _RAND_22 = {1{`RANDOM}};
  uop_5_robIdx_flag = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  uop_5_robIdx_value = _RAND_23[4:0];
  _RAND_24 = {1{`RANDOM}};
  uop_6_cf_trigger_backendEn_0 = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  uop_6_ctrl_fuOpType = _RAND_25[6:0];
  _RAND_26 = {1{`RANDOM}};
  uop_6_robIdx_flag = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  uop_6_robIdx_value = _RAND_27[4:0];
  _RAND_28 = {1{`RANDOM}};
  uop_7_cf_trigger_backendEn_0 = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  uop_7_ctrl_fuOpType = _RAND_29[6:0];
  _RAND_30 = {1{`RANDOM}};
  uop_7_robIdx_flag = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  uop_7_robIdx_value = _RAND_31[4:0];
  _RAND_32 = {1{`RANDOM}};
  uop_8_cf_trigger_backendEn_0 = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  uop_8_ctrl_fuOpType = _RAND_33[6:0];
  _RAND_34 = {1{`RANDOM}};
  uop_8_robIdx_flag = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  uop_8_robIdx_value = _RAND_35[4:0];
  _RAND_36 = {1{`RANDOM}};
  uop_9_cf_trigger_backendEn_0 = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  uop_9_ctrl_fuOpType = _RAND_37[6:0];
  _RAND_38 = {1{`RANDOM}};
  uop_9_robIdx_flag = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  uop_9_robIdx_value = _RAND_39[4:0];
  _RAND_40 = {1{`RANDOM}};
  uop_10_cf_trigger_backendEn_0 = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  uop_10_ctrl_fuOpType = _RAND_41[6:0];
  _RAND_42 = {1{`RANDOM}};
  uop_10_robIdx_flag = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  uop_10_robIdx_value = _RAND_43[4:0];
  _RAND_44 = {1{`RANDOM}};
  uop_11_cf_trigger_backendEn_0 = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  uop_11_ctrl_fuOpType = _RAND_45[6:0];
  _RAND_46 = {1{`RANDOM}};
  uop_11_robIdx_flag = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  uop_11_robIdx_value = _RAND_47[4:0];
  _RAND_48 = {1{`RANDOM}};
  allocated_0 = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  allocated_1 = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  allocated_2 = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  allocated_3 = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  allocated_4 = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  allocated_5 = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  allocated_6 = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  allocated_7 = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  allocated_8 = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  allocated_9 = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  allocated_10 = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  allocated_11 = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  addrvalid_0 = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  addrvalid_1 = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  addrvalid_2 = _RAND_62[0:0];
  _RAND_63 = {1{`RANDOM}};
  addrvalid_3 = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  addrvalid_4 = _RAND_64[0:0];
  _RAND_65 = {1{`RANDOM}};
  addrvalid_5 = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  addrvalid_6 = _RAND_66[0:0];
  _RAND_67 = {1{`RANDOM}};
  addrvalid_7 = _RAND_67[0:0];
  _RAND_68 = {1{`RANDOM}};
  addrvalid_8 = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  addrvalid_9 = _RAND_69[0:0];
  _RAND_70 = {1{`RANDOM}};
  addrvalid_10 = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  addrvalid_11 = _RAND_71[0:0];
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
  committed_0 = _RAND_84[0:0];
  _RAND_85 = {1{`RANDOM}};
  committed_1 = _RAND_85[0:0];
  _RAND_86 = {1{`RANDOM}};
  committed_2 = _RAND_86[0:0];
  _RAND_87 = {1{`RANDOM}};
  committed_3 = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  committed_4 = _RAND_88[0:0];
  _RAND_89 = {1{`RANDOM}};
  committed_5 = _RAND_89[0:0];
  _RAND_90 = {1{`RANDOM}};
  committed_6 = _RAND_90[0:0];
  _RAND_91 = {1{`RANDOM}};
  committed_7 = _RAND_91[0:0];
  _RAND_92 = {1{`RANDOM}};
  committed_8 = _RAND_92[0:0];
  _RAND_93 = {1{`RANDOM}};
  committed_9 = _RAND_93[0:0];
  _RAND_94 = {1{`RANDOM}};
  committed_10 = _RAND_94[0:0];
  _RAND_95 = {1{`RANDOM}};
  committed_11 = _RAND_95[0:0];
  _RAND_96 = {1{`RANDOM}};
  pending_0 = _RAND_96[0:0];
  _RAND_97 = {1{`RANDOM}};
  pending_1 = _RAND_97[0:0];
  _RAND_98 = {1{`RANDOM}};
  pending_2 = _RAND_98[0:0];
  _RAND_99 = {1{`RANDOM}};
  pending_3 = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  pending_4 = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  pending_5 = _RAND_101[0:0];
  _RAND_102 = {1{`RANDOM}};
  pending_6 = _RAND_102[0:0];
  _RAND_103 = {1{`RANDOM}};
  pending_7 = _RAND_103[0:0];
  _RAND_104 = {1{`RANDOM}};
  pending_8 = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  pending_9 = _RAND_105[0:0];
  _RAND_106 = {1{`RANDOM}};
  pending_10 = _RAND_106[0:0];
  _RAND_107 = {1{`RANDOM}};
  pending_11 = _RAND_107[0:0];
  _RAND_108 = {1{`RANDOM}};
  mmio_0 = _RAND_108[0:0];
  _RAND_109 = {1{`RANDOM}};
  mmio_1 = _RAND_109[0:0];
  _RAND_110 = {1{`RANDOM}};
  mmio_2 = _RAND_110[0:0];
  _RAND_111 = {1{`RANDOM}};
  mmio_3 = _RAND_111[0:0];
  _RAND_112 = {1{`RANDOM}};
  mmio_4 = _RAND_112[0:0];
  _RAND_113 = {1{`RANDOM}};
  mmio_5 = _RAND_113[0:0];
  _RAND_114 = {1{`RANDOM}};
  mmio_6 = _RAND_114[0:0];
  _RAND_115 = {1{`RANDOM}};
  mmio_7 = _RAND_115[0:0];
  _RAND_116 = {1{`RANDOM}};
  mmio_8 = _RAND_116[0:0];
  _RAND_117 = {1{`RANDOM}};
  mmio_9 = _RAND_117[0:0];
  _RAND_118 = {1{`RANDOM}};
  mmio_10 = _RAND_118[0:0];
  _RAND_119 = {1{`RANDOM}};
  mmio_11 = _RAND_119[0:0];
  _RAND_120 = {1{`RANDOM}};
  atomic_0 = _RAND_120[0:0];
  _RAND_121 = {1{`RANDOM}};
  atomic_1 = _RAND_121[0:0];
  _RAND_122 = {1{`RANDOM}};
  atomic_2 = _RAND_122[0:0];
  _RAND_123 = {1{`RANDOM}};
  atomic_3 = _RAND_123[0:0];
  _RAND_124 = {1{`RANDOM}};
  atomic_4 = _RAND_124[0:0];
  _RAND_125 = {1{`RANDOM}};
  atomic_5 = _RAND_125[0:0];
  _RAND_126 = {1{`RANDOM}};
  atomic_6 = _RAND_126[0:0];
  _RAND_127 = {1{`RANDOM}};
  atomic_7 = _RAND_127[0:0];
  _RAND_128 = {1{`RANDOM}};
  atomic_8 = _RAND_128[0:0];
  _RAND_129 = {1{`RANDOM}};
  atomic_9 = _RAND_129[0:0];
  _RAND_130 = {1{`RANDOM}};
  atomic_10 = _RAND_130[0:0];
  _RAND_131 = {1{`RANDOM}};
  atomic_11 = _RAND_131[0:0];
  _RAND_132 = {1{`RANDOM}};
  tosbuffer_0 = _RAND_132[0:0];
  _RAND_133 = {1{`RANDOM}};
  tosbuffer_1 = _RAND_133[0:0];
  _RAND_134 = {1{`RANDOM}};
  tosbuffer_2 = _RAND_134[0:0];
  _RAND_135 = {1{`RANDOM}};
  tosbuffer_3 = _RAND_135[0:0];
  _RAND_136 = {1{`RANDOM}};
  tosbuffer_4 = _RAND_136[0:0];
  _RAND_137 = {1{`RANDOM}};
  tosbuffer_5 = _RAND_137[0:0];
  _RAND_138 = {1{`RANDOM}};
  tosbuffer_6 = _RAND_138[0:0];
  _RAND_139 = {1{`RANDOM}};
  tosbuffer_7 = _RAND_139[0:0];
  _RAND_140 = {1{`RANDOM}};
  tosbuffer_8 = _RAND_140[0:0];
  _RAND_141 = {1{`RANDOM}};
  tosbuffer_9 = _RAND_141[0:0];
  _RAND_142 = {1{`RANDOM}};
  tosbuffer_10 = _RAND_142[0:0];
  _RAND_143 = {1{`RANDOM}};
  tosbuffer_11 = _RAND_143[0:0];
  _RAND_144 = {1{`RANDOM}};
  enqPtrExt_0_flag = _RAND_144[0:0];
  _RAND_145 = {1{`RANDOM}};
  enqPtrExt_0_value = _RAND_145[3:0];
  _RAND_146 = {1{`RANDOM}};
  rdataPtrExt_0_value = _RAND_146[3:0];
  _RAND_147 = {1{`RANDOM}};
  rdataPtrExt_1_value = _RAND_147[3:0];
  _RAND_148 = {1{`RANDOM}};
  deqPtrExt_0_flag = _RAND_148[0:0];
  _RAND_149 = {1{`RANDOM}};
  deqPtrExt_0_value = _RAND_149[3:0];
  _RAND_150 = {1{`RANDOM}};
  cmtPtrExt_0_flag = _RAND_150[0:0];
  _RAND_151 = {1{`RANDOM}};
  cmtPtrExt_0_value = _RAND_151[3:0];
  _RAND_152 = {1{`RANDOM}};
  cmtPtrExt_1_value = _RAND_152[3:0];
  _RAND_153 = {1{`RANDOM}};
  addrReadyPtrExt_flag = _RAND_153[0:0];
  _RAND_154 = {1{`RANDOM}};
  addrReadyPtrExt_value = _RAND_154[3:0];
  _RAND_155 = {1{`RANDOM}};
  dataReadyPtrExt_flag = _RAND_155[0:0];
  _RAND_156 = {1{`RANDOM}};
  dataReadyPtrExt_value = _RAND_156[3:0];
  _RAND_157 = {1{`RANDOM}};
  commitCount = _RAND_157[1:0];
  _RAND_158 = {1{`RANDOM}};
  deqPtrExtNext_REG = _RAND_158[0:0];
  _RAND_159 = {1{`RANDOM}};
  deqPtrExtNext_REG_1 = _RAND_159[0:0];
  _RAND_160 = {1{`RANDOM}};
  io_sqDeq_REG = _RAND_160[0:0];
  _RAND_161 = {1{`RANDOM}};
  io_sqDeq_REG_1 = _RAND_161[0:0];
  _RAND_162 = {1{`RANDOM}};
  io_sqDeq_REG_2 = _RAND_162[1:0];
  _RAND_163 = {1{`RANDOM}};
  storeAddrInFireReg = _RAND_163[0:0];
  _RAND_164 = {1{`RANDOM}};
  stWbIndexReg = _RAND_164[3:0];
  _RAND_165 = {1{`RANDOM}};
  storeAddrInFireReg_1 = _RAND_165[0:0];
  _RAND_166 = {1{`RANDOM}};
  stWbIndexReg_1 = _RAND_166[3:0];
  _RAND_167 = {1{`RANDOM}};
  REG_2 = _RAND_167[0:0];
  _RAND_168 = {1{`RANDOM}};
  REG_3 = _RAND_168[3:0];
  _RAND_169 = {1{`RANDOM}};
  REG_4 = _RAND_169[0:0];
  _RAND_170 = {1{`RANDOM}};
  REG_5 = _RAND_170[3:0];
  _RAND_171 = {1{`RANDOM}};
  robMatchVec__0 = _RAND_171[0:0];
  _RAND_172 = {1{`RANDOM}};
  robMatchVec__1 = _RAND_172[0:0];
  _RAND_173 = {1{`RANDOM}};
  robMatchVec__2 = _RAND_173[0:0];
  _RAND_174 = {1{`RANDOM}};
  robMatchVec__3 = _RAND_174[0:0];
  _RAND_175 = {1{`RANDOM}};
  robMatchVec__4 = _RAND_175[0:0];
  _RAND_176 = {1{`RANDOM}};
  robMatchVec__5 = _RAND_176[0:0];
  _RAND_177 = {1{`RANDOM}};
  robMatchVec__6 = _RAND_177[0:0];
  _RAND_178 = {1{`RANDOM}};
  robMatchVec__7 = _RAND_178[0:0];
  _RAND_179 = {1{`RANDOM}};
  robMatchVec__8 = _RAND_179[0:0];
  _RAND_180 = {1{`RANDOM}};
  robMatchVec__9 = _RAND_180[0:0];
  _RAND_181 = {1{`RANDOM}};
  robMatchVec__10 = _RAND_181[0:0];
  _RAND_182 = {1{`RANDOM}};
  robMatchVec__11 = _RAND_182[0:0];
  _RAND_183 = {1{`RANDOM}};
  vpmaskNotEqual_REG = _RAND_183[11:0];
  _RAND_184 = {1{`RANDOM}};
  vpmaskNotEqual_REG_1 = _RAND_184[11:0];
  _RAND_185 = {1{`RANDOM}};
  vpmaskNotEqual_REG_2 = _RAND_185[11:0];
  _RAND_186 = {1{`RANDOM}};
  vpmaskNotEqual_REG_3 = _RAND_186[11:0];
  _RAND_187 = {1{`RANDOM}};
  vaddrMatchFailed_REG = _RAND_187[0:0];
  _RAND_188 = {1{`RANDOM}};
  dataInvalidMaskReg = _RAND_188[11:0];
  _RAND_189 = {1{`RANDOM}};
  io_forward_0_dataInvalid_REG = _RAND_189[0:0];
  _RAND_190 = {1{`RANDOM}};
  s2_differentFlag = _RAND_190[0:0];
  _RAND_191 = {1{`RANDOM}};
  s2_enqPtrExt_flag = _RAND_191[0:0];
  _RAND_192 = {1{`RANDOM}};
  s2_deqPtrExt_flag = _RAND_192[0:0];
  _RAND_193 = {1{`RANDOM}};
  s2_deqPtrExt_value = _RAND_193[3:0];
  _RAND_194 = {1{`RANDOM}};
  io_forward_0_dataInvalidSqIdx_REG_flag = _RAND_194[0:0];
  _RAND_195 = {1{`RANDOM}};
  io_forward_0_dataInvalidSqIdx_REG_value = _RAND_195[3:0];
  _RAND_196 = {1{`RANDOM}};
  io_forward_0_addrInvalidSqIdx_REG_flag = _RAND_196[0:0];
  _RAND_197 = {1{`RANDOM}};
  io_forward_0_addrInvalidSqIdx_REG_value = _RAND_197[3:0];
  _RAND_198 = {1{`RANDOM}};
  io_forward_0_schedWait_REG = _RAND_198[11:0];
  _RAND_199 = {1{`RANDOM}};
  io_forward_0_schedWait_REG_1 = _RAND_199[11:0];
  _RAND_200 = {1{`RANDOM}};
  io_forward_0_schedWait_REG_2 = _RAND_200[11:0];
  _RAND_201 = {1{`RANDOM}};
  io_forward_0_schedWait_REG_3 = _RAND_201[11:0];
  _RAND_202 = {1{`RANDOM}};
  robMatchVec_1_0 = _RAND_202[0:0];
  _RAND_203 = {1{`RANDOM}};
  robMatchVec_1_1 = _RAND_203[0:0];
  _RAND_204 = {1{`RANDOM}};
  robMatchVec_1_2 = _RAND_204[0:0];
  _RAND_205 = {1{`RANDOM}};
  robMatchVec_1_3 = _RAND_205[0:0];
  _RAND_206 = {1{`RANDOM}};
  robMatchVec_1_4 = _RAND_206[0:0];
  _RAND_207 = {1{`RANDOM}};
  robMatchVec_1_5 = _RAND_207[0:0];
  _RAND_208 = {1{`RANDOM}};
  robMatchVec_1_6 = _RAND_208[0:0];
  _RAND_209 = {1{`RANDOM}};
  robMatchVec_1_7 = _RAND_209[0:0];
  _RAND_210 = {1{`RANDOM}};
  robMatchVec_1_8 = _RAND_210[0:0];
  _RAND_211 = {1{`RANDOM}};
  robMatchVec_1_9 = _RAND_211[0:0];
  _RAND_212 = {1{`RANDOM}};
  robMatchVec_1_10 = _RAND_212[0:0];
  _RAND_213 = {1{`RANDOM}};
  robMatchVec_1_11 = _RAND_213[0:0];
  _RAND_214 = {1{`RANDOM}};
  vpmaskNotEqual_REG_4 = _RAND_214[11:0];
  _RAND_215 = {1{`RANDOM}};
  vpmaskNotEqual_REG_5 = _RAND_215[11:0];
  _RAND_216 = {1{`RANDOM}};
  vpmaskNotEqual_REG_6 = _RAND_216[11:0];
  _RAND_217 = {1{`RANDOM}};
  vpmaskNotEqual_REG_7 = _RAND_217[11:0];
  _RAND_218 = {1{`RANDOM}};
  vaddrMatchFailed_REG_1 = _RAND_218[0:0];
  _RAND_219 = {1{`RANDOM}};
  dataInvalidMaskReg_1 = _RAND_219[11:0];
  _RAND_220 = {1{`RANDOM}};
  io_forward_1_dataInvalid_REG = _RAND_220[0:0];
  _RAND_221 = {1{`RANDOM}};
  s2_differentFlag_1 = _RAND_221[0:0];
  _RAND_222 = {1{`RANDOM}};
  s2_enqPtrExt_1_flag = _RAND_222[0:0];
  _RAND_223 = {1{`RANDOM}};
  s2_deqPtrExt_1_flag = _RAND_223[0:0];
  _RAND_224 = {1{`RANDOM}};
  s2_deqPtrExt_1_value = _RAND_224[3:0];
  _RAND_225 = {1{`RANDOM}};
  io_forward_1_dataInvalidSqIdx_REG_flag = _RAND_225[0:0];
  _RAND_226 = {1{`RANDOM}};
  io_forward_1_dataInvalidSqIdx_REG_value = _RAND_226[3:0];
  _RAND_227 = {1{`RANDOM}};
  io_forward_1_addrInvalidSqIdx_REG_flag = _RAND_227[0:0];
  _RAND_228 = {1{`RANDOM}};
  io_forward_1_addrInvalidSqIdx_REG_value = _RAND_228[3:0];
  _RAND_229 = {1{`RANDOM}};
  io_forward_1_schedWait_REG = _RAND_229[11:0];
  _RAND_230 = {1{`RANDOM}};
  io_forward_1_schedWait_REG_1 = _RAND_230[11:0];
  _RAND_231 = {1{`RANDOM}};
  io_forward_1_schedWait_REG_2 = _RAND_231[11:0];
  _RAND_232 = {1{`RANDOM}};
  io_forward_1_schedWait_REG_3 = _RAND_232[11:0];
  _RAND_233 = {1{`RANDOM}};
  uncacheState = _RAND_233[2:0];
  _RAND_234 = {1{`RANDOM}};
  REG_12 = _RAND_234[0:0];
  _RAND_235 = {1{`RANDOM}};
  REG_13 = _RAND_235[0:0];
  _RAND_236 = {1{`RANDOM}};
  io_uncache_req_bits_atomic_REG_value = _RAND_236[3:0];
  _RAND_237 = {1{`RANDOM}};
  REG_14 = _RAND_237[0:0];
  _RAND_238 = {1{`RANDOM}};
  r = _RAND_238[3:0];
  _RAND_239 = {1{`RANDOM}};
  r_1 = _RAND_239[3:0];
  _RAND_240 = {1{`RANDOM}};
  REG_15 = _RAND_240[0:0];
  _RAND_241 = {1{`RANDOM}};
  r_2 = _RAND_241[3:0];
  _RAND_242 = {1{`RANDOM}};
  r_3 = _RAND_242[3:0];
  _RAND_243 = {1{`RANDOM}};
  lastEnqCancel_REG_0 = _RAND_243[0:0];
  _RAND_244 = {1{`RANDOM}};
  lastEnqCancel_REG_1 = _RAND_244[0:0];
  _RAND_245 = {1{`RANDOM}};
  lastEnqCancel_REG_2 = _RAND_245[0:0];
  _RAND_246 = {1{`RANDOM}};
  lastEnqCancel_REG_3 = _RAND_246[0:0];
  _RAND_247 = {1{`RANDOM}};
  lastCycleRedirect = _RAND_247[0:0];
  _RAND_248 = {1{`RANDOM}};
  lastCycleCancelCount_REG_0 = _RAND_248[0:0];
  _RAND_249 = {1{`RANDOM}};
  lastCycleCancelCount_REG_1 = _RAND_249[0:0];
  _RAND_250 = {1{`RANDOM}};
  lastCycleCancelCount_REG_2 = _RAND_250[0:0];
  _RAND_251 = {1{`RANDOM}};
  lastCycleCancelCount_REG_3 = _RAND_251[0:0];
  _RAND_252 = {1{`RANDOM}};
  lastCycleCancelCount_REG_4 = _RAND_252[0:0];
  _RAND_253 = {1{`RANDOM}};
  lastCycleCancelCount_REG_5 = _RAND_253[0:0];
  _RAND_254 = {1{`RANDOM}};
  lastCycleCancelCount_REG_6 = _RAND_254[0:0];
  _RAND_255 = {1{`RANDOM}};
  lastCycleCancelCount_REG_7 = _RAND_255[0:0];
  _RAND_256 = {1{`RANDOM}};
  lastCycleCancelCount_REG_8 = _RAND_256[0:0];
  _RAND_257 = {1{`RANDOM}};
  lastCycleCancelCount_REG_9 = _RAND_257[0:0];
  _RAND_258 = {1{`RANDOM}};
  lastCycleCancelCount_REG_10 = _RAND_258[0:0];
  _RAND_259 = {1{`RANDOM}};
  lastCycleCancelCount_REG_11 = _RAND_259[0:0];
  _RAND_260 = {1{`RANDOM}};
  io_sqCancelCnt_REG = _RAND_260[3:0];
  _RAND_261 = {1{`RANDOM}};
  io_sqEmpty_REG = _RAND_261[0:0];
  _RAND_262 = {1{`RANDOM}};
  io_perf_0_value_REG = _RAND_262[0:0];
  _RAND_263 = {1{`RANDOM}};
  io_perf_0_value_REG_1 = _RAND_263[0:0];
  _RAND_264 = {1{`RANDOM}};
  io_perf_1_value_REG = _RAND_264[0:0];
  _RAND_265 = {1{`RANDOM}};
  io_perf_1_value_REG_1 = _RAND_265[0:0];
  _RAND_266 = {1{`RANDOM}};
  io_perf_2_value_REG = _RAND_266[0:0];
  _RAND_267 = {1{`RANDOM}};
  io_perf_2_value_REG_1 = _RAND_267[0:0];
  _RAND_268 = {1{`RANDOM}};
  io_perf_3_value_REG = _RAND_268[0:0];
  _RAND_269 = {1{`RANDOM}};
  io_perf_3_value_REG_1 = _RAND_269[0:0];
  _RAND_270 = {1{`RANDOM}};
  io_perf_4_value_REG = _RAND_270[0:0];
  _RAND_271 = {1{`RANDOM}};
  io_perf_4_value_REG_1 = _RAND_271[0:0];
  _RAND_272 = {1{`RANDOM}};
  io_perf_5_value_REG = _RAND_272[0:0];
  _RAND_273 = {1{`RANDOM}};
  io_perf_5_value_REG_1 = _RAND_273[0:0];
  _RAND_274 = {1{`RANDOM}};
  io_perf_6_value_REG = _RAND_274[0:0];
  _RAND_275 = {1{`RANDOM}};
  io_perf_6_value_REG_1 = _RAND_275[0:0];
  _RAND_276 = {1{`RANDOM}};
  io_perf_7_value_REG = _RAND_276[0:0];
  _RAND_277 = {1{`RANDOM}};
  io_perf_7_value_REG_1 = _RAND_277[0:0];
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
    addrvalid_0 = 1'h0;
  end
  if (reset) begin
    addrvalid_1 = 1'h0;
  end
  if (reset) begin
    addrvalid_2 = 1'h0;
  end
  if (reset) begin
    addrvalid_3 = 1'h0;
  end
  if (reset) begin
    addrvalid_4 = 1'h0;
  end
  if (reset) begin
    addrvalid_5 = 1'h0;
  end
  if (reset) begin
    addrvalid_6 = 1'h0;
  end
  if (reset) begin
    addrvalid_7 = 1'h0;
  end
  if (reset) begin
    addrvalid_8 = 1'h0;
  end
  if (reset) begin
    addrvalid_9 = 1'h0;
  end
  if (reset) begin
    addrvalid_10 = 1'h0;
  end
  if (reset) begin
    addrvalid_11 = 1'h0;
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
    tosbuffer_0 = 1'h0;
  end
  if (reset) begin
    tosbuffer_1 = 1'h0;
  end
  if (reset) begin
    tosbuffer_2 = 1'h0;
  end
  if (reset) begin
    tosbuffer_3 = 1'h0;
  end
  if (reset) begin
    tosbuffer_4 = 1'h0;
  end
  if (reset) begin
    tosbuffer_5 = 1'h0;
  end
  if (reset) begin
    tosbuffer_6 = 1'h0;
  end
  if (reset) begin
    tosbuffer_7 = 1'h0;
  end
  if (reset) begin
    tosbuffer_8 = 1'h0;
  end
  if (reset) begin
    tosbuffer_9 = 1'h0;
  end
  if (reset) begin
    tosbuffer_10 = 1'h0;
  end
  if (reset) begin
    tosbuffer_11 = 1'h0;
  end
  if (reset) begin
    enqPtrExt_0_flag = 1'h0;
  end
  if (reset) begin
    enqPtrExt_0_value = 4'h0;
  end
  if (reset) begin
    rdataPtrExt_0_value = 4'h0;
  end
  if (reset) begin
    rdataPtrExt_1_value = 4'h1;
  end
  if (reset) begin
    deqPtrExt_0_flag = 1'h0;
  end
  if (reset) begin
    deqPtrExt_0_value = 4'h0;
  end
  if (reset) begin
    cmtPtrExt_0_flag = 1'h0;
  end
  if (reset) begin
    cmtPtrExt_0_value = 4'h0;
  end
  if (reset) begin
    cmtPtrExt_1_value = 4'h1;
  end
  if (reset) begin
    addrReadyPtrExt_flag = 1'h0;
  end
  if (reset) begin
    addrReadyPtrExt_value = 4'h0;
  end
  if (reset) begin
    dataReadyPtrExt_flag = 1'h0;
  end
  if (reset) begin
    dataReadyPtrExt_value = 4'h0;
  end
  if (reset) begin
    uncacheState = 3'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

