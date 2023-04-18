module Arbiter_5(
  output       io_in_0_ready,
  input        io_in_0_valid,
  input  [5:0] io_in_0_bits_0_vSetIdx_0,
  input  [5:0] io_in_0_bits_1_vSetIdx_0,
  input  [5:0] io_in_0_bits_2_vSetIdx_0,
  input  [5:0] io_in_0_bits_3_vSetIdx_0,
  output       io_in_1_ready,
  input        io_in_1_valid,
  input        io_in_1_bits_0_isDoubleLine,
  input  [5:0] io_in_1_bits_0_vSetIdx_0,
  input  [5:0] io_in_1_bits_0_vSetIdx_1,
  input        io_in_1_bits_1_isDoubleLine,
  input  [5:0] io_in_1_bits_1_vSetIdx_0,
  input  [5:0] io_in_1_bits_1_vSetIdx_1,
  input        io_in_1_bits_2_isDoubleLine,
  input  [5:0] io_in_1_bits_2_vSetIdx_0,
  input  [5:0] io_in_1_bits_2_vSetIdx_1,
  input        io_in_1_bits_3_isDoubleLine,
  input  [5:0] io_in_1_bits_3_vSetIdx_0,
  input  [5:0] io_in_1_bits_3_vSetIdx_1,
  input        io_out_ready,
  output       io_out_valid,
  output       io_out_bits_0_isDoubleLine,
  output [5:0] io_out_bits_0_vSetIdx_0,
  output [5:0] io_out_bits_0_vSetIdx_1,
  output       io_out_bits_1_isDoubleLine,
  output [5:0] io_out_bits_1_vSetIdx_0,
  output [5:0] io_out_bits_1_vSetIdx_1,
  output       io_out_bits_2_isDoubleLine,
  output [5:0] io_out_bits_2_vSetIdx_0,
  output [5:0] io_out_bits_2_vSetIdx_1,
  output       io_out_bits_3_isDoubleLine,
  output [5:0] io_out_bits_3_vSetIdx_0,
  output [5:0] io_out_bits_3_vSetIdx_1
);
  wire  grant_1 = ~io_in_0_valid; // @[Arbiter.scala 46:78]
  assign io_in_0_ready = io_out_ready; // @[Arbiter.scala 149:19]
  assign io_in_1_ready = grant_1 & io_out_ready; // @[Arbiter.scala 149:19]
  assign io_out_valid = ~grant_1 | io_in_1_valid; // @[Arbiter.scala 150:31]
  assign io_out_bits_0_isDoubleLine = io_in_0_valid ? 1'h0 : io_in_1_bits_0_isDoubleLine; // @[Arbiter.scala 139:15 141:26 143:19]
  assign io_out_bits_0_vSetIdx_0 = io_in_0_valid ? io_in_0_bits_0_vSetIdx_0 : io_in_1_bits_0_vSetIdx_0; // @[Arbiter.scala 139:15 141:26 143:19]
  assign io_out_bits_0_vSetIdx_1 = io_in_0_valid ? 6'h0 : io_in_1_bits_0_vSetIdx_1; // @[Arbiter.scala 139:15 141:26 143:19]
  assign io_out_bits_1_isDoubleLine = io_in_0_valid ? 1'h0 : io_in_1_bits_1_isDoubleLine; // @[Arbiter.scala 139:15 141:26 143:19]
  assign io_out_bits_1_vSetIdx_0 = io_in_0_valid ? io_in_0_bits_1_vSetIdx_0 : io_in_1_bits_1_vSetIdx_0; // @[Arbiter.scala 139:15 141:26 143:19]
  assign io_out_bits_1_vSetIdx_1 = io_in_0_valid ? 6'h0 : io_in_1_bits_1_vSetIdx_1; // @[Arbiter.scala 139:15 141:26 143:19]
  assign io_out_bits_2_isDoubleLine = io_in_0_valid ? 1'h0 : io_in_1_bits_2_isDoubleLine; // @[Arbiter.scala 139:15 141:26 143:19]
  assign io_out_bits_2_vSetIdx_0 = io_in_0_valid ? io_in_0_bits_2_vSetIdx_0 : io_in_1_bits_2_vSetIdx_0; // @[Arbiter.scala 139:15 141:26 143:19]
  assign io_out_bits_2_vSetIdx_1 = io_in_0_valid ? 6'h0 : io_in_1_bits_2_vSetIdx_1; // @[Arbiter.scala 139:15 141:26 143:19]
  assign io_out_bits_3_isDoubleLine = io_in_0_valid ? 1'h0 : io_in_1_bits_3_isDoubleLine; // @[Arbiter.scala 139:15 141:26 143:19]
  assign io_out_bits_3_vSetIdx_0 = io_in_0_valid ? io_in_0_bits_3_vSetIdx_0 : io_in_1_bits_3_vSetIdx_0; // @[Arbiter.scala 139:15 141:26 143:19]
  assign io_out_bits_3_vSetIdx_1 = io_in_0_valid ? 6'h0 : io_in_1_bits_3_vSetIdx_1; // @[Arbiter.scala 139:15 141:26 143:19]
endmodule

