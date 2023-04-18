module DataSRAM(
  input         clock,
  input         io_wen,
  input  [63:0] io_waddr,
  input  [63:0] io_wdata,
  input         io_ren,
  input  [63:0] io_raddr,
  output [63:0] io_rdata
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire  data_sram_clock; // @[BankedDataArray.scala 198:27]
  wire  data_sram_io_rreq_valid; // @[BankedDataArray.scala 198:27]
  wire [5:0] data_sram_io_rreq_bits_setIdx; // @[BankedDataArray.scala 198:27]
  wire [63:0] data_sram_io_rresp_data_0; // @[BankedDataArray.scala 198:27]
  wire  data_sram_io_wreq_valid; // @[BankedDataArray.scala 198:27]
  wire [5:0] data_sram_io_wreq_bits_setIdx; // @[BankedDataArray.scala 198:27]
  wire [63:0] data_sram_io_wreq_bits_data_0; // @[BankedDataArray.scala 198:27]
  reg  wenReg; // @[BankedDataArray.scala 207:25]
  reg [63:0] waddrReg; // @[BankedDataArray.scala 208:27]
  reg [63:0] wdataReg; // @[BankedDataArray.scala 209:27]
  SRAMTemplate_70 data_sram ( // @[BankedDataArray.scala 198:27]
    .clock(data_sram_clock),
    .io_rreq_valid(data_sram_io_rreq_valid),
    .io_rreq_bits_setIdx(data_sram_io_rreq_bits_setIdx),
    .io_rresp_data_0(data_sram_io_rresp_data_0),
    .io_wreq_valid(data_sram_io_wreq_valid),
    .io_wreq_bits_setIdx(data_sram_io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(data_sram_io_wreq_bits_data_0)
  );
  assign io_rdata = data_sram_io_rresp_data_0; // @[BankedDataArray.scala 218:15]
  assign data_sram_clock = clock;
  assign data_sram_io_rreq_valid = io_ren; // @[BankedDataArray.scala 216:30]
  assign data_sram_io_rreq_bits_setIdx = io_raddr[5:0]; // @[SRAMTemplate.scala 42:17]
  assign data_sram_io_wreq_valid = wenReg; // @[BankedDataArray.scala 210:30]
  assign data_sram_io_wreq_bits_setIdx = waddrReg[5:0]; // @[SRAMTemplate.scala 42:17]
  assign data_sram_io_wreq_bits_data_0 = wdataReg; // @[SRAMTemplate.scala 59:{18,18}]
  always @(posedge clock) begin
    wenReg <= io_wen; // @[BankedDataArray.scala 207:25]
    waddrReg <= io_waddr; // @[BankedDataArray.scala 208:27]
    wdataReg <= io_wdata; // @[BankedDataArray.scala 209:27]
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
  wenReg = _RAND_0[0:0];
  _RAND_1 = {2{`RANDOM}};
  waddrReg = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  wdataReg = _RAND_2[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

