module Arbiter_10(
  output        io_in_0_ready,
  input         io_in_0_valid,
  input  [26:0] io_in_0_bits_entry_tag,
  input  [15:0] io_in_0_bits_entry_asid,
  input  [23:0] io_in_0_bits_entry_ppn,
  input         io_in_0_bits_entry_perm_d,
  input         io_in_0_bits_entry_perm_a,
  input         io_in_0_bits_entry_perm_g,
  input         io_in_0_bits_entry_perm_u,
  input         io_in_0_bits_entry_perm_x,
  input         io_in_0_bits_entry_perm_w,
  input         io_in_0_bits_entry_perm_r,
  input  [1:0]  io_in_0_bits_entry_level,
  input         io_in_0_bits_pf,
  output        io_in_1_ready,
  input         io_in_1_valid,
  input  [26:0] io_in_1_bits_entry_tag,
  input  [15:0] io_in_1_bits_entry_asid,
  input  [23:0] io_in_1_bits_entry_ppn,
  input         io_in_1_bits_entry_perm_d,
  input         io_in_1_bits_entry_perm_a,
  input         io_in_1_bits_entry_perm_g,
  input         io_in_1_bits_entry_perm_u,
  input         io_in_1_bits_entry_perm_x,
  input         io_in_1_bits_entry_perm_w,
  input         io_in_1_bits_entry_perm_r,
  input  [1:0]  io_in_1_bits_entry_level,
  input         io_in_1_bits_pf,
  input         io_in_1_bits_af,
  output        io_in_2_ready,
  input         io_in_2_valid,
  input  [26:0] io_in_2_bits_entry_tag,
  input  [15:0] io_in_2_bits_entry_asid,
  input  [23:0] io_in_2_bits_entry_ppn,
  input         io_in_2_bits_entry_perm_d,
  input         io_in_2_bits_entry_perm_a,
  input         io_in_2_bits_entry_perm_g,
  input         io_in_2_bits_entry_perm_u,
  input         io_in_2_bits_entry_perm_x,
  input         io_in_2_bits_entry_perm_w,
  input         io_in_2_bits_entry_perm_r,
  input         io_in_2_bits_pf,
  input         io_in_2_bits_af,
  input         io_out_ready,
  output        io_out_valid,
  output [26:0] io_out_bits_entry_tag,
  output [15:0] io_out_bits_entry_asid,
  output [23:0] io_out_bits_entry_ppn,
  output        io_out_bits_entry_perm_d,
  output        io_out_bits_entry_perm_a,
  output        io_out_bits_entry_perm_g,
  output        io_out_bits_entry_perm_u,
  output        io_out_bits_entry_perm_x,
  output        io_out_bits_entry_perm_w,
  output        io_out_bits_entry_perm_r,
  output [1:0]  io_out_bits_entry_level,
  output        io_out_bits_pf,
  output        io_out_bits_af
);
  wire [26:0] _GEN_1 = io_in_1_valid ? io_in_1_bits_entry_tag : io_in_2_bits_entry_tag; // @[Arbiter.scala 139:15 141:26 143:19]
  wire [15:0] _GEN_2 = io_in_1_valid ? io_in_1_bits_entry_asid : io_in_2_bits_entry_asid; // @[Arbiter.scala 139:15 141:26 143:19]
  wire [23:0] _GEN_3 = io_in_1_valid ? io_in_1_bits_entry_ppn : io_in_2_bits_entry_ppn; // @[Arbiter.scala 139:15 141:26 143:19]
  wire  _GEN_4 = io_in_1_valid ? io_in_1_bits_entry_perm_d : io_in_2_bits_entry_perm_d; // @[Arbiter.scala 139:15 141:26 143:19]
  wire  _GEN_5 = io_in_1_valid ? io_in_1_bits_entry_perm_a : io_in_2_bits_entry_perm_a; // @[Arbiter.scala 139:15 141:26 143:19]
  wire  _GEN_6 = io_in_1_valid ? io_in_1_bits_entry_perm_g : io_in_2_bits_entry_perm_g; // @[Arbiter.scala 139:15 141:26 143:19]
  wire  _GEN_7 = io_in_1_valid ? io_in_1_bits_entry_perm_u : io_in_2_bits_entry_perm_u; // @[Arbiter.scala 139:15 141:26 143:19]
  wire  _GEN_8 = io_in_1_valid ? io_in_1_bits_entry_perm_x : io_in_2_bits_entry_perm_x; // @[Arbiter.scala 139:15 141:26 143:19]
  wire  _GEN_9 = io_in_1_valid ? io_in_1_bits_entry_perm_w : io_in_2_bits_entry_perm_w; // @[Arbiter.scala 139:15 141:26 143:19]
  wire  _GEN_10 = io_in_1_valid ? io_in_1_bits_entry_perm_r : io_in_2_bits_entry_perm_r; // @[Arbiter.scala 139:15 141:26 143:19]
  wire [1:0] _GEN_11 = io_in_1_valid ? io_in_1_bits_entry_level : 2'h2; // @[Arbiter.scala 139:15 141:26 143:19]
  wire  _GEN_14 = io_in_1_valid ? io_in_1_bits_pf : io_in_2_bits_pf; // @[Arbiter.scala 139:15 141:26 143:19]
  wire  _GEN_15 = io_in_1_valid ? io_in_1_bits_af : io_in_2_bits_af; // @[Arbiter.scala 139:15 141:26 143:19]
  wire  grant_1 = ~io_in_0_valid; // @[Arbiter.scala 46:78]
  wire  grant_2 = ~(io_in_0_valid | io_in_1_valid); // @[Arbiter.scala 46:78]
  assign io_in_0_ready = io_out_ready; // @[Arbiter.scala 149:19]
  assign io_in_1_ready = grant_1 & io_out_ready; // @[Arbiter.scala 149:19]
  assign io_in_2_ready = grant_2 & io_out_ready; // @[Arbiter.scala 149:19]
  assign io_out_valid = ~grant_2 | io_in_2_valid; // @[Arbiter.scala 150:31]
  assign io_out_bits_entry_tag = io_in_0_valid ? io_in_0_bits_entry_tag : _GEN_1; // @[Arbiter.scala 141:26 143:19]
  assign io_out_bits_entry_asid = io_in_0_valid ? io_in_0_bits_entry_asid : _GEN_2; // @[Arbiter.scala 141:26 143:19]
  assign io_out_bits_entry_ppn = io_in_0_valid ? io_in_0_bits_entry_ppn : _GEN_3; // @[Arbiter.scala 141:26 143:19]
  assign io_out_bits_entry_perm_d = io_in_0_valid ? io_in_0_bits_entry_perm_d : _GEN_4; // @[Arbiter.scala 141:26 143:19]
  assign io_out_bits_entry_perm_a = io_in_0_valid ? io_in_0_bits_entry_perm_a : _GEN_5; // @[Arbiter.scala 141:26 143:19]
  assign io_out_bits_entry_perm_g = io_in_0_valid ? io_in_0_bits_entry_perm_g : _GEN_6; // @[Arbiter.scala 141:26 143:19]
  assign io_out_bits_entry_perm_u = io_in_0_valid ? io_in_0_bits_entry_perm_u : _GEN_7; // @[Arbiter.scala 141:26 143:19]
  assign io_out_bits_entry_perm_x = io_in_0_valid ? io_in_0_bits_entry_perm_x : _GEN_8; // @[Arbiter.scala 141:26 143:19]
  assign io_out_bits_entry_perm_w = io_in_0_valid ? io_in_0_bits_entry_perm_w : _GEN_9; // @[Arbiter.scala 141:26 143:19]
  assign io_out_bits_entry_perm_r = io_in_0_valid ? io_in_0_bits_entry_perm_r : _GEN_10; // @[Arbiter.scala 141:26 143:19]
  assign io_out_bits_entry_level = io_in_0_valid ? io_in_0_bits_entry_level : _GEN_11; // @[Arbiter.scala 141:26 143:19]
  assign io_out_bits_pf = io_in_0_valid ? io_in_0_bits_pf : _GEN_14; // @[Arbiter.scala 141:26 143:19]
  assign io_out_bits_af = io_in_0_valid ? 1'h0 : _GEN_15; // @[Arbiter.scala 141:26 143:19]
endmodule

