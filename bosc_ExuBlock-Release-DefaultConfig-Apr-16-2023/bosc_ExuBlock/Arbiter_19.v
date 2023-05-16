module Arbiter_19(
  output        io_in_0_ready,
  input         io_in_0_valid,
  input         io_in_0_bits_uop_cf_pd_isRVC,
  input  [1:0]  io_in_0_bits_uop_cf_pd_brType,
  input         io_in_0_bits_uop_cf_pd_isCall,
  input         io_in_0_bits_uop_cf_pd_isRet,
  input         io_in_0_bits_uop_ctrl_rfWen,
  input         io_in_0_bits_uop_ctrl_fpWen,
  input  [19:0] io_in_0_bits_uop_ctrl_imm,
  input  [5:0]  io_in_0_bits_uop_pdest,
  input         io_in_0_bits_uop_robIdx_flag,
  input  [4:0]  io_in_0_bits_uop_robIdx_value,
  output        io_in_1_ready,
  input         io_in_1_valid,
  input         io_in_1_bits_uop_cf_exceptionVec_2,
  input         io_in_1_bits_uop_cf_exceptionVec_3,
  input         io_in_1_bits_uop_cf_exceptionVec_8,
  input         io_in_1_bits_uop_cf_exceptionVec_9,
  input         io_in_1_bits_uop_cf_exceptionVec_11,
  input         io_in_1_bits_uop_cf_pd_isRVC,
  input  [1:0]  io_in_1_bits_uop_cf_pd_brType,
  input         io_in_1_bits_uop_cf_pd_isCall,
  input         io_in_1_bits_uop_cf_pd_isRet,
  input         io_in_1_bits_uop_ctrl_rfWen,
  input         io_in_1_bits_uop_ctrl_fpWen,
  input         io_in_1_bits_uop_ctrl_flushPipe,
  input  [19:0] io_in_1_bits_uop_ctrl_imm,
  input  [5:0]  io_in_1_bits_uop_pdest,
  input         io_in_1_bits_uop_robIdx_flag,
  input  [4:0]  io_in_1_bits_uop_robIdx_value,
  input         io_in_2_valid,
  input         io_in_2_bits_uop_cf_exceptionVec_2,
  input         io_in_2_bits_uop_cf_pd_isRVC,
  input  [1:0]  io_in_2_bits_uop_cf_pd_brType,
  input         io_in_2_bits_uop_cf_pd_isCall,
  input         io_in_2_bits_uop_cf_pd_isRet,
  input         io_in_2_bits_uop_ctrl_rfWen,
  input         io_in_2_bits_uop_ctrl_fpWen,
  input  [19:0] io_in_2_bits_uop_ctrl_imm,
  input  [5:0]  io_in_2_bits_uop_pdest,
  input         io_in_2_bits_uop_robIdx_flag,
  input  [4:0]  io_in_2_bits_uop_robIdx_value,
  output        io_in_3_ready,
  input         io_in_3_valid,
  input         io_in_3_bits_uop_cf_pd_isRVC,
  input  [1:0]  io_in_3_bits_uop_cf_pd_brType,
  input         io_in_3_bits_uop_cf_pd_isCall,
  input         io_in_3_bits_uop_cf_pd_isRet,
  input         io_in_3_bits_uop_ctrl_rfWen,
  input         io_in_3_bits_uop_ctrl_fpWen,
  input  [19:0] io_in_3_bits_uop_ctrl_imm,
  input  [5:0]  io_in_3_bits_uop_pdest,
  input         io_in_3_bits_uop_robIdx_flag,
  input  [4:0]  io_in_3_bits_uop_robIdx_value,
  input         io_out_ready,
  output        io_out_valid,
  output        io_out_bits_uop_cf_exceptionVec_2,
  output        io_out_bits_uop_cf_exceptionVec_3,
  output        io_out_bits_uop_cf_exceptionVec_8,
  output        io_out_bits_uop_cf_exceptionVec_9,
  output        io_out_bits_uop_cf_exceptionVec_11,
  output        io_out_bits_uop_cf_pd_isRVC,
  output [1:0]  io_out_bits_uop_cf_pd_brType,
  output        io_out_bits_uop_cf_pd_isCall,
  output        io_out_bits_uop_cf_pd_isRet,
  output        io_out_bits_uop_ctrl_rfWen,
  output        io_out_bits_uop_ctrl_fpWen,
  output        io_out_bits_uop_ctrl_flushPipe,
  output [19:0] io_out_bits_uop_ctrl_imm,
  output [5:0]  io_out_bits_uop_pdest,
  output        io_out_bits_uop_robIdx_flag,
  output [4:0]  io_out_bits_uop_robIdx_value
);
  wire  _GEN_6 = io_in_2_valid & io_in_2_bits_uop_cf_exceptionVec_2; // @[Arbiter.scala 139:15 141:26 143:19]
  wire  _GEN_33 = io_in_2_valid ? io_in_2_bits_uop_cf_pd_isRVC : io_in_3_bits_uop_cf_pd_isRVC; // @[Arbiter.scala 139:15 141:26 143:19]
  wire [1:0] _GEN_34 = io_in_2_valid ? io_in_2_bits_uop_cf_pd_brType : io_in_3_bits_uop_cf_pd_brType; // @[Arbiter.scala 139:15 141:26 143:19]
  wire  _GEN_35 = io_in_2_valid ? io_in_2_bits_uop_cf_pd_isCall : io_in_3_bits_uop_cf_pd_isCall; // @[Arbiter.scala 139:15 141:26 143:19]
  wire  _GEN_36 = io_in_2_valid ? io_in_2_bits_uop_cf_pd_isRet : io_in_3_bits_uop_cf_pd_isRet; // @[Arbiter.scala 139:15 141:26 143:19]
  wire  _GEN_58 = io_in_2_valid ? io_in_2_bits_uop_ctrl_rfWen : io_in_3_bits_uop_ctrl_rfWen; // @[Arbiter.scala 139:15 141:26 143:19]
  wire  _GEN_59 = io_in_2_valid ? io_in_2_bits_uop_ctrl_fpWen : io_in_3_bits_uop_ctrl_fpWen; // @[Arbiter.scala 139:15 141:26 143:19]
  wire [19:0] _GEN_65 = io_in_2_valid ? io_in_2_bits_uop_ctrl_imm : io_in_3_bits_uop_ctrl_imm; // @[Arbiter.scala 139:15 141:26 143:19]
  wire [5:0] _GEN_90 = io_in_2_valid ? io_in_2_bits_uop_pdest : io_in_3_bits_uop_pdest; // @[Arbiter.scala 139:15 141:26 143:19]
  wire  _GEN_92 = io_in_2_valid ? io_in_2_bits_uop_robIdx_flag : io_in_3_bits_uop_robIdx_flag; // @[Arbiter.scala 139:15 141:26 143:19]
  wire [4:0] _GEN_93 = io_in_2_valid ? io_in_2_bits_uop_robIdx_value : io_in_3_bits_uop_robIdx_value; // @[Arbiter.scala 139:15 141:26 143:19]
  wire  _GEN_197 = io_in_1_valid ? io_in_1_bits_uop_cf_exceptionVec_2 : _GEN_6; // @[Arbiter.scala 141:26 143:19]
  wire  _GEN_224 = io_in_1_valid ? io_in_1_bits_uop_cf_pd_isRVC : _GEN_33; // @[Arbiter.scala 141:26 143:19]
  wire [1:0] _GEN_225 = io_in_1_valid ? io_in_1_bits_uop_cf_pd_brType : _GEN_34; // @[Arbiter.scala 141:26 143:19]
  wire  _GEN_226 = io_in_1_valid ? io_in_1_bits_uop_cf_pd_isCall : _GEN_35; // @[Arbiter.scala 141:26 143:19]
  wire  _GEN_227 = io_in_1_valid ? io_in_1_bits_uop_cf_pd_isRet : _GEN_36; // @[Arbiter.scala 141:26 143:19]
  wire  _GEN_249 = io_in_1_valid ? io_in_1_bits_uop_ctrl_rfWen : _GEN_58; // @[Arbiter.scala 141:26 143:19]
  wire  _GEN_250 = io_in_1_valid ? io_in_1_bits_uop_ctrl_fpWen : _GEN_59; // @[Arbiter.scala 141:26 143:19]
  wire [19:0] _GEN_256 = io_in_1_valid ? io_in_1_bits_uop_ctrl_imm : _GEN_65; // @[Arbiter.scala 141:26 143:19]
  wire [5:0] _GEN_281 = io_in_1_valid ? io_in_1_bits_uop_pdest : _GEN_90; // @[Arbiter.scala 141:26 143:19]
  wire  _GEN_283 = io_in_1_valid ? io_in_1_bits_uop_robIdx_flag : _GEN_92; // @[Arbiter.scala 141:26 143:19]
  wire [4:0] _GEN_284 = io_in_1_valid ? io_in_1_bits_uop_robIdx_value : _GEN_93; // @[Arbiter.scala 141:26 143:19]
  wire  grant_1 = ~io_in_0_valid; // @[Arbiter.scala 46:78]
  wire  grant_3 = ~(io_in_0_valid | io_in_1_valid | io_in_2_valid); // @[Arbiter.scala 46:78]
  assign io_in_0_ready = io_out_ready; // @[Arbiter.scala 149:19]
  assign io_in_1_ready = grant_1 & io_out_ready; // @[Arbiter.scala 149:19]
  assign io_in_3_ready = grant_3 & io_out_ready; // @[Arbiter.scala 149:19]
  assign io_out_valid = ~grant_3 | io_in_3_valid; // @[Arbiter.scala 150:31]
  assign io_out_bits_uop_cf_exceptionVec_2 = io_in_0_valid ? 1'h0 : _GEN_197; // @[Arbiter.scala 141:26 143:19]
  assign io_out_bits_uop_cf_exceptionVec_3 = io_in_0_valid ? 1'h0 : io_in_1_valid & io_in_1_bits_uop_cf_exceptionVec_3; // @[Arbiter.scala 141:26 143:19]
  assign io_out_bits_uop_cf_exceptionVec_8 = io_in_0_valid ? 1'h0 : io_in_1_valid & io_in_1_bits_uop_cf_exceptionVec_8; // @[Arbiter.scala 141:26 143:19]
  assign io_out_bits_uop_cf_exceptionVec_9 = io_in_0_valid ? 1'h0 : io_in_1_valid & io_in_1_bits_uop_cf_exceptionVec_9; // @[Arbiter.scala 141:26 143:19]
  assign io_out_bits_uop_cf_exceptionVec_11 = io_in_0_valid ? 1'h0 : io_in_1_valid & io_in_1_bits_uop_cf_exceptionVec_11
    ; // @[Arbiter.scala 141:26 143:19]
  assign io_out_bits_uop_cf_pd_isRVC = io_in_0_valid ? io_in_0_bits_uop_cf_pd_isRVC : _GEN_224; // @[Arbiter.scala 141:26 143:19]
  assign io_out_bits_uop_cf_pd_brType = io_in_0_valid ? io_in_0_bits_uop_cf_pd_brType : _GEN_225; // @[Arbiter.scala 141:26 143:19]
  assign io_out_bits_uop_cf_pd_isCall = io_in_0_valid ? io_in_0_bits_uop_cf_pd_isCall : _GEN_226; // @[Arbiter.scala 141:26 143:19]
  assign io_out_bits_uop_cf_pd_isRet = io_in_0_valid ? io_in_0_bits_uop_cf_pd_isRet : _GEN_227; // @[Arbiter.scala 141:26 143:19]
  assign io_out_bits_uop_ctrl_rfWen = io_in_0_valid ? io_in_0_bits_uop_ctrl_rfWen : _GEN_249; // @[Arbiter.scala 141:26 143:19]
  assign io_out_bits_uop_ctrl_fpWen = io_in_0_valid ? io_in_0_bits_uop_ctrl_fpWen : _GEN_250; // @[Arbiter.scala 141:26 143:19]
  assign io_out_bits_uop_ctrl_flushPipe = io_in_0_valid ? 1'h0 : io_in_1_valid & io_in_1_bits_uop_ctrl_flushPipe; // @[Arbiter.scala 141:26 143:19]
  assign io_out_bits_uop_ctrl_imm = io_in_0_valid ? io_in_0_bits_uop_ctrl_imm : _GEN_256; // @[Arbiter.scala 141:26 143:19]
  assign io_out_bits_uop_pdest = io_in_0_valid ? io_in_0_bits_uop_pdest : _GEN_281; // @[Arbiter.scala 141:26 143:19]
  assign io_out_bits_uop_robIdx_flag = io_in_0_valid ? io_in_0_bits_uop_robIdx_flag : _GEN_283; // @[Arbiter.scala 141:26 143:19]
  assign io_out_bits_uop_robIdx_value = io_in_0_valid ? io_in_0_bits_uop_robIdx_value : _GEN_284; // @[Arbiter.scala 141:26 143:19]
endmodule

