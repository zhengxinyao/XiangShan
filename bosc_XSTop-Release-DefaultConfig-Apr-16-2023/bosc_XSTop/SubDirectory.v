module SubDirectory(
  input         clock,
  input         reset,
  output        io_read_ready,
  input         io_read_valid,
  input  [22:0] io_read_bits_tag,
  input  [6:0]  io_read_bits_set,
  output        io_resp_bits_hit,
  output [3:0]  io_resp_bits_way,
  output [22:0] io_resp_bits_tag,
  output [1:0]  io_resp_bits_dir_0_state,
  output [1:0]  io_resp_bits_dir_1_state,
  output        io_tag_wready,
  input         io_tag_wvalid,
  input  [22:0] io_tag_wtag,
  input  [6:0]  io_tag_wset,
  input  [3:0]  io_tag_wway,
  input         io_dir_wvalid,
  input  [6:0]  io_dir_wset,
  input  [3:0]  io_dir_wway,
  input  [1:0]  io_dir_wdir_0_state,
  input  [1:0]  io_dir_wdir_1_state
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
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
`endif // RANDOMIZE_REG_INIT
  wire  metaArray_clock; // @[BaseDirectory.scala 107:25]
  wire  metaArray_io_rreq_valid; // @[BaseDirectory.scala 107:25]
  wire [6:0] metaArray_io_rreq_bits_setIdx; // @[BaseDirectory.scala 107:25]
  wire [1:0] metaArray_io_rresp_data_0_0_state; // @[BaseDirectory.scala 107:25]
  wire [1:0] metaArray_io_rresp_data_0_1_state; // @[BaseDirectory.scala 107:25]
  wire [1:0] metaArray_io_rresp_data_1_0_state; // @[BaseDirectory.scala 107:25]
  wire [1:0] metaArray_io_rresp_data_1_1_state; // @[BaseDirectory.scala 107:25]
  wire [1:0] metaArray_io_rresp_data_2_0_state; // @[BaseDirectory.scala 107:25]
  wire [1:0] metaArray_io_rresp_data_2_1_state; // @[BaseDirectory.scala 107:25]
  wire [1:0] metaArray_io_rresp_data_3_0_state; // @[BaseDirectory.scala 107:25]
  wire [1:0] metaArray_io_rresp_data_3_1_state; // @[BaseDirectory.scala 107:25]
  wire [1:0] metaArray_io_rresp_data_4_0_state; // @[BaseDirectory.scala 107:25]
  wire [1:0] metaArray_io_rresp_data_4_1_state; // @[BaseDirectory.scala 107:25]
  wire [1:0] metaArray_io_rresp_data_5_0_state; // @[BaseDirectory.scala 107:25]
  wire [1:0] metaArray_io_rresp_data_5_1_state; // @[BaseDirectory.scala 107:25]
  wire [1:0] metaArray_io_rresp_data_6_0_state; // @[BaseDirectory.scala 107:25]
  wire [1:0] metaArray_io_rresp_data_6_1_state; // @[BaseDirectory.scala 107:25]
  wire [1:0] metaArray_io_rresp_data_7_0_state; // @[BaseDirectory.scala 107:25]
  wire [1:0] metaArray_io_rresp_data_7_1_state; // @[BaseDirectory.scala 107:25]
  wire [1:0] metaArray_io_rresp_data_8_0_state; // @[BaseDirectory.scala 107:25]
  wire [1:0] metaArray_io_rresp_data_8_1_state; // @[BaseDirectory.scala 107:25]
  wire [1:0] metaArray_io_rresp_data_9_0_state; // @[BaseDirectory.scala 107:25]
  wire [1:0] metaArray_io_rresp_data_9_1_state; // @[BaseDirectory.scala 107:25]
  wire  metaArray_io_wreq_valid; // @[BaseDirectory.scala 107:25]
  wire [6:0] metaArray_io_wreq_bits_setIdx; // @[BaseDirectory.scala 107:25]
  wire [1:0] metaArray_io_wreq_bits_data_0_0_state; // @[BaseDirectory.scala 107:25]
  wire [1:0] metaArray_io_wreq_bits_data_0_1_state; // @[BaseDirectory.scala 107:25]
  wire [1:0] metaArray_io_wreq_bits_data_1_0_state; // @[BaseDirectory.scala 107:25]
  wire [1:0] metaArray_io_wreq_bits_data_1_1_state; // @[BaseDirectory.scala 107:25]
  wire [1:0] metaArray_io_wreq_bits_data_2_0_state; // @[BaseDirectory.scala 107:25]
  wire [1:0] metaArray_io_wreq_bits_data_2_1_state; // @[BaseDirectory.scala 107:25]
  wire [1:0] metaArray_io_wreq_bits_data_3_0_state; // @[BaseDirectory.scala 107:25]
  wire [1:0] metaArray_io_wreq_bits_data_3_1_state; // @[BaseDirectory.scala 107:25]
  wire [1:0] metaArray_io_wreq_bits_data_4_0_state; // @[BaseDirectory.scala 107:25]
  wire [1:0] metaArray_io_wreq_bits_data_4_1_state; // @[BaseDirectory.scala 107:25]
  wire [1:0] metaArray_io_wreq_bits_data_5_0_state; // @[BaseDirectory.scala 107:25]
  wire [1:0] metaArray_io_wreq_bits_data_5_1_state; // @[BaseDirectory.scala 107:25]
  wire [1:0] metaArray_io_wreq_bits_data_6_0_state; // @[BaseDirectory.scala 107:25]
  wire [1:0] metaArray_io_wreq_bits_data_6_1_state; // @[BaseDirectory.scala 107:25]
  wire [1:0] metaArray_io_wreq_bits_data_7_0_state; // @[BaseDirectory.scala 107:25]
  wire [1:0] metaArray_io_wreq_bits_data_7_1_state; // @[BaseDirectory.scala 107:25]
  wire [1:0] metaArray_io_wreq_bits_data_8_0_state; // @[BaseDirectory.scala 107:25]
  wire [1:0] metaArray_io_wreq_bits_data_8_1_state; // @[BaseDirectory.scala 107:25]
  wire [1:0] metaArray_io_wreq_bits_data_9_0_state; // @[BaseDirectory.scala 107:25]
  wire [1:0] metaArray_io_wreq_bits_data_9_1_state; // @[BaseDirectory.scala 107:25]
  wire [9:0] metaArray_io_wreq_bits_waymask; // @[BaseDirectory.scala 107:25]
  wire  clkGate_TE; // @[BaseDirectory.scala 109:23]
  wire  clkGate_E; // @[BaseDirectory.scala 109:23]
  wire  clkGate_CK; // @[BaseDirectory.scala 109:23]
  wire  clkGate_Q; // @[BaseDirectory.scala 109:23]
  wire  tagArray_clock; // @[BaseDirectory.scala 131:24]
  wire  tagArray_io_rreq_valid; // @[BaseDirectory.scala 131:24]
  wire [6:0] tagArray_io_rreq_bits_setIdx; // @[BaseDirectory.scala 131:24]
  wire [22:0] tagArray_io_rresp_data_0; // @[BaseDirectory.scala 131:24]
  wire [22:0] tagArray_io_rresp_data_1; // @[BaseDirectory.scala 131:24]
  wire [22:0] tagArray_io_rresp_data_2; // @[BaseDirectory.scala 131:24]
  wire [22:0] tagArray_io_rresp_data_3; // @[BaseDirectory.scala 131:24]
  wire [22:0] tagArray_io_rresp_data_4; // @[BaseDirectory.scala 131:24]
  wire [22:0] tagArray_io_rresp_data_5; // @[BaseDirectory.scala 131:24]
  wire [22:0] tagArray_io_rresp_data_6; // @[BaseDirectory.scala 131:24]
  wire [22:0] tagArray_io_rresp_data_7; // @[BaseDirectory.scala 131:24]
  wire [22:0] tagArray_io_rresp_data_8; // @[BaseDirectory.scala 131:24]
  wire [22:0] tagArray_io_rresp_data_9; // @[BaseDirectory.scala 131:24]
  wire  tagArray_io_wreq_valid; // @[BaseDirectory.scala 131:24]
  wire [6:0] tagArray_io_wreq_bits_setIdx; // @[BaseDirectory.scala 131:24]
  wire [22:0] tagArray_io_wreq_bits_data_0; // @[BaseDirectory.scala 131:24]
  wire [22:0] tagArray_io_wreq_bits_data_1; // @[BaseDirectory.scala 131:24]
  wire [22:0] tagArray_io_wreq_bits_data_2; // @[BaseDirectory.scala 131:24]
  wire [22:0] tagArray_io_wreq_bits_data_3; // @[BaseDirectory.scala 131:24]
  wire [22:0] tagArray_io_wreq_bits_data_4; // @[BaseDirectory.scala 131:24]
  wire [22:0] tagArray_io_wreq_bits_data_5; // @[BaseDirectory.scala 131:24]
  wire [22:0] tagArray_io_wreq_bits_data_6; // @[BaseDirectory.scala 131:24]
  wire [22:0] tagArray_io_wreq_bits_data_7; // @[BaseDirectory.scala 131:24]
  wire [22:0] tagArray_io_wreq_bits_data_8; // @[BaseDirectory.scala 131:24]
  wire [22:0] tagArray_io_wreq_bits_data_9; // @[BaseDirectory.scala 131:24]
  wire [9:0] tagArray_io_wreq_bits_waymask; // @[BaseDirectory.scala 131:24]
  wire  lfsr_prng_clock; // @[PRNG.scala 91:22]
  wire  lfsr_prng_reset; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_increment; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_0; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_1; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_2; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_3; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_4; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_5; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_6; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_7; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_8; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_9; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_10; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_11; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_12; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_13; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_14; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_15; // @[PRNG.scala 91:22]
  reg  resetFinish; // @[BaseDirectory.scala 105:28]
  reg [6:0] resetIdx; // @[BaseDirectory.scala 106:25]
  reg  clk_en; // @[BaseDirectory.scala 110:23]
  wire [15:0] _T_1 = 16'h1 << io_tag_wway; // @[OneHot.scala 57:35]
  wire  _T_2 = io_read_ready & io_read_valid; // @[Decoupled.scala 50:35]
  reg [22:0] reqReg_tag; // @[Reg.scala 16:16]
  reg  reqValidReg; // @[BaseDirectory.scala 162:28]
  wire [7:0] lfsr_lo = {lfsr_prng_io_out_7,lfsr_prng_io_out_6,lfsr_prng_io_out_5,lfsr_prng_io_out_4,lfsr_prng_io_out_3,
    lfsr_prng_io_out_2,lfsr_prng_io_out_1,lfsr_prng_io_out_0}; // @[PRNG.scala 95:17]
  wire [15:0] lfsr = {lfsr_prng_io_out_15,lfsr_prng_io_out_14,lfsr_prng_io_out_13,lfsr_prng_io_out_12,
    lfsr_prng_io_out_11,lfsr_prng_io_out_10,lfsr_prng_io_out_9,lfsr_prng_io_out_8,lfsr_lo}; // @[PRNG.scala 95:17]
  wire [22:0] tagRead_0 = tagArray_io_rresp_data_0; // @[BaseDirectory.scala 129:21 154:11]
  wire  tagMatchVec_0 = tagRead_0 == reqReg_tag; // @[BaseDirectory.scala 190:51]
  wire [22:0] tagRead_1 = tagArray_io_rresp_data_1; // @[BaseDirectory.scala 129:21 154:11]
  wire  tagMatchVec_1 = tagRead_1 == reqReg_tag; // @[BaseDirectory.scala 190:51]
  wire [22:0] tagRead_2 = tagArray_io_rresp_data_2; // @[BaseDirectory.scala 129:21 154:11]
  wire  tagMatchVec_2 = tagRead_2 == reqReg_tag; // @[BaseDirectory.scala 190:51]
  wire [22:0] tagRead_3 = tagArray_io_rresp_data_3; // @[BaseDirectory.scala 129:21 154:11]
  wire  tagMatchVec_3 = tagRead_3 == reqReg_tag; // @[BaseDirectory.scala 190:51]
  wire [22:0] tagRead_4 = tagArray_io_rresp_data_4; // @[BaseDirectory.scala 129:21 154:11]
  wire  tagMatchVec_4 = tagRead_4 == reqReg_tag; // @[BaseDirectory.scala 190:51]
  wire [22:0] tagRead_5 = tagArray_io_rresp_data_5; // @[BaseDirectory.scala 129:21 154:11]
  wire  tagMatchVec_5 = tagRead_5 == reqReg_tag; // @[BaseDirectory.scala 190:51]
  wire [22:0] tagRead_6 = tagArray_io_rresp_data_6; // @[BaseDirectory.scala 129:21 154:11]
  wire  tagMatchVec_6 = tagRead_6 == reqReg_tag; // @[BaseDirectory.scala 190:51]
  wire [22:0] tagRead_7 = tagArray_io_rresp_data_7; // @[BaseDirectory.scala 129:21 154:11]
  wire  tagMatchVec_7 = tagRead_7 == reqReg_tag; // @[BaseDirectory.scala 190:51]
  wire [22:0] tagRead_8 = tagArray_io_rresp_data_8; // @[BaseDirectory.scala 129:21 154:11]
  wire  tagMatchVec_8 = tagRead_8 == reqReg_tag; // @[BaseDirectory.scala 190:51]
  wire [22:0] tagRead_9 = tagArray_io_rresp_data_9; // @[BaseDirectory.scala 129:21 154:11]
  wire  tagMatchVec_9 = tagRead_9 == reqReg_tag; // @[BaseDirectory.scala 190:51]
  wire  _metaValidVec_T = metaArray_io_rresp_data_0_0_state != 2'h0; // @[Directory.scala 192:49]
  wire  _metaValidVec_T_1 = metaArray_io_rresp_data_0_1_state != 2'h0; // @[Directory.scala 192:49]
  wire [1:0] _metaValidVec_T_2 = {_metaValidVec_T,_metaValidVec_T_1}; // @[Cat.scala 31:58]
  wire  metaValidVec_0 = |_metaValidVec_T_2; // @[Directory.scala 192:72]
  wire  _metaValidVec_T_3 = metaArray_io_rresp_data_1_0_state != 2'h0; // @[Directory.scala 192:49]
  wire  _metaValidVec_T_4 = metaArray_io_rresp_data_1_1_state != 2'h0; // @[Directory.scala 192:49]
  wire [1:0] _metaValidVec_T_5 = {_metaValidVec_T_3,_metaValidVec_T_4}; // @[Cat.scala 31:58]
  wire  metaValidVec_1 = |_metaValidVec_T_5; // @[Directory.scala 192:72]
  wire  _metaValidVec_T_6 = metaArray_io_rresp_data_2_0_state != 2'h0; // @[Directory.scala 192:49]
  wire  _metaValidVec_T_7 = metaArray_io_rresp_data_2_1_state != 2'h0; // @[Directory.scala 192:49]
  wire [1:0] _metaValidVec_T_8 = {_metaValidVec_T_6,_metaValidVec_T_7}; // @[Cat.scala 31:58]
  wire  metaValidVec_2 = |_metaValidVec_T_8; // @[Directory.scala 192:72]
  wire  _metaValidVec_T_9 = metaArray_io_rresp_data_3_0_state != 2'h0; // @[Directory.scala 192:49]
  wire  _metaValidVec_T_10 = metaArray_io_rresp_data_3_1_state != 2'h0; // @[Directory.scala 192:49]
  wire [1:0] _metaValidVec_T_11 = {_metaValidVec_T_9,_metaValidVec_T_10}; // @[Cat.scala 31:58]
  wire  metaValidVec_3 = |_metaValidVec_T_11; // @[Directory.scala 192:72]
  wire  _metaValidVec_T_12 = metaArray_io_rresp_data_4_0_state != 2'h0; // @[Directory.scala 192:49]
  wire  _metaValidVec_T_13 = metaArray_io_rresp_data_4_1_state != 2'h0; // @[Directory.scala 192:49]
  wire [1:0] _metaValidVec_T_14 = {_metaValidVec_T_12,_metaValidVec_T_13}; // @[Cat.scala 31:58]
  wire  metaValidVec_4 = |_metaValidVec_T_14; // @[Directory.scala 192:72]
  wire  _metaValidVec_T_15 = metaArray_io_rresp_data_5_0_state != 2'h0; // @[Directory.scala 192:49]
  wire  _metaValidVec_T_16 = metaArray_io_rresp_data_5_1_state != 2'h0; // @[Directory.scala 192:49]
  wire [1:0] _metaValidVec_T_17 = {_metaValidVec_T_15,_metaValidVec_T_16}; // @[Cat.scala 31:58]
  wire  metaValidVec_5 = |_metaValidVec_T_17; // @[Directory.scala 192:72]
  wire  _metaValidVec_T_18 = metaArray_io_rresp_data_6_0_state != 2'h0; // @[Directory.scala 192:49]
  wire  _metaValidVec_T_19 = metaArray_io_rresp_data_6_1_state != 2'h0; // @[Directory.scala 192:49]
  wire [1:0] _metaValidVec_T_20 = {_metaValidVec_T_18,_metaValidVec_T_19}; // @[Cat.scala 31:58]
  wire  metaValidVec_6 = |_metaValidVec_T_20; // @[Directory.scala 192:72]
  wire  _metaValidVec_T_21 = metaArray_io_rresp_data_7_0_state != 2'h0; // @[Directory.scala 192:49]
  wire  _metaValidVec_T_22 = metaArray_io_rresp_data_7_1_state != 2'h0; // @[Directory.scala 192:49]
  wire [1:0] _metaValidVec_T_23 = {_metaValidVec_T_21,_metaValidVec_T_22}; // @[Cat.scala 31:58]
  wire  metaValidVec_7 = |_metaValidVec_T_23; // @[Directory.scala 192:72]
  wire  _metaValidVec_T_24 = metaArray_io_rresp_data_8_0_state != 2'h0; // @[Directory.scala 192:49]
  wire  _metaValidVec_T_25 = metaArray_io_rresp_data_8_1_state != 2'h0; // @[Directory.scala 192:49]
  wire [1:0] _metaValidVec_T_26 = {_metaValidVec_T_24,_metaValidVec_T_25}; // @[Cat.scala 31:58]
  wire  metaValidVec_8 = |_metaValidVec_T_26; // @[Directory.scala 192:72]
  wire  _metaValidVec_T_27 = metaArray_io_rresp_data_9_0_state != 2'h0; // @[Directory.scala 192:49]
  wire  _metaValidVec_T_28 = metaArray_io_rresp_data_9_1_state != 2'h0; // @[Directory.scala 192:49]
  wire [1:0] _metaValidVec_T_29 = {_metaValidVec_T_27,_metaValidVec_T_28}; // @[Cat.scala 31:58]
  wire  metaValidVec_9 = |_metaValidVec_T_29; // @[Directory.scala 192:72]
  wire  hitVec_0 = tagMatchVec_0 & metaValidVec_0; // @[BaseDirectory.scala 192:60]
  wire  hitVec_1 = tagMatchVec_1 & metaValidVec_1; // @[BaseDirectory.scala 192:60]
  wire  hitVec_2 = tagMatchVec_2 & metaValidVec_2; // @[BaseDirectory.scala 192:60]
  wire  hitVec_3 = tagMatchVec_3 & metaValidVec_3; // @[BaseDirectory.scala 192:60]
  wire  hitVec_4 = tagMatchVec_4 & metaValidVec_4; // @[BaseDirectory.scala 192:60]
  wire  hitVec_5 = tagMatchVec_5 & metaValidVec_5; // @[BaseDirectory.scala 192:60]
  wire  hitVec_6 = tagMatchVec_6 & metaValidVec_6; // @[BaseDirectory.scala 192:60]
  wire  hitVec_7 = tagMatchVec_7 & metaValidVec_7; // @[BaseDirectory.scala 192:60]
  wire  hitVec_8 = tagMatchVec_8 & metaValidVec_8; // @[BaseDirectory.scala 192:60]
  wire  hitVec_9 = tagMatchVec_9 & metaValidVec_9; // @[BaseDirectory.scala 192:60]
  wire [9:0] _hitWay_T = {hitVec_9,hitVec_8,hitVec_7,hitVec_6,hitVec_5,hitVec_4,hitVec_3,hitVec_2,hitVec_1,hitVec_0}; // @[Cat.scala 31:58]
  wire [1:0] hitWay_hi_1 = _hitWay_T[9:8]; // @[OneHot.scala 30:18]
  wire [7:0] hitWay_lo_1 = _hitWay_T[7:0]; // @[OneHot.scala 31:18]
  wire  _hitWay_T_1 = |hitWay_hi_1; // @[OneHot.scala 32:14]
  wire [7:0] _GEN_93 = {{6'd0}, hitWay_hi_1}; // @[OneHot.scala 32:28]
  wire [7:0] _hitWay_T_2 = _GEN_93 | hitWay_lo_1; // @[OneHot.scala 32:28]
  wire [3:0] hitWay_hi_2 = _hitWay_T_2[7:4]; // @[OneHot.scala 30:18]
  wire [3:0] hitWay_lo_2 = _hitWay_T_2[3:0]; // @[OneHot.scala 31:18]
  wire  _hitWay_T_3 = |hitWay_hi_2; // @[OneHot.scala 32:14]
  wire [3:0] _hitWay_T_4 = hitWay_hi_2 | hitWay_lo_2; // @[OneHot.scala 32:28]
  wire [1:0] hitWay_hi_3 = _hitWay_T_4[3:2]; // @[OneHot.scala 30:18]
  wire [1:0] hitWay_lo_3 = _hitWay_T_4[1:0]; // @[OneHot.scala 31:18]
  wire  _hitWay_T_5 = |hitWay_hi_3; // @[OneHot.scala 32:14]
  wire [1:0] _hitWay_T_6 = hitWay_hi_3 | hitWay_lo_3; // @[OneHot.scala 32:28]
  wire [3:0] hitWay = {_hitWay_T_1,_hitWay_T_3,_hitWay_T_5,_hitWay_T_6[1]}; // @[Cat.scala 31:58]
  wire  _replaceWay_T_1 = lfsr[6:0] < 7'hc; // @[Misc.scala 160:37]
  wire  _replaceWay_T_2 = lfsr[6:0] < 7'h19; // @[Misc.scala 160:37]
  wire  _replaceWay_T_3 = lfsr[6:0] < 7'h26; // @[Misc.scala 160:37]
  wire  _replaceWay_T_4 = lfsr[6:0] < 7'h33; // @[Misc.scala 160:37]
  wire  _replaceWay_T_5 = lfsr[6:0] < 7'h40; // @[Misc.scala 160:37]
  wire  _replaceWay_T_6 = lfsr[6:0] < 7'h4c; // @[Misc.scala 160:37]
  wire  _replaceWay_T_7 = lfsr[6:0] < 7'h59; // @[Misc.scala 160:37]
  wire  _replaceWay_T_8 = lfsr[6:0] < 7'h66; // @[Misc.scala 160:37]
  wire  _replaceWay_T_9 = lfsr[6:0] < 7'h73; // @[Misc.scala 160:37]
  wire [3:0] _replaceWay_T_11 = _replaceWay_T_9 ? 4'h8 : 4'h9; // @[Mux.scala 47:70]
  wire [3:0] _replaceWay_T_12 = _replaceWay_T_8 ? 4'h7 : _replaceWay_T_11; // @[Mux.scala 47:70]
  wire [3:0] _replaceWay_T_13 = _replaceWay_T_7 ? 4'h6 : _replaceWay_T_12; // @[Mux.scala 47:70]
  wire [3:0] _replaceWay_T_14 = _replaceWay_T_6 ? 4'h5 : _replaceWay_T_13; // @[Mux.scala 47:70]
  wire [3:0] _replaceWay_T_15 = _replaceWay_T_5 ? 4'h4 : _replaceWay_T_14; // @[Mux.scala 47:70]
  wire [3:0] _replaceWay_T_16 = _replaceWay_T_4 ? 4'h3 : _replaceWay_T_15; // @[Mux.scala 47:70]
  wire [3:0] _replaceWay_T_17 = _replaceWay_T_3 ? 4'h2 : _replaceWay_T_16; // @[Mux.scala 47:70]
  wire [3:0] _replaceWay_T_18 = _replaceWay_T_2 ? 4'h1 : _replaceWay_T_17; // @[Mux.scala 47:70]
  wire  _invalid_vec_T = metaArray_io_rresp_data_0_0_state == 2'h0; // @[Directory.scala 174:68]
  wire  _invalid_vec_T_1 = metaArray_io_rresp_data_0_1_state == 2'h0; // @[Directory.scala 174:68]
  wire [1:0] _invalid_vec_T_2 = {_invalid_vec_T,_invalid_vec_T_1}; // @[Cat.scala 31:58]
  wire  invalid_vec_0 = &_invalid_vec_T_2; // @[Directory.scala 174:86]
  wire  _invalid_vec_T_3 = metaArray_io_rresp_data_1_0_state == 2'h0; // @[Directory.scala 174:68]
  wire  _invalid_vec_T_4 = metaArray_io_rresp_data_1_1_state == 2'h0; // @[Directory.scala 174:68]
  wire [1:0] _invalid_vec_T_5 = {_invalid_vec_T_3,_invalid_vec_T_4}; // @[Cat.scala 31:58]
  wire  invalid_vec_1 = &_invalid_vec_T_5; // @[Directory.scala 174:86]
  wire  _invalid_vec_T_6 = metaArray_io_rresp_data_2_0_state == 2'h0; // @[Directory.scala 174:68]
  wire  _invalid_vec_T_7 = metaArray_io_rresp_data_2_1_state == 2'h0; // @[Directory.scala 174:68]
  wire [1:0] _invalid_vec_T_8 = {_invalid_vec_T_6,_invalid_vec_T_7}; // @[Cat.scala 31:58]
  wire  invalid_vec_2 = &_invalid_vec_T_8; // @[Directory.scala 174:86]
  wire  _invalid_vec_T_9 = metaArray_io_rresp_data_3_0_state == 2'h0; // @[Directory.scala 174:68]
  wire  _invalid_vec_T_10 = metaArray_io_rresp_data_3_1_state == 2'h0; // @[Directory.scala 174:68]
  wire [1:0] _invalid_vec_T_11 = {_invalid_vec_T_9,_invalid_vec_T_10}; // @[Cat.scala 31:58]
  wire  invalid_vec_3 = &_invalid_vec_T_11; // @[Directory.scala 174:86]
  wire  _invalid_vec_T_12 = metaArray_io_rresp_data_4_0_state == 2'h0; // @[Directory.scala 174:68]
  wire  _invalid_vec_T_13 = metaArray_io_rresp_data_4_1_state == 2'h0; // @[Directory.scala 174:68]
  wire [1:0] _invalid_vec_T_14 = {_invalid_vec_T_12,_invalid_vec_T_13}; // @[Cat.scala 31:58]
  wire  invalid_vec_4 = &_invalid_vec_T_14; // @[Directory.scala 174:86]
  wire  _invalid_vec_T_15 = metaArray_io_rresp_data_5_0_state == 2'h0; // @[Directory.scala 174:68]
  wire  _invalid_vec_T_16 = metaArray_io_rresp_data_5_1_state == 2'h0; // @[Directory.scala 174:68]
  wire [1:0] _invalid_vec_T_17 = {_invalid_vec_T_15,_invalid_vec_T_16}; // @[Cat.scala 31:58]
  wire  invalid_vec_5 = &_invalid_vec_T_17; // @[Directory.scala 174:86]
  wire  _invalid_vec_T_18 = metaArray_io_rresp_data_6_0_state == 2'h0; // @[Directory.scala 174:68]
  wire  _invalid_vec_T_19 = metaArray_io_rresp_data_6_1_state == 2'h0; // @[Directory.scala 174:68]
  wire [1:0] _invalid_vec_T_20 = {_invalid_vec_T_18,_invalid_vec_T_19}; // @[Cat.scala 31:58]
  wire  invalid_vec_6 = &_invalid_vec_T_20; // @[Directory.scala 174:86]
  wire  _invalid_vec_T_21 = metaArray_io_rresp_data_7_0_state == 2'h0; // @[Directory.scala 174:68]
  wire  _invalid_vec_T_22 = metaArray_io_rresp_data_7_1_state == 2'h0; // @[Directory.scala 174:68]
  wire [1:0] _invalid_vec_T_23 = {_invalid_vec_T_21,_invalid_vec_T_22}; // @[Cat.scala 31:58]
  wire  invalid_vec_7 = &_invalid_vec_T_23; // @[Directory.scala 174:86]
  wire  _invalid_vec_T_24 = metaArray_io_rresp_data_8_0_state == 2'h0; // @[Directory.scala 174:68]
  wire  _invalid_vec_T_25 = metaArray_io_rresp_data_8_1_state == 2'h0; // @[Directory.scala 174:68]
  wire [1:0] _invalid_vec_T_26 = {_invalid_vec_T_24,_invalid_vec_T_25}; // @[Cat.scala 31:58]
  wire  invalid_vec_8 = &_invalid_vec_T_26; // @[Directory.scala 174:86]
  wire  _invalid_vec_T_27 = metaArray_io_rresp_data_9_0_state == 2'h0; // @[Directory.scala 174:68]
  wire  _invalid_vec_T_28 = metaArray_io_rresp_data_9_1_state == 2'h0; // @[Directory.scala 174:68]
  wire [1:0] _invalid_vec_T_29 = {_invalid_vec_T_27,_invalid_vec_T_28}; // @[Cat.scala 31:58]
  wire  invalid_vec_9 = &_invalid_vec_T_29; // @[Directory.scala 174:86]
  wire [9:0] _has_invalid_way_T = {invalid_vec_0,invalid_vec_1,invalid_vec_2,invalid_vec_3,invalid_vec_4,invalid_vec_5,
    invalid_vec_6,invalid_vec_7,invalid_vec_8,invalid_vec_9}; // @[Cat.scala 31:58]
  wire  inv = |_has_invalid_way_T; // @[Directory.scala 175:47]
  wire [3:0] _way_T_1 = invalid_vec_0 ? 4'h0 : 4'h1; // @[ParallelMux.scala 90:77]
  wire [3:0] _way_T_3 = invalid_vec_3 ? 4'h3 : 4'h4; // @[ParallelMux.scala 90:77]
  wire [3:0] _way_T_5 = invalid_vec_2 ? 4'h2 : _way_T_3; // @[ParallelMux.scala 90:77]
  wire [3:0] _way_T_7 = invalid_vec_0 | invalid_vec_1 ? _way_T_1 : _way_T_5; // @[ParallelMux.scala 90:77]
  wire [3:0] _way_T_9 = invalid_vec_5 ? 4'h5 : 4'h6; // @[ParallelMux.scala 90:77]
  wire [3:0] _way_T_11 = invalid_vec_8 ? 4'h8 : 4'h9; // @[ParallelMux.scala 90:77]
  wire [3:0] _way_T_13 = invalid_vec_7 ? 4'h7 : _way_T_11; // @[ParallelMux.scala 90:77]
  wire [3:0] _way_T_15 = invalid_vec_5 | invalid_vec_6 ? _way_T_9 : _way_T_13; // @[ParallelMux.scala 90:77]
  wire [9:0] _hit_s1_T = {hitVec_0,hitVec_1,hitVec_2,hitVec_3,hitVec_4,hitVec_5,hitVec_6,hitVec_7,hitVec_8,hitVec_9}; // @[Cat.scala 31:58]
  wire  hit_s1 = |_hit_s1_T; // @[BaseDirectory.scala 203:28]
  reg  hit_s2; // @[Reg.scala 28:20]
  reg [3:0] way_s2; // @[Reg.scala 28:20]
  reg [1:0] metaAll_s2_0_0_state; // @[Reg.scala 16:16]
  reg [1:0] metaAll_s2_0_1_state; // @[Reg.scala 16:16]
  reg [1:0] metaAll_s2_1_0_state; // @[Reg.scala 16:16]
  reg [1:0] metaAll_s2_1_1_state; // @[Reg.scala 16:16]
  reg [1:0] metaAll_s2_2_0_state; // @[Reg.scala 16:16]
  reg [1:0] metaAll_s2_2_1_state; // @[Reg.scala 16:16]
  reg [1:0] metaAll_s2_3_0_state; // @[Reg.scala 16:16]
  reg [1:0] metaAll_s2_3_1_state; // @[Reg.scala 16:16]
  reg [1:0] metaAll_s2_4_0_state; // @[Reg.scala 16:16]
  reg [1:0] metaAll_s2_4_1_state; // @[Reg.scala 16:16]
  reg [1:0] metaAll_s2_5_0_state; // @[Reg.scala 16:16]
  reg [1:0] metaAll_s2_5_1_state; // @[Reg.scala 16:16]
  reg [1:0] metaAll_s2_6_0_state; // @[Reg.scala 16:16]
  reg [1:0] metaAll_s2_6_1_state; // @[Reg.scala 16:16]
  reg [1:0] metaAll_s2_7_0_state; // @[Reg.scala 16:16]
  reg [1:0] metaAll_s2_7_1_state; // @[Reg.scala 16:16]
  reg [1:0] metaAll_s2_8_0_state; // @[Reg.scala 16:16]
  reg [1:0] metaAll_s2_8_1_state; // @[Reg.scala 16:16]
  reg [1:0] metaAll_s2_9_0_state; // @[Reg.scala 16:16]
  reg [1:0] metaAll_s2_9_1_state; // @[Reg.scala 16:16]
  reg [22:0] tagAll_s2_0; // @[Reg.scala 16:16]
  reg [22:0] tagAll_s2_1; // @[Reg.scala 16:16]
  reg [22:0] tagAll_s2_2; // @[Reg.scala 16:16]
  reg [22:0] tagAll_s2_3; // @[Reg.scala 16:16]
  reg [22:0] tagAll_s2_4; // @[Reg.scala 16:16]
  reg [22:0] tagAll_s2_5; // @[Reg.scala 16:16]
  reg [22:0] tagAll_s2_6; // @[Reg.scala 16:16]
  reg [22:0] tagAll_s2_7; // @[Reg.scala 16:16]
  reg [22:0] tagAll_s2_8; // @[Reg.scala 16:16]
  reg [22:0] tagAll_s2_9; // @[Reg.scala 16:16]
  wire [1:0] _GEN_50 = 4'h1 == way_s2 ? metaAll_s2_1_0_state : metaAll_s2_0_0_state; // @[BaseDirectory.scala 219:{20,20}]
  wire [1:0] _GEN_51 = 4'h2 == way_s2 ? metaAll_s2_2_0_state : _GEN_50; // @[BaseDirectory.scala 219:{20,20}]
  wire [1:0] _GEN_52 = 4'h3 == way_s2 ? metaAll_s2_3_0_state : _GEN_51; // @[BaseDirectory.scala 219:{20,20}]
  wire [1:0] _GEN_53 = 4'h4 == way_s2 ? metaAll_s2_4_0_state : _GEN_52; // @[BaseDirectory.scala 219:{20,20}]
  wire [1:0] _GEN_54 = 4'h5 == way_s2 ? metaAll_s2_5_0_state : _GEN_53; // @[BaseDirectory.scala 219:{20,20}]
  wire [1:0] _GEN_55 = 4'h6 == way_s2 ? metaAll_s2_6_0_state : _GEN_54; // @[BaseDirectory.scala 219:{20,20}]
  wire [1:0] _GEN_56 = 4'h7 == way_s2 ? metaAll_s2_7_0_state : _GEN_55; // @[BaseDirectory.scala 219:{20,20}]
  wire [1:0] _GEN_57 = 4'h8 == way_s2 ? metaAll_s2_8_0_state : _GEN_56; // @[BaseDirectory.scala 219:{20,20}]
  wire [1:0] _GEN_60 = 4'h1 == way_s2 ? metaAll_s2_1_1_state : metaAll_s2_0_1_state; // @[BaseDirectory.scala 219:{20,20}]
  wire [1:0] _GEN_61 = 4'h2 == way_s2 ? metaAll_s2_2_1_state : _GEN_60; // @[BaseDirectory.scala 219:{20,20}]
  wire [1:0] _GEN_62 = 4'h3 == way_s2 ? metaAll_s2_3_1_state : _GEN_61; // @[BaseDirectory.scala 219:{20,20}]
  wire [1:0] _GEN_63 = 4'h4 == way_s2 ? metaAll_s2_4_1_state : _GEN_62; // @[BaseDirectory.scala 219:{20,20}]
  wire [1:0] _GEN_64 = 4'h5 == way_s2 ? metaAll_s2_5_1_state : _GEN_63; // @[BaseDirectory.scala 219:{20,20}]
  wire [1:0] _GEN_65 = 4'h6 == way_s2 ? metaAll_s2_6_1_state : _GEN_64; // @[BaseDirectory.scala 219:{20,20}]
  wire [1:0] _GEN_66 = 4'h7 == way_s2 ? metaAll_s2_7_1_state : _GEN_65; // @[BaseDirectory.scala 219:{20,20}]
  wire [1:0] _GEN_67 = 4'h8 == way_s2 ? metaAll_s2_8_1_state : _GEN_66; // @[BaseDirectory.scala 219:{20,20}]
  wire [22:0] _GEN_70 = 4'h1 == way_s2 ? tagAll_s2_1 : tagAll_s2_0; // @[BaseDirectory.scala 220:{20,20}]
  wire [22:0] _GEN_71 = 4'h2 == way_s2 ? tagAll_s2_2 : _GEN_70; // @[BaseDirectory.scala 220:{20,20}]
  wire [22:0] _GEN_72 = 4'h3 == way_s2 ? tagAll_s2_3 : _GEN_71; // @[BaseDirectory.scala 220:{20,20}]
  wire [22:0] _GEN_73 = 4'h4 == way_s2 ? tagAll_s2_4 : _GEN_72; // @[BaseDirectory.scala 220:{20,20}]
  wire [22:0] _GEN_74 = 4'h5 == way_s2 ? tagAll_s2_5 : _GEN_73; // @[BaseDirectory.scala 220:{20,20}]
  wire [22:0] _GEN_75 = 4'h6 == way_s2 ? tagAll_s2_6 : _GEN_74; // @[BaseDirectory.scala 220:{20,20}]
  wire [22:0] _GEN_76 = 4'h7 == way_s2 ? tagAll_s2_7 : _GEN_75; // @[BaseDirectory.scala 220:{20,20}]
  wire [22:0] _GEN_77 = 4'h8 == way_s2 ? tagAll_s2_8 : _GEN_76; // @[BaseDirectory.scala 220:{20,20}]
  wire  _T_3 = ~resetFinish; // @[BaseDirectory.scala 224:5]
  wire [15:0] _T_7 = 16'h1 << io_dir_wway; // @[OneHot.scala 57:35]
  wire [15:0] _T_9 = resetFinish ? _T_7 : 16'h3ff; // @[BaseDirectory.scala 227:8]
  wire [6:0] _resetIdx_T_1 = resetIdx - 7'h1; // @[BaseDirectory.scala 236:26]
  SRAMTemplate_212 metaArray ( // @[BaseDirectory.scala 107:25]
    .clock(metaArray_clock),
    .io_rreq_valid(metaArray_io_rreq_valid),
    .io_rreq_bits_setIdx(metaArray_io_rreq_bits_setIdx),
    .io_rresp_data_0_0_state(metaArray_io_rresp_data_0_0_state),
    .io_rresp_data_0_1_state(metaArray_io_rresp_data_0_1_state),
    .io_rresp_data_1_0_state(metaArray_io_rresp_data_1_0_state),
    .io_rresp_data_1_1_state(metaArray_io_rresp_data_1_1_state),
    .io_rresp_data_2_0_state(metaArray_io_rresp_data_2_0_state),
    .io_rresp_data_2_1_state(metaArray_io_rresp_data_2_1_state),
    .io_rresp_data_3_0_state(metaArray_io_rresp_data_3_0_state),
    .io_rresp_data_3_1_state(metaArray_io_rresp_data_3_1_state),
    .io_rresp_data_4_0_state(metaArray_io_rresp_data_4_0_state),
    .io_rresp_data_4_1_state(metaArray_io_rresp_data_4_1_state),
    .io_rresp_data_5_0_state(metaArray_io_rresp_data_5_0_state),
    .io_rresp_data_5_1_state(metaArray_io_rresp_data_5_1_state),
    .io_rresp_data_6_0_state(metaArray_io_rresp_data_6_0_state),
    .io_rresp_data_6_1_state(metaArray_io_rresp_data_6_1_state),
    .io_rresp_data_7_0_state(metaArray_io_rresp_data_7_0_state),
    .io_rresp_data_7_1_state(metaArray_io_rresp_data_7_1_state),
    .io_rresp_data_8_0_state(metaArray_io_rresp_data_8_0_state),
    .io_rresp_data_8_1_state(metaArray_io_rresp_data_8_1_state),
    .io_rresp_data_9_0_state(metaArray_io_rresp_data_9_0_state),
    .io_rresp_data_9_1_state(metaArray_io_rresp_data_9_1_state),
    .io_wreq_valid(metaArray_io_wreq_valid),
    .io_wreq_bits_setIdx(metaArray_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0_0_state(metaArray_io_wreq_bits_data_0_0_state),
    .io_wreq_bits_data_0_1_state(metaArray_io_wreq_bits_data_0_1_state),
    .io_wreq_bits_data_1_0_state(metaArray_io_wreq_bits_data_1_0_state),
    .io_wreq_bits_data_1_1_state(metaArray_io_wreq_bits_data_1_1_state),
    .io_wreq_bits_data_2_0_state(metaArray_io_wreq_bits_data_2_0_state),
    .io_wreq_bits_data_2_1_state(metaArray_io_wreq_bits_data_2_1_state),
    .io_wreq_bits_data_3_0_state(metaArray_io_wreq_bits_data_3_0_state),
    .io_wreq_bits_data_3_1_state(metaArray_io_wreq_bits_data_3_1_state),
    .io_wreq_bits_data_4_0_state(metaArray_io_wreq_bits_data_4_0_state),
    .io_wreq_bits_data_4_1_state(metaArray_io_wreq_bits_data_4_1_state),
    .io_wreq_bits_data_5_0_state(metaArray_io_wreq_bits_data_5_0_state),
    .io_wreq_bits_data_5_1_state(metaArray_io_wreq_bits_data_5_1_state),
    .io_wreq_bits_data_6_0_state(metaArray_io_wreq_bits_data_6_0_state),
    .io_wreq_bits_data_6_1_state(metaArray_io_wreq_bits_data_6_1_state),
    .io_wreq_bits_data_7_0_state(metaArray_io_wreq_bits_data_7_0_state),
    .io_wreq_bits_data_7_1_state(metaArray_io_wreq_bits_data_7_1_state),
    .io_wreq_bits_data_8_0_state(metaArray_io_wreq_bits_data_8_0_state),
    .io_wreq_bits_data_8_1_state(metaArray_io_wreq_bits_data_8_1_state),
    .io_wreq_bits_data_9_0_state(metaArray_io_wreq_bits_data_9_0_state),
    .io_wreq_bits_data_9_1_state(metaArray_io_wreq_bits_data_9_1_state),
    .io_wreq_bits_waymask(metaArray_io_wreq_bits_waymask)
  );
  STD_CLKGT_func clkGate ( // @[BaseDirectory.scala 109:23]
    .TE(clkGate_TE),
    .E(clkGate_E),
    .CK(clkGate_CK),
    .Q(clkGate_Q)
  );
  SRAMTemplate_213 tagArray ( // @[BaseDirectory.scala 131:24]
    .clock(tagArray_clock),
    .io_rreq_valid(tagArray_io_rreq_valid),
    .io_rreq_bits_setIdx(tagArray_io_rreq_bits_setIdx),
    .io_rresp_data_0(tagArray_io_rresp_data_0),
    .io_rresp_data_1(tagArray_io_rresp_data_1),
    .io_rresp_data_2(tagArray_io_rresp_data_2),
    .io_rresp_data_3(tagArray_io_rresp_data_3),
    .io_rresp_data_4(tagArray_io_rresp_data_4),
    .io_rresp_data_5(tagArray_io_rresp_data_5),
    .io_rresp_data_6(tagArray_io_rresp_data_6),
    .io_rresp_data_7(tagArray_io_rresp_data_7),
    .io_rresp_data_8(tagArray_io_rresp_data_8),
    .io_rresp_data_9(tagArray_io_rresp_data_9),
    .io_wreq_valid(tagArray_io_wreq_valid),
    .io_wreq_bits_setIdx(tagArray_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(tagArray_io_wreq_bits_data_0),
    .io_wreq_bits_data_1(tagArray_io_wreq_bits_data_1),
    .io_wreq_bits_data_2(tagArray_io_wreq_bits_data_2),
    .io_wreq_bits_data_3(tagArray_io_wreq_bits_data_3),
    .io_wreq_bits_data_4(tagArray_io_wreq_bits_data_4),
    .io_wreq_bits_data_5(tagArray_io_wreq_bits_data_5),
    .io_wreq_bits_data_6(tagArray_io_wreq_bits_data_6),
    .io_wreq_bits_data_7(tagArray_io_wreq_bits_data_7),
    .io_wreq_bits_data_8(tagArray_io_wreq_bits_data_8),
    .io_wreq_bits_data_9(tagArray_io_wreq_bits_data_9),
    .io_wreq_bits_waymask(tagArray_io_wreq_bits_waymask)
  );
  MaxPeriodFibonacciLFSR lfsr_prng ( // @[PRNG.scala 91:22]
    .clock(lfsr_prng_clock),
    .reset(lfsr_prng_reset),
    .io_increment(lfsr_prng_io_increment),
    .io_out_0(lfsr_prng_io_out_0),
    .io_out_1(lfsr_prng_io_out_1),
    .io_out_2(lfsr_prng_io_out_2),
    .io_out_3(lfsr_prng_io_out_3),
    .io_out_4(lfsr_prng_io_out_4),
    .io_out_5(lfsr_prng_io_out_5),
    .io_out_6(lfsr_prng_io_out_6),
    .io_out_7(lfsr_prng_io_out_7),
    .io_out_8(lfsr_prng_io_out_8),
    .io_out_9(lfsr_prng_io_out_9),
    .io_out_10(lfsr_prng_io_out_10),
    .io_out_11(lfsr_prng_io_out_11),
    .io_out_12(lfsr_prng_io_out_12),
    .io_out_13(lfsr_prng_io_out_13),
    .io_out_14(lfsr_prng_io_out_14),
    .io_out_15(lfsr_prng_io_out_15)
  );
  assign io_read_ready = ~io_tag_wvalid & ~io_dir_wvalid & resetFinish; // @[BaseDirectory.scala 122:58]
  assign io_resp_bits_hit = hit_s2; // @[BaseDirectory.scala 217:20]
  assign io_resp_bits_way = way_s2; // @[BaseDirectory.scala 218:20]
  assign io_resp_bits_tag = 4'h9 == way_s2 ? tagAll_s2_9 : _GEN_77; // @[BaseDirectory.scala 220:{20,20}]
  assign io_resp_bits_dir_0_state = 4'h9 == way_s2 ? metaAll_s2_9_0_state : _GEN_57; // @[BaseDirectory.scala 219:{20,20}]
  assign io_resp_bits_dir_1_state = 4'h9 == way_s2 ? metaAll_s2_9_1_state : _GEN_67; // @[BaseDirectory.scala 219:{20,20}]
  assign io_tag_wready = 1'h1; // @[BaseDirectory.scala 120:18]
  assign metaArray_clock = clock;
  assign metaArray_io_rreq_valid = io_read_ready & io_read_valid; // @[Decoupled.scala 50:35]
  assign metaArray_io_rreq_bits_setIdx = io_read_bits_set; // @[SRAMTemplate.scala 49:17]
  assign metaArray_io_wreq_valid = ~resetFinish | io_dir_wvalid; // @[BaseDirectory.scala 224:18]
  assign metaArray_io_wreq_bits_setIdx = resetFinish ? io_dir_wset : resetIdx; // @[BaseDirectory.scala 226:8]
  assign metaArray_io_wreq_bits_data_0_0_state = resetFinish ? io_dir_wdir_0_state : 2'h0; // @[BaseDirectory.scala 225:8]
  assign metaArray_io_wreq_bits_data_0_1_state = resetFinish ? io_dir_wdir_1_state : 2'h0; // @[BaseDirectory.scala 225:8]
  assign metaArray_io_wreq_bits_data_1_0_state = resetFinish ? io_dir_wdir_0_state : 2'h0; // @[BaseDirectory.scala 225:8]
  assign metaArray_io_wreq_bits_data_1_1_state = resetFinish ? io_dir_wdir_1_state : 2'h0; // @[BaseDirectory.scala 225:8]
  assign metaArray_io_wreq_bits_data_2_0_state = resetFinish ? io_dir_wdir_0_state : 2'h0; // @[BaseDirectory.scala 225:8]
  assign metaArray_io_wreq_bits_data_2_1_state = resetFinish ? io_dir_wdir_1_state : 2'h0; // @[BaseDirectory.scala 225:8]
  assign metaArray_io_wreq_bits_data_3_0_state = resetFinish ? io_dir_wdir_0_state : 2'h0; // @[BaseDirectory.scala 225:8]
  assign metaArray_io_wreq_bits_data_3_1_state = resetFinish ? io_dir_wdir_1_state : 2'h0; // @[BaseDirectory.scala 225:8]
  assign metaArray_io_wreq_bits_data_4_0_state = resetFinish ? io_dir_wdir_0_state : 2'h0; // @[BaseDirectory.scala 225:8]
  assign metaArray_io_wreq_bits_data_4_1_state = resetFinish ? io_dir_wdir_1_state : 2'h0; // @[BaseDirectory.scala 225:8]
  assign metaArray_io_wreq_bits_data_5_0_state = resetFinish ? io_dir_wdir_0_state : 2'h0; // @[BaseDirectory.scala 225:8]
  assign metaArray_io_wreq_bits_data_5_1_state = resetFinish ? io_dir_wdir_1_state : 2'h0; // @[BaseDirectory.scala 225:8]
  assign metaArray_io_wreq_bits_data_6_0_state = resetFinish ? io_dir_wdir_0_state : 2'h0; // @[BaseDirectory.scala 225:8]
  assign metaArray_io_wreq_bits_data_6_1_state = resetFinish ? io_dir_wdir_1_state : 2'h0; // @[BaseDirectory.scala 225:8]
  assign metaArray_io_wreq_bits_data_7_0_state = resetFinish ? io_dir_wdir_0_state : 2'h0; // @[BaseDirectory.scala 225:8]
  assign metaArray_io_wreq_bits_data_7_1_state = resetFinish ? io_dir_wdir_1_state : 2'h0; // @[BaseDirectory.scala 225:8]
  assign metaArray_io_wreq_bits_data_8_0_state = resetFinish ? io_dir_wdir_0_state : 2'h0; // @[BaseDirectory.scala 225:8]
  assign metaArray_io_wreq_bits_data_8_1_state = resetFinish ? io_dir_wdir_1_state : 2'h0; // @[BaseDirectory.scala 225:8]
  assign metaArray_io_wreq_bits_data_9_0_state = resetFinish ? io_dir_wdir_0_state : 2'h0; // @[BaseDirectory.scala 225:8]
  assign metaArray_io_wreq_bits_data_9_1_state = resetFinish ? io_dir_wdir_1_state : 2'h0; // @[BaseDirectory.scala 225:8]
  assign metaArray_io_wreq_bits_waymask = _T_9[9:0]; // @[SRAMTemplate.scala 61:24]
  assign clkGate_TE = 1'h0; // @[BaseDirectory.scala 112:17]
  assign clkGate_E = clk_en; // @[BaseDirectory.scala 113:16]
  assign clkGate_CK = clock; // @[BaseDirectory.scala 114:17]
  assign tagArray_clock = clock;
  assign tagArray_io_rreq_valid = io_read_ready & io_read_valid; // @[Decoupled.scala 50:35]
  assign tagArray_io_rreq_bits_setIdx = io_read_bits_set; // @[SRAMTemplate.scala 49:17]
  assign tagArray_io_wreq_valid = io_tag_wready & io_tag_wvalid; // @[Decoupled.scala 50:35]
  assign tagArray_io_wreq_bits_setIdx = io_tag_wset; // @[SRAMTemplate.scala 49:17]
  assign tagArray_io_wreq_bits_data_0 = io_tag_wtag; // @[SRAMTemplate.scala 95:{25,25}]
  assign tagArray_io_wreq_bits_data_1 = io_tag_wtag; // @[SRAMTemplate.scala 95:{25,25}]
  assign tagArray_io_wreq_bits_data_2 = io_tag_wtag; // @[SRAMTemplate.scala 95:{25,25}]
  assign tagArray_io_wreq_bits_data_3 = io_tag_wtag; // @[SRAMTemplate.scala 95:{25,25}]
  assign tagArray_io_wreq_bits_data_4 = io_tag_wtag; // @[SRAMTemplate.scala 95:{25,25}]
  assign tagArray_io_wreq_bits_data_5 = io_tag_wtag; // @[SRAMTemplate.scala 95:{25,25}]
  assign tagArray_io_wreq_bits_data_6 = io_tag_wtag; // @[SRAMTemplate.scala 95:{25,25}]
  assign tagArray_io_wreq_bits_data_7 = io_tag_wtag; // @[SRAMTemplate.scala 95:{25,25}]
  assign tagArray_io_wreq_bits_data_8 = io_tag_wtag; // @[SRAMTemplate.scala 95:{25,25}]
  assign tagArray_io_wreq_bits_data_9 = io_tag_wtag; // @[SRAMTemplate.scala 95:{25,25}]
  assign tagArray_io_wreq_bits_waymask = _T_1[9:0]; // @[SRAMTemplate.scala 61:24]
  assign lfsr_prng_clock = clock;
  assign lfsr_prng_reset = reset;
  assign lfsr_prng_io_increment = io_tag_wready & io_tag_wvalid; // @[Decoupled.scala 50:35]
  always @(posedge clock) begin
    if (_T_2) begin // @[Reg.scala 17:18]
      reqReg_tag <= io_read_bits_tag; // @[Reg.scala 17:22]
    end
    if (reqValidReg) begin // @[Reg.scala 17:18]
      metaAll_s2_0_0_state <= metaArray_io_rresp_data_0_0_state; // @[Reg.scala 17:22]
    end
    if (reqValidReg) begin // @[Reg.scala 17:18]
      metaAll_s2_0_1_state <= metaArray_io_rresp_data_0_1_state; // @[Reg.scala 17:22]
    end
    if (reqValidReg) begin // @[Reg.scala 17:18]
      metaAll_s2_1_0_state <= metaArray_io_rresp_data_1_0_state; // @[Reg.scala 17:22]
    end
    if (reqValidReg) begin // @[Reg.scala 17:18]
      metaAll_s2_1_1_state <= metaArray_io_rresp_data_1_1_state; // @[Reg.scala 17:22]
    end
    if (reqValidReg) begin // @[Reg.scala 17:18]
      metaAll_s2_2_0_state <= metaArray_io_rresp_data_2_0_state; // @[Reg.scala 17:22]
    end
    if (reqValidReg) begin // @[Reg.scala 17:18]
      metaAll_s2_2_1_state <= metaArray_io_rresp_data_2_1_state; // @[Reg.scala 17:22]
    end
    if (reqValidReg) begin // @[Reg.scala 17:18]
      metaAll_s2_3_0_state <= metaArray_io_rresp_data_3_0_state; // @[Reg.scala 17:22]
    end
    if (reqValidReg) begin // @[Reg.scala 17:18]
      metaAll_s2_3_1_state <= metaArray_io_rresp_data_3_1_state; // @[Reg.scala 17:22]
    end
    if (reqValidReg) begin // @[Reg.scala 17:18]
      metaAll_s2_4_0_state <= metaArray_io_rresp_data_4_0_state; // @[Reg.scala 17:22]
    end
    if (reqValidReg) begin // @[Reg.scala 17:18]
      metaAll_s2_4_1_state <= metaArray_io_rresp_data_4_1_state; // @[Reg.scala 17:22]
    end
    if (reqValidReg) begin // @[Reg.scala 17:18]
      metaAll_s2_5_0_state <= metaArray_io_rresp_data_5_0_state; // @[Reg.scala 17:22]
    end
    if (reqValidReg) begin // @[Reg.scala 17:18]
      metaAll_s2_5_1_state <= metaArray_io_rresp_data_5_1_state; // @[Reg.scala 17:22]
    end
    if (reqValidReg) begin // @[Reg.scala 17:18]
      metaAll_s2_6_0_state <= metaArray_io_rresp_data_6_0_state; // @[Reg.scala 17:22]
    end
    if (reqValidReg) begin // @[Reg.scala 17:18]
      metaAll_s2_6_1_state <= metaArray_io_rresp_data_6_1_state; // @[Reg.scala 17:22]
    end
    if (reqValidReg) begin // @[Reg.scala 17:18]
      metaAll_s2_7_0_state <= metaArray_io_rresp_data_7_0_state; // @[Reg.scala 17:22]
    end
    if (reqValidReg) begin // @[Reg.scala 17:18]
      metaAll_s2_7_1_state <= metaArray_io_rresp_data_7_1_state; // @[Reg.scala 17:22]
    end
    if (reqValidReg) begin // @[Reg.scala 17:18]
      metaAll_s2_8_0_state <= metaArray_io_rresp_data_8_0_state; // @[Reg.scala 17:22]
    end
    if (reqValidReg) begin // @[Reg.scala 17:18]
      metaAll_s2_8_1_state <= metaArray_io_rresp_data_8_1_state; // @[Reg.scala 17:22]
    end
    if (reqValidReg) begin // @[Reg.scala 17:18]
      metaAll_s2_9_0_state <= metaArray_io_rresp_data_9_0_state; // @[Reg.scala 17:22]
    end
    if (reqValidReg) begin // @[Reg.scala 17:18]
      metaAll_s2_9_1_state <= metaArray_io_rresp_data_9_1_state; // @[Reg.scala 17:22]
    end
    if (reqValidReg) begin // @[Reg.scala 17:18]
      tagAll_s2_0 <= tagRead_0; // @[Reg.scala 17:22]
    end
    if (reqValidReg) begin // @[Reg.scala 17:18]
      tagAll_s2_1 <= tagRead_1; // @[Reg.scala 17:22]
    end
    if (reqValidReg) begin // @[Reg.scala 17:18]
      tagAll_s2_2 <= tagRead_2; // @[Reg.scala 17:22]
    end
    if (reqValidReg) begin // @[Reg.scala 17:18]
      tagAll_s2_3 <= tagRead_3; // @[Reg.scala 17:22]
    end
    if (reqValidReg) begin // @[Reg.scala 17:18]
      tagAll_s2_4 <= tagRead_4; // @[Reg.scala 17:22]
    end
    if (reqValidReg) begin // @[Reg.scala 17:18]
      tagAll_s2_5 <= tagRead_5; // @[Reg.scala 17:22]
    end
    if (reqValidReg) begin // @[Reg.scala 17:18]
      tagAll_s2_6 <= tagRead_6; // @[Reg.scala 17:22]
    end
    if (reqValidReg) begin // @[Reg.scala 17:18]
      tagAll_s2_7 <= tagRead_7; // @[Reg.scala 17:22]
    end
    if (reqValidReg) begin // @[Reg.scala 17:18]
      tagAll_s2_8 <= tagRead_8; // @[Reg.scala 17:22]
    end
    if (reqValidReg) begin // @[Reg.scala 17:18]
      tagAll_s2_9 <= tagRead_9; // @[Reg.scala 17:22]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[BaseDirectory.scala 232:39]
      resetFinish <= 1'h0; // @[BaseDirectory.scala 233:17]
    end else begin
      resetFinish <= resetIdx == 7'h0 | resetFinish; // @[BaseDirectory.scala 105:28]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[BaseDirectory.scala 235:35]
      resetIdx <= 7'h7f; // @[BaseDirectory.scala 236:14]
    end else if (_T_3) begin // @[BaseDirectory.scala 106:25]
      resetIdx <= _resetIdx_T_1;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[BaseDirectory.scala 111:13]
      clk_en <= 1'h0;
    end else begin
      clk_en <= ~clk_en;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Decoupled.scala 50:35]
      reqValidReg <= 1'h0;
    end else begin
      reqValidReg <= io_read_ready & io_read_valid;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Reg.scala 29:18]
      hit_s2 <= 1'h0; // @[Reg.scala 29:22]
    end else if (reqValidReg) begin // @[Reg.scala 28:20]
      hit_s2 <= hit_s1;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Reg.scala 29:18]
      way_s2 <= 4'h0; // @[BaseDirectory.scala 196:22 204:48 Mux.scala 47:70 ParallelMux.scala 90:77]
    end else if (reqValidReg) begin // @[Reg.scala 28:20]
      if (hit_s1) begin
        way_s2 <= hitWay;
      end else if (inv) begin
        if (invalid_vec_0 | invalid_vec_1 | (invalid_vec_2 | (invalid_vec_3 | invalid_vec_4))) begin
          way_s2 <= _way_T_7;
        end else begin
          way_s2 <= _way_T_15;
        end
      end else if (_replaceWay_T_1) begin
        way_s2 <= 4'h0;
      end else begin
        way_s2 <= _replaceWay_T_18;
      end
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
  resetFinish = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  resetIdx = _RAND_1[6:0];
  _RAND_2 = {1{`RANDOM}};
  clk_en = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  reqReg_tag = _RAND_3[22:0];
  _RAND_4 = {1{`RANDOM}};
  reqValidReg = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  hit_s2 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  way_s2 = _RAND_6[3:0];
  _RAND_7 = {1{`RANDOM}};
  metaAll_s2_0_0_state = _RAND_7[1:0];
  _RAND_8 = {1{`RANDOM}};
  metaAll_s2_0_1_state = _RAND_8[1:0];
  _RAND_9 = {1{`RANDOM}};
  metaAll_s2_1_0_state = _RAND_9[1:0];
  _RAND_10 = {1{`RANDOM}};
  metaAll_s2_1_1_state = _RAND_10[1:0];
  _RAND_11 = {1{`RANDOM}};
  metaAll_s2_2_0_state = _RAND_11[1:0];
  _RAND_12 = {1{`RANDOM}};
  metaAll_s2_2_1_state = _RAND_12[1:0];
  _RAND_13 = {1{`RANDOM}};
  metaAll_s2_3_0_state = _RAND_13[1:0];
  _RAND_14 = {1{`RANDOM}};
  metaAll_s2_3_1_state = _RAND_14[1:0];
  _RAND_15 = {1{`RANDOM}};
  metaAll_s2_4_0_state = _RAND_15[1:0];
  _RAND_16 = {1{`RANDOM}};
  metaAll_s2_4_1_state = _RAND_16[1:0];
  _RAND_17 = {1{`RANDOM}};
  metaAll_s2_5_0_state = _RAND_17[1:0];
  _RAND_18 = {1{`RANDOM}};
  metaAll_s2_5_1_state = _RAND_18[1:0];
  _RAND_19 = {1{`RANDOM}};
  metaAll_s2_6_0_state = _RAND_19[1:0];
  _RAND_20 = {1{`RANDOM}};
  metaAll_s2_6_1_state = _RAND_20[1:0];
  _RAND_21 = {1{`RANDOM}};
  metaAll_s2_7_0_state = _RAND_21[1:0];
  _RAND_22 = {1{`RANDOM}};
  metaAll_s2_7_1_state = _RAND_22[1:0];
  _RAND_23 = {1{`RANDOM}};
  metaAll_s2_8_0_state = _RAND_23[1:0];
  _RAND_24 = {1{`RANDOM}};
  metaAll_s2_8_1_state = _RAND_24[1:0];
  _RAND_25 = {1{`RANDOM}};
  metaAll_s2_9_0_state = _RAND_25[1:0];
  _RAND_26 = {1{`RANDOM}};
  metaAll_s2_9_1_state = _RAND_26[1:0];
  _RAND_27 = {1{`RANDOM}};
  tagAll_s2_0 = _RAND_27[22:0];
  _RAND_28 = {1{`RANDOM}};
  tagAll_s2_1 = _RAND_28[22:0];
  _RAND_29 = {1{`RANDOM}};
  tagAll_s2_2 = _RAND_29[22:0];
  _RAND_30 = {1{`RANDOM}};
  tagAll_s2_3 = _RAND_30[22:0];
  _RAND_31 = {1{`RANDOM}};
  tagAll_s2_4 = _RAND_31[22:0];
  _RAND_32 = {1{`RANDOM}};
  tagAll_s2_5 = _RAND_32[22:0];
  _RAND_33 = {1{`RANDOM}};
  tagAll_s2_6 = _RAND_33[22:0];
  _RAND_34 = {1{`RANDOM}};
  tagAll_s2_7 = _RAND_34[22:0];
  _RAND_35 = {1{`RANDOM}};
  tagAll_s2_8 = _RAND_35[22:0];
  _RAND_36 = {1{`RANDOM}};
  tagAll_s2_9 = _RAND_36[22:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    resetFinish = 1'h0;
  end
  if (reset) begin
    resetIdx = 7'h7f;
  end
  if (reset) begin
    clk_en = 1'h0;
  end
  if (reset) begin
    reqValidReg = 1'h0;
  end
  if (reset) begin
    hit_s2 = 1'h0;
  end
  if (reset) begin
    way_s2 = 4'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

