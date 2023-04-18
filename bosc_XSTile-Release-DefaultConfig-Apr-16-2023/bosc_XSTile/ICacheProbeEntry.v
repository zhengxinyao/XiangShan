module ICacheProbeEntry(
  input         clock,
  input         reset,
  output        io_req_ready,
  input         io_req_valid,
  input  [35:0] io_req_bits_addr,
  input  [38:0] io_req_bits_vaddr,
  input  [1:0]  io_req_bits_param,
  input         io_req_bits_needData,
  input         io_pipe_req_ready,
  output        io_pipe_req_valid,
  output [35:0] io_pipe_req_bits_paddr,
  output [38:0] io_pipe_req_bits_vaddr,
  output [2:0]  io_pipe_req_bits_param,
  output        io_pipe_req_bits_needData
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg  state; // @[ICacheProbeUnit.scala 46:22]
  reg [35:0] req_addr; // @[ICacheProbeUnit.scala 48:16]
  reg [38:0] req_vaddr; // @[ICacheProbeUnit.scala 48:16]
  reg [1:0] req_param; // @[ICacheProbeUnit.scala 48:16]
  reg  req_needData; // @[ICacheProbeUnit.scala 48:16]
  wire  _T_1 = io_req_ready & io_req_valid; // @[Decoupled.scala 50:35]
  wire  _GEN_6 = _T_1 | state; // @[ICacheProbeUnit.scala 57:26 59:13 46:22]
  wire  _GEN_14 = ~state ? _GEN_6 : state; // @[ICacheProbeUnit.scala 46:22 55:30]
  wire  _T_3 = io_pipe_req_ready & io_pipe_req_valid; // @[Decoupled.scala 50:35]
  assign io_req_ready = ~state; // @[ICacheProbeUnit.scala 55:15]
  assign io_pipe_req_valid = state; // @[ICacheProbeUnit.scala 52:21 63:31 64:23]
  assign io_pipe_req_bits_paddr = req_addr; // @[ICacheProbeUnit.scala 63:31 68:22]
  assign io_pipe_req_bits_vaddr = req_vaddr; // @[ICacheProbeUnit.scala 63:31 69:21]
  assign io_pipe_req_bits_param = {{1'd0}, req_param};
  assign io_pipe_req_bits_needData = req_needData; // @[ICacheProbeUnit.scala 63:31 72:23]
  always @(posedge clock) begin
    if (~state) begin // @[ICacheProbeUnit.scala 55:30]
      if (_T_1) begin // @[ICacheProbeUnit.scala 57:26]
        req_addr <= io_req_bits_addr; // @[ICacheProbeUnit.scala 58:11]
      end
    end
    if (~state) begin // @[ICacheProbeUnit.scala 55:30]
      if (_T_1) begin // @[ICacheProbeUnit.scala 57:26]
        req_vaddr <= io_req_bits_vaddr; // @[ICacheProbeUnit.scala 58:11]
      end
    end
    if (~state) begin // @[ICacheProbeUnit.scala 55:30]
      if (_T_1) begin // @[ICacheProbeUnit.scala 57:26]
        req_param <= io_req_bits_param; // @[ICacheProbeUnit.scala 58:11]
      end
    end
    if (~state) begin // @[ICacheProbeUnit.scala 55:30]
      if (_T_1) begin // @[ICacheProbeUnit.scala 57:26]
        req_needData <= io_req_bits_needData; // @[ICacheProbeUnit.scala 58:11]
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[ICacheProbeUnit.scala 63:31]
      state <= 1'h0; // @[ICacheProbeUnit.scala 75:31 76:13]
    end else if (state) begin
      if (_T_3) begin
        state <= 1'h0;
      end else begin
        state <= _GEN_14;
      end
    end else begin
      state <= _GEN_14;
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
  state = _RAND_0[0:0];
  _RAND_1 = {2{`RANDOM}};
  req_addr = _RAND_1[35:0];
  _RAND_2 = {2{`RANDOM}};
  req_vaddr = _RAND_2[38:0];
  _RAND_3 = {1{`RANDOM}};
  req_param = _RAND_3[1:0];
  _RAND_4 = {1{`RANDOM}};
  req_needData = _RAND_4[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    state = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

