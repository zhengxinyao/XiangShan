module ICacheMissUnit(
  input          clock,
  input          reset,
  output         io_req_0_ready,
  input          io_req_0_valid,
  input  [35:0]  io_req_0_bits_paddr,
  input  [38:0]  io_req_0_bits_vaddr,
  input  [7:0]   io_req_0_bits_waymask,
  output         io_req_1_ready,
  input          io_req_1_valid,
  input  [35:0]  io_req_1_bits_paddr,
  input  [38:0]  io_req_1_bits_vaddr,
  input  [7:0]   io_req_1_bits_waymask,
  output         io_resp_0_valid,
  output [511:0] io_resp_0_bits_data,
  output         io_resp_0_bits_corrupt,
  output         io_resp_1_valid,
  output [511:0] io_resp_1_bits_data,
  output         io_resp_1_bits_corrupt,
  input          io_mem_acquire_ready,
  output         io_mem_acquire_valid,
  output [2:0]   io_mem_acquire_bits_opcode,
  output [2:0]   io_mem_acquire_bits_size,
  output [1:0]   io_mem_acquire_bits_source,
  output [35:0]  io_mem_acquire_bits_address,
  output [31:0]  io_mem_acquire_bits_mask,
  input          io_mem_grant_valid,
  input  [2:0]   io_mem_grant_bits_opcode,
  input  [1:0]   io_mem_grant_bits_param,
  input  [1:0]   io_mem_grant_bits_source,
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
  output         io_data_write_valid,
  output [5:0]   io_data_write_bits_virIdx,
  output [511:0] io_data_write_bits_data,
  output [7:0]   io_data_write_bits_waymask,
  output         io_data_write_bits_bankIdx,
  input          io_release_req_ready,
  output         io_release_req_valid,
  output [35:0]  io_release_req_bits_paddr,
  output [38:0]  io_release_req_bits_vaddr,
  output [2:0]   io_release_req_bits_param,
  output         io_release_req_bits_voluntary,
  output         io_release_req_bits_needData,
  output [7:0]   io_release_req_bits_waymask,
  output [4:0]   io_release_req_bits_id,
  input          io_release_resp_valid,
  input  [4:0]   io_release_resp_bits,
  output         io_victimInfor_0_valid,
  output [5:0]   io_victimInfor_0_vidx,
  output         io_victimInfor_1_valid,
  output [5:0]   io_victimInfor_1_vidx
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  wire  meta_write_arb_io_in_0_ready; // @[ICacheMissUnit.scala 288:30]
  wire  meta_write_arb_io_in_0_valid; // @[ICacheMissUnit.scala 288:30]
  wire [5:0] meta_write_arb_io_in_0_bits_virIdx; // @[ICacheMissUnit.scala 288:30]
  wire [23:0] meta_write_arb_io_in_0_bits_phyTag; // @[ICacheMissUnit.scala 288:30]
  wire [1:0] meta_write_arb_io_in_0_bits_coh_state; // @[ICacheMissUnit.scala 288:30]
  wire [7:0] meta_write_arb_io_in_0_bits_waymask; // @[ICacheMissUnit.scala 288:30]
  wire  meta_write_arb_io_in_0_bits_bankIdx; // @[ICacheMissUnit.scala 288:30]
  wire  meta_write_arb_io_in_1_ready; // @[ICacheMissUnit.scala 288:30]
  wire  meta_write_arb_io_in_1_valid; // @[ICacheMissUnit.scala 288:30]
  wire [5:0] meta_write_arb_io_in_1_bits_virIdx; // @[ICacheMissUnit.scala 288:30]
  wire [23:0] meta_write_arb_io_in_1_bits_phyTag; // @[ICacheMissUnit.scala 288:30]
  wire [1:0] meta_write_arb_io_in_1_bits_coh_state; // @[ICacheMissUnit.scala 288:30]
  wire [7:0] meta_write_arb_io_in_1_bits_waymask; // @[ICacheMissUnit.scala 288:30]
  wire  meta_write_arb_io_in_1_bits_bankIdx; // @[ICacheMissUnit.scala 288:30]
  wire  meta_write_arb_io_out_ready; // @[ICacheMissUnit.scala 288:30]
  wire  meta_write_arb_io_out_valid; // @[ICacheMissUnit.scala 288:30]
  wire [5:0] meta_write_arb_io_out_bits_virIdx; // @[ICacheMissUnit.scala 288:30]
  wire [23:0] meta_write_arb_io_out_bits_phyTag; // @[ICacheMissUnit.scala 288:30]
  wire [1:0] meta_write_arb_io_out_bits_coh_state; // @[ICacheMissUnit.scala 288:30]
  wire [7:0] meta_write_arb_io_out_bits_waymask; // @[ICacheMissUnit.scala 288:30]
  wire  meta_write_arb_io_out_bits_bankIdx; // @[ICacheMissUnit.scala 288:30]
  wire  refill_arb_io_in_0_valid; // @[ICacheMissUnit.scala 289:30]
  wire [5:0] refill_arb_io_in_0_bits_virIdx; // @[ICacheMissUnit.scala 289:30]
  wire [511:0] refill_arb_io_in_0_bits_data; // @[ICacheMissUnit.scala 289:30]
  wire [7:0] refill_arb_io_in_0_bits_waymask; // @[ICacheMissUnit.scala 289:30]
  wire  refill_arb_io_in_0_bits_bankIdx; // @[ICacheMissUnit.scala 289:30]
  wire  refill_arb_io_in_1_ready; // @[ICacheMissUnit.scala 289:30]
  wire  refill_arb_io_in_1_valid; // @[ICacheMissUnit.scala 289:30]
  wire [5:0] refill_arb_io_in_1_bits_virIdx; // @[ICacheMissUnit.scala 289:30]
  wire [511:0] refill_arb_io_in_1_bits_data; // @[ICacheMissUnit.scala 289:30]
  wire [7:0] refill_arb_io_in_1_bits_waymask; // @[ICacheMissUnit.scala 289:30]
  wire  refill_arb_io_in_1_bits_bankIdx; // @[ICacheMissUnit.scala 289:30]
  wire  refill_arb_io_out_valid; // @[ICacheMissUnit.scala 289:30]
  wire [5:0] refill_arb_io_out_bits_virIdx; // @[ICacheMissUnit.scala 289:30]
  wire [511:0] refill_arb_io_out_bits_data; // @[ICacheMissUnit.scala 289:30]
  wire [7:0] refill_arb_io_out_bits_waymask; // @[ICacheMissUnit.scala 289:30]
  wire  refill_arb_io_out_bits_bankIdx; // @[ICacheMissUnit.scala 289:30]
  wire  release_arb_io_in_0_ready; // @[ICacheMissUnit.scala 290:30]
  wire  release_arb_io_in_0_valid; // @[ICacheMissUnit.scala 290:30]
  wire [35:0] release_arb_io_in_0_bits_paddr; // @[ICacheMissUnit.scala 290:30]
  wire [38:0] release_arb_io_in_0_bits_vaddr; // @[ICacheMissUnit.scala 290:30]
  wire [2:0] release_arb_io_in_0_bits_param; // @[ICacheMissUnit.scala 290:30]
  wire  release_arb_io_in_0_bits_voluntary; // @[ICacheMissUnit.scala 290:30]
  wire  release_arb_io_in_0_bits_needData; // @[ICacheMissUnit.scala 290:30]
  wire [7:0] release_arb_io_in_0_bits_waymask; // @[ICacheMissUnit.scala 290:30]
  wire [4:0] release_arb_io_in_0_bits_id; // @[ICacheMissUnit.scala 290:30]
  wire  release_arb_io_in_1_ready; // @[ICacheMissUnit.scala 290:30]
  wire  release_arb_io_in_1_valid; // @[ICacheMissUnit.scala 290:30]
  wire [35:0] release_arb_io_in_1_bits_paddr; // @[ICacheMissUnit.scala 290:30]
  wire [38:0] release_arb_io_in_1_bits_vaddr; // @[ICacheMissUnit.scala 290:30]
  wire [2:0] release_arb_io_in_1_bits_param; // @[ICacheMissUnit.scala 290:30]
  wire  release_arb_io_in_1_bits_voluntary; // @[ICacheMissUnit.scala 290:30]
  wire  release_arb_io_in_1_bits_needData; // @[ICacheMissUnit.scala 290:30]
  wire [7:0] release_arb_io_in_1_bits_waymask; // @[ICacheMissUnit.scala 290:30]
  wire [4:0] release_arb_io_in_1_bits_id; // @[ICacheMissUnit.scala 290:30]
  wire  release_arb_io_out_ready; // @[ICacheMissUnit.scala 290:30]
  wire  release_arb_io_out_valid; // @[ICacheMissUnit.scala 290:30]
  wire [35:0] release_arb_io_out_bits_paddr; // @[ICacheMissUnit.scala 290:30]
  wire [38:0] release_arb_io_out_bits_vaddr; // @[ICacheMissUnit.scala 290:30]
  wire [2:0] release_arb_io_out_bits_param; // @[ICacheMissUnit.scala 290:30]
  wire  release_arb_io_out_bits_voluntary; // @[ICacheMissUnit.scala 290:30]
  wire  release_arb_io_out_bits_needData; // @[ICacheMissUnit.scala 290:30]
  wire [7:0] release_arb_io_out_bits_waymask; // @[ICacheMissUnit.scala 290:30]
  wire [4:0] release_arb_io_out_bits_id; // @[ICacheMissUnit.scala 290:30]
  wire  entries_0_clock; // @[ICacheMissUnit.scala 295:23]
  wire  entries_0_reset; // @[ICacheMissUnit.scala 295:23]
  wire  entries_0_io_req_ready; // @[ICacheMissUnit.scala 295:23]
  wire  entries_0_io_req_valid; // @[ICacheMissUnit.scala 295:23]
  wire [35:0] entries_0_io_req_bits_paddr; // @[ICacheMissUnit.scala 295:23]
  wire [38:0] entries_0_io_req_bits_vaddr; // @[ICacheMissUnit.scala 295:23]
  wire [7:0] entries_0_io_req_bits_waymask; // @[ICacheMissUnit.scala 295:23]
  wire  entries_0_io_resp_valid; // @[ICacheMissUnit.scala 295:23]
  wire [511:0] entries_0_io_resp_bits_data; // @[ICacheMissUnit.scala 295:23]
  wire  entries_0_io_resp_bits_corrupt; // @[ICacheMissUnit.scala 295:23]
  wire  entries_0_io_mem_acquire_ready; // @[ICacheMissUnit.scala 295:23]
  wire  entries_0_io_mem_acquire_valid; // @[ICacheMissUnit.scala 295:23]
  wire [35:0] entries_0_io_mem_acquire_bits_address; // @[ICacheMissUnit.scala 295:23]
  wire  entries_0_io_mem_grant_ready; // @[ICacheMissUnit.scala 295:23]
  wire  entries_0_io_mem_grant_valid; // @[ICacheMissUnit.scala 295:23]
  wire [2:0] entries_0_io_mem_grant_bits_opcode; // @[ICacheMissUnit.scala 295:23]
  wire [1:0] entries_0_io_mem_grant_bits_param; // @[ICacheMissUnit.scala 295:23]
  wire [3:0] entries_0_io_mem_grant_bits_sink; // @[ICacheMissUnit.scala 295:23]
  wire  entries_0_io_mem_grant_bits_echo_blockisdirty; // @[ICacheMissUnit.scala 295:23]
  wire [255:0] entries_0_io_mem_grant_bits_data; // @[ICacheMissUnit.scala 295:23]
  wire  entries_0_io_mem_grant_bits_corrupt; // @[ICacheMissUnit.scala 295:23]
  wire  entries_0_io_mem_finish_ready; // @[ICacheMissUnit.scala 295:23]
  wire  entries_0_io_mem_finish_valid; // @[ICacheMissUnit.scala 295:23]
  wire [3:0] entries_0_io_mem_finish_bits_sink; // @[ICacheMissUnit.scala 295:23]
  wire  entries_0_io_meta_write_ready; // @[ICacheMissUnit.scala 295:23]
  wire  entries_0_io_meta_write_valid; // @[ICacheMissUnit.scala 295:23]
  wire [5:0] entries_0_io_meta_write_bits_virIdx; // @[ICacheMissUnit.scala 295:23]
  wire [23:0] entries_0_io_meta_write_bits_phyTag; // @[ICacheMissUnit.scala 295:23]
  wire [1:0] entries_0_io_meta_write_bits_coh_state; // @[ICacheMissUnit.scala 295:23]
  wire [7:0] entries_0_io_meta_write_bits_waymask; // @[ICacheMissUnit.scala 295:23]
  wire  entries_0_io_meta_write_bits_bankIdx; // @[ICacheMissUnit.scala 295:23]
  wire  entries_0_io_data_write_valid; // @[ICacheMissUnit.scala 295:23]
  wire [5:0] entries_0_io_data_write_bits_virIdx; // @[ICacheMissUnit.scala 295:23]
  wire [511:0] entries_0_io_data_write_bits_data; // @[ICacheMissUnit.scala 295:23]
  wire [7:0] entries_0_io_data_write_bits_waymask; // @[ICacheMissUnit.scala 295:23]
  wire  entries_0_io_data_write_bits_bankIdx; // @[ICacheMissUnit.scala 295:23]
  wire  entries_0_io_release_req_ready; // @[ICacheMissUnit.scala 295:23]
  wire  entries_0_io_release_req_valid; // @[ICacheMissUnit.scala 295:23]
  wire [35:0] entries_0_io_release_req_bits_paddr; // @[ICacheMissUnit.scala 295:23]
  wire [38:0] entries_0_io_release_req_bits_vaddr; // @[ICacheMissUnit.scala 295:23]
  wire [7:0] entries_0_io_release_req_bits_waymask; // @[ICacheMissUnit.scala 295:23]
  wire  entries_0_io_release_resp_valid; // @[ICacheMissUnit.scala 295:23]
  wire [4:0] entries_0_io_release_resp_bits; // @[ICacheMissUnit.scala 295:23]
  wire  entries_0_io_victimInfor_valid; // @[ICacheMissUnit.scala 295:23]
  wire [5:0] entries_0_io_victimInfor_vidx; // @[ICacheMissUnit.scala 295:23]
  wire  entries_1_clock; // @[ICacheMissUnit.scala 295:23]
  wire  entries_1_reset; // @[ICacheMissUnit.scala 295:23]
  wire  entries_1_io_req_ready; // @[ICacheMissUnit.scala 295:23]
  wire  entries_1_io_req_valid; // @[ICacheMissUnit.scala 295:23]
  wire [35:0] entries_1_io_req_bits_paddr; // @[ICacheMissUnit.scala 295:23]
  wire [38:0] entries_1_io_req_bits_vaddr; // @[ICacheMissUnit.scala 295:23]
  wire [7:0] entries_1_io_req_bits_waymask; // @[ICacheMissUnit.scala 295:23]
  wire  entries_1_io_resp_valid; // @[ICacheMissUnit.scala 295:23]
  wire [511:0] entries_1_io_resp_bits_data; // @[ICacheMissUnit.scala 295:23]
  wire  entries_1_io_resp_bits_corrupt; // @[ICacheMissUnit.scala 295:23]
  wire  entries_1_io_mem_acquire_ready; // @[ICacheMissUnit.scala 295:23]
  wire  entries_1_io_mem_acquire_valid; // @[ICacheMissUnit.scala 295:23]
  wire [35:0] entries_1_io_mem_acquire_bits_address; // @[ICacheMissUnit.scala 295:23]
  wire  entries_1_io_mem_grant_ready; // @[ICacheMissUnit.scala 295:23]
  wire  entries_1_io_mem_grant_valid; // @[ICacheMissUnit.scala 295:23]
  wire [2:0] entries_1_io_mem_grant_bits_opcode; // @[ICacheMissUnit.scala 295:23]
  wire [1:0] entries_1_io_mem_grant_bits_param; // @[ICacheMissUnit.scala 295:23]
  wire [3:0] entries_1_io_mem_grant_bits_sink; // @[ICacheMissUnit.scala 295:23]
  wire  entries_1_io_mem_grant_bits_echo_blockisdirty; // @[ICacheMissUnit.scala 295:23]
  wire [255:0] entries_1_io_mem_grant_bits_data; // @[ICacheMissUnit.scala 295:23]
  wire  entries_1_io_mem_grant_bits_corrupt; // @[ICacheMissUnit.scala 295:23]
  wire  entries_1_io_mem_finish_ready; // @[ICacheMissUnit.scala 295:23]
  wire  entries_1_io_mem_finish_valid; // @[ICacheMissUnit.scala 295:23]
  wire [3:0] entries_1_io_mem_finish_bits_sink; // @[ICacheMissUnit.scala 295:23]
  wire  entries_1_io_meta_write_ready; // @[ICacheMissUnit.scala 295:23]
  wire  entries_1_io_meta_write_valid; // @[ICacheMissUnit.scala 295:23]
  wire [5:0] entries_1_io_meta_write_bits_virIdx; // @[ICacheMissUnit.scala 295:23]
  wire [23:0] entries_1_io_meta_write_bits_phyTag; // @[ICacheMissUnit.scala 295:23]
  wire [1:0] entries_1_io_meta_write_bits_coh_state; // @[ICacheMissUnit.scala 295:23]
  wire [7:0] entries_1_io_meta_write_bits_waymask; // @[ICacheMissUnit.scala 295:23]
  wire  entries_1_io_meta_write_bits_bankIdx; // @[ICacheMissUnit.scala 295:23]
  wire  entries_1_io_data_write_ready; // @[ICacheMissUnit.scala 295:23]
  wire  entries_1_io_data_write_valid; // @[ICacheMissUnit.scala 295:23]
  wire [5:0] entries_1_io_data_write_bits_virIdx; // @[ICacheMissUnit.scala 295:23]
  wire [511:0] entries_1_io_data_write_bits_data; // @[ICacheMissUnit.scala 295:23]
  wire [7:0] entries_1_io_data_write_bits_waymask; // @[ICacheMissUnit.scala 295:23]
  wire  entries_1_io_data_write_bits_bankIdx; // @[ICacheMissUnit.scala 295:23]
  wire  entries_1_io_release_req_ready; // @[ICacheMissUnit.scala 295:23]
  wire  entries_1_io_release_req_valid; // @[ICacheMissUnit.scala 295:23]
  wire [35:0] entries_1_io_release_req_bits_paddr; // @[ICacheMissUnit.scala 295:23]
  wire [38:0] entries_1_io_release_req_bits_vaddr; // @[ICacheMissUnit.scala 295:23]
  wire [7:0] entries_1_io_release_req_bits_waymask; // @[ICacheMissUnit.scala 295:23]
  wire  entries_1_io_release_resp_valid; // @[ICacheMissUnit.scala 295:23]
  wire [4:0] entries_1_io_release_resp_bits; // @[ICacheMissUnit.scala 295:23]
  wire  entries_1_io_victimInfor_valid; // @[ICacheMissUnit.scala 295:23]
  wire [5:0] entries_1_io_victimInfor_vidx; // @[ICacheMissUnit.scala 295:23]
  reg  beatsLeft; // @[Arbiter.scala 87:30]
  wire  idle = ~beatsLeft; // @[Arbiter.scala 88:28]
  wire  latch = idle & io_mem_acquire_ready; // @[Arbiter.scala 89:24]
  wire  out_earlyValid = entries_0_io_mem_acquire_valid; // @[ReadyValidCancel.scala 68:19 69:20]
  wire  out_1_earlyValid = entries_1_io_mem_acquire_valid; // @[ReadyValidCancel.scala 68:19 69:20]
  wire [3:0] _readys_T = {2'h0,out_1_earlyValid,out_earlyValid}; // @[Cat.scala 31:58]
  wire [4:0] _readys_T_1 = {_readys_T, 1'h0}; // @[package.scala 244:48]
  wire [3:0] _readys_T_3 = _readys_T | _readys_T_1[3:0]; // @[package.scala 244:43]
  wire [5:0] _readys_T_4 = {_readys_T_3, 2'h0}; // @[package.scala 244:48]
  wire [3:0] _readys_T_6 = _readys_T_3 | _readys_T_4[3:0]; // @[package.scala 244:43]
  wire [4:0] _readys_T_8 = {_readys_T_6, 1'h0}; // @[Arbiter.scala 16:78]
  wire [3:0] _readys_T_10 = ~_readys_T_8[3:0]; // @[Arbiter.scala 16:61]
  wire  readys__0 = _readys_T_10[0]; // @[Arbiter.scala 95:86]
  wire  readys__1 = _readys_T_10[1]; // @[Arbiter.scala 95:86]
  wire  earlyWinner__0 = readys__0 & out_earlyValid; // @[Arbiter.scala 97:79]
  wire  earlyWinner__1 = readys__1 & out_1_earlyValid; // @[Arbiter.scala 97:79]
  wire  _T_30 = out_earlyValid | out_1_earlyValid; // @[Arbiter.scala 107:36]
  reg  state__0; // @[Arbiter.scala 116:26]
  wire  muxStateEarly__0 = idle ? earlyWinner__0 : state__0; // @[Arbiter.scala 117:30]
  reg  state__1; // @[Arbiter.scala 116:26]
  wire  muxStateEarly__1 = idle ? earlyWinner__1 : state__1; // @[Arbiter.scala 117:30]
  wire  _sink_ACancel_earlyValid_T_7 = state__0 & out_earlyValid | state__1 & out_1_earlyValid; // @[Mux.scala 27:73]
  wire  sink_ACancel_earlyValid = idle ? _T_30 : _sink_ACancel_earlyValid_T_7; // @[Arbiter.scala 125:29]
  wire  _beatsLeft_T_2 = io_mem_acquire_ready & sink_ACancel_earlyValid; // @[ReadyValidCancel.scala 49:33]
  wire  allowed__0 = idle ? readys__0 : state__0; // @[Arbiter.scala 121:24]
  wire  allowed__1 = idle ? readys__1 : state__1; // @[Arbiter.scala 121:24]
  wire [31:0] _T_66 = muxStateEarly__0 ? 32'hffffffff : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _T_67 = muxStateEarly__1 ? 32'hffffffff : 32'h0; // @[Mux.scala 27:73]
  wire [35:0] out_bits_address = entries_0_io_mem_acquire_bits_address; // @[ReadyValidCancel.scala 68:19 71:14]
  wire [35:0] _T_94 = muxStateEarly__0 ? out_bits_address : 36'h0; // @[Mux.scala 27:73]
  wire [35:0] out_1_bits_address = entries_1_io_mem_acquire_bits_address; // @[ReadyValidCancel.scala 68:19 71:14]
  wire [35:0] _T_95 = muxStateEarly__1 ? out_1_bits_address : 36'h0; // @[Mux.scala 27:73]
  wire [2:0] _T_108 = muxStateEarly__0 ? 3'h6 : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _T_109 = muxStateEarly__1 ? 3'h6 : 3'h0; // @[Mux.scala 27:73]
  reg  beatsLeft_1; // @[Arbiter.scala 87:30]
  wire  idle_1 = ~beatsLeft_1; // @[Arbiter.scala 88:28]
  wire  latch_1 = idle_1 & io_mem_finish_ready; // @[Arbiter.scala 89:24]
  wire  out_5_earlyValid = entries_0_io_mem_finish_valid; // @[ReadyValidCancel.scala 68:19 69:20]
  wire  out_6_earlyValid = entries_1_io_mem_finish_valid; // @[ReadyValidCancel.scala 68:19 69:20]
  wire [1:0] _readys_T_15 = {out_6_earlyValid,out_5_earlyValid}; // @[Cat.scala 31:58]
  wire [2:0] _readys_T_16 = {_readys_T_15, 1'h0}; // @[package.scala 244:48]
  wire [1:0] _readys_T_18 = _readys_T_15 | _readys_T_16[1:0]; // @[package.scala 244:43]
  wire [2:0] _readys_T_20 = {_readys_T_18, 1'h0}; // @[Arbiter.scala 16:78]
  wire [1:0] _readys_T_22 = ~_readys_T_20[1:0]; // @[Arbiter.scala 16:61]
  wire  readys_1_0 = _readys_T_22[0]; // @[Arbiter.scala 95:86]
  wire  readys_1_1 = _readys_T_22[1]; // @[Arbiter.scala 95:86]
  wire  earlyWinner_1_0 = readys_1_0 & out_5_earlyValid; // @[Arbiter.scala 97:79]
  wire  earlyWinner_1_1 = readys_1_1 & out_6_earlyValid; // @[Arbiter.scala 97:79]
  wire  _T_139 = out_5_earlyValid | out_6_earlyValid; // @[Arbiter.scala 107:36]
  reg  state_1_0; // @[Arbiter.scala 116:26]
  wire  muxStateEarly_1_0 = idle_1 ? earlyWinner_1_0 : state_1_0; // @[Arbiter.scala 117:30]
  reg  state_1_1; // @[Arbiter.scala 116:26]
  wire  muxStateEarly_1_1 = idle_1 ? earlyWinner_1_1 : state_1_1; // @[Arbiter.scala 117:30]
  wire  _sink_ACancel_earlyValid_T_14 = state_1_0 & out_5_earlyValid | state_1_1 & out_6_earlyValid; // @[Mux.scala 27:73]
  wire  sink_ACancel_1_earlyValid = idle_1 ? _T_139 : _sink_ACancel_earlyValid_T_14; // @[Arbiter.scala 125:29]
  wire  _beatsLeft_T_8 = io_mem_finish_ready & sink_ACancel_1_earlyValid; // @[ReadyValidCancel.scala 49:33]
  wire  allowed_1_0 = idle_1 ? readys_1_0 : state_1_0; // @[Arbiter.scala 121:24]
  wire  allowed_1_1 = idle_1 ? readys_1_1 : state_1_1; // @[Arbiter.scala 121:24]
  wire [3:0] out_5_bits_sink = entries_0_io_mem_finish_bits_sink; // @[ReadyValidCancel.scala 68:19 71:14]
  wire [3:0] _T_153 = muxStateEarly_1_0 ? out_5_bits_sink : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] out_6_bits_sink = entries_1_io_mem_finish_bits_sink; // @[ReadyValidCancel.scala 68:19 71:14]
  wire [3:0] _T_154 = muxStateEarly_1_1 ? out_6_bits_sink : 4'h0; // @[Mux.scala 27:73]
  Arbiter_1 meta_write_arb ( // @[ICacheMissUnit.scala 288:30]
    .io_in_0_ready(meta_write_arb_io_in_0_ready),
    .io_in_0_valid(meta_write_arb_io_in_0_valid),
    .io_in_0_bits_virIdx(meta_write_arb_io_in_0_bits_virIdx),
    .io_in_0_bits_phyTag(meta_write_arb_io_in_0_bits_phyTag),
    .io_in_0_bits_coh_state(meta_write_arb_io_in_0_bits_coh_state),
    .io_in_0_bits_waymask(meta_write_arb_io_in_0_bits_waymask),
    .io_in_0_bits_bankIdx(meta_write_arb_io_in_0_bits_bankIdx),
    .io_in_1_ready(meta_write_arb_io_in_1_ready),
    .io_in_1_valid(meta_write_arb_io_in_1_valid),
    .io_in_1_bits_virIdx(meta_write_arb_io_in_1_bits_virIdx),
    .io_in_1_bits_phyTag(meta_write_arb_io_in_1_bits_phyTag),
    .io_in_1_bits_coh_state(meta_write_arb_io_in_1_bits_coh_state),
    .io_in_1_bits_waymask(meta_write_arb_io_in_1_bits_waymask),
    .io_in_1_bits_bankIdx(meta_write_arb_io_in_1_bits_bankIdx),
    .io_out_ready(meta_write_arb_io_out_ready),
    .io_out_valid(meta_write_arb_io_out_valid),
    .io_out_bits_virIdx(meta_write_arb_io_out_bits_virIdx),
    .io_out_bits_phyTag(meta_write_arb_io_out_bits_phyTag),
    .io_out_bits_coh_state(meta_write_arb_io_out_bits_coh_state),
    .io_out_bits_waymask(meta_write_arb_io_out_bits_waymask),
    .io_out_bits_bankIdx(meta_write_arb_io_out_bits_bankIdx)
  );
  Arbiter_2 refill_arb ( // @[ICacheMissUnit.scala 289:30]
    .io_in_0_valid(refill_arb_io_in_0_valid),
    .io_in_0_bits_virIdx(refill_arb_io_in_0_bits_virIdx),
    .io_in_0_bits_data(refill_arb_io_in_0_bits_data),
    .io_in_0_bits_waymask(refill_arb_io_in_0_bits_waymask),
    .io_in_0_bits_bankIdx(refill_arb_io_in_0_bits_bankIdx),
    .io_in_1_ready(refill_arb_io_in_1_ready),
    .io_in_1_valid(refill_arb_io_in_1_valid),
    .io_in_1_bits_virIdx(refill_arb_io_in_1_bits_virIdx),
    .io_in_1_bits_data(refill_arb_io_in_1_bits_data),
    .io_in_1_bits_waymask(refill_arb_io_in_1_bits_waymask),
    .io_in_1_bits_bankIdx(refill_arb_io_in_1_bits_bankIdx),
    .io_out_valid(refill_arb_io_out_valid),
    .io_out_bits_virIdx(refill_arb_io_out_bits_virIdx),
    .io_out_bits_data(refill_arb_io_out_bits_data),
    .io_out_bits_waymask(refill_arb_io_out_bits_waymask),
    .io_out_bits_bankIdx(refill_arb_io_out_bits_bankIdx)
  );
  Arbiter_3 release_arb ( // @[ICacheMissUnit.scala 290:30]
    .io_in_0_ready(release_arb_io_in_0_ready),
    .io_in_0_valid(release_arb_io_in_0_valid),
    .io_in_0_bits_paddr(release_arb_io_in_0_bits_paddr),
    .io_in_0_bits_vaddr(release_arb_io_in_0_bits_vaddr),
    .io_in_0_bits_param(release_arb_io_in_0_bits_param),
    .io_in_0_bits_voluntary(release_arb_io_in_0_bits_voluntary),
    .io_in_0_bits_needData(release_arb_io_in_0_bits_needData),
    .io_in_0_bits_waymask(release_arb_io_in_0_bits_waymask),
    .io_in_0_bits_id(release_arb_io_in_0_bits_id),
    .io_in_1_ready(release_arb_io_in_1_ready),
    .io_in_1_valid(release_arb_io_in_1_valid),
    .io_in_1_bits_paddr(release_arb_io_in_1_bits_paddr),
    .io_in_1_bits_vaddr(release_arb_io_in_1_bits_vaddr),
    .io_in_1_bits_param(release_arb_io_in_1_bits_param),
    .io_in_1_bits_voluntary(release_arb_io_in_1_bits_voluntary),
    .io_in_1_bits_needData(release_arb_io_in_1_bits_needData),
    .io_in_1_bits_waymask(release_arb_io_in_1_bits_waymask),
    .io_in_1_bits_id(release_arb_io_in_1_bits_id),
    .io_out_ready(release_arb_io_out_ready),
    .io_out_valid(release_arb_io_out_valid),
    .io_out_bits_paddr(release_arb_io_out_bits_paddr),
    .io_out_bits_vaddr(release_arb_io_out_bits_vaddr),
    .io_out_bits_param(release_arb_io_out_bits_param),
    .io_out_bits_voluntary(release_arb_io_out_bits_voluntary),
    .io_out_bits_needData(release_arb_io_out_bits_needData),
    .io_out_bits_waymask(release_arb_io_out_bits_waymask),
    .io_out_bits_id(release_arb_io_out_bits_id)
  );
  ICacheMissEntry entries_0 ( // @[ICacheMissUnit.scala 295:23]
    .clock(entries_0_clock),
    .reset(entries_0_reset),
    .io_req_ready(entries_0_io_req_ready),
    .io_req_valid(entries_0_io_req_valid),
    .io_req_bits_paddr(entries_0_io_req_bits_paddr),
    .io_req_bits_vaddr(entries_0_io_req_bits_vaddr),
    .io_req_bits_waymask(entries_0_io_req_bits_waymask),
    .io_resp_valid(entries_0_io_resp_valid),
    .io_resp_bits_data(entries_0_io_resp_bits_data),
    .io_resp_bits_corrupt(entries_0_io_resp_bits_corrupt),
    .io_mem_acquire_ready(entries_0_io_mem_acquire_ready),
    .io_mem_acquire_valid(entries_0_io_mem_acquire_valid),
    .io_mem_acquire_bits_address(entries_0_io_mem_acquire_bits_address),
    .io_mem_grant_ready(entries_0_io_mem_grant_ready),
    .io_mem_grant_valid(entries_0_io_mem_grant_valid),
    .io_mem_grant_bits_opcode(entries_0_io_mem_grant_bits_opcode),
    .io_mem_grant_bits_param(entries_0_io_mem_grant_bits_param),
    .io_mem_grant_bits_sink(entries_0_io_mem_grant_bits_sink),
    .io_mem_grant_bits_echo_blockisdirty(entries_0_io_mem_grant_bits_echo_blockisdirty),
    .io_mem_grant_bits_data(entries_0_io_mem_grant_bits_data),
    .io_mem_grant_bits_corrupt(entries_0_io_mem_grant_bits_corrupt),
    .io_mem_finish_ready(entries_0_io_mem_finish_ready),
    .io_mem_finish_valid(entries_0_io_mem_finish_valid),
    .io_mem_finish_bits_sink(entries_0_io_mem_finish_bits_sink),
    .io_meta_write_ready(entries_0_io_meta_write_ready),
    .io_meta_write_valid(entries_0_io_meta_write_valid),
    .io_meta_write_bits_virIdx(entries_0_io_meta_write_bits_virIdx),
    .io_meta_write_bits_phyTag(entries_0_io_meta_write_bits_phyTag),
    .io_meta_write_bits_coh_state(entries_0_io_meta_write_bits_coh_state),
    .io_meta_write_bits_waymask(entries_0_io_meta_write_bits_waymask),
    .io_meta_write_bits_bankIdx(entries_0_io_meta_write_bits_bankIdx),
    .io_data_write_valid(entries_0_io_data_write_valid),
    .io_data_write_bits_virIdx(entries_0_io_data_write_bits_virIdx),
    .io_data_write_bits_data(entries_0_io_data_write_bits_data),
    .io_data_write_bits_waymask(entries_0_io_data_write_bits_waymask),
    .io_data_write_bits_bankIdx(entries_0_io_data_write_bits_bankIdx),
    .io_release_req_ready(entries_0_io_release_req_ready),
    .io_release_req_valid(entries_0_io_release_req_valid),
    .io_release_req_bits_paddr(entries_0_io_release_req_bits_paddr),
    .io_release_req_bits_vaddr(entries_0_io_release_req_bits_vaddr),
    .io_release_req_bits_waymask(entries_0_io_release_req_bits_waymask),
    .io_release_resp_valid(entries_0_io_release_resp_valid),
    .io_release_resp_bits(entries_0_io_release_resp_bits),
    .io_victimInfor_valid(entries_0_io_victimInfor_valid),
    .io_victimInfor_vidx(entries_0_io_victimInfor_vidx)
  );
  ICacheMissEntry_1 entries_1 ( // @[ICacheMissUnit.scala 295:23]
    .clock(entries_1_clock),
    .reset(entries_1_reset),
    .io_req_ready(entries_1_io_req_ready),
    .io_req_valid(entries_1_io_req_valid),
    .io_req_bits_paddr(entries_1_io_req_bits_paddr),
    .io_req_bits_vaddr(entries_1_io_req_bits_vaddr),
    .io_req_bits_waymask(entries_1_io_req_bits_waymask),
    .io_resp_valid(entries_1_io_resp_valid),
    .io_resp_bits_data(entries_1_io_resp_bits_data),
    .io_resp_bits_corrupt(entries_1_io_resp_bits_corrupt),
    .io_mem_acquire_ready(entries_1_io_mem_acquire_ready),
    .io_mem_acquire_valid(entries_1_io_mem_acquire_valid),
    .io_mem_acquire_bits_address(entries_1_io_mem_acquire_bits_address),
    .io_mem_grant_ready(entries_1_io_mem_grant_ready),
    .io_mem_grant_valid(entries_1_io_mem_grant_valid),
    .io_mem_grant_bits_opcode(entries_1_io_mem_grant_bits_opcode),
    .io_mem_grant_bits_param(entries_1_io_mem_grant_bits_param),
    .io_mem_grant_bits_sink(entries_1_io_mem_grant_bits_sink),
    .io_mem_grant_bits_echo_blockisdirty(entries_1_io_mem_grant_bits_echo_blockisdirty),
    .io_mem_grant_bits_data(entries_1_io_mem_grant_bits_data),
    .io_mem_grant_bits_corrupt(entries_1_io_mem_grant_bits_corrupt),
    .io_mem_finish_ready(entries_1_io_mem_finish_ready),
    .io_mem_finish_valid(entries_1_io_mem_finish_valid),
    .io_mem_finish_bits_sink(entries_1_io_mem_finish_bits_sink),
    .io_meta_write_ready(entries_1_io_meta_write_ready),
    .io_meta_write_valid(entries_1_io_meta_write_valid),
    .io_meta_write_bits_virIdx(entries_1_io_meta_write_bits_virIdx),
    .io_meta_write_bits_phyTag(entries_1_io_meta_write_bits_phyTag),
    .io_meta_write_bits_coh_state(entries_1_io_meta_write_bits_coh_state),
    .io_meta_write_bits_waymask(entries_1_io_meta_write_bits_waymask),
    .io_meta_write_bits_bankIdx(entries_1_io_meta_write_bits_bankIdx),
    .io_data_write_ready(entries_1_io_data_write_ready),
    .io_data_write_valid(entries_1_io_data_write_valid),
    .io_data_write_bits_virIdx(entries_1_io_data_write_bits_virIdx),
    .io_data_write_bits_data(entries_1_io_data_write_bits_data),
    .io_data_write_bits_waymask(entries_1_io_data_write_bits_waymask),
    .io_data_write_bits_bankIdx(entries_1_io_data_write_bits_bankIdx),
    .io_release_req_ready(entries_1_io_release_req_ready),
    .io_release_req_valid(entries_1_io_release_req_valid),
    .io_release_req_bits_paddr(entries_1_io_release_req_bits_paddr),
    .io_release_req_bits_vaddr(entries_1_io_release_req_bits_vaddr),
    .io_release_req_bits_waymask(entries_1_io_release_req_bits_waymask),
    .io_release_resp_valid(entries_1_io_release_resp_valid),
    .io_release_resp_bits(entries_1_io_release_resp_bits),
    .io_victimInfor_valid(entries_1_io_victimInfor_valid),
    .io_victimInfor_vidx(entries_1_io_victimInfor_vidx)
  );
  assign io_req_0_ready = entries_0_io_req_ready; // @[ICacheMissUnit.scala 302:24]
  assign io_req_1_ready = entries_1_io_req_ready; // @[ICacheMissUnit.scala 302:24]
  assign io_resp_0_valid = entries_0_io_resp_valid; // @[ICacheMissUnit.scala 315:16]
  assign io_resp_0_bits_data = entries_0_io_resp_bits_data; // @[ICacheMissUnit.scala 315:16]
  assign io_resp_0_bits_corrupt = entries_0_io_resp_bits_corrupt; // @[ICacheMissUnit.scala 315:16]
  assign io_resp_1_valid = entries_1_io_resp_valid; // @[ICacheMissUnit.scala 315:16]
  assign io_resp_1_bits_data = entries_1_io_resp_bits_data; // @[ICacheMissUnit.scala 315:16]
  assign io_resp_1_bits_corrupt = entries_1_io_resp_bits_corrupt; // @[ICacheMissUnit.scala 315:16]
  assign io_mem_acquire_valid = idle ? _T_30 : _sink_ACancel_earlyValid_T_7; // @[Arbiter.scala 125:29]
  assign io_mem_acquire_bits_opcode = _T_108 | _T_109; // @[Mux.scala 27:73]
  assign io_mem_acquire_bits_size = _T_108 | _T_109; // @[Mux.scala 27:73]
  assign io_mem_acquire_bits_source = muxStateEarly__1 ? 2'h1 : 2'h0; // @[Mux.scala 27:73]
  assign io_mem_acquire_bits_address = _T_94 | _T_95; // @[Mux.scala 27:73]
  assign io_mem_acquire_bits_mask = _T_66 | _T_67; // @[Mux.scala 27:73]
  assign io_mem_finish_valid = idle_1 ? _T_139 : _sink_ACancel_earlyValid_T_14; // @[Arbiter.scala 125:29]
  assign io_mem_finish_bits_sink = _T_153 | _T_154; // @[Mux.scala 27:73]
  assign io_meta_write_valid = meta_write_arb_io_out_valid; // @[ICacheMissUnit.scala 361:21]
  assign io_meta_write_bits_virIdx = meta_write_arb_io_out_bits_virIdx; // @[ICacheMissUnit.scala 361:21]
  assign io_meta_write_bits_phyTag = meta_write_arb_io_out_bits_phyTag; // @[ICacheMissUnit.scala 361:21]
  assign io_meta_write_bits_coh_state = meta_write_arb_io_out_bits_coh_state; // @[ICacheMissUnit.scala 361:21]
  assign io_meta_write_bits_waymask = meta_write_arb_io_out_bits_waymask; // @[ICacheMissUnit.scala 361:21]
  assign io_meta_write_bits_bankIdx = meta_write_arb_io_out_bits_bankIdx; // @[ICacheMissUnit.scala 361:21]
  assign io_data_write_valid = refill_arb_io_out_valid; // @[ICacheMissUnit.scala 362:21]
  assign io_data_write_bits_virIdx = refill_arb_io_out_bits_virIdx; // @[ICacheMissUnit.scala 362:21]
  assign io_data_write_bits_data = refill_arb_io_out_bits_data; // @[ICacheMissUnit.scala 362:21]
  assign io_data_write_bits_waymask = refill_arb_io_out_bits_waymask; // @[ICacheMissUnit.scala 362:21]
  assign io_data_write_bits_bankIdx = refill_arb_io_out_bits_bankIdx; // @[ICacheMissUnit.scala 362:21]
  assign io_release_req_valid = release_arb_io_out_valid; // @[ICacheMissUnit.scala 363:21]
  assign io_release_req_bits_paddr = release_arb_io_out_bits_paddr; // @[ICacheMissUnit.scala 363:21]
  assign io_release_req_bits_vaddr = release_arb_io_out_bits_vaddr; // @[ICacheMissUnit.scala 363:21]
  assign io_release_req_bits_param = release_arb_io_out_bits_param; // @[ICacheMissUnit.scala 363:21]
  assign io_release_req_bits_voluntary = release_arb_io_out_bits_voluntary; // @[ICacheMissUnit.scala 363:21]
  assign io_release_req_bits_needData = release_arb_io_out_bits_needData; // @[ICacheMissUnit.scala 363:21]
  assign io_release_req_bits_waymask = release_arb_io_out_bits_waymask; // @[ICacheMissUnit.scala 363:21]
  assign io_release_req_bits_id = release_arb_io_out_bits_id; // @[ICacheMissUnit.scala 363:21]
  assign io_victimInfor_0_valid = entries_0_io_victimInfor_valid; // @[ICacheMissUnit.scala 317:23]
  assign io_victimInfor_0_vidx = entries_0_io_victimInfor_vidx; // @[ICacheMissUnit.scala 317:23]
  assign io_victimInfor_1_valid = entries_1_io_victimInfor_valid; // @[ICacheMissUnit.scala 317:23]
  assign io_victimInfor_1_vidx = entries_1_io_victimInfor_vidx; // @[ICacheMissUnit.scala 317:23]
  assign meta_write_arb_io_in_0_valid = entries_0_io_meta_write_valid; // @[ICacheMissUnit.scala 305:33]
  assign meta_write_arb_io_in_0_bits_virIdx = entries_0_io_meta_write_bits_virIdx; // @[ICacheMissUnit.scala 305:33]
  assign meta_write_arb_io_in_0_bits_phyTag = entries_0_io_meta_write_bits_phyTag; // @[ICacheMissUnit.scala 305:33]
  assign meta_write_arb_io_in_0_bits_coh_state = entries_0_io_meta_write_bits_coh_state; // @[ICacheMissUnit.scala 305:33]
  assign meta_write_arb_io_in_0_bits_waymask = entries_0_io_meta_write_bits_waymask; // @[ICacheMissUnit.scala 305:33]
  assign meta_write_arb_io_in_0_bits_bankIdx = entries_0_io_meta_write_bits_bankIdx; // @[ICacheMissUnit.scala 305:33]
  assign meta_write_arb_io_in_1_valid = entries_1_io_meta_write_valid; // @[ICacheMissUnit.scala 305:33]
  assign meta_write_arb_io_in_1_bits_virIdx = entries_1_io_meta_write_bits_virIdx; // @[ICacheMissUnit.scala 305:33]
  assign meta_write_arb_io_in_1_bits_phyTag = entries_1_io_meta_write_bits_phyTag; // @[ICacheMissUnit.scala 305:33]
  assign meta_write_arb_io_in_1_bits_coh_state = entries_1_io_meta_write_bits_coh_state; // @[ICacheMissUnit.scala 305:33]
  assign meta_write_arb_io_in_1_bits_waymask = entries_1_io_meta_write_bits_waymask; // @[ICacheMissUnit.scala 305:33]
  assign meta_write_arb_io_in_1_bits_bankIdx = entries_1_io_meta_write_bits_bankIdx; // @[ICacheMissUnit.scala 305:33]
  assign meta_write_arb_io_out_ready = io_meta_write_ready; // @[ICacheMissUnit.scala 361:21]
  assign refill_arb_io_in_0_valid = entries_0_io_data_write_valid; // @[ICacheMissUnit.scala 306:33]
  assign refill_arb_io_in_0_bits_virIdx = entries_0_io_data_write_bits_virIdx; // @[ICacheMissUnit.scala 306:33]
  assign refill_arb_io_in_0_bits_data = entries_0_io_data_write_bits_data; // @[ICacheMissUnit.scala 306:33]
  assign refill_arb_io_in_0_bits_waymask = entries_0_io_data_write_bits_waymask; // @[ICacheMissUnit.scala 306:33]
  assign refill_arb_io_in_0_bits_bankIdx = entries_0_io_data_write_bits_bankIdx; // @[ICacheMissUnit.scala 306:33]
  assign refill_arb_io_in_1_valid = entries_1_io_data_write_valid; // @[ICacheMissUnit.scala 306:33]
  assign refill_arb_io_in_1_bits_virIdx = entries_1_io_data_write_bits_virIdx; // @[ICacheMissUnit.scala 306:33]
  assign refill_arb_io_in_1_bits_data = entries_1_io_data_write_bits_data; // @[ICacheMissUnit.scala 306:33]
  assign refill_arb_io_in_1_bits_waymask = entries_1_io_data_write_bits_waymask; // @[ICacheMissUnit.scala 306:33]
  assign refill_arb_io_in_1_bits_bankIdx = entries_1_io_data_write_bits_bankIdx; // @[ICacheMissUnit.scala 306:33]
  assign release_arb_io_in_0_valid = entries_0_io_release_req_valid; // @[ICacheMissUnit.scala 307:33]
  assign release_arb_io_in_0_bits_paddr = entries_0_io_release_req_bits_paddr; // @[ICacheMissUnit.scala 307:33]
  assign release_arb_io_in_0_bits_vaddr = entries_0_io_release_req_bits_vaddr; // @[ICacheMissUnit.scala 307:33]
  assign release_arb_io_in_0_bits_param = 3'h0; // @[ICacheMissUnit.scala 307:33]
  assign release_arb_io_in_0_bits_voluntary = 1'h1; // @[ICacheMissUnit.scala 307:33]
  assign release_arb_io_in_0_bits_needData = 1'h0; // @[ICacheMissUnit.scala 307:33]
  assign release_arb_io_in_0_bits_waymask = entries_0_io_release_req_bits_waymask; // @[ICacheMissUnit.scala 307:33]
  assign release_arb_io_in_0_bits_id = 5'h2; // @[ICacheMissUnit.scala 307:33]
  assign release_arb_io_in_1_valid = entries_1_io_release_req_valid; // @[ICacheMissUnit.scala 307:33]
  assign release_arb_io_in_1_bits_paddr = entries_1_io_release_req_bits_paddr; // @[ICacheMissUnit.scala 307:33]
  assign release_arb_io_in_1_bits_vaddr = entries_1_io_release_req_bits_vaddr; // @[ICacheMissUnit.scala 307:33]
  assign release_arb_io_in_1_bits_param = 3'h0; // @[ICacheMissUnit.scala 307:33]
  assign release_arb_io_in_1_bits_voluntary = 1'h1; // @[ICacheMissUnit.scala 307:33]
  assign release_arb_io_in_1_bits_needData = 1'h0; // @[ICacheMissUnit.scala 307:33]
  assign release_arb_io_in_1_bits_waymask = entries_1_io_release_req_bits_waymask; // @[ICacheMissUnit.scala 307:33]
  assign release_arb_io_in_1_bits_id = 5'h3; // @[ICacheMissUnit.scala 307:33]
  assign release_arb_io_out_ready = io_release_req_ready; // @[ICacheMissUnit.scala 363:21]
  assign entries_0_clock = clock;
  assign entries_0_reset = reset;
  assign entries_0_io_req_valid = io_req_0_valid; // @[ICacheMissUnit.scala 300:24]
  assign entries_0_io_req_bits_paddr = io_req_0_bits_paddr; // @[ICacheMissUnit.scala 301:24]
  assign entries_0_io_req_bits_vaddr = io_req_0_bits_vaddr; // @[ICacheMissUnit.scala 301:24]
  assign entries_0_io_req_bits_waymask = io_req_0_bits_waymask; // @[ICacheMissUnit.scala 301:24]
  assign entries_0_io_mem_acquire_ready = io_mem_acquire_ready & allowed__0; // @[Arbiter.scala 123:31]
  assign entries_0_io_mem_grant_valid = io_mem_grant_bits_source == 2'h0 & io_mem_grant_valid; // @[ICacheMissUnit.scala 311:45 312:26 309:30]
  assign entries_0_io_mem_grant_bits_opcode = io_mem_grant_bits_opcode; // @[ICacheMissUnit.scala 311:45 312:26]
  assign entries_0_io_mem_grant_bits_param = io_mem_grant_bits_param; // @[ICacheMissUnit.scala 311:45 312:26]
  assign entries_0_io_mem_grant_bits_sink = io_mem_grant_bits_sink; // @[ICacheMissUnit.scala 311:45 312:26]
  assign entries_0_io_mem_grant_bits_echo_blockisdirty = io_mem_grant_bits_echo_blockisdirty; // @[ICacheMissUnit.scala 311:45 312:26]
  assign entries_0_io_mem_grant_bits_data = io_mem_grant_bits_data; // @[ICacheMissUnit.scala 311:45 312:26]
  assign entries_0_io_mem_grant_bits_corrupt = io_mem_grant_bits_corrupt; // @[ICacheMissUnit.scala 311:45 312:26]
  assign entries_0_io_mem_finish_ready = io_mem_finish_ready & allowed_1_0; // @[Arbiter.scala 123:31]
  assign entries_0_io_meta_write_ready = meta_write_arb_io_in_0_ready; // @[ICacheMissUnit.scala 305:33]
  assign entries_0_io_release_req_ready = release_arb_io_in_0_ready; // @[ICacheMissUnit.scala 307:33]
  assign entries_0_io_release_resp_valid = io_release_resp_valid; // @[ICacheMissUnit.scala 320:27]
  assign entries_0_io_release_resp_bits = io_release_resp_bits; // @[ICacheMissUnit.scala 320:27]
  assign entries_1_clock = clock;
  assign entries_1_reset = reset;
  assign entries_1_io_req_valid = io_req_1_valid; // @[ICacheMissUnit.scala 300:24]
  assign entries_1_io_req_bits_paddr = io_req_1_bits_paddr; // @[ICacheMissUnit.scala 301:24]
  assign entries_1_io_req_bits_vaddr = io_req_1_bits_vaddr; // @[ICacheMissUnit.scala 301:24]
  assign entries_1_io_req_bits_waymask = io_req_1_bits_waymask; // @[ICacheMissUnit.scala 301:24]
  assign entries_1_io_mem_acquire_ready = io_mem_acquire_ready & allowed__1; // @[Arbiter.scala 123:31]
  assign entries_1_io_mem_grant_valid = io_mem_grant_bits_source == 2'h1 & io_mem_grant_valid; // @[ICacheMissUnit.scala 311:45 312:26 309:30]
  assign entries_1_io_mem_grant_bits_opcode = io_mem_grant_bits_opcode; // @[ICacheMissUnit.scala 311:45 312:26]
  assign entries_1_io_mem_grant_bits_param = io_mem_grant_bits_param; // @[ICacheMissUnit.scala 311:45 312:26]
  assign entries_1_io_mem_grant_bits_sink = io_mem_grant_bits_sink; // @[ICacheMissUnit.scala 311:45 312:26]
  assign entries_1_io_mem_grant_bits_echo_blockisdirty = io_mem_grant_bits_echo_blockisdirty; // @[ICacheMissUnit.scala 311:45 312:26]
  assign entries_1_io_mem_grant_bits_data = io_mem_grant_bits_data; // @[ICacheMissUnit.scala 311:45 312:26]
  assign entries_1_io_mem_grant_bits_corrupt = io_mem_grant_bits_corrupt; // @[ICacheMissUnit.scala 311:45 312:26]
  assign entries_1_io_mem_finish_ready = io_mem_finish_ready & allowed_1_1; // @[Arbiter.scala 123:31]
  assign entries_1_io_meta_write_ready = meta_write_arb_io_in_1_ready; // @[ICacheMissUnit.scala 305:33]
  assign entries_1_io_data_write_ready = refill_arb_io_in_1_ready; // @[ICacheMissUnit.scala 306:33]
  assign entries_1_io_release_req_ready = release_arb_io_in_1_ready; // @[ICacheMissUnit.scala 307:33]
  assign entries_1_io_release_resp_valid = io_release_resp_valid; // @[ICacheMissUnit.scala 320:27]
  assign entries_1_io_release_resp_bits = io_release_resp_bits; // @[ICacheMissUnit.scala 320:27]
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Arbiter.scala 113:23]
      beatsLeft <= 1'h0;
    end else if (latch) begin
      beatsLeft <= 1'h0;
    end else begin
      beatsLeft <= beatsLeft - _beatsLeft_T_2;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Arbiter.scala 118:30]
      state__0 <= 1'h0;
    end else if (idle) begin
      state__0 <= earlyWinner__0;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Arbiter.scala 118:30]
      state__1 <= 1'h0;
    end else if (idle) begin
      state__1 <= earlyWinner__1;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Arbiter.scala 113:23]
      beatsLeft_1 <= 1'h0;
    end else if (latch_1) begin
      beatsLeft_1 <= 1'h0;
    end else begin
      beatsLeft_1 <= beatsLeft_1 - _beatsLeft_T_8;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Arbiter.scala 118:30]
      state_1_0 <= 1'h0;
    end else if (idle_1) begin
      state_1_0 <= earlyWinner_1_0;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Arbiter.scala 118:30]
      state_1_1 <= 1'h0;
    end else if (idle_1) begin
      state_1_1 <= earlyWinner_1_1;
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
  beatsLeft = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  state__0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  state__1 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  beatsLeft_1 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  state_1_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  state_1_1 = _RAND_5[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    beatsLeft = 1'h0;
  end
  if (reset) begin
    state__0 = 1'h0;
  end
  if (reset) begin
    state__1 = 1'h0;
  end
  if (reset) begin
    beatsLeft_1 = 1'h0;
  end
  if (reset) begin
    state_1_0 = 1'h0;
  end
  if (reset) begin
    state_1_1 = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

