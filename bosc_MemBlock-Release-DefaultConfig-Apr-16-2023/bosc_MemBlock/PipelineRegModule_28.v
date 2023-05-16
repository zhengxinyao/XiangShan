module PipelineRegModule_28(
  input         clock,
  input         reset,
  output        io_in_ready,
  input         io_in_valid,
  input  [63:0] io_in_bits_data,
  output        io_out_valid,
  output [63:0] io_out_bits_data
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg  pipeline_reg_valid; // @[MemCommon.scala 381:24]
  wire  _GEN_0 = io_out_valid ? 1'h0 : pipeline_reg_valid; // @[MemCommon.scala 381:24 383:{26,34}]
  wire  _T_1 = io_in_ready & io_in_valid; // @[Decoupled.scala 50:35]
  reg [63:0] io_out_bits_rdata; // @[Reg.scala 16:16]
  assign io_in_ready = 1'h1; // @[MemCommon.scala 387:27]
  assign io_out_valid = pipeline_reg_valid; // @[MemCommon.scala 389:18]
  assign io_out_bits_data = io_out_bits_rdata; // @[MemCommon.scala 388:17]
  always @(posedge clock) begin
    if (_T_1) begin // @[Reg.scala 17:18]
      io_out_bits_rdata <= io_in_bits_data; // @[Reg.scala 17:22]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MemCommon.scala 384:25]
      pipeline_reg_valid <= 1'h0; // @[MemCommon.scala 384:33]
    end else begin
      pipeline_reg_valid <= _T_1 | _GEN_0;
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
  pipeline_reg_valid = _RAND_0[0:0];
  _RAND_1 = {2{`RANDOM}};
  io_out_bits_rdata = _RAND_1[63:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    pipeline_reg_valid = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

