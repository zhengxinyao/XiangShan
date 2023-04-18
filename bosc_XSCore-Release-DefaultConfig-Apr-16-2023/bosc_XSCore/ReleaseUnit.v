module ReleaseUnit(
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
  output [35:0]  io_mem_release_bits_address,
  output         io_mem_release_bits_echo_blockisdirty,
  output [255:0] io_mem_release_bits_data,
  output         io_mem_grant_ready,
  input          io_mem_grant_valid,
  input  [1:0]   io_mem_grant_bits_source
);
  wire  entry_clock; // @[ReleaseUnit.scala 153:21]
  wire  entry_reset; // @[ReleaseUnit.scala 153:21]
  wire  entry_io_req_ready; // @[ReleaseUnit.scala 153:21]
  wire  entry_io_req_valid; // @[ReleaseUnit.scala 153:21]
  wire [35:0] entry_io_req_bits_addr; // @[ReleaseUnit.scala 153:21]
  wire [2:0] entry_io_req_bits_param; // @[ReleaseUnit.scala 153:21]
  wire  entry_io_req_bits_voluntary; // @[ReleaseUnit.scala 153:21]
  wire  entry_io_req_bits_hasData; // @[ReleaseUnit.scala 153:21]
  wire  entry_io_req_bits_dirty; // @[ReleaseUnit.scala 153:21]
  wire [511:0] entry_io_req_bits_data; // @[ReleaseUnit.scala 153:21]
  wire  entry_io_finish; // @[ReleaseUnit.scala 153:21]
  wire  entry_io_mem_release_ready; // @[ReleaseUnit.scala 153:21]
  wire  entry_io_mem_release_valid; // @[ReleaseUnit.scala 153:21]
  wire [2:0] entry_io_mem_release_bits_opcode; // @[ReleaseUnit.scala 153:21]
  wire [2:0] entry_io_mem_release_bits_param; // @[ReleaseUnit.scala 153:21]
  wire [2:0] entry_io_mem_release_bits_size; // @[ReleaseUnit.scala 153:21]
  wire [35:0] entry_io_mem_release_bits_address; // @[ReleaseUnit.scala 153:21]
  wire  entry_io_mem_release_bits_echo_blockisdirty; // @[ReleaseUnit.scala 153:21]
  wire [255:0] entry_io_mem_release_bits_data; // @[ReleaseUnit.scala 153:21]
  wire  entry_io_mem_grant_ready; // @[ReleaseUnit.scala 153:21]
  wire  entry_io_mem_grant_valid; // @[ReleaseUnit.scala 153:21]
  ReleaseEntry entry ( // @[ReleaseUnit.scala 153:21]
    .clock(entry_clock),
    .reset(entry_reset),
    .io_req_ready(entry_io_req_ready),
    .io_req_valid(entry_io_req_valid),
    .io_req_bits_addr(entry_io_req_bits_addr),
    .io_req_bits_param(entry_io_req_bits_param),
    .io_req_bits_voluntary(entry_io_req_bits_voluntary),
    .io_req_bits_hasData(entry_io_req_bits_hasData),
    .io_req_bits_dirty(entry_io_req_bits_dirty),
    .io_req_bits_data(entry_io_req_bits_data),
    .io_finish(entry_io_finish),
    .io_mem_release_ready(entry_io_mem_release_ready),
    .io_mem_release_valid(entry_io_mem_release_valid),
    .io_mem_release_bits_opcode(entry_io_mem_release_bits_opcode),
    .io_mem_release_bits_param(entry_io_mem_release_bits_param),
    .io_mem_release_bits_size(entry_io_mem_release_bits_size),
    .io_mem_release_bits_address(entry_io_mem_release_bits_address),
    .io_mem_release_bits_echo_blockisdirty(entry_io_mem_release_bits_echo_blockisdirty),
    .io_mem_release_bits_data(entry_io_mem_release_bits_data),
    .io_mem_grant_ready(entry_io_mem_grant_ready),
    .io_mem_grant_valid(entry_io_mem_grant_valid)
  );
  assign io_req_ready = entry_io_req_ready; // @[ReleaseUnit.scala 160:19]
  assign io_finish = entry_io_finish; // @[ReleaseUnit.scala 167:13]
  assign io_mem_release_valid = entry_io_mem_release_valid; // @[ReleaseUnit.scala 166:18]
  assign io_mem_release_bits_opcode = entry_io_mem_release_bits_opcode; // @[ReleaseUnit.scala 166:18]
  assign io_mem_release_bits_param = entry_io_mem_release_bits_param; // @[ReleaseUnit.scala 166:18]
  assign io_mem_release_bits_address = entry_io_mem_release_bits_address; // @[ReleaseUnit.scala 166:18]
  assign io_mem_release_bits_echo_blockisdirty = entry_io_mem_release_bits_echo_blockisdirty; // @[ReleaseUnit.scala 166:18]
  assign io_mem_release_bits_data = entry_io_mem_release_bits_data; // @[ReleaseUnit.scala 166:18]
  assign io_mem_grant_ready = entry_io_mem_grant_ready; // @[ReleaseUnit.scala 164:22]
  assign entry_clock = clock;
  assign entry_reset = reset;
  assign entry_io_req_valid = io_req_valid; // @[ReleaseUnit.scala 158:22]
  assign entry_io_req_bits_addr = io_req_bits_addr; // @[ReleaseUnit.scala 159:22]
  assign entry_io_req_bits_param = io_req_bits_param; // @[ReleaseUnit.scala 159:22]
  assign entry_io_req_bits_voluntary = io_req_bits_voluntary; // @[ReleaseUnit.scala 159:22]
  assign entry_io_req_bits_hasData = io_req_bits_hasData; // @[ReleaseUnit.scala 159:22]
  assign entry_io_req_bits_dirty = io_req_bits_dirty; // @[ReleaseUnit.scala 159:22]
  assign entry_io_req_bits_data = io_req_bits_data; // @[ReleaseUnit.scala 159:22]
  assign entry_io_mem_release_ready = io_mem_release_ready; // @[ReleaseUnit.scala 166:18]
  assign entry_io_mem_grant_valid = 2'h0 == io_mem_grant_bits_source & io_mem_grant_valid; // @[ReleaseUnit.scala 162:66]
endmodule

