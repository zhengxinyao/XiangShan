module PayloadArray_1(
  input        clock,
  input  [7:0] io_read_0_addr,
  output [3:0] io_read_0_data_ctrl_fuType,
  output [6:0] io_read_0_data_ctrl_fuOpType,
  output       io_read_0_data_ctrl_rfWen,
  output       io_read_0_data_ctrl_fpWen,
  output [5:0] io_read_0_data_pdest,
  output       io_read_0_data_robIdx_flag,
  output [4:0] io_read_0_data_robIdx_value,
  input  [7:0] io_read_1_addr,
  output [3:0] io_read_1_data_ctrl_fuType,
  output [6:0] io_read_1_data_ctrl_fuOpType,
  output       io_read_1_data_ctrl_rfWen,
  output       io_read_1_data_ctrl_fpWen,
  output [5:0] io_read_1_data_pdest,
  output       io_read_1_data_robIdx_flag,
  output [4:0] io_read_1_data_robIdx_value,
  input        io_write_0_enable,
  input  [7:0] io_write_0_addr,
  input  [3:0] io_write_0_data_ctrl_fuType,
  input  [6:0] io_write_0_data_ctrl_fuOpType,
  input        io_write_0_data_ctrl_rfWen,
  input        io_write_0_data_ctrl_fpWen,
  input  [5:0] io_write_0_data_pdest,
  input        io_write_0_data_robIdx_flag,
  input  [4:0] io_write_0_data_robIdx_value,
  input        io_write_1_enable,
  input  [7:0] io_write_1_addr,
  input  [3:0] io_write_1_data_ctrl_fuType,
  input  [6:0] io_write_1_data_ctrl_fuOpType,
  input        io_write_1_data_ctrl_rfWen,
  input        io_write_1_data_ctrl_fpWen,
  input  [5:0] io_write_1_data_pdest,
  input        io_write_1_data_robIdx_flag,
  input  [4:0] io_write_1_data_robIdx_value
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
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] payload_0_ctrl_fuType; // @[PayloadArray.scala 45:20]
  reg [6:0] payload_0_ctrl_fuOpType; // @[PayloadArray.scala 45:20]
  reg  payload_0_ctrl_rfWen; // @[PayloadArray.scala 45:20]
  reg  payload_0_ctrl_fpWen; // @[PayloadArray.scala 45:20]
  reg [5:0] payload_0_pdest; // @[PayloadArray.scala 45:20]
  reg  payload_0_robIdx_flag; // @[PayloadArray.scala 45:20]
  reg [4:0] payload_0_robIdx_value; // @[PayloadArray.scala 45:20]
  reg [3:0] payload_1_ctrl_fuType; // @[PayloadArray.scala 45:20]
  reg [6:0] payload_1_ctrl_fuOpType; // @[PayloadArray.scala 45:20]
  reg  payload_1_ctrl_rfWen; // @[PayloadArray.scala 45:20]
  reg  payload_1_ctrl_fpWen; // @[PayloadArray.scala 45:20]
  reg [5:0] payload_1_pdest; // @[PayloadArray.scala 45:20]
  reg  payload_1_robIdx_flag; // @[PayloadArray.scala 45:20]
  reg [4:0] payload_1_robIdx_value; // @[PayloadArray.scala 45:20]
  reg [3:0] payload_2_ctrl_fuType; // @[PayloadArray.scala 45:20]
  reg [6:0] payload_2_ctrl_fuOpType; // @[PayloadArray.scala 45:20]
  reg  payload_2_ctrl_rfWen; // @[PayloadArray.scala 45:20]
  reg  payload_2_ctrl_fpWen; // @[PayloadArray.scala 45:20]
  reg [5:0] payload_2_pdest; // @[PayloadArray.scala 45:20]
  reg  payload_2_robIdx_flag; // @[PayloadArray.scala 45:20]
  reg [4:0] payload_2_robIdx_value; // @[PayloadArray.scala 45:20]
  reg [3:0] payload_3_ctrl_fuType; // @[PayloadArray.scala 45:20]
  reg [6:0] payload_3_ctrl_fuOpType; // @[PayloadArray.scala 45:20]
  reg  payload_3_ctrl_rfWen; // @[PayloadArray.scala 45:20]
  reg  payload_3_ctrl_fpWen; // @[PayloadArray.scala 45:20]
  reg [5:0] payload_3_pdest; // @[PayloadArray.scala 45:20]
  reg  payload_3_robIdx_flag; // @[PayloadArray.scala 45:20]
  reg [4:0] payload_3_robIdx_value; // @[PayloadArray.scala 45:20]
  reg [3:0] payload_4_ctrl_fuType; // @[PayloadArray.scala 45:20]
  reg [6:0] payload_4_ctrl_fuOpType; // @[PayloadArray.scala 45:20]
  reg  payload_4_ctrl_rfWen; // @[PayloadArray.scala 45:20]
  reg  payload_4_ctrl_fpWen; // @[PayloadArray.scala 45:20]
  reg [5:0] payload_4_pdest; // @[PayloadArray.scala 45:20]
  reg  payload_4_robIdx_flag; // @[PayloadArray.scala 45:20]
  reg [4:0] payload_4_robIdx_value; // @[PayloadArray.scala 45:20]
  reg [3:0] payload_5_ctrl_fuType; // @[PayloadArray.scala 45:20]
  reg [6:0] payload_5_ctrl_fuOpType; // @[PayloadArray.scala 45:20]
  reg  payload_5_ctrl_rfWen; // @[PayloadArray.scala 45:20]
  reg  payload_5_ctrl_fpWen; // @[PayloadArray.scala 45:20]
  reg [5:0] payload_5_pdest; // @[PayloadArray.scala 45:20]
  reg  payload_5_robIdx_flag; // @[PayloadArray.scala 45:20]
  reg [4:0] payload_5_robIdx_value; // @[PayloadArray.scala 45:20]
  reg [3:0] payload_6_ctrl_fuType; // @[PayloadArray.scala 45:20]
  reg [6:0] payload_6_ctrl_fuOpType; // @[PayloadArray.scala 45:20]
  reg  payload_6_ctrl_rfWen; // @[PayloadArray.scala 45:20]
  reg  payload_6_ctrl_fpWen; // @[PayloadArray.scala 45:20]
  reg [5:0] payload_6_pdest; // @[PayloadArray.scala 45:20]
  reg  payload_6_robIdx_flag; // @[PayloadArray.scala 45:20]
  reg [4:0] payload_6_robIdx_value; // @[PayloadArray.scala 45:20]
  reg [3:0] payload_7_ctrl_fuType; // @[PayloadArray.scala 45:20]
  reg [6:0] payload_7_ctrl_fuOpType; // @[PayloadArray.scala 45:20]
  reg  payload_7_ctrl_rfWen; // @[PayloadArray.scala 45:20]
  reg  payload_7_ctrl_fpWen; // @[PayloadArray.scala 45:20]
  reg [5:0] payload_7_pdest; // @[PayloadArray.scala 45:20]
  reg  payload_7_robIdx_flag; // @[PayloadArray.scala 45:20]
  reg [4:0] payload_7_robIdx_value; // @[PayloadArray.scala 45:20]
  wire [4:0] _io_read_0_data_T_233 = io_read_0_addr[0] ? payload_0_robIdx_value : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_read_0_data_T_234 = io_read_0_addr[1] ? payload_1_robIdx_value : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_read_0_data_T_235 = io_read_0_addr[2] ? payload_2_robIdx_value : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_read_0_data_T_236 = io_read_0_addr[3] ? payload_3_robIdx_value : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_read_0_data_T_237 = io_read_0_addr[4] ? payload_4_robIdx_value : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_read_0_data_T_238 = io_read_0_addr[5] ? payload_5_robIdx_value : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_read_0_data_T_239 = io_read_0_addr[6] ? payload_6_robIdx_value : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_read_0_data_T_240 = io_read_0_addr[7] ? payload_7_robIdx_value : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_read_0_data_T_241 = _io_read_0_data_T_233 | _io_read_0_data_T_234; // @[Mux.scala 27:73]
  wire [4:0] _io_read_0_data_T_242 = _io_read_0_data_T_241 | _io_read_0_data_T_235; // @[Mux.scala 27:73]
  wire [4:0] _io_read_0_data_T_243 = _io_read_0_data_T_242 | _io_read_0_data_T_236; // @[Mux.scala 27:73]
  wire [4:0] _io_read_0_data_T_244 = _io_read_0_data_T_243 | _io_read_0_data_T_237; // @[Mux.scala 27:73]
  wire [4:0] _io_read_0_data_T_245 = _io_read_0_data_T_244 | _io_read_0_data_T_238; // @[Mux.scala 27:73]
  wire [4:0] _io_read_0_data_T_246 = _io_read_0_data_T_245 | _io_read_0_data_T_239; // @[Mux.scala 27:73]
  wire [5:0] _io_read_0_data_T_278 = io_read_0_addr[0] ? payload_0_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_read_0_data_T_279 = io_read_0_addr[1] ? payload_1_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_read_0_data_T_280 = io_read_0_addr[2] ? payload_2_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_read_0_data_T_281 = io_read_0_addr[3] ? payload_3_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_read_0_data_T_282 = io_read_0_addr[4] ? payload_4_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_read_0_data_T_283 = io_read_0_addr[5] ? payload_5_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_read_0_data_T_284 = io_read_0_addr[6] ? payload_6_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_read_0_data_T_285 = io_read_0_addr[7] ? payload_7_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_read_0_data_T_286 = _io_read_0_data_T_278 | _io_read_0_data_T_279; // @[Mux.scala 27:73]
  wire [5:0] _io_read_0_data_T_287 = _io_read_0_data_T_286 | _io_read_0_data_T_280; // @[Mux.scala 27:73]
  wire [5:0] _io_read_0_data_T_288 = _io_read_0_data_T_287 | _io_read_0_data_T_281; // @[Mux.scala 27:73]
  wire [5:0] _io_read_0_data_T_289 = _io_read_0_data_T_288 | _io_read_0_data_T_282; // @[Mux.scala 27:73]
  wire [5:0] _io_read_0_data_T_290 = _io_read_0_data_T_289 | _io_read_0_data_T_283; // @[Mux.scala 27:73]
  wire [5:0] _io_read_0_data_T_291 = _io_read_0_data_T_290 | _io_read_0_data_T_284; // @[Mux.scala 27:73]
  wire [6:0] _io_read_0_data_T_773 = io_read_0_addr[0] ? payload_0_ctrl_fuOpType : 7'h0; // @[Mux.scala 27:73]
  wire [6:0] _io_read_0_data_T_774 = io_read_0_addr[1] ? payload_1_ctrl_fuOpType : 7'h0; // @[Mux.scala 27:73]
  wire [6:0] _io_read_0_data_T_775 = io_read_0_addr[2] ? payload_2_ctrl_fuOpType : 7'h0; // @[Mux.scala 27:73]
  wire [6:0] _io_read_0_data_T_776 = io_read_0_addr[3] ? payload_3_ctrl_fuOpType : 7'h0; // @[Mux.scala 27:73]
  wire [6:0] _io_read_0_data_T_777 = io_read_0_addr[4] ? payload_4_ctrl_fuOpType : 7'h0; // @[Mux.scala 27:73]
  wire [6:0] _io_read_0_data_T_778 = io_read_0_addr[5] ? payload_5_ctrl_fuOpType : 7'h0; // @[Mux.scala 27:73]
  wire [6:0] _io_read_0_data_T_779 = io_read_0_addr[6] ? payload_6_ctrl_fuOpType : 7'h0; // @[Mux.scala 27:73]
  wire [6:0] _io_read_0_data_T_780 = io_read_0_addr[7] ? payload_7_ctrl_fuOpType : 7'h0; // @[Mux.scala 27:73]
  wire [6:0] _io_read_0_data_T_781 = _io_read_0_data_T_773 | _io_read_0_data_T_774; // @[Mux.scala 27:73]
  wire [6:0] _io_read_0_data_T_782 = _io_read_0_data_T_781 | _io_read_0_data_T_775; // @[Mux.scala 27:73]
  wire [6:0] _io_read_0_data_T_783 = _io_read_0_data_T_782 | _io_read_0_data_T_776; // @[Mux.scala 27:73]
  wire [6:0] _io_read_0_data_T_784 = _io_read_0_data_T_783 | _io_read_0_data_T_777; // @[Mux.scala 27:73]
  wire [6:0] _io_read_0_data_T_785 = _io_read_0_data_T_784 | _io_read_0_data_T_778; // @[Mux.scala 27:73]
  wire [6:0] _io_read_0_data_T_786 = _io_read_0_data_T_785 | _io_read_0_data_T_779; // @[Mux.scala 27:73]
  wire [3:0] _io_read_0_data_T_788 = io_read_0_addr[0] ? payload_0_ctrl_fuType : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] _io_read_0_data_T_789 = io_read_0_addr[1] ? payload_1_ctrl_fuType : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] _io_read_0_data_T_790 = io_read_0_addr[2] ? payload_2_ctrl_fuType : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] _io_read_0_data_T_791 = io_read_0_addr[3] ? payload_3_ctrl_fuType : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] _io_read_0_data_T_792 = io_read_0_addr[4] ? payload_4_ctrl_fuType : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] _io_read_0_data_T_793 = io_read_0_addr[5] ? payload_5_ctrl_fuType : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] _io_read_0_data_T_794 = io_read_0_addr[6] ? payload_6_ctrl_fuType : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] _io_read_0_data_T_795 = io_read_0_addr[7] ? payload_7_ctrl_fuType : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] _io_read_0_data_T_796 = _io_read_0_data_T_788 | _io_read_0_data_T_789; // @[Mux.scala 27:73]
  wire [3:0] _io_read_0_data_T_797 = _io_read_0_data_T_796 | _io_read_0_data_T_790; // @[Mux.scala 27:73]
  wire [3:0] _io_read_0_data_T_798 = _io_read_0_data_T_797 | _io_read_0_data_T_791; // @[Mux.scala 27:73]
  wire [3:0] _io_read_0_data_T_799 = _io_read_0_data_T_798 | _io_read_0_data_T_792; // @[Mux.scala 27:73]
  wire [3:0] _io_read_0_data_T_800 = _io_read_0_data_T_799 | _io_read_0_data_T_793; // @[Mux.scala 27:73]
  wire [3:0] _io_read_0_data_T_801 = _io_read_0_data_T_800 | _io_read_0_data_T_794; // @[Mux.scala 27:73]
  wire [4:0] _io_read_1_data_T_233 = io_read_1_addr[0] ? payload_0_robIdx_value : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_read_1_data_T_234 = io_read_1_addr[1] ? payload_1_robIdx_value : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_read_1_data_T_235 = io_read_1_addr[2] ? payload_2_robIdx_value : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_read_1_data_T_236 = io_read_1_addr[3] ? payload_3_robIdx_value : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_read_1_data_T_237 = io_read_1_addr[4] ? payload_4_robIdx_value : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_read_1_data_T_238 = io_read_1_addr[5] ? payload_5_robIdx_value : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_read_1_data_T_239 = io_read_1_addr[6] ? payload_6_robIdx_value : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_read_1_data_T_240 = io_read_1_addr[7] ? payload_7_robIdx_value : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_read_1_data_T_241 = _io_read_1_data_T_233 | _io_read_1_data_T_234; // @[Mux.scala 27:73]
  wire [4:0] _io_read_1_data_T_242 = _io_read_1_data_T_241 | _io_read_1_data_T_235; // @[Mux.scala 27:73]
  wire [4:0] _io_read_1_data_T_243 = _io_read_1_data_T_242 | _io_read_1_data_T_236; // @[Mux.scala 27:73]
  wire [4:0] _io_read_1_data_T_244 = _io_read_1_data_T_243 | _io_read_1_data_T_237; // @[Mux.scala 27:73]
  wire [4:0] _io_read_1_data_T_245 = _io_read_1_data_T_244 | _io_read_1_data_T_238; // @[Mux.scala 27:73]
  wire [4:0] _io_read_1_data_T_246 = _io_read_1_data_T_245 | _io_read_1_data_T_239; // @[Mux.scala 27:73]
  wire [5:0] _io_read_1_data_T_278 = io_read_1_addr[0] ? payload_0_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_read_1_data_T_279 = io_read_1_addr[1] ? payload_1_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_read_1_data_T_280 = io_read_1_addr[2] ? payload_2_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_read_1_data_T_281 = io_read_1_addr[3] ? payload_3_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_read_1_data_T_282 = io_read_1_addr[4] ? payload_4_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_read_1_data_T_283 = io_read_1_addr[5] ? payload_5_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_read_1_data_T_284 = io_read_1_addr[6] ? payload_6_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_read_1_data_T_285 = io_read_1_addr[7] ? payload_7_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _io_read_1_data_T_286 = _io_read_1_data_T_278 | _io_read_1_data_T_279; // @[Mux.scala 27:73]
  wire [5:0] _io_read_1_data_T_287 = _io_read_1_data_T_286 | _io_read_1_data_T_280; // @[Mux.scala 27:73]
  wire [5:0] _io_read_1_data_T_288 = _io_read_1_data_T_287 | _io_read_1_data_T_281; // @[Mux.scala 27:73]
  wire [5:0] _io_read_1_data_T_289 = _io_read_1_data_T_288 | _io_read_1_data_T_282; // @[Mux.scala 27:73]
  wire [5:0] _io_read_1_data_T_290 = _io_read_1_data_T_289 | _io_read_1_data_T_283; // @[Mux.scala 27:73]
  wire [5:0] _io_read_1_data_T_291 = _io_read_1_data_T_290 | _io_read_1_data_T_284; // @[Mux.scala 27:73]
  wire [6:0] _io_read_1_data_T_773 = io_read_1_addr[0] ? payload_0_ctrl_fuOpType : 7'h0; // @[Mux.scala 27:73]
  wire [6:0] _io_read_1_data_T_774 = io_read_1_addr[1] ? payload_1_ctrl_fuOpType : 7'h0; // @[Mux.scala 27:73]
  wire [6:0] _io_read_1_data_T_775 = io_read_1_addr[2] ? payload_2_ctrl_fuOpType : 7'h0; // @[Mux.scala 27:73]
  wire [6:0] _io_read_1_data_T_776 = io_read_1_addr[3] ? payload_3_ctrl_fuOpType : 7'h0; // @[Mux.scala 27:73]
  wire [6:0] _io_read_1_data_T_777 = io_read_1_addr[4] ? payload_4_ctrl_fuOpType : 7'h0; // @[Mux.scala 27:73]
  wire [6:0] _io_read_1_data_T_778 = io_read_1_addr[5] ? payload_5_ctrl_fuOpType : 7'h0; // @[Mux.scala 27:73]
  wire [6:0] _io_read_1_data_T_779 = io_read_1_addr[6] ? payload_6_ctrl_fuOpType : 7'h0; // @[Mux.scala 27:73]
  wire [6:0] _io_read_1_data_T_780 = io_read_1_addr[7] ? payload_7_ctrl_fuOpType : 7'h0; // @[Mux.scala 27:73]
  wire [6:0] _io_read_1_data_T_781 = _io_read_1_data_T_773 | _io_read_1_data_T_774; // @[Mux.scala 27:73]
  wire [6:0] _io_read_1_data_T_782 = _io_read_1_data_T_781 | _io_read_1_data_T_775; // @[Mux.scala 27:73]
  wire [6:0] _io_read_1_data_T_783 = _io_read_1_data_T_782 | _io_read_1_data_T_776; // @[Mux.scala 27:73]
  wire [6:0] _io_read_1_data_T_784 = _io_read_1_data_T_783 | _io_read_1_data_T_777; // @[Mux.scala 27:73]
  wire [6:0] _io_read_1_data_T_785 = _io_read_1_data_T_784 | _io_read_1_data_T_778; // @[Mux.scala 27:73]
  wire [6:0] _io_read_1_data_T_786 = _io_read_1_data_T_785 | _io_read_1_data_T_779; // @[Mux.scala 27:73]
  wire [3:0] _io_read_1_data_T_788 = io_read_1_addr[0] ? payload_0_ctrl_fuType : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] _io_read_1_data_T_789 = io_read_1_addr[1] ? payload_1_ctrl_fuType : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] _io_read_1_data_T_790 = io_read_1_addr[2] ? payload_2_ctrl_fuType : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] _io_read_1_data_T_791 = io_read_1_addr[3] ? payload_3_ctrl_fuType : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] _io_read_1_data_T_792 = io_read_1_addr[4] ? payload_4_ctrl_fuType : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] _io_read_1_data_T_793 = io_read_1_addr[5] ? payload_5_ctrl_fuType : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] _io_read_1_data_T_794 = io_read_1_addr[6] ? payload_6_ctrl_fuType : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] _io_read_1_data_T_795 = io_read_1_addr[7] ? payload_7_ctrl_fuType : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] _io_read_1_data_T_796 = _io_read_1_data_T_788 | _io_read_1_data_T_789; // @[Mux.scala 27:73]
  wire [3:0] _io_read_1_data_T_797 = _io_read_1_data_T_796 | _io_read_1_data_T_790; // @[Mux.scala 27:73]
  wire [3:0] _io_read_1_data_T_798 = _io_read_1_data_T_797 | _io_read_1_data_T_791; // @[Mux.scala 27:73]
  wire [3:0] _io_read_1_data_T_799 = _io_read_1_data_T_798 | _io_read_1_data_T_792; // @[Mux.scala 27:73]
  wire [3:0] _io_read_1_data_T_800 = _io_read_1_data_T_799 | _io_read_1_data_T_793; // @[Mux.scala 27:73]
  wire [3:0] _io_read_1_data_T_801 = _io_read_1_data_T_800 | _io_read_1_data_T_794; // @[Mux.scala 27:73]
  wire  wenVec__0 = io_write_0_enable & io_write_0_addr[0]; // @[PayloadArray.scala 55:53]
  wire  wenVec__1 = io_write_1_enable & io_write_1_addr[0]; // @[PayloadArray.scala 55:53]
  wire [1:0] _wen_T = {wenVec__1,wenVec__0}; // @[PayloadArray.scala 56:22]
  wire  wen = |_wen_T; // @[PayloadArray.scala 56:29]
  wire [4:0] _wdata_T_45 = wenVec__0 ? io_write_0_data_robIdx_value : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _wdata_T_46 = wenVec__1 ? io_write_1_data_robIdx_value : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] wdata_robIdx_value = _wdata_T_45 | _wdata_T_46; // @[Mux.scala 27:73]
  wire  wdata_robIdx_flag = wenVec__0 & io_write_0_data_robIdx_flag | wenVec__1 & io_write_1_data_robIdx_flag; // @[Mux.scala 27:73]
  wire [5:0] _wdata_T_54 = wenVec__0 ? io_write_0_data_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _wdata_T_55 = wenVec__1 ? io_write_1_data_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] wdata_pdest = _wdata_T_54 | _wdata_T_55; // @[Mux.scala 27:73]
  wire  wdata_ctrl_fpWen = wenVec__0 & io_write_0_data_ctrl_fpWen | wenVec__1 & io_write_1_data_ctrl_fpWen; // @[Mux.scala 27:73]
  wire  wdata_ctrl_rfWen = wenVec__0 & io_write_0_data_ctrl_rfWen | wenVec__1 & io_write_1_data_ctrl_rfWen; // @[Mux.scala 27:73]
  wire [6:0] _wdata_T_153 = wenVec__0 ? io_write_0_data_ctrl_fuOpType : 7'h0; // @[Mux.scala 27:73]
  wire [6:0] _wdata_T_154 = wenVec__1 ? io_write_1_data_ctrl_fuOpType : 7'h0; // @[Mux.scala 27:73]
  wire [6:0] wdata_ctrl_fuOpType = _wdata_T_153 | _wdata_T_154; // @[Mux.scala 27:73]
  wire [3:0] _wdata_T_156 = wenVec__0 ? io_write_0_data_ctrl_fuType : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] _wdata_T_157 = wenVec__1 ? io_write_1_data_ctrl_fuType : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] wdata_ctrl_fuType = _wdata_T_156 | _wdata_T_157; // @[Mux.scala 27:73]
  wire  wenVec_1_0 = io_write_0_enable & io_write_0_addr[1]; // @[PayloadArray.scala 55:53]
  wire  wenVec_1_1 = io_write_1_enable & io_write_1_addr[1]; // @[PayloadArray.scala 55:53]
  wire [1:0] _wen_T_1 = {wenVec_1_1,wenVec_1_0}; // @[PayloadArray.scala 56:22]
  wire  wen_1 = |_wen_T_1; // @[PayloadArray.scala 56:29]
  wire [4:0] _wdata_T_369 = wenVec_1_0 ? io_write_0_data_robIdx_value : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _wdata_T_370 = wenVec_1_1 ? io_write_1_data_robIdx_value : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] wdata_1_robIdx_value = _wdata_T_369 | _wdata_T_370; // @[Mux.scala 27:73]
  wire  wdata_1_robIdx_flag = wenVec_1_0 & io_write_0_data_robIdx_flag | wenVec_1_1 & io_write_1_data_robIdx_flag; // @[Mux.scala 27:73]
  wire [5:0] _wdata_T_378 = wenVec_1_0 ? io_write_0_data_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _wdata_T_379 = wenVec_1_1 ? io_write_1_data_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] wdata_1_pdest = _wdata_T_378 | _wdata_T_379; // @[Mux.scala 27:73]
  wire  wdata_1_ctrl_fpWen = wenVec_1_0 & io_write_0_data_ctrl_fpWen | wenVec_1_1 & io_write_1_data_ctrl_fpWen; // @[Mux.scala 27:73]
  wire  wdata_1_ctrl_rfWen = wenVec_1_0 & io_write_0_data_ctrl_rfWen | wenVec_1_1 & io_write_1_data_ctrl_rfWen; // @[Mux.scala 27:73]
  wire [6:0] _wdata_T_477 = wenVec_1_0 ? io_write_0_data_ctrl_fuOpType : 7'h0; // @[Mux.scala 27:73]
  wire [6:0] _wdata_T_478 = wenVec_1_1 ? io_write_1_data_ctrl_fuOpType : 7'h0; // @[Mux.scala 27:73]
  wire [6:0] wdata_1_ctrl_fuOpType = _wdata_T_477 | _wdata_T_478; // @[Mux.scala 27:73]
  wire [3:0] _wdata_T_480 = wenVec_1_0 ? io_write_0_data_ctrl_fuType : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] _wdata_T_481 = wenVec_1_1 ? io_write_1_data_ctrl_fuType : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] wdata_1_ctrl_fuType = _wdata_T_480 | _wdata_T_481; // @[Mux.scala 27:73]
  wire  wenVec_2_0 = io_write_0_enable & io_write_0_addr[2]; // @[PayloadArray.scala 55:53]
  wire  wenVec_2_1 = io_write_1_enable & io_write_1_addr[2]; // @[PayloadArray.scala 55:53]
  wire [1:0] _wen_T_2 = {wenVec_2_1,wenVec_2_0}; // @[PayloadArray.scala 56:22]
  wire  wen_2 = |_wen_T_2; // @[PayloadArray.scala 56:29]
  wire [4:0] _wdata_T_693 = wenVec_2_0 ? io_write_0_data_robIdx_value : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _wdata_T_694 = wenVec_2_1 ? io_write_1_data_robIdx_value : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] wdata_2_robIdx_value = _wdata_T_693 | _wdata_T_694; // @[Mux.scala 27:73]
  wire  wdata_2_robIdx_flag = wenVec_2_0 & io_write_0_data_robIdx_flag | wenVec_2_1 & io_write_1_data_robIdx_flag; // @[Mux.scala 27:73]
  wire [5:0] _wdata_T_702 = wenVec_2_0 ? io_write_0_data_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _wdata_T_703 = wenVec_2_1 ? io_write_1_data_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] wdata_2_pdest = _wdata_T_702 | _wdata_T_703; // @[Mux.scala 27:73]
  wire  wdata_2_ctrl_fpWen = wenVec_2_0 & io_write_0_data_ctrl_fpWen | wenVec_2_1 & io_write_1_data_ctrl_fpWen; // @[Mux.scala 27:73]
  wire  wdata_2_ctrl_rfWen = wenVec_2_0 & io_write_0_data_ctrl_rfWen | wenVec_2_1 & io_write_1_data_ctrl_rfWen; // @[Mux.scala 27:73]
  wire [6:0] _wdata_T_801 = wenVec_2_0 ? io_write_0_data_ctrl_fuOpType : 7'h0; // @[Mux.scala 27:73]
  wire [6:0] _wdata_T_802 = wenVec_2_1 ? io_write_1_data_ctrl_fuOpType : 7'h0; // @[Mux.scala 27:73]
  wire [6:0] wdata_2_ctrl_fuOpType = _wdata_T_801 | _wdata_T_802; // @[Mux.scala 27:73]
  wire [3:0] _wdata_T_804 = wenVec_2_0 ? io_write_0_data_ctrl_fuType : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] _wdata_T_805 = wenVec_2_1 ? io_write_1_data_ctrl_fuType : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] wdata_2_ctrl_fuType = _wdata_T_804 | _wdata_T_805; // @[Mux.scala 27:73]
  wire  wenVec_3_0 = io_write_0_enable & io_write_0_addr[3]; // @[PayloadArray.scala 55:53]
  wire  wenVec_3_1 = io_write_1_enable & io_write_1_addr[3]; // @[PayloadArray.scala 55:53]
  wire [1:0] _wen_T_3 = {wenVec_3_1,wenVec_3_0}; // @[PayloadArray.scala 56:22]
  wire  wen_3 = |_wen_T_3; // @[PayloadArray.scala 56:29]
  wire [4:0] _wdata_T_1017 = wenVec_3_0 ? io_write_0_data_robIdx_value : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _wdata_T_1018 = wenVec_3_1 ? io_write_1_data_robIdx_value : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] wdata_3_robIdx_value = _wdata_T_1017 | _wdata_T_1018; // @[Mux.scala 27:73]
  wire  wdata_3_robIdx_flag = wenVec_3_0 & io_write_0_data_robIdx_flag | wenVec_3_1 & io_write_1_data_robIdx_flag; // @[Mux.scala 27:73]
  wire [5:0] _wdata_T_1026 = wenVec_3_0 ? io_write_0_data_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _wdata_T_1027 = wenVec_3_1 ? io_write_1_data_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] wdata_3_pdest = _wdata_T_1026 | _wdata_T_1027; // @[Mux.scala 27:73]
  wire  wdata_3_ctrl_fpWen = wenVec_3_0 & io_write_0_data_ctrl_fpWen | wenVec_3_1 & io_write_1_data_ctrl_fpWen; // @[Mux.scala 27:73]
  wire  wdata_3_ctrl_rfWen = wenVec_3_0 & io_write_0_data_ctrl_rfWen | wenVec_3_1 & io_write_1_data_ctrl_rfWen; // @[Mux.scala 27:73]
  wire [6:0] _wdata_T_1125 = wenVec_3_0 ? io_write_0_data_ctrl_fuOpType : 7'h0; // @[Mux.scala 27:73]
  wire [6:0] _wdata_T_1126 = wenVec_3_1 ? io_write_1_data_ctrl_fuOpType : 7'h0; // @[Mux.scala 27:73]
  wire [6:0] wdata_3_ctrl_fuOpType = _wdata_T_1125 | _wdata_T_1126; // @[Mux.scala 27:73]
  wire [3:0] _wdata_T_1128 = wenVec_3_0 ? io_write_0_data_ctrl_fuType : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] _wdata_T_1129 = wenVec_3_1 ? io_write_1_data_ctrl_fuType : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] wdata_3_ctrl_fuType = _wdata_T_1128 | _wdata_T_1129; // @[Mux.scala 27:73]
  wire  wenVec_4_0 = io_write_0_enable & io_write_0_addr[4]; // @[PayloadArray.scala 55:53]
  wire  wenVec_4_1 = io_write_1_enable & io_write_1_addr[4]; // @[PayloadArray.scala 55:53]
  wire [1:0] _wen_T_4 = {wenVec_4_1,wenVec_4_0}; // @[PayloadArray.scala 56:22]
  wire  wen_4 = |_wen_T_4; // @[PayloadArray.scala 56:29]
  wire [4:0] _wdata_T_1341 = wenVec_4_0 ? io_write_0_data_robIdx_value : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _wdata_T_1342 = wenVec_4_1 ? io_write_1_data_robIdx_value : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] wdata_4_robIdx_value = _wdata_T_1341 | _wdata_T_1342; // @[Mux.scala 27:73]
  wire  wdata_4_robIdx_flag = wenVec_4_0 & io_write_0_data_robIdx_flag | wenVec_4_1 & io_write_1_data_robIdx_flag; // @[Mux.scala 27:73]
  wire [5:0] _wdata_T_1350 = wenVec_4_0 ? io_write_0_data_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _wdata_T_1351 = wenVec_4_1 ? io_write_1_data_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] wdata_4_pdest = _wdata_T_1350 | _wdata_T_1351; // @[Mux.scala 27:73]
  wire  wdata_4_ctrl_fpWen = wenVec_4_0 & io_write_0_data_ctrl_fpWen | wenVec_4_1 & io_write_1_data_ctrl_fpWen; // @[Mux.scala 27:73]
  wire  wdata_4_ctrl_rfWen = wenVec_4_0 & io_write_0_data_ctrl_rfWen | wenVec_4_1 & io_write_1_data_ctrl_rfWen; // @[Mux.scala 27:73]
  wire [6:0] _wdata_T_1449 = wenVec_4_0 ? io_write_0_data_ctrl_fuOpType : 7'h0; // @[Mux.scala 27:73]
  wire [6:0] _wdata_T_1450 = wenVec_4_1 ? io_write_1_data_ctrl_fuOpType : 7'h0; // @[Mux.scala 27:73]
  wire [6:0] wdata_4_ctrl_fuOpType = _wdata_T_1449 | _wdata_T_1450; // @[Mux.scala 27:73]
  wire [3:0] _wdata_T_1452 = wenVec_4_0 ? io_write_0_data_ctrl_fuType : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] _wdata_T_1453 = wenVec_4_1 ? io_write_1_data_ctrl_fuType : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] wdata_4_ctrl_fuType = _wdata_T_1452 | _wdata_T_1453; // @[Mux.scala 27:73]
  wire  wenVec_5_0 = io_write_0_enable & io_write_0_addr[5]; // @[PayloadArray.scala 55:53]
  wire  wenVec_5_1 = io_write_1_enable & io_write_1_addr[5]; // @[PayloadArray.scala 55:53]
  wire [1:0] _wen_T_5 = {wenVec_5_1,wenVec_5_0}; // @[PayloadArray.scala 56:22]
  wire  wen_5 = |_wen_T_5; // @[PayloadArray.scala 56:29]
  wire [4:0] _wdata_T_1665 = wenVec_5_0 ? io_write_0_data_robIdx_value : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _wdata_T_1666 = wenVec_5_1 ? io_write_1_data_robIdx_value : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] wdata_5_robIdx_value = _wdata_T_1665 | _wdata_T_1666; // @[Mux.scala 27:73]
  wire  wdata_5_robIdx_flag = wenVec_5_0 & io_write_0_data_robIdx_flag | wenVec_5_1 & io_write_1_data_robIdx_flag; // @[Mux.scala 27:73]
  wire [5:0] _wdata_T_1674 = wenVec_5_0 ? io_write_0_data_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _wdata_T_1675 = wenVec_5_1 ? io_write_1_data_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] wdata_5_pdest = _wdata_T_1674 | _wdata_T_1675; // @[Mux.scala 27:73]
  wire  wdata_5_ctrl_fpWen = wenVec_5_0 & io_write_0_data_ctrl_fpWen | wenVec_5_1 & io_write_1_data_ctrl_fpWen; // @[Mux.scala 27:73]
  wire  wdata_5_ctrl_rfWen = wenVec_5_0 & io_write_0_data_ctrl_rfWen | wenVec_5_1 & io_write_1_data_ctrl_rfWen; // @[Mux.scala 27:73]
  wire [6:0] _wdata_T_1773 = wenVec_5_0 ? io_write_0_data_ctrl_fuOpType : 7'h0; // @[Mux.scala 27:73]
  wire [6:0] _wdata_T_1774 = wenVec_5_1 ? io_write_1_data_ctrl_fuOpType : 7'h0; // @[Mux.scala 27:73]
  wire [6:0] wdata_5_ctrl_fuOpType = _wdata_T_1773 | _wdata_T_1774; // @[Mux.scala 27:73]
  wire [3:0] _wdata_T_1776 = wenVec_5_0 ? io_write_0_data_ctrl_fuType : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] _wdata_T_1777 = wenVec_5_1 ? io_write_1_data_ctrl_fuType : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] wdata_5_ctrl_fuType = _wdata_T_1776 | _wdata_T_1777; // @[Mux.scala 27:73]
  wire  wenVec_6_0 = io_write_0_enable & io_write_0_addr[6]; // @[PayloadArray.scala 55:53]
  wire  wenVec_6_1 = io_write_1_enable & io_write_1_addr[6]; // @[PayloadArray.scala 55:53]
  wire [1:0] _wen_T_6 = {wenVec_6_1,wenVec_6_0}; // @[PayloadArray.scala 56:22]
  wire  wen_6 = |_wen_T_6; // @[PayloadArray.scala 56:29]
  wire [4:0] _wdata_T_1989 = wenVec_6_0 ? io_write_0_data_robIdx_value : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _wdata_T_1990 = wenVec_6_1 ? io_write_1_data_robIdx_value : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] wdata_6_robIdx_value = _wdata_T_1989 | _wdata_T_1990; // @[Mux.scala 27:73]
  wire  wdata_6_robIdx_flag = wenVec_6_0 & io_write_0_data_robIdx_flag | wenVec_6_1 & io_write_1_data_robIdx_flag; // @[Mux.scala 27:73]
  wire [5:0] _wdata_T_1998 = wenVec_6_0 ? io_write_0_data_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _wdata_T_1999 = wenVec_6_1 ? io_write_1_data_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] wdata_6_pdest = _wdata_T_1998 | _wdata_T_1999; // @[Mux.scala 27:73]
  wire  wdata_6_ctrl_fpWen = wenVec_6_0 & io_write_0_data_ctrl_fpWen | wenVec_6_1 & io_write_1_data_ctrl_fpWen; // @[Mux.scala 27:73]
  wire  wdata_6_ctrl_rfWen = wenVec_6_0 & io_write_0_data_ctrl_rfWen | wenVec_6_1 & io_write_1_data_ctrl_rfWen; // @[Mux.scala 27:73]
  wire [6:0] _wdata_T_2097 = wenVec_6_0 ? io_write_0_data_ctrl_fuOpType : 7'h0; // @[Mux.scala 27:73]
  wire [6:0] _wdata_T_2098 = wenVec_6_1 ? io_write_1_data_ctrl_fuOpType : 7'h0; // @[Mux.scala 27:73]
  wire [6:0] wdata_6_ctrl_fuOpType = _wdata_T_2097 | _wdata_T_2098; // @[Mux.scala 27:73]
  wire [3:0] _wdata_T_2100 = wenVec_6_0 ? io_write_0_data_ctrl_fuType : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] _wdata_T_2101 = wenVec_6_1 ? io_write_1_data_ctrl_fuType : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] wdata_6_ctrl_fuType = _wdata_T_2100 | _wdata_T_2101; // @[Mux.scala 27:73]
  wire  wenVec_7_0 = io_write_0_enable & io_write_0_addr[7]; // @[PayloadArray.scala 55:53]
  wire  wenVec_7_1 = io_write_1_enable & io_write_1_addr[7]; // @[PayloadArray.scala 55:53]
  wire [1:0] _wen_T_7 = {wenVec_7_1,wenVec_7_0}; // @[PayloadArray.scala 56:22]
  wire  wen_7 = |_wen_T_7; // @[PayloadArray.scala 56:29]
  wire [4:0] _wdata_T_2313 = wenVec_7_0 ? io_write_0_data_robIdx_value : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _wdata_T_2314 = wenVec_7_1 ? io_write_1_data_robIdx_value : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] wdata_7_robIdx_value = _wdata_T_2313 | _wdata_T_2314; // @[Mux.scala 27:73]
  wire  wdata_7_robIdx_flag = wenVec_7_0 & io_write_0_data_robIdx_flag | wenVec_7_1 & io_write_1_data_robIdx_flag; // @[Mux.scala 27:73]
  wire [5:0] _wdata_T_2322 = wenVec_7_0 ? io_write_0_data_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] _wdata_T_2323 = wenVec_7_1 ? io_write_1_data_pdest : 6'h0; // @[Mux.scala 27:73]
  wire [5:0] wdata_7_pdest = _wdata_T_2322 | _wdata_T_2323; // @[Mux.scala 27:73]
  wire  wdata_7_ctrl_fpWen = wenVec_7_0 & io_write_0_data_ctrl_fpWen | wenVec_7_1 & io_write_1_data_ctrl_fpWen; // @[Mux.scala 27:73]
  wire  wdata_7_ctrl_rfWen = wenVec_7_0 & io_write_0_data_ctrl_rfWen | wenVec_7_1 & io_write_1_data_ctrl_rfWen; // @[Mux.scala 27:73]
  wire [6:0] _wdata_T_2421 = wenVec_7_0 ? io_write_0_data_ctrl_fuOpType : 7'h0; // @[Mux.scala 27:73]
  wire [6:0] _wdata_T_2422 = wenVec_7_1 ? io_write_1_data_ctrl_fuOpType : 7'h0; // @[Mux.scala 27:73]
  wire [6:0] wdata_7_ctrl_fuOpType = _wdata_T_2421 | _wdata_T_2422; // @[Mux.scala 27:73]
  wire [3:0] _wdata_T_2424 = wenVec_7_0 ? io_write_0_data_ctrl_fuType : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] _wdata_T_2425 = wenVec_7_1 ? io_write_1_data_ctrl_fuType : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] wdata_7_ctrl_fuType = _wdata_T_2424 | _wdata_T_2425; // @[Mux.scala 27:73]
  assign io_read_0_data_ctrl_fuType = _io_read_0_data_T_801 | _io_read_0_data_T_795; // @[Mux.scala 27:73]
  assign io_read_0_data_ctrl_fuOpType = _io_read_0_data_T_786 | _io_read_0_data_T_780; // @[Mux.scala 27:73]
  assign io_read_0_data_ctrl_rfWen = io_read_0_addr[0] & payload_0_ctrl_rfWen | io_read_0_addr[1] & payload_1_ctrl_rfWen
     | io_read_0_addr[2] & payload_2_ctrl_rfWen | io_read_0_addr[3] & payload_3_ctrl_rfWen | io_read_0_addr[4] &
    payload_4_ctrl_rfWen | io_read_0_addr[5] & payload_5_ctrl_rfWen | io_read_0_addr[6] & payload_6_ctrl_rfWen |
    io_read_0_addr[7] & payload_7_ctrl_rfWen; // @[Mux.scala 27:73]
  assign io_read_0_data_ctrl_fpWen = io_read_0_addr[0] & payload_0_ctrl_fpWen | io_read_0_addr[1] & payload_1_ctrl_fpWen
     | io_read_0_addr[2] & payload_2_ctrl_fpWen | io_read_0_addr[3] & payload_3_ctrl_fpWen | io_read_0_addr[4] &
    payload_4_ctrl_fpWen | io_read_0_addr[5] & payload_5_ctrl_fpWen | io_read_0_addr[6] & payload_6_ctrl_fpWen |
    io_read_0_addr[7] & payload_7_ctrl_fpWen; // @[Mux.scala 27:73]
  assign io_read_0_data_pdest = _io_read_0_data_T_291 | _io_read_0_data_T_285; // @[Mux.scala 27:73]
  assign io_read_0_data_robIdx_flag = io_read_0_addr[0] & payload_0_robIdx_flag | io_read_0_addr[1] &
    payload_1_robIdx_flag | io_read_0_addr[2] & payload_2_robIdx_flag | io_read_0_addr[3] & payload_3_robIdx_flag |
    io_read_0_addr[4] & payload_4_robIdx_flag | io_read_0_addr[5] & payload_5_robIdx_flag | io_read_0_addr[6] &
    payload_6_robIdx_flag | io_read_0_addr[7] & payload_7_robIdx_flag; // @[Mux.scala 27:73]
  assign io_read_0_data_robIdx_value = _io_read_0_data_T_246 | _io_read_0_data_T_240; // @[Mux.scala 27:73]
  assign io_read_1_data_ctrl_fuType = _io_read_1_data_T_801 | _io_read_1_data_T_795; // @[Mux.scala 27:73]
  assign io_read_1_data_ctrl_fuOpType = _io_read_1_data_T_786 | _io_read_1_data_T_780; // @[Mux.scala 27:73]
  assign io_read_1_data_ctrl_rfWen = io_read_1_addr[0] & payload_0_ctrl_rfWen | io_read_1_addr[1] & payload_1_ctrl_rfWen
     | io_read_1_addr[2] & payload_2_ctrl_rfWen | io_read_1_addr[3] & payload_3_ctrl_rfWen | io_read_1_addr[4] &
    payload_4_ctrl_rfWen | io_read_1_addr[5] & payload_5_ctrl_rfWen | io_read_1_addr[6] & payload_6_ctrl_rfWen |
    io_read_1_addr[7] & payload_7_ctrl_rfWen; // @[Mux.scala 27:73]
  assign io_read_1_data_ctrl_fpWen = io_read_1_addr[0] & payload_0_ctrl_fpWen | io_read_1_addr[1] & payload_1_ctrl_fpWen
     | io_read_1_addr[2] & payload_2_ctrl_fpWen | io_read_1_addr[3] & payload_3_ctrl_fpWen | io_read_1_addr[4] &
    payload_4_ctrl_fpWen | io_read_1_addr[5] & payload_5_ctrl_fpWen | io_read_1_addr[6] & payload_6_ctrl_fpWen |
    io_read_1_addr[7] & payload_7_ctrl_fpWen; // @[Mux.scala 27:73]
  assign io_read_1_data_pdest = _io_read_1_data_T_291 | _io_read_1_data_T_285; // @[Mux.scala 27:73]
  assign io_read_1_data_robIdx_flag = io_read_1_addr[0] & payload_0_robIdx_flag | io_read_1_addr[1] &
    payload_1_robIdx_flag | io_read_1_addr[2] & payload_2_robIdx_flag | io_read_1_addr[3] & payload_3_robIdx_flag |
    io_read_1_addr[4] & payload_4_robIdx_flag | io_read_1_addr[5] & payload_5_robIdx_flag | io_read_1_addr[6] &
    payload_6_robIdx_flag | io_read_1_addr[7] & payload_7_robIdx_flag; // @[Mux.scala 27:73]
  assign io_read_1_data_robIdx_value = _io_read_1_data_T_246 | _io_read_1_data_T_240; // @[Mux.scala 27:73]
  always @(posedge clock) begin
    if (wen) begin // @[PayloadArray.scala 58:16]
      payload_0_ctrl_fuType <= wdata_ctrl_fuType; // @[PayloadArray.scala 59:18]
    end
    if (wen) begin // @[PayloadArray.scala 58:16]
      payload_0_ctrl_fuOpType <= wdata_ctrl_fuOpType; // @[PayloadArray.scala 59:18]
    end
    if (wen) begin // @[PayloadArray.scala 58:16]
      payload_0_ctrl_rfWen <= wdata_ctrl_rfWen; // @[PayloadArray.scala 59:18]
    end
    if (wen) begin // @[PayloadArray.scala 58:16]
      payload_0_ctrl_fpWen <= wdata_ctrl_fpWen; // @[PayloadArray.scala 59:18]
    end
    if (wen) begin // @[PayloadArray.scala 58:16]
      payload_0_pdest <= wdata_pdest; // @[PayloadArray.scala 59:18]
    end
    if (wen) begin // @[PayloadArray.scala 58:16]
      payload_0_robIdx_flag <= wdata_robIdx_flag; // @[PayloadArray.scala 59:18]
    end
    if (wen) begin // @[PayloadArray.scala 58:16]
      payload_0_robIdx_value <= wdata_robIdx_value; // @[PayloadArray.scala 59:18]
    end
    if (wen_1) begin // @[PayloadArray.scala 58:16]
      payload_1_ctrl_fuType <= wdata_1_ctrl_fuType; // @[PayloadArray.scala 59:18]
    end
    if (wen_1) begin // @[PayloadArray.scala 58:16]
      payload_1_ctrl_fuOpType <= wdata_1_ctrl_fuOpType; // @[PayloadArray.scala 59:18]
    end
    if (wen_1) begin // @[PayloadArray.scala 58:16]
      payload_1_ctrl_rfWen <= wdata_1_ctrl_rfWen; // @[PayloadArray.scala 59:18]
    end
    if (wen_1) begin // @[PayloadArray.scala 58:16]
      payload_1_ctrl_fpWen <= wdata_1_ctrl_fpWen; // @[PayloadArray.scala 59:18]
    end
    if (wen_1) begin // @[PayloadArray.scala 58:16]
      payload_1_pdest <= wdata_1_pdest; // @[PayloadArray.scala 59:18]
    end
    if (wen_1) begin // @[PayloadArray.scala 58:16]
      payload_1_robIdx_flag <= wdata_1_robIdx_flag; // @[PayloadArray.scala 59:18]
    end
    if (wen_1) begin // @[PayloadArray.scala 58:16]
      payload_1_robIdx_value <= wdata_1_robIdx_value; // @[PayloadArray.scala 59:18]
    end
    if (wen_2) begin // @[PayloadArray.scala 58:16]
      payload_2_ctrl_fuType <= wdata_2_ctrl_fuType; // @[PayloadArray.scala 59:18]
    end
    if (wen_2) begin // @[PayloadArray.scala 58:16]
      payload_2_ctrl_fuOpType <= wdata_2_ctrl_fuOpType; // @[PayloadArray.scala 59:18]
    end
    if (wen_2) begin // @[PayloadArray.scala 58:16]
      payload_2_ctrl_rfWen <= wdata_2_ctrl_rfWen; // @[PayloadArray.scala 59:18]
    end
    if (wen_2) begin // @[PayloadArray.scala 58:16]
      payload_2_ctrl_fpWen <= wdata_2_ctrl_fpWen; // @[PayloadArray.scala 59:18]
    end
    if (wen_2) begin // @[PayloadArray.scala 58:16]
      payload_2_pdest <= wdata_2_pdest; // @[PayloadArray.scala 59:18]
    end
    if (wen_2) begin // @[PayloadArray.scala 58:16]
      payload_2_robIdx_flag <= wdata_2_robIdx_flag; // @[PayloadArray.scala 59:18]
    end
    if (wen_2) begin // @[PayloadArray.scala 58:16]
      payload_2_robIdx_value <= wdata_2_robIdx_value; // @[PayloadArray.scala 59:18]
    end
    if (wen_3) begin // @[PayloadArray.scala 58:16]
      payload_3_ctrl_fuType <= wdata_3_ctrl_fuType; // @[PayloadArray.scala 59:18]
    end
    if (wen_3) begin // @[PayloadArray.scala 58:16]
      payload_3_ctrl_fuOpType <= wdata_3_ctrl_fuOpType; // @[PayloadArray.scala 59:18]
    end
    if (wen_3) begin // @[PayloadArray.scala 58:16]
      payload_3_ctrl_rfWen <= wdata_3_ctrl_rfWen; // @[PayloadArray.scala 59:18]
    end
    if (wen_3) begin // @[PayloadArray.scala 58:16]
      payload_3_ctrl_fpWen <= wdata_3_ctrl_fpWen; // @[PayloadArray.scala 59:18]
    end
    if (wen_3) begin // @[PayloadArray.scala 58:16]
      payload_3_pdest <= wdata_3_pdest; // @[PayloadArray.scala 59:18]
    end
    if (wen_3) begin // @[PayloadArray.scala 58:16]
      payload_3_robIdx_flag <= wdata_3_robIdx_flag; // @[PayloadArray.scala 59:18]
    end
    if (wen_3) begin // @[PayloadArray.scala 58:16]
      payload_3_robIdx_value <= wdata_3_robIdx_value; // @[PayloadArray.scala 59:18]
    end
    if (wen_4) begin // @[PayloadArray.scala 58:16]
      payload_4_ctrl_fuType <= wdata_4_ctrl_fuType; // @[PayloadArray.scala 59:18]
    end
    if (wen_4) begin // @[PayloadArray.scala 58:16]
      payload_4_ctrl_fuOpType <= wdata_4_ctrl_fuOpType; // @[PayloadArray.scala 59:18]
    end
    if (wen_4) begin // @[PayloadArray.scala 58:16]
      payload_4_ctrl_rfWen <= wdata_4_ctrl_rfWen; // @[PayloadArray.scala 59:18]
    end
    if (wen_4) begin // @[PayloadArray.scala 58:16]
      payload_4_ctrl_fpWen <= wdata_4_ctrl_fpWen; // @[PayloadArray.scala 59:18]
    end
    if (wen_4) begin // @[PayloadArray.scala 58:16]
      payload_4_pdest <= wdata_4_pdest; // @[PayloadArray.scala 59:18]
    end
    if (wen_4) begin // @[PayloadArray.scala 58:16]
      payload_4_robIdx_flag <= wdata_4_robIdx_flag; // @[PayloadArray.scala 59:18]
    end
    if (wen_4) begin // @[PayloadArray.scala 58:16]
      payload_4_robIdx_value <= wdata_4_robIdx_value; // @[PayloadArray.scala 59:18]
    end
    if (wen_5) begin // @[PayloadArray.scala 58:16]
      payload_5_ctrl_fuType <= wdata_5_ctrl_fuType; // @[PayloadArray.scala 59:18]
    end
    if (wen_5) begin // @[PayloadArray.scala 58:16]
      payload_5_ctrl_fuOpType <= wdata_5_ctrl_fuOpType; // @[PayloadArray.scala 59:18]
    end
    if (wen_5) begin // @[PayloadArray.scala 58:16]
      payload_5_ctrl_rfWen <= wdata_5_ctrl_rfWen; // @[PayloadArray.scala 59:18]
    end
    if (wen_5) begin // @[PayloadArray.scala 58:16]
      payload_5_ctrl_fpWen <= wdata_5_ctrl_fpWen; // @[PayloadArray.scala 59:18]
    end
    if (wen_5) begin // @[PayloadArray.scala 58:16]
      payload_5_pdest <= wdata_5_pdest; // @[PayloadArray.scala 59:18]
    end
    if (wen_5) begin // @[PayloadArray.scala 58:16]
      payload_5_robIdx_flag <= wdata_5_robIdx_flag; // @[PayloadArray.scala 59:18]
    end
    if (wen_5) begin // @[PayloadArray.scala 58:16]
      payload_5_robIdx_value <= wdata_5_robIdx_value; // @[PayloadArray.scala 59:18]
    end
    if (wen_6) begin // @[PayloadArray.scala 58:16]
      payload_6_ctrl_fuType <= wdata_6_ctrl_fuType; // @[PayloadArray.scala 59:18]
    end
    if (wen_6) begin // @[PayloadArray.scala 58:16]
      payload_6_ctrl_fuOpType <= wdata_6_ctrl_fuOpType; // @[PayloadArray.scala 59:18]
    end
    if (wen_6) begin // @[PayloadArray.scala 58:16]
      payload_6_ctrl_rfWen <= wdata_6_ctrl_rfWen; // @[PayloadArray.scala 59:18]
    end
    if (wen_6) begin // @[PayloadArray.scala 58:16]
      payload_6_ctrl_fpWen <= wdata_6_ctrl_fpWen; // @[PayloadArray.scala 59:18]
    end
    if (wen_6) begin // @[PayloadArray.scala 58:16]
      payload_6_pdest <= wdata_6_pdest; // @[PayloadArray.scala 59:18]
    end
    if (wen_6) begin // @[PayloadArray.scala 58:16]
      payload_6_robIdx_flag <= wdata_6_robIdx_flag; // @[PayloadArray.scala 59:18]
    end
    if (wen_6) begin // @[PayloadArray.scala 58:16]
      payload_6_robIdx_value <= wdata_6_robIdx_value; // @[PayloadArray.scala 59:18]
    end
    if (wen_7) begin // @[PayloadArray.scala 58:16]
      payload_7_ctrl_fuType <= wdata_7_ctrl_fuType; // @[PayloadArray.scala 59:18]
    end
    if (wen_7) begin // @[PayloadArray.scala 58:16]
      payload_7_ctrl_fuOpType <= wdata_7_ctrl_fuOpType; // @[PayloadArray.scala 59:18]
    end
    if (wen_7) begin // @[PayloadArray.scala 58:16]
      payload_7_ctrl_rfWen <= wdata_7_ctrl_rfWen; // @[PayloadArray.scala 59:18]
    end
    if (wen_7) begin // @[PayloadArray.scala 58:16]
      payload_7_ctrl_fpWen <= wdata_7_ctrl_fpWen; // @[PayloadArray.scala 59:18]
    end
    if (wen_7) begin // @[PayloadArray.scala 58:16]
      payload_7_pdest <= wdata_7_pdest; // @[PayloadArray.scala 59:18]
    end
    if (wen_7) begin // @[PayloadArray.scala 58:16]
      payload_7_robIdx_flag <= wdata_7_robIdx_flag; // @[PayloadArray.scala 59:18]
    end
    if (wen_7) begin // @[PayloadArray.scala 58:16]
      payload_7_robIdx_value <= wdata_7_robIdx_value; // @[PayloadArray.scala 59:18]
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
  payload_0_ctrl_fuType = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  payload_0_ctrl_fuOpType = _RAND_1[6:0];
  _RAND_2 = {1{`RANDOM}};
  payload_0_ctrl_rfWen = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  payload_0_ctrl_fpWen = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  payload_0_pdest = _RAND_4[5:0];
  _RAND_5 = {1{`RANDOM}};
  payload_0_robIdx_flag = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  payload_0_robIdx_value = _RAND_6[4:0];
  _RAND_7 = {1{`RANDOM}};
  payload_1_ctrl_fuType = _RAND_7[3:0];
  _RAND_8 = {1{`RANDOM}};
  payload_1_ctrl_fuOpType = _RAND_8[6:0];
  _RAND_9 = {1{`RANDOM}};
  payload_1_ctrl_rfWen = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  payload_1_ctrl_fpWen = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  payload_1_pdest = _RAND_11[5:0];
  _RAND_12 = {1{`RANDOM}};
  payload_1_robIdx_flag = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  payload_1_robIdx_value = _RAND_13[4:0];
  _RAND_14 = {1{`RANDOM}};
  payload_2_ctrl_fuType = _RAND_14[3:0];
  _RAND_15 = {1{`RANDOM}};
  payload_2_ctrl_fuOpType = _RAND_15[6:0];
  _RAND_16 = {1{`RANDOM}};
  payload_2_ctrl_rfWen = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  payload_2_ctrl_fpWen = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  payload_2_pdest = _RAND_18[5:0];
  _RAND_19 = {1{`RANDOM}};
  payload_2_robIdx_flag = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  payload_2_robIdx_value = _RAND_20[4:0];
  _RAND_21 = {1{`RANDOM}};
  payload_3_ctrl_fuType = _RAND_21[3:0];
  _RAND_22 = {1{`RANDOM}};
  payload_3_ctrl_fuOpType = _RAND_22[6:0];
  _RAND_23 = {1{`RANDOM}};
  payload_3_ctrl_rfWen = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  payload_3_ctrl_fpWen = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  payload_3_pdest = _RAND_25[5:0];
  _RAND_26 = {1{`RANDOM}};
  payload_3_robIdx_flag = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  payload_3_robIdx_value = _RAND_27[4:0];
  _RAND_28 = {1{`RANDOM}};
  payload_4_ctrl_fuType = _RAND_28[3:0];
  _RAND_29 = {1{`RANDOM}};
  payload_4_ctrl_fuOpType = _RAND_29[6:0];
  _RAND_30 = {1{`RANDOM}};
  payload_4_ctrl_rfWen = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  payload_4_ctrl_fpWen = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  payload_4_pdest = _RAND_32[5:0];
  _RAND_33 = {1{`RANDOM}};
  payload_4_robIdx_flag = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  payload_4_robIdx_value = _RAND_34[4:0];
  _RAND_35 = {1{`RANDOM}};
  payload_5_ctrl_fuType = _RAND_35[3:0];
  _RAND_36 = {1{`RANDOM}};
  payload_5_ctrl_fuOpType = _RAND_36[6:0];
  _RAND_37 = {1{`RANDOM}};
  payload_5_ctrl_rfWen = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  payload_5_ctrl_fpWen = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  payload_5_pdest = _RAND_39[5:0];
  _RAND_40 = {1{`RANDOM}};
  payload_5_robIdx_flag = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  payload_5_robIdx_value = _RAND_41[4:0];
  _RAND_42 = {1{`RANDOM}};
  payload_6_ctrl_fuType = _RAND_42[3:0];
  _RAND_43 = {1{`RANDOM}};
  payload_6_ctrl_fuOpType = _RAND_43[6:0];
  _RAND_44 = {1{`RANDOM}};
  payload_6_ctrl_rfWen = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  payload_6_ctrl_fpWen = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  payload_6_pdest = _RAND_46[5:0];
  _RAND_47 = {1{`RANDOM}};
  payload_6_robIdx_flag = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  payload_6_robIdx_value = _RAND_48[4:0];
  _RAND_49 = {1{`RANDOM}};
  payload_7_ctrl_fuType = _RAND_49[3:0];
  _RAND_50 = {1{`RANDOM}};
  payload_7_ctrl_fuOpType = _RAND_50[6:0];
  _RAND_51 = {1{`RANDOM}};
  payload_7_ctrl_rfWen = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  payload_7_ctrl_fpWen = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  payload_7_pdest = _RAND_53[5:0];
  _RAND_54 = {1{`RANDOM}};
  payload_7_robIdx_flag = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  payload_7_robIdx_value = _RAND_55[4:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

