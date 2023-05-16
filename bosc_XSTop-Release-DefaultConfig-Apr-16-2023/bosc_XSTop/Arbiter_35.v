module Arbiter_35(
  output         io_in_0_ready,
  input          io_in_0_valid,
  input  [3:0]   io_in_0_bits_source,
  input  [4:0]   io_in_0_bits_cmd,
  input  [35:0]  io_in_0_bits_addr,
  input  [38:0]  io_in_0_bits_vaddr,
  input  [7:0]   io_in_0_bits_way_en,
  input  [2:0]   io_in_0_bits_word_idx,
  input  [63:0]  io_in_0_bits_amo_data,
  input  [7:0]   io_in_0_bits_amo_mask,
  input  [1:0]   io_in_0_bits_req_coh_state,
  input  [1:0]   io_in_0_bits_replace_coh_state,
  input  [23:0]  io_in_0_bits_replace_tag,
  input  [3:0]   io_in_0_bits_id,
  input  [511:0] io_in_0_bits_store_data,
  input  [63:0]  io_in_0_bits_store_mask,
  output         io_in_1_ready,
  input          io_in_1_valid,
  input  [3:0]   io_in_1_bits_source,
  input  [4:0]   io_in_1_bits_cmd,
  input  [35:0]  io_in_1_bits_addr,
  input  [38:0]  io_in_1_bits_vaddr,
  input  [7:0]   io_in_1_bits_way_en,
  input  [1:0]   io_in_1_bits_req_coh_state,
  input  [1:0]   io_in_1_bits_replace_coh_state,
  input  [23:0]  io_in_1_bits_replace_tag,
  input          io_in_1_bits_cancel,
  output         io_in_2_ready,
  input          io_in_2_valid,
  input  [3:0]   io_in_2_bits_source,
  input  [4:0]   io_in_2_bits_cmd,
  input  [35:0]  io_in_2_bits_addr,
  input  [38:0]  io_in_2_bits_vaddr,
  input  [7:0]   io_in_2_bits_way_en,
  input  [1:0]   io_in_2_bits_req_coh_state,
  input  [1:0]   io_in_2_bits_replace_coh_state,
  input  [23:0]  io_in_2_bits_replace_tag,
  input          io_in_2_bits_cancel,
  input          io_out_ready,
  output         io_out_valid,
  output [3:0]   io_out_bits_source,
  output [4:0]   io_out_bits_cmd,
  output [35:0]  io_out_bits_addr,
  output [38:0]  io_out_bits_vaddr,
  output [7:0]   io_out_bits_way_en,
  output [2:0]   io_out_bits_word_idx,
  output [63:0]  io_out_bits_amo_data,
  output [7:0]   io_out_bits_amo_mask,
  output [1:0]   io_out_bits_req_coh_state,
  output [1:0]   io_out_bits_replace_coh_state,
  output [23:0]  io_out_bits_replace_tag,
  output [3:0]   io_out_bits_id,
  output         io_out_bits_cancel,
  output [511:0] io_out_bits_store_data,
  output [63:0]  io_out_bits_store_mask
);
  wire [3:0] _GEN_1 = io_in_1_valid ? io_in_1_bits_source : io_in_2_bits_source; // @[Arbiter.scala 139:15 141:26 143:19]
  wire [4:0] _GEN_2 = io_in_1_valid ? io_in_1_bits_cmd : io_in_2_bits_cmd; // @[Arbiter.scala 139:15 141:26 143:19]
  wire [35:0] _GEN_3 = io_in_1_valid ? io_in_1_bits_addr : io_in_2_bits_addr; // @[Arbiter.scala 139:15 141:26 143:19]
  wire [38:0] _GEN_4 = io_in_1_valid ? io_in_1_bits_vaddr : io_in_2_bits_vaddr; // @[Arbiter.scala 139:15 141:26 143:19]
  wire [7:0] _GEN_5 = io_in_1_valid ? io_in_1_bits_way_en : io_in_2_bits_way_en; // @[Arbiter.scala 139:15 141:26 143:19]
  wire [1:0] _GEN_11 = io_in_1_valid ? io_in_1_bits_req_coh_state : io_in_2_bits_req_coh_state; // @[Arbiter.scala 139:15 141:26 143:19]
  wire [1:0] _GEN_12 = io_in_1_valid ? io_in_1_bits_replace_coh_state : io_in_2_bits_replace_coh_state; // @[Arbiter.scala 139:15 141:26 143:19]
  wire [23:0] _GEN_13 = io_in_1_valid ? io_in_1_bits_replace_tag : io_in_2_bits_replace_tag; // @[Arbiter.scala 139:15 141:26 143:19]
  wire  _GEN_15 = io_in_1_valid ? io_in_1_bits_cancel : io_in_2_bits_cancel; // @[Arbiter.scala 139:15 141:26 143:19]
  wire  grant_1 = ~io_in_0_valid; // @[Arbiter.scala 46:78]
  wire  grant_2 = ~(io_in_0_valid | io_in_1_valid); // @[Arbiter.scala 46:78]
  assign io_in_0_ready = io_out_ready; // @[Arbiter.scala 149:19]
  assign io_in_1_ready = grant_1 & io_out_ready; // @[Arbiter.scala 149:19]
  assign io_in_2_ready = grant_2 & io_out_ready; // @[Arbiter.scala 149:19]
  assign io_out_valid = ~grant_2 | io_in_2_valid; // @[Arbiter.scala 150:31]
  assign io_out_bits_source = io_in_0_valid ? io_in_0_bits_source : _GEN_1; // @[Arbiter.scala 141:26 143:19]
  assign io_out_bits_cmd = io_in_0_valid ? io_in_0_bits_cmd : _GEN_2; // @[Arbiter.scala 141:26 143:19]
  assign io_out_bits_addr = io_in_0_valid ? io_in_0_bits_addr : _GEN_3; // @[Arbiter.scala 141:26 143:19]
  assign io_out_bits_vaddr = io_in_0_valid ? io_in_0_bits_vaddr : _GEN_4; // @[Arbiter.scala 141:26 143:19]
  assign io_out_bits_way_en = io_in_0_valid ? io_in_0_bits_way_en : _GEN_5; // @[Arbiter.scala 141:26 143:19]
  assign io_out_bits_word_idx = io_in_0_valid ? io_in_0_bits_word_idx : 3'h0; // @[Arbiter.scala 141:26 143:19]
  assign io_out_bits_amo_data = io_in_0_valid ? io_in_0_bits_amo_data : 64'h0; // @[Arbiter.scala 141:26 143:19]
  assign io_out_bits_amo_mask = io_in_0_valid ? io_in_0_bits_amo_mask : 8'h0; // @[Arbiter.scala 141:26 143:19]
  assign io_out_bits_req_coh_state = io_in_0_valid ? io_in_0_bits_req_coh_state : _GEN_11; // @[Arbiter.scala 141:26 143:19]
  assign io_out_bits_replace_coh_state = io_in_0_valid ? io_in_0_bits_replace_coh_state : _GEN_12; // @[Arbiter.scala 141:26 143:19]
  assign io_out_bits_replace_tag = io_in_0_valid ? io_in_0_bits_replace_tag : _GEN_13; // @[Arbiter.scala 141:26 143:19]
  assign io_out_bits_id = io_in_0_valid ? io_in_0_bits_id : 4'h0; // @[Arbiter.scala 141:26 143:19]
  assign io_out_bits_cancel = io_in_0_valid ? 1'h0 : _GEN_15; // @[Arbiter.scala 141:26 143:19]
  assign io_out_bits_store_data = io_in_0_valid ? io_in_0_bits_store_data : 512'h0; // @[Arbiter.scala 141:26 143:19]
  assign io_out_bits_store_mask = io_in_0_valid ? io_in_0_bits_store_mask : 64'h0; // @[Arbiter.scala 141:26 143:19]
endmodule

