module ICacheMissEntry_1(
  input          clock,
  input          reset,
  output         io_req_ready,
  input          io_req_valid,
  input  [35:0]  io_req_bits_paddr,
  input  [38:0]  io_req_bits_vaddr,
  input  [7:0]   io_req_bits_waymask,
  output         io_resp_valid,
  output [511:0] io_resp_bits_data,
  output         io_resp_bits_corrupt,
  input          io_mem_acquire_ready,
  output         io_mem_acquire_valid,
  output [35:0]  io_mem_acquire_bits_address,
  output         io_mem_grant_ready,
  input          io_mem_grant_valid,
  input  [2:0]   io_mem_grant_bits_opcode,
  input  [1:0]   io_mem_grant_bits_param,
  input  [3:0]   io_mem_grant_bits_sink,
  input          io_mem_grant_bits_echo_blockisdirty,
  input  [255:0] io_mem_grant_bits_data,
  input          io_mem_grant_bits_corrupt,
  input          io_mem_finish_ready,
  output         io_mem_finish_valid,
  output [3:0]   io_mem_finish_bits_sink,
  input          io_meta_write_ready,
  output         io_meta_write_valid,
  output [5:0]   io_meta_write_bits_virIdx,
  output [23:0]  io_meta_write_bits_phyTag,
  output [1:0]   io_meta_write_bits_coh_state,
  output [7:0]   io_meta_write_bits_waymask,
  output         io_meta_write_bits_bankIdx,
  input          io_data_write_ready,
  output         io_data_write_valid,
  output [5:0]   io_data_write_bits_virIdx,
  output [511:0] io_data_write_bits_data,
  output [7:0]   io_data_write_bits_waymask,
  output         io_data_write_bits_bankIdx,
  input          io_release_req_ready,
  output         io_release_req_valid,
  output [35:0]  io_release_req_bits_paddr,
  output [38:0]  io_release_req_bits_vaddr,
  output [7:0]   io_release_req_bits_waymask,
  input          io_release_resp_valid,
  input  [4:0]   io_release_resp_bits,
  output         io_victimInfor_valid,
  output [5:0]   io_victimInfor_vidx
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [255:0] _RAND_6;
  reg [255:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] state; // @[ICacheMissUnit.scala 98:22]
  reg [35:0] req_paddr; // @[ICacheMissUnit.scala 101:16]
  reg [38:0] req_vaddr; // @[ICacheMissUnit.scala 101:16]
  reg [7:0] req_waymask; // @[ICacheMissUnit.scala 101:16]
  wire [5:0] req_idx = req_vaddr[11:6]; // @[L1Cache.scala 81:33]
  reg  req_corrupt; // @[ICacheMissUnit.scala 106:28]
  wire  _T = io_mem_grant_ready & io_mem_grant_valid; // @[Decoupled.scala 50:35]
  wire  beats1_opdata = io_mem_grant_bits_opcode[0]; // @[Edges.scala 105:36]
  reg  readBeatCnt; // @[ICacheMissUnit.scala 114:24]
  reg [255:0] respDataReg_0; // @[ICacheMissUnit.scala 115:24]
  reg [255:0] respDataReg_1; // @[ICacheMissUnit.scala 115:24]
  reg [3:0] grantack_sink; // @[Reg.scala 16:16]
  reg [1:0] grant_param; // @[ICacheMissUnit.scala 140:24]
  reg  is_dirty; // @[ICacheMissUnit.scala 141:25]
  wire  _is_grant_T_3 = io_mem_grant_bits_opcode[2] & ~io_mem_grant_bits_opcode[1]; // @[Edges.scala 70:40]
  reg  is_grant; // @[Reg.scala 16:16]
  wire  _T_2 = io_req_ready & io_req_valid; // @[Decoupled.scala 50:35]
  wire  _T_4 = io_mem_acquire_ready & io_mem_acquire_valid; // @[Decoupled.scala 50:35]
  wire [255:0] _GEN_10 = ~readBeatCnt ? io_mem_grant_bits_data : respDataReg_0; // @[ICacheMissUnit.scala 115:24 165:{36,36}]
  wire [255:0] _GEN_11 = readBeatCnt ? io_mem_grant_bits_data : respDataReg_1; // @[ICacheMissUnit.scala 115:24 165:{36,36}]
  wire [2:0] _GEN_12 = readBeatCnt ? 3'h4 : state; // @[ICacheMissUnit.scala 169:54 171:19 98:22]
  wire  _GEN_13 = _T ? readBeatCnt + 1'h1 : readBeatCnt; // @[ICacheMissUnit.scala 163:35 164:23 114:24]
  wire [255:0] _GEN_14 = _T ? _GEN_10 : respDataReg_0; // @[ICacheMissUnit.scala 115:24 163:35]
  wire [255:0] _GEN_15 = _T ? _GEN_11 : respDataReg_1; // @[ICacheMissUnit.scala 115:24 163:35]
  wire  _GEN_16 = _T ? io_mem_grant_bits_corrupt : req_corrupt; // @[ICacheMissUnit.scala 163:35 166:23 106:28]
  wire [1:0] _GEN_17 = _T ? io_mem_grant_bits_param : grant_param; // @[ICacheMissUnit.scala 163:35 167:23 140:24]
  wire  _GEN_18 = _T ? io_mem_grant_bits_echo_blockisdirty : is_dirty; // @[ICacheMissUnit.scala 163:35 168:23 141:25]
  wire [2:0] _GEN_19 = _T ? _GEN_12 : state; // @[ICacheMissUnit.scala 163:35 98:22]
  wire  _T_12 = io_mem_finish_ready & io_mem_finish_valid; // @[Decoupled.scala 50:35]
  wire [2:0] _GEN_27 = _T_12 ? 3'h5 : state; // @[ICacheMissUnit.scala 178:34 179:15 98:22]
  wire  _T_14 = io_release_req_ready & io_release_req_valid; // @[Decoupled.scala 50:35]
  wire [2:0] _GEN_28 = _T_14 ? 3'h6 : state; // @[ICacheMissUnit.scala 184:34 185:15 98:22]
  wire [2:0] _GEN_29 = io_release_resp_valid & io_release_resp_bits == 5'h3 ? 3'h3 : state; // @[ICacheMissUnit.scala 190:73 191:15 98:22]
  wire  _state_T = io_meta_write_ready & io_meta_write_valid; // @[Decoupled.scala 50:35]
  wire  _state_T_1 = io_data_write_ready & io_data_write_valid; // @[Decoupled.scala 50:35]
  wire [2:0] _state_T_3 = _state_T & _state_T_1 ? 3'h7 : 3'h3; // @[ICacheMissUnit.scala 196:19]
  wire [2:0] _GEN_30 = io_resp_valid ? 3'h0 : state; // @[ICacheMissUnit.scala 202:28 203:15 98:22]
  wire [2:0] _GEN_33 = 3'h7 == state ? _GEN_30 : state; // @[ICacheMissUnit.scala 145:17 98:22]
  wire [2:0] _GEN_34 = 3'h3 == state ? _state_T_3 : _GEN_33; // @[ICacheMissUnit.scala 145:17 196:13]
  wire [2:0] _GEN_37 = 3'h6 == state ? _GEN_29 : _GEN_34; // @[ICacheMissUnit.scala 145:17]
  wire [2:0] _GEN_40 = 3'h5 == state ? _GEN_28 : _GEN_37; // @[ICacheMissUnit.scala 145:17]
  wire [2:0] _miss_new_coh_T = {grant_param,is_dirty}; // @[Cat.scala 31:58]
  wire [1:0] _miss_new_coh_T_6 = 3'h2 == _miss_new_coh_T ? 2'h1 : 2'h0; // @[Mux.scala 81:58]
  wire [1:0] _miss_new_coh_T_8 = 3'h3 == _miss_new_coh_T ? 2'h1 : _miss_new_coh_T_6; // @[Mux.scala 81:58]
  wire [1:0] _miss_new_coh_T_10 = 3'h0 == _miss_new_coh_T ? 2'h2 : _miss_new_coh_T_8; // @[Mux.scala 81:58]
  assign io_req_ready = state == 3'h0; // @[ICacheMissUnit.scala 132:26]
  assign io_resp_valid = state == 3'h7; // @[ICacheMissUnit.scala 227:26]
  assign io_resp_bits_data = {respDataReg_1,respDataReg_0}; // @[ICacheMissUnit.scala 200:40]
  assign io_resp_bits_corrupt = req_corrupt; // @[ICacheMissUnit.scala 145:17 201:28]
  assign io_mem_acquire_valid = state == 3'h1; // @[ICacheMissUnit.scala 133:34]
  assign io_mem_acquire_bits_address = {req_paddr[35:6],6'h0}; // @[Cat.scala 31:58]
  assign io_mem_grant_ready = 1'h1; // @[ICacheMissUnit.scala 120:22]
  assign io_mem_finish_valid = state == 3'h4 & is_grant; // @[ICacheMissUnit.scala 223:55]
  assign io_mem_finish_bits_sink = grantack_sink; // @[ICacheMissUnit.scala 224:22]
  assign io_meta_write_valid = state == 3'h3; // @[ICacheMissUnit.scala 239:33]
  assign io_meta_write_bits_virIdx = req_vaddr[11:6]; // @[L1Cache.scala 81:33]
  assign io_meta_write_bits_phyTag = req_paddr[35:12]; // @[L1Cache.scala 79:41]
  assign io_meta_write_bits_coh_state = 3'h1 == _miss_new_coh_T ? 2'h3 : _miss_new_coh_T_10; // @[Mux.scala 81:58]
  assign io_meta_write_bits_waymask = req_waymask; // @[ICacheBundle.scala 63:18]
  assign io_meta_write_bits_bankIdx = req_idx[0]; // @[ICacheMissUnit.scala 240:121]
  assign io_data_write_valid = state == 3'h3; // @[ICacheMissUnit.scala 242:33]
  assign io_data_write_bits_virIdx = req_vaddr[11:6]; // @[L1Cache.scala 81:33]
  assign io_data_write_bits_data = {respDataReg_1,respDataReg_0}; // @[ICacheMissUnit.scala 243:50]
  assign io_data_write_bits_waymask = req_waymask; // @[ICacheBundle.scala 80:18]
  assign io_data_write_bits_bankIdx = req_idx[0]; // @[ICacheMissUnit.scala 246:48]
  assign io_release_req_valid = state == 3'h5; // @[ICacheMissUnit.scala 134:34]
  assign io_release_req_bits_paddr = req_paddr; // @[ICacheMissUnit.scala 124:29]
  assign io_release_req_bits_vaddr = req_vaddr; // @[ICacheMissUnit.scala 125:29]
  assign io_release_req_bits_waymask = req_waymask; // @[ICacheMissUnit.scala 127:33]
  assign io_victimInfor_valid = state == 3'h5 | state == 3'h6 | state == 3'h7; // @[ICacheMissUnit.scala 108:80]
  assign io_victimInfor_vidx = req_vaddr[11:6]; // @[L1Cache.scala 81:33]
  always @(posedge clock) begin
    if (3'h0 == state) begin // @[ICacheMissUnit.scala 145:17]
      if (_T_2) begin // @[ICacheMissUnit.scala 147:27]
        req_paddr <= io_req_bits_paddr; // @[ICacheMissUnit.scala 150:13]
      end
    end
    if (3'h0 == state) begin // @[ICacheMissUnit.scala 145:17]
      if (_T_2) begin // @[ICacheMissUnit.scala 147:27]
        req_vaddr <= io_req_bits_vaddr; // @[ICacheMissUnit.scala 150:13]
      end
    end
    if (3'h0 == state) begin // @[ICacheMissUnit.scala 145:17]
      if (_T_2) begin // @[ICacheMissUnit.scala 147:27]
        req_waymask <= io_req_bits_waymask; // @[ICacheMissUnit.scala 150:13]
      end
    end
    if (3'h0 == state) begin // @[ICacheMissUnit.scala 145:17]
      if (_T_2) begin // @[ICacheMissUnit.scala 147:27]
        readBeatCnt <= 1'h0; // @[ICacheMissUnit.scala 148:21]
      end
    end else if (!(3'h1 == state)) begin // @[ICacheMissUnit.scala 145:17]
      if (3'h2 == state) begin // @[ICacheMissUnit.scala 145:17]
        if (beats1_opdata) begin // @[ICacheMissUnit.scala 162:45]
          readBeatCnt <= _GEN_13;
        end
      end
    end
    if (!(3'h0 == state)) begin // @[ICacheMissUnit.scala 145:17]
      if (!(3'h1 == state)) begin // @[ICacheMissUnit.scala 145:17]
        if (3'h2 == state) begin // @[ICacheMissUnit.scala 145:17]
          if (beats1_opdata) begin // @[ICacheMissUnit.scala 162:45]
            respDataReg_0 <= _GEN_14;
          end
        end
      end
    end
    if (!(3'h0 == state)) begin // @[ICacheMissUnit.scala 145:17]
      if (!(3'h1 == state)) begin // @[ICacheMissUnit.scala 145:17]
        if (3'h2 == state) begin // @[ICacheMissUnit.scala 145:17]
          if (beats1_opdata) begin // @[ICacheMissUnit.scala 162:45]
            respDataReg_1 <= _GEN_15;
          end
        end
      end
    end
    if (_T) begin // @[Reg.scala 17:18]
      grantack_sink <= io_mem_grant_bits_sink; // @[Reg.scala 17:22]
    end
    if (!(3'h0 == state)) begin // @[ICacheMissUnit.scala 145:17]
      if (!(3'h1 == state)) begin // @[ICacheMissUnit.scala 145:17]
        if (3'h2 == state) begin // @[ICacheMissUnit.scala 145:17]
          if (beats1_opdata) begin // @[ICacheMissUnit.scala 162:45]
            grant_param <= _GEN_17;
          end
        end
      end
    end
    if (_T) begin // @[Reg.scala 17:18]
      is_grant <= _is_grant_T_3; // @[Reg.scala 17:22]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[ICacheMissUnit.scala 145:17]
      state <= 3'h0; // @[ICacheMissUnit.scala 147:27 149:15 98:22]
    end else if (3'h0 == state) begin // @[ICacheMissUnit.scala 145:17]
      if (_T_2) begin // @[ICacheMissUnit.scala 156:35]
        state <= 3'h1; // @[ICacheMissUnit.scala 157:15]
      end
    end else if (3'h1 == state) begin // @[ICacheMissUnit.scala 145:17]
      if (_T_4) begin // @[ICacheMissUnit.scala 162:45]
        state <= 3'h2;
      end
    end else if (3'h2 == state) begin // @[ICacheMissUnit.scala 145:17]
      if (beats1_opdata) begin
        state <= _GEN_19;
      end
    end else if (3'h4 == state) begin
      state <= _GEN_27;
    end else begin
      state <= _GEN_40;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[ICacheMissUnit.scala 145:17]
      req_corrupt <= 1'h0; // @[ICacheMissUnit.scala 106:28]
    end else if (!(3'h0 == state)) begin // @[ICacheMissUnit.scala 145:17]
      if (!(3'h1 == state)) begin // @[ICacheMissUnit.scala 145:17]
        if (3'h2 == state) begin // @[ICacheMissUnit.scala 106:28]
          if (beats1_opdata) begin
            req_corrupt <= _GEN_16;
          end
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[ICacheMissUnit.scala 145:17]
      is_dirty <= 1'h0; // @[ICacheMissUnit.scala 141:25]
    end else if (!(3'h0 == state)) begin // @[ICacheMissUnit.scala 145:17]
      if (!(3'h1 == state)) begin // @[ICacheMissUnit.scala 145:17]
        if (3'h2 == state) begin // @[ICacheMissUnit.scala 141:25]
          if (beats1_opdata) begin
            is_dirty <= _GEN_18;
          end
        end
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
  state = _RAND_0[2:0];
  _RAND_1 = {2{`RANDOM}};
  req_paddr = _RAND_1[35:0];
  _RAND_2 = {2{`RANDOM}};
  req_vaddr = _RAND_2[38:0];
  _RAND_3 = {1{`RANDOM}};
  req_waymask = _RAND_3[7:0];
  _RAND_4 = {1{`RANDOM}};
  req_corrupt = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  readBeatCnt = _RAND_5[0:0];
  _RAND_6 = {8{`RANDOM}};
  respDataReg_0 = _RAND_6[255:0];
  _RAND_7 = {8{`RANDOM}};
  respDataReg_1 = _RAND_7[255:0];
  _RAND_8 = {1{`RANDOM}};
  grantack_sink = _RAND_8[3:0];
  _RAND_9 = {1{`RANDOM}};
  grant_param = _RAND_9[1:0];
  _RAND_10 = {1{`RANDOM}};
  is_dirty = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  is_grant = _RAND_11[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    state = 3'h0;
  end
  if (reset) begin
    req_corrupt = 1'h0;
  end
  if (reset) begin
    is_dirty = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

