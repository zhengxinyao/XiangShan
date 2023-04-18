module SRAMTemplate_10(
  input         clock,
  input         reset,
  output        io_rreq_ready,
  input         io_rreq_valid,
  input  [4:0]  io_rreq_bits_setIdx,
  output [31:0] io_rresp_data_0,
  output [31:0] io_rresp_data_1,
  output [31:0] io_rresp_data_2,
  output [31:0] io_rresp_data_3,
  output [31:0] io_rresp_data_4,
  output [31:0] io_rresp_data_5,
  output [31:0] io_rresp_data_6,
  output [31:0] io_rresp_data_7,
  input         io_wreq_valid,
  input  [4:0]  io_wreq_bits_setIdx,
  input  [31:0] io_wreq_bits_data_0,
  input  [31:0] io_wreq_bits_data_1,
  input  [31:0] io_wreq_bits_data_2,
  input  [31:0] io_wreq_bits_data_3,
  input  [31:0] io_wreq_bits_data_4,
  input  [31:0] io_wreq_bits_data_5,
  input  [31:0] io_wreq_bits_data_6,
  input  [31:0] io_wreq_bits_data_7,
  input  [7:0]  io_wreq_bits_waymask
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
`endif // RANDOMIZE_REG_INIT
  wire [4:0] array_RW0_addr; // @[SRAMTemplate.scala 105:26]
  wire  array_RW0_en; // @[SRAMTemplate.scala 105:26]
  wire  array_RW0_clk; // @[SRAMTemplate.scala 105:26]
  wire  array_RW0_wmode; // @[SRAMTemplate.scala 105:26]
  wire [31:0] array_RW0_wdata_0; // @[SRAMTemplate.scala 105:26]
  wire [31:0] array_RW0_wdata_1; // @[SRAMTemplate.scala 105:26]
  wire [31:0] array_RW0_wdata_2; // @[SRAMTemplate.scala 105:26]
  wire [31:0] array_RW0_wdata_3; // @[SRAMTemplate.scala 105:26]
  wire [31:0] array_RW0_wdata_4; // @[SRAMTemplate.scala 105:26]
  wire [31:0] array_RW0_wdata_5; // @[SRAMTemplate.scala 105:26]
  wire [31:0] array_RW0_wdata_6; // @[SRAMTemplate.scala 105:26]
  wire [31:0] array_RW0_wdata_7; // @[SRAMTemplate.scala 105:26]
  wire [31:0] array_RW0_rdata_0; // @[SRAMTemplate.scala 105:26]
  wire [31:0] array_RW0_rdata_1; // @[SRAMTemplate.scala 105:26]
  wire [31:0] array_RW0_rdata_2; // @[SRAMTemplate.scala 105:26]
  wire [31:0] array_RW0_rdata_3; // @[SRAMTemplate.scala 105:26]
  wire [31:0] array_RW0_rdata_4; // @[SRAMTemplate.scala 105:26]
  wire [31:0] array_RW0_rdata_5; // @[SRAMTemplate.scala 105:26]
  wire [31:0] array_RW0_rdata_6; // @[SRAMTemplate.scala 105:26]
  wire [31:0] array_RW0_rdata_7; // @[SRAMTemplate.scala 105:26]
  wire  array_RW0_wmask_0; // @[SRAMTemplate.scala 105:26]
  wire  array_RW0_wmask_1; // @[SRAMTemplate.scala 105:26]
  wire  array_RW0_wmask_2; // @[SRAMTemplate.scala 105:26]
  wire  array_RW0_wmask_3; // @[SRAMTemplate.scala 105:26]
  wire  array_RW0_wmask_4; // @[SRAMTemplate.scala 105:26]
  wire  array_RW0_wmask_5; // @[SRAMTemplate.scala 105:26]
  wire  array_RW0_wmask_6; // @[SRAMTemplate.scala 105:26]
  wire  array_RW0_wmask_7; // @[SRAMTemplate.scala 105:26]
  reg  resetState; // @[SRAMTemplate.scala 109:30]
  reg [4:0] resetSet; // @[Counter.scala 62:40]
  wire  wrap_wrap = resetSet == 5'h1f; // @[Counter.scala 74:24]
  wire [4:0] _wrap_value_T_1 = resetSet + 5'h1; // @[Counter.scala 78:24]
  wire  resetFinish = resetState & wrap_wrap; // @[Counter.scala 120:{16,23}]
  wire  wen = io_wreq_valid | resetState; // @[SRAMTemplate.scala 122:52]
  wire  _realRen_T = ~wen; // @[SRAMTemplate.scala 123:41]
  wire  realRen = io_rreq_valid & ~wen; // @[SRAMTemplate.scala 123:38]
  wire [4:0] setIdx = resetState ? resetSet : io_wreq_bits_setIdx; // @[SRAMTemplate.scala 125:19]
  wire [7:0] waymask = resetState ? 8'hff : io_wreq_bits_waymask; // @[SRAMTemplate.scala 127:20]
  reg  rdata_REG; // @[SRAMTemplate.scala 153:59]
  reg [31:0] rdata_hold_data_0; // @[Reg.scala 16:16]
  reg [31:0] rdata_hold_data_1; // @[Reg.scala 16:16]
  reg [31:0] rdata_hold_data_2; // @[Reg.scala 16:16]
  reg [31:0] rdata_hold_data_3; // @[Reg.scala 16:16]
  reg [31:0] rdata_hold_data_4; // @[Reg.scala 16:16]
  reg [31:0] rdata_hold_data_5; // @[Reg.scala 16:16]
  reg [31:0] rdata_hold_data_6; // @[Reg.scala 16:16]
  reg [31:0] rdata_hold_data_7; // @[Reg.scala 16:16]
  array_1 array ( // @[SRAMTemplate.scala 105:26]
    .RW0_addr(array_RW0_addr),
    .RW0_en(array_RW0_en),
    .RW0_clk(array_RW0_clk),
    .RW0_wmode(array_RW0_wmode),
    .RW0_wdata_0(array_RW0_wdata_0),
    .RW0_wdata_1(array_RW0_wdata_1),
    .RW0_wdata_2(array_RW0_wdata_2),
    .RW0_wdata_3(array_RW0_wdata_3),
    .RW0_wdata_4(array_RW0_wdata_4),
    .RW0_wdata_5(array_RW0_wdata_5),
    .RW0_wdata_6(array_RW0_wdata_6),
    .RW0_wdata_7(array_RW0_wdata_7),
    .RW0_rdata_0(array_RW0_rdata_0),
    .RW0_rdata_1(array_RW0_rdata_1),
    .RW0_rdata_2(array_RW0_rdata_2),
    .RW0_rdata_3(array_RW0_rdata_3),
    .RW0_rdata_4(array_RW0_rdata_4),
    .RW0_rdata_5(array_RW0_rdata_5),
    .RW0_rdata_6(array_RW0_rdata_6),
    .RW0_rdata_7(array_RW0_rdata_7),
    .RW0_wmask_0(array_RW0_wmask_0),
    .RW0_wmask_1(array_RW0_wmask_1),
    .RW0_wmask_2(array_RW0_wmask_2),
    .RW0_wmask_3(array_RW0_wmask_3),
    .RW0_wmask_4(array_RW0_wmask_4),
    .RW0_wmask_5(array_RW0_wmask_5),
    .RW0_wmask_6(array_RW0_wmask_6),
    .RW0_wmask_7(array_RW0_wmask_7)
  );
  assign io_rreq_ready = ~resetState & _realRen_T; // @[SRAMTemplate.scala 157:33]
  assign io_rresp_data_0 = rdata_REG ? array_RW0_rdata_0 : rdata_hold_data_0; // @[Hold.scala 25:8]
  assign io_rresp_data_1 = rdata_REG ? array_RW0_rdata_1 : rdata_hold_data_1; // @[Hold.scala 25:8]
  assign io_rresp_data_2 = rdata_REG ? array_RW0_rdata_2 : rdata_hold_data_2; // @[Hold.scala 25:8]
  assign io_rresp_data_3 = rdata_REG ? array_RW0_rdata_3 : rdata_hold_data_3; // @[Hold.scala 25:8]
  assign io_rresp_data_4 = rdata_REG ? array_RW0_rdata_4 : rdata_hold_data_4; // @[Hold.scala 25:8]
  assign io_rresp_data_5 = rdata_REG ? array_RW0_rdata_5 : rdata_hold_data_5; // @[Hold.scala 25:8]
  assign io_rresp_data_6 = rdata_REG ? array_RW0_rdata_6 : rdata_hold_data_6; // @[Hold.scala 25:8]
  assign io_rresp_data_7 = rdata_REG ? array_RW0_rdata_7 : rdata_hold_data_7; // @[Hold.scala 25:8]
  assign array_RW0_clk = clock; // @[SRAMTemplate.scala 128:14]
  assign array_RW0_wdata_0 = resetState ? 32'h0 : io_wreq_bits_data_0; // @[SRAMTemplate.scala 126:26]
  assign array_RW0_wdata_1 = resetState ? 32'h0 : io_wreq_bits_data_1; // @[SRAMTemplate.scala 126:26]
  assign array_RW0_wdata_2 = resetState ? 32'h0 : io_wreq_bits_data_2; // @[SRAMTemplate.scala 126:26]
  assign array_RW0_wdata_3 = resetState ? 32'h0 : io_wreq_bits_data_3; // @[SRAMTemplate.scala 126:26]
  assign array_RW0_wdata_4 = resetState ? 32'h0 : io_wreq_bits_data_4; // @[SRAMTemplate.scala 126:26]
  assign array_RW0_wdata_5 = resetState ? 32'h0 : io_wreq_bits_data_5; // @[SRAMTemplate.scala 126:26]
  assign array_RW0_wdata_6 = resetState ? 32'h0 : io_wreq_bits_data_6; // @[SRAMTemplate.scala 126:26]
  assign array_RW0_wdata_7 = resetState ? 32'h0 : io_wreq_bits_data_7; // @[SRAMTemplate.scala 126:26]
  assign array_RW0_wmask_0 = waymask[0]; // @[SRAMTemplate.scala 128:51]
  assign array_RW0_wmask_1 = waymask[1]; // @[SRAMTemplate.scala 128:51]
  assign array_RW0_wmask_2 = waymask[2]; // @[SRAMTemplate.scala 128:51]
  assign array_RW0_wmask_3 = waymask[3]; // @[SRAMTemplate.scala 128:51]
  assign array_RW0_wmask_4 = waymask[4]; // @[SRAMTemplate.scala 128:51]
  assign array_RW0_wmask_5 = waymask[5]; // @[SRAMTemplate.scala 128:51]
  assign array_RW0_wmask_6 = waymask[6]; // @[SRAMTemplate.scala 128:51]
  assign array_RW0_wmask_7 = waymask[7]; // @[SRAMTemplate.scala 128:51]
  assign array_RW0_en = realRen | wen;
  assign array_RW0_wmode = io_wreq_valid | resetState; // @[SRAMTemplate.scala 122:52]
  assign array_RW0_addr = wen ? setIdx : io_rreq_bits_setIdx;
  always @(posedge clock) begin
    rdata_REG <= io_rreq_valid & ~wen; // @[SRAMTemplate.scala 123:38]
    if (rdata_REG) begin // @[Reg.scala 17:18]
      rdata_hold_data_0 <= array_RW0_rdata_0; // @[Reg.scala 17:22]
    end
    if (rdata_REG) begin // @[Reg.scala 17:18]
      rdata_hold_data_1 <= array_RW0_rdata_1; // @[Reg.scala 17:22]
    end
    if (rdata_REG) begin // @[Reg.scala 17:18]
      rdata_hold_data_2 <= array_RW0_rdata_2; // @[Reg.scala 17:22]
    end
    if (rdata_REG) begin // @[Reg.scala 17:18]
      rdata_hold_data_3 <= array_RW0_rdata_3; // @[Reg.scala 17:22]
    end
    if (rdata_REG) begin // @[Reg.scala 17:18]
      rdata_hold_data_4 <= array_RW0_rdata_4; // @[Reg.scala 17:22]
    end
    if (rdata_REG) begin // @[Reg.scala 17:18]
      rdata_hold_data_5 <= array_RW0_rdata_5; // @[Reg.scala 17:22]
    end
    if (rdata_REG) begin // @[Reg.scala 17:18]
      rdata_hold_data_6 <= array_RW0_rdata_6; // @[Reg.scala 17:22]
    end
    if (rdata_REG) begin // @[Reg.scala 17:18]
      rdata_hold_data_7 <= array_RW0_rdata_7; // @[Reg.scala 17:22]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[SRAMTemplate.scala 111:24]
      resetState <= 1'h1; // @[SRAMTemplate.scala 111:38]
    end else if (resetFinish) begin // @[SRAMTemplate.scala 109:30]
      resetState <= 1'h0;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Counter.scala 120:16]
      resetSet <= 5'h0; // @[Counter.scala 78:15]
    end else if (resetState) begin // @[Counter.scala 62:40]
      resetSet <= _wrap_value_T_1;
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
  resetState = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  resetSet = _RAND_1[4:0];
  _RAND_2 = {1{`RANDOM}};
  rdata_REG = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  rdata_hold_data_0 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  rdata_hold_data_1 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  rdata_hold_data_2 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  rdata_hold_data_3 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  rdata_hold_data_4 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  rdata_hold_data_5 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  rdata_hold_data_6 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  rdata_hold_data_7 = _RAND_10[31:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    resetState = 1'h1;
  end
  if (reset) begin
    resetSet = 5'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

