module ReleaseEntry(
  input          clock,
  input          reset,
  output         io_req_ready,
  input          io_req_valid,
  input  [35:0]  io_req_bits_addr,
  input  [2:0]   io_req_bits_param,
  input          io_req_bits_voluntary,
  input          io_req_bits_hasData,
  input          io_req_bits_dirty,
  input  [511:0] io_req_bits_data,
  output         io_finish,
  input          io_mem_release_ready,
  output         io_mem_release_valid,
  output [2:0]   io_mem_release_bits_opcode,
  output [2:0]   io_mem_release_bits_param,
  output [2:0]   io_mem_release_bits_size,
  output [35:0]  io_mem_release_bits_address,
  output         io_mem_release_bits_echo_blockisdirty,
  output [255:0] io_mem_release_bits_data,
  output         io_mem_grant_ready,
  input          io_mem_grant_valid
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [511:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] state; // @[ReleaseUnit.scala 55:22]
  reg [35:0] req_addr; // @[ReleaseUnit.scala 57:17]
  reg [2:0] req_param; // @[ReleaseUnit.scala 57:17]
  reg  req_voluntary; // @[ReleaseUnit.scala 57:17]
  reg  req_hasData; // @[ReleaseUnit.scala 57:17]
  reg  req_dirty; // @[ReleaseUnit.scala 57:17]
  reg [511:0] req_data; // @[ReleaseUnit.scala 57:17]
  reg [1:0] remain; // @[ReleaseUnit.scala 63:23]
  wire  _T = io_req_ready & io_req_valid; // @[Decoupled.scala 50:35]
  wire [1:0] remain_set = _T ? 2'h3 : 2'h0; // @[ReleaseUnit.scala 74:24 76:16]
  wire [1:0] _remain_T = remain | remain_set; // @[ReleaseUnit.scala 66:21]
  wire  _T_1 = io_mem_release_ready & io_mem_release_valid; // @[Decoupled.scala 50:35]
  wire [1:0] _remain_clr_T_2 = remain[1] ? 2'h2 : 2'h0; // @[Mux.scala 47:70]
  wire [1:0] _remain_clr_T_3 = remain[0] ? 2'h1 : _remain_clr_T_2; // @[Mux.scala 47:70]
  wire [1:0] remain_clr = _T_1 ? _remain_clr_T_3 : 2'h0; // @[ReleaseUnit.scala 115:{32,45}]
  wire [1:0] _remain_T_1 = ~remain_clr; // @[ReleaseUnit.scala 66:37]
  wire  busy = |remain; // @[ReleaseUnit.scala 68:21]
  wire [1:0] _GEN_9 = _T ? 2'h1 : state; // @[ReleaseUnit.scala 74:24 77:16 55:22]
  wire  beat = remain[0] ? 1'h0 : 1'h1; // @[Mux.scala 47:70]
  wire [255:0] beat_data_0 = req_data[255:0]; // @[ReleaseUnit.scala 83:29]
  wire [255:0] beat_data_1 = req_data[511:256]; // @[ReleaseUnit.scala 83:29]
  wire [35:0] probeResponse_address = {req_addr[35:6],6'h0}; // @[Cat.scala 31:58]
  wire [255:0] probeResponseData_data = beat ? beat_data_1 : beat_data_0; // @[Edges.scala 428:{15,15}]
  wire  _io_mem_release_valid_T_2 = state == 2'h1; // @[ReleaseUnit.scala 111:75]
  wire [2:0] _io_mem_release_bits_T_opcode = req_hasData ? 3'h5 : 3'h4; // @[ReleaseUnit.scala 113:32]
  wire [35:0] _io_mem_release_bits_T_address = req_hasData ? probeResponse_address : probeResponse_address; // @[ReleaseUnit.scala 113:32]
  wire [255:0] _io_mem_release_bits_T_data = req_hasData ? probeResponseData_data : 256'h0; // @[ReleaseUnit.scala 113:32]
  wire [12:0] _release_done_beats1_decode_T_1 = 13'h3f << io_mem_release_bits_size; // @[package.scala 234:77]
  wire [5:0] _release_done_beats1_decode_T_3 = ~_release_done_beats1_decode_T_1[5:0]; // @[package.scala 234:46]
  wire  release_done_beats1_decode = _release_done_beats1_decode_T_3[5]; // @[Edges.scala 219:59]
  wire  release_done_beats1_opdata = io_mem_release_bits_opcode[0]; // @[Edges.scala 101:36]
  wire  release_done_beats1 = release_done_beats1_opdata & release_done_beats1_decode; // @[Edges.scala 220:14]
  reg  release_done_counter; // @[Edges.scala 228:27]
  wire  release_done_counter1 = release_done_counter - 1'h1; // @[Edges.scala 229:28]
  wire  release_done_first = ~release_done_counter; // @[Edges.scala 230:25]
  wire  release_done_last = release_done_counter | ~release_done_beats1; // @[Edges.scala 231:37]
  wire  release_done = release_done_last & _T_1; // @[Edges.scala 232:22]
  wire [1:0] _state_T = req_voluntary ? 2'h2 : 2'h0; // @[ReleaseUnit.scala 120:17]
  wire [1:0] _GEN_14 = _io_mem_release_valid_T_2 & release_done ? _state_T : _GEN_9; // @[ReleaseUnit.scala 119:50 120:11]
  wire  _T_5 = io_mem_grant_ready & io_mem_grant_valid; // @[Decoupled.scala 50:35]
  assign io_req_ready = state == 2'h0; // @[ReleaseUnit.scala 70:25]
  assign io_finish = state == 2'h2 & _T_5; // @[ReleaseUnit.scala 125:35 72:13]
  assign io_mem_release_valid = ~req_voluntary & req_hasData ? busy : state == 2'h1; // @[ReleaseUnit.scala 111:30]
  assign io_mem_release_bits_opcode = req_voluntary ? 3'h7 : _io_mem_release_bits_T_opcode; // @[ReleaseUnit.scala 112:30]
  assign io_mem_release_bits_param = req_param; // @[ReleaseUnit.scala 112:30]
  assign io_mem_release_bits_size = 3'h6; // @[ReleaseUnit.scala 112:30]
  assign io_mem_release_bits_address = req_voluntary ? probeResponse_address : _io_mem_release_bits_T_address; // @[ReleaseUnit.scala 112:30]
  assign io_mem_release_bits_echo_blockisdirty = req_voluntary & req_dirty; // @[ReleaseUnit.scala 112:30]
  assign io_mem_release_bits_data = req_voluntary ? probeResponseData_data : _io_mem_release_bits_T_data; // @[ReleaseUnit.scala 112:30]
  assign io_mem_grant_ready = state == 2'h2; // @[ReleaseUnit.scala 125:15]
  always @(posedge clock) begin
    if (_T) begin // @[ReleaseUnit.scala 74:24]
      req_addr <= io_req_bits_addr; // @[ReleaseUnit.scala 75:16]
    end
    if (_T) begin // @[ReleaseUnit.scala 74:24]
      req_param <= io_req_bits_param; // @[ReleaseUnit.scala 75:16]
    end
    if (_T) begin // @[ReleaseUnit.scala 74:24]
      req_voluntary <= io_req_bits_voluntary; // @[ReleaseUnit.scala 75:16]
    end
    if (_T) begin // @[ReleaseUnit.scala 74:24]
      req_hasData <= io_req_bits_hasData; // @[ReleaseUnit.scala 75:16]
    end
    if (_T) begin // @[ReleaseUnit.scala 74:24]
      req_dirty <= io_req_bits_dirty; // @[ReleaseUnit.scala 75:16]
    end
    if (_T) begin // @[ReleaseUnit.scala 74:24]
      req_data <= io_req_bits_data; // @[ReleaseUnit.scala 75:16]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[ReleaseUnit.scala 125:35]
      state <= 2'h0; // @[ReleaseUnit.scala 127:32 129:13]
    end else if (state == 2'h2) begin
      if (_T_5) begin
        state <= 2'h0;
      end else begin
        state <= _GEN_14;
      end
    end else begin
      state <= _GEN_14;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[ReleaseUnit.scala 66:35]
      remain <= 2'h0;
    end else begin
      remain <= _remain_T & _remain_T_1;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Edges.scala 234:17]
      release_done_counter <= 1'h0; // @[Edges.scala 235:21]
    end else if (_T_1) begin // @[Edges.scala 228:27]
      if (release_done_first) begin
        release_done_counter <= release_done_beats1;
      end else begin
        release_done_counter <= release_done_counter1;
      end
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
  state = _RAND_0[1:0];
  _RAND_1 = {2{`RANDOM}};
  req_addr = _RAND_1[35:0];
  _RAND_2 = {1{`RANDOM}};
  req_param = _RAND_2[2:0];
  _RAND_3 = {1{`RANDOM}};
  req_voluntary = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  req_hasData = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  req_dirty = _RAND_5[0:0];
  _RAND_6 = {16{`RANDOM}};
  req_data = _RAND_6[511:0];
  _RAND_7 = {1{`RANDOM}};
  remain = _RAND_7[1:0];
  _RAND_8 = {1{`RANDOM}};
  release_done_counter = _RAND_8[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    state = 2'h0;
  end
  if (reset) begin
    remain = 2'h0;
  end
  if (reset) begin
    release_done_counter = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

