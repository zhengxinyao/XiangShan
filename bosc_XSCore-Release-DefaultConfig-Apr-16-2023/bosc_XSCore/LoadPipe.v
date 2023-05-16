module LoadPipe(
  input          clock,
  input          reset,
  output         io_lsu_req_ready,
  input          io_lsu_req_valid,
  input  [4:0]   io_lsu_req_bits_cmd,
  input  [35:0]  io_lsu_req_bits_addr,
  input  [3:0]   io_lsu_req_bits_instrtype,
  input  [7:0]   io_lsu_req_bits_replayCarry_real_way_en,
  input          io_lsu_req_bits_replayCarry_valid,
  output         io_lsu_resp_valid,
  output [127:0] io_lsu_resp_bits_data_delayed,
  output         io_lsu_resp_bits_miss,
  output         io_lsu_resp_bits_replay,
  output [7:0]   io_lsu_resp_bits_replayCarry_real_way_en,
  output         io_lsu_resp_bits_replayCarry_valid,
  output         io_lsu_resp_bits_tag_error,
  output [1:0]   io_lsu_resp_bits_mshr_id,
  output         io_lsu_resp_bits_error_delayed,
  input          io_lsu_s1_kill,
  input          io_lsu_s2_kill,
  input  [35:0]  io_lsu_s1_paddr_dup_lsu,
  input  [35:0]  io_lsu_s1_paddr_dup_dcache,
  output         io_lsu_s1_bank_conflict,
  output         io_meta_read_valid,
  output [5:0]   io_meta_read_bits_idx,
  input  [1:0]   io_meta_resp_0_coh_state,
  input  [1:0]   io_meta_resp_1_coh_state,
  input  [1:0]   io_meta_resp_2_coh_state,
  input  [1:0]   io_meta_resp_3_coh_state,
  input  [1:0]   io_meta_resp_4_coh_state,
  input  [1:0]   io_meta_resp_5_coh_state,
  input  [1:0]   io_meta_resp_6_coh_state,
  input  [1:0]   io_meta_resp_7_coh_state,
  input          io_extra_meta_resp_0_error,
  input          io_extra_meta_resp_1_error,
  input          io_extra_meta_resp_2_error,
  input          io_extra_meta_resp_3_error,
  input          io_extra_meta_resp_4_error,
  input          io_extra_meta_resp_5_error,
  input          io_extra_meta_resp_6_error,
  input          io_extra_meta_resp_7_error,
  input          io_tag_read_ready,
  output         io_tag_read_valid,
  output [5:0]   io_tag_read_bits_idx,
  input  [29:0]  io_tag_resp_0,
  input  [29:0]  io_tag_resp_1,
  input  [29:0]  io_tag_resp_2,
  input  [29:0]  io_tag_resp_3,
  input  [29:0]  io_tag_resp_4,
  input  [29:0]  io_tag_resp_5,
  input  [29:0]  io_tag_resp_6,
  input  [29:0]  io_tag_resp_7,
  input          io_banked_data_read_ready,
  output         io_banked_data_read_valid,
  output [7:0]   io_banked_data_read_bits_way_en,
  output [35:0]  io_banked_data_read_bits_addr,
  output [7:0]   io_banked_data_read_bits_bankMask,
  input  [63:0]  io_banked_data_resp_0_raw_data,
  input          io_read_error_delayed_0,
  input          io_bank_conflict_slow,
  input          io_bank_conflict_fast,
  input          io_miss_req_ready,
  output         io_miss_req_valid,
  output [3:0]   io_miss_req_bits_source,
  output [4:0]   io_miss_req_bits_cmd,
  output [35:0]  io_miss_req_bits_addr,
  output [38:0]  io_miss_req_bits_vaddr,
  output [7:0]   io_miss_req_bits_way_en,
  output [1:0]   io_miss_req_bits_req_coh_state,
  output [1:0]   io_miss_req_bits_replace_coh_state,
  output [23:0]  io_miss_req_bits_replace_tag,
  output         io_miss_req_bits_cancel,
  input  [1:0]   io_miss_resp_id,
  output         io_replace_access_valid,
  output [5:0]   io_replace_access_bits_set,
  output [2:0]   io_replace_access_bits_way,
  output [5:0]   io_replace_way_set_bits,
  input  [2:0]   io_replace_way_way,
  output         io_error_source_tag,
  output         io_error_source_data,
  output         io_error_source_l2,
  output [35:0]  io_error_paddr,
  output         io_error_report_to_beu,
  output         io_error_valid,
  output [5:0]   io_perf_0_value,
  output [5:0]   io_perf_1_value,
  output [5:0]   io_perf_2_value,
  output [5:0]   io_perf_3_value,
  output [5:0]   io_perf_4_value
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [63:0] _RAND_8;
  reg [63:0] _RAND_9;
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
  reg [63:0] _RAND_21;
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
`endif // RANDOMIZE_REG_INIT
  wire  wpu_clock; // @[LoadPipe.scala 165:19]
  wire  wpu_reset; // @[LoadPipe.scala 165:19]
  wire [35:0] wpu_io_req_bits_vaddr; // @[LoadPipe.scala 165:19]
  wire [7:0] wpu_io_req_bits_replayCarry_real_way_en; // @[LoadPipe.scala 165:19]
  wire  wpu_io_req_bits_replayCarry_valid; // @[LoadPipe.scala 165:19]
  wire  wpu_io_resp_valid; // @[LoadPipe.scala 165:19]
  wire  wpu_io_check_valid; // @[LoadPipe.scala 165:19]
  wire [29:0] wpu_io_check_bits_s1_tag_resp_0; // @[LoadPipe.scala 165:19]
  wire [29:0] wpu_io_check_bits_s1_tag_resp_1; // @[LoadPipe.scala 165:19]
  wire [29:0] wpu_io_check_bits_s1_tag_resp_2; // @[LoadPipe.scala 165:19]
  wire [29:0] wpu_io_check_bits_s1_tag_resp_3; // @[LoadPipe.scala 165:19]
  wire [29:0] wpu_io_check_bits_s1_tag_resp_4; // @[LoadPipe.scala 165:19]
  wire [29:0] wpu_io_check_bits_s1_tag_resp_5; // @[LoadPipe.scala 165:19]
  wire [29:0] wpu_io_check_bits_s1_tag_resp_6; // @[LoadPipe.scala 165:19]
  wire [29:0] wpu_io_check_bits_s1_tag_resp_7; // @[LoadPipe.scala 165:19]
  wire [1:0] wpu_io_check_bits_s1_meta_resp_0_coh_state; // @[LoadPipe.scala 165:19]
  wire [1:0] wpu_io_check_bits_s1_meta_resp_1_coh_state; // @[LoadPipe.scala 165:19]
  wire [1:0] wpu_io_check_bits_s1_meta_resp_2_coh_state; // @[LoadPipe.scala 165:19]
  wire [1:0] wpu_io_check_bits_s1_meta_resp_3_coh_state; // @[LoadPipe.scala 165:19]
  wire [1:0] wpu_io_check_bits_s1_meta_resp_4_coh_state; // @[LoadPipe.scala 165:19]
  wire [1:0] wpu_io_check_bits_s1_meta_resp_5_coh_state; // @[LoadPipe.scala 165:19]
  wire [1:0] wpu_io_check_bits_s1_meta_resp_6_coh_state; // @[LoadPipe.scala 165:19]
  wire [1:0] wpu_io_check_bits_s1_meta_resp_7_coh_state; // @[LoadPipe.scala 165:19]
  wire [29:0] wpu_io_check_bits_s1_real_tag; // @[LoadPipe.scala 165:19]
  wire  wpu_io_s2_pred_fail; // @[LoadPipe.scala 165:19]
  wire [7:0] wpu_io_s2_real_way_en; // @[LoadPipe.scala 165:19]
  reg  s1_valid; // @[LoadPipe.scala 128:25]
  wire  s1_ready = ~s1_valid | s1_valid; // @[LoadPipe.scala 141:25]
  wire  _io_meta_read_valid_T = io_lsu_req_ready & io_lsu_req_valid; // @[Decoupled.scala 50:35]
  wire  s0_fire = _io_meta_read_valid_T & s1_ready; // @[LoadPipe.scala 113:26]
  wire [7:0] s0_bank_oh_64 = 8'h1 << io_lsu_req_bits_addr[5:3]; // @[OneHot.scala 57:35]
  wire [8:0] _GEN_54 = {{1'd0}, s0_bank_oh_64}; // @[LoadPipe.scala 118:54]
  reg [4:0] s1_req_cmd; // @[Reg.scala 16:16]
  reg [35:0] s1_req_addr; // @[Reg.scala 16:16]
  reg [3:0] s1_req_instrtype; // @[Reg.scala 16:16]
  wire [35:0] s1_vaddr = {s1_req_addr[35:6],io_lsu_s1_paddr_dup_lsu[5:0]}; // @[Cat.scala 31:58]
  reg [8:0] s1_bank_oh; // @[Reg.scala 16:16]
  wire  s1_nack_data = ~io_banked_data_read_ready; // @[LoadPipe.scala 139:22]
  wire  _GEN_10 = s1_valid ? 1'h0 : s1_valid; // @[LoadPipe.scala 144:23 128:25 144:34]
  wire [23:0] tag_resp_0 = io_tag_resp_0[23:0]; // @[LoadPipe.scala 150:40]
  wire [23:0] tag_resp_1 = io_tag_resp_1[23:0]; // @[LoadPipe.scala 150:40]
  wire [23:0] tag_resp_2 = io_tag_resp_2[23:0]; // @[LoadPipe.scala 150:40]
  wire [23:0] tag_resp_3 = io_tag_resp_3[23:0]; // @[LoadPipe.scala 150:40]
  wire [23:0] tag_resp_4 = io_tag_resp_4[23:0]; // @[LoadPipe.scala 150:40]
  wire [23:0] tag_resp_5 = io_tag_resp_5[23:0]; // @[LoadPipe.scala 150:40]
  wire [23:0] tag_resp_6 = io_tag_resp_6[23:0]; // @[LoadPipe.scala 150:40]
  wire [23:0] tag_resp_7 = io_tag_resp_7[23:0]; // @[LoadPipe.scala 150:40]
  wire [7:0] s1_tag_eq_way_dup_dc = {tag_resp_7 == io_lsu_s1_paddr_dup_dcache[35:12],tag_resp_6 ==
    io_lsu_s1_paddr_dup_dcache[35:12],tag_resp_5 == io_lsu_s1_paddr_dup_dcache[35:12],tag_resp_4 ==
    io_lsu_s1_paddr_dup_dcache[35:12],tag_resp_3 == io_lsu_s1_paddr_dup_dcache[35:12],tag_resp_2 ==
    io_lsu_s1_paddr_dup_dcache[35:12],tag_resp_1 == io_lsu_s1_paddr_dup_dcache[35:12],tag_resp_0 ==
    io_lsu_s1_paddr_dup_dcache[35:12]}; // @[LoadPipe.scala 186:99]
  wire  _s1_tag_match_way_dup_dc_T_1 = io_meta_resp_0_coh_state > 2'h0; // @[Metadata.scala 49:45]
  wire  _s1_tag_match_way_dup_dc_T_2 = s1_tag_eq_way_dup_dc[0] & _s1_tag_match_way_dup_dc_T_1; // @[LoadPipe.scala 187:75]
  wire  _s1_tag_match_way_dup_dc_T_4 = io_meta_resp_1_coh_state > 2'h0; // @[Metadata.scala 49:45]
  wire  _s1_tag_match_way_dup_dc_T_5 = s1_tag_eq_way_dup_dc[1] & _s1_tag_match_way_dup_dc_T_4; // @[LoadPipe.scala 187:75]
  wire  _s1_tag_match_way_dup_dc_T_7 = io_meta_resp_2_coh_state > 2'h0; // @[Metadata.scala 49:45]
  wire  _s1_tag_match_way_dup_dc_T_8 = s1_tag_eq_way_dup_dc[2] & _s1_tag_match_way_dup_dc_T_7; // @[LoadPipe.scala 187:75]
  wire  _s1_tag_match_way_dup_dc_T_10 = io_meta_resp_3_coh_state > 2'h0; // @[Metadata.scala 49:45]
  wire  _s1_tag_match_way_dup_dc_T_11 = s1_tag_eq_way_dup_dc[3] & _s1_tag_match_way_dup_dc_T_10; // @[LoadPipe.scala 187:75]
  wire  _s1_tag_match_way_dup_dc_T_13 = io_meta_resp_4_coh_state > 2'h0; // @[Metadata.scala 49:45]
  wire  _s1_tag_match_way_dup_dc_T_14 = s1_tag_eq_way_dup_dc[4] & _s1_tag_match_way_dup_dc_T_13; // @[LoadPipe.scala 187:75]
  wire  _s1_tag_match_way_dup_dc_T_16 = io_meta_resp_5_coh_state > 2'h0; // @[Metadata.scala 49:45]
  wire  _s1_tag_match_way_dup_dc_T_17 = s1_tag_eq_way_dup_dc[5] & _s1_tag_match_way_dup_dc_T_16; // @[LoadPipe.scala 187:75]
  wire  _s1_tag_match_way_dup_dc_T_19 = io_meta_resp_6_coh_state > 2'h0; // @[Metadata.scala 49:45]
  wire  _s1_tag_match_way_dup_dc_T_20 = s1_tag_eq_way_dup_dc[6] & _s1_tag_match_way_dup_dc_T_19; // @[LoadPipe.scala 187:75]
  wire  _s1_tag_match_way_dup_dc_T_22 = io_meta_resp_7_coh_state > 2'h0; // @[Metadata.scala 49:45]
  wire  _s1_tag_match_way_dup_dc_T_23 = s1_tag_eq_way_dup_dc[7] & _s1_tag_match_way_dup_dc_T_22; // @[LoadPipe.scala 187:75]
  wire [3:0] s1_tag_match_way_dup_dc_lo = {_s1_tag_match_way_dup_dc_T_11,_s1_tag_match_way_dup_dc_T_8,
    _s1_tag_match_way_dup_dc_T_5,_s1_tag_match_way_dup_dc_T_2}; // @[LoadPipe.scala 187:106]
  wire [3:0] s1_tag_match_way_dup_dc_hi = {_s1_tag_match_way_dup_dc_T_23,_s1_tag_match_way_dup_dc_T_20,
    _s1_tag_match_way_dup_dc_T_17,_s1_tag_match_way_dup_dc_T_14}; // @[LoadPipe.scala 187:106]
  wire [7:0] s1_tag_match_way_dup_dc = {_s1_tag_match_way_dup_dc_T_23,_s1_tag_match_way_dup_dc_T_20,
    _s1_tag_match_way_dup_dc_T_17,_s1_tag_match_way_dup_dc_T_14,_s1_tag_match_way_dup_dc_T_11,
    _s1_tag_match_way_dup_dc_T_8,_s1_tag_match_way_dup_dc_T_5,_s1_tag_match_way_dup_dc_T_2}; // @[LoadPipe.scala 187:106]
  wire [7:0] s1_tag_eq_way_dup_lsu = {tag_resp_7 == io_lsu_s1_paddr_dup_lsu[35:12],tag_resp_6 == io_lsu_s1_paddr_dup_lsu
    [35:12],tag_resp_5 == io_lsu_s1_paddr_dup_lsu[35:12],tag_resp_4 == io_lsu_s1_paddr_dup_lsu[35:12],tag_resp_3 ==
    io_lsu_s1_paddr_dup_lsu[35:12],tag_resp_2 == io_lsu_s1_paddr_dup_lsu[35:12],tag_resp_1 == io_lsu_s1_paddr_dup_lsu[35
    :12],tag_resp_0 == io_lsu_s1_paddr_dup_lsu[35:12]}; // @[LoadPipe.scala 190:97]
  wire  _s1_tag_match_way_dup_lsu_T_2 = s1_tag_eq_way_dup_lsu[0] & _s1_tag_match_way_dup_dc_T_1; // @[LoadPipe.scala 191:77]
  wire  _s1_tag_match_way_dup_lsu_T_5 = s1_tag_eq_way_dup_lsu[1] & _s1_tag_match_way_dup_dc_T_4; // @[LoadPipe.scala 191:77]
  wire  _s1_tag_match_way_dup_lsu_T_8 = s1_tag_eq_way_dup_lsu[2] & _s1_tag_match_way_dup_dc_T_7; // @[LoadPipe.scala 191:77]
  wire  _s1_tag_match_way_dup_lsu_T_11 = s1_tag_eq_way_dup_lsu[3] & _s1_tag_match_way_dup_dc_T_10; // @[LoadPipe.scala 191:77]
  wire  _s1_tag_match_way_dup_lsu_T_14 = s1_tag_eq_way_dup_lsu[4] & _s1_tag_match_way_dup_dc_T_13; // @[LoadPipe.scala 191:77]
  wire  _s1_tag_match_way_dup_lsu_T_17 = s1_tag_eq_way_dup_lsu[5] & _s1_tag_match_way_dup_dc_T_16; // @[LoadPipe.scala 191:77]
  wire  _s1_tag_match_way_dup_lsu_T_20 = s1_tag_eq_way_dup_lsu[6] & _s1_tag_match_way_dup_dc_T_19; // @[LoadPipe.scala 191:77]
  wire  _s1_tag_match_way_dup_lsu_T_23 = s1_tag_eq_way_dup_lsu[7] & _s1_tag_match_way_dup_dc_T_22; // @[LoadPipe.scala 191:77]
  wire [7:0] s1_tag_match_way_dup_lsu = {_s1_tag_match_way_dup_lsu_T_23,_s1_tag_match_way_dup_lsu_T_20,
    _s1_tag_match_way_dup_lsu_T_17,_s1_tag_match_way_dup_lsu_T_14,_s1_tag_match_way_dup_lsu_T_11,
    _s1_tag_match_way_dup_lsu_T_8,_s1_tag_match_way_dup_lsu_T_5,_s1_tag_match_way_dup_lsu_T_2}; // @[LoadPipe.scala 191:108]
  wire  s1_tag_match_dup_dc = |s1_tag_match_way_dup_dc; // @[LoadPipe.scala 193:53]
  wire [1:0] _s1_hit_meta_T_8 = s1_tag_match_way_dup_dc[0] ? io_meta_resp_0_coh_state : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _s1_hit_meta_T_9 = s1_tag_match_way_dup_dc[1] ? io_meta_resp_1_coh_state : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _s1_hit_meta_T_10 = s1_tag_match_way_dup_dc[2] ? io_meta_resp_2_coh_state : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _s1_hit_meta_T_11 = s1_tag_match_way_dup_dc[3] ? io_meta_resp_3_coh_state : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _s1_hit_meta_T_12 = s1_tag_match_way_dup_dc[4] ? io_meta_resp_4_coh_state : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _s1_hit_meta_T_13 = s1_tag_match_way_dup_dc[5] ? io_meta_resp_5_coh_state : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _s1_hit_meta_T_14 = s1_tag_match_way_dup_dc[6] ? io_meta_resp_6_coh_state : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _s1_hit_meta_T_15 = s1_tag_match_way_dup_dc[7] ? io_meta_resp_7_coh_state : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _s1_hit_meta_T_16 = _s1_hit_meta_T_8 | _s1_hit_meta_T_9; // @[Mux.scala 27:73]
  wire [1:0] _s1_hit_meta_T_17 = _s1_hit_meta_T_16 | _s1_hit_meta_T_10; // @[Mux.scala 27:73]
  wire [1:0] _s1_hit_meta_T_18 = _s1_hit_meta_T_17 | _s1_hit_meta_T_11; // @[Mux.scala 27:73]
  wire [1:0] _s1_hit_meta_T_19 = _s1_hit_meta_T_18 | _s1_hit_meta_T_12; // @[Mux.scala 27:73]
  wire [1:0] _s1_hit_meta_T_20 = _s1_hit_meta_T_19 | _s1_hit_meta_T_13; // @[Mux.scala 27:73]
  wire [1:0] _s1_hit_meta_T_21 = _s1_hit_meta_T_20 | _s1_hit_meta_T_14; // @[Mux.scala 27:73]
  wire [1:0] _s1_hit_meta_T_22 = _s1_hit_meta_T_21 | _s1_hit_meta_T_15; // @[Mux.scala 27:73]
  wire [1:0] s1_hit_meta_coh_state = s1_tag_match_dup_dc ? _s1_hit_meta_T_22 : 2'h0; // @[LoadPipe.scala 204:24]
  wire  _s1_hit_error_T_22 = s1_tag_match_way_dup_dc[0] & io_extra_meta_resp_0_error | s1_tag_match_way_dup_dc[1] &
    io_extra_meta_resp_1_error | s1_tag_match_way_dup_dc[2] & io_extra_meta_resp_2_error | s1_tag_match_way_dup_dc[3] &
    io_extra_meta_resp_3_error | s1_tag_match_way_dup_dc[4] & io_extra_meta_resp_4_error | s1_tag_match_way_dup_dc[5] &
    io_extra_meta_resp_5_error | s1_tag_match_way_dup_dc[6] & io_extra_meta_resp_6_error | s1_tag_match_way_dup_dc[7] &
    io_extra_meta_resp_7_error; // @[Mux.scala 27:73]
  wire  s1_hit_error = s1_tag_match_dup_dc & _s1_hit_error_T_22; // @[LoadPipe.scala 206:25]
  wire [7:0] s1_repl_way_en = 8'h1 << io_replace_way_way; // @[OneHot.scala 57:35]
  wire [23:0] _s1_repl_tag_T_8 = s1_repl_way_en[0] ? tag_resp_0 : 24'h0; // @[Mux.scala 27:73]
  wire [23:0] _s1_repl_tag_T_9 = s1_repl_way_en[1] ? tag_resp_1 : 24'h0; // @[Mux.scala 27:73]
  wire [23:0] _s1_repl_tag_T_10 = s1_repl_way_en[2] ? tag_resp_2 : 24'h0; // @[Mux.scala 27:73]
  wire [23:0] _s1_repl_tag_T_11 = s1_repl_way_en[3] ? tag_resp_3 : 24'h0; // @[Mux.scala 27:73]
  wire [23:0] _s1_repl_tag_T_12 = s1_repl_way_en[4] ? tag_resp_4 : 24'h0; // @[Mux.scala 27:73]
  wire [23:0] _s1_repl_tag_T_13 = s1_repl_way_en[5] ? tag_resp_5 : 24'h0; // @[Mux.scala 27:73]
  wire [23:0] _s1_repl_tag_T_14 = s1_repl_way_en[6] ? tag_resp_6 : 24'h0; // @[Mux.scala 27:73]
  wire [23:0] _s1_repl_tag_T_15 = s1_repl_way_en[7] ? tag_resp_7 : 24'h0; // @[Mux.scala 27:73]
  wire [23:0] _s1_repl_tag_T_16 = _s1_repl_tag_T_8 | _s1_repl_tag_T_9; // @[Mux.scala 27:73]
  wire [23:0] _s1_repl_tag_T_17 = _s1_repl_tag_T_16 | _s1_repl_tag_T_10; // @[Mux.scala 27:73]
  wire [23:0] _s1_repl_tag_T_18 = _s1_repl_tag_T_17 | _s1_repl_tag_T_11; // @[Mux.scala 27:73]
  wire [23:0] _s1_repl_tag_T_19 = _s1_repl_tag_T_18 | _s1_repl_tag_T_12; // @[Mux.scala 27:73]
  wire [23:0] _s1_repl_tag_T_20 = _s1_repl_tag_T_19 | _s1_repl_tag_T_13; // @[Mux.scala 27:73]
  wire [23:0] _s1_repl_tag_T_21 = _s1_repl_tag_T_20 | _s1_repl_tag_T_14; // @[Mux.scala 27:73]
  wire [23:0] s1_repl_tag = _s1_repl_tag_T_21 | _s1_repl_tag_T_15; // @[Mux.scala 27:73]
  wire [1:0] _s1_repl_coh_T_8 = s1_repl_way_en[0] ? io_meta_resp_0_coh_state : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _s1_repl_coh_T_9 = s1_repl_way_en[1] ? io_meta_resp_1_coh_state : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _s1_repl_coh_T_10 = s1_repl_way_en[2] ? io_meta_resp_2_coh_state : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _s1_repl_coh_T_11 = s1_repl_way_en[3] ? io_meta_resp_3_coh_state : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _s1_repl_coh_T_12 = s1_repl_way_en[4] ? io_meta_resp_4_coh_state : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _s1_repl_coh_T_13 = s1_repl_way_en[5] ? io_meta_resp_5_coh_state : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _s1_repl_coh_T_14 = s1_repl_way_en[6] ? io_meta_resp_6_coh_state : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _s1_repl_coh_T_15 = s1_repl_way_en[7] ? io_meta_resp_7_coh_state : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _s1_repl_coh_T_16 = _s1_repl_coh_T_8 | _s1_repl_coh_T_9; // @[Mux.scala 27:73]
  wire [1:0] _s1_repl_coh_T_17 = _s1_repl_coh_T_16 | _s1_repl_coh_T_10; // @[Mux.scala 27:73]
  wire [1:0] _s1_repl_coh_T_18 = _s1_repl_coh_T_17 | _s1_repl_coh_T_11; // @[Mux.scala 27:73]
  wire [1:0] _s1_repl_coh_T_19 = _s1_repl_coh_T_18 | _s1_repl_coh_T_12; // @[Mux.scala 27:73]
  wire [1:0] _s1_repl_coh_T_20 = _s1_repl_coh_T_19 | _s1_repl_coh_T_13; // @[Mux.scala 27:73]
  wire [1:0] _s1_repl_coh_T_21 = _s1_repl_coh_T_20 | _s1_repl_coh_T_14; // @[Mux.scala 27:73]
  wire [1:0] s1_repl_coh_state = _s1_repl_coh_T_21 | _s1_repl_coh_T_15; // @[Mux.scala 27:73]
  wire  s1_need_replacement = ~s1_tag_match_dup_dc; // @[LoadPipe.scala 217:29]
  wire  _s1_has_permission_c_cat_T_5 = s1_req_cmd == 5'h4; // @[package.scala 15:47]
  wire  _s1_has_permission_c_cat_T_6 = s1_req_cmd == 5'h9; // @[package.scala 15:47]
  wire  _s1_has_permission_c_cat_T_7 = s1_req_cmd == 5'ha; // @[package.scala 15:47]
  wire  _s1_has_permission_c_cat_T_8 = s1_req_cmd == 5'hb; // @[package.scala 15:47]
  wire  _s1_has_permission_c_cat_T_11 = _s1_has_permission_c_cat_T_5 | _s1_has_permission_c_cat_T_6 |
    _s1_has_permission_c_cat_T_7 | _s1_has_permission_c_cat_T_8; // @[package.scala 72:59]
  wire  _s1_has_permission_c_cat_T_12 = s1_req_cmd == 5'h8; // @[package.scala 15:47]
  wire  _s1_has_permission_c_cat_T_13 = s1_req_cmd == 5'hc; // @[package.scala 15:47]
  wire  _s1_has_permission_c_cat_T_14 = s1_req_cmd == 5'hd; // @[package.scala 15:47]
  wire  _s1_has_permission_c_cat_T_15 = s1_req_cmd == 5'he; // @[package.scala 15:47]
  wire  _s1_has_permission_c_cat_T_16 = s1_req_cmd == 5'hf; // @[package.scala 15:47]
  wire  _s1_has_permission_c_cat_T_20 = _s1_has_permission_c_cat_T_12 | _s1_has_permission_c_cat_T_13 |
    _s1_has_permission_c_cat_T_14 | _s1_has_permission_c_cat_T_15 | _s1_has_permission_c_cat_T_16; // @[package.scala 72:59]
  wire  _s1_has_permission_c_cat_T_21 = _s1_has_permission_c_cat_T_11 | _s1_has_permission_c_cat_T_20; // @[Consts.scala 82:44]
  wire  _s1_has_permission_c_cat_T_22 = s1_req_cmd == 5'h1 | s1_req_cmd == 5'h11 | s1_req_cmd == 5'h7 |
    _s1_has_permission_c_cat_T_21; // @[Consts.scala 85:76]
  wire  _s1_has_permission_c_cat_T_49 = _s1_has_permission_c_cat_T_22 | s1_req_cmd == 5'h3 | s1_req_cmd == 5'h6; // @[Consts.scala 86:64]
  wire [3:0] _s1_has_permission_T = {_s1_has_permission_c_cat_T_22,_s1_has_permission_c_cat_T_49,s1_hit_meta_coh_state}; // @[Cat.scala 31:58]
  wire  _s1_has_permission_T_25 = 4'hc == _s1_has_permission_T; // @[Misc.scala 48:20]
  wire [1:0] _s1_has_permission_T_27 = _s1_has_permission_T_25 ? 2'h1 : 2'h0; // @[Misc.scala 34:36]
  wire  _s1_has_permission_T_28 = 4'hd == _s1_has_permission_T; // @[Misc.scala 48:20]
  wire [1:0] _s1_has_permission_T_30 = _s1_has_permission_T_28 ? 2'h2 : _s1_has_permission_T_27; // @[Misc.scala 34:36]
  wire  _s1_has_permission_T_31 = 4'h4 == _s1_has_permission_T; // @[Misc.scala 48:20]
  wire [1:0] _s1_has_permission_T_33 = _s1_has_permission_T_31 ? 2'h1 : _s1_has_permission_T_30; // @[Misc.scala 34:36]
  wire  _s1_has_permission_T_34 = 4'h5 == _s1_has_permission_T; // @[Misc.scala 48:20]
  wire [1:0] _s1_has_permission_T_36 = _s1_has_permission_T_34 ? 2'h2 : _s1_has_permission_T_33; // @[Misc.scala 34:36]
  wire  _s1_has_permission_T_37 = 4'h0 == _s1_has_permission_T; // @[Misc.scala 48:20]
  wire [1:0] _s1_has_permission_T_39 = _s1_has_permission_T_37 ? 2'h0 : _s1_has_permission_T_36; // @[Misc.scala 34:36]
  wire  _s1_has_permission_T_40 = 4'he == _s1_has_permission_T; // @[Misc.scala 48:20]
  wire [1:0] _s1_has_permission_T_42 = _s1_has_permission_T_40 ? 2'h3 : _s1_has_permission_T_39; // @[Misc.scala 34:36]
  wire  _s1_has_permission_T_43 = 4'hf == _s1_has_permission_T; // @[Misc.scala 48:20]
  wire [1:0] _s1_has_permission_T_45 = _s1_has_permission_T_43 ? 2'h3 : _s1_has_permission_T_42; // @[Misc.scala 34:36]
  wire  _s1_has_permission_T_46 = 4'h6 == _s1_has_permission_T; // @[Misc.scala 48:20]
  wire [1:0] _s1_has_permission_T_48 = _s1_has_permission_T_46 ? 2'h2 : _s1_has_permission_T_45; // @[Misc.scala 34:36]
  wire  _s1_has_permission_T_49 = 4'h7 == _s1_has_permission_T; // @[Misc.scala 48:20]
  wire [1:0] _s1_has_permission_T_51 = _s1_has_permission_T_49 ? 2'h3 : _s1_has_permission_T_48; // @[Misc.scala 34:36]
  wire  _s1_has_permission_T_52 = 4'h1 == _s1_has_permission_T; // @[Misc.scala 48:20]
  wire [1:0] _s1_has_permission_T_54 = _s1_has_permission_T_52 ? 2'h1 : _s1_has_permission_T_51; // @[Misc.scala 34:36]
  wire  _s1_has_permission_T_55 = 4'h2 == _s1_has_permission_T; // @[Misc.scala 48:20]
  wire [1:0] _s1_has_permission_T_57 = _s1_has_permission_T_55 ? 2'h2 : _s1_has_permission_T_54; // @[Misc.scala 34:36]
  wire  _s1_has_permission_T_58 = 4'h3 == _s1_has_permission_T; // @[Misc.scala 48:20]
  wire  s1_has_permission = _s1_has_permission_T_58 | (_s1_has_permission_T_55 | (_s1_has_permission_T_52 | (
    _s1_has_permission_T_49 | (_s1_has_permission_T_46 | (_s1_has_permission_T_43 | _s1_has_permission_T_40))))); // @[Misc.scala 34:9]
  wire [1:0] s1_has_permission_meta_state = _s1_has_permission_T_58 ? 2'h3 : _s1_has_permission_T_57; // @[Misc.scala 34:36]
  wire  _s1_hit_T_1 = s1_hit_meta_coh_state == s1_has_permission_meta_state; // @[Metadata.scala 45:46]
  wire  s1_hit = s1_tag_match_dup_dc & s1_has_permission & _s1_hit_T_1; // @[LoadPipe.scala 232:57]
  wire  s1_will_send_miss_req = s1_valid & ~s1_nack_data & ~s1_hit; // @[LoadPipe.scala 233:69]
  wire [29:0] _s1_encTag_T_8 = s1_tag_match_way_dup_dc[0] ? io_tag_resp_0 : 30'h0; // @[Mux.scala 27:73]
  wire [29:0] _s1_encTag_T_9 = s1_tag_match_way_dup_dc[1] ? io_tag_resp_1 : 30'h0; // @[Mux.scala 27:73]
  wire [29:0] _s1_encTag_T_10 = s1_tag_match_way_dup_dc[2] ? io_tag_resp_2 : 30'h0; // @[Mux.scala 27:73]
  wire [29:0] _s1_encTag_T_11 = s1_tag_match_way_dup_dc[3] ? io_tag_resp_3 : 30'h0; // @[Mux.scala 27:73]
  wire [29:0] _s1_encTag_T_12 = s1_tag_match_way_dup_dc[4] ? io_tag_resp_4 : 30'h0; // @[Mux.scala 27:73]
  wire [29:0] _s1_encTag_T_13 = s1_tag_match_way_dup_dc[5] ? io_tag_resp_5 : 30'h0; // @[Mux.scala 27:73]
  wire [29:0] _s1_encTag_T_14 = s1_tag_match_way_dup_dc[6] ? io_tag_resp_6 : 30'h0; // @[Mux.scala 27:73]
  wire [29:0] _s1_encTag_T_15 = s1_tag_match_way_dup_dc[7] ? io_tag_resp_7 : 30'h0; // @[Mux.scala 27:73]
  wire [29:0] _s1_encTag_T_16 = _s1_encTag_T_8 | _s1_encTag_T_9; // @[Mux.scala 27:73]
  wire [29:0] _s1_encTag_T_17 = _s1_encTag_T_16 | _s1_encTag_T_10; // @[Mux.scala 27:73]
  wire [29:0] _s1_encTag_T_18 = _s1_encTag_T_17 | _s1_encTag_T_11; // @[Mux.scala 27:73]
  wire [29:0] _s1_encTag_T_19 = _s1_encTag_T_18 | _s1_encTag_T_12; // @[Mux.scala 27:73]
  wire [29:0] _s1_encTag_T_20 = _s1_encTag_T_19 | _s1_encTag_T_13; // @[Mux.scala 27:73]
  wire [29:0] _s1_encTag_T_21 = _s1_encTag_T_20 | _s1_encTag_T_14; // @[Mux.scala 27:73]
  wire [29:0] s1_encTag = _s1_encTag_T_21 | _s1_encTag_T_15; // @[Mux.scala 27:73]
  reg  s2_fire; // @[LoadPipe.scala 245:25]
  reg [4:0] s2_req_cmd; // @[Reg.scala 16:16]
  reg [3:0] s2_req_instrtype; // @[Reg.scala 16:16]
  reg [35:0] s2_paddr; // @[Reg.scala 16:16]
  reg [35:0] s2_vaddr; // @[Reg.scala 16:16]
  wire  _s2_valid_T = ~io_lsu_s1_kill; // @[LoadPipe.scala 256:32]
  reg  s2_tag_match; // @[Reg.scala 16:16]
  reg  s2_hit_dup_lsu; // @[LoadPipe.scala 268:31]
  wire  _io_lsu_s2_hit_T = ~wpu_io_s2_pred_fail; // @[LoadPipe.scala 270:38]
  reg [1:0] s2_hit_coh_state; // @[Reg.scala 16:16]
  wire  _s2_has_permission_c_cat_T_5 = s2_req_cmd == 5'h4; // @[package.scala 15:47]
  wire  _s2_has_permission_c_cat_T_6 = s2_req_cmd == 5'h9; // @[package.scala 15:47]
  wire  _s2_has_permission_c_cat_T_7 = s2_req_cmd == 5'ha; // @[package.scala 15:47]
  wire  _s2_has_permission_c_cat_T_8 = s2_req_cmd == 5'hb; // @[package.scala 15:47]
  wire  _s2_has_permission_c_cat_T_11 = _s2_has_permission_c_cat_T_5 | _s2_has_permission_c_cat_T_6 |
    _s2_has_permission_c_cat_T_7 | _s2_has_permission_c_cat_T_8; // @[package.scala 72:59]
  wire  _s2_has_permission_c_cat_T_12 = s2_req_cmd == 5'h8; // @[package.scala 15:47]
  wire  _s2_has_permission_c_cat_T_13 = s2_req_cmd == 5'hc; // @[package.scala 15:47]
  wire  _s2_has_permission_c_cat_T_14 = s2_req_cmd == 5'hd; // @[package.scala 15:47]
  wire  _s2_has_permission_c_cat_T_15 = s2_req_cmd == 5'he; // @[package.scala 15:47]
  wire  _s2_has_permission_c_cat_T_16 = s2_req_cmd == 5'hf; // @[package.scala 15:47]
  wire  _s2_has_permission_c_cat_T_20 = _s2_has_permission_c_cat_T_12 | _s2_has_permission_c_cat_T_13 |
    _s2_has_permission_c_cat_T_14 | _s2_has_permission_c_cat_T_15 | _s2_has_permission_c_cat_T_16; // @[package.scala 72:59]
  wire  _s2_has_permission_c_cat_T_21 = _s2_has_permission_c_cat_T_11 | _s2_has_permission_c_cat_T_20; // @[Consts.scala 82:44]
  wire  _s2_has_permission_c_cat_T_22 = s2_req_cmd == 5'h1 | s2_req_cmd == 5'h11 | s2_req_cmd == 5'h7 |
    _s2_has_permission_c_cat_T_21; // @[Consts.scala 85:76]
  wire  _s2_has_permission_c_cat_T_49 = _s2_has_permission_c_cat_T_22 | s2_req_cmd == 5'h3 | s2_req_cmd == 5'h6; // @[Consts.scala 86:64]
  wire [3:0] _s2_has_permission_T = {_s2_has_permission_c_cat_T_22,_s2_has_permission_c_cat_T_49,s2_hit_coh_state}; // @[Cat.scala 31:58]
  wire  _s2_has_permission_T_25 = 4'hc == _s2_has_permission_T; // @[Misc.scala 48:20]
  wire [1:0] _s2_has_permission_T_27 = _s2_has_permission_T_25 ? 2'h1 : 2'h0; // @[Misc.scala 34:36]
  wire  _s2_has_permission_T_28 = 4'hd == _s2_has_permission_T; // @[Misc.scala 48:20]
  wire [1:0] _s2_has_permission_T_30 = _s2_has_permission_T_28 ? 2'h2 : _s2_has_permission_T_27; // @[Misc.scala 34:36]
  wire  _s2_has_permission_T_31 = 4'h4 == _s2_has_permission_T; // @[Misc.scala 48:20]
  wire [1:0] _s2_has_permission_T_33 = _s2_has_permission_T_31 ? 2'h1 : _s2_has_permission_T_30; // @[Misc.scala 34:36]
  wire  _s2_has_permission_T_34 = 4'h5 == _s2_has_permission_T; // @[Misc.scala 48:20]
  wire [1:0] _s2_has_permission_T_36 = _s2_has_permission_T_34 ? 2'h2 : _s2_has_permission_T_33; // @[Misc.scala 34:36]
  wire  _s2_has_permission_T_37 = 4'h0 == _s2_has_permission_T; // @[Misc.scala 48:20]
  wire [1:0] _s2_has_permission_T_39 = _s2_has_permission_T_37 ? 2'h0 : _s2_has_permission_T_36; // @[Misc.scala 34:36]
  wire  _s2_has_permission_T_40 = 4'he == _s2_has_permission_T; // @[Misc.scala 48:20]
  wire [1:0] _s2_has_permission_T_42 = _s2_has_permission_T_40 ? 2'h3 : _s2_has_permission_T_39; // @[Misc.scala 34:36]
  wire  _s2_has_permission_T_43 = 4'hf == _s2_has_permission_T; // @[Misc.scala 48:20]
  wire [1:0] _s2_has_permission_T_45 = _s2_has_permission_T_43 ? 2'h3 : _s2_has_permission_T_42; // @[Misc.scala 34:36]
  wire  _s2_has_permission_T_46 = 4'h6 == _s2_has_permission_T; // @[Misc.scala 48:20]
  wire [1:0] _s2_has_permission_T_48 = _s2_has_permission_T_46 ? 2'h2 : _s2_has_permission_T_45; // @[Misc.scala 34:36]
  wire  _s2_has_permission_T_49 = 4'h7 == _s2_has_permission_T; // @[Misc.scala 48:20]
  wire [1:0] _s2_has_permission_T_51 = _s2_has_permission_T_49 ? 2'h3 : _s2_has_permission_T_48; // @[Misc.scala 34:36]
  wire  _s2_has_permission_T_52 = 4'h1 == _s2_has_permission_T; // @[Misc.scala 48:20]
  wire [1:0] _s2_has_permission_T_54 = _s2_has_permission_T_52 ? 2'h1 : _s2_has_permission_T_51; // @[Misc.scala 34:36]
  wire  _s2_has_permission_T_55 = 4'h2 == _s2_has_permission_T; // @[Misc.scala 48:20]
  wire [1:0] _s2_has_permission_T_57 = _s2_has_permission_T_55 ? 2'h2 : _s2_has_permission_T_54; // @[Misc.scala 34:36]
  wire  _s2_has_permission_T_58 = 4'h3 == _s2_has_permission_T; // @[Misc.scala 48:20]
  wire  s2_has_permission = _s2_has_permission_T_58 | (_s2_has_permission_T_55 | (_s2_has_permission_T_52 | (
    _s2_has_permission_T_49 | (_s2_has_permission_T_46 | (_s2_has_permission_T_43 | _s2_has_permission_T_40))))); // @[Misc.scala 34:9]
  wire [1:0] s2_has_permission_meta_state = _s2_has_permission_T_58 ? 2'h3 : _s2_has_permission_T_57; // @[Misc.scala 34:36]
  reg [7:0] s2_way_en; // @[Reg.scala 16:16]
  reg [1:0] s2_repl_coh_state; // @[Reg.scala 16:16]
  reg [23:0] s2_repl_tag; // @[Reg.scala 16:16]
  reg [29:0] s2_encTag; // @[Reg.scala 16:16]
  wire  s2_nack_no_mshr = io_miss_req_valid & ~io_miss_req_ready; // @[LoadPipe.scala 287:43]
  reg  s2_nack_data; // @[Reg.scala 16:16]
  wire  s2_nack = s2_nack_no_mshr | s2_nack_data; // @[LoadPipe.scala 290:48]
  wire [2:0] s2_bank_addr = s2_paddr[5:3]; // @[DCacheWrapper.scala 186:9]
  wire [28:0] _s2_tag_error_syndromeUInt_T = 29'h1aaad5b & s2_encTag[28:0]; // @[ECC.scala 156:66]
  wire [28:0] _s2_tag_error_syndromeUInt_T_2 = 29'h233366d & s2_encTag[28:0]; // @[ECC.scala 156:66]
  wire [28:0] _s2_tag_error_syndromeUInt_T_4 = 29'h4c3c78e & s2_encTag[28:0]; // @[ECC.scala 156:66]
  wire [28:0] _s2_tag_error_syndromeUInt_T_6 = 29'h8fc07f0 & s2_encTag[28:0]; // @[ECC.scala 156:66]
  wire [28:0] _s2_tag_error_syndromeUInt_T_8 = 29'h10fff800 & s2_encTag[28:0]; // @[ECC.scala 156:66]
  wire [4:0] s2_tag_error_syndromeUInt = {^_s2_tag_error_syndromeUInt_T_8,^_s2_tag_error_syndromeUInt_T_6,^
    _s2_tag_error_syndromeUInt_T_4,^_s2_tag_error_syndromeUInt_T_2,^_s2_tag_error_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  s2_tag_error_correctable = |s2_tag_error_syndromeUInt; // @[ECC.scala 163:36]
  wire  s2_tag_error_uncorrectable_1 = ^s2_encTag; // @[ECC.scala 87:27]
  wire  s2_tag_error_uncorrectable_2 = ~s2_tag_error_uncorrectable_1 & s2_tag_error_correctable; // @[ECC.scala 195:47]
  wire  s2_tag_error = s2_tag_error_uncorrectable_1 | s2_tag_error_uncorrectable_2; // @[ECC.scala 31:27]
  reg  s2_flag_error; // @[Reg.scala 16:16]
  wire  _s2_hit_T_1 = s2_hit_coh_state == s2_has_permission_meta_state; // @[Metadata.scala 45:46]
  wire  s2_hit = s2_tag_match & s2_has_permission & _s2_hit_T_1 & _io_lsu_s2_hit_T; // @[LoadPipe.scala 303:83]
  reg  s2_can_send_miss_req; // @[Reg.scala 16:16]
  wire  real_miss = ~s2_hit_dup_lsu; // @[LoadPipe.scala 343:18]
  wire  resp_bits_miss = real_miss | io_bank_conflict_slow | wpu_io_s2_pred_fail; // @[LoadPipe.scala 346:56]
  wire  _resp_bits_replay_T = io_miss_req_ready & io_miss_req_valid; // @[Decoupled.scala 50:35]
  wire  resp_bits_replay = resp_bits_miss & (~_resp_bits_replay_T | s2_nack) | io_bank_conflict_slow |
    wpu_io_s2_pred_fail; // @[LoadPipe.scala 348:101]
  reg  s3_valid; // @[LoadPipe.scala 379:25]
  reg [35:0] s3_paddr; // @[Reg.scala 16:16]
  reg  s3_hit; // @[Reg.scala 16:16]
  wire [127:0] _data64bit_T_1 = {io_banked_data_resp_0_raw_data, 64'h0}; // @[LoadPipe.scala 389:66]
  reg  s3_tag_error; // @[Reg.scala 16:16]
  reg  s3_flag_error; // @[Reg.scala 16:16]
  wire  s3_error = s3_tag_error | s3_flag_error | io_read_error_delayed_0; // @[LoadPipe.scala 395:48]
  reg  io_replace_access_valid_REG; // @[LoadPipe.scala 413:53]
  reg  io_replace_access_valid_REG_1; // @[LoadPipe.scala 413:45]
  reg  io_replace_access_valid_REG_2; // @[LoadPipe.scala 413:37]
  reg [5:0] io_replace_access_bits_set_REG; // @[LoadPipe.scala 414:48]
  reg [5:0] io_replace_access_bits_set_REG_1; // @[LoadPipe.scala 414:40]
  wire [3:0] io_replace_access_bits_way_hi = s1_tag_match_way_dup_dc[7:4]; // @[OneHot.scala 30:18]
  wire [3:0] io_replace_access_bits_way_lo = s1_tag_match_way_dup_dc[3:0]; // @[OneHot.scala 31:18]
  wire  _io_replace_access_bits_way_T = |io_replace_access_bits_way_hi; // @[OneHot.scala 32:14]
  wire [3:0] _io_replace_access_bits_way_T_1 = io_replace_access_bits_way_hi | io_replace_access_bits_way_lo; // @[OneHot.scala 32:28]
  wire [1:0] io_replace_access_bits_way_hi_1 = _io_replace_access_bits_way_T_1[3:2]; // @[OneHot.scala 30:18]
  wire [1:0] io_replace_access_bits_way_lo_1 = _io_replace_access_bits_way_T_1[1:0]; // @[OneHot.scala 31:18]
  wire  _io_replace_access_bits_way_T_2 = |io_replace_access_bits_way_hi_1; // @[OneHot.scala 32:14]
  wire [1:0] _io_replace_access_bits_way_T_3 = io_replace_access_bits_way_hi_1 | io_replace_access_bits_way_lo_1; // @[OneHot.scala 32:28]
  wire [2:0] _io_replace_access_bits_way_T_6 = {_io_replace_access_bits_way_T,_io_replace_access_bits_way_T_2,
    _io_replace_access_bits_way_T_3[1]}; // @[Cat.scala 31:58]
  reg [2:0] io_replace_access_bits_way_REG; // @[LoadPipe.scala 415:48]
  reg [2:0] io_replace_access_bits_way_REG_1; // @[LoadPipe.scala 415:40]
  wire  _T_70 = io_lsu_resp_valid & resp_bits_replay; // @[LoadPipe.scala 443:54]
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
  DCacheWPU wpu ( // @[LoadPipe.scala 165:19]
    .clock(wpu_clock),
    .reset(wpu_reset),
    .io_req_bits_vaddr(wpu_io_req_bits_vaddr),
    .io_req_bits_replayCarry_real_way_en(wpu_io_req_bits_replayCarry_real_way_en),
    .io_req_bits_replayCarry_valid(wpu_io_req_bits_replayCarry_valid),
    .io_resp_valid(wpu_io_resp_valid),
    .io_check_valid(wpu_io_check_valid),
    .io_check_bits_s1_tag_resp_0(wpu_io_check_bits_s1_tag_resp_0),
    .io_check_bits_s1_tag_resp_1(wpu_io_check_bits_s1_tag_resp_1),
    .io_check_bits_s1_tag_resp_2(wpu_io_check_bits_s1_tag_resp_2),
    .io_check_bits_s1_tag_resp_3(wpu_io_check_bits_s1_tag_resp_3),
    .io_check_bits_s1_tag_resp_4(wpu_io_check_bits_s1_tag_resp_4),
    .io_check_bits_s1_tag_resp_5(wpu_io_check_bits_s1_tag_resp_5),
    .io_check_bits_s1_tag_resp_6(wpu_io_check_bits_s1_tag_resp_6),
    .io_check_bits_s1_tag_resp_7(wpu_io_check_bits_s1_tag_resp_7),
    .io_check_bits_s1_meta_resp_0_coh_state(wpu_io_check_bits_s1_meta_resp_0_coh_state),
    .io_check_bits_s1_meta_resp_1_coh_state(wpu_io_check_bits_s1_meta_resp_1_coh_state),
    .io_check_bits_s1_meta_resp_2_coh_state(wpu_io_check_bits_s1_meta_resp_2_coh_state),
    .io_check_bits_s1_meta_resp_3_coh_state(wpu_io_check_bits_s1_meta_resp_3_coh_state),
    .io_check_bits_s1_meta_resp_4_coh_state(wpu_io_check_bits_s1_meta_resp_4_coh_state),
    .io_check_bits_s1_meta_resp_5_coh_state(wpu_io_check_bits_s1_meta_resp_5_coh_state),
    .io_check_bits_s1_meta_resp_6_coh_state(wpu_io_check_bits_s1_meta_resp_6_coh_state),
    .io_check_bits_s1_meta_resp_7_coh_state(wpu_io_check_bits_s1_meta_resp_7_coh_state),
    .io_check_bits_s1_real_tag(wpu_io_check_bits_s1_real_tag),
    .io_s2_pred_fail(wpu_io_s2_pred_fail),
    .io_s2_real_way_en(wpu_io_s2_real_way_en)
  );
  assign io_lsu_req_ready = io_tag_read_ready & s1_ready; // @[LoadPipe.scala 86:66]
  assign io_lsu_resp_valid = s2_fire; // @[LoadPipe.scala 328:18 329:14]
  assign io_lsu_resp_bits_data_delayed = s3_paddr[3] ? _data64bit_T_1 : {{64'd0}, io_banked_data_resp_0_raw_data}; // @[LoadPipe.scala 389:22]
  assign io_lsu_resp_bits_miss = real_miss | io_bank_conflict_slow | wpu_io_s2_pred_fail; // @[LoadPipe.scala 346:56]
  assign io_lsu_resp_bits_replay = resp_bits_miss & (~_resp_bits_replay_T | s2_nack) | io_bank_conflict_slow |
    wpu_io_s2_pred_fail; // @[LoadPipe.scala 348:101]
  assign io_lsu_resp_bits_replayCarry_real_way_en = wpu_io_s2_real_way_en; // @[LoadPipe.scala 328:18 350:37]
  assign io_lsu_resp_bits_replayCarry_valid = real_miss | io_bank_conflict_slow | wpu_io_s2_pred_fail; // @[LoadPipe.scala 346:56]
  assign io_lsu_resp_bits_tag_error = s2_tag_error_uncorrectable_1 | s2_tag_error_uncorrectable_2; // @[ECC.scala 31:27]
  assign io_lsu_resp_bits_mshr_id = io_miss_resp_id; // @[LoadPipe.scala 328:18 354:21]
  assign io_lsu_resp_bits_error_delayed = s3_error & (s3_hit | s3_tag_error) & s3_valid; // @[LoadPipe.scala 398:67]
  assign io_lsu_s1_bank_conflict = io_bank_conflict_fast; // @[LoadPipe.scala 371:27]
  assign io_meta_read_valid = io_lsu_req_ready & io_lsu_req_valid; // @[Decoupled.scala 50:35]
  assign io_meta_read_bits_idx = io_lsu_req_bits_addr[11:6]; // @[L1Cache.scala 81:33]
  assign io_tag_read_valid = io_lsu_req_ready & io_lsu_req_valid; // @[Decoupled.scala 50:35]
  assign io_tag_read_bits_idx = io_lsu_req_bits_addr[11:6]; // @[L1Cache.scala 81:33]
  assign io_banked_data_read_valid = s1_valid; // @[LoadPipe.scala 223:40]
  assign io_banked_data_read_bits_way_en = {s1_tag_match_way_dup_dc_hi,s1_tag_match_way_dup_dc_lo}; // @[LoadPipe.scala 187:106]
  assign io_banked_data_read_bits_addr = {s1_req_addr[35:6],io_lsu_s1_paddr_dup_lsu[5:0]}; // @[Cat.scala 31:58]
  assign io_banked_data_read_bits_bankMask = s1_bank_oh[7:0]; // @[LoadPipe.scala 226:37]
  assign io_miss_req_valid = s2_fire & s2_can_send_miss_req & _io_lsu_s2_hit_T; // @[LoadPipe.scala 314:57]
  assign io_miss_req_bits_source = s2_req_instrtype; // @[LoadPipe.scala 316:27]
  assign io_miss_req_bits_cmd = s2_req_cmd; // @[LoadPipe.scala 317:24]
  assign io_miss_req_bits_addr = {s2_paddr[35:6], 6'h0}; // @[L1Cache.scala 84:59]
  assign io_miss_req_bits_vaddr = {{3'd0}, s2_vaddr}; // @[LoadPipe.scala 319:26]
  assign io_miss_req_bits_way_en = s2_way_en; // @[LoadPipe.scala 320:27]
  assign io_miss_req_bits_req_coh_state = s2_hit_coh_state; // @[LoadPipe.scala 321:28]
  assign io_miss_req_bits_replace_coh_state = s2_repl_coh_state; // @[LoadPipe.scala 322:32]
  assign io_miss_req_bits_replace_tag = s2_repl_tag; // @[LoadPipe.scala 323:32]
  assign io_miss_req_bits_cancel = io_lsu_s2_kill | s2_tag_error; // @[LoadPipe.scala 324:45]
  assign io_replace_access_valid = io_replace_access_valid_REG_2; // @[LoadPipe.scala 413:27]
  assign io_replace_access_bits_set = io_replace_access_bits_set_REG_1; // @[LoadPipe.scala 414:30]
  assign io_replace_access_bits_way = io_replace_access_bits_way_REG_1; // @[LoadPipe.scala 415:30]
  assign io_replace_way_set_bits = s1_vaddr[11:6]; // @[L1Cache.scala 81:33]
  assign io_error_source_tag = s3_tag_error; // @[LoadPipe.scala 405:23]
  assign io_error_source_data = io_read_error_delayed_0; // @[LoadPipe.scala 392:26]
  assign io_error_source_l2 = s3_flag_error; // @[LoadPipe.scala 407:22]
  assign io_error_paddr = s3_paddr; // @[LoadPipe.scala 404:18]
  assign io_error_report_to_beu = (s3_tag_error | io_read_error_delayed_0) & s3_valid; // @[LoadPipe.scala 403:61]
  assign io_error_valid = s3_error & s3_valid; // @[LoadPipe.scala 410:30]
  assign io_perf_0_value = {{5'd0}, io_perf_0_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_1_value = {{5'd0}, io_perf_1_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_2_value = {{5'd0}, io_perf_2_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_3_value = {{5'd0}, io_perf_3_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_4_value = {{5'd0}, io_perf_4_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign wpu_clock = clock;
  assign wpu_reset = reset;
  assign wpu_io_req_bits_vaddr = io_lsu_req_bits_addr; // @[LoadPipe.scala 167:25]
  assign wpu_io_req_bits_replayCarry_real_way_en = io_lsu_req_bits_replayCarry_real_way_en; // @[LoadPipe.scala 168:31]
  assign wpu_io_req_bits_replayCarry_valid = io_lsu_req_bits_replayCarry_valid; // @[LoadPipe.scala 168:31]
  assign wpu_io_check_valid = s1_valid; // @[LoadPipe.scala 174:22]
  assign wpu_io_check_bits_s1_tag_resp_0 = {{6'd0}, tag_resp_0}; // @[LoadPipe.scala 171:33]
  assign wpu_io_check_bits_s1_tag_resp_1 = {{6'd0}, tag_resp_1}; // @[LoadPipe.scala 171:33]
  assign wpu_io_check_bits_s1_tag_resp_2 = {{6'd0}, tag_resp_2}; // @[LoadPipe.scala 171:33]
  assign wpu_io_check_bits_s1_tag_resp_3 = {{6'd0}, tag_resp_3}; // @[LoadPipe.scala 171:33]
  assign wpu_io_check_bits_s1_tag_resp_4 = {{6'd0}, tag_resp_4}; // @[LoadPipe.scala 171:33]
  assign wpu_io_check_bits_s1_tag_resp_5 = {{6'd0}, tag_resp_5}; // @[LoadPipe.scala 171:33]
  assign wpu_io_check_bits_s1_tag_resp_6 = {{6'd0}, tag_resp_6}; // @[LoadPipe.scala 171:33]
  assign wpu_io_check_bits_s1_tag_resp_7 = {{6'd0}, tag_resp_7}; // @[LoadPipe.scala 171:33]
  assign wpu_io_check_bits_s1_meta_resp_0_coh_state = io_meta_resp_0_coh_state; // @[LoadPipe.scala 172:34]
  assign wpu_io_check_bits_s1_meta_resp_1_coh_state = io_meta_resp_1_coh_state; // @[LoadPipe.scala 172:34]
  assign wpu_io_check_bits_s1_meta_resp_2_coh_state = io_meta_resp_2_coh_state; // @[LoadPipe.scala 172:34]
  assign wpu_io_check_bits_s1_meta_resp_3_coh_state = io_meta_resp_3_coh_state; // @[LoadPipe.scala 172:34]
  assign wpu_io_check_bits_s1_meta_resp_4_coh_state = io_meta_resp_4_coh_state; // @[LoadPipe.scala 172:34]
  assign wpu_io_check_bits_s1_meta_resp_5_coh_state = io_meta_resp_5_coh_state; // @[LoadPipe.scala 172:34]
  assign wpu_io_check_bits_s1_meta_resp_6_coh_state = io_meta_resp_6_coh_state; // @[LoadPipe.scala 172:34]
  assign wpu_io_check_bits_s1_meta_resp_7_coh_state = io_meta_resp_7_coh_state; // @[LoadPipe.scala 172:34]
  assign wpu_io_check_bits_s1_real_tag = {{6'd0}, io_lsu_s1_paddr_dup_dcache[35:12]}; // @[LoadPipe.scala 173:33]
  always @(posedge clock) begin
    if (s0_fire) begin // @[Reg.scala 17:18]
      s1_req_cmd <= io_lsu_req_bits_cmd; // @[Reg.scala 17:22]
    end
    if (s0_fire) begin // @[Reg.scala 17:18]
      s1_req_addr <= io_lsu_req_bits_addr; // @[Reg.scala 17:22]
    end
    if (s0_fire) begin // @[Reg.scala 17:18]
      s1_req_instrtype <= io_lsu_req_bits_instrtype; // @[Reg.scala 17:22]
    end
    if (s0_fire) begin // @[Reg.scala 17:18]
      s1_bank_oh <= _GEN_54; // @[Reg.scala 17:22]
    end
    if (s1_valid) begin // @[Reg.scala 17:18]
      s2_req_cmd <= s1_req_cmd; // @[Reg.scala 17:22]
    end
    if (s1_valid) begin // @[Reg.scala 17:18]
      s2_req_instrtype <= s1_req_instrtype; // @[Reg.scala 17:22]
    end
    if (s1_valid) begin // @[Reg.scala 17:18]
      s2_paddr <= io_lsu_s1_paddr_dup_dcache; // @[Reg.scala 17:22]
    end
    if (s1_valid) begin // @[Reg.scala 17:18]
      s2_vaddr <= s1_vaddr; // @[Reg.scala 17:22]
    end
    if (s1_valid) begin // @[Reg.scala 17:18]
      s2_tag_match <= s1_tag_match_dup_dc; // @[Reg.scala 17:22]
    end
    s2_hit_dup_lsu <= |s1_tag_match_way_dup_lsu; // @[LoadPipe.scala 194:55]
    if (s1_valid) begin // @[Reg.scala 17:18]
      if (s1_tag_match_dup_dc) begin // @[LoadPipe.scala 204:24]
        s2_hit_coh_state <= _s1_hit_meta_T_22;
      end else begin
        s2_hit_coh_state <= 2'h0;
      end
    end
    if (s1_valid) begin // @[Reg.scala 17:18]
      if (s1_need_replacement) begin // @[LoadPipe.scala 218:22]
        s2_way_en <= s1_repl_way_en;
      end else begin
        s2_way_en <= s1_tag_match_way_dup_dc;
      end
    end
    if (s1_valid) begin // @[Reg.scala 17:18]
      s2_repl_coh_state <= s1_repl_coh_state; // @[Reg.scala 17:22]
    end
    if (s1_valid) begin // @[Reg.scala 17:18]
      s2_repl_tag <= s1_repl_tag; // @[Reg.scala 17:22]
    end
    if (s1_valid) begin // @[Reg.scala 17:18]
      s2_encTag <= s1_encTag; // @[Reg.scala 17:22]
    end
    if (s1_valid) begin // @[Reg.scala 17:18]
      s2_nack_data <= s1_nack_data; // @[Reg.scala 17:22]
    end
    if (s1_valid) begin // @[Reg.scala 17:18]
      if (s1_need_replacement) begin // @[LoadPipe.scala 237:26]
        s2_flag_error <= 1'h0;
      end else begin
        s2_flag_error <= s1_hit_error;
      end
    end
    if (s1_valid) begin // @[Reg.scala 17:18]
      s2_can_send_miss_req <= s1_will_send_miss_req; // @[Reg.scala 17:22]
    end
    s3_valid <= s2_fire; // @[LoadPipe.scala 379:25]
    if (s2_fire) begin // @[Reg.scala 17:18]
      s3_paddr <= s2_paddr; // @[Reg.scala 17:22]
    end
    if (s2_fire) begin // @[Reg.scala 17:18]
      s3_hit <= s2_hit; // @[Reg.scala 17:22]
    end
    if (s2_fire) begin // @[Reg.scala 17:18]
      s3_tag_error <= s2_tag_error; // @[Reg.scala 17:22]
    end
    if (s2_fire) begin // @[Reg.scala 17:18]
      s3_flag_error <= s2_flag_error; // @[Reg.scala 17:22]
    end
    io_replace_access_valid_REG <= io_meta_read_valid; // @[Decoupled.scala 50:35]
    io_replace_access_valid_REG_1 <= io_replace_access_valid_REG & s1_valid & _s2_valid_T; // @[LoadPipe.scala 413:87]
    io_replace_access_valid_REG_2 <= io_replace_access_valid_REG_1 & ~s2_nack_no_mshr; // @[LoadPipe.scala 413:107]
    io_replace_access_bits_set_REG <= s1_req_addr[11:6]; // @[L1Cache.scala 81:33]
    io_replace_access_bits_set_REG_1 <= io_replace_access_bits_set_REG; // @[LoadPipe.scala 414:40]
    if (s1_tag_match_dup_dc) begin // @[LoadPipe.scala 415:52]
      io_replace_access_bits_way_REG <= _io_replace_access_bits_way_T_6;
    end else begin
      io_replace_access_bits_way_REG <= io_replace_way_way;
    end
    io_replace_access_bits_way_REG_1 <= io_replace_access_bits_way_REG; // @[LoadPipe.scala 415:40]
    io_perf_0_value_REG <= io_lsu_req_ready & io_lsu_req_valid; // @[Decoupled.scala 50:35]
    io_perf_0_value_REG_1 <= io_perf_0_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_1_value_REG <= io_lsu_resp_valid & resp_bits_replay; // @[LoadPipe.scala 456:54]
    io_perf_1_value_REG_1 <= io_perf_1_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_2_value_REG <= _T_70 & s2_nack_data; // @[LoadPipe.scala 457:74]
    io_perf_2_value_REG_1 <= io_perf_2_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_3_value_REG <= _T_70 & s2_nack_no_mshr; // @[LoadPipe.scala 458:74]
    io_perf_3_value_REG_1 <= io_perf_3_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_4_value_REG <= _T_70 & io_bank_conflict_slow; // @[LoadPipe.scala 459:74]
    io_perf_4_value_REG_1 <= io_perf_4_value_REG; // @[PerfCounterUtils.scala 188:27]
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadPipe.scala 143:18]
      s1_valid <= 1'h0; // @[LoadPipe.scala 143:29]
    end else begin
      s1_valid <= s0_fire | _GEN_10;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadPipe.scala 256:18]
      s2_fire <= 1'h0; // @[LoadPipe.scala 256:29]
    end else if (s1_valid) begin // @[LoadPipe.scala 257:33]
      s2_fire <= ~io_lsu_s1_kill; // @[LoadPipe.scala 257:44]
    end else if (io_lsu_resp_valid) begin // @[LoadPipe.scala 245:25]
      s2_fire <= 1'h0;
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
  s1_valid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  s1_req_cmd = _RAND_1[4:0];
  _RAND_2 = {2{`RANDOM}};
  s1_req_addr = _RAND_2[35:0];
  _RAND_3 = {1{`RANDOM}};
  s1_req_instrtype = _RAND_3[3:0];
  _RAND_4 = {1{`RANDOM}};
  s1_bank_oh = _RAND_4[8:0];
  _RAND_5 = {1{`RANDOM}};
  s2_fire = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  s2_req_cmd = _RAND_6[4:0];
  _RAND_7 = {1{`RANDOM}};
  s2_req_instrtype = _RAND_7[3:0];
  _RAND_8 = {2{`RANDOM}};
  s2_paddr = _RAND_8[35:0];
  _RAND_9 = {2{`RANDOM}};
  s2_vaddr = _RAND_9[35:0];
  _RAND_10 = {1{`RANDOM}};
  s2_tag_match = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  s2_hit_dup_lsu = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  s2_hit_coh_state = _RAND_12[1:0];
  _RAND_13 = {1{`RANDOM}};
  s2_way_en = _RAND_13[7:0];
  _RAND_14 = {1{`RANDOM}};
  s2_repl_coh_state = _RAND_14[1:0];
  _RAND_15 = {1{`RANDOM}};
  s2_repl_tag = _RAND_15[23:0];
  _RAND_16 = {1{`RANDOM}};
  s2_encTag = _RAND_16[29:0];
  _RAND_17 = {1{`RANDOM}};
  s2_nack_data = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  s2_flag_error = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  s2_can_send_miss_req = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  s3_valid = _RAND_20[0:0];
  _RAND_21 = {2{`RANDOM}};
  s3_paddr = _RAND_21[35:0];
  _RAND_22 = {1{`RANDOM}};
  s3_hit = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  s3_tag_error = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  s3_flag_error = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  io_replace_access_valid_REG = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  io_replace_access_valid_REG_1 = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  io_replace_access_valid_REG_2 = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  io_replace_access_bits_set_REG = _RAND_28[5:0];
  _RAND_29 = {1{`RANDOM}};
  io_replace_access_bits_set_REG_1 = _RAND_29[5:0];
  _RAND_30 = {1{`RANDOM}};
  io_replace_access_bits_way_REG = _RAND_30[2:0];
  _RAND_31 = {1{`RANDOM}};
  io_replace_access_bits_way_REG_1 = _RAND_31[2:0];
  _RAND_32 = {1{`RANDOM}};
  io_perf_0_value_REG = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  io_perf_0_value_REG_1 = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  io_perf_1_value_REG = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  io_perf_1_value_REG_1 = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  io_perf_2_value_REG = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  io_perf_2_value_REG_1 = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  io_perf_3_value_REG = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  io_perf_3_value_REG_1 = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  io_perf_4_value_REG = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  io_perf_4_value_REG_1 = _RAND_41[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    s1_valid = 1'h0;
  end
  if (reset) begin
    s2_fire = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

