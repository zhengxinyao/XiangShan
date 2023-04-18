module CorrectTable(
  input        clock,
  input  [9:0] io_issue_0_req_addr,
  output       io_issue_0_resp_strict,
  input  [9:0] io_issue_1_req_addr,
  output       io_issue_1_resp_strict,
  input        io_update_0_valid,
  input  [9:0] io_update_0_bits_addr,
  input        io_update_0_bits_strict,
  input        io_update_0_bits_violation,
  input        io_update_1_valid,
  input  [9:0] io_update_1_bits_addr,
  input        io_update_1_bits_strict,
  input        io_update_1_bits_violation,
  input        io_update_2_valid,
  input  [9:0] io_update_2_bits_addr
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
`endif // RANDOMIZE_REG_INIT
  wire  table__clock; // @[StoreSet.scala 351:21]
  wire [9:0] table__io_raddr_0; // @[StoreSet.scala 351:21]
  wire [9:0] table__io_raddr_1; // @[StoreSet.scala 351:21]
  wire [1:0] table__io_rdata_0; // @[StoreSet.scala 351:21]
  wire [1:0] table__io_rdata_1; // @[StoreSet.scala 351:21]
  wire  table__io_wen_0; // @[StoreSet.scala 351:21]
  wire [9:0] table__io_waddr_0; // @[StoreSet.scala 351:21]
  wire [9:0] table__io_waddr_1; // @[StoreSet.scala 351:21]
  wire [1:0] table__io_wdata_0; // @[StoreSet.scala 351:21]
  wire [1:0] table__io_wdata_1; // @[StoreSet.scala 351:21]
  wire  updateVec_0_valid = io_update_2_valid ? io_update_2_valid : io_update_0_valid; // @[StoreSet.scala 414:26]
  wire [9:0] updateVec_0_bits_addr = io_update_2_valid ? io_update_2_bits_addr : io_update_0_bits_addr; // @[StoreSet.scala 414:26]
  wire  updateVec_0_bits_strict = io_update_2_valid | io_update_0_bits_strict; // @[StoreSet.scala 414:26]
  wire  updateVec_0_bits_violation = io_update_2_valid | io_update_0_bits_violation; // @[StoreSet.scala 414:26]
  reg  s1_mempred_update_req_valids_0; // @[StoreSet.scala 420:45]
  reg  s1_mempred_update_req_valids_1; // @[StoreSet.scala 420:45]
  reg  s2_mempred_update_req_valids_0; // @[StoreSet.scala 421:45]
  reg  s2_mempred_update_req_valids_1; // @[StoreSet.scala 421:45]
  reg [9:0] s1_mempred_update_req_addr; // @[Reg.scala 16:16]
  reg  s1_mempred_update_req_strict; // @[Reg.scala 16:16]
  reg  s1_mempred_update_req_violation; // @[Reg.scala 16:16]
  reg [9:0] s2_mempred_update_req_addr; // @[Reg.scala 16:16]
  reg  s2_mempred_update_req_strict; // @[Reg.scala 16:16]
  reg  s2_mempred_update_req_violation; // @[Reg.scala 16:16]
  reg [1:0] s2_oldPred; // @[Reg.scala 16:16]
  wire [1:0] _GEN_32 = {{1'd0}, s2_oldPred != 2'h3}; // @[StoreSet.scala 439:76]
  wire [1:0] _s2_mempred_newpred_T_2 = s2_oldPred + _GEN_32; // @[StoreSet.scala 439:76]
  wire [1:0] _GEN_33 = {{1'd0}, s2_oldPred != 2'h0}; // @[StoreSet.scala 439:111]
  wire [1:0] _s2_mempred_newpred_T_5 = s2_oldPred - _GEN_33; // @[StoreSet.scala 439:111]
  wire [1:0] _s2_mempred_newpred_T_6 = s2_mempred_update_req_strict ? _s2_mempred_newpred_T_2 : _s2_mempred_newpred_T_5; // @[StoreSet.scala 439:34]
  reg [9:0] s1_mempred_update_req_1_addr; // @[Reg.scala 16:16]
  reg  s1_mempred_update_req_1_strict; // @[Reg.scala 16:16]
  reg  s1_mempred_update_req_1_violation; // @[Reg.scala 16:16]
  reg [9:0] s2_mempred_update_req_1_addr; // @[Reg.scala 16:16]
  reg  s2_mempred_update_req_1_strict; // @[Reg.scala 16:16]
  reg  s2_mempred_update_req_1_violation; // @[Reg.scala 16:16]
  reg [1:0] s2_oldPred_1; // @[Reg.scala 16:16]
  wire [1:0] _GEN_34 = {{1'd0}, s2_oldPred_1 != 2'h3}; // @[StoreSet.scala 439:76]
  wire [1:0] _s2_mempred_newpred_T_9 = s2_oldPred_1 + _GEN_34; // @[StoreSet.scala 439:76]
  wire [1:0] _GEN_35 = {{1'd0}, s2_oldPred_1 != 2'h0}; // @[StoreSet.scala 439:111]
  wire [1:0] _s2_mempred_newpred_T_12 = s2_oldPred_1 - _GEN_35; // @[StoreSet.scala 439:111]
  wire [1:0] _s2_mempred_newpred_T_13 = s2_mempred_update_req_1_strict ? _s2_mempred_newpred_T_9 :
    _s2_mempred_newpred_T_12; // @[StoreSet.scala 439:34]
  SyncDataModuleTemplate__1024entry table_ ( // @[StoreSet.scala 351:21]
    .clock(table__clock),
    .io_raddr_0(table__io_raddr_0),
    .io_raddr_1(table__io_raddr_1),
    .io_rdata_0(table__io_rdata_0),
    .io_rdata_1(table__io_rdata_1),
    .io_wen_0(table__io_wen_0),
    .io_waddr_0(table__io_waddr_0),
    .io_waddr_1(table__io_waddr_1),
    .io_wdata_0(table__io_wdata_0),
    .io_wdata_1(table__io_wdata_1)
  );
  assign io_issue_0_resp_strict = table__io_rdata_0[1]; // @[StoreSet.scala 401:36]
  assign io_issue_1_resp_strict = table__io_rdata_1[1]; // @[StoreSet.scala 401:36]
  assign table__clock = clock;
  assign table__io_raddr_0 = updateVec_0_valid ? updateVec_0_bits_addr : io_issue_0_req_addr; // @[StoreSet.scala 398:23 427:25 428:52]
  assign table__io_raddr_1 = io_update_1_valid ? io_update_1_bits_addr : io_issue_1_req_addr; // @[StoreSet.scala 398:23 427:25 428:52]
  assign table__io_wen_0 = s2_mempred_update_req_valids_1 & s2_mempred_update_req_valids_0 & table__io_waddr_1 ==
    table__io_waddr_0 ? 1'h0 : 1'h1; // @[StoreSet.scala 450:124 406:24 451:25]
  assign table__io_waddr_0 = s2_mempred_update_req_addr; // @[StoreSet.scala 407:26]
  assign table__io_waddr_1 = s2_mempred_update_req_1_addr; // @[StoreSet.scala 407:26]
  assign table__io_wdata_0 = s2_mempred_update_req_violation ? 2'h3 : _s2_mempred_newpred_T_6; // @[StoreSet.scala 438:33]
  assign table__io_wdata_1 = s2_mempred_update_req_1_violation ? 2'h3 : _s2_mempred_newpred_T_13; // @[StoreSet.scala 438:33]
  always @(posedge clock) begin
    if (io_update_2_valid) begin // @[StoreSet.scala 414:26]
      s1_mempred_update_req_valids_0 <= io_update_2_valid;
    end else begin
      s1_mempred_update_req_valids_0 <= io_update_0_valid;
    end
    s1_mempred_update_req_valids_1 <= io_update_1_valid; // @[StoreSet.scala 411:23 416:20]
    s2_mempred_update_req_valids_0 <= s1_mempred_update_req_valids_0; // @[StoreSet.scala 421:45]
    s2_mempred_update_req_valids_1 <= s1_mempred_update_req_valids_1; // @[StoreSet.scala 421:45]
    if (updateVec_0_valid) begin // @[Reg.scala 17:18]
      if (io_update_2_valid) begin // @[StoreSet.scala 414:26]
        s1_mempred_update_req_addr <= io_update_2_bits_addr;
      end else begin
        s1_mempred_update_req_addr <= io_update_0_bits_addr;
      end
    end
    if (updateVec_0_valid) begin // @[Reg.scala 17:18]
      s1_mempred_update_req_strict <= updateVec_0_bits_strict; // @[Reg.scala 17:22]
    end
    if (updateVec_0_valid) begin // @[Reg.scala 17:18]
      s1_mempred_update_req_violation <= updateVec_0_bits_violation; // @[Reg.scala 17:22]
    end
    if (s1_mempred_update_req_valids_0) begin // @[Reg.scala 17:18]
      s2_mempred_update_req_addr <= s1_mempred_update_req_addr; // @[Reg.scala 17:22]
    end
    if (s1_mempred_update_req_valids_0) begin // @[Reg.scala 17:18]
      s2_mempred_update_req_strict <= s1_mempred_update_req_strict; // @[Reg.scala 17:22]
    end
    if (s1_mempred_update_req_valids_0) begin // @[Reg.scala 17:18]
      s2_mempred_update_req_violation <= s1_mempred_update_req_violation; // @[Reg.scala 17:22]
    end
    if (s1_mempred_update_req_valids_0) begin // @[Reg.scala 17:18]
      s2_oldPred <= table__io_rdata_0; // @[Reg.scala 17:22]
    end
    if (io_update_1_valid) begin // @[Reg.scala 17:18]
      s1_mempred_update_req_1_addr <= io_update_1_bits_addr; // @[Reg.scala 17:22]
    end
    if (io_update_1_valid) begin // @[Reg.scala 17:18]
      s1_mempred_update_req_1_strict <= io_update_1_bits_strict; // @[Reg.scala 17:22]
    end
    if (io_update_1_valid) begin // @[Reg.scala 17:18]
      s1_mempred_update_req_1_violation <= io_update_1_bits_violation; // @[Reg.scala 17:22]
    end
    if (s1_mempred_update_req_valids_1) begin // @[Reg.scala 17:18]
      s2_mempred_update_req_1_addr <= s1_mempred_update_req_1_addr; // @[Reg.scala 17:22]
    end
    if (s1_mempred_update_req_valids_1) begin // @[Reg.scala 17:18]
      s2_mempred_update_req_1_strict <= s1_mempred_update_req_1_strict; // @[Reg.scala 17:22]
    end
    if (s1_mempred_update_req_valids_1) begin // @[Reg.scala 17:18]
      s2_mempred_update_req_1_violation <= s1_mempred_update_req_1_violation; // @[Reg.scala 17:22]
    end
    if (s1_mempred_update_req_valids_1) begin // @[Reg.scala 17:18]
      s2_oldPred_1 <= table__io_rdata_1; // @[Reg.scala 17:22]
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
  s1_mempred_update_req_valids_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  s1_mempred_update_req_valids_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  s2_mempred_update_req_valids_0 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  s2_mempred_update_req_valids_1 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  s1_mempred_update_req_addr = _RAND_4[9:0];
  _RAND_5 = {1{`RANDOM}};
  s1_mempred_update_req_strict = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  s1_mempred_update_req_violation = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  s2_mempred_update_req_addr = _RAND_7[9:0];
  _RAND_8 = {1{`RANDOM}};
  s2_mempred_update_req_strict = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  s2_mempred_update_req_violation = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  s2_oldPred = _RAND_10[1:0];
  _RAND_11 = {1{`RANDOM}};
  s1_mempred_update_req_1_addr = _RAND_11[9:0];
  _RAND_12 = {1{`RANDOM}};
  s1_mempred_update_req_1_strict = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  s1_mempred_update_req_1_violation = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  s2_mempred_update_req_1_addr = _RAND_14[9:0];
  _RAND_15 = {1{`RANDOM}};
  s2_mempred_update_req_1_strict = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  s2_mempred_update_req_1_violation = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  s2_oldPred_1 = _RAND_17[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

