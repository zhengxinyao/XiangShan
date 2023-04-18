module BankedDataArray(
  input         clock,
  input         reset,
  output        io_read_0_ready,
  input         io_read_0_valid,
  input  [7:0]  io_read_0_bits_way_en,
  input  [35:0] io_read_0_bits_addr,
  input  [7:0]  io_read_0_bits_bankMask,
  output        io_read_1_ready,
  input         io_read_1_valid,
  input  [7:0]  io_read_1_bits_way_en,
  input  [35:0] io_read_1_bits_addr,
  input  [7:0]  io_read_1_bits_bankMask,
  output        io_readline_ready,
  input         io_readline_valid,
  input  [7:0]  io_readline_bits_way_en,
  input  [35:0] io_readline_bits_addr,
  input         io_write_valid,
  input  [7:0]  io_write_bits_wmask,
  input  [63:0] io_write_bits_data_0,
  input  [63:0] io_write_bits_data_1,
  input  [63:0] io_write_bits_data_2,
  input  [63:0] io_write_bits_data_3,
  input  [63:0] io_write_bits_data_4,
  input  [63:0] io_write_bits_data_5,
  input  [63:0] io_write_bits_data_6,
  input  [63:0] io_write_bits_data_7,
  input         io_write_dup_0_valid,
  input  [7:0]  io_write_dup_0_bits_way_en,
  input  [35:0] io_write_dup_0_bits_addr,
  input         io_write_dup_1_valid,
  input  [7:0]  io_write_dup_1_bits_way_en,
  input  [35:0] io_write_dup_1_bits_addr,
  input         io_write_dup_2_valid,
  input  [7:0]  io_write_dup_2_bits_way_en,
  input  [35:0] io_write_dup_2_bits_addr,
  input         io_write_dup_3_valid,
  input  [7:0]  io_write_dup_3_bits_way_en,
  input  [35:0] io_write_dup_3_bits_addr,
  input         io_write_dup_4_valid,
  input  [7:0]  io_write_dup_4_bits_way_en,
  input  [35:0] io_write_dup_4_bits_addr,
  input         io_write_dup_5_valid,
  input  [7:0]  io_write_dup_5_bits_way_en,
  input  [35:0] io_write_dup_5_bits_addr,
  input         io_write_dup_6_valid,
  input  [7:0]  io_write_dup_6_bits_way_en,
  input  [35:0] io_write_dup_6_bits_addr,
  input         io_write_dup_7_valid,
  input  [7:0]  io_write_dup_7_bits_way_en,
  input  [35:0] io_write_dup_7_bits_addr,
  output [63:0] io_readline_resp_0_raw_data,
  output        io_readline_resp_0_error_delayed,
  output [63:0] io_readline_resp_1_raw_data,
  output        io_readline_resp_1_error_delayed,
  output [63:0] io_readline_resp_2_raw_data,
  output        io_readline_resp_2_error_delayed,
  output [63:0] io_readline_resp_3_raw_data,
  output        io_readline_resp_3_error_delayed,
  output [63:0] io_readline_resp_4_raw_data,
  output        io_readline_resp_4_error_delayed,
  output [63:0] io_readline_resp_5_raw_data,
  output        io_readline_resp_5_error_delayed,
  output [63:0] io_readline_resp_6_raw_data,
  output        io_readline_resp_6_error_delayed,
  output [63:0] io_readline_resp_7_raw_data,
  output        io_readline_resp_7_error_delayed,
  output        io_readline_error_delayed,
  output [63:0] io_read_resp_delayed_0_0_raw_data,
  output [63:0] io_read_resp_delayed_1_0_raw_data,
  output        io_read_error_delayed_0_0,
  output        io_read_error_delayed_1_0,
  output        io_bank_conflict_slow_0,
  output        io_bank_conflict_slow_1,
  output        io_bank_conflict_fast_0,
  output        io_bank_conflict_fast_1,
  input         io_cacheOp_req_valid,
  input  [63:0] io_cacheOp_req_bits_wayNum,
  input  [63:0] io_cacheOp_req_bits_index,
  input  [63:0] io_cacheOp_req_bits_opCode,
  input  [63:0] io_cacheOp_req_bits_write_data_vec_0,
  input  [63:0] io_cacheOp_req_bits_write_data_vec_1,
  input  [63:0] io_cacheOp_req_bits_write_data_vec_2,
  input  [63:0] io_cacheOp_req_bits_write_data_vec_3,
  input  [63:0] io_cacheOp_req_bits_write_data_vec_4,
  input  [63:0] io_cacheOp_req_bits_write_data_vec_5,
  input  [63:0] io_cacheOp_req_bits_write_data_vec_6,
  input  [63:0] io_cacheOp_req_bits_write_data_vec_7,
  input  [63:0] io_cacheOp_req_bits_write_data_ecc,
  input  [63:0] io_cacheOp_req_bits_bank_num,
  output        io_cacheOp_resp_valid,
  output [63:0] io_cacheOp_resp_bits_read_data_vec_0,
  output [63:0] io_cacheOp_resp_bits_read_data_vec_1,
  output [63:0] io_cacheOp_resp_bits_read_data_vec_2,
  output [63:0] io_cacheOp_resp_bits_read_data_vec_3,
  output [63:0] io_cacheOp_resp_bits_read_data_vec_4,
  output [63:0] io_cacheOp_resp_bits_read_data_vec_5,
  output [63:0] io_cacheOp_resp_bits_read_data_vec_6,
  output [63:0] io_cacheOp_resp_bits_read_data_vec_7,
  output [63:0] io_cacheOp_resp_bits_read_data_ecc,
  input         io_cacheOp_req_dup_0_valid,
  input         io_cacheOp_req_dup_1_valid,
  input         io_cacheOp_req_dup_2_valid,
  input         io_cacheOp_req_dup_3_valid,
  input         io_cacheOp_req_dup_4_valid,
  input         io_cacheOp_req_dup_5_valid,
  input         io_cacheOp_req_dup_6_valid,
  input         io_cacheOp_req_dup_7_valid,
  input         io_cacheOp_req_dup_8_valid,
  input         io_cacheOp_req_dup_9_valid,
  input         io_cacheOp_req_dup_10_valid,
  input  [63:0] io_cacheOp_req_bits_opCode_dup_0,
  input  [63:0] io_cacheOp_req_bits_opCode_dup_1,
  input  [63:0] io_cacheOp_req_bits_opCode_dup_2,
  input  [63:0] io_cacheOp_req_bits_opCode_dup_3,
  input  [63:0] io_cacheOp_req_bits_opCode_dup_4,
  input  [63:0] io_cacheOp_req_bits_opCode_dup_5,
  input  [63:0] io_cacheOp_req_bits_opCode_dup_6,
  input  [63:0] io_cacheOp_req_bits_opCode_dup_7,
  input  [63:0] io_cacheOp_req_bits_opCode_dup_8,
  input  [63:0] io_cacheOp_req_bits_opCode_dup_9,
  input  [63:0] io_cacheOp_req_bits_opCode_dup_10
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [95:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [95:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [95:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [95:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [95:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [95:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [95:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [95:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [95:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [95:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [95:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [95:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [95:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [95:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [95:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [95:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [95:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [95:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [95:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [95:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [95:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [95:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [95:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [95:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [95:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [95:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [95:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [95:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [95:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [95:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [95:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [95:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [95:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [95:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [95:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [95:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [95:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [95:0] _RAND_78;
  reg [31:0] _RAND_79;
  reg [95:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [95:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [95:0] _RAND_84;
  reg [31:0] _RAND_85;
  reg [95:0] _RAND_86;
  reg [31:0] _RAND_87;
  reg [95:0] _RAND_88;
  reg [31:0] _RAND_89;
  reg [95:0] _RAND_90;
  reg [31:0] _RAND_91;
  reg [95:0] _RAND_92;
  reg [31:0] _RAND_93;
  reg [95:0] _RAND_94;
  reg [31:0] _RAND_95;
  reg [95:0] _RAND_96;
  reg [31:0] _RAND_97;
  reg [95:0] _RAND_98;
  reg [31:0] _RAND_99;
  reg [95:0] _RAND_100;
  reg [31:0] _RAND_101;
  reg [95:0] _RAND_102;
  reg [31:0] _RAND_103;
  reg [95:0] _RAND_104;
  reg [31:0] _RAND_105;
  reg [95:0] _RAND_106;
  reg [31:0] _RAND_107;
  reg [95:0] _RAND_108;
  reg [31:0] _RAND_109;
  reg [95:0] _RAND_110;
  reg [31:0] _RAND_111;
  reg [95:0] _RAND_112;
  reg [31:0] _RAND_113;
  reg [95:0] _RAND_114;
  reg [31:0] _RAND_115;
  reg [95:0] _RAND_116;
  reg [31:0] _RAND_117;
  reg [95:0] _RAND_118;
  reg [31:0] _RAND_119;
  reg [95:0] _RAND_120;
  reg [31:0] _RAND_121;
  reg [95:0] _RAND_122;
  reg [31:0] _RAND_123;
  reg [95:0] _RAND_124;
  reg [31:0] _RAND_125;
  reg [95:0] _RAND_126;
  reg [31:0] _RAND_127;
  reg [95:0] _RAND_128;
  reg [31:0] _RAND_129;
  reg [95:0] _RAND_130;
  reg [63:0] _RAND_131;
  reg [63:0] _RAND_132;
  reg [63:0] _RAND_133;
  reg [63:0] _RAND_134;
  reg [63:0] _RAND_135;
  reg [63:0] _RAND_136;
  reg [63:0] _RAND_137;
  reg [63:0] _RAND_138;
  reg [63:0] _RAND_139;
  reg [63:0] _RAND_140;
  reg [63:0] _RAND_141;
  reg [63:0] _RAND_142;
  reg [63:0] _RAND_143;
  reg [63:0] _RAND_144;
  reg [63:0] _RAND_145;
  reg [63:0] _RAND_146;
  reg [63:0] _RAND_147;
  reg [63:0] _RAND_148;
  reg [63:0] _RAND_149;
  reg [63:0] _RAND_150;
  reg [63:0] _RAND_151;
  reg [63:0] _RAND_152;
  reg [63:0] _RAND_153;
  reg [63:0] _RAND_154;
  reg [63:0] _RAND_155;
  reg [63:0] _RAND_156;
  reg [63:0] _RAND_157;
  reg [63:0] _RAND_158;
  reg [63:0] _RAND_159;
  reg [63:0] _RAND_160;
  reg [63:0] _RAND_161;
  reg [63:0] _RAND_162;
  reg [63:0] _RAND_163;
  reg [63:0] _RAND_164;
  reg [63:0] _RAND_165;
  reg [63:0] _RAND_166;
  reg [63:0] _RAND_167;
  reg [63:0] _RAND_168;
  reg [63:0] _RAND_169;
  reg [63:0] _RAND_170;
  reg [63:0] _RAND_171;
  reg [63:0] _RAND_172;
  reg [63:0] _RAND_173;
  reg [63:0] _RAND_174;
  reg [63:0] _RAND_175;
  reg [63:0] _RAND_176;
  reg [63:0] _RAND_177;
  reg [63:0] _RAND_178;
  reg [63:0] _RAND_179;
  reg [63:0] _RAND_180;
  reg [63:0] _RAND_181;
  reg [63:0] _RAND_182;
  reg [63:0] _RAND_183;
  reg [63:0] _RAND_184;
  reg [63:0] _RAND_185;
  reg [63:0] _RAND_186;
  reg [63:0] _RAND_187;
  reg [63:0] _RAND_188;
  reg [63:0] _RAND_189;
  reg [63:0] _RAND_190;
  reg [63:0] _RAND_191;
  reg [63:0] _RAND_192;
  reg [63:0] _RAND_193;
  reg [63:0] _RAND_194;
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
  reg [63:0] _RAND_436;
  reg [63:0] _RAND_437;
`endif // RANDOMIZE_REG_INIT
  wire  data_banks_0_0_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_0_0_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_0_0_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_0_0_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_0_0_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_0_0_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_0_0_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_0_1_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_0_1_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_0_1_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_0_1_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_0_1_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_0_1_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_0_1_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_0_2_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_0_2_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_0_2_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_0_2_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_0_2_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_0_2_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_0_2_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_0_3_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_0_3_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_0_3_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_0_3_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_0_3_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_0_3_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_0_3_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_0_4_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_0_4_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_0_4_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_0_4_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_0_4_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_0_4_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_0_4_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_0_5_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_0_5_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_0_5_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_0_5_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_0_5_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_0_5_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_0_5_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_0_6_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_0_6_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_0_6_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_0_6_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_0_6_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_0_6_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_0_6_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_0_7_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_0_7_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_0_7_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_0_7_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_0_7_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_0_7_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_0_7_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_1_0_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_1_0_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_1_0_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_1_0_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_1_0_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_1_0_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_1_0_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_1_1_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_1_1_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_1_1_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_1_1_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_1_1_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_1_1_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_1_1_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_1_2_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_1_2_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_1_2_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_1_2_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_1_2_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_1_2_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_1_2_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_1_3_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_1_3_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_1_3_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_1_3_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_1_3_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_1_3_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_1_3_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_1_4_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_1_4_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_1_4_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_1_4_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_1_4_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_1_4_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_1_4_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_1_5_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_1_5_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_1_5_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_1_5_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_1_5_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_1_5_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_1_5_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_1_6_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_1_6_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_1_6_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_1_6_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_1_6_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_1_6_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_1_6_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_1_7_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_1_7_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_1_7_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_1_7_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_1_7_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_1_7_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_1_7_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_2_0_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_2_0_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_2_0_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_2_0_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_2_0_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_2_0_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_2_0_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_2_1_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_2_1_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_2_1_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_2_1_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_2_1_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_2_1_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_2_1_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_2_2_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_2_2_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_2_2_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_2_2_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_2_2_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_2_2_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_2_2_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_2_3_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_2_3_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_2_3_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_2_3_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_2_3_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_2_3_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_2_3_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_2_4_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_2_4_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_2_4_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_2_4_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_2_4_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_2_4_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_2_4_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_2_5_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_2_5_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_2_5_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_2_5_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_2_5_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_2_5_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_2_5_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_2_6_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_2_6_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_2_6_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_2_6_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_2_6_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_2_6_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_2_6_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_2_7_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_2_7_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_2_7_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_2_7_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_2_7_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_2_7_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_2_7_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_3_0_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_3_0_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_3_0_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_3_0_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_3_0_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_3_0_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_3_0_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_3_1_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_3_1_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_3_1_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_3_1_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_3_1_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_3_1_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_3_1_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_3_2_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_3_2_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_3_2_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_3_2_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_3_2_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_3_2_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_3_2_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_3_3_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_3_3_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_3_3_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_3_3_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_3_3_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_3_3_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_3_3_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_3_4_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_3_4_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_3_4_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_3_4_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_3_4_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_3_4_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_3_4_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_3_5_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_3_5_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_3_5_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_3_5_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_3_5_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_3_5_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_3_5_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_3_6_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_3_6_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_3_6_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_3_6_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_3_6_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_3_6_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_3_6_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_3_7_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_3_7_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_3_7_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_3_7_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_3_7_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_3_7_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_3_7_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_4_0_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_4_0_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_4_0_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_4_0_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_4_0_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_4_0_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_4_0_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_4_1_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_4_1_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_4_1_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_4_1_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_4_1_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_4_1_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_4_1_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_4_2_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_4_2_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_4_2_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_4_2_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_4_2_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_4_2_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_4_2_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_4_3_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_4_3_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_4_3_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_4_3_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_4_3_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_4_3_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_4_3_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_4_4_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_4_4_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_4_4_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_4_4_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_4_4_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_4_4_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_4_4_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_4_5_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_4_5_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_4_5_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_4_5_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_4_5_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_4_5_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_4_5_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_4_6_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_4_6_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_4_6_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_4_6_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_4_6_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_4_6_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_4_6_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_4_7_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_4_7_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_4_7_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_4_7_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_4_7_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_4_7_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_4_7_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_5_0_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_5_0_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_5_0_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_5_0_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_5_0_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_5_0_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_5_0_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_5_1_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_5_1_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_5_1_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_5_1_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_5_1_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_5_1_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_5_1_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_5_2_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_5_2_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_5_2_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_5_2_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_5_2_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_5_2_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_5_2_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_5_3_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_5_3_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_5_3_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_5_3_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_5_3_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_5_3_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_5_3_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_5_4_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_5_4_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_5_4_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_5_4_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_5_4_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_5_4_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_5_4_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_5_5_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_5_5_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_5_5_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_5_5_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_5_5_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_5_5_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_5_5_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_5_6_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_5_6_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_5_6_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_5_6_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_5_6_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_5_6_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_5_6_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_5_7_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_5_7_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_5_7_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_5_7_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_5_7_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_5_7_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_5_7_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_6_0_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_6_0_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_6_0_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_6_0_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_6_0_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_6_0_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_6_0_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_6_1_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_6_1_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_6_1_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_6_1_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_6_1_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_6_1_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_6_1_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_6_2_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_6_2_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_6_2_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_6_2_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_6_2_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_6_2_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_6_2_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_6_3_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_6_3_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_6_3_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_6_3_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_6_3_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_6_3_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_6_3_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_6_4_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_6_4_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_6_4_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_6_4_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_6_4_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_6_4_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_6_4_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_6_5_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_6_5_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_6_5_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_6_5_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_6_5_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_6_5_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_6_5_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_6_6_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_6_6_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_6_6_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_6_6_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_6_6_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_6_6_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_6_6_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_6_7_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_6_7_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_6_7_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_6_7_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_6_7_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_6_7_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_6_7_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_7_0_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_7_0_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_7_0_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_7_0_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_7_0_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_7_0_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_7_0_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_7_1_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_7_1_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_7_1_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_7_1_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_7_1_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_7_1_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_7_1_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_7_2_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_7_2_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_7_2_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_7_2_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_7_2_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_7_2_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_7_2_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_7_3_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_7_3_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_7_3_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_7_3_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_7_3_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_7_3_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_7_3_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_7_4_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_7_4_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_7_4_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_7_4_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_7_4_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_7_4_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_7_4_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_7_5_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_7_5_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_7_5_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_7_5_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_7_5_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_7_5_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_7_5_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_7_6_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_7_6_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_7_6_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_7_6_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_7_6_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_7_6_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_7_6_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_7_7_clock; // @[BankedDataArray.scala 248:89]
  wire  data_banks_7_7_io_wen; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_7_7_io_waddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_7_7_io_wdata; // @[BankedDataArray.scala 248:89]
  wire  data_banks_7_7_io_ren; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_7_7_io_raddr; // @[BankedDataArray.scala 248:89]
  wire [63:0] data_banks_7_7_io_rdata; // @[BankedDataArray.scala 248:89]
  wire  ecc_banks_0_0_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_0_0_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_0_0_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_0_0_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_0_0_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_0_0_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_0_0_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_0_1_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_0_1_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_0_1_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_0_1_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_0_1_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_0_1_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_0_1_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_0_2_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_0_2_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_0_2_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_0_2_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_0_2_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_0_2_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_0_2_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_0_3_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_0_3_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_0_3_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_0_3_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_0_3_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_0_3_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_0_3_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_0_4_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_0_4_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_0_4_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_0_4_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_0_4_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_0_4_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_0_4_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_0_5_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_0_5_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_0_5_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_0_5_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_0_5_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_0_5_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_0_5_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_0_6_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_0_6_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_0_6_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_0_6_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_0_6_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_0_6_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_0_6_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_0_7_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_0_7_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_0_7_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_0_7_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_0_7_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_0_7_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_0_7_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_1_0_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_1_0_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_1_0_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_1_0_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_1_0_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_1_0_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_1_0_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_1_1_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_1_1_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_1_1_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_1_1_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_1_1_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_1_1_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_1_1_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_1_2_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_1_2_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_1_2_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_1_2_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_1_2_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_1_2_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_1_2_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_1_3_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_1_3_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_1_3_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_1_3_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_1_3_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_1_3_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_1_3_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_1_4_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_1_4_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_1_4_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_1_4_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_1_4_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_1_4_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_1_4_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_1_5_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_1_5_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_1_5_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_1_5_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_1_5_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_1_5_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_1_5_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_1_6_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_1_6_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_1_6_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_1_6_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_1_6_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_1_6_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_1_6_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_1_7_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_1_7_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_1_7_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_1_7_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_1_7_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_1_7_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_1_7_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_2_0_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_2_0_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_2_0_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_2_0_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_2_0_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_2_0_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_2_0_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_2_1_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_2_1_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_2_1_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_2_1_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_2_1_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_2_1_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_2_1_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_2_2_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_2_2_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_2_2_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_2_2_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_2_2_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_2_2_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_2_2_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_2_3_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_2_3_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_2_3_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_2_3_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_2_3_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_2_3_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_2_3_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_2_4_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_2_4_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_2_4_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_2_4_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_2_4_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_2_4_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_2_4_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_2_5_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_2_5_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_2_5_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_2_5_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_2_5_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_2_5_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_2_5_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_2_6_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_2_6_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_2_6_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_2_6_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_2_6_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_2_6_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_2_6_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_2_7_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_2_7_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_2_7_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_2_7_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_2_7_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_2_7_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_2_7_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_3_0_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_3_0_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_3_0_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_3_0_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_3_0_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_3_0_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_3_0_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_3_1_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_3_1_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_3_1_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_3_1_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_3_1_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_3_1_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_3_1_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_3_2_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_3_2_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_3_2_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_3_2_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_3_2_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_3_2_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_3_2_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_3_3_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_3_3_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_3_3_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_3_3_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_3_3_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_3_3_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_3_3_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_3_4_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_3_4_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_3_4_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_3_4_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_3_4_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_3_4_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_3_4_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_3_5_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_3_5_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_3_5_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_3_5_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_3_5_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_3_5_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_3_5_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_3_6_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_3_6_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_3_6_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_3_6_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_3_6_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_3_6_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_3_6_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_3_7_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_3_7_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_3_7_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_3_7_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_3_7_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_3_7_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_3_7_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_4_0_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_4_0_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_4_0_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_4_0_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_4_0_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_4_0_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_4_0_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_4_1_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_4_1_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_4_1_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_4_1_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_4_1_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_4_1_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_4_1_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_4_2_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_4_2_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_4_2_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_4_2_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_4_2_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_4_2_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_4_2_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_4_3_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_4_3_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_4_3_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_4_3_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_4_3_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_4_3_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_4_3_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_4_4_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_4_4_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_4_4_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_4_4_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_4_4_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_4_4_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_4_4_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_4_5_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_4_5_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_4_5_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_4_5_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_4_5_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_4_5_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_4_5_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_4_6_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_4_6_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_4_6_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_4_6_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_4_6_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_4_6_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_4_6_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_4_7_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_4_7_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_4_7_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_4_7_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_4_7_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_4_7_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_4_7_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_5_0_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_5_0_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_5_0_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_5_0_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_5_0_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_5_0_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_5_0_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_5_1_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_5_1_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_5_1_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_5_1_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_5_1_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_5_1_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_5_1_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_5_2_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_5_2_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_5_2_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_5_2_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_5_2_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_5_2_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_5_2_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_5_3_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_5_3_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_5_3_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_5_3_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_5_3_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_5_3_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_5_3_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_5_4_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_5_4_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_5_4_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_5_4_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_5_4_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_5_4_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_5_4_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_5_5_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_5_5_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_5_5_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_5_5_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_5_5_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_5_5_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_5_5_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_5_6_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_5_6_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_5_6_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_5_6_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_5_6_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_5_6_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_5_6_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_5_7_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_5_7_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_5_7_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_5_7_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_5_7_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_5_7_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_5_7_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_6_0_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_6_0_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_6_0_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_6_0_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_6_0_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_6_0_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_6_0_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_6_1_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_6_1_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_6_1_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_6_1_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_6_1_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_6_1_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_6_1_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_6_2_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_6_2_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_6_2_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_6_2_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_6_2_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_6_2_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_6_2_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_6_3_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_6_3_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_6_3_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_6_3_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_6_3_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_6_3_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_6_3_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_6_4_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_6_4_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_6_4_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_6_4_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_6_4_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_6_4_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_6_4_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_6_5_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_6_5_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_6_5_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_6_5_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_6_5_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_6_5_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_6_5_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_6_6_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_6_6_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_6_6_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_6_6_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_6_6_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_6_6_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_6_6_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_6_7_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_6_7_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_6_7_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_6_7_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_6_7_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_6_7_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_6_7_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_7_0_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_7_0_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_7_0_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_7_0_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_7_0_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_7_0_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_7_0_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_7_1_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_7_1_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_7_1_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_7_1_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_7_1_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_7_1_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_7_1_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_7_2_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_7_2_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_7_2_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_7_2_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_7_2_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_7_2_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_7_2_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_7_3_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_7_3_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_7_3_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_7_3_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_7_3_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_7_3_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_7_3_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_7_4_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_7_4_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_7_4_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_7_4_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_7_4_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_7_4_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_7_4_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_7_5_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_7_5_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_7_5_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_7_5_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_7_5_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_7_5_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_7_5_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_7_6_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_7_6_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_7_6_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_7_6_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_7_6_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_7_6_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_7_6_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_7_7_clock; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_7_7_io_rreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_7_7_io_rreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_7_7_io_rresp_data_0; // @[BankedDataArray.scala 250:88]
  wire  ecc_banks_7_7_io_wreq_valid; // @[BankedDataArray.scala 250:88]
  wire [5:0] ecc_banks_7_7_io_wreq_bits_setIdx; // @[BankedDataArray.scala 250:88]
  wire [7:0] ecc_banks_7_7_io_wreq_bits_data_0; // @[BankedDataArray.scala 250:88]
  wire  writer_clock; // @[ChiselDB.scala 132:24]
  wire  writer_reset; // @[ChiselDB.scala 132:24]
  wire  writer_en; // @[ChiselDB.scala 132:24]
  wire [63:0] writer_stamp; // @[ChiselDB.scala 132:24]
  wire [35:0] writer_data_addr_0; // @[ChiselDB.scala 132:24]
  wire [35:0] writer_data_addr_1; // @[ChiselDB.scala 132:24]
  wire [5:0] writer_data_set_index_0; // @[ChiselDB.scala 132:24]
  wire [5:0] writer_data_set_index_1; // @[ChiselDB.scala 132:24]
  wire [2:0] writer_data_bank_index_0; // @[ChiselDB.scala 132:24]
  wire [2:0] writer_data_bank_index_1; // @[ChiselDB.scala 132:24]
  wire [2:0] writer_data_way_index; // @[ChiselDB.scala 132:24]
  wire  writer_data_fake_rr_bank_conflict; // @[ChiselDB.scala 132:24]
  reg  rwhazard; // @[BankedDataArray.scala 269:25]
  wire [5:0] set_addrs_0 = io_read_0_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
  wire [3:0] bank_addrs_0_0 = {{1'd0}, io_read_0_bits_addr[5:3]}; // @[BankedDataArray.scala 265:24 274:32]
  wire [5:0] set_addrs_1 = io_read_1_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
  wire [3:0] bank_addrs_1_0 = {{1'd0}, io_read_1_bits_addr[5:3]}; // @[BankedDataArray.scala 265:24 274:32]
  wire [7:0] _rr_bank_conflict_T_7 = io_read_0_bits_bankMask & io_read_1_bits_bankMask; // @[BankedDataArray.scala 290:31]
  wire  rr_bank_conflict_0_1 = _rr_bank_conflict_T_7 != 8'h0 & io_read_0_valid & io_read_1_valid & io_read_0_bits_way_en
     == io_read_1_bits_way_en & set_addrs_0 != set_addrs_1; // @[BankedDataArray.scala 290:160]
  wire  rrl_bank_conflict_0 = io_read_0_valid & io_readline_valid & io_readline_bits_way_en == io_read_0_bits_way_en &
    io_readline_bits_addr[11:6] != set_addrs_0; // @[BankedDataArray.scala 299:149]
  wire  rrl_bank_conflict_1 = io_read_1_valid & io_readline_valid & io_readline_bits_way_en == io_read_1_bits_way_en &
    io_readline_bits_addr[11:6] != set_addrs_1; // @[BankedDataArray.scala 299:149]
  wire  rw_bank_conflict_0 = io_read_0_valid & rwhazard; // @[BankedDataArray.scala 309:83]
  wire  rw_bank_conflict_1 = io_read_1_valid & rwhazard; // @[BankedDataArray.scala 309:83]
  reg  io_bank_conflict_slow_0_REG; // @[BankedDataArray.scala 314:40]
  reg  io_bank_conflict_slow_1_REG; // @[BankedDataArray.scala 314:40]
  wire  loadpipe_en__0 = bank_addrs_0_0 == 4'h0 & io_read_0_valid & io_read_0_bits_way_en[0]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en__1 = bank_addrs_1_0 == 4'h0 & io_read_1_valid & io_read_1_bits_way_en[0]; // @[BankedDataArray.scala 351:102]
  wire  readline_en = io_readline_valid & io_readline_bits_way_en[0]; // @[BankedDataArray.scala 360:42]
  wire [5:0] _sram_set_addr_T_1 = loadpipe_en__0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr = readline_en ? io_readline_bits_addr[11:6] : _sram_set_addr_T_1; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T = {loadpipe_en__1,loadpipe_en__0}; // @[BankedDataArray.scala 366:33]
  wire  read_en = |_read_en_T | readline_en; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_0_0_ecc = ecc_banks_0_0_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_0_0_raw_data = data_banks_0_0_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data = {read_result_0_0_ecc,read_result_0_0_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed; // @[Reg.scala 16:16]
  wire [70:0] _read_result_0_0_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_0_0_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_0_0_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_0_0_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_0_0_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_0_0_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_0_0_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_0_0_error_delayed_syndromeUInt = {^_read_result_0_0_error_delayed_syndromeUInt_T_12,^
    _read_result_0_0_error_delayed_syndromeUInt_T_10,^_read_result_0_0_error_delayed_syndromeUInt_T_8,^
    _read_result_0_0_error_delayed_syndromeUInt_T_6,^_read_result_0_0_error_delayed_syndromeUInt_T_4,^
    _read_result_0_0_error_delayed_syndromeUInt_T_2,^_read_result_0_0_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_0_0_error_delayed_correctable = |read_result_0_0_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_0_0_error_delayed_uncorrectable_1 = ^ecc_data_delayed; // @[ECC.scala 87:27]
  wire  read_result_0_0_error_delayed_uncorrectable_2 = ~read_result_0_0_error_delayed_uncorrectable_1 &
    read_result_0_0_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_1_0 = bank_addrs_0_0 == 4'h0 & io_read_0_valid & io_read_0_bits_way_en[1]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_1_1 = bank_addrs_1_0 == 4'h0 & io_read_1_valid & io_read_1_bits_way_en[1]; // @[BankedDataArray.scala 351:102]
  wire  readline_en_1 = io_readline_valid & io_readline_bits_way_en[1]; // @[BankedDataArray.scala 360:42]
  wire [5:0] _sram_set_addr_T_3 = loadpipe_en_1_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_1 = readline_en_1 ? io_readline_bits_addr[11:6] : _sram_set_addr_T_3; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_2 = {loadpipe_en_1_1,loadpipe_en_1_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_1 = |_read_en_T_2 | readline_en_1; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_0_1_ecc = ecc_banks_0_1_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_0_1_raw_data = data_banks_0_1_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_1 = {read_result_0_1_ecc,read_result_0_1_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_1; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_1; // @[Reg.scala 16:16]
  wire [70:0] _read_result_0_1_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_1[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_0_1_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_1[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_0_1_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_1[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_0_1_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_1[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_0_1_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_1[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_0_1_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_1[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_0_1_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_1[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_0_1_error_delayed_syndromeUInt = {^_read_result_0_1_error_delayed_syndromeUInt_T_12,^
    _read_result_0_1_error_delayed_syndromeUInt_T_10,^_read_result_0_1_error_delayed_syndromeUInt_T_8,^
    _read_result_0_1_error_delayed_syndromeUInt_T_6,^_read_result_0_1_error_delayed_syndromeUInt_T_4,^
    _read_result_0_1_error_delayed_syndromeUInt_T_2,^_read_result_0_1_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_0_1_error_delayed_correctable = |read_result_0_1_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_0_1_error_delayed_uncorrectable_1 = ^ecc_data_delayed_1; // @[ECC.scala 87:27]
  wire  read_result_0_1_error_delayed_uncorrectable_2 = ~read_result_0_1_error_delayed_uncorrectable_1 &
    read_result_0_1_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_2_0 = bank_addrs_0_0 == 4'h0 & io_read_0_valid & io_read_0_bits_way_en[2]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_2_1 = bank_addrs_1_0 == 4'h0 & io_read_1_valid & io_read_1_bits_way_en[2]; // @[BankedDataArray.scala 351:102]
  wire  readline_en_2 = io_readline_valid & io_readline_bits_way_en[2]; // @[BankedDataArray.scala 360:42]
  wire [5:0] _sram_set_addr_T_5 = loadpipe_en_2_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_2 = readline_en_2 ? io_readline_bits_addr[11:6] : _sram_set_addr_T_5; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_4 = {loadpipe_en_2_1,loadpipe_en_2_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_2 = |_read_en_T_4 | readline_en_2; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_0_2_ecc = ecc_banks_0_2_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_0_2_raw_data = data_banks_0_2_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_2 = {read_result_0_2_ecc,read_result_0_2_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_2; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_2; // @[Reg.scala 16:16]
  wire [70:0] _read_result_0_2_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_2[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_0_2_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_2[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_0_2_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_2[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_0_2_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_2[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_0_2_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_2[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_0_2_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_2[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_0_2_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_2[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_0_2_error_delayed_syndromeUInt = {^_read_result_0_2_error_delayed_syndromeUInt_T_12,^
    _read_result_0_2_error_delayed_syndromeUInt_T_10,^_read_result_0_2_error_delayed_syndromeUInt_T_8,^
    _read_result_0_2_error_delayed_syndromeUInt_T_6,^_read_result_0_2_error_delayed_syndromeUInt_T_4,^
    _read_result_0_2_error_delayed_syndromeUInt_T_2,^_read_result_0_2_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_0_2_error_delayed_correctable = |read_result_0_2_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_0_2_error_delayed_uncorrectable_1 = ^ecc_data_delayed_2; // @[ECC.scala 87:27]
  wire  read_result_0_2_error_delayed_uncorrectable_2 = ~read_result_0_2_error_delayed_uncorrectable_1 &
    read_result_0_2_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_3_0 = bank_addrs_0_0 == 4'h0 & io_read_0_valid & io_read_0_bits_way_en[3]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_3_1 = bank_addrs_1_0 == 4'h0 & io_read_1_valid & io_read_1_bits_way_en[3]; // @[BankedDataArray.scala 351:102]
  wire  readline_en_3 = io_readline_valid & io_readline_bits_way_en[3]; // @[BankedDataArray.scala 360:42]
  wire [5:0] _sram_set_addr_T_7 = loadpipe_en_3_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_3 = readline_en_3 ? io_readline_bits_addr[11:6] : _sram_set_addr_T_7; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_6 = {loadpipe_en_3_1,loadpipe_en_3_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_3 = |_read_en_T_6 | readline_en_3; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_0_3_ecc = ecc_banks_0_3_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_0_3_raw_data = data_banks_0_3_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_3 = {read_result_0_3_ecc,read_result_0_3_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_3; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_3; // @[Reg.scala 16:16]
  wire [70:0] _read_result_0_3_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_3[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_0_3_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_3[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_0_3_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_3[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_0_3_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_3[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_0_3_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_3[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_0_3_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_3[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_0_3_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_3[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_0_3_error_delayed_syndromeUInt = {^_read_result_0_3_error_delayed_syndromeUInt_T_12,^
    _read_result_0_3_error_delayed_syndromeUInt_T_10,^_read_result_0_3_error_delayed_syndromeUInt_T_8,^
    _read_result_0_3_error_delayed_syndromeUInt_T_6,^_read_result_0_3_error_delayed_syndromeUInt_T_4,^
    _read_result_0_3_error_delayed_syndromeUInt_T_2,^_read_result_0_3_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_0_3_error_delayed_correctable = |read_result_0_3_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_0_3_error_delayed_uncorrectable_1 = ^ecc_data_delayed_3; // @[ECC.scala 87:27]
  wire  read_result_0_3_error_delayed_uncorrectable_2 = ~read_result_0_3_error_delayed_uncorrectable_1 &
    read_result_0_3_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_4_0 = bank_addrs_0_0 == 4'h0 & io_read_0_valid & io_read_0_bits_way_en[4]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_4_1 = bank_addrs_1_0 == 4'h0 & io_read_1_valid & io_read_1_bits_way_en[4]; // @[BankedDataArray.scala 351:102]
  wire  readline_en_4 = io_readline_valid & io_readline_bits_way_en[4]; // @[BankedDataArray.scala 360:42]
  wire [5:0] _sram_set_addr_T_9 = loadpipe_en_4_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_4 = readline_en_4 ? io_readline_bits_addr[11:6] : _sram_set_addr_T_9; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_8 = {loadpipe_en_4_1,loadpipe_en_4_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_4 = |_read_en_T_8 | readline_en_4; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_0_4_ecc = ecc_banks_0_4_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_0_4_raw_data = data_banks_0_4_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_4 = {read_result_0_4_ecc,read_result_0_4_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_4; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_4; // @[Reg.scala 16:16]
  wire [70:0] _read_result_0_4_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_4[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_0_4_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_4[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_0_4_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_4[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_0_4_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_4[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_0_4_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_4[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_0_4_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_4[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_0_4_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_4[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_0_4_error_delayed_syndromeUInt = {^_read_result_0_4_error_delayed_syndromeUInt_T_12,^
    _read_result_0_4_error_delayed_syndromeUInt_T_10,^_read_result_0_4_error_delayed_syndromeUInt_T_8,^
    _read_result_0_4_error_delayed_syndromeUInt_T_6,^_read_result_0_4_error_delayed_syndromeUInt_T_4,^
    _read_result_0_4_error_delayed_syndromeUInt_T_2,^_read_result_0_4_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_0_4_error_delayed_correctable = |read_result_0_4_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_0_4_error_delayed_uncorrectable_1 = ^ecc_data_delayed_4; // @[ECC.scala 87:27]
  wire  read_result_0_4_error_delayed_uncorrectable_2 = ~read_result_0_4_error_delayed_uncorrectable_1 &
    read_result_0_4_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_5_0 = bank_addrs_0_0 == 4'h0 & io_read_0_valid & io_read_0_bits_way_en[5]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_5_1 = bank_addrs_1_0 == 4'h0 & io_read_1_valid & io_read_1_bits_way_en[5]; // @[BankedDataArray.scala 351:102]
  wire  readline_en_5 = io_readline_valid & io_readline_bits_way_en[5]; // @[BankedDataArray.scala 360:42]
  wire [5:0] _sram_set_addr_T_11 = loadpipe_en_5_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_5 = readline_en_5 ? io_readline_bits_addr[11:6] : _sram_set_addr_T_11; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_10 = {loadpipe_en_5_1,loadpipe_en_5_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_5 = |_read_en_T_10 | readline_en_5; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_0_5_ecc = ecc_banks_0_5_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_0_5_raw_data = data_banks_0_5_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_5 = {read_result_0_5_ecc,read_result_0_5_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_5; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_5; // @[Reg.scala 16:16]
  wire [70:0] _read_result_0_5_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_5[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_0_5_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_5[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_0_5_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_5[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_0_5_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_5[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_0_5_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_5[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_0_5_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_5[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_0_5_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_5[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_0_5_error_delayed_syndromeUInt = {^_read_result_0_5_error_delayed_syndromeUInt_T_12,^
    _read_result_0_5_error_delayed_syndromeUInt_T_10,^_read_result_0_5_error_delayed_syndromeUInt_T_8,^
    _read_result_0_5_error_delayed_syndromeUInt_T_6,^_read_result_0_5_error_delayed_syndromeUInt_T_4,^
    _read_result_0_5_error_delayed_syndromeUInt_T_2,^_read_result_0_5_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_0_5_error_delayed_correctable = |read_result_0_5_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_0_5_error_delayed_uncorrectable_1 = ^ecc_data_delayed_5; // @[ECC.scala 87:27]
  wire  read_result_0_5_error_delayed_uncorrectable_2 = ~read_result_0_5_error_delayed_uncorrectable_1 &
    read_result_0_5_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_6_0 = bank_addrs_0_0 == 4'h0 & io_read_0_valid & io_read_0_bits_way_en[6]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_6_1 = bank_addrs_1_0 == 4'h0 & io_read_1_valid & io_read_1_bits_way_en[6]; // @[BankedDataArray.scala 351:102]
  wire  readline_en_6 = io_readline_valid & io_readline_bits_way_en[6]; // @[BankedDataArray.scala 360:42]
  wire [5:0] _sram_set_addr_T_13 = loadpipe_en_6_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_6 = readline_en_6 ? io_readline_bits_addr[11:6] : _sram_set_addr_T_13; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_12 = {loadpipe_en_6_1,loadpipe_en_6_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_6 = |_read_en_T_12 | readline_en_6; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_0_6_ecc = ecc_banks_0_6_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_0_6_raw_data = data_banks_0_6_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_6 = {read_result_0_6_ecc,read_result_0_6_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_6; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_6; // @[Reg.scala 16:16]
  wire [70:0] _read_result_0_6_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_6[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_0_6_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_6[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_0_6_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_6[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_0_6_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_6[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_0_6_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_6[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_0_6_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_6[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_0_6_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_6[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_0_6_error_delayed_syndromeUInt = {^_read_result_0_6_error_delayed_syndromeUInt_T_12,^
    _read_result_0_6_error_delayed_syndromeUInt_T_10,^_read_result_0_6_error_delayed_syndromeUInt_T_8,^
    _read_result_0_6_error_delayed_syndromeUInt_T_6,^_read_result_0_6_error_delayed_syndromeUInt_T_4,^
    _read_result_0_6_error_delayed_syndromeUInt_T_2,^_read_result_0_6_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_0_6_error_delayed_correctable = |read_result_0_6_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_0_6_error_delayed_uncorrectable_1 = ^ecc_data_delayed_6; // @[ECC.scala 87:27]
  wire  read_result_0_6_error_delayed_uncorrectable_2 = ~read_result_0_6_error_delayed_uncorrectable_1 &
    read_result_0_6_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_7_0 = bank_addrs_0_0 == 4'h0 & io_read_0_valid & io_read_0_bits_way_en[7]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_7_1 = bank_addrs_1_0 == 4'h0 & io_read_1_valid & io_read_1_bits_way_en[7]; // @[BankedDataArray.scala 351:102]
  wire  readline_en_7 = io_readline_valid & io_readline_bits_way_en[7]; // @[BankedDataArray.scala 360:42]
  wire [5:0] _sram_set_addr_T_15 = loadpipe_en_7_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_7 = readline_en_7 ? io_readline_bits_addr[11:6] : _sram_set_addr_T_15; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_14 = {loadpipe_en_7_1,loadpipe_en_7_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_7 = |_read_en_T_14 | readline_en_7; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_0_7_ecc = ecc_banks_0_7_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_0_7_raw_data = data_banks_0_7_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_7 = {read_result_0_7_ecc,read_result_0_7_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_7; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_7; // @[Reg.scala 16:16]
  wire [70:0] _read_result_0_7_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_7[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_0_7_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_7[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_0_7_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_7[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_0_7_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_7[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_0_7_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_7[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_0_7_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_7[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_0_7_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_7[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_0_7_error_delayed_syndromeUInt = {^_read_result_0_7_error_delayed_syndromeUInt_T_12,^
    _read_result_0_7_error_delayed_syndromeUInt_T_10,^_read_result_0_7_error_delayed_syndromeUInt_T_8,^
    _read_result_0_7_error_delayed_syndromeUInt_T_6,^_read_result_0_7_error_delayed_syndromeUInt_T_4,^
    _read_result_0_7_error_delayed_syndromeUInt_T_2,^_read_result_0_7_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_0_7_error_delayed_correctable = |read_result_0_7_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_0_7_error_delayed_uncorrectable_1 = ^ecc_data_delayed_7; // @[ECC.scala 87:27]
  wire  read_result_0_7_error_delayed_uncorrectable_2 = ~read_result_0_7_error_delayed_uncorrectable_1 &
    read_result_0_7_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_8_0 = bank_addrs_0_0 == 4'h1 & io_read_0_valid & io_read_0_bits_way_en[0]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_8_1 = bank_addrs_1_0 == 4'h1 & io_read_1_valid & io_read_1_bits_way_en[0]; // @[BankedDataArray.scala 351:102]
  wire [5:0] _sram_set_addr_T_17 = loadpipe_en_8_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_8 = readline_en ? io_readline_bits_addr[11:6] : _sram_set_addr_T_17; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_16 = {loadpipe_en_8_1,loadpipe_en_8_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_8 = |_read_en_T_16 | readline_en; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_1_0_ecc = ecc_banks_1_0_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_1_0_raw_data = data_banks_1_0_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_8 = {read_result_1_0_ecc,read_result_1_0_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_8; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_8; // @[Reg.scala 16:16]
  wire [70:0] _read_result_1_0_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_8[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_1_0_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_8[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_1_0_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_8[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_1_0_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_8[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_1_0_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_8[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_1_0_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_8[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_1_0_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_8[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_1_0_error_delayed_syndromeUInt = {^_read_result_1_0_error_delayed_syndromeUInt_T_12,^
    _read_result_1_0_error_delayed_syndromeUInt_T_10,^_read_result_1_0_error_delayed_syndromeUInt_T_8,^
    _read_result_1_0_error_delayed_syndromeUInt_T_6,^_read_result_1_0_error_delayed_syndromeUInt_T_4,^
    _read_result_1_0_error_delayed_syndromeUInt_T_2,^_read_result_1_0_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_1_0_error_delayed_correctable = |read_result_1_0_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_1_0_error_delayed_uncorrectable_1 = ^ecc_data_delayed_8; // @[ECC.scala 87:27]
  wire  read_result_1_0_error_delayed_uncorrectable_2 = ~read_result_1_0_error_delayed_uncorrectable_1 &
    read_result_1_0_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_9_0 = bank_addrs_0_0 == 4'h1 & io_read_0_valid & io_read_0_bits_way_en[1]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_9_1 = bank_addrs_1_0 == 4'h1 & io_read_1_valid & io_read_1_bits_way_en[1]; // @[BankedDataArray.scala 351:102]
  wire [5:0] _sram_set_addr_T_19 = loadpipe_en_9_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_9 = readline_en_1 ? io_readline_bits_addr[11:6] : _sram_set_addr_T_19; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_18 = {loadpipe_en_9_1,loadpipe_en_9_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_9 = |_read_en_T_18 | readline_en_1; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_1_1_ecc = ecc_banks_1_1_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_1_1_raw_data = data_banks_1_1_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_9 = {read_result_1_1_ecc,read_result_1_1_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_9; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_9; // @[Reg.scala 16:16]
  wire [70:0] _read_result_1_1_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_9[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_1_1_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_9[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_1_1_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_9[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_1_1_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_9[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_1_1_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_9[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_1_1_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_9[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_1_1_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_9[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_1_1_error_delayed_syndromeUInt = {^_read_result_1_1_error_delayed_syndromeUInt_T_12,^
    _read_result_1_1_error_delayed_syndromeUInt_T_10,^_read_result_1_1_error_delayed_syndromeUInt_T_8,^
    _read_result_1_1_error_delayed_syndromeUInt_T_6,^_read_result_1_1_error_delayed_syndromeUInt_T_4,^
    _read_result_1_1_error_delayed_syndromeUInt_T_2,^_read_result_1_1_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_1_1_error_delayed_correctable = |read_result_1_1_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_1_1_error_delayed_uncorrectable_1 = ^ecc_data_delayed_9; // @[ECC.scala 87:27]
  wire  read_result_1_1_error_delayed_uncorrectable_2 = ~read_result_1_1_error_delayed_uncorrectable_1 &
    read_result_1_1_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_10_0 = bank_addrs_0_0 == 4'h1 & io_read_0_valid & io_read_0_bits_way_en[2]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_10_1 = bank_addrs_1_0 == 4'h1 & io_read_1_valid & io_read_1_bits_way_en[2]; // @[BankedDataArray.scala 351:102]
  wire [5:0] _sram_set_addr_T_21 = loadpipe_en_10_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_10 = readline_en_2 ? io_readline_bits_addr[11:6] : _sram_set_addr_T_21; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_20 = {loadpipe_en_10_1,loadpipe_en_10_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_10 = |_read_en_T_20 | readline_en_2; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_1_2_ecc = ecc_banks_1_2_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_1_2_raw_data = data_banks_1_2_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_10 = {read_result_1_2_ecc,read_result_1_2_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_10; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_10; // @[Reg.scala 16:16]
  wire [70:0] _read_result_1_2_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_10[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_1_2_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_10[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_1_2_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_10[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_1_2_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_10[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_1_2_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_10[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_1_2_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_10[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_1_2_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_10[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_1_2_error_delayed_syndromeUInt = {^_read_result_1_2_error_delayed_syndromeUInt_T_12,^
    _read_result_1_2_error_delayed_syndromeUInt_T_10,^_read_result_1_2_error_delayed_syndromeUInt_T_8,^
    _read_result_1_2_error_delayed_syndromeUInt_T_6,^_read_result_1_2_error_delayed_syndromeUInt_T_4,^
    _read_result_1_2_error_delayed_syndromeUInt_T_2,^_read_result_1_2_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_1_2_error_delayed_correctable = |read_result_1_2_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_1_2_error_delayed_uncorrectable_1 = ^ecc_data_delayed_10; // @[ECC.scala 87:27]
  wire  read_result_1_2_error_delayed_uncorrectable_2 = ~read_result_1_2_error_delayed_uncorrectable_1 &
    read_result_1_2_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_11_0 = bank_addrs_0_0 == 4'h1 & io_read_0_valid & io_read_0_bits_way_en[3]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_11_1 = bank_addrs_1_0 == 4'h1 & io_read_1_valid & io_read_1_bits_way_en[3]; // @[BankedDataArray.scala 351:102]
  wire [5:0] _sram_set_addr_T_23 = loadpipe_en_11_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_11 = readline_en_3 ? io_readline_bits_addr[11:6] : _sram_set_addr_T_23; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_22 = {loadpipe_en_11_1,loadpipe_en_11_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_11 = |_read_en_T_22 | readline_en_3; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_1_3_ecc = ecc_banks_1_3_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_1_3_raw_data = data_banks_1_3_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_11 = {read_result_1_3_ecc,read_result_1_3_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_11; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_11; // @[Reg.scala 16:16]
  wire [70:0] _read_result_1_3_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_11[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_1_3_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_11[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_1_3_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_11[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_1_3_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_11[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_1_3_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_11[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_1_3_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_11[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_1_3_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_11[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_1_3_error_delayed_syndromeUInt = {^_read_result_1_3_error_delayed_syndromeUInt_T_12,^
    _read_result_1_3_error_delayed_syndromeUInt_T_10,^_read_result_1_3_error_delayed_syndromeUInt_T_8,^
    _read_result_1_3_error_delayed_syndromeUInt_T_6,^_read_result_1_3_error_delayed_syndromeUInt_T_4,^
    _read_result_1_3_error_delayed_syndromeUInt_T_2,^_read_result_1_3_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_1_3_error_delayed_correctable = |read_result_1_3_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_1_3_error_delayed_uncorrectable_1 = ^ecc_data_delayed_11; // @[ECC.scala 87:27]
  wire  read_result_1_3_error_delayed_uncorrectable_2 = ~read_result_1_3_error_delayed_uncorrectable_1 &
    read_result_1_3_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_12_0 = bank_addrs_0_0 == 4'h1 & io_read_0_valid & io_read_0_bits_way_en[4]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_12_1 = bank_addrs_1_0 == 4'h1 & io_read_1_valid & io_read_1_bits_way_en[4]; // @[BankedDataArray.scala 351:102]
  wire [5:0] _sram_set_addr_T_25 = loadpipe_en_12_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_12 = readline_en_4 ? io_readline_bits_addr[11:6] : _sram_set_addr_T_25; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_24 = {loadpipe_en_12_1,loadpipe_en_12_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_12 = |_read_en_T_24 | readline_en_4; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_1_4_ecc = ecc_banks_1_4_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_1_4_raw_data = data_banks_1_4_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_12 = {read_result_1_4_ecc,read_result_1_4_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_12; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_12; // @[Reg.scala 16:16]
  wire [70:0] _read_result_1_4_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_12[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_1_4_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_12[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_1_4_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_12[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_1_4_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_12[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_1_4_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_12[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_1_4_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_12[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_1_4_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_12[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_1_4_error_delayed_syndromeUInt = {^_read_result_1_4_error_delayed_syndromeUInt_T_12,^
    _read_result_1_4_error_delayed_syndromeUInt_T_10,^_read_result_1_4_error_delayed_syndromeUInt_T_8,^
    _read_result_1_4_error_delayed_syndromeUInt_T_6,^_read_result_1_4_error_delayed_syndromeUInt_T_4,^
    _read_result_1_4_error_delayed_syndromeUInt_T_2,^_read_result_1_4_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_1_4_error_delayed_correctable = |read_result_1_4_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_1_4_error_delayed_uncorrectable_1 = ^ecc_data_delayed_12; // @[ECC.scala 87:27]
  wire  read_result_1_4_error_delayed_uncorrectable_2 = ~read_result_1_4_error_delayed_uncorrectable_1 &
    read_result_1_4_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_13_0 = bank_addrs_0_0 == 4'h1 & io_read_0_valid & io_read_0_bits_way_en[5]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_13_1 = bank_addrs_1_0 == 4'h1 & io_read_1_valid & io_read_1_bits_way_en[5]; // @[BankedDataArray.scala 351:102]
  wire [5:0] _sram_set_addr_T_27 = loadpipe_en_13_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_13 = readline_en_5 ? io_readline_bits_addr[11:6] : _sram_set_addr_T_27; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_26 = {loadpipe_en_13_1,loadpipe_en_13_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_13 = |_read_en_T_26 | readline_en_5; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_1_5_ecc = ecc_banks_1_5_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_1_5_raw_data = data_banks_1_5_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_13 = {read_result_1_5_ecc,read_result_1_5_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_13; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_13; // @[Reg.scala 16:16]
  wire [70:0] _read_result_1_5_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_13[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_1_5_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_13[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_1_5_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_13[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_1_5_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_13[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_1_5_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_13[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_1_5_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_13[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_1_5_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_13[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_1_5_error_delayed_syndromeUInt = {^_read_result_1_5_error_delayed_syndromeUInt_T_12,^
    _read_result_1_5_error_delayed_syndromeUInt_T_10,^_read_result_1_5_error_delayed_syndromeUInt_T_8,^
    _read_result_1_5_error_delayed_syndromeUInt_T_6,^_read_result_1_5_error_delayed_syndromeUInt_T_4,^
    _read_result_1_5_error_delayed_syndromeUInt_T_2,^_read_result_1_5_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_1_5_error_delayed_correctable = |read_result_1_5_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_1_5_error_delayed_uncorrectable_1 = ^ecc_data_delayed_13; // @[ECC.scala 87:27]
  wire  read_result_1_5_error_delayed_uncorrectable_2 = ~read_result_1_5_error_delayed_uncorrectable_1 &
    read_result_1_5_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_14_0 = bank_addrs_0_0 == 4'h1 & io_read_0_valid & io_read_0_bits_way_en[6]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_14_1 = bank_addrs_1_0 == 4'h1 & io_read_1_valid & io_read_1_bits_way_en[6]; // @[BankedDataArray.scala 351:102]
  wire [5:0] _sram_set_addr_T_29 = loadpipe_en_14_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_14 = readline_en_6 ? io_readline_bits_addr[11:6] : _sram_set_addr_T_29; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_28 = {loadpipe_en_14_1,loadpipe_en_14_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_14 = |_read_en_T_28 | readline_en_6; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_1_6_ecc = ecc_banks_1_6_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_1_6_raw_data = data_banks_1_6_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_14 = {read_result_1_6_ecc,read_result_1_6_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_14; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_14; // @[Reg.scala 16:16]
  wire [70:0] _read_result_1_6_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_14[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_1_6_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_14[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_1_6_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_14[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_1_6_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_14[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_1_6_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_14[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_1_6_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_14[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_1_6_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_14[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_1_6_error_delayed_syndromeUInt = {^_read_result_1_6_error_delayed_syndromeUInt_T_12,^
    _read_result_1_6_error_delayed_syndromeUInt_T_10,^_read_result_1_6_error_delayed_syndromeUInt_T_8,^
    _read_result_1_6_error_delayed_syndromeUInt_T_6,^_read_result_1_6_error_delayed_syndromeUInt_T_4,^
    _read_result_1_6_error_delayed_syndromeUInt_T_2,^_read_result_1_6_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_1_6_error_delayed_correctable = |read_result_1_6_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_1_6_error_delayed_uncorrectable_1 = ^ecc_data_delayed_14; // @[ECC.scala 87:27]
  wire  read_result_1_6_error_delayed_uncorrectable_2 = ~read_result_1_6_error_delayed_uncorrectable_1 &
    read_result_1_6_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_15_0 = bank_addrs_0_0 == 4'h1 & io_read_0_valid & io_read_0_bits_way_en[7]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_15_1 = bank_addrs_1_0 == 4'h1 & io_read_1_valid & io_read_1_bits_way_en[7]; // @[BankedDataArray.scala 351:102]
  wire [5:0] _sram_set_addr_T_31 = loadpipe_en_15_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_15 = readline_en_7 ? io_readline_bits_addr[11:6] : _sram_set_addr_T_31; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_30 = {loadpipe_en_15_1,loadpipe_en_15_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_15 = |_read_en_T_30 | readline_en_7; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_1_7_ecc = ecc_banks_1_7_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_1_7_raw_data = data_banks_1_7_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_15 = {read_result_1_7_ecc,read_result_1_7_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_15; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_15; // @[Reg.scala 16:16]
  wire [70:0] _read_result_1_7_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_15[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_1_7_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_15[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_1_7_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_15[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_1_7_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_15[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_1_7_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_15[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_1_7_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_15[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_1_7_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_15[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_1_7_error_delayed_syndromeUInt = {^_read_result_1_7_error_delayed_syndromeUInt_T_12,^
    _read_result_1_7_error_delayed_syndromeUInt_T_10,^_read_result_1_7_error_delayed_syndromeUInt_T_8,^
    _read_result_1_7_error_delayed_syndromeUInt_T_6,^_read_result_1_7_error_delayed_syndromeUInt_T_4,^
    _read_result_1_7_error_delayed_syndromeUInt_T_2,^_read_result_1_7_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_1_7_error_delayed_correctable = |read_result_1_7_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_1_7_error_delayed_uncorrectable_1 = ^ecc_data_delayed_15; // @[ECC.scala 87:27]
  wire  read_result_1_7_error_delayed_uncorrectable_2 = ~read_result_1_7_error_delayed_uncorrectable_1 &
    read_result_1_7_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_16_0 = bank_addrs_0_0 == 4'h2 & io_read_0_valid & io_read_0_bits_way_en[0]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_16_1 = bank_addrs_1_0 == 4'h2 & io_read_1_valid & io_read_1_bits_way_en[0]; // @[BankedDataArray.scala 351:102]
  wire [5:0] _sram_set_addr_T_33 = loadpipe_en_16_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_16 = readline_en ? io_readline_bits_addr[11:6] : _sram_set_addr_T_33; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_32 = {loadpipe_en_16_1,loadpipe_en_16_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_16 = |_read_en_T_32 | readline_en; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_2_0_ecc = ecc_banks_2_0_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_2_0_raw_data = data_banks_2_0_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_16 = {read_result_2_0_ecc,read_result_2_0_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_16; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_16; // @[Reg.scala 16:16]
  wire [70:0] _read_result_2_0_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_16[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_2_0_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_16[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_2_0_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_16[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_2_0_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_16[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_2_0_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_16[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_2_0_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_16[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_2_0_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_16[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_2_0_error_delayed_syndromeUInt = {^_read_result_2_0_error_delayed_syndromeUInt_T_12,^
    _read_result_2_0_error_delayed_syndromeUInt_T_10,^_read_result_2_0_error_delayed_syndromeUInt_T_8,^
    _read_result_2_0_error_delayed_syndromeUInt_T_6,^_read_result_2_0_error_delayed_syndromeUInt_T_4,^
    _read_result_2_0_error_delayed_syndromeUInt_T_2,^_read_result_2_0_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_2_0_error_delayed_correctable = |read_result_2_0_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_2_0_error_delayed_uncorrectable_1 = ^ecc_data_delayed_16; // @[ECC.scala 87:27]
  wire  read_result_2_0_error_delayed_uncorrectable_2 = ~read_result_2_0_error_delayed_uncorrectable_1 &
    read_result_2_0_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_17_0 = bank_addrs_0_0 == 4'h2 & io_read_0_valid & io_read_0_bits_way_en[1]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_17_1 = bank_addrs_1_0 == 4'h2 & io_read_1_valid & io_read_1_bits_way_en[1]; // @[BankedDataArray.scala 351:102]
  wire [5:0] _sram_set_addr_T_35 = loadpipe_en_17_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_17 = readline_en_1 ? io_readline_bits_addr[11:6] : _sram_set_addr_T_35; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_34 = {loadpipe_en_17_1,loadpipe_en_17_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_17 = |_read_en_T_34 | readline_en_1; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_2_1_ecc = ecc_banks_2_1_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_2_1_raw_data = data_banks_2_1_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_17 = {read_result_2_1_ecc,read_result_2_1_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_17; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_17; // @[Reg.scala 16:16]
  wire [70:0] _read_result_2_1_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_17[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_2_1_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_17[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_2_1_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_17[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_2_1_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_17[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_2_1_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_17[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_2_1_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_17[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_2_1_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_17[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_2_1_error_delayed_syndromeUInt = {^_read_result_2_1_error_delayed_syndromeUInt_T_12,^
    _read_result_2_1_error_delayed_syndromeUInt_T_10,^_read_result_2_1_error_delayed_syndromeUInt_T_8,^
    _read_result_2_1_error_delayed_syndromeUInt_T_6,^_read_result_2_1_error_delayed_syndromeUInt_T_4,^
    _read_result_2_1_error_delayed_syndromeUInt_T_2,^_read_result_2_1_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_2_1_error_delayed_correctable = |read_result_2_1_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_2_1_error_delayed_uncorrectable_1 = ^ecc_data_delayed_17; // @[ECC.scala 87:27]
  wire  read_result_2_1_error_delayed_uncorrectable_2 = ~read_result_2_1_error_delayed_uncorrectable_1 &
    read_result_2_1_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_18_0 = bank_addrs_0_0 == 4'h2 & io_read_0_valid & io_read_0_bits_way_en[2]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_18_1 = bank_addrs_1_0 == 4'h2 & io_read_1_valid & io_read_1_bits_way_en[2]; // @[BankedDataArray.scala 351:102]
  wire [5:0] _sram_set_addr_T_37 = loadpipe_en_18_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_18 = readline_en_2 ? io_readline_bits_addr[11:6] : _sram_set_addr_T_37; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_36 = {loadpipe_en_18_1,loadpipe_en_18_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_18 = |_read_en_T_36 | readline_en_2; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_2_2_ecc = ecc_banks_2_2_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_2_2_raw_data = data_banks_2_2_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_18 = {read_result_2_2_ecc,read_result_2_2_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_18; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_18; // @[Reg.scala 16:16]
  wire [70:0] _read_result_2_2_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_18[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_2_2_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_18[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_2_2_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_18[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_2_2_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_18[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_2_2_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_18[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_2_2_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_18[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_2_2_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_18[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_2_2_error_delayed_syndromeUInt = {^_read_result_2_2_error_delayed_syndromeUInt_T_12,^
    _read_result_2_2_error_delayed_syndromeUInt_T_10,^_read_result_2_2_error_delayed_syndromeUInt_T_8,^
    _read_result_2_2_error_delayed_syndromeUInt_T_6,^_read_result_2_2_error_delayed_syndromeUInt_T_4,^
    _read_result_2_2_error_delayed_syndromeUInt_T_2,^_read_result_2_2_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_2_2_error_delayed_correctable = |read_result_2_2_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_2_2_error_delayed_uncorrectable_1 = ^ecc_data_delayed_18; // @[ECC.scala 87:27]
  wire  read_result_2_2_error_delayed_uncorrectable_2 = ~read_result_2_2_error_delayed_uncorrectable_1 &
    read_result_2_2_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_19_0 = bank_addrs_0_0 == 4'h2 & io_read_0_valid & io_read_0_bits_way_en[3]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_19_1 = bank_addrs_1_0 == 4'h2 & io_read_1_valid & io_read_1_bits_way_en[3]; // @[BankedDataArray.scala 351:102]
  wire [5:0] _sram_set_addr_T_39 = loadpipe_en_19_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_19 = readline_en_3 ? io_readline_bits_addr[11:6] : _sram_set_addr_T_39; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_38 = {loadpipe_en_19_1,loadpipe_en_19_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_19 = |_read_en_T_38 | readline_en_3; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_2_3_ecc = ecc_banks_2_3_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_2_3_raw_data = data_banks_2_3_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_19 = {read_result_2_3_ecc,read_result_2_3_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_19; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_19; // @[Reg.scala 16:16]
  wire [70:0] _read_result_2_3_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_19[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_2_3_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_19[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_2_3_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_19[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_2_3_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_19[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_2_3_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_19[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_2_3_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_19[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_2_3_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_19[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_2_3_error_delayed_syndromeUInt = {^_read_result_2_3_error_delayed_syndromeUInt_T_12,^
    _read_result_2_3_error_delayed_syndromeUInt_T_10,^_read_result_2_3_error_delayed_syndromeUInt_T_8,^
    _read_result_2_3_error_delayed_syndromeUInt_T_6,^_read_result_2_3_error_delayed_syndromeUInt_T_4,^
    _read_result_2_3_error_delayed_syndromeUInt_T_2,^_read_result_2_3_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_2_3_error_delayed_correctable = |read_result_2_3_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_2_3_error_delayed_uncorrectable_1 = ^ecc_data_delayed_19; // @[ECC.scala 87:27]
  wire  read_result_2_3_error_delayed_uncorrectable_2 = ~read_result_2_3_error_delayed_uncorrectable_1 &
    read_result_2_3_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_20_0 = bank_addrs_0_0 == 4'h2 & io_read_0_valid & io_read_0_bits_way_en[4]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_20_1 = bank_addrs_1_0 == 4'h2 & io_read_1_valid & io_read_1_bits_way_en[4]; // @[BankedDataArray.scala 351:102]
  wire [5:0] _sram_set_addr_T_41 = loadpipe_en_20_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_20 = readline_en_4 ? io_readline_bits_addr[11:6] : _sram_set_addr_T_41; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_40 = {loadpipe_en_20_1,loadpipe_en_20_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_20 = |_read_en_T_40 | readline_en_4; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_2_4_ecc = ecc_banks_2_4_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_2_4_raw_data = data_banks_2_4_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_20 = {read_result_2_4_ecc,read_result_2_4_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_20; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_20; // @[Reg.scala 16:16]
  wire [70:0] _read_result_2_4_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_20[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_2_4_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_20[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_2_4_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_20[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_2_4_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_20[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_2_4_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_20[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_2_4_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_20[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_2_4_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_20[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_2_4_error_delayed_syndromeUInt = {^_read_result_2_4_error_delayed_syndromeUInt_T_12,^
    _read_result_2_4_error_delayed_syndromeUInt_T_10,^_read_result_2_4_error_delayed_syndromeUInt_T_8,^
    _read_result_2_4_error_delayed_syndromeUInt_T_6,^_read_result_2_4_error_delayed_syndromeUInt_T_4,^
    _read_result_2_4_error_delayed_syndromeUInt_T_2,^_read_result_2_4_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_2_4_error_delayed_correctable = |read_result_2_4_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_2_4_error_delayed_uncorrectable_1 = ^ecc_data_delayed_20; // @[ECC.scala 87:27]
  wire  read_result_2_4_error_delayed_uncorrectable_2 = ~read_result_2_4_error_delayed_uncorrectable_1 &
    read_result_2_4_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_21_0 = bank_addrs_0_0 == 4'h2 & io_read_0_valid & io_read_0_bits_way_en[5]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_21_1 = bank_addrs_1_0 == 4'h2 & io_read_1_valid & io_read_1_bits_way_en[5]; // @[BankedDataArray.scala 351:102]
  wire [5:0] _sram_set_addr_T_43 = loadpipe_en_21_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_21 = readline_en_5 ? io_readline_bits_addr[11:6] : _sram_set_addr_T_43; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_42 = {loadpipe_en_21_1,loadpipe_en_21_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_21 = |_read_en_T_42 | readline_en_5; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_2_5_ecc = ecc_banks_2_5_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_2_5_raw_data = data_banks_2_5_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_21 = {read_result_2_5_ecc,read_result_2_5_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_21; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_21; // @[Reg.scala 16:16]
  wire [70:0] _read_result_2_5_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_21[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_2_5_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_21[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_2_5_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_21[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_2_5_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_21[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_2_5_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_21[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_2_5_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_21[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_2_5_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_21[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_2_5_error_delayed_syndromeUInt = {^_read_result_2_5_error_delayed_syndromeUInt_T_12,^
    _read_result_2_5_error_delayed_syndromeUInt_T_10,^_read_result_2_5_error_delayed_syndromeUInt_T_8,^
    _read_result_2_5_error_delayed_syndromeUInt_T_6,^_read_result_2_5_error_delayed_syndromeUInt_T_4,^
    _read_result_2_5_error_delayed_syndromeUInt_T_2,^_read_result_2_5_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_2_5_error_delayed_correctable = |read_result_2_5_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_2_5_error_delayed_uncorrectable_1 = ^ecc_data_delayed_21; // @[ECC.scala 87:27]
  wire  read_result_2_5_error_delayed_uncorrectable_2 = ~read_result_2_5_error_delayed_uncorrectable_1 &
    read_result_2_5_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_22_0 = bank_addrs_0_0 == 4'h2 & io_read_0_valid & io_read_0_bits_way_en[6]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_22_1 = bank_addrs_1_0 == 4'h2 & io_read_1_valid & io_read_1_bits_way_en[6]; // @[BankedDataArray.scala 351:102]
  wire [5:0] _sram_set_addr_T_45 = loadpipe_en_22_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_22 = readline_en_6 ? io_readline_bits_addr[11:6] : _sram_set_addr_T_45; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_44 = {loadpipe_en_22_1,loadpipe_en_22_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_22 = |_read_en_T_44 | readline_en_6; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_2_6_ecc = ecc_banks_2_6_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_2_6_raw_data = data_banks_2_6_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_22 = {read_result_2_6_ecc,read_result_2_6_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_22; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_22; // @[Reg.scala 16:16]
  wire [70:0] _read_result_2_6_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_22[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_2_6_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_22[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_2_6_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_22[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_2_6_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_22[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_2_6_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_22[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_2_6_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_22[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_2_6_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_22[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_2_6_error_delayed_syndromeUInt = {^_read_result_2_6_error_delayed_syndromeUInt_T_12,^
    _read_result_2_6_error_delayed_syndromeUInt_T_10,^_read_result_2_6_error_delayed_syndromeUInt_T_8,^
    _read_result_2_6_error_delayed_syndromeUInt_T_6,^_read_result_2_6_error_delayed_syndromeUInt_T_4,^
    _read_result_2_6_error_delayed_syndromeUInt_T_2,^_read_result_2_6_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_2_6_error_delayed_correctable = |read_result_2_6_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_2_6_error_delayed_uncorrectable_1 = ^ecc_data_delayed_22; // @[ECC.scala 87:27]
  wire  read_result_2_6_error_delayed_uncorrectable_2 = ~read_result_2_6_error_delayed_uncorrectable_1 &
    read_result_2_6_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_23_0 = bank_addrs_0_0 == 4'h2 & io_read_0_valid & io_read_0_bits_way_en[7]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_23_1 = bank_addrs_1_0 == 4'h2 & io_read_1_valid & io_read_1_bits_way_en[7]; // @[BankedDataArray.scala 351:102]
  wire [5:0] _sram_set_addr_T_47 = loadpipe_en_23_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_23 = readline_en_7 ? io_readline_bits_addr[11:6] : _sram_set_addr_T_47; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_46 = {loadpipe_en_23_1,loadpipe_en_23_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_23 = |_read_en_T_46 | readline_en_7; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_2_7_ecc = ecc_banks_2_7_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_2_7_raw_data = data_banks_2_7_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_23 = {read_result_2_7_ecc,read_result_2_7_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_23; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_23; // @[Reg.scala 16:16]
  wire [70:0] _read_result_2_7_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_23[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_2_7_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_23[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_2_7_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_23[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_2_7_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_23[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_2_7_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_23[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_2_7_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_23[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_2_7_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_23[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_2_7_error_delayed_syndromeUInt = {^_read_result_2_7_error_delayed_syndromeUInt_T_12,^
    _read_result_2_7_error_delayed_syndromeUInt_T_10,^_read_result_2_7_error_delayed_syndromeUInt_T_8,^
    _read_result_2_7_error_delayed_syndromeUInt_T_6,^_read_result_2_7_error_delayed_syndromeUInt_T_4,^
    _read_result_2_7_error_delayed_syndromeUInt_T_2,^_read_result_2_7_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_2_7_error_delayed_correctable = |read_result_2_7_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_2_7_error_delayed_uncorrectable_1 = ^ecc_data_delayed_23; // @[ECC.scala 87:27]
  wire  read_result_2_7_error_delayed_uncorrectable_2 = ~read_result_2_7_error_delayed_uncorrectable_1 &
    read_result_2_7_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_24_0 = bank_addrs_0_0 == 4'h3 & io_read_0_valid & io_read_0_bits_way_en[0]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_24_1 = bank_addrs_1_0 == 4'h3 & io_read_1_valid & io_read_1_bits_way_en[0]; // @[BankedDataArray.scala 351:102]
  wire [5:0] _sram_set_addr_T_49 = loadpipe_en_24_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_24 = readline_en ? io_readline_bits_addr[11:6] : _sram_set_addr_T_49; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_48 = {loadpipe_en_24_1,loadpipe_en_24_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_24 = |_read_en_T_48 | readline_en; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_3_0_ecc = ecc_banks_3_0_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_3_0_raw_data = data_banks_3_0_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_24 = {read_result_3_0_ecc,read_result_3_0_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_24; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_24; // @[Reg.scala 16:16]
  wire [70:0] _read_result_3_0_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_24[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_3_0_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_24[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_3_0_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_24[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_3_0_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_24[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_3_0_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_24[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_3_0_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_24[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_3_0_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_24[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_3_0_error_delayed_syndromeUInt = {^_read_result_3_0_error_delayed_syndromeUInt_T_12,^
    _read_result_3_0_error_delayed_syndromeUInt_T_10,^_read_result_3_0_error_delayed_syndromeUInt_T_8,^
    _read_result_3_0_error_delayed_syndromeUInt_T_6,^_read_result_3_0_error_delayed_syndromeUInt_T_4,^
    _read_result_3_0_error_delayed_syndromeUInt_T_2,^_read_result_3_0_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_3_0_error_delayed_correctable = |read_result_3_0_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_3_0_error_delayed_uncorrectable_1 = ^ecc_data_delayed_24; // @[ECC.scala 87:27]
  wire  read_result_3_0_error_delayed_uncorrectable_2 = ~read_result_3_0_error_delayed_uncorrectable_1 &
    read_result_3_0_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_25_0 = bank_addrs_0_0 == 4'h3 & io_read_0_valid & io_read_0_bits_way_en[1]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_25_1 = bank_addrs_1_0 == 4'h3 & io_read_1_valid & io_read_1_bits_way_en[1]; // @[BankedDataArray.scala 351:102]
  wire [5:0] _sram_set_addr_T_51 = loadpipe_en_25_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_25 = readline_en_1 ? io_readline_bits_addr[11:6] : _sram_set_addr_T_51; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_50 = {loadpipe_en_25_1,loadpipe_en_25_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_25 = |_read_en_T_50 | readline_en_1; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_3_1_ecc = ecc_banks_3_1_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_3_1_raw_data = data_banks_3_1_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_25 = {read_result_3_1_ecc,read_result_3_1_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_25; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_25; // @[Reg.scala 16:16]
  wire [70:0] _read_result_3_1_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_25[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_3_1_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_25[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_3_1_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_25[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_3_1_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_25[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_3_1_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_25[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_3_1_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_25[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_3_1_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_25[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_3_1_error_delayed_syndromeUInt = {^_read_result_3_1_error_delayed_syndromeUInt_T_12,^
    _read_result_3_1_error_delayed_syndromeUInt_T_10,^_read_result_3_1_error_delayed_syndromeUInt_T_8,^
    _read_result_3_1_error_delayed_syndromeUInt_T_6,^_read_result_3_1_error_delayed_syndromeUInt_T_4,^
    _read_result_3_1_error_delayed_syndromeUInt_T_2,^_read_result_3_1_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_3_1_error_delayed_correctable = |read_result_3_1_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_3_1_error_delayed_uncorrectable_1 = ^ecc_data_delayed_25; // @[ECC.scala 87:27]
  wire  read_result_3_1_error_delayed_uncorrectable_2 = ~read_result_3_1_error_delayed_uncorrectable_1 &
    read_result_3_1_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_26_0 = bank_addrs_0_0 == 4'h3 & io_read_0_valid & io_read_0_bits_way_en[2]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_26_1 = bank_addrs_1_0 == 4'h3 & io_read_1_valid & io_read_1_bits_way_en[2]; // @[BankedDataArray.scala 351:102]
  wire [5:0] _sram_set_addr_T_53 = loadpipe_en_26_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_26 = readline_en_2 ? io_readline_bits_addr[11:6] : _sram_set_addr_T_53; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_52 = {loadpipe_en_26_1,loadpipe_en_26_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_26 = |_read_en_T_52 | readline_en_2; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_3_2_ecc = ecc_banks_3_2_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_3_2_raw_data = data_banks_3_2_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_26 = {read_result_3_2_ecc,read_result_3_2_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_26; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_26; // @[Reg.scala 16:16]
  wire [70:0] _read_result_3_2_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_26[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_3_2_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_26[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_3_2_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_26[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_3_2_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_26[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_3_2_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_26[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_3_2_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_26[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_3_2_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_26[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_3_2_error_delayed_syndromeUInt = {^_read_result_3_2_error_delayed_syndromeUInt_T_12,^
    _read_result_3_2_error_delayed_syndromeUInt_T_10,^_read_result_3_2_error_delayed_syndromeUInt_T_8,^
    _read_result_3_2_error_delayed_syndromeUInt_T_6,^_read_result_3_2_error_delayed_syndromeUInt_T_4,^
    _read_result_3_2_error_delayed_syndromeUInt_T_2,^_read_result_3_2_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_3_2_error_delayed_correctable = |read_result_3_2_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_3_2_error_delayed_uncorrectable_1 = ^ecc_data_delayed_26; // @[ECC.scala 87:27]
  wire  read_result_3_2_error_delayed_uncorrectable_2 = ~read_result_3_2_error_delayed_uncorrectable_1 &
    read_result_3_2_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_27_0 = bank_addrs_0_0 == 4'h3 & io_read_0_valid & io_read_0_bits_way_en[3]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_27_1 = bank_addrs_1_0 == 4'h3 & io_read_1_valid & io_read_1_bits_way_en[3]; // @[BankedDataArray.scala 351:102]
  wire [5:0] _sram_set_addr_T_55 = loadpipe_en_27_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_27 = readline_en_3 ? io_readline_bits_addr[11:6] : _sram_set_addr_T_55; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_54 = {loadpipe_en_27_1,loadpipe_en_27_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_27 = |_read_en_T_54 | readline_en_3; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_3_3_ecc = ecc_banks_3_3_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_3_3_raw_data = data_banks_3_3_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_27 = {read_result_3_3_ecc,read_result_3_3_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_27; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_27; // @[Reg.scala 16:16]
  wire [70:0] _read_result_3_3_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_27[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_3_3_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_27[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_3_3_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_27[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_3_3_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_27[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_3_3_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_27[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_3_3_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_27[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_3_3_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_27[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_3_3_error_delayed_syndromeUInt = {^_read_result_3_3_error_delayed_syndromeUInt_T_12,^
    _read_result_3_3_error_delayed_syndromeUInt_T_10,^_read_result_3_3_error_delayed_syndromeUInt_T_8,^
    _read_result_3_3_error_delayed_syndromeUInt_T_6,^_read_result_3_3_error_delayed_syndromeUInt_T_4,^
    _read_result_3_3_error_delayed_syndromeUInt_T_2,^_read_result_3_3_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_3_3_error_delayed_correctable = |read_result_3_3_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_3_3_error_delayed_uncorrectable_1 = ^ecc_data_delayed_27; // @[ECC.scala 87:27]
  wire  read_result_3_3_error_delayed_uncorrectable_2 = ~read_result_3_3_error_delayed_uncorrectable_1 &
    read_result_3_3_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_28_0 = bank_addrs_0_0 == 4'h3 & io_read_0_valid & io_read_0_bits_way_en[4]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_28_1 = bank_addrs_1_0 == 4'h3 & io_read_1_valid & io_read_1_bits_way_en[4]; // @[BankedDataArray.scala 351:102]
  wire [5:0] _sram_set_addr_T_57 = loadpipe_en_28_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_28 = readline_en_4 ? io_readline_bits_addr[11:6] : _sram_set_addr_T_57; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_56 = {loadpipe_en_28_1,loadpipe_en_28_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_28 = |_read_en_T_56 | readline_en_4; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_3_4_ecc = ecc_banks_3_4_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_3_4_raw_data = data_banks_3_4_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_28 = {read_result_3_4_ecc,read_result_3_4_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_28; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_28; // @[Reg.scala 16:16]
  wire [70:0] _read_result_3_4_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_28[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_3_4_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_28[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_3_4_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_28[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_3_4_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_28[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_3_4_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_28[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_3_4_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_28[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_3_4_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_28[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_3_4_error_delayed_syndromeUInt = {^_read_result_3_4_error_delayed_syndromeUInt_T_12,^
    _read_result_3_4_error_delayed_syndromeUInt_T_10,^_read_result_3_4_error_delayed_syndromeUInt_T_8,^
    _read_result_3_4_error_delayed_syndromeUInt_T_6,^_read_result_3_4_error_delayed_syndromeUInt_T_4,^
    _read_result_3_4_error_delayed_syndromeUInt_T_2,^_read_result_3_4_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_3_4_error_delayed_correctable = |read_result_3_4_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_3_4_error_delayed_uncorrectable_1 = ^ecc_data_delayed_28; // @[ECC.scala 87:27]
  wire  read_result_3_4_error_delayed_uncorrectable_2 = ~read_result_3_4_error_delayed_uncorrectable_1 &
    read_result_3_4_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_29_0 = bank_addrs_0_0 == 4'h3 & io_read_0_valid & io_read_0_bits_way_en[5]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_29_1 = bank_addrs_1_0 == 4'h3 & io_read_1_valid & io_read_1_bits_way_en[5]; // @[BankedDataArray.scala 351:102]
  wire [5:0] _sram_set_addr_T_59 = loadpipe_en_29_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_29 = readline_en_5 ? io_readline_bits_addr[11:6] : _sram_set_addr_T_59; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_58 = {loadpipe_en_29_1,loadpipe_en_29_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_29 = |_read_en_T_58 | readline_en_5; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_3_5_ecc = ecc_banks_3_5_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_3_5_raw_data = data_banks_3_5_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_29 = {read_result_3_5_ecc,read_result_3_5_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_29; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_29; // @[Reg.scala 16:16]
  wire [70:0] _read_result_3_5_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_29[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_3_5_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_29[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_3_5_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_29[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_3_5_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_29[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_3_5_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_29[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_3_5_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_29[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_3_5_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_29[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_3_5_error_delayed_syndromeUInt = {^_read_result_3_5_error_delayed_syndromeUInt_T_12,^
    _read_result_3_5_error_delayed_syndromeUInt_T_10,^_read_result_3_5_error_delayed_syndromeUInt_T_8,^
    _read_result_3_5_error_delayed_syndromeUInt_T_6,^_read_result_3_5_error_delayed_syndromeUInt_T_4,^
    _read_result_3_5_error_delayed_syndromeUInt_T_2,^_read_result_3_5_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_3_5_error_delayed_correctable = |read_result_3_5_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_3_5_error_delayed_uncorrectable_1 = ^ecc_data_delayed_29; // @[ECC.scala 87:27]
  wire  read_result_3_5_error_delayed_uncorrectable_2 = ~read_result_3_5_error_delayed_uncorrectable_1 &
    read_result_3_5_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_30_0 = bank_addrs_0_0 == 4'h3 & io_read_0_valid & io_read_0_bits_way_en[6]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_30_1 = bank_addrs_1_0 == 4'h3 & io_read_1_valid & io_read_1_bits_way_en[6]; // @[BankedDataArray.scala 351:102]
  wire [5:0] _sram_set_addr_T_61 = loadpipe_en_30_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_30 = readline_en_6 ? io_readline_bits_addr[11:6] : _sram_set_addr_T_61; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_60 = {loadpipe_en_30_1,loadpipe_en_30_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_30 = |_read_en_T_60 | readline_en_6; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_3_6_ecc = ecc_banks_3_6_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_3_6_raw_data = data_banks_3_6_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_30 = {read_result_3_6_ecc,read_result_3_6_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_30; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_30; // @[Reg.scala 16:16]
  wire [70:0] _read_result_3_6_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_30[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_3_6_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_30[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_3_6_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_30[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_3_6_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_30[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_3_6_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_30[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_3_6_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_30[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_3_6_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_30[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_3_6_error_delayed_syndromeUInt = {^_read_result_3_6_error_delayed_syndromeUInt_T_12,^
    _read_result_3_6_error_delayed_syndromeUInt_T_10,^_read_result_3_6_error_delayed_syndromeUInt_T_8,^
    _read_result_3_6_error_delayed_syndromeUInt_T_6,^_read_result_3_6_error_delayed_syndromeUInt_T_4,^
    _read_result_3_6_error_delayed_syndromeUInt_T_2,^_read_result_3_6_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_3_6_error_delayed_correctable = |read_result_3_6_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_3_6_error_delayed_uncorrectable_1 = ^ecc_data_delayed_30; // @[ECC.scala 87:27]
  wire  read_result_3_6_error_delayed_uncorrectable_2 = ~read_result_3_6_error_delayed_uncorrectable_1 &
    read_result_3_6_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_31_0 = bank_addrs_0_0 == 4'h3 & io_read_0_valid & io_read_0_bits_way_en[7]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_31_1 = bank_addrs_1_0 == 4'h3 & io_read_1_valid & io_read_1_bits_way_en[7]; // @[BankedDataArray.scala 351:102]
  wire [5:0] _sram_set_addr_T_63 = loadpipe_en_31_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_31 = readline_en_7 ? io_readline_bits_addr[11:6] : _sram_set_addr_T_63; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_62 = {loadpipe_en_31_1,loadpipe_en_31_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_31 = |_read_en_T_62 | readline_en_7; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_3_7_ecc = ecc_banks_3_7_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_3_7_raw_data = data_banks_3_7_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_31 = {read_result_3_7_ecc,read_result_3_7_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_31; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_31; // @[Reg.scala 16:16]
  wire [70:0] _read_result_3_7_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_31[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_3_7_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_31[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_3_7_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_31[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_3_7_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_31[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_3_7_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_31[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_3_7_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_31[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_3_7_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_31[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_3_7_error_delayed_syndromeUInt = {^_read_result_3_7_error_delayed_syndromeUInt_T_12,^
    _read_result_3_7_error_delayed_syndromeUInt_T_10,^_read_result_3_7_error_delayed_syndromeUInt_T_8,^
    _read_result_3_7_error_delayed_syndromeUInt_T_6,^_read_result_3_7_error_delayed_syndromeUInt_T_4,^
    _read_result_3_7_error_delayed_syndromeUInt_T_2,^_read_result_3_7_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_3_7_error_delayed_correctable = |read_result_3_7_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_3_7_error_delayed_uncorrectable_1 = ^ecc_data_delayed_31; // @[ECC.scala 87:27]
  wire  read_result_3_7_error_delayed_uncorrectable_2 = ~read_result_3_7_error_delayed_uncorrectable_1 &
    read_result_3_7_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_32_0 = bank_addrs_0_0 == 4'h4 & io_read_0_valid & io_read_0_bits_way_en[0]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_32_1 = bank_addrs_1_0 == 4'h4 & io_read_1_valid & io_read_1_bits_way_en[0]; // @[BankedDataArray.scala 351:102]
  wire [5:0] _sram_set_addr_T_65 = loadpipe_en_32_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_32 = readline_en ? io_readline_bits_addr[11:6] : _sram_set_addr_T_65; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_64 = {loadpipe_en_32_1,loadpipe_en_32_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_32 = |_read_en_T_64 | readline_en; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_4_0_ecc = ecc_banks_4_0_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_4_0_raw_data = data_banks_4_0_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_32 = {read_result_4_0_ecc,read_result_4_0_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_32; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_32; // @[Reg.scala 16:16]
  wire [70:0] _read_result_4_0_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_32[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_4_0_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_32[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_4_0_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_32[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_4_0_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_32[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_4_0_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_32[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_4_0_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_32[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_4_0_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_32[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_4_0_error_delayed_syndromeUInt = {^_read_result_4_0_error_delayed_syndromeUInt_T_12,^
    _read_result_4_0_error_delayed_syndromeUInt_T_10,^_read_result_4_0_error_delayed_syndromeUInt_T_8,^
    _read_result_4_0_error_delayed_syndromeUInt_T_6,^_read_result_4_0_error_delayed_syndromeUInt_T_4,^
    _read_result_4_0_error_delayed_syndromeUInt_T_2,^_read_result_4_0_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_4_0_error_delayed_correctable = |read_result_4_0_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_4_0_error_delayed_uncorrectable_1 = ^ecc_data_delayed_32; // @[ECC.scala 87:27]
  wire  read_result_4_0_error_delayed_uncorrectable_2 = ~read_result_4_0_error_delayed_uncorrectable_1 &
    read_result_4_0_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_33_0 = bank_addrs_0_0 == 4'h4 & io_read_0_valid & io_read_0_bits_way_en[1]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_33_1 = bank_addrs_1_0 == 4'h4 & io_read_1_valid & io_read_1_bits_way_en[1]; // @[BankedDataArray.scala 351:102]
  wire [5:0] _sram_set_addr_T_67 = loadpipe_en_33_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_33 = readline_en_1 ? io_readline_bits_addr[11:6] : _sram_set_addr_T_67; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_66 = {loadpipe_en_33_1,loadpipe_en_33_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_33 = |_read_en_T_66 | readline_en_1; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_4_1_ecc = ecc_banks_4_1_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_4_1_raw_data = data_banks_4_1_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_33 = {read_result_4_1_ecc,read_result_4_1_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_33; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_33; // @[Reg.scala 16:16]
  wire [70:0] _read_result_4_1_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_33[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_4_1_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_33[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_4_1_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_33[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_4_1_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_33[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_4_1_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_33[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_4_1_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_33[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_4_1_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_33[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_4_1_error_delayed_syndromeUInt = {^_read_result_4_1_error_delayed_syndromeUInt_T_12,^
    _read_result_4_1_error_delayed_syndromeUInt_T_10,^_read_result_4_1_error_delayed_syndromeUInt_T_8,^
    _read_result_4_1_error_delayed_syndromeUInt_T_6,^_read_result_4_1_error_delayed_syndromeUInt_T_4,^
    _read_result_4_1_error_delayed_syndromeUInt_T_2,^_read_result_4_1_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_4_1_error_delayed_correctable = |read_result_4_1_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_4_1_error_delayed_uncorrectable_1 = ^ecc_data_delayed_33; // @[ECC.scala 87:27]
  wire  read_result_4_1_error_delayed_uncorrectable_2 = ~read_result_4_1_error_delayed_uncorrectable_1 &
    read_result_4_1_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_34_0 = bank_addrs_0_0 == 4'h4 & io_read_0_valid & io_read_0_bits_way_en[2]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_34_1 = bank_addrs_1_0 == 4'h4 & io_read_1_valid & io_read_1_bits_way_en[2]; // @[BankedDataArray.scala 351:102]
  wire [5:0] _sram_set_addr_T_69 = loadpipe_en_34_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_34 = readline_en_2 ? io_readline_bits_addr[11:6] : _sram_set_addr_T_69; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_68 = {loadpipe_en_34_1,loadpipe_en_34_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_34 = |_read_en_T_68 | readline_en_2; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_4_2_ecc = ecc_banks_4_2_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_4_2_raw_data = data_banks_4_2_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_34 = {read_result_4_2_ecc,read_result_4_2_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_34; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_34; // @[Reg.scala 16:16]
  wire [70:0] _read_result_4_2_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_34[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_4_2_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_34[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_4_2_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_34[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_4_2_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_34[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_4_2_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_34[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_4_2_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_34[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_4_2_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_34[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_4_2_error_delayed_syndromeUInt = {^_read_result_4_2_error_delayed_syndromeUInt_T_12,^
    _read_result_4_2_error_delayed_syndromeUInt_T_10,^_read_result_4_2_error_delayed_syndromeUInt_T_8,^
    _read_result_4_2_error_delayed_syndromeUInt_T_6,^_read_result_4_2_error_delayed_syndromeUInt_T_4,^
    _read_result_4_2_error_delayed_syndromeUInt_T_2,^_read_result_4_2_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_4_2_error_delayed_correctable = |read_result_4_2_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_4_2_error_delayed_uncorrectable_1 = ^ecc_data_delayed_34; // @[ECC.scala 87:27]
  wire  read_result_4_2_error_delayed_uncorrectable_2 = ~read_result_4_2_error_delayed_uncorrectable_1 &
    read_result_4_2_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_35_0 = bank_addrs_0_0 == 4'h4 & io_read_0_valid & io_read_0_bits_way_en[3]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_35_1 = bank_addrs_1_0 == 4'h4 & io_read_1_valid & io_read_1_bits_way_en[3]; // @[BankedDataArray.scala 351:102]
  wire [5:0] _sram_set_addr_T_71 = loadpipe_en_35_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_35 = readline_en_3 ? io_readline_bits_addr[11:6] : _sram_set_addr_T_71; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_70 = {loadpipe_en_35_1,loadpipe_en_35_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_35 = |_read_en_T_70 | readline_en_3; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_4_3_ecc = ecc_banks_4_3_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_4_3_raw_data = data_banks_4_3_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_35 = {read_result_4_3_ecc,read_result_4_3_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_35; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_35; // @[Reg.scala 16:16]
  wire [70:0] _read_result_4_3_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_35[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_4_3_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_35[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_4_3_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_35[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_4_3_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_35[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_4_3_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_35[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_4_3_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_35[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_4_3_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_35[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_4_3_error_delayed_syndromeUInt = {^_read_result_4_3_error_delayed_syndromeUInt_T_12,^
    _read_result_4_3_error_delayed_syndromeUInt_T_10,^_read_result_4_3_error_delayed_syndromeUInt_T_8,^
    _read_result_4_3_error_delayed_syndromeUInt_T_6,^_read_result_4_3_error_delayed_syndromeUInt_T_4,^
    _read_result_4_3_error_delayed_syndromeUInt_T_2,^_read_result_4_3_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_4_3_error_delayed_correctable = |read_result_4_3_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_4_3_error_delayed_uncorrectable_1 = ^ecc_data_delayed_35; // @[ECC.scala 87:27]
  wire  read_result_4_3_error_delayed_uncorrectable_2 = ~read_result_4_3_error_delayed_uncorrectable_1 &
    read_result_4_3_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_36_0 = bank_addrs_0_0 == 4'h4 & io_read_0_valid & io_read_0_bits_way_en[4]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_36_1 = bank_addrs_1_0 == 4'h4 & io_read_1_valid & io_read_1_bits_way_en[4]; // @[BankedDataArray.scala 351:102]
  wire [5:0] _sram_set_addr_T_73 = loadpipe_en_36_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_36 = readline_en_4 ? io_readline_bits_addr[11:6] : _sram_set_addr_T_73; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_72 = {loadpipe_en_36_1,loadpipe_en_36_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_36 = |_read_en_T_72 | readline_en_4; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_4_4_ecc = ecc_banks_4_4_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_4_4_raw_data = data_banks_4_4_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_36 = {read_result_4_4_ecc,read_result_4_4_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_36; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_36; // @[Reg.scala 16:16]
  wire [70:0] _read_result_4_4_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_36[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_4_4_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_36[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_4_4_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_36[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_4_4_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_36[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_4_4_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_36[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_4_4_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_36[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_4_4_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_36[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_4_4_error_delayed_syndromeUInt = {^_read_result_4_4_error_delayed_syndromeUInt_T_12,^
    _read_result_4_4_error_delayed_syndromeUInt_T_10,^_read_result_4_4_error_delayed_syndromeUInt_T_8,^
    _read_result_4_4_error_delayed_syndromeUInt_T_6,^_read_result_4_4_error_delayed_syndromeUInt_T_4,^
    _read_result_4_4_error_delayed_syndromeUInt_T_2,^_read_result_4_4_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_4_4_error_delayed_correctable = |read_result_4_4_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_4_4_error_delayed_uncorrectable_1 = ^ecc_data_delayed_36; // @[ECC.scala 87:27]
  wire  read_result_4_4_error_delayed_uncorrectable_2 = ~read_result_4_4_error_delayed_uncorrectable_1 &
    read_result_4_4_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_37_0 = bank_addrs_0_0 == 4'h4 & io_read_0_valid & io_read_0_bits_way_en[5]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_37_1 = bank_addrs_1_0 == 4'h4 & io_read_1_valid & io_read_1_bits_way_en[5]; // @[BankedDataArray.scala 351:102]
  wire [5:0] _sram_set_addr_T_75 = loadpipe_en_37_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_37 = readline_en_5 ? io_readline_bits_addr[11:6] : _sram_set_addr_T_75; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_74 = {loadpipe_en_37_1,loadpipe_en_37_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_37 = |_read_en_T_74 | readline_en_5; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_4_5_ecc = ecc_banks_4_5_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_4_5_raw_data = data_banks_4_5_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_37 = {read_result_4_5_ecc,read_result_4_5_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_37; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_37; // @[Reg.scala 16:16]
  wire [70:0] _read_result_4_5_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_37[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_4_5_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_37[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_4_5_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_37[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_4_5_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_37[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_4_5_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_37[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_4_5_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_37[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_4_5_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_37[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_4_5_error_delayed_syndromeUInt = {^_read_result_4_5_error_delayed_syndromeUInt_T_12,^
    _read_result_4_5_error_delayed_syndromeUInt_T_10,^_read_result_4_5_error_delayed_syndromeUInt_T_8,^
    _read_result_4_5_error_delayed_syndromeUInt_T_6,^_read_result_4_5_error_delayed_syndromeUInt_T_4,^
    _read_result_4_5_error_delayed_syndromeUInt_T_2,^_read_result_4_5_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_4_5_error_delayed_correctable = |read_result_4_5_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_4_5_error_delayed_uncorrectable_1 = ^ecc_data_delayed_37; // @[ECC.scala 87:27]
  wire  read_result_4_5_error_delayed_uncorrectable_2 = ~read_result_4_5_error_delayed_uncorrectable_1 &
    read_result_4_5_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_38_0 = bank_addrs_0_0 == 4'h4 & io_read_0_valid & io_read_0_bits_way_en[6]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_38_1 = bank_addrs_1_0 == 4'h4 & io_read_1_valid & io_read_1_bits_way_en[6]; // @[BankedDataArray.scala 351:102]
  wire [5:0] _sram_set_addr_T_77 = loadpipe_en_38_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_38 = readline_en_6 ? io_readline_bits_addr[11:6] : _sram_set_addr_T_77; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_76 = {loadpipe_en_38_1,loadpipe_en_38_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_38 = |_read_en_T_76 | readline_en_6; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_4_6_ecc = ecc_banks_4_6_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_4_6_raw_data = data_banks_4_6_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_38 = {read_result_4_6_ecc,read_result_4_6_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_38; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_38; // @[Reg.scala 16:16]
  wire [70:0] _read_result_4_6_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_38[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_4_6_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_38[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_4_6_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_38[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_4_6_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_38[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_4_6_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_38[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_4_6_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_38[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_4_6_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_38[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_4_6_error_delayed_syndromeUInt = {^_read_result_4_6_error_delayed_syndromeUInt_T_12,^
    _read_result_4_6_error_delayed_syndromeUInt_T_10,^_read_result_4_6_error_delayed_syndromeUInt_T_8,^
    _read_result_4_6_error_delayed_syndromeUInt_T_6,^_read_result_4_6_error_delayed_syndromeUInt_T_4,^
    _read_result_4_6_error_delayed_syndromeUInt_T_2,^_read_result_4_6_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_4_6_error_delayed_correctable = |read_result_4_6_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_4_6_error_delayed_uncorrectable_1 = ^ecc_data_delayed_38; // @[ECC.scala 87:27]
  wire  read_result_4_6_error_delayed_uncorrectable_2 = ~read_result_4_6_error_delayed_uncorrectable_1 &
    read_result_4_6_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_39_0 = bank_addrs_0_0 == 4'h4 & io_read_0_valid & io_read_0_bits_way_en[7]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_39_1 = bank_addrs_1_0 == 4'h4 & io_read_1_valid & io_read_1_bits_way_en[7]; // @[BankedDataArray.scala 351:102]
  wire [5:0] _sram_set_addr_T_79 = loadpipe_en_39_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_39 = readline_en_7 ? io_readline_bits_addr[11:6] : _sram_set_addr_T_79; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_78 = {loadpipe_en_39_1,loadpipe_en_39_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_39 = |_read_en_T_78 | readline_en_7; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_4_7_ecc = ecc_banks_4_7_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_4_7_raw_data = data_banks_4_7_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_39 = {read_result_4_7_ecc,read_result_4_7_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_39; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_39; // @[Reg.scala 16:16]
  wire [70:0] _read_result_4_7_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_39[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_4_7_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_39[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_4_7_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_39[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_4_7_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_39[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_4_7_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_39[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_4_7_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_39[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_4_7_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_39[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_4_7_error_delayed_syndromeUInt = {^_read_result_4_7_error_delayed_syndromeUInt_T_12,^
    _read_result_4_7_error_delayed_syndromeUInt_T_10,^_read_result_4_7_error_delayed_syndromeUInt_T_8,^
    _read_result_4_7_error_delayed_syndromeUInt_T_6,^_read_result_4_7_error_delayed_syndromeUInt_T_4,^
    _read_result_4_7_error_delayed_syndromeUInt_T_2,^_read_result_4_7_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_4_7_error_delayed_correctable = |read_result_4_7_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_4_7_error_delayed_uncorrectable_1 = ^ecc_data_delayed_39; // @[ECC.scala 87:27]
  wire  read_result_4_7_error_delayed_uncorrectable_2 = ~read_result_4_7_error_delayed_uncorrectable_1 &
    read_result_4_7_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_40_0 = bank_addrs_0_0 == 4'h5 & io_read_0_valid & io_read_0_bits_way_en[0]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_40_1 = bank_addrs_1_0 == 4'h5 & io_read_1_valid & io_read_1_bits_way_en[0]; // @[BankedDataArray.scala 351:102]
  wire [5:0] _sram_set_addr_T_81 = loadpipe_en_40_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_40 = readline_en ? io_readline_bits_addr[11:6] : _sram_set_addr_T_81; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_80 = {loadpipe_en_40_1,loadpipe_en_40_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_40 = |_read_en_T_80 | readline_en; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_5_0_ecc = ecc_banks_5_0_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_5_0_raw_data = data_banks_5_0_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_40 = {read_result_5_0_ecc,read_result_5_0_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_40; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_40; // @[Reg.scala 16:16]
  wire [70:0] _read_result_5_0_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_40[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_5_0_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_40[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_5_0_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_40[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_5_0_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_40[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_5_0_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_40[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_5_0_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_40[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_5_0_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_40[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_5_0_error_delayed_syndromeUInt = {^_read_result_5_0_error_delayed_syndromeUInt_T_12,^
    _read_result_5_0_error_delayed_syndromeUInt_T_10,^_read_result_5_0_error_delayed_syndromeUInt_T_8,^
    _read_result_5_0_error_delayed_syndromeUInt_T_6,^_read_result_5_0_error_delayed_syndromeUInt_T_4,^
    _read_result_5_0_error_delayed_syndromeUInt_T_2,^_read_result_5_0_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_5_0_error_delayed_correctable = |read_result_5_0_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_5_0_error_delayed_uncorrectable_1 = ^ecc_data_delayed_40; // @[ECC.scala 87:27]
  wire  read_result_5_0_error_delayed_uncorrectable_2 = ~read_result_5_0_error_delayed_uncorrectable_1 &
    read_result_5_0_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_41_0 = bank_addrs_0_0 == 4'h5 & io_read_0_valid & io_read_0_bits_way_en[1]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_41_1 = bank_addrs_1_0 == 4'h5 & io_read_1_valid & io_read_1_bits_way_en[1]; // @[BankedDataArray.scala 351:102]
  wire [5:0] _sram_set_addr_T_83 = loadpipe_en_41_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_41 = readline_en_1 ? io_readline_bits_addr[11:6] : _sram_set_addr_T_83; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_82 = {loadpipe_en_41_1,loadpipe_en_41_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_41 = |_read_en_T_82 | readline_en_1; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_5_1_ecc = ecc_banks_5_1_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_5_1_raw_data = data_banks_5_1_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_41 = {read_result_5_1_ecc,read_result_5_1_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_41; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_41; // @[Reg.scala 16:16]
  wire [70:0] _read_result_5_1_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_41[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_5_1_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_41[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_5_1_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_41[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_5_1_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_41[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_5_1_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_41[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_5_1_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_41[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_5_1_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_41[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_5_1_error_delayed_syndromeUInt = {^_read_result_5_1_error_delayed_syndromeUInt_T_12,^
    _read_result_5_1_error_delayed_syndromeUInt_T_10,^_read_result_5_1_error_delayed_syndromeUInt_T_8,^
    _read_result_5_1_error_delayed_syndromeUInt_T_6,^_read_result_5_1_error_delayed_syndromeUInt_T_4,^
    _read_result_5_1_error_delayed_syndromeUInt_T_2,^_read_result_5_1_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_5_1_error_delayed_correctable = |read_result_5_1_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_5_1_error_delayed_uncorrectable_1 = ^ecc_data_delayed_41; // @[ECC.scala 87:27]
  wire  read_result_5_1_error_delayed_uncorrectable_2 = ~read_result_5_1_error_delayed_uncorrectable_1 &
    read_result_5_1_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_42_0 = bank_addrs_0_0 == 4'h5 & io_read_0_valid & io_read_0_bits_way_en[2]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_42_1 = bank_addrs_1_0 == 4'h5 & io_read_1_valid & io_read_1_bits_way_en[2]; // @[BankedDataArray.scala 351:102]
  wire [5:0] _sram_set_addr_T_85 = loadpipe_en_42_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_42 = readline_en_2 ? io_readline_bits_addr[11:6] : _sram_set_addr_T_85; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_84 = {loadpipe_en_42_1,loadpipe_en_42_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_42 = |_read_en_T_84 | readline_en_2; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_5_2_ecc = ecc_banks_5_2_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_5_2_raw_data = data_banks_5_2_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_42 = {read_result_5_2_ecc,read_result_5_2_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_42; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_42; // @[Reg.scala 16:16]
  wire [70:0] _read_result_5_2_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_42[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_5_2_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_42[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_5_2_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_42[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_5_2_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_42[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_5_2_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_42[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_5_2_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_42[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_5_2_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_42[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_5_2_error_delayed_syndromeUInt = {^_read_result_5_2_error_delayed_syndromeUInt_T_12,^
    _read_result_5_2_error_delayed_syndromeUInt_T_10,^_read_result_5_2_error_delayed_syndromeUInt_T_8,^
    _read_result_5_2_error_delayed_syndromeUInt_T_6,^_read_result_5_2_error_delayed_syndromeUInt_T_4,^
    _read_result_5_2_error_delayed_syndromeUInt_T_2,^_read_result_5_2_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_5_2_error_delayed_correctable = |read_result_5_2_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_5_2_error_delayed_uncorrectable_1 = ^ecc_data_delayed_42; // @[ECC.scala 87:27]
  wire  read_result_5_2_error_delayed_uncorrectable_2 = ~read_result_5_2_error_delayed_uncorrectable_1 &
    read_result_5_2_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_43_0 = bank_addrs_0_0 == 4'h5 & io_read_0_valid & io_read_0_bits_way_en[3]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_43_1 = bank_addrs_1_0 == 4'h5 & io_read_1_valid & io_read_1_bits_way_en[3]; // @[BankedDataArray.scala 351:102]
  wire [5:0] _sram_set_addr_T_87 = loadpipe_en_43_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_43 = readline_en_3 ? io_readline_bits_addr[11:6] : _sram_set_addr_T_87; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_86 = {loadpipe_en_43_1,loadpipe_en_43_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_43 = |_read_en_T_86 | readline_en_3; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_5_3_ecc = ecc_banks_5_3_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_5_3_raw_data = data_banks_5_3_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_43 = {read_result_5_3_ecc,read_result_5_3_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_43; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_43; // @[Reg.scala 16:16]
  wire [70:0] _read_result_5_3_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_43[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_5_3_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_43[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_5_3_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_43[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_5_3_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_43[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_5_3_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_43[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_5_3_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_43[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_5_3_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_43[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_5_3_error_delayed_syndromeUInt = {^_read_result_5_3_error_delayed_syndromeUInt_T_12,^
    _read_result_5_3_error_delayed_syndromeUInt_T_10,^_read_result_5_3_error_delayed_syndromeUInt_T_8,^
    _read_result_5_3_error_delayed_syndromeUInt_T_6,^_read_result_5_3_error_delayed_syndromeUInt_T_4,^
    _read_result_5_3_error_delayed_syndromeUInt_T_2,^_read_result_5_3_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_5_3_error_delayed_correctable = |read_result_5_3_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_5_3_error_delayed_uncorrectable_1 = ^ecc_data_delayed_43; // @[ECC.scala 87:27]
  wire  read_result_5_3_error_delayed_uncorrectable_2 = ~read_result_5_3_error_delayed_uncorrectable_1 &
    read_result_5_3_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_44_0 = bank_addrs_0_0 == 4'h5 & io_read_0_valid & io_read_0_bits_way_en[4]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_44_1 = bank_addrs_1_0 == 4'h5 & io_read_1_valid & io_read_1_bits_way_en[4]; // @[BankedDataArray.scala 351:102]
  wire [5:0] _sram_set_addr_T_89 = loadpipe_en_44_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_44 = readline_en_4 ? io_readline_bits_addr[11:6] : _sram_set_addr_T_89; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_88 = {loadpipe_en_44_1,loadpipe_en_44_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_44 = |_read_en_T_88 | readline_en_4; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_5_4_ecc = ecc_banks_5_4_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_5_4_raw_data = data_banks_5_4_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_44 = {read_result_5_4_ecc,read_result_5_4_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_44; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_44; // @[Reg.scala 16:16]
  wire [70:0] _read_result_5_4_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_44[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_5_4_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_44[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_5_4_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_44[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_5_4_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_44[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_5_4_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_44[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_5_4_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_44[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_5_4_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_44[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_5_4_error_delayed_syndromeUInt = {^_read_result_5_4_error_delayed_syndromeUInt_T_12,^
    _read_result_5_4_error_delayed_syndromeUInt_T_10,^_read_result_5_4_error_delayed_syndromeUInt_T_8,^
    _read_result_5_4_error_delayed_syndromeUInt_T_6,^_read_result_5_4_error_delayed_syndromeUInt_T_4,^
    _read_result_5_4_error_delayed_syndromeUInt_T_2,^_read_result_5_4_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_5_4_error_delayed_correctable = |read_result_5_4_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_5_4_error_delayed_uncorrectable_1 = ^ecc_data_delayed_44; // @[ECC.scala 87:27]
  wire  read_result_5_4_error_delayed_uncorrectable_2 = ~read_result_5_4_error_delayed_uncorrectable_1 &
    read_result_5_4_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_45_0 = bank_addrs_0_0 == 4'h5 & io_read_0_valid & io_read_0_bits_way_en[5]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_45_1 = bank_addrs_1_0 == 4'h5 & io_read_1_valid & io_read_1_bits_way_en[5]; // @[BankedDataArray.scala 351:102]
  wire [5:0] _sram_set_addr_T_91 = loadpipe_en_45_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_45 = readline_en_5 ? io_readline_bits_addr[11:6] : _sram_set_addr_T_91; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_90 = {loadpipe_en_45_1,loadpipe_en_45_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_45 = |_read_en_T_90 | readline_en_5; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_5_5_ecc = ecc_banks_5_5_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_5_5_raw_data = data_banks_5_5_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_45 = {read_result_5_5_ecc,read_result_5_5_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_45; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_45; // @[Reg.scala 16:16]
  wire [70:0] _read_result_5_5_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_45[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_5_5_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_45[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_5_5_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_45[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_5_5_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_45[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_5_5_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_45[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_5_5_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_45[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_5_5_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_45[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_5_5_error_delayed_syndromeUInt = {^_read_result_5_5_error_delayed_syndromeUInt_T_12,^
    _read_result_5_5_error_delayed_syndromeUInt_T_10,^_read_result_5_5_error_delayed_syndromeUInt_T_8,^
    _read_result_5_5_error_delayed_syndromeUInt_T_6,^_read_result_5_5_error_delayed_syndromeUInt_T_4,^
    _read_result_5_5_error_delayed_syndromeUInt_T_2,^_read_result_5_5_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_5_5_error_delayed_correctable = |read_result_5_5_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_5_5_error_delayed_uncorrectable_1 = ^ecc_data_delayed_45; // @[ECC.scala 87:27]
  wire  read_result_5_5_error_delayed_uncorrectable_2 = ~read_result_5_5_error_delayed_uncorrectable_1 &
    read_result_5_5_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_46_0 = bank_addrs_0_0 == 4'h5 & io_read_0_valid & io_read_0_bits_way_en[6]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_46_1 = bank_addrs_1_0 == 4'h5 & io_read_1_valid & io_read_1_bits_way_en[6]; // @[BankedDataArray.scala 351:102]
  wire [5:0] _sram_set_addr_T_93 = loadpipe_en_46_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_46 = readline_en_6 ? io_readline_bits_addr[11:6] : _sram_set_addr_T_93; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_92 = {loadpipe_en_46_1,loadpipe_en_46_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_46 = |_read_en_T_92 | readline_en_6; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_5_6_ecc = ecc_banks_5_6_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_5_6_raw_data = data_banks_5_6_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_46 = {read_result_5_6_ecc,read_result_5_6_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_46; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_46; // @[Reg.scala 16:16]
  wire [70:0] _read_result_5_6_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_46[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_5_6_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_46[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_5_6_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_46[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_5_6_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_46[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_5_6_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_46[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_5_6_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_46[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_5_6_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_46[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_5_6_error_delayed_syndromeUInt = {^_read_result_5_6_error_delayed_syndromeUInt_T_12,^
    _read_result_5_6_error_delayed_syndromeUInt_T_10,^_read_result_5_6_error_delayed_syndromeUInt_T_8,^
    _read_result_5_6_error_delayed_syndromeUInt_T_6,^_read_result_5_6_error_delayed_syndromeUInt_T_4,^
    _read_result_5_6_error_delayed_syndromeUInt_T_2,^_read_result_5_6_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_5_6_error_delayed_correctable = |read_result_5_6_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_5_6_error_delayed_uncorrectable_1 = ^ecc_data_delayed_46; // @[ECC.scala 87:27]
  wire  read_result_5_6_error_delayed_uncorrectable_2 = ~read_result_5_6_error_delayed_uncorrectable_1 &
    read_result_5_6_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_47_0 = bank_addrs_0_0 == 4'h5 & io_read_0_valid & io_read_0_bits_way_en[7]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_47_1 = bank_addrs_1_0 == 4'h5 & io_read_1_valid & io_read_1_bits_way_en[7]; // @[BankedDataArray.scala 351:102]
  wire [5:0] _sram_set_addr_T_95 = loadpipe_en_47_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_47 = readline_en_7 ? io_readline_bits_addr[11:6] : _sram_set_addr_T_95; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_94 = {loadpipe_en_47_1,loadpipe_en_47_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_47 = |_read_en_T_94 | readline_en_7; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_5_7_ecc = ecc_banks_5_7_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_5_7_raw_data = data_banks_5_7_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_47 = {read_result_5_7_ecc,read_result_5_7_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_47; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_47; // @[Reg.scala 16:16]
  wire [70:0] _read_result_5_7_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_47[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_5_7_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_47[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_5_7_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_47[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_5_7_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_47[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_5_7_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_47[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_5_7_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_47[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_5_7_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_47[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_5_7_error_delayed_syndromeUInt = {^_read_result_5_7_error_delayed_syndromeUInt_T_12,^
    _read_result_5_7_error_delayed_syndromeUInt_T_10,^_read_result_5_7_error_delayed_syndromeUInt_T_8,^
    _read_result_5_7_error_delayed_syndromeUInt_T_6,^_read_result_5_7_error_delayed_syndromeUInt_T_4,^
    _read_result_5_7_error_delayed_syndromeUInt_T_2,^_read_result_5_7_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_5_7_error_delayed_correctable = |read_result_5_7_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_5_7_error_delayed_uncorrectable_1 = ^ecc_data_delayed_47; // @[ECC.scala 87:27]
  wire  read_result_5_7_error_delayed_uncorrectable_2 = ~read_result_5_7_error_delayed_uncorrectable_1 &
    read_result_5_7_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_48_0 = bank_addrs_0_0 == 4'h6 & io_read_0_valid & io_read_0_bits_way_en[0]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_48_1 = bank_addrs_1_0 == 4'h6 & io_read_1_valid & io_read_1_bits_way_en[0]; // @[BankedDataArray.scala 351:102]
  wire [5:0] _sram_set_addr_T_97 = loadpipe_en_48_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_48 = readline_en ? io_readline_bits_addr[11:6] : _sram_set_addr_T_97; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_96 = {loadpipe_en_48_1,loadpipe_en_48_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_48 = |_read_en_T_96 | readline_en; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_6_0_ecc = ecc_banks_6_0_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_6_0_raw_data = data_banks_6_0_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_48 = {read_result_6_0_ecc,read_result_6_0_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_48; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_48; // @[Reg.scala 16:16]
  wire [70:0] _read_result_6_0_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_48[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_6_0_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_48[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_6_0_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_48[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_6_0_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_48[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_6_0_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_48[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_6_0_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_48[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_6_0_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_48[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_6_0_error_delayed_syndromeUInt = {^_read_result_6_0_error_delayed_syndromeUInt_T_12,^
    _read_result_6_0_error_delayed_syndromeUInt_T_10,^_read_result_6_0_error_delayed_syndromeUInt_T_8,^
    _read_result_6_0_error_delayed_syndromeUInt_T_6,^_read_result_6_0_error_delayed_syndromeUInt_T_4,^
    _read_result_6_0_error_delayed_syndromeUInt_T_2,^_read_result_6_0_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_6_0_error_delayed_correctable = |read_result_6_0_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_6_0_error_delayed_uncorrectable_1 = ^ecc_data_delayed_48; // @[ECC.scala 87:27]
  wire  read_result_6_0_error_delayed_uncorrectable_2 = ~read_result_6_0_error_delayed_uncorrectable_1 &
    read_result_6_0_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_49_0 = bank_addrs_0_0 == 4'h6 & io_read_0_valid & io_read_0_bits_way_en[1]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_49_1 = bank_addrs_1_0 == 4'h6 & io_read_1_valid & io_read_1_bits_way_en[1]; // @[BankedDataArray.scala 351:102]
  wire [5:0] _sram_set_addr_T_99 = loadpipe_en_49_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_49 = readline_en_1 ? io_readline_bits_addr[11:6] : _sram_set_addr_T_99; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_98 = {loadpipe_en_49_1,loadpipe_en_49_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_49 = |_read_en_T_98 | readline_en_1; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_6_1_ecc = ecc_banks_6_1_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_6_1_raw_data = data_banks_6_1_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_49 = {read_result_6_1_ecc,read_result_6_1_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_49; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_49; // @[Reg.scala 16:16]
  wire [70:0] _read_result_6_1_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_49[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_6_1_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_49[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_6_1_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_49[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_6_1_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_49[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_6_1_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_49[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_6_1_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_49[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_6_1_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_49[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_6_1_error_delayed_syndromeUInt = {^_read_result_6_1_error_delayed_syndromeUInt_T_12,^
    _read_result_6_1_error_delayed_syndromeUInt_T_10,^_read_result_6_1_error_delayed_syndromeUInt_T_8,^
    _read_result_6_1_error_delayed_syndromeUInt_T_6,^_read_result_6_1_error_delayed_syndromeUInt_T_4,^
    _read_result_6_1_error_delayed_syndromeUInt_T_2,^_read_result_6_1_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_6_1_error_delayed_correctable = |read_result_6_1_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_6_1_error_delayed_uncorrectable_1 = ^ecc_data_delayed_49; // @[ECC.scala 87:27]
  wire  read_result_6_1_error_delayed_uncorrectable_2 = ~read_result_6_1_error_delayed_uncorrectable_1 &
    read_result_6_1_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_50_0 = bank_addrs_0_0 == 4'h6 & io_read_0_valid & io_read_0_bits_way_en[2]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_50_1 = bank_addrs_1_0 == 4'h6 & io_read_1_valid & io_read_1_bits_way_en[2]; // @[BankedDataArray.scala 351:102]
  wire [5:0] _sram_set_addr_T_101 = loadpipe_en_50_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_50 = readline_en_2 ? io_readline_bits_addr[11:6] : _sram_set_addr_T_101; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_100 = {loadpipe_en_50_1,loadpipe_en_50_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_50 = |_read_en_T_100 | readline_en_2; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_6_2_ecc = ecc_banks_6_2_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_6_2_raw_data = data_banks_6_2_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_50 = {read_result_6_2_ecc,read_result_6_2_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_50; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_50; // @[Reg.scala 16:16]
  wire [70:0] _read_result_6_2_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_50[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_6_2_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_50[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_6_2_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_50[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_6_2_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_50[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_6_2_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_50[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_6_2_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_50[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_6_2_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_50[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_6_2_error_delayed_syndromeUInt = {^_read_result_6_2_error_delayed_syndromeUInt_T_12,^
    _read_result_6_2_error_delayed_syndromeUInt_T_10,^_read_result_6_2_error_delayed_syndromeUInt_T_8,^
    _read_result_6_2_error_delayed_syndromeUInt_T_6,^_read_result_6_2_error_delayed_syndromeUInt_T_4,^
    _read_result_6_2_error_delayed_syndromeUInt_T_2,^_read_result_6_2_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_6_2_error_delayed_correctable = |read_result_6_2_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_6_2_error_delayed_uncorrectable_1 = ^ecc_data_delayed_50; // @[ECC.scala 87:27]
  wire  read_result_6_2_error_delayed_uncorrectable_2 = ~read_result_6_2_error_delayed_uncorrectable_1 &
    read_result_6_2_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_51_0 = bank_addrs_0_0 == 4'h6 & io_read_0_valid & io_read_0_bits_way_en[3]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_51_1 = bank_addrs_1_0 == 4'h6 & io_read_1_valid & io_read_1_bits_way_en[3]; // @[BankedDataArray.scala 351:102]
  wire [5:0] _sram_set_addr_T_103 = loadpipe_en_51_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_51 = readline_en_3 ? io_readline_bits_addr[11:6] : _sram_set_addr_T_103; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_102 = {loadpipe_en_51_1,loadpipe_en_51_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_51 = |_read_en_T_102 | readline_en_3; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_6_3_ecc = ecc_banks_6_3_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_6_3_raw_data = data_banks_6_3_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_51 = {read_result_6_3_ecc,read_result_6_3_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_51; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_51; // @[Reg.scala 16:16]
  wire [70:0] _read_result_6_3_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_51[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_6_3_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_51[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_6_3_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_51[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_6_3_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_51[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_6_3_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_51[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_6_3_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_51[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_6_3_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_51[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_6_3_error_delayed_syndromeUInt = {^_read_result_6_3_error_delayed_syndromeUInt_T_12,^
    _read_result_6_3_error_delayed_syndromeUInt_T_10,^_read_result_6_3_error_delayed_syndromeUInt_T_8,^
    _read_result_6_3_error_delayed_syndromeUInt_T_6,^_read_result_6_3_error_delayed_syndromeUInt_T_4,^
    _read_result_6_3_error_delayed_syndromeUInt_T_2,^_read_result_6_3_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_6_3_error_delayed_correctable = |read_result_6_3_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_6_3_error_delayed_uncorrectable_1 = ^ecc_data_delayed_51; // @[ECC.scala 87:27]
  wire  read_result_6_3_error_delayed_uncorrectable_2 = ~read_result_6_3_error_delayed_uncorrectable_1 &
    read_result_6_3_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_52_0 = bank_addrs_0_0 == 4'h6 & io_read_0_valid & io_read_0_bits_way_en[4]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_52_1 = bank_addrs_1_0 == 4'h6 & io_read_1_valid & io_read_1_bits_way_en[4]; // @[BankedDataArray.scala 351:102]
  wire [5:0] _sram_set_addr_T_105 = loadpipe_en_52_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_52 = readline_en_4 ? io_readline_bits_addr[11:6] : _sram_set_addr_T_105; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_104 = {loadpipe_en_52_1,loadpipe_en_52_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_52 = |_read_en_T_104 | readline_en_4; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_6_4_ecc = ecc_banks_6_4_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_6_4_raw_data = data_banks_6_4_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_52 = {read_result_6_4_ecc,read_result_6_4_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_52; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_52; // @[Reg.scala 16:16]
  wire [70:0] _read_result_6_4_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_52[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_6_4_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_52[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_6_4_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_52[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_6_4_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_52[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_6_4_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_52[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_6_4_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_52[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_6_4_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_52[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_6_4_error_delayed_syndromeUInt = {^_read_result_6_4_error_delayed_syndromeUInt_T_12,^
    _read_result_6_4_error_delayed_syndromeUInt_T_10,^_read_result_6_4_error_delayed_syndromeUInt_T_8,^
    _read_result_6_4_error_delayed_syndromeUInt_T_6,^_read_result_6_4_error_delayed_syndromeUInt_T_4,^
    _read_result_6_4_error_delayed_syndromeUInt_T_2,^_read_result_6_4_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_6_4_error_delayed_correctable = |read_result_6_4_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_6_4_error_delayed_uncorrectable_1 = ^ecc_data_delayed_52; // @[ECC.scala 87:27]
  wire  read_result_6_4_error_delayed_uncorrectable_2 = ~read_result_6_4_error_delayed_uncorrectable_1 &
    read_result_6_4_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_53_0 = bank_addrs_0_0 == 4'h6 & io_read_0_valid & io_read_0_bits_way_en[5]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_53_1 = bank_addrs_1_0 == 4'h6 & io_read_1_valid & io_read_1_bits_way_en[5]; // @[BankedDataArray.scala 351:102]
  wire [5:0] _sram_set_addr_T_107 = loadpipe_en_53_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_53 = readline_en_5 ? io_readline_bits_addr[11:6] : _sram_set_addr_T_107; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_106 = {loadpipe_en_53_1,loadpipe_en_53_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_53 = |_read_en_T_106 | readline_en_5; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_6_5_ecc = ecc_banks_6_5_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_6_5_raw_data = data_banks_6_5_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_53 = {read_result_6_5_ecc,read_result_6_5_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_53; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_53; // @[Reg.scala 16:16]
  wire [70:0] _read_result_6_5_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_53[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_6_5_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_53[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_6_5_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_53[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_6_5_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_53[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_6_5_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_53[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_6_5_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_53[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_6_5_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_53[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_6_5_error_delayed_syndromeUInt = {^_read_result_6_5_error_delayed_syndromeUInt_T_12,^
    _read_result_6_5_error_delayed_syndromeUInt_T_10,^_read_result_6_5_error_delayed_syndromeUInt_T_8,^
    _read_result_6_5_error_delayed_syndromeUInt_T_6,^_read_result_6_5_error_delayed_syndromeUInt_T_4,^
    _read_result_6_5_error_delayed_syndromeUInt_T_2,^_read_result_6_5_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_6_5_error_delayed_correctable = |read_result_6_5_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_6_5_error_delayed_uncorrectable_1 = ^ecc_data_delayed_53; // @[ECC.scala 87:27]
  wire  read_result_6_5_error_delayed_uncorrectable_2 = ~read_result_6_5_error_delayed_uncorrectable_1 &
    read_result_6_5_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_54_0 = bank_addrs_0_0 == 4'h6 & io_read_0_valid & io_read_0_bits_way_en[6]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_54_1 = bank_addrs_1_0 == 4'h6 & io_read_1_valid & io_read_1_bits_way_en[6]; // @[BankedDataArray.scala 351:102]
  wire [5:0] _sram_set_addr_T_109 = loadpipe_en_54_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_54 = readline_en_6 ? io_readline_bits_addr[11:6] : _sram_set_addr_T_109; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_108 = {loadpipe_en_54_1,loadpipe_en_54_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_54 = |_read_en_T_108 | readline_en_6; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_6_6_ecc = ecc_banks_6_6_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_6_6_raw_data = data_banks_6_6_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_54 = {read_result_6_6_ecc,read_result_6_6_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_54; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_54; // @[Reg.scala 16:16]
  wire [70:0] _read_result_6_6_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_54[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_6_6_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_54[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_6_6_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_54[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_6_6_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_54[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_6_6_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_54[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_6_6_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_54[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_6_6_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_54[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_6_6_error_delayed_syndromeUInt = {^_read_result_6_6_error_delayed_syndromeUInt_T_12,^
    _read_result_6_6_error_delayed_syndromeUInt_T_10,^_read_result_6_6_error_delayed_syndromeUInt_T_8,^
    _read_result_6_6_error_delayed_syndromeUInt_T_6,^_read_result_6_6_error_delayed_syndromeUInt_T_4,^
    _read_result_6_6_error_delayed_syndromeUInt_T_2,^_read_result_6_6_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_6_6_error_delayed_correctable = |read_result_6_6_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_6_6_error_delayed_uncorrectable_1 = ^ecc_data_delayed_54; // @[ECC.scala 87:27]
  wire  read_result_6_6_error_delayed_uncorrectable_2 = ~read_result_6_6_error_delayed_uncorrectable_1 &
    read_result_6_6_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_55_0 = bank_addrs_0_0 == 4'h6 & io_read_0_valid & io_read_0_bits_way_en[7]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_55_1 = bank_addrs_1_0 == 4'h6 & io_read_1_valid & io_read_1_bits_way_en[7]; // @[BankedDataArray.scala 351:102]
  wire [5:0] _sram_set_addr_T_111 = loadpipe_en_55_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_55 = readline_en_7 ? io_readline_bits_addr[11:6] : _sram_set_addr_T_111; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_110 = {loadpipe_en_55_1,loadpipe_en_55_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_55 = |_read_en_T_110 | readline_en_7; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_6_7_ecc = ecc_banks_6_7_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_6_7_raw_data = data_banks_6_7_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_55 = {read_result_6_7_ecc,read_result_6_7_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_55; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_55; // @[Reg.scala 16:16]
  wire [70:0] _read_result_6_7_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_55[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_6_7_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_55[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_6_7_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_55[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_6_7_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_55[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_6_7_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_55[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_6_7_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_55[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_6_7_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_55[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_6_7_error_delayed_syndromeUInt = {^_read_result_6_7_error_delayed_syndromeUInt_T_12,^
    _read_result_6_7_error_delayed_syndromeUInt_T_10,^_read_result_6_7_error_delayed_syndromeUInt_T_8,^
    _read_result_6_7_error_delayed_syndromeUInt_T_6,^_read_result_6_7_error_delayed_syndromeUInt_T_4,^
    _read_result_6_7_error_delayed_syndromeUInt_T_2,^_read_result_6_7_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_6_7_error_delayed_correctable = |read_result_6_7_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_6_7_error_delayed_uncorrectable_1 = ^ecc_data_delayed_55; // @[ECC.scala 87:27]
  wire  read_result_6_7_error_delayed_uncorrectable_2 = ~read_result_6_7_error_delayed_uncorrectable_1 &
    read_result_6_7_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_56_0 = bank_addrs_0_0 == 4'h7 & io_read_0_valid & io_read_0_bits_way_en[0]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_56_1 = bank_addrs_1_0 == 4'h7 & io_read_1_valid & io_read_1_bits_way_en[0]; // @[BankedDataArray.scala 351:102]
  wire [5:0] _sram_set_addr_T_113 = loadpipe_en_56_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_56 = readline_en ? io_readline_bits_addr[11:6] : _sram_set_addr_T_113; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_112 = {loadpipe_en_56_1,loadpipe_en_56_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_56 = |_read_en_T_112 | readline_en; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_7_0_ecc = ecc_banks_7_0_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_7_0_raw_data = data_banks_7_0_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_56 = {read_result_7_0_ecc,read_result_7_0_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_56; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_56; // @[Reg.scala 16:16]
  wire [70:0] _read_result_7_0_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_56[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_7_0_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_56[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_7_0_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_56[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_7_0_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_56[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_7_0_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_56[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_7_0_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_56[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_7_0_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_56[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_7_0_error_delayed_syndromeUInt = {^_read_result_7_0_error_delayed_syndromeUInt_T_12,^
    _read_result_7_0_error_delayed_syndromeUInt_T_10,^_read_result_7_0_error_delayed_syndromeUInt_T_8,^
    _read_result_7_0_error_delayed_syndromeUInt_T_6,^_read_result_7_0_error_delayed_syndromeUInt_T_4,^
    _read_result_7_0_error_delayed_syndromeUInt_T_2,^_read_result_7_0_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_7_0_error_delayed_correctable = |read_result_7_0_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_7_0_error_delayed_uncorrectable_1 = ^ecc_data_delayed_56; // @[ECC.scala 87:27]
  wire  read_result_7_0_error_delayed_uncorrectable_2 = ~read_result_7_0_error_delayed_uncorrectable_1 &
    read_result_7_0_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_57_0 = bank_addrs_0_0 == 4'h7 & io_read_0_valid & io_read_0_bits_way_en[1]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_57_1 = bank_addrs_1_0 == 4'h7 & io_read_1_valid & io_read_1_bits_way_en[1]; // @[BankedDataArray.scala 351:102]
  wire [5:0] _sram_set_addr_T_115 = loadpipe_en_57_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_57 = readline_en_1 ? io_readline_bits_addr[11:6] : _sram_set_addr_T_115; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_114 = {loadpipe_en_57_1,loadpipe_en_57_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_57 = |_read_en_T_114 | readline_en_1; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_7_1_ecc = ecc_banks_7_1_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_7_1_raw_data = data_banks_7_1_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_57 = {read_result_7_1_ecc,read_result_7_1_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_57; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_57; // @[Reg.scala 16:16]
  wire [70:0] _read_result_7_1_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_57[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_7_1_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_57[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_7_1_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_57[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_7_1_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_57[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_7_1_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_57[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_7_1_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_57[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_7_1_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_57[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_7_1_error_delayed_syndromeUInt = {^_read_result_7_1_error_delayed_syndromeUInt_T_12,^
    _read_result_7_1_error_delayed_syndromeUInt_T_10,^_read_result_7_1_error_delayed_syndromeUInt_T_8,^
    _read_result_7_1_error_delayed_syndromeUInt_T_6,^_read_result_7_1_error_delayed_syndromeUInt_T_4,^
    _read_result_7_1_error_delayed_syndromeUInt_T_2,^_read_result_7_1_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_7_1_error_delayed_correctable = |read_result_7_1_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_7_1_error_delayed_uncorrectable_1 = ^ecc_data_delayed_57; // @[ECC.scala 87:27]
  wire  read_result_7_1_error_delayed_uncorrectable_2 = ~read_result_7_1_error_delayed_uncorrectable_1 &
    read_result_7_1_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_58_0 = bank_addrs_0_0 == 4'h7 & io_read_0_valid & io_read_0_bits_way_en[2]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_58_1 = bank_addrs_1_0 == 4'h7 & io_read_1_valid & io_read_1_bits_way_en[2]; // @[BankedDataArray.scala 351:102]
  wire [5:0] _sram_set_addr_T_117 = loadpipe_en_58_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_58 = readline_en_2 ? io_readline_bits_addr[11:6] : _sram_set_addr_T_117; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_116 = {loadpipe_en_58_1,loadpipe_en_58_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_58 = |_read_en_T_116 | readline_en_2; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_7_2_ecc = ecc_banks_7_2_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_7_2_raw_data = data_banks_7_2_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_58 = {read_result_7_2_ecc,read_result_7_2_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_58; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_58; // @[Reg.scala 16:16]
  wire [70:0] _read_result_7_2_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_58[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_7_2_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_58[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_7_2_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_58[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_7_2_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_58[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_7_2_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_58[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_7_2_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_58[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_7_2_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_58[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_7_2_error_delayed_syndromeUInt = {^_read_result_7_2_error_delayed_syndromeUInt_T_12,^
    _read_result_7_2_error_delayed_syndromeUInt_T_10,^_read_result_7_2_error_delayed_syndromeUInt_T_8,^
    _read_result_7_2_error_delayed_syndromeUInt_T_6,^_read_result_7_2_error_delayed_syndromeUInt_T_4,^
    _read_result_7_2_error_delayed_syndromeUInt_T_2,^_read_result_7_2_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_7_2_error_delayed_correctable = |read_result_7_2_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_7_2_error_delayed_uncorrectable_1 = ^ecc_data_delayed_58; // @[ECC.scala 87:27]
  wire  read_result_7_2_error_delayed_uncorrectable_2 = ~read_result_7_2_error_delayed_uncorrectable_1 &
    read_result_7_2_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_59_0 = bank_addrs_0_0 == 4'h7 & io_read_0_valid & io_read_0_bits_way_en[3]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_59_1 = bank_addrs_1_0 == 4'h7 & io_read_1_valid & io_read_1_bits_way_en[3]; // @[BankedDataArray.scala 351:102]
  wire [5:0] _sram_set_addr_T_119 = loadpipe_en_59_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_59 = readline_en_3 ? io_readline_bits_addr[11:6] : _sram_set_addr_T_119; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_118 = {loadpipe_en_59_1,loadpipe_en_59_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_59 = |_read_en_T_118 | readline_en_3; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_7_3_ecc = ecc_banks_7_3_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_7_3_raw_data = data_banks_7_3_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_59 = {read_result_7_3_ecc,read_result_7_3_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_59; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_59; // @[Reg.scala 16:16]
  wire [70:0] _read_result_7_3_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_59[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_7_3_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_59[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_7_3_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_59[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_7_3_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_59[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_7_3_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_59[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_7_3_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_59[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_7_3_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_59[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_7_3_error_delayed_syndromeUInt = {^_read_result_7_3_error_delayed_syndromeUInt_T_12,^
    _read_result_7_3_error_delayed_syndromeUInt_T_10,^_read_result_7_3_error_delayed_syndromeUInt_T_8,^
    _read_result_7_3_error_delayed_syndromeUInt_T_6,^_read_result_7_3_error_delayed_syndromeUInt_T_4,^
    _read_result_7_3_error_delayed_syndromeUInt_T_2,^_read_result_7_3_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_7_3_error_delayed_correctable = |read_result_7_3_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_7_3_error_delayed_uncorrectable_1 = ^ecc_data_delayed_59; // @[ECC.scala 87:27]
  wire  read_result_7_3_error_delayed_uncorrectable_2 = ~read_result_7_3_error_delayed_uncorrectable_1 &
    read_result_7_3_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_60_0 = bank_addrs_0_0 == 4'h7 & io_read_0_valid & io_read_0_bits_way_en[4]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_60_1 = bank_addrs_1_0 == 4'h7 & io_read_1_valid & io_read_1_bits_way_en[4]; // @[BankedDataArray.scala 351:102]
  wire [5:0] _sram_set_addr_T_121 = loadpipe_en_60_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_60 = readline_en_4 ? io_readline_bits_addr[11:6] : _sram_set_addr_T_121; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_120 = {loadpipe_en_60_1,loadpipe_en_60_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_60 = |_read_en_T_120 | readline_en_4; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_7_4_ecc = ecc_banks_7_4_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_7_4_raw_data = data_banks_7_4_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_60 = {read_result_7_4_ecc,read_result_7_4_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_60; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_60; // @[Reg.scala 16:16]
  wire [70:0] _read_result_7_4_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_60[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_7_4_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_60[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_7_4_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_60[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_7_4_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_60[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_7_4_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_60[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_7_4_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_60[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_7_4_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_60[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_7_4_error_delayed_syndromeUInt = {^_read_result_7_4_error_delayed_syndromeUInt_T_12,^
    _read_result_7_4_error_delayed_syndromeUInt_T_10,^_read_result_7_4_error_delayed_syndromeUInt_T_8,^
    _read_result_7_4_error_delayed_syndromeUInt_T_6,^_read_result_7_4_error_delayed_syndromeUInt_T_4,^
    _read_result_7_4_error_delayed_syndromeUInt_T_2,^_read_result_7_4_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_7_4_error_delayed_correctable = |read_result_7_4_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_7_4_error_delayed_uncorrectable_1 = ^ecc_data_delayed_60; // @[ECC.scala 87:27]
  wire  read_result_7_4_error_delayed_uncorrectable_2 = ~read_result_7_4_error_delayed_uncorrectable_1 &
    read_result_7_4_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_61_0 = bank_addrs_0_0 == 4'h7 & io_read_0_valid & io_read_0_bits_way_en[5]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_61_1 = bank_addrs_1_0 == 4'h7 & io_read_1_valid & io_read_1_bits_way_en[5]; // @[BankedDataArray.scala 351:102]
  wire [5:0] _sram_set_addr_T_123 = loadpipe_en_61_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_61 = readline_en_5 ? io_readline_bits_addr[11:6] : _sram_set_addr_T_123; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_122 = {loadpipe_en_61_1,loadpipe_en_61_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_61 = |_read_en_T_122 | readline_en_5; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_7_5_ecc = ecc_banks_7_5_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_7_5_raw_data = data_banks_7_5_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_61 = {read_result_7_5_ecc,read_result_7_5_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_61; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_61; // @[Reg.scala 16:16]
  wire [70:0] _read_result_7_5_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_61[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_7_5_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_61[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_7_5_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_61[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_7_5_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_61[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_7_5_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_61[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_7_5_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_61[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_7_5_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_61[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_7_5_error_delayed_syndromeUInt = {^_read_result_7_5_error_delayed_syndromeUInt_T_12,^
    _read_result_7_5_error_delayed_syndromeUInt_T_10,^_read_result_7_5_error_delayed_syndromeUInt_T_8,^
    _read_result_7_5_error_delayed_syndromeUInt_T_6,^_read_result_7_5_error_delayed_syndromeUInt_T_4,^
    _read_result_7_5_error_delayed_syndromeUInt_T_2,^_read_result_7_5_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_7_5_error_delayed_correctable = |read_result_7_5_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_7_5_error_delayed_uncorrectable_1 = ^ecc_data_delayed_61; // @[ECC.scala 87:27]
  wire  read_result_7_5_error_delayed_uncorrectable_2 = ~read_result_7_5_error_delayed_uncorrectable_1 &
    read_result_7_5_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_62_0 = bank_addrs_0_0 == 4'h7 & io_read_0_valid & io_read_0_bits_way_en[6]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_62_1 = bank_addrs_1_0 == 4'h7 & io_read_1_valid & io_read_1_bits_way_en[6]; // @[BankedDataArray.scala 351:102]
  wire [5:0] _sram_set_addr_T_125 = loadpipe_en_62_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_62 = readline_en_6 ? io_readline_bits_addr[11:6] : _sram_set_addr_T_125; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_124 = {loadpipe_en_62_1,loadpipe_en_62_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_62 = |_read_en_T_124 | readline_en_6; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_7_6_ecc = ecc_banks_7_6_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_7_6_raw_data = data_banks_7_6_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_62 = {read_result_7_6_ecc,read_result_7_6_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_62; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_62; // @[Reg.scala 16:16]
  wire [70:0] _read_result_7_6_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_62[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_7_6_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_62[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_7_6_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_62[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_7_6_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_62[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_7_6_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_62[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_7_6_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_62[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_7_6_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_62[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_7_6_error_delayed_syndromeUInt = {^_read_result_7_6_error_delayed_syndromeUInt_T_12,^
    _read_result_7_6_error_delayed_syndromeUInt_T_10,^_read_result_7_6_error_delayed_syndromeUInt_T_8,^
    _read_result_7_6_error_delayed_syndromeUInt_T_6,^_read_result_7_6_error_delayed_syndromeUInt_T_4,^
    _read_result_7_6_error_delayed_syndromeUInt_T_2,^_read_result_7_6_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_7_6_error_delayed_correctable = |read_result_7_6_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_7_6_error_delayed_uncorrectable_1 = ^ecc_data_delayed_62; // @[ECC.scala 87:27]
  wire  read_result_7_6_error_delayed_uncorrectable_2 = ~read_result_7_6_error_delayed_uncorrectable_1 &
    read_result_7_6_error_delayed_correctable; // @[ECC.scala 195:47]
  wire  loadpipe_en_63_0 = bank_addrs_0_0 == 4'h7 & io_read_0_valid & io_read_0_bits_way_en[7]; // @[BankedDataArray.scala 351:102]
  wire  loadpipe_en_63_1 = bank_addrs_1_0 == 4'h7 & io_read_1_valid & io_read_1_bits_way_en[7]; // @[BankedDataArray.scala 351:102]
  wire [5:0] _sram_set_addr_T_127 = loadpipe_en_63_0 ? set_addrs_0 : set_addrs_1; // @[Mux.scala 47:70]
  wire [5:0] sram_set_addr_63 = readline_en_7 ? io_readline_bits_addr[11:6] : _sram_set_addr_T_127; // @[BankedDataArray.scala 362:30]
  wire [1:0] _read_en_T_126 = {loadpipe_en_63_1,loadpipe_en_63_0}; // @[BankedDataArray.scala 366:33]
  wire  read_en_63 = |_read_en_T_126 | readline_en_7; // @[BankedDataArray.scala 366:44]
  wire [7:0] read_result_7_7_ecc = ecc_banks_7_7_io_rresp_data_0; // @[BankedDataArray.scala 331:25 376:46]
  wire [63:0] read_result_7_7_raw_data = data_banks_7_7_io_rdata; // @[BankedDataArray.scala 331:25 375:51]
  wire [71:0] ecc_data_63 = {read_result_7_7_ecc,read_result_7_7_raw_data}; // @[Cat.scala 31:58]
  reg  ecc_data_delayed_REG_63; // @[BankedDataArray.scala 380:57]
  reg [71:0] ecc_data_delayed_63; // @[Reg.scala 16:16]
  wire [70:0] _read_result_7_7_error_delayed_syndromeUInt_T = 71'h1ab55555556aaad5b & ecc_data_delayed_63[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_7_7_error_delayed_syndromeUInt_T_2 = 71'h2cd9999999b33366d & ecc_data_delayed_63[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_7_7_error_delayed_syndromeUInt_T_4 = 71'h4f1e1e1e1e3c3c78e & ecc_data_delayed_63[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_7_7_error_delayed_syndromeUInt_T_6 = 71'h801fe01fe03fc07f0 & ecc_data_delayed_63[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_7_7_error_delayed_syndromeUInt_T_8 = 71'h1001fffe0003fff800 & ecc_data_delayed_63[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_7_7_error_delayed_syndromeUInt_T_10 = 71'h2001fffffffc000000 & ecc_data_delayed_63[70:0]; // @[ECC.scala 156:66]
  wire [70:0] _read_result_7_7_error_delayed_syndromeUInt_T_12 = 71'h40fe00000000000000 & ecc_data_delayed_63[70:0]; // @[ECC.scala 156:66]
  wire [6:0] read_result_7_7_error_delayed_syndromeUInt = {^_read_result_7_7_error_delayed_syndromeUInt_T_12,^
    _read_result_7_7_error_delayed_syndromeUInt_T_10,^_read_result_7_7_error_delayed_syndromeUInt_T_8,^
    _read_result_7_7_error_delayed_syndromeUInt_T_6,^_read_result_7_7_error_delayed_syndromeUInt_T_4,^
    _read_result_7_7_error_delayed_syndromeUInt_T_2,^_read_result_7_7_error_delayed_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  read_result_7_7_error_delayed_correctable = |read_result_7_7_error_delayed_syndromeUInt; // @[ECC.scala 163:36]
  wire  read_result_7_7_error_delayed_uncorrectable_1 = ^ecc_data_delayed_63; // @[ECC.scala 87:27]
  wire  read_result_7_7_error_delayed_uncorrectable_2 = ~read_result_7_7_error_delayed_uncorrectable_1 &
    read_result_7_7_error_delayed_correctable; // @[ECC.scala 195:47]
  reg [63:0] read_result_delayed_0_0_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_0_1_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_0_2_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_0_3_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_0_4_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_0_5_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_0_6_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_0_7_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_1_0_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_1_1_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_1_2_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_1_3_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_1_4_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_1_5_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_1_6_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_1_7_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_2_0_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_2_1_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_2_2_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_2_3_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_2_4_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_2_5_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_2_6_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_2_7_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_3_0_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_3_1_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_3_2_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_3_3_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_3_4_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_3_5_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_3_6_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_3_7_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_4_0_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_4_1_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_4_2_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_4_3_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_4_4_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_4_5_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_4_6_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_4_7_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_5_0_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_5_1_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_5_2_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_5_3_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_5_4_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_5_5_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_5_6_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_5_7_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_6_0_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_6_1_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_6_2_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_6_3_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_6_4_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_6_5_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_6_6_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_6_7_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_7_0_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_7_1_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_7_2_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_7_3_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_7_4_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_7_5_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_7_6_raw_data; // @[BankedDataArray.scala 392:36]
  reg [63:0] read_result_delayed_7_7_raw_data; // @[BankedDataArray.scala 392:36]
  wire [3:0] io_read_resp_delayed_0_0_hi = io_read_0_bits_way_en[7:4]; // @[OneHot.scala 30:18]
  wire [3:0] io_read_resp_delayed_0_0_lo = io_read_0_bits_way_en[3:0]; // @[OneHot.scala 31:18]
  wire  _io_read_resp_delayed_0_0_T_2 = |io_read_resp_delayed_0_0_hi; // @[OneHot.scala 32:14]
  wire [3:0] _io_read_resp_delayed_0_0_T_3 = io_read_resp_delayed_0_0_hi | io_read_resp_delayed_0_0_lo; // @[OneHot.scala 32:28]
  wire [1:0] io_read_resp_delayed_0_0_hi_1 = _io_read_resp_delayed_0_0_T_3[3:2]; // @[OneHot.scala 30:18]
  wire [1:0] io_read_resp_delayed_0_0_lo_1 = _io_read_resp_delayed_0_0_T_3[1:0]; // @[OneHot.scala 31:18]
  wire  _io_read_resp_delayed_0_0_T_4 = |io_read_resp_delayed_0_0_hi_1; // @[OneHot.scala 32:14]
  wire [1:0] _io_read_resp_delayed_0_0_T_5 = io_read_resp_delayed_0_0_hi_1 | io_read_resp_delayed_0_0_lo_1; // @[OneHot.scala 32:28]
  wire [1:0] _io_read_resp_delayed_0_0_T_7 = {_io_read_resp_delayed_0_0_T_4,_io_read_resp_delayed_0_0_T_5[1]}; // @[Cat.scala 31:58]
  wire [2:0] _io_read_resp_delayed_0_0_T_8 = {_io_read_resp_delayed_0_0_T_2,_io_read_resp_delayed_0_0_T_4,
    _io_read_resp_delayed_0_0_T_5[1]}; // @[Cat.scala 31:58]
  reg [3:0] io_read_resp_delayed_0_0_REG_4; // @[BankedDataArray.scala 401:72]
  reg [3:0] io_read_resp_delayed_0_0_REG_5; // @[BankedDataArray.scala 401:64]
  reg [2:0] io_read_resp_delayed_0_0_REG_6; // @[BankedDataArray.scala 401:108]
  reg [2:0] io_read_resp_delayed_0_0_REG_7; // @[BankedDataArray.scala 401:100]
  wire [63:0] _GEN_515 = 3'h0 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h1 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_0_1_raw_data : read_result_delayed_0_0_raw_data; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_516 = 3'h0 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h2 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_0_2_raw_data : _GEN_515; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_517 = 3'h0 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h3 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_0_3_raw_data : _GEN_516; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_518 = 3'h0 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h4 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_0_4_raw_data : _GEN_517; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_519 = 3'h0 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h5 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_0_5_raw_data : _GEN_518; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_520 = 3'h0 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h6 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_0_6_raw_data : _GEN_519; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_521 = 3'h0 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h7 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_0_7_raw_data : _GEN_520; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_522 = 3'h1 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h0 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_1_0_raw_data : _GEN_521; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_523 = 3'h1 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h1 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_1_1_raw_data : _GEN_522; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_524 = 3'h1 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h2 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_1_2_raw_data : _GEN_523; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_525 = 3'h1 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h3 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_1_3_raw_data : _GEN_524; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_526 = 3'h1 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h4 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_1_4_raw_data : _GEN_525; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_527 = 3'h1 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h5 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_1_5_raw_data : _GEN_526; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_528 = 3'h1 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h6 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_1_6_raw_data : _GEN_527; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_529 = 3'h1 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h7 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_1_7_raw_data : _GEN_528; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_530 = 3'h2 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h0 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_2_0_raw_data : _GEN_529; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_531 = 3'h2 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h1 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_2_1_raw_data : _GEN_530; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_532 = 3'h2 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h2 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_2_2_raw_data : _GEN_531; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_533 = 3'h2 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h3 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_2_3_raw_data : _GEN_532; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_534 = 3'h2 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h4 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_2_4_raw_data : _GEN_533; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_535 = 3'h2 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h5 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_2_5_raw_data : _GEN_534; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_536 = 3'h2 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h6 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_2_6_raw_data : _GEN_535; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_537 = 3'h2 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h7 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_2_7_raw_data : _GEN_536; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_538 = 3'h3 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h0 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_3_0_raw_data : _GEN_537; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_539 = 3'h3 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h1 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_3_1_raw_data : _GEN_538; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_540 = 3'h3 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h2 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_3_2_raw_data : _GEN_539; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_541 = 3'h3 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h3 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_3_3_raw_data : _GEN_540; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_542 = 3'h3 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h4 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_3_4_raw_data : _GEN_541; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_543 = 3'h3 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h5 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_3_5_raw_data : _GEN_542; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_544 = 3'h3 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h6 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_3_6_raw_data : _GEN_543; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_545 = 3'h3 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h7 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_3_7_raw_data : _GEN_544; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_546 = 3'h4 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h0 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_4_0_raw_data : _GEN_545; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_547 = 3'h4 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h1 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_4_1_raw_data : _GEN_546; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_548 = 3'h4 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h2 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_4_2_raw_data : _GEN_547; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_549 = 3'h4 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h3 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_4_3_raw_data : _GEN_548; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_550 = 3'h4 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h4 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_4_4_raw_data : _GEN_549; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_551 = 3'h4 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h5 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_4_5_raw_data : _GEN_550; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_552 = 3'h4 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h6 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_4_6_raw_data : _GEN_551; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_553 = 3'h4 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h7 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_4_7_raw_data : _GEN_552; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_554 = 3'h5 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h0 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_5_0_raw_data : _GEN_553; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_555 = 3'h5 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h1 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_5_1_raw_data : _GEN_554; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_556 = 3'h5 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h2 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_5_2_raw_data : _GEN_555; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_557 = 3'h5 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h3 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_5_3_raw_data : _GEN_556; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_558 = 3'h5 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h4 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_5_4_raw_data : _GEN_557; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_559 = 3'h5 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h5 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_5_5_raw_data : _GEN_558; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_560 = 3'h5 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h6 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_5_6_raw_data : _GEN_559; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_561 = 3'h5 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h7 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_5_7_raw_data : _GEN_560; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_562 = 3'h6 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h0 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_6_0_raw_data : _GEN_561; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_563 = 3'h6 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h1 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_6_1_raw_data : _GEN_562; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_564 = 3'h6 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h2 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_6_2_raw_data : _GEN_563; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_565 = 3'h6 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h3 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_6_3_raw_data : _GEN_564; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_566 = 3'h6 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h4 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_6_4_raw_data : _GEN_565; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_567 = 3'h6 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h5 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_6_5_raw_data : _GEN_566; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_568 = 3'h6 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h6 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_6_6_raw_data : _GEN_567; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_569 = 3'h6 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h7 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_6_7_raw_data : _GEN_568; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_570 = 3'h7 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h0 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_7_0_raw_data : _GEN_569; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_571 = 3'h7 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h1 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_7_1_raw_data : _GEN_570; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_572 = 3'h7 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h2 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_7_2_raw_data : _GEN_571; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_573 = 3'h7 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h3 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_7_3_raw_data : _GEN_572; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_574 = 3'h7 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h4 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_7_4_raw_data : _GEN_573; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_575 = 3'h7 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h5 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_7_5_raw_data : _GEN_574; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_576 = 3'h7 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h6 == io_read_resp_delayed_0_0_REG_7 ?
    read_result_delayed_7_6_raw_data : _GEN_575; // @[BankedDataArray.scala 401:{34,34}]
  wire [3:0] io_read_resp_delayed_1_0_hi = io_read_1_bits_way_en[7:4]; // @[OneHot.scala 30:18]
  wire [3:0] io_read_resp_delayed_1_0_lo = io_read_1_bits_way_en[3:0]; // @[OneHot.scala 31:18]
  wire  _io_read_resp_delayed_1_0_T_2 = |io_read_resp_delayed_1_0_hi; // @[OneHot.scala 32:14]
  wire [3:0] _io_read_resp_delayed_1_0_T_3 = io_read_resp_delayed_1_0_hi | io_read_resp_delayed_1_0_lo; // @[OneHot.scala 32:28]
  wire [1:0] io_read_resp_delayed_1_0_hi_1 = _io_read_resp_delayed_1_0_T_3[3:2]; // @[OneHot.scala 30:18]
  wire [1:0] io_read_resp_delayed_1_0_lo_1 = _io_read_resp_delayed_1_0_T_3[1:0]; // @[OneHot.scala 31:18]
  wire  _io_read_resp_delayed_1_0_T_4 = |io_read_resp_delayed_1_0_hi_1; // @[OneHot.scala 32:14]
  wire [1:0] _io_read_resp_delayed_1_0_T_5 = io_read_resp_delayed_1_0_hi_1 | io_read_resp_delayed_1_0_lo_1; // @[OneHot.scala 32:28]
  wire [1:0] _io_read_resp_delayed_1_0_T_7 = {_io_read_resp_delayed_1_0_T_4,_io_read_resp_delayed_1_0_T_5[1]}; // @[Cat.scala 31:58]
  reg [3:0] io_read_resp_delayed_1_0_REG_4; // @[BankedDataArray.scala 401:72]
  reg [3:0] io_read_resp_delayed_1_0_REG_5; // @[BankedDataArray.scala 401:64]
  reg [2:0] io_read_resp_delayed_1_0_REG_6; // @[BankedDataArray.scala 401:108]
  reg [2:0] io_read_resp_delayed_1_0_REG_7; // @[BankedDataArray.scala 401:100]
  wire [63:0] _GEN_1097 = 3'h0 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h1 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_0_1_raw_data : read_result_delayed_0_0_raw_data; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1098 = 3'h0 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h2 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_0_2_raw_data : _GEN_1097; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1099 = 3'h0 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h3 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_0_3_raw_data : _GEN_1098; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1100 = 3'h0 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h4 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_0_4_raw_data : _GEN_1099; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1101 = 3'h0 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h5 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_0_5_raw_data : _GEN_1100; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1102 = 3'h0 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h6 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_0_6_raw_data : _GEN_1101; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1103 = 3'h0 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h7 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_0_7_raw_data : _GEN_1102; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1104 = 3'h1 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h0 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_1_0_raw_data : _GEN_1103; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1105 = 3'h1 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h1 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_1_1_raw_data : _GEN_1104; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1106 = 3'h1 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h2 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_1_2_raw_data : _GEN_1105; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1107 = 3'h1 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h3 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_1_3_raw_data : _GEN_1106; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1108 = 3'h1 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h4 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_1_4_raw_data : _GEN_1107; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1109 = 3'h1 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h5 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_1_5_raw_data : _GEN_1108; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1110 = 3'h1 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h6 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_1_6_raw_data : _GEN_1109; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1111 = 3'h1 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h7 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_1_7_raw_data : _GEN_1110; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1112 = 3'h2 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h0 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_2_0_raw_data : _GEN_1111; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1113 = 3'h2 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h1 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_2_1_raw_data : _GEN_1112; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1114 = 3'h2 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h2 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_2_2_raw_data : _GEN_1113; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1115 = 3'h2 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h3 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_2_3_raw_data : _GEN_1114; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1116 = 3'h2 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h4 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_2_4_raw_data : _GEN_1115; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1117 = 3'h2 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h5 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_2_5_raw_data : _GEN_1116; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1118 = 3'h2 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h6 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_2_6_raw_data : _GEN_1117; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1119 = 3'h2 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h7 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_2_7_raw_data : _GEN_1118; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1120 = 3'h3 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h0 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_3_0_raw_data : _GEN_1119; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1121 = 3'h3 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h1 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_3_1_raw_data : _GEN_1120; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1122 = 3'h3 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h2 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_3_2_raw_data : _GEN_1121; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1123 = 3'h3 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h3 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_3_3_raw_data : _GEN_1122; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1124 = 3'h3 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h4 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_3_4_raw_data : _GEN_1123; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1125 = 3'h3 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h5 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_3_5_raw_data : _GEN_1124; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1126 = 3'h3 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h6 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_3_6_raw_data : _GEN_1125; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1127 = 3'h3 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h7 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_3_7_raw_data : _GEN_1126; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1128 = 3'h4 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h0 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_4_0_raw_data : _GEN_1127; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1129 = 3'h4 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h1 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_4_1_raw_data : _GEN_1128; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1130 = 3'h4 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h2 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_4_2_raw_data : _GEN_1129; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1131 = 3'h4 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h3 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_4_3_raw_data : _GEN_1130; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1132 = 3'h4 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h4 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_4_4_raw_data : _GEN_1131; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1133 = 3'h4 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h5 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_4_5_raw_data : _GEN_1132; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1134 = 3'h4 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h6 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_4_6_raw_data : _GEN_1133; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1135 = 3'h4 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h7 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_4_7_raw_data : _GEN_1134; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1136 = 3'h5 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h0 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_5_0_raw_data : _GEN_1135; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1137 = 3'h5 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h1 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_5_1_raw_data : _GEN_1136; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1138 = 3'h5 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h2 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_5_2_raw_data : _GEN_1137; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1139 = 3'h5 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h3 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_5_3_raw_data : _GEN_1138; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1140 = 3'h5 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h4 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_5_4_raw_data : _GEN_1139; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1141 = 3'h5 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h5 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_5_5_raw_data : _GEN_1140; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1142 = 3'h5 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h6 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_5_6_raw_data : _GEN_1141; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1143 = 3'h5 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h7 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_5_7_raw_data : _GEN_1142; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1144 = 3'h6 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h0 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_6_0_raw_data : _GEN_1143; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1145 = 3'h6 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h1 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_6_1_raw_data : _GEN_1144; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1146 = 3'h6 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h2 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_6_2_raw_data : _GEN_1145; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1147 = 3'h6 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h3 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_6_3_raw_data : _GEN_1146; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1148 = 3'h6 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h4 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_6_4_raw_data : _GEN_1147; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1149 = 3'h6 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h5 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_6_5_raw_data : _GEN_1148; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1150 = 3'h6 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h6 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_6_6_raw_data : _GEN_1149; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1151 = 3'h6 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h7 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_6_7_raw_data : _GEN_1150; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1152 = 3'h7 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h0 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_7_0_raw_data : _GEN_1151; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1153 = 3'h7 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h1 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_7_1_raw_data : _GEN_1152; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1154 = 3'h7 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h2 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_7_2_raw_data : _GEN_1153; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1155 = 3'h7 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h3 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_7_3_raw_data : _GEN_1154; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1156 = 3'h7 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h4 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_7_4_raw_data : _GEN_1155; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1157 = 3'h7 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h5 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_7_5_raw_data : _GEN_1156; // @[BankedDataArray.scala 401:{34,34}]
  wire [63:0] _GEN_1158 = 3'h7 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h6 == io_read_resp_delayed_1_0_REG_7 ?
    read_result_delayed_7_6_raw_data : _GEN_1157; // @[BankedDataArray.scala 401:{34,34}]
  wire [3:0] io_readline_resp_0_hi = io_readline_bits_way_en[7:4]; // @[OneHot.scala 30:18]
  wire [3:0] io_readline_resp_0_lo = io_readline_bits_way_en[3:0]; // @[OneHot.scala 31:18]
  wire  _io_readline_resp_0_T = |io_readline_resp_0_hi; // @[OneHot.scala 32:14]
  wire [3:0] _io_readline_resp_0_T_1 = io_readline_resp_0_hi | io_readline_resp_0_lo; // @[OneHot.scala 32:28]
  wire [1:0] io_readline_resp_0_hi_1 = _io_readline_resp_0_T_1[3:2]; // @[OneHot.scala 30:18]
  wire [1:0] io_readline_resp_0_lo_1 = _io_readline_resp_0_T_1[1:0]; // @[OneHot.scala 31:18]
  wire  _io_readline_resp_0_T_2 = |io_readline_resp_0_hi_1; // @[OneHot.scala 32:14]
  wire [1:0] _io_readline_resp_0_T_3 = io_readline_resp_0_hi_1 | io_readline_resp_0_lo_1; // @[OneHot.scala 32:28]
  wire [1:0] _io_readline_resp_0_T_5 = {_io_readline_resp_0_T_2,_io_readline_resp_0_T_3[1]}; // @[Cat.scala 31:58]
  reg [2:0] io_readline_resp_0_REG; // @[BankedDataArray.scala 407:50]
  wire [63:0] _GEN_1239 = 3'h1 == io_readline_resp_0_REG ? read_result_0_1_raw_data : read_result_0_0_raw_data; // @[BankedDataArray.scala 407:{25,25}]
  wire [63:0] _GEN_1240 = 3'h2 == io_readline_resp_0_REG ? read_result_0_2_raw_data : _GEN_1239; // @[BankedDataArray.scala 407:{25,25}]
  wire [63:0] _GEN_1241 = 3'h3 == io_readline_resp_0_REG ? read_result_0_3_raw_data : _GEN_1240; // @[BankedDataArray.scala 407:{25,25}]
  wire [63:0] _GEN_1242 = 3'h4 == io_readline_resp_0_REG ? read_result_0_4_raw_data : _GEN_1241; // @[BankedDataArray.scala 407:{25,25}]
  wire [63:0] _GEN_1243 = 3'h5 == io_readline_resp_0_REG ? read_result_0_5_raw_data : _GEN_1242; // @[BankedDataArray.scala 407:{25,25}]
  wire [63:0] _GEN_1244 = 3'h6 == io_readline_resp_0_REG ? read_result_0_6_raw_data : _GEN_1243; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_0_0_error_delayed = read_result_0_0_error_delayed_uncorrectable_1 |
    read_result_0_0_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  wire  _GEN_1246 = read_result_0_0_error_delayed; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_0_1_error_delayed = read_result_0_1_error_delayed_uncorrectable_1 |
    read_result_0_1_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  wire  _GEN_1247 = 3'h1 == io_readline_resp_0_REG ? read_result_0_1_error_delayed : read_result_0_0_error_delayed; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_0_2_error_delayed = read_result_0_2_error_delayed_uncorrectable_1 |
    read_result_0_2_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  wire  _GEN_1248 = 3'h2 == io_readline_resp_0_REG ? read_result_0_2_error_delayed : _GEN_1247; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_0_3_error_delayed = read_result_0_3_error_delayed_uncorrectable_1 |
    read_result_0_3_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  wire  _GEN_1249 = 3'h3 == io_readline_resp_0_REG ? read_result_0_3_error_delayed : _GEN_1248; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_0_4_error_delayed = read_result_0_4_error_delayed_uncorrectable_1 |
    read_result_0_4_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  wire  _GEN_1250 = 3'h4 == io_readline_resp_0_REG ? read_result_0_4_error_delayed : _GEN_1249; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_0_5_error_delayed = read_result_0_5_error_delayed_uncorrectable_1 |
    read_result_0_5_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  wire  _GEN_1251 = 3'h5 == io_readline_resp_0_REG ? read_result_0_5_error_delayed : _GEN_1250; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_0_6_error_delayed = read_result_0_6_error_delayed_uncorrectable_1 |
    read_result_0_6_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  wire  _GEN_1252 = 3'h6 == io_readline_resp_0_REG ? read_result_0_6_error_delayed : _GEN_1251; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_0_7_error_delayed = read_result_0_7_error_delayed_uncorrectable_1 |
    read_result_0_7_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  reg [2:0] io_readline_resp_1_REG; // @[BankedDataArray.scala 407:50]
  wire [63:0] _GEN_1263 = 3'h1 == io_readline_resp_1_REG ? read_result_1_1_raw_data : read_result_1_0_raw_data; // @[BankedDataArray.scala 407:{25,25}]
  wire [63:0] _GEN_1264 = 3'h2 == io_readline_resp_1_REG ? read_result_1_2_raw_data : _GEN_1263; // @[BankedDataArray.scala 407:{25,25}]
  wire [63:0] _GEN_1265 = 3'h3 == io_readline_resp_1_REG ? read_result_1_3_raw_data : _GEN_1264; // @[BankedDataArray.scala 407:{25,25}]
  wire [63:0] _GEN_1266 = 3'h4 == io_readline_resp_1_REG ? read_result_1_4_raw_data : _GEN_1265; // @[BankedDataArray.scala 407:{25,25}]
  wire [63:0] _GEN_1267 = 3'h5 == io_readline_resp_1_REG ? read_result_1_5_raw_data : _GEN_1266; // @[BankedDataArray.scala 407:{25,25}]
  wire [63:0] _GEN_1268 = 3'h6 == io_readline_resp_1_REG ? read_result_1_6_raw_data : _GEN_1267; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_1_0_error_delayed = read_result_1_0_error_delayed_uncorrectable_1 |
    read_result_1_0_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  wire  _GEN_1270 = read_result_1_0_error_delayed; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_1_1_error_delayed = read_result_1_1_error_delayed_uncorrectable_1 |
    read_result_1_1_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  wire  _GEN_1271 = 3'h1 == io_readline_resp_1_REG ? read_result_1_1_error_delayed : read_result_1_0_error_delayed; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_1_2_error_delayed = read_result_1_2_error_delayed_uncorrectable_1 |
    read_result_1_2_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  wire  _GEN_1272 = 3'h2 == io_readline_resp_1_REG ? read_result_1_2_error_delayed : _GEN_1271; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_1_3_error_delayed = read_result_1_3_error_delayed_uncorrectable_1 |
    read_result_1_3_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  wire  _GEN_1273 = 3'h3 == io_readline_resp_1_REG ? read_result_1_3_error_delayed : _GEN_1272; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_1_4_error_delayed = read_result_1_4_error_delayed_uncorrectable_1 |
    read_result_1_4_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  wire  _GEN_1274 = 3'h4 == io_readline_resp_1_REG ? read_result_1_4_error_delayed : _GEN_1273; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_1_5_error_delayed = read_result_1_5_error_delayed_uncorrectable_1 |
    read_result_1_5_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  wire  _GEN_1275 = 3'h5 == io_readline_resp_1_REG ? read_result_1_5_error_delayed : _GEN_1274; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_1_6_error_delayed = read_result_1_6_error_delayed_uncorrectable_1 |
    read_result_1_6_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  wire  _GEN_1276 = 3'h6 == io_readline_resp_1_REG ? read_result_1_6_error_delayed : _GEN_1275; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_1_7_error_delayed = read_result_1_7_error_delayed_uncorrectable_1 |
    read_result_1_7_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  reg [2:0] io_readline_resp_2_REG; // @[BankedDataArray.scala 407:50]
  wire [63:0] _GEN_1287 = 3'h1 == io_readline_resp_2_REG ? read_result_2_1_raw_data : read_result_2_0_raw_data; // @[BankedDataArray.scala 407:{25,25}]
  wire [63:0] _GEN_1288 = 3'h2 == io_readline_resp_2_REG ? read_result_2_2_raw_data : _GEN_1287; // @[BankedDataArray.scala 407:{25,25}]
  wire [63:0] _GEN_1289 = 3'h3 == io_readline_resp_2_REG ? read_result_2_3_raw_data : _GEN_1288; // @[BankedDataArray.scala 407:{25,25}]
  wire [63:0] _GEN_1290 = 3'h4 == io_readline_resp_2_REG ? read_result_2_4_raw_data : _GEN_1289; // @[BankedDataArray.scala 407:{25,25}]
  wire [63:0] _GEN_1291 = 3'h5 == io_readline_resp_2_REG ? read_result_2_5_raw_data : _GEN_1290; // @[BankedDataArray.scala 407:{25,25}]
  wire [63:0] _GEN_1292 = 3'h6 == io_readline_resp_2_REG ? read_result_2_6_raw_data : _GEN_1291; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_2_0_error_delayed = read_result_2_0_error_delayed_uncorrectable_1 |
    read_result_2_0_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  wire  _GEN_1294 = read_result_2_0_error_delayed; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_2_1_error_delayed = read_result_2_1_error_delayed_uncorrectable_1 |
    read_result_2_1_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  wire  _GEN_1295 = 3'h1 == io_readline_resp_2_REG ? read_result_2_1_error_delayed : read_result_2_0_error_delayed; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_2_2_error_delayed = read_result_2_2_error_delayed_uncorrectable_1 |
    read_result_2_2_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  wire  _GEN_1296 = 3'h2 == io_readline_resp_2_REG ? read_result_2_2_error_delayed : _GEN_1295; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_2_3_error_delayed = read_result_2_3_error_delayed_uncorrectable_1 |
    read_result_2_3_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  wire  _GEN_1297 = 3'h3 == io_readline_resp_2_REG ? read_result_2_3_error_delayed : _GEN_1296; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_2_4_error_delayed = read_result_2_4_error_delayed_uncorrectable_1 |
    read_result_2_4_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  wire  _GEN_1298 = 3'h4 == io_readline_resp_2_REG ? read_result_2_4_error_delayed : _GEN_1297; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_2_5_error_delayed = read_result_2_5_error_delayed_uncorrectable_1 |
    read_result_2_5_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  wire  _GEN_1299 = 3'h5 == io_readline_resp_2_REG ? read_result_2_5_error_delayed : _GEN_1298; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_2_6_error_delayed = read_result_2_6_error_delayed_uncorrectable_1 |
    read_result_2_6_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  wire  _GEN_1300 = 3'h6 == io_readline_resp_2_REG ? read_result_2_6_error_delayed : _GEN_1299; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_2_7_error_delayed = read_result_2_7_error_delayed_uncorrectable_1 |
    read_result_2_7_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  reg [2:0] io_readline_resp_3_REG; // @[BankedDataArray.scala 407:50]
  wire [63:0] _GEN_1311 = 3'h1 == io_readline_resp_3_REG ? read_result_3_1_raw_data : read_result_3_0_raw_data; // @[BankedDataArray.scala 407:{25,25}]
  wire [63:0] _GEN_1312 = 3'h2 == io_readline_resp_3_REG ? read_result_3_2_raw_data : _GEN_1311; // @[BankedDataArray.scala 407:{25,25}]
  wire [63:0] _GEN_1313 = 3'h3 == io_readline_resp_3_REG ? read_result_3_3_raw_data : _GEN_1312; // @[BankedDataArray.scala 407:{25,25}]
  wire [63:0] _GEN_1314 = 3'h4 == io_readline_resp_3_REG ? read_result_3_4_raw_data : _GEN_1313; // @[BankedDataArray.scala 407:{25,25}]
  wire [63:0] _GEN_1315 = 3'h5 == io_readline_resp_3_REG ? read_result_3_5_raw_data : _GEN_1314; // @[BankedDataArray.scala 407:{25,25}]
  wire [63:0] _GEN_1316 = 3'h6 == io_readline_resp_3_REG ? read_result_3_6_raw_data : _GEN_1315; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_3_0_error_delayed = read_result_3_0_error_delayed_uncorrectable_1 |
    read_result_3_0_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  wire  _GEN_1318 = read_result_3_0_error_delayed; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_3_1_error_delayed = read_result_3_1_error_delayed_uncorrectable_1 |
    read_result_3_1_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  wire  _GEN_1319 = 3'h1 == io_readline_resp_3_REG ? read_result_3_1_error_delayed : read_result_3_0_error_delayed; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_3_2_error_delayed = read_result_3_2_error_delayed_uncorrectable_1 |
    read_result_3_2_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  wire  _GEN_1320 = 3'h2 == io_readline_resp_3_REG ? read_result_3_2_error_delayed : _GEN_1319; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_3_3_error_delayed = read_result_3_3_error_delayed_uncorrectable_1 |
    read_result_3_3_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  wire  _GEN_1321 = 3'h3 == io_readline_resp_3_REG ? read_result_3_3_error_delayed : _GEN_1320; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_3_4_error_delayed = read_result_3_4_error_delayed_uncorrectable_1 |
    read_result_3_4_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  wire  _GEN_1322 = 3'h4 == io_readline_resp_3_REG ? read_result_3_4_error_delayed : _GEN_1321; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_3_5_error_delayed = read_result_3_5_error_delayed_uncorrectable_1 |
    read_result_3_5_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  wire  _GEN_1323 = 3'h5 == io_readline_resp_3_REG ? read_result_3_5_error_delayed : _GEN_1322; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_3_6_error_delayed = read_result_3_6_error_delayed_uncorrectable_1 |
    read_result_3_6_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  wire  _GEN_1324 = 3'h6 == io_readline_resp_3_REG ? read_result_3_6_error_delayed : _GEN_1323; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_3_7_error_delayed = read_result_3_7_error_delayed_uncorrectable_1 |
    read_result_3_7_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  reg [2:0] io_readline_resp_4_REG; // @[BankedDataArray.scala 407:50]
  wire [63:0] _GEN_1335 = 3'h1 == io_readline_resp_4_REG ? read_result_4_1_raw_data : read_result_4_0_raw_data; // @[BankedDataArray.scala 407:{25,25}]
  wire [63:0] _GEN_1336 = 3'h2 == io_readline_resp_4_REG ? read_result_4_2_raw_data : _GEN_1335; // @[BankedDataArray.scala 407:{25,25}]
  wire [63:0] _GEN_1337 = 3'h3 == io_readline_resp_4_REG ? read_result_4_3_raw_data : _GEN_1336; // @[BankedDataArray.scala 407:{25,25}]
  wire [63:0] _GEN_1338 = 3'h4 == io_readline_resp_4_REG ? read_result_4_4_raw_data : _GEN_1337; // @[BankedDataArray.scala 407:{25,25}]
  wire [63:0] _GEN_1339 = 3'h5 == io_readline_resp_4_REG ? read_result_4_5_raw_data : _GEN_1338; // @[BankedDataArray.scala 407:{25,25}]
  wire [63:0] _GEN_1340 = 3'h6 == io_readline_resp_4_REG ? read_result_4_6_raw_data : _GEN_1339; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_4_0_error_delayed = read_result_4_0_error_delayed_uncorrectable_1 |
    read_result_4_0_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  wire  _GEN_1342 = read_result_4_0_error_delayed; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_4_1_error_delayed = read_result_4_1_error_delayed_uncorrectable_1 |
    read_result_4_1_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  wire  _GEN_1343 = 3'h1 == io_readline_resp_4_REG ? read_result_4_1_error_delayed : read_result_4_0_error_delayed; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_4_2_error_delayed = read_result_4_2_error_delayed_uncorrectable_1 |
    read_result_4_2_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  wire  _GEN_1344 = 3'h2 == io_readline_resp_4_REG ? read_result_4_2_error_delayed : _GEN_1343; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_4_3_error_delayed = read_result_4_3_error_delayed_uncorrectable_1 |
    read_result_4_3_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  wire  _GEN_1345 = 3'h3 == io_readline_resp_4_REG ? read_result_4_3_error_delayed : _GEN_1344; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_4_4_error_delayed = read_result_4_4_error_delayed_uncorrectable_1 |
    read_result_4_4_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  wire  _GEN_1346 = 3'h4 == io_readline_resp_4_REG ? read_result_4_4_error_delayed : _GEN_1345; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_4_5_error_delayed = read_result_4_5_error_delayed_uncorrectable_1 |
    read_result_4_5_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  wire  _GEN_1347 = 3'h5 == io_readline_resp_4_REG ? read_result_4_5_error_delayed : _GEN_1346; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_4_6_error_delayed = read_result_4_6_error_delayed_uncorrectable_1 |
    read_result_4_6_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  wire  _GEN_1348 = 3'h6 == io_readline_resp_4_REG ? read_result_4_6_error_delayed : _GEN_1347; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_4_7_error_delayed = read_result_4_7_error_delayed_uncorrectable_1 |
    read_result_4_7_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  reg [2:0] io_readline_resp_5_REG; // @[BankedDataArray.scala 407:50]
  wire [63:0] _GEN_1359 = 3'h1 == io_readline_resp_5_REG ? read_result_5_1_raw_data : read_result_5_0_raw_data; // @[BankedDataArray.scala 407:{25,25}]
  wire [63:0] _GEN_1360 = 3'h2 == io_readline_resp_5_REG ? read_result_5_2_raw_data : _GEN_1359; // @[BankedDataArray.scala 407:{25,25}]
  wire [63:0] _GEN_1361 = 3'h3 == io_readline_resp_5_REG ? read_result_5_3_raw_data : _GEN_1360; // @[BankedDataArray.scala 407:{25,25}]
  wire [63:0] _GEN_1362 = 3'h4 == io_readline_resp_5_REG ? read_result_5_4_raw_data : _GEN_1361; // @[BankedDataArray.scala 407:{25,25}]
  wire [63:0] _GEN_1363 = 3'h5 == io_readline_resp_5_REG ? read_result_5_5_raw_data : _GEN_1362; // @[BankedDataArray.scala 407:{25,25}]
  wire [63:0] _GEN_1364 = 3'h6 == io_readline_resp_5_REG ? read_result_5_6_raw_data : _GEN_1363; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_5_0_error_delayed = read_result_5_0_error_delayed_uncorrectable_1 |
    read_result_5_0_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  wire  _GEN_1366 = read_result_5_0_error_delayed; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_5_1_error_delayed = read_result_5_1_error_delayed_uncorrectable_1 |
    read_result_5_1_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  wire  _GEN_1367 = 3'h1 == io_readline_resp_5_REG ? read_result_5_1_error_delayed : read_result_5_0_error_delayed; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_5_2_error_delayed = read_result_5_2_error_delayed_uncorrectable_1 |
    read_result_5_2_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  wire  _GEN_1368 = 3'h2 == io_readline_resp_5_REG ? read_result_5_2_error_delayed : _GEN_1367; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_5_3_error_delayed = read_result_5_3_error_delayed_uncorrectable_1 |
    read_result_5_3_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  wire  _GEN_1369 = 3'h3 == io_readline_resp_5_REG ? read_result_5_3_error_delayed : _GEN_1368; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_5_4_error_delayed = read_result_5_4_error_delayed_uncorrectable_1 |
    read_result_5_4_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  wire  _GEN_1370 = 3'h4 == io_readline_resp_5_REG ? read_result_5_4_error_delayed : _GEN_1369; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_5_5_error_delayed = read_result_5_5_error_delayed_uncorrectable_1 |
    read_result_5_5_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  wire  _GEN_1371 = 3'h5 == io_readline_resp_5_REG ? read_result_5_5_error_delayed : _GEN_1370; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_5_6_error_delayed = read_result_5_6_error_delayed_uncorrectable_1 |
    read_result_5_6_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  wire  _GEN_1372 = 3'h6 == io_readline_resp_5_REG ? read_result_5_6_error_delayed : _GEN_1371; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_5_7_error_delayed = read_result_5_7_error_delayed_uncorrectable_1 |
    read_result_5_7_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  reg [2:0] io_readline_resp_6_REG; // @[BankedDataArray.scala 407:50]
  wire [63:0] _GEN_1383 = 3'h1 == io_readline_resp_6_REG ? read_result_6_1_raw_data : read_result_6_0_raw_data; // @[BankedDataArray.scala 407:{25,25}]
  wire [63:0] _GEN_1384 = 3'h2 == io_readline_resp_6_REG ? read_result_6_2_raw_data : _GEN_1383; // @[BankedDataArray.scala 407:{25,25}]
  wire [63:0] _GEN_1385 = 3'h3 == io_readline_resp_6_REG ? read_result_6_3_raw_data : _GEN_1384; // @[BankedDataArray.scala 407:{25,25}]
  wire [63:0] _GEN_1386 = 3'h4 == io_readline_resp_6_REG ? read_result_6_4_raw_data : _GEN_1385; // @[BankedDataArray.scala 407:{25,25}]
  wire [63:0] _GEN_1387 = 3'h5 == io_readline_resp_6_REG ? read_result_6_5_raw_data : _GEN_1386; // @[BankedDataArray.scala 407:{25,25}]
  wire [63:0] _GEN_1388 = 3'h6 == io_readline_resp_6_REG ? read_result_6_6_raw_data : _GEN_1387; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_6_0_error_delayed = read_result_6_0_error_delayed_uncorrectable_1 |
    read_result_6_0_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  wire  _GEN_1390 = read_result_6_0_error_delayed; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_6_1_error_delayed = read_result_6_1_error_delayed_uncorrectable_1 |
    read_result_6_1_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  wire  _GEN_1391 = 3'h1 == io_readline_resp_6_REG ? read_result_6_1_error_delayed : read_result_6_0_error_delayed; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_6_2_error_delayed = read_result_6_2_error_delayed_uncorrectable_1 |
    read_result_6_2_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  wire  _GEN_1392 = 3'h2 == io_readline_resp_6_REG ? read_result_6_2_error_delayed : _GEN_1391; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_6_3_error_delayed = read_result_6_3_error_delayed_uncorrectable_1 |
    read_result_6_3_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  wire  _GEN_1393 = 3'h3 == io_readline_resp_6_REG ? read_result_6_3_error_delayed : _GEN_1392; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_6_4_error_delayed = read_result_6_4_error_delayed_uncorrectable_1 |
    read_result_6_4_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  wire  _GEN_1394 = 3'h4 == io_readline_resp_6_REG ? read_result_6_4_error_delayed : _GEN_1393; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_6_5_error_delayed = read_result_6_5_error_delayed_uncorrectable_1 |
    read_result_6_5_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  wire  _GEN_1395 = 3'h5 == io_readline_resp_6_REG ? read_result_6_5_error_delayed : _GEN_1394; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_6_6_error_delayed = read_result_6_6_error_delayed_uncorrectable_1 |
    read_result_6_6_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  wire  _GEN_1396 = 3'h6 == io_readline_resp_6_REG ? read_result_6_6_error_delayed : _GEN_1395; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_6_7_error_delayed = read_result_6_7_error_delayed_uncorrectable_1 |
    read_result_6_7_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  reg [2:0] io_readline_resp_7_REG; // @[BankedDataArray.scala 407:50]
  wire [63:0] _GEN_1407 = 3'h1 == io_readline_resp_7_REG ? read_result_7_1_raw_data : read_result_7_0_raw_data; // @[BankedDataArray.scala 407:{25,25}]
  wire [63:0] _GEN_1408 = 3'h2 == io_readline_resp_7_REG ? read_result_7_2_raw_data : _GEN_1407; // @[BankedDataArray.scala 407:{25,25}]
  wire [63:0] _GEN_1409 = 3'h3 == io_readline_resp_7_REG ? read_result_7_3_raw_data : _GEN_1408; // @[BankedDataArray.scala 407:{25,25}]
  wire [63:0] _GEN_1410 = 3'h4 == io_readline_resp_7_REG ? read_result_7_4_raw_data : _GEN_1409; // @[BankedDataArray.scala 407:{25,25}]
  wire [63:0] _GEN_1411 = 3'h5 == io_readline_resp_7_REG ? read_result_7_5_raw_data : _GEN_1410; // @[BankedDataArray.scala 407:{25,25}]
  wire [63:0] _GEN_1412 = 3'h6 == io_readline_resp_7_REG ? read_result_7_6_raw_data : _GEN_1411; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_7_0_error_delayed = read_result_7_0_error_delayed_uncorrectable_1 |
    read_result_7_0_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  wire  _GEN_1414 = read_result_7_0_error_delayed; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_7_1_error_delayed = read_result_7_1_error_delayed_uncorrectable_1 |
    read_result_7_1_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  wire  _GEN_1415 = 3'h1 == io_readline_resp_7_REG ? read_result_7_1_error_delayed : read_result_7_0_error_delayed; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_7_2_error_delayed = read_result_7_2_error_delayed_uncorrectable_1 |
    read_result_7_2_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  wire  _GEN_1416 = 3'h2 == io_readline_resp_7_REG ? read_result_7_2_error_delayed : _GEN_1415; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_7_3_error_delayed = read_result_7_3_error_delayed_uncorrectable_1 |
    read_result_7_3_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  wire  _GEN_1417 = 3'h3 == io_readline_resp_7_REG ? read_result_7_3_error_delayed : _GEN_1416; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_7_4_error_delayed = read_result_7_4_error_delayed_uncorrectable_1 |
    read_result_7_4_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  wire  _GEN_1418 = 3'h4 == io_readline_resp_7_REG ? read_result_7_4_error_delayed : _GEN_1417; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_7_5_error_delayed = read_result_7_5_error_delayed_uncorrectable_1 |
    read_result_7_5_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  wire  _GEN_1419 = 3'h5 == io_readline_resp_7_REG ? read_result_7_5_error_delayed : _GEN_1418; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_7_6_error_delayed = read_result_7_6_error_delayed_uncorrectable_1 |
    read_result_7_6_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  wire  _GEN_1420 = 3'h6 == io_readline_resp_7_REG ? read_result_7_6_error_delayed : _GEN_1419; // @[BankedDataArray.scala 407:{25,25}]
  wire  read_result_7_7_error_delayed = read_result_7_7_error_delayed_uncorrectable_1 |
    read_result_7_7_error_delayed_uncorrectable_2; // @[ECC.scala 31:27]
  wire  read_error_delayed_result_0_0 = read_result_0_0_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_0_1 = read_result_0_1_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_0_2 = read_result_0_2_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_0_3 = read_result_0_3_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_0_4 = read_result_0_4_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_0_5 = read_result_0_5_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_0_6 = read_result_0_6_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_0_7 = read_result_0_7_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_1_0 = read_result_1_0_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_1_1 = read_result_1_1_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_1_2 = read_result_1_2_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_1_3 = read_result_1_3_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_1_4 = read_result_1_4_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_1_5 = read_result_1_5_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_1_6 = read_result_1_6_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_1_7 = read_result_1_7_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_2_0 = read_result_2_0_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_2_1 = read_result_2_1_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_2_2 = read_result_2_2_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_2_3 = read_result_2_3_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_2_4 = read_result_2_4_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_2_5 = read_result_2_5_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_2_6 = read_result_2_6_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_2_7 = read_result_2_7_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_3_0 = read_result_3_0_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_3_1 = read_result_3_1_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_3_2 = read_result_3_2_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_3_3 = read_result_3_3_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_3_4 = read_result_3_4_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_3_5 = read_result_3_5_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_3_6 = read_result_3_6_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_3_7 = read_result_3_7_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_4_0 = read_result_4_0_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_4_1 = read_result_4_1_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_4_2 = read_result_4_2_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_4_3 = read_result_4_3_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_4_4 = read_result_4_4_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_4_5 = read_result_4_5_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_4_6 = read_result_4_6_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_4_7 = read_result_4_7_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_5_0 = read_result_5_0_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_5_1 = read_result_5_1_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_5_2 = read_result_5_2_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_5_3 = read_result_5_3_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_5_4 = read_result_5_4_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_5_5 = read_result_5_5_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_5_6 = read_result_5_6_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_5_7 = read_result_5_7_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_6_0 = read_result_6_0_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_6_1 = read_result_6_1_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_6_2 = read_result_6_2_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_6_3 = read_result_6_3_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_6_4 = read_result_6_4_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_6_5 = read_result_6_5_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_6_6 = read_result_6_6_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_6_7 = read_result_6_7_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_7_0 = read_result_7_0_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_7_1 = read_result_7_1_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_7_2 = read_result_7_2_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_7_3 = read_result_7_3_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_7_4 = read_result_7_4_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_7_5 = read_result_7_5_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_7_6 = read_result_7_6_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  wire  read_error_delayed_result_7_7 = read_result_7_7_error_delayed; // @[BankedDataArray.scala 332:39 382:56]
  reg  io_read_error_delayed_0_0_REG_7; // @[BankedDataArray.scala 420:63]
  reg  io_read_error_delayed_0_0_REG_8; // @[BankedDataArray.scala 420:55]
  reg [3:0] io_read_error_delayed_0_0_REG_9; // @[BankedDataArray.scala 421:50]
  reg [3:0] io_read_error_delayed_0_0_REG_10; // @[BankedDataArray.scala 421:42]
  reg [2:0] io_read_error_delayed_0_0_REG_11; // @[BankedDataArray.scala 421:96]
  reg [2:0] io_read_error_delayed_0_0_REG_12; // @[BankedDataArray.scala 421:88]
  wire  _GEN_1551 = 3'h0 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h1 == io_read_error_delayed_0_0_REG_12 ?
    read_error_delayed_result_0_1 : _GEN_1246; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1552 = 3'h0 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h2 == io_read_error_delayed_0_0_REG_12 ?
    read_error_delayed_result_0_2 : _GEN_1551; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1553 = 3'h0 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h3 == io_read_error_delayed_0_0_REG_12 ?
    read_error_delayed_result_0_3 : _GEN_1552; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1554 = 3'h0 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h4 == io_read_error_delayed_0_0_REG_12 ?
    read_error_delayed_result_0_4 : _GEN_1553; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1555 = 3'h0 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h5 == io_read_error_delayed_0_0_REG_12 ?
    read_error_delayed_result_0_5 : _GEN_1554; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1556 = 3'h0 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h6 == io_read_error_delayed_0_0_REG_12 ?
    read_error_delayed_result_0_6 : _GEN_1555; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1557 = 3'h0 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h7 == io_read_error_delayed_0_0_REG_12 ?
    read_error_delayed_result_0_7 : _GEN_1556; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1558 = 3'h1 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h0 == io_read_error_delayed_0_0_REG_12 ? _GEN_1270
     : _GEN_1557; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1559 = 3'h1 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h1 == io_read_error_delayed_0_0_REG_12 ?
    read_error_delayed_result_1_1 : _GEN_1558; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1560 = 3'h1 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h2 == io_read_error_delayed_0_0_REG_12 ?
    read_error_delayed_result_1_2 : _GEN_1559; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1561 = 3'h1 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h3 == io_read_error_delayed_0_0_REG_12 ?
    read_error_delayed_result_1_3 : _GEN_1560; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1562 = 3'h1 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h4 == io_read_error_delayed_0_0_REG_12 ?
    read_error_delayed_result_1_4 : _GEN_1561; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1563 = 3'h1 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h5 == io_read_error_delayed_0_0_REG_12 ?
    read_error_delayed_result_1_5 : _GEN_1562; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1564 = 3'h1 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h6 == io_read_error_delayed_0_0_REG_12 ?
    read_error_delayed_result_1_6 : _GEN_1563; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1565 = 3'h1 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h7 == io_read_error_delayed_0_0_REG_12 ?
    read_error_delayed_result_1_7 : _GEN_1564; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1566 = 3'h2 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h0 == io_read_error_delayed_0_0_REG_12 ? _GEN_1294
     : _GEN_1565; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1567 = 3'h2 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h1 == io_read_error_delayed_0_0_REG_12 ?
    read_error_delayed_result_2_1 : _GEN_1566; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1568 = 3'h2 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h2 == io_read_error_delayed_0_0_REG_12 ?
    read_error_delayed_result_2_2 : _GEN_1567; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1569 = 3'h2 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h3 == io_read_error_delayed_0_0_REG_12 ?
    read_error_delayed_result_2_3 : _GEN_1568; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1570 = 3'h2 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h4 == io_read_error_delayed_0_0_REG_12 ?
    read_error_delayed_result_2_4 : _GEN_1569; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1571 = 3'h2 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h5 == io_read_error_delayed_0_0_REG_12 ?
    read_error_delayed_result_2_5 : _GEN_1570; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1572 = 3'h2 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h6 == io_read_error_delayed_0_0_REG_12 ?
    read_error_delayed_result_2_6 : _GEN_1571; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1573 = 3'h2 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h7 == io_read_error_delayed_0_0_REG_12 ?
    read_error_delayed_result_2_7 : _GEN_1572; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1574 = 3'h3 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h0 == io_read_error_delayed_0_0_REG_12 ? _GEN_1318
     : _GEN_1573; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1575 = 3'h3 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h1 == io_read_error_delayed_0_0_REG_12 ?
    read_error_delayed_result_3_1 : _GEN_1574; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1576 = 3'h3 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h2 == io_read_error_delayed_0_0_REG_12 ?
    read_error_delayed_result_3_2 : _GEN_1575; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1577 = 3'h3 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h3 == io_read_error_delayed_0_0_REG_12 ?
    read_error_delayed_result_3_3 : _GEN_1576; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1578 = 3'h3 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h4 == io_read_error_delayed_0_0_REG_12 ?
    read_error_delayed_result_3_4 : _GEN_1577; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1579 = 3'h3 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h5 == io_read_error_delayed_0_0_REG_12 ?
    read_error_delayed_result_3_5 : _GEN_1578; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1580 = 3'h3 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h6 == io_read_error_delayed_0_0_REG_12 ?
    read_error_delayed_result_3_6 : _GEN_1579; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1581 = 3'h3 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h7 == io_read_error_delayed_0_0_REG_12 ?
    read_error_delayed_result_3_7 : _GEN_1580; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1582 = 3'h4 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h0 == io_read_error_delayed_0_0_REG_12 ? _GEN_1342
     : _GEN_1581; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1583 = 3'h4 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h1 == io_read_error_delayed_0_0_REG_12 ?
    read_error_delayed_result_4_1 : _GEN_1582; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1584 = 3'h4 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h2 == io_read_error_delayed_0_0_REG_12 ?
    read_error_delayed_result_4_2 : _GEN_1583; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1585 = 3'h4 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h3 == io_read_error_delayed_0_0_REG_12 ?
    read_error_delayed_result_4_3 : _GEN_1584; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1586 = 3'h4 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h4 == io_read_error_delayed_0_0_REG_12 ?
    read_error_delayed_result_4_4 : _GEN_1585; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1587 = 3'h4 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h5 == io_read_error_delayed_0_0_REG_12 ?
    read_error_delayed_result_4_5 : _GEN_1586; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1588 = 3'h4 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h6 == io_read_error_delayed_0_0_REG_12 ?
    read_error_delayed_result_4_6 : _GEN_1587; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1589 = 3'h4 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h7 == io_read_error_delayed_0_0_REG_12 ?
    read_error_delayed_result_4_7 : _GEN_1588; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1590 = 3'h5 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h0 == io_read_error_delayed_0_0_REG_12 ? _GEN_1366
     : _GEN_1589; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1591 = 3'h5 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h1 == io_read_error_delayed_0_0_REG_12 ?
    read_error_delayed_result_5_1 : _GEN_1590; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1592 = 3'h5 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h2 == io_read_error_delayed_0_0_REG_12 ?
    read_error_delayed_result_5_2 : _GEN_1591; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1593 = 3'h5 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h3 == io_read_error_delayed_0_0_REG_12 ?
    read_error_delayed_result_5_3 : _GEN_1592; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1594 = 3'h5 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h4 == io_read_error_delayed_0_0_REG_12 ?
    read_error_delayed_result_5_4 : _GEN_1593; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1595 = 3'h5 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h5 == io_read_error_delayed_0_0_REG_12 ?
    read_error_delayed_result_5_5 : _GEN_1594; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1596 = 3'h5 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h6 == io_read_error_delayed_0_0_REG_12 ?
    read_error_delayed_result_5_6 : _GEN_1595; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1597 = 3'h5 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h7 == io_read_error_delayed_0_0_REG_12 ?
    read_error_delayed_result_5_7 : _GEN_1596; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1598 = 3'h6 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h0 == io_read_error_delayed_0_0_REG_12 ? _GEN_1390
     : _GEN_1597; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1599 = 3'h6 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h1 == io_read_error_delayed_0_0_REG_12 ?
    read_error_delayed_result_6_1 : _GEN_1598; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1600 = 3'h6 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h2 == io_read_error_delayed_0_0_REG_12 ?
    read_error_delayed_result_6_2 : _GEN_1599; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1601 = 3'h6 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h3 == io_read_error_delayed_0_0_REG_12 ?
    read_error_delayed_result_6_3 : _GEN_1600; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1602 = 3'h6 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h4 == io_read_error_delayed_0_0_REG_12 ?
    read_error_delayed_result_6_4 : _GEN_1601; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1603 = 3'h6 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h5 == io_read_error_delayed_0_0_REG_12 ?
    read_error_delayed_result_6_5 : _GEN_1602; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1604 = 3'h6 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h6 == io_read_error_delayed_0_0_REG_12 ?
    read_error_delayed_result_6_6 : _GEN_1603; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1605 = 3'h6 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h7 == io_read_error_delayed_0_0_REG_12 ?
    read_error_delayed_result_6_7 : _GEN_1604; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1606 = 3'h7 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h0 == io_read_error_delayed_0_0_REG_12 ? _GEN_1414
     : _GEN_1605; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1607 = 3'h7 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h1 == io_read_error_delayed_0_0_REG_12 ?
    read_error_delayed_result_7_1 : _GEN_1606; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1608 = 3'h7 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h2 == io_read_error_delayed_0_0_REG_12 ?
    read_error_delayed_result_7_2 : _GEN_1607; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1609 = 3'h7 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h3 == io_read_error_delayed_0_0_REG_12 ?
    read_error_delayed_result_7_3 : _GEN_1608; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1610 = 3'h7 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h4 == io_read_error_delayed_0_0_REG_12 ?
    read_error_delayed_result_7_4 : _GEN_1609; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1611 = 3'h7 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h5 == io_read_error_delayed_0_0_REG_12 ?
    read_error_delayed_result_7_5 : _GEN_1610; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1612 = 3'h7 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h6 == io_read_error_delayed_0_0_REG_12 ?
    read_error_delayed_result_7_6 : _GEN_1611; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1613 = 3'h7 == io_read_error_delayed_0_0_REG_10[2:0] & 3'h7 == io_read_error_delayed_0_0_REG_12 ?
    read_error_delayed_result_7_7 : _GEN_1612; // @[BankedDataArray.scala 420:{94,94}]
  wire  _io_read_error_delayed_0_0_T_27 = io_read_error_delayed_0_0_REG_8 & _GEN_1613; // @[BankedDataArray.scala 420:94]
  reg  io_read_error_delayed_0_0_REG_13; // @[BankedDataArray.scala 422:17]
  wire  _io_read_error_delayed_0_0_T_28 = ~io_read_error_delayed_0_0_REG_13; // @[BankedDataArray.scala 422:9]
  reg  io_read_error_delayed_1_0_REG_7; // @[BankedDataArray.scala 420:63]
  reg  io_read_error_delayed_1_0_REG_8; // @[BankedDataArray.scala 420:55]
  reg [3:0] io_read_error_delayed_1_0_REG_9; // @[BankedDataArray.scala 421:50]
  reg [3:0] io_read_error_delayed_1_0_REG_10; // @[BankedDataArray.scala 421:42]
  reg [2:0] io_read_error_delayed_1_0_REG_11; // @[BankedDataArray.scala 421:96]
  reg [2:0] io_read_error_delayed_1_0_REG_12; // @[BankedDataArray.scala 421:88]
  wire  _GEN_1745 = 3'h0 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h1 == io_read_error_delayed_1_0_REG_12 ?
    read_error_delayed_result_0_1 : _GEN_1246; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1746 = 3'h0 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h2 == io_read_error_delayed_1_0_REG_12 ?
    read_error_delayed_result_0_2 : _GEN_1745; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1747 = 3'h0 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h3 == io_read_error_delayed_1_0_REG_12 ?
    read_error_delayed_result_0_3 : _GEN_1746; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1748 = 3'h0 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h4 == io_read_error_delayed_1_0_REG_12 ?
    read_error_delayed_result_0_4 : _GEN_1747; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1749 = 3'h0 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h5 == io_read_error_delayed_1_0_REG_12 ?
    read_error_delayed_result_0_5 : _GEN_1748; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1750 = 3'h0 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h6 == io_read_error_delayed_1_0_REG_12 ?
    read_error_delayed_result_0_6 : _GEN_1749; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1751 = 3'h0 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h7 == io_read_error_delayed_1_0_REG_12 ?
    read_error_delayed_result_0_7 : _GEN_1750; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1752 = 3'h1 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h0 == io_read_error_delayed_1_0_REG_12 ? _GEN_1270
     : _GEN_1751; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1753 = 3'h1 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h1 == io_read_error_delayed_1_0_REG_12 ?
    read_error_delayed_result_1_1 : _GEN_1752; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1754 = 3'h1 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h2 == io_read_error_delayed_1_0_REG_12 ?
    read_error_delayed_result_1_2 : _GEN_1753; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1755 = 3'h1 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h3 == io_read_error_delayed_1_0_REG_12 ?
    read_error_delayed_result_1_3 : _GEN_1754; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1756 = 3'h1 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h4 == io_read_error_delayed_1_0_REG_12 ?
    read_error_delayed_result_1_4 : _GEN_1755; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1757 = 3'h1 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h5 == io_read_error_delayed_1_0_REG_12 ?
    read_error_delayed_result_1_5 : _GEN_1756; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1758 = 3'h1 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h6 == io_read_error_delayed_1_0_REG_12 ?
    read_error_delayed_result_1_6 : _GEN_1757; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1759 = 3'h1 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h7 == io_read_error_delayed_1_0_REG_12 ?
    read_error_delayed_result_1_7 : _GEN_1758; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1760 = 3'h2 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h0 == io_read_error_delayed_1_0_REG_12 ? _GEN_1294
     : _GEN_1759; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1761 = 3'h2 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h1 == io_read_error_delayed_1_0_REG_12 ?
    read_error_delayed_result_2_1 : _GEN_1760; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1762 = 3'h2 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h2 == io_read_error_delayed_1_0_REG_12 ?
    read_error_delayed_result_2_2 : _GEN_1761; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1763 = 3'h2 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h3 == io_read_error_delayed_1_0_REG_12 ?
    read_error_delayed_result_2_3 : _GEN_1762; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1764 = 3'h2 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h4 == io_read_error_delayed_1_0_REG_12 ?
    read_error_delayed_result_2_4 : _GEN_1763; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1765 = 3'h2 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h5 == io_read_error_delayed_1_0_REG_12 ?
    read_error_delayed_result_2_5 : _GEN_1764; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1766 = 3'h2 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h6 == io_read_error_delayed_1_0_REG_12 ?
    read_error_delayed_result_2_6 : _GEN_1765; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1767 = 3'h2 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h7 == io_read_error_delayed_1_0_REG_12 ?
    read_error_delayed_result_2_7 : _GEN_1766; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1768 = 3'h3 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h0 == io_read_error_delayed_1_0_REG_12 ? _GEN_1318
     : _GEN_1767; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1769 = 3'h3 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h1 == io_read_error_delayed_1_0_REG_12 ?
    read_error_delayed_result_3_1 : _GEN_1768; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1770 = 3'h3 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h2 == io_read_error_delayed_1_0_REG_12 ?
    read_error_delayed_result_3_2 : _GEN_1769; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1771 = 3'h3 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h3 == io_read_error_delayed_1_0_REG_12 ?
    read_error_delayed_result_3_3 : _GEN_1770; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1772 = 3'h3 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h4 == io_read_error_delayed_1_0_REG_12 ?
    read_error_delayed_result_3_4 : _GEN_1771; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1773 = 3'h3 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h5 == io_read_error_delayed_1_0_REG_12 ?
    read_error_delayed_result_3_5 : _GEN_1772; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1774 = 3'h3 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h6 == io_read_error_delayed_1_0_REG_12 ?
    read_error_delayed_result_3_6 : _GEN_1773; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1775 = 3'h3 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h7 == io_read_error_delayed_1_0_REG_12 ?
    read_error_delayed_result_3_7 : _GEN_1774; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1776 = 3'h4 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h0 == io_read_error_delayed_1_0_REG_12 ? _GEN_1342
     : _GEN_1775; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1777 = 3'h4 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h1 == io_read_error_delayed_1_0_REG_12 ?
    read_error_delayed_result_4_1 : _GEN_1776; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1778 = 3'h4 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h2 == io_read_error_delayed_1_0_REG_12 ?
    read_error_delayed_result_4_2 : _GEN_1777; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1779 = 3'h4 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h3 == io_read_error_delayed_1_0_REG_12 ?
    read_error_delayed_result_4_3 : _GEN_1778; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1780 = 3'h4 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h4 == io_read_error_delayed_1_0_REG_12 ?
    read_error_delayed_result_4_4 : _GEN_1779; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1781 = 3'h4 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h5 == io_read_error_delayed_1_0_REG_12 ?
    read_error_delayed_result_4_5 : _GEN_1780; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1782 = 3'h4 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h6 == io_read_error_delayed_1_0_REG_12 ?
    read_error_delayed_result_4_6 : _GEN_1781; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1783 = 3'h4 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h7 == io_read_error_delayed_1_0_REG_12 ?
    read_error_delayed_result_4_7 : _GEN_1782; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1784 = 3'h5 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h0 == io_read_error_delayed_1_0_REG_12 ? _GEN_1366
     : _GEN_1783; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1785 = 3'h5 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h1 == io_read_error_delayed_1_0_REG_12 ?
    read_error_delayed_result_5_1 : _GEN_1784; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1786 = 3'h5 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h2 == io_read_error_delayed_1_0_REG_12 ?
    read_error_delayed_result_5_2 : _GEN_1785; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1787 = 3'h5 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h3 == io_read_error_delayed_1_0_REG_12 ?
    read_error_delayed_result_5_3 : _GEN_1786; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1788 = 3'h5 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h4 == io_read_error_delayed_1_0_REG_12 ?
    read_error_delayed_result_5_4 : _GEN_1787; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1789 = 3'h5 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h5 == io_read_error_delayed_1_0_REG_12 ?
    read_error_delayed_result_5_5 : _GEN_1788; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1790 = 3'h5 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h6 == io_read_error_delayed_1_0_REG_12 ?
    read_error_delayed_result_5_6 : _GEN_1789; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1791 = 3'h5 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h7 == io_read_error_delayed_1_0_REG_12 ?
    read_error_delayed_result_5_7 : _GEN_1790; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1792 = 3'h6 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h0 == io_read_error_delayed_1_0_REG_12 ? _GEN_1390
     : _GEN_1791; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1793 = 3'h6 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h1 == io_read_error_delayed_1_0_REG_12 ?
    read_error_delayed_result_6_1 : _GEN_1792; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1794 = 3'h6 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h2 == io_read_error_delayed_1_0_REG_12 ?
    read_error_delayed_result_6_2 : _GEN_1793; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1795 = 3'h6 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h3 == io_read_error_delayed_1_0_REG_12 ?
    read_error_delayed_result_6_3 : _GEN_1794; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1796 = 3'h6 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h4 == io_read_error_delayed_1_0_REG_12 ?
    read_error_delayed_result_6_4 : _GEN_1795; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1797 = 3'h6 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h5 == io_read_error_delayed_1_0_REG_12 ?
    read_error_delayed_result_6_5 : _GEN_1796; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1798 = 3'h6 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h6 == io_read_error_delayed_1_0_REG_12 ?
    read_error_delayed_result_6_6 : _GEN_1797; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1799 = 3'h6 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h7 == io_read_error_delayed_1_0_REG_12 ?
    read_error_delayed_result_6_7 : _GEN_1798; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1800 = 3'h7 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h0 == io_read_error_delayed_1_0_REG_12 ? _GEN_1414
     : _GEN_1799; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1801 = 3'h7 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h1 == io_read_error_delayed_1_0_REG_12 ?
    read_error_delayed_result_7_1 : _GEN_1800; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1802 = 3'h7 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h2 == io_read_error_delayed_1_0_REG_12 ?
    read_error_delayed_result_7_2 : _GEN_1801; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1803 = 3'h7 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h3 == io_read_error_delayed_1_0_REG_12 ?
    read_error_delayed_result_7_3 : _GEN_1802; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1804 = 3'h7 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h4 == io_read_error_delayed_1_0_REG_12 ?
    read_error_delayed_result_7_4 : _GEN_1803; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1805 = 3'h7 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h5 == io_read_error_delayed_1_0_REG_12 ?
    read_error_delayed_result_7_5 : _GEN_1804; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1806 = 3'h7 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h6 == io_read_error_delayed_1_0_REG_12 ?
    read_error_delayed_result_7_6 : _GEN_1805; // @[BankedDataArray.scala 420:{94,94}]
  wire  _GEN_1807 = 3'h7 == io_read_error_delayed_1_0_REG_10[2:0] & 3'h7 == io_read_error_delayed_1_0_REG_12 ?
    read_error_delayed_result_7_7 : _GEN_1806; // @[BankedDataArray.scala 420:{94,94}]
  wire  _io_read_error_delayed_1_0_T_27 = io_read_error_delayed_1_0_REG_8 & _GEN_1807; // @[BankedDataArray.scala 420:94]
  reg  io_read_error_delayed_1_0_REG_13; // @[BankedDataArray.scala 422:17]
  wire  _io_read_error_delayed_1_0_T_28 = ~io_read_error_delayed_1_0_REG_13; // @[BankedDataArray.scala 422:9]
  reg  io_readline_error_delayed_REG; // @[BankedDataArray.scala 430:47]
  reg  io_readline_error_delayed_REG_1; // @[BankedDataArray.scala 430:39]
  wire [7:0] _io_readline_error_delayed_T_1 = {io_readline_resp_7_error_delayed,io_readline_resp_6_error_delayed,
    io_readline_resp_5_error_delayed,io_readline_resp_4_error_delayed,io_readline_resp_3_error_delayed,
    io_readline_resp_2_error_delayed,io_readline_resp_1_error_delayed,io_readline_resp_0_error_delayed}; // @[BankedDataArray.scala 431:86]
  wire  _io_readline_error_delayed_T_2 = |_io_readline_error_delayed_T_1; // @[BankedDataArray.scala 431:89]
  wire [5:0] sram_waddr_dup_0 = io_write_dup_0_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
  wire [5:0] sram_waddr_dup_1 = io_write_dup_1_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
  wire [5:0] sram_waddr_dup_2 = io_write_dup_2_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
  wire [5:0] sram_waddr_dup_3 = io_write_dup_3_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
  wire [5:0] sram_waddr_dup_4 = io_write_dup_4_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
  wire [5:0] sram_waddr_dup_5 = io_write_dup_5_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
  wire [5:0] sram_waddr_dup_6 = io_write_dup_6_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
  wire [5:0] sram_waddr_dup_7 = io_write_dup_7_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
  wire  _data_banks_0_0_io_wen_T_1 = io_write_dup_0_valid & io_write_bits_wmask[0]; // @[BankedDataArray.scala 440:59]
  reg  ecc_banks_0_0_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15; // @[BankedDataArray.scala 447:25]
  wire [63:0] _x16_syndromeUInt_T = 64'hab55555556aaad5b & io_write_bits_data_0; // @[ECC.scala 147:74]
  wire  _x16_syndromeUInt_T_1 = ^_x16_syndromeUInt_T; // @[ECC.scala 147:79]
  wire [63:0] _x16_syndromeUInt_T_3 = 64'hcd9999999b33366d & io_write_bits_data_0; // @[ECC.scala 147:74]
  wire  _x16_syndromeUInt_T_4 = ^_x16_syndromeUInt_T_3; // @[ECC.scala 147:79]
  wire [63:0] _x16_syndromeUInt_T_6 = 64'hf1e1e1e1e3c3c78e & io_write_bits_data_0; // @[ECC.scala 147:74]
  wire  _x16_syndromeUInt_T_7 = ^_x16_syndromeUInt_T_6; // @[ECC.scala 147:79]
  wire [63:0] _x16_syndromeUInt_T_9 = 64'h1fe01fe03fc07f0 & io_write_bits_data_0; // @[ECC.scala 147:74]
  wire  _x16_syndromeUInt_T_10 = ^_x16_syndromeUInt_T_9; // @[ECC.scala 147:79]
  wire [63:0] _x16_syndromeUInt_T_12 = 64'h1fffe0003fff800 & io_write_bits_data_0; // @[ECC.scala 147:74]
  wire  _x16_syndromeUInt_T_13 = ^_x16_syndromeUInt_T_12; // @[ECC.scala 147:79]
  wire [63:0] _x16_syndromeUInt_T_15 = 64'h1fffffffc000000 & io_write_bits_data_0; // @[ECC.scala 147:74]
  wire  _x16_syndromeUInt_T_16 = ^_x16_syndromeUInt_T_15; // @[ECC.scala 147:79]
  wire [63:0] _x16_syndromeUInt_T_18 = 64'hfe00000000000000 & io_write_bits_data_0; // @[ECC.scala 147:74]
  wire  _x16_syndromeUInt_T_19 = ^_x16_syndromeUInt_T_18; // @[ECC.scala 147:79]
  wire [70:0] _x16_T = {_x16_syndromeUInt_T_19,_x16_syndromeUInt_T_16,_x16_syndromeUInt_T_13,_x16_syndromeUInt_T_10,
    _x16_syndromeUInt_T_7,_x16_syndromeUInt_T_4,_x16_syndromeUInt_T_1,io_write_bits_data_0}; // @[Cat.scala 31:58]
  wire  _x16_T_1 = ^_x16_T; // @[ECC.scala 81:55]
  wire [71:0] _x16_T_3 = {_x16_T_1,_x16_syndromeUInt_T_19,_x16_syndromeUInt_T_16,_x16_syndromeUInt_T_13,
    _x16_syndromeUInt_T_10,_x16_syndromeUInt_T_7,_x16_syndromeUInt_T_4,_x16_syndromeUInt_T_1,io_write_bits_data_0}; // @[Cat.scala 31:58]
  reg [7:0] x16; // @[BankedDataArray.scala 448:23]
  reg  ecc_banks_0_1_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_1; // @[BankedDataArray.scala 447:25]
  reg [7:0] x16_1; // @[BankedDataArray.scala 448:23]
  reg  ecc_banks_0_2_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_2; // @[BankedDataArray.scala 447:25]
  reg [7:0] x16_2; // @[BankedDataArray.scala 448:23]
  reg  ecc_banks_0_3_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_3; // @[BankedDataArray.scala 447:25]
  reg [7:0] x16_3; // @[BankedDataArray.scala 448:23]
  reg  ecc_banks_0_4_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_4; // @[BankedDataArray.scala 447:25]
  reg [7:0] x16_4; // @[BankedDataArray.scala 448:23]
  reg  ecc_banks_0_5_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_5; // @[BankedDataArray.scala 447:25]
  reg [7:0] x16_5; // @[BankedDataArray.scala 448:23]
  reg  ecc_banks_0_6_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_6; // @[BankedDataArray.scala 447:25]
  reg [7:0] x16_6; // @[BankedDataArray.scala 448:23]
  reg  ecc_banks_0_7_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_7; // @[BankedDataArray.scala 447:25]
  reg [7:0] x16_7; // @[BankedDataArray.scala 448:23]
  wire  _data_banks_1_0_io_wen_T_1 = io_write_dup_1_valid & io_write_bits_wmask[1]; // @[BankedDataArray.scala 440:59]
  reg  ecc_banks_1_0_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_8; // @[BankedDataArray.scala 447:25]
  wire [63:0] _x16_syndromeUInt_T_168 = 64'hab55555556aaad5b & io_write_bits_data_1; // @[ECC.scala 147:74]
  wire  _x16_syndromeUInt_T_169 = ^_x16_syndromeUInt_T_168; // @[ECC.scala 147:79]
  wire [63:0] _x16_syndromeUInt_T_171 = 64'hcd9999999b33366d & io_write_bits_data_1; // @[ECC.scala 147:74]
  wire  _x16_syndromeUInt_T_172 = ^_x16_syndromeUInt_T_171; // @[ECC.scala 147:79]
  wire [63:0] _x16_syndromeUInt_T_174 = 64'hf1e1e1e1e3c3c78e & io_write_bits_data_1; // @[ECC.scala 147:74]
  wire  _x16_syndromeUInt_T_175 = ^_x16_syndromeUInt_T_174; // @[ECC.scala 147:79]
  wire [63:0] _x16_syndromeUInt_T_177 = 64'h1fe01fe03fc07f0 & io_write_bits_data_1; // @[ECC.scala 147:74]
  wire  _x16_syndromeUInt_T_178 = ^_x16_syndromeUInt_T_177; // @[ECC.scala 147:79]
  wire [63:0] _x16_syndromeUInt_T_180 = 64'h1fffe0003fff800 & io_write_bits_data_1; // @[ECC.scala 147:74]
  wire  _x16_syndromeUInt_T_181 = ^_x16_syndromeUInt_T_180; // @[ECC.scala 147:79]
  wire [63:0] _x16_syndromeUInt_T_183 = 64'h1fffffffc000000 & io_write_bits_data_1; // @[ECC.scala 147:74]
  wire  _x16_syndromeUInt_T_184 = ^_x16_syndromeUInt_T_183; // @[ECC.scala 147:79]
  wire [63:0] _x16_syndromeUInt_T_186 = 64'hfe00000000000000 & io_write_bits_data_1; // @[ECC.scala 147:74]
  wire  _x16_syndromeUInt_T_187 = ^_x16_syndromeUInt_T_186; // @[ECC.scala 147:79]
  wire [70:0] _x16_T_48 = {_x16_syndromeUInt_T_187,_x16_syndromeUInt_T_184,_x16_syndromeUInt_T_181,
    _x16_syndromeUInt_T_178,_x16_syndromeUInt_T_175,_x16_syndromeUInt_T_172,_x16_syndromeUInt_T_169,io_write_bits_data_1
    }; // @[Cat.scala 31:58]
  wire  _x16_T_49 = ^_x16_T_48; // @[ECC.scala 81:55]
  wire [71:0] _x16_T_51 = {_x16_T_49,_x16_syndromeUInt_T_187,_x16_syndromeUInt_T_184,_x16_syndromeUInt_T_181,
    _x16_syndromeUInt_T_178,_x16_syndromeUInt_T_175,_x16_syndromeUInt_T_172,_x16_syndromeUInt_T_169,io_write_bits_data_1
    }; // @[Cat.scala 31:58]
  reg [7:0] x16_8; // @[BankedDataArray.scala 448:23]
  reg  ecc_banks_1_1_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_9; // @[BankedDataArray.scala 447:25]
  reg [7:0] x16_9; // @[BankedDataArray.scala 448:23]
  reg  ecc_banks_1_2_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_10; // @[BankedDataArray.scala 447:25]
  reg [7:0] x16_10; // @[BankedDataArray.scala 448:23]
  reg  ecc_banks_1_3_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_11; // @[BankedDataArray.scala 447:25]
  reg [7:0] x16_11; // @[BankedDataArray.scala 448:23]
  reg  ecc_banks_1_4_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_12; // @[BankedDataArray.scala 447:25]
  reg [7:0] x16_12; // @[BankedDataArray.scala 448:23]
  reg  ecc_banks_1_5_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_13; // @[BankedDataArray.scala 447:25]
  reg [7:0] x16_13; // @[BankedDataArray.scala 448:23]
  reg  ecc_banks_1_6_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_14; // @[BankedDataArray.scala 447:25]
  reg [7:0] x16_14; // @[BankedDataArray.scala 448:23]
  reg  ecc_banks_1_7_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_15; // @[BankedDataArray.scala 447:25]
  reg [7:0] x16_15; // @[BankedDataArray.scala 448:23]
  wire  _data_banks_2_0_io_wen_T_1 = io_write_dup_2_valid & io_write_bits_wmask[2]; // @[BankedDataArray.scala 440:59]
  reg  ecc_banks_2_0_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_16; // @[BankedDataArray.scala 447:25]
  wire [63:0] _x16_syndromeUInt_T_336 = 64'hab55555556aaad5b & io_write_bits_data_2; // @[ECC.scala 147:74]
  wire  _x16_syndromeUInt_T_337 = ^_x16_syndromeUInt_T_336; // @[ECC.scala 147:79]
  wire [63:0] _x16_syndromeUInt_T_339 = 64'hcd9999999b33366d & io_write_bits_data_2; // @[ECC.scala 147:74]
  wire  _x16_syndromeUInt_T_340 = ^_x16_syndromeUInt_T_339; // @[ECC.scala 147:79]
  wire [63:0] _x16_syndromeUInt_T_342 = 64'hf1e1e1e1e3c3c78e & io_write_bits_data_2; // @[ECC.scala 147:74]
  wire  _x16_syndromeUInt_T_343 = ^_x16_syndromeUInt_T_342; // @[ECC.scala 147:79]
  wire [63:0] _x16_syndromeUInt_T_345 = 64'h1fe01fe03fc07f0 & io_write_bits_data_2; // @[ECC.scala 147:74]
  wire  _x16_syndromeUInt_T_346 = ^_x16_syndromeUInt_T_345; // @[ECC.scala 147:79]
  wire [63:0] _x16_syndromeUInt_T_348 = 64'h1fffe0003fff800 & io_write_bits_data_2; // @[ECC.scala 147:74]
  wire  _x16_syndromeUInt_T_349 = ^_x16_syndromeUInt_T_348; // @[ECC.scala 147:79]
  wire [63:0] _x16_syndromeUInt_T_351 = 64'h1fffffffc000000 & io_write_bits_data_2; // @[ECC.scala 147:74]
  wire  _x16_syndromeUInt_T_352 = ^_x16_syndromeUInt_T_351; // @[ECC.scala 147:79]
  wire [63:0] _x16_syndromeUInt_T_354 = 64'hfe00000000000000 & io_write_bits_data_2; // @[ECC.scala 147:74]
  wire  _x16_syndromeUInt_T_355 = ^_x16_syndromeUInt_T_354; // @[ECC.scala 147:79]
  wire [70:0] _x16_T_96 = {_x16_syndromeUInt_T_355,_x16_syndromeUInt_T_352,_x16_syndromeUInt_T_349,
    _x16_syndromeUInt_T_346,_x16_syndromeUInt_T_343,_x16_syndromeUInt_T_340,_x16_syndromeUInt_T_337,io_write_bits_data_2
    }; // @[Cat.scala 31:58]
  wire  _x16_T_97 = ^_x16_T_96; // @[ECC.scala 81:55]
  wire [71:0] _x16_T_99 = {_x16_T_97,_x16_syndromeUInt_T_355,_x16_syndromeUInt_T_352,_x16_syndromeUInt_T_349,
    _x16_syndromeUInt_T_346,_x16_syndromeUInt_T_343,_x16_syndromeUInt_T_340,_x16_syndromeUInt_T_337,io_write_bits_data_2
    }; // @[Cat.scala 31:58]
  reg [7:0] x16_16; // @[BankedDataArray.scala 448:23]
  reg  ecc_banks_2_1_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_17; // @[BankedDataArray.scala 447:25]
  reg [7:0] x16_17; // @[BankedDataArray.scala 448:23]
  reg  ecc_banks_2_2_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_18; // @[BankedDataArray.scala 447:25]
  reg [7:0] x16_18; // @[BankedDataArray.scala 448:23]
  reg  ecc_banks_2_3_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_19; // @[BankedDataArray.scala 447:25]
  reg [7:0] x16_19; // @[BankedDataArray.scala 448:23]
  reg  ecc_banks_2_4_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_20; // @[BankedDataArray.scala 447:25]
  reg [7:0] x16_20; // @[BankedDataArray.scala 448:23]
  reg  ecc_banks_2_5_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_21; // @[BankedDataArray.scala 447:25]
  reg [7:0] x16_21; // @[BankedDataArray.scala 448:23]
  reg  ecc_banks_2_6_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_22; // @[BankedDataArray.scala 447:25]
  reg [7:0] x16_22; // @[BankedDataArray.scala 448:23]
  reg  ecc_banks_2_7_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_23; // @[BankedDataArray.scala 447:25]
  reg [7:0] x16_23; // @[BankedDataArray.scala 448:23]
  wire  _data_banks_3_0_io_wen_T_1 = io_write_dup_3_valid & io_write_bits_wmask[3]; // @[BankedDataArray.scala 440:59]
  reg  ecc_banks_3_0_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_24; // @[BankedDataArray.scala 447:25]
  wire [63:0] _x16_syndromeUInt_T_504 = 64'hab55555556aaad5b & io_write_bits_data_3; // @[ECC.scala 147:74]
  wire  _x16_syndromeUInt_T_505 = ^_x16_syndromeUInt_T_504; // @[ECC.scala 147:79]
  wire [63:0] _x16_syndromeUInt_T_507 = 64'hcd9999999b33366d & io_write_bits_data_3; // @[ECC.scala 147:74]
  wire  _x16_syndromeUInt_T_508 = ^_x16_syndromeUInt_T_507; // @[ECC.scala 147:79]
  wire [63:0] _x16_syndromeUInt_T_510 = 64'hf1e1e1e1e3c3c78e & io_write_bits_data_3; // @[ECC.scala 147:74]
  wire  _x16_syndromeUInt_T_511 = ^_x16_syndromeUInt_T_510; // @[ECC.scala 147:79]
  wire [63:0] _x16_syndromeUInt_T_513 = 64'h1fe01fe03fc07f0 & io_write_bits_data_3; // @[ECC.scala 147:74]
  wire  _x16_syndromeUInt_T_514 = ^_x16_syndromeUInt_T_513; // @[ECC.scala 147:79]
  wire [63:0] _x16_syndromeUInt_T_516 = 64'h1fffe0003fff800 & io_write_bits_data_3; // @[ECC.scala 147:74]
  wire  _x16_syndromeUInt_T_517 = ^_x16_syndromeUInt_T_516; // @[ECC.scala 147:79]
  wire [63:0] _x16_syndromeUInt_T_519 = 64'h1fffffffc000000 & io_write_bits_data_3; // @[ECC.scala 147:74]
  wire  _x16_syndromeUInt_T_520 = ^_x16_syndromeUInt_T_519; // @[ECC.scala 147:79]
  wire [63:0] _x16_syndromeUInt_T_522 = 64'hfe00000000000000 & io_write_bits_data_3; // @[ECC.scala 147:74]
  wire  _x16_syndromeUInt_T_523 = ^_x16_syndromeUInt_T_522; // @[ECC.scala 147:79]
  wire [70:0] _x16_T_144 = {_x16_syndromeUInt_T_523,_x16_syndromeUInt_T_520,_x16_syndromeUInt_T_517,
    _x16_syndromeUInt_T_514,_x16_syndromeUInt_T_511,_x16_syndromeUInt_T_508,_x16_syndromeUInt_T_505,io_write_bits_data_3
    }; // @[Cat.scala 31:58]
  wire  _x16_T_145 = ^_x16_T_144; // @[ECC.scala 81:55]
  wire [71:0] _x16_T_147 = {_x16_T_145,_x16_syndromeUInt_T_523,_x16_syndromeUInt_T_520,_x16_syndromeUInt_T_517,
    _x16_syndromeUInt_T_514,_x16_syndromeUInt_T_511,_x16_syndromeUInt_T_508,_x16_syndromeUInt_T_505,io_write_bits_data_3
    }; // @[Cat.scala 31:58]
  reg [7:0] x16_24; // @[BankedDataArray.scala 448:23]
  reg  ecc_banks_3_1_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_25; // @[BankedDataArray.scala 447:25]
  reg [7:0] x16_25; // @[BankedDataArray.scala 448:23]
  reg  ecc_banks_3_2_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_26; // @[BankedDataArray.scala 447:25]
  reg [7:0] x16_26; // @[BankedDataArray.scala 448:23]
  reg  ecc_banks_3_3_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_27; // @[BankedDataArray.scala 447:25]
  reg [7:0] x16_27; // @[BankedDataArray.scala 448:23]
  reg  ecc_banks_3_4_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_28; // @[BankedDataArray.scala 447:25]
  reg [7:0] x16_28; // @[BankedDataArray.scala 448:23]
  reg  ecc_banks_3_5_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_29; // @[BankedDataArray.scala 447:25]
  reg [7:0] x16_29; // @[BankedDataArray.scala 448:23]
  reg  ecc_banks_3_6_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_30; // @[BankedDataArray.scala 447:25]
  reg [7:0] x16_30; // @[BankedDataArray.scala 448:23]
  reg  ecc_banks_3_7_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_31; // @[BankedDataArray.scala 447:25]
  reg [7:0] x16_31; // @[BankedDataArray.scala 448:23]
  wire  _data_banks_4_0_io_wen_T_1 = io_write_dup_4_valid & io_write_bits_wmask[4]; // @[BankedDataArray.scala 440:59]
  reg  ecc_banks_4_0_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_32; // @[BankedDataArray.scala 447:25]
  wire [63:0] _x16_syndromeUInt_T_672 = 64'hab55555556aaad5b & io_write_bits_data_4; // @[ECC.scala 147:74]
  wire  _x16_syndromeUInt_T_673 = ^_x16_syndromeUInt_T_672; // @[ECC.scala 147:79]
  wire [63:0] _x16_syndromeUInt_T_675 = 64'hcd9999999b33366d & io_write_bits_data_4; // @[ECC.scala 147:74]
  wire  _x16_syndromeUInt_T_676 = ^_x16_syndromeUInt_T_675; // @[ECC.scala 147:79]
  wire [63:0] _x16_syndromeUInt_T_678 = 64'hf1e1e1e1e3c3c78e & io_write_bits_data_4; // @[ECC.scala 147:74]
  wire  _x16_syndromeUInt_T_679 = ^_x16_syndromeUInt_T_678; // @[ECC.scala 147:79]
  wire [63:0] _x16_syndromeUInt_T_681 = 64'h1fe01fe03fc07f0 & io_write_bits_data_4; // @[ECC.scala 147:74]
  wire  _x16_syndromeUInt_T_682 = ^_x16_syndromeUInt_T_681; // @[ECC.scala 147:79]
  wire [63:0] _x16_syndromeUInt_T_684 = 64'h1fffe0003fff800 & io_write_bits_data_4; // @[ECC.scala 147:74]
  wire  _x16_syndromeUInt_T_685 = ^_x16_syndromeUInt_T_684; // @[ECC.scala 147:79]
  wire [63:0] _x16_syndromeUInt_T_687 = 64'h1fffffffc000000 & io_write_bits_data_4; // @[ECC.scala 147:74]
  wire  _x16_syndromeUInt_T_688 = ^_x16_syndromeUInt_T_687; // @[ECC.scala 147:79]
  wire [63:0] _x16_syndromeUInt_T_690 = 64'hfe00000000000000 & io_write_bits_data_4; // @[ECC.scala 147:74]
  wire  _x16_syndromeUInt_T_691 = ^_x16_syndromeUInt_T_690; // @[ECC.scala 147:79]
  wire [70:0] _x16_T_192 = {_x16_syndromeUInt_T_691,_x16_syndromeUInt_T_688,_x16_syndromeUInt_T_685,
    _x16_syndromeUInt_T_682,_x16_syndromeUInt_T_679,_x16_syndromeUInt_T_676,_x16_syndromeUInt_T_673,io_write_bits_data_4
    }; // @[Cat.scala 31:58]
  wire  _x16_T_193 = ^_x16_T_192; // @[ECC.scala 81:55]
  wire [71:0] _x16_T_195 = {_x16_T_193,_x16_syndromeUInt_T_691,_x16_syndromeUInt_T_688,_x16_syndromeUInt_T_685,
    _x16_syndromeUInt_T_682,_x16_syndromeUInt_T_679,_x16_syndromeUInt_T_676,_x16_syndromeUInt_T_673,io_write_bits_data_4
    }; // @[Cat.scala 31:58]
  reg [7:0] x16_32; // @[BankedDataArray.scala 448:23]
  reg  ecc_banks_4_1_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_33; // @[BankedDataArray.scala 447:25]
  reg [7:0] x16_33; // @[BankedDataArray.scala 448:23]
  reg  ecc_banks_4_2_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_34; // @[BankedDataArray.scala 447:25]
  reg [7:0] x16_34; // @[BankedDataArray.scala 448:23]
  reg  ecc_banks_4_3_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_35; // @[BankedDataArray.scala 447:25]
  reg [7:0] x16_35; // @[BankedDataArray.scala 448:23]
  reg  ecc_banks_4_4_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_36; // @[BankedDataArray.scala 447:25]
  reg [7:0] x16_36; // @[BankedDataArray.scala 448:23]
  reg  ecc_banks_4_5_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_37; // @[BankedDataArray.scala 447:25]
  reg [7:0] x16_37; // @[BankedDataArray.scala 448:23]
  reg  ecc_banks_4_6_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_38; // @[BankedDataArray.scala 447:25]
  reg [7:0] x16_38; // @[BankedDataArray.scala 448:23]
  reg  ecc_banks_4_7_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_39; // @[BankedDataArray.scala 447:25]
  reg [7:0] x16_39; // @[BankedDataArray.scala 448:23]
  wire  _data_banks_5_0_io_wen_T_1 = io_write_dup_5_valid & io_write_bits_wmask[5]; // @[BankedDataArray.scala 440:59]
  reg  ecc_banks_5_0_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_40; // @[BankedDataArray.scala 447:25]
  wire [63:0] _x16_syndromeUInt_T_840 = 64'hab55555556aaad5b & io_write_bits_data_5; // @[ECC.scala 147:74]
  wire  _x16_syndromeUInt_T_841 = ^_x16_syndromeUInt_T_840; // @[ECC.scala 147:79]
  wire [63:0] _x16_syndromeUInt_T_843 = 64'hcd9999999b33366d & io_write_bits_data_5; // @[ECC.scala 147:74]
  wire  _x16_syndromeUInt_T_844 = ^_x16_syndromeUInt_T_843; // @[ECC.scala 147:79]
  wire [63:0] _x16_syndromeUInt_T_846 = 64'hf1e1e1e1e3c3c78e & io_write_bits_data_5; // @[ECC.scala 147:74]
  wire  _x16_syndromeUInt_T_847 = ^_x16_syndromeUInt_T_846; // @[ECC.scala 147:79]
  wire [63:0] _x16_syndromeUInt_T_849 = 64'h1fe01fe03fc07f0 & io_write_bits_data_5; // @[ECC.scala 147:74]
  wire  _x16_syndromeUInt_T_850 = ^_x16_syndromeUInt_T_849; // @[ECC.scala 147:79]
  wire [63:0] _x16_syndromeUInt_T_852 = 64'h1fffe0003fff800 & io_write_bits_data_5; // @[ECC.scala 147:74]
  wire  _x16_syndromeUInt_T_853 = ^_x16_syndromeUInt_T_852; // @[ECC.scala 147:79]
  wire [63:0] _x16_syndromeUInt_T_855 = 64'h1fffffffc000000 & io_write_bits_data_5; // @[ECC.scala 147:74]
  wire  _x16_syndromeUInt_T_856 = ^_x16_syndromeUInt_T_855; // @[ECC.scala 147:79]
  wire [63:0] _x16_syndromeUInt_T_858 = 64'hfe00000000000000 & io_write_bits_data_5; // @[ECC.scala 147:74]
  wire  _x16_syndromeUInt_T_859 = ^_x16_syndromeUInt_T_858; // @[ECC.scala 147:79]
  wire [70:0] _x16_T_240 = {_x16_syndromeUInt_T_859,_x16_syndromeUInt_T_856,_x16_syndromeUInt_T_853,
    _x16_syndromeUInt_T_850,_x16_syndromeUInt_T_847,_x16_syndromeUInt_T_844,_x16_syndromeUInt_T_841,io_write_bits_data_5
    }; // @[Cat.scala 31:58]
  wire  _x16_T_241 = ^_x16_T_240; // @[ECC.scala 81:55]
  wire [71:0] _x16_T_243 = {_x16_T_241,_x16_syndromeUInt_T_859,_x16_syndromeUInt_T_856,_x16_syndromeUInt_T_853,
    _x16_syndromeUInt_T_850,_x16_syndromeUInt_T_847,_x16_syndromeUInt_T_844,_x16_syndromeUInt_T_841,io_write_bits_data_5
    }; // @[Cat.scala 31:58]
  reg [7:0] x16_40; // @[BankedDataArray.scala 448:23]
  reg  ecc_banks_5_1_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_41; // @[BankedDataArray.scala 447:25]
  reg [7:0] x16_41; // @[BankedDataArray.scala 448:23]
  reg  ecc_banks_5_2_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_42; // @[BankedDataArray.scala 447:25]
  reg [7:0] x16_42; // @[BankedDataArray.scala 448:23]
  reg  ecc_banks_5_3_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_43; // @[BankedDataArray.scala 447:25]
  reg [7:0] x16_43; // @[BankedDataArray.scala 448:23]
  reg  ecc_banks_5_4_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_44; // @[BankedDataArray.scala 447:25]
  reg [7:0] x16_44; // @[BankedDataArray.scala 448:23]
  reg  ecc_banks_5_5_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_45; // @[BankedDataArray.scala 447:25]
  reg [7:0] x16_45; // @[BankedDataArray.scala 448:23]
  reg  ecc_banks_5_6_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_46; // @[BankedDataArray.scala 447:25]
  reg [7:0] x16_46; // @[BankedDataArray.scala 448:23]
  reg  ecc_banks_5_7_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_47; // @[BankedDataArray.scala 447:25]
  reg [7:0] x16_47; // @[BankedDataArray.scala 448:23]
  wire  _data_banks_6_0_io_wen_T_1 = io_write_dup_6_valid & io_write_bits_wmask[6]; // @[BankedDataArray.scala 440:59]
  reg  ecc_banks_6_0_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_48; // @[BankedDataArray.scala 447:25]
  wire [63:0] _x16_syndromeUInt_T_1008 = 64'hab55555556aaad5b & io_write_bits_data_6; // @[ECC.scala 147:74]
  wire  _x16_syndromeUInt_T_1009 = ^_x16_syndromeUInt_T_1008; // @[ECC.scala 147:79]
  wire [63:0] _x16_syndromeUInt_T_1011 = 64'hcd9999999b33366d & io_write_bits_data_6; // @[ECC.scala 147:74]
  wire  _x16_syndromeUInt_T_1012 = ^_x16_syndromeUInt_T_1011; // @[ECC.scala 147:79]
  wire [63:0] _x16_syndromeUInt_T_1014 = 64'hf1e1e1e1e3c3c78e & io_write_bits_data_6; // @[ECC.scala 147:74]
  wire  _x16_syndromeUInt_T_1015 = ^_x16_syndromeUInt_T_1014; // @[ECC.scala 147:79]
  wire [63:0] _x16_syndromeUInt_T_1017 = 64'h1fe01fe03fc07f0 & io_write_bits_data_6; // @[ECC.scala 147:74]
  wire  _x16_syndromeUInt_T_1018 = ^_x16_syndromeUInt_T_1017; // @[ECC.scala 147:79]
  wire [63:0] _x16_syndromeUInt_T_1020 = 64'h1fffe0003fff800 & io_write_bits_data_6; // @[ECC.scala 147:74]
  wire  _x16_syndromeUInt_T_1021 = ^_x16_syndromeUInt_T_1020; // @[ECC.scala 147:79]
  wire [63:0] _x16_syndromeUInt_T_1023 = 64'h1fffffffc000000 & io_write_bits_data_6; // @[ECC.scala 147:74]
  wire  _x16_syndromeUInt_T_1024 = ^_x16_syndromeUInt_T_1023; // @[ECC.scala 147:79]
  wire [63:0] _x16_syndromeUInt_T_1026 = 64'hfe00000000000000 & io_write_bits_data_6; // @[ECC.scala 147:74]
  wire  _x16_syndromeUInt_T_1027 = ^_x16_syndromeUInt_T_1026; // @[ECC.scala 147:79]
  wire [70:0] _x16_T_288 = {_x16_syndromeUInt_T_1027,_x16_syndromeUInt_T_1024,_x16_syndromeUInt_T_1021,
    _x16_syndromeUInt_T_1018,_x16_syndromeUInt_T_1015,_x16_syndromeUInt_T_1012,_x16_syndromeUInt_T_1009,
    io_write_bits_data_6}; // @[Cat.scala 31:58]
  wire  _x16_T_289 = ^_x16_T_288; // @[ECC.scala 81:55]
  wire [71:0] _x16_T_291 = {_x16_T_289,_x16_syndromeUInt_T_1027,_x16_syndromeUInt_T_1024,_x16_syndromeUInt_T_1021,
    _x16_syndromeUInt_T_1018,_x16_syndromeUInt_T_1015,_x16_syndromeUInt_T_1012,_x16_syndromeUInt_T_1009,
    io_write_bits_data_6}; // @[Cat.scala 31:58]
  reg [7:0] x16_48; // @[BankedDataArray.scala 448:23]
  reg  ecc_banks_6_1_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_49; // @[BankedDataArray.scala 447:25]
  reg [7:0] x16_49; // @[BankedDataArray.scala 448:23]
  reg  ecc_banks_6_2_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_50; // @[BankedDataArray.scala 447:25]
  reg [7:0] x16_50; // @[BankedDataArray.scala 448:23]
  reg  ecc_banks_6_3_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_51; // @[BankedDataArray.scala 447:25]
  reg [7:0] x16_51; // @[BankedDataArray.scala 448:23]
  reg  ecc_banks_6_4_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_52; // @[BankedDataArray.scala 447:25]
  reg [7:0] x16_52; // @[BankedDataArray.scala 448:23]
  reg  ecc_banks_6_5_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_53; // @[BankedDataArray.scala 447:25]
  reg [7:0] x16_53; // @[BankedDataArray.scala 448:23]
  reg  ecc_banks_6_6_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_54; // @[BankedDataArray.scala 447:25]
  reg [7:0] x16_54; // @[BankedDataArray.scala 448:23]
  reg  ecc_banks_6_7_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_55; // @[BankedDataArray.scala 447:25]
  reg [7:0] x16_55; // @[BankedDataArray.scala 448:23]
  wire  _data_banks_7_0_io_wen_T_1 = io_write_dup_7_valid & io_write_bits_wmask[7]; // @[BankedDataArray.scala 440:59]
  reg  ecc_banks_7_0_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_56; // @[BankedDataArray.scala 447:25]
  wire [63:0] _x16_syndromeUInt_T_1176 = 64'hab55555556aaad5b & io_write_bits_data_7; // @[ECC.scala 147:74]
  wire  _x16_syndromeUInt_T_1177 = ^_x16_syndromeUInt_T_1176; // @[ECC.scala 147:79]
  wire [63:0] _x16_syndromeUInt_T_1179 = 64'hcd9999999b33366d & io_write_bits_data_7; // @[ECC.scala 147:74]
  wire  _x16_syndromeUInt_T_1180 = ^_x16_syndromeUInt_T_1179; // @[ECC.scala 147:79]
  wire [63:0] _x16_syndromeUInt_T_1182 = 64'hf1e1e1e1e3c3c78e & io_write_bits_data_7; // @[ECC.scala 147:74]
  wire  _x16_syndromeUInt_T_1183 = ^_x16_syndromeUInt_T_1182; // @[ECC.scala 147:79]
  wire [63:0] _x16_syndromeUInt_T_1185 = 64'h1fe01fe03fc07f0 & io_write_bits_data_7; // @[ECC.scala 147:74]
  wire  _x16_syndromeUInt_T_1186 = ^_x16_syndromeUInt_T_1185; // @[ECC.scala 147:79]
  wire [63:0] _x16_syndromeUInt_T_1188 = 64'h1fffe0003fff800 & io_write_bits_data_7; // @[ECC.scala 147:74]
  wire  _x16_syndromeUInt_T_1189 = ^_x16_syndromeUInt_T_1188; // @[ECC.scala 147:79]
  wire [63:0] _x16_syndromeUInt_T_1191 = 64'h1fffffffc000000 & io_write_bits_data_7; // @[ECC.scala 147:74]
  wire  _x16_syndromeUInt_T_1192 = ^_x16_syndromeUInt_T_1191; // @[ECC.scala 147:79]
  wire [63:0] _x16_syndromeUInt_T_1194 = 64'hfe00000000000000 & io_write_bits_data_7; // @[ECC.scala 147:74]
  wire  _x16_syndromeUInt_T_1195 = ^_x16_syndromeUInt_T_1194; // @[ECC.scala 147:79]
  wire [70:0] _x16_T_336 = {_x16_syndromeUInt_T_1195,_x16_syndromeUInt_T_1192,_x16_syndromeUInt_T_1189,
    _x16_syndromeUInt_T_1186,_x16_syndromeUInt_T_1183,_x16_syndromeUInt_T_1180,_x16_syndromeUInt_T_1177,
    io_write_bits_data_7}; // @[Cat.scala 31:58]
  wire  _x16_T_337 = ^_x16_T_336; // @[ECC.scala 81:55]
  wire [71:0] _x16_T_339 = {_x16_T_337,_x16_syndromeUInt_T_1195,_x16_syndromeUInt_T_1192,_x16_syndromeUInt_T_1189,
    _x16_syndromeUInt_T_1186,_x16_syndromeUInt_T_1183,_x16_syndromeUInt_T_1180,_x16_syndromeUInt_T_1177,
    io_write_bits_data_7}; // @[Cat.scala 31:58]
  reg [7:0] x16_56; // @[BankedDataArray.scala 448:23]
  reg  ecc_banks_7_1_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_57; // @[BankedDataArray.scala 447:25]
  reg [7:0] x16_57; // @[BankedDataArray.scala 448:23]
  reg  ecc_banks_7_2_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_58; // @[BankedDataArray.scala 447:25]
  reg [7:0] x16_58; // @[BankedDataArray.scala 448:23]
  reg  ecc_banks_7_3_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_59; // @[BankedDataArray.scala 447:25]
  reg [7:0] x16_59; // @[BankedDataArray.scala 448:23]
  reg  ecc_banks_7_4_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_60; // @[BankedDataArray.scala 447:25]
  reg [7:0] x16_60; // @[BankedDataArray.scala 448:23]
  reg  ecc_banks_7_5_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_61; // @[BankedDataArray.scala 447:25]
  reg [7:0] x16_61; // @[BankedDataArray.scala 448:23]
  reg  ecc_banks_7_6_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_62; // @[BankedDataArray.scala 447:25]
  reg [7:0] x16_62; // @[BankedDataArray.scala 448:23]
  reg  ecc_banks_7_7_io_wreq_valid_REG; // @[BankedDataArray.scala 445:41]
  reg [5:0] x15_63; // @[BankedDataArray.scala 447:25]
  reg [7:0] x16_63; // @[BankedDataArray.scala 448:23]
  wire  _T_444 = io_cacheOp_req_bits_opCode == 64'h3; // @[CacheInstruction.scala 96:54]
  wire  _T_445 = io_cacheOp_req_valid & _T_444; // @[BankedDataArray.scala 468:30]
  wire [31:0] _data_banks_0_0_io_ren_T_1 = 32'h1 << io_cacheOp_req_bits_wayNum[4:0]; // @[OneHot.scala 57:35]
  wire  _T_446 = io_cacheOp_req_bits_opCode_dup_0 == 64'h1; // @[CacheInstruction.scala 94:54]
  wire [63:0] _GEN_1844 = io_cacheOp_req_dup_0_valid & _T_446 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr}; // @[BankedDataArray.scala 478:106 483:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_1846 = io_cacheOp_req_dup_0_valid & _T_446 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_1}; // @[BankedDataArray.scala 478:106 483:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_1848 = io_cacheOp_req_dup_0_valid & _T_446 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_2}; // @[BankedDataArray.scala 478:106 483:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_1850 = io_cacheOp_req_dup_0_valid & _T_446 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_3}; // @[BankedDataArray.scala 478:106 483:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_1852 = io_cacheOp_req_dup_0_valid & _T_446 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_4}; // @[BankedDataArray.scala 478:106 483:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_1854 = io_cacheOp_req_dup_0_valid & _T_446 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_5}; // @[BankedDataArray.scala 478:106 483:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_1856 = io_cacheOp_req_dup_0_valid & _T_446 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_6}; // @[BankedDataArray.scala 478:106 483:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_1858 = io_cacheOp_req_dup_0_valid & _T_446 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_7}; // @[BankedDataArray.scala 478:106 483:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_1860 = io_cacheOp_req_dup_0_valid & _T_446 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_8}; // @[BankedDataArray.scala 478:106 483:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_1862 = io_cacheOp_req_dup_0_valid & _T_446 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_9}; // @[BankedDataArray.scala 478:106 483:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_1864 = io_cacheOp_req_dup_0_valid & _T_446 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_10}; // @[BankedDataArray.scala 478:106 483:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_1866 = io_cacheOp_req_dup_0_valid & _T_446 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_11}; // @[BankedDataArray.scala 478:106 483:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_1868 = io_cacheOp_req_dup_0_valid & _T_446 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_12}; // @[BankedDataArray.scala 478:106 483:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_1870 = io_cacheOp_req_dup_0_valid & _T_446 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_13}; // @[BankedDataArray.scala 478:106 483:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_1872 = io_cacheOp_req_dup_0_valid & _T_446 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_14}; // @[BankedDataArray.scala 478:106 483:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_1874 = io_cacheOp_req_dup_0_valid & _T_446 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_15}; // @[BankedDataArray.scala 478:106 483:39 SRAMTemplate.scala 42:17]
  wire  _GEN_1875 = io_cacheOp_req_dup_0_valid & _T_446 | _T_445; // @[BankedDataArray.scala 478:106 486:23]
  wire  _T_448 = io_cacheOp_req_bits_opCode_dup_1 == 64'h7; // @[CacheInstruction.scala 100:54]
  wire  _GEN_1896 = io_cacheOp_req_dup_1_valid & _T_448 | _GEN_1875; // @[BankedDataArray.scala 488:102 497:23]
  wire  _T_450 = io_cacheOp_req_bits_opCode_dup_2 == 64'h5; // @[CacheInstruction.scala 98:54]
  wire [63:0] _GEN_1898 = io_cacheOp_req_dup_2_valid & _T_450 ? io_cacheOp_req_bits_index : {{58'd0}, x15}; // @[BankedDataArray.scala 499:105 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_1899 = io_cacheOp_req_dup_2_valid & _T_450 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16}; // @[BankedDataArray.scala 499:105 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_1901 = io_cacheOp_req_dup_2_valid & _T_450 ? io_cacheOp_req_bits_index : {{58'd0}, x15_1}; // @[BankedDataArray.scala 499:105 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_1902 = io_cacheOp_req_dup_2_valid & _T_450 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_1}; // @[BankedDataArray.scala 499:105 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_1904 = io_cacheOp_req_dup_2_valid & _T_450 ? io_cacheOp_req_bits_index : {{58'd0}, x15_2}; // @[BankedDataArray.scala 499:105 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_1905 = io_cacheOp_req_dup_2_valid & _T_450 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_2}; // @[BankedDataArray.scala 499:105 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_1907 = io_cacheOp_req_dup_2_valid & _T_450 ? io_cacheOp_req_bits_index : {{58'd0}, x15_3}; // @[BankedDataArray.scala 499:105 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_1908 = io_cacheOp_req_dup_2_valid & _T_450 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_3}; // @[BankedDataArray.scala 499:105 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_1910 = io_cacheOp_req_dup_2_valid & _T_450 ? io_cacheOp_req_bits_index : {{58'd0}, x15_4}; // @[BankedDataArray.scala 499:105 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_1911 = io_cacheOp_req_dup_2_valid & _T_450 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_4}; // @[BankedDataArray.scala 499:105 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_1913 = io_cacheOp_req_dup_2_valid & _T_450 ? io_cacheOp_req_bits_index : {{58'd0}, x15_5}; // @[BankedDataArray.scala 499:105 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_1914 = io_cacheOp_req_dup_2_valid & _T_450 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_5}; // @[BankedDataArray.scala 499:105 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_1916 = io_cacheOp_req_dup_2_valid & _T_450 ? io_cacheOp_req_bits_index : {{58'd0}, x15_6}; // @[BankedDataArray.scala 499:105 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_1917 = io_cacheOp_req_dup_2_valid & _T_450 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_6}; // @[BankedDataArray.scala 499:105 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_1919 = io_cacheOp_req_dup_2_valid & _T_450 ? io_cacheOp_req_bits_index : {{58'd0}, x15_7}; // @[BankedDataArray.scala 499:105 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_1920 = io_cacheOp_req_dup_2_valid & _T_450 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_7}; // @[BankedDataArray.scala 499:105 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_1922 = io_cacheOp_req_dup_2_valid & _T_450 ? io_cacheOp_req_bits_index : {{58'd0}, x15_8}; // @[BankedDataArray.scala 499:105 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_1923 = io_cacheOp_req_dup_2_valid & _T_450 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_8}; // @[BankedDataArray.scala 499:105 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_1925 = io_cacheOp_req_dup_2_valid & _T_450 ? io_cacheOp_req_bits_index : {{58'd0}, x15_9}; // @[BankedDataArray.scala 499:105 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_1926 = io_cacheOp_req_dup_2_valid & _T_450 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_9}; // @[BankedDataArray.scala 499:105 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_1928 = io_cacheOp_req_dup_2_valid & _T_450 ? io_cacheOp_req_bits_index : {{58'd0}, x15_10}; // @[BankedDataArray.scala 499:105 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_1929 = io_cacheOp_req_dup_2_valid & _T_450 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_10}; // @[BankedDataArray.scala 499:105 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_1931 = io_cacheOp_req_dup_2_valid & _T_450 ? io_cacheOp_req_bits_index : {{58'd0}, x15_11}; // @[BankedDataArray.scala 499:105 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_1932 = io_cacheOp_req_dup_2_valid & _T_450 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_11}; // @[BankedDataArray.scala 499:105 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_1934 = io_cacheOp_req_dup_2_valid & _T_450 ? io_cacheOp_req_bits_index : {{58'd0}, x15_12}; // @[BankedDataArray.scala 499:105 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_1935 = io_cacheOp_req_dup_2_valid & _T_450 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_12}; // @[BankedDataArray.scala 499:105 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_1937 = io_cacheOp_req_dup_2_valid & _T_450 ? io_cacheOp_req_bits_index : {{58'd0}, x15_13}; // @[BankedDataArray.scala 499:105 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_1938 = io_cacheOp_req_dup_2_valid & _T_450 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_13}; // @[BankedDataArray.scala 499:105 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_1940 = io_cacheOp_req_dup_2_valid & _T_450 ? io_cacheOp_req_bits_index : {{58'd0}, x15_14}; // @[BankedDataArray.scala 499:105 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_1941 = io_cacheOp_req_dup_2_valid & _T_450 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_14}; // @[BankedDataArray.scala 499:105 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_1943 = io_cacheOp_req_dup_2_valid & _T_450 ? io_cacheOp_req_bits_index : {{58'd0}, x15_15}; // @[BankedDataArray.scala 499:105 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_1944 = io_cacheOp_req_dup_2_valid & _T_450 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_15}; // @[BankedDataArray.scala 499:105 SRAMTemplate.scala 53:{15,15}]
  wire  _GEN_1945 = io_cacheOp_req_dup_2_valid & _T_450 | _GEN_1896; // @[BankedDataArray.scala 499:105 511:23]
  wire  _T_452 = io_cacheOp_req_bits_opCode_dup_3 == 64'h3; // @[CacheInstruction.scala 96:54]
  wire  _GEN_1978 = io_cacheOp_req_dup_3_valid & _T_452 | _GEN_1945; // @[BankedDataArray.scala 515:103 523:23]
  wire  _T_454 = io_cacheOp_req_bits_opCode_dup_4 == 64'h1; // @[CacheInstruction.scala 94:54]
  wire [63:0] _GEN_1980 = io_cacheOp_req_dup_4_valid & _T_454 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_16}; // @[BankedDataArray.scala 525:106 530:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_1982 = io_cacheOp_req_dup_4_valid & _T_454 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_17}; // @[BankedDataArray.scala 525:106 530:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_1984 = io_cacheOp_req_dup_4_valid & _T_454 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_18}; // @[BankedDataArray.scala 525:106 530:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_1986 = io_cacheOp_req_dup_4_valid & _T_454 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_19}; // @[BankedDataArray.scala 525:106 530:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_1988 = io_cacheOp_req_dup_4_valid & _T_454 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_20}; // @[BankedDataArray.scala 525:106 530:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_1990 = io_cacheOp_req_dup_4_valid & _T_454 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_21}; // @[BankedDataArray.scala 525:106 530:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_1992 = io_cacheOp_req_dup_4_valid & _T_454 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_22}; // @[BankedDataArray.scala 525:106 530:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_1994 = io_cacheOp_req_dup_4_valid & _T_454 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_23}; // @[BankedDataArray.scala 525:106 530:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_1996 = io_cacheOp_req_dup_4_valid & _T_454 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_24}; // @[BankedDataArray.scala 525:106 530:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_1998 = io_cacheOp_req_dup_4_valid & _T_454 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_25}; // @[BankedDataArray.scala 525:106 530:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_2000 = io_cacheOp_req_dup_4_valid & _T_454 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_26}; // @[BankedDataArray.scala 525:106 530:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_2002 = io_cacheOp_req_dup_4_valid & _T_454 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_27}; // @[BankedDataArray.scala 525:106 530:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_2004 = io_cacheOp_req_dup_4_valid & _T_454 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_28}; // @[BankedDataArray.scala 525:106 530:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_2006 = io_cacheOp_req_dup_4_valid & _T_454 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_29}; // @[BankedDataArray.scala 525:106 530:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_2008 = io_cacheOp_req_dup_4_valid & _T_454 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_30}; // @[BankedDataArray.scala 525:106 530:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_2010 = io_cacheOp_req_dup_4_valid & _T_454 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_31}; // @[BankedDataArray.scala 525:106 530:39 SRAMTemplate.scala 42:17]
  wire  _GEN_2011 = io_cacheOp_req_dup_4_valid & _T_454 | _GEN_1978; // @[BankedDataArray.scala 525:106 533:23]
  wire  _T_456 = io_cacheOp_req_bits_opCode_dup_5 == 64'h7; // @[CacheInstruction.scala 100:54]
  wire  _GEN_2032 = io_cacheOp_req_dup_5_valid & _T_456 | _GEN_2011; // @[BankedDataArray.scala 535:102 544:23]
  wire  _T_458 = io_cacheOp_req_bits_opCode_dup_6 == 64'h5; // @[CacheInstruction.scala 98:54]
  wire [63:0] _GEN_2034 = io_cacheOp_req_dup_6_valid & _T_458 ? io_cacheOp_req_bits_index : {{58'd0}, x15_16}; // @[BankedDataArray.scala 546:105 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_2035 = io_cacheOp_req_dup_6_valid & _T_458 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_16}; // @[BankedDataArray.scala 546:105 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_2037 = io_cacheOp_req_dup_6_valid & _T_458 ? io_cacheOp_req_bits_index : {{58'd0}, x15_17}; // @[BankedDataArray.scala 546:105 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_2038 = io_cacheOp_req_dup_6_valid & _T_458 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_17}; // @[BankedDataArray.scala 546:105 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_2040 = io_cacheOp_req_dup_6_valid & _T_458 ? io_cacheOp_req_bits_index : {{58'd0}, x15_18}; // @[BankedDataArray.scala 546:105 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_2041 = io_cacheOp_req_dup_6_valid & _T_458 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_18}; // @[BankedDataArray.scala 546:105 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_2043 = io_cacheOp_req_dup_6_valid & _T_458 ? io_cacheOp_req_bits_index : {{58'd0}, x15_19}; // @[BankedDataArray.scala 546:105 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_2044 = io_cacheOp_req_dup_6_valid & _T_458 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_19}; // @[BankedDataArray.scala 546:105 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_2046 = io_cacheOp_req_dup_6_valid & _T_458 ? io_cacheOp_req_bits_index : {{58'd0}, x15_20}; // @[BankedDataArray.scala 546:105 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_2047 = io_cacheOp_req_dup_6_valid & _T_458 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_20}; // @[BankedDataArray.scala 546:105 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_2049 = io_cacheOp_req_dup_6_valid & _T_458 ? io_cacheOp_req_bits_index : {{58'd0}, x15_21}; // @[BankedDataArray.scala 546:105 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_2050 = io_cacheOp_req_dup_6_valid & _T_458 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_21}; // @[BankedDataArray.scala 546:105 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_2052 = io_cacheOp_req_dup_6_valid & _T_458 ? io_cacheOp_req_bits_index : {{58'd0}, x15_22}; // @[BankedDataArray.scala 546:105 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_2053 = io_cacheOp_req_dup_6_valid & _T_458 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_22}; // @[BankedDataArray.scala 546:105 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_2055 = io_cacheOp_req_dup_6_valid & _T_458 ? io_cacheOp_req_bits_index : {{58'd0}, x15_23}; // @[BankedDataArray.scala 546:105 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_2056 = io_cacheOp_req_dup_6_valid & _T_458 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_23}; // @[BankedDataArray.scala 546:105 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_2058 = io_cacheOp_req_dup_6_valid & _T_458 ? io_cacheOp_req_bits_index : {{58'd0}, x15_24}; // @[BankedDataArray.scala 546:105 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_2059 = io_cacheOp_req_dup_6_valid & _T_458 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_24}; // @[BankedDataArray.scala 546:105 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_2061 = io_cacheOp_req_dup_6_valid & _T_458 ? io_cacheOp_req_bits_index : {{58'd0}, x15_25}; // @[BankedDataArray.scala 546:105 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_2062 = io_cacheOp_req_dup_6_valid & _T_458 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_25}; // @[BankedDataArray.scala 546:105 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_2064 = io_cacheOp_req_dup_6_valid & _T_458 ? io_cacheOp_req_bits_index : {{58'd0}, x15_26}; // @[BankedDataArray.scala 546:105 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_2065 = io_cacheOp_req_dup_6_valid & _T_458 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_26}; // @[BankedDataArray.scala 546:105 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_2067 = io_cacheOp_req_dup_6_valid & _T_458 ? io_cacheOp_req_bits_index : {{58'd0}, x15_27}; // @[BankedDataArray.scala 546:105 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_2068 = io_cacheOp_req_dup_6_valid & _T_458 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_27}; // @[BankedDataArray.scala 546:105 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_2070 = io_cacheOp_req_dup_6_valid & _T_458 ? io_cacheOp_req_bits_index : {{58'd0}, x15_28}; // @[BankedDataArray.scala 546:105 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_2071 = io_cacheOp_req_dup_6_valid & _T_458 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_28}; // @[BankedDataArray.scala 546:105 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_2073 = io_cacheOp_req_dup_6_valid & _T_458 ? io_cacheOp_req_bits_index : {{58'd0}, x15_29}; // @[BankedDataArray.scala 546:105 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_2074 = io_cacheOp_req_dup_6_valid & _T_458 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_29}; // @[BankedDataArray.scala 546:105 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_2076 = io_cacheOp_req_dup_6_valid & _T_458 ? io_cacheOp_req_bits_index : {{58'd0}, x15_30}; // @[BankedDataArray.scala 546:105 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_2077 = io_cacheOp_req_dup_6_valid & _T_458 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_30}; // @[BankedDataArray.scala 546:105 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_2079 = io_cacheOp_req_dup_6_valid & _T_458 ? io_cacheOp_req_bits_index : {{58'd0}, x15_31}; // @[BankedDataArray.scala 546:105 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_2080 = io_cacheOp_req_dup_6_valid & _T_458 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_31}; // @[BankedDataArray.scala 546:105 SRAMTemplate.scala 53:{15,15}]
  wire  _GEN_2081 = io_cacheOp_req_dup_6_valid & _T_458 | _GEN_2032; // @[BankedDataArray.scala 546:105 558:23]
  wire  _T_460 = io_cacheOp_req_bits_opCode_dup_7 == 64'h3; // @[CacheInstruction.scala 96:54]
  wire  _GEN_2146 = io_cacheOp_req_dup_7_valid & _T_460 | _GEN_2081; // @[BankedDataArray.scala 561:103 569:23]
  wire  _T_462 = io_cacheOp_req_bits_opCode_dup_8 == 64'h1; // @[CacheInstruction.scala 94:54]
  wire [63:0] _GEN_2148 = io_cacheOp_req_dup_8_valid & _T_462 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_32}; // @[BankedDataArray.scala 571:106 576:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_2150 = io_cacheOp_req_dup_8_valid & _T_462 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_33}; // @[BankedDataArray.scala 571:106 576:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_2152 = io_cacheOp_req_dup_8_valid & _T_462 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_34}; // @[BankedDataArray.scala 571:106 576:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_2154 = io_cacheOp_req_dup_8_valid & _T_462 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_35}; // @[BankedDataArray.scala 571:106 576:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_2156 = io_cacheOp_req_dup_8_valid & _T_462 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_36}; // @[BankedDataArray.scala 571:106 576:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_2158 = io_cacheOp_req_dup_8_valid & _T_462 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_37}; // @[BankedDataArray.scala 571:106 576:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_2160 = io_cacheOp_req_dup_8_valid & _T_462 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_38}; // @[BankedDataArray.scala 571:106 576:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_2162 = io_cacheOp_req_dup_8_valid & _T_462 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_39}; // @[BankedDataArray.scala 571:106 576:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_2164 = io_cacheOp_req_dup_8_valid & _T_462 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_40}; // @[BankedDataArray.scala 571:106 576:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_2166 = io_cacheOp_req_dup_8_valid & _T_462 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_41}; // @[BankedDataArray.scala 571:106 576:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_2168 = io_cacheOp_req_dup_8_valid & _T_462 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_42}; // @[BankedDataArray.scala 571:106 576:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_2170 = io_cacheOp_req_dup_8_valid & _T_462 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_43}; // @[BankedDataArray.scala 571:106 576:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_2172 = io_cacheOp_req_dup_8_valid & _T_462 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_44}; // @[BankedDataArray.scala 571:106 576:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_2174 = io_cacheOp_req_dup_8_valid & _T_462 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_45}; // @[BankedDataArray.scala 571:106 576:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_2176 = io_cacheOp_req_dup_8_valid & _T_462 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_46}; // @[BankedDataArray.scala 571:106 576:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_2178 = io_cacheOp_req_dup_8_valid & _T_462 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_47}; // @[BankedDataArray.scala 571:106 576:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_2180 = io_cacheOp_req_dup_8_valid & _T_462 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_48}; // @[BankedDataArray.scala 571:106 576:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_2182 = io_cacheOp_req_dup_8_valid & _T_462 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_49}; // @[BankedDataArray.scala 571:106 576:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_2184 = io_cacheOp_req_dup_8_valid & _T_462 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_50}; // @[BankedDataArray.scala 571:106 576:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_2186 = io_cacheOp_req_dup_8_valid & _T_462 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_51}; // @[BankedDataArray.scala 571:106 576:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_2188 = io_cacheOp_req_dup_8_valid & _T_462 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_52}; // @[BankedDataArray.scala 571:106 576:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_2190 = io_cacheOp_req_dup_8_valid & _T_462 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_53}; // @[BankedDataArray.scala 571:106 576:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_2192 = io_cacheOp_req_dup_8_valid & _T_462 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_54}; // @[BankedDataArray.scala 571:106 576:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_2194 = io_cacheOp_req_dup_8_valid & _T_462 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_55}; // @[BankedDataArray.scala 571:106 576:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_2196 = io_cacheOp_req_dup_8_valid & _T_462 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_56}; // @[BankedDataArray.scala 571:106 576:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_2198 = io_cacheOp_req_dup_8_valid & _T_462 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_57}; // @[BankedDataArray.scala 571:106 576:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_2200 = io_cacheOp_req_dup_8_valid & _T_462 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_58}; // @[BankedDataArray.scala 571:106 576:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_2202 = io_cacheOp_req_dup_8_valid & _T_462 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_59}; // @[BankedDataArray.scala 571:106 576:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_2204 = io_cacheOp_req_dup_8_valid & _T_462 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_60}; // @[BankedDataArray.scala 571:106 576:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_2206 = io_cacheOp_req_dup_8_valid & _T_462 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_61}; // @[BankedDataArray.scala 571:106 576:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_2208 = io_cacheOp_req_dup_8_valid & _T_462 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_62}; // @[BankedDataArray.scala 571:106 576:39 SRAMTemplate.scala 42:17]
  wire [63:0] _GEN_2210 = io_cacheOp_req_dup_8_valid & _T_462 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr_63}; // @[BankedDataArray.scala 571:106 576:39 SRAMTemplate.scala 42:17]
  wire  _GEN_2211 = io_cacheOp_req_dup_8_valid & _T_462 | _GEN_2146; // @[BankedDataArray.scala 571:106 579:23]
  wire  _T_464 = io_cacheOp_req_bits_opCode_dup_9 == 64'h7; // @[CacheInstruction.scala 100:54]
  wire  _GEN_2252 = io_cacheOp_req_dup_9_valid & _T_464 | _GEN_2211; // @[BankedDataArray.scala 581:102 590:23]
  wire  _T_466 = io_cacheOp_req_bits_opCode_dup_10 == 64'h5; // @[CacheInstruction.scala 98:54]
  wire [63:0] _GEN_2254 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_index : {{58'd0}, x15_32}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_2255 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_32}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_2257 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_index : {{58'd0}, x15_33}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_2258 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_33}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_2260 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_index : {{58'd0}, x15_34}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_2261 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_34}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_2263 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_index : {{58'd0}, x15_35}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_2264 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_35}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_2266 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_index : {{58'd0}, x15_36}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_2267 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_36}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_2269 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_index : {{58'd0}, x15_37}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_2270 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_37}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_2272 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_index : {{58'd0}, x15_38}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_2273 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_38}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_2275 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_index : {{58'd0}, x15_39}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_2276 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_39}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_2278 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_index : {{58'd0}, x15_40}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_2279 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_40}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_2281 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_index : {{58'd0}, x15_41}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_2282 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_41}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_2284 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_index : {{58'd0}, x15_42}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_2285 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_42}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_2287 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_index : {{58'd0}, x15_43}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_2288 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_43}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_2290 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_index : {{58'd0}, x15_44}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_2291 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_44}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_2293 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_index : {{58'd0}, x15_45}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_2294 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_45}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_2296 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_index : {{58'd0}, x15_46}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_2297 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_46}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_2299 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_index : {{58'd0}, x15_47}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_2300 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_47}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_2302 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_index : {{58'd0}, x15_48}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_2303 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_48}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_2305 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_index : {{58'd0}, x15_49}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_2306 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_49}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_2308 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_index : {{58'd0}, x15_50}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_2309 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_50}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_2311 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_index : {{58'd0}, x15_51}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_2312 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_51}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_2314 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_index : {{58'd0}, x15_52}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_2315 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_52}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_2317 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_index : {{58'd0}, x15_53}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_2318 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_53}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_2320 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_index : {{58'd0}, x15_54}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_2321 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_54}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_2323 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_index : {{58'd0}, x15_55}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_2324 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_55}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_2326 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_index : {{58'd0}, x15_56}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_2327 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_56}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_2329 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_index : {{58'd0}, x15_57}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_2330 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_57}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_2332 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_index : {{58'd0}, x15_58}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_2333 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_58}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_2335 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_index : {{58'd0}, x15_59}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_2336 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_59}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_2338 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_index : {{58'd0}, x15_60}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_2339 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_60}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_2341 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_index : {{58'd0}, x15_61}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_2342 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_61}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_2344 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_index : {{58'd0}, x15_62}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_2345 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_62}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 53:{15,15}]
  wire [63:0] _GEN_2347 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_index : {{58'd0}, x15_63}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 42:{17,17}]
  wire [63:0] _GEN_2348 = io_cacheOp_req_dup_10_valid & _T_466 ? io_cacheOp_req_bits_write_data_ecc : {{56'd0}, x16_63}; // @[BankedDataArray.scala 592:107 SRAMTemplate.scala 53:{15,15}]
  wire  cacheOpShouldResp = io_cacheOp_req_dup_10_valid & _T_466 | _GEN_2252; // @[BankedDataArray.scala 592:107 604:23]
  reg  io_cacheOp_resp_valid_REG; // @[BankedDataArray.scala 607:35]
  reg [4:0] io_cacheOp_resp_bits_read_data_vec_0_REG; // @[BankedDataArray.scala 609:86]
  wire [63:0] _GEN_2351 = 3'h1 == io_cacheOp_resp_bits_read_data_vec_0_REG[2:0] ? read_result_0_1_raw_data :
    read_result_0_0_raw_data; // @[BankedDataArray.scala 609:{52,52}]
  wire [63:0] _GEN_2352 = 3'h2 == io_cacheOp_resp_bits_read_data_vec_0_REG[2:0] ? read_result_0_2_raw_data : _GEN_2351; // @[BankedDataArray.scala 609:{52,52}]
  wire [63:0] _GEN_2353 = 3'h3 == io_cacheOp_resp_bits_read_data_vec_0_REG[2:0] ? read_result_0_3_raw_data : _GEN_2352; // @[BankedDataArray.scala 609:{52,52}]
  wire [63:0] _GEN_2354 = 3'h4 == io_cacheOp_resp_bits_read_data_vec_0_REG[2:0] ? read_result_0_4_raw_data : _GEN_2353; // @[BankedDataArray.scala 609:{52,52}]
  wire [63:0] _GEN_2355 = 3'h5 == io_cacheOp_resp_bits_read_data_vec_0_REG[2:0] ? read_result_0_5_raw_data : _GEN_2354; // @[BankedDataArray.scala 609:{52,52}]
  wire [63:0] _GEN_2356 = 3'h6 == io_cacheOp_resp_bits_read_data_vec_0_REG[2:0] ? read_result_0_6_raw_data : _GEN_2355; // @[BankedDataArray.scala 609:{52,52}]
  reg [4:0] eccReadResult_0_REG; // @[BankedDataArray.scala 610:71]
  wire [7:0] _GEN_2359 = 3'h1 == eccReadResult_0_REG[2:0] ? read_result_0_1_ecc : read_result_0_0_ecc; // @[BankedDataArray.scala 610:{37,37}]
  wire [7:0] _GEN_2360 = 3'h2 == eccReadResult_0_REG[2:0] ? read_result_0_2_ecc : _GEN_2359; // @[BankedDataArray.scala 610:{37,37}]
  wire [7:0] _GEN_2361 = 3'h3 == eccReadResult_0_REG[2:0] ? read_result_0_3_ecc : _GEN_2360; // @[BankedDataArray.scala 610:{37,37}]
  wire [7:0] _GEN_2362 = 3'h4 == eccReadResult_0_REG[2:0] ? read_result_0_4_ecc : _GEN_2361; // @[BankedDataArray.scala 610:{37,37}]
  wire [7:0] _GEN_2363 = 3'h5 == eccReadResult_0_REG[2:0] ? read_result_0_5_ecc : _GEN_2362; // @[BankedDataArray.scala 610:{37,37}]
  wire [7:0] _GEN_2364 = 3'h6 == eccReadResult_0_REG[2:0] ? read_result_0_6_ecc : _GEN_2363; // @[BankedDataArray.scala 610:{37,37}]
  wire [7:0] eccReadResult_0 = 3'h7 == eccReadResult_0_REG[2:0] ? read_result_0_7_ecc : _GEN_2364; // @[BankedDataArray.scala 610:{37,37}]
  reg [4:0] io_cacheOp_resp_bits_read_data_vec_1_REG; // @[BankedDataArray.scala 609:86]
  wire [63:0] _GEN_2367 = 3'h1 == io_cacheOp_resp_bits_read_data_vec_1_REG[2:0] ? read_result_1_1_raw_data :
    read_result_1_0_raw_data; // @[BankedDataArray.scala 609:{52,52}]
  wire [63:0] _GEN_2368 = 3'h2 == io_cacheOp_resp_bits_read_data_vec_1_REG[2:0] ? read_result_1_2_raw_data : _GEN_2367; // @[BankedDataArray.scala 609:{52,52}]
  wire [63:0] _GEN_2369 = 3'h3 == io_cacheOp_resp_bits_read_data_vec_1_REG[2:0] ? read_result_1_3_raw_data : _GEN_2368; // @[BankedDataArray.scala 609:{52,52}]
  wire [63:0] _GEN_2370 = 3'h4 == io_cacheOp_resp_bits_read_data_vec_1_REG[2:0] ? read_result_1_4_raw_data : _GEN_2369; // @[BankedDataArray.scala 609:{52,52}]
  wire [63:0] _GEN_2371 = 3'h5 == io_cacheOp_resp_bits_read_data_vec_1_REG[2:0] ? read_result_1_5_raw_data : _GEN_2370; // @[BankedDataArray.scala 609:{52,52}]
  wire [63:0] _GEN_2372 = 3'h6 == io_cacheOp_resp_bits_read_data_vec_1_REG[2:0] ? read_result_1_6_raw_data : _GEN_2371; // @[BankedDataArray.scala 609:{52,52}]
  reg [4:0] eccReadResult_1_REG; // @[BankedDataArray.scala 610:71]
  wire [7:0] _GEN_2375 = 3'h1 == eccReadResult_1_REG[2:0] ? read_result_1_1_ecc : read_result_1_0_ecc; // @[BankedDataArray.scala 610:{37,37}]
  wire [7:0] _GEN_2376 = 3'h2 == eccReadResult_1_REG[2:0] ? read_result_1_2_ecc : _GEN_2375; // @[BankedDataArray.scala 610:{37,37}]
  wire [7:0] _GEN_2377 = 3'h3 == eccReadResult_1_REG[2:0] ? read_result_1_3_ecc : _GEN_2376; // @[BankedDataArray.scala 610:{37,37}]
  wire [7:0] _GEN_2378 = 3'h4 == eccReadResult_1_REG[2:0] ? read_result_1_4_ecc : _GEN_2377; // @[BankedDataArray.scala 610:{37,37}]
  wire [7:0] _GEN_2379 = 3'h5 == eccReadResult_1_REG[2:0] ? read_result_1_5_ecc : _GEN_2378; // @[BankedDataArray.scala 610:{37,37}]
  wire [7:0] _GEN_2380 = 3'h6 == eccReadResult_1_REG[2:0] ? read_result_1_6_ecc : _GEN_2379; // @[BankedDataArray.scala 610:{37,37}]
  wire [7:0] eccReadResult_1 = 3'h7 == eccReadResult_1_REG[2:0] ? read_result_1_7_ecc : _GEN_2380; // @[BankedDataArray.scala 610:{37,37}]
  reg [4:0] io_cacheOp_resp_bits_read_data_vec_2_REG; // @[BankedDataArray.scala 609:86]
  wire [63:0] _GEN_2383 = 3'h1 == io_cacheOp_resp_bits_read_data_vec_2_REG[2:0] ? read_result_2_1_raw_data :
    read_result_2_0_raw_data; // @[BankedDataArray.scala 609:{52,52}]
  wire [63:0] _GEN_2384 = 3'h2 == io_cacheOp_resp_bits_read_data_vec_2_REG[2:0] ? read_result_2_2_raw_data : _GEN_2383; // @[BankedDataArray.scala 609:{52,52}]
  wire [63:0] _GEN_2385 = 3'h3 == io_cacheOp_resp_bits_read_data_vec_2_REG[2:0] ? read_result_2_3_raw_data : _GEN_2384; // @[BankedDataArray.scala 609:{52,52}]
  wire [63:0] _GEN_2386 = 3'h4 == io_cacheOp_resp_bits_read_data_vec_2_REG[2:0] ? read_result_2_4_raw_data : _GEN_2385; // @[BankedDataArray.scala 609:{52,52}]
  wire [63:0] _GEN_2387 = 3'h5 == io_cacheOp_resp_bits_read_data_vec_2_REG[2:0] ? read_result_2_5_raw_data : _GEN_2386; // @[BankedDataArray.scala 609:{52,52}]
  wire [63:0] _GEN_2388 = 3'h6 == io_cacheOp_resp_bits_read_data_vec_2_REG[2:0] ? read_result_2_6_raw_data : _GEN_2387; // @[BankedDataArray.scala 609:{52,52}]
  reg [4:0] eccReadResult_2_REG; // @[BankedDataArray.scala 610:71]
  wire [7:0] _GEN_2391 = 3'h1 == eccReadResult_2_REG[2:0] ? read_result_2_1_ecc : read_result_2_0_ecc; // @[BankedDataArray.scala 610:{37,37}]
  wire [7:0] _GEN_2392 = 3'h2 == eccReadResult_2_REG[2:0] ? read_result_2_2_ecc : _GEN_2391; // @[BankedDataArray.scala 610:{37,37}]
  wire [7:0] _GEN_2393 = 3'h3 == eccReadResult_2_REG[2:0] ? read_result_2_3_ecc : _GEN_2392; // @[BankedDataArray.scala 610:{37,37}]
  wire [7:0] _GEN_2394 = 3'h4 == eccReadResult_2_REG[2:0] ? read_result_2_4_ecc : _GEN_2393; // @[BankedDataArray.scala 610:{37,37}]
  wire [7:0] _GEN_2395 = 3'h5 == eccReadResult_2_REG[2:0] ? read_result_2_5_ecc : _GEN_2394; // @[BankedDataArray.scala 610:{37,37}]
  wire [7:0] _GEN_2396 = 3'h6 == eccReadResult_2_REG[2:0] ? read_result_2_6_ecc : _GEN_2395; // @[BankedDataArray.scala 610:{37,37}]
  wire [7:0] eccReadResult_2 = 3'h7 == eccReadResult_2_REG[2:0] ? read_result_2_7_ecc : _GEN_2396; // @[BankedDataArray.scala 610:{37,37}]
  reg [4:0] io_cacheOp_resp_bits_read_data_vec_3_REG; // @[BankedDataArray.scala 609:86]
  wire [63:0] _GEN_2399 = 3'h1 == io_cacheOp_resp_bits_read_data_vec_3_REG[2:0] ? read_result_3_1_raw_data :
    read_result_3_0_raw_data; // @[BankedDataArray.scala 609:{52,52}]
  wire [63:0] _GEN_2400 = 3'h2 == io_cacheOp_resp_bits_read_data_vec_3_REG[2:0] ? read_result_3_2_raw_data : _GEN_2399; // @[BankedDataArray.scala 609:{52,52}]
  wire [63:0] _GEN_2401 = 3'h3 == io_cacheOp_resp_bits_read_data_vec_3_REG[2:0] ? read_result_3_3_raw_data : _GEN_2400; // @[BankedDataArray.scala 609:{52,52}]
  wire [63:0] _GEN_2402 = 3'h4 == io_cacheOp_resp_bits_read_data_vec_3_REG[2:0] ? read_result_3_4_raw_data : _GEN_2401; // @[BankedDataArray.scala 609:{52,52}]
  wire [63:0] _GEN_2403 = 3'h5 == io_cacheOp_resp_bits_read_data_vec_3_REG[2:0] ? read_result_3_5_raw_data : _GEN_2402; // @[BankedDataArray.scala 609:{52,52}]
  wire [63:0] _GEN_2404 = 3'h6 == io_cacheOp_resp_bits_read_data_vec_3_REG[2:0] ? read_result_3_6_raw_data : _GEN_2403; // @[BankedDataArray.scala 609:{52,52}]
  reg [4:0] eccReadResult_3_REG; // @[BankedDataArray.scala 610:71]
  wire [7:0] _GEN_2407 = 3'h1 == eccReadResult_3_REG[2:0] ? read_result_3_1_ecc : read_result_3_0_ecc; // @[BankedDataArray.scala 610:{37,37}]
  wire [7:0] _GEN_2408 = 3'h2 == eccReadResult_3_REG[2:0] ? read_result_3_2_ecc : _GEN_2407; // @[BankedDataArray.scala 610:{37,37}]
  wire [7:0] _GEN_2409 = 3'h3 == eccReadResult_3_REG[2:0] ? read_result_3_3_ecc : _GEN_2408; // @[BankedDataArray.scala 610:{37,37}]
  wire [7:0] _GEN_2410 = 3'h4 == eccReadResult_3_REG[2:0] ? read_result_3_4_ecc : _GEN_2409; // @[BankedDataArray.scala 610:{37,37}]
  wire [7:0] _GEN_2411 = 3'h5 == eccReadResult_3_REG[2:0] ? read_result_3_5_ecc : _GEN_2410; // @[BankedDataArray.scala 610:{37,37}]
  wire [7:0] _GEN_2412 = 3'h6 == eccReadResult_3_REG[2:0] ? read_result_3_6_ecc : _GEN_2411; // @[BankedDataArray.scala 610:{37,37}]
  wire [7:0] eccReadResult_3 = 3'h7 == eccReadResult_3_REG[2:0] ? read_result_3_7_ecc : _GEN_2412; // @[BankedDataArray.scala 610:{37,37}]
  reg [4:0] io_cacheOp_resp_bits_read_data_vec_4_REG; // @[BankedDataArray.scala 609:86]
  wire [63:0] _GEN_2415 = 3'h1 == io_cacheOp_resp_bits_read_data_vec_4_REG[2:0] ? read_result_4_1_raw_data :
    read_result_4_0_raw_data; // @[BankedDataArray.scala 609:{52,52}]
  wire [63:0] _GEN_2416 = 3'h2 == io_cacheOp_resp_bits_read_data_vec_4_REG[2:0] ? read_result_4_2_raw_data : _GEN_2415; // @[BankedDataArray.scala 609:{52,52}]
  wire [63:0] _GEN_2417 = 3'h3 == io_cacheOp_resp_bits_read_data_vec_4_REG[2:0] ? read_result_4_3_raw_data : _GEN_2416; // @[BankedDataArray.scala 609:{52,52}]
  wire [63:0] _GEN_2418 = 3'h4 == io_cacheOp_resp_bits_read_data_vec_4_REG[2:0] ? read_result_4_4_raw_data : _GEN_2417; // @[BankedDataArray.scala 609:{52,52}]
  wire [63:0] _GEN_2419 = 3'h5 == io_cacheOp_resp_bits_read_data_vec_4_REG[2:0] ? read_result_4_5_raw_data : _GEN_2418; // @[BankedDataArray.scala 609:{52,52}]
  wire [63:0] _GEN_2420 = 3'h6 == io_cacheOp_resp_bits_read_data_vec_4_REG[2:0] ? read_result_4_6_raw_data : _GEN_2419; // @[BankedDataArray.scala 609:{52,52}]
  reg [4:0] eccReadResult_4_REG; // @[BankedDataArray.scala 610:71]
  wire [7:0] _GEN_2423 = 3'h1 == eccReadResult_4_REG[2:0] ? read_result_4_1_ecc : read_result_4_0_ecc; // @[BankedDataArray.scala 610:{37,37}]
  wire [7:0] _GEN_2424 = 3'h2 == eccReadResult_4_REG[2:0] ? read_result_4_2_ecc : _GEN_2423; // @[BankedDataArray.scala 610:{37,37}]
  wire [7:0] _GEN_2425 = 3'h3 == eccReadResult_4_REG[2:0] ? read_result_4_3_ecc : _GEN_2424; // @[BankedDataArray.scala 610:{37,37}]
  wire [7:0] _GEN_2426 = 3'h4 == eccReadResult_4_REG[2:0] ? read_result_4_4_ecc : _GEN_2425; // @[BankedDataArray.scala 610:{37,37}]
  wire [7:0] _GEN_2427 = 3'h5 == eccReadResult_4_REG[2:0] ? read_result_4_5_ecc : _GEN_2426; // @[BankedDataArray.scala 610:{37,37}]
  wire [7:0] _GEN_2428 = 3'h6 == eccReadResult_4_REG[2:0] ? read_result_4_6_ecc : _GEN_2427; // @[BankedDataArray.scala 610:{37,37}]
  wire [7:0] eccReadResult_4 = 3'h7 == eccReadResult_4_REG[2:0] ? read_result_4_7_ecc : _GEN_2428; // @[BankedDataArray.scala 610:{37,37}]
  reg [4:0] io_cacheOp_resp_bits_read_data_vec_5_REG; // @[BankedDataArray.scala 609:86]
  wire [63:0] _GEN_2431 = 3'h1 == io_cacheOp_resp_bits_read_data_vec_5_REG[2:0] ? read_result_5_1_raw_data :
    read_result_5_0_raw_data; // @[BankedDataArray.scala 609:{52,52}]
  wire [63:0] _GEN_2432 = 3'h2 == io_cacheOp_resp_bits_read_data_vec_5_REG[2:0] ? read_result_5_2_raw_data : _GEN_2431; // @[BankedDataArray.scala 609:{52,52}]
  wire [63:0] _GEN_2433 = 3'h3 == io_cacheOp_resp_bits_read_data_vec_5_REG[2:0] ? read_result_5_3_raw_data : _GEN_2432; // @[BankedDataArray.scala 609:{52,52}]
  wire [63:0] _GEN_2434 = 3'h4 == io_cacheOp_resp_bits_read_data_vec_5_REG[2:0] ? read_result_5_4_raw_data : _GEN_2433; // @[BankedDataArray.scala 609:{52,52}]
  wire [63:0] _GEN_2435 = 3'h5 == io_cacheOp_resp_bits_read_data_vec_5_REG[2:0] ? read_result_5_5_raw_data : _GEN_2434; // @[BankedDataArray.scala 609:{52,52}]
  wire [63:0] _GEN_2436 = 3'h6 == io_cacheOp_resp_bits_read_data_vec_5_REG[2:0] ? read_result_5_6_raw_data : _GEN_2435; // @[BankedDataArray.scala 609:{52,52}]
  reg [4:0] eccReadResult_5_REG; // @[BankedDataArray.scala 610:71]
  wire [7:0] _GEN_2439 = 3'h1 == eccReadResult_5_REG[2:0] ? read_result_5_1_ecc : read_result_5_0_ecc; // @[BankedDataArray.scala 610:{37,37}]
  wire [7:0] _GEN_2440 = 3'h2 == eccReadResult_5_REG[2:0] ? read_result_5_2_ecc : _GEN_2439; // @[BankedDataArray.scala 610:{37,37}]
  wire [7:0] _GEN_2441 = 3'h3 == eccReadResult_5_REG[2:0] ? read_result_5_3_ecc : _GEN_2440; // @[BankedDataArray.scala 610:{37,37}]
  wire [7:0] _GEN_2442 = 3'h4 == eccReadResult_5_REG[2:0] ? read_result_5_4_ecc : _GEN_2441; // @[BankedDataArray.scala 610:{37,37}]
  wire [7:0] _GEN_2443 = 3'h5 == eccReadResult_5_REG[2:0] ? read_result_5_5_ecc : _GEN_2442; // @[BankedDataArray.scala 610:{37,37}]
  wire [7:0] _GEN_2444 = 3'h6 == eccReadResult_5_REG[2:0] ? read_result_5_6_ecc : _GEN_2443; // @[BankedDataArray.scala 610:{37,37}]
  wire [7:0] eccReadResult_5 = 3'h7 == eccReadResult_5_REG[2:0] ? read_result_5_7_ecc : _GEN_2444; // @[BankedDataArray.scala 610:{37,37}]
  reg [4:0] io_cacheOp_resp_bits_read_data_vec_6_REG; // @[BankedDataArray.scala 609:86]
  wire [63:0] _GEN_2447 = 3'h1 == io_cacheOp_resp_bits_read_data_vec_6_REG[2:0] ? read_result_6_1_raw_data :
    read_result_6_0_raw_data; // @[BankedDataArray.scala 609:{52,52}]
  wire [63:0] _GEN_2448 = 3'h2 == io_cacheOp_resp_bits_read_data_vec_6_REG[2:0] ? read_result_6_2_raw_data : _GEN_2447; // @[BankedDataArray.scala 609:{52,52}]
  wire [63:0] _GEN_2449 = 3'h3 == io_cacheOp_resp_bits_read_data_vec_6_REG[2:0] ? read_result_6_3_raw_data : _GEN_2448; // @[BankedDataArray.scala 609:{52,52}]
  wire [63:0] _GEN_2450 = 3'h4 == io_cacheOp_resp_bits_read_data_vec_6_REG[2:0] ? read_result_6_4_raw_data : _GEN_2449; // @[BankedDataArray.scala 609:{52,52}]
  wire [63:0] _GEN_2451 = 3'h5 == io_cacheOp_resp_bits_read_data_vec_6_REG[2:0] ? read_result_6_5_raw_data : _GEN_2450; // @[BankedDataArray.scala 609:{52,52}]
  wire [63:0] _GEN_2452 = 3'h6 == io_cacheOp_resp_bits_read_data_vec_6_REG[2:0] ? read_result_6_6_raw_data : _GEN_2451; // @[BankedDataArray.scala 609:{52,52}]
  reg [4:0] eccReadResult_6_REG; // @[BankedDataArray.scala 610:71]
  wire [7:0] _GEN_2455 = 3'h1 == eccReadResult_6_REG[2:0] ? read_result_6_1_ecc : read_result_6_0_ecc; // @[BankedDataArray.scala 610:{37,37}]
  wire [7:0] _GEN_2456 = 3'h2 == eccReadResult_6_REG[2:0] ? read_result_6_2_ecc : _GEN_2455; // @[BankedDataArray.scala 610:{37,37}]
  wire [7:0] _GEN_2457 = 3'h3 == eccReadResult_6_REG[2:0] ? read_result_6_3_ecc : _GEN_2456; // @[BankedDataArray.scala 610:{37,37}]
  wire [7:0] _GEN_2458 = 3'h4 == eccReadResult_6_REG[2:0] ? read_result_6_4_ecc : _GEN_2457; // @[BankedDataArray.scala 610:{37,37}]
  wire [7:0] _GEN_2459 = 3'h5 == eccReadResult_6_REG[2:0] ? read_result_6_5_ecc : _GEN_2458; // @[BankedDataArray.scala 610:{37,37}]
  wire [7:0] _GEN_2460 = 3'h6 == eccReadResult_6_REG[2:0] ? read_result_6_6_ecc : _GEN_2459; // @[BankedDataArray.scala 610:{37,37}]
  wire [7:0] eccReadResult_6 = 3'h7 == eccReadResult_6_REG[2:0] ? read_result_6_7_ecc : _GEN_2460; // @[BankedDataArray.scala 610:{37,37}]
  reg [4:0] io_cacheOp_resp_bits_read_data_vec_7_REG; // @[BankedDataArray.scala 609:86]
  wire [63:0] _GEN_2463 = 3'h1 == io_cacheOp_resp_bits_read_data_vec_7_REG[2:0] ? read_result_7_1_raw_data :
    read_result_7_0_raw_data; // @[BankedDataArray.scala 609:{52,52}]
  wire [63:0] _GEN_2464 = 3'h2 == io_cacheOp_resp_bits_read_data_vec_7_REG[2:0] ? read_result_7_2_raw_data : _GEN_2463; // @[BankedDataArray.scala 609:{52,52}]
  wire [63:0] _GEN_2465 = 3'h3 == io_cacheOp_resp_bits_read_data_vec_7_REG[2:0] ? read_result_7_3_raw_data : _GEN_2464; // @[BankedDataArray.scala 609:{52,52}]
  wire [63:0] _GEN_2466 = 3'h4 == io_cacheOp_resp_bits_read_data_vec_7_REG[2:0] ? read_result_7_4_raw_data : _GEN_2465; // @[BankedDataArray.scala 609:{52,52}]
  wire [63:0] _GEN_2467 = 3'h5 == io_cacheOp_resp_bits_read_data_vec_7_REG[2:0] ? read_result_7_5_raw_data : _GEN_2466; // @[BankedDataArray.scala 609:{52,52}]
  wire [63:0] _GEN_2468 = 3'h6 == io_cacheOp_resp_bits_read_data_vec_7_REG[2:0] ? read_result_7_6_raw_data : _GEN_2467; // @[BankedDataArray.scala 609:{52,52}]
  reg [4:0] eccReadResult_7_REG; // @[BankedDataArray.scala 610:71]
  wire [7:0] _GEN_2471 = 3'h1 == eccReadResult_7_REG[2:0] ? read_result_7_1_ecc : read_result_7_0_ecc; // @[BankedDataArray.scala 610:{37,37}]
  wire [7:0] _GEN_2472 = 3'h2 == eccReadResult_7_REG[2:0] ? read_result_7_2_ecc : _GEN_2471; // @[BankedDataArray.scala 610:{37,37}]
  wire [7:0] _GEN_2473 = 3'h3 == eccReadResult_7_REG[2:0] ? read_result_7_3_ecc : _GEN_2472; // @[BankedDataArray.scala 610:{37,37}]
  wire [7:0] _GEN_2474 = 3'h4 == eccReadResult_7_REG[2:0] ? read_result_7_4_ecc : _GEN_2473; // @[BankedDataArray.scala 610:{37,37}]
  wire [7:0] _GEN_2475 = 3'h5 == eccReadResult_7_REG[2:0] ? read_result_7_5_ecc : _GEN_2474; // @[BankedDataArray.scala 610:{37,37}]
  wire [7:0] _GEN_2476 = 3'h6 == eccReadResult_7_REG[2:0] ? read_result_7_6_ecc : _GEN_2475; // @[BankedDataArray.scala 610:{37,37}]
  wire [7:0] eccReadResult_7 = 3'h7 == eccReadResult_7_REG[2:0] ? read_result_7_7_ecc : _GEN_2476; // @[BankedDataArray.scala 610:{37,37}]
  reg [63:0] io_cacheOp_resp_bits_read_data_ecc_REG; // @[BankedDataArray.scala 613:26]
  wire [7:0] _GEN_2479 = 3'h1 == io_cacheOp_resp_bits_read_data_ecc_REG[2:0] ? eccReadResult_1 : eccReadResult_0; // @[BankedDataArray.scala 612:{44,44}]
  wire [7:0] _GEN_2480 = 3'h2 == io_cacheOp_resp_bits_read_data_ecc_REG[2:0] ? eccReadResult_2 : _GEN_2479; // @[BankedDataArray.scala 612:{44,44}]
  wire [7:0] _GEN_2481 = 3'h3 == io_cacheOp_resp_bits_read_data_ecc_REG[2:0] ? eccReadResult_3 : _GEN_2480; // @[BankedDataArray.scala 612:{44,44}]
  wire [7:0] _GEN_2482 = 3'h4 == io_cacheOp_resp_bits_read_data_ecc_REG[2:0] ? eccReadResult_4 : _GEN_2481; // @[BankedDataArray.scala 612:{44,44}]
  wire [7:0] _GEN_2483 = 3'h5 == io_cacheOp_resp_bits_read_data_ecc_REG[2:0] ? eccReadResult_5 : _GEN_2482; // @[BankedDataArray.scala 612:{44,44}]
  wire [7:0] _GEN_2484 = 3'h6 == io_cacheOp_resp_bits_read_data_ecc_REG[2:0] ? eccReadResult_6 : _GEN_2483; // @[BankedDataArray.scala 612:{44,44}]
  wire [7:0] _GEN_2485 = 3'h7 == io_cacheOp_resp_bits_read_data_ecc_REG[2:0] ? eccReadResult_7 : _GEN_2484; // @[BankedDataArray.scala 612:{44,44}]
  wire [7:0] _io_cacheOp_resp_bits_read_data_ecc_T_2 = io_cacheOp_resp_valid ? _GEN_2485 : 8'h0; // @[BankedDataArray.scala 612:44]
  wire [3:0] _GEN_2486 = rr_bank_conflict_0_1 ? bank_addrs_0_0 : 4'h0; // @[BankedDataArray.scala 627:32 630:38 637:38]
  wire [3:0] _GEN_2487 = rr_bank_conflict_0_1 ? 4'h8 : 4'h0; // @[BankedDataArray.scala 627:32 630:38 637:38]
  reg [63:0] cnt; // @[ChiselDB.scala 133:22]
  DataSRAM data_banks_0_0 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_0_0_clock),
    .io_wen(data_banks_0_0_io_wen),
    .io_waddr(data_banks_0_0_io_waddr),
    .io_wdata(data_banks_0_0_io_wdata),
    .io_ren(data_banks_0_0_io_ren),
    .io_raddr(data_banks_0_0_io_raddr),
    .io_rdata(data_banks_0_0_io_rdata)
  );
  DataSRAM data_banks_0_1 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_0_1_clock),
    .io_wen(data_banks_0_1_io_wen),
    .io_waddr(data_banks_0_1_io_waddr),
    .io_wdata(data_banks_0_1_io_wdata),
    .io_ren(data_banks_0_1_io_ren),
    .io_raddr(data_banks_0_1_io_raddr),
    .io_rdata(data_banks_0_1_io_rdata)
  );
  DataSRAM data_banks_0_2 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_0_2_clock),
    .io_wen(data_banks_0_2_io_wen),
    .io_waddr(data_banks_0_2_io_waddr),
    .io_wdata(data_banks_0_2_io_wdata),
    .io_ren(data_banks_0_2_io_ren),
    .io_raddr(data_banks_0_2_io_raddr),
    .io_rdata(data_banks_0_2_io_rdata)
  );
  DataSRAM data_banks_0_3 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_0_3_clock),
    .io_wen(data_banks_0_3_io_wen),
    .io_waddr(data_banks_0_3_io_waddr),
    .io_wdata(data_banks_0_3_io_wdata),
    .io_ren(data_banks_0_3_io_ren),
    .io_raddr(data_banks_0_3_io_raddr),
    .io_rdata(data_banks_0_3_io_rdata)
  );
  DataSRAM data_banks_0_4 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_0_4_clock),
    .io_wen(data_banks_0_4_io_wen),
    .io_waddr(data_banks_0_4_io_waddr),
    .io_wdata(data_banks_0_4_io_wdata),
    .io_ren(data_banks_0_4_io_ren),
    .io_raddr(data_banks_0_4_io_raddr),
    .io_rdata(data_banks_0_4_io_rdata)
  );
  DataSRAM data_banks_0_5 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_0_5_clock),
    .io_wen(data_banks_0_5_io_wen),
    .io_waddr(data_banks_0_5_io_waddr),
    .io_wdata(data_banks_0_5_io_wdata),
    .io_ren(data_banks_0_5_io_ren),
    .io_raddr(data_banks_0_5_io_raddr),
    .io_rdata(data_banks_0_5_io_rdata)
  );
  DataSRAM data_banks_0_6 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_0_6_clock),
    .io_wen(data_banks_0_6_io_wen),
    .io_waddr(data_banks_0_6_io_waddr),
    .io_wdata(data_banks_0_6_io_wdata),
    .io_ren(data_banks_0_6_io_ren),
    .io_raddr(data_banks_0_6_io_raddr),
    .io_rdata(data_banks_0_6_io_rdata)
  );
  DataSRAM data_banks_0_7 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_0_7_clock),
    .io_wen(data_banks_0_7_io_wen),
    .io_waddr(data_banks_0_7_io_waddr),
    .io_wdata(data_banks_0_7_io_wdata),
    .io_ren(data_banks_0_7_io_ren),
    .io_raddr(data_banks_0_7_io_raddr),
    .io_rdata(data_banks_0_7_io_rdata)
  );
  DataSRAM data_banks_1_0 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_1_0_clock),
    .io_wen(data_banks_1_0_io_wen),
    .io_waddr(data_banks_1_0_io_waddr),
    .io_wdata(data_banks_1_0_io_wdata),
    .io_ren(data_banks_1_0_io_ren),
    .io_raddr(data_banks_1_0_io_raddr),
    .io_rdata(data_banks_1_0_io_rdata)
  );
  DataSRAM data_banks_1_1 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_1_1_clock),
    .io_wen(data_banks_1_1_io_wen),
    .io_waddr(data_banks_1_1_io_waddr),
    .io_wdata(data_banks_1_1_io_wdata),
    .io_ren(data_banks_1_1_io_ren),
    .io_raddr(data_banks_1_1_io_raddr),
    .io_rdata(data_banks_1_1_io_rdata)
  );
  DataSRAM data_banks_1_2 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_1_2_clock),
    .io_wen(data_banks_1_2_io_wen),
    .io_waddr(data_banks_1_2_io_waddr),
    .io_wdata(data_banks_1_2_io_wdata),
    .io_ren(data_banks_1_2_io_ren),
    .io_raddr(data_banks_1_2_io_raddr),
    .io_rdata(data_banks_1_2_io_rdata)
  );
  DataSRAM data_banks_1_3 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_1_3_clock),
    .io_wen(data_banks_1_3_io_wen),
    .io_waddr(data_banks_1_3_io_waddr),
    .io_wdata(data_banks_1_3_io_wdata),
    .io_ren(data_banks_1_3_io_ren),
    .io_raddr(data_banks_1_3_io_raddr),
    .io_rdata(data_banks_1_3_io_rdata)
  );
  DataSRAM data_banks_1_4 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_1_4_clock),
    .io_wen(data_banks_1_4_io_wen),
    .io_waddr(data_banks_1_4_io_waddr),
    .io_wdata(data_banks_1_4_io_wdata),
    .io_ren(data_banks_1_4_io_ren),
    .io_raddr(data_banks_1_4_io_raddr),
    .io_rdata(data_banks_1_4_io_rdata)
  );
  DataSRAM data_banks_1_5 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_1_5_clock),
    .io_wen(data_banks_1_5_io_wen),
    .io_waddr(data_banks_1_5_io_waddr),
    .io_wdata(data_banks_1_5_io_wdata),
    .io_ren(data_banks_1_5_io_ren),
    .io_raddr(data_banks_1_5_io_raddr),
    .io_rdata(data_banks_1_5_io_rdata)
  );
  DataSRAM data_banks_1_6 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_1_6_clock),
    .io_wen(data_banks_1_6_io_wen),
    .io_waddr(data_banks_1_6_io_waddr),
    .io_wdata(data_banks_1_6_io_wdata),
    .io_ren(data_banks_1_6_io_ren),
    .io_raddr(data_banks_1_6_io_raddr),
    .io_rdata(data_banks_1_6_io_rdata)
  );
  DataSRAM data_banks_1_7 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_1_7_clock),
    .io_wen(data_banks_1_7_io_wen),
    .io_waddr(data_banks_1_7_io_waddr),
    .io_wdata(data_banks_1_7_io_wdata),
    .io_ren(data_banks_1_7_io_ren),
    .io_raddr(data_banks_1_7_io_raddr),
    .io_rdata(data_banks_1_7_io_rdata)
  );
  DataSRAM data_banks_2_0 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_2_0_clock),
    .io_wen(data_banks_2_0_io_wen),
    .io_waddr(data_banks_2_0_io_waddr),
    .io_wdata(data_banks_2_0_io_wdata),
    .io_ren(data_banks_2_0_io_ren),
    .io_raddr(data_banks_2_0_io_raddr),
    .io_rdata(data_banks_2_0_io_rdata)
  );
  DataSRAM data_banks_2_1 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_2_1_clock),
    .io_wen(data_banks_2_1_io_wen),
    .io_waddr(data_banks_2_1_io_waddr),
    .io_wdata(data_banks_2_1_io_wdata),
    .io_ren(data_banks_2_1_io_ren),
    .io_raddr(data_banks_2_1_io_raddr),
    .io_rdata(data_banks_2_1_io_rdata)
  );
  DataSRAM data_banks_2_2 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_2_2_clock),
    .io_wen(data_banks_2_2_io_wen),
    .io_waddr(data_banks_2_2_io_waddr),
    .io_wdata(data_banks_2_2_io_wdata),
    .io_ren(data_banks_2_2_io_ren),
    .io_raddr(data_banks_2_2_io_raddr),
    .io_rdata(data_banks_2_2_io_rdata)
  );
  DataSRAM data_banks_2_3 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_2_3_clock),
    .io_wen(data_banks_2_3_io_wen),
    .io_waddr(data_banks_2_3_io_waddr),
    .io_wdata(data_banks_2_3_io_wdata),
    .io_ren(data_banks_2_3_io_ren),
    .io_raddr(data_banks_2_3_io_raddr),
    .io_rdata(data_banks_2_3_io_rdata)
  );
  DataSRAM data_banks_2_4 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_2_4_clock),
    .io_wen(data_banks_2_4_io_wen),
    .io_waddr(data_banks_2_4_io_waddr),
    .io_wdata(data_banks_2_4_io_wdata),
    .io_ren(data_banks_2_4_io_ren),
    .io_raddr(data_banks_2_4_io_raddr),
    .io_rdata(data_banks_2_4_io_rdata)
  );
  DataSRAM data_banks_2_5 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_2_5_clock),
    .io_wen(data_banks_2_5_io_wen),
    .io_waddr(data_banks_2_5_io_waddr),
    .io_wdata(data_banks_2_5_io_wdata),
    .io_ren(data_banks_2_5_io_ren),
    .io_raddr(data_banks_2_5_io_raddr),
    .io_rdata(data_banks_2_5_io_rdata)
  );
  DataSRAM data_banks_2_6 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_2_6_clock),
    .io_wen(data_banks_2_6_io_wen),
    .io_waddr(data_banks_2_6_io_waddr),
    .io_wdata(data_banks_2_6_io_wdata),
    .io_ren(data_banks_2_6_io_ren),
    .io_raddr(data_banks_2_6_io_raddr),
    .io_rdata(data_banks_2_6_io_rdata)
  );
  DataSRAM data_banks_2_7 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_2_7_clock),
    .io_wen(data_banks_2_7_io_wen),
    .io_waddr(data_banks_2_7_io_waddr),
    .io_wdata(data_banks_2_7_io_wdata),
    .io_ren(data_banks_2_7_io_ren),
    .io_raddr(data_banks_2_7_io_raddr),
    .io_rdata(data_banks_2_7_io_rdata)
  );
  DataSRAM data_banks_3_0 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_3_0_clock),
    .io_wen(data_banks_3_0_io_wen),
    .io_waddr(data_banks_3_0_io_waddr),
    .io_wdata(data_banks_3_0_io_wdata),
    .io_ren(data_banks_3_0_io_ren),
    .io_raddr(data_banks_3_0_io_raddr),
    .io_rdata(data_banks_3_0_io_rdata)
  );
  DataSRAM data_banks_3_1 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_3_1_clock),
    .io_wen(data_banks_3_1_io_wen),
    .io_waddr(data_banks_3_1_io_waddr),
    .io_wdata(data_banks_3_1_io_wdata),
    .io_ren(data_banks_3_1_io_ren),
    .io_raddr(data_banks_3_1_io_raddr),
    .io_rdata(data_banks_3_1_io_rdata)
  );
  DataSRAM data_banks_3_2 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_3_2_clock),
    .io_wen(data_banks_3_2_io_wen),
    .io_waddr(data_banks_3_2_io_waddr),
    .io_wdata(data_banks_3_2_io_wdata),
    .io_ren(data_banks_3_2_io_ren),
    .io_raddr(data_banks_3_2_io_raddr),
    .io_rdata(data_banks_3_2_io_rdata)
  );
  DataSRAM data_banks_3_3 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_3_3_clock),
    .io_wen(data_banks_3_3_io_wen),
    .io_waddr(data_banks_3_3_io_waddr),
    .io_wdata(data_banks_3_3_io_wdata),
    .io_ren(data_banks_3_3_io_ren),
    .io_raddr(data_banks_3_3_io_raddr),
    .io_rdata(data_banks_3_3_io_rdata)
  );
  DataSRAM data_banks_3_4 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_3_4_clock),
    .io_wen(data_banks_3_4_io_wen),
    .io_waddr(data_banks_3_4_io_waddr),
    .io_wdata(data_banks_3_4_io_wdata),
    .io_ren(data_banks_3_4_io_ren),
    .io_raddr(data_banks_3_4_io_raddr),
    .io_rdata(data_banks_3_4_io_rdata)
  );
  DataSRAM data_banks_3_5 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_3_5_clock),
    .io_wen(data_banks_3_5_io_wen),
    .io_waddr(data_banks_3_5_io_waddr),
    .io_wdata(data_banks_3_5_io_wdata),
    .io_ren(data_banks_3_5_io_ren),
    .io_raddr(data_banks_3_5_io_raddr),
    .io_rdata(data_banks_3_5_io_rdata)
  );
  DataSRAM data_banks_3_6 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_3_6_clock),
    .io_wen(data_banks_3_6_io_wen),
    .io_waddr(data_banks_3_6_io_waddr),
    .io_wdata(data_banks_3_6_io_wdata),
    .io_ren(data_banks_3_6_io_ren),
    .io_raddr(data_banks_3_6_io_raddr),
    .io_rdata(data_banks_3_6_io_rdata)
  );
  DataSRAM data_banks_3_7 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_3_7_clock),
    .io_wen(data_banks_3_7_io_wen),
    .io_waddr(data_banks_3_7_io_waddr),
    .io_wdata(data_banks_3_7_io_wdata),
    .io_ren(data_banks_3_7_io_ren),
    .io_raddr(data_banks_3_7_io_raddr),
    .io_rdata(data_banks_3_7_io_rdata)
  );
  DataSRAM data_banks_4_0 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_4_0_clock),
    .io_wen(data_banks_4_0_io_wen),
    .io_waddr(data_banks_4_0_io_waddr),
    .io_wdata(data_banks_4_0_io_wdata),
    .io_ren(data_banks_4_0_io_ren),
    .io_raddr(data_banks_4_0_io_raddr),
    .io_rdata(data_banks_4_0_io_rdata)
  );
  DataSRAM data_banks_4_1 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_4_1_clock),
    .io_wen(data_banks_4_1_io_wen),
    .io_waddr(data_banks_4_1_io_waddr),
    .io_wdata(data_banks_4_1_io_wdata),
    .io_ren(data_banks_4_1_io_ren),
    .io_raddr(data_banks_4_1_io_raddr),
    .io_rdata(data_banks_4_1_io_rdata)
  );
  DataSRAM data_banks_4_2 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_4_2_clock),
    .io_wen(data_banks_4_2_io_wen),
    .io_waddr(data_banks_4_2_io_waddr),
    .io_wdata(data_banks_4_2_io_wdata),
    .io_ren(data_banks_4_2_io_ren),
    .io_raddr(data_banks_4_2_io_raddr),
    .io_rdata(data_banks_4_2_io_rdata)
  );
  DataSRAM data_banks_4_3 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_4_3_clock),
    .io_wen(data_banks_4_3_io_wen),
    .io_waddr(data_banks_4_3_io_waddr),
    .io_wdata(data_banks_4_3_io_wdata),
    .io_ren(data_banks_4_3_io_ren),
    .io_raddr(data_banks_4_3_io_raddr),
    .io_rdata(data_banks_4_3_io_rdata)
  );
  DataSRAM data_banks_4_4 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_4_4_clock),
    .io_wen(data_banks_4_4_io_wen),
    .io_waddr(data_banks_4_4_io_waddr),
    .io_wdata(data_banks_4_4_io_wdata),
    .io_ren(data_banks_4_4_io_ren),
    .io_raddr(data_banks_4_4_io_raddr),
    .io_rdata(data_banks_4_4_io_rdata)
  );
  DataSRAM data_banks_4_5 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_4_5_clock),
    .io_wen(data_banks_4_5_io_wen),
    .io_waddr(data_banks_4_5_io_waddr),
    .io_wdata(data_banks_4_5_io_wdata),
    .io_ren(data_banks_4_5_io_ren),
    .io_raddr(data_banks_4_5_io_raddr),
    .io_rdata(data_banks_4_5_io_rdata)
  );
  DataSRAM data_banks_4_6 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_4_6_clock),
    .io_wen(data_banks_4_6_io_wen),
    .io_waddr(data_banks_4_6_io_waddr),
    .io_wdata(data_banks_4_6_io_wdata),
    .io_ren(data_banks_4_6_io_ren),
    .io_raddr(data_banks_4_6_io_raddr),
    .io_rdata(data_banks_4_6_io_rdata)
  );
  DataSRAM data_banks_4_7 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_4_7_clock),
    .io_wen(data_banks_4_7_io_wen),
    .io_waddr(data_banks_4_7_io_waddr),
    .io_wdata(data_banks_4_7_io_wdata),
    .io_ren(data_banks_4_7_io_ren),
    .io_raddr(data_banks_4_7_io_raddr),
    .io_rdata(data_banks_4_7_io_rdata)
  );
  DataSRAM data_banks_5_0 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_5_0_clock),
    .io_wen(data_banks_5_0_io_wen),
    .io_waddr(data_banks_5_0_io_waddr),
    .io_wdata(data_banks_5_0_io_wdata),
    .io_ren(data_banks_5_0_io_ren),
    .io_raddr(data_banks_5_0_io_raddr),
    .io_rdata(data_banks_5_0_io_rdata)
  );
  DataSRAM data_banks_5_1 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_5_1_clock),
    .io_wen(data_banks_5_1_io_wen),
    .io_waddr(data_banks_5_1_io_waddr),
    .io_wdata(data_banks_5_1_io_wdata),
    .io_ren(data_banks_5_1_io_ren),
    .io_raddr(data_banks_5_1_io_raddr),
    .io_rdata(data_banks_5_1_io_rdata)
  );
  DataSRAM data_banks_5_2 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_5_2_clock),
    .io_wen(data_banks_5_2_io_wen),
    .io_waddr(data_banks_5_2_io_waddr),
    .io_wdata(data_banks_5_2_io_wdata),
    .io_ren(data_banks_5_2_io_ren),
    .io_raddr(data_banks_5_2_io_raddr),
    .io_rdata(data_banks_5_2_io_rdata)
  );
  DataSRAM data_banks_5_3 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_5_3_clock),
    .io_wen(data_banks_5_3_io_wen),
    .io_waddr(data_banks_5_3_io_waddr),
    .io_wdata(data_banks_5_3_io_wdata),
    .io_ren(data_banks_5_3_io_ren),
    .io_raddr(data_banks_5_3_io_raddr),
    .io_rdata(data_banks_5_3_io_rdata)
  );
  DataSRAM data_banks_5_4 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_5_4_clock),
    .io_wen(data_banks_5_4_io_wen),
    .io_waddr(data_banks_5_4_io_waddr),
    .io_wdata(data_banks_5_4_io_wdata),
    .io_ren(data_banks_5_4_io_ren),
    .io_raddr(data_banks_5_4_io_raddr),
    .io_rdata(data_banks_5_4_io_rdata)
  );
  DataSRAM data_banks_5_5 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_5_5_clock),
    .io_wen(data_banks_5_5_io_wen),
    .io_waddr(data_banks_5_5_io_waddr),
    .io_wdata(data_banks_5_5_io_wdata),
    .io_ren(data_banks_5_5_io_ren),
    .io_raddr(data_banks_5_5_io_raddr),
    .io_rdata(data_banks_5_5_io_rdata)
  );
  DataSRAM data_banks_5_6 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_5_6_clock),
    .io_wen(data_banks_5_6_io_wen),
    .io_waddr(data_banks_5_6_io_waddr),
    .io_wdata(data_banks_5_6_io_wdata),
    .io_ren(data_banks_5_6_io_ren),
    .io_raddr(data_banks_5_6_io_raddr),
    .io_rdata(data_banks_5_6_io_rdata)
  );
  DataSRAM data_banks_5_7 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_5_7_clock),
    .io_wen(data_banks_5_7_io_wen),
    .io_waddr(data_banks_5_7_io_waddr),
    .io_wdata(data_banks_5_7_io_wdata),
    .io_ren(data_banks_5_7_io_ren),
    .io_raddr(data_banks_5_7_io_raddr),
    .io_rdata(data_banks_5_7_io_rdata)
  );
  DataSRAM data_banks_6_0 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_6_0_clock),
    .io_wen(data_banks_6_0_io_wen),
    .io_waddr(data_banks_6_0_io_waddr),
    .io_wdata(data_banks_6_0_io_wdata),
    .io_ren(data_banks_6_0_io_ren),
    .io_raddr(data_banks_6_0_io_raddr),
    .io_rdata(data_banks_6_0_io_rdata)
  );
  DataSRAM data_banks_6_1 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_6_1_clock),
    .io_wen(data_banks_6_1_io_wen),
    .io_waddr(data_banks_6_1_io_waddr),
    .io_wdata(data_banks_6_1_io_wdata),
    .io_ren(data_banks_6_1_io_ren),
    .io_raddr(data_banks_6_1_io_raddr),
    .io_rdata(data_banks_6_1_io_rdata)
  );
  DataSRAM data_banks_6_2 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_6_2_clock),
    .io_wen(data_banks_6_2_io_wen),
    .io_waddr(data_banks_6_2_io_waddr),
    .io_wdata(data_banks_6_2_io_wdata),
    .io_ren(data_banks_6_2_io_ren),
    .io_raddr(data_banks_6_2_io_raddr),
    .io_rdata(data_banks_6_2_io_rdata)
  );
  DataSRAM data_banks_6_3 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_6_3_clock),
    .io_wen(data_banks_6_3_io_wen),
    .io_waddr(data_banks_6_3_io_waddr),
    .io_wdata(data_banks_6_3_io_wdata),
    .io_ren(data_banks_6_3_io_ren),
    .io_raddr(data_banks_6_3_io_raddr),
    .io_rdata(data_banks_6_3_io_rdata)
  );
  DataSRAM data_banks_6_4 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_6_4_clock),
    .io_wen(data_banks_6_4_io_wen),
    .io_waddr(data_banks_6_4_io_waddr),
    .io_wdata(data_banks_6_4_io_wdata),
    .io_ren(data_banks_6_4_io_ren),
    .io_raddr(data_banks_6_4_io_raddr),
    .io_rdata(data_banks_6_4_io_rdata)
  );
  DataSRAM data_banks_6_5 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_6_5_clock),
    .io_wen(data_banks_6_5_io_wen),
    .io_waddr(data_banks_6_5_io_waddr),
    .io_wdata(data_banks_6_5_io_wdata),
    .io_ren(data_banks_6_5_io_ren),
    .io_raddr(data_banks_6_5_io_raddr),
    .io_rdata(data_banks_6_5_io_rdata)
  );
  DataSRAM data_banks_6_6 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_6_6_clock),
    .io_wen(data_banks_6_6_io_wen),
    .io_waddr(data_banks_6_6_io_waddr),
    .io_wdata(data_banks_6_6_io_wdata),
    .io_ren(data_banks_6_6_io_ren),
    .io_raddr(data_banks_6_6_io_raddr),
    .io_rdata(data_banks_6_6_io_rdata)
  );
  DataSRAM data_banks_6_7 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_6_7_clock),
    .io_wen(data_banks_6_7_io_wen),
    .io_waddr(data_banks_6_7_io_waddr),
    .io_wdata(data_banks_6_7_io_wdata),
    .io_ren(data_banks_6_7_io_ren),
    .io_raddr(data_banks_6_7_io_raddr),
    .io_rdata(data_banks_6_7_io_rdata)
  );
  DataSRAM data_banks_7_0 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_7_0_clock),
    .io_wen(data_banks_7_0_io_wen),
    .io_waddr(data_banks_7_0_io_waddr),
    .io_wdata(data_banks_7_0_io_wdata),
    .io_ren(data_banks_7_0_io_ren),
    .io_raddr(data_banks_7_0_io_raddr),
    .io_rdata(data_banks_7_0_io_rdata)
  );
  DataSRAM data_banks_7_1 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_7_1_clock),
    .io_wen(data_banks_7_1_io_wen),
    .io_waddr(data_banks_7_1_io_waddr),
    .io_wdata(data_banks_7_1_io_wdata),
    .io_ren(data_banks_7_1_io_ren),
    .io_raddr(data_banks_7_1_io_raddr),
    .io_rdata(data_banks_7_1_io_rdata)
  );
  DataSRAM data_banks_7_2 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_7_2_clock),
    .io_wen(data_banks_7_2_io_wen),
    .io_waddr(data_banks_7_2_io_waddr),
    .io_wdata(data_banks_7_2_io_wdata),
    .io_ren(data_banks_7_2_io_ren),
    .io_raddr(data_banks_7_2_io_raddr),
    .io_rdata(data_banks_7_2_io_rdata)
  );
  DataSRAM data_banks_7_3 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_7_3_clock),
    .io_wen(data_banks_7_3_io_wen),
    .io_waddr(data_banks_7_3_io_waddr),
    .io_wdata(data_banks_7_3_io_wdata),
    .io_ren(data_banks_7_3_io_ren),
    .io_raddr(data_banks_7_3_io_raddr),
    .io_rdata(data_banks_7_3_io_rdata)
  );
  DataSRAM data_banks_7_4 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_7_4_clock),
    .io_wen(data_banks_7_4_io_wen),
    .io_waddr(data_banks_7_4_io_waddr),
    .io_wdata(data_banks_7_4_io_wdata),
    .io_ren(data_banks_7_4_io_ren),
    .io_raddr(data_banks_7_4_io_raddr),
    .io_rdata(data_banks_7_4_io_rdata)
  );
  DataSRAM data_banks_7_5 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_7_5_clock),
    .io_wen(data_banks_7_5_io_wen),
    .io_waddr(data_banks_7_5_io_waddr),
    .io_wdata(data_banks_7_5_io_wdata),
    .io_ren(data_banks_7_5_io_ren),
    .io_raddr(data_banks_7_5_io_raddr),
    .io_rdata(data_banks_7_5_io_rdata)
  );
  DataSRAM data_banks_7_6 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_7_6_clock),
    .io_wen(data_banks_7_6_io_wen),
    .io_waddr(data_banks_7_6_io_waddr),
    .io_wdata(data_banks_7_6_io_wdata),
    .io_ren(data_banks_7_6_io_ren),
    .io_raddr(data_banks_7_6_io_raddr),
    .io_rdata(data_banks_7_6_io_rdata)
  );
  DataSRAM data_banks_7_7 ( // @[BankedDataArray.scala 248:89]
    .clock(data_banks_7_7_clock),
    .io_wen(data_banks_7_7_io_wen),
    .io_waddr(data_banks_7_7_io_waddr),
    .io_wdata(data_banks_7_7_io_wdata),
    .io_ren(data_banks_7_7_io_ren),
    .io_raddr(data_banks_7_7_io_raddr),
    .io_rdata(data_banks_7_7_io_rdata)
  );
  SRAMTemplate_134 ecc_banks_0_0 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_0_0_clock),
    .io_rreq_valid(ecc_banks_0_0_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_0_0_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_0_0_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_0_0_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_0_0_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_0_0_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_0_1 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_0_1_clock),
    .io_rreq_valid(ecc_banks_0_1_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_0_1_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_0_1_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_0_1_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_0_1_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_0_1_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_0_2 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_0_2_clock),
    .io_rreq_valid(ecc_banks_0_2_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_0_2_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_0_2_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_0_2_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_0_2_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_0_2_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_0_3 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_0_3_clock),
    .io_rreq_valid(ecc_banks_0_3_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_0_3_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_0_3_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_0_3_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_0_3_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_0_3_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_0_4 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_0_4_clock),
    .io_rreq_valid(ecc_banks_0_4_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_0_4_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_0_4_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_0_4_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_0_4_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_0_4_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_0_5 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_0_5_clock),
    .io_rreq_valid(ecc_banks_0_5_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_0_5_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_0_5_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_0_5_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_0_5_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_0_5_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_0_6 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_0_6_clock),
    .io_rreq_valid(ecc_banks_0_6_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_0_6_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_0_6_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_0_6_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_0_6_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_0_6_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_0_7 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_0_7_clock),
    .io_rreq_valid(ecc_banks_0_7_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_0_7_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_0_7_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_0_7_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_0_7_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_0_7_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_1_0 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_1_0_clock),
    .io_rreq_valid(ecc_banks_1_0_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_1_0_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_1_0_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_1_0_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_1_0_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_1_0_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_1_1 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_1_1_clock),
    .io_rreq_valid(ecc_banks_1_1_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_1_1_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_1_1_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_1_1_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_1_1_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_1_1_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_1_2 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_1_2_clock),
    .io_rreq_valid(ecc_banks_1_2_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_1_2_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_1_2_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_1_2_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_1_2_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_1_2_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_1_3 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_1_3_clock),
    .io_rreq_valid(ecc_banks_1_3_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_1_3_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_1_3_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_1_3_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_1_3_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_1_3_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_1_4 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_1_4_clock),
    .io_rreq_valid(ecc_banks_1_4_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_1_4_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_1_4_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_1_4_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_1_4_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_1_4_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_1_5 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_1_5_clock),
    .io_rreq_valid(ecc_banks_1_5_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_1_5_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_1_5_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_1_5_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_1_5_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_1_5_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_1_6 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_1_6_clock),
    .io_rreq_valid(ecc_banks_1_6_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_1_6_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_1_6_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_1_6_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_1_6_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_1_6_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_1_7 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_1_7_clock),
    .io_rreq_valid(ecc_banks_1_7_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_1_7_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_1_7_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_1_7_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_1_7_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_1_7_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_2_0 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_2_0_clock),
    .io_rreq_valid(ecc_banks_2_0_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_2_0_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_2_0_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_2_0_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_2_0_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_2_0_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_2_1 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_2_1_clock),
    .io_rreq_valid(ecc_banks_2_1_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_2_1_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_2_1_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_2_1_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_2_1_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_2_1_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_2_2 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_2_2_clock),
    .io_rreq_valid(ecc_banks_2_2_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_2_2_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_2_2_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_2_2_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_2_2_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_2_2_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_2_3 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_2_3_clock),
    .io_rreq_valid(ecc_banks_2_3_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_2_3_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_2_3_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_2_3_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_2_3_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_2_3_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_2_4 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_2_4_clock),
    .io_rreq_valid(ecc_banks_2_4_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_2_4_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_2_4_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_2_4_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_2_4_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_2_4_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_2_5 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_2_5_clock),
    .io_rreq_valid(ecc_banks_2_5_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_2_5_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_2_5_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_2_5_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_2_5_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_2_5_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_2_6 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_2_6_clock),
    .io_rreq_valid(ecc_banks_2_6_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_2_6_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_2_6_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_2_6_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_2_6_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_2_6_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_2_7 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_2_7_clock),
    .io_rreq_valid(ecc_banks_2_7_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_2_7_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_2_7_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_2_7_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_2_7_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_2_7_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_3_0 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_3_0_clock),
    .io_rreq_valid(ecc_banks_3_0_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_3_0_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_3_0_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_3_0_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_3_0_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_3_0_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_3_1 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_3_1_clock),
    .io_rreq_valid(ecc_banks_3_1_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_3_1_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_3_1_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_3_1_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_3_1_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_3_1_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_3_2 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_3_2_clock),
    .io_rreq_valid(ecc_banks_3_2_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_3_2_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_3_2_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_3_2_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_3_2_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_3_2_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_3_3 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_3_3_clock),
    .io_rreq_valid(ecc_banks_3_3_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_3_3_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_3_3_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_3_3_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_3_3_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_3_3_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_3_4 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_3_4_clock),
    .io_rreq_valid(ecc_banks_3_4_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_3_4_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_3_4_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_3_4_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_3_4_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_3_4_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_3_5 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_3_5_clock),
    .io_rreq_valid(ecc_banks_3_5_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_3_5_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_3_5_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_3_5_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_3_5_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_3_5_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_3_6 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_3_6_clock),
    .io_rreq_valid(ecc_banks_3_6_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_3_6_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_3_6_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_3_6_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_3_6_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_3_6_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_3_7 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_3_7_clock),
    .io_rreq_valid(ecc_banks_3_7_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_3_7_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_3_7_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_3_7_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_3_7_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_3_7_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_4_0 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_4_0_clock),
    .io_rreq_valid(ecc_banks_4_0_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_4_0_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_4_0_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_4_0_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_4_0_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_4_0_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_4_1 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_4_1_clock),
    .io_rreq_valid(ecc_banks_4_1_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_4_1_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_4_1_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_4_1_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_4_1_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_4_1_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_4_2 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_4_2_clock),
    .io_rreq_valid(ecc_banks_4_2_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_4_2_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_4_2_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_4_2_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_4_2_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_4_2_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_4_3 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_4_3_clock),
    .io_rreq_valid(ecc_banks_4_3_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_4_3_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_4_3_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_4_3_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_4_3_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_4_3_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_4_4 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_4_4_clock),
    .io_rreq_valid(ecc_banks_4_4_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_4_4_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_4_4_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_4_4_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_4_4_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_4_4_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_4_5 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_4_5_clock),
    .io_rreq_valid(ecc_banks_4_5_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_4_5_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_4_5_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_4_5_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_4_5_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_4_5_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_4_6 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_4_6_clock),
    .io_rreq_valid(ecc_banks_4_6_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_4_6_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_4_6_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_4_6_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_4_6_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_4_6_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_4_7 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_4_7_clock),
    .io_rreq_valid(ecc_banks_4_7_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_4_7_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_4_7_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_4_7_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_4_7_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_4_7_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_5_0 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_5_0_clock),
    .io_rreq_valid(ecc_banks_5_0_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_5_0_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_5_0_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_5_0_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_5_0_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_5_0_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_5_1 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_5_1_clock),
    .io_rreq_valid(ecc_banks_5_1_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_5_1_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_5_1_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_5_1_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_5_1_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_5_1_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_5_2 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_5_2_clock),
    .io_rreq_valid(ecc_banks_5_2_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_5_2_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_5_2_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_5_2_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_5_2_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_5_2_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_5_3 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_5_3_clock),
    .io_rreq_valid(ecc_banks_5_3_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_5_3_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_5_3_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_5_3_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_5_3_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_5_3_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_5_4 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_5_4_clock),
    .io_rreq_valid(ecc_banks_5_4_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_5_4_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_5_4_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_5_4_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_5_4_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_5_4_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_5_5 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_5_5_clock),
    .io_rreq_valid(ecc_banks_5_5_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_5_5_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_5_5_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_5_5_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_5_5_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_5_5_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_5_6 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_5_6_clock),
    .io_rreq_valid(ecc_banks_5_6_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_5_6_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_5_6_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_5_6_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_5_6_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_5_6_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_5_7 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_5_7_clock),
    .io_rreq_valid(ecc_banks_5_7_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_5_7_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_5_7_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_5_7_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_5_7_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_5_7_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_6_0 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_6_0_clock),
    .io_rreq_valid(ecc_banks_6_0_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_6_0_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_6_0_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_6_0_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_6_0_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_6_0_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_6_1 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_6_1_clock),
    .io_rreq_valid(ecc_banks_6_1_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_6_1_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_6_1_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_6_1_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_6_1_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_6_1_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_6_2 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_6_2_clock),
    .io_rreq_valid(ecc_banks_6_2_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_6_2_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_6_2_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_6_2_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_6_2_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_6_2_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_6_3 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_6_3_clock),
    .io_rreq_valid(ecc_banks_6_3_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_6_3_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_6_3_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_6_3_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_6_3_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_6_3_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_6_4 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_6_4_clock),
    .io_rreq_valid(ecc_banks_6_4_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_6_4_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_6_4_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_6_4_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_6_4_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_6_4_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_6_5 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_6_5_clock),
    .io_rreq_valid(ecc_banks_6_5_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_6_5_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_6_5_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_6_5_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_6_5_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_6_5_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_6_6 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_6_6_clock),
    .io_rreq_valid(ecc_banks_6_6_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_6_6_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_6_6_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_6_6_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_6_6_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_6_6_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_6_7 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_6_7_clock),
    .io_rreq_valid(ecc_banks_6_7_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_6_7_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_6_7_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_6_7_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_6_7_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_6_7_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_7_0 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_7_0_clock),
    .io_rreq_valid(ecc_banks_7_0_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_7_0_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_7_0_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_7_0_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_7_0_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_7_0_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_7_1 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_7_1_clock),
    .io_rreq_valid(ecc_banks_7_1_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_7_1_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_7_1_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_7_1_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_7_1_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_7_1_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_7_2 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_7_2_clock),
    .io_rreq_valid(ecc_banks_7_2_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_7_2_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_7_2_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_7_2_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_7_2_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_7_2_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_7_3 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_7_3_clock),
    .io_rreq_valid(ecc_banks_7_3_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_7_3_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_7_3_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_7_3_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_7_3_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_7_3_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_7_4 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_7_4_clock),
    .io_rreq_valid(ecc_banks_7_4_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_7_4_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_7_4_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_7_4_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_7_4_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_7_4_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_7_5 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_7_5_clock),
    .io_rreq_valid(ecc_banks_7_5_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_7_5_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_7_5_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_7_5_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_7_5_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_7_5_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_7_6 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_7_6_clock),
    .io_rreq_valid(ecc_banks_7_6_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_7_6_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_7_6_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_7_6_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_7_6_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_7_6_io_wreq_bits_data_0)
  );
  SRAMTemplate_134 ecc_banks_7_7 ( // @[BankedDataArray.scala 250:88]
    .clock(ecc_banks_7_7_clock),
    .io_rreq_valid(ecc_banks_7_7_io_rreq_valid),
    .io_rreq_bits_setIdx(ecc_banks_7_7_io_rreq_bits_setIdx),
    .io_rresp_data_0(ecc_banks_7_7_io_rresp_data_0),
    .io_wreq_valid(ecc_banks_7_7_io_wreq_valid),
    .io_wreq_bits_setIdx(ecc_banks_7_7_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(ecc_banks_7_7_io_wreq_bits_data_0)
  );
  BankConflict0Writer #(.site("BankedDataArray0")) writer ( // @[ChiselDB.scala 132:24]
    .clock(writer_clock),
    .reset(writer_reset),
    .en(writer_en),
    .stamp(writer_stamp),
    .data_addr_0(writer_data_addr_0),
    .data_addr_1(writer_data_addr_1),
    .data_set_index_0(writer_data_set_index_0),
    .data_set_index_1(writer_data_set_index_1),
    .data_bank_index_0(writer_data_bank_index_0),
    .data_bank_index_1(writer_data_bank_index_1),
    .data_way_index(writer_data_way_index),
    .data_fake_rr_bank_conflict(writer_data_fake_rr_bank_conflict)
  );
  assign io_read_0_ready = ~rwhazard; // @[BankedDataArray.scala 281:35]
  assign io_read_1_ready = ~rwhazard; // @[BankedDataArray.scala 281:35]
  assign io_readline_ready = ~rwhazard; // @[BankedDataArray.scala 286:24]
  assign io_readline_resp_0_raw_data = 3'h7 == io_readline_resp_0_REG ? read_result_0_7_raw_data : _GEN_1244; // @[BankedDataArray.scala 407:{25,25}]
  assign io_readline_resp_0_error_delayed = 3'h7 == io_readline_resp_0_REG ? read_result_0_7_error_delayed : _GEN_1252; // @[BankedDataArray.scala 407:{25,25}]
  assign io_readline_resp_1_raw_data = 3'h7 == io_readline_resp_1_REG ? read_result_1_7_raw_data : _GEN_1268; // @[BankedDataArray.scala 407:{25,25}]
  assign io_readline_resp_1_error_delayed = 3'h7 == io_readline_resp_1_REG ? read_result_1_7_error_delayed : _GEN_1276; // @[BankedDataArray.scala 407:{25,25}]
  assign io_readline_resp_2_raw_data = 3'h7 == io_readline_resp_2_REG ? read_result_2_7_raw_data : _GEN_1292; // @[BankedDataArray.scala 407:{25,25}]
  assign io_readline_resp_2_error_delayed = 3'h7 == io_readline_resp_2_REG ? read_result_2_7_error_delayed : _GEN_1300; // @[BankedDataArray.scala 407:{25,25}]
  assign io_readline_resp_3_raw_data = 3'h7 == io_readline_resp_3_REG ? read_result_3_7_raw_data : _GEN_1316; // @[BankedDataArray.scala 407:{25,25}]
  assign io_readline_resp_3_error_delayed = 3'h7 == io_readline_resp_3_REG ? read_result_3_7_error_delayed : _GEN_1324; // @[BankedDataArray.scala 407:{25,25}]
  assign io_readline_resp_4_raw_data = 3'h7 == io_readline_resp_4_REG ? read_result_4_7_raw_data : _GEN_1340; // @[BankedDataArray.scala 407:{25,25}]
  assign io_readline_resp_4_error_delayed = 3'h7 == io_readline_resp_4_REG ? read_result_4_7_error_delayed : _GEN_1348; // @[BankedDataArray.scala 407:{25,25}]
  assign io_readline_resp_5_raw_data = 3'h7 == io_readline_resp_5_REG ? read_result_5_7_raw_data : _GEN_1364; // @[BankedDataArray.scala 407:{25,25}]
  assign io_readline_resp_5_error_delayed = 3'h7 == io_readline_resp_5_REG ? read_result_5_7_error_delayed : _GEN_1372; // @[BankedDataArray.scala 407:{25,25}]
  assign io_readline_resp_6_raw_data = 3'h7 == io_readline_resp_6_REG ? read_result_6_7_raw_data : _GEN_1388; // @[BankedDataArray.scala 407:{25,25}]
  assign io_readline_resp_6_error_delayed = 3'h7 == io_readline_resp_6_REG ? read_result_6_7_error_delayed : _GEN_1396; // @[BankedDataArray.scala 407:{25,25}]
  assign io_readline_resp_7_raw_data = 3'h7 == io_readline_resp_7_REG ? read_result_7_7_raw_data : _GEN_1412; // @[BankedDataArray.scala 407:{25,25}]
  assign io_readline_resp_7_error_delayed = 3'h7 == io_readline_resp_7_REG ? read_result_7_7_error_delayed : _GEN_1420; // @[BankedDataArray.scala 407:{25,25}]
  assign io_readline_error_delayed = io_readline_error_delayed_REG_1 & _io_readline_error_delayed_T_2; // @[BankedDataArray.scala 430:69]
  assign io_read_resp_delayed_0_0_raw_data = 3'h7 == io_read_resp_delayed_0_0_REG_5[2:0] & 3'h7 ==
    io_read_resp_delayed_0_0_REG_7 ? read_result_delayed_7_7_raw_data : _GEN_576; // @[BankedDataArray.scala 401:{34,34}]
  assign io_read_resp_delayed_1_0_raw_data = 3'h7 == io_read_resp_delayed_1_0_REG_5[2:0] & 3'h7 ==
    io_read_resp_delayed_1_0_REG_7 ? read_result_delayed_7_7_raw_data : _GEN_1158; // @[BankedDataArray.scala 401:{34,34}]
  assign io_read_error_delayed_0_0 = _io_read_error_delayed_0_0_T_27 & _io_read_error_delayed_0_0_T_28; // @[BankedDataArray.scala 421:130]
  assign io_read_error_delayed_1_0 = _io_read_error_delayed_1_0_T_27 & _io_read_error_delayed_1_0_T_28; // @[BankedDataArray.scala 421:130]
  assign io_bank_conflict_slow_0 = io_bank_conflict_slow_0_REG; // @[BankedDataArray.scala 314:30]
  assign io_bank_conflict_slow_1 = io_bank_conflict_slow_1_REG; // @[BankedDataArray.scala 314:30]
  assign io_bank_conflict_fast_0 = rw_bank_conflict_0 | rrl_bank_conflict_0; // @[BankedDataArray.scala 312:53]
  assign io_bank_conflict_fast_1 = rw_bank_conflict_1 | rrl_bank_conflict_1 | rr_bank_conflict_0_1; // @[BankedDataArray.scala 312:77]
  assign io_cacheOp_resp_valid = io_cacheOp_resp_valid_REG; // @[BankedDataArray.scala 607:25]
  assign io_cacheOp_resp_bits_read_data_vec_0 = 3'h7 == io_cacheOp_resp_bits_read_data_vec_0_REG[2:0] ?
    read_result_0_7_raw_data : _GEN_2356; // @[BankedDataArray.scala 609:{52,52}]
  assign io_cacheOp_resp_bits_read_data_vec_1 = 3'h7 == io_cacheOp_resp_bits_read_data_vec_1_REG[2:0] ?
    read_result_1_7_raw_data : _GEN_2372; // @[BankedDataArray.scala 609:{52,52}]
  assign io_cacheOp_resp_bits_read_data_vec_2 = 3'h7 == io_cacheOp_resp_bits_read_data_vec_2_REG[2:0] ?
    read_result_2_7_raw_data : _GEN_2388; // @[BankedDataArray.scala 609:{52,52}]
  assign io_cacheOp_resp_bits_read_data_vec_3 = 3'h7 == io_cacheOp_resp_bits_read_data_vec_3_REG[2:0] ?
    read_result_3_7_raw_data : _GEN_2404; // @[BankedDataArray.scala 609:{52,52}]
  assign io_cacheOp_resp_bits_read_data_vec_4 = 3'h7 == io_cacheOp_resp_bits_read_data_vec_4_REG[2:0] ?
    read_result_4_7_raw_data : _GEN_2420; // @[BankedDataArray.scala 609:{52,52}]
  assign io_cacheOp_resp_bits_read_data_vec_5 = 3'h7 == io_cacheOp_resp_bits_read_data_vec_5_REG[2:0] ?
    read_result_5_7_raw_data : _GEN_2436; // @[BankedDataArray.scala 609:{52,52}]
  assign io_cacheOp_resp_bits_read_data_vec_6 = 3'h7 == io_cacheOp_resp_bits_read_data_vec_6_REG[2:0] ?
    read_result_6_7_raw_data : _GEN_2452; // @[BankedDataArray.scala 609:{52,52}]
  assign io_cacheOp_resp_bits_read_data_vec_7 = 3'h7 == io_cacheOp_resp_bits_read_data_vec_7_REG[2:0] ?
    read_result_7_7_raw_data : _GEN_2468; // @[BankedDataArray.scala 609:{52,52}]
  assign io_cacheOp_resp_bits_read_data_ecc = {{56'd0}, _io_cacheOp_resp_bits_read_data_ecc_T_2}; // @[BankedDataArray.scala 612:38]
  assign data_banks_0_0_clock = clock;
  assign data_banks_0_0_io_wen = io_cacheOp_req_dup_1_valid & _T_448 ? _data_banks_0_0_io_ren_T_1[0] :
    io_write_dup_0_valid & io_write_bits_wmask[0] & io_write_dup_0_bits_way_en[0]; // @[BankedDataArray.scala 488:102 440:25 492:27]
  assign data_banks_0_0_io_waddr = io_cacheOp_req_dup_1_valid & _T_448 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_0}; // @[BankedDataArray.scala 488:102 441:27 493:29]
  assign data_banks_0_0_io_wdata = io_cacheOp_req_dup_1_valid & _T_448 ? io_cacheOp_req_bits_write_data_vec_0 :
    io_write_bits_data_0; // @[BankedDataArray.scala 488:102 442:27 494:29]
  assign data_banks_0_0_io_ren = io_cacheOp_req_valid & _T_444 ? _data_banks_0_0_io_ren_T_1[0] : read_en; // @[BankedDataArray.scala 369:25 468:89 472:27]
  assign data_banks_0_0_io_raddr = io_cacheOp_req_valid & _T_444 ? io_cacheOp_req_bits_index : {{58'd0}, sram_set_addr}
    ; // @[BankedDataArray.scala 370:27 468:89 473:29]
  assign data_banks_0_1_clock = clock;
  assign data_banks_0_1_io_wen = io_cacheOp_req_dup_1_valid & _T_448 ? _data_banks_0_0_io_ren_T_1[1] :
    io_write_dup_0_valid & io_write_bits_wmask[0] & io_write_dup_0_bits_way_en[1]; // @[BankedDataArray.scala 488:102 440:25 492:27]
  assign data_banks_0_1_io_waddr = io_cacheOp_req_dup_1_valid & _T_448 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_0}; // @[BankedDataArray.scala 488:102 441:27 493:29]
  assign data_banks_0_1_io_wdata = io_cacheOp_req_dup_1_valid & _T_448 ? io_cacheOp_req_bits_write_data_vec_0 :
    io_write_bits_data_0; // @[BankedDataArray.scala 488:102 442:27 494:29]
  assign data_banks_0_1_io_ren = io_cacheOp_req_valid & _T_444 ? _data_banks_0_0_io_ren_T_1[1] : read_en_1; // @[BankedDataArray.scala 369:25 468:89 472:27]
  assign data_banks_0_1_io_raddr = io_cacheOp_req_valid & _T_444 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_1}; // @[BankedDataArray.scala 370:27 468:89 473:29]
  assign data_banks_0_2_clock = clock;
  assign data_banks_0_2_io_wen = io_cacheOp_req_dup_1_valid & _T_448 ? _data_banks_0_0_io_ren_T_1[2] :
    io_write_dup_0_valid & io_write_bits_wmask[0] & io_write_dup_0_bits_way_en[2]; // @[BankedDataArray.scala 488:102 440:25 492:27]
  assign data_banks_0_2_io_waddr = io_cacheOp_req_dup_1_valid & _T_448 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_0}; // @[BankedDataArray.scala 488:102 441:27 493:29]
  assign data_banks_0_2_io_wdata = io_cacheOp_req_dup_1_valid & _T_448 ? io_cacheOp_req_bits_write_data_vec_0 :
    io_write_bits_data_0; // @[BankedDataArray.scala 488:102 442:27 494:29]
  assign data_banks_0_2_io_ren = io_cacheOp_req_valid & _T_444 ? _data_banks_0_0_io_ren_T_1[2] : read_en_2; // @[BankedDataArray.scala 369:25 468:89 472:27]
  assign data_banks_0_2_io_raddr = io_cacheOp_req_valid & _T_444 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_2}; // @[BankedDataArray.scala 370:27 468:89 473:29]
  assign data_banks_0_3_clock = clock;
  assign data_banks_0_3_io_wen = io_cacheOp_req_dup_1_valid & _T_448 ? _data_banks_0_0_io_ren_T_1[3] :
    io_write_dup_0_valid & io_write_bits_wmask[0] & io_write_dup_0_bits_way_en[3]; // @[BankedDataArray.scala 488:102 440:25 492:27]
  assign data_banks_0_3_io_waddr = io_cacheOp_req_dup_1_valid & _T_448 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_0}; // @[BankedDataArray.scala 488:102 441:27 493:29]
  assign data_banks_0_3_io_wdata = io_cacheOp_req_dup_1_valid & _T_448 ? io_cacheOp_req_bits_write_data_vec_0 :
    io_write_bits_data_0; // @[BankedDataArray.scala 488:102 442:27 494:29]
  assign data_banks_0_3_io_ren = io_cacheOp_req_valid & _T_444 ? _data_banks_0_0_io_ren_T_1[3] : read_en_3; // @[BankedDataArray.scala 369:25 468:89 472:27]
  assign data_banks_0_3_io_raddr = io_cacheOp_req_valid & _T_444 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_3}; // @[BankedDataArray.scala 370:27 468:89 473:29]
  assign data_banks_0_4_clock = clock;
  assign data_banks_0_4_io_wen = io_cacheOp_req_dup_1_valid & _T_448 ? _data_banks_0_0_io_ren_T_1[4] :
    io_write_dup_0_valid & io_write_bits_wmask[0] & io_write_dup_0_bits_way_en[4]; // @[BankedDataArray.scala 488:102 440:25 492:27]
  assign data_banks_0_4_io_waddr = io_cacheOp_req_dup_1_valid & _T_448 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_0}; // @[BankedDataArray.scala 488:102 441:27 493:29]
  assign data_banks_0_4_io_wdata = io_cacheOp_req_dup_1_valid & _T_448 ? io_cacheOp_req_bits_write_data_vec_0 :
    io_write_bits_data_0; // @[BankedDataArray.scala 488:102 442:27 494:29]
  assign data_banks_0_4_io_ren = io_cacheOp_req_valid & _T_444 ? _data_banks_0_0_io_ren_T_1[4] : read_en_4; // @[BankedDataArray.scala 369:25 468:89 472:27]
  assign data_banks_0_4_io_raddr = io_cacheOp_req_valid & _T_444 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_4}; // @[BankedDataArray.scala 370:27 468:89 473:29]
  assign data_banks_0_5_clock = clock;
  assign data_banks_0_5_io_wen = io_cacheOp_req_dup_1_valid & _T_448 ? _data_banks_0_0_io_ren_T_1[5] :
    io_write_dup_0_valid & io_write_bits_wmask[0] & io_write_dup_0_bits_way_en[5]; // @[BankedDataArray.scala 488:102 440:25 492:27]
  assign data_banks_0_5_io_waddr = io_cacheOp_req_dup_1_valid & _T_448 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_0}; // @[BankedDataArray.scala 488:102 441:27 493:29]
  assign data_banks_0_5_io_wdata = io_cacheOp_req_dup_1_valid & _T_448 ? io_cacheOp_req_bits_write_data_vec_0 :
    io_write_bits_data_0; // @[BankedDataArray.scala 488:102 442:27 494:29]
  assign data_banks_0_5_io_ren = io_cacheOp_req_valid & _T_444 ? _data_banks_0_0_io_ren_T_1[5] : read_en_5; // @[BankedDataArray.scala 369:25 468:89 472:27]
  assign data_banks_0_5_io_raddr = io_cacheOp_req_valid & _T_444 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_5}; // @[BankedDataArray.scala 370:27 468:89 473:29]
  assign data_banks_0_6_clock = clock;
  assign data_banks_0_6_io_wen = io_cacheOp_req_dup_1_valid & _T_448 ? _data_banks_0_0_io_ren_T_1[6] :
    io_write_dup_0_valid & io_write_bits_wmask[0] & io_write_dup_0_bits_way_en[6]; // @[BankedDataArray.scala 488:102 440:25 492:27]
  assign data_banks_0_6_io_waddr = io_cacheOp_req_dup_1_valid & _T_448 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_0}; // @[BankedDataArray.scala 488:102 441:27 493:29]
  assign data_banks_0_6_io_wdata = io_cacheOp_req_dup_1_valid & _T_448 ? io_cacheOp_req_bits_write_data_vec_0 :
    io_write_bits_data_0; // @[BankedDataArray.scala 488:102 442:27 494:29]
  assign data_banks_0_6_io_ren = io_cacheOp_req_valid & _T_444 ? _data_banks_0_0_io_ren_T_1[6] : read_en_6; // @[BankedDataArray.scala 369:25 468:89 472:27]
  assign data_banks_0_6_io_raddr = io_cacheOp_req_valid & _T_444 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_6}; // @[BankedDataArray.scala 370:27 468:89 473:29]
  assign data_banks_0_7_clock = clock;
  assign data_banks_0_7_io_wen = io_cacheOp_req_dup_1_valid & _T_448 ? _data_banks_0_0_io_ren_T_1[7] :
    io_write_dup_0_valid & io_write_bits_wmask[0] & io_write_dup_0_bits_way_en[7]; // @[BankedDataArray.scala 488:102 440:25 492:27]
  assign data_banks_0_7_io_waddr = io_cacheOp_req_dup_1_valid & _T_448 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_0}; // @[BankedDataArray.scala 488:102 441:27 493:29]
  assign data_banks_0_7_io_wdata = io_cacheOp_req_dup_1_valid & _T_448 ? io_cacheOp_req_bits_write_data_vec_0 :
    io_write_bits_data_0; // @[BankedDataArray.scala 488:102 442:27 494:29]
  assign data_banks_0_7_io_ren = io_cacheOp_req_valid & _T_444 ? _data_banks_0_0_io_ren_T_1[7] : read_en_7; // @[BankedDataArray.scala 369:25 468:89 472:27]
  assign data_banks_0_7_io_raddr = io_cacheOp_req_valid & _T_444 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_7}; // @[BankedDataArray.scala 370:27 468:89 473:29]
  assign data_banks_1_0_clock = clock;
  assign data_banks_1_0_io_wen = io_cacheOp_req_dup_1_valid & _T_448 ? _data_banks_0_0_io_ren_T_1[0] :
    io_write_dup_1_valid & io_write_bits_wmask[1] & io_write_dup_1_bits_way_en[0]; // @[BankedDataArray.scala 488:102 440:25 492:27]
  assign data_banks_1_0_io_waddr = io_cacheOp_req_dup_1_valid & _T_448 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_1}; // @[BankedDataArray.scala 488:102 441:27 493:29]
  assign data_banks_1_0_io_wdata = io_cacheOp_req_dup_1_valid & _T_448 ? io_cacheOp_req_bits_write_data_vec_1 :
    io_write_bits_data_1; // @[BankedDataArray.scala 488:102 442:27 494:29]
  assign data_banks_1_0_io_ren = io_cacheOp_req_valid & _T_444 ? _data_banks_0_0_io_ren_T_1[0] : read_en_8; // @[BankedDataArray.scala 369:25 468:89 472:27]
  assign data_banks_1_0_io_raddr = io_cacheOp_req_valid & _T_444 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_8}; // @[BankedDataArray.scala 370:27 468:89 473:29]
  assign data_banks_1_1_clock = clock;
  assign data_banks_1_1_io_wen = io_cacheOp_req_dup_1_valid & _T_448 ? _data_banks_0_0_io_ren_T_1[1] :
    io_write_dup_1_valid & io_write_bits_wmask[1] & io_write_dup_1_bits_way_en[1]; // @[BankedDataArray.scala 488:102 440:25 492:27]
  assign data_banks_1_1_io_waddr = io_cacheOp_req_dup_1_valid & _T_448 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_1}; // @[BankedDataArray.scala 488:102 441:27 493:29]
  assign data_banks_1_1_io_wdata = io_cacheOp_req_dup_1_valid & _T_448 ? io_cacheOp_req_bits_write_data_vec_1 :
    io_write_bits_data_1; // @[BankedDataArray.scala 488:102 442:27 494:29]
  assign data_banks_1_1_io_ren = io_cacheOp_req_valid & _T_444 ? _data_banks_0_0_io_ren_T_1[1] : read_en_9; // @[BankedDataArray.scala 369:25 468:89 472:27]
  assign data_banks_1_1_io_raddr = io_cacheOp_req_valid & _T_444 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_9}; // @[BankedDataArray.scala 370:27 468:89 473:29]
  assign data_banks_1_2_clock = clock;
  assign data_banks_1_2_io_wen = io_cacheOp_req_dup_1_valid & _T_448 ? _data_banks_0_0_io_ren_T_1[2] :
    io_write_dup_1_valid & io_write_bits_wmask[1] & io_write_dup_1_bits_way_en[2]; // @[BankedDataArray.scala 488:102 440:25 492:27]
  assign data_banks_1_2_io_waddr = io_cacheOp_req_dup_1_valid & _T_448 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_1}; // @[BankedDataArray.scala 488:102 441:27 493:29]
  assign data_banks_1_2_io_wdata = io_cacheOp_req_dup_1_valid & _T_448 ? io_cacheOp_req_bits_write_data_vec_1 :
    io_write_bits_data_1; // @[BankedDataArray.scala 488:102 442:27 494:29]
  assign data_banks_1_2_io_ren = io_cacheOp_req_valid & _T_444 ? _data_banks_0_0_io_ren_T_1[2] : read_en_10; // @[BankedDataArray.scala 369:25 468:89 472:27]
  assign data_banks_1_2_io_raddr = io_cacheOp_req_valid & _T_444 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_10}; // @[BankedDataArray.scala 370:27 468:89 473:29]
  assign data_banks_1_3_clock = clock;
  assign data_banks_1_3_io_wen = io_cacheOp_req_dup_1_valid & _T_448 ? _data_banks_0_0_io_ren_T_1[3] :
    io_write_dup_1_valid & io_write_bits_wmask[1] & io_write_dup_1_bits_way_en[3]; // @[BankedDataArray.scala 488:102 440:25 492:27]
  assign data_banks_1_3_io_waddr = io_cacheOp_req_dup_1_valid & _T_448 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_1}; // @[BankedDataArray.scala 488:102 441:27 493:29]
  assign data_banks_1_3_io_wdata = io_cacheOp_req_dup_1_valid & _T_448 ? io_cacheOp_req_bits_write_data_vec_1 :
    io_write_bits_data_1; // @[BankedDataArray.scala 488:102 442:27 494:29]
  assign data_banks_1_3_io_ren = io_cacheOp_req_valid & _T_444 ? _data_banks_0_0_io_ren_T_1[3] : read_en_11; // @[BankedDataArray.scala 369:25 468:89 472:27]
  assign data_banks_1_3_io_raddr = io_cacheOp_req_valid & _T_444 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_11}; // @[BankedDataArray.scala 370:27 468:89 473:29]
  assign data_banks_1_4_clock = clock;
  assign data_banks_1_4_io_wen = io_cacheOp_req_dup_1_valid & _T_448 ? _data_banks_0_0_io_ren_T_1[4] :
    io_write_dup_1_valid & io_write_bits_wmask[1] & io_write_dup_1_bits_way_en[4]; // @[BankedDataArray.scala 488:102 440:25 492:27]
  assign data_banks_1_4_io_waddr = io_cacheOp_req_dup_1_valid & _T_448 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_1}; // @[BankedDataArray.scala 488:102 441:27 493:29]
  assign data_banks_1_4_io_wdata = io_cacheOp_req_dup_1_valid & _T_448 ? io_cacheOp_req_bits_write_data_vec_1 :
    io_write_bits_data_1; // @[BankedDataArray.scala 488:102 442:27 494:29]
  assign data_banks_1_4_io_ren = io_cacheOp_req_valid & _T_444 ? _data_banks_0_0_io_ren_T_1[4] : read_en_12; // @[BankedDataArray.scala 369:25 468:89 472:27]
  assign data_banks_1_4_io_raddr = io_cacheOp_req_valid & _T_444 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_12}; // @[BankedDataArray.scala 370:27 468:89 473:29]
  assign data_banks_1_5_clock = clock;
  assign data_banks_1_5_io_wen = io_cacheOp_req_dup_1_valid & _T_448 ? _data_banks_0_0_io_ren_T_1[5] :
    io_write_dup_1_valid & io_write_bits_wmask[1] & io_write_dup_1_bits_way_en[5]; // @[BankedDataArray.scala 488:102 440:25 492:27]
  assign data_banks_1_5_io_waddr = io_cacheOp_req_dup_1_valid & _T_448 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_1}; // @[BankedDataArray.scala 488:102 441:27 493:29]
  assign data_banks_1_5_io_wdata = io_cacheOp_req_dup_1_valid & _T_448 ? io_cacheOp_req_bits_write_data_vec_1 :
    io_write_bits_data_1; // @[BankedDataArray.scala 488:102 442:27 494:29]
  assign data_banks_1_5_io_ren = io_cacheOp_req_valid & _T_444 ? _data_banks_0_0_io_ren_T_1[5] : read_en_13; // @[BankedDataArray.scala 369:25 468:89 472:27]
  assign data_banks_1_5_io_raddr = io_cacheOp_req_valid & _T_444 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_13}; // @[BankedDataArray.scala 370:27 468:89 473:29]
  assign data_banks_1_6_clock = clock;
  assign data_banks_1_6_io_wen = io_cacheOp_req_dup_1_valid & _T_448 ? _data_banks_0_0_io_ren_T_1[6] :
    io_write_dup_1_valid & io_write_bits_wmask[1] & io_write_dup_1_bits_way_en[6]; // @[BankedDataArray.scala 488:102 440:25 492:27]
  assign data_banks_1_6_io_waddr = io_cacheOp_req_dup_1_valid & _T_448 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_1}; // @[BankedDataArray.scala 488:102 441:27 493:29]
  assign data_banks_1_6_io_wdata = io_cacheOp_req_dup_1_valid & _T_448 ? io_cacheOp_req_bits_write_data_vec_1 :
    io_write_bits_data_1; // @[BankedDataArray.scala 488:102 442:27 494:29]
  assign data_banks_1_6_io_ren = io_cacheOp_req_valid & _T_444 ? _data_banks_0_0_io_ren_T_1[6] : read_en_14; // @[BankedDataArray.scala 369:25 468:89 472:27]
  assign data_banks_1_6_io_raddr = io_cacheOp_req_valid & _T_444 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_14}; // @[BankedDataArray.scala 370:27 468:89 473:29]
  assign data_banks_1_7_clock = clock;
  assign data_banks_1_7_io_wen = io_cacheOp_req_dup_1_valid & _T_448 ? _data_banks_0_0_io_ren_T_1[7] :
    io_write_dup_1_valid & io_write_bits_wmask[1] & io_write_dup_1_bits_way_en[7]; // @[BankedDataArray.scala 488:102 440:25 492:27]
  assign data_banks_1_7_io_waddr = io_cacheOp_req_dup_1_valid & _T_448 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_1}; // @[BankedDataArray.scala 488:102 441:27 493:29]
  assign data_banks_1_7_io_wdata = io_cacheOp_req_dup_1_valid & _T_448 ? io_cacheOp_req_bits_write_data_vec_1 :
    io_write_bits_data_1; // @[BankedDataArray.scala 488:102 442:27 494:29]
  assign data_banks_1_7_io_ren = io_cacheOp_req_valid & _T_444 ? _data_banks_0_0_io_ren_T_1[7] : read_en_15; // @[BankedDataArray.scala 369:25 468:89 472:27]
  assign data_banks_1_7_io_raddr = io_cacheOp_req_valid & _T_444 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_15}; // @[BankedDataArray.scala 370:27 468:89 473:29]
  assign data_banks_2_0_clock = clock;
  assign data_banks_2_0_io_wen = io_cacheOp_req_dup_5_valid & _T_456 ? _data_banks_0_0_io_ren_T_1[0] :
    io_write_dup_2_valid & io_write_bits_wmask[2] & io_write_dup_2_bits_way_en[0]; // @[BankedDataArray.scala 535:102 440:25 539:27]
  assign data_banks_2_0_io_waddr = io_cacheOp_req_dup_5_valid & _T_456 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_2}; // @[BankedDataArray.scala 535:102 441:27 540:29]
  assign data_banks_2_0_io_wdata = io_cacheOp_req_dup_5_valid & _T_456 ? io_cacheOp_req_bits_write_data_vec_2 :
    io_write_bits_data_2; // @[BankedDataArray.scala 535:102 442:27 541:29]
  assign data_banks_2_0_io_ren = io_cacheOp_req_dup_3_valid & _T_452 ? _data_banks_0_0_io_ren_T_1[0] : read_en_16; // @[BankedDataArray.scala 515:103 369:25 519:27]
  assign data_banks_2_0_io_raddr = io_cacheOp_req_dup_3_valid & _T_452 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_16}; // @[BankedDataArray.scala 515:103 370:27 520:29]
  assign data_banks_2_1_clock = clock;
  assign data_banks_2_1_io_wen = io_cacheOp_req_dup_5_valid & _T_456 ? _data_banks_0_0_io_ren_T_1[1] :
    io_write_dup_2_valid & io_write_bits_wmask[2] & io_write_dup_2_bits_way_en[1]; // @[BankedDataArray.scala 535:102 440:25 539:27]
  assign data_banks_2_1_io_waddr = io_cacheOp_req_dup_5_valid & _T_456 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_2}; // @[BankedDataArray.scala 535:102 441:27 540:29]
  assign data_banks_2_1_io_wdata = io_cacheOp_req_dup_5_valid & _T_456 ? io_cacheOp_req_bits_write_data_vec_2 :
    io_write_bits_data_2; // @[BankedDataArray.scala 535:102 442:27 541:29]
  assign data_banks_2_1_io_ren = io_cacheOp_req_dup_3_valid & _T_452 ? _data_banks_0_0_io_ren_T_1[1] : read_en_17; // @[BankedDataArray.scala 515:103 369:25 519:27]
  assign data_banks_2_1_io_raddr = io_cacheOp_req_dup_3_valid & _T_452 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_17}; // @[BankedDataArray.scala 515:103 370:27 520:29]
  assign data_banks_2_2_clock = clock;
  assign data_banks_2_2_io_wen = io_cacheOp_req_dup_5_valid & _T_456 ? _data_banks_0_0_io_ren_T_1[2] :
    io_write_dup_2_valid & io_write_bits_wmask[2] & io_write_dup_2_bits_way_en[2]; // @[BankedDataArray.scala 535:102 440:25 539:27]
  assign data_banks_2_2_io_waddr = io_cacheOp_req_dup_5_valid & _T_456 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_2}; // @[BankedDataArray.scala 535:102 441:27 540:29]
  assign data_banks_2_2_io_wdata = io_cacheOp_req_dup_5_valid & _T_456 ? io_cacheOp_req_bits_write_data_vec_2 :
    io_write_bits_data_2; // @[BankedDataArray.scala 535:102 442:27 541:29]
  assign data_banks_2_2_io_ren = io_cacheOp_req_dup_3_valid & _T_452 ? _data_banks_0_0_io_ren_T_1[2] : read_en_18; // @[BankedDataArray.scala 515:103 369:25 519:27]
  assign data_banks_2_2_io_raddr = io_cacheOp_req_dup_3_valid & _T_452 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_18}; // @[BankedDataArray.scala 515:103 370:27 520:29]
  assign data_banks_2_3_clock = clock;
  assign data_banks_2_3_io_wen = io_cacheOp_req_dup_5_valid & _T_456 ? _data_banks_0_0_io_ren_T_1[3] :
    io_write_dup_2_valid & io_write_bits_wmask[2] & io_write_dup_2_bits_way_en[3]; // @[BankedDataArray.scala 535:102 440:25 539:27]
  assign data_banks_2_3_io_waddr = io_cacheOp_req_dup_5_valid & _T_456 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_2}; // @[BankedDataArray.scala 535:102 441:27 540:29]
  assign data_banks_2_3_io_wdata = io_cacheOp_req_dup_5_valid & _T_456 ? io_cacheOp_req_bits_write_data_vec_2 :
    io_write_bits_data_2; // @[BankedDataArray.scala 535:102 442:27 541:29]
  assign data_banks_2_3_io_ren = io_cacheOp_req_dup_3_valid & _T_452 ? _data_banks_0_0_io_ren_T_1[3] : read_en_19; // @[BankedDataArray.scala 515:103 369:25 519:27]
  assign data_banks_2_3_io_raddr = io_cacheOp_req_dup_3_valid & _T_452 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_19}; // @[BankedDataArray.scala 515:103 370:27 520:29]
  assign data_banks_2_4_clock = clock;
  assign data_banks_2_4_io_wen = io_cacheOp_req_dup_5_valid & _T_456 ? _data_banks_0_0_io_ren_T_1[4] :
    io_write_dup_2_valid & io_write_bits_wmask[2] & io_write_dup_2_bits_way_en[4]; // @[BankedDataArray.scala 535:102 440:25 539:27]
  assign data_banks_2_4_io_waddr = io_cacheOp_req_dup_5_valid & _T_456 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_2}; // @[BankedDataArray.scala 535:102 441:27 540:29]
  assign data_banks_2_4_io_wdata = io_cacheOp_req_dup_5_valid & _T_456 ? io_cacheOp_req_bits_write_data_vec_2 :
    io_write_bits_data_2; // @[BankedDataArray.scala 535:102 442:27 541:29]
  assign data_banks_2_4_io_ren = io_cacheOp_req_dup_3_valid & _T_452 ? _data_banks_0_0_io_ren_T_1[4] : read_en_20; // @[BankedDataArray.scala 515:103 369:25 519:27]
  assign data_banks_2_4_io_raddr = io_cacheOp_req_dup_3_valid & _T_452 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_20}; // @[BankedDataArray.scala 515:103 370:27 520:29]
  assign data_banks_2_5_clock = clock;
  assign data_banks_2_5_io_wen = io_cacheOp_req_dup_5_valid & _T_456 ? _data_banks_0_0_io_ren_T_1[5] :
    io_write_dup_2_valid & io_write_bits_wmask[2] & io_write_dup_2_bits_way_en[5]; // @[BankedDataArray.scala 535:102 440:25 539:27]
  assign data_banks_2_5_io_waddr = io_cacheOp_req_dup_5_valid & _T_456 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_2}; // @[BankedDataArray.scala 535:102 441:27 540:29]
  assign data_banks_2_5_io_wdata = io_cacheOp_req_dup_5_valid & _T_456 ? io_cacheOp_req_bits_write_data_vec_2 :
    io_write_bits_data_2; // @[BankedDataArray.scala 535:102 442:27 541:29]
  assign data_banks_2_5_io_ren = io_cacheOp_req_dup_3_valid & _T_452 ? _data_banks_0_0_io_ren_T_1[5] : read_en_21; // @[BankedDataArray.scala 515:103 369:25 519:27]
  assign data_banks_2_5_io_raddr = io_cacheOp_req_dup_3_valid & _T_452 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_21}; // @[BankedDataArray.scala 515:103 370:27 520:29]
  assign data_banks_2_6_clock = clock;
  assign data_banks_2_6_io_wen = io_cacheOp_req_dup_5_valid & _T_456 ? _data_banks_0_0_io_ren_T_1[6] :
    io_write_dup_2_valid & io_write_bits_wmask[2] & io_write_dup_2_bits_way_en[6]; // @[BankedDataArray.scala 535:102 440:25 539:27]
  assign data_banks_2_6_io_waddr = io_cacheOp_req_dup_5_valid & _T_456 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_2}; // @[BankedDataArray.scala 535:102 441:27 540:29]
  assign data_banks_2_6_io_wdata = io_cacheOp_req_dup_5_valid & _T_456 ? io_cacheOp_req_bits_write_data_vec_2 :
    io_write_bits_data_2; // @[BankedDataArray.scala 535:102 442:27 541:29]
  assign data_banks_2_6_io_ren = io_cacheOp_req_dup_3_valid & _T_452 ? _data_banks_0_0_io_ren_T_1[6] : read_en_22; // @[BankedDataArray.scala 515:103 369:25 519:27]
  assign data_banks_2_6_io_raddr = io_cacheOp_req_dup_3_valid & _T_452 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_22}; // @[BankedDataArray.scala 515:103 370:27 520:29]
  assign data_banks_2_7_clock = clock;
  assign data_banks_2_7_io_wen = io_cacheOp_req_dup_5_valid & _T_456 ? _data_banks_0_0_io_ren_T_1[7] :
    io_write_dup_2_valid & io_write_bits_wmask[2] & io_write_dup_2_bits_way_en[7]; // @[BankedDataArray.scala 535:102 440:25 539:27]
  assign data_banks_2_7_io_waddr = io_cacheOp_req_dup_5_valid & _T_456 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_2}; // @[BankedDataArray.scala 535:102 441:27 540:29]
  assign data_banks_2_7_io_wdata = io_cacheOp_req_dup_5_valid & _T_456 ? io_cacheOp_req_bits_write_data_vec_2 :
    io_write_bits_data_2; // @[BankedDataArray.scala 535:102 442:27 541:29]
  assign data_banks_2_7_io_ren = io_cacheOp_req_dup_3_valid & _T_452 ? _data_banks_0_0_io_ren_T_1[7] : read_en_23; // @[BankedDataArray.scala 515:103 369:25 519:27]
  assign data_banks_2_7_io_raddr = io_cacheOp_req_dup_3_valid & _T_452 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_23}; // @[BankedDataArray.scala 515:103 370:27 520:29]
  assign data_banks_3_0_clock = clock;
  assign data_banks_3_0_io_wen = io_cacheOp_req_dup_5_valid & _T_456 ? _data_banks_0_0_io_ren_T_1[0] :
    io_write_dup_3_valid & io_write_bits_wmask[3] & io_write_dup_3_bits_way_en[0]; // @[BankedDataArray.scala 535:102 440:25 539:27]
  assign data_banks_3_0_io_waddr = io_cacheOp_req_dup_5_valid & _T_456 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_3}; // @[BankedDataArray.scala 535:102 441:27 540:29]
  assign data_banks_3_0_io_wdata = io_cacheOp_req_dup_5_valid & _T_456 ? io_cacheOp_req_bits_write_data_vec_3 :
    io_write_bits_data_3; // @[BankedDataArray.scala 535:102 442:27 541:29]
  assign data_banks_3_0_io_ren = io_cacheOp_req_dup_3_valid & _T_452 ? _data_banks_0_0_io_ren_T_1[0] : read_en_24; // @[BankedDataArray.scala 515:103 369:25 519:27]
  assign data_banks_3_0_io_raddr = io_cacheOp_req_dup_3_valid & _T_452 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_24}; // @[BankedDataArray.scala 515:103 370:27 520:29]
  assign data_banks_3_1_clock = clock;
  assign data_banks_3_1_io_wen = io_cacheOp_req_dup_5_valid & _T_456 ? _data_banks_0_0_io_ren_T_1[1] :
    io_write_dup_3_valid & io_write_bits_wmask[3] & io_write_dup_3_bits_way_en[1]; // @[BankedDataArray.scala 535:102 440:25 539:27]
  assign data_banks_3_1_io_waddr = io_cacheOp_req_dup_5_valid & _T_456 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_3}; // @[BankedDataArray.scala 535:102 441:27 540:29]
  assign data_banks_3_1_io_wdata = io_cacheOp_req_dup_5_valid & _T_456 ? io_cacheOp_req_bits_write_data_vec_3 :
    io_write_bits_data_3; // @[BankedDataArray.scala 535:102 442:27 541:29]
  assign data_banks_3_1_io_ren = io_cacheOp_req_dup_3_valid & _T_452 ? _data_banks_0_0_io_ren_T_1[1] : read_en_25; // @[BankedDataArray.scala 515:103 369:25 519:27]
  assign data_banks_3_1_io_raddr = io_cacheOp_req_dup_3_valid & _T_452 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_25}; // @[BankedDataArray.scala 515:103 370:27 520:29]
  assign data_banks_3_2_clock = clock;
  assign data_banks_3_2_io_wen = io_cacheOp_req_dup_5_valid & _T_456 ? _data_banks_0_0_io_ren_T_1[2] :
    io_write_dup_3_valid & io_write_bits_wmask[3] & io_write_dup_3_bits_way_en[2]; // @[BankedDataArray.scala 535:102 440:25 539:27]
  assign data_banks_3_2_io_waddr = io_cacheOp_req_dup_5_valid & _T_456 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_3}; // @[BankedDataArray.scala 535:102 441:27 540:29]
  assign data_banks_3_2_io_wdata = io_cacheOp_req_dup_5_valid & _T_456 ? io_cacheOp_req_bits_write_data_vec_3 :
    io_write_bits_data_3; // @[BankedDataArray.scala 535:102 442:27 541:29]
  assign data_banks_3_2_io_ren = io_cacheOp_req_dup_3_valid & _T_452 ? _data_banks_0_0_io_ren_T_1[2] : read_en_26; // @[BankedDataArray.scala 515:103 369:25 519:27]
  assign data_banks_3_2_io_raddr = io_cacheOp_req_dup_3_valid & _T_452 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_26}; // @[BankedDataArray.scala 515:103 370:27 520:29]
  assign data_banks_3_3_clock = clock;
  assign data_banks_3_3_io_wen = io_cacheOp_req_dup_5_valid & _T_456 ? _data_banks_0_0_io_ren_T_1[3] :
    io_write_dup_3_valid & io_write_bits_wmask[3] & io_write_dup_3_bits_way_en[3]; // @[BankedDataArray.scala 535:102 440:25 539:27]
  assign data_banks_3_3_io_waddr = io_cacheOp_req_dup_5_valid & _T_456 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_3}; // @[BankedDataArray.scala 535:102 441:27 540:29]
  assign data_banks_3_3_io_wdata = io_cacheOp_req_dup_5_valid & _T_456 ? io_cacheOp_req_bits_write_data_vec_3 :
    io_write_bits_data_3; // @[BankedDataArray.scala 535:102 442:27 541:29]
  assign data_banks_3_3_io_ren = io_cacheOp_req_dup_3_valid & _T_452 ? _data_banks_0_0_io_ren_T_1[3] : read_en_27; // @[BankedDataArray.scala 515:103 369:25 519:27]
  assign data_banks_3_3_io_raddr = io_cacheOp_req_dup_3_valid & _T_452 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_27}; // @[BankedDataArray.scala 515:103 370:27 520:29]
  assign data_banks_3_4_clock = clock;
  assign data_banks_3_4_io_wen = io_cacheOp_req_dup_5_valid & _T_456 ? _data_banks_0_0_io_ren_T_1[4] :
    io_write_dup_3_valid & io_write_bits_wmask[3] & io_write_dup_3_bits_way_en[4]; // @[BankedDataArray.scala 535:102 440:25 539:27]
  assign data_banks_3_4_io_waddr = io_cacheOp_req_dup_5_valid & _T_456 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_3}; // @[BankedDataArray.scala 535:102 441:27 540:29]
  assign data_banks_3_4_io_wdata = io_cacheOp_req_dup_5_valid & _T_456 ? io_cacheOp_req_bits_write_data_vec_3 :
    io_write_bits_data_3; // @[BankedDataArray.scala 535:102 442:27 541:29]
  assign data_banks_3_4_io_ren = io_cacheOp_req_dup_3_valid & _T_452 ? _data_banks_0_0_io_ren_T_1[4] : read_en_28; // @[BankedDataArray.scala 515:103 369:25 519:27]
  assign data_banks_3_4_io_raddr = io_cacheOp_req_dup_3_valid & _T_452 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_28}; // @[BankedDataArray.scala 515:103 370:27 520:29]
  assign data_banks_3_5_clock = clock;
  assign data_banks_3_5_io_wen = io_cacheOp_req_dup_5_valid & _T_456 ? _data_banks_0_0_io_ren_T_1[5] :
    io_write_dup_3_valid & io_write_bits_wmask[3] & io_write_dup_3_bits_way_en[5]; // @[BankedDataArray.scala 535:102 440:25 539:27]
  assign data_banks_3_5_io_waddr = io_cacheOp_req_dup_5_valid & _T_456 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_3}; // @[BankedDataArray.scala 535:102 441:27 540:29]
  assign data_banks_3_5_io_wdata = io_cacheOp_req_dup_5_valid & _T_456 ? io_cacheOp_req_bits_write_data_vec_3 :
    io_write_bits_data_3; // @[BankedDataArray.scala 535:102 442:27 541:29]
  assign data_banks_3_5_io_ren = io_cacheOp_req_dup_3_valid & _T_452 ? _data_banks_0_0_io_ren_T_1[5] : read_en_29; // @[BankedDataArray.scala 515:103 369:25 519:27]
  assign data_banks_3_5_io_raddr = io_cacheOp_req_dup_3_valid & _T_452 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_29}; // @[BankedDataArray.scala 515:103 370:27 520:29]
  assign data_banks_3_6_clock = clock;
  assign data_banks_3_6_io_wen = io_cacheOp_req_dup_5_valid & _T_456 ? _data_banks_0_0_io_ren_T_1[6] :
    io_write_dup_3_valid & io_write_bits_wmask[3] & io_write_dup_3_bits_way_en[6]; // @[BankedDataArray.scala 535:102 440:25 539:27]
  assign data_banks_3_6_io_waddr = io_cacheOp_req_dup_5_valid & _T_456 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_3}; // @[BankedDataArray.scala 535:102 441:27 540:29]
  assign data_banks_3_6_io_wdata = io_cacheOp_req_dup_5_valid & _T_456 ? io_cacheOp_req_bits_write_data_vec_3 :
    io_write_bits_data_3; // @[BankedDataArray.scala 535:102 442:27 541:29]
  assign data_banks_3_6_io_ren = io_cacheOp_req_dup_3_valid & _T_452 ? _data_banks_0_0_io_ren_T_1[6] : read_en_30; // @[BankedDataArray.scala 515:103 369:25 519:27]
  assign data_banks_3_6_io_raddr = io_cacheOp_req_dup_3_valid & _T_452 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_30}; // @[BankedDataArray.scala 515:103 370:27 520:29]
  assign data_banks_3_7_clock = clock;
  assign data_banks_3_7_io_wen = io_cacheOp_req_dup_5_valid & _T_456 ? _data_banks_0_0_io_ren_T_1[7] :
    io_write_dup_3_valid & io_write_bits_wmask[3] & io_write_dup_3_bits_way_en[7]; // @[BankedDataArray.scala 535:102 440:25 539:27]
  assign data_banks_3_7_io_waddr = io_cacheOp_req_dup_5_valid & _T_456 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_3}; // @[BankedDataArray.scala 535:102 441:27 540:29]
  assign data_banks_3_7_io_wdata = io_cacheOp_req_dup_5_valid & _T_456 ? io_cacheOp_req_bits_write_data_vec_3 :
    io_write_bits_data_3; // @[BankedDataArray.scala 535:102 442:27 541:29]
  assign data_banks_3_7_io_ren = io_cacheOp_req_dup_3_valid & _T_452 ? _data_banks_0_0_io_ren_T_1[7] : read_en_31; // @[BankedDataArray.scala 515:103 369:25 519:27]
  assign data_banks_3_7_io_raddr = io_cacheOp_req_dup_3_valid & _T_452 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_31}; // @[BankedDataArray.scala 515:103 370:27 520:29]
  assign data_banks_4_0_clock = clock;
  assign data_banks_4_0_io_wen = io_cacheOp_req_dup_9_valid & _T_464 ? _data_banks_0_0_io_ren_T_1[0] :
    io_write_dup_4_valid & io_write_bits_wmask[4] & io_write_dup_4_bits_way_en[0]; // @[BankedDataArray.scala 581:102 440:25 585:27]
  assign data_banks_4_0_io_waddr = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_4}; // @[BankedDataArray.scala 581:102 441:27 586:29]
  assign data_banks_4_0_io_wdata = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_write_data_vec_4 :
    io_write_bits_data_4; // @[BankedDataArray.scala 581:102 442:27 587:29]
  assign data_banks_4_0_io_ren = io_cacheOp_req_dup_7_valid & _T_460 ? _data_banks_0_0_io_ren_T_1[0] : read_en_32; // @[BankedDataArray.scala 561:103 369:25 565:27]
  assign data_banks_4_0_io_raddr = io_cacheOp_req_dup_7_valid & _T_460 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_32}; // @[BankedDataArray.scala 561:103 370:27 566:29]
  assign data_banks_4_1_clock = clock;
  assign data_banks_4_1_io_wen = io_cacheOp_req_dup_9_valid & _T_464 ? _data_banks_0_0_io_ren_T_1[1] :
    io_write_dup_4_valid & io_write_bits_wmask[4] & io_write_dup_4_bits_way_en[1]; // @[BankedDataArray.scala 581:102 440:25 585:27]
  assign data_banks_4_1_io_waddr = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_4}; // @[BankedDataArray.scala 581:102 441:27 586:29]
  assign data_banks_4_1_io_wdata = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_write_data_vec_4 :
    io_write_bits_data_4; // @[BankedDataArray.scala 581:102 442:27 587:29]
  assign data_banks_4_1_io_ren = io_cacheOp_req_dup_7_valid & _T_460 ? _data_banks_0_0_io_ren_T_1[1] : read_en_33; // @[BankedDataArray.scala 561:103 369:25 565:27]
  assign data_banks_4_1_io_raddr = io_cacheOp_req_dup_7_valid & _T_460 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_33}; // @[BankedDataArray.scala 561:103 370:27 566:29]
  assign data_banks_4_2_clock = clock;
  assign data_banks_4_2_io_wen = io_cacheOp_req_dup_9_valid & _T_464 ? _data_banks_0_0_io_ren_T_1[2] :
    io_write_dup_4_valid & io_write_bits_wmask[4] & io_write_dup_4_bits_way_en[2]; // @[BankedDataArray.scala 581:102 440:25 585:27]
  assign data_banks_4_2_io_waddr = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_4}; // @[BankedDataArray.scala 581:102 441:27 586:29]
  assign data_banks_4_2_io_wdata = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_write_data_vec_4 :
    io_write_bits_data_4; // @[BankedDataArray.scala 581:102 442:27 587:29]
  assign data_banks_4_2_io_ren = io_cacheOp_req_dup_7_valid & _T_460 ? _data_banks_0_0_io_ren_T_1[2] : read_en_34; // @[BankedDataArray.scala 561:103 369:25 565:27]
  assign data_banks_4_2_io_raddr = io_cacheOp_req_dup_7_valid & _T_460 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_34}; // @[BankedDataArray.scala 561:103 370:27 566:29]
  assign data_banks_4_3_clock = clock;
  assign data_banks_4_3_io_wen = io_cacheOp_req_dup_9_valid & _T_464 ? _data_banks_0_0_io_ren_T_1[3] :
    io_write_dup_4_valid & io_write_bits_wmask[4] & io_write_dup_4_bits_way_en[3]; // @[BankedDataArray.scala 581:102 440:25 585:27]
  assign data_banks_4_3_io_waddr = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_4}; // @[BankedDataArray.scala 581:102 441:27 586:29]
  assign data_banks_4_3_io_wdata = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_write_data_vec_4 :
    io_write_bits_data_4; // @[BankedDataArray.scala 581:102 442:27 587:29]
  assign data_banks_4_3_io_ren = io_cacheOp_req_dup_7_valid & _T_460 ? _data_banks_0_0_io_ren_T_1[3] : read_en_35; // @[BankedDataArray.scala 561:103 369:25 565:27]
  assign data_banks_4_3_io_raddr = io_cacheOp_req_dup_7_valid & _T_460 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_35}; // @[BankedDataArray.scala 561:103 370:27 566:29]
  assign data_banks_4_4_clock = clock;
  assign data_banks_4_4_io_wen = io_cacheOp_req_dup_9_valid & _T_464 ? _data_banks_0_0_io_ren_T_1[4] :
    io_write_dup_4_valid & io_write_bits_wmask[4] & io_write_dup_4_bits_way_en[4]; // @[BankedDataArray.scala 581:102 440:25 585:27]
  assign data_banks_4_4_io_waddr = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_4}; // @[BankedDataArray.scala 581:102 441:27 586:29]
  assign data_banks_4_4_io_wdata = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_write_data_vec_4 :
    io_write_bits_data_4; // @[BankedDataArray.scala 581:102 442:27 587:29]
  assign data_banks_4_4_io_ren = io_cacheOp_req_dup_7_valid & _T_460 ? _data_banks_0_0_io_ren_T_1[4] : read_en_36; // @[BankedDataArray.scala 561:103 369:25 565:27]
  assign data_banks_4_4_io_raddr = io_cacheOp_req_dup_7_valid & _T_460 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_36}; // @[BankedDataArray.scala 561:103 370:27 566:29]
  assign data_banks_4_5_clock = clock;
  assign data_banks_4_5_io_wen = io_cacheOp_req_dup_9_valid & _T_464 ? _data_banks_0_0_io_ren_T_1[5] :
    io_write_dup_4_valid & io_write_bits_wmask[4] & io_write_dup_4_bits_way_en[5]; // @[BankedDataArray.scala 581:102 440:25 585:27]
  assign data_banks_4_5_io_waddr = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_4}; // @[BankedDataArray.scala 581:102 441:27 586:29]
  assign data_banks_4_5_io_wdata = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_write_data_vec_4 :
    io_write_bits_data_4; // @[BankedDataArray.scala 581:102 442:27 587:29]
  assign data_banks_4_5_io_ren = io_cacheOp_req_dup_7_valid & _T_460 ? _data_banks_0_0_io_ren_T_1[5] : read_en_37; // @[BankedDataArray.scala 561:103 369:25 565:27]
  assign data_banks_4_5_io_raddr = io_cacheOp_req_dup_7_valid & _T_460 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_37}; // @[BankedDataArray.scala 561:103 370:27 566:29]
  assign data_banks_4_6_clock = clock;
  assign data_banks_4_6_io_wen = io_cacheOp_req_dup_9_valid & _T_464 ? _data_banks_0_0_io_ren_T_1[6] :
    io_write_dup_4_valid & io_write_bits_wmask[4] & io_write_dup_4_bits_way_en[6]; // @[BankedDataArray.scala 581:102 440:25 585:27]
  assign data_banks_4_6_io_waddr = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_4}; // @[BankedDataArray.scala 581:102 441:27 586:29]
  assign data_banks_4_6_io_wdata = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_write_data_vec_4 :
    io_write_bits_data_4; // @[BankedDataArray.scala 581:102 442:27 587:29]
  assign data_banks_4_6_io_ren = io_cacheOp_req_dup_7_valid & _T_460 ? _data_banks_0_0_io_ren_T_1[6] : read_en_38; // @[BankedDataArray.scala 561:103 369:25 565:27]
  assign data_banks_4_6_io_raddr = io_cacheOp_req_dup_7_valid & _T_460 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_38}; // @[BankedDataArray.scala 561:103 370:27 566:29]
  assign data_banks_4_7_clock = clock;
  assign data_banks_4_7_io_wen = io_cacheOp_req_dup_9_valid & _T_464 ? _data_banks_0_0_io_ren_T_1[7] :
    io_write_dup_4_valid & io_write_bits_wmask[4] & io_write_dup_4_bits_way_en[7]; // @[BankedDataArray.scala 581:102 440:25 585:27]
  assign data_banks_4_7_io_waddr = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_4}; // @[BankedDataArray.scala 581:102 441:27 586:29]
  assign data_banks_4_7_io_wdata = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_write_data_vec_4 :
    io_write_bits_data_4; // @[BankedDataArray.scala 581:102 442:27 587:29]
  assign data_banks_4_7_io_ren = io_cacheOp_req_dup_7_valid & _T_460 ? _data_banks_0_0_io_ren_T_1[7] : read_en_39; // @[BankedDataArray.scala 561:103 369:25 565:27]
  assign data_banks_4_7_io_raddr = io_cacheOp_req_dup_7_valid & _T_460 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_39}; // @[BankedDataArray.scala 561:103 370:27 566:29]
  assign data_banks_5_0_clock = clock;
  assign data_banks_5_0_io_wen = io_cacheOp_req_dup_9_valid & _T_464 ? _data_banks_0_0_io_ren_T_1[0] :
    io_write_dup_5_valid & io_write_bits_wmask[5] & io_write_dup_5_bits_way_en[0]; // @[BankedDataArray.scala 581:102 440:25 585:27]
  assign data_banks_5_0_io_waddr = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_5}; // @[BankedDataArray.scala 581:102 441:27 586:29]
  assign data_banks_5_0_io_wdata = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_write_data_vec_5 :
    io_write_bits_data_5; // @[BankedDataArray.scala 581:102 442:27 587:29]
  assign data_banks_5_0_io_ren = io_cacheOp_req_dup_7_valid & _T_460 ? _data_banks_0_0_io_ren_T_1[0] : read_en_40; // @[BankedDataArray.scala 561:103 369:25 565:27]
  assign data_banks_5_0_io_raddr = io_cacheOp_req_dup_7_valid & _T_460 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_40}; // @[BankedDataArray.scala 561:103 370:27 566:29]
  assign data_banks_5_1_clock = clock;
  assign data_banks_5_1_io_wen = io_cacheOp_req_dup_9_valid & _T_464 ? _data_banks_0_0_io_ren_T_1[1] :
    io_write_dup_5_valid & io_write_bits_wmask[5] & io_write_dup_5_bits_way_en[1]; // @[BankedDataArray.scala 581:102 440:25 585:27]
  assign data_banks_5_1_io_waddr = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_5}; // @[BankedDataArray.scala 581:102 441:27 586:29]
  assign data_banks_5_1_io_wdata = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_write_data_vec_5 :
    io_write_bits_data_5; // @[BankedDataArray.scala 581:102 442:27 587:29]
  assign data_banks_5_1_io_ren = io_cacheOp_req_dup_7_valid & _T_460 ? _data_banks_0_0_io_ren_T_1[1] : read_en_41; // @[BankedDataArray.scala 561:103 369:25 565:27]
  assign data_banks_5_1_io_raddr = io_cacheOp_req_dup_7_valid & _T_460 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_41}; // @[BankedDataArray.scala 561:103 370:27 566:29]
  assign data_banks_5_2_clock = clock;
  assign data_banks_5_2_io_wen = io_cacheOp_req_dup_9_valid & _T_464 ? _data_banks_0_0_io_ren_T_1[2] :
    io_write_dup_5_valid & io_write_bits_wmask[5] & io_write_dup_5_bits_way_en[2]; // @[BankedDataArray.scala 581:102 440:25 585:27]
  assign data_banks_5_2_io_waddr = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_5}; // @[BankedDataArray.scala 581:102 441:27 586:29]
  assign data_banks_5_2_io_wdata = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_write_data_vec_5 :
    io_write_bits_data_5; // @[BankedDataArray.scala 581:102 442:27 587:29]
  assign data_banks_5_2_io_ren = io_cacheOp_req_dup_7_valid & _T_460 ? _data_banks_0_0_io_ren_T_1[2] : read_en_42; // @[BankedDataArray.scala 561:103 369:25 565:27]
  assign data_banks_5_2_io_raddr = io_cacheOp_req_dup_7_valid & _T_460 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_42}; // @[BankedDataArray.scala 561:103 370:27 566:29]
  assign data_banks_5_3_clock = clock;
  assign data_banks_5_3_io_wen = io_cacheOp_req_dup_9_valid & _T_464 ? _data_banks_0_0_io_ren_T_1[3] :
    io_write_dup_5_valid & io_write_bits_wmask[5] & io_write_dup_5_bits_way_en[3]; // @[BankedDataArray.scala 581:102 440:25 585:27]
  assign data_banks_5_3_io_waddr = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_5}; // @[BankedDataArray.scala 581:102 441:27 586:29]
  assign data_banks_5_3_io_wdata = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_write_data_vec_5 :
    io_write_bits_data_5; // @[BankedDataArray.scala 581:102 442:27 587:29]
  assign data_banks_5_3_io_ren = io_cacheOp_req_dup_7_valid & _T_460 ? _data_banks_0_0_io_ren_T_1[3] : read_en_43; // @[BankedDataArray.scala 561:103 369:25 565:27]
  assign data_banks_5_3_io_raddr = io_cacheOp_req_dup_7_valid & _T_460 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_43}; // @[BankedDataArray.scala 561:103 370:27 566:29]
  assign data_banks_5_4_clock = clock;
  assign data_banks_5_4_io_wen = io_cacheOp_req_dup_9_valid & _T_464 ? _data_banks_0_0_io_ren_T_1[4] :
    io_write_dup_5_valid & io_write_bits_wmask[5] & io_write_dup_5_bits_way_en[4]; // @[BankedDataArray.scala 581:102 440:25 585:27]
  assign data_banks_5_4_io_waddr = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_5}; // @[BankedDataArray.scala 581:102 441:27 586:29]
  assign data_banks_5_4_io_wdata = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_write_data_vec_5 :
    io_write_bits_data_5; // @[BankedDataArray.scala 581:102 442:27 587:29]
  assign data_banks_5_4_io_ren = io_cacheOp_req_dup_7_valid & _T_460 ? _data_banks_0_0_io_ren_T_1[4] : read_en_44; // @[BankedDataArray.scala 561:103 369:25 565:27]
  assign data_banks_5_4_io_raddr = io_cacheOp_req_dup_7_valid & _T_460 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_44}; // @[BankedDataArray.scala 561:103 370:27 566:29]
  assign data_banks_5_5_clock = clock;
  assign data_banks_5_5_io_wen = io_cacheOp_req_dup_9_valid & _T_464 ? _data_banks_0_0_io_ren_T_1[5] :
    io_write_dup_5_valid & io_write_bits_wmask[5] & io_write_dup_5_bits_way_en[5]; // @[BankedDataArray.scala 581:102 440:25 585:27]
  assign data_banks_5_5_io_waddr = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_5}; // @[BankedDataArray.scala 581:102 441:27 586:29]
  assign data_banks_5_5_io_wdata = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_write_data_vec_5 :
    io_write_bits_data_5; // @[BankedDataArray.scala 581:102 442:27 587:29]
  assign data_banks_5_5_io_ren = io_cacheOp_req_dup_7_valid & _T_460 ? _data_banks_0_0_io_ren_T_1[5] : read_en_45; // @[BankedDataArray.scala 561:103 369:25 565:27]
  assign data_banks_5_5_io_raddr = io_cacheOp_req_dup_7_valid & _T_460 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_45}; // @[BankedDataArray.scala 561:103 370:27 566:29]
  assign data_banks_5_6_clock = clock;
  assign data_banks_5_6_io_wen = io_cacheOp_req_dup_9_valid & _T_464 ? _data_banks_0_0_io_ren_T_1[6] :
    io_write_dup_5_valid & io_write_bits_wmask[5] & io_write_dup_5_bits_way_en[6]; // @[BankedDataArray.scala 581:102 440:25 585:27]
  assign data_banks_5_6_io_waddr = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_5}; // @[BankedDataArray.scala 581:102 441:27 586:29]
  assign data_banks_5_6_io_wdata = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_write_data_vec_5 :
    io_write_bits_data_5; // @[BankedDataArray.scala 581:102 442:27 587:29]
  assign data_banks_5_6_io_ren = io_cacheOp_req_dup_7_valid & _T_460 ? _data_banks_0_0_io_ren_T_1[6] : read_en_46; // @[BankedDataArray.scala 561:103 369:25 565:27]
  assign data_banks_5_6_io_raddr = io_cacheOp_req_dup_7_valid & _T_460 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_46}; // @[BankedDataArray.scala 561:103 370:27 566:29]
  assign data_banks_5_7_clock = clock;
  assign data_banks_5_7_io_wen = io_cacheOp_req_dup_9_valid & _T_464 ? _data_banks_0_0_io_ren_T_1[7] :
    io_write_dup_5_valid & io_write_bits_wmask[5] & io_write_dup_5_bits_way_en[7]; // @[BankedDataArray.scala 581:102 440:25 585:27]
  assign data_banks_5_7_io_waddr = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_5}; // @[BankedDataArray.scala 581:102 441:27 586:29]
  assign data_banks_5_7_io_wdata = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_write_data_vec_5 :
    io_write_bits_data_5; // @[BankedDataArray.scala 581:102 442:27 587:29]
  assign data_banks_5_7_io_ren = io_cacheOp_req_dup_7_valid & _T_460 ? _data_banks_0_0_io_ren_T_1[7] : read_en_47; // @[BankedDataArray.scala 561:103 369:25 565:27]
  assign data_banks_5_7_io_raddr = io_cacheOp_req_dup_7_valid & _T_460 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_47}; // @[BankedDataArray.scala 561:103 370:27 566:29]
  assign data_banks_6_0_clock = clock;
  assign data_banks_6_0_io_wen = io_cacheOp_req_dup_9_valid & _T_464 ? _data_banks_0_0_io_ren_T_1[0] :
    io_write_dup_6_valid & io_write_bits_wmask[6] & io_write_dup_6_bits_way_en[0]; // @[BankedDataArray.scala 581:102 440:25 585:27]
  assign data_banks_6_0_io_waddr = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_6}; // @[BankedDataArray.scala 581:102 441:27 586:29]
  assign data_banks_6_0_io_wdata = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_write_data_vec_6 :
    io_write_bits_data_6; // @[BankedDataArray.scala 581:102 442:27 587:29]
  assign data_banks_6_0_io_ren = io_cacheOp_req_dup_7_valid & _T_460 ? _data_banks_0_0_io_ren_T_1[0] : read_en_48; // @[BankedDataArray.scala 561:103 369:25 565:27]
  assign data_banks_6_0_io_raddr = io_cacheOp_req_dup_7_valid & _T_460 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_48}; // @[BankedDataArray.scala 561:103 370:27 566:29]
  assign data_banks_6_1_clock = clock;
  assign data_banks_6_1_io_wen = io_cacheOp_req_dup_9_valid & _T_464 ? _data_banks_0_0_io_ren_T_1[1] :
    io_write_dup_6_valid & io_write_bits_wmask[6] & io_write_dup_6_bits_way_en[1]; // @[BankedDataArray.scala 581:102 440:25 585:27]
  assign data_banks_6_1_io_waddr = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_6}; // @[BankedDataArray.scala 581:102 441:27 586:29]
  assign data_banks_6_1_io_wdata = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_write_data_vec_6 :
    io_write_bits_data_6; // @[BankedDataArray.scala 581:102 442:27 587:29]
  assign data_banks_6_1_io_ren = io_cacheOp_req_dup_7_valid & _T_460 ? _data_banks_0_0_io_ren_T_1[1] : read_en_49; // @[BankedDataArray.scala 561:103 369:25 565:27]
  assign data_banks_6_1_io_raddr = io_cacheOp_req_dup_7_valid & _T_460 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_49}; // @[BankedDataArray.scala 561:103 370:27 566:29]
  assign data_banks_6_2_clock = clock;
  assign data_banks_6_2_io_wen = io_cacheOp_req_dup_9_valid & _T_464 ? _data_banks_0_0_io_ren_T_1[2] :
    io_write_dup_6_valid & io_write_bits_wmask[6] & io_write_dup_6_bits_way_en[2]; // @[BankedDataArray.scala 581:102 440:25 585:27]
  assign data_banks_6_2_io_waddr = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_6}; // @[BankedDataArray.scala 581:102 441:27 586:29]
  assign data_banks_6_2_io_wdata = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_write_data_vec_6 :
    io_write_bits_data_6; // @[BankedDataArray.scala 581:102 442:27 587:29]
  assign data_banks_6_2_io_ren = io_cacheOp_req_dup_7_valid & _T_460 ? _data_banks_0_0_io_ren_T_1[2] : read_en_50; // @[BankedDataArray.scala 561:103 369:25 565:27]
  assign data_banks_6_2_io_raddr = io_cacheOp_req_dup_7_valid & _T_460 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_50}; // @[BankedDataArray.scala 561:103 370:27 566:29]
  assign data_banks_6_3_clock = clock;
  assign data_banks_6_3_io_wen = io_cacheOp_req_dup_9_valid & _T_464 ? _data_banks_0_0_io_ren_T_1[3] :
    io_write_dup_6_valid & io_write_bits_wmask[6] & io_write_dup_6_bits_way_en[3]; // @[BankedDataArray.scala 581:102 440:25 585:27]
  assign data_banks_6_3_io_waddr = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_6}; // @[BankedDataArray.scala 581:102 441:27 586:29]
  assign data_banks_6_3_io_wdata = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_write_data_vec_6 :
    io_write_bits_data_6; // @[BankedDataArray.scala 581:102 442:27 587:29]
  assign data_banks_6_3_io_ren = io_cacheOp_req_dup_7_valid & _T_460 ? _data_banks_0_0_io_ren_T_1[3] : read_en_51; // @[BankedDataArray.scala 561:103 369:25 565:27]
  assign data_banks_6_3_io_raddr = io_cacheOp_req_dup_7_valid & _T_460 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_51}; // @[BankedDataArray.scala 561:103 370:27 566:29]
  assign data_banks_6_4_clock = clock;
  assign data_banks_6_4_io_wen = io_cacheOp_req_dup_9_valid & _T_464 ? _data_banks_0_0_io_ren_T_1[4] :
    io_write_dup_6_valid & io_write_bits_wmask[6] & io_write_dup_6_bits_way_en[4]; // @[BankedDataArray.scala 581:102 440:25 585:27]
  assign data_banks_6_4_io_waddr = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_6}; // @[BankedDataArray.scala 581:102 441:27 586:29]
  assign data_banks_6_4_io_wdata = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_write_data_vec_6 :
    io_write_bits_data_6; // @[BankedDataArray.scala 581:102 442:27 587:29]
  assign data_banks_6_4_io_ren = io_cacheOp_req_dup_7_valid & _T_460 ? _data_banks_0_0_io_ren_T_1[4] : read_en_52; // @[BankedDataArray.scala 561:103 369:25 565:27]
  assign data_banks_6_4_io_raddr = io_cacheOp_req_dup_7_valid & _T_460 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_52}; // @[BankedDataArray.scala 561:103 370:27 566:29]
  assign data_banks_6_5_clock = clock;
  assign data_banks_6_5_io_wen = io_cacheOp_req_dup_9_valid & _T_464 ? _data_banks_0_0_io_ren_T_1[5] :
    io_write_dup_6_valid & io_write_bits_wmask[6] & io_write_dup_6_bits_way_en[5]; // @[BankedDataArray.scala 581:102 440:25 585:27]
  assign data_banks_6_5_io_waddr = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_6}; // @[BankedDataArray.scala 581:102 441:27 586:29]
  assign data_banks_6_5_io_wdata = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_write_data_vec_6 :
    io_write_bits_data_6; // @[BankedDataArray.scala 581:102 442:27 587:29]
  assign data_banks_6_5_io_ren = io_cacheOp_req_dup_7_valid & _T_460 ? _data_banks_0_0_io_ren_T_1[5] : read_en_53; // @[BankedDataArray.scala 561:103 369:25 565:27]
  assign data_banks_6_5_io_raddr = io_cacheOp_req_dup_7_valid & _T_460 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_53}; // @[BankedDataArray.scala 561:103 370:27 566:29]
  assign data_banks_6_6_clock = clock;
  assign data_banks_6_6_io_wen = io_cacheOp_req_dup_9_valid & _T_464 ? _data_banks_0_0_io_ren_T_1[6] :
    io_write_dup_6_valid & io_write_bits_wmask[6] & io_write_dup_6_bits_way_en[6]; // @[BankedDataArray.scala 581:102 440:25 585:27]
  assign data_banks_6_6_io_waddr = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_6}; // @[BankedDataArray.scala 581:102 441:27 586:29]
  assign data_banks_6_6_io_wdata = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_write_data_vec_6 :
    io_write_bits_data_6; // @[BankedDataArray.scala 581:102 442:27 587:29]
  assign data_banks_6_6_io_ren = io_cacheOp_req_dup_7_valid & _T_460 ? _data_banks_0_0_io_ren_T_1[6] : read_en_54; // @[BankedDataArray.scala 561:103 369:25 565:27]
  assign data_banks_6_6_io_raddr = io_cacheOp_req_dup_7_valid & _T_460 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_54}; // @[BankedDataArray.scala 561:103 370:27 566:29]
  assign data_banks_6_7_clock = clock;
  assign data_banks_6_7_io_wen = io_cacheOp_req_dup_9_valid & _T_464 ? _data_banks_0_0_io_ren_T_1[7] :
    io_write_dup_6_valid & io_write_bits_wmask[6] & io_write_dup_6_bits_way_en[7]; // @[BankedDataArray.scala 581:102 440:25 585:27]
  assign data_banks_6_7_io_waddr = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_6}; // @[BankedDataArray.scala 581:102 441:27 586:29]
  assign data_banks_6_7_io_wdata = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_write_data_vec_6 :
    io_write_bits_data_6; // @[BankedDataArray.scala 581:102 442:27 587:29]
  assign data_banks_6_7_io_ren = io_cacheOp_req_dup_7_valid & _T_460 ? _data_banks_0_0_io_ren_T_1[7] : read_en_55; // @[BankedDataArray.scala 561:103 369:25 565:27]
  assign data_banks_6_7_io_raddr = io_cacheOp_req_dup_7_valid & _T_460 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_55}; // @[BankedDataArray.scala 561:103 370:27 566:29]
  assign data_banks_7_0_clock = clock;
  assign data_banks_7_0_io_wen = io_cacheOp_req_dup_9_valid & _T_464 ? _data_banks_0_0_io_ren_T_1[0] :
    io_write_dup_7_valid & io_write_bits_wmask[7] & io_write_dup_7_bits_way_en[0]; // @[BankedDataArray.scala 581:102 440:25 585:27]
  assign data_banks_7_0_io_waddr = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_7}; // @[BankedDataArray.scala 581:102 441:27 586:29]
  assign data_banks_7_0_io_wdata = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_write_data_vec_7 :
    io_write_bits_data_7; // @[BankedDataArray.scala 581:102 442:27 587:29]
  assign data_banks_7_0_io_ren = io_cacheOp_req_dup_7_valid & _T_460 ? _data_banks_0_0_io_ren_T_1[0] : read_en_56; // @[BankedDataArray.scala 561:103 369:25 565:27]
  assign data_banks_7_0_io_raddr = io_cacheOp_req_dup_7_valid & _T_460 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_56}; // @[BankedDataArray.scala 561:103 370:27 566:29]
  assign data_banks_7_1_clock = clock;
  assign data_banks_7_1_io_wen = io_cacheOp_req_dup_9_valid & _T_464 ? _data_banks_0_0_io_ren_T_1[1] :
    io_write_dup_7_valid & io_write_bits_wmask[7] & io_write_dup_7_bits_way_en[1]; // @[BankedDataArray.scala 581:102 440:25 585:27]
  assign data_banks_7_1_io_waddr = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_7}; // @[BankedDataArray.scala 581:102 441:27 586:29]
  assign data_banks_7_1_io_wdata = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_write_data_vec_7 :
    io_write_bits_data_7; // @[BankedDataArray.scala 581:102 442:27 587:29]
  assign data_banks_7_1_io_ren = io_cacheOp_req_dup_7_valid & _T_460 ? _data_banks_0_0_io_ren_T_1[1] : read_en_57; // @[BankedDataArray.scala 561:103 369:25 565:27]
  assign data_banks_7_1_io_raddr = io_cacheOp_req_dup_7_valid & _T_460 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_57}; // @[BankedDataArray.scala 561:103 370:27 566:29]
  assign data_banks_7_2_clock = clock;
  assign data_banks_7_2_io_wen = io_cacheOp_req_dup_9_valid & _T_464 ? _data_banks_0_0_io_ren_T_1[2] :
    io_write_dup_7_valid & io_write_bits_wmask[7] & io_write_dup_7_bits_way_en[2]; // @[BankedDataArray.scala 581:102 440:25 585:27]
  assign data_banks_7_2_io_waddr = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_7}; // @[BankedDataArray.scala 581:102 441:27 586:29]
  assign data_banks_7_2_io_wdata = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_write_data_vec_7 :
    io_write_bits_data_7; // @[BankedDataArray.scala 581:102 442:27 587:29]
  assign data_banks_7_2_io_ren = io_cacheOp_req_dup_7_valid & _T_460 ? _data_banks_0_0_io_ren_T_1[2] : read_en_58; // @[BankedDataArray.scala 561:103 369:25 565:27]
  assign data_banks_7_2_io_raddr = io_cacheOp_req_dup_7_valid & _T_460 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_58}; // @[BankedDataArray.scala 561:103 370:27 566:29]
  assign data_banks_7_3_clock = clock;
  assign data_banks_7_3_io_wen = io_cacheOp_req_dup_9_valid & _T_464 ? _data_banks_0_0_io_ren_T_1[3] :
    io_write_dup_7_valid & io_write_bits_wmask[7] & io_write_dup_7_bits_way_en[3]; // @[BankedDataArray.scala 581:102 440:25 585:27]
  assign data_banks_7_3_io_waddr = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_7}; // @[BankedDataArray.scala 581:102 441:27 586:29]
  assign data_banks_7_3_io_wdata = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_write_data_vec_7 :
    io_write_bits_data_7; // @[BankedDataArray.scala 581:102 442:27 587:29]
  assign data_banks_7_3_io_ren = io_cacheOp_req_dup_7_valid & _T_460 ? _data_banks_0_0_io_ren_T_1[3] : read_en_59; // @[BankedDataArray.scala 561:103 369:25 565:27]
  assign data_banks_7_3_io_raddr = io_cacheOp_req_dup_7_valid & _T_460 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_59}; // @[BankedDataArray.scala 561:103 370:27 566:29]
  assign data_banks_7_4_clock = clock;
  assign data_banks_7_4_io_wen = io_cacheOp_req_dup_9_valid & _T_464 ? _data_banks_0_0_io_ren_T_1[4] :
    io_write_dup_7_valid & io_write_bits_wmask[7] & io_write_dup_7_bits_way_en[4]; // @[BankedDataArray.scala 581:102 440:25 585:27]
  assign data_banks_7_4_io_waddr = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_7}; // @[BankedDataArray.scala 581:102 441:27 586:29]
  assign data_banks_7_4_io_wdata = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_write_data_vec_7 :
    io_write_bits_data_7; // @[BankedDataArray.scala 581:102 442:27 587:29]
  assign data_banks_7_4_io_ren = io_cacheOp_req_dup_7_valid & _T_460 ? _data_banks_0_0_io_ren_T_1[4] : read_en_60; // @[BankedDataArray.scala 561:103 369:25 565:27]
  assign data_banks_7_4_io_raddr = io_cacheOp_req_dup_7_valid & _T_460 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_60}; // @[BankedDataArray.scala 561:103 370:27 566:29]
  assign data_banks_7_5_clock = clock;
  assign data_banks_7_5_io_wen = io_cacheOp_req_dup_9_valid & _T_464 ? _data_banks_0_0_io_ren_T_1[5] :
    io_write_dup_7_valid & io_write_bits_wmask[7] & io_write_dup_7_bits_way_en[5]; // @[BankedDataArray.scala 581:102 440:25 585:27]
  assign data_banks_7_5_io_waddr = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_7}; // @[BankedDataArray.scala 581:102 441:27 586:29]
  assign data_banks_7_5_io_wdata = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_write_data_vec_7 :
    io_write_bits_data_7; // @[BankedDataArray.scala 581:102 442:27 587:29]
  assign data_banks_7_5_io_ren = io_cacheOp_req_dup_7_valid & _T_460 ? _data_banks_0_0_io_ren_T_1[5] : read_en_61; // @[BankedDataArray.scala 561:103 369:25 565:27]
  assign data_banks_7_5_io_raddr = io_cacheOp_req_dup_7_valid & _T_460 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_61}; // @[BankedDataArray.scala 561:103 370:27 566:29]
  assign data_banks_7_6_clock = clock;
  assign data_banks_7_6_io_wen = io_cacheOp_req_dup_9_valid & _T_464 ? _data_banks_0_0_io_ren_T_1[6] :
    io_write_dup_7_valid & io_write_bits_wmask[7] & io_write_dup_7_bits_way_en[6]; // @[BankedDataArray.scala 581:102 440:25 585:27]
  assign data_banks_7_6_io_waddr = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_7}; // @[BankedDataArray.scala 581:102 441:27 586:29]
  assign data_banks_7_6_io_wdata = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_write_data_vec_7 :
    io_write_bits_data_7; // @[BankedDataArray.scala 581:102 442:27 587:29]
  assign data_banks_7_6_io_ren = io_cacheOp_req_dup_7_valid & _T_460 ? _data_banks_0_0_io_ren_T_1[6] : read_en_62; // @[BankedDataArray.scala 561:103 369:25 565:27]
  assign data_banks_7_6_io_raddr = io_cacheOp_req_dup_7_valid & _T_460 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_62}; // @[BankedDataArray.scala 561:103 370:27 566:29]
  assign data_banks_7_7_clock = clock;
  assign data_banks_7_7_io_wen = io_cacheOp_req_dup_9_valid & _T_464 ? _data_banks_0_0_io_ren_T_1[7] :
    io_write_dup_7_valid & io_write_bits_wmask[7] & io_write_dup_7_bits_way_en[7]; // @[BankedDataArray.scala 581:102 440:25 585:27]
  assign data_banks_7_7_io_waddr = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_waddr_dup_7}; // @[BankedDataArray.scala 581:102 441:27 586:29]
  assign data_banks_7_7_io_wdata = io_cacheOp_req_dup_9_valid & _T_464 ? io_cacheOp_req_bits_write_data_vec_7 :
    io_write_bits_data_7; // @[BankedDataArray.scala 581:102 442:27 587:29]
  assign data_banks_7_7_io_ren = io_cacheOp_req_dup_7_valid & _T_460 ? _data_banks_0_0_io_ren_T_1[7] : read_en_63; // @[BankedDataArray.scala 561:103 369:25 565:27]
  assign data_banks_7_7_io_raddr = io_cacheOp_req_dup_7_valid & _T_460 ? io_cacheOp_req_bits_index : {{58'd0},
    sram_set_addr_63}; // @[BankedDataArray.scala 561:103 370:27 566:29]
  assign ecc_banks_0_0_clock = clock;
  assign ecc_banks_0_0_io_rreq_valid = io_cacheOp_req_dup_0_valid & _T_446 | read_en; // @[BankedDataArray.scala 478:106 372:31 482:33]
  assign ecc_banks_0_0_io_rreq_bits_setIdx = _GEN_1844[5:0];
  assign ecc_banks_0_0_io_wreq_valid = io_cacheOp_req_dup_2_valid & _T_450 ? _data_banks_0_0_io_ren_T_1[0] :
    ecc_banks_0_0_io_wreq_valid_REG; // @[BankedDataArray.scala 499:105 445:31 503:33]
  assign ecc_banks_0_0_io_wreq_bits_setIdx = _GEN_1898[5:0];
  assign ecc_banks_0_0_io_wreq_bits_data_0 = _GEN_1899[7:0];
  assign ecc_banks_0_1_clock = clock;
  assign ecc_banks_0_1_io_rreq_valid = io_cacheOp_req_dup_0_valid & _T_446 | read_en_1; // @[BankedDataArray.scala 478:106 372:31 482:33]
  assign ecc_banks_0_1_io_rreq_bits_setIdx = _GEN_1846[5:0];
  assign ecc_banks_0_1_io_wreq_valid = io_cacheOp_req_dup_2_valid & _T_450 ? _data_banks_0_0_io_ren_T_1[1] :
    ecc_banks_0_1_io_wreq_valid_REG; // @[BankedDataArray.scala 499:105 445:31 503:33]
  assign ecc_banks_0_1_io_wreq_bits_setIdx = _GEN_1901[5:0];
  assign ecc_banks_0_1_io_wreq_bits_data_0 = _GEN_1902[7:0];
  assign ecc_banks_0_2_clock = clock;
  assign ecc_banks_0_2_io_rreq_valid = io_cacheOp_req_dup_0_valid & _T_446 | read_en_2; // @[BankedDataArray.scala 478:106 372:31 482:33]
  assign ecc_banks_0_2_io_rreq_bits_setIdx = _GEN_1848[5:0];
  assign ecc_banks_0_2_io_wreq_valid = io_cacheOp_req_dup_2_valid & _T_450 ? _data_banks_0_0_io_ren_T_1[2] :
    ecc_banks_0_2_io_wreq_valid_REG; // @[BankedDataArray.scala 499:105 445:31 503:33]
  assign ecc_banks_0_2_io_wreq_bits_setIdx = _GEN_1904[5:0];
  assign ecc_banks_0_2_io_wreq_bits_data_0 = _GEN_1905[7:0];
  assign ecc_banks_0_3_clock = clock;
  assign ecc_banks_0_3_io_rreq_valid = io_cacheOp_req_dup_0_valid & _T_446 | read_en_3; // @[BankedDataArray.scala 478:106 372:31 482:33]
  assign ecc_banks_0_3_io_rreq_bits_setIdx = _GEN_1850[5:0];
  assign ecc_banks_0_3_io_wreq_valid = io_cacheOp_req_dup_2_valid & _T_450 ? _data_banks_0_0_io_ren_T_1[3] :
    ecc_banks_0_3_io_wreq_valid_REG; // @[BankedDataArray.scala 499:105 445:31 503:33]
  assign ecc_banks_0_3_io_wreq_bits_setIdx = _GEN_1907[5:0];
  assign ecc_banks_0_3_io_wreq_bits_data_0 = _GEN_1908[7:0];
  assign ecc_banks_0_4_clock = clock;
  assign ecc_banks_0_4_io_rreq_valid = io_cacheOp_req_dup_0_valid & _T_446 | read_en_4; // @[BankedDataArray.scala 478:106 372:31 482:33]
  assign ecc_banks_0_4_io_rreq_bits_setIdx = _GEN_1852[5:0];
  assign ecc_banks_0_4_io_wreq_valid = io_cacheOp_req_dup_2_valid & _T_450 ? _data_banks_0_0_io_ren_T_1[4] :
    ecc_banks_0_4_io_wreq_valid_REG; // @[BankedDataArray.scala 499:105 445:31 503:33]
  assign ecc_banks_0_4_io_wreq_bits_setIdx = _GEN_1910[5:0];
  assign ecc_banks_0_4_io_wreq_bits_data_0 = _GEN_1911[7:0];
  assign ecc_banks_0_5_clock = clock;
  assign ecc_banks_0_5_io_rreq_valid = io_cacheOp_req_dup_0_valid & _T_446 | read_en_5; // @[BankedDataArray.scala 478:106 372:31 482:33]
  assign ecc_banks_0_5_io_rreq_bits_setIdx = _GEN_1854[5:0];
  assign ecc_banks_0_5_io_wreq_valid = io_cacheOp_req_dup_2_valid & _T_450 ? _data_banks_0_0_io_ren_T_1[5] :
    ecc_banks_0_5_io_wreq_valid_REG; // @[BankedDataArray.scala 499:105 445:31 503:33]
  assign ecc_banks_0_5_io_wreq_bits_setIdx = _GEN_1913[5:0];
  assign ecc_banks_0_5_io_wreq_bits_data_0 = _GEN_1914[7:0];
  assign ecc_banks_0_6_clock = clock;
  assign ecc_banks_0_6_io_rreq_valid = io_cacheOp_req_dup_0_valid & _T_446 | read_en_6; // @[BankedDataArray.scala 478:106 372:31 482:33]
  assign ecc_banks_0_6_io_rreq_bits_setIdx = _GEN_1856[5:0];
  assign ecc_banks_0_6_io_wreq_valid = io_cacheOp_req_dup_2_valid & _T_450 ? _data_banks_0_0_io_ren_T_1[6] :
    ecc_banks_0_6_io_wreq_valid_REG; // @[BankedDataArray.scala 499:105 445:31 503:33]
  assign ecc_banks_0_6_io_wreq_bits_setIdx = _GEN_1916[5:0];
  assign ecc_banks_0_6_io_wreq_bits_data_0 = _GEN_1917[7:0];
  assign ecc_banks_0_7_clock = clock;
  assign ecc_banks_0_7_io_rreq_valid = io_cacheOp_req_dup_0_valid & _T_446 | read_en_7; // @[BankedDataArray.scala 478:106 372:31 482:33]
  assign ecc_banks_0_7_io_rreq_bits_setIdx = _GEN_1858[5:0];
  assign ecc_banks_0_7_io_wreq_valid = io_cacheOp_req_dup_2_valid & _T_450 ? _data_banks_0_0_io_ren_T_1[7] :
    ecc_banks_0_7_io_wreq_valid_REG; // @[BankedDataArray.scala 499:105 445:31 503:33]
  assign ecc_banks_0_7_io_wreq_bits_setIdx = _GEN_1919[5:0];
  assign ecc_banks_0_7_io_wreq_bits_data_0 = _GEN_1920[7:0];
  assign ecc_banks_1_0_clock = clock;
  assign ecc_banks_1_0_io_rreq_valid = io_cacheOp_req_dup_0_valid & _T_446 | read_en_8; // @[BankedDataArray.scala 478:106 372:31 482:33]
  assign ecc_banks_1_0_io_rreq_bits_setIdx = _GEN_1860[5:0];
  assign ecc_banks_1_0_io_wreq_valid = io_cacheOp_req_dup_2_valid & _T_450 ? _data_banks_0_0_io_ren_T_1[0] :
    ecc_banks_1_0_io_wreq_valid_REG; // @[BankedDataArray.scala 499:105 445:31 503:33]
  assign ecc_banks_1_0_io_wreq_bits_setIdx = _GEN_1922[5:0];
  assign ecc_banks_1_0_io_wreq_bits_data_0 = _GEN_1923[7:0];
  assign ecc_banks_1_1_clock = clock;
  assign ecc_banks_1_1_io_rreq_valid = io_cacheOp_req_dup_0_valid & _T_446 | read_en_9; // @[BankedDataArray.scala 478:106 372:31 482:33]
  assign ecc_banks_1_1_io_rreq_bits_setIdx = _GEN_1862[5:0];
  assign ecc_banks_1_1_io_wreq_valid = io_cacheOp_req_dup_2_valid & _T_450 ? _data_banks_0_0_io_ren_T_1[1] :
    ecc_banks_1_1_io_wreq_valid_REG; // @[BankedDataArray.scala 499:105 445:31 503:33]
  assign ecc_banks_1_1_io_wreq_bits_setIdx = _GEN_1925[5:0];
  assign ecc_banks_1_1_io_wreq_bits_data_0 = _GEN_1926[7:0];
  assign ecc_banks_1_2_clock = clock;
  assign ecc_banks_1_2_io_rreq_valid = io_cacheOp_req_dup_0_valid & _T_446 | read_en_10; // @[BankedDataArray.scala 478:106 372:31 482:33]
  assign ecc_banks_1_2_io_rreq_bits_setIdx = _GEN_1864[5:0];
  assign ecc_banks_1_2_io_wreq_valid = io_cacheOp_req_dup_2_valid & _T_450 ? _data_banks_0_0_io_ren_T_1[2] :
    ecc_banks_1_2_io_wreq_valid_REG; // @[BankedDataArray.scala 499:105 445:31 503:33]
  assign ecc_banks_1_2_io_wreq_bits_setIdx = _GEN_1928[5:0];
  assign ecc_banks_1_2_io_wreq_bits_data_0 = _GEN_1929[7:0];
  assign ecc_banks_1_3_clock = clock;
  assign ecc_banks_1_3_io_rreq_valid = io_cacheOp_req_dup_0_valid & _T_446 | read_en_11; // @[BankedDataArray.scala 478:106 372:31 482:33]
  assign ecc_banks_1_3_io_rreq_bits_setIdx = _GEN_1866[5:0];
  assign ecc_banks_1_3_io_wreq_valid = io_cacheOp_req_dup_2_valid & _T_450 ? _data_banks_0_0_io_ren_T_1[3] :
    ecc_banks_1_3_io_wreq_valid_REG; // @[BankedDataArray.scala 499:105 445:31 503:33]
  assign ecc_banks_1_3_io_wreq_bits_setIdx = _GEN_1931[5:0];
  assign ecc_banks_1_3_io_wreq_bits_data_0 = _GEN_1932[7:0];
  assign ecc_banks_1_4_clock = clock;
  assign ecc_banks_1_4_io_rreq_valid = io_cacheOp_req_dup_0_valid & _T_446 | read_en_12; // @[BankedDataArray.scala 478:106 372:31 482:33]
  assign ecc_banks_1_4_io_rreq_bits_setIdx = _GEN_1868[5:0];
  assign ecc_banks_1_4_io_wreq_valid = io_cacheOp_req_dup_2_valid & _T_450 ? _data_banks_0_0_io_ren_T_1[4] :
    ecc_banks_1_4_io_wreq_valid_REG; // @[BankedDataArray.scala 499:105 445:31 503:33]
  assign ecc_banks_1_4_io_wreq_bits_setIdx = _GEN_1934[5:0];
  assign ecc_banks_1_4_io_wreq_bits_data_0 = _GEN_1935[7:0];
  assign ecc_banks_1_5_clock = clock;
  assign ecc_banks_1_5_io_rreq_valid = io_cacheOp_req_dup_0_valid & _T_446 | read_en_13; // @[BankedDataArray.scala 478:106 372:31 482:33]
  assign ecc_banks_1_5_io_rreq_bits_setIdx = _GEN_1870[5:0];
  assign ecc_banks_1_5_io_wreq_valid = io_cacheOp_req_dup_2_valid & _T_450 ? _data_banks_0_0_io_ren_T_1[5] :
    ecc_banks_1_5_io_wreq_valid_REG; // @[BankedDataArray.scala 499:105 445:31 503:33]
  assign ecc_banks_1_5_io_wreq_bits_setIdx = _GEN_1937[5:0];
  assign ecc_banks_1_5_io_wreq_bits_data_0 = _GEN_1938[7:0];
  assign ecc_banks_1_6_clock = clock;
  assign ecc_banks_1_6_io_rreq_valid = io_cacheOp_req_dup_0_valid & _T_446 | read_en_14; // @[BankedDataArray.scala 478:106 372:31 482:33]
  assign ecc_banks_1_6_io_rreq_bits_setIdx = _GEN_1872[5:0];
  assign ecc_banks_1_6_io_wreq_valid = io_cacheOp_req_dup_2_valid & _T_450 ? _data_banks_0_0_io_ren_T_1[6] :
    ecc_banks_1_6_io_wreq_valid_REG; // @[BankedDataArray.scala 499:105 445:31 503:33]
  assign ecc_banks_1_6_io_wreq_bits_setIdx = _GEN_1940[5:0];
  assign ecc_banks_1_6_io_wreq_bits_data_0 = _GEN_1941[7:0];
  assign ecc_banks_1_7_clock = clock;
  assign ecc_banks_1_7_io_rreq_valid = io_cacheOp_req_dup_0_valid & _T_446 | read_en_15; // @[BankedDataArray.scala 478:106 372:31 482:33]
  assign ecc_banks_1_7_io_rreq_bits_setIdx = _GEN_1874[5:0];
  assign ecc_banks_1_7_io_wreq_valid = io_cacheOp_req_dup_2_valid & _T_450 ? _data_banks_0_0_io_ren_T_1[7] :
    ecc_banks_1_7_io_wreq_valid_REG; // @[BankedDataArray.scala 499:105 445:31 503:33]
  assign ecc_banks_1_7_io_wreq_bits_setIdx = _GEN_1943[5:0];
  assign ecc_banks_1_7_io_wreq_bits_data_0 = _GEN_1944[7:0];
  assign ecc_banks_2_0_clock = clock;
  assign ecc_banks_2_0_io_rreq_valid = io_cacheOp_req_dup_4_valid & _T_454 | read_en_16; // @[BankedDataArray.scala 525:106 372:31 529:33]
  assign ecc_banks_2_0_io_rreq_bits_setIdx = _GEN_1980[5:0];
  assign ecc_banks_2_0_io_wreq_valid = io_cacheOp_req_dup_6_valid & _T_458 ? _data_banks_0_0_io_ren_T_1[0] :
    ecc_banks_2_0_io_wreq_valid_REG; // @[BankedDataArray.scala 546:105 445:31 550:33]
  assign ecc_banks_2_0_io_wreq_bits_setIdx = _GEN_2034[5:0];
  assign ecc_banks_2_0_io_wreq_bits_data_0 = _GEN_2035[7:0];
  assign ecc_banks_2_1_clock = clock;
  assign ecc_banks_2_1_io_rreq_valid = io_cacheOp_req_dup_4_valid & _T_454 | read_en_17; // @[BankedDataArray.scala 525:106 372:31 529:33]
  assign ecc_banks_2_1_io_rreq_bits_setIdx = _GEN_1982[5:0];
  assign ecc_banks_2_1_io_wreq_valid = io_cacheOp_req_dup_6_valid & _T_458 ? _data_banks_0_0_io_ren_T_1[1] :
    ecc_banks_2_1_io_wreq_valid_REG; // @[BankedDataArray.scala 546:105 445:31 550:33]
  assign ecc_banks_2_1_io_wreq_bits_setIdx = _GEN_2037[5:0];
  assign ecc_banks_2_1_io_wreq_bits_data_0 = _GEN_2038[7:0];
  assign ecc_banks_2_2_clock = clock;
  assign ecc_banks_2_2_io_rreq_valid = io_cacheOp_req_dup_4_valid & _T_454 | read_en_18; // @[BankedDataArray.scala 525:106 372:31 529:33]
  assign ecc_banks_2_2_io_rreq_bits_setIdx = _GEN_1984[5:0];
  assign ecc_banks_2_2_io_wreq_valid = io_cacheOp_req_dup_6_valid & _T_458 ? _data_banks_0_0_io_ren_T_1[2] :
    ecc_banks_2_2_io_wreq_valid_REG; // @[BankedDataArray.scala 546:105 445:31 550:33]
  assign ecc_banks_2_2_io_wreq_bits_setIdx = _GEN_2040[5:0];
  assign ecc_banks_2_2_io_wreq_bits_data_0 = _GEN_2041[7:0];
  assign ecc_banks_2_3_clock = clock;
  assign ecc_banks_2_3_io_rreq_valid = io_cacheOp_req_dup_4_valid & _T_454 | read_en_19; // @[BankedDataArray.scala 525:106 372:31 529:33]
  assign ecc_banks_2_3_io_rreq_bits_setIdx = _GEN_1986[5:0];
  assign ecc_banks_2_3_io_wreq_valid = io_cacheOp_req_dup_6_valid & _T_458 ? _data_banks_0_0_io_ren_T_1[3] :
    ecc_banks_2_3_io_wreq_valid_REG; // @[BankedDataArray.scala 546:105 445:31 550:33]
  assign ecc_banks_2_3_io_wreq_bits_setIdx = _GEN_2043[5:0];
  assign ecc_banks_2_3_io_wreq_bits_data_0 = _GEN_2044[7:0];
  assign ecc_banks_2_4_clock = clock;
  assign ecc_banks_2_4_io_rreq_valid = io_cacheOp_req_dup_4_valid & _T_454 | read_en_20; // @[BankedDataArray.scala 525:106 372:31 529:33]
  assign ecc_banks_2_4_io_rreq_bits_setIdx = _GEN_1988[5:0];
  assign ecc_banks_2_4_io_wreq_valid = io_cacheOp_req_dup_6_valid & _T_458 ? _data_banks_0_0_io_ren_T_1[4] :
    ecc_banks_2_4_io_wreq_valid_REG; // @[BankedDataArray.scala 546:105 445:31 550:33]
  assign ecc_banks_2_4_io_wreq_bits_setIdx = _GEN_2046[5:0];
  assign ecc_banks_2_4_io_wreq_bits_data_0 = _GEN_2047[7:0];
  assign ecc_banks_2_5_clock = clock;
  assign ecc_banks_2_5_io_rreq_valid = io_cacheOp_req_dup_4_valid & _T_454 | read_en_21; // @[BankedDataArray.scala 525:106 372:31 529:33]
  assign ecc_banks_2_5_io_rreq_bits_setIdx = _GEN_1990[5:0];
  assign ecc_banks_2_5_io_wreq_valid = io_cacheOp_req_dup_6_valid & _T_458 ? _data_banks_0_0_io_ren_T_1[5] :
    ecc_banks_2_5_io_wreq_valid_REG; // @[BankedDataArray.scala 546:105 445:31 550:33]
  assign ecc_banks_2_5_io_wreq_bits_setIdx = _GEN_2049[5:0];
  assign ecc_banks_2_5_io_wreq_bits_data_0 = _GEN_2050[7:0];
  assign ecc_banks_2_6_clock = clock;
  assign ecc_banks_2_6_io_rreq_valid = io_cacheOp_req_dup_4_valid & _T_454 | read_en_22; // @[BankedDataArray.scala 525:106 372:31 529:33]
  assign ecc_banks_2_6_io_rreq_bits_setIdx = _GEN_1992[5:0];
  assign ecc_banks_2_6_io_wreq_valid = io_cacheOp_req_dup_6_valid & _T_458 ? _data_banks_0_0_io_ren_T_1[6] :
    ecc_banks_2_6_io_wreq_valid_REG; // @[BankedDataArray.scala 546:105 445:31 550:33]
  assign ecc_banks_2_6_io_wreq_bits_setIdx = _GEN_2052[5:0];
  assign ecc_banks_2_6_io_wreq_bits_data_0 = _GEN_2053[7:0];
  assign ecc_banks_2_7_clock = clock;
  assign ecc_banks_2_7_io_rreq_valid = io_cacheOp_req_dup_4_valid & _T_454 | read_en_23; // @[BankedDataArray.scala 525:106 372:31 529:33]
  assign ecc_banks_2_7_io_rreq_bits_setIdx = _GEN_1994[5:0];
  assign ecc_banks_2_7_io_wreq_valid = io_cacheOp_req_dup_6_valid & _T_458 ? _data_banks_0_0_io_ren_T_1[7] :
    ecc_banks_2_7_io_wreq_valid_REG; // @[BankedDataArray.scala 546:105 445:31 550:33]
  assign ecc_banks_2_7_io_wreq_bits_setIdx = _GEN_2055[5:0];
  assign ecc_banks_2_7_io_wreq_bits_data_0 = _GEN_2056[7:0];
  assign ecc_banks_3_0_clock = clock;
  assign ecc_banks_3_0_io_rreq_valid = io_cacheOp_req_dup_4_valid & _T_454 | read_en_24; // @[BankedDataArray.scala 525:106 372:31 529:33]
  assign ecc_banks_3_0_io_rreq_bits_setIdx = _GEN_1996[5:0];
  assign ecc_banks_3_0_io_wreq_valid = io_cacheOp_req_dup_6_valid & _T_458 ? _data_banks_0_0_io_ren_T_1[0] :
    ecc_banks_3_0_io_wreq_valid_REG; // @[BankedDataArray.scala 546:105 445:31 550:33]
  assign ecc_banks_3_0_io_wreq_bits_setIdx = _GEN_2058[5:0];
  assign ecc_banks_3_0_io_wreq_bits_data_0 = _GEN_2059[7:0];
  assign ecc_banks_3_1_clock = clock;
  assign ecc_banks_3_1_io_rreq_valid = io_cacheOp_req_dup_4_valid & _T_454 | read_en_25; // @[BankedDataArray.scala 525:106 372:31 529:33]
  assign ecc_banks_3_1_io_rreq_bits_setIdx = _GEN_1998[5:0];
  assign ecc_banks_3_1_io_wreq_valid = io_cacheOp_req_dup_6_valid & _T_458 ? _data_banks_0_0_io_ren_T_1[1] :
    ecc_banks_3_1_io_wreq_valid_REG; // @[BankedDataArray.scala 546:105 445:31 550:33]
  assign ecc_banks_3_1_io_wreq_bits_setIdx = _GEN_2061[5:0];
  assign ecc_banks_3_1_io_wreq_bits_data_0 = _GEN_2062[7:0];
  assign ecc_banks_3_2_clock = clock;
  assign ecc_banks_3_2_io_rreq_valid = io_cacheOp_req_dup_4_valid & _T_454 | read_en_26; // @[BankedDataArray.scala 525:106 372:31 529:33]
  assign ecc_banks_3_2_io_rreq_bits_setIdx = _GEN_2000[5:0];
  assign ecc_banks_3_2_io_wreq_valid = io_cacheOp_req_dup_6_valid & _T_458 ? _data_banks_0_0_io_ren_T_1[2] :
    ecc_banks_3_2_io_wreq_valid_REG; // @[BankedDataArray.scala 546:105 445:31 550:33]
  assign ecc_banks_3_2_io_wreq_bits_setIdx = _GEN_2064[5:0];
  assign ecc_banks_3_2_io_wreq_bits_data_0 = _GEN_2065[7:0];
  assign ecc_banks_3_3_clock = clock;
  assign ecc_banks_3_3_io_rreq_valid = io_cacheOp_req_dup_4_valid & _T_454 | read_en_27; // @[BankedDataArray.scala 525:106 372:31 529:33]
  assign ecc_banks_3_3_io_rreq_bits_setIdx = _GEN_2002[5:0];
  assign ecc_banks_3_3_io_wreq_valid = io_cacheOp_req_dup_6_valid & _T_458 ? _data_banks_0_0_io_ren_T_1[3] :
    ecc_banks_3_3_io_wreq_valid_REG; // @[BankedDataArray.scala 546:105 445:31 550:33]
  assign ecc_banks_3_3_io_wreq_bits_setIdx = _GEN_2067[5:0];
  assign ecc_banks_3_3_io_wreq_bits_data_0 = _GEN_2068[7:0];
  assign ecc_banks_3_4_clock = clock;
  assign ecc_banks_3_4_io_rreq_valid = io_cacheOp_req_dup_4_valid & _T_454 | read_en_28; // @[BankedDataArray.scala 525:106 372:31 529:33]
  assign ecc_banks_3_4_io_rreq_bits_setIdx = _GEN_2004[5:0];
  assign ecc_banks_3_4_io_wreq_valid = io_cacheOp_req_dup_6_valid & _T_458 ? _data_banks_0_0_io_ren_T_1[4] :
    ecc_banks_3_4_io_wreq_valid_REG; // @[BankedDataArray.scala 546:105 445:31 550:33]
  assign ecc_banks_3_4_io_wreq_bits_setIdx = _GEN_2070[5:0];
  assign ecc_banks_3_4_io_wreq_bits_data_0 = _GEN_2071[7:0];
  assign ecc_banks_3_5_clock = clock;
  assign ecc_banks_3_5_io_rreq_valid = io_cacheOp_req_dup_4_valid & _T_454 | read_en_29; // @[BankedDataArray.scala 525:106 372:31 529:33]
  assign ecc_banks_3_5_io_rreq_bits_setIdx = _GEN_2006[5:0];
  assign ecc_banks_3_5_io_wreq_valid = io_cacheOp_req_dup_6_valid & _T_458 ? _data_banks_0_0_io_ren_T_1[5] :
    ecc_banks_3_5_io_wreq_valid_REG; // @[BankedDataArray.scala 546:105 445:31 550:33]
  assign ecc_banks_3_5_io_wreq_bits_setIdx = _GEN_2073[5:0];
  assign ecc_banks_3_5_io_wreq_bits_data_0 = _GEN_2074[7:0];
  assign ecc_banks_3_6_clock = clock;
  assign ecc_banks_3_6_io_rreq_valid = io_cacheOp_req_dup_4_valid & _T_454 | read_en_30; // @[BankedDataArray.scala 525:106 372:31 529:33]
  assign ecc_banks_3_6_io_rreq_bits_setIdx = _GEN_2008[5:0];
  assign ecc_banks_3_6_io_wreq_valid = io_cacheOp_req_dup_6_valid & _T_458 ? _data_banks_0_0_io_ren_T_1[6] :
    ecc_banks_3_6_io_wreq_valid_REG; // @[BankedDataArray.scala 546:105 445:31 550:33]
  assign ecc_banks_3_6_io_wreq_bits_setIdx = _GEN_2076[5:0];
  assign ecc_banks_3_6_io_wreq_bits_data_0 = _GEN_2077[7:0];
  assign ecc_banks_3_7_clock = clock;
  assign ecc_banks_3_7_io_rreq_valid = io_cacheOp_req_dup_4_valid & _T_454 | read_en_31; // @[BankedDataArray.scala 525:106 372:31 529:33]
  assign ecc_banks_3_7_io_rreq_bits_setIdx = _GEN_2010[5:0];
  assign ecc_banks_3_7_io_wreq_valid = io_cacheOp_req_dup_6_valid & _T_458 ? _data_banks_0_0_io_ren_T_1[7] :
    ecc_banks_3_7_io_wreq_valid_REG; // @[BankedDataArray.scala 546:105 445:31 550:33]
  assign ecc_banks_3_7_io_wreq_bits_setIdx = _GEN_2079[5:0];
  assign ecc_banks_3_7_io_wreq_bits_data_0 = _GEN_2080[7:0];
  assign ecc_banks_4_0_clock = clock;
  assign ecc_banks_4_0_io_rreq_valid = io_cacheOp_req_dup_8_valid & _T_462 | read_en_32; // @[BankedDataArray.scala 571:106 372:31 575:33]
  assign ecc_banks_4_0_io_rreq_bits_setIdx = _GEN_2148[5:0];
  assign ecc_banks_4_0_io_wreq_valid = io_cacheOp_req_dup_10_valid & _T_466 ? _data_banks_0_0_io_ren_T_1[0] :
    ecc_banks_4_0_io_wreq_valid_REG; // @[BankedDataArray.scala 592:107 445:31 596:33]
  assign ecc_banks_4_0_io_wreq_bits_setIdx = _GEN_2254[5:0];
  assign ecc_banks_4_0_io_wreq_bits_data_0 = _GEN_2255[7:0];
  assign ecc_banks_4_1_clock = clock;
  assign ecc_banks_4_1_io_rreq_valid = io_cacheOp_req_dup_8_valid & _T_462 | read_en_33; // @[BankedDataArray.scala 571:106 372:31 575:33]
  assign ecc_banks_4_1_io_rreq_bits_setIdx = _GEN_2150[5:0];
  assign ecc_banks_4_1_io_wreq_valid = io_cacheOp_req_dup_10_valid & _T_466 ? _data_banks_0_0_io_ren_T_1[1] :
    ecc_banks_4_1_io_wreq_valid_REG; // @[BankedDataArray.scala 592:107 445:31 596:33]
  assign ecc_banks_4_1_io_wreq_bits_setIdx = _GEN_2257[5:0];
  assign ecc_banks_4_1_io_wreq_bits_data_0 = _GEN_2258[7:0];
  assign ecc_banks_4_2_clock = clock;
  assign ecc_banks_4_2_io_rreq_valid = io_cacheOp_req_dup_8_valid & _T_462 | read_en_34; // @[BankedDataArray.scala 571:106 372:31 575:33]
  assign ecc_banks_4_2_io_rreq_bits_setIdx = _GEN_2152[5:0];
  assign ecc_banks_4_2_io_wreq_valid = io_cacheOp_req_dup_10_valid & _T_466 ? _data_banks_0_0_io_ren_T_1[2] :
    ecc_banks_4_2_io_wreq_valid_REG; // @[BankedDataArray.scala 592:107 445:31 596:33]
  assign ecc_banks_4_2_io_wreq_bits_setIdx = _GEN_2260[5:0];
  assign ecc_banks_4_2_io_wreq_bits_data_0 = _GEN_2261[7:0];
  assign ecc_banks_4_3_clock = clock;
  assign ecc_banks_4_3_io_rreq_valid = io_cacheOp_req_dup_8_valid & _T_462 | read_en_35; // @[BankedDataArray.scala 571:106 372:31 575:33]
  assign ecc_banks_4_3_io_rreq_bits_setIdx = _GEN_2154[5:0];
  assign ecc_banks_4_3_io_wreq_valid = io_cacheOp_req_dup_10_valid & _T_466 ? _data_banks_0_0_io_ren_T_1[3] :
    ecc_banks_4_3_io_wreq_valid_REG; // @[BankedDataArray.scala 592:107 445:31 596:33]
  assign ecc_banks_4_3_io_wreq_bits_setIdx = _GEN_2263[5:0];
  assign ecc_banks_4_3_io_wreq_bits_data_0 = _GEN_2264[7:0];
  assign ecc_banks_4_4_clock = clock;
  assign ecc_banks_4_4_io_rreq_valid = io_cacheOp_req_dup_8_valid & _T_462 | read_en_36; // @[BankedDataArray.scala 571:106 372:31 575:33]
  assign ecc_banks_4_4_io_rreq_bits_setIdx = _GEN_2156[5:0];
  assign ecc_banks_4_4_io_wreq_valid = io_cacheOp_req_dup_10_valid & _T_466 ? _data_banks_0_0_io_ren_T_1[4] :
    ecc_banks_4_4_io_wreq_valid_REG; // @[BankedDataArray.scala 592:107 445:31 596:33]
  assign ecc_banks_4_4_io_wreq_bits_setIdx = _GEN_2266[5:0];
  assign ecc_banks_4_4_io_wreq_bits_data_0 = _GEN_2267[7:0];
  assign ecc_banks_4_5_clock = clock;
  assign ecc_banks_4_5_io_rreq_valid = io_cacheOp_req_dup_8_valid & _T_462 | read_en_37; // @[BankedDataArray.scala 571:106 372:31 575:33]
  assign ecc_banks_4_5_io_rreq_bits_setIdx = _GEN_2158[5:0];
  assign ecc_banks_4_5_io_wreq_valid = io_cacheOp_req_dup_10_valid & _T_466 ? _data_banks_0_0_io_ren_T_1[5] :
    ecc_banks_4_5_io_wreq_valid_REG; // @[BankedDataArray.scala 592:107 445:31 596:33]
  assign ecc_banks_4_5_io_wreq_bits_setIdx = _GEN_2269[5:0];
  assign ecc_banks_4_5_io_wreq_bits_data_0 = _GEN_2270[7:0];
  assign ecc_banks_4_6_clock = clock;
  assign ecc_banks_4_6_io_rreq_valid = io_cacheOp_req_dup_8_valid & _T_462 | read_en_38; // @[BankedDataArray.scala 571:106 372:31 575:33]
  assign ecc_banks_4_6_io_rreq_bits_setIdx = _GEN_2160[5:0];
  assign ecc_banks_4_6_io_wreq_valid = io_cacheOp_req_dup_10_valid & _T_466 ? _data_banks_0_0_io_ren_T_1[6] :
    ecc_banks_4_6_io_wreq_valid_REG; // @[BankedDataArray.scala 592:107 445:31 596:33]
  assign ecc_banks_4_6_io_wreq_bits_setIdx = _GEN_2272[5:0];
  assign ecc_banks_4_6_io_wreq_bits_data_0 = _GEN_2273[7:0];
  assign ecc_banks_4_7_clock = clock;
  assign ecc_banks_4_7_io_rreq_valid = io_cacheOp_req_dup_8_valid & _T_462 | read_en_39; // @[BankedDataArray.scala 571:106 372:31 575:33]
  assign ecc_banks_4_7_io_rreq_bits_setIdx = _GEN_2162[5:0];
  assign ecc_banks_4_7_io_wreq_valid = io_cacheOp_req_dup_10_valid & _T_466 ? _data_banks_0_0_io_ren_T_1[7] :
    ecc_banks_4_7_io_wreq_valid_REG; // @[BankedDataArray.scala 592:107 445:31 596:33]
  assign ecc_banks_4_7_io_wreq_bits_setIdx = _GEN_2275[5:0];
  assign ecc_banks_4_7_io_wreq_bits_data_0 = _GEN_2276[7:0];
  assign ecc_banks_5_0_clock = clock;
  assign ecc_banks_5_0_io_rreq_valid = io_cacheOp_req_dup_8_valid & _T_462 | read_en_40; // @[BankedDataArray.scala 571:106 372:31 575:33]
  assign ecc_banks_5_0_io_rreq_bits_setIdx = _GEN_2164[5:0];
  assign ecc_banks_5_0_io_wreq_valid = io_cacheOp_req_dup_10_valid & _T_466 ? _data_banks_0_0_io_ren_T_1[0] :
    ecc_banks_5_0_io_wreq_valid_REG; // @[BankedDataArray.scala 592:107 445:31 596:33]
  assign ecc_banks_5_0_io_wreq_bits_setIdx = _GEN_2278[5:0];
  assign ecc_banks_5_0_io_wreq_bits_data_0 = _GEN_2279[7:0];
  assign ecc_banks_5_1_clock = clock;
  assign ecc_banks_5_1_io_rreq_valid = io_cacheOp_req_dup_8_valid & _T_462 | read_en_41; // @[BankedDataArray.scala 571:106 372:31 575:33]
  assign ecc_banks_5_1_io_rreq_bits_setIdx = _GEN_2166[5:0];
  assign ecc_banks_5_1_io_wreq_valid = io_cacheOp_req_dup_10_valid & _T_466 ? _data_banks_0_0_io_ren_T_1[1] :
    ecc_banks_5_1_io_wreq_valid_REG; // @[BankedDataArray.scala 592:107 445:31 596:33]
  assign ecc_banks_5_1_io_wreq_bits_setIdx = _GEN_2281[5:0];
  assign ecc_banks_5_1_io_wreq_bits_data_0 = _GEN_2282[7:0];
  assign ecc_banks_5_2_clock = clock;
  assign ecc_banks_5_2_io_rreq_valid = io_cacheOp_req_dup_8_valid & _T_462 | read_en_42; // @[BankedDataArray.scala 571:106 372:31 575:33]
  assign ecc_banks_5_2_io_rreq_bits_setIdx = _GEN_2168[5:0];
  assign ecc_banks_5_2_io_wreq_valid = io_cacheOp_req_dup_10_valid & _T_466 ? _data_banks_0_0_io_ren_T_1[2] :
    ecc_banks_5_2_io_wreq_valid_REG; // @[BankedDataArray.scala 592:107 445:31 596:33]
  assign ecc_banks_5_2_io_wreq_bits_setIdx = _GEN_2284[5:0];
  assign ecc_banks_5_2_io_wreq_bits_data_0 = _GEN_2285[7:0];
  assign ecc_banks_5_3_clock = clock;
  assign ecc_banks_5_3_io_rreq_valid = io_cacheOp_req_dup_8_valid & _T_462 | read_en_43; // @[BankedDataArray.scala 571:106 372:31 575:33]
  assign ecc_banks_5_3_io_rreq_bits_setIdx = _GEN_2170[5:0];
  assign ecc_banks_5_3_io_wreq_valid = io_cacheOp_req_dup_10_valid & _T_466 ? _data_banks_0_0_io_ren_T_1[3] :
    ecc_banks_5_3_io_wreq_valid_REG; // @[BankedDataArray.scala 592:107 445:31 596:33]
  assign ecc_banks_5_3_io_wreq_bits_setIdx = _GEN_2287[5:0];
  assign ecc_banks_5_3_io_wreq_bits_data_0 = _GEN_2288[7:0];
  assign ecc_banks_5_4_clock = clock;
  assign ecc_banks_5_4_io_rreq_valid = io_cacheOp_req_dup_8_valid & _T_462 | read_en_44; // @[BankedDataArray.scala 571:106 372:31 575:33]
  assign ecc_banks_5_4_io_rreq_bits_setIdx = _GEN_2172[5:0];
  assign ecc_banks_5_4_io_wreq_valid = io_cacheOp_req_dup_10_valid & _T_466 ? _data_banks_0_0_io_ren_T_1[4] :
    ecc_banks_5_4_io_wreq_valid_REG; // @[BankedDataArray.scala 592:107 445:31 596:33]
  assign ecc_banks_5_4_io_wreq_bits_setIdx = _GEN_2290[5:0];
  assign ecc_banks_5_4_io_wreq_bits_data_0 = _GEN_2291[7:0];
  assign ecc_banks_5_5_clock = clock;
  assign ecc_banks_5_5_io_rreq_valid = io_cacheOp_req_dup_8_valid & _T_462 | read_en_45; // @[BankedDataArray.scala 571:106 372:31 575:33]
  assign ecc_banks_5_5_io_rreq_bits_setIdx = _GEN_2174[5:0];
  assign ecc_banks_5_5_io_wreq_valid = io_cacheOp_req_dup_10_valid & _T_466 ? _data_banks_0_0_io_ren_T_1[5] :
    ecc_banks_5_5_io_wreq_valid_REG; // @[BankedDataArray.scala 592:107 445:31 596:33]
  assign ecc_banks_5_5_io_wreq_bits_setIdx = _GEN_2293[5:0];
  assign ecc_banks_5_5_io_wreq_bits_data_0 = _GEN_2294[7:0];
  assign ecc_banks_5_6_clock = clock;
  assign ecc_banks_5_6_io_rreq_valid = io_cacheOp_req_dup_8_valid & _T_462 | read_en_46; // @[BankedDataArray.scala 571:106 372:31 575:33]
  assign ecc_banks_5_6_io_rreq_bits_setIdx = _GEN_2176[5:0];
  assign ecc_banks_5_6_io_wreq_valid = io_cacheOp_req_dup_10_valid & _T_466 ? _data_banks_0_0_io_ren_T_1[6] :
    ecc_banks_5_6_io_wreq_valid_REG; // @[BankedDataArray.scala 592:107 445:31 596:33]
  assign ecc_banks_5_6_io_wreq_bits_setIdx = _GEN_2296[5:0];
  assign ecc_banks_5_6_io_wreq_bits_data_0 = _GEN_2297[7:0];
  assign ecc_banks_5_7_clock = clock;
  assign ecc_banks_5_7_io_rreq_valid = io_cacheOp_req_dup_8_valid & _T_462 | read_en_47; // @[BankedDataArray.scala 571:106 372:31 575:33]
  assign ecc_banks_5_7_io_rreq_bits_setIdx = _GEN_2178[5:0];
  assign ecc_banks_5_7_io_wreq_valid = io_cacheOp_req_dup_10_valid & _T_466 ? _data_banks_0_0_io_ren_T_1[7] :
    ecc_banks_5_7_io_wreq_valid_REG; // @[BankedDataArray.scala 592:107 445:31 596:33]
  assign ecc_banks_5_7_io_wreq_bits_setIdx = _GEN_2299[5:0];
  assign ecc_banks_5_7_io_wreq_bits_data_0 = _GEN_2300[7:0];
  assign ecc_banks_6_0_clock = clock;
  assign ecc_banks_6_0_io_rreq_valid = io_cacheOp_req_dup_8_valid & _T_462 | read_en_48; // @[BankedDataArray.scala 571:106 372:31 575:33]
  assign ecc_banks_6_0_io_rreq_bits_setIdx = _GEN_2180[5:0];
  assign ecc_banks_6_0_io_wreq_valid = io_cacheOp_req_dup_10_valid & _T_466 ? _data_banks_0_0_io_ren_T_1[0] :
    ecc_banks_6_0_io_wreq_valid_REG; // @[BankedDataArray.scala 592:107 445:31 596:33]
  assign ecc_banks_6_0_io_wreq_bits_setIdx = _GEN_2302[5:0];
  assign ecc_banks_6_0_io_wreq_bits_data_0 = _GEN_2303[7:0];
  assign ecc_banks_6_1_clock = clock;
  assign ecc_banks_6_1_io_rreq_valid = io_cacheOp_req_dup_8_valid & _T_462 | read_en_49; // @[BankedDataArray.scala 571:106 372:31 575:33]
  assign ecc_banks_6_1_io_rreq_bits_setIdx = _GEN_2182[5:0];
  assign ecc_banks_6_1_io_wreq_valid = io_cacheOp_req_dup_10_valid & _T_466 ? _data_banks_0_0_io_ren_T_1[1] :
    ecc_banks_6_1_io_wreq_valid_REG; // @[BankedDataArray.scala 592:107 445:31 596:33]
  assign ecc_banks_6_1_io_wreq_bits_setIdx = _GEN_2305[5:0];
  assign ecc_banks_6_1_io_wreq_bits_data_0 = _GEN_2306[7:0];
  assign ecc_banks_6_2_clock = clock;
  assign ecc_banks_6_2_io_rreq_valid = io_cacheOp_req_dup_8_valid & _T_462 | read_en_50; // @[BankedDataArray.scala 571:106 372:31 575:33]
  assign ecc_banks_6_2_io_rreq_bits_setIdx = _GEN_2184[5:0];
  assign ecc_banks_6_2_io_wreq_valid = io_cacheOp_req_dup_10_valid & _T_466 ? _data_banks_0_0_io_ren_T_1[2] :
    ecc_banks_6_2_io_wreq_valid_REG; // @[BankedDataArray.scala 592:107 445:31 596:33]
  assign ecc_banks_6_2_io_wreq_bits_setIdx = _GEN_2308[5:0];
  assign ecc_banks_6_2_io_wreq_bits_data_0 = _GEN_2309[7:0];
  assign ecc_banks_6_3_clock = clock;
  assign ecc_banks_6_3_io_rreq_valid = io_cacheOp_req_dup_8_valid & _T_462 | read_en_51; // @[BankedDataArray.scala 571:106 372:31 575:33]
  assign ecc_banks_6_3_io_rreq_bits_setIdx = _GEN_2186[5:0];
  assign ecc_banks_6_3_io_wreq_valid = io_cacheOp_req_dup_10_valid & _T_466 ? _data_banks_0_0_io_ren_T_1[3] :
    ecc_banks_6_3_io_wreq_valid_REG; // @[BankedDataArray.scala 592:107 445:31 596:33]
  assign ecc_banks_6_3_io_wreq_bits_setIdx = _GEN_2311[5:0];
  assign ecc_banks_6_3_io_wreq_bits_data_0 = _GEN_2312[7:0];
  assign ecc_banks_6_4_clock = clock;
  assign ecc_banks_6_4_io_rreq_valid = io_cacheOp_req_dup_8_valid & _T_462 | read_en_52; // @[BankedDataArray.scala 571:106 372:31 575:33]
  assign ecc_banks_6_4_io_rreq_bits_setIdx = _GEN_2188[5:0];
  assign ecc_banks_6_4_io_wreq_valid = io_cacheOp_req_dup_10_valid & _T_466 ? _data_banks_0_0_io_ren_T_1[4] :
    ecc_banks_6_4_io_wreq_valid_REG; // @[BankedDataArray.scala 592:107 445:31 596:33]
  assign ecc_banks_6_4_io_wreq_bits_setIdx = _GEN_2314[5:0];
  assign ecc_banks_6_4_io_wreq_bits_data_0 = _GEN_2315[7:0];
  assign ecc_banks_6_5_clock = clock;
  assign ecc_banks_6_5_io_rreq_valid = io_cacheOp_req_dup_8_valid & _T_462 | read_en_53; // @[BankedDataArray.scala 571:106 372:31 575:33]
  assign ecc_banks_6_5_io_rreq_bits_setIdx = _GEN_2190[5:0];
  assign ecc_banks_6_5_io_wreq_valid = io_cacheOp_req_dup_10_valid & _T_466 ? _data_banks_0_0_io_ren_T_1[5] :
    ecc_banks_6_5_io_wreq_valid_REG; // @[BankedDataArray.scala 592:107 445:31 596:33]
  assign ecc_banks_6_5_io_wreq_bits_setIdx = _GEN_2317[5:0];
  assign ecc_banks_6_5_io_wreq_bits_data_0 = _GEN_2318[7:0];
  assign ecc_banks_6_6_clock = clock;
  assign ecc_banks_6_6_io_rreq_valid = io_cacheOp_req_dup_8_valid & _T_462 | read_en_54; // @[BankedDataArray.scala 571:106 372:31 575:33]
  assign ecc_banks_6_6_io_rreq_bits_setIdx = _GEN_2192[5:0];
  assign ecc_banks_6_6_io_wreq_valid = io_cacheOp_req_dup_10_valid & _T_466 ? _data_banks_0_0_io_ren_T_1[6] :
    ecc_banks_6_6_io_wreq_valid_REG; // @[BankedDataArray.scala 592:107 445:31 596:33]
  assign ecc_banks_6_6_io_wreq_bits_setIdx = _GEN_2320[5:0];
  assign ecc_banks_6_6_io_wreq_bits_data_0 = _GEN_2321[7:0];
  assign ecc_banks_6_7_clock = clock;
  assign ecc_banks_6_7_io_rreq_valid = io_cacheOp_req_dup_8_valid & _T_462 | read_en_55; // @[BankedDataArray.scala 571:106 372:31 575:33]
  assign ecc_banks_6_7_io_rreq_bits_setIdx = _GEN_2194[5:0];
  assign ecc_banks_6_7_io_wreq_valid = io_cacheOp_req_dup_10_valid & _T_466 ? _data_banks_0_0_io_ren_T_1[7] :
    ecc_banks_6_7_io_wreq_valid_REG; // @[BankedDataArray.scala 592:107 445:31 596:33]
  assign ecc_banks_6_7_io_wreq_bits_setIdx = _GEN_2323[5:0];
  assign ecc_banks_6_7_io_wreq_bits_data_0 = _GEN_2324[7:0];
  assign ecc_banks_7_0_clock = clock;
  assign ecc_banks_7_0_io_rreq_valid = io_cacheOp_req_dup_8_valid & _T_462 | read_en_56; // @[BankedDataArray.scala 571:106 372:31 575:33]
  assign ecc_banks_7_0_io_rreq_bits_setIdx = _GEN_2196[5:0];
  assign ecc_banks_7_0_io_wreq_valid = io_cacheOp_req_dup_10_valid & _T_466 ? _data_banks_0_0_io_ren_T_1[0] :
    ecc_banks_7_0_io_wreq_valid_REG; // @[BankedDataArray.scala 592:107 445:31 596:33]
  assign ecc_banks_7_0_io_wreq_bits_setIdx = _GEN_2326[5:0];
  assign ecc_banks_7_0_io_wreq_bits_data_0 = _GEN_2327[7:0];
  assign ecc_banks_7_1_clock = clock;
  assign ecc_banks_7_1_io_rreq_valid = io_cacheOp_req_dup_8_valid & _T_462 | read_en_57; // @[BankedDataArray.scala 571:106 372:31 575:33]
  assign ecc_banks_7_1_io_rreq_bits_setIdx = _GEN_2198[5:0];
  assign ecc_banks_7_1_io_wreq_valid = io_cacheOp_req_dup_10_valid & _T_466 ? _data_banks_0_0_io_ren_T_1[1] :
    ecc_banks_7_1_io_wreq_valid_REG; // @[BankedDataArray.scala 592:107 445:31 596:33]
  assign ecc_banks_7_1_io_wreq_bits_setIdx = _GEN_2329[5:0];
  assign ecc_banks_7_1_io_wreq_bits_data_0 = _GEN_2330[7:0];
  assign ecc_banks_7_2_clock = clock;
  assign ecc_banks_7_2_io_rreq_valid = io_cacheOp_req_dup_8_valid & _T_462 | read_en_58; // @[BankedDataArray.scala 571:106 372:31 575:33]
  assign ecc_banks_7_2_io_rreq_bits_setIdx = _GEN_2200[5:0];
  assign ecc_banks_7_2_io_wreq_valid = io_cacheOp_req_dup_10_valid & _T_466 ? _data_banks_0_0_io_ren_T_1[2] :
    ecc_banks_7_2_io_wreq_valid_REG; // @[BankedDataArray.scala 592:107 445:31 596:33]
  assign ecc_banks_7_2_io_wreq_bits_setIdx = _GEN_2332[5:0];
  assign ecc_banks_7_2_io_wreq_bits_data_0 = _GEN_2333[7:0];
  assign ecc_banks_7_3_clock = clock;
  assign ecc_banks_7_3_io_rreq_valid = io_cacheOp_req_dup_8_valid & _T_462 | read_en_59; // @[BankedDataArray.scala 571:106 372:31 575:33]
  assign ecc_banks_7_3_io_rreq_bits_setIdx = _GEN_2202[5:0];
  assign ecc_banks_7_3_io_wreq_valid = io_cacheOp_req_dup_10_valid & _T_466 ? _data_banks_0_0_io_ren_T_1[3] :
    ecc_banks_7_3_io_wreq_valid_REG; // @[BankedDataArray.scala 592:107 445:31 596:33]
  assign ecc_banks_7_3_io_wreq_bits_setIdx = _GEN_2335[5:0];
  assign ecc_banks_7_3_io_wreq_bits_data_0 = _GEN_2336[7:0];
  assign ecc_banks_7_4_clock = clock;
  assign ecc_banks_7_4_io_rreq_valid = io_cacheOp_req_dup_8_valid & _T_462 | read_en_60; // @[BankedDataArray.scala 571:106 372:31 575:33]
  assign ecc_banks_7_4_io_rreq_bits_setIdx = _GEN_2204[5:0];
  assign ecc_banks_7_4_io_wreq_valid = io_cacheOp_req_dup_10_valid & _T_466 ? _data_banks_0_0_io_ren_T_1[4] :
    ecc_banks_7_4_io_wreq_valid_REG; // @[BankedDataArray.scala 592:107 445:31 596:33]
  assign ecc_banks_7_4_io_wreq_bits_setIdx = _GEN_2338[5:0];
  assign ecc_banks_7_4_io_wreq_bits_data_0 = _GEN_2339[7:0];
  assign ecc_banks_7_5_clock = clock;
  assign ecc_banks_7_5_io_rreq_valid = io_cacheOp_req_dup_8_valid & _T_462 | read_en_61; // @[BankedDataArray.scala 571:106 372:31 575:33]
  assign ecc_banks_7_5_io_rreq_bits_setIdx = _GEN_2206[5:0];
  assign ecc_banks_7_5_io_wreq_valid = io_cacheOp_req_dup_10_valid & _T_466 ? _data_banks_0_0_io_ren_T_1[5] :
    ecc_banks_7_5_io_wreq_valid_REG; // @[BankedDataArray.scala 592:107 445:31 596:33]
  assign ecc_banks_7_5_io_wreq_bits_setIdx = _GEN_2341[5:0];
  assign ecc_banks_7_5_io_wreq_bits_data_0 = _GEN_2342[7:0];
  assign ecc_banks_7_6_clock = clock;
  assign ecc_banks_7_6_io_rreq_valid = io_cacheOp_req_dup_8_valid & _T_462 | read_en_62; // @[BankedDataArray.scala 571:106 372:31 575:33]
  assign ecc_banks_7_6_io_rreq_bits_setIdx = _GEN_2208[5:0];
  assign ecc_banks_7_6_io_wreq_valid = io_cacheOp_req_dup_10_valid & _T_466 ? _data_banks_0_0_io_ren_T_1[6] :
    ecc_banks_7_6_io_wreq_valid_REG; // @[BankedDataArray.scala 592:107 445:31 596:33]
  assign ecc_banks_7_6_io_wreq_bits_setIdx = _GEN_2344[5:0];
  assign ecc_banks_7_6_io_wreq_bits_data_0 = _GEN_2345[7:0];
  assign ecc_banks_7_7_clock = clock;
  assign ecc_banks_7_7_io_rreq_valid = io_cacheOp_req_dup_8_valid & _T_462 | read_en_63; // @[BankedDataArray.scala 571:106 372:31 575:33]
  assign ecc_banks_7_7_io_rreq_bits_setIdx = _GEN_2210[5:0];
  assign ecc_banks_7_7_io_wreq_valid = io_cacheOp_req_dup_10_valid & _T_466 ? _data_banks_0_0_io_ren_T_1[7] :
    ecc_banks_7_7_io_wreq_valid_REG; // @[BankedDataArray.scala 592:107 445:31 596:33]
  assign ecc_banks_7_7_io_wreq_bits_setIdx = _GEN_2347[5:0];
  assign ecc_banks_7_7_io_wreq_bits_data_0 = _GEN_2348[7:0];
  assign writer_clock = clock; // @[ChiselDB.scala 135:21]
  assign writer_reset = reset; // @[ChiselDB.scala 136:21]
  assign writer_en = _rr_bank_conflict_T_7 != 8'h0 & io_read_0_valid & io_read_1_valid & io_read_0_bits_way_en ==
    io_read_1_bits_way_en & set_addrs_0 != set_addrs_1; // @[BankedDataArray.scala 290:160]
  assign writer_stamp = cnt; // @[ChiselDB.scala 138:21]
  assign writer_data_addr_0 = io_read_0_bits_addr; // @[BankedDataArray.scala 620:30 623:30]
  assign writer_data_addr_1 = io_read_1_bits_addr; // @[BankedDataArray.scala 620:30 623:30]
  assign writer_data_set_index_0 = io_read_0_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
  assign writer_data_set_index_1 = io_read_1_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
  assign writer_data_bank_index_0 = _GEN_2486[2:0]; // @[BankedDataArray.scala 620:30]
  assign writer_data_bank_index_1 = _GEN_2487[2:0]; // @[BankedDataArray.scala 620:30]
  assign writer_data_way_index = rr_bank_conflict_0_1 ? _io_read_resp_delayed_0_0_T_8 : 3'h0; // @[BankedDataArray.scala 627:32 632:33 639:32]
  assign writer_data_fake_rr_bank_conflict = rr_bank_conflict_0_1 & set_addrs_0 == set_addrs_1; // @[BankedDataArray.scala 627:32 633:44 640:44]
  always @(posedge clock) begin
    rwhazard <= io_write_valid; // @[BankedDataArray.scala 269:25]
    io_bank_conflict_slow_0_REG <= io_bank_conflict_fast_0; // @[BankedDataArray.scala 314:40]
    io_bank_conflict_slow_1_REG <= io_bank_conflict_fast_1; // @[BankedDataArray.scala 314:40]
    ecc_data_delayed_REG <= |_read_en_T | readline_en; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG) begin // @[Reg.scala 17:18]
      ecc_data_delayed <= ecc_data; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_1 <= |_read_en_T_2 | readline_en_1; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_1) begin // @[Reg.scala 17:18]
      ecc_data_delayed_1 <= ecc_data_1; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_2 <= |_read_en_T_4 | readline_en_2; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_2) begin // @[Reg.scala 17:18]
      ecc_data_delayed_2 <= ecc_data_2; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_3 <= |_read_en_T_6 | readline_en_3; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_3) begin // @[Reg.scala 17:18]
      ecc_data_delayed_3 <= ecc_data_3; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_4 <= |_read_en_T_8 | readline_en_4; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_4) begin // @[Reg.scala 17:18]
      ecc_data_delayed_4 <= ecc_data_4; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_5 <= |_read_en_T_10 | readline_en_5; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_5) begin // @[Reg.scala 17:18]
      ecc_data_delayed_5 <= ecc_data_5; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_6 <= |_read_en_T_12 | readline_en_6; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_6) begin // @[Reg.scala 17:18]
      ecc_data_delayed_6 <= ecc_data_6; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_7 <= |_read_en_T_14 | readline_en_7; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_7) begin // @[Reg.scala 17:18]
      ecc_data_delayed_7 <= ecc_data_7; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_8 <= |_read_en_T_16 | readline_en; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_8) begin // @[Reg.scala 17:18]
      ecc_data_delayed_8 <= ecc_data_8; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_9 <= |_read_en_T_18 | readline_en_1; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_9) begin // @[Reg.scala 17:18]
      ecc_data_delayed_9 <= ecc_data_9; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_10 <= |_read_en_T_20 | readline_en_2; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_10) begin // @[Reg.scala 17:18]
      ecc_data_delayed_10 <= ecc_data_10; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_11 <= |_read_en_T_22 | readline_en_3; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_11) begin // @[Reg.scala 17:18]
      ecc_data_delayed_11 <= ecc_data_11; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_12 <= |_read_en_T_24 | readline_en_4; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_12) begin // @[Reg.scala 17:18]
      ecc_data_delayed_12 <= ecc_data_12; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_13 <= |_read_en_T_26 | readline_en_5; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_13) begin // @[Reg.scala 17:18]
      ecc_data_delayed_13 <= ecc_data_13; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_14 <= |_read_en_T_28 | readline_en_6; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_14) begin // @[Reg.scala 17:18]
      ecc_data_delayed_14 <= ecc_data_14; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_15 <= |_read_en_T_30 | readline_en_7; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_15) begin // @[Reg.scala 17:18]
      ecc_data_delayed_15 <= ecc_data_15; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_16 <= |_read_en_T_32 | readline_en; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_16) begin // @[Reg.scala 17:18]
      ecc_data_delayed_16 <= ecc_data_16; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_17 <= |_read_en_T_34 | readline_en_1; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_17) begin // @[Reg.scala 17:18]
      ecc_data_delayed_17 <= ecc_data_17; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_18 <= |_read_en_T_36 | readline_en_2; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_18) begin // @[Reg.scala 17:18]
      ecc_data_delayed_18 <= ecc_data_18; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_19 <= |_read_en_T_38 | readline_en_3; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_19) begin // @[Reg.scala 17:18]
      ecc_data_delayed_19 <= ecc_data_19; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_20 <= |_read_en_T_40 | readline_en_4; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_20) begin // @[Reg.scala 17:18]
      ecc_data_delayed_20 <= ecc_data_20; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_21 <= |_read_en_T_42 | readline_en_5; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_21) begin // @[Reg.scala 17:18]
      ecc_data_delayed_21 <= ecc_data_21; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_22 <= |_read_en_T_44 | readline_en_6; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_22) begin // @[Reg.scala 17:18]
      ecc_data_delayed_22 <= ecc_data_22; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_23 <= |_read_en_T_46 | readline_en_7; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_23) begin // @[Reg.scala 17:18]
      ecc_data_delayed_23 <= ecc_data_23; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_24 <= |_read_en_T_48 | readline_en; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_24) begin // @[Reg.scala 17:18]
      ecc_data_delayed_24 <= ecc_data_24; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_25 <= |_read_en_T_50 | readline_en_1; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_25) begin // @[Reg.scala 17:18]
      ecc_data_delayed_25 <= ecc_data_25; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_26 <= |_read_en_T_52 | readline_en_2; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_26) begin // @[Reg.scala 17:18]
      ecc_data_delayed_26 <= ecc_data_26; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_27 <= |_read_en_T_54 | readline_en_3; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_27) begin // @[Reg.scala 17:18]
      ecc_data_delayed_27 <= ecc_data_27; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_28 <= |_read_en_T_56 | readline_en_4; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_28) begin // @[Reg.scala 17:18]
      ecc_data_delayed_28 <= ecc_data_28; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_29 <= |_read_en_T_58 | readline_en_5; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_29) begin // @[Reg.scala 17:18]
      ecc_data_delayed_29 <= ecc_data_29; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_30 <= |_read_en_T_60 | readline_en_6; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_30) begin // @[Reg.scala 17:18]
      ecc_data_delayed_30 <= ecc_data_30; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_31 <= |_read_en_T_62 | readline_en_7; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_31) begin // @[Reg.scala 17:18]
      ecc_data_delayed_31 <= ecc_data_31; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_32 <= |_read_en_T_64 | readline_en; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_32) begin // @[Reg.scala 17:18]
      ecc_data_delayed_32 <= ecc_data_32; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_33 <= |_read_en_T_66 | readline_en_1; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_33) begin // @[Reg.scala 17:18]
      ecc_data_delayed_33 <= ecc_data_33; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_34 <= |_read_en_T_68 | readline_en_2; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_34) begin // @[Reg.scala 17:18]
      ecc_data_delayed_34 <= ecc_data_34; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_35 <= |_read_en_T_70 | readline_en_3; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_35) begin // @[Reg.scala 17:18]
      ecc_data_delayed_35 <= ecc_data_35; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_36 <= |_read_en_T_72 | readline_en_4; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_36) begin // @[Reg.scala 17:18]
      ecc_data_delayed_36 <= ecc_data_36; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_37 <= |_read_en_T_74 | readline_en_5; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_37) begin // @[Reg.scala 17:18]
      ecc_data_delayed_37 <= ecc_data_37; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_38 <= |_read_en_T_76 | readline_en_6; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_38) begin // @[Reg.scala 17:18]
      ecc_data_delayed_38 <= ecc_data_38; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_39 <= |_read_en_T_78 | readline_en_7; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_39) begin // @[Reg.scala 17:18]
      ecc_data_delayed_39 <= ecc_data_39; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_40 <= |_read_en_T_80 | readline_en; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_40) begin // @[Reg.scala 17:18]
      ecc_data_delayed_40 <= ecc_data_40; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_41 <= |_read_en_T_82 | readline_en_1; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_41) begin // @[Reg.scala 17:18]
      ecc_data_delayed_41 <= ecc_data_41; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_42 <= |_read_en_T_84 | readline_en_2; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_42) begin // @[Reg.scala 17:18]
      ecc_data_delayed_42 <= ecc_data_42; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_43 <= |_read_en_T_86 | readline_en_3; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_43) begin // @[Reg.scala 17:18]
      ecc_data_delayed_43 <= ecc_data_43; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_44 <= |_read_en_T_88 | readline_en_4; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_44) begin // @[Reg.scala 17:18]
      ecc_data_delayed_44 <= ecc_data_44; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_45 <= |_read_en_T_90 | readline_en_5; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_45) begin // @[Reg.scala 17:18]
      ecc_data_delayed_45 <= ecc_data_45; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_46 <= |_read_en_T_92 | readline_en_6; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_46) begin // @[Reg.scala 17:18]
      ecc_data_delayed_46 <= ecc_data_46; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_47 <= |_read_en_T_94 | readline_en_7; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_47) begin // @[Reg.scala 17:18]
      ecc_data_delayed_47 <= ecc_data_47; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_48 <= |_read_en_T_96 | readline_en; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_48) begin // @[Reg.scala 17:18]
      ecc_data_delayed_48 <= ecc_data_48; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_49 <= |_read_en_T_98 | readline_en_1; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_49) begin // @[Reg.scala 17:18]
      ecc_data_delayed_49 <= ecc_data_49; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_50 <= |_read_en_T_100 | readline_en_2; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_50) begin // @[Reg.scala 17:18]
      ecc_data_delayed_50 <= ecc_data_50; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_51 <= |_read_en_T_102 | readline_en_3; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_51) begin // @[Reg.scala 17:18]
      ecc_data_delayed_51 <= ecc_data_51; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_52 <= |_read_en_T_104 | readline_en_4; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_52) begin // @[Reg.scala 17:18]
      ecc_data_delayed_52 <= ecc_data_52; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_53 <= |_read_en_T_106 | readline_en_5; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_53) begin // @[Reg.scala 17:18]
      ecc_data_delayed_53 <= ecc_data_53; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_54 <= |_read_en_T_108 | readline_en_6; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_54) begin // @[Reg.scala 17:18]
      ecc_data_delayed_54 <= ecc_data_54; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_55 <= |_read_en_T_110 | readline_en_7; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_55) begin // @[Reg.scala 17:18]
      ecc_data_delayed_55 <= ecc_data_55; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_56 <= |_read_en_T_112 | readline_en; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_56) begin // @[Reg.scala 17:18]
      ecc_data_delayed_56 <= ecc_data_56; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_57 <= |_read_en_T_114 | readline_en_1; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_57) begin // @[Reg.scala 17:18]
      ecc_data_delayed_57 <= ecc_data_57; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_58 <= |_read_en_T_116 | readline_en_2; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_58) begin // @[Reg.scala 17:18]
      ecc_data_delayed_58 <= ecc_data_58; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_59 <= |_read_en_T_118 | readline_en_3; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_59) begin // @[Reg.scala 17:18]
      ecc_data_delayed_59 <= ecc_data_59; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_60 <= |_read_en_T_120 | readline_en_4; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_60) begin // @[Reg.scala 17:18]
      ecc_data_delayed_60 <= ecc_data_60; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_61 <= |_read_en_T_122 | readline_en_5; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_61) begin // @[Reg.scala 17:18]
      ecc_data_delayed_61 <= ecc_data_61; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_62 <= |_read_en_T_124 | readline_en_6; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_62) begin // @[Reg.scala 17:18]
      ecc_data_delayed_62 <= ecc_data_62; // @[Reg.scala 17:22]
    end
    ecc_data_delayed_REG_63 <= |_read_en_T_126 | readline_en_7; // @[BankedDataArray.scala 366:44]
    if (ecc_data_delayed_REG_63) begin // @[Reg.scala 17:18]
      ecc_data_delayed_63 <= ecc_data_63; // @[Reg.scala 17:22]
    end
    read_result_delayed_0_0_raw_data <= read_result_0_0_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_0_1_raw_data <= read_result_0_1_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_0_2_raw_data <= read_result_0_2_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_0_3_raw_data <= read_result_0_3_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_0_4_raw_data <= read_result_0_4_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_0_5_raw_data <= read_result_0_5_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_0_6_raw_data <= read_result_0_6_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_0_7_raw_data <= read_result_0_7_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_1_0_raw_data <= read_result_1_0_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_1_1_raw_data <= read_result_1_1_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_1_2_raw_data <= read_result_1_2_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_1_3_raw_data <= read_result_1_3_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_1_4_raw_data <= read_result_1_4_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_1_5_raw_data <= read_result_1_5_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_1_6_raw_data <= read_result_1_6_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_1_7_raw_data <= read_result_1_7_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_2_0_raw_data <= read_result_2_0_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_2_1_raw_data <= read_result_2_1_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_2_2_raw_data <= read_result_2_2_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_2_3_raw_data <= read_result_2_3_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_2_4_raw_data <= read_result_2_4_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_2_5_raw_data <= read_result_2_5_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_2_6_raw_data <= read_result_2_6_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_2_7_raw_data <= read_result_2_7_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_3_0_raw_data <= read_result_3_0_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_3_1_raw_data <= read_result_3_1_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_3_2_raw_data <= read_result_3_2_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_3_3_raw_data <= read_result_3_3_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_3_4_raw_data <= read_result_3_4_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_3_5_raw_data <= read_result_3_5_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_3_6_raw_data <= read_result_3_6_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_3_7_raw_data <= read_result_3_7_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_4_0_raw_data <= read_result_4_0_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_4_1_raw_data <= read_result_4_1_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_4_2_raw_data <= read_result_4_2_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_4_3_raw_data <= read_result_4_3_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_4_4_raw_data <= read_result_4_4_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_4_5_raw_data <= read_result_4_5_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_4_6_raw_data <= read_result_4_6_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_4_7_raw_data <= read_result_4_7_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_5_0_raw_data <= read_result_5_0_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_5_1_raw_data <= read_result_5_1_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_5_2_raw_data <= read_result_5_2_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_5_3_raw_data <= read_result_5_3_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_5_4_raw_data <= read_result_5_4_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_5_5_raw_data <= read_result_5_5_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_5_6_raw_data <= read_result_5_6_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_5_7_raw_data <= read_result_5_7_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_6_0_raw_data <= read_result_6_0_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_6_1_raw_data <= read_result_6_1_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_6_2_raw_data <= read_result_6_2_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_6_3_raw_data <= read_result_6_3_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_6_4_raw_data <= read_result_6_4_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_6_5_raw_data <= read_result_6_5_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_6_6_raw_data <= read_result_6_6_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_6_7_raw_data <= read_result_6_7_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_7_0_raw_data <= read_result_7_0_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_7_1_raw_data <= read_result_7_1_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_7_2_raw_data <= read_result_7_2_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_7_3_raw_data <= read_result_7_3_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_7_4_raw_data <= read_result_7_4_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_7_5_raw_data <= read_result_7_5_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_7_6_raw_data <= read_result_7_6_raw_data; // @[BankedDataArray.scala 392:36]
    read_result_delayed_7_7_raw_data <= read_result_7_7_raw_data; // @[BankedDataArray.scala 392:36]
    io_read_resp_delayed_0_0_REG_4 <= {{1'd0}, io_read_0_bits_addr[5:3]}; // @[BankedDataArray.scala 265:24 274:32]
    io_read_resp_delayed_0_0_REG_5 <= io_read_resp_delayed_0_0_REG_4; // @[BankedDataArray.scala 401:64]
    io_read_resp_delayed_0_0_REG_6 <= {_io_read_resp_delayed_0_0_T_2,_io_read_resp_delayed_0_0_T_7}; // @[Cat.scala 31:58]
    io_read_resp_delayed_0_0_REG_7 <= io_read_resp_delayed_0_0_REG_6; // @[BankedDataArray.scala 401:100]
    io_read_resp_delayed_1_0_REG_4 <= {{1'd0}, io_read_1_bits_addr[5:3]}; // @[BankedDataArray.scala 265:24 274:32]
    io_read_resp_delayed_1_0_REG_5 <= io_read_resp_delayed_1_0_REG_4; // @[BankedDataArray.scala 401:64]
    io_read_resp_delayed_1_0_REG_6 <= {_io_read_resp_delayed_1_0_T_2,_io_read_resp_delayed_1_0_T_7}; // @[Cat.scala 31:58]
    io_read_resp_delayed_1_0_REG_7 <= io_read_resp_delayed_1_0_REG_6; // @[BankedDataArray.scala 401:100]
    io_readline_resp_0_REG <= {_io_readline_resp_0_T,_io_readline_resp_0_T_5}; // @[Cat.scala 31:58]
    io_readline_resp_1_REG <= {_io_readline_resp_0_T,_io_readline_resp_0_T_5}; // @[Cat.scala 31:58]
    io_readline_resp_2_REG <= {_io_readline_resp_0_T,_io_readline_resp_0_T_5}; // @[Cat.scala 31:58]
    io_readline_resp_3_REG <= {_io_readline_resp_0_T,_io_readline_resp_0_T_5}; // @[Cat.scala 31:58]
    io_readline_resp_4_REG <= {_io_readline_resp_0_T,_io_readline_resp_0_T_5}; // @[Cat.scala 31:58]
    io_readline_resp_5_REG <= {_io_readline_resp_0_T,_io_readline_resp_0_T_5}; // @[Cat.scala 31:58]
    io_readline_resp_6_REG <= {_io_readline_resp_0_T,_io_readline_resp_0_T_5}; // @[Cat.scala 31:58]
    io_readline_resp_7_REG <= {_io_readline_resp_0_T,_io_readline_resp_0_T_5}; // @[Cat.scala 31:58]
    io_read_error_delayed_0_0_REG_7 <= io_read_0_ready & io_read_0_valid; // @[Decoupled.scala 50:35]
    io_read_error_delayed_0_0_REG_8 <= io_read_error_delayed_0_0_REG_7; // @[BankedDataArray.scala 420:55]
    io_read_error_delayed_0_0_REG_9 <= {{1'd0}, io_read_0_bits_addr[5:3]}; // @[BankedDataArray.scala 265:24 274:32]
    io_read_error_delayed_0_0_REG_10 <= io_read_error_delayed_0_0_REG_9; // @[BankedDataArray.scala 421:42]
    io_read_error_delayed_0_0_REG_11 <= {_io_read_resp_delayed_0_0_T_2,_io_read_resp_delayed_0_0_T_7}; // @[Cat.scala 31:58]
    io_read_error_delayed_0_0_REG_12 <= io_read_error_delayed_0_0_REG_11; // @[BankedDataArray.scala 421:88]
    io_read_error_delayed_0_0_REG_13 <= io_bank_conflict_slow_0; // @[BankedDataArray.scala 422:17]
    io_read_error_delayed_1_0_REG_7 <= io_read_1_ready & io_read_1_valid; // @[Decoupled.scala 50:35]
    io_read_error_delayed_1_0_REG_8 <= io_read_error_delayed_1_0_REG_7; // @[BankedDataArray.scala 420:55]
    io_read_error_delayed_1_0_REG_9 <= {{1'd0}, io_read_1_bits_addr[5:3]}; // @[BankedDataArray.scala 265:24 274:32]
    io_read_error_delayed_1_0_REG_10 <= io_read_error_delayed_1_0_REG_9; // @[BankedDataArray.scala 421:42]
    io_read_error_delayed_1_0_REG_11 <= {_io_read_resp_delayed_1_0_T_2,_io_read_resp_delayed_1_0_T_7}; // @[Cat.scala 31:58]
    io_read_error_delayed_1_0_REG_12 <= io_read_error_delayed_1_0_REG_11; // @[BankedDataArray.scala 421:88]
    io_read_error_delayed_1_0_REG_13 <= io_bank_conflict_slow_1; // @[BankedDataArray.scala 422:17]
    io_readline_error_delayed_REG <= io_readline_ready & io_readline_valid; // @[Decoupled.scala 50:35]
    io_readline_error_delayed_REG_1 <= io_readline_error_delayed_REG; // @[BankedDataArray.scala 430:39]
    ecc_banks_0_0_io_wreq_valid_REG <= _data_banks_0_0_io_wen_T_1 & io_write_dup_0_bits_way_en[0]; // @[BankedDataArray.scala 445:108]
    x15 <= io_write_dup_0_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16 <= _x16_T_3[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_0_1_io_wreq_valid_REG <= _data_banks_0_0_io_wen_T_1 & io_write_dup_0_bits_way_en[1]; // @[BankedDataArray.scala 445:108]
    x15_1 <= io_write_dup_0_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_1 <= _x16_T_3[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_0_2_io_wreq_valid_REG <= _data_banks_0_0_io_wen_T_1 & io_write_dup_0_bits_way_en[2]; // @[BankedDataArray.scala 445:108]
    x15_2 <= io_write_dup_0_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_2 <= _x16_T_3[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_0_3_io_wreq_valid_REG <= _data_banks_0_0_io_wen_T_1 & io_write_dup_0_bits_way_en[3]; // @[BankedDataArray.scala 445:108]
    x15_3 <= io_write_dup_0_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_3 <= _x16_T_3[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_0_4_io_wreq_valid_REG <= _data_banks_0_0_io_wen_T_1 & io_write_dup_0_bits_way_en[4]; // @[BankedDataArray.scala 445:108]
    x15_4 <= io_write_dup_0_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_4 <= _x16_T_3[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_0_5_io_wreq_valid_REG <= _data_banks_0_0_io_wen_T_1 & io_write_dup_0_bits_way_en[5]; // @[BankedDataArray.scala 445:108]
    x15_5 <= io_write_dup_0_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_5 <= _x16_T_3[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_0_6_io_wreq_valid_REG <= _data_banks_0_0_io_wen_T_1 & io_write_dup_0_bits_way_en[6]; // @[BankedDataArray.scala 445:108]
    x15_6 <= io_write_dup_0_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_6 <= _x16_T_3[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_0_7_io_wreq_valid_REG <= _data_banks_0_0_io_wen_T_1 & io_write_dup_0_bits_way_en[7]; // @[BankedDataArray.scala 445:108]
    x15_7 <= io_write_dup_0_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_7 <= _x16_T_3[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_1_0_io_wreq_valid_REG <= _data_banks_1_0_io_wen_T_1 & io_write_dup_1_bits_way_en[0]; // @[BankedDataArray.scala 445:108]
    x15_8 <= io_write_dup_1_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_8 <= _x16_T_51[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_1_1_io_wreq_valid_REG <= _data_banks_1_0_io_wen_T_1 & io_write_dup_1_bits_way_en[1]; // @[BankedDataArray.scala 445:108]
    x15_9 <= io_write_dup_1_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_9 <= _x16_T_51[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_1_2_io_wreq_valid_REG <= _data_banks_1_0_io_wen_T_1 & io_write_dup_1_bits_way_en[2]; // @[BankedDataArray.scala 445:108]
    x15_10 <= io_write_dup_1_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_10 <= _x16_T_51[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_1_3_io_wreq_valid_REG <= _data_banks_1_0_io_wen_T_1 & io_write_dup_1_bits_way_en[3]; // @[BankedDataArray.scala 445:108]
    x15_11 <= io_write_dup_1_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_11 <= _x16_T_51[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_1_4_io_wreq_valid_REG <= _data_banks_1_0_io_wen_T_1 & io_write_dup_1_bits_way_en[4]; // @[BankedDataArray.scala 445:108]
    x15_12 <= io_write_dup_1_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_12 <= _x16_T_51[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_1_5_io_wreq_valid_REG <= _data_banks_1_0_io_wen_T_1 & io_write_dup_1_bits_way_en[5]; // @[BankedDataArray.scala 445:108]
    x15_13 <= io_write_dup_1_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_13 <= _x16_T_51[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_1_6_io_wreq_valid_REG <= _data_banks_1_0_io_wen_T_1 & io_write_dup_1_bits_way_en[6]; // @[BankedDataArray.scala 445:108]
    x15_14 <= io_write_dup_1_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_14 <= _x16_T_51[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_1_7_io_wreq_valid_REG <= _data_banks_1_0_io_wen_T_1 & io_write_dup_1_bits_way_en[7]; // @[BankedDataArray.scala 445:108]
    x15_15 <= io_write_dup_1_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_15 <= _x16_T_51[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_2_0_io_wreq_valid_REG <= _data_banks_2_0_io_wen_T_1 & io_write_dup_2_bits_way_en[0]; // @[BankedDataArray.scala 445:108]
    x15_16 <= io_write_dup_2_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_16 <= _x16_T_99[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_2_1_io_wreq_valid_REG <= _data_banks_2_0_io_wen_T_1 & io_write_dup_2_bits_way_en[1]; // @[BankedDataArray.scala 445:108]
    x15_17 <= io_write_dup_2_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_17 <= _x16_T_99[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_2_2_io_wreq_valid_REG <= _data_banks_2_0_io_wen_T_1 & io_write_dup_2_bits_way_en[2]; // @[BankedDataArray.scala 445:108]
    x15_18 <= io_write_dup_2_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_18 <= _x16_T_99[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_2_3_io_wreq_valid_REG <= _data_banks_2_0_io_wen_T_1 & io_write_dup_2_bits_way_en[3]; // @[BankedDataArray.scala 445:108]
    x15_19 <= io_write_dup_2_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_19 <= _x16_T_99[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_2_4_io_wreq_valid_REG <= _data_banks_2_0_io_wen_T_1 & io_write_dup_2_bits_way_en[4]; // @[BankedDataArray.scala 445:108]
    x15_20 <= io_write_dup_2_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_20 <= _x16_T_99[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_2_5_io_wreq_valid_REG <= _data_banks_2_0_io_wen_T_1 & io_write_dup_2_bits_way_en[5]; // @[BankedDataArray.scala 445:108]
    x15_21 <= io_write_dup_2_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_21 <= _x16_T_99[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_2_6_io_wreq_valid_REG <= _data_banks_2_0_io_wen_T_1 & io_write_dup_2_bits_way_en[6]; // @[BankedDataArray.scala 445:108]
    x15_22 <= io_write_dup_2_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_22 <= _x16_T_99[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_2_7_io_wreq_valid_REG <= _data_banks_2_0_io_wen_T_1 & io_write_dup_2_bits_way_en[7]; // @[BankedDataArray.scala 445:108]
    x15_23 <= io_write_dup_2_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_23 <= _x16_T_99[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_3_0_io_wreq_valid_REG <= _data_banks_3_0_io_wen_T_1 & io_write_dup_3_bits_way_en[0]; // @[BankedDataArray.scala 445:108]
    x15_24 <= io_write_dup_3_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_24 <= _x16_T_147[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_3_1_io_wreq_valid_REG <= _data_banks_3_0_io_wen_T_1 & io_write_dup_3_bits_way_en[1]; // @[BankedDataArray.scala 445:108]
    x15_25 <= io_write_dup_3_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_25 <= _x16_T_147[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_3_2_io_wreq_valid_REG <= _data_banks_3_0_io_wen_T_1 & io_write_dup_3_bits_way_en[2]; // @[BankedDataArray.scala 445:108]
    x15_26 <= io_write_dup_3_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_26 <= _x16_T_147[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_3_3_io_wreq_valid_REG <= _data_banks_3_0_io_wen_T_1 & io_write_dup_3_bits_way_en[3]; // @[BankedDataArray.scala 445:108]
    x15_27 <= io_write_dup_3_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_27 <= _x16_T_147[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_3_4_io_wreq_valid_REG <= _data_banks_3_0_io_wen_T_1 & io_write_dup_3_bits_way_en[4]; // @[BankedDataArray.scala 445:108]
    x15_28 <= io_write_dup_3_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_28 <= _x16_T_147[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_3_5_io_wreq_valid_REG <= _data_banks_3_0_io_wen_T_1 & io_write_dup_3_bits_way_en[5]; // @[BankedDataArray.scala 445:108]
    x15_29 <= io_write_dup_3_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_29 <= _x16_T_147[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_3_6_io_wreq_valid_REG <= _data_banks_3_0_io_wen_T_1 & io_write_dup_3_bits_way_en[6]; // @[BankedDataArray.scala 445:108]
    x15_30 <= io_write_dup_3_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_30 <= _x16_T_147[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_3_7_io_wreq_valid_REG <= _data_banks_3_0_io_wen_T_1 & io_write_dup_3_bits_way_en[7]; // @[BankedDataArray.scala 445:108]
    x15_31 <= io_write_dup_3_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_31 <= _x16_T_147[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_4_0_io_wreq_valid_REG <= _data_banks_4_0_io_wen_T_1 & io_write_dup_4_bits_way_en[0]; // @[BankedDataArray.scala 445:108]
    x15_32 <= io_write_dup_4_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_32 <= _x16_T_195[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_4_1_io_wreq_valid_REG <= _data_banks_4_0_io_wen_T_1 & io_write_dup_4_bits_way_en[1]; // @[BankedDataArray.scala 445:108]
    x15_33 <= io_write_dup_4_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_33 <= _x16_T_195[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_4_2_io_wreq_valid_REG <= _data_banks_4_0_io_wen_T_1 & io_write_dup_4_bits_way_en[2]; // @[BankedDataArray.scala 445:108]
    x15_34 <= io_write_dup_4_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_34 <= _x16_T_195[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_4_3_io_wreq_valid_REG <= _data_banks_4_0_io_wen_T_1 & io_write_dup_4_bits_way_en[3]; // @[BankedDataArray.scala 445:108]
    x15_35 <= io_write_dup_4_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_35 <= _x16_T_195[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_4_4_io_wreq_valid_REG <= _data_banks_4_0_io_wen_T_1 & io_write_dup_4_bits_way_en[4]; // @[BankedDataArray.scala 445:108]
    x15_36 <= io_write_dup_4_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_36 <= _x16_T_195[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_4_5_io_wreq_valid_REG <= _data_banks_4_0_io_wen_T_1 & io_write_dup_4_bits_way_en[5]; // @[BankedDataArray.scala 445:108]
    x15_37 <= io_write_dup_4_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_37 <= _x16_T_195[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_4_6_io_wreq_valid_REG <= _data_banks_4_0_io_wen_T_1 & io_write_dup_4_bits_way_en[6]; // @[BankedDataArray.scala 445:108]
    x15_38 <= io_write_dup_4_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_38 <= _x16_T_195[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_4_7_io_wreq_valid_REG <= _data_banks_4_0_io_wen_T_1 & io_write_dup_4_bits_way_en[7]; // @[BankedDataArray.scala 445:108]
    x15_39 <= io_write_dup_4_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_39 <= _x16_T_195[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_5_0_io_wreq_valid_REG <= _data_banks_5_0_io_wen_T_1 & io_write_dup_5_bits_way_en[0]; // @[BankedDataArray.scala 445:108]
    x15_40 <= io_write_dup_5_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_40 <= _x16_T_243[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_5_1_io_wreq_valid_REG <= _data_banks_5_0_io_wen_T_1 & io_write_dup_5_bits_way_en[1]; // @[BankedDataArray.scala 445:108]
    x15_41 <= io_write_dup_5_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_41 <= _x16_T_243[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_5_2_io_wreq_valid_REG <= _data_banks_5_0_io_wen_T_1 & io_write_dup_5_bits_way_en[2]; // @[BankedDataArray.scala 445:108]
    x15_42 <= io_write_dup_5_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_42 <= _x16_T_243[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_5_3_io_wreq_valid_REG <= _data_banks_5_0_io_wen_T_1 & io_write_dup_5_bits_way_en[3]; // @[BankedDataArray.scala 445:108]
    x15_43 <= io_write_dup_5_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_43 <= _x16_T_243[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_5_4_io_wreq_valid_REG <= _data_banks_5_0_io_wen_T_1 & io_write_dup_5_bits_way_en[4]; // @[BankedDataArray.scala 445:108]
    x15_44 <= io_write_dup_5_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_44 <= _x16_T_243[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_5_5_io_wreq_valid_REG <= _data_banks_5_0_io_wen_T_1 & io_write_dup_5_bits_way_en[5]; // @[BankedDataArray.scala 445:108]
    x15_45 <= io_write_dup_5_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_45 <= _x16_T_243[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_5_6_io_wreq_valid_REG <= _data_banks_5_0_io_wen_T_1 & io_write_dup_5_bits_way_en[6]; // @[BankedDataArray.scala 445:108]
    x15_46 <= io_write_dup_5_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_46 <= _x16_T_243[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_5_7_io_wreq_valid_REG <= _data_banks_5_0_io_wen_T_1 & io_write_dup_5_bits_way_en[7]; // @[BankedDataArray.scala 445:108]
    x15_47 <= io_write_dup_5_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_47 <= _x16_T_243[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_6_0_io_wreq_valid_REG <= _data_banks_6_0_io_wen_T_1 & io_write_dup_6_bits_way_en[0]; // @[BankedDataArray.scala 445:108]
    x15_48 <= io_write_dup_6_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_48 <= _x16_T_291[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_6_1_io_wreq_valid_REG <= _data_banks_6_0_io_wen_T_1 & io_write_dup_6_bits_way_en[1]; // @[BankedDataArray.scala 445:108]
    x15_49 <= io_write_dup_6_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_49 <= _x16_T_291[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_6_2_io_wreq_valid_REG <= _data_banks_6_0_io_wen_T_1 & io_write_dup_6_bits_way_en[2]; // @[BankedDataArray.scala 445:108]
    x15_50 <= io_write_dup_6_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_50 <= _x16_T_291[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_6_3_io_wreq_valid_REG <= _data_banks_6_0_io_wen_T_1 & io_write_dup_6_bits_way_en[3]; // @[BankedDataArray.scala 445:108]
    x15_51 <= io_write_dup_6_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_51 <= _x16_T_291[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_6_4_io_wreq_valid_REG <= _data_banks_6_0_io_wen_T_1 & io_write_dup_6_bits_way_en[4]; // @[BankedDataArray.scala 445:108]
    x15_52 <= io_write_dup_6_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_52 <= _x16_T_291[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_6_5_io_wreq_valid_REG <= _data_banks_6_0_io_wen_T_1 & io_write_dup_6_bits_way_en[5]; // @[BankedDataArray.scala 445:108]
    x15_53 <= io_write_dup_6_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_53 <= _x16_T_291[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_6_6_io_wreq_valid_REG <= _data_banks_6_0_io_wen_T_1 & io_write_dup_6_bits_way_en[6]; // @[BankedDataArray.scala 445:108]
    x15_54 <= io_write_dup_6_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_54 <= _x16_T_291[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_6_7_io_wreq_valid_REG <= _data_banks_6_0_io_wen_T_1 & io_write_dup_6_bits_way_en[7]; // @[BankedDataArray.scala 445:108]
    x15_55 <= io_write_dup_6_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_55 <= _x16_T_291[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_7_0_io_wreq_valid_REG <= _data_banks_7_0_io_wen_T_1 & io_write_dup_7_bits_way_en[0]; // @[BankedDataArray.scala 445:108]
    x15_56 <= io_write_dup_7_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_56 <= _x16_T_339[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_7_1_io_wreq_valid_REG <= _data_banks_7_0_io_wen_T_1 & io_write_dup_7_bits_way_en[1]; // @[BankedDataArray.scala 445:108]
    x15_57 <= io_write_dup_7_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_57 <= _x16_T_339[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_7_2_io_wreq_valid_REG <= _data_banks_7_0_io_wen_T_1 & io_write_dup_7_bits_way_en[2]; // @[BankedDataArray.scala 445:108]
    x15_58 <= io_write_dup_7_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_58 <= _x16_T_339[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_7_3_io_wreq_valid_REG <= _data_banks_7_0_io_wen_T_1 & io_write_dup_7_bits_way_en[3]; // @[BankedDataArray.scala 445:108]
    x15_59 <= io_write_dup_7_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_59 <= _x16_T_339[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_7_4_io_wreq_valid_REG <= _data_banks_7_0_io_wen_T_1 & io_write_dup_7_bits_way_en[4]; // @[BankedDataArray.scala 445:108]
    x15_60 <= io_write_dup_7_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_60 <= _x16_T_339[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_7_5_io_wreq_valid_REG <= _data_banks_7_0_io_wen_T_1 & io_write_dup_7_bits_way_en[5]; // @[BankedDataArray.scala 445:108]
    x15_61 <= io_write_dup_7_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_61 <= _x16_T_339[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_7_6_io_wreq_valid_REG <= _data_banks_7_0_io_wen_T_1 & io_write_dup_7_bits_way_en[6]; // @[BankedDataArray.scala 445:108]
    x15_62 <= io_write_dup_7_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_62 <= _x16_T_339[71:64]; // @[BankedDataArray.scala 172:12]
    ecc_banks_7_7_io_wreq_valid_REG <= _data_banks_7_0_io_wen_T_1 & io_write_dup_7_bits_way_en[7]; // @[BankedDataArray.scala 445:108]
    x15_63 <= io_write_dup_7_bits_addr[11:6]; // @[DCacheWrapper.scala 191:9]
    x16_63 <= _x16_T_339[71:64]; // @[BankedDataArray.scala 172:12]
    io_cacheOp_resp_valid_REG <= io_cacheOp_req_valid & cacheOpShouldResp; // @[BankedDataArray.scala 607:57]
    io_cacheOp_resp_bits_read_data_vec_0_REG <= io_cacheOp_req_bits_wayNum[4:0]; // @[BankedDataArray.scala 609:113]
    eccReadResult_0_REG <= io_cacheOp_req_bits_wayNum[4:0]; // @[BankedDataArray.scala 610:98]
    io_cacheOp_resp_bits_read_data_vec_1_REG <= io_cacheOp_req_bits_wayNum[4:0]; // @[BankedDataArray.scala 609:113]
    eccReadResult_1_REG <= io_cacheOp_req_bits_wayNum[4:0]; // @[BankedDataArray.scala 610:98]
    io_cacheOp_resp_bits_read_data_vec_2_REG <= io_cacheOp_req_bits_wayNum[4:0]; // @[BankedDataArray.scala 609:113]
    eccReadResult_2_REG <= io_cacheOp_req_bits_wayNum[4:0]; // @[BankedDataArray.scala 610:98]
    io_cacheOp_resp_bits_read_data_vec_3_REG <= io_cacheOp_req_bits_wayNum[4:0]; // @[BankedDataArray.scala 609:113]
    eccReadResult_3_REG <= io_cacheOp_req_bits_wayNum[4:0]; // @[BankedDataArray.scala 610:98]
    io_cacheOp_resp_bits_read_data_vec_4_REG <= io_cacheOp_req_bits_wayNum[4:0]; // @[BankedDataArray.scala 609:113]
    eccReadResult_4_REG <= io_cacheOp_req_bits_wayNum[4:0]; // @[BankedDataArray.scala 610:98]
    io_cacheOp_resp_bits_read_data_vec_5_REG <= io_cacheOp_req_bits_wayNum[4:0]; // @[BankedDataArray.scala 609:113]
    eccReadResult_5_REG <= io_cacheOp_req_bits_wayNum[4:0]; // @[BankedDataArray.scala 610:98]
    io_cacheOp_resp_bits_read_data_vec_6_REG <= io_cacheOp_req_bits_wayNum[4:0]; // @[BankedDataArray.scala 609:113]
    eccReadResult_6_REG <= io_cacheOp_req_bits_wayNum[4:0]; // @[BankedDataArray.scala 610:98]
    io_cacheOp_resp_bits_read_data_vec_7_REG <= io_cacheOp_req_bits_wayNum[4:0]; // @[BankedDataArray.scala 609:113]
    eccReadResult_7_REG <= io_cacheOp_req_bits_wayNum[4:0]; // @[BankedDataArray.scala 610:98]
    io_cacheOp_resp_bits_read_data_ecc_REG <= io_cacheOp_req_bits_bank_num; // @[BankedDataArray.scala 613:26]
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[ChiselDB.scala 134:16]
      cnt <= 64'h0;
    end else begin
      cnt <= cnt + 64'h1;
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
  rwhazard = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  io_bank_conflict_slow_0_REG = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  io_bank_conflict_slow_1_REG = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  ecc_data_delayed_REG = _RAND_3[0:0];
  _RAND_4 = {3{`RANDOM}};
  ecc_data_delayed = _RAND_4[71:0];
  _RAND_5 = {1{`RANDOM}};
  ecc_data_delayed_REG_1 = _RAND_5[0:0];
  _RAND_6 = {3{`RANDOM}};
  ecc_data_delayed_1 = _RAND_6[71:0];
  _RAND_7 = {1{`RANDOM}};
  ecc_data_delayed_REG_2 = _RAND_7[0:0];
  _RAND_8 = {3{`RANDOM}};
  ecc_data_delayed_2 = _RAND_8[71:0];
  _RAND_9 = {1{`RANDOM}};
  ecc_data_delayed_REG_3 = _RAND_9[0:0];
  _RAND_10 = {3{`RANDOM}};
  ecc_data_delayed_3 = _RAND_10[71:0];
  _RAND_11 = {1{`RANDOM}};
  ecc_data_delayed_REG_4 = _RAND_11[0:0];
  _RAND_12 = {3{`RANDOM}};
  ecc_data_delayed_4 = _RAND_12[71:0];
  _RAND_13 = {1{`RANDOM}};
  ecc_data_delayed_REG_5 = _RAND_13[0:0];
  _RAND_14 = {3{`RANDOM}};
  ecc_data_delayed_5 = _RAND_14[71:0];
  _RAND_15 = {1{`RANDOM}};
  ecc_data_delayed_REG_6 = _RAND_15[0:0];
  _RAND_16 = {3{`RANDOM}};
  ecc_data_delayed_6 = _RAND_16[71:0];
  _RAND_17 = {1{`RANDOM}};
  ecc_data_delayed_REG_7 = _RAND_17[0:0];
  _RAND_18 = {3{`RANDOM}};
  ecc_data_delayed_7 = _RAND_18[71:0];
  _RAND_19 = {1{`RANDOM}};
  ecc_data_delayed_REG_8 = _RAND_19[0:0];
  _RAND_20 = {3{`RANDOM}};
  ecc_data_delayed_8 = _RAND_20[71:0];
  _RAND_21 = {1{`RANDOM}};
  ecc_data_delayed_REG_9 = _RAND_21[0:0];
  _RAND_22 = {3{`RANDOM}};
  ecc_data_delayed_9 = _RAND_22[71:0];
  _RAND_23 = {1{`RANDOM}};
  ecc_data_delayed_REG_10 = _RAND_23[0:0];
  _RAND_24 = {3{`RANDOM}};
  ecc_data_delayed_10 = _RAND_24[71:0];
  _RAND_25 = {1{`RANDOM}};
  ecc_data_delayed_REG_11 = _RAND_25[0:0];
  _RAND_26 = {3{`RANDOM}};
  ecc_data_delayed_11 = _RAND_26[71:0];
  _RAND_27 = {1{`RANDOM}};
  ecc_data_delayed_REG_12 = _RAND_27[0:0];
  _RAND_28 = {3{`RANDOM}};
  ecc_data_delayed_12 = _RAND_28[71:0];
  _RAND_29 = {1{`RANDOM}};
  ecc_data_delayed_REG_13 = _RAND_29[0:0];
  _RAND_30 = {3{`RANDOM}};
  ecc_data_delayed_13 = _RAND_30[71:0];
  _RAND_31 = {1{`RANDOM}};
  ecc_data_delayed_REG_14 = _RAND_31[0:0];
  _RAND_32 = {3{`RANDOM}};
  ecc_data_delayed_14 = _RAND_32[71:0];
  _RAND_33 = {1{`RANDOM}};
  ecc_data_delayed_REG_15 = _RAND_33[0:0];
  _RAND_34 = {3{`RANDOM}};
  ecc_data_delayed_15 = _RAND_34[71:0];
  _RAND_35 = {1{`RANDOM}};
  ecc_data_delayed_REG_16 = _RAND_35[0:0];
  _RAND_36 = {3{`RANDOM}};
  ecc_data_delayed_16 = _RAND_36[71:0];
  _RAND_37 = {1{`RANDOM}};
  ecc_data_delayed_REG_17 = _RAND_37[0:0];
  _RAND_38 = {3{`RANDOM}};
  ecc_data_delayed_17 = _RAND_38[71:0];
  _RAND_39 = {1{`RANDOM}};
  ecc_data_delayed_REG_18 = _RAND_39[0:0];
  _RAND_40 = {3{`RANDOM}};
  ecc_data_delayed_18 = _RAND_40[71:0];
  _RAND_41 = {1{`RANDOM}};
  ecc_data_delayed_REG_19 = _RAND_41[0:0];
  _RAND_42 = {3{`RANDOM}};
  ecc_data_delayed_19 = _RAND_42[71:0];
  _RAND_43 = {1{`RANDOM}};
  ecc_data_delayed_REG_20 = _RAND_43[0:0];
  _RAND_44 = {3{`RANDOM}};
  ecc_data_delayed_20 = _RAND_44[71:0];
  _RAND_45 = {1{`RANDOM}};
  ecc_data_delayed_REG_21 = _RAND_45[0:0];
  _RAND_46 = {3{`RANDOM}};
  ecc_data_delayed_21 = _RAND_46[71:0];
  _RAND_47 = {1{`RANDOM}};
  ecc_data_delayed_REG_22 = _RAND_47[0:0];
  _RAND_48 = {3{`RANDOM}};
  ecc_data_delayed_22 = _RAND_48[71:0];
  _RAND_49 = {1{`RANDOM}};
  ecc_data_delayed_REG_23 = _RAND_49[0:0];
  _RAND_50 = {3{`RANDOM}};
  ecc_data_delayed_23 = _RAND_50[71:0];
  _RAND_51 = {1{`RANDOM}};
  ecc_data_delayed_REG_24 = _RAND_51[0:0];
  _RAND_52 = {3{`RANDOM}};
  ecc_data_delayed_24 = _RAND_52[71:0];
  _RAND_53 = {1{`RANDOM}};
  ecc_data_delayed_REG_25 = _RAND_53[0:0];
  _RAND_54 = {3{`RANDOM}};
  ecc_data_delayed_25 = _RAND_54[71:0];
  _RAND_55 = {1{`RANDOM}};
  ecc_data_delayed_REG_26 = _RAND_55[0:0];
  _RAND_56 = {3{`RANDOM}};
  ecc_data_delayed_26 = _RAND_56[71:0];
  _RAND_57 = {1{`RANDOM}};
  ecc_data_delayed_REG_27 = _RAND_57[0:0];
  _RAND_58 = {3{`RANDOM}};
  ecc_data_delayed_27 = _RAND_58[71:0];
  _RAND_59 = {1{`RANDOM}};
  ecc_data_delayed_REG_28 = _RAND_59[0:0];
  _RAND_60 = {3{`RANDOM}};
  ecc_data_delayed_28 = _RAND_60[71:0];
  _RAND_61 = {1{`RANDOM}};
  ecc_data_delayed_REG_29 = _RAND_61[0:0];
  _RAND_62 = {3{`RANDOM}};
  ecc_data_delayed_29 = _RAND_62[71:0];
  _RAND_63 = {1{`RANDOM}};
  ecc_data_delayed_REG_30 = _RAND_63[0:0];
  _RAND_64 = {3{`RANDOM}};
  ecc_data_delayed_30 = _RAND_64[71:0];
  _RAND_65 = {1{`RANDOM}};
  ecc_data_delayed_REG_31 = _RAND_65[0:0];
  _RAND_66 = {3{`RANDOM}};
  ecc_data_delayed_31 = _RAND_66[71:0];
  _RAND_67 = {1{`RANDOM}};
  ecc_data_delayed_REG_32 = _RAND_67[0:0];
  _RAND_68 = {3{`RANDOM}};
  ecc_data_delayed_32 = _RAND_68[71:0];
  _RAND_69 = {1{`RANDOM}};
  ecc_data_delayed_REG_33 = _RAND_69[0:0];
  _RAND_70 = {3{`RANDOM}};
  ecc_data_delayed_33 = _RAND_70[71:0];
  _RAND_71 = {1{`RANDOM}};
  ecc_data_delayed_REG_34 = _RAND_71[0:0];
  _RAND_72 = {3{`RANDOM}};
  ecc_data_delayed_34 = _RAND_72[71:0];
  _RAND_73 = {1{`RANDOM}};
  ecc_data_delayed_REG_35 = _RAND_73[0:0];
  _RAND_74 = {3{`RANDOM}};
  ecc_data_delayed_35 = _RAND_74[71:0];
  _RAND_75 = {1{`RANDOM}};
  ecc_data_delayed_REG_36 = _RAND_75[0:0];
  _RAND_76 = {3{`RANDOM}};
  ecc_data_delayed_36 = _RAND_76[71:0];
  _RAND_77 = {1{`RANDOM}};
  ecc_data_delayed_REG_37 = _RAND_77[0:0];
  _RAND_78 = {3{`RANDOM}};
  ecc_data_delayed_37 = _RAND_78[71:0];
  _RAND_79 = {1{`RANDOM}};
  ecc_data_delayed_REG_38 = _RAND_79[0:0];
  _RAND_80 = {3{`RANDOM}};
  ecc_data_delayed_38 = _RAND_80[71:0];
  _RAND_81 = {1{`RANDOM}};
  ecc_data_delayed_REG_39 = _RAND_81[0:0];
  _RAND_82 = {3{`RANDOM}};
  ecc_data_delayed_39 = _RAND_82[71:0];
  _RAND_83 = {1{`RANDOM}};
  ecc_data_delayed_REG_40 = _RAND_83[0:0];
  _RAND_84 = {3{`RANDOM}};
  ecc_data_delayed_40 = _RAND_84[71:0];
  _RAND_85 = {1{`RANDOM}};
  ecc_data_delayed_REG_41 = _RAND_85[0:0];
  _RAND_86 = {3{`RANDOM}};
  ecc_data_delayed_41 = _RAND_86[71:0];
  _RAND_87 = {1{`RANDOM}};
  ecc_data_delayed_REG_42 = _RAND_87[0:0];
  _RAND_88 = {3{`RANDOM}};
  ecc_data_delayed_42 = _RAND_88[71:0];
  _RAND_89 = {1{`RANDOM}};
  ecc_data_delayed_REG_43 = _RAND_89[0:0];
  _RAND_90 = {3{`RANDOM}};
  ecc_data_delayed_43 = _RAND_90[71:0];
  _RAND_91 = {1{`RANDOM}};
  ecc_data_delayed_REG_44 = _RAND_91[0:0];
  _RAND_92 = {3{`RANDOM}};
  ecc_data_delayed_44 = _RAND_92[71:0];
  _RAND_93 = {1{`RANDOM}};
  ecc_data_delayed_REG_45 = _RAND_93[0:0];
  _RAND_94 = {3{`RANDOM}};
  ecc_data_delayed_45 = _RAND_94[71:0];
  _RAND_95 = {1{`RANDOM}};
  ecc_data_delayed_REG_46 = _RAND_95[0:0];
  _RAND_96 = {3{`RANDOM}};
  ecc_data_delayed_46 = _RAND_96[71:0];
  _RAND_97 = {1{`RANDOM}};
  ecc_data_delayed_REG_47 = _RAND_97[0:0];
  _RAND_98 = {3{`RANDOM}};
  ecc_data_delayed_47 = _RAND_98[71:0];
  _RAND_99 = {1{`RANDOM}};
  ecc_data_delayed_REG_48 = _RAND_99[0:0];
  _RAND_100 = {3{`RANDOM}};
  ecc_data_delayed_48 = _RAND_100[71:0];
  _RAND_101 = {1{`RANDOM}};
  ecc_data_delayed_REG_49 = _RAND_101[0:0];
  _RAND_102 = {3{`RANDOM}};
  ecc_data_delayed_49 = _RAND_102[71:0];
  _RAND_103 = {1{`RANDOM}};
  ecc_data_delayed_REG_50 = _RAND_103[0:0];
  _RAND_104 = {3{`RANDOM}};
  ecc_data_delayed_50 = _RAND_104[71:0];
  _RAND_105 = {1{`RANDOM}};
  ecc_data_delayed_REG_51 = _RAND_105[0:0];
  _RAND_106 = {3{`RANDOM}};
  ecc_data_delayed_51 = _RAND_106[71:0];
  _RAND_107 = {1{`RANDOM}};
  ecc_data_delayed_REG_52 = _RAND_107[0:0];
  _RAND_108 = {3{`RANDOM}};
  ecc_data_delayed_52 = _RAND_108[71:0];
  _RAND_109 = {1{`RANDOM}};
  ecc_data_delayed_REG_53 = _RAND_109[0:0];
  _RAND_110 = {3{`RANDOM}};
  ecc_data_delayed_53 = _RAND_110[71:0];
  _RAND_111 = {1{`RANDOM}};
  ecc_data_delayed_REG_54 = _RAND_111[0:0];
  _RAND_112 = {3{`RANDOM}};
  ecc_data_delayed_54 = _RAND_112[71:0];
  _RAND_113 = {1{`RANDOM}};
  ecc_data_delayed_REG_55 = _RAND_113[0:0];
  _RAND_114 = {3{`RANDOM}};
  ecc_data_delayed_55 = _RAND_114[71:0];
  _RAND_115 = {1{`RANDOM}};
  ecc_data_delayed_REG_56 = _RAND_115[0:0];
  _RAND_116 = {3{`RANDOM}};
  ecc_data_delayed_56 = _RAND_116[71:0];
  _RAND_117 = {1{`RANDOM}};
  ecc_data_delayed_REG_57 = _RAND_117[0:0];
  _RAND_118 = {3{`RANDOM}};
  ecc_data_delayed_57 = _RAND_118[71:0];
  _RAND_119 = {1{`RANDOM}};
  ecc_data_delayed_REG_58 = _RAND_119[0:0];
  _RAND_120 = {3{`RANDOM}};
  ecc_data_delayed_58 = _RAND_120[71:0];
  _RAND_121 = {1{`RANDOM}};
  ecc_data_delayed_REG_59 = _RAND_121[0:0];
  _RAND_122 = {3{`RANDOM}};
  ecc_data_delayed_59 = _RAND_122[71:0];
  _RAND_123 = {1{`RANDOM}};
  ecc_data_delayed_REG_60 = _RAND_123[0:0];
  _RAND_124 = {3{`RANDOM}};
  ecc_data_delayed_60 = _RAND_124[71:0];
  _RAND_125 = {1{`RANDOM}};
  ecc_data_delayed_REG_61 = _RAND_125[0:0];
  _RAND_126 = {3{`RANDOM}};
  ecc_data_delayed_61 = _RAND_126[71:0];
  _RAND_127 = {1{`RANDOM}};
  ecc_data_delayed_REG_62 = _RAND_127[0:0];
  _RAND_128 = {3{`RANDOM}};
  ecc_data_delayed_62 = _RAND_128[71:0];
  _RAND_129 = {1{`RANDOM}};
  ecc_data_delayed_REG_63 = _RAND_129[0:0];
  _RAND_130 = {3{`RANDOM}};
  ecc_data_delayed_63 = _RAND_130[71:0];
  _RAND_131 = {2{`RANDOM}};
  read_result_delayed_0_0_raw_data = _RAND_131[63:0];
  _RAND_132 = {2{`RANDOM}};
  read_result_delayed_0_1_raw_data = _RAND_132[63:0];
  _RAND_133 = {2{`RANDOM}};
  read_result_delayed_0_2_raw_data = _RAND_133[63:0];
  _RAND_134 = {2{`RANDOM}};
  read_result_delayed_0_3_raw_data = _RAND_134[63:0];
  _RAND_135 = {2{`RANDOM}};
  read_result_delayed_0_4_raw_data = _RAND_135[63:0];
  _RAND_136 = {2{`RANDOM}};
  read_result_delayed_0_5_raw_data = _RAND_136[63:0];
  _RAND_137 = {2{`RANDOM}};
  read_result_delayed_0_6_raw_data = _RAND_137[63:0];
  _RAND_138 = {2{`RANDOM}};
  read_result_delayed_0_7_raw_data = _RAND_138[63:0];
  _RAND_139 = {2{`RANDOM}};
  read_result_delayed_1_0_raw_data = _RAND_139[63:0];
  _RAND_140 = {2{`RANDOM}};
  read_result_delayed_1_1_raw_data = _RAND_140[63:0];
  _RAND_141 = {2{`RANDOM}};
  read_result_delayed_1_2_raw_data = _RAND_141[63:0];
  _RAND_142 = {2{`RANDOM}};
  read_result_delayed_1_3_raw_data = _RAND_142[63:0];
  _RAND_143 = {2{`RANDOM}};
  read_result_delayed_1_4_raw_data = _RAND_143[63:0];
  _RAND_144 = {2{`RANDOM}};
  read_result_delayed_1_5_raw_data = _RAND_144[63:0];
  _RAND_145 = {2{`RANDOM}};
  read_result_delayed_1_6_raw_data = _RAND_145[63:0];
  _RAND_146 = {2{`RANDOM}};
  read_result_delayed_1_7_raw_data = _RAND_146[63:0];
  _RAND_147 = {2{`RANDOM}};
  read_result_delayed_2_0_raw_data = _RAND_147[63:0];
  _RAND_148 = {2{`RANDOM}};
  read_result_delayed_2_1_raw_data = _RAND_148[63:0];
  _RAND_149 = {2{`RANDOM}};
  read_result_delayed_2_2_raw_data = _RAND_149[63:0];
  _RAND_150 = {2{`RANDOM}};
  read_result_delayed_2_3_raw_data = _RAND_150[63:0];
  _RAND_151 = {2{`RANDOM}};
  read_result_delayed_2_4_raw_data = _RAND_151[63:0];
  _RAND_152 = {2{`RANDOM}};
  read_result_delayed_2_5_raw_data = _RAND_152[63:0];
  _RAND_153 = {2{`RANDOM}};
  read_result_delayed_2_6_raw_data = _RAND_153[63:0];
  _RAND_154 = {2{`RANDOM}};
  read_result_delayed_2_7_raw_data = _RAND_154[63:0];
  _RAND_155 = {2{`RANDOM}};
  read_result_delayed_3_0_raw_data = _RAND_155[63:0];
  _RAND_156 = {2{`RANDOM}};
  read_result_delayed_3_1_raw_data = _RAND_156[63:0];
  _RAND_157 = {2{`RANDOM}};
  read_result_delayed_3_2_raw_data = _RAND_157[63:0];
  _RAND_158 = {2{`RANDOM}};
  read_result_delayed_3_3_raw_data = _RAND_158[63:0];
  _RAND_159 = {2{`RANDOM}};
  read_result_delayed_3_4_raw_data = _RAND_159[63:0];
  _RAND_160 = {2{`RANDOM}};
  read_result_delayed_3_5_raw_data = _RAND_160[63:0];
  _RAND_161 = {2{`RANDOM}};
  read_result_delayed_3_6_raw_data = _RAND_161[63:0];
  _RAND_162 = {2{`RANDOM}};
  read_result_delayed_3_7_raw_data = _RAND_162[63:0];
  _RAND_163 = {2{`RANDOM}};
  read_result_delayed_4_0_raw_data = _RAND_163[63:0];
  _RAND_164 = {2{`RANDOM}};
  read_result_delayed_4_1_raw_data = _RAND_164[63:0];
  _RAND_165 = {2{`RANDOM}};
  read_result_delayed_4_2_raw_data = _RAND_165[63:0];
  _RAND_166 = {2{`RANDOM}};
  read_result_delayed_4_3_raw_data = _RAND_166[63:0];
  _RAND_167 = {2{`RANDOM}};
  read_result_delayed_4_4_raw_data = _RAND_167[63:0];
  _RAND_168 = {2{`RANDOM}};
  read_result_delayed_4_5_raw_data = _RAND_168[63:0];
  _RAND_169 = {2{`RANDOM}};
  read_result_delayed_4_6_raw_data = _RAND_169[63:0];
  _RAND_170 = {2{`RANDOM}};
  read_result_delayed_4_7_raw_data = _RAND_170[63:0];
  _RAND_171 = {2{`RANDOM}};
  read_result_delayed_5_0_raw_data = _RAND_171[63:0];
  _RAND_172 = {2{`RANDOM}};
  read_result_delayed_5_1_raw_data = _RAND_172[63:0];
  _RAND_173 = {2{`RANDOM}};
  read_result_delayed_5_2_raw_data = _RAND_173[63:0];
  _RAND_174 = {2{`RANDOM}};
  read_result_delayed_5_3_raw_data = _RAND_174[63:0];
  _RAND_175 = {2{`RANDOM}};
  read_result_delayed_5_4_raw_data = _RAND_175[63:0];
  _RAND_176 = {2{`RANDOM}};
  read_result_delayed_5_5_raw_data = _RAND_176[63:0];
  _RAND_177 = {2{`RANDOM}};
  read_result_delayed_5_6_raw_data = _RAND_177[63:0];
  _RAND_178 = {2{`RANDOM}};
  read_result_delayed_5_7_raw_data = _RAND_178[63:0];
  _RAND_179 = {2{`RANDOM}};
  read_result_delayed_6_0_raw_data = _RAND_179[63:0];
  _RAND_180 = {2{`RANDOM}};
  read_result_delayed_6_1_raw_data = _RAND_180[63:0];
  _RAND_181 = {2{`RANDOM}};
  read_result_delayed_6_2_raw_data = _RAND_181[63:0];
  _RAND_182 = {2{`RANDOM}};
  read_result_delayed_6_3_raw_data = _RAND_182[63:0];
  _RAND_183 = {2{`RANDOM}};
  read_result_delayed_6_4_raw_data = _RAND_183[63:0];
  _RAND_184 = {2{`RANDOM}};
  read_result_delayed_6_5_raw_data = _RAND_184[63:0];
  _RAND_185 = {2{`RANDOM}};
  read_result_delayed_6_6_raw_data = _RAND_185[63:0];
  _RAND_186 = {2{`RANDOM}};
  read_result_delayed_6_7_raw_data = _RAND_186[63:0];
  _RAND_187 = {2{`RANDOM}};
  read_result_delayed_7_0_raw_data = _RAND_187[63:0];
  _RAND_188 = {2{`RANDOM}};
  read_result_delayed_7_1_raw_data = _RAND_188[63:0];
  _RAND_189 = {2{`RANDOM}};
  read_result_delayed_7_2_raw_data = _RAND_189[63:0];
  _RAND_190 = {2{`RANDOM}};
  read_result_delayed_7_3_raw_data = _RAND_190[63:0];
  _RAND_191 = {2{`RANDOM}};
  read_result_delayed_7_4_raw_data = _RAND_191[63:0];
  _RAND_192 = {2{`RANDOM}};
  read_result_delayed_7_5_raw_data = _RAND_192[63:0];
  _RAND_193 = {2{`RANDOM}};
  read_result_delayed_7_6_raw_data = _RAND_193[63:0];
  _RAND_194 = {2{`RANDOM}};
  read_result_delayed_7_7_raw_data = _RAND_194[63:0];
  _RAND_195 = {1{`RANDOM}};
  io_read_resp_delayed_0_0_REG_4 = _RAND_195[3:0];
  _RAND_196 = {1{`RANDOM}};
  io_read_resp_delayed_0_0_REG_5 = _RAND_196[3:0];
  _RAND_197 = {1{`RANDOM}};
  io_read_resp_delayed_0_0_REG_6 = _RAND_197[2:0];
  _RAND_198 = {1{`RANDOM}};
  io_read_resp_delayed_0_0_REG_7 = _RAND_198[2:0];
  _RAND_199 = {1{`RANDOM}};
  io_read_resp_delayed_1_0_REG_4 = _RAND_199[3:0];
  _RAND_200 = {1{`RANDOM}};
  io_read_resp_delayed_1_0_REG_5 = _RAND_200[3:0];
  _RAND_201 = {1{`RANDOM}};
  io_read_resp_delayed_1_0_REG_6 = _RAND_201[2:0];
  _RAND_202 = {1{`RANDOM}};
  io_read_resp_delayed_1_0_REG_7 = _RAND_202[2:0];
  _RAND_203 = {1{`RANDOM}};
  io_readline_resp_0_REG = _RAND_203[2:0];
  _RAND_204 = {1{`RANDOM}};
  io_readline_resp_1_REG = _RAND_204[2:0];
  _RAND_205 = {1{`RANDOM}};
  io_readline_resp_2_REG = _RAND_205[2:0];
  _RAND_206 = {1{`RANDOM}};
  io_readline_resp_3_REG = _RAND_206[2:0];
  _RAND_207 = {1{`RANDOM}};
  io_readline_resp_4_REG = _RAND_207[2:0];
  _RAND_208 = {1{`RANDOM}};
  io_readline_resp_5_REG = _RAND_208[2:0];
  _RAND_209 = {1{`RANDOM}};
  io_readline_resp_6_REG = _RAND_209[2:0];
  _RAND_210 = {1{`RANDOM}};
  io_readline_resp_7_REG = _RAND_210[2:0];
  _RAND_211 = {1{`RANDOM}};
  io_read_error_delayed_0_0_REG_7 = _RAND_211[0:0];
  _RAND_212 = {1{`RANDOM}};
  io_read_error_delayed_0_0_REG_8 = _RAND_212[0:0];
  _RAND_213 = {1{`RANDOM}};
  io_read_error_delayed_0_0_REG_9 = _RAND_213[3:0];
  _RAND_214 = {1{`RANDOM}};
  io_read_error_delayed_0_0_REG_10 = _RAND_214[3:0];
  _RAND_215 = {1{`RANDOM}};
  io_read_error_delayed_0_0_REG_11 = _RAND_215[2:0];
  _RAND_216 = {1{`RANDOM}};
  io_read_error_delayed_0_0_REG_12 = _RAND_216[2:0];
  _RAND_217 = {1{`RANDOM}};
  io_read_error_delayed_0_0_REG_13 = _RAND_217[0:0];
  _RAND_218 = {1{`RANDOM}};
  io_read_error_delayed_1_0_REG_7 = _RAND_218[0:0];
  _RAND_219 = {1{`RANDOM}};
  io_read_error_delayed_1_0_REG_8 = _RAND_219[0:0];
  _RAND_220 = {1{`RANDOM}};
  io_read_error_delayed_1_0_REG_9 = _RAND_220[3:0];
  _RAND_221 = {1{`RANDOM}};
  io_read_error_delayed_1_0_REG_10 = _RAND_221[3:0];
  _RAND_222 = {1{`RANDOM}};
  io_read_error_delayed_1_0_REG_11 = _RAND_222[2:0];
  _RAND_223 = {1{`RANDOM}};
  io_read_error_delayed_1_0_REG_12 = _RAND_223[2:0];
  _RAND_224 = {1{`RANDOM}};
  io_read_error_delayed_1_0_REG_13 = _RAND_224[0:0];
  _RAND_225 = {1{`RANDOM}};
  io_readline_error_delayed_REG = _RAND_225[0:0];
  _RAND_226 = {1{`RANDOM}};
  io_readline_error_delayed_REG_1 = _RAND_226[0:0];
  _RAND_227 = {1{`RANDOM}};
  ecc_banks_0_0_io_wreq_valid_REG = _RAND_227[0:0];
  _RAND_228 = {1{`RANDOM}};
  x15 = _RAND_228[5:0];
  _RAND_229 = {1{`RANDOM}};
  x16 = _RAND_229[7:0];
  _RAND_230 = {1{`RANDOM}};
  ecc_banks_0_1_io_wreq_valid_REG = _RAND_230[0:0];
  _RAND_231 = {1{`RANDOM}};
  x15_1 = _RAND_231[5:0];
  _RAND_232 = {1{`RANDOM}};
  x16_1 = _RAND_232[7:0];
  _RAND_233 = {1{`RANDOM}};
  ecc_banks_0_2_io_wreq_valid_REG = _RAND_233[0:0];
  _RAND_234 = {1{`RANDOM}};
  x15_2 = _RAND_234[5:0];
  _RAND_235 = {1{`RANDOM}};
  x16_2 = _RAND_235[7:0];
  _RAND_236 = {1{`RANDOM}};
  ecc_banks_0_3_io_wreq_valid_REG = _RAND_236[0:0];
  _RAND_237 = {1{`RANDOM}};
  x15_3 = _RAND_237[5:0];
  _RAND_238 = {1{`RANDOM}};
  x16_3 = _RAND_238[7:0];
  _RAND_239 = {1{`RANDOM}};
  ecc_banks_0_4_io_wreq_valid_REG = _RAND_239[0:0];
  _RAND_240 = {1{`RANDOM}};
  x15_4 = _RAND_240[5:0];
  _RAND_241 = {1{`RANDOM}};
  x16_4 = _RAND_241[7:0];
  _RAND_242 = {1{`RANDOM}};
  ecc_banks_0_5_io_wreq_valid_REG = _RAND_242[0:0];
  _RAND_243 = {1{`RANDOM}};
  x15_5 = _RAND_243[5:0];
  _RAND_244 = {1{`RANDOM}};
  x16_5 = _RAND_244[7:0];
  _RAND_245 = {1{`RANDOM}};
  ecc_banks_0_6_io_wreq_valid_REG = _RAND_245[0:0];
  _RAND_246 = {1{`RANDOM}};
  x15_6 = _RAND_246[5:0];
  _RAND_247 = {1{`RANDOM}};
  x16_6 = _RAND_247[7:0];
  _RAND_248 = {1{`RANDOM}};
  ecc_banks_0_7_io_wreq_valid_REG = _RAND_248[0:0];
  _RAND_249 = {1{`RANDOM}};
  x15_7 = _RAND_249[5:0];
  _RAND_250 = {1{`RANDOM}};
  x16_7 = _RAND_250[7:0];
  _RAND_251 = {1{`RANDOM}};
  ecc_banks_1_0_io_wreq_valid_REG = _RAND_251[0:0];
  _RAND_252 = {1{`RANDOM}};
  x15_8 = _RAND_252[5:0];
  _RAND_253 = {1{`RANDOM}};
  x16_8 = _RAND_253[7:0];
  _RAND_254 = {1{`RANDOM}};
  ecc_banks_1_1_io_wreq_valid_REG = _RAND_254[0:0];
  _RAND_255 = {1{`RANDOM}};
  x15_9 = _RAND_255[5:0];
  _RAND_256 = {1{`RANDOM}};
  x16_9 = _RAND_256[7:0];
  _RAND_257 = {1{`RANDOM}};
  ecc_banks_1_2_io_wreq_valid_REG = _RAND_257[0:0];
  _RAND_258 = {1{`RANDOM}};
  x15_10 = _RAND_258[5:0];
  _RAND_259 = {1{`RANDOM}};
  x16_10 = _RAND_259[7:0];
  _RAND_260 = {1{`RANDOM}};
  ecc_banks_1_3_io_wreq_valid_REG = _RAND_260[0:0];
  _RAND_261 = {1{`RANDOM}};
  x15_11 = _RAND_261[5:0];
  _RAND_262 = {1{`RANDOM}};
  x16_11 = _RAND_262[7:0];
  _RAND_263 = {1{`RANDOM}};
  ecc_banks_1_4_io_wreq_valid_REG = _RAND_263[0:0];
  _RAND_264 = {1{`RANDOM}};
  x15_12 = _RAND_264[5:0];
  _RAND_265 = {1{`RANDOM}};
  x16_12 = _RAND_265[7:0];
  _RAND_266 = {1{`RANDOM}};
  ecc_banks_1_5_io_wreq_valid_REG = _RAND_266[0:0];
  _RAND_267 = {1{`RANDOM}};
  x15_13 = _RAND_267[5:0];
  _RAND_268 = {1{`RANDOM}};
  x16_13 = _RAND_268[7:0];
  _RAND_269 = {1{`RANDOM}};
  ecc_banks_1_6_io_wreq_valid_REG = _RAND_269[0:0];
  _RAND_270 = {1{`RANDOM}};
  x15_14 = _RAND_270[5:0];
  _RAND_271 = {1{`RANDOM}};
  x16_14 = _RAND_271[7:0];
  _RAND_272 = {1{`RANDOM}};
  ecc_banks_1_7_io_wreq_valid_REG = _RAND_272[0:0];
  _RAND_273 = {1{`RANDOM}};
  x15_15 = _RAND_273[5:0];
  _RAND_274 = {1{`RANDOM}};
  x16_15 = _RAND_274[7:0];
  _RAND_275 = {1{`RANDOM}};
  ecc_banks_2_0_io_wreq_valid_REG = _RAND_275[0:0];
  _RAND_276 = {1{`RANDOM}};
  x15_16 = _RAND_276[5:0];
  _RAND_277 = {1{`RANDOM}};
  x16_16 = _RAND_277[7:0];
  _RAND_278 = {1{`RANDOM}};
  ecc_banks_2_1_io_wreq_valid_REG = _RAND_278[0:0];
  _RAND_279 = {1{`RANDOM}};
  x15_17 = _RAND_279[5:0];
  _RAND_280 = {1{`RANDOM}};
  x16_17 = _RAND_280[7:0];
  _RAND_281 = {1{`RANDOM}};
  ecc_banks_2_2_io_wreq_valid_REG = _RAND_281[0:0];
  _RAND_282 = {1{`RANDOM}};
  x15_18 = _RAND_282[5:0];
  _RAND_283 = {1{`RANDOM}};
  x16_18 = _RAND_283[7:0];
  _RAND_284 = {1{`RANDOM}};
  ecc_banks_2_3_io_wreq_valid_REG = _RAND_284[0:0];
  _RAND_285 = {1{`RANDOM}};
  x15_19 = _RAND_285[5:0];
  _RAND_286 = {1{`RANDOM}};
  x16_19 = _RAND_286[7:0];
  _RAND_287 = {1{`RANDOM}};
  ecc_banks_2_4_io_wreq_valid_REG = _RAND_287[0:0];
  _RAND_288 = {1{`RANDOM}};
  x15_20 = _RAND_288[5:0];
  _RAND_289 = {1{`RANDOM}};
  x16_20 = _RAND_289[7:0];
  _RAND_290 = {1{`RANDOM}};
  ecc_banks_2_5_io_wreq_valid_REG = _RAND_290[0:0];
  _RAND_291 = {1{`RANDOM}};
  x15_21 = _RAND_291[5:0];
  _RAND_292 = {1{`RANDOM}};
  x16_21 = _RAND_292[7:0];
  _RAND_293 = {1{`RANDOM}};
  ecc_banks_2_6_io_wreq_valid_REG = _RAND_293[0:0];
  _RAND_294 = {1{`RANDOM}};
  x15_22 = _RAND_294[5:0];
  _RAND_295 = {1{`RANDOM}};
  x16_22 = _RAND_295[7:0];
  _RAND_296 = {1{`RANDOM}};
  ecc_banks_2_7_io_wreq_valid_REG = _RAND_296[0:0];
  _RAND_297 = {1{`RANDOM}};
  x15_23 = _RAND_297[5:0];
  _RAND_298 = {1{`RANDOM}};
  x16_23 = _RAND_298[7:0];
  _RAND_299 = {1{`RANDOM}};
  ecc_banks_3_0_io_wreq_valid_REG = _RAND_299[0:0];
  _RAND_300 = {1{`RANDOM}};
  x15_24 = _RAND_300[5:0];
  _RAND_301 = {1{`RANDOM}};
  x16_24 = _RAND_301[7:0];
  _RAND_302 = {1{`RANDOM}};
  ecc_banks_3_1_io_wreq_valid_REG = _RAND_302[0:0];
  _RAND_303 = {1{`RANDOM}};
  x15_25 = _RAND_303[5:0];
  _RAND_304 = {1{`RANDOM}};
  x16_25 = _RAND_304[7:0];
  _RAND_305 = {1{`RANDOM}};
  ecc_banks_3_2_io_wreq_valid_REG = _RAND_305[0:0];
  _RAND_306 = {1{`RANDOM}};
  x15_26 = _RAND_306[5:0];
  _RAND_307 = {1{`RANDOM}};
  x16_26 = _RAND_307[7:0];
  _RAND_308 = {1{`RANDOM}};
  ecc_banks_3_3_io_wreq_valid_REG = _RAND_308[0:0];
  _RAND_309 = {1{`RANDOM}};
  x15_27 = _RAND_309[5:0];
  _RAND_310 = {1{`RANDOM}};
  x16_27 = _RAND_310[7:0];
  _RAND_311 = {1{`RANDOM}};
  ecc_banks_3_4_io_wreq_valid_REG = _RAND_311[0:0];
  _RAND_312 = {1{`RANDOM}};
  x15_28 = _RAND_312[5:0];
  _RAND_313 = {1{`RANDOM}};
  x16_28 = _RAND_313[7:0];
  _RAND_314 = {1{`RANDOM}};
  ecc_banks_3_5_io_wreq_valid_REG = _RAND_314[0:0];
  _RAND_315 = {1{`RANDOM}};
  x15_29 = _RAND_315[5:0];
  _RAND_316 = {1{`RANDOM}};
  x16_29 = _RAND_316[7:0];
  _RAND_317 = {1{`RANDOM}};
  ecc_banks_3_6_io_wreq_valid_REG = _RAND_317[0:0];
  _RAND_318 = {1{`RANDOM}};
  x15_30 = _RAND_318[5:0];
  _RAND_319 = {1{`RANDOM}};
  x16_30 = _RAND_319[7:0];
  _RAND_320 = {1{`RANDOM}};
  ecc_banks_3_7_io_wreq_valid_REG = _RAND_320[0:0];
  _RAND_321 = {1{`RANDOM}};
  x15_31 = _RAND_321[5:0];
  _RAND_322 = {1{`RANDOM}};
  x16_31 = _RAND_322[7:0];
  _RAND_323 = {1{`RANDOM}};
  ecc_banks_4_0_io_wreq_valid_REG = _RAND_323[0:0];
  _RAND_324 = {1{`RANDOM}};
  x15_32 = _RAND_324[5:0];
  _RAND_325 = {1{`RANDOM}};
  x16_32 = _RAND_325[7:0];
  _RAND_326 = {1{`RANDOM}};
  ecc_banks_4_1_io_wreq_valid_REG = _RAND_326[0:0];
  _RAND_327 = {1{`RANDOM}};
  x15_33 = _RAND_327[5:0];
  _RAND_328 = {1{`RANDOM}};
  x16_33 = _RAND_328[7:0];
  _RAND_329 = {1{`RANDOM}};
  ecc_banks_4_2_io_wreq_valid_REG = _RAND_329[0:0];
  _RAND_330 = {1{`RANDOM}};
  x15_34 = _RAND_330[5:0];
  _RAND_331 = {1{`RANDOM}};
  x16_34 = _RAND_331[7:0];
  _RAND_332 = {1{`RANDOM}};
  ecc_banks_4_3_io_wreq_valid_REG = _RAND_332[0:0];
  _RAND_333 = {1{`RANDOM}};
  x15_35 = _RAND_333[5:0];
  _RAND_334 = {1{`RANDOM}};
  x16_35 = _RAND_334[7:0];
  _RAND_335 = {1{`RANDOM}};
  ecc_banks_4_4_io_wreq_valid_REG = _RAND_335[0:0];
  _RAND_336 = {1{`RANDOM}};
  x15_36 = _RAND_336[5:0];
  _RAND_337 = {1{`RANDOM}};
  x16_36 = _RAND_337[7:0];
  _RAND_338 = {1{`RANDOM}};
  ecc_banks_4_5_io_wreq_valid_REG = _RAND_338[0:0];
  _RAND_339 = {1{`RANDOM}};
  x15_37 = _RAND_339[5:0];
  _RAND_340 = {1{`RANDOM}};
  x16_37 = _RAND_340[7:0];
  _RAND_341 = {1{`RANDOM}};
  ecc_banks_4_6_io_wreq_valid_REG = _RAND_341[0:0];
  _RAND_342 = {1{`RANDOM}};
  x15_38 = _RAND_342[5:0];
  _RAND_343 = {1{`RANDOM}};
  x16_38 = _RAND_343[7:0];
  _RAND_344 = {1{`RANDOM}};
  ecc_banks_4_7_io_wreq_valid_REG = _RAND_344[0:0];
  _RAND_345 = {1{`RANDOM}};
  x15_39 = _RAND_345[5:0];
  _RAND_346 = {1{`RANDOM}};
  x16_39 = _RAND_346[7:0];
  _RAND_347 = {1{`RANDOM}};
  ecc_banks_5_0_io_wreq_valid_REG = _RAND_347[0:0];
  _RAND_348 = {1{`RANDOM}};
  x15_40 = _RAND_348[5:0];
  _RAND_349 = {1{`RANDOM}};
  x16_40 = _RAND_349[7:0];
  _RAND_350 = {1{`RANDOM}};
  ecc_banks_5_1_io_wreq_valid_REG = _RAND_350[0:0];
  _RAND_351 = {1{`RANDOM}};
  x15_41 = _RAND_351[5:0];
  _RAND_352 = {1{`RANDOM}};
  x16_41 = _RAND_352[7:0];
  _RAND_353 = {1{`RANDOM}};
  ecc_banks_5_2_io_wreq_valid_REG = _RAND_353[0:0];
  _RAND_354 = {1{`RANDOM}};
  x15_42 = _RAND_354[5:0];
  _RAND_355 = {1{`RANDOM}};
  x16_42 = _RAND_355[7:0];
  _RAND_356 = {1{`RANDOM}};
  ecc_banks_5_3_io_wreq_valid_REG = _RAND_356[0:0];
  _RAND_357 = {1{`RANDOM}};
  x15_43 = _RAND_357[5:0];
  _RAND_358 = {1{`RANDOM}};
  x16_43 = _RAND_358[7:0];
  _RAND_359 = {1{`RANDOM}};
  ecc_banks_5_4_io_wreq_valid_REG = _RAND_359[0:0];
  _RAND_360 = {1{`RANDOM}};
  x15_44 = _RAND_360[5:0];
  _RAND_361 = {1{`RANDOM}};
  x16_44 = _RAND_361[7:0];
  _RAND_362 = {1{`RANDOM}};
  ecc_banks_5_5_io_wreq_valid_REG = _RAND_362[0:0];
  _RAND_363 = {1{`RANDOM}};
  x15_45 = _RAND_363[5:0];
  _RAND_364 = {1{`RANDOM}};
  x16_45 = _RAND_364[7:0];
  _RAND_365 = {1{`RANDOM}};
  ecc_banks_5_6_io_wreq_valid_REG = _RAND_365[0:0];
  _RAND_366 = {1{`RANDOM}};
  x15_46 = _RAND_366[5:0];
  _RAND_367 = {1{`RANDOM}};
  x16_46 = _RAND_367[7:0];
  _RAND_368 = {1{`RANDOM}};
  ecc_banks_5_7_io_wreq_valid_REG = _RAND_368[0:0];
  _RAND_369 = {1{`RANDOM}};
  x15_47 = _RAND_369[5:0];
  _RAND_370 = {1{`RANDOM}};
  x16_47 = _RAND_370[7:0];
  _RAND_371 = {1{`RANDOM}};
  ecc_banks_6_0_io_wreq_valid_REG = _RAND_371[0:0];
  _RAND_372 = {1{`RANDOM}};
  x15_48 = _RAND_372[5:0];
  _RAND_373 = {1{`RANDOM}};
  x16_48 = _RAND_373[7:0];
  _RAND_374 = {1{`RANDOM}};
  ecc_banks_6_1_io_wreq_valid_REG = _RAND_374[0:0];
  _RAND_375 = {1{`RANDOM}};
  x15_49 = _RAND_375[5:0];
  _RAND_376 = {1{`RANDOM}};
  x16_49 = _RAND_376[7:0];
  _RAND_377 = {1{`RANDOM}};
  ecc_banks_6_2_io_wreq_valid_REG = _RAND_377[0:0];
  _RAND_378 = {1{`RANDOM}};
  x15_50 = _RAND_378[5:0];
  _RAND_379 = {1{`RANDOM}};
  x16_50 = _RAND_379[7:0];
  _RAND_380 = {1{`RANDOM}};
  ecc_banks_6_3_io_wreq_valid_REG = _RAND_380[0:0];
  _RAND_381 = {1{`RANDOM}};
  x15_51 = _RAND_381[5:0];
  _RAND_382 = {1{`RANDOM}};
  x16_51 = _RAND_382[7:0];
  _RAND_383 = {1{`RANDOM}};
  ecc_banks_6_4_io_wreq_valid_REG = _RAND_383[0:0];
  _RAND_384 = {1{`RANDOM}};
  x15_52 = _RAND_384[5:0];
  _RAND_385 = {1{`RANDOM}};
  x16_52 = _RAND_385[7:0];
  _RAND_386 = {1{`RANDOM}};
  ecc_banks_6_5_io_wreq_valid_REG = _RAND_386[0:0];
  _RAND_387 = {1{`RANDOM}};
  x15_53 = _RAND_387[5:0];
  _RAND_388 = {1{`RANDOM}};
  x16_53 = _RAND_388[7:0];
  _RAND_389 = {1{`RANDOM}};
  ecc_banks_6_6_io_wreq_valid_REG = _RAND_389[0:0];
  _RAND_390 = {1{`RANDOM}};
  x15_54 = _RAND_390[5:0];
  _RAND_391 = {1{`RANDOM}};
  x16_54 = _RAND_391[7:0];
  _RAND_392 = {1{`RANDOM}};
  ecc_banks_6_7_io_wreq_valid_REG = _RAND_392[0:0];
  _RAND_393 = {1{`RANDOM}};
  x15_55 = _RAND_393[5:0];
  _RAND_394 = {1{`RANDOM}};
  x16_55 = _RAND_394[7:0];
  _RAND_395 = {1{`RANDOM}};
  ecc_banks_7_0_io_wreq_valid_REG = _RAND_395[0:0];
  _RAND_396 = {1{`RANDOM}};
  x15_56 = _RAND_396[5:0];
  _RAND_397 = {1{`RANDOM}};
  x16_56 = _RAND_397[7:0];
  _RAND_398 = {1{`RANDOM}};
  ecc_banks_7_1_io_wreq_valid_REG = _RAND_398[0:0];
  _RAND_399 = {1{`RANDOM}};
  x15_57 = _RAND_399[5:0];
  _RAND_400 = {1{`RANDOM}};
  x16_57 = _RAND_400[7:0];
  _RAND_401 = {1{`RANDOM}};
  ecc_banks_7_2_io_wreq_valid_REG = _RAND_401[0:0];
  _RAND_402 = {1{`RANDOM}};
  x15_58 = _RAND_402[5:0];
  _RAND_403 = {1{`RANDOM}};
  x16_58 = _RAND_403[7:0];
  _RAND_404 = {1{`RANDOM}};
  ecc_banks_7_3_io_wreq_valid_REG = _RAND_404[0:0];
  _RAND_405 = {1{`RANDOM}};
  x15_59 = _RAND_405[5:0];
  _RAND_406 = {1{`RANDOM}};
  x16_59 = _RAND_406[7:0];
  _RAND_407 = {1{`RANDOM}};
  ecc_banks_7_4_io_wreq_valid_REG = _RAND_407[0:0];
  _RAND_408 = {1{`RANDOM}};
  x15_60 = _RAND_408[5:0];
  _RAND_409 = {1{`RANDOM}};
  x16_60 = _RAND_409[7:0];
  _RAND_410 = {1{`RANDOM}};
  ecc_banks_7_5_io_wreq_valid_REG = _RAND_410[0:0];
  _RAND_411 = {1{`RANDOM}};
  x15_61 = _RAND_411[5:0];
  _RAND_412 = {1{`RANDOM}};
  x16_61 = _RAND_412[7:0];
  _RAND_413 = {1{`RANDOM}};
  ecc_banks_7_6_io_wreq_valid_REG = _RAND_413[0:0];
  _RAND_414 = {1{`RANDOM}};
  x15_62 = _RAND_414[5:0];
  _RAND_415 = {1{`RANDOM}};
  x16_62 = _RAND_415[7:0];
  _RAND_416 = {1{`RANDOM}};
  ecc_banks_7_7_io_wreq_valid_REG = _RAND_416[0:0];
  _RAND_417 = {1{`RANDOM}};
  x15_63 = _RAND_417[5:0];
  _RAND_418 = {1{`RANDOM}};
  x16_63 = _RAND_418[7:0];
  _RAND_419 = {1{`RANDOM}};
  io_cacheOp_resp_valid_REG = _RAND_419[0:0];
  _RAND_420 = {1{`RANDOM}};
  io_cacheOp_resp_bits_read_data_vec_0_REG = _RAND_420[4:0];
  _RAND_421 = {1{`RANDOM}};
  eccReadResult_0_REG = _RAND_421[4:0];
  _RAND_422 = {1{`RANDOM}};
  io_cacheOp_resp_bits_read_data_vec_1_REG = _RAND_422[4:0];
  _RAND_423 = {1{`RANDOM}};
  eccReadResult_1_REG = _RAND_423[4:0];
  _RAND_424 = {1{`RANDOM}};
  io_cacheOp_resp_bits_read_data_vec_2_REG = _RAND_424[4:0];
  _RAND_425 = {1{`RANDOM}};
  eccReadResult_2_REG = _RAND_425[4:0];
  _RAND_426 = {1{`RANDOM}};
  io_cacheOp_resp_bits_read_data_vec_3_REG = _RAND_426[4:0];
  _RAND_427 = {1{`RANDOM}};
  eccReadResult_3_REG = _RAND_427[4:0];
  _RAND_428 = {1{`RANDOM}};
  io_cacheOp_resp_bits_read_data_vec_4_REG = _RAND_428[4:0];
  _RAND_429 = {1{`RANDOM}};
  eccReadResult_4_REG = _RAND_429[4:0];
  _RAND_430 = {1{`RANDOM}};
  io_cacheOp_resp_bits_read_data_vec_5_REG = _RAND_430[4:0];
  _RAND_431 = {1{`RANDOM}};
  eccReadResult_5_REG = _RAND_431[4:0];
  _RAND_432 = {1{`RANDOM}};
  io_cacheOp_resp_bits_read_data_vec_6_REG = _RAND_432[4:0];
  _RAND_433 = {1{`RANDOM}};
  eccReadResult_6_REG = _RAND_433[4:0];
  _RAND_434 = {1{`RANDOM}};
  io_cacheOp_resp_bits_read_data_vec_7_REG = _RAND_434[4:0];
  _RAND_435 = {1{`RANDOM}};
  eccReadResult_7_REG = _RAND_435[4:0];
  _RAND_436 = {2{`RANDOM}};
  io_cacheOp_resp_bits_read_data_ecc_REG = _RAND_436[63:0];
  _RAND_437 = {2{`RANDOM}};
  cnt = _RAND_437[63:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    cnt = 64'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

