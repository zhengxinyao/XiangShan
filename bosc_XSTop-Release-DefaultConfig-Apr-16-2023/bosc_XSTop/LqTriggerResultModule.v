module LqTriggerResultModule(
  input        clock,
  input  [3:0] io_raddr_0,
  output       io_rdata_0_0,
  output       io_rdata_0_1,
  output       io_rdata_0_2,
  input        io_wen_0,
  input        io_wen_1,
  input  [3:0] io_waddr_0,
  input  [3:0] io_waddr_1,
  input        io_wdata_0_0,
  input        io_wdata_0_1,
  input        io_wdata_0_2,
  input        io_wdata_1_0,
  input        io_wdata_1_1,
  input        io_wdata_1_2
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
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
`endif // RANDOMIZE_REG_INIT
  wire  sx_bankWriteAddrDec_delay_clock; // @[Hold.scala 97:23]
  wire [3:0] sx_bankWriteAddrDec_delay_io_in; // @[Hold.scala 97:23]
  wire [3:0] sx_bankWriteAddrDec_delay_io_out; // @[Hold.scala 97:23]
  wire  sx_bankWriteAddrDec_delay_1_clock; // @[Hold.scala 97:23]
  wire [3:0] sx_bankWriteAddrDec_delay_1_io_in; // @[Hold.scala 97:23]
  wire [3:0] sx_bankWriteAddrDec_delay_1_io_out; // @[Hold.scala 97:23]
  wire  sx_bankWriteEn_delay_clock; // @[Hold.scala 97:23]
  wire  sx_bankWriteEn_delay_io_in; // @[Hold.scala 97:23]
  wire  sx_bankWriteEn_delay_io_out; // @[Hold.scala 97:23]
  wire  sx_bankWriteEn_delay_1_clock; // @[Hold.scala 97:23]
  wire  sx_bankWriteEn_delay_1_io_in; // @[Hold.scala 97:23]
  wire  sx_bankWriteEn_delay_1_io_out; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_clock; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_io_in_0; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_io_in_1; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_io_in_2; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_io_out_0; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_io_out_1; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_io_out_2; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_1_clock; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_1_io_in_0; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_1_io_in_1; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_1_io_in_2; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_1_io_out_0; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_1_io_out_1; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_1_io_out_2; // @[Hold.scala 97:23]
  wire  sx_bankWriteAddrDec_delay_2_clock; // @[Hold.scala 97:23]
  wire [3:0] sx_bankWriteAddrDec_delay_2_io_in; // @[Hold.scala 97:23]
  wire [3:0] sx_bankWriteAddrDec_delay_2_io_out; // @[Hold.scala 97:23]
  wire  sx_bankWriteAddrDec_delay_3_clock; // @[Hold.scala 97:23]
  wire [3:0] sx_bankWriteAddrDec_delay_3_io_in; // @[Hold.scala 97:23]
  wire [3:0] sx_bankWriteAddrDec_delay_3_io_out; // @[Hold.scala 97:23]
  wire  sx_bankWriteEn_delay_2_clock; // @[Hold.scala 97:23]
  wire  sx_bankWriteEn_delay_2_io_in; // @[Hold.scala 97:23]
  wire  sx_bankWriteEn_delay_2_io_out; // @[Hold.scala 97:23]
  wire  sx_bankWriteEn_delay_3_clock; // @[Hold.scala 97:23]
  wire  sx_bankWriteEn_delay_3_io_in; // @[Hold.scala 97:23]
  wire  sx_bankWriteEn_delay_3_io_out; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_2_clock; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_2_io_in_0; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_2_io_in_1; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_2_io_in_2; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_2_io_out_0; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_2_io_out_1; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_2_io_out_2; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_3_clock; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_3_io_in_0; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_3_io_in_1; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_3_io_in_2; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_3_io_out_0; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_3_io_out_1; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_3_io_out_2; // @[Hold.scala 97:23]
  wire  sx_bankWriteAddrDec_delay_4_clock; // @[Hold.scala 97:23]
  wire [3:0] sx_bankWriteAddrDec_delay_4_io_in; // @[Hold.scala 97:23]
  wire [3:0] sx_bankWriteAddrDec_delay_4_io_out; // @[Hold.scala 97:23]
  wire  sx_bankWriteAddrDec_delay_5_clock; // @[Hold.scala 97:23]
  wire [3:0] sx_bankWriteAddrDec_delay_5_io_in; // @[Hold.scala 97:23]
  wire [3:0] sx_bankWriteAddrDec_delay_5_io_out; // @[Hold.scala 97:23]
  wire  sx_bankWriteEn_delay_4_clock; // @[Hold.scala 97:23]
  wire  sx_bankWriteEn_delay_4_io_in; // @[Hold.scala 97:23]
  wire  sx_bankWriteEn_delay_4_io_out; // @[Hold.scala 97:23]
  wire  sx_bankWriteEn_delay_5_clock; // @[Hold.scala 97:23]
  wire  sx_bankWriteEn_delay_5_io_in; // @[Hold.scala 97:23]
  wire  sx_bankWriteEn_delay_5_io_out; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_4_clock; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_4_io_in_0; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_4_io_in_1; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_4_io_in_2; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_4_io_out_0; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_4_io_out_1; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_4_io_out_2; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_5_clock; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_5_io_in_0; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_5_io_in_1; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_5_io_in_2; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_5_io_out_0; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_5_io_out_1; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_5_io_out_2; // @[Hold.scala 97:23]
  wire  sx_bankWriteAddrDec_delay_6_clock; // @[Hold.scala 97:23]
  wire [3:0] sx_bankWriteAddrDec_delay_6_io_in; // @[Hold.scala 97:23]
  wire [3:0] sx_bankWriteAddrDec_delay_6_io_out; // @[Hold.scala 97:23]
  wire  sx_bankWriteAddrDec_delay_7_clock; // @[Hold.scala 97:23]
  wire [3:0] sx_bankWriteAddrDec_delay_7_io_in; // @[Hold.scala 97:23]
  wire [3:0] sx_bankWriteAddrDec_delay_7_io_out; // @[Hold.scala 97:23]
  wire  sx_bankWriteEn_delay_6_clock; // @[Hold.scala 97:23]
  wire  sx_bankWriteEn_delay_6_io_in; // @[Hold.scala 97:23]
  wire  sx_bankWriteEn_delay_6_io_out; // @[Hold.scala 97:23]
  wire  sx_bankWriteEn_delay_7_clock; // @[Hold.scala 97:23]
  wire  sx_bankWriteEn_delay_7_io_in; // @[Hold.scala 97:23]
  wire  sx_bankWriteEn_delay_7_io_out; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_6_clock; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_6_io_in_0; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_6_io_in_1; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_6_io_in_2; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_6_io_out_0; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_6_io_out_1; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_6_io_out_2; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_7_clock; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_7_io_in_0; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_7_io_in_1; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_7_io_in_2; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_7_io_out_0; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_7_io_out_1; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_7_io_out_2; // @[Hold.scala 97:23]
  reg  data_0_0; // @[LoadQueueData.scala 57:17]
  reg  data_0_1; // @[LoadQueueData.scala 57:17]
  reg  data_0_2; // @[LoadQueueData.scala 57:17]
  reg  data_1_0; // @[LoadQueueData.scala 57:17]
  reg  data_1_1; // @[LoadQueueData.scala 57:17]
  reg  data_1_2; // @[LoadQueueData.scala 57:17]
  reg  data_2_0; // @[LoadQueueData.scala 57:17]
  reg  data_2_1; // @[LoadQueueData.scala 57:17]
  reg  data_2_2; // @[LoadQueueData.scala 57:17]
  reg  data_3_0; // @[LoadQueueData.scala 57:17]
  reg  data_3_1; // @[LoadQueueData.scala 57:17]
  reg  data_3_2; // @[LoadQueueData.scala 57:17]
  reg  data_4_0; // @[LoadQueueData.scala 57:17]
  reg  data_4_1; // @[LoadQueueData.scala 57:17]
  reg  data_4_2; // @[LoadQueueData.scala 57:17]
  reg  data_5_0; // @[LoadQueueData.scala 57:17]
  reg  data_5_1; // @[LoadQueueData.scala 57:17]
  reg  data_5_2; // @[LoadQueueData.scala 57:17]
  reg  data_6_0; // @[LoadQueueData.scala 57:17]
  reg  data_6_1; // @[LoadQueueData.scala 57:17]
  reg  data_6_2; // @[LoadQueueData.scala 57:17]
  reg  data_7_0; // @[LoadQueueData.scala 57:17]
  reg  data_7_1; // @[LoadQueueData.scala 57:17]
  reg  data_7_2; // @[LoadQueueData.scala 57:17]
  reg  data_8_0; // @[LoadQueueData.scala 57:17]
  reg  data_8_1; // @[LoadQueueData.scala 57:17]
  reg  data_8_2; // @[LoadQueueData.scala 57:17]
  reg  data_9_0; // @[LoadQueueData.scala 57:17]
  reg  data_9_1; // @[LoadQueueData.scala 57:17]
  reg  data_9_2; // @[LoadQueueData.scala 57:17]
  reg  data_10_0; // @[LoadQueueData.scala 57:17]
  reg  data_10_1; // @[LoadQueueData.scala 57:17]
  reg  data_10_2; // @[LoadQueueData.scala 57:17]
  reg  data_11_0; // @[LoadQueueData.scala 57:17]
  reg  data_11_1; // @[LoadQueueData.scala 57:17]
  reg  data_11_2; // @[LoadQueueData.scala 57:17]
  reg  data_12_0; // @[LoadQueueData.scala 57:17]
  reg  data_12_1; // @[LoadQueueData.scala 57:17]
  reg  data_12_2; // @[LoadQueueData.scala 57:17]
  reg  data_13_0; // @[LoadQueueData.scala 57:17]
  reg  data_13_1; // @[LoadQueueData.scala 57:17]
  reg  data_13_2; // @[LoadQueueData.scala 57:17]
  reg  data_14_0; // @[LoadQueueData.scala 57:17]
  reg  data_14_1; // @[LoadQueueData.scala 57:17]
  reg  data_14_2; // @[LoadQueueData.scala 57:17]
  reg  data_15_0; // @[LoadQueueData.scala 57:17]
  reg  data_15_1; // @[LoadQueueData.scala 57:17]
  reg  data_15_2; // @[LoadQueueData.scala 57:17]
  reg [3:0] io_rdata_0_REG; // @[LoadQueueData.scala 60:32]
  wire  _GEN_1 = 4'h1 == io_rdata_0_REG ? data_1_0 : data_0_0; // @[LoadQueueData.scala 60:{17,17}]
  wire  _GEN_2 = 4'h2 == io_rdata_0_REG ? data_2_0 : _GEN_1; // @[LoadQueueData.scala 60:{17,17}]
  wire  _GEN_3 = 4'h3 == io_rdata_0_REG ? data_3_0 : _GEN_2; // @[LoadQueueData.scala 60:{17,17}]
  wire  _GEN_4 = 4'h4 == io_rdata_0_REG ? data_4_0 : _GEN_3; // @[LoadQueueData.scala 60:{17,17}]
  wire  _GEN_5 = 4'h5 == io_rdata_0_REG ? data_5_0 : _GEN_4; // @[LoadQueueData.scala 60:{17,17}]
  wire  _GEN_6 = 4'h6 == io_rdata_0_REG ? data_6_0 : _GEN_5; // @[LoadQueueData.scala 60:{17,17}]
  wire  _GEN_7 = 4'h7 == io_rdata_0_REG ? data_7_0 : _GEN_6; // @[LoadQueueData.scala 60:{17,17}]
  wire  _GEN_8 = 4'h8 == io_rdata_0_REG ? data_8_0 : _GEN_7; // @[LoadQueueData.scala 60:{17,17}]
  wire  _GEN_9 = 4'h9 == io_rdata_0_REG ? data_9_0 : _GEN_8; // @[LoadQueueData.scala 60:{17,17}]
  wire  _GEN_10 = 4'ha == io_rdata_0_REG ? data_10_0 : _GEN_9; // @[LoadQueueData.scala 60:{17,17}]
  wire  _GEN_11 = 4'hb == io_rdata_0_REG ? data_11_0 : _GEN_10; // @[LoadQueueData.scala 60:{17,17}]
  wire  _GEN_12 = 4'hc == io_rdata_0_REG ? data_12_0 : _GEN_11; // @[LoadQueueData.scala 60:{17,17}]
  wire  _GEN_13 = 4'hd == io_rdata_0_REG ? data_13_0 : _GEN_12; // @[LoadQueueData.scala 60:{17,17}]
  wire  _GEN_14 = 4'he == io_rdata_0_REG ? data_14_0 : _GEN_13; // @[LoadQueueData.scala 60:{17,17}]
  wire  _GEN_17 = 4'h1 == io_rdata_0_REG ? data_1_1 : data_0_1; // @[LoadQueueData.scala 60:{17,17}]
  wire  _GEN_18 = 4'h2 == io_rdata_0_REG ? data_2_1 : _GEN_17; // @[LoadQueueData.scala 60:{17,17}]
  wire  _GEN_19 = 4'h3 == io_rdata_0_REG ? data_3_1 : _GEN_18; // @[LoadQueueData.scala 60:{17,17}]
  wire  _GEN_20 = 4'h4 == io_rdata_0_REG ? data_4_1 : _GEN_19; // @[LoadQueueData.scala 60:{17,17}]
  wire  _GEN_21 = 4'h5 == io_rdata_0_REG ? data_5_1 : _GEN_20; // @[LoadQueueData.scala 60:{17,17}]
  wire  _GEN_22 = 4'h6 == io_rdata_0_REG ? data_6_1 : _GEN_21; // @[LoadQueueData.scala 60:{17,17}]
  wire  _GEN_23 = 4'h7 == io_rdata_0_REG ? data_7_1 : _GEN_22; // @[LoadQueueData.scala 60:{17,17}]
  wire  _GEN_24 = 4'h8 == io_rdata_0_REG ? data_8_1 : _GEN_23; // @[LoadQueueData.scala 60:{17,17}]
  wire  _GEN_25 = 4'h9 == io_rdata_0_REG ? data_9_1 : _GEN_24; // @[LoadQueueData.scala 60:{17,17}]
  wire  _GEN_26 = 4'ha == io_rdata_0_REG ? data_10_1 : _GEN_25; // @[LoadQueueData.scala 60:{17,17}]
  wire  _GEN_27 = 4'hb == io_rdata_0_REG ? data_11_1 : _GEN_26; // @[LoadQueueData.scala 60:{17,17}]
  wire  _GEN_28 = 4'hc == io_rdata_0_REG ? data_12_1 : _GEN_27; // @[LoadQueueData.scala 60:{17,17}]
  wire  _GEN_29 = 4'hd == io_rdata_0_REG ? data_13_1 : _GEN_28; // @[LoadQueueData.scala 60:{17,17}]
  wire  _GEN_30 = 4'he == io_rdata_0_REG ? data_14_1 : _GEN_29; // @[LoadQueueData.scala 60:{17,17}]
  wire  _GEN_33 = 4'h1 == io_rdata_0_REG ? data_1_2 : data_0_2; // @[LoadQueueData.scala 60:{17,17}]
  wire  _GEN_34 = 4'h2 == io_rdata_0_REG ? data_2_2 : _GEN_33; // @[LoadQueueData.scala 60:{17,17}]
  wire  _GEN_35 = 4'h3 == io_rdata_0_REG ? data_3_2 : _GEN_34; // @[LoadQueueData.scala 60:{17,17}]
  wire  _GEN_36 = 4'h4 == io_rdata_0_REG ? data_4_2 : _GEN_35; // @[LoadQueueData.scala 60:{17,17}]
  wire  _GEN_37 = 4'h5 == io_rdata_0_REG ? data_5_2 : _GEN_36; // @[LoadQueueData.scala 60:{17,17}]
  wire  _GEN_38 = 4'h6 == io_rdata_0_REG ? data_6_2 : _GEN_37; // @[LoadQueueData.scala 60:{17,17}]
  wire  _GEN_39 = 4'h7 == io_rdata_0_REG ? data_7_2 : _GEN_38; // @[LoadQueueData.scala 60:{17,17}]
  wire  _GEN_40 = 4'h8 == io_rdata_0_REG ? data_8_2 : _GEN_39; // @[LoadQueueData.scala 60:{17,17}]
  wire  _GEN_41 = 4'h9 == io_rdata_0_REG ? data_9_2 : _GEN_40; // @[LoadQueueData.scala 60:{17,17}]
  wire  _GEN_42 = 4'ha == io_rdata_0_REG ? data_10_2 : _GEN_41; // @[LoadQueueData.scala 60:{17,17}]
  wire  _GEN_43 = 4'hb == io_rdata_0_REG ? data_11_2 : _GEN_42; // @[LoadQueueData.scala 60:{17,17}]
  wire  _GEN_44 = 4'hc == io_rdata_0_REG ? data_12_2 : _GEN_43; // @[LoadQueueData.scala 60:{17,17}]
  wire  _GEN_45 = 4'hd == io_rdata_0_REG ? data_13_2 : _GEN_44; // @[LoadQueueData.scala 60:{17,17}]
  wire  _GEN_46 = 4'he == io_rdata_0_REG ? data_14_2 : _GEN_45; // @[LoadQueueData.scala 60:{17,17}]
  wire [15:0] writeAddrDec_0 = 16'h1 << io_waddr_0; // @[OneHot.scala 57:35]
  wire [15:0] writeAddrDec_1 = 16'h1 << io_waddr_1; // @[OneHot.scala 57:35]
  wire [3:0] s0_bankWriteAddrDec0_0 = writeAddrDec_0[3:0]; // @[LoadQueueData.scala 66:7]
  wire [3:0] s0_bankWriteAddrDec0_1 = writeAddrDec_1[3:0]; // @[LoadQueueData.scala 66:7]
  wire  sx_entryWriteEnVec0_0_0 = sx_bankWriteEn_delay_io_out & sx_bankWriteAddrDec_delay_io_out[0]; // @[LoadQueueData.scala 96:86]
  wire  sx_entryWriteEnVec0_0_1 = sx_bankWriteEn_delay_1_io_out & sx_bankWriteAddrDec_delay_1_io_out[0]; // @[LoadQueueData.scala 96:86]
  wire [1:0] _sx_entryWriteEn_T = {sx_entryWriteEnVec0_0_1,sx_entryWriteEnVec0_0_0}; // @[LoadQueueData.scala 97:57]
  wire  sx_entryWriteEn0_0 = |_sx_entryWriteEn_T; // @[LoadQueueData.scala 97:64]
  wire  sx_entryWriteData0_0_0 = sx_entryWriteEnVec0_0_0 & sx_writeData_delay_io_out_0 | sx_entryWriteEnVec0_0_1 &
    sx_writeData_delay_1_io_out_0; // @[Mux.scala 27:73]
  wire  sx_entryWriteData0_0_1 = sx_entryWriteEnVec0_0_0 & sx_writeData_delay_io_out_1 | sx_entryWriteEnVec0_0_1 &
    sx_writeData_delay_1_io_out_1; // @[Mux.scala 27:73]
  wire  sx_entryWriteData0_0_2 = sx_entryWriteEnVec0_0_0 & sx_writeData_delay_io_out_2 | sx_entryWriteEnVec0_0_1 &
    sx_writeData_delay_1_io_out_2; // @[Mux.scala 27:73]
  wire  sx_entryWriteEnVec0_1_0 = sx_bankWriteEn_delay_io_out & sx_bankWriteAddrDec_delay_io_out[1]; // @[LoadQueueData.scala 96:86]
  wire  sx_entryWriteEnVec0_1_1 = sx_bankWriteEn_delay_1_io_out & sx_bankWriteAddrDec_delay_1_io_out[1]; // @[LoadQueueData.scala 96:86]
  wire [1:0] _sx_entryWriteEn_T_1 = {sx_entryWriteEnVec0_1_1,sx_entryWriteEnVec0_1_0}; // @[LoadQueueData.scala 97:57]
  wire  sx_entryWriteEn0_1 = |_sx_entryWriteEn_T_1; // @[LoadQueueData.scala 97:64]
  wire  sx_entryWriteData0_1_0 = sx_entryWriteEnVec0_1_0 & sx_writeData_delay_io_out_0 | sx_entryWriteEnVec0_1_1 &
    sx_writeData_delay_1_io_out_0; // @[Mux.scala 27:73]
  wire  sx_entryWriteData0_1_1 = sx_entryWriteEnVec0_1_0 & sx_writeData_delay_io_out_1 | sx_entryWriteEnVec0_1_1 &
    sx_writeData_delay_1_io_out_1; // @[Mux.scala 27:73]
  wire  sx_entryWriteData0_1_2 = sx_entryWriteEnVec0_1_0 & sx_writeData_delay_io_out_2 | sx_entryWriteEnVec0_1_1 &
    sx_writeData_delay_1_io_out_2; // @[Mux.scala 27:73]
  wire  sx_entryWriteEnVec0_2_0 = sx_bankWriteEn_delay_io_out & sx_bankWriteAddrDec_delay_io_out[2]; // @[LoadQueueData.scala 96:86]
  wire  sx_entryWriteEnVec0_2_1 = sx_bankWriteEn_delay_1_io_out & sx_bankWriteAddrDec_delay_1_io_out[2]; // @[LoadQueueData.scala 96:86]
  wire [1:0] _sx_entryWriteEn_T_2 = {sx_entryWriteEnVec0_2_1,sx_entryWriteEnVec0_2_0}; // @[LoadQueueData.scala 97:57]
  wire  sx_entryWriteEn0_2 = |_sx_entryWriteEn_T_2; // @[LoadQueueData.scala 97:64]
  wire  sx_entryWriteData0_2_0 = sx_entryWriteEnVec0_2_0 & sx_writeData_delay_io_out_0 | sx_entryWriteEnVec0_2_1 &
    sx_writeData_delay_1_io_out_0; // @[Mux.scala 27:73]
  wire  sx_entryWriteData0_2_1 = sx_entryWriteEnVec0_2_0 & sx_writeData_delay_io_out_1 | sx_entryWriteEnVec0_2_1 &
    sx_writeData_delay_1_io_out_1; // @[Mux.scala 27:73]
  wire  sx_entryWriteData0_2_2 = sx_entryWriteEnVec0_2_0 & sx_writeData_delay_io_out_2 | sx_entryWriteEnVec0_2_1 &
    sx_writeData_delay_1_io_out_2; // @[Mux.scala 27:73]
  wire  sx_entryWriteEnVec0_3_0 = sx_bankWriteEn_delay_io_out & sx_bankWriteAddrDec_delay_io_out[3]; // @[LoadQueueData.scala 96:86]
  wire  sx_entryWriteEnVec0_3_1 = sx_bankWriteEn_delay_1_io_out & sx_bankWriteAddrDec_delay_1_io_out[3]; // @[LoadQueueData.scala 96:86]
  wire [1:0] _sx_entryWriteEn_T_3 = {sx_entryWriteEnVec0_3_1,sx_entryWriteEnVec0_3_0}; // @[LoadQueueData.scala 97:57]
  wire  sx_entryWriteEn0_3 = |_sx_entryWriteEn_T_3; // @[LoadQueueData.scala 97:64]
  wire  sx_entryWriteData0_3_0 = sx_entryWriteEnVec0_3_0 & sx_writeData_delay_io_out_0 | sx_entryWriteEnVec0_3_1 &
    sx_writeData_delay_1_io_out_0; // @[Mux.scala 27:73]
  wire  sx_entryWriteData0_3_1 = sx_entryWriteEnVec0_3_0 & sx_writeData_delay_io_out_1 | sx_entryWriteEnVec0_3_1 &
    sx_writeData_delay_1_io_out_1; // @[Mux.scala 27:73]
  wire  sx_entryWriteData0_3_2 = sx_entryWriteEnVec0_3_0 & sx_writeData_delay_io_out_2 | sx_entryWriteEnVec0_3_1 &
    sx_writeData_delay_1_io_out_2; // @[Mux.scala 27:73]
  wire [3:0] s0_bankWriteAddrDec1_0 = writeAddrDec_0[7:4]; // @[LoadQueueData.scala 66:7]
  wire [3:0] s0_bankWriteAddrDec1_1 = writeAddrDec_1[7:4]; // @[LoadQueueData.scala 66:7]
  wire  sx_entryWriteEnVec1_0_0 = sx_bankWriteEn_delay_2_io_out & sx_bankWriteAddrDec_delay_2_io_out[0]; // @[LoadQueueData.scala 96:86]
  wire  sx_entryWriteEnVec1_0_1 = sx_bankWriteEn_delay_3_io_out & sx_bankWriteAddrDec_delay_3_io_out[0]; // @[LoadQueueData.scala 96:86]
  wire [1:0] _sx_entryWriteEn_T_4 = {sx_entryWriteEnVec1_0_1,sx_entryWriteEnVec1_0_0}; // @[LoadQueueData.scala 97:57]
  wire  sx_entryWriteEn1_0 = |_sx_entryWriteEn_T_4; // @[LoadQueueData.scala 97:64]
  wire  sx_entryWriteData1_0_0 = sx_entryWriteEnVec1_0_0 & sx_writeData_delay_2_io_out_0 | sx_entryWriteEnVec1_0_1 &
    sx_writeData_delay_3_io_out_0; // @[Mux.scala 27:73]
  wire  sx_entryWriteData1_0_1 = sx_entryWriteEnVec1_0_0 & sx_writeData_delay_2_io_out_1 | sx_entryWriteEnVec1_0_1 &
    sx_writeData_delay_3_io_out_1; // @[Mux.scala 27:73]
  wire  sx_entryWriteData1_0_2 = sx_entryWriteEnVec1_0_0 & sx_writeData_delay_2_io_out_2 | sx_entryWriteEnVec1_0_1 &
    sx_writeData_delay_3_io_out_2; // @[Mux.scala 27:73]
  wire  sx_entryWriteEnVec1_1_0 = sx_bankWriteEn_delay_2_io_out & sx_bankWriteAddrDec_delay_2_io_out[1]; // @[LoadQueueData.scala 96:86]
  wire  sx_entryWriteEnVec1_1_1 = sx_bankWriteEn_delay_3_io_out & sx_bankWriteAddrDec_delay_3_io_out[1]; // @[LoadQueueData.scala 96:86]
  wire [1:0] _sx_entryWriteEn_T_5 = {sx_entryWriteEnVec1_1_1,sx_entryWriteEnVec1_1_0}; // @[LoadQueueData.scala 97:57]
  wire  sx_entryWriteEn1_1 = |_sx_entryWriteEn_T_5; // @[LoadQueueData.scala 97:64]
  wire  sx_entryWriteData1_1_0 = sx_entryWriteEnVec1_1_0 & sx_writeData_delay_2_io_out_0 | sx_entryWriteEnVec1_1_1 &
    sx_writeData_delay_3_io_out_0; // @[Mux.scala 27:73]
  wire  sx_entryWriteData1_1_1 = sx_entryWriteEnVec1_1_0 & sx_writeData_delay_2_io_out_1 | sx_entryWriteEnVec1_1_1 &
    sx_writeData_delay_3_io_out_1; // @[Mux.scala 27:73]
  wire  sx_entryWriteData1_1_2 = sx_entryWriteEnVec1_1_0 & sx_writeData_delay_2_io_out_2 | sx_entryWriteEnVec1_1_1 &
    sx_writeData_delay_3_io_out_2; // @[Mux.scala 27:73]
  wire  sx_entryWriteEnVec1_2_0 = sx_bankWriteEn_delay_2_io_out & sx_bankWriteAddrDec_delay_2_io_out[2]; // @[LoadQueueData.scala 96:86]
  wire  sx_entryWriteEnVec1_2_1 = sx_bankWriteEn_delay_3_io_out & sx_bankWriteAddrDec_delay_3_io_out[2]; // @[LoadQueueData.scala 96:86]
  wire [1:0] _sx_entryWriteEn_T_6 = {sx_entryWriteEnVec1_2_1,sx_entryWriteEnVec1_2_0}; // @[LoadQueueData.scala 97:57]
  wire  sx_entryWriteEn1_2 = |_sx_entryWriteEn_T_6; // @[LoadQueueData.scala 97:64]
  wire  sx_entryWriteData1_2_0 = sx_entryWriteEnVec1_2_0 & sx_writeData_delay_2_io_out_0 | sx_entryWriteEnVec1_2_1 &
    sx_writeData_delay_3_io_out_0; // @[Mux.scala 27:73]
  wire  sx_entryWriteData1_2_1 = sx_entryWriteEnVec1_2_0 & sx_writeData_delay_2_io_out_1 | sx_entryWriteEnVec1_2_1 &
    sx_writeData_delay_3_io_out_1; // @[Mux.scala 27:73]
  wire  sx_entryWriteData1_2_2 = sx_entryWriteEnVec1_2_0 & sx_writeData_delay_2_io_out_2 | sx_entryWriteEnVec1_2_1 &
    sx_writeData_delay_3_io_out_2; // @[Mux.scala 27:73]
  wire  sx_entryWriteEnVec1_3_0 = sx_bankWriteEn_delay_2_io_out & sx_bankWriteAddrDec_delay_2_io_out[3]; // @[LoadQueueData.scala 96:86]
  wire  sx_entryWriteEnVec1_3_1 = sx_bankWriteEn_delay_3_io_out & sx_bankWriteAddrDec_delay_3_io_out[3]; // @[LoadQueueData.scala 96:86]
  wire [1:0] _sx_entryWriteEn_T_7 = {sx_entryWriteEnVec1_3_1,sx_entryWriteEnVec1_3_0}; // @[LoadQueueData.scala 97:57]
  wire  sx_entryWriteEn1_3 = |_sx_entryWriteEn_T_7; // @[LoadQueueData.scala 97:64]
  wire  sx_entryWriteData1_3_0 = sx_entryWriteEnVec1_3_0 & sx_writeData_delay_2_io_out_0 | sx_entryWriteEnVec1_3_1 &
    sx_writeData_delay_3_io_out_0; // @[Mux.scala 27:73]
  wire  sx_entryWriteData1_3_1 = sx_entryWriteEnVec1_3_0 & sx_writeData_delay_2_io_out_1 | sx_entryWriteEnVec1_3_1 &
    sx_writeData_delay_3_io_out_1; // @[Mux.scala 27:73]
  wire  sx_entryWriteData1_3_2 = sx_entryWriteEnVec1_3_0 & sx_writeData_delay_2_io_out_2 | sx_entryWriteEnVec1_3_1 &
    sx_writeData_delay_3_io_out_2; // @[Mux.scala 27:73]
  wire [3:0] s0_bankWriteAddrDec2_0 = writeAddrDec_0[11:8]; // @[LoadQueueData.scala 66:7]
  wire [3:0] s0_bankWriteAddrDec2_1 = writeAddrDec_1[11:8]; // @[LoadQueueData.scala 66:7]
  wire  sx_entryWriteEnVec2_0_0 = sx_bankWriteEn_delay_4_io_out & sx_bankWriteAddrDec_delay_4_io_out[0]; // @[LoadQueueData.scala 96:86]
  wire  sx_entryWriteEnVec2_0_1 = sx_bankWriteEn_delay_5_io_out & sx_bankWriteAddrDec_delay_5_io_out[0]; // @[LoadQueueData.scala 96:86]
  wire [1:0] _sx_entryWriteEn_T_8 = {sx_entryWriteEnVec2_0_1,sx_entryWriteEnVec2_0_0}; // @[LoadQueueData.scala 97:57]
  wire  sx_entryWriteEn2_0 = |_sx_entryWriteEn_T_8; // @[LoadQueueData.scala 97:64]
  wire  sx_entryWriteData2_0_0 = sx_entryWriteEnVec2_0_0 & sx_writeData_delay_4_io_out_0 | sx_entryWriteEnVec2_0_1 &
    sx_writeData_delay_5_io_out_0; // @[Mux.scala 27:73]
  wire  sx_entryWriteData2_0_1 = sx_entryWriteEnVec2_0_0 & sx_writeData_delay_4_io_out_1 | sx_entryWriteEnVec2_0_1 &
    sx_writeData_delay_5_io_out_1; // @[Mux.scala 27:73]
  wire  sx_entryWriteData2_0_2 = sx_entryWriteEnVec2_0_0 & sx_writeData_delay_4_io_out_2 | sx_entryWriteEnVec2_0_1 &
    sx_writeData_delay_5_io_out_2; // @[Mux.scala 27:73]
  wire  sx_entryWriteEnVec2_1_0 = sx_bankWriteEn_delay_4_io_out & sx_bankWriteAddrDec_delay_4_io_out[1]; // @[LoadQueueData.scala 96:86]
  wire  sx_entryWriteEnVec2_1_1 = sx_bankWriteEn_delay_5_io_out & sx_bankWriteAddrDec_delay_5_io_out[1]; // @[LoadQueueData.scala 96:86]
  wire [1:0] _sx_entryWriteEn_T_9 = {sx_entryWriteEnVec2_1_1,sx_entryWriteEnVec2_1_0}; // @[LoadQueueData.scala 97:57]
  wire  sx_entryWriteEn2_1 = |_sx_entryWriteEn_T_9; // @[LoadQueueData.scala 97:64]
  wire  sx_entryWriteData2_1_0 = sx_entryWriteEnVec2_1_0 & sx_writeData_delay_4_io_out_0 | sx_entryWriteEnVec2_1_1 &
    sx_writeData_delay_5_io_out_0; // @[Mux.scala 27:73]
  wire  sx_entryWriteData2_1_1 = sx_entryWriteEnVec2_1_0 & sx_writeData_delay_4_io_out_1 | sx_entryWriteEnVec2_1_1 &
    sx_writeData_delay_5_io_out_1; // @[Mux.scala 27:73]
  wire  sx_entryWriteData2_1_2 = sx_entryWriteEnVec2_1_0 & sx_writeData_delay_4_io_out_2 | sx_entryWriteEnVec2_1_1 &
    sx_writeData_delay_5_io_out_2; // @[Mux.scala 27:73]
  wire  sx_entryWriteEnVec2_2_0 = sx_bankWriteEn_delay_4_io_out & sx_bankWriteAddrDec_delay_4_io_out[2]; // @[LoadQueueData.scala 96:86]
  wire  sx_entryWriteEnVec2_2_1 = sx_bankWriteEn_delay_5_io_out & sx_bankWriteAddrDec_delay_5_io_out[2]; // @[LoadQueueData.scala 96:86]
  wire [1:0] _sx_entryWriteEn_T_10 = {sx_entryWriteEnVec2_2_1,sx_entryWriteEnVec2_2_0}; // @[LoadQueueData.scala 97:57]
  wire  sx_entryWriteEn2_2 = |_sx_entryWriteEn_T_10; // @[LoadQueueData.scala 97:64]
  wire  sx_entryWriteData2_2_0 = sx_entryWriteEnVec2_2_0 & sx_writeData_delay_4_io_out_0 | sx_entryWriteEnVec2_2_1 &
    sx_writeData_delay_5_io_out_0; // @[Mux.scala 27:73]
  wire  sx_entryWriteData2_2_1 = sx_entryWriteEnVec2_2_0 & sx_writeData_delay_4_io_out_1 | sx_entryWriteEnVec2_2_1 &
    sx_writeData_delay_5_io_out_1; // @[Mux.scala 27:73]
  wire  sx_entryWriteData2_2_2 = sx_entryWriteEnVec2_2_0 & sx_writeData_delay_4_io_out_2 | sx_entryWriteEnVec2_2_1 &
    sx_writeData_delay_5_io_out_2; // @[Mux.scala 27:73]
  wire  sx_entryWriteEnVec2_3_0 = sx_bankWriteEn_delay_4_io_out & sx_bankWriteAddrDec_delay_4_io_out[3]; // @[LoadQueueData.scala 96:86]
  wire  sx_entryWriteEnVec2_3_1 = sx_bankWriteEn_delay_5_io_out & sx_bankWriteAddrDec_delay_5_io_out[3]; // @[LoadQueueData.scala 96:86]
  wire [1:0] _sx_entryWriteEn_T_11 = {sx_entryWriteEnVec2_3_1,sx_entryWriteEnVec2_3_0}; // @[LoadQueueData.scala 97:57]
  wire  sx_entryWriteEn2_3 = |_sx_entryWriteEn_T_11; // @[LoadQueueData.scala 97:64]
  wire  sx_entryWriteData2_3_0 = sx_entryWriteEnVec2_3_0 & sx_writeData_delay_4_io_out_0 | sx_entryWriteEnVec2_3_1 &
    sx_writeData_delay_5_io_out_0; // @[Mux.scala 27:73]
  wire  sx_entryWriteData2_3_1 = sx_entryWriteEnVec2_3_0 & sx_writeData_delay_4_io_out_1 | sx_entryWriteEnVec2_3_1 &
    sx_writeData_delay_5_io_out_1; // @[Mux.scala 27:73]
  wire  sx_entryWriteData2_3_2 = sx_entryWriteEnVec2_3_0 & sx_writeData_delay_4_io_out_2 | sx_entryWriteEnVec2_3_1 &
    sx_writeData_delay_5_io_out_2; // @[Mux.scala 27:73]
  wire [3:0] s0_bankWriteAddrDec3_0 = writeAddrDec_0[15:12]; // @[LoadQueueData.scala 66:7]
  wire [3:0] s0_bankWriteAddrDec3_1 = writeAddrDec_1[15:12]; // @[LoadQueueData.scala 66:7]
  wire  sx_entryWriteEnVec3_0_0 = sx_bankWriteEn_delay_6_io_out & sx_bankWriteAddrDec_delay_6_io_out[0]; // @[LoadQueueData.scala 96:86]
  wire  sx_entryWriteEnVec3_0_1 = sx_bankWriteEn_delay_7_io_out & sx_bankWriteAddrDec_delay_7_io_out[0]; // @[LoadQueueData.scala 96:86]
  wire [1:0] _sx_entryWriteEn_T_12 = {sx_entryWriteEnVec3_0_1,sx_entryWriteEnVec3_0_0}; // @[LoadQueueData.scala 97:57]
  wire  sx_entryWriteEn3_0 = |_sx_entryWriteEn_T_12; // @[LoadQueueData.scala 97:64]
  wire  sx_entryWriteData3_0_0 = sx_entryWriteEnVec3_0_0 & sx_writeData_delay_6_io_out_0 | sx_entryWriteEnVec3_0_1 &
    sx_writeData_delay_7_io_out_0; // @[Mux.scala 27:73]
  wire  sx_entryWriteData3_0_1 = sx_entryWriteEnVec3_0_0 & sx_writeData_delay_6_io_out_1 | sx_entryWriteEnVec3_0_1 &
    sx_writeData_delay_7_io_out_1; // @[Mux.scala 27:73]
  wire  sx_entryWriteData3_0_2 = sx_entryWriteEnVec3_0_0 & sx_writeData_delay_6_io_out_2 | sx_entryWriteEnVec3_0_1 &
    sx_writeData_delay_7_io_out_2; // @[Mux.scala 27:73]
  wire  sx_entryWriteEnVec3_1_0 = sx_bankWriteEn_delay_6_io_out & sx_bankWriteAddrDec_delay_6_io_out[1]; // @[LoadQueueData.scala 96:86]
  wire  sx_entryWriteEnVec3_1_1 = sx_bankWriteEn_delay_7_io_out & sx_bankWriteAddrDec_delay_7_io_out[1]; // @[LoadQueueData.scala 96:86]
  wire [1:0] _sx_entryWriteEn_T_13 = {sx_entryWriteEnVec3_1_1,sx_entryWriteEnVec3_1_0}; // @[LoadQueueData.scala 97:57]
  wire  sx_entryWriteEn3_1 = |_sx_entryWriteEn_T_13; // @[LoadQueueData.scala 97:64]
  wire  sx_entryWriteData3_1_0 = sx_entryWriteEnVec3_1_0 & sx_writeData_delay_6_io_out_0 | sx_entryWriteEnVec3_1_1 &
    sx_writeData_delay_7_io_out_0; // @[Mux.scala 27:73]
  wire  sx_entryWriteData3_1_1 = sx_entryWriteEnVec3_1_0 & sx_writeData_delay_6_io_out_1 | sx_entryWriteEnVec3_1_1 &
    sx_writeData_delay_7_io_out_1; // @[Mux.scala 27:73]
  wire  sx_entryWriteData3_1_2 = sx_entryWriteEnVec3_1_0 & sx_writeData_delay_6_io_out_2 | sx_entryWriteEnVec3_1_1 &
    sx_writeData_delay_7_io_out_2; // @[Mux.scala 27:73]
  wire  sx_entryWriteEnVec3_2_0 = sx_bankWriteEn_delay_6_io_out & sx_bankWriteAddrDec_delay_6_io_out[2]; // @[LoadQueueData.scala 96:86]
  wire  sx_entryWriteEnVec3_2_1 = sx_bankWriteEn_delay_7_io_out & sx_bankWriteAddrDec_delay_7_io_out[2]; // @[LoadQueueData.scala 96:86]
  wire [1:0] _sx_entryWriteEn_T_14 = {sx_entryWriteEnVec3_2_1,sx_entryWriteEnVec3_2_0}; // @[LoadQueueData.scala 97:57]
  wire  sx_entryWriteEn3_2 = |_sx_entryWriteEn_T_14; // @[LoadQueueData.scala 97:64]
  wire  sx_entryWriteData3_2_0 = sx_entryWriteEnVec3_2_0 & sx_writeData_delay_6_io_out_0 | sx_entryWriteEnVec3_2_1 &
    sx_writeData_delay_7_io_out_0; // @[Mux.scala 27:73]
  wire  sx_entryWriteData3_2_1 = sx_entryWriteEnVec3_2_0 & sx_writeData_delay_6_io_out_1 | sx_entryWriteEnVec3_2_1 &
    sx_writeData_delay_7_io_out_1; // @[Mux.scala 27:73]
  wire  sx_entryWriteData3_2_2 = sx_entryWriteEnVec3_2_0 & sx_writeData_delay_6_io_out_2 | sx_entryWriteEnVec3_2_1 &
    sx_writeData_delay_7_io_out_2; // @[Mux.scala 27:73]
  wire  sx_entryWriteEnVec3_3_0 = sx_bankWriteEn_delay_6_io_out & sx_bankWriteAddrDec_delay_6_io_out[3]; // @[LoadQueueData.scala 96:86]
  wire  sx_entryWriteEnVec3_3_1 = sx_bankWriteEn_delay_7_io_out & sx_bankWriteAddrDec_delay_7_io_out[3]; // @[LoadQueueData.scala 96:86]
  wire [1:0] _sx_entryWriteEn_T_15 = {sx_entryWriteEnVec3_3_1,sx_entryWriteEnVec3_3_0}; // @[LoadQueueData.scala 97:57]
  wire  sx_entryWriteEn3_3 = |_sx_entryWriteEn_T_15; // @[LoadQueueData.scala 97:64]
  wire  sx_entryWriteData3_3_0 = sx_entryWriteEnVec3_3_0 & sx_writeData_delay_6_io_out_0 | sx_entryWriteEnVec3_3_1 &
    sx_writeData_delay_7_io_out_0; // @[Mux.scala 27:73]
  wire  sx_entryWriteData3_3_1 = sx_entryWriteEnVec3_3_0 & sx_writeData_delay_6_io_out_1 | sx_entryWriteEnVec3_3_1 &
    sx_writeData_delay_7_io_out_1; // @[Mux.scala 27:73]
  wire  sx_entryWriteData3_3_2 = sx_entryWriteEnVec3_3_0 & sx_writeData_delay_6_io_out_2 | sx_entryWriteEnVec3_3_1 &
    sx_writeData_delay_7_io_out_2; // @[Mux.scala 27:73]
  DelayN_138 sx_bankWriteAddrDec_delay ( // @[Hold.scala 97:23]
    .clock(sx_bankWriteAddrDec_delay_clock),
    .io_in(sx_bankWriteAddrDec_delay_io_in),
    .io_out(sx_bankWriteAddrDec_delay_io_out)
  );
  DelayN_138 sx_bankWriteAddrDec_delay_1 ( // @[Hold.scala 97:23]
    .clock(sx_bankWriteAddrDec_delay_1_clock),
    .io_in(sx_bankWriteAddrDec_delay_1_io_in),
    .io_out(sx_bankWriteAddrDec_delay_1_io_out)
  );
  DelayN_140 sx_bankWriteEn_delay ( // @[Hold.scala 97:23]
    .clock(sx_bankWriteEn_delay_clock),
    .io_in(sx_bankWriteEn_delay_io_in),
    .io_out(sx_bankWriteEn_delay_io_out)
  );
  DelayN_140 sx_bankWriteEn_delay_1 ( // @[Hold.scala 97:23]
    .clock(sx_bankWriteEn_delay_1_clock),
    .io_in(sx_bankWriteEn_delay_1_io_in),
    .io_out(sx_bankWriteEn_delay_1_io_out)
  );
  DelayN_214 sx_writeData_delay ( // @[Hold.scala 97:23]
    .clock(sx_writeData_delay_clock),
    .io_in_0(sx_writeData_delay_io_in_0),
    .io_in_1(sx_writeData_delay_io_in_1),
    .io_in_2(sx_writeData_delay_io_in_2),
    .io_out_0(sx_writeData_delay_io_out_0),
    .io_out_1(sx_writeData_delay_io_out_1),
    .io_out_2(sx_writeData_delay_io_out_2)
  );
  DelayN_214 sx_writeData_delay_1 ( // @[Hold.scala 97:23]
    .clock(sx_writeData_delay_1_clock),
    .io_in_0(sx_writeData_delay_1_io_in_0),
    .io_in_1(sx_writeData_delay_1_io_in_1),
    .io_in_2(sx_writeData_delay_1_io_in_2),
    .io_out_0(sx_writeData_delay_1_io_out_0),
    .io_out_1(sx_writeData_delay_1_io_out_1),
    .io_out_2(sx_writeData_delay_1_io_out_2)
  );
  DelayN_138 sx_bankWriteAddrDec_delay_2 ( // @[Hold.scala 97:23]
    .clock(sx_bankWriteAddrDec_delay_2_clock),
    .io_in(sx_bankWriteAddrDec_delay_2_io_in),
    .io_out(sx_bankWriteAddrDec_delay_2_io_out)
  );
  DelayN_138 sx_bankWriteAddrDec_delay_3 ( // @[Hold.scala 97:23]
    .clock(sx_bankWriteAddrDec_delay_3_clock),
    .io_in(sx_bankWriteAddrDec_delay_3_io_in),
    .io_out(sx_bankWriteAddrDec_delay_3_io_out)
  );
  DelayN_140 sx_bankWriteEn_delay_2 ( // @[Hold.scala 97:23]
    .clock(sx_bankWriteEn_delay_2_clock),
    .io_in(sx_bankWriteEn_delay_2_io_in),
    .io_out(sx_bankWriteEn_delay_2_io_out)
  );
  DelayN_140 sx_bankWriteEn_delay_3 ( // @[Hold.scala 97:23]
    .clock(sx_bankWriteEn_delay_3_clock),
    .io_in(sx_bankWriteEn_delay_3_io_in),
    .io_out(sx_bankWriteEn_delay_3_io_out)
  );
  DelayN_214 sx_writeData_delay_2 ( // @[Hold.scala 97:23]
    .clock(sx_writeData_delay_2_clock),
    .io_in_0(sx_writeData_delay_2_io_in_0),
    .io_in_1(sx_writeData_delay_2_io_in_1),
    .io_in_2(sx_writeData_delay_2_io_in_2),
    .io_out_0(sx_writeData_delay_2_io_out_0),
    .io_out_1(sx_writeData_delay_2_io_out_1),
    .io_out_2(sx_writeData_delay_2_io_out_2)
  );
  DelayN_214 sx_writeData_delay_3 ( // @[Hold.scala 97:23]
    .clock(sx_writeData_delay_3_clock),
    .io_in_0(sx_writeData_delay_3_io_in_0),
    .io_in_1(sx_writeData_delay_3_io_in_1),
    .io_in_2(sx_writeData_delay_3_io_in_2),
    .io_out_0(sx_writeData_delay_3_io_out_0),
    .io_out_1(sx_writeData_delay_3_io_out_1),
    .io_out_2(sx_writeData_delay_3_io_out_2)
  );
  DelayN_138 sx_bankWriteAddrDec_delay_4 ( // @[Hold.scala 97:23]
    .clock(sx_bankWriteAddrDec_delay_4_clock),
    .io_in(sx_bankWriteAddrDec_delay_4_io_in),
    .io_out(sx_bankWriteAddrDec_delay_4_io_out)
  );
  DelayN_138 sx_bankWriteAddrDec_delay_5 ( // @[Hold.scala 97:23]
    .clock(sx_bankWriteAddrDec_delay_5_clock),
    .io_in(sx_bankWriteAddrDec_delay_5_io_in),
    .io_out(sx_bankWriteAddrDec_delay_5_io_out)
  );
  DelayN_140 sx_bankWriteEn_delay_4 ( // @[Hold.scala 97:23]
    .clock(sx_bankWriteEn_delay_4_clock),
    .io_in(sx_bankWriteEn_delay_4_io_in),
    .io_out(sx_bankWriteEn_delay_4_io_out)
  );
  DelayN_140 sx_bankWriteEn_delay_5 ( // @[Hold.scala 97:23]
    .clock(sx_bankWriteEn_delay_5_clock),
    .io_in(sx_bankWriteEn_delay_5_io_in),
    .io_out(sx_bankWriteEn_delay_5_io_out)
  );
  DelayN_214 sx_writeData_delay_4 ( // @[Hold.scala 97:23]
    .clock(sx_writeData_delay_4_clock),
    .io_in_0(sx_writeData_delay_4_io_in_0),
    .io_in_1(sx_writeData_delay_4_io_in_1),
    .io_in_2(sx_writeData_delay_4_io_in_2),
    .io_out_0(sx_writeData_delay_4_io_out_0),
    .io_out_1(sx_writeData_delay_4_io_out_1),
    .io_out_2(sx_writeData_delay_4_io_out_2)
  );
  DelayN_214 sx_writeData_delay_5 ( // @[Hold.scala 97:23]
    .clock(sx_writeData_delay_5_clock),
    .io_in_0(sx_writeData_delay_5_io_in_0),
    .io_in_1(sx_writeData_delay_5_io_in_1),
    .io_in_2(sx_writeData_delay_5_io_in_2),
    .io_out_0(sx_writeData_delay_5_io_out_0),
    .io_out_1(sx_writeData_delay_5_io_out_1),
    .io_out_2(sx_writeData_delay_5_io_out_2)
  );
  DelayN_138 sx_bankWriteAddrDec_delay_6 ( // @[Hold.scala 97:23]
    .clock(sx_bankWriteAddrDec_delay_6_clock),
    .io_in(sx_bankWriteAddrDec_delay_6_io_in),
    .io_out(sx_bankWriteAddrDec_delay_6_io_out)
  );
  DelayN_138 sx_bankWriteAddrDec_delay_7 ( // @[Hold.scala 97:23]
    .clock(sx_bankWriteAddrDec_delay_7_clock),
    .io_in(sx_bankWriteAddrDec_delay_7_io_in),
    .io_out(sx_bankWriteAddrDec_delay_7_io_out)
  );
  DelayN_140 sx_bankWriteEn_delay_6 ( // @[Hold.scala 97:23]
    .clock(sx_bankWriteEn_delay_6_clock),
    .io_in(sx_bankWriteEn_delay_6_io_in),
    .io_out(sx_bankWriteEn_delay_6_io_out)
  );
  DelayN_140 sx_bankWriteEn_delay_7 ( // @[Hold.scala 97:23]
    .clock(sx_bankWriteEn_delay_7_clock),
    .io_in(sx_bankWriteEn_delay_7_io_in),
    .io_out(sx_bankWriteEn_delay_7_io_out)
  );
  DelayN_214 sx_writeData_delay_6 ( // @[Hold.scala 97:23]
    .clock(sx_writeData_delay_6_clock),
    .io_in_0(sx_writeData_delay_6_io_in_0),
    .io_in_1(sx_writeData_delay_6_io_in_1),
    .io_in_2(sx_writeData_delay_6_io_in_2),
    .io_out_0(sx_writeData_delay_6_io_out_0),
    .io_out_1(sx_writeData_delay_6_io_out_1),
    .io_out_2(sx_writeData_delay_6_io_out_2)
  );
  DelayN_214 sx_writeData_delay_7 ( // @[Hold.scala 97:23]
    .clock(sx_writeData_delay_7_clock),
    .io_in_0(sx_writeData_delay_7_io_in_0),
    .io_in_1(sx_writeData_delay_7_io_in_1),
    .io_in_2(sx_writeData_delay_7_io_in_2),
    .io_out_0(sx_writeData_delay_7_io_out_0),
    .io_out_1(sx_writeData_delay_7_io_out_1),
    .io_out_2(sx_writeData_delay_7_io_out_2)
  );
  assign io_rdata_0_0 = 4'hf == io_rdata_0_REG ? data_15_0 : _GEN_14; // @[LoadQueueData.scala 60:{17,17}]
  assign io_rdata_0_1 = 4'hf == io_rdata_0_REG ? data_15_1 : _GEN_30; // @[LoadQueueData.scala 60:{17,17}]
  assign io_rdata_0_2 = 4'hf == io_rdata_0_REG ? data_15_2 : _GEN_46; // @[LoadQueueData.scala 60:{17,17}]
  assign sx_bankWriteAddrDec_delay_clock = clock;
  assign sx_bankWriteAddrDec_delay_io_in = writeAddrDec_0[3:0]; // @[LoadQueueData.scala 66:7]
  assign sx_bankWriteAddrDec_delay_1_clock = clock;
  assign sx_bankWriteAddrDec_delay_1_io_in = writeAddrDec_1[3:0]; // @[LoadQueueData.scala 66:7]
  assign sx_bankWriteEn_delay_clock = clock;
  assign sx_bankWriteEn_delay_io_in = io_wen_0 & |s0_bankWriteAddrDec0_0; // @[LoadQueueData.scala 72:72]
  assign sx_bankWriteEn_delay_1_clock = clock;
  assign sx_bankWriteEn_delay_1_io_in = io_wen_1 & |s0_bankWriteAddrDec0_1; // @[LoadQueueData.scala 72:72]
  assign sx_writeData_delay_clock = clock;
  assign sx_writeData_delay_io_in_0 = io_wdata_0_0; // @[Hold.scala 98:17]
  assign sx_writeData_delay_io_in_1 = io_wdata_0_1; // @[Hold.scala 98:17]
  assign sx_writeData_delay_io_in_2 = io_wdata_0_2; // @[Hold.scala 98:17]
  assign sx_writeData_delay_1_clock = clock;
  assign sx_writeData_delay_1_io_in_0 = io_wdata_1_0; // @[Hold.scala 98:17]
  assign sx_writeData_delay_1_io_in_1 = io_wdata_1_1; // @[Hold.scala 98:17]
  assign sx_writeData_delay_1_io_in_2 = io_wdata_1_2; // @[Hold.scala 98:17]
  assign sx_bankWriteAddrDec_delay_2_clock = clock;
  assign sx_bankWriteAddrDec_delay_2_io_in = writeAddrDec_0[7:4]; // @[LoadQueueData.scala 66:7]
  assign sx_bankWriteAddrDec_delay_3_clock = clock;
  assign sx_bankWriteAddrDec_delay_3_io_in = writeAddrDec_1[7:4]; // @[LoadQueueData.scala 66:7]
  assign sx_bankWriteEn_delay_2_clock = clock;
  assign sx_bankWriteEn_delay_2_io_in = io_wen_0 & |s0_bankWriteAddrDec1_0; // @[LoadQueueData.scala 72:72]
  assign sx_bankWriteEn_delay_3_clock = clock;
  assign sx_bankWriteEn_delay_3_io_in = io_wen_1 & |s0_bankWriteAddrDec1_1; // @[LoadQueueData.scala 72:72]
  assign sx_writeData_delay_2_clock = clock;
  assign sx_writeData_delay_2_io_in_0 = io_wdata_0_0; // @[Hold.scala 98:17]
  assign sx_writeData_delay_2_io_in_1 = io_wdata_0_1; // @[Hold.scala 98:17]
  assign sx_writeData_delay_2_io_in_2 = io_wdata_0_2; // @[Hold.scala 98:17]
  assign sx_writeData_delay_3_clock = clock;
  assign sx_writeData_delay_3_io_in_0 = io_wdata_1_0; // @[Hold.scala 98:17]
  assign sx_writeData_delay_3_io_in_1 = io_wdata_1_1; // @[Hold.scala 98:17]
  assign sx_writeData_delay_3_io_in_2 = io_wdata_1_2; // @[Hold.scala 98:17]
  assign sx_bankWriteAddrDec_delay_4_clock = clock;
  assign sx_bankWriteAddrDec_delay_4_io_in = writeAddrDec_0[11:8]; // @[LoadQueueData.scala 66:7]
  assign sx_bankWriteAddrDec_delay_5_clock = clock;
  assign sx_bankWriteAddrDec_delay_5_io_in = writeAddrDec_1[11:8]; // @[LoadQueueData.scala 66:7]
  assign sx_bankWriteEn_delay_4_clock = clock;
  assign sx_bankWriteEn_delay_4_io_in = io_wen_0 & |s0_bankWriteAddrDec2_0; // @[LoadQueueData.scala 72:72]
  assign sx_bankWriteEn_delay_5_clock = clock;
  assign sx_bankWriteEn_delay_5_io_in = io_wen_1 & |s0_bankWriteAddrDec2_1; // @[LoadQueueData.scala 72:72]
  assign sx_writeData_delay_4_clock = clock;
  assign sx_writeData_delay_4_io_in_0 = io_wdata_0_0; // @[Hold.scala 98:17]
  assign sx_writeData_delay_4_io_in_1 = io_wdata_0_1; // @[Hold.scala 98:17]
  assign sx_writeData_delay_4_io_in_2 = io_wdata_0_2; // @[Hold.scala 98:17]
  assign sx_writeData_delay_5_clock = clock;
  assign sx_writeData_delay_5_io_in_0 = io_wdata_1_0; // @[Hold.scala 98:17]
  assign sx_writeData_delay_5_io_in_1 = io_wdata_1_1; // @[Hold.scala 98:17]
  assign sx_writeData_delay_5_io_in_2 = io_wdata_1_2; // @[Hold.scala 98:17]
  assign sx_bankWriteAddrDec_delay_6_clock = clock;
  assign sx_bankWriteAddrDec_delay_6_io_in = writeAddrDec_0[15:12]; // @[LoadQueueData.scala 66:7]
  assign sx_bankWriteAddrDec_delay_7_clock = clock;
  assign sx_bankWriteAddrDec_delay_7_io_in = writeAddrDec_1[15:12]; // @[LoadQueueData.scala 66:7]
  assign sx_bankWriteEn_delay_6_clock = clock;
  assign sx_bankWriteEn_delay_6_io_in = io_wen_0 & |s0_bankWriteAddrDec3_0; // @[LoadQueueData.scala 72:72]
  assign sx_bankWriteEn_delay_7_clock = clock;
  assign sx_bankWriteEn_delay_7_io_in = io_wen_1 & |s0_bankWriteAddrDec3_1; // @[LoadQueueData.scala 72:72]
  assign sx_writeData_delay_6_clock = clock;
  assign sx_writeData_delay_6_io_in_0 = io_wdata_0_0; // @[Hold.scala 98:17]
  assign sx_writeData_delay_6_io_in_1 = io_wdata_0_1; // @[Hold.scala 98:17]
  assign sx_writeData_delay_6_io_in_2 = io_wdata_0_2; // @[Hold.scala 98:17]
  assign sx_writeData_delay_7_clock = clock;
  assign sx_writeData_delay_7_io_in_0 = io_wdata_1_0; // @[Hold.scala 98:17]
  assign sx_writeData_delay_7_io_in_1 = io_wdata_1_1; // @[Hold.scala 98:17]
  assign sx_writeData_delay_7_io_in_2 = io_wdata_1_2; // @[Hold.scala 98:17]
  always @(posedge clock) begin
    if (sx_entryWriteEn0_0) begin // @[LoadQueueData.scala 99:30]
      data_0_0 <= sx_entryWriteData0_0_0; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn0_0) begin // @[LoadQueueData.scala 99:30]
      data_0_1 <= sx_entryWriteData0_0_1; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn0_0) begin // @[LoadQueueData.scala 99:30]
      data_0_2 <= sx_entryWriteData0_0_2; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn0_1) begin // @[LoadQueueData.scala 99:30]
      data_1_0 <= sx_entryWriteData0_1_0; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn0_1) begin // @[LoadQueueData.scala 99:30]
      data_1_1 <= sx_entryWriteData0_1_1; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn0_1) begin // @[LoadQueueData.scala 99:30]
      data_1_2 <= sx_entryWriteData0_1_2; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn0_2) begin // @[LoadQueueData.scala 99:30]
      data_2_0 <= sx_entryWriteData0_2_0; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn0_2) begin // @[LoadQueueData.scala 99:30]
      data_2_1 <= sx_entryWriteData0_2_1; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn0_2) begin // @[LoadQueueData.scala 99:30]
      data_2_2 <= sx_entryWriteData0_2_2; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn0_3) begin // @[LoadQueueData.scala 99:30]
      data_3_0 <= sx_entryWriteData0_3_0; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn0_3) begin // @[LoadQueueData.scala 99:30]
      data_3_1 <= sx_entryWriteData0_3_1; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn0_3) begin // @[LoadQueueData.scala 99:30]
      data_3_2 <= sx_entryWriteData0_3_2; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn1_0) begin // @[LoadQueueData.scala 99:30]
      data_4_0 <= sx_entryWriteData1_0_0; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn1_0) begin // @[LoadQueueData.scala 99:30]
      data_4_1 <= sx_entryWriteData1_0_1; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn1_0) begin // @[LoadQueueData.scala 99:30]
      data_4_2 <= sx_entryWriteData1_0_2; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn1_1) begin // @[LoadQueueData.scala 99:30]
      data_5_0 <= sx_entryWriteData1_1_0; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn1_1) begin // @[LoadQueueData.scala 99:30]
      data_5_1 <= sx_entryWriteData1_1_1; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn1_1) begin // @[LoadQueueData.scala 99:30]
      data_5_2 <= sx_entryWriteData1_1_2; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn1_2) begin // @[LoadQueueData.scala 99:30]
      data_6_0 <= sx_entryWriteData1_2_0; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn1_2) begin // @[LoadQueueData.scala 99:30]
      data_6_1 <= sx_entryWriteData1_2_1; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn1_2) begin // @[LoadQueueData.scala 99:30]
      data_6_2 <= sx_entryWriteData1_2_2; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn1_3) begin // @[LoadQueueData.scala 99:30]
      data_7_0 <= sx_entryWriteData1_3_0; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn1_3) begin // @[LoadQueueData.scala 99:30]
      data_7_1 <= sx_entryWriteData1_3_1; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn1_3) begin // @[LoadQueueData.scala 99:30]
      data_7_2 <= sx_entryWriteData1_3_2; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn2_0) begin // @[LoadQueueData.scala 99:30]
      data_8_0 <= sx_entryWriteData2_0_0; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn2_0) begin // @[LoadQueueData.scala 99:30]
      data_8_1 <= sx_entryWriteData2_0_1; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn2_0) begin // @[LoadQueueData.scala 99:30]
      data_8_2 <= sx_entryWriteData2_0_2; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn2_1) begin // @[LoadQueueData.scala 99:30]
      data_9_0 <= sx_entryWriteData2_1_0; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn2_1) begin // @[LoadQueueData.scala 99:30]
      data_9_1 <= sx_entryWriteData2_1_1; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn2_1) begin // @[LoadQueueData.scala 99:30]
      data_9_2 <= sx_entryWriteData2_1_2; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn2_2) begin // @[LoadQueueData.scala 99:30]
      data_10_0 <= sx_entryWriteData2_2_0; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn2_2) begin // @[LoadQueueData.scala 99:30]
      data_10_1 <= sx_entryWriteData2_2_1; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn2_2) begin // @[LoadQueueData.scala 99:30]
      data_10_2 <= sx_entryWriteData2_2_2; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn2_3) begin // @[LoadQueueData.scala 99:30]
      data_11_0 <= sx_entryWriteData2_3_0; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn2_3) begin // @[LoadQueueData.scala 99:30]
      data_11_1 <= sx_entryWriteData2_3_1; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn2_3) begin // @[LoadQueueData.scala 99:30]
      data_11_2 <= sx_entryWriteData2_3_2; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn3_0) begin // @[LoadQueueData.scala 99:30]
      data_12_0 <= sx_entryWriteData3_0_0; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn3_0) begin // @[LoadQueueData.scala 99:30]
      data_12_1 <= sx_entryWriteData3_0_1; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn3_0) begin // @[LoadQueueData.scala 99:30]
      data_12_2 <= sx_entryWriteData3_0_2; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn3_1) begin // @[LoadQueueData.scala 99:30]
      data_13_0 <= sx_entryWriteData3_1_0; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn3_1) begin // @[LoadQueueData.scala 99:30]
      data_13_1 <= sx_entryWriteData3_1_1; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn3_1) begin // @[LoadQueueData.scala 99:30]
      data_13_2 <= sx_entryWriteData3_1_2; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn3_2) begin // @[LoadQueueData.scala 99:30]
      data_14_0 <= sx_entryWriteData3_2_0; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn3_2) begin // @[LoadQueueData.scala 99:30]
      data_14_1 <= sx_entryWriteData3_2_1; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn3_2) begin // @[LoadQueueData.scala 99:30]
      data_14_2 <= sx_entryWriteData3_2_2; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn3_3) begin // @[LoadQueueData.scala 99:30]
      data_15_0 <= sx_entryWriteData3_3_0; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn3_3) begin // @[LoadQueueData.scala 99:30]
      data_15_1 <= sx_entryWriteData3_3_1; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn3_3) begin // @[LoadQueueData.scala 99:30]
      data_15_2 <= sx_entryWriteData3_3_2; // @[LoadQueueData.scala 100:46]
    end
    io_rdata_0_REG <= io_raddr_0; // @[LoadQueueData.scala 60:32]
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
  data_0_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  data_0_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  data_0_2 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  data_1_0 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  data_1_1 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  data_1_2 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  data_2_0 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  data_2_1 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  data_2_2 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  data_3_0 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  data_3_1 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  data_3_2 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  data_4_0 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  data_4_1 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  data_4_2 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  data_5_0 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  data_5_1 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  data_5_2 = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  data_6_0 = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  data_6_1 = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  data_6_2 = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  data_7_0 = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  data_7_1 = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  data_7_2 = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  data_8_0 = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  data_8_1 = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  data_8_2 = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  data_9_0 = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  data_9_1 = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  data_9_2 = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  data_10_0 = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  data_10_1 = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  data_10_2 = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  data_11_0 = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  data_11_1 = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  data_11_2 = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  data_12_0 = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  data_12_1 = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  data_12_2 = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  data_13_0 = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  data_13_1 = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  data_13_2 = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  data_14_0 = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  data_14_1 = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  data_14_2 = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  data_15_0 = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  data_15_1 = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  data_15_2 = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  io_rdata_0_REG = _RAND_48[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

