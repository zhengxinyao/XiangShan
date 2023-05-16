module Sbuffer(
  input          clock,
  input          reset,
  output         io_in_0_ready,
  input          io_in_0_valid,
  input  [35:0]  io_in_0_bits_addr,
  input  [127:0] io_in_0_bits_data,
  input  [15:0]  io_in_0_bits_mask,
  input  [38:0]  io_in_0_bits_vaddr,
  input          io_in_0_bits_wline,
  output         io_in_1_ready,
  input          io_in_1_valid,
  input  [35:0]  io_in_1_bits_addr,
  input  [127:0] io_in_1_bits_data,
  input  [15:0]  io_in_1_bits_mask,
  input  [38:0]  io_in_1_bits_vaddr,
  input          io_in_1_bits_wline,
  input          io_dcache_req_ready,
  output         io_dcache_req_valid,
  output [38:0]  io_dcache_req_bits_vaddr,
  output [35:0]  io_dcache_req_bits_addr,
  output [511:0] io_dcache_req_bits_data,
  output [63:0]  io_dcache_req_bits_mask,
  output [3:0]   io_dcache_req_bits_id,
  input          io_dcache_main_pipe_hit_resp_valid,
  input  [3:0]   io_dcache_main_pipe_hit_resp_bits_id,
  input          io_dcache_refill_hit_resp_valid,
  input  [3:0]   io_dcache_refill_hit_resp_bits_id,
  input          io_dcache_replay_resp_valid,
  input  [3:0]   io_dcache_replay_resp_bits_id,
  input  [38:0]  io_forward_0_vaddr,
  input  [35:0]  io_forward_0_paddr,
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
  output         io_forward_0_matchInvalid,
  input  [38:0]  io_forward_1_vaddr,
  input  [35:0]  io_forward_1_paddr,
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
  output         io_forward_1_matchInvalid,
  input          io_sqempty,
  input          io_flush_valid,
  output         io_flush_empty,
  input  [3:0]   io_csrCtrl_sbuffer_threshold,
  output [5:0]   io_perf_0_value,
  output [5:0]   io_perf_1_value,
  output [5:0]   io_perf_2_value,
  output [5:0]   io_perf_3_value,
  output [5:0]   io_perf_4_value,
  output [5:0]   io_perf_5_value,
  output [5:0]   io_perf_6_value,
  output [5:0]   io_perf_7_value,
  output [5:0]   io_perf_8_value,
  output [5:0]   io_perf_9_value,
  output [5:0]   io_perf_10_value,
  output [5:0]   io_perf_11_value,
  output [5:0]   io_perf_12_value,
  output [5:0]   io_perf_13_value,
  output [5:0]   io_perf_14_value,
  output [5:0]   io_perf_15_value,
  output [5:0]   io_perf_16_value
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [63:0] _RAND_7;
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
  reg [63:0] _RAND_56;
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
`endif // RANDOMIZE_REG_INIT
  wire  dataModule_clock; // @[Sbuffer.scala 197:26]
  wire  dataModule_reset; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_writeReq_0_valid; // @[Sbuffer.scala 197:26]
  wire [3:0] dataModule_io_writeReq_0_bits_wvec; // @[Sbuffer.scala 197:26]
  wire [15:0] dataModule_io_writeReq_0_bits_mask; // @[Sbuffer.scala 197:26]
  wire [127:0] dataModule_io_writeReq_0_bits_data; // @[Sbuffer.scala 197:26]
  wire [31:0] dataModule_io_writeReq_0_bits_vwordOffset; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_writeReq_0_bits_wline; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_writeReq_1_valid; // @[Sbuffer.scala 197:26]
  wire [3:0] dataModule_io_writeReq_1_bits_wvec; // @[Sbuffer.scala 197:26]
  wire [15:0] dataModule_io_writeReq_1_bits_mask; // @[Sbuffer.scala 197:26]
  wire [127:0] dataModule_io_writeReq_1_bits_data; // @[Sbuffer.scala 197:26]
  wire [31:0] dataModule_io_writeReq_1_bits_vwordOffset; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_writeReq_1_bits_wline; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskFlushReq_0_valid; // @[Sbuffer.scala 197:26]
  wire [3:0] dataModule_io_maskFlushReq_0_bits_wvec; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskFlushReq_1_valid; // @[Sbuffer.scala 197:26]
  wire [3:0] dataModule_io_maskFlushReq_1_bits_wvec; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_0_0; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_0_1; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_0_2; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_0_3; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_0_4; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_0_5; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_0_6; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_0_7; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_0_8; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_0_9; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_0_10; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_0_11; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_0_12; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_0_13; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_0_14; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_0_15; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_1_0; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_1_1; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_1_2; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_1_3; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_1_4; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_1_5; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_1_6; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_1_7; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_1_8; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_1_9; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_1_10; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_1_11; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_1_12; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_1_13; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_1_14; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_1_15; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_2_0; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_2_1; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_2_2; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_2_3; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_2_4; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_2_5; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_2_6; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_2_7; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_2_8; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_2_9; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_2_10; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_2_11; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_2_12; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_2_13; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_2_14; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_2_15; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_3_0; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_3_1; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_3_2; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_3_3; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_3_4; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_3_5; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_3_6; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_3_7; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_3_8; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_3_9; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_3_10; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_3_11; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_3_12; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_3_13; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_3_14; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_0_3_15; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_0_0; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_0_1; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_0_2; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_0_3; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_0_4; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_0_5; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_0_6; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_0_7; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_0_8; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_0_9; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_0_10; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_0_11; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_0_12; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_0_13; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_0_14; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_0_15; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_1_0; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_1_1; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_1_2; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_1_3; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_1_4; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_1_5; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_1_6; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_1_7; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_1_8; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_1_9; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_1_10; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_1_11; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_1_12; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_1_13; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_1_14; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_1_15; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_2_0; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_2_1; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_2_2; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_2_3; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_2_4; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_2_5; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_2_6; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_2_7; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_2_8; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_2_9; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_2_10; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_2_11; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_2_12; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_2_13; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_2_14; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_2_15; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_3_0; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_3_1; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_3_2; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_3_3; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_3_4; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_3_5; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_3_6; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_3_7; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_3_8; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_3_9; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_3_10; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_3_11; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_3_12; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_3_13; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_3_14; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_1_3_15; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_0_0; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_0_1; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_0_2; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_0_3; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_0_4; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_0_5; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_0_6; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_0_7; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_0_8; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_0_9; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_0_10; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_0_11; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_0_12; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_0_13; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_0_14; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_0_15; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_1_0; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_1_1; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_1_2; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_1_3; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_1_4; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_1_5; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_1_6; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_1_7; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_1_8; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_1_9; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_1_10; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_1_11; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_1_12; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_1_13; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_1_14; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_1_15; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_2_0; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_2_1; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_2_2; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_2_3; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_2_4; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_2_5; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_2_6; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_2_7; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_2_8; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_2_9; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_2_10; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_2_11; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_2_12; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_2_13; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_2_14; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_2_15; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_3_0; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_3_1; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_3_2; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_3_3; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_3_4; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_3_5; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_3_6; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_3_7; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_3_8; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_3_9; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_3_10; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_3_11; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_3_12; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_3_13; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_3_14; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_2_3_15; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_0_0; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_0_1; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_0_2; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_0_3; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_0_4; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_0_5; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_0_6; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_0_7; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_0_8; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_0_9; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_0_10; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_0_11; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_0_12; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_0_13; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_0_14; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_0_15; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_1_0; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_1_1; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_1_2; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_1_3; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_1_4; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_1_5; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_1_6; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_1_7; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_1_8; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_1_9; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_1_10; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_1_11; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_1_12; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_1_13; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_1_14; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_1_15; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_2_0; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_2_1; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_2_2; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_2_3; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_2_4; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_2_5; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_2_6; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_2_7; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_2_8; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_2_9; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_2_10; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_2_11; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_2_12; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_2_13; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_2_14; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_2_15; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_3_0; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_3_1; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_3_2; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_3_3; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_3_4; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_3_5; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_3_6; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_3_7; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_3_8; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_3_9; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_3_10; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_3_11; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_3_12; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_3_13; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_3_14; // @[Sbuffer.scala 197:26]
  wire [7:0] dataModule_io_dataOut_3_3_15; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_0_0; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_0_1; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_0_2; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_0_3; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_0_4; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_0_5; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_0_6; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_0_7; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_0_8; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_0_9; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_0_10; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_0_11; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_0_12; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_0_13; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_0_14; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_0_15; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_1_0; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_1_1; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_1_2; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_1_3; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_1_4; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_1_5; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_1_6; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_1_7; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_1_8; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_1_9; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_1_10; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_1_11; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_1_12; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_1_13; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_1_14; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_1_15; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_2_0; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_2_1; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_2_2; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_2_3; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_2_4; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_2_5; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_2_6; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_2_7; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_2_8; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_2_9; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_2_10; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_2_11; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_2_12; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_2_13; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_2_14; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_2_15; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_3_0; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_3_1; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_3_2; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_3_3; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_3_4; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_3_5; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_3_6; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_3_7; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_3_8; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_3_9; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_3_10; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_3_11; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_3_12; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_3_13; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_3_14; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_0_3_15; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_0_0; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_0_1; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_0_2; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_0_3; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_0_4; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_0_5; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_0_6; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_0_7; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_0_8; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_0_9; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_0_10; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_0_11; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_0_12; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_0_13; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_0_14; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_0_15; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_1_0; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_1_1; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_1_2; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_1_3; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_1_4; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_1_5; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_1_6; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_1_7; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_1_8; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_1_9; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_1_10; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_1_11; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_1_12; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_1_13; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_1_14; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_1_15; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_2_0; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_2_1; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_2_2; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_2_3; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_2_4; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_2_5; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_2_6; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_2_7; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_2_8; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_2_9; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_2_10; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_2_11; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_2_12; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_2_13; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_2_14; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_2_15; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_3_0; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_3_1; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_3_2; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_3_3; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_3_4; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_3_5; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_3_6; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_3_7; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_3_8; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_3_9; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_3_10; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_3_11; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_3_12; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_3_13; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_3_14; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_1_3_15; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_0_0; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_0_1; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_0_2; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_0_3; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_0_4; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_0_5; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_0_6; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_0_7; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_0_8; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_0_9; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_0_10; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_0_11; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_0_12; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_0_13; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_0_14; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_0_15; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_1_0; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_1_1; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_1_2; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_1_3; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_1_4; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_1_5; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_1_6; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_1_7; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_1_8; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_1_9; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_1_10; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_1_11; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_1_12; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_1_13; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_1_14; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_1_15; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_2_0; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_2_1; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_2_2; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_2_3; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_2_4; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_2_5; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_2_6; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_2_7; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_2_8; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_2_9; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_2_10; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_2_11; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_2_12; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_2_13; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_2_14; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_2_15; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_3_0; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_3_1; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_3_2; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_3_3; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_3_4; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_3_5; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_3_6; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_3_7; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_3_8; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_3_9; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_3_10; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_3_11; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_3_12; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_3_13; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_3_14; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_2_3_15; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_0_0; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_0_1; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_0_2; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_0_3; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_0_4; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_0_5; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_0_6; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_0_7; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_0_8; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_0_9; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_0_10; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_0_11; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_0_12; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_0_13; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_0_14; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_0_15; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_1_0; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_1_1; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_1_2; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_1_3; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_1_4; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_1_5; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_1_6; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_1_7; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_1_8; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_1_9; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_1_10; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_1_11; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_1_12; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_1_13; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_1_14; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_1_15; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_2_0; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_2_1; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_2_2; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_2_3; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_2_4; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_2_5; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_2_6; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_2_7; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_2_8; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_2_9; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_2_10; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_2_11; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_2_12; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_2_13; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_2_14; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_2_15; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_3_0; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_3_1; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_3_2; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_3_3; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_3_4; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_3_5; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_3_6; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_3_7; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_3_8; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_3_9; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_3_10; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_3_11; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_3_12; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_3_13; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_3_14; // @[Sbuffer.scala 197:26]
  wire  dataModule_io_maskOut_3_3_15; // @[Sbuffer.scala 197:26]
  reg [29:0] ptag_0; // @[Sbuffer.scala 201:17]
  reg [29:0] ptag_1; // @[Sbuffer.scala 201:17]
  reg [29:0] ptag_2; // @[Sbuffer.scala 201:17]
  reg [29:0] ptag_3; // @[Sbuffer.scala 201:17]
  reg [32:0] vtag_0; // @[Sbuffer.scala 202:17]
  reg [32:0] vtag_1; // @[Sbuffer.scala 202:17]
  reg [32:0] vtag_2; // @[Sbuffer.scala 202:17]
  reg [32:0] vtag_3; // @[Sbuffer.scala 202:17]
  reg [3:0] waitInflightMask_0; // @[Sbuffer.scala 204:29]
  reg [3:0] waitInflightMask_1; // @[Sbuffer.scala 204:29]
  reg [3:0] waitInflightMask_2; // @[Sbuffer.scala 204:29]
  reg [3:0] waitInflightMask_3; // @[Sbuffer.scala 204:29]
  reg  stateVec_0_state_valid; // @[Sbuffer.scala 207:25]
  reg  stateVec_0_state_inflight; // @[Sbuffer.scala 207:25]
  reg  stateVec_0_wtimeout; // @[Sbuffer.scala 207:25]
  reg  stateVec_0_wsameblock_inflight; // @[Sbuffer.scala 207:25]
  reg  stateVec_1_state_valid; // @[Sbuffer.scala 207:25]
  reg  stateVec_1_state_inflight; // @[Sbuffer.scala 207:25]
  reg  stateVec_1_wtimeout; // @[Sbuffer.scala 207:25]
  reg  stateVec_1_wsameblock_inflight; // @[Sbuffer.scala 207:25]
  reg  stateVec_2_state_valid; // @[Sbuffer.scala 207:25]
  reg  stateVec_2_state_inflight; // @[Sbuffer.scala 207:25]
  reg  stateVec_2_wtimeout; // @[Sbuffer.scala 207:25]
  reg  stateVec_2_wsameblock_inflight; // @[Sbuffer.scala 207:25]
  reg  stateVec_3_state_valid; // @[Sbuffer.scala 207:25]
  reg  stateVec_3_state_inflight; // @[Sbuffer.scala 207:25]
  reg  stateVec_3_wtimeout; // @[Sbuffer.scala 207:25]
  reg  stateVec_3_wsameblock_inflight; // @[Sbuffer.scala 207:25]
  reg [20:0] cohCount_0; // @[Sbuffer.scala 208:25]
  reg [20:0] cohCount_1; // @[Sbuffer.scala 208:25]
  reg [20:0] cohCount_2; // @[Sbuffer.scala 208:25]
  reg [20:0] cohCount_3; // @[Sbuffer.scala 208:25]
  reg [4:0] missqReplayCount_0; // @[Sbuffer.scala 209:33]
  reg [4:0] missqReplayCount_1; // @[Sbuffer.scala 209:33]
  reg [4:0] missqReplayCount_2; // @[Sbuffer.scala 209:33]
  reg [4:0] missqReplayCount_3; // @[Sbuffer.scala 209:33]
  reg [1:0] sbuffer_state; // @[Sbuffer.scala 222:30]
  reg [2:0] state_reg; // @[Replacement.scala 168:70]
  wire  replaceIdx_left_subtree_older = state_reg[2]; // @[Replacement.scala 243:38]
  wire  replaceIdx_left_subtree_state = state_reg[1]; // @[package.scala 154:13]
  wire  replaceIdx_right_subtree_state = state_reg[0]; // @[Replacement.scala 245:38]
  wire  _replaceIdx_T_2 = replaceIdx_left_subtree_older ? replaceIdx_left_subtree_state : replaceIdx_right_subtree_state
    ; // @[Replacement.scala 250:16]
  wire [1:0] replaceIdx = {replaceIdx_left_subtree_older,_replaceIdx_T_2}; // @[Cat.scala 31:58]
  reg  accessIdx_0_valid_REG; // @[Sbuffer.scala 435:34]
  reg  accessIdx_1_valid_REG; // @[Sbuffer.scala 435:34]
  wire  invalidMask_3 = ~stateVec_3_state_valid; // @[Sbuffer.scala 67:27]
  wire  invalidMask_2 = ~stateVec_2_state_valid; // @[Sbuffer.scala 67:27]
  wire  invalidMask_1 = ~stateVec_1_state_valid; // @[Sbuffer.scala 67:27]
  wire  invalidMask_0 = ~stateVec_0_state_valid; // @[Sbuffer.scala 67:27]
  wire  _GEN_239 = 2'h1 == replaceIdx ? invalidMask_1 : invalidMask_0; // @[Sbuffer.scala 618:{62,62}]
  wire  _GEN_240 = 2'h2 == replaceIdx ? invalidMask_2 : _GEN_239; // @[Sbuffer.scala 618:{62,62}]
  wire  _GEN_241 = 2'h3 == replaceIdx ? invalidMask_3 : _GEN_240; // @[Sbuffer.scala 618:{62,62}]
  reg  do_eviction; // @[Sbuffer.scala 479:28]
  wire  need_replace = do_eviction | sbuffer_state == 2'h1; // @[Sbuffer.scala 560:34]
  wire  need_drain = sbuffer_state[1]; // @[Sbuffer.scala 221:10]
  wire  _cohTimeOutMask_T_2 = stateVec_0_state_valid & ~stateVec_0_state_inflight; // @[Sbuffer.scala 69:38]
  wire  cohTimeOutMask_0 = cohCount_0[20] & _cohTimeOutMask_T_2; // @[Sbuffer.scala 268:78]
  wire  _cohTimeOutMask_T_6 = stateVec_1_state_valid & ~stateVec_1_state_inflight; // @[Sbuffer.scala 69:38]
  wire  cohTimeOutMask_1 = cohCount_1[20] & _cohTimeOutMask_T_6; // @[Sbuffer.scala 268:78]
  wire  _cohTimeOutMask_T_10 = stateVec_2_state_valid & ~stateVec_2_state_inflight; // @[Sbuffer.scala 69:38]
  wire  cohTimeOutMask_2 = cohCount_2[20] & _cohTimeOutMask_T_10; // @[Sbuffer.scala 268:78]
  wire  _cohTimeOutMask_T_14 = stateVec_3_state_valid & ~stateVec_3_state_inflight; // @[Sbuffer.scala 69:38]
  wire  cohTimeOutMask_3 = cohCount_3[20] & _cohTimeOutMask_T_14; // @[Sbuffer.scala 268:78]
  wire  f_tail = cohTimeOutMask_2 | cohTimeOutMask_3; // @[PriorityMuxDefault.scala 47:46]
  wire  f_tail_1 = cohTimeOutMask_1 | f_tail; // @[PriorityMuxDefault.scala 47:46]
  wire  cohHasTimeOut = cohTimeOutMask_0 | f_tail_1; // @[PriorityMuxDefault.scala 47:46]
  reg  missqReplayHasTimeOut_REG; // @[Sbuffer.scala 273:38]
  reg  missqReplayHasTimeOut_REG_1; // @[Sbuffer.scala 273:76]
  wire  missqReplayHasTimeOut = missqReplayHasTimeOut_REG & ~missqReplayHasTimeOut_REG_1; // @[Sbuffer.scala 273:65]
  reg  blockDcacheWrite; // @[Sbuffer.scala 586:38]
  wire  _sbuffer_out_s1_ready_T = ~blockDcacheWrite; // @[Sbuffer.scala 594:50]
  reg  sbuffer_out_s1_valid; // @[Sbuffer.scala 593:37]
  wire  sbuffer_out_s0_cango = io_dcache_req_ready & ~blockDcacheWrite | ~sbuffer_out_s1_valid; // @[Sbuffer.scala 594:68]
  wire  _GEN_235 = 2'h1 == replaceIdx ? _cohTimeOutMask_T_6 : _cohTimeOutMask_T_2; // @[Sbuffer.scala 619:{101,101}]
  wire  _GEN_236 = 2'h2 == replaceIdx ? _cohTimeOutMask_T_10 : _GEN_235; // @[Sbuffer.scala 619:{101,101}]
  wire  _GEN_237 = 2'h3 == replaceIdx ? _cohTimeOutMask_T_14 : _GEN_236; // @[Sbuffer.scala 619:{101,101}]
  wire  _accessIdx_2_valid_T_7 = need_replace & ~need_drain & ~cohHasTimeOut & ~missqReplayHasTimeOut &
    sbuffer_out_s0_cango & _GEN_237; // @[Sbuffer.scala 619:101]
  wire  accessIdx_2_valid = _GEN_241 | _accessIdx_2_valid_T_7; // @[Sbuffer.scala 618:62]
  wire  _T_1 = accessIdx_0_valid_REG | accessIdx_1_valid_REG | accessIdx_2_valid; // @[package.scala 72:59]
  reg [1:0] accessIdx_0_bits_REG; // @[Sbuffer.scala 436:33]
  wire  state_reg_set_left_older = ~accessIdx_0_bits_REG[1]; // @[Replacement.scala 196:33]
  wire  _state_reg_T_2 = ~accessIdx_0_bits_REG[0]; // @[Replacement.scala 218:7]
  wire  _state_reg_T_3 = state_reg_set_left_older ? replaceIdx_left_subtree_state : _state_reg_T_2; // @[Replacement.scala 203:16]
  wire  _state_reg_T_7 = state_reg_set_left_older ? _state_reg_T_2 : replaceIdx_right_subtree_state; // @[Replacement.scala 206:16]
  wire [2:0] _state_reg_T_8 = {state_reg_set_left_older,_state_reg_T_3,_state_reg_T_7}; // @[Cat.scala 31:58]
  wire [2:0] _state_reg_T_9 = accessIdx_0_valid_REG ? _state_reg_T_8 : state_reg; // @[Replacement.scala 22:56]
  reg [1:0] accessIdx_1_bits_REG; // @[Sbuffer.scala 436:33]
  wire  state_reg_set_left_older_1 = ~accessIdx_1_bits_REG[1]; // @[Replacement.scala 196:33]
  wire  state_reg_left_subtree_state_1 = _state_reg_T_9[1]; // @[package.scala 154:13]
  wire  state_reg_right_subtree_state_1 = _state_reg_T_9[0]; // @[Replacement.scala 198:38]
  wire  _state_reg_T_12 = ~accessIdx_1_bits_REG[0]; // @[Replacement.scala 218:7]
  wire  _state_reg_T_13 = state_reg_set_left_older_1 ? state_reg_left_subtree_state_1 : _state_reg_T_12; // @[Replacement.scala 203:16]
  wire  _state_reg_T_17 = state_reg_set_left_older_1 ? _state_reg_T_12 : state_reg_right_subtree_state_1; // @[Replacement.scala 206:16]
  wire [2:0] _state_reg_T_18 = {state_reg_set_left_older_1,_state_reg_T_13,_state_reg_T_17}; // @[Cat.scala 31:58]
  wire [2:0] _state_reg_T_19 = accessIdx_1_valid_REG ? _state_reg_T_18 : _state_reg_T_9; // @[Replacement.scala 22:56]
  wire  state_reg_set_left_older_2 = ~replaceIdx[1]; // @[Replacement.scala 196:33]
  wire  state_reg_left_subtree_state_2 = _state_reg_T_19[1]; // @[package.scala 154:13]
  wire  state_reg_right_subtree_state_2 = _state_reg_T_19[0]; // @[Replacement.scala 198:38]
  wire  _state_reg_T_22 = ~replaceIdx[0]; // @[Replacement.scala 218:7]
  wire  _state_reg_T_23 = state_reg_set_left_older_2 ? state_reg_left_subtree_state_2 : _state_reg_T_22; // @[Replacement.scala 203:16]
  wire  _state_reg_T_27 = state_reg_set_left_older_2 ? _state_reg_T_22 : state_reg_right_subtree_state_2; // @[Replacement.scala 206:16]
  wire [2:0] _state_reg_T_28 = {state_reg_set_left_older_2,_state_reg_T_23,_state_reg_T_27}; // @[Cat.scala 31:58]
  wire [1:0] d_tail = cohTimeOutMask_2 ? 2'h2 : 2'h3; // @[PriorityMuxDefault.scala 47:13]
  wire [1:0] d_tail_1 = cohTimeOutMask_1 ? 2'h1 : d_tail; // @[PriorityMuxDefault.scala 47:13]
  wire [1:0] cohTimeOutIdx = cohTimeOutMask_0 ? 2'h0 : d_tail_1; // @[PriorityMuxDefault.scala 47:13]
  wire  missqReplayTimeOutMask_0 = missqReplayCount_0[4] & stateVec_0_wtimeout; // @[Sbuffer.scala 271:100]
  wire  missqReplayTimeOutMask_1 = missqReplayCount_1[4] & stateVec_1_wtimeout; // @[Sbuffer.scala 271:100]
  wire  missqReplayTimeOutMask_2 = missqReplayCount_2[4] & stateVec_2_wtimeout; // @[Sbuffer.scala 271:100]
  wire  missqReplayTimeOutMask_3 = missqReplayCount_3[4] & stateVec_3_wtimeout; // @[Sbuffer.scala 271:100]
  wire  f_tail_2 = missqReplayTimeOutMask_2 | missqReplayTimeOutMask_3; // @[PriorityMuxDefault.scala 47:46]
  wire  f_tail_3 = missqReplayTimeOutMask_1 | f_tail_2; // @[PriorityMuxDefault.scala 47:46]
  wire  missqReplayHasTimeOutGen = missqReplayTimeOutMask_0 | f_tail_3; // @[PriorityMuxDefault.scala 47:46]
  reg [1:0] missqReplayTimeOutIdx; // @[Reg.scala 16:16]
  wire [1:0] _drainIdx_T = _cohTimeOutMask_T_10 ? 2'h2 : 2'h3; // @[Mux.scala 47:70]
  wire [1:0] _drainIdx_T_1 = _cohTimeOutMask_T_6 ? 2'h1 : _drainIdx_T; // @[Mux.scala 47:70]
  wire [1:0] drainIdx = _cohTimeOutMask_T_2 ? 2'h0 : _drainIdx_T_1; // @[Mux.scala 47:70]
  wire [29:0] inptags_0 = io_in_0_bits_addr[35:6]; // @[Sbuffer.scala 227:7]
  wire [29:0] inptags_1 = io_in_1_bits_addr[35:6]; // @[Sbuffer.scala 227:7]
  wire [32:0] invtags_0 = io_in_0_bits_vaddr[38:6]; // @[Sbuffer.scala 230:7]
  wire [32:0] invtags_1 = io_in_1_bits_vaddr[38:6]; // @[Sbuffer.scala 230:7]
  wire  sameTag = inptags_0 == inptags_1; // @[Sbuffer.scala 301:28]
  wire [31:0] firstWord = io_in_0_bits_addr[35:4]; // @[Sbuffer.scala 236:7]
  wire [31:0] secondWord = io_in_1_bits_addr[35:4]; // @[Sbuffer.scala 236:7]
  wire  sameWord = firstWord == secondWord; // @[Sbuffer.scala 304:28]
  wire  _T_16 = inptags_0 == ptag_2; // @[Sbuffer.scala 314:18]
  wire  mergeMask_0_2 = inptags_0 == ptag_2 & _cohTimeOutMask_T_10; // @[Sbuffer.scala 314:30]
  wire  _T_14 = inptags_0 == ptag_1; // @[Sbuffer.scala 314:18]
  wire  mergeMask_0_1 = inptags_0 == ptag_1 & _cohTimeOutMask_T_6; // @[Sbuffer.scala 314:30]
  wire  _T_12 = inptags_0 == ptag_0; // @[Sbuffer.scala 314:18]
  wire  mergeMask_0_0 = inptags_0 == ptag_0 & _cohTimeOutMask_T_2; // @[Sbuffer.scala 314:30]
  wire  _T_42 = inptags_1 == ptag_2; // @[Sbuffer.scala 314:18]
  wire  mergeMask_1_2 = inptags_1 == ptag_2 & _cohTimeOutMask_T_10; // @[Sbuffer.scala 314:30]
  wire  _T_40 = inptags_1 == ptag_1; // @[Sbuffer.scala 314:18]
  wire  mergeMask_1_1 = inptags_1 == ptag_1 & _cohTimeOutMask_T_6; // @[Sbuffer.scala 314:30]
  wire  _T_38 = inptags_1 == ptag_0; // @[Sbuffer.scala 314:18]
  wire  mergeMask_1_0 = inptags_1 == ptag_0 & _cohTimeOutMask_T_2; // @[Sbuffer.scala 314:30]
  wire  _T_18 = inptags_0 == ptag_3; // @[Sbuffer.scala 314:18]
  wire  mergeMask_0_3 = inptags_0 == ptag_3 & _cohTimeOutMask_T_14; // @[Sbuffer.scala 314:30]
  wire  canMerge_0 = mergeMask_0_0 | mergeMask_0_1 | (mergeMask_0_2 | mergeMask_0_3); // @[ParallelMux.scala 36:53]
  wire  _T_44 = inptags_1 == ptag_3; // @[Sbuffer.scala 314:18]
  wire  mergeMask_1_3 = inptags_1 == ptag_3 & _cohTimeOutMask_T_14; // @[Sbuffer.scala 314:30]
  wire  canMerge_1 = mergeMask_1_0 | mergeMask_1_1 | (mergeMask_1_2 | mergeMask_1_3); // @[ParallelMux.scala 36:53]
  wire [3:0] mergeVec_0 = {mergeMask_0_3,mergeMask_0_2,mergeMask_0_1,mergeMask_0_0}; // @[Sbuffer.scala 310:34]
  wire [3:0] mergeVec_1 = {mergeMask_1_3,mergeMask_1_2,mergeMask_1_1,mergeMask_1_0}; // @[Sbuffer.scala 310:34]
  wire  _T_32 = io_in_0_ready & io_in_0_valid; // @[Decoupled.scala 50:35]
  wire  _T_58 = io_in_1_ready & io_in_1_valid; // @[Decoupled.scala 50:35]
  wire [3:0] _evenInvalidMask_T = {invalidMask_3,invalidMask_2,invalidMask_1,invalidMask_0}; // @[Sbuffer.scala 324:49]
  wire [1:0] evenInvalidMask = {_evenInvalidMask_T[2],_evenInvalidMask_T[0]}; // @[BitUtils.scala 185:64]
  wire [1:0] oddInvalidMask = {_evenInvalidMask_T[3],_evenInvalidMask_T[1]}; // @[BitUtils.scala 197:66]
  wire  evenRawInsertVec_output_0 = evenInvalidMask[0]; // @[Sbuffer.scala 329:41]
  wire  evenRawInsertVec_output_1 = ~(|evenRawInsertVec_output_0) & evenInvalidMask[1]; // @[Sbuffer.scala 331:41]
  wire [1:0] evenRawInsertVec = {evenRawInsertVec_output_1,evenRawInsertVec_output_0}; // @[Sbuffer.scala 333:12]
  wire  oddRawInsertVec_output_0 = oddInvalidMask[0]; // @[Sbuffer.scala 329:41]
  wire  oddRawInsertVec_output_1 = ~(|oddRawInsertVec_output_0) & oddInvalidMask[1]; // @[Sbuffer.scala 331:41]
  wire [1:0] oddRawInsertVec = {oddRawInsertVec_output_1,oddRawInsertVec_output_0}; // @[Sbuffer.scala 333:12]
  wire  evenCanInsert = evenRawInsertVec_output_0 | evenInvalidMask[1]; // @[PriorityMuxDefault.scala 47:46]
  wire  oddCanInsert = oddRawInsertVec_output_0 | oddInvalidMask[1]; // @[PriorityMuxDefault.scala 47:46]
  wire [3:0] evenInsertVec = {1'h0,evenRawInsertVec[1],1'h0,evenRawInsertVec[0]}; // @[BitUtils.scala 190:9]
  wire [3:0] oddInsertVec = {oddRawInsertVec[1],1'h0,oddRawInsertVec[0],1'h0}; // @[BitUtils.scala 202:9]
  reg  enbufferSelReg; // @[Sbuffer.scala 345:31]
  wire  _enbufferSelReg_T = ~enbufferSelReg; // @[Sbuffer.scala 347:23]
  wire [3:0] firstInsertVec = enbufferSelReg ? evenInsertVec : oddInsertVec; // @[Sbuffer.scala 355:27]
  wire [3:0] _secondInsertVec_T_1 = _enbufferSelReg_T ? evenInsertVec : oddInsertVec; // @[Sbuffer.scala 358:8]
  wire [3:0] secondInsertVec = sameTag ? firstInsertVec : _secondInsertVec_T_1; // @[Sbuffer.scala 356:28]
  wire  _firstCanInsert_T = sbuffer_state != 2'h3; // @[Sbuffer.scala 360:38]
  wire  _firstCanInsert_T_1 = enbufferSelReg ? evenCanInsert : oddCanInsert; // @[Sbuffer.scala 360:64]
  wire  firstCanInsert = sbuffer_state != 2'h3 & _firstCanInsert_T_1; // @[Sbuffer.scala 360:58]
  wire  _secondCanInsert_T_2 = _enbufferSelReg_T ? evenCanInsert : oddCanInsert; // @[Sbuffer.scala 363:8]
  wire  _secondCanInsert_T_3 = sameTag ? firstCanInsert : _secondCanInsert_T_2; // @[Sbuffer.scala 361:65]
  wire  secondCanInsert = _firstCanInsert_T & _secondCanInsert_T_3; // @[Sbuffer.scala 361:59]
  reg  do_uarch_drain_REG; // @[Sbuffer.scala 367:31]
  reg  do_uarch_drain_REG_1; // @[Sbuffer.scala 367:76]
  reg  do_uarch_drain_REG_2; // @[Sbuffer.scala 367:68]
  wire  do_uarch_drain = do_uarch_drain_REG | do_uarch_drain_REG_2; // @[Sbuffer.scala 367:58]
  wire [1:0] insertIdx_hi = firstInsertVec[3:2]; // @[OneHot.scala 30:18]
  wire [1:0] insertIdx_lo = firstInsertVec[1:0]; // @[OneHot.scala 31:18]
  wire  _insertIdx_T = |insertIdx_hi; // @[OneHot.scala 32:14]
  wire [1:0] _insertIdx_T_1 = insertIdx_hi | insertIdx_lo; // @[OneHot.scala 32:28]
  wire [1:0] insertIdx = {_insertIdx_T,_insertIdx_T_1[1]}; // @[Cat.scala 31:58]
  wire  _T_92 = invtags_0 != vtag_0; // @[Sbuffer.scala 412:22]
  wire [20:0] _GEN_4 = mergeVec_0[0] ? 21'h0 : cohCount_0; // @[Sbuffer.scala 208:25 408:32 409:28]
  wire  _GEN_5 = mergeVec_0[0] & _T_92; // @[Sbuffer.scala 408:32]
  wire  _GEN_6 = invtags_0 != vtag_1 | _GEN_5; // @[Sbuffer.scala 412:42 419:34]
  wire [20:0] _GEN_7 = mergeVec_0[1] ? 21'h0 : cohCount_1; // @[Sbuffer.scala 208:25 408:32 409:28]
  wire  _GEN_8 = mergeVec_0[1] ? _GEN_6 : mergeVec_0[0] & _T_92; // @[Sbuffer.scala 408:32]
  wire  _GEN_9 = invtags_0 != vtag_2 | _GEN_8; // @[Sbuffer.scala 412:42 419:34]
  wire [20:0] _GEN_10 = mergeVec_0[2] ? 21'h0 : cohCount_2; // @[Sbuffer.scala 208:25 408:32 409:28]
  wire  _GEN_11 = mergeVec_0[2] ? _GEN_9 : _GEN_8; // @[Sbuffer.scala 408:32]
  wire  _GEN_12 = invtags_0 != vtag_3 | _GEN_11; // @[Sbuffer.scala 412:42 419:34]
  wire [20:0] _GEN_13 = mergeVec_0[3] ? 21'h0 : cohCount_3; // @[Sbuffer.scala 208:25 408:32 409:28]
  wire  _GEN_14 = mergeVec_0[3] ? _GEN_12 : _GEN_11; // @[Sbuffer.scala 408:32]
  wire  _sameBlockInflightMask_mask_T_1 = stateVec_0_state_inflight & _T_12; // @[Sbuffer.scala 526:54]
  wire  _sameBlockInflightMask_mask_T_3 = stateVec_1_state_inflight & _T_14; // @[Sbuffer.scala 526:54]
  wire  _sameBlockInflightMask_mask_T_5 = stateVec_2_state_inflight & _T_16; // @[Sbuffer.scala 526:54]
  wire  _sameBlockInflightMask_mask_T_7 = stateVec_3_state_inflight & _T_18; // @[Sbuffer.scala 526:54]
  wire [3:0] sameBlockInflightMask = {_sameBlockInflightMask_mask_T_7,_sameBlockInflightMask_mask_T_5,
    _sameBlockInflightMask_mask_T_3,_sameBlockInflightMask_mask_T_1}; // @[Sbuffer.scala 526:79]
  wire  _stateVec_0_wsameblock_inflight_T = |sameBlockInflightMask; // @[Sbuffer.scala 386:74]
  wire [3:0] _GEN_15 = _stateVec_0_wsameblock_inflight_T ? sameBlockInflightMask : waitInflightMask_0; // @[Sbuffer.scala 204:29 387:40 388:38]
  wire  _GEN_16 = firstInsertVec[0] | stateVec_0_state_valid; // @[Sbuffer.scala 207:25 384:32 385:40]
  wire  _GEN_17 = firstInsertVec[0] ? |sameBlockInflightMask : stateVec_0_wsameblock_inflight; // @[Sbuffer.scala 207:25 384:32 386:49]
  wire [3:0] _GEN_18 = firstInsertVec[0] ? _GEN_15 : waitInflightMask_0; // @[Sbuffer.scala 204:29 384:32]
  wire [20:0] _GEN_19 = firstInsertVec[0] ? 21'h0 : cohCount_0; // @[Sbuffer.scala 208:25 384:32 390:28]
  wire [29:0] _GEN_20 = firstInsertVec[0] ? inptags_0 : ptag_0; // @[Sbuffer.scala 201:17 384:32 392:24]
  wire [32:0] _GEN_21 = firstInsertVec[0] ? invtags_0 : vtag_0; // @[Sbuffer.scala 202:17 384:32 393:24]
  wire [3:0] _GEN_22 = _stateVec_0_wsameblock_inflight_T ? sameBlockInflightMask : waitInflightMask_1; // @[Sbuffer.scala 204:29 387:40 388:38]
  wire  _GEN_23 = firstInsertVec[1] | stateVec_1_state_valid; // @[Sbuffer.scala 207:25 384:32 385:40]
  wire  _GEN_24 = firstInsertVec[1] ? |sameBlockInflightMask : stateVec_1_wsameblock_inflight; // @[Sbuffer.scala 207:25 384:32 386:49]
  wire [3:0] _GEN_25 = firstInsertVec[1] ? _GEN_22 : waitInflightMask_1; // @[Sbuffer.scala 204:29 384:32]
  wire [20:0] _GEN_26 = firstInsertVec[1] ? 21'h0 : cohCount_1; // @[Sbuffer.scala 208:25 384:32 390:28]
  wire [29:0] _GEN_27 = firstInsertVec[1] ? inptags_0 : ptag_1; // @[Sbuffer.scala 201:17 384:32 392:24]
  wire [32:0] _GEN_28 = firstInsertVec[1] ? invtags_0 : vtag_1; // @[Sbuffer.scala 202:17 384:32 393:24]
  wire [3:0] _GEN_29 = _stateVec_0_wsameblock_inflight_T ? sameBlockInflightMask : waitInflightMask_2; // @[Sbuffer.scala 204:29 387:40 388:38]
  wire  _GEN_30 = firstInsertVec[2] | stateVec_2_state_valid; // @[Sbuffer.scala 207:25 384:32 385:40]
  wire  _GEN_31 = firstInsertVec[2] ? |sameBlockInflightMask : stateVec_2_wsameblock_inflight; // @[Sbuffer.scala 207:25 384:32 386:49]
  wire [3:0] _GEN_32 = firstInsertVec[2] ? _GEN_29 : waitInflightMask_2; // @[Sbuffer.scala 204:29 384:32]
  wire [20:0] _GEN_33 = firstInsertVec[2] ? 21'h0 : cohCount_2; // @[Sbuffer.scala 208:25 384:32 390:28]
  wire [29:0] _GEN_34 = firstInsertVec[2] ? inptags_0 : ptag_2; // @[Sbuffer.scala 201:17 384:32 392:24]
  wire [32:0] _GEN_35 = firstInsertVec[2] ? invtags_0 : vtag_2; // @[Sbuffer.scala 202:17 384:32 393:24]
  wire [3:0] _GEN_36 = _stateVec_0_wsameblock_inflight_T ? sameBlockInflightMask : waitInflightMask_3; // @[Sbuffer.scala 204:29 387:40 388:38]
  wire  _GEN_37 = firstInsertVec[3] | stateVec_3_state_valid; // @[Sbuffer.scala 207:25 384:32 385:40]
  wire  _GEN_38 = firstInsertVec[3] ? |sameBlockInflightMask : stateVec_3_wsameblock_inflight; // @[Sbuffer.scala 207:25 384:32 386:49]
  wire [3:0] _GEN_39 = firstInsertVec[3] ? _GEN_36 : waitInflightMask_3; // @[Sbuffer.scala 204:29 384:32]
  wire [20:0] _GEN_40 = firstInsertVec[3] ? 21'h0 : cohCount_3; // @[Sbuffer.scala 208:25 384:32 390:28]
  wire [29:0] _GEN_41 = firstInsertVec[3] ? inptags_0 : ptag_3; // @[Sbuffer.scala 201:17 384:32 392:24]
  wire [32:0] _GEN_42 = firstInsertVec[3] ? invtags_0 : vtag_3; // @[Sbuffer.scala 202:17 384:32 393:24]
  wire [20:0] _GEN_44 = canMerge_0 ? _GEN_4 : _GEN_19; // @[Sbuffer.scala 438:24]
  wire  _GEN_45 = canMerge_0 & _GEN_14; // @[Sbuffer.scala 438:24]
  wire [20:0] _GEN_46 = canMerge_0 ? _GEN_7 : _GEN_26; // @[Sbuffer.scala 438:24]
  wire [20:0] _GEN_47 = canMerge_0 ? _GEN_10 : _GEN_33; // @[Sbuffer.scala 438:24]
  wire [20:0] _GEN_48 = canMerge_0 ? _GEN_13 : _GEN_40; // @[Sbuffer.scala 438:24]
  wire  _GEN_49 = canMerge_0 ? stateVec_0_state_valid : _GEN_16; // @[Sbuffer.scala 438:24 207:25]
  wire  _GEN_50 = canMerge_0 ? stateVec_0_wsameblock_inflight : _GEN_17; // @[Sbuffer.scala 438:24 207:25]
  wire [3:0] _GEN_51 = canMerge_0 ? waitInflightMask_0 : _GEN_18; // @[Sbuffer.scala 438:24 204:29]
  wire [29:0] _GEN_52 = canMerge_0 ? ptag_0 : _GEN_20; // @[Sbuffer.scala 201:17 438:24]
  wire [32:0] _GEN_53 = canMerge_0 ? vtag_0 : _GEN_21; // @[Sbuffer.scala 202:17 438:24]
  wire  _GEN_54 = canMerge_0 ? stateVec_1_state_valid : _GEN_23; // @[Sbuffer.scala 438:24 207:25]
  wire  _GEN_55 = canMerge_0 ? stateVec_1_wsameblock_inflight : _GEN_24; // @[Sbuffer.scala 438:24 207:25]
  wire [3:0] _GEN_56 = canMerge_0 ? waitInflightMask_1 : _GEN_25; // @[Sbuffer.scala 438:24 204:29]
  wire [29:0] _GEN_57 = canMerge_0 ? ptag_1 : _GEN_27; // @[Sbuffer.scala 201:17 438:24]
  wire [32:0] _GEN_58 = canMerge_0 ? vtag_1 : _GEN_28; // @[Sbuffer.scala 202:17 438:24]
  wire  _GEN_59 = canMerge_0 ? stateVec_2_state_valid : _GEN_30; // @[Sbuffer.scala 438:24 207:25]
  wire  _GEN_60 = canMerge_0 ? stateVec_2_wsameblock_inflight : _GEN_31; // @[Sbuffer.scala 438:24 207:25]
  wire [3:0] _GEN_61 = canMerge_0 ? waitInflightMask_2 : _GEN_32; // @[Sbuffer.scala 438:24 204:29]
  wire [29:0] _GEN_62 = canMerge_0 ? ptag_2 : _GEN_34; // @[Sbuffer.scala 201:17 438:24]
  wire [32:0] _GEN_63 = canMerge_0 ? vtag_2 : _GEN_35; // @[Sbuffer.scala 202:17 438:24]
  wire  _GEN_64 = canMerge_0 ? stateVec_3_state_valid : _GEN_37; // @[Sbuffer.scala 438:24 207:25]
  wire  _GEN_65 = canMerge_0 ? stateVec_3_wsameblock_inflight : _GEN_38; // @[Sbuffer.scala 438:24 207:25]
  wire [3:0] _GEN_66 = canMerge_0 ? waitInflightMask_3 : _GEN_39; // @[Sbuffer.scala 438:24 204:29]
  wire [29:0] _GEN_67 = canMerge_0 ? ptag_3 : _GEN_41; // @[Sbuffer.scala 201:17 438:24]
  wire [32:0] _GEN_68 = canMerge_0 ? vtag_3 : _GEN_42; // @[Sbuffer.scala 202:17 438:24]
  wire [20:0] _GEN_70 = _T_32 ? _GEN_44 : cohCount_0; // @[Sbuffer.scala 437:20 208:25]
  wire  _GEN_71 = _T_32 & _GEN_45; // @[Sbuffer.scala 437:20]
  wire [20:0] _GEN_72 = _T_32 ? _GEN_46 : cohCount_1; // @[Sbuffer.scala 437:20 208:25]
  wire [20:0] _GEN_73 = _T_32 ? _GEN_47 : cohCount_2; // @[Sbuffer.scala 437:20 208:25]
  wire [20:0] _GEN_74 = _T_32 ? _GEN_48 : cohCount_3; // @[Sbuffer.scala 437:20 208:25]
  wire  _GEN_75 = _T_32 ? _GEN_49 : stateVec_0_state_valid; // @[Sbuffer.scala 437:20 207:25]
  wire  _GEN_76 = _T_32 ? _GEN_50 : stateVec_0_wsameblock_inflight; // @[Sbuffer.scala 437:20 207:25]
  wire [3:0] _GEN_77 = _T_32 ? _GEN_51 : waitInflightMask_0; // @[Sbuffer.scala 437:20 204:29]
  wire [29:0] _GEN_78 = _T_32 ? _GEN_52 : ptag_0; // @[Sbuffer.scala 201:17 437:20]
  wire [32:0] _GEN_79 = _T_32 ? _GEN_53 : vtag_0; // @[Sbuffer.scala 202:17 437:20]
  wire  _GEN_80 = _T_32 ? _GEN_54 : stateVec_1_state_valid; // @[Sbuffer.scala 437:20 207:25]
  wire  _GEN_81 = _T_32 ? _GEN_55 : stateVec_1_wsameblock_inflight; // @[Sbuffer.scala 437:20 207:25]
  wire [3:0] _GEN_82 = _T_32 ? _GEN_56 : waitInflightMask_1; // @[Sbuffer.scala 437:20 204:29]
  wire [29:0] _GEN_83 = _T_32 ? _GEN_57 : ptag_1; // @[Sbuffer.scala 201:17 437:20]
  wire [32:0] _GEN_84 = _T_32 ? _GEN_58 : vtag_1; // @[Sbuffer.scala 202:17 437:20]
  wire  _GEN_85 = _T_32 ? _GEN_59 : stateVec_2_state_valid; // @[Sbuffer.scala 437:20 207:25]
  wire  _GEN_86 = _T_32 ? _GEN_60 : stateVec_2_wsameblock_inflight; // @[Sbuffer.scala 437:20 207:25]
  wire [3:0] _GEN_87 = _T_32 ? _GEN_61 : waitInflightMask_2; // @[Sbuffer.scala 437:20 204:29]
  wire [29:0] _GEN_88 = _T_32 ? _GEN_62 : ptag_2; // @[Sbuffer.scala 201:17 437:20]
  wire [32:0] _GEN_89 = _T_32 ? _GEN_63 : vtag_2; // @[Sbuffer.scala 202:17 437:20]
  wire  _GEN_90 = _T_32 ? _GEN_64 : stateVec_3_state_valid; // @[Sbuffer.scala 437:20 207:25]
  wire  _GEN_91 = _T_32 ? _GEN_65 : stateVec_3_wsameblock_inflight; // @[Sbuffer.scala 437:20 207:25]
  wire [3:0] _GEN_92 = _T_32 ? _GEN_66 : waitInflightMask_3; // @[Sbuffer.scala 437:20 204:29]
  wire [29:0] _GEN_93 = _T_32 ? _GEN_67 : ptag_3; // @[Sbuffer.scala 201:17 437:20]
  wire [32:0] _GEN_94 = _T_32 ? _GEN_68 : vtag_3; // @[Sbuffer.scala 202:17 437:20]
  wire [1:0] insertIdx_hi_1 = secondInsertVec[3:2]; // @[OneHot.scala 30:18]
  wire [1:0] insertIdx_lo_1 = secondInsertVec[1:0]; // @[OneHot.scala 31:18]
  wire  _insertIdx_T_3 = |insertIdx_hi_1; // @[OneHot.scala 32:14]
  wire [1:0] _insertIdx_T_4 = insertIdx_hi_1 | insertIdx_lo_1; // @[OneHot.scala 32:28]
  wire [1:0] insertIdx_1 = {_insertIdx_T_3,_insertIdx_T_4[1]}; // @[Cat.scala 31:58]
  wire  _GEN_95 = invtags_1 != vtag_0 | _GEN_71; // @[Sbuffer.scala 412:42 419:34]
  wire  _GEN_97 = mergeVec_1[0] ? _GEN_95 : _GEN_71; // @[Sbuffer.scala 408:32]
  wire  _GEN_98 = invtags_1 != vtag_1 | _GEN_97; // @[Sbuffer.scala 412:42 419:34]
  wire  _GEN_100 = mergeVec_1[1] ? _GEN_98 : _GEN_97; // @[Sbuffer.scala 408:32]
  wire  _GEN_101 = invtags_1 != vtag_2 | _GEN_100; // @[Sbuffer.scala 412:42 419:34]
  wire  _GEN_103 = mergeVec_1[2] ? _GEN_101 : _GEN_100; // @[Sbuffer.scala 408:32]
  wire  _GEN_104 = invtags_1 != vtag_3 | _GEN_103; // @[Sbuffer.scala 412:42 419:34]
  wire  _sameBlockInflightMask_mask_T_9 = stateVec_0_state_inflight & _T_38; // @[Sbuffer.scala 526:54]
  wire  _sameBlockInflightMask_mask_T_11 = stateVec_1_state_inflight & _T_40; // @[Sbuffer.scala 526:54]
  wire  _sameBlockInflightMask_mask_T_13 = stateVec_2_state_inflight & _T_42; // @[Sbuffer.scala 526:54]
  wire  _sameBlockInflightMask_mask_T_15 = stateVec_3_state_inflight & _T_44; // @[Sbuffer.scala 526:54]
  wire [3:0] sameBlockInflightMask_1 = {_sameBlockInflightMask_mask_T_15,_sameBlockInflightMask_mask_T_13,
    _sameBlockInflightMask_mask_T_11,_sameBlockInflightMask_mask_T_9}; // @[Sbuffer.scala 526:79]
  wire  _stateVec_0_wsameblock_inflight_T_1 = |sameBlockInflightMask_1; // @[Sbuffer.scala 386:74]
  wire  _GEN_108 = secondInsertVec[0] | _GEN_75; // @[Sbuffer.scala 384:32 385:40]
  wire  _GEN_109 = secondInsertVec[0] ? |sameBlockInflightMask_1 : _GEN_76; // @[Sbuffer.scala 384:32 386:49]
  wire  _GEN_115 = secondInsertVec[1] | _GEN_80; // @[Sbuffer.scala 384:32 385:40]
  wire  _GEN_116 = secondInsertVec[1] ? |sameBlockInflightMask_1 : _GEN_81; // @[Sbuffer.scala 384:32 386:49]
  wire  _GEN_122 = secondInsertVec[2] | _GEN_85; // @[Sbuffer.scala 384:32 385:40]
  wire  _GEN_123 = secondInsertVec[2] ? |sameBlockInflightMask_1 : _GEN_86; // @[Sbuffer.scala 384:32 386:49]
  wire  _GEN_129 = secondInsertVec[3] | _GEN_90; // @[Sbuffer.scala 384:32 385:40]
  wire  _GEN_130 = secondInsertVec[3] ? |sameBlockInflightMask_1 : _GEN_91; // @[Sbuffer.scala 384:32 386:49]
  wire  _GEN_141 = canMerge_1 ? _GEN_75 : _GEN_108; // @[Sbuffer.scala 438:24]
  wire  _GEN_146 = canMerge_1 ? _GEN_80 : _GEN_115; // @[Sbuffer.scala 438:24]
  wire  _GEN_151 = canMerge_1 ? _GEN_85 : _GEN_122; // @[Sbuffer.scala 438:24]
  wire  _GEN_156 = canMerge_1 ? _GEN_90 : _GEN_129; // @[Sbuffer.scala 438:24]
  wire  _GEN_167 = _T_58 ? _GEN_141 : _GEN_75; // @[Sbuffer.scala 437:20]
  wire  _GEN_172 = _T_58 ? _GEN_146 : _GEN_80; // @[Sbuffer.scala 437:20]
  wire  _GEN_177 = _T_58 ? _GEN_151 : _GEN_85; // @[Sbuffer.scala 437:20]
  wire  _GEN_182 = _T_58 ? _GEN_156 : _GEN_90; // @[Sbuffer.scala 437:20]
  wire [3:0] _sbuffer_empty_T = {invalidMask_0,invalidMask_1,invalidMask_2,invalidMask_3}; // @[Cat.scala 31:58]
  wire  sbuffer_empty = &_sbuffer_empty_T; // @[Sbuffer.scala 474:44]
  wire [1:0] _sq_empty_T = {io_in_0_valid,io_in_1_valid}; // @[Cat.scala 31:58]
  wire  sq_empty = ~(|_sq_empty_T); // @[Sbuffer.scala 475:18]
  wire  empty = sbuffer_empty & sq_empty; // @[Sbuffer.scala 476:29]
  reg [4:0] threshold; // @[Sbuffer.scala 477:26]
  wire [1:0] _validCount_T = _cohTimeOutMask_T_2 + _cohTimeOutMask_T_6; // @[Bitwise.scala 48:55]
  wire [1:0] _validCount_T_2 = _cohTimeOutMask_T_10 + _cohTimeOutMask_T_14; // @[Bitwise.scala 48:55]
  wire [2:0] validCount = _validCount_T + _validCount_T_2; // @[Bitwise.scala 48:55]
  wire [4:0] _GEN_2265 = {{2'd0}, validCount}; // @[Sbuffer.scala 479:40]
  reg  io_flush_empty_REG; // @[Sbuffer.scala 484:28]
  wire [1:0] _GEN_191 = sbuffer_empty ? 2'h0 : sbuffer_state; // @[Sbuffer.scala 504:32 505:23 222:30]
  wire [1:0] _GEN_193 = ~do_eviction ? 2'h0 : sbuffer_state; // @[Sbuffer.scala 513:31 514:23 222:30]
  wire [1:0] _GEN_194 = do_uarch_drain ? 2'h3 : _GEN_193; // @[Sbuffer.scala 511:33 512:23]
  wire [1:0] _GEN_195 = io_flush_valid ? 2'h2 : _GEN_194; // @[Sbuffer.scala 509:27 510:23]
  wire [1:0] _sbuffer_out_s0_evictionIdx_T = cohHasTimeOut ? cohTimeOutIdx : replaceIdx; // @[Sbuffer.scala 565:10]
  wire [1:0] _sbuffer_out_s0_evictionIdx_T_1 = need_drain ? drainIdx : _sbuffer_out_s0_evictionIdx_T; // @[Sbuffer.scala 563:8]
  wire [1:0] sbuffer_out_s0_evictionIdx = missqReplayHasTimeOut ? missqReplayTimeOutIdx :
    _sbuffer_out_s0_evictionIdx_T_1; // @[Sbuffer.scala 561:39]
  wire  _GEN_201 = 2'h1 == sbuffer_out_s0_evictionIdx ? stateVec_1_state_inflight : stateVec_0_state_inflight; // @[Sbuffer.scala 71:{53,53}]
  wire  _GEN_202 = 2'h2 == sbuffer_out_s0_evictionIdx ? stateVec_2_state_inflight : _GEN_201; // @[Sbuffer.scala 71:{53,53}]
  wire  _GEN_203 = 2'h3 == sbuffer_out_s0_evictionIdx ? stateVec_3_state_inflight : _GEN_202; // @[Sbuffer.scala 71:{53,53}]
  wire  _GEN_205 = 2'h1 == sbuffer_out_s0_evictionIdx ? stateVec_1_state_valid : stateVec_0_state_valid; // @[Sbuffer.scala 71:{50,50}]
  wire  _GEN_206 = 2'h2 == sbuffer_out_s0_evictionIdx ? stateVec_2_state_valid : _GEN_205; // @[Sbuffer.scala 71:{50,50}]
  wire  _GEN_207 = 2'h3 == sbuffer_out_s0_evictionIdx ? stateVec_3_state_valid : _GEN_206; // @[Sbuffer.scala 71:{50,50}]
  wire  _GEN_209 = 2'h1 == sbuffer_out_s0_evictionIdx ? stateVec_1_wsameblock_inflight :
    stateVec_0_wsameblock_inflight; // @[Sbuffer.scala 71:{72,72}]
  wire  _GEN_210 = 2'h2 == sbuffer_out_s0_evictionIdx ? stateVec_2_wsameblock_inflight : _GEN_209; // @[Sbuffer.scala 71:{72,72}]
  wire  _GEN_211 = 2'h3 == sbuffer_out_s0_evictionIdx ? stateVec_3_wsameblock_inflight : _GEN_210; // @[Sbuffer.scala 71:{72,72}]
  wire  _sbuffer_out_s0_valid_T_3 = _GEN_207 & ~_GEN_203 & ~_GEN_211; // @[Sbuffer.scala 71:69]
  wire  _sbuffer_out_s0_valid_T_5 = need_drain | cohHasTimeOut | need_replace; // @[Sbuffer.scala 573:34]
  wire  _sbuffer_out_s0_valid_T_6 = _sbuffer_out_s0_valid_T_3 & _sbuffer_out_s0_valid_T_5; // @[Sbuffer.scala 572:65]
  wire  sbuffer_out_s0_valid = missqReplayHasTimeOut | _sbuffer_out_s0_valid_T_6; // @[Sbuffer.scala 571:52]
  wire  sbuffer_out_s0_fire = sbuffer_out_s0_valid & sbuffer_out_s0_cango; // @[Sbuffer.scala 579:47]
  wire [3:0] _shouldWaitWriteFinish_T = 4'h1 << sbuffer_out_s0_evictionIdx; // @[OneHot.scala 57:35]
  wire [3:0] _shouldWaitWriteFinish_T_1 = dataModule_io_writeReq_0_bits_wvec & _shouldWaitWriteFinish_T; // @[Sbuffer.scala 587:35]
  wire  _shouldWaitWriteFinish_T_3 = |_shouldWaitWriteFinish_T_1 & dataModule_io_writeReq_0_valid; // @[Sbuffer.scala 587:86]
  wire [3:0] _shouldWaitWriteFinish_T_5 = dataModule_io_writeReq_1_bits_wvec & _shouldWaitWriteFinish_T; // @[Sbuffer.scala 587:35]
  wire  _shouldWaitWriteFinish_T_7 = |_shouldWaitWriteFinish_T_5 & dataModule_io_writeReq_1_valid; // @[Sbuffer.scala 587:86]
  wire [1:0] _shouldWaitWriteFinish_T_8 = {_shouldWaitWriteFinish_T_7,_shouldWaitWriteFinish_T_3}; // @[Sbuffer.scala 589:6]
  wire  sbuffer_out_s1_fire = io_dcache_req_ready & io_dcache_req_valid; // @[Decoupled.scala 50:35]
  wire  _GEN_218 = 2'h0 == sbuffer_out_s0_evictionIdx | stateVec_0_state_inflight; // @[Sbuffer.scala 207:25 606:{57,57}]
  wire  _GEN_219 = 2'h1 == sbuffer_out_s0_evictionIdx | stateVec_1_state_inflight; // @[Sbuffer.scala 207:25 606:{57,57}]
  wire  _GEN_220 = 2'h2 == sbuffer_out_s0_evictionIdx | stateVec_2_state_inflight; // @[Sbuffer.scala 207:25 606:{57,57}]
  wire  _GEN_221 = 2'h3 == sbuffer_out_s0_evictionIdx | stateVec_3_state_inflight; // @[Sbuffer.scala 207:25 606:{57,57}]
  wire  _GEN_222 = 2'h0 == sbuffer_out_s0_evictionIdx ? 1'h0 : stateVec_0_wtimeout; // @[Sbuffer.scala 207:25 607:{52,52}]
  wire  _GEN_223 = 2'h1 == sbuffer_out_s0_evictionIdx ? 1'h0 : stateVec_1_wtimeout; // @[Sbuffer.scala 207:25 607:{52,52}]
  wire  _GEN_224 = 2'h2 == sbuffer_out_s0_evictionIdx ? 1'h0 : stateVec_2_wtimeout; // @[Sbuffer.scala 207:25 607:{52,52}]
  wire  _GEN_225 = 2'h3 == sbuffer_out_s0_evictionIdx ? 1'h0 : stateVec_3_wtimeout; // @[Sbuffer.scala 207:25 607:{52,52}]
  wire  _GEN_226 = sbuffer_out_s0_fire ? _GEN_218 : stateVec_0_state_inflight; // @[Sbuffer.scala 207:25 605:28]
  wire  _GEN_227 = sbuffer_out_s0_fire ? _GEN_219 : stateVec_1_state_inflight; // @[Sbuffer.scala 207:25 605:28]
  wire  _GEN_228 = sbuffer_out_s0_fire ? _GEN_220 : stateVec_2_state_inflight; // @[Sbuffer.scala 207:25 605:28]
  wire  _GEN_229 = sbuffer_out_s0_fire ? _GEN_221 : stateVec_3_state_inflight; // @[Sbuffer.scala 207:25 605:28]
  wire  _GEN_230 = sbuffer_out_s0_fire ? _GEN_222 : stateVec_0_wtimeout; // @[Sbuffer.scala 207:25 605:28]
  wire  _GEN_231 = sbuffer_out_s0_fire ? _GEN_223 : stateVec_1_wtimeout; // @[Sbuffer.scala 207:25 605:28]
  wire  _GEN_232 = sbuffer_out_s0_fire ? _GEN_224 : stateVec_2_wtimeout; // @[Sbuffer.scala 207:25 605:28]
  wire  _GEN_233 = sbuffer_out_s0_fire ? _GEN_225 : stateVec_3_wtimeout; // @[Sbuffer.scala 207:25 605:28]
  reg [1:0] sbuffer_out_s1_evictionIdx; // @[Reg.scala 16:16]
  reg [29:0] sbuffer_out_s1_evictionPTag; // @[Reg.scala 16:16]
  reg [32:0] sbuffer_out_s1_evictionVTag; // @[Reg.scala 16:16]
  wire [7:0] _GEN_249 = dataModule_io_dataOut_0_0_1; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_250 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_0_1 : _GEN_249; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_251 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_0_1 : _GEN_250; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_252 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_0_1 : _GEN_251; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_253 = dataModule_io_dataOut_0_0_0; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_254 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_0_0 : _GEN_253; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_255 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_0_0 : _GEN_254; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_256 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_0_0 : _GEN_255; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_257 = dataModule_io_dataOut_0_0_3; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_258 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_0_3 : _GEN_257; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_259 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_0_3 : _GEN_258; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_260 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_0_3 : _GEN_259; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_261 = dataModule_io_dataOut_0_0_2; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_262 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_0_2 : _GEN_261; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_263 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_0_2 : _GEN_262; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_264 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_0_2 : _GEN_263; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_265 = dataModule_io_dataOut_0_0_5; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_266 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_0_5 : _GEN_265; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_267 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_0_5 : _GEN_266; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_268 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_0_5 : _GEN_267; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_269 = dataModule_io_dataOut_0_0_4; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_270 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_0_4 : _GEN_269; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_271 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_0_4 : _GEN_270; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_272 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_0_4 : _GEN_271; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_273 = dataModule_io_dataOut_0_0_7; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_274 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_0_7 : _GEN_273; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_275 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_0_7 : _GEN_274; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_276 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_0_7 : _GEN_275; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_277 = dataModule_io_dataOut_0_0_6; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_278 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_0_6 : _GEN_277; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_279 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_0_6 : _GEN_278; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_280 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_0_6 : _GEN_279; // @[Sbuffer.scala 630:{64,64}]
  wire [63:0] io_dcache_req_bits_data_lo_lo_lo = {_GEN_276,_GEN_280,_GEN_268,_GEN_272,_GEN_260,_GEN_264,_GEN_252,
    _GEN_256}; // @[Sbuffer.scala 630:64]
  wire [7:0] _GEN_281 = dataModule_io_dataOut_0_0_9; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_282 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_0_9 : _GEN_281; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_283 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_0_9 : _GEN_282; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_284 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_0_9 : _GEN_283; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_285 = dataModule_io_dataOut_0_0_8; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_286 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_0_8 : _GEN_285; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_287 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_0_8 : _GEN_286; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_288 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_0_8 : _GEN_287; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_289 = dataModule_io_dataOut_0_0_11; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_290 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_0_11 : _GEN_289; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_291 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_0_11 : _GEN_290; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_292 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_0_11 : _GEN_291; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_293 = dataModule_io_dataOut_0_0_10; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_294 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_0_10 : _GEN_293; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_295 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_0_10 : _GEN_294; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_296 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_0_10 : _GEN_295; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_297 = dataModule_io_dataOut_0_0_13; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_298 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_0_13 : _GEN_297; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_299 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_0_13 : _GEN_298; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_300 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_0_13 : _GEN_299; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_301 = dataModule_io_dataOut_0_0_12; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_302 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_0_12 : _GEN_301; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_303 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_0_12 : _GEN_302; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_304 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_0_12 : _GEN_303; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_305 = dataModule_io_dataOut_0_0_15; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_306 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_0_15 : _GEN_305; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_307 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_0_15 : _GEN_306; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_308 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_0_15 : _GEN_307; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_309 = dataModule_io_dataOut_0_0_14; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_310 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_0_14 : _GEN_309; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_311 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_0_14 : _GEN_310; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_312 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_0_14 : _GEN_311; // @[Sbuffer.scala 630:{64,64}]
  wire [127:0] io_dcache_req_bits_data_lo_lo = {_GEN_308,_GEN_312,_GEN_300,_GEN_304,_GEN_292,_GEN_296,_GEN_284,_GEN_288,
    io_dcache_req_bits_data_lo_lo_lo}; // @[Sbuffer.scala 630:64]
  wire [7:0] _GEN_313 = dataModule_io_dataOut_0_1_1; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_314 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_1_1 : _GEN_313; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_315 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_1_1 : _GEN_314; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_316 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_1_1 : _GEN_315; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_317 = dataModule_io_dataOut_0_1_0; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_318 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_1_0 : _GEN_317; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_319 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_1_0 : _GEN_318; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_320 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_1_0 : _GEN_319; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_321 = dataModule_io_dataOut_0_1_3; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_322 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_1_3 : _GEN_321; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_323 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_1_3 : _GEN_322; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_324 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_1_3 : _GEN_323; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_325 = dataModule_io_dataOut_0_1_2; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_326 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_1_2 : _GEN_325; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_327 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_1_2 : _GEN_326; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_328 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_1_2 : _GEN_327; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_329 = dataModule_io_dataOut_0_1_5; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_330 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_1_5 : _GEN_329; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_331 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_1_5 : _GEN_330; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_332 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_1_5 : _GEN_331; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_333 = dataModule_io_dataOut_0_1_4; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_334 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_1_4 : _GEN_333; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_335 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_1_4 : _GEN_334; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_336 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_1_4 : _GEN_335; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_337 = dataModule_io_dataOut_0_1_7; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_338 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_1_7 : _GEN_337; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_339 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_1_7 : _GEN_338; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_340 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_1_7 : _GEN_339; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_341 = dataModule_io_dataOut_0_1_6; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_342 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_1_6 : _GEN_341; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_343 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_1_6 : _GEN_342; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_344 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_1_6 : _GEN_343; // @[Sbuffer.scala 630:{64,64}]
  wire [63:0] io_dcache_req_bits_data_lo_hi_lo = {_GEN_340,_GEN_344,_GEN_332,_GEN_336,_GEN_324,_GEN_328,_GEN_316,
    _GEN_320}; // @[Sbuffer.scala 630:64]
  wire [7:0] _GEN_345 = dataModule_io_dataOut_0_1_9; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_346 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_1_9 : _GEN_345; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_347 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_1_9 : _GEN_346; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_348 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_1_9 : _GEN_347; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_349 = dataModule_io_dataOut_0_1_8; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_350 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_1_8 : _GEN_349; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_351 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_1_8 : _GEN_350; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_352 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_1_8 : _GEN_351; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_353 = dataModule_io_dataOut_0_1_11; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_354 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_1_11 : _GEN_353; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_355 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_1_11 : _GEN_354; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_356 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_1_11 : _GEN_355; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_357 = dataModule_io_dataOut_0_1_10; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_358 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_1_10 : _GEN_357; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_359 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_1_10 : _GEN_358; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_360 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_1_10 : _GEN_359; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_361 = dataModule_io_dataOut_0_1_13; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_362 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_1_13 : _GEN_361; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_363 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_1_13 : _GEN_362; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_364 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_1_13 : _GEN_363; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_365 = dataModule_io_dataOut_0_1_12; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_366 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_1_12 : _GEN_365; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_367 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_1_12 : _GEN_366; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_368 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_1_12 : _GEN_367; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_369 = dataModule_io_dataOut_0_1_15; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_370 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_1_15 : _GEN_369; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_371 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_1_15 : _GEN_370; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_372 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_1_15 : _GEN_371; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_373 = dataModule_io_dataOut_0_1_14; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_374 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_1_14 : _GEN_373; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_375 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_1_14 : _GEN_374; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_376 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_1_14 : _GEN_375; // @[Sbuffer.scala 630:{64,64}]
  wire [255:0] io_dcache_req_bits_data_lo = {_GEN_372,_GEN_376,_GEN_364,_GEN_368,_GEN_356,_GEN_360,_GEN_348,_GEN_352,
    io_dcache_req_bits_data_lo_hi_lo,io_dcache_req_bits_data_lo_lo}; // @[Sbuffer.scala 630:64]
  wire [7:0] _GEN_377 = dataModule_io_dataOut_0_2_1; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_378 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_2_1 : _GEN_377; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_379 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_2_1 : _GEN_378; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_380 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_2_1 : _GEN_379; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_381 = dataModule_io_dataOut_0_2_0; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_382 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_2_0 : _GEN_381; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_383 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_2_0 : _GEN_382; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_384 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_2_0 : _GEN_383; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_385 = dataModule_io_dataOut_0_2_3; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_386 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_2_3 : _GEN_385; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_387 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_2_3 : _GEN_386; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_388 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_2_3 : _GEN_387; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_389 = dataModule_io_dataOut_0_2_2; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_390 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_2_2 : _GEN_389; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_391 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_2_2 : _GEN_390; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_392 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_2_2 : _GEN_391; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_393 = dataModule_io_dataOut_0_2_5; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_394 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_2_5 : _GEN_393; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_395 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_2_5 : _GEN_394; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_396 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_2_5 : _GEN_395; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_397 = dataModule_io_dataOut_0_2_4; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_398 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_2_4 : _GEN_397; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_399 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_2_4 : _GEN_398; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_400 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_2_4 : _GEN_399; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_401 = dataModule_io_dataOut_0_2_7; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_402 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_2_7 : _GEN_401; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_403 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_2_7 : _GEN_402; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_404 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_2_7 : _GEN_403; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_405 = dataModule_io_dataOut_0_2_6; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_406 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_2_6 : _GEN_405; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_407 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_2_6 : _GEN_406; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_408 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_2_6 : _GEN_407; // @[Sbuffer.scala 630:{64,64}]
  wire [63:0] io_dcache_req_bits_data_hi_lo_lo = {_GEN_404,_GEN_408,_GEN_396,_GEN_400,_GEN_388,_GEN_392,_GEN_380,
    _GEN_384}; // @[Sbuffer.scala 630:64]
  wire [7:0] _GEN_409 = dataModule_io_dataOut_0_2_9; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_410 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_2_9 : _GEN_409; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_411 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_2_9 : _GEN_410; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_412 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_2_9 : _GEN_411; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_413 = dataModule_io_dataOut_0_2_8; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_414 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_2_8 : _GEN_413; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_415 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_2_8 : _GEN_414; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_416 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_2_8 : _GEN_415; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_417 = dataModule_io_dataOut_0_2_11; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_418 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_2_11 : _GEN_417; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_419 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_2_11 : _GEN_418; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_420 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_2_11 : _GEN_419; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_421 = dataModule_io_dataOut_0_2_10; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_422 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_2_10 : _GEN_421; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_423 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_2_10 : _GEN_422; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_424 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_2_10 : _GEN_423; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_425 = dataModule_io_dataOut_0_2_13; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_426 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_2_13 : _GEN_425; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_427 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_2_13 : _GEN_426; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_428 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_2_13 : _GEN_427; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_429 = dataModule_io_dataOut_0_2_12; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_430 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_2_12 : _GEN_429; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_431 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_2_12 : _GEN_430; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_432 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_2_12 : _GEN_431; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_433 = dataModule_io_dataOut_0_2_15; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_434 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_2_15 : _GEN_433; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_435 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_2_15 : _GEN_434; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_436 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_2_15 : _GEN_435; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_437 = dataModule_io_dataOut_0_2_14; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_438 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_2_14 : _GEN_437; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_439 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_2_14 : _GEN_438; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_440 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_2_14 : _GEN_439; // @[Sbuffer.scala 630:{64,64}]
  wire [127:0] io_dcache_req_bits_data_hi_lo = {_GEN_436,_GEN_440,_GEN_428,_GEN_432,_GEN_420,_GEN_424,_GEN_412,_GEN_416,
    io_dcache_req_bits_data_hi_lo_lo}; // @[Sbuffer.scala 630:64]
  wire [7:0] _GEN_441 = dataModule_io_dataOut_0_3_1; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_442 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_3_1 : _GEN_441; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_443 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_3_1 : _GEN_442; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_444 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_3_1 : _GEN_443; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_445 = dataModule_io_dataOut_0_3_0; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_446 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_3_0 : _GEN_445; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_447 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_3_0 : _GEN_446; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_448 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_3_0 : _GEN_447; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_449 = dataModule_io_dataOut_0_3_3; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_450 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_3_3 : _GEN_449; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_451 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_3_3 : _GEN_450; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_452 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_3_3 : _GEN_451; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_453 = dataModule_io_dataOut_0_3_2; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_454 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_3_2 : _GEN_453; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_455 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_3_2 : _GEN_454; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_456 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_3_2 : _GEN_455; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_457 = dataModule_io_dataOut_0_3_5; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_458 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_3_5 : _GEN_457; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_459 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_3_5 : _GEN_458; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_460 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_3_5 : _GEN_459; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_461 = dataModule_io_dataOut_0_3_4; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_462 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_3_4 : _GEN_461; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_463 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_3_4 : _GEN_462; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_464 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_3_4 : _GEN_463; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_465 = dataModule_io_dataOut_0_3_7; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_466 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_3_7 : _GEN_465; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_467 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_3_7 : _GEN_466; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_468 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_3_7 : _GEN_467; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_469 = dataModule_io_dataOut_0_3_6; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_470 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_3_6 : _GEN_469; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_471 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_3_6 : _GEN_470; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_472 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_3_6 : _GEN_471; // @[Sbuffer.scala 630:{64,64}]
  wire [63:0] io_dcache_req_bits_data_hi_hi_lo = {_GEN_468,_GEN_472,_GEN_460,_GEN_464,_GEN_452,_GEN_456,_GEN_444,
    _GEN_448}; // @[Sbuffer.scala 630:64]
  wire [7:0] _GEN_473 = dataModule_io_dataOut_0_3_9; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_474 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_3_9 : _GEN_473; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_475 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_3_9 : _GEN_474; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_476 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_3_9 : _GEN_475; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_477 = dataModule_io_dataOut_0_3_8; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_478 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_3_8 : _GEN_477; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_479 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_3_8 : _GEN_478; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_480 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_3_8 : _GEN_479; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_481 = dataModule_io_dataOut_0_3_11; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_482 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_3_11 : _GEN_481; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_483 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_3_11 : _GEN_482; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_484 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_3_11 : _GEN_483; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_485 = dataModule_io_dataOut_0_3_10; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_486 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_3_10 : _GEN_485; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_487 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_3_10 : _GEN_486; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_488 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_3_10 : _GEN_487; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_489 = dataModule_io_dataOut_0_3_13; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_490 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_3_13 : _GEN_489; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_491 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_3_13 : _GEN_490; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_492 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_3_13 : _GEN_491; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_493 = dataModule_io_dataOut_0_3_12; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_494 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_3_12 : _GEN_493; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_495 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_3_12 : _GEN_494; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_496 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_3_12 : _GEN_495; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_497 = dataModule_io_dataOut_0_3_15; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_498 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_3_15 : _GEN_497; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_499 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_3_15 : _GEN_498; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_500 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_3_15 : _GEN_499; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_501 = dataModule_io_dataOut_0_3_14; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_502 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_1_3_14 : _GEN_501; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_503 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_2_3_14 : _GEN_502; // @[Sbuffer.scala 630:{64,64}]
  wire [7:0] _GEN_504 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_dataOut_3_3_14 : _GEN_503; // @[Sbuffer.scala 630:{64,64}]
  wire [255:0] io_dcache_req_bits_data_hi = {_GEN_500,_GEN_504,_GEN_492,_GEN_496,_GEN_484,_GEN_488,_GEN_476,_GEN_480,
    io_dcache_req_bits_data_hi_hi_lo,io_dcache_req_bits_data_hi_lo}; // @[Sbuffer.scala 630:64]
  wire  _GEN_505 = dataModule_io_maskOut_0_0_1; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_506 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_0_1 : dataModule_io_maskOut_0_0_1; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_507 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_0_1 : _GEN_506; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_508 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_0_1 : _GEN_507; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_509 = dataModule_io_maskOut_0_0_0; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_510 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_0_0 : dataModule_io_maskOut_0_0_0; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_511 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_0_0 : _GEN_510; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_512 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_0_0 : _GEN_511; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_513 = dataModule_io_maskOut_0_0_3; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_514 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_0_3 : dataModule_io_maskOut_0_0_3; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_515 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_0_3 : _GEN_514; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_516 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_0_3 : _GEN_515; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_517 = dataModule_io_maskOut_0_0_2; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_518 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_0_2 : dataModule_io_maskOut_0_0_2; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_519 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_0_2 : _GEN_518; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_520 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_0_2 : _GEN_519; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_521 = dataModule_io_maskOut_0_0_5; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_522 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_0_5 : dataModule_io_maskOut_0_0_5; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_523 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_0_5 : _GEN_522; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_524 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_0_5 : _GEN_523; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_525 = dataModule_io_maskOut_0_0_4; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_526 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_0_4 : dataModule_io_maskOut_0_0_4; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_527 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_0_4 : _GEN_526; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_528 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_0_4 : _GEN_527; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_529 = dataModule_io_maskOut_0_0_7; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_530 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_0_7 : dataModule_io_maskOut_0_0_7; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_531 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_0_7 : _GEN_530; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_532 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_0_7 : _GEN_531; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_533 = dataModule_io_maskOut_0_0_6; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_534 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_0_6 : dataModule_io_maskOut_0_0_6; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_535 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_0_6 : _GEN_534; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_536 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_0_6 : _GEN_535; // @[Sbuffer.scala 631:{64,64}]
  wire [7:0] io_dcache_req_bits_mask_lo_lo_lo = {_GEN_532,_GEN_536,_GEN_524,_GEN_528,_GEN_516,_GEN_520,_GEN_508,_GEN_512
    }; // @[Sbuffer.scala 631:64]
  wire  _GEN_537 = dataModule_io_maskOut_0_0_9; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_538 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_0_9 : dataModule_io_maskOut_0_0_9; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_539 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_0_9 : _GEN_538; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_540 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_0_9 : _GEN_539; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_541 = dataModule_io_maskOut_0_0_8; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_542 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_0_8 : dataModule_io_maskOut_0_0_8; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_543 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_0_8 : _GEN_542; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_544 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_0_8 : _GEN_543; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_545 = dataModule_io_maskOut_0_0_11; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_546 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_0_11 : dataModule_io_maskOut_0_0_11; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_547 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_0_11 : _GEN_546; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_548 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_0_11 : _GEN_547; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_549 = dataModule_io_maskOut_0_0_10; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_550 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_0_10 : dataModule_io_maskOut_0_0_10; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_551 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_0_10 : _GEN_550; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_552 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_0_10 : _GEN_551; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_553 = dataModule_io_maskOut_0_0_13; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_554 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_0_13 : dataModule_io_maskOut_0_0_13; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_555 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_0_13 : _GEN_554; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_556 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_0_13 : _GEN_555; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_557 = dataModule_io_maskOut_0_0_12; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_558 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_0_12 : dataModule_io_maskOut_0_0_12; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_559 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_0_12 : _GEN_558; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_560 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_0_12 : _GEN_559; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_561 = dataModule_io_maskOut_0_0_15; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_562 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_0_15 : dataModule_io_maskOut_0_0_15; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_563 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_0_15 : _GEN_562; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_564 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_0_15 : _GEN_563; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_565 = dataModule_io_maskOut_0_0_14; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_566 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_0_14 : dataModule_io_maskOut_0_0_14; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_567 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_0_14 : _GEN_566; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_568 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_0_14 : _GEN_567; // @[Sbuffer.scala 631:{64,64}]
  wire [15:0] io_dcache_req_bits_mask_lo_lo = {_GEN_564,_GEN_568,_GEN_556,_GEN_560,_GEN_548,_GEN_552,_GEN_540,_GEN_544,
    io_dcache_req_bits_mask_lo_lo_lo}; // @[Sbuffer.scala 631:64]
  wire  _GEN_570 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_1_1 : dataModule_io_maskOut_0_1_1; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_571 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_1_1 : _GEN_570; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_572 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_1_1 : _GEN_571; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_574 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_1_0 : dataModule_io_maskOut_0_1_0; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_575 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_1_0 : _GEN_574; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_576 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_1_0 : _GEN_575; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_578 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_1_3 : dataModule_io_maskOut_0_1_3; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_579 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_1_3 : _GEN_578; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_580 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_1_3 : _GEN_579; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_582 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_1_2 : dataModule_io_maskOut_0_1_2; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_583 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_1_2 : _GEN_582; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_584 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_1_2 : _GEN_583; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_586 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_1_5 : dataModule_io_maskOut_0_1_5; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_587 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_1_5 : _GEN_586; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_588 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_1_5 : _GEN_587; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_590 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_1_4 : dataModule_io_maskOut_0_1_4; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_591 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_1_4 : _GEN_590; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_592 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_1_4 : _GEN_591; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_594 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_1_7 : dataModule_io_maskOut_0_1_7; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_595 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_1_7 : _GEN_594; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_596 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_1_7 : _GEN_595; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_598 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_1_6 : dataModule_io_maskOut_0_1_6; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_599 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_1_6 : _GEN_598; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_600 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_1_6 : _GEN_599; // @[Sbuffer.scala 631:{64,64}]
  wire [7:0] io_dcache_req_bits_mask_lo_hi_lo = {_GEN_596,_GEN_600,_GEN_588,_GEN_592,_GEN_580,_GEN_584,_GEN_572,_GEN_576
    }; // @[Sbuffer.scala 631:64]
  wire  _GEN_602 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_1_9 : dataModule_io_maskOut_0_1_9; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_603 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_1_9 : _GEN_602; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_604 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_1_9 : _GEN_603; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_606 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_1_8 : dataModule_io_maskOut_0_1_8; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_607 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_1_8 : _GEN_606; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_608 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_1_8 : _GEN_607; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_610 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_1_11 : dataModule_io_maskOut_0_1_11; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_611 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_1_11 : _GEN_610; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_612 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_1_11 : _GEN_611; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_614 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_1_10 : dataModule_io_maskOut_0_1_10; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_615 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_1_10 : _GEN_614; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_616 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_1_10 : _GEN_615; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_618 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_1_13 : dataModule_io_maskOut_0_1_13; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_619 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_1_13 : _GEN_618; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_620 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_1_13 : _GEN_619; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_622 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_1_12 : dataModule_io_maskOut_0_1_12; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_623 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_1_12 : _GEN_622; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_624 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_1_12 : _GEN_623; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_626 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_1_15 : dataModule_io_maskOut_0_1_15; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_627 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_1_15 : _GEN_626; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_628 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_1_15 : _GEN_627; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_630 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_1_14 : dataModule_io_maskOut_0_1_14; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_631 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_1_14 : _GEN_630; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_632 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_1_14 : _GEN_631; // @[Sbuffer.scala 631:{64,64}]
  wire [31:0] io_dcache_req_bits_mask_lo = {_GEN_628,_GEN_632,_GEN_620,_GEN_624,_GEN_612,_GEN_616,_GEN_604,_GEN_608,
    io_dcache_req_bits_mask_lo_hi_lo,io_dcache_req_bits_mask_lo_lo}; // @[Sbuffer.scala 631:64]
  wire  _GEN_634 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_2_1 : dataModule_io_maskOut_0_2_1; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_635 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_2_1 : _GEN_634; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_636 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_2_1 : _GEN_635; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_638 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_2_0 : dataModule_io_maskOut_0_2_0; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_639 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_2_0 : _GEN_638; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_640 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_2_0 : _GEN_639; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_642 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_2_3 : dataModule_io_maskOut_0_2_3; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_643 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_2_3 : _GEN_642; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_644 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_2_3 : _GEN_643; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_646 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_2_2 : dataModule_io_maskOut_0_2_2; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_647 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_2_2 : _GEN_646; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_648 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_2_2 : _GEN_647; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_650 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_2_5 : dataModule_io_maskOut_0_2_5; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_651 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_2_5 : _GEN_650; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_652 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_2_5 : _GEN_651; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_654 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_2_4 : dataModule_io_maskOut_0_2_4; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_655 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_2_4 : _GEN_654; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_656 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_2_4 : _GEN_655; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_658 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_2_7 : dataModule_io_maskOut_0_2_7; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_659 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_2_7 : _GEN_658; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_660 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_2_7 : _GEN_659; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_662 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_2_6 : dataModule_io_maskOut_0_2_6; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_663 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_2_6 : _GEN_662; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_664 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_2_6 : _GEN_663; // @[Sbuffer.scala 631:{64,64}]
  wire [7:0] io_dcache_req_bits_mask_hi_lo_lo = {_GEN_660,_GEN_664,_GEN_652,_GEN_656,_GEN_644,_GEN_648,_GEN_636,_GEN_640
    }; // @[Sbuffer.scala 631:64]
  wire  _GEN_666 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_2_9 : dataModule_io_maskOut_0_2_9; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_667 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_2_9 : _GEN_666; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_668 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_2_9 : _GEN_667; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_670 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_2_8 : dataModule_io_maskOut_0_2_8; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_671 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_2_8 : _GEN_670; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_672 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_2_8 : _GEN_671; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_674 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_2_11 : dataModule_io_maskOut_0_2_11; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_675 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_2_11 : _GEN_674; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_676 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_2_11 : _GEN_675; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_678 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_2_10 : dataModule_io_maskOut_0_2_10; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_679 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_2_10 : _GEN_678; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_680 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_2_10 : _GEN_679; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_682 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_2_13 : dataModule_io_maskOut_0_2_13; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_683 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_2_13 : _GEN_682; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_684 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_2_13 : _GEN_683; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_686 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_2_12 : dataModule_io_maskOut_0_2_12; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_687 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_2_12 : _GEN_686; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_688 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_2_12 : _GEN_687; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_690 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_2_15 : dataModule_io_maskOut_0_2_15; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_691 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_2_15 : _GEN_690; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_692 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_2_15 : _GEN_691; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_694 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_2_14 : dataModule_io_maskOut_0_2_14; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_695 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_2_14 : _GEN_694; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_696 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_2_14 : _GEN_695; // @[Sbuffer.scala 631:{64,64}]
  wire [15:0] io_dcache_req_bits_mask_hi_lo = {_GEN_692,_GEN_696,_GEN_684,_GEN_688,_GEN_676,_GEN_680,_GEN_668,_GEN_672,
    io_dcache_req_bits_mask_hi_lo_lo}; // @[Sbuffer.scala 631:64]
  wire  _GEN_698 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_3_1 : dataModule_io_maskOut_0_3_1; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_699 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_3_1 : _GEN_698; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_700 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_3_1 : _GEN_699; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_702 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_3_0 : dataModule_io_maskOut_0_3_0; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_703 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_3_0 : _GEN_702; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_704 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_3_0 : _GEN_703; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_706 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_3_3 : dataModule_io_maskOut_0_3_3; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_707 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_3_3 : _GEN_706; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_708 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_3_3 : _GEN_707; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_710 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_3_2 : dataModule_io_maskOut_0_3_2; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_711 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_3_2 : _GEN_710; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_712 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_3_2 : _GEN_711; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_714 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_3_5 : dataModule_io_maskOut_0_3_5; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_715 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_3_5 : _GEN_714; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_716 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_3_5 : _GEN_715; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_718 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_3_4 : dataModule_io_maskOut_0_3_4; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_719 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_3_4 : _GEN_718; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_720 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_3_4 : _GEN_719; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_722 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_3_7 : dataModule_io_maskOut_0_3_7; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_723 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_3_7 : _GEN_722; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_724 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_3_7 : _GEN_723; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_726 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_3_6 : dataModule_io_maskOut_0_3_6; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_727 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_3_6 : _GEN_726; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_728 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_3_6 : _GEN_727; // @[Sbuffer.scala 631:{64,64}]
  wire [7:0] io_dcache_req_bits_mask_hi_hi_lo = {_GEN_724,_GEN_728,_GEN_716,_GEN_720,_GEN_708,_GEN_712,_GEN_700,_GEN_704
    }; // @[Sbuffer.scala 631:64]
  wire  _GEN_730 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_3_9 : dataModule_io_maskOut_0_3_9; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_731 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_3_9 : _GEN_730; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_732 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_3_9 : _GEN_731; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_734 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_3_8 : dataModule_io_maskOut_0_3_8; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_735 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_3_8 : _GEN_734; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_736 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_3_8 : _GEN_735; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_738 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_3_11 : dataModule_io_maskOut_0_3_11; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_739 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_3_11 : _GEN_738; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_740 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_3_11 : _GEN_739; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_742 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_3_10 : dataModule_io_maskOut_0_3_10; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_743 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_3_10 : _GEN_742; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_744 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_3_10 : _GEN_743; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_746 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_3_13 : dataModule_io_maskOut_0_3_13; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_747 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_3_13 : _GEN_746; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_748 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_3_13 : _GEN_747; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_750 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_3_12 : dataModule_io_maskOut_0_3_12; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_751 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_3_12 : _GEN_750; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_752 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_3_12 : _GEN_751; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_754 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_3_15 : dataModule_io_maskOut_0_3_15; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_755 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_3_15 : _GEN_754; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_756 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_3_15 : _GEN_755; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_758 = 2'h1 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_1_3_14 : dataModule_io_maskOut_0_3_14; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_759 = 2'h2 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_2_3_14 : _GEN_758; // @[Sbuffer.scala 631:{64,64}]
  wire  _GEN_760 = 2'h3 == sbuffer_out_s1_evictionIdx ? dataModule_io_maskOut_3_3_14 : _GEN_759; // @[Sbuffer.scala 631:{64,64}]
  wire [31:0] io_dcache_req_bits_mask_hi = {_GEN_756,_GEN_760,_GEN_748,_GEN_752,_GEN_740,_GEN_744,_GEN_732,_GEN_736,
    io_dcache_req_bits_mask_hi_hi_lo,io_dcache_req_bits_mask_hi_lo}; // @[Sbuffer.scala 631:64]
  wire  _GEN_761 = 2'h0 == io_dcache_main_pipe_hit_resp_bits_id[1:0] ? 1'h0 : _GEN_226; // @[Sbuffer.scala 654:{47,47}]
  wire  _GEN_762 = 2'h1 == io_dcache_main_pipe_hit_resp_bits_id[1:0] ? 1'h0 : _GEN_227; // @[Sbuffer.scala 654:{47,47}]
  wire  _GEN_763 = 2'h2 == io_dcache_main_pipe_hit_resp_bits_id[1:0] ? 1'h0 : _GEN_228; // @[Sbuffer.scala 654:{47,47}]
  wire  _GEN_764 = 2'h3 == io_dcache_main_pipe_hit_resp_bits_id[1:0] ? 1'h0 : _GEN_229; // @[Sbuffer.scala 654:{47,47}]
  wire  _GEN_765 = 2'h0 == io_dcache_main_pipe_hit_resp_bits_id[1:0] ? 1'h0 : _GEN_167; // @[Sbuffer.scala 655:{44,44}]
  wire  _GEN_766 = 2'h1 == io_dcache_main_pipe_hit_resp_bits_id[1:0] ? 1'h0 : _GEN_172; // @[Sbuffer.scala 655:{44,44}]
  wire  _GEN_767 = 2'h2 == io_dcache_main_pipe_hit_resp_bits_id[1:0] ? 1'h0 : _GEN_177; // @[Sbuffer.scala 655:{44,44}]
  wire  _GEN_768 = 2'h3 == io_dcache_main_pipe_hit_resp_bits_id[1:0] ? 1'h0 : _GEN_182; // @[Sbuffer.scala 655:{44,44}]
  wire  _GEN_773 = io_dcache_main_pipe_hit_resp_valid ? _GEN_761 : _GEN_226; // @[Sbuffer.scala 653:24]
  wire  _GEN_774 = io_dcache_main_pipe_hit_resp_valid ? _GEN_762 : _GEN_227; // @[Sbuffer.scala 653:24]
  wire  _GEN_775 = io_dcache_main_pipe_hit_resp_valid ? _GEN_763 : _GEN_228; // @[Sbuffer.scala 653:24]
  wire  _GEN_776 = io_dcache_main_pipe_hit_resp_valid ? _GEN_764 : _GEN_229; // @[Sbuffer.scala 653:24]
  wire  _GEN_777 = io_dcache_main_pipe_hit_resp_valid ? _GEN_765 : _GEN_167; // @[Sbuffer.scala 653:24]
  wire  _GEN_778 = io_dcache_main_pipe_hit_resp_valid ? _GEN_766 : _GEN_172; // @[Sbuffer.scala 653:24]
  wire  _GEN_779 = io_dcache_main_pipe_hit_resp_valid ? _GEN_767 : _GEN_177; // @[Sbuffer.scala 653:24]
  wire  _GEN_780 = io_dcache_main_pipe_hit_resp_valid ? _GEN_768 : _GEN_182; // @[Sbuffer.scala 653:24]
  wire  _T_281 = stateVec_0_wsameblock_inflight & stateVec_0_state_valid; // @[Sbuffer.scala 668:42]
  reg  REG; // @[Sbuffer.scala 670:16]
  wire  _T_282 = _T_281 & REG; // @[Sbuffer.scala 669:33]
  reg [1:0] REG_1; // @[Sbuffer.scala 671:49]
  wire [3:0] _T_284 = 4'h1 << REG_1; // @[OneHot.scala 57:35]
  wire  _T_285 = waitInflightMask_0 == _T_284; // @[Sbuffer.scala 671:29]
  wire  _T_286 = _T_282 & _T_285; // @[Sbuffer.scala 670:30]
  wire  _T_287 = stateVec_1_wsameblock_inflight & stateVec_1_state_valid; // @[Sbuffer.scala 668:42]
  reg  REG_2; // @[Sbuffer.scala 670:16]
  wire  _T_288 = _T_287 & REG_2; // @[Sbuffer.scala 669:33]
  reg [1:0] REG_3; // @[Sbuffer.scala 671:49]
  wire [3:0] _T_290 = 4'h1 << REG_3; // @[OneHot.scala 57:35]
  wire  _T_291 = waitInflightMask_1 == _T_290; // @[Sbuffer.scala 671:29]
  wire  _T_292 = _T_288 & _T_291; // @[Sbuffer.scala 670:30]
  wire  _T_293 = stateVec_2_wsameblock_inflight & stateVec_2_state_valid; // @[Sbuffer.scala 668:42]
  reg  REG_4; // @[Sbuffer.scala 670:16]
  wire  _T_294 = _T_293 & REG_4; // @[Sbuffer.scala 669:33]
  reg [1:0] REG_5; // @[Sbuffer.scala 671:49]
  wire [3:0] _T_296 = 4'h1 << REG_5; // @[OneHot.scala 57:35]
  wire  _T_297 = waitInflightMask_2 == _T_296; // @[Sbuffer.scala 671:29]
  wire  _T_298 = _T_294 & _T_297; // @[Sbuffer.scala 670:30]
  wire  _T_299 = stateVec_3_wsameblock_inflight & stateVec_3_state_valid; // @[Sbuffer.scala 668:42]
  reg  REG_6; // @[Sbuffer.scala 670:16]
  wire  _T_300 = _T_299 & REG_6; // @[Sbuffer.scala 669:33]
  reg [1:0] REG_7; // @[Sbuffer.scala 671:49]
  wire [3:0] _T_302 = 4'h1 << REG_7; // @[OneHot.scala 57:35]
  wire  _T_303 = waitInflightMask_3 == _T_302; // @[Sbuffer.scala 671:29]
  wire  _T_304 = _T_300 & _T_303; // @[Sbuffer.scala 670:30]
  reg  REG_8; // @[Sbuffer.scala 670:16]
  wire  _T_321 = _T_281 & REG_8; // @[Sbuffer.scala 669:33]
  reg [1:0] REG_9; // @[Sbuffer.scala 671:49]
  wire [3:0] _T_323 = 4'h1 << REG_9; // @[OneHot.scala 57:35]
  wire  _T_324 = waitInflightMask_0 == _T_323; // @[Sbuffer.scala 671:29]
  wire  _T_325 = _T_321 & _T_324; // @[Sbuffer.scala 670:30]
  reg  REG_10; // @[Sbuffer.scala 670:16]
  wire  _T_327 = _T_287 & REG_10; // @[Sbuffer.scala 669:33]
  reg [1:0] REG_11; // @[Sbuffer.scala 671:49]
  wire [3:0] _T_329 = 4'h1 << REG_11; // @[OneHot.scala 57:35]
  wire  _T_330 = waitInflightMask_1 == _T_329; // @[Sbuffer.scala 671:29]
  wire  _T_331 = _T_327 & _T_330; // @[Sbuffer.scala 670:30]
  reg  REG_12; // @[Sbuffer.scala 670:16]
  wire  _T_333 = _T_293 & REG_12; // @[Sbuffer.scala 669:33]
  reg [1:0] REG_13; // @[Sbuffer.scala 671:49]
  wire [3:0] _T_335 = 4'h1 << REG_13; // @[OneHot.scala 57:35]
  wire  _T_336 = waitInflightMask_2 == _T_335; // @[Sbuffer.scala 671:29]
  wire  _T_337 = _T_333 & _T_336; // @[Sbuffer.scala 670:30]
  reg  REG_14; // @[Sbuffer.scala 670:16]
  wire  _T_339 = _T_299 & REG_14; // @[Sbuffer.scala 669:33]
  reg [1:0] REG_15; // @[Sbuffer.scala 671:49]
  wire [3:0] _T_341 = 4'h1 << REG_15; // @[OneHot.scala 57:35]
  wire  _T_342 = waitInflightMask_3 == _T_341; // @[Sbuffer.scala 671:29]
  wire  _T_343 = _T_339 & _T_342; // @[Sbuffer.scala 670:30]
  wire [15:0] _dataModule_io_maskFlushReq_0_bits_wvec_T = 16'h1 << io_dcache_main_pipe_hit_resp_bits_id; // @[OneHot.scala 57:35]
  wire [15:0] _dataModule_io_maskFlushReq_1_bits_wvec_T = 16'h1 << io_dcache_refill_hit_resp_bits_id; // @[OneHot.scala 57:35]
  wire  _GEN_813 = 2'h0 == io_dcache_replay_resp_bits_id[1:0] | _GEN_230; // @[Sbuffer.scala 687:{40,40}]
  wire  _GEN_814 = 2'h1 == io_dcache_replay_resp_bits_id[1:0] | _GEN_231; // @[Sbuffer.scala 687:{40,40}]
  wire  _GEN_815 = 2'h2 == io_dcache_replay_resp_bits_id[1:0] | _GEN_232; // @[Sbuffer.scala 687:{40,40}]
  wire  _GEN_816 = 2'h3 == io_dcache_replay_resp_bits_id[1:0] | _GEN_233; // @[Sbuffer.scala 687:{40,40}]
  wire [4:0] _missqReplayCount_0_T_1 = missqReplayCount_0 + 5'h1; // @[Sbuffer.scala 696:50]
  wire [20:0] _cohCount_0_T_1 = cohCount_0 + 21'h1; // @[Sbuffer.scala 699:33]
  wire [4:0] _missqReplayCount_1_T_1 = missqReplayCount_1 + 5'h1; // @[Sbuffer.scala 696:50]
  wire [20:0] _cohCount_1_T_1 = cohCount_1 + 21'h1; // @[Sbuffer.scala 699:33]
  wire [4:0] _missqReplayCount_2_T_1 = missqReplayCount_2 + 5'h1; // @[Sbuffer.scala 696:50]
  wire [20:0] _cohCount_2_T_1 = cohCount_2 + 21'h1; // @[Sbuffer.scala 699:33]
  wire [4:0] _missqReplayCount_3_T_1 = missqReplayCount_3 + 5'h1; // @[Sbuffer.scala 696:50]
  wire [20:0] _cohCount_3_T_1 = cohCount_3 + 21'h1; // @[Sbuffer.scala 699:33]
  reg  tag_mismatch_REG; // @[Sbuffer.scala 726:31]
  reg  tag_mismatch_REG_7; // @[Sbuffer.scala 727:14]
  reg [29:0] ptag_matches_r6; // @[Reg.scala 16:16]
  reg [29:0] ptag_matches_r7; // @[Reg.scala 16:16]
  wire  ptag_matches__3 = ptag_matches_r6 == ptag_matches_r7; // @[Sbuffer.scala 724:80]
  reg  tag_mismatch_REG_8; // @[Sbuffer.scala 727:62]
  wire  _tag_mismatch_T_11 = tag_mismatch_REG_7 != ptag_matches__3 & tag_mismatch_REG_8; // @[Sbuffer.scala 727:52]
  reg  tag_mismatch_REG_5; // @[Sbuffer.scala 727:14]
  reg [29:0] ptag_matches_r4; // @[Reg.scala 16:16]
  reg [29:0] ptag_matches_r5; // @[Reg.scala 16:16]
  wire  ptag_matches__2 = ptag_matches_r4 == ptag_matches_r5; // @[Sbuffer.scala 724:80]
  reg  tag_mismatch_REG_6; // @[Sbuffer.scala 727:62]
  wire  _tag_mismatch_T_8 = tag_mismatch_REG_5 != ptag_matches__2 & tag_mismatch_REG_6; // @[Sbuffer.scala 727:52]
  reg  tag_mismatch_REG_3; // @[Sbuffer.scala 727:14]
  reg [29:0] ptag_matches_r2; // @[Reg.scala 16:16]
  reg [29:0] ptag_matches_r3; // @[Reg.scala 16:16]
  wire  ptag_matches__1 = ptag_matches_r2 == ptag_matches_r3; // @[Sbuffer.scala 724:80]
  reg  tag_mismatch_REG_4; // @[Sbuffer.scala 727:62]
  wire  _tag_mismatch_T_5 = tag_mismatch_REG_3 != ptag_matches__1 & tag_mismatch_REG_4; // @[Sbuffer.scala 727:52]
  reg  tag_mismatch_REG_1; // @[Sbuffer.scala 727:14]
  reg [29:0] ptag_matches_r; // @[Reg.scala 16:16]
  reg [29:0] ptag_matches_r1; // @[Reg.scala 16:16]
  wire  ptag_matches__0 = ptag_matches_r == ptag_matches_r1; // @[Sbuffer.scala 724:80]
  reg  tag_mismatch_REG_2; // @[Sbuffer.scala 727:62]
  wire  _tag_mismatch_T_2 = tag_mismatch_REG_1 != ptag_matches__0 & tag_mismatch_REG_2; // @[Sbuffer.scala 727:52]
  wire [3:0] _tag_mismatch_T_12 = {_tag_mismatch_T_11,_tag_mismatch_T_8,_tag_mismatch_T_5,_tag_mismatch_T_2}; // @[Sbuffer.scala 728:8]
  wire  _tag_mismatch_T_13 = |_tag_mismatch_T_12; // @[Sbuffer.scala 728:15]
  wire  tag_mismatch = tag_mismatch_REG & _tag_mismatch_T_13; // @[Sbuffer.scala 726:47]
  reg  tag_mismatch_REG_9; // @[Sbuffer.scala 726:31]
  reg  tag_mismatch_REG_16; // @[Sbuffer.scala 727:14]
  reg [29:0] ptag_matches_r14; // @[Reg.scala 16:16]
  reg [29:0] ptag_matches_r15; // @[Reg.scala 16:16]
  wire  ptag_matches_1_3 = ptag_matches_r14 == ptag_matches_r15; // @[Sbuffer.scala 724:80]
  reg  tag_mismatch_REG_17; // @[Sbuffer.scala 727:62]
  wire  _tag_mismatch_T_25 = tag_mismatch_REG_16 != ptag_matches_1_3 & tag_mismatch_REG_17; // @[Sbuffer.scala 727:52]
  reg  tag_mismatch_REG_14; // @[Sbuffer.scala 727:14]
  reg [29:0] ptag_matches_r12; // @[Reg.scala 16:16]
  reg [29:0] ptag_matches_r13; // @[Reg.scala 16:16]
  wire  ptag_matches_1_2 = ptag_matches_r12 == ptag_matches_r13; // @[Sbuffer.scala 724:80]
  reg  tag_mismatch_REG_15; // @[Sbuffer.scala 727:62]
  wire  _tag_mismatch_T_22 = tag_mismatch_REG_14 != ptag_matches_1_2 & tag_mismatch_REG_15; // @[Sbuffer.scala 727:52]
  reg  tag_mismatch_REG_12; // @[Sbuffer.scala 727:14]
  reg [29:0] ptag_matches_r10; // @[Reg.scala 16:16]
  reg [29:0] ptag_matches_r11; // @[Reg.scala 16:16]
  wire  ptag_matches_1_1 = ptag_matches_r10 == ptag_matches_r11; // @[Sbuffer.scala 724:80]
  reg  tag_mismatch_REG_13; // @[Sbuffer.scala 727:62]
  wire  _tag_mismatch_T_19 = tag_mismatch_REG_12 != ptag_matches_1_1 & tag_mismatch_REG_13; // @[Sbuffer.scala 727:52]
  reg  tag_mismatch_REG_10; // @[Sbuffer.scala 727:14]
  reg [29:0] ptag_matches_r8; // @[Reg.scala 16:16]
  reg [29:0] ptag_matches_r9; // @[Reg.scala 16:16]
  wire  ptag_matches_1_0 = ptag_matches_r8 == ptag_matches_r9; // @[Sbuffer.scala 724:80]
  reg  tag_mismatch_REG_11; // @[Sbuffer.scala 727:62]
  wire  _tag_mismatch_T_16 = tag_mismatch_REG_10 != ptag_matches_1_0 & tag_mismatch_REG_11; // @[Sbuffer.scala 727:52]
  wire [3:0] _tag_mismatch_T_26 = {_tag_mismatch_T_25,_tag_mismatch_T_22,_tag_mismatch_T_19,_tag_mismatch_T_16}; // @[Sbuffer.scala 728:8]
  wire  _tag_mismatch_T_27 = |_tag_mismatch_T_26; // @[Sbuffer.scala 728:15]
  wire  tag_mismatch_1 = tag_mismatch_REG_9 & _tag_mismatch_T_27; // @[Sbuffer.scala 726:47]
  wire  vtag_matches__0 = vtag_0 == io_forward_0_vaddr[38:6]; // @[Sbuffer.scala 722:54]
  wire  vtag_matches__1 = vtag_1 == io_forward_0_vaddr[38:6]; // @[Sbuffer.scala 722:54]
  wire  vtag_matches__2 = vtag_2 == io_forward_0_vaddr[38:6]; // @[Sbuffer.scala 722:54]
  wire  vtag_matches__3 = vtag_3 == io_forward_0_vaddr[38:6]; // @[Sbuffer.scala 722:54]
  reg  valid_tag_match_reg_0; // @[Sbuffer.scala 743:60]
  reg  valid_tag_match_reg_1; // @[Sbuffer.scala 743:60]
  reg  valid_tag_match_reg_2; // @[Sbuffer.scala 743:60]
  reg  valid_tag_match_reg_3; // @[Sbuffer.scala 743:60]
  reg  inflight_tag_match_reg_0; // @[Sbuffer.scala 744:66]
  reg  inflight_tag_match_reg_1; // @[Sbuffer.scala 744:66]
  reg  inflight_tag_match_reg_2; // @[Sbuffer.scala 744:66]
  reg  inflight_tag_match_reg_3; // @[Sbuffer.scala 744:66]
  reg  forward_mask_candidate_reg__0_0; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__0_1; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__0_2; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__0_3; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__0_4; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__0_5; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__0_6; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__0_7; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__0_8; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__0_9; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__0_10; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__0_11; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__0_12; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__0_13; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__0_14; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__0_15; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__1_0; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__1_1; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__1_2; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__1_3; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__1_4; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__1_5; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__1_6; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__1_7; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__1_8; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__1_9; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__1_10; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__1_11; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__1_12; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__1_13; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__1_14; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__1_15; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__2_0; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__2_1; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__2_2; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__2_3; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__2_4; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__2_5; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__2_6; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__2_7; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__2_8; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__2_9; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__2_10; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__2_11; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__2_12; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__2_13; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__2_14; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__2_15; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__3_0; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__3_1; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__3_2; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__3_3; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__3_4; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__3_5; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__3_6; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__3_7; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__3_8; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__3_9; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__3_10; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__3_11; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__3_12; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__3_13; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__3_14; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg__3_15; // @[Reg.scala 16:16]
  wire [7:0] _GEN_1230 = dataModule_io_dataOut_1_0_0; // @[Sbuffer.scala 751:{14,14}]
  wire [7:0] _GEN_1234 = dataModule_io_dataOut_1_0_1; // @[Sbuffer.scala 751:{14,14}]
  wire [7:0] _GEN_1238 = dataModule_io_dataOut_1_0_2; // @[Sbuffer.scala 751:{14,14}]
  wire [7:0] _GEN_1242 = dataModule_io_dataOut_1_0_3; // @[Sbuffer.scala 751:{14,14}]
  wire [7:0] _GEN_1246 = dataModule_io_dataOut_1_0_4; // @[Sbuffer.scala 751:{14,14}]
  wire [7:0] _GEN_1250 = dataModule_io_dataOut_1_0_5; // @[Sbuffer.scala 751:{14,14}]
  wire [7:0] _GEN_1254 = dataModule_io_dataOut_1_0_6; // @[Sbuffer.scala 751:{14,14}]
  wire [7:0] _GEN_1258 = dataModule_io_dataOut_1_0_7; // @[Sbuffer.scala 751:{14,14}]
  wire [7:0] _GEN_1262 = dataModule_io_dataOut_1_0_8; // @[Sbuffer.scala 751:{14,14}]
  wire [7:0] _GEN_1266 = dataModule_io_dataOut_1_0_9; // @[Sbuffer.scala 751:{14,14}]
  wire [7:0] _GEN_1270 = dataModule_io_dataOut_1_0_10; // @[Sbuffer.scala 751:{14,14}]
  wire [7:0] _GEN_1274 = dataModule_io_dataOut_1_0_11; // @[Sbuffer.scala 751:{14,14}]
  wire [7:0] _GEN_1278 = dataModule_io_dataOut_1_0_12; // @[Sbuffer.scala 751:{14,14}]
  wire [7:0] _GEN_1282 = dataModule_io_dataOut_1_0_13; // @[Sbuffer.scala 751:{14,14}]
  wire [7:0] _GEN_1286 = dataModule_io_dataOut_1_0_14; // @[Sbuffer.scala 751:{14,14}]
  wire [7:0] _GEN_1290 = dataModule_io_dataOut_1_0_15; // @[Sbuffer.scala 751:{14,14}]
  wire [7:0] _GEN_1294 = dataModule_io_dataOut_2_0_0; // @[Sbuffer.scala 751:{14,14}]
  wire [7:0] _GEN_1298 = dataModule_io_dataOut_2_0_1; // @[Sbuffer.scala 751:{14,14}]
  wire [7:0] _GEN_1302 = dataModule_io_dataOut_2_0_2; // @[Sbuffer.scala 751:{14,14}]
  wire [7:0] _GEN_1306 = dataModule_io_dataOut_2_0_3; // @[Sbuffer.scala 751:{14,14}]
  wire [7:0] _GEN_1310 = dataModule_io_dataOut_2_0_4; // @[Sbuffer.scala 751:{14,14}]
  wire [7:0] _GEN_1314 = dataModule_io_dataOut_2_0_5; // @[Sbuffer.scala 751:{14,14}]
  wire [7:0] _GEN_1318 = dataModule_io_dataOut_2_0_6; // @[Sbuffer.scala 751:{14,14}]
  wire [7:0] _GEN_1322 = dataModule_io_dataOut_2_0_7; // @[Sbuffer.scala 751:{14,14}]
  wire [7:0] _GEN_1326 = dataModule_io_dataOut_2_0_8; // @[Sbuffer.scala 751:{14,14}]
  wire [7:0] _GEN_1330 = dataModule_io_dataOut_2_0_9; // @[Sbuffer.scala 751:{14,14}]
  wire [7:0] _GEN_1334 = dataModule_io_dataOut_2_0_10; // @[Sbuffer.scala 751:{14,14}]
  wire [7:0] _GEN_1338 = dataModule_io_dataOut_2_0_11; // @[Sbuffer.scala 751:{14,14}]
  wire [7:0] _GEN_1342 = dataModule_io_dataOut_2_0_12; // @[Sbuffer.scala 751:{14,14}]
  wire [7:0] _GEN_1346 = dataModule_io_dataOut_2_0_13; // @[Sbuffer.scala 751:{14,14}]
  wire [7:0] _GEN_1350 = dataModule_io_dataOut_2_0_14; // @[Sbuffer.scala 751:{14,14}]
  wire [7:0] _GEN_1354 = dataModule_io_dataOut_2_0_15; // @[Sbuffer.scala 751:{14,14}]
  wire [7:0] _GEN_1358 = dataModule_io_dataOut_3_0_0; // @[Sbuffer.scala 751:{14,14}]
  wire [7:0] _GEN_1362 = dataModule_io_dataOut_3_0_1; // @[Sbuffer.scala 751:{14,14}]
  wire [7:0] _GEN_1366 = dataModule_io_dataOut_3_0_2; // @[Sbuffer.scala 751:{14,14}]
  wire [7:0] _GEN_1370 = dataModule_io_dataOut_3_0_3; // @[Sbuffer.scala 751:{14,14}]
  wire [7:0] _GEN_1374 = dataModule_io_dataOut_3_0_4; // @[Sbuffer.scala 751:{14,14}]
  wire [7:0] _GEN_1378 = dataModule_io_dataOut_3_0_5; // @[Sbuffer.scala 751:{14,14}]
  wire [7:0] _GEN_1382 = dataModule_io_dataOut_3_0_6; // @[Sbuffer.scala 751:{14,14}]
  wire [7:0] _GEN_1386 = dataModule_io_dataOut_3_0_7; // @[Sbuffer.scala 751:{14,14}]
  wire [7:0] _GEN_1390 = dataModule_io_dataOut_3_0_8; // @[Sbuffer.scala 751:{14,14}]
  wire [7:0] _GEN_1394 = dataModule_io_dataOut_3_0_9; // @[Sbuffer.scala 751:{14,14}]
  wire [7:0] _GEN_1398 = dataModule_io_dataOut_3_0_10; // @[Sbuffer.scala 751:{14,14}]
  wire [7:0] _GEN_1402 = dataModule_io_dataOut_3_0_11; // @[Sbuffer.scala 751:{14,14}]
  wire [7:0] _GEN_1406 = dataModule_io_dataOut_3_0_12; // @[Sbuffer.scala 751:{14,14}]
  wire [7:0] _GEN_1410 = dataModule_io_dataOut_3_0_13; // @[Sbuffer.scala 751:{14,14}]
  wire [7:0] _GEN_1414 = dataModule_io_dataOut_3_0_14; // @[Sbuffer.scala 751:{14,14}]
  wire [7:0] _GEN_1418 = dataModule_io_dataOut_3_0_15; // @[Sbuffer.scala 751:{14,14}]
  reg [7:0] forward_data_candidate_reg__0_0; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__0_1; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__0_2; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__0_3; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__0_4; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__0_5; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__0_6; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__0_7; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__0_8; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__0_9; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__0_10; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__0_11; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__0_12; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__0_13; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__0_14; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__0_15; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__1_0; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__1_1; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__1_2; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__1_3; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__1_4; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__1_5; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__1_6; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__1_7; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__1_8; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__1_9; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__1_10; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__1_11; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__1_12; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__1_13; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__1_14; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__1_15; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__2_0; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__2_1; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__2_2; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__2_3; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__2_4; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__2_5; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__2_6; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__2_7; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__2_8; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__2_9; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__2_10; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__2_11; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__2_12; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__2_13; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__2_14; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__2_15; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__3_0; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__3_1; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__3_2; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__3_3; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__3_4; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__3_5; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__3_6; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__3_7; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__3_8; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__3_9; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__3_10; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__3_11; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__3_12; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__3_13; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__3_14; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg__3_15; // @[Reg.scala 16:16]
  wire  selectedValidMask_0_0 = valid_tag_match_reg_0 & forward_mask_candidate_reg__0_0 | valid_tag_match_reg_1 &
    forward_mask_candidate_reg__1_0 | valid_tag_match_reg_2 & forward_mask_candidate_reg__2_0 | valid_tag_match_reg_3 &
    forward_mask_candidate_reg__3_0; // @[Mux.scala 27:73]
  wire  selectedValidMask_0_1 = valid_tag_match_reg_0 & forward_mask_candidate_reg__0_1 | valid_tag_match_reg_1 &
    forward_mask_candidate_reg__1_1 | valid_tag_match_reg_2 & forward_mask_candidate_reg__2_1 | valid_tag_match_reg_3 &
    forward_mask_candidate_reg__3_1; // @[Mux.scala 27:73]
  wire  selectedValidMask_0_2 = valid_tag_match_reg_0 & forward_mask_candidate_reg__0_2 | valid_tag_match_reg_1 &
    forward_mask_candidate_reg__1_2 | valid_tag_match_reg_2 & forward_mask_candidate_reg__2_2 | valid_tag_match_reg_3 &
    forward_mask_candidate_reg__3_2; // @[Mux.scala 27:73]
  wire  selectedValidMask_0_3 = valid_tag_match_reg_0 & forward_mask_candidate_reg__0_3 | valid_tag_match_reg_1 &
    forward_mask_candidate_reg__1_3 | valid_tag_match_reg_2 & forward_mask_candidate_reg__2_3 | valid_tag_match_reg_3 &
    forward_mask_candidate_reg__3_3; // @[Mux.scala 27:73]
  wire  selectedValidMask_0_4 = valid_tag_match_reg_0 & forward_mask_candidate_reg__0_4 | valid_tag_match_reg_1 &
    forward_mask_candidate_reg__1_4 | valid_tag_match_reg_2 & forward_mask_candidate_reg__2_4 | valid_tag_match_reg_3 &
    forward_mask_candidate_reg__3_4; // @[Mux.scala 27:73]
  wire  selectedValidMask_0_5 = valid_tag_match_reg_0 & forward_mask_candidate_reg__0_5 | valid_tag_match_reg_1 &
    forward_mask_candidate_reg__1_5 | valid_tag_match_reg_2 & forward_mask_candidate_reg__2_5 | valid_tag_match_reg_3 &
    forward_mask_candidate_reg__3_5; // @[Mux.scala 27:73]
  wire  selectedValidMask_0_6 = valid_tag_match_reg_0 & forward_mask_candidate_reg__0_6 | valid_tag_match_reg_1 &
    forward_mask_candidate_reg__1_6 | valid_tag_match_reg_2 & forward_mask_candidate_reg__2_6 | valid_tag_match_reg_3 &
    forward_mask_candidate_reg__3_6; // @[Mux.scala 27:73]
  wire  selectedValidMask_0_7 = valid_tag_match_reg_0 & forward_mask_candidate_reg__0_7 | valid_tag_match_reg_1 &
    forward_mask_candidate_reg__1_7 | valid_tag_match_reg_2 & forward_mask_candidate_reg__2_7 | valid_tag_match_reg_3 &
    forward_mask_candidate_reg__3_7; // @[Mux.scala 27:73]
  wire  selectedValidMask_0_8 = valid_tag_match_reg_0 & forward_mask_candidate_reg__0_8 | valid_tag_match_reg_1 &
    forward_mask_candidate_reg__1_8 | valid_tag_match_reg_2 & forward_mask_candidate_reg__2_8 | valid_tag_match_reg_3 &
    forward_mask_candidate_reg__3_8; // @[Mux.scala 27:73]
  wire  selectedValidMask_0_9 = valid_tag_match_reg_0 & forward_mask_candidate_reg__0_9 | valid_tag_match_reg_1 &
    forward_mask_candidate_reg__1_9 | valid_tag_match_reg_2 & forward_mask_candidate_reg__2_9 | valid_tag_match_reg_3 &
    forward_mask_candidate_reg__3_9; // @[Mux.scala 27:73]
  wire  selectedValidMask_0_10 = valid_tag_match_reg_0 & forward_mask_candidate_reg__0_10 | valid_tag_match_reg_1 &
    forward_mask_candidate_reg__1_10 | valid_tag_match_reg_2 & forward_mask_candidate_reg__2_10 | valid_tag_match_reg_3
     & forward_mask_candidate_reg__3_10; // @[Mux.scala 27:73]
  wire  selectedValidMask_0_11 = valid_tag_match_reg_0 & forward_mask_candidate_reg__0_11 | valid_tag_match_reg_1 &
    forward_mask_candidate_reg__1_11 | valid_tag_match_reg_2 & forward_mask_candidate_reg__2_11 | valid_tag_match_reg_3
     & forward_mask_candidate_reg__3_11; // @[Mux.scala 27:73]
  wire  selectedValidMask_0_12 = valid_tag_match_reg_0 & forward_mask_candidate_reg__0_12 | valid_tag_match_reg_1 &
    forward_mask_candidate_reg__1_12 | valid_tag_match_reg_2 & forward_mask_candidate_reg__2_12 | valid_tag_match_reg_3
     & forward_mask_candidate_reg__3_12; // @[Mux.scala 27:73]
  wire  selectedValidMask_0_13 = valid_tag_match_reg_0 & forward_mask_candidate_reg__0_13 | valid_tag_match_reg_1 &
    forward_mask_candidate_reg__1_13 | valid_tag_match_reg_2 & forward_mask_candidate_reg__2_13 | valid_tag_match_reg_3
     & forward_mask_candidate_reg__3_13; // @[Mux.scala 27:73]
  wire  selectedValidMask_0_14 = valid_tag_match_reg_0 & forward_mask_candidate_reg__0_14 | valid_tag_match_reg_1 &
    forward_mask_candidate_reg__1_14 | valid_tag_match_reg_2 & forward_mask_candidate_reg__2_14 | valid_tag_match_reg_3
     & forward_mask_candidate_reg__3_14; // @[Mux.scala 27:73]
  wire  selectedValidMask_0_15 = valid_tag_match_reg_0 & forward_mask_candidate_reg__0_15 | valid_tag_match_reg_1 &
    forward_mask_candidate_reg__1_15 | valid_tag_match_reg_2 & forward_mask_candidate_reg__2_15 | valid_tag_match_reg_3
     & forward_mask_candidate_reg__3_15; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T = valid_tag_match_reg_0 ? forward_data_candidate_reg__0_0 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_1 = valid_tag_match_reg_1 ? forward_data_candidate_reg__1_0 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_2 = valid_tag_match_reg_2 ? forward_data_candidate_reg__2_0 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_3 = valid_tag_match_reg_3 ? forward_data_candidate_reg__3_0 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_4 = _selectedValidData_T | _selectedValidData_T_1; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_5 = _selectedValidData_T_4 | _selectedValidData_T_2; // @[Mux.scala 27:73]
  wire [7:0] selectedValidData_0_0 = _selectedValidData_T_5 | _selectedValidData_T_3; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_7 = valid_tag_match_reg_0 ? forward_data_candidate_reg__0_1 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_8 = valid_tag_match_reg_1 ? forward_data_candidate_reg__1_1 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_9 = valid_tag_match_reg_2 ? forward_data_candidate_reg__2_1 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_10 = valid_tag_match_reg_3 ? forward_data_candidate_reg__3_1 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_11 = _selectedValidData_T_7 | _selectedValidData_T_8; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_12 = _selectedValidData_T_11 | _selectedValidData_T_9; // @[Mux.scala 27:73]
  wire [7:0] selectedValidData_0_1 = _selectedValidData_T_12 | _selectedValidData_T_10; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_14 = valid_tag_match_reg_0 ? forward_data_candidate_reg__0_2 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_15 = valid_tag_match_reg_1 ? forward_data_candidate_reg__1_2 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_16 = valid_tag_match_reg_2 ? forward_data_candidate_reg__2_2 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_17 = valid_tag_match_reg_3 ? forward_data_candidate_reg__3_2 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_18 = _selectedValidData_T_14 | _selectedValidData_T_15; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_19 = _selectedValidData_T_18 | _selectedValidData_T_16; // @[Mux.scala 27:73]
  wire [7:0] selectedValidData_0_2 = _selectedValidData_T_19 | _selectedValidData_T_17; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_21 = valid_tag_match_reg_0 ? forward_data_candidate_reg__0_3 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_22 = valid_tag_match_reg_1 ? forward_data_candidate_reg__1_3 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_23 = valid_tag_match_reg_2 ? forward_data_candidate_reg__2_3 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_24 = valid_tag_match_reg_3 ? forward_data_candidate_reg__3_3 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_25 = _selectedValidData_T_21 | _selectedValidData_T_22; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_26 = _selectedValidData_T_25 | _selectedValidData_T_23; // @[Mux.scala 27:73]
  wire [7:0] selectedValidData_0_3 = _selectedValidData_T_26 | _selectedValidData_T_24; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_28 = valid_tag_match_reg_0 ? forward_data_candidate_reg__0_4 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_29 = valid_tag_match_reg_1 ? forward_data_candidate_reg__1_4 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_30 = valid_tag_match_reg_2 ? forward_data_candidate_reg__2_4 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_31 = valid_tag_match_reg_3 ? forward_data_candidate_reg__3_4 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_32 = _selectedValidData_T_28 | _selectedValidData_T_29; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_33 = _selectedValidData_T_32 | _selectedValidData_T_30; // @[Mux.scala 27:73]
  wire [7:0] selectedValidData_0_4 = _selectedValidData_T_33 | _selectedValidData_T_31; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_35 = valid_tag_match_reg_0 ? forward_data_candidate_reg__0_5 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_36 = valid_tag_match_reg_1 ? forward_data_candidate_reg__1_5 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_37 = valid_tag_match_reg_2 ? forward_data_candidate_reg__2_5 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_38 = valid_tag_match_reg_3 ? forward_data_candidate_reg__3_5 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_39 = _selectedValidData_T_35 | _selectedValidData_T_36; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_40 = _selectedValidData_T_39 | _selectedValidData_T_37; // @[Mux.scala 27:73]
  wire [7:0] selectedValidData_0_5 = _selectedValidData_T_40 | _selectedValidData_T_38; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_42 = valid_tag_match_reg_0 ? forward_data_candidate_reg__0_6 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_43 = valid_tag_match_reg_1 ? forward_data_candidate_reg__1_6 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_44 = valid_tag_match_reg_2 ? forward_data_candidate_reg__2_6 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_45 = valid_tag_match_reg_3 ? forward_data_candidate_reg__3_6 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_46 = _selectedValidData_T_42 | _selectedValidData_T_43; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_47 = _selectedValidData_T_46 | _selectedValidData_T_44; // @[Mux.scala 27:73]
  wire [7:0] selectedValidData_0_6 = _selectedValidData_T_47 | _selectedValidData_T_45; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_49 = valid_tag_match_reg_0 ? forward_data_candidate_reg__0_7 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_50 = valid_tag_match_reg_1 ? forward_data_candidate_reg__1_7 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_51 = valid_tag_match_reg_2 ? forward_data_candidate_reg__2_7 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_52 = valid_tag_match_reg_3 ? forward_data_candidate_reg__3_7 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_53 = _selectedValidData_T_49 | _selectedValidData_T_50; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_54 = _selectedValidData_T_53 | _selectedValidData_T_51; // @[Mux.scala 27:73]
  wire [7:0] selectedValidData_0_7 = _selectedValidData_T_54 | _selectedValidData_T_52; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_56 = valid_tag_match_reg_0 ? forward_data_candidate_reg__0_8 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_57 = valid_tag_match_reg_1 ? forward_data_candidate_reg__1_8 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_58 = valid_tag_match_reg_2 ? forward_data_candidate_reg__2_8 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_59 = valid_tag_match_reg_3 ? forward_data_candidate_reg__3_8 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_60 = _selectedValidData_T_56 | _selectedValidData_T_57; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_61 = _selectedValidData_T_60 | _selectedValidData_T_58; // @[Mux.scala 27:73]
  wire [7:0] selectedValidData_0_8 = _selectedValidData_T_61 | _selectedValidData_T_59; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_63 = valid_tag_match_reg_0 ? forward_data_candidate_reg__0_9 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_64 = valid_tag_match_reg_1 ? forward_data_candidate_reg__1_9 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_65 = valid_tag_match_reg_2 ? forward_data_candidate_reg__2_9 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_66 = valid_tag_match_reg_3 ? forward_data_candidate_reg__3_9 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_67 = _selectedValidData_T_63 | _selectedValidData_T_64; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_68 = _selectedValidData_T_67 | _selectedValidData_T_65; // @[Mux.scala 27:73]
  wire [7:0] selectedValidData_0_9 = _selectedValidData_T_68 | _selectedValidData_T_66; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_70 = valid_tag_match_reg_0 ? forward_data_candidate_reg__0_10 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_71 = valid_tag_match_reg_1 ? forward_data_candidate_reg__1_10 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_72 = valid_tag_match_reg_2 ? forward_data_candidate_reg__2_10 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_73 = valid_tag_match_reg_3 ? forward_data_candidate_reg__3_10 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_74 = _selectedValidData_T_70 | _selectedValidData_T_71; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_75 = _selectedValidData_T_74 | _selectedValidData_T_72; // @[Mux.scala 27:73]
  wire [7:0] selectedValidData_0_10 = _selectedValidData_T_75 | _selectedValidData_T_73; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_77 = valid_tag_match_reg_0 ? forward_data_candidate_reg__0_11 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_78 = valid_tag_match_reg_1 ? forward_data_candidate_reg__1_11 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_79 = valid_tag_match_reg_2 ? forward_data_candidate_reg__2_11 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_80 = valid_tag_match_reg_3 ? forward_data_candidate_reg__3_11 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_81 = _selectedValidData_T_77 | _selectedValidData_T_78; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_82 = _selectedValidData_T_81 | _selectedValidData_T_79; // @[Mux.scala 27:73]
  wire [7:0] selectedValidData_0_11 = _selectedValidData_T_82 | _selectedValidData_T_80; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_84 = valid_tag_match_reg_0 ? forward_data_candidate_reg__0_12 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_85 = valid_tag_match_reg_1 ? forward_data_candidate_reg__1_12 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_86 = valid_tag_match_reg_2 ? forward_data_candidate_reg__2_12 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_87 = valid_tag_match_reg_3 ? forward_data_candidate_reg__3_12 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_88 = _selectedValidData_T_84 | _selectedValidData_T_85; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_89 = _selectedValidData_T_88 | _selectedValidData_T_86; // @[Mux.scala 27:73]
  wire [7:0] selectedValidData_0_12 = _selectedValidData_T_89 | _selectedValidData_T_87; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_91 = valid_tag_match_reg_0 ? forward_data_candidate_reg__0_13 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_92 = valid_tag_match_reg_1 ? forward_data_candidate_reg__1_13 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_93 = valid_tag_match_reg_2 ? forward_data_candidate_reg__2_13 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_94 = valid_tag_match_reg_3 ? forward_data_candidate_reg__3_13 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_95 = _selectedValidData_T_91 | _selectedValidData_T_92; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_96 = _selectedValidData_T_95 | _selectedValidData_T_93; // @[Mux.scala 27:73]
  wire [7:0] selectedValidData_0_13 = _selectedValidData_T_96 | _selectedValidData_T_94; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_98 = valid_tag_match_reg_0 ? forward_data_candidate_reg__0_14 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_99 = valid_tag_match_reg_1 ? forward_data_candidate_reg__1_14 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_100 = valid_tag_match_reg_2 ? forward_data_candidate_reg__2_14 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_101 = valid_tag_match_reg_3 ? forward_data_candidate_reg__3_14 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_102 = _selectedValidData_T_98 | _selectedValidData_T_99; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_103 = _selectedValidData_T_102 | _selectedValidData_T_100; // @[Mux.scala 27:73]
  wire [7:0] selectedValidData_0_14 = _selectedValidData_T_103 | _selectedValidData_T_101; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_105 = valid_tag_match_reg_0 ? forward_data_candidate_reg__0_15 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_106 = valid_tag_match_reg_1 ? forward_data_candidate_reg__1_15 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_107 = valid_tag_match_reg_2 ? forward_data_candidate_reg__2_15 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_108 = valid_tag_match_reg_3 ? forward_data_candidate_reg__3_15 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_109 = _selectedValidData_T_105 | _selectedValidData_T_106; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_110 = _selectedValidData_T_109 | _selectedValidData_T_107; // @[Mux.scala 27:73]
  wire [7:0] selectedValidData_0_15 = _selectedValidData_T_110 | _selectedValidData_T_108; // @[Mux.scala 27:73]
  wire  selectedInflightMask_0_0 = inflight_tag_match_reg_0 & forward_mask_candidate_reg__0_0 | inflight_tag_match_reg_1
     & forward_mask_candidate_reg__1_0 | inflight_tag_match_reg_2 & forward_mask_candidate_reg__2_0 |
    inflight_tag_match_reg_3 & forward_mask_candidate_reg__3_0; // @[Mux.scala 27:73]
  wire  selectedInflightMask_0_1 = inflight_tag_match_reg_0 & forward_mask_candidate_reg__0_1 | inflight_tag_match_reg_1
     & forward_mask_candidate_reg__1_1 | inflight_tag_match_reg_2 & forward_mask_candidate_reg__2_1 |
    inflight_tag_match_reg_3 & forward_mask_candidate_reg__3_1; // @[Mux.scala 27:73]
  wire  selectedInflightMask_0_2 = inflight_tag_match_reg_0 & forward_mask_candidate_reg__0_2 | inflight_tag_match_reg_1
     & forward_mask_candidate_reg__1_2 | inflight_tag_match_reg_2 & forward_mask_candidate_reg__2_2 |
    inflight_tag_match_reg_3 & forward_mask_candidate_reg__3_2; // @[Mux.scala 27:73]
  wire  selectedInflightMask_0_3 = inflight_tag_match_reg_0 & forward_mask_candidate_reg__0_3 | inflight_tag_match_reg_1
     & forward_mask_candidate_reg__1_3 | inflight_tag_match_reg_2 & forward_mask_candidate_reg__2_3 |
    inflight_tag_match_reg_3 & forward_mask_candidate_reg__3_3; // @[Mux.scala 27:73]
  wire  selectedInflightMask_0_4 = inflight_tag_match_reg_0 & forward_mask_candidate_reg__0_4 | inflight_tag_match_reg_1
     & forward_mask_candidate_reg__1_4 | inflight_tag_match_reg_2 & forward_mask_candidate_reg__2_4 |
    inflight_tag_match_reg_3 & forward_mask_candidate_reg__3_4; // @[Mux.scala 27:73]
  wire  selectedInflightMask_0_5 = inflight_tag_match_reg_0 & forward_mask_candidate_reg__0_5 | inflight_tag_match_reg_1
     & forward_mask_candidate_reg__1_5 | inflight_tag_match_reg_2 & forward_mask_candidate_reg__2_5 |
    inflight_tag_match_reg_3 & forward_mask_candidate_reg__3_5; // @[Mux.scala 27:73]
  wire  selectedInflightMask_0_6 = inflight_tag_match_reg_0 & forward_mask_candidate_reg__0_6 | inflight_tag_match_reg_1
     & forward_mask_candidate_reg__1_6 | inflight_tag_match_reg_2 & forward_mask_candidate_reg__2_6 |
    inflight_tag_match_reg_3 & forward_mask_candidate_reg__3_6; // @[Mux.scala 27:73]
  wire  selectedInflightMask_0_7 = inflight_tag_match_reg_0 & forward_mask_candidate_reg__0_7 | inflight_tag_match_reg_1
     & forward_mask_candidate_reg__1_7 | inflight_tag_match_reg_2 & forward_mask_candidate_reg__2_7 |
    inflight_tag_match_reg_3 & forward_mask_candidate_reg__3_7; // @[Mux.scala 27:73]
  wire  selectedInflightMask_0_8 = inflight_tag_match_reg_0 & forward_mask_candidate_reg__0_8 | inflight_tag_match_reg_1
     & forward_mask_candidate_reg__1_8 | inflight_tag_match_reg_2 & forward_mask_candidate_reg__2_8 |
    inflight_tag_match_reg_3 & forward_mask_candidate_reg__3_8; // @[Mux.scala 27:73]
  wire  selectedInflightMask_0_9 = inflight_tag_match_reg_0 & forward_mask_candidate_reg__0_9 | inflight_tag_match_reg_1
     & forward_mask_candidate_reg__1_9 | inflight_tag_match_reg_2 & forward_mask_candidate_reg__2_9 |
    inflight_tag_match_reg_3 & forward_mask_candidate_reg__3_9; // @[Mux.scala 27:73]
  wire  selectedInflightMask_0_10 = inflight_tag_match_reg_0 & forward_mask_candidate_reg__0_10 |
    inflight_tag_match_reg_1 & forward_mask_candidate_reg__1_10 | inflight_tag_match_reg_2 &
    forward_mask_candidate_reg__2_10 | inflight_tag_match_reg_3 & forward_mask_candidate_reg__3_10; // @[Mux.scala 27:73]
  wire  selectedInflightMask_0_11 = inflight_tag_match_reg_0 & forward_mask_candidate_reg__0_11 |
    inflight_tag_match_reg_1 & forward_mask_candidate_reg__1_11 | inflight_tag_match_reg_2 &
    forward_mask_candidate_reg__2_11 | inflight_tag_match_reg_3 & forward_mask_candidate_reg__3_11; // @[Mux.scala 27:73]
  wire  selectedInflightMask_0_12 = inflight_tag_match_reg_0 & forward_mask_candidate_reg__0_12 |
    inflight_tag_match_reg_1 & forward_mask_candidate_reg__1_12 | inflight_tag_match_reg_2 &
    forward_mask_candidate_reg__2_12 | inflight_tag_match_reg_3 & forward_mask_candidate_reg__3_12; // @[Mux.scala 27:73]
  wire  selectedInflightMask_0_13 = inflight_tag_match_reg_0 & forward_mask_candidate_reg__0_13 |
    inflight_tag_match_reg_1 & forward_mask_candidate_reg__1_13 | inflight_tag_match_reg_2 &
    forward_mask_candidate_reg__2_13 | inflight_tag_match_reg_3 & forward_mask_candidate_reg__3_13; // @[Mux.scala 27:73]
  wire  selectedInflightMask_0_14 = inflight_tag_match_reg_0 & forward_mask_candidate_reg__0_14 |
    inflight_tag_match_reg_1 & forward_mask_candidate_reg__1_14 | inflight_tag_match_reg_2 &
    forward_mask_candidate_reg__2_14 | inflight_tag_match_reg_3 & forward_mask_candidate_reg__3_14; // @[Mux.scala 27:73]
  wire  selectedInflightMask_0_15 = inflight_tag_match_reg_0 & forward_mask_candidate_reg__0_15 |
    inflight_tag_match_reg_1 & forward_mask_candidate_reg__1_15 | inflight_tag_match_reg_2 &
    forward_mask_candidate_reg__2_15 | inflight_tag_match_reg_3 & forward_mask_candidate_reg__3_15; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T = inflight_tag_match_reg_0 ? forward_data_candidate_reg__0_0 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_1 = inflight_tag_match_reg_1 ? forward_data_candidate_reg__1_0 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_2 = inflight_tag_match_reg_2 ? forward_data_candidate_reg__2_0 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_3 = inflight_tag_match_reg_3 ? forward_data_candidate_reg__3_0 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_4 = _selectedInflightData_T | _selectedInflightData_T_1; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_5 = _selectedInflightData_T_4 | _selectedInflightData_T_2; // @[Mux.scala 27:73]
  wire [7:0] selectedInflightData_0_0 = _selectedInflightData_T_5 | _selectedInflightData_T_3; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_7 = inflight_tag_match_reg_0 ? forward_data_candidate_reg__0_1 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_8 = inflight_tag_match_reg_1 ? forward_data_candidate_reg__1_1 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_9 = inflight_tag_match_reg_2 ? forward_data_candidate_reg__2_1 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_10 = inflight_tag_match_reg_3 ? forward_data_candidate_reg__3_1 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_11 = _selectedInflightData_T_7 | _selectedInflightData_T_8; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_12 = _selectedInflightData_T_11 | _selectedInflightData_T_9; // @[Mux.scala 27:73]
  wire [7:0] selectedInflightData_0_1 = _selectedInflightData_T_12 | _selectedInflightData_T_10; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_14 = inflight_tag_match_reg_0 ? forward_data_candidate_reg__0_2 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_15 = inflight_tag_match_reg_1 ? forward_data_candidate_reg__1_2 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_16 = inflight_tag_match_reg_2 ? forward_data_candidate_reg__2_2 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_17 = inflight_tag_match_reg_3 ? forward_data_candidate_reg__3_2 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_18 = _selectedInflightData_T_14 | _selectedInflightData_T_15; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_19 = _selectedInflightData_T_18 | _selectedInflightData_T_16; // @[Mux.scala 27:73]
  wire [7:0] selectedInflightData_0_2 = _selectedInflightData_T_19 | _selectedInflightData_T_17; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_21 = inflight_tag_match_reg_0 ? forward_data_candidate_reg__0_3 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_22 = inflight_tag_match_reg_1 ? forward_data_candidate_reg__1_3 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_23 = inflight_tag_match_reg_2 ? forward_data_candidate_reg__2_3 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_24 = inflight_tag_match_reg_3 ? forward_data_candidate_reg__3_3 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_25 = _selectedInflightData_T_21 | _selectedInflightData_T_22; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_26 = _selectedInflightData_T_25 | _selectedInflightData_T_23; // @[Mux.scala 27:73]
  wire [7:0] selectedInflightData_0_3 = _selectedInflightData_T_26 | _selectedInflightData_T_24; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_28 = inflight_tag_match_reg_0 ? forward_data_candidate_reg__0_4 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_29 = inflight_tag_match_reg_1 ? forward_data_candidate_reg__1_4 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_30 = inflight_tag_match_reg_2 ? forward_data_candidate_reg__2_4 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_31 = inflight_tag_match_reg_3 ? forward_data_candidate_reg__3_4 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_32 = _selectedInflightData_T_28 | _selectedInflightData_T_29; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_33 = _selectedInflightData_T_32 | _selectedInflightData_T_30; // @[Mux.scala 27:73]
  wire [7:0] selectedInflightData_0_4 = _selectedInflightData_T_33 | _selectedInflightData_T_31; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_35 = inflight_tag_match_reg_0 ? forward_data_candidate_reg__0_5 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_36 = inflight_tag_match_reg_1 ? forward_data_candidate_reg__1_5 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_37 = inflight_tag_match_reg_2 ? forward_data_candidate_reg__2_5 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_38 = inflight_tag_match_reg_3 ? forward_data_candidate_reg__3_5 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_39 = _selectedInflightData_T_35 | _selectedInflightData_T_36; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_40 = _selectedInflightData_T_39 | _selectedInflightData_T_37; // @[Mux.scala 27:73]
  wire [7:0] selectedInflightData_0_5 = _selectedInflightData_T_40 | _selectedInflightData_T_38; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_42 = inflight_tag_match_reg_0 ? forward_data_candidate_reg__0_6 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_43 = inflight_tag_match_reg_1 ? forward_data_candidate_reg__1_6 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_44 = inflight_tag_match_reg_2 ? forward_data_candidate_reg__2_6 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_45 = inflight_tag_match_reg_3 ? forward_data_candidate_reg__3_6 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_46 = _selectedInflightData_T_42 | _selectedInflightData_T_43; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_47 = _selectedInflightData_T_46 | _selectedInflightData_T_44; // @[Mux.scala 27:73]
  wire [7:0] selectedInflightData_0_6 = _selectedInflightData_T_47 | _selectedInflightData_T_45; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_49 = inflight_tag_match_reg_0 ? forward_data_candidate_reg__0_7 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_50 = inflight_tag_match_reg_1 ? forward_data_candidate_reg__1_7 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_51 = inflight_tag_match_reg_2 ? forward_data_candidate_reg__2_7 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_52 = inflight_tag_match_reg_3 ? forward_data_candidate_reg__3_7 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_53 = _selectedInflightData_T_49 | _selectedInflightData_T_50; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_54 = _selectedInflightData_T_53 | _selectedInflightData_T_51; // @[Mux.scala 27:73]
  wire [7:0] selectedInflightData_0_7 = _selectedInflightData_T_54 | _selectedInflightData_T_52; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_56 = inflight_tag_match_reg_0 ? forward_data_candidate_reg__0_8 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_57 = inflight_tag_match_reg_1 ? forward_data_candidate_reg__1_8 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_58 = inflight_tag_match_reg_2 ? forward_data_candidate_reg__2_8 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_59 = inflight_tag_match_reg_3 ? forward_data_candidate_reg__3_8 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_60 = _selectedInflightData_T_56 | _selectedInflightData_T_57; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_61 = _selectedInflightData_T_60 | _selectedInflightData_T_58; // @[Mux.scala 27:73]
  wire [7:0] selectedInflightData_0_8 = _selectedInflightData_T_61 | _selectedInflightData_T_59; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_63 = inflight_tag_match_reg_0 ? forward_data_candidate_reg__0_9 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_64 = inflight_tag_match_reg_1 ? forward_data_candidate_reg__1_9 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_65 = inflight_tag_match_reg_2 ? forward_data_candidate_reg__2_9 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_66 = inflight_tag_match_reg_3 ? forward_data_candidate_reg__3_9 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_67 = _selectedInflightData_T_63 | _selectedInflightData_T_64; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_68 = _selectedInflightData_T_67 | _selectedInflightData_T_65; // @[Mux.scala 27:73]
  wire [7:0] selectedInflightData_0_9 = _selectedInflightData_T_68 | _selectedInflightData_T_66; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_70 = inflight_tag_match_reg_0 ? forward_data_candidate_reg__0_10 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_71 = inflight_tag_match_reg_1 ? forward_data_candidate_reg__1_10 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_72 = inflight_tag_match_reg_2 ? forward_data_candidate_reg__2_10 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_73 = inflight_tag_match_reg_3 ? forward_data_candidate_reg__3_10 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_74 = _selectedInflightData_T_70 | _selectedInflightData_T_71; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_75 = _selectedInflightData_T_74 | _selectedInflightData_T_72; // @[Mux.scala 27:73]
  wire [7:0] selectedInflightData_0_10 = _selectedInflightData_T_75 | _selectedInflightData_T_73; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_77 = inflight_tag_match_reg_0 ? forward_data_candidate_reg__0_11 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_78 = inflight_tag_match_reg_1 ? forward_data_candidate_reg__1_11 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_79 = inflight_tag_match_reg_2 ? forward_data_candidate_reg__2_11 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_80 = inflight_tag_match_reg_3 ? forward_data_candidate_reg__3_11 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_81 = _selectedInflightData_T_77 | _selectedInflightData_T_78; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_82 = _selectedInflightData_T_81 | _selectedInflightData_T_79; // @[Mux.scala 27:73]
  wire [7:0] selectedInflightData_0_11 = _selectedInflightData_T_82 | _selectedInflightData_T_80; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_84 = inflight_tag_match_reg_0 ? forward_data_candidate_reg__0_12 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_85 = inflight_tag_match_reg_1 ? forward_data_candidate_reg__1_12 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_86 = inflight_tag_match_reg_2 ? forward_data_candidate_reg__2_12 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_87 = inflight_tag_match_reg_3 ? forward_data_candidate_reg__3_12 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_88 = _selectedInflightData_T_84 | _selectedInflightData_T_85; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_89 = _selectedInflightData_T_88 | _selectedInflightData_T_86; // @[Mux.scala 27:73]
  wire [7:0] selectedInflightData_0_12 = _selectedInflightData_T_89 | _selectedInflightData_T_87; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_91 = inflight_tag_match_reg_0 ? forward_data_candidate_reg__0_13 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_92 = inflight_tag_match_reg_1 ? forward_data_candidate_reg__1_13 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_93 = inflight_tag_match_reg_2 ? forward_data_candidate_reg__2_13 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_94 = inflight_tag_match_reg_3 ? forward_data_candidate_reg__3_13 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_95 = _selectedInflightData_T_91 | _selectedInflightData_T_92; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_96 = _selectedInflightData_T_95 | _selectedInflightData_T_93; // @[Mux.scala 27:73]
  wire [7:0] selectedInflightData_0_13 = _selectedInflightData_T_96 | _selectedInflightData_T_94; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_98 = inflight_tag_match_reg_0 ? forward_data_candidate_reg__0_14 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_99 = inflight_tag_match_reg_1 ? forward_data_candidate_reg__1_14 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_100 = inflight_tag_match_reg_2 ? forward_data_candidate_reg__2_14 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_101 = inflight_tag_match_reg_3 ? forward_data_candidate_reg__3_14 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_102 = _selectedInflightData_T_98 | _selectedInflightData_T_99; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_103 = _selectedInflightData_T_102 | _selectedInflightData_T_100; // @[Mux.scala 27:73]
  wire [7:0] selectedInflightData_0_14 = _selectedInflightData_T_103 | _selectedInflightData_T_101; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_105 = inflight_tag_match_reg_0 ? forward_data_candidate_reg__0_15 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_106 = inflight_tag_match_reg_1 ? forward_data_candidate_reg__1_15 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_107 = inflight_tag_match_reg_2 ? forward_data_candidate_reg__2_15 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_108 = inflight_tag_match_reg_3 ? forward_data_candidate_reg__3_15 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_109 = _selectedInflightData_T_105 | _selectedInflightData_T_106; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_110 = _selectedInflightData_T_109 | _selectedInflightData_T_107; // @[Mux.scala 27:73]
  wire [7:0] selectedInflightData_0_15 = _selectedInflightData_T_110 | _selectedInflightData_T_108; // @[Mux.scala 27:73]
  wire  vtag_matches_1_0 = vtag_0 == io_forward_1_vaddr[38:6]; // @[Sbuffer.scala 722:54]
  wire  vtag_matches_1_1 = vtag_1 == io_forward_1_vaddr[38:6]; // @[Sbuffer.scala 722:54]
  wire  vtag_matches_1_2 = vtag_2 == io_forward_1_vaddr[38:6]; // @[Sbuffer.scala 722:54]
  wire  vtag_matches_1_3 = vtag_3 == io_forward_1_vaddr[38:6]; // @[Sbuffer.scala 722:54]
  reg  valid_tag_match_reg_0_1; // @[Sbuffer.scala 743:60]
  reg  valid_tag_match_reg_1_1; // @[Sbuffer.scala 743:60]
  reg  valid_tag_match_reg_2_1; // @[Sbuffer.scala 743:60]
  reg  valid_tag_match_reg_3_1; // @[Sbuffer.scala 743:60]
  reg  inflight_tag_match_reg_0_1; // @[Sbuffer.scala 744:66]
  reg  inflight_tag_match_reg_1_1; // @[Sbuffer.scala 744:66]
  reg  inflight_tag_match_reg_2_1; // @[Sbuffer.scala 744:66]
  reg  inflight_tag_match_reg_3_1; // @[Sbuffer.scala 744:66]
  reg  forward_mask_candidate_reg_1_0_0; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_0_1; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_0_2; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_0_3; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_0_4; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_0_5; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_0_6; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_0_7; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_0_8; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_0_9; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_0_10; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_0_11; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_0_12; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_0_13; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_0_14; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_0_15; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_1_0; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_1_1; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_1_2; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_1_3; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_1_4; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_1_5; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_1_6; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_1_7; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_1_8; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_1_9; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_1_10; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_1_11; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_1_12; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_1_13; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_1_14; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_1_15; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_2_0; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_2_1; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_2_2; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_2_3; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_2_4; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_2_5; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_2_6; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_2_7; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_2_8; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_2_9; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_2_10; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_2_11; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_2_12; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_2_13; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_2_14; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_2_15; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_3_0; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_3_1; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_3_2; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_3_3; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_3_4; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_3_5; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_3_6; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_3_7; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_3_8; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_3_9; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_3_10; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_3_11; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_3_12; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_3_13; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_3_14; // @[Reg.scala 16:16]
  reg  forward_mask_candidate_reg_1_3_15; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_0_0; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_0_1; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_0_2; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_0_3; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_0_4; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_0_5; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_0_6; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_0_7; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_0_8; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_0_9; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_0_10; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_0_11; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_0_12; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_0_13; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_0_14; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_0_15; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_1_0; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_1_1; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_1_2; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_1_3; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_1_4; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_1_5; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_1_6; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_1_7; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_1_8; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_1_9; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_1_10; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_1_11; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_1_12; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_1_13; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_1_14; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_1_15; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_2_0; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_2_1; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_2_2; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_2_3; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_2_4; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_2_5; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_2_6; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_2_7; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_2_8; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_2_9; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_2_10; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_2_11; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_2_12; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_2_13; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_2_14; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_2_15; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_3_0; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_3_1; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_3_2; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_3_3; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_3_4; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_3_5; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_3_6; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_3_7; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_3_8; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_3_9; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_3_10; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_3_11; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_3_12; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_3_13; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_3_14; // @[Reg.scala 16:16]
  reg [7:0] forward_data_candidate_reg_1_3_15; // @[Reg.scala 16:16]
  wire  selectedValidMask_1_0 = valid_tag_match_reg_0_1 & forward_mask_candidate_reg_1_0_0 | valid_tag_match_reg_1_1 &
    forward_mask_candidate_reg_1_1_0 | valid_tag_match_reg_2_1 & forward_mask_candidate_reg_1_2_0 |
    valid_tag_match_reg_3_1 & forward_mask_candidate_reg_1_3_0; // @[Mux.scala 27:73]
  wire  selectedValidMask_1_1 = valid_tag_match_reg_0_1 & forward_mask_candidate_reg_1_0_1 | valid_tag_match_reg_1_1 &
    forward_mask_candidate_reg_1_1_1 | valid_tag_match_reg_2_1 & forward_mask_candidate_reg_1_2_1 |
    valid_tag_match_reg_3_1 & forward_mask_candidate_reg_1_3_1; // @[Mux.scala 27:73]
  wire  selectedValidMask_1_2 = valid_tag_match_reg_0_1 & forward_mask_candidate_reg_1_0_2 | valid_tag_match_reg_1_1 &
    forward_mask_candidate_reg_1_1_2 | valid_tag_match_reg_2_1 & forward_mask_candidate_reg_1_2_2 |
    valid_tag_match_reg_3_1 & forward_mask_candidate_reg_1_3_2; // @[Mux.scala 27:73]
  wire  selectedValidMask_1_3 = valid_tag_match_reg_0_1 & forward_mask_candidate_reg_1_0_3 | valid_tag_match_reg_1_1 &
    forward_mask_candidate_reg_1_1_3 | valid_tag_match_reg_2_1 & forward_mask_candidate_reg_1_2_3 |
    valid_tag_match_reg_3_1 & forward_mask_candidate_reg_1_3_3; // @[Mux.scala 27:73]
  wire  selectedValidMask_1_4 = valid_tag_match_reg_0_1 & forward_mask_candidate_reg_1_0_4 | valid_tag_match_reg_1_1 &
    forward_mask_candidate_reg_1_1_4 | valid_tag_match_reg_2_1 & forward_mask_candidate_reg_1_2_4 |
    valid_tag_match_reg_3_1 & forward_mask_candidate_reg_1_3_4; // @[Mux.scala 27:73]
  wire  selectedValidMask_1_5 = valid_tag_match_reg_0_1 & forward_mask_candidate_reg_1_0_5 | valid_tag_match_reg_1_1 &
    forward_mask_candidate_reg_1_1_5 | valid_tag_match_reg_2_1 & forward_mask_candidate_reg_1_2_5 |
    valid_tag_match_reg_3_1 & forward_mask_candidate_reg_1_3_5; // @[Mux.scala 27:73]
  wire  selectedValidMask_1_6 = valid_tag_match_reg_0_1 & forward_mask_candidate_reg_1_0_6 | valid_tag_match_reg_1_1 &
    forward_mask_candidate_reg_1_1_6 | valid_tag_match_reg_2_1 & forward_mask_candidate_reg_1_2_6 |
    valid_tag_match_reg_3_1 & forward_mask_candidate_reg_1_3_6; // @[Mux.scala 27:73]
  wire  selectedValidMask_1_7 = valid_tag_match_reg_0_1 & forward_mask_candidate_reg_1_0_7 | valid_tag_match_reg_1_1 &
    forward_mask_candidate_reg_1_1_7 | valid_tag_match_reg_2_1 & forward_mask_candidate_reg_1_2_7 |
    valid_tag_match_reg_3_1 & forward_mask_candidate_reg_1_3_7; // @[Mux.scala 27:73]
  wire  selectedValidMask_1_8 = valid_tag_match_reg_0_1 & forward_mask_candidate_reg_1_0_8 | valid_tag_match_reg_1_1 &
    forward_mask_candidate_reg_1_1_8 | valid_tag_match_reg_2_1 & forward_mask_candidate_reg_1_2_8 |
    valid_tag_match_reg_3_1 & forward_mask_candidate_reg_1_3_8; // @[Mux.scala 27:73]
  wire  selectedValidMask_1_9 = valid_tag_match_reg_0_1 & forward_mask_candidate_reg_1_0_9 | valid_tag_match_reg_1_1 &
    forward_mask_candidate_reg_1_1_9 | valid_tag_match_reg_2_1 & forward_mask_candidate_reg_1_2_9 |
    valid_tag_match_reg_3_1 & forward_mask_candidate_reg_1_3_9; // @[Mux.scala 27:73]
  wire  selectedValidMask_1_10 = valid_tag_match_reg_0_1 & forward_mask_candidate_reg_1_0_10 | valid_tag_match_reg_1_1
     & forward_mask_candidate_reg_1_1_10 | valid_tag_match_reg_2_1 & forward_mask_candidate_reg_1_2_10 |
    valid_tag_match_reg_3_1 & forward_mask_candidate_reg_1_3_10; // @[Mux.scala 27:73]
  wire  selectedValidMask_1_11 = valid_tag_match_reg_0_1 & forward_mask_candidate_reg_1_0_11 | valid_tag_match_reg_1_1
     & forward_mask_candidate_reg_1_1_11 | valid_tag_match_reg_2_1 & forward_mask_candidate_reg_1_2_11 |
    valid_tag_match_reg_3_1 & forward_mask_candidate_reg_1_3_11; // @[Mux.scala 27:73]
  wire  selectedValidMask_1_12 = valid_tag_match_reg_0_1 & forward_mask_candidate_reg_1_0_12 | valid_tag_match_reg_1_1
     & forward_mask_candidate_reg_1_1_12 | valid_tag_match_reg_2_1 & forward_mask_candidate_reg_1_2_12 |
    valid_tag_match_reg_3_1 & forward_mask_candidate_reg_1_3_12; // @[Mux.scala 27:73]
  wire  selectedValidMask_1_13 = valid_tag_match_reg_0_1 & forward_mask_candidate_reg_1_0_13 | valid_tag_match_reg_1_1
     & forward_mask_candidate_reg_1_1_13 | valid_tag_match_reg_2_1 & forward_mask_candidate_reg_1_2_13 |
    valid_tag_match_reg_3_1 & forward_mask_candidate_reg_1_3_13; // @[Mux.scala 27:73]
  wire  selectedValidMask_1_14 = valid_tag_match_reg_0_1 & forward_mask_candidate_reg_1_0_14 | valid_tag_match_reg_1_1
     & forward_mask_candidate_reg_1_1_14 | valid_tag_match_reg_2_1 & forward_mask_candidate_reg_1_2_14 |
    valid_tag_match_reg_3_1 & forward_mask_candidate_reg_1_3_14; // @[Mux.scala 27:73]
  wire  selectedValidMask_1_15 = valid_tag_match_reg_0_1 & forward_mask_candidate_reg_1_0_15 | valid_tag_match_reg_1_1
     & forward_mask_candidate_reg_1_1_15 | valid_tag_match_reg_2_1 & forward_mask_candidate_reg_1_2_15 |
    valid_tag_match_reg_3_1 & forward_mask_candidate_reg_1_3_15; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_112 = valid_tag_match_reg_0_1 ? forward_data_candidate_reg_1_0_0 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_113 = valid_tag_match_reg_1_1 ? forward_data_candidate_reg_1_1_0 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_114 = valid_tag_match_reg_2_1 ? forward_data_candidate_reg_1_2_0 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_115 = valid_tag_match_reg_3_1 ? forward_data_candidate_reg_1_3_0 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_116 = _selectedValidData_T_112 | _selectedValidData_T_113; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_117 = _selectedValidData_T_116 | _selectedValidData_T_114; // @[Mux.scala 27:73]
  wire [7:0] selectedValidData_1_0 = _selectedValidData_T_117 | _selectedValidData_T_115; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_119 = valid_tag_match_reg_0_1 ? forward_data_candidate_reg_1_0_1 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_120 = valid_tag_match_reg_1_1 ? forward_data_candidate_reg_1_1_1 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_121 = valid_tag_match_reg_2_1 ? forward_data_candidate_reg_1_2_1 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_122 = valid_tag_match_reg_3_1 ? forward_data_candidate_reg_1_3_1 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_123 = _selectedValidData_T_119 | _selectedValidData_T_120; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_124 = _selectedValidData_T_123 | _selectedValidData_T_121; // @[Mux.scala 27:73]
  wire [7:0] selectedValidData_1_1 = _selectedValidData_T_124 | _selectedValidData_T_122; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_126 = valid_tag_match_reg_0_1 ? forward_data_candidate_reg_1_0_2 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_127 = valid_tag_match_reg_1_1 ? forward_data_candidate_reg_1_1_2 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_128 = valid_tag_match_reg_2_1 ? forward_data_candidate_reg_1_2_2 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_129 = valid_tag_match_reg_3_1 ? forward_data_candidate_reg_1_3_2 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_130 = _selectedValidData_T_126 | _selectedValidData_T_127; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_131 = _selectedValidData_T_130 | _selectedValidData_T_128; // @[Mux.scala 27:73]
  wire [7:0] selectedValidData_1_2 = _selectedValidData_T_131 | _selectedValidData_T_129; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_133 = valid_tag_match_reg_0_1 ? forward_data_candidate_reg_1_0_3 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_134 = valid_tag_match_reg_1_1 ? forward_data_candidate_reg_1_1_3 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_135 = valid_tag_match_reg_2_1 ? forward_data_candidate_reg_1_2_3 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_136 = valid_tag_match_reg_3_1 ? forward_data_candidate_reg_1_3_3 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_137 = _selectedValidData_T_133 | _selectedValidData_T_134; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_138 = _selectedValidData_T_137 | _selectedValidData_T_135; // @[Mux.scala 27:73]
  wire [7:0] selectedValidData_1_3 = _selectedValidData_T_138 | _selectedValidData_T_136; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_140 = valid_tag_match_reg_0_1 ? forward_data_candidate_reg_1_0_4 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_141 = valid_tag_match_reg_1_1 ? forward_data_candidate_reg_1_1_4 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_142 = valid_tag_match_reg_2_1 ? forward_data_candidate_reg_1_2_4 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_143 = valid_tag_match_reg_3_1 ? forward_data_candidate_reg_1_3_4 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_144 = _selectedValidData_T_140 | _selectedValidData_T_141; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_145 = _selectedValidData_T_144 | _selectedValidData_T_142; // @[Mux.scala 27:73]
  wire [7:0] selectedValidData_1_4 = _selectedValidData_T_145 | _selectedValidData_T_143; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_147 = valid_tag_match_reg_0_1 ? forward_data_candidate_reg_1_0_5 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_148 = valid_tag_match_reg_1_1 ? forward_data_candidate_reg_1_1_5 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_149 = valid_tag_match_reg_2_1 ? forward_data_candidate_reg_1_2_5 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_150 = valid_tag_match_reg_3_1 ? forward_data_candidate_reg_1_3_5 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_151 = _selectedValidData_T_147 | _selectedValidData_T_148; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_152 = _selectedValidData_T_151 | _selectedValidData_T_149; // @[Mux.scala 27:73]
  wire [7:0] selectedValidData_1_5 = _selectedValidData_T_152 | _selectedValidData_T_150; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_154 = valid_tag_match_reg_0_1 ? forward_data_candidate_reg_1_0_6 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_155 = valid_tag_match_reg_1_1 ? forward_data_candidate_reg_1_1_6 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_156 = valid_tag_match_reg_2_1 ? forward_data_candidate_reg_1_2_6 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_157 = valid_tag_match_reg_3_1 ? forward_data_candidate_reg_1_3_6 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_158 = _selectedValidData_T_154 | _selectedValidData_T_155; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_159 = _selectedValidData_T_158 | _selectedValidData_T_156; // @[Mux.scala 27:73]
  wire [7:0] selectedValidData_1_6 = _selectedValidData_T_159 | _selectedValidData_T_157; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_161 = valid_tag_match_reg_0_1 ? forward_data_candidate_reg_1_0_7 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_162 = valid_tag_match_reg_1_1 ? forward_data_candidate_reg_1_1_7 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_163 = valid_tag_match_reg_2_1 ? forward_data_candidate_reg_1_2_7 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_164 = valid_tag_match_reg_3_1 ? forward_data_candidate_reg_1_3_7 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_165 = _selectedValidData_T_161 | _selectedValidData_T_162; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_166 = _selectedValidData_T_165 | _selectedValidData_T_163; // @[Mux.scala 27:73]
  wire [7:0] selectedValidData_1_7 = _selectedValidData_T_166 | _selectedValidData_T_164; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_168 = valid_tag_match_reg_0_1 ? forward_data_candidate_reg_1_0_8 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_169 = valid_tag_match_reg_1_1 ? forward_data_candidate_reg_1_1_8 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_170 = valid_tag_match_reg_2_1 ? forward_data_candidate_reg_1_2_8 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_171 = valid_tag_match_reg_3_1 ? forward_data_candidate_reg_1_3_8 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_172 = _selectedValidData_T_168 | _selectedValidData_T_169; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_173 = _selectedValidData_T_172 | _selectedValidData_T_170; // @[Mux.scala 27:73]
  wire [7:0] selectedValidData_1_8 = _selectedValidData_T_173 | _selectedValidData_T_171; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_175 = valid_tag_match_reg_0_1 ? forward_data_candidate_reg_1_0_9 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_176 = valid_tag_match_reg_1_1 ? forward_data_candidate_reg_1_1_9 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_177 = valid_tag_match_reg_2_1 ? forward_data_candidate_reg_1_2_9 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_178 = valid_tag_match_reg_3_1 ? forward_data_candidate_reg_1_3_9 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_179 = _selectedValidData_T_175 | _selectedValidData_T_176; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_180 = _selectedValidData_T_179 | _selectedValidData_T_177; // @[Mux.scala 27:73]
  wire [7:0] selectedValidData_1_9 = _selectedValidData_T_180 | _selectedValidData_T_178; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_182 = valid_tag_match_reg_0_1 ? forward_data_candidate_reg_1_0_10 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_183 = valid_tag_match_reg_1_1 ? forward_data_candidate_reg_1_1_10 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_184 = valid_tag_match_reg_2_1 ? forward_data_candidate_reg_1_2_10 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_185 = valid_tag_match_reg_3_1 ? forward_data_candidate_reg_1_3_10 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_186 = _selectedValidData_T_182 | _selectedValidData_T_183; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_187 = _selectedValidData_T_186 | _selectedValidData_T_184; // @[Mux.scala 27:73]
  wire [7:0] selectedValidData_1_10 = _selectedValidData_T_187 | _selectedValidData_T_185; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_189 = valid_tag_match_reg_0_1 ? forward_data_candidate_reg_1_0_11 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_190 = valid_tag_match_reg_1_1 ? forward_data_candidate_reg_1_1_11 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_191 = valid_tag_match_reg_2_1 ? forward_data_candidate_reg_1_2_11 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_192 = valid_tag_match_reg_3_1 ? forward_data_candidate_reg_1_3_11 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_193 = _selectedValidData_T_189 | _selectedValidData_T_190; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_194 = _selectedValidData_T_193 | _selectedValidData_T_191; // @[Mux.scala 27:73]
  wire [7:0] selectedValidData_1_11 = _selectedValidData_T_194 | _selectedValidData_T_192; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_196 = valid_tag_match_reg_0_1 ? forward_data_candidate_reg_1_0_12 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_197 = valid_tag_match_reg_1_1 ? forward_data_candidate_reg_1_1_12 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_198 = valid_tag_match_reg_2_1 ? forward_data_candidate_reg_1_2_12 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_199 = valid_tag_match_reg_3_1 ? forward_data_candidate_reg_1_3_12 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_200 = _selectedValidData_T_196 | _selectedValidData_T_197; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_201 = _selectedValidData_T_200 | _selectedValidData_T_198; // @[Mux.scala 27:73]
  wire [7:0] selectedValidData_1_12 = _selectedValidData_T_201 | _selectedValidData_T_199; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_203 = valid_tag_match_reg_0_1 ? forward_data_candidate_reg_1_0_13 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_204 = valid_tag_match_reg_1_1 ? forward_data_candidate_reg_1_1_13 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_205 = valid_tag_match_reg_2_1 ? forward_data_candidate_reg_1_2_13 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_206 = valid_tag_match_reg_3_1 ? forward_data_candidate_reg_1_3_13 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_207 = _selectedValidData_T_203 | _selectedValidData_T_204; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_208 = _selectedValidData_T_207 | _selectedValidData_T_205; // @[Mux.scala 27:73]
  wire [7:0] selectedValidData_1_13 = _selectedValidData_T_208 | _selectedValidData_T_206; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_210 = valid_tag_match_reg_0_1 ? forward_data_candidate_reg_1_0_14 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_211 = valid_tag_match_reg_1_1 ? forward_data_candidate_reg_1_1_14 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_212 = valid_tag_match_reg_2_1 ? forward_data_candidate_reg_1_2_14 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_213 = valid_tag_match_reg_3_1 ? forward_data_candidate_reg_1_3_14 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_214 = _selectedValidData_T_210 | _selectedValidData_T_211; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_215 = _selectedValidData_T_214 | _selectedValidData_T_212; // @[Mux.scala 27:73]
  wire [7:0] selectedValidData_1_14 = _selectedValidData_T_215 | _selectedValidData_T_213; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_217 = valid_tag_match_reg_0_1 ? forward_data_candidate_reg_1_0_15 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_218 = valid_tag_match_reg_1_1 ? forward_data_candidate_reg_1_1_15 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_219 = valid_tag_match_reg_2_1 ? forward_data_candidate_reg_1_2_15 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_220 = valid_tag_match_reg_3_1 ? forward_data_candidate_reg_1_3_15 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_221 = _selectedValidData_T_217 | _selectedValidData_T_218; // @[Mux.scala 27:73]
  wire [7:0] _selectedValidData_T_222 = _selectedValidData_T_221 | _selectedValidData_T_219; // @[Mux.scala 27:73]
  wire [7:0] selectedValidData_1_15 = _selectedValidData_T_222 | _selectedValidData_T_220; // @[Mux.scala 27:73]
  wire  selectedInflightMask_1_0 = inflight_tag_match_reg_0_1 & forward_mask_candidate_reg_1_0_0 |
    inflight_tag_match_reg_1_1 & forward_mask_candidate_reg_1_1_0 | inflight_tag_match_reg_2_1 &
    forward_mask_candidate_reg_1_2_0 | inflight_tag_match_reg_3_1 & forward_mask_candidate_reg_1_3_0; // @[Mux.scala 27:73]
  wire  selectedInflightMask_1_1 = inflight_tag_match_reg_0_1 & forward_mask_candidate_reg_1_0_1 |
    inflight_tag_match_reg_1_1 & forward_mask_candidate_reg_1_1_1 | inflight_tag_match_reg_2_1 &
    forward_mask_candidate_reg_1_2_1 | inflight_tag_match_reg_3_1 & forward_mask_candidate_reg_1_3_1; // @[Mux.scala 27:73]
  wire  selectedInflightMask_1_2 = inflight_tag_match_reg_0_1 & forward_mask_candidate_reg_1_0_2 |
    inflight_tag_match_reg_1_1 & forward_mask_candidate_reg_1_1_2 | inflight_tag_match_reg_2_1 &
    forward_mask_candidate_reg_1_2_2 | inflight_tag_match_reg_3_1 & forward_mask_candidate_reg_1_3_2; // @[Mux.scala 27:73]
  wire  selectedInflightMask_1_3 = inflight_tag_match_reg_0_1 & forward_mask_candidate_reg_1_0_3 |
    inflight_tag_match_reg_1_1 & forward_mask_candidate_reg_1_1_3 | inflight_tag_match_reg_2_1 &
    forward_mask_candidate_reg_1_2_3 | inflight_tag_match_reg_3_1 & forward_mask_candidate_reg_1_3_3; // @[Mux.scala 27:73]
  wire  selectedInflightMask_1_4 = inflight_tag_match_reg_0_1 & forward_mask_candidate_reg_1_0_4 |
    inflight_tag_match_reg_1_1 & forward_mask_candidate_reg_1_1_4 | inflight_tag_match_reg_2_1 &
    forward_mask_candidate_reg_1_2_4 | inflight_tag_match_reg_3_1 & forward_mask_candidate_reg_1_3_4; // @[Mux.scala 27:73]
  wire  selectedInflightMask_1_5 = inflight_tag_match_reg_0_1 & forward_mask_candidate_reg_1_0_5 |
    inflight_tag_match_reg_1_1 & forward_mask_candidate_reg_1_1_5 | inflight_tag_match_reg_2_1 &
    forward_mask_candidate_reg_1_2_5 | inflight_tag_match_reg_3_1 & forward_mask_candidate_reg_1_3_5; // @[Mux.scala 27:73]
  wire  selectedInflightMask_1_6 = inflight_tag_match_reg_0_1 & forward_mask_candidate_reg_1_0_6 |
    inflight_tag_match_reg_1_1 & forward_mask_candidate_reg_1_1_6 | inflight_tag_match_reg_2_1 &
    forward_mask_candidate_reg_1_2_6 | inflight_tag_match_reg_3_1 & forward_mask_candidate_reg_1_3_6; // @[Mux.scala 27:73]
  wire  selectedInflightMask_1_7 = inflight_tag_match_reg_0_1 & forward_mask_candidate_reg_1_0_7 |
    inflight_tag_match_reg_1_1 & forward_mask_candidate_reg_1_1_7 | inflight_tag_match_reg_2_1 &
    forward_mask_candidate_reg_1_2_7 | inflight_tag_match_reg_3_1 & forward_mask_candidate_reg_1_3_7; // @[Mux.scala 27:73]
  wire  selectedInflightMask_1_8 = inflight_tag_match_reg_0_1 & forward_mask_candidate_reg_1_0_8 |
    inflight_tag_match_reg_1_1 & forward_mask_candidate_reg_1_1_8 | inflight_tag_match_reg_2_1 &
    forward_mask_candidate_reg_1_2_8 | inflight_tag_match_reg_3_1 & forward_mask_candidate_reg_1_3_8; // @[Mux.scala 27:73]
  wire  selectedInflightMask_1_9 = inflight_tag_match_reg_0_1 & forward_mask_candidate_reg_1_0_9 |
    inflight_tag_match_reg_1_1 & forward_mask_candidate_reg_1_1_9 | inflight_tag_match_reg_2_1 &
    forward_mask_candidate_reg_1_2_9 | inflight_tag_match_reg_3_1 & forward_mask_candidate_reg_1_3_9; // @[Mux.scala 27:73]
  wire  selectedInflightMask_1_10 = inflight_tag_match_reg_0_1 & forward_mask_candidate_reg_1_0_10 |
    inflight_tag_match_reg_1_1 & forward_mask_candidate_reg_1_1_10 | inflight_tag_match_reg_2_1 &
    forward_mask_candidate_reg_1_2_10 | inflight_tag_match_reg_3_1 & forward_mask_candidate_reg_1_3_10; // @[Mux.scala 27:73]
  wire  selectedInflightMask_1_11 = inflight_tag_match_reg_0_1 & forward_mask_candidate_reg_1_0_11 |
    inflight_tag_match_reg_1_1 & forward_mask_candidate_reg_1_1_11 | inflight_tag_match_reg_2_1 &
    forward_mask_candidate_reg_1_2_11 | inflight_tag_match_reg_3_1 & forward_mask_candidate_reg_1_3_11; // @[Mux.scala 27:73]
  wire  selectedInflightMask_1_12 = inflight_tag_match_reg_0_1 & forward_mask_candidate_reg_1_0_12 |
    inflight_tag_match_reg_1_1 & forward_mask_candidate_reg_1_1_12 | inflight_tag_match_reg_2_1 &
    forward_mask_candidate_reg_1_2_12 | inflight_tag_match_reg_3_1 & forward_mask_candidate_reg_1_3_12; // @[Mux.scala 27:73]
  wire  selectedInflightMask_1_13 = inflight_tag_match_reg_0_1 & forward_mask_candidate_reg_1_0_13 |
    inflight_tag_match_reg_1_1 & forward_mask_candidate_reg_1_1_13 | inflight_tag_match_reg_2_1 &
    forward_mask_candidate_reg_1_2_13 | inflight_tag_match_reg_3_1 & forward_mask_candidate_reg_1_3_13; // @[Mux.scala 27:73]
  wire  selectedInflightMask_1_14 = inflight_tag_match_reg_0_1 & forward_mask_candidate_reg_1_0_14 |
    inflight_tag_match_reg_1_1 & forward_mask_candidate_reg_1_1_14 | inflight_tag_match_reg_2_1 &
    forward_mask_candidate_reg_1_2_14 | inflight_tag_match_reg_3_1 & forward_mask_candidate_reg_1_3_14; // @[Mux.scala 27:73]
  wire  selectedInflightMask_1_15 = inflight_tag_match_reg_0_1 & forward_mask_candidate_reg_1_0_15 |
    inflight_tag_match_reg_1_1 & forward_mask_candidate_reg_1_1_15 | inflight_tag_match_reg_2_1 &
    forward_mask_candidate_reg_1_2_15 | inflight_tag_match_reg_3_1 & forward_mask_candidate_reg_1_3_15; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_112 = inflight_tag_match_reg_0_1 ? forward_data_candidate_reg_1_0_0 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_113 = inflight_tag_match_reg_1_1 ? forward_data_candidate_reg_1_1_0 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_114 = inflight_tag_match_reg_2_1 ? forward_data_candidate_reg_1_2_0 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_115 = inflight_tag_match_reg_3_1 ? forward_data_candidate_reg_1_3_0 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_116 = _selectedInflightData_T_112 | _selectedInflightData_T_113; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_117 = _selectedInflightData_T_116 | _selectedInflightData_T_114; // @[Mux.scala 27:73]
  wire [7:0] selectedInflightData_1_0 = _selectedInflightData_T_117 | _selectedInflightData_T_115; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_119 = inflight_tag_match_reg_0_1 ? forward_data_candidate_reg_1_0_1 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_120 = inflight_tag_match_reg_1_1 ? forward_data_candidate_reg_1_1_1 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_121 = inflight_tag_match_reg_2_1 ? forward_data_candidate_reg_1_2_1 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_122 = inflight_tag_match_reg_3_1 ? forward_data_candidate_reg_1_3_1 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_123 = _selectedInflightData_T_119 | _selectedInflightData_T_120; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_124 = _selectedInflightData_T_123 | _selectedInflightData_T_121; // @[Mux.scala 27:73]
  wire [7:0] selectedInflightData_1_1 = _selectedInflightData_T_124 | _selectedInflightData_T_122; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_126 = inflight_tag_match_reg_0_1 ? forward_data_candidate_reg_1_0_2 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_127 = inflight_tag_match_reg_1_1 ? forward_data_candidate_reg_1_1_2 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_128 = inflight_tag_match_reg_2_1 ? forward_data_candidate_reg_1_2_2 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_129 = inflight_tag_match_reg_3_1 ? forward_data_candidate_reg_1_3_2 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_130 = _selectedInflightData_T_126 | _selectedInflightData_T_127; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_131 = _selectedInflightData_T_130 | _selectedInflightData_T_128; // @[Mux.scala 27:73]
  wire [7:0] selectedInflightData_1_2 = _selectedInflightData_T_131 | _selectedInflightData_T_129; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_133 = inflight_tag_match_reg_0_1 ? forward_data_candidate_reg_1_0_3 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_134 = inflight_tag_match_reg_1_1 ? forward_data_candidate_reg_1_1_3 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_135 = inflight_tag_match_reg_2_1 ? forward_data_candidate_reg_1_2_3 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_136 = inflight_tag_match_reg_3_1 ? forward_data_candidate_reg_1_3_3 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_137 = _selectedInflightData_T_133 | _selectedInflightData_T_134; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_138 = _selectedInflightData_T_137 | _selectedInflightData_T_135; // @[Mux.scala 27:73]
  wire [7:0] selectedInflightData_1_3 = _selectedInflightData_T_138 | _selectedInflightData_T_136; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_140 = inflight_tag_match_reg_0_1 ? forward_data_candidate_reg_1_0_4 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_141 = inflight_tag_match_reg_1_1 ? forward_data_candidate_reg_1_1_4 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_142 = inflight_tag_match_reg_2_1 ? forward_data_candidate_reg_1_2_4 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_143 = inflight_tag_match_reg_3_1 ? forward_data_candidate_reg_1_3_4 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_144 = _selectedInflightData_T_140 | _selectedInflightData_T_141; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_145 = _selectedInflightData_T_144 | _selectedInflightData_T_142; // @[Mux.scala 27:73]
  wire [7:0] selectedInflightData_1_4 = _selectedInflightData_T_145 | _selectedInflightData_T_143; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_147 = inflight_tag_match_reg_0_1 ? forward_data_candidate_reg_1_0_5 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_148 = inflight_tag_match_reg_1_1 ? forward_data_candidate_reg_1_1_5 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_149 = inflight_tag_match_reg_2_1 ? forward_data_candidate_reg_1_2_5 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_150 = inflight_tag_match_reg_3_1 ? forward_data_candidate_reg_1_3_5 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_151 = _selectedInflightData_T_147 | _selectedInflightData_T_148; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_152 = _selectedInflightData_T_151 | _selectedInflightData_T_149; // @[Mux.scala 27:73]
  wire [7:0] selectedInflightData_1_5 = _selectedInflightData_T_152 | _selectedInflightData_T_150; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_154 = inflight_tag_match_reg_0_1 ? forward_data_candidate_reg_1_0_6 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_155 = inflight_tag_match_reg_1_1 ? forward_data_candidate_reg_1_1_6 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_156 = inflight_tag_match_reg_2_1 ? forward_data_candidate_reg_1_2_6 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_157 = inflight_tag_match_reg_3_1 ? forward_data_candidate_reg_1_3_6 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_158 = _selectedInflightData_T_154 | _selectedInflightData_T_155; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_159 = _selectedInflightData_T_158 | _selectedInflightData_T_156; // @[Mux.scala 27:73]
  wire [7:0] selectedInflightData_1_6 = _selectedInflightData_T_159 | _selectedInflightData_T_157; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_161 = inflight_tag_match_reg_0_1 ? forward_data_candidate_reg_1_0_7 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_162 = inflight_tag_match_reg_1_1 ? forward_data_candidate_reg_1_1_7 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_163 = inflight_tag_match_reg_2_1 ? forward_data_candidate_reg_1_2_7 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_164 = inflight_tag_match_reg_3_1 ? forward_data_candidate_reg_1_3_7 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_165 = _selectedInflightData_T_161 | _selectedInflightData_T_162; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_166 = _selectedInflightData_T_165 | _selectedInflightData_T_163; // @[Mux.scala 27:73]
  wire [7:0] selectedInflightData_1_7 = _selectedInflightData_T_166 | _selectedInflightData_T_164; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_168 = inflight_tag_match_reg_0_1 ? forward_data_candidate_reg_1_0_8 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_169 = inflight_tag_match_reg_1_1 ? forward_data_candidate_reg_1_1_8 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_170 = inflight_tag_match_reg_2_1 ? forward_data_candidate_reg_1_2_8 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_171 = inflight_tag_match_reg_3_1 ? forward_data_candidate_reg_1_3_8 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_172 = _selectedInflightData_T_168 | _selectedInflightData_T_169; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_173 = _selectedInflightData_T_172 | _selectedInflightData_T_170; // @[Mux.scala 27:73]
  wire [7:0] selectedInflightData_1_8 = _selectedInflightData_T_173 | _selectedInflightData_T_171; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_175 = inflight_tag_match_reg_0_1 ? forward_data_candidate_reg_1_0_9 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_176 = inflight_tag_match_reg_1_1 ? forward_data_candidate_reg_1_1_9 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_177 = inflight_tag_match_reg_2_1 ? forward_data_candidate_reg_1_2_9 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_178 = inflight_tag_match_reg_3_1 ? forward_data_candidate_reg_1_3_9 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_179 = _selectedInflightData_T_175 | _selectedInflightData_T_176; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_180 = _selectedInflightData_T_179 | _selectedInflightData_T_177; // @[Mux.scala 27:73]
  wire [7:0] selectedInflightData_1_9 = _selectedInflightData_T_180 | _selectedInflightData_T_178; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_182 = inflight_tag_match_reg_0_1 ? forward_data_candidate_reg_1_0_10 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_183 = inflight_tag_match_reg_1_1 ? forward_data_candidate_reg_1_1_10 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_184 = inflight_tag_match_reg_2_1 ? forward_data_candidate_reg_1_2_10 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_185 = inflight_tag_match_reg_3_1 ? forward_data_candidate_reg_1_3_10 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_186 = _selectedInflightData_T_182 | _selectedInflightData_T_183; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_187 = _selectedInflightData_T_186 | _selectedInflightData_T_184; // @[Mux.scala 27:73]
  wire [7:0] selectedInflightData_1_10 = _selectedInflightData_T_187 | _selectedInflightData_T_185; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_189 = inflight_tag_match_reg_0_1 ? forward_data_candidate_reg_1_0_11 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_190 = inflight_tag_match_reg_1_1 ? forward_data_candidate_reg_1_1_11 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_191 = inflight_tag_match_reg_2_1 ? forward_data_candidate_reg_1_2_11 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_192 = inflight_tag_match_reg_3_1 ? forward_data_candidate_reg_1_3_11 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_193 = _selectedInflightData_T_189 | _selectedInflightData_T_190; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_194 = _selectedInflightData_T_193 | _selectedInflightData_T_191; // @[Mux.scala 27:73]
  wire [7:0] selectedInflightData_1_11 = _selectedInflightData_T_194 | _selectedInflightData_T_192; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_196 = inflight_tag_match_reg_0_1 ? forward_data_candidate_reg_1_0_12 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_197 = inflight_tag_match_reg_1_1 ? forward_data_candidate_reg_1_1_12 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_198 = inflight_tag_match_reg_2_1 ? forward_data_candidate_reg_1_2_12 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_199 = inflight_tag_match_reg_3_1 ? forward_data_candidate_reg_1_3_12 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_200 = _selectedInflightData_T_196 | _selectedInflightData_T_197; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_201 = _selectedInflightData_T_200 | _selectedInflightData_T_198; // @[Mux.scala 27:73]
  wire [7:0] selectedInflightData_1_12 = _selectedInflightData_T_201 | _selectedInflightData_T_199; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_203 = inflight_tag_match_reg_0_1 ? forward_data_candidate_reg_1_0_13 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_204 = inflight_tag_match_reg_1_1 ? forward_data_candidate_reg_1_1_13 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_205 = inflight_tag_match_reg_2_1 ? forward_data_candidate_reg_1_2_13 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_206 = inflight_tag_match_reg_3_1 ? forward_data_candidate_reg_1_3_13 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_207 = _selectedInflightData_T_203 | _selectedInflightData_T_204; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_208 = _selectedInflightData_T_207 | _selectedInflightData_T_205; // @[Mux.scala 27:73]
  wire [7:0] selectedInflightData_1_13 = _selectedInflightData_T_208 | _selectedInflightData_T_206; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_210 = inflight_tag_match_reg_0_1 ? forward_data_candidate_reg_1_0_14 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_211 = inflight_tag_match_reg_1_1 ? forward_data_candidate_reg_1_1_14 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_212 = inflight_tag_match_reg_2_1 ? forward_data_candidate_reg_1_2_14 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_213 = inflight_tag_match_reg_3_1 ? forward_data_candidate_reg_1_3_14 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_214 = _selectedInflightData_T_210 | _selectedInflightData_T_211; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_215 = _selectedInflightData_T_214 | _selectedInflightData_T_212; // @[Mux.scala 27:73]
  wire [7:0] selectedInflightData_1_14 = _selectedInflightData_T_215 | _selectedInflightData_T_213; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_217 = inflight_tag_match_reg_0_1 ? forward_data_candidate_reg_1_0_15 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_218 = inflight_tag_match_reg_1_1 ? forward_data_candidate_reg_1_1_15 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_219 = inflight_tag_match_reg_2_1 ? forward_data_candidate_reg_1_2_15 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_220 = inflight_tag_match_reg_3_1 ? forward_data_candidate_reg_1_3_15 : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_221 = _selectedInflightData_T_217 | _selectedInflightData_T_218; // @[Mux.scala 27:73]
  wire [7:0] _selectedInflightData_T_222 = _selectedInflightData_T_221 | _selectedInflightData_T_219; // @[Mux.scala 27:73]
  wire [7:0] selectedInflightData_1_15 = _selectedInflightData_T_222 | _selectedInflightData_T_220; // @[Mux.scala 27:73]
  wire  _perf_valid_entry_count_T_1 = ~invalidMask_0; // @[Sbuffer.scala 802:75]
  wire  _perf_valid_entry_count_T_3 = ~invalidMask_1; // @[Sbuffer.scala 802:75]
  wire  _perf_valid_entry_count_T_5 = ~invalidMask_2; // @[Sbuffer.scala 802:75]
  wire  _perf_valid_entry_count_T_7 = ~invalidMask_3; // @[Sbuffer.scala 802:75]
  wire [3:0] _perf_valid_entry_count_T_8 = {_perf_valid_entry_count_T_7,_perf_valid_entry_count_T_5,
    _perf_valid_entry_count_T_3,_perf_valid_entry_count_T_1}; // @[Sbuffer.scala 802:92]
  wire [1:0] _perf_valid_entry_count_T_13 = _perf_valid_entry_count_T_8[0] + _perf_valid_entry_count_T_8[1]; // @[Bitwise.scala 48:55]
  wire [1:0] _perf_valid_entry_count_T_15 = _perf_valid_entry_count_T_8[2] + _perf_valid_entry_count_T_8[3]; // @[Bitwise.scala 48:55]
  reg [2:0] perf_valid_entry_count; // @[Sbuffer.scala 802:39]
  wire [1:0] _T_391 = {io_in_1_valid,io_in_0_valid}; // @[Sbuffer.scala 804:78]
  wire [1:0] _T_398 = {_T_58,_T_32}; // @[Sbuffer.scala 805:78]
  wire  _T_404 = _T_32 & canMerge_0; // @[Sbuffer.scala 806:104]
  wire  _T_406 = _T_58 & canMerge_1; // @[Sbuffer.scala 806:104]
  wire [1:0] _T_407 = {_T_406,_T_404}; // @[Sbuffer.scala 806:122]
  wire  _T_414 = _T_32 & ~canMerge_0; // @[Sbuffer.scala 807:106]
  wire  _T_417 = _T_58 & ~canMerge_1; // @[Sbuffer.scala 807:106]
  wire [1:0] _T_418 = {_T_417,_T_414}; // @[Sbuffer.scala 807:125]
  wire [2:0] _T_467 = 3'h4 / 2'h2; // @[Sbuffer.scala 839:126]
  wire [4:0] _T_472 = 3'h4 * 2'h3; // @[Sbuffer.scala 840:126]
  wire [4:0] _T_473 = _T_472 / 3'h4; // @[Sbuffer.scala 840:130]
  wire [4:0] _GEN_2274 = {{2'd0}, perf_valid_entry_count}; // @[Sbuffer.scala 840:105]
  reg [1:0] io_perf_0_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg [1:0] io_perf_0_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg [1:0] io_perf_1_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg [1:0] io_perf_1_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg [1:0] io_perf_2_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg [1:0] io_perf_2_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg [1:0] io_perf_3_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg [1:0] io_perf_3_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg  io_perf_4_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg  io_perf_4_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg  io_perf_5_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg  io_perf_5_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg  io_perf_6_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg  io_perf_6_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg  io_perf_7_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg  io_perf_7_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg  io_perf_8_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg  io_perf_8_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg  io_perf_9_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg  io_perf_9_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg  io_perf_10_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg  io_perf_10_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg  io_perf_11_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg  io_perf_11_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg  io_perf_12_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg  io_perf_12_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg  io_perf_13_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg  io_perf_13_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg  io_perf_14_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg  io_perf_14_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg  io_perf_15_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg  io_perf_15_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg  io_perf_16_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg  io_perf_16_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  SbufferData dataModule ( // @[Sbuffer.scala 197:26]
    .clock(dataModule_clock),
    .reset(dataModule_reset),
    .io_writeReq_0_valid(dataModule_io_writeReq_0_valid),
    .io_writeReq_0_bits_wvec(dataModule_io_writeReq_0_bits_wvec),
    .io_writeReq_0_bits_mask(dataModule_io_writeReq_0_bits_mask),
    .io_writeReq_0_bits_data(dataModule_io_writeReq_0_bits_data),
    .io_writeReq_0_bits_vwordOffset(dataModule_io_writeReq_0_bits_vwordOffset),
    .io_writeReq_0_bits_wline(dataModule_io_writeReq_0_bits_wline),
    .io_writeReq_1_valid(dataModule_io_writeReq_1_valid),
    .io_writeReq_1_bits_wvec(dataModule_io_writeReq_1_bits_wvec),
    .io_writeReq_1_bits_mask(dataModule_io_writeReq_1_bits_mask),
    .io_writeReq_1_bits_data(dataModule_io_writeReq_1_bits_data),
    .io_writeReq_1_bits_vwordOffset(dataModule_io_writeReq_1_bits_vwordOffset),
    .io_writeReq_1_bits_wline(dataModule_io_writeReq_1_bits_wline),
    .io_maskFlushReq_0_valid(dataModule_io_maskFlushReq_0_valid),
    .io_maskFlushReq_0_bits_wvec(dataModule_io_maskFlushReq_0_bits_wvec),
    .io_maskFlushReq_1_valid(dataModule_io_maskFlushReq_1_valid),
    .io_maskFlushReq_1_bits_wvec(dataModule_io_maskFlushReq_1_bits_wvec),
    .io_dataOut_0_0_0(dataModule_io_dataOut_0_0_0),
    .io_dataOut_0_0_1(dataModule_io_dataOut_0_0_1),
    .io_dataOut_0_0_2(dataModule_io_dataOut_0_0_2),
    .io_dataOut_0_0_3(dataModule_io_dataOut_0_0_3),
    .io_dataOut_0_0_4(dataModule_io_dataOut_0_0_4),
    .io_dataOut_0_0_5(dataModule_io_dataOut_0_0_5),
    .io_dataOut_0_0_6(dataModule_io_dataOut_0_0_6),
    .io_dataOut_0_0_7(dataModule_io_dataOut_0_0_7),
    .io_dataOut_0_0_8(dataModule_io_dataOut_0_0_8),
    .io_dataOut_0_0_9(dataModule_io_dataOut_0_0_9),
    .io_dataOut_0_0_10(dataModule_io_dataOut_0_0_10),
    .io_dataOut_0_0_11(dataModule_io_dataOut_0_0_11),
    .io_dataOut_0_0_12(dataModule_io_dataOut_0_0_12),
    .io_dataOut_0_0_13(dataModule_io_dataOut_0_0_13),
    .io_dataOut_0_0_14(dataModule_io_dataOut_0_0_14),
    .io_dataOut_0_0_15(dataModule_io_dataOut_0_0_15),
    .io_dataOut_0_1_0(dataModule_io_dataOut_0_1_0),
    .io_dataOut_0_1_1(dataModule_io_dataOut_0_1_1),
    .io_dataOut_0_1_2(dataModule_io_dataOut_0_1_2),
    .io_dataOut_0_1_3(dataModule_io_dataOut_0_1_3),
    .io_dataOut_0_1_4(dataModule_io_dataOut_0_1_4),
    .io_dataOut_0_1_5(dataModule_io_dataOut_0_1_5),
    .io_dataOut_0_1_6(dataModule_io_dataOut_0_1_6),
    .io_dataOut_0_1_7(dataModule_io_dataOut_0_1_7),
    .io_dataOut_0_1_8(dataModule_io_dataOut_0_1_8),
    .io_dataOut_0_1_9(dataModule_io_dataOut_0_1_9),
    .io_dataOut_0_1_10(dataModule_io_dataOut_0_1_10),
    .io_dataOut_0_1_11(dataModule_io_dataOut_0_1_11),
    .io_dataOut_0_1_12(dataModule_io_dataOut_0_1_12),
    .io_dataOut_0_1_13(dataModule_io_dataOut_0_1_13),
    .io_dataOut_0_1_14(dataModule_io_dataOut_0_1_14),
    .io_dataOut_0_1_15(dataModule_io_dataOut_0_1_15),
    .io_dataOut_0_2_0(dataModule_io_dataOut_0_2_0),
    .io_dataOut_0_2_1(dataModule_io_dataOut_0_2_1),
    .io_dataOut_0_2_2(dataModule_io_dataOut_0_2_2),
    .io_dataOut_0_2_3(dataModule_io_dataOut_0_2_3),
    .io_dataOut_0_2_4(dataModule_io_dataOut_0_2_4),
    .io_dataOut_0_2_5(dataModule_io_dataOut_0_2_5),
    .io_dataOut_0_2_6(dataModule_io_dataOut_0_2_6),
    .io_dataOut_0_2_7(dataModule_io_dataOut_0_2_7),
    .io_dataOut_0_2_8(dataModule_io_dataOut_0_2_8),
    .io_dataOut_0_2_9(dataModule_io_dataOut_0_2_9),
    .io_dataOut_0_2_10(dataModule_io_dataOut_0_2_10),
    .io_dataOut_0_2_11(dataModule_io_dataOut_0_2_11),
    .io_dataOut_0_2_12(dataModule_io_dataOut_0_2_12),
    .io_dataOut_0_2_13(dataModule_io_dataOut_0_2_13),
    .io_dataOut_0_2_14(dataModule_io_dataOut_0_2_14),
    .io_dataOut_0_2_15(dataModule_io_dataOut_0_2_15),
    .io_dataOut_0_3_0(dataModule_io_dataOut_0_3_0),
    .io_dataOut_0_3_1(dataModule_io_dataOut_0_3_1),
    .io_dataOut_0_3_2(dataModule_io_dataOut_0_3_2),
    .io_dataOut_0_3_3(dataModule_io_dataOut_0_3_3),
    .io_dataOut_0_3_4(dataModule_io_dataOut_0_3_4),
    .io_dataOut_0_3_5(dataModule_io_dataOut_0_3_5),
    .io_dataOut_0_3_6(dataModule_io_dataOut_0_3_6),
    .io_dataOut_0_3_7(dataModule_io_dataOut_0_3_7),
    .io_dataOut_0_3_8(dataModule_io_dataOut_0_3_8),
    .io_dataOut_0_3_9(dataModule_io_dataOut_0_3_9),
    .io_dataOut_0_3_10(dataModule_io_dataOut_0_3_10),
    .io_dataOut_0_3_11(dataModule_io_dataOut_0_3_11),
    .io_dataOut_0_3_12(dataModule_io_dataOut_0_3_12),
    .io_dataOut_0_3_13(dataModule_io_dataOut_0_3_13),
    .io_dataOut_0_3_14(dataModule_io_dataOut_0_3_14),
    .io_dataOut_0_3_15(dataModule_io_dataOut_0_3_15),
    .io_dataOut_1_0_0(dataModule_io_dataOut_1_0_0),
    .io_dataOut_1_0_1(dataModule_io_dataOut_1_0_1),
    .io_dataOut_1_0_2(dataModule_io_dataOut_1_0_2),
    .io_dataOut_1_0_3(dataModule_io_dataOut_1_0_3),
    .io_dataOut_1_0_4(dataModule_io_dataOut_1_0_4),
    .io_dataOut_1_0_5(dataModule_io_dataOut_1_0_5),
    .io_dataOut_1_0_6(dataModule_io_dataOut_1_0_6),
    .io_dataOut_1_0_7(dataModule_io_dataOut_1_0_7),
    .io_dataOut_1_0_8(dataModule_io_dataOut_1_0_8),
    .io_dataOut_1_0_9(dataModule_io_dataOut_1_0_9),
    .io_dataOut_1_0_10(dataModule_io_dataOut_1_0_10),
    .io_dataOut_1_0_11(dataModule_io_dataOut_1_0_11),
    .io_dataOut_1_0_12(dataModule_io_dataOut_1_0_12),
    .io_dataOut_1_0_13(dataModule_io_dataOut_1_0_13),
    .io_dataOut_1_0_14(dataModule_io_dataOut_1_0_14),
    .io_dataOut_1_0_15(dataModule_io_dataOut_1_0_15),
    .io_dataOut_1_1_0(dataModule_io_dataOut_1_1_0),
    .io_dataOut_1_1_1(dataModule_io_dataOut_1_1_1),
    .io_dataOut_1_1_2(dataModule_io_dataOut_1_1_2),
    .io_dataOut_1_1_3(dataModule_io_dataOut_1_1_3),
    .io_dataOut_1_1_4(dataModule_io_dataOut_1_1_4),
    .io_dataOut_1_1_5(dataModule_io_dataOut_1_1_5),
    .io_dataOut_1_1_6(dataModule_io_dataOut_1_1_6),
    .io_dataOut_1_1_7(dataModule_io_dataOut_1_1_7),
    .io_dataOut_1_1_8(dataModule_io_dataOut_1_1_8),
    .io_dataOut_1_1_9(dataModule_io_dataOut_1_1_9),
    .io_dataOut_1_1_10(dataModule_io_dataOut_1_1_10),
    .io_dataOut_1_1_11(dataModule_io_dataOut_1_1_11),
    .io_dataOut_1_1_12(dataModule_io_dataOut_1_1_12),
    .io_dataOut_1_1_13(dataModule_io_dataOut_1_1_13),
    .io_dataOut_1_1_14(dataModule_io_dataOut_1_1_14),
    .io_dataOut_1_1_15(dataModule_io_dataOut_1_1_15),
    .io_dataOut_1_2_0(dataModule_io_dataOut_1_2_0),
    .io_dataOut_1_2_1(dataModule_io_dataOut_1_2_1),
    .io_dataOut_1_2_2(dataModule_io_dataOut_1_2_2),
    .io_dataOut_1_2_3(dataModule_io_dataOut_1_2_3),
    .io_dataOut_1_2_4(dataModule_io_dataOut_1_2_4),
    .io_dataOut_1_2_5(dataModule_io_dataOut_1_2_5),
    .io_dataOut_1_2_6(dataModule_io_dataOut_1_2_6),
    .io_dataOut_1_2_7(dataModule_io_dataOut_1_2_7),
    .io_dataOut_1_2_8(dataModule_io_dataOut_1_2_8),
    .io_dataOut_1_2_9(dataModule_io_dataOut_1_2_9),
    .io_dataOut_1_2_10(dataModule_io_dataOut_1_2_10),
    .io_dataOut_1_2_11(dataModule_io_dataOut_1_2_11),
    .io_dataOut_1_2_12(dataModule_io_dataOut_1_2_12),
    .io_dataOut_1_2_13(dataModule_io_dataOut_1_2_13),
    .io_dataOut_1_2_14(dataModule_io_dataOut_1_2_14),
    .io_dataOut_1_2_15(dataModule_io_dataOut_1_2_15),
    .io_dataOut_1_3_0(dataModule_io_dataOut_1_3_0),
    .io_dataOut_1_3_1(dataModule_io_dataOut_1_3_1),
    .io_dataOut_1_3_2(dataModule_io_dataOut_1_3_2),
    .io_dataOut_1_3_3(dataModule_io_dataOut_1_3_3),
    .io_dataOut_1_3_4(dataModule_io_dataOut_1_3_4),
    .io_dataOut_1_3_5(dataModule_io_dataOut_1_3_5),
    .io_dataOut_1_3_6(dataModule_io_dataOut_1_3_6),
    .io_dataOut_1_3_7(dataModule_io_dataOut_1_3_7),
    .io_dataOut_1_3_8(dataModule_io_dataOut_1_3_8),
    .io_dataOut_1_3_9(dataModule_io_dataOut_1_3_9),
    .io_dataOut_1_3_10(dataModule_io_dataOut_1_3_10),
    .io_dataOut_1_3_11(dataModule_io_dataOut_1_3_11),
    .io_dataOut_1_3_12(dataModule_io_dataOut_1_3_12),
    .io_dataOut_1_3_13(dataModule_io_dataOut_1_3_13),
    .io_dataOut_1_3_14(dataModule_io_dataOut_1_3_14),
    .io_dataOut_1_3_15(dataModule_io_dataOut_1_3_15),
    .io_dataOut_2_0_0(dataModule_io_dataOut_2_0_0),
    .io_dataOut_2_0_1(dataModule_io_dataOut_2_0_1),
    .io_dataOut_2_0_2(dataModule_io_dataOut_2_0_2),
    .io_dataOut_2_0_3(dataModule_io_dataOut_2_0_3),
    .io_dataOut_2_0_4(dataModule_io_dataOut_2_0_4),
    .io_dataOut_2_0_5(dataModule_io_dataOut_2_0_5),
    .io_dataOut_2_0_6(dataModule_io_dataOut_2_0_6),
    .io_dataOut_2_0_7(dataModule_io_dataOut_2_0_7),
    .io_dataOut_2_0_8(dataModule_io_dataOut_2_0_8),
    .io_dataOut_2_0_9(dataModule_io_dataOut_2_0_9),
    .io_dataOut_2_0_10(dataModule_io_dataOut_2_0_10),
    .io_dataOut_2_0_11(dataModule_io_dataOut_2_0_11),
    .io_dataOut_2_0_12(dataModule_io_dataOut_2_0_12),
    .io_dataOut_2_0_13(dataModule_io_dataOut_2_0_13),
    .io_dataOut_2_0_14(dataModule_io_dataOut_2_0_14),
    .io_dataOut_2_0_15(dataModule_io_dataOut_2_0_15),
    .io_dataOut_2_1_0(dataModule_io_dataOut_2_1_0),
    .io_dataOut_2_1_1(dataModule_io_dataOut_2_1_1),
    .io_dataOut_2_1_2(dataModule_io_dataOut_2_1_2),
    .io_dataOut_2_1_3(dataModule_io_dataOut_2_1_3),
    .io_dataOut_2_1_4(dataModule_io_dataOut_2_1_4),
    .io_dataOut_2_1_5(dataModule_io_dataOut_2_1_5),
    .io_dataOut_2_1_6(dataModule_io_dataOut_2_1_6),
    .io_dataOut_2_1_7(dataModule_io_dataOut_2_1_7),
    .io_dataOut_2_1_8(dataModule_io_dataOut_2_1_8),
    .io_dataOut_2_1_9(dataModule_io_dataOut_2_1_9),
    .io_dataOut_2_1_10(dataModule_io_dataOut_2_1_10),
    .io_dataOut_2_1_11(dataModule_io_dataOut_2_1_11),
    .io_dataOut_2_1_12(dataModule_io_dataOut_2_1_12),
    .io_dataOut_2_1_13(dataModule_io_dataOut_2_1_13),
    .io_dataOut_2_1_14(dataModule_io_dataOut_2_1_14),
    .io_dataOut_2_1_15(dataModule_io_dataOut_2_1_15),
    .io_dataOut_2_2_0(dataModule_io_dataOut_2_2_0),
    .io_dataOut_2_2_1(dataModule_io_dataOut_2_2_1),
    .io_dataOut_2_2_2(dataModule_io_dataOut_2_2_2),
    .io_dataOut_2_2_3(dataModule_io_dataOut_2_2_3),
    .io_dataOut_2_2_4(dataModule_io_dataOut_2_2_4),
    .io_dataOut_2_2_5(dataModule_io_dataOut_2_2_5),
    .io_dataOut_2_2_6(dataModule_io_dataOut_2_2_6),
    .io_dataOut_2_2_7(dataModule_io_dataOut_2_2_7),
    .io_dataOut_2_2_8(dataModule_io_dataOut_2_2_8),
    .io_dataOut_2_2_9(dataModule_io_dataOut_2_2_9),
    .io_dataOut_2_2_10(dataModule_io_dataOut_2_2_10),
    .io_dataOut_2_2_11(dataModule_io_dataOut_2_2_11),
    .io_dataOut_2_2_12(dataModule_io_dataOut_2_2_12),
    .io_dataOut_2_2_13(dataModule_io_dataOut_2_2_13),
    .io_dataOut_2_2_14(dataModule_io_dataOut_2_2_14),
    .io_dataOut_2_2_15(dataModule_io_dataOut_2_2_15),
    .io_dataOut_2_3_0(dataModule_io_dataOut_2_3_0),
    .io_dataOut_2_3_1(dataModule_io_dataOut_2_3_1),
    .io_dataOut_2_3_2(dataModule_io_dataOut_2_3_2),
    .io_dataOut_2_3_3(dataModule_io_dataOut_2_3_3),
    .io_dataOut_2_3_4(dataModule_io_dataOut_2_3_4),
    .io_dataOut_2_3_5(dataModule_io_dataOut_2_3_5),
    .io_dataOut_2_3_6(dataModule_io_dataOut_2_3_6),
    .io_dataOut_2_3_7(dataModule_io_dataOut_2_3_7),
    .io_dataOut_2_3_8(dataModule_io_dataOut_2_3_8),
    .io_dataOut_2_3_9(dataModule_io_dataOut_2_3_9),
    .io_dataOut_2_3_10(dataModule_io_dataOut_2_3_10),
    .io_dataOut_2_3_11(dataModule_io_dataOut_2_3_11),
    .io_dataOut_2_3_12(dataModule_io_dataOut_2_3_12),
    .io_dataOut_2_3_13(dataModule_io_dataOut_2_3_13),
    .io_dataOut_2_3_14(dataModule_io_dataOut_2_3_14),
    .io_dataOut_2_3_15(dataModule_io_dataOut_2_3_15),
    .io_dataOut_3_0_0(dataModule_io_dataOut_3_0_0),
    .io_dataOut_3_0_1(dataModule_io_dataOut_3_0_1),
    .io_dataOut_3_0_2(dataModule_io_dataOut_3_0_2),
    .io_dataOut_3_0_3(dataModule_io_dataOut_3_0_3),
    .io_dataOut_3_0_4(dataModule_io_dataOut_3_0_4),
    .io_dataOut_3_0_5(dataModule_io_dataOut_3_0_5),
    .io_dataOut_3_0_6(dataModule_io_dataOut_3_0_6),
    .io_dataOut_3_0_7(dataModule_io_dataOut_3_0_7),
    .io_dataOut_3_0_8(dataModule_io_dataOut_3_0_8),
    .io_dataOut_3_0_9(dataModule_io_dataOut_3_0_9),
    .io_dataOut_3_0_10(dataModule_io_dataOut_3_0_10),
    .io_dataOut_3_0_11(dataModule_io_dataOut_3_0_11),
    .io_dataOut_3_0_12(dataModule_io_dataOut_3_0_12),
    .io_dataOut_3_0_13(dataModule_io_dataOut_3_0_13),
    .io_dataOut_3_0_14(dataModule_io_dataOut_3_0_14),
    .io_dataOut_3_0_15(dataModule_io_dataOut_3_0_15),
    .io_dataOut_3_1_0(dataModule_io_dataOut_3_1_0),
    .io_dataOut_3_1_1(dataModule_io_dataOut_3_1_1),
    .io_dataOut_3_1_2(dataModule_io_dataOut_3_1_2),
    .io_dataOut_3_1_3(dataModule_io_dataOut_3_1_3),
    .io_dataOut_3_1_4(dataModule_io_dataOut_3_1_4),
    .io_dataOut_3_1_5(dataModule_io_dataOut_3_1_5),
    .io_dataOut_3_1_6(dataModule_io_dataOut_3_1_6),
    .io_dataOut_3_1_7(dataModule_io_dataOut_3_1_7),
    .io_dataOut_3_1_8(dataModule_io_dataOut_3_1_8),
    .io_dataOut_3_1_9(dataModule_io_dataOut_3_1_9),
    .io_dataOut_3_1_10(dataModule_io_dataOut_3_1_10),
    .io_dataOut_3_1_11(dataModule_io_dataOut_3_1_11),
    .io_dataOut_3_1_12(dataModule_io_dataOut_3_1_12),
    .io_dataOut_3_1_13(dataModule_io_dataOut_3_1_13),
    .io_dataOut_3_1_14(dataModule_io_dataOut_3_1_14),
    .io_dataOut_3_1_15(dataModule_io_dataOut_3_1_15),
    .io_dataOut_3_2_0(dataModule_io_dataOut_3_2_0),
    .io_dataOut_3_2_1(dataModule_io_dataOut_3_2_1),
    .io_dataOut_3_2_2(dataModule_io_dataOut_3_2_2),
    .io_dataOut_3_2_3(dataModule_io_dataOut_3_2_3),
    .io_dataOut_3_2_4(dataModule_io_dataOut_3_2_4),
    .io_dataOut_3_2_5(dataModule_io_dataOut_3_2_5),
    .io_dataOut_3_2_6(dataModule_io_dataOut_3_2_6),
    .io_dataOut_3_2_7(dataModule_io_dataOut_3_2_7),
    .io_dataOut_3_2_8(dataModule_io_dataOut_3_2_8),
    .io_dataOut_3_2_9(dataModule_io_dataOut_3_2_9),
    .io_dataOut_3_2_10(dataModule_io_dataOut_3_2_10),
    .io_dataOut_3_2_11(dataModule_io_dataOut_3_2_11),
    .io_dataOut_3_2_12(dataModule_io_dataOut_3_2_12),
    .io_dataOut_3_2_13(dataModule_io_dataOut_3_2_13),
    .io_dataOut_3_2_14(dataModule_io_dataOut_3_2_14),
    .io_dataOut_3_2_15(dataModule_io_dataOut_3_2_15),
    .io_dataOut_3_3_0(dataModule_io_dataOut_3_3_0),
    .io_dataOut_3_3_1(dataModule_io_dataOut_3_3_1),
    .io_dataOut_3_3_2(dataModule_io_dataOut_3_3_2),
    .io_dataOut_3_3_3(dataModule_io_dataOut_3_3_3),
    .io_dataOut_3_3_4(dataModule_io_dataOut_3_3_4),
    .io_dataOut_3_3_5(dataModule_io_dataOut_3_3_5),
    .io_dataOut_3_3_6(dataModule_io_dataOut_3_3_6),
    .io_dataOut_3_3_7(dataModule_io_dataOut_3_3_7),
    .io_dataOut_3_3_8(dataModule_io_dataOut_3_3_8),
    .io_dataOut_3_3_9(dataModule_io_dataOut_3_3_9),
    .io_dataOut_3_3_10(dataModule_io_dataOut_3_3_10),
    .io_dataOut_3_3_11(dataModule_io_dataOut_3_3_11),
    .io_dataOut_3_3_12(dataModule_io_dataOut_3_3_12),
    .io_dataOut_3_3_13(dataModule_io_dataOut_3_3_13),
    .io_dataOut_3_3_14(dataModule_io_dataOut_3_3_14),
    .io_dataOut_3_3_15(dataModule_io_dataOut_3_3_15),
    .io_maskOut_0_0_0(dataModule_io_maskOut_0_0_0),
    .io_maskOut_0_0_1(dataModule_io_maskOut_0_0_1),
    .io_maskOut_0_0_2(dataModule_io_maskOut_0_0_2),
    .io_maskOut_0_0_3(dataModule_io_maskOut_0_0_3),
    .io_maskOut_0_0_4(dataModule_io_maskOut_0_0_4),
    .io_maskOut_0_0_5(dataModule_io_maskOut_0_0_5),
    .io_maskOut_0_0_6(dataModule_io_maskOut_0_0_6),
    .io_maskOut_0_0_7(dataModule_io_maskOut_0_0_7),
    .io_maskOut_0_0_8(dataModule_io_maskOut_0_0_8),
    .io_maskOut_0_0_9(dataModule_io_maskOut_0_0_9),
    .io_maskOut_0_0_10(dataModule_io_maskOut_0_0_10),
    .io_maskOut_0_0_11(dataModule_io_maskOut_0_0_11),
    .io_maskOut_0_0_12(dataModule_io_maskOut_0_0_12),
    .io_maskOut_0_0_13(dataModule_io_maskOut_0_0_13),
    .io_maskOut_0_0_14(dataModule_io_maskOut_0_0_14),
    .io_maskOut_0_0_15(dataModule_io_maskOut_0_0_15),
    .io_maskOut_0_1_0(dataModule_io_maskOut_0_1_0),
    .io_maskOut_0_1_1(dataModule_io_maskOut_0_1_1),
    .io_maskOut_0_1_2(dataModule_io_maskOut_0_1_2),
    .io_maskOut_0_1_3(dataModule_io_maskOut_0_1_3),
    .io_maskOut_0_1_4(dataModule_io_maskOut_0_1_4),
    .io_maskOut_0_1_5(dataModule_io_maskOut_0_1_5),
    .io_maskOut_0_1_6(dataModule_io_maskOut_0_1_6),
    .io_maskOut_0_1_7(dataModule_io_maskOut_0_1_7),
    .io_maskOut_0_1_8(dataModule_io_maskOut_0_1_8),
    .io_maskOut_0_1_9(dataModule_io_maskOut_0_1_9),
    .io_maskOut_0_1_10(dataModule_io_maskOut_0_1_10),
    .io_maskOut_0_1_11(dataModule_io_maskOut_0_1_11),
    .io_maskOut_0_1_12(dataModule_io_maskOut_0_1_12),
    .io_maskOut_0_1_13(dataModule_io_maskOut_0_1_13),
    .io_maskOut_0_1_14(dataModule_io_maskOut_0_1_14),
    .io_maskOut_0_1_15(dataModule_io_maskOut_0_1_15),
    .io_maskOut_0_2_0(dataModule_io_maskOut_0_2_0),
    .io_maskOut_0_2_1(dataModule_io_maskOut_0_2_1),
    .io_maskOut_0_2_2(dataModule_io_maskOut_0_2_2),
    .io_maskOut_0_2_3(dataModule_io_maskOut_0_2_3),
    .io_maskOut_0_2_4(dataModule_io_maskOut_0_2_4),
    .io_maskOut_0_2_5(dataModule_io_maskOut_0_2_5),
    .io_maskOut_0_2_6(dataModule_io_maskOut_0_2_6),
    .io_maskOut_0_2_7(dataModule_io_maskOut_0_2_7),
    .io_maskOut_0_2_8(dataModule_io_maskOut_0_2_8),
    .io_maskOut_0_2_9(dataModule_io_maskOut_0_2_9),
    .io_maskOut_0_2_10(dataModule_io_maskOut_0_2_10),
    .io_maskOut_0_2_11(dataModule_io_maskOut_0_2_11),
    .io_maskOut_0_2_12(dataModule_io_maskOut_0_2_12),
    .io_maskOut_0_2_13(dataModule_io_maskOut_0_2_13),
    .io_maskOut_0_2_14(dataModule_io_maskOut_0_2_14),
    .io_maskOut_0_2_15(dataModule_io_maskOut_0_2_15),
    .io_maskOut_0_3_0(dataModule_io_maskOut_0_3_0),
    .io_maskOut_0_3_1(dataModule_io_maskOut_0_3_1),
    .io_maskOut_0_3_2(dataModule_io_maskOut_0_3_2),
    .io_maskOut_0_3_3(dataModule_io_maskOut_0_3_3),
    .io_maskOut_0_3_4(dataModule_io_maskOut_0_3_4),
    .io_maskOut_0_3_5(dataModule_io_maskOut_0_3_5),
    .io_maskOut_0_3_6(dataModule_io_maskOut_0_3_6),
    .io_maskOut_0_3_7(dataModule_io_maskOut_0_3_7),
    .io_maskOut_0_3_8(dataModule_io_maskOut_0_3_8),
    .io_maskOut_0_3_9(dataModule_io_maskOut_0_3_9),
    .io_maskOut_0_3_10(dataModule_io_maskOut_0_3_10),
    .io_maskOut_0_3_11(dataModule_io_maskOut_0_3_11),
    .io_maskOut_0_3_12(dataModule_io_maskOut_0_3_12),
    .io_maskOut_0_3_13(dataModule_io_maskOut_0_3_13),
    .io_maskOut_0_3_14(dataModule_io_maskOut_0_3_14),
    .io_maskOut_0_3_15(dataModule_io_maskOut_0_3_15),
    .io_maskOut_1_0_0(dataModule_io_maskOut_1_0_0),
    .io_maskOut_1_0_1(dataModule_io_maskOut_1_0_1),
    .io_maskOut_1_0_2(dataModule_io_maskOut_1_0_2),
    .io_maskOut_1_0_3(dataModule_io_maskOut_1_0_3),
    .io_maskOut_1_0_4(dataModule_io_maskOut_1_0_4),
    .io_maskOut_1_0_5(dataModule_io_maskOut_1_0_5),
    .io_maskOut_1_0_6(dataModule_io_maskOut_1_0_6),
    .io_maskOut_1_0_7(dataModule_io_maskOut_1_0_7),
    .io_maskOut_1_0_8(dataModule_io_maskOut_1_0_8),
    .io_maskOut_1_0_9(dataModule_io_maskOut_1_0_9),
    .io_maskOut_1_0_10(dataModule_io_maskOut_1_0_10),
    .io_maskOut_1_0_11(dataModule_io_maskOut_1_0_11),
    .io_maskOut_1_0_12(dataModule_io_maskOut_1_0_12),
    .io_maskOut_1_0_13(dataModule_io_maskOut_1_0_13),
    .io_maskOut_1_0_14(dataModule_io_maskOut_1_0_14),
    .io_maskOut_1_0_15(dataModule_io_maskOut_1_0_15),
    .io_maskOut_1_1_0(dataModule_io_maskOut_1_1_0),
    .io_maskOut_1_1_1(dataModule_io_maskOut_1_1_1),
    .io_maskOut_1_1_2(dataModule_io_maskOut_1_1_2),
    .io_maskOut_1_1_3(dataModule_io_maskOut_1_1_3),
    .io_maskOut_1_1_4(dataModule_io_maskOut_1_1_4),
    .io_maskOut_1_1_5(dataModule_io_maskOut_1_1_5),
    .io_maskOut_1_1_6(dataModule_io_maskOut_1_1_6),
    .io_maskOut_1_1_7(dataModule_io_maskOut_1_1_7),
    .io_maskOut_1_1_8(dataModule_io_maskOut_1_1_8),
    .io_maskOut_1_1_9(dataModule_io_maskOut_1_1_9),
    .io_maskOut_1_1_10(dataModule_io_maskOut_1_1_10),
    .io_maskOut_1_1_11(dataModule_io_maskOut_1_1_11),
    .io_maskOut_1_1_12(dataModule_io_maskOut_1_1_12),
    .io_maskOut_1_1_13(dataModule_io_maskOut_1_1_13),
    .io_maskOut_1_1_14(dataModule_io_maskOut_1_1_14),
    .io_maskOut_1_1_15(dataModule_io_maskOut_1_1_15),
    .io_maskOut_1_2_0(dataModule_io_maskOut_1_2_0),
    .io_maskOut_1_2_1(dataModule_io_maskOut_1_2_1),
    .io_maskOut_1_2_2(dataModule_io_maskOut_1_2_2),
    .io_maskOut_1_2_3(dataModule_io_maskOut_1_2_3),
    .io_maskOut_1_2_4(dataModule_io_maskOut_1_2_4),
    .io_maskOut_1_2_5(dataModule_io_maskOut_1_2_5),
    .io_maskOut_1_2_6(dataModule_io_maskOut_1_2_6),
    .io_maskOut_1_2_7(dataModule_io_maskOut_1_2_7),
    .io_maskOut_1_2_8(dataModule_io_maskOut_1_2_8),
    .io_maskOut_1_2_9(dataModule_io_maskOut_1_2_9),
    .io_maskOut_1_2_10(dataModule_io_maskOut_1_2_10),
    .io_maskOut_1_2_11(dataModule_io_maskOut_1_2_11),
    .io_maskOut_1_2_12(dataModule_io_maskOut_1_2_12),
    .io_maskOut_1_2_13(dataModule_io_maskOut_1_2_13),
    .io_maskOut_1_2_14(dataModule_io_maskOut_1_2_14),
    .io_maskOut_1_2_15(dataModule_io_maskOut_1_2_15),
    .io_maskOut_1_3_0(dataModule_io_maskOut_1_3_0),
    .io_maskOut_1_3_1(dataModule_io_maskOut_1_3_1),
    .io_maskOut_1_3_2(dataModule_io_maskOut_1_3_2),
    .io_maskOut_1_3_3(dataModule_io_maskOut_1_3_3),
    .io_maskOut_1_3_4(dataModule_io_maskOut_1_3_4),
    .io_maskOut_1_3_5(dataModule_io_maskOut_1_3_5),
    .io_maskOut_1_3_6(dataModule_io_maskOut_1_3_6),
    .io_maskOut_1_3_7(dataModule_io_maskOut_1_3_7),
    .io_maskOut_1_3_8(dataModule_io_maskOut_1_3_8),
    .io_maskOut_1_3_9(dataModule_io_maskOut_1_3_9),
    .io_maskOut_1_3_10(dataModule_io_maskOut_1_3_10),
    .io_maskOut_1_3_11(dataModule_io_maskOut_1_3_11),
    .io_maskOut_1_3_12(dataModule_io_maskOut_1_3_12),
    .io_maskOut_1_3_13(dataModule_io_maskOut_1_3_13),
    .io_maskOut_1_3_14(dataModule_io_maskOut_1_3_14),
    .io_maskOut_1_3_15(dataModule_io_maskOut_1_3_15),
    .io_maskOut_2_0_0(dataModule_io_maskOut_2_0_0),
    .io_maskOut_2_0_1(dataModule_io_maskOut_2_0_1),
    .io_maskOut_2_0_2(dataModule_io_maskOut_2_0_2),
    .io_maskOut_2_0_3(dataModule_io_maskOut_2_0_3),
    .io_maskOut_2_0_4(dataModule_io_maskOut_2_0_4),
    .io_maskOut_2_0_5(dataModule_io_maskOut_2_0_5),
    .io_maskOut_2_0_6(dataModule_io_maskOut_2_0_6),
    .io_maskOut_2_0_7(dataModule_io_maskOut_2_0_7),
    .io_maskOut_2_0_8(dataModule_io_maskOut_2_0_8),
    .io_maskOut_2_0_9(dataModule_io_maskOut_2_0_9),
    .io_maskOut_2_0_10(dataModule_io_maskOut_2_0_10),
    .io_maskOut_2_0_11(dataModule_io_maskOut_2_0_11),
    .io_maskOut_2_0_12(dataModule_io_maskOut_2_0_12),
    .io_maskOut_2_0_13(dataModule_io_maskOut_2_0_13),
    .io_maskOut_2_0_14(dataModule_io_maskOut_2_0_14),
    .io_maskOut_2_0_15(dataModule_io_maskOut_2_0_15),
    .io_maskOut_2_1_0(dataModule_io_maskOut_2_1_0),
    .io_maskOut_2_1_1(dataModule_io_maskOut_2_1_1),
    .io_maskOut_2_1_2(dataModule_io_maskOut_2_1_2),
    .io_maskOut_2_1_3(dataModule_io_maskOut_2_1_3),
    .io_maskOut_2_1_4(dataModule_io_maskOut_2_1_4),
    .io_maskOut_2_1_5(dataModule_io_maskOut_2_1_5),
    .io_maskOut_2_1_6(dataModule_io_maskOut_2_1_6),
    .io_maskOut_2_1_7(dataModule_io_maskOut_2_1_7),
    .io_maskOut_2_1_8(dataModule_io_maskOut_2_1_8),
    .io_maskOut_2_1_9(dataModule_io_maskOut_2_1_9),
    .io_maskOut_2_1_10(dataModule_io_maskOut_2_1_10),
    .io_maskOut_2_1_11(dataModule_io_maskOut_2_1_11),
    .io_maskOut_2_1_12(dataModule_io_maskOut_2_1_12),
    .io_maskOut_2_1_13(dataModule_io_maskOut_2_1_13),
    .io_maskOut_2_1_14(dataModule_io_maskOut_2_1_14),
    .io_maskOut_2_1_15(dataModule_io_maskOut_2_1_15),
    .io_maskOut_2_2_0(dataModule_io_maskOut_2_2_0),
    .io_maskOut_2_2_1(dataModule_io_maskOut_2_2_1),
    .io_maskOut_2_2_2(dataModule_io_maskOut_2_2_2),
    .io_maskOut_2_2_3(dataModule_io_maskOut_2_2_3),
    .io_maskOut_2_2_4(dataModule_io_maskOut_2_2_4),
    .io_maskOut_2_2_5(dataModule_io_maskOut_2_2_5),
    .io_maskOut_2_2_6(dataModule_io_maskOut_2_2_6),
    .io_maskOut_2_2_7(dataModule_io_maskOut_2_2_7),
    .io_maskOut_2_2_8(dataModule_io_maskOut_2_2_8),
    .io_maskOut_2_2_9(dataModule_io_maskOut_2_2_9),
    .io_maskOut_2_2_10(dataModule_io_maskOut_2_2_10),
    .io_maskOut_2_2_11(dataModule_io_maskOut_2_2_11),
    .io_maskOut_2_2_12(dataModule_io_maskOut_2_2_12),
    .io_maskOut_2_2_13(dataModule_io_maskOut_2_2_13),
    .io_maskOut_2_2_14(dataModule_io_maskOut_2_2_14),
    .io_maskOut_2_2_15(dataModule_io_maskOut_2_2_15),
    .io_maskOut_2_3_0(dataModule_io_maskOut_2_3_0),
    .io_maskOut_2_3_1(dataModule_io_maskOut_2_3_1),
    .io_maskOut_2_3_2(dataModule_io_maskOut_2_3_2),
    .io_maskOut_2_3_3(dataModule_io_maskOut_2_3_3),
    .io_maskOut_2_3_4(dataModule_io_maskOut_2_3_4),
    .io_maskOut_2_3_5(dataModule_io_maskOut_2_3_5),
    .io_maskOut_2_3_6(dataModule_io_maskOut_2_3_6),
    .io_maskOut_2_3_7(dataModule_io_maskOut_2_3_7),
    .io_maskOut_2_3_8(dataModule_io_maskOut_2_3_8),
    .io_maskOut_2_3_9(dataModule_io_maskOut_2_3_9),
    .io_maskOut_2_3_10(dataModule_io_maskOut_2_3_10),
    .io_maskOut_2_3_11(dataModule_io_maskOut_2_3_11),
    .io_maskOut_2_3_12(dataModule_io_maskOut_2_3_12),
    .io_maskOut_2_3_13(dataModule_io_maskOut_2_3_13),
    .io_maskOut_2_3_14(dataModule_io_maskOut_2_3_14),
    .io_maskOut_2_3_15(dataModule_io_maskOut_2_3_15),
    .io_maskOut_3_0_0(dataModule_io_maskOut_3_0_0),
    .io_maskOut_3_0_1(dataModule_io_maskOut_3_0_1),
    .io_maskOut_3_0_2(dataModule_io_maskOut_3_0_2),
    .io_maskOut_3_0_3(dataModule_io_maskOut_3_0_3),
    .io_maskOut_3_0_4(dataModule_io_maskOut_3_0_4),
    .io_maskOut_3_0_5(dataModule_io_maskOut_3_0_5),
    .io_maskOut_3_0_6(dataModule_io_maskOut_3_0_6),
    .io_maskOut_3_0_7(dataModule_io_maskOut_3_0_7),
    .io_maskOut_3_0_8(dataModule_io_maskOut_3_0_8),
    .io_maskOut_3_0_9(dataModule_io_maskOut_3_0_9),
    .io_maskOut_3_0_10(dataModule_io_maskOut_3_0_10),
    .io_maskOut_3_0_11(dataModule_io_maskOut_3_0_11),
    .io_maskOut_3_0_12(dataModule_io_maskOut_3_0_12),
    .io_maskOut_3_0_13(dataModule_io_maskOut_3_0_13),
    .io_maskOut_3_0_14(dataModule_io_maskOut_3_0_14),
    .io_maskOut_3_0_15(dataModule_io_maskOut_3_0_15),
    .io_maskOut_3_1_0(dataModule_io_maskOut_3_1_0),
    .io_maskOut_3_1_1(dataModule_io_maskOut_3_1_1),
    .io_maskOut_3_1_2(dataModule_io_maskOut_3_1_2),
    .io_maskOut_3_1_3(dataModule_io_maskOut_3_1_3),
    .io_maskOut_3_1_4(dataModule_io_maskOut_3_1_4),
    .io_maskOut_3_1_5(dataModule_io_maskOut_3_1_5),
    .io_maskOut_3_1_6(dataModule_io_maskOut_3_1_6),
    .io_maskOut_3_1_7(dataModule_io_maskOut_3_1_7),
    .io_maskOut_3_1_8(dataModule_io_maskOut_3_1_8),
    .io_maskOut_3_1_9(dataModule_io_maskOut_3_1_9),
    .io_maskOut_3_1_10(dataModule_io_maskOut_3_1_10),
    .io_maskOut_3_1_11(dataModule_io_maskOut_3_1_11),
    .io_maskOut_3_1_12(dataModule_io_maskOut_3_1_12),
    .io_maskOut_3_1_13(dataModule_io_maskOut_3_1_13),
    .io_maskOut_3_1_14(dataModule_io_maskOut_3_1_14),
    .io_maskOut_3_1_15(dataModule_io_maskOut_3_1_15),
    .io_maskOut_3_2_0(dataModule_io_maskOut_3_2_0),
    .io_maskOut_3_2_1(dataModule_io_maskOut_3_2_1),
    .io_maskOut_3_2_2(dataModule_io_maskOut_3_2_2),
    .io_maskOut_3_2_3(dataModule_io_maskOut_3_2_3),
    .io_maskOut_3_2_4(dataModule_io_maskOut_3_2_4),
    .io_maskOut_3_2_5(dataModule_io_maskOut_3_2_5),
    .io_maskOut_3_2_6(dataModule_io_maskOut_3_2_6),
    .io_maskOut_3_2_7(dataModule_io_maskOut_3_2_7),
    .io_maskOut_3_2_8(dataModule_io_maskOut_3_2_8),
    .io_maskOut_3_2_9(dataModule_io_maskOut_3_2_9),
    .io_maskOut_3_2_10(dataModule_io_maskOut_3_2_10),
    .io_maskOut_3_2_11(dataModule_io_maskOut_3_2_11),
    .io_maskOut_3_2_12(dataModule_io_maskOut_3_2_12),
    .io_maskOut_3_2_13(dataModule_io_maskOut_3_2_13),
    .io_maskOut_3_2_14(dataModule_io_maskOut_3_2_14),
    .io_maskOut_3_2_15(dataModule_io_maskOut_3_2_15),
    .io_maskOut_3_3_0(dataModule_io_maskOut_3_3_0),
    .io_maskOut_3_3_1(dataModule_io_maskOut_3_3_1),
    .io_maskOut_3_3_2(dataModule_io_maskOut_3_3_2),
    .io_maskOut_3_3_3(dataModule_io_maskOut_3_3_3),
    .io_maskOut_3_3_4(dataModule_io_maskOut_3_3_4),
    .io_maskOut_3_3_5(dataModule_io_maskOut_3_3_5),
    .io_maskOut_3_3_6(dataModule_io_maskOut_3_3_6),
    .io_maskOut_3_3_7(dataModule_io_maskOut_3_3_7),
    .io_maskOut_3_3_8(dataModule_io_maskOut_3_3_8),
    .io_maskOut_3_3_9(dataModule_io_maskOut_3_3_9),
    .io_maskOut_3_3_10(dataModule_io_maskOut_3_3_10),
    .io_maskOut_3_3_11(dataModule_io_maskOut_3_3_11),
    .io_maskOut_3_3_12(dataModule_io_maskOut_3_3_12),
    .io_maskOut_3_3_13(dataModule_io_maskOut_3_3_13),
    .io_maskOut_3_3_14(dataModule_io_maskOut_3_3_14),
    .io_maskOut_3_3_15(dataModule_io_maskOut_3_3_15)
  );
  assign io_in_0_ready = sbuffer_state != 2'h3 & _firstCanInsert_T_1; // @[Sbuffer.scala 360:58]
  assign io_in_1_ready = secondCanInsert & ~sameWord & io_in_0_ready; // @[Sbuffer.scala 371:50]
  assign io_dcache_req_valid = sbuffer_out_s1_valid & _sbuffer_out_s1_ready_T; // @[Sbuffer.scala 625:47]
  assign io_dcache_req_bits_vaddr = {sbuffer_out_s1_evictionVTag,6'h0}; // @[Cat.scala 31:58]
  assign io_dcache_req_bits_addr = {sbuffer_out_s1_evictionPTag,6'h0}; // @[Cat.scala 31:58]
  assign io_dcache_req_bits_data = {io_dcache_req_bits_data_hi,io_dcache_req_bits_data_lo}; // @[Sbuffer.scala 630:64]
  assign io_dcache_req_bits_mask = {io_dcache_req_bits_mask_hi,io_dcache_req_bits_mask_lo}; // @[Sbuffer.scala 631:64]
  assign io_dcache_req_bits_id = {{2'd0}, sbuffer_out_s1_evictionIdx}; // @[Sbuffer.scala 632:25]
  assign io_forward_0_forwardMask_0 = selectedValidMask_0_0 | selectedInflightMask_0_0; // @[Sbuffer.scala 780:34 781:32]
  assign io_forward_0_forwardMask_1 = selectedValidMask_0_1 | selectedInflightMask_0_1; // @[Sbuffer.scala 780:34 781:32]
  assign io_forward_0_forwardMask_2 = selectedValidMask_0_2 | selectedInflightMask_0_2; // @[Sbuffer.scala 780:34 781:32]
  assign io_forward_0_forwardMask_3 = selectedValidMask_0_3 | selectedInflightMask_0_3; // @[Sbuffer.scala 780:34 781:32]
  assign io_forward_0_forwardMask_4 = selectedValidMask_0_4 | selectedInflightMask_0_4; // @[Sbuffer.scala 780:34 781:32]
  assign io_forward_0_forwardMask_5 = selectedValidMask_0_5 | selectedInflightMask_0_5; // @[Sbuffer.scala 780:34 781:32]
  assign io_forward_0_forwardMask_6 = selectedValidMask_0_6 | selectedInflightMask_0_6; // @[Sbuffer.scala 780:34 781:32]
  assign io_forward_0_forwardMask_7 = selectedValidMask_0_7 | selectedInflightMask_0_7; // @[Sbuffer.scala 780:34 781:32]
  assign io_forward_0_forwardMask_8 = selectedValidMask_0_8 | selectedInflightMask_0_8; // @[Sbuffer.scala 780:34 781:32]
  assign io_forward_0_forwardMask_9 = selectedValidMask_0_9 | selectedInflightMask_0_9; // @[Sbuffer.scala 780:34 781:32]
  assign io_forward_0_forwardMask_10 = selectedValidMask_0_10 | selectedInflightMask_0_10; // @[Sbuffer.scala 780:34 781:32]
  assign io_forward_0_forwardMask_11 = selectedValidMask_0_11 | selectedInflightMask_0_11; // @[Sbuffer.scala 780:34 781:32]
  assign io_forward_0_forwardMask_12 = selectedValidMask_0_12 | selectedInflightMask_0_12; // @[Sbuffer.scala 780:34 781:32]
  assign io_forward_0_forwardMask_13 = selectedValidMask_0_13 | selectedInflightMask_0_13; // @[Sbuffer.scala 780:34 781:32]
  assign io_forward_0_forwardMask_14 = selectedValidMask_0_14 | selectedInflightMask_0_14; // @[Sbuffer.scala 780:34 781:32]
  assign io_forward_0_forwardMask_15 = selectedValidMask_0_15 | selectedInflightMask_0_15; // @[Sbuffer.scala 780:34 781:32]
  assign io_forward_0_forwardData_0 = selectedValidMask_0_0 ? selectedValidData_0_0 : selectedInflightData_0_0; // @[Sbuffer.scala 780:34 782:32]
  assign io_forward_0_forwardData_1 = selectedValidMask_0_1 ? selectedValidData_0_1 : selectedInflightData_0_1; // @[Sbuffer.scala 780:34 782:32]
  assign io_forward_0_forwardData_2 = selectedValidMask_0_2 ? selectedValidData_0_2 : selectedInflightData_0_2; // @[Sbuffer.scala 780:34 782:32]
  assign io_forward_0_forwardData_3 = selectedValidMask_0_3 ? selectedValidData_0_3 : selectedInflightData_0_3; // @[Sbuffer.scala 780:34 782:32]
  assign io_forward_0_forwardData_4 = selectedValidMask_0_4 ? selectedValidData_0_4 : selectedInflightData_0_4; // @[Sbuffer.scala 780:34 782:32]
  assign io_forward_0_forwardData_5 = selectedValidMask_0_5 ? selectedValidData_0_5 : selectedInflightData_0_5; // @[Sbuffer.scala 780:34 782:32]
  assign io_forward_0_forwardData_6 = selectedValidMask_0_6 ? selectedValidData_0_6 : selectedInflightData_0_6; // @[Sbuffer.scala 780:34 782:32]
  assign io_forward_0_forwardData_7 = selectedValidMask_0_7 ? selectedValidData_0_7 : selectedInflightData_0_7; // @[Sbuffer.scala 780:34 782:32]
  assign io_forward_0_forwardData_8 = selectedValidMask_0_8 ? selectedValidData_0_8 : selectedInflightData_0_8; // @[Sbuffer.scala 780:34 782:32]
  assign io_forward_0_forwardData_9 = selectedValidMask_0_9 ? selectedValidData_0_9 : selectedInflightData_0_9; // @[Sbuffer.scala 780:34 782:32]
  assign io_forward_0_forwardData_10 = selectedValidMask_0_10 ? selectedValidData_0_10 : selectedInflightData_0_10; // @[Sbuffer.scala 780:34 782:32]
  assign io_forward_0_forwardData_11 = selectedValidMask_0_11 ? selectedValidData_0_11 : selectedInflightData_0_11; // @[Sbuffer.scala 780:34 782:32]
  assign io_forward_0_forwardData_12 = selectedValidMask_0_12 ? selectedValidData_0_12 : selectedInflightData_0_12; // @[Sbuffer.scala 780:34 782:32]
  assign io_forward_0_forwardData_13 = selectedValidMask_0_13 ? selectedValidData_0_13 : selectedInflightData_0_13; // @[Sbuffer.scala 780:34 782:32]
  assign io_forward_0_forwardData_14 = selectedValidMask_0_14 ? selectedValidData_0_14 : selectedInflightData_0_14; // @[Sbuffer.scala 780:34 782:32]
  assign io_forward_0_forwardData_15 = selectedValidMask_0_15 ? selectedValidData_0_15 : selectedInflightData_0_15; // @[Sbuffer.scala 780:34 782:32]
  assign io_forward_0_matchInvalid = tag_mismatch_REG & _tag_mismatch_T_13; // @[Sbuffer.scala 726:47]
  assign io_forward_1_forwardMask_0 = selectedValidMask_1_0 | selectedInflightMask_1_0; // @[Sbuffer.scala 780:34 781:32]
  assign io_forward_1_forwardMask_1 = selectedValidMask_1_1 | selectedInflightMask_1_1; // @[Sbuffer.scala 780:34 781:32]
  assign io_forward_1_forwardMask_2 = selectedValidMask_1_2 | selectedInflightMask_1_2; // @[Sbuffer.scala 780:34 781:32]
  assign io_forward_1_forwardMask_3 = selectedValidMask_1_3 | selectedInflightMask_1_3; // @[Sbuffer.scala 780:34 781:32]
  assign io_forward_1_forwardMask_4 = selectedValidMask_1_4 | selectedInflightMask_1_4; // @[Sbuffer.scala 780:34 781:32]
  assign io_forward_1_forwardMask_5 = selectedValidMask_1_5 | selectedInflightMask_1_5; // @[Sbuffer.scala 780:34 781:32]
  assign io_forward_1_forwardMask_6 = selectedValidMask_1_6 | selectedInflightMask_1_6; // @[Sbuffer.scala 780:34 781:32]
  assign io_forward_1_forwardMask_7 = selectedValidMask_1_7 | selectedInflightMask_1_7; // @[Sbuffer.scala 780:34 781:32]
  assign io_forward_1_forwardMask_8 = selectedValidMask_1_8 | selectedInflightMask_1_8; // @[Sbuffer.scala 780:34 781:32]
  assign io_forward_1_forwardMask_9 = selectedValidMask_1_9 | selectedInflightMask_1_9; // @[Sbuffer.scala 780:34 781:32]
  assign io_forward_1_forwardMask_10 = selectedValidMask_1_10 | selectedInflightMask_1_10; // @[Sbuffer.scala 780:34 781:32]
  assign io_forward_1_forwardMask_11 = selectedValidMask_1_11 | selectedInflightMask_1_11; // @[Sbuffer.scala 780:34 781:32]
  assign io_forward_1_forwardMask_12 = selectedValidMask_1_12 | selectedInflightMask_1_12; // @[Sbuffer.scala 780:34 781:32]
  assign io_forward_1_forwardMask_13 = selectedValidMask_1_13 | selectedInflightMask_1_13; // @[Sbuffer.scala 780:34 781:32]
  assign io_forward_1_forwardMask_14 = selectedValidMask_1_14 | selectedInflightMask_1_14; // @[Sbuffer.scala 780:34 781:32]
  assign io_forward_1_forwardMask_15 = selectedValidMask_1_15 | selectedInflightMask_1_15; // @[Sbuffer.scala 780:34 781:32]
  assign io_forward_1_forwardData_0 = selectedValidMask_1_0 ? selectedValidData_1_0 : selectedInflightData_1_0; // @[Sbuffer.scala 780:34 782:32]
  assign io_forward_1_forwardData_1 = selectedValidMask_1_1 ? selectedValidData_1_1 : selectedInflightData_1_1; // @[Sbuffer.scala 780:34 782:32]
  assign io_forward_1_forwardData_2 = selectedValidMask_1_2 ? selectedValidData_1_2 : selectedInflightData_1_2; // @[Sbuffer.scala 780:34 782:32]
  assign io_forward_1_forwardData_3 = selectedValidMask_1_3 ? selectedValidData_1_3 : selectedInflightData_1_3; // @[Sbuffer.scala 780:34 782:32]
  assign io_forward_1_forwardData_4 = selectedValidMask_1_4 ? selectedValidData_1_4 : selectedInflightData_1_4; // @[Sbuffer.scala 780:34 782:32]
  assign io_forward_1_forwardData_5 = selectedValidMask_1_5 ? selectedValidData_1_5 : selectedInflightData_1_5; // @[Sbuffer.scala 780:34 782:32]
  assign io_forward_1_forwardData_6 = selectedValidMask_1_6 ? selectedValidData_1_6 : selectedInflightData_1_6; // @[Sbuffer.scala 780:34 782:32]
  assign io_forward_1_forwardData_7 = selectedValidMask_1_7 ? selectedValidData_1_7 : selectedInflightData_1_7; // @[Sbuffer.scala 780:34 782:32]
  assign io_forward_1_forwardData_8 = selectedValidMask_1_8 ? selectedValidData_1_8 : selectedInflightData_1_8; // @[Sbuffer.scala 780:34 782:32]
  assign io_forward_1_forwardData_9 = selectedValidMask_1_9 ? selectedValidData_1_9 : selectedInflightData_1_9; // @[Sbuffer.scala 780:34 782:32]
  assign io_forward_1_forwardData_10 = selectedValidMask_1_10 ? selectedValidData_1_10 : selectedInflightData_1_10; // @[Sbuffer.scala 780:34 782:32]
  assign io_forward_1_forwardData_11 = selectedValidMask_1_11 ? selectedValidData_1_11 : selectedInflightData_1_11; // @[Sbuffer.scala 780:34 782:32]
  assign io_forward_1_forwardData_12 = selectedValidMask_1_12 ? selectedValidData_1_12 : selectedInflightData_1_12; // @[Sbuffer.scala 780:34 782:32]
  assign io_forward_1_forwardData_13 = selectedValidMask_1_13 ? selectedValidData_1_13 : selectedInflightData_1_13; // @[Sbuffer.scala 780:34 782:32]
  assign io_forward_1_forwardData_14 = selectedValidMask_1_14 ? selectedValidData_1_14 : selectedInflightData_1_14; // @[Sbuffer.scala 780:34 782:32]
  assign io_forward_1_forwardData_15 = selectedValidMask_1_15 ? selectedValidData_1_15 : selectedInflightData_1_15; // @[Sbuffer.scala 780:34 782:32]
  assign io_forward_1_matchInvalid = tag_mismatch_REG_9 & _tag_mismatch_T_27; // @[Sbuffer.scala 726:47]
  assign io_flush_empty = io_flush_empty_REG; // @[Sbuffer.scala 484:18]
  assign io_perf_0_value = {{4'd0}, io_perf_0_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_1_value = {{4'd0}, io_perf_1_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_2_value = {{4'd0}, io_perf_2_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_3_value = {{4'd0}, io_perf_3_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_4_value = {{5'd0}, io_perf_4_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_5_value = {{5'd0}, io_perf_5_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_6_value = {{5'd0}, io_perf_6_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_7_value = {{5'd0}, io_perf_7_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_8_value = {{5'd0}, io_perf_8_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_9_value = {{5'd0}, io_perf_9_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_10_value = {{5'd0}, io_perf_10_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_11_value = {{5'd0}, io_perf_11_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_12_value = {{5'd0}, io_perf_12_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_13_value = {{5'd0}, io_perf_13_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_14_value = {{5'd0}, io_perf_14_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_15_value = {{5'd0}, io_perf_15_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_16_value = {{5'd0}, io_perf_16_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign dataModule_clock = clock;
  assign dataModule_reset = reset;
  assign dataModule_io_writeReq_0_valid = io_in_0_ready & io_in_0_valid; // @[Decoupled.scala 50:35]
  assign dataModule_io_writeReq_0_bits_wvec = canMerge_0 ? mergeVec_0 : firstInsertVec; // @[Sbuffer.scala 438:24 439:31 443:31]
  assign dataModule_io_writeReq_0_bits_mask = io_in_0_bits_mask; // @[Sbuffer.scala 428:27]
  assign dataModule_io_writeReq_0_bits_data = io_in_0_bits_data; // @[Sbuffer.scala 429:27]
  assign dataModule_io_writeReq_0_bits_vwordOffset = io_in_0_bits_addr[35:4]; // @[Sbuffer.scala 236:7]
  assign dataModule_io_writeReq_0_bits_wline = io_in_0_bits_wline; // @[Sbuffer.scala 430:28]
  assign dataModule_io_writeReq_1_valid = io_in_1_ready & io_in_1_valid; // @[Decoupled.scala 50:35]
  assign dataModule_io_writeReq_1_bits_wvec = canMerge_1 ? mergeVec_1 : secondInsertVec; // @[Sbuffer.scala 438:24 439:31 443:31]
  assign dataModule_io_writeReq_1_bits_mask = io_in_1_bits_mask; // @[Sbuffer.scala 428:27]
  assign dataModule_io_writeReq_1_bits_data = io_in_1_bits_data; // @[Sbuffer.scala 429:27]
  assign dataModule_io_writeReq_1_bits_vwordOffset = io_in_1_bits_addr[35:4]; // @[Sbuffer.scala 236:7]
  assign dataModule_io_writeReq_1_bits_wline = io_in_1_bits_wline; // @[Sbuffer.scala 430:28]
  assign dataModule_io_maskFlushReq_0_valid = io_dcache_main_pipe_hit_resp_valid; // @[Sbuffer.scala 679:21]
  assign dataModule_io_maskFlushReq_0_bits_wvec = _dataModule_io_maskFlushReq_0_bits_wvec_T[3:0]; // @[Sbuffer.scala 680:25]
  assign dataModule_io_maskFlushReq_1_valid = io_dcache_refill_hit_resp_valid; // @[Sbuffer.scala 679:21]
  assign dataModule_io_maskFlushReq_1_bits_wvec = _dataModule_io_maskFlushReq_1_bits_wvec_T[3:0]; // @[Sbuffer.scala 680:25]
  always @(posedge clock) begin
    if (_T_58) begin // @[Sbuffer.scala 437:20]
      if (canMerge_1) begin // @[Sbuffer.scala 438:24]
        ptag_0 <= _GEN_78;
      end else if (secondInsertVec[0]) begin // @[Sbuffer.scala 384:32]
        ptag_0 <= inptags_1; // @[Sbuffer.scala 392:24]
      end else begin
        ptag_0 <= _GEN_78;
      end
    end else begin
      ptag_0 <= _GEN_78;
    end
    if (_T_58) begin // @[Sbuffer.scala 437:20]
      if (canMerge_1) begin // @[Sbuffer.scala 438:24]
        ptag_1 <= _GEN_83;
      end else if (secondInsertVec[1]) begin // @[Sbuffer.scala 384:32]
        ptag_1 <= inptags_1; // @[Sbuffer.scala 392:24]
      end else begin
        ptag_1 <= _GEN_83;
      end
    end else begin
      ptag_1 <= _GEN_83;
    end
    if (_T_58) begin // @[Sbuffer.scala 437:20]
      if (canMerge_1) begin // @[Sbuffer.scala 438:24]
        ptag_2 <= _GEN_88;
      end else if (secondInsertVec[2]) begin // @[Sbuffer.scala 384:32]
        ptag_2 <= inptags_1; // @[Sbuffer.scala 392:24]
      end else begin
        ptag_2 <= _GEN_88;
      end
    end else begin
      ptag_2 <= _GEN_88;
    end
    if (_T_58) begin // @[Sbuffer.scala 437:20]
      if (canMerge_1) begin // @[Sbuffer.scala 438:24]
        ptag_3 <= _GEN_93;
      end else if (secondInsertVec[3]) begin // @[Sbuffer.scala 384:32]
        ptag_3 <= inptags_1; // @[Sbuffer.scala 392:24]
      end else begin
        ptag_3 <= _GEN_93;
      end
    end else begin
      ptag_3 <= _GEN_93;
    end
    if (_T_58) begin // @[Sbuffer.scala 437:20]
      if (canMerge_1) begin // @[Sbuffer.scala 438:24]
        vtag_0 <= _GEN_79;
      end else if (secondInsertVec[0]) begin // @[Sbuffer.scala 384:32]
        vtag_0 <= invtags_1; // @[Sbuffer.scala 393:24]
      end else begin
        vtag_0 <= _GEN_79;
      end
    end else begin
      vtag_0 <= _GEN_79;
    end
    if (_T_58) begin // @[Sbuffer.scala 437:20]
      if (canMerge_1) begin // @[Sbuffer.scala 438:24]
        vtag_1 <= _GEN_84;
      end else if (secondInsertVec[1]) begin // @[Sbuffer.scala 384:32]
        vtag_1 <= invtags_1; // @[Sbuffer.scala 393:24]
      end else begin
        vtag_1 <= _GEN_84;
      end
    end else begin
      vtag_1 <= _GEN_84;
    end
    if (_T_58) begin // @[Sbuffer.scala 437:20]
      if (canMerge_1) begin // @[Sbuffer.scala 438:24]
        vtag_2 <= _GEN_89;
      end else if (secondInsertVec[2]) begin // @[Sbuffer.scala 384:32]
        vtag_2 <= invtags_1; // @[Sbuffer.scala 393:24]
      end else begin
        vtag_2 <= _GEN_89;
      end
    end else begin
      vtag_2 <= _GEN_89;
    end
    if (_T_58) begin // @[Sbuffer.scala 437:20]
      if (canMerge_1) begin // @[Sbuffer.scala 438:24]
        vtag_3 <= _GEN_94;
      end else if (secondInsertVec[3]) begin // @[Sbuffer.scala 384:32]
        vtag_3 <= invtags_1; // @[Sbuffer.scala 393:24]
      end else begin
        vtag_3 <= _GEN_94;
      end
    end else begin
      vtag_3 <= _GEN_94;
    end
    if (_T_58) begin // @[Sbuffer.scala 437:20]
      if (canMerge_1) begin // @[Sbuffer.scala 438:24]
        waitInflightMask_0 <= _GEN_77;
      end else if (secondInsertVec[0]) begin // @[Sbuffer.scala 384:32]
        if (_stateVec_0_wsameblock_inflight_T_1) begin // @[Sbuffer.scala 387:40]
          waitInflightMask_0 <= sameBlockInflightMask_1; // @[Sbuffer.scala 388:38]
        end else begin
          waitInflightMask_0 <= _GEN_77;
        end
      end else begin
        waitInflightMask_0 <= _GEN_77;
      end
    end else begin
      waitInflightMask_0 <= _GEN_77;
    end
    if (_T_58) begin // @[Sbuffer.scala 437:20]
      if (canMerge_1) begin // @[Sbuffer.scala 438:24]
        waitInflightMask_1 <= _GEN_82;
      end else if (secondInsertVec[1]) begin // @[Sbuffer.scala 384:32]
        if (_stateVec_0_wsameblock_inflight_T_1) begin // @[Sbuffer.scala 387:40]
          waitInflightMask_1 <= sameBlockInflightMask_1; // @[Sbuffer.scala 388:38]
        end else begin
          waitInflightMask_1 <= _GEN_82;
        end
      end else begin
        waitInflightMask_1 <= _GEN_82;
      end
    end else begin
      waitInflightMask_1 <= _GEN_82;
    end
    if (_T_58) begin // @[Sbuffer.scala 437:20]
      if (canMerge_1) begin // @[Sbuffer.scala 438:24]
        waitInflightMask_2 <= _GEN_87;
      end else if (secondInsertVec[2]) begin // @[Sbuffer.scala 384:32]
        if (_stateVec_0_wsameblock_inflight_T_1) begin // @[Sbuffer.scala 387:40]
          waitInflightMask_2 <= sameBlockInflightMask_1; // @[Sbuffer.scala 388:38]
        end else begin
          waitInflightMask_2 <= _GEN_87;
        end
      end else begin
        waitInflightMask_2 <= _GEN_87;
      end
    end else begin
      waitInflightMask_2 <= _GEN_87;
    end
    if (_T_58) begin // @[Sbuffer.scala 437:20]
      if (canMerge_1) begin // @[Sbuffer.scala 438:24]
        waitInflightMask_3 <= _GEN_92;
      end else if (secondInsertVec[3]) begin // @[Sbuffer.scala 384:32]
        if (_stateVec_0_wsameblock_inflight_T_1) begin // @[Sbuffer.scala 387:40]
          waitInflightMask_3 <= sameBlockInflightMask_1; // @[Sbuffer.scala 388:38]
        end else begin
          waitInflightMask_3 <= _GEN_92;
        end
      end else begin
        waitInflightMask_3 <= _GEN_92;
      end
    end else begin
      waitInflightMask_3 <= _GEN_92;
    end
    accessIdx_0_valid_REG <= io_in_0_ready & io_in_0_valid; // @[Decoupled.scala 50:35]
    accessIdx_1_valid_REG <= io_in_1_ready & io_in_1_valid; // @[Decoupled.scala 50:35]
    missqReplayHasTimeOut_REG <= missqReplayTimeOutMask_0 | f_tail_3; // @[PriorityMuxDefault.scala 47:46]
    missqReplayHasTimeOut_REG_1 <= sbuffer_out_s0_valid & sbuffer_out_s0_cango; // @[Sbuffer.scala 579:47]
    blockDcacheWrite <= |_shouldWaitWriteFinish_T_8; // @[Sbuffer.scala 589:13]
    if (canMerge_0) begin // @[Sbuffer.scala 436:37]
      if (mergeMask_0_0) begin // @[Mux.scala 47:70]
        accessIdx_0_bits_REG <= 2'h0;
      end else if (mergeMask_0_1) begin // @[Mux.scala 47:70]
        accessIdx_0_bits_REG <= 2'h1;
      end else if (mergeMask_0_2) begin // @[Mux.scala 47:70]
        accessIdx_0_bits_REG <= 2'h2;
      end else begin
        accessIdx_0_bits_REG <= 2'h3;
      end
    end else begin
      accessIdx_0_bits_REG <= insertIdx;
    end
    if (canMerge_1) begin // @[Sbuffer.scala 436:37]
      if (mergeMask_1_0) begin // @[Mux.scala 47:70]
        accessIdx_1_bits_REG <= 2'h0;
      end else if (mergeMask_1_1) begin // @[Mux.scala 47:70]
        accessIdx_1_bits_REG <= 2'h1;
      end else if (mergeMask_1_2) begin // @[Mux.scala 47:70]
        accessIdx_1_bits_REG <= 2'h2;
      end else begin
        accessIdx_1_bits_REG <= 2'h3;
      end
    end else begin
      accessIdx_1_bits_REG <= insertIdx_1;
    end
    if (missqReplayHasTimeOutGen) begin // @[Reg.scala 17:18]
      if (missqReplayTimeOutMask_0) begin // @[PriorityMuxDefault.scala 47:13]
        missqReplayTimeOutIdx <= 2'h0;
      end else if (missqReplayTimeOutMask_1) begin // @[PriorityMuxDefault.scala 47:13]
        missqReplayTimeOutIdx <= 2'h1;
      end else if (missqReplayTimeOutMask_2) begin // @[PriorityMuxDefault.scala 47:13]
        missqReplayTimeOutIdx <= 2'h2;
      end else begin
        missqReplayTimeOutIdx <= 2'h3;
      end
    end
    do_uarch_drain_REG <= tag_mismatch_1 | tag_mismatch; // @[Sbuffer.scala 730:25 737:32]
    if (_T_58) begin // @[Sbuffer.scala 437:20]
      if (canMerge_1) begin // @[Sbuffer.scala 438:24]
        if (mergeVec_1[3]) begin // @[Sbuffer.scala 408:32]
          do_uarch_drain_REG_1 <= _GEN_104;
        end else if (mergeVec_1[2]) begin // @[Sbuffer.scala 408:32]
          do_uarch_drain_REG_1 <= _GEN_101;
        end else begin
          do_uarch_drain_REG_1 <= _GEN_100;
        end
      end else begin
        do_uarch_drain_REG_1 <= _GEN_71;
      end
    end else begin
      do_uarch_drain_REG_1 <= _T_32 & _GEN_45;
    end
    do_uarch_drain_REG_2 <= do_uarch_drain_REG_1; // @[Sbuffer.scala 367:68]
    threshold <= io_csrCtrl_sbuffer_threshold + 4'h1; // @[Sbuffer.scala 477:56]
    io_flush_empty_REG <= empty & io_sqempty; // @[Sbuffer.scala 484:35]
    if (sbuffer_out_s0_fire) begin // @[Reg.scala 17:18]
      if (missqReplayHasTimeOut) begin // @[Sbuffer.scala 561:39]
        sbuffer_out_s1_evictionIdx <= missqReplayTimeOutIdx;
      end else if (need_drain) begin // @[Sbuffer.scala 563:8]
        if (_cohTimeOutMask_T_2) begin // @[Mux.scala 47:70]
          sbuffer_out_s1_evictionIdx <= 2'h0;
        end else begin
          sbuffer_out_s1_evictionIdx <= _drainIdx_T_1;
        end
      end else if (cohHasTimeOut) begin // @[Sbuffer.scala 565:10]
        sbuffer_out_s1_evictionIdx <= cohTimeOutIdx;
      end else begin
        sbuffer_out_s1_evictionIdx <= replaceIdx;
      end
    end
    if (sbuffer_out_s0_fire) begin // @[Reg.scala 17:18]
      if (2'h3 == sbuffer_out_s0_evictionIdx) begin // @[Sbuffer.scala 522:53]
        sbuffer_out_s1_evictionPTag <= ptag_3; // @[Sbuffer.scala 522:53]
      end else if (2'h2 == sbuffer_out_s0_evictionIdx) begin // @[Sbuffer.scala 522:53]
        sbuffer_out_s1_evictionPTag <= ptag_2; // @[Sbuffer.scala 522:53]
      end else if (2'h1 == sbuffer_out_s0_evictionIdx) begin // @[Sbuffer.scala 522:53]
        sbuffer_out_s1_evictionPTag <= ptag_1; // @[Sbuffer.scala 522:53]
      end else begin
        sbuffer_out_s1_evictionPTag <= ptag_0;
      end
    end
    if (sbuffer_out_s0_fire) begin // @[Reg.scala 17:18]
      if (2'h3 == sbuffer_out_s0_evictionIdx) begin // @[Reg.scala 17:22]
        sbuffer_out_s1_evictionVTag <= vtag_3; // @[Reg.scala 17:22]
      end else if (2'h2 == sbuffer_out_s0_evictionIdx) begin // @[Reg.scala 17:22]
        sbuffer_out_s1_evictionVTag <= vtag_2; // @[Reg.scala 17:22]
      end else if (2'h1 == sbuffer_out_s0_evictionIdx) begin // @[Reg.scala 17:22]
        sbuffer_out_s1_evictionVTag <= vtag_1; // @[Reg.scala 17:22]
      end else begin
        sbuffer_out_s1_evictionVTag <= vtag_0;
      end
    end
    REG <= io_dcache_main_pipe_hit_resp_valid; // @[Sbuffer.scala 670:16]
    REG_1 <= io_dcache_main_pipe_hit_resp_bits_id[1:0]; // @[Sbuffer.scala 647:7]
    REG_2 <= io_dcache_main_pipe_hit_resp_valid; // @[Sbuffer.scala 670:16]
    REG_3 <= io_dcache_main_pipe_hit_resp_bits_id[1:0]; // @[Sbuffer.scala 647:7]
    REG_4 <= io_dcache_main_pipe_hit_resp_valid; // @[Sbuffer.scala 670:16]
    REG_5 <= io_dcache_main_pipe_hit_resp_bits_id[1:0]; // @[Sbuffer.scala 647:7]
    REG_6 <= io_dcache_main_pipe_hit_resp_valid; // @[Sbuffer.scala 670:16]
    REG_7 <= io_dcache_main_pipe_hit_resp_bits_id[1:0]; // @[Sbuffer.scala 647:7]
    REG_8 <= io_dcache_refill_hit_resp_valid; // @[Sbuffer.scala 670:16]
    REG_9 <= io_dcache_refill_hit_resp_bits_id[1:0]; // @[Sbuffer.scala 647:7]
    REG_10 <= io_dcache_refill_hit_resp_valid; // @[Sbuffer.scala 670:16]
    REG_11 <= io_dcache_refill_hit_resp_bits_id[1:0]; // @[Sbuffer.scala 647:7]
    REG_12 <= io_dcache_refill_hit_resp_valid; // @[Sbuffer.scala 670:16]
    REG_13 <= io_dcache_refill_hit_resp_bits_id[1:0]; // @[Sbuffer.scala 647:7]
    REG_14 <= io_dcache_refill_hit_resp_valid; // @[Sbuffer.scala 670:16]
    REG_15 <= io_dcache_refill_hit_resp_bits_id[1:0]; // @[Sbuffer.scala 647:7]
    tag_mismatch_REG <= io_forward_0_valid; // @[Sbuffer.scala 726:31]
    tag_mismatch_REG_7 <= vtag_3 == io_forward_0_vaddr[38:6]; // @[Sbuffer.scala 722:54]
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      ptag_matches_r6 <= ptag_3; // @[Reg.scala 17:22]
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      ptag_matches_r7 <= io_forward_0_paddr[35:6]; // @[Reg.scala 17:22]
    end
    tag_mismatch_REG_8 <= _cohTimeOutMask_T_14 | stateVec_3_state_inflight; // @[Sbuffer.scala 727:78]
    tag_mismatch_REG_5 <= vtag_2 == io_forward_0_vaddr[38:6]; // @[Sbuffer.scala 722:54]
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      ptag_matches_r4 <= ptag_2; // @[Reg.scala 17:22]
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      ptag_matches_r5 <= io_forward_0_paddr[35:6]; // @[Reg.scala 17:22]
    end
    tag_mismatch_REG_6 <= _cohTimeOutMask_T_10 | stateVec_2_state_inflight; // @[Sbuffer.scala 727:78]
    tag_mismatch_REG_3 <= vtag_1 == io_forward_0_vaddr[38:6]; // @[Sbuffer.scala 722:54]
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      ptag_matches_r2 <= ptag_1; // @[Reg.scala 17:22]
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      ptag_matches_r3 <= io_forward_0_paddr[35:6]; // @[Reg.scala 17:22]
    end
    tag_mismatch_REG_4 <= _cohTimeOutMask_T_6 | stateVec_1_state_inflight; // @[Sbuffer.scala 727:78]
    tag_mismatch_REG_1 <= vtag_0 == io_forward_0_vaddr[38:6]; // @[Sbuffer.scala 722:54]
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      ptag_matches_r <= ptag_0; // @[Reg.scala 17:22]
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      ptag_matches_r1 <= io_forward_0_paddr[35:6]; // @[Reg.scala 17:22]
    end
    tag_mismatch_REG_2 <= _cohTimeOutMask_T_2 | stateVec_0_state_inflight; // @[Sbuffer.scala 727:78]
    tag_mismatch_REG_9 <= io_forward_1_valid; // @[Sbuffer.scala 726:31]
    tag_mismatch_REG_16 <= vtag_3 == io_forward_1_vaddr[38:6]; // @[Sbuffer.scala 722:54]
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      ptag_matches_r14 <= ptag_3; // @[Reg.scala 17:22]
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      ptag_matches_r15 <= io_forward_1_paddr[35:6]; // @[Reg.scala 17:22]
    end
    tag_mismatch_REG_17 <= _cohTimeOutMask_T_14 | stateVec_3_state_inflight; // @[Sbuffer.scala 727:78]
    tag_mismatch_REG_14 <= vtag_2 == io_forward_1_vaddr[38:6]; // @[Sbuffer.scala 722:54]
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      ptag_matches_r12 <= ptag_2; // @[Reg.scala 17:22]
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      ptag_matches_r13 <= io_forward_1_paddr[35:6]; // @[Reg.scala 17:22]
    end
    tag_mismatch_REG_15 <= _cohTimeOutMask_T_10 | stateVec_2_state_inflight; // @[Sbuffer.scala 727:78]
    tag_mismatch_REG_12 <= vtag_1 == io_forward_1_vaddr[38:6]; // @[Sbuffer.scala 722:54]
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      ptag_matches_r10 <= ptag_1; // @[Reg.scala 17:22]
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      ptag_matches_r11 <= io_forward_1_paddr[35:6]; // @[Reg.scala 17:22]
    end
    tag_mismatch_REG_13 <= _cohTimeOutMask_T_6 | stateVec_1_state_inflight; // @[Sbuffer.scala 727:78]
    tag_mismatch_REG_10 <= vtag_0 == io_forward_1_vaddr[38:6]; // @[Sbuffer.scala 722:54]
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      ptag_matches_r8 <= ptag_0; // @[Reg.scala 17:22]
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      ptag_matches_r9 <= io_forward_1_paddr[35:6]; // @[Reg.scala 17:22]
    end
    tag_mismatch_REG_11 <= _cohTimeOutMask_T_2 | stateVec_0_state_inflight; // @[Sbuffer.scala 727:78]
    valid_tag_match_reg_0 <= vtag_matches__0 & _cohTimeOutMask_T_2; // @[Sbuffer.scala 739:58]
    valid_tag_match_reg_1 <= vtag_matches__1 & _cohTimeOutMask_T_6; // @[Sbuffer.scala 739:58]
    valid_tag_match_reg_2 <= vtag_matches__2 & _cohTimeOutMask_T_10; // @[Sbuffer.scala 739:58]
    valid_tag_match_reg_3 <= vtag_matches__3 & _cohTimeOutMask_T_14; // @[Sbuffer.scala 739:58]
    inflight_tag_match_reg_0 <= vtag_matches__0 & stateVec_0_state_inflight; // @[Sbuffer.scala 740:61]
    inflight_tag_match_reg_1 <= vtag_matches__1 & stateVec_1_state_inflight; // @[Sbuffer.scala 740:61]
    inflight_tag_match_reg_2 <= vtag_matches__2 & stateVec_2_state_inflight; // @[Sbuffer.scala 740:61]
    inflight_tag_match_reg_3 <= vtag_matches__3 & stateVec_3_state_inflight; // @[Sbuffer.scala 740:61]
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__0_0 <= dataModule_io_maskOut_0_3_0; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__0_0 <= dataModule_io_maskOut_0_2_0; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__0_0 <= dataModule_io_maskOut_0_1_0; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__0_0 <= _GEN_509;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__0_1 <= dataModule_io_maskOut_0_3_1; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__0_1 <= dataModule_io_maskOut_0_2_1; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__0_1 <= dataModule_io_maskOut_0_1_1; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__0_1 <= _GEN_505;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__0_2 <= dataModule_io_maskOut_0_3_2; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__0_2 <= dataModule_io_maskOut_0_2_2; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__0_2 <= dataModule_io_maskOut_0_1_2; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__0_2 <= _GEN_517;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__0_3 <= dataModule_io_maskOut_0_3_3; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__0_3 <= dataModule_io_maskOut_0_2_3; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__0_3 <= dataModule_io_maskOut_0_1_3; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__0_3 <= _GEN_513;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__0_4 <= dataModule_io_maskOut_0_3_4; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__0_4 <= dataModule_io_maskOut_0_2_4; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__0_4 <= dataModule_io_maskOut_0_1_4; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__0_4 <= _GEN_525;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__0_5 <= dataModule_io_maskOut_0_3_5; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__0_5 <= dataModule_io_maskOut_0_2_5; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__0_5 <= dataModule_io_maskOut_0_1_5; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__0_5 <= _GEN_521;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__0_6 <= dataModule_io_maskOut_0_3_6; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__0_6 <= dataModule_io_maskOut_0_2_6; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__0_6 <= dataModule_io_maskOut_0_1_6; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__0_6 <= _GEN_533;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__0_7 <= dataModule_io_maskOut_0_3_7; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__0_7 <= dataModule_io_maskOut_0_2_7; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__0_7 <= dataModule_io_maskOut_0_1_7; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__0_7 <= _GEN_529;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__0_8 <= dataModule_io_maskOut_0_3_8; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__0_8 <= dataModule_io_maskOut_0_2_8; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__0_8 <= dataModule_io_maskOut_0_1_8; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__0_8 <= _GEN_541;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__0_9 <= dataModule_io_maskOut_0_3_9; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__0_9 <= dataModule_io_maskOut_0_2_9; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__0_9 <= dataModule_io_maskOut_0_1_9; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__0_9 <= _GEN_537;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__0_10 <= dataModule_io_maskOut_0_3_10; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__0_10 <= dataModule_io_maskOut_0_2_10; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__0_10 <= dataModule_io_maskOut_0_1_10; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__0_10 <= _GEN_549;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__0_11 <= dataModule_io_maskOut_0_3_11; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__0_11 <= dataModule_io_maskOut_0_2_11; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__0_11 <= dataModule_io_maskOut_0_1_11; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__0_11 <= _GEN_545;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__0_12 <= dataModule_io_maskOut_0_3_12; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__0_12 <= dataModule_io_maskOut_0_2_12; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__0_12 <= dataModule_io_maskOut_0_1_12; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__0_12 <= _GEN_557;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__0_13 <= dataModule_io_maskOut_0_3_13; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__0_13 <= dataModule_io_maskOut_0_2_13; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__0_13 <= dataModule_io_maskOut_0_1_13; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__0_13 <= _GEN_553;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__0_14 <= dataModule_io_maskOut_0_3_14; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__0_14 <= dataModule_io_maskOut_0_2_14; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__0_14 <= dataModule_io_maskOut_0_1_14; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__0_14 <= _GEN_565;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__0_15 <= dataModule_io_maskOut_0_3_15; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__0_15 <= dataModule_io_maskOut_0_2_15; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__0_15 <= dataModule_io_maskOut_0_1_15; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__0_15 <= _GEN_561;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__1_0 <= dataModule_io_maskOut_1_3_0; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__1_0 <= dataModule_io_maskOut_1_2_0; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__1_0 <= dataModule_io_maskOut_1_1_0; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__1_0 <= dataModule_io_maskOut_1_0_0;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__1_1 <= dataModule_io_maskOut_1_3_1; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__1_1 <= dataModule_io_maskOut_1_2_1; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__1_1 <= dataModule_io_maskOut_1_1_1; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__1_1 <= dataModule_io_maskOut_1_0_1;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__1_2 <= dataModule_io_maskOut_1_3_2; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__1_2 <= dataModule_io_maskOut_1_2_2; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__1_2 <= dataModule_io_maskOut_1_1_2; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__1_2 <= dataModule_io_maskOut_1_0_2;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__1_3 <= dataModule_io_maskOut_1_3_3; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__1_3 <= dataModule_io_maskOut_1_2_3; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__1_3 <= dataModule_io_maskOut_1_1_3; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__1_3 <= dataModule_io_maskOut_1_0_3;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__1_4 <= dataModule_io_maskOut_1_3_4; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__1_4 <= dataModule_io_maskOut_1_2_4; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__1_4 <= dataModule_io_maskOut_1_1_4; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__1_4 <= dataModule_io_maskOut_1_0_4;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__1_5 <= dataModule_io_maskOut_1_3_5; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__1_5 <= dataModule_io_maskOut_1_2_5; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__1_5 <= dataModule_io_maskOut_1_1_5; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__1_5 <= dataModule_io_maskOut_1_0_5;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__1_6 <= dataModule_io_maskOut_1_3_6; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__1_6 <= dataModule_io_maskOut_1_2_6; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__1_6 <= dataModule_io_maskOut_1_1_6; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__1_6 <= dataModule_io_maskOut_1_0_6;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__1_7 <= dataModule_io_maskOut_1_3_7; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__1_7 <= dataModule_io_maskOut_1_2_7; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__1_7 <= dataModule_io_maskOut_1_1_7; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__1_7 <= dataModule_io_maskOut_1_0_7;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__1_8 <= dataModule_io_maskOut_1_3_8; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__1_8 <= dataModule_io_maskOut_1_2_8; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__1_8 <= dataModule_io_maskOut_1_1_8; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__1_8 <= dataModule_io_maskOut_1_0_8;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__1_9 <= dataModule_io_maskOut_1_3_9; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__1_9 <= dataModule_io_maskOut_1_2_9; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__1_9 <= dataModule_io_maskOut_1_1_9; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__1_9 <= dataModule_io_maskOut_1_0_9;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__1_10 <= dataModule_io_maskOut_1_3_10; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__1_10 <= dataModule_io_maskOut_1_2_10; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__1_10 <= dataModule_io_maskOut_1_1_10; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__1_10 <= dataModule_io_maskOut_1_0_10;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__1_11 <= dataModule_io_maskOut_1_3_11; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__1_11 <= dataModule_io_maskOut_1_2_11; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__1_11 <= dataModule_io_maskOut_1_1_11; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__1_11 <= dataModule_io_maskOut_1_0_11;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__1_12 <= dataModule_io_maskOut_1_3_12; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__1_12 <= dataModule_io_maskOut_1_2_12; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__1_12 <= dataModule_io_maskOut_1_1_12; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__1_12 <= dataModule_io_maskOut_1_0_12;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__1_13 <= dataModule_io_maskOut_1_3_13; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__1_13 <= dataModule_io_maskOut_1_2_13; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__1_13 <= dataModule_io_maskOut_1_1_13; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__1_13 <= dataModule_io_maskOut_1_0_13;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__1_14 <= dataModule_io_maskOut_1_3_14; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__1_14 <= dataModule_io_maskOut_1_2_14; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__1_14 <= dataModule_io_maskOut_1_1_14; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__1_14 <= dataModule_io_maskOut_1_0_14;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__1_15 <= dataModule_io_maskOut_1_3_15; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__1_15 <= dataModule_io_maskOut_1_2_15; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__1_15 <= dataModule_io_maskOut_1_1_15; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__1_15 <= dataModule_io_maskOut_1_0_15;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__2_0 <= dataModule_io_maskOut_2_3_0; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__2_0 <= dataModule_io_maskOut_2_2_0; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__2_0 <= dataModule_io_maskOut_2_1_0; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__2_0 <= dataModule_io_maskOut_2_0_0;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__2_1 <= dataModule_io_maskOut_2_3_1; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__2_1 <= dataModule_io_maskOut_2_2_1; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__2_1 <= dataModule_io_maskOut_2_1_1; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__2_1 <= dataModule_io_maskOut_2_0_1;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__2_2 <= dataModule_io_maskOut_2_3_2; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__2_2 <= dataModule_io_maskOut_2_2_2; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__2_2 <= dataModule_io_maskOut_2_1_2; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__2_2 <= dataModule_io_maskOut_2_0_2;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__2_3 <= dataModule_io_maskOut_2_3_3; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__2_3 <= dataModule_io_maskOut_2_2_3; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__2_3 <= dataModule_io_maskOut_2_1_3; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__2_3 <= dataModule_io_maskOut_2_0_3;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__2_4 <= dataModule_io_maskOut_2_3_4; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__2_4 <= dataModule_io_maskOut_2_2_4; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__2_4 <= dataModule_io_maskOut_2_1_4; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__2_4 <= dataModule_io_maskOut_2_0_4;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__2_5 <= dataModule_io_maskOut_2_3_5; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__2_5 <= dataModule_io_maskOut_2_2_5; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__2_5 <= dataModule_io_maskOut_2_1_5; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__2_5 <= dataModule_io_maskOut_2_0_5;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__2_6 <= dataModule_io_maskOut_2_3_6; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__2_6 <= dataModule_io_maskOut_2_2_6; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__2_6 <= dataModule_io_maskOut_2_1_6; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__2_6 <= dataModule_io_maskOut_2_0_6;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__2_7 <= dataModule_io_maskOut_2_3_7; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__2_7 <= dataModule_io_maskOut_2_2_7; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__2_7 <= dataModule_io_maskOut_2_1_7; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__2_7 <= dataModule_io_maskOut_2_0_7;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__2_8 <= dataModule_io_maskOut_2_3_8; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__2_8 <= dataModule_io_maskOut_2_2_8; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__2_8 <= dataModule_io_maskOut_2_1_8; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__2_8 <= dataModule_io_maskOut_2_0_8;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__2_9 <= dataModule_io_maskOut_2_3_9; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__2_9 <= dataModule_io_maskOut_2_2_9; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__2_9 <= dataModule_io_maskOut_2_1_9; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__2_9 <= dataModule_io_maskOut_2_0_9;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__2_10 <= dataModule_io_maskOut_2_3_10; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__2_10 <= dataModule_io_maskOut_2_2_10; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__2_10 <= dataModule_io_maskOut_2_1_10; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__2_10 <= dataModule_io_maskOut_2_0_10;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__2_11 <= dataModule_io_maskOut_2_3_11; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__2_11 <= dataModule_io_maskOut_2_2_11; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__2_11 <= dataModule_io_maskOut_2_1_11; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__2_11 <= dataModule_io_maskOut_2_0_11;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__2_12 <= dataModule_io_maskOut_2_3_12; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__2_12 <= dataModule_io_maskOut_2_2_12; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__2_12 <= dataModule_io_maskOut_2_1_12; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__2_12 <= dataModule_io_maskOut_2_0_12;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__2_13 <= dataModule_io_maskOut_2_3_13; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__2_13 <= dataModule_io_maskOut_2_2_13; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__2_13 <= dataModule_io_maskOut_2_1_13; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__2_13 <= dataModule_io_maskOut_2_0_13;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__2_14 <= dataModule_io_maskOut_2_3_14; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__2_14 <= dataModule_io_maskOut_2_2_14; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__2_14 <= dataModule_io_maskOut_2_1_14; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__2_14 <= dataModule_io_maskOut_2_0_14;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__2_15 <= dataModule_io_maskOut_2_3_15; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__2_15 <= dataModule_io_maskOut_2_2_15; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__2_15 <= dataModule_io_maskOut_2_1_15; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__2_15 <= dataModule_io_maskOut_2_0_15;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__3_0 <= dataModule_io_maskOut_3_3_0; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__3_0 <= dataModule_io_maskOut_3_2_0; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__3_0 <= dataModule_io_maskOut_3_1_0; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__3_0 <= dataModule_io_maskOut_3_0_0;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__3_1 <= dataModule_io_maskOut_3_3_1; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__3_1 <= dataModule_io_maskOut_3_2_1; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__3_1 <= dataModule_io_maskOut_3_1_1; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__3_1 <= dataModule_io_maskOut_3_0_1;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__3_2 <= dataModule_io_maskOut_3_3_2; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__3_2 <= dataModule_io_maskOut_3_2_2; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__3_2 <= dataModule_io_maskOut_3_1_2; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__3_2 <= dataModule_io_maskOut_3_0_2;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__3_3 <= dataModule_io_maskOut_3_3_3; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__3_3 <= dataModule_io_maskOut_3_2_3; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__3_3 <= dataModule_io_maskOut_3_1_3; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__3_3 <= dataModule_io_maskOut_3_0_3;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__3_4 <= dataModule_io_maskOut_3_3_4; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__3_4 <= dataModule_io_maskOut_3_2_4; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__3_4 <= dataModule_io_maskOut_3_1_4; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__3_4 <= dataModule_io_maskOut_3_0_4;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__3_5 <= dataModule_io_maskOut_3_3_5; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__3_5 <= dataModule_io_maskOut_3_2_5; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__3_5 <= dataModule_io_maskOut_3_1_5; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__3_5 <= dataModule_io_maskOut_3_0_5;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__3_6 <= dataModule_io_maskOut_3_3_6; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__3_6 <= dataModule_io_maskOut_3_2_6; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__3_6 <= dataModule_io_maskOut_3_1_6; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__3_6 <= dataModule_io_maskOut_3_0_6;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__3_7 <= dataModule_io_maskOut_3_3_7; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__3_7 <= dataModule_io_maskOut_3_2_7; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__3_7 <= dataModule_io_maskOut_3_1_7; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__3_7 <= dataModule_io_maskOut_3_0_7;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__3_8 <= dataModule_io_maskOut_3_3_8; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__3_8 <= dataModule_io_maskOut_3_2_8; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__3_8 <= dataModule_io_maskOut_3_1_8; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__3_8 <= dataModule_io_maskOut_3_0_8;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__3_9 <= dataModule_io_maskOut_3_3_9; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__3_9 <= dataModule_io_maskOut_3_2_9; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__3_9 <= dataModule_io_maskOut_3_1_9; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__3_9 <= dataModule_io_maskOut_3_0_9;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__3_10 <= dataModule_io_maskOut_3_3_10; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__3_10 <= dataModule_io_maskOut_3_2_10; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__3_10 <= dataModule_io_maskOut_3_1_10; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__3_10 <= dataModule_io_maskOut_3_0_10;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__3_11 <= dataModule_io_maskOut_3_3_11; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__3_11 <= dataModule_io_maskOut_3_2_11; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__3_11 <= dataModule_io_maskOut_3_1_11; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__3_11 <= dataModule_io_maskOut_3_0_11;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__3_12 <= dataModule_io_maskOut_3_3_12; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__3_12 <= dataModule_io_maskOut_3_2_12; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__3_12 <= dataModule_io_maskOut_3_1_12; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__3_12 <= dataModule_io_maskOut_3_0_12;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__3_13 <= dataModule_io_maskOut_3_3_13; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__3_13 <= dataModule_io_maskOut_3_2_13; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__3_13 <= dataModule_io_maskOut_3_1_13; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__3_13 <= dataModule_io_maskOut_3_0_13;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__3_14 <= dataModule_io_maskOut_3_3_14; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__3_14 <= dataModule_io_maskOut_3_2_14; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__3_14 <= dataModule_io_maskOut_3_1_14; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__3_14 <= dataModule_io_maskOut_3_0_14;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__3_15 <= dataModule_io_maskOut_3_3_15; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__3_15 <= dataModule_io_maskOut_3_2_15; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg__3_15 <= dataModule_io_maskOut_3_1_15; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg__3_15 <= dataModule_io_maskOut_3_0_15;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__0_0 <= dataModule_io_dataOut_0_3_0; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__0_0 <= dataModule_io_dataOut_0_2_0; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__0_0 <= dataModule_io_dataOut_0_1_0; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__0_0 <= _GEN_253;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__0_1 <= dataModule_io_dataOut_0_3_1; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__0_1 <= dataModule_io_dataOut_0_2_1; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__0_1 <= dataModule_io_dataOut_0_1_1; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__0_1 <= _GEN_249;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__0_2 <= dataModule_io_dataOut_0_3_2; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__0_2 <= dataModule_io_dataOut_0_2_2; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__0_2 <= dataModule_io_dataOut_0_1_2; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__0_2 <= _GEN_261;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__0_3 <= dataModule_io_dataOut_0_3_3; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__0_3 <= dataModule_io_dataOut_0_2_3; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__0_3 <= dataModule_io_dataOut_0_1_3; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__0_3 <= _GEN_257;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__0_4 <= dataModule_io_dataOut_0_3_4; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__0_4 <= dataModule_io_dataOut_0_2_4; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__0_4 <= dataModule_io_dataOut_0_1_4; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__0_4 <= _GEN_269;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__0_5 <= dataModule_io_dataOut_0_3_5; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__0_5 <= dataModule_io_dataOut_0_2_5; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__0_5 <= dataModule_io_dataOut_0_1_5; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__0_5 <= _GEN_265;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__0_6 <= dataModule_io_dataOut_0_3_6; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__0_6 <= dataModule_io_dataOut_0_2_6; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__0_6 <= dataModule_io_dataOut_0_1_6; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__0_6 <= _GEN_277;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__0_7 <= dataModule_io_dataOut_0_3_7; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__0_7 <= dataModule_io_dataOut_0_2_7; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__0_7 <= dataModule_io_dataOut_0_1_7; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__0_7 <= _GEN_273;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__0_8 <= dataModule_io_dataOut_0_3_8; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__0_8 <= dataModule_io_dataOut_0_2_8; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__0_8 <= dataModule_io_dataOut_0_1_8; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__0_8 <= _GEN_285;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__0_9 <= dataModule_io_dataOut_0_3_9; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__0_9 <= dataModule_io_dataOut_0_2_9; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__0_9 <= dataModule_io_dataOut_0_1_9; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__0_9 <= _GEN_281;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__0_10 <= dataModule_io_dataOut_0_3_10; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__0_10 <= dataModule_io_dataOut_0_2_10; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__0_10 <= dataModule_io_dataOut_0_1_10; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__0_10 <= _GEN_293;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__0_11 <= dataModule_io_dataOut_0_3_11; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__0_11 <= dataModule_io_dataOut_0_2_11; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__0_11 <= dataModule_io_dataOut_0_1_11; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__0_11 <= _GEN_289;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__0_12 <= dataModule_io_dataOut_0_3_12; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__0_12 <= dataModule_io_dataOut_0_2_12; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__0_12 <= dataModule_io_dataOut_0_1_12; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__0_12 <= _GEN_301;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__0_13 <= dataModule_io_dataOut_0_3_13; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__0_13 <= dataModule_io_dataOut_0_2_13; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__0_13 <= dataModule_io_dataOut_0_1_13; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__0_13 <= _GEN_297;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__0_14 <= dataModule_io_dataOut_0_3_14; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__0_14 <= dataModule_io_dataOut_0_2_14; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__0_14 <= dataModule_io_dataOut_0_1_14; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__0_14 <= _GEN_309;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__0_15 <= dataModule_io_dataOut_0_3_15; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__0_15 <= dataModule_io_dataOut_0_2_15; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__0_15 <= dataModule_io_dataOut_0_1_15; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__0_15 <= _GEN_305;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__1_0 <= dataModule_io_dataOut_1_3_0; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__1_0 <= dataModule_io_dataOut_1_2_0; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__1_0 <= dataModule_io_dataOut_1_1_0; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__1_0 <= _GEN_1230;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__1_1 <= dataModule_io_dataOut_1_3_1; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__1_1 <= dataModule_io_dataOut_1_2_1; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__1_1 <= dataModule_io_dataOut_1_1_1; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__1_1 <= _GEN_1234;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__1_2 <= dataModule_io_dataOut_1_3_2; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__1_2 <= dataModule_io_dataOut_1_2_2; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__1_2 <= dataModule_io_dataOut_1_1_2; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__1_2 <= _GEN_1238;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__1_3 <= dataModule_io_dataOut_1_3_3; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__1_3 <= dataModule_io_dataOut_1_2_3; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__1_3 <= dataModule_io_dataOut_1_1_3; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__1_3 <= _GEN_1242;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__1_4 <= dataModule_io_dataOut_1_3_4; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__1_4 <= dataModule_io_dataOut_1_2_4; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__1_4 <= dataModule_io_dataOut_1_1_4; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__1_4 <= _GEN_1246;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__1_5 <= dataModule_io_dataOut_1_3_5; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__1_5 <= dataModule_io_dataOut_1_2_5; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__1_5 <= dataModule_io_dataOut_1_1_5; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__1_5 <= _GEN_1250;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__1_6 <= dataModule_io_dataOut_1_3_6; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__1_6 <= dataModule_io_dataOut_1_2_6; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__1_6 <= dataModule_io_dataOut_1_1_6; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__1_6 <= _GEN_1254;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__1_7 <= dataModule_io_dataOut_1_3_7; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__1_7 <= dataModule_io_dataOut_1_2_7; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__1_7 <= dataModule_io_dataOut_1_1_7; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__1_7 <= _GEN_1258;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__1_8 <= dataModule_io_dataOut_1_3_8; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__1_8 <= dataModule_io_dataOut_1_2_8; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__1_8 <= dataModule_io_dataOut_1_1_8; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__1_8 <= _GEN_1262;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__1_9 <= dataModule_io_dataOut_1_3_9; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__1_9 <= dataModule_io_dataOut_1_2_9; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__1_9 <= dataModule_io_dataOut_1_1_9; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__1_9 <= _GEN_1266;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__1_10 <= dataModule_io_dataOut_1_3_10; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__1_10 <= dataModule_io_dataOut_1_2_10; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__1_10 <= dataModule_io_dataOut_1_1_10; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__1_10 <= _GEN_1270;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__1_11 <= dataModule_io_dataOut_1_3_11; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__1_11 <= dataModule_io_dataOut_1_2_11; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__1_11 <= dataModule_io_dataOut_1_1_11; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__1_11 <= _GEN_1274;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__1_12 <= dataModule_io_dataOut_1_3_12; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__1_12 <= dataModule_io_dataOut_1_2_12; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__1_12 <= dataModule_io_dataOut_1_1_12; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__1_12 <= _GEN_1278;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__1_13 <= dataModule_io_dataOut_1_3_13; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__1_13 <= dataModule_io_dataOut_1_2_13; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__1_13 <= dataModule_io_dataOut_1_1_13; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__1_13 <= _GEN_1282;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__1_14 <= dataModule_io_dataOut_1_3_14; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__1_14 <= dataModule_io_dataOut_1_2_14; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__1_14 <= dataModule_io_dataOut_1_1_14; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__1_14 <= _GEN_1286;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__1_15 <= dataModule_io_dataOut_1_3_15; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__1_15 <= dataModule_io_dataOut_1_2_15; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__1_15 <= dataModule_io_dataOut_1_1_15; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__1_15 <= _GEN_1290;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__2_0 <= dataModule_io_dataOut_2_3_0; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__2_0 <= dataModule_io_dataOut_2_2_0; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__2_0 <= dataModule_io_dataOut_2_1_0; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__2_0 <= _GEN_1294;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__2_1 <= dataModule_io_dataOut_2_3_1; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__2_1 <= dataModule_io_dataOut_2_2_1; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__2_1 <= dataModule_io_dataOut_2_1_1; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__2_1 <= _GEN_1298;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__2_2 <= dataModule_io_dataOut_2_3_2; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__2_2 <= dataModule_io_dataOut_2_2_2; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__2_2 <= dataModule_io_dataOut_2_1_2; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__2_2 <= _GEN_1302;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__2_3 <= dataModule_io_dataOut_2_3_3; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__2_3 <= dataModule_io_dataOut_2_2_3; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__2_3 <= dataModule_io_dataOut_2_1_3; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__2_3 <= _GEN_1306;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__2_4 <= dataModule_io_dataOut_2_3_4; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__2_4 <= dataModule_io_dataOut_2_2_4; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__2_4 <= dataModule_io_dataOut_2_1_4; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__2_4 <= _GEN_1310;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__2_5 <= dataModule_io_dataOut_2_3_5; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__2_5 <= dataModule_io_dataOut_2_2_5; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__2_5 <= dataModule_io_dataOut_2_1_5; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__2_5 <= _GEN_1314;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__2_6 <= dataModule_io_dataOut_2_3_6; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__2_6 <= dataModule_io_dataOut_2_2_6; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__2_6 <= dataModule_io_dataOut_2_1_6; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__2_6 <= _GEN_1318;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__2_7 <= dataModule_io_dataOut_2_3_7; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__2_7 <= dataModule_io_dataOut_2_2_7; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__2_7 <= dataModule_io_dataOut_2_1_7; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__2_7 <= _GEN_1322;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__2_8 <= dataModule_io_dataOut_2_3_8; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__2_8 <= dataModule_io_dataOut_2_2_8; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__2_8 <= dataModule_io_dataOut_2_1_8; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__2_8 <= _GEN_1326;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__2_9 <= dataModule_io_dataOut_2_3_9; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__2_9 <= dataModule_io_dataOut_2_2_9; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__2_9 <= dataModule_io_dataOut_2_1_9; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__2_9 <= _GEN_1330;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__2_10 <= dataModule_io_dataOut_2_3_10; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__2_10 <= dataModule_io_dataOut_2_2_10; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__2_10 <= dataModule_io_dataOut_2_1_10; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__2_10 <= _GEN_1334;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__2_11 <= dataModule_io_dataOut_2_3_11; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__2_11 <= dataModule_io_dataOut_2_2_11; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__2_11 <= dataModule_io_dataOut_2_1_11; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__2_11 <= _GEN_1338;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__2_12 <= dataModule_io_dataOut_2_3_12; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__2_12 <= dataModule_io_dataOut_2_2_12; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__2_12 <= dataModule_io_dataOut_2_1_12; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__2_12 <= _GEN_1342;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__2_13 <= dataModule_io_dataOut_2_3_13; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__2_13 <= dataModule_io_dataOut_2_2_13; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__2_13 <= dataModule_io_dataOut_2_1_13; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__2_13 <= _GEN_1346;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__2_14 <= dataModule_io_dataOut_2_3_14; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__2_14 <= dataModule_io_dataOut_2_2_14; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__2_14 <= dataModule_io_dataOut_2_1_14; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__2_14 <= _GEN_1350;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__2_15 <= dataModule_io_dataOut_2_3_15; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__2_15 <= dataModule_io_dataOut_2_2_15; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__2_15 <= dataModule_io_dataOut_2_1_15; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__2_15 <= _GEN_1354;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__3_0 <= dataModule_io_dataOut_3_3_0; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__3_0 <= dataModule_io_dataOut_3_2_0; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__3_0 <= dataModule_io_dataOut_3_1_0; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__3_0 <= _GEN_1358;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__3_1 <= dataModule_io_dataOut_3_3_1; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__3_1 <= dataModule_io_dataOut_3_2_1; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__3_1 <= dataModule_io_dataOut_3_1_1; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__3_1 <= _GEN_1362;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__3_2 <= dataModule_io_dataOut_3_3_2; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__3_2 <= dataModule_io_dataOut_3_2_2; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__3_2 <= dataModule_io_dataOut_3_1_2; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__3_2 <= _GEN_1366;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__3_3 <= dataModule_io_dataOut_3_3_3; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__3_3 <= dataModule_io_dataOut_3_2_3; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__3_3 <= dataModule_io_dataOut_3_1_3; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__3_3 <= _GEN_1370;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__3_4 <= dataModule_io_dataOut_3_3_4; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__3_4 <= dataModule_io_dataOut_3_2_4; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__3_4 <= dataModule_io_dataOut_3_1_4; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__3_4 <= _GEN_1374;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__3_5 <= dataModule_io_dataOut_3_3_5; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__3_5 <= dataModule_io_dataOut_3_2_5; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__3_5 <= dataModule_io_dataOut_3_1_5; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__3_5 <= _GEN_1378;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__3_6 <= dataModule_io_dataOut_3_3_6; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__3_6 <= dataModule_io_dataOut_3_2_6; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__3_6 <= dataModule_io_dataOut_3_1_6; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__3_6 <= _GEN_1382;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__3_7 <= dataModule_io_dataOut_3_3_7; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__3_7 <= dataModule_io_dataOut_3_2_7; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__3_7 <= dataModule_io_dataOut_3_1_7; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__3_7 <= _GEN_1386;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__3_8 <= dataModule_io_dataOut_3_3_8; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__3_8 <= dataModule_io_dataOut_3_2_8; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__3_8 <= dataModule_io_dataOut_3_1_8; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__3_8 <= _GEN_1390;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__3_9 <= dataModule_io_dataOut_3_3_9; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__3_9 <= dataModule_io_dataOut_3_2_9; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__3_9 <= dataModule_io_dataOut_3_1_9; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__3_9 <= _GEN_1394;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__3_10 <= dataModule_io_dataOut_3_3_10; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__3_10 <= dataModule_io_dataOut_3_2_10; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__3_10 <= dataModule_io_dataOut_3_1_10; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__3_10 <= _GEN_1398;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__3_11 <= dataModule_io_dataOut_3_3_11; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__3_11 <= dataModule_io_dataOut_3_2_11; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__3_11 <= dataModule_io_dataOut_3_1_11; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__3_11 <= _GEN_1402;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__3_12 <= dataModule_io_dataOut_3_3_12; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__3_12 <= dataModule_io_dataOut_3_2_12; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__3_12 <= dataModule_io_dataOut_3_1_12; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__3_12 <= _GEN_1406;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__3_13 <= dataModule_io_dataOut_3_3_13; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__3_13 <= dataModule_io_dataOut_3_2_13; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__3_13 <= dataModule_io_dataOut_3_1_13; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__3_13 <= _GEN_1410;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__3_14 <= dataModule_io_dataOut_3_3_14; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__3_14 <= dataModule_io_dataOut_3_2_14; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__3_14 <= dataModule_io_dataOut_3_1_14; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__3_14 <= _GEN_1414;
      end
    end
    if (io_forward_0_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__3_15 <= dataModule_io_dataOut_3_3_15; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__3_15 <= dataModule_io_dataOut_3_2_15; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_0_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg__3_15 <= dataModule_io_dataOut_3_1_15; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg__3_15 <= _GEN_1418;
      end
    end
    valid_tag_match_reg_0_1 <= vtag_matches_1_0 & _cohTimeOutMask_T_2; // @[Sbuffer.scala 739:58]
    valid_tag_match_reg_1_1 <= vtag_matches_1_1 & _cohTimeOutMask_T_6; // @[Sbuffer.scala 739:58]
    valid_tag_match_reg_2_1 <= vtag_matches_1_2 & _cohTimeOutMask_T_10; // @[Sbuffer.scala 739:58]
    valid_tag_match_reg_3_1 <= vtag_matches_1_3 & _cohTimeOutMask_T_14; // @[Sbuffer.scala 739:58]
    inflight_tag_match_reg_0_1 <= vtag_matches_1_0 & stateVec_0_state_inflight; // @[Sbuffer.scala 740:61]
    inflight_tag_match_reg_1_1 <= vtag_matches_1_1 & stateVec_1_state_inflight; // @[Sbuffer.scala 740:61]
    inflight_tag_match_reg_2_1 <= vtag_matches_1_2 & stateVec_2_state_inflight; // @[Sbuffer.scala 740:61]
    inflight_tag_match_reg_3_1 <= vtag_matches_1_3 & stateVec_3_state_inflight; // @[Sbuffer.scala 740:61]
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_0_0 <= dataModule_io_maskOut_0_3_0; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_0_0 <= dataModule_io_maskOut_0_2_0; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_0_0 <= dataModule_io_maskOut_0_1_0; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_0_0 <= _GEN_509;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_0_1 <= dataModule_io_maskOut_0_3_1; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_0_1 <= dataModule_io_maskOut_0_2_1; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_0_1 <= dataModule_io_maskOut_0_1_1; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_0_1 <= _GEN_505;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_0_2 <= dataModule_io_maskOut_0_3_2; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_0_2 <= dataModule_io_maskOut_0_2_2; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_0_2 <= dataModule_io_maskOut_0_1_2; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_0_2 <= _GEN_517;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_0_3 <= dataModule_io_maskOut_0_3_3; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_0_3 <= dataModule_io_maskOut_0_2_3; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_0_3 <= dataModule_io_maskOut_0_1_3; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_0_3 <= _GEN_513;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_0_4 <= dataModule_io_maskOut_0_3_4; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_0_4 <= dataModule_io_maskOut_0_2_4; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_0_4 <= dataModule_io_maskOut_0_1_4; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_0_4 <= _GEN_525;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_0_5 <= dataModule_io_maskOut_0_3_5; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_0_5 <= dataModule_io_maskOut_0_2_5; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_0_5 <= dataModule_io_maskOut_0_1_5; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_0_5 <= _GEN_521;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_0_6 <= dataModule_io_maskOut_0_3_6; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_0_6 <= dataModule_io_maskOut_0_2_6; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_0_6 <= dataModule_io_maskOut_0_1_6; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_0_6 <= _GEN_533;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_0_7 <= dataModule_io_maskOut_0_3_7; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_0_7 <= dataModule_io_maskOut_0_2_7; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_0_7 <= dataModule_io_maskOut_0_1_7; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_0_7 <= _GEN_529;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_0_8 <= dataModule_io_maskOut_0_3_8; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_0_8 <= dataModule_io_maskOut_0_2_8; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_0_8 <= dataModule_io_maskOut_0_1_8; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_0_8 <= _GEN_541;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_0_9 <= dataModule_io_maskOut_0_3_9; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_0_9 <= dataModule_io_maskOut_0_2_9; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_0_9 <= dataModule_io_maskOut_0_1_9; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_0_9 <= _GEN_537;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_0_10 <= dataModule_io_maskOut_0_3_10; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_0_10 <= dataModule_io_maskOut_0_2_10; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_0_10 <= dataModule_io_maskOut_0_1_10; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_0_10 <= _GEN_549;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_0_11 <= dataModule_io_maskOut_0_3_11; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_0_11 <= dataModule_io_maskOut_0_2_11; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_0_11 <= dataModule_io_maskOut_0_1_11; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_0_11 <= _GEN_545;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_0_12 <= dataModule_io_maskOut_0_3_12; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_0_12 <= dataModule_io_maskOut_0_2_12; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_0_12 <= dataModule_io_maskOut_0_1_12; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_0_12 <= _GEN_557;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_0_13 <= dataModule_io_maskOut_0_3_13; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_0_13 <= dataModule_io_maskOut_0_2_13; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_0_13 <= dataModule_io_maskOut_0_1_13; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_0_13 <= _GEN_553;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_0_14 <= dataModule_io_maskOut_0_3_14; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_0_14 <= dataModule_io_maskOut_0_2_14; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_0_14 <= dataModule_io_maskOut_0_1_14; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_0_14 <= _GEN_565;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_0_15 <= dataModule_io_maskOut_0_3_15; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_0_15 <= dataModule_io_maskOut_0_2_15; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_0_15 <= dataModule_io_maskOut_0_1_15; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_0_15 <= _GEN_561;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_1_0 <= dataModule_io_maskOut_1_3_0; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_1_0 <= dataModule_io_maskOut_1_2_0; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_1_0 <= dataModule_io_maskOut_1_1_0; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_1_0 <= dataModule_io_maskOut_1_0_0;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_1_1 <= dataModule_io_maskOut_1_3_1; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_1_1 <= dataModule_io_maskOut_1_2_1; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_1_1 <= dataModule_io_maskOut_1_1_1; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_1_1 <= dataModule_io_maskOut_1_0_1;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_1_2 <= dataModule_io_maskOut_1_3_2; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_1_2 <= dataModule_io_maskOut_1_2_2; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_1_2 <= dataModule_io_maskOut_1_1_2; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_1_2 <= dataModule_io_maskOut_1_0_2;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_1_3 <= dataModule_io_maskOut_1_3_3; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_1_3 <= dataModule_io_maskOut_1_2_3; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_1_3 <= dataModule_io_maskOut_1_1_3; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_1_3 <= dataModule_io_maskOut_1_0_3;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_1_4 <= dataModule_io_maskOut_1_3_4; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_1_4 <= dataModule_io_maskOut_1_2_4; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_1_4 <= dataModule_io_maskOut_1_1_4; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_1_4 <= dataModule_io_maskOut_1_0_4;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_1_5 <= dataModule_io_maskOut_1_3_5; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_1_5 <= dataModule_io_maskOut_1_2_5; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_1_5 <= dataModule_io_maskOut_1_1_5; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_1_5 <= dataModule_io_maskOut_1_0_5;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_1_6 <= dataModule_io_maskOut_1_3_6; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_1_6 <= dataModule_io_maskOut_1_2_6; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_1_6 <= dataModule_io_maskOut_1_1_6; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_1_6 <= dataModule_io_maskOut_1_0_6;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_1_7 <= dataModule_io_maskOut_1_3_7; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_1_7 <= dataModule_io_maskOut_1_2_7; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_1_7 <= dataModule_io_maskOut_1_1_7; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_1_7 <= dataModule_io_maskOut_1_0_7;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_1_8 <= dataModule_io_maskOut_1_3_8; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_1_8 <= dataModule_io_maskOut_1_2_8; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_1_8 <= dataModule_io_maskOut_1_1_8; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_1_8 <= dataModule_io_maskOut_1_0_8;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_1_9 <= dataModule_io_maskOut_1_3_9; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_1_9 <= dataModule_io_maskOut_1_2_9; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_1_9 <= dataModule_io_maskOut_1_1_9; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_1_9 <= dataModule_io_maskOut_1_0_9;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_1_10 <= dataModule_io_maskOut_1_3_10; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_1_10 <= dataModule_io_maskOut_1_2_10; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_1_10 <= dataModule_io_maskOut_1_1_10; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_1_10 <= dataModule_io_maskOut_1_0_10;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_1_11 <= dataModule_io_maskOut_1_3_11; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_1_11 <= dataModule_io_maskOut_1_2_11; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_1_11 <= dataModule_io_maskOut_1_1_11; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_1_11 <= dataModule_io_maskOut_1_0_11;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_1_12 <= dataModule_io_maskOut_1_3_12; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_1_12 <= dataModule_io_maskOut_1_2_12; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_1_12 <= dataModule_io_maskOut_1_1_12; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_1_12 <= dataModule_io_maskOut_1_0_12;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_1_13 <= dataModule_io_maskOut_1_3_13; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_1_13 <= dataModule_io_maskOut_1_2_13; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_1_13 <= dataModule_io_maskOut_1_1_13; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_1_13 <= dataModule_io_maskOut_1_0_13;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_1_14 <= dataModule_io_maskOut_1_3_14; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_1_14 <= dataModule_io_maskOut_1_2_14; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_1_14 <= dataModule_io_maskOut_1_1_14; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_1_14 <= dataModule_io_maskOut_1_0_14;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_1_15 <= dataModule_io_maskOut_1_3_15; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_1_15 <= dataModule_io_maskOut_1_2_15; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_1_15 <= dataModule_io_maskOut_1_1_15; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_1_15 <= dataModule_io_maskOut_1_0_15;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_2_0 <= dataModule_io_maskOut_2_3_0; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_2_0 <= dataModule_io_maskOut_2_2_0; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_2_0 <= dataModule_io_maskOut_2_1_0; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_2_0 <= dataModule_io_maskOut_2_0_0;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_2_1 <= dataModule_io_maskOut_2_3_1; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_2_1 <= dataModule_io_maskOut_2_2_1; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_2_1 <= dataModule_io_maskOut_2_1_1; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_2_1 <= dataModule_io_maskOut_2_0_1;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_2_2 <= dataModule_io_maskOut_2_3_2; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_2_2 <= dataModule_io_maskOut_2_2_2; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_2_2 <= dataModule_io_maskOut_2_1_2; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_2_2 <= dataModule_io_maskOut_2_0_2;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_2_3 <= dataModule_io_maskOut_2_3_3; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_2_3 <= dataModule_io_maskOut_2_2_3; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_2_3 <= dataModule_io_maskOut_2_1_3; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_2_3 <= dataModule_io_maskOut_2_0_3;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_2_4 <= dataModule_io_maskOut_2_3_4; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_2_4 <= dataModule_io_maskOut_2_2_4; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_2_4 <= dataModule_io_maskOut_2_1_4; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_2_4 <= dataModule_io_maskOut_2_0_4;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_2_5 <= dataModule_io_maskOut_2_3_5; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_2_5 <= dataModule_io_maskOut_2_2_5; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_2_5 <= dataModule_io_maskOut_2_1_5; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_2_5 <= dataModule_io_maskOut_2_0_5;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_2_6 <= dataModule_io_maskOut_2_3_6; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_2_6 <= dataModule_io_maskOut_2_2_6; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_2_6 <= dataModule_io_maskOut_2_1_6; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_2_6 <= dataModule_io_maskOut_2_0_6;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_2_7 <= dataModule_io_maskOut_2_3_7; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_2_7 <= dataModule_io_maskOut_2_2_7; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_2_7 <= dataModule_io_maskOut_2_1_7; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_2_7 <= dataModule_io_maskOut_2_0_7;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_2_8 <= dataModule_io_maskOut_2_3_8; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_2_8 <= dataModule_io_maskOut_2_2_8; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_2_8 <= dataModule_io_maskOut_2_1_8; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_2_8 <= dataModule_io_maskOut_2_0_8;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_2_9 <= dataModule_io_maskOut_2_3_9; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_2_9 <= dataModule_io_maskOut_2_2_9; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_2_9 <= dataModule_io_maskOut_2_1_9; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_2_9 <= dataModule_io_maskOut_2_0_9;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_2_10 <= dataModule_io_maskOut_2_3_10; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_2_10 <= dataModule_io_maskOut_2_2_10; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_2_10 <= dataModule_io_maskOut_2_1_10; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_2_10 <= dataModule_io_maskOut_2_0_10;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_2_11 <= dataModule_io_maskOut_2_3_11; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_2_11 <= dataModule_io_maskOut_2_2_11; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_2_11 <= dataModule_io_maskOut_2_1_11; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_2_11 <= dataModule_io_maskOut_2_0_11;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_2_12 <= dataModule_io_maskOut_2_3_12; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_2_12 <= dataModule_io_maskOut_2_2_12; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_2_12 <= dataModule_io_maskOut_2_1_12; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_2_12 <= dataModule_io_maskOut_2_0_12;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_2_13 <= dataModule_io_maskOut_2_3_13; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_2_13 <= dataModule_io_maskOut_2_2_13; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_2_13 <= dataModule_io_maskOut_2_1_13; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_2_13 <= dataModule_io_maskOut_2_0_13;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_2_14 <= dataModule_io_maskOut_2_3_14; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_2_14 <= dataModule_io_maskOut_2_2_14; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_2_14 <= dataModule_io_maskOut_2_1_14; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_2_14 <= dataModule_io_maskOut_2_0_14;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_2_15 <= dataModule_io_maskOut_2_3_15; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_2_15 <= dataModule_io_maskOut_2_2_15; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_2_15 <= dataModule_io_maskOut_2_1_15; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_2_15 <= dataModule_io_maskOut_2_0_15;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_3_0 <= dataModule_io_maskOut_3_3_0; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_3_0 <= dataModule_io_maskOut_3_2_0; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_3_0 <= dataModule_io_maskOut_3_1_0; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_3_0 <= dataModule_io_maskOut_3_0_0;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_3_1 <= dataModule_io_maskOut_3_3_1; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_3_1 <= dataModule_io_maskOut_3_2_1; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_3_1 <= dataModule_io_maskOut_3_1_1; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_3_1 <= dataModule_io_maskOut_3_0_1;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_3_2 <= dataModule_io_maskOut_3_3_2; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_3_2 <= dataModule_io_maskOut_3_2_2; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_3_2 <= dataModule_io_maskOut_3_1_2; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_3_2 <= dataModule_io_maskOut_3_0_2;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_3_3 <= dataModule_io_maskOut_3_3_3; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_3_3 <= dataModule_io_maskOut_3_2_3; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_3_3 <= dataModule_io_maskOut_3_1_3; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_3_3 <= dataModule_io_maskOut_3_0_3;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_3_4 <= dataModule_io_maskOut_3_3_4; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_3_4 <= dataModule_io_maskOut_3_2_4; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_3_4 <= dataModule_io_maskOut_3_1_4; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_3_4 <= dataModule_io_maskOut_3_0_4;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_3_5 <= dataModule_io_maskOut_3_3_5; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_3_5 <= dataModule_io_maskOut_3_2_5; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_3_5 <= dataModule_io_maskOut_3_1_5; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_3_5 <= dataModule_io_maskOut_3_0_5;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_3_6 <= dataModule_io_maskOut_3_3_6; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_3_6 <= dataModule_io_maskOut_3_2_6; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_3_6 <= dataModule_io_maskOut_3_1_6; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_3_6 <= dataModule_io_maskOut_3_0_6;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_3_7 <= dataModule_io_maskOut_3_3_7; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_3_7 <= dataModule_io_maskOut_3_2_7; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_3_7 <= dataModule_io_maskOut_3_1_7; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_3_7 <= dataModule_io_maskOut_3_0_7;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_3_8 <= dataModule_io_maskOut_3_3_8; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_3_8 <= dataModule_io_maskOut_3_2_8; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_3_8 <= dataModule_io_maskOut_3_1_8; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_3_8 <= dataModule_io_maskOut_3_0_8;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_3_9 <= dataModule_io_maskOut_3_3_9; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_3_9 <= dataModule_io_maskOut_3_2_9; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_3_9 <= dataModule_io_maskOut_3_1_9; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_3_9 <= dataModule_io_maskOut_3_0_9;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_3_10 <= dataModule_io_maskOut_3_3_10; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_3_10 <= dataModule_io_maskOut_3_2_10; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_3_10 <= dataModule_io_maskOut_3_1_10; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_3_10 <= dataModule_io_maskOut_3_0_10;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_3_11 <= dataModule_io_maskOut_3_3_11; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_3_11 <= dataModule_io_maskOut_3_2_11; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_3_11 <= dataModule_io_maskOut_3_1_11; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_3_11 <= dataModule_io_maskOut_3_0_11;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_3_12 <= dataModule_io_maskOut_3_3_12; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_3_12 <= dataModule_io_maskOut_3_2_12; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_3_12 <= dataModule_io_maskOut_3_1_12; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_3_12 <= dataModule_io_maskOut_3_0_12;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_3_13 <= dataModule_io_maskOut_3_3_13; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_3_13 <= dataModule_io_maskOut_3_2_13; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_3_13 <= dataModule_io_maskOut_3_1_13; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_3_13 <= dataModule_io_maskOut_3_0_13;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_3_14 <= dataModule_io_maskOut_3_3_14; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_3_14 <= dataModule_io_maskOut_3_2_14; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_3_14 <= dataModule_io_maskOut_3_1_14; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_3_14 <= dataModule_io_maskOut_3_0_14;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_3_15 <= dataModule_io_maskOut_3_3_15; // @[Sbuffer.scala 747:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_3_15 <= dataModule_io_maskOut_3_2_15; // @[Sbuffer.scala 747:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 747:14]
        forward_mask_candidate_reg_1_3_15 <= dataModule_io_maskOut_3_1_15; // @[Sbuffer.scala 747:14]
      end else begin
        forward_mask_candidate_reg_1_3_15 <= dataModule_io_maskOut_3_0_15;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_0_0 <= dataModule_io_dataOut_0_3_0; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_0_0 <= dataModule_io_dataOut_0_2_0; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_0_0 <= dataModule_io_dataOut_0_1_0; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_0_0 <= _GEN_253;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_0_1 <= dataModule_io_dataOut_0_3_1; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_0_1 <= dataModule_io_dataOut_0_2_1; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_0_1 <= dataModule_io_dataOut_0_1_1; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_0_1 <= _GEN_249;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_0_2 <= dataModule_io_dataOut_0_3_2; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_0_2 <= dataModule_io_dataOut_0_2_2; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_0_2 <= dataModule_io_dataOut_0_1_2; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_0_2 <= _GEN_261;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_0_3 <= dataModule_io_dataOut_0_3_3; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_0_3 <= dataModule_io_dataOut_0_2_3; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_0_3 <= dataModule_io_dataOut_0_1_3; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_0_3 <= _GEN_257;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_0_4 <= dataModule_io_dataOut_0_3_4; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_0_4 <= dataModule_io_dataOut_0_2_4; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_0_4 <= dataModule_io_dataOut_0_1_4; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_0_4 <= _GEN_269;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_0_5 <= dataModule_io_dataOut_0_3_5; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_0_5 <= dataModule_io_dataOut_0_2_5; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_0_5 <= dataModule_io_dataOut_0_1_5; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_0_5 <= _GEN_265;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_0_6 <= dataModule_io_dataOut_0_3_6; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_0_6 <= dataModule_io_dataOut_0_2_6; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_0_6 <= dataModule_io_dataOut_0_1_6; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_0_6 <= _GEN_277;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_0_7 <= dataModule_io_dataOut_0_3_7; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_0_7 <= dataModule_io_dataOut_0_2_7; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_0_7 <= dataModule_io_dataOut_0_1_7; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_0_7 <= _GEN_273;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_0_8 <= dataModule_io_dataOut_0_3_8; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_0_8 <= dataModule_io_dataOut_0_2_8; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_0_8 <= dataModule_io_dataOut_0_1_8; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_0_8 <= _GEN_285;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_0_9 <= dataModule_io_dataOut_0_3_9; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_0_9 <= dataModule_io_dataOut_0_2_9; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_0_9 <= dataModule_io_dataOut_0_1_9; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_0_9 <= _GEN_281;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_0_10 <= dataModule_io_dataOut_0_3_10; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_0_10 <= dataModule_io_dataOut_0_2_10; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_0_10 <= dataModule_io_dataOut_0_1_10; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_0_10 <= _GEN_293;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_0_11 <= dataModule_io_dataOut_0_3_11; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_0_11 <= dataModule_io_dataOut_0_2_11; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_0_11 <= dataModule_io_dataOut_0_1_11; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_0_11 <= _GEN_289;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_0_12 <= dataModule_io_dataOut_0_3_12; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_0_12 <= dataModule_io_dataOut_0_2_12; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_0_12 <= dataModule_io_dataOut_0_1_12; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_0_12 <= _GEN_301;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_0_13 <= dataModule_io_dataOut_0_3_13; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_0_13 <= dataModule_io_dataOut_0_2_13; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_0_13 <= dataModule_io_dataOut_0_1_13; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_0_13 <= _GEN_297;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_0_14 <= dataModule_io_dataOut_0_3_14; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_0_14 <= dataModule_io_dataOut_0_2_14; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_0_14 <= dataModule_io_dataOut_0_1_14; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_0_14 <= _GEN_309;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_0_15 <= dataModule_io_dataOut_0_3_15; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_0_15 <= dataModule_io_dataOut_0_2_15; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_0_15 <= dataModule_io_dataOut_0_1_15; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_0_15 <= _GEN_305;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_1_0 <= dataModule_io_dataOut_1_3_0; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_1_0 <= dataModule_io_dataOut_1_2_0; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_1_0 <= dataModule_io_dataOut_1_1_0; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_1_0 <= _GEN_1230;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_1_1 <= dataModule_io_dataOut_1_3_1; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_1_1 <= dataModule_io_dataOut_1_2_1; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_1_1 <= dataModule_io_dataOut_1_1_1; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_1_1 <= _GEN_1234;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_1_2 <= dataModule_io_dataOut_1_3_2; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_1_2 <= dataModule_io_dataOut_1_2_2; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_1_2 <= dataModule_io_dataOut_1_1_2; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_1_2 <= _GEN_1238;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_1_3 <= dataModule_io_dataOut_1_3_3; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_1_3 <= dataModule_io_dataOut_1_2_3; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_1_3 <= dataModule_io_dataOut_1_1_3; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_1_3 <= _GEN_1242;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_1_4 <= dataModule_io_dataOut_1_3_4; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_1_4 <= dataModule_io_dataOut_1_2_4; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_1_4 <= dataModule_io_dataOut_1_1_4; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_1_4 <= _GEN_1246;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_1_5 <= dataModule_io_dataOut_1_3_5; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_1_5 <= dataModule_io_dataOut_1_2_5; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_1_5 <= dataModule_io_dataOut_1_1_5; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_1_5 <= _GEN_1250;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_1_6 <= dataModule_io_dataOut_1_3_6; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_1_6 <= dataModule_io_dataOut_1_2_6; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_1_6 <= dataModule_io_dataOut_1_1_6; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_1_6 <= _GEN_1254;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_1_7 <= dataModule_io_dataOut_1_3_7; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_1_7 <= dataModule_io_dataOut_1_2_7; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_1_7 <= dataModule_io_dataOut_1_1_7; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_1_7 <= _GEN_1258;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_1_8 <= dataModule_io_dataOut_1_3_8; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_1_8 <= dataModule_io_dataOut_1_2_8; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_1_8 <= dataModule_io_dataOut_1_1_8; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_1_8 <= _GEN_1262;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_1_9 <= dataModule_io_dataOut_1_3_9; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_1_9 <= dataModule_io_dataOut_1_2_9; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_1_9 <= dataModule_io_dataOut_1_1_9; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_1_9 <= _GEN_1266;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_1_10 <= dataModule_io_dataOut_1_3_10; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_1_10 <= dataModule_io_dataOut_1_2_10; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_1_10 <= dataModule_io_dataOut_1_1_10; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_1_10 <= _GEN_1270;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_1_11 <= dataModule_io_dataOut_1_3_11; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_1_11 <= dataModule_io_dataOut_1_2_11; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_1_11 <= dataModule_io_dataOut_1_1_11; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_1_11 <= _GEN_1274;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_1_12 <= dataModule_io_dataOut_1_3_12; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_1_12 <= dataModule_io_dataOut_1_2_12; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_1_12 <= dataModule_io_dataOut_1_1_12; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_1_12 <= _GEN_1278;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_1_13 <= dataModule_io_dataOut_1_3_13; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_1_13 <= dataModule_io_dataOut_1_2_13; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_1_13 <= dataModule_io_dataOut_1_1_13; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_1_13 <= _GEN_1282;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_1_14 <= dataModule_io_dataOut_1_3_14; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_1_14 <= dataModule_io_dataOut_1_2_14; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_1_14 <= dataModule_io_dataOut_1_1_14; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_1_14 <= _GEN_1286;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_1_15 <= dataModule_io_dataOut_1_3_15; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_1_15 <= dataModule_io_dataOut_1_2_15; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_1_15 <= dataModule_io_dataOut_1_1_15; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_1_15 <= _GEN_1290;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_2_0 <= dataModule_io_dataOut_2_3_0; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_2_0 <= dataModule_io_dataOut_2_2_0; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_2_0 <= dataModule_io_dataOut_2_1_0; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_2_0 <= _GEN_1294;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_2_1 <= dataModule_io_dataOut_2_3_1; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_2_1 <= dataModule_io_dataOut_2_2_1; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_2_1 <= dataModule_io_dataOut_2_1_1; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_2_1 <= _GEN_1298;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_2_2 <= dataModule_io_dataOut_2_3_2; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_2_2 <= dataModule_io_dataOut_2_2_2; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_2_2 <= dataModule_io_dataOut_2_1_2; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_2_2 <= _GEN_1302;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_2_3 <= dataModule_io_dataOut_2_3_3; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_2_3 <= dataModule_io_dataOut_2_2_3; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_2_3 <= dataModule_io_dataOut_2_1_3; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_2_3 <= _GEN_1306;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_2_4 <= dataModule_io_dataOut_2_3_4; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_2_4 <= dataModule_io_dataOut_2_2_4; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_2_4 <= dataModule_io_dataOut_2_1_4; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_2_4 <= _GEN_1310;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_2_5 <= dataModule_io_dataOut_2_3_5; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_2_5 <= dataModule_io_dataOut_2_2_5; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_2_5 <= dataModule_io_dataOut_2_1_5; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_2_5 <= _GEN_1314;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_2_6 <= dataModule_io_dataOut_2_3_6; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_2_6 <= dataModule_io_dataOut_2_2_6; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_2_6 <= dataModule_io_dataOut_2_1_6; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_2_6 <= _GEN_1318;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_2_7 <= dataModule_io_dataOut_2_3_7; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_2_7 <= dataModule_io_dataOut_2_2_7; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_2_7 <= dataModule_io_dataOut_2_1_7; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_2_7 <= _GEN_1322;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_2_8 <= dataModule_io_dataOut_2_3_8; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_2_8 <= dataModule_io_dataOut_2_2_8; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_2_8 <= dataModule_io_dataOut_2_1_8; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_2_8 <= _GEN_1326;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_2_9 <= dataModule_io_dataOut_2_3_9; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_2_9 <= dataModule_io_dataOut_2_2_9; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_2_9 <= dataModule_io_dataOut_2_1_9; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_2_9 <= _GEN_1330;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_2_10 <= dataModule_io_dataOut_2_3_10; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_2_10 <= dataModule_io_dataOut_2_2_10; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_2_10 <= dataModule_io_dataOut_2_1_10; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_2_10 <= _GEN_1334;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_2_11 <= dataModule_io_dataOut_2_3_11; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_2_11 <= dataModule_io_dataOut_2_2_11; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_2_11 <= dataModule_io_dataOut_2_1_11; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_2_11 <= _GEN_1338;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_2_12 <= dataModule_io_dataOut_2_3_12; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_2_12 <= dataModule_io_dataOut_2_2_12; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_2_12 <= dataModule_io_dataOut_2_1_12; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_2_12 <= _GEN_1342;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_2_13 <= dataModule_io_dataOut_2_3_13; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_2_13 <= dataModule_io_dataOut_2_2_13; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_2_13 <= dataModule_io_dataOut_2_1_13; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_2_13 <= _GEN_1346;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_2_14 <= dataModule_io_dataOut_2_3_14; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_2_14 <= dataModule_io_dataOut_2_2_14; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_2_14 <= dataModule_io_dataOut_2_1_14; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_2_14 <= _GEN_1350;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_2_15 <= dataModule_io_dataOut_2_3_15; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_2_15 <= dataModule_io_dataOut_2_2_15; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_2_15 <= dataModule_io_dataOut_2_1_15; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_2_15 <= _GEN_1354;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_3_0 <= dataModule_io_dataOut_3_3_0; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_3_0 <= dataModule_io_dataOut_3_2_0; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_3_0 <= dataModule_io_dataOut_3_1_0; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_3_0 <= _GEN_1358;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_3_1 <= dataModule_io_dataOut_3_3_1; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_3_1 <= dataModule_io_dataOut_3_2_1; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_3_1 <= dataModule_io_dataOut_3_1_1; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_3_1 <= _GEN_1362;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_3_2 <= dataModule_io_dataOut_3_3_2; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_3_2 <= dataModule_io_dataOut_3_2_2; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_3_2 <= dataModule_io_dataOut_3_1_2; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_3_2 <= _GEN_1366;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_3_3 <= dataModule_io_dataOut_3_3_3; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_3_3 <= dataModule_io_dataOut_3_2_3; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_3_3 <= dataModule_io_dataOut_3_1_3; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_3_3 <= _GEN_1370;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_3_4 <= dataModule_io_dataOut_3_3_4; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_3_4 <= dataModule_io_dataOut_3_2_4; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_3_4 <= dataModule_io_dataOut_3_1_4; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_3_4 <= _GEN_1374;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_3_5 <= dataModule_io_dataOut_3_3_5; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_3_5 <= dataModule_io_dataOut_3_2_5; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_3_5 <= dataModule_io_dataOut_3_1_5; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_3_5 <= _GEN_1378;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_3_6 <= dataModule_io_dataOut_3_3_6; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_3_6 <= dataModule_io_dataOut_3_2_6; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_3_6 <= dataModule_io_dataOut_3_1_6; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_3_6 <= _GEN_1382;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_3_7 <= dataModule_io_dataOut_3_3_7; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_3_7 <= dataModule_io_dataOut_3_2_7; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_3_7 <= dataModule_io_dataOut_3_1_7; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_3_7 <= _GEN_1386;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_3_8 <= dataModule_io_dataOut_3_3_8; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_3_8 <= dataModule_io_dataOut_3_2_8; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_3_8 <= dataModule_io_dataOut_3_1_8; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_3_8 <= _GEN_1390;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_3_9 <= dataModule_io_dataOut_3_3_9; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_3_9 <= dataModule_io_dataOut_3_2_9; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_3_9 <= dataModule_io_dataOut_3_1_9; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_3_9 <= _GEN_1394;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_3_10 <= dataModule_io_dataOut_3_3_10; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_3_10 <= dataModule_io_dataOut_3_2_10; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_3_10 <= dataModule_io_dataOut_3_1_10; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_3_10 <= _GEN_1398;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_3_11 <= dataModule_io_dataOut_3_3_11; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_3_11 <= dataModule_io_dataOut_3_2_11; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_3_11 <= dataModule_io_dataOut_3_1_11; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_3_11 <= _GEN_1402;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_3_12 <= dataModule_io_dataOut_3_3_12; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_3_12 <= dataModule_io_dataOut_3_2_12; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_3_12 <= dataModule_io_dataOut_3_1_12; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_3_12 <= _GEN_1406;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_3_13 <= dataModule_io_dataOut_3_3_13; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_3_13 <= dataModule_io_dataOut_3_2_13; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_3_13 <= dataModule_io_dataOut_3_1_13; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_3_13 <= _GEN_1410;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_3_14 <= dataModule_io_dataOut_3_3_14; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_3_14 <= dataModule_io_dataOut_3_2_14; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_3_14 <= dataModule_io_dataOut_3_1_14; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_3_14 <= _GEN_1414;
      end
    end
    if (io_forward_1_valid) begin // @[Reg.scala 17:18]
      if (2'h3 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_3_15 <= dataModule_io_dataOut_3_3_15; // @[Sbuffer.scala 751:14]
      end else if (2'h2 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_3_15 <= dataModule_io_dataOut_3_2_15; // @[Sbuffer.scala 751:14]
      end else if (2'h1 == io_forward_1_paddr[5:4]) begin // @[Sbuffer.scala 751:14]
        forward_data_candidate_reg_1_3_15 <= dataModule_io_dataOut_3_1_15; // @[Sbuffer.scala 751:14]
      end else begin
        forward_data_candidate_reg_1_3_15 <= _GEN_1418;
      end
    end
    perf_valid_entry_count <= _perf_valid_entry_count_T_13 + _perf_valid_entry_count_T_15; // @[Bitwise.scala 48:55]
    io_perf_0_value_REG <= _T_391[0] + _T_391[1]; // @[Bitwise.scala 48:55]
    io_perf_0_value_REG_1 <= io_perf_0_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_1_value_REG <= _T_398[0] + _T_398[1]; // @[Bitwise.scala 48:55]
    io_perf_1_value_REG_1 <= io_perf_1_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_2_value_REG <= _T_407[0] + _T_407[1]; // @[Bitwise.scala 48:55]
    io_perf_2_value_REG_1 <= io_perf_2_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_3_value_REG <= _T_418[0] + _T_418[1]; // @[Bitwise.scala 48:55]
    io_perf_3_value_REG_1 <= io_perf_3_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_4_value_REG <= io_dcache_req_valid; // @[PerfCounterUtils.scala 188:35]
    io_perf_4_value_REG_1 <= io_perf_4_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_5_value_REG <= io_dcache_req_ready & io_dcache_req_valid; // @[Decoupled.scala 50:35]
    io_perf_5_value_REG_1 <= io_perf_5_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_6_value_REG <= sbuffer_state == 2'h0; // @[Sbuffer.scala 831:42]
    io_perf_6_value_REG_1 <= io_perf_6_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_7_value_REG <= sbuffer_state == 2'h3; // @[Sbuffer.scala 832:42]
    io_perf_7_value_REG_1 <= io_perf_7_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_8_value_REG <= sbuffer_state == 2'h1; // @[Sbuffer.scala 833:42]
    io_perf_8_value_REG_1 <= io_perf_8_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_9_value_REG <= io_dcache_main_pipe_hit_resp_valid; // @[PerfCounterUtils.scala 188:35]
    io_perf_9_value_REG_1 <= io_perf_9_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_10_value_REG <= io_dcache_refill_hit_resp_valid; // @[PerfCounterUtils.scala 188:35]
    io_perf_10_value_REG_1 <= io_perf_10_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_11_value_REG <= io_dcache_replay_resp_valid; // @[PerfCounterUtils.scala 188:35]
    io_perf_11_value_REG_1 <= io_perf_11_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_12_value_REG <= cohTimeOutMask_0 | f_tail_1; // @[PriorityMuxDefault.scala 47:46]
    io_perf_12_value_REG_1 <= io_perf_12_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_13_value_REG <= perf_valid_entry_count < 3'h1; // @[Sbuffer.scala 838:52]
    io_perf_13_value_REG_1 <= io_perf_13_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_14_value_REG <= perf_valid_entry_count > 3'h1 & perf_valid_entry_count <= _T_467; // @[Sbuffer.scala 839:79]
    io_perf_14_value_REG_1 <= io_perf_14_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_15_value_REG <= perf_valid_entry_count > _T_467 & _GEN_2274 <= _T_473; // @[Sbuffer.scala 840:79]
    io_perf_15_value_REG_1 <= io_perf_15_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_16_value_REG <= _GEN_2274 > _T_473; // @[Sbuffer.scala 841:52]
    io_perf_16_value_REG_1 <= io_perf_16_value_REG; // @[PerfCounterUtils.scala 188:27]
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Sbuffer.scala 653:24]
      stateVec_0_state_valid <= 1'h0; // @[Sbuffer.scala 655:{44,44}]
    end else if (io_dcache_refill_hit_resp_valid) begin
      if (2'h0 == io_dcache_refill_hit_resp_bits_id[1:0]) begin
        stateVec_0_state_valid <= 1'h0;
      end else begin
        stateVec_0_state_valid <= _GEN_777;
      end
    end else begin
      stateVec_0_state_valid <= _GEN_777;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Sbuffer.scala 653:24]
      stateVec_0_state_inflight <= 1'h0; // @[Sbuffer.scala 654:{47,47}]
    end else if (io_dcache_refill_hit_resp_valid) begin
      if (2'h0 == io_dcache_refill_hit_resp_bits_id[1:0]) begin
        stateVec_0_state_inflight <= 1'h0;
      end else begin
        stateVec_0_state_inflight <= _GEN_773;
      end
    end else begin
      stateVec_0_state_inflight <= _GEN_773;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Sbuffer.scala 685:39]
      stateVec_0_wtimeout <= 1'h0;
    end else if (io_dcache_replay_resp_valid) begin // @[Sbuffer.scala 605:28]
      stateVec_0_wtimeout <= _GEN_813; // @[Sbuffer.scala 207:25 607:{52,52}]
    end else if (sbuffer_out_s0_fire) begin // @[Sbuffer.scala 207:25]
      if (2'h0 == sbuffer_out_s0_evictionIdx) begin
        stateVec_0_wtimeout <= 1'h0;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Sbuffer.scala 672:8]
      stateVec_0_wsameblock_inflight <= 1'h0; // @[Sbuffer.scala 673:42]
    end else if (_T_325) begin // @[Sbuffer.scala 672:8]
      stateVec_0_wsameblock_inflight <= 1'h0; // @[Sbuffer.scala 673:42]
    end else if (_T_286) begin // @[Sbuffer.scala 437:20]
      stateVec_0_wsameblock_inflight <= 1'h0; // @[Sbuffer.scala 438:24]
    end else if (_T_58) begin
      if (canMerge_1) begin
        stateVec_0_wsameblock_inflight <= _GEN_76;
      end else begin
        stateVec_0_wsameblock_inflight <= _GEN_109;
      end
    end else begin
      stateVec_0_wsameblock_inflight <= _GEN_76;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Sbuffer.scala 653:24]
      stateVec_1_state_valid <= 1'h0; // @[Sbuffer.scala 655:{44,44}]
    end else if (io_dcache_refill_hit_resp_valid) begin
      if (2'h1 == io_dcache_refill_hit_resp_bits_id[1:0]) begin
        stateVec_1_state_valid <= 1'h0;
      end else begin
        stateVec_1_state_valid <= _GEN_778;
      end
    end else begin
      stateVec_1_state_valid <= _GEN_778;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Sbuffer.scala 653:24]
      stateVec_1_state_inflight <= 1'h0; // @[Sbuffer.scala 654:{47,47}]
    end else if (io_dcache_refill_hit_resp_valid) begin
      if (2'h1 == io_dcache_refill_hit_resp_bits_id[1:0]) begin
        stateVec_1_state_inflight <= 1'h0;
      end else begin
        stateVec_1_state_inflight <= _GEN_774;
      end
    end else begin
      stateVec_1_state_inflight <= _GEN_774;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Sbuffer.scala 685:39]
      stateVec_1_wtimeout <= 1'h0;
    end else if (io_dcache_replay_resp_valid) begin // @[Sbuffer.scala 605:28]
      stateVec_1_wtimeout <= _GEN_814; // @[Sbuffer.scala 207:25 607:{52,52}]
    end else if (sbuffer_out_s0_fire) begin // @[Sbuffer.scala 207:25]
      if (2'h1 == sbuffer_out_s0_evictionIdx) begin
        stateVec_1_wtimeout <= 1'h0;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Sbuffer.scala 672:8]
      stateVec_1_wsameblock_inflight <= 1'h0; // @[Sbuffer.scala 673:42]
    end else if (_T_331) begin // @[Sbuffer.scala 672:8]
      stateVec_1_wsameblock_inflight <= 1'h0; // @[Sbuffer.scala 673:42]
    end else if (_T_292) begin // @[Sbuffer.scala 437:20]
      stateVec_1_wsameblock_inflight <= 1'h0; // @[Sbuffer.scala 438:24]
    end else if (_T_58) begin
      if (canMerge_1) begin
        stateVec_1_wsameblock_inflight <= _GEN_81;
      end else begin
        stateVec_1_wsameblock_inflight <= _GEN_116;
      end
    end else begin
      stateVec_1_wsameblock_inflight <= _GEN_81;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Sbuffer.scala 653:24]
      stateVec_2_state_valid <= 1'h0; // @[Sbuffer.scala 655:{44,44}]
    end else if (io_dcache_refill_hit_resp_valid) begin
      if (2'h2 == io_dcache_refill_hit_resp_bits_id[1:0]) begin
        stateVec_2_state_valid <= 1'h0;
      end else begin
        stateVec_2_state_valid <= _GEN_779;
      end
    end else begin
      stateVec_2_state_valid <= _GEN_779;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Sbuffer.scala 653:24]
      stateVec_2_state_inflight <= 1'h0; // @[Sbuffer.scala 654:{47,47}]
    end else if (io_dcache_refill_hit_resp_valid) begin
      if (2'h2 == io_dcache_refill_hit_resp_bits_id[1:0]) begin
        stateVec_2_state_inflight <= 1'h0;
      end else begin
        stateVec_2_state_inflight <= _GEN_775;
      end
    end else begin
      stateVec_2_state_inflight <= _GEN_775;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Sbuffer.scala 685:39]
      stateVec_2_wtimeout <= 1'h0;
    end else if (io_dcache_replay_resp_valid) begin // @[Sbuffer.scala 605:28]
      stateVec_2_wtimeout <= _GEN_815; // @[Sbuffer.scala 207:25 607:{52,52}]
    end else if (sbuffer_out_s0_fire) begin // @[Sbuffer.scala 207:25]
      if (2'h2 == sbuffer_out_s0_evictionIdx) begin
        stateVec_2_wtimeout <= 1'h0;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Sbuffer.scala 672:8]
      stateVec_2_wsameblock_inflight <= 1'h0; // @[Sbuffer.scala 673:42]
    end else if (_T_337) begin // @[Sbuffer.scala 672:8]
      stateVec_2_wsameblock_inflight <= 1'h0; // @[Sbuffer.scala 673:42]
    end else if (_T_298) begin // @[Sbuffer.scala 437:20]
      stateVec_2_wsameblock_inflight <= 1'h0; // @[Sbuffer.scala 438:24]
    end else if (_T_58) begin
      if (canMerge_1) begin
        stateVec_2_wsameblock_inflight <= _GEN_86;
      end else begin
        stateVec_2_wsameblock_inflight <= _GEN_123;
      end
    end else begin
      stateVec_2_wsameblock_inflight <= _GEN_86;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Sbuffer.scala 653:24]
      stateVec_3_state_valid <= 1'h0; // @[Sbuffer.scala 655:{44,44}]
    end else if (io_dcache_refill_hit_resp_valid) begin
      if (2'h3 == io_dcache_refill_hit_resp_bits_id[1:0]) begin
        stateVec_3_state_valid <= 1'h0;
      end else begin
        stateVec_3_state_valid <= _GEN_780;
      end
    end else begin
      stateVec_3_state_valid <= _GEN_780;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Sbuffer.scala 653:24]
      stateVec_3_state_inflight <= 1'h0; // @[Sbuffer.scala 654:{47,47}]
    end else if (io_dcache_refill_hit_resp_valid) begin
      if (2'h3 == io_dcache_refill_hit_resp_bits_id[1:0]) begin
        stateVec_3_state_inflight <= 1'h0;
      end else begin
        stateVec_3_state_inflight <= _GEN_776;
      end
    end else begin
      stateVec_3_state_inflight <= _GEN_776;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Sbuffer.scala 685:39]
      stateVec_3_wtimeout <= 1'h0;
    end else if (io_dcache_replay_resp_valid) begin // @[Sbuffer.scala 605:28]
      stateVec_3_wtimeout <= _GEN_816; // @[Sbuffer.scala 207:25 607:{52,52}]
    end else if (sbuffer_out_s0_fire) begin // @[Sbuffer.scala 207:25]
      if (2'h3 == sbuffer_out_s0_evictionIdx) begin
        stateVec_3_wtimeout <= 1'h0;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Sbuffer.scala 672:8]
      stateVec_3_wsameblock_inflight <= 1'h0; // @[Sbuffer.scala 673:42]
    end else if (_T_343) begin // @[Sbuffer.scala 672:8]
      stateVec_3_wsameblock_inflight <= 1'h0; // @[Sbuffer.scala 673:42]
    end else if (_T_304) begin // @[Sbuffer.scala 437:20]
      stateVec_3_wsameblock_inflight <= 1'h0; // @[Sbuffer.scala 438:24]
    end else if (_T_58) begin
      if (canMerge_1) begin
        stateVec_3_wsameblock_inflight <= _GEN_91;
      end else begin
        stateVec_3_wsameblock_inflight <= _GEN_130;
      end
    end else begin
      stateVec_3_wsameblock_inflight <= _GEN_91;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Sbuffer.scala 698:46]
      cohCount_0 <= 21'h0; // @[Sbuffer.scala 699:19]
    end else if (_cohTimeOutMask_T_2 & ~cohTimeOutMask_0) begin // @[Sbuffer.scala 437:20]
      cohCount_0 <= _cohCount_0_T_1; // @[Sbuffer.scala 438:24 408:32 409:28 384:32 390:28]
    end else if (_T_58) begin
      if (canMerge_1) begin
        if (mergeVec_1[0]) begin
          cohCount_0 <= 21'h0;
        end else begin
          cohCount_0 <= _GEN_70;
        end
      end else if (secondInsertVec[0]) begin
        cohCount_0 <= 21'h0;
      end else begin
        cohCount_0 <= _GEN_70;
      end
    end else begin
      cohCount_0 <= _GEN_70;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Sbuffer.scala 698:46]
      cohCount_1 <= 21'h0; // @[Sbuffer.scala 699:19]
    end else if (_cohTimeOutMask_T_6 & ~cohTimeOutMask_1) begin // @[Sbuffer.scala 437:20]
      cohCount_1 <= _cohCount_1_T_1; // @[Sbuffer.scala 438:24 408:32 409:28 384:32 390:28]
    end else if (_T_58) begin
      if (canMerge_1) begin
        if (mergeVec_1[1]) begin
          cohCount_1 <= 21'h0;
        end else begin
          cohCount_1 <= _GEN_72;
        end
      end else if (secondInsertVec[1]) begin
        cohCount_1 <= 21'h0;
      end else begin
        cohCount_1 <= _GEN_72;
      end
    end else begin
      cohCount_1 <= _GEN_72;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Sbuffer.scala 698:46]
      cohCount_2 <= 21'h0; // @[Sbuffer.scala 699:19]
    end else if (_cohTimeOutMask_T_10 & ~cohTimeOutMask_2) begin // @[Sbuffer.scala 437:20]
      cohCount_2 <= _cohCount_2_T_1; // @[Sbuffer.scala 438:24 408:32 409:28 384:32 390:28]
    end else if (_T_58) begin
      if (canMerge_1) begin
        if (mergeVec_1[2]) begin
          cohCount_2 <= 21'h0;
        end else begin
          cohCount_2 <= _GEN_73;
        end
      end else if (secondInsertVec[2]) begin
        cohCount_2 <= 21'h0;
      end else begin
        cohCount_2 <= _GEN_73;
      end
    end else begin
      cohCount_2 <= _GEN_73;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Sbuffer.scala 698:46]
      cohCount_3 <= 21'h0; // @[Sbuffer.scala 699:19]
    end else if (_cohTimeOutMask_T_14 & ~cohTimeOutMask_3) begin // @[Sbuffer.scala 437:20]
      cohCount_3 <= _cohCount_3_T_1; // @[Sbuffer.scala 438:24 408:32 409:28 384:32 390:28]
    end else if (_T_58) begin
      if (canMerge_1) begin
        if (mergeVec_1[3]) begin
          cohCount_3 <= 21'h0;
        end else begin
          cohCount_3 <= _GEN_74;
        end
      end else if (secondInsertVec[3]) begin
        cohCount_3 <= 21'h0;
      end else begin
        cohCount_3 <= _GEN_74;
      end
    end else begin
      cohCount_3 <= _GEN_74;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Sbuffer.scala 695:111]
      missqReplayCount_0 <= 5'h0; // @[Sbuffer.scala 696:27]
    end else if (stateVec_0_wtimeout & stateVec_0_state_inflight & ~missqReplayCount_0[4]) begin // @[Sbuffer.scala 685:39]
      missqReplayCount_0 <= _missqReplayCount_0_T_1; // @[Sbuffer.scala 209:33 686:{38,38}]
    end else if (io_dcache_replay_resp_valid) begin // @[Sbuffer.scala 209:33]
      if (2'h0 == io_dcache_replay_resp_bits_id[1:0]) begin
        missqReplayCount_0 <= 5'h0;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Sbuffer.scala 695:111]
      missqReplayCount_1 <= 5'h0; // @[Sbuffer.scala 696:27]
    end else if (stateVec_1_wtimeout & stateVec_1_state_inflight & ~missqReplayCount_1[4]) begin // @[Sbuffer.scala 685:39]
      missqReplayCount_1 <= _missqReplayCount_1_T_1; // @[Sbuffer.scala 209:33 686:{38,38}]
    end else if (io_dcache_replay_resp_valid) begin // @[Sbuffer.scala 209:33]
      if (2'h1 == io_dcache_replay_resp_bits_id[1:0]) begin
        missqReplayCount_1 <= 5'h0;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Sbuffer.scala 695:111]
      missqReplayCount_2 <= 5'h0; // @[Sbuffer.scala 696:27]
    end else if (stateVec_2_wtimeout & stateVec_2_state_inflight & ~missqReplayCount_2[4]) begin // @[Sbuffer.scala 685:39]
      missqReplayCount_2 <= _missqReplayCount_2_T_1; // @[Sbuffer.scala 209:33 686:{38,38}]
    end else if (io_dcache_replay_resp_valid) begin // @[Sbuffer.scala 209:33]
      if (2'h2 == io_dcache_replay_resp_bits_id[1:0]) begin
        missqReplayCount_2 <= 5'h0;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Sbuffer.scala 695:111]
      missqReplayCount_3 <= 5'h0; // @[Sbuffer.scala 696:27]
    end else if (stateVec_3_wtimeout & stateVec_3_state_inflight & ~missqReplayCount_3[4]) begin // @[Sbuffer.scala 685:39]
      missqReplayCount_3 <= _missqReplayCount_3_T_1; // @[Sbuffer.scala 209:33 686:{38,38}]
    end else if (io_dcache_replay_resp_valid) begin // @[Sbuffer.scala 209:33]
      if (2'h3 == io_dcache_replay_resp_bits_id[1:0]) begin
        missqReplayCount_3 <= 5'h0;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Sbuffer.scala 486:24]
      sbuffer_state <= 2'h0; // @[Sbuffer.scala 488:27 489:23 490:33 491:23 492:30 493:23 222:30]
    end else if (2'h0 == sbuffer_state) begin // @[Sbuffer.scala 486:24]
      if (io_flush_valid) begin // @[Sbuffer.scala 497:18]
        sbuffer_state <= 2'h2; // @[Sbuffer.scala 498:23]
      end else if (do_uarch_drain) begin // @[Sbuffer.scala 222:30]
        sbuffer_state <= 2'h3;
      end else if (do_eviction) begin
        sbuffer_state <= 2'h1;
      end
    end else if (2'h2 == sbuffer_state) begin // @[Sbuffer.scala 486:24]
      if (empty) begin // @[Sbuffer.scala 502:27]
        sbuffer_state <= 2'h0; // @[Sbuffer.scala 503:23]
      end
    end else if (2'h3 == sbuffer_state) begin // @[Sbuffer.scala 486:24]
      if (io_flush_valid) begin
        sbuffer_state <= 2'h2;
      end else begin
        sbuffer_state <= _GEN_191;
      end
    end else if (2'h1 == sbuffer_state) begin // @[Sbuffer.scala 222:30]
      sbuffer_state <= _GEN_195;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Replacement.scala 175:40]
      state_reg <= 3'h0; // @[Replacement.scala 22:{56,56,56}]
    end else if (_T_1) begin // @[Replacement.scala 168:70]
      if (accessIdx_2_valid) begin
        state_reg <= _state_reg_T_28;
      end else if (accessIdx_1_valid_REG) begin
        state_reg <= _state_reg_T_18;
      end else if (accessIdx_0_valid_REG) begin
        state_reg <= _state_reg_T_8;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Sbuffer.scala 479:53]
      do_eviction <= 1'h0;
    end else begin
      do_eviction <= _GEN_2265 >= threshold | validCount == 3'h3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Sbuffer.scala 602:29]
      sbuffer_out_s1_valid <= 1'h0; // @[Sbuffer.scala 603:26]
    end else if (sbuffer_out_s0_cango) begin // @[Sbuffer.scala 598:28]
      sbuffer_out_s1_valid <= sbuffer_out_s0_valid; // @[Sbuffer.scala 599:26]
    end else if (sbuffer_out_s1_fire) begin // @[Sbuffer.scala 593:37]
      sbuffer_out_s1_valid <= 1'h0;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Sbuffer.scala 346:24]
      enbufferSelReg <= 1'h0; // @[Sbuffer.scala 347:20]
    end else if (io_in_0_valid) begin // @[Sbuffer.scala 345:31]
      enbufferSelReg <= ~enbufferSelReg;
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
  ptag_0 = _RAND_0[29:0];
  _RAND_1 = {1{`RANDOM}};
  ptag_1 = _RAND_1[29:0];
  _RAND_2 = {1{`RANDOM}};
  ptag_2 = _RAND_2[29:0];
  _RAND_3 = {1{`RANDOM}};
  ptag_3 = _RAND_3[29:0];
  _RAND_4 = {2{`RANDOM}};
  vtag_0 = _RAND_4[32:0];
  _RAND_5 = {2{`RANDOM}};
  vtag_1 = _RAND_5[32:0];
  _RAND_6 = {2{`RANDOM}};
  vtag_2 = _RAND_6[32:0];
  _RAND_7 = {2{`RANDOM}};
  vtag_3 = _RAND_7[32:0];
  _RAND_8 = {1{`RANDOM}};
  waitInflightMask_0 = _RAND_8[3:0];
  _RAND_9 = {1{`RANDOM}};
  waitInflightMask_1 = _RAND_9[3:0];
  _RAND_10 = {1{`RANDOM}};
  waitInflightMask_2 = _RAND_10[3:0];
  _RAND_11 = {1{`RANDOM}};
  waitInflightMask_3 = _RAND_11[3:0];
  _RAND_12 = {1{`RANDOM}};
  stateVec_0_state_valid = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  stateVec_0_state_inflight = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  stateVec_0_wtimeout = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  stateVec_0_wsameblock_inflight = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  stateVec_1_state_valid = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  stateVec_1_state_inflight = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  stateVec_1_wtimeout = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  stateVec_1_wsameblock_inflight = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  stateVec_2_state_valid = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  stateVec_2_state_inflight = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  stateVec_2_wtimeout = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  stateVec_2_wsameblock_inflight = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  stateVec_3_state_valid = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  stateVec_3_state_inflight = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  stateVec_3_wtimeout = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  stateVec_3_wsameblock_inflight = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  cohCount_0 = _RAND_28[20:0];
  _RAND_29 = {1{`RANDOM}};
  cohCount_1 = _RAND_29[20:0];
  _RAND_30 = {1{`RANDOM}};
  cohCount_2 = _RAND_30[20:0];
  _RAND_31 = {1{`RANDOM}};
  cohCount_3 = _RAND_31[20:0];
  _RAND_32 = {1{`RANDOM}};
  missqReplayCount_0 = _RAND_32[4:0];
  _RAND_33 = {1{`RANDOM}};
  missqReplayCount_1 = _RAND_33[4:0];
  _RAND_34 = {1{`RANDOM}};
  missqReplayCount_2 = _RAND_34[4:0];
  _RAND_35 = {1{`RANDOM}};
  missqReplayCount_3 = _RAND_35[4:0];
  _RAND_36 = {1{`RANDOM}};
  sbuffer_state = _RAND_36[1:0];
  _RAND_37 = {1{`RANDOM}};
  state_reg = _RAND_37[2:0];
  _RAND_38 = {1{`RANDOM}};
  accessIdx_0_valid_REG = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  accessIdx_1_valid_REG = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  do_eviction = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  missqReplayHasTimeOut_REG = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  missqReplayHasTimeOut_REG_1 = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  blockDcacheWrite = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  sbuffer_out_s1_valid = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  accessIdx_0_bits_REG = _RAND_45[1:0];
  _RAND_46 = {1{`RANDOM}};
  accessIdx_1_bits_REG = _RAND_46[1:0];
  _RAND_47 = {1{`RANDOM}};
  missqReplayTimeOutIdx = _RAND_47[1:0];
  _RAND_48 = {1{`RANDOM}};
  enbufferSelReg = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  do_uarch_drain_REG = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  do_uarch_drain_REG_1 = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  do_uarch_drain_REG_2 = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  threshold = _RAND_52[4:0];
  _RAND_53 = {1{`RANDOM}};
  io_flush_empty_REG = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  sbuffer_out_s1_evictionIdx = _RAND_54[1:0];
  _RAND_55 = {1{`RANDOM}};
  sbuffer_out_s1_evictionPTag = _RAND_55[29:0];
  _RAND_56 = {2{`RANDOM}};
  sbuffer_out_s1_evictionVTag = _RAND_56[32:0];
  _RAND_57 = {1{`RANDOM}};
  REG = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  REG_1 = _RAND_58[1:0];
  _RAND_59 = {1{`RANDOM}};
  REG_2 = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  REG_3 = _RAND_60[1:0];
  _RAND_61 = {1{`RANDOM}};
  REG_4 = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  REG_5 = _RAND_62[1:0];
  _RAND_63 = {1{`RANDOM}};
  REG_6 = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  REG_7 = _RAND_64[1:0];
  _RAND_65 = {1{`RANDOM}};
  REG_8 = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  REG_9 = _RAND_66[1:0];
  _RAND_67 = {1{`RANDOM}};
  REG_10 = _RAND_67[0:0];
  _RAND_68 = {1{`RANDOM}};
  REG_11 = _RAND_68[1:0];
  _RAND_69 = {1{`RANDOM}};
  REG_12 = _RAND_69[0:0];
  _RAND_70 = {1{`RANDOM}};
  REG_13 = _RAND_70[1:0];
  _RAND_71 = {1{`RANDOM}};
  REG_14 = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  REG_15 = _RAND_72[1:0];
  _RAND_73 = {1{`RANDOM}};
  tag_mismatch_REG = _RAND_73[0:0];
  _RAND_74 = {1{`RANDOM}};
  tag_mismatch_REG_7 = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  ptag_matches_r6 = _RAND_75[29:0];
  _RAND_76 = {1{`RANDOM}};
  ptag_matches_r7 = _RAND_76[29:0];
  _RAND_77 = {1{`RANDOM}};
  tag_mismatch_REG_8 = _RAND_77[0:0];
  _RAND_78 = {1{`RANDOM}};
  tag_mismatch_REG_5 = _RAND_78[0:0];
  _RAND_79 = {1{`RANDOM}};
  ptag_matches_r4 = _RAND_79[29:0];
  _RAND_80 = {1{`RANDOM}};
  ptag_matches_r5 = _RAND_80[29:0];
  _RAND_81 = {1{`RANDOM}};
  tag_mismatch_REG_6 = _RAND_81[0:0];
  _RAND_82 = {1{`RANDOM}};
  tag_mismatch_REG_3 = _RAND_82[0:0];
  _RAND_83 = {1{`RANDOM}};
  ptag_matches_r2 = _RAND_83[29:0];
  _RAND_84 = {1{`RANDOM}};
  ptag_matches_r3 = _RAND_84[29:0];
  _RAND_85 = {1{`RANDOM}};
  tag_mismatch_REG_4 = _RAND_85[0:0];
  _RAND_86 = {1{`RANDOM}};
  tag_mismatch_REG_1 = _RAND_86[0:0];
  _RAND_87 = {1{`RANDOM}};
  ptag_matches_r = _RAND_87[29:0];
  _RAND_88 = {1{`RANDOM}};
  ptag_matches_r1 = _RAND_88[29:0];
  _RAND_89 = {1{`RANDOM}};
  tag_mismatch_REG_2 = _RAND_89[0:0];
  _RAND_90 = {1{`RANDOM}};
  tag_mismatch_REG_9 = _RAND_90[0:0];
  _RAND_91 = {1{`RANDOM}};
  tag_mismatch_REG_16 = _RAND_91[0:0];
  _RAND_92 = {1{`RANDOM}};
  ptag_matches_r14 = _RAND_92[29:0];
  _RAND_93 = {1{`RANDOM}};
  ptag_matches_r15 = _RAND_93[29:0];
  _RAND_94 = {1{`RANDOM}};
  tag_mismatch_REG_17 = _RAND_94[0:0];
  _RAND_95 = {1{`RANDOM}};
  tag_mismatch_REG_14 = _RAND_95[0:0];
  _RAND_96 = {1{`RANDOM}};
  ptag_matches_r12 = _RAND_96[29:0];
  _RAND_97 = {1{`RANDOM}};
  ptag_matches_r13 = _RAND_97[29:0];
  _RAND_98 = {1{`RANDOM}};
  tag_mismatch_REG_15 = _RAND_98[0:0];
  _RAND_99 = {1{`RANDOM}};
  tag_mismatch_REG_12 = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  ptag_matches_r10 = _RAND_100[29:0];
  _RAND_101 = {1{`RANDOM}};
  ptag_matches_r11 = _RAND_101[29:0];
  _RAND_102 = {1{`RANDOM}};
  tag_mismatch_REG_13 = _RAND_102[0:0];
  _RAND_103 = {1{`RANDOM}};
  tag_mismatch_REG_10 = _RAND_103[0:0];
  _RAND_104 = {1{`RANDOM}};
  ptag_matches_r8 = _RAND_104[29:0];
  _RAND_105 = {1{`RANDOM}};
  ptag_matches_r9 = _RAND_105[29:0];
  _RAND_106 = {1{`RANDOM}};
  tag_mismatch_REG_11 = _RAND_106[0:0];
  _RAND_107 = {1{`RANDOM}};
  valid_tag_match_reg_0 = _RAND_107[0:0];
  _RAND_108 = {1{`RANDOM}};
  valid_tag_match_reg_1 = _RAND_108[0:0];
  _RAND_109 = {1{`RANDOM}};
  valid_tag_match_reg_2 = _RAND_109[0:0];
  _RAND_110 = {1{`RANDOM}};
  valid_tag_match_reg_3 = _RAND_110[0:0];
  _RAND_111 = {1{`RANDOM}};
  inflight_tag_match_reg_0 = _RAND_111[0:0];
  _RAND_112 = {1{`RANDOM}};
  inflight_tag_match_reg_1 = _RAND_112[0:0];
  _RAND_113 = {1{`RANDOM}};
  inflight_tag_match_reg_2 = _RAND_113[0:0];
  _RAND_114 = {1{`RANDOM}};
  inflight_tag_match_reg_3 = _RAND_114[0:0];
  _RAND_115 = {1{`RANDOM}};
  forward_mask_candidate_reg__0_0 = _RAND_115[0:0];
  _RAND_116 = {1{`RANDOM}};
  forward_mask_candidate_reg__0_1 = _RAND_116[0:0];
  _RAND_117 = {1{`RANDOM}};
  forward_mask_candidate_reg__0_2 = _RAND_117[0:0];
  _RAND_118 = {1{`RANDOM}};
  forward_mask_candidate_reg__0_3 = _RAND_118[0:0];
  _RAND_119 = {1{`RANDOM}};
  forward_mask_candidate_reg__0_4 = _RAND_119[0:0];
  _RAND_120 = {1{`RANDOM}};
  forward_mask_candidate_reg__0_5 = _RAND_120[0:0];
  _RAND_121 = {1{`RANDOM}};
  forward_mask_candidate_reg__0_6 = _RAND_121[0:0];
  _RAND_122 = {1{`RANDOM}};
  forward_mask_candidate_reg__0_7 = _RAND_122[0:0];
  _RAND_123 = {1{`RANDOM}};
  forward_mask_candidate_reg__0_8 = _RAND_123[0:0];
  _RAND_124 = {1{`RANDOM}};
  forward_mask_candidate_reg__0_9 = _RAND_124[0:0];
  _RAND_125 = {1{`RANDOM}};
  forward_mask_candidate_reg__0_10 = _RAND_125[0:0];
  _RAND_126 = {1{`RANDOM}};
  forward_mask_candidate_reg__0_11 = _RAND_126[0:0];
  _RAND_127 = {1{`RANDOM}};
  forward_mask_candidate_reg__0_12 = _RAND_127[0:0];
  _RAND_128 = {1{`RANDOM}};
  forward_mask_candidate_reg__0_13 = _RAND_128[0:0];
  _RAND_129 = {1{`RANDOM}};
  forward_mask_candidate_reg__0_14 = _RAND_129[0:0];
  _RAND_130 = {1{`RANDOM}};
  forward_mask_candidate_reg__0_15 = _RAND_130[0:0];
  _RAND_131 = {1{`RANDOM}};
  forward_mask_candidate_reg__1_0 = _RAND_131[0:0];
  _RAND_132 = {1{`RANDOM}};
  forward_mask_candidate_reg__1_1 = _RAND_132[0:0];
  _RAND_133 = {1{`RANDOM}};
  forward_mask_candidate_reg__1_2 = _RAND_133[0:0];
  _RAND_134 = {1{`RANDOM}};
  forward_mask_candidate_reg__1_3 = _RAND_134[0:0];
  _RAND_135 = {1{`RANDOM}};
  forward_mask_candidate_reg__1_4 = _RAND_135[0:0];
  _RAND_136 = {1{`RANDOM}};
  forward_mask_candidate_reg__1_5 = _RAND_136[0:0];
  _RAND_137 = {1{`RANDOM}};
  forward_mask_candidate_reg__1_6 = _RAND_137[0:0];
  _RAND_138 = {1{`RANDOM}};
  forward_mask_candidate_reg__1_7 = _RAND_138[0:0];
  _RAND_139 = {1{`RANDOM}};
  forward_mask_candidate_reg__1_8 = _RAND_139[0:0];
  _RAND_140 = {1{`RANDOM}};
  forward_mask_candidate_reg__1_9 = _RAND_140[0:0];
  _RAND_141 = {1{`RANDOM}};
  forward_mask_candidate_reg__1_10 = _RAND_141[0:0];
  _RAND_142 = {1{`RANDOM}};
  forward_mask_candidate_reg__1_11 = _RAND_142[0:0];
  _RAND_143 = {1{`RANDOM}};
  forward_mask_candidate_reg__1_12 = _RAND_143[0:0];
  _RAND_144 = {1{`RANDOM}};
  forward_mask_candidate_reg__1_13 = _RAND_144[0:0];
  _RAND_145 = {1{`RANDOM}};
  forward_mask_candidate_reg__1_14 = _RAND_145[0:0];
  _RAND_146 = {1{`RANDOM}};
  forward_mask_candidate_reg__1_15 = _RAND_146[0:0];
  _RAND_147 = {1{`RANDOM}};
  forward_mask_candidate_reg__2_0 = _RAND_147[0:0];
  _RAND_148 = {1{`RANDOM}};
  forward_mask_candidate_reg__2_1 = _RAND_148[0:0];
  _RAND_149 = {1{`RANDOM}};
  forward_mask_candidate_reg__2_2 = _RAND_149[0:0];
  _RAND_150 = {1{`RANDOM}};
  forward_mask_candidate_reg__2_3 = _RAND_150[0:0];
  _RAND_151 = {1{`RANDOM}};
  forward_mask_candidate_reg__2_4 = _RAND_151[0:0];
  _RAND_152 = {1{`RANDOM}};
  forward_mask_candidate_reg__2_5 = _RAND_152[0:0];
  _RAND_153 = {1{`RANDOM}};
  forward_mask_candidate_reg__2_6 = _RAND_153[0:0];
  _RAND_154 = {1{`RANDOM}};
  forward_mask_candidate_reg__2_7 = _RAND_154[0:0];
  _RAND_155 = {1{`RANDOM}};
  forward_mask_candidate_reg__2_8 = _RAND_155[0:0];
  _RAND_156 = {1{`RANDOM}};
  forward_mask_candidate_reg__2_9 = _RAND_156[0:0];
  _RAND_157 = {1{`RANDOM}};
  forward_mask_candidate_reg__2_10 = _RAND_157[0:0];
  _RAND_158 = {1{`RANDOM}};
  forward_mask_candidate_reg__2_11 = _RAND_158[0:0];
  _RAND_159 = {1{`RANDOM}};
  forward_mask_candidate_reg__2_12 = _RAND_159[0:0];
  _RAND_160 = {1{`RANDOM}};
  forward_mask_candidate_reg__2_13 = _RAND_160[0:0];
  _RAND_161 = {1{`RANDOM}};
  forward_mask_candidate_reg__2_14 = _RAND_161[0:0];
  _RAND_162 = {1{`RANDOM}};
  forward_mask_candidate_reg__2_15 = _RAND_162[0:0];
  _RAND_163 = {1{`RANDOM}};
  forward_mask_candidate_reg__3_0 = _RAND_163[0:0];
  _RAND_164 = {1{`RANDOM}};
  forward_mask_candidate_reg__3_1 = _RAND_164[0:0];
  _RAND_165 = {1{`RANDOM}};
  forward_mask_candidate_reg__3_2 = _RAND_165[0:0];
  _RAND_166 = {1{`RANDOM}};
  forward_mask_candidate_reg__3_3 = _RAND_166[0:0];
  _RAND_167 = {1{`RANDOM}};
  forward_mask_candidate_reg__3_4 = _RAND_167[0:0];
  _RAND_168 = {1{`RANDOM}};
  forward_mask_candidate_reg__3_5 = _RAND_168[0:0];
  _RAND_169 = {1{`RANDOM}};
  forward_mask_candidate_reg__3_6 = _RAND_169[0:0];
  _RAND_170 = {1{`RANDOM}};
  forward_mask_candidate_reg__3_7 = _RAND_170[0:0];
  _RAND_171 = {1{`RANDOM}};
  forward_mask_candidate_reg__3_8 = _RAND_171[0:0];
  _RAND_172 = {1{`RANDOM}};
  forward_mask_candidate_reg__3_9 = _RAND_172[0:0];
  _RAND_173 = {1{`RANDOM}};
  forward_mask_candidate_reg__3_10 = _RAND_173[0:0];
  _RAND_174 = {1{`RANDOM}};
  forward_mask_candidate_reg__3_11 = _RAND_174[0:0];
  _RAND_175 = {1{`RANDOM}};
  forward_mask_candidate_reg__3_12 = _RAND_175[0:0];
  _RAND_176 = {1{`RANDOM}};
  forward_mask_candidate_reg__3_13 = _RAND_176[0:0];
  _RAND_177 = {1{`RANDOM}};
  forward_mask_candidate_reg__3_14 = _RAND_177[0:0];
  _RAND_178 = {1{`RANDOM}};
  forward_mask_candidate_reg__3_15 = _RAND_178[0:0];
  _RAND_179 = {1{`RANDOM}};
  forward_data_candidate_reg__0_0 = _RAND_179[7:0];
  _RAND_180 = {1{`RANDOM}};
  forward_data_candidate_reg__0_1 = _RAND_180[7:0];
  _RAND_181 = {1{`RANDOM}};
  forward_data_candidate_reg__0_2 = _RAND_181[7:0];
  _RAND_182 = {1{`RANDOM}};
  forward_data_candidate_reg__0_3 = _RAND_182[7:0];
  _RAND_183 = {1{`RANDOM}};
  forward_data_candidate_reg__0_4 = _RAND_183[7:0];
  _RAND_184 = {1{`RANDOM}};
  forward_data_candidate_reg__0_5 = _RAND_184[7:0];
  _RAND_185 = {1{`RANDOM}};
  forward_data_candidate_reg__0_6 = _RAND_185[7:0];
  _RAND_186 = {1{`RANDOM}};
  forward_data_candidate_reg__0_7 = _RAND_186[7:0];
  _RAND_187 = {1{`RANDOM}};
  forward_data_candidate_reg__0_8 = _RAND_187[7:0];
  _RAND_188 = {1{`RANDOM}};
  forward_data_candidate_reg__0_9 = _RAND_188[7:0];
  _RAND_189 = {1{`RANDOM}};
  forward_data_candidate_reg__0_10 = _RAND_189[7:0];
  _RAND_190 = {1{`RANDOM}};
  forward_data_candidate_reg__0_11 = _RAND_190[7:0];
  _RAND_191 = {1{`RANDOM}};
  forward_data_candidate_reg__0_12 = _RAND_191[7:0];
  _RAND_192 = {1{`RANDOM}};
  forward_data_candidate_reg__0_13 = _RAND_192[7:0];
  _RAND_193 = {1{`RANDOM}};
  forward_data_candidate_reg__0_14 = _RAND_193[7:0];
  _RAND_194 = {1{`RANDOM}};
  forward_data_candidate_reg__0_15 = _RAND_194[7:0];
  _RAND_195 = {1{`RANDOM}};
  forward_data_candidate_reg__1_0 = _RAND_195[7:0];
  _RAND_196 = {1{`RANDOM}};
  forward_data_candidate_reg__1_1 = _RAND_196[7:0];
  _RAND_197 = {1{`RANDOM}};
  forward_data_candidate_reg__1_2 = _RAND_197[7:0];
  _RAND_198 = {1{`RANDOM}};
  forward_data_candidate_reg__1_3 = _RAND_198[7:0];
  _RAND_199 = {1{`RANDOM}};
  forward_data_candidate_reg__1_4 = _RAND_199[7:0];
  _RAND_200 = {1{`RANDOM}};
  forward_data_candidate_reg__1_5 = _RAND_200[7:0];
  _RAND_201 = {1{`RANDOM}};
  forward_data_candidate_reg__1_6 = _RAND_201[7:0];
  _RAND_202 = {1{`RANDOM}};
  forward_data_candidate_reg__1_7 = _RAND_202[7:0];
  _RAND_203 = {1{`RANDOM}};
  forward_data_candidate_reg__1_8 = _RAND_203[7:0];
  _RAND_204 = {1{`RANDOM}};
  forward_data_candidate_reg__1_9 = _RAND_204[7:0];
  _RAND_205 = {1{`RANDOM}};
  forward_data_candidate_reg__1_10 = _RAND_205[7:0];
  _RAND_206 = {1{`RANDOM}};
  forward_data_candidate_reg__1_11 = _RAND_206[7:0];
  _RAND_207 = {1{`RANDOM}};
  forward_data_candidate_reg__1_12 = _RAND_207[7:0];
  _RAND_208 = {1{`RANDOM}};
  forward_data_candidate_reg__1_13 = _RAND_208[7:0];
  _RAND_209 = {1{`RANDOM}};
  forward_data_candidate_reg__1_14 = _RAND_209[7:0];
  _RAND_210 = {1{`RANDOM}};
  forward_data_candidate_reg__1_15 = _RAND_210[7:0];
  _RAND_211 = {1{`RANDOM}};
  forward_data_candidate_reg__2_0 = _RAND_211[7:0];
  _RAND_212 = {1{`RANDOM}};
  forward_data_candidate_reg__2_1 = _RAND_212[7:0];
  _RAND_213 = {1{`RANDOM}};
  forward_data_candidate_reg__2_2 = _RAND_213[7:0];
  _RAND_214 = {1{`RANDOM}};
  forward_data_candidate_reg__2_3 = _RAND_214[7:0];
  _RAND_215 = {1{`RANDOM}};
  forward_data_candidate_reg__2_4 = _RAND_215[7:0];
  _RAND_216 = {1{`RANDOM}};
  forward_data_candidate_reg__2_5 = _RAND_216[7:0];
  _RAND_217 = {1{`RANDOM}};
  forward_data_candidate_reg__2_6 = _RAND_217[7:0];
  _RAND_218 = {1{`RANDOM}};
  forward_data_candidate_reg__2_7 = _RAND_218[7:0];
  _RAND_219 = {1{`RANDOM}};
  forward_data_candidate_reg__2_8 = _RAND_219[7:0];
  _RAND_220 = {1{`RANDOM}};
  forward_data_candidate_reg__2_9 = _RAND_220[7:0];
  _RAND_221 = {1{`RANDOM}};
  forward_data_candidate_reg__2_10 = _RAND_221[7:0];
  _RAND_222 = {1{`RANDOM}};
  forward_data_candidate_reg__2_11 = _RAND_222[7:0];
  _RAND_223 = {1{`RANDOM}};
  forward_data_candidate_reg__2_12 = _RAND_223[7:0];
  _RAND_224 = {1{`RANDOM}};
  forward_data_candidate_reg__2_13 = _RAND_224[7:0];
  _RAND_225 = {1{`RANDOM}};
  forward_data_candidate_reg__2_14 = _RAND_225[7:0];
  _RAND_226 = {1{`RANDOM}};
  forward_data_candidate_reg__2_15 = _RAND_226[7:0];
  _RAND_227 = {1{`RANDOM}};
  forward_data_candidate_reg__3_0 = _RAND_227[7:0];
  _RAND_228 = {1{`RANDOM}};
  forward_data_candidate_reg__3_1 = _RAND_228[7:0];
  _RAND_229 = {1{`RANDOM}};
  forward_data_candidate_reg__3_2 = _RAND_229[7:0];
  _RAND_230 = {1{`RANDOM}};
  forward_data_candidate_reg__3_3 = _RAND_230[7:0];
  _RAND_231 = {1{`RANDOM}};
  forward_data_candidate_reg__3_4 = _RAND_231[7:0];
  _RAND_232 = {1{`RANDOM}};
  forward_data_candidate_reg__3_5 = _RAND_232[7:0];
  _RAND_233 = {1{`RANDOM}};
  forward_data_candidate_reg__3_6 = _RAND_233[7:0];
  _RAND_234 = {1{`RANDOM}};
  forward_data_candidate_reg__3_7 = _RAND_234[7:0];
  _RAND_235 = {1{`RANDOM}};
  forward_data_candidate_reg__3_8 = _RAND_235[7:0];
  _RAND_236 = {1{`RANDOM}};
  forward_data_candidate_reg__3_9 = _RAND_236[7:0];
  _RAND_237 = {1{`RANDOM}};
  forward_data_candidate_reg__3_10 = _RAND_237[7:0];
  _RAND_238 = {1{`RANDOM}};
  forward_data_candidate_reg__3_11 = _RAND_238[7:0];
  _RAND_239 = {1{`RANDOM}};
  forward_data_candidate_reg__3_12 = _RAND_239[7:0];
  _RAND_240 = {1{`RANDOM}};
  forward_data_candidate_reg__3_13 = _RAND_240[7:0];
  _RAND_241 = {1{`RANDOM}};
  forward_data_candidate_reg__3_14 = _RAND_241[7:0];
  _RAND_242 = {1{`RANDOM}};
  forward_data_candidate_reg__3_15 = _RAND_242[7:0];
  _RAND_243 = {1{`RANDOM}};
  valid_tag_match_reg_0_1 = _RAND_243[0:0];
  _RAND_244 = {1{`RANDOM}};
  valid_tag_match_reg_1_1 = _RAND_244[0:0];
  _RAND_245 = {1{`RANDOM}};
  valid_tag_match_reg_2_1 = _RAND_245[0:0];
  _RAND_246 = {1{`RANDOM}};
  valid_tag_match_reg_3_1 = _RAND_246[0:0];
  _RAND_247 = {1{`RANDOM}};
  inflight_tag_match_reg_0_1 = _RAND_247[0:0];
  _RAND_248 = {1{`RANDOM}};
  inflight_tag_match_reg_1_1 = _RAND_248[0:0];
  _RAND_249 = {1{`RANDOM}};
  inflight_tag_match_reg_2_1 = _RAND_249[0:0];
  _RAND_250 = {1{`RANDOM}};
  inflight_tag_match_reg_3_1 = _RAND_250[0:0];
  _RAND_251 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_0_0 = _RAND_251[0:0];
  _RAND_252 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_0_1 = _RAND_252[0:0];
  _RAND_253 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_0_2 = _RAND_253[0:0];
  _RAND_254 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_0_3 = _RAND_254[0:0];
  _RAND_255 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_0_4 = _RAND_255[0:0];
  _RAND_256 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_0_5 = _RAND_256[0:0];
  _RAND_257 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_0_6 = _RAND_257[0:0];
  _RAND_258 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_0_7 = _RAND_258[0:0];
  _RAND_259 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_0_8 = _RAND_259[0:0];
  _RAND_260 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_0_9 = _RAND_260[0:0];
  _RAND_261 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_0_10 = _RAND_261[0:0];
  _RAND_262 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_0_11 = _RAND_262[0:0];
  _RAND_263 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_0_12 = _RAND_263[0:0];
  _RAND_264 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_0_13 = _RAND_264[0:0];
  _RAND_265 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_0_14 = _RAND_265[0:0];
  _RAND_266 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_0_15 = _RAND_266[0:0];
  _RAND_267 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_1_0 = _RAND_267[0:0];
  _RAND_268 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_1_1 = _RAND_268[0:0];
  _RAND_269 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_1_2 = _RAND_269[0:0];
  _RAND_270 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_1_3 = _RAND_270[0:0];
  _RAND_271 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_1_4 = _RAND_271[0:0];
  _RAND_272 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_1_5 = _RAND_272[0:0];
  _RAND_273 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_1_6 = _RAND_273[0:0];
  _RAND_274 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_1_7 = _RAND_274[0:0];
  _RAND_275 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_1_8 = _RAND_275[0:0];
  _RAND_276 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_1_9 = _RAND_276[0:0];
  _RAND_277 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_1_10 = _RAND_277[0:0];
  _RAND_278 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_1_11 = _RAND_278[0:0];
  _RAND_279 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_1_12 = _RAND_279[0:0];
  _RAND_280 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_1_13 = _RAND_280[0:0];
  _RAND_281 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_1_14 = _RAND_281[0:0];
  _RAND_282 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_1_15 = _RAND_282[0:0];
  _RAND_283 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_2_0 = _RAND_283[0:0];
  _RAND_284 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_2_1 = _RAND_284[0:0];
  _RAND_285 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_2_2 = _RAND_285[0:0];
  _RAND_286 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_2_3 = _RAND_286[0:0];
  _RAND_287 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_2_4 = _RAND_287[0:0];
  _RAND_288 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_2_5 = _RAND_288[0:0];
  _RAND_289 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_2_6 = _RAND_289[0:0];
  _RAND_290 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_2_7 = _RAND_290[0:0];
  _RAND_291 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_2_8 = _RAND_291[0:0];
  _RAND_292 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_2_9 = _RAND_292[0:0];
  _RAND_293 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_2_10 = _RAND_293[0:0];
  _RAND_294 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_2_11 = _RAND_294[0:0];
  _RAND_295 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_2_12 = _RAND_295[0:0];
  _RAND_296 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_2_13 = _RAND_296[0:0];
  _RAND_297 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_2_14 = _RAND_297[0:0];
  _RAND_298 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_2_15 = _RAND_298[0:0];
  _RAND_299 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_3_0 = _RAND_299[0:0];
  _RAND_300 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_3_1 = _RAND_300[0:0];
  _RAND_301 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_3_2 = _RAND_301[0:0];
  _RAND_302 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_3_3 = _RAND_302[0:0];
  _RAND_303 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_3_4 = _RAND_303[0:0];
  _RAND_304 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_3_5 = _RAND_304[0:0];
  _RAND_305 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_3_6 = _RAND_305[0:0];
  _RAND_306 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_3_7 = _RAND_306[0:0];
  _RAND_307 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_3_8 = _RAND_307[0:0];
  _RAND_308 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_3_9 = _RAND_308[0:0];
  _RAND_309 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_3_10 = _RAND_309[0:0];
  _RAND_310 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_3_11 = _RAND_310[0:0];
  _RAND_311 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_3_12 = _RAND_311[0:0];
  _RAND_312 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_3_13 = _RAND_312[0:0];
  _RAND_313 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_3_14 = _RAND_313[0:0];
  _RAND_314 = {1{`RANDOM}};
  forward_mask_candidate_reg_1_3_15 = _RAND_314[0:0];
  _RAND_315 = {1{`RANDOM}};
  forward_data_candidate_reg_1_0_0 = _RAND_315[7:0];
  _RAND_316 = {1{`RANDOM}};
  forward_data_candidate_reg_1_0_1 = _RAND_316[7:0];
  _RAND_317 = {1{`RANDOM}};
  forward_data_candidate_reg_1_0_2 = _RAND_317[7:0];
  _RAND_318 = {1{`RANDOM}};
  forward_data_candidate_reg_1_0_3 = _RAND_318[7:0];
  _RAND_319 = {1{`RANDOM}};
  forward_data_candidate_reg_1_0_4 = _RAND_319[7:0];
  _RAND_320 = {1{`RANDOM}};
  forward_data_candidate_reg_1_0_5 = _RAND_320[7:0];
  _RAND_321 = {1{`RANDOM}};
  forward_data_candidate_reg_1_0_6 = _RAND_321[7:0];
  _RAND_322 = {1{`RANDOM}};
  forward_data_candidate_reg_1_0_7 = _RAND_322[7:0];
  _RAND_323 = {1{`RANDOM}};
  forward_data_candidate_reg_1_0_8 = _RAND_323[7:0];
  _RAND_324 = {1{`RANDOM}};
  forward_data_candidate_reg_1_0_9 = _RAND_324[7:0];
  _RAND_325 = {1{`RANDOM}};
  forward_data_candidate_reg_1_0_10 = _RAND_325[7:0];
  _RAND_326 = {1{`RANDOM}};
  forward_data_candidate_reg_1_0_11 = _RAND_326[7:0];
  _RAND_327 = {1{`RANDOM}};
  forward_data_candidate_reg_1_0_12 = _RAND_327[7:0];
  _RAND_328 = {1{`RANDOM}};
  forward_data_candidate_reg_1_0_13 = _RAND_328[7:0];
  _RAND_329 = {1{`RANDOM}};
  forward_data_candidate_reg_1_0_14 = _RAND_329[7:0];
  _RAND_330 = {1{`RANDOM}};
  forward_data_candidate_reg_1_0_15 = _RAND_330[7:0];
  _RAND_331 = {1{`RANDOM}};
  forward_data_candidate_reg_1_1_0 = _RAND_331[7:0];
  _RAND_332 = {1{`RANDOM}};
  forward_data_candidate_reg_1_1_1 = _RAND_332[7:0];
  _RAND_333 = {1{`RANDOM}};
  forward_data_candidate_reg_1_1_2 = _RAND_333[7:0];
  _RAND_334 = {1{`RANDOM}};
  forward_data_candidate_reg_1_1_3 = _RAND_334[7:0];
  _RAND_335 = {1{`RANDOM}};
  forward_data_candidate_reg_1_1_4 = _RAND_335[7:0];
  _RAND_336 = {1{`RANDOM}};
  forward_data_candidate_reg_1_1_5 = _RAND_336[7:0];
  _RAND_337 = {1{`RANDOM}};
  forward_data_candidate_reg_1_1_6 = _RAND_337[7:0];
  _RAND_338 = {1{`RANDOM}};
  forward_data_candidate_reg_1_1_7 = _RAND_338[7:0];
  _RAND_339 = {1{`RANDOM}};
  forward_data_candidate_reg_1_1_8 = _RAND_339[7:0];
  _RAND_340 = {1{`RANDOM}};
  forward_data_candidate_reg_1_1_9 = _RAND_340[7:0];
  _RAND_341 = {1{`RANDOM}};
  forward_data_candidate_reg_1_1_10 = _RAND_341[7:0];
  _RAND_342 = {1{`RANDOM}};
  forward_data_candidate_reg_1_1_11 = _RAND_342[7:0];
  _RAND_343 = {1{`RANDOM}};
  forward_data_candidate_reg_1_1_12 = _RAND_343[7:0];
  _RAND_344 = {1{`RANDOM}};
  forward_data_candidate_reg_1_1_13 = _RAND_344[7:0];
  _RAND_345 = {1{`RANDOM}};
  forward_data_candidate_reg_1_1_14 = _RAND_345[7:0];
  _RAND_346 = {1{`RANDOM}};
  forward_data_candidate_reg_1_1_15 = _RAND_346[7:0];
  _RAND_347 = {1{`RANDOM}};
  forward_data_candidate_reg_1_2_0 = _RAND_347[7:0];
  _RAND_348 = {1{`RANDOM}};
  forward_data_candidate_reg_1_2_1 = _RAND_348[7:0];
  _RAND_349 = {1{`RANDOM}};
  forward_data_candidate_reg_1_2_2 = _RAND_349[7:0];
  _RAND_350 = {1{`RANDOM}};
  forward_data_candidate_reg_1_2_3 = _RAND_350[7:0];
  _RAND_351 = {1{`RANDOM}};
  forward_data_candidate_reg_1_2_4 = _RAND_351[7:0];
  _RAND_352 = {1{`RANDOM}};
  forward_data_candidate_reg_1_2_5 = _RAND_352[7:0];
  _RAND_353 = {1{`RANDOM}};
  forward_data_candidate_reg_1_2_6 = _RAND_353[7:0];
  _RAND_354 = {1{`RANDOM}};
  forward_data_candidate_reg_1_2_7 = _RAND_354[7:0];
  _RAND_355 = {1{`RANDOM}};
  forward_data_candidate_reg_1_2_8 = _RAND_355[7:0];
  _RAND_356 = {1{`RANDOM}};
  forward_data_candidate_reg_1_2_9 = _RAND_356[7:0];
  _RAND_357 = {1{`RANDOM}};
  forward_data_candidate_reg_1_2_10 = _RAND_357[7:0];
  _RAND_358 = {1{`RANDOM}};
  forward_data_candidate_reg_1_2_11 = _RAND_358[7:0];
  _RAND_359 = {1{`RANDOM}};
  forward_data_candidate_reg_1_2_12 = _RAND_359[7:0];
  _RAND_360 = {1{`RANDOM}};
  forward_data_candidate_reg_1_2_13 = _RAND_360[7:0];
  _RAND_361 = {1{`RANDOM}};
  forward_data_candidate_reg_1_2_14 = _RAND_361[7:0];
  _RAND_362 = {1{`RANDOM}};
  forward_data_candidate_reg_1_2_15 = _RAND_362[7:0];
  _RAND_363 = {1{`RANDOM}};
  forward_data_candidate_reg_1_3_0 = _RAND_363[7:0];
  _RAND_364 = {1{`RANDOM}};
  forward_data_candidate_reg_1_3_1 = _RAND_364[7:0];
  _RAND_365 = {1{`RANDOM}};
  forward_data_candidate_reg_1_3_2 = _RAND_365[7:0];
  _RAND_366 = {1{`RANDOM}};
  forward_data_candidate_reg_1_3_3 = _RAND_366[7:0];
  _RAND_367 = {1{`RANDOM}};
  forward_data_candidate_reg_1_3_4 = _RAND_367[7:0];
  _RAND_368 = {1{`RANDOM}};
  forward_data_candidate_reg_1_3_5 = _RAND_368[7:0];
  _RAND_369 = {1{`RANDOM}};
  forward_data_candidate_reg_1_3_6 = _RAND_369[7:0];
  _RAND_370 = {1{`RANDOM}};
  forward_data_candidate_reg_1_3_7 = _RAND_370[7:0];
  _RAND_371 = {1{`RANDOM}};
  forward_data_candidate_reg_1_3_8 = _RAND_371[7:0];
  _RAND_372 = {1{`RANDOM}};
  forward_data_candidate_reg_1_3_9 = _RAND_372[7:0];
  _RAND_373 = {1{`RANDOM}};
  forward_data_candidate_reg_1_3_10 = _RAND_373[7:0];
  _RAND_374 = {1{`RANDOM}};
  forward_data_candidate_reg_1_3_11 = _RAND_374[7:0];
  _RAND_375 = {1{`RANDOM}};
  forward_data_candidate_reg_1_3_12 = _RAND_375[7:0];
  _RAND_376 = {1{`RANDOM}};
  forward_data_candidate_reg_1_3_13 = _RAND_376[7:0];
  _RAND_377 = {1{`RANDOM}};
  forward_data_candidate_reg_1_3_14 = _RAND_377[7:0];
  _RAND_378 = {1{`RANDOM}};
  forward_data_candidate_reg_1_3_15 = _RAND_378[7:0];
  _RAND_379 = {1{`RANDOM}};
  perf_valid_entry_count = _RAND_379[2:0];
  _RAND_380 = {1{`RANDOM}};
  io_perf_0_value_REG = _RAND_380[1:0];
  _RAND_381 = {1{`RANDOM}};
  io_perf_0_value_REG_1 = _RAND_381[1:0];
  _RAND_382 = {1{`RANDOM}};
  io_perf_1_value_REG = _RAND_382[1:0];
  _RAND_383 = {1{`RANDOM}};
  io_perf_1_value_REG_1 = _RAND_383[1:0];
  _RAND_384 = {1{`RANDOM}};
  io_perf_2_value_REG = _RAND_384[1:0];
  _RAND_385 = {1{`RANDOM}};
  io_perf_2_value_REG_1 = _RAND_385[1:0];
  _RAND_386 = {1{`RANDOM}};
  io_perf_3_value_REG = _RAND_386[1:0];
  _RAND_387 = {1{`RANDOM}};
  io_perf_3_value_REG_1 = _RAND_387[1:0];
  _RAND_388 = {1{`RANDOM}};
  io_perf_4_value_REG = _RAND_388[0:0];
  _RAND_389 = {1{`RANDOM}};
  io_perf_4_value_REG_1 = _RAND_389[0:0];
  _RAND_390 = {1{`RANDOM}};
  io_perf_5_value_REG = _RAND_390[0:0];
  _RAND_391 = {1{`RANDOM}};
  io_perf_5_value_REG_1 = _RAND_391[0:0];
  _RAND_392 = {1{`RANDOM}};
  io_perf_6_value_REG = _RAND_392[0:0];
  _RAND_393 = {1{`RANDOM}};
  io_perf_6_value_REG_1 = _RAND_393[0:0];
  _RAND_394 = {1{`RANDOM}};
  io_perf_7_value_REG = _RAND_394[0:0];
  _RAND_395 = {1{`RANDOM}};
  io_perf_7_value_REG_1 = _RAND_395[0:0];
  _RAND_396 = {1{`RANDOM}};
  io_perf_8_value_REG = _RAND_396[0:0];
  _RAND_397 = {1{`RANDOM}};
  io_perf_8_value_REG_1 = _RAND_397[0:0];
  _RAND_398 = {1{`RANDOM}};
  io_perf_9_value_REG = _RAND_398[0:0];
  _RAND_399 = {1{`RANDOM}};
  io_perf_9_value_REG_1 = _RAND_399[0:0];
  _RAND_400 = {1{`RANDOM}};
  io_perf_10_value_REG = _RAND_400[0:0];
  _RAND_401 = {1{`RANDOM}};
  io_perf_10_value_REG_1 = _RAND_401[0:0];
  _RAND_402 = {1{`RANDOM}};
  io_perf_11_value_REG = _RAND_402[0:0];
  _RAND_403 = {1{`RANDOM}};
  io_perf_11_value_REG_1 = _RAND_403[0:0];
  _RAND_404 = {1{`RANDOM}};
  io_perf_12_value_REG = _RAND_404[0:0];
  _RAND_405 = {1{`RANDOM}};
  io_perf_12_value_REG_1 = _RAND_405[0:0];
  _RAND_406 = {1{`RANDOM}};
  io_perf_13_value_REG = _RAND_406[0:0];
  _RAND_407 = {1{`RANDOM}};
  io_perf_13_value_REG_1 = _RAND_407[0:0];
  _RAND_408 = {1{`RANDOM}};
  io_perf_14_value_REG = _RAND_408[0:0];
  _RAND_409 = {1{`RANDOM}};
  io_perf_14_value_REG_1 = _RAND_409[0:0];
  _RAND_410 = {1{`RANDOM}};
  io_perf_15_value_REG = _RAND_410[0:0];
  _RAND_411 = {1{`RANDOM}};
  io_perf_15_value_REG_1 = _RAND_411[0:0];
  _RAND_412 = {1{`RANDOM}};
  io_perf_16_value_REG = _RAND_412[0:0];
  _RAND_413 = {1{`RANDOM}};
  io_perf_16_value_REG_1 = _RAND_413[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    stateVec_0_state_valid = 1'h0;
  end
  if (reset) begin
    stateVec_0_state_inflight = 1'h0;
  end
  if (reset) begin
    stateVec_0_wtimeout = 1'h0;
  end
  if (reset) begin
    stateVec_0_wsameblock_inflight = 1'h0;
  end
  if (reset) begin
    stateVec_1_state_valid = 1'h0;
  end
  if (reset) begin
    stateVec_1_state_inflight = 1'h0;
  end
  if (reset) begin
    stateVec_1_wtimeout = 1'h0;
  end
  if (reset) begin
    stateVec_1_wsameblock_inflight = 1'h0;
  end
  if (reset) begin
    stateVec_2_state_valid = 1'h0;
  end
  if (reset) begin
    stateVec_2_state_inflight = 1'h0;
  end
  if (reset) begin
    stateVec_2_wtimeout = 1'h0;
  end
  if (reset) begin
    stateVec_2_wsameblock_inflight = 1'h0;
  end
  if (reset) begin
    stateVec_3_state_valid = 1'h0;
  end
  if (reset) begin
    stateVec_3_state_inflight = 1'h0;
  end
  if (reset) begin
    stateVec_3_wtimeout = 1'h0;
  end
  if (reset) begin
    stateVec_3_wsameblock_inflight = 1'h0;
  end
  if (reset) begin
    cohCount_0 = 21'h0;
  end
  if (reset) begin
    cohCount_1 = 21'h0;
  end
  if (reset) begin
    cohCount_2 = 21'h0;
  end
  if (reset) begin
    cohCount_3 = 21'h0;
  end
  if (reset) begin
    missqReplayCount_0 = 5'h0;
  end
  if (reset) begin
    missqReplayCount_1 = 5'h0;
  end
  if (reset) begin
    missqReplayCount_2 = 5'h0;
  end
  if (reset) begin
    missqReplayCount_3 = 5'h0;
  end
  if (reset) begin
    sbuffer_state = 2'h0;
  end
  if (reset) begin
    state_reg = 3'h0;
  end
  if (reset) begin
    do_eviction = 1'h0;
  end
  if (reset) begin
    sbuffer_out_s1_valid = 1'h0;
  end
  if (reset) begin
    enbufferSelReg = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

