module LoadQueueReplay(
  input         clock,
  input         reset,
  input         io_redirect_valid,
  input         io_redirect_bits_robIdx_flag,
  input  [4:0]  io_redirect_bits_robIdx_value,
  input         io_redirect_bits_level,
  input         io_enq_0_valid,
  input  [9:0]  io_enq_0_bits_uop_cf_foldpc,
  input         io_enq_0_bits_uop_cf_exceptionVec_4,
  input         io_enq_0_bits_uop_cf_exceptionVec_5,
  input         io_enq_0_bits_uop_cf_exceptionVec_13,
  input         io_enq_0_bits_uop_cf_trigger_backendEn_1,
  input         io_enq_0_bits_uop_cf_trigger_backendHit_0,
  input         io_enq_0_bits_uop_cf_trigger_backendHit_1,
  input         io_enq_0_bits_uop_cf_trigger_backendHit_4,
  input         io_enq_0_bits_uop_cf_waitForRobIdx_flag,
  input  [4:0]  io_enq_0_bits_uop_cf_waitForRobIdx_value,
  input         io_enq_0_bits_uop_cf_loadWaitBit,
  input         io_enq_0_bits_uop_cf_loadWaitStrict,
  input         io_enq_0_bits_uop_cf_ftqPtr_flag,
  input  [2:0]  io_enq_0_bits_uop_cf_ftqPtr_value,
  input  [2:0]  io_enq_0_bits_uop_cf_ftqOffset,
  input  [3:0]  io_enq_0_bits_uop_ctrl_fuType,
  input  [6:0]  io_enq_0_bits_uop_ctrl_fuOpType,
  input         io_enq_0_bits_uop_ctrl_rfWen,
  input         io_enq_0_bits_uop_ctrl_fpWen,
  input  [5:0]  io_enq_0_bits_uop_pdest,
  input         io_enq_0_bits_uop_robIdx_flag,
  input  [4:0]  io_enq_0_bits_uop_robIdx_value,
  input         io_enq_0_bits_uop_lqIdx_flag,
  input  [3:0]  io_enq_0_bits_uop_lqIdx_value,
  input         io_enq_0_bits_uop_sqIdx_flag,
  input  [3:0]  io_enq_0_bits_uop_sqIdx_value,
  input  [38:0] io_enq_0_bits_vaddr,
  input         io_enq_0_bits_tlbMiss,
  input         io_enq_0_bits_rarAllocated,
  input  [3:0]  io_enq_0_bits_rarIndex,
  input         io_enq_0_bits_rawAllocated,
  input  [2:0]  io_enq_0_bits_rawIndex,
  input  [1:0]  io_enq_0_bits_replayInfo_missMSHRId,
  input         io_enq_0_bits_replayInfo_canForwardFullData,
  input         io_enq_0_bits_replayInfo_dataInvalidSqIdx_flag,
  input  [3:0]  io_enq_0_bits_replayInfo_dataInvalidSqIdx_value,
  input         io_enq_0_bits_replayInfo_addrInvalidSqIdx_flag,
  input  [3:0]  io_enq_0_bits_replayInfo_addrInvalidSqIdx_value,
  input  [7:0]  io_enq_0_bits_replayInfo_replayCarry_real_way_en,
  input         io_enq_0_bits_replayInfo_replayCarry_valid,
  input         io_enq_0_bits_replayInfo_dataInLastBeat,
  input         io_enq_0_bits_replayInfo_cause_0,
  input         io_enq_0_bits_replayInfo_cause_1,
  input         io_enq_0_bits_replayInfo_cause_2,
  input         io_enq_0_bits_replayInfo_cause_3,
  input         io_enq_0_bits_replayInfo_cause_4,
  input         io_enq_0_bits_replayInfo_cause_5,
  input         io_enq_0_bits_replayInfo_cause_6,
  input         io_enq_0_bits_replayInfo_cause_7,
  input         io_enq_1_valid,
  input  [9:0]  io_enq_1_bits_uop_cf_foldpc,
  input         io_enq_1_bits_uop_cf_exceptionVec_4,
  input         io_enq_1_bits_uop_cf_exceptionVec_5,
  input         io_enq_1_bits_uop_cf_exceptionVec_13,
  input         io_enq_1_bits_uop_cf_trigger_backendEn_1,
  input         io_enq_1_bits_uop_cf_trigger_backendHit_0,
  input         io_enq_1_bits_uop_cf_trigger_backendHit_1,
  input         io_enq_1_bits_uop_cf_trigger_backendHit_4,
  input         io_enq_1_bits_uop_cf_waitForRobIdx_flag,
  input  [4:0]  io_enq_1_bits_uop_cf_waitForRobIdx_value,
  input         io_enq_1_bits_uop_cf_loadWaitBit,
  input         io_enq_1_bits_uop_cf_loadWaitStrict,
  input         io_enq_1_bits_uop_cf_ftqPtr_flag,
  input  [2:0]  io_enq_1_bits_uop_cf_ftqPtr_value,
  input  [2:0]  io_enq_1_bits_uop_cf_ftqOffset,
  input  [3:0]  io_enq_1_bits_uop_ctrl_fuType,
  input  [6:0]  io_enq_1_bits_uop_ctrl_fuOpType,
  input         io_enq_1_bits_uop_ctrl_rfWen,
  input         io_enq_1_bits_uop_ctrl_fpWen,
  input  [5:0]  io_enq_1_bits_uop_pdest,
  input         io_enq_1_bits_uop_robIdx_flag,
  input  [4:0]  io_enq_1_bits_uop_robIdx_value,
  input         io_enq_1_bits_uop_lqIdx_flag,
  input  [3:0]  io_enq_1_bits_uop_lqIdx_value,
  input         io_enq_1_bits_uop_sqIdx_flag,
  input  [3:0]  io_enq_1_bits_uop_sqIdx_value,
  input  [38:0] io_enq_1_bits_vaddr,
  input         io_enq_1_bits_tlbMiss,
  input         io_enq_1_bits_rarAllocated,
  input  [3:0]  io_enq_1_bits_rarIndex,
  input         io_enq_1_bits_rawAllocated,
  input  [2:0]  io_enq_1_bits_rawIndex,
  input  [1:0]  io_enq_1_bits_replayInfo_missMSHRId,
  input         io_enq_1_bits_replayInfo_canForwardFullData,
  input         io_enq_1_bits_replayInfo_dataInvalidSqIdx_flag,
  input  [3:0]  io_enq_1_bits_replayInfo_dataInvalidSqIdx_value,
  input         io_enq_1_bits_replayInfo_addrInvalidSqIdx_flag,
  input  [3:0]  io_enq_1_bits_replayInfo_addrInvalidSqIdx_value,
  input  [7:0]  io_enq_1_bits_replayInfo_replayCarry_real_way_en,
  input         io_enq_1_bits_replayInfo_replayCarry_valid,
  input         io_enq_1_bits_replayInfo_dataInLastBeat,
  input         io_enq_1_bits_replayInfo_cause_0,
  input         io_enq_1_bits_replayInfo_cause_1,
  input         io_enq_1_bits_replayInfo_cause_2,
  input         io_enq_1_bits_replayInfo_cause_3,
  input         io_enq_1_bits_replayInfo_cause_4,
  input         io_enq_1_bits_replayInfo_cause_5,
  input         io_enq_1_bits_replayInfo_cause_6,
  input         io_enq_1_bits_replayInfo_cause_7,
  input         io_storeAddrIn_0_valid,
  input         io_storeAddrIn_0_bits_uop_sqIdx_flag,
  input  [3:0]  io_storeAddrIn_0_bits_uop_sqIdx_value,
  input         io_storeAddrIn_0_bits_miss,
  input         io_storeAddrIn_1_valid,
  input         io_storeAddrIn_1_bits_uop_sqIdx_flag,
  input  [3:0]  io_storeAddrIn_1_bits_uop_sqIdx_value,
  input         io_storeAddrIn_1_bits_miss,
  input         io_storeDataIn_0_valid,
  input         io_storeDataIn_0_bits_uop_sqIdx_flag,
  input  [3:0]  io_storeDataIn_0_bits_uop_sqIdx_value,
  input         io_storeDataIn_1_valid,
  input         io_storeDataIn_1_bits_uop_sqIdx_flag,
  input  [3:0]  io_storeDataIn_1_bits_uop_sqIdx_value,
  input         io_replay_0_ready,
  output        io_replay_0_valid,
  output [9:0]  io_replay_0_bits_uop_cf_foldpc,
  output        io_replay_0_bits_uop_cf_trigger_backendEn_1,
  output        io_replay_0_bits_uop_cf_trigger_backendHit_0,
  output        io_replay_0_bits_uop_cf_trigger_backendHit_1,
  output        io_replay_0_bits_uop_cf_trigger_backendHit_4,
  output        io_replay_0_bits_uop_cf_waitForRobIdx_flag,
  output [4:0]  io_replay_0_bits_uop_cf_waitForRobIdx_value,
  output        io_replay_0_bits_uop_cf_loadWaitBit,
  output        io_replay_0_bits_uop_cf_loadWaitStrict,
  output        io_replay_0_bits_uop_cf_ftqPtr_flag,
  output [2:0]  io_replay_0_bits_uop_cf_ftqPtr_value,
  output [2:0]  io_replay_0_bits_uop_cf_ftqOffset,
  output [3:0]  io_replay_0_bits_uop_ctrl_fuType,
  output [6:0]  io_replay_0_bits_uop_ctrl_fuOpType,
  output        io_replay_0_bits_uop_ctrl_rfWen,
  output        io_replay_0_bits_uop_ctrl_fpWen,
  output [5:0]  io_replay_0_bits_uop_pdest,
  output        io_replay_0_bits_uop_robIdx_flag,
  output [4:0]  io_replay_0_bits_uop_robIdx_value,
  output        io_replay_0_bits_uop_lqIdx_flag,
  output [3:0]  io_replay_0_bits_uop_lqIdx_value,
  output        io_replay_0_bits_uop_sqIdx_flag,
  output [3:0]  io_replay_0_bits_uop_sqIdx_value,
  output [38:0] io_replay_0_bits_vaddr,
  output        io_replay_0_bits_isFirstIssue,
  output [7:0]  io_replay_0_bits_replayCarry_real_way_en,
  output        io_replay_0_bits_replayCarry_valid,
  output [1:0]  io_replay_0_bits_mshrid,
  output        io_replay_0_bits_forward_tlDchannel,
  output        io_replay_0_bits_rarAllocated,
  output [3:0]  io_replay_0_bits_rarIndex,
  output        io_replay_0_bits_rawAllocated,
  output [2:0]  io_replay_0_bits_rawIndex,
  input         io_replay_1_ready,
  output        io_replay_1_valid,
  output [9:0]  io_replay_1_bits_uop_cf_foldpc,
  output        io_replay_1_bits_uop_cf_trigger_backendEn_1,
  output        io_replay_1_bits_uop_cf_trigger_backendHit_0,
  output        io_replay_1_bits_uop_cf_trigger_backendHit_1,
  output        io_replay_1_bits_uop_cf_trigger_backendHit_4,
  output        io_replay_1_bits_uop_cf_waitForRobIdx_flag,
  output [4:0]  io_replay_1_bits_uop_cf_waitForRobIdx_value,
  output        io_replay_1_bits_uop_cf_loadWaitBit,
  output        io_replay_1_bits_uop_cf_loadWaitStrict,
  output        io_replay_1_bits_uop_cf_ftqPtr_flag,
  output [2:0]  io_replay_1_bits_uop_cf_ftqPtr_value,
  output [2:0]  io_replay_1_bits_uop_cf_ftqOffset,
  output [3:0]  io_replay_1_bits_uop_ctrl_fuType,
  output [6:0]  io_replay_1_bits_uop_ctrl_fuOpType,
  output        io_replay_1_bits_uop_ctrl_rfWen,
  output        io_replay_1_bits_uop_ctrl_fpWen,
  output [5:0]  io_replay_1_bits_uop_pdest,
  output        io_replay_1_bits_uop_robIdx_flag,
  output [4:0]  io_replay_1_bits_uop_robIdx_value,
  output        io_replay_1_bits_uop_lqIdx_flag,
  output [3:0]  io_replay_1_bits_uop_lqIdx_value,
  output        io_replay_1_bits_uop_sqIdx_flag,
  output [3:0]  io_replay_1_bits_uop_sqIdx_value,
  output [38:0] io_replay_1_bits_vaddr,
  output        io_replay_1_bits_isFirstIssue,
  output [7:0]  io_replay_1_bits_replayCarry_real_way_en,
  output        io_replay_1_bits_replayCarry_valid,
  output [1:0]  io_replay_1_bits_mshrid,
  output        io_replay_1_bits_forward_tlDchannel,
  output        io_replay_1_bits_rarAllocated,
  output [3:0]  io_replay_1_bits_rarIndex,
  output        io_replay_1_bits_rawAllocated,
  output [2:0]  io_replay_1_bits_rawIndex,
  input         io_refill_valid,
  input  [1:0]  io_refill_bits_id,
  input         io_stAddrReadySqPtr_flag,
  input  [3:0]  io_stAddrReadySqPtr_value,
  input         io_stDataReadySqPtr_flag,
  input  [3:0]  io_stDataReadySqPtr_value,
  input         io_sqEmpty,
  output        io_lqFull,
  input  [5:0]  io_tlbReplayDelayCycleCtrl_0,
  input  [5:0]  io_tlbReplayDelayCycleCtrl_1,
  input  [5:0]  io_tlbReplayDelayCycleCtrl_2,
  input  [5:0]  io_tlbReplayDelayCycleCtrl_3,
  output [5:0]  io_perf_0_value,
  output [5:0]  io_perf_1_value,
  output [5:0]  io_perf_2_value,
  output [5:0]  io_perf_3_value,
  output [5:0]  io_perf_4_value,
  output [5:0]  io_perf_5_value,
  output [5:0]  io_perf_6_value,
  output [5:0]  io_perf_7_value,
  output [5:0]  io_perf_8_value,
  output [5:0]  io_perf_9_value,
  output [5:0]  io_perf_10_value,
  output [5:0]  io_perf_11_value
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
  reg [31:0] _RAND_278;
  reg [31:0] _RAND_279;
  reg [31:0] _RAND_280;
  reg [31:0] _RAND_281;
  reg [31:0] _RAND_282;
  reg [31:0] _RAND_283;
  reg [31:0] _RAND_284;
  reg [31:0] _RAND_285;
  reg [31:0] _RAND_286;
  reg [31:0] _RAND_287;
  reg [31:0] _RAND_288;
  reg [31:0] _RAND_289;
  reg [31:0] _RAND_290;
  reg [31:0] _RAND_291;
  reg [31:0] _RAND_292;
  reg [31:0] _RAND_293;
  reg [31:0] _RAND_294;
  reg [31:0] _RAND_295;
  reg [31:0] _RAND_296;
  reg [31:0] _RAND_297;
  reg [31:0] _RAND_298;
  reg [31:0] _RAND_299;
  reg [31:0] _RAND_300;
  reg [31:0] _RAND_301;
  reg [31:0] _RAND_302;
  reg [31:0] _RAND_303;
  reg [31:0] _RAND_304;
  reg [31:0] _RAND_305;
  reg [31:0] _RAND_306;
  reg [31:0] _RAND_307;
  reg [31:0] _RAND_308;
  reg [31:0] _RAND_309;
  reg [31:0] _RAND_310;
  reg [31:0] _RAND_311;
  reg [31:0] _RAND_312;
  reg [31:0] _RAND_313;
  reg [31:0] _RAND_314;
  reg [31:0] _RAND_315;
  reg [31:0] _RAND_316;
  reg [31:0] _RAND_317;
  reg [31:0] _RAND_318;
  reg [31:0] _RAND_319;
  reg [31:0] _RAND_320;
  reg [31:0] _RAND_321;
  reg [31:0] _RAND_322;
  reg [31:0] _RAND_323;
  reg [31:0] _RAND_324;
  reg [31:0] _RAND_325;
  reg [31:0] _RAND_326;
  reg [31:0] _RAND_327;
  reg [31:0] _RAND_328;
  reg [31:0] _RAND_329;
  reg [31:0] _RAND_330;
  reg [31:0] _RAND_331;
  reg [31:0] _RAND_332;
  reg [31:0] _RAND_333;
  reg [31:0] _RAND_334;
  reg [31:0] _RAND_335;
  reg [31:0] _RAND_336;
  reg [31:0] _RAND_337;
  reg [31:0] _RAND_338;
  reg [31:0] _RAND_339;
  reg [31:0] _RAND_340;
  reg [31:0] _RAND_341;
  reg [31:0] _RAND_342;
  reg [31:0] _RAND_343;
  reg [31:0] _RAND_344;
  reg [31:0] _RAND_345;
  reg [31:0] _RAND_346;
  reg [31:0] _RAND_347;
  reg [31:0] _RAND_348;
  reg [31:0] _RAND_349;
  reg [31:0] _RAND_350;
  reg [31:0] _RAND_351;
  reg [31:0] _RAND_352;
  reg [31:0] _RAND_353;
  reg [31:0] _RAND_354;
  reg [31:0] _RAND_355;
  reg [31:0] _RAND_356;
  reg [31:0] _RAND_357;
  reg [31:0] _RAND_358;
  reg [31:0] _RAND_359;
  reg [31:0] _RAND_360;
  reg [31:0] _RAND_361;
  reg [31:0] _RAND_362;
  reg [31:0] _RAND_363;
  reg [31:0] _RAND_364;
  reg [31:0] _RAND_365;
  reg [31:0] _RAND_366;
  reg [31:0] _RAND_367;
  reg [31:0] _RAND_368;
  reg [31:0] _RAND_369;
  reg [31:0] _RAND_370;
  reg [31:0] _RAND_371;
  reg [31:0] _RAND_372;
  reg [31:0] _RAND_373;
  reg [31:0] _RAND_374;
  reg [31:0] _RAND_375;
  reg [31:0] _RAND_376;
  reg [31:0] _RAND_377;
  reg [31:0] _RAND_378;
  reg [31:0] _RAND_379;
  reg [31:0] _RAND_380;
  reg [31:0] _RAND_381;
  reg [31:0] _RAND_382;
  reg [31:0] _RAND_383;
  reg [31:0] _RAND_384;
  reg [31:0] _RAND_385;
  reg [31:0] _RAND_386;
  reg [31:0] _RAND_387;
  reg [31:0] _RAND_388;
  reg [31:0] _RAND_389;
  reg [31:0] _RAND_390;
  reg [31:0] _RAND_391;
  reg [31:0] _RAND_392;
  reg [31:0] _RAND_393;
  reg [31:0] _RAND_394;
  reg [31:0] _RAND_395;
  reg [31:0] _RAND_396;
  reg [31:0] _RAND_397;
  reg [31:0] _RAND_398;
  reg [31:0] _RAND_399;
  reg [31:0] _RAND_400;
  reg [31:0] _RAND_401;
  reg [31:0] _RAND_402;
  reg [31:0] _RAND_403;
  reg [31:0] _RAND_404;
  reg [31:0] _RAND_405;
  reg [31:0] _RAND_406;
  reg [31:0] _RAND_407;
  reg [31:0] _RAND_408;
  reg [31:0] _RAND_409;
  reg [31:0] _RAND_410;
  reg [31:0] _RAND_411;
  reg [31:0] _RAND_412;
  reg [31:0] _RAND_413;
  reg [31:0] _RAND_414;
  reg [31:0] _RAND_415;
  reg [31:0] _RAND_416;
  reg [31:0] _RAND_417;
  reg [31:0] _RAND_418;
  reg [31:0] _RAND_419;
  reg [31:0] _RAND_420;
  reg [31:0] _RAND_421;
  reg [31:0] _RAND_422;
  reg [31:0] _RAND_423;
  reg [31:0] _RAND_424;
  reg [31:0] _RAND_425;
  reg [31:0] _RAND_426;
  reg [31:0] _RAND_427;
  reg [31:0] _RAND_428;
  reg [31:0] _RAND_429;
  reg [31:0] _RAND_430;
  reg [31:0] _RAND_431;
  reg [31:0] _RAND_432;
  reg [31:0] _RAND_433;
  reg [31:0] _RAND_434;
  reg [31:0] _RAND_435;
  reg [31:0] _RAND_436;
  reg [31:0] _RAND_437;
  reg [31:0] _RAND_438;
  reg [31:0] _RAND_439;
  reg [31:0] _RAND_440;
  reg [31:0] _RAND_441;
  reg [31:0] _RAND_442;
  reg [31:0] _RAND_443;
  reg [31:0] _RAND_444;
  reg [31:0] _RAND_445;
  reg [31:0] _RAND_446;
  reg [31:0] _RAND_447;
  reg [31:0] _RAND_448;
  reg [31:0] _RAND_449;
  reg [31:0] _RAND_450;
  reg [31:0] _RAND_451;
  reg [31:0] _RAND_452;
  reg [31:0] _RAND_453;
  reg [31:0] _RAND_454;
  reg [31:0] _RAND_455;
  reg [31:0] _RAND_456;
  reg [31:0] _RAND_457;
  reg [31:0] _RAND_458;
  reg [31:0] _RAND_459;
  reg [31:0] _RAND_460;
  reg [31:0] _RAND_461;
  reg [31:0] _RAND_462;
  reg [31:0] _RAND_463;
  reg [31:0] _RAND_464;
  reg [31:0] _RAND_465;
  reg [31:0] _RAND_466;
  reg [31:0] _RAND_467;
  reg [31:0] _RAND_468;
  reg [31:0] _RAND_469;
  reg [31:0] _RAND_470;
  reg [31:0] _RAND_471;
  reg [31:0] _RAND_472;
  reg [31:0] _RAND_473;
  reg [31:0] _RAND_474;
  reg [31:0] _RAND_475;
  reg [31:0] _RAND_476;
  reg [31:0] _RAND_477;
  reg [31:0] _RAND_478;
  reg [31:0] _RAND_479;
  reg [31:0] _RAND_480;
  reg [31:0] _RAND_481;
  reg [31:0] _RAND_482;
  reg [31:0] _RAND_483;
  reg [31:0] _RAND_484;
  reg [31:0] _RAND_485;
  reg [31:0] _RAND_486;
  reg [31:0] _RAND_487;
  reg [31:0] _RAND_488;
  reg [31:0] _RAND_489;
  reg [31:0] _RAND_490;
  reg [31:0] _RAND_491;
  reg [31:0] _RAND_492;
  reg [31:0] _RAND_493;
  reg [31:0] _RAND_494;
  reg [31:0] _RAND_495;
  reg [31:0] _RAND_496;
  reg [31:0] _RAND_497;
  reg [31:0] _RAND_498;
  reg [31:0] _RAND_499;
  reg [31:0] _RAND_500;
  reg [31:0] _RAND_501;
  reg [31:0] _RAND_502;
  reg [31:0] _RAND_503;
  reg [31:0] _RAND_504;
  reg [31:0] _RAND_505;
  reg [31:0] _RAND_506;
  reg [31:0] _RAND_507;
  reg [31:0] _RAND_508;
  reg [31:0] _RAND_509;
  reg [31:0] _RAND_510;
  reg [31:0] _RAND_511;
  reg [31:0] _RAND_512;
  reg [31:0] _RAND_513;
  reg [31:0] _RAND_514;
  reg [31:0] _RAND_515;
  reg [31:0] _RAND_516;
  reg [31:0] _RAND_517;
  reg [31:0] _RAND_518;
  reg [31:0] _RAND_519;
  reg [31:0] _RAND_520;
  reg [31:0] _RAND_521;
  reg [31:0] _RAND_522;
  reg [31:0] _RAND_523;
  reg [31:0] _RAND_524;
  reg [31:0] _RAND_525;
  reg [31:0] _RAND_526;
  reg [31:0] _RAND_527;
  reg [31:0] _RAND_528;
  reg [31:0] _RAND_529;
  reg [31:0] _RAND_530;
  reg [31:0] _RAND_531;
  reg [31:0] _RAND_532;
  reg [31:0] _RAND_533;
  reg [31:0] _RAND_534;
  reg [31:0] _RAND_535;
  reg [31:0] _RAND_536;
  reg [31:0] _RAND_537;
  reg [31:0] _RAND_538;
  reg [31:0] _RAND_539;
  reg [31:0] _RAND_540;
  reg [31:0] _RAND_541;
  reg [31:0] _RAND_542;
  reg [31:0] _RAND_543;
  reg [31:0] _RAND_544;
  reg [31:0] _RAND_545;
  reg [31:0] _RAND_546;
  reg [31:0] _RAND_547;
  reg [31:0] _RAND_548;
  reg [31:0] _RAND_549;
  reg [31:0] _RAND_550;
  reg [31:0] _RAND_551;
  reg [31:0] _RAND_552;
  reg [31:0] _RAND_553;
  reg [31:0] _RAND_554;
  reg [31:0] _RAND_555;
  reg [31:0] _RAND_556;
  reg [31:0] _RAND_557;
  reg [31:0] _RAND_558;
  reg [31:0] _RAND_559;
  reg [31:0] _RAND_560;
  reg [31:0] _RAND_561;
  reg [31:0] _RAND_562;
  reg [31:0] _RAND_563;
  reg [31:0] _RAND_564;
  reg [31:0] _RAND_565;
  reg [31:0] _RAND_566;
  reg [31:0] _RAND_567;
  reg [31:0] _RAND_568;
  reg [31:0] _RAND_569;
  reg [31:0] _RAND_570;
  reg [31:0] _RAND_571;
  reg [31:0] _RAND_572;
  reg [31:0] _RAND_573;
  reg [31:0] _RAND_574;
  reg [31:0] _RAND_575;
  reg [31:0] _RAND_576;
  reg [31:0] _RAND_577;
  reg [31:0] _RAND_578;
  reg [31:0] _RAND_579;
  reg [31:0] _RAND_580;
  reg [31:0] _RAND_581;
  reg [31:0] _RAND_582;
  reg [31:0] _RAND_583;
  reg [31:0] _RAND_584;
  reg [31:0] _RAND_585;
  reg [31:0] _RAND_586;
  reg [31:0] _RAND_587;
  reg [31:0] _RAND_588;
  reg [31:0] _RAND_589;
  reg [31:0] _RAND_590;
  reg [31:0] _RAND_591;
  reg [31:0] _RAND_592;
  reg [31:0] _RAND_593;
  reg [31:0] _RAND_594;
  reg [31:0] _RAND_595;
  reg [31:0] _RAND_596;
  reg [31:0] _RAND_597;
  reg [31:0] _RAND_598;
  reg [31:0] _RAND_599;
  reg [31:0] _RAND_600;
  reg [31:0] _RAND_601;
  reg [31:0] _RAND_602;
  reg [31:0] _RAND_603;
  reg [31:0] _RAND_604;
  reg [31:0] _RAND_605;
  reg [31:0] _RAND_606;
  reg [31:0] _RAND_607;
  reg [31:0] _RAND_608;
  reg [31:0] _RAND_609;
  reg [31:0] _RAND_610;
  reg [31:0] _RAND_611;
  reg [31:0] _RAND_612;
  reg [31:0] _RAND_613;
  reg [31:0] _RAND_614;
  reg [31:0] _RAND_615;
  reg [31:0] _RAND_616;
  reg [31:0] _RAND_617;
  reg [31:0] _RAND_618;
  reg [31:0] _RAND_619;
  reg [31:0] _RAND_620;
  reg [31:0] _RAND_621;
  reg [31:0] _RAND_622;
  reg [31:0] _RAND_623;
  reg [31:0] _RAND_624;
  reg [31:0] _RAND_625;
  reg [31:0] _RAND_626;
  reg [31:0] _RAND_627;
  reg [31:0] _RAND_628;
  reg [31:0] _RAND_629;
  reg [31:0] _RAND_630;
  reg [31:0] _RAND_631;
  reg [31:0] _RAND_632;
  reg [31:0] _RAND_633;
  reg [31:0] _RAND_634;
  reg [31:0] _RAND_635;
  reg [31:0] _RAND_636;
  reg [31:0] _RAND_637;
  reg [31:0] _RAND_638;
  reg [31:0] _RAND_639;
  reg [31:0] _RAND_640;
  reg [31:0] _RAND_641;
  reg [31:0] _RAND_642;
  reg [31:0] _RAND_643;
  reg [31:0] _RAND_644;
  reg [31:0] _RAND_645;
  reg [31:0] _RAND_646;
  reg [31:0] _RAND_647;
  reg [31:0] _RAND_648;
  reg [31:0] _RAND_649;
  reg [31:0] _RAND_650;
  reg [31:0] _RAND_651;
  reg [31:0] _RAND_652;
  reg [31:0] _RAND_653;
  reg [31:0] _RAND_654;
  reg [31:0] _RAND_655;
  reg [31:0] _RAND_656;
  reg [31:0] _RAND_657;
  reg [31:0] _RAND_658;
  reg [31:0] _RAND_659;
  reg [31:0] _RAND_660;
  reg [31:0] _RAND_661;
  reg [31:0] _RAND_662;
  reg [31:0] _RAND_663;
  reg [31:0] _RAND_664;
  reg [31:0] _RAND_665;
  reg [31:0] _RAND_666;
  reg [31:0] _RAND_667;
  reg [31:0] _RAND_668;
  reg [31:0] _RAND_669;
  reg [31:0] _RAND_670;
  reg [31:0] _RAND_671;
  reg [31:0] _RAND_672;
  reg [31:0] _RAND_673;
  reg [31:0] _RAND_674;
  reg [31:0] _RAND_675;
  reg [31:0] _RAND_676;
  reg [31:0] _RAND_677;
  reg [31:0] _RAND_678;
  reg [31:0] _RAND_679;
  reg [31:0] _RAND_680;
  reg [31:0] _RAND_681;
  reg [31:0] _RAND_682;
  reg [31:0] _RAND_683;
  reg [31:0] _RAND_684;
  reg [31:0] _RAND_685;
  reg [31:0] _RAND_686;
  reg [31:0] _RAND_687;
  reg [31:0] _RAND_688;
  reg [31:0] _RAND_689;
  reg [31:0] _RAND_690;
  reg [31:0] _RAND_691;
  reg [31:0] _RAND_692;
  reg [31:0] _RAND_693;
  reg [31:0] _RAND_694;
  reg [31:0] _RAND_695;
  reg [31:0] _RAND_696;
  reg [31:0] _RAND_697;
  reg [31:0] _RAND_698;
  reg [31:0] _RAND_699;
  reg [31:0] _RAND_700;
  reg [31:0] _RAND_701;
  reg [31:0] _RAND_702;
  reg [31:0] _RAND_703;
  reg [31:0] _RAND_704;
  reg [31:0] _RAND_705;
  reg [31:0] _RAND_706;
  reg [31:0] _RAND_707;
  reg [31:0] _RAND_708;
  reg [31:0] _RAND_709;
  reg [31:0] _RAND_710;
  reg [31:0] _RAND_711;
  reg [31:0] _RAND_712;
  reg [31:0] _RAND_713;
  reg [31:0] _RAND_714;
  reg [31:0] _RAND_715;
  reg [31:0] _RAND_716;
  reg [31:0] _RAND_717;
  reg [31:0] _RAND_718;
  reg [31:0] _RAND_719;
  reg [31:0] _RAND_720;
  reg [31:0] _RAND_721;
  reg [31:0] _RAND_722;
  reg [31:0] _RAND_723;
  reg [31:0] _RAND_724;
  reg [31:0] _RAND_725;
  reg [31:0] _RAND_726;
  reg [31:0] _RAND_727;
  reg [31:0] _RAND_728;
  reg [31:0] _RAND_729;
  reg [31:0] _RAND_730;
  reg [31:0] _RAND_731;
  reg [31:0] _RAND_732;
  reg [31:0] _RAND_733;
  reg [31:0] _RAND_734;
  reg [31:0] _RAND_735;
  reg [31:0] _RAND_736;
  reg [31:0] _RAND_737;
  reg [31:0] _RAND_738;
  reg [31:0] _RAND_739;
  reg [31:0] _RAND_740;
  reg [31:0] _RAND_741;
  reg [31:0] _RAND_742;
  reg [31:0] _RAND_743;
  reg [31:0] _RAND_744;
  reg [31:0] _RAND_745;
  reg [31:0] _RAND_746;
  reg [31:0] _RAND_747;
`endif // RANDOMIZE_REG_INIT
  wire  vaddrModule_clock; // @[LoadQueueReplay.scala 113:27]
  wire [3:0] vaddrModule_io_raddr_0; // @[LoadQueueReplay.scala 113:27]
  wire [3:0] vaddrModule_io_raddr_1; // @[LoadQueueReplay.scala 113:27]
  wire [38:0] vaddrModule_io_rdata_0; // @[LoadQueueReplay.scala 113:27]
  wire [38:0] vaddrModule_io_rdata_1; // @[LoadQueueReplay.scala 113:27]
  wire  vaddrModule_io_wen_0; // @[LoadQueueReplay.scala 113:27]
  wire  vaddrModule_io_wen_1; // @[LoadQueueReplay.scala 113:27]
  wire [3:0] vaddrModule_io_waddr_0; // @[LoadQueueReplay.scala 113:27]
  wire [3:0] vaddrModule_io_waddr_1; // @[LoadQueueReplay.scala 113:27]
  wire [38:0] vaddrModule_io_wdata_0; // @[LoadQueueReplay.scala 113:27]
  wire [38:0] vaddrModule_io_wdata_1; // @[LoadQueueReplay.scala 113:27]
  reg  allocated_0; // @[LoadQueueReplay.scala 111:26]
  reg  allocated_1; // @[LoadQueueReplay.scala 111:26]
  reg  allocated_2; // @[LoadQueueReplay.scala 111:26]
  reg  allocated_3; // @[LoadQueueReplay.scala 111:26]
  reg  allocated_4; // @[LoadQueueReplay.scala 111:26]
  reg  allocated_5; // @[LoadQueueReplay.scala 111:26]
  reg  allocated_6; // @[LoadQueueReplay.scala 111:26]
  reg  allocated_7; // @[LoadQueueReplay.scala 111:26]
  reg  allocated_8; // @[LoadQueueReplay.scala 111:26]
  reg  allocated_9; // @[LoadQueueReplay.scala 111:26]
  reg  allocated_10; // @[LoadQueueReplay.scala 111:26]
  reg  allocated_11; // @[LoadQueueReplay.scala 111:26]
  reg  allocated_12; // @[LoadQueueReplay.scala 111:26]
  reg  allocated_13; // @[LoadQueueReplay.scala 111:26]
  reg  allocated_14; // @[LoadQueueReplay.scala 111:26]
  reg  allocated_15; // @[LoadQueueReplay.scala 111:26]
  reg [9:0] uop_0_cf_foldpc; // @[LoadQueueReplay.scala 112:16]
  reg  uop_0_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 112:16]
  reg  uop_0_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 112:16]
  reg  uop_0_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 112:16]
  reg  uop_0_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 112:16]
  reg  uop_0_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [4:0] uop_0_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg  uop_0_cf_loadWaitBit; // @[LoadQueueReplay.scala 112:16]
  reg  uop_0_cf_loadWaitStrict; // @[LoadQueueReplay.scala 112:16]
  reg  uop_0_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 112:16]
  reg [2:0] uop_0_cf_ftqPtr_value; // @[LoadQueueReplay.scala 112:16]
  reg [2:0] uop_0_cf_ftqOffset; // @[LoadQueueReplay.scala 112:16]
  reg [3:0] uop_0_ctrl_fuType; // @[LoadQueueReplay.scala 112:16]
  reg [6:0] uop_0_ctrl_fuOpType; // @[LoadQueueReplay.scala 112:16]
  reg  uop_0_ctrl_rfWen; // @[LoadQueueReplay.scala 112:16]
  reg  uop_0_ctrl_fpWen; // @[LoadQueueReplay.scala 112:16]
  reg [5:0] uop_0_pdest; // @[LoadQueueReplay.scala 112:16]
  reg  uop_0_robIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [4:0] uop_0_robIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg  uop_0_lqIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [3:0] uop_0_lqIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg  uop_0_sqIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [3:0] uop_0_sqIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg [9:0] uop_1_cf_foldpc; // @[LoadQueueReplay.scala 112:16]
  reg  uop_1_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 112:16]
  reg  uop_1_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 112:16]
  reg  uop_1_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 112:16]
  reg  uop_1_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 112:16]
  reg  uop_1_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [4:0] uop_1_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg  uop_1_cf_loadWaitBit; // @[LoadQueueReplay.scala 112:16]
  reg  uop_1_cf_loadWaitStrict; // @[LoadQueueReplay.scala 112:16]
  reg  uop_1_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 112:16]
  reg [2:0] uop_1_cf_ftqPtr_value; // @[LoadQueueReplay.scala 112:16]
  reg [2:0] uop_1_cf_ftqOffset; // @[LoadQueueReplay.scala 112:16]
  reg [3:0] uop_1_ctrl_fuType; // @[LoadQueueReplay.scala 112:16]
  reg [6:0] uop_1_ctrl_fuOpType; // @[LoadQueueReplay.scala 112:16]
  reg  uop_1_ctrl_rfWen; // @[LoadQueueReplay.scala 112:16]
  reg  uop_1_ctrl_fpWen; // @[LoadQueueReplay.scala 112:16]
  reg [5:0] uop_1_pdest; // @[LoadQueueReplay.scala 112:16]
  reg  uop_1_robIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [4:0] uop_1_robIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg  uop_1_lqIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [3:0] uop_1_lqIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg  uop_1_sqIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [3:0] uop_1_sqIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg [9:0] uop_2_cf_foldpc; // @[LoadQueueReplay.scala 112:16]
  reg  uop_2_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 112:16]
  reg  uop_2_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 112:16]
  reg  uop_2_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 112:16]
  reg  uop_2_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 112:16]
  reg  uop_2_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [4:0] uop_2_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg  uop_2_cf_loadWaitBit; // @[LoadQueueReplay.scala 112:16]
  reg  uop_2_cf_loadWaitStrict; // @[LoadQueueReplay.scala 112:16]
  reg  uop_2_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 112:16]
  reg [2:0] uop_2_cf_ftqPtr_value; // @[LoadQueueReplay.scala 112:16]
  reg [2:0] uop_2_cf_ftqOffset; // @[LoadQueueReplay.scala 112:16]
  reg [3:0] uop_2_ctrl_fuType; // @[LoadQueueReplay.scala 112:16]
  reg [6:0] uop_2_ctrl_fuOpType; // @[LoadQueueReplay.scala 112:16]
  reg  uop_2_ctrl_rfWen; // @[LoadQueueReplay.scala 112:16]
  reg  uop_2_ctrl_fpWen; // @[LoadQueueReplay.scala 112:16]
  reg [5:0] uop_2_pdest; // @[LoadQueueReplay.scala 112:16]
  reg  uop_2_robIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [4:0] uop_2_robIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg  uop_2_lqIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [3:0] uop_2_lqIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg  uop_2_sqIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [3:0] uop_2_sqIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg [9:0] uop_3_cf_foldpc; // @[LoadQueueReplay.scala 112:16]
  reg  uop_3_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 112:16]
  reg  uop_3_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 112:16]
  reg  uop_3_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 112:16]
  reg  uop_3_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 112:16]
  reg  uop_3_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [4:0] uop_3_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg  uop_3_cf_loadWaitBit; // @[LoadQueueReplay.scala 112:16]
  reg  uop_3_cf_loadWaitStrict; // @[LoadQueueReplay.scala 112:16]
  reg  uop_3_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 112:16]
  reg [2:0] uop_3_cf_ftqPtr_value; // @[LoadQueueReplay.scala 112:16]
  reg [2:0] uop_3_cf_ftqOffset; // @[LoadQueueReplay.scala 112:16]
  reg [3:0] uop_3_ctrl_fuType; // @[LoadQueueReplay.scala 112:16]
  reg [6:0] uop_3_ctrl_fuOpType; // @[LoadQueueReplay.scala 112:16]
  reg  uop_3_ctrl_rfWen; // @[LoadQueueReplay.scala 112:16]
  reg  uop_3_ctrl_fpWen; // @[LoadQueueReplay.scala 112:16]
  reg [5:0] uop_3_pdest; // @[LoadQueueReplay.scala 112:16]
  reg  uop_3_robIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [4:0] uop_3_robIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg  uop_3_lqIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [3:0] uop_3_lqIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg  uop_3_sqIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [3:0] uop_3_sqIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg [9:0] uop_4_cf_foldpc; // @[LoadQueueReplay.scala 112:16]
  reg  uop_4_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 112:16]
  reg  uop_4_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 112:16]
  reg  uop_4_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 112:16]
  reg  uop_4_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 112:16]
  reg  uop_4_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [4:0] uop_4_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg  uop_4_cf_loadWaitBit; // @[LoadQueueReplay.scala 112:16]
  reg  uop_4_cf_loadWaitStrict; // @[LoadQueueReplay.scala 112:16]
  reg  uop_4_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 112:16]
  reg [2:0] uop_4_cf_ftqPtr_value; // @[LoadQueueReplay.scala 112:16]
  reg [2:0] uop_4_cf_ftqOffset; // @[LoadQueueReplay.scala 112:16]
  reg [3:0] uop_4_ctrl_fuType; // @[LoadQueueReplay.scala 112:16]
  reg [6:0] uop_4_ctrl_fuOpType; // @[LoadQueueReplay.scala 112:16]
  reg  uop_4_ctrl_rfWen; // @[LoadQueueReplay.scala 112:16]
  reg  uop_4_ctrl_fpWen; // @[LoadQueueReplay.scala 112:16]
  reg [5:0] uop_4_pdest; // @[LoadQueueReplay.scala 112:16]
  reg  uop_4_robIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [4:0] uop_4_robIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg  uop_4_lqIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [3:0] uop_4_lqIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg  uop_4_sqIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [3:0] uop_4_sqIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg [9:0] uop_5_cf_foldpc; // @[LoadQueueReplay.scala 112:16]
  reg  uop_5_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 112:16]
  reg  uop_5_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 112:16]
  reg  uop_5_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 112:16]
  reg  uop_5_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 112:16]
  reg  uop_5_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [4:0] uop_5_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg  uop_5_cf_loadWaitBit; // @[LoadQueueReplay.scala 112:16]
  reg  uop_5_cf_loadWaitStrict; // @[LoadQueueReplay.scala 112:16]
  reg  uop_5_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 112:16]
  reg [2:0] uop_5_cf_ftqPtr_value; // @[LoadQueueReplay.scala 112:16]
  reg [2:0] uop_5_cf_ftqOffset; // @[LoadQueueReplay.scala 112:16]
  reg [3:0] uop_5_ctrl_fuType; // @[LoadQueueReplay.scala 112:16]
  reg [6:0] uop_5_ctrl_fuOpType; // @[LoadQueueReplay.scala 112:16]
  reg  uop_5_ctrl_rfWen; // @[LoadQueueReplay.scala 112:16]
  reg  uop_5_ctrl_fpWen; // @[LoadQueueReplay.scala 112:16]
  reg [5:0] uop_5_pdest; // @[LoadQueueReplay.scala 112:16]
  reg  uop_5_robIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [4:0] uop_5_robIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg  uop_5_lqIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [3:0] uop_5_lqIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg  uop_5_sqIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [3:0] uop_5_sqIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg [9:0] uop_6_cf_foldpc; // @[LoadQueueReplay.scala 112:16]
  reg  uop_6_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 112:16]
  reg  uop_6_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 112:16]
  reg  uop_6_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 112:16]
  reg  uop_6_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 112:16]
  reg  uop_6_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [4:0] uop_6_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg  uop_6_cf_loadWaitBit; // @[LoadQueueReplay.scala 112:16]
  reg  uop_6_cf_loadWaitStrict; // @[LoadQueueReplay.scala 112:16]
  reg  uop_6_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 112:16]
  reg [2:0] uop_6_cf_ftqPtr_value; // @[LoadQueueReplay.scala 112:16]
  reg [2:0] uop_6_cf_ftqOffset; // @[LoadQueueReplay.scala 112:16]
  reg [3:0] uop_6_ctrl_fuType; // @[LoadQueueReplay.scala 112:16]
  reg [6:0] uop_6_ctrl_fuOpType; // @[LoadQueueReplay.scala 112:16]
  reg  uop_6_ctrl_rfWen; // @[LoadQueueReplay.scala 112:16]
  reg  uop_6_ctrl_fpWen; // @[LoadQueueReplay.scala 112:16]
  reg [5:0] uop_6_pdest; // @[LoadQueueReplay.scala 112:16]
  reg  uop_6_robIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [4:0] uop_6_robIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg  uop_6_lqIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [3:0] uop_6_lqIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg  uop_6_sqIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [3:0] uop_6_sqIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg [9:0] uop_7_cf_foldpc; // @[LoadQueueReplay.scala 112:16]
  reg  uop_7_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 112:16]
  reg  uop_7_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 112:16]
  reg  uop_7_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 112:16]
  reg  uop_7_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 112:16]
  reg  uop_7_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [4:0] uop_7_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg  uop_7_cf_loadWaitBit; // @[LoadQueueReplay.scala 112:16]
  reg  uop_7_cf_loadWaitStrict; // @[LoadQueueReplay.scala 112:16]
  reg  uop_7_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 112:16]
  reg [2:0] uop_7_cf_ftqPtr_value; // @[LoadQueueReplay.scala 112:16]
  reg [2:0] uop_7_cf_ftqOffset; // @[LoadQueueReplay.scala 112:16]
  reg [3:0] uop_7_ctrl_fuType; // @[LoadQueueReplay.scala 112:16]
  reg [6:0] uop_7_ctrl_fuOpType; // @[LoadQueueReplay.scala 112:16]
  reg  uop_7_ctrl_rfWen; // @[LoadQueueReplay.scala 112:16]
  reg  uop_7_ctrl_fpWen; // @[LoadQueueReplay.scala 112:16]
  reg [5:0] uop_7_pdest; // @[LoadQueueReplay.scala 112:16]
  reg  uop_7_robIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [4:0] uop_7_robIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg  uop_7_lqIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [3:0] uop_7_lqIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg  uop_7_sqIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [3:0] uop_7_sqIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg [9:0] uop_8_cf_foldpc; // @[LoadQueueReplay.scala 112:16]
  reg  uop_8_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 112:16]
  reg  uop_8_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 112:16]
  reg  uop_8_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 112:16]
  reg  uop_8_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 112:16]
  reg  uop_8_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [4:0] uop_8_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg  uop_8_cf_loadWaitBit; // @[LoadQueueReplay.scala 112:16]
  reg  uop_8_cf_loadWaitStrict; // @[LoadQueueReplay.scala 112:16]
  reg  uop_8_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 112:16]
  reg [2:0] uop_8_cf_ftqPtr_value; // @[LoadQueueReplay.scala 112:16]
  reg [2:0] uop_8_cf_ftqOffset; // @[LoadQueueReplay.scala 112:16]
  reg [3:0] uop_8_ctrl_fuType; // @[LoadQueueReplay.scala 112:16]
  reg [6:0] uop_8_ctrl_fuOpType; // @[LoadQueueReplay.scala 112:16]
  reg  uop_8_ctrl_rfWen; // @[LoadQueueReplay.scala 112:16]
  reg  uop_8_ctrl_fpWen; // @[LoadQueueReplay.scala 112:16]
  reg [5:0] uop_8_pdest; // @[LoadQueueReplay.scala 112:16]
  reg  uop_8_robIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [4:0] uop_8_robIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg  uop_8_lqIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [3:0] uop_8_lqIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg  uop_8_sqIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [3:0] uop_8_sqIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg [9:0] uop_9_cf_foldpc; // @[LoadQueueReplay.scala 112:16]
  reg  uop_9_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 112:16]
  reg  uop_9_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 112:16]
  reg  uop_9_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 112:16]
  reg  uop_9_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 112:16]
  reg  uop_9_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [4:0] uop_9_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg  uop_9_cf_loadWaitBit; // @[LoadQueueReplay.scala 112:16]
  reg  uop_9_cf_loadWaitStrict; // @[LoadQueueReplay.scala 112:16]
  reg  uop_9_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 112:16]
  reg [2:0] uop_9_cf_ftqPtr_value; // @[LoadQueueReplay.scala 112:16]
  reg [2:0] uop_9_cf_ftqOffset; // @[LoadQueueReplay.scala 112:16]
  reg [3:0] uop_9_ctrl_fuType; // @[LoadQueueReplay.scala 112:16]
  reg [6:0] uop_9_ctrl_fuOpType; // @[LoadQueueReplay.scala 112:16]
  reg  uop_9_ctrl_rfWen; // @[LoadQueueReplay.scala 112:16]
  reg  uop_9_ctrl_fpWen; // @[LoadQueueReplay.scala 112:16]
  reg [5:0] uop_9_pdest; // @[LoadQueueReplay.scala 112:16]
  reg  uop_9_robIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [4:0] uop_9_robIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg  uop_9_lqIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [3:0] uop_9_lqIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg  uop_9_sqIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [3:0] uop_9_sqIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg [9:0] uop_10_cf_foldpc; // @[LoadQueueReplay.scala 112:16]
  reg  uop_10_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 112:16]
  reg  uop_10_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 112:16]
  reg  uop_10_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 112:16]
  reg  uop_10_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 112:16]
  reg  uop_10_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [4:0] uop_10_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg  uop_10_cf_loadWaitBit; // @[LoadQueueReplay.scala 112:16]
  reg  uop_10_cf_loadWaitStrict; // @[LoadQueueReplay.scala 112:16]
  reg  uop_10_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 112:16]
  reg [2:0] uop_10_cf_ftqPtr_value; // @[LoadQueueReplay.scala 112:16]
  reg [2:0] uop_10_cf_ftqOffset; // @[LoadQueueReplay.scala 112:16]
  reg [3:0] uop_10_ctrl_fuType; // @[LoadQueueReplay.scala 112:16]
  reg [6:0] uop_10_ctrl_fuOpType; // @[LoadQueueReplay.scala 112:16]
  reg  uop_10_ctrl_rfWen; // @[LoadQueueReplay.scala 112:16]
  reg  uop_10_ctrl_fpWen; // @[LoadQueueReplay.scala 112:16]
  reg [5:0] uop_10_pdest; // @[LoadQueueReplay.scala 112:16]
  reg  uop_10_robIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [4:0] uop_10_robIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg  uop_10_lqIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [3:0] uop_10_lqIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg  uop_10_sqIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [3:0] uop_10_sqIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg [9:0] uop_11_cf_foldpc; // @[LoadQueueReplay.scala 112:16]
  reg  uop_11_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 112:16]
  reg  uop_11_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 112:16]
  reg  uop_11_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 112:16]
  reg  uop_11_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 112:16]
  reg  uop_11_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [4:0] uop_11_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg  uop_11_cf_loadWaitBit; // @[LoadQueueReplay.scala 112:16]
  reg  uop_11_cf_loadWaitStrict; // @[LoadQueueReplay.scala 112:16]
  reg  uop_11_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 112:16]
  reg [2:0] uop_11_cf_ftqPtr_value; // @[LoadQueueReplay.scala 112:16]
  reg [2:0] uop_11_cf_ftqOffset; // @[LoadQueueReplay.scala 112:16]
  reg [3:0] uop_11_ctrl_fuType; // @[LoadQueueReplay.scala 112:16]
  reg [6:0] uop_11_ctrl_fuOpType; // @[LoadQueueReplay.scala 112:16]
  reg  uop_11_ctrl_rfWen; // @[LoadQueueReplay.scala 112:16]
  reg  uop_11_ctrl_fpWen; // @[LoadQueueReplay.scala 112:16]
  reg [5:0] uop_11_pdest; // @[LoadQueueReplay.scala 112:16]
  reg  uop_11_robIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [4:0] uop_11_robIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg  uop_11_lqIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [3:0] uop_11_lqIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg  uop_11_sqIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [3:0] uop_11_sqIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg [9:0] uop_12_cf_foldpc; // @[LoadQueueReplay.scala 112:16]
  reg  uop_12_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 112:16]
  reg  uop_12_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 112:16]
  reg  uop_12_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 112:16]
  reg  uop_12_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 112:16]
  reg  uop_12_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [4:0] uop_12_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg  uop_12_cf_loadWaitBit; // @[LoadQueueReplay.scala 112:16]
  reg  uop_12_cf_loadWaitStrict; // @[LoadQueueReplay.scala 112:16]
  reg  uop_12_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 112:16]
  reg [2:0] uop_12_cf_ftqPtr_value; // @[LoadQueueReplay.scala 112:16]
  reg [2:0] uop_12_cf_ftqOffset; // @[LoadQueueReplay.scala 112:16]
  reg [3:0] uop_12_ctrl_fuType; // @[LoadQueueReplay.scala 112:16]
  reg [6:0] uop_12_ctrl_fuOpType; // @[LoadQueueReplay.scala 112:16]
  reg  uop_12_ctrl_rfWen; // @[LoadQueueReplay.scala 112:16]
  reg  uop_12_ctrl_fpWen; // @[LoadQueueReplay.scala 112:16]
  reg [5:0] uop_12_pdest; // @[LoadQueueReplay.scala 112:16]
  reg  uop_12_robIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [4:0] uop_12_robIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg  uop_12_lqIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [3:0] uop_12_lqIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg  uop_12_sqIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [3:0] uop_12_sqIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg [9:0] uop_13_cf_foldpc; // @[LoadQueueReplay.scala 112:16]
  reg  uop_13_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 112:16]
  reg  uop_13_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 112:16]
  reg  uop_13_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 112:16]
  reg  uop_13_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 112:16]
  reg  uop_13_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [4:0] uop_13_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg  uop_13_cf_loadWaitBit; // @[LoadQueueReplay.scala 112:16]
  reg  uop_13_cf_loadWaitStrict; // @[LoadQueueReplay.scala 112:16]
  reg  uop_13_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 112:16]
  reg [2:0] uop_13_cf_ftqPtr_value; // @[LoadQueueReplay.scala 112:16]
  reg [2:0] uop_13_cf_ftqOffset; // @[LoadQueueReplay.scala 112:16]
  reg [3:0] uop_13_ctrl_fuType; // @[LoadQueueReplay.scala 112:16]
  reg [6:0] uop_13_ctrl_fuOpType; // @[LoadQueueReplay.scala 112:16]
  reg  uop_13_ctrl_rfWen; // @[LoadQueueReplay.scala 112:16]
  reg  uop_13_ctrl_fpWen; // @[LoadQueueReplay.scala 112:16]
  reg [5:0] uop_13_pdest; // @[LoadQueueReplay.scala 112:16]
  reg  uop_13_robIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [4:0] uop_13_robIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg  uop_13_lqIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [3:0] uop_13_lqIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg  uop_13_sqIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [3:0] uop_13_sqIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg [9:0] uop_14_cf_foldpc; // @[LoadQueueReplay.scala 112:16]
  reg  uop_14_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 112:16]
  reg  uop_14_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 112:16]
  reg  uop_14_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 112:16]
  reg  uop_14_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 112:16]
  reg  uop_14_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [4:0] uop_14_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg  uop_14_cf_loadWaitBit; // @[LoadQueueReplay.scala 112:16]
  reg  uop_14_cf_loadWaitStrict; // @[LoadQueueReplay.scala 112:16]
  reg  uop_14_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 112:16]
  reg [2:0] uop_14_cf_ftqPtr_value; // @[LoadQueueReplay.scala 112:16]
  reg [2:0] uop_14_cf_ftqOffset; // @[LoadQueueReplay.scala 112:16]
  reg [3:0] uop_14_ctrl_fuType; // @[LoadQueueReplay.scala 112:16]
  reg [6:0] uop_14_ctrl_fuOpType; // @[LoadQueueReplay.scala 112:16]
  reg  uop_14_ctrl_rfWen; // @[LoadQueueReplay.scala 112:16]
  reg  uop_14_ctrl_fpWen; // @[LoadQueueReplay.scala 112:16]
  reg [5:0] uop_14_pdest; // @[LoadQueueReplay.scala 112:16]
  reg  uop_14_robIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [4:0] uop_14_robIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg  uop_14_lqIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [3:0] uop_14_lqIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg  uop_14_sqIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [3:0] uop_14_sqIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg [9:0] uop_15_cf_foldpc; // @[LoadQueueReplay.scala 112:16]
  reg  uop_15_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 112:16]
  reg  uop_15_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 112:16]
  reg  uop_15_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 112:16]
  reg  uop_15_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 112:16]
  reg  uop_15_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [4:0] uop_15_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg  uop_15_cf_loadWaitBit; // @[LoadQueueReplay.scala 112:16]
  reg  uop_15_cf_loadWaitStrict; // @[LoadQueueReplay.scala 112:16]
  reg  uop_15_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 112:16]
  reg [2:0] uop_15_cf_ftqPtr_value; // @[LoadQueueReplay.scala 112:16]
  reg [2:0] uop_15_cf_ftqOffset; // @[LoadQueueReplay.scala 112:16]
  reg [3:0] uop_15_ctrl_fuType; // @[LoadQueueReplay.scala 112:16]
  reg [6:0] uop_15_ctrl_fuOpType; // @[LoadQueueReplay.scala 112:16]
  reg  uop_15_ctrl_rfWen; // @[LoadQueueReplay.scala 112:16]
  reg  uop_15_ctrl_fpWen; // @[LoadQueueReplay.scala 112:16]
  reg [5:0] uop_15_pdest; // @[LoadQueueReplay.scala 112:16]
  reg  uop_15_robIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [4:0] uop_15_robIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg  uop_15_lqIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [3:0] uop_15_lqIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg  uop_15_sqIdx_flag; // @[LoadQueueReplay.scala 112:16]
  reg [3:0] uop_15_sqIdx_value; // @[LoadQueueReplay.scala 112:16]
  reg [7:0] cause_0; // @[LoadQueueReplay.scala 121:22]
  reg [7:0] cause_1; // @[LoadQueueReplay.scala 121:22]
  reg [7:0] cause_2; // @[LoadQueueReplay.scala 121:22]
  reg [7:0] cause_3; // @[LoadQueueReplay.scala 121:22]
  reg [7:0] cause_4; // @[LoadQueueReplay.scala 121:22]
  reg [7:0] cause_5; // @[LoadQueueReplay.scala 121:22]
  reg [7:0] cause_6; // @[LoadQueueReplay.scala 121:22]
  reg [7:0] cause_7; // @[LoadQueueReplay.scala 121:22]
  reg [7:0] cause_8; // @[LoadQueueReplay.scala 121:22]
  reg [7:0] cause_9; // @[LoadQueueReplay.scala 121:22]
  reg [7:0] cause_10; // @[LoadQueueReplay.scala 121:22]
  reg [7:0] cause_11; // @[LoadQueueReplay.scala 121:22]
  reg [7:0] cause_12; // @[LoadQueueReplay.scala 121:22]
  reg [7:0] cause_13; // @[LoadQueueReplay.scala 121:22]
  reg [7:0] cause_14; // @[LoadQueueReplay.scala 121:22]
  reg [7:0] cause_15; // @[LoadQueueReplay.scala 121:22]
  reg  flags_0_rarAllocated; // @[LoadQueueReplay.scala 131:18]
  reg [3:0] flags_0_rarIndex; // @[LoadQueueReplay.scala 131:18]
  reg  flags_0_rawAllocated; // @[LoadQueueReplay.scala 131:18]
  reg [2:0] flags_0_rawIndex; // @[LoadQueueReplay.scala 131:18]
  reg  flags_1_rarAllocated; // @[LoadQueueReplay.scala 131:18]
  reg [3:0] flags_1_rarIndex; // @[LoadQueueReplay.scala 131:18]
  reg  flags_1_rawAllocated; // @[LoadQueueReplay.scala 131:18]
  reg [2:0] flags_1_rawIndex; // @[LoadQueueReplay.scala 131:18]
  reg  flags_2_rarAllocated; // @[LoadQueueReplay.scala 131:18]
  reg [3:0] flags_2_rarIndex; // @[LoadQueueReplay.scala 131:18]
  reg  flags_2_rawAllocated; // @[LoadQueueReplay.scala 131:18]
  reg [2:0] flags_2_rawIndex; // @[LoadQueueReplay.scala 131:18]
  reg  flags_3_rarAllocated; // @[LoadQueueReplay.scala 131:18]
  reg [3:0] flags_3_rarIndex; // @[LoadQueueReplay.scala 131:18]
  reg  flags_3_rawAllocated; // @[LoadQueueReplay.scala 131:18]
  reg [2:0] flags_3_rawIndex; // @[LoadQueueReplay.scala 131:18]
  reg  flags_4_rarAllocated; // @[LoadQueueReplay.scala 131:18]
  reg [3:0] flags_4_rarIndex; // @[LoadQueueReplay.scala 131:18]
  reg  flags_4_rawAllocated; // @[LoadQueueReplay.scala 131:18]
  reg [2:0] flags_4_rawIndex; // @[LoadQueueReplay.scala 131:18]
  reg  flags_5_rarAllocated; // @[LoadQueueReplay.scala 131:18]
  reg [3:0] flags_5_rarIndex; // @[LoadQueueReplay.scala 131:18]
  reg  flags_5_rawAllocated; // @[LoadQueueReplay.scala 131:18]
  reg [2:0] flags_5_rawIndex; // @[LoadQueueReplay.scala 131:18]
  reg  flags_6_rarAllocated; // @[LoadQueueReplay.scala 131:18]
  reg [3:0] flags_6_rarIndex; // @[LoadQueueReplay.scala 131:18]
  reg  flags_6_rawAllocated; // @[LoadQueueReplay.scala 131:18]
  reg [2:0] flags_6_rawIndex; // @[LoadQueueReplay.scala 131:18]
  reg  flags_7_rarAllocated; // @[LoadQueueReplay.scala 131:18]
  reg [3:0] flags_7_rarIndex; // @[LoadQueueReplay.scala 131:18]
  reg  flags_7_rawAllocated; // @[LoadQueueReplay.scala 131:18]
  reg [2:0] flags_7_rawIndex; // @[LoadQueueReplay.scala 131:18]
  reg  flags_8_rarAllocated; // @[LoadQueueReplay.scala 131:18]
  reg [3:0] flags_8_rarIndex; // @[LoadQueueReplay.scala 131:18]
  reg  flags_8_rawAllocated; // @[LoadQueueReplay.scala 131:18]
  reg [2:0] flags_8_rawIndex; // @[LoadQueueReplay.scala 131:18]
  reg  flags_9_rarAllocated; // @[LoadQueueReplay.scala 131:18]
  reg [3:0] flags_9_rarIndex; // @[LoadQueueReplay.scala 131:18]
  reg  flags_9_rawAllocated; // @[LoadQueueReplay.scala 131:18]
  reg [2:0] flags_9_rawIndex; // @[LoadQueueReplay.scala 131:18]
  reg  flags_10_rarAllocated; // @[LoadQueueReplay.scala 131:18]
  reg [3:0] flags_10_rarIndex; // @[LoadQueueReplay.scala 131:18]
  reg  flags_10_rawAllocated; // @[LoadQueueReplay.scala 131:18]
  reg [2:0] flags_10_rawIndex; // @[LoadQueueReplay.scala 131:18]
  reg  flags_11_rarAllocated; // @[LoadQueueReplay.scala 131:18]
  reg [3:0] flags_11_rarIndex; // @[LoadQueueReplay.scala 131:18]
  reg  flags_11_rawAllocated; // @[LoadQueueReplay.scala 131:18]
  reg [2:0] flags_11_rawIndex; // @[LoadQueueReplay.scala 131:18]
  reg  flags_12_rarAllocated; // @[LoadQueueReplay.scala 131:18]
  reg [3:0] flags_12_rarIndex; // @[LoadQueueReplay.scala 131:18]
  reg  flags_12_rawAllocated; // @[LoadQueueReplay.scala 131:18]
  reg [2:0] flags_12_rawIndex; // @[LoadQueueReplay.scala 131:18]
  reg  flags_13_rarAllocated; // @[LoadQueueReplay.scala 131:18]
  reg [3:0] flags_13_rarIndex; // @[LoadQueueReplay.scala 131:18]
  reg  flags_13_rawAllocated; // @[LoadQueueReplay.scala 131:18]
  reg [2:0] flags_13_rawIndex; // @[LoadQueueReplay.scala 131:18]
  reg  flags_14_rarAllocated; // @[LoadQueueReplay.scala 131:18]
  reg [3:0] flags_14_rarIndex; // @[LoadQueueReplay.scala 131:18]
  reg  flags_14_rawAllocated; // @[LoadQueueReplay.scala 131:18]
  reg [2:0] flags_14_rawIndex; // @[LoadQueueReplay.scala 131:18]
  reg  flags_15_rarAllocated; // @[LoadQueueReplay.scala 131:18]
  reg [3:0] flags_15_rarIndex; // @[LoadQueueReplay.scala 131:18]
  reg  flags_15_rawAllocated; // @[LoadQueueReplay.scala 131:18]
  reg [2:0] flags_15_rawIndex; // @[LoadQueueReplay.scala 131:18]
  reg [1:0] blockPtrOthers_0; // @[LoadQueueReplay.scala 141:31]
  reg [1:0] blockPtrOthers_1; // @[LoadQueueReplay.scala 141:31]
  reg [1:0] blockPtrOthers_2; // @[LoadQueueReplay.scala 141:31]
  reg [1:0] blockPtrOthers_3; // @[LoadQueueReplay.scala 141:31]
  reg [1:0] blockPtrOthers_4; // @[LoadQueueReplay.scala 141:31]
  reg [1:0] blockPtrOthers_5; // @[LoadQueueReplay.scala 141:31]
  reg [1:0] blockPtrOthers_6; // @[LoadQueueReplay.scala 141:31]
  reg [1:0] blockPtrOthers_7; // @[LoadQueueReplay.scala 141:31]
  reg [1:0] blockPtrOthers_8; // @[LoadQueueReplay.scala 141:31]
  reg [1:0] blockPtrOthers_9; // @[LoadQueueReplay.scala 141:31]
  reg [1:0] blockPtrOthers_10; // @[LoadQueueReplay.scala 141:31]
  reg [1:0] blockPtrOthers_11; // @[LoadQueueReplay.scala 141:31]
  reg [1:0] blockPtrOthers_12; // @[LoadQueueReplay.scala 141:31]
  reg [1:0] blockPtrOthers_13; // @[LoadQueueReplay.scala 141:31]
  reg [1:0] blockPtrOthers_14; // @[LoadQueueReplay.scala 141:31]
  reg [1:0] blockPtrOthers_15; // @[LoadQueueReplay.scala 141:31]
  reg [5:0] blockCyclesTlb_0; // @[LoadQueueReplay.scala 143:27]
  reg [5:0] blockCyclesTlb_1; // @[LoadQueueReplay.scala 143:27]
  reg [5:0] blockCyclesTlb_2; // @[LoadQueueReplay.scala 143:27]
  reg [5:0] blockCyclesTlb_3; // @[LoadQueueReplay.scala 143:27]
  reg [4:0] blockCounter_0; // @[LoadQueueReplay.scala 147:29]
  reg [4:0] blockCounter_1; // @[LoadQueueReplay.scala 147:29]
  reg [4:0] blockCounter_2; // @[LoadQueueReplay.scala 147:29]
  reg [4:0] blockCounter_3; // @[LoadQueueReplay.scala 147:29]
  reg [4:0] blockCounter_4; // @[LoadQueueReplay.scala 147:29]
  reg [4:0] blockCounter_5; // @[LoadQueueReplay.scala 147:29]
  reg [4:0] blockCounter_6; // @[LoadQueueReplay.scala 147:29]
  reg [4:0] blockCounter_7; // @[LoadQueueReplay.scala 147:29]
  reg [4:0] blockCounter_8; // @[LoadQueueReplay.scala 147:29]
  reg [4:0] blockCounter_9; // @[LoadQueueReplay.scala 147:29]
  reg [4:0] blockCounter_10; // @[LoadQueueReplay.scala 147:29]
  reg [4:0] blockCounter_11; // @[LoadQueueReplay.scala 147:29]
  reg [4:0] blockCounter_12; // @[LoadQueueReplay.scala 147:29]
  reg [4:0] blockCounter_13; // @[LoadQueueReplay.scala 147:29]
  reg [4:0] blockCounter_14; // @[LoadQueueReplay.scala 147:29]
  reg [4:0] blockCounter_15; // @[LoadQueueReplay.scala 147:29]
  reg  selBlocked_0; // @[LoadQueueReplay.scala 148:27]
  reg  selBlocked_1; // @[LoadQueueReplay.scala 148:27]
  reg  selBlocked_2; // @[LoadQueueReplay.scala 148:27]
  reg  selBlocked_3; // @[LoadQueueReplay.scala 148:27]
  reg  selBlocked_4; // @[LoadQueueReplay.scala 148:27]
  reg  selBlocked_5; // @[LoadQueueReplay.scala 148:27]
  reg  selBlocked_6; // @[LoadQueueReplay.scala 148:27]
  reg  selBlocked_7; // @[LoadQueueReplay.scala 148:27]
  reg  selBlocked_8; // @[LoadQueueReplay.scala 148:27]
  reg  selBlocked_9; // @[LoadQueueReplay.scala 148:27]
  reg  selBlocked_10; // @[LoadQueueReplay.scala 148:27]
  reg  selBlocked_11; // @[LoadQueueReplay.scala 148:27]
  reg  selBlocked_12; // @[LoadQueueReplay.scala 148:27]
  reg  selBlocked_13; // @[LoadQueueReplay.scala 148:27]
  reg  selBlocked_14; // @[LoadQueueReplay.scala 148:27]
  reg  selBlocked_15; // @[LoadQueueReplay.scala 148:27]
  reg  blockSqIdx_0_flag; // @[LoadQueueReplay.scala 150:23]
  reg [3:0] blockSqIdx_0_value; // @[LoadQueueReplay.scala 150:23]
  reg  blockSqIdx_1_flag; // @[LoadQueueReplay.scala 150:23]
  reg [3:0] blockSqIdx_1_value; // @[LoadQueueReplay.scala 150:23]
  reg  blockSqIdx_2_flag; // @[LoadQueueReplay.scala 150:23]
  reg [3:0] blockSqIdx_2_value; // @[LoadQueueReplay.scala 150:23]
  reg  blockSqIdx_3_flag; // @[LoadQueueReplay.scala 150:23]
  reg [3:0] blockSqIdx_3_value; // @[LoadQueueReplay.scala 150:23]
  reg  blockSqIdx_4_flag; // @[LoadQueueReplay.scala 150:23]
  reg [3:0] blockSqIdx_4_value; // @[LoadQueueReplay.scala 150:23]
  reg  blockSqIdx_5_flag; // @[LoadQueueReplay.scala 150:23]
  reg [3:0] blockSqIdx_5_value; // @[LoadQueueReplay.scala 150:23]
  reg  blockSqIdx_6_flag; // @[LoadQueueReplay.scala 150:23]
  reg [3:0] blockSqIdx_6_value; // @[LoadQueueReplay.scala 150:23]
  reg  blockSqIdx_7_flag; // @[LoadQueueReplay.scala 150:23]
  reg [3:0] blockSqIdx_7_value; // @[LoadQueueReplay.scala 150:23]
  reg  blockSqIdx_8_flag; // @[LoadQueueReplay.scala 150:23]
  reg [3:0] blockSqIdx_8_value; // @[LoadQueueReplay.scala 150:23]
  reg  blockSqIdx_9_flag; // @[LoadQueueReplay.scala 150:23]
  reg [3:0] blockSqIdx_9_value; // @[LoadQueueReplay.scala 150:23]
  reg  blockSqIdx_10_flag; // @[LoadQueueReplay.scala 150:23]
  reg [3:0] blockSqIdx_10_value; // @[LoadQueueReplay.scala 150:23]
  reg  blockSqIdx_11_flag; // @[LoadQueueReplay.scala 150:23]
  reg [3:0] blockSqIdx_11_value; // @[LoadQueueReplay.scala 150:23]
  reg  blockSqIdx_12_flag; // @[LoadQueueReplay.scala 150:23]
  reg [3:0] blockSqIdx_12_value; // @[LoadQueueReplay.scala 150:23]
  reg  blockSqIdx_13_flag; // @[LoadQueueReplay.scala 150:23]
  reg [3:0] blockSqIdx_13_value; // @[LoadQueueReplay.scala 150:23]
  reg  blockSqIdx_14_flag; // @[LoadQueueReplay.scala 150:23]
  reg [3:0] blockSqIdx_14_value; // @[LoadQueueReplay.scala 150:23]
  reg  blockSqIdx_15_flag; // @[LoadQueueReplay.scala 150:23]
  reg [3:0] blockSqIdx_15_value; // @[LoadQueueReplay.scala 150:23]
  reg  blockByTlbMiss_0; // @[LoadQueueReplay.scala 151:31]
  reg  blockByTlbMiss_1; // @[LoadQueueReplay.scala 151:31]
  reg  blockByTlbMiss_2; // @[LoadQueueReplay.scala 151:31]
  reg  blockByTlbMiss_3; // @[LoadQueueReplay.scala 151:31]
  reg  blockByTlbMiss_4; // @[LoadQueueReplay.scala 151:31]
  reg  blockByTlbMiss_5; // @[LoadQueueReplay.scala 151:31]
  reg  blockByTlbMiss_6; // @[LoadQueueReplay.scala 151:31]
  reg  blockByTlbMiss_7; // @[LoadQueueReplay.scala 151:31]
  reg  blockByTlbMiss_8; // @[LoadQueueReplay.scala 151:31]
  reg  blockByTlbMiss_9; // @[LoadQueueReplay.scala 151:31]
  reg  blockByTlbMiss_10; // @[LoadQueueReplay.scala 151:31]
  reg  blockByTlbMiss_11; // @[LoadQueueReplay.scala 151:31]
  reg  blockByTlbMiss_12; // @[LoadQueueReplay.scala 151:31]
  reg  blockByTlbMiss_13; // @[LoadQueueReplay.scala 151:31]
  reg  blockByTlbMiss_14; // @[LoadQueueReplay.scala 151:31]
  reg  blockByTlbMiss_15; // @[LoadQueueReplay.scala 151:31]
  reg  blockByForwardFail_0; // @[LoadQueueReplay.scala 152:35]
  reg  blockByForwardFail_1; // @[LoadQueueReplay.scala 152:35]
  reg  blockByForwardFail_2; // @[LoadQueueReplay.scala 152:35]
  reg  blockByForwardFail_3; // @[LoadQueueReplay.scala 152:35]
  reg  blockByForwardFail_4; // @[LoadQueueReplay.scala 152:35]
  reg  blockByForwardFail_5; // @[LoadQueueReplay.scala 152:35]
  reg  blockByForwardFail_6; // @[LoadQueueReplay.scala 152:35]
  reg  blockByForwardFail_7; // @[LoadQueueReplay.scala 152:35]
  reg  blockByForwardFail_8; // @[LoadQueueReplay.scala 152:35]
  reg  blockByForwardFail_9; // @[LoadQueueReplay.scala 152:35]
  reg  blockByForwardFail_10; // @[LoadQueueReplay.scala 152:35]
  reg  blockByForwardFail_11; // @[LoadQueueReplay.scala 152:35]
  reg  blockByForwardFail_12; // @[LoadQueueReplay.scala 152:35]
  reg  blockByForwardFail_13; // @[LoadQueueReplay.scala 152:35]
  reg  blockByForwardFail_14; // @[LoadQueueReplay.scala 152:35]
  reg  blockByForwardFail_15; // @[LoadQueueReplay.scala 152:35]
  reg  blockByWaitStore_0; // @[LoadQueueReplay.scala 153:33]
  reg  blockByWaitStore_1; // @[LoadQueueReplay.scala 153:33]
  reg  blockByWaitStore_2; // @[LoadQueueReplay.scala 153:33]
  reg  blockByWaitStore_3; // @[LoadQueueReplay.scala 153:33]
  reg  blockByWaitStore_4; // @[LoadQueueReplay.scala 153:33]
  reg  blockByWaitStore_5; // @[LoadQueueReplay.scala 153:33]
  reg  blockByWaitStore_6; // @[LoadQueueReplay.scala 153:33]
  reg  blockByWaitStore_7; // @[LoadQueueReplay.scala 153:33]
  reg  blockByWaitStore_8; // @[LoadQueueReplay.scala 153:33]
  reg  blockByWaitStore_9; // @[LoadQueueReplay.scala 153:33]
  reg  blockByWaitStore_10; // @[LoadQueueReplay.scala 153:33]
  reg  blockByWaitStore_11; // @[LoadQueueReplay.scala 153:33]
  reg  blockByWaitStore_12; // @[LoadQueueReplay.scala 153:33]
  reg  blockByWaitStore_13; // @[LoadQueueReplay.scala 153:33]
  reg  blockByWaitStore_14; // @[LoadQueueReplay.scala 153:33]
  reg  blockByWaitStore_15; // @[LoadQueueReplay.scala 153:33]
  reg  blockByCacheMiss_0; // @[LoadQueueReplay.scala 154:33]
  reg  blockByCacheMiss_1; // @[LoadQueueReplay.scala 154:33]
  reg  blockByCacheMiss_2; // @[LoadQueueReplay.scala 154:33]
  reg  blockByCacheMiss_3; // @[LoadQueueReplay.scala 154:33]
  reg  blockByCacheMiss_4; // @[LoadQueueReplay.scala 154:33]
  reg  blockByCacheMiss_5; // @[LoadQueueReplay.scala 154:33]
  reg  blockByCacheMiss_6; // @[LoadQueueReplay.scala 154:33]
  reg  blockByCacheMiss_7; // @[LoadQueueReplay.scala 154:33]
  reg  blockByCacheMiss_8; // @[LoadQueueReplay.scala 154:33]
  reg  blockByCacheMiss_9; // @[LoadQueueReplay.scala 154:33]
  reg  blockByCacheMiss_10; // @[LoadQueueReplay.scala 154:33]
  reg  blockByCacheMiss_11; // @[LoadQueueReplay.scala 154:33]
  reg  blockByCacheMiss_12; // @[LoadQueueReplay.scala 154:33]
  reg  blockByCacheMiss_13; // @[LoadQueueReplay.scala 154:33]
  reg  blockByCacheMiss_14; // @[LoadQueueReplay.scala 154:33]
  reg  blockByCacheMiss_15; // @[LoadQueueReplay.scala 154:33]
  reg  blockByOthers_0; // @[LoadQueueReplay.scala 155:30]
  reg  blockByOthers_1; // @[LoadQueueReplay.scala 155:30]
  reg  blockByOthers_2; // @[LoadQueueReplay.scala 155:30]
  reg  blockByOthers_3; // @[LoadQueueReplay.scala 155:30]
  reg  blockByOthers_4; // @[LoadQueueReplay.scala 155:30]
  reg  blockByOthers_5; // @[LoadQueueReplay.scala 155:30]
  reg  blockByOthers_6; // @[LoadQueueReplay.scala 155:30]
  reg  blockByOthers_7; // @[LoadQueueReplay.scala 155:30]
  reg  blockByOthers_8; // @[LoadQueueReplay.scala 155:30]
  reg  blockByOthers_9; // @[LoadQueueReplay.scala 155:30]
  reg  blockByOthers_10; // @[LoadQueueReplay.scala 155:30]
  reg  blockByOthers_11; // @[LoadQueueReplay.scala 155:30]
  reg  blockByOthers_12; // @[LoadQueueReplay.scala 155:30]
  reg  blockByOthers_13; // @[LoadQueueReplay.scala 155:30]
  reg  blockByOthers_14; // @[LoadQueueReplay.scala 155:30]
  reg  blockByOthers_15; // @[LoadQueueReplay.scala 155:30]
  reg [1:0] missMSHRId_0; // @[LoadQueueReplay.scala 157:27]
  reg [1:0] missMSHRId_1; // @[LoadQueueReplay.scala 157:27]
  reg [1:0] missMSHRId_2; // @[LoadQueueReplay.scala 157:27]
  reg [1:0] missMSHRId_3; // @[LoadQueueReplay.scala 157:27]
  reg [1:0] missMSHRId_4; // @[LoadQueueReplay.scala 157:27]
  reg [1:0] missMSHRId_5; // @[LoadQueueReplay.scala 157:27]
  reg [1:0] missMSHRId_6; // @[LoadQueueReplay.scala 157:27]
  reg [1:0] missMSHRId_7; // @[LoadQueueReplay.scala 157:27]
  reg [1:0] missMSHRId_8; // @[LoadQueueReplay.scala 157:27]
  reg [1:0] missMSHRId_9; // @[LoadQueueReplay.scala 157:27]
  reg [1:0] missMSHRId_10; // @[LoadQueueReplay.scala 157:27]
  reg [1:0] missMSHRId_11; // @[LoadQueueReplay.scala 157:27]
  reg [1:0] missMSHRId_12; // @[LoadQueueReplay.scala 157:27]
  reg [1:0] missMSHRId_13; // @[LoadQueueReplay.scala 157:27]
  reg [1:0] missMSHRId_14; // @[LoadQueueReplay.scala 157:27]
  reg [1:0] missMSHRId_15; // @[LoadQueueReplay.scala 157:27]
  wire  trueCacheMissReplay_0 = cause_0[7]; // @[LoadQueueReplay.scala 158:57]
  wire  trueCacheMissReplay_1 = cause_1[7]; // @[LoadQueueReplay.scala 158:57]
  wire  trueCacheMissReplay_2 = cause_2[7]; // @[LoadQueueReplay.scala 158:57]
  wire  trueCacheMissReplay_3 = cause_3[7]; // @[LoadQueueReplay.scala 158:57]
  wire  trueCacheMissReplay_4 = cause_4[7]; // @[LoadQueueReplay.scala 158:57]
  wire  trueCacheMissReplay_5 = cause_5[7]; // @[LoadQueueReplay.scala 158:57]
  wire  trueCacheMissReplay_6 = cause_6[7]; // @[LoadQueueReplay.scala 158:57]
  wire  trueCacheMissReplay_7 = cause_7[7]; // @[LoadQueueReplay.scala 158:57]
  wire  trueCacheMissReplay_8 = cause_8[7]; // @[LoadQueueReplay.scala 158:57]
  wire  trueCacheMissReplay_9 = cause_9[7]; // @[LoadQueueReplay.scala 158:57]
  wire  trueCacheMissReplay_10 = cause_10[7]; // @[LoadQueueReplay.scala 158:57]
  wire  trueCacheMissReplay_11 = cause_11[7]; // @[LoadQueueReplay.scala 158:57]
  wire  trueCacheMissReplay_12 = cause_12[7]; // @[LoadQueueReplay.scala 158:57]
  wire  trueCacheMissReplay_13 = cause_13[7]; // @[LoadQueueReplay.scala 158:57]
  wire  trueCacheMissReplay_14 = cause_14[7]; // @[LoadQueueReplay.scala 158:57]
  wire  trueCacheMissReplay_15 = cause_15[7]; // @[LoadQueueReplay.scala 158:57]
  wire [5:0] _cancelEnq_flushItself_T_5 = {io_enq_1_bits_uop_robIdx_flag,io_enq_1_bits_uop_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire [5:0] _cancelEnq_flushItself_T_6 = {io_redirect_bits_robIdx_flag,io_redirect_bits_robIdx_value}; // @[CircularQueuePtr.scala 61:70]
  wire  _cancelEnq_flushItself_T_7 = _cancelEnq_flushItself_T_5 == _cancelEnq_flushItself_T_6; // @[CircularQueuePtr.scala 61:52]
  wire  cancelEnq_flushItself_1 = io_redirect_bits_level & _cancelEnq_flushItself_T_7; // @[Rob.scala 122:51]
  wire  cancelEnq_differentFlag_1 = io_enq_1_bits_uop_robIdx_flag ^ io_redirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  cancelEnq_compare_1 = io_enq_1_bits_uop_robIdx_value > io_redirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _cancelEnq_T_2 = cancelEnq_differentFlag_1 ^ cancelEnq_compare_1; // @[CircularQueuePtr.scala 88:19]
  wire  cancelEnq_1 = io_redirect_valid & (cancelEnq_flushItself_1 | _cancelEnq_T_2); // @[Rob.scala 123:20]
  wire [7:0] _needReplay_T_1 = {io_enq_1_bits_replayInfo_cause_7,io_enq_1_bits_replayInfo_cause_6,
    io_enq_1_bits_replayInfo_cause_5,io_enq_1_bits_replayInfo_cause_4,io_enq_1_bits_replayInfo_cause_3,
    io_enq_1_bits_replayInfo_cause_2,io_enq_1_bits_replayInfo_cause_1,io_enq_1_bits_replayInfo_cause_0}; // @[LoadUnit.scala 62:29]
  wire  needReplay_1 = |_needReplay_T_1; // @[LoadUnit.scala 62:36]
  wire [15:0] _hasExceptions_T_3 = {2'h0,io_enq_1_bits_uop_cf_exceptionVec_13,1'h0,4'h0,2'h0,
    io_enq_1_bits_uop_cf_exceptionVec_5,io_enq_1_bits_uop_cf_exceptionVec_4,4'h0}; // @[LoadQueueReplay.scala 178:102]
  wire  hasExceptions_1 = |_hasExceptions_T_3 & ~io_enq_1_bits_tlbMiss; // @[LoadQueueReplay.scala 178:113]
  wire  canEnqueueVec_1 = io_enq_1_valid & ~cancelEnq_1 & needReplay_1 & ~hasExceptions_1; // @[LoadQueueReplay.scala 180:53]
  wire [7:0] enqIdxOH_lo = {allocated_7,allocated_6,allocated_5,allocated_4,allocated_3,allocated_2,allocated_1,
    allocated_0}; // @[LoadQueueReplay.scala 355:42]
  wire [15:0] _enqIdxOH_T = {allocated_15,allocated_14,allocated_13,allocated_12,allocated_11,allocated_10,allocated_9,
    allocated_8,enqIdxOH_lo}; // @[LoadQueueReplay.scala 355:42]
  wire [15:0] _enqIdxOH_T_1 = ~_enqIdxOH_T; // @[LoadQueueReplay.scala 355:31]
  wire [15:0] _enqIdxOH_sels_0_T_16 = _enqIdxOH_T_1[15] ? 16'h8000 : 16'h0; // @[Mux.scala 47:70]
  wire [15:0] _enqIdxOH_sels_0_T_17 = _enqIdxOH_T_1[14] ? 16'h4000 : _enqIdxOH_sels_0_T_16; // @[Mux.scala 47:70]
  wire [15:0] _enqIdxOH_sels_0_T_18 = _enqIdxOH_T_1[13] ? 16'h2000 : _enqIdxOH_sels_0_T_17; // @[Mux.scala 47:70]
  wire [15:0] _enqIdxOH_sels_0_T_19 = _enqIdxOH_T_1[12] ? 16'h1000 : _enqIdxOH_sels_0_T_18; // @[Mux.scala 47:70]
  wire [15:0] _enqIdxOH_sels_0_T_20 = _enqIdxOH_T_1[11] ? 16'h800 : _enqIdxOH_sels_0_T_19; // @[Mux.scala 47:70]
  wire [15:0] _enqIdxOH_sels_0_T_21 = _enqIdxOH_T_1[10] ? 16'h400 : _enqIdxOH_sels_0_T_20; // @[Mux.scala 47:70]
  wire [15:0] _enqIdxOH_sels_0_T_22 = _enqIdxOH_T_1[9] ? 16'h200 : _enqIdxOH_sels_0_T_21; // @[Mux.scala 47:70]
  wire [15:0] _enqIdxOH_sels_0_T_23 = _enqIdxOH_T_1[8] ? 16'h100 : _enqIdxOH_sels_0_T_22; // @[Mux.scala 47:70]
  wire [15:0] _enqIdxOH_sels_0_T_24 = _enqIdxOH_T_1[7] ? 16'h80 : _enqIdxOH_sels_0_T_23; // @[Mux.scala 47:70]
  wire [15:0] _enqIdxOH_sels_0_T_25 = _enqIdxOH_T_1[6] ? 16'h40 : _enqIdxOH_sels_0_T_24; // @[Mux.scala 47:70]
  wire [15:0] _enqIdxOH_sels_0_T_26 = _enqIdxOH_T_1[5] ? 16'h20 : _enqIdxOH_sels_0_T_25; // @[Mux.scala 47:70]
  wire [15:0] _enqIdxOH_sels_0_T_27 = _enqIdxOH_T_1[4] ? 16'h10 : _enqIdxOH_sels_0_T_26; // @[Mux.scala 47:70]
  wire [15:0] _enqIdxOH_sels_0_T_28 = _enqIdxOH_T_1[3] ? 16'h8 : _enqIdxOH_sels_0_T_27; // @[Mux.scala 47:70]
  wire [15:0] _enqIdxOH_sels_0_T_29 = _enqIdxOH_T_1[2] ? 16'h4 : _enqIdxOH_sels_0_T_28; // @[Mux.scala 47:70]
  wire [15:0] _enqIdxOH_sels_0_T_30 = _enqIdxOH_T_1[1] ? 16'h2 : _enqIdxOH_sels_0_T_29; // @[Mux.scala 47:70]
  wire [15:0] _enqIdxOH_sels_0_T_31 = _enqIdxOH_T_1[0] ? 16'h1 : _enqIdxOH_sels_0_T_30; // @[Mux.scala 47:70]
  wire [5:0] _cancelEnq_flushItself_T_1 = {io_enq_0_bits_uop_robIdx_flag,io_enq_0_bits_uop_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _cancelEnq_flushItself_T_3 = _cancelEnq_flushItself_T_1 == _cancelEnq_flushItself_T_6; // @[CircularQueuePtr.scala 61:52]
  wire  cancelEnq_flushItself = io_redirect_bits_level & _cancelEnq_flushItself_T_3; // @[Rob.scala 122:51]
  wire  cancelEnq_differentFlag = io_enq_0_bits_uop_robIdx_flag ^ io_redirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  cancelEnq_compare = io_enq_0_bits_uop_robIdx_value > io_redirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _cancelEnq_T = cancelEnq_differentFlag ^ cancelEnq_compare; // @[CircularQueuePtr.scala 88:19]
  wire  cancelEnq_0 = io_redirect_valid & (cancelEnq_flushItself | _cancelEnq_T); // @[Rob.scala 123:20]
  wire [7:0] _needReplay_T = {io_enq_0_bits_replayInfo_cause_7,io_enq_0_bits_replayInfo_cause_6,
    io_enq_0_bits_replayInfo_cause_5,io_enq_0_bits_replayInfo_cause_4,io_enq_0_bits_replayInfo_cause_3,
    io_enq_0_bits_replayInfo_cause_2,io_enq_0_bits_replayInfo_cause_1,io_enq_0_bits_replayInfo_cause_0}; // @[LoadUnit.scala 62:29]
  wire  needReplay_0 = |_needReplay_T; // @[LoadUnit.scala 62:36]
  wire [15:0] _hasExceptions_T = {2'h0,io_enq_0_bits_uop_cf_exceptionVec_13,1'h0,4'h0,2'h0,
    io_enq_0_bits_uop_cf_exceptionVec_5,io_enq_0_bits_uop_cf_exceptionVec_4,4'h0}; // @[LoadQueueReplay.scala 178:102]
  wire  hasExceptions_0 = |_hasExceptions_T & ~io_enq_0_bits_tlbMiss; // @[LoadQueueReplay.scala 178:113]
  wire  canEnqueueVec_0 = io_enq_0_valid & ~cancelEnq_0 & needReplay_0 & ~hasExceptions_0; // @[LoadQueueReplay.scala 180:53]
  wire [1:0] _enqIdxOH_T_2 = {canEnqueueVec_1,canEnqueueVec_0}; // @[LoadQueueReplay.scala 355:83]
  wire [15:0] _enqIdxOH_sels_0_T_34 = _enqIdxOH_T_2[0] ? 16'hffff : 16'h0; // @[Bitwise.scala 74:12]
  wire [15:0] enqIdxOH_0 = _enqIdxOH_sels_0_T_31 & _enqIdxOH_sels_0_T_34; // @[BitUtils.scala 360:42]
  wire [15:0] _enqIdxOH_T_3 = ~enqIdxOH_0; // @[BitUtils.scala 361:21]
  wire [15:0] _enqIdxOH_T_4 = _enqIdxOH_T_1 & _enqIdxOH_T_3; // @[BitUtils.scala 361:19]
  wire [15:0] _enqIdxOH_sels_1_T_16 = _enqIdxOH_T_4[15] ? 16'h8000 : 16'h0; // @[Mux.scala 47:70]
  wire [15:0] _enqIdxOH_sels_1_T_17 = _enqIdxOH_T_4[14] ? 16'h4000 : _enqIdxOH_sels_1_T_16; // @[Mux.scala 47:70]
  wire [15:0] _enqIdxOH_sels_1_T_18 = _enqIdxOH_T_4[13] ? 16'h2000 : _enqIdxOH_sels_1_T_17; // @[Mux.scala 47:70]
  wire [15:0] _enqIdxOH_sels_1_T_19 = _enqIdxOH_T_4[12] ? 16'h1000 : _enqIdxOH_sels_1_T_18; // @[Mux.scala 47:70]
  wire [15:0] _enqIdxOH_sels_1_T_20 = _enqIdxOH_T_4[11] ? 16'h800 : _enqIdxOH_sels_1_T_19; // @[Mux.scala 47:70]
  wire [15:0] _enqIdxOH_sels_1_T_21 = _enqIdxOH_T_4[10] ? 16'h400 : _enqIdxOH_sels_1_T_20; // @[Mux.scala 47:70]
  wire [15:0] _enqIdxOH_sels_1_T_22 = _enqIdxOH_T_4[9] ? 16'h200 : _enqIdxOH_sels_1_T_21; // @[Mux.scala 47:70]
  wire [15:0] _enqIdxOH_sels_1_T_23 = _enqIdxOH_T_4[8] ? 16'h100 : _enqIdxOH_sels_1_T_22; // @[Mux.scala 47:70]
  wire [15:0] _enqIdxOH_sels_1_T_24 = _enqIdxOH_T_4[7] ? 16'h80 : _enqIdxOH_sels_1_T_23; // @[Mux.scala 47:70]
  wire [15:0] _enqIdxOH_sels_1_T_25 = _enqIdxOH_T_4[6] ? 16'h40 : _enqIdxOH_sels_1_T_24; // @[Mux.scala 47:70]
  wire [15:0] _enqIdxOH_sels_1_T_26 = _enqIdxOH_T_4[5] ? 16'h20 : _enqIdxOH_sels_1_T_25; // @[Mux.scala 47:70]
  wire [15:0] _enqIdxOH_sels_1_T_27 = _enqIdxOH_T_4[4] ? 16'h10 : _enqIdxOH_sels_1_T_26; // @[Mux.scala 47:70]
  wire [15:0] _enqIdxOH_sels_1_T_28 = _enqIdxOH_T_4[3] ? 16'h8 : _enqIdxOH_sels_1_T_27; // @[Mux.scala 47:70]
  wire [15:0] _enqIdxOH_sels_1_T_29 = _enqIdxOH_T_4[2] ? 16'h4 : _enqIdxOH_sels_1_T_28; // @[Mux.scala 47:70]
  wire [15:0] _enqIdxOH_sels_1_T_30 = _enqIdxOH_T_4[1] ? 16'h2 : _enqIdxOH_sels_1_T_29; // @[Mux.scala 47:70]
  wire [15:0] _enqIdxOH_sels_1_T_31 = _enqIdxOH_T_4[0] ? 16'h1 : _enqIdxOH_sels_1_T_30; // @[Mux.scala 47:70]
  wire [15:0] _enqIdxOH_sels_1_T_34 = _enqIdxOH_T_2[1] ? 16'hffff : 16'h0; // @[Bitwise.scala 74:12]
  wire [15:0] enqIdxOH_1 = _enqIdxOH_sels_1_T_31 & _enqIdxOH_sels_1_T_34; // @[BitUtils.scala 360:42]
  wire [7:0] enqIdx_hi_3 = enqIdxOH_1[15:8]; // @[OneHot.scala 30:18]
  wire  _enqIdx_T_9 = |enqIdx_hi_3; // @[OneHot.scala 32:14]
  wire [7:0] enqIdx_lo_3 = enqIdxOH_1[7:0]; // @[OneHot.scala 31:18]
  wire [7:0] _enqIdx_T_10 = enqIdx_hi_3 | enqIdx_lo_3; // @[OneHot.scala 32:28]
  wire [3:0] enqIdx_hi_4 = _enqIdx_T_10[7:4]; // @[OneHot.scala 30:18]
  wire  _enqIdx_T_11 = |enqIdx_hi_4; // @[OneHot.scala 32:14]
  wire [3:0] enqIdx_lo_4 = _enqIdx_T_10[3:0]; // @[OneHot.scala 31:18]
  wire [3:0] _enqIdx_T_12 = enqIdx_hi_4 | enqIdx_lo_4; // @[OneHot.scala 32:28]
  wire [1:0] enqIdx_hi_5 = _enqIdx_T_12[3:2]; // @[OneHot.scala 30:18]
  wire  _enqIdx_T_13 = |enqIdx_hi_5; // @[OneHot.scala 32:14]
  wire [1:0] enqIdx_lo_5 = _enqIdx_T_12[1:0]; // @[OneHot.scala 31:18]
  wire [1:0] _enqIdx_T_14 = enqIdx_hi_5 | enqIdx_lo_5; // @[OneHot.scala 32:28]
  wire [2:0] _enqIdx_T_17 = {_enqIdx_T_11,_enqIdx_T_13,_enqIdx_T_14[1]}; // @[Cat.scala 31:58]
  wire [3:0] enqIdx_1 = {_enqIdx_T_9,_enqIdx_T_11,_enqIdx_T_13,_enqIdx_T_14[1]}; // @[Cat.scala 31:58]
  wire [5:0] _GEN_10420 = 2'h1 == enqIdx_1[1:0] ? blockCyclesTlb_1 : blockCyclesTlb_0; // @[LoadQueueReplay.scala 380:{34,34}]
  wire [5:0] _GEN_10421 = 2'h2 == enqIdx_1[1:0] ? blockCyclesTlb_2 : _GEN_10420; // @[LoadQueueReplay.scala 380:{34,34}]
  wire [5:0] _GEN_10422 = 2'h3 == enqIdx_1[1:0] ? blockCyclesTlb_3 : _GEN_10421; // @[LoadQueueReplay.scala 380:{34,34}]
  wire [5:0] _GEN_10400 = 2'h1 == enqIdx_1[1:0] ? 6'h0 : 6'hb; // @[LoadQueueReplay.scala 381:{109,109}]
  wire [5:0] _GEN_10401 = 2'h2 == enqIdx_1[1:0] ? 6'h1f : _GEN_10400; // @[LoadQueueReplay.scala 381:{109,109}]
  wire [5:0] _GEN_10402 = 2'h3 == enqIdx_1[1:0] ? 6'h0 : _GEN_10401; // @[LoadQueueReplay.scala 381:{109,109}]
  wire [5:0] _GEN_13290 = {{5'd0}, io_enq_1_bits_replayInfo_dataInLastBeat}; // @[LoadQueueReplay.scala 381:109]
  wire [5:0] _creditUpdate_T_9 = _GEN_10402 + _GEN_13290; // @[LoadQueueReplay.scala 381:109]
  wire [1:0] _GEN_10404 = 4'h1 == enqIdx_1 ? blockPtrOthers_1 : blockPtrOthers_0; // @[LoadQueueReplay.scala 381:{36,36}]
  wire [1:0] _GEN_10405 = 4'h2 == enqIdx_1 ? blockPtrOthers_2 : _GEN_10404; // @[LoadQueueReplay.scala 381:{36,36}]
  wire [1:0] _GEN_10406 = 4'h3 == enqIdx_1 ? blockPtrOthers_3 : _GEN_10405; // @[LoadQueueReplay.scala 381:{36,36}]
  wire [1:0] _GEN_10407 = 4'h4 == enqIdx_1 ? blockPtrOthers_4 : _GEN_10406; // @[LoadQueueReplay.scala 381:{36,36}]
  wire [1:0] _GEN_10408 = 4'h5 == enqIdx_1 ? blockPtrOthers_5 : _GEN_10407; // @[LoadQueueReplay.scala 381:{36,36}]
  wire [1:0] _GEN_10409 = 4'h6 == enqIdx_1 ? blockPtrOthers_6 : _GEN_10408; // @[LoadQueueReplay.scala 381:{36,36}]
  wire [1:0] _GEN_10410 = 4'h7 == enqIdx_1 ? blockPtrOthers_7 : _GEN_10409; // @[LoadQueueReplay.scala 381:{36,36}]
  wire [1:0] _GEN_10411 = 4'h8 == enqIdx_1 ? blockPtrOthers_8 : _GEN_10410; // @[LoadQueueReplay.scala 381:{36,36}]
  wire [1:0] _GEN_10412 = 4'h9 == enqIdx_1 ? blockPtrOthers_9 : _GEN_10411; // @[LoadQueueReplay.scala 381:{36,36}]
  wire [1:0] _GEN_10413 = 4'ha == enqIdx_1 ? blockPtrOthers_10 : _GEN_10412; // @[LoadQueueReplay.scala 381:{36,36}]
  wire [1:0] _GEN_10414 = 4'hb == enqIdx_1 ? blockPtrOthers_11 : _GEN_10413; // @[LoadQueueReplay.scala 381:{36,36}]
  wire [1:0] _GEN_10415 = 4'hc == enqIdx_1 ? blockPtrOthers_12 : _GEN_10414; // @[LoadQueueReplay.scala 381:{36,36}]
  wire [1:0] _GEN_10416 = 4'hd == enqIdx_1 ? blockPtrOthers_13 : _GEN_10415; // @[LoadQueueReplay.scala 381:{36,36}]
  wire [1:0] _GEN_10417 = 4'he == enqIdx_1 ? blockPtrOthers_14 : _GEN_10416; // @[LoadQueueReplay.scala 381:{36,36}]
  wire [1:0] _GEN_10418 = 4'hf == enqIdx_1 ? blockPtrOthers_15 : _GEN_10417; // @[LoadQueueReplay.scala 381:{36,36}]
  wire [5:0] _creditUpdate_T_10 = io_enq_1_bits_replayInfo_cause_7 ? _creditUpdate_T_9 : {{4'd0}, _GEN_10418}; // @[LoadQueueReplay.scala 381:36]
  wire [5:0] _creditUpdate_T_11 = io_enq_1_bits_replayInfo_cause_0 ? _GEN_10422 : _creditUpdate_T_10; // @[LoadQueueReplay.scala 380:34]
  wire [7:0] enqIdx_hi = enqIdxOH_0[15:8]; // @[OneHot.scala 30:18]
  wire  _enqIdx_T = |enqIdx_hi; // @[OneHot.scala 32:14]
  wire [7:0] enqIdx_lo = enqIdxOH_0[7:0]; // @[OneHot.scala 31:18]
  wire [7:0] _enqIdx_T_1 = enqIdx_hi | enqIdx_lo; // @[OneHot.scala 32:28]
  wire [3:0] enqIdx_hi_1 = _enqIdx_T_1[7:4]; // @[OneHot.scala 30:18]
  wire  _enqIdx_T_2 = |enqIdx_hi_1; // @[OneHot.scala 32:14]
  wire [3:0] enqIdx_lo_1 = _enqIdx_T_1[3:0]; // @[OneHot.scala 31:18]
  wire [3:0] _enqIdx_T_3 = enqIdx_hi_1 | enqIdx_lo_1; // @[OneHot.scala 32:28]
  wire [1:0] enqIdx_hi_2 = _enqIdx_T_3[3:2]; // @[OneHot.scala 30:18]
  wire  _enqIdx_T_4 = |enqIdx_hi_2; // @[OneHot.scala 32:14]
  wire [1:0] enqIdx_lo_2 = _enqIdx_T_3[1:0]; // @[OneHot.scala 31:18]
  wire [1:0] _enqIdx_T_5 = enqIdx_hi_2 | enqIdx_lo_2; // @[OneHot.scala 32:28]
  wire [2:0] _enqIdx_T_8 = {_enqIdx_T_2,_enqIdx_T_4,_enqIdx_T_5[1]}; // @[Cat.scala 31:58]
  wire [3:0] enqIdx = {_enqIdx_T,_enqIdx_T_2,_enqIdx_T_4,_enqIdx_T_5[1]}; // @[Cat.scala 31:58]
  wire [5:0] _GEN_5769 = 2'h1 == enqIdx[1:0] ? blockCyclesTlb_1 : blockCyclesTlb_0; // @[LoadQueueReplay.scala 380:{34,34}]
  wire [5:0] _GEN_5770 = 2'h2 == enqIdx[1:0] ? blockCyclesTlb_2 : _GEN_5769; // @[LoadQueueReplay.scala 380:{34,34}]
  wire [5:0] _GEN_5771 = 2'h3 == enqIdx[1:0] ? blockCyclesTlb_3 : _GEN_5770; // @[LoadQueueReplay.scala 380:{34,34}]
  wire [5:0] _GEN_5749 = 2'h1 == enqIdx[1:0] ? 6'h0 : 6'hb; // @[LoadQueueReplay.scala 381:{109,109}]
  wire [5:0] _GEN_5750 = 2'h2 == enqIdx[1:0] ? 6'h1f : _GEN_5749; // @[LoadQueueReplay.scala 381:{109,109}]
  wire [5:0] _GEN_5751 = 2'h3 == enqIdx[1:0] ? 6'h0 : _GEN_5750; // @[LoadQueueReplay.scala 381:{109,109}]
  wire [5:0] _GEN_13291 = {{5'd0}, io_enq_0_bits_replayInfo_dataInLastBeat}; // @[LoadQueueReplay.scala 381:109]
  wire [5:0] _creditUpdate_T_3 = _GEN_5751 + _GEN_13291; // @[LoadQueueReplay.scala 381:109]
  wire [1:0] _GEN_5753 = 4'h1 == enqIdx ? blockPtrOthers_1 : blockPtrOthers_0; // @[LoadQueueReplay.scala 381:{36,36}]
  wire [1:0] _GEN_5754 = 4'h2 == enqIdx ? blockPtrOthers_2 : _GEN_5753; // @[LoadQueueReplay.scala 381:{36,36}]
  wire [1:0] _GEN_5755 = 4'h3 == enqIdx ? blockPtrOthers_3 : _GEN_5754; // @[LoadQueueReplay.scala 381:{36,36}]
  wire [1:0] _GEN_5756 = 4'h4 == enqIdx ? blockPtrOthers_4 : _GEN_5755; // @[LoadQueueReplay.scala 381:{36,36}]
  wire [1:0] _GEN_5757 = 4'h5 == enqIdx ? blockPtrOthers_5 : _GEN_5756; // @[LoadQueueReplay.scala 381:{36,36}]
  wire [1:0] _GEN_5758 = 4'h6 == enqIdx ? blockPtrOthers_6 : _GEN_5757; // @[LoadQueueReplay.scala 381:{36,36}]
  wire [1:0] _GEN_5759 = 4'h7 == enqIdx ? blockPtrOthers_7 : _GEN_5758; // @[LoadQueueReplay.scala 381:{36,36}]
  wire [1:0] _GEN_5760 = 4'h8 == enqIdx ? blockPtrOthers_8 : _GEN_5759; // @[LoadQueueReplay.scala 381:{36,36}]
  wire [1:0] _GEN_5761 = 4'h9 == enqIdx ? blockPtrOthers_9 : _GEN_5760; // @[LoadQueueReplay.scala 381:{36,36}]
  wire [1:0] _GEN_5762 = 4'ha == enqIdx ? blockPtrOthers_10 : _GEN_5761; // @[LoadQueueReplay.scala 381:{36,36}]
  wire [1:0] _GEN_5763 = 4'hb == enqIdx ? blockPtrOthers_11 : _GEN_5762; // @[LoadQueueReplay.scala 381:{36,36}]
  wire [1:0] _GEN_5764 = 4'hc == enqIdx ? blockPtrOthers_12 : _GEN_5763; // @[LoadQueueReplay.scala 381:{36,36}]
  wire [1:0] _GEN_5765 = 4'hd == enqIdx ? blockPtrOthers_13 : _GEN_5764; // @[LoadQueueReplay.scala 381:{36,36}]
  wire [1:0] _GEN_5766 = 4'he == enqIdx ? blockPtrOthers_14 : _GEN_5765; // @[LoadQueueReplay.scala 381:{36,36}]
  wire [1:0] _GEN_5767 = 4'hf == enqIdx ? blockPtrOthers_15 : _GEN_5766; // @[LoadQueueReplay.scala 381:{36,36}]
  wire [5:0] _creditUpdate_T_4 = io_enq_0_bits_replayInfo_cause_7 ? _creditUpdate_T_3 : {{4'd0}, _GEN_5767}; // @[LoadQueueReplay.scala 381:36]
  wire [5:0] _creditUpdate_T_5 = io_enq_0_bits_replayInfo_cause_0 ? _GEN_5771 : _creditUpdate_T_4; // @[LoadQueueReplay.scala 380:34]
  wire  _T_2 = blockByCacheMiss_0 & io_refill_valid & io_refill_bits_id == missMSHRId_0; // @[LoadQueueReplay.scala 222:50]
  wire [5:0] _GEN_5772 = 4'h0 == enqIdx ? _creditUpdate_T_5 : 6'h0; // @[LoadQueueReplay.scala 380:{28,28}]
  wire [5:0] _GEN_8319 = canEnqueueVec_0 ? _GEN_5772 : 6'h0; // @[LoadQueueReplay.scala 362:29]
  wire [5:0] _GEN_10423 = 4'h0 == enqIdx_1 ? _creditUpdate_T_11 : _GEN_8319; // @[LoadQueueReplay.scala 380:{28,28}]
  wire [5:0] creditUpdate_0 = canEnqueueVec_1 ? _GEN_10423 : _GEN_8319; // @[LoadQueueReplay.scala 362:29]
  wire  _T_11 = blockByCacheMiss_1 & io_refill_valid & io_refill_bits_id == missMSHRId_1; // @[LoadQueueReplay.scala 222:50]
  wire [5:0] _GEN_5773 = 4'h1 == enqIdx ? _creditUpdate_T_5 : 6'h0; // @[LoadQueueReplay.scala 380:{28,28}]
  wire [5:0] _GEN_8320 = canEnqueueVec_0 ? _GEN_5773 : 6'h0; // @[LoadQueueReplay.scala 362:29]
  wire [5:0] _GEN_10424 = 4'h1 == enqIdx_1 ? _creditUpdate_T_11 : _GEN_8320; // @[LoadQueueReplay.scala 380:{28,28}]
  wire [5:0] creditUpdate_1 = canEnqueueVec_1 ? _GEN_10424 : _GEN_8320; // @[LoadQueueReplay.scala 362:29]
  wire  _T_20 = blockByCacheMiss_2 & io_refill_valid & io_refill_bits_id == missMSHRId_2; // @[LoadQueueReplay.scala 222:50]
  wire [5:0] _GEN_5774 = 4'h2 == enqIdx ? _creditUpdate_T_5 : 6'h0; // @[LoadQueueReplay.scala 380:{28,28}]
  wire [5:0] _GEN_8321 = canEnqueueVec_0 ? _GEN_5774 : 6'h0; // @[LoadQueueReplay.scala 362:29]
  wire [5:0] _GEN_10425 = 4'h2 == enqIdx_1 ? _creditUpdate_T_11 : _GEN_8321; // @[LoadQueueReplay.scala 380:{28,28}]
  wire [5:0] creditUpdate_2 = canEnqueueVec_1 ? _GEN_10425 : _GEN_8321; // @[LoadQueueReplay.scala 362:29]
  wire  _T_29 = blockByCacheMiss_3 & io_refill_valid & io_refill_bits_id == missMSHRId_3; // @[LoadQueueReplay.scala 222:50]
  wire [5:0] _GEN_5775 = 4'h3 == enqIdx ? _creditUpdate_T_5 : 6'h0; // @[LoadQueueReplay.scala 380:{28,28}]
  wire [5:0] _GEN_8322 = canEnqueueVec_0 ? _GEN_5775 : 6'h0; // @[LoadQueueReplay.scala 362:29]
  wire [5:0] _GEN_10426 = 4'h3 == enqIdx_1 ? _creditUpdate_T_11 : _GEN_8322; // @[LoadQueueReplay.scala 380:{28,28}]
  wire [5:0] creditUpdate_3 = canEnqueueVec_1 ? _GEN_10426 : _GEN_8322; // @[LoadQueueReplay.scala 362:29]
  wire  _T_38 = blockByCacheMiss_4 & io_refill_valid & io_refill_bits_id == missMSHRId_4; // @[LoadQueueReplay.scala 222:50]
  wire [5:0] _GEN_5776 = 4'h4 == enqIdx ? _creditUpdate_T_5 : 6'h0; // @[LoadQueueReplay.scala 380:{28,28}]
  wire [5:0] _GEN_8323 = canEnqueueVec_0 ? _GEN_5776 : 6'h0; // @[LoadQueueReplay.scala 362:29]
  wire [5:0] _GEN_10427 = 4'h4 == enqIdx_1 ? _creditUpdate_T_11 : _GEN_8323; // @[LoadQueueReplay.scala 380:{28,28}]
  wire [5:0] creditUpdate_4 = canEnqueueVec_1 ? _GEN_10427 : _GEN_8323; // @[LoadQueueReplay.scala 362:29]
  wire  _T_47 = blockByCacheMiss_5 & io_refill_valid & io_refill_bits_id == missMSHRId_5; // @[LoadQueueReplay.scala 222:50]
  wire [5:0] _GEN_5777 = 4'h5 == enqIdx ? _creditUpdate_T_5 : 6'h0; // @[LoadQueueReplay.scala 380:{28,28}]
  wire [5:0] _GEN_8324 = canEnqueueVec_0 ? _GEN_5777 : 6'h0; // @[LoadQueueReplay.scala 362:29]
  wire [5:0] _GEN_10428 = 4'h5 == enqIdx_1 ? _creditUpdate_T_11 : _GEN_8324; // @[LoadQueueReplay.scala 380:{28,28}]
  wire [5:0] creditUpdate_5 = canEnqueueVec_1 ? _GEN_10428 : _GEN_8324; // @[LoadQueueReplay.scala 362:29]
  wire  _T_56 = blockByCacheMiss_6 & io_refill_valid & io_refill_bits_id == missMSHRId_6; // @[LoadQueueReplay.scala 222:50]
  wire [5:0] _GEN_5778 = 4'h6 == enqIdx ? _creditUpdate_T_5 : 6'h0; // @[LoadQueueReplay.scala 380:{28,28}]
  wire [5:0] _GEN_8325 = canEnqueueVec_0 ? _GEN_5778 : 6'h0; // @[LoadQueueReplay.scala 362:29]
  wire [5:0] _GEN_10429 = 4'h6 == enqIdx_1 ? _creditUpdate_T_11 : _GEN_8325; // @[LoadQueueReplay.scala 380:{28,28}]
  wire [5:0] creditUpdate_6 = canEnqueueVec_1 ? _GEN_10429 : _GEN_8325; // @[LoadQueueReplay.scala 362:29]
  wire  _T_65 = blockByCacheMiss_7 & io_refill_valid & io_refill_bits_id == missMSHRId_7; // @[LoadQueueReplay.scala 222:50]
  wire [5:0] _GEN_5779 = 4'h7 == enqIdx ? _creditUpdate_T_5 : 6'h0; // @[LoadQueueReplay.scala 380:{28,28}]
  wire [5:0] _GEN_8326 = canEnqueueVec_0 ? _GEN_5779 : 6'h0; // @[LoadQueueReplay.scala 362:29]
  wire [5:0] _GEN_10430 = 4'h7 == enqIdx_1 ? _creditUpdate_T_11 : _GEN_8326; // @[LoadQueueReplay.scala 380:{28,28}]
  wire [5:0] creditUpdate_7 = canEnqueueVec_1 ? _GEN_10430 : _GEN_8326; // @[LoadQueueReplay.scala 362:29]
  wire  _T_74 = blockByCacheMiss_8 & io_refill_valid & io_refill_bits_id == missMSHRId_8; // @[LoadQueueReplay.scala 222:50]
  wire [5:0] _GEN_5780 = 4'h8 == enqIdx ? _creditUpdate_T_5 : 6'h0; // @[LoadQueueReplay.scala 380:{28,28}]
  wire [5:0] _GEN_8327 = canEnqueueVec_0 ? _GEN_5780 : 6'h0; // @[LoadQueueReplay.scala 362:29]
  wire [5:0] _GEN_10431 = 4'h8 == enqIdx_1 ? _creditUpdate_T_11 : _GEN_8327; // @[LoadQueueReplay.scala 380:{28,28}]
  wire [5:0] creditUpdate_8 = canEnqueueVec_1 ? _GEN_10431 : _GEN_8327; // @[LoadQueueReplay.scala 362:29]
  wire  _T_83 = blockByCacheMiss_9 & io_refill_valid & io_refill_bits_id == missMSHRId_9; // @[LoadQueueReplay.scala 222:50]
  wire [5:0] _GEN_5781 = 4'h9 == enqIdx ? _creditUpdate_T_5 : 6'h0; // @[LoadQueueReplay.scala 380:{28,28}]
  wire [5:0] _GEN_8328 = canEnqueueVec_0 ? _GEN_5781 : 6'h0; // @[LoadQueueReplay.scala 362:29]
  wire [5:0] _GEN_10432 = 4'h9 == enqIdx_1 ? _creditUpdate_T_11 : _GEN_8328; // @[LoadQueueReplay.scala 380:{28,28}]
  wire [5:0] creditUpdate_9 = canEnqueueVec_1 ? _GEN_10432 : _GEN_8328; // @[LoadQueueReplay.scala 362:29]
  wire  _T_92 = blockByCacheMiss_10 & io_refill_valid & io_refill_bits_id == missMSHRId_10; // @[LoadQueueReplay.scala 222:50]
  wire [5:0] _GEN_5782 = 4'ha == enqIdx ? _creditUpdate_T_5 : 6'h0; // @[LoadQueueReplay.scala 380:{28,28}]
  wire [5:0] _GEN_8329 = canEnqueueVec_0 ? _GEN_5782 : 6'h0; // @[LoadQueueReplay.scala 362:29]
  wire [5:0] _GEN_10433 = 4'ha == enqIdx_1 ? _creditUpdate_T_11 : _GEN_8329; // @[LoadQueueReplay.scala 380:{28,28}]
  wire [5:0] creditUpdate_10 = canEnqueueVec_1 ? _GEN_10433 : _GEN_8329; // @[LoadQueueReplay.scala 362:29]
  wire  _T_101 = blockByCacheMiss_11 & io_refill_valid & io_refill_bits_id == missMSHRId_11; // @[LoadQueueReplay.scala 222:50]
  wire [5:0] _GEN_5783 = 4'hb == enqIdx ? _creditUpdate_T_5 : 6'h0; // @[LoadQueueReplay.scala 380:{28,28}]
  wire [5:0] _GEN_8330 = canEnqueueVec_0 ? _GEN_5783 : 6'h0; // @[LoadQueueReplay.scala 362:29]
  wire [5:0] _GEN_10434 = 4'hb == enqIdx_1 ? _creditUpdate_T_11 : _GEN_8330; // @[LoadQueueReplay.scala 380:{28,28}]
  wire [5:0] creditUpdate_11 = canEnqueueVec_1 ? _GEN_10434 : _GEN_8330; // @[LoadQueueReplay.scala 362:29]
  wire  _T_110 = blockByCacheMiss_12 & io_refill_valid & io_refill_bits_id == missMSHRId_12; // @[LoadQueueReplay.scala 222:50]
  wire [5:0] _GEN_5784 = 4'hc == enqIdx ? _creditUpdate_T_5 : 6'h0; // @[LoadQueueReplay.scala 380:{28,28}]
  wire [5:0] _GEN_8331 = canEnqueueVec_0 ? _GEN_5784 : 6'h0; // @[LoadQueueReplay.scala 362:29]
  wire [5:0] _GEN_10435 = 4'hc == enqIdx_1 ? _creditUpdate_T_11 : _GEN_8331; // @[LoadQueueReplay.scala 380:{28,28}]
  wire [5:0] creditUpdate_12 = canEnqueueVec_1 ? _GEN_10435 : _GEN_8331; // @[LoadQueueReplay.scala 362:29]
  wire  _T_119 = blockByCacheMiss_13 & io_refill_valid & io_refill_bits_id == missMSHRId_13; // @[LoadQueueReplay.scala 222:50]
  wire [5:0] _GEN_5785 = 4'hd == enqIdx ? _creditUpdate_T_5 : 6'h0; // @[LoadQueueReplay.scala 380:{28,28}]
  wire [5:0] _GEN_8332 = canEnqueueVec_0 ? _GEN_5785 : 6'h0; // @[LoadQueueReplay.scala 362:29]
  wire [5:0] _GEN_10436 = 4'hd == enqIdx_1 ? _creditUpdate_T_11 : _GEN_8332; // @[LoadQueueReplay.scala 380:{28,28}]
  wire [5:0] creditUpdate_13 = canEnqueueVec_1 ? _GEN_10436 : _GEN_8332; // @[LoadQueueReplay.scala 362:29]
  wire  _T_128 = blockByCacheMiss_14 & io_refill_valid & io_refill_bits_id == missMSHRId_14; // @[LoadQueueReplay.scala 222:50]
  wire [5:0] _GEN_5786 = 4'he == enqIdx ? _creditUpdate_T_5 : 6'h0; // @[LoadQueueReplay.scala 380:{28,28}]
  wire [5:0] _GEN_8333 = canEnqueueVec_0 ? _GEN_5786 : 6'h0; // @[LoadQueueReplay.scala 362:29]
  wire [5:0] _GEN_10437 = 4'he == enqIdx_1 ? _creditUpdate_T_11 : _GEN_8333; // @[LoadQueueReplay.scala 380:{28,28}]
  wire [5:0] creditUpdate_14 = canEnqueueVec_1 ? _GEN_10437 : _GEN_8333; // @[LoadQueueReplay.scala 362:29]
  wire  _T_137 = blockByCacheMiss_15 & io_refill_valid & io_refill_bits_id == missMSHRId_15; // @[LoadQueueReplay.scala 222:50]
  wire [5:0] _GEN_5787 = 4'hf == enqIdx ? _creditUpdate_T_5 : 6'h0; // @[LoadQueueReplay.scala 380:{28,28}]
  wire [5:0] _GEN_8334 = canEnqueueVec_0 ? _GEN_5787 : 6'h0; // @[LoadQueueReplay.scala 362:29]
  wire [5:0] _GEN_10438 = 4'hf == enqIdx_1 ? _creditUpdate_T_11 : _GEN_8334; // @[LoadQueueReplay.scala 380:{28,28}]
  wire [5:0] creditUpdate_15 = canEnqueueVec_1 ? _GEN_10438 : _GEN_8334; // @[LoadQueueReplay.scala 362:29]
  reg [7:0] replayCarryReg_0_real_way_en; // @[LoadQueueReplay.scala 164:31]
  reg  replayCarryReg_0_valid; // @[LoadQueueReplay.scala 164:31]
  reg [7:0] replayCarryReg_1_real_way_en; // @[LoadQueueReplay.scala 164:31]
  reg  replayCarryReg_1_valid; // @[LoadQueueReplay.scala 164:31]
  reg [7:0] replayCarryReg_2_real_way_en; // @[LoadQueueReplay.scala 164:31]
  reg  replayCarryReg_2_valid; // @[LoadQueueReplay.scala 164:31]
  reg [7:0] replayCarryReg_3_real_way_en; // @[LoadQueueReplay.scala 164:31]
  reg  replayCarryReg_3_valid; // @[LoadQueueReplay.scala 164:31]
  reg [7:0] replayCarryReg_4_real_way_en; // @[LoadQueueReplay.scala 164:31]
  reg  replayCarryReg_4_valid; // @[LoadQueueReplay.scala 164:31]
  reg [7:0] replayCarryReg_5_real_way_en; // @[LoadQueueReplay.scala 164:31]
  reg  replayCarryReg_5_valid; // @[LoadQueueReplay.scala 164:31]
  reg [7:0] replayCarryReg_6_real_way_en; // @[LoadQueueReplay.scala 164:31]
  reg  replayCarryReg_6_valid; // @[LoadQueueReplay.scala 164:31]
  reg [7:0] replayCarryReg_7_real_way_en; // @[LoadQueueReplay.scala 164:31]
  reg  replayCarryReg_7_valid; // @[LoadQueueReplay.scala 164:31]
  reg [7:0] replayCarryReg_8_real_way_en; // @[LoadQueueReplay.scala 164:31]
  reg  replayCarryReg_8_valid; // @[LoadQueueReplay.scala 164:31]
  reg [7:0] replayCarryReg_9_real_way_en; // @[LoadQueueReplay.scala 164:31]
  reg  replayCarryReg_9_valid; // @[LoadQueueReplay.scala 164:31]
  reg [7:0] replayCarryReg_10_real_way_en; // @[LoadQueueReplay.scala 164:31]
  reg  replayCarryReg_10_valid; // @[LoadQueueReplay.scala 164:31]
  reg [7:0] replayCarryReg_11_real_way_en; // @[LoadQueueReplay.scala 164:31]
  reg  replayCarryReg_11_valid; // @[LoadQueueReplay.scala 164:31]
  reg [7:0] replayCarryReg_12_real_way_en; // @[LoadQueueReplay.scala 164:31]
  reg  replayCarryReg_12_valid; // @[LoadQueueReplay.scala 164:31]
  reg [7:0] replayCarryReg_13_real_way_en; // @[LoadQueueReplay.scala 164:31]
  reg  replayCarryReg_13_valid; // @[LoadQueueReplay.scala 164:31]
  reg [7:0] replayCarryReg_14_real_way_en; // @[LoadQueueReplay.scala 164:31]
  reg  replayCarryReg_14_valid; // @[LoadQueueReplay.scala 164:31]
  reg [7:0] replayCarryReg_15_real_way_en; // @[LoadQueueReplay.scala 164:31]
  reg  replayCarryReg_15_valid; // @[LoadQueueReplay.scala 164:31]
  wire  addrNotBlockVec_1_differentFlag = io_stAddrReadySqPtr_flag ^ blockSqIdx_1_flag; // @[CircularQueuePtr.scala 92:35]
  wire  addrNotBlockVec_1_compare = io_stAddrReadySqPtr_value < blockSqIdx_1_value; // @[CircularQueuePtr.scala 93:30]
  wire  _addrNotBlockVec_1_T = addrNotBlockVec_1_differentFlag ^ addrNotBlockVec_1_compare; // @[CircularQueuePtr.scala 94:19]
  wire  addrNotBlockVec_1 = ~_addrNotBlockVec_1_T | io_sqEmpty; // @[LoadQueueReplay.scala 188:73]
  wire  addrNotBlockVec_0_differentFlag = io_stAddrReadySqPtr_flag ^ blockSqIdx_0_flag; // @[CircularQueuePtr.scala 92:35]
  wire  addrNotBlockVec_0_compare = io_stAddrReadySqPtr_value < blockSqIdx_0_value; // @[CircularQueuePtr.scala 93:30]
  wire  _addrNotBlockVec_0_T = addrNotBlockVec_0_differentFlag ^ addrNotBlockVec_0_compare; // @[CircularQueuePtr.scala 94:19]
  wire  addrNotBlockVec_0 = ~_addrNotBlockVec_0_T | io_sqEmpty; // @[LoadQueueReplay.scala 188:73]
  wire  addrNotBlockVec_3_differentFlag = io_stAddrReadySqPtr_flag ^ blockSqIdx_3_flag; // @[CircularQueuePtr.scala 92:35]
  wire  addrNotBlockVec_3_compare = io_stAddrReadySqPtr_value < blockSqIdx_3_value; // @[CircularQueuePtr.scala 93:30]
  wire  _addrNotBlockVec_3_T = addrNotBlockVec_3_differentFlag ^ addrNotBlockVec_3_compare; // @[CircularQueuePtr.scala 94:19]
  wire  addrNotBlockVec_3 = ~_addrNotBlockVec_3_T | io_sqEmpty; // @[LoadQueueReplay.scala 188:73]
  wire  addrNotBlockVec_2_differentFlag = io_stAddrReadySqPtr_flag ^ blockSqIdx_2_flag; // @[CircularQueuePtr.scala 92:35]
  wire  addrNotBlockVec_2_compare = io_stAddrReadySqPtr_value < blockSqIdx_2_value; // @[CircularQueuePtr.scala 93:30]
  wire  _addrNotBlockVec_2_T = addrNotBlockVec_2_differentFlag ^ addrNotBlockVec_2_compare; // @[CircularQueuePtr.scala 94:19]
  wire  addrNotBlockVec_2 = ~_addrNotBlockVec_2_T | io_sqEmpty; // @[LoadQueueReplay.scala 188:73]
  wire  addrNotBlockVec_5_differentFlag = io_stAddrReadySqPtr_flag ^ blockSqIdx_5_flag; // @[CircularQueuePtr.scala 92:35]
  wire  addrNotBlockVec_5_compare = io_stAddrReadySqPtr_value < blockSqIdx_5_value; // @[CircularQueuePtr.scala 93:30]
  wire  _addrNotBlockVec_5_T = addrNotBlockVec_5_differentFlag ^ addrNotBlockVec_5_compare; // @[CircularQueuePtr.scala 94:19]
  wire  addrNotBlockVec_5 = ~_addrNotBlockVec_5_T | io_sqEmpty; // @[LoadQueueReplay.scala 188:73]
  wire  addrNotBlockVec_4_differentFlag = io_stAddrReadySqPtr_flag ^ blockSqIdx_4_flag; // @[CircularQueuePtr.scala 92:35]
  wire  addrNotBlockVec_4_compare = io_stAddrReadySqPtr_value < blockSqIdx_4_value; // @[CircularQueuePtr.scala 93:30]
  wire  _addrNotBlockVec_4_T = addrNotBlockVec_4_differentFlag ^ addrNotBlockVec_4_compare; // @[CircularQueuePtr.scala 94:19]
  wire  addrNotBlockVec_4 = ~_addrNotBlockVec_4_T | io_sqEmpty; // @[LoadQueueReplay.scala 188:73]
  wire  addrNotBlockVec_7_differentFlag = io_stAddrReadySqPtr_flag ^ blockSqIdx_7_flag; // @[CircularQueuePtr.scala 92:35]
  wire  addrNotBlockVec_7_compare = io_stAddrReadySqPtr_value < blockSqIdx_7_value; // @[CircularQueuePtr.scala 93:30]
  wire  _addrNotBlockVec_7_T = addrNotBlockVec_7_differentFlag ^ addrNotBlockVec_7_compare; // @[CircularQueuePtr.scala 94:19]
  wire  addrNotBlockVec_7 = ~_addrNotBlockVec_7_T | io_sqEmpty; // @[LoadQueueReplay.scala 188:73]
  wire  addrNotBlockVec_6_differentFlag = io_stAddrReadySqPtr_flag ^ blockSqIdx_6_flag; // @[CircularQueuePtr.scala 92:35]
  wire  addrNotBlockVec_6_compare = io_stAddrReadySqPtr_value < blockSqIdx_6_value; // @[CircularQueuePtr.scala 93:30]
  wire  _addrNotBlockVec_6_T = addrNotBlockVec_6_differentFlag ^ addrNotBlockVec_6_compare; // @[CircularQueuePtr.scala 94:19]
  wire  addrNotBlockVec_6 = ~_addrNotBlockVec_6_T | io_sqEmpty; // @[LoadQueueReplay.scala 188:73]
  wire [7:0] storeAddrValidVec_lo = {addrNotBlockVec_7,addrNotBlockVec_6,addrNotBlockVec_5,addrNotBlockVec_4,
    addrNotBlockVec_3,addrNotBlockVec_2,addrNotBlockVec_1,addrNotBlockVec_0}; // @[LoadQueueReplay.scala 171:51]
  wire  addrNotBlockVec_9_differentFlag = io_stAddrReadySqPtr_flag ^ blockSqIdx_9_flag; // @[CircularQueuePtr.scala 92:35]
  wire  addrNotBlockVec_9_compare = io_stAddrReadySqPtr_value < blockSqIdx_9_value; // @[CircularQueuePtr.scala 93:30]
  wire  _addrNotBlockVec_9_T = addrNotBlockVec_9_differentFlag ^ addrNotBlockVec_9_compare; // @[CircularQueuePtr.scala 94:19]
  wire  addrNotBlockVec_9 = ~_addrNotBlockVec_9_T | io_sqEmpty; // @[LoadQueueReplay.scala 188:73]
  wire  addrNotBlockVec_8_differentFlag = io_stAddrReadySqPtr_flag ^ blockSqIdx_8_flag; // @[CircularQueuePtr.scala 92:35]
  wire  addrNotBlockVec_8_compare = io_stAddrReadySqPtr_value < blockSqIdx_8_value; // @[CircularQueuePtr.scala 93:30]
  wire  _addrNotBlockVec_8_T = addrNotBlockVec_8_differentFlag ^ addrNotBlockVec_8_compare; // @[CircularQueuePtr.scala 94:19]
  wire  addrNotBlockVec_8 = ~_addrNotBlockVec_8_T | io_sqEmpty; // @[LoadQueueReplay.scala 188:73]
  wire  addrNotBlockVec_11_differentFlag = io_stAddrReadySqPtr_flag ^ blockSqIdx_11_flag; // @[CircularQueuePtr.scala 92:35]
  wire  addrNotBlockVec_11_compare = io_stAddrReadySqPtr_value < blockSqIdx_11_value; // @[CircularQueuePtr.scala 93:30]
  wire  _addrNotBlockVec_11_T = addrNotBlockVec_11_differentFlag ^ addrNotBlockVec_11_compare; // @[CircularQueuePtr.scala 94:19]
  wire  addrNotBlockVec_11 = ~_addrNotBlockVec_11_T | io_sqEmpty; // @[LoadQueueReplay.scala 188:73]
  wire  addrNotBlockVec_10_differentFlag = io_stAddrReadySqPtr_flag ^ blockSqIdx_10_flag; // @[CircularQueuePtr.scala 92:35]
  wire  addrNotBlockVec_10_compare = io_stAddrReadySqPtr_value < blockSqIdx_10_value; // @[CircularQueuePtr.scala 93:30]
  wire  _addrNotBlockVec_10_T = addrNotBlockVec_10_differentFlag ^ addrNotBlockVec_10_compare; // @[CircularQueuePtr.scala 94:19]
  wire  addrNotBlockVec_10 = ~_addrNotBlockVec_10_T | io_sqEmpty; // @[LoadQueueReplay.scala 188:73]
  wire  addrNotBlockVec_13_differentFlag = io_stAddrReadySqPtr_flag ^ blockSqIdx_13_flag; // @[CircularQueuePtr.scala 92:35]
  wire  addrNotBlockVec_13_compare = io_stAddrReadySqPtr_value < blockSqIdx_13_value; // @[CircularQueuePtr.scala 93:30]
  wire  _addrNotBlockVec_13_T = addrNotBlockVec_13_differentFlag ^ addrNotBlockVec_13_compare; // @[CircularQueuePtr.scala 94:19]
  wire  addrNotBlockVec_13 = ~_addrNotBlockVec_13_T | io_sqEmpty; // @[LoadQueueReplay.scala 188:73]
  wire  addrNotBlockVec_12_differentFlag = io_stAddrReadySqPtr_flag ^ blockSqIdx_12_flag; // @[CircularQueuePtr.scala 92:35]
  wire  addrNotBlockVec_12_compare = io_stAddrReadySqPtr_value < blockSqIdx_12_value; // @[CircularQueuePtr.scala 93:30]
  wire  _addrNotBlockVec_12_T = addrNotBlockVec_12_differentFlag ^ addrNotBlockVec_12_compare; // @[CircularQueuePtr.scala 94:19]
  wire  addrNotBlockVec_12 = ~_addrNotBlockVec_12_T | io_sqEmpty; // @[LoadQueueReplay.scala 188:73]
  wire  addrNotBlockVec_15_differentFlag = io_stAddrReadySqPtr_flag ^ blockSqIdx_15_flag; // @[CircularQueuePtr.scala 92:35]
  wire  addrNotBlockVec_15_compare = io_stAddrReadySqPtr_value < blockSqIdx_15_value; // @[CircularQueuePtr.scala 93:30]
  wire  _addrNotBlockVec_15_T = addrNotBlockVec_15_differentFlag ^ addrNotBlockVec_15_compare; // @[CircularQueuePtr.scala 94:19]
  wire  addrNotBlockVec_15 = ~_addrNotBlockVec_15_T | io_sqEmpty; // @[LoadQueueReplay.scala 188:73]
  wire  addrNotBlockVec_14_differentFlag = io_stAddrReadySqPtr_flag ^ blockSqIdx_14_flag; // @[CircularQueuePtr.scala 92:35]
  wire  addrNotBlockVec_14_compare = io_stAddrReadySqPtr_value < blockSqIdx_14_value; // @[CircularQueuePtr.scala 93:30]
  wire  _addrNotBlockVec_14_T = addrNotBlockVec_14_differentFlag ^ addrNotBlockVec_14_compare; // @[CircularQueuePtr.scala 94:19]
  wire  addrNotBlockVec_14 = ~_addrNotBlockVec_14_T | io_sqEmpty; // @[LoadQueueReplay.scala 188:73]
  wire [15:0] _storeAddrValidVec_T = {addrNotBlockVec_15,addrNotBlockVec_14,addrNotBlockVec_13,addrNotBlockVec_12,
    addrNotBlockVec_11,addrNotBlockVec_10,addrNotBlockVec_9,addrNotBlockVec_8,storeAddrValidVec_lo}; // @[LoadQueueReplay.scala 171:51]
  wire  _storeAddrInSameCycleVec_1_T = ~io_storeAddrIn_0_bits_miss; // @[LoadQueueReplay.scala 193:7]
  wire  _storeAddrInSameCycleVec_1_T_1 = io_storeAddrIn_0_valid & _storeAddrInSameCycleVec_1_T; // @[LoadQueueReplay.scala 192:31]
  wire [4:0] _storeAddrInSameCycleVec_1_T_2 = {blockSqIdx_1_flag,blockSqIdx_1_value}; // @[CircularQueuePtr.scala 61:50]
  wire [4:0] _storeAddrInSameCycleVec_1_T_3 = {io_storeAddrIn_0_bits_uop_sqIdx_flag,
    io_storeAddrIn_0_bits_uop_sqIdx_value}; // @[CircularQueuePtr.scala 61:70]
  wire  _storeAddrInSameCycleVec_1_T_4 = _storeAddrInSameCycleVec_1_T_2 == _storeAddrInSameCycleVec_1_T_3; // @[CircularQueuePtr.scala 61:52]
  wire  _storeAddrInSameCycleVec_1_T_5 = _storeAddrInSameCycleVec_1_T_1 & _storeAddrInSameCycleVec_1_T_4; // @[LoadQueueReplay.scala 193:36]
  wire  _storeAddrInSameCycleVec_1_T_6 = ~io_storeAddrIn_1_bits_miss; // @[LoadQueueReplay.scala 193:7]
  wire  _storeAddrInSameCycleVec_1_T_7 = io_storeAddrIn_1_valid & _storeAddrInSameCycleVec_1_T_6; // @[LoadQueueReplay.scala 192:31]
  wire [4:0] _storeAddrInSameCycleVec_1_T_9 = {io_storeAddrIn_1_bits_uop_sqIdx_flag,
    io_storeAddrIn_1_bits_uop_sqIdx_value}; // @[CircularQueuePtr.scala 61:70]
  wire  _storeAddrInSameCycleVec_1_T_10 = _storeAddrInSameCycleVec_1_T_2 == _storeAddrInSameCycleVec_1_T_9; // @[CircularQueuePtr.scala 61:52]
  wire  _storeAddrInSameCycleVec_1_T_11 = _storeAddrInSameCycleVec_1_T_7 & _storeAddrInSameCycleVec_1_T_10; // @[LoadQueueReplay.scala 193:36]
  wire  storeAddrInSameCycleVec_1 = _storeAddrInSameCycleVec_1_T_5 | _storeAddrInSameCycleVec_1_T_11; // @[LoadQueueReplay.scala 195:16]
  wire [4:0] _storeAddrInSameCycleVec_0_T_2 = {blockSqIdx_0_flag,blockSqIdx_0_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _storeAddrInSameCycleVec_0_T_4 = _storeAddrInSameCycleVec_0_T_2 == _storeAddrInSameCycleVec_1_T_3; // @[CircularQueuePtr.scala 61:52]
  wire  _storeAddrInSameCycleVec_0_T_5 = _storeAddrInSameCycleVec_1_T_1 & _storeAddrInSameCycleVec_0_T_4; // @[LoadQueueReplay.scala 193:36]
  wire  _storeAddrInSameCycleVec_0_T_10 = _storeAddrInSameCycleVec_0_T_2 == _storeAddrInSameCycleVec_1_T_9; // @[CircularQueuePtr.scala 61:52]
  wire  _storeAddrInSameCycleVec_0_T_11 = _storeAddrInSameCycleVec_1_T_7 & _storeAddrInSameCycleVec_0_T_10; // @[LoadQueueReplay.scala 193:36]
  wire  storeAddrInSameCycleVec_0 = _storeAddrInSameCycleVec_0_T_5 | _storeAddrInSameCycleVec_0_T_11; // @[LoadQueueReplay.scala 195:16]
  wire [4:0] _storeAddrInSameCycleVec_3_T_2 = {blockSqIdx_3_flag,blockSqIdx_3_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _storeAddrInSameCycleVec_3_T_4 = _storeAddrInSameCycleVec_3_T_2 == _storeAddrInSameCycleVec_1_T_3; // @[CircularQueuePtr.scala 61:52]
  wire  _storeAddrInSameCycleVec_3_T_5 = _storeAddrInSameCycleVec_1_T_1 & _storeAddrInSameCycleVec_3_T_4; // @[LoadQueueReplay.scala 193:36]
  wire  _storeAddrInSameCycleVec_3_T_10 = _storeAddrInSameCycleVec_3_T_2 == _storeAddrInSameCycleVec_1_T_9; // @[CircularQueuePtr.scala 61:52]
  wire  _storeAddrInSameCycleVec_3_T_11 = _storeAddrInSameCycleVec_1_T_7 & _storeAddrInSameCycleVec_3_T_10; // @[LoadQueueReplay.scala 193:36]
  wire  storeAddrInSameCycleVec_3 = _storeAddrInSameCycleVec_3_T_5 | _storeAddrInSameCycleVec_3_T_11; // @[LoadQueueReplay.scala 195:16]
  wire [4:0] _storeAddrInSameCycleVec_2_T_2 = {blockSqIdx_2_flag,blockSqIdx_2_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _storeAddrInSameCycleVec_2_T_4 = _storeAddrInSameCycleVec_2_T_2 == _storeAddrInSameCycleVec_1_T_3; // @[CircularQueuePtr.scala 61:52]
  wire  _storeAddrInSameCycleVec_2_T_5 = _storeAddrInSameCycleVec_1_T_1 & _storeAddrInSameCycleVec_2_T_4; // @[LoadQueueReplay.scala 193:36]
  wire  _storeAddrInSameCycleVec_2_T_10 = _storeAddrInSameCycleVec_2_T_2 == _storeAddrInSameCycleVec_1_T_9; // @[CircularQueuePtr.scala 61:52]
  wire  _storeAddrInSameCycleVec_2_T_11 = _storeAddrInSameCycleVec_1_T_7 & _storeAddrInSameCycleVec_2_T_10; // @[LoadQueueReplay.scala 193:36]
  wire  storeAddrInSameCycleVec_2 = _storeAddrInSameCycleVec_2_T_5 | _storeAddrInSameCycleVec_2_T_11; // @[LoadQueueReplay.scala 195:16]
  wire [4:0] _storeAddrInSameCycleVec_5_T_2 = {blockSqIdx_5_flag,blockSqIdx_5_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _storeAddrInSameCycleVec_5_T_4 = _storeAddrInSameCycleVec_5_T_2 == _storeAddrInSameCycleVec_1_T_3; // @[CircularQueuePtr.scala 61:52]
  wire  _storeAddrInSameCycleVec_5_T_5 = _storeAddrInSameCycleVec_1_T_1 & _storeAddrInSameCycleVec_5_T_4; // @[LoadQueueReplay.scala 193:36]
  wire  _storeAddrInSameCycleVec_5_T_10 = _storeAddrInSameCycleVec_5_T_2 == _storeAddrInSameCycleVec_1_T_9; // @[CircularQueuePtr.scala 61:52]
  wire  _storeAddrInSameCycleVec_5_T_11 = _storeAddrInSameCycleVec_1_T_7 & _storeAddrInSameCycleVec_5_T_10; // @[LoadQueueReplay.scala 193:36]
  wire  storeAddrInSameCycleVec_5 = _storeAddrInSameCycleVec_5_T_5 | _storeAddrInSameCycleVec_5_T_11; // @[LoadQueueReplay.scala 195:16]
  wire [4:0] _storeAddrInSameCycleVec_4_T_2 = {blockSqIdx_4_flag,blockSqIdx_4_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _storeAddrInSameCycleVec_4_T_4 = _storeAddrInSameCycleVec_4_T_2 == _storeAddrInSameCycleVec_1_T_3; // @[CircularQueuePtr.scala 61:52]
  wire  _storeAddrInSameCycleVec_4_T_5 = _storeAddrInSameCycleVec_1_T_1 & _storeAddrInSameCycleVec_4_T_4; // @[LoadQueueReplay.scala 193:36]
  wire  _storeAddrInSameCycleVec_4_T_10 = _storeAddrInSameCycleVec_4_T_2 == _storeAddrInSameCycleVec_1_T_9; // @[CircularQueuePtr.scala 61:52]
  wire  _storeAddrInSameCycleVec_4_T_11 = _storeAddrInSameCycleVec_1_T_7 & _storeAddrInSameCycleVec_4_T_10; // @[LoadQueueReplay.scala 193:36]
  wire  storeAddrInSameCycleVec_4 = _storeAddrInSameCycleVec_4_T_5 | _storeAddrInSameCycleVec_4_T_11; // @[LoadQueueReplay.scala 195:16]
  wire [4:0] _storeAddrInSameCycleVec_7_T_2 = {blockSqIdx_7_flag,blockSqIdx_7_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _storeAddrInSameCycleVec_7_T_4 = _storeAddrInSameCycleVec_7_T_2 == _storeAddrInSameCycleVec_1_T_3; // @[CircularQueuePtr.scala 61:52]
  wire  _storeAddrInSameCycleVec_7_T_5 = _storeAddrInSameCycleVec_1_T_1 & _storeAddrInSameCycleVec_7_T_4; // @[LoadQueueReplay.scala 193:36]
  wire  _storeAddrInSameCycleVec_7_T_10 = _storeAddrInSameCycleVec_7_T_2 == _storeAddrInSameCycleVec_1_T_9; // @[CircularQueuePtr.scala 61:52]
  wire  _storeAddrInSameCycleVec_7_T_11 = _storeAddrInSameCycleVec_1_T_7 & _storeAddrInSameCycleVec_7_T_10; // @[LoadQueueReplay.scala 193:36]
  wire  storeAddrInSameCycleVec_7 = _storeAddrInSameCycleVec_7_T_5 | _storeAddrInSameCycleVec_7_T_11; // @[LoadQueueReplay.scala 195:16]
  wire [4:0] _storeAddrInSameCycleVec_6_T_2 = {blockSqIdx_6_flag,blockSqIdx_6_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _storeAddrInSameCycleVec_6_T_4 = _storeAddrInSameCycleVec_6_T_2 == _storeAddrInSameCycleVec_1_T_3; // @[CircularQueuePtr.scala 61:52]
  wire  _storeAddrInSameCycleVec_6_T_5 = _storeAddrInSameCycleVec_1_T_1 & _storeAddrInSameCycleVec_6_T_4; // @[LoadQueueReplay.scala 193:36]
  wire  _storeAddrInSameCycleVec_6_T_10 = _storeAddrInSameCycleVec_6_T_2 == _storeAddrInSameCycleVec_1_T_9; // @[CircularQueuePtr.scala 61:52]
  wire  _storeAddrInSameCycleVec_6_T_11 = _storeAddrInSameCycleVec_1_T_7 & _storeAddrInSameCycleVec_6_T_10; // @[LoadQueueReplay.scala 193:36]
  wire  storeAddrInSameCycleVec_6 = _storeAddrInSameCycleVec_6_T_5 | _storeAddrInSameCycleVec_6_T_11; // @[LoadQueueReplay.scala 195:16]
  wire [7:0] storeAddrValidVec_lo_1 = {storeAddrInSameCycleVec_7,storeAddrInSameCycleVec_6,storeAddrInSameCycleVec_5,
    storeAddrInSameCycleVec_4,storeAddrInSameCycleVec_3,storeAddrInSameCycleVec_2,storeAddrInSameCycleVec_1,
    storeAddrInSameCycleVec_0}; // @[LoadQueueReplay.scala 171:84]
  wire [4:0] _storeAddrInSameCycleVec_9_T_2 = {blockSqIdx_9_flag,blockSqIdx_9_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _storeAddrInSameCycleVec_9_T_4 = _storeAddrInSameCycleVec_9_T_2 == _storeAddrInSameCycleVec_1_T_3; // @[CircularQueuePtr.scala 61:52]
  wire  _storeAddrInSameCycleVec_9_T_5 = _storeAddrInSameCycleVec_1_T_1 & _storeAddrInSameCycleVec_9_T_4; // @[LoadQueueReplay.scala 193:36]
  wire  _storeAddrInSameCycleVec_9_T_10 = _storeAddrInSameCycleVec_9_T_2 == _storeAddrInSameCycleVec_1_T_9; // @[CircularQueuePtr.scala 61:52]
  wire  _storeAddrInSameCycleVec_9_T_11 = _storeAddrInSameCycleVec_1_T_7 & _storeAddrInSameCycleVec_9_T_10; // @[LoadQueueReplay.scala 193:36]
  wire  storeAddrInSameCycleVec_9 = _storeAddrInSameCycleVec_9_T_5 | _storeAddrInSameCycleVec_9_T_11; // @[LoadQueueReplay.scala 195:16]
  wire [4:0] _storeAddrInSameCycleVec_8_T_2 = {blockSqIdx_8_flag,blockSqIdx_8_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _storeAddrInSameCycleVec_8_T_4 = _storeAddrInSameCycleVec_8_T_2 == _storeAddrInSameCycleVec_1_T_3; // @[CircularQueuePtr.scala 61:52]
  wire  _storeAddrInSameCycleVec_8_T_5 = _storeAddrInSameCycleVec_1_T_1 & _storeAddrInSameCycleVec_8_T_4; // @[LoadQueueReplay.scala 193:36]
  wire  _storeAddrInSameCycleVec_8_T_10 = _storeAddrInSameCycleVec_8_T_2 == _storeAddrInSameCycleVec_1_T_9; // @[CircularQueuePtr.scala 61:52]
  wire  _storeAddrInSameCycleVec_8_T_11 = _storeAddrInSameCycleVec_1_T_7 & _storeAddrInSameCycleVec_8_T_10; // @[LoadQueueReplay.scala 193:36]
  wire  storeAddrInSameCycleVec_8 = _storeAddrInSameCycleVec_8_T_5 | _storeAddrInSameCycleVec_8_T_11; // @[LoadQueueReplay.scala 195:16]
  wire [4:0] _storeAddrInSameCycleVec_11_T_2 = {blockSqIdx_11_flag,blockSqIdx_11_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _storeAddrInSameCycleVec_11_T_4 = _storeAddrInSameCycleVec_11_T_2 == _storeAddrInSameCycleVec_1_T_3; // @[CircularQueuePtr.scala 61:52]
  wire  _storeAddrInSameCycleVec_11_T_5 = _storeAddrInSameCycleVec_1_T_1 & _storeAddrInSameCycleVec_11_T_4; // @[LoadQueueReplay.scala 193:36]
  wire  _storeAddrInSameCycleVec_11_T_10 = _storeAddrInSameCycleVec_11_T_2 == _storeAddrInSameCycleVec_1_T_9; // @[CircularQueuePtr.scala 61:52]
  wire  _storeAddrInSameCycleVec_11_T_11 = _storeAddrInSameCycleVec_1_T_7 & _storeAddrInSameCycleVec_11_T_10; // @[LoadQueueReplay.scala 193:36]
  wire  storeAddrInSameCycleVec_11 = _storeAddrInSameCycleVec_11_T_5 | _storeAddrInSameCycleVec_11_T_11; // @[LoadQueueReplay.scala 195:16]
  wire [4:0] _storeAddrInSameCycleVec_10_T_2 = {blockSqIdx_10_flag,blockSqIdx_10_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _storeAddrInSameCycleVec_10_T_4 = _storeAddrInSameCycleVec_10_T_2 == _storeAddrInSameCycleVec_1_T_3; // @[CircularQueuePtr.scala 61:52]
  wire  _storeAddrInSameCycleVec_10_T_5 = _storeAddrInSameCycleVec_1_T_1 & _storeAddrInSameCycleVec_10_T_4; // @[LoadQueueReplay.scala 193:36]
  wire  _storeAddrInSameCycleVec_10_T_10 = _storeAddrInSameCycleVec_10_T_2 == _storeAddrInSameCycleVec_1_T_9; // @[CircularQueuePtr.scala 61:52]
  wire  _storeAddrInSameCycleVec_10_T_11 = _storeAddrInSameCycleVec_1_T_7 & _storeAddrInSameCycleVec_10_T_10; // @[LoadQueueReplay.scala 193:36]
  wire  storeAddrInSameCycleVec_10 = _storeAddrInSameCycleVec_10_T_5 | _storeAddrInSameCycleVec_10_T_11; // @[LoadQueueReplay.scala 195:16]
  wire [4:0] _storeAddrInSameCycleVec_13_T_2 = {blockSqIdx_13_flag,blockSqIdx_13_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _storeAddrInSameCycleVec_13_T_4 = _storeAddrInSameCycleVec_13_T_2 == _storeAddrInSameCycleVec_1_T_3; // @[CircularQueuePtr.scala 61:52]
  wire  _storeAddrInSameCycleVec_13_T_5 = _storeAddrInSameCycleVec_1_T_1 & _storeAddrInSameCycleVec_13_T_4; // @[LoadQueueReplay.scala 193:36]
  wire  _storeAddrInSameCycleVec_13_T_10 = _storeAddrInSameCycleVec_13_T_2 == _storeAddrInSameCycleVec_1_T_9; // @[CircularQueuePtr.scala 61:52]
  wire  _storeAddrInSameCycleVec_13_T_11 = _storeAddrInSameCycleVec_1_T_7 & _storeAddrInSameCycleVec_13_T_10; // @[LoadQueueReplay.scala 193:36]
  wire  storeAddrInSameCycleVec_13 = _storeAddrInSameCycleVec_13_T_5 | _storeAddrInSameCycleVec_13_T_11; // @[LoadQueueReplay.scala 195:16]
  wire [4:0] _storeAddrInSameCycleVec_12_T_2 = {blockSqIdx_12_flag,blockSqIdx_12_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _storeAddrInSameCycleVec_12_T_4 = _storeAddrInSameCycleVec_12_T_2 == _storeAddrInSameCycleVec_1_T_3; // @[CircularQueuePtr.scala 61:52]
  wire  _storeAddrInSameCycleVec_12_T_5 = _storeAddrInSameCycleVec_1_T_1 & _storeAddrInSameCycleVec_12_T_4; // @[LoadQueueReplay.scala 193:36]
  wire  _storeAddrInSameCycleVec_12_T_10 = _storeAddrInSameCycleVec_12_T_2 == _storeAddrInSameCycleVec_1_T_9; // @[CircularQueuePtr.scala 61:52]
  wire  _storeAddrInSameCycleVec_12_T_11 = _storeAddrInSameCycleVec_1_T_7 & _storeAddrInSameCycleVec_12_T_10; // @[LoadQueueReplay.scala 193:36]
  wire  storeAddrInSameCycleVec_12 = _storeAddrInSameCycleVec_12_T_5 | _storeAddrInSameCycleVec_12_T_11; // @[LoadQueueReplay.scala 195:16]
  wire [4:0] _storeAddrInSameCycleVec_15_T_2 = {blockSqIdx_15_flag,blockSqIdx_15_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _storeAddrInSameCycleVec_15_T_4 = _storeAddrInSameCycleVec_15_T_2 == _storeAddrInSameCycleVec_1_T_3; // @[CircularQueuePtr.scala 61:52]
  wire  _storeAddrInSameCycleVec_15_T_5 = _storeAddrInSameCycleVec_1_T_1 & _storeAddrInSameCycleVec_15_T_4; // @[LoadQueueReplay.scala 193:36]
  wire  _storeAddrInSameCycleVec_15_T_10 = _storeAddrInSameCycleVec_15_T_2 == _storeAddrInSameCycleVec_1_T_9; // @[CircularQueuePtr.scala 61:52]
  wire  _storeAddrInSameCycleVec_15_T_11 = _storeAddrInSameCycleVec_1_T_7 & _storeAddrInSameCycleVec_15_T_10; // @[LoadQueueReplay.scala 193:36]
  wire  storeAddrInSameCycleVec_15 = _storeAddrInSameCycleVec_15_T_5 | _storeAddrInSameCycleVec_15_T_11; // @[LoadQueueReplay.scala 195:16]
  wire [4:0] _storeAddrInSameCycleVec_14_T_2 = {blockSqIdx_14_flag,blockSqIdx_14_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _storeAddrInSameCycleVec_14_T_4 = _storeAddrInSameCycleVec_14_T_2 == _storeAddrInSameCycleVec_1_T_3; // @[CircularQueuePtr.scala 61:52]
  wire  _storeAddrInSameCycleVec_14_T_5 = _storeAddrInSameCycleVec_1_T_1 & _storeAddrInSameCycleVec_14_T_4; // @[LoadQueueReplay.scala 193:36]
  wire  _storeAddrInSameCycleVec_14_T_10 = _storeAddrInSameCycleVec_14_T_2 == _storeAddrInSameCycleVec_1_T_9; // @[CircularQueuePtr.scala 61:52]
  wire  _storeAddrInSameCycleVec_14_T_11 = _storeAddrInSameCycleVec_1_T_7 & _storeAddrInSameCycleVec_14_T_10; // @[LoadQueueReplay.scala 193:36]
  wire  storeAddrInSameCycleVec_14 = _storeAddrInSameCycleVec_14_T_5 | _storeAddrInSameCycleVec_14_T_11; // @[LoadQueueReplay.scala 195:16]
  wire [15:0] _storeAddrValidVec_T_1 = {storeAddrInSameCycleVec_15,storeAddrInSameCycleVec_14,storeAddrInSameCycleVec_13
    ,storeAddrInSameCycleVec_12,storeAddrInSameCycleVec_11,storeAddrInSameCycleVec_10,storeAddrInSameCycleVec_9,
    storeAddrInSameCycleVec_8,storeAddrValidVec_lo_1}; // @[LoadQueueReplay.scala 171:84]
  reg [15:0] storeAddrValidVec; // @[LoadQueueReplay.scala 171:34]
  wire  dataNotBlockVec_1_differentFlag = io_stDataReadySqPtr_flag ^ blockSqIdx_1_flag; // @[CircularQueuePtr.scala 92:35]
  wire  dataNotBlockVec_1_compare = io_stDataReadySqPtr_value < blockSqIdx_1_value; // @[CircularQueuePtr.scala 93:30]
  wire  _dataNotBlockVec_1_T = dataNotBlockVec_1_differentFlag ^ dataNotBlockVec_1_compare; // @[CircularQueuePtr.scala 94:19]
  wire  dataNotBlockVec_1 = ~_dataNotBlockVec_1_T | io_sqEmpty; // @[LoadQueueReplay.scala 187:73]
  wire  dataNotBlockVec_0_differentFlag = io_stDataReadySqPtr_flag ^ blockSqIdx_0_flag; // @[CircularQueuePtr.scala 92:35]
  wire  dataNotBlockVec_0_compare = io_stDataReadySqPtr_value < blockSqIdx_0_value; // @[CircularQueuePtr.scala 93:30]
  wire  _dataNotBlockVec_0_T = dataNotBlockVec_0_differentFlag ^ dataNotBlockVec_0_compare; // @[CircularQueuePtr.scala 94:19]
  wire  dataNotBlockVec_0 = ~_dataNotBlockVec_0_T | io_sqEmpty; // @[LoadQueueReplay.scala 187:73]
  wire  dataNotBlockVec_3_differentFlag = io_stDataReadySqPtr_flag ^ blockSqIdx_3_flag; // @[CircularQueuePtr.scala 92:35]
  wire  dataNotBlockVec_3_compare = io_stDataReadySqPtr_value < blockSqIdx_3_value; // @[CircularQueuePtr.scala 93:30]
  wire  _dataNotBlockVec_3_T = dataNotBlockVec_3_differentFlag ^ dataNotBlockVec_3_compare; // @[CircularQueuePtr.scala 94:19]
  wire  dataNotBlockVec_3 = ~_dataNotBlockVec_3_T | io_sqEmpty; // @[LoadQueueReplay.scala 187:73]
  wire  dataNotBlockVec_2_differentFlag = io_stDataReadySqPtr_flag ^ blockSqIdx_2_flag; // @[CircularQueuePtr.scala 92:35]
  wire  dataNotBlockVec_2_compare = io_stDataReadySqPtr_value < blockSqIdx_2_value; // @[CircularQueuePtr.scala 93:30]
  wire  _dataNotBlockVec_2_T = dataNotBlockVec_2_differentFlag ^ dataNotBlockVec_2_compare; // @[CircularQueuePtr.scala 94:19]
  wire  dataNotBlockVec_2 = ~_dataNotBlockVec_2_T | io_sqEmpty; // @[LoadQueueReplay.scala 187:73]
  wire  dataNotBlockVec_5_differentFlag = io_stDataReadySqPtr_flag ^ blockSqIdx_5_flag; // @[CircularQueuePtr.scala 92:35]
  wire  dataNotBlockVec_5_compare = io_stDataReadySqPtr_value < blockSqIdx_5_value; // @[CircularQueuePtr.scala 93:30]
  wire  _dataNotBlockVec_5_T = dataNotBlockVec_5_differentFlag ^ dataNotBlockVec_5_compare; // @[CircularQueuePtr.scala 94:19]
  wire  dataNotBlockVec_5 = ~_dataNotBlockVec_5_T | io_sqEmpty; // @[LoadQueueReplay.scala 187:73]
  wire  dataNotBlockVec_4_differentFlag = io_stDataReadySqPtr_flag ^ blockSqIdx_4_flag; // @[CircularQueuePtr.scala 92:35]
  wire  dataNotBlockVec_4_compare = io_stDataReadySqPtr_value < blockSqIdx_4_value; // @[CircularQueuePtr.scala 93:30]
  wire  _dataNotBlockVec_4_T = dataNotBlockVec_4_differentFlag ^ dataNotBlockVec_4_compare; // @[CircularQueuePtr.scala 94:19]
  wire  dataNotBlockVec_4 = ~_dataNotBlockVec_4_T | io_sqEmpty; // @[LoadQueueReplay.scala 187:73]
  wire  dataNotBlockVec_7_differentFlag = io_stDataReadySqPtr_flag ^ blockSqIdx_7_flag; // @[CircularQueuePtr.scala 92:35]
  wire  dataNotBlockVec_7_compare = io_stDataReadySqPtr_value < blockSqIdx_7_value; // @[CircularQueuePtr.scala 93:30]
  wire  _dataNotBlockVec_7_T = dataNotBlockVec_7_differentFlag ^ dataNotBlockVec_7_compare; // @[CircularQueuePtr.scala 94:19]
  wire  dataNotBlockVec_7 = ~_dataNotBlockVec_7_T | io_sqEmpty; // @[LoadQueueReplay.scala 187:73]
  wire  dataNotBlockVec_6_differentFlag = io_stDataReadySqPtr_flag ^ blockSqIdx_6_flag; // @[CircularQueuePtr.scala 92:35]
  wire  dataNotBlockVec_6_compare = io_stDataReadySqPtr_value < blockSqIdx_6_value; // @[CircularQueuePtr.scala 93:30]
  wire  _dataNotBlockVec_6_T = dataNotBlockVec_6_differentFlag ^ dataNotBlockVec_6_compare; // @[CircularQueuePtr.scala 94:19]
  wire  dataNotBlockVec_6 = ~_dataNotBlockVec_6_T | io_sqEmpty; // @[LoadQueueReplay.scala 187:73]
  wire [7:0] storeDataValidVec_lo = {dataNotBlockVec_7,dataNotBlockVec_6,dataNotBlockVec_5,dataNotBlockVec_4,
    dataNotBlockVec_3,dataNotBlockVec_2,dataNotBlockVec_1,dataNotBlockVec_0}; // @[LoadQueueReplay.scala 172:51]
  wire  dataNotBlockVec_9_differentFlag = io_stDataReadySqPtr_flag ^ blockSqIdx_9_flag; // @[CircularQueuePtr.scala 92:35]
  wire  dataNotBlockVec_9_compare = io_stDataReadySqPtr_value < blockSqIdx_9_value; // @[CircularQueuePtr.scala 93:30]
  wire  _dataNotBlockVec_9_T = dataNotBlockVec_9_differentFlag ^ dataNotBlockVec_9_compare; // @[CircularQueuePtr.scala 94:19]
  wire  dataNotBlockVec_9 = ~_dataNotBlockVec_9_T | io_sqEmpty; // @[LoadQueueReplay.scala 187:73]
  wire  dataNotBlockVec_8_differentFlag = io_stDataReadySqPtr_flag ^ blockSqIdx_8_flag; // @[CircularQueuePtr.scala 92:35]
  wire  dataNotBlockVec_8_compare = io_stDataReadySqPtr_value < blockSqIdx_8_value; // @[CircularQueuePtr.scala 93:30]
  wire  _dataNotBlockVec_8_T = dataNotBlockVec_8_differentFlag ^ dataNotBlockVec_8_compare; // @[CircularQueuePtr.scala 94:19]
  wire  dataNotBlockVec_8 = ~_dataNotBlockVec_8_T | io_sqEmpty; // @[LoadQueueReplay.scala 187:73]
  wire  dataNotBlockVec_11_differentFlag = io_stDataReadySqPtr_flag ^ blockSqIdx_11_flag; // @[CircularQueuePtr.scala 92:35]
  wire  dataNotBlockVec_11_compare = io_stDataReadySqPtr_value < blockSqIdx_11_value; // @[CircularQueuePtr.scala 93:30]
  wire  _dataNotBlockVec_11_T = dataNotBlockVec_11_differentFlag ^ dataNotBlockVec_11_compare; // @[CircularQueuePtr.scala 94:19]
  wire  dataNotBlockVec_11 = ~_dataNotBlockVec_11_T | io_sqEmpty; // @[LoadQueueReplay.scala 187:73]
  wire  dataNotBlockVec_10_differentFlag = io_stDataReadySqPtr_flag ^ blockSqIdx_10_flag; // @[CircularQueuePtr.scala 92:35]
  wire  dataNotBlockVec_10_compare = io_stDataReadySqPtr_value < blockSqIdx_10_value; // @[CircularQueuePtr.scala 93:30]
  wire  _dataNotBlockVec_10_T = dataNotBlockVec_10_differentFlag ^ dataNotBlockVec_10_compare; // @[CircularQueuePtr.scala 94:19]
  wire  dataNotBlockVec_10 = ~_dataNotBlockVec_10_T | io_sqEmpty; // @[LoadQueueReplay.scala 187:73]
  wire  dataNotBlockVec_13_differentFlag = io_stDataReadySqPtr_flag ^ blockSqIdx_13_flag; // @[CircularQueuePtr.scala 92:35]
  wire  dataNotBlockVec_13_compare = io_stDataReadySqPtr_value < blockSqIdx_13_value; // @[CircularQueuePtr.scala 93:30]
  wire  _dataNotBlockVec_13_T = dataNotBlockVec_13_differentFlag ^ dataNotBlockVec_13_compare; // @[CircularQueuePtr.scala 94:19]
  wire  dataNotBlockVec_13 = ~_dataNotBlockVec_13_T | io_sqEmpty; // @[LoadQueueReplay.scala 187:73]
  wire  dataNotBlockVec_12_differentFlag = io_stDataReadySqPtr_flag ^ blockSqIdx_12_flag; // @[CircularQueuePtr.scala 92:35]
  wire  dataNotBlockVec_12_compare = io_stDataReadySqPtr_value < blockSqIdx_12_value; // @[CircularQueuePtr.scala 93:30]
  wire  _dataNotBlockVec_12_T = dataNotBlockVec_12_differentFlag ^ dataNotBlockVec_12_compare; // @[CircularQueuePtr.scala 94:19]
  wire  dataNotBlockVec_12 = ~_dataNotBlockVec_12_T | io_sqEmpty; // @[LoadQueueReplay.scala 187:73]
  wire  dataNotBlockVec_15_differentFlag = io_stDataReadySqPtr_flag ^ blockSqIdx_15_flag; // @[CircularQueuePtr.scala 92:35]
  wire  dataNotBlockVec_15_compare = io_stDataReadySqPtr_value < blockSqIdx_15_value; // @[CircularQueuePtr.scala 93:30]
  wire  _dataNotBlockVec_15_T = dataNotBlockVec_15_differentFlag ^ dataNotBlockVec_15_compare; // @[CircularQueuePtr.scala 94:19]
  wire  dataNotBlockVec_15 = ~_dataNotBlockVec_15_T | io_sqEmpty; // @[LoadQueueReplay.scala 187:73]
  wire  dataNotBlockVec_14_differentFlag = io_stDataReadySqPtr_flag ^ blockSqIdx_14_flag; // @[CircularQueuePtr.scala 92:35]
  wire  dataNotBlockVec_14_compare = io_stDataReadySqPtr_value < blockSqIdx_14_value; // @[CircularQueuePtr.scala 93:30]
  wire  _dataNotBlockVec_14_T = dataNotBlockVec_14_differentFlag ^ dataNotBlockVec_14_compare; // @[CircularQueuePtr.scala 94:19]
  wire  dataNotBlockVec_14 = ~_dataNotBlockVec_14_T | io_sqEmpty; // @[LoadQueueReplay.scala 187:73]
  wire [15:0] _storeDataValidVec_T = {dataNotBlockVec_15,dataNotBlockVec_14,dataNotBlockVec_13,dataNotBlockVec_12,
    dataNotBlockVec_11,dataNotBlockVec_10,dataNotBlockVec_9,dataNotBlockVec_8,storeDataValidVec_lo}; // @[LoadQueueReplay.scala 172:51]
  wire [4:0] _storeDataInSameCycleVec_1_T_1 = {io_storeDataIn_0_bits_uop_sqIdx_flag,
    io_storeDataIn_0_bits_uop_sqIdx_value}; // @[CircularQueuePtr.scala 61:70]
  wire  _storeDataInSameCycleVec_1_T_2 = _storeAddrInSameCycleVec_1_T_2 == _storeDataInSameCycleVec_1_T_1; // @[CircularQueuePtr.scala 61:52]
  wire  _storeDataInSameCycleVec_1_T_3 = io_storeDataIn_0_valid & _storeDataInSameCycleVec_1_T_2; // @[LoadQueueReplay.scala 199:31]
  wire [4:0] _storeDataInSameCycleVec_1_T_5 = {io_storeDataIn_1_bits_uop_sqIdx_flag,
    io_storeDataIn_1_bits_uop_sqIdx_value}; // @[CircularQueuePtr.scala 61:70]
  wire  _storeDataInSameCycleVec_1_T_6 = _storeAddrInSameCycleVec_1_T_2 == _storeDataInSameCycleVec_1_T_5; // @[CircularQueuePtr.scala 61:52]
  wire  _storeDataInSameCycleVec_1_T_7 = io_storeDataIn_1_valid & _storeDataInSameCycleVec_1_T_6; // @[LoadQueueReplay.scala 199:31]
  wire  storeDataInSameCycleVec_1 = _storeDataInSameCycleVec_1_T_3 | _storeDataInSameCycleVec_1_T_7; // @[LoadQueueReplay.scala 201:16]
  wire  _storeDataInSameCycleVec_0_T_2 = _storeAddrInSameCycleVec_0_T_2 == _storeDataInSameCycleVec_1_T_1; // @[CircularQueuePtr.scala 61:52]
  wire  _storeDataInSameCycleVec_0_T_3 = io_storeDataIn_0_valid & _storeDataInSameCycleVec_0_T_2; // @[LoadQueueReplay.scala 199:31]
  wire  _storeDataInSameCycleVec_0_T_6 = _storeAddrInSameCycleVec_0_T_2 == _storeDataInSameCycleVec_1_T_5; // @[CircularQueuePtr.scala 61:52]
  wire  _storeDataInSameCycleVec_0_T_7 = io_storeDataIn_1_valid & _storeDataInSameCycleVec_0_T_6; // @[LoadQueueReplay.scala 199:31]
  wire  storeDataInSameCycleVec_0 = _storeDataInSameCycleVec_0_T_3 | _storeDataInSameCycleVec_0_T_7; // @[LoadQueueReplay.scala 201:16]
  wire  _storeDataInSameCycleVec_3_T_2 = _storeAddrInSameCycleVec_3_T_2 == _storeDataInSameCycleVec_1_T_1; // @[CircularQueuePtr.scala 61:52]
  wire  _storeDataInSameCycleVec_3_T_3 = io_storeDataIn_0_valid & _storeDataInSameCycleVec_3_T_2; // @[LoadQueueReplay.scala 199:31]
  wire  _storeDataInSameCycleVec_3_T_6 = _storeAddrInSameCycleVec_3_T_2 == _storeDataInSameCycleVec_1_T_5; // @[CircularQueuePtr.scala 61:52]
  wire  _storeDataInSameCycleVec_3_T_7 = io_storeDataIn_1_valid & _storeDataInSameCycleVec_3_T_6; // @[LoadQueueReplay.scala 199:31]
  wire  storeDataInSameCycleVec_3 = _storeDataInSameCycleVec_3_T_3 | _storeDataInSameCycleVec_3_T_7; // @[LoadQueueReplay.scala 201:16]
  wire  _storeDataInSameCycleVec_2_T_2 = _storeAddrInSameCycleVec_2_T_2 == _storeDataInSameCycleVec_1_T_1; // @[CircularQueuePtr.scala 61:52]
  wire  _storeDataInSameCycleVec_2_T_3 = io_storeDataIn_0_valid & _storeDataInSameCycleVec_2_T_2; // @[LoadQueueReplay.scala 199:31]
  wire  _storeDataInSameCycleVec_2_T_6 = _storeAddrInSameCycleVec_2_T_2 == _storeDataInSameCycleVec_1_T_5; // @[CircularQueuePtr.scala 61:52]
  wire  _storeDataInSameCycleVec_2_T_7 = io_storeDataIn_1_valid & _storeDataInSameCycleVec_2_T_6; // @[LoadQueueReplay.scala 199:31]
  wire  storeDataInSameCycleVec_2 = _storeDataInSameCycleVec_2_T_3 | _storeDataInSameCycleVec_2_T_7; // @[LoadQueueReplay.scala 201:16]
  wire  _storeDataInSameCycleVec_5_T_2 = _storeAddrInSameCycleVec_5_T_2 == _storeDataInSameCycleVec_1_T_1; // @[CircularQueuePtr.scala 61:52]
  wire  _storeDataInSameCycleVec_5_T_3 = io_storeDataIn_0_valid & _storeDataInSameCycleVec_5_T_2; // @[LoadQueueReplay.scala 199:31]
  wire  _storeDataInSameCycleVec_5_T_6 = _storeAddrInSameCycleVec_5_T_2 == _storeDataInSameCycleVec_1_T_5; // @[CircularQueuePtr.scala 61:52]
  wire  _storeDataInSameCycleVec_5_T_7 = io_storeDataIn_1_valid & _storeDataInSameCycleVec_5_T_6; // @[LoadQueueReplay.scala 199:31]
  wire  storeDataInSameCycleVec_5 = _storeDataInSameCycleVec_5_T_3 | _storeDataInSameCycleVec_5_T_7; // @[LoadQueueReplay.scala 201:16]
  wire  _storeDataInSameCycleVec_4_T_2 = _storeAddrInSameCycleVec_4_T_2 == _storeDataInSameCycleVec_1_T_1; // @[CircularQueuePtr.scala 61:52]
  wire  _storeDataInSameCycleVec_4_T_3 = io_storeDataIn_0_valid & _storeDataInSameCycleVec_4_T_2; // @[LoadQueueReplay.scala 199:31]
  wire  _storeDataInSameCycleVec_4_T_6 = _storeAddrInSameCycleVec_4_T_2 == _storeDataInSameCycleVec_1_T_5; // @[CircularQueuePtr.scala 61:52]
  wire  _storeDataInSameCycleVec_4_T_7 = io_storeDataIn_1_valid & _storeDataInSameCycleVec_4_T_6; // @[LoadQueueReplay.scala 199:31]
  wire  storeDataInSameCycleVec_4 = _storeDataInSameCycleVec_4_T_3 | _storeDataInSameCycleVec_4_T_7; // @[LoadQueueReplay.scala 201:16]
  wire  _storeDataInSameCycleVec_7_T_2 = _storeAddrInSameCycleVec_7_T_2 == _storeDataInSameCycleVec_1_T_1; // @[CircularQueuePtr.scala 61:52]
  wire  _storeDataInSameCycleVec_7_T_3 = io_storeDataIn_0_valid & _storeDataInSameCycleVec_7_T_2; // @[LoadQueueReplay.scala 199:31]
  wire  _storeDataInSameCycleVec_7_T_6 = _storeAddrInSameCycleVec_7_T_2 == _storeDataInSameCycleVec_1_T_5; // @[CircularQueuePtr.scala 61:52]
  wire  _storeDataInSameCycleVec_7_T_7 = io_storeDataIn_1_valid & _storeDataInSameCycleVec_7_T_6; // @[LoadQueueReplay.scala 199:31]
  wire  storeDataInSameCycleVec_7 = _storeDataInSameCycleVec_7_T_3 | _storeDataInSameCycleVec_7_T_7; // @[LoadQueueReplay.scala 201:16]
  wire  _storeDataInSameCycleVec_6_T_2 = _storeAddrInSameCycleVec_6_T_2 == _storeDataInSameCycleVec_1_T_1; // @[CircularQueuePtr.scala 61:52]
  wire  _storeDataInSameCycleVec_6_T_3 = io_storeDataIn_0_valid & _storeDataInSameCycleVec_6_T_2; // @[LoadQueueReplay.scala 199:31]
  wire  _storeDataInSameCycleVec_6_T_6 = _storeAddrInSameCycleVec_6_T_2 == _storeDataInSameCycleVec_1_T_5; // @[CircularQueuePtr.scala 61:52]
  wire  _storeDataInSameCycleVec_6_T_7 = io_storeDataIn_1_valid & _storeDataInSameCycleVec_6_T_6; // @[LoadQueueReplay.scala 199:31]
  wire  storeDataInSameCycleVec_6 = _storeDataInSameCycleVec_6_T_3 | _storeDataInSameCycleVec_6_T_7; // @[LoadQueueReplay.scala 201:16]
  wire [7:0] storeDataValidVec_lo_1 = {storeDataInSameCycleVec_7,storeDataInSameCycleVec_6,storeDataInSameCycleVec_5,
    storeDataInSameCycleVec_4,storeDataInSameCycleVec_3,storeDataInSameCycleVec_2,storeDataInSameCycleVec_1,
    storeDataInSameCycleVec_0}; // @[LoadQueueReplay.scala 172:84]
  wire  _storeDataInSameCycleVec_9_T_2 = _storeAddrInSameCycleVec_9_T_2 == _storeDataInSameCycleVec_1_T_1; // @[CircularQueuePtr.scala 61:52]
  wire  _storeDataInSameCycleVec_9_T_3 = io_storeDataIn_0_valid & _storeDataInSameCycleVec_9_T_2; // @[LoadQueueReplay.scala 199:31]
  wire  _storeDataInSameCycleVec_9_T_6 = _storeAddrInSameCycleVec_9_T_2 == _storeDataInSameCycleVec_1_T_5; // @[CircularQueuePtr.scala 61:52]
  wire  _storeDataInSameCycleVec_9_T_7 = io_storeDataIn_1_valid & _storeDataInSameCycleVec_9_T_6; // @[LoadQueueReplay.scala 199:31]
  wire  storeDataInSameCycleVec_9 = _storeDataInSameCycleVec_9_T_3 | _storeDataInSameCycleVec_9_T_7; // @[LoadQueueReplay.scala 201:16]
  wire  _storeDataInSameCycleVec_8_T_2 = _storeAddrInSameCycleVec_8_T_2 == _storeDataInSameCycleVec_1_T_1; // @[CircularQueuePtr.scala 61:52]
  wire  _storeDataInSameCycleVec_8_T_3 = io_storeDataIn_0_valid & _storeDataInSameCycleVec_8_T_2; // @[LoadQueueReplay.scala 199:31]
  wire  _storeDataInSameCycleVec_8_T_6 = _storeAddrInSameCycleVec_8_T_2 == _storeDataInSameCycleVec_1_T_5; // @[CircularQueuePtr.scala 61:52]
  wire  _storeDataInSameCycleVec_8_T_7 = io_storeDataIn_1_valid & _storeDataInSameCycleVec_8_T_6; // @[LoadQueueReplay.scala 199:31]
  wire  storeDataInSameCycleVec_8 = _storeDataInSameCycleVec_8_T_3 | _storeDataInSameCycleVec_8_T_7; // @[LoadQueueReplay.scala 201:16]
  wire  _storeDataInSameCycleVec_11_T_2 = _storeAddrInSameCycleVec_11_T_2 == _storeDataInSameCycleVec_1_T_1; // @[CircularQueuePtr.scala 61:52]
  wire  _storeDataInSameCycleVec_11_T_3 = io_storeDataIn_0_valid & _storeDataInSameCycleVec_11_T_2; // @[LoadQueueReplay.scala 199:31]
  wire  _storeDataInSameCycleVec_11_T_6 = _storeAddrInSameCycleVec_11_T_2 == _storeDataInSameCycleVec_1_T_5; // @[CircularQueuePtr.scala 61:52]
  wire  _storeDataInSameCycleVec_11_T_7 = io_storeDataIn_1_valid & _storeDataInSameCycleVec_11_T_6; // @[LoadQueueReplay.scala 199:31]
  wire  storeDataInSameCycleVec_11 = _storeDataInSameCycleVec_11_T_3 | _storeDataInSameCycleVec_11_T_7; // @[LoadQueueReplay.scala 201:16]
  wire  _storeDataInSameCycleVec_10_T_2 = _storeAddrInSameCycleVec_10_T_2 == _storeDataInSameCycleVec_1_T_1; // @[CircularQueuePtr.scala 61:52]
  wire  _storeDataInSameCycleVec_10_T_3 = io_storeDataIn_0_valid & _storeDataInSameCycleVec_10_T_2; // @[LoadQueueReplay.scala 199:31]
  wire  _storeDataInSameCycleVec_10_T_6 = _storeAddrInSameCycleVec_10_T_2 == _storeDataInSameCycleVec_1_T_5; // @[CircularQueuePtr.scala 61:52]
  wire  _storeDataInSameCycleVec_10_T_7 = io_storeDataIn_1_valid & _storeDataInSameCycleVec_10_T_6; // @[LoadQueueReplay.scala 199:31]
  wire  storeDataInSameCycleVec_10 = _storeDataInSameCycleVec_10_T_3 | _storeDataInSameCycleVec_10_T_7; // @[LoadQueueReplay.scala 201:16]
  wire  _storeDataInSameCycleVec_13_T_2 = _storeAddrInSameCycleVec_13_T_2 == _storeDataInSameCycleVec_1_T_1; // @[CircularQueuePtr.scala 61:52]
  wire  _storeDataInSameCycleVec_13_T_3 = io_storeDataIn_0_valid & _storeDataInSameCycleVec_13_T_2; // @[LoadQueueReplay.scala 199:31]
  wire  _storeDataInSameCycleVec_13_T_6 = _storeAddrInSameCycleVec_13_T_2 == _storeDataInSameCycleVec_1_T_5; // @[CircularQueuePtr.scala 61:52]
  wire  _storeDataInSameCycleVec_13_T_7 = io_storeDataIn_1_valid & _storeDataInSameCycleVec_13_T_6; // @[LoadQueueReplay.scala 199:31]
  wire  storeDataInSameCycleVec_13 = _storeDataInSameCycleVec_13_T_3 | _storeDataInSameCycleVec_13_T_7; // @[LoadQueueReplay.scala 201:16]
  wire  _storeDataInSameCycleVec_12_T_2 = _storeAddrInSameCycleVec_12_T_2 == _storeDataInSameCycleVec_1_T_1; // @[CircularQueuePtr.scala 61:52]
  wire  _storeDataInSameCycleVec_12_T_3 = io_storeDataIn_0_valid & _storeDataInSameCycleVec_12_T_2; // @[LoadQueueReplay.scala 199:31]
  wire  _storeDataInSameCycleVec_12_T_6 = _storeAddrInSameCycleVec_12_T_2 == _storeDataInSameCycleVec_1_T_5; // @[CircularQueuePtr.scala 61:52]
  wire  _storeDataInSameCycleVec_12_T_7 = io_storeDataIn_1_valid & _storeDataInSameCycleVec_12_T_6; // @[LoadQueueReplay.scala 199:31]
  wire  storeDataInSameCycleVec_12 = _storeDataInSameCycleVec_12_T_3 | _storeDataInSameCycleVec_12_T_7; // @[LoadQueueReplay.scala 201:16]
  wire  _storeDataInSameCycleVec_15_T_2 = _storeAddrInSameCycleVec_15_T_2 == _storeDataInSameCycleVec_1_T_1; // @[CircularQueuePtr.scala 61:52]
  wire  _storeDataInSameCycleVec_15_T_3 = io_storeDataIn_0_valid & _storeDataInSameCycleVec_15_T_2; // @[LoadQueueReplay.scala 199:31]
  wire  _storeDataInSameCycleVec_15_T_6 = _storeAddrInSameCycleVec_15_T_2 == _storeDataInSameCycleVec_1_T_5; // @[CircularQueuePtr.scala 61:52]
  wire  _storeDataInSameCycleVec_15_T_7 = io_storeDataIn_1_valid & _storeDataInSameCycleVec_15_T_6; // @[LoadQueueReplay.scala 199:31]
  wire  storeDataInSameCycleVec_15 = _storeDataInSameCycleVec_15_T_3 | _storeDataInSameCycleVec_15_T_7; // @[LoadQueueReplay.scala 201:16]
  wire  _storeDataInSameCycleVec_14_T_2 = _storeAddrInSameCycleVec_14_T_2 == _storeDataInSameCycleVec_1_T_1; // @[CircularQueuePtr.scala 61:52]
  wire  _storeDataInSameCycleVec_14_T_3 = io_storeDataIn_0_valid & _storeDataInSameCycleVec_14_T_2; // @[LoadQueueReplay.scala 199:31]
  wire  _storeDataInSameCycleVec_14_T_6 = _storeAddrInSameCycleVec_14_T_2 == _storeDataInSameCycleVec_1_T_5; // @[CircularQueuePtr.scala 61:52]
  wire  _storeDataInSameCycleVec_14_T_7 = io_storeDataIn_1_valid & _storeDataInSameCycleVec_14_T_6; // @[LoadQueueReplay.scala 199:31]
  wire  storeDataInSameCycleVec_14 = _storeDataInSameCycleVec_14_T_3 | _storeDataInSameCycleVec_14_T_7; // @[LoadQueueReplay.scala 201:16]
  wire [15:0] _storeDataValidVec_T_1 = {storeDataInSameCycleVec_15,storeDataInSameCycleVec_14,storeDataInSameCycleVec_13
    ,storeDataInSameCycleVec_12,storeDataInSameCycleVec_11,storeDataInSameCycleVec_10,storeDataInSameCycleVec_9,
    storeDataInSameCycleVec_8,storeDataValidVec_lo_1}; // @[LoadQueueReplay.scala 172:84]
  reg [15:0] storeDataValidVec; // @[LoadQueueReplay.scala 172:34]
  wire  stAddrDeqVec_0 = allocated_0 & storeAddrValidVec[0]; // @[LoadQueueReplay.scala 207:37]
  wire  stAddrDeqVec_1 = allocated_1 & storeAddrValidVec[1]; // @[LoadQueueReplay.scala 207:37]
  wire  stAddrDeqVec_2 = allocated_2 & storeAddrValidVec[2]; // @[LoadQueueReplay.scala 207:37]
  wire  stAddrDeqVec_3 = allocated_3 & storeAddrValidVec[3]; // @[LoadQueueReplay.scala 207:37]
  wire  stAddrDeqVec_4 = allocated_4 & storeAddrValidVec[4]; // @[LoadQueueReplay.scala 207:37]
  wire  stAddrDeqVec_5 = allocated_5 & storeAddrValidVec[5]; // @[LoadQueueReplay.scala 207:37]
  wire  stAddrDeqVec_6 = allocated_6 & storeAddrValidVec[6]; // @[LoadQueueReplay.scala 207:37]
  wire  stAddrDeqVec_7 = allocated_7 & storeAddrValidVec[7]; // @[LoadQueueReplay.scala 207:37]
  wire  stAddrDeqVec_8 = allocated_8 & storeAddrValidVec[8]; // @[LoadQueueReplay.scala 207:37]
  wire  stAddrDeqVec_9 = allocated_9 & storeAddrValidVec[9]; // @[LoadQueueReplay.scala 207:37]
  wire  stAddrDeqVec_10 = allocated_10 & storeAddrValidVec[10]; // @[LoadQueueReplay.scala 207:37]
  wire  stAddrDeqVec_11 = allocated_11 & storeAddrValidVec[11]; // @[LoadQueueReplay.scala 207:37]
  wire  stAddrDeqVec_12 = allocated_12 & storeAddrValidVec[12]; // @[LoadQueueReplay.scala 207:37]
  wire  stAddrDeqVec_13 = allocated_13 & storeAddrValidVec[13]; // @[LoadQueueReplay.scala 207:37]
  wire  stAddrDeqVec_14 = allocated_14 & storeAddrValidVec[14]; // @[LoadQueueReplay.scala 207:37]
  wire  stAddrDeqVec_15 = allocated_15 & storeAddrValidVec[15]; // @[LoadQueueReplay.scala 207:37]
  wire  stDataDeqVec_0 = allocated_0 & storeDataValidVec[0]; // @[LoadQueueReplay.scala 213:37]
  wire  stDataDeqVec_1 = allocated_1 & storeDataValidVec[1]; // @[LoadQueueReplay.scala 213:37]
  wire  stDataDeqVec_2 = allocated_2 & storeDataValidVec[2]; // @[LoadQueueReplay.scala 213:37]
  wire  stDataDeqVec_3 = allocated_3 & storeDataValidVec[3]; // @[LoadQueueReplay.scala 213:37]
  wire  stDataDeqVec_4 = allocated_4 & storeDataValidVec[4]; // @[LoadQueueReplay.scala 213:37]
  wire  stDataDeqVec_5 = allocated_5 & storeDataValidVec[5]; // @[LoadQueueReplay.scala 213:37]
  wire  stDataDeqVec_6 = allocated_6 & storeDataValidVec[6]; // @[LoadQueueReplay.scala 213:37]
  wire  stDataDeqVec_7 = allocated_7 & storeDataValidVec[7]; // @[LoadQueueReplay.scala 213:37]
  wire  stDataDeqVec_8 = allocated_8 & storeDataValidVec[8]; // @[LoadQueueReplay.scala 213:37]
  wire  stDataDeqVec_9 = allocated_9 & storeDataValidVec[9]; // @[LoadQueueReplay.scala 213:37]
  wire  stDataDeqVec_10 = allocated_10 & storeDataValidVec[10]; // @[LoadQueueReplay.scala 213:37]
  wire  stDataDeqVec_11 = allocated_11 & storeDataValidVec[11]; // @[LoadQueueReplay.scala 213:37]
  wire  stDataDeqVec_12 = allocated_12 & storeDataValidVec[12]; // @[LoadQueueReplay.scala 213:37]
  wire  stDataDeqVec_13 = allocated_13 & storeDataValidVec[13]; // @[LoadQueueReplay.scala 213:37]
  wire  stDataDeqVec_14 = allocated_14 & storeDataValidVec[14]; // @[LoadQueueReplay.scala 213:37]
  wire  stDataDeqVec_15 = allocated_15 & storeDataValidVec[15]; // @[LoadQueueReplay.scala 213:37]
  wire  _blockByForwardFail_0_T_1 = blockByForwardFail_0 & stDataDeqVec_0 ? 1'h0 : blockByForwardFail_0; // @[LoadQueueReplay.scala 218:33]
  wire  _blockByWaitStore_0_T_1 = blockByWaitStore_0 & stAddrDeqVec_0 ? 1'h0 : blockByWaitStore_0; // @[LoadQueueReplay.scala 219:31]
  wire  _blockByCacheMiss_0_T_3 = _T_2 ? 1'h0 : blockByCacheMiss_0; // @[LoadQueueReplay.scala 220:31]
  wire  _T_3 = creditUpdate_0 == 6'h0; // @[LoadQueueReplay.scala 223:50]
  wire  _GEN_1 = blockByCacheMiss_0 & creditUpdate_0 == 6'h0 ? 1'h0 : _blockByCacheMiss_0_T_3; // @[LoadQueueReplay.scala 220:25 223:{59,81}]
  wire  _GEN_2 = blockByTlbMiss_0 & _T_3 ? 1'h0 : blockByTlbMiss_0; // @[LoadQueueReplay.scala 151:31 224:{57,77}]
  wire  _GEN_3 = blockByOthers_0 & _T_3 ? 1'h0 : blockByOthers_0; // @[LoadQueueReplay.scala 155:30 225:{56,75}]
  wire  _blockByForwardFail_1_T_1 = blockByForwardFail_1 & stDataDeqVec_1 ? 1'h0 : blockByForwardFail_1; // @[LoadQueueReplay.scala 218:33]
  wire  _blockByWaitStore_1_T_1 = blockByWaitStore_1 & stAddrDeqVec_1 ? 1'h0 : blockByWaitStore_1; // @[LoadQueueReplay.scala 219:31]
  wire  _blockByCacheMiss_1_T_3 = _T_11 ? 1'h0 : blockByCacheMiss_1; // @[LoadQueueReplay.scala 220:31]
  wire  _T_12 = creditUpdate_1 == 6'h0; // @[LoadQueueReplay.scala 223:50]
  wire  _GEN_5 = blockByCacheMiss_1 & creditUpdate_1 == 6'h0 ? 1'h0 : _blockByCacheMiss_1_T_3; // @[LoadQueueReplay.scala 220:25 223:{59,81}]
  wire  _GEN_6 = blockByTlbMiss_1 & _T_12 ? 1'h0 : blockByTlbMiss_1; // @[LoadQueueReplay.scala 151:31 224:{57,77}]
  wire  _GEN_7 = blockByOthers_1 & _T_12 ? 1'h0 : blockByOthers_1; // @[LoadQueueReplay.scala 155:30 225:{56,75}]
  wire  _blockByForwardFail_2_T_1 = blockByForwardFail_2 & stDataDeqVec_2 ? 1'h0 : blockByForwardFail_2; // @[LoadQueueReplay.scala 218:33]
  wire  _blockByWaitStore_2_T_1 = blockByWaitStore_2 & stAddrDeqVec_2 ? 1'h0 : blockByWaitStore_2; // @[LoadQueueReplay.scala 219:31]
  wire  _blockByCacheMiss_2_T_3 = _T_20 ? 1'h0 : blockByCacheMiss_2; // @[LoadQueueReplay.scala 220:31]
  wire  _T_21 = creditUpdate_2 == 6'h0; // @[LoadQueueReplay.scala 223:50]
  wire  _GEN_9 = blockByCacheMiss_2 & creditUpdate_2 == 6'h0 ? 1'h0 : _blockByCacheMiss_2_T_3; // @[LoadQueueReplay.scala 220:25 223:{59,81}]
  wire  _GEN_10 = blockByTlbMiss_2 & _T_21 ? 1'h0 : blockByTlbMiss_2; // @[LoadQueueReplay.scala 151:31 224:{57,77}]
  wire  _GEN_11 = blockByOthers_2 & _T_21 ? 1'h0 : blockByOthers_2; // @[LoadQueueReplay.scala 155:30 225:{56,75}]
  wire  _blockByForwardFail_3_T_1 = blockByForwardFail_3 & stDataDeqVec_3 ? 1'h0 : blockByForwardFail_3; // @[LoadQueueReplay.scala 218:33]
  wire  _blockByWaitStore_3_T_1 = blockByWaitStore_3 & stAddrDeqVec_3 ? 1'h0 : blockByWaitStore_3; // @[LoadQueueReplay.scala 219:31]
  wire  _blockByCacheMiss_3_T_3 = _T_29 ? 1'h0 : blockByCacheMiss_3; // @[LoadQueueReplay.scala 220:31]
  wire  _T_30 = creditUpdate_3 == 6'h0; // @[LoadQueueReplay.scala 223:50]
  wire  _GEN_13 = blockByCacheMiss_3 & creditUpdate_3 == 6'h0 ? 1'h0 : _blockByCacheMiss_3_T_3; // @[LoadQueueReplay.scala 220:25 223:{59,81}]
  wire  _GEN_14 = blockByTlbMiss_3 & _T_30 ? 1'h0 : blockByTlbMiss_3; // @[LoadQueueReplay.scala 151:31 224:{57,77}]
  wire  _GEN_15 = blockByOthers_3 & _T_30 ? 1'h0 : blockByOthers_3; // @[LoadQueueReplay.scala 155:30 225:{56,75}]
  wire  _blockByForwardFail_4_T_1 = blockByForwardFail_4 & stDataDeqVec_4 ? 1'h0 : blockByForwardFail_4; // @[LoadQueueReplay.scala 218:33]
  wire  _blockByWaitStore_4_T_1 = blockByWaitStore_4 & stAddrDeqVec_4 ? 1'h0 : blockByWaitStore_4; // @[LoadQueueReplay.scala 219:31]
  wire  _blockByCacheMiss_4_T_3 = _T_38 ? 1'h0 : blockByCacheMiss_4; // @[LoadQueueReplay.scala 220:31]
  wire  _T_39 = creditUpdate_4 == 6'h0; // @[LoadQueueReplay.scala 223:50]
  wire  _GEN_17 = blockByCacheMiss_4 & creditUpdate_4 == 6'h0 ? 1'h0 : _blockByCacheMiss_4_T_3; // @[LoadQueueReplay.scala 220:25 223:{59,81}]
  wire  _GEN_18 = blockByTlbMiss_4 & _T_39 ? 1'h0 : blockByTlbMiss_4; // @[LoadQueueReplay.scala 151:31 224:{57,77}]
  wire  _GEN_19 = blockByOthers_4 & _T_39 ? 1'h0 : blockByOthers_4; // @[LoadQueueReplay.scala 155:30 225:{56,75}]
  wire  _blockByForwardFail_5_T_1 = blockByForwardFail_5 & stDataDeqVec_5 ? 1'h0 : blockByForwardFail_5; // @[LoadQueueReplay.scala 218:33]
  wire  _blockByWaitStore_5_T_1 = blockByWaitStore_5 & stAddrDeqVec_5 ? 1'h0 : blockByWaitStore_5; // @[LoadQueueReplay.scala 219:31]
  wire  _blockByCacheMiss_5_T_3 = _T_47 ? 1'h0 : blockByCacheMiss_5; // @[LoadQueueReplay.scala 220:31]
  wire  _T_48 = creditUpdate_5 == 6'h0; // @[LoadQueueReplay.scala 223:50]
  wire  _GEN_21 = blockByCacheMiss_5 & creditUpdate_5 == 6'h0 ? 1'h0 : _blockByCacheMiss_5_T_3; // @[LoadQueueReplay.scala 220:25 223:{59,81}]
  wire  _GEN_22 = blockByTlbMiss_5 & _T_48 ? 1'h0 : blockByTlbMiss_5; // @[LoadQueueReplay.scala 151:31 224:{57,77}]
  wire  _GEN_23 = blockByOthers_5 & _T_48 ? 1'h0 : blockByOthers_5; // @[LoadQueueReplay.scala 155:30 225:{56,75}]
  wire  _blockByForwardFail_6_T_1 = blockByForwardFail_6 & stDataDeqVec_6 ? 1'h0 : blockByForwardFail_6; // @[LoadQueueReplay.scala 218:33]
  wire  _blockByWaitStore_6_T_1 = blockByWaitStore_6 & stAddrDeqVec_6 ? 1'h0 : blockByWaitStore_6; // @[LoadQueueReplay.scala 219:31]
  wire  _blockByCacheMiss_6_T_3 = _T_56 ? 1'h0 : blockByCacheMiss_6; // @[LoadQueueReplay.scala 220:31]
  wire  _T_57 = creditUpdate_6 == 6'h0; // @[LoadQueueReplay.scala 223:50]
  wire  _GEN_25 = blockByCacheMiss_6 & creditUpdate_6 == 6'h0 ? 1'h0 : _blockByCacheMiss_6_T_3; // @[LoadQueueReplay.scala 220:25 223:{59,81}]
  wire  _GEN_26 = blockByTlbMiss_6 & _T_57 ? 1'h0 : blockByTlbMiss_6; // @[LoadQueueReplay.scala 151:31 224:{57,77}]
  wire  _GEN_27 = blockByOthers_6 & _T_57 ? 1'h0 : blockByOthers_6; // @[LoadQueueReplay.scala 155:30 225:{56,75}]
  wire  _blockByForwardFail_7_T_1 = blockByForwardFail_7 & stDataDeqVec_7 ? 1'h0 : blockByForwardFail_7; // @[LoadQueueReplay.scala 218:33]
  wire  _blockByWaitStore_7_T_1 = blockByWaitStore_7 & stAddrDeqVec_7 ? 1'h0 : blockByWaitStore_7; // @[LoadQueueReplay.scala 219:31]
  wire  _blockByCacheMiss_7_T_3 = _T_65 ? 1'h0 : blockByCacheMiss_7; // @[LoadQueueReplay.scala 220:31]
  wire  _T_66 = creditUpdate_7 == 6'h0; // @[LoadQueueReplay.scala 223:50]
  wire  _GEN_29 = blockByCacheMiss_7 & creditUpdate_7 == 6'h0 ? 1'h0 : _blockByCacheMiss_7_T_3; // @[LoadQueueReplay.scala 220:25 223:{59,81}]
  wire  _GEN_30 = blockByTlbMiss_7 & _T_66 ? 1'h0 : blockByTlbMiss_7; // @[LoadQueueReplay.scala 151:31 224:{57,77}]
  wire  _GEN_31 = blockByOthers_7 & _T_66 ? 1'h0 : blockByOthers_7; // @[LoadQueueReplay.scala 155:30 225:{56,75}]
  wire  _blockByForwardFail_8_T_1 = blockByForwardFail_8 & stDataDeqVec_8 ? 1'h0 : blockByForwardFail_8; // @[LoadQueueReplay.scala 218:33]
  wire  _blockByWaitStore_8_T_1 = blockByWaitStore_8 & stAddrDeqVec_8 ? 1'h0 : blockByWaitStore_8; // @[LoadQueueReplay.scala 219:31]
  wire  _blockByCacheMiss_8_T_3 = _T_74 ? 1'h0 : blockByCacheMiss_8; // @[LoadQueueReplay.scala 220:31]
  wire  _T_75 = creditUpdate_8 == 6'h0; // @[LoadQueueReplay.scala 223:50]
  wire  _GEN_33 = blockByCacheMiss_8 & creditUpdate_8 == 6'h0 ? 1'h0 : _blockByCacheMiss_8_T_3; // @[LoadQueueReplay.scala 220:25 223:{59,81}]
  wire  _GEN_34 = blockByTlbMiss_8 & _T_75 ? 1'h0 : blockByTlbMiss_8; // @[LoadQueueReplay.scala 151:31 224:{57,77}]
  wire  _GEN_35 = blockByOthers_8 & _T_75 ? 1'h0 : blockByOthers_8; // @[LoadQueueReplay.scala 155:30 225:{56,75}]
  wire  _blockByForwardFail_9_T_1 = blockByForwardFail_9 & stDataDeqVec_9 ? 1'h0 : blockByForwardFail_9; // @[LoadQueueReplay.scala 218:33]
  wire  _blockByWaitStore_9_T_1 = blockByWaitStore_9 & stAddrDeqVec_9 ? 1'h0 : blockByWaitStore_9; // @[LoadQueueReplay.scala 219:31]
  wire  _blockByCacheMiss_9_T_3 = _T_83 ? 1'h0 : blockByCacheMiss_9; // @[LoadQueueReplay.scala 220:31]
  wire  _T_84 = creditUpdate_9 == 6'h0; // @[LoadQueueReplay.scala 223:50]
  wire  _GEN_37 = blockByCacheMiss_9 & creditUpdate_9 == 6'h0 ? 1'h0 : _blockByCacheMiss_9_T_3; // @[LoadQueueReplay.scala 220:25 223:{59,81}]
  wire  _GEN_38 = blockByTlbMiss_9 & _T_84 ? 1'h0 : blockByTlbMiss_9; // @[LoadQueueReplay.scala 151:31 224:{57,77}]
  wire  _GEN_39 = blockByOthers_9 & _T_84 ? 1'h0 : blockByOthers_9; // @[LoadQueueReplay.scala 155:30 225:{56,75}]
  wire  _blockByForwardFail_10_T_1 = blockByForwardFail_10 & stDataDeqVec_10 ? 1'h0 : blockByForwardFail_10; // @[LoadQueueReplay.scala 218:33]
  wire  _blockByWaitStore_10_T_1 = blockByWaitStore_10 & stAddrDeqVec_10 ? 1'h0 : blockByWaitStore_10; // @[LoadQueueReplay.scala 219:31]
  wire  _blockByCacheMiss_10_T_3 = _T_92 ? 1'h0 : blockByCacheMiss_10; // @[LoadQueueReplay.scala 220:31]
  wire  _T_93 = creditUpdate_10 == 6'h0; // @[LoadQueueReplay.scala 223:50]
  wire  _GEN_41 = blockByCacheMiss_10 & creditUpdate_10 == 6'h0 ? 1'h0 : _blockByCacheMiss_10_T_3; // @[LoadQueueReplay.scala 220:25 223:{59,81}]
  wire  _GEN_42 = blockByTlbMiss_10 & _T_93 ? 1'h0 : blockByTlbMiss_10; // @[LoadQueueReplay.scala 151:31 224:{57,77}]
  wire  _GEN_43 = blockByOthers_10 & _T_93 ? 1'h0 : blockByOthers_10; // @[LoadQueueReplay.scala 155:30 225:{56,75}]
  wire  _blockByForwardFail_11_T_1 = blockByForwardFail_11 & stDataDeqVec_11 ? 1'h0 : blockByForwardFail_11; // @[LoadQueueReplay.scala 218:33]
  wire  _blockByWaitStore_11_T_1 = blockByWaitStore_11 & stAddrDeqVec_11 ? 1'h0 : blockByWaitStore_11; // @[LoadQueueReplay.scala 219:31]
  wire  _blockByCacheMiss_11_T_3 = _T_101 ? 1'h0 : blockByCacheMiss_11; // @[LoadQueueReplay.scala 220:31]
  wire  _T_102 = creditUpdate_11 == 6'h0; // @[LoadQueueReplay.scala 223:50]
  wire  _GEN_45 = blockByCacheMiss_11 & creditUpdate_11 == 6'h0 ? 1'h0 : _blockByCacheMiss_11_T_3; // @[LoadQueueReplay.scala 220:25 223:{59,81}]
  wire  _GEN_46 = blockByTlbMiss_11 & _T_102 ? 1'h0 : blockByTlbMiss_11; // @[LoadQueueReplay.scala 151:31 224:{57,77}]
  wire  _GEN_47 = blockByOthers_11 & _T_102 ? 1'h0 : blockByOthers_11; // @[LoadQueueReplay.scala 155:30 225:{56,75}]
  wire  _blockByForwardFail_12_T_1 = blockByForwardFail_12 & stDataDeqVec_12 ? 1'h0 : blockByForwardFail_12; // @[LoadQueueReplay.scala 218:33]
  wire  _blockByWaitStore_12_T_1 = blockByWaitStore_12 & stAddrDeqVec_12 ? 1'h0 : blockByWaitStore_12; // @[LoadQueueReplay.scala 219:31]
  wire  _blockByCacheMiss_12_T_3 = _T_110 ? 1'h0 : blockByCacheMiss_12; // @[LoadQueueReplay.scala 220:31]
  wire  _T_111 = creditUpdate_12 == 6'h0; // @[LoadQueueReplay.scala 223:50]
  wire  _GEN_49 = blockByCacheMiss_12 & creditUpdate_12 == 6'h0 ? 1'h0 : _blockByCacheMiss_12_T_3; // @[LoadQueueReplay.scala 220:25 223:{59,81}]
  wire  _GEN_50 = blockByTlbMiss_12 & _T_111 ? 1'h0 : blockByTlbMiss_12; // @[LoadQueueReplay.scala 151:31 224:{57,77}]
  wire  _GEN_51 = blockByOthers_12 & _T_111 ? 1'h0 : blockByOthers_12; // @[LoadQueueReplay.scala 155:30 225:{56,75}]
  wire  _blockByForwardFail_13_T_1 = blockByForwardFail_13 & stDataDeqVec_13 ? 1'h0 : blockByForwardFail_13; // @[LoadQueueReplay.scala 218:33]
  wire  _blockByWaitStore_13_T_1 = blockByWaitStore_13 & stAddrDeqVec_13 ? 1'h0 : blockByWaitStore_13; // @[LoadQueueReplay.scala 219:31]
  wire  _blockByCacheMiss_13_T_3 = _T_119 ? 1'h0 : blockByCacheMiss_13; // @[LoadQueueReplay.scala 220:31]
  wire  _T_120 = creditUpdate_13 == 6'h0; // @[LoadQueueReplay.scala 223:50]
  wire  _GEN_53 = blockByCacheMiss_13 & creditUpdate_13 == 6'h0 ? 1'h0 : _blockByCacheMiss_13_T_3; // @[LoadQueueReplay.scala 220:25 223:{59,81}]
  wire  _GEN_54 = blockByTlbMiss_13 & _T_120 ? 1'h0 : blockByTlbMiss_13; // @[LoadQueueReplay.scala 151:31 224:{57,77}]
  wire  _GEN_55 = blockByOthers_13 & _T_120 ? 1'h0 : blockByOthers_13; // @[LoadQueueReplay.scala 155:30 225:{56,75}]
  wire  _blockByForwardFail_14_T_1 = blockByForwardFail_14 & stDataDeqVec_14 ? 1'h0 : blockByForwardFail_14; // @[LoadQueueReplay.scala 218:33]
  wire  _blockByWaitStore_14_T_1 = blockByWaitStore_14 & stAddrDeqVec_14 ? 1'h0 : blockByWaitStore_14; // @[LoadQueueReplay.scala 219:31]
  wire  _blockByCacheMiss_14_T_3 = _T_128 ? 1'h0 : blockByCacheMiss_14; // @[LoadQueueReplay.scala 220:31]
  wire  _T_129 = creditUpdate_14 == 6'h0; // @[LoadQueueReplay.scala 223:50]
  wire  _GEN_57 = blockByCacheMiss_14 & creditUpdate_14 == 6'h0 ? 1'h0 : _blockByCacheMiss_14_T_3; // @[LoadQueueReplay.scala 220:25 223:{59,81}]
  wire  _GEN_58 = blockByTlbMiss_14 & _T_129 ? 1'h0 : blockByTlbMiss_14; // @[LoadQueueReplay.scala 151:31 224:{57,77}]
  wire  _GEN_59 = blockByOthers_14 & _T_129 ? 1'h0 : blockByOthers_14; // @[LoadQueueReplay.scala 155:30 225:{56,75}]
  wire  _blockByForwardFail_15_T_1 = blockByForwardFail_15 & stDataDeqVec_15 ? 1'h0 : blockByForwardFail_15; // @[LoadQueueReplay.scala 218:33]
  wire  _blockByWaitStore_15_T_1 = blockByWaitStore_15 & stAddrDeqVec_15 ? 1'h0 : blockByWaitStore_15; // @[LoadQueueReplay.scala 219:31]
  wire  _blockByCacheMiss_15_T_3 = _T_137 ? 1'h0 : blockByCacheMiss_15; // @[LoadQueueReplay.scala 220:31]
  wire  _T_138 = creditUpdate_15 == 6'h0; // @[LoadQueueReplay.scala 223:50]
  wire  _GEN_61 = blockByCacheMiss_15 & creditUpdate_15 == 6'h0 ? 1'h0 : _blockByCacheMiss_15_T_3; // @[LoadQueueReplay.scala 220:25 223:{59,81}]
  wire  _GEN_62 = blockByTlbMiss_15 & _T_138 ? 1'h0 : blockByTlbMiss_15; // @[LoadQueueReplay.scala 151:31 224:{57,77}]
  wire  _GEN_63 = blockByOthers_15 & _T_138 ? 1'h0 : blockByOthers_15; // @[LoadQueueReplay.scala 155:30 225:{56,75}]
  reg  s1_blockLoadMask_0; // @[LoadQueueReplay.scala 247:33]
  reg  s1_blockLoadMask_1; // @[LoadQueueReplay.scala 247:33]
  reg  s1_blockLoadMask_2; // @[LoadQueueReplay.scala 247:33]
  reg  s1_blockLoadMask_3; // @[LoadQueueReplay.scala 247:33]
  reg  s1_blockLoadMask_4; // @[LoadQueueReplay.scala 247:33]
  reg  s1_blockLoadMask_5; // @[LoadQueueReplay.scala 247:33]
  reg  s1_blockLoadMask_6; // @[LoadQueueReplay.scala 247:33]
  reg  s1_blockLoadMask_7; // @[LoadQueueReplay.scala 247:33]
  reg  s1_blockLoadMask_8; // @[LoadQueueReplay.scala 247:33]
  reg  s1_blockLoadMask_9; // @[LoadQueueReplay.scala 247:33]
  reg  s1_blockLoadMask_10; // @[LoadQueueReplay.scala 247:33]
  reg  s1_blockLoadMask_11; // @[LoadQueueReplay.scala 247:33]
  reg  s1_blockLoadMask_12; // @[LoadQueueReplay.scala 247:33]
  reg  s1_blockLoadMask_13; // @[LoadQueueReplay.scala 247:33]
  reg  s1_blockLoadMask_14; // @[LoadQueueReplay.scala 247:33]
  reg  s1_blockLoadMask_15; // @[LoadQueueReplay.scala 247:33]
  reg  s2_blockLoadMask_0; // @[LoadQueueReplay.scala 248:33]
  reg  s2_blockLoadMask_1; // @[LoadQueueReplay.scala 248:33]
  reg  s2_blockLoadMask_2; // @[LoadQueueReplay.scala 248:33]
  reg  s2_blockLoadMask_3; // @[LoadQueueReplay.scala 248:33]
  reg  s2_blockLoadMask_4; // @[LoadQueueReplay.scala 248:33]
  reg  s2_blockLoadMask_5; // @[LoadQueueReplay.scala 248:33]
  reg  s2_blockLoadMask_6; // @[LoadQueueReplay.scala 248:33]
  reg  s2_blockLoadMask_7; // @[LoadQueueReplay.scala 248:33]
  reg  s2_blockLoadMask_8; // @[LoadQueueReplay.scala 248:33]
  reg  s2_blockLoadMask_9; // @[LoadQueueReplay.scala 248:33]
  reg  s2_blockLoadMask_10; // @[LoadQueueReplay.scala 248:33]
  reg  s2_blockLoadMask_11; // @[LoadQueueReplay.scala 248:33]
  reg  s2_blockLoadMask_12; // @[LoadQueueReplay.scala 248:33]
  reg  s2_blockLoadMask_13; // @[LoadQueueReplay.scala 248:33]
  reg  s2_blockLoadMask_14; // @[LoadQueueReplay.scala 248:33]
  reg  s2_blockLoadMask_15; // @[LoadQueueReplay.scala 248:33]
  wire  _loadReplaySelVec_blocked_T_92 = s1_blockLoadMask_15 | s2_blockLoadMask_15 | selBlocked_15 | blockByTlbMiss_15; // @[LoadQueueReplay.scala 255:79]
  wire  loadReplaySelVec_blocked_15 = _loadReplaySelVec_blocked_T_92 | blockByForwardFail_15 | blockByCacheMiss_15 |
    blockByWaitStore_15 | blockByOthers_15; // @[LoadQueueReplay.scala 256:106]
  wire  _loadReplaySelVec_T_31 = allocated_15 & ~loadReplaySelVec_blocked_15; // @[LoadQueueReplay.scala 257:18]
  wire  _loadReplaySelVec_blocked_T_86 = s1_blockLoadMask_14 | s2_blockLoadMask_14 | selBlocked_14 | blockByTlbMiss_14; // @[LoadQueueReplay.scala 255:79]
  wire  loadReplaySelVec_blocked_14 = _loadReplaySelVec_blocked_T_86 | blockByForwardFail_14 | blockByCacheMiss_14 |
    blockByWaitStore_14 | blockByOthers_14; // @[LoadQueueReplay.scala 256:106]
  wire  _loadReplaySelVec_T_29 = allocated_14 & ~loadReplaySelVec_blocked_14; // @[LoadQueueReplay.scala 257:18]
  wire  _loadReplaySelVec_blocked_T_80 = s1_blockLoadMask_13 | s2_blockLoadMask_13 | selBlocked_13 | blockByTlbMiss_13; // @[LoadQueueReplay.scala 255:79]
  wire  loadReplaySelVec_blocked_13 = _loadReplaySelVec_blocked_T_80 | blockByForwardFail_13 | blockByCacheMiss_13 |
    blockByWaitStore_13 | blockByOthers_13; // @[LoadQueueReplay.scala 256:106]
  wire  _loadReplaySelVec_T_27 = allocated_13 & ~loadReplaySelVec_blocked_13; // @[LoadQueueReplay.scala 257:18]
  wire  _loadReplaySelVec_blocked_T_74 = s1_blockLoadMask_12 | s2_blockLoadMask_12 | selBlocked_12 | blockByTlbMiss_12; // @[LoadQueueReplay.scala 255:79]
  wire  loadReplaySelVec_blocked_12 = _loadReplaySelVec_blocked_T_74 | blockByForwardFail_12 | blockByCacheMiss_12 |
    blockByWaitStore_12 | blockByOthers_12; // @[LoadQueueReplay.scala 256:106]
  wire  _loadReplaySelVec_T_25 = allocated_12 & ~loadReplaySelVec_blocked_12; // @[LoadQueueReplay.scala 257:18]
  wire  _loadReplaySelVec_blocked_T_68 = s1_blockLoadMask_11 | s2_blockLoadMask_11 | selBlocked_11 | blockByTlbMiss_11; // @[LoadQueueReplay.scala 255:79]
  wire  loadReplaySelVec_blocked_11 = _loadReplaySelVec_blocked_T_68 | blockByForwardFail_11 | blockByCacheMiss_11 |
    blockByWaitStore_11 | blockByOthers_11; // @[LoadQueueReplay.scala 256:106]
  wire  _loadReplaySelVec_T_23 = allocated_11 & ~loadReplaySelVec_blocked_11; // @[LoadQueueReplay.scala 257:18]
  wire  _loadReplaySelVec_blocked_T_62 = s1_blockLoadMask_10 | s2_blockLoadMask_10 | selBlocked_10 | blockByTlbMiss_10; // @[LoadQueueReplay.scala 255:79]
  wire  loadReplaySelVec_blocked_10 = _loadReplaySelVec_blocked_T_62 | blockByForwardFail_10 | blockByCacheMiss_10 |
    blockByWaitStore_10 | blockByOthers_10; // @[LoadQueueReplay.scala 256:106]
  wire  _loadReplaySelVec_T_21 = allocated_10 & ~loadReplaySelVec_blocked_10; // @[LoadQueueReplay.scala 257:18]
  wire  _loadReplaySelVec_blocked_T_56 = s1_blockLoadMask_9 | s2_blockLoadMask_9 | selBlocked_9 | blockByTlbMiss_9; // @[LoadQueueReplay.scala 255:79]
  wire  loadReplaySelVec_blocked_9 = _loadReplaySelVec_blocked_T_56 | blockByForwardFail_9 | blockByCacheMiss_9 |
    blockByWaitStore_9 | blockByOthers_9; // @[LoadQueueReplay.scala 256:106]
  wire  _loadReplaySelVec_T_19 = allocated_9 & ~loadReplaySelVec_blocked_9; // @[LoadQueueReplay.scala 257:18]
  wire  _loadReplaySelVec_blocked_T_50 = s1_blockLoadMask_8 | s2_blockLoadMask_8 | selBlocked_8 | blockByTlbMiss_8; // @[LoadQueueReplay.scala 255:79]
  wire  loadReplaySelVec_blocked_8 = _loadReplaySelVec_blocked_T_50 | blockByForwardFail_8 | blockByCacheMiss_8 |
    blockByWaitStore_8 | blockByOthers_8; // @[LoadQueueReplay.scala 256:106]
  wire  _loadReplaySelVec_T_17 = allocated_8 & ~loadReplaySelVec_blocked_8; // @[LoadQueueReplay.scala 257:18]
  wire  _loadReplaySelVec_blocked_T_44 = s1_blockLoadMask_7 | s2_blockLoadMask_7 | selBlocked_7 | blockByTlbMiss_7; // @[LoadQueueReplay.scala 255:79]
  wire  loadReplaySelVec_blocked_7 = _loadReplaySelVec_blocked_T_44 | blockByForwardFail_7 | blockByCacheMiss_7 |
    blockByWaitStore_7 | blockByOthers_7; // @[LoadQueueReplay.scala 256:106]
  wire  _loadReplaySelVec_T_15 = allocated_7 & ~loadReplaySelVec_blocked_7; // @[LoadQueueReplay.scala 257:18]
  wire  _loadReplaySelVec_blocked_T_38 = s1_blockLoadMask_6 | s2_blockLoadMask_6 | selBlocked_6 | blockByTlbMiss_6; // @[LoadQueueReplay.scala 255:79]
  wire  loadReplaySelVec_blocked_6 = _loadReplaySelVec_blocked_T_38 | blockByForwardFail_6 | blockByCacheMiss_6 |
    blockByWaitStore_6 | blockByOthers_6; // @[LoadQueueReplay.scala 256:106]
  wire  _loadReplaySelVec_T_13 = allocated_6 & ~loadReplaySelVec_blocked_6; // @[LoadQueueReplay.scala 257:18]
  wire  _loadReplaySelVec_blocked_T_32 = s1_blockLoadMask_5 | s2_blockLoadMask_5 | selBlocked_5 | blockByTlbMiss_5; // @[LoadQueueReplay.scala 255:79]
  wire  loadReplaySelVec_blocked_5 = _loadReplaySelVec_blocked_T_32 | blockByForwardFail_5 | blockByCacheMiss_5 |
    blockByWaitStore_5 | blockByOthers_5; // @[LoadQueueReplay.scala 256:106]
  wire  _loadReplaySelVec_T_11 = allocated_5 & ~loadReplaySelVec_blocked_5; // @[LoadQueueReplay.scala 257:18]
  wire  _loadReplaySelVec_blocked_T_26 = s1_blockLoadMask_4 | s2_blockLoadMask_4 | selBlocked_4 | blockByTlbMiss_4; // @[LoadQueueReplay.scala 255:79]
  wire  loadReplaySelVec_blocked_4 = _loadReplaySelVec_blocked_T_26 | blockByForwardFail_4 | blockByCacheMiss_4 |
    blockByWaitStore_4 | blockByOthers_4; // @[LoadQueueReplay.scala 256:106]
  wire  _loadReplaySelVec_T_9 = allocated_4 & ~loadReplaySelVec_blocked_4; // @[LoadQueueReplay.scala 257:18]
  wire  _loadReplaySelVec_blocked_T_20 = s1_blockLoadMask_3 | s2_blockLoadMask_3 | selBlocked_3 | blockByTlbMiss_3; // @[LoadQueueReplay.scala 255:79]
  wire  loadReplaySelVec_blocked_3 = _loadReplaySelVec_blocked_T_20 | blockByForwardFail_3 | blockByCacheMiss_3 |
    blockByWaitStore_3 | blockByOthers_3; // @[LoadQueueReplay.scala 256:106]
  wire  _loadReplaySelVec_T_7 = allocated_3 & ~loadReplaySelVec_blocked_3; // @[LoadQueueReplay.scala 257:18]
  wire  _loadReplaySelVec_blocked_T_14 = s1_blockLoadMask_2 | s2_blockLoadMask_2 | selBlocked_2 | blockByTlbMiss_2; // @[LoadQueueReplay.scala 255:79]
  wire  loadReplaySelVec_blocked_2 = _loadReplaySelVec_blocked_T_14 | blockByForwardFail_2 | blockByCacheMiss_2 |
    blockByWaitStore_2 | blockByOthers_2; // @[LoadQueueReplay.scala 256:106]
  wire  _loadReplaySelVec_T_5 = allocated_2 & ~loadReplaySelVec_blocked_2; // @[LoadQueueReplay.scala 257:18]
  wire  _loadReplaySelVec_blocked_T_8 = s1_blockLoadMask_1 | s2_blockLoadMask_1 | selBlocked_1 | blockByTlbMiss_1; // @[LoadQueueReplay.scala 255:79]
  wire  loadReplaySelVec_blocked_1 = _loadReplaySelVec_blocked_T_8 | blockByForwardFail_1 | blockByCacheMiss_1 |
    blockByWaitStore_1 | blockByOthers_1; // @[LoadQueueReplay.scala 256:106]
  wire  _loadReplaySelVec_T_3 = allocated_1 & ~loadReplaySelVec_blocked_1; // @[LoadQueueReplay.scala 257:18]
  wire  _loadReplaySelVec_blocked_T_2 = s1_blockLoadMask_0 | s2_blockLoadMask_0 | selBlocked_0 | blockByTlbMiss_0; // @[LoadQueueReplay.scala 255:79]
  wire  loadReplaySelVec_blocked = _loadReplaySelVec_blocked_T_2 | blockByForwardFail_0 | blockByCacheMiss_0 |
    blockByWaitStore_0 | blockByOthers_0; // @[LoadQueueReplay.scala 256:106]
  wire  _loadReplaySelVec_T_1 = allocated_0 & ~loadReplaySelVec_blocked; // @[LoadQueueReplay.scala 257:18]
  wire [7:0] loadReplaySelVec_lo = {_loadReplaySelVec_T_15,_loadReplaySelVec_T_13,_loadReplaySelVec_T_11,
    _loadReplaySelVec_T_9,_loadReplaySelVec_T_7,_loadReplaySelVec_T_5,_loadReplaySelVec_T_3,_loadReplaySelVec_T_1}; // @[LoadQueueReplay.scala 258:7]
  wire [15:0] loadReplaySelVec = {_loadReplaySelVec_T_31,_loadReplaySelVec_T_29,_loadReplaySelVec_T_27,
    _loadReplaySelVec_T_25,_loadReplaySelVec_T_23,_loadReplaySelVec_T_21,_loadReplaySelVec_T_19,_loadReplaySelVec_T_17,
    loadReplaySelVec_lo}; // @[LoadQueueReplay.scala 258:7]
  wire  oldestMask_1 = loadReplaySelVec[1] & blockCounter_1 == 5'h10; // @[LoadQueueReplay.scala 261:42]
  wire  oldestMask_0 = loadReplaySelVec[0] & blockCounter_0 == 5'h10; // @[LoadQueueReplay.scala 261:42]
  wire  oldestMask_3 = loadReplaySelVec[3] & blockCounter_3 == 5'h10; // @[LoadQueueReplay.scala 261:42]
  wire  oldestMask_2 = loadReplaySelVec[2] & blockCounter_2 == 5'h10; // @[LoadQueueReplay.scala 261:42]
  wire  oldestMask_5 = loadReplaySelVec[5] & blockCounter_5 == 5'h10; // @[LoadQueueReplay.scala 261:42]
  wire  oldestMask_4 = loadReplaySelVec[4] & blockCounter_4 == 5'h10; // @[LoadQueueReplay.scala 261:42]
  wire  oldestMask_7 = loadReplaySelVec[7] & blockCounter_7 == 5'h10; // @[LoadQueueReplay.scala 261:42]
  wire  oldestMask_6 = loadReplaySelVec[6] & blockCounter_6 == 5'h10; // @[LoadQueueReplay.scala 261:42]
  wire [7:0] oldestMaskUInt_lo = {oldestMask_7,oldestMask_6,oldestMask_5,oldestMask_4,oldestMask_3,oldestMask_2,
    oldestMask_1,oldestMask_0}; // @[LoadQueueReplay.scala 251:35]
  wire  oldestMask_9 = loadReplaySelVec[9] & blockCounter_9 == 5'h10; // @[LoadQueueReplay.scala 261:42]
  wire  oldestMask_8 = loadReplaySelVec[8] & blockCounter_8 == 5'h10; // @[LoadQueueReplay.scala 261:42]
  wire  oldestMask_11 = loadReplaySelVec[11] & blockCounter_11 == 5'h10; // @[LoadQueueReplay.scala 261:42]
  wire  oldestMask_10 = loadReplaySelVec[10] & blockCounter_10 == 5'h10; // @[LoadQueueReplay.scala 261:42]
  wire  oldestMask_13 = loadReplaySelVec[13] & blockCounter_13 == 5'h10; // @[LoadQueueReplay.scala 261:42]
  wire  oldestMask_12 = loadReplaySelVec[12] & blockCounter_12 == 5'h10; // @[LoadQueueReplay.scala 261:42]
  wire  oldestMask_15 = loadReplaySelVec[15] & blockCounter_15 == 5'h10; // @[LoadQueueReplay.scala 261:42]
  wire  oldestMask_14 = loadReplaySelVec[14] & blockCounter_14 == 5'h10; // @[LoadQueueReplay.scala 261:42]
  wire [15:0] oldestMaskUInt = {oldestMask_15,oldestMask_14,oldestMask_13,oldestMask_12,oldestMask_11,oldestMask_10,
    oldestMask_9,oldestMask_8,oldestMaskUInt_lo}; // @[LoadQueueReplay.scala 251:35]
  wire  _blockCounter_0_T_3 = |oldestMaskUInt; // @[LoadQueueReplay.scala 266:95]
  wire [4:0] _blockCounter_0_T_7 = blockCounter_0 + 5'h1; // @[LoadQueueReplay.scala 266:116]
  wire [4:0] _blockCounter_0_T_8 = blockCounter_0 != 5'h10 & loadReplaySelVec[0] & ~(|oldestMaskUInt) ?
    _blockCounter_0_T_7 : blockCounter_0; // @[LoadQueueReplay.scala 266:27]
  wire [4:0] _blockCounter_1_T_7 = blockCounter_1 + 5'h1; // @[LoadQueueReplay.scala 266:116]
  wire [4:0] _blockCounter_1_T_8 = blockCounter_1 != 5'h10 & loadReplaySelVec[1] & ~(|oldestMaskUInt) ?
    _blockCounter_1_T_7 : blockCounter_1; // @[LoadQueueReplay.scala 266:27]
  wire [4:0] _blockCounter_2_T_7 = blockCounter_2 + 5'h1; // @[LoadQueueReplay.scala 266:116]
  wire [4:0] _blockCounter_2_T_8 = blockCounter_2 != 5'h10 & loadReplaySelVec[2] & ~(|oldestMaskUInt) ?
    _blockCounter_2_T_7 : blockCounter_2; // @[LoadQueueReplay.scala 266:27]
  wire [4:0] _blockCounter_3_T_7 = blockCounter_3 + 5'h1; // @[LoadQueueReplay.scala 266:116]
  wire [4:0] _blockCounter_3_T_8 = blockCounter_3 != 5'h10 & loadReplaySelVec[3] & ~(|oldestMaskUInt) ?
    _blockCounter_3_T_7 : blockCounter_3; // @[LoadQueueReplay.scala 266:27]
  wire [4:0] _blockCounter_4_T_7 = blockCounter_4 + 5'h1; // @[LoadQueueReplay.scala 266:116]
  wire [4:0] _blockCounter_4_T_8 = blockCounter_4 != 5'h10 & loadReplaySelVec[4] & ~(|oldestMaskUInt) ?
    _blockCounter_4_T_7 : blockCounter_4; // @[LoadQueueReplay.scala 266:27]
  wire [4:0] _blockCounter_5_T_7 = blockCounter_5 + 5'h1; // @[LoadQueueReplay.scala 266:116]
  wire [4:0] _blockCounter_5_T_8 = blockCounter_5 != 5'h10 & loadReplaySelVec[5] & ~(|oldestMaskUInt) ?
    _blockCounter_5_T_7 : blockCounter_5; // @[LoadQueueReplay.scala 266:27]
  wire [4:0] _blockCounter_6_T_7 = blockCounter_6 + 5'h1; // @[LoadQueueReplay.scala 266:116]
  wire [4:0] _blockCounter_6_T_8 = blockCounter_6 != 5'h10 & loadReplaySelVec[6] & ~(|oldestMaskUInt) ?
    _blockCounter_6_T_7 : blockCounter_6; // @[LoadQueueReplay.scala 266:27]
  wire [4:0] _blockCounter_7_T_7 = blockCounter_7 + 5'h1; // @[LoadQueueReplay.scala 266:116]
  wire [4:0] _blockCounter_7_T_8 = blockCounter_7 != 5'h10 & loadReplaySelVec[7] & ~(|oldestMaskUInt) ?
    _blockCounter_7_T_7 : blockCounter_7; // @[LoadQueueReplay.scala 266:27]
  wire [4:0] _blockCounter_8_T_7 = blockCounter_8 + 5'h1; // @[LoadQueueReplay.scala 266:116]
  wire [4:0] _blockCounter_8_T_8 = blockCounter_8 != 5'h10 & loadReplaySelVec[8] & ~(|oldestMaskUInt) ?
    _blockCounter_8_T_7 : blockCounter_8; // @[LoadQueueReplay.scala 266:27]
  wire [4:0] _blockCounter_9_T_7 = blockCounter_9 + 5'h1; // @[LoadQueueReplay.scala 266:116]
  wire [4:0] _blockCounter_9_T_8 = blockCounter_9 != 5'h10 & loadReplaySelVec[9] & ~(|oldestMaskUInt) ?
    _blockCounter_9_T_7 : blockCounter_9; // @[LoadQueueReplay.scala 266:27]
  wire [4:0] _blockCounter_10_T_7 = blockCounter_10 + 5'h1; // @[LoadQueueReplay.scala 266:116]
  wire [4:0] _blockCounter_10_T_8 = blockCounter_10 != 5'h10 & loadReplaySelVec[10] & ~(|oldestMaskUInt) ?
    _blockCounter_10_T_7 : blockCounter_10; // @[LoadQueueReplay.scala 266:27]
  wire [4:0] _blockCounter_11_T_7 = blockCounter_11 + 5'h1; // @[LoadQueueReplay.scala 266:116]
  wire [4:0] _blockCounter_11_T_8 = blockCounter_11 != 5'h10 & loadReplaySelVec[11] & ~(|oldestMaskUInt) ?
    _blockCounter_11_T_7 : blockCounter_11; // @[LoadQueueReplay.scala 266:27]
  wire [4:0] _blockCounter_12_T_7 = blockCounter_12 + 5'h1; // @[LoadQueueReplay.scala 266:116]
  wire [4:0] _blockCounter_12_T_8 = blockCounter_12 != 5'h10 & loadReplaySelVec[12] & ~(|oldestMaskUInt) ?
    _blockCounter_12_T_7 : blockCounter_12; // @[LoadQueueReplay.scala 266:27]
  wire [4:0] _blockCounter_13_T_7 = blockCounter_13 + 5'h1; // @[LoadQueueReplay.scala 266:116]
  wire [4:0] _blockCounter_13_T_8 = blockCounter_13 != 5'h10 & loadReplaySelVec[13] & ~(|oldestMaskUInt) ?
    _blockCounter_13_T_7 : blockCounter_13; // @[LoadQueueReplay.scala 266:27]
  wire [4:0] _blockCounter_14_T_7 = blockCounter_14 + 5'h1; // @[LoadQueueReplay.scala 266:116]
  wire [4:0] _blockCounter_14_T_8 = blockCounter_14 != 5'h10 & loadReplaySelVec[14] & ~(|oldestMaskUInt) ?
    _blockCounter_14_T_7 : blockCounter_14; // @[LoadQueueReplay.scala 266:27]
  wire [4:0] _blockCounter_15_T_7 = blockCounter_15 + 5'h1; // @[LoadQueueReplay.scala 266:116]
  wire [4:0] _blockCounter_15_T_8 = blockCounter_15 != 5'h10 & loadReplaySelVec[15] & ~(|oldestMaskUInt) ?
    _blockCounter_15_T_7 : blockCounter_15; // @[LoadQueueReplay.scala 266:27]
  wire [15:0] remReplaySelMask = _blockCounter_0_T_3 ? oldestMaskUInt : loadReplaySelVec; // @[LoadQueueReplay.scala 270:26]
  reg [3:0] loadReplaySel_0_REG; // @[LoadQueueReplay.scala 293:32]
  wire [15:0] _remReplayFireMask_T = 16'h1 << loadReplaySel_0_REG; // @[OneHot.scala 57:35]
  wire [7:0] remReplayFireMask_0 = {_remReplayFireMask_T[14],_remReplayFireMask_T[12],_remReplayFireMask_T[10],
    _remReplayFireMask_T[8],_remReplayFireMask_T[6],_remReplayFireMask_T[4],_remReplayFireMask_T[2],_remReplayFireMask_T
    [0]}; // @[LoadQueueReplay.scala 235:113]
  reg [3:0] loadReplaySel_1_REG; // @[LoadQueueReplay.scala 293:32]
  wire [15:0] _remReplayFireMask_T_9 = 16'h1 << loadReplaySel_1_REG; // @[OneHot.scala 57:35]
  wire [7:0] remReplayFireMask_1 = {_remReplayFireMask_T_9[15],_remReplayFireMask_T_9[13],_remReplayFireMask_T_9[11],
    _remReplayFireMask_T_9[9],_remReplayFireMask_T_9[7],_remReplayFireMask_T_9[5],_remReplayFireMask_T_9[3],
    _remReplayFireMask_T_9[1]}; // @[LoadQueueReplay.scala 235:113]
  wire [7:0] _loadReplayRemSelVecFire_T_8 = {remReplaySelMask[14],remReplaySelMask[12],remReplaySelMask[10],
    remReplaySelMask[8],remReplaySelMask[6],remReplaySelMask[4],remReplaySelMask[2],remReplaySelMask[0]}; // @[LoadQueueReplay.scala 235:113]
  wire [7:0] _loadReplayRemSelVecFire_T_9 = ~remReplayFireMask_0; // @[LoadQueueReplay.scala 273:108]
  wire [7:0] loadReplayRemSelVecFire_0 = _loadReplayRemSelVecFire_T_8 & _loadReplayRemSelVecFire_T_9; // @[LoadQueueReplay.scala 273:106]
  wire [7:0] _loadReplayRemSelVecFire_T_18 = {remReplaySelMask[15],remReplaySelMask[13],remReplaySelMask[11],
    remReplaySelMask[9],remReplaySelMask[7],remReplaySelMask[5],remReplaySelMask[3],remReplaySelMask[1]}; // @[LoadQueueReplay.scala 235:113]
  wire [7:0] _loadReplayRemSelVecFire_T_19 = ~remReplayFireMask_1; // @[LoadQueueReplay.scala 273:108]
  wire [7:0] loadReplayRemSelVecFire_1 = _loadReplayRemSelVecFire_T_18 & _loadReplayRemSelVecFire_T_19; // @[LoadQueueReplay.scala 273:106]
  wire  replayRemFire_0 = io_replay_0_ready & io_replay_0_valid; // @[Decoupled.scala 50:35]
  wire [7:0] _T_144 = replayRemFire_0 ? loadReplayRemSelVecFire_0 : _loadReplayRemSelVecFire_T_8; // @[LoadQueueReplay.scala 276:33]
  wire [2:0] d_tail = _T_144[6] ? 3'h6 : 3'h7; // @[PriorityMuxDefault.scala 47:13]
  wire  f_tail = _T_144[6] | _T_144[7]; // @[PriorityMuxDefault.scala 47:46]
  wire [2:0] d_tail_1 = _T_144[5] ? 3'h5 : d_tail; // @[PriorityMuxDefault.scala 47:13]
  wire  f_tail_1 = _T_144[5] | f_tail; // @[PriorityMuxDefault.scala 47:46]
  wire [2:0] d_tail_2 = _T_144[4] ? 3'h4 : d_tail_1; // @[PriorityMuxDefault.scala 47:13]
  wire  f_tail_2 = _T_144[4] | f_tail_1; // @[PriorityMuxDefault.scala 47:46]
  wire [2:0] d_tail_3 = _T_144[3] ? 3'h3 : d_tail_2; // @[PriorityMuxDefault.scala 47:13]
  wire  f_tail_3 = _T_144[3] | f_tail_2; // @[PriorityMuxDefault.scala 47:46]
  wire [2:0] d_tail_4 = _T_144[2] ? 3'h2 : d_tail_3; // @[PriorityMuxDefault.scala 47:13]
  wire  f_tail_4 = _T_144[2] | f_tail_3; // @[PriorityMuxDefault.scala 47:46]
  wire [2:0] d_tail_5 = _T_144[1] ? 3'h1 : d_tail_4; // @[PriorityMuxDefault.scala 47:13]
  wire  f_tail_5 = _T_144[1] | f_tail_4; // @[PriorityMuxDefault.scala 47:46]
  wire [2:0] loadReplayRemSel_0 = _T_144[0] ? 3'h0 : d_tail_5; // @[PriorityMuxDefault.scala 47:13]
  wire  replayRemFire_1 = io_replay_1_ready & io_replay_1_valid; // @[Decoupled.scala 50:35]
  wire [7:0] _T_153 = replayRemFire_1 ? loadReplayRemSelVecFire_1 : _loadReplayRemSelVecFire_T_18; // @[LoadQueueReplay.scala 276:33]
  wire [2:0] d_tail_6 = _T_153[6] ? 3'h6 : 3'h7; // @[PriorityMuxDefault.scala 47:13]
  wire  f_tail_6 = _T_153[6] | _T_153[7]; // @[PriorityMuxDefault.scala 47:46]
  wire [2:0] d_tail_7 = _T_153[5] ? 3'h5 : d_tail_6; // @[PriorityMuxDefault.scala 47:13]
  wire  f_tail_7 = _T_153[5] | f_tail_6; // @[PriorityMuxDefault.scala 47:46]
  wire [2:0] d_tail_8 = _T_153[4] ? 3'h4 : d_tail_7; // @[PriorityMuxDefault.scala 47:13]
  wire  f_tail_8 = _T_153[4] | f_tail_7; // @[PriorityMuxDefault.scala 47:46]
  wire [2:0] d_tail_9 = _T_153[3] ? 3'h3 : d_tail_8; // @[PriorityMuxDefault.scala 47:13]
  wire  f_tail_9 = _T_153[3] | f_tail_8; // @[PriorityMuxDefault.scala 47:46]
  wire [2:0] d_tail_10 = _T_153[2] ? 3'h2 : d_tail_9; // @[PriorityMuxDefault.scala 47:13]
  wire  f_tail_10 = _T_153[2] | f_tail_9; // @[PriorityMuxDefault.scala 47:46]
  wire [2:0] d_tail_11 = _T_153[1] ? 3'h1 : d_tail_10; // @[PriorityMuxDefault.scala 47:13]
  wire  f_tail_11 = _T_153[1] | f_tail_10; // @[PriorityMuxDefault.scala 47:46]
  wire [2:0] loadReplayRemSel_1 = _T_153[0] ? 3'h0 : d_tail_11; // @[PriorityMuxDefault.scala 47:13]
  reg  loadReplaySelV_0_REG; // @[LoadQueueReplay.scala 294:33]
  reg  loadReplaySelV_1_REG; // @[LoadQueueReplay.scala 294:33]
  wire  _GEN_64 = 4'h0 == loadReplaySel_0_REG; // @[LoadQueueReplay.scala 299:{42,42}]
  wire  _GEN_65 = 4'h1 == loadReplaySel_0_REG; // @[LoadQueueReplay.scala 299:{42,42}]
  wire  _GEN_66 = 4'h2 == loadReplaySel_0_REG; // @[LoadQueueReplay.scala 299:{42,42}]
  wire  _GEN_67 = 4'h3 == loadReplaySel_0_REG; // @[LoadQueueReplay.scala 299:{42,42}]
  wire  _GEN_68 = 4'h4 == loadReplaySel_0_REG; // @[LoadQueueReplay.scala 299:{42,42}]
  wire  _GEN_69 = 4'h5 == loadReplaySel_0_REG; // @[LoadQueueReplay.scala 299:{42,42}]
  wire  _GEN_70 = 4'h6 == loadReplaySel_0_REG; // @[LoadQueueReplay.scala 299:{42,42}]
  wire  _GEN_71 = 4'h7 == loadReplaySel_0_REG; // @[LoadQueueReplay.scala 299:{42,42}]
  wire  _GEN_72 = 4'h8 == loadReplaySel_0_REG; // @[LoadQueueReplay.scala 299:{42,42}]
  wire  _GEN_73 = 4'h9 == loadReplaySel_0_REG; // @[LoadQueueReplay.scala 299:{42,42}]
  wire  _GEN_74 = 4'ha == loadReplaySel_0_REG; // @[LoadQueueReplay.scala 299:{42,42}]
  wire  _GEN_75 = 4'hb == loadReplaySel_0_REG; // @[LoadQueueReplay.scala 299:{42,42}]
  wire  _GEN_76 = 4'hc == loadReplaySel_0_REG; // @[LoadQueueReplay.scala 299:{42,42}]
  wire  _GEN_77 = 4'hd == loadReplaySel_0_REG; // @[LoadQueueReplay.scala 299:{42,42}]
  wire  _GEN_78 = 4'he == loadReplaySel_0_REG; // @[LoadQueueReplay.scala 299:{42,42}]
  wire  _GEN_79 = 4'hf == loadReplaySel_0_REG; // @[LoadQueueReplay.scala 299:{42,42}]
  wire  _GEN_80 = replayRemFire_0 & _GEN_64; // @[LoadQueueReplay.scala 298:28]
  wire  _GEN_81 = replayRemFire_0 & _GEN_65; // @[LoadQueueReplay.scala 298:28]
  wire  _GEN_82 = replayRemFire_0 & _GEN_66; // @[LoadQueueReplay.scala 298:28]
  wire  _GEN_83 = replayRemFire_0 & _GEN_67; // @[LoadQueueReplay.scala 298:28]
  wire  _GEN_84 = replayRemFire_0 & _GEN_68; // @[LoadQueueReplay.scala 298:28]
  wire  _GEN_85 = replayRemFire_0 & _GEN_69; // @[LoadQueueReplay.scala 298:28]
  wire  _GEN_86 = replayRemFire_0 & _GEN_70; // @[LoadQueueReplay.scala 298:28]
  wire  _GEN_87 = replayRemFire_0 & _GEN_71; // @[LoadQueueReplay.scala 298:28]
  wire  _GEN_88 = replayRemFire_0 & _GEN_72; // @[LoadQueueReplay.scala 298:28]
  wire  _GEN_89 = replayRemFire_0 & _GEN_73; // @[LoadQueueReplay.scala 298:28]
  wire  _GEN_90 = replayRemFire_0 & _GEN_74; // @[LoadQueueReplay.scala 298:28]
  wire  _GEN_91 = replayRemFire_0 & _GEN_75; // @[LoadQueueReplay.scala 298:28]
  wire  _GEN_92 = replayRemFire_0 & _GEN_76; // @[LoadQueueReplay.scala 298:28]
  wire  _GEN_93 = replayRemFire_0 & _GEN_77; // @[LoadQueueReplay.scala 298:28]
  wire  _GEN_94 = replayRemFire_0 & _GEN_78; // @[LoadQueueReplay.scala 298:28]
  wire  _GEN_95 = replayRemFire_0 & _GEN_79; // @[LoadQueueReplay.scala 298:28]
  wire  _GEN_96 = 4'h0 == loadReplaySel_1_REG | _GEN_80; // @[LoadQueueReplay.scala 299:{42,42}]
  wire  _GEN_97 = 4'h1 == loadReplaySel_1_REG | _GEN_81; // @[LoadQueueReplay.scala 299:{42,42}]
  wire  _GEN_98 = 4'h2 == loadReplaySel_1_REG | _GEN_82; // @[LoadQueueReplay.scala 299:{42,42}]
  wire  _GEN_99 = 4'h3 == loadReplaySel_1_REG | _GEN_83; // @[LoadQueueReplay.scala 299:{42,42}]
  wire  _GEN_100 = 4'h4 == loadReplaySel_1_REG | _GEN_84; // @[LoadQueueReplay.scala 299:{42,42}]
  wire  _GEN_101 = 4'h5 == loadReplaySel_1_REG | _GEN_85; // @[LoadQueueReplay.scala 299:{42,42}]
  wire  _GEN_102 = 4'h6 == loadReplaySel_1_REG | _GEN_86; // @[LoadQueueReplay.scala 299:{42,42}]
  wire  _GEN_103 = 4'h7 == loadReplaySel_1_REG | _GEN_87; // @[LoadQueueReplay.scala 299:{42,42}]
  wire  _GEN_104 = 4'h8 == loadReplaySel_1_REG | _GEN_88; // @[LoadQueueReplay.scala 299:{42,42}]
  wire  _GEN_105 = 4'h9 == loadReplaySel_1_REG | _GEN_89; // @[LoadQueueReplay.scala 299:{42,42}]
  wire  _GEN_106 = 4'ha == loadReplaySel_1_REG | _GEN_90; // @[LoadQueueReplay.scala 299:{42,42}]
  wire  _GEN_107 = 4'hb == loadReplaySel_1_REG | _GEN_91; // @[LoadQueueReplay.scala 299:{42,42}]
  wire  _GEN_108 = 4'hc == loadReplaySel_1_REG | _GEN_92; // @[LoadQueueReplay.scala 299:{42,42}]
  wire  _GEN_109 = 4'hd == loadReplaySel_1_REG | _GEN_93; // @[LoadQueueReplay.scala 299:{42,42}]
  wire  _GEN_110 = 4'he == loadReplaySel_1_REG | _GEN_94; // @[LoadQueueReplay.scala 299:{42,42}]
  wire  _GEN_111 = 4'hf == loadReplaySel_1_REG | _GEN_95; // @[LoadQueueReplay.scala 299:{42,42}]
  wire [7:0] _GEN_129 = 4'h1 == loadReplaySel_0_REG ? cause_1 : cause_0; // @[LoadQueueReplay.scala 308:{98,98}]
  wire [7:0] _GEN_130 = 4'h2 == loadReplaySel_0_REG ? cause_2 : _GEN_129; // @[LoadQueueReplay.scala 308:{98,98}]
  wire [7:0] _GEN_131 = 4'h3 == loadReplaySel_0_REG ? cause_3 : _GEN_130; // @[LoadQueueReplay.scala 308:{98,98}]
  wire [7:0] _GEN_132 = 4'h4 == loadReplaySel_0_REG ? cause_4 : _GEN_131; // @[LoadQueueReplay.scala 308:{98,98}]
  wire [7:0] _GEN_133 = 4'h5 == loadReplaySel_0_REG ? cause_5 : _GEN_132; // @[LoadQueueReplay.scala 308:{98,98}]
  wire [7:0] _GEN_134 = 4'h6 == loadReplaySel_0_REG ? cause_6 : _GEN_133; // @[LoadQueueReplay.scala 308:{98,98}]
  wire [7:0] _GEN_135 = 4'h7 == loadReplaySel_0_REG ? cause_7 : _GEN_134; // @[LoadQueueReplay.scala 308:{98,98}]
  wire [7:0] _GEN_136 = 4'h8 == loadReplaySel_0_REG ? cause_8 : _GEN_135; // @[LoadQueueReplay.scala 308:{98,98}]
  wire [7:0] _GEN_137 = 4'h9 == loadReplaySel_0_REG ? cause_9 : _GEN_136; // @[LoadQueueReplay.scala 308:{98,98}]
  wire [7:0] _GEN_138 = 4'ha == loadReplaySel_0_REG ? cause_10 : _GEN_137; // @[LoadQueueReplay.scala 308:{98,98}]
  wire [7:0] _GEN_139 = 4'hb == loadReplaySel_0_REG ? cause_11 : _GEN_138; // @[LoadQueueReplay.scala 308:{98,98}]
  wire [7:0] _GEN_140 = 4'hc == loadReplaySel_0_REG ? cause_12 : _GEN_139; // @[LoadQueueReplay.scala 308:{98,98}]
  wire [7:0] _GEN_141 = 4'hd == loadReplaySel_0_REG ? cause_13 : _GEN_140; // @[LoadQueueReplay.scala 308:{98,98}]
  wire [7:0] _GEN_142 = 4'he == loadReplaySel_0_REG ? cause_14 : _GEN_141; // @[LoadQueueReplay.scala 308:{98,98}]
  wire [7:0] _GEN_143 = 4'hf == loadReplaySel_0_REG ? cause_15 : _GEN_142; // @[LoadQueueReplay.scala 308:{98,98}]
  wire  hasBankConflictVec_0 = loadReplaySelV_0_REG & _GEN_143[4]; // @[LoadQueueReplay.scala 308:84]
  wire [7:0] _GEN_145 = 4'h1 == loadReplaySel_1_REG ? cause_1 : cause_0; // @[LoadQueueReplay.scala 308:{98,98}]
  wire [7:0] _GEN_146 = 4'h2 == loadReplaySel_1_REG ? cause_2 : _GEN_145; // @[LoadQueueReplay.scala 308:{98,98}]
  wire [7:0] _GEN_147 = 4'h3 == loadReplaySel_1_REG ? cause_3 : _GEN_146; // @[LoadQueueReplay.scala 308:{98,98}]
  wire [7:0] _GEN_148 = 4'h4 == loadReplaySel_1_REG ? cause_4 : _GEN_147; // @[LoadQueueReplay.scala 308:{98,98}]
  wire [7:0] _GEN_149 = 4'h5 == loadReplaySel_1_REG ? cause_5 : _GEN_148; // @[LoadQueueReplay.scala 308:{98,98}]
  wire [7:0] _GEN_150 = 4'h6 == loadReplaySel_1_REG ? cause_6 : _GEN_149; // @[LoadQueueReplay.scala 308:{98,98}]
  wire [7:0] _GEN_151 = 4'h7 == loadReplaySel_1_REG ? cause_7 : _GEN_150; // @[LoadQueueReplay.scala 308:{98,98}]
  wire [7:0] _GEN_152 = 4'h8 == loadReplaySel_1_REG ? cause_8 : _GEN_151; // @[LoadQueueReplay.scala 308:{98,98}]
  wire [7:0] _GEN_153 = 4'h9 == loadReplaySel_1_REG ? cause_9 : _GEN_152; // @[LoadQueueReplay.scala 308:{98,98}]
  wire [7:0] _GEN_154 = 4'ha == loadReplaySel_1_REG ? cause_10 : _GEN_153; // @[LoadQueueReplay.scala 308:{98,98}]
  wire [7:0] _GEN_155 = 4'hb == loadReplaySel_1_REG ? cause_11 : _GEN_154; // @[LoadQueueReplay.scala 308:{98,98}]
  wire [7:0] _GEN_156 = 4'hc == loadReplaySel_1_REG ? cause_12 : _GEN_155; // @[LoadQueueReplay.scala 308:{98,98}]
  wire [7:0] _GEN_157 = 4'hd == loadReplaySel_1_REG ? cause_13 : _GEN_156; // @[LoadQueueReplay.scala 308:{98,98}]
  wire [7:0] _GEN_158 = 4'he == loadReplaySel_1_REG ? cause_14 : _GEN_157; // @[LoadQueueReplay.scala 308:{98,98}]
  wire [7:0] _GEN_159 = 4'hf == loadReplaySel_1_REG ? cause_15 : _GEN_158; // @[LoadQueueReplay.scala 308:{98,98}]
  wire  hasBankConflictVec_1 = loadReplaySelV_1_REG & _GEN_159[4]; // @[LoadQueueReplay.scala 308:84]
  wire [1:0] _hasBankConflict_T = {hasBankConflictVec_1,hasBankConflictVec_0}; // @[LoadQueueReplay.scala 309:44]
  wire  hasBankConflict = |_hasBankConflict_T; // @[LoadQueueReplay.scala 309:51]
  wire  allBankConflict = &_hasBankConflict_T; // @[LoadQueueReplay.scala 310:51]
  reg [2:0] coldCounter; // @[LoadQueueReplay.scala 311:28]
  reg  cancelReplay_REG_valid; // @[LoadQueueReplay.scala 315:63]
  reg  cancelReplay_REG_bits_robIdx_flag; // @[LoadQueueReplay.scala 315:63]
  reg [4:0] cancelReplay_REG_bits_robIdx_value; // @[LoadQueueReplay.scala 315:63]
  reg  cancelReplay_REG_bits_level; // @[LoadQueueReplay.scala 315:63]
  wire  _GEN_161 = 4'h1 == loadReplaySel_0_REG ? uop_1_robIdx_flag : uop_0_robIdx_flag; // @[CircularQueuePtr.scala 61:{50,50}]
  wire  _GEN_162 = 4'h2 == loadReplaySel_0_REG ? uop_2_robIdx_flag : _GEN_161; // @[CircularQueuePtr.scala 61:{50,50}]
  wire  _GEN_163 = 4'h3 == loadReplaySel_0_REG ? uop_3_robIdx_flag : _GEN_162; // @[CircularQueuePtr.scala 61:{50,50}]
  wire  _GEN_164 = 4'h4 == loadReplaySel_0_REG ? uop_4_robIdx_flag : _GEN_163; // @[CircularQueuePtr.scala 61:{50,50}]
  wire  _GEN_165 = 4'h5 == loadReplaySel_0_REG ? uop_5_robIdx_flag : _GEN_164; // @[CircularQueuePtr.scala 61:{50,50}]
  wire  _GEN_166 = 4'h6 == loadReplaySel_0_REG ? uop_6_robIdx_flag : _GEN_165; // @[CircularQueuePtr.scala 61:{50,50}]
  wire  _GEN_167 = 4'h7 == loadReplaySel_0_REG ? uop_7_robIdx_flag : _GEN_166; // @[CircularQueuePtr.scala 61:{50,50}]
  wire  _GEN_168 = 4'h8 == loadReplaySel_0_REG ? uop_8_robIdx_flag : _GEN_167; // @[CircularQueuePtr.scala 61:{50,50}]
  wire  _GEN_169 = 4'h9 == loadReplaySel_0_REG ? uop_9_robIdx_flag : _GEN_168; // @[CircularQueuePtr.scala 61:{50,50}]
  wire  _GEN_170 = 4'ha == loadReplaySel_0_REG ? uop_10_robIdx_flag : _GEN_169; // @[CircularQueuePtr.scala 61:{50,50}]
  wire  _GEN_171 = 4'hb == loadReplaySel_0_REG ? uop_11_robIdx_flag : _GEN_170; // @[CircularQueuePtr.scala 61:{50,50}]
  wire  _GEN_172 = 4'hc == loadReplaySel_0_REG ? uop_12_robIdx_flag : _GEN_171; // @[CircularQueuePtr.scala 61:{50,50}]
  wire  _GEN_173 = 4'hd == loadReplaySel_0_REG ? uop_13_robIdx_flag : _GEN_172; // @[CircularQueuePtr.scala 61:{50,50}]
  wire  _GEN_174 = 4'he == loadReplaySel_0_REG ? uop_14_robIdx_flag : _GEN_173; // @[CircularQueuePtr.scala 61:{50,50}]
  wire  _GEN_175 = 4'hf == loadReplaySel_0_REG ? uop_15_robIdx_flag : _GEN_174; // @[CircularQueuePtr.scala 61:{50,50}]
  wire [4:0] _GEN_177 = 4'h1 == loadReplaySel_0_REG ? uop_1_robIdx_value : uop_0_robIdx_value; // @[CircularQueuePtr.scala 61:{50,50}]
  wire [4:0] _GEN_178 = 4'h2 == loadReplaySel_0_REG ? uop_2_robIdx_value : _GEN_177; // @[CircularQueuePtr.scala 61:{50,50}]
  wire [4:0] _GEN_179 = 4'h3 == loadReplaySel_0_REG ? uop_3_robIdx_value : _GEN_178; // @[CircularQueuePtr.scala 61:{50,50}]
  wire [4:0] _GEN_180 = 4'h4 == loadReplaySel_0_REG ? uop_4_robIdx_value : _GEN_179; // @[CircularQueuePtr.scala 61:{50,50}]
  wire [4:0] _GEN_181 = 4'h5 == loadReplaySel_0_REG ? uop_5_robIdx_value : _GEN_180; // @[CircularQueuePtr.scala 61:{50,50}]
  wire [4:0] _GEN_182 = 4'h6 == loadReplaySel_0_REG ? uop_6_robIdx_value : _GEN_181; // @[CircularQueuePtr.scala 61:{50,50}]
  wire [4:0] _GEN_183 = 4'h7 == loadReplaySel_0_REG ? uop_7_robIdx_value : _GEN_182; // @[CircularQueuePtr.scala 61:{50,50}]
  wire [4:0] _GEN_184 = 4'h8 == loadReplaySel_0_REG ? uop_8_robIdx_value : _GEN_183; // @[CircularQueuePtr.scala 61:{50,50}]
  wire [4:0] _GEN_185 = 4'h9 == loadReplaySel_0_REG ? uop_9_robIdx_value : _GEN_184; // @[CircularQueuePtr.scala 61:{50,50}]
  wire [4:0] _GEN_186 = 4'ha == loadReplaySel_0_REG ? uop_10_robIdx_value : _GEN_185; // @[CircularQueuePtr.scala 61:{50,50}]
  wire [4:0] _GEN_187 = 4'hb == loadReplaySel_0_REG ? uop_11_robIdx_value : _GEN_186; // @[CircularQueuePtr.scala 61:{50,50}]
  wire [4:0] _GEN_188 = 4'hc == loadReplaySel_0_REG ? uop_12_robIdx_value : _GEN_187; // @[CircularQueuePtr.scala 61:{50,50}]
  wire [4:0] _GEN_189 = 4'hd == loadReplaySel_0_REG ? uop_13_robIdx_value : _GEN_188; // @[CircularQueuePtr.scala 61:{50,50}]
  wire [4:0] _GEN_190 = 4'he == loadReplaySel_0_REG ? uop_14_robIdx_value : _GEN_189; // @[CircularQueuePtr.scala 61:{50,50}]
  wire [4:0] _GEN_191 = 4'hf == loadReplaySel_0_REG ? uop_15_robIdx_value : _GEN_190; // @[CircularQueuePtr.scala 61:{50,50}]
  wire [5:0] _cancelReplay_flushItself_T_1 = {_GEN_175,_GEN_191}; // @[CircularQueuePtr.scala 61:50]
  wire [5:0] _cancelReplay_flushItself_T_2 = {cancelReplay_REG_bits_robIdx_flag,cancelReplay_REG_bits_robIdx_value}; // @[CircularQueuePtr.scala 61:70]
  wire  _cancelReplay_flushItself_T_3 = _cancelReplay_flushItself_T_1 == _cancelReplay_flushItself_T_2; // @[CircularQueuePtr.scala 61:52]
  wire  cancelReplay_flushItself = cancelReplay_REG_bits_level & _cancelReplay_flushItself_T_3; // @[Rob.scala 122:51]
  wire  cancelReplay_differentFlag = _GEN_175 ^ cancelReplay_REG_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  cancelReplay_compare = _GEN_191 > cancelReplay_REG_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _cancelReplay_T = cancelReplay_differentFlag ^ cancelReplay_compare; // @[CircularQueuePtr.scala 88:19]
  wire  cancelReplay = cancelReplay_REG_valid & (cancelReplay_flushItself | _cancelReplay_T); // @[Rob.scala 123:20]
  wire  bankConflictReplay = hasBankConflict & ~allBankConflict ? _GEN_143[4] : 1'h1; // @[LoadQueueReplay.scala 317:33]
  wire [9:0] _GEN_225 = 4'h1 == loadReplaySel_0_REG ? uop_1_cf_foldpc : uop_0_cf_foldpc; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [9:0] _GEN_226 = 4'h2 == loadReplaySel_0_REG ? uop_2_cf_foldpc : _GEN_225; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [9:0] _GEN_227 = 4'h3 == loadReplaySel_0_REG ? uop_3_cf_foldpc : _GEN_226; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [9:0] _GEN_228 = 4'h4 == loadReplaySel_0_REG ? uop_4_cf_foldpc : _GEN_227; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [9:0] _GEN_229 = 4'h5 == loadReplaySel_0_REG ? uop_5_cf_foldpc : _GEN_228; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [9:0] _GEN_230 = 4'h6 == loadReplaySel_0_REG ? uop_6_cf_foldpc : _GEN_229; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [9:0] _GEN_231 = 4'h7 == loadReplaySel_0_REG ? uop_7_cf_foldpc : _GEN_230; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [9:0] _GEN_232 = 4'h8 == loadReplaySel_0_REG ? uop_8_cf_foldpc : _GEN_231; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [9:0] _GEN_233 = 4'h9 == loadReplaySel_0_REG ? uop_9_cf_foldpc : _GEN_232; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [9:0] _GEN_234 = 4'ha == loadReplaySel_0_REG ? uop_10_cf_foldpc : _GEN_233; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [9:0] _GEN_235 = 4'hb == loadReplaySel_0_REG ? uop_11_cf_foldpc : _GEN_234; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [9:0] _GEN_236 = 4'hc == loadReplaySel_0_REG ? uop_12_cf_foldpc : _GEN_235; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [9:0] _GEN_237 = 4'hd == loadReplaySel_0_REG ? uop_13_cf_foldpc : _GEN_236; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [9:0] _GEN_238 = 4'he == loadReplaySel_0_REG ? uop_14_cf_foldpc : _GEN_237; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_577 = 4'h1 == loadReplaySel_0_REG ? uop_1_cf_trigger_backendEn_1 : uop_0_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_578 = 4'h2 == loadReplaySel_0_REG ? uop_2_cf_trigger_backendEn_1 : _GEN_577; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_579 = 4'h3 == loadReplaySel_0_REG ? uop_3_cf_trigger_backendEn_1 : _GEN_578; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_580 = 4'h4 == loadReplaySel_0_REG ? uop_4_cf_trigger_backendEn_1 : _GEN_579; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_581 = 4'h5 == loadReplaySel_0_REG ? uop_5_cf_trigger_backendEn_1 : _GEN_580; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_582 = 4'h6 == loadReplaySel_0_REG ? uop_6_cf_trigger_backendEn_1 : _GEN_581; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_583 = 4'h7 == loadReplaySel_0_REG ? uop_7_cf_trigger_backendEn_1 : _GEN_582; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_584 = 4'h8 == loadReplaySel_0_REG ? uop_8_cf_trigger_backendEn_1 : _GEN_583; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_585 = 4'h9 == loadReplaySel_0_REG ? uop_9_cf_trigger_backendEn_1 : _GEN_584; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_586 = 4'ha == loadReplaySel_0_REG ? uop_10_cf_trigger_backendEn_1 : _GEN_585; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_587 = 4'hb == loadReplaySel_0_REG ? uop_11_cf_trigger_backendEn_1 : _GEN_586; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_588 = 4'hc == loadReplaySel_0_REG ? uop_12_cf_trigger_backendEn_1 : _GEN_587; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_589 = 4'hd == loadReplaySel_0_REG ? uop_13_cf_trigger_backendEn_1 : _GEN_588; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_590 = 4'he == loadReplaySel_0_REG ? uop_14_cf_trigger_backendEn_1 : _GEN_589; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_593 = 4'h1 == loadReplaySel_0_REG ? uop_1_cf_trigger_backendHit_0 : uop_0_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_594 = 4'h2 == loadReplaySel_0_REG ? uop_2_cf_trigger_backendHit_0 : _GEN_593; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_595 = 4'h3 == loadReplaySel_0_REG ? uop_3_cf_trigger_backendHit_0 : _GEN_594; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_596 = 4'h4 == loadReplaySel_0_REG ? uop_4_cf_trigger_backendHit_0 : _GEN_595; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_597 = 4'h5 == loadReplaySel_0_REG ? uop_5_cf_trigger_backendHit_0 : _GEN_596; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_598 = 4'h6 == loadReplaySel_0_REG ? uop_6_cf_trigger_backendHit_0 : _GEN_597; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_599 = 4'h7 == loadReplaySel_0_REG ? uop_7_cf_trigger_backendHit_0 : _GEN_598; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_600 = 4'h8 == loadReplaySel_0_REG ? uop_8_cf_trigger_backendHit_0 : _GEN_599; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_601 = 4'h9 == loadReplaySel_0_REG ? uop_9_cf_trigger_backendHit_0 : _GEN_600; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_602 = 4'ha == loadReplaySel_0_REG ? uop_10_cf_trigger_backendHit_0 : _GEN_601; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_603 = 4'hb == loadReplaySel_0_REG ? uop_11_cf_trigger_backendHit_0 : _GEN_602; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_604 = 4'hc == loadReplaySel_0_REG ? uop_12_cf_trigger_backendHit_0 : _GEN_603; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_605 = 4'hd == loadReplaySel_0_REG ? uop_13_cf_trigger_backendHit_0 : _GEN_604; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_606 = 4'he == loadReplaySel_0_REG ? uop_14_cf_trigger_backendHit_0 : _GEN_605; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_609 = 4'h1 == loadReplaySel_0_REG ? uop_1_cf_trigger_backendHit_1 : uop_0_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_610 = 4'h2 == loadReplaySel_0_REG ? uop_2_cf_trigger_backendHit_1 : _GEN_609; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_611 = 4'h3 == loadReplaySel_0_REG ? uop_3_cf_trigger_backendHit_1 : _GEN_610; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_612 = 4'h4 == loadReplaySel_0_REG ? uop_4_cf_trigger_backendHit_1 : _GEN_611; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_613 = 4'h5 == loadReplaySel_0_REG ? uop_5_cf_trigger_backendHit_1 : _GEN_612; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_614 = 4'h6 == loadReplaySel_0_REG ? uop_6_cf_trigger_backendHit_1 : _GEN_613; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_615 = 4'h7 == loadReplaySel_0_REG ? uop_7_cf_trigger_backendHit_1 : _GEN_614; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_616 = 4'h8 == loadReplaySel_0_REG ? uop_8_cf_trigger_backendHit_1 : _GEN_615; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_617 = 4'h9 == loadReplaySel_0_REG ? uop_9_cf_trigger_backendHit_1 : _GEN_616; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_618 = 4'ha == loadReplaySel_0_REG ? uop_10_cf_trigger_backendHit_1 : _GEN_617; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_619 = 4'hb == loadReplaySel_0_REG ? uop_11_cf_trigger_backendHit_1 : _GEN_618; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_620 = 4'hc == loadReplaySel_0_REG ? uop_12_cf_trigger_backendHit_1 : _GEN_619; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_621 = 4'hd == loadReplaySel_0_REG ? uop_13_cf_trigger_backendHit_1 : _GEN_620; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_622 = 4'he == loadReplaySel_0_REG ? uop_14_cf_trigger_backendHit_1 : _GEN_621; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_657 = 4'h1 == loadReplaySel_0_REG ? uop_1_cf_trigger_backendHit_4 : uop_0_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_658 = 4'h2 == loadReplaySel_0_REG ? uop_2_cf_trigger_backendHit_4 : _GEN_657; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_659 = 4'h3 == loadReplaySel_0_REG ? uop_3_cf_trigger_backendHit_4 : _GEN_658; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_660 = 4'h4 == loadReplaySel_0_REG ? uop_4_cf_trigger_backendHit_4 : _GEN_659; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_661 = 4'h5 == loadReplaySel_0_REG ? uop_5_cf_trigger_backendHit_4 : _GEN_660; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_662 = 4'h6 == loadReplaySel_0_REG ? uop_6_cf_trigger_backendHit_4 : _GEN_661; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_663 = 4'h7 == loadReplaySel_0_REG ? uop_7_cf_trigger_backendHit_4 : _GEN_662; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_664 = 4'h8 == loadReplaySel_0_REG ? uop_8_cf_trigger_backendHit_4 : _GEN_663; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_665 = 4'h9 == loadReplaySel_0_REG ? uop_9_cf_trigger_backendHit_4 : _GEN_664; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_666 = 4'ha == loadReplaySel_0_REG ? uop_10_cf_trigger_backendHit_4 : _GEN_665; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_667 = 4'hb == loadReplaySel_0_REG ? uop_11_cf_trigger_backendHit_4 : _GEN_666; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_668 = 4'hc == loadReplaySel_0_REG ? uop_12_cf_trigger_backendHit_4 : _GEN_667; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_669 = 4'hd == loadReplaySel_0_REG ? uop_13_cf_trigger_backendHit_4 : _GEN_668; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_670 = 4'he == loadReplaySel_0_REG ? uop_14_cf_trigger_backendHit_4 : _GEN_669; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_817 = 4'h1 == loadReplaySel_0_REG ? uop_1_cf_waitForRobIdx_flag : uop_0_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_818 = 4'h2 == loadReplaySel_0_REG ? uop_2_cf_waitForRobIdx_flag : _GEN_817; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_819 = 4'h3 == loadReplaySel_0_REG ? uop_3_cf_waitForRobIdx_flag : _GEN_818; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_820 = 4'h4 == loadReplaySel_0_REG ? uop_4_cf_waitForRobIdx_flag : _GEN_819; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_821 = 4'h5 == loadReplaySel_0_REG ? uop_5_cf_waitForRobIdx_flag : _GEN_820; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_822 = 4'h6 == loadReplaySel_0_REG ? uop_6_cf_waitForRobIdx_flag : _GEN_821; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_823 = 4'h7 == loadReplaySel_0_REG ? uop_7_cf_waitForRobIdx_flag : _GEN_822; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_824 = 4'h8 == loadReplaySel_0_REG ? uop_8_cf_waitForRobIdx_flag : _GEN_823; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_825 = 4'h9 == loadReplaySel_0_REG ? uop_9_cf_waitForRobIdx_flag : _GEN_824; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_826 = 4'ha == loadReplaySel_0_REG ? uop_10_cf_waitForRobIdx_flag : _GEN_825; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_827 = 4'hb == loadReplaySel_0_REG ? uop_11_cf_waitForRobIdx_flag : _GEN_826; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_828 = 4'hc == loadReplaySel_0_REG ? uop_12_cf_waitForRobIdx_flag : _GEN_827; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_829 = 4'hd == loadReplaySel_0_REG ? uop_13_cf_waitForRobIdx_flag : _GEN_828; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_830 = 4'he == loadReplaySel_0_REG ? uop_14_cf_waitForRobIdx_flag : _GEN_829; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [4:0] _GEN_833 = 4'h1 == loadReplaySel_0_REG ? uop_1_cf_waitForRobIdx_value : uop_0_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [4:0] _GEN_834 = 4'h2 == loadReplaySel_0_REG ? uop_2_cf_waitForRobIdx_value : _GEN_833; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [4:0] _GEN_835 = 4'h3 == loadReplaySel_0_REG ? uop_3_cf_waitForRobIdx_value : _GEN_834; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [4:0] _GEN_836 = 4'h4 == loadReplaySel_0_REG ? uop_4_cf_waitForRobIdx_value : _GEN_835; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [4:0] _GEN_837 = 4'h5 == loadReplaySel_0_REG ? uop_5_cf_waitForRobIdx_value : _GEN_836; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [4:0] _GEN_838 = 4'h6 == loadReplaySel_0_REG ? uop_6_cf_waitForRobIdx_value : _GEN_837; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [4:0] _GEN_839 = 4'h7 == loadReplaySel_0_REG ? uop_7_cf_waitForRobIdx_value : _GEN_838; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [4:0] _GEN_840 = 4'h8 == loadReplaySel_0_REG ? uop_8_cf_waitForRobIdx_value : _GEN_839; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [4:0] _GEN_841 = 4'h9 == loadReplaySel_0_REG ? uop_9_cf_waitForRobIdx_value : _GEN_840; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [4:0] _GEN_842 = 4'ha == loadReplaySel_0_REG ? uop_10_cf_waitForRobIdx_value : _GEN_841; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [4:0] _GEN_843 = 4'hb == loadReplaySel_0_REG ? uop_11_cf_waitForRobIdx_value : _GEN_842; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [4:0] _GEN_844 = 4'hc == loadReplaySel_0_REG ? uop_12_cf_waitForRobIdx_value : _GEN_843; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [4:0] _GEN_845 = 4'hd == loadReplaySel_0_REG ? uop_13_cf_waitForRobIdx_value : _GEN_844; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [4:0] _GEN_846 = 4'he == loadReplaySel_0_REG ? uop_14_cf_waitForRobIdx_value : _GEN_845; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_849 = 4'h1 == loadReplaySel_0_REG ? uop_1_cf_loadWaitBit : uop_0_cf_loadWaitBit; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_850 = 4'h2 == loadReplaySel_0_REG ? uop_2_cf_loadWaitBit : _GEN_849; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_851 = 4'h3 == loadReplaySel_0_REG ? uop_3_cf_loadWaitBit : _GEN_850; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_852 = 4'h4 == loadReplaySel_0_REG ? uop_4_cf_loadWaitBit : _GEN_851; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_853 = 4'h5 == loadReplaySel_0_REG ? uop_5_cf_loadWaitBit : _GEN_852; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_854 = 4'h6 == loadReplaySel_0_REG ? uop_6_cf_loadWaitBit : _GEN_853; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_855 = 4'h7 == loadReplaySel_0_REG ? uop_7_cf_loadWaitBit : _GEN_854; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_856 = 4'h8 == loadReplaySel_0_REG ? uop_8_cf_loadWaitBit : _GEN_855; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_857 = 4'h9 == loadReplaySel_0_REG ? uop_9_cf_loadWaitBit : _GEN_856; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_858 = 4'ha == loadReplaySel_0_REG ? uop_10_cf_loadWaitBit : _GEN_857; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_859 = 4'hb == loadReplaySel_0_REG ? uop_11_cf_loadWaitBit : _GEN_858; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_860 = 4'hc == loadReplaySel_0_REG ? uop_12_cf_loadWaitBit : _GEN_859; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_861 = 4'hd == loadReplaySel_0_REG ? uop_13_cf_loadWaitBit : _GEN_860; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_862 = 4'he == loadReplaySel_0_REG ? uop_14_cf_loadWaitBit : _GEN_861; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_865 = 4'h1 == loadReplaySel_0_REG ? uop_1_cf_loadWaitStrict : uop_0_cf_loadWaitStrict; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_866 = 4'h2 == loadReplaySel_0_REG ? uop_2_cf_loadWaitStrict : _GEN_865; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_867 = 4'h3 == loadReplaySel_0_REG ? uop_3_cf_loadWaitStrict : _GEN_866; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_868 = 4'h4 == loadReplaySel_0_REG ? uop_4_cf_loadWaitStrict : _GEN_867; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_869 = 4'h5 == loadReplaySel_0_REG ? uop_5_cf_loadWaitStrict : _GEN_868; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_870 = 4'h6 == loadReplaySel_0_REG ? uop_6_cf_loadWaitStrict : _GEN_869; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_871 = 4'h7 == loadReplaySel_0_REG ? uop_7_cf_loadWaitStrict : _GEN_870; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_872 = 4'h8 == loadReplaySel_0_REG ? uop_8_cf_loadWaitStrict : _GEN_871; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_873 = 4'h9 == loadReplaySel_0_REG ? uop_9_cf_loadWaitStrict : _GEN_872; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_874 = 4'ha == loadReplaySel_0_REG ? uop_10_cf_loadWaitStrict : _GEN_873; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_875 = 4'hb == loadReplaySel_0_REG ? uop_11_cf_loadWaitStrict : _GEN_874; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_876 = 4'hc == loadReplaySel_0_REG ? uop_12_cf_loadWaitStrict : _GEN_875; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_877 = 4'hd == loadReplaySel_0_REG ? uop_13_cf_loadWaitStrict : _GEN_876; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_878 = 4'he == loadReplaySel_0_REG ? uop_14_cf_loadWaitStrict : _GEN_877; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_897 = 4'h1 == loadReplaySel_0_REG ? uop_1_cf_ftqPtr_flag : uop_0_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_898 = 4'h2 == loadReplaySel_0_REG ? uop_2_cf_ftqPtr_flag : _GEN_897; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_899 = 4'h3 == loadReplaySel_0_REG ? uop_3_cf_ftqPtr_flag : _GEN_898; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_900 = 4'h4 == loadReplaySel_0_REG ? uop_4_cf_ftqPtr_flag : _GEN_899; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_901 = 4'h5 == loadReplaySel_0_REG ? uop_5_cf_ftqPtr_flag : _GEN_900; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_902 = 4'h6 == loadReplaySel_0_REG ? uop_6_cf_ftqPtr_flag : _GEN_901; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_903 = 4'h7 == loadReplaySel_0_REG ? uop_7_cf_ftqPtr_flag : _GEN_902; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_904 = 4'h8 == loadReplaySel_0_REG ? uop_8_cf_ftqPtr_flag : _GEN_903; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_905 = 4'h9 == loadReplaySel_0_REG ? uop_9_cf_ftqPtr_flag : _GEN_904; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_906 = 4'ha == loadReplaySel_0_REG ? uop_10_cf_ftqPtr_flag : _GEN_905; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_907 = 4'hb == loadReplaySel_0_REG ? uop_11_cf_ftqPtr_flag : _GEN_906; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_908 = 4'hc == loadReplaySel_0_REG ? uop_12_cf_ftqPtr_flag : _GEN_907; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_909 = 4'hd == loadReplaySel_0_REG ? uop_13_cf_ftqPtr_flag : _GEN_908; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_910 = 4'he == loadReplaySel_0_REG ? uop_14_cf_ftqPtr_flag : _GEN_909; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [2:0] _GEN_913 = 4'h1 == loadReplaySel_0_REG ? uop_1_cf_ftqPtr_value : uop_0_cf_ftqPtr_value; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [2:0] _GEN_914 = 4'h2 == loadReplaySel_0_REG ? uop_2_cf_ftqPtr_value : _GEN_913; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [2:0] _GEN_915 = 4'h3 == loadReplaySel_0_REG ? uop_3_cf_ftqPtr_value : _GEN_914; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [2:0] _GEN_916 = 4'h4 == loadReplaySel_0_REG ? uop_4_cf_ftqPtr_value : _GEN_915; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [2:0] _GEN_917 = 4'h5 == loadReplaySel_0_REG ? uop_5_cf_ftqPtr_value : _GEN_916; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [2:0] _GEN_918 = 4'h6 == loadReplaySel_0_REG ? uop_6_cf_ftqPtr_value : _GEN_917; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [2:0] _GEN_919 = 4'h7 == loadReplaySel_0_REG ? uop_7_cf_ftqPtr_value : _GEN_918; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [2:0] _GEN_920 = 4'h8 == loadReplaySel_0_REG ? uop_8_cf_ftqPtr_value : _GEN_919; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [2:0] _GEN_921 = 4'h9 == loadReplaySel_0_REG ? uop_9_cf_ftqPtr_value : _GEN_920; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [2:0] _GEN_922 = 4'ha == loadReplaySel_0_REG ? uop_10_cf_ftqPtr_value : _GEN_921; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [2:0] _GEN_923 = 4'hb == loadReplaySel_0_REG ? uop_11_cf_ftqPtr_value : _GEN_922; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [2:0] _GEN_924 = 4'hc == loadReplaySel_0_REG ? uop_12_cf_ftqPtr_value : _GEN_923; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [2:0] _GEN_925 = 4'hd == loadReplaySel_0_REG ? uop_13_cf_ftqPtr_value : _GEN_924; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [2:0] _GEN_926 = 4'he == loadReplaySel_0_REG ? uop_14_cf_ftqPtr_value : _GEN_925; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [2:0] _GEN_929 = 4'h1 == loadReplaySel_0_REG ? uop_1_cf_ftqOffset : uop_0_cf_ftqOffset; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [2:0] _GEN_930 = 4'h2 == loadReplaySel_0_REG ? uop_2_cf_ftqOffset : _GEN_929; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [2:0] _GEN_931 = 4'h3 == loadReplaySel_0_REG ? uop_3_cf_ftqOffset : _GEN_930; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [2:0] _GEN_932 = 4'h4 == loadReplaySel_0_REG ? uop_4_cf_ftqOffset : _GEN_931; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [2:0] _GEN_933 = 4'h5 == loadReplaySel_0_REG ? uop_5_cf_ftqOffset : _GEN_932; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [2:0] _GEN_934 = 4'h6 == loadReplaySel_0_REG ? uop_6_cf_ftqOffset : _GEN_933; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [2:0] _GEN_935 = 4'h7 == loadReplaySel_0_REG ? uop_7_cf_ftqOffset : _GEN_934; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [2:0] _GEN_936 = 4'h8 == loadReplaySel_0_REG ? uop_8_cf_ftqOffset : _GEN_935; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [2:0] _GEN_937 = 4'h9 == loadReplaySel_0_REG ? uop_9_cf_ftqOffset : _GEN_936; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [2:0] _GEN_938 = 4'ha == loadReplaySel_0_REG ? uop_10_cf_ftqOffset : _GEN_937; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [2:0] _GEN_939 = 4'hb == loadReplaySel_0_REG ? uop_11_cf_ftqOffset : _GEN_938; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [2:0] _GEN_940 = 4'hc == loadReplaySel_0_REG ? uop_12_cf_ftqOffset : _GEN_939; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [2:0] _GEN_941 = 4'hd == loadReplaySel_0_REG ? uop_13_cf_ftqOffset : _GEN_940; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [2:0] _GEN_942 = 4'he == loadReplaySel_0_REG ? uop_14_cf_ftqOffset : _GEN_941; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_1073 = 4'h1 == loadReplaySel_0_REG ? uop_1_ctrl_fuType : uop_0_ctrl_fuType; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_1074 = 4'h2 == loadReplaySel_0_REG ? uop_2_ctrl_fuType : _GEN_1073; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_1075 = 4'h3 == loadReplaySel_0_REG ? uop_3_ctrl_fuType : _GEN_1074; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_1076 = 4'h4 == loadReplaySel_0_REG ? uop_4_ctrl_fuType : _GEN_1075; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_1077 = 4'h5 == loadReplaySel_0_REG ? uop_5_ctrl_fuType : _GEN_1076; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_1078 = 4'h6 == loadReplaySel_0_REG ? uop_6_ctrl_fuType : _GEN_1077; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_1079 = 4'h7 == loadReplaySel_0_REG ? uop_7_ctrl_fuType : _GEN_1078; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_1080 = 4'h8 == loadReplaySel_0_REG ? uop_8_ctrl_fuType : _GEN_1079; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_1081 = 4'h9 == loadReplaySel_0_REG ? uop_9_ctrl_fuType : _GEN_1080; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_1082 = 4'ha == loadReplaySel_0_REG ? uop_10_ctrl_fuType : _GEN_1081; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_1083 = 4'hb == loadReplaySel_0_REG ? uop_11_ctrl_fuType : _GEN_1082; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_1084 = 4'hc == loadReplaySel_0_REG ? uop_12_ctrl_fuType : _GEN_1083; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_1085 = 4'hd == loadReplaySel_0_REG ? uop_13_ctrl_fuType : _GEN_1084; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_1086 = 4'he == loadReplaySel_0_REG ? uop_14_ctrl_fuType : _GEN_1085; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [6:0] _GEN_1089 = 4'h1 == loadReplaySel_0_REG ? uop_1_ctrl_fuOpType : uop_0_ctrl_fuOpType; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [6:0] _GEN_1090 = 4'h2 == loadReplaySel_0_REG ? uop_2_ctrl_fuOpType : _GEN_1089; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [6:0] _GEN_1091 = 4'h3 == loadReplaySel_0_REG ? uop_3_ctrl_fuOpType : _GEN_1090; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [6:0] _GEN_1092 = 4'h4 == loadReplaySel_0_REG ? uop_4_ctrl_fuOpType : _GEN_1091; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [6:0] _GEN_1093 = 4'h5 == loadReplaySel_0_REG ? uop_5_ctrl_fuOpType : _GEN_1092; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [6:0] _GEN_1094 = 4'h6 == loadReplaySel_0_REG ? uop_6_ctrl_fuOpType : _GEN_1093; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [6:0] _GEN_1095 = 4'h7 == loadReplaySel_0_REG ? uop_7_ctrl_fuOpType : _GEN_1094; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [6:0] _GEN_1096 = 4'h8 == loadReplaySel_0_REG ? uop_8_ctrl_fuOpType : _GEN_1095; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [6:0] _GEN_1097 = 4'h9 == loadReplaySel_0_REG ? uop_9_ctrl_fuOpType : _GEN_1096; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [6:0] _GEN_1098 = 4'ha == loadReplaySel_0_REG ? uop_10_ctrl_fuOpType : _GEN_1097; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [6:0] _GEN_1099 = 4'hb == loadReplaySel_0_REG ? uop_11_ctrl_fuOpType : _GEN_1098; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [6:0] _GEN_1100 = 4'hc == loadReplaySel_0_REG ? uop_12_ctrl_fuOpType : _GEN_1099; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [6:0] _GEN_1101 = 4'hd == loadReplaySel_0_REG ? uop_13_ctrl_fuOpType : _GEN_1100; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [6:0] _GEN_1102 = 4'he == loadReplaySel_0_REG ? uop_14_ctrl_fuOpType : _GEN_1101; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_1105 = 4'h1 == loadReplaySel_0_REG ? uop_1_ctrl_rfWen : uop_0_ctrl_rfWen; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_1106 = 4'h2 == loadReplaySel_0_REG ? uop_2_ctrl_rfWen : _GEN_1105; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_1107 = 4'h3 == loadReplaySel_0_REG ? uop_3_ctrl_rfWen : _GEN_1106; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_1108 = 4'h4 == loadReplaySel_0_REG ? uop_4_ctrl_rfWen : _GEN_1107; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_1109 = 4'h5 == loadReplaySel_0_REG ? uop_5_ctrl_rfWen : _GEN_1108; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_1110 = 4'h6 == loadReplaySel_0_REG ? uop_6_ctrl_rfWen : _GEN_1109; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_1111 = 4'h7 == loadReplaySel_0_REG ? uop_7_ctrl_rfWen : _GEN_1110; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_1112 = 4'h8 == loadReplaySel_0_REG ? uop_8_ctrl_rfWen : _GEN_1111; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_1113 = 4'h9 == loadReplaySel_0_REG ? uop_9_ctrl_rfWen : _GEN_1112; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_1114 = 4'ha == loadReplaySel_0_REG ? uop_10_ctrl_rfWen : _GEN_1113; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_1115 = 4'hb == loadReplaySel_0_REG ? uop_11_ctrl_rfWen : _GEN_1114; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_1116 = 4'hc == loadReplaySel_0_REG ? uop_12_ctrl_rfWen : _GEN_1115; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_1117 = 4'hd == loadReplaySel_0_REG ? uop_13_ctrl_rfWen : _GEN_1116; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_1118 = 4'he == loadReplaySel_0_REG ? uop_14_ctrl_rfWen : _GEN_1117; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_1121 = 4'h1 == loadReplaySel_0_REG ? uop_1_ctrl_fpWen : uop_0_ctrl_fpWen; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_1122 = 4'h2 == loadReplaySel_0_REG ? uop_2_ctrl_fpWen : _GEN_1121; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_1123 = 4'h3 == loadReplaySel_0_REG ? uop_3_ctrl_fpWen : _GEN_1122; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_1124 = 4'h4 == loadReplaySel_0_REG ? uop_4_ctrl_fpWen : _GEN_1123; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_1125 = 4'h5 == loadReplaySel_0_REG ? uop_5_ctrl_fpWen : _GEN_1124; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_1126 = 4'h6 == loadReplaySel_0_REG ? uop_6_ctrl_fpWen : _GEN_1125; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_1127 = 4'h7 == loadReplaySel_0_REG ? uop_7_ctrl_fpWen : _GEN_1126; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_1128 = 4'h8 == loadReplaySel_0_REG ? uop_8_ctrl_fpWen : _GEN_1127; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_1129 = 4'h9 == loadReplaySel_0_REG ? uop_9_ctrl_fpWen : _GEN_1128; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_1130 = 4'ha == loadReplaySel_0_REG ? uop_10_ctrl_fpWen : _GEN_1129; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_1131 = 4'hb == loadReplaySel_0_REG ? uop_11_ctrl_fpWen : _GEN_1130; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_1132 = 4'hc == loadReplaySel_0_REG ? uop_12_ctrl_fpWen : _GEN_1131; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_1133 = 4'hd == loadReplaySel_0_REG ? uop_13_ctrl_fpWen : _GEN_1132; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_1134 = 4'he == loadReplaySel_0_REG ? uop_14_ctrl_fpWen : _GEN_1133; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [5:0] _GEN_1617 = 4'h1 == loadReplaySel_0_REG ? uop_1_pdest : uop_0_pdest; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [5:0] _GEN_1618 = 4'h2 == loadReplaySel_0_REG ? uop_2_pdest : _GEN_1617; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [5:0] _GEN_1619 = 4'h3 == loadReplaySel_0_REG ? uop_3_pdest : _GEN_1618; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [5:0] _GEN_1620 = 4'h4 == loadReplaySel_0_REG ? uop_4_pdest : _GEN_1619; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [5:0] _GEN_1621 = 4'h5 == loadReplaySel_0_REG ? uop_5_pdest : _GEN_1620; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [5:0] _GEN_1622 = 4'h6 == loadReplaySel_0_REG ? uop_6_pdest : _GEN_1621; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [5:0] _GEN_1623 = 4'h7 == loadReplaySel_0_REG ? uop_7_pdest : _GEN_1622; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [5:0] _GEN_1624 = 4'h8 == loadReplaySel_0_REG ? uop_8_pdest : _GEN_1623; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [5:0] _GEN_1625 = 4'h9 == loadReplaySel_0_REG ? uop_9_pdest : _GEN_1624; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [5:0] _GEN_1626 = 4'ha == loadReplaySel_0_REG ? uop_10_pdest : _GEN_1625; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [5:0] _GEN_1627 = 4'hb == loadReplaySel_0_REG ? uop_11_pdest : _GEN_1626; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [5:0] _GEN_1628 = 4'hc == loadReplaySel_0_REG ? uop_12_pdest : _GEN_1627; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [5:0] _GEN_1629 = 4'hd == loadReplaySel_0_REG ? uop_13_pdest : _GEN_1628; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [5:0] _GEN_1630 = 4'he == loadReplaySel_0_REG ? uop_14_pdest : _GEN_1629; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_1649 = 4'h1 == loadReplaySel_0_REG ? uop_1_lqIdx_flag : uop_0_lqIdx_flag; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_1650 = 4'h2 == loadReplaySel_0_REG ? uop_2_lqIdx_flag : _GEN_1649; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_1651 = 4'h3 == loadReplaySel_0_REG ? uop_3_lqIdx_flag : _GEN_1650; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_1652 = 4'h4 == loadReplaySel_0_REG ? uop_4_lqIdx_flag : _GEN_1651; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_1653 = 4'h5 == loadReplaySel_0_REG ? uop_5_lqIdx_flag : _GEN_1652; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_1654 = 4'h6 == loadReplaySel_0_REG ? uop_6_lqIdx_flag : _GEN_1653; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_1655 = 4'h7 == loadReplaySel_0_REG ? uop_7_lqIdx_flag : _GEN_1654; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_1656 = 4'h8 == loadReplaySel_0_REG ? uop_8_lqIdx_flag : _GEN_1655; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_1657 = 4'h9 == loadReplaySel_0_REG ? uop_9_lqIdx_flag : _GEN_1656; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_1658 = 4'ha == loadReplaySel_0_REG ? uop_10_lqIdx_flag : _GEN_1657; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_1659 = 4'hb == loadReplaySel_0_REG ? uop_11_lqIdx_flag : _GEN_1658; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_1660 = 4'hc == loadReplaySel_0_REG ? uop_12_lqIdx_flag : _GEN_1659; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_1661 = 4'hd == loadReplaySel_0_REG ? uop_13_lqIdx_flag : _GEN_1660; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_1662 = 4'he == loadReplaySel_0_REG ? uop_14_lqIdx_flag : _GEN_1661; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_1665 = 4'h1 == loadReplaySel_0_REG ? uop_1_lqIdx_value : uop_0_lqIdx_value; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_1666 = 4'h2 == loadReplaySel_0_REG ? uop_2_lqIdx_value : _GEN_1665; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_1667 = 4'h3 == loadReplaySel_0_REG ? uop_3_lqIdx_value : _GEN_1666; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_1668 = 4'h4 == loadReplaySel_0_REG ? uop_4_lqIdx_value : _GEN_1667; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_1669 = 4'h5 == loadReplaySel_0_REG ? uop_5_lqIdx_value : _GEN_1668; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_1670 = 4'h6 == loadReplaySel_0_REG ? uop_6_lqIdx_value : _GEN_1669; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_1671 = 4'h7 == loadReplaySel_0_REG ? uop_7_lqIdx_value : _GEN_1670; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_1672 = 4'h8 == loadReplaySel_0_REG ? uop_8_lqIdx_value : _GEN_1671; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_1673 = 4'h9 == loadReplaySel_0_REG ? uop_9_lqIdx_value : _GEN_1672; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_1674 = 4'ha == loadReplaySel_0_REG ? uop_10_lqIdx_value : _GEN_1673; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_1675 = 4'hb == loadReplaySel_0_REG ? uop_11_lqIdx_value : _GEN_1674; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_1676 = 4'hc == loadReplaySel_0_REG ? uop_12_lqIdx_value : _GEN_1675; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_1677 = 4'hd == loadReplaySel_0_REG ? uop_13_lqIdx_value : _GEN_1676; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_1678 = 4'he == loadReplaySel_0_REG ? uop_14_lqIdx_value : _GEN_1677; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_1681 = 4'h1 == loadReplaySel_0_REG ? uop_1_sqIdx_flag : uop_0_sqIdx_flag; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_1682 = 4'h2 == loadReplaySel_0_REG ? uop_2_sqIdx_flag : _GEN_1681; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_1683 = 4'h3 == loadReplaySel_0_REG ? uop_3_sqIdx_flag : _GEN_1682; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_1684 = 4'h4 == loadReplaySel_0_REG ? uop_4_sqIdx_flag : _GEN_1683; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_1685 = 4'h5 == loadReplaySel_0_REG ? uop_5_sqIdx_flag : _GEN_1684; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_1686 = 4'h6 == loadReplaySel_0_REG ? uop_6_sqIdx_flag : _GEN_1685; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_1687 = 4'h7 == loadReplaySel_0_REG ? uop_7_sqIdx_flag : _GEN_1686; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_1688 = 4'h8 == loadReplaySel_0_REG ? uop_8_sqIdx_flag : _GEN_1687; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_1689 = 4'h9 == loadReplaySel_0_REG ? uop_9_sqIdx_flag : _GEN_1688; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_1690 = 4'ha == loadReplaySel_0_REG ? uop_10_sqIdx_flag : _GEN_1689; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_1691 = 4'hb == loadReplaySel_0_REG ? uop_11_sqIdx_flag : _GEN_1690; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_1692 = 4'hc == loadReplaySel_0_REG ? uop_12_sqIdx_flag : _GEN_1691; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_1693 = 4'hd == loadReplaySel_0_REG ? uop_13_sqIdx_flag : _GEN_1692; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_1694 = 4'he == loadReplaySel_0_REG ? uop_14_sqIdx_flag : _GEN_1693; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_1697 = 4'h1 == loadReplaySel_0_REG ? uop_1_sqIdx_value : uop_0_sqIdx_value; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_1698 = 4'h2 == loadReplaySel_0_REG ? uop_2_sqIdx_value : _GEN_1697; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_1699 = 4'h3 == loadReplaySel_0_REG ? uop_3_sqIdx_value : _GEN_1698; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_1700 = 4'h4 == loadReplaySel_0_REG ? uop_4_sqIdx_value : _GEN_1699; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_1701 = 4'h5 == loadReplaySel_0_REG ? uop_5_sqIdx_value : _GEN_1700; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_1702 = 4'h6 == loadReplaySel_0_REG ? uop_6_sqIdx_value : _GEN_1701; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_1703 = 4'h7 == loadReplaySel_0_REG ? uop_7_sqIdx_value : _GEN_1702; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_1704 = 4'h8 == loadReplaySel_0_REG ? uop_8_sqIdx_value : _GEN_1703; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_1705 = 4'h9 == loadReplaySel_0_REG ? uop_9_sqIdx_value : _GEN_1704; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_1706 = 4'ha == loadReplaySel_0_REG ? uop_10_sqIdx_value : _GEN_1705; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_1707 = 4'hb == loadReplaySel_0_REG ? uop_11_sqIdx_value : _GEN_1706; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_1708 = 4'hc == loadReplaySel_0_REG ? uop_12_sqIdx_value : _GEN_1707; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_1709 = 4'hd == loadReplaySel_0_REG ? uop_13_sqIdx_value : _GEN_1708; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_1710 = 4'he == loadReplaySel_0_REG ? uop_14_sqIdx_value : _GEN_1709; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [7:0] _GEN_1889 = 4'h1 == loadReplaySel_0_REG ? replayCarryReg_1_real_way_en : replayCarryReg_0_real_way_en; // @[LoadQueueReplay.scala 325:{35,35}]
  wire [7:0] _GEN_1890 = 4'h2 == loadReplaySel_0_REG ? replayCarryReg_2_real_way_en : _GEN_1889; // @[LoadQueueReplay.scala 325:{35,35}]
  wire [7:0] _GEN_1891 = 4'h3 == loadReplaySel_0_REG ? replayCarryReg_3_real_way_en : _GEN_1890; // @[LoadQueueReplay.scala 325:{35,35}]
  wire [7:0] _GEN_1892 = 4'h4 == loadReplaySel_0_REG ? replayCarryReg_4_real_way_en : _GEN_1891; // @[LoadQueueReplay.scala 325:{35,35}]
  wire [7:0] _GEN_1893 = 4'h5 == loadReplaySel_0_REG ? replayCarryReg_5_real_way_en : _GEN_1892; // @[LoadQueueReplay.scala 325:{35,35}]
  wire [7:0] _GEN_1894 = 4'h6 == loadReplaySel_0_REG ? replayCarryReg_6_real_way_en : _GEN_1893; // @[LoadQueueReplay.scala 325:{35,35}]
  wire [7:0] _GEN_1895 = 4'h7 == loadReplaySel_0_REG ? replayCarryReg_7_real_way_en : _GEN_1894; // @[LoadQueueReplay.scala 325:{35,35}]
  wire [7:0] _GEN_1896 = 4'h8 == loadReplaySel_0_REG ? replayCarryReg_8_real_way_en : _GEN_1895; // @[LoadQueueReplay.scala 325:{35,35}]
  wire [7:0] _GEN_1897 = 4'h9 == loadReplaySel_0_REG ? replayCarryReg_9_real_way_en : _GEN_1896; // @[LoadQueueReplay.scala 325:{35,35}]
  wire [7:0] _GEN_1898 = 4'ha == loadReplaySel_0_REG ? replayCarryReg_10_real_way_en : _GEN_1897; // @[LoadQueueReplay.scala 325:{35,35}]
  wire [7:0] _GEN_1899 = 4'hb == loadReplaySel_0_REG ? replayCarryReg_11_real_way_en : _GEN_1898; // @[LoadQueueReplay.scala 325:{35,35}]
  wire [7:0] _GEN_1900 = 4'hc == loadReplaySel_0_REG ? replayCarryReg_12_real_way_en : _GEN_1899; // @[LoadQueueReplay.scala 325:{35,35}]
  wire [7:0] _GEN_1901 = 4'hd == loadReplaySel_0_REG ? replayCarryReg_13_real_way_en : _GEN_1900; // @[LoadQueueReplay.scala 325:{35,35}]
  wire [7:0] _GEN_1902 = 4'he == loadReplaySel_0_REG ? replayCarryReg_14_real_way_en : _GEN_1901; // @[LoadQueueReplay.scala 325:{35,35}]
  wire  _GEN_1905 = 4'h1 == loadReplaySel_0_REG ? replayCarryReg_1_valid : replayCarryReg_0_valid; // @[LoadQueueReplay.scala 325:{35,35}]
  wire  _GEN_1906 = 4'h2 == loadReplaySel_0_REG ? replayCarryReg_2_valid : _GEN_1905; // @[LoadQueueReplay.scala 325:{35,35}]
  wire  _GEN_1907 = 4'h3 == loadReplaySel_0_REG ? replayCarryReg_3_valid : _GEN_1906; // @[LoadQueueReplay.scala 325:{35,35}]
  wire  _GEN_1908 = 4'h4 == loadReplaySel_0_REG ? replayCarryReg_4_valid : _GEN_1907; // @[LoadQueueReplay.scala 325:{35,35}]
  wire  _GEN_1909 = 4'h5 == loadReplaySel_0_REG ? replayCarryReg_5_valid : _GEN_1908; // @[LoadQueueReplay.scala 325:{35,35}]
  wire  _GEN_1910 = 4'h6 == loadReplaySel_0_REG ? replayCarryReg_6_valid : _GEN_1909; // @[LoadQueueReplay.scala 325:{35,35}]
  wire  _GEN_1911 = 4'h7 == loadReplaySel_0_REG ? replayCarryReg_7_valid : _GEN_1910; // @[LoadQueueReplay.scala 325:{35,35}]
  wire  _GEN_1912 = 4'h8 == loadReplaySel_0_REG ? replayCarryReg_8_valid : _GEN_1911; // @[LoadQueueReplay.scala 325:{35,35}]
  wire  _GEN_1913 = 4'h9 == loadReplaySel_0_REG ? replayCarryReg_9_valid : _GEN_1912; // @[LoadQueueReplay.scala 325:{35,35}]
  wire  _GEN_1914 = 4'ha == loadReplaySel_0_REG ? replayCarryReg_10_valid : _GEN_1913; // @[LoadQueueReplay.scala 325:{35,35}]
  wire  _GEN_1915 = 4'hb == loadReplaySel_0_REG ? replayCarryReg_11_valid : _GEN_1914; // @[LoadQueueReplay.scala 325:{35,35}]
  wire  _GEN_1916 = 4'hc == loadReplaySel_0_REG ? replayCarryReg_12_valid : _GEN_1915; // @[LoadQueueReplay.scala 325:{35,35}]
  wire  _GEN_1917 = 4'hd == loadReplaySel_0_REG ? replayCarryReg_13_valid : _GEN_1916; // @[LoadQueueReplay.scala 325:{35,35}]
  wire  _GEN_1918 = 4'he == loadReplaySel_0_REG ? replayCarryReg_14_valid : _GEN_1917; // @[LoadQueueReplay.scala 325:{35,35}]
  wire [1:0] _GEN_1921 = 4'h1 == loadReplaySel_0_REG ? missMSHRId_1 : missMSHRId_0; // @[LoadQueueReplay.scala 326:{30,30}]
  wire [1:0] _GEN_1922 = 4'h2 == loadReplaySel_0_REG ? missMSHRId_2 : _GEN_1921; // @[LoadQueueReplay.scala 326:{30,30}]
  wire [1:0] _GEN_1923 = 4'h3 == loadReplaySel_0_REG ? missMSHRId_3 : _GEN_1922; // @[LoadQueueReplay.scala 326:{30,30}]
  wire [1:0] _GEN_1924 = 4'h4 == loadReplaySel_0_REG ? missMSHRId_4 : _GEN_1923; // @[LoadQueueReplay.scala 326:{30,30}]
  wire [1:0] _GEN_1925 = 4'h5 == loadReplaySel_0_REG ? missMSHRId_5 : _GEN_1924; // @[LoadQueueReplay.scala 326:{30,30}]
  wire [1:0] _GEN_1926 = 4'h6 == loadReplaySel_0_REG ? missMSHRId_6 : _GEN_1925; // @[LoadQueueReplay.scala 326:{30,30}]
  wire [1:0] _GEN_1927 = 4'h7 == loadReplaySel_0_REG ? missMSHRId_7 : _GEN_1926; // @[LoadQueueReplay.scala 326:{30,30}]
  wire [1:0] _GEN_1928 = 4'h8 == loadReplaySel_0_REG ? missMSHRId_8 : _GEN_1927; // @[LoadQueueReplay.scala 326:{30,30}]
  wire [1:0] _GEN_1929 = 4'h9 == loadReplaySel_0_REG ? missMSHRId_9 : _GEN_1928; // @[LoadQueueReplay.scala 326:{30,30}]
  wire [1:0] _GEN_1930 = 4'ha == loadReplaySel_0_REG ? missMSHRId_10 : _GEN_1929; // @[LoadQueueReplay.scala 326:{30,30}]
  wire [1:0] _GEN_1931 = 4'hb == loadReplaySel_0_REG ? missMSHRId_11 : _GEN_1930; // @[LoadQueueReplay.scala 326:{30,30}]
  wire [1:0] _GEN_1932 = 4'hc == loadReplaySel_0_REG ? missMSHRId_12 : _GEN_1931; // @[LoadQueueReplay.scala 326:{30,30}]
  wire [1:0] _GEN_1933 = 4'hd == loadReplaySel_0_REG ? missMSHRId_13 : _GEN_1932; // @[LoadQueueReplay.scala 326:{30,30}]
  wire [1:0] _GEN_1934 = 4'he == loadReplaySel_0_REG ? missMSHRId_14 : _GEN_1933; // @[LoadQueueReplay.scala 326:{30,30}]
  wire  _GEN_1937 = 4'h1 == loadReplaySel_0_REG ? trueCacheMissReplay_1 : trueCacheMissReplay_0; // @[LoadQueueReplay.scala 327:{42,42}]
  wire  _GEN_1938 = 4'h2 == loadReplaySel_0_REG ? trueCacheMissReplay_2 : _GEN_1937; // @[LoadQueueReplay.scala 327:{42,42}]
  wire  _GEN_1939 = 4'h3 == loadReplaySel_0_REG ? trueCacheMissReplay_3 : _GEN_1938; // @[LoadQueueReplay.scala 327:{42,42}]
  wire  _GEN_1940 = 4'h4 == loadReplaySel_0_REG ? trueCacheMissReplay_4 : _GEN_1939; // @[LoadQueueReplay.scala 327:{42,42}]
  wire  _GEN_1941 = 4'h5 == loadReplaySel_0_REG ? trueCacheMissReplay_5 : _GEN_1940; // @[LoadQueueReplay.scala 327:{42,42}]
  wire  _GEN_1942 = 4'h6 == loadReplaySel_0_REG ? trueCacheMissReplay_6 : _GEN_1941; // @[LoadQueueReplay.scala 327:{42,42}]
  wire  _GEN_1943 = 4'h7 == loadReplaySel_0_REG ? trueCacheMissReplay_7 : _GEN_1942; // @[LoadQueueReplay.scala 327:{42,42}]
  wire  _GEN_1944 = 4'h8 == loadReplaySel_0_REG ? trueCacheMissReplay_8 : _GEN_1943; // @[LoadQueueReplay.scala 327:{42,42}]
  wire  _GEN_1945 = 4'h9 == loadReplaySel_0_REG ? trueCacheMissReplay_9 : _GEN_1944; // @[LoadQueueReplay.scala 327:{42,42}]
  wire  _GEN_1946 = 4'ha == loadReplaySel_0_REG ? trueCacheMissReplay_10 : _GEN_1945; // @[LoadQueueReplay.scala 327:{42,42}]
  wire  _GEN_1947 = 4'hb == loadReplaySel_0_REG ? trueCacheMissReplay_11 : _GEN_1946; // @[LoadQueueReplay.scala 327:{42,42}]
  wire  _GEN_1948 = 4'hc == loadReplaySel_0_REG ? trueCacheMissReplay_12 : _GEN_1947; // @[LoadQueueReplay.scala 327:{42,42}]
  wire  _GEN_1949 = 4'hd == loadReplaySel_0_REG ? trueCacheMissReplay_13 : _GEN_1948; // @[LoadQueueReplay.scala 327:{42,42}]
  wire  _GEN_1950 = 4'he == loadReplaySel_0_REG ? trueCacheMissReplay_14 : _GEN_1949; // @[LoadQueueReplay.scala 327:{42,42}]
  wire  _GEN_1953 = 4'h1 == loadReplaySel_0_REG ? flags_1_rarAllocated : flags_0_rarAllocated; // @[LoadQueueReplay.scala 328:{36,36}]
  wire  _GEN_1954 = 4'h2 == loadReplaySel_0_REG ? flags_2_rarAllocated : _GEN_1953; // @[LoadQueueReplay.scala 328:{36,36}]
  wire  _GEN_1955 = 4'h3 == loadReplaySel_0_REG ? flags_3_rarAllocated : _GEN_1954; // @[LoadQueueReplay.scala 328:{36,36}]
  wire  _GEN_1956 = 4'h4 == loadReplaySel_0_REG ? flags_4_rarAllocated : _GEN_1955; // @[LoadQueueReplay.scala 328:{36,36}]
  wire  _GEN_1957 = 4'h5 == loadReplaySel_0_REG ? flags_5_rarAllocated : _GEN_1956; // @[LoadQueueReplay.scala 328:{36,36}]
  wire  _GEN_1958 = 4'h6 == loadReplaySel_0_REG ? flags_6_rarAllocated : _GEN_1957; // @[LoadQueueReplay.scala 328:{36,36}]
  wire  _GEN_1959 = 4'h7 == loadReplaySel_0_REG ? flags_7_rarAllocated : _GEN_1958; // @[LoadQueueReplay.scala 328:{36,36}]
  wire  _GEN_1960 = 4'h8 == loadReplaySel_0_REG ? flags_8_rarAllocated : _GEN_1959; // @[LoadQueueReplay.scala 328:{36,36}]
  wire  _GEN_1961 = 4'h9 == loadReplaySel_0_REG ? flags_9_rarAllocated : _GEN_1960; // @[LoadQueueReplay.scala 328:{36,36}]
  wire  _GEN_1962 = 4'ha == loadReplaySel_0_REG ? flags_10_rarAllocated : _GEN_1961; // @[LoadQueueReplay.scala 328:{36,36}]
  wire  _GEN_1963 = 4'hb == loadReplaySel_0_REG ? flags_11_rarAllocated : _GEN_1962; // @[LoadQueueReplay.scala 328:{36,36}]
  wire  _GEN_1964 = 4'hc == loadReplaySel_0_REG ? flags_12_rarAllocated : _GEN_1963; // @[LoadQueueReplay.scala 328:{36,36}]
  wire  _GEN_1965 = 4'hd == loadReplaySel_0_REG ? flags_13_rarAllocated : _GEN_1964; // @[LoadQueueReplay.scala 328:{36,36}]
  wire  _GEN_1966 = 4'he == loadReplaySel_0_REG ? flags_14_rarAllocated : _GEN_1965; // @[LoadQueueReplay.scala 328:{36,36}]
  wire [3:0] _GEN_1969 = 4'h1 == loadReplaySel_0_REG ? flags_1_rarIndex : flags_0_rarIndex; // @[LoadQueueReplay.scala 329:{32,32}]
  wire [3:0] _GEN_1970 = 4'h2 == loadReplaySel_0_REG ? flags_2_rarIndex : _GEN_1969; // @[LoadQueueReplay.scala 329:{32,32}]
  wire [3:0] _GEN_1971 = 4'h3 == loadReplaySel_0_REG ? flags_3_rarIndex : _GEN_1970; // @[LoadQueueReplay.scala 329:{32,32}]
  wire [3:0] _GEN_1972 = 4'h4 == loadReplaySel_0_REG ? flags_4_rarIndex : _GEN_1971; // @[LoadQueueReplay.scala 329:{32,32}]
  wire [3:0] _GEN_1973 = 4'h5 == loadReplaySel_0_REG ? flags_5_rarIndex : _GEN_1972; // @[LoadQueueReplay.scala 329:{32,32}]
  wire [3:0] _GEN_1974 = 4'h6 == loadReplaySel_0_REG ? flags_6_rarIndex : _GEN_1973; // @[LoadQueueReplay.scala 329:{32,32}]
  wire [3:0] _GEN_1975 = 4'h7 == loadReplaySel_0_REG ? flags_7_rarIndex : _GEN_1974; // @[LoadQueueReplay.scala 329:{32,32}]
  wire [3:0] _GEN_1976 = 4'h8 == loadReplaySel_0_REG ? flags_8_rarIndex : _GEN_1975; // @[LoadQueueReplay.scala 329:{32,32}]
  wire [3:0] _GEN_1977 = 4'h9 == loadReplaySel_0_REG ? flags_9_rarIndex : _GEN_1976; // @[LoadQueueReplay.scala 329:{32,32}]
  wire [3:0] _GEN_1978 = 4'ha == loadReplaySel_0_REG ? flags_10_rarIndex : _GEN_1977; // @[LoadQueueReplay.scala 329:{32,32}]
  wire [3:0] _GEN_1979 = 4'hb == loadReplaySel_0_REG ? flags_11_rarIndex : _GEN_1978; // @[LoadQueueReplay.scala 329:{32,32}]
  wire [3:0] _GEN_1980 = 4'hc == loadReplaySel_0_REG ? flags_12_rarIndex : _GEN_1979; // @[LoadQueueReplay.scala 329:{32,32}]
  wire [3:0] _GEN_1981 = 4'hd == loadReplaySel_0_REG ? flags_13_rarIndex : _GEN_1980; // @[LoadQueueReplay.scala 329:{32,32}]
  wire [3:0] _GEN_1982 = 4'he == loadReplaySel_0_REG ? flags_14_rarIndex : _GEN_1981; // @[LoadQueueReplay.scala 329:{32,32}]
  wire  _GEN_1985 = 4'h1 == loadReplaySel_0_REG ? flags_1_rawAllocated : flags_0_rawAllocated; // @[LoadQueueReplay.scala 330:{36,36}]
  wire  _GEN_1986 = 4'h2 == loadReplaySel_0_REG ? flags_2_rawAllocated : _GEN_1985; // @[LoadQueueReplay.scala 330:{36,36}]
  wire  _GEN_1987 = 4'h3 == loadReplaySel_0_REG ? flags_3_rawAllocated : _GEN_1986; // @[LoadQueueReplay.scala 330:{36,36}]
  wire  _GEN_1988 = 4'h4 == loadReplaySel_0_REG ? flags_4_rawAllocated : _GEN_1987; // @[LoadQueueReplay.scala 330:{36,36}]
  wire  _GEN_1989 = 4'h5 == loadReplaySel_0_REG ? flags_5_rawAllocated : _GEN_1988; // @[LoadQueueReplay.scala 330:{36,36}]
  wire  _GEN_1990 = 4'h6 == loadReplaySel_0_REG ? flags_6_rawAllocated : _GEN_1989; // @[LoadQueueReplay.scala 330:{36,36}]
  wire  _GEN_1991 = 4'h7 == loadReplaySel_0_REG ? flags_7_rawAllocated : _GEN_1990; // @[LoadQueueReplay.scala 330:{36,36}]
  wire  _GEN_1992 = 4'h8 == loadReplaySel_0_REG ? flags_8_rawAllocated : _GEN_1991; // @[LoadQueueReplay.scala 330:{36,36}]
  wire  _GEN_1993 = 4'h9 == loadReplaySel_0_REG ? flags_9_rawAllocated : _GEN_1992; // @[LoadQueueReplay.scala 330:{36,36}]
  wire  _GEN_1994 = 4'ha == loadReplaySel_0_REG ? flags_10_rawAllocated : _GEN_1993; // @[LoadQueueReplay.scala 330:{36,36}]
  wire  _GEN_1995 = 4'hb == loadReplaySel_0_REG ? flags_11_rawAllocated : _GEN_1994; // @[LoadQueueReplay.scala 330:{36,36}]
  wire  _GEN_1996 = 4'hc == loadReplaySel_0_REG ? flags_12_rawAllocated : _GEN_1995; // @[LoadQueueReplay.scala 330:{36,36}]
  wire  _GEN_1997 = 4'hd == loadReplaySel_0_REG ? flags_13_rawAllocated : _GEN_1996; // @[LoadQueueReplay.scala 330:{36,36}]
  wire  _GEN_1998 = 4'he == loadReplaySel_0_REG ? flags_14_rawAllocated : _GEN_1997; // @[LoadQueueReplay.scala 330:{36,36}]
  wire [2:0] _GEN_2001 = 4'h1 == loadReplaySel_0_REG ? flags_1_rawIndex : flags_0_rawIndex; // @[LoadQueueReplay.scala 331:{32,32}]
  wire [2:0] _GEN_2002 = 4'h2 == loadReplaySel_0_REG ? flags_2_rawIndex : _GEN_2001; // @[LoadQueueReplay.scala 331:{32,32}]
  wire [2:0] _GEN_2003 = 4'h3 == loadReplaySel_0_REG ? flags_3_rawIndex : _GEN_2002; // @[LoadQueueReplay.scala 331:{32,32}]
  wire [2:0] _GEN_2004 = 4'h4 == loadReplaySel_0_REG ? flags_4_rawIndex : _GEN_2003; // @[LoadQueueReplay.scala 331:{32,32}]
  wire [2:0] _GEN_2005 = 4'h5 == loadReplaySel_0_REG ? flags_5_rawIndex : _GEN_2004; // @[LoadQueueReplay.scala 331:{32,32}]
  wire [2:0] _GEN_2006 = 4'h6 == loadReplaySel_0_REG ? flags_6_rawIndex : _GEN_2005; // @[LoadQueueReplay.scala 331:{32,32}]
  wire [2:0] _GEN_2007 = 4'h7 == loadReplaySel_0_REG ? flags_7_rawIndex : _GEN_2006; // @[LoadQueueReplay.scala 331:{32,32}]
  wire [2:0] _GEN_2008 = 4'h8 == loadReplaySel_0_REG ? flags_8_rawIndex : _GEN_2007; // @[LoadQueueReplay.scala 331:{32,32}]
  wire [2:0] _GEN_2009 = 4'h9 == loadReplaySel_0_REG ? flags_9_rawIndex : _GEN_2008; // @[LoadQueueReplay.scala 331:{32,32}]
  wire [2:0] _GEN_2010 = 4'ha == loadReplaySel_0_REG ? flags_10_rawIndex : _GEN_2009; // @[LoadQueueReplay.scala 331:{32,32}]
  wire [2:0] _GEN_2011 = 4'hb == loadReplaySel_0_REG ? flags_11_rawIndex : _GEN_2010; // @[LoadQueueReplay.scala 331:{32,32}]
  wire [2:0] _GEN_2012 = 4'hc == loadReplaySel_0_REG ? flags_12_rawIndex : _GEN_2011; // @[LoadQueueReplay.scala 331:{32,32}]
  wire [2:0] _GEN_2013 = 4'hd == loadReplaySel_0_REG ? flags_13_rawIndex : _GEN_2012; // @[LoadQueueReplay.scala 331:{32,32}]
  wire [2:0] _GEN_2014 = 4'he == loadReplaySel_0_REG ? flags_14_rawIndex : _GEN_2013; // @[LoadQueueReplay.scala 331:{32,32}]
  wire  _GEN_2016 = 4'h0 == loadReplaySel_0_REG ? 1'h0 : allocated_0; // @[LoadQueueReplay.scala 111:26 334:{28,28}]
  wire  _GEN_2017 = 4'h1 == loadReplaySel_0_REG ? 1'h0 : allocated_1; // @[LoadQueueReplay.scala 111:26 334:{28,28}]
  wire  _GEN_2018 = 4'h2 == loadReplaySel_0_REG ? 1'h0 : allocated_2; // @[LoadQueueReplay.scala 111:26 334:{28,28}]
  wire  _GEN_2019 = 4'h3 == loadReplaySel_0_REG ? 1'h0 : allocated_3; // @[LoadQueueReplay.scala 111:26 334:{28,28}]
  wire  _GEN_2020 = 4'h4 == loadReplaySel_0_REG ? 1'h0 : allocated_4; // @[LoadQueueReplay.scala 111:26 334:{28,28}]
  wire  _GEN_2021 = 4'h5 == loadReplaySel_0_REG ? 1'h0 : allocated_5; // @[LoadQueueReplay.scala 111:26 334:{28,28}]
  wire  _GEN_2022 = 4'h6 == loadReplaySel_0_REG ? 1'h0 : allocated_6; // @[LoadQueueReplay.scala 111:26 334:{28,28}]
  wire  _GEN_2023 = 4'h7 == loadReplaySel_0_REG ? 1'h0 : allocated_7; // @[LoadQueueReplay.scala 111:26 334:{28,28}]
  wire  _GEN_2024 = 4'h8 == loadReplaySel_0_REG ? 1'h0 : allocated_8; // @[LoadQueueReplay.scala 111:26 334:{28,28}]
  wire  _GEN_2025 = 4'h9 == loadReplaySel_0_REG ? 1'h0 : allocated_9; // @[LoadQueueReplay.scala 111:26 334:{28,28}]
  wire  _GEN_2026 = 4'ha == loadReplaySel_0_REG ? 1'h0 : allocated_10; // @[LoadQueueReplay.scala 111:26 334:{28,28}]
  wire  _GEN_2027 = 4'hb == loadReplaySel_0_REG ? 1'h0 : allocated_11; // @[LoadQueueReplay.scala 111:26 334:{28,28}]
  wire  _GEN_2028 = 4'hc == loadReplaySel_0_REG ? 1'h0 : allocated_12; // @[LoadQueueReplay.scala 111:26 334:{28,28}]
  wire  _GEN_2029 = 4'hd == loadReplaySel_0_REG ? 1'h0 : allocated_13; // @[LoadQueueReplay.scala 111:26 334:{28,28}]
  wire  _GEN_2030 = 4'he == loadReplaySel_0_REG ? 1'h0 : allocated_14; // @[LoadQueueReplay.scala 111:26 334:{28,28}]
  wire  _GEN_2031 = 4'hf == loadReplaySel_0_REG ? 1'h0 : allocated_15; // @[LoadQueueReplay.scala 111:26 334:{28,28}]
  wire  _GEN_2048 = replayRemFire_0 ? _GEN_2016 : allocated_0; // @[LoadQueueReplay.scala 111:26 333:30]
  wire  _GEN_2049 = replayRemFire_0 ? _GEN_2017 : allocated_1; // @[LoadQueueReplay.scala 111:26 333:30]
  wire  _GEN_2050 = replayRemFire_0 ? _GEN_2018 : allocated_2; // @[LoadQueueReplay.scala 111:26 333:30]
  wire  _GEN_2051 = replayRemFire_0 ? _GEN_2019 : allocated_3; // @[LoadQueueReplay.scala 111:26 333:30]
  wire  _GEN_2052 = replayRemFire_0 ? _GEN_2020 : allocated_4; // @[LoadQueueReplay.scala 111:26 333:30]
  wire  _GEN_2053 = replayRemFire_0 ? _GEN_2021 : allocated_5; // @[LoadQueueReplay.scala 111:26 333:30]
  wire  _GEN_2054 = replayRemFire_0 ? _GEN_2022 : allocated_6; // @[LoadQueueReplay.scala 111:26 333:30]
  wire  _GEN_2055 = replayRemFire_0 ? _GEN_2023 : allocated_7; // @[LoadQueueReplay.scala 111:26 333:30]
  wire  _GEN_2056 = replayRemFire_0 ? _GEN_2024 : allocated_8; // @[LoadQueueReplay.scala 111:26 333:30]
  wire  _GEN_2057 = replayRemFire_0 ? _GEN_2025 : allocated_9; // @[LoadQueueReplay.scala 111:26 333:30]
  wire  _GEN_2058 = replayRemFire_0 ? _GEN_2026 : allocated_10; // @[LoadQueueReplay.scala 111:26 333:30]
  wire  _GEN_2059 = replayRemFire_0 ? _GEN_2027 : allocated_11; // @[LoadQueueReplay.scala 111:26 333:30]
  wire  _GEN_2060 = replayRemFire_0 ? _GEN_2028 : allocated_12; // @[LoadQueueReplay.scala 111:26 333:30]
  wire  _GEN_2061 = replayRemFire_0 ? _GEN_2029 : allocated_13; // @[LoadQueueReplay.scala 111:26 333:30]
  wire  _GEN_2062 = replayRemFire_0 ? _GEN_2030 : allocated_14; // @[LoadQueueReplay.scala 111:26 333:30]
  wire  _GEN_2063 = replayRemFire_0 ? _GEN_2031 : allocated_15; // @[LoadQueueReplay.scala 111:26 333:30]
  reg  cancelReplay_REG_1_valid; // @[LoadQueueReplay.scala 315:63]
  reg  cancelReplay_REG_1_bits_robIdx_flag; // @[LoadQueueReplay.scala 315:63]
  reg [4:0] cancelReplay_REG_1_bits_robIdx_value; // @[LoadQueueReplay.scala 315:63]
  reg  cancelReplay_REG_1_bits_level; // @[LoadQueueReplay.scala 315:63]
  wire  _GEN_2066 = 4'h1 == loadReplaySel_1_REG ? uop_1_robIdx_flag : uop_0_robIdx_flag; // @[CircularQueuePtr.scala 61:{50,50}]
  wire  _GEN_2067 = 4'h2 == loadReplaySel_1_REG ? uop_2_robIdx_flag : _GEN_2066; // @[CircularQueuePtr.scala 61:{50,50}]
  wire  _GEN_2068 = 4'h3 == loadReplaySel_1_REG ? uop_3_robIdx_flag : _GEN_2067; // @[CircularQueuePtr.scala 61:{50,50}]
  wire  _GEN_2069 = 4'h4 == loadReplaySel_1_REG ? uop_4_robIdx_flag : _GEN_2068; // @[CircularQueuePtr.scala 61:{50,50}]
  wire  _GEN_2070 = 4'h5 == loadReplaySel_1_REG ? uop_5_robIdx_flag : _GEN_2069; // @[CircularQueuePtr.scala 61:{50,50}]
  wire  _GEN_2071 = 4'h6 == loadReplaySel_1_REG ? uop_6_robIdx_flag : _GEN_2070; // @[CircularQueuePtr.scala 61:{50,50}]
  wire  _GEN_2072 = 4'h7 == loadReplaySel_1_REG ? uop_7_robIdx_flag : _GEN_2071; // @[CircularQueuePtr.scala 61:{50,50}]
  wire  _GEN_2073 = 4'h8 == loadReplaySel_1_REG ? uop_8_robIdx_flag : _GEN_2072; // @[CircularQueuePtr.scala 61:{50,50}]
  wire  _GEN_2074 = 4'h9 == loadReplaySel_1_REG ? uop_9_robIdx_flag : _GEN_2073; // @[CircularQueuePtr.scala 61:{50,50}]
  wire  _GEN_2075 = 4'ha == loadReplaySel_1_REG ? uop_10_robIdx_flag : _GEN_2074; // @[CircularQueuePtr.scala 61:{50,50}]
  wire  _GEN_2076 = 4'hb == loadReplaySel_1_REG ? uop_11_robIdx_flag : _GEN_2075; // @[CircularQueuePtr.scala 61:{50,50}]
  wire  _GEN_2077 = 4'hc == loadReplaySel_1_REG ? uop_12_robIdx_flag : _GEN_2076; // @[CircularQueuePtr.scala 61:{50,50}]
  wire  _GEN_2078 = 4'hd == loadReplaySel_1_REG ? uop_13_robIdx_flag : _GEN_2077; // @[CircularQueuePtr.scala 61:{50,50}]
  wire  _GEN_2079 = 4'he == loadReplaySel_1_REG ? uop_14_robIdx_flag : _GEN_2078; // @[CircularQueuePtr.scala 61:{50,50}]
  wire  _GEN_2080 = 4'hf == loadReplaySel_1_REG ? uop_15_robIdx_flag : _GEN_2079; // @[CircularQueuePtr.scala 61:{50,50}]
  wire [4:0] _GEN_2082 = 4'h1 == loadReplaySel_1_REG ? uop_1_robIdx_value : uop_0_robIdx_value; // @[CircularQueuePtr.scala 61:{50,50}]
  wire [4:0] _GEN_2083 = 4'h2 == loadReplaySel_1_REG ? uop_2_robIdx_value : _GEN_2082; // @[CircularQueuePtr.scala 61:{50,50}]
  wire [4:0] _GEN_2084 = 4'h3 == loadReplaySel_1_REG ? uop_3_robIdx_value : _GEN_2083; // @[CircularQueuePtr.scala 61:{50,50}]
  wire [4:0] _GEN_2085 = 4'h4 == loadReplaySel_1_REG ? uop_4_robIdx_value : _GEN_2084; // @[CircularQueuePtr.scala 61:{50,50}]
  wire [4:0] _GEN_2086 = 4'h5 == loadReplaySel_1_REG ? uop_5_robIdx_value : _GEN_2085; // @[CircularQueuePtr.scala 61:{50,50}]
  wire [4:0] _GEN_2087 = 4'h6 == loadReplaySel_1_REG ? uop_6_robIdx_value : _GEN_2086; // @[CircularQueuePtr.scala 61:{50,50}]
  wire [4:0] _GEN_2088 = 4'h7 == loadReplaySel_1_REG ? uop_7_robIdx_value : _GEN_2087; // @[CircularQueuePtr.scala 61:{50,50}]
  wire [4:0] _GEN_2089 = 4'h8 == loadReplaySel_1_REG ? uop_8_robIdx_value : _GEN_2088; // @[CircularQueuePtr.scala 61:{50,50}]
  wire [4:0] _GEN_2090 = 4'h9 == loadReplaySel_1_REG ? uop_9_robIdx_value : _GEN_2089; // @[CircularQueuePtr.scala 61:{50,50}]
  wire [4:0] _GEN_2091 = 4'ha == loadReplaySel_1_REG ? uop_10_robIdx_value : _GEN_2090; // @[CircularQueuePtr.scala 61:{50,50}]
  wire [4:0] _GEN_2092 = 4'hb == loadReplaySel_1_REG ? uop_11_robIdx_value : _GEN_2091; // @[CircularQueuePtr.scala 61:{50,50}]
  wire [4:0] _GEN_2093 = 4'hc == loadReplaySel_1_REG ? uop_12_robIdx_value : _GEN_2092; // @[CircularQueuePtr.scala 61:{50,50}]
  wire [4:0] _GEN_2094 = 4'hd == loadReplaySel_1_REG ? uop_13_robIdx_value : _GEN_2093; // @[CircularQueuePtr.scala 61:{50,50}]
  wire [4:0] _GEN_2095 = 4'he == loadReplaySel_1_REG ? uop_14_robIdx_value : _GEN_2094; // @[CircularQueuePtr.scala 61:{50,50}]
  wire [4:0] _GEN_2096 = 4'hf == loadReplaySel_1_REG ? uop_15_robIdx_value : _GEN_2095; // @[CircularQueuePtr.scala 61:{50,50}]
  wire [5:0] _cancelReplay_flushItself_T_5 = {_GEN_2080,_GEN_2096}; // @[CircularQueuePtr.scala 61:50]
  wire [5:0] _cancelReplay_flushItself_T_6 = {cancelReplay_REG_1_bits_robIdx_flag,cancelReplay_REG_1_bits_robIdx_value}; // @[CircularQueuePtr.scala 61:70]
  wire  _cancelReplay_flushItself_T_7 = _cancelReplay_flushItself_T_5 == _cancelReplay_flushItself_T_6; // @[CircularQueuePtr.scala 61:52]
  wire  cancelReplay_flushItself_1 = cancelReplay_REG_1_bits_level & _cancelReplay_flushItself_T_7; // @[Rob.scala 122:51]
  wire  cancelReplay_differentFlag_1 = _GEN_2080 ^ cancelReplay_REG_1_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  cancelReplay_compare_1 = _GEN_2096 > cancelReplay_REG_1_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _cancelReplay_T_2 = cancelReplay_differentFlag_1 ^ cancelReplay_compare_1; // @[CircularQueuePtr.scala 88:19]
  wire  cancelReplay_1 = cancelReplay_REG_1_valid & (cancelReplay_flushItself_1 | _cancelReplay_T_2); // @[Rob.scala 123:20]
  wire  bankConflictReplay_1 = hasBankConflict & ~allBankConflict ? _GEN_159[4] : 1'h1; // @[LoadQueueReplay.scala 317:33]
  wire [9:0] _GEN_2130 = 4'h1 == loadReplaySel_1_REG ? uop_1_cf_foldpc : uop_0_cf_foldpc; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [9:0] _GEN_2131 = 4'h2 == loadReplaySel_1_REG ? uop_2_cf_foldpc : _GEN_2130; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [9:0] _GEN_2132 = 4'h3 == loadReplaySel_1_REG ? uop_3_cf_foldpc : _GEN_2131; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [9:0] _GEN_2133 = 4'h4 == loadReplaySel_1_REG ? uop_4_cf_foldpc : _GEN_2132; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [9:0] _GEN_2134 = 4'h5 == loadReplaySel_1_REG ? uop_5_cf_foldpc : _GEN_2133; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [9:0] _GEN_2135 = 4'h6 == loadReplaySel_1_REG ? uop_6_cf_foldpc : _GEN_2134; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [9:0] _GEN_2136 = 4'h7 == loadReplaySel_1_REG ? uop_7_cf_foldpc : _GEN_2135; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [9:0] _GEN_2137 = 4'h8 == loadReplaySel_1_REG ? uop_8_cf_foldpc : _GEN_2136; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [9:0] _GEN_2138 = 4'h9 == loadReplaySel_1_REG ? uop_9_cf_foldpc : _GEN_2137; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [9:0] _GEN_2139 = 4'ha == loadReplaySel_1_REG ? uop_10_cf_foldpc : _GEN_2138; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [9:0] _GEN_2140 = 4'hb == loadReplaySel_1_REG ? uop_11_cf_foldpc : _GEN_2139; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [9:0] _GEN_2141 = 4'hc == loadReplaySel_1_REG ? uop_12_cf_foldpc : _GEN_2140; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [9:0] _GEN_2142 = 4'hd == loadReplaySel_1_REG ? uop_13_cf_foldpc : _GEN_2141; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [9:0] _GEN_2143 = 4'he == loadReplaySel_1_REG ? uop_14_cf_foldpc : _GEN_2142; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2482 = 4'h1 == loadReplaySel_1_REG ? uop_1_cf_trigger_backendEn_1 : uop_0_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2483 = 4'h2 == loadReplaySel_1_REG ? uop_2_cf_trigger_backendEn_1 : _GEN_2482; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2484 = 4'h3 == loadReplaySel_1_REG ? uop_3_cf_trigger_backendEn_1 : _GEN_2483; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2485 = 4'h4 == loadReplaySel_1_REG ? uop_4_cf_trigger_backendEn_1 : _GEN_2484; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2486 = 4'h5 == loadReplaySel_1_REG ? uop_5_cf_trigger_backendEn_1 : _GEN_2485; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2487 = 4'h6 == loadReplaySel_1_REG ? uop_6_cf_trigger_backendEn_1 : _GEN_2486; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2488 = 4'h7 == loadReplaySel_1_REG ? uop_7_cf_trigger_backendEn_1 : _GEN_2487; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2489 = 4'h8 == loadReplaySel_1_REG ? uop_8_cf_trigger_backendEn_1 : _GEN_2488; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2490 = 4'h9 == loadReplaySel_1_REG ? uop_9_cf_trigger_backendEn_1 : _GEN_2489; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2491 = 4'ha == loadReplaySel_1_REG ? uop_10_cf_trigger_backendEn_1 : _GEN_2490; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2492 = 4'hb == loadReplaySel_1_REG ? uop_11_cf_trigger_backendEn_1 : _GEN_2491; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2493 = 4'hc == loadReplaySel_1_REG ? uop_12_cf_trigger_backendEn_1 : _GEN_2492; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2494 = 4'hd == loadReplaySel_1_REG ? uop_13_cf_trigger_backendEn_1 : _GEN_2493; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2495 = 4'he == loadReplaySel_1_REG ? uop_14_cf_trigger_backendEn_1 : _GEN_2494; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2498 = 4'h1 == loadReplaySel_1_REG ? uop_1_cf_trigger_backendHit_0 : uop_0_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2499 = 4'h2 == loadReplaySel_1_REG ? uop_2_cf_trigger_backendHit_0 : _GEN_2498; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2500 = 4'h3 == loadReplaySel_1_REG ? uop_3_cf_trigger_backendHit_0 : _GEN_2499; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2501 = 4'h4 == loadReplaySel_1_REG ? uop_4_cf_trigger_backendHit_0 : _GEN_2500; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2502 = 4'h5 == loadReplaySel_1_REG ? uop_5_cf_trigger_backendHit_0 : _GEN_2501; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2503 = 4'h6 == loadReplaySel_1_REG ? uop_6_cf_trigger_backendHit_0 : _GEN_2502; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2504 = 4'h7 == loadReplaySel_1_REG ? uop_7_cf_trigger_backendHit_0 : _GEN_2503; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2505 = 4'h8 == loadReplaySel_1_REG ? uop_8_cf_trigger_backendHit_0 : _GEN_2504; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2506 = 4'h9 == loadReplaySel_1_REG ? uop_9_cf_trigger_backendHit_0 : _GEN_2505; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2507 = 4'ha == loadReplaySel_1_REG ? uop_10_cf_trigger_backendHit_0 : _GEN_2506; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2508 = 4'hb == loadReplaySel_1_REG ? uop_11_cf_trigger_backendHit_0 : _GEN_2507; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2509 = 4'hc == loadReplaySel_1_REG ? uop_12_cf_trigger_backendHit_0 : _GEN_2508; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2510 = 4'hd == loadReplaySel_1_REG ? uop_13_cf_trigger_backendHit_0 : _GEN_2509; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2511 = 4'he == loadReplaySel_1_REG ? uop_14_cf_trigger_backendHit_0 : _GEN_2510; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2514 = 4'h1 == loadReplaySel_1_REG ? uop_1_cf_trigger_backendHit_1 : uop_0_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2515 = 4'h2 == loadReplaySel_1_REG ? uop_2_cf_trigger_backendHit_1 : _GEN_2514; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2516 = 4'h3 == loadReplaySel_1_REG ? uop_3_cf_trigger_backendHit_1 : _GEN_2515; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2517 = 4'h4 == loadReplaySel_1_REG ? uop_4_cf_trigger_backendHit_1 : _GEN_2516; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2518 = 4'h5 == loadReplaySel_1_REG ? uop_5_cf_trigger_backendHit_1 : _GEN_2517; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2519 = 4'h6 == loadReplaySel_1_REG ? uop_6_cf_trigger_backendHit_1 : _GEN_2518; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2520 = 4'h7 == loadReplaySel_1_REG ? uop_7_cf_trigger_backendHit_1 : _GEN_2519; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2521 = 4'h8 == loadReplaySel_1_REG ? uop_8_cf_trigger_backendHit_1 : _GEN_2520; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2522 = 4'h9 == loadReplaySel_1_REG ? uop_9_cf_trigger_backendHit_1 : _GEN_2521; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2523 = 4'ha == loadReplaySel_1_REG ? uop_10_cf_trigger_backendHit_1 : _GEN_2522; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2524 = 4'hb == loadReplaySel_1_REG ? uop_11_cf_trigger_backendHit_1 : _GEN_2523; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2525 = 4'hc == loadReplaySel_1_REG ? uop_12_cf_trigger_backendHit_1 : _GEN_2524; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2526 = 4'hd == loadReplaySel_1_REG ? uop_13_cf_trigger_backendHit_1 : _GEN_2525; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2527 = 4'he == loadReplaySel_1_REG ? uop_14_cf_trigger_backendHit_1 : _GEN_2526; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2562 = 4'h1 == loadReplaySel_1_REG ? uop_1_cf_trigger_backendHit_4 : uop_0_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2563 = 4'h2 == loadReplaySel_1_REG ? uop_2_cf_trigger_backendHit_4 : _GEN_2562; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2564 = 4'h3 == loadReplaySel_1_REG ? uop_3_cf_trigger_backendHit_4 : _GEN_2563; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2565 = 4'h4 == loadReplaySel_1_REG ? uop_4_cf_trigger_backendHit_4 : _GEN_2564; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2566 = 4'h5 == loadReplaySel_1_REG ? uop_5_cf_trigger_backendHit_4 : _GEN_2565; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2567 = 4'h6 == loadReplaySel_1_REG ? uop_6_cf_trigger_backendHit_4 : _GEN_2566; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2568 = 4'h7 == loadReplaySel_1_REG ? uop_7_cf_trigger_backendHit_4 : _GEN_2567; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2569 = 4'h8 == loadReplaySel_1_REG ? uop_8_cf_trigger_backendHit_4 : _GEN_2568; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2570 = 4'h9 == loadReplaySel_1_REG ? uop_9_cf_trigger_backendHit_4 : _GEN_2569; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2571 = 4'ha == loadReplaySel_1_REG ? uop_10_cf_trigger_backendHit_4 : _GEN_2570; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2572 = 4'hb == loadReplaySel_1_REG ? uop_11_cf_trigger_backendHit_4 : _GEN_2571; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2573 = 4'hc == loadReplaySel_1_REG ? uop_12_cf_trigger_backendHit_4 : _GEN_2572; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2574 = 4'hd == loadReplaySel_1_REG ? uop_13_cf_trigger_backendHit_4 : _GEN_2573; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2575 = 4'he == loadReplaySel_1_REG ? uop_14_cf_trigger_backendHit_4 : _GEN_2574; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2722 = 4'h1 == loadReplaySel_1_REG ? uop_1_cf_waitForRobIdx_flag : uop_0_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2723 = 4'h2 == loadReplaySel_1_REG ? uop_2_cf_waitForRobIdx_flag : _GEN_2722; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2724 = 4'h3 == loadReplaySel_1_REG ? uop_3_cf_waitForRobIdx_flag : _GEN_2723; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2725 = 4'h4 == loadReplaySel_1_REG ? uop_4_cf_waitForRobIdx_flag : _GEN_2724; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2726 = 4'h5 == loadReplaySel_1_REG ? uop_5_cf_waitForRobIdx_flag : _GEN_2725; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2727 = 4'h6 == loadReplaySel_1_REG ? uop_6_cf_waitForRobIdx_flag : _GEN_2726; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2728 = 4'h7 == loadReplaySel_1_REG ? uop_7_cf_waitForRobIdx_flag : _GEN_2727; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2729 = 4'h8 == loadReplaySel_1_REG ? uop_8_cf_waitForRobIdx_flag : _GEN_2728; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2730 = 4'h9 == loadReplaySel_1_REG ? uop_9_cf_waitForRobIdx_flag : _GEN_2729; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2731 = 4'ha == loadReplaySel_1_REG ? uop_10_cf_waitForRobIdx_flag : _GEN_2730; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2732 = 4'hb == loadReplaySel_1_REG ? uop_11_cf_waitForRobIdx_flag : _GEN_2731; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2733 = 4'hc == loadReplaySel_1_REG ? uop_12_cf_waitForRobIdx_flag : _GEN_2732; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2734 = 4'hd == loadReplaySel_1_REG ? uop_13_cf_waitForRobIdx_flag : _GEN_2733; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2735 = 4'he == loadReplaySel_1_REG ? uop_14_cf_waitForRobIdx_flag : _GEN_2734; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [4:0] _GEN_2738 = 4'h1 == loadReplaySel_1_REG ? uop_1_cf_waitForRobIdx_value : uop_0_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [4:0] _GEN_2739 = 4'h2 == loadReplaySel_1_REG ? uop_2_cf_waitForRobIdx_value : _GEN_2738; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [4:0] _GEN_2740 = 4'h3 == loadReplaySel_1_REG ? uop_3_cf_waitForRobIdx_value : _GEN_2739; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [4:0] _GEN_2741 = 4'h4 == loadReplaySel_1_REG ? uop_4_cf_waitForRobIdx_value : _GEN_2740; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [4:0] _GEN_2742 = 4'h5 == loadReplaySel_1_REG ? uop_5_cf_waitForRobIdx_value : _GEN_2741; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [4:0] _GEN_2743 = 4'h6 == loadReplaySel_1_REG ? uop_6_cf_waitForRobIdx_value : _GEN_2742; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [4:0] _GEN_2744 = 4'h7 == loadReplaySel_1_REG ? uop_7_cf_waitForRobIdx_value : _GEN_2743; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [4:0] _GEN_2745 = 4'h8 == loadReplaySel_1_REG ? uop_8_cf_waitForRobIdx_value : _GEN_2744; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [4:0] _GEN_2746 = 4'h9 == loadReplaySel_1_REG ? uop_9_cf_waitForRobIdx_value : _GEN_2745; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [4:0] _GEN_2747 = 4'ha == loadReplaySel_1_REG ? uop_10_cf_waitForRobIdx_value : _GEN_2746; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [4:0] _GEN_2748 = 4'hb == loadReplaySel_1_REG ? uop_11_cf_waitForRobIdx_value : _GEN_2747; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [4:0] _GEN_2749 = 4'hc == loadReplaySel_1_REG ? uop_12_cf_waitForRobIdx_value : _GEN_2748; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [4:0] _GEN_2750 = 4'hd == loadReplaySel_1_REG ? uop_13_cf_waitForRobIdx_value : _GEN_2749; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [4:0] _GEN_2751 = 4'he == loadReplaySel_1_REG ? uop_14_cf_waitForRobIdx_value : _GEN_2750; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2754 = 4'h1 == loadReplaySel_1_REG ? uop_1_cf_loadWaitBit : uop_0_cf_loadWaitBit; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2755 = 4'h2 == loadReplaySel_1_REG ? uop_2_cf_loadWaitBit : _GEN_2754; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2756 = 4'h3 == loadReplaySel_1_REG ? uop_3_cf_loadWaitBit : _GEN_2755; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2757 = 4'h4 == loadReplaySel_1_REG ? uop_4_cf_loadWaitBit : _GEN_2756; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2758 = 4'h5 == loadReplaySel_1_REG ? uop_5_cf_loadWaitBit : _GEN_2757; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2759 = 4'h6 == loadReplaySel_1_REG ? uop_6_cf_loadWaitBit : _GEN_2758; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2760 = 4'h7 == loadReplaySel_1_REG ? uop_7_cf_loadWaitBit : _GEN_2759; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2761 = 4'h8 == loadReplaySel_1_REG ? uop_8_cf_loadWaitBit : _GEN_2760; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2762 = 4'h9 == loadReplaySel_1_REG ? uop_9_cf_loadWaitBit : _GEN_2761; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2763 = 4'ha == loadReplaySel_1_REG ? uop_10_cf_loadWaitBit : _GEN_2762; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2764 = 4'hb == loadReplaySel_1_REG ? uop_11_cf_loadWaitBit : _GEN_2763; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2765 = 4'hc == loadReplaySel_1_REG ? uop_12_cf_loadWaitBit : _GEN_2764; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2766 = 4'hd == loadReplaySel_1_REG ? uop_13_cf_loadWaitBit : _GEN_2765; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2767 = 4'he == loadReplaySel_1_REG ? uop_14_cf_loadWaitBit : _GEN_2766; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2770 = 4'h1 == loadReplaySel_1_REG ? uop_1_cf_loadWaitStrict : uop_0_cf_loadWaitStrict; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2771 = 4'h2 == loadReplaySel_1_REG ? uop_2_cf_loadWaitStrict : _GEN_2770; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2772 = 4'h3 == loadReplaySel_1_REG ? uop_3_cf_loadWaitStrict : _GEN_2771; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2773 = 4'h4 == loadReplaySel_1_REG ? uop_4_cf_loadWaitStrict : _GEN_2772; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2774 = 4'h5 == loadReplaySel_1_REG ? uop_5_cf_loadWaitStrict : _GEN_2773; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2775 = 4'h6 == loadReplaySel_1_REG ? uop_6_cf_loadWaitStrict : _GEN_2774; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2776 = 4'h7 == loadReplaySel_1_REG ? uop_7_cf_loadWaitStrict : _GEN_2775; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2777 = 4'h8 == loadReplaySel_1_REG ? uop_8_cf_loadWaitStrict : _GEN_2776; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2778 = 4'h9 == loadReplaySel_1_REG ? uop_9_cf_loadWaitStrict : _GEN_2777; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2779 = 4'ha == loadReplaySel_1_REG ? uop_10_cf_loadWaitStrict : _GEN_2778; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2780 = 4'hb == loadReplaySel_1_REG ? uop_11_cf_loadWaitStrict : _GEN_2779; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2781 = 4'hc == loadReplaySel_1_REG ? uop_12_cf_loadWaitStrict : _GEN_2780; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2782 = 4'hd == loadReplaySel_1_REG ? uop_13_cf_loadWaitStrict : _GEN_2781; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2783 = 4'he == loadReplaySel_1_REG ? uop_14_cf_loadWaitStrict : _GEN_2782; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2802 = 4'h1 == loadReplaySel_1_REG ? uop_1_cf_ftqPtr_flag : uop_0_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2803 = 4'h2 == loadReplaySel_1_REG ? uop_2_cf_ftqPtr_flag : _GEN_2802; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2804 = 4'h3 == loadReplaySel_1_REG ? uop_3_cf_ftqPtr_flag : _GEN_2803; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2805 = 4'h4 == loadReplaySel_1_REG ? uop_4_cf_ftqPtr_flag : _GEN_2804; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2806 = 4'h5 == loadReplaySel_1_REG ? uop_5_cf_ftqPtr_flag : _GEN_2805; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2807 = 4'h6 == loadReplaySel_1_REG ? uop_6_cf_ftqPtr_flag : _GEN_2806; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2808 = 4'h7 == loadReplaySel_1_REG ? uop_7_cf_ftqPtr_flag : _GEN_2807; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2809 = 4'h8 == loadReplaySel_1_REG ? uop_8_cf_ftqPtr_flag : _GEN_2808; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2810 = 4'h9 == loadReplaySel_1_REG ? uop_9_cf_ftqPtr_flag : _GEN_2809; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2811 = 4'ha == loadReplaySel_1_REG ? uop_10_cf_ftqPtr_flag : _GEN_2810; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2812 = 4'hb == loadReplaySel_1_REG ? uop_11_cf_ftqPtr_flag : _GEN_2811; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2813 = 4'hc == loadReplaySel_1_REG ? uop_12_cf_ftqPtr_flag : _GEN_2812; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2814 = 4'hd == loadReplaySel_1_REG ? uop_13_cf_ftqPtr_flag : _GEN_2813; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_2815 = 4'he == loadReplaySel_1_REG ? uop_14_cf_ftqPtr_flag : _GEN_2814; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [2:0] _GEN_2818 = 4'h1 == loadReplaySel_1_REG ? uop_1_cf_ftqPtr_value : uop_0_cf_ftqPtr_value; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [2:0] _GEN_2819 = 4'h2 == loadReplaySel_1_REG ? uop_2_cf_ftqPtr_value : _GEN_2818; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [2:0] _GEN_2820 = 4'h3 == loadReplaySel_1_REG ? uop_3_cf_ftqPtr_value : _GEN_2819; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [2:0] _GEN_2821 = 4'h4 == loadReplaySel_1_REG ? uop_4_cf_ftqPtr_value : _GEN_2820; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [2:0] _GEN_2822 = 4'h5 == loadReplaySel_1_REG ? uop_5_cf_ftqPtr_value : _GEN_2821; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [2:0] _GEN_2823 = 4'h6 == loadReplaySel_1_REG ? uop_6_cf_ftqPtr_value : _GEN_2822; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [2:0] _GEN_2824 = 4'h7 == loadReplaySel_1_REG ? uop_7_cf_ftqPtr_value : _GEN_2823; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [2:0] _GEN_2825 = 4'h8 == loadReplaySel_1_REG ? uop_8_cf_ftqPtr_value : _GEN_2824; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [2:0] _GEN_2826 = 4'h9 == loadReplaySel_1_REG ? uop_9_cf_ftqPtr_value : _GEN_2825; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [2:0] _GEN_2827 = 4'ha == loadReplaySel_1_REG ? uop_10_cf_ftqPtr_value : _GEN_2826; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [2:0] _GEN_2828 = 4'hb == loadReplaySel_1_REG ? uop_11_cf_ftqPtr_value : _GEN_2827; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [2:0] _GEN_2829 = 4'hc == loadReplaySel_1_REG ? uop_12_cf_ftqPtr_value : _GEN_2828; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [2:0] _GEN_2830 = 4'hd == loadReplaySel_1_REG ? uop_13_cf_ftqPtr_value : _GEN_2829; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [2:0] _GEN_2831 = 4'he == loadReplaySel_1_REG ? uop_14_cf_ftqPtr_value : _GEN_2830; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [2:0] _GEN_2834 = 4'h1 == loadReplaySel_1_REG ? uop_1_cf_ftqOffset : uop_0_cf_ftqOffset; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [2:0] _GEN_2835 = 4'h2 == loadReplaySel_1_REG ? uop_2_cf_ftqOffset : _GEN_2834; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [2:0] _GEN_2836 = 4'h3 == loadReplaySel_1_REG ? uop_3_cf_ftqOffset : _GEN_2835; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [2:0] _GEN_2837 = 4'h4 == loadReplaySel_1_REG ? uop_4_cf_ftqOffset : _GEN_2836; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [2:0] _GEN_2838 = 4'h5 == loadReplaySel_1_REG ? uop_5_cf_ftqOffset : _GEN_2837; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [2:0] _GEN_2839 = 4'h6 == loadReplaySel_1_REG ? uop_6_cf_ftqOffset : _GEN_2838; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [2:0] _GEN_2840 = 4'h7 == loadReplaySel_1_REG ? uop_7_cf_ftqOffset : _GEN_2839; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [2:0] _GEN_2841 = 4'h8 == loadReplaySel_1_REG ? uop_8_cf_ftqOffset : _GEN_2840; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [2:0] _GEN_2842 = 4'h9 == loadReplaySel_1_REG ? uop_9_cf_ftqOffset : _GEN_2841; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [2:0] _GEN_2843 = 4'ha == loadReplaySel_1_REG ? uop_10_cf_ftqOffset : _GEN_2842; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [2:0] _GEN_2844 = 4'hb == loadReplaySel_1_REG ? uop_11_cf_ftqOffset : _GEN_2843; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [2:0] _GEN_2845 = 4'hc == loadReplaySel_1_REG ? uop_12_cf_ftqOffset : _GEN_2844; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [2:0] _GEN_2846 = 4'hd == loadReplaySel_1_REG ? uop_13_cf_ftqOffset : _GEN_2845; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [2:0] _GEN_2847 = 4'he == loadReplaySel_1_REG ? uop_14_cf_ftqOffset : _GEN_2846; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_2978 = 4'h1 == loadReplaySel_1_REG ? uop_1_ctrl_fuType : uop_0_ctrl_fuType; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_2979 = 4'h2 == loadReplaySel_1_REG ? uop_2_ctrl_fuType : _GEN_2978; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_2980 = 4'h3 == loadReplaySel_1_REG ? uop_3_ctrl_fuType : _GEN_2979; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_2981 = 4'h4 == loadReplaySel_1_REG ? uop_4_ctrl_fuType : _GEN_2980; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_2982 = 4'h5 == loadReplaySel_1_REG ? uop_5_ctrl_fuType : _GEN_2981; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_2983 = 4'h6 == loadReplaySel_1_REG ? uop_6_ctrl_fuType : _GEN_2982; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_2984 = 4'h7 == loadReplaySel_1_REG ? uop_7_ctrl_fuType : _GEN_2983; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_2985 = 4'h8 == loadReplaySel_1_REG ? uop_8_ctrl_fuType : _GEN_2984; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_2986 = 4'h9 == loadReplaySel_1_REG ? uop_9_ctrl_fuType : _GEN_2985; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_2987 = 4'ha == loadReplaySel_1_REG ? uop_10_ctrl_fuType : _GEN_2986; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_2988 = 4'hb == loadReplaySel_1_REG ? uop_11_ctrl_fuType : _GEN_2987; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_2989 = 4'hc == loadReplaySel_1_REG ? uop_12_ctrl_fuType : _GEN_2988; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_2990 = 4'hd == loadReplaySel_1_REG ? uop_13_ctrl_fuType : _GEN_2989; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_2991 = 4'he == loadReplaySel_1_REG ? uop_14_ctrl_fuType : _GEN_2990; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [6:0] _GEN_2994 = 4'h1 == loadReplaySel_1_REG ? uop_1_ctrl_fuOpType : uop_0_ctrl_fuOpType; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [6:0] _GEN_2995 = 4'h2 == loadReplaySel_1_REG ? uop_2_ctrl_fuOpType : _GEN_2994; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [6:0] _GEN_2996 = 4'h3 == loadReplaySel_1_REG ? uop_3_ctrl_fuOpType : _GEN_2995; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [6:0] _GEN_2997 = 4'h4 == loadReplaySel_1_REG ? uop_4_ctrl_fuOpType : _GEN_2996; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [6:0] _GEN_2998 = 4'h5 == loadReplaySel_1_REG ? uop_5_ctrl_fuOpType : _GEN_2997; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [6:0] _GEN_2999 = 4'h6 == loadReplaySel_1_REG ? uop_6_ctrl_fuOpType : _GEN_2998; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [6:0] _GEN_3000 = 4'h7 == loadReplaySel_1_REG ? uop_7_ctrl_fuOpType : _GEN_2999; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [6:0] _GEN_3001 = 4'h8 == loadReplaySel_1_REG ? uop_8_ctrl_fuOpType : _GEN_3000; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [6:0] _GEN_3002 = 4'h9 == loadReplaySel_1_REG ? uop_9_ctrl_fuOpType : _GEN_3001; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [6:0] _GEN_3003 = 4'ha == loadReplaySel_1_REG ? uop_10_ctrl_fuOpType : _GEN_3002; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [6:0] _GEN_3004 = 4'hb == loadReplaySel_1_REG ? uop_11_ctrl_fuOpType : _GEN_3003; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [6:0] _GEN_3005 = 4'hc == loadReplaySel_1_REG ? uop_12_ctrl_fuOpType : _GEN_3004; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [6:0] _GEN_3006 = 4'hd == loadReplaySel_1_REG ? uop_13_ctrl_fuOpType : _GEN_3005; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [6:0] _GEN_3007 = 4'he == loadReplaySel_1_REG ? uop_14_ctrl_fuOpType : _GEN_3006; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_3010 = 4'h1 == loadReplaySel_1_REG ? uop_1_ctrl_rfWen : uop_0_ctrl_rfWen; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_3011 = 4'h2 == loadReplaySel_1_REG ? uop_2_ctrl_rfWen : _GEN_3010; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_3012 = 4'h3 == loadReplaySel_1_REG ? uop_3_ctrl_rfWen : _GEN_3011; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_3013 = 4'h4 == loadReplaySel_1_REG ? uop_4_ctrl_rfWen : _GEN_3012; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_3014 = 4'h5 == loadReplaySel_1_REG ? uop_5_ctrl_rfWen : _GEN_3013; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_3015 = 4'h6 == loadReplaySel_1_REG ? uop_6_ctrl_rfWen : _GEN_3014; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_3016 = 4'h7 == loadReplaySel_1_REG ? uop_7_ctrl_rfWen : _GEN_3015; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_3017 = 4'h8 == loadReplaySel_1_REG ? uop_8_ctrl_rfWen : _GEN_3016; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_3018 = 4'h9 == loadReplaySel_1_REG ? uop_9_ctrl_rfWen : _GEN_3017; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_3019 = 4'ha == loadReplaySel_1_REG ? uop_10_ctrl_rfWen : _GEN_3018; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_3020 = 4'hb == loadReplaySel_1_REG ? uop_11_ctrl_rfWen : _GEN_3019; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_3021 = 4'hc == loadReplaySel_1_REG ? uop_12_ctrl_rfWen : _GEN_3020; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_3022 = 4'hd == loadReplaySel_1_REG ? uop_13_ctrl_rfWen : _GEN_3021; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_3023 = 4'he == loadReplaySel_1_REG ? uop_14_ctrl_rfWen : _GEN_3022; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_3026 = 4'h1 == loadReplaySel_1_REG ? uop_1_ctrl_fpWen : uop_0_ctrl_fpWen; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_3027 = 4'h2 == loadReplaySel_1_REG ? uop_2_ctrl_fpWen : _GEN_3026; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_3028 = 4'h3 == loadReplaySel_1_REG ? uop_3_ctrl_fpWen : _GEN_3027; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_3029 = 4'h4 == loadReplaySel_1_REG ? uop_4_ctrl_fpWen : _GEN_3028; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_3030 = 4'h5 == loadReplaySel_1_REG ? uop_5_ctrl_fpWen : _GEN_3029; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_3031 = 4'h6 == loadReplaySel_1_REG ? uop_6_ctrl_fpWen : _GEN_3030; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_3032 = 4'h7 == loadReplaySel_1_REG ? uop_7_ctrl_fpWen : _GEN_3031; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_3033 = 4'h8 == loadReplaySel_1_REG ? uop_8_ctrl_fpWen : _GEN_3032; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_3034 = 4'h9 == loadReplaySel_1_REG ? uop_9_ctrl_fpWen : _GEN_3033; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_3035 = 4'ha == loadReplaySel_1_REG ? uop_10_ctrl_fpWen : _GEN_3034; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_3036 = 4'hb == loadReplaySel_1_REG ? uop_11_ctrl_fpWen : _GEN_3035; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_3037 = 4'hc == loadReplaySel_1_REG ? uop_12_ctrl_fpWen : _GEN_3036; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_3038 = 4'hd == loadReplaySel_1_REG ? uop_13_ctrl_fpWen : _GEN_3037; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_3039 = 4'he == loadReplaySel_1_REG ? uop_14_ctrl_fpWen : _GEN_3038; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [5:0] _GEN_3522 = 4'h1 == loadReplaySel_1_REG ? uop_1_pdest : uop_0_pdest; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [5:0] _GEN_3523 = 4'h2 == loadReplaySel_1_REG ? uop_2_pdest : _GEN_3522; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [5:0] _GEN_3524 = 4'h3 == loadReplaySel_1_REG ? uop_3_pdest : _GEN_3523; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [5:0] _GEN_3525 = 4'h4 == loadReplaySel_1_REG ? uop_4_pdest : _GEN_3524; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [5:0] _GEN_3526 = 4'h5 == loadReplaySel_1_REG ? uop_5_pdest : _GEN_3525; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [5:0] _GEN_3527 = 4'h6 == loadReplaySel_1_REG ? uop_6_pdest : _GEN_3526; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [5:0] _GEN_3528 = 4'h7 == loadReplaySel_1_REG ? uop_7_pdest : _GEN_3527; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [5:0] _GEN_3529 = 4'h8 == loadReplaySel_1_REG ? uop_8_pdest : _GEN_3528; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [5:0] _GEN_3530 = 4'h9 == loadReplaySel_1_REG ? uop_9_pdest : _GEN_3529; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [5:0] _GEN_3531 = 4'ha == loadReplaySel_1_REG ? uop_10_pdest : _GEN_3530; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [5:0] _GEN_3532 = 4'hb == loadReplaySel_1_REG ? uop_11_pdest : _GEN_3531; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [5:0] _GEN_3533 = 4'hc == loadReplaySel_1_REG ? uop_12_pdest : _GEN_3532; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [5:0] _GEN_3534 = 4'hd == loadReplaySel_1_REG ? uop_13_pdest : _GEN_3533; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [5:0] _GEN_3535 = 4'he == loadReplaySel_1_REG ? uop_14_pdest : _GEN_3534; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_3554 = 4'h1 == loadReplaySel_1_REG ? uop_1_lqIdx_flag : uop_0_lqIdx_flag; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_3555 = 4'h2 == loadReplaySel_1_REG ? uop_2_lqIdx_flag : _GEN_3554; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_3556 = 4'h3 == loadReplaySel_1_REG ? uop_3_lqIdx_flag : _GEN_3555; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_3557 = 4'h4 == loadReplaySel_1_REG ? uop_4_lqIdx_flag : _GEN_3556; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_3558 = 4'h5 == loadReplaySel_1_REG ? uop_5_lqIdx_flag : _GEN_3557; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_3559 = 4'h6 == loadReplaySel_1_REG ? uop_6_lqIdx_flag : _GEN_3558; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_3560 = 4'h7 == loadReplaySel_1_REG ? uop_7_lqIdx_flag : _GEN_3559; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_3561 = 4'h8 == loadReplaySel_1_REG ? uop_8_lqIdx_flag : _GEN_3560; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_3562 = 4'h9 == loadReplaySel_1_REG ? uop_9_lqIdx_flag : _GEN_3561; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_3563 = 4'ha == loadReplaySel_1_REG ? uop_10_lqIdx_flag : _GEN_3562; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_3564 = 4'hb == loadReplaySel_1_REG ? uop_11_lqIdx_flag : _GEN_3563; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_3565 = 4'hc == loadReplaySel_1_REG ? uop_12_lqIdx_flag : _GEN_3564; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_3566 = 4'hd == loadReplaySel_1_REG ? uop_13_lqIdx_flag : _GEN_3565; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_3567 = 4'he == loadReplaySel_1_REG ? uop_14_lqIdx_flag : _GEN_3566; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_3570 = 4'h1 == loadReplaySel_1_REG ? uop_1_lqIdx_value : uop_0_lqIdx_value; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_3571 = 4'h2 == loadReplaySel_1_REG ? uop_2_lqIdx_value : _GEN_3570; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_3572 = 4'h3 == loadReplaySel_1_REG ? uop_3_lqIdx_value : _GEN_3571; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_3573 = 4'h4 == loadReplaySel_1_REG ? uop_4_lqIdx_value : _GEN_3572; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_3574 = 4'h5 == loadReplaySel_1_REG ? uop_5_lqIdx_value : _GEN_3573; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_3575 = 4'h6 == loadReplaySel_1_REG ? uop_6_lqIdx_value : _GEN_3574; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_3576 = 4'h7 == loadReplaySel_1_REG ? uop_7_lqIdx_value : _GEN_3575; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_3577 = 4'h8 == loadReplaySel_1_REG ? uop_8_lqIdx_value : _GEN_3576; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_3578 = 4'h9 == loadReplaySel_1_REG ? uop_9_lqIdx_value : _GEN_3577; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_3579 = 4'ha == loadReplaySel_1_REG ? uop_10_lqIdx_value : _GEN_3578; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_3580 = 4'hb == loadReplaySel_1_REG ? uop_11_lqIdx_value : _GEN_3579; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_3581 = 4'hc == loadReplaySel_1_REG ? uop_12_lqIdx_value : _GEN_3580; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_3582 = 4'hd == loadReplaySel_1_REG ? uop_13_lqIdx_value : _GEN_3581; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_3583 = 4'he == loadReplaySel_1_REG ? uop_14_lqIdx_value : _GEN_3582; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_3586 = 4'h1 == loadReplaySel_1_REG ? uop_1_sqIdx_flag : uop_0_sqIdx_flag; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_3587 = 4'h2 == loadReplaySel_1_REG ? uop_2_sqIdx_flag : _GEN_3586; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_3588 = 4'h3 == loadReplaySel_1_REG ? uop_3_sqIdx_flag : _GEN_3587; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_3589 = 4'h4 == loadReplaySel_1_REG ? uop_4_sqIdx_flag : _GEN_3588; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_3590 = 4'h5 == loadReplaySel_1_REG ? uop_5_sqIdx_flag : _GEN_3589; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_3591 = 4'h6 == loadReplaySel_1_REG ? uop_6_sqIdx_flag : _GEN_3590; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_3592 = 4'h7 == loadReplaySel_1_REG ? uop_7_sqIdx_flag : _GEN_3591; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_3593 = 4'h8 == loadReplaySel_1_REG ? uop_8_sqIdx_flag : _GEN_3592; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_3594 = 4'h9 == loadReplaySel_1_REG ? uop_9_sqIdx_flag : _GEN_3593; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_3595 = 4'ha == loadReplaySel_1_REG ? uop_10_sqIdx_flag : _GEN_3594; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_3596 = 4'hb == loadReplaySel_1_REG ? uop_11_sqIdx_flag : _GEN_3595; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_3597 = 4'hc == loadReplaySel_1_REG ? uop_12_sqIdx_flag : _GEN_3596; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_3598 = 4'hd == loadReplaySel_1_REG ? uop_13_sqIdx_flag : _GEN_3597; // @[LoadQueueReplay.scala 321:{27,27}]
  wire  _GEN_3599 = 4'he == loadReplaySel_1_REG ? uop_14_sqIdx_flag : _GEN_3598; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_3602 = 4'h1 == loadReplaySel_1_REG ? uop_1_sqIdx_value : uop_0_sqIdx_value; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_3603 = 4'h2 == loadReplaySel_1_REG ? uop_2_sqIdx_value : _GEN_3602; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_3604 = 4'h3 == loadReplaySel_1_REG ? uop_3_sqIdx_value : _GEN_3603; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_3605 = 4'h4 == loadReplaySel_1_REG ? uop_4_sqIdx_value : _GEN_3604; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_3606 = 4'h5 == loadReplaySel_1_REG ? uop_5_sqIdx_value : _GEN_3605; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_3607 = 4'h6 == loadReplaySel_1_REG ? uop_6_sqIdx_value : _GEN_3606; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_3608 = 4'h7 == loadReplaySel_1_REG ? uop_7_sqIdx_value : _GEN_3607; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_3609 = 4'h8 == loadReplaySel_1_REG ? uop_8_sqIdx_value : _GEN_3608; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_3610 = 4'h9 == loadReplaySel_1_REG ? uop_9_sqIdx_value : _GEN_3609; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_3611 = 4'ha == loadReplaySel_1_REG ? uop_10_sqIdx_value : _GEN_3610; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_3612 = 4'hb == loadReplaySel_1_REG ? uop_11_sqIdx_value : _GEN_3611; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_3613 = 4'hc == loadReplaySel_1_REG ? uop_12_sqIdx_value : _GEN_3612; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_3614 = 4'hd == loadReplaySel_1_REG ? uop_13_sqIdx_value : _GEN_3613; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [3:0] _GEN_3615 = 4'he == loadReplaySel_1_REG ? uop_14_sqIdx_value : _GEN_3614; // @[LoadQueueReplay.scala 321:{27,27}]
  wire [7:0] _GEN_3794 = 4'h1 == loadReplaySel_1_REG ? replayCarryReg_1_real_way_en : replayCarryReg_0_real_way_en; // @[LoadQueueReplay.scala 325:{35,35}]
  wire [7:0] _GEN_3795 = 4'h2 == loadReplaySel_1_REG ? replayCarryReg_2_real_way_en : _GEN_3794; // @[LoadQueueReplay.scala 325:{35,35}]
  wire [7:0] _GEN_3796 = 4'h3 == loadReplaySel_1_REG ? replayCarryReg_3_real_way_en : _GEN_3795; // @[LoadQueueReplay.scala 325:{35,35}]
  wire [7:0] _GEN_3797 = 4'h4 == loadReplaySel_1_REG ? replayCarryReg_4_real_way_en : _GEN_3796; // @[LoadQueueReplay.scala 325:{35,35}]
  wire [7:0] _GEN_3798 = 4'h5 == loadReplaySel_1_REG ? replayCarryReg_5_real_way_en : _GEN_3797; // @[LoadQueueReplay.scala 325:{35,35}]
  wire [7:0] _GEN_3799 = 4'h6 == loadReplaySel_1_REG ? replayCarryReg_6_real_way_en : _GEN_3798; // @[LoadQueueReplay.scala 325:{35,35}]
  wire [7:0] _GEN_3800 = 4'h7 == loadReplaySel_1_REG ? replayCarryReg_7_real_way_en : _GEN_3799; // @[LoadQueueReplay.scala 325:{35,35}]
  wire [7:0] _GEN_3801 = 4'h8 == loadReplaySel_1_REG ? replayCarryReg_8_real_way_en : _GEN_3800; // @[LoadQueueReplay.scala 325:{35,35}]
  wire [7:0] _GEN_3802 = 4'h9 == loadReplaySel_1_REG ? replayCarryReg_9_real_way_en : _GEN_3801; // @[LoadQueueReplay.scala 325:{35,35}]
  wire [7:0] _GEN_3803 = 4'ha == loadReplaySel_1_REG ? replayCarryReg_10_real_way_en : _GEN_3802; // @[LoadQueueReplay.scala 325:{35,35}]
  wire [7:0] _GEN_3804 = 4'hb == loadReplaySel_1_REG ? replayCarryReg_11_real_way_en : _GEN_3803; // @[LoadQueueReplay.scala 325:{35,35}]
  wire [7:0] _GEN_3805 = 4'hc == loadReplaySel_1_REG ? replayCarryReg_12_real_way_en : _GEN_3804; // @[LoadQueueReplay.scala 325:{35,35}]
  wire [7:0] _GEN_3806 = 4'hd == loadReplaySel_1_REG ? replayCarryReg_13_real_way_en : _GEN_3805; // @[LoadQueueReplay.scala 325:{35,35}]
  wire [7:0] _GEN_3807 = 4'he == loadReplaySel_1_REG ? replayCarryReg_14_real_way_en : _GEN_3806; // @[LoadQueueReplay.scala 325:{35,35}]
  wire  _GEN_3810 = 4'h1 == loadReplaySel_1_REG ? replayCarryReg_1_valid : replayCarryReg_0_valid; // @[LoadQueueReplay.scala 325:{35,35}]
  wire  _GEN_3811 = 4'h2 == loadReplaySel_1_REG ? replayCarryReg_2_valid : _GEN_3810; // @[LoadQueueReplay.scala 325:{35,35}]
  wire  _GEN_3812 = 4'h3 == loadReplaySel_1_REG ? replayCarryReg_3_valid : _GEN_3811; // @[LoadQueueReplay.scala 325:{35,35}]
  wire  _GEN_3813 = 4'h4 == loadReplaySel_1_REG ? replayCarryReg_4_valid : _GEN_3812; // @[LoadQueueReplay.scala 325:{35,35}]
  wire  _GEN_3814 = 4'h5 == loadReplaySel_1_REG ? replayCarryReg_5_valid : _GEN_3813; // @[LoadQueueReplay.scala 325:{35,35}]
  wire  _GEN_3815 = 4'h6 == loadReplaySel_1_REG ? replayCarryReg_6_valid : _GEN_3814; // @[LoadQueueReplay.scala 325:{35,35}]
  wire  _GEN_3816 = 4'h7 == loadReplaySel_1_REG ? replayCarryReg_7_valid : _GEN_3815; // @[LoadQueueReplay.scala 325:{35,35}]
  wire  _GEN_3817 = 4'h8 == loadReplaySel_1_REG ? replayCarryReg_8_valid : _GEN_3816; // @[LoadQueueReplay.scala 325:{35,35}]
  wire  _GEN_3818 = 4'h9 == loadReplaySel_1_REG ? replayCarryReg_9_valid : _GEN_3817; // @[LoadQueueReplay.scala 325:{35,35}]
  wire  _GEN_3819 = 4'ha == loadReplaySel_1_REG ? replayCarryReg_10_valid : _GEN_3818; // @[LoadQueueReplay.scala 325:{35,35}]
  wire  _GEN_3820 = 4'hb == loadReplaySel_1_REG ? replayCarryReg_11_valid : _GEN_3819; // @[LoadQueueReplay.scala 325:{35,35}]
  wire  _GEN_3821 = 4'hc == loadReplaySel_1_REG ? replayCarryReg_12_valid : _GEN_3820; // @[LoadQueueReplay.scala 325:{35,35}]
  wire  _GEN_3822 = 4'hd == loadReplaySel_1_REG ? replayCarryReg_13_valid : _GEN_3821; // @[LoadQueueReplay.scala 325:{35,35}]
  wire  _GEN_3823 = 4'he == loadReplaySel_1_REG ? replayCarryReg_14_valid : _GEN_3822; // @[LoadQueueReplay.scala 325:{35,35}]
  wire [1:0] _GEN_3826 = 4'h1 == loadReplaySel_1_REG ? missMSHRId_1 : missMSHRId_0; // @[LoadQueueReplay.scala 326:{30,30}]
  wire [1:0] _GEN_3827 = 4'h2 == loadReplaySel_1_REG ? missMSHRId_2 : _GEN_3826; // @[LoadQueueReplay.scala 326:{30,30}]
  wire [1:0] _GEN_3828 = 4'h3 == loadReplaySel_1_REG ? missMSHRId_3 : _GEN_3827; // @[LoadQueueReplay.scala 326:{30,30}]
  wire [1:0] _GEN_3829 = 4'h4 == loadReplaySel_1_REG ? missMSHRId_4 : _GEN_3828; // @[LoadQueueReplay.scala 326:{30,30}]
  wire [1:0] _GEN_3830 = 4'h5 == loadReplaySel_1_REG ? missMSHRId_5 : _GEN_3829; // @[LoadQueueReplay.scala 326:{30,30}]
  wire [1:0] _GEN_3831 = 4'h6 == loadReplaySel_1_REG ? missMSHRId_6 : _GEN_3830; // @[LoadQueueReplay.scala 326:{30,30}]
  wire [1:0] _GEN_3832 = 4'h7 == loadReplaySel_1_REG ? missMSHRId_7 : _GEN_3831; // @[LoadQueueReplay.scala 326:{30,30}]
  wire [1:0] _GEN_3833 = 4'h8 == loadReplaySel_1_REG ? missMSHRId_8 : _GEN_3832; // @[LoadQueueReplay.scala 326:{30,30}]
  wire [1:0] _GEN_3834 = 4'h9 == loadReplaySel_1_REG ? missMSHRId_9 : _GEN_3833; // @[LoadQueueReplay.scala 326:{30,30}]
  wire [1:0] _GEN_3835 = 4'ha == loadReplaySel_1_REG ? missMSHRId_10 : _GEN_3834; // @[LoadQueueReplay.scala 326:{30,30}]
  wire [1:0] _GEN_3836 = 4'hb == loadReplaySel_1_REG ? missMSHRId_11 : _GEN_3835; // @[LoadQueueReplay.scala 326:{30,30}]
  wire [1:0] _GEN_3837 = 4'hc == loadReplaySel_1_REG ? missMSHRId_12 : _GEN_3836; // @[LoadQueueReplay.scala 326:{30,30}]
  wire [1:0] _GEN_3838 = 4'hd == loadReplaySel_1_REG ? missMSHRId_13 : _GEN_3837; // @[LoadQueueReplay.scala 326:{30,30}]
  wire [1:0] _GEN_3839 = 4'he == loadReplaySel_1_REG ? missMSHRId_14 : _GEN_3838; // @[LoadQueueReplay.scala 326:{30,30}]
  wire  _GEN_3842 = 4'h1 == loadReplaySel_1_REG ? trueCacheMissReplay_1 : trueCacheMissReplay_0; // @[LoadQueueReplay.scala 327:{42,42}]
  wire  _GEN_3843 = 4'h2 == loadReplaySel_1_REG ? trueCacheMissReplay_2 : _GEN_3842; // @[LoadQueueReplay.scala 327:{42,42}]
  wire  _GEN_3844 = 4'h3 == loadReplaySel_1_REG ? trueCacheMissReplay_3 : _GEN_3843; // @[LoadQueueReplay.scala 327:{42,42}]
  wire  _GEN_3845 = 4'h4 == loadReplaySel_1_REG ? trueCacheMissReplay_4 : _GEN_3844; // @[LoadQueueReplay.scala 327:{42,42}]
  wire  _GEN_3846 = 4'h5 == loadReplaySel_1_REG ? trueCacheMissReplay_5 : _GEN_3845; // @[LoadQueueReplay.scala 327:{42,42}]
  wire  _GEN_3847 = 4'h6 == loadReplaySel_1_REG ? trueCacheMissReplay_6 : _GEN_3846; // @[LoadQueueReplay.scala 327:{42,42}]
  wire  _GEN_3848 = 4'h7 == loadReplaySel_1_REG ? trueCacheMissReplay_7 : _GEN_3847; // @[LoadQueueReplay.scala 327:{42,42}]
  wire  _GEN_3849 = 4'h8 == loadReplaySel_1_REG ? trueCacheMissReplay_8 : _GEN_3848; // @[LoadQueueReplay.scala 327:{42,42}]
  wire  _GEN_3850 = 4'h9 == loadReplaySel_1_REG ? trueCacheMissReplay_9 : _GEN_3849; // @[LoadQueueReplay.scala 327:{42,42}]
  wire  _GEN_3851 = 4'ha == loadReplaySel_1_REG ? trueCacheMissReplay_10 : _GEN_3850; // @[LoadQueueReplay.scala 327:{42,42}]
  wire  _GEN_3852 = 4'hb == loadReplaySel_1_REG ? trueCacheMissReplay_11 : _GEN_3851; // @[LoadQueueReplay.scala 327:{42,42}]
  wire  _GEN_3853 = 4'hc == loadReplaySel_1_REG ? trueCacheMissReplay_12 : _GEN_3852; // @[LoadQueueReplay.scala 327:{42,42}]
  wire  _GEN_3854 = 4'hd == loadReplaySel_1_REG ? trueCacheMissReplay_13 : _GEN_3853; // @[LoadQueueReplay.scala 327:{42,42}]
  wire  _GEN_3855 = 4'he == loadReplaySel_1_REG ? trueCacheMissReplay_14 : _GEN_3854; // @[LoadQueueReplay.scala 327:{42,42}]
  wire  _GEN_3858 = 4'h1 == loadReplaySel_1_REG ? flags_1_rarAllocated : flags_0_rarAllocated; // @[LoadQueueReplay.scala 328:{36,36}]
  wire  _GEN_3859 = 4'h2 == loadReplaySel_1_REG ? flags_2_rarAllocated : _GEN_3858; // @[LoadQueueReplay.scala 328:{36,36}]
  wire  _GEN_3860 = 4'h3 == loadReplaySel_1_REG ? flags_3_rarAllocated : _GEN_3859; // @[LoadQueueReplay.scala 328:{36,36}]
  wire  _GEN_3861 = 4'h4 == loadReplaySel_1_REG ? flags_4_rarAllocated : _GEN_3860; // @[LoadQueueReplay.scala 328:{36,36}]
  wire  _GEN_3862 = 4'h5 == loadReplaySel_1_REG ? flags_5_rarAllocated : _GEN_3861; // @[LoadQueueReplay.scala 328:{36,36}]
  wire  _GEN_3863 = 4'h6 == loadReplaySel_1_REG ? flags_6_rarAllocated : _GEN_3862; // @[LoadQueueReplay.scala 328:{36,36}]
  wire  _GEN_3864 = 4'h7 == loadReplaySel_1_REG ? flags_7_rarAllocated : _GEN_3863; // @[LoadQueueReplay.scala 328:{36,36}]
  wire  _GEN_3865 = 4'h8 == loadReplaySel_1_REG ? flags_8_rarAllocated : _GEN_3864; // @[LoadQueueReplay.scala 328:{36,36}]
  wire  _GEN_3866 = 4'h9 == loadReplaySel_1_REG ? flags_9_rarAllocated : _GEN_3865; // @[LoadQueueReplay.scala 328:{36,36}]
  wire  _GEN_3867 = 4'ha == loadReplaySel_1_REG ? flags_10_rarAllocated : _GEN_3866; // @[LoadQueueReplay.scala 328:{36,36}]
  wire  _GEN_3868 = 4'hb == loadReplaySel_1_REG ? flags_11_rarAllocated : _GEN_3867; // @[LoadQueueReplay.scala 328:{36,36}]
  wire  _GEN_3869 = 4'hc == loadReplaySel_1_REG ? flags_12_rarAllocated : _GEN_3868; // @[LoadQueueReplay.scala 328:{36,36}]
  wire  _GEN_3870 = 4'hd == loadReplaySel_1_REG ? flags_13_rarAllocated : _GEN_3869; // @[LoadQueueReplay.scala 328:{36,36}]
  wire  _GEN_3871 = 4'he == loadReplaySel_1_REG ? flags_14_rarAllocated : _GEN_3870; // @[LoadQueueReplay.scala 328:{36,36}]
  wire [3:0] _GEN_3874 = 4'h1 == loadReplaySel_1_REG ? flags_1_rarIndex : flags_0_rarIndex; // @[LoadQueueReplay.scala 329:{32,32}]
  wire [3:0] _GEN_3875 = 4'h2 == loadReplaySel_1_REG ? flags_2_rarIndex : _GEN_3874; // @[LoadQueueReplay.scala 329:{32,32}]
  wire [3:0] _GEN_3876 = 4'h3 == loadReplaySel_1_REG ? flags_3_rarIndex : _GEN_3875; // @[LoadQueueReplay.scala 329:{32,32}]
  wire [3:0] _GEN_3877 = 4'h4 == loadReplaySel_1_REG ? flags_4_rarIndex : _GEN_3876; // @[LoadQueueReplay.scala 329:{32,32}]
  wire [3:0] _GEN_3878 = 4'h5 == loadReplaySel_1_REG ? flags_5_rarIndex : _GEN_3877; // @[LoadQueueReplay.scala 329:{32,32}]
  wire [3:0] _GEN_3879 = 4'h6 == loadReplaySel_1_REG ? flags_6_rarIndex : _GEN_3878; // @[LoadQueueReplay.scala 329:{32,32}]
  wire [3:0] _GEN_3880 = 4'h7 == loadReplaySel_1_REG ? flags_7_rarIndex : _GEN_3879; // @[LoadQueueReplay.scala 329:{32,32}]
  wire [3:0] _GEN_3881 = 4'h8 == loadReplaySel_1_REG ? flags_8_rarIndex : _GEN_3880; // @[LoadQueueReplay.scala 329:{32,32}]
  wire [3:0] _GEN_3882 = 4'h9 == loadReplaySel_1_REG ? flags_9_rarIndex : _GEN_3881; // @[LoadQueueReplay.scala 329:{32,32}]
  wire [3:0] _GEN_3883 = 4'ha == loadReplaySel_1_REG ? flags_10_rarIndex : _GEN_3882; // @[LoadQueueReplay.scala 329:{32,32}]
  wire [3:0] _GEN_3884 = 4'hb == loadReplaySel_1_REG ? flags_11_rarIndex : _GEN_3883; // @[LoadQueueReplay.scala 329:{32,32}]
  wire [3:0] _GEN_3885 = 4'hc == loadReplaySel_1_REG ? flags_12_rarIndex : _GEN_3884; // @[LoadQueueReplay.scala 329:{32,32}]
  wire [3:0] _GEN_3886 = 4'hd == loadReplaySel_1_REG ? flags_13_rarIndex : _GEN_3885; // @[LoadQueueReplay.scala 329:{32,32}]
  wire [3:0] _GEN_3887 = 4'he == loadReplaySel_1_REG ? flags_14_rarIndex : _GEN_3886; // @[LoadQueueReplay.scala 329:{32,32}]
  wire  _GEN_3890 = 4'h1 == loadReplaySel_1_REG ? flags_1_rawAllocated : flags_0_rawAllocated; // @[LoadQueueReplay.scala 330:{36,36}]
  wire  _GEN_3891 = 4'h2 == loadReplaySel_1_REG ? flags_2_rawAllocated : _GEN_3890; // @[LoadQueueReplay.scala 330:{36,36}]
  wire  _GEN_3892 = 4'h3 == loadReplaySel_1_REG ? flags_3_rawAllocated : _GEN_3891; // @[LoadQueueReplay.scala 330:{36,36}]
  wire  _GEN_3893 = 4'h4 == loadReplaySel_1_REG ? flags_4_rawAllocated : _GEN_3892; // @[LoadQueueReplay.scala 330:{36,36}]
  wire  _GEN_3894 = 4'h5 == loadReplaySel_1_REG ? flags_5_rawAllocated : _GEN_3893; // @[LoadQueueReplay.scala 330:{36,36}]
  wire  _GEN_3895 = 4'h6 == loadReplaySel_1_REG ? flags_6_rawAllocated : _GEN_3894; // @[LoadQueueReplay.scala 330:{36,36}]
  wire  _GEN_3896 = 4'h7 == loadReplaySel_1_REG ? flags_7_rawAllocated : _GEN_3895; // @[LoadQueueReplay.scala 330:{36,36}]
  wire  _GEN_3897 = 4'h8 == loadReplaySel_1_REG ? flags_8_rawAllocated : _GEN_3896; // @[LoadQueueReplay.scala 330:{36,36}]
  wire  _GEN_3898 = 4'h9 == loadReplaySel_1_REG ? flags_9_rawAllocated : _GEN_3897; // @[LoadQueueReplay.scala 330:{36,36}]
  wire  _GEN_3899 = 4'ha == loadReplaySel_1_REG ? flags_10_rawAllocated : _GEN_3898; // @[LoadQueueReplay.scala 330:{36,36}]
  wire  _GEN_3900 = 4'hb == loadReplaySel_1_REG ? flags_11_rawAllocated : _GEN_3899; // @[LoadQueueReplay.scala 330:{36,36}]
  wire  _GEN_3901 = 4'hc == loadReplaySel_1_REG ? flags_12_rawAllocated : _GEN_3900; // @[LoadQueueReplay.scala 330:{36,36}]
  wire  _GEN_3902 = 4'hd == loadReplaySel_1_REG ? flags_13_rawAllocated : _GEN_3901; // @[LoadQueueReplay.scala 330:{36,36}]
  wire  _GEN_3903 = 4'he == loadReplaySel_1_REG ? flags_14_rawAllocated : _GEN_3902; // @[LoadQueueReplay.scala 330:{36,36}]
  wire [2:0] _GEN_3906 = 4'h1 == loadReplaySel_1_REG ? flags_1_rawIndex : flags_0_rawIndex; // @[LoadQueueReplay.scala 331:{32,32}]
  wire [2:0] _GEN_3907 = 4'h2 == loadReplaySel_1_REG ? flags_2_rawIndex : _GEN_3906; // @[LoadQueueReplay.scala 331:{32,32}]
  wire [2:0] _GEN_3908 = 4'h3 == loadReplaySel_1_REG ? flags_3_rawIndex : _GEN_3907; // @[LoadQueueReplay.scala 331:{32,32}]
  wire [2:0] _GEN_3909 = 4'h4 == loadReplaySel_1_REG ? flags_4_rawIndex : _GEN_3908; // @[LoadQueueReplay.scala 331:{32,32}]
  wire [2:0] _GEN_3910 = 4'h5 == loadReplaySel_1_REG ? flags_5_rawIndex : _GEN_3909; // @[LoadQueueReplay.scala 331:{32,32}]
  wire [2:0] _GEN_3911 = 4'h6 == loadReplaySel_1_REG ? flags_6_rawIndex : _GEN_3910; // @[LoadQueueReplay.scala 331:{32,32}]
  wire [2:0] _GEN_3912 = 4'h7 == loadReplaySel_1_REG ? flags_7_rawIndex : _GEN_3911; // @[LoadQueueReplay.scala 331:{32,32}]
  wire [2:0] _GEN_3913 = 4'h8 == loadReplaySel_1_REG ? flags_8_rawIndex : _GEN_3912; // @[LoadQueueReplay.scala 331:{32,32}]
  wire [2:0] _GEN_3914 = 4'h9 == loadReplaySel_1_REG ? flags_9_rawIndex : _GEN_3913; // @[LoadQueueReplay.scala 331:{32,32}]
  wire [2:0] _GEN_3915 = 4'ha == loadReplaySel_1_REG ? flags_10_rawIndex : _GEN_3914; // @[LoadQueueReplay.scala 331:{32,32}]
  wire [2:0] _GEN_3916 = 4'hb == loadReplaySel_1_REG ? flags_11_rawIndex : _GEN_3915; // @[LoadQueueReplay.scala 331:{32,32}]
  wire [2:0] _GEN_3917 = 4'hc == loadReplaySel_1_REG ? flags_12_rawIndex : _GEN_3916; // @[LoadQueueReplay.scala 331:{32,32}]
  wire [2:0] _GEN_3918 = 4'hd == loadReplaySel_1_REG ? flags_13_rawIndex : _GEN_3917; // @[LoadQueueReplay.scala 331:{32,32}]
  wire [2:0] _GEN_3919 = 4'he == loadReplaySel_1_REG ? flags_14_rawIndex : _GEN_3918; // @[LoadQueueReplay.scala 331:{32,32}]
  wire  _GEN_3921 = 4'h0 == loadReplaySel_1_REG ? 1'h0 : _GEN_2048; // @[LoadQueueReplay.scala 334:{28,28}]
  wire  _GEN_3922 = 4'h1 == loadReplaySel_1_REG ? 1'h0 : _GEN_2049; // @[LoadQueueReplay.scala 334:{28,28}]
  wire  _GEN_3923 = 4'h2 == loadReplaySel_1_REG ? 1'h0 : _GEN_2050; // @[LoadQueueReplay.scala 334:{28,28}]
  wire  _GEN_3924 = 4'h3 == loadReplaySel_1_REG ? 1'h0 : _GEN_2051; // @[LoadQueueReplay.scala 334:{28,28}]
  wire  _GEN_3925 = 4'h4 == loadReplaySel_1_REG ? 1'h0 : _GEN_2052; // @[LoadQueueReplay.scala 334:{28,28}]
  wire  _GEN_3926 = 4'h5 == loadReplaySel_1_REG ? 1'h0 : _GEN_2053; // @[LoadQueueReplay.scala 334:{28,28}]
  wire  _GEN_3927 = 4'h6 == loadReplaySel_1_REG ? 1'h0 : _GEN_2054; // @[LoadQueueReplay.scala 334:{28,28}]
  wire  _GEN_3928 = 4'h7 == loadReplaySel_1_REG ? 1'h0 : _GEN_2055; // @[LoadQueueReplay.scala 334:{28,28}]
  wire  _GEN_3929 = 4'h8 == loadReplaySel_1_REG ? 1'h0 : _GEN_2056; // @[LoadQueueReplay.scala 334:{28,28}]
  wire  _GEN_3930 = 4'h9 == loadReplaySel_1_REG ? 1'h0 : _GEN_2057; // @[LoadQueueReplay.scala 334:{28,28}]
  wire  _GEN_3931 = 4'ha == loadReplaySel_1_REG ? 1'h0 : _GEN_2058; // @[LoadQueueReplay.scala 334:{28,28}]
  wire  _GEN_3932 = 4'hb == loadReplaySel_1_REG ? 1'h0 : _GEN_2059; // @[LoadQueueReplay.scala 334:{28,28}]
  wire  _GEN_3933 = 4'hc == loadReplaySel_1_REG ? 1'h0 : _GEN_2060; // @[LoadQueueReplay.scala 334:{28,28}]
  wire  _GEN_3934 = 4'hd == loadReplaySel_1_REG ? 1'h0 : _GEN_2061; // @[LoadQueueReplay.scala 334:{28,28}]
  wire  _GEN_3935 = 4'he == loadReplaySel_1_REG ? 1'h0 : _GEN_2062; // @[LoadQueueReplay.scala 334:{28,28}]
  wire  _GEN_3936 = 4'hf == loadReplaySel_1_REG ? 1'h0 : _GEN_2063; // @[LoadQueueReplay.scala 334:{28,28}]
  wire  _GEN_3953 = replayRemFire_1 ? _GEN_3921 : _GEN_2048; // @[LoadQueueReplay.scala 333:30]
  wire  _GEN_3954 = replayRemFire_1 ? _GEN_3922 : _GEN_2049; // @[LoadQueueReplay.scala 333:30]
  wire  _GEN_3955 = replayRemFire_1 ? _GEN_3923 : _GEN_2050; // @[LoadQueueReplay.scala 333:30]
  wire  _GEN_3956 = replayRemFire_1 ? _GEN_3924 : _GEN_2051; // @[LoadQueueReplay.scala 333:30]
  wire  _GEN_3957 = replayRemFire_1 ? _GEN_3925 : _GEN_2052; // @[LoadQueueReplay.scala 333:30]
  wire  _GEN_3958 = replayRemFire_1 ? _GEN_3926 : _GEN_2053; // @[LoadQueueReplay.scala 333:30]
  wire  _GEN_3959 = replayRemFire_1 ? _GEN_3927 : _GEN_2054; // @[LoadQueueReplay.scala 333:30]
  wire  _GEN_3960 = replayRemFire_1 ? _GEN_3928 : _GEN_2055; // @[LoadQueueReplay.scala 333:30]
  wire  _GEN_3961 = replayRemFire_1 ? _GEN_3929 : _GEN_2056; // @[LoadQueueReplay.scala 333:30]
  wire  _GEN_3962 = replayRemFire_1 ? _GEN_3930 : _GEN_2057; // @[LoadQueueReplay.scala 333:30]
  wire  _GEN_3963 = replayRemFire_1 ? _GEN_3931 : _GEN_2058; // @[LoadQueueReplay.scala 333:30]
  wire  _GEN_3964 = replayRemFire_1 ? _GEN_3932 : _GEN_2059; // @[LoadQueueReplay.scala 333:30]
  wire  _GEN_3965 = replayRemFire_1 ? _GEN_3933 : _GEN_2060; // @[LoadQueueReplay.scala 333:30]
  wire  _GEN_3966 = replayRemFire_1 ? _GEN_3934 : _GEN_2061; // @[LoadQueueReplay.scala 333:30]
  wire  _GEN_3967 = replayRemFire_1 ? _GEN_3935 : _GEN_2062; // @[LoadQueueReplay.scala 333:30]
  wire  _GEN_3968 = replayRemFire_1 ? _GEN_3936 : _GEN_2063; // @[LoadQueueReplay.scala 333:30]
  wire  _lastReplay_T_2 = replayRemFire_0 | replayRemFire_1; // @[LoadQueueReplay.scala 341:58]
  reg  lastReplay; // @[LoadQueueReplay.scala 341:27]
  wire [2:0] _coldCounter_T_1 = coldCounter + 3'h1; // @[LoadQueueReplay.scala 343:32]
  wire [1:0] _lqFull_T = allocated_0 + allocated_1; // @[Bitwise.scala 48:55]
  wire [1:0] _lqFull_T_2 = allocated_2 + allocated_3; // @[Bitwise.scala 48:55]
  wire [2:0] _lqFull_T_4 = _lqFull_T + _lqFull_T_2; // @[Bitwise.scala 48:55]
  wire [1:0] _lqFull_T_6 = allocated_4 + allocated_5; // @[Bitwise.scala 48:55]
  wire [1:0] _lqFull_T_8 = allocated_6 + allocated_7; // @[Bitwise.scala 48:55]
  wire [2:0] _lqFull_T_10 = _lqFull_T_6 + _lqFull_T_8; // @[Bitwise.scala 48:55]
  wire [3:0] _lqFull_T_12 = _lqFull_T_4 + _lqFull_T_10; // @[Bitwise.scala 48:55]
  wire [1:0] _lqFull_T_14 = allocated_8 + allocated_9; // @[Bitwise.scala 48:55]
  wire [1:0] _lqFull_T_16 = allocated_10 + allocated_11; // @[Bitwise.scala 48:55]
  wire [2:0] _lqFull_T_18 = _lqFull_T_14 + _lqFull_T_16; // @[Bitwise.scala 48:55]
  wire [1:0] _lqFull_T_20 = allocated_12 + allocated_13; // @[Bitwise.scala 48:55]
  wire [1:0] _lqFull_T_22 = allocated_14 + allocated_15; // @[Bitwise.scala 48:55]
  wire [2:0] _lqFull_T_24 = _lqFull_T_20 + _lqFull_T_22; // @[Bitwise.scala 48:55]
  wire [3:0] _lqFull_T_26 = _lqFull_T_18 + _lqFull_T_24; // @[Bitwise.scala 48:55]
  wire [4:0] _lqFull_T_28 = _lqFull_T_12 + _lqFull_T_26; // @[Bitwise.scala 48:55]
  wire [4:0] _lqFull_T_31 = 5'h10 - _lqFull_T_28; // @[LoadQueueReplay.scala 356:39]
  wire  _GEN_13308 = 4'h0 == enqIdx; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_3988 = 4'h0 == enqIdx | _GEN_3953; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_13309 = 4'h1 == enqIdx; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_3989 = 4'h1 == enqIdx | _GEN_3954; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_13310 = 4'h2 == enqIdx; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_3990 = 4'h2 == enqIdx | _GEN_3955; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_13311 = 4'h3 == enqIdx; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_3991 = 4'h3 == enqIdx | _GEN_3956; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_13312 = 4'h4 == enqIdx; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_3992 = 4'h4 == enqIdx | _GEN_3957; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_13313 = 4'h5 == enqIdx; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_3993 = 4'h5 == enqIdx | _GEN_3958; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_13314 = 4'h6 == enqIdx; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_3994 = 4'h6 == enqIdx | _GEN_3959; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_13315 = 4'h7 == enqIdx; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_3995 = 4'h7 == enqIdx | _GEN_3960; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_13316 = 4'h8 == enqIdx; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_3996 = 4'h8 == enqIdx | _GEN_3961; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_13317 = 4'h9 == enqIdx; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_3997 = 4'h9 == enqIdx | _GEN_3962; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_13318 = 4'ha == enqIdx; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_3998 = 4'ha == enqIdx | _GEN_3963; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_13319 = 4'hb == enqIdx; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_3999 = 4'hb == enqIdx | _GEN_3964; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_13320 = 4'hc == enqIdx; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_4000 = 4'hc == enqIdx | _GEN_3965; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_13321 = 4'hd == enqIdx; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_4001 = 4'hd == enqIdx | _GEN_3966; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_13322 = 4'he == enqIdx; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_4002 = 4'he == enqIdx | _GEN_3967; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_13323 = 4'hf == enqIdx; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_4003 = 4'hf == enqIdx | _GEN_3968; // @[LoadQueueReplay.scala 366:{25,25}]
  wire [9:0] _GEN_4036 = 4'h0 == enqIdx ? io_enq_0_bits_uop_cf_foldpc : uop_0_cf_foldpc; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [9:0] _GEN_4037 = 4'h1 == enqIdx ? io_enq_0_bits_uop_cf_foldpc : uop_1_cf_foldpc; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [9:0] _GEN_4038 = 4'h2 == enqIdx ? io_enq_0_bits_uop_cf_foldpc : uop_2_cf_foldpc; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [9:0] _GEN_4039 = 4'h3 == enqIdx ? io_enq_0_bits_uop_cf_foldpc : uop_3_cf_foldpc; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [9:0] _GEN_4040 = 4'h4 == enqIdx ? io_enq_0_bits_uop_cf_foldpc : uop_4_cf_foldpc; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [9:0] _GEN_4041 = 4'h5 == enqIdx ? io_enq_0_bits_uop_cf_foldpc : uop_5_cf_foldpc; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [9:0] _GEN_4042 = 4'h6 == enqIdx ? io_enq_0_bits_uop_cf_foldpc : uop_6_cf_foldpc; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [9:0] _GEN_4043 = 4'h7 == enqIdx ? io_enq_0_bits_uop_cf_foldpc : uop_7_cf_foldpc; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [9:0] _GEN_4044 = 4'h8 == enqIdx ? io_enq_0_bits_uop_cf_foldpc : uop_8_cf_foldpc; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [9:0] _GEN_4045 = 4'h9 == enqIdx ? io_enq_0_bits_uop_cf_foldpc : uop_9_cf_foldpc; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [9:0] _GEN_4046 = 4'ha == enqIdx ? io_enq_0_bits_uop_cf_foldpc : uop_10_cf_foldpc; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [9:0] _GEN_4047 = 4'hb == enqIdx ? io_enq_0_bits_uop_cf_foldpc : uop_11_cf_foldpc; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [9:0] _GEN_4048 = 4'hc == enqIdx ? io_enq_0_bits_uop_cf_foldpc : uop_12_cf_foldpc; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [9:0] _GEN_4049 = 4'hd == enqIdx ? io_enq_0_bits_uop_cf_foldpc : uop_13_cf_foldpc; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [9:0] _GEN_4050 = 4'he == enqIdx ? io_enq_0_bits_uop_cf_foldpc : uop_14_cf_foldpc; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [9:0] _GEN_4051 = 4'hf == enqIdx ? io_enq_0_bits_uop_cf_foldpc : uop_15_cf_foldpc; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4388 = 4'h0 == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendEn_1 : uop_0_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4389 = 4'h1 == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendEn_1 : uop_1_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4390 = 4'h2 == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendEn_1 : uop_2_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4391 = 4'h3 == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendEn_1 : uop_3_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4392 = 4'h4 == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendEn_1 : uop_4_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4393 = 4'h5 == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendEn_1 : uop_5_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4394 = 4'h6 == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendEn_1 : uop_6_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4395 = 4'h7 == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendEn_1 : uop_7_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4396 = 4'h8 == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendEn_1 : uop_8_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4397 = 4'h9 == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendEn_1 : uop_9_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4398 = 4'ha == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendEn_1 : uop_10_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4399 = 4'hb == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendEn_1 : uop_11_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4400 = 4'hc == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendEn_1 : uop_12_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4401 = 4'hd == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendEn_1 : uop_13_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4402 = 4'he == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendEn_1 : uop_14_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4403 = 4'hf == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendEn_1 : uop_15_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4404 = 4'h0 == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendHit_0 : uop_0_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4405 = 4'h1 == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendHit_0 : uop_1_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4406 = 4'h2 == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendHit_0 : uop_2_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4407 = 4'h3 == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendHit_0 : uop_3_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4408 = 4'h4 == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendHit_0 : uop_4_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4409 = 4'h5 == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendHit_0 : uop_5_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4410 = 4'h6 == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendHit_0 : uop_6_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4411 = 4'h7 == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendHit_0 : uop_7_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4412 = 4'h8 == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendHit_0 : uop_8_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4413 = 4'h9 == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendHit_0 : uop_9_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4414 = 4'ha == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendHit_0 : uop_10_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4415 = 4'hb == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendHit_0 : uop_11_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4416 = 4'hc == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendHit_0 : uop_12_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4417 = 4'hd == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendHit_0 : uop_13_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4418 = 4'he == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendHit_0 : uop_14_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4419 = 4'hf == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendHit_0 : uop_15_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4420 = 4'h0 == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendHit_1 : uop_0_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4421 = 4'h1 == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendHit_1 : uop_1_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4422 = 4'h2 == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendHit_1 : uop_2_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4423 = 4'h3 == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendHit_1 : uop_3_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4424 = 4'h4 == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendHit_1 : uop_4_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4425 = 4'h5 == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendHit_1 : uop_5_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4426 = 4'h6 == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendHit_1 : uop_6_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4427 = 4'h7 == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendHit_1 : uop_7_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4428 = 4'h8 == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendHit_1 : uop_8_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4429 = 4'h9 == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendHit_1 : uop_9_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4430 = 4'ha == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendHit_1 : uop_10_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4431 = 4'hb == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendHit_1 : uop_11_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4432 = 4'hc == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendHit_1 : uop_12_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4433 = 4'hd == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendHit_1 : uop_13_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4434 = 4'he == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendHit_1 : uop_14_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4435 = 4'hf == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendHit_1 : uop_15_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4468 = 4'h0 == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendHit_4 : uop_0_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4469 = 4'h1 == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendHit_4 : uop_1_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4470 = 4'h2 == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendHit_4 : uop_2_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4471 = 4'h3 == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendHit_4 : uop_3_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4472 = 4'h4 == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendHit_4 : uop_4_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4473 = 4'h5 == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendHit_4 : uop_5_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4474 = 4'h6 == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendHit_4 : uop_6_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4475 = 4'h7 == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendHit_4 : uop_7_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4476 = 4'h8 == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendHit_4 : uop_8_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4477 = 4'h9 == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendHit_4 : uop_9_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4478 = 4'ha == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendHit_4 : uop_10_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4479 = 4'hb == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendHit_4 : uop_11_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4480 = 4'hc == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendHit_4 : uop_12_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4481 = 4'hd == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendHit_4 : uop_13_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4482 = 4'he == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendHit_4 : uop_14_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4483 = 4'hf == enqIdx ? io_enq_0_bits_uop_cf_trigger_backendHit_4 : uop_15_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4628 = 4'h0 == enqIdx ? io_enq_0_bits_uop_cf_waitForRobIdx_flag : uop_0_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4629 = 4'h1 == enqIdx ? io_enq_0_bits_uop_cf_waitForRobIdx_flag : uop_1_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4630 = 4'h2 == enqIdx ? io_enq_0_bits_uop_cf_waitForRobIdx_flag : uop_2_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4631 = 4'h3 == enqIdx ? io_enq_0_bits_uop_cf_waitForRobIdx_flag : uop_3_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4632 = 4'h4 == enqIdx ? io_enq_0_bits_uop_cf_waitForRobIdx_flag : uop_4_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4633 = 4'h5 == enqIdx ? io_enq_0_bits_uop_cf_waitForRobIdx_flag : uop_5_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4634 = 4'h6 == enqIdx ? io_enq_0_bits_uop_cf_waitForRobIdx_flag : uop_6_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4635 = 4'h7 == enqIdx ? io_enq_0_bits_uop_cf_waitForRobIdx_flag : uop_7_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4636 = 4'h8 == enqIdx ? io_enq_0_bits_uop_cf_waitForRobIdx_flag : uop_8_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4637 = 4'h9 == enqIdx ? io_enq_0_bits_uop_cf_waitForRobIdx_flag : uop_9_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4638 = 4'ha == enqIdx ? io_enq_0_bits_uop_cf_waitForRobIdx_flag : uop_10_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4639 = 4'hb == enqIdx ? io_enq_0_bits_uop_cf_waitForRobIdx_flag : uop_11_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4640 = 4'hc == enqIdx ? io_enq_0_bits_uop_cf_waitForRobIdx_flag : uop_12_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4641 = 4'hd == enqIdx ? io_enq_0_bits_uop_cf_waitForRobIdx_flag : uop_13_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4642 = 4'he == enqIdx ? io_enq_0_bits_uop_cf_waitForRobIdx_flag : uop_14_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4643 = 4'hf == enqIdx ? io_enq_0_bits_uop_cf_waitForRobIdx_flag : uop_15_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [4:0] _GEN_4644 = 4'h0 == enqIdx ? io_enq_0_bits_uop_cf_waitForRobIdx_value : uop_0_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [4:0] _GEN_4645 = 4'h1 == enqIdx ? io_enq_0_bits_uop_cf_waitForRobIdx_value : uop_1_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [4:0] _GEN_4646 = 4'h2 == enqIdx ? io_enq_0_bits_uop_cf_waitForRobIdx_value : uop_2_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [4:0] _GEN_4647 = 4'h3 == enqIdx ? io_enq_0_bits_uop_cf_waitForRobIdx_value : uop_3_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [4:0] _GEN_4648 = 4'h4 == enqIdx ? io_enq_0_bits_uop_cf_waitForRobIdx_value : uop_4_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [4:0] _GEN_4649 = 4'h5 == enqIdx ? io_enq_0_bits_uop_cf_waitForRobIdx_value : uop_5_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [4:0] _GEN_4650 = 4'h6 == enqIdx ? io_enq_0_bits_uop_cf_waitForRobIdx_value : uop_6_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [4:0] _GEN_4651 = 4'h7 == enqIdx ? io_enq_0_bits_uop_cf_waitForRobIdx_value : uop_7_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [4:0] _GEN_4652 = 4'h8 == enqIdx ? io_enq_0_bits_uop_cf_waitForRobIdx_value : uop_8_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [4:0] _GEN_4653 = 4'h9 == enqIdx ? io_enq_0_bits_uop_cf_waitForRobIdx_value : uop_9_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [4:0] _GEN_4654 = 4'ha == enqIdx ? io_enq_0_bits_uop_cf_waitForRobIdx_value : uop_10_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [4:0] _GEN_4655 = 4'hb == enqIdx ? io_enq_0_bits_uop_cf_waitForRobIdx_value : uop_11_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [4:0] _GEN_4656 = 4'hc == enqIdx ? io_enq_0_bits_uop_cf_waitForRobIdx_value : uop_12_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [4:0] _GEN_4657 = 4'hd == enqIdx ? io_enq_0_bits_uop_cf_waitForRobIdx_value : uop_13_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [4:0] _GEN_4658 = 4'he == enqIdx ? io_enq_0_bits_uop_cf_waitForRobIdx_value : uop_14_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [4:0] _GEN_4659 = 4'hf == enqIdx ? io_enq_0_bits_uop_cf_waitForRobIdx_value : uop_15_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4660 = 4'h0 == enqIdx ? io_enq_0_bits_uop_cf_loadWaitBit : uop_0_cf_loadWaitBit; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4661 = 4'h1 == enqIdx ? io_enq_0_bits_uop_cf_loadWaitBit : uop_1_cf_loadWaitBit; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4662 = 4'h2 == enqIdx ? io_enq_0_bits_uop_cf_loadWaitBit : uop_2_cf_loadWaitBit; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4663 = 4'h3 == enqIdx ? io_enq_0_bits_uop_cf_loadWaitBit : uop_3_cf_loadWaitBit; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4664 = 4'h4 == enqIdx ? io_enq_0_bits_uop_cf_loadWaitBit : uop_4_cf_loadWaitBit; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4665 = 4'h5 == enqIdx ? io_enq_0_bits_uop_cf_loadWaitBit : uop_5_cf_loadWaitBit; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4666 = 4'h6 == enqIdx ? io_enq_0_bits_uop_cf_loadWaitBit : uop_6_cf_loadWaitBit; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4667 = 4'h7 == enqIdx ? io_enq_0_bits_uop_cf_loadWaitBit : uop_7_cf_loadWaitBit; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4668 = 4'h8 == enqIdx ? io_enq_0_bits_uop_cf_loadWaitBit : uop_8_cf_loadWaitBit; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4669 = 4'h9 == enqIdx ? io_enq_0_bits_uop_cf_loadWaitBit : uop_9_cf_loadWaitBit; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4670 = 4'ha == enqIdx ? io_enq_0_bits_uop_cf_loadWaitBit : uop_10_cf_loadWaitBit; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4671 = 4'hb == enqIdx ? io_enq_0_bits_uop_cf_loadWaitBit : uop_11_cf_loadWaitBit; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4672 = 4'hc == enqIdx ? io_enq_0_bits_uop_cf_loadWaitBit : uop_12_cf_loadWaitBit; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4673 = 4'hd == enqIdx ? io_enq_0_bits_uop_cf_loadWaitBit : uop_13_cf_loadWaitBit; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4674 = 4'he == enqIdx ? io_enq_0_bits_uop_cf_loadWaitBit : uop_14_cf_loadWaitBit; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4675 = 4'hf == enqIdx ? io_enq_0_bits_uop_cf_loadWaitBit : uop_15_cf_loadWaitBit; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4676 = 4'h0 == enqIdx ? io_enq_0_bits_uop_cf_loadWaitStrict : uop_0_cf_loadWaitStrict; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4677 = 4'h1 == enqIdx ? io_enq_0_bits_uop_cf_loadWaitStrict : uop_1_cf_loadWaitStrict; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4678 = 4'h2 == enqIdx ? io_enq_0_bits_uop_cf_loadWaitStrict : uop_2_cf_loadWaitStrict; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4679 = 4'h3 == enqIdx ? io_enq_0_bits_uop_cf_loadWaitStrict : uop_3_cf_loadWaitStrict; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4680 = 4'h4 == enqIdx ? io_enq_0_bits_uop_cf_loadWaitStrict : uop_4_cf_loadWaitStrict; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4681 = 4'h5 == enqIdx ? io_enq_0_bits_uop_cf_loadWaitStrict : uop_5_cf_loadWaitStrict; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4682 = 4'h6 == enqIdx ? io_enq_0_bits_uop_cf_loadWaitStrict : uop_6_cf_loadWaitStrict; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4683 = 4'h7 == enqIdx ? io_enq_0_bits_uop_cf_loadWaitStrict : uop_7_cf_loadWaitStrict; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4684 = 4'h8 == enqIdx ? io_enq_0_bits_uop_cf_loadWaitStrict : uop_8_cf_loadWaitStrict; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4685 = 4'h9 == enqIdx ? io_enq_0_bits_uop_cf_loadWaitStrict : uop_9_cf_loadWaitStrict; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4686 = 4'ha == enqIdx ? io_enq_0_bits_uop_cf_loadWaitStrict : uop_10_cf_loadWaitStrict; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4687 = 4'hb == enqIdx ? io_enq_0_bits_uop_cf_loadWaitStrict : uop_11_cf_loadWaitStrict; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4688 = 4'hc == enqIdx ? io_enq_0_bits_uop_cf_loadWaitStrict : uop_12_cf_loadWaitStrict; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4689 = 4'hd == enqIdx ? io_enq_0_bits_uop_cf_loadWaitStrict : uop_13_cf_loadWaitStrict; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4690 = 4'he == enqIdx ? io_enq_0_bits_uop_cf_loadWaitStrict : uop_14_cf_loadWaitStrict; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4691 = 4'hf == enqIdx ? io_enq_0_bits_uop_cf_loadWaitStrict : uop_15_cf_loadWaitStrict; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4708 = 4'h0 == enqIdx ? io_enq_0_bits_uop_cf_ftqPtr_flag : uop_0_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4709 = 4'h1 == enqIdx ? io_enq_0_bits_uop_cf_ftqPtr_flag : uop_1_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4710 = 4'h2 == enqIdx ? io_enq_0_bits_uop_cf_ftqPtr_flag : uop_2_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4711 = 4'h3 == enqIdx ? io_enq_0_bits_uop_cf_ftqPtr_flag : uop_3_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4712 = 4'h4 == enqIdx ? io_enq_0_bits_uop_cf_ftqPtr_flag : uop_4_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4713 = 4'h5 == enqIdx ? io_enq_0_bits_uop_cf_ftqPtr_flag : uop_5_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4714 = 4'h6 == enqIdx ? io_enq_0_bits_uop_cf_ftqPtr_flag : uop_6_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4715 = 4'h7 == enqIdx ? io_enq_0_bits_uop_cf_ftqPtr_flag : uop_7_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4716 = 4'h8 == enqIdx ? io_enq_0_bits_uop_cf_ftqPtr_flag : uop_8_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4717 = 4'h9 == enqIdx ? io_enq_0_bits_uop_cf_ftqPtr_flag : uop_9_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4718 = 4'ha == enqIdx ? io_enq_0_bits_uop_cf_ftqPtr_flag : uop_10_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4719 = 4'hb == enqIdx ? io_enq_0_bits_uop_cf_ftqPtr_flag : uop_11_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4720 = 4'hc == enqIdx ? io_enq_0_bits_uop_cf_ftqPtr_flag : uop_12_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4721 = 4'hd == enqIdx ? io_enq_0_bits_uop_cf_ftqPtr_flag : uop_13_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4722 = 4'he == enqIdx ? io_enq_0_bits_uop_cf_ftqPtr_flag : uop_14_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4723 = 4'hf == enqIdx ? io_enq_0_bits_uop_cf_ftqPtr_flag : uop_15_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [2:0] _GEN_4724 = 4'h0 == enqIdx ? io_enq_0_bits_uop_cf_ftqPtr_value : uop_0_cf_ftqPtr_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [2:0] _GEN_4725 = 4'h1 == enqIdx ? io_enq_0_bits_uop_cf_ftqPtr_value : uop_1_cf_ftqPtr_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [2:0] _GEN_4726 = 4'h2 == enqIdx ? io_enq_0_bits_uop_cf_ftqPtr_value : uop_2_cf_ftqPtr_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [2:0] _GEN_4727 = 4'h3 == enqIdx ? io_enq_0_bits_uop_cf_ftqPtr_value : uop_3_cf_ftqPtr_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [2:0] _GEN_4728 = 4'h4 == enqIdx ? io_enq_0_bits_uop_cf_ftqPtr_value : uop_4_cf_ftqPtr_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [2:0] _GEN_4729 = 4'h5 == enqIdx ? io_enq_0_bits_uop_cf_ftqPtr_value : uop_5_cf_ftqPtr_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [2:0] _GEN_4730 = 4'h6 == enqIdx ? io_enq_0_bits_uop_cf_ftqPtr_value : uop_6_cf_ftqPtr_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [2:0] _GEN_4731 = 4'h7 == enqIdx ? io_enq_0_bits_uop_cf_ftqPtr_value : uop_7_cf_ftqPtr_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [2:0] _GEN_4732 = 4'h8 == enqIdx ? io_enq_0_bits_uop_cf_ftqPtr_value : uop_8_cf_ftqPtr_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [2:0] _GEN_4733 = 4'h9 == enqIdx ? io_enq_0_bits_uop_cf_ftqPtr_value : uop_9_cf_ftqPtr_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [2:0] _GEN_4734 = 4'ha == enqIdx ? io_enq_0_bits_uop_cf_ftqPtr_value : uop_10_cf_ftqPtr_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [2:0] _GEN_4735 = 4'hb == enqIdx ? io_enq_0_bits_uop_cf_ftqPtr_value : uop_11_cf_ftqPtr_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [2:0] _GEN_4736 = 4'hc == enqIdx ? io_enq_0_bits_uop_cf_ftqPtr_value : uop_12_cf_ftqPtr_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [2:0] _GEN_4737 = 4'hd == enqIdx ? io_enq_0_bits_uop_cf_ftqPtr_value : uop_13_cf_ftqPtr_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [2:0] _GEN_4738 = 4'he == enqIdx ? io_enq_0_bits_uop_cf_ftqPtr_value : uop_14_cf_ftqPtr_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [2:0] _GEN_4739 = 4'hf == enqIdx ? io_enq_0_bits_uop_cf_ftqPtr_value : uop_15_cf_ftqPtr_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [2:0] _GEN_4740 = 4'h0 == enqIdx ? io_enq_0_bits_uop_cf_ftqOffset : uop_0_cf_ftqOffset; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [2:0] _GEN_4741 = 4'h1 == enqIdx ? io_enq_0_bits_uop_cf_ftqOffset : uop_1_cf_ftqOffset; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [2:0] _GEN_4742 = 4'h2 == enqIdx ? io_enq_0_bits_uop_cf_ftqOffset : uop_2_cf_ftqOffset; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [2:0] _GEN_4743 = 4'h3 == enqIdx ? io_enq_0_bits_uop_cf_ftqOffset : uop_3_cf_ftqOffset; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [2:0] _GEN_4744 = 4'h4 == enqIdx ? io_enq_0_bits_uop_cf_ftqOffset : uop_4_cf_ftqOffset; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [2:0] _GEN_4745 = 4'h5 == enqIdx ? io_enq_0_bits_uop_cf_ftqOffset : uop_5_cf_ftqOffset; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [2:0] _GEN_4746 = 4'h6 == enqIdx ? io_enq_0_bits_uop_cf_ftqOffset : uop_6_cf_ftqOffset; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [2:0] _GEN_4747 = 4'h7 == enqIdx ? io_enq_0_bits_uop_cf_ftqOffset : uop_7_cf_ftqOffset; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [2:0] _GEN_4748 = 4'h8 == enqIdx ? io_enq_0_bits_uop_cf_ftqOffset : uop_8_cf_ftqOffset; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [2:0] _GEN_4749 = 4'h9 == enqIdx ? io_enq_0_bits_uop_cf_ftqOffset : uop_9_cf_ftqOffset; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [2:0] _GEN_4750 = 4'ha == enqIdx ? io_enq_0_bits_uop_cf_ftqOffset : uop_10_cf_ftqOffset; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [2:0] _GEN_4751 = 4'hb == enqIdx ? io_enq_0_bits_uop_cf_ftqOffset : uop_11_cf_ftqOffset; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [2:0] _GEN_4752 = 4'hc == enqIdx ? io_enq_0_bits_uop_cf_ftqOffset : uop_12_cf_ftqOffset; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [2:0] _GEN_4753 = 4'hd == enqIdx ? io_enq_0_bits_uop_cf_ftqOffset : uop_13_cf_ftqOffset; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [2:0] _GEN_4754 = 4'he == enqIdx ? io_enq_0_bits_uop_cf_ftqOffset : uop_14_cf_ftqOffset; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [2:0] _GEN_4755 = 4'hf == enqIdx ? io_enq_0_bits_uop_cf_ftqOffset : uop_15_cf_ftqOffset; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [3:0] _GEN_4884 = 4'h0 == enqIdx ? io_enq_0_bits_uop_ctrl_fuType : uop_0_ctrl_fuType; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [3:0] _GEN_4885 = 4'h1 == enqIdx ? io_enq_0_bits_uop_ctrl_fuType : uop_1_ctrl_fuType; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [3:0] _GEN_4886 = 4'h2 == enqIdx ? io_enq_0_bits_uop_ctrl_fuType : uop_2_ctrl_fuType; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [3:0] _GEN_4887 = 4'h3 == enqIdx ? io_enq_0_bits_uop_ctrl_fuType : uop_3_ctrl_fuType; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [3:0] _GEN_4888 = 4'h4 == enqIdx ? io_enq_0_bits_uop_ctrl_fuType : uop_4_ctrl_fuType; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [3:0] _GEN_4889 = 4'h5 == enqIdx ? io_enq_0_bits_uop_ctrl_fuType : uop_5_ctrl_fuType; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [3:0] _GEN_4890 = 4'h6 == enqIdx ? io_enq_0_bits_uop_ctrl_fuType : uop_6_ctrl_fuType; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [3:0] _GEN_4891 = 4'h7 == enqIdx ? io_enq_0_bits_uop_ctrl_fuType : uop_7_ctrl_fuType; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [3:0] _GEN_4892 = 4'h8 == enqIdx ? io_enq_0_bits_uop_ctrl_fuType : uop_8_ctrl_fuType; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [3:0] _GEN_4893 = 4'h9 == enqIdx ? io_enq_0_bits_uop_ctrl_fuType : uop_9_ctrl_fuType; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [3:0] _GEN_4894 = 4'ha == enqIdx ? io_enq_0_bits_uop_ctrl_fuType : uop_10_ctrl_fuType; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [3:0] _GEN_4895 = 4'hb == enqIdx ? io_enq_0_bits_uop_ctrl_fuType : uop_11_ctrl_fuType; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [3:0] _GEN_4896 = 4'hc == enqIdx ? io_enq_0_bits_uop_ctrl_fuType : uop_12_ctrl_fuType; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [3:0] _GEN_4897 = 4'hd == enqIdx ? io_enq_0_bits_uop_ctrl_fuType : uop_13_ctrl_fuType; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [3:0] _GEN_4898 = 4'he == enqIdx ? io_enq_0_bits_uop_ctrl_fuType : uop_14_ctrl_fuType; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [3:0] _GEN_4899 = 4'hf == enqIdx ? io_enq_0_bits_uop_ctrl_fuType : uop_15_ctrl_fuType; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [6:0] _GEN_4900 = 4'h0 == enqIdx ? io_enq_0_bits_uop_ctrl_fuOpType : uop_0_ctrl_fuOpType; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [6:0] _GEN_4901 = 4'h1 == enqIdx ? io_enq_0_bits_uop_ctrl_fuOpType : uop_1_ctrl_fuOpType; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [6:0] _GEN_4902 = 4'h2 == enqIdx ? io_enq_0_bits_uop_ctrl_fuOpType : uop_2_ctrl_fuOpType; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [6:0] _GEN_4903 = 4'h3 == enqIdx ? io_enq_0_bits_uop_ctrl_fuOpType : uop_3_ctrl_fuOpType; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [6:0] _GEN_4904 = 4'h4 == enqIdx ? io_enq_0_bits_uop_ctrl_fuOpType : uop_4_ctrl_fuOpType; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [6:0] _GEN_4905 = 4'h5 == enqIdx ? io_enq_0_bits_uop_ctrl_fuOpType : uop_5_ctrl_fuOpType; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [6:0] _GEN_4906 = 4'h6 == enqIdx ? io_enq_0_bits_uop_ctrl_fuOpType : uop_6_ctrl_fuOpType; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [6:0] _GEN_4907 = 4'h7 == enqIdx ? io_enq_0_bits_uop_ctrl_fuOpType : uop_7_ctrl_fuOpType; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [6:0] _GEN_4908 = 4'h8 == enqIdx ? io_enq_0_bits_uop_ctrl_fuOpType : uop_8_ctrl_fuOpType; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [6:0] _GEN_4909 = 4'h9 == enqIdx ? io_enq_0_bits_uop_ctrl_fuOpType : uop_9_ctrl_fuOpType; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [6:0] _GEN_4910 = 4'ha == enqIdx ? io_enq_0_bits_uop_ctrl_fuOpType : uop_10_ctrl_fuOpType; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [6:0] _GEN_4911 = 4'hb == enqIdx ? io_enq_0_bits_uop_ctrl_fuOpType : uop_11_ctrl_fuOpType; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [6:0] _GEN_4912 = 4'hc == enqIdx ? io_enq_0_bits_uop_ctrl_fuOpType : uop_12_ctrl_fuOpType; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [6:0] _GEN_4913 = 4'hd == enqIdx ? io_enq_0_bits_uop_ctrl_fuOpType : uop_13_ctrl_fuOpType; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [6:0] _GEN_4914 = 4'he == enqIdx ? io_enq_0_bits_uop_ctrl_fuOpType : uop_14_ctrl_fuOpType; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [6:0] _GEN_4915 = 4'hf == enqIdx ? io_enq_0_bits_uop_ctrl_fuOpType : uop_15_ctrl_fuOpType; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4916 = 4'h0 == enqIdx ? io_enq_0_bits_uop_ctrl_rfWen : uop_0_ctrl_rfWen; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4917 = 4'h1 == enqIdx ? io_enq_0_bits_uop_ctrl_rfWen : uop_1_ctrl_rfWen; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4918 = 4'h2 == enqIdx ? io_enq_0_bits_uop_ctrl_rfWen : uop_2_ctrl_rfWen; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4919 = 4'h3 == enqIdx ? io_enq_0_bits_uop_ctrl_rfWen : uop_3_ctrl_rfWen; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4920 = 4'h4 == enqIdx ? io_enq_0_bits_uop_ctrl_rfWen : uop_4_ctrl_rfWen; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4921 = 4'h5 == enqIdx ? io_enq_0_bits_uop_ctrl_rfWen : uop_5_ctrl_rfWen; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4922 = 4'h6 == enqIdx ? io_enq_0_bits_uop_ctrl_rfWen : uop_6_ctrl_rfWen; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4923 = 4'h7 == enqIdx ? io_enq_0_bits_uop_ctrl_rfWen : uop_7_ctrl_rfWen; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4924 = 4'h8 == enqIdx ? io_enq_0_bits_uop_ctrl_rfWen : uop_8_ctrl_rfWen; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4925 = 4'h9 == enqIdx ? io_enq_0_bits_uop_ctrl_rfWen : uop_9_ctrl_rfWen; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4926 = 4'ha == enqIdx ? io_enq_0_bits_uop_ctrl_rfWen : uop_10_ctrl_rfWen; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4927 = 4'hb == enqIdx ? io_enq_0_bits_uop_ctrl_rfWen : uop_11_ctrl_rfWen; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4928 = 4'hc == enqIdx ? io_enq_0_bits_uop_ctrl_rfWen : uop_12_ctrl_rfWen; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4929 = 4'hd == enqIdx ? io_enq_0_bits_uop_ctrl_rfWen : uop_13_ctrl_rfWen; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4930 = 4'he == enqIdx ? io_enq_0_bits_uop_ctrl_rfWen : uop_14_ctrl_rfWen; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4931 = 4'hf == enqIdx ? io_enq_0_bits_uop_ctrl_rfWen : uop_15_ctrl_rfWen; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4932 = 4'h0 == enqIdx ? io_enq_0_bits_uop_ctrl_fpWen : uop_0_ctrl_fpWen; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4933 = 4'h1 == enqIdx ? io_enq_0_bits_uop_ctrl_fpWen : uop_1_ctrl_fpWen; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4934 = 4'h2 == enqIdx ? io_enq_0_bits_uop_ctrl_fpWen : uop_2_ctrl_fpWen; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4935 = 4'h3 == enqIdx ? io_enq_0_bits_uop_ctrl_fpWen : uop_3_ctrl_fpWen; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4936 = 4'h4 == enqIdx ? io_enq_0_bits_uop_ctrl_fpWen : uop_4_ctrl_fpWen; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4937 = 4'h5 == enqIdx ? io_enq_0_bits_uop_ctrl_fpWen : uop_5_ctrl_fpWen; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4938 = 4'h6 == enqIdx ? io_enq_0_bits_uop_ctrl_fpWen : uop_6_ctrl_fpWen; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4939 = 4'h7 == enqIdx ? io_enq_0_bits_uop_ctrl_fpWen : uop_7_ctrl_fpWen; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4940 = 4'h8 == enqIdx ? io_enq_0_bits_uop_ctrl_fpWen : uop_8_ctrl_fpWen; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4941 = 4'h9 == enqIdx ? io_enq_0_bits_uop_ctrl_fpWen : uop_9_ctrl_fpWen; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4942 = 4'ha == enqIdx ? io_enq_0_bits_uop_ctrl_fpWen : uop_10_ctrl_fpWen; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4943 = 4'hb == enqIdx ? io_enq_0_bits_uop_ctrl_fpWen : uop_11_ctrl_fpWen; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4944 = 4'hc == enqIdx ? io_enq_0_bits_uop_ctrl_fpWen : uop_12_ctrl_fpWen; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4945 = 4'hd == enqIdx ? io_enq_0_bits_uop_ctrl_fpWen : uop_13_ctrl_fpWen; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4946 = 4'he == enqIdx ? io_enq_0_bits_uop_ctrl_fpWen : uop_14_ctrl_fpWen; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_4947 = 4'hf == enqIdx ? io_enq_0_bits_uop_ctrl_fpWen : uop_15_ctrl_fpWen; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [5:0] _GEN_5428 = 4'h0 == enqIdx ? io_enq_0_bits_uop_pdest : uop_0_pdest; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [5:0] _GEN_5429 = 4'h1 == enqIdx ? io_enq_0_bits_uop_pdest : uop_1_pdest; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [5:0] _GEN_5430 = 4'h2 == enqIdx ? io_enq_0_bits_uop_pdest : uop_2_pdest; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [5:0] _GEN_5431 = 4'h3 == enqIdx ? io_enq_0_bits_uop_pdest : uop_3_pdest; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [5:0] _GEN_5432 = 4'h4 == enqIdx ? io_enq_0_bits_uop_pdest : uop_4_pdest; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [5:0] _GEN_5433 = 4'h5 == enqIdx ? io_enq_0_bits_uop_pdest : uop_5_pdest; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [5:0] _GEN_5434 = 4'h6 == enqIdx ? io_enq_0_bits_uop_pdest : uop_6_pdest; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [5:0] _GEN_5435 = 4'h7 == enqIdx ? io_enq_0_bits_uop_pdest : uop_7_pdest; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [5:0] _GEN_5436 = 4'h8 == enqIdx ? io_enq_0_bits_uop_pdest : uop_8_pdest; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [5:0] _GEN_5437 = 4'h9 == enqIdx ? io_enq_0_bits_uop_pdest : uop_9_pdest; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [5:0] _GEN_5438 = 4'ha == enqIdx ? io_enq_0_bits_uop_pdest : uop_10_pdest; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [5:0] _GEN_5439 = 4'hb == enqIdx ? io_enq_0_bits_uop_pdest : uop_11_pdest; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [5:0] _GEN_5440 = 4'hc == enqIdx ? io_enq_0_bits_uop_pdest : uop_12_pdest; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [5:0] _GEN_5441 = 4'hd == enqIdx ? io_enq_0_bits_uop_pdest : uop_13_pdest; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [5:0] _GEN_5442 = 4'he == enqIdx ? io_enq_0_bits_uop_pdest : uop_14_pdest; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [5:0] _GEN_5443 = 4'hf == enqIdx ? io_enq_0_bits_uop_pdest : uop_15_pdest; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_5460 = 4'h0 == enqIdx ? io_enq_0_bits_uop_robIdx_flag : uop_0_robIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_5461 = 4'h1 == enqIdx ? io_enq_0_bits_uop_robIdx_flag : uop_1_robIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_5462 = 4'h2 == enqIdx ? io_enq_0_bits_uop_robIdx_flag : uop_2_robIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_5463 = 4'h3 == enqIdx ? io_enq_0_bits_uop_robIdx_flag : uop_3_robIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_5464 = 4'h4 == enqIdx ? io_enq_0_bits_uop_robIdx_flag : uop_4_robIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_5465 = 4'h5 == enqIdx ? io_enq_0_bits_uop_robIdx_flag : uop_5_robIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_5466 = 4'h6 == enqIdx ? io_enq_0_bits_uop_robIdx_flag : uop_6_robIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_5467 = 4'h7 == enqIdx ? io_enq_0_bits_uop_robIdx_flag : uop_7_robIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_5468 = 4'h8 == enqIdx ? io_enq_0_bits_uop_robIdx_flag : uop_8_robIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_5469 = 4'h9 == enqIdx ? io_enq_0_bits_uop_robIdx_flag : uop_9_robIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_5470 = 4'ha == enqIdx ? io_enq_0_bits_uop_robIdx_flag : uop_10_robIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_5471 = 4'hb == enqIdx ? io_enq_0_bits_uop_robIdx_flag : uop_11_robIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_5472 = 4'hc == enqIdx ? io_enq_0_bits_uop_robIdx_flag : uop_12_robIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_5473 = 4'hd == enqIdx ? io_enq_0_bits_uop_robIdx_flag : uop_13_robIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_5474 = 4'he == enqIdx ? io_enq_0_bits_uop_robIdx_flag : uop_14_robIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_5475 = 4'hf == enqIdx ? io_enq_0_bits_uop_robIdx_flag : uop_15_robIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [4:0] _GEN_5476 = 4'h0 == enqIdx ? io_enq_0_bits_uop_robIdx_value : uop_0_robIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [4:0] _GEN_5477 = 4'h1 == enqIdx ? io_enq_0_bits_uop_robIdx_value : uop_1_robIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [4:0] _GEN_5478 = 4'h2 == enqIdx ? io_enq_0_bits_uop_robIdx_value : uop_2_robIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [4:0] _GEN_5479 = 4'h3 == enqIdx ? io_enq_0_bits_uop_robIdx_value : uop_3_robIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [4:0] _GEN_5480 = 4'h4 == enqIdx ? io_enq_0_bits_uop_robIdx_value : uop_4_robIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [4:0] _GEN_5481 = 4'h5 == enqIdx ? io_enq_0_bits_uop_robIdx_value : uop_5_robIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [4:0] _GEN_5482 = 4'h6 == enqIdx ? io_enq_0_bits_uop_robIdx_value : uop_6_robIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [4:0] _GEN_5483 = 4'h7 == enqIdx ? io_enq_0_bits_uop_robIdx_value : uop_7_robIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [4:0] _GEN_5484 = 4'h8 == enqIdx ? io_enq_0_bits_uop_robIdx_value : uop_8_robIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [4:0] _GEN_5485 = 4'h9 == enqIdx ? io_enq_0_bits_uop_robIdx_value : uop_9_robIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [4:0] _GEN_5486 = 4'ha == enqIdx ? io_enq_0_bits_uop_robIdx_value : uop_10_robIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [4:0] _GEN_5487 = 4'hb == enqIdx ? io_enq_0_bits_uop_robIdx_value : uop_11_robIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [4:0] _GEN_5488 = 4'hc == enqIdx ? io_enq_0_bits_uop_robIdx_value : uop_12_robIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [4:0] _GEN_5489 = 4'hd == enqIdx ? io_enq_0_bits_uop_robIdx_value : uop_13_robIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [4:0] _GEN_5490 = 4'he == enqIdx ? io_enq_0_bits_uop_robIdx_value : uop_14_robIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [4:0] _GEN_5491 = 4'hf == enqIdx ? io_enq_0_bits_uop_robIdx_value : uop_15_robIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_5492 = 4'h0 == enqIdx ? io_enq_0_bits_uop_lqIdx_flag : uop_0_lqIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_5493 = 4'h1 == enqIdx ? io_enq_0_bits_uop_lqIdx_flag : uop_1_lqIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_5494 = 4'h2 == enqIdx ? io_enq_0_bits_uop_lqIdx_flag : uop_2_lqIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_5495 = 4'h3 == enqIdx ? io_enq_0_bits_uop_lqIdx_flag : uop_3_lqIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_5496 = 4'h4 == enqIdx ? io_enq_0_bits_uop_lqIdx_flag : uop_4_lqIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_5497 = 4'h5 == enqIdx ? io_enq_0_bits_uop_lqIdx_flag : uop_5_lqIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_5498 = 4'h6 == enqIdx ? io_enq_0_bits_uop_lqIdx_flag : uop_6_lqIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_5499 = 4'h7 == enqIdx ? io_enq_0_bits_uop_lqIdx_flag : uop_7_lqIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_5500 = 4'h8 == enqIdx ? io_enq_0_bits_uop_lqIdx_flag : uop_8_lqIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_5501 = 4'h9 == enqIdx ? io_enq_0_bits_uop_lqIdx_flag : uop_9_lqIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_5502 = 4'ha == enqIdx ? io_enq_0_bits_uop_lqIdx_flag : uop_10_lqIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_5503 = 4'hb == enqIdx ? io_enq_0_bits_uop_lqIdx_flag : uop_11_lqIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_5504 = 4'hc == enqIdx ? io_enq_0_bits_uop_lqIdx_flag : uop_12_lqIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_5505 = 4'hd == enqIdx ? io_enq_0_bits_uop_lqIdx_flag : uop_13_lqIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_5506 = 4'he == enqIdx ? io_enq_0_bits_uop_lqIdx_flag : uop_14_lqIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_5507 = 4'hf == enqIdx ? io_enq_0_bits_uop_lqIdx_flag : uop_15_lqIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [3:0] _GEN_5508 = 4'h0 == enqIdx ? io_enq_0_bits_uop_lqIdx_value : uop_0_lqIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [3:0] _GEN_5509 = 4'h1 == enqIdx ? io_enq_0_bits_uop_lqIdx_value : uop_1_lqIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [3:0] _GEN_5510 = 4'h2 == enqIdx ? io_enq_0_bits_uop_lqIdx_value : uop_2_lqIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [3:0] _GEN_5511 = 4'h3 == enqIdx ? io_enq_0_bits_uop_lqIdx_value : uop_3_lqIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [3:0] _GEN_5512 = 4'h4 == enqIdx ? io_enq_0_bits_uop_lqIdx_value : uop_4_lqIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [3:0] _GEN_5513 = 4'h5 == enqIdx ? io_enq_0_bits_uop_lqIdx_value : uop_5_lqIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [3:0] _GEN_5514 = 4'h6 == enqIdx ? io_enq_0_bits_uop_lqIdx_value : uop_6_lqIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [3:0] _GEN_5515 = 4'h7 == enqIdx ? io_enq_0_bits_uop_lqIdx_value : uop_7_lqIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [3:0] _GEN_5516 = 4'h8 == enqIdx ? io_enq_0_bits_uop_lqIdx_value : uop_8_lqIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [3:0] _GEN_5517 = 4'h9 == enqIdx ? io_enq_0_bits_uop_lqIdx_value : uop_9_lqIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [3:0] _GEN_5518 = 4'ha == enqIdx ? io_enq_0_bits_uop_lqIdx_value : uop_10_lqIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [3:0] _GEN_5519 = 4'hb == enqIdx ? io_enq_0_bits_uop_lqIdx_value : uop_11_lqIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [3:0] _GEN_5520 = 4'hc == enqIdx ? io_enq_0_bits_uop_lqIdx_value : uop_12_lqIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [3:0] _GEN_5521 = 4'hd == enqIdx ? io_enq_0_bits_uop_lqIdx_value : uop_13_lqIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [3:0] _GEN_5522 = 4'he == enqIdx ? io_enq_0_bits_uop_lqIdx_value : uop_14_lqIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [3:0] _GEN_5523 = 4'hf == enqIdx ? io_enq_0_bits_uop_lqIdx_value : uop_15_lqIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_5524 = 4'h0 == enqIdx ? io_enq_0_bits_uop_sqIdx_flag : uop_0_sqIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_5525 = 4'h1 == enqIdx ? io_enq_0_bits_uop_sqIdx_flag : uop_1_sqIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_5526 = 4'h2 == enqIdx ? io_enq_0_bits_uop_sqIdx_flag : uop_2_sqIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_5527 = 4'h3 == enqIdx ? io_enq_0_bits_uop_sqIdx_flag : uop_3_sqIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_5528 = 4'h4 == enqIdx ? io_enq_0_bits_uop_sqIdx_flag : uop_4_sqIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_5529 = 4'h5 == enqIdx ? io_enq_0_bits_uop_sqIdx_flag : uop_5_sqIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_5530 = 4'h6 == enqIdx ? io_enq_0_bits_uop_sqIdx_flag : uop_6_sqIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_5531 = 4'h7 == enqIdx ? io_enq_0_bits_uop_sqIdx_flag : uop_7_sqIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_5532 = 4'h8 == enqIdx ? io_enq_0_bits_uop_sqIdx_flag : uop_8_sqIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_5533 = 4'h9 == enqIdx ? io_enq_0_bits_uop_sqIdx_flag : uop_9_sqIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_5534 = 4'ha == enqIdx ? io_enq_0_bits_uop_sqIdx_flag : uop_10_sqIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_5535 = 4'hb == enqIdx ? io_enq_0_bits_uop_sqIdx_flag : uop_11_sqIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_5536 = 4'hc == enqIdx ? io_enq_0_bits_uop_sqIdx_flag : uop_12_sqIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_5537 = 4'hd == enqIdx ? io_enq_0_bits_uop_sqIdx_flag : uop_13_sqIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_5538 = 4'he == enqIdx ? io_enq_0_bits_uop_sqIdx_flag : uop_14_sqIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire  _GEN_5539 = 4'hf == enqIdx ? io_enq_0_bits_uop_sqIdx_flag : uop_15_sqIdx_flag; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [3:0] _GEN_5540 = 4'h0 == enqIdx ? io_enq_0_bits_uop_sqIdx_value : uop_0_sqIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [3:0] _GEN_5541 = 4'h1 == enqIdx ? io_enq_0_bits_uop_sqIdx_value : uop_1_sqIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [3:0] _GEN_5542 = 4'h2 == enqIdx ? io_enq_0_bits_uop_sqIdx_value : uop_2_sqIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [3:0] _GEN_5543 = 4'h3 == enqIdx ? io_enq_0_bits_uop_sqIdx_value : uop_3_sqIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [3:0] _GEN_5544 = 4'h4 == enqIdx ? io_enq_0_bits_uop_sqIdx_value : uop_4_sqIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [3:0] _GEN_5545 = 4'h5 == enqIdx ? io_enq_0_bits_uop_sqIdx_value : uop_5_sqIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [3:0] _GEN_5546 = 4'h6 == enqIdx ? io_enq_0_bits_uop_sqIdx_value : uop_6_sqIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [3:0] _GEN_5547 = 4'h7 == enqIdx ? io_enq_0_bits_uop_sqIdx_value : uop_7_sqIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [3:0] _GEN_5548 = 4'h8 == enqIdx ? io_enq_0_bits_uop_sqIdx_value : uop_8_sqIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [3:0] _GEN_5549 = 4'h9 == enqIdx ? io_enq_0_bits_uop_sqIdx_value : uop_9_sqIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [3:0] _GEN_5550 = 4'ha == enqIdx ? io_enq_0_bits_uop_sqIdx_value : uop_10_sqIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [3:0] _GEN_5551 = 4'hb == enqIdx ? io_enq_0_bits_uop_sqIdx_value : uop_11_sqIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [3:0] _GEN_5552 = 4'hc == enqIdx ? io_enq_0_bits_uop_sqIdx_value : uop_12_sqIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [3:0] _GEN_5553 = 4'hd == enqIdx ? io_enq_0_bits_uop_sqIdx_value : uop_13_sqIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [3:0] _GEN_5554 = 4'he == enqIdx ? io_enq_0_bits_uop_sqIdx_value : uop_14_sqIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [3:0] _GEN_5555 = 4'hf == enqIdx ? io_enq_0_bits_uop_sqIdx_value : uop_15_sqIdx_value; // @[LoadQueueReplay.scala 112:16 367:{19,19}]
  wire [7:0] _GEN_5732 = 4'h0 == enqIdx ? _needReplay_T : cause_0; // @[LoadQueueReplay.scala 379:{21,21} 121:22]
  wire [7:0] _GEN_5733 = 4'h1 == enqIdx ? _needReplay_T : cause_1; // @[LoadQueueReplay.scala 379:{21,21} 121:22]
  wire [7:0] _GEN_5734 = 4'h2 == enqIdx ? _needReplay_T : cause_2; // @[LoadQueueReplay.scala 379:{21,21} 121:22]
  wire [7:0] _GEN_5735 = 4'h3 == enqIdx ? _needReplay_T : cause_3; // @[LoadQueueReplay.scala 379:{21,21} 121:22]
  wire [7:0] _GEN_5736 = 4'h4 == enqIdx ? _needReplay_T : cause_4; // @[LoadQueueReplay.scala 379:{21,21} 121:22]
  wire [7:0] _GEN_5737 = 4'h5 == enqIdx ? _needReplay_T : cause_5; // @[LoadQueueReplay.scala 379:{21,21} 121:22]
  wire [7:0] _GEN_5738 = 4'h6 == enqIdx ? _needReplay_T : cause_6; // @[LoadQueueReplay.scala 379:{21,21} 121:22]
  wire [7:0] _GEN_5739 = 4'h7 == enqIdx ? _needReplay_T : cause_7; // @[LoadQueueReplay.scala 379:{21,21} 121:22]
  wire [7:0] _GEN_5740 = 4'h8 == enqIdx ? _needReplay_T : cause_8; // @[LoadQueueReplay.scala 379:{21,21} 121:22]
  wire [7:0] _GEN_5741 = 4'h9 == enqIdx ? _needReplay_T : cause_9; // @[LoadQueueReplay.scala 379:{21,21} 121:22]
  wire [7:0] _GEN_5742 = 4'ha == enqIdx ? _needReplay_T : cause_10; // @[LoadQueueReplay.scala 379:{21,21} 121:22]
  wire [7:0] _GEN_5743 = 4'hb == enqIdx ? _needReplay_T : cause_11; // @[LoadQueueReplay.scala 379:{21,21} 121:22]
  wire [7:0] _GEN_5744 = 4'hc == enqIdx ? _needReplay_T : cause_12; // @[LoadQueueReplay.scala 379:{21,21} 121:22]
  wire [7:0] _GEN_5745 = 4'hd == enqIdx ? _needReplay_T : cause_13; // @[LoadQueueReplay.scala 379:{21,21} 121:22]
  wire [7:0] _GEN_5746 = 4'he == enqIdx ? _needReplay_T : cause_14; // @[LoadQueueReplay.scala 379:{21,21} 121:22]
  wire [7:0] _GEN_5747 = 4'hf == enqIdx ? _needReplay_T : cause_15; // @[LoadQueueReplay.scala 379:{21,21} 121:22]
  wire  _GEN_5788 = 4'h0 == enqIdx ? 1'h0 : _GEN_2; // @[LoadQueueReplay.scala 384:{30,30}]
  wire  _GEN_5789 = 4'h1 == enqIdx ? 1'h0 : _GEN_6; // @[LoadQueueReplay.scala 384:{30,30}]
  wire  _GEN_5790 = 4'h2 == enqIdx ? 1'h0 : _GEN_10; // @[LoadQueueReplay.scala 384:{30,30}]
  wire  _GEN_5791 = 4'h3 == enqIdx ? 1'h0 : _GEN_14; // @[LoadQueueReplay.scala 384:{30,30}]
  wire  _GEN_5792 = 4'h4 == enqIdx ? 1'h0 : _GEN_18; // @[LoadQueueReplay.scala 384:{30,30}]
  wire  _GEN_5793 = 4'h5 == enqIdx ? 1'h0 : _GEN_22; // @[LoadQueueReplay.scala 384:{30,30}]
  wire  _GEN_5794 = 4'h6 == enqIdx ? 1'h0 : _GEN_26; // @[LoadQueueReplay.scala 384:{30,30}]
  wire  _GEN_5795 = 4'h7 == enqIdx ? 1'h0 : _GEN_30; // @[LoadQueueReplay.scala 384:{30,30}]
  wire  _GEN_5796 = 4'h8 == enqIdx ? 1'h0 : _GEN_34; // @[LoadQueueReplay.scala 384:{30,30}]
  wire  _GEN_5797 = 4'h9 == enqIdx ? 1'h0 : _GEN_38; // @[LoadQueueReplay.scala 384:{30,30}]
  wire  _GEN_5798 = 4'ha == enqIdx ? 1'h0 : _GEN_42; // @[LoadQueueReplay.scala 384:{30,30}]
  wire  _GEN_5799 = 4'hb == enqIdx ? 1'h0 : _GEN_46; // @[LoadQueueReplay.scala 384:{30,30}]
  wire  _GEN_5800 = 4'hc == enqIdx ? 1'h0 : _GEN_50; // @[LoadQueueReplay.scala 384:{30,30}]
  wire  _GEN_5801 = 4'hd == enqIdx ? 1'h0 : _GEN_54; // @[LoadQueueReplay.scala 384:{30,30}]
  wire  _GEN_5802 = 4'he == enqIdx ? 1'h0 : _GEN_58; // @[LoadQueueReplay.scala 384:{30,30}]
  wire  _GEN_5803 = 4'hf == enqIdx ? 1'h0 : _GEN_62; // @[LoadQueueReplay.scala 384:{30,30}]
  wire  _GEN_5804 = 4'h0 == enqIdx ? 1'h0 : _blockByWaitStore_0_T_1; // @[LoadQueueReplay.scala 219:25 385:{32,32}]
  wire  _GEN_5805 = 4'h1 == enqIdx ? 1'h0 : _blockByWaitStore_1_T_1; // @[LoadQueueReplay.scala 219:25 385:{32,32}]
  wire  _GEN_5806 = 4'h2 == enqIdx ? 1'h0 : _blockByWaitStore_2_T_1; // @[LoadQueueReplay.scala 219:25 385:{32,32}]
  wire  _GEN_5807 = 4'h3 == enqIdx ? 1'h0 : _blockByWaitStore_3_T_1; // @[LoadQueueReplay.scala 219:25 385:{32,32}]
  wire  _GEN_5808 = 4'h4 == enqIdx ? 1'h0 : _blockByWaitStore_4_T_1; // @[LoadQueueReplay.scala 219:25 385:{32,32}]
  wire  _GEN_5809 = 4'h5 == enqIdx ? 1'h0 : _blockByWaitStore_5_T_1; // @[LoadQueueReplay.scala 219:25 385:{32,32}]
  wire  _GEN_5810 = 4'h6 == enqIdx ? 1'h0 : _blockByWaitStore_6_T_1; // @[LoadQueueReplay.scala 219:25 385:{32,32}]
  wire  _GEN_5811 = 4'h7 == enqIdx ? 1'h0 : _blockByWaitStore_7_T_1; // @[LoadQueueReplay.scala 219:25 385:{32,32}]
  wire  _GEN_5812 = 4'h8 == enqIdx ? 1'h0 : _blockByWaitStore_8_T_1; // @[LoadQueueReplay.scala 219:25 385:{32,32}]
  wire  _GEN_5813 = 4'h9 == enqIdx ? 1'h0 : _blockByWaitStore_9_T_1; // @[LoadQueueReplay.scala 219:25 385:{32,32}]
  wire  _GEN_5814 = 4'ha == enqIdx ? 1'h0 : _blockByWaitStore_10_T_1; // @[LoadQueueReplay.scala 219:25 385:{32,32}]
  wire  _GEN_5815 = 4'hb == enqIdx ? 1'h0 : _blockByWaitStore_11_T_1; // @[LoadQueueReplay.scala 219:25 385:{32,32}]
  wire  _GEN_5816 = 4'hc == enqIdx ? 1'h0 : _blockByWaitStore_12_T_1; // @[LoadQueueReplay.scala 219:25 385:{32,32}]
  wire  _GEN_5817 = 4'hd == enqIdx ? 1'h0 : _blockByWaitStore_13_T_1; // @[LoadQueueReplay.scala 219:25 385:{32,32}]
  wire  _GEN_5818 = 4'he == enqIdx ? 1'h0 : _blockByWaitStore_14_T_1; // @[LoadQueueReplay.scala 219:25 385:{32,32}]
  wire  _GEN_5819 = 4'hf == enqIdx ? 1'h0 : _blockByWaitStore_15_T_1; // @[LoadQueueReplay.scala 219:25 385:{32,32}]
  wire  _GEN_5820 = 4'h0 == enqIdx ? 1'h0 : _blockByForwardFail_0_T_1; // @[LoadQueueReplay.scala 218:27 386:{34,34}]
  wire  _GEN_5821 = 4'h1 == enqIdx ? 1'h0 : _blockByForwardFail_1_T_1; // @[LoadQueueReplay.scala 218:27 386:{34,34}]
  wire  _GEN_5822 = 4'h2 == enqIdx ? 1'h0 : _blockByForwardFail_2_T_1; // @[LoadQueueReplay.scala 218:27 386:{34,34}]
  wire  _GEN_5823 = 4'h3 == enqIdx ? 1'h0 : _blockByForwardFail_3_T_1; // @[LoadQueueReplay.scala 218:27 386:{34,34}]
  wire  _GEN_5824 = 4'h4 == enqIdx ? 1'h0 : _blockByForwardFail_4_T_1; // @[LoadQueueReplay.scala 218:27 386:{34,34}]
  wire  _GEN_5825 = 4'h5 == enqIdx ? 1'h0 : _blockByForwardFail_5_T_1; // @[LoadQueueReplay.scala 218:27 386:{34,34}]
  wire  _GEN_5826 = 4'h6 == enqIdx ? 1'h0 : _blockByForwardFail_6_T_1; // @[LoadQueueReplay.scala 218:27 386:{34,34}]
  wire  _GEN_5827 = 4'h7 == enqIdx ? 1'h0 : _blockByForwardFail_7_T_1; // @[LoadQueueReplay.scala 218:27 386:{34,34}]
  wire  _GEN_5828 = 4'h8 == enqIdx ? 1'h0 : _blockByForwardFail_8_T_1; // @[LoadQueueReplay.scala 218:27 386:{34,34}]
  wire  _GEN_5829 = 4'h9 == enqIdx ? 1'h0 : _blockByForwardFail_9_T_1; // @[LoadQueueReplay.scala 218:27 386:{34,34}]
  wire  _GEN_5830 = 4'ha == enqIdx ? 1'h0 : _blockByForwardFail_10_T_1; // @[LoadQueueReplay.scala 218:27 386:{34,34}]
  wire  _GEN_5831 = 4'hb == enqIdx ? 1'h0 : _blockByForwardFail_11_T_1; // @[LoadQueueReplay.scala 218:27 386:{34,34}]
  wire  _GEN_5832 = 4'hc == enqIdx ? 1'h0 : _blockByForwardFail_12_T_1; // @[LoadQueueReplay.scala 218:27 386:{34,34}]
  wire  _GEN_5833 = 4'hd == enqIdx ? 1'h0 : _blockByForwardFail_13_T_1; // @[LoadQueueReplay.scala 218:27 386:{34,34}]
  wire  _GEN_5834 = 4'he == enqIdx ? 1'h0 : _blockByForwardFail_14_T_1; // @[LoadQueueReplay.scala 218:27 386:{34,34}]
  wire  _GEN_5835 = 4'hf == enqIdx ? 1'h0 : _blockByForwardFail_15_T_1; // @[LoadQueueReplay.scala 218:27 386:{34,34}]
  wire  _GEN_5836 = 4'h0 == enqIdx ? 1'h0 : _GEN_1; // @[LoadQueueReplay.scala 387:{32,32}]
  wire  _GEN_5837 = 4'h1 == enqIdx ? 1'h0 : _GEN_5; // @[LoadQueueReplay.scala 387:{32,32}]
  wire  _GEN_5838 = 4'h2 == enqIdx ? 1'h0 : _GEN_9; // @[LoadQueueReplay.scala 387:{32,32}]
  wire  _GEN_5839 = 4'h3 == enqIdx ? 1'h0 : _GEN_13; // @[LoadQueueReplay.scala 387:{32,32}]
  wire  _GEN_5840 = 4'h4 == enqIdx ? 1'h0 : _GEN_17; // @[LoadQueueReplay.scala 387:{32,32}]
  wire  _GEN_5841 = 4'h5 == enqIdx ? 1'h0 : _GEN_21; // @[LoadQueueReplay.scala 387:{32,32}]
  wire  _GEN_5842 = 4'h6 == enqIdx ? 1'h0 : _GEN_25; // @[LoadQueueReplay.scala 387:{32,32}]
  wire  _GEN_5843 = 4'h7 == enqIdx ? 1'h0 : _GEN_29; // @[LoadQueueReplay.scala 387:{32,32}]
  wire  _GEN_5844 = 4'h8 == enqIdx ? 1'h0 : _GEN_33; // @[LoadQueueReplay.scala 387:{32,32}]
  wire  _GEN_5845 = 4'h9 == enqIdx ? 1'h0 : _GEN_37; // @[LoadQueueReplay.scala 387:{32,32}]
  wire  _GEN_5846 = 4'ha == enqIdx ? 1'h0 : _GEN_41; // @[LoadQueueReplay.scala 387:{32,32}]
  wire  _GEN_5847 = 4'hb == enqIdx ? 1'h0 : _GEN_45; // @[LoadQueueReplay.scala 387:{32,32}]
  wire  _GEN_5848 = 4'hc == enqIdx ? 1'h0 : _GEN_49; // @[LoadQueueReplay.scala 387:{32,32}]
  wire  _GEN_5849 = 4'hd == enqIdx ? 1'h0 : _GEN_53; // @[LoadQueueReplay.scala 387:{32,32}]
  wire  _GEN_5850 = 4'he == enqIdx ? 1'h0 : _GEN_57; // @[LoadQueueReplay.scala 387:{32,32}]
  wire  _GEN_5851 = 4'hf == enqIdx ? 1'h0 : _GEN_61; // @[LoadQueueReplay.scala 387:{32,32}]
  wire  _GEN_5852 = 4'h0 == enqIdx ? 1'h0 : _GEN_3; // @[LoadQueueReplay.scala 388:{29,29}]
  wire  _GEN_5853 = 4'h1 == enqIdx ? 1'h0 : _GEN_7; // @[LoadQueueReplay.scala 388:{29,29}]
  wire  _GEN_5854 = 4'h2 == enqIdx ? 1'h0 : _GEN_11; // @[LoadQueueReplay.scala 388:{29,29}]
  wire  _GEN_5855 = 4'h3 == enqIdx ? 1'h0 : _GEN_15; // @[LoadQueueReplay.scala 388:{29,29}]
  wire  _GEN_5856 = 4'h4 == enqIdx ? 1'h0 : _GEN_19; // @[LoadQueueReplay.scala 388:{29,29}]
  wire  _GEN_5857 = 4'h5 == enqIdx ? 1'h0 : _GEN_23; // @[LoadQueueReplay.scala 388:{29,29}]
  wire  _GEN_5858 = 4'h6 == enqIdx ? 1'h0 : _GEN_27; // @[LoadQueueReplay.scala 388:{29,29}]
  wire  _GEN_5859 = 4'h7 == enqIdx ? 1'h0 : _GEN_31; // @[LoadQueueReplay.scala 388:{29,29}]
  wire  _GEN_5860 = 4'h8 == enqIdx ? 1'h0 : _GEN_35; // @[LoadQueueReplay.scala 388:{29,29}]
  wire  _GEN_5861 = 4'h9 == enqIdx ? 1'h0 : _GEN_39; // @[LoadQueueReplay.scala 388:{29,29}]
  wire  _GEN_5862 = 4'ha == enqIdx ? 1'h0 : _GEN_43; // @[LoadQueueReplay.scala 388:{29,29}]
  wire  _GEN_5863 = 4'hb == enqIdx ? 1'h0 : _GEN_47; // @[LoadQueueReplay.scala 388:{29,29}]
  wire  _GEN_5864 = 4'hc == enqIdx ? 1'h0 : _GEN_51; // @[LoadQueueReplay.scala 388:{29,29}]
  wire  _GEN_5865 = 4'hd == enqIdx ? 1'h0 : _GEN_55; // @[LoadQueueReplay.scala 388:{29,29}]
  wire  _GEN_5866 = 4'he == enqIdx ? 1'h0 : _GEN_59; // @[LoadQueueReplay.scala 388:{29,29}]
  wire  _GEN_5867 = 4'hf == enqIdx ? 1'h0 : _GEN_63; // @[LoadQueueReplay.scala 388:{29,29}]
  wire  _GEN_5868 = _GEN_13308 | _GEN_5788; // @[LoadQueueReplay.scala 393:{32,32}]
  wire  _GEN_5869 = _GEN_13309 | _GEN_5789; // @[LoadQueueReplay.scala 393:{32,32}]
  wire  _GEN_5870 = _GEN_13310 | _GEN_5790; // @[LoadQueueReplay.scala 393:{32,32}]
  wire  _GEN_5871 = _GEN_13311 | _GEN_5791; // @[LoadQueueReplay.scala 393:{32,32}]
  wire  _GEN_5872 = _GEN_13312 | _GEN_5792; // @[LoadQueueReplay.scala 393:{32,32}]
  wire  _GEN_5873 = _GEN_13313 | _GEN_5793; // @[LoadQueueReplay.scala 393:{32,32}]
  wire  _GEN_5874 = _GEN_13314 | _GEN_5794; // @[LoadQueueReplay.scala 393:{32,32}]
  wire  _GEN_5875 = _GEN_13315 | _GEN_5795; // @[LoadQueueReplay.scala 393:{32,32}]
  wire  _GEN_5876 = _GEN_13316 | _GEN_5796; // @[LoadQueueReplay.scala 393:{32,32}]
  wire  _GEN_5877 = _GEN_13317 | _GEN_5797; // @[LoadQueueReplay.scala 393:{32,32}]
  wire  _GEN_5878 = _GEN_13318 | _GEN_5798; // @[LoadQueueReplay.scala 393:{32,32}]
  wire  _GEN_5879 = _GEN_13319 | _GEN_5799; // @[LoadQueueReplay.scala 393:{32,32}]
  wire  _GEN_5880 = _GEN_13320 | _GEN_5800; // @[LoadQueueReplay.scala 393:{32,32}]
  wire  _GEN_5881 = _GEN_13321 | _GEN_5801; // @[LoadQueueReplay.scala 393:{32,32}]
  wire  _GEN_5882 = _GEN_13322 | _GEN_5802; // @[LoadQueueReplay.scala 393:{32,32}]
  wire  _GEN_5883 = _GEN_13323 | _GEN_5803; // @[LoadQueueReplay.scala 393:{32,32}]
  wire  _GEN_5948 = _GEN_13308 | _GEN_5852; // @[LoadQueueReplay.scala 399:{31,31}]
  wire  _GEN_5949 = _GEN_13309 | _GEN_5853; // @[LoadQueueReplay.scala 399:{31,31}]
  wire  _GEN_5950 = _GEN_13310 | _GEN_5854; // @[LoadQueueReplay.scala 399:{31,31}]
  wire  _GEN_5951 = _GEN_13311 | _GEN_5855; // @[LoadQueueReplay.scala 399:{31,31}]
  wire  _GEN_5952 = _GEN_13312 | _GEN_5856; // @[LoadQueueReplay.scala 399:{31,31}]
  wire  _GEN_5953 = _GEN_13313 | _GEN_5857; // @[LoadQueueReplay.scala 399:{31,31}]
  wire  _GEN_5954 = _GEN_13314 | _GEN_5858; // @[LoadQueueReplay.scala 399:{31,31}]
  wire  _GEN_5955 = _GEN_13315 | _GEN_5859; // @[LoadQueueReplay.scala 399:{31,31}]
  wire  _GEN_5956 = _GEN_13316 | _GEN_5860; // @[LoadQueueReplay.scala 399:{31,31}]
  wire  _GEN_5957 = _GEN_13317 | _GEN_5861; // @[LoadQueueReplay.scala 399:{31,31}]
  wire  _GEN_5958 = _GEN_13318 | _GEN_5862; // @[LoadQueueReplay.scala 399:{31,31}]
  wire  _GEN_5959 = _GEN_13319 | _GEN_5863; // @[LoadQueueReplay.scala 399:{31,31}]
  wire  _GEN_5960 = _GEN_13320 | _GEN_5864; // @[LoadQueueReplay.scala 399:{31,31}]
  wire  _GEN_5961 = _GEN_13321 | _GEN_5865; // @[LoadQueueReplay.scala 399:{31,31}]
  wire  _GEN_5962 = _GEN_13322 | _GEN_5866; // @[LoadQueueReplay.scala 399:{31,31}]
  wire  _GEN_5963 = _GEN_13323 | _GEN_5867; // @[LoadQueueReplay.scala 399:{31,31}]
  wire  _blockPtrOthers_T = _GEN_5767 == 2'h3; // @[LoadQueueReplay.scala 400:87]
  wire  _blockPtrOthers_T_1 = _GEN_5767 == 2'h3 ? 1'h0 : 1'h1; // @[LoadQueueReplay.scala 400:63]
  wire [1:0] _GEN_13358 = {{1'd0}, _blockPtrOthers_T_1}; // @[LoadQueueReplay.scala 400:58]
  wire [1:0] _blockPtrOthers_T_3 = _GEN_5767 + _GEN_13358; // @[LoadQueueReplay.scala 400:58]
  wire [1:0] _GEN_5964 = 4'h0 == enqIdx ? _blockPtrOthers_T_3 : blockPtrOthers_0; // @[LoadQueueReplay.scala 141:31 400:{32,32}]
  wire [1:0] _GEN_5965 = 4'h1 == enqIdx ? _blockPtrOthers_T_3 : blockPtrOthers_1; // @[LoadQueueReplay.scala 141:31 400:{32,32}]
  wire [1:0] _GEN_5966 = 4'h2 == enqIdx ? _blockPtrOthers_T_3 : blockPtrOthers_2; // @[LoadQueueReplay.scala 141:31 400:{32,32}]
  wire [1:0] _GEN_5967 = 4'h3 == enqIdx ? _blockPtrOthers_T_3 : blockPtrOthers_3; // @[LoadQueueReplay.scala 141:31 400:{32,32}]
  wire [1:0] _GEN_5968 = 4'h4 == enqIdx ? _blockPtrOthers_T_3 : blockPtrOthers_4; // @[LoadQueueReplay.scala 141:31 400:{32,32}]
  wire [1:0] _GEN_5969 = 4'h5 == enqIdx ? _blockPtrOthers_T_3 : blockPtrOthers_5; // @[LoadQueueReplay.scala 141:31 400:{32,32}]
  wire [1:0] _GEN_5970 = 4'h6 == enqIdx ? _blockPtrOthers_T_3 : blockPtrOthers_6; // @[LoadQueueReplay.scala 141:31 400:{32,32}]
  wire [1:0] _GEN_5971 = 4'h7 == enqIdx ? _blockPtrOthers_T_3 : blockPtrOthers_7; // @[LoadQueueReplay.scala 141:31 400:{32,32}]
  wire [1:0] _GEN_5972 = 4'h8 == enqIdx ? _blockPtrOthers_T_3 : blockPtrOthers_8; // @[LoadQueueReplay.scala 141:31 400:{32,32}]
  wire [1:0] _GEN_5973 = 4'h9 == enqIdx ? _blockPtrOthers_T_3 : blockPtrOthers_9; // @[LoadQueueReplay.scala 141:31 400:{32,32}]
  wire [1:0] _GEN_5974 = 4'ha == enqIdx ? _blockPtrOthers_T_3 : blockPtrOthers_10; // @[LoadQueueReplay.scala 141:31 400:{32,32}]
  wire [1:0] _GEN_5975 = 4'hb == enqIdx ? _blockPtrOthers_T_3 : blockPtrOthers_11; // @[LoadQueueReplay.scala 141:31 400:{32,32}]
  wire [1:0] _GEN_5976 = 4'hc == enqIdx ? _blockPtrOthers_T_3 : blockPtrOthers_12; // @[LoadQueueReplay.scala 141:31 400:{32,32}]
  wire [1:0] _GEN_5977 = 4'hd == enqIdx ? _blockPtrOthers_T_3 : blockPtrOthers_13; // @[LoadQueueReplay.scala 141:31 400:{32,32}]
  wire [1:0] _GEN_5978 = 4'he == enqIdx ? _blockPtrOthers_T_3 : blockPtrOthers_14; // @[LoadQueueReplay.scala 141:31 400:{32,32}]
  wire [1:0] _GEN_5979 = 4'hf == enqIdx ? _blockPtrOthers_T_3 : blockPtrOthers_15; // @[LoadQueueReplay.scala 141:31 400:{32,32}]
  wire [1:0] _blockPtrOthers_T_6 = _GEN_5767 + 2'h1; // @[LoadQueueReplay.scala 403:123]
  wire [1:0] _blockPtrOthers_T_7 = _blockPtrOthers_T ? _GEN_5767 : _blockPtrOthers_T_6; // @[LoadQueueReplay.scala 403:38]
  wire [1:0] _GEN_5996 = 4'h0 == enqIdx ? _blockPtrOthers_T_7 : blockPtrOthers_0; // @[LoadQueueReplay.scala 141:31 403:{32,32}]
  wire [1:0] _GEN_5997 = 4'h1 == enqIdx ? _blockPtrOthers_T_7 : blockPtrOthers_1; // @[LoadQueueReplay.scala 141:31 403:{32,32}]
  wire [1:0] _GEN_5998 = 4'h2 == enqIdx ? _blockPtrOthers_T_7 : blockPtrOthers_2; // @[LoadQueueReplay.scala 141:31 403:{32,32}]
  wire [1:0] _GEN_5999 = 4'h3 == enqIdx ? _blockPtrOthers_T_7 : blockPtrOthers_3; // @[LoadQueueReplay.scala 141:31 403:{32,32}]
  wire [1:0] _GEN_6000 = 4'h4 == enqIdx ? _blockPtrOthers_T_7 : blockPtrOthers_4; // @[LoadQueueReplay.scala 141:31 403:{32,32}]
  wire [1:0] _GEN_6001 = 4'h5 == enqIdx ? _blockPtrOthers_T_7 : blockPtrOthers_5; // @[LoadQueueReplay.scala 141:31 403:{32,32}]
  wire [1:0] _GEN_6002 = 4'h6 == enqIdx ? _blockPtrOthers_T_7 : blockPtrOthers_6; // @[LoadQueueReplay.scala 141:31 403:{32,32}]
  wire [1:0] _GEN_6003 = 4'h7 == enqIdx ? _blockPtrOthers_T_7 : blockPtrOthers_7; // @[LoadQueueReplay.scala 141:31 403:{32,32}]
  wire [1:0] _GEN_6004 = 4'h8 == enqIdx ? _blockPtrOthers_T_7 : blockPtrOthers_8; // @[LoadQueueReplay.scala 141:31 403:{32,32}]
  wire [1:0] _GEN_6005 = 4'h9 == enqIdx ? _blockPtrOthers_T_7 : blockPtrOthers_9; // @[LoadQueueReplay.scala 141:31 403:{32,32}]
  wire [1:0] _GEN_6006 = 4'ha == enqIdx ? _blockPtrOthers_T_7 : blockPtrOthers_10; // @[LoadQueueReplay.scala 141:31 403:{32,32}]
  wire [1:0] _GEN_6007 = 4'hb == enqIdx ? _blockPtrOthers_T_7 : blockPtrOthers_11; // @[LoadQueueReplay.scala 141:31 403:{32,32}]
  wire [1:0] _GEN_6008 = 4'hc == enqIdx ? _blockPtrOthers_T_7 : blockPtrOthers_12; // @[LoadQueueReplay.scala 141:31 403:{32,32}]
  wire [1:0] _GEN_6009 = 4'hd == enqIdx ? _blockPtrOthers_T_7 : blockPtrOthers_13; // @[LoadQueueReplay.scala 141:31 403:{32,32}]
  wire [1:0] _GEN_6010 = 4'he == enqIdx ? _blockPtrOthers_T_7 : blockPtrOthers_14; // @[LoadQueueReplay.scala 141:31 403:{32,32}]
  wire [1:0] _GEN_6011 = 4'hf == enqIdx ? _blockPtrOthers_T_7 : blockPtrOthers_15; // @[LoadQueueReplay.scala 141:31 403:{32,32}]
  wire  _GEN_6012 = io_enq_0_bits_replayInfo_cause_4 | io_enq_0_bits_replayInfo_cause_2 |
    io_enq_0_bits_replayInfo_cause_3 ? _GEN_5948 : _GEN_5852; // @[LoadQueueReplay.scala 401:166]
  wire  _GEN_6013 = io_enq_0_bits_replayInfo_cause_4 | io_enq_0_bits_replayInfo_cause_2 |
    io_enq_0_bits_replayInfo_cause_3 ? _GEN_5949 : _GEN_5853; // @[LoadQueueReplay.scala 401:166]
  wire  _GEN_6014 = io_enq_0_bits_replayInfo_cause_4 | io_enq_0_bits_replayInfo_cause_2 |
    io_enq_0_bits_replayInfo_cause_3 ? _GEN_5950 : _GEN_5854; // @[LoadQueueReplay.scala 401:166]
  wire  _GEN_6015 = io_enq_0_bits_replayInfo_cause_4 | io_enq_0_bits_replayInfo_cause_2 |
    io_enq_0_bits_replayInfo_cause_3 ? _GEN_5951 : _GEN_5855; // @[LoadQueueReplay.scala 401:166]
  wire  _GEN_6016 = io_enq_0_bits_replayInfo_cause_4 | io_enq_0_bits_replayInfo_cause_2 |
    io_enq_0_bits_replayInfo_cause_3 ? _GEN_5952 : _GEN_5856; // @[LoadQueueReplay.scala 401:166]
  wire  _GEN_6017 = io_enq_0_bits_replayInfo_cause_4 | io_enq_0_bits_replayInfo_cause_2 |
    io_enq_0_bits_replayInfo_cause_3 ? _GEN_5953 : _GEN_5857; // @[LoadQueueReplay.scala 401:166]
  wire  _GEN_6018 = io_enq_0_bits_replayInfo_cause_4 | io_enq_0_bits_replayInfo_cause_2 |
    io_enq_0_bits_replayInfo_cause_3 ? _GEN_5954 : _GEN_5858; // @[LoadQueueReplay.scala 401:166]
  wire  _GEN_6019 = io_enq_0_bits_replayInfo_cause_4 | io_enq_0_bits_replayInfo_cause_2 |
    io_enq_0_bits_replayInfo_cause_3 ? _GEN_5955 : _GEN_5859; // @[LoadQueueReplay.scala 401:166]
  wire  _GEN_6020 = io_enq_0_bits_replayInfo_cause_4 | io_enq_0_bits_replayInfo_cause_2 |
    io_enq_0_bits_replayInfo_cause_3 ? _GEN_5956 : _GEN_5860; // @[LoadQueueReplay.scala 401:166]
  wire  _GEN_6021 = io_enq_0_bits_replayInfo_cause_4 | io_enq_0_bits_replayInfo_cause_2 |
    io_enq_0_bits_replayInfo_cause_3 ? _GEN_5957 : _GEN_5861; // @[LoadQueueReplay.scala 401:166]
  wire  _GEN_6022 = io_enq_0_bits_replayInfo_cause_4 | io_enq_0_bits_replayInfo_cause_2 |
    io_enq_0_bits_replayInfo_cause_3 ? _GEN_5958 : _GEN_5862; // @[LoadQueueReplay.scala 401:166]
  wire  _GEN_6023 = io_enq_0_bits_replayInfo_cause_4 | io_enq_0_bits_replayInfo_cause_2 |
    io_enq_0_bits_replayInfo_cause_3 ? _GEN_5959 : _GEN_5863; // @[LoadQueueReplay.scala 401:166]
  wire  _GEN_6024 = io_enq_0_bits_replayInfo_cause_4 | io_enq_0_bits_replayInfo_cause_2 |
    io_enq_0_bits_replayInfo_cause_3 ? _GEN_5960 : _GEN_5864; // @[LoadQueueReplay.scala 401:166]
  wire  _GEN_6025 = io_enq_0_bits_replayInfo_cause_4 | io_enq_0_bits_replayInfo_cause_2 |
    io_enq_0_bits_replayInfo_cause_3 ? _GEN_5961 : _GEN_5865; // @[LoadQueueReplay.scala 401:166]
  wire  _GEN_6026 = io_enq_0_bits_replayInfo_cause_4 | io_enq_0_bits_replayInfo_cause_2 |
    io_enq_0_bits_replayInfo_cause_3 ? _GEN_5962 : _GEN_5866; // @[LoadQueueReplay.scala 401:166]
  wire  _GEN_6027 = io_enq_0_bits_replayInfo_cause_4 | io_enq_0_bits_replayInfo_cause_2 |
    io_enq_0_bits_replayInfo_cause_3 ? _GEN_5963 : _GEN_5867; // @[LoadQueueReplay.scala 401:166]
  wire [1:0] _GEN_6028 = io_enq_0_bits_replayInfo_cause_4 | io_enq_0_bits_replayInfo_cause_2 |
    io_enq_0_bits_replayInfo_cause_3 ? _GEN_5996 : blockPtrOthers_0; // @[LoadQueueReplay.scala 401:166 141:31]
  wire [1:0] _GEN_6029 = io_enq_0_bits_replayInfo_cause_4 | io_enq_0_bits_replayInfo_cause_2 |
    io_enq_0_bits_replayInfo_cause_3 ? _GEN_5997 : blockPtrOthers_1; // @[LoadQueueReplay.scala 401:166 141:31]
  wire [1:0] _GEN_6030 = io_enq_0_bits_replayInfo_cause_4 | io_enq_0_bits_replayInfo_cause_2 |
    io_enq_0_bits_replayInfo_cause_3 ? _GEN_5998 : blockPtrOthers_2; // @[LoadQueueReplay.scala 401:166 141:31]
  wire [1:0] _GEN_6031 = io_enq_0_bits_replayInfo_cause_4 | io_enq_0_bits_replayInfo_cause_2 |
    io_enq_0_bits_replayInfo_cause_3 ? _GEN_5999 : blockPtrOthers_3; // @[LoadQueueReplay.scala 401:166 141:31]
  wire [1:0] _GEN_6032 = io_enq_0_bits_replayInfo_cause_4 | io_enq_0_bits_replayInfo_cause_2 |
    io_enq_0_bits_replayInfo_cause_3 ? _GEN_6000 : blockPtrOthers_4; // @[LoadQueueReplay.scala 401:166 141:31]
  wire [1:0] _GEN_6033 = io_enq_0_bits_replayInfo_cause_4 | io_enq_0_bits_replayInfo_cause_2 |
    io_enq_0_bits_replayInfo_cause_3 ? _GEN_6001 : blockPtrOthers_5; // @[LoadQueueReplay.scala 401:166 141:31]
  wire [1:0] _GEN_6034 = io_enq_0_bits_replayInfo_cause_4 | io_enq_0_bits_replayInfo_cause_2 |
    io_enq_0_bits_replayInfo_cause_3 ? _GEN_6002 : blockPtrOthers_6; // @[LoadQueueReplay.scala 401:166 141:31]
  wire [1:0] _GEN_6035 = io_enq_0_bits_replayInfo_cause_4 | io_enq_0_bits_replayInfo_cause_2 |
    io_enq_0_bits_replayInfo_cause_3 ? _GEN_6003 : blockPtrOthers_7; // @[LoadQueueReplay.scala 401:166 141:31]
  wire [1:0] _GEN_6036 = io_enq_0_bits_replayInfo_cause_4 | io_enq_0_bits_replayInfo_cause_2 |
    io_enq_0_bits_replayInfo_cause_3 ? _GEN_6004 : blockPtrOthers_8; // @[LoadQueueReplay.scala 401:166 141:31]
  wire [1:0] _GEN_6037 = io_enq_0_bits_replayInfo_cause_4 | io_enq_0_bits_replayInfo_cause_2 |
    io_enq_0_bits_replayInfo_cause_3 ? _GEN_6005 : blockPtrOthers_9; // @[LoadQueueReplay.scala 401:166 141:31]
  wire [1:0] _GEN_6038 = io_enq_0_bits_replayInfo_cause_4 | io_enq_0_bits_replayInfo_cause_2 |
    io_enq_0_bits_replayInfo_cause_3 ? _GEN_6006 : blockPtrOthers_10; // @[LoadQueueReplay.scala 401:166 141:31]
  wire [1:0] _GEN_6039 = io_enq_0_bits_replayInfo_cause_4 | io_enq_0_bits_replayInfo_cause_2 |
    io_enq_0_bits_replayInfo_cause_3 ? _GEN_6007 : blockPtrOthers_11; // @[LoadQueueReplay.scala 401:166 141:31]
  wire [1:0] _GEN_6040 = io_enq_0_bits_replayInfo_cause_4 | io_enq_0_bits_replayInfo_cause_2 |
    io_enq_0_bits_replayInfo_cause_3 ? _GEN_6008 : blockPtrOthers_12; // @[LoadQueueReplay.scala 401:166 141:31]
  wire [1:0] _GEN_6041 = io_enq_0_bits_replayInfo_cause_4 | io_enq_0_bits_replayInfo_cause_2 |
    io_enq_0_bits_replayInfo_cause_3 ? _GEN_6009 : blockPtrOthers_13; // @[LoadQueueReplay.scala 401:166 141:31]
  wire [1:0] _GEN_6042 = io_enq_0_bits_replayInfo_cause_4 | io_enq_0_bits_replayInfo_cause_2 |
    io_enq_0_bits_replayInfo_cause_3 ? _GEN_6010 : blockPtrOthers_14; // @[LoadQueueReplay.scala 401:166 141:31]
  wire [1:0] _GEN_6043 = io_enq_0_bits_replayInfo_cause_4 | io_enq_0_bits_replayInfo_cause_2 |
    io_enq_0_bits_replayInfo_cause_3 ? _GEN_6011 : blockPtrOthers_15; // @[LoadQueueReplay.scala 401:166 141:31]
  wire  _GEN_6044 = io_enq_0_bits_replayInfo_cause_6 | io_enq_0_bits_replayInfo_cause_1 ? _GEN_5948 : _GEN_6012; // @[LoadQueueReplay.scala 398:117]
  wire  _GEN_6045 = io_enq_0_bits_replayInfo_cause_6 | io_enq_0_bits_replayInfo_cause_1 ? _GEN_5949 : _GEN_6013; // @[LoadQueueReplay.scala 398:117]
  wire  _GEN_6046 = io_enq_0_bits_replayInfo_cause_6 | io_enq_0_bits_replayInfo_cause_1 ? _GEN_5950 : _GEN_6014; // @[LoadQueueReplay.scala 398:117]
  wire  _GEN_6047 = io_enq_0_bits_replayInfo_cause_6 | io_enq_0_bits_replayInfo_cause_1 ? _GEN_5951 : _GEN_6015; // @[LoadQueueReplay.scala 398:117]
  wire  _GEN_6048 = io_enq_0_bits_replayInfo_cause_6 | io_enq_0_bits_replayInfo_cause_1 ? _GEN_5952 : _GEN_6016; // @[LoadQueueReplay.scala 398:117]
  wire  _GEN_6049 = io_enq_0_bits_replayInfo_cause_6 | io_enq_0_bits_replayInfo_cause_1 ? _GEN_5953 : _GEN_6017; // @[LoadQueueReplay.scala 398:117]
  wire  _GEN_6050 = io_enq_0_bits_replayInfo_cause_6 | io_enq_0_bits_replayInfo_cause_1 ? _GEN_5954 : _GEN_6018; // @[LoadQueueReplay.scala 398:117]
  wire  _GEN_6051 = io_enq_0_bits_replayInfo_cause_6 | io_enq_0_bits_replayInfo_cause_1 ? _GEN_5955 : _GEN_6019; // @[LoadQueueReplay.scala 398:117]
  wire  _GEN_6052 = io_enq_0_bits_replayInfo_cause_6 | io_enq_0_bits_replayInfo_cause_1 ? _GEN_5956 : _GEN_6020; // @[LoadQueueReplay.scala 398:117]
  wire  _GEN_6053 = io_enq_0_bits_replayInfo_cause_6 | io_enq_0_bits_replayInfo_cause_1 ? _GEN_5957 : _GEN_6021; // @[LoadQueueReplay.scala 398:117]
  wire  _GEN_6054 = io_enq_0_bits_replayInfo_cause_6 | io_enq_0_bits_replayInfo_cause_1 ? _GEN_5958 : _GEN_6022; // @[LoadQueueReplay.scala 398:117]
  wire  _GEN_6055 = io_enq_0_bits_replayInfo_cause_6 | io_enq_0_bits_replayInfo_cause_1 ? _GEN_5959 : _GEN_6023; // @[LoadQueueReplay.scala 398:117]
  wire  _GEN_6056 = io_enq_0_bits_replayInfo_cause_6 | io_enq_0_bits_replayInfo_cause_1 ? _GEN_5960 : _GEN_6024; // @[LoadQueueReplay.scala 398:117]
  wire  _GEN_6057 = io_enq_0_bits_replayInfo_cause_6 | io_enq_0_bits_replayInfo_cause_1 ? _GEN_5961 : _GEN_6025; // @[LoadQueueReplay.scala 398:117]
  wire  _GEN_6058 = io_enq_0_bits_replayInfo_cause_6 | io_enq_0_bits_replayInfo_cause_1 ? _GEN_5962 : _GEN_6026; // @[LoadQueueReplay.scala 398:117]
  wire  _GEN_6059 = io_enq_0_bits_replayInfo_cause_6 | io_enq_0_bits_replayInfo_cause_1 ? _GEN_5963 : _GEN_6027; // @[LoadQueueReplay.scala 398:117]
  wire [1:0] _GEN_6060 = io_enq_0_bits_replayInfo_cause_6 | io_enq_0_bits_replayInfo_cause_1 ? _GEN_5964 : _GEN_6028; // @[LoadQueueReplay.scala 398:117]
  wire [1:0] _GEN_6061 = io_enq_0_bits_replayInfo_cause_6 | io_enq_0_bits_replayInfo_cause_1 ? _GEN_5965 : _GEN_6029; // @[LoadQueueReplay.scala 398:117]
  wire [1:0] _GEN_6062 = io_enq_0_bits_replayInfo_cause_6 | io_enq_0_bits_replayInfo_cause_1 ? _GEN_5966 : _GEN_6030; // @[LoadQueueReplay.scala 398:117]
  wire [1:0] _GEN_6063 = io_enq_0_bits_replayInfo_cause_6 | io_enq_0_bits_replayInfo_cause_1 ? _GEN_5967 : _GEN_6031; // @[LoadQueueReplay.scala 398:117]
  wire [1:0] _GEN_6064 = io_enq_0_bits_replayInfo_cause_6 | io_enq_0_bits_replayInfo_cause_1 ? _GEN_5968 : _GEN_6032; // @[LoadQueueReplay.scala 398:117]
  wire [1:0] _GEN_6065 = io_enq_0_bits_replayInfo_cause_6 | io_enq_0_bits_replayInfo_cause_1 ? _GEN_5969 : _GEN_6033; // @[LoadQueueReplay.scala 398:117]
  wire [1:0] _GEN_6066 = io_enq_0_bits_replayInfo_cause_6 | io_enq_0_bits_replayInfo_cause_1 ? _GEN_5970 : _GEN_6034; // @[LoadQueueReplay.scala 398:117]
  wire [1:0] _GEN_6067 = io_enq_0_bits_replayInfo_cause_6 | io_enq_0_bits_replayInfo_cause_1 ? _GEN_5971 : _GEN_6035; // @[LoadQueueReplay.scala 398:117]
  wire [1:0] _GEN_6068 = io_enq_0_bits_replayInfo_cause_6 | io_enq_0_bits_replayInfo_cause_1 ? _GEN_5972 : _GEN_6036; // @[LoadQueueReplay.scala 398:117]
  wire [1:0] _GEN_6069 = io_enq_0_bits_replayInfo_cause_6 | io_enq_0_bits_replayInfo_cause_1 ? _GEN_5973 : _GEN_6037; // @[LoadQueueReplay.scala 398:117]
  wire [1:0] _GEN_6070 = io_enq_0_bits_replayInfo_cause_6 | io_enq_0_bits_replayInfo_cause_1 ? _GEN_5974 : _GEN_6038; // @[LoadQueueReplay.scala 398:117]
  wire [1:0] _GEN_6071 = io_enq_0_bits_replayInfo_cause_6 | io_enq_0_bits_replayInfo_cause_1 ? _GEN_5975 : _GEN_6039; // @[LoadQueueReplay.scala 398:117]
  wire [1:0] _GEN_6072 = io_enq_0_bits_replayInfo_cause_6 | io_enq_0_bits_replayInfo_cause_1 ? _GEN_5976 : _GEN_6040; // @[LoadQueueReplay.scala 398:117]
  wire [1:0] _GEN_6073 = io_enq_0_bits_replayInfo_cause_6 | io_enq_0_bits_replayInfo_cause_1 ? _GEN_5977 : _GEN_6041; // @[LoadQueueReplay.scala 398:117]
  wire [1:0] _GEN_6074 = io_enq_0_bits_replayInfo_cause_6 | io_enq_0_bits_replayInfo_cause_1 ? _GEN_5978 : _GEN_6042; // @[LoadQueueReplay.scala 398:117]
  wire [1:0] _GEN_6075 = io_enq_0_bits_replayInfo_cause_6 | io_enq_0_bits_replayInfo_cause_1 ? _GEN_5979 : _GEN_6043; // @[LoadQueueReplay.scala 398:117]
  wire  _GEN_6092 = io_enq_0_bits_replayInfo_cause_7 ? _GEN_5852 : _GEN_6044; // @[LoadQueueReplay.scala 395:67]
  wire  _GEN_6093 = io_enq_0_bits_replayInfo_cause_7 ? _GEN_5853 : _GEN_6045; // @[LoadQueueReplay.scala 395:67]
  wire  _GEN_6094 = io_enq_0_bits_replayInfo_cause_7 ? _GEN_5854 : _GEN_6046; // @[LoadQueueReplay.scala 395:67]
  wire  _GEN_6095 = io_enq_0_bits_replayInfo_cause_7 ? _GEN_5855 : _GEN_6047; // @[LoadQueueReplay.scala 395:67]
  wire  _GEN_6096 = io_enq_0_bits_replayInfo_cause_7 ? _GEN_5856 : _GEN_6048; // @[LoadQueueReplay.scala 395:67]
  wire  _GEN_6097 = io_enq_0_bits_replayInfo_cause_7 ? _GEN_5857 : _GEN_6049; // @[LoadQueueReplay.scala 395:67]
  wire  _GEN_6098 = io_enq_0_bits_replayInfo_cause_7 ? _GEN_5858 : _GEN_6050; // @[LoadQueueReplay.scala 395:67]
  wire  _GEN_6099 = io_enq_0_bits_replayInfo_cause_7 ? _GEN_5859 : _GEN_6051; // @[LoadQueueReplay.scala 395:67]
  wire  _GEN_6100 = io_enq_0_bits_replayInfo_cause_7 ? _GEN_5860 : _GEN_6052; // @[LoadQueueReplay.scala 395:67]
  wire  _GEN_6101 = io_enq_0_bits_replayInfo_cause_7 ? _GEN_5861 : _GEN_6053; // @[LoadQueueReplay.scala 395:67]
  wire  _GEN_6102 = io_enq_0_bits_replayInfo_cause_7 ? _GEN_5862 : _GEN_6054; // @[LoadQueueReplay.scala 395:67]
  wire  _GEN_6103 = io_enq_0_bits_replayInfo_cause_7 ? _GEN_5863 : _GEN_6055; // @[LoadQueueReplay.scala 395:67]
  wire  _GEN_6104 = io_enq_0_bits_replayInfo_cause_7 ? _GEN_5864 : _GEN_6056; // @[LoadQueueReplay.scala 395:67]
  wire  _GEN_6105 = io_enq_0_bits_replayInfo_cause_7 ? _GEN_5865 : _GEN_6057; // @[LoadQueueReplay.scala 395:67]
  wire  _GEN_6106 = io_enq_0_bits_replayInfo_cause_7 ? _GEN_5866 : _GEN_6058; // @[LoadQueueReplay.scala 395:67]
  wire  _GEN_6107 = io_enq_0_bits_replayInfo_cause_7 ? _GEN_5867 : _GEN_6059; // @[LoadQueueReplay.scala 395:67]
  wire [1:0] _GEN_6108 = io_enq_0_bits_replayInfo_cause_7 ? blockPtrOthers_0 : _GEN_6060; // @[LoadQueueReplay.scala 141:31 395:67]
  wire [1:0] _GEN_6109 = io_enq_0_bits_replayInfo_cause_7 ? blockPtrOthers_1 : _GEN_6061; // @[LoadQueueReplay.scala 141:31 395:67]
  wire [1:0] _GEN_6110 = io_enq_0_bits_replayInfo_cause_7 ? blockPtrOthers_2 : _GEN_6062; // @[LoadQueueReplay.scala 141:31 395:67]
  wire [1:0] _GEN_6111 = io_enq_0_bits_replayInfo_cause_7 ? blockPtrOthers_3 : _GEN_6063; // @[LoadQueueReplay.scala 141:31 395:67]
  wire [1:0] _GEN_6112 = io_enq_0_bits_replayInfo_cause_7 ? blockPtrOthers_4 : _GEN_6064; // @[LoadQueueReplay.scala 141:31 395:67]
  wire [1:0] _GEN_6113 = io_enq_0_bits_replayInfo_cause_7 ? blockPtrOthers_5 : _GEN_6065; // @[LoadQueueReplay.scala 141:31 395:67]
  wire [1:0] _GEN_6114 = io_enq_0_bits_replayInfo_cause_7 ? blockPtrOthers_6 : _GEN_6066; // @[LoadQueueReplay.scala 141:31 395:67]
  wire [1:0] _GEN_6115 = io_enq_0_bits_replayInfo_cause_7 ? blockPtrOthers_7 : _GEN_6067; // @[LoadQueueReplay.scala 141:31 395:67]
  wire [1:0] _GEN_6116 = io_enq_0_bits_replayInfo_cause_7 ? blockPtrOthers_8 : _GEN_6068; // @[LoadQueueReplay.scala 141:31 395:67]
  wire [1:0] _GEN_6117 = io_enq_0_bits_replayInfo_cause_7 ? blockPtrOthers_9 : _GEN_6069; // @[LoadQueueReplay.scala 141:31 395:67]
  wire [1:0] _GEN_6118 = io_enq_0_bits_replayInfo_cause_7 ? blockPtrOthers_10 : _GEN_6070; // @[LoadQueueReplay.scala 141:31 395:67]
  wire [1:0] _GEN_6119 = io_enq_0_bits_replayInfo_cause_7 ? blockPtrOthers_11 : _GEN_6071; // @[LoadQueueReplay.scala 141:31 395:67]
  wire [1:0] _GEN_6120 = io_enq_0_bits_replayInfo_cause_7 ? blockPtrOthers_12 : _GEN_6072; // @[LoadQueueReplay.scala 141:31 395:67]
  wire [1:0] _GEN_6121 = io_enq_0_bits_replayInfo_cause_7 ? blockPtrOthers_13 : _GEN_6073; // @[LoadQueueReplay.scala 141:31 395:67]
  wire [1:0] _GEN_6122 = io_enq_0_bits_replayInfo_cause_7 ? blockPtrOthers_14 : _GEN_6074; // @[LoadQueueReplay.scala 141:31 395:67]
  wire [1:0] _GEN_6123 = io_enq_0_bits_replayInfo_cause_7 ? blockPtrOthers_15 : _GEN_6075; // @[LoadQueueReplay.scala 141:31 395:67]
  wire  _GEN_6124 = io_enq_0_bits_replayInfo_cause_0 ? _GEN_5868 : _GEN_5788; // @[LoadQueueReplay.scala 391:57]
  wire  _GEN_6125 = io_enq_0_bits_replayInfo_cause_0 ? _GEN_5869 : _GEN_5789; // @[LoadQueueReplay.scala 391:57]
  wire  _GEN_6126 = io_enq_0_bits_replayInfo_cause_0 ? _GEN_5870 : _GEN_5790; // @[LoadQueueReplay.scala 391:57]
  wire  _GEN_6127 = io_enq_0_bits_replayInfo_cause_0 ? _GEN_5871 : _GEN_5791; // @[LoadQueueReplay.scala 391:57]
  wire  _GEN_6128 = io_enq_0_bits_replayInfo_cause_0 ? _GEN_5872 : _GEN_5792; // @[LoadQueueReplay.scala 391:57]
  wire  _GEN_6129 = io_enq_0_bits_replayInfo_cause_0 ? _GEN_5873 : _GEN_5793; // @[LoadQueueReplay.scala 391:57]
  wire  _GEN_6130 = io_enq_0_bits_replayInfo_cause_0 ? _GEN_5874 : _GEN_5794; // @[LoadQueueReplay.scala 391:57]
  wire  _GEN_6131 = io_enq_0_bits_replayInfo_cause_0 ? _GEN_5875 : _GEN_5795; // @[LoadQueueReplay.scala 391:57]
  wire  _GEN_6132 = io_enq_0_bits_replayInfo_cause_0 ? _GEN_5876 : _GEN_5796; // @[LoadQueueReplay.scala 391:57]
  wire  _GEN_6133 = io_enq_0_bits_replayInfo_cause_0 ? _GEN_5877 : _GEN_5797; // @[LoadQueueReplay.scala 391:57]
  wire  _GEN_6134 = io_enq_0_bits_replayInfo_cause_0 ? _GEN_5878 : _GEN_5798; // @[LoadQueueReplay.scala 391:57]
  wire  _GEN_6135 = io_enq_0_bits_replayInfo_cause_0 ? _GEN_5879 : _GEN_5799; // @[LoadQueueReplay.scala 391:57]
  wire  _GEN_6136 = io_enq_0_bits_replayInfo_cause_0 ? _GEN_5880 : _GEN_5800; // @[LoadQueueReplay.scala 391:57]
  wire  _GEN_6137 = io_enq_0_bits_replayInfo_cause_0 ? _GEN_5881 : _GEN_5801; // @[LoadQueueReplay.scala 391:57]
  wire  _GEN_6138 = io_enq_0_bits_replayInfo_cause_0 ? _GEN_5882 : _GEN_5802; // @[LoadQueueReplay.scala 391:57]
  wire  _GEN_6139 = io_enq_0_bits_replayInfo_cause_0 ? _GEN_5883 : _GEN_5803; // @[LoadQueueReplay.scala 391:57]
  wire  _GEN_6172 = io_enq_0_bits_replayInfo_cause_0 ? _GEN_5852 : _GEN_6092; // @[LoadQueueReplay.scala 391:57]
  wire  _GEN_6173 = io_enq_0_bits_replayInfo_cause_0 ? _GEN_5853 : _GEN_6093; // @[LoadQueueReplay.scala 391:57]
  wire  _GEN_6174 = io_enq_0_bits_replayInfo_cause_0 ? _GEN_5854 : _GEN_6094; // @[LoadQueueReplay.scala 391:57]
  wire  _GEN_6175 = io_enq_0_bits_replayInfo_cause_0 ? _GEN_5855 : _GEN_6095; // @[LoadQueueReplay.scala 391:57]
  wire  _GEN_6176 = io_enq_0_bits_replayInfo_cause_0 ? _GEN_5856 : _GEN_6096; // @[LoadQueueReplay.scala 391:57]
  wire  _GEN_6177 = io_enq_0_bits_replayInfo_cause_0 ? _GEN_5857 : _GEN_6097; // @[LoadQueueReplay.scala 391:57]
  wire  _GEN_6178 = io_enq_0_bits_replayInfo_cause_0 ? _GEN_5858 : _GEN_6098; // @[LoadQueueReplay.scala 391:57]
  wire  _GEN_6179 = io_enq_0_bits_replayInfo_cause_0 ? _GEN_5859 : _GEN_6099; // @[LoadQueueReplay.scala 391:57]
  wire  _GEN_6180 = io_enq_0_bits_replayInfo_cause_0 ? _GEN_5860 : _GEN_6100; // @[LoadQueueReplay.scala 391:57]
  wire  _GEN_6181 = io_enq_0_bits_replayInfo_cause_0 ? _GEN_5861 : _GEN_6101; // @[LoadQueueReplay.scala 391:57]
  wire  _GEN_6182 = io_enq_0_bits_replayInfo_cause_0 ? _GEN_5862 : _GEN_6102; // @[LoadQueueReplay.scala 391:57]
  wire  _GEN_6183 = io_enq_0_bits_replayInfo_cause_0 ? _GEN_5863 : _GEN_6103; // @[LoadQueueReplay.scala 391:57]
  wire  _GEN_6184 = io_enq_0_bits_replayInfo_cause_0 ? _GEN_5864 : _GEN_6104; // @[LoadQueueReplay.scala 391:57]
  wire  _GEN_6185 = io_enq_0_bits_replayInfo_cause_0 ? _GEN_5865 : _GEN_6105; // @[LoadQueueReplay.scala 391:57]
  wire  _GEN_6186 = io_enq_0_bits_replayInfo_cause_0 ? _GEN_5866 : _GEN_6106; // @[LoadQueueReplay.scala 391:57]
  wire  _GEN_6187 = io_enq_0_bits_replayInfo_cause_0 ? _GEN_5867 : _GEN_6107; // @[LoadQueueReplay.scala 391:57]
  wire [1:0] _GEN_6188 = io_enq_0_bits_replayInfo_cause_0 ? blockPtrOthers_0 : _GEN_6108; // @[LoadQueueReplay.scala 141:31 391:57]
  wire [1:0] _GEN_6189 = io_enq_0_bits_replayInfo_cause_0 ? blockPtrOthers_1 : _GEN_6109; // @[LoadQueueReplay.scala 141:31 391:57]
  wire [1:0] _GEN_6190 = io_enq_0_bits_replayInfo_cause_0 ? blockPtrOthers_2 : _GEN_6110; // @[LoadQueueReplay.scala 141:31 391:57]
  wire [1:0] _GEN_6191 = io_enq_0_bits_replayInfo_cause_0 ? blockPtrOthers_3 : _GEN_6111; // @[LoadQueueReplay.scala 141:31 391:57]
  wire [1:0] _GEN_6192 = io_enq_0_bits_replayInfo_cause_0 ? blockPtrOthers_4 : _GEN_6112; // @[LoadQueueReplay.scala 141:31 391:57]
  wire [1:0] _GEN_6193 = io_enq_0_bits_replayInfo_cause_0 ? blockPtrOthers_5 : _GEN_6113; // @[LoadQueueReplay.scala 141:31 391:57]
  wire [1:0] _GEN_6194 = io_enq_0_bits_replayInfo_cause_0 ? blockPtrOthers_6 : _GEN_6114; // @[LoadQueueReplay.scala 141:31 391:57]
  wire [1:0] _GEN_6195 = io_enq_0_bits_replayInfo_cause_0 ? blockPtrOthers_7 : _GEN_6115; // @[LoadQueueReplay.scala 141:31 391:57]
  wire [1:0] _GEN_6196 = io_enq_0_bits_replayInfo_cause_0 ? blockPtrOthers_8 : _GEN_6116; // @[LoadQueueReplay.scala 141:31 391:57]
  wire [1:0] _GEN_6197 = io_enq_0_bits_replayInfo_cause_0 ? blockPtrOthers_9 : _GEN_6117; // @[LoadQueueReplay.scala 141:31 391:57]
  wire [1:0] _GEN_6198 = io_enq_0_bits_replayInfo_cause_0 ? blockPtrOthers_10 : _GEN_6118; // @[LoadQueueReplay.scala 141:31 391:57]
  wire [1:0] _GEN_6199 = io_enq_0_bits_replayInfo_cause_0 ? blockPtrOthers_11 : _GEN_6119; // @[LoadQueueReplay.scala 141:31 391:57]
  wire [1:0] _GEN_6200 = io_enq_0_bits_replayInfo_cause_0 ? blockPtrOthers_12 : _GEN_6120; // @[LoadQueueReplay.scala 141:31 391:57]
  wire [1:0] _GEN_6201 = io_enq_0_bits_replayInfo_cause_0 ? blockPtrOthers_13 : _GEN_6121; // @[LoadQueueReplay.scala 141:31 391:57]
  wire [1:0] _GEN_6202 = io_enq_0_bits_replayInfo_cause_0 ? blockPtrOthers_14 : _GEN_6122; // @[LoadQueueReplay.scala 141:31 391:57]
  wire [1:0] _GEN_6203 = io_enq_0_bits_replayInfo_cause_0 ? blockPtrOthers_15 : _GEN_6123; // @[LoadQueueReplay.scala 141:31 391:57]
  wire  _GEN_6204 = _GEN_13308 | _GEN_5804; // @[LoadQueueReplay.scala 408:{34,34}]
  wire  _GEN_6205 = _GEN_13309 | _GEN_5805; // @[LoadQueueReplay.scala 408:{34,34}]
  wire  _GEN_6206 = _GEN_13310 | _GEN_5806; // @[LoadQueueReplay.scala 408:{34,34}]
  wire  _GEN_6207 = _GEN_13311 | _GEN_5807; // @[LoadQueueReplay.scala 408:{34,34}]
  wire  _GEN_6208 = _GEN_13312 | _GEN_5808; // @[LoadQueueReplay.scala 408:{34,34}]
  wire  _GEN_6209 = _GEN_13313 | _GEN_5809; // @[LoadQueueReplay.scala 408:{34,34}]
  wire  _GEN_6210 = _GEN_13314 | _GEN_5810; // @[LoadQueueReplay.scala 408:{34,34}]
  wire  _GEN_6211 = _GEN_13315 | _GEN_5811; // @[LoadQueueReplay.scala 408:{34,34}]
  wire  _GEN_6212 = _GEN_13316 | _GEN_5812; // @[LoadQueueReplay.scala 408:{34,34}]
  wire  _GEN_6213 = _GEN_13317 | _GEN_5813; // @[LoadQueueReplay.scala 408:{34,34}]
  wire  _GEN_6214 = _GEN_13318 | _GEN_5814; // @[LoadQueueReplay.scala 408:{34,34}]
  wire  _GEN_6215 = _GEN_13319 | _GEN_5815; // @[LoadQueueReplay.scala 408:{34,34}]
  wire  _GEN_6216 = _GEN_13320 | _GEN_5816; // @[LoadQueueReplay.scala 408:{34,34}]
  wire  _GEN_6217 = _GEN_13321 | _GEN_5817; // @[LoadQueueReplay.scala 408:{34,34}]
  wire  _GEN_6218 = _GEN_13322 | _GEN_5818; // @[LoadQueueReplay.scala 408:{34,34}]
  wire  _GEN_6219 = _GEN_13323 | _GEN_5819; // @[LoadQueueReplay.scala 408:{34,34}]
  wire  _GEN_6220 = 4'h0 == enqIdx ? io_enq_0_bits_replayInfo_addrInvalidSqIdx_flag : blockSqIdx_0_flag; // @[LoadQueueReplay.scala 150:23 409:{28,28}]
  wire  _GEN_6221 = 4'h1 == enqIdx ? io_enq_0_bits_replayInfo_addrInvalidSqIdx_flag : blockSqIdx_1_flag; // @[LoadQueueReplay.scala 150:23 409:{28,28}]
  wire  _GEN_6222 = 4'h2 == enqIdx ? io_enq_0_bits_replayInfo_addrInvalidSqIdx_flag : blockSqIdx_2_flag; // @[LoadQueueReplay.scala 150:23 409:{28,28}]
  wire  _GEN_6223 = 4'h3 == enqIdx ? io_enq_0_bits_replayInfo_addrInvalidSqIdx_flag : blockSqIdx_3_flag; // @[LoadQueueReplay.scala 150:23 409:{28,28}]
  wire  _GEN_6224 = 4'h4 == enqIdx ? io_enq_0_bits_replayInfo_addrInvalidSqIdx_flag : blockSqIdx_4_flag; // @[LoadQueueReplay.scala 150:23 409:{28,28}]
  wire  _GEN_6225 = 4'h5 == enqIdx ? io_enq_0_bits_replayInfo_addrInvalidSqIdx_flag : blockSqIdx_5_flag; // @[LoadQueueReplay.scala 150:23 409:{28,28}]
  wire  _GEN_6226 = 4'h6 == enqIdx ? io_enq_0_bits_replayInfo_addrInvalidSqIdx_flag : blockSqIdx_6_flag; // @[LoadQueueReplay.scala 150:23 409:{28,28}]
  wire  _GEN_6227 = 4'h7 == enqIdx ? io_enq_0_bits_replayInfo_addrInvalidSqIdx_flag : blockSqIdx_7_flag; // @[LoadQueueReplay.scala 150:23 409:{28,28}]
  wire  _GEN_6228 = 4'h8 == enqIdx ? io_enq_0_bits_replayInfo_addrInvalidSqIdx_flag : blockSqIdx_8_flag; // @[LoadQueueReplay.scala 150:23 409:{28,28}]
  wire  _GEN_6229 = 4'h9 == enqIdx ? io_enq_0_bits_replayInfo_addrInvalidSqIdx_flag : blockSqIdx_9_flag; // @[LoadQueueReplay.scala 150:23 409:{28,28}]
  wire  _GEN_6230 = 4'ha == enqIdx ? io_enq_0_bits_replayInfo_addrInvalidSqIdx_flag : blockSqIdx_10_flag; // @[LoadQueueReplay.scala 150:23 409:{28,28}]
  wire  _GEN_6231 = 4'hb == enqIdx ? io_enq_0_bits_replayInfo_addrInvalidSqIdx_flag : blockSqIdx_11_flag; // @[LoadQueueReplay.scala 150:23 409:{28,28}]
  wire  _GEN_6232 = 4'hc == enqIdx ? io_enq_0_bits_replayInfo_addrInvalidSqIdx_flag : blockSqIdx_12_flag; // @[LoadQueueReplay.scala 150:23 409:{28,28}]
  wire  _GEN_6233 = 4'hd == enqIdx ? io_enq_0_bits_replayInfo_addrInvalidSqIdx_flag : blockSqIdx_13_flag; // @[LoadQueueReplay.scala 150:23 409:{28,28}]
  wire  _GEN_6234 = 4'he == enqIdx ? io_enq_0_bits_replayInfo_addrInvalidSqIdx_flag : blockSqIdx_14_flag; // @[LoadQueueReplay.scala 150:23 409:{28,28}]
  wire  _GEN_6235 = 4'hf == enqIdx ? io_enq_0_bits_replayInfo_addrInvalidSqIdx_flag : blockSqIdx_15_flag; // @[LoadQueueReplay.scala 150:23 409:{28,28}]
  wire [3:0] _GEN_6236 = 4'h0 == enqIdx ? io_enq_0_bits_replayInfo_addrInvalidSqIdx_value : blockSqIdx_0_value; // @[LoadQueueReplay.scala 150:23 409:{28,28}]
  wire [3:0] _GEN_6237 = 4'h1 == enqIdx ? io_enq_0_bits_replayInfo_addrInvalidSqIdx_value : blockSqIdx_1_value; // @[LoadQueueReplay.scala 150:23 409:{28,28}]
  wire [3:0] _GEN_6238 = 4'h2 == enqIdx ? io_enq_0_bits_replayInfo_addrInvalidSqIdx_value : blockSqIdx_2_value; // @[LoadQueueReplay.scala 150:23 409:{28,28}]
  wire [3:0] _GEN_6239 = 4'h3 == enqIdx ? io_enq_0_bits_replayInfo_addrInvalidSqIdx_value : blockSqIdx_3_value; // @[LoadQueueReplay.scala 150:23 409:{28,28}]
  wire [3:0] _GEN_6240 = 4'h4 == enqIdx ? io_enq_0_bits_replayInfo_addrInvalidSqIdx_value : blockSqIdx_4_value; // @[LoadQueueReplay.scala 150:23 409:{28,28}]
  wire [3:0] _GEN_6241 = 4'h5 == enqIdx ? io_enq_0_bits_replayInfo_addrInvalidSqIdx_value : blockSqIdx_5_value; // @[LoadQueueReplay.scala 150:23 409:{28,28}]
  wire [3:0] _GEN_6242 = 4'h6 == enqIdx ? io_enq_0_bits_replayInfo_addrInvalidSqIdx_value : blockSqIdx_6_value; // @[LoadQueueReplay.scala 150:23 409:{28,28}]
  wire [3:0] _GEN_6243 = 4'h7 == enqIdx ? io_enq_0_bits_replayInfo_addrInvalidSqIdx_value : blockSqIdx_7_value; // @[LoadQueueReplay.scala 150:23 409:{28,28}]
  wire [3:0] _GEN_6244 = 4'h8 == enqIdx ? io_enq_0_bits_replayInfo_addrInvalidSqIdx_value : blockSqIdx_8_value; // @[LoadQueueReplay.scala 150:23 409:{28,28}]
  wire [3:0] _GEN_6245 = 4'h9 == enqIdx ? io_enq_0_bits_replayInfo_addrInvalidSqIdx_value : blockSqIdx_9_value; // @[LoadQueueReplay.scala 150:23 409:{28,28}]
  wire [3:0] _GEN_6246 = 4'ha == enqIdx ? io_enq_0_bits_replayInfo_addrInvalidSqIdx_value : blockSqIdx_10_value; // @[LoadQueueReplay.scala 150:23 409:{28,28}]
  wire [3:0] _GEN_6247 = 4'hb == enqIdx ? io_enq_0_bits_replayInfo_addrInvalidSqIdx_value : blockSqIdx_11_value; // @[LoadQueueReplay.scala 150:23 409:{28,28}]
  wire [3:0] _GEN_6248 = 4'hc == enqIdx ? io_enq_0_bits_replayInfo_addrInvalidSqIdx_value : blockSqIdx_12_value; // @[LoadQueueReplay.scala 150:23 409:{28,28}]
  wire [3:0] _GEN_6249 = 4'hd == enqIdx ? io_enq_0_bits_replayInfo_addrInvalidSqIdx_value : blockSqIdx_13_value; // @[LoadQueueReplay.scala 150:23 409:{28,28}]
  wire [3:0] _GEN_6250 = 4'he == enqIdx ? io_enq_0_bits_replayInfo_addrInvalidSqIdx_value : blockSqIdx_14_value; // @[LoadQueueReplay.scala 150:23 409:{28,28}]
  wire [3:0] _GEN_6251 = 4'hf == enqIdx ? io_enq_0_bits_replayInfo_addrInvalidSqIdx_value : blockSqIdx_15_value; // @[LoadQueueReplay.scala 150:23 409:{28,28}]
  wire  _GEN_6252 = io_enq_0_bits_replayInfo_cause_1 ? _GEN_6204 : _GEN_5804; // @[LoadQueueReplay.scala 407:59]
  wire  _GEN_6253 = io_enq_0_bits_replayInfo_cause_1 ? _GEN_6205 : _GEN_5805; // @[LoadQueueReplay.scala 407:59]
  wire  _GEN_6254 = io_enq_0_bits_replayInfo_cause_1 ? _GEN_6206 : _GEN_5806; // @[LoadQueueReplay.scala 407:59]
  wire  _GEN_6255 = io_enq_0_bits_replayInfo_cause_1 ? _GEN_6207 : _GEN_5807; // @[LoadQueueReplay.scala 407:59]
  wire  _GEN_6256 = io_enq_0_bits_replayInfo_cause_1 ? _GEN_6208 : _GEN_5808; // @[LoadQueueReplay.scala 407:59]
  wire  _GEN_6257 = io_enq_0_bits_replayInfo_cause_1 ? _GEN_6209 : _GEN_5809; // @[LoadQueueReplay.scala 407:59]
  wire  _GEN_6258 = io_enq_0_bits_replayInfo_cause_1 ? _GEN_6210 : _GEN_5810; // @[LoadQueueReplay.scala 407:59]
  wire  _GEN_6259 = io_enq_0_bits_replayInfo_cause_1 ? _GEN_6211 : _GEN_5811; // @[LoadQueueReplay.scala 407:59]
  wire  _GEN_6260 = io_enq_0_bits_replayInfo_cause_1 ? _GEN_6212 : _GEN_5812; // @[LoadQueueReplay.scala 407:59]
  wire  _GEN_6261 = io_enq_0_bits_replayInfo_cause_1 ? _GEN_6213 : _GEN_5813; // @[LoadQueueReplay.scala 407:59]
  wire  _GEN_6262 = io_enq_0_bits_replayInfo_cause_1 ? _GEN_6214 : _GEN_5814; // @[LoadQueueReplay.scala 407:59]
  wire  _GEN_6263 = io_enq_0_bits_replayInfo_cause_1 ? _GEN_6215 : _GEN_5815; // @[LoadQueueReplay.scala 407:59]
  wire  _GEN_6264 = io_enq_0_bits_replayInfo_cause_1 ? _GEN_6216 : _GEN_5816; // @[LoadQueueReplay.scala 407:59]
  wire  _GEN_6265 = io_enq_0_bits_replayInfo_cause_1 ? _GEN_6217 : _GEN_5817; // @[LoadQueueReplay.scala 407:59]
  wire  _GEN_6266 = io_enq_0_bits_replayInfo_cause_1 ? _GEN_6218 : _GEN_5818; // @[LoadQueueReplay.scala 407:59]
  wire  _GEN_6267 = io_enq_0_bits_replayInfo_cause_1 ? _GEN_6219 : _GEN_5819; // @[LoadQueueReplay.scala 407:59]
  wire  _GEN_6268 = io_enq_0_bits_replayInfo_cause_1 ? _GEN_6220 : blockSqIdx_0_flag; // @[LoadQueueReplay.scala 150:23 407:59]
  wire  _GEN_6269 = io_enq_0_bits_replayInfo_cause_1 ? _GEN_6221 : blockSqIdx_1_flag; // @[LoadQueueReplay.scala 150:23 407:59]
  wire  _GEN_6270 = io_enq_0_bits_replayInfo_cause_1 ? _GEN_6222 : blockSqIdx_2_flag; // @[LoadQueueReplay.scala 150:23 407:59]
  wire  _GEN_6271 = io_enq_0_bits_replayInfo_cause_1 ? _GEN_6223 : blockSqIdx_3_flag; // @[LoadQueueReplay.scala 150:23 407:59]
  wire  _GEN_6272 = io_enq_0_bits_replayInfo_cause_1 ? _GEN_6224 : blockSqIdx_4_flag; // @[LoadQueueReplay.scala 150:23 407:59]
  wire  _GEN_6273 = io_enq_0_bits_replayInfo_cause_1 ? _GEN_6225 : blockSqIdx_5_flag; // @[LoadQueueReplay.scala 150:23 407:59]
  wire  _GEN_6274 = io_enq_0_bits_replayInfo_cause_1 ? _GEN_6226 : blockSqIdx_6_flag; // @[LoadQueueReplay.scala 150:23 407:59]
  wire  _GEN_6275 = io_enq_0_bits_replayInfo_cause_1 ? _GEN_6227 : blockSqIdx_7_flag; // @[LoadQueueReplay.scala 150:23 407:59]
  wire  _GEN_6276 = io_enq_0_bits_replayInfo_cause_1 ? _GEN_6228 : blockSqIdx_8_flag; // @[LoadQueueReplay.scala 150:23 407:59]
  wire  _GEN_6277 = io_enq_0_bits_replayInfo_cause_1 ? _GEN_6229 : blockSqIdx_9_flag; // @[LoadQueueReplay.scala 150:23 407:59]
  wire  _GEN_6278 = io_enq_0_bits_replayInfo_cause_1 ? _GEN_6230 : blockSqIdx_10_flag; // @[LoadQueueReplay.scala 150:23 407:59]
  wire  _GEN_6279 = io_enq_0_bits_replayInfo_cause_1 ? _GEN_6231 : blockSqIdx_11_flag; // @[LoadQueueReplay.scala 150:23 407:59]
  wire  _GEN_6280 = io_enq_0_bits_replayInfo_cause_1 ? _GEN_6232 : blockSqIdx_12_flag; // @[LoadQueueReplay.scala 150:23 407:59]
  wire  _GEN_6281 = io_enq_0_bits_replayInfo_cause_1 ? _GEN_6233 : blockSqIdx_13_flag; // @[LoadQueueReplay.scala 150:23 407:59]
  wire  _GEN_6282 = io_enq_0_bits_replayInfo_cause_1 ? _GEN_6234 : blockSqIdx_14_flag; // @[LoadQueueReplay.scala 150:23 407:59]
  wire  _GEN_6283 = io_enq_0_bits_replayInfo_cause_1 ? _GEN_6235 : blockSqIdx_15_flag; // @[LoadQueueReplay.scala 150:23 407:59]
  wire [3:0] _GEN_6284 = io_enq_0_bits_replayInfo_cause_1 ? _GEN_6236 : blockSqIdx_0_value; // @[LoadQueueReplay.scala 150:23 407:59]
  wire [3:0] _GEN_6285 = io_enq_0_bits_replayInfo_cause_1 ? _GEN_6237 : blockSqIdx_1_value; // @[LoadQueueReplay.scala 150:23 407:59]
  wire [3:0] _GEN_6286 = io_enq_0_bits_replayInfo_cause_1 ? _GEN_6238 : blockSqIdx_2_value; // @[LoadQueueReplay.scala 150:23 407:59]
  wire [3:0] _GEN_6287 = io_enq_0_bits_replayInfo_cause_1 ? _GEN_6239 : blockSqIdx_3_value; // @[LoadQueueReplay.scala 150:23 407:59]
  wire [3:0] _GEN_6288 = io_enq_0_bits_replayInfo_cause_1 ? _GEN_6240 : blockSqIdx_4_value; // @[LoadQueueReplay.scala 150:23 407:59]
  wire [3:0] _GEN_6289 = io_enq_0_bits_replayInfo_cause_1 ? _GEN_6241 : blockSqIdx_5_value; // @[LoadQueueReplay.scala 150:23 407:59]
  wire [3:0] _GEN_6290 = io_enq_0_bits_replayInfo_cause_1 ? _GEN_6242 : blockSqIdx_6_value; // @[LoadQueueReplay.scala 150:23 407:59]
  wire [3:0] _GEN_6291 = io_enq_0_bits_replayInfo_cause_1 ? _GEN_6243 : blockSqIdx_7_value; // @[LoadQueueReplay.scala 150:23 407:59]
  wire [3:0] _GEN_6292 = io_enq_0_bits_replayInfo_cause_1 ? _GEN_6244 : blockSqIdx_8_value; // @[LoadQueueReplay.scala 150:23 407:59]
  wire [3:0] _GEN_6293 = io_enq_0_bits_replayInfo_cause_1 ? _GEN_6245 : blockSqIdx_9_value; // @[LoadQueueReplay.scala 150:23 407:59]
  wire [3:0] _GEN_6294 = io_enq_0_bits_replayInfo_cause_1 ? _GEN_6246 : blockSqIdx_10_value; // @[LoadQueueReplay.scala 150:23 407:59]
  wire [3:0] _GEN_6295 = io_enq_0_bits_replayInfo_cause_1 ? _GEN_6247 : blockSqIdx_11_value; // @[LoadQueueReplay.scala 150:23 407:59]
  wire [3:0] _GEN_6296 = io_enq_0_bits_replayInfo_cause_1 ? _GEN_6248 : blockSqIdx_12_value; // @[LoadQueueReplay.scala 150:23 407:59]
  wire [3:0] _GEN_6297 = io_enq_0_bits_replayInfo_cause_1 ? _GEN_6249 : blockSqIdx_13_value; // @[LoadQueueReplay.scala 150:23 407:59]
  wire [3:0] _GEN_6298 = io_enq_0_bits_replayInfo_cause_1 ? _GEN_6250 : blockSqIdx_14_value; // @[LoadQueueReplay.scala 150:23 407:59]
  wire [3:0] _GEN_6299 = io_enq_0_bits_replayInfo_cause_1 ? _GEN_6251 : blockSqIdx_15_value; // @[LoadQueueReplay.scala 150:23 407:59]
  wire  _GEN_6300 = _GEN_13308 | _GEN_5820; // @[LoadQueueReplay.scala 414:{36,36}]
  wire  _GEN_6301 = _GEN_13309 | _GEN_5821; // @[LoadQueueReplay.scala 414:{36,36}]
  wire  _GEN_6302 = _GEN_13310 | _GEN_5822; // @[LoadQueueReplay.scala 414:{36,36}]
  wire  _GEN_6303 = _GEN_13311 | _GEN_5823; // @[LoadQueueReplay.scala 414:{36,36}]
  wire  _GEN_6304 = _GEN_13312 | _GEN_5824; // @[LoadQueueReplay.scala 414:{36,36}]
  wire  _GEN_6305 = _GEN_13313 | _GEN_5825; // @[LoadQueueReplay.scala 414:{36,36}]
  wire  _GEN_6306 = _GEN_13314 | _GEN_5826; // @[LoadQueueReplay.scala 414:{36,36}]
  wire  _GEN_6307 = _GEN_13315 | _GEN_5827; // @[LoadQueueReplay.scala 414:{36,36}]
  wire  _GEN_6308 = _GEN_13316 | _GEN_5828; // @[LoadQueueReplay.scala 414:{36,36}]
  wire  _GEN_6309 = _GEN_13317 | _GEN_5829; // @[LoadQueueReplay.scala 414:{36,36}]
  wire  _GEN_6310 = _GEN_13318 | _GEN_5830; // @[LoadQueueReplay.scala 414:{36,36}]
  wire  _GEN_6311 = _GEN_13319 | _GEN_5831; // @[LoadQueueReplay.scala 414:{36,36}]
  wire  _GEN_6312 = _GEN_13320 | _GEN_5832; // @[LoadQueueReplay.scala 414:{36,36}]
  wire  _GEN_6313 = _GEN_13321 | _GEN_5833; // @[LoadQueueReplay.scala 414:{36,36}]
  wire  _GEN_6314 = _GEN_13322 | _GEN_5834; // @[LoadQueueReplay.scala 414:{36,36}]
  wire  _GEN_6315 = _GEN_13323 | _GEN_5835; // @[LoadQueueReplay.scala 414:{36,36}]
  wire  _GEN_6316 = 4'h0 == enqIdx ? io_enq_0_bits_replayInfo_dataInvalidSqIdx_flag : _GEN_6268; // @[LoadQueueReplay.scala 415:{28,28}]
  wire  _GEN_6317 = 4'h1 == enqIdx ? io_enq_0_bits_replayInfo_dataInvalidSqIdx_flag : _GEN_6269; // @[LoadQueueReplay.scala 415:{28,28}]
  wire  _GEN_6318 = 4'h2 == enqIdx ? io_enq_0_bits_replayInfo_dataInvalidSqIdx_flag : _GEN_6270; // @[LoadQueueReplay.scala 415:{28,28}]
  wire  _GEN_6319 = 4'h3 == enqIdx ? io_enq_0_bits_replayInfo_dataInvalidSqIdx_flag : _GEN_6271; // @[LoadQueueReplay.scala 415:{28,28}]
  wire  _GEN_6320 = 4'h4 == enqIdx ? io_enq_0_bits_replayInfo_dataInvalidSqIdx_flag : _GEN_6272; // @[LoadQueueReplay.scala 415:{28,28}]
  wire  _GEN_6321 = 4'h5 == enqIdx ? io_enq_0_bits_replayInfo_dataInvalidSqIdx_flag : _GEN_6273; // @[LoadQueueReplay.scala 415:{28,28}]
  wire  _GEN_6322 = 4'h6 == enqIdx ? io_enq_0_bits_replayInfo_dataInvalidSqIdx_flag : _GEN_6274; // @[LoadQueueReplay.scala 415:{28,28}]
  wire  _GEN_6323 = 4'h7 == enqIdx ? io_enq_0_bits_replayInfo_dataInvalidSqIdx_flag : _GEN_6275; // @[LoadQueueReplay.scala 415:{28,28}]
  wire  _GEN_6324 = 4'h8 == enqIdx ? io_enq_0_bits_replayInfo_dataInvalidSqIdx_flag : _GEN_6276; // @[LoadQueueReplay.scala 415:{28,28}]
  wire  _GEN_6325 = 4'h9 == enqIdx ? io_enq_0_bits_replayInfo_dataInvalidSqIdx_flag : _GEN_6277; // @[LoadQueueReplay.scala 415:{28,28}]
  wire  _GEN_6326 = 4'ha == enqIdx ? io_enq_0_bits_replayInfo_dataInvalidSqIdx_flag : _GEN_6278; // @[LoadQueueReplay.scala 415:{28,28}]
  wire  _GEN_6327 = 4'hb == enqIdx ? io_enq_0_bits_replayInfo_dataInvalidSqIdx_flag : _GEN_6279; // @[LoadQueueReplay.scala 415:{28,28}]
  wire  _GEN_6328 = 4'hc == enqIdx ? io_enq_0_bits_replayInfo_dataInvalidSqIdx_flag : _GEN_6280; // @[LoadQueueReplay.scala 415:{28,28}]
  wire  _GEN_6329 = 4'hd == enqIdx ? io_enq_0_bits_replayInfo_dataInvalidSqIdx_flag : _GEN_6281; // @[LoadQueueReplay.scala 415:{28,28}]
  wire  _GEN_6330 = 4'he == enqIdx ? io_enq_0_bits_replayInfo_dataInvalidSqIdx_flag : _GEN_6282; // @[LoadQueueReplay.scala 415:{28,28}]
  wire  _GEN_6331 = 4'hf == enqIdx ? io_enq_0_bits_replayInfo_dataInvalidSqIdx_flag : _GEN_6283; // @[LoadQueueReplay.scala 415:{28,28}]
  wire [3:0] _GEN_6332 = 4'h0 == enqIdx ? io_enq_0_bits_replayInfo_dataInvalidSqIdx_value : _GEN_6284; // @[LoadQueueReplay.scala 415:{28,28}]
  wire [3:0] _GEN_6333 = 4'h1 == enqIdx ? io_enq_0_bits_replayInfo_dataInvalidSqIdx_value : _GEN_6285; // @[LoadQueueReplay.scala 415:{28,28}]
  wire [3:0] _GEN_6334 = 4'h2 == enqIdx ? io_enq_0_bits_replayInfo_dataInvalidSqIdx_value : _GEN_6286; // @[LoadQueueReplay.scala 415:{28,28}]
  wire [3:0] _GEN_6335 = 4'h3 == enqIdx ? io_enq_0_bits_replayInfo_dataInvalidSqIdx_value : _GEN_6287; // @[LoadQueueReplay.scala 415:{28,28}]
  wire [3:0] _GEN_6336 = 4'h4 == enqIdx ? io_enq_0_bits_replayInfo_dataInvalidSqIdx_value : _GEN_6288; // @[LoadQueueReplay.scala 415:{28,28}]
  wire [3:0] _GEN_6337 = 4'h5 == enqIdx ? io_enq_0_bits_replayInfo_dataInvalidSqIdx_value : _GEN_6289; // @[LoadQueueReplay.scala 415:{28,28}]
  wire [3:0] _GEN_6338 = 4'h6 == enqIdx ? io_enq_0_bits_replayInfo_dataInvalidSqIdx_value : _GEN_6290; // @[LoadQueueReplay.scala 415:{28,28}]
  wire [3:0] _GEN_6339 = 4'h7 == enqIdx ? io_enq_0_bits_replayInfo_dataInvalidSqIdx_value : _GEN_6291; // @[LoadQueueReplay.scala 415:{28,28}]
  wire [3:0] _GEN_6340 = 4'h8 == enqIdx ? io_enq_0_bits_replayInfo_dataInvalidSqIdx_value : _GEN_6292; // @[LoadQueueReplay.scala 415:{28,28}]
  wire [3:0] _GEN_6341 = 4'h9 == enqIdx ? io_enq_0_bits_replayInfo_dataInvalidSqIdx_value : _GEN_6293; // @[LoadQueueReplay.scala 415:{28,28}]
  wire [3:0] _GEN_6342 = 4'ha == enqIdx ? io_enq_0_bits_replayInfo_dataInvalidSqIdx_value : _GEN_6294; // @[LoadQueueReplay.scala 415:{28,28}]
  wire [3:0] _GEN_6343 = 4'hb == enqIdx ? io_enq_0_bits_replayInfo_dataInvalidSqIdx_value : _GEN_6295; // @[LoadQueueReplay.scala 415:{28,28}]
  wire [3:0] _GEN_6344 = 4'hc == enqIdx ? io_enq_0_bits_replayInfo_dataInvalidSqIdx_value : _GEN_6296; // @[LoadQueueReplay.scala 415:{28,28}]
  wire [3:0] _GEN_6345 = 4'hd == enqIdx ? io_enq_0_bits_replayInfo_dataInvalidSqIdx_value : _GEN_6297; // @[LoadQueueReplay.scala 415:{28,28}]
  wire [3:0] _GEN_6346 = 4'he == enqIdx ? io_enq_0_bits_replayInfo_dataInvalidSqIdx_value : _GEN_6298; // @[LoadQueueReplay.scala 415:{28,28}]
  wire [3:0] _GEN_6347 = 4'hf == enqIdx ? io_enq_0_bits_replayInfo_dataInvalidSqIdx_value : _GEN_6299; // @[LoadQueueReplay.scala 415:{28,28}]
  wire  _GEN_6348 = io_enq_0_bits_replayInfo_cause_5 ? _GEN_6300 : _GEN_5820; // @[LoadQueueReplay.scala 413:61]
  wire  _GEN_6349 = io_enq_0_bits_replayInfo_cause_5 ? _GEN_6301 : _GEN_5821; // @[LoadQueueReplay.scala 413:61]
  wire  _GEN_6350 = io_enq_0_bits_replayInfo_cause_5 ? _GEN_6302 : _GEN_5822; // @[LoadQueueReplay.scala 413:61]
  wire  _GEN_6351 = io_enq_0_bits_replayInfo_cause_5 ? _GEN_6303 : _GEN_5823; // @[LoadQueueReplay.scala 413:61]
  wire  _GEN_6352 = io_enq_0_bits_replayInfo_cause_5 ? _GEN_6304 : _GEN_5824; // @[LoadQueueReplay.scala 413:61]
  wire  _GEN_6353 = io_enq_0_bits_replayInfo_cause_5 ? _GEN_6305 : _GEN_5825; // @[LoadQueueReplay.scala 413:61]
  wire  _GEN_6354 = io_enq_0_bits_replayInfo_cause_5 ? _GEN_6306 : _GEN_5826; // @[LoadQueueReplay.scala 413:61]
  wire  _GEN_6355 = io_enq_0_bits_replayInfo_cause_5 ? _GEN_6307 : _GEN_5827; // @[LoadQueueReplay.scala 413:61]
  wire  _GEN_6356 = io_enq_0_bits_replayInfo_cause_5 ? _GEN_6308 : _GEN_5828; // @[LoadQueueReplay.scala 413:61]
  wire  _GEN_6357 = io_enq_0_bits_replayInfo_cause_5 ? _GEN_6309 : _GEN_5829; // @[LoadQueueReplay.scala 413:61]
  wire  _GEN_6358 = io_enq_0_bits_replayInfo_cause_5 ? _GEN_6310 : _GEN_5830; // @[LoadQueueReplay.scala 413:61]
  wire  _GEN_6359 = io_enq_0_bits_replayInfo_cause_5 ? _GEN_6311 : _GEN_5831; // @[LoadQueueReplay.scala 413:61]
  wire  _GEN_6360 = io_enq_0_bits_replayInfo_cause_5 ? _GEN_6312 : _GEN_5832; // @[LoadQueueReplay.scala 413:61]
  wire  _GEN_6361 = io_enq_0_bits_replayInfo_cause_5 ? _GEN_6313 : _GEN_5833; // @[LoadQueueReplay.scala 413:61]
  wire  _GEN_6362 = io_enq_0_bits_replayInfo_cause_5 ? _GEN_6314 : _GEN_5834; // @[LoadQueueReplay.scala 413:61]
  wire  _GEN_6363 = io_enq_0_bits_replayInfo_cause_5 ? _GEN_6315 : _GEN_5835; // @[LoadQueueReplay.scala 413:61]
  wire  _GEN_6364 = io_enq_0_bits_replayInfo_cause_5 ? _GEN_6316 : _GEN_6268; // @[LoadQueueReplay.scala 413:61]
  wire  _GEN_6365 = io_enq_0_bits_replayInfo_cause_5 ? _GEN_6317 : _GEN_6269; // @[LoadQueueReplay.scala 413:61]
  wire  _GEN_6366 = io_enq_0_bits_replayInfo_cause_5 ? _GEN_6318 : _GEN_6270; // @[LoadQueueReplay.scala 413:61]
  wire  _GEN_6367 = io_enq_0_bits_replayInfo_cause_5 ? _GEN_6319 : _GEN_6271; // @[LoadQueueReplay.scala 413:61]
  wire  _GEN_6368 = io_enq_0_bits_replayInfo_cause_5 ? _GEN_6320 : _GEN_6272; // @[LoadQueueReplay.scala 413:61]
  wire  _GEN_6369 = io_enq_0_bits_replayInfo_cause_5 ? _GEN_6321 : _GEN_6273; // @[LoadQueueReplay.scala 413:61]
  wire  _GEN_6370 = io_enq_0_bits_replayInfo_cause_5 ? _GEN_6322 : _GEN_6274; // @[LoadQueueReplay.scala 413:61]
  wire  _GEN_6371 = io_enq_0_bits_replayInfo_cause_5 ? _GEN_6323 : _GEN_6275; // @[LoadQueueReplay.scala 413:61]
  wire  _GEN_6372 = io_enq_0_bits_replayInfo_cause_5 ? _GEN_6324 : _GEN_6276; // @[LoadQueueReplay.scala 413:61]
  wire  _GEN_6373 = io_enq_0_bits_replayInfo_cause_5 ? _GEN_6325 : _GEN_6277; // @[LoadQueueReplay.scala 413:61]
  wire  _GEN_6374 = io_enq_0_bits_replayInfo_cause_5 ? _GEN_6326 : _GEN_6278; // @[LoadQueueReplay.scala 413:61]
  wire  _GEN_6375 = io_enq_0_bits_replayInfo_cause_5 ? _GEN_6327 : _GEN_6279; // @[LoadQueueReplay.scala 413:61]
  wire  _GEN_6376 = io_enq_0_bits_replayInfo_cause_5 ? _GEN_6328 : _GEN_6280; // @[LoadQueueReplay.scala 413:61]
  wire  _GEN_6377 = io_enq_0_bits_replayInfo_cause_5 ? _GEN_6329 : _GEN_6281; // @[LoadQueueReplay.scala 413:61]
  wire  _GEN_6378 = io_enq_0_bits_replayInfo_cause_5 ? _GEN_6330 : _GEN_6282; // @[LoadQueueReplay.scala 413:61]
  wire  _GEN_6379 = io_enq_0_bits_replayInfo_cause_5 ? _GEN_6331 : _GEN_6283; // @[LoadQueueReplay.scala 413:61]
  wire [3:0] _GEN_6380 = io_enq_0_bits_replayInfo_cause_5 ? _GEN_6332 : _GEN_6284; // @[LoadQueueReplay.scala 413:61]
  wire [3:0] _GEN_6381 = io_enq_0_bits_replayInfo_cause_5 ? _GEN_6333 : _GEN_6285; // @[LoadQueueReplay.scala 413:61]
  wire [3:0] _GEN_6382 = io_enq_0_bits_replayInfo_cause_5 ? _GEN_6334 : _GEN_6286; // @[LoadQueueReplay.scala 413:61]
  wire [3:0] _GEN_6383 = io_enq_0_bits_replayInfo_cause_5 ? _GEN_6335 : _GEN_6287; // @[LoadQueueReplay.scala 413:61]
  wire [3:0] _GEN_6384 = io_enq_0_bits_replayInfo_cause_5 ? _GEN_6336 : _GEN_6288; // @[LoadQueueReplay.scala 413:61]
  wire [3:0] _GEN_6385 = io_enq_0_bits_replayInfo_cause_5 ? _GEN_6337 : _GEN_6289; // @[LoadQueueReplay.scala 413:61]
  wire [3:0] _GEN_6386 = io_enq_0_bits_replayInfo_cause_5 ? _GEN_6338 : _GEN_6290; // @[LoadQueueReplay.scala 413:61]
  wire [3:0] _GEN_6387 = io_enq_0_bits_replayInfo_cause_5 ? _GEN_6339 : _GEN_6291; // @[LoadQueueReplay.scala 413:61]
  wire [3:0] _GEN_6388 = io_enq_0_bits_replayInfo_cause_5 ? _GEN_6340 : _GEN_6292; // @[LoadQueueReplay.scala 413:61]
  wire [3:0] _GEN_6389 = io_enq_0_bits_replayInfo_cause_5 ? _GEN_6341 : _GEN_6293; // @[LoadQueueReplay.scala 413:61]
  wire [3:0] _GEN_6390 = io_enq_0_bits_replayInfo_cause_5 ? _GEN_6342 : _GEN_6294; // @[LoadQueueReplay.scala 413:61]
  wire [3:0] _GEN_6391 = io_enq_0_bits_replayInfo_cause_5 ? _GEN_6343 : _GEN_6295; // @[LoadQueueReplay.scala 413:61]
  wire [3:0] _GEN_6392 = io_enq_0_bits_replayInfo_cause_5 ? _GEN_6344 : _GEN_6296; // @[LoadQueueReplay.scala 413:61]
  wire [3:0] _GEN_6393 = io_enq_0_bits_replayInfo_cause_5 ? _GEN_6345 : _GEN_6297; // @[LoadQueueReplay.scala 413:61]
  wire [3:0] _GEN_6394 = io_enq_0_bits_replayInfo_cause_5 ? _GEN_6346 : _GEN_6298; // @[LoadQueueReplay.scala 413:61]
  wire [3:0] _GEN_6395 = io_enq_0_bits_replayInfo_cause_5 ? _GEN_6347 : _GEN_6299; // @[LoadQueueReplay.scala 413:61]
  wire [7:0] _GEN_6396 = 4'h0 == enqIdx ? io_enq_0_bits_replayInfo_replayCarry_real_way_en :
    replayCarryReg_0_real_way_en; // @[LoadQueueReplay.scala 419:{30,30} 164:31]
  wire [7:0] _GEN_6397 = 4'h1 == enqIdx ? io_enq_0_bits_replayInfo_replayCarry_real_way_en :
    replayCarryReg_1_real_way_en; // @[LoadQueueReplay.scala 419:{30,30} 164:31]
  wire [7:0] _GEN_6398 = 4'h2 == enqIdx ? io_enq_0_bits_replayInfo_replayCarry_real_way_en :
    replayCarryReg_2_real_way_en; // @[LoadQueueReplay.scala 419:{30,30} 164:31]
  wire [7:0] _GEN_6399 = 4'h3 == enqIdx ? io_enq_0_bits_replayInfo_replayCarry_real_way_en :
    replayCarryReg_3_real_way_en; // @[LoadQueueReplay.scala 419:{30,30} 164:31]
  wire [7:0] _GEN_6400 = 4'h4 == enqIdx ? io_enq_0_bits_replayInfo_replayCarry_real_way_en :
    replayCarryReg_4_real_way_en; // @[LoadQueueReplay.scala 419:{30,30} 164:31]
  wire [7:0] _GEN_6401 = 4'h5 == enqIdx ? io_enq_0_bits_replayInfo_replayCarry_real_way_en :
    replayCarryReg_5_real_way_en; // @[LoadQueueReplay.scala 419:{30,30} 164:31]
  wire [7:0] _GEN_6402 = 4'h6 == enqIdx ? io_enq_0_bits_replayInfo_replayCarry_real_way_en :
    replayCarryReg_6_real_way_en; // @[LoadQueueReplay.scala 419:{30,30} 164:31]
  wire [7:0] _GEN_6403 = 4'h7 == enqIdx ? io_enq_0_bits_replayInfo_replayCarry_real_way_en :
    replayCarryReg_7_real_way_en; // @[LoadQueueReplay.scala 419:{30,30} 164:31]
  wire [7:0] _GEN_6404 = 4'h8 == enqIdx ? io_enq_0_bits_replayInfo_replayCarry_real_way_en :
    replayCarryReg_8_real_way_en; // @[LoadQueueReplay.scala 419:{30,30} 164:31]
  wire [7:0] _GEN_6405 = 4'h9 == enqIdx ? io_enq_0_bits_replayInfo_replayCarry_real_way_en :
    replayCarryReg_9_real_way_en; // @[LoadQueueReplay.scala 419:{30,30} 164:31]
  wire [7:0] _GEN_6406 = 4'ha == enqIdx ? io_enq_0_bits_replayInfo_replayCarry_real_way_en :
    replayCarryReg_10_real_way_en; // @[LoadQueueReplay.scala 419:{30,30} 164:31]
  wire [7:0] _GEN_6407 = 4'hb == enqIdx ? io_enq_0_bits_replayInfo_replayCarry_real_way_en :
    replayCarryReg_11_real_way_en; // @[LoadQueueReplay.scala 419:{30,30} 164:31]
  wire [7:0] _GEN_6408 = 4'hc == enqIdx ? io_enq_0_bits_replayInfo_replayCarry_real_way_en :
    replayCarryReg_12_real_way_en; // @[LoadQueueReplay.scala 419:{30,30} 164:31]
  wire [7:0] _GEN_6409 = 4'hd == enqIdx ? io_enq_0_bits_replayInfo_replayCarry_real_way_en :
    replayCarryReg_13_real_way_en; // @[LoadQueueReplay.scala 419:{30,30} 164:31]
  wire [7:0] _GEN_6410 = 4'he == enqIdx ? io_enq_0_bits_replayInfo_replayCarry_real_way_en :
    replayCarryReg_14_real_way_en; // @[LoadQueueReplay.scala 419:{30,30} 164:31]
  wire [7:0] _GEN_6411 = 4'hf == enqIdx ? io_enq_0_bits_replayInfo_replayCarry_real_way_en :
    replayCarryReg_15_real_way_en; // @[LoadQueueReplay.scala 419:{30,30} 164:31]
  wire  _GEN_6412 = 4'h0 == enqIdx ? io_enq_0_bits_replayInfo_replayCarry_valid : replayCarryReg_0_valid; // @[LoadQueueReplay.scala 419:{30,30} 164:31]
  wire  _GEN_6413 = 4'h1 == enqIdx ? io_enq_0_bits_replayInfo_replayCarry_valid : replayCarryReg_1_valid; // @[LoadQueueReplay.scala 419:{30,30} 164:31]
  wire  _GEN_6414 = 4'h2 == enqIdx ? io_enq_0_bits_replayInfo_replayCarry_valid : replayCarryReg_2_valid; // @[LoadQueueReplay.scala 419:{30,30} 164:31]
  wire  _GEN_6415 = 4'h3 == enqIdx ? io_enq_0_bits_replayInfo_replayCarry_valid : replayCarryReg_3_valid; // @[LoadQueueReplay.scala 419:{30,30} 164:31]
  wire  _GEN_6416 = 4'h4 == enqIdx ? io_enq_0_bits_replayInfo_replayCarry_valid : replayCarryReg_4_valid; // @[LoadQueueReplay.scala 419:{30,30} 164:31]
  wire  _GEN_6417 = 4'h5 == enqIdx ? io_enq_0_bits_replayInfo_replayCarry_valid : replayCarryReg_5_valid; // @[LoadQueueReplay.scala 419:{30,30} 164:31]
  wire  _GEN_6418 = 4'h6 == enqIdx ? io_enq_0_bits_replayInfo_replayCarry_valid : replayCarryReg_6_valid; // @[LoadQueueReplay.scala 419:{30,30} 164:31]
  wire  _GEN_6419 = 4'h7 == enqIdx ? io_enq_0_bits_replayInfo_replayCarry_valid : replayCarryReg_7_valid; // @[LoadQueueReplay.scala 419:{30,30} 164:31]
  wire  _GEN_6420 = 4'h8 == enqIdx ? io_enq_0_bits_replayInfo_replayCarry_valid : replayCarryReg_8_valid; // @[LoadQueueReplay.scala 419:{30,30} 164:31]
  wire  _GEN_6421 = 4'h9 == enqIdx ? io_enq_0_bits_replayInfo_replayCarry_valid : replayCarryReg_9_valid; // @[LoadQueueReplay.scala 419:{30,30} 164:31]
  wire  _GEN_6422 = 4'ha == enqIdx ? io_enq_0_bits_replayInfo_replayCarry_valid : replayCarryReg_10_valid; // @[LoadQueueReplay.scala 419:{30,30} 164:31]
  wire  _GEN_6423 = 4'hb == enqIdx ? io_enq_0_bits_replayInfo_replayCarry_valid : replayCarryReg_11_valid; // @[LoadQueueReplay.scala 419:{30,30} 164:31]
  wire  _GEN_6424 = 4'hc == enqIdx ? io_enq_0_bits_replayInfo_replayCarry_valid : replayCarryReg_12_valid; // @[LoadQueueReplay.scala 419:{30,30} 164:31]
  wire  _GEN_6425 = 4'hd == enqIdx ? io_enq_0_bits_replayInfo_replayCarry_valid : replayCarryReg_13_valid; // @[LoadQueueReplay.scala 419:{30,30} 164:31]
  wire  _GEN_6426 = 4'he == enqIdx ? io_enq_0_bits_replayInfo_replayCarry_valid : replayCarryReg_14_valid; // @[LoadQueueReplay.scala 419:{30,30} 164:31]
  wire  _GEN_6427 = 4'hf == enqIdx ? io_enq_0_bits_replayInfo_replayCarry_valid : replayCarryReg_15_valid; // @[LoadQueueReplay.scala 419:{30,30} 164:31]
  wire [1:0] _GEN_6428 = 4'h0 == enqIdx ? io_enq_0_bits_replayInfo_missMSHRId : missMSHRId_0; // @[LoadQueueReplay.scala 420:{26,26} 157:27]
  wire [1:0] _GEN_6429 = 4'h1 == enqIdx ? io_enq_0_bits_replayInfo_missMSHRId : missMSHRId_1; // @[LoadQueueReplay.scala 420:{26,26} 157:27]
  wire [1:0] _GEN_6430 = 4'h2 == enqIdx ? io_enq_0_bits_replayInfo_missMSHRId : missMSHRId_2; // @[LoadQueueReplay.scala 420:{26,26} 157:27]
  wire [1:0] _GEN_6431 = 4'h3 == enqIdx ? io_enq_0_bits_replayInfo_missMSHRId : missMSHRId_3; // @[LoadQueueReplay.scala 420:{26,26} 157:27]
  wire [1:0] _GEN_6432 = 4'h4 == enqIdx ? io_enq_0_bits_replayInfo_missMSHRId : missMSHRId_4; // @[LoadQueueReplay.scala 420:{26,26} 157:27]
  wire [1:0] _GEN_6433 = 4'h5 == enqIdx ? io_enq_0_bits_replayInfo_missMSHRId : missMSHRId_5; // @[LoadQueueReplay.scala 420:{26,26} 157:27]
  wire [1:0] _GEN_6434 = 4'h6 == enqIdx ? io_enq_0_bits_replayInfo_missMSHRId : missMSHRId_6; // @[LoadQueueReplay.scala 420:{26,26} 157:27]
  wire [1:0] _GEN_6435 = 4'h7 == enqIdx ? io_enq_0_bits_replayInfo_missMSHRId : missMSHRId_7; // @[LoadQueueReplay.scala 420:{26,26} 157:27]
  wire [1:0] _GEN_6436 = 4'h8 == enqIdx ? io_enq_0_bits_replayInfo_missMSHRId : missMSHRId_8; // @[LoadQueueReplay.scala 420:{26,26} 157:27]
  wire [1:0] _GEN_6437 = 4'h9 == enqIdx ? io_enq_0_bits_replayInfo_missMSHRId : missMSHRId_9; // @[LoadQueueReplay.scala 420:{26,26} 157:27]
  wire [1:0] _GEN_6438 = 4'ha == enqIdx ? io_enq_0_bits_replayInfo_missMSHRId : missMSHRId_10; // @[LoadQueueReplay.scala 420:{26,26} 157:27]
  wire [1:0] _GEN_6439 = 4'hb == enqIdx ? io_enq_0_bits_replayInfo_missMSHRId : missMSHRId_11; // @[LoadQueueReplay.scala 420:{26,26} 157:27]
  wire [1:0] _GEN_6440 = 4'hc == enqIdx ? io_enq_0_bits_replayInfo_missMSHRId : missMSHRId_12; // @[LoadQueueReplay.scala 420:{26,26} 157:27]
  wire [1:0] _GEN_6441 = 4'hd == enqIdx ? io_enq_0_bits_replayInfo_missMSHRId : missMSHRId_13; // @[LoadQueueReplay.scala 420:{26,26} 157:27]
  wire [1:0] _GEN_6442 = 4'he == enqIdx ? io_enq_0_bits_replayInfo_missMSHRId : missMSHRId_14; // @[LoadQueueReplay.scala 420:{26,26} 157:27]
  wire [1:0] _GEN_6443 = 4'hf == enqIdx ? io_enq_0_bits_replayInfo_missMSHRId : missMSHRId_15; // @[LoadQueueReplay.scala 420:{26,26} 157:27]
  wire  _blockByCacheMiss_T_4 = ~(io_refill_valid & io_refill_bits_id == io_enq_0_bits_replayInfo_missMSHRId); // @[LoadQueueReplay.scala 422:35]
  wire  _blockByCacheMiss_T_5 = io_enq_0_bits_replayInfo_cause_7 & ~io_enq_0_bits_replayInfo_canForwardFullData &
    _blockByCacheMiss_T_4; // @[LoadQueueReplay.scala 421:115]
  wire [5:0] _GEN_6445 = 4'h1 == enqIdx ? creditUpdate_1 : creditUpdate_0; // @[LoadQueueReplay.scala 423:{56,56}]
  wire [5:0] _GEN_6446 = 4'h2 == enqIdx ? creditUpdate_2 : _GEN_6445; // @[LoadQueueReplay.scala 423:{56,56}]
  wire [5:0] _GEN_6447 = 4'h3 == enqIdx ? creditUpdate_3 : _GEN_6446; // @[LoadQueueReplay.scala 423:{56,56}]
  wire [5:0] _GEN_6448 = 4'h4 == enqIdx ? creditUpdate_4 : _GEN_6447; // @[LoadQueueReplay.scala 423:{56,56}]
  wire [5:0] _GEN_6449 = 4'h5 == enqIdx ? creditUpdate_5 : _GEN_6448; // @[LoadQueueReplay.scala 423:{56,56}]
  wire [5:0] _GEN_6450 = 4'h6 == enqIdx ? creditUpdate_6 : _GEN_6449; // @[LoadQueueReplay.scala 423:{56,56}]
  wire [5:0] _GEN_6451 = 4'h7 == enqIdx ? creditUpdate_7 : _GEN_6450; // @[LoadQueueReplay.scala 423:{56,56}]
  wire [5:0] _GEN_6452 = 4'h8 == enqIdx ? creditUpdate_8 : _GEN_6451; // @[LoadQueueReplay.scala 423:{56,56}]
  wire [5:0] _GEN_6453 = 4'h9 == enqIdx ? creditUpdate_9 : _GEN_6452; // @[LoadQueueReplay.scala 423:{56,56}]
  wire [5:0] _GEN_6454 = 4'ha == enqIdx ? creditUpdate_10 : _GEN_6453; // @[LoadQueueReplay.scala 423:{56,56}]
  wire [5:0] _GEN_6455 = 4'hb == enqIdx ? creditUpdate_11 : _GEN_6454; // @[LoadQueueReplay.scala 423:{56,56}]
  wire [5:0] _GEN_6456 = 4'hc == enqIdx ? creditUpdate_12 : _GEN_6455; // @[LoadQueueReplay.scala 423:{56,56}]
  wire [5:0] _GEN_6457 = 4'hd == enqIdx ? creditUpdate_13 : _GEN_6456; // @[LoadQueueReplay.scala 423:{56,56}]
  wire [5:0] _GEN_6458 = 4'he == enqIdx ? creditUpdate_14 : _GEN_6457; // @[LoadQueueReplay.scala 423:{56,56}]
  wire [5:0] _GEN_6459 = 4'hf == enqIdx ? creditUpdate_15 : _GEN_6458; // @[LoadQueueReplay.scala 423:{56,56}]
  wire  _blockByCacheMiss_T_6 = _GEN_6459 != 6'h0; // @[LoadQueueReplay.scala 423:56]
  wire  _blockByCacheMiss_T_7 = _blockByCacheMiss_T_5 & _blockByCacheMiss_T_6; // @[LoadQueueReplay.scala 422:101]
  wire  _GEN_6460 = 4'h0 == enqIdx ? _blockByCacheMiss_T_7 : _GEN_5836; // @[LoadQueueReplay.scala 421:{32,32}]
  wire  _GEN_6461 = 4'h1 == enqIdx ? _blockByCacheMiss_T_7 : _GEN_5837; // @[LoadQueueReplay.scala 421:{32,32}]
  wire  _GEN_6462 = 4'h2 == enqIdx ? _blockByCacheMiss_T_7 : _GEN_5838; // @[LoadQueueReplay.scala 421:{32,32}]
  wire  _GEN_6463 = 4'h3 == enqIdx ? _blockByCacheMiss_T_7 : _GEN_5839; // @[LoadQueueReplay.scala 421:{32,32}]
  wire  _GEN_6464 = 4'h4 == enqIdx ? _blockByCacheMiss_T_7 : _GEN_5840; // @[LoadQueueReplay.scala 421:{32,32}]
  wire  _GEN_6465 = 4'h5 == enqIdx ? _blockByCacheMiss_T_7 : _GEN_5841; // @[LoadQueueReplay.scala 421:{32,32}]
  wire  _GEN_6466 = 4'h6 == enqIdx ? _blockByCacheMiss_T_7 : _GEN_5842; // @[LoadQueueReplay.scala 421:{32,32}]
  wire  _GEN_6467 = 4'h7 == enqIdx ? _blockByCacheMiss_T_7 : _GEN_5843; // @[LoadQueueReplay.scala 421:{32,32}]
  wire  _GEN_6468 = 4'h8 == enqIdx ? _blockByCacheMiss_T_7 : _GEN_5844; // @[LoadQueueReplay.scala 421:{32,32}]
  wire  _GEN_6469 = 4'h9 == enqIdx ? _blockByCacheMiss_T_7 : _GEN_5845; // @[LoadQueueReplay.scala 421:{32,32}]
  wire  _GEN_6470 = 4'ha == enqIdx ? _blockByCacheMiss_T_7 : _GEN_5846; // @[LoadQueueReplay.scala 421:{32,32}]
  wire  _GEN_6471 = 4'hb == enqIdx ? _blockByCacheMiss_T_7 : _GEN_5847; // @[LoadQueueReplay.scala 421:{32,32}]
  wire  _GEN_6472 = 4'hc == enqIdx ? _blockByCacheMiss_T_7 : _GEN_5848; // @[LoadQueueReplay.scala 421:{32,32}]
  wire  _GEN_6473 = 4'hd == enqIdx ? _blockByCacheMiss_T_7 : _GEN_5849; // @[LoadQueueReplay.scala 421:{32,32}]
  wire  _GEN_6474 = 4'he == enqIdx ? _blockByCacheMiss_T_7 : _GEN_5850; // @[LoadQueueReplay.scala 421:{32,32}]
  wire  _GEN_6475 = 4'hf == enqIdx ? _blockByCacheMiss_T_7 : _GEN_5851; // @[LoadQueueReplay.scala 421:{32,32}]
  wire  _GEN_6476 = 4'h0 == enqIdx ? io_enq_0_bits_rarAllocated : flags_0_rarAllocated; // @[LoadQueueReplay.scala 131:18 426:{34,34}]
  wire  _GEN_6477 = 4'h1 == enqIdx ? io_enq_0_bits_rarAllocated : flags_1_rarAllocated; // @[LoadQueueReplay.scala 131:18 426:{34,34}]
  wire  _GEN_6478 = 4'h2 == enqIdx ? io_enq_0_bits_rarAllocated : flags_2_rarAllocated; // @[LoadQueueReplay.scala 131:18 426:{34,34}]
  wire  _GEN_6479 = 4'h3 == enqIdx ? io_enq_0_bits_rarAllocated : flags_3_rarAllocated; // @[LoadQueueReplay.scala 131:18 426:{34,34}]
  wire  _GEN_6480 = 4'h4 == enqIdx ? io_enq_0_bits_rarAllocated : flags_4_rarAllocated; // @[LoadQueueReplay.scala 131:18 426:{34,34}]
  wire  _GEN_6481 = 4'h5 == enqIdx ? io_enq_0_bits_rarAllocated : flags_5_rarAllocated; // @[LoadQueueReplay.scala 131:18 426:{34,34}]
  wire  _GEN_6482 = 4'h6 == enqIdx ? io_enq_0_bits_rarAllocated : flags_6_rarAllocated; // @[LoadQueueReplay.scala 131:18 426:{34,34}]
  wire  _GEN_6483 = 4'h7 == enqIdx ? io_enq_0_bits_rarAllocated : flags_7_rarAllocated; // @[LoadQueueReplay.scala 131:18 426:{34,34}]
  wire  _GEN_6484 = 4'h8 == enqIdx ? io_enq_0_bits_rarAllocated : flags_8_rarAllocated; // @[LoadQueueReplay.scala 131:18 426:{34,34}]
  wire  _GEN_6485 = 4'h9 == enqIdx ? io_enq_0_bits_rarAllocated : flags_9_rarAllocated; // @[LoadQueueReplay.scala 131:18 426:{34,34}]
  wire  _GEN_6486 = 4'ha == enqIdx ? io_enq_0_bits_rarAllocated : flags_10_rarAllocated; // @[LoadQueueReplay.scala 131:18 426:{34,34}]
  wire  _GEN_6487 = 4'hb == enqIdx ? io_enq_0_bits_rarAllocated : flags_11_rarAllocated; // @[LoadQueueReplay.scala 131:18 426:{34,34}]
  wire  _GEN_6488 = 4'hc == enqIdx ? io_enq_0_bits_rarAllocated : flags_12_rarAllocated; // @[LoadQueueReplay.scala 131:18 426:{34,34}]
  wire  _GEN_6489 = 4'hd == enqIdx ? io_enq_0_bits_rarAllocated : flags_13_rarAllocated; // @[LoadQueueReplay.scala 131:18 426:{34,34}]
  wire  _GEN_6490 = 4'he == enqIdx ? io_enq_0_bits_rarAllocated : flags_14_rarAllocated; // @[LoadQueueReplay.scala 131:18 426:{34,34}]
  wire  _GEN_6491 = 4'hf == enqIdx ? io_enq_0_bits_rarAllocated : flags_15_rarAllocated; // @[LoadQueueReplay.scala 131:18 426:{34,34}]
  wire [3:0] _GEN_6492 = 4'h0 == enqIdx ? io_enq_0_bits_rarIndex : flags_0_rarIndex; // @[LoadQueueReplay.scala 131:18 427:{30,30}]
  wire [3:0] _GEN_6493 = 4'h1 == enqIdx ? io_enq_0_bits_rarIndex : flags_1_rarIndex; // @[LoadQueueReplay.scala 131:18 427:{30,30}]
  wire [3:0] _GEN_6494 = 4'h2 == enqIdx ? io_enq_0_bits_rarIndex : flags_2_rarIndex; // @[LoadQueueReplay.scala 131:18 427:{30,30}]
  wire [3:0] _GEN_6495 = 4'h3 == enqIdx ? io_enq_0_bits_rarIndex : flags_3_rarIndex; // @[LoadQueueReplay.scala 131:18 427:{30,30}]
  wire [3:0] _GEN_6496 = 4'h4 == enqIdx ? io_enq_0_bits_rarIndex : flags_4_rarIndex; // @[LoadQueueReplay.scala 131:18 427:{30,30}]
  wire [3:0] _GEN_6497 = 4'h5 == enqIdx ? io_enq_0_bits_rarIndex : flags_5_rarIndex; // @[LoadQueueReplay.scala 131:18 427:{30,30}]
  wire [3:0] _GEN_6498 = 4'h6 == enqIdx ? io_enq_0_bits_rarIndex : flags_6_rarIndex; // @[LoadQueueReplay.scala 131:18 427:{30,30}]
  wire [3:0] _GEN_6499 = 4'h7 == enqIdx ? io_enq_0_bits_rarIndex : flags_7_rarIndex; // @[LoadQueueReplay.scala 131:18 427:{30,30}]
  wire [3:0] _GEN_6500 = 4'h8 == enqIdx ? io_enq_0_bits_rarIndex : flags_8_rarIndex; // @[LoadQueueReplay.scala 131:18 427:{30,30}]
  wire [3:0] _GEN_6501 = 4'h9 == enqIdx ? io_enq_0_bits_rarIndex : flags_9_rarIndex; // @[LoadQueueReplay.scala 131:18 427:{30,30}]
  wire [3:0] _GEN_6502 = 4'ha == enqIdx ? io_enq_0_bits_rarIndex : flags_10_rarIndex; // @[LoadQueueReplay.scala 131:18 427:{30,30}]
  wire [3:0] _GEN_6503 = 4'hb == enqIdx ? io_enq_0_bits_rarIndex : flags_11_rarIndex; // @[LoadQueueReplay.scala 131:18 427:{30,30}]
  wire [3:0] _GEN_6504 = 4'hc == enqIdx ? io_enq_0_bits_rarIndex : flags_12_rarIndex; // @[LoadQueueReplay.scala 131:18 427:{30,30}]
  wire [3:0] _GEN_6505 = 4'hd == enqIdx ? io_enq_0_bits_rarIndex : flags_13_rarIndex; // @[LoadQueueReplay.scala 131:18 427:{30,30}]
  wire [3:0] _GEN_6506 = 4'he == enqIdx ? io_enq_0_bits_rarIndex : flags_14_rarIndex; // @[LoadQueueReplay.scala 131:18 427:{30,30}]
  wire [3:0] _GEN_6507 = 4'hf == enqIdx ? io_enq_0_bits_rarIndex : flags_15_rarIndex; // @[LoadQueueReplay.scala 131:18 427:{30,30}]
  wire  _GEN_6508 = 4'h0 == enqIdx ? io_enq_0_bits_rawAllocated : flags_0_rawAllocated; // @[LoadQueueReplay.scala 131:18 428:{34,34}]
  wire  _GEN_6509 = 4'h1 == enqIdx ? io_enq_0_bits_rawAllocated : flags_1_rawAllocated; // @[LoadQueueReplay.scala 131:18 428:{34,34}]
  wire  _GEN_6510 = 4'h2 == enqIdx ? io_enq_0_bits_rawAllocated : flags_2_rawAllocated; // @[LoadQueueReplay.scala 131:18 428:{34,34}]
  wire  _GEN_6511 = 4'h3 == enqIdx ? io_enq_0_bits_rawAllocated : flags_3_rawAllocated; // @[LoadQueueReplay.scala 131:18 428:{34,34}]
  wire  _GEN_6512 = 4'h4 == enqIdx ? io_enq_0_bits_rawAllocated : flags_4_rawAllocated; // @[LoadQueueReplay.scala 131:18 428:{34,34}]
  wire  _GEN_6513 = 4'h5 == enqIdx ? io_enq_0_bits_rawAllocated : flags_5_rawAllocated; // @[LoadQueueReplay.scala 131:18 428:{34,34}]
  wire  _GEN_6514 = 4'h6 == enqIdx ? io_enq_0_bits_rawAllocated : flags_6_rawAllocated; // @[LoadQueueReplay.scala 131:18 428:{34,34}]
  wire  _GEN_6515 = 4'h7 == enqIdx ? io_enq_0_bits_rawAllocated : flags_7_rawAllocated; // @[LoadQueueReplay.scala 131:18 428:{34,34}]
  wire  _GEN_6516 = 4'h8 == enqIdx ? io_enq_0_bits_rawAllocated : flags_8_rawAllocated; // @[LoadQueueReplay.scala 131:18 428:{34,34}]
  wire  _GEN_6517 = 4'h9 == enqIdx ? io_enq_0_bits_rawAllocated : flags_9_rawAllocated; // @[LoadQueueReplay.scala 131:18 428:{34,34}]
  wire  _GEN_6518 = 4'ha == enqIdx ? io_enq_0_bits_rawAllocated : flags_10_rawAllocated; // @[LoadQueueReplay.scala 131:18 428:{34,34}]
  wire  _GEN_6519 = 4'hb == enqIdx ? io_enq_0_bits_rawAllocated : flags_11_rawAllocated; // @[LoadQueueReplay.scala 131:18 428:{34,34}]
  wire  _GEN_6520 = 4'hc == enqIdx ? io_enq_0_bits_rawAllocated : flags_12_rawAllocated; // @[LoadQueueReplay.scala 131:18 428:{34,34}]
  wire  _GEN_6521 = 4'hd == enqIdx ? io_enq_0_bits_rawAllocated : flags_13_rawAllocated; // @[LoadQueueReplay.scala 131:18 428:{34,34}]
  wire  _GEN_6522 = 4'he == enqIdx ? io_enq_0_bits_rawAllocated : flags_14_rawAllocated; // @[LoadQueueReplay.scala 131:18 428:{34,34}]
  wire  _GEN_6523 = 4'hf == enqIdx ? io_enq_0_bits_rawAllocated : flags_15_rawAllocated; // @[LoadQueueReplay.scala 131:18 428:{34,34}]
  wire [2:0] _GEN_6524 = 4'h0 == enqIdx ? io_enq_0_bits_rawIndex : flags_0_rawIndex; // @[LoadQueueReplay.scala 131:18 429:{30,30}]
  wire [2:0] _GEN_6525 = 4'h1 == enqIdx ? io_enq_0_bits_rawIndex : flags_1_rawIndex; // @[LoadQueueReplay.scala 131:18 429:{30,30}]
  wire [2:0] _GEN_6526 = 4'h2 == enqIdx ? io_enq_0_bits_rawIndex : flags_2_rawIndex; // @[LoadQueueReplay.scala 131:18 429:{30,30}]
  wire [2:0] _GEN_6527 = 4'h3 == enqIdx ? io_enq_0_bits_rawIndex : flags_3_rawIndex; // @[LoadQueueReplay.scala 131:18 429:{30,30}]
  wire [2:0] _GEN_6528 = 4'h4 == enqIdx ? io_enq_0_bits_rawIndex : flags_4_rawIndex; // @[LoadQueueReplay.scala 131:18 429:{30,30}]
  wire [2:0] _GEN_6529 = 4'h5 == enqIdx ? io_enq_0_bits_rawIndex : flags_5_rawIndex; // @[LoadQueueReplay.scala 131:18 429:{30,30}]
  wire [2:0] _GEN_6530 = 4'h6 == enqIdx ? io_enq_0_bits_rawIndex : flags_6_rawIndex; // @[LoadQueueReplay.scala 131:18 429:{30,30}]
  wire [2:0] _GEN_6531 = 4'h7 == enqIdx ? io_enq_0_bits_rawIndex : flags_7_rawIndex; // @[LoadQueueReplay.scala 131:18 429:{30,30}]
  wire [2:0] _GEN_6532 = 4'h8 == enqIdx ? io_enq_0_bits_rawIndex : flags_8_rawIndex; // @[LoadQueueReplay.scala 131:18 429:{30,30}]
  wire [2:0] _GEN_6533 = 4'h9 == enqIdx ? io_enq_0_bits_rawIndex : flags_9_rawIndex; // @[LoadQueueReplay.scala 131:18 429:{30,30}]
  wire [2:0] _GEN_6534 = 4'ha == enqIdx ? io_enq_0_bits_rawIndex : flags_10_rawIndex; // @[LoadQueueReplay.scala 131:18 429:{30,30}]
  wire [2:0] _GEN_6535 = 4'hb == enqIdx ? io_enq_0_bits_rawIndex : flags_11_rawIndex; // @[LoadQueueReplay.scala 131:18 429:{30,30}]
  wire [2:0] _GEN_6536 = 4'hc == enqIdx ? io_enq_0_bits_rawIndex : flags_12_rawIndex; // @[LoadQueueReplay.scala 131:18 429:{30,30}]
  wire [2:0] _GEN_6537 = 4'hd == enqIdx ? io_enq_0_bits_rawIndex : flags_13_rawIndex; // @[LoadQueueReplay.scala 131:18 429:{30,30}]
  wire [2:0] _GEN_6538 = 4'he == enqIdx ? io_enq_0_bits_rawIndex : flags_14_rawIndex; // @[LoadQueueReplay.scala 131:18 429:{30,30}]
  wire [2:0] _GEN_6539 = 4'hf == enqIdx ? io_enq_0_bits_rawIndex : flags_15_rawIndex; // @[LoadQueueReplay.scala 131:18 429:{30,30}]
  wire [4:0] _GEN_6540 = 4'h0 == enqIdx ? 5'h0 : _blockCounter_0_T_8; // @[LoadQueueReplay.scala 266:21 432:{28,28}]
  wire [4:0] _GEN_6541 = 4'h1 == enqIdx ? 5'h0 : _blockCounter_1_T_8; // @[LoadQueueReplay.scala 266:21 432:{28,28}]
  wire [4:0] _GEN_6542 = 4'h2 == enqIdx ? 5'h0 : _blockCounter_2_T_8; // @[LoadQueueReplay.scala 266:21 432:{28,28}]
  wire [4:0] _GEN_6543 = 4'h3 == enqIdx ? 5'h0 : _blockCounter_3_T_8; // @[LoadQueueReplay.scala 266:21 432:{28,28}]
  wire [4:0] _GEN_6544 = 4'h4 == enqIdx ? 5'h0 : _blockCounter_4_T_8; // @[LoadQueueReplay.scala 266:21 432:{28,28}]
  wire [4:0] _GEN_6545 = 4'h5 == enqIdx ? 5'h0 : _blockCounter_5_T_8; // @[LoadQueueReplay.scala 266:21 432:{28,28}]
  wire [4:0] _GEN_6546 = 4'h6 == enqIdx ? 5'h0 : _blockCounter_6_T_8; // @[LoadQueueReplay.scala 266:21 432:{28,28}]
  wire [4:0] _GEN_6547 = 4'h7 == enqIdx ? 5'h0 : _blockCounter_7_T_8; // @[LoadQueueReplay.scala 266:21 432:{28,28}]
  wire [4:0] _GEN_6548 = 4'h8 == enqIdx ? 5'h0 : _blockCounter_8_T_8; // @[LoadQueueReplay.scala 266:21 432:{28,28}]
  wire [4:0] _GEN_6549 = 4'h9 == enqIdx ? 5'h0 : _blockCounter_9_T_8; // @[LoadQueueReplay.scala 266:21 432:{28,28}]
  wire [4:0] _GEN_6550 = 4'ha == enqIdx ? 5'h0 : _blockCounter_10_T_8; // @[LoadQueueReplay.scala 266:21 432:{28,28}]
  wire [4:0] _GEN_6551 = 4'hb == enqIdx ? 5'h0 : _blockCounter_11_T_8; // @[LoadQueueReplay.scala 266:21 432:{28,28}]
  wire [4:0] _GEN_6552 = 4'hc == enqIdx ? 5'h0 : _blockCounter_12_T_8; // @[LoadQueueReplay.scala 266:21 432:{28,28}]
  wire [4:0] _GEN_6553 = 4'hd == enqIdx ? 5'h0 : _blockCounter_13_T_8; // @[LoadQueueReplay.scala 266:21 432:{28,28}]
  wire [4:0] _GEN_6554 = 4'he == enqIdx ? 5'h0 : _blockCounter_14_T_8; // @[LoadQueueReplay.scala 266:21 432:{28,28}]
  wire [4:0] _GEN_6555 = 4'hf == enqIdx ? 5'h0 : _blockCounter_15_T_8; // @[LoadQueueReplay.scala 266:21 432:{28,28}]
  wire  _GEN_6556 = canEnqueueVec_0 ? _GEN_3988 : _GEN_3953; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_6557 = canEnqueueVec_0 ? _GEN_3989 : _GEN_3954; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_6558 = canEnqueueVec_0 ? _GEN_3990 : _GEN_3955; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_6559 = canEnqueueVec_0 ? _GEN_3991 : _GEN_3956; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_6560 = canEnqueueVec_0 ? _GEN_3992 : _GEN_3957; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_6561 = canEnqueueVec_0 ? _GEN_3993 : _GEN_3958; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_6562 = canEnqueueVec_0 ? _GEN_3994 : _GEN_3959; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_6563 = canEnqueueVec_0 ? _GEN_3995 : _GEN_3960; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_6564 = canEnqueueVec_0 ? _GEN_3996 : _GEN_3961; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_6565 = canEnqueueVec_0 ? _GEN_3997 : _GEN_3962; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_6566 = canEnqueueVec_0 ? _GEN_3998 : _GEN_3963; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_6567 = canEnqueueVec_0 ? _GEN_3999 : _GEN_3964; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_6568 = canEnqueueVec_0 ? _GEN_4000 : _GEN_3965; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_6569 = canEnqueueVec_0 ? _GEN_4001 : _GEN_3966; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_6570 = canEnqueueVec_0 ? _GEN_4002 : _GEN_3967; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_6571 = canEnqueueVec_0 ? _GEN_4003 : _GEN_3968; // @[LoadQueueReplay.scala 362:29]
  wire [9:0] _GEN_6604 = canEnqueueVec_0 ? _GEN_4036 : uop_0_cf_foldpc; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [9:0] _GEN_6605 = canEnqueueVec_0 ? _GEN_4037 : uop_1_cf_foldpc; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [9:0] _GEN_6606 = canEnqueueVec_0 ? _GEN_4038 : uop_2_cf_foldpc; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [9:0] _GEN_6607 = canEnqueueVec_0 ? _GEN_4039 : uop_3_cf_foldpc; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [9:0] _GEN_6608 = canEnqueueVec_0 ? _GEN_4040 : uop_4_cf_foldpc; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [9:0] _GEN_6609 = canEnqueueVec_0 ? _GEN_4041 : uop_5_cf_foldpc; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [9:0] _GEN_6610 = canEnqueueVec_0 ? _GEN_4042 : uop_6_cf_foldpc; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [9:0] _GEN_6611 = canEnqueueVec_0 ? _GEN_4043 : uop_7_cf_foldpc; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [9:0] _GEN_6612 = canEnqueueVec_0 ? _GEN_4044 : uop_8_cf_foldpc; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [9:0] _GEN_6613 = canEnqueueVec_0 ? _GEN_4045 : uop_9_cf_foldpc; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [9:0] _GEN_6614 = canEnqueueVec_0 ? _GEN_4046 : uop_10_cf_foldpc; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [9:0] _GEN_6615 = canEnqueueVec_0 ? _GEN_4047 : uop_11_cf_foldpc; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [9:0] _GEN_6616 = canEnqueueVec_0 ? _GEN_4048 : uop_12_cf_foldpc; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [9:0] _GEN_6617 = canEnqueueVec_0 ? _GEN_4049 : uop_13_cf_foldpc; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [9:0] _GEN_6618 = canEnqueueVec_0 ? _GEN_4050 : uop_14_cf_foldpc; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [9:0] _GEN_6619 = canEnqueueVec_0 ? _GEN_4051 : uop_15_cf_foldpc; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_6956 = canEnqueueVec_0 ? _GEN_4388 : uop_0_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_6957 = canEnqueueVec_0 ? _GEN_4389 : uop_1_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_6958 = canEnqueueVec_0 ? _GEN_4390 : uop_2_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_6959 = canEnqueueVec_0 ? _GEN_4391 : uop_3_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_6960 = canEnqueueVec_0 ? _GEN_4392 : uop_4_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_6961 = canEnqueueVec_0 ? _GEN_4393 : uop_5_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_6962 = canEnqueueVec_0 ? _GEN_4394 : uop_6_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_6963 = canEnqueueVec_0 ? _GEN_4395 : uop_7_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_6964 = canEnqueueVec_0 ? _GEN_4396 : uop_8_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_6965 = canEnqueueVec_0 ? _GEN_4397 : uop_9_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_6966 = canEnqueueVec_0 ? _GEN_4398 : uop_10_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_6967 = canEnqueueVec_0 ? _GEN_4399 : uop_11_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_6968 = canEnqueueVec_0 ? _GEN_4400 : uop_12_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_6969 = canEnqueueVec_0 ? _GEN_4401 : uop_13_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_6970 = canEnqueueVec_0 ? _GEN_4402 : uop_14_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_6971 = canEnqueueVec_0 ? _GEN_4403 : uop_15_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_6972 = canEnqueueVec_0 ? _GEN_4404 : uop_0_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_6973 = canEnqueueVec_0 ? _GEN_4405 : uop_1_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_6974 = canEnqueueVec_0 ? _GEN_4406 : uop_2_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_6975 = canEnqueueVec_0 ? _GEN_4407 : uop_3_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_6976 = canEnqueueVec_0 ? _GEN_4408 : uop_4_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_6977 = canEnqueueVec_0 ? _GEN_4409 : uop_5_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_6978 = canEnqueueVec_0 ? _GEN_4410 : uop_6_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_6979 = canEnqueueVec_0 ? _GEN_4411 : uop_7_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_6980 = canEnqueueVec_0 ? _GEN_4412 : uop_8_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_6981 = canEnqueueVec_0 ? _GEN_4413 : uop_9_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_6982 = canEnqueueVec_0 ? _GEN_4414 : uop_10_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_6983 = canEnqueueVec_0 ? _GEN_4415 : uop_11_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_6984 = canEnqueueVec_0 ? _GEN_4416 : uop_12_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_6985 = canEnqueueVec_0 ? _GEN_4417 : uop_13_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_6986 = canEnqueueVec_0 ? _GEN_4418 : uop_14_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_6987 = canEnqueueVec_0 ? _GEN_4419 : uop_15_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_6988 = canEnqueueVec_0 ? _GEN_4420 : uop_0_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_6989 = canEnqueueVec_0 ? _GEN_4421 : uop_1_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_6990 = canEnqueueVec_0 ? _GEN_4422 : uop_2_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_6991 = canEnqueueVec_0 ? _GEN_4423 : uop_3_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_6992 = canEnqueueVec_0 ? _GEN_4424 : uop_4_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_6993 = canEnqueueVec_0 ? _GEN_4425 : uop_5_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_6994 = canEnqueueVec_0 ? _GEN_4426 : uop_6_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_6995 = canEnqueueVec_0 ? _GEN_4427 : uop_7_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_6996 = canEnqueueVec_0 ? _GEN_4428 : uop_8_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_6997 = canEnqueueVec_0 ? _GEN_4429 : uop_9_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_6998 = canEnqueueVec_0 ? _GEN_4430 : uop_10_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_6999 = canEnqueueVec_0 ? _GEN_4431 : uop_11_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7000 = canEnqueueVec_0 ? _GEN_4432 : uop_12_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7001 = canEnqueueVec_0 ? _GEN_4433 : uop_13_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7002 = canEnqueueVec_0 ? _GEN_4434 : uop_14_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7003 = canEnqueueVec_0 ? _GEN_4435 : uop_15_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7036 = canEnqueueVec_0 ? _GEN_4468 : uop_0_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7037 = canEnqueueVec_0 ? _GEN_4469 : uop_1_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7038 = canEnqueueVec_0 ? _GEN_4470 : uop_2_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7039 = canEnqueueVec_0 ? _GEN_4471 : uop_3_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7040 = canEnqueueVec_0 ? _GEN_4472 : uop_4_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7041 = canEnqueueVec_0 ? _GEN_4473 : uop_5_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7042 = canEnqueueVec_0 ? _GEN_4474 : uop_6_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7043 = canEnqueueVec_0 ? _GEN_4475 : uop_7_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7044 = canEnqueueVec_0 ? _GEN_4476 : uop_8_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7045 = canEnqueueVec_0 ? _GEN_4477 : uop_9_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7046 = canEnqueueVec_0 ? _GEN_4478 : uop_10_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7047 = canEnqueueVec_0 ? _GEN_4479 : uop_11_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7048 = canEnqueueVec_0 ? _GEN_4480 : uop_12_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7049 = canEnqueueVec_0 ? _GEN_4481 : uop_13_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7050 = canEnqueueVec_0 ? _GEN_4482 : uop_14_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7051 = canEnqueueVec_0 ? _GEN_4483 : uop_15_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7196 = canEnqueueVec_0 ? _GEN_4628 : uop_0_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7197 = canEnqueueVec_0 ? _GEN_4629 : uop_1_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7198 = canEnqueueVec_0 ? _GEN_4630 : uop_2_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7199 = canEnqueueVec_0 ? _GEN_4631 : uop_3_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7200 = canEnqueueVec_0 ? _GEN_4632 : uop_4_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7201 = canEnqueueVec_0 ? _GEN_4633 : uop_5_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7202 = canEnqueueVec_0 ? _GEN_4634 : uop_6_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7203 = canEnqueueVec_0 ? _GEN_4635 : uop_7_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7204 = canEnqueueVec_0 ? _GEN_4636 : uop_8_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7205 = canEnqueueVec_0 ? _GEN_4637 : uop_9_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7206 = canEnqueueVec_0 ? _GEN_4638 : uop_10_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7207 = canEnqueueVec_0 ? _GEN_4639 : uop_11_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7208 = canEnqueueVec_0 ? _GEN_4640 : uop_12_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7209 = canEnqueueVec_0 ? _GEN_4641 : uop_13_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7210 = canEnqueueVec_0 ? _GEN_4642 : uop_14_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7211 = canEnqueueVec_0 ? _GEN_4643 : uop_15_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [4:0] _GEN_7212 = canEnqueueVec_0 ? _GEN_4644 : uop_0_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [4:0] _GEN_7213 = canEnqueueVec_0 ? _GEN_4645 : uop_1_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [4:0] _GEN_7214 = canEnqueueVec_0 ? _GEN_4646 : uop_2_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [4:0] _GEN_7215 = canEnqueueVec_0 ? _GEN_4647 : uop_3_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [4:0] _GEN_7216 = canEnqueueVec_0 ? _GEN_4648 : uop_4_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [4:0] _GEN_7217 = canEnqueueVec_0 ? _GEN_4649 : uop_5_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [4:0] _GEN_7218 = canEnqueueVec_0 ? _GEN_4650 : uop_6_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [4:0] _GEN_7219 = canEnqueueVec_0 ? _GEN_4651 : uop_7_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [4:0] _GEN_7220 = canEnqueueVec_0 ? _GEN_4652 : uop_8_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [4:0] _GEN_7221 = canEnqueueVec_0 ? _GEN_4653 : uop_9_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [4:0] _GEN_7222 = canEnqueueVec_0 ? _GEN_4654 : uop_10_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [4:0] _GEN_7223 = canEnqueueVec_0 ? _GEN_4655 : uop_11_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [4:0] _GEN_7224 = canEnqueueVec_0 ? _GEN_4656 : uop_12_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [4:0] _GEN_7225 = canEnqueueVec_0 ? _GEN_4657 : uop_13_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [4:0] _GEN_7226 = canEnqueueVec_0 ? _GEN_4658 : uop_14_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [4:0] _GEN_7227 = canEnqueueVec_0 ? _GEN_4659 : uop_15_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7228 = canEnqueueVec_0 ? _GEN_4660 : uop_0_cf_loadWaitBit; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7229 = canEnqueueVec_0 ? _GEN_4661 : uop_1_cf_loadWaitBit; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7230 = canEnqueueVec_0 ? _GEN_4662 : uop_2_cf_loadWaitBit; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7231 = canEnqueueVec_0 ? _GEN_4663 : uop_3_cf_loadWaitBit; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7232 = canEnqueueVec_0 ? _GEN_4664 : uop_4_cf_loadWaitBit; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7233 = canEnqueueVec_0 ? _GEN_4665 : uop_5_cf_loadWaitBit; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7234 = canEnqueueVec_0 ? _GEN_4666 : uop_6_cf_loadWaitBit; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7235 = canEnqueueVec_0 ? _GEN_4667 : uop_7_cf_loadWaitBit; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7236 = canEnqueueVec_0 ? _GEN_4668 : uop_8_cf_loadWaitBit; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7237 = canEnqueueVec_0 ? _GEN_4669 : uop_9_cf_loadWaitBit; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7238 = canEnqueueVec_0 ? _GEN_4670 : uop_10_cf_loadWaitBit; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7239 = canEnqueueVec_0 ? _GEN_4671 : uop_11_cf_loadWaitBit; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7240 = canEnqueueVec_0 ? _GEN_4672 : uop_12_cf_loadWaitBit; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7241 = canEnqueueVec_0 ? _GEN_4673 : uop_13_cf_loadWaitBit; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7242 = canEnqueueVec_0 ? _GEN_4674 : uop_14_cf_loadWaitBit; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7243 = canEnqueueVec_0 ? _GEN_4675 : uop_15_cf_loadWaitBit; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7244 = canEnqueueVec_0 ? _GEN_4676 : uop_0_cf_loadWaitStrict; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7245 = canEnqueueVec_0 ? _GEN_4677 : uop_1_cf_loadWaitStrict; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7246 = canEnqueueVec_0 ? _GEN_4678 : uop_2_cf_loadWaitStrict; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7247 = canEnqueueVec_0 ? _GEN_4679 : uop_3_cf_loadWaitStrict; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7248 = canEnqueueVec_0 ? _GEN_4680 : uop_4_cf_loadWaitStrict; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7249 = canEnqueueVec_0 ? _GEN_4681 : uop_5_cf_loadWaitStrict; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7250 = canEnqueueVec_0 ? _GEN_4682 : uop_6_cf_loadWaitStrict; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7251 = canEnqueueVec_0 ? _GEN_4683 : uop_7_cf_loadWaitStrict; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7252 = canEnqueueVec_0 ? _GEN_4684 : uop_8_cf_loadWaitStrict; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7253 = canEnqueueVec_0 ? _GEN_4685 : uop_9_cf_loadWaitStrict; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7254 = canEnqueueVec_0 ? _GEN_4686 : uop_10_cf_loadWaitStrict; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7255 = canEnqueueVec_0 ? _GEN_4687 : uop_11_cf_loadWaitStrict; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7256 = canEnqueueVec_0 ? _GEN_4688 : uop_12_cf_loadWaitStrict; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7257 = canEnqueueVec_0 ? _GEN_4689 : uop_13_cf_loadWaitStrict; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7258 = canEnqueueVec_0 ? _GEN_4690 : uop_14_cf_loadWaitStrict; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7259 = canEnqueueVec_0 ? _GEN_4691 : uop_15_cf_loadWaitStrict; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7276 = canEnqueueVec_0 ? _GEN_4708 : uop_0_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7277 = canEnqueueVec_0 ? _GEN_4709 : uop_1_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7278 = canEnqueueVec_0 ? _GEN_4710 : uop_2_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7279 = canEnqueueVec_0 ? _GEN_4711 : uop_3_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7280 = canEnqueueVec_0 ? _GEN_4712 : uop_4_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7281 = canEnqueueVec_0 ? _GEN_4713 : uop_5_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7282 = canEnqueueVec_0 ? _GEN_4714 : uop_6_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7283 = canEnqueueVec_0 ? _GEN_4715 : uop_7_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7284 = canEnqueueVec_0 ? _GEN_4716 : uop_8_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7285 = canEnqueueVec_0 ? _GEN_4717 : uop_9_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7286 = canEnqueueVec_0 ? _GEN_4718 : uop_10_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7287 = canEnqueueVec_0 ? _GEN_4719 : uop_11_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7288 = canEnqueueVec_0 ? _GEN_4720 : uop_12_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7289 = canEnqueueVec_0 ? _GEN_4721 : uop_13_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7290 = canEnqueueVec_0 ? _GEN_4722 : uop_14_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7291 = canEnqueueVec_0 ? _GEN_4723 : uop_15_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [2:0] _GEN_7292 = canEnqueueVec_0 ? _GEN_4724 : uop_0_cf_ftqPtr_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [2:0] _GEN_7293 = canEnqueueVec_0 ? _GEN_4725 : uop_1_cf_ftqPtr_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [2:0] _GEN_7294 = canEnqueueVec_0 ? _GEN_4726 : uop_2_cf_ftqPtr_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [2:0] _GEN_7295 = canEnqueueVec_0 ? _GEN_4727 : uop_3_cf_ftqPtr_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [2:0] _GEN_7296 = canEnqueueVec_0 ? _GEN_4728 : uop_4_cf_ftqPtr_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [2:0] _GEN_7297 = canEnqueueVec_0 ? _GEN_4729 : uop_5_cf_ftqPtr_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [2:0] _GEN_7298 = canEnqueueVec_0 ? _GEN_4730 : uop_6_cf_ftqPtr_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [2:0] _GEN_7299 = canEnqueueVec_0 ? _GEN_4731 : uop_7_cf_ftqPtr_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [2:0] _GEN_7300 = canEnqueueVec_0 ? _GEN_4732 : uop_8_cf_ftqPtr_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [2:0] _GEN_7301 = canEnqueueVec_0 ? _GEN_4733 : uop_9_cf_ftqPtr_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [2:0] _GEN_7302 = canEnqueueVec_0 ? _GEN_4734 : uop_10_cf_ftqPtr_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [2:0] _GEN_7303 = canEnqueueVec_0 ? _GEN_4735 : uop_11_cf_ftqPtr_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [2:0] _GEN_7304 = canEnqueueVec_0 ? _GEN_4736 : uop_12_cf_ftqPtr_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [2:0] _GEN_7305 = canEnqueueVec_0 ? _GEN_4737 : uop_13_cf_ftqPtr_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [2:0] _GEN_7306 = canEnqueueVec_0 ? _GEN_4738 : uop_14_cf_ftqPtr_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [2:0] _GEN_7307 = canEnqueueVec_0 ? _GEN_4739 : uop_15_cf_ftqPtr_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [2:0] _GEN_7308 = canEnqueueVec_0 ? _GEN_4740 : uop_0_cf_ftqOffset; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [2:0] _GEN_7309 = canEnqueueVec_0 ? _GEN_4741 : uop_1_cf_ftqOffset; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [2:0] _GEN_7310 = canEnqueueVec_0 ? _GEN_4742 : uop_2_cf_ftqOffset; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [2:0] _GEN_7311 = canEnqueueVec_0 ? _GEN_4743 : uop_3_cf_ftqOffset; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [2:0] _GEN_7312 = canEnqueueVec_0 ? _GEN_4744 : uop_4_cf_ftqOffset; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [2:0] _GEN_7313 = canEnqueueVec_0 ? _GEN_4745 : uop_5_cf_ftqOffset; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [2:0] _GEN_7314 = canEnqueueVec_0 ? _GEN_4746 : uop_6_cf_ftqOffset; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [2:0] _GEN_7315 = canEnqueueVec_0 ? _GEN_4747 : uop_7_cf_ftqOffset; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [2:0] _GEN_7316 = canEnqueueVec_0 ? _GEN_4748 : uop_8_cf_ftqOffset; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [2:0] _GEN_7317 = canEnqueueVec_0 ? _GEN_4749 : uop_9_cf_ftqOffset; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [2:0] _GEN_7318 = canEnqueueVec_0 ? _GEN_4750 : uop_10_cf_ftqOffset; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [2:0] _GEN_7319 = canEnqueueVec_0 ? _GEN_4751 : uop_11_cf_ftqOffset; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [2:0] _GEN_7320 = canEnqueueVec_0 ? _GEN_4752 : uop_12_cf_ftqOffset; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [2:0] _GEN_7321 = canEnqueueVec_0 ? _GEN_4753 : uop_13_cf_ftqOffset; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [2:0] _GEN_7322 = canEnqueueVec_0 ? _GEN_4754 : uop_14_cf_ftqOffset; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [2:0] _GEN_7323 = canEnqueueVec_0 ? _GEN_4755 : uop_15_cf_ftqOffset; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [3:0] _GEN_7452 = canEnqueueVec_0 ? _GEN_4884 : uop_0_ctrl_fuType; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [3:0] _GEN_7453 = canEnqueueVec_0 ? _GEN_4885 : uop_1_ctrl_fuType; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [3:0] _GEN_7454 = canEnqueueVec_0 ? _GEN_4886 : uop_2_ctrl_fuType; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [3:0] _GEN_7455 = canEnqueueVec_0 ? _GEN_4887 : uop_3_ctrl_fuType; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [3:0] _GEN_7456 = canEnqueueVec_0 ? _GEN_4888 : uop_4_ctrl_fuType; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [3:0] _GEN_7457 = canEnqueueVec_0 ? _GEN_4889 : uop_5_ctrl_fuType; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [3:0] _GEN_7458 = canEnqueueVec_0 ? _GEN_4890 : uop_6_ctrl_fuType; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [3:0] _GEN_7459 = canEnqueueVec_0 ? _GEN_4891 : uop_7_ctrl_fuType; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [3:0] _GEN_7460 = canEnqueueVec_0 ? _GEN_4892 : uop_8_ctrl_fuType; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [3:0] _GEN_7461 = canEnqueueVec_0 ? _GEN_4893 : uop_9_ctrl_fuType; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [3:0] _GEN_7462 = canEnqueueVec_0 ? _GEN_4894 : uop_10_ctrl_fuType; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [3:0] _GEN_7463 = canEnqueueVec_0 ? _GEN_4895 : uop_11_ctrl_fuType; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [3:0] _GEN_7464 = canEnqueueVec_0 ? _GEN_4896 : uop_12_ctrl_fuType; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [3:0] _GEN_7465 = canEnqueueVec_0 ? _GEN_4897 : uop_13_ctrl_fuType; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [3:0] _GEN_7466 = canEnqueueVec_0 ? _GEN_4898 : uop_14_ctrl_fuType; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [3:0] _GEN_7467 = canEnqueueVec_0 ? _GEN_4899 : uop_15_ctrl_fuType; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [6:0] _GEN_7468 = canEnqueueVec_0 ? _GEN_4900 : uop_0_ctrl_fuOpType; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [6:0] _GEN_7469 = canEnqueueVec_0 ? _GEN_4901 : uop_1_ctrl_fuOpType; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [6:0] _GEN_7470 = canEnqueueVec_0 ? _GEN_4902 : uop_2_ctrl_fuOpType; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [6:0] _GEN_7471 = canEnqueueVec_0 ? _GEN_4903 : uop_3_ctrl_fuOpType; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [6:0] _GEN_7472 = canEnqueueVec_0 ? _GEN_4904 : uop_4_ctrl_fuOpType; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [6:0] _GEN_7473 = canEnqueueVec_0 ? _GEN_4905 : uop_5_ctrl_fuOpType; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [6:0] _GEN_7474 = canEnqueueVec_0 ? _GEN_4906 : uop_6_ctrl_fuOpType; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [6:0] _GEN_7475 = canEnqueueVec_0 ? _GEN_4907 : uop_7_ctrl_fuOpType; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [6:0] _GEN_7476 = canEnqueueVec_0 ? _GEN_4908 : uop_8_ctrl_fuOpType; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [6:0] _GEN_7477 = canEnqueueVec_0 ? _GEN_4909 : uop_9_ctrl_fuOpType; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [6:0] _GEN_7478 = canEnqueueVec_0 ? _GEN_4910 : uop_10_ctrl_fuOpType; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [6:0] _GEN_7479 = canEnqueueVec_0 ? _GEN_4911 : uop_11_ctrl_fuOpType; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [6:0] _GEN_7480 = canEnqueueVec_0 ? _GEN_4912 : uop_12_ctrl_fuOpType; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [6:0] _GEN_7481 = canEnqueueVec_0 ? _GEN_4913 : uop_13_ctrl_fuOpType; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [6:0] _GEN_7482 = canEnqueueVec_0 ? _GEN_4914 : uop_14_ctrl_fuOpType; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [6:0] _GEN_7483 = canEnqueueVec_0 ? _GEN_4915 : uop_15_ctrl_fuOpType; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7484 = canEnqueueVec_0 ? _GEN_4916 : uop_0_ctrl_rfWen; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7485 = canEnqueueVec_0 ? _GEN_4917 : uop_1_ctrl_rfWen; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7486 = canEnqueueVec_0 ? _GEN_4918 : uop_2_ctrl_rfWen; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7487 = canEnqueueVec_0 ? _GEN_4919 : uop_3_ctrl_rfWen; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7488 = canEnqueueVec_0 ? _GEN_4920 : uop_4_ctrl_rfWen; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7489 = canEnqueueVec_0 ? _GEN_4921 : uop_5_ctrl_rfWen; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7490 = canEnqueueVec_0 ? _GEN_4922 : uop_6_ctrl_rfWen; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7491 = canEnqueueVec_0 ? _GEN_4923 : uop_7_ctrl_rfWen; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7492 = canEnqueueVec_0 ? _GEN_4924 : uop_8_ctrl_rfWen; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7493 = canEnqueueVec_0 ? _GEN_4925 : uop_9_ctrl_rfWen; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7494 = canEnqueueVec_0 ? _GEN_4926 : uop_10_ctrl_rfWen; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7495 = canEnqueueVec_0 ? _GEN_4927 : uop_11_ctrl_rfWen; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7496 = canEnqueueVec_0 ? _GEN_4928 : uop_12_ctrl_rfWen; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7497 = canEnqueueVec_0 ? _GEN_4929 : uop_13_ctrl_rfWen; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7498 = canEnqueueVec_0 ? _GEN_4930 : uop_14_ctrl_rfWen; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7499 = canEnqueueVec_0 ? _GEN_4931 : uop_15_ctrl_rfWen; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7500 = canEnqueueVec_0 ? _GEN_4932 : uop_0_ctrl_fpWen; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7501 = canEnqueueVec_0 ? _GEN_4933 : uop_1_ctrl_fpWen; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7502 = canEnqueueVec_0 ? _GEN_4934 : uop_2_ctrl_fpWen; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7503 = canEnqueueVec_0 ? _GEN_4935 : uop_3_ctrl_fpWen; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7504 = canEnqueueVec_0 ? _GEN_4936 : uop_4_ctrl_fpWen; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7505 = canEnqueueVec_0 ? _GEN_4937 : uop_5_ctrl_fpWen; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7506 = canEnqueueVec_0 ? _GEN_4938 : uop_6_ctrl_fpWen; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7507 = canEnqueueVec_0 ? _GEN_4939 : uop_7_ctrl_fpWen; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7508 = canEnqueueVec_0 ? _GEN_4940 : uop_8_ctrl_fpWen; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7509 = canEnqueueVec_0 ? _GEN_4941 : uop_9_ctrl_fpWen; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7510 = canEnqueueVec_0 ? _GEN_4942 : uop_10_ctrl_fpWen; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7511 = canEnqueueVec_0 ? _GEN_4943 : uop_11_ctrl_fpWen; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7512 = canEnqueueVec_0 ? _GEN_4944 : uop_12_ctrl_fpWen; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7513 = canEnqueueVec_0 ? _GEN_4945 : uop_13_ctrl_fpWen; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7514 = canEnqueueVec_0 ? _GEN_4946 : uop_14_ctrl_fpWen; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_7515 = canEnqueueVec_0 ? _GEN_4947 : uop_15_ctrl_fpWen; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [5:0] _GEN_7996 = canEnqueueVec_0 ? _GEN_5428 : uop_0_pdest; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [5:0] _GEN_7997 = canEnqueueVec_0 ? _GEN_5429 : uop_1_pdest; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [5:0] _GEN_7998 = canEnqueueVec_0 ? _GEN_5430 : uop_2_pdest; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [5:0] _GEN_7999 = canEnqueueVec_0 ? _GEN_5431 : uop_3_pdest; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [5:0] _GEN_8000 = canEnqueueVec_0 ? _GEN_5432 : uop_4_pdest; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [5:0] _GEN_8001 = canEnqueueVec_0 ? _GEN_5433 : uop_5_pdest; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [5:0] _GEN_8002 = canEnqueueVec_0 ? _GEN_5434 : uop_6_pdest; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [5:0] _GEN_8003 = canEnqueueVec_0 ? _GEN_5435 : uop_7_pdest; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [5:0] _GEN_8004 = canEnqueueVec_0 ? _GEN_5436 : uop_8_pdest; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [5:0] _GEN_8005 = canEnqueueVec_0 ? _GEN_5437 : uop_9_pdest; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [5:0] _GEN_8006 = canEnqueueVec_0 ? _GEN_5438 : uop_10_pdest; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [5:0] _GEN_8007 = canEnqueueVec_0 ? _GEN_5439 : uop_11_pdest; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [5:0] _GEN_8008 = canEnqueueVec_0 ? _GEN_5440 : uop_12_pdest; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [5:0] _GEN_8009 = canEnqueueVec_0 ? _GEN_5441 : uop_13_pdest; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [5:0] _GEN_8010 = canEnqueueVec_0 ? _GEN_5442 : uop_14_pdest; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [5:0] _GEN_8011 = canEnqueueVec_0 ? _GEN_5443 : uop_15_pdest; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_8028 = canEnqueueVec_0 ? _GEN_5460 : uop_0_robIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_8029 = canEnqueueVec_0 ? _GEN_5461 : uop_1_robIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_8030 = canEnqueueVec_0 ? _GEN_5462 : uop_2_robIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_8031 = canEnqueueVec_0 ? _GEN_5463 : uop_3_robIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_8032 = canEnqueueVec_0 ? _GEN_5464 : uop_4_robIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_8033 = canEnqueueVec_0 ? _GEN_5465 : uop_5_robIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_8034 = canEnqueueVec_0 ? _GEN_5466 : uop_6_robIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_8035 = canEnqueueVec_0 ? _GEN_5467 : uop_7_robIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_8036 = canEnqueueVec_0 ? _GEN_5468 : uop_8_robIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_8037 = canEnqueueVec_0 ? _GEN_5469 : uop_9_robIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_8038 = canEnqueueVec_0 ? _GEN_5470 : uop_10_robIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_8039 = canEnqueueVec_0 ? _GEN_5471 : uop_11_robIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_8040 = canEnqueueVec_0 ? _GEN_5472 : uop_12_robIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_8041 = canEnqueueVec_0 ? _GEN_5473 : uop_13_robIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_8042 = canEnqueueVec_0 ? _GEN_5474 : uop_14_robIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_8043 = canEnqueueVec_0 ? _GEN_5475 : uop_15_robIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [4:0] _GEN_8044 = canEnqueueVec_0 ? _GEN_5476 : uop_0_robIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [4:0] _GEN_8045 = canEnqueueVec_0 ? _GEN_5477 : uop_1_robIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [4:0] _GEN_8046 = canEnqueueVec_0 ? _GEN_5478 : uop_2_robIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [4:0] _GEN_8047 = canEnqueueVec_0 ? _GEN_5479 : uop_3_robIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [4:0] _GEN_8048 = canEnqueueVec_0 ? _GEN_5480 : uop_4_robIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [4:0] _GEN_8049 = canEnqueueVec_0 ? _GEN_5481 : uop_5_robIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [4:0] _GEN_8050 = canEnqueueVec_0 ? _GEN_5482 : uop_6_robIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [4:0] _GEN_8051 = canEnqueueVec_0 ? _GEN_5483 : uop_7_robIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [4:0] _GEN_8052 = canEnqueueVec_0 ? _GEN_5484 : uop_8_robIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [4:0] _GEN_8053 = canEnqueueVec_0 ? _GEN_5485 : uop_9_robIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [4:0] _GEN_8054 = canEnqueueVec_0 ? _GEN_5486 : uop_10_robIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [4:0] _GEN_8055 = canEnqueueVec_0 ? _GEN_5487 : uop_11_robIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [4:0] _GEN_8056 = canEnqueueVec_0 ? _GEN_5488 : uop_12_robIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [4:0] _GEN_8057 = canEnqueueVec_0 ? _GEN_5489 : uop_13_robIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [4:0] _GEN_8058 = canEnqueueVec_0 ? _GEN_5490 : uop_14_robIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [4:0] _GEN_8059 = canEnqueueVec_0 ? _GEN_5491 : uop_15_robIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_8060 = canEnqueueVec_0 ? _GEN_5492 : uop_0_lqIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_8061 = canEnqueueVec_0 ? _GEN_5493 : uop_1_lqIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_8062 = canEnqueueVec_0 ? _GEN_5494 : uop_2_lqIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_8063 = canEnqueueVec_0 ? _GEN_5495 : uop_3_lqIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_8064 = canEnqueueVec_0 ? _GEN_5496 : uop_4_lqIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_8065 = canEnqueueVec_0 ? _GEN_5497 : uop_5_lqIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_8066 = canEnqueueVec_0 ? _GEN_5498 : uop_6_lqIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_8067 = canEnqueueVec_0 ? _GEN_5499 : uop_7_lqIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_8068 = canEnqueueVec_0 ? _GEN_5500 : uop_8_lqIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_8069 = canEnqueueVec_0 ? _GEN_5501 : uop_9_lqIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_8070 = canEnqueueVec_0 ? _GEN_5502 : uop_10_lqIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_8071 = canEnqueueVec_0 ? _GEN_5503 : uop_11_lqIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_8072 = canEnqueueVec_0 ? _GEN_5504 : uop_12_lqIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_8073 = canEnqueueVec_0 ? _GEN_5505 : uop_13_lqIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_8074 = canEnqueueVec_0 ? _GEN_5506 : uop_14_lqIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_8075 = canEnqueueVec_0 ? _GEN_5507 : uop_15_lqIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [3:0] _GEN_8076 = canEnqueueVec_0 ? _GEN_5508 : uop_0_lqIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [3:0] _GEN_8077 = canEnqueueVec_0 ? _GEN_5509 : uop_1_lqIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [3:0] _GEN_8078 = canEnqueueVec_0 ? _GEN_5510 : uop_2_lqIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [3:0] _GEN_8079 = canEnqueueVec_0 ? _GEN_5511 : uop_3_lqIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [3:0] _GEN_8080 = canEnqueueVec_0 ? _GEN_5512 : uop_4_lqIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [3:0] _GEN_8081 = canEnqueueVec_0 ? _GEN_5513 : uop_5_lqIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [3:0] _GEN_8082 = canEnqueueVec_0 ? _GEN_5514 : uop_6_lqIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [3:0] _GEN_8083 = canEnqueueVec_0 ? _GEN_5515 : uop_7_lqIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [3:0] _GEN_8084 = canEnqueueVec_0 ? _GEN_5516 : uop_8_lqIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [3:0] _GEN_8085 = canEnqueueVec_0 ? _GEN_5517 : uop_9_lqIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [3:0] _GEN_8086 = canEnqueueVec_0 ? _GEN_5518 : uop_10_lqIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [3:0] _GEN_8087 = canEnqueueVec_0 ? _GEN_5519 : uop_11_lqIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [3:0] _GEN_8088 = canEnqueueVec_0 ? _GEN_5520 : uop_12_lqIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [3:0] _GEN_8089 = canEnqueueVec_0 ? _GEN_5521 : uop_13_lqIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [3:0] _GEN_8090 = canEnqueueVec_0 ? _GEN_5522 : uop_14_lqIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [3:0] _GEN_8091 = canEnqueueVec_0 ? _GEN_5523 : uop_15_lqIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_8092 = canEnqueueVec_0 ? _GEN_5524 : uop_0_sqIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_8093 = canEnqueueVec_0 ? _GEN_5525 : uop_1_sqIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_8094 = canEnqueueVec_0 ? _GEN_5526 : uop_2_sqIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_8095 = canEnqueueVec_0 ? _GEN_5527 : uop_3_sqIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_8096 = canEnqueueVec_0 ? _GEN_5528 : uop_4_sqIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_8097 = canEnqueueVec_0 ? _GEN_5529 : uop_5_sqIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_8098 = canEnqueueVec_0 ? _GEN_5530 : uop_6_sqIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_8099 = canEnqueueVec_0 ? _GEN_5531 : uop_7_sqIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_8100 = canEnqueueVec_0 ? _GEN_5532 : uop_8_sqIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_8101 = canEnqueueVec_0 ? _GEN_5533 : uop_9_sqIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_8102 = canEnqueueVec_0 ? _GEN_5534 : uop_10_sqIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_8103 = canEnqueueVec_0 ? _GEN_5535 : uop_11_sqIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_8104 = canEnqueueVec_0 ? _GEN_5536 : uop_12_sqIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_8105 = canEnqueueVec_0 ? _GEN_5537 : uop_13_sqIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_8106 = canEnqueueVec_0 ? _GEN_5538 : uop_14_sqIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire  _GEN_8107 = canEnqueueVec_0 ? _GEN_5539 : uop_15_sqIdx_flag; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [3:0] _GEN_8108 = canEnqueueVec_0 ? _GEN_5540 : uop_0_sqIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [3:0] _GEN_8109 = canEnqueueVec_0 ? _GEN_5541 : uop_1_sqIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [3:0] _GEN_8110 = canEnqueueVec_0 ? _GEN_5542 : uop_2_sqIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [3:0] _GEN_8111 = canEnqueueVec_0 ? _GEN_5543 : uop_3_sqIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [3:0] _GEN_8112 = canEnqueueVec_0 ? _GEN_5544 : uop_4_sqIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [3:0] _GEN_8113 = canEnqueueVec_0 ? _GEN_5545 : uop_5_sqIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [3:0] _GEN_8114 = canEnqueueVec_0 ? _GEN_5546 : uop_6_sqIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [3:0] _GEN_8115 = canEnqueueVec_0 ? _GEN_5547 : uop_7_sqIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [3:0] _GEN_8116 = canEnqueueVec_0 ? _GEN_5548 : uop_8_sqIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [3:0] _GEN_8117 = canEnqueueVec_0 ? _GEN_5549 : uop_9_sqIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [3:0] _GEN_8118 = canEnqueueVec_0 ? _GEN_5550 : uop_10_sqIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [3:0] _GEN_8119 = canEnqueueVec_0 ? _GEN_5551 : uop_11_sqIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [3:0] _GEN_8120 = canEnqueueVec_0 ? _GEN_5552 : uop_12_sqIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [3:0] _GEN_8121 = canEnqueueVec_0 ? _GEN_5553 : uop_13_sqIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [3:0] _GEN_8122 = canEnqueueVec_0 ? _GEN_5554 : uop_14_sqIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [3:0] _GEN_8123 = canEnqueueVec_0 ? _GEN_5555 : uop_15_sqIdx_value; // @[LoadQueueReplay.scala 112:16 362:29]
  wire [7:0] _GEN_8303 = canEnqueueVec_0 ? _GEN_5732 : cause_0; // @[LoadQueueReplay.scala 121:22 362:29]
  wire [7:0] _GEN_8304 = canEnqueueVec_0 ? _GEN_5733 : cause_1; // @[LoadQueueReplay.scala 121:22 362:29]
  wire [7:0] _GEN_8305 = canEnqueueVec_0 ? _GEN_5734 : cause_2; // @[LoadQueueReplay.scala 121:22 362:29]
  wire [7:0] _GEN_8306 = canEnqueueVec_0 ? _GEN_5735 : cause_3; // @[LoadQueueReplay.scala 121:22 362:29]
  wire [7:0] _GEN_8307 = canEnqueueVec_0 ? _GEN_5736 : cause_4; // @[LoadQueueReplay.scala 121:22 362:29]
  wire [7:0] _GEN_8308 = canEnqueueVec_0 ? _GEN_5737 : cause_5; // @[LoadQueueReplay.scala 121:22 362:29]
  wire [7:0] _GEN_8309 = canEnqueueVec_0 ? _GEN_5738 : cause_6; // @[LoadQueueReplay.scala 121:22 362:29]
  wire [7:0] _GEN_8310 = canEnqueueVec_0 ? _GEN_5739 : cause_7; // @[LoadQueueReplay.scala 121:22 362:29]
  wire [7:0] _GEN_8311 = canEnqueueVec_0 ? _GEN_5740 : cause_8; // @[LoadQueueReplay.scala 121:22 362:29]
  wire [7:0] _GEN_8312 = canEnqueueVec_0 ? _GEN_5741 : cause_9; // @[LoadQueueReplay.scala 121:22 362:29]
  wire [7:0] _GEN_8313 = canEnqueueVec_0 ? _GEN_5742 : cause_10; // @[LoadQueueReplay.scala 121:22 362:29]
  wire [7:0] _GEN_8314 = canEnqueueVec_0 ? _GEN_5743 : cause_11; // @[LoadQueueReplay.scala 121:22 362:29]
  wire [7:0] _GEN_8315 = canEnqueueVec_0 ? _GEN_5744 : cause_12; // @[LoadQueueReplay.scala 121:22 362:29]
  wire [7:0] _GEN_8316 = canEnqueueVec_0 ? _GEN_5745 : cause_13; // @[LoadQueueReplay.scala 121:22 362:29]
  wire [7:0] _GEN_8317 = canEnqueueVec_0 ? _GEN_5746 : cause_14; // @[LoadQueueReplay.scala 121:22 362:29]
  wire [7:0] _GEN_8318 = canEnqueueVec_0 ? _GEN_5747 : cause_15; // @[LoadQueueReplay.scala 121:22 362:29]
  wire  _GEN_8335 = canEnqueueVec_0 ? _GEN_6124 : _GEN_2; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_8336 = canEnqueueVec_0 ? _GEN_6125 : _GEN_6; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_8337 = canEnqueueVec_0 ? _GEN_6126 : _GEN_10; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_8338 = canEnqueueVec_0 ? _GEN_6127 : _GEN_14; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_8339 = canEnqueueVec_0 ? _GEN_6128 : _GEN_18; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_8340 = canEnqueueVec_0 ? _GEN_6129 : _GEN_22; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_8341 = canEnqueueVec_0 ? _GEN_6130 : _GEN_26; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_8342 = canEnqueueVec_0 ? _GEN_6131 : _GEN_30; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_8343 = canEnqueueVec_0 ? _GEN_6132 : _GEN_34; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_8344 = canEnqueueVec_0 ? _GEN_6133 : _GEN_38; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_8345 = canEnqueueVec_0 ? _GEN_6134 : _GEN_42; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_8346 = canEnqueueVec_0 ? _GEN_6135 : _GEN_46; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_8347 = canEnqueueVec_0 ? _GEN_6136 : _GEN_50; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_8348 = canEnqueueVec_0 ? _GEN_6137 : _GEN_54; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_8349 = canEnqueueVec_0 ? _GEN_6138 : _GEN_58; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_8350 = canEnqueueVec_0 ? _GEN_6139 : _GEN_62; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_8351 = canEnqueueVec_0 ? _GEN_6252 : _blockByWaitStore_0_T_1; // @[LoadQueueReplay.scala 219:25 362:29]
  wire  _GEN_8352 = canEnqueueVec_0 ? _GEN_6253 : _blockByWaitStore_1_T_1; // @[LoadQueueReplay.scala 219:25 362:29]
  wire  _GEN_8353 = canEnqueueVec_0 ? _GEN_6254 : _blockByWaitStore_2_T_1; // @[LoadQueueReplay.scala 219:25 362:29]
  wire  _GEN_8354 = canEnqueueVec_0 ? _GEN_6255 : _blockByWaitStore_3_T_1; // @[LoadQueueReplay.scala 219:25 362:29]
  wire  _GEN_8355 = canEnqueueVec_0 ? _GEN_6256 : _blockByWaitStore_4_T_1; // @[LoadQueueReplay.scala 219:25 362:29]
  wire  _GEN_8356 = canEnqueueVec_0 ? _GEN_6257 : _blockByWaitStore_5_T_1; // @[LoadQueueReplay.scala 219:25 362:29]
  wire  _GEN_8357 = canEnqueueVec_0 ? _GEN_6258 : _blockByWaitStore_6_T_1; // @[LoadQueueReplay.scala 219:25 362:29]
  wire  _GEN_8358 = canEnqueueVec_0 ? _GEN_6259 : _blockByWaitStore_7_T_1; // @[LoadQueueReplay.scala 219:25 362:29]
  wire  _GEN_8359 = canEnqueueVec_0 ? _GEN_6260 : _blockByWaitStore_8_T_1; // @[LoadQueueReplay.scala 219:25 362:29]
  wire  _GEN_8360 = canEnqueueVec_0 ? _GEN_6261 : _blockByWaitStore_9_T_1; // @[LoadQueueReplay.scala 219:25 362:29]
  wire  _GEN_8361 = canEnqueueVec_0 ? _GEN_6262 : _blockByWaitStore_10_T_1; // @[LoadQueueReplay.scala 219:25 362:29]
  wire  _GEN_8362 = canEnqueueVec_0 ? _GEN_6263 : _blockByWaitStore_11_T_1; // @[LoadQueueReplay.scala 219:25 362:29]
  wire  _GEN_8363 = canEnqueueVec_0 ? _GEN_6264 : _blockByWaitStore_12_T_1; // @[LoadQueueReplay.scala 219:25 362:29]
  wire  _GEN_8364 = canEnqueueVec_0 ? _GEN_6265 : _blockByWaitStore_13_T_1; // @[LoadQueueReplay.scala 219:25 362:29]
  wire  _GEN_8365 = canEnqueueVec_0 ? _GEN_6266 : _blockByWaitStore_14_T_1; // @[LoadQueueReplay.scala 219:25 362:29]
  wire  _GEN_8366 = canEnqueueVec_0 ? _GEN_6267 : _blockByWaitStore_15_T_1; // @[LoadQueueReplay.scala 219:25 362:29]
  wire  _GEN_8367 = canEnqueueVec_0 ? _GEN_6348 : _blockByForwardFail_0_T_1; // @[LoadQueueReplay.scala 218:27 362:29]
  wire  _GEN_8368 = canEnqueueVec_0 ? _GEN_6349 : _blockByForwardFail_1_T_1; // @[LoadQueueReplay.scala 218:27 362:29]
  wire  _GEN_8369 = canEnqueueVec_0 ? _GEN_6350 : _blockByForwardFail_2_T_1; // @[LoadQueueReplay.scala 218:27 362:29]
  wire  _GEN_8370 = canEnqueueVec_0 ? _GEN_6351 : _blockByForwardFail_3_T_1; // @[LoadQueueReplay.scala 218:27 362:29]
  wire  _GEN_8371 = canEnqueueVec_0 ? _GEN_6352 : _blockByForwardFail_4_T_1; // @[LoadQueueReplay.scala 218:27 362:29]
  wire  _GEN_8372 = canEnqueueVec_0 ? _GEN_6353 : _blockByForwardFail_5_T_1; // @[LoadQueueReplay.scala 218:27 362:29]
  wire  _GEN_8373 = canEnqueueVec_0 ? _GEN_6354 : _blockByForwardFail_6_T_1; // @[LoadQueueReplay.scala 218:27 362:29]
  wire  _GEN_8374 = canEnqueueVec_0 ? _GEN_6355 : _blockByForwardFail_7_T_1; // @[LoadQueueReplay.scala 218:27 362:29]
  wire  _GEN_8375 = canEnqueueVec_0 ? _GEN_6356 : _blockByForwardFail_8_T_1; // @[LoadQueueReplay.scala 218:27 362:29]
  wire  _GEN_8376 = canEnqueueVec_0 ? _GEN_6357 : _blockByForwardFail_9_T_1; // @[LoadQueueReplay.scala 218:27 362:29]
  wire  _GEN_8377 = canEnqueueVec_0 ? _GEN_6358 : _blockByForwardFail_10_T_1; // @[LoadQueueReplay.scala 218:27 362:29]
  wire  _GEN_8378 = canEnqueueVec_0 ? _GEN_6359 : _blockByForwardFail_11_T_1; // @[LoadQueueReplay.scala 218:27 362:29]
  wire  _GEN_8379 = canEnqueueVec_0 ? _GEN_6360 : _blockByForwardFail_12_T_1; // @[LoadQueueReplay.scala 218:27 362:29]
  wire  _GEN_8380 = canEnqueueVec_0 ? _GEN_6361 : _blockByForwardFail_13_T_1; // @[LoadQueueReplay.scala 218:27 362:29]
  wire  _GEN_8381 = canEnqueueVec_0 ? _GEN_6362 : _blockByForwardFail_14_T_1; // @[LoadQueueReplay.scala 218:27 362:29]
  wire  _GEN_8382 = canEnqueueVec_0 ? _GEN_6363 : _blockByForwardFail_15_T_1; // @[LoadQueueReplay.scala 218:27 362:29]
  wire  _GEN_8383 = canEnqueueVec_0 ? _GEN_6460 : _GEN_1; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_8384 = canEnqueueVec_0 ? _GEN_6461 : _GEN_5; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_8385 = canEnqueueVec_0 ? _GEN_6462 : _GEN_9; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_8386 = canEnqueueVec_0 ? _GEN_6463 : _GEN_13; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_8387 = canEnqueueVec_0 ? _GEN_6464 : _GEN_17; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_8388 = canEnqueueVec_0 ? _GEN_6465 : _GEN_21; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_8389 = canEnqueueVec_0 ? _GEN_6466 : _GEN_25; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_8390 = canEnqueueVec_0 ? _GEN_6467 : _GEN_29; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_8391 = canEnqueueVec_0 ? _GEN_6468 : _GEN_33; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_8392 = canEnqueueVec_0 ? _GEN_6469 : _GEN_37; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_8393 = canEnqueueVec_0 ? _GEN_6470 : _GEN_41; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_8394 = canEnqueueVec_0 ? _GEN_6471 : _GEN_45; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_8395 = canEnqueueVec_0 ? _GEN_6472 : _GEN_49; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_8396 = canEnqueueVec_0 ? _GEN_6473 : _GEN_53; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_8397 = canEnqueueVec_0 ? _GEN_6474 : _GEN_57; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_8398 = canEnqueueVec_0 ? _GEN_6475 : _GEN_61; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_8399 = canEnqueueVec_0 ? _GEN_6172 : _GEN_3; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_8400 = canEnqueueVec_0 ? _GEN_6173 : _GEN_7; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_8401 = canEnqueueVec_0 ? _GEN_6174 : _GEN_11; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_8402 = canEnqueueVec_0 ? _GEN_6175 : _GEN_15; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_8403 = canEnqueueVec_0 ? _GEN_6176 : _GEN_19; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_8404 = canEnqueueVec_0 ? _GEN_6177 : _GEN_23; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_8405 = canEnqueueVec_0 ? _GEN_6178 : _GEN_27; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_8406 = canEnqueueVec_0 ? _GEN_6179 : _GEN_31; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_8407 = canEnqueueVec_0 ? _GEN_6180 : _GEN_35; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_8408 = canEnqueueVec_0 ? _GEN_6181 : _GEN_39; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_8409 = canEnqueueVec_0 ? _GEN_6182 : _GEN_43; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_8410 = canEnqueueVec_0 ? _GEN_6183 : _GEN_47; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_8411 = canEnqueueVec_0 ? _GEN_6184 : _GEN_51; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_8412 = canEnqueueVec_0 ? _GEN_6185 : _GEN_55; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_8413 = canEnqueueVec_0 ? _GEN_6186 : _GEN_59; // @[LoadQueueReplay.scala 362:29]
  wire  _GEN_8414 = canEnqueueVec_0 ? _GEN_6187 : _GEN_63; // @[LoadQueueReplay.scala 362:29]
  wire [1:0] _GEN_8447 = canEnqueueVec_0 ? _GEN_6188 : blockPtrOthers_0; // @[LoadQueueReplay.scala 362:29 141:31]
  wire [1:0] _GEN_8448 = canEnqueueVec_0 ? _GEN_6189 : blockPtrOthers_1; // @[LoadQueueReplay.scala 362:29 141:31]
  wire [1:0] _GEN_8449 = canEnqueueVec_0 ? _GEN_6190 : blockPtrOthers_2; // @[LoadQueueReplay.scala 362:29 141:31]
  wire [1:0] _GEN_8450 = canEnqueueVec_0 ? _GEN_6191 : blockPtrOthers_3; // @[LoadQueueReplay.scala 362:29 141:31]
  wire [1:0] _GEN_8451 = canEnqueueVec_0 ? _GEN_6192 : blockPtrOthers_4; // @[LoadQueueReplay.scala 362:29 141:31]
  wire [1:0] _GEN_8452 = canEnqueueVec_0 ? _GEN_6193 : blockPtrOthers_5; // @[LoadQueueReplay.scala 362:29 141:31]
  wire [1:0] _GEN_8453 = canEnqueueVec_0 ? _GEN_6194 : blockPtrOthers_6; // @[LoadQueueReplay.scala 362:29 141:31]
  wire [1:0] _GEN_8454 = canEnqueueVec_0 ? _GEN_6195 : blockPtrOthers_7; // @[LoadQueueReplay.scala 362:29 141:31]
  wire [1:0] _GEN_8455 = canEnqueueVec_0 ? _GEN_6196 : blockPtrOthers_8; // @[LoadQueueReplay.scala 362:29 141:31]
  wire [1:0] _GEN_8456 = canEnqueueVec_0 ? _GEN_6197 : blockPtrOthers_9; // @[LoadQueueReplay.scala 362:29 141:31]
  wire [1:0] _GEN_8457 = canEnqueueVec_0 ? _GEN_6198 : blockPtrOthers_10; // @[LoadQueueReplay.scala 362:29 141:31]
  wire [1:0] _GEN_8458 = canEnqueueVec_0 ? _GEN_6199 : blockPtrOthers_11; // @[LoadQueueReplay.scala 362:29 141:31]
  wire [1:0] _GEN_8459 = canEnqueueVec_0 ? _GEN_6200 : blockPtrOthers_12; // @[LoadQueueReplay.scala 362:29 141:31]
  wire [1:0] _GEN_8460 = canEnqueueVec_0 ? _GEN_6201 : blockPtrOthers_13; // @[LoadQueueReplay.scala 362:29 141:31]
  wire [1:0] _GEN_8461 = canEnqueueVec_0 ? _GEN_6202 : blockPtrOthers_14; // @[LoadQueueReplay.scala 362:29 141:31]
  wire [1:0] _GEN_8462 = canEnqueueVec_0 ? _GEN_6203 : blockPtrOthers_15; // @[LoadQueueReplay.scala 362:29 141:31]
  wire  _GEN_8463 = canEnqueueVec_0 ? _GEN_6364 : blockSqIdx_0_flag; // @[LoadQueueReplay.scala 150:23 362:29]
  wire  _GEN_8464 = canEnqueueVec_0 ? _GEN_6365 : blockSqIdx_1_flag; // @[LoadQueueReplay.scala 150:23 362:29]
  wire  _GEN_8465 = canEnqueueVec_0 ? _GEN_6366 : blockSqIdx_2_flag; // @[LoadQueueReplay.scala 150:23 362:29]
  wire  _GEN_8466 = canEnqueueVec_0 ? _GEN_6367 : blockSqIdx_3_flag; // @[LoadQueueReplay.scala 150:23 362:29]
  wire  _GEN_8467 = canEnqueueVec_0 ? _GEN_6368 : blockSqIdx_4_flag; // @[LoadQueueReplay.scala 150:23 362:29]
  wire  _GEN_8468 = canEnqueueVec_0 ? _GEN_6369 : blockSqIdx_5_flag; // @[LoadQueueReplay.scala 150:23 362:29]
  wire  _GEN_8469 = canEnqueueVec_0 ? _GEN_6370 : blockSqIdx_6_flag; // @[LoadQueueReplay.scala 150:23 362:29]
  wire  _GEN_8470 = canEnqueueVec_0 ? _GEN_6371 : blockSqIdx_7_flag; // @[LoadQueueReplay.scala 150:23 362:29]
  wire  _GEN_8471 = canEnqueueVec_0 ? _GEN_6372 : blockSqIdx_8_flag; // @[LoadQueueReplay.scala 150:23 362:29]
  wire  _GEN_8472 = canEnqueueVec_0 ? _GEN_6373 : blockSqIdx_9_flag; // @[LoadQueueReplay.scala 150:23 362:29]
  wire  _GEN_8473 = canEnqueueVec_0 ? _GEN_6374 : blockSqIdx_10_flag; // @[LoadQueueReplay.scala 150:23 362:29]
  wire  _GEN_8474 = canEnqueueVec_0 ? _GEN_6375 : blockSqIdx_11_flag; // @[LoadQueueReplay.scala 150:23 362:29]
  wire  _GEN_8475 = canEnqueueVec_0 ? _GEN_6376 : blockSqIdx_12_flag; // @[LoadQueueReplay.scala 150:23 362:29]
  wire  _GEN_8476 = canEnqueueVec_0 ? _GEN_6377 : blockSqIdx_13_flag; // @[LoadQueueReplay.scala 150:23 362:29]
  wire  _GEN_8477 = canEnqueueVec_0 ? _GEN_6378 : blockSqIdx_14_flag; // @[LoadQueueReplay.scala 150:23 362:29]
  wire  _GEN_8478 = canEnqueueVec_0 ? _GEN_6379 : blockSqIdx_15_flag; // @[LoadQueueReplay.scala 150:23 362:29]
  wire [3:0] _GEN_8479 = canEnqueueVec_0 ? _GEN_6380 : blockSqIdx_0_value; // @[LoadQueueReplay.scala 150:23 362:29]
  wire [3:0] _GEN_8480 = canEnqueueVec_0 ? _GEN_6381 : blockSqIdx_1_value; // @[LoadQueueReplay.scala 150:23 362:29]
  wire [3:0] _GEN_8481 = canEnqueueVec_0 ? _GEN_6382 : blockSqIdx_2_value; // @[LoadQueueReplay.scala 150:23 362:29]
  wire [3:0] _GEN_8482 = canEnqueueVec_0 ? _GEN_6383 : blockSqIdx_3_value; // @[LoadQueueReplay.scala 150:23 362:29]
  wire [3:0] _GEN_8483 = canEnqueueVec_0 ? _GEN_6384 : blockSqIdx_4_value; // @[LoadQueueReplay.scala 150:23 362:29]
  wire [3:0] _GEN_8484 = canEnqueueVec_0 ? _GEN_6385 : blockSqIdx_5_value; // @[LoadQueueReplay.scala 150:23 362:29]
  wire [3:0] _GEN_8485 = canEnqueueVec_0 ? _GEN_6386 : blockSqIdx_6_value; // @[LoadQueueReplay.scala 150:23 362:29]
  wire [3:0] _GEN_8486 = canEnqueueVec_0 ? _GEN_6387 : blockSqIdx_7_value; // @[LoadQueueReplay.scala 150:23 362:29]
  wire [3:0] _GEN_8487 = canEnqueueVec_0 ? _GEN_6388 : blockSqIdx_8_value; // @[LoadQueueReplay.scala 150:23 362:29]
  wire [3:0] _GEN_8488 = canEnqueueVec_0 ? _GEN_6389 : blockSqIdx_9_value; // @[LoadQueueReplay.scala 150:23 362:29]
  wire [3:0] _GEN_8489 = canEnqueueVec_0 ? _GEN_6390 : blockSqIdx_10_value; // @[LoadQueueReplay.scala 150:23 362:29]
  wire [3:0] _GEN_8490 = canEnqueueVec_0 ? _GEN_6391 : blockSqIdx_11_value; // @[LoadQueueReplay.scala 150:23 362:29]
  wire [3:0] _GEN_8491 = canEnqueueVec_0 ? _GEN_6392 : blockSqIdx_12_value; // @[LoadQueueReplay.scala 150:23 362:29]
  wire [3:0] _GEN_8492 = canEnqueueVec_0 ? _GEN_6393 : blockSqIdx_13_value; // @[LoadQueueReplay.scala 150:23 362:29]
  wire [3:0] _GEN_8493 = canEnqueueVec_0 ? _GEN_6394 : blockSqIdx_14_value; // @[LoadQueueReplay.scala 150:23 362:29]
  wire [3:0] _GEN_8494 = canEnqueueVec_0 ? _GEN_6395 : blockSqIdx_15_value; // @[LoadQueueReplay.scala 150:23 362:29]
  wire [7:0] _GEN_8495 = canEnqueueVec_0 ? _GEN_6396 : replayCarryReg_0_real_way_en; // @[LoadQueueReplay.scala 362:29 164:31]
  wire [7:0] _GEN_8496 = canEnqueueVec_0 ? _GEN_6397 : replayCarryReg_1_real_way_en; // @[LoadQueueReplay.scala 362:29 164:31]
  wire [7:0] _GEN_8497 = canEnqueueVec_0 ? _GEN_6398 : replayCarryReg_2_real_way_en; // @[LoadQueueReplay.scala 362:29 164:31]
  wire [7:0] _GEN_8498 = canEnqueueVec_0 ? _GEN_6399 : replayCarryReg_3_real_way_en; // @[LoadQueueReplay.scala 362:29 164:31]
  wire [7:0] _GEN_8499 = canEnqueueVec_0 ? _GEN_6400 : replayCarryReg_4_real_way_en; // @[LoadQueueReplay.scala 362:29 164:31]
  wire [7:0] _GEN_8500 = canEnqueueVec_0 ? _GEN_6401 : replayCarryReg_5_real_way_en; // @[LoadQueueReplay.scala 362:29 164:31]
  wire [7:0] _GEN_8501 = canEnqueueVec_0 ? _GEN_6402 : replayCarryReg_6_real_way_en; // @[LoadQueueReplay.scala 362:29 164:31]
  wire [7:0] _GEN_8502 = canEnqueueVec_0 ? _GEN_6403 : replayCarryReg_7_real_way_en; // @[LoadQueueReplay.scala 362:29 164:31]
  wire [7:0] _GEN_8503 = canEnqueueVec_0 ? _GEN_6404 : replayCarryReg_8_real_way_en; // @[LoadQueueReplay.scala 362:29 164:31]
  wire [7:0] _GEN_8504 = canEnqueueVec_0 ? _GEN_6405 : replayCarryReg_9_real_way_en; // @[LoadQueueReplay.scala 362:29 164:31]
  wire [7:0] _GEN_8505 = canEnqueueVec_0 ? _GEN_6406 : replayCarryReg_10_real_way_en; // @[LoadQueueReplay.scala 362:29 164:31]
  wire [7:0] _GEN_8506 = canEnqueueVec_0 ? _GEN_6407 : replayCarryReg_11_real_way_en; // @[LoadQueueReplay.scala 362:29 164:31]
  wire [7:0] _GEN_8507 = canEnqueueVec_0 ? _GEN_6408 : replayCarryReg_12_real_way_en; // @[LoadQueueReplay.scala 362:29 164:31]
  wire [7:0] _GEN_8508 = canEnqueueVec_0 ? _GEN_6409 : replayCarryReg_13_real_way_en; // @[LoadQueueReplay.scala 362:29 164:31]
  wire [7:0] _GEN_8509 = canEnqueueVec_0 ? _GEN_6410 : replayCarryReg_14_real_way_en; // @[LoadQueueReplay.scala 362:29 164:31]
  wire [7:0] _GEN_8510 = canEnqueueVec_0 ? _GEN_6411 : replayCarryReg_15_real_way_en; // @[LoadQueueReplay.scala 362:29 164:31]
  wire  _GEN_8511 = canEnqueueVec_0 ? _GEN_6412 : replayCarryReg_0_valid; // @[LoadQueueReplay.scala 362:29 164:31]
  wire  _GEN_8512 = canEnqueueVec_0 ? _GEN_6413 : replayCarryReg_1_valid; // @[LoadQueueReplay.scala 362:29 164:31]
  wire  _GEN_8513 = canEnqueueVec_0 ? _GEN_6414 : replayCarryReg_2_valid; // @[LoadQueueReplay.scala 362:29 164:31]
  wire  _GEN_8514 = canEnqueueVec_0 ? _GEN_6415 : replayCarryReg_3_valid; // @[LoadQueueReplay.scala 362:29 164:31]
  wire  _GEN_8515 = canEnqueueVec_0 ? _GEN_6416 : replayCarryReg_4_valid; // @[LoadQueueReplay.scala 362:29 164:31]
  wire  _GEN_8516 = canEnqueueVec_0 ? _GEN_6417 : replayCarryReg_5_valid; // @[LoadQueueReplay.scala 362:29 164:31]
  wire  _GEN_8517 = canEnqueueVec_0 ? _GEN_6418 : replayCarryReg_6_valid; // @[LoadQueueReplay.scala 362:29 164:31]
  wire  _GEN_8518 = canEnqueueVec_0 ? _GEN_6419 : replayCarryReg_7_valid; // @[LoadQueueReplay.scala 362:29 164:31]
  wire  _GEN_8519 = canEnqueueVec_0 ? _GEN_6420 : replayCarryReg_8_valid; // @[LoadQueueReplay.scala 362:29 164:31]
  wire  _GEN_8520 = canEnqueueVec_0 ? _GEN_6421 : replayCarryReg_9_valid; // @[LoadQueueReplay.scala 362:29 164:31]
  wire  _GEN_8521 = canEnqueueVec_0 ? _GEN_6422 : replayCarryReg_10_valid; // @[LoadQueueReplay.scala 362:29 164:31]
  wire  _GEN_8522 = canEnqueueVec_0 ? _GEN_6423 : replayCarryReg_11_valid; // @[LoadQueueReplay.scala 362:29 164:31]
  wire  _GEN_8523 = canEnqueueVec_0 ? _GEN_6424 : replayCarryReg_12_valid; // @[LoadQueueReplay.scala 362:29 164:31]
  wire  _GEN_8524 = canEnqueueVec_0 ? _GEN_6425 : replayCarryReg_13_valid; // @[LoadQueueReplay.scala 362:29 164:31]
  wire  _GEN_8525 = canEnqueueVec_0 ? _GEN_6426 : replayCarryReg_14_valid; // @[LoadQueueReplay.scala 362:29 164:31]
  wire  _GEN_8526 = canEnqueueVec_0 ? _GEN_6427 : replayCarryReg_15_valid; // @[LoadQueueReplay.scala 362:29 164:31]
  wire [1:0] _GEN_8527 = canEnqueueVec_0 ? _GEN_6428 : missMSHRId_0; // @[LoadQueueReplay.scala 157:27 362:29]
  wire [1:0] _GEN_8528 = canEnqueueVec_0 ? _GEN_6429 : missMSHRId_1; // @[LoadQueueReplay.scala 157:27 362:29]
  wire [1:0] _GEN_8529 = canEnqueueVec_0 ? _GEN_6430 : missMSHRId_2; // @[LoadQueueReplay.scala 157:27 362:29]
  wire [1:0] _GEN_8530 = canEnqueueVec_0 ? _GEN_6431 : missMSHRId_3; // @[LoadQueueReplay.scala 157:27 362:29]
  wire [1:0] _GEN_8531 = canEnqueueVec_0 ? _GEN_6432 : missMSHRId_4; // @[LoadQueueReplay.scala 157:27 362:29]
  wire [1:0] _GEN_8532 = canEnqueueVec_0 ? _GEN_6433 : missMSHRId_5; // @[LoadQueueReplay.scala 157:27 362:29]
  wire [1:0] _GEN_8533 = canEnqueueVec_0 ? _GEN_6434 : missMSHRId_6; // @[LoadQueueReplay.scala 157:27 362:29]
  wire [1:0] _GEN_8534 = canEnqueueVec_0 ? _GEN_6435 : missMSHRId_7; // @[LoadQueueReplay.scala 157:27 362:29]
  wire [1:0] _GEN_8535 = canEnqueueVec_0 ? _GEN_6436 : missMSHRId_8; // @[LoadQueueReplay.scala 157:27 362:29]
  wire [1:0] _GEN_8536 = canEnqueueVec_0 ? _GEN_6437 : missMSHRId_9; // @[LoadQueueReplay.scala 157:27 362:29]
  wire [1:0] _GEN_8537 = canEnqueueVec_0 ? _GEN_6438 : missMSHRId_10; // @[LoadQueueReplay.scala 157:27 362:29]
  wire [1:0] _GEN_8538 = canEnqueueVec_0 ? _GEN_6439 : missMSHRId_11; // @[LoadQueueReplay.scala 157:27 362:29]
  wire [1:0] _GEN_8539 = canEnqueueVec_0 ? _GEN_6440 : missMSHRId_12; // @[LoadQueueReplay.scala 157:27 362:29]
  wire [1:0] _GEN_8540 = canEnqueueVec_0 ? _GEN_6441 : missMSHRId_13; // @[LoadQueueReplay.scala 157:27 362:29]
  wire [1:0] _GEN_8541 = canEnqueueVec_0 ? _GEN_6442 : missMSHRId_14; // @[LoadQueueReplay.scala 157:27 362:29]
  wire [1:0] _GEN_8542 = canEnqueueVec_0 ? _GEN_6443 : missMSHRId_15; // @[LoadQueueReplay.scala 157:27 362:29]
  wire  _GEN_8543 = canEnqueueVec_0 ? _GEN_6476 : flags_0_rarAllocated; // @[LoadQueueReplay.scala 131:18 362:29]
  wire  _GEN_8544 = canEnqueueVec_0 ? _GEN_6477 : flags_1_rarAllocated; // @[LoadQueueReplay.scala 131:18 362:29]
  wire  _GEN_8545 = canEnqueueVec_0 ? _GEN_6478 : flags_2_rarAllocated; // @[LoadQueueReplay.scala 131:18 362:29]
  wire  _GEN_8546 = canEnqueueVec_0 ? _GEN_6479 : flags_3_rarAllocated; // @[LoadQueueReplay.scala 131:18 362:29]
  wire  _GEN_8547 = canEnqueueVec_0 ? _GEN_6480 : flags_4_rarAllocated; // @[LoadQueueReplay.scala 131:18 362:29]
  wire  _GEN_8548 = canEnqueueVec_0 ? _GEN_6481 : flags_5_rarAllocated; // @[LoadQueueReplay.scala 131:18 362:29]
  wire  _GEN_8549 = canEnqueueVec_0 ? _GEN_6482 : flags_6_rarAllocated; // @[LoadQueueReplay.scala 131:18 362:29]
  wire  _GEN_8550 = canEnqueueVec_0 ? _GEN_6483 : flags_7_rarAllocated; // @[LoadQueueReplay.scala 131:18 362:29]
  wire  _GEN_8551 = canEnqueueVec_0 ? _GEN_6484 : flags_8_rarAllocated; // @[LoadQueueReplay.scala 131:18 362:29]
  wire  _GEN_8552 = canEnqueueVec_0 ? _GEN_6485 : flags_9_rarAllocated; // @[LoadQueueReplay.scala 131:18 362:29]
  wire  _GEN_8553 = canEnqueueVec_0 ? _GEN_6486 : flags_10_rarAllocated; // @[LoadQueueReplay.scala 131:18 362:29]
  wire  _GEN_8554 = canEnqueueVec_0 ? _GEN_6487 : flags_11_rarAllocated; // @[LoadQueueReplay.scala 131:18 362:29]
  wire  _GEN_8555 = canEnqueueVec_0 ? _GEN_6488 : flags_12_rarAllocated; // @[LoadQueueReplay.scala 131:18 362:29]
  wire  _GEN_8556 = canEnqueueVec_0 ? _GEN_6489 : flags_13_rarAllocated; // @[LoadQueueReplay.scala 131:18 362:29]
  wire  _GEN_8557 = canEnqueueVec_0 ? _GEN_6490 : flags_14_rarAllocated; // @[LoadQueueReplay.scala 131:18 362:29]
  wire  _GEN_8558 = canEnqueueVec_0 ? _GEN_6491 : flags_15_rarAllocated; // @[LoadQueueReplay.scala 131:18 362:29]
  wire [3:0] _GEN_8559 = canEnqueueVec_0 ? _GEN_6492 : flags_0_rarIndex; // @[LoadQueueReplay.scala 131:18 362:29]
  wire [3:0] _GEN_8560 = canEnqueueVec_0 ? _GEN_6493 : flags_1_rarIndex; // @[LoadQueueReplay.scala 131:18 362:29]
  wire [3:0] _GEN_8561 = canEnqueueVec_0 ? _GEN_6494 : flags_2_rarIndex; // @[LoadQueueReplay.scala 131:18 362:29]
  wire [3:0] _GEN_8562 = canEnqueueVec_0 ? _GEN_6495 : flags_3_rarIndex; // @[LoadQueueReplay.scala 131:18 362:29]
  wire [3:0] _GEN_8563 = canEnqueueVec_0 ? _GEN_6496 : flags_4_rarIndex; // @[LoadQueueReplay.scala 131:18 362:29]
  wire [3:0] _GEN_8564 = canEnqueueVec_0 ? _GEN_6497 : flags_5_rarIndex; // @[LoadQueueReplay.scala 131:18 362:29]
  wire [3:0] _GEN_8565 = canEnqueueVec_0 ? _GEN_6498 : flags_6_rarIndex; // @[LoadQueueReplay.scala 131:18 362:29]
  wire [3:0] _GEN_8566 = canEnqueueVec_0 ? _GEN_6499 : flags_7_rarIndex; // @[LoadQueueReplay.scala 131:18 362:29]
  wire [3:0] _GEN_8567 = canEnqueueVec_0 ? _GEN_6500 : flags_8_rarIndex; // @[LoadQueueReplay.scala 131:18 362:29]
  wire [3:0] _GEN_8568 = canEnqueueVec_0 ? _GEN_6501 : flags_9_rarIndex; // @[LoadQueueReplay.scala 131:18 362:29]
  wire [3:0] _GEN_8569 = canEnqueueVec_0 ? _GEN_6502 : flags_10_rarIndex; // @[LoadQueueReplay.scala 131:18 362:29]
  wire [3:0] _GEN_8570 = canEnqueueVec_0 ? _GEN_6503 : flags_11_rarIndex; // @[LoadQueueReplay.scala 131:18 362:29]
  wire [3:0] _GEN_8571 = canEnqueueVec_0 ? _GEN_6504 : flags_12_rarIndex; // @[LoadQueueReplay.scala 131:18 362:29]
  wire [3:0] _GEN_8572 = canEnqueueVec_0 ? _GEN_6505 : flags_13_rarIndex; // @[LoadQueueReplay.scala 131:18 362:29]
  wire [3:0] _GEN_8573 = canEnqueueVec_0 ? _GEN_6506 : flags_14_rarIndex; // @[LoadQueueReplay.scala 131:18 362:29]
  wire [3:0] _GEN_8574 = canEnqueueVec_0 ? _GEN_6507 : flags_15_rarIndex; // @[LoadQueueReplay.scala 131:18 362:29]
  wire  _GEN_8575 = canEnqueueVec_0 ? _GEN_6508 : flags_0_rawAllocated; // @[LoadQueueReplay.scala 131:18 362:29]
  wire  _GEN_8576 = canEnqueueVec_0 ? _GEN_6509 : flags_1_rawAllocated; // @[LoadQueueReplay.scala 131:18 362:29]
  wire  _GEN_8577 = canEnqueueVec_0 ? _GEN_6510 : flags_2_rawAllocated; // @[LoadQueueReplay.scala 131:18 362:29]
  wire  _GEN_8578 = canEnqueueVec_0 ? _GEN_6511 : flags_3_rawAllocated; // @[LoadQueueReplay.scala 131:18 362:29]
  wire  _GEN_8579 = canEnqueueVec_0 ? _GEN_6512 : flags_4_rawAllocated; // @[LoadQueueReplay.scala 131:18 362:29]
  wire  _GEN_8580 = canEnqueueVec_0 ? _GEN_6513 : flags_5_rawAllocated; // @[LoadQueueReplay.scala 131:18 362:29]
  wire  _GEN_8581 = canEnqueueVec_0 ? _GEN_6514 : flags_6_rawAllocated; // @[LoadQueueReplay.scala 131:18 362:29]
  wire  _GEN_8582 = canEnqueueVec_0 ? _GEN_6515 : flags_7_rawAllocated; // @[LoadQueueReplay.scala 131:18 362:29]
  wire  _GEN_8583 = canEnqueueVec_0 ? _GEN_6516 : flags_8_rawAllocated; // @[LoadQueueReplay.scala 131:18 362:29]
  wire  _GEN_8584 = canEnqueueVec_0 ? _GEN_6517 : flags_9_rawAllocated; // @[LoadQueueReplay.scala 131:18 362:29]
  wire  _GEN_8585 = canEnqueueVec_0 ? _GEN_6518 : flags_10_rawAllocated; // @[LoadQueueReplay.scala 131:18 362:29]
  wire  _GEN_8586 = canEnqueueVec_0 ? _GEN_6519 : flags_11_rawAllocated; // @[LoadQueueReplay.scala 131:18 362:29]
  wire  _GEN_8587 = canEnqueueVec_0 ? _GEN_6520 : flags_12_rawAllocated; // @[LoadQueueReplay.scala 131:18 362:29]
  wire  _GEN_8588 = canEnqueueVec_0 ? _GEN_6521 : flags_13_rawAllocated; // @[LoadQueueReplay.scala 131:18 362:29]
  wire  _GEN_8589 = canEnqueueVec_0 ? _GEN_6522 : flags_14_rawAllocated; // @[LoadQueueReplay.scala 131:18 362:29]
  wire  _GEN_8590 = canEnqueueVec_0 ? _GEN_6523 : flags_15_rawAllocated; // @[LoadQueueReplay.scala 131:18 362:29]
  wire [2:0] _GEN_8591 = canEnqueueVec_0 ? _GEN_6524 : flags_0_rawIndex; // @[LoadQueueReplay.scala 131:18 362:29]
  wire [2:0] _GEN_8592 = canEnqueueVec_0 ? _GEN_6525 : flags_1_rawIndex; // @[LoadQueueReplay.scala 131:18 362:29]
  wire [2:0] _GEN_8593 = canEnqueueVec_0 ? _GEN_6526 : flags_2_rawIndex; // @[LoadQueueReplay.scala 131:18 362:29]
  wire [2:0] _GEN_8594 = canEnqueueVec_0 ? _GEN_6527 : flags_3_rawIndex; // @[LoadQueueReplay.scala 131:18 362:29]
  wire [2:0] _GEN_8595 = canEnqueueVec_0 ? _GEN_6528 : flags_4_rawIndex; // @[LoadQueueReplay.scala 131:18 362:29]
  wire [2:0] _GEN_8596 = canEnqueueVec_0 ? _GEN_6529 : flags_5_rawIndex; // @[LoadQueueReplay.scala 131:18 362:29]
  wire [2:0] _GEN_8597 = canEnqueueVec_0 ? _GEN_6530 : flags_6_rawIndex; // @[LoadQueueReplay.scala 131:18 362:29]
  wire [2:0] _GEN_8598 = canEnqueueVec_0 ? _GEN_6531 : flags_7_rawIndex; // @[LoadQueueReplay.scala 131:18 362:29]
  wire [2:0] _GEN_8599 = canEnqueueVec_0 ? _GEN_6532 : flags_8_rawIndex; // @[LoadQueueReplay.scala 131:18 362:29]
  wire [2:0] _GEN_8600 = canEnqueueVec_0 ? _GEN_6533 : flags_9_rawIndex; // @[LoadQueueReplay.scala 131:18 362:29]
  wire [2:0] _GEN_8601 = canEnqueueVec_0 ? _GEN_6534 : flags_10_rawIndex; // @[LoadQueueReplay.scala 131:18 362:29]
  wire [2:0] _GEN_8602 = canEnqueueVec_0 ? _GEN_6535 : flags_11_rawIndex; // @[LoadQueueReplay.scala 131:18 362:29]
  wire [2:0] _GEN_8603 = canEnqueueVec_0 ? _GEN_6536 : flags_12_rawIndex; // @[LoadQueueReplay.scala 131:18 362:29]
  wire [2:0] _GEN_8604 = canEnqueueVec_0 ? _GEN_6537 : flags_13_rawIndex; // @[LoadQueueReplay.scala 131:18 362:29]
  wire [2:0] _GEN_8605 = canEnqueueVec_0 ? _GEN_6538 : flags_14_rawIndex; // @[LoadQueueReplay.scala 131:18 362:29]
  wire [2:0] _GEN_8606 = canEnqueueVec_0 ? _GEN_6539 : flags_15_rawIndex; // @[LoadQueueReplay.scala 131:18 362:29]
  wire [4:0] _GEN_8607 = canEnqueueVec_0 ? _GEN_6540 : _blockCounter_0_T_8; // @[LoadQueueReplay.scala 266:21 362:29]
  wire [4:0] _GEN_8608 = canEnqueueVec_0 ? _GEN_6541 : _blockCounter_1_T_8; // @[LoadQueueReplay.scala 266:21 362:29]
  wire [4:0] _GEN_8609 = canEnqueueVec_0 ? _GEN_6542 : _blockCounter_2_T_8; // @[LoadQueueReplay.scala 266:21 362:29]
  wire [4:0] _GEN_8610 = canEnqueueVec_0 ? _GEN_6543 : _blockCounter_3_T_8; // @[LoadQueueReplay.scala 266:21 362:29]
  wire [4:0] _GEN_8611 = canEnqueueVec_0 ? _GEN_6544 : _blockCounter_4_T_8; // @[LoadQueueReplay.scala 266:21 362:29]
  wire [4:0] _GEN_8612 = canEnqueueVec_0 ? _GEN_6545 : _blockCounter_5_T_8; // @[LoadQueueReplay.scala 266:21 362:29]
  wire [4:0] _GEN_8613 = canEnqueueVec_0 ? _GEN_6546 : _blockCounter_6_T_8; // @[LoadQueueReplay.scala 266:21 362:29]
  wire [4:0] _GEN_8614 = canEnqueueVec_0 ? _GEN_6547 : _blockCounter_7_T_8; // @[LoadQueueReplay.scala 266:21 362:29]
  wire [4:0] _GEN_8615 = canEnqueueVec_0 ? _GEN_6548 : _blockCounter_8_T_8; // @[LoadQueueReplay.scala 266:21 362:29]
  wire [4:0] _GEN_8616 = canEnqueueVec_0 ? _GEN_6549 : _blockCounter_9_T_8; // @[LoadQueueReplay.scala 266:21 362:29]
  wire [4:0] _GEN_8617 = canEnqueueVec_0 ? _GEN_6550 : _blockCounter_10_T_8; // @[LoadQueueReplay.scala 266:21 362:29]
  wire [4:0] _GEN_8618 = canEnqueueVec_0 ? _GEN_6551 : _blockCounter_11_T_8; // @[LoadQueueReplay.scala 266:21 362:29]
  wire [4:0] _GEN_8619 = canEnqueueVec_0 ? _GEN_6552 : _blockCounter_12_T_8; // @[LoadQueueReplay.scala 266:21 362:29]
  wire [4:0] _GEN_8620 = canEnqueueVec_0 ? _GEN_6553 : _blockCounter_13_T_8; // @[LoadQueueReplay.scala 266:21 362:29]
  wire [4:0] _GEN_8621 = canEnqueueVec_0 ? _GEN_6554 : _blockCounter_14_T_8; // @[LoadQueueReplay.scala 266:21 362:29]
  wire [4:0] _GEN_8622 = canEnqueueVec_0 ? _GEN_6555 : _blockCounter_15_T_8; // @[LoadQueueReplay.scala 266:21 362:29]
  wire  _GEN_13407 = 4'h0 == enqIdx_1; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_8639 = 4'h0 == enqIdx_1 | _GEN_6556; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_13408 = 4'h1 == enqIdx_1; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_8640 = 4'h1 == enqIdx_1 | _GEN_6557; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_13409 = 4'h2 == enqIdx_1; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_8641 = 4'h2 == enqIdx_1 | _GEN_6558; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_13410 = 4'h3 == enqIdx_1; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_8642 = 4'h3 == enqIdx_1 | _GEN_6559; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_13411 = 4'h4 == enqIdx_1; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_8643 = 4'h4 == enqIdx_1 | _GEN_6560; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_13412 = 4'h5 == enqIdx_1; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_8644 = 4'h5 == enqIdx_1 | _GEN_6561; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_13413 = 4'h6 == enqIdx_1; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_8645 = 4'h6 == enqIdx_1 | _GEN_6562; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_13414 = 4'h7 == enqIdx_1; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_8646 = 4'h7 == enqIdx_1 | _GEN_6563; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_13415 = 4'h8 == enqIdx_1; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_8647 = 4'h8 == enqIdx_1 | _GEN_6564; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_13416 = 4'h9 == enqIdx_1; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_8648 = 4'h9 == enqIdx_1 | _GEN_6565; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_13417 = 4'ha == enqIdx_1; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_8649 = 4'ha == enqIdx_1 | _GEN_6566; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_13418 = 4'hb == enqIdx_1; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_8650 = 4'hb == enqIdx_1 | _GEN_6567; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_13419 = 4'hc == enqIdx_1; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_8651 = 4'hc == enqIdx_1 | _GEN_6568; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_13420 = 4'hd == enqIdx_1; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_8652 = 4'hd == enqIdx_1 | _GEN_6569; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_13421 = 4'he == enqIdx_1; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_8653 = 4'he == enqIdx_1 | _GEN_6570; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_13422 = 4'hf == enqIdx_1; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_8654 = 4'hf == enqIdx_1 | _GEN_6571; // @[LoadQueueReplay.scala 366:{25,25}]
  wire  _GEN_10439 = 4'h0 == enqIdx_1 ? 1'h0 : _GEN_8335; // @[LoadQueueReplay.scala 384:{30,30}]
  wire  _GEN_10440 = 4'h1 == enqIdx_1 ? 1'h0 : _GEN_8336; // @[LoadQueueReplay.scala 384:{30,30}]
  wire  _GEN_10441 = 4'h2 == enqIdx_1 ? 1'h0 : _GEN_8337; // @[LoadQueueReplay.scala 384:{30,30}]
  wire  _GEN_10442 = 4'h3 == enqIdx_1 ? 1'h0 : _GEN_8338; // @[LoadQueueReplay.scala 384:{30,30}]
  wire  _GEN_10443 = 4'h4 == enqIdx_1 ? 1'h0 : _GEN_8339; // @[LoadQueueReplay.scala 384:{30,30}]
  wire  _GEN_10444 = 4'h5 == enqIdx_1 ? 1'h0 : _GEN_8340; // @[LoadQueueReplay.scala 384:{30,30}]
  wire  _GEN_10445 = 4'h6 == enqIdx_1 ? 1'h0 : _GEN_8341; // @[LoadQueueReplay.scala 384:{30,30}]
  wire  _GEN_10446 = 4'h7 == enqIdx_1 ? 1'h0 : _GEN_8342; // @[LoadQueueReplay.scala 384:{30,30}]
  wire  _GEN_10447 = 4'h8 == enqIdx_1 ? 1'h0 : _GEN_8343; // @[LoadQueueReplay.scala 384:{30,30}]
  wire  _GEN_10448 = 4'h9 == enqIdx_1 ? 1'h0 : _GEN_8344; // @[LoadQueueReplay.scala 384:{30,30}]
  wire  _GEN_10449 = 4'ha == enqIdx_1 ? 1'h0 : _GEN_8345; // @[LoadQueueReplay.scala 384:{30,30}]
  wire  _GEN_10450 = 4'hb == enqIdx_1 ? 1'h0 : _GEN_8346; // @[LoadQueueReplay.scala 384:{30,30}]
  wire  _GEN_10451 = 4'hc == enqIdx_1 ? 1'h0 : _GEN_8347; // @[LoadQueueReplay.scala 384:{30,30}]
  wire  _GEN_10452 = 4'hd == enqIdx_1 ? 1'h0 : _GEN_8348; // @[LoadQueueReplay.scala 384:{30,30}]
  wire  _GEN_10453 = 4'he == enqIdx_1 ? 1'h0 : _GEN_8349; // @[LoadQueueReplay.scala 384:{30,30}]
  wire  _GEN_10454 = 4'hf == enqIdx_1 ? 1'h0 : _GEN_8350; // @[LoadQueueReplay.scala 384:{30,30}]
  wire  _GEN_10455 = 4'h0 == enqIdx_1 ? 1'h0 : _GEN_8351; // @[LoadQueueReplay.scala 385:{32,32}]
  wire  _GEN_10456 = 4'h1 == enqIdx_1 ? 1'h0 : _GEN_8352; // @[LoadQueueReplay.scala 385:{32,32}]
  wire  _GEN_10457 = 4'h2 == enqIdx_1 ? 1'h0 : _GEN_8353; // @[LoadQueueReplay.scala 385:{32,32}]
  wire  _GEN_10458 = 4'h3 == enqIdx_1 ? 1'h0 : _GEN_8354; // @[LoadQueueReplay.scala 385:{32,32}]
  wire  _GEN_10459 = 4'h4 == enqIdx_1 ? 1'h0 : _GEN_8355; // @[LoadQueueReplay.scala 385:{32,32}]
  wire  _GEN_10460 = 4'h5 == enqIdx_1 ? 1'h0 : _GEN_8356; // @[LoadQueueReplay.scala 385:{32,32}]
  wire  _GEN_10461 = 4'h6 == enqIdx_1 ? 1'h0 : _GEN_8357; // @[LoadQueueReplay.scala 385:{32,32}]
  wire  _GEN_10462 = 4'h7 == enqIdx_1 ? 1'h0 : _GEN_8358; // @[LoadQueueReplay.scala 385:{32,32}]
  wire  _GEN_10463 = 4'h8 == enqIdx_1 ? 1'h0 : _GEN_8359; // @[LoadQueueReplay.scala 385:{32,32}]
  wire  _GEN_10464 = 4'h9 == enqIdx_1 ? 1'h0 : _GEN_8360; // @[LoadQueueReplay.scala 385:{32,32}]
  wire  _GEN_10465 = 4'ha == enqIdx_1 ? 1'h0 : _GEN_8361; // @[LoadQueueReplay.scala 385:{32,32}]
  wire  _GEN_10466 = 4'hb == enqIdx_1 ? 1'h0 : _GEN_8362; // @[LoadQueueReplay.scala 385:{32,32}]
  wire  _GEN_10467 = 4'hc == enqIdx_1 ? 1'h0 : _GEN_8363; // @[LoadQueueReplay.scala 385:{32,32}]
  wire  _GEN_10468 = 4'hd == enqIdx_1 ? 1'h0 : _GEN_8364; // @[LoadQueueReplay.scala 385:{32,32}]
  wire  _GEN_10469 = 4'he == enqIdx_1 ? 1'h0 : _GEN_8365; // @[LoadQueueReplay.scala 385:{32,32}]
  wire  _GEN_10470 = 4'hf == enqIdx_1 ? 1'h0 : _GEN_8366; // @[LoadQueueReplay.scala 385:{32,32}]
  wire  _GEN_10471 = 4'h0 == enqIdx_1 ? 1'h0 : _GEN_8367; // @[LoadQueueReplay.scala 386:{34,34}]
  wire  _GEN_10472 = 4'h1 == enqIdx_1 ? 1'h0 : _GEN_8368; // @[LoadQueueReplay.scala 386:{34,34}]
  wire  _GEN_10473 = 4'h2 == enqIdx_1 ? 1'h0 : _GEN_8369; // @[LoadQueueReplay.scala 386:{34,34}]
  wire  _GEN_10474 = 4'h3 == enqIdx_1 ? 1'h0 : _GEN_8370; // @[LoadQueueReplay.scala 386:{34,34}]
  wire  _GEN_10475 = 4'h4 == enqIdx_1 ? 1'h0 : _GEN_8371; // @[LoadQueueReplay.scala 386:{34,34}]
  wire  _GEN_10476 = 4'h5 == enqIdx_1 ? 1'h0 : _GEN_8372; // @[LoadQueueReplay.scala 386:{34,34}]
  wire  _GEN_10477 = 4'h6 == enqIdx_1 ? 1'h0 : _GEN_8373; // @[LoadQueueReplay.scala 386:{34,34}]
  wire  _GEN_10478 = 4'h7 == enqIdx_1 ? 1'h0 : _GEN_8374; // @[LoadQueueReplay.scala 386:{34,34}]
  wire  _GEN_10479 = 4'h8 == enqIdx_1 ? 1'h0 : _GEN_8375; // @[LoadQueueReplay.scala 386:{34,34}]
  wire  _GEN_10480 = 4'h9 == enqIdx_1 ? 1'h0 : _GEN_8376; // @[LoadQueueReplay.scala 386:{34,34}]
  wire  _GEN_10481 = 4'ha == enqIdx_1 ? 1'h0 : _GEN_8377; // @[LoadQueueReplay.scala 386:{34,34}]
  wire  _GEN_10482 = 4'hb == enqIdx_1 ? 1'h0 : _GEN_8378; // @[LoadQueueReplay.scala 386:{34,34}]
  wire  _GEN_10483 = 4'hc == enqIdx_1 ? 1'h0 : _GEN_8379; // @[LoadQueueReplay.scala 386:{34,34}]
  wire  _GEN_10484 = 4'hd == enqIdx_1 ? 1'h0 : _GEN_8380; // @[LoadQueueReplay.scala 386:{34,34}]
  wire  _GEN_10485 = 4'he == enqIdx_1 ? 1'h0 : _GEN_8381; // @[LoadQueueReplay.scala 386:{34,34}]
  wire  _GEN_10486 = 4'hf == enqIdx_1 ? 1'h0 : _GEN_8382; // @[LoadQueueReplay.scala 386:{34,34}]
  wire  _GEN_10503 = 4'h0 == enqIdx_1 ? 1'h0 : _GEN_8399; // @[LoadQueueReplay.scala 388:{29,29}]
  wire  _GEN_10504 = 4'h1 == enqIdx_1 ? 1'h0 : _GEN_8400; // @[LoadQueueReplay.scala 388:{29,29}]
  wire  _GEN_10505 = 4'h2 == enqIdx_1 ? 1'h0 : _GEN_8401; // @[LoadQueueReplay.scala 388:{29,29}]
  wire  _GEN_10506 = 4'h3 == enqIdx_1 ? 1'h0 : _GEN_8402; // @[LoadQueueReplay.scala 388:{29,29}]
  wire  _GEN_10507 = 4'h4 == enqIdx_1 ? 1'h0 : _GEN_8403; // @[LoadQueueReplay.scala 388:{29,29}]
  wire  _GEN_10508 = 4'h5 == enqIdx_1 ? 1'h0 : _GEN_8404; // @[LoadQueueReplay.scala 388:{29,29}]
  wire  _GEN_10509 = 4'h6 == enqIdx_1 ? 1'h0 : _GEN_8405; // @[LoadQueueReplay.scala 388:{29,29}]
  wire  _GEN_10510 = 4'h7 == enqIdx_1 ? 1'h0 : _GEN_8406; // @[LoadQueueReplay.scala 388:{29,29}]
  wire  _GEN_10511 = 4'h8 == enqIdx_1 ? 1'h0 : _GEN_8407; // @[LoadQueueReplay.scala 388:{29,29}]
  wire  _GEN_10512 = 4'h9 == enqIdx_1 ? 1'h0 : _GEN_8408; // @[LoadQueueReplay.scala 388:{29,29}]
  wire  _GEN_10513 = 4'ha == enqIdx_1 ? 1'h0 : _GEN_8409; // @[LoadQueueReplay.scala 388:{29,29}]
  wire  _GEN_10514 = 4'hb == enqIdx_1 ? 1'h0 : _GEN_8410; // @[LoadQueueReplay.scala 388:{29,29}]
  wire  _GEN_10515 = 4'hc == enqIdx_1 ? 1'h0 : _GEN_8411; // @[LoadQueueReplay.scala 388:{29,29}]
  wire  _GEN_10516 = 4'hd == enqIdx_1 ? 1'h0 : _GEN_8412; // @[LoadQueueReplay.scala 388:{29,29}]
  wire  _GEN_10517 = 4'he == enqIdx_1 ? 1'h0 : _GEN_8413; // @[LoadQueueReplay.scala 388:{29,29}]
  wire  _GEN_10518 = 4'hf == enqIdx_1 ? 1'h0 : _GEN_8414; // @[LoadQueueReplay.scala 388:{29,29}]
  wire  _GEN_10519 = _GEN_13407 | _GEN_10439; // @[LoadQueueReplay.scala 393:{32,32}]
  wire  _GEN_10520 = _GEN_13408 | _GEN_10440; // @[LoadQueueReplay.scala 393:{32,32}]
  wire  _GEN_10521 = _GEN_13409 | _GEN_10441; // @[LoadQueueReplay.scala 393:{32,32}]
  wire  _GEN_10522 = _GEN_13410 | _GEN_10442; // @[LoadQueueReplay.scala 393:{32,32}]
  wire  _GEN_10523 = _GEN_13411 | _GEN_10443; // @[LoadQueueReplay.scala 393:{32,32}]
  wire  _GEN_10524 = _GEN_13412 | _GEN_10444; // @[LoadQueueReplay.scala 393:{32,32}]
  wire  _GEN_10525 = _GEN_13413 | _GEN_10445; // @[LoadQueueReplay.scala 393:{32,32}]
  wire  _GEN_10526 = _GEN_13414 | _GEN_10446; // @[LoadQueueReplay.scala 393:{32,32}]
  wire  _GEN_10527 = _GEN_13415 | _GEN_10447; // @[LoadQueueReplay.scala 393:{32,32}]
  wire  _GEN_10528 = _GEN_13416 | _GEN_10448; // @[LoadQueueReplay.scala 393:{32,32}]
  wire  _GEN_10529 = _GEN_13417 | _GEN_10449; // @[LoadQueueReplay.scala 393:{32,32}]
  wire  _GEN_10530 = _GEN_13418 | _GEN_10450; // @[LoadQueueReplay.scala 393:{32,32}]
  wire  _GEN_10531 = _GEN_13419 | _GEN_10451; // @[LoadQueueReplay.scala 393:{32,32}]
  wire  _GEN_10532 = _GEN_13420 | _GEN_10452; // @[LoadQueueReplay.scala 393:{32,32}]
  wire  _GEN_10533 = _GEN_13421 | _GEN_10453; // @[LoadQueueReplay.scala 393:{32,32}]
  wire  _GEN_10534 = _GEN_13422 | _GEN_10454; // @[LoadQueueReplay.scala 393:{32,32}]
  wire  _GEN_10599 = _GEN_13407 | _GEN_10503; // @[LoadQueueReplay.scala 399:{31,31}]
  wire  _GEN_10600 = _GEN_13408 | _GEN_10504; // @[LoadQueueReplay.scala 399:{31,31}]
  wire  _GEN_10601 = _GEN_13409 | _GEN_10505; // @[LoadQueueReplay.scala 399:{31,31}]
  wire  _GEN_10602 = _GEN_13410 | _GEN_10506; // @[LoadQueueReplay.scala 399:{31,31}]
  wire  _GEN_10603 = _GEN_13411 | _GEN_10507; // @[LoadQueueReplay.scala 399:{31,31}]
  wire  _GEN_10604 = _GEN_13412 | _GEN_10508; // @[LoadQueueReplay.scala 399:{31,31}]
  wire  _GEN_10605 = _GEN_13413 | _GEN_10509; // @[LoadQueueReplay.scala 399:{31,31}]
  wire  _GEN_10606 = _GEN_13414 | _GEN_10510; // @[LoadQueueReplay.scala 399:{31,31}]
  wire  _GEN_10607 = _GEN_13415 | _GEN_10511; // @[LoadQueueReplay.scala 399:{31,31}]
  wire  _GEN_10608 = _GEN_13416 | _GEN_10512; // @[LoadQueueReplay.scala 399:{31,31}]
  wire  _GEN_10609 = _GEN_13417 | _GEN_10513; // @[LoadQueueReplay.scala 399:{31,31}]
  wire  _GEN_10610 = _GEN_13418 | _GEN_10514; // @[LoadQueueReplay.scala 399:{31,31}]
  wire  _GEN_10611 = _GEN_13419 | _GEN_10515; // @[LoadQueueReplay.scala 399:{31,31}]
  wire  _GEN_10612 = _GEN_13420 | _GEN_10516; // @[LoadQueueReplay.scala 399:{31,31}]
  wire  _GEN_10613 = _GEN_13421 | _GEN_10517; // @[LoadQueueReplay.scala 399:{31,31}]
  wire  _GEN_10614 = _GEN_13422 | _GEN_10518; // @[LoadQueueReplay.scala 399:{31,31}]
  wire  _blockPtrOthers_T_8 = _GEN_10418 == 2'h3; // @[LoadQueueReplay.scala 400:87]
  wire  _blockPtrOthers_T_9 = _GEN_10418 == 2'h3 ? 1'h0 : 1'h1; // @[LoadQueueReplay.scala 400:63]
  wire [1:0] _GEN_13457 = {{1'd0}, _blockPtrOthers_T_9}; // @[LoadQueueReplay.scala 400:58]
  wire [1:0] _blockPtrOthers_T_11 = _GEN_10418 + _GEN_13457; // @[LoadQueueReplay.scala 400:58]
  wire [1:0] _GEN_10615 = 4'h0 == enqIdx_1 ? _blockPtrOthers_T_11 : _GEN_8447; // @[LoadQueueReplay.scala 400:{32,32}]
  wire [1:0] _GEN_10616 = 4'h1 == enqIdx_1 ? _blockPtrOthers_T_11 : _GEN_8448; // @[LoadQueueReplay.scala 400:{32,32}]
  wire [1:0] _GEN_10617 = 4'h2 == enqIdx_1 ? _blockPtrOthers_T_11 : _GEN_8449; // @[LoadQueueReplay.scala 400:{32,32}]
  wire [1:0] _GEN_10618 = 4'h3 == enqIdx_1 ? _blockPtrOthers_T_11 : _GEN_8450; // @[LoadQueueReplay.scala 400:{32,32}]
  wire [1:0] _GEN_10619 = 4'h4 == enqIdx_1 ? _blockPtrOthers_T_11 : _GEN_8451; // @[LoadQueueReplay.scala 400:{32,32}]
  wire [1:0] _GEN_10620 = 4'h5 == enqIdx_1 ? _blockPtrOthers_T_11 : _GEN_8452; // @[LoadQueueReplay.scala 400:{32,32}]
  wire [1:0] _GEN_10621 = 4'h6 == enqIdx_1 ? _blockPtrOthers_T_11 : _GEN_8453; // @[LoadQueueReplay.scala 400:{32,32}]
  wire [1:0] _GEN_10622 = 4'h7 == enqIdx_1 ? _blockPtrOthers_T_11 : _GEN_8454; // @[LoadQueueReplay.scala 400:{32,32}]
  wire [1:0] _GEN_10623 = 4'h8 == enqIdx_1 ? _blockPtrOthers_T_11 : _GEN_8455; // @[LoadQueueReplay.scala 400:{32,32}]
  wire [1:0] _GEN_10624 = 4'h9 == enqIdx_1 ? _blockPtrOthers_T_11 : _GEN_8456; // @[LoadQueueReplay.scala 400:{32,32}]
  wire [1:0] _GEN_10625 = 4'ha == enqIdx_1 ? _blockPtrOthers_T_11 : _GEN_8457; // @[LoadQueueReplay.scala 400:{32,32}]
  wire [1:0] _GEN_10626 = 4'hb == enqIdx_1 ? _blockPtrOthers_T_11 : _GEN_8458; // @[LoadQueueReplay.scala 400:{32,32}]
  wire [1:0] _GEN_10627 = 4'hc == enqIdx_1 ? _blockPtrOthers_T_11 : _GEN_8459; // @[LoadQueueReplay.scala 400:{32,32}]
  wire [1:0] _GEN_10628 = 4'hd == enqIdx_1 ? _blockPtrOthers_T_11 : _GEN_8460; // @[LoadQueueReplay.scala 400:{32,32}]
  wire [1:0] _GEN_10629 = 4'he == enqIdx_1 ? _blockPtrOthers_T_11 : _GEN_8461; // @[LoadQueueReplay.scala 400:{32,32}]
  wire [1:0] _GEN_10630 = 4'hf == enqIdx_1 ? _blockPtrOthers_T_11 : _GEN_8462; // @[LoadQueueReplay.scala 400:{32,32}]
  wire [1:0] _blockPtrOthers_T_14 = _GEN_10418 + 2'h1; // @[LoadQueueReplay.scala 403:123]
  wire [1:0] _blockPtrOthers_T_15 = _blockPtrOthers_T_8 ? _GEN_10418 : _blockPtrOthers_T_14; // @[LoadQueueReplay.scala 403:38]
  wire [1:0] _GEN_10647 = 4'h0 == enqIdx_1 ? _blockPtrOthers_T_15 : _GEN_8447; // @[LoadQueueReplay.scala 403:{32,32}]
  wire [1:0] _GEN_10648 = 4'h1 == enqIdx_1 ? _blockPtrOthers_T_15 : _GEN_8448; // @[LoadQueueReplay.scala 403:{32,32}]
  wire [1:0] _GEN_10649 = 4'h2 == enqIdx_1 ? _blockPtrOthers_T_15 : _GEN_8449; // @[LoadQueueReplay.scala 403:{32,32}]
  wire [1:0] _GEN_10650 = 4'h3 == enqIdx_1 ? _blockPtrOthers_T_15 : _GEN_8450; // @[LoadQueueReplay.scala 403:{32,32}]
  wire [1:0] _GEN_10651 = 4'h4 == enqIdx_1 ? _blockPtrOthers_T_15 : _GEN_8451; // @[LoadQueueReplay.scala 403:{32,32}]
  wire [1:0] _GEN_10652 = 4'h5 == enqIdx_1 ? _blockPtrOthers_T_15 : _GEN_8452; // @[LoadQueueReplay.scala 403:{32,32}]
  wire [1:0] _GEN_10653 = 4'h6 == enqIdx_1 ? _blockPtrOthers_T_15 : _GEN_8453; // @[LoadQueueReplay.scala 403:{32,32}]
  wire [1:0] _GEN_10654 = 4'h7 == enqIdx_1 ? _blockPtrOthers_T_15 : _GEN_8454; // @[LoadQueueReplay.scala 403:{32,32}]
  wire [1:0] _GEN_10655 = 4'h8 == enqIdx_1 ? _blockPtrOthers_T_15 : _GEN_8455; // @[LoadQueueReplay.scala 403:{32,32}]
  wire [1:0] _GEN_10656 = 4'h9 == enqIdx_1 ? _blockPtrOthers_T_15 : _GEN_8456; // @[LoadQueueReplay.scala 403:{32,32}]
  wire [1:0] _GEN_10657 = 4'ha == enqIdx_1 ? _blockPtrOthers_T_15 : _GEN_8457; // @[LoadQueueReplay.scala 403:{32,32}]
  wire [1:0] _GEN_10658 = 4'hb == enqIdx_1 ? _blockPtrOthers_T_15 : _GEN_8458; // @[LoadQueueReplay.scala 403:{32,32}]
  wire [1:0] _GEN_10659 = 4'hc == enqIdx_1 ? _blockPtrOthers_T_15 : _GEN_8459; // @[LoadQueueReplay.scala 403:{32,32}]
  wire [1:0] _GEN_10660 = 4'hd == enqIdx_1 ? _blockPtrOthers_T_15 : _GEN_8460; // @[LoadQueueReplay.scala 403:{32,32}]
  wire [1:0] _GEN_10661 = 4'he == enqIdx_1 ? _blockPtrOthers_T_15 : _GEN_8461; // @[LoadQueueReplay.scala 403:{32,32}]
  wire [1:0] _GEN_10662 = 4'hf == enqIdx_1 ? _blockPtrOthers_T_15 : _GEN_8462; // @[LoadQueueReplay.scala 403:{32,32}]
  wire  _GEN_10663 = io_enq_1_bits_replayInfo_cause_4 | io_enq_1_bits_replayInfo_cause_2 |
    io_enq_1_bits_replayInfo_cause_3 ? _GEN_10599 : _GEN_10503; // @[LoadQueueReplay.scala 401:166]
  wire  _GEN_10664 = io_enq_1_bits_replayInfo_cause_4 | io_enq_1_bits_replayInfo_cause_2 |
    io_enq_1_bits_replayInfo_cause_3 ? _GEN_10600 : _GEN_10504; // @[LoadQueueReplay.scala 401:166]
  wire  _GEN_10665 = io_enq_1_bits_replayInfo_cause_4 | io_enq_1_bits_replayInfo_cause_2 |
    io_enq_1_bits_replayInfo_cause_3 ? _GEN_10601 : _GEN_10505; // @[LoadQueueReplay.scala 401:166]
  wire  _GEN_10666 = io_enq_1_bits_replayInfo_cause_4 | io_enq_1_bits_replayInfo_cause_2 |
    io_enq_1_bits_replayInfo_cause_3 ? _GEN_10602 : _GEN_10506; // @[LoadQueueReplay.scala 401:166]
  wire  _GEN_10667 = io_enq_1_bits_replayInfo_cause_4 | io_enq_1_bits_replayInfo_cause_2 |
    io_enq_1_bits_replayInfo_cause_3 ? _GEN_10603 : _GEN_10507; // @[LoadQueueReplay.scala 401:166]
  wire  _GEN_10668 = io_enq_1_bits_replayInfo_cause_4 | io_enq_1_bits_replayInfo_cause_2 |
    io_enq_1_bits_replayInfo_cause_3 ? _GEN_10604 : _GEN_10508; // @[LoadQueueReplay.scala 401:166]
  wire  _GEN_10669 = io_enq_1_bits_replayInfo_cause_4 | io_enq_1_bits_replayInfo_cause_2 |
    io_enq_1_bits_replayInfo_cause_3 ? _GEN_10605 : _GEN_10509; // @[LoadQueueReplay.scala 401:166]
  wire  _GEN_10670 = io_enq_1_bits_replayInfo_cause_4 | io_enq_1_bits_replayInfo_cause_2 |
    io_enq_1_bits_replayInfo_cause_3 ? _GEN_10606 : _GEN_10510; // @[LoadQueueReplay.scala 401:166]
  wire  _GEN_10671 = io_enq_1_bits_replayInfo_cause_4 | io_enq_1_bits_replayInfo_cause_2 |
    io_enq_1_bits_replayInfo_cause_3 ? _GEN_10607 : _GEN_10511; // @[LoadQueueReplay.scala 401:166]
  wire  _GEN_10672 = io_enq_1_bits_replayInfo_cause_4 | io_enq_1_bits_replayInfo_cause_2 |
    io_enq_1_bits_replayInfo_cause_3 ? _GEN_10608 : _GEN_10512; // @[LoadQueueReplay.scala 401:166]
  wire  _GEN_10673 = io_enq_1_bits_replayInfo_cause_4 | io_enq_1_bits_replayInfo_cause_2 |
    io_enq_1_bits_replayInfo_cause_3 ? _GEN_10609 : _GEN_10513; // @[LoadQueueReplay.scala 401:166]
  wire  _GEN_10674 = io_enq_1_bits_replayInfo_cause_4 | io_enq_1_bits_replayInfo_cause_2 |
    io_enq_1_bits_replayInfo_cause_3 ? _GEN_10610 : _GEN_10514; // @[LoadQueueReplay.scala 401:166]
  wire  _GEN_10675 = io_enq_1_bits_replayInfo_cause_4 | io_enq_1_bits_replayInfo_cause_2 |
    io_enq_1_bits_replayInfo_cause_3 ? _GEN_10611 : _GEN_10515; // @[LoadQueueReplay.scala 401:166]
  wire  _GEN_10676 = io_enq_1_bits_replayInfo_cause_4 | io_enq_1_bits_replayInfo_cause_2 |
    io_enq_1_bits_replayInfo_cause_3 ? _GEN_10612 : _GEN_10516; // @[LoadQueueReplay.scala 401:166]
  wire  _GEN_10677 = io_enq_1_bits_replayInfo_cause_4 | io_enq_1_bits_replayInfo_cause_2 |
    io_enq_1_bits_replayInfo_cause_3 ? _GEN_10613 : _GEN_10517; // @[LoadQueueReplay.scala 401:166]
  wire  _GEN_10678 = io_enq_1_bits_replayInfo_cause_4 | io_enq_1_bits_replayInfo_cause_2 |
    io_enq_1_bits_replayInfo_cause_3 ? _GEN_10614 : _GEN_10518; // @[LoadQueueReplay.scala 401:166]
  wire [1:0] _GEN_10679 = io_enq_1_bits_replayInfo_cause_4 | io_enq_1_bits_replayInfo_cause_2 |
    io_enq_1_bits_replayInfo_cause_3 ? _GEN_10647 : _GEN_8447; // @[LoadQueueReplay.scala 401:166]
  wire [1:0] _GEN_10680 = io_enq_1_bits_replayInfo_cause_4 | io_enq_1_bits_replayInfo_cause_2 |
    io_enq_1_bits_replayInfo_cause_3 ? _GEN_10648 : _GEN_8448; // @[LoadQueueReplay.scala 401:166]
  wire [1:0] _GEN_10681 = io_enq_1_bits_replayInfo_cause_4 | io_enq_1_bits_replayInfo_cause_2 |
    io_enq_1_bits_replayInfo_cause_3 ? _GEN_10649 : _GEN_8449; // @[LoadQueueReplay.scala 401:166]
  wire [1:0] _GEN_10682 = io_enq_1_bits_replayInfo_cause_4 | io_enq_1_bits_replayInfo_cause_2 |
    io_enq_1_bits_replayInfo_cause_3 ? _GEN_10650 : _GEN_8450; // @[LoadQueueReplay.scala 401:166]
  wire [1:0] _GEN_10683 = io_enq_1_bits_replayInfo_cause_4 | io_enq_1_bits_replayInfo_cause_2 |
    io_enq_1_bits_replayInfo_cause_3 ? _GEN_10651 : _GEN_8451; // @[LoadQueueReplay.scala 401:166]
  wire [1:0] _GEN_10684 = io_enq_1_bits_replayInfo_cause_4 | io_enq_1_bits_replayInfo_cause_2 |
    io_enq_1_bits_replayInfo_cause_3 ? _GEN_10652 : _GEN_8452; // @[LoadQueueReplay.scala 401:166]
  wire [1:0] _GEN_10685 = io_enq_1_bits_replayInfo_cause_4 | io_enq_1_bits_replayInfo_cause_2 |
    io_enq_1_bits_replayInfo_cause_3 ? _GEN_10653 : _GEN_8453; // @[LoadQueueReplay.scala 401:166]
  wire [1:0] _GEN_10686 = io_enq_1_bits_replayInfo_cause_4 | io_enq_1_bits_replayInfo_cause_2 |
    io_enq_1_bits_replayInfo_cause_3 ? _GEN_10654 : _GEN_8454; // @[LoadQueueReplay.scala 401:166]
  wire [1:0] _GEN_10687 = io_enq_1_bits_replayInfo_cause_4 | io_enq_1_bits_replayInfo_cause_2 |
    io_enq_1_bits_replayInfo_cause_3 ? _GEN_10655 : _GEN_8455; // @[LoadQueueReplay.scala 401:166]
  wire [1:0] _GEN_10688 = io_enq_1_bits_replayInfo_cause_4 | io_enq_1_bits_replayInfo_cause_2 |
    io_enq_1_bits_replayInfo_cause_3 ? _GEN_10656 : _GEN_8456; // @[LoadQueueReplay.scala 401:166]
  wire [1:0] _GEN_10689 = io_enq_1_bits_replayInfo_cause_4 | io_enq_1_bits_replayInfo_cause_2 |
    io_enq_1_bits_replayInfo_cause_3 ? _GEN_10657 : _GEN_8457; // @[LoadQueueReplay.scala 401:166]
  wire [1:0] _GEN_10690 = io_enq_1_bits_replayInfo_cause_4 | io_enq_1_bits_replayInfo_cause_2 |
    io_enq_1_bits_replayInfo_cause_3 ? _GEN_10658 : _GEN_8458; // @[LoadQueueReplay.scala 401:166]
  wire [1:0] _GEN_10691 = io_enq_1_bits_replayInfo_cause_4 | io_enq_1_bits_replayInfo_cause_2 |
    io_enq_1_bits_replayInfo_cause_3 ? _GEN_10659 : _GEN_8459; // @[LoadQueueReplay.scala 401:166]
  wire [1:0] _GEN_10692 = io_enq_1_bits_replayInfo_cause_4 | io_enq_1_bits_replayInfo_cause_2 |
    io_enq_1_bits_replayInfo_cause_3 ? _GEN_10660 : _GEN_8460; // @[LoadQueueReplay.scala 401:166]
  wire [1:0] _GEN_10693 = io_enq_1_bits_replayInfo_cause_4 | io_enq_1_bits_replayInfo_cause_2 |
    io_enq_1_bits_replayInfo_cause_3 ? _GEN_10661 : _GEN_8461; // @[LoadQueueReplay.scala 401:166]
  wire [1:0] _GEN_10694 = io_enq_1_bits_replayInfo_cause_4 | io_enq_1_bits_replayInfo_cause_2 |
    io_enq_1_bits_replayInfo_cause_3 ? _GEN_10662 : _GEN_8462; // @[LoadQueueReplay.scala 401:166]
  wire  _GEN_10855 = _GEN_13407 | _GEN_10455; // @[LoadQueueReplay.scala 408:{34,34}]
  wire  _GEN_10856 = _GEN_13408 | _GEN_10456; // @[LoadQueueReplay.scala 408:{34,34}]
  wire  _GEN_10857 = _GEN_13409 | _GEN_10457; // @[LoadQueueReplay.scala 408:{34,34}]
  wire  _GEN_10858 = _GEN_13410 | _GEN_10458; // @[LoadQueueReplay.scala 408:{34,34}]
  wire  _GEN_10859 = _GEN_13411 | _GEN_10459; // @[LoadQueueReplay.scala 408:{34,34}]
  wire  _GEN_10860 = _GEN_13412 | _GEN_10460; // @[LoadQueueReplay.scala 408:{34,34}]
  wire  _GEN_10861 = _GEN_13413 | _GEN_10461; // @[LoadQueueReplay.scala 408:{34,34}]
  wire  _GEN_10862 = _GEN_13414 | _GEN_10462; // @[LoadQueueReplay.scala 408:{34,34}]
  wire  _GEN_10863 = _GEN_13415 | _GEN_10463; // @[LoadQueueReplay.scala 408:{34,34}]
  wire  _GEN_10864 = _GEN_13416 | _GEN_10464; // @[LoadQueueReplay.scala 408:{34,34}]
  wire  _GEN_10865 = _GEN_13417 | _GEN_10465; // @[LoadQueueReplay.scala 408:{34,34}]
  wire  _GEN_10866 = _GEN_13418 | _GEN_10466; // @[LoadQueueReplay.scala 408:{34,34}]
  wire  _GEN_10867 = _GEN_13419 | _GEN_10467; // @[LoadQueueReplay.scala 408:{34,34}]
  wire  _GEN_10868 = _GEN_13420 | _GEN_10468; // @[LoadQueueReplay.scala 408:{34,34}]
  wire  _GEN_10869 = _GEN_13421 | _GEN_10469; // @[LoadQueueReplay.scala 408:{34,34}]
  wire  _GEN_10870 = _GEN_13422 | _GEN_10470; // @[LoadQueueReplay.scala 408:{34,34}]
  wire  _GEN_10871 = 4'h0 == enqIdx_1 ? io_enq_1_bits_replayInfo_addrInvalidSqIdx_flag : _GEN_8463; // @[LoadQueueReplay.scala 409:{28,28}]
  wire  _GEN_10872 = 4'h1 == enqIdx_1 ? io_enq_1_bits_replayInfo_addrInvalidSqIdx_flag : _GEN_8464; // @[LoadQueueReplay.scala 409:{28,28}]
  wire  _GEN_10873 = 4'h2 == enqIdx_1 ? io_enq_1_bits_replayInfo_addrInvalidSqIdx_flag : _GEN_8465; // @[LoadQueueReplay.scala 409:{28,28}]
  wire  _GEN_10874 = 4'h3 == enqIdx_1 ? io_enq_1_bits_replayInfo_addrInvalidSqIdx_flag : _GEN_8466; // @[LoadQueueReplay.scala 409:{28,28}]
  wire  _GEN_10875 = 4'h4 == enqIdx_1 ? io_enq_1_bits_replayInfo_addrInvalidSqIdx_flag : _GEN_8467; // @[LoadQueueReplay.scala 409:{28,28}]
  wire  _GEN_10876 = 4'h5 == enqIdx_1 ? io_enq_1_bits_replayInfo_addrInvalidSqIdx_flag : _GEN_8468; // @[LoadQueueReplay.scala 409:{28,28}]
  wire  _GEN_10877 = 4'h6 == enqIdx_1 ? io_enq_1_bits_replayInfo_addrInvalidSqIdx_flag : _GEN_8469; // @[LoadQueueReplay.scala 409:{28,28}]
  wire  _GEN_10878 = 4'h7 == enqIdx_1 ? io_enq_1_bits_replayInfo_addrInvalidSqIdx_flag : _GEN_8470; // @[LoadQueueReplay.scala 409:{28,28}]
  wire  _GEN_10879 = 4'h8 == enqIdx_1 ? io_enq_1_bits_replayInfo_addrInvalidSqIdx_flag : _GEN_8471; // @[LoadQueueReplay.scala 409:{28,28}]
  wire  _GEN_10880 = 4'h9 == enqIdx_1 ? io_enq_1_bits_replayInfo_addrInvalidSqIdx_flag : _GEN_8472; // @[LoadQueueReplay.scala 409:{28,28}]
  wire  _GEN_10881 = 4'ha == enqIdx_1 ? io_enq_1_bits_replayInfo_addrInvalidSqIdx_flag : _GEN_8473; // @[LoadQueueReplay.scala 409:{28,28}]
  wire  _GEN_10882 = 4'hb == enqIdx_1 ? io_enq_1_bits_replayInfo_addrInvalidSqIdx_flag : _GEN_8474; // @[LoadQueueReplay.scala 409:{28,28}]
  wire  _GEN_10883 = 4'hc == enqIdx_1 ? io_enq_1_bits_replayInfo_addrInvalidSqIdx_flag : _GEN_8475; // @[LoadQueueReplay.scala 409:{28,28}]
  wire  _GEN_10884 = 4'hd == enqIdx_1 ? io_enq_1_bits_replayInfo_addrInvalidSqIdx_flag : _GEN_8476; // @[LoadQueueReplay.scala 409:{28,28}]
  wire  _GEN_10885 = 4'he == enqIdx_1 ? io_enq_1_bits_replayInfo_addrInvalidSqIdx_flag : _GEN_8477; // @[LoadQueueReplay.scala 409:{28,28}]
  wire  _GEN_10886 = 4'hf == enqIdx_1 ? io_enq_1_bits_replayInfo_addrInvalidSqIdx_flag : _GEN_8478; // @[LoadQueueReplay.scala 409:{28,28}]
  wire [3:0] _GEN_10887 = 4'h0 == enqIdx_1 ? io_enq_1_bits_replayInfo_addrInvalidSqIdx_value : _GEN_8479; // @[LoadQueueReplay.scala 409:{28,28}]
  wire [3:0] _GEN_10888 = 4'h1 == enqIdx_1 ? io_enq_1_bits_replayInfo_addrInvalidSqIdx_value : _GEN_8480; // @[LoadQueueReplay.scala 409:{28,28}]
  wire [3:0] _GEN_10889 = 4'h2 == enqIdx_1 ? io_enq_1_bits_replayInfo_addrInvalidSqIdx_value : _GEN_8481; // @[LoadQueueReplay.scala 409:{28,28}]
  wire [3:0] _GEN_10890 = 4'h3 == enqIdx_1 ? io_enq_1_bits_replayInfo_addrInvalidSqIdx_value : _GEN_8482; // @[LoadQueueReplay.scala 409:{28,28}]
  wire [3:0] _GEN_10891 = 4'h4 == enqIdx_1 ? io_enq_1_bits_replayInfo_addrInvalidSqIdx_value : _GEN_8483; // @[LoadQueueReplay.scala 409:{28,28}]
  wire [3:0] _GEN_10892 = 4'h5 == enqIdx_1 ? io_enq_1_bits_replayInfo_addrInvalidSqIdx_value : _GEN_8484; // @[LoadQueueReplay.scala 409:{28,28}]
  wire [3:0] _GEN_10893 = 4'h6 == enqIdx_1 ? io_enq_1_bits_replayInfo_addrInvalidSqIdx_value : _GEN_8485; // @[LoadQueueReplay.scala 409:{28,28}]
  wire [3:0] _GEN_10894 = 4'h7 == enqIdx_1 ? io_enq_1_bits_replayInfo_addrInvalidSqIdx_value : _GEN_8486; // @[LoadQueueReplay.scala 409:{28,28}]
  wire [3:0] _GEN_10895 = 4'h8 == enqIdx_1 ? io_enq_1_bits_replayInfo_addrInvalidSqIdx_value : _GEN_8487; // @[LoadQueueReplay.scala 409:{28,28}]
  wire [3:0] _GEN_10896 = 4'h9 == enqIdx_1 ? io_enq_1_bits_replayInfo_addrInvalidSqIdx_value : _GEN_8488; // @[LoadQueueReplay.scala 409:{28,28}]
  wire [3:0] _GEN_10897 = 4'ha == enqIdx_1 ? io_enq_1_bits_replayInfo_addrInvalidSqIdx_value : _GEN_8489; // @[LoadQueueReplay.scala 409:{28,28}]
  wire [3:0] _GEN_10898 = 4'hb == enqIdx_1 ? io_enq_1_bits_replayInfo_addrInvalidSqIdx_value : _GEN_8490; // @[LoadQueueReplay.scala 409:{28,28}]
  wire [3:0] _GEN_10899 = 4'hc == enqIdx_1 ? io_enq_1_bits_replayInfo_addrInvalidSqIdx_value : _GEN_8491; // @[LoadQueueReplay.scala 409:{28,28}]
  wire [3:0] _GEN_10900 = 4'hd == enqIdx_1 ? io_enq_1_bits_replayInfo_addrInvalidSqIdx_value : _GEN_8492; // @[LoadQueueReplay.scala 409:{28,28}]
  wire [3:0] _GEN_10901 = 4'he == enqIdx_1 ? io_enq_1_bits_replayInfo_addrInvalidSqIdx_value : _GEN_8493; // @[LoadQueueReplay.scala 409:{28,28}]
  wire [3:0] _GEN_10902 = 4'hf == enqIdx_1 ? io_enq_1_bits_replayInfo_addrInvalidSqIdx_value : _GEN_8494; // @[LoadQueueReplay.scala 409:{28,28}]
  wire  _GEN_10919 = io_enq_1_bits_replayInfo_cause_1 ? _GEN_10871 : _GEN_8463; // @[LoadQueueReplay.scala 407:59]
  wire  _GEN_10920 = io_enq_1_bits_replayInfo_cause_1 ? _GEN_10872 : _GEN_8464; // @[LoadQueueReplay.scala 407:59]
  wire  _GEN_10921 = io_enq_1_bits_replayInfo_cause_1 ? _GEN_10873 : _GEN_8465; // @[LoadQueueReplay.scala 407:59]
  wire  _GEN_10922 = io_enq_1_bits_replayInfo_cause_1 ? _GEN_10874 : _GEN_8466; // @[LoadQueueReplay.scala 407:59]
  wire  _GEN_10923 = io_enq_1_bits_replayInfo_cause_1 ? _GEN_10875 : _GEN_8467; // @[LoadQueueReplay.scala 407:59]
  wire  _GEN_10924 = io_enq_1_bits_replayInfo_cause_1 ? _GEN_10876 : _GEN_8468; // @[LoadQueueReplay.scala 407:59]
  wire  _GEN_10925 = io_enq_1_bits_replayInfo_cause_1 ? _GEN_10877 : _GEN_8469; // @[LoadQueueReplay.scala 407:59]
  wire  _GEN_10926 = io_enq_1_bits_replayInfo_cause_1 ? _GEN_10878 : _GEN_8470; // @[LoadQueueReplay.scala 407:59]
  wire  _GEN_10927 = io_enq_1_bits_replayInfo_cause_1 ? _GEN_10879 : _GEN_8471; // @[LoadQueueReplay.scala 407:59]
  wire  _GEN_10928 = io_enq_1_bits_replayInfo_cause_1 ? _GEN_10880 : _GEN_8472; // @[LoadQueueReplay.scala 407:59]
  wire  _GEN_10929 = io_enq_1_bits_replayInfo_cause_1 ? _GEN_10881 : _GEN_8473; // @[LoadQueueReplay.scala 407:59]
  wire  _GEN_10930 = io_enq_1_bits_replayInfo_cause_1 ? _GEN_10882 : _GEN_8474; // @[LoadQueueReplay.scala 407:59]
  wire  _GEN_10931 = io_enq_1_bits_replayInfo_cause_1 ? _GEN_10883 : _GEN_8475; // @[LoadQueueReplay.scala 407:59]
  wire  _GEN_10932 = io_enq_1_bits_replayInfo_cause_1 ? _GEN_10884 : _GEN_8476; // @[LoadQueueReplay.scala 407:59]
  wire  _GEN_10933 = io_enq_1_bits_replayInfo_cause_1 ? _GEN_10885 : _GEN_8477; // @[LoadQueueReplay.scala 407:59]
  wire  _GEN_10934 = io_enq_1_bits_replayInfo_cause_1 ? _GEN_10886 : _GEN_8478; // @[LoadQueueReplay.scala 407:59]
  wire [3:0] _GEN_10935 = io_enq_1_bits_replayInfo_cause_1 ? _GEN_10887 : _GEN_8479; // @[LoadQueueReplay.scala 407:59]
  wire [3:0] _GEN_10936 = io_enq_1_bits_replayInfo_cause_1 ? _GEN_10888 : _GEN_8480; // @[LoadQueueReplay.scala 407:59]
  wire [3:0] _GEN_10937 = io_enq_1_bits_replayInfo_cause_1 ? _GEN_10889 : _GEN_8481; // @[LoadQueueReplay.scala 407:59]
  wire [3:0] _GEN_10938 = io_enq_1_bits_replayInfo_cause_1 ? _GEN_10890 : _GEN_8482; // @[LoadQueueReplay.scala 407:59]
  wire [3:0] _GEN_10939 = io_enq_1_bits_replayInfo_cause_1 ? _GEN_10891 : _GEN_8483; // @[LoadQueueReplay.scala 407:59]
  wire [3:0] _GEN_10940 = io_enq_1_bits_replayInfo_cause_1 ? _GEN_10892 : _GEN_8484; // @[LoadQueueReplay.scala 407:59]
  wire [3:0] _GEN_10941 = io_enq_1_bits_replayInfo_cause_1 ? _GEN_10893 : _GEN_8485; // @[LoadQueueReplay.scala 407:59]
  wire [3:0] _GEN_10942 = io_enq_1_bits_replayInfo_cause_1 ? _GEN_10894 : _GEN_8486; // @[LoadQueueReplay.scala 407:59]
  wire [3:0] _GEN_10943 = io_enq_1_bits_replayInfo_cause_1 ? _GEN_10895 : _GEN_8487; // @[LoadQueueReplay.scala 407:59]
  wire [3:0] _GEN_10944 = io_enq_1_bits_replayInfo_cause_1 ? _GEN_10896 : _GEN_8488; // @[LoadQueueReplay.scala 407:59]
  wire [3:0] _GEN_10945 = io_enq_1_bits_replayInfo_cause_1 ? _GEN_10897 : _GEN_8489; // @[LoadQueueReplay.scala 407:59]
  wire [3:0] _GEN_10946 = io_enq_1_bits_replayInfo_cause_1 ? _GEN_10898 : _GEN_8490; // @[LoadQueueReplay.scala 407:59]
  wire [3:0] _GEN_10947 = io_enq_1_bits_replayInfo_cause_1 ? _GEN_10899 : _GEN_8491; // @[LoadQueueReplay.scala 407:59]
  wire [3:0] _GEN_10948 = io_enq_1_bits_replayInfo_cause_1 ? _GEN_10900 : _GEN_8492; // @[LoadQueueReplay.scala 407:59]
  wire [3:0] _GEN_10949 = io_enq_1_bits_replayInfo_cause_1 ? _GEN_10901 : _GEN_8493; // @[LoadQueueReplay.scala 407:59]
  wire [3:0] _GEN_10950 = io_enq_1_bits_replayInfo_cause_1 ? _GEN_10902 : _GEN_8494; // @[LoadQueueReplay.scala 407:59]
  wire  _GEN_10951 = _GEN_13407 | _GEN_10471; // @[LoadQueueReplay.scala 414:{36,36}]
  wire  _GEN_10952 = _GEN_13408 | _GEN_10472; // @[LoadQueueReplay.scala 414:{36,36}]
  wire  _GEN_10953 = _GEN_13409 | _GEN_10473; // @[LoadQueueReplay.scala 414:{36,36}]
  wire  _GEN_10954 = _GEN_13410 | _GEN_10474; // @[LoadQueueReplay.scala 414:{36,36}]
  wire  _GEN_10955 = _GEN_13411 | _GEN_10475; // @[LoadQueueReplay.scala 414:{36,36}]
  wire  _GEN_10956 = _GEN_13412 | _GEN_10476; // @[LoadQueueReplay.scala 414:{36,36}]
  wire  _GEN_10957 = _GEN_13413 | _GEN_10477; // @[LoadQueueReplay.scala 414:{36,36}]
  wire  _GEN_10958 = _GEN_13414 | _GEN_10478; // @[LoadQueueReplay.scala 414:{36,36}]
  wire  _GEN_10959 = _GEN_13415 | _GEN_10479; // @[LoadQueueReplay.scala 414:{36,36}]
  wire  _GEN_10960 = _GEN_13416 | _GEN_10480; // @[LoadQueueReplay.scala 414:{36,36}]
  wire  _GEN_10961 = _GEN_13417 | _GEN_10481; // @[LoadQueueReplay.scala 414:{36,36}]
  wire  _GEN_10962 = _GEN_13418 | _GEN_10482; // @[LoadQueueReplay.scala 414:{36,36}]
  wire  _GEN_10963 = _GEN_13419 | _GEN_10483; // @[LoadQueueReplay.scala 414:{36,36}]
  wire  _GEN_10964 = _GEN_13420 | _GEN_10484; // @[LoadQueueReplay.scala 414:{36,36}]
  wire  _GEN_10965 = _GEN_13421 | _GEN_10485; // @[LoadQueueReplay.scala 414:{36,36}]
  wire  _GEN_10966 = _GEN_13422 | _GEN_10486; // @[LoadQueueReplay.scala 414:{36,36}]
  wire  _blockByCacheMiss_T_12 = ~(io_refill_valid & io_refill_bits_id == io_enq_1_bits_replayInfo_missMSHRId); // @[LoadQueueReplay.scala 422:35]
  wire  _blockByCacheMiss_T_13 = io_enq_1_bits_replayInfo_cause_7 & ~io_enq_1_bits_replayInfo_canForwardFullData &
    _blockByCacheMiss_T_12; // @[LoadQueueReplay.scala 421:115]
  wire [5:0] _GEN_11096 = 4'h1 == enqIdx_1 ? creditUpdate_1 : creditUpdate_0; // @[LoadQueueReplay.scala 423:{56,56}]
  wire [5:0] _GEN_11097 = 4'h2 == enqIdx_1 ? creditUpdate_2 : _GEN_11096; // @[LoadQueueReplay.scala 423:{56,56}]
  wire [5:0] _GEN_11098 = 4'h3 == enqIdx_1 ? creditUpdate_3 : _GEN_11097; // @[LoadQueueReplay.scala 423:{56,56}]
  wire [5:0] _GEN_11099 = 4'h4 == enqIdx_1 ? creditUpdate_4 : _GEN_11098; // @[LoadQueueReplay.scala 423:{56,56}]
  wire [5:0] _GEN_11100 = 4'h5 == enqIdx_1 ? creditUpdate_5 : _GEN_11099; // @[LoadQueueReplay.scala 423:{56,56}]
  wire [5:0] _GEN_11101 = 4'h6 == enqIdx_1 ? creditUpdate_6 : _GEN_11100; // @[LoadQueueReplay.scala 423:{56,56}]
  wire [5:0] _GEN_11102 = 4'h7 == enqIdx_1 ? creditUpdate_7 : _GEN_11101; // @[LoadQueueReplay.scala 423:{56,56}]
  wire [5:0] _GEN_11103 = 4'h8 == enqIdx_1 ? creditUpdate_8 : _GEN_11102; // @[LoadQueueReplay.scala 423:{56,56}]
  wire [5:0] _GEN_11104 = 4'h9 == enqIdx_1 ? creditUpdate_9 : _GEN_11103; // @[LoadQueueReplay.scala 423:{56,56}]
  wire [5:0] _GEN_11105 = 4'ha == enqIdx_1 ? creditUpdate_10 : _GEN_11104; // @[LoadQueueReplay.scala 423:{56,56}]
  wire [5:0] _GEN_11106 = 4'hb == enqIdx_1 ? creditUpdate_11 : _GEN_11105; // @[LoadQueueReplay.scala 423:{56,56}]
  wire [5:0] _GEN_11107 = 4'hc == enqIdx_1 ? creditUpdate_12 : _GEN_11106; // @[LoadQueueReplay.scala 423:{56,56}]
  wire [5:0] _GEN_11108 = 4'hd == enqIdx_1 ? creditUpdate_13 : _GEN_11107; // @[LoadQueueReplay.scala 423:{56,56}]
  wire [5:0] _GEN_11109 = 4'he == enqIdx_1 ? creditUpdate_14 : _GEN_11108; // @[LoadQueueReplay.scala 423:{56,56}]
  wire [5:0] _GEN_11110 = 4'hf == enqIdx_1 ? creditUpdate_15 : _GEN_11109; // @[LoadQueueReplay.scala 423:{56,56}]
  wire  _blockByCacheMiss_T_14 = _GEN_11110 != 6'h0; // @[LoadQueueReplay.scala 423:56]
  wire  _blockByCacheMiss_T_15 = _blockByCacheMiss_T_13 & _blockByCacheMiss_T_14; // @[LoadQueueReplay.scala 422:101]
  wire [5:0] _needCancel_0_flushItself_T_1 = {uop_0_robIdx_flag,uop_0_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _needCancel_0_flushItself_T_3 = _needCancel_0_flushItself_T_1 == _cancelEnq_flushItself_T_6; // @[CircularQueuePtr.scala 61:52]
  wire  needCancel_0_flushItself = io_redirect_bits_level & _needCancel_0_flushItself_T_3; // @[Rob.scala 122:51]
  wire  needCancel_0_differentFlag = uop_0_robIdx_flag ^ io_redirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  needCancel_0_compare = uop_0_robIdx_value > io_redirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _needCancel_0_T = needCancel_0_differentFlag ^ needCancel_0_compare; // @[CircularQueuePtr.scala 88:19]
  wire  _needCancel_0_T_2 = io_redirect_valid & (needCancel_0_flushItself | _needCancel_0_T); // @[Rob.scala 123:20]
  wire  needCancel_0 = _needCancel_0_T_2 & allocated_0; // @[LoadQueueReplay.scala 443:59]
  wire [5:0] _needCancel_1_flushItself_T_1 = {uop_1_robIdx_flag,uop_1_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _needCancel_1_flushItself_T_3 = _needCancel_1_flushItself_T_1 == _cancelEnq_flushItself_T_6; // @[CircularQueuePtr.scala 61:52]
  wire  needCancel_1_flushItself = io_redirect_bits_level & _needCancel_1_flushItself_T_3; // @[Rob.scala 122:51]
  wire  needCancel_1_differentFlag = uop_1_robIdx_flag ^ io_redirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  needCancel_1_compare = uop_1_robIdx_value > io_redirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _needCancel_1_T = needCancel_1_differentFlag ^ needCancel_1_compare; // @[CircularQueuePtr.scala 88:19]
  wire  _needCancel_1_T_2 = io_redirect_valid & (needCancel_1_flushItself | _needCancel_1_T); // @[Rob.scala 123:20]
  wire  needCancel_1 = _needCancel_1_T_2 & allocated_1; // @[LoadQueueReplay.scala 443:59]
  wire [5:0] _needCancel_2_flushItself_T_1 = {uop_2_robIdx_flag,uop_2_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _needCancel_2_flushItself_T_3 = _needCancel_2_flushItself_T_1 == _cancelEnq_flushItself_T_6; // @[CircularQueuePtr.scala 61:52]
  wire  needCancel_2_flushItself = io_redirect_bits_level & _needCancel_2_flushItself_T_3; // @[Rob.scala 122:51]
  wire  needCancel_2_differentFlag = uop_2_robIdx_flag ^ io_redirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  needCancel_2_compare = uop_2_robIdx_value > io_redirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _needCancel_2_T = needCancel_2_differentFlag ^ needCancel_2_compare; // @[CircularQueuePtr.scala 88:19]
  wire  _needCancel_2_T_2 = io_redirect_valid & (needCancel_2_flushItself | _needCancel_2_T); // @[Rob.scala 123:20]
  wire  needCancel_2 = _needCancel_2_T_2 & allocated_2; // @[LoadQueueReplay.scala 443:59]
  wire [5:0] _needCancel_3_flushItself_T_1 = {uop_3_robIdx_flag,uop_3_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _needCancel_3_flushItself_T_3 = _needCancel_3_flushItself_T_1 == _cancelEnq_flushItself_T_6; // @[CircularQueuePtr.scala 61:52]
  wire  needCancel_3_flushItself = io_redirect_bits_level & _needCancel_3_flushItself_T_3; // @[Rob.scala 122:51]
  wire  needCancel_3_differentFlag = uop_3_robIdx_flag ^ io_redirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  needCancel_3_compare = uop_3_robIdx_value > io_redirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _needCancel_3_T = needCancel_3_differentFlag ^ needCancel_3_compare; // @[CircularQueuePtr.scala 88:19]
  wire  _needCancel_3_T_2 = io_redirect_valid & (needCancel_3_flushItself | _needCancel_3_T); // @[Rob.scala 123:20]
  wire  needCancel_3 = _needCancel_3_T_2 & allocated_3; // @[LoadQueueReplay.scala 443:59]
  wire [5:0] _needCancel_4_flushItself_T_1 = {uop_4_robIdx_flag,uop_4_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _needCancel_4_flushItself_T_3 = _needCancel_4_flushItself_T_1 == _cancelEnq_flushItself_T_6; // @[CircularQueuePtr.scala 61:52]
  wire  needCancel_4_flushItself = io_redirect_bits_level & _needCancel_4_flushItself_T_3; // @[Rob.scala 122:51]
  wire  needCancel_4_differentFlag = uop_4_robIdx_flag ^ io_redirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  needCancel_4_compare = uop_4_robIdx_value > io_redirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _needCancel_4_T = needCancel_4_differentFlag ^ needCancel_4_compare; // @[CircularQueuePtr.scala 88:19]
  wire  _needCancel_4_T_2 = io_redirect_valid & (needCancel_4_flushItself | _needCancel_4_T); // @[Rob.scala 123:20]
  wire  needCancel_4 = _needCancel_4_T_2 & allocated_4; // @[LoadQueueReplay.scala 443:59]
  wire [5:0] _needCancel_5_flushItself_T_1 = {uop_5_robIdx_flag,uop_5_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _needCancel_5_flushItself_T_3 = _needCancel_5_flushItself_T_1 == _cancelEnq_flushItself_T_6; // @[CircularQueuePtr.scala 61:52]
  wire  needCancel_5_flushItself = io_redirect_bits_level & _needCancel_5_flushItself_T_3; // @[Rob.scala 122:51]
  wire  needCancel_5_differentFlag = uop_5_robIdx_flag ^ io_redirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  needCancel_5_compare = uop_5_robIdx_value > io_redirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _needCancel_5_T = needCancel_5_differentFlag ^ needCancel_5_compare; // @[CircularQueuePtr.scala 88:19]
  wire  _needCancel_5_T_2 = io_redirect_valid & (needCancel_5_flushItself | _needCancel_5_T); // @[Rob.scala 123:20]
  wire  needCancel_5 = _needCancel_5_T_2 & allocated_5; // @[LoadQueueReplay.scala 443:59]
  wire [5:0] _needCancel_6_flushItself_T_1 = {uop_6_robIdx_flag,uop_6_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _needCancel_6_flushItself_T_3 = _needCancel_6_flushItself_T_1 == _cancelEnq_flushItself_T_6; // @[CircularQueuePtr.scala 61:52]
  wire  needCancel_6_flushItself = io_redirect_bits_level & _needCancel_6_flushItself_T_3; // @[Rob.scala 122:51]
  wire  needCancel_6_differentFlag = uop_6_robIdx_flag ^ io_redirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  needCancel_6_compare = uop_6_robIdx_value > io_redirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _needCancel_6_T = needCancel_6_differentFlag ^ needCancel_6_compare; // @[CircularQueuePtr.scala 88:19]
  wire  _needCancel_6_T_2 = io_redirect_valid & (needCancel_6_flushItself | _needCancel_6_T); // @[Rob.scala 123:20]
  wire  needCancel_6 = _needCancel_6_T_2 & allocated_6; // @[LoadQueueReplay.scala 443:59]
  wire [5:0] _needCancel_7_flushItself_T_1 = {uop_7_robIdx_flag,uop_7_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _needCancel_7_flushItself_T_3 = _needCancel_7_flushItself_T_1 == _cancelEnq_flushItself_T_6; // @[CircularQueuePtr.scala 61:52]
  wire  needCancel_7_flushItself = io_redirect_bits_level & _needCancel_7_flushItself_T_3; // @[Rob.scala 122:51]
  wire  needCancel_7_differentFlag = uop_7_robIdx_flag ^ io_redirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  needCancel_7_compare = uop_7_robIdx_value > io_redirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _needCancel_7_T = needCancel_7_differentFlag ^ needCancel_7_compare; // @[CircularQueuePtr.scala 88:19]
  wire  _needCancel_7_T_2 = io_redirect_valid & (needCancel_7_flushItself | _needCancel_7_T); // @[Rob.scala 123:20]
  wire  needCancel_7 = _needCancel_7_T_2 & allocated_7; // @[LoadQueueReplay.scala 443:59]
  wire [5:0] _needCancel_8_flushItself_T_1 = {uop_8_robIdx_flag,uop_8_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _needCancel_8_flushItself_T_3 = _needCancel_8_flushItself_T_1 == _cancelEnq_flushItself_T_6; // @[CircularQueuePtr.scala 61:52]
  wire  needCancel_8_flushItself = io_redirect_bits_level & _needCancel_8_flushItself_T_3; // @[Rob.scala 122:51]
  wire  needCancel_8_differentFlag = uop_8_robIdx_flag ^ io_redirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  needCancel_8_compare = uop_8_robIdx_value > io_redirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _needCancel_8_T = needCancel_8_differentFlag ^ needCancel_8_compare; // @[CircularQueuePtr.scala 88:19]
  wire  _needCancel_8_T_2 = io_redirect_valid & (needCancel_8_flushItself | _needCancel_8_T); // @[Rob.scala 123:20]
  wire  needCancel_8 = _needCancel_8_T_2 & allocated_8; // @[LoadQueueReplay.scala 443:59]
  wire [5:0] _needCancel_9_flushItself_T_1 = {uop_9_robIdx_flag,uop_9_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _needCancel_9_flushItself_T_3 = _needCancel_9_flushItself_T_1 == _cancelEnq_flushItself_T_6; // @[CircularQueuePtr.scala 61:52]
  wire  needCancel_9_flushItself = io_redirect_bits_level & _needCancel_9_flushItself_T_3; // @[Rob.scala 122:51]
  wire  needCancel_9_differentFlag = uop_9_robIdx_flag ^ io_redirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  needCancel_9_compare = uop_9_robIdx_value > io_redirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _needCancel_9_T = needCancel_9_differentFlag ^ needCancel_9_compare; // @[CircularQueuePtr.scala 88:19]
  wire  _needCancel_9_T_2 = io_redirect_valid & (needCancel_9_flushItself | _needCancel_9_T); // @[Rob.scala 123:20]
  wire  needCancel_9 = _needCancel_9_T_2 & allocated_9; // @[LoadQueueReplay.scala 443:59]
  wire [5:0] _needCancel_10_flushItself_T_1 = {uop_10_robIdx_flag,uop_10_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _needCancel_10_flushItself_T_3 = _needCancel_10_flushItself_T_1 == _cancelEnq_flushItself_T_6; // @[CircularQueuePtr.scala 61:52]
  wire  needCancel_10_flushItself = io_redirect_bits_level & _needCancel_10_flushItself_T_3; // @[Rob.scala 122:51]
  wire  needCancel_10_differentFlag = uop_10_robIdx_flag ^ io_redirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  needCancel_10_compare = uop_10_robIdx_value > io_redirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _needCancel_10_T = needCancel_10_differentFlag ^ needCancel_10_compare; // @[CircularQueuePtr.scala 88:19]
  wire  _needCancel_10_T_2 = io_redirect_valid & (needCancel_10_flushItself | _needCancel_10_T); // @[Rob.scala 123:20]
  wire  needCancel_10 = _needCancel_10_T_2 & allocated_10; // @[LoadQueueReplay.scala 443:59]
  wire [5:0] _needCancel_11_flushItself_T_1 = {uop_11_robIdx_flag,uop_11_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _needCancel_11_flushItself_T_3 = _needCancel_11_flushItself_T_1 == _cancelEnq_flushItself_T_6; // @[CircularQueuePtr.scala 61:52]
  wire  needCancel_11_flushItself = io_redirect_bits_level & _needCancel_11_flushItself_T_3; // @[Rob.scala 122:51]
  wire  needCancel_11_differentFlag = uop_11_robIdx_flag ^ io_redirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  needCancel_11_compare = uop_11_robIdx_value > io_redirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _needCancel_11_T = needCancel_11_differentFlag ^ needCancel_11_compare; // @[CircularQueuePtr.scala 88:19]
  wire  _needCancel_11_T_2 = io_redirect_valid & (needCancel_11_flushItself | _needCancel_11_T); // @[Rob.scala 123:20]
  wire  needCancel_11 = _needCancel_11_T_2 & allocated_11; // @[LoadQueueReplay.scala 443:59]
  wire [5:0] _needCancel_12_flushItself_T_1 = {uop_12_robIdx_flag,uop_12_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _needCancel_12_flushItself_T_3 = _needCancel_12_flushItself_T_1 == _cancelEnq_flushItself_T_6; // @[CircularQueuePtr.scala 61:52]
  wire  needCancel_12_flushItself = io_redirect_bits_level & _needCancel_12_flushItself_T_3; // @[Rob.scala 122:51]
  wire  needCancel_12_differentFlag = uop_12_robIdx_flag ^ io_redirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  needCancel_12_compare = uop_12_robIdx_value > io_redirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _needCancel_12_T = needCancel_12_differentFlag ^ needCancel_12_compare; // @[CircularQueuePtr.scala 88:19]
  wire  _needCancel_12_T_2 = io_redirect_valid & (needCancel_12_flushItself | _needCancel_12_T); // @[Rob.scala 123:20]
  wire  needCancel_12 = _needCancel_12_T_2 & allocated_12; // @[LoadQueueReplay.scala 443:59]
  wire [5:0] _needCancel_13_flushItself_T_1 = {uop_13_robIdx_flag,uop_13_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _needCancel_13_flushItself_T_3 = _needCancel_13_flushItself_T_1 == _cancelEnq_flushItself_T_6; // @[CircularQueuePtr.scala 61:52]
  wire  needCancel_13_flushItself = io_redirect_bits_level & _needCancel_13_flushItself_T_3; // @[Rob.scala 122:51]
  wire  needCancel_13_differentFlag = uop_13_robIdx_flag ^ io_redirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  needCancel_13_compare = uop_13_robIdx_value > io_redirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _needCancel_13_T = needCancel_13_differentFlag ^ needCancel_13_compare; // @[CircularQueuePtr.scala 88:19]
  wire  _needCancel_13_T_2 = io_redirect_valid & (needCancel_13_flushItself | _needCancel_13_T); // @[Rob.scala 123:20]
  wire  needCancel_13 = _needCancel_13_T_2 & allocated_13; // @[LoadQueueReplay.scala 443:59]
  wire [5:0] _needCancel_14_flushItself_T_1 = {uop_14_robIdx_flag,uop_14_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _needCancel_14_flushItself_T_3 = _needCancel_14_flushItself_T_1 == _cancelEnq_flushItself_T_6; // @[CircularQueuePtr.scala 61:52]
  wire  needCancel_14_flushItself = io_redirect_bits_level & _needCancel_14_flushItself_T_3; // @[Rob.scala 122:51]
  wire  needCancel_14_differentFlag = uop_14_robIdx_flag ^ io_redirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  needCancel_14_compare = uop_14_robIdx_value > io_redirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _needCancel_14_T = needCancel_14_differentFlag ^ needCancel_14_compare; // @[CircularQueuePtr.scala 88:19]
  wire  _needCancel_14_T_2 = io_redirect_valid & (needCancel_14_flushItself | _needCancel_14_T); // @[Rob.scala 123:20]
  wire  needCancel_14 = _needCancel_14_T_2 & allocated_14; // @[LoadQueueReplay.scala 443:59]
  wire [5:0] _needCancel_15_flushItself_T_1 = {uop_15_robIdx_flag,uop_15_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _needCancel_15_flushItself_T_3 = _needCancel_15_flushItself_T_1 == _cancelEnq_flushItself_T_6; // @[CircularQueuePtr.scala 61:52]
  wire  needCancel_15_flushItself = io_redirect_bits_level & _needCancel_15_flushItself_T_3; // @[Rob.scala 122:51]
  wire  needCancel_15_differentFlag = uop_15_robIdx_flag ^ io_redirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  needCancel_15_compare = uop_15_robIdx_value > io_redirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _needCancel_15_T = needCancel_15_differentFlag ^ needCancel_15_compare; // @[CircularQueuePtr.scala 88:19]
  wire  _needCancel_15_T_2 = io_redirect_valid & (needCancel_15_flushItself | _needCancel_15_T); // @[Rob.scala 123:20]
  wire  needCancel_15 = _needCancel_15_T_2 & allocated_15; // @[LoadQueueReplay.scala 443:59]
  wire  _deqBlockCount_T_1 = io_replay_0_valid & ~io_replay_0_ready; // @[LoadQueueReplay.scala 454:59]
  wire  _deqBlockCount_T_3 = io_replay_1_valid & ~io_replay_1_ready; // @[LoadQueueReplay.scala 454:59]
  wire  _replayRejectEnqCount_T = io_enq_0_valid & io_enq_0_bits_replayInfo_cause_3; // @[LoadQueueReplay.scala 455:67]
  wire  _replayRejectEnqCount_T_1 = io_enq_1_valid & io_enq_1_bits_replayInfo_cause_3; // @[LoadQueueReplay.scala 455:67]
  wire  _replaySchedErrorCount_T = io_enq_0_valid & io_enq_0_bits_replayInfo_cause_2; // @[LoadQueueReplay.scala 456:68]
  wire  _replaySchedErrorCount_T_1 = io_enq_1_valid & io_enq_1_bits_replayInfo_cause_2; // @[LoadQueueReplay.scala 456:68]
  wire  _replayWaitStoreCount_T = io_enq_0_valid & io_enq_0_bits_replayInfo_cause_1; // @[LoadQueueReplay.scala 457:67]
  wire  _replayWaitStoreCount_T_1 = io_enq_1_valid & io_enq_1_bits_replayInfo_cause_1; // @[LoadQueueReplay.scala 457:67]
  wire  _replayTlbMissCount_T = io_enq_0_valid & io_enq_0_bits_replayInfo_cause_0; // @[LoadQueueReplay.scala 458:65]
  wire  _replayTlbMissCount_T_1 = io_enq_1_valid & io_enq_1_bits_replayInfo_cause_0; // @[LoadQueueReplay.scala 458:65]
  wire  _replayBankConflictCount_T = io_enq_0_valid & io_enq_0_bits_replayInfo_cause_4; // @[LoadQueueReplay.scala 459:70]
  wire  _replayBankConflictCount_T_1 = io_enq_1_valid & io_enq_1_bits_replayInfo_cause_4; // @[LoadQueueReplay.scala 459:70]
  wire  _replayDCacheReplayCount_T = io_enq_0_valid & io_enq_0_bits_replayInfo_cause_6; // @[LoadQueueReplay.scala 460:70]
  wire  _replayDCacheReplayCount_T_1 = io_enq_1_valid & io_enq_1_bits_replayInfo_cause_6; // @[LoadQueueReplay.scala 460:70]
  wire  _replayForwardFailCount_T = io_enq_0_valid & io_enq_0_bits_replayInfo_cause_5; // @[LoadQueueReplay.scala 461:69]
  wire  _replayForwardFailCount_T_1 = io_enq_1_valid & io_enq_1_bits_replayInfo_cause_5; // @[LoadQueueReplay.scala 461:69]
  wire  _replayDCacheMissCount_T = io_enq_0_valid & io_enq_0_bits_replayInfo_cause_7; // @[LoadQueueReplay.scala 462:68]
  wire  _replayDCacheMissCount_T_1 = io_enq_1_valid & io_enq_1_bits_replayInfo_cause_7; // @[LoadQueueReplay.scala 462:68]
  reg [1:0] io_perf_0_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg [1:0] io_perf_0_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg [1:0] io_perf_1_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg [1:0] io_perf_1_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg [1:0] io_perf_2_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg [1:0] io_perf_2_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg  io_perf_3_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg  io_perf_3_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg [1:0] io_perf_4_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg [1:0] io_perf_4_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg [1:0] io_perf_5_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg [1:0] io_perf_5_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg [1:0] io_perf_6_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg [1:0] io_perf_6_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg [1:0] io_perf_7_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg [1:0] io_perf_7_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg [1:0] io_perf_8_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg [1:0] io_perf_8_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg [1:0] io_perf_9_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg [1:0] io_perf_9_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg [1:0] io_perf_10_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg [1:0] io_perf_10_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg [1:0] io_perf_11_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg [1:0] io_perf_11_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  LqVAddrModule vaddrModule ( // @[LoadQueueReplay.scala 113:27]
    .clock(vaddrModule_clock),
    .io_raddr_0(vaddrModule_io_raddr_0),
    .io_raddr_1(vaddrModule_io_raddr_1),
    .io_rdata_0(vaddrModule_io_rdata_0),
    .io_rdata_1(vaddrModule_io_rdata_1),
    .io_wen_0(vaddrModule_io_wen_0),
    .io_wen_1(vaddrModule_io_wen_1),
    .io_waddr_0(vaddrModule_io_waddr_0),
    .io_waddr_1(vaddrModule_io_waddr_1),
    .io_wdata_0(vaddrModule_io_wdata_0),
    .io_wdata_1(vaddrModule_io_wdata_1)
  );
  assign io_replay_0_valid = loadReplaySelV_0_REG & ~cancelReplay & bankConflictReplay & coldCounter < 3'h5; // @[LoadQueueReplay.scala 319:106]
  assign io_replay_0_bits_uop_cf_foldpc = 4'hf == loadReplaySel_0_REG ? uop_15_cf_foldpc : _GEN_238; // @[LoadQueueReplay.scala 321:{27,27}]
  assign io_replay_0_bits_uop_cf_trigger_backendEn_1 = 4'hf == loadReplaySel_0_REG ? uop_15_cf_trigger_backendEn_1 :
    _GEN_590; // @[LoadQueueReplay.scala 321:{27,27}]
  assign io_replay_0_bits_uop_cf_trigger_backendHit_0 = 4'hf == loadReplaySel_0_REG ? uop_15_cf_trigger_backendHit_0 :
    _GEN_606; // @[LoadQueueReplay.scala 321:{27,27}]
  assign io_replay_0_bits_uop_cf_trigger_backendHit_1 = 4'hf == loadReplaySel_0_REG ? uop_15_cf_trigger_backendHit_1 :
    _GEN_622; // @[LoadQueueReplay.scala 321:{27,27}]
  assign io_replay_0_bits_uop_cf_trigger_backendHit_4 = 4'hf == loadReplaySel_0_REG ? uop_15_cf_trigger_backendHit_4 :
    _GEN_670; // @[LoadQueueReplay.scala 321:{27,27}]
  assign io_replay_0_bits_uop_cf_waitForRobIdx_flag = 4'hf == loadReplaySel_0_REG ? uop_15_cf_waitForRobIdx_flag :
    _GEN_830; // @[LoadQueueReplay.scala 321:{27,27}]
  assign io_replay_0_bits_uop_cf_waitForRobIdx_value = 4'hf == loadReplaySel_0_REG ? uop_15_cf_waitForRobIdx_value :
    _GEN_846; // @[LoadQueueReplay.scala 321:{27,27}]
  assign io_replay_0_bits_uop_cf_loadWaitBit = 4'hf == loadReplaySel_0_REG ? uop_15_cf_loadWaitBit : _GEN_862; // @[LoadQueueReplay.scala 321:{27,27}]
  assign io_replay_0_bits_uop_cf_loadWaitStrict = 4'hf == loadReplaySel_0_REG ? uop_15_cf_loadWaitStrict : _GEN_878; // @[LoadQueueReplay.scala 321:{27,27}]
  assign io_replay_0_bits_uop_cf_ftqPtr_flag = 4'hf == loadReplaySel_0_REG ? uop_15_cf_ftqPtr_flag : _GEN_910; // @[LoadQueueReplay.scala 321:{27,27}]
  assign io_replay_0_bits_uop_cf_ftqPtr_value = 4'hf == loadReplaySel_0_REG ? uop_15_cf_ftqPtr_value : _GEN_926; // @[LoadQueueReplay.scala 321:{27,27}]
  assign io_replay_0_bits_uop_cf_ftqOffset = 4'hf == loadReplaySel_0_REG ? uop_15_cf_ftqOffset : _GEN_942; // @[LoadQueueReplay.scala 321:{27,27}]
  assign io_replay_0_bits_uop_ctrl_fuType = 4'hf == loadReplaySel_0_REG ? uop_15_ctrl_fuType : _GEN_1086; // @[LoadQueueReplay.scala 321:{27,27}]
  assign io_replay_0_bits_uop_ctrl_fuOpType = 4'hf == loadReplaySel_0_REG ? uop_15_ctrl_fuOpType : _GEN_1102; // @[LoadQueueReplay.scala 321:{27,27}]
  assign io_replay_0_bits_uop_ctrl_rfWen = 4'hf == loadReplaySel_0_REG ? uop_15_ctrl_rfWen : _GEN_1118; // @[LoadQueueReplay.scala 321:{27,27}]
  assign io_replay_0_bits_uop_ctrl_fpWen = 4'hf == loadReplaySel_0_REG ? uop_15_ctrl_fpWen : _GEN_1134; // @[LoadQueueReplay.scala 321:{27,27}]
  assign io_replay_0_bits_uop_pdest = 4'hf == loadReplaySel_0_REG ? uop_15_pdest : _GEN_1630; // @[LoadQueueReplay.scala 321:{27,27}]
  assign io_replay_0_bits_uop_robIdx_flag = 4'hf == loadReplaySel_0_REG ? uop_15_robIdx_flag : _GEN_174; // @[CircularQueuePtr.scala 61:{50,50}]
  assign io_replay_0_bits_uop_robIdx_value = 4'hf == loadReplaySel_0_REG ? uop_15_robIdx_value : _GEN_190; // @[CircularQueuePtr.scala 61:{50,50}]
  assign io_replay_0_bits_uop_lqIdx_flag = 4'hf == loadReplaySel_0_REG ? uop_15_lqIdx_flag : _GEN_1662; // @[LoadQueueReplay.scala 321:{27,27}]
  assign io_replay_0_bits_uop_lqIdx_value = 4'hf == loadReplaySel_0_REG ? uop_15_lqIdx_value : _GEN_1678; // @[LoadQueueReplay.scala 321:{27,27}]
  assign io_replay_0_bits_uop_sqIdx_flag = 4'hf == loadReplaySel_0_REG ? uop_15_sqIdx_flag : _GEN_1694; // @[LoadQueueReplay.scala 321:{27,27}]
  assign io_replay_0_bits_uop_sqIdx_value = 4'hf == loadReplaySel_0_REG ? uop_15_sqIdx_value : _GEN_1710; // @[LoadQueueReplay.scala 321:{27,27}]
  assign io_replay_0_bits_vaddr = vaddrModule_io_rdata_0; // @[LoadQueueReplay.scala 322:29]
  assign io_replay_0_bits_isFirstIssue = _GEN_143[0]; // @[LoadQueueReplay.scala 323:55]
  assign io_replay_0_bits_replayCarry_real_way_en = 4'hf == loadReplaySel_0_REG ? replayCarryReg_15_real_way_en :
    _GEN_1902; // @[LoadQueueReplay.scala 325:{35,35}]
  assign io_replay_0_bits_replayCarry_valid = 4'hf == loadReplaySel_0_REG ? replayCarryReg_15_valid : _GEN_1918; // @[LoadQueueReplay.scala 325:{35,35}]
  assign io_replay_0_bits_mshrid = 4'hf == loadReplaySel_0_REG ? missMSHRId_15 : _GEN_1934; // @[LoadQueueReplay.scala 326:{30,30}]
  assign io_replay_0_bits_forward_tlDchannel = 4'hf == loadReplaySel_0_REG ? trueCacheMissReplay_15 : _GEN_1950; // @[LoadQueueReplay.scala 327:{42,42}]
  assign io_replay_0_bits_rarAllocated = 4'hf == loadReplaySel_0_REG ? flags_15_rarAllocated : _GEN_1966; // @[LoadQueueReplay.scala 328:{36,36}]
  assign io_replay_0_bits_rarIndex = 4'hf == loadReplaySel_0_REG ? flags_15_rarIndex : _GEN_1982; // @[LoadQueueReplay.scala 329:{32,32}]
  assign io_replay_0_bits_rawAllocated = 4'hf == loadReplaySel_0_REG ? flags_15_rawAllocated : _GEN_1998; // @[LoadQueueReplay.scala 330:{36,36}]
  assign io_replay_0_bits_rawIndex = 4'hf == loadReplaySel_0_REG ? flags_15_rawIndex : _GEN_2014; // @[LoadQueueReplay.scala 331:{32,32}]
  assign io_replay_1_valid = loadReplaySelV_1_REG & ~cancelReplay_1 & bankConflictReplay_1 & coldCounter < 3'h5; // @[LoadQueueReplay.scala 319:106]
  assign io_replay_1_bits_uop_cf_foldpc = 4'hf == loadReplaySel_1_REG ? uop_15_cf_foldpc : _GEN_2143; // @[LoadQueueReplay.scala 321:{27,27}]
  assign io_replay_1_bits_uop_cf_trigger_backendEn_1 = 4'hf == loadReplaySel_1_REG ? uop_15_cf_trigger_backendEn_1 :
    _GEN_2495; // @[LoadQueueReplay.scala 321:{27,27}]
  assign io_replay_1_bits_uop_cf_trigger_backendHit_0 = 4'hf == loadReplaySel_1_REG ? uop_15_cf_trigger_backendHit_0 :
    _GEN_2511; // @[LoadQueueReplay.scala 321:{27,27}]
  assign io_replay_1_bits_uop_cf_trigger_backendHit_1 = 4'hf == loadReplaySel_1_REG ? uop_15_cf_trigger_backendHit_1 :
    _GEN_2527; // @[LoadQueueReplay.scala 321:{27,27}]
  assign io_replay_1_bits_uop_cf_trigger_backendHit_4 = 4'hf == loadReplaySel_1_REG ? uop_15_cf_trigger_backendHit_4 :
    _GEN_2575; // @[LoadQueueReplay.scala 321:{27,27}]
  assign io_replay_1_bits_uop_cf_waitForRobIdx_flag = 4'hf == loadReplaySel_1_REG ? uop_15_cf_waitForRobIdx_flag :
    _GEN_2735; // @[LoadQueueReplay.scala 321:{27,27}]
  assign io_replay_1_bits_uop_cf_waitForRobIdx_value = 4'hf == loadReplaySel_1_REG ? uop_15_cf_waitForRobIdx_value :
    _GEN_2751; // @[LoadQueueReplay.scala 321:{27,27}]
  assign io_replay_1_bits_uop_cf_loadWaitBit = 4'hf == loadReplaySel_1_REG ? uop_15_cf_loadWaitBit : _GEN_2767; // @[LoadQueueReplay.scala 321:{27,27}]
  assign io_replay_1_bits_uop_cf_loadWaitStrict = 4'hf == loadReplaySel_1_REG ? uop_15_cf_loadWaitStrict : _GEN_2783; // @[LoadQueueReplay.scala 321:{27,27}]
  assign io_replay_1_bits_uop_cf_ftqPtr_flag = 4'hf == loadReplaySel_1_REG ? uop_15_cf_ftqPtr_flag : _GEN_2815; // @[LoadQueueReplay.scala 321:{27,27}]
  assign io_replay_1_bits_uop_cf_ftqPtr_value = 4'hf == loadReplaySel_1_REG ? uop_15_cf_ftqPtr_value : _GEN_2831; // @[LoadQueueReplay.scala 321:{27,27}]
  assign io_replay_1_bits_uop_cf_ftqOffset = 4'hf == loadReplaySel_1_REG ? uop_15_cf_ftqOffset : _GEN_2847; // @[LoadQueueReplay.scala 321:{27,27}]
  assign io_replay_1_bits_uop_ctrl_fuType = 4'hf == loadReplaySel_1_REG ? uop_15_ctrl_fuType : _GEN_2991; // @[LoadQueueReplay.scala 321:{27,27}]
  assign io_replay_1_bits_uop_ctrl_fuOpType = 4'hf == loadReplaySel_1_REG ? uop_15_ctrl_fuOpType : _GEN_3007; // @[LoadQueueReplay.scala 321:{27,27}]
  assign io_replay_1_bits_uop_ctrl_rfWen = 4'hf == loadReplaySel_1_REG ? uop_15_ctrl_rfWen : _GEN_3023; // @[LoadQueueReplay.scala 321:{27,27}]
  assign io_replay_1_bits_uop_ctrl_fpWen = 4'hf == loadReplaySel_1_REG ? uop_15_ctrl_fpWen : _GEN_3039; // @[LoadQueueReplay.scala 321:{27,27}]
  assign io_replay_1_bits_uop_pdest = 4'hf == loadReplaySel_1_REG ? uop_15_pdest : _GEN_3535; // @[LoadQueueReplay.scala 321:{27,27}]
  assign io_replay_1_bits_uop_robIdx_flag = 4'hf == loadReplaySel_1_REG ? uop_15_robIdx_flag : _GEN_2079; // @[CircularQueuePtr.scala 61:{50,50}]
  assign io_replay_1_bits_uop_robIdx_value = 4'hf == loadReplaySel_1_REG ? uop_15_robIdx_value : _GEN_2095; // @[CircularQueuePtr.scala 61:{50,50}]
  assign io_replay_1_bits_uop_lqIdx_flag = 4'hf == loadReplaySel_1_REG ? uop_15_lqIdx_flag : _GEN_3567; // @[LoadQueueReplay.scala 321:{27,27}]
  assign io_replay_1_bits_uop_lqIdx_value = 4'hf == loadReplaySel_1_REG ? uop_15_lqIdx_value : _GEN_3583; // @[LoadQueueReplay.scala 321:{27,27}]
  assign io_replay_1_bits_uop_sqIdx_flag = 4'hf == loadReplaySel_1_REG ? uop_15_sqIdx_flag : _GEN_3599; // @[LoadQueueReplay.scala 321:{27,27}]
  assign io_replay_1_bits_uop_sqIdx_value = 4'hf == loadReplaySel_1_REG ? uop_15_sqIdx_value : _GEN_3615; // @[LoadQueueReplay.scala 321:{27,27}]
  assign io_replay_1_bits_vaddr = vaddrModule_io_rdata_1; // @[LoadQueueReplay.scala 322:29]
  assign io_replay_1_bits_isFirstIssue = _GEN_159[0]; // @[LoadQueueReplay.scala 323:55]
  assign io_replay_1_bits_replayCarry_real_way_en = 4'hf == loadReplaySel_1_REG ? replayCarryReg_15_real_way_en :
    _GEN_3807; // @[LoadQueueReplay.scala 325:{35,35}]
  assign io_replay_1_bits_replayCarry_valid = 4'hf == loadReplaySel_1_REG ? replayCarryReg_15_valid : _GEN_3823; // @[LoadQueueReplay.scala 325:{35,35}]
  assign io_replay_1_bits_mshrid = 4'hf == loadReplaySel_1_REG ? missMSHRId_15 : _GEN_3839; // @[LoadQueueReplay.scala 326:{30,30}]
  assign io_replay_1_bits_forward_tlDchannel = 4'hf == loadReplaySel_1_REG ? trueCacheMissReplay_15 : _GEN_3855; // @[LoadQueueReplay.scala 327:{42,42}]
  assign io_replay_1_bits_rarAllocated = 4'hf == loadReplaySel_1_REG ? flags_15_rarAllocated : _GEN_3871; // @[LoadQueueReplay.scala 328:{36,36}]
  assign io_replay_1_bits_rarIndex = 4'hf == loadReplaySel_1_REG ? flags_15_rarIndex : _GEN_3887; // @[LoadQueueReplay.scala 329:{32,32}]
  assign io_replay_1_bits_rawAllocated = 4'hf == loadReplaySel_1_REG ? flags_15_rawAllocated : _GEN_3903; // @[LoadQueueReplay.scala 330:{36,36}]
  assign io_replay_1_bits_rawIndex = 4'hf == loadReplaySel_1_REG ? flags_15_rawIndex : _GEN_3919; // @[LoadQueueReplay.scala 331:{32,32}]
  assign io_lqFull = _lqFull_T_31 <= 5'ha; // @[LoadQueueReplay.scala 356:62]
  assign io_perf_0_value = {{4'd0}, io_perf_0_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_1_value = {{4'd0}, io_perf_1_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_2_value = {{4'd0}, io_perf_2_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_3_value = {{5'd0}, io_perf_3_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_4_value = {{4'd0}, io_perf_4_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_5_value = {{4'd0}, io_perf_5_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_6_value = {{4'd0}, io_perf_6_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_7_value = {{4'd0}, io_perf_7_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_8_value = {{4'd0}, io_perf_8_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_9_value = {{4'd0}, io_perf_9_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_10_value = {{4'd0}, io_perf_10_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_11_value = {{4'd0}, io_perf_11_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign vaddrModule_clock = clock;
  assign vaddrModule_io_raddr_0 = {loadReplayRemSel_0,1'h0}; // @[Cat.scala 31:58]
  assign vaddrModule_io_raddr_1 = {loadReplayRemSel_1,1'h1}; // @[Cat.scala 31:58]
  assign vaddrModule_io_wen_0 = io_enq_0_valid & ~cancelEnq_0 & needReplay_0 & ~hasExceptions_0; // @[LoadQueueReplay.scala 180:53]
  assign vaddrModule_io_wen_1 = io_enq_1_valid & ~cancelEnq_1 & needReplay_1 & ~hasExceptions_1; // @[LoadQueueReplay.scala 180:53]
  assign vaddrModule_io_waddr_0 = {_enqIdx_T,_enqIdx_T_8}; // @[Cat.scala 31:58]
  assign vaddrModule_io_waddr_1 = {_enqIdx_T_9,_enqIdx_T_17}; // @[Cat.scala 31:58]
  assign vaddrModule_io_wdata_0 = io_enq_0_bits_vaddr; // @[LoadQueueReplay.scala 362:29 371:31]
  assign vaddrModule_io_wdata_1 = io_enq_1_bits_vaddr; // @[LoadQueueReplay.scala 362:29 371:31]
  always @(posedge clock) begin
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h0 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_0_cf_foldpc <= io_enq_1_bits_uop_cf_foldpc; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_0_cf_foldpc <= _GEN_6604;
      end
    end else begin
      uop_0_cf_foldpc <= _GEN_6604;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h0 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_0_cf_trigger_backendEn_1 <= io_enq_1_bits_uop_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_0_cf_trigger_backendEn_1 <= _GEN_6956;
      end
    end else begin
      uop_0_cf_trigger_backendEn_1 <= _GEN_6956;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h0 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_0_cf_trigger_backendHit_0 <= io_enq_1_bits_uop_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_0_cf_trigger_backendHit_0 <= _GEN_6972;
      end
    end else begin
      uop_0_cf_trigger_backendHit_0 <= _GEN_6972;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h0 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_0_cf_trigger_backendHit_1 <= io_enq_1_bits_uop_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_0_cf_trigger_backendHit_1 <= _GEN_6988;
      end
    end else begin
      uop_0_cf_trigger_backendHit_1 <= _GEN_6988;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h0 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_0_cf_trigger_backendHit_4 <= io_enq_1_bits_uop_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_0_cf_trigger_backendHit_4 <= _GEN_7036;
      end
    end else begin
      uop_0_cf_trigger_backendHit_4 <= _GEN_7036;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h0 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_0_cf_waitForRobIdx_flag <= io_enq_1_bits_uop_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_0_cf_waitForRobIdx_flag <= _GEN_7196;
      end
    end else begin
      uop_0_cf_waitForRobIdx_flag <= _GEN_7196;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h0 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_0_cf_waitForRobIdx_value <= io_enq_1_bits_uop_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_0_cf_waitForRobIdx_value <= _GEN_7212;
      end
    end else begin
      uop_0_cf_waitForRobIdx_value <= _GEN_7212;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h0 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_0_cf_loadWaitBit <= io_enq_1_bits_uop_cf_loadWaitBit; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_0_cf_loadWaitBit <= _GEN_7228;
      end
    end else begin
      uop_0_cf_loadWaitBit <= _GEN_7228;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h0 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_0_cf_loadWaitStrict <= io_enq_1_bits_uop_cf_loadWaitStrict; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_0_cf_loadWaitStrict <= _GEN_7244;
      end
    end else begin
      uop_0_cf_loadWaitStrict <= _GEN_7244;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h0 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_0_cf_ftqPtr_flag <= io_enq_1_bits_uop_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_0_cf_ftqPtr_flag <= _GEN_7276;
      end
    end else begin
      uop_0_cf_ftqPtr_flag <= _GEN_7276;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h0 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_0_cf_ftqPtr_value <= io_enq_1_bits_uop_cf_ftqPtr_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_0_cf_ftqPtr_value <= _GEN_7292;
      end
    end else begin
      uop_0_cf_ftqPtr_value <= _GEN_7292;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h0 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_0_cf_ftqOffset <= io_enq_1_bits_uop_cf_ftqOffset; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_0_cf_ftqOffset <= _GEN_7308;
      end
    end else begin
      uop_0_cf_ftqOffset <= _GEN_7308;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h0 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_0_ctrl_fuType <= io_enq_1_bits_uop_ctrl_fuType; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_0_ctrl_fuType <= _GEN_7452;
      end
    end else begin
      uop_0_ctrl_fuType <= _GEN_7452;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h0 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_0_ctrl_fuOpType <= io_enq_1_bits_uop_ctrl_fuOpType; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_0_ctrl_fuOpType <= _GEN_7468;
      end
    end else begin
      uop_0_ctrl_fuOpType <= _GEN_7468;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h0 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_0_ctrl_rfWen <= io_enq_1_bits_uop_ctrl_rfWen; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_0_ctrl_rfWen <= _GEN_7484;
      end
    end else begin
      uop_0_ctrl_rfWen <= _GEN_7484;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h0 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_0_ctrl_fpWen <= io_enq_1_bits_uop_ctrl_fpWen; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_0_ctrl_fpWen <= _GEN_7500;
      end
    end else begin
      uop_0_ctrl_fpWen <= _GEN_7500;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h0 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_0_pdest <= io_enq_1_bits_uop_pdest; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_0_pdest <= _GEN_7996;
      end
    end else begin
      uop_0_pdest <= _GEN_7996;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h0 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_0_robIdx_flag <= io_enq_1_bits_uop_robIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_0_robIdx_flag <= _GEN_8028;
      end
    end else begin
      uop_0_robIdx_flag <= _GEN_8028;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h0 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_0_robIdx_value <= io_enq_1_bits_uop_robIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_0_robIdx_value <= _GEN_8044;
      end
    end else begin
      uop_0_robIdx_value <= _GEN_8044;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h0 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_0_lqIdx_flag <= io_enq_1_bits_uop_lqIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_0_lqIdx_flag <= _GEN_8060;
      end
    end else begin
      uop_0_lqIdx_flag <= _GEN_8060;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h0 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_0_lqIdx_value <= io_enq_1_bits_uop_lqIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_0_lqIdx_value <= _GEN_8076;
      end
    end else begin
      uop_0_lqIdx_value <= _GEN_8076;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h0 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_0_sqIdx_flag <= io_enq_1_bits_uop_sqIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_0_sqIdx_flag <= _GEN_8092;
      end
    end else begin
      uop_0_sqIdx_flag <= _GEN_8092;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h0 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_0_sqIdx_value <= io_enq_1_bits_uop_sqIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_0_sqIdx_value <= _GEN_8108;
      end
    end else begin
      uop_0_sqIdx_value <= _GEN_8108;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h1 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_1_cf_foldpc <= io_enq_1_bits_uop_cf_foldpc; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_1_cf_foldpc <= _GEN_6605;
      end
    end else begin
      uop_1_cf_foldpc <= _GEN_6605;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h1 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_1_cf_trigger_backendEn_1 <= io_enq_1_bits_uop_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_1_cf_trigger_backendEn_1 <= _GEN_6957;
      end
    end else begin
      uop_1_cf_trigger_backendEn_1 <= _GEN_6957;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h1 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_1_cf_trigger_backendHit_0 <= io_enq_1_bits_uop_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_1_cf_trigger_backendHit_0 <= _GEN_6973;
      end
    end else begin
      uop_1_cf_trigger_backendHit_0 <= _GEN_6973;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h1 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_1_cf_trigger_backendHit_1 <= io_enq_1_bits_uop_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_1_cf_trigger_backendHit_1 <= _GEN_6989;
      end
    end else begin
      uop_1_cf_trigger_backendHit_1 <= _GEN_6989;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h1 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_1_cf_trigger_backendHit_4 <= io_enq_1_bits_uop_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_1_cf_trigger_backendHit_4 <= _GEN_7037;
      end
    end else begin
      uop_1_cf_trigger_backendHit_4 <= _GEN_7037;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h1 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_1_cf_waitForRobIdx_flag <= io_enq_1_bits_uop_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_1_cf_waitForRobIdx_flag <= _GEN_7197;
      end
    end else begin
      uop_1_cf_waitForRobIdx_flag <= _GEN_7197;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h1 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_1_cf_waitForRobIdx_value <= io_enq_1_bits_uop_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_1_cf_waitForRobIdx_value <= _GEN_7213;
      end
    end else begin
      uop_1_cf_waitForRobIdx_value <= _GEN_7213;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h1 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_1_cf_loadWaitBit <= io_enq_1_bits_uop_cf_loadWaitBit; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_1_cf_loadWaitBit <= _GEN_7229;
      end
    end else begin
      uop_1_cf_loadWaitBit <= _GEN_7229;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h1 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_1_cf_loadWaitStrict <= io_enq_1_bits_uop_cf_loadWaitStrict; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_1_cf_loadWaitStrict <= _GEN_7245;
      end
    end else begin
      uop_1_cf_loadWaitStrict <= _GEN_7245;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h1 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_1_cf_ftqPtr_flag <= io_enq_1_bits_uop_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_1_cf_ftqPtr_flag <= _GEN_7277;
      end
    end else begin
      uop_1_cf_ftqPtr_flag <= _GEN_7277;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h1 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_1_cf_ftqPtr_value <= io_enq_1_bits_uop_cf_ftqPtr_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_1_cf_ftqPtr_value <= _GEN_7293;
      end
    end else begin
      uop_1_cf_ftqPtr_value <= _GEN_7293;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h1 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_1_cf_ftqOffset <= io_enq_1_bits_uop_cf_ftqOffset; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_1_cf_ftqOffset <= _GEN_7309;
      end
    end else begin
      uop_1_cf_ftqOffset <= _GEN_7309;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h1 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_1_ctrl_fuType <= io_enq_1_bits_uop_ctrl_fuType; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_1_ctrl_fuType <= _GEN_7453;
      end
    end else begin
      uop_1_ctrl_fuType <= _GEN_7453;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h1 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_1_ctrl_fuOpType <= io_enq_1_bits_uop_ctrl_fuOpType; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_1_ctrl_fuOpType <= _GEN_7469;
      end
    end else begin
      uop_1_ctrl_fuOpType <= _GEN_7469;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h1 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_1_ctrl_rfWen <= io_enq_1_bits_uop_ctrl_rfWen; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_1_ctrl_rfWen <= _GEN_7485;
      end
    end else begin
      uop_1_ctrl_rfWen <= _GEN_7485;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h1 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_1_ctrl_fpWen <= io_enq_1_bits_uop_ctrl_fpWen; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_1_ctrl_fpWen <= _GEN_7501;
      end
    end else begin
      uop_1_ctrl_fpWen <= _GEN_7501;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h1 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_1_pdest <= io_enq_1_bits_uop_pdest; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_1_pdest <= _GEN_7997;
      end
    end else begin
      uop_1_pdest <= _GEN_7997;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h1 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_1_robIdx_flag <= io_enq_1_bits_uop_robIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_1_robIdx_flag <= _GEN_8029;
      end
    end else begin
      uop_1_robIdx_flag <= _GEN_8029;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h1 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_1_robIdx_value <= io_enq_1_bits_uop_robIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_1_robIdx_value <= _GEN_8045;
      end
    end else begin
      uop_1_robIdx_value <= _GEN_8045;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h1 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_1_lqIdx_flag <= io_enq_1_bits_uop_lqIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_1_lqIdx_flag <= _GEN_8061;
      end
    end else begin
      uop_1_lqIdx_flag <= _GEN_8061;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h1 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_1_lqIdx_value <= io_enq_1_bits_uop_lqIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_1_lqIdx_value <= _GEN_8077;
      end
    end else begin
      uop_1_lqIdx_value <= _GEN_8077;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h1 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_1_sqIdx_flag <= io_enq_1_bits_uop_sqIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_1_sqIdx_flag <= _GEN_8093;
      end
    end else begin
      uop_1_sqIdx_flag <= _GEN_8093;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h1 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_1_sqIdx_value <= io_enq_1_bits_uop_sqIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_1_sqIdx_value <= _GEN_8109;
      end
    end else begin
      uop_1_sqIdx_value <= _GEN_8109;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h2 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_2_cf_foldpc <= io_enq_1_bits_uop_cf_foldpc; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_2_cf_foldpc <= _GEN_6606;
      end
    end else begin
      uop_2_cf_foldpc <= _GEN_6606;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h2 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_2_cf_trigger_backendEn_1 <= io_enq_1_bits_uop_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_2_cf_trigger_backendEn_1 <= _GEN_6958;
      end
    end else begin
      uop_2_cf_trigger_backendEn_1 <= _GEN_6958;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h2 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_2_cf_trigger_backendHit_0 <= io_enq_1_bits_uop_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_2_cf_trigger_backendHit_0 <= _GEN_6974;
      end
    end else begin
      uop_2_cf_trigger_backendHit_0 <= _GEN_6974;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h2 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_2_cf_trigger_backendHit_1 <= io_enq_1_bits_uop_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_2_cf_trigger_backendHit_1 <= _GEN_6990;
      end
    end else begin
      uop_2_cf_trigger_backendHit_1 <= _GEN_6990;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h2 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_2_cf_trigger_backendHit_4 <= io_enq_1_bits_uop_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_2_cf_trigger_backendHit_4 <= _GEN_7038;
      end
    end else begin
      uop_2_cf_trigger_backendHit_4 <= _GEN_7038;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h2 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_2_cf_waitForRobIdx_flag <= io_enq_1_bits_uop_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_2_cf_waitForRobIdx_flag <= _GEN_7198;
      end
    end else begin
      uop_2_cf_waitForRobIdx_flag <= _GEN_7198;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h2 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_2_cf_waitForRobIdx_value <= io_enq_1_bits_uop_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_2_cf_waitForRobIdx_value <= _GEN_7214;
      end
    end else begin
      uop_2_cf_waitForRobIdx_value <= _GEN_7214;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h2 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_2_cf_loadWaitBit <= io_enq_1_bits_uop_cf_loadWaitBit; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_2_cf_loadWaitBit <= _GEN_7230;
      end
    end else begin
      uop_2_cf_loadWaitBit <= _GEN_7230;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h2 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_2_cf_loadWaitStrict <= io_enq_1_bits_uop_cf_loadWaitStrict; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_2_cf_loadWaitStrict <= _GEN_7246;
      end
    end else begin
      uop_2_cf_loadWaitStrict <= _GEN_7246;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h2 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_2_cf_ftqPtr_flag <= io_enq_1_bits_uop_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_2_cf_ftqPtr_flag <= _GEN_7278;
      end
    end else begin
      uop_2_cf_ftqPtr_flag <= _GEN_7278;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h2 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_2_cf_ftqPtr_value <= io_enq_1_bits_uop_cf_ftqPtr_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_2_cf_ftqPtr_value <= _GEN_7294;
      end
    end else begin
      uop_2_cf_ftqPtr_value <= _GEN_7294;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h2 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_2_cf_ftqOffset <= io_enq_1_bits_uop_cf_ftqOffset; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_2_cf_ftqOffset <= _GEN_7310;
      end
    end else begin
      uop_2_cf_ftqOffset <= _GEN_7310;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h2 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_2_ctrl_fuType <= io_enq_1_bits_uop_ctrl_fuType; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_2_ctrl_fuType <= _GEN_7454;
      end
    end else begin
      uop_2_ctrl_fuType <= _GEN_7454;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h2 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_2_ctrl_fuOpType <= io_enq_1_bits_uop_ctrl_fuOpType; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_2_ctrl_fuOpType <= _GEN_7470;
      end
    end else begin
      uop_2_ctrl_fuOpType <= _GEN_7470;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h2 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_2_ctrl_rfWen <= io_enq_1_bits_uop_ctrl_rfWen; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_2_ctrl_rfWen <= _GEN_7486;
      end
    end else begin
      uop_2_ctrl_rfWen <= _GEN_7486;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h2 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_2_ctrl_fpWen <= io_enq_1_bits_uop_ctrl_fpWen; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_2_ctrl_fpWen <= _GEN_7502;
      end
    end else begin
      uop_2_ctrl_fpWen <= _GEN_7502;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h2 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_2_pdest <= io_enq_1_bits_uop_pdest; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_2_pdest <= _GEN_7998;
      end
    end else begin
      uop_2_pdest <= _GEN_7998;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h2 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_2_robIdx_flag <= io_enq_1_bits_uop_robIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_2_robIdx_flag <= _GEN_8030;
      end
    end else begin
      uop_2_robIdx_flag <= _GEN_8030;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h2 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_2_robIdx_value <= io_enq_1_bits_uop_robIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_2_robIdx_value <= _GEN_8046;
      end
    end else begin
      uop_2_robIdx_value <= _GEN_8046;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h2 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_2_lqIdx_flag <= io_enq_1_bits_uop_lqIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_2_lqIdx_flag <= _GEN_8062;
      end
    end else begin
      uop_2_lqIdx_flag <= _GEN_8062;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h2 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_2_lqIdx_value <= io_enq_1_bits_uop_lqIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_2_lqIdx_value <= _GEN_8078;
      end
    end else begin
      uop_2_lqIdx_value <= _GEN_8078;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h2 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_2_sqIdx_flag <= io_enq_1_bits_uop_sqIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_2_sqIdx_flag <= _GEN_8094;
      end
    end else begin
      uop_2_sqIdx_flag <= _GEN_8094;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h2 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_2_sqIdx_value <= io_enq_1_bits_uop_sqIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_2_sqIdx_value <= _GEN_8110;
      end
    end else begin
      uop_2_sqIdx_value <= _GEN_8110;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h3 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_3_cf_foldpc <= io_enq_1_bits_uop_cf_foldpc; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_3_cf_foldpc <= _GEN_6607;
      end
    end else begin
      uop_3_cf_foldpc <= _GEN_6607;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h3 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_3_cf_trigger_backendEn_1 <= io_enq_1_bits_uop_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_3_cf_trigger_backendEn_1 <= _GEN_6959;
      end
    end else begin
      uop_3_cf_trigger_backendEn_1 <= _GEN_6959;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h3 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_3_cf_trigger_backendHit_0 <= io_enq_1_bits_uop_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_3_cf_trigger_backendHit_0 <= _GEN_6975;
      end
    end else begin
      uop_3_cf_trigger_backendHit_0 <= _GEN_6975;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h3 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_3_cf_trigger_backendHit_1 <= io_enq_1_bits_uop_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_3_cf_trigger_backendHit_1 <= _GEN_6991;
      end
    end else begin
      uop_3_cf_trigger_backendHit_1 <= _GEN_6991;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h3 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_3_cf_trigger_backendHit_4 <= io_enq_1_bits_uop_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_3_cf_trigger_backendHit_4 <= _GEN_7039;
      end
    end else begin
      uop_3_cf_trigger_backendHit_4 <= _GEN_7039;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h3 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_3_cf_waitForRobIdx_flag <= io_enq_1_bits_uop_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_3_cf_waitForRobIdx_flag <= _GEN_7199;
      end
    end else begin
      uop_3_cf_waitForRobIdx_flag <= _GEN_7199;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h3 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_3_cf_waitForRobIdx_value <= io_enq_1_bits_uop_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_3_cf_waitForRobIdx_value <= _GEN_7215;
      end
    end else begin
      uop_3_cf_waitForRobIdx_value <= _GEN_7215;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h3 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_3_cf_loadWaitBit <= io_enq_1_bits_uop_cf_loadWaitBit; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_3_cf_loadWaitBit <= _GEN_7231;
      end
    end else begin
      uop_3_cf_loadWaitBit <= _GEN_7231;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h3 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_3_cf_loadWaitStrict <= io_enq_1_bits_uop_cf_loadWaitStrict; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_3_cf_loadWaitStrict <= _GEN_7247;
      end
    end else begin
      uop_3_cf_loadWaitStrict <= _GEN_7247;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h3 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_3_cf_ftqPtr_flag <= io_enq_1_bits_uop_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_3_cf_ftqPtr_flag <= _GEN_7279;
      end
    end else begin
      uop_3_cf_ftqPtr_flag <= _GEN_7279;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h3 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_3_cf_ftqPtr_value <= io_enq_1_bits_uop_cf_ftqPtr_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_3_cf_ftqPtr_value <= _GEN_7295;
      end
    end else begin
      uop_3_cf_ftqPtr_value <= _GEN_7295;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h3 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_3_cf_ftqOffset <= io_enq_1_bits_uop_cf_ftqOffset; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_3_cf_ftqOffset <= _GEN_7311;
      end
    end else begin
      uop_3_cf_ftqOffset <= _GEN_7311;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h3 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_3_ctrl_fuType <= io_enq_1_bits_uop_ctrl_fuType; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_3_ctrl_fuType <= _GEN_7455;
      end
    end else begin
      uop_3_ctrl_fuType <= _GEN_7455;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h3 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_3_ctrl_fuOpType <= io_enq_1_bits_uop_ctrl_fuOpType; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_3_ctrl_fuOpType <= _GEN_7471;
      end
    end else begin
      uop_3_ctrl_fuOpType <= _GEN_7471;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h3 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_3_ctrl_rfWen <= io_enq_1_bits_uop_ctrl_rfWen; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_3_ctrl_rfWen <= _GEN_7487;
      end
    end else begin
      uop_3_ctrl_rfWen <= _GEN_7487;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h3 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_3_ctrl_fpWen <= io_enq_1_bits_uop_ctrl_fpWen; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_3_ctrl_fpWen <= _GEN_7503;
      end
    end else begin
      uop_3_ctrl_fpWen <= _GEN_7503;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h3 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_3_pdest <= io_enq_1_bits_uop_pdest; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_3_pdest <= _GEN_7999;
      end
    end else begin
      uop_3_pdest <= _GEN_7999;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h3 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_3_robIdx_flag <= io_enq_1_bits_uop_robIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_3_robIdx_flag <= _GEN_8031;
      end
    end else begin
      uop_3_robIdx_flag <= _GEN_8031;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h3 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_3_robIdx_value <= io_enq_1_bits_uop_robIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_3_robIdx_value <= _GEN_8047;
      end
    end else begin
      uop_3_robIdx_value <= _GEN_8047;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h3 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_3_lqIdx_flag <= io_enq_1_bits_uop_lqIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_3_lqIdx_flag <= _GEN_8063;
      end
    end else begin
      uop_3_lqIdx_flag <= _GEN_8063;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h3 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_3_lqIdx_value <= io_enq_1_bits_uop_lqIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_3_lqIdx_value <= _GEN_8079;
      end
    end else begin
      uop_3_lqIdx_value <= _GEN_8079;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h3 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_3_sqIdx_flag <= io_enq_1_bits_uop_sqIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_3_sqIdx_flag <= _GEN_8095;
      end
    end else begin
      uop_3_sqIdx_flag <= _GEN_8095;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h3 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_3_sqIdx_value <= io_enq_1_bits_uop_sqIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_3_sqIdx_value <= _GEN_8111;
      end
    end else begin
      uop_3_sqIdx_value <= _GEN_8111;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h4 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_4_cf_foldpc <= io_enq_1_bits_uop_cf_foldpc; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_4_cf_foldpc <= _GEN_6608;
      end
    end else begin
      uop_4_cf_foldpc <= _GEN_6608;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h4 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_4_cf_trigger_backendEn_1 <= io_enq_1_bits_uop_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_4_cf_trigger_backendEn_1 <= _GEN_6960;
      end
    end else begin
      uop_4_cf_trigger_backendEn_1 <= _GEN_6960;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h4 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_4_cf_trigger_backendHit_0 <= io_enq_1_bits_uop_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_4_cf_trigger_backendHit_0 <= _GEN_6976;
      end
    end else begin
      uop_4_cf_trigger_backendHit_0 <= _GEN_6976;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h4 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_4_cf_trigger_backendHit_1 <= io_enq_1_bits_uop_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_4_cf_trigger_backendHit_1 <= _GEN_6992;
      end
    end else begin
      uop_4_cf_trigger_backendHit_1 <= _GEN_6992;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h4 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_4_cf_trigger_backendHit_4 <= io_enq_1_bits_uop_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_4_cf_trigger_backendHit_4 <= _GEN_7040;
      end
    end else begin
      uop_4_cf_trigger_backendHit_4 <= _GEN_7040;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h4 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_4_cf_waitForRobIdx_flag <= io_enq_1_bits_uop_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_4_cf_waitForRobIdx_flag <= _GEN_7200;
      end
    end else begin
      uop_4_cf_waitForRobIdx_flag <= _GEN_7200;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h4 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_4_cf_waitForRobIdx_value <= io_enq_1_bits_uop_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_4_cf_waitForRobIdx_value <= _GEN_7216;
      end
    end else begin
      uop_4_cf_waitForRobIdx_value <= _GEN_7216;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h4 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_4_cf_loadWaitBit <= io_enq_1_bits_uop_cf_loadWaitBit; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_4_cf_loadWaitBit <= _GEN_7232;
      end
    end else begin
      uop_4_cf_loadWaitBit <= _GEN_7232;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h4 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_4_cf_loadWaitStrict <= io_enq_1_bits_uop_cf_loadWaitStrict; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_4_cf_loadWaitStrict <= _GEN_7248;
      end
    end else begin
      uop_4_cf_loadWaitStrict <= _GEN_7248;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h4 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_4_cf_ftqPtr_flag <= io_enq_1_bits_uop_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_4_cf_ftqPtr_flag <= _GEN_7280;
      end
    end else begin
      uop_4_cf_ftqPtr_flag <= _GEN_7280;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h4 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_4_cf_ftqPtr_value <= io_enq_1_bits_uop_cf_ftqPtr_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_4_cf_ftqPtr_value <= _GEN_7296;
      end
    end else begin
      uop_4_cf_ftqPtr_value <= _GEN_7296;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h4 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_4_cf_ftqOffset <= io_enq_1_bits_uop_cf_ftqOffset; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_4_cf_ftqOffset <= _GEN_7312;
      end
    end else begin
      uop_4_cf_ftqOffset <= _GEN_7312;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h4 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_4_ctrl_fuType <= io_enq_1_bits_uop_ctrl_fuType; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_4_ctrl_fuType <= _GEN_7456;
      end
    end else begin
      uop_4_ctrl_fuType <= _GEN_7456;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h4 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_4_ctrl_fuOpType <= io_enq_1_bits_uop_ctrl_fuOpType; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_4_ctrl_fuOpType <= _GEN_7472;
      end
    end else begin
      uop_4_ctrl_fuOpType <= _GEN_7472;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h4 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_4_ctrl_rfWen <= io_enq_1_bits_uop_ctrl_rfWen; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_4_ctrl_rfWen <= _GEN_7488;
      end
    end else begin
      uop_4_ctrl_rfWen <= _GEN_7488;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h4 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_4_ctrl_fpWen <= io_enq_1_bits_uop_ctrl_fpWen; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_4_ctrl_fpWen <= _GEN_7504;
      end
    end else begin
      uop_4_ctrl_fpWen <= _GEN_7504;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h4 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_4_pdest <= io_enq_1_bits_uop_pdest; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_4_pdest <= _GEN_8000;
      end
    end else begin
      uop_4_pdest <= _GEN_8000;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h4 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_4_robIdx_flag <= io_enq_1_bits_uop_robIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_4_robIdx_flag <= _GEN_8032;
      end
    end else begin
      uop_4_robIdx_flag <= _GEN_8032;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h4 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_4_robIdx_value <= io_enq_1_bits_uop_robIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_4_robIdx_value <= _GEN_8048;
      end
    end else begin
      uop_4_robIdx_value <= _GEN_8048;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h4 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_4_lqIdx_flag <= io_enq_1_bits_uop_lqIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_4_lqIdx_flag <= _GEN_8064;
      end
    end else begin
      uop_4_lqIdx_flag <= _GEN_8064;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h4 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_4_lqIdx_value <= io_enq_1_bits_uop_lqIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_4_lqIdx_value <= _GEN_8080;
      end
    end else begin
      uop_4_lqIdx_value <= _GEN_8080;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h4 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_4_sqIdx_flag <= io_enq_1_bits_uop_sqIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_4_sqIdx_flag <= _GEN_8096;
      end
    end else begin
      uop_4_sqIdx_flag <= _GEN_8096;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h4 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_4_sqIdx_value <= io_enq_1_bits_uop_sqIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_4_sqIdx_value <= _GEN_8112;
      end
    end else begin
      uop_4_sqIdx_value <= _GEN_8112;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h5 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_5_cf_foldpc <= io_enq_1_bits_uop_cf_foldpc; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_5_cf_foldpc <= _GEN_6609;
      end
    end else begin
      uop_5_cf_foldpc <= _GEN_6609;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h5 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_5_cf_trigger_backendEn_1 <= io_enq_1_bits_uop_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_5_cf_trigger_backendEn_1 <= _GEN_6961;
      end
    end else begin
      uop_5_cf_trigger_backendEn_1 <= _GEN_6961;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h5 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_5_cf_trigger_backendHit_0 <= io_enq_1_bits_uop_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_5_cf_trigger_backendHit_0 <= _GEN_6977;
      end
    end else begin
      uop_5_cf_trigger_backendHit_0 <= _GEN_6977;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h5 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_5_cf_trigger_backendHit_1 <= io_enq_1_bits_uop_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_5_cf_trigger_backendHit_1 <= _GEN_6993;
      end
    end else begin
      uop_5_cf_trigger_backendHit_1 <= _GEN_6993;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h5 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_5_cf_trigger_backendHit_4 <= io_enq_1_bits_uop_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_5_cf_trigger_backendHit_4 <= _GEN_7041;
      end
    end else begin
      uop_5_cf_trigger_backendHit_4 <= _GEN_7041;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h5 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_5_cf_waitForRobIdx_flag <= io_enq_1_bits_uop_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_5_cf_waitForRobIdx_flag <= _GEN_7201;
      end
    end else begin
      uop_5_cf_waitForRobIdx_flag <= _GEN_7201;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h5 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_5_cf_waitForRobIdx_value <= io_enq_1_bits_uop_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_5_cf_waitForRobIdx_value <= _GEN_7217;
      end
    end else begin
      uop_5_cf_waitForRobIdx_value <= _GEN_7217;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h5 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_5_cf_loadWaitBit <= io_enq_1_bits_uop_cf_loadWaitBit; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_5_cf_loadWaitBit <= _GEN_7233;
      end
    end else begin
      uop_5_cf_loadWaitBit <= _GEN_7233;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h5 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_5_cf_loadWaitStrict <= io_enq_1_bits_uop_cf_loadWaitStrict; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_5_cf_loadWaitStrict <= _GEN_7249;
      end
    end else begin
      uop_5_cf_loadWaitStrict <= _GEN_7249;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h5 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_5_cf_ftqPtr_flag <= io_enq_1_bits_uop_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_5_cf_ftqPtr_flag <= _GEN_7281;
      end
    end else begin
      uop_5_cf_ftqPtr_flag <= _GEN_7281;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h5 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_5_cf_ftqPtr_value <= io_enq_1_bits_uop_cf_ftqPtr_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_5_cf_ftqPtr_value <= _GEN_7297;
      end
    end else begin
      uop_5_cf_ftqPtr_value <= _GEN_7297;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h5 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_5_cf_ftqOffset <= io_enq_1_bits_uop_cf_ftqOffset; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_5_cf_ftqOffset <= _GEN_7313;
      end
    end else begin
      uop_5_cf_ftqOffset <= _GEN_7313;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h5 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_5_ctrl_fuType <= io_enq_1_bits_uop_ctrl_fuType; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_5_ctrl_fuType <= _GEN_7457;
      end
    end else begin
      uop_5_ctrl_fuType <= _GEN_7457;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h5 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_5_ctrl_fuOpType <= io_enq_1_bits_uop_ctrl_fuOpType; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_5_ctrl_fuOpType <= _GEN_7473;
      end
    end else begin
      uop_5_ctrl_fuOpType <= _GEN_7473;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h5 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_5_ctrl_rfWen <= io_enq_1_bits_uop_ctrl_rfWen; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_5_ctrl_rfWen <= _GEN_7489;
      end
    end else begin
      uop_5_ctrl_rfWen <= _GEN_7489;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h5 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_5_ctrl_fpWen <= io_enq_1_bits_uop_ctrl_fpWen; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_5_ctrl_fpWen <= _GEN_7505;
      end
    end else begin
      uop_5_ctrl_fpWen <= _GEN_7505;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h5 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_5_pdest <= io_enq_1_bits_uop_pdest; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_5_pdest <= _GEN_8001;
      end
    end else begin
      uop_5_pdest <= _GEN_8001;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h5 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_5_robIdx_flag <= io_enq_1_bits_uop_robIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_5_robIdx_flag <= _GEN_8033;
      end
    end else begin
      uop_5_robIdx_flag <= _GEN_8033;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h5 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_5_robIdx_value <= io_enq_1_bits_uop_robIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_5_robIdx_value <= _GEN_8049;
      end
    end else begin
      uop_5_robIdx_value <= _GEN_8049;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h5 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_5_lqIdx_flag <= io_enq_1_bits_uop_lqIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_5_lqIdx_flag <= _GEN_8065;
      end
    end else begin
      uop_5_lqIdx_flag <= _GEN_8065;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h5 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_5_lqIdx_value <= io_enq_1_bits_uop_lqIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_5_lqIdx_value <= _GEN_8081;
      end
    end else begin
      uop_5_lqIdx_value <= _GEN_8081;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h5 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_5_sqIdx_flag <= io_enq_1_bits_uop_sqIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_5_sqIdx_flag <= _GEN_8097;
      end
    end else begin
      uop_5_sqIdx_flag <= _GEN_8097;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h5 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_5_sqIdx_value <= io_enq_1_bits_uop_sqIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_5_sqIdx_value <= _GEN_8113;
      end
    end else begin
      uop_5_sqIdx_value <= _GEN_8113;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h6 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_6_cf_foldpc <= io_enq_1_bits_uop_cf_foldpc; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_6_cf_foldpc <= _GEN_6610;
      end
    end else begin
      uop_6_cf_foldpc <= _GEN_6610;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h6 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_6_cf_trigger_backendEn_1 <= io_enq_1_bits_uop_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_6_cf_trigger_backendEn_1 <= _GEN_6962;
      end
    end else begin
      uop_6_cf_trigger_backendEn_1 <= _GEN_6962;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h6 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_6_cf_trigger_backendHit_0 <= io_enq_1_bits_uop_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_6_cf_trigger_backendHit_0 <= _GEN_6978;
      end
    end else begin
      uop_6_cf_trigger_backendHit_0 <= _GEN_6978;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h6 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_6_cf_trigger_backendHit_1 <= io_enq_1_bits_uop_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_6_cf_trigger_backendHit_1 <= _GEN_6994;
      end
    end else begin
      uop_6_cf_trigger_backendHit_1 <= _GEN_6994;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h6 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_6_cf_trigger_backendHit_4 <= io_enq_1_bits_uop_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_6_cf_trigger_backendHit_4 <= _GEN_7042;
      end
    end else begin
      uop_6_cf_trigger_backendHit_4 <= _GEN_7042;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h6 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_6_cf_waitForRobIdx_flag <= io_enq_1_bits_uop_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_6_cf_waitForRobIdx_flag <= _GEN_7202;
      end
    end else begin
      uop_6_cf_waitForRobIdx_flag <= _GEN_7202;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h6 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_6_cf_waitForRobIdx_value <= io_enq_1_bits_uop_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_6_cf_waitForRobIdx_value <= _GEN_7218;
      end
    end else begin
      uop_6_cf_waitForRobIdx_value <= _GEN_7218;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h6 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_6_cf_loadWaitBit <= io_enq_1_bits_uop_cf_loadWaitBit; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_6_cf_loadWaitBit <= _GEN_7234;
      end
    end else begin
      uop_6_cf_loadWaitBit <= _GEN_7234;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h6 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_6_cf_loadWaitStrict <= io_enq_1_bits_uop_cf_loadWaitStrict; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_6_cf_loadWaitStrict <= _GEN_7250;
      end
    end else begin
      uop_6_cf_loadWaitStrict <= _GEN_7250;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h6 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_6_cf_ftqPtr_flag <= io_enq_1_bits_uop_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_6_cf_ftqPtr_flag <= _GEN_7282;
      end
    end else begin
      uop_6_cf_ftqPtr_flag <= _GEN_7282;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h6 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_6_cf_ftqPtr_value <= io_enq_1_bits_uop_cf_ftqPtr_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_6_cf_ftqPtr_value <= _GEN_7298;
      end
    end else begin
      uop_6_cf_ftqPtr_value <= _GEN_7298;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h6 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_6_cf_ftqOffset <= io_enq_1_bits_uop_cf_ftqOffset; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_6_cf_ftqOffset <= _GEN_7314;
      end
    end else begin
      uop_6_cf_ftqOffset <= _GEN_7314;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h6 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_6_ctrl_fuType <= io_enq_1_bits_uop_ctrl_fuType; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_6_ctrl_fuType <= _GEN_7458;
      end
    end else begin
      uop_6_ctrl_fuType <= _GEN_7458;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h6 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_6_ctrl_fuOpType <= io_enq_1_bits_uop_ctrl_fuOpType; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_6_ctrl_fuOpType <= _GEN_7474;
      end
    end else begin
      uop_6_ctrl_fuOpType <= _GEN_7474;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h6 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_6_ctrl_rfWen <= io_enq_1_bits_uop_ctrl_rfWen; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_6_ctrl_rfWen <= _GEN_7490;
      end
    end else begin
      uop_6_ctrl_rfWen <= _GEN_7490;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h6 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_6_ctrl_fpWen <= io_enq_1_bits_uop_ctrl_fpWen; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_6_ctrl_fpWen <= _GEN_7506;
      end
    end else begin
      uop_6_ctrl_fpWen <= _GEN_7506;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h6 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_6_pdest <= io_enq_1_bits_uop_pdest; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_6_pdest <= _GEN_8002;
      end
    end else begin
      uop_6_pdest <= _GEN_8002;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h6 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_6_robIdx_flag <= io_enq_1_bits_uop_robIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_6_robIdx_flag <= _GEN_8034;
      end
    end else begin
      uop_6_robIdx_flag <= _GEN_8034;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h6 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_6_robIdx_value <= io_enq_1_bits_uop_robIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_6_robIdx_value <= _GEN_8050;
      end
    end else begin
      uop_6_robIdx_value <= _GEN_8050;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h6 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_6_lqIdx_flag <= io_enq_1_bits_uop_lqIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_6_lqIdx_flag <= _GEN_8066;
      end
    end else begin
      uop_6_lqIdx_flag <= _GEN_8066;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h6 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_6_lqIdx_value <= io_enq_1_bits_uop_lqIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_6_lqIdx_value <= _GEN_8082;
      end
    end else begin
      uop_6_lqIdx_value <= _GEN_8082;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h6 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_6_sqIdx_flag <= io_enq_1_bits_uop_sqIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_6_sqIdx_flag <= _GEN_8098;
      end
    end else begin
      uop_6_sqIdx_flag <= _GEN_8098;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h6 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_6_sqIdx_value <= io_enq_1_bits_uop_sqIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_6_sqIdx_value <= _GEN_8114;
      end
    end else begin
      uop_6_sqIdx_value <= _GEN_8114;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h7 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_7_cf_foldpc <= io_enq_1_bits_uop_cf_foldpc; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_7_cf_foldpc <= _GEN_6611;
      end
    end else begin
      uop_7_cf_foldpc <= _GEN_6611;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h7 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_7_cf_trigger_backendEn_1 <= io_enq_1_bits_uop_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_7_cf_trigger_backendEn_1 <= _GEN_6963;
      end
    end else begin
      uop_7_cf_trigger_backendEn_1 <= _GEN_6963;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h7 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_7_cf_trigger_backendHit_0 <= io_enq_1_bits_uop_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_7_cf_trigger_backendHit_0 <= _GEN_6979;
      end
    end else begin
      uop_7_cf_trigger_backendHit_0 <= _GEN_6979;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h7 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_7_cf_trigger_backendHit_1 <= io_enq_1_bits_uop_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_7_cf_trigger_backendHit_1 <= _GEN_6995;
      end
    end else begin
      uop_7_cf_trigger_backendHit_1 <= _GEN_6995;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h7 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_7_cf_trigger_backendHit_4 <= io_enq_1_bits_uop_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_7_cf_trigger_backendHit_4 <= _GEN_7043;
      end
    end else begin
      uop_7_cf_trigger_backendHit_4 <= _GEN_7043;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h7 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_7_cf_waitForRobIdx_flag <= io_enq_1_bits_uop_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_7_cf_waitForRobIdx_flag <= _GEN_7203;
      end
    end else begin
      uop_7_cf_waitForRobIdx_flag <= _GEN_7203;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h7 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_7_cf_waitForRobIdx_value <= io_enq_1_bits_uop_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_7_cf_waitForRobIdx_value <= _GEN_7219;
      end
    end else begin
      uop_7_cf_waitForRobIdx_value <= _GEN_7219;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h7 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_7_cf_loadWaitBit <= io_enq_1_bits_uop_cf_loadWaitBit; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_7_cf_loadWaitBit <= _GEN_7235;
      end
    end else begin
      uop_7_cf_loadWaitBit <= _GEN_7235;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h7 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_7_cf_loadWaitStrict <= io_enq_1_bits_uop_cf_loadWaitStrict; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_7_cf_loadWaitStrict <= _GEN_7251;
      end
    end else begin
      uop_7_cf_loadWaitStrict <= _GEN_7251;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h7 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_7_cf_ftqPtr_flag <= io_enq_1_bits_uop_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_7_cf_ftqPtr_flag <= _GEN_7283;
      end
    end else begin
      uop_7_cf_ftqPtr_flag <= _GEN_7283;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h7 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_7_cf_ftqPtr_value <= io_enq_1_bits_uop_cf_ftqPtr_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_7_cf_ftqPtr_value <= _GEN_7299;
      end
    end else begin
      uop_7_cf_ftqPtr_value <= _GEN_7299;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h7 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_7_cf_ftqOffset <= io_enq_1_bits_uop_cf_ftqOffset; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_7_cf_ftqOffset <= _GEN_7315;
      end
    end else begin
      uop_7_cf_ftqOffset <= _GEN_7315;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h7 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_7_ctrl_fuType <= io_enq_1_bits_uop_ctrl_fuType; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_7_ctrl_fuType <= _GEN_7459;
      end
    end else begin
      uop_7_ctrl_fuType <= _GEN_7459;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h7 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_7_ctrl_fuOpType <= io_enq_1_bits_uop_ctrl_fuOpType; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_7_ctrl_fuOpType <= _GEN_7475;
      end
    end else begin
      uop_7_ctrl_fuOpType <= _GEN_7475;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h7 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_7_ctrl_rfWen <= io_enq_1_bits_uop_ctrl_rfWen; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_7_ctrl_rfWen <= _GEN_7491;
      end
    end else begin
      uop_7_ctrl_rfWen <= _GEN_7491;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h7 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_7_ctrl_fpWen <= io_enq_1_bits_uop_ctrl_fpWen; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_7_ctrl_fpWen <= _GEN_7507;
      end
    end else begin
      uop_7_ctrl_fpWen <= _GEN_7507;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h7 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_7_pdest <= io_enq_1_bits_uop_pdest; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_7_pdest <= _GEN_8003;
      end
    end else begin
      uop_7_pdest <= _GEN_8003;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h7 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_7_robIdx_flag <= io_enq_1_bits_uop_robIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_7_robIdx_flag <= _GEN_8035;
      end
    end else begin
      uop_7_robIdx_flag <= _GEN_8035;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h7 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_7_robIdx_value <= io_enq_1_bits_uop_robIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_7_robIdx_value <= _GEN_8051;
      end
    end else begin
      uop_7_robIdx_value <= _GEN_8051;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h7 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_7_lqIdx_flag <= io_enq_1_bits_uop_lqIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_7_lqIdx_flag <= _GEN_8067;
      end
    end else begin
      uop_7_lqIdx_flag <= _GEN_8067;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h7 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_7_lqIdx_value <= io_enq_1_bits_uop_lqIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_7_lqIdx_value <= _GEN_8083;
      end
    end else begin
      uop_7_lqIdx_value <= _GEN_8083;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h7 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_7_sqIdx_flag <= io_enq_1_bits_uop_sqIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_7_sqIdx_flag <= _GEN_8099;
      end
    end else begin
      uop_7_sqIdx_flag <= _GEN_8099;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h7 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_7_sqIdx_value <= io_enq_1_bits_uop_sqIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_7_sqIdx_value <= _GEN_8115;
      end
    end else begin
      uop_7_sqIdx_value <= _GEN_8115;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h8 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_8_cf_foldpc <= io_enq_1_bits_uop_cf_foldpc; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_8_cf_foldpc <= _GEN_6612;
      end
    end else begin
      uop_8_cf_foldpc <= _GEN_6612;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h8 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_8_cf_trigger_backendEn_1 <= io_enq_1_bits_uop_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_8_cf_trigger_backendEn_1 <= _GEN_6964;
      end
    end else begin
      uop_8_cf_trigger_backendEn_1 <= _GEN_6964;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h8 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_8_cf_trigger_backendHit_0 <= io_enq_1_bits_uop_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_8_cf_trigger_backendHit_0 <= _GEN_6980;
      end
    end else begin
      uop_8_cf_trigger_backendHit_0 <= _GEN_6980;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h8 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_8_cf_trigger_backendHit_1 <= io_enq_1_bits_uop_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_8_cf_trigger_backendHit_1 <= _GEN_6996;
      end
    end else begin
      uop_8_cf_trigger_backendHit_1 <= _GEN_6996;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h8 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_8_cf_trigger_backendHit_4 <= io_enq_1_bits_uop_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_8_cf_trigger_backendHit_4 <= _GEN_7044;
      end
    end else begin
      uop_8_cf_trigger_backendHit_4 <= _GEN_7044;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h8 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_8_cf_waitForRobIdx_flag <= io_enq_1_bits_uop_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_8_cf_waitForRobIdx_flag <= _GEN_7204;
      end
    end else begin
      uop_8_cf_waitForRobIdx_flag <= _GEN_7204;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h8 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_8_cf_waitForRobIdx_value <= io_enq_1_bits_uop_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_8_cf_waitForRobIdx_value <= _GEN_7220;
      end
    end else begin
      uop_8_cf_waitForRobIdx_value <= _GEN_7220;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h8 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_8_cf_loadWaitBit <= io_enq_1_bits_uop_cf_loadWaitBit; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_8_cf_loadWaitBit <= _GEN_7236;
      end
    end else begin
      uop_8_cf_loadWaitBit <= _GEN_7236;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h8 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_8_cf_loadWaitStrict <= io_enq_1_bits_uop_cf_loadWaitStrict; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_8_cf_loadWaitStrict <= _GEN_7252;
      end
    end else begin
      uop_8_cf_loadWaitStrict <= _GEN_7252;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h8 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_8_cf_ftqPtr_flag <= io_enq_1_bits_uop_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_8_cf_ftqPtr_flag <= _GEN_7284;
      end
    end else begin
      uop_8_cf_ftqPtr_flag <= _GEN_7284;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h8 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_8_cf_ftqPtr_value <= io_enq_1_bits_uop_cf_ftqPtr_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_8_cf_ftqPtr_value <= _GEN_7300;
      end
    end else begin
      uop_8_cf_ftqPtr_value <= _GEN_7300;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h8 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_8_cf_ftqOffset <= io_enq_1_bits_uop_cf_ftqOffset; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_8_cf_ftqOffset <= _GEN_7316;
      end
    end else begin
      uop_8_cf_ftqOffset <= _GEN_7316;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h8 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_8_ctrl_fuType <= io_enq_1_bits_uop_ctrl_fuType; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_8_ctrl_fuType <= _GEN_7460;
      end
    end else begin
      uop_8_ctrl_fuType <= _GEN_7460;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h8 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_8_ctrl_fuOpType <= io_enq_1_bits_uop_ctrl_fuOpType; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_8_ctrl_fuOpType <= _GEN_7476;
      end
    end else begin
      uop_8_ctrl_fuOpType <= _GEN_7476;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h8 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_8_ctrl_rfWen <= io_enq_1_bits_uop_ctrl_rfWen; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_8_ctrl_rfWen <= _GEN_7492;
      end
    end else begin
      uop_8_ctrl_rfWen <= _GEN_7492;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h8 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_8_ctrl_fpWen <= io_enq_1_bits_uop_ctrl_fpWen; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_8_ctrl_fpWen <= _GEN_7508;
      end
    end else begin
      uop_8_ctrl_fpWen <= _GEN_7508;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h8 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_8_pdest <= io_enq_1_bits_uop_pdest; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_8_pdest <= _GEN_8004;
      end
    end else begin
      uop_8_pdest <= _GEN_8004;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h8 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_8_robIdx_flag <= io_enq_1_bits_uop_robIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_8_robIdx_flag <= _GEN_8036;
      end
    end else begin
      uop_8_robIdx_flag <= _GEN_8036;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h8 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_8_robIdx_value <= io_enq_1_bits_uop_robIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_8_robIdx_value <= _GEN_8052;
      end
    end else begin
      uop_8_robIdx_value <= _GEN_8052;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h8 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_8_lqIdx_flag <= io_enq_1_bits_uop_lqIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_8_lqIdx_flag <= _GEN_8068;
      end
    end else begin
      uop_8_lqIdx_flag <= _GEN_8068;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h8 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_8_lqIdx_value <= io_enq_1_bits_uop_lqIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_8_lqIdx_value <= _GEN_8084;
      end
    end else begin
      uop_8_lqIdx_value <= _GEN_8084;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h8 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_8_sqIdx_flag <= io_enq_1_bits_uop_sqIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_8_sqIdx_flag <= _GEN_8100;
      end
    end else begin
      uop_8_sqIdx_flag <= _GEN_8100;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h8 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_8_sqIdx_value <= io_enq_1_bits_uop_sqIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_8_sqIdx_value <= _GEN_8116;
      end
    end else begin
      uop_8_sqIdx_value <= _GEN_8116;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h9 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_9_cf_foldpc <= io_enq_1_bits_uop_cf_foldpc; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_9_cf_foldpc <= _GEN_6613;
      end
    end else begin
      uop_9_cf_foldpc <= _GEN_6613;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h9 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_9_cf_trigger_backendEn_1 <= io_enq_1_bits_uop_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_9_cf_trigger_backendEn_1 <= _GEN_6965;
      end
    end else begin
      uop_9_cf_trigger_backendEn_1 <= _GEN_6965;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h9 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_9_cf_trigger_backendHit_0 <= io_enq_1_bits_uop_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_9_cf_trigger_backendHit_0 <= _GEN_6981;
      end
    end else begin
      uop_9_cf_trigger_backendHit_0 <= _GEN_6981;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h9 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_9_cf_trigger_backendHit_1 <= io_enq_1_bits_uop_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_9_cf_trigger_backendHit_1 <= _GEN_6997;
      end
    end else begin
      uop_9_cf_trigger_backendHit_1 <= _GEN_6997;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h9 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_9_cf_trigger_backendHit_4 <= io_enq_1_bits_uop_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_9_cf_trigger_backendHit_4 <= _GEN_7045;
      end
    end else begin
      uop_9_cf_trigger_backendHit_4 <= _GEN_7045;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h9 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_9_cf_waitForRobIdx_flag <= io_enq_1_bits_uop_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_9_cf_waitForRobIdx_flag <= _GEN_7205;
      end
    end else begin
      uop_9_cf_waitForRobIdx_flag <= _GEN_7205;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h9 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_9_cf_waitForRobIdx_value <= io_enq_1_bits_uop_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_9_cf_waitForRobIdx_value <= _GEN_7221;
      end
    end else begin
      uop_9_cf_waitForRobIdx_value <= _GEN_7221;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h9 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_9_cf_loadWaitBit <= io_enq_1_bits_uop_cf_loadWaitBit; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_9_cf_loadWaitBit <= _GEN_7237;
      end
    end else begin
      uop_9_cf_loadWaitBit <= _GEN_7237;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h9 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_9_cf_loadWaitStrict <= io_enq_1_bits_uop_cf_loadWaitStrict; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_9_cf_loadWaitStrict <= _GEN_7253;
      end
    end else begin
      uop_9_cf_loadWaitStrict <= _GEN_7253;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h9 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_9_cf_ftqPtr_flag <= io_enq_1_bits_uop_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_9_cf_ftqPtr_flag <= _GEN_7285;
      end
    end else begin
      uop_9_cf_ftqPtr_flag <= _GEN_7285;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h9 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_9_cf_ftqPtr_value <= io_enq_1_bits_uop_cf_ftqPtr_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_9_cf_ftqPtr_value <= _GEN_7301;
      end
    end else begin
      uop_9_cf_ftqPtr_value <= _GEN_7301;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h9 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_9_cf_ftqOffset <= io_enq_1_bits_uop_cf_ftqOffset; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_9_cf_ftqOffset <= _GEN_7317;
      end
    end else begin
      uop_9_cf_ftqOffset <= _GEN_7317;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h9 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_9_ctrl_fuType <= io_enq_1_bits_uop_ctrl_fuType; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_9_ctrl_fuType <= _GEN_7461;
      end
    end else begin
      uop_9_ctrl_fuType <= _GEN_7461;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h9 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_9_ctrl_fuOpType <= io_enq_1_bits_uop_ctrl_fuOpType; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_9_ctrl_fuOpType <= _GEN_7477;
      end
    end else begin
      uop_9_ctrl_fuOpType <= _GEN_7477;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h9 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_9_ctrl_rfWen <= io_enq_1_bits_uop_ctrl_rfWen; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_9_ctrl_rfWen <= _GEN_7493;
      end
    end else begin
      uop_9_ctrl_rfWen <= _GEN_7493;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h9 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_9_ctrl_fpWen <= io_enq_1_bits_uop_ctrl_fpWen; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_9_ctrl_fpWen <= _GEN_7509;
      end
    end else begin
      uop_9_ctrl_fpWen <= _GEN_7509;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h9 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_9_pdest <= io_enq_1_bits_uop_pdest; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_9_pdest <= _GEN_8005;
      end
    end else begin
      uop_9_pdest <= _GEN_8005;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h9 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_9_robIdx_flag <= io_enq_1_bits_uop_robIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_9_robIdx_flag <= _GEN_8037;
      end
    end else begin
      uop_9_robIdx_flag <= _GEN_8037;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h9 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_9_robIdx_value <= io_enq_1_bits_uop_robIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_9_robIdx_value <= _GEN_8053;
      end
    end else begin
      uop_9_robIdx_value <= _GEN_8053;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h9 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_9_lqIdx_flag <= io_enq_1_bits_uop_lqIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_9_lqIdx_flag <= _GEN_8069;
      end
    end else begin
      uop_9_lqIdx_flag <= _GEN_8069;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h9 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_9_lqIdx_value <= io_enq_1_bits_uop_lqIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_9_lqIdx_value <= _GEN_8085;
      end
    end else begin
      uop_9_lqIdx_value <= _GEN_8085;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h9 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_9_sqIdx_flag <= io_enq_1_bits_uop_sqIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_9_sqIdx_flag <= _GEN_8101;
      end
    end else begin
      uop_9_sqIdx_flag <= _GEN_8101;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h9 == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_9_sqIdx_value <= io_enq_1_bits_uop_sqIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_9_sqIdx_value <= _GEN_8117;
      end
    end else begin
      uop_9_sqIdx_value <= _GEN_8117;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'ha == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_10_cf_foldpc <= io_enq_1_bits_uop_cf_foldpc; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_10_cf_foldpc <= _GEN_6614;
      end
    end else begin
      uop_10_cf_foldpc <= _GEN_6614;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'ha == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_10_cf_trigger_backendEn_1 <= io_enq_1_bits_uop_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_10_cf_trigger_backendEn_1 <= _GEN_6966;
      end
    end else begin
      uop_10_cf_trigger_backendEn_1 <= _GEN_6966;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'ha == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_10_cf_trigger_backendHit_0 <= io_enq_1_bits_uop_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_10_cf_trigger_backendHit_0 <= _GEN_6982;
      end
    end else begin
      uop_10_cf_trigger_backendHit_0 <= _GEN_6982;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'ha == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_10_cf_trigger_backendHit_1 <= io_enq_1_bits_uop_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_10_cf_trigger_backendHit_1 <= _GEN_6998;
      end
    end else begin
      uop_10_cf_trigger_backendHit_1 <= _GEN_6998;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'ha == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_10_cf_trigger_backendHit_4 <= io_enq_1_bits_uop_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_10_cf_trigger_backendHit_4 <= _GEN_7046;
      end
    end else begin
      uop_10_cf_trigger_backendHit_4 <= _GEN_7046;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'ha == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_10_cf_waitForRobIdx_flag <= io_enq_1_bits_uop_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_10_cf_waitForRobIdx_flag <= _GEN_7206;
      end
    end else begin
      uop_10_cf_waitForRobIdx_flag <= _GEN_7206;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'ha == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_10_cf_waitForRobIdx_value <= io_enq_1_bits_uop_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_10_cf_waitForRobIdx_value <= _GEN_7222;
      end
    end else begin
      uop_10_cf_waitForRobIdx_value <= _GEN_7222;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'ha == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_10_cf_loadWaitBit <= io_enq_1_bits_uop_cf_loadWaitBit; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_10_cf_loadWaitBit <= _GEN_7238;
      end
    end else begin
      uop_10_cf_loadWaitBit <= _GEN_7238;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'ha == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_10_cf_loadWaitStrict <= io_enq_1_bits_uop_cf_loadWaitStrict; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_10_cf_loadWaitStrict <= _GEN_7254;
      end
    end else begin
      uop_10_cf_loadWaitStrict <= _GEN_7254;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'ha == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_10_cf_ftqPtr_flag <= io_enq_1_bits_uop_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_10_cf_ftqPtr_flag <= _GEN_7286;
      end
    end else begin
      uop_10_cf_ftqPtr_flag <= _GEN_7286;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'ha == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_10_cf_ftqPtr_value <= io_enq_1_bits_uop_cf_ftqPtr_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_10_cf_ftqPtr_value <= _GEN_7302;
      end
    end else begin
      uop_10_cf_ftqPtr_value <= _GEN_7302;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'ha == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_10_cf_ftqOffset <= io_enq_1_bits_uop_cf_ftqOffset; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_10_cf_ftqOffset <= _GEN_7318;
      end
    end else begin
      uop_10_cf_ftqOffset <= _GEN_7318;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'ha == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_10_ctrl_fuType <= io_enq_1_bits_uop_ctrl_fuType; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_10_ctrl_fuType <= _GEN_7462;
      end
    end else begin
      uop_10_ctrl_fuType <= _GEN_7462;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'ha == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_10_ctrl_fuOpType <= io_enq_1_bits_uop_ctrl_fuOpType; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_10_ctrl_fuOpType <= _GEN_7478;
      end
    end else begin
      uop_10_ctrl_fuOpType <= _GEN_7478;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'ha == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_10_ctrl_rfWen <= io_enq_1_bits_uop_ctrl_rfWen; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_10_ctrl_rfWen <= _GEN_7494;
      end
    end else begin
      uop_10_ctrl_rfWen <= _GEN_7494;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'ha == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_10_ctrl_fpWen <= io_enq_1_bits_uop_ctrl_fpWen; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_10_ctrl_fpWen <= _GEN_7510;
      end
    end else begin
      uop_10_ctrl_fpWen <= _GEN_7510;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'ha == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_10_pdest <= io_enq_1_bits_uop_pdest; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_10_pdest <= _GEN_8006;
      end
    end else begin
      uop_10_pdest <= _GEN_8006;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'ha == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_10_robIdx_flag <= io_enq_1_bits_uop_robIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_10_robIdx_flag <= _GEN_8038;
      end
    end else begin
      uop_10_robIdx_flag <= _GEN_8038;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'ha == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_10_robIdx_value <= io_enq_1_bits_uop_robIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_10_robIdx_value <= _GEN_8054;
      end
    end else begin
      uop_10_robIdx_value <= _GEN_8054;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'ha == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_10_lqIdx_flag <= io_enq_1_bits_uop_lqIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_10_lqIdx_flag <= _GEN_8070;
      end
    end else begin
      uop_10_lqIdx_flag <= _GEN_8070;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'ha == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_10_lqIdx_value <= io_enq_1_bits_uop_lqIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_10_lqIdx_value <= _GEN_8086;
      end
    end else begin
      uop_10_lqIdx_value <= _GEN_8086;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'ha == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_10_sqIdx_flag <= io_enq_1_bits_uop_sqIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_10_sqIdx_flag <= _GEN_8102;
      end
    end else begin
      uop_10_sqIdx_flag <= _GEN_8102;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'ha == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_10_sqIdx_value <= io_enq_1_bits_uop_sqIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_10_sqIdx_value <= _GEN_8118;
      end
    end else begin
      uop_10_sqIdx_value <= _GEN_8118;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hb == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_11_cf_foldpc <= io_enq_1_bits_uop_cf_foldpc; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_11_cf_foldpc <= _GEN_6615;
      end
    end else begin
      uop_11_cf_foldpc <= _GEN_6615;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hb == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_11_cf_trigger_backendEn_1 <= io_enq_1_bits_uop_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_11_cf_trigger_backendEn_1 <= _GEN_6967;
      end
    end else begin
      uop_11_cf_trigger_backendEn_1 <= _GEN_6967;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hb == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_11_cf_trigger_backendHit_0 <= io_enq_1_bits_uop_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_11_cf_trigger_backendHit_0 <= _GEN_6983;
      end
    end else begin
      uop_11_cf_trigger_backendHit_0 <= _GEN_6983;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hb == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_11_cf_trigger_backendHit_1 <= io_enq_1_bits_uop_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_11_cf_trigger_backendHit_1 <= _GEN_6999;
      end
    end else begin
      uop_11_cf_trigger_backendHit_1 <= _GEN_6999;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hb == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_11_cf_trigger_backendHit_4 <= io_enq_1_bits_uop_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_11_cf_trigger_backendHit_4 <= _GEN_7047;
      end
    end else begin
      uop_11_cf_trigger_backendHit_4 <= _GEN_7047;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hb == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_11_cf_waitForRobIdx_flag <= io_enq_1_bits_uop_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_11_cf_waitForRobIdx_flag <= _GEN_7207;
      end
    end else begin
      uop_11_cf_waitForRobIdx_flag <= _GEN_7207;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hb == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_11_cf_waitForRobIdx_value <= io_enq_1_bits_uop_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_11_cf_waitForRobIdx_value <= _GEN_7223;
      end
    end else begin
      uop_11_cf_waitForRobIdx_value <= _GEN_7223;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hb == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_11_cf_loadWaitBit <= io_enq_1_bits_uop_cf_loadWaitBit; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_11_cf_loadWaitBit <= _GEN_7239;
      end
    end else begin
      uop_11_cf_loadWaitBit <= _GEN_7239;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hb == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_11_cf_loadWaitStrict <= io_enq_1_bits_uop_cf_loadWaitStrict; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_11_cf_loadWaitStrict <= _GEN_7255;
      end
    end else begin
      uop_11_cf_loadWaitStrict <= _GEN_7255;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hb == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_11_cf_ftqPtr_flag <= io_enq_1_bits_uop_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_11_cf_ftqPtr_flag <= _GEN_7287;
      end
    end else begin
      uop_11_cf_ftqPtr_flag <= _GEN_7287;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hb == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_11_cf_ftqPtr_value <= io_enq_1_bits_uop_cf_ftqPtr_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_11_cf_ftqPtr_value <= _GEN_7303;
      end
    end else begin
      uop_11_cf_ftqPtr_value <= _GEN_7303;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hb == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_11_cf_ftqOffset <= io_enq_1_bits_uop_cf_ftqOffset; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_11_cf_ftqOffset <= _GEN_7319;
      end
    end else begin
      uop_11_cf_ftqOffset <= _GEN_7319;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hb == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_11_ctrl_fuType <= io_enq_1_bits_uop_ctrl_fuType; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_11_ctrl_fuType <= _GEN_7463;
      end
    end else begin
      uop_11_ctrl_fuType <= _GEN_7463;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hb == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_11_ctrl_fuOpType <= io_enq_1_bits_uop_ctrl_fuOpType; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_11_ctrl_fuOpType <= _GEN_7479;
      end
    end else begin
      uop_11_ctrl_fuOpType <= _GEN_7479;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hb == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_11_ctrl_rfWen <= io_enq_1_bits_uop_ctrl_rfWen; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_11_ctrl_rfWen <= _GEN_7495;
      end
    end else begin
      uop_11_ctrl_rfWen <= _GEN_7495;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hb == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_11_ctrl_fpWen <= io_enq_1_bits_uop_ctrl_fpWen; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_11_ctrl_fpWen <= _GEN_7511;
      end
    end else begin
      uop_11_ctrl_fpWen <= _GEN_7511;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hb == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_11_pdest <= io_enq_1_bits_uop_pdest; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_11_pdest <= _GEN_8007;
      end
    end else begin
      uop_11_pdest <= _GEN_8007;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hb == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_11_robIdx_flag <= io_enq_1_bits_uop_robIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_11_robIdx_flag <= _GEN_8039;
      end
    end else begin
      uop_11_robIdx_flag <= _GEN_8039;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hb == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_11_robIdx_value <= io_enq_1_bits_uop_robIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_11_robIdx_value <= _GEN_8055;
      end
    end else begin
      uop_11_robIdx_value <= _GEN_8055;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hb == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_11_lqIdx_flag <= io_enq_1_bits_uop_lqIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_11_lqIdx_flag <= _GEN_8071;
      end
    end else begin
      uop_11_lqIdx_flag <= _GEN_8071;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hb == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_11_lqIdx_value <= io_enq_1_bits_uop_lqIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_11_lqIdx_value <= _GEN_8087;
      end
    end else begin
      uop_11_lqIdx_value <= _GEN_8087;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hb == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_11_sqIdx_flag <= io_enq_1_bits_uop_sqIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_11_sqIdx_flag <= _GEN_8103;
      end
    end else begin
      uop_11_sqIdx_flag <= _GEN_8103;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hb == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_11_sqIdx_value <= io_enq_1_bits_uop_sqIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_11_sqIdx_value <= _GEN_8119;
      end
    end else begin
      uop_11_sqIdx_value <= _GEN_8119;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hc == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_12_cf_foldpc <= io_enq_1_bits_uop_cf_foldpc; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_12_cf_foldpc <= _GEN_6616;
      end
    end else begin
      uop_12_cf_foldpc <= _GEN_6616;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hc == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_12_cf_trigger_backendEn_1 <= io_enq_1_bits_uop_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_12_cf_trigger_backendEn_1 <= _GEN_6968;
      end
    end else begin
      uop_12_cf_trigger_backendEn_1 <= _GEN_6968;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hc == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_12_cf_trigger_backendHit_0 <= io_enq_1_bits_uop_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_12_cf_trigger_backendHit_0 <= _GEN_6984;
      end
    end else begin
      uop_12_cf_trigger_backendHit_0 <= _GEN_6984;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hc == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_12_cf_trigger_backendHit_1 <= io_enq_1_bits_uop_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_12_cf_trigger_backendHit_1 <= _GEN_7000;
      end
    end else begin
      uop_12_cf_trigger_backendHit_1 <= _GEN_7000;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hc == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_12_cf_trigger_backendHit_4 <= io_enq_1_bits_uop_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_12_cf_trigger_backendHit_4 <= _GEN_7048;
      end
    end else begin
      uop_12_cf_trigger_backendHit_4 <= _GEN_7048;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hc == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_12_cf_waitForRobIdx_flag <= io_enq_1_bits_uop_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_12_cf_waitForRobIdx_flag <= _GEN_7208;
      end
    end else begin
      uop_12_cf_waitForRobIdx_flag <= _GEN_7208;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hc == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_12_cf_waitForRobIdx_value <= io_enq_1_bits_uop_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_12_cf_waitForRobIdx_value <= _GEN_7224;
      end
    end else begin
      uop_12_cf_waitForRobIdx_value <= _GEN_7224;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hc == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_12_cf_loadWaitBit <= io_enq_1_bits_uop_cf_loadWaitBit; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_12_cf_loadWaitBit <= _GEN_7240;
      end
    end else begin
      uop_12_cf_loadWaitBit <= _GEN_7240;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hc == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_12_cf_loadWaitStrict <= io_enq_1_bits_uop_cf_loadWaitStrict; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_12_cf_loadWaitStrict <= _GEN_7256;
      end
    end else begin
      uop_12_cf_loadWaitStrict <= _GEN_7256;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hc == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_12_cf_ftqPtr_flag <= io_enq_1_bits_uop_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_12_cf_ftqPtr_flag <= _GEN_7288;
      end
    end else begin
      uop_12_cf_ftqPtr_flag <= _GEN_7288;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hc == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_12_cf_ftqPtr_value <= io_enq_1_bits_uop_cf_ftqPtr_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_12_cf_ftqPtr_value <= _GEN_7304;
      end
    end else begin
      uop_12_cf_ftqPtr_value <= _GEN_7304;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hc == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_12_cf_ftqOffset <= io_enq_1_bits_uop_cf_ftqOffset; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_12_cf_ftqOffset <= _GEN_7320;
      end
    end else begin
      uop_12_cf_ftqOffset <= _GEN_7320;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hc == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_12_ctrl_fuType <= io_enq_1_bits_uop_ctrl_fuType; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_12_ctrl_fuType <= _GEN_7464;
      end
    end else begin
      uop_12_ctrl_fuType <= _GEN_7464;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hc == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_12_ctrl_fuOpType <= io_enq_1_bits_uop_ctrl_fuOpType; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_12_ctrl_fuOpType <= _GEN_7480;
      end
    end else begin
      uop_12_ctrl_fuOpType <= _GEN_7480;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hc == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_12_ctrl_rfWen <= io_enq_1_bits_uop_ctrl_rfWen; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_12_ctrl_rfWen <= _GEN_7496;
      end
    end else begin
      uop_12_ctrl_rfWen <= _GEN_7496;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hc == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_12_ctrl_fpWen <= io_enq_1_bits_uop_ctrl_fpWen; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_12_ctrl_fpWen <= _GEN_7512;
      end
    end else begin
      uop_12_ctrl_fpWen <= _GEN_7512;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hc == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_12_pdest <= io_enq_1_bits_uop_pdest; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_12_pdest <= _GEN_8008;
      end
    end else begin
      uop_12_pdest <= _GEN_8008;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hc == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_12_robIdx_flag <= io_enq_1_bits_uop_robIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_12_robIdx_flag <= _GEN_8040;
      end
    end else begin
      uop_12_robIdx_flag <= _GEN_8040;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hc == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_12_robIdx_value <= io_enq_1_bits_uop_robIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_12_robIdx_value <= _GEN_8056;
      end
    end else begin
      uop_12_robIdx_value <= _GEN_8056;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hc == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_12_lqIdx_flag <= io_enq_1_bits_uop_lqIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_12_lqIdx_flag <= _GEN_8072;
      end
    end else begin
      uop_12_lqIdx_flag <= _GEN_8072;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hc == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_12_lqIdx_value <= io_enq_1_bits_uop_lqIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_12_lqIdx_value <= _GEN_8088;
      end
    end else begin
      uop_12_lqIdx_value <= _GEN_8088;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hc == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_12_sqIdx_flag <= io_enq_1_bits_uop_sqIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_12_sqIdx_flag <= _GEN_8104;
      end
    end else begin
      uop_12_sqIdx_flag <= _GEN_8104;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hc == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_12_sqIdx_value <= io_enq_1_bits_uop_sqIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_12_sqIdx_value <= _GEN_8120;
      end
    end else begin
      uop_12_sqIdx_value <= _GEN_8120;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hd == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_13_cf_foldpc <= io_enq_1_bits_uop_cf_foldpc; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_13_cf_foldpc <= _GEN_6617;
      end
    end else begin
      uop_13_cf_foldpc <= _GEN_6617;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hd == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_13_cf_trigger_backendEn_1 <= io_enq_1_bits_uop_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_13_cf_trigger_backendEn_1 <= _GEN_6969;
      end
    end else begin
      uop_13_cf_trigger_backendEn_1 <= _GEN_6969;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hd == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_13_cf_trigger_backendHit_0 <= io_enq_1_bits_uop_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_13_cf_trigger_backendHit_0 <= _GEN_6985;
      end
    end else begin
      uop_13_cf_trigger_backendHit_0 <= _GEN_6985;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hd == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_13_cf_trigger_backendHit_1 <= io_enq_1_bits_uop_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_13_cf_trigger_backendHit_1 <= _GEN_7001;
      end
    end else begin
      uop_13_cf_trigger_backendHit_1 <= _GEN_7001;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hd == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_13_cf_trigger_backendHit_4 <= io_enq_1_bits_uop_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_13_cf_trigger_backendHit_4 <= _GEN_7049;
      end
    end else begin
      uop_13_cf_trigger_backendHit_4 <= _GEN_7049;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hd == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_13_cf_waitForRobIdx_flag <= io_enq_1_bits_uop_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_13_cf_waitForRobIdx_flag <= _GEN_7209;
      end
    end else begin
      uop_13_cf_waitForRobIdx_flag <= _GEN_7209;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hd == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_13_cf_waitForRobIdx_value <= io_enq_1_bits_uop_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_13_cf_waitForRobIdx_value <= _GEN_7225;
      end
    end else begin
      uop_13_cf_waitForRobIdx_value <= _GEN_7225;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hd == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_13_cf_loadWaitBit <= io_enq_1_bits_uop_cf_loadWaitBit; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_13_cf_loadWaitBit <= _GEN_7241;
      end
    end else begin
      uop_13_cf_loadWaitBit <= _GEN_7241;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hd == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_13_cf_loadWaitStrict <= io_enq_1_bits_uop_cf_loadWaitStrict; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_13_cf_loadWaitStrict <= _GEN_7257;
      end
    end else begin
      uop_13_cf_loadWaitStrict <= _GEN_7257;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hd == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_13_cf_ftqPtr_flag <= io_enq_1_bits_uop_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_13_cf_ftqPtr_flag <= _GEN_7289;
      end
    end else begin
      uop_13_cf_ftqPtr_flag <= _GEN_7289;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hd == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_13_cf_ftqPtr_value <= io_enq_1_bits_uop_cf_ftqPtr_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_13_cf_ftqPtr_value <= _GEN_7305;
      end
    end else begin
      uop_13_cf_ftqPtr_value <= _GEN_7305;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hd == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_13_cf_ftqOffset <= io_enq_1_bits_uop_cf_ftqOffset; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_13_cf_ftqOffset <= _GEN_7321;
      end
    end else begin
      uop_13_cf_ftqOffset <= _GEN_7321;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hd == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_13_ctrl_fuType <= io_enq_1_bits_uop_ctrl_fuType; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_13_ctrl_fuType <= _GEN_7465;
      end
    end else begin
      uop_13_ctrl_fuType <= _GEN_7465;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hd == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_13_ctrl_fuOpType <= io_enq_1_bits_uop_ctrl_fuOpType; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_13_ctrl_fuOpType <= _GEN_7481;
      end
    end else begin
      uop_13_ctrl_fuOpType <= _GEN_7481;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hd == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_13_ctrl_rfWen <= io_enq_1_bits_uop_ctrl_rfWen; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_13_ctrl_rfWen <= _GEN_7497;
      end
    end else begin
      uop_13_ctrl_rfWen <= _GEN_7497;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hd == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_13_ctrl_fpWen <= io_enq_1_bits_uop_ctrl_fpWen; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_13_ctrl_fpWen <= _GEN_7513;
      end
    end else begin
      uop_13_ctrl_fpWen <= _GEN_7513;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hd == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_13_pdest <= io_enq_1_bits_uop_pdest; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_13_pdest <= _GEN_8009;
      end
    end else begin
      uop_13_pdest <= _GEN_8009;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hd == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_13_robIdx_flag <= io_enq_1_bits_uop_robIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_13_robIdx_flag <= _GEN_8041;
      end
    end else begin
      uop_13_robIdx_flag <= _GEN_8041;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hd == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_13_robIdx_value <= io_enq_1_bits_uop_robIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_13_robIdx_value <= _GEN_8057;
      end
    end else begin
      uop_13_robIdx_value <= _GEN_8057;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hd == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_13_lqIdx_flag <= io_enq_1_bits_uop_lqIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_13_lqIdx_flag <= _GEN_8073;
      end
    end else begin
      uop_13_lqIdx_flag <= _GEN_8073;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hd == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_13_lqIdx_value <= io_enq_1_bits_uop_lqIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_13_lqIdx_value <= _GEN_8089;
      end
    end else begin
      uop_13_lqIdx_value <= _GEN_8089;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hd == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_13_sqIdx_flag <= io_enq_1_bits_uop_sqIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_13_sqIdx_flag <= _GEN_8105;
      end
    end else begin
      uop_13_sqIdx_flag <= _GEN_8105;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hd == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_13_sqIdx_value <= io_enq_1_bits_uop_sqIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_13_sqIdx_value <= _GEN_8121;
      end
    end else begin
      uop_13_sqIdx_value <= _GEN_8121;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'he == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_14_cf_foldpc <= io_enq_1_bits_uop_cf_foldpc; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_14_cf_foldpc <= _GEN_6618;
      end
    end else begin
      uop_14_cf_foldpc <= _GEN_6618;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'he == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_14_cf_trigger_backendEn_1 <= io_enq_1_bits_uop_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_14_cf_trigger_backendEn_1 <= _GEN_6970;
      end
    end else begin
      uop_14_cf_trigger_backendEn_1 <= _GEN_6970;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'he == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_14_cf_trigger_backendHit_0 <= io_enq_1_bits_uop_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_14_cf_trigger_backendHit_0 <= _GEN_6986;
      end
    end else begin
      uop_14_cf_trigger_backendHit_0 <= _GEN_6986;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'he == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_14_cf_trigger_backendHit_1 <= io_enq_1_bits_uop_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_14_cf_trigger_backendHit_1 <= _GEN_7002;
      end
    end else begin
      uop_14_cf_trigger_backendHit_1 <= _GEN_7002;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'he == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_14_cf_trigger_backendHit_4 <= io_enq_1_bits_uop_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_14_cf_trigger_backendHit_4 <= _GEN_7050;
      end
    end else begin
      uop_14_cf_trigger_backendHit_4 <= _GEN_7050;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'he == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_14_cf_waitForRobIdx_flag <= io_enq_1_bits_uop_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_14_cf_waitForRobIdx_flag <= _GEN_7210;
      end
    end else begin
      uop_14_cf_waitForRobIdx_flag <= _GEN_7210;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'he == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_14_cf_waitForRobIdx_value <= io_enq_1_bits_uop_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_14_cf_waitForRobIdx_value <= _GEN_7226;
      end
    end else begin
      uop_14_cf_waitForRobIdx_value <= _GEN_7226;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'he == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_14_cf_loadWaitBit <= io_enq_1_bits_uop_cf_loadWaitBit; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_14_cf_loadWaitBit <= _GEN_7242;
      end
    end else begin
      uop_14_cf_loadWaitBit <= _GEN_7242;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'he == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_14_cf_loadWaitStrict <= io_enq_1_bits_uop_cf_loadWaitStrict; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_14_cf_loadWaitStrict <= _GEN_7258;
      end
    end else begin
      uop_14_cf_loadWaitStrict <= _GEN_7258;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'he == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_14_cf_ftqPtr_flag <= io_enq_1_bits_uop_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_14_cf_ftqPtr_flag <= _GEN_7290;
      end
    end else begin
      uop_14_cf_ftqPtr_flag <= _GEN_7290;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'he == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_14_cf_ftqPtr_value <= io_enq_1_bits_uop_cf_ftqPtr_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_14_cf_ftqPtr_value <= _GEN_7306;
      end
    end else begin
      uop_14_cf_ftqPtr_value <= _GEN_7306;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'he == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_14_cf_ftqOffset <= io_enq_1_bits_uop_cf_ftqOffset; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_14_cf_ftqOffset <= _GEN_7322;
      end
    end else begin
      uop_14_cf_ftqOffset <= _GEN_7322;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'he == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_14_ctrl_fuType <= io_enq_1_bits_uop_ctrl_fuType; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_14_ctrl_fuType <= _GEN_7466;
      end
    end else begin
      uop_14_ctrl_fuType <= _GEN_7466;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'he == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_14_ctrl_fuOpType <= io_enq_1_bits_uop_ctrl_fuOpType; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_14_ctrl_fuOpType <= _GEN_7482;
      end
    end else begin
      uop_14_ctrl_fuOpType <= _GEN_7482;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'he == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_14_ctrl_rfWen <= io_enq_1_bits_uop_ctrl_rfWen; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_14_ctrl_rfWen <= _GEN_7498;
      end
    end else begin
      uop_14_ctrl_rfWen <= _GEN_7498;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'he == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_14_ctrl_fpWen <= io_enq_1_bits_uop_ctrl_fpWen; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_14_ctrl_fpWen <= _GEN_7514;
      end
    end else begin
      uop_14_ctrl_fpWen <= _GEN_7514;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'he == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_14_pdest <= io_enq_1_bits_uop_pdest; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_14_pdest <= _GEN_8010;
      end
    end else begin
      uop_14_pdest <= _GEN_8010;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'he == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_14_robIdx_flag <= io_enq_1_bits_uop_robIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_14_robIdx_flag <= _GEN_8042;
      end
    end else begin
      uop_14_robIdx_flag <= _GEN_8042;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'he == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_14_robIdx_value <= io_enq_1_bits_uop_robIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_14_robIdx_value <= _GEN_8058;
      end
    end else begin
      uop_14_robIdx_value <= _GEN_8058;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'he == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_14_lqIdx_flag <= io_enq_1_bits_uop_lqIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_14_lqIdx_flag <= _GEN_8074;
      end
    end else begin
      uop_14_lqIdx_flag <= _GEN_8074;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'he == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_14_lqIdx_value <= io_enq_1_bits_uop_lqIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_14_lqIdx_value <= _GEN_8090;
      end
    end else begin
      uop_14_lqIdx_value <= _GEN_8090;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'he == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_14_sqIdx_flag <= io_enq_1_bits_uop_sqIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_14_sqIdx_flag <= _GEN_8106;
      end
    end else begin
      uop_14_sqIdx_flag <= _GEN_8106;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'he == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_14_sqIdx_value <= io_enq_1_bits_uop_sqIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_14_sqIdx_value <= _GEN_8122;
      end
    end else begin
      uop_14_sqIdx_value <= _GEN_8122;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hf == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_15_cf_foldpc <= io_enq_1_bits_uop_cf_foldpc; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_15_cf_foldpc <= _GEN_6619;
      end
    end else begin
      uop_15_cf_foldpc <= _GEN_6619;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hf == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_15_cf_trigger_backendEn_1 <= io_enq_1_bits_uop_cf_trigger_backendEn_1; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_15_cf_trigger_backendEn_1 <= _GEN_6971;
      end
    end else begin
      uop_15_cf_trigger_backendEn_1 <= _GEN_6971;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hf == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_15_cf_trigger_backendHit_0 <= io_enq_1_bits_uop_cf_trigger_backendHit_0; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_15_cf_trigger_backendHit_0 <= _GEN_6987;
      end
    end else begin
      uop_15_cf_trigger_backendHit_0 <= _GEN_6987;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hf == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_15_cf_trigger_backendHit_1 <= io_enq_1_bits_uop_cf_trigger_backendHit_1; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_15_cf_trigger_backendHit_1 <= _GEN_7003;
      end
    end else begin
      uop_15_cf_trigger_backendHit_1 <= _GEN_7003;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hf == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_15_cf_trigger_backendHit_4 <= io_enq_1_bits_uop_cf_trigger_backendHit_4; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_15_cf_trigger_backendHit_4 <= _GEN_7051;
      end
    end else begin
      uop_15_cf_trigger_backendHit_4 <= _GEN_7051;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hf == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_15_cf_waitForRobIdx_flag <= io_enq_1_bits_uop_cf_waitForRobIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_15_cf_waitForRobIdx_flag <= _GEN_7211;
      end
    end else begin
      uop_15_cf_waitForRobIdx_flag <= _GEN_7211;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hf == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_15_cf_waitForRobIdx_value <= io_enq_1_bits_uop_cf_waitForRobIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_15_cf_waitForRobIdx_value <= _GEN_7227;
      end
    end else begin
      uop_15_cf_waitForRobIdx_value <= _GEN_7227;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hf == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_15_cf_loadWaitBit <= io_enq_1_bits_uop_cf_loadWaitBit; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_15_cf_loadWaitBit <= _GEN_7243;
      end
    end else begin
      uop_15_cf_loadWaitBit <= _GEN_7243;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hf == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_15_cf_loadWaitStrict <= io_enq_1_bits_uop_cf_loadWaitStrict; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_15_cf_loadWaitStrict <= _GEN_7259;
      end
    end else begin
      uop_15_cf_loadWaitStrict <= _GEN_7259;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hf == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_15_cf_ftqPtr_flag <= io_enq_1_bits_uop_cf_ftqPtr_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_15_cf_ftqPtr_flag <= _GEN_7291;
      end
    end else begin
      uop_15_cf_ftqPtr_flag <= _GEN_7291;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hf == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_15_cf_ftqPtr_value <= io_enq_1_bits_uop_cf_ftqPtr_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_15_cf_ftqPtr_value <= _GEN_7307;
      end
    end else begin
      uop_15_cf_ftqPtr_value <= _GEN_7307;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hf == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_15_cf_ftqOffset <= io_enq_1_bits_uop_cf_ftqOffset; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_15_cf_ftqOffset <= _GEN_7323;
      end
    end else begin
      uop_15_cf_ftqOffset <= _GEN_7323;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hf == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_15_ctrl_fuType <= io_enq_1_bits_uop_ctrl_fuType; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_15_ctrl_fuType <= _GEN_7467;
      end
    end else begin
      uop_15_ctrl_fuType <= _GEN_7467;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hf == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_15_ctrl_fuOpType <= io_enq_1_bits_uop_ctrl_fuOpType; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_15_ctrl_fuOpType <= _GEN_7483;
      end
    end else begin
      uop_15_ctrl_fuOpType <= _GEN_7483;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hf == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_15_ctrl_rfWen <= io_enq_1_bits_uop_ctrl_rfWen; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_15_ctrl_rfWen <= _GEN_7499;
      end
    end else begin
      uop_15_ctrl_rfWen <= _GEN_7499;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hf == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_15_ctrl_fpWen <= io_enq_1_bits_uop_ctrl_fpWen; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_15_ctrl_fpWen <= _GEN_7515;
      end
    end else begin
      uop_15_ctrl_fpWen <= _GEN_7515;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hf == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_15_pdest <= io_enq_1_bits_uop_pdest; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_15_pdest <= _GEN_8011;
      end
    end else begin
      uop_15_pdest <= _GEN_8011;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hf == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_15_robIdx_flag <= io_enq_1_bits_uop_robIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_15_robIdx_flag <= _GEN_8043;
      end
    end else begin
      uop_15_robIdx_flag <= _GEN_8043;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hf == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_15_robIdx_value <= io_enq_1_bits_uop_robIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_15_robIdx_value <= _GEN_8059;
      end
    end else begin
      uop_15_robIdx_value <= _GEN_8059;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hf == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_15_lqIdx_flag <= io_enq_1_bits_uop_lqIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_15_lqIdx_flag <= _GEN_8075;
      end
    end else begin
      uop_15_lqIdx_flag <= _GEN_8075;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hf == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_15_lqIdx_value <= io_enq_1_bits_uop_lqIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_15_lqIdx_value <= _GEN_8091;
      end
    end else begin
      uop_15_lqIdx_value <= _GEN_8091;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hf == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_15_sqIdx_flag <= io_enq_1_bits_uop_sqIdx_flag; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_15_sqIdx_flag <= _GEN_8107;
      end
    end else begin
      uop_15_sqIdx_flag <= _GEN_8107;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hf == enqIdx_1) begin // @[LoadQueueReplay.scala 367:19]
        uop_15_sqIdx_value <= io_enq_1_bits_uop_sqIdx_value; // @[LoadQueueReplay.scala 367:19]
      end else begin
        uop_15_sqIdx_value <= _GEN_8123;
      end
    end else begin
      uop_15_sqIdx_value <= _GEN_8123;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h0 == enqIdx_1) begin // @[LoadQueueReplay.scala 426:34]
        flags_0_rarAllocated <= io_enq_1_bits_rarAllocated; // @[LoadQueueReplay.scala 426:34]
      end else begin
        flags_0_rarAllocated <= _GEN_8543;
      end
    end else begin
      flags_0_rarAllocated <= _GEN_8543;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h0 == enqIdx_1) begin // @[LoadQueueReplay.scala 427:30]
        flags_0_rarIndex <= io_enq_1_bits_rarIndex; // @[LoadQueueReplay.scala 427:30]
      end else begin
        flags_0_rarIndex <= _GEN_8559;
      end
    end else begin
      flags_0_rarIndex <= _GEN_8559;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h0 == enqIdx_1) begin // @[LoadQueueReplay.scala 428:34]
        flags_0_rawAllocated <= io_enq_1_bits_rawAllocated; // @[LoadQueueReplay.scala 428:34]
      end else begin
        flags_0_rawAllocated <= _GEN_8575;
      end
    end else begin
      flags_0_rawAllocated <= _GEN_8575;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h0 == enqIdx_1) begin // @[LoadQueueReplay.scala 429:30]
        flags_0_rawIndex <= io_enq_1_bits_rawIndex; // @[LoadQueueReplay.scala 429:30]
      end else begin
        flags_0_rawIndex <= _GEN_8591;
      end
    end else begin
      flags_0_rawIndex <= _GEN_8591;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h1 == enqIdx_1) begin // @[LoadQueueReplay.scala 426:34]
        flags_1_rarAllocated <= io_enq_1_bits_rarAllocated; // @[LoadQueueReplay.scala 426:34]
      end else begin
        flags_1_rarAllocated <= _GEN_8544;
      end
    end else begin
      flags_1_rarAllocated <= _GEN_8544;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h1 == enqIdx_1) begin // @[LoadQueueReplay.scala 427:30]
        flags_1_rarIndex <= io_enq_1_bits_rarIndex; // @[LoadQueueReplay.scala 427:30]
      end else begin
        flags_1_rarIndex <= _GEN_8560;
      end
    end else begin
      flags_1_rarIndex <= _GEN_8560;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h1 == enqIdx_1) begin // @[LoadQueueReplay.scala 428:34]
        flags_1_rawAllocated <= io_enq_1_bits_rawAllocated; // @[LoadQueueReplay.scala 428:34]
      end else begin
        flags_1_rawAllocated <= _GEN_8576;
      end
    end else begin
      flags_1_rawAllocated <= _GEN_8576;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h1 == enqIdx_1) begin // @[LoadQueueReplay.scala 429:30]
        flags_1_rawIndex <= io_enq_1_bits_rawIndex; // @[LoadQueueReplay.scala 429:30]
      end else begin
        flags_1_rawIndex <= _GEN_8592;
      end
    end else begin
      flags_1_rawIndex <= _GEN_8592;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h2 == enqIdx_1) begin // @[LoadQueueReplay.scala 426:34]
        flags_2_rarAllocated <= io_enq_1_bits_rarAllocated; // @[LoadQueueReplay.scala 426:34]
      end else begin
        flags_2_rarAllocated <= _GEN_8545;
      end
    end else begin
      flags_2_rarAllocated <= _GEN_8545;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h2 == enqIdx_1) begin // @[LoadQueueReplay.scala 427:30]
        flags_2_rarIndex <= io_enq_1_bits_rarIndex; // @[LoadQueueReplay.scala 427:30]
      end else begin
        flags_2_rarIndex <= _GEN_8561;
      end
    end else begin
      flags_2_rarIndex <= _GEN_8561;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h2 == enqIdx_1) begin // @[LoadQueueReplay.scala 428:34]
        flags_2_rawAllocated <= io_enq_1_bits_rawAllocated; // @[LoadQueueReplay.scala 428:34]
      end else begin
        flags_2_rawAllocated <= _GEN_8577;
      end
    end else begin
      flags_2_rawAllocated <= _GEN_8577;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h2 == enqIdx_1) begin // @[LoadQueueReplay.scala 429:30]
        flags_2_rawIndex <= io_enq_1_bits_rawIndex; // @[LoadQueueReplay.scala 429:30]
      end else begin
        flags_2_rawIndex <= _GEN_8593;
      end
    end else begin
      flags_2_rawIndex <= _GEN_8593;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h3 == enqIdx_1) begin // @[LoadQueueReplay.scala 426:34]
        flags_3_rarAllocated <= io_enq_1_bits_rarAllocated; // @[LoadQueueReplay.scala 426:34]
      end else begin
        flags_3_rarAllocated <= _GEN_8546;
      end
    end else begin
      flags_3_rarAllocated <= _GEN_8546;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h3 == enqIdx_1) begin // @[LoadQueueReplay.scala 427:30]
        flags_3_rarIndex <= io_enq_1_bits_rarIndex; // @[LoadQueueReplay.scala 427:30]
      end else begin
        flags_3_rarIndex <= _GEN_8562;
      end
    end else begin
      flags_3_rarIndex <= _GEN_8562;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h3 == enqIdx_1) begin // @[LoadQueueReplay.scala 428:34]
        flags_3_rawAllocated <= io_enq_1_bits_rawAllocated; // @[LoadQueueReplay.scala 428:34]
      end else begin
        flags_3_rawAllocated <= _GEN_8578;
      end
    end else begin
      flags_3_rawAllocated <= _GEN_8578;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h3 == enqIdx_1) begin // @[LoadQueueReplay.scala 429:30]
        flags_3_rawIndex <= io_enq_1_bits_rawIndex; // @[LoadQueueReplay.scala 429:30]
      end else begin
        flags_3_rawIndex <= _GEN_8594;
      end
    end else begin
      flags_3_rawIndex <= _GEN_8594;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h4 == enqIdx_1) begin // @[LoadQueueReplay.scala 426:34]
        flags_4_rarAllocated <= io_enq_1_bits_rarAllocated; // @[LoadQueueReplay.scala 426:34]
      end else begin
        flags_4_rarAllocated <= _GEN_8547;
      end
    end else begin
      flags_4_rarAllocated <= _GEN_8547;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h4 == enqIdx_1) begin // @[LoadQueueReplay.scala 427:30]
        flags_4_rarIndex <= io_enq_1_bits_rarIndex; // @[LoadQueueReplay.scala 427:30]
      end else begin
        flags_4_rarIndex <= _GEN_8563;
      end
    end else begin
      flags_4_rarIndex <= _GEN_8563;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h4 == enqIdx_1) begin // @[LoadQueueReplay.scala 428:34]
        flags_4_rawAllocated <= io_enq_1_bits_rawAllocated; // @[LoadQueueReplay.scala 428:34]
      end else begin
        flags_4_rawAllocated <= _GEN_8579;
      end
    end else begin
      flags_4_rawAllocated <= _GEN_8579;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h4 == enqIdx_1) begin // @[LoadQueueReplay.scala 429:30]
        flags_4_rawIndex <= io_enq_1_bits_rawIndex; // @[LoadQueueReplay.scala 429:30]
      end else begin
        flags_4_rawIndex <= _GEN_8595;
      end
    end else begin
      flags_4_rawIndex <= _GEN_8595;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h5 == enqIdx_1) begin // @[LoadQueueReplay.scala 426:34]
        flags_5_rarAllocated <= io_enq_1_bits_rarAllocated; // @[LoadQueueReplay.scala 426:34]
      end else begin
        flags_5_rarAllocated <= _GEN_8548;
      end
    end else begin
      flags_5_rarAllocated <= _GEN_8548;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h5 == enqIdx_1) begin // @[LoadQueueReplay.scala 427:30]
        flags_5_rarIndex <= io_enq_1_bits_rarIndex; // @[LoadQueueReplay.scala 427:30]
      end else begin
        flags_5_rarIndex <= _GEN_8564;
      end
    end else begin
      flags_5_rarIndex <= _GEN_8564;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h5 == enqIdx_1) begin // @[LoadQueueReplay.scala 428:34]
        flags_5_rawAllocated <= io_enq_1_bits_rawAllocated; // @[LoadQueueReplay.scala 428:34]
      end else begin
        flags_5_rawAllocated <= _GEN_8580;
      end
    end else begin
      flags_5_rawAllocated <= _GEN_8580;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h5 == enqIdx_1) begin // @[LoadQueueReplay.scala 429:30]
        flags_5_rawIndex <= io_enq_1_bits_rawIndex; // @[LoadQueueReplay.scala 429:30]
      end else begin
        flags_5_rawIndex <= _GEN_8596;
      end
    end else begin
      flags_5_rawIndex <= _GEN_8596;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h6 == enqIdx_1) begin // @[LoadQueueReplay.scala 426:34]
        flags_6_rarAllocated <= io_enq_1_bits_rarAllocated; // @[LoadQueueReplay.scala 426:34]
      end else begin
        flags_6_rarAllocated <= _GEN_8549;
      end
    end else begin
      flags_6_rarAllocated <= _GEN_8549;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h6 == enqIdx_1) begin // @[LoadQueueReplay.scala 427:30]
        flags_6_rarIndex <= io_enq_1_bits_rarIndex; // @[LoadQueueReplay.scala 427:30]
      end else begin
        flags_6_rarIndex <= _GEN_8565;
      end
    end else begin
      flags_6_rarIndex <= _GEN_8565;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h6 == enqIdx_1) begin // @[LoadQueueReplay.scala 428:34]
        flags_6_rawAllocated <= io_enq_1_bits_rawAllocated; // @[LoadQueueReplay.scala 428:34]
      end else begin
        flags_6_rawAllocated <= _GEN_8581;
      end
    end else begin
      flags_6_rawAllocated <= _GEN_8581;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h6 == enqIdx_1) begin // @[LoadQueueReplay.scala 429:30]
        flags_6_rawIndex <= io_enq_1_bits_rawIndex; // @[LoadQueueReplay.scala 429:30]
      end else begin
        flags_6_rawIndex <= _GEN_8597;
      end
    end else begin
      flags_6_rawIndex <= _GEN_8597;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h7 == enqIdx_1) begin // @[LoadQueueReplay.scala 426:34]
        flags_7_rarAllocated <= io_enq_1_bits_rarAllocated; // @[LoadQueueReplay.scala 426:34]
      end else begin
        flags_7_rarAllocated <= _GEN_8550;
      end
    end else begin
      flags_7_rarAllocated <= _GEN_8550;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h7 == enqIdx_1) begin // @[LoadQueueReplay.scala 427:30]
        flags_7_rarIndex <= io_enq_1_bits_rarIndex; // @[LoadQueueReplay.scala 427:30]
      end else begin
        flags_7_rarIndex <= _GEN_8566;
      end
    end else begin
      flags_7_rarIndex <= _GEN_8566;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h7 == enqIdx_1) begin // @[LoadQueueReplay.scala 428:34]
        flags_7_rawAllocated <= io_enq_1_bits_rawAllocated; // @[LoadQueueReplay.scala 428:34]
      end else begin
        flags_7_rawAllocated <= _GEN_8582;
      end
    end else begin
      flags_7_rawAllocated <= _GEN_8582;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h7 == enqIdx_1) begin // @[LoadQueueReplay.scala 429:30]
        flags_7_rawIndex <= io_enq_1_bits_rawIndex; // @[LoadQueueReplay.scala 429:30]
      end else begin
        flags_7_rawIndex <= _GEN_8598;
      end
    end else begin
      flags_7_rawIndex <= _GEN_8598;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h8 == enqIdx_1) begin // @[LoadQueueReplay.scala 426:34]
        flags_8_rarAllocated <= io_enq_1_bits_rarAllocated; // @[LoadQueueReplay.scala 426:34]
      end else begin
        flags_8_rarAllocated <= _GEN_8551;
      end
    end else begin
      flags_8_rarAllocated <= _GEN_8551;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h8 == enqIdx_1) begin // @[LoadQueueReplay.scala 427:30]
        flags_8_rarIndex <= io_enq_1_bits_rarIndex; // @[LoadQueueReplay.scala 427:30]
      end else begin
        flags_8_rarIndex <= _GEN_8567;
      end
    end else begin
      flags_8_rarIndex <= _GEN_8567;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h8 == enqIdx_1) begin // @[LoadQueueReplay.scala 428:34]
        flags_8_rawAllocated <= io_enq_1_bits_rawAllocated; // @[LoadQueueReplay.scala 428:34]
      end else begin
        flags_8_rawAllocated <= _GEN_8583;
      end
    end else begin
      flags_8_rawAllocated <= _GEN_8583;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h8 == enqIdx_1) begin // @[LoadQueueReplay.scala 429:30]
        flags_8_rawIndex <= io_enq_1_bits_rawIndex; // @[LoadQueueReplay.scala 429:30]
      end else begin
        flags_8_rawIndex <= _GEN_8599;
      end
    end else begin
      flags_8_rawIndex <= _GEN_8599;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h9 == enqIdx_1) begin // @[LoadQueueReplay.scala 426:34]
        flags_9_rarAllocated <= io_enq_1_bits_rarAllocated; // @[LoadQueueReplay.scala 426:34]
      end else begin
        flags_9_rarAllocated <= _GEN_8552;
      end
    end else begin
      flags_9_rarAllocated <= _GEN_8552;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h9 == enqIdx_1) begin // @[LoadQueueReplay.scala 427:30]
        flags_9_rarIndex <= io_enq_1_bits_rarIndex; // @[LoadQueueReplay.scala 427:30]
      end else begin
        flags_9_rarIndex <= _GEN_8568;
      end
    end else begin
      flags_9_rarIndex <= _GEN_8568;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h9 == enqIdx_1) begin // @[LoadQueueReplay.scala 428:34]
        flags_9_rawAllocated <= io_enq_1_bits_rawAllocated; // @[LoadQueueReplay.scala 428:34]
      end else begin
        flags_9_rawAllocated <= _GEN_8584;
      end
    end else begin
      flags_9_rawAllocated <= _GEN_8584;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'h9 == enqIdx_1) begin // @[LoadQueueReplay.scala 429:30]
        flags_9_rawIndex <= io_enq_1_bits_rawIndex; // @[LoadQueueReplay.scala 429:30]
      end else begin
        flags_9_rawIndex <= _GEN_8600;
      end
    end else begin
      flags_9_rawIndex <= _GEN_8600;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'ha == enqIdx_1) begin // @[LoadQueueReplay.scala 426:34]
        flags_10_rarAllocated <= io_enq_1_bits_rarAllocated; // @[LoadQueueReplay.scala 426:34]
      end else begin
        flags_10_rarAllocated <= _GEN_8553;
      end
    end else begin
      flags_10_rarAllocated <= _GEN_8553;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'ha == enqIdx_1) begin // @[LoadQueueReplay.scala 427:30]
        flags_10_rarIndex <= io_enq_1_bits_rarIndex; // @[LoadQueueReplay.scala 427:30]
      end else begin
        flags_10_rarIndex <= _GEN_8569;
      end
    end else begin
      flags_10_rarIndex <= _GEN_8569;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'ha == enqIdx_1) begin // @[LoadQueueReplay.scala 428:34]
        flags_10_rawAllocated <= io_enq_1_bits_rawAllocated; // @[LoadQueueReplay.scala 428:34]
      end else begin
        flags_10_rawAllocated <= _GEN_8585;
      end
    end else begin
      flags_10_rawAllocated <= _GEN_8585;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'ha == enqIdx_1) begin // @[LoadQueueReplay.scala 429:30]
        flags_10_rawIndex <= io_enq_1_bits_rawIndex; // @[LoadQueueReplay.scala 429:30]
      end else begin
        flags_10_rawIndex <= _GEN_8601;
      end
    end else begin
      flags_10_rawIndex <= _GEN_8601;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hb == enqIdx_1) begin // @[LoadQueueReplay.scala 426:34]
        flags_11_rarAllocated <= io_enq_1_bits_rarAllocated; // @[LoadQueueReplay.scala 426:34]
      end else begin
        flags_11_rarAllocated <= _GEN_8554;
      end
    end else begin
      flags_11_rarAllocated <= _GEN_8554;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hb == enqIdx_1) begin // @[LoadQueueReplay.scala 427:30]
        flags_11_rarIndex <= io_enq_1_bits_rarIndex; // @[LoadQueueReplay.scala 427:30]
      end else begin
        flags_11_rarIndex <= _GEN_8570;
      end
    end else begin
      flags_11_rarIndex <= _GEN_8570;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hb == enqIdx_1) begin // @[LoadQueueReplay.scala 428:34]
        flags_11_rawAllocated <= io_enq_1_bits_rawAllocated; // @[LoadQueueReplay.scala 428:34]
      end else begin
        flags_11_rawAllocated <= _GEN_8586;
      end
    end else begin
      flags_11_rawAllocated <= _GEN_8586;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hb == enqIdx_1) begin // @[LoadQueueReplay.scala 429:30]
        flags_11_rawIndex <= io_enq_1_bits_rawIndex; // @[LoadQueueReplay.scala 429:30]
      end else begin
        flags_11_rawIndex <= _GEN_8602;
      end
    end else begin
      flags_11_rawIndex <= _GEN_8602;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hc == enqIdx_1) begin // @[LoadQueueReplay.scala 426:34]
        flags_12_rarAllocated <= io_enq_1_bits_rarAllocated; // @[LoadQueueReplay.scala 426:34]
      end else begin
        flags_12_rarAllocated <= _GEN_8555;
      end
    end else begin
      flags_12_rarAllocated <= _GEN_8555;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hc == enqIdx_1) begin // @[LoadQueueReplay.scala 427:30]
        flags_12_rarIndex <= io_enq_1_bits_rarIndex; // @[LoadQueueReplay.scala 427:30]
      end else begin
        flags_12_rarIndex <= _GEN_8571;
      end
    end else begin
      flags_12_rarIndex <= _GEN_8571;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hc == enqIdx_1) begin // @[LoadQueueReplay.scala 428:34]
        flags_12_rawAllocated <= io_enq_1_bits_rawAllocated; // @[LoadQueueReplay.scala 428:34]
      end else begin
        flags_12_rawAllocated <= _GEN_8587;
      end
    end else begin
      flags_12_rawAllocated <= _GEN_8587;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hc == enqIdx_1) begin // @[LoadQueueReplay.scala 429:30]
        flags_12_rawIndex <= io_enq_1_bits_rawIndex; // @[LoadQueueReplay.scala 429:30]
      end else begin
        flags_12_rawIndex <= _GEN_8603;
      end
    end else begin
      flags_12_rawIndex <= _GEN_8603;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hd == enqIdx_1) begin // @[LoadQueueReplay.scala 426:34]
        flags_13_rarAllocated <= io_enq_1_bits_rarAllocated; // @[LoadQueueReplay.scala 426:34]
      end else begin
        flags_13_rarAllocated <= _GEN_8556;
      end
    end else begin
      flags_13_rarAllocated <= _GEN_8556;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hd == enqIdx_1) begin // @[LoadQueueReplay.scala 427:30]
        flags_13_rarIndex <= io_enq_1_bits_rarIndex; // @[LoadQueueReplay.scala 427:30]
      end else begin
        flags_13_rarIndex <= _GEN_8572;
      end
    end else begin
      flags_13_rarIndex <= _GEN_8572;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hd == enqIdx_1) begin // @[LoadQueueReplay.scala 428:34]
        flags_13_rawAllocated <= io_enq_1_bits_rawAllocated; // @[LoadQueueReplay.scala 428:34]
      end else begin
        flags_13_rawAllocated <= _GEN_8588;
      end
    end else begin
      flags_13_rawAllocated <= _GEN_8588;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hd == enqIdx_1) begin // @[LoadQueueReplay.scala 429:30]
        flags_13_rawIndex <= io_enq_1_bits_rawIndex; // @[LoadQueueReplay.scala 429:30]
      end else begin
        flags_13_rawIndex <= _GEN_8604;
      end
    end else begin
      flags_13_rawIndex <= _GEN_8604;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'he == enqIdx_1) begin // @[LoadQueueReplay.scala 426:34]
        flags_14_rarAllocated <= io_enq_1_bits_rarAllocated; // @[LoadQueueReplay.scala 426:34]
      end else begin
        flags_14_rarAllocated <= _GEN_8557;
      end
    end else begin
      flags_14_rarAllocated <= _GEN_8557;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'he == enqIdx_1) begin // @[LoadQueueReplay.scala 427:30]
        flags_14_rarIndex <= io_enq_1_bits_rarIndex; // @[LoadQueueReplay.scala 427:30]
      end else begin
        flags_14_rarIndex <= _GEN_8573;
      end
    end else begin
      flags_14_rarIndex <= _GEN_8573;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'he == enqIdx_1) begin // @[LoadQueueReplay.scala 428:34]
        flags_14_rawAllocated <= io_enq_1_bits_rawAllocated; // @[LoadQueueReplay.scala 428:34]
      end else begin
        flags_14_rawAllocated <= _GEN_8589;
      end
    end else begin
      flags_14_rawAllocated <= _GEN_8589;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'he == enqIdx_1) begin // @[LoadQueueReplay.scala 429:30]
        flags_14_rawIndex <= io_enq_1_bits_rawIndex; // @[LoadQueueReplay.scala 429:30]
      end else begin
        flags_14_rawIndex <= _GEN_8605;
      end
    end else begin
      flags_14_rawIndex <= _GEN_8605;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hf == enqIdx_1) begin // @[LoadQueueReplay.scala 426:34]
        flags_15_rarAllocated <= io_enq_1_bits_rarAllocated; // @[LoadQueueReplay.scala 426:34]
      end else begin
        flags_15_rarAllocated <= _GEN_8558;
      end
    end else begin
      flags_15_rarAllocated <= _GEN_8558;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hf == enqIdx_1) begin // @[LoadQueueReplay.scala 427:30]
        flags_15_rarIndex <= io_enq_1_bits_rarIndex; // @[LoadQueueReplay.scala 427:30]
      end else begin
        flags_15_rarIndex <= _GEN_8574;
      end
    end else begin
      flags_15_rarIndex <= _GEN_8574;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hf == enqIdx_1) begin // @[LoadQueueReplay.scala 428:34]
        flags_15_rawAllocated <= io_enq_1_bits_rawAllocated; // @[LoadQueueReplay.scala 428:34]
      end else begin
        flags_15_rawAllocated <= _GEN_8590;
      end
    end else begin
      flags_15_rawAllocated <= _GEN_8590;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (4'hf == enqIdx_1) begin // @[LoadQueueReplay.scala 429:30]
        flags_15_rawIndex <= io_enq_1_bits_rawIndex; // @[LoadQueueReplay.scala 429:30]
      end else begin
        flags_15_rawIndex <= _GEN_8606;
      end
    end else begin
      flags_15_rawIndex <= _GEN_8606;
    end
    blockCyclesTlb_0 <= io_tlbReplayDelayCycleCtrl_0; // @[LoadQueueReplay.scala 144:18]
    blockCyclesTlb_1 <= io_tlbReplayDelayCycleCtrl_1; // @[LoadQueueReplay.scala 144:18]
    blockCyclesTlb_2 <= io_tlbReplayDelayCycleCtrl_2; // @[LoadQueueReplay.scala 144:18]
    blockCyclesTlb_3 <= io_tlbReplayDelayCycleCtrl_3; // @[LoadQueueReplay.scala 144:18]
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (io_enq_1_bits_replayInfo_cause_5) begin // @[LoadQueueReplay.scala 413:61]
        if (4'h0 == enqIdx_1) begin // @[LoadQueueReplay.scala 415:28]
          blockSqIdx_0_flag <= io_enq_1_bits_replayInfo_dataInvalidSqIdx_flag; // @[LoadQueueReplay.scala 415:28]
        end else begin
          blockSqIdx_0_flag <= _GEN_10919;
        end
      end else begin
        blockSqIdx_0_flag <= _GEN_10919;
      end
    end else begin
      blockSqIdx_0_flag <= _GEN_8463;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (io_enq_1_bits_replayInfo_cause_5) begin // @[LoadQueueReplay.scala 413:61]
        if (4'h0 == enqIdx_1) begin // @[LoadQueueReplay.scala 415:28]
          blockSqIdx_0_value <= io_enq_1_bits_replayInfo_dataInvalidSqIdx_value; // @[LoadQueueReplay.scala 415:28]
        end else begin
          blockSqIdx_0_value <= _GEN_10935;
        end
      end else begin
        blockSqIdx_0_value <= _GEN_10935;
      end
    end else begin
      blockSqIdx_0_value <= _GEN_8479;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (io_enq_1_bits_replayInfo_cause_5) begin // @[LoadQueueReplay.scala 413:61]
        if (4'h1 == enqIdx_1) begin // @[LoadQueueReplay.scala 415:28]
          blockSqIdx_1_flag <= io_enq_1_bits_replayInfo_dataInvalidSqIdx_flag; // @[LoadQueueReplay.scala 415:28]
        end else begin
          blockSqIdx_1_flag <= _GEN_10920;
        end
      end else begin
        blockSqIdx_1_flag <= _GEN_10920;
      end
    end else begin
      blockSqIdx_1_flag <= _GEN_8464;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (io_enq_1_bits_replayInfo_cause_5) begin // @[LoadQueueReplay.scala 413:61]
        if (4'h1 == enqIdx_1) begin // @[LoadQueueReplay.scala 415:28]
          blockSqIdx_1_value <= io_enq_1_bits_replayInfo_dataInvalidSqIdx_value; // @[LoadQueueReplay.scala 415:28]
        end else begin
          blockSqIdx_1_value <= _GEN_10936;
        end
      end else begin
        blockSqIdx_1_value <= _GEN_10936;
      end
    end else begin
      blockSqIdx_1_value <= _GEN_8480;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (io_enq_1_bits_replayInfo_cause_5) begin // @[LoadQueueReplay.scala 413:61]
        if (4'h2 == enqIdx_1) begin // @[LoadQueueReplay.scala 415:28]
          blockSqIdx_2_flag <= io_enq_1_bits_replayInfo_dataInvalidSqIdx_flag; // @[LoadQueueReplay.scala 415:28]
        end else begin
          blockSqIdx_2_flag <= _GEN_10921;
        end
      end else begin
        blockSqIdx_2_flag <= _GEN_10921;
      end
    end else begin
      blockSqIdx_2_flag <= _GEN_8465;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (io_enq_1_bits_replayInfo_cause_5) begin // @[LoadQueueReplay.scala 413:61]
        if (4'h2 == enqIdx_1) begin // @[LoadQueueReplay.scala 415:28]
          blockSqIdx_2_value <= io_enq_1_bits_replayInfo_dataInvalidSqIdx_value; // @[LoadQueueReplay.scala 415:28]
        end else begin
          blockSqIdx_2_value <= _GEN_10937;
        end
      end else begin
        blockSqIdx_2_value <= _GEN_10937;
      end
    end else begin
      blockSqIdx_2_value <= _GEN_8481;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (io_enq_1_bits_replayInfo_cause_5) begin // @[LoadQueueReplay.scala 413:61]
        if (4'h3 == enqIdx_1) begin // @[LoadQueueReplay.scala 415:28]
          blockSqIdx_3_flag <= io_enq_1_bits_replayInfo_dataInvalidSqIdx_flag; // @[LoadQueueReplay.scala 415:28]
        end else begin
          blockSqIdx_3_flag <= _GEN_10922;
        end
      end else begin
        blockSqIdx_3_flag <= _GEN_10922;
      end
    end else begin
      blockSqIdx_3_flag <= _GEN_8466;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (io_enq_1_bits_replayInfo_cause_5) begin // @[LoadQueueReplay.scala 413:61]
        if (4'h3 == enqIdx_1) begin // @[LoadQueueReplay.scala 415:28]
          blockSqIdx_3_value <= io_enq_1_bits_replayInfo_dataInvalidSqIdx_value; // @[LoadQueueReplay.scala 415:28]
        end else begin
          blockSqIdx_3_value <= _GEN_10938;
        end
      end else begin
        blockSqIdx_3_value <= _GEN_10938;
      end
    end else begin
      blockSqIdx_3_value <= _GEN_8482;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (io_enq_1_bits_replayInfo_cause_5) begin // @[LoadQueueReplay.scala 413:61]
        if (4'h4 == enqIdx_1) begin // @[LoadQueueReplay.scala 415:28]
          blockSqIdx_4_flag <= io_enq_1_bits_replayInfo_dataInvalidSqIdx_flag; // @[LoadQueueReplay.scala 415:28]
        end else begin
          blockSqIdx_4_flag <= _GEN_10923;
        end
      end else begin
        blockSqIdx_4_flag <= _GEN_10923;
      end
    end else begin
      blockSqIdx_4_flag <= _GEN_8467;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (io_enq_1_bits_replayInfo_cause_5) begin // @[LoadQueueReplay.scala 413:61]
        if (4'h4 == enqIdx_1) begin // @[LoadQueueReplay.scala 415:28]
          blockSqIdx_4_value <= io_enq_1_bits_replayInfo_dataInvalidSqIdx_value; // @[LoadQueueReplay.scala 415:28]
        end else begin
          blockSqIdx_4_value <= _GEN_10939;
        end
      end else begin
        blockSqIdx_4_value <= _GEN_10939;
      end
    end else begin
      blockSqIdx_4_value <= _GEN_8483;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (io_enq_1_bits_replayInfo_cause_5) begin // @[LoadQueueReplay.scala 413:61]
        if (4'h5 == enqIdx_1) begin // @[LoadQueueReplay.scala 415:28]
          blockSqIdx_5_flag <= io_enq_1_bits_replayInfo_dataInvalidSqIdx_flag; // @[LoadQueueReplay.scala 415:28]
        end else begin
          blockSqIdx_5_flag <= _GEN_10924;
        end
      end else begin
        blockSqIdx_5_flag <= _GEN_10924;
      end
    end else begin
      blockSqIdx_5_flag <= _GEN_8468;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (io_enq_1_bits_replayInfo_cause_5) begin // @[LoadQueueReplay.scala 413:61]
        if (4'h5 == enqIdx_1) begin // @[LoadQueueReplay.scala 415:28]
          blockSqIdx_5_value <= io_enq_1_bits_replayInfo_dataInvalidSqIdx_value; // @[LoadQueueReplay.scala 415:28]
        end else begin
          blockSqIdx_5_value <= _GEN_10940;
        end
      end else begin
        blockSqIdx_5_value <= _GEN_10940;
      end
    end else begin
      blockSqIdx_5_value <= _GEN_8484;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (io_enq_1_bits_replayInfo_cause_5) begin // @[LoadQueueReplay.scala 413:61]
        if (4'h6 == enqIdx_1) begin // @[LoadQueueReplay.scala 415:28]
          blockSqIdx_6_flag <= io_enq_1_bits_replayInfo_dataInvalidSqIdx_flag; // @[LoadQueueReplay.scala 415:28]
        end else begin
          blockSqIdx_6_flag <= _GEN_10925;
        end
      end else begin
        blockSqIdx_6_flag <= _GEN_10925;
      end
    end else begin
      blockSqIdx_6_flag <= _GEN_8469;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (io_enq_1_bits_replayInfo_cause_5) begin // @[LoadQueueReplay.scala 413:61]
        if (4'h6 == enqIdx_1) begin // @[LoadQueueReplay.scala 415:28]
          blockSqIdx_6_value <= io_enq_1_bits_replayInfo_dataInvalidSqIdx_value; // @[LoadQueueReplay.scala 415:28]
        end else begin
          blockSqIdx_6_value <= _GEN_10941;
        end
      end else begin
        blockSqIdx_6_value <= _GEN_10941;
      end
    end else begin
      blockSqIdx_6_value <= _GEN_8485;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (io_enq_1_bits_replayInfo_cause_5) begin // @[LoadQueueReplay.scala 413:61]
        if (4'h7 == enqIdx_1) begin // @[LoadQueueReplay.scala 415:28]
          blockSqIdx_7_flag <= io_enq_1_bits_replayInfo_dataInvalidSqIdx_flag; // @[LoadQueueReplay.scala 415:28]
        end else begin
          blockSqIdx_7_flag <= _GEN_10926;
        end
      end else begin
        blockSqIdx_7_flag <= _GEN_10926;
      end
    end else begin
      blockSqIdx_7_flag <= _GEN_8470;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (io_enq_1_bits_replayInfo_cause_5) begin // @[LoadQueueReplay.scala 413:61]
        if (4'h7 == enqIdx_1) begin // @[LoadQueueReplay.scala 415:28]
          blockSqIdx_7_value <= io_enq_1_bits_replayInfo_dataInvalidSqIdx_value; // @[LoadQueueReplay.scala 415:28]
        end else begin
          blockSqIdx_7_value <= _GEN_10942;
        end
      end else begin
        blockSqIdx_7_value <= _GEN_10942;
      end
    end else begin
      blockSqIdx_7_value <= _GEN_8486;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (io_enq_1_bits_replayInfo_cause_5) begin // @[LoadQueueReplay.scala 413:61]
        if (4'h8 == enqIdx_1) begin // @[LoadQueueReplay.scala 415:28]
          blockSqIdx_8_flag <= io_enq_1_bits_replayInfo_dataInvalidSqIdx_flag; // @[LoadQueueReplay.scala 415:28]
        end else begin
          blockSqIdx_8_flag <= _GEN_10927;
        end
      end else begin
        blockSqIdx_8_flag <= _GEN_10927;
      end
    end else begin
      blockSqIdx_8_flag <= _GEN_8471;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (io_enq_1_bits_replayInfo_cause_5) begin // @[LoadQueueReplay.scala 413:61]
        if (4'h8 == enqIdx_1) begin // @[LoadQueueReplay.scala 415:28]
          blockSqIdx_8_value <= io_enq_1_bits_replayInfo_dataInvalidSqIdx_value; // @[LoadQueueReplay.scala 415:28]
        end else begin
          blockSqIdx_8_value <= _GEN_10943;
        end
      end else begin
        blockSqIdx_8_value <= _GEN_10943;
      end
    end else begin
      blockSqIdx_8_value <= _GEN_8487;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (io_enq_1_bits_replayInfo_cause_5) begin // @[LoadQueueReplay.scala 413:61]
        if (4'h9 == enqIdx_1) begin // @[LoadQueueReplay.scala 415:28]
          blockSqIdx_9_flag <= io_enq_1_bits_replayInfo_dataInvalidSqIdx_flag; // @[LoadQueueReplay.scala 415:28]
        end else begin
          blockSqIdx_9_flag <= _GEN_10928;
        end
      end else begin
        blockSqIdx_9_flag <= _GEN_10928;
      end
    end else begin
      blockSqIdx_9_flag <= _GEN_8472;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (io_enq_1_bits_replayInfo_cause_5) begin // @[LoadQueueReplay.scala 413:61]
        if (4'h9 == enqIdx_1) begin // @[LoadQueueReplay.scala 415:28]
          blockSqIdx_9_value <= io_enq_1_bits_replayInfo_dataInvalidSqIdx_value; // @[LoadQueueReplay.scala 415:28]
        end else begin
          blockSqIdx_9_value <= _GEN_10944;
        end
      end else begin
        blockSqIdx_9_value <= _GEN_10944;
      end
    end else begin
      blockSqIdx_9_value <= _GEN_8488;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (io_enq_1_bits_replayInfo_cause_5) begin // @[LoadQueueReplay.scala 413:61]
        if (4'ha == enqIdx_1) begin // @[LoadQueueReplay.scala 415:28]
          blockSqIdx_10_flag <= io_enq_1_bits_replayInfo_dataInvalidSqIdx_flag; // @[LoadQueueReplay.scala 415:28]
        end else begin
          blockSqIdx_10_flag <= _GEN_10929;
        end
      end else begin
        blockSqIdx_10_flag <= _GEN_10929;
      end
    end else begin
      blockSqIdx_10_flag <= _GEN_8473;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (io_enq_1_bits_replayInfo_cause_5) begin // @[LoadQueueReplay.scala 413:61]
        if (4'ha == enqIdx_1) begin // @[LoadQueueReplay.scala 415:28]
          blockSqIdx_10_value <= io_enq_1_bits_replayInfo_dataInvalidSqIdx_value; // @[LoadQueueReplay.scala 415:28]
        end else begin
          blockSqIdx_10_value <= _GEN_10945;
        end
      end else begin
        blockSqIdx_10_value <= _GEN_10945;
      end
    end else begin
      blockSqIdx_10_value <= _GEN_8489;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (io_enq_1_bits_replayInfo_cause_5) begin // @[LoadQueueReplay.scala 413:61]
        if (4'hb == enqIdx_1) begin // @[LoadQueueReplay.scala 415:28]
          blockSqIdx_11_flag <= io_enq_1_bits_replayInfo_dataInvalidSqIdx_flag; // @[LoadQueueReplay.scala 415:28]
        end else begin
          blockSqIdx_11_flag <= _GEN_10930;
        end
      end else begin
        blockSqIdx_11_flag <= _GEN_10930;
      end
    end else begin
      blockSqIdx_11_flag <= _GEN_8474;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (io_enq_1_bits_replayInfo_cause_5) begin // @[LoadQueueReplay.scala 413:61]
        if (4'hb == enqIdx_1) begin // @[LoadQueueReplay.scala 415:28]
          blockSqIdx_11_value <= io_enq_1_bits_replayInfo_dataInvalidSqIdx_value; // @[LoadQueueReplay.scala 415:28]
        end else begin
          blockSqIdx_11_value <= _GEN_10946;
        end
      end else begin
        blockSqIdx_11_value <= _GEN_10946;
      end
    end else begin
      blockSqIdx_11_value <= _GEN_8490;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (io_enq_1_bits_replayInfo_cause_5) begin // @[LoadQueueReplay.scala 413:61]
        if (4'hc == enqIdx_1) begin // @[LoadQueueReplay.scala 415:28]
          blockSqIdx_12_flag <= io_enq_1_bits_replayInfo_dataInvalidSqIdx_flag; // @[LoadQueueReplay.scala 415:28]
        end else begin
          blockSqIdx_12_flag <= _GEN_10931;
        end
      end else begin
        blockSqIdx_12_flag <= _GEN_10931;
      end
    end else begin
      blockSqIdx_12_flag <= _GEN_8475;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (io_enq_1_bits_replayInfo_cause_5) begin // @[LoadQueueReplay.scala 413:61]
        if (4'hc == enqIdx_1) begin // @[LoadQueueReplay.scala 415:28]
          blockSqIdx_12_value <= io_enq_1_bits_replayInfo_dataInvalidSqIdx_value; // @[LoadQueueReplay.scala 415:28]
        end else begin
          blockSqIdx_12_value <= _GEN_10947;
        end
      end else begin
        blockSqIdx_12_value <= _GEN_10947;
      end
    end else begin
      blockSqIdx_12_value <= _GEN_8491;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (io_enq_1_bits_replayInfo_cause_5) begin // @[LoadQueueReplay.scala 413:61]
        if (4'hd == enqIdx_1) begin // @[LoadQueueReplay.scala 415:28]
          blockSqIdx_13_flag <= io_enq_1_bits_replayInfo_dataInvalidSqIdx_flag; // @[LoadQueueReplay.scala 415:28]
        end else begin
          blockSqIdx_13_flag <= _GEN_10932;
        end
      end else begin
        blockSqIdx_13_flag <= _GEN_10932;
      end
    end else begin
      blockSqIdx_13_flag <= _GEN_8476;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (io_enq_1_bits_replayInfo_cause_5) begin // @[LoadQueueReplay.scala 413:61]
        if (4'hd == enqIdx_1) begin // @[LoadQueueReplay.scala 415:28]
          blockSqIdx_13_value <= io_enq_1_bits_replayInfo_dataInvalidSqIdx_value; // @[LoadQueueReplay.scala 415:28]
        end else begin
          blockSqIdx_13_value <= _GEN_10948;
        end
      end else begin
        blockSqIdx_13_value <= _GEN_10948;
      end
    end else begin
      blockSqIdx_13_value <= _GEN_8492;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (io_enq_1_bits_replayInfo_cause_5) begin // @[LoadQueueReplay.scala 413:61]
        if (4'he == enqIdx_1) begin // @[LoadQueueReplay.scala 415:28]
          blockSqIdx_14_flag <= io_enq_1_bits_replayInfo_dataInvalidSqIdx_flag; // @[LoadQueueReplay.scala 415:28]
        end else begin
          blockSqIdx_14_flag <= _GEN_10933;
        end
      end else begin
        blockSqIdx_14_flag <= _GEN_10933;
      end
    end else begin
      blockSqIdx_14_flag <= _GEN_8477;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (io_enq_1_bits_replayInfo_cause_5) begin // @[LoadQueueReplay.scala 413:61]
        if (4'he == enqIdx_1) begin // @[LoadQueueReplay.scala 415:28]
          blockSqIdx_14_value <= io_enq_1_bits_replayInfo_dataInvalidSqIdx_value; // @[LoadQueueReplay.scala 415:28]
        end else begin
          blockSqIdx_14_value <= _GEN_10949;
        end
      end else begin
        blockSqIdx_14_value <= _GEN_10949;
      end
    end else begin
      blockSqIdx_14_value <= _GEN_8493;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (io_enq_1_bits_replayInfo_cause_5) begin // @[LoadQueueReplay.scala 413:61]
        if (4'hf == enqIdx_1) begin // @[LoadQueueReplay.scala 415:28]
          blockSqIdx_15_flag <= io_enq_1_bits_replayInfo_dataInvalidSqIdx_flag; // @[LoadQueueReplay.scala 415:28]
        end else begin
          blockSqIdx_15_flag <= _GEN_10934;
        end
      end else begin
        blockSqIdx_15_flag <= _GEN_10934;
      end
    end else begin
      blockSqIdx_15_flag <= _GEN_8478;
    end
    if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      if (io_enq_1_bits_replayInfo_cause_5) begin // @[LoadQueueReplay.scala 413:61]
        if (4'hf == enqIdx_1) begin // @[LoadQueueReplay.scala 415:28]
          blockSqIdx_15_value <= io_enq_1_bits_replayInfo_dataInvalidSqIdx_value; // @[LoadQueueReplay.scala 415:28]
        end else begin
          blockSqIdx_15_value <= _GEN_10950;
        end
      end else begin
        blockSqIdx_15_value <= _GEN_10950;
      end
    end else begin
      blockSqIdx_15_value <= _GEN_8494;
    end
    storeAddrValidVec <= _storeAddrValidVec_T | _storeAddrValidVec_T_1; // @[LoadQueueReplay.scala 171:58]
    storeDataValidVec <= _storeDataValidVec_T | _storeDataValidVec_T_1; // @[LoadQueueReplay.scala 172:58]
    if (replayRemFire_1) begin // @[LoadQueueReplay.scala 298:28]
      s1_blockLoadMask_0 <= _GEN_96;
    end else begin
      s1_blockLoadMask_0 <= replayRemFire_0 & _GEN_64;
    end
    if (replayRemFire_1) begin // @[LoadQueueReplay.scala 298:28]
      s1_blockLoadMask_1 <= _GEN_97;
    end else begin
      s1_blockLoadMask_1 <= replayRemFire_0 & _GEN_65;
    end
    if (replayRemFire_1) begin // @[LoadQueueReplay.scala 298:28]
      s1_blockLoadMask_2 <= _GEN_98;
    end else begin
      s1_blockLoadMask_2 <= replayRemFire_0 & _GEN_66;
    end
    if (replayRemFire_1) begin // @[LoadQueueReplay.scala 298:28]
      s1_blockLoadMask_3 <= _GEN_99;
    end else begin
      s1_blockLoadMask_3 <= replayRemFire_0 & _GEN_67;
    end
    if (replayRemFire_1) begin // @[LoadQueueReplay.scala 298:28]
      s1_blockLoadMask_4 <= _GEN_100;
    end else begin
      s1_blockLoadMask_4 <= replayRemFire_0 & _GEN_68;
    end
    if (replayRemFire_1) begin // @[LoadQueueReplay.scala 298:28]
      s1_blockLoadMask_5 <= _GEN_101;
    end else begin
      s1_blockLoadMask_5 <= replayRemFire_0 & _GEN_69;
    end
    if (replayRemFire_1) begin // @[LoadQueueReplay.scala 298:28]
      s1_blockLoadMask_6 <= _GEN_102;
    end else begin
      s1_blockLoadMask_6 <= replayRemFire_0 & _GEN_70;
    end
    if (replayRemFire_1) begin // @[LoadQueueReplay.scala 298:28]
      s1_blockLoadMask_7 <= _GEN_103;
    end else begin
      s1_blockLoadMask_7 <= replayRemFire_0 & _GEN_71;
    end
    if (replayRemFire_1) begin // @[LoadQueueReplay.scala 298:28]
      s1_blockLoadMask_8 <= _GEN_104;
    end else begin
      s1_blockLoadMask_8 <= replayRemFire_0 & _GEN_72;
    end
    if (replayRemFire_1) begin // @[LoadQueueReplay.scala 298:28]
      s1_blockLoadMask_9 <= _GEN_105;
    end else begin
      s1_blockLoadMask_9 <= replayRemFire_0 & _GEN_73;
    end
    if (replayRemFire_1) begin // @[LoadQueueReplay.scala 298:28]
      s1_blockLoadMask_10 <= _GEN_106;
    end else begin
      s1_blockLoadMask_10 <= replayRemFire_0 & _GEN_74;
    end
    if (replayRemFire_1) begin // @[LoadQueueReplay.scala 298:28]
      s1_blockLoadMask_11 <= _GEN_107;
    end else begin
      s1_blockLoadMask_11 <= replayRemFire_0 & _GEN_75;
    end
    if (replayRemFire_1) begin // @[LoadQueueReplay.scala 298:28]
      s1_blockLoadMask_12 <= _GEN_108;
    end else begin
      s1_blockLoadMask_12 <= replayRemFire_0 & _GEN_76;
    end
    if (replayRemFire_1) begin // @[LoadQueueReplay.scala 298:28]
      s1_blockLoadMask_13 <= _GEN_109;
    end else begin
      s1_blockLoadMask_13 <= replayRemFire_0 & _GEN_77;
    end
    if (replayRemFire_1) begin // @[LoadQueueReplay.scala 298:28]
      s1_blockLoadMask_14 <= _GEN_110;
    end else begin
      s1_blockLoadMask_14 <= replayRemFire_0 & _GEN_78;
    end
    if (replayRemFire_1) begin // @[LoadQueueReplay.scala 298:28]
      s1_blockLoadMask_15 <= _GEN_111;
    end else begin
      s1_blockLoadMask_15 <= replayRemFire_0 & _GEN_79;
    end
    s2_blockLoadMask_0 <= s1_blockLoadMask_0; // @[LoadQueueReplay.scala 248:33]
    s2_blockLoadMask_1 <= s1_blockLoadMask_1; // @[LoadQueueReplay.scala 248:33]
    s2_blockLoadMask_2 <= s1_blockLoadMask_2; // @[LoadQueueReplay.scala 248:33]
    s2_blockLoadMask_3 <= s1_blockLoadMask_3; // @[LoadQueueReplay.scala 248:33]
    s2_blockLoadMask_4 <= s1_blockLoadMask_4; // @[LoadQueueReplay.scala 248:33]
    s2_blockLoadMask_5 <= s1_blockLoadMask_5; // @[LoadQueueReplay.scala 248:33]
    s2_blockLoadMask_6 <= s1_blockLoadMask_6; // @[LoadQueueReplay.scala 248:33]
    s2_blockLoadMask_7 <= s1_blockLoadMask_7; // @[LoadQueueReplay.scala 248:33]
    s2_blockLoadMask_8 <= s1_blockLoadMask_8; // @[LoadQueueReplay.scala 248:33]
    s2_blockLoadMask_9 <= s1_blockLoadMask_9; // @[LoadQueueReplay.scala 248:33]
    s2_blockLoadMask_10 <= s1_blockLoadMask_10; // @[LoadQueueReplay.scala 248:33]
    s2_blockLoadMask_11 <= s1_blockLoadMask_11; // @[LoadQueueReplay.scala 248:33]
    s2_blockLoadMask_12 <= s1_blockLoadMask_12; // @[LoadQueueReplay.scala 248:33]
    s2_blockLoadMask_13 <= s1_blockLoadMask_13; // @[LoadQueueReplay.scala 248:33]
    s2_blockLoadMask_14 <= s1_blockLoadMask_14; // @[LoadQueueReplay.scala 248:33]
    s2_blockLoadMask_15 <= s1_blockLoadMask_15; // @[LoadQueueReplay.scala 248:33]
    loadReplaySel_0_REG <= {loadReplayRemSel_0,1'h0}; // @[Cat.scala 31:58]
    loadReplaySel_1_REG <= {loadReplayRemSel_1,1'h1}; // @[Cat.scala 31:58]
    cancelReplay_REG_valid <= io_redirect_valid; // @[LoadQueueReplay.scala 315:63]
    cancelReplay_REG_bits_robIdx_flag <= io_redirect_bits_robIdx_flag; // @[LoadQueueReplay.scala 315:63]
    cancelReplay_REG_bits_robIdx_value <= io_redirect_bits_robIdx_value; // @[LoadQueueReplay.scala 315:63]
    cancelReplay_REG_bits_level <= io_redirect_bits_level; // @[LoadQueueReplay.scala 315:63]
    cancelReplay_REG_1_valid <= io_redirect_valid; // @[LoadQueueReplay.scala 315:63]
    cancelReplay_REG_1_bits_robIdx_flag <= io_redirect_bits_robIdx_flag; // @[LoadQueueReplay.scala 315:63]
    cancelReplay_REG_1_bits_robIdx_value <= io_redirect_bits_robIdx_value; // @[LoadQueueReplay.scala 315:63]
    cancelReplay_REG_1_bits_level <= io_redirect_bits_level; // @[LoadQueueReplay.scala 315:63]
    lastReplay <= replayRemFire_0 | replayRemFire_1; // @[LoadQueueReplay.scala 341:58]
    io_perf_0_value_REG <= io_enq_0_valid + io_enq_1_valid; // @[Bitwise.scala 48:55]
    io_perf_0_value_REG_1 <= io_perf_0_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_1_value_REG <= replayRemFire_0 + replayRemFire_1; // @[Bitwise.scala 48:55]
    io_perf_1_value_REG_1 <= io_perf_1_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_2_value_REG <= _deqBlockCount_T_1 + _deqBlockCount_T_3; // @[Bitwise.scala 48:55]
    io_perf_2_value_REG_1 <= io_perf_2_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_3_value_REG <= io_lqFull; // @[PerfCounterUtils.scala 188:35]
    io_perf_3_value_REG_1 <= io_perf_3_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_4_value_REG <= _replayRejectEnqCount_T + _replayRejectEnqCount_T_1; // @[Bitwise.scala 48:55]
    io_perf_4_value_REG_1 <= io_perf_4_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_5_value_REG <= _replaySchedErrorCount_T + _replaySchedErrorCount_T_1; // @[Bitwise.scala 48:55]
    io_perf_5_value_REG_1 <= io_perf_5_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_6_value_REG <= _replayWaitStoreCount_T + _replayWaitStoreCount_T_1; // @[Bitwise.scala 48:55]
    io_perf_6_value_REG_1 <= io_perf_6_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_7_value_REG <= _replayTlbMissCount_T + _replayTlbMissCount_T_1; // @[Bitwise.scala 48:55]
    io_perf_7_value_REG_1 <= io_perf_7_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_8_value_REG <= _replayBankConflictCount_T + _replayBankConflictCount_T_1; // @[Bitwise.scala 48:55]
    io_perf_8_value_REG_1 <= io_perf_8_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_9_value_REG <= _replayDCacheReplayCount_T + _replayDCacheReplayCount_T_1; // @[Bitwise.scala 48:55]
    io_perf_9_value_REG_1 <= io_perf_9_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_10_value_REG <= _replayForwardFailCount_T + _replayForwardFailCount_T_1; // @[Bitwise.scala 48:55]
    io_perf_10_value_REG_1 <= io_perf_10_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_11_value_REG <= _replayDCacheMissCount_T + _replayDCacheMissCount_T_1; // @[Bitwise.scala 48:55]
    io_perf_11_value_REG_1 <= io_perf_11_value_REG; // @[PerfCounterUtils.scala 188:27]
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 444:26]
      allocated_0 <= 1'h0; // @[LoadQueueReplay.scala 445:20]
    end else if (needCancel_0) begin // @[LoadQueueReplay.scala 362:29]
      allocated_0 <= 1'h0;
    end else if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      allocated_0 <= _GEN_8639;
    end else if (canEnqueueVec_0) begin // @[LoadQueueReplay.scala 333:30]
      allocated_0 <= _GEN_3988;
    end else if (replayRemFire_1) begin
      allocated_0 <= _GEN_3921;
    end else begin
      allocated_0 <= _GEN_2048;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 444:26]
      allocated_1 <= 1'h0; // @[LoadQueueReplay.scala 445:20]
    end else if (needCancel_1) begin // @[LoadQueueReplay.scala 362:29]
      allocated_1 <= 1'h0;
    end else if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      allocated_1 <= _GEN_8640;
    end else if (canEnqueueVec_0) begin // @[LoadQueueReplay.scala 333:30]
      allocated_1 <= _GEN_3989;
    end else if (replayRemFire_1) begin
      allocated_1 <= _GEN_3922;
    end else begin
      allocated_1 <= _GEN_2049;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 444:26]
      allocated_2 <= 1'h0; // @[LoadQueueReplay.scala 445:20]
    end else if (needCancel_2) begin // @[LoadQueueReplay.scala 362:29]
      allocated_2 <= 1'h0;
    end else if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      allocated_2 <= _GEN_8641;
    end else if (canEnqueueVec_0) begin // @[LoadQueueReplay.scala 333:30]
      allocated_2 <= _GEN_3990;
    end else if (replayRemFire_1) begin
      allocated_2 <= _GEN_3923;
    end else begin
      allocated_2 <= _GEN_2050;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 444:26]
      allocated_3 <= 1'h0; // @[LoadQueueReplay.scala 445:20]
    end else if (needCancel_3) begin // @[LoadQueueReplay.scala 362:29]
      allocated_3 <= 1'h0;
    end else if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      allocated_3 <= _GEN_8642;
    end else if (canEnqueueVec_0) begin // @[LoadQueueReplay.scala 333:30]
      allocated_3 <= _GEN_3991;
    end else if (replayRemFire_1) begin
      allocated_3 <= _GEN_3924;
    end else begin
      allocated_3 <= _GEN_2051;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 444:26]
      allocated_4 <= 1'h0; // @[LoadQueueReplay.scala 445:20]
    end else if (needCancel_4) begin // @[LoadQueueReplay.scala 362:29]
      allocated_4 <= 1'h0;
    end else if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      allocated_4 <= _GEN_8643;
    end else if (canEnqueueVec_0) begin // @[LoadQueueReplay.scala 333:30]
      allocated_4 <= _GEN_3992;
    end else if (replayRemFire_1) begin
      allocated_4 <= _GEN_3925;
    end else begin
      allocated_4 <= _GEN_2052;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 444:26]
      allocated_5 <= 1'h0; // @[LoadQueueReplay.scala 445:20]
    end else if (needCancel_5) begin // @[LoadQueueReplay.scala 362:29]
      allocated_5 <= 1'h0;
    end else if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      allocated_5 <= _GEN_8644;
    end else if (canEnqueueVec_0) begin // @[LoadQueueReplay.scala 333:30]
      allocated_5 <= _GEN_3993;
    end else if (replayRemFire_1) begin
      allocated_5 <= _GEN_3926;
    end else begin
      allocated_5 <= _GEN_2053;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 444:26]
      allocated_6 <= 1'h0; // @[LoadQueueReplay.scala 445:20]
    end else if (needCancel_6) begin // @[LoadQueueReplay.scala 362:29]
      allocated_6 <= 1'h0;
    end else if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      allocated_6 <= _GEN_8645;
    end else if (canEnqueueVec_0) begin // @[LoadQueueReplay.scala 333:30]
      allocated_6 <= _GEN_3994;
    end else if (replayRemFire_1) begin
      allocated_6 <= _GEN_3927;
    end else begin
      allocated_6 <= _GEN_2054;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 444:26]
      allocated_7 <= 1'h0; // @[LoadQueueReplay.scala 445:20]
    end else if (needCancel_7) begin // @[LoadQueueReplay.scala 362:29]
      allocated_7 <= 1'h0;
    end else if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      allocated_7 <= _GEN_8646;
    end else if (canEnqueueVec_0) begin // @[LoadQueueReplay.scala 333:30]
      allocated_7 <= _GEN_3995;
    end else if (replayRemFire_1) begin
      allocated_7 <= _GEN_3928;
    end else begin
      allocated_7 <= _GEN_2055;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 444:26]
      allocated_8 <= 1'h0; // @[LoadQueueReplay.scala 445:20]
    end else if (needCancel_8) begin // @[LoadQueueReplay.scala 362:29]
      allocated_8 <= 1'h0;
    end else if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      allocated_8 <= _GEN_8647;
    end else if (canEnqueueVec_0) begin // @[LoadQueueReplay.scala 333:30]
      allocated_8 <= _GEN_3996;
    end else if (replayRemFire_1) begin
      allocated_8 <= _GEN_3929;
    end else begin
      allocated_8 <= _GEN_2056;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 444:26]
      allocated_9 <= 1'h0; // @[LoadQueueReplay.scala 445:20]
    end else if (needCancel_9) begin // @[LoadQueueReplay.scala 362:29]
      allocated_9 <= 1'h0;
    end else if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      allocated_9 <= _GEN_8648;
    end else if (canEnqueueVec_0) begin // @[LoadQueueReplay.scala 333:30]
      allocated_9 <= _GEN_3997;
    end else if (replayRemFire_1) begin
      allocated_9 <= _GEN_3930;
    end else begin
      allocated_9 <= _GEN_2057;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 444:26]
      allocated_10 <= 1'h0; // @[LoadQueueReplay.scala 445:20]
    end else if (needCancel_10) begin // @[LoadQueueReplay.scala 362:29]
      allocated_10 <= 1'h0;
    end else if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      allocated_10 <= _GEN_8649;
    end else if (canEnqueueVec_0) begin // @[LoadQueueReplay.scala 333:30]
      allocated_10 <= _GEN_3998;
    end else if (replayRemFire_1) begin
      allocated_10 <= _GEN_3931;
    end else begin
      allocated_10 <= _GEN_2058;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 444:26]
      allocated_11 <= 1'h0; // @[LoadQueueReplay.scala 445:20]
    end else if (needCancel_11) begin // @[LoadQueueReplay.scala 362:29]
      allocated_11 <= 1'h0;
    end else if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      allocated_11 <= _GEN_8650;
    end else if (canEnqueueVec_0) begin // @[LoadQueueReplay.scala 333:30]
      allocated_11 <= _GEN_3999;
    end else if (replayRemFire_1) begin
      allocated_11 <= _GEN_3932;
    end else begin
      allocated_11 <= _GEN_2059;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 444:26]
      allocated_12 <= 1'h0; // @[LoadQueueReplay.scala 445:20]
    end else if (needCancel_12) begin // @[LoadQueueReplay.scala 362:29]
      allocated_12 <= 1'h0;
    end else if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      allocated_12 <= _GEN_8651;
    end else if (canEnqueueVec_0) begin // @[LoadQueueReplay.scala 333:30]
      allocated_12 <= _GEN_4000;
    end else if (replayRemFire_1) begin
      allocated_12 <= _GEN_3933;
    end else begin
      allocated_12 <= _GEN_2060;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 444:26]
      allocated_13 <= 1'h0; // @[LoadQueueReplay.scala 445:20]
    end else if (needCancel_13) begin // @[LoadQueueReplay.scala 362:29]
      allocated_13 <= 1'h0;
    end else if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      allocated_13 <= _GEN_8652;
    end else if (canEnqueueVec_0) begin // @[LoadQueueReplay.scala 333:30]
      allocated_13 <= _GEN_4001;
    end else if (replayRemFire_1) begin
      allocated_13 <= _GEN_3934;
    end else begin
      allocated_13 <= _GEN_2061;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 444:26]
      allocated_14 <= 1'h0; // @[LoadQueueReplay.scala 445:20]
    end else if (needCancel_14) begin // @[LoadQueueReplay.scala 362:29]
      allocated_14 <= 1'h0;
    end else if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      allocated_14 <= _GEN_8653;
    end else if (canEnqueueVec_0) begin // @[LoadQueueReplay.scala 333:30]
      allocated_14 <= _GEN_4002;
    end else if (replayRemFire_1) begin
      allocated_14 <= _GEN_3935;
    end else begin
      allocated_14 <= _GEN_2062;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 444:26]
      allocated_15 <= 1'h0; // @[LoadQueueReplay.scala 445:20]
    end else if (needCancel_15) begin // @[LoadQueueReplay.scala 362:29]
      allocated_15 <= 1'h0;
    end else if (canEnqueueVec_1) begin // @[LoadQueueReplay.scala 362:29]
      allocated_15 <= _GEN_8654;
    end else if (canEnqueueVec_0) begin // @[LoadQueueReplay.scala 333:30]
      allocated_15 <= _GEN_4003;
    end else if (replayRemFire_1) begin
      allocated_15 <= _GEN_3936;
    end else begin
      allocated_15 <= _GEN_2063;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      cause_0 <= 8'h0; // @[LoadQueueReplay.scala 379:{21,21}]
    end else if (canEnqueueVec_1) begin
      if (4'h0 == enqIdx_1) begin
        cause_0 <= _needReplay_T_1;
      end else begin
        cause_0 <= _GEN_8303;
      end
    end else begin
      cause_0 <= _GEN_8303;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      cause_1 <= 8'h0; // @[LoadQueueReplay.scala 379:{21,21}]
    end else if (canEnqueueVec_1) begin
      if (4'h1 == enqIdx_1) begin
        cause_1 <= _needReplay_T_1;
      end else begin
        cause_1 <= _GEN_8304;
      end
    end else begin
      cause_1 <= _GEN_8304;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      cause_2 <= 8'h0; // @[LoadQueueReplay.scala 379:{21,21}]
    end else if (canEnqueueVec_1) begin
      if (4'h2 == enqIdx_1) begin
        cause_2 <= _needReplay_T_1;
      end else begin
        cause_2 <= _GEN_8305;
      end
    end else begin
      cause_2 <= _GEN_8305;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      cause_3 <= 8'h0; // @[LoadQueueReplay.scala 379:{21,21}]
    end else if (canEnqueueVec_1) begin
      if (4'h3 == enqIdx_1) begin
        cause_3 <= _needReplay_T_1;
      end else begin
        cause_3 <= _GEN_8306;
      end
    end else begin
      cause_3 <= _GEN_8306;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      cause_4 <= 8'h0; // @[LoadQueueReplay.scala 379:{21,21}]
    end else if (canEnqueueVec_1) begin
      if (4'h4 == enqIdx_1) begin
        cause_4 <= _needReplay_T_1;
      end else begin
        cause_4 <= _GEN_8307;
      end
    end else begin
      cause_4 <= _GEN_8307;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      cause_5 <= 8'h0; // @[LoadQueueReplay.scala 379:{21,21}]
    end else if (canEnqueueVec_1) begin
      if (4'h5 == enqIdx_1) begin
        cause_5 <= _needReplay_T_1;
      end else begin
        cause_5 <= _GEN_8308;
      end
    end else begin
      cause_5 <= _GEN_8308;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      cause_6 <= 8'h0; // @[LoadQueueReplay.scala 379:{21,21}]
    end else if (canEnqueueVec_1) begin
      if (4'h6 == enqIdx_1) begin
        cause_6 <= _needReplay_T_1;
      end else begin
        cause_6 <= _GEN_8309;
      end
    end else begin
      cause_6 <= _GEN_8309;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      cause_7 <= 8'h0; // @[LoadQueueReplay.scala 379:{21,21}]
    end else if (canEnqueueVec_1) begin
      if (4'h7 == enqIdx_1) begin
        cause_7 <= _needReplay_T_1;
      end else begin
        cause_7 <= _GEN_8310;
      end
    end else begin
      cause_7 <= _GEN_8310;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      cause_8 <= 8'h0; // @[LoadQueueReplay.scala 379:{21,21}]
    end else if (canEnqueueVec_1) begin
      if (4'h8 == enqIdx_1) begin
        cause_8 <= _needReplay_T_1;
      end else begin
        cause_8 <= _GEN_8311;
      end
    end else begin
      cause_8 <= _GEN_8311;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      cause_9 <= 8'h0; // @[LoadQueueReplay.scala 379:{21,21}]
    end else if (canEnqueueVec_1) begin
      if (4'h9 == enqIdx_1) begin
        cause_9 <= _needReplay_T_1;
      end else begin
        cause_9 <= _GEN_8312;
      end
    end else begin
      cause_9 <= _GEN_8312;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      cause_10 <= 8'h0; // @[LoadQueueReplay.scala 379:{21,21}]
    end else if (canEnqueueVec_1) begin
      if (4'ha == enqIdx_1) begin
        cause_10 <= _needReplay_T_1;
      end else begin
        cause_10 <= _GEN_8313;
      end
    end else begin
      cause_10 <= _GEN_8313;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      cause_11 <= 8'h0; // @[LoadQueueReplay.scala 379:{21,21}]
    end else if (canEnqueueVec_1) begin
      if (4'hb == enqIdx_1) begin
        cause_11 <= _needReplay_T_1;
      end else begin
        cause_11 <= _GEN_8314;
      end
    end else begin
      cause_11 <= _GEN_8314;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      cause_12 <= 8'h0; // @[LoadQueueReplay.scala 379:{21,21}]
    end else if (canEnqueueVec_1) begin
      if (4'hc == enqIdx_1) begin
        cause_12 <= _needReplay_T_1;
      end else begin
        cause_12 <= _GEN_8315;
      end
    end else begin
      cause_12 <= _GEN_8315;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      cause_13 <= 8'h0; // @[LoadQueueReplay.scala 379:{21,21}]
    end else if (canEnqueueVec_1) begin
      if (4'hd == enqIdx_1) begin
        cause_13 <= _needReplay_T_1;
      end else begin
        cause_13 <= _GEN_8316;
      end
    end else begin
      cause_13 <= _GEN_8316;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      cause_14 <= 8'h0; // @[LoadQueueReplay.scala 379:{21,21}]
    end else if (canEnqueueVec_1) begin
      if (4'he == enqIdx_1) begin
        cause_14 <= _needReplay_T_1;
      end else begin
        cause_14 <= _GEN_8317;
      end
    end else begin
      cause_14 <= _GEN_8317;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      cause_15 <= 8'h0; // @[LoadQueueReplay.scala 379:{21,21}]
    end else if (canEnqueueVec_1) begin
      if (4'hf == enqIdx_1) begin
        cause_15 <= _needReplay_T_1;
      end else begin
        cause_15 <= _GEN_8318;
      end
    end else begin
      cause_15 <= _GEN_8318;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockPtrOthers_0 <= 2'h0; // @[LoadQueueReplay.scala 391:57 395:67 398:117]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_0) begin
        blockPtrOthers_0 <= _GEN_8447;
      end else if (io_enq_1_bits_replayInfo_cause_7) begin
        blockPtrOthers_0 <= _GEN_8447;
      end else if (io_enq_1_bits_replayInfo_cause_6 | io_enq_1_bits_replayInfo_cause_1) begin
        blockPtrOthers_0 <= _GEN_10615;
      end else begin
        blockPtrOthers_0 <= _GEN_10679;
      end
    end else begin
      blockPtrOthers_0 <= _GEN_8447;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockPtrOthers_1 <= 2'h0; // @[LoadQueueReplay.scala 391:57 395:67 398:117]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_0) begin
        blockPtrOthers_1 <= _GEN_8448;
      end else if (io_enq_1_bits_replayInfo_cause_7) begin
        blockPtrOthers_1 <= _GEN_8448;
      end else if (io_enq_1_bits_replayInfo_cause_6 | io_enq_1_bits_replayInfo_cause_1) begin
        blockPtrOthers_1 <= _GEN_10616;
      end else begin
        blockPtrOthers_1 <= _GEN_10680;
      end
    end else begin
      blockPtrOthers_1 <= _GEN_8448;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockPtrOthers_2 <= 2'h0; // @[LoadQueueReplay.scala 391:57 395:67 398:117]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_0) begin
        blockPtrOthers_2 <= _GEN_8449;
      end else if (io_enq_1_bits_replayInfo_cause_7) begin
        blockPtrOthers_2 <= _GEN_8449;
      end else if (io_enq_1_bits_replayInfo_cause_6 | io_enq_1_bits_replayInfo_cause_1) begin
        blockPtrOthers_2 <= _GEN_10617;
      end else begin
        blockPtrOthers_2 <= _GEN_10681;
      end
    end else begin
      blockPtrOthers_2 <= _GEN_8449;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockPtrOthers_3 <= 2'h0; // @[LoadQueueReplay.scala 391:57 395:67 398:117]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_0) begin
        blockPtrOthers_3 <= _GEN_8450;
      end else if (io_enq_1_bits_replayInfo_cause_7) begin
        blockPtrOthers_3 <= _GEN_8450;
      end else if (io_enq_1_bits_replayInfo_cause_6 | io_enq_1_bits_replayInfo_cause_1) begin
        blockPtrOthers_3 <= _GEN_10618;
      end else begin
        blockPtrOthers_3 <= _GEN_10682;
      end
    end else begin
      blockPtrOthers_3 <= _GEN_8450;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockPtrOthers_4 <= 2'h0; // @[LoadQueueReplay.scala 391:57 395:67 398:117]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_0) begin
        blockPtrOthers_4 <= _GEN_8451;
      end else if (io_enq_1_bits_replayInfo_cause_7) begin
        blockPtrOthers_4 <= _GEN_8451;
      end else if (io_enq_1_bits_replayInfo_cause_6 | io_enq_1_bits_replayInfo_cause_1) begin
        blockPtrOthers_4 <= _GEN_10619;
      end else begin
        blockPtrOthers_4 <= _GEN_10683;
      end
    end else begin
      blockPtrOthers_4 <= _GEN_8451;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockPtrOthers_5 <= 2'h0; // @[LoadQueueReplay.scala 391:57 395:67 398:117]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_0) begin
        blockPtrOthers_5 <= _GEN_8452;
      end else if (io_enq_1_bits_replayInfo_cause_7) begin
        blockPtrOthers_5 <= _GEN_8452;
      end else if (io_enq_1_bits_replayInfo_cause_6 | io_enq_1_bits_replayInfo_cause_1) begin
        blockPtrOthers_5 <= _GEN_10620;
      end else begin
        blockPtrOthers_5 <= _GEN_10684;
      end
    end else begin
      blockPtrOthers_5 <= _GEN_8452;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockPtrOthers_6 <= 2'h0; // @[LoadQueueReplay.scala 391:57 395:67 398:117]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_0) begin
        blockPtrOthers_6 <= _GEN_8453;
      end else if (io_enq_1_bits_replayInfo_cause_7) begin
        blockPtrOthers_6 <= _GEN_8453;
      end else if (io_enq_1_bits_replayInfo_cause_6 | io_enq_1_bits_replayInfo_cause_1) begin
        blockPtrOthers_6 <= _GEN_10621;
      end else begin
        blockPtrOthers_6 <= _GEN_10685;
      end
    end else begin
      blockPtrOthers_6 <= _GEN_8453;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockPtrOthers_7 <= 2'h0; // @[LoadQueueReplay.scala 391:57 395:67 398:117]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_0) begin
        blockPtrOthers_7 <= _GEN_8454;
      end else if (io_enq_1_bits_replayInfo_cause_7) begin
        blockPtrOthers_7 <= _GEN_8454;
      end else if (io_enq_1_bits_replayInfo_cause_6 | io_enq_1_bits_replayInfo_cause_1) begin
        blockPtrOthers_7 <= _GEN_10622;
      end else begin
        blockPtrOthers_7 <= _GEN_10686;
      end
    end else begin
      blockPtrOthers_7 <= _GEN_8454;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockPtrOthers_8 <= 2'h0; // @[LoadQueueReplay.scala 391:57 395:67 398:117]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_0) begin
        blockPtrOthers_8 <= _GEN_8455;
      end else if (io_enq_1_bits_replayInfo_cause_7) begin
        blockPtrOthers_8 <= _GEN_8455;
      end else if (io_enq_1_bits_replayInfo_cause_6 | io_enq_1_bits_replayInfo_cause_1) begin
        blockPtrOthers_8 <= _GEN_10623;
      end else begin
        blockPtrOthers_8 <= _GEN_10687;
      end
    end else begin
      blockPtrOthers_8 <= _GEN_8455;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockPtrOthers_9 <= 2'h0; // @[LoadQueueReplay.scala 391:57 395:67 398:117]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_0) begin
        blockPtrOthers_9 <= _GEN_8456;
      end else if (io_enq_1_bits_replayInfo_cause_7) begin
        blockPtrOthers_9 <= _GEN_8456;
      end else if (io_enq_1_bits_replayInfo_cause_6 | io_enq_1_bits_replayInfo_cause_1) begin
        blockPtrOthers_9 <= _GEN_10624;
      end else begin
        blockPtrOthers_9 <= _GEN_10688;
      end
    end else begin
      blockPtrOthers_9 <= _GEN_8456;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockPtrOthers_10 <= 2'h0; // @[LoadQueueReplay.scala 391:57 395:67 398:117]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_0) begin
        blockPtrOthers_10 <= _GEN_8457;
      end else if (io_enq_1_bits_replayInfo_cause_7) begin
        blockPtrOthers_10 <= _GEN_8457;
      end else if (io_enq_1_bits_replayInfo_cause_6 | io_enq_1_bits_replayInfo_cause_1) begin
        blockPtrOthers_10 <= _GEN_10625;
      end else begin
        blockPtrOthers_10 <= _GEN_10689;
      end
    end else begin
      blockPtrOthers_10 <= _GEN_8457;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockPtrOthers_11 <= 2'h0; // @[LoadQueueReplay.scala 391:57 395:67 398:117]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_0) begin
        blockPtrOthers_11 <= _GEN_8458;
      end else if (io_enq_1_bits_replayInfo_cause_7) begin
        blockPtrOthers_11 <= _GEN_8458;
      end else if (io_enq_1_bits_replayInfo_cause_6 | io_enq_1_bits_replayInfo_cause_1) begin
        blockPtrOthers_11 <= _GEN_10626;
      end else begin
        blockPtrOthers_11 <= _GEN_10690;
      end
    end else begin
      blockPtrOthers_11 <= _GEN_8458;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockPtrOthers_12 <= 2'h0; // @[LoadQueueReplay.scala 391:57 395:67 398:117]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_0) begin
        blockPtrOthers_12 <= _GEN_8459;
      end else if (io_enq_1_bits_replayInfo_cause_7) begin
        blockPtrOthers_12 <= _GEN_8459;
      end else if (io_enq_1_bits_replayInfo_cause_6 | io_enq_1_bits_replayInfo_cause_1) begin
        blockPtrOthers_12 <= _GEN_10627;
      end else begin
        blockPtrOthers_12 <= _GEN_10691;
      end
    end else begin
      blockPtrOthers_12 <= _GEN_8459;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockPtrOthers_13 <= 2'h0; // @[LoadQueueReplay.scala 391:57 395:67 398:117]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_0) begin
        blockPtrOthers_13 <= _GEN_8460;
      end else if (io_enq_1_bits_replayInfo_cause_7) begin
        blockPtrOthers_13 <= _GEN_8460;
      end else if (io_enq_1_bits_replayInfo_cause_6 | io_enq_1_bits_replayInfo_cause_1) begin
        blockPtrOthers_13 <= _GEN_10628;
      end else begin
        blockPtrOthers_13 <= _GEN_10692;
      end
    end else begin
      blockPtrOthers_13 <= _GEN_8460;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockPtrOthers_14 <= 2'h0; // @[LoadQueueReplay.scala 391:57 395:67 398:117]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_0) begin
        blockPtrOthers_14 <= _GEN_8461;
      end else if (io_enq_1_bits_replayInfo_cause_7) begin
        blockPtrOthers_14 <= _GEN_8461;
      end else if (io_enq_1_bits_replayInfo_cause_6 | io_enq_1_bits_replayInfo_cause_1) begin
        blockPtrOthers_14 <= _GEN_10629;
      end else begin
        blockPtrOthers_14 <= _GEN_10693;
      end
    end else begin
      blockPtrOthers_14 <= _GEN_8461;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockPtrOthers_15 <= 2'h0; // @[LoadQueueReplay.scala 391:57 395:67 398:117]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_0) begin
        blockPtrOthers_15 <= _GEN_8462;
      end else if (io_enq_1_bits_replayInfo_cause_7) begin
        blockPtrOthers_15 <= _GEN_8462;
      end else if (io_enq_1_bits_replayInfo_cause_6 | io_enq_1_bits_replayInfo_cause_1) begin
        blockPtrOthers_15 <= _GEN_10630;
      end else begin
        blockPtrOthers_15 <= _GEN_10694;
      end
    end else begin
      blockPtrOthers_15 <= _GEN_8462;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockCounter_0 <= 5'h0; // @[LoadQueueReplay.scala 432:{28,28}]
    end else if (canEnqueueVec_1) begin
      if (4'h0 == enqIdx_1) begin
        blockCounter_0 <= 5'h0;
      end else begin
        blockCounter_0 <= _GEN_8607;
      end
    end else begin
      blockCounter_0 <= _GEN_8607;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockCounter_1 <= 5'h0; // @[LoadQueueReplay.scala 432:{28,28}]
    end else if (canEnqueueVec_1) begin
      if (4'h1 == enqIdx_1) begin
        blockCounter_1 <= 5'h0;
      end else begin
        blockCounter_1 <= _GEN_8608;
      end
    end else begin
      blockCounter_1 <= _GEN_8608;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockCounter_2 <= 5'h0; // @[LoadQueueReplay.scala 432:{28,28}]
    end else if (canEnqueueVec_1) begin
      if (4'h2 == enqIdx_1) begin
        blockCounter_2 <= 5'h0;
      end else begin
        blockCounter_2 <= _GEN_8609;
      end
    end else begin
      blockCounter_2 <= _GEN_8609;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockCounter_3 <= 5'h0; // @[LoadQueueReplay.scala 432:{28,28}]
    end else if (canEnqueueVec_1) begin
      if (4'h3 == enqIdx_1) begin
        blockCounter_3 <= 5'h0;
      end else begin
        blockCounter_3 <= _GEN_8610;
      end
    end else begin
      blockCounter_3 <= _GEN_8610;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockCounter_4 <= 5'h0; // @[LoadQueueReplay.scala 432:{28,28}]
    end else if (canEnqueueVec_1) begin
      if (4'h4 == enqIdx_1) begin
        blockCounter_4 <= 5'h0;
      end else begin
        blockCounter_4 <= _GEN_8611;
      end
    end else begin
      blockCounter_4 <= _GEN_8611;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockCounter_5 <= 5'h0; // @[LoadQueueReplay.scala 432:{28,28}]
    end else if (canEnqueueVec_1) begin
      if (4'h5 == enqIdx_1) begin
        blockCounter_5 <= 5'h0;
      end else begin
        blockCounter_5 <= _GEN_8612;
      end
    end else begin
      blockCounter_5 <= _GEN_8612;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockCounter_6 <= 5'h0; // @[LoadQueueReplay.scala 432:{28,28}]
    end else if (canEnqueueVec_1) begin
      if (4'h6 == enqIdx_1) begin
        blockCounter_6 <= 5'h0;
      end else begin
        blockCounter_6 <= _GEN_8613;
      end
    end else begin
      blockCounter_6 <= _GEN_8613;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockCounter_7 <= 5'h0; // @[LoadQueueReplay.scala 432:{28,28}]
    end else if (canEnqueueVec_1) begin
      if (4'h7 == enqIdx_1) begin
        blockCounter_7 <= 5'h0;
      end else begin
        blockCounter_7 <= _GEN_8614;
      end
    end else begin
      blockCounter_7 <= _GEN_8614;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockCounter_8 <= 5'h0; // @[LoadQueueReplay.scala 432:{28,28}]
    end else if (canEnqueueVec_1) begin
      if (4'h8 == enqIdx_1) begin
        blockCounter_8 <= 5'h0;
      end else begin
        blockCounter_8 <= _GEN_8615;
      end
    end else begin
      blockCounter_8 <= _GEN_8615;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockCounter_9 <= 5'h0; // @[LoadQueueReplay.scala 432:{28,28}]
    end else if (canEnqueueVec_1) begin
      if (4'h9 == enqIdx_1) begin
        blockCounter_9 <= 5'h0;
      end else begin
        blockCounter_9 <= _GEN_8616;
      end
    end else begin
      blockCounter_9 <= _GEN_8616;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockCounter_10 <= 5'h0; // @[LoadQueueReplay.scala 432:{28,28}]
    end else if (canEnqueueVec_1) begin
      if (4'ha == enqIdx_1) begin
        blockCounter_10 <= 5'h0;
      end else begin
        blockCounter_10 <= _GEN_8617;
      end
    end else begin
      blockCounter_10 <= _GEN_8617;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockCounter_11 <= 5'h0; // @[LoadQueueReplay.scala 432:{28,28}]
    end else if (canEnqueueVec_1) begin
      if (4'hb == enqIdx_1) begin
        blockCounter_11 <= 5'h0;
      end else begin
        blockCounter_11 <= _GEN_8618;
      end
    end else begin
      blockCounter_11 <= _GEN_8618;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockCounter_12 <= 5'h0; // @[LoadQueueReplay.scala 432:{28,28}]
    end else if (canEnqueueVec_1) begin
      if (4'hc == enqIdx_1) begin
        blockCounter_12 <= 5'h0;
      end else begin
        blockCounter_12 <= _GEN_8619;
      end
    end else begin
      blockCounter_12 <= _GEN_8619;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockCounter_13 <= 5'h0; // @[LoadQueueReplay.scala 432:{28,28}]
    end else if (canEnqueueVec_1) begin
      if (4'hd == enqIdx_1) begin
        blockCounter_13 <= 5'h0;
      end else begin
        blockCounter_13 <= _GEN_8620;
      end
    end else begin
      blockCounter_13 <= _GEN_8620;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockCounter_14 <= 5'h0; // @[LoadQueueReplay.scala 432:{28,28}]
    end else if (canEnqueueVec_1) begin
      if (4'he == enqIdx_1) begin
        blockCounter_14 <= 5'h0;
      end else begin
        blockCounter_14 <= _GEN_8621;
      end
    end else begin
      blockCounter_14 <= _GEN_8621;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockCounter_15 <= 5'h0; // @[LoadQueueReplay.scala 432:{28,28}]
    end else if (canEnqueueVec_1) begin
      if (4'hf == enqIdx_1) begin
        blockCounter_15 <= 5'h0;
      end else begin
        blockCounter_15 <= _GEN_8622;
      end
    end else begin
      blockCounter_15 <= _GEN_8622;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 162:38]
      selBlocked_0 <= 1'h0;
    end else begin
      selBlocked_0 <= creditUpdate_0 != 6'h0;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 162:38]
      selBlocked_1 <= 1'h0;
    end else begin
      selBlocked_1 <= creditUpdate_1 != 6'h0;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 162:38]
      selBlocked_2 <= 1'h0;
    end else begin
      selBlocked_2 <= creditUpdate_2 != 6'h0;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 162:38]
      selBlocked_3 <= 1'h0;
    end else begin
      selBlocked_3 <= creditUpdate_3 != 6'h0;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 162:38]
      selBlocked_4 <= 1'h0;
    end else begin
      selBlocked_4 <= creditUpdate_4 != 6'h0;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 162:38]
      selBlocked_5 <= 1'h0;
    end else begin
      selBlocked_5 <= creditUpdate_5 != 6'h0;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 162:38]
      selBlocked_6 <= 1'h0;
    end else begin
      selBlocked_6 <= creditUpdate_6 != 6'h0;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 162:38]
      selBlocked_7 <= 1'h0;
    end else begin
      selBlocked_7 <= creditUpdate_7 != 6'h0;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 162:38]
      selBlocked_8 <= 1'h0;
    end else begin
      selBlocked_8 <= creditUpdate_8 != 6'h0;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 162:38]
      selBlocked_9 <= 1'h0;
    end else begin
      selBlocked_9 <= creditUpdate_9 != 6'h0;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 162:38]
      selBlocked_10 <= 1'h0;
    end else begin
      selBlocked_10 <= creditUpdate_10 != 6'h0;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 162:38]
      selBlocked_11 <= 1'h0;
    end else begin
      selBlocked_11 <= creditUpdate_11 != 6'h0;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 162:38]
      selBlocked_12 <= 1'h0;
    end else begin
      selBlocked_12 <= creditUpdate_12 != 6'h0;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 162:38]
      selBlocked_13 <= 1'h0;
    end else begin
      selBlocked_13 <= creditUpdate_13 != 6'h0;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 162:38]
      selBlocked_14 <= 1'h0;
    end else begin
      selBlocked_14 <= creditUpdate_14 != 6'h0;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 162:38]
      selBlocked_15 <= 1'h0;
    end else begin
      selBlocked_15 <= creditUpdate_15 != 6'h0;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByTlbMiss_0 <= 1'h0; // @[LoadQueueReplay.scala 384:{30,30} 391:57]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_0) begin
        blockByTlbMiss_0 <= _GEN_10519;
      end else if (4'h0 == enqIdx_1) begin
        blockByTlbMiss_0 <= 1'h0;
      end else begin
        blockByTlbMiss_0 <= _GEN_8335;
      end
    end else begin
      blockByTlbMiss_0 <= _GEN_8335;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByTlbMiss_1 <= 1'h0; // @[LoadQueueReplay.scala 384:{30,30} 391:57]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_0) begin
        blockByTlbMiss_1 <= _GEN_10520;
      end else if (4'h1 == enqIdx_1) begin
        blockByTlbMiss_1 <= 1'h0;
      end else begin
        blockByTlbMiss_1 <= _GEN_8336;
      end
    end else begin
      blockByTlbMiss_1 <= _GEN_8336;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByTlbMiss_2 <= 1'h0; // @[LoadQueueReplay.scala 384:{30,30} 391:57]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_0) begin
        blockByTlbMiss_2 <= _GEN_10521;
      end else if (4'h2 == enqIdx_1) begin
        blockByTlbMiss_2 <= 1'h0;
      end else begin
        blockByTlbMiss_2 <= _GEN_8337;
      end
    end else begin
      blockByTlbMiss_2 <= _GEN_8337;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByTlbMiss_3 <= 1'h0; // @[LoadQueueReplay.scala 384:{30,30} 391:57]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_0) begin
        blockByTlbMiss_3 <= _GEN_10522;
      end else if (4'h3 == enqIdx_1) begin
        blockByTlbMiss_3 <= 1'h0;
      end else begin
        blockByTlbMiss_3 <= _GEN_8338;
      end
    end else begin
      blockByTlbMiss_3 <= _GEN_8338;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByTlbMiss_4 <= 1'h0; // @[LoadQueueReplay.scala 384:{30,30} 391:57]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_0) begin
        blockByTlbMiss_4 <= _GEN_10523;
      end else if (4'h4 == enqIdx_1) begin
        blockByTlbMiss_4 <= 1'h0;
      end else begin
        blockByTlbMiss_4 <= _GEN_8339;
      end
    end else begin
      blockByTlbMiss_4 <= _GEN_8339;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByTlbMiss_5 <= 1'h0; // @[LoadQueueReplay.scala 384:{30,30} 391:57]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_0) begin
        blockByTlbMiss_5 <= _GEN_10524;
      end else if (4'h5 == enqIdx_1) begin
        blockByTlbMiss_5 <= 1'h0;
      end else begin
        blockByTlbMiss_5 <= _GEN_8340;
      end
    end else begin
      blockByTlbMiss_5 <= _GEN_8340;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByTlbMiss_6 <= 1'h0; // @[LoadQueueReplay.scala 384:{30,30} 391:57]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_0) begin
        blockByTlbMiss_6 <= _GEN_10525;
      end else if (4'h6 == enqIdx_1) begin
        blockByTlbMiss_6 <= 1'h0;
      end else begin
        blockByTlbMiss_6 <= _GEN_8341;
      end
    end else begin
      blockByTlbMiss_6 <= _GEN_8341;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByTlbMiss_7 <= 1'h0; // @[LoadQueueReplay.scala 384:{30,30} 391:57]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_0) begin
        blockByTlbMiss_7 <= _GEN_10526;
      end else if (4'h7 == enqIdx_1) begin
        blockByTlbMiss_7 <= 1'h0;
      end else begin
        blockByTlbMiss_7 <= _GEN_8342;
      end
    end else begin
      blockByTlbMiss_7 <= _GEN_8342;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByTlbMiss_8 <= 1'h0; // @[LoadQueueReplay.scala 384:{30,30} 391:57]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_0) begin
        blockByTlbMiss_8 <= _GEN_10527;
      end else if (4'h8 == enqIdx_1) begin
        blockByTlbMiss_8 <= 1'h0;
      end else begin
        blockByTlbMiss_8 <= _GEN_8343;
      end
    end else begin
      blockByTlbMiss_8 <= _GEN_8343;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByTlbMiss_9 <= 1'h0; // @[LoadQueueReplay.scala 384:{30,30} 391:57]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_0) begin
        blockByTlbMiss_9 <= _GEN_10528;
      end else if (4'h9 == enqIdx_1) begin
        blockByTlbMiss_9 <= 1'h0;
      end else begin
        blockByTlbMiss_9 <= _GEN_8344;
      end
    end else begin
      blockByTlbMiss_9 <= _GEN_8344;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByTlbMiss_10 <= 1'h0; // @[LoadQueueReplay.scala 384:{30,30} 391:57]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_0) begin
        blockByTlbMiss_10 <= _GEN_10529;
      end else if (4'ha == enqIdx_1) begin
        blockByTlbMiss_10 <= 1'h0;
      end else begin
        blockByTlbMiss_10 <= _GEN_8345;
      end
    end else begin
      blockByTlbMiss_10 <= _GEN_8345;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByTlbMiss_11 <= 1'h0; // @[LoadQueueReplay.scala 384:{30,30} 391:57]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_0) begin
        blockByTlbMiss_11 <= _GEN_10530;
      end else if (4'hb == enqIdx_1) begin
        blockByTlbMiss_11 <= 1'h0;
      end else begin
        blockByTlbMiss_11 <= _GEN_8346;
      end
    end else begin
      blockByTlbMiss_11 <= _GEN_8346;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByTlbMiss_12 <= 1'h0; // @[LoadQueueReplay.scala 384:{30,30} 391:57]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_0) begin
        blockByTlbMiss_12 <= _GEN_10531;
      end else if (4'hc == enqIdx_1) begin
        blockByTlbMiss_12 <= 1'h0;
      end else begin
        blockByTlbMiss_12 <= _GEN_8347;
      end
    end else begin
      blockByTlbMiss_12 <= _GEN_8347;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByTlbMiss_13 <= 1'h0; // @[LoadQueueReplay.scala 384:{30,30} 391:57]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_0) begin
        blockByTlbMiss_13 <= _GEN_10532;
      end else if (4'hd == enqIdx_1) begin
        blockByTlbMiss_13 <= 1'h0;
      end else begin
        blockByTlbMiss_13 <= _GEN_8348;
      end
    end else begin
      blockByTlbMiss_13 <= _GEN_8348;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByTlbMiss_14 <= 1'h0; // @[LoadQueueReplay.scala 384:{30,30} 391:57]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_0) begin
        blockByTlbMiss_14 <= _GEN_10533;
      end else if (4'he == enqIdx_1) begin
        blockByTlbMiss_14 <= 1'h0;
      end else begin
        blockByTlbMiss_14 <= _GEN_8349;
      end
    end else begin
      blockByTlbMiss_14 <= _GEN_8349;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByTlbMiss_15 <= 1'h0; // @[LoadQueueReplay.scala 384:{30,30} 391:57]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_0) begin
        blockByTlbMiss_15 <= _GEN_10534;
      end else if (4'hf == enqIdx_1) begin
        blockByTlbMiss_15 <= 1'h0;
      end else begin
        blockByTlbMiss_15 <= _GEN_8350;
      end
    end else begin
      blockByTlbMiss_15 <= _GEN_8350;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByForwardFail_0 <= 1'h0; // @[LoadQueueReplay.scala 386:{34,34} 413:61]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_5) begin
        blockByForwardFail_0 <= _GEN_10951;
      end else if (4'h0 == enqIdx_1) begin
        blockByForwardFail_0 <= 1'h0;
      end else begin
        blockByForwardFail_0 <= _GEN_8367;
      end
    end else begin
      blockByForwardFail_0 <= _GEN_8367;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByForwardFail_1 <= 1'h0; // @[LoadQueueReplay.scala 386:{34,34} 413:61]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_5) begin
        blockByForwardFail_1 <= _GEN_10952;
      end else if (4'h1 == enqIdx_1) begin
        blockByForwardFail_1 <= 1'h0;
      end else begin
        blockByForwardFail_1 <= _GEN_8368;
      end
    end else begin
      blockByForwardFail_1 <= _GEN_8368;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByForwardFail_2 <= 1'h0; // @[LoadQueueReplay.scala 386:{34,34} 413:61]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_5) begin
        blockByForwardFail_2 <= _GEN_10953;
      end else if (4'h2 == enqIdx_1) begin
        blockByForwardFail_2 <= 1'h0;
      end else begin
        blockByForwardFail_2 <= _GEN_8369;
      end
    end else begin
      blockByForwardFail_2 <= _GEN_8369;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByForwardFail_3 <= 1'h0; // @[LoadQueueReplay.scala 386:{34,34} 413:61]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_5) begin
        blockByForwardFail_3 <= _GEN_10954;
      end else if (4'h3 == enqIdx_1) begin
        blockByForwardFail_3 <= 1'h0;
      end else begin
        blockByForwardFail_3 <= _GEN_8370;
      end
    end else begin
      blockByForwardFail_3 <= _GEN_8370;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByForwardFail_4 <= 1'h0; // @[LoadQueueReplay.scala 386:{34,34} 413:61]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_5) begin
        blockByForwardFail_4 <= _GEN_10955;
      end else if (4'h4 == enqIdx_1) begin
        blockByForwardFail_4 <= 1'h0;
      end else begin
        blockByForwardFail_4 <= _GEN_8371;
      end
    end else begin
      blockByForwardFail_4 <= _GEN_8371;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByForwardFail_5 <= 1'h0; // @[LoadQueueReplay.scala 386:{34,34} 413:61]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_5) begin
        blockByForwardFail_5 <= _GEN_10956;
      end else if (4'h5 == enqIdx_1) begin
        blockByForwardFail_5 <= 1'h0;
      end else begin
        blockByForwardFail_5 <= _GEN_8372;
      end
    end else begin
      blockByForwardFail_5 <= _GEN_8372;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByForwardFail_6 <= 1'h0; // @[LoadQueueReplay.scala 386:{34,34} 413:61]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_5) begin
        blockByForwardFail_6 <= _GEN_10957;
      end else if (4'h6 == enqIdx_1) begin
        blockByForwardFail_6 <= 1'h0;
      end else begin
        blockByForwardFail_6 <= _GEN_8373;
      end
    end else begin
      blockByForwardFail_6 <= _GEN_8373;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByForwardFail_7 <= 1'h0; // @[LoadQueueReplay.scala 386:{34,34} 413:61]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_5) begin
        blockByForwardFail_7 <= _GEN_10958;
      end else if (4'h7 == enqIdx_1) begin
        blockByForwardFail_7 <= 1'h0;
      end else begin
        blockByForwardFail_7 <= _GEN_8374;
      end
    end else begin
      blockByForwardFail_7 <= _GEN_8374;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByForwardFail_8 <= 1'h0; // @[LoadQueueReplay.scala 386:{34,34} 413:61]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_5) begin
        blockByForwardFail_8 <= _GEN_10959;
      end else if (4'h8 == enqIdx_1) begin
        blockByForwardFail_8 <= 1'h0;
      end else begin
        blockByForwardFail_8 <= _GEN_8375;
      end
    end else begin
      blockByForwardFail_8 <= _GEN_8375;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByForwardFail_9 <= 1'h0; // @[LoadQueueReplay.scala 386:{34,34} 413:61]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_5) begin
        blockByForwardFail_9 <= _GEN_10960;
      end else if (4'h9 == enqIdx_1) begin
        blockByForwardFail_9 <= 1'h0;
      end else begin
        blockByForwardFail_9 <= _GEN_8376;
      end
    end else begin
      blockByForwardFail_9 <= _GEN_8376;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByForwardFail_10 <= 1'h0; // @[LoadQueueReplay.scala 386:{34,34} 413:61]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_5) begin
        blockByForwardFail_10 <= _GEN_10961;
      end else if (4'ha == enqIdx_1) begin
        blockByForwardFail_10 <= 1'h0;
      end else begin
        blockByForwardFail_10 <= _GEN_8377;
      end
    end else begin
      blockByForwardFail_10 <= _GEN_8377;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByForwardFail_11 <= 1'h0; // @[LoadQueueReplay.scala 386:{34,34} 413:61]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_5) begin
        blockByForwardFail_11 <= _GEN_10962;
      end else if (4'hb == enqIdx_1) begin
        blockByForwardFail_11 <= 1'h0;
      end else begin
        blockByForwardFail_11 <= _GEN_8378;
      end
    end else begin
      blockByForwardFail_11 <= _GEN_8378;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByForwardFail_12 <= 1'h0; // @[LoadQueueReplay.scala 386:{34,34} 413:61]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_5) begin
        blockByForwardFail_12 <= _GEN_10963;
      end else if (4'hc == enqIdx_1) begin
        blockByForwardFail_12 <= 1'h0;
      end else begin
        blockByForwardFail_12 <= _GEN_8379;
      end
    end else begin
      blockByForwardFail_12 <= _GEN_8379;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByForwardFail_13 <= 1'h0; // @[LoadQueueReplay.scala 386:{34,34} 413:61]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_5) begin
        blockByForwardFail_13 <= _GEN_10964;
      end else if (4'hd == enqIdx_1) begin
        blockByForwardFail_13 <= 1'h0;
      end else begin
        blockByForwardFail_13 <= _GEN_8380;
      end
    end else begin
      blockByForwardFail_13 <= _GEN_8380;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByForwardFail_14 <= 1'h0; // @[LoadQueueReplay.scala 386:{34,34} 413:61]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_5) begin
        blockByForwardFail_14 <= _GEN_10965;
      end else if (4'he == enqIdx_1) begin
        blockByForwardFail_14 <= 1'h0;
      end else begin
        blockByForwardFail_14 <= _GEN_8381;
      end
    end else begin
      blockByForwardFail_14 <= _GEN_8381;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByForwardFail_15 <= 1'h0; // @[LoadQueueReplay.scala 386:{34,34} 413:61]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_5) begin
        blockByForwardFail_15 <= _GEN_10966;
      end else if (4'hf == enqIdx_1) begin
        blockByForwardFail_15 <= 1'h0;
      end else begin
        blockByForwardFail_15 <= _GEN_8382;
      end
    end else begin
      blockByForwardFail_15 <= _GEN_8382;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByWaitStore_0 <= 1'h0; // @[LoadQueueReplay.scala 385:{32,32} 407:59]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_1) begin
        blockByWaitStore_0 <= _GEN_10855;
      end else if (4'h0 == enqIdx_1) begin
        blockByWaitStore_0 <= 1'h0;
      end else begin
        blockByWaitStore_0 <= _GEN_8351;
      end
    end else begin
      blockByWaitStore_0 <= _GEN_8351;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByWaitStore_1 <= 1'h0; // @[LoadQueueReplay.scala 385:{32,32} 407:59]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_1) begin
        blockByWaitStore_1 <= _GEN_10856;
      end else if (4'h1 == enqIdx_1) begin
        blockByWaitStore_1 <= 1'h0;
      end else begin
        blockByWaitStore_1 <= _GEN_8352;
      end
    end else begin
      blockByWaitStore_1 <= _GEN_8352;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByWaitStore_2 <= 1'h0; // @[LoadQueueReplay.scala 385:{32,32} 407:59]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_1) begin
        blockByWaitStore_2 <= _GEN_10857;
      end else if (4'h2 == enqIdx_1) begin
        blockByWaitStore_2 <= 1'h0;
      end else begin
        blockByWaitStore_2 <= _GEN_8353;
      end
    end else begin
      blockByWaitStore_2 <= _GEN_8353;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByWaitStore_3 <= 1'h0; // @[LoadQueueReplay.scala 385:{32,32} 407:59]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_1) begin
        blockByWaitStore_3 <= _GEN_10858;
      end else if (4'h3 == enqIdx_1) begin
        blockByWaitStore_3 <= 1'h0;
      end else begin
        blockByWaitStore_3 <= _GEN_8354;
      end
    end else begin
      blockByWaitStore_3 <= _GEN_8354;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByWaitStore_4 <= 1'h0; // @[LoadQueueReplay.scala 385:{32,32} 407:59]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_1) begin
        blockByWaitStore_4 <= _GEN_10859;
      end else if (4'h4 == enqIdx_1) begin
        blockByWaitStore_4 <= 1'h0;
      end else begin
        blockByWaitStore_4 <= _GEN_8355;
      end
    end else begin
      blockByWaitStore_4 <= _GEN_8355;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByWaitStore_5 <= 1'h0; // @[LoadQueueReplay.scala 385:{32,32} 407:59]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_1) begin
        blockByWaitStore_5 <= _GEN_10860;
      end else if (4'h5 == enqIdx_1) begin
        blockByWaitStore_5 <= 1'h0;
      end else begin
        blockByWaitStore_5 <= _GEN_8356;
      end
    end else begin
      blockByWaitStore_5 <= _GEN_8356;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByWaitStore_6 <= 1'h0; // @[LoadQueueReplay.scala 385:{32,32} 407:59]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_1) begin
        blockByWaitStore_6 <= _GEN_10861;
      end else if (4'h6 == enqIdx_1) begin
        blockByWaitStore_6 <= 1'h0;
      end else begin
        blockByWaitStore_6 <= _GEN_8357;
      end
    end else begin
      blockByWaitStore_6 <= _GEN_8357;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByWaitStore_7 <= 1'h0; // @[LoadQueueReplay.scala 385:{32,32} 407:59]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_1) begin
        blockByWaitStore_7 <= _GEN_10862;
      end else if (4'h7 == enqIdx_1) begin
        blockByWaitStore_7 <= 1'h0;
      end else begin
        blockByWaitStore_7 <= _GEN_8358;
      end
    end else begin
      blockByWaitStore_7 <= _GEN_8358;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByWaitStore_8 <= 1'h0; // @[LoadQueueReplay.scala 385:{32,32} 407:59]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_1) begin
        blockByWaitStore_8 <= _GEN_10863;
      end else if (4'h8 == enqIdx_1) begin
        blockByWaitStore_8 <= 1'h0;
      end else begin
        blockByWaitStore_8 <= _GEN_8359;
      end
    end else begin
      blockByWaitStore_8 <= _GEN_8359;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByWaitStore_9 <= 1'h0; // @[LoadQueueReplay.scala 385:{32,32} 407:59]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_1) begin
        blockByWaitStore_9 <= _GEN_10864;
      end else if (4'h9 == enqIdx_1) begin
        blockByWaitStore_9 <= 1'h0;
      end else begin
        blockByWaitStore_9 <= _GEN_8360;
      end
    end else begin
      blockByWaitStore_9 <= _GEN_8360;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByWaitStore_10 <= 1'h0; // @[LoadQueueReplay.scala 385:{32,32} 407:59]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_1) begin
        blockByWaitStore_10 <= _GEN_10865;
      end else if (4'ha == enqIdx_1) begin
        blockByWaitStore_10 <= 1'h0;
      end else begin
        blockByWaitStore_10 <= _GEN_8361;
      end
    end else begin
      blockByWaitStore_10 <= _GEN_8361;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByWaitStore_11 <= 1'h0; // @[LoadQueueReplay.scala 385:{32,32} 407:59]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_1) begin
        blockByWaitStore_11 <= _GEN_10866;
      end else if (4'hb == enqIdx_1) begin
        blockByWaitStore_11 <= 1'h0;
      end else begin
        blockByWaitStore_11 <= _GEN_8362;
      end
    end else begin
      blockByWaitStore_11 <= _GEN_8362;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByWaitStore_12 <= 1'h0; // @[LoadQueueReplay.scala 385:{32,32} 407:59]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_1) begin
        blockByWaitStore_12 <= _GEN_10867;
      end else if (4'hc == enqIdx_1) begin
        blockByWaitStore_12 <= 1'h0;
      end else begin
        blockByWaitStore_12 <= _GEN_8363;
      end
    end else begin
      blockByWaitStore_12 <= _GEN_8363;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByWaitStore_13 <= 1'h0; // @[LoadQueueReplay.scala 385:{32,32} 407:59]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_1) begin
        blockByWaitStore_13 <= _GEN_10868;
      end else if (4'hd == enqIdx_1) begin
        blockByWaitStore_13 <= 1'h0;
      end else begin
        blockByWaitStore_13 <= _GEN_8364;
      end
    end else begin
      blockByWaitStore_13 <= _GEN_8364;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByWaitStore_14 <= 1'h0; // @[LoadQueueReplay.scala 385:{32,32} 407:59]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_1) begin
        blockByWaitStore_14 <= _GEN_10869;
      end else if (4'he == enqIdx_1) begin
        blockByWaitStore_14 <= 1'h0;
      end else begin
        blockByWaitStore_14 <= _GEN_8365;
      end
    end else begin
      blockByWaitStore_14 <= _GEN_8365;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByWaitStore_15 <= 1'h0; // @[LoadQueueReplay.scala 385:{32,32} 407:59]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_1) begin
        blockByWaitStore_15 <= _GEN_10870;
      end else if (4'hf == enqIdx_1) begin
        blockByWaitStore_15 <= 1'h0;
      end else begin
        blockByWaitStore_15 <= _GEN_8366;
      end
    end else begin
      blockByWaitStore_15 <= _GEN_8366;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByCacheMiss_0 <= 1'h0; // @[LoadQueueReplay.scala 387:{32,32} 421:{32,32}]
    end else if (canEnqueueVec_1) begin
      if (4'h0 == enqIdx_1) begin
        blockByCacheMiss_0 <= _blockByCacheMiss_T_15;
      end else if (4'h0 == enqIdx_1) begin
        blockByCacheMiss_0 <= 1'h0;
      end else begin
        blockByCacheMiss_0 <= _GEN_8383;
      end
    end else begin
      blockByCacheMiss_0 <= _GEN_8383;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByCacheMiss_1 <= 1'h0; // @[LoadQueueReplay.scala 387:{32,32} 421:{32,32}]
    end else if (canEnqueueVec_1) begin
      if (4'h1 == enqIdx_1) begin
        blockByCacheMiss_1 <= _blockByCacheMiss_T_15;
      end else if (4'h1 == enqIdx_1) begin
        blockByCacheMiss_1 <= 1'h0;
      end else begin
        blockByCacheMiss_1 <= _GEN_8384;
      end
    end else begin
      blockByCacheMiss_1 <= _GEN_8384;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByCacheMiss_2 <= 1'h0; // @[LoadQueueReplay.scala 387:{32,32} 421:{32,32}]
    end else if (canEnqueueVec_1) begin
      if (4'h2 == enqIdx_1) begin
        blockByCacheMiss_2 <= _blockByCacheMiss_T_15;
      end else if (4'h2 == enqIdx_1) begin
        blockByCacheMiss_2 <= 1'h0;
      end else begin
        blockByCacheMiss_2 <= _GEN_8385;
      end
    end else begin
      blockByCacheMiss_2 <= _GEN_8385;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByCacheMiss_3 <= 1'h0; // @[LoadQueueReplay.scala 387:{32,32} 421:{32,32}]
    end else if (canEnqueueVec_1) begin
      if (4'h3 == enqIdx_1) begin
        blockByCacheMiss_3 <= _blockByCacheMiss_T_15;
      end else if (4'h3 == enqIdx_1) begin
        blockByCacheMiss_3 <= 1'h0;
      end else begin
        blockByCacheMiss_3 <= _GEN_8386;
      end
    end else begin
      blockByCacheMiss_3 <= _GEN_8386;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByCacheMiss_4 <= 1'h0; // @[LoadQueueReplay.scala 387:{32,32} 421:{32,32}]
    end else if (canEnqueueVec_1) begin
      if (4'h4 == enqIdx_1) begin
        blockByCacheMiss_4 <= _blockByCacheMiss_T_15;
      end else if (4'h4 == enqIdx_1) begin
        blockByCacheMiss_4 <= 1'h0;
      end else begin
        blockByCacheMiss_4 <= _GEN_8387;
      end
    end else begin
      blockByCacheMiss_4 <= _GEN_8387;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByCacheMiss_5 <= 1'h0; // @[LoadQueueReplay.scala 387:{32,32} 421:{32,32}]
    end else if (canEnqueueVec_1) begin
      if (4'h5 == enqIdx_1) begin
        blockByCacheMiss_5 <= _blockByCacheMiss_T_15;
      end else if (4'h5 == enqIdx_1) begin
        blockByCacheMiss_5 <= 1'h0;
      end else begin
        blockByCacheMiss_5 <= _GEN_8388;
      end
    end else begin
      blockByCacheMiss_5 <= _GEN_8388;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByCacheMiss_6 <= 1'h0; // @[LoadQueueReplay.scala 387:{32,32} 421:{32,32}]
    end else if (canEnqueueVec_1) begin
      if (4'h6 == enqIdx_1) begin
        blockByCacheMiss_6 <= _blockByCacheMiss_T_15;
      end else if (4'h6 == enqIdx_1) begin
        blockByCacheMiss_6 <= 1'h0;
      end else begin
        blockByCacheMiss_6 <= _GEN_8389;
      end
    end else begin
      blockByCacheMiss_6 <= _GEN_8389;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByCacheMiss_7 <= 1'h0; // @[LoadQueueReplay.scala 387:{32,32} 421:{32,32}]
    end else if (canEnqueueVec_1) begin
      if (4'h7 == enqIdx_1) begin
        blockByCacheMiss_7 <= _blockByCacheMiss_T_15;
      end else if (4'h7 == enqIdx_1) begin
        blockByCacheMiss_7 <= 1'h0;
      end else begin
        blockByCacheMiss_7 <= _GEN_8390;
      end
    end else begin
      blockByCacheMiss_7 <= _GEN_8390;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByCacheMiss_8 <= 1'h0; // @[LoadQueueReplay.scala 387:{32,32} 421:{32,32}]
    end else if (canEnqueueVec_1) begin
      if (4'h8 == enqIdx_1) begin
        blockByCacheMiss_8 <= _blockByCacheMiss_T_15;
      end else if (4'h8 == enqIdx_1) begin
        blockByCacheMiss_8 <= 1'h0;
      end else begin
        blockByCacheMiss_8 <= _GEN_8391;
      end
    end else begin
      blockByCacheMiss_8 <= _GEN_8391;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByCacheMiss_9 <= 1'h0; // @[LoadQueueReplay.scala 387:{32,32} 421:{32,32}]
    end else if (canEnqueueVec_1) begin
      if (4'h9 == enqIdx_1) begin
        blockByCacheMiss_9 <= _blockByCacheMiss_T_15;
      end else if (4'h9 == enqIdx_1) begin
        blockByCacheMiss_9 <= 1'h0;
      end else begin
        blockByCacheMiss_9 <= _GEN_8392;
      end
    end else begin
      blockByCacheMiss_9 <= _GEN_8392;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByCacheMiss_10 <= 1'h0; // @[LoadQueueReplay.scala 387:{32,32} 421:{32,32}]
    end else if (canEnqueueVec_1) begin
      if (4'ha == enqIdx_1) begin
        blockByCacheMiss_10 <= _blockByCacheMiss_T_15;
      end else if (4'ha == enqIdx_1) begin
        blockByCacheMiss_10 <= 1'h0;
      end else begin
        blockByCacheMiss_10 <= _GEN_8393;
      end
    end else begin
      blockByCacheMiss_10 <= _GEN_8393;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByCacheMiss_11 <= 1'h0; // @[LoadQueueReplay.scala 387:{32,32} 421:{32,32}]
    end else if (canEnqueueVec_1) begin
      if (4'hb == enqIdx_1) begin
        blockByCacheMiss_11 <= _blockByCacheMiss_T_15;
      end else if (4'hb == enqIdx_1) begin
        blockByCacheMiss_11 <= 1'h0;
      end else begin
        blockByCacheMiss_11 <= _GEN_8394;
      end
    end else begin
      blockByCacheMiss_11 <= _GEN_8394;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByCacheMiss_12 <= 1'h0; // @[LoadQueueReplay.scala 387:{32,32} 421:{32,32}]
    end else if (canEnqueueVec_1) begin
      if (4'hc == enqIdx_1) begin
        blockByCacheMiss_12 <= _blockByCacheMiss_T_15;
      end else if (4'hc == enqIdx_1) begin
        blockByCacheMiss_12 <= 1'h0;
      end else begin
        blockByCacheMiss_12 <= _GEN_8395;
      end
    end else begin
      blockByCacheMiss_12 <= _GEN_8395;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByCacheMiss_13 <= 1'h0; // @[LoadQueueReplay.scala 387:{32,32} 421:{32,32}]
    end else if (canEnqueueVec_1) begin
      if (4'hd == enqIdx_1) begin
        blockByCacheMiss_13 <= _blockByCacheMiss_T_15;
      end else if (4'hd == enqIdx_1) begin
        blockByCacheMiss_13 <= 1'h0;
      end else begin
        blockByCacheMiss_13 <= _GEN_8396;
      end
    end else begin
      blockByCacheMiss_13 <= _GEN_8396;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByCacheMiss_14 <= 1'h0; // @[LoadQueueReplay.scala 387:{32,32} 421:{32,32}]
    end else if (canEnqueueVec_1) begin
      if (4'he == enqIdx_1) begin
        blockByCacheMiss_14 <= _blockByCacheMiss_T_15;
      end else if (4'he == enqIdx_1) begin
        blockByCacheMiss_14 <= 1'h0;
      end else begin
        blockByCacheMiss_14 <= _GEN_8397;
      end
    end else begin
      blockByCacheMiss_14 <= _GEN_8397;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByCacheMiss_15 <= 1'h0; // @[LoadQueueReplay.scala 387:{32,32} 421:{32,32}]
    end else if (canEnqueueVec_1) begin
      if (4'hf == enqIdx_1) begin
        blockByCacheMiss_15 <= _blockByCacheMiss_T_15;
      end else if (4'hf == enqIdx_1) begin
        blockByCacheMiss_15 <= 1'h0;
      end else begin
        blockByCacheMiss_15 <= _GEN_8398;
      end
    end else begin
      blockByCacheMiss_15 <= _GEN_8398;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByOthers_0 <= 1'h0; // @[LoadQueueReplay.scala 391:57 395:67 398:117]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_0) begin
        blockByOthers_0 <= _GEN_10503;
      end else if (io_enq_1_bits_replayInfo_cause_7) begin
        blockByOthers_0 <= _GEN_10503;
      end else if (io_enq_1_bits_replayInfo_cause_6 | io_enq_1_bits_replayInfo_cause_1) begin
        blockByOthers_0 <= _GEN_10599;
      end else begin
        blockByOthers_0 <= _GEN_10663;
      end
    end else begin
      blockByOthers_0 <= _GEN_8399;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByOthers_1 <= 1'h0; // @[LoadQueueReplay.scala 391:57 395:67 398:117]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_0) begin
        blockByOthers_1 <= _GEN_10504;
      end else if (io_enq_1_bits_replayInfo_cause_7) begin
        blockByOthers_1 <= _GEN_10504;
      end else if (io_enq_1_bits_replayInfo_cause_6 | io_enq_1_bits_replayInfo_cause_1) begin
        blockByOthers_1 <= _GEN_10600;
      end else begin
        blockByOthers_1 <= _GEN_10664;
      end
    end else begin
      blockByOthers_1 <= _GEN_8400;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByOthers_2 <= 1'h0; // @[LoadQueueReplay.scala 391:57 395:67 398:117]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_0) begin
        blockByOthers_2 <= _GEN_10505;
      end else if (io_enq_1_bits_replayInfo_cause_7) begin
        blockByOthers_2 <= _GEN_10505;
      end else if (io_enq_1_bits_replayInfo_cause_6 | io_enq_1_bits_replayInfo_cause_1) begin
        blockByOthers_2 <= _GEN_10601;
      end else begin
        blockByOthers_2 <= _GEN_10665;
      end
    end else begin
      blockByOthers_2 <= _GEN_8401;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByOthers_3 <= 1'h0; // @[LoadQueueReplay.scala 391:57 395:67 398:117]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_0) begin
        blockByOthers_3 <= _GEN_10506;
      end else if (io_enq_1_bits_replayInfo_cause_7) begin
        blockByOthers_3 <= _GEN_10506;
      end else if (io_enq_1_bits_replayInfo_cause_6 | io_enq_1_bits_replayInfo_cause_1) begin
        blockByOthers_3 <= _GEN_10602;
      end else begin
        blockByOthers_3 <= _GEN_10666;
      end
    end else begin
      blockByOthers_3 <= _GEN_8402;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByOthers_4 <= 1'h0; // @[LoadQueueReplay.scala 391:57 395:67 398:117]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_0) begin
        blockByOthers_4 <= _GEN_10507;
      end else if (io_enq_1_bits_replayInfo_cause_7) begin
        blockByOthers_4 <= _GEN_10507;
      end else if (io_enq_1_bits_replayInfo_cause_6 | io_enq_1_bits_replayInfo_cause_1) begin
        blockByOthers_4 <= _GEN_10603;
      end else begin
        blockByOthers_4 <= _GEN_10667;
      end
    end else begin
      blockByOthers_4 <= _GEN_8403;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByOthers_5 <= 1'h0; // @[LoadQueueReplay.scala 391:57 395:67 398:117]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_0) begin
        blockByOthers_5 <= _GEN_10508;
      end else if (io_enq_1_bits_replayInfo_cause_7) begin
        blockByOthers_5 <= _GEN_10508;
      end else if (io_enq_1_bits_replayInfo_cause_6 | io_enq_1_bits_replayInfo_cause_1) begin
        blockByOthers_5 <= _GEN_10604;
      end else begin
        blockByOthers_5 <= _GEN_10668;
      end
    end else begin
      blockByOthers_5 <= _GEN_8404;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByOthers_6 <= 1'h0; // @[LoadQueueReplay.scala 391:57 395:67 398:117]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_0) begin
        blockByOthers_6 <= _GEN_10509;
      end else if (io_enq_1_bits_replayInfo_cause_7) begin
        blockByOthers_6 <= _GEN_10509;
      end else if (io_enq_1_bits_replayInfo_cause_6 | io_enq_1_bits_replayInfo_cause_1) begin
        blockByOthers_6 <= _GEN_10605;
      end else begin
        blockByOthers_6 <= _GEN_10669;
      end
    end else begin
      blockByOthers_6 <= _GEN_8405;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByOthers_7 <= 1'h0; // @[LoadQueueReplay.scala 391:57 395:67 398:117]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_0) begin
        blockByOthers_7 <= _GEN_10510;
      end else if (io_enq_1_bits_replayInfo_cause_7) begin
        blockByOthers_7 <= _GEN_10510;
      end else if (io_enq_1_bits_replayInfo_cause_6 | io_enq_1_bits_replayInfo_cause_1) begin
        blockByOthers_7 <= _GEN_10606;
      end else begin
        blockByOthers_7 <= _GEN_10670;
      end
    end else begin
      blockByOthers_7 <= _GEN_8406;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByOthers_8 <= 1'h0; // @[LoadQueueReplay.scala 391:57 395:67 398:117]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_0) begin
        blockByOthers_8 <= _GEN_10511;
      end else if (io_enq_1_bits_replayInfo_cause_7) begin
        blockByOthers_8 <= _GEN_10511;
      end else if (io_enq_1_bits_replayInfo_cause_6 | io_enq_1_bits_replayInfo_cause_1) begin
        blockByOthers_8 <= _GEN_10607;
      end else begin
        blockByOthers_8 <= _GEN_10671;
      end
    end else begin
      blockByOthers_8 <= _GEN_8407;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByOthers_9 <= 1'h0; // @[LoadQueueReplay.scala 391:57 395:67 398:117]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_0) begin
        blockByOthers_9 <= _GEN_10512;
      end else if (io_enq_1_bits_replayInfo_cause_7) begin
        blockByOthers_9 <= _GEN_10512;
      end else if (io_enq_1_bits_replayInfo_cause_6 | io_enq_1_bits_replayInfo_cause_1) begin
        blockByOthers_9 <= _GEN_10608;
      end else begin
        blockByOthers_9 <= _GEN_10672;
      end
    end else begin
      blockByOthers_9 <= _GEN_8408;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByOthers_10 <= 1'h0; // @[LoadQueueReplay.scala 391:57 395:67 398:117]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_0) begin
        blockByOthers_10 <= _GEN_10513;
      end else if (io_enq_1_bits_replayInfo_cause_7) begin
        blockByOthers_10 <= _GEN_10513;
      end else if (io_enq_1_bits_replayInfo_cause_6 | io_enq_1_bits_replayInfo_cause_1) begin
        blockByOthers_10 <= _GEN_10609;
      end else begin
        blockByOthers_10 <= _GEN_10673;
      end
    end else begin
      blockByOthers_10 <= _GEN_8409;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByOthers_11 <= 1'h0; // @[LoadQueueReplay.scala 391:57 395:67 398:117]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_0) begin
        blockByOthers_11 <= _GEN_10514;
      end else if (io_enq_1_bits_replayInfo_cause_7) begin
        blockByOthers_11 <= _GEN_10514;
      end else if (io_enq_1_bits_replayInfo_cause_6 | io_enq_1_bits_replayInfo_cause_1) begin
        blockByOthers_11 <= _GEN_10610;
      end else begin
        blockByOthers_11 <= _GEN_10674;
      end
    end else begin
      blockByOthers_11 <= _GEN_8410;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByOthers_12 <= 1'h0; // @[LoadQueueReplay.scala 391:57 395:67 398:117]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_0) begin
        blockByOthers_12 <= _GEN_10515;
      end else if (io_enq_1_bits_replayInfo_cause_7) begin
        blockByOthers_12 <= _GEN_10515;
      end else if (io_enq_1_bits_replayInfo_cause_6 | io_enq_1_bits_replayInfo_cause_1) begin
        blockByOthers_12 <= _GEN_10611;
      end else begin
        blockByOthers_12 <= _GEN_10675;
      end
    end else begin
      blockByOthers_12 <= _GEN_8411;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByOthers_13 <= 1'h0; // @[LoadQueueReplay.scala 391:57 395:67 398:117]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_0) begin
        blockByOthers_13 <= _GEN_10516;
      end else if (io_enq_1_bits_replayInfo_cause_7) begin
        blockByOthers_13 <= _GEN_10516;
      end else if (io_enq_1_bits_replayInfo_cause_6 | io_enq_1_bits_replayInfo_cause_1) begin
        blockByOthers_13 <= _GEN_10612;
      end else begin
        blockByOthers_13 <= _GEN_10676;
      end
    end else begin
      blockByOthers_13 <= _GEN_8412;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByOthers_14 <= 1'h0; // @[LoadQueueReplay.scala 391:57 395:67 398:117]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_0) begin
        blockByOthers_14 <= _GEN_10517;
      end else if (io_enq_1_bits_replayInfo_cause_7) begin
        blockByOthers_14 <= _GEN_10517;
      end else if (io_enq_1_bits_replayInfo_cause_6 | io_enq_1_bits_replayInfo_cause_1) begin
        blockByOthers_14 <= _GEN_10613;
      end else begin
        blockByOthers_14 <= _GEN_10677;
      end
    end else begin
      blockByOthers_14 <= _GEN_8413;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      blockByOthers_15 <= 1'h0; // @[LoadQueueReplay.scala 391:57 395:67 398:117]
    end else if (canEnqueueVec_1) begin
      if (io_enq_1_bits_replayInfo_cause_0) begin
        blockByOthers_15 <= _GEN_10518;
      end else if (io_enq_1_bits_replayInfo_cause_7) begin
        blockByOthers_15 <= _GEN_10518;
      end else if (io_enq_1_bits_replayInfo_cause_6 | io_enq_1_bits_replayInfo_cause_1) begin
        blockByOthers_15 <= _GEN_10614;
      end else begin
        blockByOthers_15 <= _GEN_10678;
      end
    end else begin
      blockByOthers_15 <= _GEN_8414;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      missMSHRId_0 <= 2'h0; // @[LoadQueueReplay.scala 420:{26,26}]
    end else if (canEnqueueVec_1) begin
      if (4'h0 == enqIdx_1) begin
        missMSHRId_0 <= io_enq_1_bits_replayInfo_missMSHRId;
      end else begin
        missMSHRId_0 <= _GEN_8527;
      end
    end else begin
      missMSHRId_0 <= _GEN_8527;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      missMSHRId_1 <= 2'h0; // @[LoadQueueReplay.scala 420:{26,26}]
    end else if (canEnqueueVec_1) begin
      if (4'h1 == enqIdx_1) begin
        missMSHRId_1 <= io_enq_1_bits_replayInfo_missMSHRId;
      end else begin
        missMSHRId_1 <= _GEN_8528;
      end
    end else begin
      missMSHRId_1 <= _GEN_8528;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      missMSHRId_2 <= 2'h0; // @[LoadQueueReplay.scala 420:{26,26}]
    end else if (canEnqueueVec_1) begin
      if (4'h2 == enqIdx_1) begin
        missMSHRId_2 <= io_enq_1_bits_replayInfo_missMSHRId;
      end else begin
        missMSHRId_2 <= _GEN_8529;
      end
    end else begin
      missMSHRId_2 <= _GEN_8529;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      missMSHRId_3 <= 2'h0; // @[LoadQueueReplay.scala 420:{26,26}]
    end else if (canEnqueueVec_1) begin
      if (4'h3 == enqIdx_1) begin
        missMSHRId_3 <= io_enq_1_bits_replayInfo_missMSHRId;
      end else begin
        missMSHRId_3 <= _GEN_8530;
      end
    end else begin
      missMSHRId_3 <= _GEN_8530;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      missMSHRId_4 <= 2'h0; // @[LoadQueueReplay.scala 420:{26,26}]
    end else if (canEnqueueVec_1) begin
      if (4'h4 == enqIdx_1) begin
        missMSHRId_4 <= io_enq_1_bits_replayInfo_missMSHRId;
      end else begin
        missMSHRId_4 <= _GEN_8531;
      end
    end else begin
      missMSHRId_4 <= _GEN_8531;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      missMSHRId_5 <= 2'h0; // @[LoadQueueReplay.scala 420:{26,26}]
    end else if (canEnqueueVec_1) begin
      if (4'h5 == enqIdx_1) begin
        missMSHRId_5 <= io_enq_1_bits_replayInfo_missMSHRId;
      end else begin
        missMSHRId_5 <= _GEN_8532;
      end
    end else begin
      missMSHRId_5 <= _GEN_8532;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      missMSHRId_6 <= 2'h0; // @[LoadQueueReplay.scala 420:{26,26}]
    end else if (canEnqueueVec_1) begin
      if (4'h6 == enqIdx_1) begin
        missMSHRId_6 <= io_enq_1_bits_replayInfo_missMSHRId;
      end else begin
        missMSHRId_6 <= _GEN_8533;
      end
    end else begin
      missMSHRId_6 <= _GEN_8533;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      missMSHRId_7 <= 2'h0; // @[LoadQueueReplay.scala 420:{26,26}]
    end else if (canEnqueueVec_1) begin
      if (4'h7 == enqIdx_1) begin
        missMSHRId_7 <= io_enq_1_bits_replayInfo_missMSHRId;
      end else begin
        missMSHRId_7 <= _GEN_8534;
      end
    end else begin
      missMSHRId_7 <= _GEN_8534;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      missMSHRId_8 <= 2'h0; // @[LoadQueueReplay.scala 420:{26,26}]
    end else if (canEnqueueVec_1) begin
      if (4'h8 == enqIdx_1) begin
        missMSHRId_8 <= io_enq_1_bits_replayInfo_missMSHRId;
      end else begin
        missMSHRId_8 <= _GEN_8535;
      end
    end else begin
      missMSHRId_8 <= _GEN_8535;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      missMSHRId_9 <= 2'h0; // @[LoadQueueReplay.scala 420:{26,26}]
    end else if (canEnqueueVec_1) begin
      if (4'h9 == enqIdx_1) begin
        missMSHRId_9 <= io_enq_1_bits_replayInfo_missMSHRId;
      end else begin
        missMSHRId_9 <= _GEN_8536;
      end
    end else begin
      missMSHRId_9 <= _GEN_8536;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      missMSHRId_10 <= 2'h0; // @[LoadQueueReplay.scala 420:{26,26}]
    end else if (canEnqueueVec_1) begin
      if (4'ha == enqIdx_1) begin
        missMSHRId_10 <= io_enq_1_bits_replayInfo_missMSHRId;
      end else begin
        missMSHRId_10 <= _GEN_8537;
      end
    end else begin
      missMSHRId_10 <= _GEN_8537;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      missMSHRId_11 <= 2'h0; // @[LoadQueueReplay.scala 420:{26,26}]
    end else if (canEnqueueVec_1) begin
      if (4'hb == enqIdx_1) begin
        missMSHRId_11 <= io_enq_1_bits_replayInfo_missMSHRId;
      end else begin
        missMSHRId_11 <= _GEN_8538;
      end
    end else begin
      missMSHRId_11 <= _GEN_8538;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      missMSHRId_12 <= 2'h0; // @[LoadQueueReplay.scala 420:{26,26}]
    end else if (canEnqueueVec_1) begin
      if (4'hc == enqIdx_1) begin
        missMSHRId_12 <= io_enq_1_bits_replayInfo_missMSHRId;
      end else begin
        missMSHRId_12 <= _GEN_8539;
      end
    end else begin
      missMSHRId_12 <= _GEN_8539;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      missMSHRId_13 <= 2'h0; // @[LoadQueueReplay.scala 420:{26,26}]
    end else if (canEnqueueVec_1) begin
      if (4'hd == enqIdx_1) begin
        missMSHRId_13 <= io_enq_1_bits_replayInfo_missMSHRId;
      end else begin
        missMSHRId_13 <= _GEN_8540;
      end
    end else begin
      missMSHRId_13 <= _GEN_8540;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      missMSHRId_14 <= 2'h0; // @[LoadQueueReplay.scala 420:{26,26}]
    end else if (canEnqueueVec_1) begin
      if (4'he == enqIdx_1) begin
        missMSHRId_14 <= io_enq_1_bits_replayInfo_missMSHRId;
      end else begin
        missMSHRId_14 <= _GEN_8541;
      end
    end else begin
      missMSHRId_14 <= _GEN_8541;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      missMSHRId_15 <= 2'h0; // @[LoadQueueReplay.scala 420:{26,26}]
    end else if (canEnqueueVec_1) begin
      if (4'hf == enqIdx_1) begin
        missMSHRId_15 <= io_enq_1_bits_replayInfo_missMSHRId;
      end else begin
        missMSHRId_15 <= _GEN_8542;
      end
    end else begin
      missMSHRId_15 <= _GEN_8542;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      replayCarryReg_0_real_way_en <= 8'h0; // @[LoadQueueReplay.scala 419:{30,30}]
    end else if (canEnqueueVec_1) begin
      if (4'h0 == enqIdx_1) begin
        replayCarryReg_0_real_way_en <= io_enq_1_bits_replayInfo_replayCarry_real_way_en;
      end else begin
        replayCarryReg_0_real_way_en <= _GEN_8495;
      end
    end else begin
      replayCarryReg_0_real_way_en <= _GEN_8495;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      replayCarryReg_0_valid <= 1'h0; // @[LoadQueueReplay.scala 419:{30,30}]
    end else if (canEnqueueVec_1) begin
      if (4'h0 == enqIdx_1) begin
        replayCarryReg_0_valid <= io_enq_1_bits_replayInfo_replayCarry_valid;
      end else begin
        replayCarryReg_0_valid <= _GEN_8511;
      end
    end else begin
      replayCarryReg_0_valid <= _GEN_8511;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      replayCarryReg_1_real_way_en <= 8'h0; // @[LoadQueueReplay.scala 419:{30,30}]
    end else if (canEnqueueVec_1) begin
      if (4'h1 == enqIdx_1) begin
        replayCarryReg_1_real_way_en <= io_enq_1_bits_replayInfo_replayCarry_real_way_en;
      end else begin
        replayCarryReg_1_real_way_en <= _GEN_8496;
      end
    end else begin
      replayCarryReg_1_real_way_en <= _GEN_8496;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      replayCarryReg_1_valid <= 1'h0; // @[LoadQueueReplay.scala 419:{30,30}]
    end else if (canEnqueueVec_1) begin
      if (4'h1 == enqIdx_1) begin
        replayCarryReg_1_valid <= io_enq_1_bits_replayInfo_replayCarry_valid;
      end else begin
        replayCarryReg_1_valid <= _GEN_8512;
      end
    end else begin
      replayCarryReg_1_valid <= _GEN_8512;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      replayCarryReg_2_real_way_en <= 8'h0; // @[LoadQueueReplay.scala 419:{30,30}]
    end else if (canEnqueueVec_1) begin
      if (4'h2 == enqIdx_1) begin
        replayCarryReg_2_real_way_en <= io_enq_1_bits_replayInfo_replayCarry_real_way_en;
      end else begin
        replayCarryReg_2_real_way_en <= _GEN_8497;
      end
    end else begin
      replayCarryReg_2_real_way_en <= _GEN_8497;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      replayCarryReg_2_valid <= 1'h0; // @[LoadQueueReplay.scala 419:{30,30}]
    end else if (canEnqueueVec_1) begin
      if (4'h2 == enqIdx_1) begin
        replayCarryReg_2_valid <= io_enq_1_bits_replayInfo_replayCarry_valid;
      end else begin
        replayCarryReg_2_valid <= _GEN_8513;
      end
    end else begin
      replayCarryReg_2_valid <= _GEN_8513;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      replayCarryReg_3_real_way_en <= 8'h0; // @[LoadQueueReplay.scala 419:{30,30}]
    end else if (canEnqueueVec_1) begin
      if (4'h3 == enqIdx_1) begin
        replayCarryReg_3_real_way_en <= io_enq_1_bits_replayInfo_replayCarry_real_way_en;
      end else begin
        replayCarryReg_3_real_way_en <= _GEN_8498;
      end
    end else begin
      replayCarryReg_3_real_way_en <= _GEN_8498;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      replayCarryReg_3_valid <= 1'h0; // @[LoadQueueReplay.scala 419:{30,30}]
    end else if (canEnqueueVec_1) begin
      if (4'h3 == enqIdx_1) begin
        replayCarryReg_3_valid <= io_enq_1_bits_replayInfo_replayCarry_valid;
      end else begin
        replayCarryReg_3_valid <= _GEN_8514;
      end
    end else begin
      replayCarryReg_3_valid <= _GEN_8514;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      replayCarryReg_4_real_way_en <= 8'h0; // @[LoadQueueReplay.scala 419:{30,30}]
    end else if (canEnqueueVec_1) begin
      if (4'h4 == enqIdx_1) begin
        replayCarryReg_4_real_way_en <= io_enq_1_bits_replayInfo_replayCarry_real_way_en;
      end else begin
        replayCarryReg_4_real_way_en <= _GEN_8499;
      end
    end else begin
      replayCarryReg_4_real_way_en <= _GEN_8499;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      replayCarryReg_4_valid <= 1'h0; // @[LoadQueueReplay.scala 419:{30,30}]
    end else if (canEnqueueVec_1) begin
      if (4'h4 == enqIdx_1) begin
        replayCarryReg_4_valid <= io_enq_1_bits_replayInfo_replayCarry_valid;
      end else begin
        replayCarryReg_4_valid <= _GEN_8515;
      end
    end else begin
      replayCarryReg_4_valid <= _GEN_8515;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      replayCarryReg_5_real_way_en <= 8'h0; // @[LoadQueueReplay.scala 419:{30,30}]
    end else if (canEnqueueVec_1) begin
      if (4'h5 == enqIdx_1) begin
        replayCarryReg_5_real_way_en <= io_enq_1_bits_replayInfo_replayCarry_real_way_en;
      end else begin
        replayCarryReg_5_real_way_en <= _GEN_8500;
      end
    end else begin
      replayCarryReg_5_real_way_en <= _GEN_8500;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      replayCarryReg_5_valid <= 1'h0; // @[LoadQueueReplay.scala 419:{30,30}]
    end else if (canEnqueueVec_1) begin
      if (4'h5 == enqIdx_1) begin
        replayCarryReg_5_valid <= io_enq_1_bits_replayInfo_replayCarry_valid;
      end else begin
        replayCarryReg_5_valid <= _GEN_8516;
      end
    end else begin
      replayCarryReg_5_valid <= _GEN_8516;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      replayCarryReg_6_real_way_en <= 8'h0; // @[LoadQueueReplay.scala 419:{30,30}]
    end else if (canEnqueueVec_1) begin
      if (4'h6 == enqIdx_1) begin
        replayCarryReg_6_real_way_en <= io_enq_1_bits_replayInfo_replayCarry_real_way_en;
      end else begin
        replayCarryReg_6_real_way_en <= _GEN_8501;
      end
    end else begin
      replayCarryReg_6_real_way_en <= _GEN_8501;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      replayCarryReg_6_valid <= 1'h0; // @[LoadQueueReplay.scala 419:{30,30}]
    end else if (canEnqueueVec_1) begin
      if (4'h6 == enqIdx_1) begin
        replayCarryReg_6_valid <= io_enq_1_bits_replayInfo_replayCarry_valid;
      end else begin
        replayCarryReg_6_valid <= _GEN_8517;
      end
    end else begin
      replayCarryReg_6_valid <= _GEN_8517;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      replayCarryReg_7_real_way_en <= 8'h0; // @[LoadQueueReplay.scala 419:{30,30}]
    end else if (canEnqueueVec_1) begin
      if (4'h7 == enqIdx_1) begin
        replayCarryReg_7_real_way_en <= io_enq_1_bits_replayInfo_replayCarry_real_way_en;
      end else begin
        replayCarryReg_7_real_way_en <= _GEN_8502;
      end
    end else begin
      replayCarryReg_7_real_way_en <= _GEN_8502;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      replayCarryReg_7_valid <= 1'h0; // @[LoadQueueReplay.scala 419:{30,30}]
    end else if (canEnqueueVec_1) begin
      if (4'h7 == enqIdx_1) begin
        replayCarryReg_7_valid <= io_enq_1_bits_replayInfo_replayCarry_valid;
      end else begin
        replayCarryReg_7_valid <= _GEN_8518;
      end
    end else begin
      replayCarryReg_7_valid <= _GEN_8518;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      replayCarryReg_8_real_way_en <= 8'h0; // @[LoadQueueReplay.scala 419:{30,30}]
    end else if (canEnqueueVec_1) begin
      if (4'h8 == enqIdx_1) begin
        replayCarryReg_8_real_way_en <= io_enq_1_bits_replayInfo_replayCarry_real_way_en;
      end else begin
        replayCarryReg_8_real_way_en <= _GEN_8503;
      end
    end else begin
      replayCarryReg_8_real_way_en <= _GEN_8503;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      replayCarryReg_8_valid <= 1'h0; // @[LoadQueueReplay.scala 419:{30,30}]
    end else if (canEnqueueVec_1) begin
      if (4'h8 == enqIdx_1) begin
        replayCarryReg_8_valid <= io_enq_1_bits_replayInfo_replayCarry_valid;
      end else begin
        replayCarryReg_8_valid <= _GEN_8519;
      end
    end else begin
      replayCarryReg_8_valid <= _GEN_8519;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      replayCarryReg_9_real_way_en <= 8'h0; // @[LoadQueueReplay.scala 419:{30,30}]
    end else if (canEnqueueVec_1) begin
      if (4'h9 == enqIdx_1) begin
        replayCarryReg_9_real_way_en <= io_enq_1_bits_replayInfo_replayCarry_real_way_en;
      end else begin
        replayCarryReg_9_real_way_en <= _GEN_8504;
      end
    end else begin
      replayCarryReg_9_real_way_en <= _GEN_8504;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      replayCarryReg_9_valid <= 1'h0; // @[LoadQueueReplay.scala 419:{30,30}]
    end else if (canEnqueueVec_1) begin
      if (4'h9 == enqIdx_1) begin
        replayCarryReg_9_valid <= io_enq_1_bits_replayInfo_replayCarry_valid;
      end else begin
        replayCarryReg_9_valid <= _GEN_8520;
      end
    end else begin
      replayCarryReg_9_valid <= _GEN_8520;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      replayCarryReg_10_real_way_en <= 8'h0; // @[LoadQueueReplay.scala 419:{30,30}]
    end else if (canEnqueueVec_1) begin
      if (4'ha == enqIdx_1) begin
        replayCarryReg_10_real_way_en <= io_enq_1_bits_replayInfo_replayCarry_real_way_en;
      end else begin
        replayCarryReg_10_real_way_en <= _GEN_8505;
      end
    end else begin
      replayCarryReg_10_real_way_en <= _GEN_8505;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      replayCarryReg_10_valid <= 1'h0; // @[LoadQueueReplay.scala 419:{30,30}]
    end else if (canEnqueueVec_1) begin
      if (4'ha == enqIdx_1) begin
        replayCarryReg_10_valid <= io_enq_1_bits_replayInfo_replayCarry_valid;
      end else begin
        replayCarryReg_10_valid <= _GEN_8521;
      end
    end else begin
      replayCarryReg_10_valid <= _GEN_8521;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      replayCarryReg_11_real_way_en <= 8'h0; // @[LoadQueueReplay.scala 419:{30,30}]
    end else if (canEnqueueVec_1) begin
      if (4'hb == enqIdx_1) begin
        replayCarryReg_11_real_way_en <= io_enq_1_bits_replayInfo_replayCarry_real_way_en;
      end else begin
        replayCarryReg_11_real_way_en <= _GEN_8506;
      end
    end else begin
      replayCarryReg_11_real_way_en <= _GEN_8506;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      replayCarryReg_11_valid <= 1'h0; // @[LoadQueueReplay.scala 419:{30,30}]
    end else if (canEnqueueVec_1) begin
      if (4'hb == enqIdx_1) begin
        replayCarryReg_11_valid <= io_enq_1_bits_replayInfo_replayCarry_valid;
      end else begin
        replayCarryReg_11_valid <= _GEN_8522;
      end
    end else begin
      replayCarryReg_11_valid <= _GEN_8522;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      replayCarryReg_12_real_way_en <= 8'h0; // @[LoadQueueReplay.scala 419:{30,30}]
    end else if (canEnqueueVec_1) begin
      if (4'hc == enqIdx_1) begin
        replayCarryReg_12_real_way_en <= io_enq_1_bits_replayInfo_replayCarry_real_way_en;
      end else begin
        replayCarryReg_12_real_way_en <= _GEN_8507;
      end
    end else begin
      replayCarryReg_12_real_way_en <= _GEN_8507;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      replayCarryReg_12_valid <= 1'h0; // @[LoadQueueReplay.scala 419:{30,30}]
    end else if (canEnqueueVec_1) begin
      if (4'hc == enqIdx_1) begin
        replayCarryReg_12_valid <= io_enq_1_bits_replayInfo_replayCarry_valid;
      end else begin
        replayCarryReg_12_valid <= _GEN_8523;
      end
    end else begin
      replayCarryReg_12_valid <= _GEN_8523;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      replayCarryReg_13_real_way_en <= 8'h0; // @[LoadQueueReplay.scala 419:{30,30}]
    end else if (canEnqueueVec_1) begin
      if (4'hd == enqIdx_1) begin
        replayCarryReg_13_real_way_en <= io_enq_1_bits_replayInfo_replayCarry_real_way_en;
      end else begin
        replayCarryReg_13_real_way_en <= _GEN_8508;
      end
    end else begin
      replayCarryReg_13_real_way_en <= _GEN_8508;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      replayCarryReg_13_valid <= 1'h0; // @[LoadQueueReplay.scala 419:{30,30}]
    end else if (canEnqueueVec_1) begin
      if (4'hd == enqIdx_1) begin
        replayCarryReg_13_valid <= io_enq_1_bits_replayInfo_replayCarry_valid;
      end else begin
        replayCarryReg_13_valid <= _GEN_8524;
      end
    end else begin
      replayCarryReg_13_valid <= _GEN_8524;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      replayCarryReg_14_real_way_en <= 8'h0; // @[LoadQueueReplay.scala 419:{30,30}]
    end else if (canEnqueueVec_1) begin
      if (4'he == enqIdx_1) begin
        replayCarryReg_14_real_way_en <= io_enq_1_bits_replayInfo_replayCarry_real_way_en;
      end else begin
        replayCarryReg_14_real_way_en <= _GEN_8509;
      end
    end else begin
      replayCarryReg_14_real_way_en <= _GEN_8509;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      replayCarryReg_14_valid <= 1'h0; // @[LoadQueueReplay.scala 419:{30,30}]
    end else if (canEnqueueVec_1) begin
      if (4'he == enqIdx_1) begin
        replayCarryReg_14_valid <= io_enq_1_bits_replayInfo_replayCarry_valid;
      end else begin
        replayCarryReg_14_valid <= _GEN_8525;
      end
    end else begin
      replayCarryReg_14_valid <= _GEN_8525;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      replayCarryReg_15_real_way_en <= 8'h0; // @[LoadQueueReplay.scala 419:{30,30}]
    end else if (canEnqueueVec_1) begin
      if (4'hf == enqIdx_1) begin
        replayCarryReg_15_real_way_en <= io_enq_1_bits_replayInfo_replayCarry_real_way_en;
      end else begin
        replayCarryReg_15_real_way_en <= _GEN_8510;
      end
    end else begin
      replayCarryReg_15_real_way_en <= _GEN_8510;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 362:29]
      replayCarryReg_15_valid <= 1'h0; // @[LoadQueueReplay.scala 419:{30,30}]
    end else if (canEnqueueVec_1) begin
      if (4'hf == enqIdx_1) begin
        replayCarryReg_15_valid <= io_enq_1_bits_replayInfo_replayCarry_valid;
      end else begin
        replayCarryReg_15_valid <= _GEN_8526;
      end
    end else begin
      replayCarryReg_15_valid <= _GEN_8526;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[PriorityMuxDefault.scala 47:46]
      loadReplaySelV_0_REG <= 1'h0;
    end else begin
      loadReplaySelV_0_REG <= _T_144[0] | f_tail_5;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[PriorityMuxDefault.scala 47:46]
      loadReplaySelV_1_REG <= 1'h0;
    end else begin
      loadReplaySelV_1_REG <= _T_153[0] | f_tail_11;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadQueueReplay.scala 342:58]
      coldCounter <= 3'h0; // @[LoadQueueReplay.scala 343:17]
    end else if (lastReplay & _lastReplay_T_2) begin // @[LoadQueueReplay.scala 344:36]
      coldCounter <= _coldCounter_T_1; // @[LoadQueueReplay.scala 345:17]
    end else if (coldCounter >= 3'h5) begin // @[LoadQueueReplay.scala 347:17]
      coldCounter <= _coldCounter_T_1;
    end else begin
      coldCounter <= 3'h0;
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
  allocated_12 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  allocated_13 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  allocated_14 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  allocated_15 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  uop_0_cf_foldpc = _RAND_16[9:0];
  _RAND_17 = {1{`RANDOM}};
  uop_0_cf_trigger_backendEn_1 = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  uop_0_cf_trigger_backendHit_0 = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  uop_0_cf_trigger_backendHit_1 = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  uop_0_cf_trigger_backendHit_4 = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  uop_0_cf_waitForRobIdx_flag = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  uop_0_cf_waitForRobIdx_value = _RAND_22[4:0];
  _RAND_23 = {1{`RANDOM}};
  uop_0_cf_loadWaitBit = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  uop_0_cf_loadWaitStrict = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  uop_0_cf_ftqPtr_flag = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  uop_0_cf_ftqPtr_value = _RAND_26[2:0];
  _RAND_27 = {1{`RANDOM}};
  uop_0_cf_ftqOffset = _RAND_27[2:0];
  _RAND_28 = {1{`RANDOM}};
  uop_0_ctrl_fuType = _RAND_28[3:0];
  _RAND_29 = {1{`RANDOM}};
  uop_0_ctrl_fuOpType = _RAND_29[6:0];
  _RAND_30 = {1{`RANDOM}};
  uop_0_ctrl_rfWen = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  uop_0_ctrl_fpWen = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  uop_0_pdest = _RAND_32[5:0];
  _RAND_33 = {1{`RANDOM}};
  uop_0_robIdx_flag = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  uop_0_robIdx_value = _RAND_34[4:0];
  _RAND_35 = {1{`RANDOM}};
  uop_0_lqIdx_flag = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  uop_0_lqIdx_value = _RAND_36[3:0];
  _RAND_37 = {1{`RANDOM}};
  uop_0_sqIdx_flag = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  uop_0_sqIdx_value = _RAND_38[3:0];
  _RAND_39 = {1{`RANDOM}};
  uop_1_cf_foldpc = _RAND_39[9:0];
  _RAND_40 = {1{`RANDOM}};
  uop_1_cf_trigger_backendEn_1 = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  uop_1_cf_trigger_backendHit_0 = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  uop_1_cf_trigger_backendHit_1 = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  uop_1_cf_trigger_backendHit_4 = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  uop_1_cf_waitForRobIdx_flag = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  uop_1_cf_waitForRobIdx_value = _RAND_45[4:0];
  _RAND_46 = {1{`RANDOM}};
  uop_1_cf_loadWaitBit = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  uop_1_cf_loadWaitStrict = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  uop_1_cf_ftqPtr_flag = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  uop_1_cf_ftqPtr_value = _RAND_49[2:0];
  _RAND_50 = {1{`RANDOM}};
  uop_1_cf_ftqOffset = _RAND_50[2:0];
  _RAND_51 = {1{`RANDOM}};
  uop_1_ctrl_fuType = _RAND_51[3:0];
  _RAND_52 = {1{`RANDOM}};
  uop_1_ctrl_fuOpType = _RAND_52[6:0];
  _RAND_53 = {1{`RANDOM}};
  uop_1_ctrl_rfWen = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  uop_1_ctrl_fpWen = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  uop_1_pdest = _RAND_55[5:0];
  _RAND_56 = {1{`RANDOM}};
  uop_1_robIdx_flag = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  uop_1_robIdx_value = _RAND_57[4:0];
  _RAND_58 = {1{`RANDOM}};
  uop_1_lqIdx_flag = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  uop_1_lqIdx_value = _RAND_59[3:0];
  _RAND_60 = {1{`RANDOM}};
  uop_1_sqIdx_flag = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  uop_1_sqIdx_value = _RAND_61[3:0];
  _RAND_62 = {1{`RANDOM}};
  uop_2_cf_foldpc = _RAND_62[9:0];
  _RAND_63 = {1{`RANDOM}};
  uop_2_cf_trigger_backendEn_1 = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  uop_2_cf_trigger_backendHit_0 = _RAND_64[0:0];
  _RAND_65 = {1{`RANDOM}};
  uop_2_cf_trigger_backendHit_1 = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  uop_2_cf_trigger_backendHit_4 = _RAND_66[0:0];
  _RAND_67 = {1{`RANDOM}};
  uop_2_cf_waitForRobIdx_flag = _RAND_67[0:0];
  _RAND_68 = {1{`RANDOM}};
  uop_2_cf_waitForRobIdx_value = _RAND_68[4:0];
  _RAND_69 = {1{`RANDOM}};
  uop_2_cf_loadWaitBit = _RAND_69[0:0];
  _RAND_70 = {1{`RANDOM}};
  uop_2_cf_loadWaitStrict = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  uop_2_cf_ftqPtr_flag = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  uop_2_cf_ftqPtr_value = _RAND_72[2:0];
  _RAND_73 = {1{`RANDOM}};
  uop_2_cf_ftqOffset = _RAND_73[2:0];
  _RAND_74 = {1{`RANDOM}};
  uop_2_ctrl_fuType = _RAND_74[3:0];
  _RAND_75 = {1{`RANDOM}};
  uop_2_ctrl_fuOpType = _RAND_75[6:0];
  _RAND_76 = {1{`RANDOM}};
  uop_2_ctrl_rfWen = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  uop_2_ctrl_fpWen = _RAND_77[0:0];
  _RAND_78 = {1{`RANDOM}};
  uop_2_pdest = _RAND_78[5:0];
  _RAND_79 = {1{`RANDOM}};
  uop_2_robIdx_flag = _RAND_79[0:0];
  _RAND_80 = {1{`RANDOM}};
  uop_2_robIdx_value = _RAND_80[4:0];
  _RAND_81 = {1{`RANDOM}};
  uop_2_lqIdx_flag = _RAND_81[0:0];
  _RAND_82 = {1{`RANDOM}};
  uop_2_lqIdx_value = _RAND_82[3:0];
  _RAND_83 = {1{`RANDOM}};
  uop_2_sqIdx_flag = _RAND_83[0:0];
  _RAND_84 = {1{`RANDOM}};
  uop_2_sqIdx_value = _RAND_84[3:0];
  _RAND_85 = {1{`RANDOM}};
  uop_3_cf_foldpc = _RAND_85[9:0];
  _RAND_86 = {1{`RANDOM}};
  uop_3_cf_trigger_backendEn_1 = _RAND_86[0:0];
  _RAND_87 = {1{`RANDOM}};
  uop_3_cf_trigger_backendHit_0 = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  uop_3_cf_trigger_backendHit_1 = _RAND_88[0:0];
  _RAND_89 = {1{`RANDOM}};
  uop_3_cf_trigger_backendHit_4 = _RAND_89[0:0];
  _RAND_90 = {1{`RANDOM}};
  uop_3_cf_waitForRobIdx_flag = _RAND_90[0:0];
  _RAND_91 = {1{`RANDOM}};
  uop_3_cf_waitForRobIdx_value = _RAND_91[4:0];
  _RAND_92 = {1{`RANDOM}};
  uop_3_cf_loadWaitBit = _RAND_92[0:0];
  _RAND_93 = {1{`RANDOM}};
  uop_3_cf_loadWaitStrict = _RAND_93[0:0];
  _RAND_94 = {1{`RANDOM}};
  uop_3_cf_ftqPtr_flag = _RAND_94[0:0];
  _RAND_95 = {1{`RANDOM}};
  uop_3_cf_ftqPtr_value = _RAND_95[2:0];
  _RAND_96 = {1{`RANDOM}};
  uop_3_cf_ftqOffset = _RAND_96[2:0];
  _RAND_97 = {1{`RANDOM}};
  uop_3_ctrl_fuType = _RAND_97[3:0];
  _RAND_98 = {1{`RANDOM}};
  uop_3_ctrl_fuOpType = _RAND_98[6:0];
  _RAND_99 = {1{`RANDOM}};
  uop_3_ctrl_rfWen = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  uop_3_ctrl_fpWen = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  uop_3_pdest = _RAND_101[5:0];
  _RAND_102 = {1{`RANDOM}};
  uop_3_robIdx_flag = _RAND_102[0:0];
  _RAND_103 = {1{`RANDOM}};
  uop_3_robIdx_value = _RAND_103[4:0];
  _RAND_104 = {1{`RANDOM}};
  uop_3_lqIdx_flag = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  uop_3_lqIdx_value = _RAND_105[3:0];
  _RAND_106 = {1{`RANDOM}};
  uop_3_sqIdx_flag = _RAND_106[0:0];
  _RAND_107 = {1{`RANDOM}};
  uop_3_sqIdx_value = _RAND_107[3:0];
  _RAND_108 = {1{`RANDOM}};
  uop_4_cf_foldpc = _RAND_108[9:0];
  _RAND_109 = {1{`RANDOM}};
  uop_4_cf_trigger_backendEn_1 = _RAND_109[0:0];
  _RAND_110 = {1{`RANDOM}};
  uop_4_cf_trigger_backendHit_0 = _RAND_110[0:0];
  _RAND_111 = {1{`RANDOM}};
  uop_4_cf_trigger_backendHit_1 = _RAND_111[0:0];
  _RAND_112 = {1{`RANDOM}};
  uop_4_cf_trigger_backendHit_4 = _RAND_112[0:0];
  _RAND_113 = {1{`RANDOM}};
  uop_4_cf_waitForRobIdx_flag = _RAND_113[0:0];
  _RAND_114 = {1{`RANDOM}};
  uop_4_cf_waitForRobIdx_value = _RAND_114[4:0];
  _RAND_115 = {1{`RANDOM}};
  uop_4_cf_loadWaitBit = _RAND_115[0:0];
  _RAND_116 = {1{`RANDOM}};
  uop_4_cf_loadWaitStrict = _RAND_116[0:0];
  _RAND_117 = {1{`RANDOM}};
  uop_4_cf_ftqPtr_flag = _RAND_117[0:0];
  _RAND_118 = {1{`RANDOM}};
  uop_4_cf_ftqPtr_value = _RAND_118[2:0];
  _RAND_119 = {1{`RANDOM}};
  uop_4_cf_ftqOffset = _RAND_119[2:0];
  _RAND_120 = {1{`RANDOM}};
  uop_4_ctrl_fuType = _RAND_120[3:0];
  _RAND_121 = {1{`RANDOM}};
  uop_4_ctrl_fuOpType = _RAND_121[6:0];
  _RAND_122 = {1{`RANDOM}};
  uop_4_ctrl_rfWen = _RAND_122[0:0];
  _RAND_123 = {1{`RANDOM}};
  uop_4_ctrl_fpWen = _RAND_123[0:0];
  _RAND_124 = {1{`RANDOM}};
  uop_4_pdest = _RAND_124[5:0];
  _RAND_125 = {1{`RANDOM}};
  uop_4_robIdx_flag = _RAND_125[0:0];
  _RAND_126 = {1{`RANDOM}};
  uop_4_robIdx_value = _RAND_126[4:0];
  _RAND_127 = {1{`RANDOM}};
  uop_4_lqIdx_flag = _RAND_127[0:0];
  _RAND_128 = {1{`RANDOM}};
  uop_4_lqIdx_value = _RAND_128[3:0];
  _RAND_129 = {1{`RANDOM}};
  uop_4_sqIdx_flag = _RAND_129[0:0];
  _RAND_130 = {1{`RANDOM}};
  uop_4_sqIdx_value = _RAND_130[3:0];
  _RAND_131 = {1{`RANDOM}};
  uop_5_cf_foldpc = _RAND_131[9:0];
  _RAND_132 = {1{`RANDOM}};
  uop_5_cf_trigger_backendEn_1 = _RAND_132[0:0];
  _RAND_133 = {1{`RANDOM}};
  uop_5_cf_trigger_backendHit_0 = _RAND_133[0:0];
  _RAND_134 = {1{`RANDOM}};
  uop_5_cf_trigger_backendHit_1 = _RAND_134[0:0];
  _RAND_135 = {1{`RANDOM}};
  uop_5_cf_trigger_backendHit_4 = _RAND_135[0:0];
  _RAND_136 = {1{`RANDOM}};
  uop_5_cf_waitForRobIdx_flag = _RAND_136[0:0];
  _RAND_137 = {1{`RANDOM}};
  uop_5_cf_waitForRobIdx_value = _RAND_137[4:0];
  _RAND_138 = {1{`RANDOM}};
  uop_5_cf_loadWaitBit = _RAND_138[0:0];
  _RAND_139 = {1{`RANDOM}};
  uop_5_cf_loadWaitStrict = _RAND_139[0:0];
  _RAND_140 = {1{`RANDOM}};
  uop_5_cf_ftqPtr_flag = _RAND_140[0:0];
  _RAND_141 = {1{`RANDOM}};
  uop_5_cf_ftqPtr_value = _RAND_141[2:0];
  _RAND_142 = {1{`RANDOM}};
  uop_5_cf_ftqOffset = _RAND_142[2:0];
  _RAND_143 = {1{`RANDOM}};
  uop_5_ctrl_fuType = _RAND_143[3:0];
  _RAND_144 = {1{`RANDOM}};
  uop_5_ctrl_fuOpType = _RAND_144[6:0];
  _RAND_145 = {1{`RANDOM}};
  uop_5_ctrl_rfWen = _RAND_145[0:0];
  _RAND_146 = {1{`RANDOM}};
  uop_5_ctrl_fpWen = _RAND_146[0:0];
  _RAND_147 = {1{`RANDOM}};
  uop_5_pdest = _RAND_147[5:0];
  _RAND_148 = {1{`RANDOM}};
  uop_5_robIdx_flag = _RAND_148[0:0];
  _RAND_149 = {1{`RANDOM}};
  uop_5_robIdx_value = _RAND_149[4:0];
  _RAND_150 = {1{`RANDOM}};
  uop_5_lqIdx_flag = _RAND_150[0:0];
  _RAND_151 = {1{`RANDOM}};
  uop_5_lqIdx_value = _RAND_151[3:0];
  _RAND_152 = {1{`RANDOM}};
  uop_5_sqIdx_flag = _RAND_152[0:0];
  _RAND_153 = {1{`RANDOM}};
  uop_5_sqIdx_value = _RAND_153[3:0];
  _RAND_154 = {1{`RANDOM}};
  uop_6_cf_foldpc = _RAND_154[9:0];
  _RAND_155 = {1{`RANDOM}};
  uop_6_cf_trigger_backendEn_1 = _RAND_155[0:0];
  _RAND_156 = {1{`RANDOM}};
  uop_6_cf_trigger_backendHit_0 = _RAND_156[0:0];
  _RAND_157 = {1{`RANDOM}};
  uop_6_cf_trigger_backendHit_1 = _RAND_157[0:0];
  _RAND_158 = {1{`RANDOM}};
  uop_6_cf_trigger_backendHit_4 = _RAND_158[0:0];
  _RAND_159 = {1{`RANDOM}};
  uop_6_cf_waitForRobIdx_flag = _RAND_159[0:0];
  _RAND_160 = {1{`RANDOM}};
  uop_6_cf_waitForRobIdx_value = _RAND_160[4:0];
  _RAND_161 = {1{`RANDOM}};
  uop_6_cf_loadWaitBit = _RAND_161[0:0];
  _RAND_162 = {1{`RANDOM}};
  uop_6_cf_loadWaitStrict = _RAND_162[0:0];
  _RAND_163 = {1{`RANDOM}};
  uop_6_cf_ftqPtr_flag = _RAND_163[0:0];
  _RAND_164 = {1{`RANDOM}};
  uop_6_cf_ftqPtr_value = _RAND_164[2:0];
  _RAND_165 = {1{`RANDOM}};
  uop_6_cf_ftqOffset = _RAND_165[2:0];
  _RAND_166 = {1{`RANDOM}};
  uop_6_ctrl_fuType = _RAND_166[3:0];
  _RAND_167 = {1{`RANDOM}};
  uop_6_ctrl_fuOpType = _RAND_167[6:0];
  _RAND_168 = {1{`RANDOM}};
  uop_6_ctrl_rfWen = _RAND_168[0:0];
  _RAND_169 = {1{`RANDOM}};
  uop_6_ctrl_fpWen = _RAND_169[0:0];
  _RAND_170 = {1{`RANDOM}};
  uop_6_pdest = _RAND_170[5:0];
  _RAND_171 = {1{`RANDOM}};
  uop_6_robIdx_flag = _RAND_171[0:0];
  _RAND_172 = {1{`RANDOM}};
  uop_6_robIdx_value = _RAND_172[4:0];
  _RAND_173 = {1{`RANDOM}};
  uop_6_lqIdx_flag = _RAND_173[0:0];
  _RAND_174 = {1{`RANDOM}};
  uop_6_lqIdx_value = _RAND_174[3:0];
  _RAND_175 = {1{`RANDOM}};
  uop_6_sqIdx_flag = _RAND_175[0:0];
  _RAND_176 = {1{`RANDOM}};
  uop_6_sqIdx_value = _RAND_176[3:0];
  _RAND_177 = {1{`RANDOM}};
  uop_7_cf_foldpc = _RAND_177[9:0];
  _RAND_178 = {1{`RANDOM}};
  uop_7_cf_trigger_backendEn_1 = _RAND_178[0:0];
  _RAND_179 = {1{`RANDOM}};
  uop_7_cf_trigger_backendHit_0 = _RAND_179[0:0];
  _RAND_180 = {1{`RANDOM}};
  uop_7_cf_trigger_backendHit_1 = _RAND_180[0:0];
  _RAND_181 = {1{`RANDOM}};
  uop_7_cf_trigger_backendHit_4 = _RAND_181[0:0];
  _RAND_182 = {1{`RANDOM}};
  uop_7_cf_waitForRobIdx_flag = _RAND_182[0:0];
  _RAND_183 = {1{`RANDOM}};
  uop_7_cf_waitForRobIdx_value = _RAND_183[4:0];
  _RAND_184 = {1{`RANDOM}};
  uop_7_cf_loadWaitBit = _RAND_184[0:0];
  _RAND_185 = {1{`RANDOM}};
  uop_7_cf_loadWaitStrict = _RAND_185[0:0];
  _RAND_186 = {1{`RANDOM}};
  uop_7_cf_ftqPtr_flag = _RAND_186[0:0];
  _RAND_187 = {1{`RANDOM}};
  uop_7_cf_ftqPtr_value = _RAND_187[2:0];
  _RAND_188 = {1{`RANDOM}};
  uop_7_cf_ftqOffset = _RAND_188[2:0];
  _RAND_189 = {1{`RANDOM}};
  uop_7_ctrl_fuType = _RAND_189[3:0];
  _RAND_190 = {1{`RANDOM}};
  uop_7_ctrl_fuOpType = _RAND_190[6:0];
  _RAND_191 = {1{`RANDOM}};
  uop_7_ctrl_rfWen = _RAND_191[0:0];
  _RAND_192 = {1{`RANDOM}};
  uop_7_ctrl_fpWen = _RAND_192[0:0];
  _RAND_193 = {1{`RANDOM}};
  uop_7_pdest = _RAND_193[5:0];
  _RAND_194 = {1{`RANDOM}};
  uop_7_robIdx_flag = _RAND_194[0:0];
  _RAND_195 = {1{`RANDOM}};
  uop_7_robIdx_value = _RAND_195[4:0];
  _RAND_196 = {1{`RANDOM}};
  uop_7_lqIdx_flag = _RAND_196[0:0];
  _RAND_197 = {1{`RANDOM}};
  uop_7_lqIdx_value = _RAND_197[3:0];
  _RAND_198 = {1{`RANDOM}};
  uop_7_sqIdx_flag = _RAND_198[0:0];
  _RAND_199 = {1{`RANDOM}};
  uop_7_sqIdx_value = _RAND_199[3:0];
  _RAND_200 = {1{`RANDOM}};
  uop_8_cf_foldpc = _RAND_200[9:0];
  _RAND_201 = {1{`RANDOM}};
  uop_8_cf_trigger_backendEn_1 = _RAND_201[0:0];
  _RAND_202 = {1{`RANDOM}};
  uop_8_cf_trigger_backendHit_0 = _RAND_202[0:0];
  _RAND_203 = {1{`RANDOM}};
  uop_8_cf_trigger_backendHit_1 = _RAND_203[0:0];
  _RAND_204 = {1{`RANDOM}};
  uop_8_cf_trigger_backendHit_4 = _RAND_204[0:0];
  _RAND_205 = {1{`RANDOM}};
  uop_8_cf_waitForRobIdx_flag = _RAND_205[0:0];
  _RAND_206 = {1{`RANDOM}};
  uop_8_cf_waitForRobIdx_value = _RAND_206[4:0];
  _RAND_207 = {1{`RANDOM}};
  uop_8_cf_loadWaitBit = _RAND_207[0:0];
  _RAND_208 = {1{`RANDOM}};
  uop_8_cf_loadWaitStrict = _RAND_208[0:0];
  _RAND_209 = {1{`RANDOM}};
  uop_8_cf_ftqPtr_flag = _RAND_209[0:0];
  _RAND_210 = {1{`RANDOM}};
  uop_8_cf_ftqPtr_value = _RAND_210[2:0];
  _RAND_211 = {1{`RANDOM}};
  uop_8_cf_ftqOffset = _RAND_211[2:0];
  _RAND_212 = {1{`RANDOM}};
  uop_8_ctrl_fuType = _RAND_212[3:0];
  _RAND_213 = {1{`RANDOM}};
  uop_8_ctrl_fuOpType = _RAND_213[6:0];
  _RAND_214 = {1{`RANDOM}};
  uop_8_ctrl_rfWen = _RAND_214[0:0];
  _RAND_215 = {1{`RANDOM}};
  uop_8_ctrl_fpWen = _RAND_215[0:0];
  _RAND_216 = {1{`RANDOM}};
  uop_8_pdest = _RAND_216[5:0];
  _RAND_217 = {1{`RANDOM}};
  uop_8_robIdx_flag = _RAND_217[0:0];
  _RAND_218 = {1{`RANDOM}};
  uop_8_robIdx_value = _RAND_218[4:0];
  _RAND_219 = {1{`RANDOM}};
  uop_8_lqIdx_flag = _RAND_219[0:0];
  _RAND_220 = {1{`RANDOM}};
  uop_8_lqIdx_value = _RAND_220[3:0];
  _RAND_221 = {1{`RANDOM}};
  uop_8_sqIdx_flag = _RAND_221[0:0];
  _RAND_222 = {1{`RANDOM}};
  uop_8_sqIdx_value = _RAND_222[3:0];
  _RAND_223 = {1{`RANDOM}};
  uop_9_cf_foldpc = _RAND_223[9:0];
  _RAND_224 = {1{`RANDOM}};
  uop_9_cf_trigger_backendEn_1 = _RAND_224[0:0];
  _RAND_225 = {1{`RANDOM}};
  uop_9_cf_trigger_backendHit_0 = _RAND_225[0:0];
  _RAND_226 = {1{`RANDOM}};
  uop_9_cf_trigger_backendHit_1 = _RAND_226[0:0];
  _RAND_227 = {1{`RANDOM}};
  uop_9_cf_trigger_backendHit_4 = _RAND_227[0:0];
  _RAND_228 = {1{`RANDOM}};
  uop_9_cf_waitForRobIdx_flag = _RAND_228[0:0];
  _RAND_229 = {1{`RANDOM}};
  uop_9_cf_waitForRobIdx_value = _RAND_229[4:0];
  _RAND_230 = {1{`RANDOM}};
  uop_9_cf_loadWaitBit = _RAND_230[0:0];
  _RAND_231 = {1{`RANDOM}};
  uop_9_cf_loadWaitStrict = _RAND_231[0:0];
  _RAND_232 = {1{`RANDOM}};
  uop_9_cf_ftqPtr_flag = _RAND_232[0:0];
  _RAND_233 = {1{`RANDOM}};
  uop_9_cf_ftqPtr_value = _RAND_233[2:0];
  _RAND_234 = {1{`RANDOM}};
  uop_9_cf_ftqOffset = _RAND_234[2:0];
  _RAND_235 = {1{`RANDOM}};
  uop_9_ctrl_fuType = _RAND_235[3:0];
  _RAND_236 = {1{`RANDOM}};
  uop_9_ctrl_fuOpType = _RAND_236[6:0];
  _RAND_237 = {1{`RANDOM}};
  uop_9_ctrl_rfWen = _RAND_237[0:0];
  _RAND_238 = {1{`RANDOM}};
  uop_9_ctrl_fpWen = _RAND_238[0:0];
  _RAND_239 = {1{`RANDOM}};
  uop_9_pdest = _RAND_239[5:0];
  _RAND_240 = {1{`RANDOM}};
  uop_9_robIdx_flag = _RAND_240[0:0];
  _RAND_241 = {1{`RANDOM}};
  uop_9_robIdx_value = _RAND_241[4:0];
  _RAND_242 = {1{`RANDOM}};
  uop_9_lqIdx_flag = _RAND_242[0:0];
  _RAND_243 = {1{`RANDOM}};
  uop_9_lqIdx_value = _RAND_243[3:0];
  _RAND_244 = {1{`RANDOM}};
  uop_9_sqIdx_flag = _RAND_244[0:0];
  _RAND_245 = {1{`RANDOM}};
  uop_9_sqIdx_value = _RAND_245[3:0];
  _RAND_246 = {1{`RANDOM}};
  uop_10_cf_foldpc = _RAND_246[9:0];
  _RAND_247 = {1{`RANDOM}};
  uop_10_cf_trigger_backendEn_1 = _RAND_247[0:0];
  _RAND_248 = {1{`RANDOM}};
  uop_10_cf_trigger_backendHit_0 = _RAND_248[0:0];
  _RAND_249 = {1{`RANDOM}};
  uop_10_cf_trigger_backendHit_1 = _RAND_249[0:0];
  _RAND_250 = {1{`RANDOM}};
  uop_10_cf_trigger_backendHit_4 = _RAND_250[0:0];
  _RAND_251 = {1{`RANDOM}};
  uop_10_cf_waitForRobIdx_flag = _RAND_251[0:0];
  _RAND_252 = {1{`RANDOM}};
  uop_10_cf_waitForRobIdx_value = _RAND_252[4:0];
  _RAND_253 = {1{`RANDOM}};
  uop_10_cf_loadWaitBit = _RAND_253[0:0];
  _RAND_254 = {1{`RANDOM}};
  uop_10_cf_loadWaitStrict = _RAND_254[0:0];
  _RAND_255 = {1{`RANDOM}};
  uop_10_cf_ftqPtr_flag = _RAND_255[0:0];
  _RAND_256 = {1{`RANDOM}};
  uop_10_cf_ftqPtr_value = _RAND_256[2:0];
  _RAND_257 = {1{`RANDOM}};
  uop_10_cf_ftqOffset = _RAND_257[2:0];
  _RAND_258 = {1{`RANDOM}};
  uop_10_ctrl_fuType = _RAND_258[3:0];
  _RAND_259 = {1{`RANDOM}};
  uop_10_ctrl_fuOpType = _RAND_259[6:0];
  _RAND_260 = {1{`RANDOM}};
  uop_10_ctrl_rfWen = _RAND_260[0:0];
  _RAND_261 = {1{`RANDOM}};
  uop_10_ctrl_fpWen = _RAND_261[0:0];
  _RAND_262 = {1{`RANDOM}};
  uop_10_pdest = _RAND_262[5:0];
  _RAND_263 = {1{`RANDOM}};
  uop_10_robIdx_flag = _RAND_263[0:0];
  _RAND_264 = {1{`RANDOM}};
  uop_10_robIdx_value = _RAND_264[4:0];
  _RAND_265 = {1{`RANDOM}};
  uop_10_lqIdx_flag = _RAND_265[0:0];
  _RAND_266 = {1{`RANDOM}};
  uop_10_lqIdx_value = _RAND_266[3:0];
  _RAND_267 = {1{`RANDOM}};
  uop_10_sqIdx_flag = _RAND_267[0:0];
  _RAND_268 = {1{`RANDOM}};
  uop_10_sqIdx_value = _RAND_268[3:0];
  _RAND_269 = {1{`RANDOM}};
  uop_11_cf_foldpc = _RAND_269[9:0];
  _RAND_270 = {1{`RANDOM}};
  uop_11_cf_trigger_backendEn_1 = _RAND_270[0:0];
  _RAND_271 = {1{`RANDOM}};
  uop_11_cf_trigger_backendHit_0 = _RAND_271[0:0];
  _RAND_272 = {1{`RANDOM}};
  uop_11_cf_trigger_backendHit_1 = _RAND_272[0:0];
  _RAND_273 = {1{`RANDOM}};
  uop_11_cf_trigger_backendHit_4 = _RAND_273[0:0];
  _RAND_274 = {1{`RANDOM}};
  uop_11_cf_waitForRobIdx_flag = _RAND_274[0:0];
  _RAND_275 = {1{`RANDOM}};
  uop_11_cf_waitForRobIdx_value = _RAND_275[4:0];
  _RAND_276 = {1{`RANDOM}};
  uop_11_cf_loadWaitBit = _RAND_276[0:0];
  _RAND_277 = {1{`RANDOM}};
  uop_11_cf_loadWaitStrict = _RAND_277[0:0];
  _RAND_278 = {1{`RANDOM}};
  uop_11_cf_ftqPtr_flag = _RAND_278[0:0];
  _RAND_279 = {1{`RANDOM}};
  uop_11_cf_ftqPtr_value = _RAND_279[2:0];
  _RAND_280 = {1{`RANDOM}};
  uop_11_cf_ftqOffset = _RAND_280[2:0];
  _RAND_281 = {1{`RANDOM}};
  uop_11_ctrl_fuType = _RAND_281[3:0];
  _RAND_282 = {1{`RANDOM}};
  uop_11_ctrl_fuOpType = _RAND_282[6:0];
  _RAND_283 = {1{`RANDOM}};
  uop_11_ctrl_rfWen = _RAND_283[0:0];
  _RAND_284 = {1{`RANDOM}};
  uop_11_ctrl_fpWen = _RAND_284[0:0];
  _RAND_285 = {1{`RANDOM}};
  uop_11_pdest = _RAND_285[5:0];
  _RAND_286 = {1{`RANDOM}};
  uop_11_robIdx_flag = _RAND_286[0:0];
  _RAND_287 = {1{`RANDOM}};
  uop_11_robIdx_value = _RAND_287[4:0];
  _RAND_288 = {1{`RANDOM}};
  uop_11_lqIdx_flag = _RAND_288[0:0];
  _RAND_289 = {1{`RANDOM}};
  uop_11_lqIdx_value = _RAND_289[3:0];
  _RAND_290 = {1{`RANDOM}};
  uop_11_sqIdx_flag = _RAND_290[0:0];
  _RAND_291 = {1{`RANDOM}};
  uop_11_sqIdx_value = _RAND_291[3:0];
  _RAND_292 = {1{`RANDOM}};
  uop_12_cf_foldpc = _RAND_292[9:0];
  _RAND_293 = {1{`RANDOM}};
  uop_12_cf_trigger_backendEn_1 = _RAND_293[0:0];
  _RAND_294 = {1{`RANDOM}};
  uop_12_cf_trigger_backendHit_0 = _RAND_294[0:0];
  _RAND_295 = {1{`RANDOM}};
  uop_12_cf_trigger_backendHit_1 = _RAND_295[0:0];
  _RAND_296 = {1{`RANDOM}};
  uop_12_cf_trigger_backendHit_4 = _RAND_296[0:0];
  _RAND_297 = {1{`RANDOM}};
  uop_12_cf_waitForRobIdx_flag = _RAND_297[0:0];
  _RAND_298 = {1{`RANDOM}};
  uop_12_cf_waitForRobIdx_value = _RAND_298[4:0];
  _RAND_299 = {1{`RANDOM}};
  uop_12_cf_loadWaitBit = _RAND_299[0:0];
  _RAND_300 = {1{`RANDOM}};
  uop_12_cf_loadWaitStrict = _RAND_300[0:0];
  _RAND_301 = {1{`RANDOM}};
  uop_12_cf_ftqPtr_flag = _RAND_301[0:0];
  _RAND_302 = {1{`RANDOM}};
  uop_12_cf_ftqPtr_value = _RAND_302[2:0];
  _RAND_303 = {1{`RANDOM}};
  uop_12_cf_ftqOffset = _RAND_303[2:0];
  _RAND_304 = {1{`RANDOM}};
  uop_12_ctrl_fuType = _RAND_304[3:0];
  _RAND_305 = {1{`RANDOM}};
  uop_12_ctrl_fuOpType = _RAND_305[6:0];
  _RAND_306 = {1{`RANDOM}};
  uop_12_ctrl_rfWen = _RAND_306[0:0];
  _RAND_307 = {1{`RANDOM}};
  uop_12_ctrl_fpWen = _RAND_307[0:0];
  _RAND_308 = {1{`RANDOM}};
  uop_12_pdest = _RAND_308[5:0];
  _RAND_309 = {1{`RANDOM}};
  uop_12_robIdx_flag = _RAND_309[0:0];
  _RAND_310 = {1{`RANDOM}};
  uop_12_robIdx_value = _RAND_310[4:0];
  _RAND_311 = {1{`RANDOM}};
  uop_12_lqIdx_flag = _RAND_311[0:0];
  _RAND_312 = {1{`RANDOM}};
  uop_12_lqIdx_value = _RAND_312[3:0];
  _RAND_313 = {1{`RANDOM}};
  uop_12_sqIdx_flag = _RAND_313[0:0];
  _RAND_314 = {1{`RANDOM}};
  uop_12_sqIdx_value = _RAND_314[3:0];
  _RAND_315 = {1{`RANDOM}};
  uop_13_cf_foldpc = _RAND_315[9:0];
  _RAND_316 = {1{`RANDOM}};
  uop_13_cf_trigger_backendEn_1 = _RAND_316[0:0];
  _RAND_317 = {1{`RANDOM}};
  uop_13_cf_trigger_backendHit_0 = _RAND_317[0:0];
  _RAND_318 = {1{`RANDOM}};
  uop_13_cf_trigger_backendHit_1 = _RAND_318[0:0];
  _RAND_319 = {1{`RANDOM}};
  uop_13_cf_trigger_backendHit_4 = _RAND_319[0:0];
  _RAND_320 = {1{`RANDOM}};
  uop_13_cf_waitForRobIdx_flag = _RAND_320[0:0];
  _RAND_321 = {1{`RANDOM}};
  uop_13_cf_waitForRobIdx_value = _RAND_321[4:0];
  _RAND_322 = {1{`RANDOM}};
  uop_13_cf_loadWaitBit = _RAND_322[0:0];
  _RAND_323 = {1{`RANDOM}};
  uop_13_cf_loadWaitStrict = _RAND_323[0:0];
  _RAND_324 = {1{`RANDOM}};
  uop_13_cf_ftqPtr_flag = _RAND_324[0:0];
  _RAND_325 = {1{`RANDOM}};
  uop_13_cf_ftqPtr_value = _RAND_325[2:0];
  _RAND_326 = {1{`RANDOM}};
  uop_13_cf_ftqOffset = _RAND_326[2:0];
  _RAND_327 = {1{`RANDOM}};
  uop_13_ctrl_fuType = _RAND_327[3:0];
  _RAND_328 = {1{`RANDOM}};
  uop_13_ctrl_fuOpType = _RAND_328[6:0];
  _RAND_329 = {1{`RANDOM}};
  uop_13_ctrl_rfWen = _RAND_329[0:0];
  _RAND_330 = {1{`RANDOM}};
  uop_13_ctrl_fpWen = _RAND_330[0:0];
  _RAND_331 = {1{`RANDOM}};
  uop_13_pdest = _RAND_331[5:0];
  _RAND_332 = {1{`RANDOM}};
  uop_13_robIdx_flag = _RAND_332[0:0];
  _RAND_333 = {1{`RANDOM}};
  uop_13_robIdx_value = _RAND_333[4:0];
  _RAND_334 = {1{`RANDOM}};
  uop_13_lqIdx_flag = _RAND_334[0:0];
  _RAND_335 = {1{`RANDOM}};
  uop_13_lqIdx_value = _RAND_335[3:0];
  _RAND_336 = {1{`RANDOM}};
  uop_13_sqIdx_flag = _RAND_336[0:0];
  _RAND_337 = {1{`RANDOM}};
  uop_13_sqIdx_value = _RAND_337[3:0];
  _RAND_338 = {1{`RANDOM}};
  uop_14_cf_foldpc = _RAND_338[9:0];
  _RAND_339 = {1{`RANDOM}};
  uop_14_cf_trigger_backendEn_1 = _RAND_339[0:0];
  _RAND_340 = {1{`RANDOM}};
  uop_14_cf_trigger_backendHit_0 = _RAND_340[0:0];
  _RAND_341 = {1{`RANDOM}};
  uop_14_cf_trigger_backendHit_1 = _RAND_341[0:0];
  _RAND_342 = {1{`RANDOM}};
  uop_14_cf_trigger_backendHit_4 = _RAND_342[0:0];
  _RAND_343 = {1{`RANDOM}};
  uop_14_cf_waitForRobIdx_flag = _RAND_343[0:0];
  _RAND_344 = {1{`RANDOM}};
  uop_14_cf_waitForRobIdx_value = _RAND_344[4:0];
  _RAND_345 = {1{`RANDOM}};
  uop_14_cf_loadWaitBit = _RAND_345[0:0];
  _RAND_346 = {1{`RANDOM}};
  uop_14_cf_loadWaitStrict = _RAND_346[0:0];
  _RAND_347 = {1{`RANDOM}};
  uop_14_cf_ftqPtr_flag = _RAND_347[0:0];
  _RAND_348 = {1{`RANDOM}};
  uop_14_cf_ftqPtr_value = _RAND_348[2:0];
  _RAND_349 = {1{`RANDOM}};
  uop_14_cf_ftqOffset = _RAND_349[2:0];
  _RAND_350 = {1{`RANDOM}};
  uop_14_ctrl_fuType = _RAND_350[3:0];
  _RAND_351 = {1{`RANDOM}};
  uop_14_ctrl_fuOpType = _RAND_351[6:0];
  _RAND_352 = {1{`RANDOM}};
  uop_14_ctrl_rfWen = _RAND_352[0:0];
  _RAND_353 = {1{`RANDOM}};
  uop_14_ctrl_fpWen = _RAND_353[0:0];
  _RAND_354 = {1{`RANDOM}};
  uop_14_pdest = _RAND_354[5:0];
  _RAND_355 = {1{`RANDOM}};
  uop_14_robIdx_flag = _RAND_355[0:0];
  _RAND_356 = {1{`RANDOM}};
  uop_14_robIdx_value = _RAND_356[4:0];
  _RAND_357 = {1{`RANDOM}};
  uop_14_lqIdx_flag = _RAND_357[0:0];
  _RAND_358 = {1{`RANDOM}};
  uop_14_lqIdx_value = _RAND_358[3:0];
  _RAND_359 = {1{`RANDOM}};
  uop_14_sqIdx_flag = _RAND_359[0:0];
  _RAND_360 = {1{`RANDOM}};
  uop_14_sqIdx_value = _RAND_360[3:0];
  _RAND_361 = {1{`RANDOM}};
  uop_15_cf_foldpc = _RAND_361[9:0];
  _RAND_362 = {1{`RANDOM}};
  uop_15_cf_trigger_backendEn_1 = _RAND_362[0:0];
  _RAND_363 = {1{`RANDOM}};
  uop_15_cf_trigger_backendHit_0 = _RAND_363[0:0];
  _RAND_364 = {1{`RANDOM}};
  uop_15_cf_trigger_backendHit_1 = _RAND_364[0:0];
  _RAND_365 = {1{`RANDOM}};
  uop_15_cf_trigger_backendHit_4 = _RAND_365[0:0];
  _RAND_366 = {1{`RANDOM}};
  uop_15_cf_waitForRobIdx_flag = _RAND_366[0:0];
  _RAND_367 = {1{`RANDOM}};
  uop_15_cf_waitForRobIdx_value = _RAND_367[4:0];
  _RAND_368 = {1{`RANDOM}};
  uop_15_cf_loadWaitBit = _RAND_368[0:0];
  _RAND_369 = {1{`RANDOM}};
  uop_15_cf_loadWaitStrict = _RAND_369[0:0];
  _RAND_370 = {1{`RANDOM}};
  uop_15_cf_ftqPtr_flag = _RAND_370[0:0];
  _RAND_371 = {1{`RANDOM}};
  uop_15_cf_ftqPtr_value = _RAND_371[2:0];
  _RAND_372 = {1{`RANDOM}};
  uop_15_cf_ftqOffset = _RAND_372[2:0];
  _RAND_373 = {1{`RANDOM}};
  uop_15_ctrl_fuType = _RAND_373[3:0];
  _RAND_374 = {1{`RANDOM}};
  uop_15_ctrl_fuOpType = _RAND_374[6:0];
  _RAND_375 = {1{`RANDOM}};
  uop_15_ctrl_rfWen = _RAND_375[0:0];
  _RAND_376 = {1{`RANDOM}};
  uop_15_ctrl_fpWen = _RAND_376[0:0];
  _RAND_377 = {1{`RANDOM}};
  uop_15_pdest = _RAND_377[5:0];
  _RAND_378 = {1{`RANDOM}};
  uop_15_robIdx_flag = _RAND_378[0:0];
  _RAND_379 = {1{`RANDOM}};
  uop_15_robIdx_value = _RAND_379[4:0];
  _RAND_380 = {1{`RANDOM}};
  uop_15_lqIdx_flag = _RAND_380[0:0];
  _RAND_381 = {1{`RANDOM}};
  uop_15_lqIdx_value = _RAND_381[3:0];
  _RAND_382 = {1{`RANDOM}};
  uop_15_sqIdx_flag = _RAND_382[0:0];
  _RAND_383 = {1{`RANDOM}};
  uop_15_sqIdx_value = _RAND_383[3:0];
  _RAND_384 = {1{`RANDOM}};
  cause_0 = _RAND_384[7:0];
  _RAND_385 = {1{`RANDOM}};
  cause_1 = _RAND_385[7:0];
  _RAND_386 = {1{`RANDOM}};
  cause_2 = _RAND_386[7:0];
  _RAND_387 = {1{`RANDOM}};
  cause_3 = _RAND_387[7:0];
  _RAND_388 = {1{`RANDOM}};
  cause_4 = _RAND_388[7:0];
  _RAND_389 = {1{`RANDOM}};
  cause_5 = _RAND_389[7:0];
  _RAND_390 = {1{`RANDOM}};
  cause_6 = _RAND_390[7:0];
  _RAND_391 = {1{`RANDOM}};
  cause_7 = _RAND_391[7:0];
  _RAND_392 = {1{`RANDOM}};
  cause_8 = _RAND_392[7:0];
  _RAND_393 = {1{`RANDOM}};
  cause_9 = _RAND_393[7:0];
  _RAND_394 = {1{`RANDOM}};
  cause_10 = _RAND_394[7:0];
  _RAND_395 = {1{`RANDOM}};
  cause_11 = _RAND_395[7:0];
  _RAND_396 = {1{`RANDOM}};
  cause_12 = _RAND_396[7:0];
  _RAND_397 = {1{`RANDOM}};
  cause_13 = _RAND_397[7:0];
  _RAND_398 = {1{`RANDOM}};
  cause_14 = _RAND_398[7:0];
  _RAND_399 = {1{`RANDOM}};
  cause_15 = _RAND_399[7:0];
  _RAND_400 = {1{`RANDOM}};
  flags_0_rarAllocated = _RAND_400[0:0];
  _RAND_401 = {1{`RANDOM}};
  flags_0_rarIndex = _RAND_401[3:0];
  _RAND_402 = {1{`RANDOM}};
  flags_0_rawAllocated = _RAND_402[0:0];
  _RAND_403 = {1{`RANDOM}};
  flags_0_rawIndex = _RAND_403[2:0];
  _RAND_404 = {1{`RANDOM}};
  flags_1_rarAllocated = _RAND_404[0:0];
  _RAND_405 = {1{`RANDOM}};
  flags_1_rarIndex = _RAND_405[3:0];
  _RAND_406 = {1{`RANDOM}};
  flags_1_rawAllocated = _RAND_406[0:0];
  _RAND_407 = {1{`RANDOM}};
  flags_1_rawIndex = _RAND_407[2:0];
  _RAND_408 = {1{`RANDOM}};
  flags_2_rarAllocated = _RAND_408[0:0];
  _RAND_409 = {1{`RANDOM}};
  flags_2_rarIndex = _RAND_409[3:0];
  _RAND_410 = {1{`RANDOM}};
  flags_2_rawAllocated = _RAND_410[0:0];
  _RAND_411 = {1{`RANDOM}};
  flags_2_rawIndex = _RAND_411[2:0];
  _RAND_412 = {1{`RANDOM}};
  flags_3_rarAllocated = _RAND_412[0:0];
  _RAND_413 = {1{`RANDOM}};
  flags_3_rarIndex = _RAND_413[3:0];
  _RAND_414 = {1{`RANDOM}};
  flags_3_rawAllocated = _RAND_414[0:0];
  _RAND_415 = {1{`RANDOM}};
  flags_3_rawIndex = _RAND_415[2:0];
  _RAND_416 = {1{`RANDOM}};
  flags_4_rarAllocated = _RAND_416[0:0];
  _RAND_417 = {1{`RANDOM}};
  flags_4_rarIndex = _RAND_417[3:0];
  _RAND_418 = {1{`RANDOM}};
  flags_4_rawAllocated = _RAND_418[0:0];
  _RAND_419 = {1{`RANDOM}};
  flags_4_rawIndex = _RAND_419[2:0];
  _RAND_420 = {1{`RANDOM}};
  flags_5_rarAllocated = _RAND_420[0:0];
  _RAND_421 = {1{`RANDOM}};
  flags_5_rarIndex = _RAND_421[3:0];
  _RAND_422 = {1{`RANDOM}};
  flags_5_rawAllocated = _RAND_422[0:0];
  _RAND_423 = {1{`RANDOM}};
  flags_5_rawIndex = _RAND_423[2:0];
  _RAND_424 = {1{`RANDOM}};
  flags_6_rarAllocated = _RAND_424[0:0];
  _RAND_425 = {1{`RANDOM}};
  flags_6_rarIndex = _RAND_425[3:0];
  _RAND_426 = {1{`RANDOM}};
  flags_6_rawAllocated = _RAND_426[0:0];
  _RAND_427 = {1{`RANDOM}};
  flags_6_rawIndex = _RAND_427[2:0];
  _RAND_428 = {1{`RANDOM}};
  flags_7_rarAllocated = _RAND_428[0:0];
  _RAND_429 = {1{`RANDOM}};
  flags_7_rarIndex = _RAND_429[3:0];
  _RAND_430 = {1{`RANDOM}};
  flags_7_rawAllocated = _RAND_430[0:0];
  _RAND_431 = {1{`RANDOM}};
  flags_7_rawIndex = _RAND_431[2:0];
  _RAND_432 = {1{`RANDOM}};
  flags_8_rarAllocated = _RAND_432[0:0];
  _RAND_433 = {1{`RANDOM}};
  flags_8_rarIndex = _RAND_433[3:0];
  _RAND_434 = {1{`RANDOM}};
  flags_8_rawAllocated = _RAND_434[0:0];
  _RAND_435 = {1{`RANDOM}};
  flags_8_rawIndex = _RAND_435[2:0];
  _RAND_436 = {1{`RANDOM}};
  flags_9_rarAllocated = _RAND_436[0:0];
  _RAND_437 = {1{`RANDOM}};
  flags_9_rarIndex = _RAND_437[3:0];
  _RAND_438 = {1{`RANDOM}};
  flags_9_rawAllocated = _RAND_438[0:0];
  _RAND_439 = {1{`RANDOM}};
  flags_9_rawIndex = _RAND_439[2:0];
  _RAND_440 = {1{`RANDOM}};
  flags_10_rarAllocated = _RAND_440[0:0];
  _RAND_441 = {1{`RANDOM}};
  flags_10_rarIndex = _RAND_441[3:0];
  _RAND_442 = {1{`RANDOM}};
  flags_10_rawAllocated = _RAND_442[0:0];
  _RAND_443 = {1{`RANDOM}};
  flags_10_rawIndex = _RAND_443[2:0];
  _RAND_444 = {1{`RANDOM}};
  flags_11_rarAllocated = _RAND_444[0:0];
  _RAND_445 = {1{`RANDOM}};
  flags_11_rarIndex = _RAND_445[3:0];
  _RAND_446 = {1{`RANDOM}};
  flags_11_rawAllocated = _RAND_446[0:0];
  _RAND_447 = {1{`RANDOM}};
  flags_11_rawIndex = _RAND_447[2:0];
  _RAND_448 = {1{`RANDOM}};
  flags_12_rarAllocated = _RAND_448[0:0];
  _RAND_449 = {1{`RANDOM}};
  flags_12_rarIndex = _RAND_449[3:0];
  _RAND_450 = {1{`RANDOM}};
  flags_12_rawAllocated = _RAND_450[0:0];
  _RAND_451 = {1{`RANDOM}};
  flags_12_rawIndex = _RAND_451[2:0];
  _RAND_452 = {1{`RANDOM}};
  flags_13_rarAllocated = _RAND_452[0:0];
  _RAND_453 = {1{`RANDOM}};
  flags_13_rarIndex = _RAND_453[3:0];
  _RAND_454 = {1{`RANDOM}};
  flags_13_rawAllocated = _RAND_454[0:0];
  _RAND_455 = {1{`RANDOM}};
  flags_13_rawIndex = _RAND_455[2:0];
  _RAND_456 = {1{`RANDOM}};
  flags_14_rarAllocated = _RAND_456[0:0];
  _RAND_457 = {1{`RANDOM}};
  flags_14_rarIndex = _RAND_457[3:0];
  _RAND_458 = {1{`RANDOM}};
  flags_14_rawAllocated = _RAND_458[0:0];
  _RAND_459 = {1{`RANDOM}};
  flags_14_rawIndex = _RAND_459[2:0];
  _RAND_460 = {1{`RANDOM}};
  flags_15_rarAllocated = _RAND_460[0:0];
  _RAND_461 = {1{`RANDOM}};
  flags_15_rarIndex = _RAND_461[3:0];
  _RAND_462 = {1{`RANDOM}};
  flags_15_rawAllocated = _RAND_462[0:0];
  _RAND_463 = {1{`RANDOM}};
  flags_15_rawIndex = _RAND_463[2:0];
  _RAND_464 = {1{`RANDOM}};
  blockPtrOthers_0 = _RAND_464[1:0];
  _RAND_465 = {1{`RANDOM}};
  blockPtrOthers_1 = _RAND_465[1:0];
  _RAND_466 = {1{`RANDOM}};
  blockPtrOthers_2 = _RAND_466[1:0];
  _RAND_467 = {1{`RANDOM}};
  blockPtrOthers_3 = _RAND_467[1:0];
  _RAND_468 = {1{`RANDOM}};
  blockPtrOthers_4 = _RAND_468[1:0];
  _RAND_469 = {1{`RANDOM}};
  blockPtrOthers_5 = _RAND_469[1:0];
  _RAND_470 = {1{`RANDOM}};
  blockPtrOthers_6 = _RAND_470[1:0];
  _RAND_471 = {1{`RANDOM}};
  blockPtrOthers_7 = _RAND_471[1:0];
  _RAND_472 = {1{`RANDOM}};
  blockPtrOthers_8 = _RAND_472[1:0];
  _RAND_473 = {1{`RANDOM}};
  blockPtrOthers_9 = _RAND_473[1:0];
  _RAND_474 = {1{`RANDOM}};
  blockPtrOthers_10 = _RAND_474[1:0];
  _RAND_475 = {1{`RANDOM}};
  blockPtrOthers_11 = _RAND_475[1:0];
  _RAND_476 = {1{`RANDOM}};
  blockPtrOthers_12 = _RAND_476[1:0];
  _RAND_477 = {1{`RANDOM}};
  blockPtrOthers_13 = _RAND_477[1:0];
  _RAND_478 = {1{`RANDOM}};
  blockPtrOthers_14 = _RAND_478[1:0];
  _RAND_479 = {1{`RANDOM}};
  blockPtrOthers_15 = _RAND_479[1:0];
  _RAND_480 = {1{`RANDOM}};
  blockCyclesTlb_0 = _RAND_480[5:0];
  _RAND_481 = {1{`RANDOM}};
  blockCyclesTlb_1 = _RAND_481[5:0];
  _RAND_482 = {1{`RANDOM}};
  blockCyclesTlb_2 = _RAND_482[5:0];
  _RAND_483 = {1{`RANDOM}};
  blockCyclesTlb_3 = _RAND_483[5:0];
  _RAND_484 = {1{`RANDOM}};
  blockCounter_0 = _RAND_484[4:0];
  _RAND_485 = {1{`RANDOM}};
  blockCounter_1 = _RAND_485[4:0];
  _RAND_486 = {1{`RANDOM}};
  blockCounter_2 = _RAND_486[4:0];
  _RAND_487 = {1{`RANDOM}};
  blockCounter_3 = _RAND_487[4:0];
  _RAND_488 = {1{`RANDOM}};
  blockCounter_4 = _RAND_488[4:0];
  _RAND_489 = {1{`RANDOM}};
  blockCounter_5 = _RAND_489[4:0];
  _RAND_490 = {1{`RANDOM}};
  blockCounter_6 = _RAND_490[4:0];
  _RAND_491 = {1{`RANDOM}};
  blockCounter_7 = _RAND_491[4:0];
  _RAND_492 = {1{`RANDOM}};
  blockCounter_8 = _RAND_492[4:0];
  _RAND_493 = {1{`RANDOM}};
  blockCounter_9 = _RAND_493[4:0];
  _RAND_494 = {1{`RANDOM}};
  blockCounter_10 = _RAND_494[4:0];
  _RAND_495 = {1{`RANDOM}};
  blockCounter_11 = _RAND_495[4:0];
  _RAND_496 = {1{`RANDOM}};
  blockCounter_12 = _RAND_496[4:0];
  _RAND_497 = {1{`RANDOM}};
  blockCounter_13 = _RAND_497[4:0];
  _RAND_498 = {1{`RANDOM}};
  blockCounter_14 = _RAND_498[4:0];
  _RAND_499 = {1{`RANDOM}};
  blockCounter_15 = _RAND_499[4:0];
  _RAND_500 = {1{`RANDOM}};
  selBlocked_0 = _RAND_500[0:0];
  _RAND_501 = {1{`RANDOM}};
  selBlocked_1 = _RAND_501[0:0];
  _RAND_502 = {1{`RANDOM}};
  selBlocked_2 = _RAND_502[0:0];
  _RAND_503 = {1{`RANDOM}};
  selBlocked_3 = _RAND_503[0:0];
  _RAND_504 = {1{`RANDOM}};
  selBlocked_4 = _RAND_504[0:0];
  _RAND_505 = {1{`RANDOM}};
  selBlocked_5 = _RAND_505[0:0];
  _RAND_506 = {1{`RANDOM}};
  selBlocked_6 = _RAND_506[0:0];
  _RAND_507 = {1{`RANDOM}};
  selBlocked_7 = _RAND_507[0:0];
  _RAND_508 = {1{`RANDOM}};
  selBlocked_8 = _RAND_508[0:0];
  _RAND_509 = {1{`RANDOM}};
  selBlocked_9 = _RAND_509[0:0];
  _RAND_510 = {1{`RANDOM}};
  selBlocked_10 = _RAND_510[0:0];
  _RAND_511 = {1{`RANDOM}};
  selBlocked_11 = _RAND_511[0:0];
  _RAND_512 = {1{`RANDOM}};
  selBlocked_12 = _RAND_512[0:0];
  _RAND_513 = {1{`RANDOM}};
  selBlocked_13 = _RAND_513[0:0];
  _RAND_514 = {1{`RANDOM}};
  selBlocked_14 = _RAND_514[0:0];
  _RAND_515 = {1{`RANDOM}};
  selBlocked_15 = _RAND_515[0:0];
  _RAND_516 = {1{`RANDOM}};
  blockSqIdx_0_flag = _RAND_516[0:0];
  _RAND_517 = {1{`RANDOM}};
  blockSqIdx_0_value = _RAND_517[3:0];
  _RAND_518 = {1{`RANDOM}};
  blockSqIdx_1_flag = _RAND_518[0:0];
  _RAND_519 = {1{`RANDOM}};
  blockSqIdx_1_value = _RAND_519[3:0];
  _RAND_520 = {1{`RANDOM}};
  blockSqIdx_2_flag = _RAND_520[0:0];
  _RAND_521 = {1{`RANDOM}};
  blockSqIdx_2_value = _RAND_521[3:0];
  _RAND_522 = {1{`RANDOM}};
  blockSqIdx_3_flag = _RAND_522[0:0];
  _RAND_523 = {1{`RANDOM}};
  blockSqIdx_3_value = _RAND_523[3:0];
  _RAND_524 = {1{`RANDOM}};
  blockSqIdx_4_flag = _RAND_524[0:0];
  _RAND_525 = {1{`RANDOM}};
  blockSqIdx_4_value = _RAND_525[3:0];
  _RAND_526 = {1{`RANDOM}};
  blockSqIdx_5_flag = _RAND_526[0:0];
  _RAND_527 = {1{`RANDOM}};
  blockSqIdx_5_value = _RAND_527[3:0];
  _RAND_528 = {1{`RANDOM}};
  blockSqIdx_6_flag = _RAND_528[0:0];
  _RAND_529 = {1{`RANDOM}};
  blockSqIdx_6_value = _RAND_529[3:0];
  _RAND_530 = {1{`RANDOM}};
  blockSqIdx_7_flag = _RAND_530[0:0];
  _RAND_531 = {1{`RANDOM}};
  blockSqIdx_7_value = _RAND_531[3:0];
  _RAND_532 = {1{`RANDOM}};
  blockSqIdx_8_flag = _RAND_532[0:0];
  _RAND_533 = {1{`RANDOM}};
  blockSqIdx_8_value = _RAND_533[3:0];
  _RAND_534 = {1{`RANDOM}};
  blockSqIdx_9_flag = _RAND_534[0:0];
  _RAND_535 = {1{`RANDOM}};
  blockSqIdx_9_value = _RAND_535[3:0];
  _RAND_536 = {1{`RANDOM}};
  blockSqIdx_10_flag = _RAND_536[0:0];
  _RAND_537 = {1{`RANDOM}};
  blockSqIdx_10_value = _RAND_537[3:0];
  _RAND_538 = {1{`RANDOM}};
  blockSqIdx_11_flag = _RAND_538[0:0];
  _RAND_539 = {1{`RANDOM}};
  blockSqIdx_11_value = _RAND_539[3:0];
  _RAND_540 = {1{`RANDOM}};
  blockSqIdx_12_flag = _RAND_540[0:0];
  _RAND_541 = {1{`RANDOM}};
  blockSqIdx_12_value = _RAND_541[3:0];
  _RAND_542 = {1{`RANDOM}};
  blockSqIdx_13_flag = _RAND_542[0:0];
  _RAND_543 = {1{`RANDOM}};
  blockSqIdx_13_value = _RAND_543[3:0];
  _RAND_544 = {1{`RANDOM}};
  blockSqIdx_14_flag = _RAND_544[0:0];
  _RAND_545 = {1{`RANDOM}};
  blockSqIdx_14_value = _RAND_545[3:0];
  _RAND_546 = {1{`RANDOM}};
  blockSqIdx_15_flag = _RAND_546[0:0];
  _RAND_547 = {1{`RANDOM}};
  blockSqIdx_15_value = _RAND_547[3:0];
  _RAND_548 = {1{`RANDOM}};
  blockByTlbMiss_0 = _RAND_548[0:0];
  _RAND_549 = {1{`RANDOM}};
  blockByTlbMiss_1 = _RAND_549[0:0];
  _RAND_550 = {1{`RANDOM}};
  blockByTlbMiss_2 = _RAND_550[0:0];
  _RAND_551 = {1{`RANDOM}};
  blockByTlbMiss_3 = _RAND_551[0:0];
  _RAND_552 = {1{`RANDOM}};
  blockByTlbMiss_4 = _RAND_552[0:0];
  _RAND_553 = {1{`RANDOM}};
  blockByTlbMiss_5 = _RAND_553[0:0];
  _RAND_554 = {1{`RANDOM}};
  blockByTlbMiss_6 = _RAND_554[0:0];
  _RAND_555 = {1{`RANDOM}};
  blockByTlbMiss_7 = _RAND_555[0:0];
  _RAND_556 = {1{`RANDOM}};
  blockByTlbMiss_8 = _RAND_556[0:0];
  _RAND_557 = {1{`RANDOM}};
  blockByTlbMiss_9 = _RAND_557[0:0];
  _RAND_558 = {1{`RANDOM}};
  blockByTlbMiss_10 = _RAND_558[0:0];
  _RAND_559 = {1{`RANDOM}};
  blockByTlbMiss_11 = _RAND_559[0:0];
  _RAND_560 = {1{`RANDOM}};
  blockByTlbMiss_12 = _RAND_560[0:0];
  _RAND_561 = {1{`RANDOM}};
  blockByTlbMiss_13 = _RAND_561[0:0];
  _RAND_562 = {1{`RANDOM}};
  blockByTlbMiss_14 = _RAND_562[0:0];
  _RAND_563 = {1{`RANDOM}};
  blockByTlbMiss_15 = _RAND_563[0:0];
  _RAND_564 = {1{`RANDOM}};
  blockByForwardFail_0 = _RAND_564[0:0];
  _RAND_565 = {1{`RANDOM}};
  blockByForwardFail_1 = _RAND_565[0:0];
  _RAND_566 = {1{`RANDOM}};
  blockByForwardFail_2 = _RAND_566[0:0];
  _RAND_567 = {1{`RANDOM}};
  blockByForwardFail_3 = _RAND_567[0:0];
  _RAND_568 = {1{`RANDOM}};
  blockByForwardFail_4 = _RAND_568[0:0];
  _RAND_569 = {1{`RANDOM}};
  blockByForwardFail_5 = _RAND_569[0:0];
  _RAND_570 = {1{`RANDOM}};
  blockByForwardFail_6 = _RAND_570[0:0];
  _RAND_571 = {1{`RANDOM}};
  blockByForwardFail_7 = _RAND_571[0:0];
  _RAND_572 = {1{`RANDOM}};
  blockByForwardFail_8 = _RAND_572[0:0];
  _RAND_573 = {1{`RANDOM}};
  blockByForwardFail_9 = _RAND_573[0:0];
  _RAND_574 = {1{`RANDOM}};
  blockByForwardFail_10 = _RAND_574[0:0];
  _RAND_575 = {1{`RANDOM}};
  blockByForwardFail_11 = _RAND_575[0:0];
  _RAND_576 = {1{`RANDOM}};
  blockByForwardFail_12 = _RAND_576[0:0];
  _RAND_577 = {1{`RANDOM}};
  blockByForwardFail_13 = _RAND_577[0:0];
  _RAND_578 = {1{`RANDOM}};
  blockByForwardFail_14 = _RAND_578[0:0];
  _RAND_579 = {1{`RANDOM}};
  blockByForwardFail_15 = _RAND_579[0:0];
  _RAND_580 = {1{`RANDOM}};
  blockByWaitStore_0 = _RAND_580[0:0];
  _RAND_581 = {1{`RANDOM}};
  blockByWaitStore_1 = _RAND_581[0:0];
  _RAND_582 = {1{`RANDOM}};
  blockByWaitStore_2 = _RAND_582[0:0];
  _RAND_583 = {1{`RANDOM}};
  blockByWaitStore_3 = _RAND_583[0:0];
  _RAND_584 = {1{`RANDOM}};
  blockByWaitStore_4 = _RAND_584[0:0];
  _RAND_585 = {1{`RANDOM}};
  blockByWaitStore_5 = _RAND_585[0:0];
  _RAND_586 = {1{`RANDOM}};
  blockByWaitStore_6 = _RAND_586[0:0];
  _RAND_587 = {1{`RANDOM}};
  blockByWaitStore_7 = _RAND_587[0:0];
  _RAND_588 = {1{`RANDOM}};
  blockByWaitStore_8 = _RAND_588[0:0];
  _RAND_589 = {1{`RANDOM}};
  blockByWaitStore_9 = _RAND_589[0:0];
  _RAND_590 = {1{`RANDOM}};
  blockByWaitStore_10 = _RAND_590[0:0];
  _RAND_591 = {1{`RANDOM}};
  blockByWaitStore_11 = _RAND_591[0:0];
  _RAND_592 = {1{`RANDOM}};
  blockByWaitStore_12 = _RAND_592[0:0];
  _RAND_593 = {1{`RANDOM}};
  blockByWaitStore_13 = _RAND_593[0:0];
  _RAND_594 = {1{`RANDOM}};
  blockByWaitStore_14 = _RAND_594[0:0];
  _RAND_595 = {1{`RANDOM}};
  blockByWaitStore_15 = _RAND_595[0:0];
  _RAND_596 = {1{`RANDOM}};
  blockByCacheMiss_0 = _RAND_596[0:0];
  _RAND_597 = {1{`RANDOM}};
  blockByCacheMiss_1 = _RAND_597[0:0];
  _RAND_598 = {1{`RANDOM}};
  blockByCacheMiss_2 = _RAND_598[0:0];
  _RAND_599 = {1{`RANDOM}};
  blockByCacheMiss_3 = _RAND_599[0:0];
  _RAND_600 = {1{`RANDOM}};
  blockByCacheMiss_4 = _RAND_600[0:0];
  _RAND_601 = {1{`RANDOM}};
  blockByCacheMiss_5 = _RAND_601[0:0];
  _RAND_602 = {1{`RANDOM}};
  blockByCacheMiss_6 = _RAND_602[0:0];
  _RAND_603 = {1{`RANDOM}};
  blockByCacheMiss_7 = _RAND_603[0:0];
  _RAND_604 = {1{`RANDOM}};
  blockByCacheMiss_8 = _RAND_604[0:0];
  _RAND_605 = {1{`RANDOM}};
  blockByCacheMiss_9 = _RAND_605[0:0];
  _RAND_606 = {1{`RANDOM}};
  blockByCacheMiss_10 = _RAND_606[0:0];
  _RAND_607 = {1{`RANDOM}};
  blockByCacheMiss_11 = _RAND_607[0:0];
  _RAND_608 = {1{`RANDOM}};
  blockByCacheMiss_12 = _RAND_608[0:0];
  _RAND_609 = {1{`RANDOM}};
  blockByCacheMiss_13 = _RAND_609[0:0];
  _RAND_610 = {1{`RANDOM}};
  blockByCacheMiss_14 = _RAND_610[0:0];
  _RAND_611 = {1{`RANDOM}};
  blockByCacheMiss_15 = _RAND_611[0:0];
  _RAND_612 = {1{`RANDOM}};
  blockByOthers_0 = _RAND_612[0:0];
  _RAND_613 = {1{`RANDOM}};
  blockByOthers_1 = _RAND_613[0:0];
  _RAND_614 = {1{`RANDOM}};
  blockByOthers_2 = _RAND_614[0:0];
  _RAND_615 = {1{`RANDOM}};
  blockByOthers_3 = _RAND_615[0:0];
  _RAND_616 = {1{`RANDOM}};
  blockByOthers_4 = _RAND_616[0:0];
  _RAND_617 = {1{`RANDOM}};
  blockByOthers_5 = _RAND_617[0:0];
  _RAND_618 = {1{`RANDOM}};
  blockByOthers_6 = _RAND_618[0:0];
  _RAND_619 = {1{`RANDOM}};
  blockByOthers_7 = _RAND_619[0:0];
  _RAND_620 = {1{`RANDOM}};
  blockByOthers_8 = _RAND_620[0:0];
  _RAND_621 = {1{`RANDOM}};
  blockByOthers_9 = _RAND_621[0:0];
  _RAND_622 = {1{`RANDOM}};
  blockByOthers_10 = _RAND_622[0:0];
  _RAND_623 = {1{`RANDOM}};
  blockByOthers_11 = _RAND_623[0:0];
  _RAND_624 = {1{`RANDOM}};
  blockByOthers_12 = _RAND_624[0:0];
  _RAND_625 = {1{`RANDOM}};
  blockByOthers_13 = _RAND_625[0:0];
  _RAND_626 = {1{`RANDOM}};
  blockByOthers_14 = _RAND_626[0:0];
  _RAND_627 = {1{`RANDOM}};
  blockByOthers_15 = _RAND_627[0:0];
  _RAND_628 = {1{`RANDOM}};
  missMSHRId_0 = _RAND_628[1:0];
  _RAND_629 = {1{`RANDOM}};
  missMSHRId_1 = _RAND_629[1:0];
  _RAND_630 = {1{`RANDOM}};
  missMSHRId_2 = _RAND_630[1:0];
  _RAND_631 = {1{`RANDOM}};
  missMSHRId_3 = _RAND_631[1:0];
  _RAND_632 = {1{`RANDOM}};
  missMSHRId_4 = _RAND_632[1:0];
  _RAND_633 = {1{`RANDOM}};
  missMSHRId_5 = _RAND_633[1:0];
  _RAND_634 = {1{`RANDOM}};
  missMSHRId_6 = _RAND_634[1:0];
  _RAND_635 = {1{`RANDOM}};
  missMSHRId_7 = _RAND_635[1:0];
  _RAND_636 = {1{`RANDOM}};
  missMSHRId_8 = _RAND_636[1:0];
  _RAND_637 = {1{`RANDOM}};
  missMSHRId_9 = _RAND_637[1:0];
  _RAND_638 = {1{`RANDOM}};
  missMSHRId_10 = _RAND_638[1:0];
  _RAND_639 = {1{`RANDOM}};
  missMSHRId_11 = _RAND_639[1:0];
  _RAND_640 = {1{`RANDOM}};
  missMSHRId_12 = _RAND_640[1:0];
  _RAND_641 = {1{`RANDOM}};
  missMSHRId_13 = _RAND_641[1:0];
  _RAND_642 = {1{`RANDOM}};
  missMSHRId_14 = _RAND_642[1:0];
  _RAND_643 = {1{`RANDOM}};
  missMSHRId_15 = _RAND_643[1:0];
  _RAND_644 = {1{`RANDOM}};
  replayCarryReg_0_real_way_en = _RAND_644[7:0];
  _RAND_645 = {1{`RANDOM}};
  replayCarryReg_0_valid = _RAND_645[0:0];
  _RAND_646 = {1{`RANDOM}};
  replayCarryReg_1_real_way_en = _RAND_646[7:0];
  _RAND_647 = {1{`RANDOM}};
  replayCarryReg_1_valid = _RAND_647[0:0];
  _RAND_648 = {1{`RANDOM}};
  replayCarryReg_2_real_way_en = _RAND_648[7:0];
  _RAND_649 = {1{`RANDOM}};
  replayCarryReg_2_valid = _RAND_649[0:0];
  _RAND_650 = {1{`RANDOM}};
  replayCarryReg_3_real_way_en = _RAND_650[7:0];
  _RAND_651 = {1{`RANDOM}};
  replayCarryReg_3_valid = _RAND_651[0:0];
  _RAND_652 = {1{`RANDOM}};
  replayCarryReg_4_real_way_en = _RAND_652[7:0];
  _RAND_653 = {1{`RANDOM}};
  replayCarryReg_4_valid = _RAND_653[0:0];
  _RAND_654 = {1{`RANDOM}};
  replayCarryReg_5_real_way_en = _RAND_654[7:0];
  _RAND_655 = {1{`RANDOM}};
  replayCarryReg_5_valid = _RAND_655[0:0];
  _RAND_656 = {1{`RANDOM}};
  replayCarryReg_6_real_way_en = _RAND_656[7:0];
  _RAND_657 = {1{`RANDOM}};
  replayCarryReg_6_valid = _RAND_657[0:0];
  _RAND_658 = {1{`RANDOM}};
  replayCarryReg_7_real_way_en = _RAND_658[7:0];
  _RAND_659 = {1{`RANDOM}};
  replayCarryReg_7_valid = _RAND_659[0:0];
  _RAND_660 = {1{`RANDOM}};
  replayCarryReg_8_real_way_en = _RAND_660[7:0];
  _RAND_661 = {1{`RANDOM}};
  replayCarryReg_8_valid = _RAND_661[0:0];
  _RAND_662 = {1{`RANDOM}};
  replayCarryReg_9_real_way_en = _RAND_662[7:0];
  _RAND_663 = {1{`RANDOM}};
  replayCarryReg_9_valid = _RAND_663[0:0];
  _RAND_664 = {1{`RANDOM}};
  replayCarryReg_10_real_way_en = _RAND_664[7:0];
  _RAND_665 = {1{`RANDOM}};
  replayCarryReg_10_valid = _RAND_665[0:0];
  _RAND_666 = {1{`RANDOM}};
  replayCarryReg_11_real_way_en = _RAND_666[7:0];
  _RAND_667 = {1{`RANDOM}};
  replayCarryReg_11_valid = _RAND_667[0:0];
  _RAND_668 = {1{`RANDOM}};
  replayCarryReg_12_real_way_en = _RAND_668[7:0];
  _RAND_669 = {1{`RANDOM}};
  replayCarryReg_12_valid = _RAND_669[0:0];
  _RAND_670 = {1{`RANDOM}};
  replayCarryReg_13_real_way_en = _RAND_670[7:0];
  _RAND_671 = {1{`RANDOM}};
  replayCarryReg_13_valid = _RAND_671[0:0];
  _RAND_672 = {1{`RANDOM}};
  replayCarryReg_14_real_way_en = _RAND_672[7:0];
  _RAND_673 = {1{`RANDOM}};
  replayCarryReg_14_valid = _RAND_673[0:0];
  _RAND_674 = {1{`RANDOM}};
  replayCarryReg_15_real_way_en = _RAND_674[7:0];
  _RAND_675 = {1{`RANDOM}};
  replayCarryReg_15_valid = _RAND_675[0:0];
  _RAND_676 = {1{`RANDOM}};
  storeAddrValidVec = _RAND_676[15:0];
  _RAND_677 = {1{`RANDOM}};
  storeDataValidVec = _RAND_677[15:0];
  _RAND_678 = {1{`RANDOM}};
  s1_blockLoadMask_0 = _RAND_678[0:0];
  _RAND_679 = {1{`RANDOM}};
  s1_blockLoadMask_1 = _RAND_679[0:0];
  _RAND_680 = {1{`RANDOM}};
  s1_blockLoadMask_2 = _RAND_680[0:0];
  _RAND_681 = {1{`RANDOM}};
  s1_blockLoadMask_3 = _RAND_681[0:0];
  _RAND_682 = {1{`RANDOM}};
  s1_blockLoadMask_4 = _RAND_682[0:0];
  _RAND_683 = {1{`RANDOM}};
  s1_blockLoadMask_5 = _RAND_683[0:0];
  _RAND_684 = {1{`RANDOM}};
  s1_blockLoadMask_6 = _RAND_684[0:0];
  _RAND_685 = {1{`RANDOM}};
  s1_blockLoadMask_7 = _RAND_685[0:0];
  _RAND_686 = {1{`RANDOM}};
  s1_blockLoadMask_8 = _RAND_686[0:0];
  _RAND_687 = {1{`RANDOM}};
  s1_blockLoadMask_9 = _RAND_687[0:0];
  _RAND_688 = {1{`RANDOM}};
  s1_blockLoadMask_10 = _RAND_688[0:0];
  _RAND_689 = {1{`RANDOM}};
  s1_blockLoadMask_11 = _RAND_689[0:0];
  _RAND_690 = {1{`RANDOM}};
  s1_blockLoadMask_12 = _RAND_690[0:0];
  _RAND_691 = {1{`RANDOM}};
  s1_blockLoadMask_13 = _RAND_691[0:0];
  _RAND_692 = {1{`RANDOM}};
  s1_blockLoadMask_14 = _RAND_692[0:0];
  _RAND_693 = {1{`RANDOM}};
  s1_blockLoadMask_15 = _RAND_693[0:0];
  _RAND_694 = {1{`RANDOM}};
  s2_blockLoadMask_0 = _RAND_694[0:0];
  _RAND_695 = {1{`RANDOM}};
  s2_blockLoadMask_1 = _RAND_695[0:0];
  _RAND_696 = {1{`RANDOM}};
  s2_blockLoadMask_2 = _RAND_696[0:0];
  _RAND_697 = {1{`RANDOM}};
  s2_blockLoadMask_3 = _RAND_697[0:0];
  _RAND_698 = {1{`RANDOM}};
  s2_blockLoadMask_4 = _RAND_698[0:0];
  _RAND_699 = {1{`RANDOM}};
  s2_blockLoadMask_5 = _RAND_699[0:0];
  _RAND_700 = {1{`RANDOM}};
  s2_blockLoadMask_6 = _RAND_700[0:0];
  _RAND_701 = {1{`RANDOM}};
  s2_blockLoadMask_7 = _RAND_701[0:0];
  _RAND_702 = {1{`RANDOM}};
  s2_blockLoadMask_8 = _RAND_702[0:0];
  _RAND_703 = {1{`RANDOM}};
  s2_blockLoadMask_9 = _RAND_703[0:0];
  _RAND_704 = {1{`RANDOM}};
  s2_blockLoadMask_10 = _RAND_704[0:0];
  _RAND_705 = {1{`RANDOM}};
  s2_blockLoadMask_11 = _RAND_705[0:0];
  _RAND_706 = {1{`RANDOM}};
  s2_blockLoadMask_12 = _RAND_706[0:0];
  _RAND_707 = {1{`RANDOM}};
  s2_blockLoadMask_13 = _RAND_707[0:0];
  _RAND_708 = {1{`RANDOM}};
  s2_blockLoadMask_14 = _RAND_708[0:0];
  _RAND_709 = {1{`RANDOM}};
  s2_blockLoadMask_15 = _RAND_709[0:0];
  _RAND_710 = {1{`RANDOM}};
  loadReplaySel_0_REG = _RAND_710[3:0];
  _RAND_711 = {1{`RANDOM}};
  loadReplaySel_1_REG = _RAND_711[3:0];
  _RAND_712 = {1{`RANDOM}};
  loadReplaySelV_0_REG = _RAND_712[0:0];
  _RAND_713 = {1{`RANDOM}};
  loadReplaySelV_1_REG = _RAND_713[0:0];
  _RAND_714 = {1{`RANDOM}};
  coldCounter = _RAND_714[2:0];
  _RAND_715 = {1{`RANDOM}};
  cancelReplay_REG_valid = _RAND_715[0:0];
  _RAND_716 = {1{`RANDOM}};
  cancelReplay_REG_bits_robIdx_flag = _RAND_716[0:0];
  _RAND_717 = {1{`RANDOM}};
  cancelReplay_REG_bits_robIdx_value = _RAND_717[4:0];
  _RAND_718 = {1{`RANDOM}};
  cancelReplay_REG_bits_level = _RAND_718[0:0];
  _RAND_719 = {1{`RANDOM}};
  cancelReplay_REG_1_valid = _RAND_719[0:0];
  _RAND_720 = {1{`RANDOM}};
  cancelReplay_REG_1_bits_robIdx_flag = _RAND_720[0:0];
  _RAND_721 = {1{`RANDOM}};
  cancelReplay_REG_1_bits_robIdx_value = _RAND_721[4:0];
  _RAND_722 = {1{`RANDOM}};
  cancelReplay_REG_1_bits_level = _RAND_722[0:0];
  _RAND_723 = {1{`RANDOM}};
  lastReplay = _RAND_723[0:0];
  _RAND_724 = {1{`RANDOM}};
  io_perf_0_value_REG = _RAND_724[1:0];
  _RAND_725 = {1{`RANDOM}};
  io_perf_0_value_REG_1 = _RAND_725[1:0];
  _RAND_726 = {1{`RANDOM}};
  io_perf_1_value_REG = _RAND_726[1:0];
  _RAND_727 = {1{`RANDOM}};
  io_perf_1_value_REG_1 = _RAND_727[1:0];
  _RAND_728 = {1{`RANDOM}};
  io_perf_2_value_REG = _RAND_728[1:0];
  _RAND_729 = {1{`RANDOM}};
  io_perf_2_value_REG_1 = _RAND_729[1:0];
  _RAND_730 = {1{`RANDOM}};
  io_perf_3_value_REG = _RAND_730[0:0];
  _RAND_731 = {1{`RANDOM}};
  io_perf_3_value_REG_1 = _RAND_731[0:0];
  _RAND_732 = {1{`RANDOM}};
  io_perf_4_value_REG = _RAND_732[1:0];
  _RAND_733 = {1{`RANDOM}};
  io_perf_4_value_REG_1 = _RAND_733[1:0];
  _RAND_734 = {1{`RANDOM}};
  io_perf_5_value_REG = _RAND_734[1:0];
  _RAND_735 = {1{`RANDOM}};
  io_perf_5_value_REG_1 = _RAND_735[1:0];
  _RAND_736 = {1{`RANDOM}};
  io_perf_6_value_REG = _RAND_736[1:0];
  _RAND_737 = {1{`RANDOM}};
  io_perf_6_value_REG_1 = _RAND_737[1:0];
  _RAND_738 = {1{`RANDOM}};
  io_perf_7_value_REG = _RAND_738[1:0];
  _RAND_739 = {1{`RANDOM}};
  io_perf_7_value_REG_1 = _RAND_739[1:0];
  _RAND_740 = {1{`RANDOM}};
  io_perf_8_value_REG = _RAND_740[1:0];
  _RAND_741 = {1{`RANDOM}};
  io_perf_8_value_REG_1 = _RAND_741[1:0];
  _RAND_742 = {1{`RANDOM}};
  io_perf_9_value_REG = _RAND_742[1:0];
  _RAND_743 = {1{`RANDOM}};
  io_perf_9_value_REG_1 = _RAND_743[1:0];
  _RAND_744 = {1{`RANDOM}};
  io_perf_10_value_REG = _RAND_744[1:0];
  _RAND_745 = {1{`RANDOM}};
  io_perf_10_value_REG_1 = _RAND_745[1:0];
  _RAND_746 = {1{`RANDOM}};
  io_perf_11_value_REG = _RAND_746[1:0];
  _RAND_747 = {1{`RANDOM}};
  io_perf_11_value_REG_1 = _RAND_747[1:0];
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
    allocated_12 = 1'h0;
  end
  if (reset) begin
    allocated_13 = 1'h0;
  end
  if (reset) begin
    allocated_14 = 1'h0;
  end
  if (reset) begin
    allocated_15 = 1'h0;
  end
  if (reset) begin
    cause_0 = 8'h0;
  end
  if (reset) begin
    cause_1 = 8'h0;
  end
  if (reset) begin
    cause_2 = 8'h0;
  end
  if (reset) begin
    cause_3 = 8'h0;
  end
  if (reset) begin
    cause_4 = 8'h0;
  end
  if (reset) begin
    cause_5 = 8'h0;
  end
  if (reset) begin
    cause_6 = 8'h0;
  end
  if (reset) begin
    cause_7 = 8'h0;
  end
  if (reset) begin
    cause_8 = 8'h0;
  end
  if (reset) begin
    cause_9 = 8'h0;
  end
  if (reset) begin
    cause_10 = 8'h0;
  end
  if (reset) begin
    cause_11 = 8'h0;
  end
  if (reset) begin
    cause_12 = 8'h0;
  end
  if (reset) begin
    cause_13 = 8'h0;
  end
  if (reset) begin
    cause_14 = 8'h0;
  end
  if (reset) begin
    cause_15 = 8'h0;
  end
  if (reset) begin
    blockPtrOthers_0 = 2'h0;
  end
  if (reset) begin
    blockPtrOthers_1 = 2'h0;
  end
  if (reset) begin
    blockPtrOthers_2 = 2'h0;
  end
  if (reset) begin
    blockPtrOthers_3 = 2'h0;
  end
  if (reset) begin
    blockPtrOthers_4 = 2'h0;
  end
  if (reset) begin
    blockPtrOthers_5 = 2'h0;
  end
  if (reset) begin
    blockPtrOthers_6 = 2'h0;
  end
  if (reset) begin
    blockPtrOthers_7 = 2'h0;
  end
  if (reset) begin
    blockPtrOthers_8 = 2'h0;
  end
  if (reset) begin
    blockPtrOthers_9 = 2'h0;
  end
  if (reset) begin
    blockPtrOthers_10 = 2'h0;
  end
  if (reset) begin
    blockPtrOthers_11 = 2'h0;
  end
  if (reset) begin
    blockPtrOthers_12 = 2'h0;
  end
  if (reset) begin
    blockPtrOthers_13 = 2'h0;
  end
  if (reset) begin
    blockPtrOthers_14 = 2'h0;
  end
  if (reset) begin
    blockPtrOthers_15 = 2'h0;
  end
  if (reset) begin
    blockCounter_0 = 5'h0;
  end
  if (reset) begin
    blockCounter_1 = 5'h0;
  end
  if (reset) begin
    blockCounter_2 = 5'h0;
  end
  if (reset) begin
    blockCounter_3 = 5'h0;
  end
  if (reset) begin
    blockCounter_4 = 5'h0;
  end
  if (reset) begin
    blockCounter_5 = 5'h0;
  end
  if (reset) begin
    blockCounter_6 = 5'h0;
  end
  if (reset) begin
    blockCounter_7 = 5'h0;
  end
  if (reset) begin
    blockCounter_8 = 5'h0;
  end
  if (reset) begin
    blockCounter_9 = 5'h0;
  end
  if (reset) begin
    blockCounter_10 = 5'h0;
  end
  if (reset) begin
    blockCounter_11 = 5'h0;
  end
  if (reset) begin
    blockCounter_12 = 5'h0;
  end
  if (reset) begin
    blockCounter_13 = 5'h0;
  end
  if (reset) begin
    blockCounter_14 = 5'h0;
  end
  if (reset) begin
    blockCounter_15 = 5'h0;
  end
  if (reset) begin
    selBlocked_0 = 1'h0;
  end
  if (reset) begin
    selBlocked_1 = 1'h0;
  end
  if (reset) begin
    selBlocked_2 = 1'h0;
  end
  if (reset) begin
    selBlocked_3 = 1'h0;
  end
  if (reset) begin
    selBlocked_4 = 1'h0;
  end
  if (reset) begin
    selBlocked_5 = 1'h0;
  end
  if (reset) begin
    selBlocked_6 = 1'h0;
  end
  if (reset) begin
    selBlocked_7 = 1'h0;
  end
  if (reset) begin
    selBlocked_8 = 1'h0;
  end
  if (reset) begin
    selBlocked_9 = 1'h0;
  end
  if (reset) begin
    selBlocked_10 = 1'h0;
  end
  if (reset) begin
    selBlocked_11 = 1'h0;
  end
  if (reset) begin
    selBlocked_12 = 1'h0;
  end
  if (reset) begin
    selBlocked_13 = 1'h0;
  end
  if (reset) begin
    selBlocked_14 = 1'h0;
  end
  if (reset) begin
    selBlocked_15 = 1'h0;
  end
  if (reset) begin
    blockByTlbMiss_0 = 1'h0;
  end
  if (reset) begin
    blockByTlbMiss_1 = 1'h0;
  end
  if (reset) begin
    blockByTlbMiss_2 = 1'h0;
  end
  if (reset) begin
    blockByTlbMiss_3 = 1'h0;
  end
  if (reset) begin
    blockByTlbMiss_4 = 1'h0;
  end
  if (reset) begin
    blockByTlbMiss_5 = 1'h0;
  end
  if (reset) begin
    blockByTlbMiss_6 = 1'h0;
  end
  if (reset) begin
    blockByTlbMiss_7 = 1'h0;
  end
  if (reset) begin
    blockByTlbMiss_8 = 1'h0;
  end
  if (reset) begin
    blockByTlbMiss_9 = 1'h0;
  end
  if (reset) begin
    blockByTlbMiss_10 = 1'h0;
  end
  if (reset) begin
    blockByTlbMiss_11 = 1'h0;
  end
  if (reset) begin
    blockByTlbMiss_12 = 1'h0;
  end
  if (reset) begin
    blockByTlbMiss_13 = 1'h0;
  end
  if (reset) begin
    blockByTlbMiss_14 = 1'h0;
  end
  if (reset) begin
    blockByTlbMiss_15 = 1'h0;
  end
  if (reset) begin
    blockByForwardFail_0 = 1'h0;
  end
  if (reset) begin
    blockByForwardFail_1 = 1'h0;
  end
  if (reset) begin
    blockByForwardFail_2 = 1'h0;
  end
  if (reset) begin
    blockByForwardFail_3 = 1'h0;
  end
  if (reset) begin
    blockByForwardFail_4 = 1'h0;
  end
  if (reset) begin
    blockByForwardFail_5 = 1'h0;
  end
  if (reset) begin
    blockByForwardFail_6 = 1'h0;
  end
  if (reset) begin
    blockByForwardFail_7 = 1'h0;
  end
  if (reset) begin
    blockByForwardFail_8 = 1'h0;
  end
  if (reset) begin
    blockByForwardFail_9 = 1'h0;
  end
  if (reset) begin
    blockByForwardFail_10 = 1'h0;
  end
  if (reset) begin
    blockByForwardFail_11 = 1'h0;
  end
  if (reset) begin
    blockByForwardFail_12 = 1'h0;
  end
  if (reset) begin
    blockByForwardFail_13 = 1'h0;
  end
  if (reset) begin
    blockByForwardFail_14 = 1'h0;
  end
  if (reset) begin
    blockByForwardFail_15 = 1'h0;
  end
  if (reset) begin
    blockByWaitStore_0 = 1'h0;
  end
  if (reset) begin
    blockByWaitStore_1 = 1'h0;
  end
  if (reset) begin
    blockByWaitStore_2 = 1'h0;
  end
  if (reset) begin
    blockByWaitStore_3 = 1'h0;
  end
  if (reset) begin
    blockByWaitStore_4 = 1'h0;
  end
  if (reset) begin
    blockByWaitStore_5 = 1'h0;
  end
  if (reset) begin
    blockByWaitStore_6 = 1'h0;
  end
  if (reset) begin
    blockByWaitStore_7 = 1'h0;
  end
  if (reset) begin
    blockByWaitStore_8 = 1'h0;
  end
  if (reset) begin
    blockByWaitStore_9 = 1'h0;
  end
  if (reset) begin
    blockByWaitStore_10 = 1'h0;
  end
  if (reset) begin
    blockByWaitStore_11 = 1'h0;
  end
  if (reset) begin
    blockByWaitStore_12 = 1'h0;
  end
  if (reset) begin
    blockByWaitStore_13 = 1'h0;
  end
  if (reset) begin
    blockByWaitStore_14 = 1'h0;
  end
  if (reset) begin
    blockByWaitStore_15 = 1'h0;
  end
  if (reset) begin
    blockByCacheMiss_0 = 1'h0;
  end
  if (reset) begin
    blockByCacheMiss_1 = 1'h0;
  end
  if (reset) begin
    blockByCacheMiss_2 = 1'h0;
  end
  if (reset) begin
    blockByCacheMiss_3 = 1'h0;
  end
  if (reset) begin
    blockByCacheMiss_4 = 1'h0;
  end
  if (reset) begin
    blockByCacheMiss_5 = 1'h0;
  end
  if (reset) begin
    blockByCacheMiss_6 = 1'h0;
  end
  if (reset) begin
    blockByCacheMiss_7 = 1'h0;
  end
  if (reset) begin
    blockByCacheMiss_8 = 1'h0;
  end
  if (reset) begin
    blockByCacheMiss_9 = 1'h0;
  end
  if (reset) begin
    blockByCacheMiss_10 = 1'h0;
  end
  if (reset) begin
    blockByCacheMiss_11 = 1'h0;
  end
  if (reset) begin
    blockByCacheMiss_12 = 1'h0;
  end
  if (reset) begin
    blockByCacheMiss_13 = 1'h0;
  end
  if (reset) begin
    blockByCacheMiss_14 = 1'h0;
  end
  if (reset) begin
    blockByCacheMiss_15 = 1'h0;
  end
  if (reset) begin
    blockByOthers_0 = 1'h0;
  end
  if (reset) begin
    blockByOthers_1 = 1'h0;
  end
  if (reset) begin
    blockByOthers_2 = 1'h0;
  end
  if (reset) begin
    blockByOthers_3 = 1'h0;
  end
  if (reset) begin
    blockByOthers_4 = 1'h0;
  end
  if (reset) begin
    blockByOthers_5 = 1'h0;
  end
  if (reset) begin
    blockByOthers_6 = 1'h0;
  end
  if (reset) begin
    blockByOthers_7 = 1'h0;
  end
  if (reset) begin
    blockByOthers_8 = 1'h0;
  end
  if (reset) begin
    blockByOthers_9 = 1'h0;
  end
  if (reset) begin
    blockByOthers_10 = 1'h0;
  end
  if (reset) begin
    blockByOthers_11 = 1'h0;
  end
  if (reset) begin
    blockByOthers_12 = 1'h0;
  end
  if (reset) begin
    blockByOthers_13 = 1'h0;
  end
  if (reset) begin
    blockByOthers_14 = 1'h0;
  end
  if (reset) begin
    blockByOthers_15 = 1'h0;
  end
  if (reset) begin
    missMSHRId_0 = 2'h0;
  end
  if (reset) begin
    missMSHRId_1 = 2'h0;
  end
  if (reset) begin
    missMSHRId_2 = 2'h0;
  end
  if (reset) begin
    missMSHRId_3 = 2'h0;
  end
  if (reset) begin
    missMSHRId_4 = 2'h0;
  end
  if (reset) begin
    missMSHRId_5 = 2'h0;
  end
  if (reset) begin
    missMSHRId_6 = 2'h0;
  end
  if (reset) begin
    missMSHRId_7 = 2'h0;
  end
  if (reset) begin
    missMSHRId_8 = 2'h0;
  end
  if (reset) begin
    missMSHRId_9 = 2'h0;
  end
  if (reset) begin
    missMSHRId_10 = 2'h0;
  end
  if (reset) begin
    missMSHRId_11 = 2'h0;
  end
  if (reset) begin
    missMSHRId_12 = 2'h0;
  end
  if (reset) begin
    missMSHRId_13 = 2'h0;
  end
  if (reset) begin
    missMSHRId_14 = 2'h0;
  end
  if (reset) begin
    missMSHRId_15 = 2'h0;
  end
  if (reset) begin
    replayCarryReg_0_real_way_en = 8'h0;
  end
  if (reset) begin
    replayCarryReg_0_valid = 1'h0;
  end
  if (reset) begin
    replayCarryReg_1_real_way_en = 8'h0;
  end
  if (reset) begin
    replayCarryReg_1_valid = 1'h0;
  end
  if (reset) begin
    replayCarryReg_2_real_way_en = 8'h0;
  end
  if (reset) begin
    replayCarryReg_2_valid = 1'h0;
  end
  if (reset) begin
    replayCarryReg_3_real_way_en = 8'h0;
  end
  if (reset) begin
    replayCarryReg_3_valid = 1'h0;
  end
  if (reset) begin
    replayCarryReg_4_real_way_en = 8'h0;
  end
  if (reset) begin
    replayCarryReg_4_valid = 1'h0;
  end
  if (reset) begin
    replayCarryReg_5_real_way_en = 8'h0;
  end
  if (reset) begin
    replayCarryReg_5_valid = 1'h0;
  end
  if (reset) begin
    replayCarryReg_6_real_way_en = 8'h0;
  end
  if (reset) begin
    replayCarryReg_6_valid = 1'h0;
  end
  if (reset) begin
    replayCarryReg_7_real_way_en = 8'h0;
  end
  if (reset) begin
    replayCarryReg_7_valid = 1'h0;
  end
  if (reset) begin
    replayCarryReg_8_real_way_en = 8'h0;
  end
  if (reset) begin
    replayCarryReg_8_valid = 1'h0;
  end
  if (reset) begin
    replayCarryReg_9_real_way_en = 8'h0;
  end
  if (reset) begin
    replayCarryReg_9_valid = 1'h0;
  end
  if (reset) begin
    replayCarryReg_10_real_way_en = 8'h0;
  end
  if (reset) begin
    replayCarryReg_10_valid = 1'h0;
  end
  if (reset) begin
    replayCarryReg_11_real_way_en = 8'h0;
  end
  if (reset) begin
    replayCarryReg_11_valid = 1'h0;
  end
  if (reset) begin
    replayCarryReg_12_real_way_en = 8'h0;
  end
  if (reset) begin
    replayCarryReg_12_valid = 1'h0;
  end
  if (reset) begin
    replayCarryReg_13_real_way_en = 8'h0;
  end
  if (reset) begin
    replayCarryReg_13_valid = 1'h0;
  end
  if (reset) begin
    replayCarryReg_14_real_way_en = 8'h0;
  end
  if (reset) begin
    replayCarryReg_14_valid = 1'h0;
  end
  if (reset) begin
    replayCarryReg_15_real_way_en = 8'h0;
  end
  if (reset) begin
    replayCarryReg_15_valid = 1'h0;
  end
  if (reset) begin
    loadReplaySelV_0_REG = 1'h0;
  end
  if (reset) begin
    loadReplaySelV_1_REG = 1'h0;
  end
  if (reset) begin
    coldCounter = 3'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

