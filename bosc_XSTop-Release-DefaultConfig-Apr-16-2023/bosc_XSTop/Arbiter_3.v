module Arbiter_3(
  output        io_in_0_ready,
  input         io_in_0_valid,
  input  [35:0] io_in_0_bits_paddr,
  input  [38:0] io_in_0_bits_vaddr,
  input  [2:0]  io_in_0_bits_param,
  input         io_in_0_bits_voluntary,
  input         io_in_0_bits_needData,
  input  [7:0]  io_in_0_bits_waymask,
  input  [4:0]  io_in_0_bits_id,
  output        io_in_1_ready,
  input         io_in_1_valid,
  input  [35:0] io_in_1_bits_paddr,
  input  [38:0] io_in_1_bits_vaddr,
  input  [2:0]  io_in_1_bits_param,
  input         io_in_1_bits_voluntary,
  input         io_in_1_bits_needData,
  input  [7:0]  io_in_1_bits_waymask,
  input  [4:0]  io_in_1_bits_id,
  input         io_out_ready,
  output        io_out_valid,
  output [35:0] io_out_bits_paddr,
  output [38:0] io_out_bits_vaddr,
  output [2:0]  io_out_bits_param,
  output        io_out_bits_voluntary,
  output        io_out_bits_needData,
  output [7:0]  io_out_bits_waymask,
  output [4:0]  io_out_bits_id
);
  wire  grant_1 = ~io_in_0_valid; // @[Arbiter.scala 46:78]
  assign io_in_0_ready = io_out_ready; // @[Arbiter.scala 149:19]
  assign io_in_1_ready = grant_1 & io_out_ready; // @[Arbiter.scala 149:19]
  assign io_out_valid = ~grant_1 | io_in_1_valid; // @[Arbiter.scala 150:31]
  assign io_out_bits_paddr = io_in_0_valid ? io_in_0_bits_paddr : io_in_1_bits_paddr; // @[Arbiter.scala 139:15 141:26 143:19]
  assign io_out_bits_vaddr = io_in_0_valid ? io_in_0_bits_vaddr : io_in_1_bits_vaddr; // @[Arbiter.scala 139:15 141:26 143:19]
  assign io_out_bits_param = io_in_0_valid ? io_in_0_bits_param : io_in_1_bits_param; // @[Arbiter.scala 139:15 141:26 143:19]
  assign io_out_bits_voluntary = io_in_0_valid ? io_in_0_bits_voluntary : io_in_1_bits_voluntary; // @[Arbiter.scala 139:15 141:26 143:19]
  assign io_out_bits_needData = io_in_0_valid ? io_in_0_bits_needData : io_in_1_bits_needData; // @[Arbiter.scala 139:15 141:26 143:19]
  assign io_out_bits_waymask = io_in_0_valid ? io_in_0_bits_waymask : io_in_1_bits_waymask; // @[Arbiter.scala 139:15 141:26 143:19]
  assign io_out_bits_id = io_in_0_valid ? io_in_0_bits_id : io_in_1_bits_id; // @[Arbiter.scala 139:15 141:26 143:19]
endmodule

