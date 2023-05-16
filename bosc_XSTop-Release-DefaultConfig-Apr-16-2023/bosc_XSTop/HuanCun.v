module HuanCun(
  input          clock,
  input          reset,
  output         auto_in_a_ready,
  input          auto_in_a_valid,
  input  [2:0]   auto_in_a_bits_opcode,
  input  [2:0]   auto_in_a_bits_param,
  input  [2:0]   auto_in_a_bits_size,
  input  [5:0]   auto_in_a_bits_source,
  input  [35:0]  auto_in_a_bits_address,
  input          auto_in_a_bits_user_preferCache,
  input  [31:0]  auto_in_a_bits_mask,
  input  [255:0] auto_in_a_bits_data,
  input          auto_in_bready,
  output         auto_in_bvalid,
  output [1:0]   auto_in_bparam,
  output [5:0]   auto_in_bsource,
  output [35:0]  auto_in_baddress,
  output [255:0] auto_in_bdata,
  output         auto_in_c_ready,
  input          auto_in_c_valid,
  input  [2:0]   auto_in_c_bits_opcode,
  input  [2:0]   auto_in_c_bits_param,
  input  [2:0]   auto_in_c_bits_size,
  input  [5:0]   auto_in_c_bits_source,
  input  [35:0]  auto_in_c_bits_address,
  input          auto_in_c_bits_echo_blockisdirty,
  input  [255:0] auto_in_c_bits_data,
  input          auto_in_d_ready,
  output         auto_in_d_valid,
  output [2:0]   auto_in_d_bits_opcode,
  output [1:0]   auto_in_d_bits_param,
  output [2:0]   auto_in_d_bits_size,
  output [5:0]   auto_in_d_bits_source,
  output [3:0]   auto_in_d_bits_sink,
  output         auto_in_d_bits_denied,
  output         auto_in_d_bits_echo_blockisdirty,
  output [255:0] auto_in_d_bits_data,
  output         auto_in_d_bits_corrupt,
  input          auto_in_e_valid,
  input  [3:0]   auto_in_e_bits_sink,
  input          auto_out_a_ready,
  output         auto_out_a_valid,
  output [2:0]   auto_out_a_bits_opcode,
  output [2:0]   auto_out_a_bits_param,
  output [2:0]   auto_out_a_bits_size,
  output [3:0]   auto_out_a_bits_source,
  output [35:0]  auto_out_a_bits_address,
  output [31:0]  auto_out_a_bits_mask,
  output [255:0] auto_out_a_bits_data,
  input          auto_out_c_ready,
  output         auto_out_c_valid,
  output [2:0]   auto_out_c_bits_opcode,
  output [2:0]   auto_out_c_bits_size,
  output [3:0]   auto_out_c_bits_source,
  output [35:0]  auto_out_c_bits_address,
  output [255:0] auto_out_c_bits_data,
  output         auto_out_d_ready,
  input          auto_out_d_valid,
  input  [2:0]   auto_out_d_bits_opcode,
  input  [1:0]   auto_out_d_bits_param,
  input  [2:0]   auto_out_d_bits_size,
  input  [3:0]   auto_out_d_bits_source,
  input  [2:0]   auto_out_d_bits_sink,
  input          auto_out_d_bits_denied,
  input  [255:0] auto_out_d_bits_data,
  output         auto_out_e_valid,
  output [2:0]   auto_out_e_bits_sink
);
  wire  rst_resetSync_clock; // @[ResetGen.scala 40:27]
  wire  rst_resetSync_reset; // @[ResetGen.scala 40:27]
  wire  rst_resetSync_o_reset; // @[ResetGen.scala 40:27]
  wire  slices_0_clock; // @[HuanCun.scala 329:43]
  wire  slices_0_reset; // @[HuanCun.scala 329:43]
  wire  slices_0_io_in_a_ready; // @[HuanCun.scala 329:43]
  wire  slices_0_io_in_a_valid; // @[HuanCun.scala 329:43]
  wire [2:0] slices_0_io_in_a_bits_opcode; // @[HuanCun.scala 329:43]
  wire [2:0] slices_0_io_in_a_bits_param; // @[HuanCun.scala 329:43]
  wire [2:0] slices_0_io_in_a_bits_size; // @[HuanCun.scala 329:43]
  wire [5:0] slices_0_io_in_a_bits_source; // @[HuanCun.scala 329:43]
  wire [35:0] slices_0_io_in_a_bits_address; // @[HuanCun.scala 329:43]
  wire  slices_0_io_in_a_bits_user_preferCache; // @[HuanCun.scala 329:43]
  wire [31:0] slices_0_io_in_a_bits_mask; // @[HuanCun.scala 329:43]
  wire [255:0] slices_0_io_in_a_bits_data; // @[HuanCun.scala 329:43]
  wire  slices_0_io_in_bready; // @[HuanCun.scala 329:43]
  wire  slices_0_io_in_bvalid; // @[HuanCun.scala 329:43]
  wire [1:0] slices_0_io_in_bparam; // @[HuanCun.scala 329:43]
  wire [5:0] slices_0_io_in_bsource; // @[HuanCun.scala 329:43]
  wire [35:0] slices_0_io_in_baddress; // @[HuanCun.scala 329:43]
  wire [255:0] slices_0_io_in_bdata; // @[HuanCun.scala 329:43]
  wire  slices_0_io_in_c_ready; // @[HuanCun.scala 329:43]
  wire  slices_0_io_in_c_valid; // @[HuanCun.scala 329:43]
  wire [2:0] slices_0_io_in_c_bits_opcode; // @[HuanCun.scala 329:43]
  wire [2:0] slices_0_io_in_c_bits_param; // @[HuanCun.scala 329:43]
  wire [2:0] slices_0_io_in_c_bits_size; // @[HuanCun.scala 329:43]
  wire [5:0] slices_0_io_in_c_bits_source; // @[HuanCun.scala 329:43]
  wire [35:0] slices_0_io_in_c_bits_address; // @[HuanCun.scala 329:43]
  wire  slices_0_io_in_c_bits_echo_blockisdirty; // @[HuanCun.scala 329:43]
  wire [255:0] slices_0_io_in_c_bits_data; // @[HuanCun.scala 329:43]
  wire  slices_0_io_in_d_ready; // @[HuanCun.scala 329:43]
  wire  slices_0_io_in_d_valid; // @[HuanCun.scala 329:43]
  wire [2:0] slices_0_io_in_d_bits_opcode; // @[HuanCun.scala 329:43]
  wire [1:0] slices_0_io_in_d_bits_param; // @[HuanCun.scala 329:43]
  wire [2:0] slices_0_io_in_d_bits_size; // @[HuanCun.scala 329:43]
  wire [5:0] slices_0_io_in_d_bits_source; // @[HuanCun.scala 329:43]
  wire [3:0] slices_0_io_in_d_bits_sink; // @[HuanCun.scala 329:43]
  wire  slices_0_io_in_d_bits_denied; // @[HuanCun.scala 329:43]
  wire  slices_0_io_in_d_bits_echo_blockisdirty; // @[HuanCun.scala 329:43]
  wire [255:0] slices_0_io_in_d_bits_data; // @[HuanCun.scala 329:43]
  wire  slices_0_io_in_d_bits_corrupt; // @[HuanCun.scala 329:43]
  wire  slices_0_io_in_e_valid; // @[HuanCun.scala 329:43]
  wire [3:0] slices_0_io_in_e_bits_sink; // @[HuanCun.scala 329:43]
  wire  slices_0_io_out_a_ready; // @[HuanCun.scala 329:43]
  wire  slices_0_io_out_a_valid; // @[HuanCun.scala 329:43]
  wire [2:0] slices_0_io_out_a_bits_opcode; // @[HuanCun.scala 329:43]
  wire [2:0] slices_0_io_out_a_bits_param; // @[HuanCun.scala 329:43]
  wire [2:0] slices_0_io_out_a_bits_size; // @[HuanCun.scala 329:43]
  wire [3:0] slices_0_io_out_a_bits_source; // @[HuanCun.scala 329:43]
  wire [35:0] slices_0_io_out_a_bits_address; // @[HuanCun.scala 329:43]
  wire [31:0] slices_0_io_out_a_bits_mask; // @[HuanCun.scala 329:43]
  wire [255:0] slices_0_io_out_a_bits_data; // @[HuanCun.scala 329:43]
  wire  slices_0_io_out_c_ready; // @[HuanCun.scala 329:43]
  wire  slices_0_io_out_c_valid; // @[HuanCun.scala 329:43]
  wire [2:0] slices_0_io_out_c_bits_opcode; // @[HuanCun.scala 329:43]
  wire [2:0] slices_0_io_out_c_bits_size; // @[HuanCun.scala 329:43]
  wire [3:0] slices_0_io_out_c_bits_source; // @[HuanCun.scala 329:43]
  wire [35:0] slices_0_io_out_c_bits_address; // @[HuanCun.scala 329:43]
  wire [255:0] slices_0_io_out_c_bits_data; // @[HuanCun.scala 329:43]
  wire  slices_0_io_out_d_ready; // @[HuanCun.scala 329:43]
  wire  slices_0_io_out_d_valid; // @[HuanCun.scala 329:43]
  wire [2:0] slices_0_io_out_d_bits_opcode; // @[HuanCun.scala 329:43]
  wire [1:0] slices_0_io_out_d_bits_param; // @[HuanCun.scala 329:43]
  wire [2:0] slices_0_io_out_d_bits_size; // @[HuanCun.scala 329:43]
  wire [3:0] slices_0_io_out_d_bits_source; // @[HuanCun.scala 329:43]
  wire [2:0] slices_0_io_out_d_bits_sink; // @[HuanCun.scala 329:43]
  wire  slices_0_io_out_d_bits_denied; // @[HuanCun.scala 329:43]
  wire [255:0] slices_0_io_out_d_bits_data; // @[HuanCun.scala 329:43]
  wire  slices_0_io_out_e_valid; // @[HuanCun.scala 329:43]
  wire [2:0] slices_0_io_out_e_bits_sink; // @[HuanCun.scala 329:43]
  ResetGen rst_resetSync ( // @[ResetGen.scala 40:27]
    .clock(rst_resetSync_clock),
    .reset(rst_resetSync_reset),
    .o_reset(rst_resetSync_o_reset)
  );
  Slice slices_0 ( // @[HuanCun.scala 329:43]
    .clock(slices_0_clock),
    .reset(slices_0_reset),
    .io_in_a_ready(slices_0_io_in_a_ready),
    .io_in_a_valid(slices_0_io_in_a_valid),
    .io_in_a_bits_opcode(slices_0_io_in_a_bits_opcode),
    .io_in_a_bits_param(slices_0_io_in_a_bits_param),
    .io_in_a_bits_size(slices_0_io_in_a_bits_size),
    .io_in_a_bits_source(slices_0_io_in_a_bits_source),
    .io_in_a_bits_address(slices_0_io_in_a_bits_address),
    .io_in_a_bits_user_preferCache(slices_0_io_in_a_bits_user_preferCache),
    .io_in_a_bits_mask(slices_0_io_in_a_bits_mask),
    .io_in_a_bits_data(slices_0_io_in_a_bits_data),
    .io_in_bready(slices_0_io_in_bready),
    .io_in_bvalid(slices_0_io_in_bvalid),
    .io_in_bparam(slices_0_io_in_bparam),
    .io_in_bsource(slices_0_io_in_bsource),
    .io_in_baddress(slices_0_io_in_baddress),
    .io_in_bdata(slices_0_io_in_bdata),
    .io_in_c_ready(slices_0_io_in_c_ready),
    .io_in_c_valid(slices_0_io_in_c_valid),
    .io_in_c_bits_opcode(slices_0_io_in_c_bits_opcode),
    .io_in_c_bits_param(slices_0_io_in_c_bits_param),
    .io_in_c_bits_size(slices_0_io_in_c_bits_size),
    .io_in_c_bits_source(slices_0_io_in_c_bits_source),
    .io_in_c_bits_address(slices_0_io_in_c_bits_address),
    .io_in_c_bits_echo_blockisdirty(slices_0_io_in_c_bits_echo_blockisdirty),
    .io_in_c_bits_data(slices_0_io_in_c_bits_data),
    .io_in_d_ready(slices_0_io_in_d_ready),
    .io_in_d_valid(slices_0_io_in_d_valid),
    .io_in_d_bits_opcode(slices_0_io_in_d_bits_opcode),
    .io_in_d_bits_param(slices_0_io_in_d_bits_param),
    .io_in_d_bits_size(slices_0_io_in_d_bits_size),
    .io_in_d_bits_source(slices_0_io_in_d_bits_source),
    .io_in_d_bits_sink(slices_0_io_in_d_bits_sink),
    .io_in_d_bits_denied(slices_0_io_in_d_bits_denied),
    .io_in_d_bits_echo_blockisdirty(slices_0_io_in_d_bits_echo_blockisdirty),
    .io_in_d_bits_data(slices_0_io_in_d_bits_data),
    .io_in_d_bits_corrupt(slices_0_io_in_d_bits_corrupt),
    .io_in_e_valid(slices_0_io_in_e_valid),
    .io_in_e_bits_sink(slices_0_io_in_e_bits_sink),
    .io_out_a_ready(slices_0_io_out_a_ready),
    .io_out_a_valid(slices_0_io_out_a_valid),
    .io_out_a_bits_opcode(slices_0_io_out_a_bits_opcode),
    .io_out_a_bits_param(slices_0_io_out_a_bits_param),
    .io_out_a_bits_size(slices_0_io_out_a_bits_size),
    .io_out_a_bits_source(slices_0_io_out_a_bits_source),
    .io_out_a_bits_address(slices_0_io_out_a_bits_address),
    .io_out_a_bits_mask(slices_0_io_out_a_bits_mask),
    .io_out_a_bits_data(slices_0_io_out_a_bits_data),
    .io_out_c_ready(slices_0_io_out_c_ready),
    .io_out_c_valid(slices_0_io_out_c_valid),
    .io_out_c_bits_opcode(slices_0_io_out_c_bits_opcode),
    .io_out_c_bits_size(slices_0_io_out_c_bits_size),
    .io_out_c_bits_source(slices_0_io_out_c_bits_source),
    .io_out_c_bits_address(slices_0_io_out_c_bits_address),
    .io_out_c_bits_data(slices_0_io_out_c_bits_data),
    .io_out_d_ready(slices_0_io_out_d_ready),
    .io_out_d_valid(slices_0_io_out_d_valid),
    .io_out_d_bits_opcode(slices_0_io_out_d_bits_opcode),
    .io_out_d_bits_param(slices_0_io_out_d_bits_param),
    .io_out_d_bits_size(slices_0_io_out_d_bits_size),
    .io_out_d_bits_source(slices_0_io_out_d_bits_source),
    .io_out_d_bits_sink(slices_0_io_out_d_bits_sink),
    .io_out_d_bits_denied(slices_0_io_out_d_bits_denied),
    .io_out_d_bits_data(slices_0_io_out_d_bits_data),
    .io_out_e_valid(slices_0_io_out_e_valid),
    .io_out_e_bits_sink(slices_0_io_out_e_bits_sink)
  );
  assign auto_in_a_ready = slices_0_io_in_a_ready; // @[Nodes.scala 1210:84 HuanCun.scala 334:21]
  assign auto_in_bvalid = slices_0_io_in_bvalid; // @[Nodes.scala 1210:84 HuanCun.scala 334:21]
  assign auto_in_bparam = slices_0_io_in_bparam; // @[Nodes.scala 1210:84 HuanCun.scala 334:21]
  assign auto_in_bsource = slices_0_io_in_bsource; // @[Nodes.scala 1210:84 HuanCun.scala 334:21]
  assign auto_in_baddress = slices_0_io_in_baddress; // @[Nodes.scala 1210:84 HuanCun.scala 335:27]
  assign auto_in_bdata = slices_0_io_in_bdata; // @[Nodes.scala 1210:84 HuanCun.scala 334:21]
  assign auto_in_c_ready = slices_0_io_in_c_ready; // @[Nodes.scala 1210:84 HuanCun.scala 334:21]
  assign auto_in_d_valid = slices_0_io_in_d_valid; // @[Nodes.scala 1210:84 HuanCun.scala 334:21]
  assign auto_in_d_bits_opcode = slices_0_io_in_d_bits_opcode; // @[Nodes.scala 1210:84 HuanCun.scala 334:21]
  assign auto_in_d_bits_param = slices_0_io_in_d_bits_param; // @[Nodes.scala 1210:84 HuanCun.scala 334:21]
  assign auto_in_d_bits_size = slices_0_io_in_d_bits_size; // @[Nodes.scala 1210:84 HuanCun.scala 334:21]
  assign auto_in_d_bits_source = slices_0_io_in_d_bits_source; // @[Nodes.scala 1210:84 HuanCun.scala 334:21]
  assign auto_in_d_bits_sink = slices_0_io_in_d_bits_sink; // @[Nodes.scala 1210:84 HuanCun.scala 334:21]
  assign auto_in_d_bits_denied = slices_0_io_in_d_bits_denied; // @[Nodes.scala 1210:84 HuanCun.scala 334:21]
  assign auto_in_d_bits_echo_blockisdirty = slices_0_io_in_d_bits_echo_blockisdirty; // @[Nodes.scala 1210:84 HuanCun.scala 334:21]
  assign auto_in_d_bits_data = slices_0_io_in_d_bits_data; // @[Nodes.scala 1210:84 HuanCun.scala 334:21]
  assign auto_in_d_bits_corrupt = slices_0_io_in_d_bits_corrupt; // @[Nodes.scala 1210:84 HuanCun.scala 334:21]
  assign auto_out_a_valid = slices_0_io_out_a_valid; // @[Nodes.scala 1207:84 HuanCun.scala 336:13]
  assign auto_out_a_bits_opcode = slices_0_io_out_a_bits_opcode; // @[Nodes.scala 1207:84 HuanCun.scala 336:13]
  assign auto_out_a_bits_param = slices_0_io_out_a_bits_param; // @[Nodes.scala 1207:84 HuanCun.scala 336:13]
  assign auto_out_a_bits_size = slices_0_io_out_a_bits_size; // @[Nodes.scala 1207:84 HuanCun.scala 336:13]
  assign auto_out_a_bits_source = slices_0_io_out_a_bits_source; // @[Nodes.scala 1207:84 HuanCun.scala 336:13]
  assign auto_out_a_bits_address = slices_0_io_out_a_bits_address; // @[Nodes.scala 1207:84 HuanCun.scala 337:28]
  assign auto_out_a_bits_mask = slices_0_io_out_a_bits_mask; // @[Nodes.scala 1207:84 HuanCun.scala 336:13]
  assign auto_out_a_bits_data = slices_0_io_out_a_bits_data; // @[Nodes.scala 1207:84 HuanCun.scala 336:13]
  assign auto_out_c_valid = slices_0_io_out_c_valid; // @[Nodes.scala 1207:84 HuanCun.scala 336:13]
  assign auto_out_c_bits_opcode = slices_0_io_out_c_bits_opcode; // @[Nodes.scala 1207:84 HuanCun.scala 336:13]
  assign auto_out_c_bits_size = slices_0_io_out_c_bits_size; // @[Nodes.scala 1207:84 HuanCun.scala 336:13]
  assign auto_out_c_bits_source = slices_0_io_out_c_bits_source; // @[Nodes.scala 1207:84 HuanCun.scala 336:13]
  assign auto_out_c_bits_address = slices_0_io_out_c_bits_address; // @[Nodes.scala 1207:84 HuanCun.scala 338:28]
  assign auto_out_c_bits_data = slices_0_io_out_c_bits_data; // @[Nodes.scala 1207:84 HuanCun.scala 336:13]
  assign auto_out_d_ready = slices_0_io_out_d_ready; // @[Nodes.scala 1207:84 HuanCun.scala 336:13]
  assign auto_out_e_valid = slices_0_io_out_e_valid; // @[Nodes.scala 1207:84 HuanCun.scala 336:13]
  assign auto_out_e_bits_sink = slices_0_io_out_e_bits_sink; // @[Nodes.scala 1207:84 HuanCun.scala 336:13]
  assign rst_resetSync_clock = clock;
  assign rst_resetSync_reset = reset;
  assign slices_0_clock = clock;
  assign slices_0_reset = rst_resetSync_o_reset;
  assign slices_0_io_in_a_valid = auto_in_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign slices_0_io_in_a_bits_opcode = auto_in_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign slices_0_io_in_a_bits_param = auto_in_a_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign slices_0_io_in_a_bits_size = auto_in_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign slices_0_io_in_a_bits_source = auto_in_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign slices_0_io_in_a_bits_address = auto_in_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign slices_0_io_in_a_bits_user_preferCache = auto_in_a_bits_user_preferCache; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign slices_0_io_in_a_bits_mask = auto_in_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign slices_0_io_in_a_bits_data = auto_in_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign slices_0_io_in_bready = auto_in_bready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign slices_0_io_in_c_valid = auto_in_c_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign slices_0_io_in_c_bits_opcode = auto_in_c_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign slices_0_io_in_c_bits_param = auto_in_c_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign slices_0_io_in_c_bits_size = auto_in_c_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign slices_0_io_in_c_bits_source = auto_in_c_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign slices_0_io_in_c_bits_address = auto_in_c_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign slices_0_io_in_c_bits_echo_blockisdirty = auto_in_c_bits_echo_blockisdirty; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign slices_0_io_in_c_bits_data = auto_in_c_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign slices_0_io_in_d_ready = auto_in_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign slices_0_io_in_e_valid = auto_in_e_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign slices_0_io_in_e_bits_sink = auto_in_e_bits_sink; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign slices_0_io_out_a_ready = auto_out_a_ready; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign slices_0_io_out_c_ready = auto_out_c_ready; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign slices_0_io_out_d_valid = auto_out_d_valid; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign slices_0_io_out_d_bits_opcode = auto_out_d_bits_opcode; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign slices_0_io_out_d_bits_param = auto_out_d_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign slices_0_io_out_d_bits_size = auto_out_d_bits_size; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign slices_0_io_out_d_bits_source = auto_out_d_bits_source; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign slices_0_io_out_d_bits_sink = auto_out_d_bits_sink; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign slices_0_io_out_d_bits_denied = auto_out_d_bits_denied; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign slices_0_io_out_d_bits_data = auto_out_d_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
endmodule

