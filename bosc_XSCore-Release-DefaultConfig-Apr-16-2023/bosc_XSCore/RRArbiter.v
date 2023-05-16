module RRArbiter(
  input         clock,
  output        io_in_0_ready,
  input         io_in_0_valid,
  input  [35:0] io_in_0_bits_paddr,
  input  [38:0] io_in_0_bits_vaddr,
  input  [2:0]  io_in_0_bits_param,
  input         io_in_0_bits_needData,
  output        io_in_1_ready,
  input         io_in_1_valid,
  input  [35:0] io_in_1_bits_paddr,
  input  [38:0] io_in_1_bits_vaddr,
  input  [2:0]  io_in_1_bits_param,
  input         io_in_1_bits_needData,
  input         io_out_ready,
  output        io_out_valid,
  output [35:0] io_out_bits_paddr,
  output [38:0] io_out_bits_vaddr,
  output [2:0]  io_out_bits_param,
  output        io_out_bits_needData,
  output [4:0]  io_out_bits_id,
  output        io_chosen
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  _ctrl_validMask_grantMask_lastGrant_T = io_out_ready & io_out_valid; // @[Decoupled.scala 50:35]
  reg  lastGrant; // @[Reg.scala 16:16]
  wire  grantMask_1 = 1'h1 > lastGrant; // @[Arbiter.scala 82:49]
  wire  validMask_1 = io_in_1_valid & grantMask_1; // @[Arbiter.scala 83:76]
  wire  ctrl_2 = ~validMask_1; // @[Arbiter.scala 46:78]
  wire  ctrl_3 = ~(validMask_1 | io_in_0_valid); // @[Arbiter.scala 46:78]
  wire  _T_3 = grantMask_1 | ctrl_3; // @[Arbiter.scala 87:50]
  wire  _GEN_17 = io_in_0_valid ? 1'h0 : 1'h1; // @[Arbiter.scala 92:{26,35}]
  assign io_in_0_ready = ctrl_2 & io_out_ready; // @[Arbiter.scala 75:21]
  assign io_in_1_ready = _T_3 & io_out_ready; // @[Arbiter.scala 75:21]
  assign io_out_valid = io_chosen ? io_in_1_valid : io_in_0_valid; // @[Arbiter.scala 56:{16,16}]
  assign io_out_bits_paddr = io_chosen ? io_in_1_bits_paddr : io_in_0_bits_paddr; // @[Arbiter.scala 57:{15,15}]
  assign io_out_bits_vaddr = io_chosen ? io_in_1_bits_vaddr : io_in_0_bits_vaddr; // @[Arbiter.scala 57:{15,15}]
  assign io_out_bits_param = io_chosen ? io_in_1_bits_param : io_in_0_bits_param; // @[Arbiter.scala 57:{15,15}]
  assign io_out_bits_needData = io_chosen ? io_in_1_bits_needData : io_in_0_bits_needData; // @[Arbiter.scala 57:{15,15}]
  assign io_out_bits_id = io_chosen ? 5'h7 : 5'h6; // @[Arbiter.scala 57:{15,15}]
  assign io_chosen = validMask_1 | _GEN_17; // @[Arbiter.scala 94:{24,33}]
  always @(posedge clock) begin
    if (_ctrl_validMask_grantMask_lastGrant_T) begin // @[Reg.scala 17:18]
      lastGrant <= io_chosen; // @[Reg.scala 17:22]
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
  lastGrant = _RAND_0[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

