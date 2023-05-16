module FastArbiter(
  input          clock,
  input          reset,
  output         io_in_0_ready,
  input          io_in_0_valid,
  input  [1:0]   io_in_0_bits_miss_id,
  input  [1:0]   io_in_0_bits_miss_param,
  input          io_in_0_bits_miss_dirty,
  input  [7:0]   io_in_0_bits_miss_way_en,
  input  [3:0]   io_in_0_bits_source,
  input  [4:0]   io_in_0_bits_cmd,
  input  [38:0]  io_in_0_bits_vaddr,
  input  [35:0]  io_in_0_bits_addr,
  input  [511:0] io_in_0_bits_store_data,
  input  [2:0]   io_in_0_bits_word_idx,
  input  [63:0]  io_in_0_bits_amo_data,
  input  [7:0]   io_in_0_bits_amo_mask,
  input          io_in_0_bits_error,
  input  [3:0]   io_in_0_bits_id,
  output         io_in_1_ready,
  input          io_in_1_valid,
  input  [1:0]   io_in_1_bits_miss_id,
  input  [1:0]   io_in_1_bits_miss_param,
  input          io_in_1_bits_miss_dirty,
  input  [7:0]   io_in_1_bits_miss_way_en,
  input  [3:0]   io_in_1_bits_source,
  input  [4:0]   io_in_1_bits_cmd,
  input  [38:0]  io_in_1_bits_vaddr,
  input  [35:0]  io_in_1_bits_addr,
  input  [511:0] io_in_1_bits_store_data,
  input  [2:0]   io_in_1_bits_word_idx,
  input  [63:0]  io_in_1_bits_amo_data,
  input  [7:0]   io_in_1_bits_amo_mask,
  input          io_in_1_bits_error,
  input  [3:0]   io_in_1_bits_id,
  output         io_in_2_ready,
  input          io_in_2_valid,
  input  [1:0]   io_in_2_bits_miss_id,
  input  [1:0]   io_in_2_bits_miss_param,
  input          io_in_2_bits_miss_dirty,
  input  [7:0]   io_in_2_bits_miss_way_en,
  input  [3:0]   io_in_2_bits_source,
  input  [4:0]   io_in_2_bits_cmd,
  input  [38:0]  io_in_2_bits_vaddr,
  input  [35:0]  io_in_2_bits_addr,
  input  [511:0] io_in_2_bits_store_data,
  input  [2:0]   io_in_2_bits_word_idx,
  input  [63:0]  io_in_2_bits_amo_data,
  input  [7:0]   io_in_2_bits_amo_mask,
  input          io_in_2_bits_error,
  input  [3:0]   io_in_2_bits_id,
  output         io_in_3_ready,
  input          io_in_3_valid,
  input  [1:0]   io_in_3_bits_miss_id,
  input  [1:0]   io_in_3_bits_miss_param,
  input          io_in_3_bits_miss_dirty,
  input  [7:0]   io_in_3_bits_miss_way_en,
  input  [3:0]   io_in_3_bits_source,
  input  [4:0]   io_in_3_bits_cmd,
  input  [38:0]  io_in_3_bits_vaddr,
  input  [35:0]  io_in_3_bits_addr,
  input  [511:0] io_in_3_bits_store_data,
  input  [2:0]   io_in_3_bits_word_idx,
  input  [63:0]  io_in_3_bits_amo_data,
  input  [7:0]   io_in_3_bits_amo_mask,
  input          io_in_3_bits_error,
  input  [3:0]   io_in_3_bits_id,
  input          io_out_ready,
  output         io_out_valid,
  output         io_out_bits_miss,
  output [1:0]   io_out_bits_miss_id,
  output [1:0]   io_out_bits_miss_param,
  output         io_out_bits_miss_dirty,
  output [7:0]   io_out_bits_miss_way_en,
  output [3:0]   io_out_bits_source,
  output [4:0]   io_out_bits_cmd,
  output [38:0]  io_out_bits_vaddr,
  output [35:0]  io_out_bits_addr,
  output [511:0] io_out_bits_store_data,
  output [63:0]  io_out_bits_store_mask,
  output [2:0]   io_out_bits_word_idx,
  output [63:0]  io_out_bits_amo_data,
  output [7:0]   io_out_bits_amo_mask,
  output         io_out_bits_error,
  output [3:0]   io_out_bits_id
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire [3:0] valids = {io_in_3_valid,io_in_2_valid,io_in_1_valid,io_in_0_valid}; // @[FastArbiter.scala 36:50]
  reg [3:0] rrGrantMask; // @[Reg.scala 28:20]
  reg [3:0] pendingMask; // @[Reg.scala 28:20]
  wire [3:0] _rrSelOH_T = rrGrantMask & pendingMask; // @[FastArbiter.scala 51:47]
  wire [1:0] rrSelOH_hi = {_rrSelOH_T[0],_rrSelOH_T[1]}; // @[Cat.scala 31:58]
  wire [2:0] _rrSelOH_T_12 = {_rrSelOH_T[0],_rrSelOH_T[1],_rrSelOH_T[2]}; // @[Cat.scala 31:58]
  wire  _rrSelOH_T_15 = _rrSelOH_T[3] & ~(|_rrSelOH_T_12); // @[FastArbiter.scala 28:24]
  wire  _rrSelOH_T_11 = _rrSelOH_T[2] & ~(|rrSelOH_hi); // @[FastArbiter.scala 28:24]
  wire  _rrSelOH_T_7 = _rrSelOH_T[1] & ~(|_rrSelOH_T[0]); // @[FastArbiter.scala 28:24]
  wire [3:0] rrSelOH = {_rrSelOH_T_15,_rrSelOH_T_11,_rrSelOH_T_7,_rrSelOH_T[0]}; // @[FastArbiter.scala 51:80]
  wire [3:0] _rrValid_T = rrSelOH & valids; // @[FastArbiter.scala 53:26]
  wire  rrValid = |_rrValid_T; // @[FastArbiter.scala 53:39]
  wire [1:0] firstOneOH_hi = {valids[0],valids[1]}; // @[Cat.scala 31:58]
  wire [2:0] _firstOneOH_T_11 = {valids[0],valids[1],valids[2]}; // @[Cat.scala 31:58]
  wire  _firstOneOH_T_14 = valids[3] & ~(|_firstOneOH_T_11); // @[FastArbiter.scala 28:24]
  wire  _firstOneOH_T_10 = valids[2] & ~(|firstOneOH_hi); // @[FastArbiter.scala 28:24]
  wire  _firstOneOH_T_6 = valids[1] & ~(|valids[0]); // @[FastArbiter.scala 28:24]
  wire [3:0] firstOneOH = {_firstOneOH_T_14,_firstOneOH_T_10,_firstOneOH_T_6,valids[0]}; // @[FastArbiter.scala 52:62]
  wire [3:0] chosenOH = rrValid ? rrSelOH : firstOneOH; // @[FastArbiter.scala 54:18]
  wire [3:0] _pendingMask_T = ~chosenOH; // @[FastArbiter.scala 39:15]
  wire [3:0] _pendingMask_T_1 = valids & _pendingMask_T; // @[FastArbiter.scala 39:12]
  wire  _pendingMask_T_2 = io_out_ready & io_out_valid; // @[Decoupled.scala 50:35]
  wire  _rrGrantMask_T_1 = |chosenOH[0]; // @[FastArbiter.scala 49:51]
  wire  _rrGrantMask_T_3 = |chosenOH[1:0]; // @[FastArbiter.scala 49:51]
  wire  _rrGrantMask_T_5 = |chosenOH[2:0]; // @[FastArbiter.scala 49:51]
  wire [3:0] _rrGrantMask_T_6 = {_rrGrantMask_T_5,_rrGrantMask_T_3,_rrGrantMask_T_1,1'h0}; // @[FastArbiter.scala 50:12]
  wire [3:0] _io_out_bits_T_4 = chosenOH[0] ? io_in_0_bits_id : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] _io_out_bits_T_5 = chosenOH[1] ? io_in_1_bits_id : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] _io_out_bits_T_6 = chosenOH[2] ? io_in_2_bits_id : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] _io_out_bits_T_7 = chosenOH[3] ? io_in_3_bits_id : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] _io_out_bits_T_8 = _io_out_bits_T_4 | _io_out_bits_T_5; // @[Mux.scala 27:73]
  wire [3:0] _io_out_bits_T_9 = _io_out_bits_T_8 | _io_out_bits_T_6; // @[Mux.scala 27:73]
  wire [7:0] _io_out_bits_T_32 = chosenOH[0] ? io_in_0_bits_amo_mask : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _io_out_bits_T_33 = chosenOH[1] ? io_in_1_bits_amo_mask : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _io_out_bits_T_34 = chosenOH[2] ? io_in_2_bits_amo_mask : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _io_out_bits_T_35 = chosenOH[3] ? io_in_3_bits_amo_mask : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _io_out_bits_T_36 = _io_out_bits_T_32 | _io_out_bits_T_33; // @[Mux.scala 27:73]
  wire [7:0] _io_out_bits_T_37 = _io_out_bits_T_36 | _io_out_bits_T_34; // @[Mux.scala 27:73]
  wire [63:0] _io_out_bits_T_39 = chosenOH[0] ? io_in_0_bits_amo_data : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _io_out_bits_T_40 = chosenOH[1] ? io_in_1_bits_amo_data : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _io_out_bits_T_41 = chosenOH[2] ? io_in_2_bits_amo_data : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _io_out_bits_T_42 = chosenOH[3] ? io_in_3_bits_amo_data : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _io_out_bits_T_43 = _io_out_bits_T_39 | _io_out_bits_T_40; // @[Mux.scala 27:73]
  wire [63:0] _io_out_bits_T_44 = _io_out_bits_T_43 | _io_out_bits_T_41; // @[Mux.scala 27:73]
  wire [2:0] _io_out_bits_T_46 = chosenOH[0] ? io_in_0_bits_word_idx : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_out_bits_T_47 = chosenOH[1] ? io_in_1_bits_word_idx : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_out_bits_T_48 = chosenOH[2] ? io_in_2_bits_word_idx : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_out_bits_T_49 = chosenOH[3] ? io_in_3_bits_word_idx : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_out_bits_T_50 = _io_out_bits_T_46 | _io_out_bits_T_47; // @[Mux.scala 27:73]
  wire [2:0] _io_out_bits_T_51 = _io_out_bits_T_50 | _io_out_bits_T_48; // @[Mux.scala 27:73]
  wire [63:0] _io_out_bits_T_53 = chosenOH[0] ? 64'hffffffffffffffff : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _io_out_bits_T_54 = chosenOH[1] ? 64'hffffffffffffffff : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _io_out_bits_T_55 = chosenOH[2] ? 64'hffffffffffffffff : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _io_out_bits_T_56 = chosenOH[3] ? 64'hffffffffffffffff : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _io_out_bits_T_57 = _io_out_bits_T_53 | _io_out_bits_T_54; // @[Mux.scala 27:73]
  wire [63:0] _io_out_bits_T_58 = _io_out_bits_T_57 | _io_out_bits_T_55; // @[Mux.scala 27:73]
  wire [511:0] _io_out_bits_T_60 = chosenOH[0] ? io_in_0_bits_store_data : 512'h0; // @[Mux.scala 27:73]
  wire [511:0] _io_out_bits_T_61 = chosenOH[1] ? io_in_1_bits_store_data : 512'h0; // @[Mux.scala 27:73]
  wire [511:0] _io_out_bits_T_62 = chosenOH[2] ? io_in_2_bits_store_data : 512'h0; // @[Mux.scala 27:73]
  wire [511:0] _io_out_bits_T_63 = chosenOH[3] ? io_in_3_bits_store_data : 512'h0; // @[Mux.scala 27:73]
  wire [511:0] _io_out_bits_T_64 = _io_out_bits_T_60 | _io_out_bits_T_61; // @[Mux.scala 27:73]
  wire [511:0] _io_out_bits_T_65 = _io_out_bits_T_64 | _io_out_bits_T_62; // @[Mux.scala 27:73]
  wire [35:0] _io_out_bits_T_67 = chosenOH[0] ? io_in_0_bits_addr : 36'h0; // @[Mux.scala 27:73]
  wire [35:0] _io_out_bits_T_68 = chosenOH[1] ? io_in_1_bits_addr : 36'h0; // @[Mux.scala 27:73]
  wire [35:0] _io_out_bits_T_69 = chosenOH[2] ? io_in_2_bits_addr : 36'h0; // @[Mux.scala 27:73]
  wire [35:0] _io_out_bits_T_70 = chosenOH[3] ? io_in_3_bits_addr : 36'h0; // @[Mux.scala 27:73]
  wire [35:0] _io_out_bits_T_71 = _io_out_bits_T_67 | _io_out_bits_T_68; // @[Mux.scala 27:73]
  wire [35:0] _io_out_bits_T_72 = _io_out_bits_T_71 | _io_out_bits_T_69; // @[Mux.scala 27:73]
  wire [38:0] _io_out_bits_T_74 = chosenOH[0] ? io_in_0_bits_vaddr : 39'h0; // @[Mux.scala 27:73]
  wire [38:0] _io_out_bits_T_75 = chosenOH[1] ? io_in_1_bits_vaddr : 39'h0; // @[Mux.scala 27:73]
  wire [38:0] _io_out_bits_T_76 = chosenOH[2] ? io_in_2_bits_vaddr : 39'h0; // @[Mux.scala 27:73]
  wire [38:0] _io_out_bits_T_77 = chosenOH[3] ? io_in_3_bits_vaddr : 39'h0; // @[Mux.scala 27:73]
  wire [38:0] _io_out_bits_T_78 = _io_out_bits_T_74 | _io_out_bits_T_75; // @[Mux.scala 27:73]
  wire [38:0] _io_out_bits_T_79 = _io_out_bits_T_78 | _io_out_bits_T_76; // @[Mux.scala 27:73]
  wire [4:0] _io_out_bits_T_81 = chosenOH[0] ? io_in_0_bits_cmd : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_out_bits_T_82 = chosenOH[1] ? io_in_1_bits_cmd : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_out_bits_T_83 = chosenOH[2] ? io_in_2_bits_cmd : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_out_bits_T_84 = chosenOH[3] ? io_in_3_bits_cmd : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_out_bits_T_85 = _io_out_bits_T_81 | _io_out_bits_T_82; // @[Mux.scala 27:73]
  wire [4:0] _io_out_bits_T_86 = _io_out_bits_T_85 | _io_out_bits_T_83; // @[Mux.scala 27:73]
  wire [3:0] _io_out_bits_T_88 = chosenOH[0] ? io_in_0_bits_source : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] _io_out_bits_T_89 = chosenOH[1] ? io_in_1_bits_source : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] _io_out_bits_T_90 = chosenOH[2] ? io_in_2_bits_source : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] _io_out_bits_T_91 = chosenOH[3] ? io_in_3_bits_source : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] _io_out_bits_T_92 = _io_out_bits_T_88 | _io_out_bits_T_89; // @[Mux.scala 27:73]
  wire [3:0] _io_out_bits_T_93 = _io_out_bits_T_92 | _io_out_bits_T_90; // @[Mux.scala 27:73]
  wire [7:0] _io_out_bits_T_116 = chosenOH[0] ? io_in_0_bits_miss_way_en : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _io_out_bits_T_117 = chosenOH[1] ? io_in_1_bits_miss_way_en : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _io_out_bits_T_118 = chosenOH[2] ? io_in_2_bits_miss_way_en : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _io_out_bits_T_119 = chosenOH[3] ? io_in_3_bits_miss_way_en : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _io_out_bits_T_120 = _io_out_bits_T_116 | _io_out_bits_T_117; // @[Mux.scala 27:73]
  wire [7:0] _io_out_bits_T_121 = _io_out_bits_T_120 | _io_out_bits_T_118; // @[Mux.scala 27:73]
  wire [1:0] _io_out_bits_T_130 = chosenOH[0] ? io_in_0_bits_miss_param : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_out_bits_T_131 = chosenOH[1] ? io_in_1_bits_miss_param : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_out_bits_T_132 = chosenOH[2] ? io_in_2_bits_miss_param : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_out_bits_T_133 = chosenOH[3] ? io_in_3_bits_miss_param : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_out_bits_T_134 = _io_out_bits_T_130 | _io_out_bits_T_131; // @[Mux.scala 27:73]
  wire [1:0] _io_out_bits_T_135 = _io_out_bits_T_134 | _io_out_bits_T_132; // @[Mux.scala 27:73]
  wire [1:0] _io_out_bits_T_137 = chosenOH[0] ? io_in_0_bits_miss_id : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_out_bits_T_138 = chosenOH[1] ? io_in_1_bits_miss_id : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_out_bits_T_139 = chosenOH[2] ? io_in_2_bits_miss_id : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_out_bits_T_140 = chosenOH[3] ? io_in_3_bits_miss_id : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _io_out_bits_T_141 = _io_out_bits_T_137 | _io_out_bits_T_138; // @[Mux.scala 27:73]
  wire [1:0] _io_out_bits_T_142 = _io_out_bits_T_141 | _io_out_bits_T_139; // @[Mux.scala 27:73]
  assign io_in_0_ready = chosenOH[0] & io_out_ready; // @[FastArbiter.scala 60:39]
  assign io_in_1_ready = chosenOH[1] & io_out_ready; // @[FastArbiter.scala 60:39]
  assign io_in_2_ready = chosenOH[2] & io_out_ready; // @[FastArbiter.scala 60:39]
  assign io_in_3_ready = chosenOH[3] & io_out_ready; // @[FastArbiter.scala 60:39]
  assign io_out_valid = |valids; // @[FastArbiter.scala 56:29]
  assign io_out_bits_miss = chosenOH[0] | chosenOH[1] | chosenOH[2] | chosenOH[3]; // @[Mux.scala 27:73]
  assign io_out_bits_miss_id = _io_out_bits_T_142 | _io_out_bits_T_140; // @[Mux.scala 27:73]
  assign io_out_bits_miss_param = _io_out_bits_T_135 | _io_out_bits_T_133; // @[Mux.scala 27:73]
  assign io_out_bits_miss_dirty = chosenOH[0] & io_in_0_bits_miss_dirty | chosenOH[1] & io_in_1_bits_miss_dirty |
    chosenOH[2] & io_in_2_bits_miss_dirty | chosenOH[3] & io_in_3_bits_miss_dirty; // @[Mux.scala 27:73]
  assign io_out_bits_miss_way_en = _io_out_bits_T_121 | _io_out_bits_T_119; // @[Mux.scala 27:73]
  assign io_out_bits_source = _io_out_bits_T_93 | _io_out_bits_T_91; // @[Mux.scala 27:73]
  assign io_out_bits_cmd = _io_out_bits_T_86 | _io_out_bits_T_84; // @[Mux.scala 27:73]
  assign io_out_bits_vaddr = _io_out_bits_T_79 | _io_out_bits_T_77; // @[Mux.scala 27:73]
  assign io_out_bits_addr = _io_out_bits_T_72 | _io_out_bits_T_70; // @[Mux.scala 27:73]
  assign io_out_bits_store_data = _io_out_bits_T_65 | _io_out_bits_T_63; // @[Mux.scala 27:73]
  assign io_out_bits_store_mask = _io_out_bits_T_58 | _io_out_bits_T_56; // @[Mux.scala 27:73]
  assign io_out_bits_word_idx = _io_out_bits_T_51 | _io_out_bits_T_49; // @[Mux.scala 27:73]
  assign io_out_bits_amo_data = _io_out_bits_T_44 | _io_out_bits_T_42; // @[Mux.scala 27:73]
  assign io_out_bits_amo_mask = _io_out_bits_T_37 | _io_out_bits_T_35; // @[Mux.scala 27:73]
  assign io_out_bits_error = chosenOH[0] & io_in_0_bits_error | chosenOH[1] & io_in_1_bits_error | chosenOH[2] &
    io_in_2_bits_error | chosenOH[3] & io_in_3_bits_error; // @[Mux.scala 27:73]
  assign io_out_bits_id = _io_out_bits_T_9 | _io_out_bits_T_7; // @[Mux.scala 27:73]
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Reg.scala 29:18]
      rrGrantMask <= 4'h0; // @[Reg.scala 29:22]
    end else if (_pendingMask_T_2) begin // @[Reg.scala 28:20]
      rrGrantMask <= _rrGrantMask_T_6;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Reg.scala 29:18]
      pendingMask <= 4'h0; // @[Reg.scala 29:22]
    end else if (_pendingMask_T_2) begin // @[Reg.scala 28:20]
      pendingMask <= _pendingMask_T_1;
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
  rrGrantMask = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  pendingMask = _RAND_1[3:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    rrGrantMask = 4'h0;
  end
  if (reset) begin
    pendingMask = 4'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

