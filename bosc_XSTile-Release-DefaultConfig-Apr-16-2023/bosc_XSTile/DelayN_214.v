module DelayN_214(
  input   clock,
  input   io_in_0,
  input   io_in_1,
  input   io_in_2,
  output  io_out_0,
  output  io_out_1,
  output  io_out_2
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg  out_0; // @[Hold.scala 90:18]
  reg  out_1; // @[Hold.scala 90:18]
  reg  out_2; // @[Hold.scala 90:18]
  assign io_out_0 = out_0; // @[Hold.scala 92:10]
  assign io_out_1 = out_1; // @[Hold.scala 92:10]
  assign io_out_2 = out_2; // @[Hold.scala 92:10]
  always @(posedge clock) begin
    out_0 <= io_in_0; // @[Hold.scala 90:18]
    out_1 <= io_in_1; // @[Hold.scala 90:18]
    out_2 <= io_in_2; // @[Hold.scala 90:18]
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
  out_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  out_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  out_2 = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

