module DuplicatedTagArray(
  input         clock,
  input         reset,
  input         io_read_0_valid,
  input  [5:0]  io_read_0_bits_idx,
  input         io_read_1_valid,
  input  [5:0]  io_read_1_bits_idx,
  output        io_read_2_ready,
  input         io_read_2_valid,
  input  [5:0]  io_read_2_bits_idx,
  output [29:0] io_resp_0_0,
  output [29:0] io_resp_0_1,
  output [29:0] io_resp_0_2,
  output [29:0] io_resp_0_3,
  output [29:0] io_resp_0_4,
  output [29:0] io_resp_0_5,
  output [29:0] io_resp_0_6,
  output [29:0] io_resp_0_7,
  output [29:0] io_resp_1_0,
  output [29:0] io_resp_1_1,
  output [29:0] io_resp_1_2,
  output [29:0] io_resp_1_3,
  output [29:0] io_resp_1_4,
  output [29:0] io_resp_1_5,
  output [29:0] io_resp_1_6,
  output [29:0] io_resp_1_7,
  output [29:0] io_resp_2_0,
  output [29:0] io_resp_2_1,
  output [29:0] io_resp_2_2,
  output [29:0] io_resp_2_3,
  output [29:0] io_resp_2_4,
  output [29:0] io_resp_2_5,
  output [29:0] io_resp_2_6,
  output [29:0] io_resp_2_7,
  input         io_write_valid,
  input  [5:0]  io_write_bits_idx,
  input  [7:0]  io_write_bits_way_en,
  input  [23:0] io_write_bits_tag,
  input         io_cacheOp_req_valid,
  input  [63:0] io_cacheOp_req_bits_wayNum,
  input  [63:0] io_cacheOp_req_bits_index,
  input  [63:0] io_cacheOp_req_bits_opCode,
  input  [63:0] io_cacheOp_req_bits_write_tag_low,
  input  [63:0] io_cacheOp_req_bits_write_tag_ecc,
  output        io_cacheOp_resp_valid,
  output [63:0] io_cacheOp_resp_bits_read_tag_low,
  output [63:0] io_cacheOp_resp_bits_read_tag_ecc,
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
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire  array_0_clock; // @[TagArray.scala 114:43]
  wire  array_0_reset; // @[TagArray.scala 114:43]
  wire  array_0_io_read_ready; // @[TagArray.scala 114:43]
  wire  array_0_io_read_valid; // @[TagArray.scala 114:43]
  wire [5:0] array_0_io_read_bits_idx; // @[TagArray.scala 114:43]
  wire [23:0] array_0_io_resp_0; // @[TagArray.scala 114:43]
  wire [23:0] array_0_io_resp_1; // @[TagArray.scala 114:43]
  wire [23:0] array_0_io_resp_2; // @[TagArray.scala 114:43]
  wire [23:0] array_0_io_resp_3; // @[TagArray.scala 114:43]
  wire [23:0] array_0_io_resp_4; // @[TagArray.scala 114:43]
  wire [23:0] array_0_io_resp_5; // @[TagArray.scala 114:43]
  wire [23:0] array_0_io_resp_6; // @[TagArray.scala 114:43]
  wire [23:0] array_0_io_resp_7; // @[TagArray.scala 114:43]
  wire  array_0_io_write_valid; // @[TagArray.scala 114:43]
  wire [5:0] array_0_io_write_bits_idx; // @[TagArray.scala 114:43]
  wire [7:0] array_0_io_write_bits_way_en; // @[TagArray.scala 114:43]
  wire [23:0] array_0_io_write_bits_tag; // @[TagArray.scala 114:43]
  wire  array_0_io_ecc_read_ready; // @[TagArray.scala 114:43]
  wire  array_0_io_ecc_read_valid; // @[TagArray.scala 114:43]
  wire [5:0] array_0_io_ecc_read_bits_idx; // @[TagArray.scala 114:43]
  wire [5:0] array_0_io_ecc_resp_0; // @[TagArray.scala 114:43]
  wire [5:0] array_0_io_ecc_resp_1; // @[TagArray.scala 114:43]
  wire [5:0] array_0_io_ecc_resp_2; // @[TagArray.scala 114:43]
  wire [5:0] array_0_io_ecc_resp_3; // @[TagArray.scala 114:43]
  wire [5:0] array_0_io_ecc_resp_4; // @[TagArray.scala 114:43]
  wire [5:0] array_0_io_ecc_resp_5; // @[TagArray.scala 114:43]
  wire [5:0] array_0_io_ecc_resp_6; // @[TagArray.scala 114:43]
  wire [5:0] array_0_io_ecc_resp_7; // @[TagArray.scala 114:43]
  wire  array_0_io_ecc_write_valid; // @[TagArray.scala 114:43]
  wire [5:0] array_0_io_ecc_write_bits_idx; // @[TagArray.scala 114:43]
  wire [7:0] array_0_io_ecc_write_bits_way_en; // @[TagArray.scala 114:43]
  wire [5:0] array_0_io_ecc_write_bits_ecc; // @[TagArray.scala 114:43]
  wire  array_1_clock; // @[TagArray.scala 114:43]
  wire  array_1_reset; // @[TagArray.scala 114:43]
  wire  array_1_io_read_ready; // @[TagArray.scala 114:43]
  wire  array_1_io_read_valid; // @[TagArray.scala 114:43]
  wire [5:0] array_1_io_read_bits_idx; // @[TagArray.scala 114:43]
  wire [23:0] array_1_io_resp_0; // @[TagArray.scala 114:43]
  wire [23:0] array_1_io_resp_1; // @[TagArray.scala 114:43]
  wire [23:0] array_1_io_resp_2; // @[TagArray.scala 114:43]
  wire [23:0] array_1_io_resp_3; // @[TagArray.scala 114:43]
  wire [23:0] array_1_io_resp_4; // @[TagArray.scala 114:43]
  wire [23:0] array_1_io_resp_5; // @[TagArray.scala 114:43]
  wire [23:0] array_1_io_resp_6; // @[TagArray.scala 114:43]
  wire [23:0] array_1_io_resp_7; // @[TagArray.scala 114:43]
  wire  array_1_io_write_valid; // @[TagArray.scala 114:43]
  wire [5:0] array_1_io_write_bits_idx; // @[TagArray.scala 114:43]
  wire [7:0] array_1_io_write_bits_way_en; // @[TagArray.scala 114:43]
  wire [23:0] array_1_io_write_bits_tag; // @[TagArray.scala 114:43]
  wire  array_1_io_ecc_read_ready; // @[TagArray.scala 114:43]
  wire  array_1_io_ecc_read_valid; // @[TagArray.scala 114:43]
  wire [5:0] array_1_io_ecc_read_bits_idx; // @[TagArray.scala 114:43]
  wire [5:0] array_1_io_ecc_resp_0; // @[TagArray.scala 114:43]
  wire [5:0] array_1_io_ecc_resp_1; // @[TagArray.scala 114:43]
  wire [5:0] array_1_io_ecc_resp_2; // @[TagArray.scala 114:43]
  wire [5:0] array_1_io_ecc_resp_3; // @[TagArray.scala 114:43]
  wire [5:0] array_1_io_ecc_resp_4; // @[TagArray.scala 114:43]
  wire [5:0] array_1_io_ecc_resp_5; // @[TagArray.scala 114:43]
  wire [5:0] array_1_io_ecc_resp_6; // @[TagArray.scala 114:43]
  wire [5:0] array_1_io_ecc_resp_7; // @[TagArray.scala 114:43]
  wire  array_1_io_ecc_write_valid; // @[TagArray.scala 114:43]
  wire [5:0] array_1_io_ecc_write_bits_idx; // @[TagArray.scala 114:43]
  wire [7:0] array_1_io_ecc_write_bits_way_en; // @[TagArray.scala 114:43]
  wire [5:0] array_1_io_ecc_write_bits_ecc; // @[TagArray.scala 114:43]
  wire  array_2_clock; // @[TagArray.scala 114:43]
  wire  array_2_reset; // @[TagArray.scala 114:43]
  wire  array_2_io_read_ready; // @[TagArray.scala 114:43]
  wire  array_2_io_read_valid; // @[TagArray.scala 114:43]
  wire [5:0] array_2_io_read_bits_idx; // @[TagArray.scala 114:43]
  wire [23:0] array_2_io_resp_0; // @[TagArray.scala 114:43]
  wire [23:0] array_2_io_resp_1; // @[TagArray.scala 114:43]
  wire [23:0] array_2_io_resp_2; // @[TagArray.scala 114:43]
  wire [23:0] array_2_io_resp_3; // @[TagArray.scala 114:43]
  wire [23:0] array_2_io_resp_4; // @[TagArray.scala 114:43]
  wire [23:0] array_2_io_resp_5; // @[TagArray.scala 114:43]
  wire [23:0] array_2_io_resp_6; // @[TagArray.scala 114:43]
  wire [23:0] array_2_io_resp_7; // @[TagArray.scala 114:43]
  wire  array_2_io_write_valid; // @[TagArray.scala 114:43]
  wire [5:0] array_2_io_write_bits_idx; // @[TagArray.scala 114:43]
  wire [7:0] array_2_io_write_bits_way_en; // @[TagArray.scala 114:43]
  wire [23:0] array_2_io_write_bits_tag; // @[TagArray.scala 114:43]
  wire  array_2_io_ecc_read_ready; // @[TagArray.scala 114:43]
  wire  array_2_io_ecc_read_valid; // @[TagArray.scala 114:43]
  wire [5:0] array_2_io_ecc_read_bits_idx; // @[TagArray.scala 114:43]
  wire [5:0] array_2_io_ecc_resp_0; // @[TagArray.scala 114:43]
  wire [5:0] array_2_io_ecc_resp_1; // @[TagArray.scala 114:43]
  wire [5:0] array_2_io_ecc_resp_2; // @[TagArray.scala 114:43]
  wire [5:0] array_2_io_ecc_resp_3; // @[TagArray.scala 114:43]
  wire [5:0] array_2_io_ecc_resp_4; // @[TagArray.scala 114:43]
  wire [5:0] array_2_io_ecc_resp_5; // @[TagArray.scala 114:43]
  wire [5:0] array_2_io_ecc_resp_6; // @[TagArray.scala 114:43]
  wire [5:0] array_2_io_ecc_resp_7; // @[TagArray.scala 114:43]
  wire  array_2_io_ecc_write_valid; // @[TagArray.scala 114:43]
  wire [5:0] array_2_io_ecc_write_bits_idx; // @[TagArray.scala 114:43]
  wire [7:0] array_2_io_ecc_write_bits_way_en; // @[TagArray.scala 114:43]
  wire [5:0] array_2_io_ecc_write_bits_ecc; // @[TagArray.scala 114:43]
  wire [23:0] _ecc_syndromeUInt_T = 24'haaad5b & io_write_bits_tag; // @[ECC.scala 147:74]
  wire  _ecc_syndromeUInt_T_1 = ^_ecc_syndromeUInt_T; // @[ECC.scala 147:79]
  wire [23:0] _ecc_syndromeUInt_T_3 = 24'h33366d & io_write_bits_tag; // @[ECC.scala 147:74]
  wire  _ecc_syndromeUInt_T_4 = ^_ecc_syndromeUInt_T_3; // @[ECC.scala 147:79]
  wire [23:0] _ecc_syndromeUInt_T_6 = 24'hc3c78e & io_write_bits_tag; // @[ECC.scala 147:74]
  wire  _ecc_syndromeUInt_T_7 = ^_ecc_syndromeUInt_T_6; // @[ECC.scala 147:79]
  wire [23:0] _ecc_syndromeUInt_T_9 = 24'hfc07f0 & io_write_bits_tag; // @[ECC.scala 147:74]
  wire  _ecc_syndromeUInt_T_10 = ^_ecc_syndromeUInt_T_9; // @[ECC.scala 147:79]
  wire [23:0] _ecc_syndromeUInt_T_12 = 24'hfff800 & io_write_bits_tag; // @[ECC.scala 147:74]
  wire  _ecc_syndromeUInt_T_13 = ^_ecc_syndromeUInt_T_12; // @[ECC.scala 147:79]
  wire [28:0] _ecc_T = {_ecc_syndromeUInt_T_13,_ecc_syndromeUInt_T_10,_ecc_syndromeUInt_T_7,_ecc_syndromeUInt_T_4,
    _ecc_syndromeUInt_T_1,io_write_bits_tag}; // @[Cat.scala 31:58]
  wire  _ecc_T_1 = ^_ecc_T; // @[ECC.scala 81:55]
  wire [29:0] _ecc_T_3 = {_ecc_T_1,_ecc_syndromeUInt_T_13,_ecc_syndromeUInt_T_10,_ecc_syndromeUInt_T_7,
    _ecc_syndromeUInt_T_4,_ecc_syndromeUInt_T_1,io_write_bits_tag}; // @[Cat.scala 31:58]
  wire [5:0] ecc = _ecc_T_3[29:24]; // @[TagArray.scala 118:11]
  wire  _T_24 = io_cacheOp_req_bits_opCode == 64'h2; // @[CacheInstruction.scala 95:54]
  wire  _T_25 = io_cacheOp_req_valid & _T_24; // @[TagArray.scala 147:30]
  wire [31:0] _array_0_io_read_bits_way_en_T_1 = 32'h1 << io_cacheOp_req_bits_wayNum[4:0]; // @[OneHot.scala 57:35]
  wire [63:0] _GEN_1 = io_cacheOp_req_valid & _T_24 ? io_cacheOp_req_bits_index : {{58'd0}, io_read_0_bits_idx}; // @[TagArray.scala 131:22 147:71 150:33]
  wire  _T_26 = io_cacheOp_req_bits_opCode_dup_0 == 64'h0; // @[CacheInstruction.scala 93:54]
  wire [63:0] _GEN_5 = io_cacheOp_req_dup_0_valid & _T_26 ? io_cacheOp_req_bits_index : {{58'd0}, io_read_0_bits_idx}; // @[TagArray.scala 133:31 155:89 158:37]
  wire  _GEN_7 = io_cacheOp_req_dup_0_valid & _T_26 | _T_25; // @[TagArray.scala 155:89 161:23]
  wire  _T_28 = io_cacheOp_req_bits_opCode_dup_1 == 64'h6; // @[CacheInstruction.scala 99:54]
  wire [63:0] _GEN_9 = io_cacheOp_req_dup_1_valid & _T_28 ? io_cacheOp_req_bits_index : {{58'd0}, io_write_bits_idx}; // @[TagArray.scala 124:28 163:86 166:34]
  wire [31:0] _GEN_10 = io_cacheOp_req_dup_1_valid & _T_28 ? _array_0_io_read_bits_way_en_T_1 : {{24'd0},
    io_write_bits_way_en}; // @[TagArray.scala 124:28 163:86 167:37]
  wire [63:0] _GEN_11 = io_cacheOp_req_dup_1_valid & _T_28 ? io_cacheOp_req_bits_write_tag_low : {{40'd0},
    io_write_bits_tag}; // @[TagArray.scala 124:28 163:86 168:34]
  wire  _GEN_12 = io_cacheOp_req_dup_1_valid & _T_28 | _GEN_7; // @[TagArray.scala 163:86 170:23]
  wire  _T_30 = io_cacheOp_req_bits_opCode_dup_2 == 64'h4; // @[CacheInstruction.scala 97:54]
  wire [63:0] _GEN_14 = io_cacheOp_req_dup_2_valid & _T_30 ? io_cacheOp_req_bits_index : {{58'd0}, io_write_bits_idx}; // @[TagArray.scala 126:36 172:88 175:38]
  wire [31:0] _GEN_15 = io_cacheOp_req_dup_2_valid & _T_30 ? _array_0_io_read_bits_way_en_T_1 : {{24'd0},
    io_write_bits_way_en}; // @[TagArray.scala 127:39 172:88 176:41]
  wire [63:0] _GEN_16 = io_cacheOp_req_dup_2_valid & _T_30 ? io_cacheOp_req_bits_write_tag_ecc : {{58'd0}, ecc}; // @[TagArray.scala 129:36 172:88 177:38]
  wire  _GEN_17 = io_cacheOp_req_dup_2_valid & _T_30 | _GEN_12; // @[TagArray.scala 172:88 179:23]
  wire  _T_32 = io_cacheOp_req_bits_opCode_dup_3 == 64'h2; // @[CacheInstruction.scala 95:54]
  wire [63:0] _GEN_19 = io_cacheOp_req_dup_3_valid & _T_32 ? io_cacheOp_req_bits_index : {{58'd0}, io_read_1_bits_idx}; // @[TagArray.scala 131:22 183:85 186:33]
  wire  _GEN_21 = io_cacheOp_req_dup_3_valid & _T_32 | _GEN_17; // @[TagArray.scala 183:85 189:23]
  wire  _T_34 = io_cacheOp_req_bits_opCode_dup_4 == 64'h0; // @[CacheInstruction.scala 93:54]
  wire [63:0] _GEN_23 = io_cacheOp_req_dup_4_valid & _T_34 ? io_cacheOp_req_bits_index : {{58'd0}, io_read_1_bits_idx}; // @[TagArray.scala 133:31 191:89 194:37]
  wire  _GEN_25 = io_cacheOp_req_dup_4_valid & _T_34 | _GEN_21; // @[TagArray.scala 191:89 197:23]
  wire  _T_36 = io_cacheOp_req_bits_opCode_dup_5 == 64'h6; // @[CacheInstruction.scala 99:54]
  wire [63:0] _GEN_27 = io_cacheOp_req_dup_5_valid & _T_36 ? io_cacheOp_req_bits_index : {{58'd0}, io_write_bits_idx}; // @[TagArray.scala 124:28 199:86 202:34]
  wire [31:0] _GEN_28 = io_cacheOp_req_dup_5_valid & _T_36 ? _array_0_io_read_bits_way_en_T_1 : {{24'd0},
    io_write_bits_way_en}; // @[TagArray.scala 124:28 199:86 203:37]
  wire [63:0] _GEN_29 = io_cacheOp_req_dup_5_valid & _T_36 ? io_cacheOp_req_bits_write_tag_low : {{40'd0},
    io_write_bits_tag}; // @[TagArray.scala 124:28 199:86 204:34]
  wire  _GEN_30 = io_cacheOp_req_dup_5_valid & _T_36 | _GEN_25; // @[TagArray.scala 199:86 206:23]
  wire  _T_38 = io_cacheOp_req_bits_opCode_dup_6 == 64'h4; // @[CacheInstruction.scala 97:54]
  wire [63:0] _GEN_32 = io_cacheOp_req_dup_6_valid & _T_38 ? io_cacheOp_req_bits_index : {{58'd0}, io_write_bits_idx}; // @[TagArray.scala 126:36 208:88 211:38]
  wire [31:0] _GEN_33 = io_cacheOp_req_dup_6_valid & _T_38 ? _array_0_io_read_bits_way_en_T_1 : {{24'd0},
    io_write_bits_way_en}; // @[TagArray.scala 127:39 208:88 212:41]
  wire [63:0] _GEN_34 = io_cacheOp_req_dup_6_valid & _T_38 ? io_cacheOp_req_bits_write_tag_ecc : {{58'd0}, ecc}; // @[TagArray.scala 129:36 208:88 213:38]
  wire  _GEN_35 = io_cacheOp_req_dup_6_valid & _T_38 | _GEN_30; // @[TagArray.scala 208:88 215:23]
  wire  _T_40 = io_cacheOp_req_bits_opCode_dup_7 == 64'h2; // @[CacheInstruction.scala 95:54]
  wire [63:0] _GEN_37 = io_cacheOp_req_dup_7_valid & _T_40 ? io_cacheOp_req_bits_index : {{58'd0}, io_read_2_bits_idx}; // @[TagArray.scala 131:22 218:85 221:33]
  wire  _GEN_39 = io_cacheOp_req_dup_7_valid & _T_40 | _GEN_35; // @[TagArray.scala 218:85 224:23]
  wire  _T_42 = io_cacheOp_req_bits_opCode_dup_8 == 64'h0; // @[CacheInstruction.scala 93:54]
  wire [63:0] _GEN_41 = io_cacheOp_req_dup_8_valid & _T_42 ? io_cacheOp_req_bits_index : {{58'd0}, io_read_2_bits_idx}; // @[TagArray.scala 133:31 226:89 229:37]
  wire  _GEN_43 = io_cacheOp_req_dup_8_valid & _T_42 | _GEN_39; // @[TagArray.scala 226:89 232:23]
  wire  _T_44 = io_cacheOp_req_bits_opCode_dup_9 == 64'h6; // @[CacheInstruction.scala 99:54]
  wire [63:0] _GEN_45 = io_cacheOp_req_dup_9_valid & _T_44 ? io_cacheOp_req_bits_index : {{58'd0}, io_write_bits_idx}; // @[TagArray.scala 124:28 234:86 237:34]
  wire [31:0] _GEN_46 = io_cacheOp_req_dup_9_valid & _T_44 ? _array_0_io_read_bits_way_en_T_1 : {{24'd0},
    io_write_bits_way_en}; // @[TagArray.scala 124:28 234:86 238:37]
  wire [63:0] _GEN_47 = io_cacheOp_req_dup_9_valid & _T_44 ? io_cacheOp_req_bits_write_tag_low : {{40'd0},
    io_write_bits_tag}; // @[TagArray.scala 124:28 234:86 239:34]
  wire  _GEN_48 = io_cacheOp_req_dup_9_valid & _T_44 | _GEN_43; // @[TagArray.scala 234:86 241:23]
  wire  _T_46 = io_cacheOp_req_bits_opCode_dup_10 == 64'h4; // @[CacheInstruction.scala 97:54]
  wire [63:0] _GEN_50 = io_cacheOp_req_dup_10_valid & _T_46 ? io_cacheOp_req_bits_index : {{58'd0}, io_write_bits_idx}; // @[TagArray.scala 126:36 243:90 246:38]
  wire [31:0] _GEN_51 = io_cacheOp_req_dup_10_valid & _T_46 ? _array_0_io_read_bits_way_en_T_1 : {{24'd0},
    io_write_bits_way_en}; // @[TagArray.scala 127:39 243:90 247:41]
  wire [63:0] _GEN_52 = io_cacheOp_req_dup_10_valid & _T_46 ? io_cacheOp_req_bits_write_tag_ecc : {{58'd0}, ecc}; // @[TagArray.scala 129:36 243:90 248:38]
  wire  cacheOpShouldResp = io_cacheOp_req_dup_10_valid & _T_46 | _GEN_48; // @[TagArray.scala 243:90 250:23]
  reg  io_cacheOp_resp_valid_REG; // @[TagArray.scala 253:35]
  reg [63:0] io_cacheOp_resp_bits_read_tag_low_REG; // @[TagArray.scala 254:91]
  wire [23:0] _GEN_54 = array_0_io_resp_0; // @[TagArray.scala 254:{43,43}]
  wire [23:0] _GEN_55 = 3'h1 == io_cacheOp_resp_bits_read_tag_low_REG[2:0] ? array_0_io_resp_1 : _GEN_54; // @[TagArray.scala 254:{43,43}]
  wire [23:0] _GEN_56 = 3'h2 == io_cacheOp_resp_bits_read_tag_low_REG[2:0] ? array_0_io_resp_2 : _GEN_55; // @[TagArray.scala 254:{43,43}]
  wire [23:0] _GEN_57 = 3'h3 == io_cacheOp_resp_bits_read_tag_low_REG[2:0] ? array_0_io_resp_3 : _GEN_56; // @[TagArray.scala 254:{43,43}]
  wire [23:0] _GEN_58 = 3'h4 == io_cacheOp_resp_bits_read_tag_low_REG[2:0] ? array_0_io_resp_4 : _GEN_57; // @[TagArray.scala 254:{43,43}]
  wire [23:0] _GEN_59 = 3'h5 == io_cacheOp_resp_bits_read_tag_low_REG[2:0] ? array_0_io_resp_5 : _GEN_58; // @[TagArray.scala 254:{43,43}]
  wire [23:0] _GEN_60 = 3'h6 == io_cacheOp_resp_bits_read_tag_low_REG[2:0] ? array_0_io_resp_6 : _GEN_59; // @[TagArray.scala 254:{43,43}]
  wire [23:0] _GEN_61 = 3'h7 == io_cacheOp_resp_bits_read_tag_low_REG[2:0] ? array_0_io_resp_7 : _GEN_60; // @[TagArray.scala 254:{43,43}]
  wire [23:0] _io_cacheOp_resp_bits_read_tag_low_T_2 = io_cacheOp_resp_valid ? _GEN_61 : 24'h0; // @[TagArray.scala 254:43]
  reg [63:0] io_cacheOp_resp_bits_read_tag_ecc_REG; // @[TagArray.scala 255:95]
  wire [5:0] _GEN_62 = array_0_io_ecc_resp_0; // @[TagArray.scala 255:{43,43}]
  wire [5:0] _GEN_63 = 3'h1 == io_cacheOp_resp_bits_read_tag_ecc_REG[2:0] ? array_0_io_ecc_resp_1 : _GEN_62; // @[TagArray.scala 255:{43,43}]
  wire [5:0] _GEN_64 = 3'h2 == io_cacheOp_resp_bits_read_tag_ecc_REG[2:0] ? array_0_io_ecc_resp_2 : _GEN_63; // @[TagArray.scala 255:{43,43}]
  wire [5:0] _GEN_65 = 3'h3 == io_cacheOp_resp_bits_read_tag_ecc_REG[2:0] ? array_0_io_ecc_resp_3 : _GEN_64; // @[TagArray.scala 255:{43,43}]
  wire [5:0] _GEN_66 = 3'h4 == io_cacheOp_resp_bits_read_tag_ecc_REG[2:0] ? array_0_io_ecc_resp_4 : _GEN_65; // @[TagArray.scala 255:{43,43}]
  wire [5:0] _GEN_67 = 3'h5 == io_cacheOp_resp_bits_read_tag_ecc_REG[2:0] ? array_0_io_ecc_resp_5 : _GEN_66; // @[TagArray.scala 255:{43,43}]
  wire [5:0] _GEN_68 = 3'h6 == io_cacheOp_resp_bits_read_tag_ecc_REG[2:0] ? array_0_io_ecc_resp_6 : _GEN_67; // @[TagArray.scala 255:{43,43}]
  wire [5:0] _GEN_69 = 3'h7 == io_cacheOp_resp_bits_read_tag_ecc_REG[2:0] ? array_0_io_ecc_resp_7 : _GEN_68; // @[TagArray.scala 255:{43,43}]
  wire [5:0] _io_cacheOp_resp_bits_read_tag_ecc_T_2 = io_cacheOp_resp_valid ? _GEN_69 : 6'h0; // @[TagArray.scala 255:43]
  TagArray array_0 ( // @[TagArray.scala 114:43]
    .clock(array_0_clock),
    .reset(array_0_reset),
    .io_read_ready(array_0_io_read_ready),
    .io_read_valid(array_0_io_read_valid),
    .io_read_bits_idx(array_0_io_read_bits_idx),
    .io_resp_0(array_0_io_resp_0),
    .io_resp_1(array_0_io_resp_1),
    .io_resp_2(array_0_io_resp_2),
    .io_resp_3(array_0_io_resp_3),
    .io_resp_4(array_0_io_resp_4),
    .io_resp_5(array_0_io_resp_5),
    .io_resp_6(array_0_io_resp_6),
    .io_resp_7(array_0_io_resp_7),
    .io_write_valid(array_0_io_write_valid),
    .io_write_bits_idx(array_0_io_write_bits_idx),
    .io_write_bits_way_en(array_0_io_write_bits_way_en),
    .io_write_bits_tag(array_0_io_write_bits_tag),
    .io_ecc_read_ready(array_0_io_ecc_read_ready),
    .io_ecc_read_valid(array_0_io_ecc_read_valid),
    .io_ecc_read_bits_idx(array_0_io_ecc_read_bits_idx),
    .io_ecc_resp_0(array_0_io_ecc_resp_0),
    .io_ecc_resp_1(array_0_io_ecc_resp_1),
    .io_ecc_resp_2(array_0_io_ecc_resp_2),
    .io_ecc_resp_3(array_0_io_ecc_resp_3),
    .io_ecc_resp_4(array_0_io_ecc_resp_4),
    .io_ecc_resp_5(array_0_io_ecc_resp_5),
    .io_ecc_resp_6(array_0_io_ecc_resp_6),
    .io_ecc_resp_7(array_0_io_ecc_resp_7),
    .io_ecc_write_valid(array_0_io_ecc_write_valid),
    .io_ecc_write_bits_idx(array_0_io_ecc_write_bits_idx),
    .io_ecc_write_bits_way_en(array_0_io_ecc_write_bits_way_en),
    .io_ecc_write_bits_ecc(array_0_io_ecc_write_bits_ecc)
  );
  TagArray array_1 ( // @[TagArray.scala 114:43]
    .clock(array_1_clock),
    .reset(array_1_reset),
    .io_read_ready(array_1_io_read_ready),
    .io_read_valid(array_1_io_read_valid),
    .io_read_bits_idx(array_1_io_read_bits_idx),
    .io_resp_0(array_1_io_resp_0),
    .io_resp_1(array_1_io_resp_1),
    .io_resp_2(array_1_io_resp_2),
    .io_resp_3(array_1_io_resp_3),
    .io_resp_4(array_1_io_resp_4),
    .io_resp_5(array_1_io_resp_5),
    .io_resp_6(array_1_io_resp_6),
    .io_resp_7(array_1_io_resp_7),
    .io_write_valid(array_1_io_write_valid),
    .io_write_bits_idx(array_1_io_write_bits_idx),
    .io_write_bits_way_en(array_1_io_write_bits_way_en),
    .io_write_bits_tag(array_1_io_write_bits_tag),
    .io_ecc_read_ready(array_1_io_ecc_read_ready),
    .io_ecc_read_valid(array_1_io_ecc_read_valid),
    .io_ecc_read_bits_idx(array_1_io_ecc_read_bits_idx),
    .io_ecc_resp_0(array_1_io_ecc_resp_0),
    .io_ecc_resp_1(array_1_io_ecc_resp_1),
    .io_ecc_resp_2(array_1_io_ecc_resp_2),
    .io_ecc_resp_3(array_1_io_ecc_resp_3),
    .io_ecc_resp_4(array_1_io_ecc_resp_4),
    .io_ecc_resp_5(array_1_io_ecc_resp_5),
    .io_ecc_resp_6(array_1_io_ecc_resp_6),
    .io_ecc_resp_7(array_1_io_ecc_resp_7),
    .io_ecc_write_valid(array_1_io_ecc_write_valid),
    .io_ecc_write_bits_idx(array_1_io_ecc_write_bits_idx),
    .io_ecc_write_bits_way_en(array_1_io_ecc_write_bits_way_en),
    .io_ecc_write_bits_ecc(array_1_io_ecc_write_bits_ecc)
  );
  TagArray array_2 ( // @[TagArray.scala 114:43]
    .clock(array_2_clock),
    .reset(array_2_reset),
    .io_read_ready(array_2_io_read_ready),
    .io_read_valid(array_2_io_read_valid),
    .io_read_bits_idx(array_2_io_read_bits_idx),
    .io_resp_0(array_2_io_resp_0),
    .io_resp_1(array_2_io_resp_1),
    .io_resp_2(array_2_io_resp_2),
    .io_resp_3(array_2_io_resp_3),
    .io_resp_4(array_2_io_resp_4),
    .io_resp_5(array_2_io_resp_5),
    .io_resp_6(array_2_io_resp_6),
    .io_resp_7(array_2_io_resp_7),
    .io_write_valid(array_2_io_write_valid),
    .io_write_bits_idx(array_2_io_write_bits_idx),
    .io_write_bits_way_en(array_2_io_write_bits_way_en),
    .io_write_bits_tag(array_2_io_write_bits_tag),
    .io_ecc_read_ready(array_2_io_ecc_read_ready),
    .io_ecc_read_valid(array_2_io_ecc_read_valid),
    .io_ecc_read_bits_idx(array_2_io_ecc_read_bits_idx),
    .io_ecc_resp_0(array_2_io_ecc_resp_0),
    .io_ecc_resp_1(array_2_io_ecc_resp_1),
    .io_ecc_resp_2(array_2_io_ecc_resp_2),
    .io_ecc_resp_3(array_2_io_ecc_resp_3),
    .io_ecc_resp_4(array_2_io_ecc_resp_4),
    .io_ecc_resp_5(array_2_io_ecc_resp_5),
    .io_ecc_resp_6(array_2_io_ecc_resp_6),
    .io_ecc_resp_7(array_2_io_ecc_resp_7),
    .io_ecc_write_valid(array_2_io_ecc_write_valid),
    .io_ecc_write_bits_idx(array_2_io_ecc_write_bits_idx),
    .io_ecc_write_bits_way_en(array_2_io_ecc_write_bits_way_en),
    .io_ecc_write_bits_ecc(array_2_io_ecc_write_bits_ecc)
  );
  assign io_read_2_ready = array_2_io_read_ready & array_2_io_ecc_read_ready; // @[TagArray.scala 138:48]
  assign io_resp_0_0 = {array_0_io_ecc_resp_0,array_0_io_resp_0}; // @[Cat.scala 31:58]
  assign io_resp_0_1 = {array_0_io_ecc_resp_1,array_0_io_resp_1}; // @[Cat.scala 31:58]
  assign io_resp_0_2 = {array_0_io_ecc_resp_2,array_0_io_resp_2}; // @[Cat.scala 31:58]
  assign io_resp_0_3 = {array_0_io_ecc_resp_3,array_0_io_resp_3}; // @[Cat.scala 31:58]
  assign io_resp_0_4 = {array_0_io_ecc_resp_4,array_0_io_resp_4}; // @[Cat.scala 31:58]
  assign io_resp_0_5 = {array_0_io_ecc_resp_5,array_0_io_resp_5}; // @[Cat.scala 31:58]
  assign io_resp_0_6 = {array_0_io_ecc_resp_6,array_0_io_resp_6}; // @[Cat.scala 31:58]
  assign io_resp_0_7 = {array_0_io_ecc_resp_7,array_0_io_resp_7}; // @[Cat.scala 31:58]
  assign io_resp_1_0 = {array_1_io_ecc_resp_0,array_1_io_resp_0}; // @[Cat.scala 31:58]
  assign io_resp_1_1 = {array_1_io_ecc_resp_1,array_1_io_resp_1}; // @[Cat.scala 31:58]
  assign io_resp_1_2 = {array_1_io_ecc_resp_2,array_1_io_resp_2}; // @[Cat.scala 31:58]
  assign io_resp_1_3 = {array_1_io_ecc_resp_3,array_1_io_resp_3}; // @[Cat.scala 31:58]
  assign io_resp_1_4 = {array_1_io_ecc_resp_4,array_1_io_resp_4}; // @[Cat.scala 31:58]
  assign io_resp_1_5 = {array_1_io_ecc_resp_5,array_1_io_resp_5}; // @[Cat.scala 31:58]
  assign io_resp_1_6 = {array_1_io_ecc_resp_6,array_1_io_resp_6}; // @[Cat.scala 31:58]
  assign io_resp_1_7 = {array_1_io_ecc_resp_7,array_1_io_resp_7}; // @[Cat.scala 31:58]
  assign io_resp_2_0 = {array_2_io_ecc_resp_0,array_2_io_resp_0}; // @[Cat.scala 31:58]
  assign io_resp_2_1 = {array_2_io_ecc_resp_1,array_2_io_resp_1}; // @[Cat.scala 31:58]
  assign io_resp_2_2 = {array_2_io_ecc_resp_2,array_2_io_resp_2}; // @[Cat.scala 31:58]
  assign io_resp_2_3 = {array_2_io_ecc_resp_3,array_2_io_resp_3}; // @[Cat.scala 31:58]
  assign io_resp_2_4 = {array_2_io_ecc_resp_4,array_2_io_resp_4}; // @[Cat.scala 31:58]
  assign io_resp_2_5 = {array_2_io_ecc_resp_5,array_2_io_resp_5}; // @[Cat.scala 31:58]
  assign io_resp_2_6 = {array_2_io_ecc_resp_6,array_2_io_resp_6}; // @[Cat.scala 31:58]
  assign io_resp_2_7 = {array_2_io_ecc_resp_7,array_2_io_resp_7}; // @[Cat.scala 31:58]
  assign io_cacheOp_resp_valid = io_cacheOp_resp_valid_REG; // @[TagArray.scala 253:25]
  assign io_cacheOp_resp_bits_read_tag_low = {{40'd0}, _io_cacheOp_resp_bits_read_tag_low_T_2}; // @[TagArray.scala 254:37]
  assign io_cacheOp_resp_bits_read_tag_ecc = {{58'd0}, _io_cacheOp_resp_bits_read_tag_ecc_T_2}; // @[TagArray.scala 255:37]
  assign array_0_clock = clock;
  assign array_0_reset = reset;
  assign array_0_io_read_valid = io_cacheOp_req_valid & _T_24 | io_read_0_valid; // @[TagArray.scala 131:22 147:71 149:30]
  assign array_0_io_read_bits_idx = _GEN_1[5:0];
  assign array_0_io_write_valid = io_cacheOp_req_dup_1_valid & _T_28 | io_write_valid; // @[TagArray.scala 123:29 163:86 165:31]
  assign array_0_io_write_bits_idx = _GEN_9[5:0];
  assign array_0_io_write_bits_way_en = _GEN_10[7:0];
  assign array_0_io_write_bits_tag = _GEN_11[23:0];
  assign array_0_io_ecc_read_valid = io_cacheOp_req_dup_0_valid & _T_26 | io_read_0_valid; // @[TagArray.scala 132:32 155:89 157:34]
  assign array_0_io_ecc_read_bits_idx = _GEN_5[5:0];
  assign array_0_io_ecc_write_valid = io_cacheOp_req_dup_2_valid & _T_30 | io_write_valid; // @[TagArray.scala 125:33 172:88 174:35]
  assign array_0_io_ecc_write_bits_idx = _GEN_14[5:0];
  assign array_0_io_ecc_write_bits_way_en = _GEN_15[7:0];
  assign array_0_io_ecc_write_bits_ecc = _GEN_16[5:0];
  assign array_1_clock = clock;
  assign array_1_reset = reset;
  assign array_1_io_read_valid = io_cacheOp_req_dup_3_valid & _T_32 | io_read_1_valid; // @[TagArray.scala 131:22 183:85 185:30]
  assign array_1_io_read_bits_idx = _GEN_19[5:0];
  assign array_1_io_write_valid = io_cacheOp_req_dup_5_valid & _T_36 | io_write_valid; // @[TagArray.scala 123:29 199:86 201:31]
  assign array_1_io_write_bits_idx = _GEN_27[5:0];
  assign array_1_io_write_bits_way_en = _GEN_28[7:0];
  assign array_1_io_write_bits_tag = _GEN_29[23:0];
  assign array_1_io_ecc_read_valid = io_cacheOp_req_dup_4_valid & _T_34 | io_read_1_valid; // @[TagArray.scala 132:32 191:89 193:34]
  assign array_1_io_ecc_read_bits_idx = _GEN_23[5:0];
  assign array_1_io_ecc_write_valid = io_cacheOp_req_dup_6_valid & _T_38 | io_write_valid; // @[TagArray.scala 125:33 208:88 210:35]
  assign array_1_io_ecc_write_bits_idx = _GEN_32[5:0];
  assign array_1_io_ecc_write_bits_way_en = _GEN_33[7:0];
  assign array_1_io_ecc_write_bits_ecc = _GEN_34[5:0];
  assign array_2_clock = clock;
  assign array_2_reset = reset;
  assign array_2_io_read_valid = io_cacheOp_req_dup_7_valid & _T_40 | io_read_2_valid; // @[TagArray.scala 131:22 218:85 220:30]
  assign array_2_io_read_bits_idx = _GEN_37[5:0];
  assign array_2_io_write_valid = io_cacheOp_req_dup_9_valid & _T_44 | io_write_valid; // @[TagArray.scala 123:29 234:86 236:31]
  assign array_2_io_write_bits_idx = _GEN_45[5:0];
  assign array_2_io_write_bits_way_en = _GEN_46[7:0];
  assign array_2_io_write_bits_tag = _GEN_47[23:0];
  assign array_2_io_ecc_read_valid = io_cacheOp_req_dup_8_valid & _T_42 | io_read_2_valid; // @[TagArray.scala 132:32 226:89 228:34]
  assign array_2_io_ecc_read_bits_idx = _GEN_41[5:0];
  assign array_2_io_ecc_write_valid = io_cacheOp_req_dup_10_valid & _T_46 | io_write_valid; // @[TagArray.scala 125:33 243:90 245:35]
  assign array_2_io_ecc_write_bits_idx = _GEN_50[5:0];
  assign array_2_io_ecc_write_bits_way_en = _GEN_51[7:0];
  assign array_2_io_ecc_write_bits_ecc = _GEN_52[5:0];
  always @(posedge clock) begin
    io_cacheOp_resp_valid_REG <= io_cacheOp_req_valid & cacheOpShouldResp; // @[TagArray.scala 253:57]
    io_cacheOp_resp_bits_read_tag_low_REG <= io_cacheOp_req_bits_wayNum; // @[TagArray.scala 254:91]
    io_cacheOp_resp_bits_read_tag_ecc_REG <= io_cacheOp_req_bits_wayNum; // @[TagArray.scala 255:95]
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
  io_cacheOp_resp_valid_REG = _RAND_0[0:0];
  _RAND_1 = {2{`RANDOM}};
  io_cacheOp_resp_bits_read_tag_low_REG = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  io_cacheOp_resp_bits_read_tag_ecc_REG = _RAND_2[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

