module LqMaskModule_1(
  input        clock,
  input  [3:0] io_raddr_0,
  output [7:0] io_rdata_0,
  input        io_wen_0,
  input        io_wen_1,
  input  [3:0] io_waddr_0,
  input  [3:0] io_waddr_1,
  input  [7:0] io_wdata_0,
  input  [7:0] io_wdata_1
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
  wire [7:0] sx_writeData_delay_io_in; // @[Hold.scala 97:23]
  wire [7:0] sx_writeData_delay_io_out; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_1_clock; // @[Hold.scala 97:23]
  wire [7:0] sx_writeData_delay_1_io_in; // @[Hold.scala 97:23]
  wire [7:0] sx_writeData_delay_1_io_out; // @[Hold.scala 97:23]
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
  wire [7:0] sx_writeData_delay_2_io_in; // @[Hold.scala 97:23]
  wire [7:0] sx_writeData_delay_2_io_out; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_3_clock; // @[Hold.scala 97:23]
  wire [7:0] sx_writeData_delay_3_io_in; // @[Hold.scala 97:23]
  wire [7:0] sx_writeData_delay_3_io_out; // @[Hold.scala 97:23]
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
  wire [7:0] sx_writeData_delay_4_io_in; // @[Hold.scala 97:23]
  wire [7:0] sx_writeData_delay_4_io_out; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_5_clock; // @[Hold.scala 97:23]
  wire [7:0] sx_writeData_delay_5_io_in; // @[Hold.scala 97:23]
  wire [7:0] sx_writeData_delay_5_io_out; // @[Hold.scala 97:23]
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
  wire [7:0] sx_writeData_delay_6_io_in; // @[Hold.scala 97:23]
  wire [7:0] sx_writeData_delay_6_io_out; // @[Hold.scala 97:23]
  wire  sx_writeData_delay_7_clock; // @[Hold.scala 97:23]
  wire [7:0] sx_writeData_delay_7_io_in; // @[Hold.scala 97:23]
  wire [7:0] sx_writeData_delay_7_io_out; // @[Hold.scala 97:23]
  reg [7:0] data_0; // @[LoadQueueData.scala 57:17]
  reg [7:0] data_1; // @[LoadQueueData.scala 57:17]
  reg [7:0] data_2; // @[LoadQueueData.scala 57:17]
  reg [7:0] data_3; // @[LoadQueueData.scala 57:17]
  reg [7:0] data_4; // @[LoadQueueData.scala 57:17]
  reg [7:0] data_5; // @[LoadQueueData.scala 57:17]
  reg [7:0] data_6; // @[LoadQueueData.scala 57:17]
  reg [7:0] data_7; // @[LoadQueueData.scala 57:17]
  reg [7:0] data_8; // @[LoadQueueData.scala 57:17]
  reg [7:0] data_9; // @[LoadQueueData.scala 57:17]
  reg [7:0] data_10; // @[LoadQueueData.scala 57:17]
  reg [7:0] data_11; // @[LoadQueueData.scala 57:17]
  reg [7:0] data_12; // @[LoadQueueData.scala 57:17]
  reg [7:0] data_13; // @[LoadQueueData.scala 57:17]
  reg [7:0] data_14; // @[LoadQueueData.scala 57:17]
  reg [7:0] data_15; // @[LoadQueueData.scala 57:17]
  reg [3:0] io_rdata_0_REG; // @[LoadQueueData.scala 60:32]
  wire [7:0] _GEN_1 = 4'h1 == io_rdata_0_REG ? data_1 : data_0; // @[LoadQueueData.scala 60:{17,17}]
  wire [7:0] _GEN_2 = 4'h2 == io_rdata_0_REG ? data_2 : _GEN_1; // @[LoadQueueData.scala 60:{17,17}]
  wire [7:0] _GEN_3 = 4'h3 == io_rdata_0_REG ? data_3 : _GEN_2; // @[LoadQueueData.scala 60:{17,17}]
  wire [7:0] _GEN_4 = 4'h4 == io_rdata_0_REG ? data_4 : _GEN_3; // @[LoadQueueData.scala 60:{17,17}]
  wire [7:0] _GEN_5 = 4'h5 == io_rdata_0_REG ? data_5 : _GEN_4; // @[LoadQueueData.scala 60:{17,17}]
  wire [7:0] _GEN_6 = 4'h6 == io_rdata_0_REG ? data_6 : _GEN_5; // @[LoadQueueData.scala 60:{17,17}]
  wire [7:0] _GEN_7 = 4'h7 == io_rdata_0_REG ? data_7 : _GEN_6; // @[LoadQueueData.scala 60:{17,17}]
  wire [7:0] _GEN_8 = 4'h8 == io_rdata_0_REG ? data_8 : _GEN_7; // @[LoadQueueData.scala 60:{17,17}]
  wire [7:0] _GEN_9 = 4'h9 == io_rdata_0_REG ? data_9 : _GEN_8; // @[LoadQueueData.scala 60:{17,17}]
  wire [7:0] _GEN_10 = 4'ha == io_rdata_0_REG ? data_10 : _GEN_9; // @[LoadQueueData.scala 60:{17,17}]
  wire [7:0] _GEN_11 = 4'hb == io_rdata_0_REG ? data_11 : _GEN_10; // @[LoadQueueData.scala 60:{17,17}]
  wire [7:0] _GEN_12 = 4'hc == io_rdata_0_REG ? data_12 : _GEN_11; // @[LoadQueueData.scala 60:{17,17}]
  wire [7:0] _GEN_13 = 4'hd == io_rdata_0_REG ? data_13 : _GEN_12; // @[LoadQueueData.scala 60:{17,17}]
  wire [7:0] _GEN_14 = 4'he == io_rdata_0_REG ? data_14 : _GEN_13; // @[LoadQueueData.scala 60:{17,17}]
  wire [15:0] writeAddrDec_0 = 16'h1 << io_waddr_0; // @[OneHot.scala 57:35]
  wire [15:0] writeAddrDec_1 = 16'h1 << io_waddr_1; // @[OneHot.scala 57:35]
  wire [3:0] s0_bankWriteAddrDec0_0 = writeAddrDec_0[3:0]; // @[LoadQueueData.scala 66:7]
  wire [3:0] s0_bankWriteAddrDec0_1 = writeAddrDec_1[3:0]; // @[LoadQueueData.scala 66:7]
  wire  sx_entryWriteEnVec0_0_0 = sx_bankWriteEn_delay_io_out & sx_bankWriteAddrDec_delay_io_out[0]; // @[LoadQueueData.scala 96:86]
  wire  sx_entryWriteEnVec0_0_1 = sx_bankWriteEn_delay_1_io_out & sx_bankWriteAddrDec_delay_1_io_out[0]; // @[LoadQueueData.scala 96:86]
  wire [1:0] _sx_entryWriteEn_T = {sx_entryWriteEnVec0_0_1,sx_entryWriteEnVec0_0_0}; // @[LoadQueueData.scala 97:57]
  wire  sx_entryWriteEn0_0 = |_sx_entryWriteEn_T; // @[LoadQueueData.scala 97:64]
  wire [7:0] _sx_entryWriteData_T = sx_entryWriteEnVec0_0_0 ? sx_writeData_delay_io_out : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _sx_entryWriteData_T_1 = sx_entryWriteEnVec0_0_1 ? sx_writeData_delay_1_io_out : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] sx_entryWriteData0_0 = _sx_entryWriteData_T | _sx_entryWriteData_T_1; // @[Mux.scala 27:73]
  wire  sx_entryWriteEnVec0_1_0 = sx_bankWriteEn_delay_io_out & sx_bankWriteAddrDec_delay_io_out[1]; // @[LoadQueueData.scala 96:86]
  wire  sx_entryWriteEnVec0_1_1 = sx_bankWriteEn_delay_1_io_out & sx_bankWriteAddrDec_delay_1_io_out[1]; // @[LoadQueueData.scala 96:86]
  wire [1:0] _sx_entryWriteEn_T_1 = {sx_entryWriteEnVec0_1_1,sx_entryWriteEnVec0_1_0}; // @[LoadQueueData.scala 97:57]
  wire  sx_entryWriteEn0_1 = |_sx_entryWriteEn_T_1; // @[LoadQueueData.scala 97:64]
  wire [7:0] _sx_entryWriteData_T_3 = sx_entryWriteEnVec0_1_0 ? sx_writeData_delay_io_out : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _sx_entryWriteData_T_4 = sx_entryWriteEnVec0_1_1 ? sx_writeData_delay_1_io_out : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] sx_entryWriteData0_1 = _sx_entryWriteData_T_3 | _sx_entryWriteData_T_4; // @[Mux.scala 27:73]
  wire  sx_entryWriteEnVec0_2_0 = sx_bankWriteEn_delay_io_out & sx_bankWriteAddrDec_delay_io_out[2]; // @[LoadQueueData.scala 96:86]
  wire  sx_entryWriteEnVec0_2_1 = sx_bankWriteEn_delay_1_io_out & sx_bankWriteAddrDec_delay_1_io_out[2]; // @[LoadQueueData.scala 96:86]
  wire [1:0] _sx_entryWriteEn_T_2 = {sx_entryWriteEnVec0_2_1,sx_entryWriteEnVec0_2_0}; // @[LoadQueueData.scala 97:57]
  wire  sx_entryWriteEn0_2 = |_sx_entryWriteEn_T_2; // @[LoadQueueData.scala 97:64]
  wire [7:0] _sx_entryWriteData_T_6 = sx_entryWriteEnVec0_2_0 ? sx_writeData_delay_io_out : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _sx_entryWriteData_T_7 = sx_entryWriteEnVec0_2_1 ? sx_writeData_delay_1_io_out : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] sx_entryWriteData0_2 = _sx_entryWriteData_T_6 | _sx_entryWriteData_T_7; // @[Mux.scala 27:73]
  wire  sx_entryWriteEnVec0_3_0 = sx_bankWriteEn_delay_io_out & sx_bankWriteAddrDec_delay_io_out[3]; // @[LoadQueueData.scala 96:86]
  wire  sx_entryWriteEnVec0_3_1 = sx_bankWriteEn_delay_1_io_out & sx_bankWriteAddrDec_delay_1_io_out[3]; // @[LoadQueueData.scala 96:86]
  wire [1:0] _sx_entryWriteEn_T_3 = {sx_entryWriteEnVec0_3_1,sx_entryWriteEnVec0_3_0}; // @[LoadQueueData.scala 97:57]
  wire  sx_entryWriteEn0_3 = |_sx_entryWriteEn_T_3; // @[LoadQueueData.scala 97:64]
  wire [7:0] _sx_entryWriteData_T_9 = sx_entryWriteEnVec0_3_0 ? sx_writeData_delay_io_out : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _sx_entryWriteData_T_10 = sx_entryWriteEnVec0_3_1 ? sx_writeData_delay_1_io_out : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] sx_entryWriteData0_3 = _sx_entryWriteData_T_9 | _sx_entryWriteData_T_10; // @[Mux.scala 27:73]
  wire [3:0] s0_bankWriteAddrDec1_0 = writeAddrDec_0[7:4]; // @[LoadQueueData.scala 66:7]
  wire [3:0] s0_bankWriteAddrDec1_1 = writeAddrDec_1[7:4]; // @[LoadQueueData.scala 66:7]
  wire  sx_entryWriteEnVec1_0_0 = sx_bankWriteEn_delay_2_io_out & sx_bankWriteAddrDec_delay_2_io_out[0]; // @[LoadQueueData.scala 96:86]
  wire  sx_entryWriteEnVec1_0_1 = sx_bankWriteEn_delay_3_io_out & sx_bankWriteAddrDec_delay_3_io_out[0]; // @[LoadQueueData.scala 96:86]
  wire [1:0] _sx_entryWriteEn_T_4 = {sx_entryWriteEnVec1_0_1,sx_entryWriteEnVec1_0_0}; // @[LoadQueueData.scala 97:57]
  wire  sx_entryWriteEn1_0 = |_sx_entryWriteEn_T_4; // @[LoadQueueData.scala 97:64]
  wire [7:0] _sx_entryWriteData_T_12 = sx_entryWriteEnVec1_0_0 ? sx_writeData_delay_2_io_out : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _sx_entryWriteData_T_13 = sx_entryWriteEnVec1_0_1 ? sx_writeData_delay_3_io_out : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] sx_entryWriteData1_0 = _sx_entryWriteData_T_12 | _sx_entryWriteData_T_13; // @[Mux.scala 27:73]
  wire  sx_entryWriteEnVec1_1_0 = sx_bankWriteEn_delay_2_io_out & sx_bankWriteAddrDec_delay_2_io_out[1]; // @[LoadQueueData.scala 96:86]
  wire  sx_entryWriteEnVec1_1_1 = sx_bankWriteEn_delay_3_io_out & sx_bankWriteAddrDec_delay_3_io_out[1]; // @[LoadQueueData.scala 96:86]
  wire [1:0] _sx_entryWriteEn_T_5 = {sx_entryWriteEnVec1_1_1,sx_entryWriteEnVec1_1_0}; // @[LoadQueueData.scala 97:57]
  wire  sx_entryWriteEn1_1 = |_sx_entryWriteEn_T_5; // @[LoadQueueData.scala 97:64]
  wire [7:0] _sx_entryWriteData_T_15 = sx_entryWriteEnVec1_1_0 ? sx_writeData_delay_2_io_out : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _sx_entryWriteData_T_16 = sx_entryWriteEnVec1_1_1 ? sx_writeData_delay_3_io_out : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] sx_entryWriteData1_1 = _sx_entryWriteData_T_15 | _sx_entryWriteData_T_16; // @[Mux.scala 27:73]
  wire  sx_entryWriteEnVec1_2_0 = sx_bankWriteEn_delay_2_io_out & sx_bankWriteAddrDec_delay_2_io_out[2]; // @[LoadQueueData.scala 96:86]
  wire  sx_entryWriteEnVec1_2_1 = sx_bankWriteEn_delay_3_io_out & sx_bankWriteAddrDec_delay_3_io_out[2]; // @[LoadQueueData.scala 96:86]
  wire [1:0] _sx_entryWriteEn_T_6 = {sx_entryWriteEnVec1_2_1,sx_entryWriteEnVec1_2_0}; // @[LoadQueueData.scala 97:57]
  wire  sx_entryWriteEn1_2 = |_sx_entryWriteEn_T_6; // @[LoadQueueData.scala 97:64]
  wire [7:0] _sx_entryWriteData_T_18 = sx_entryWriteEnVec1_2_0 ? sx_writeData_delay_2_io_out : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _sx_entryWriteData_T_19 = sx_entryWriteEnVec1_2_1 ? sx_writeData_delay_3_io_out : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] sx_entryWriteData1_2 = _sx_entryWriteData_T_18 | _sx_entryWriteData_T_19; // @[Mux.scala 27:73]
  wire  sx_entryWriteEnVec1_3_0 = sx_bankWriteEn_delay_2_io_out & sx_bankWriteAddrDec_delay_2_io_out[3]; // @[LoadQueueData.scala 96:86]
  wire  sx_entryWriteEnVec1_3_1 = sx_bankWriteEn_delay_3_io_out & sx_bankWriteAddrDec_delay_3_io_out[3]; // @[LoadQueueData.scala 96:86]
  wire [1:0] _sx_entryWriteEn_T_7 = {sx_entryWriteEnVec1_3_1,sx_entryWriteEnVec1_3_0}; // @[LoadQueueData.scala 97:57]
  wire  sx_entryWriteEn1_3 = |_sx_entryWriteEn_T_7; // @[LoadQueueData.scala 97:64]
  wire [7:0] _sx_entryWriteData_T_21 = sx_entryWriteEnVec1_3_0 ? sx_writeData_delay_2_io_out : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _sx_entryWriteData_T_22 = sx_entryWriteEnVec1_3_1 ? sx_writeData_delay_3_io_out : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] sx_entryWriteData1_3 = _sx_entryWriteData_T_21 | _sx_entryWriteData_T_22; // @[Mux.scala 27:73]
  wire [3:0] s0_bankWriteAddrDec2_0 = writeAddrDec_0[11:8]; // @[LoadQueueData.scala 66:7]
  wire [3:0] s0_bankWriteAddrDec2_1 = writeAddrDec_1[11:8]; // @[LoadQueueData.scala 66:7]
  wire  sx_entryWriteEnVec2_0_0 = sx_bankWriteEn_delay_4_io_out & sx_bankWriteAddrDec_delay_4_io_out[0]; // @[LoadQueueData.scala 96:86]
  wire  sx_entryWriteEnVec2_0_1 = sx_bankWriteEn_delay_5_io_out & sx_bankWriteAddrDec_delay_5_io_out[0]; // @[LoadQueueData.scala 96:86]
  wire [1:0] _sx_entryWriteEn_T_8 = {sx_entryWriteEnVec2_0_1,sx_entryWriteEnVec2_0_0}; // @[LoadQueueData.scala 97:57]
  wire  sx_entryWriteEn2_0 = |_sx_entryWriteEn_T_8; // @[LoadQueueData.scala 97:64]
  wire [7:0] _sx_entryWriteData_T_24 = sx_entryWriteEnVec2_0_0 ? sx_writeData_delay_4_io_out : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _sx_entryWriteData_T_25 = sx_entryWriteEnVec2_0_1 ? sx_writeData_delay_5_io_out : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] sx_entryWriteData2_0 = _sx_entryWriteData_T_24 | _sx_entryWriteData_T_25; // @[Mux.scala 27:73]
  wire  sx_entryWriteEnVec2_1_0 = sx_bankWriteEn_delay_4_io_out & sx_bankWriteAddrDec_delay_4_io_out[1]; // @[LoadQueueData.scala 96:86]
  wire  sx_entryWriteEnVec2_1_1 = sx_bankWriteEn_delay_5_io_out & sx_bankWriteAddrDec_delay_5_io_out[1]; // @[LoadQueueData.scala 96:86]
  wire [1:0] _sx_entryWriteEn_T_9 = {sx_entryWriteEnVec2_1_1,sx_entryWriteEnVec2_1_0}; // @[LoadQueueData.scala 97:57]
  wire  sx_entryWriteEn2_1 = |_sx_entryWriteEn_T_9; // @[LoadQueueData.scala 97:64]
  wire [7:0] _sx_entryWriteData_T_27 = sx_entryWriteEnVec2_1_0 ? sx_writeData_delay_4_io_out : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _sx_entryWriteData_T_28 = sx_entryWriteEnVec2_1_1 ? sx_writeData_delay_5_io_out : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] sx_entryWriteData2_1 = _sx_entryWriteData_T_27 | _sx_entryWriteData_T_28; // @[Mux.scala 27:73]
  wire  sx_entryWriteEnVec2_2_0 = sx_bankWriteEn_delay_4_io_out & sx_bankWriteAddrDec_delay_4_io_out[2]; // @[LoadQueueData.scala 96:86]
  wire  sx_entryWriteEnVec2_2_1 = sx_bankWriteEn_delay_5_io_out & sx_bankWriteAddrDec_delay_5_io_out[2]; // @[LoadQueueData.scala 96:86]
  wire [1:0] _sx_entryWriteEn_T_10 = {sx_entryWriteEnVec2_2_1,sx_entryWriteEnVec2_2_0}; // @[LoadQueueData.scala 97:57]
  wire  sx_entryWriteEn2_2 = |_sx_entryWriteEn_T_10; // @[LoadQueueData.scala 97:64]
  wire [7:0] _sx_entryWriteData_T_30 = sx_entryWriteEnVec2_2_0 ? sx_writeData_delay_4_io_out : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _sx_entryWriteData_T_31 = sx_entryWriteEnVec2_2_1 ? sx_writeData_delay_5_io_out : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] sx_entryWriteData2_2 = _sx_entryWriteData_T_30 | _sx_entryWriteData_T_31; // @[Mux.scala 27:73]
  wire  sx_entryWriteEnVec2_3_0 = sx_bankWriteEn_delay_4_io_out & sx_bankWriteAddrDec_delay_4_io_out[3]; // @[LoadQueueData.scala 96:86]
  wire  sx_entryWriteEnVec2_3_1 = sx_bankWriteEn_delay_5_io_out & sx_bankWriteAddrDec_delay_5_io_out[3]; // @[LoadQueueData.scala 96:86]
  wire [1:0] _sx_entryWriteEn_T_11 = {sx_entryWriteEnVec2_3_1,sx_entryWriteEnVec2_3_0}; // @[LoadQueueData.scala 97:57]
  wire  sx_entryWriteEn2_3 = |_sx_entryWriteEn_T_11; // @[LoadQueueData.scala 97:64]
  wire [7:0] _sx_entryWriteData_T_33 = sx_entryWriteEnVec2_3_0 ? sx_writeData_delay_4_io_out : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _sx_entryWriteData_T_34 = sx_entryWriteEnVec2_3_1 ? sx_writeData_delay_5_io_out : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] sx_entryWriteData2_3 = _sx_entryWriteData_T_33 | _sx_entryWriteData_T_34; // @[Mux.scala 27:73]
  wire [3:0] s0_bankWriteAddrDec3_0 = writeAddrDec_0[15:12]; // @[LoadQueueData.scala 66:7]
  wire [3:0] s0_bankWriteAddrDec3_1 = writeAddrDec_1[15:12]; // @[LoadQueueData.scala 66:7]
  wire  sx_entryWriteEnVec3_0_0 = sx_bankWriteEn_delay_6_io_out & sx_bankWriteAddrDec_delay_6_io_out[0]; // @[LoadQueueData.scala 96:86]
  wire  sx_entryWriteEnVec3_0_1 = sx_bankWriteEn_delay_7_io_out & sx_bankWriteAddrDec_delay_7_io_out[0]; // @[LoadQueueData.scala 96:86]
  wire [1:0] _sx_entryWriteEn_T_12 = {sx_entryWriteEnVec3_0_1,sx_entryWriteEnVec3_0_0}; // @[LoadQueueData.scala 97:57]
  wire  sx_entryWriteEn3_0 = |_sx_entryWriteEn_T_12; // @[LoadQueueData.scala 97:64]
  wire [7:0] _sx_entryWriteData_T_36 = sx_entryWriteEnVec3_0_0 ? sx_writeData_delay_6_io_out : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _sx_entryWriteData_T_37 = sx_entryWriteEnVec3_0_1 ? sx_writeData_delay_7_io_out : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] sx_entryWriteData3_0 = _sx_entryWriteData_T_36 | _sx_entryWriteData_T_37; // @[Mux.scala 27:73]
  wire  sx_entryWriteEnVec3_1_0 = sx_bankWriteEn_delay_6_io_out & sx_bankWriteAddrDec_delay_6_io_out[1]; // @[LoadQueueData.scala 96:86]
  wire  sx_entryWriteEnVec3_1_1 = sx_bankWriteEn_delay_7_io_out & sx_bankWriteAddrDec_delay_7_io_out[1]; // @[LoadQueueData.scala 96:86]
  wire [1:0] _sx_entryWriteEn_T_13 = {sx_entryWriteEnVec3_1_1,sx_entryWriteEnVec3_1_0}; // @[LoadQueueData.scala 97:57]
  wire  sx_entryWriteEn3_1 = |_sx_entryWriteEn_T_13; // @[LoadQueueData.scala 97:64]
  wire [7:0] _sx_entryWriteData_T_39 = sx_entryWriteEnVec3_1_0 ? sx_writeData_delay_6_io_out : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _sx_entryWriteData_T_40 = sx_entryWriteEnVec3_1_1 ? sx_writeData_delay_7_io_out : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] sx_entryWriteData3_1 = _sx_entryWriteData_T_39 | _sx_entryWriteData_T_40; // @[Mux.scala 27:73]
  wire  sx_entryWriteEnVec3_2_0 = sx_bankWriteEn_delay_6_io_out & sx_bankWriteAddrDec_delay_6_io_out[2]; // @[LoadQueueData.scala 96:86]
  wire  sx_entryWriteEnVec3_2_1 = sx_bankWriteEn_delay_7_io_out & sx_bankWriteAddrDec_delay_7_io_out[2]; // @[LoadQueueData.scala 96:86]
  wire [1:0] _sx_entryWriteEn_T_14 = {sx_entryWriteEnVec3_2_1,sx_entryWriteEnVec3_2_0}; // @[LoadQueueData.scala 97:57]
  wire  sx_entryWriteEn3_2 = |_sx_entryWriteEn_T_14; // @[LoadQueueData.scala 97:64]
  wire [7:0] _sx_entryWriteData_T_42 = sx_entryWriteEnVec3_2_0 ? sx_writeData_delay_6_io_out : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _sx_entryWriteData_T_43 = sx_entryWriteEnVec3_2_1 ? sx_writeData_delay_7_io_out : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] sx_entryWriteData3_2 = _sx_entryWriteData_T_42 | _sx_entryWriteData_T_43; // @[Mux.scala 27:73]
  wire  sx_entryWriteEnVec3_3_0 = sx_bankWriteEn_delay_6_io_out & sx_bankWriteAddrDec_delay_6_io_out[3]; // @[LoadQueueData.scala 96:86]
  wire  sx_entryWriteEnVec3_3_1 = sx_bankWriteEn_delay_7_io_out & sx_bankWriteAddrDec_delay_7_io_out[3]; // @[LoadQueueData.scala 96:86]
  wire [1:0] _sx_entryWriteEn_T_15 = {sx_entryWriteEnVec3_3_1,sx_entryWriteEnVec3_3_0}; // @[LoadQueueData.scala 97:57]
  wire  sx_entryWriteEn3_3 = |_sx_entryWriteEn_T_15; // @[LoadQueueData.scala 97:64]
  wire [7:0] _sx_entryWriteData_T_45 = sx_entryWriteEnVec3_3_0 ? sx_writeData_delay_6_io_out : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _sx_entryWriteData_T_46 = sx_entryWriteEnVec3_3_1 ? sx_writeData_delay_7_io_out : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] sx_entryWriteData3_3 = _sx_entryWriteData_T_45 | _sx_entryWriteData_T_46; // @[Mux.scala 27:73]
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
  DelayN_190 sx_writeData_delay ( // @[Hold.scala 97:23]
    .clock(sx_writeData_delay_clock),
    .io_in(sx_writeData_delay_io_in),
    .io_out(sx_writeData_delay_io_out)
  );
  DelayN_190 sx_writeData_delay_1 ( // @[Hold.scala 97:23]
    .clock(sx_writeData_delay_1_clock),
    .io_in(sx_writeData_delay_1_io_in),
    .io_out(sx_writeData_delay_1_io_out)
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
  DelayN_190 sx_writeData_delay_2 ( // @[Hold.scala 97:23]
    .clock(sx_writeData_delay_2_clock),
    .io_in(sx_writeData_delay_2_io_in),
    .io_out(sx_writeData_delay_2_io_out)
  );
  DelayN_190 sx_writeData_delay_3 ( // @[Hold.scala 97:23]
    .clock(sx_writeData_delay_3_clock),
    .io_in(sx_writeData_delay_3_io_in),
    .io_out(sx_writeData_delay_3_io_out)
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
  DelayN_190 sx_writeData_delay_4 ( // @[Hold.scala 97:23]
    .clock(sx_writeData_delay_4_clock),
    .io_in(sx_writeData_delay_4_io_in),
    .io_out(sx_writeData_delay_4_io_out)
  );
  DelayN_190 sx_writeData_delay_5 ( // @[Hold.scala 97:23]
    .clock(sx_writeData_delay_5_clock),
    .io_in(sx_writeData_delay_5_io_in),
    .io_out(sx_writeData_delay_5_io_out)
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
  DelayN_190 sx_writeData_delay_6 ( // @[Hold.scala 97:23]
    .clock(sx_writeData_delay_6_clock),
    .io_in(sx_writeData_delay_6_io_in),
    .io_out(sx_writeData_delay_6_io_out)
  );
  DelayN_190 sx_writeData_delay_7 ( // @[Hold.scala 97:23]
    .clock(sx_writeData_delay_7_clock),
    .io_in(sx_writeData_delay_7_io_in),
    .io_out(sx_writeData_delay_7_io_out)
  );
  assign io_rdata_0 = 4'hf == io_rdata_0_REG ? data_15 : _GEN_14; // @[LoadQueueData.scala 60:{17,17}]
  assign sx_bankWriteAddrDec_delay_clock = clock;
  assign sx_bankWriteAddrDec_delay_io_in = writeAddrDec_0[3:0]; // @[LoadQueueData.scala 66:7]
  assign sx_bankWriteAddrDec_delay_1_clock = clock;
  assign sx_bankWriteAddrDec_delay_1_io_in = writeAddrDec_1[3:0]; // @[LoadQueueData.scala 66:7]
  assign sx_bankWriteEn_delay_clock = clock;
  assign sx_bankWriteEn_delay_io_in = io_wen_0 & |s0_bankWriteAddrDec0_0; // @[LoadQueueData.scala 72:72]
  assign sx_bankWriteEn_delay_1_clock = clock;
  assign sx_bankWriteEn_delay_1_io_in = io_wen_1 & |s0_bankWriteAddrDec0_1; // @[LoadQueueData.scala 72:72]
  assign sx_writeData_delay_clock = clock;
  assign sx_writeData_delay_io_in = io_wdata_0; // @[Hold.scala 98:17]
  assign sx_writeData_delay_1_clock = clock;
  assign sx_writeData_delay_1_io_in = io_wdata_1; // @[Hold.scala 98:17]
  assign sx_bankWriteAddrDec_delay_2_clock = clock;
  assign sx_bankWriteAddrDec_delay_2_io_in = writeAddrDec_0[7:4]; // @[LoadQueueData.scala 66:7]
  assign sx_bankWriteAddrDec_delay_3_clock = clock;
  assign sx_bankWriteAddrDec_delay_3_io_in = writeAddrDec_1[7:4]; // @[LoadQueueData.scala 66:7]
  assign sx_bankWriteEn_delay_2_clock = clock;
  assign sx_bankWriteEn_delay_2_io_in = io_wen_0 & |s0_bankWriteAddrDec1_0; // @[LoadQueueData.scala 72:72]
  assign sx_bankWriteEn_delay_3_clock = clock;
  assign sx_bankWriteEn_delay_3_io_in = io_wen_1 & |s0_bankWriteAddrDec1_1; // @[LoadQueueData.scala 72:72]
  assign sx_writeData_delay_2_clock = clock;
  assign sx_writeData_delay_2_io_in = io_wdata_0; // @[Hold.scala 98:17]
  assign sx_writeData_delay_3_clock = clock;
  assign sx_writeData_delay_3_io_in = io_wdata_1; // @[Hold.scala 98:17]
  assign sx_bankWriteAddrDec_delay_4_clock = clock;
  assign sx_bankWriteAddrDec_delay_4_io_in = writeAddrDec_0[11:8]; // @[LoadQueueData.scala 66:7]
  assign sx_bankWriteAddrDec_delay_5_clock = clock;
  assign sx_bankWriteAddrDec_delay_5_io_in = writeAddrDec_1[11:8]; // @[LoadQueueData.scala 66:7]
  assign sx_bankWriteEn_delay_4_clock = clock;
  assign sx_bankWriteEn_delay_4_io_in = io_wen_0 & |s0_bankWriteAddrDec2_0; // @[LoadQueueData.scala 72:72]
  assign sx_bankWriteEn_delay_5_clock = clock;
  assign sx_bankWriteEn_delay_5_io_in = io_wen_1 & |s0_bankWriteAddrDec2_1; // @[LoadQueueData.scala 72:72]
  assign sx_writeData_delay_4_clock = clock;
  assign sx_writeData_delay_4_io_in = io_wdata_0; // @[Hold.scala 98:17]
  assign sx_writeData_delay_5_clock = clock;
  assign sx_writeData_delay_5_io_in = io_wdata_1; // @[Hold.scala 98:17]
  assign sx_bankWriteAddrDec_delay_6_clock = clock;
  assign sx_bankWriteAddrDec_delay_6_io_in = writeAddrDec_0[15:12]; // @[LoadQueueData.scala 66:7]
  assign sx_bankWriteAddrDec_delay_7_clock = clock;
  assign sx_bankWriteAddrDec_delay_7_io_in = writeAddrDec_1[15:12]; // @[LoadQueueData.scala 66:7]
  assign sx_bankWriteEn_delay_6_clock = clock;
  assign sx_bankWriteEn_delay_6_io_in = io_wen_0 & |s0_bankWriteAddrDec3_0; // @[LoadQueueData.scala 72:72]
  assign sx_bankWriteEn_delay_7_clock = clock;
  assign sx_bankWriteEn_delay_7_io_in = io_wen_1 & |s0_bankWriteAddrDec3_1; // @[LoadQueueData.scala 72:72]
  assign sx_writeData_delay_6_clock = clock;
  assign sx_writeData_delay_6_io_in = io_wdata_0; // @[Hold.scala 98:17]
  assign sx_writeData_delay_7_clock = clock;
  assign sx_writeData_delay_7_io_in = io_wdata_1; // @[Hold.scala 98:17]
  always @(posedge clock) begin
    if (sx_entryWriteEn0_0) begin // @[LoadQueueData.scala 99:30]
      data_0 <= sx_entryWriteData0_0; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn0_1) begin // @[LoadQueueData.scala 99:30]
      data_1 <= sx_entryWriteData0_1; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn0_2) begin // @[LoadQueueData.scala 99:30]
      data_2 <= sx_entryWriteData0_2; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn0_3) begin // @[LoadQueueData.scala 99:30]
      data_3 <= sx_entryWriteData0_3; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn1_0) begin // @[LoadQueueData.scala 99:30]
      data_4 <= sx_entryWriteData1_0; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn1_1) begin // @[LoadQueueData.scala 99:30]
      data_5 <= sx_entryWriteData1_1; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn1_2) begin // @[LoadQueueData.scala 99:30]
      data_6 <= sx_entryWriteData1_2; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn1_3) begin // @[LoadQueueData.scala 99:30]
      data_7 <= sx_entryWriteData1_3; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn2_0) begin // @[LoadQueueData.scala 99:30]
      data_8 <= sx_entryWriteData2_0; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn2_1) begin // @[LoadQueueData.scala 99:30]
      data_9 <= sx_entryWriteData2_1; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn2_2) begin // @[LoadQueueData.scala 99:30]
      data_10 <= sx_entryWriteData2_2; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn2_3) begin // @[LoadQueueData.scala 99:30]
      data_11 <= sx_entryWriteData2_3; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn3_0) begin // @[LoadQueueData.scala 99:30]
      data_12 <= sx_entryWriteData3_0; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn3_1) begin // @[LoadQueueData.scala 99:30]
      data_13 <= sx_entryWriteData3_1; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn3_2) begin // @[LoadQueueData.scala 99:30]
      data_14 <= sx_entryWriteData3_2; // @[LoadQueueData.scala 100:46]
    end
    if (sx_entryWriteEn3_3) begin // @[LoadQueueData.scala 99:30]
      data_15 <= sx_entryWriteData3_3; // @[LoadQueueData.scala 100:46]
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
  data_0 = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  data_1 = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  data_2 = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  data_3 = _RAND_3[7:0];
  _RAND_4 = {1{`RANDOM}};
  data_4 = _RAND_4[7:0];
  _RAND_5 = {1{`RANDOM}};
  data_5 = _RAND_5[7:0];
  _RAND_6 = {1{`RANDOM}};
  data_6 = _RAND_6[7:0];
  _RAND_7 = {1{`RANDOM}};
  data_7 = _RAND_7[7:0];
  _RAND_8 = {1{`RANDOM}};
  data_8 = _RAND_8[7:0];
  _RAND_9 = {1{`RANDOM}};
  data_9 = _RAND_9[7:0];
  _RAND_10 = {1{`RANDOM}};
  data_10 = _RAND_10[7:0];
  _RAND_11 = {1{`RANDOM}};
  data_11 = _RAND_11[7:0];
  _RAND_12 = {1{`RANDOM}};
  data_12 = _RAND_12[7:0];
  _RAND_13 = {1{`RANDOM}};
  data_13 = _RAND_13[7:0];
  _RAND_14 = {1{`RANDOM}};
  data_14 = _RAND_14[7:0];
  _RAND_15 = {1{`RANDOM}};
  data_15 = _RAND_15[7:0];
  _RAND_16 = {1{`RANDOM}};
  io_rdata_0_REG = _RAND_16[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

