module VlExcSignal(
  input         clock,
  input         reset,
  output        io_vecloadRegIn_0_valid,
  output [4:0]  io_vecloadRegIn_0_bits_uop_robIdx_value,
  output [38:0] io_vecloadRegIn_0_bits_baseaddr,
  output        io_vecloadRegIn_1_valid,
  output [4:0]  io_vecloadRegIn_1_bits_uop_robIdx_value,
  output [38:0] io_vecloadRegIn_1_bits_baseaddr
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  state_0_delay_clock; // @[Hold.scala 97:23]
  wire [1:0] state_0_delay_io_in; // @[Hold.scala 97:23]
  wire [1:0] state_0_delay_io_out; // @[Hold.scala 97:23]
  wire  state_0_delay_1_clock; // @[Hold.scala 97:23]
  wire [1:0] state_0_delay_1_io_in; // @[Hold.scala 97:23]
  wire [1:0] state_0_delay_1_io_out; // @[Hold.scala 97:23]
  wire  state_0_delay_2_clock; // @[Hold.scala 97:23]
  wire [1:0] state_0_delay_2_io_in; // @[Hold.scala 97:23]
  wire [1:0] state_0_delay_2_io_out; // @[Hold.scala 97:23]
  wire  state_0_delay_3_clock; // @[Hold.scala 97:23]
  wire [1:0] state_0_delay_3_io_in; // @[Hold.scala 97:23]
  wire [1:0] state_0_delay_3_io_out; // @[Hold.scala 97:23]
  wire  state_1_delay_clock; // @[Hold.scala 97:23]
  wire [1:0] state_1_delay_io_in; // @[Hold.scala 97:23]
  wire [1:0] state_1_delay_io_out; // @[Hold.scala 97:23]
  wire  state_1_delay_1_clock; // @[Hold.scala 97:23]
  wire [1:0] state_1_delay_1_io_in; // @[Hold.scala 97:23]
  wire [1:0] state_1_delay_1_io_out; // @[Hold.scala 97:23]
  wire  state_1_delay_2_clock; // @[Hold.scala 97:23]
  wire [1:0] state_1_delay_2_io_in; // @[Hold.scala 97:23]
  wire [1:0] state_1_delay_2_io_out; // @[Hold.scala 97:23]
  wire  state_1_delay_3_clock; // @[Hold.scala 97:23]
  wire [1:0] state_1_delay_3_io_in; // @[Hold.scala 97:23]
  wire [1:0] state_1_delay_3_io_out; // @[Hold.scala 97:23]
  reg [1:0] state_0; // @[VlExcSignal.scala 44:24]
  reg [1:0] state_1; // @[VlExcSignal.scala 45:24]
  reg [63:0] loadRegIn_valid_0_lfsr; // @[LFSR64.scala 27:33]
  wire  loadRegIn_valid_0_xor = loadRegIn_valid_0_lfsr[0] ^ loadRegIn_valid_0_lfsr[1] ^ loadRegIn_valid_0_lfsr[3] ^
    loadRegIn_valid_0_lfsr[4]; // @[LFSR64.scala 29:43]
  wire [63:0] _loadRegIn_valid_0_lfsr_T_2 = {loadRegIn_valid_0_xor,loadRegIn_valid_0_lfsr[63:1]}; // @[Cat.scala 31:58]
  wire [31:0] _GEN_16 = 2'h2 == state_0 ? 32'h80001020 : 32'h80001030; // @[VlExcSignal.scala 57:20 101:32]
  wire [4:0] _GEN_20 = 2'h2 == state_0 ? 5'h12 : 5'h13; // @[VlExcSignal.scala 57:20 112:39]
  wire [31:0] _GEN_26 = 2'h1 == state_0 ? 32'h80001010 : _GEN_16; // @[VlExcSignal.scala 57:20 81:32]
  wire [4:0] _GEN_30 = 2'h1 == state_0 ? 5'h11 : _GEN_20; // @[VlExcSignal.scala 57:20 92:39]
  wire [31:0] _GEN_35 = 2'h0 == state_0 ? 32'h80001000 : _GEN_26; // @[VlExcSignal.scala 57:20 61:32]
  reg [63:0] loadRegIn_valid_1_lfsr; // @[LFSR64.scala 27:33]
  wire  loadRegIn_valid_1_xor = loadRegIn_valid_1_lfsr[0] ^ loadRegIn_valid_1_lfsr[1] ^ loadRegIn_valid_1_lfsr[3] ^
    loadRegIn_valid_1_lfsr[4]; // @[LFSR64.scala 29:43]
  wire [63:0] _loadRegIn_valid_1_lfsr_T_2 = {loadRegIn_valid_1_xor,loadRegIn_valid_1_lfsr[63:1]}; // @[Cat.scala 31:58]
  wire [31:0] _GEN_59 = 2'h2 == state_1 ? 32'h80001120 : 32'h80001130; // @[VlExcSignal.scala 141:20 186:30]
  wire [6:0] _GEN_63 = 2'h2 == state_1 ? 7'h40 : 7'h43; // @[VlExcSignal.scala 141:20 197:37]
  wire [31:0] _GEN_68 = 2'h1 == state_1 ? 32'h80001110 : _GEN_59; // @[VlExcSignal.scala 141:20 166:30]
  wire [6:0] _GEN_72 = 2'h1 == state_1 ? 7'h41 : _GEN_63; // @[VlExcSignal.scala 141:20 177:37]
  wire [31:0] _GEN_77 = 2'h0 == state_1 ? 32'h80001100 : _GEN_68; // @[VlExcSignal.scala 141:20 146:30]
  wire [6:0] _GEN_81 = 2'h0 == state_1 ? 7'h42 : _GEN_72; // @[VlExcSignal.scala 141:20 157:37]
  DelayN_34 state_0_delay ( // @[Hold.scala 97:23]
    .clock(state_0_delay_clock),
    .io_in(state_0_delay_io_in),
    .io_out(state_0_delay_io_out)
  );
  DelayN_34 state_0_delay_1 ( // @[Hold.scala 97:23]
    .clock(state_0_delay_1_clock),
    .io_in(state_0_delay_1_io_in),
    .io_out(state_0_delay_1_io_out)
  );
  DelayN_34 state_0_delay_2 ( // @[Hold.scala 97:23]
    .clock(state_0_delay_2_clock),
    .io_in(state_0_delay_2_io_in),
    .io_out(state_0_delay_2_io_out)
  );
  DelayN_34 state_0_delay_3 ( // @[Hold.scala 97:23]
    .clock(state_0_delay_3_clock),
    .io_in(state_0_delay_3_io_in),
    .io_out(state_0_delay_3_io_out)
  );
  DelayN_34 state_1_delay ( // @[Hold.scala 97:23]
    .clock(state_1_delay_clock),
    .io_in(state_1_delay_io_in),
    .io_out(state_1_delay_io_out)
  );
  DelayN_34 state_1_delay_1 ( // @[Hold.scala 97:23]
    .clock(state_1_delay_1_clock),
    .io_in(state_1_delay_1_io_in),
    .io_out(state_1_delay_1_io_out)
  );
  DelayN_34 state_1_delay_2 ( // @[Hold.scala 97:23]
    .clock(state_1_delay_2_clock),
    .io_in(state_1_delay_2_io_in),
    .io_out(state_1_delay_2_io_out)
  );
  DelayN_34 state_1_delay_3 ( // @[Hold.scala 97:23]
    .clock(state_1_delay_3_clock),
    .io_in(state_1_delay_3_io_in),
    .io_out(state_1_delay_3_io_out)
  );
  assign io_vecloadRegIn_0_valid = 2'h0 == state_0 ? loadRegIn_valid_0_lfsr[3:0] == 4'h0 : 1'h1; // @[VlExcSignal.scala 57:20 59:32]
  assign io_vecloadRegIn_0_bits_uop_robIdx_value = 2'h0 == state_0 ? 5'h10 : _GEN_30; // @[VlExcSignal.scala 57:20 72:39]
  assign io_vecloadRegIn_0_bits_baseaddr = {{7'd0}, _GEN_35}; // @[VlExcSignal.scala 20:23]
  assign io_vecloadRegIn_1_valid = 2'h0 == state_1 ? loadRegIn_valid_1_lfsr[4:0] == 5'h0 : 1'h1; // @[VlExcSignal.scala 141:20 144:30]
  assign io_vecloadRegIn_1_bits_uop_robIdx_value = _GEN_81[4:0]; // @[VlExcSignal.scala 20:23]
  assign io_vecloadRegIn_1_bits_baseaddr = {{7'd0}, _GEN_77}; // @[VlExcSignal.scala 20:23]
  assign state_0_delay_clock = clock;
  assign state_0_delay_io_in = 2'h1; // @[Hold.scala 98:17]
  assign state_0_delay_1_clock = clock;
  assign state_0_delay_1_io_in = 2'h2; // @[Hold.scala 98:17]
  assign state_0_delay_2_clock = clock;
  assign state_0_delay_2_io_in = 2'h3; // @[Hold.scala 98:17]
  assign state_0_delay_3_clock = clock;
  assign state_0_delay_3_io_in = 2'h0; // @[Hold.scala 98:17]
  assign state_1_delay_clock = clock;
  assign state_1_delay_io_in = 2'h1; // @[Hold.scala 98:17]
  assign state_1_delay_1_clock = clock;
  assign state_1_delay_1_io_in = 2'h2; // @[Hold.scala 98:17]
  assign state_1_delay_2_clock = clock;
  assign state_1_delay_2_io_in = 2'h3; // @[Hold.scala 98:17]
  assign state_1_delay_3_clock = clock;
  assign state_1_delay_3_io_in = 2'h0; // @[Hold.scala 98:17]
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[VlExcSignal.scala 57:20]
      state_0 <= 2'h0; // @[VlExcSignal.scala 75:15]
    end else if (2'h0 == state_0) begin // @[VlExcSignal.scala 57:20]
      state_0 <= state_0_delay_io_out; // @[VlExcSignal.scala 95:15]
    end else if (2'h1 == state_0) begin // @[VlExcSignal.scala 57:20]
      state_0 <= state_0_delay_1_io_out; // @[VlExcSignal.scala 115:15]
    end else if (2'h2 == state_0) begin // @[VlExcSignal.scala 57:20]
      state_0 <= state_0_delay_2_io_out; // @[VlExcSignal.scala 135:15]
    end else if (2'h3 == state_0) begin // @[VlExcSignal.scala 44:24]
      state_0 <= state_0_delay_3_io_out;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[VlExcSignal.scala 141:20]
      state_1 <= 2'h0; // @[VlExcSignal.scala 160:15]
    end else if (2'h0 == state_1) begin // @[VlExcSignal.scala 141:20]
      state_1 <= state_1_delay_io_out; // @[VlExcSignal.scala 180:15]
    end else if (2'h1 == state_1) begin // @[VlExcSignal.scala 141:20]
      state_1 <= state_1_delay_1_io_out; // @[VlExcSignal.scala 200:15]
    end else if (2'h2 == state_1) begin // @[VlExcSignal.scala 141:20]
      state_1 <= state_1_delay_2_io_out; // @[VlExcSignal.scala 220:15]
    end else if (2'h3 == state_1) begin // @[VlExcSignal.scala 45:24]
      state_1 <= state_1_delay_3_io_out;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LFSR64.scala 31:18]
      loadRegIn_valid_0_lfsr <= 64'h7b;
    end else if (loadRegIn_valid_0_lfsr == 64'h0) begin
      loadRegIn_valid_0_lfsr <= 64'h1;
    end else begin
      loadRegIn_valid_0_lfsr <= _loadRegIn_valid_0_lfsr_T_2;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LFSR64.scala 31:18]
      loadRegIn_valid_1_lfsr <= 64'h4b0;
    end else if (loadRegIn_valid_1_lfsr == 64'h0) begin
      loadRegIn_valid_1_lfsr <= 64'h1;
    end else begin
      loadRegIn_valid_1_lfsr <= _loadRegIn_valid_1_lfsr_T_2;
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
  state_0 = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  state_1 = _RAND_1[1:0];
  _RAND_2 = {2{`RANDOM}};
  loadRegIn_valid_0_lfsr = _RAND_2[63:0];
  _RAND_3 = {2{`RANDOM}};
  loadRegIn_valid_1_lfsr = _RAND_3[63:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    state_0 = 2'h0;
  end
  if (reset) begin
    state_1 = 2'h0;
  end
  if (reset) begin
    loadRegIn_valid_0_lfsr = 64'h7b;
  end
  if (reset) begin
    loadRegIn_valid_1_lfsr = 64'h4b0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

