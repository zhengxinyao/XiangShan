module ProbeHelper(
  input         clock,
  input         reset,
  input         io_dirResult_valid,
  input  [1:0]  io_dirResult_bits_clients_states_0_state,
  input         io_dirResult_bits_clients_states_0_hit,
  input  [1:0]  io_dirResult_bits_clients_states_1_state,
  input         io_dirResult_bits_clients_states_1_hit,
  input         io_dirResult_bits_clients_tag_match,
  input  [22:0] io_dirResult_bits_clients_tag,
  input  [5:0]  io_dirResult_bits_sourceId,
  input  [9:0]  io_dirResult_bits_set,
  input  [2:0]  io_dirResult_bits_replacerInfo_channel,
  input  [2:0]  io_dirResult_bits_replacerInfo_opcode,
  input         io_probe_ready,
  output        io_probe_valid,
  output [2:0]  io_probe_bits_channel,
  output [2:0]  io_probe_bits_opcode,
  output [2:0]  io_probe_bits_param,
  output [2:0]  io_probe_bits_size,
  output [5:0]  io_probe_bits_source,
  output [9:0]  io_probe_bits_set,
  output [19:0] io_probe_bits_tag,
  output [5:0]  io_probe_bits_off,
  output [31:0] io_probe_bits_mask,
  output [2:0]  io_probe_bits_bufIdx,
  output        io_probe_bits_preferCache,
  output        io_probe_bits_dirty,
  output        io_probe_bits_fromProbeHelper,
  output        io_probe_bits_fromCmoHelper,
  output        io_probe_bits_needProbeAckData,
  output        io_full
);
  wire  queue_clock; // @[ProbeHelper.scala 19:21]
  wire  queue_reset; // @[ProbeHelper.scala 19:21]
  wire  queue_io_enq_ready; // @[ProbeHelper.scala 19:21]
  wire  queue_io_enq_valid; // @[ProbeHelper.scala 19:21]
  wire [5:0] queue_io_enq_bits_source; // @[ProbeHelper.scala 19:21]
  wire [9:0] queue_io_enq_bits_set; // @[ProbeHelper.scala 19:21]
  wire [19:0] queue_io_enq_bits_tag; // @[ProbeHelper.scala 19:21]
  wire  queue_io_deq_ready; // @[ProbeHelper.scala 19:21]
  wire  queue_io_deq_valid; // @[ProbeHelper.scala 19:21]
  wire [2:0] queue_io_deq_bits_channel; // @[ProbeHelper.scala 19:21]
  wire [2:0] queue_io_deq_bits_opcode; // @[ProbeHelper.scala 19:21]
  wire [2:0] queue_io_deq_bits_param; // @[ProbeHelper.scala 19:21]
  wire [2:0] queue_io_deq_bits_size; // @[ProbeHelper.scala 19:21]
  wire [5:0] queue_io_deq_bits_source; // @[ProbeHelper.scala 19:21]
  wire [9:0] queue_io_deq_bits_set; // @[ProbeHelper.scala 19:21]
  wire [19:0] queue_io_deq_bits_tag; // @[ProbeHelper.scala 19:21]
  wire [5:0] queue_io_deq_bits_off; // @[ProbeHelper.scala 19:21]
  wire [31:0] queue_io_deq_bits_mask; // @[ProbeHelper.scala 19:21]
  wire [2:0] queue_io_deq_bits_bufIdx; // @[ProbeHelper.scala 19:21]
  wire  queue_io_deq_bits_preferCache; // @[ProbeHelper.scala 19:21]
  wire  queue_io_deq_bits_dirty; // @[ProbeHelper.scala 19:21]
  wire  queue_io_deq_bits_fromProbeHelper; // @[ProbeHelper.scala 19:21]
  wire  queue_io_deq_bits_fromCmoHelper; // @[ProbeHelper.scala 19:21]
  wire  queue_io_deq_bits_needProbeAckData; // @[ProbeHelper.scala 19:21]
  wire [2:0] queue_io_count; // @[ProbeHelper.scala 19:21]
  wire [29:0] addr = {io_dirResult_bits_clients_tag,io_dirResult_bits_set[6:0]}; // @[Cat.scala 31:58]
  wire  _dir_conflict_T_3 = ~io_dirResult_bits_clients_states_0_hit & io_dirResult_bits_clients_states_0_state != 2'h0; // @[ProbeHelper.scala 54:40]
  wire  _dir_conflict_T_6 = ~io_dirResult_bits_clients_states_1_hit & io_dirResult_bits_clients_states_1_state != 2'h0; // @[ProbeHelper.scala 54:40]
  wire [1:0] _dir_conflict_T_7 = {_dir_conflict_T_3,_dir_conflict_T_6}; // @[Cat.scala 31:58]
  wire  _dir_conflict_T_8 = |_dir_conflict_T_7; // @[ProbeHelper.scala 55:8]
  wire  dir_conflict = ~io_dirResult_bits_clients_tag_match & _dir_conflict_T_8; // @[ProbeHelper.scala 53:45]
  wire  formA = io_dirResult_bits_replacerInfo_channel == 3'h1; // @[ProbeHelper.scala 56:40]
  wire  _req_acquire_T_1 = io_dirResult_bits_replacerInfo_opcode == 3'h6; // @[ProbeHelper.scala 58:29]
  wire  req_acquire = formA & (io_dirResult_bits_replacerInfo_opcode == 3'h7 | _req_acquire_T_1); // @[ProbeHelper.scala 57:27]
  Queue_199 queue ( // @[ProbeHelper.scala 19:21]
    .clock(queue_clock),
    .reset(queue_reset),
    .io_enq_ready(queue_io_enq_ready),
    .io_enq_valid(queue_io_enq_valid),
    .io_enq_bits_source(queue_io_enq_bits_source),
    .io_enq_bits_set(queue_io_enq_bits_set),
    .io_enq_bits_tag(queue_io_enq_bits_tag),
    .io_deq_ready(queue_io_deq_ready),
    .io_deq_valid(queue_io_deq_valid),
    .io_deq_bits_channel(queue_io_deq_bits_channel),
    .io_deq_bits_opcode(queue_io_deq_bits_opcode),
    .io_deq_bits_param(queue_io_deq_bits_param),
    .io_deq_bits_size(queue_io_deq_bits_size),
    .io_deq_bits_source(queue_io_deq_bits_source),
    .io_deq_bits_set(queue_io_deq_bits_set),
    .io_deq_bits_tag(queue_io_deq_bits_tag),
    .io_deq_bits_off(queue_io_deq_bits_off),
    .io_deq_bits_mask(queue_io_deq_bits_mask),
    .io_deq_bits_bufIdx(queue_io_deq_bits_bufIdx),
    .io_deq_bits_preferCache(queue_io_deq_bits_preferCache),
    .io_deq_bits_dirty(queue_io_deq_bits_dirty),
    .io_deq_bits_fromProbeHelper(queue_io_deq_bits_fromProbeHelper),
    .io_deq_bits_fromCmoHelper(queue_io_deq_bits_fromCmoHelper),
    .io_deq_bits_needProbeAckData(queue_io_deq_bits_needProbeAckData),
    .io_count(queue_io_count)
  );
  assign io_probe_valid = queue_io_deq_valid; // @[ProbeHelper.scala 63:12]
  assign io_probe_bits_channel = queue_io_deq_bits_channel; // @[ProbeHelper.scala 63:12]
  assign io_probe_bits_opcode = queue_io_deq_bits_opcode; // @[ProbeHelper.scala 63:12]
  assign io_probe_bits_param = queue_io_deq_bits_param; // @[ProbeHelper.scala 63:12]
  assign io_probe_bits_size = queue_io_deq_bits_size; // @[ProbeHelper.scala 63:12]
  assign io_probe_bits_source = queue_io_deq_bits_source; // @[ProbeHelper.scala 63:12]
  assign io_probe_bits_set = queue_io_deq_bits_set; // @[ProbeHelper.scala 63:12]
  assign io_probe_bits_tag = queue_io_deq_bits_tag; // @[ProbeHelper.scala 63:12]
  assign io_probe_bits_off = queue_io_deq_bits_off; // @[ProbeHelper.scala 63:12]
  assign io_probe_bits_mask = queue_io_deq_bits_mask; // @[ProbeHelper.scala 63:12]
  assign io_probe_bits_bufIdx = queue_io_deq_bits_bufIdx; // @[ProbeHelper.scala 63:12]
  assign io_probe_bits_preferCache = queue_io_deq_bits_preferCache; // @[ProbeHelper.scala 63:12]
  assign io_probe_bits_dirty = queue_io_deq_bits_dirty; // @[ProbeHelper.scala 63:12]
  assign io_probe_bits_fromProbeHelper = queue_io_deq_bits_fromProbeHelper; // @[ProbeHelper.scala 63:12]
  assign io_probe_bits_fromCmoHelper = queue_io_deq_bits_fromCmoHelper; // @[ProbeHelper.scala 63:12]
  assign io_probe_bits_needProbeAckData = queue_io_deq_bits_needProbeAckData; // @[ProbeHelper.scala 63:12]
  assign io_full = queue_io_count >= 3'h3; // @[ProbeHelper.scala 21:29]
  assign queue_clock = clock;
  assign queue_reset = reset;
  assign queue_io_enq_valid = req_acquire & io_dirResult_valid & dir_conflict; // @[ProbeHelper.scala 59:59]
  assign queue_io_enq_bits_source = io_dirResult_bits_sourceId; // @[ProbeHelper.scala 25:17 37:14]
  assign queue_io_enq_bits_set = addr[9:0]; // @[ProbeHelper.scala 30:26]
  assign queue_io_enq_bits_tag = addr[29:10]; // @[ProbeHelper.scala 29:26]
  assign queue_io_deq_ready = io_probe_ready; // @[ProbeHelper.scala 63:12]
endmodule

