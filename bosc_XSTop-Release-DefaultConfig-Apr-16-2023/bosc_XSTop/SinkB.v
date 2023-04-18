module SinkB(
  output         io_bready,
  input          io_bvalid,
  input  [2:0]   io_bopcode,
  input  [1:0]   io_bparam,
  input  [2:0]   io_bsize,
  input  [3:0]   io_bsource,
  input  [35:0]  io_baddress,
  input  [31:0]  io_bmask,
  input  [255:0] io_bdata,
  input          io_alloc_ready,
  output         io_alloc_valid,
  output [2:0]   io_alloc_bits_opcode,
  output [2:0]   io_alloc_bits_param,
  output [2:0]   io_alloc_bits_size,
  output [5:0]   io_alloc_bits_source,
  output [9:0]   io_alloc_bits_set,
  output [19:0]  io_alloc_bits_tag,
  output [5:0]   io_alloc_bits_off,
  output [31:0]  io_alloc_bits_mask,
  output         io_alloc_bits_needProbeAckData
);
  wire [29:0] set = io_baddress[35:6]; // @[HuanCun.scala 143:22]
  assign io_bready = io_alloc_ready; // @[SinkB.scala 33:14]
  assign io_alloc_valid = io_bvalid; // @[SinkB.scala 34:18]
  assign io_alloc_bits_opcode = io_bopcode; // @[SinkB.scala 38:24]
  assign io_alloc_bits_param = {{1'd0}, io_bparam}; // @[SinkB.scala 39:23]
  assign io_alloc_bits_size = io_bsize; // @[SinkB.scala 41:22]
  assign io_alloc_bits_source = {{2'd0}, io_bsource}; // @[SinkB.scala 42:24]
  assign io_alloc_bits_set = set[9:0]; // @[HuanCun.scala 145:30]
  assign io_alloc_bits_tag = set[29:10]; // @[HuanCun.scala 144:19]
  assign io_alloc_bits_off = io_baddress[5:0]; // @[HuanCun.scala 145:54]
  assign io_alloc_bits_mask = io_bmask; // @[SinkB.scala 46:22]
  assign io_alloc_bits_needProbeAckData = io_bdata[0]; // @[SinkB.scala 56:61]
endmodule

