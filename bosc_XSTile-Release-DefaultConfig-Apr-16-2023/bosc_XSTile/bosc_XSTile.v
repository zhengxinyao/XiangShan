module bosc_XSTile(
  input          clock,
  input          reset,
  output         auto_misc_beu_int_out_0,
  input          auto_misc_memory_port_out_a_ready,
  output         auto_misc_memory_port_out_a_valid,
  output [2:0]   auto_misc_memory_port_out_a_bits_opcode,
  output [2:0]   auto_misc_memory_port_out_a_bits_param,
  output [2:0]   auto_misc_memory_port_out_a_bits_size,
  output [4:0]   auto_misc_memory_port_out_a_bits_source,
  output [35:0]  auto_misc_memory_port_out_a_bits_address,
  output         auto_misc_memory_port_out_a_bits_user_preferCache,
  output [31:0]  auto_misc_memory_port_out_a_bits_mask,
  output [255:0] auto_misc_memory_port_out_a_bits_data,
  output         auto_misc_memory_port_out_bready,
  input          auto_misc_memory_port_out_bvalid,
  input  [2:0]   auto_misc_memory_port_out_bopcode,
  input  [1:0]   auto_misc_memory_port_out_bparam,
  input  [2:0]   auto_misc_memory_port_out_bsize,
  input  [4:0]   auto_misc_memory_port_out_bsource,
  input  [35:0]  auto_misc_memory_port_out_baddress,
  input  [31:0]  auto_misc_memory_port_out_bmask,
  input  [255:0] auto_misc_memory_port_out_bdata,
  input          auto_misc_memory_port_out_c_ready,
  output         auto_misc_memory_port_out_c_valid,
  output [2:0]   auto_misc_memory_port_out_c_bits_opcode,
  output [2:0]   auto_misc_memory_port_out_c_bits_param,
  output [2:0]   auto_misc_memory_port_out_c_bits_size,
  output [4:0]   auto_misc_memory_port_out_c_bits_source,
  output [35:0]  auto_misc_memory_port_out_c_bits_address,
  output         auto_misc_memory_port_out_c_bits_echo_blockisdirty,
  output [255:0] auto_misc_memory_port_out_c_bits_data,
  output         auto_misc_memory_port_out_d_ready,
  input          auto_misc_memory_port_out_d_valid,
  input  [2:0]   auto_misc_memory_port_out_d_bits_opcode,
  input  [1:0]   auto_misc_memory_port_out_d_bits_param,
  input  [2:0]   auto_misc_memory_port_out_d_bits_size,
  input  [4:0]   auto_misc_memory_port_out_d_bits_source,
  input  [3:0]   auto_misc_memory_port_out_d_bits_sink,
  input          auto_misc_memory_port_out_d_bits_denied,
  input          auto_misc_memory_port_out_d_bits_echo_blockisdirty,
  input  [255:0] auto_misc_memory_port_out_d_bits_data,
  input          auto_misc_memory_port_out_d_bits_corrupt,
  input          auto_misc_memory_port_out_e_ready,
  output         auto_misc_memory_port_out_e_valid,
  output [3:0]   auto_misc_memory_port_out_e_bits_sink,
  input          auto_misc_mmio_port_out_a_ready,
  output         auto_misc_mmio_port_out_a_valid,
  output [2:0]   auto_misc_mmio_port_out_a_bits_opcode,
  output [2:0]   auto_misc_mmio_port_out_a_bits_size,
  output [2:0]   auto_misc_mmio_port_out_a_bits_source,
  output [35:0]  auto_misc_mmio_port_out_a_bits_address,
  output [7:0]   auto_misc_mmio_port_out_a_bits_mask,
  output [63:0]  auto_misc_mmio_port_out_a_bits_data,
  output         auto_misc_mmio_port_out_d_ready,
  input          auto_misc_mmio_port_out_d_valid,
  input  [2:0]   auto_misc_mmio_port_out_d_bits_opcode,
  input  [2:0]   auto_misc_mmio_port_out_d_bits_size,
  input  [2:0]   auto_misc_mmio_port_out_d_bits_source,
  input  [63:0]  auto_misc_mmio_port_out_d_bits_data,
  input          auto_core_plic_int_sink_in_1_0,
  input          auto_core_plic_int_sink_in_0_0,
  input          auto_core_debug_int_sink_in_0,
  input          auto_core_clint_int_sink_in_0,
  input          auto_core_clint_int_sink_in_1,
  input  [63:0]  io_hartId,
  input  [35:0]  io_reset_vector,
  output         io_cpu_halt
);
  wire  core_clock; // @[XSTile.scala 79:32]
  wire  core_reset; // @[XSTile.scala 79:32]
  wire  core_auto_memBlock_uncache_client_out_a_ready; // @[XSTile.scala 79:32]
  wire  core_auto_memBlock_uncache_client_out_a_valid; // @[XSTile.scala 79:32]
  wire [2:0] core_auto_memBlock_uncache_client_out_a_bits_opcode; // @[XSTile.scala 79:32]
  wire [2:0] core_auto_memBlock_uncache_client_out_a_bits_size; // @[XSTile.scala 79:32]
  wire [1:0] core_auto_memBlock_uncache_client_out_a_bits_source; // @[XSTile.scala 79:32]
  wire [35:0] core_auto_memBlock_uncache_client_out_a_bits_address; // @[XSTile.scala 79:32]
  wire [7:0] core_auto_memBlock_uncache_client_out_a_bits_mask; // @[XSTile.scala 79:32]
  wire [63:0] core_auto_memBlock_uncache_client_out_a_bits_data; // @[XSTile.scala 79:32]
  wire  core_auto_memBlock_uncache_client_out_d_ready; // @[XSTile.scala 79:32]
  wire  core_auto_memBlock_uncache_client_out_d_valid; // @[XSTile.scala 79:32]
  wire [2:0] core_auto_memBlock_uncache_client_out_d_bits_opcode; // @[XSTile.scala 79:32]
  wire [63:0] core_auto_memBlock_uncache_client_out_d_bits_data; // @[XSTile.scala 79:32]
  wire  core_auto_memBlock_dcache_client_out_a_ready; // @[XSTile.scala 79:32]
  wire  core_auto_memBlock_dcache_client_out_a_valid; // @[XSTile.scala 79:32]
  wire [2:0] core_auto_memBlock_dcache_client_out_a_bits_opcode; // @[XSTile.scala 79:32]
  wire [2:0] core_auto_memBlock_dcache_client_out_a_bits_param; // @[XSTile.scala 79:32]
  wire [2:0] core_auto_memBlock_dcache_client_out_a_bits_size; // @[XSTile.scala 79:32]
  wire [3:0] core_auto_memBlock_dcache_client_out_a_bits_source; // @[XSTile.scala 79:32]
  wire [35:0] core_auto_memBlock_dcache_client_out_a_bits_address; // @[XSTile.scala 79:32]
  wire [31:0] core_auto_memBlock_dcache_client_out_a_bits_mask; // @[XSTile.scala 79:32]
  wire  core_auto_memBlock_dcache_client_out_bready; // @[XSTile.scala 79:32]
  wire  core_auto_memBlock_dcache_client_out_bvalid; // @[XSTile.scala 79:32]
  wire [1:0] core_auto_memBlock_dcache_client_out_bparam; // @[XSTile.scala 79:32]
  wire [35:0] core_auto_memBlock_dcache_client_out_baddress; // @[XSTile.scala 79:32]
  wire [255:0] core_auto_memBlock_dcache_client_out_bdata; // @[XSTile.scala 79:32]
  wire  core_auto_memBlock_dcache_client_out_c_ready; // @[XSTile.scala 79:32]
  wire  core_auto_memBlock_dcache_client_out_c_valid; // @[XSTile.scala 79:32]
  wire [2:0] core_auto_memBlock_dcache_client_out_c_bits_opcode; // @[XSTile.scala 79:32]
  wire [2:0] core_auto_memBlock_dcache_client_out_c_bits_param; // @[XSTile.scala 79:32]
  wire [2:0] core_auto_memBlock_dcache_client_out_c_bits_size; // @[XSTile.scala 79:32]
  wire [3:0] core_auto_memBlock_dcache_client_out_c_bits_source; // @[XSTile.scala 79:32]
  wire [35:0] core_auto_memBlock_dcache_client_out_c_bits_address; // @[XSTile.scala 79:32]
  wire  core_auto_memBlock_dcache_client_out_c_bits_echo_blockisdirty; // @[XSTile.scala 79:32]
  wire [255:0] core_auto_memBlock_dcache_client_out_c_bits_data; // @[XSTile.scala 79:32]
  wire  core_auto_memBlock_dcache_client_out_d_ready; // @[XSTile.scala 79:32]
  wire  core_auto_memBlock_dcache_client_out_d_valid; // @[XSTile.scala 79:32]
  wire [2:0] core_auto_memBlock_dcache_client_out_d_bits_opcode; // @[XSTile.scala 79:32]
  wire [1:0] core_auto_memBlock_dcache_client_out_d_bits_param; // @[XSTile.scala 79:32]
  wire [2:0] core_auto_memBlock_dcache_client_out_d_bits_size; // @[XSTile.scala 79:32]
  wire [3:0] core_auto_memBlock_dcache_client_out_d_bits_source; // @[XSTile.scala 79:32]
  wire [3:0] core_auto_memBlock_dcache_client_out_d_bits_sink; // @[XSTile.scala 79:32]
  wire  core_auto_memBlock_dcache_client_out_d_bits_denied; // @[XSTile.scala 79:32]
  wire  core_auto_memBlock_dcache_client_out_d_bits_echo_blockisdirty; // @[XSTile.scala 79:32]
  wire [255:0] core_auto_memBlock_dcache_client_out_d_bits_data; // @[XSTile.scala 79:32]
  wire  core_auto_memBlock_dcache_client_out_d_bits_corrupt; // @[XSTile.scala 79:32]
  wire  core_auto_memBlock_dcache_client_out_e_ready; // @[XSTile.scala 79:32]
  wire  core_auto_memBlock_dcache_client_out_e_valid; // @[XSTile.scala 79:32]
  wire [3:0] core_auto_memBlock_dcache_client_out_e_bits_sink; // @[XSTile.scala 79:32]
  wire  core_auto_ptw_to_l2_buffer_out_a_ready; // @[XSTile.scala 79:32]
  wire  core_auto_ptw_to_l2_buffer_out_a_valid; // @[XSTile.scala 79:32]
  wire [2:0] core_auto_ptw_to_l2_buffer_out_a_bits_opcode; // @[XSTile.scala 79:32]
  wire [2:0] core_auto_ptw_to_l2_buffer_out_a_bits_param; // @[XSTile.scala 79:32]
  wire [2:0] core_auto_ptw_to_l2_buffer_out_a_bits_size; // @[XSTile.scala 79:32]
  wire [2:0] core_auto_ptw_to_l2_buffer_out_a_bits_source; // @[XSTile.scala 79:32]
  wire [35:0] core_auto_ptw_to_l2_buffer_out_a_bits_address; // @[XSTile.scala 79:32]
  wire [31:0] core_auto_ptw_to_l2_buffer_out_a_bits_mask; // @[XSTile.scala 79:32]
  wire [255:0] core_auto_ptw_to_l2_buffer_out_a_bits_data; // @[XSTile.scala 79:32]
  wire  core_auto_ptw_to_l2_buffer_out_d_ready; // @[XSTile.scala 79:32]
  wire  core_auto_ptw_to_l2_buffer_out_d_valid; // @[XSTile.scala 79:32]
  wire [2:0] core_auto_ptw_to_l2_buffer_out_d_bits_opcode; // @[XSTile.scala 79:32]
  wire [2:0] core_auto_ptw_to_l2_buffer_out_d_bits_size; // @[XSTile.scala 79:32]
  wire [2:0] core_auto_ptw_to_l2_buffer_out_d_bits_source; // @[XSTile.scala 79:32]
  wire  core_auto_ptw_to_l2_buffer_out_d_bits_denied; // @[XSTile.scala 79:32]
  wire [255:0] core_auto_ptw_to_l2_buffer_out_d_bits_data; // @[XSTile.scala 79:32]
  wire  core_auto_ptw_to_l2_buffer_out_d_bits_corrupt; // @[XSTile.scala 79:32]
  wire  core_auto_frontend_icache_client_out_a_ready; // @[XSTile.scala 79:32]
  wire  core_auto_frontend_icache_client_out_a_valid; // @[XSTile.scala 79:32]
  wire [2:0] core_auto_frontend_icache_client_out_a_bits_opcode; // @[XSTile.scala 79:32]
  wire [2:0] core_auto_frontend_icache_client_out_a_bits_size; // @[XSTile.scala 79:32]
  wire [1:0] core_auto_frontend_icache_client_out_a_bits_source; // @[XSTile.scala 79:32]
  wire [35:0] core_auto_frontend_icache_client_out_a_bits_address; // @[XSTile.scala 79:32]
  wire [31:0] core_auto_frontend_icache_client_out_a_bits_mask; // @[XSTile.scala 79:32]
  wire  core_auto_frontend_icache_client_out_bready; // @[XSTile.scala 79:32]
  wire  core_auto_frontend_icache_client_out_bvalid; // @[XSTile.scala 79:32]
  wire [1:0] core_auto_frontend_icache_client_out_bparam; // @[XSTile.scala 79:32]
  wire [35:0] core_auto_frontend_icache_client_out_baddress; // @[XSTile.scala 79:32]
  wire [255:0] core_auto_frontend_icache_client_out_bdata; // @[XSTile.scala 79:32]
  wire  core_auto_frontend_icache_client_out_c_ready; // @[XSTile.scala 79:32]
  wire  core_auto_frontend_icache_client_out_c_valid; // @[XSTile.scala 79:32]
  wire [2:0] core_auto_frontend_icache_client_out_c_bits_opcode; // @[XSTile.scala 79:32]
  wire [2:0] core_auto_frontend_icache_client_out_c_bits_param; // @[XSTile.scala 79:32]
  wire [35:0] core_auto_frontend_icache_client_out_c_bits_address; // @[XSTile.scala 79:32]
  wire  core_auto_frontend_icache_client_out_c_bits_echo_blockisdirty; // @[XSTile.scala 79:32]
  wire [255:0] core_auto_frontend_icache_client_out_c_bits_data; // @[XSTile.scala 79:32]
  wire  core_auto_frontend_icache_client_out_d_ready; // @[XSTile.scala 79:32]
  wire  core_auto_frontend_icache_client_out_d_valid; // @[XSTile.scala 79:32]
  wire [2:0] core_auto_frontend_icache_client_out_d_bits_opcode; // @[XSTile.scala 79:32]
  wire [1:0] core_auto_frontend_icache_client_out_d_bits_param; // @[XSTile.scala 79:32]
  wire [1:0] core_auto_frontend_icache_client_out_d_bits_source; // @[XSTile.scala 79:32]
  wire [3:0] core_auto_frontend_icache_client_out_d_bits_sink; // @[XSTile.scala 79:32]
  wire  core_auto_frontend_icache_client_out_d_bits_echo_blockisdirty; // @[XSTile.scala 79:32]
  wire [255:0] core_auto_frontend_icache_client_out_d_bits_data; // @[XSTile.scala 79:32]
  wire  core_auto_frontend_icache_client_out_d_bits_corrupt; // @[XSTile.scala 79:32]
  wire  core_auto_frontend_icache_client_out_e_ready; // @[XSTile.scala 79:32]
  wire  core_auto_frontend_icache_client_out_e_valid; // @[XSTile.scala 79:32]
  wire [3:0] core_auto_frontend_icache_client_out_e_bits_sink; // @[XSTile.scala 79:32]
  wire  core_auto_frontend_instrUncache_client_out_a_ready; // @[XSTile.scala 79:32]
  wire  core_auto_frontend_instrUncache_client_out_a_valid; // @[XSTile.scala 79:32]
  wire [35:0] core_auto_frontend_instrUncache_client_out_a_bits_address; // @[XSTile.scala 79:32]
  wire  core_auto_frontend_instrUncache_client_out_d_ready; // @[XSTile.scala 79:32]
  wire  core_auto_frontend_instrUncache_client_out_d_valid; // @[XSTile.scala 79:32]
  wire  core_auto_frontend_instrUncache_client_out_d_bits_source; // @[XSTile.scala 79:32]
  wire [63:0] core_auto_frontend_instrUncache_client_out_d_bits_data; // @[XSTile.scala 79:32]
  wire  core_auto_plic_int_sink_in_1_0; // @[XSTile.scala 79:32]
  wire  core_auto_plic_int_sink_in_0_0; // @[XSTile.scala 79:32]
  wire  core_auto_debug_int_sink_in_0; // @[XSTile.scala 79:32]
  wire  core_auto_clint_int_sink_in_0; // @[XSTile.scala 79:32]
  wire  core_auto_clint_int_sink_in_1; // @[XSTile.scala 79:32]
  wire [63:0] core_io_hartId; // @[XSTile.scala 79:32]
  wire [35:0] core_io_reset_vector; // @[XSTile.scala 79:32]
  wire  core_io_cpu_halt; // @[XSTile.scala 79:32]
  wire  core_io_beu_errors_icache_ecc_error_valid; // @[XSTile.scala 79:32]
  wire [35:0] core_io_beu_errors_icache_ecc_error_bits; // @[XSTile.scala 79:32]
  wire  core_io_beu_errors_dcache_ecc_error_valid; // @[XSTile.scala 79:32]
  wire [35:0] core_io_beu_errors_dcache_ecc_error_bits; // @[XSTile.scala 79:32]
  wire  misc_clock; // @[XSTile.scala 80:32]
  wire  misc_reset; // @[XSTile.scala 80:32]
  wire  misc_auto_buffers_in_1_a_ready; // @[XSTile.scala 80:32]
  wire  misc_auto_buffers_in_1_a_valid; // @[XSTile.scala 80:32]
  wire [2:0] misc_auto_buffers_in_1_a_bits_opcode; // @[XSTile.scala 80:32]
  wire [2:0] misc_auto_buffers_in_1_a_bits_size; // @[XSTile.scala 80:32]
  wire [1:0] misc_auto_buffers_in_1_a_bits_source; // @[XSTile.scala 80:32]
  wire [35:0] misc_auto_buffers_in_1_a_bits_address; // @[XSTile.scala 80:32]
  wire [7:0] misc_auto_buffers_in_1_a_bits_mask; // @[XSTile.scala 80:32]
  wire [63:0] misc_auto_buffers_in_1_a_bits_data; // @[XSTile.scala 80:32]
  wire  misc_auto_buffers_in_1_d_ready; // @[XSTile.scala 80:32]
  wire  misc_auto_buffers_in_1_d_valid; // @[XSTile.scala 80:32]
  wire [2:0] misc_auto_buffers_in_1_d_bits_opcode; // @[XSTile.scala 80:32]
  wire [63:0] misc_auto_buffers_in_1_d_bits_data; // @[XSTile.scala 80:32]
  wire  misc_auto_buffers_in_0_a_ready; // @[XSTile.scala 80:32]
  wire  misc_auto_buffers_in_0_a_valid; // @[XSTile.scala 80:32]
  wire [35:0] misc_auto_buffers_in_0_a_bits_address; // @[XSTile.scala 80:32]
  wire  misc_auto_buffers_in_0_d_ready; // @[XSTile.scala 80:32]
  wire  misc_auto_buffers_in_0_d_valid; // @[XSTile.scala 80:32]
  wire  misc_auto_buffers_in_0_d_bits_source; // @[XSTile.scala 80:32]
  wire [63:0] misc_auto_buffers_in_0_d_bits_data; // @[XSTile.scala 80:32]
  wire  misc_auto_beu_int_out_0; // @[XSTile.scala 80:32]
  wire  misc_auto_xbar_in_2_a_ready; // @[XSTile.scala 80:32]
  wire  misc_auto_xbar_in_2_a_valid; // @[XSTile.scala 80:32]
  wire [2:0] misc_auto_xbar_in_2_a_bits_opcode; // @[XSTile.scala 80:32]
  wire [2:0] misc_auto_xbar_in_2_a_bits_param; // @[XSTile.scala 80:32]
  wire [2:0] misc_auto_xbar_in_2_a_bits_size; // @[XSTile.scala 80:32]
  wire [2:0] misc_auto_xbar_in_2_a_bits_source; // @[XSTile.scala 80:32]
  wire [35:0] misc_auto_xbar_in_2_a_bits_address; // @[XSTile.scala 80:32]
  wire [31:0] misc_auto_xbar_in_2_a_bits_mask; // @[XSTile.scala 80:32]
  wire [255:0] misc_auto_xbar_in_2_a_bits_data; // @[XSTile.scala 80:32]
  wire  misc_auto_xbar_in_2_d_ready; // @[XSTile.scala 80:32]
  wire  misc_auto_xbar_in_2_d_valid; // @[XSTile.scala 80:32]
  wire [2:0] misc_auto_xbar_in_2_d_bits_opcode; // @[XSTile.scala 80:32]
  wire [2:0] misc_auto_xbar_in_2_d_bits_size; // @[XSTile.scala 80:32]
  wire [2:0] misc_auto_xbar_in_2_d_bits_source; // @[XSTile.scala 80:32]
  wire  misc_auto_xbar_in_2_d_bits_denied; // @[XSTile.scala 80:32]
  wire [255:0] misc_auto_xbar_in_2_d_bits_data; // @[XSTile.scala 80:32]
  wire  misc_auto_xbar_in_2_d_bits_corrupt; // @[XSTile.scala 80:32]
  wire  misc_auto_xbar_in_1_a_ready; // @[XSTile.scala 80:32]
  wire  misc_auto_xbar_in_1_a_valid; // @[XSTile.scala 80:32]
  wire [2:0] misc_auto_xbar_in_1_a_bits_opcode; // @[XSTile.scala 80:32]
  wire [2:0] misc_auto_xbar_in_1_a_bits_param; // @[XSTile.scala 80:32]
  wire [2:0] misc_auto_xbar_in_1_a_bits_size; // @[XSTile.scala 80:32]
  wire [1:0] misc_auto_xbar_in_1_a_bits_source; // @[XSTile.scala 80:32]
  wire [35:0] misc_auto_xbar_in_1_a_bits_address; // @[XSTile.scala 80:32]
  wire  misc_auto_xbar_in_1_a_bits_user_preferCache; // @[XSTile.scala 80:32]
  wire [31:0] misc_auto_xbar_in_1_a_bits_mask; // @[XSTile.scala 80:32]
  wire [255:0] misc_auto_xbar_in_1_a_bits_data; // @[XSTile.scala 80:32]
  wire  misc_auto_xbar_in_1_bready; // @[XSTile.scala 80:32]
  wire  misc_auto_xbar_in_1_bvalid; // @[XSTile.scala 80:32]
  wire [1:0] misc_auto_xbar_in_1_bparam; // @[XSTile.scala 80:32]
  wire [35:0] misc_auto_xbar_in_1_baddress; // @[XSTile.scala 80:32]
  wire [255:0] misc_auto_xbar_in_1_bdata; // @[XSTile.scala 80:32]
  wire  misc_auto_xbar_in_1_c_ready; // @[XSTile.scala 80:32]
  wire  misc_auto_xbar_in_1_c_valid; // @[XSTile.scala 80:32]
  wire [2:0] misc_auto_xbar_in_1_c_bits_opcode; // @[XSTile.scala 80:32]
  wire [2:0] misc_auto_xbar_in_1_c_bits_param; // @[XSTile.scala 80:32]
  wire [2:0] misc_auto_xbar_in_1_c_bits_size; // @[XSTile.scala 80:32]
  wire [1:0] misc_auto_xbar_in_1_c_bits_source; // @[XSTile.scala 80:32]
  wire [35:0] misc_auto_xbar_in_1_c_bits_address; // @[XSTile.scala 80:32]
  wire  misc_auto_xbar_in_1_c_bits_echo_blockisdirty; // @[XSTile.scala 80:32]
  wire [255:0] misc_auto_xbar_in_1_c_bits_data; // @[XSTile.scala 80:32]
  wire  misc_auto_xbar_in_1_d_ready; // @[XSTile.scala 80:32]
  wire  misc_auto_xbar_in_1_d_valid; // @[XSTile.scala 80:32]
  wire [2:0] misc_auto_xbar_in_1_d_bits_opcode; // @[XSTile.scala 80:32]
  wire [1:0] misc_auto_xbar_in_1_d_bits_param; // @[XSTile.scala 80:32]
  wire [1:0] misc_auto_xbar_in_1_d_bits_source; // @[XSTile.scala 80:32]
  wire [3:0] misc_auto_xbar_in_1_d_bits_sink; // @[XSTile.scala 80:32]
  wire  misc_auto_xbar_in_1_d_bits_echo_blockisdirty; // @[XSTile.scala 80:32]
  wire [255:0] misc_auto_xbar_in_1_d_bits_data; // @[XSTile.scala 80:32]
  wire  misc_auto_xbar_in_1_d_bits_corrupt; // @[XSTile.scala 80:32]
  wire  misc_auto_xbar_in_1_e_ready; // @[XSTile.scala 80:32]
  wire  misc_auto_xbar_in_1_e_valid; // @[XSTile.scala 80:32]
  wire [3:0] misc_auto_xbar_in_1_e_bits_sink; // @[XSTile.scala 80:32]
  wire  misc_auto_xbar_in_0_a_ready; // @[XSTile.scala 80:32]
  wire  misc_auto_xbar_in_0_a_valid; // @[XSTile.scala 80:32]
  wire [2:0] misc_auto_xbar_in_0_a_bits_opcode; // @[XSTile.scala 80:32]
  wire [2:0] misc_auto_xbar_in_0_a_bits_param; // @[XSTile.scala 80:32]
  wire [2:0] misc_auto_xbar_in_0_a_bits_size; // @[XSTile.scala 80:32]
  wire [3:0] misc_auto_xbar_in_0_a_bits_source; // @[XSTile.scala 80:32]
  wire [35:0] misc_auto_xbar_in_0_a_bits_address; // @[XSTile.scala 80:32]
  wire  misc_auto_xbar_in_0_a_bits_user_preferCache; // @[XSTile.scala 80:32]
  wire [31:0] misc_auto_xbar_in_0_a_bits_mask; // @[XSTile.scala 80:32]
  wire [255:0] misc_auto_xbar_in_0_a_bits_data; // @[XSTile.scala 80:32]
  wire  misc_auto_xbar_in_0_bready; // @[XSTile.scala 80:32]
  wire  misc_auto_xbar_in_0_bvalid; // @[XSTile.scala 80:32]
  wire [2:0] misc_auto_xbar_in_0_bopcode; // @[XSTile.scala 80:32]
  wire [1:0] misc_auto_xbar_in_0_bparam; // @[XSTile.scala 80:32]
  wire [2:0] misc_auto_xbar_in_0_bsize; // @[XSTile.scala 80:32]
  wire [3:0] misc_auto_xbar_in_0_bsource; // @[XSTile.scala 80:32]
  wire [35:0] misc_auto_xbar_in_0_baddress; // @[XSTile.scala 80:32]
  wire [31:0] misc_auto_xbar_in_0_bmask; // @[XSTile.scala 80:32]
  wire [255:0] misc_auto_xbar_in_0_bdata; // @[XSTile.scala 80:32]
  wire  misc_auto_xbar_in_0_c_ready; // @[XSTile.scala 80:32]
  wire  misc_auto_xbar_in_0_c_valid; // @[XSTile.scala 80:32]
  wire [2:0] misc_auto_xbar_in_0_c_bits_opcode; // @[XSTile.scala 80:32]
  wire [2:0] misc_auto_xbar_in_0_c_bits_param; // @[XSTile.scala 80:32]
  wire [2:0] misc_auto_xbar_in_0_c_bits_size; // @[XSTile.scala 80:32]
  wire [3:0] misc_auto_xbar_in_0_c_bits_source; // @[XSTile.scala 80:32]
  wire [35:0] misc_auto_xbar_in_0_c_bits_address; // @[XSTile.scala 80:32]
  wire  misc_auto_xbar_in_0_c_bits_echo_blockisdirty; // @[XSTile.scala 80:32]
  wire [255:0] misc_auto_xbar_in_0_c_bits_data; // @[XSTile.scala 80:32]
  wire  misc_auto_xbar_in_0_d_ready; // @[XSTile.scala 80:32]
  wire  misc_auto_xbar_in_0_d_valid; // @[XSTile.scala 80:32]
  wire [2:0] misc_auto_xbar_in_0_d_bits_opcode; // @[XSTile.scala 80:32]
  wire [1:0] misc_auto_xbar_in_0_d_bits_param; // @[XSTile.scala 80:32]
  wire [2:0] misc_auto_xbar_in_0_d_bits_size; // @[XSTile.scala 80:32]
  wire [3:0] misc_auto_xbar_in_0_d_bits_source; // @[XSTile.scala 80:32]
  wire [3:0] misc_auto_xbar_in_0_d_bits_sink; // @[XSTile.scala 80:32]
  wire  misc_auto_xbar_in_0_d_bits_denied; // @[XSTile.scala 80:32]
  wire  misc_auto_xbar_in_0_d_bits_echo_blockisdirty; // @[XSTile.scala 80:32]
  wire [255:0] misc_auto_xbar_in_0_d_bits_data; // @[XSTile.scala 80:32]
  wire  misc_auto_xbar_in_0_d_bits_corrupt; // @[XSTile.scala 80:32]
  wire  misc_auto_xbar_in_0_e_ready; // @[XSTile.scala 80:32]
  wire  misc_auto_xbar_in_0_e_valid; // @[XSTile.scala 80:32]
  wire [3:0] misc_auto_xbar_in_0_e_bits_sink; // @[XSTile.scala 80:32]
  wire  misc_auto_memory_port_out_a_ready; // @[XSTile.scala 80:32]
  wire  misc_auto_memory_port_out_a_valid; // @[XSTile.scala 80:32]
  wire [2:0] misc_auto_memory_port_out_a_bits_opcode; // @[XSTile.scala 80:32]
  wire [2:0] misc_auto_memory_port_out_a_bits_param; // @[XSTile.scala 80:32]
  wire [2:0] misc_auto_memory_port_out_a_bits_size; // @[XSTile.scala 80:32]
  wire [4:0] misc_auto_memory_port_out_a_bits_source; // @[XSTile.scala 80:32]
  wire [35:0] misc_auto_memory_port_out_a_bits_address; // @[XSTile.scala 80:32]
  wire  misc_auto_memory_port_out_a_bits_user_preferCache; // @[XSTile.scala 80:32]
  wire [31:0] misc_auto_memory_port_out_a_bits_mask; // @[XSTile.scala 80:32]
  wire [255:0] misc_auto_memory_port_out_a_bits_data; // @[XSTile.scala 80:32]
  wire  misc_auto_memory_port_out_bready; // @[XSTile.scala 80:32]
  wire  misc_auto_memory_port_out_bvalid; // @[XSTile.scala 80:32]
  wire [2:0] misc_auto_memory_port_out_bopcode; // @[XSTile.scala 80:32]
  wire [1:0] misc_auto_memory_port_out_bparam; // @[XSTile.scala 80:32]
  wire [2:0] misc_auto_memory_port_out_bsize; // @[XSTile.scala 80:32]
  wire [4:0] misc_auto_memory_port_out_bsource; // @[XSTile.scala 80:32]
  wire [35:0] misc_auto_memory_port_out_baddress; // @[XSTile.scala 80:32]
  wire [31:0] misc_auto_memory_port_out_bmask; // @[XSTile.scala 80:32]
  wire [255:0] misc_auto_memory_port_out_bdata; // @[XSTile.scala 80:32]
  wire  misc_auto_memory_port_out_c_ready; // @[XSTile.scala 80:32]
  wire  misc_auto_memory_port_out_c_valid; // @[XSTile.scala 80:32]
  wire [2:0] misc_auto_memory_port_out_c_bits_opcode; // @[XSTile.scala 80:32]
  wire [2:0] misc_auto_memory_port_out_c_bits_param; // @[XSTile.scala 80:32]
  wire [2:0] misc_auto_memory_port_out_c_bits_size; // @[XSTile.scala 80:32]
  wire [4:0] misc_auto_memory_port_out_c_bits_source; // @[XSTile.scala 80:32]
  wire [35:0] misc_auto_memory_port_out_c_bits_address; // @[XSTile.scala 80:32]
  wire  misc_auto_memory_port_out_c_bits_echo_blockisdirty; // @[XSTile.scala 80:32]
  wire [255:0] misc_auto_memory_port_out_c_bits_data; // @[XSTile.scala 80:32]
  wire  misc_auto_memory_port_out_d_ready; // @[XSTile.scala 80:32]
  wire  misc_auto_memory_port_out_d_valid; // @[XSTile.scala 80:32]
  wire [2:0] misc_auto_memory_port_out_d_bits_opcode; // @[XSTile.scala 80:32]
  wire [1:0] misc_auto_memory_port_out_d_bits_param; // @[XSTile.scala 80:32]
  wire [2:0] misc_auto_memory_port_out_d_bits_size; // @[XSTile.scala 80:32]
  wire [4:0] misc_auto_memory_port_out_d_bits_source; // @[XSTile.scala 80:32]
  wire [3:0] misc_auto_memory_port_out_d_bits_sink; // @[XSTile.scala 80:32]
  wire  misc_auto_memory_port_out_d_bits_denied; // @[XSTile.scala 80:32]
  wire  misc_auto_memory_port_out_d_bits_echo_blockisdirty; // @[XSTile.scala 80:32]
  wire [255:0] misc_auto_memory_port_out_d_bits_data; // @[XSTile.scala 80:32]
  wire  misc_auto_memory_port_out_d_bits_corrupt; // @[XSTile.scala 80:32]
  wire  misc_auto_memory_port_out_e_ready; // @[XSTile.scala 80:32]
  wire  misc_auto_memory_port_out_e_valid; // @[XSTile.scala 80:32]
  wire [3:0] misc_auto_memory_port_out_e_bits_sink; // @[XSTile.scala 80:32]
  wire  misc_auto_mmio_port_out_a_ready; // @[XSTile.scala 80:32]
  wire  misc_auto_mmio_port_out_a_valid; // @[XSTile.scala 80:32]
  wire [2:0] misc_auto_mmio_port_out_a_bits_opcode; // @[XSTile.scala 80:32]
  wire [2:0] misc_auto_mmio_port_out_a_bits_size; // @[XSTile.scala 80:32]
  wire [2:0] misc_auto_mmio_port_out_a_bits_source; // @[XSTile.scala 80:32]
  wire [35:0] misc_auto_mmio_port_out_a_bits_address; // @[XSTile.scala 80:32]
  wire [7:0] misc_auto_mmio_port_out_a_bits_mask; // @[XSTile.scala 80:32]
  wire [63:0] misc_auto_mmio_port_out_a_bits_data; // @[XSTile.scala 80:32]
  wire  misc_auto_mmio_port_out_d_ready; // @[XSTile.scala 80:32]
  wire  misc_auto_mmio_port_out_d_valid; // @[XSTile.scala 80:32]
  wire [2:0] misc_auto_mmio_port_out_d_bits_opcode; // @[XSTile.scala 80:32]
  wire [2:0] misc_auto_mmio_port_out_d_bits_size; // @[XSTile.scala 80:32]
  wire [2:0] misc_auto_mmio_port_out_d_bits_source; // @[XSTile.scala 80:32]
  wire [63:0] misc_auto_mmio_port_out_d_bits_data; // @[XSTile.scala 80:32]
  wire  misc_beu_errors_icache_ecc_error_valid; // @[XSTile.scala 80:32]
  wire [35:0] misc_beu_errors_icache_ecc_error_bits; // @[XSTile.scala 80:32]
  wire  misc_beu_errors_dcache_ecc_error_valid; // @[XSTile.scala 80:32]
  wire [35:0] misc_beu_errors_dcache_ecc_error_bits; // @[XSTile.scala 80:32]
  wire  buffer_clock; // @[XSTile.scala 97:28]
  wire  buffer_reset; // @[XSTile.scala 97:28]
  wire  buffer_auto_in_a_ready; // @[XSTile.scala 97:28]
  wire  buffer_auto_in_a_valid; // @[XSTile.scala 97:28]
  wire [2:0] buffer_auto_in_a_bits_opcode; // @[XSTile.scala 97:28]
  wire [2:0] buffer_auto_in_a_bits_param; // @[XSTile.scala 97:28]
  wire [2:0] buffer_auto_in_a_bits_size; // @[XSTile.scala 97:28]
  wire [3:0] buffer_auto_in_a_bits_source; // @[XSTile.scala 97:28]
  wire [35:0] buffer_auto_in_a_bits_address; // @[XSTile.scala 97:28]
  wire [31:0] buffer_auto_in_a_bits_mask; // @[XSTile.scala 97:28]
  wire  buffer_auto_in_bready; // @[XSTile.scala 97:28]
  wire  buffer_auto_in_bvalid; // @[XSTile.scala 97:28]
  wire [1:0] buffer_auto_in_bparam; // @[XSTile.scala 97:28]
  wire [35:0] buffer_auto_in_baddress; // @[XSTile.scala 97:28]
  wire [255:0] buffer_auto_in_bdata; // @[XSTile.scala 97:28]
  wire  buffer_auto_in_c_ready; // @[XSTile.scala 97:28]
  wire  buffer_auto_in_c_valid; // @[XSTile.scala 97:28]
  wire [2:0] buffer_auto_in_c_bits_opcode; // @[XSTile.scala 97:28]
  wire [2:0] buffer_auto_in_c_bits_param; // @[XSTile.scala 97:28]
  wire [2:0] buffer_auto_in_c_bits_size; // @[XSTile.scala 97:28]
  wire [3:0] buffer_auto_in_c_bits_source; // @[XSTile.scala 97:28]
  wire [35:0] buffer_auto_in_c_bits_address; // @[XSTile.scala 97:28]
  wire  buffer_auto_in_c_bits_echo_blockisdirty; // @[XSTile.scala 97:28]
  wire [255:0] buffer_auto_in_c_bits_data; // @[XSTile.scala 97:28]
  wire  buffer_auto_in_d_ready; // @[XSTile.scala 97:28]
  wire  buffer_auto_in_d_valid; // @[XSTile.scala 97:28]
  wire [2:0] buffer_auto_in_d_bits_opcode; // @[XSTile.scala 97:28]
  wire [1:0] buffer_auto_in_d_bits_param; // @[XSTile.scala 97:28]
  wire [2:0] buffer_auto_in_d_bits_size; // @[XSTile.scala 97:28]
  wire [3:0] buffer_auto_in_d_bits_source; // @[XSTile.scala 97:28]
  wire [3:0] buffer_auto_in_d_bits_sink; // @[XSTile.scala 97:28]
  wire  buffer_auto_in_d_bits_denied; // @[XSTile.scala 97:28]
  wire  buffer_auto_in_d_bits_echo_blockisdirty; // @[XSTile.scala 97:28]
  wire [255:0] buffer_auto_in_d_bits_data; // @[XSTile.scala 97:28]
  wire  buffer_auto_in_d_bits_corrupt; // @[XSTile.scala 97:28]
  wire  buffer_auto_in_e_ready; // @[XSTile.scala 97:28]
  wire  buffer_auto_in_e_valid; // @[XSTile.scala 97:28]
  wire [3:0] buffer_auto_in_e_bits_sink; // @[XSTile.scala 97:28]
  wire  buffer_auto_out_a_ready; // @[XSTile.scala 97:28]
  wire  buffer_auto_out_a_valid; // @[XSTile.scala 97:28]
  wire [2:0] buffer_auto_out_a_bits_opcode; // @[XSTile.scala 97:28]
  wire [2:0] buffer_auto_out_a_bits_param; // @[XSTile.scala 97:28]
  wire [2:0] buffer_auto_out_a_bits_size; // @[XSTile.scala 97:28]
  wire [3:0] buffer_auto_out_a_bits_source; // @[XSTile.scala 97:28]
  wire [35:0] buffer_auto_out_a_bits_address; // @[XSTile.scala 97:28]
  wire  buffer_auto_out_a_bits_user_preferCache; // @[XSTile.scala 97:28]
  wire [31:0] buffer_auto_out_a_bits_mask; // @[XSTile.scala 97:28]
  wire [255:0] buffer_auto_out_a_bits_data; // @[XSTile.scala 97:28]
  wire  buffer_auto_out_bready; // @[XSTile.scala 97:28]
  wire  buffer_auto_out_bvalid; // @[XSTile.scala 97:28]
  wire [2:0] buffer_auto_out_bopcode; // @[XSTile.scala 97:28]
  wire [1:0] buffer_auto_out_bparam; // @[XSTile.scala 97:28]
  wire [2:0] buffer_auto_out_bsize; // @[XSTile.scala 97:28]
  wire [3:0] buffer_auto_out_bsource; // @[XSTile.scala 97:28]
  wire [35:0] buffer_auto_out_baddress; // @[XSTile.scala 97:28]
  wire [31:0] buffer_auto_out_bmask; // @[XSTile.scala 97:28]
  wire [255:0] buffer_auto_out_bdata; // @[XSTile.scala 97:28]
  wire  buffer_auto_out_c_ready; // @[XSTile.scala 97:28]
  wire  buffer_auto_out_c_valid; // @[XSTile.scala 97:28]
  wire [2:0] buffer_auto_out_c_bits_opcode; // @[XSTile.scala 97:28]
  wire [2:0] buffer_auto_out_c_bits_param; // @[XSTile.scala 97:28]
  wire [2:0] buffer_auto_out_c_bits_size; // @[XSTile.scala 97:28]
  wire [3:0] buffer_auto_out_c_bits_source; // @[XSTile.scala 97:28]
  wire [35:0] buffer_auto_out_c_bits_address; // @[XSTile.scala 97:28]
  wire  buffer_auto_out_c_bits_echo_blockisdirty; // @[XSTile.scala 97:28]
  wire [255:0] buffer_auto_out_c_bits_data; // @[XSTile.scala 97:28]
  wire  buffer_auto_out_d_ready; // @[XSTile.scala 97:28]
  wire  buffer_auto_out_d_valid; // @[XSTile.scala 97:28]
  wire [2:0] buffer_auto_out_d_bits_opcode; // @[XSTile.scala 97:28]
  wire [1:0] buffer_auto_out_d_bits_param; // @[XSTile.scala 97:28]
  wire [2:0] buffer_auto_out_d_bits_size; // @[XSTile.scala 97:28]
  wire [3:0] buffer_auto_out_d_bits_source; // @[XSTile.scala 97:28]
  wire [3:0] buffer_auto_out_d_bits_sink; // @[XSTile.scala 97:28]
  wire  buffer_auto_out_d_bits_denied; // @[XSTile.scala 97:28]
  wire  buffer_auto_out_d_bits_echo_blockisdirty; // @[XSTile.scala 97:28]
  wire [255:0] buffer_auto_out_d_bits_data; // @[XSTile.scala 97:28]
  wire  buffer_auto_out_d_bits_corrupt; // @[XSTile.scala 97:28]
  wire  buffer_auto_out_e_ready; // @[XSTile.scala 97:28]
  wire  buffer_auto_out_e_valid; // @[XSTile.scala 97:28]
  wire [3:0] buffer_auto_out_e_bits_sink; // @[XSTile.scala 97:28]
  wire  l1i_to_l2_buffer_0_clock; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_0_reset; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_0_auto_in_a_ready; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_0_auto_in_a_valid; // @[XSTile.scala 103:46]
  wire [2:0] l1i_to_l2_buffer_0_auto_in_a_bits_opcode; // @[XSTile.scala 103:46]
  wire [2:0] l1i_to_l2_buffer_0_auto_in_a_bits_param; // @[XSTile.scala 103:46]
  wire [2:0] l1i_to_l2_buffer_0_auto_in_a_bits_size; // @[XSTile.scala 103:46]
  wire [1:0] l1i_to_l2_buffer_0_auto_in_a_bits_source; // @[XSTile.scala 103:46]
  wire [35:0] l1i_to_l2_buffer_0_auto_in_a_bits_address; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_0_auto_in_a_bits_user_preferCache; // @[XSTile.scala 103:46]
  wire [31:0] l1i_to_l2_buffer_0_auto_in_a_bits_mask; // @[XSTile.scala 103:46]
  wire [255:0] l1i_to_l2_buffer_0_auto_in_a_bits_data; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_0_auto_in_bready; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_0_auto_in_bvalid; // @[XSTile.scala 103:46]
  wire [1:0] l1i_to_l2_buffer_0_auto_in_bparam; // @[XSTile.scala 103:46]
  wire [35:0] l1i_to_l2_buffer_0_auto_in_baddress; // @[XSTile.scala 103:46]
  wire [255:0] l1i_to_l2_buffer_0_auto_in_bdata; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_0_auto_in_c_ready; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_0_auto_in_c_valid; // @[XSTile.scala 103:46]
  wire [2:0] l1i_to_l2_buffer_0_auto_in_c_bits_opcode; // @[XSTile.scala 103:46]
  wire [2:0] l1i_to_l2_buffer_0_auto_in_c_bits_param; // @[XSTile.scala 103:46]
  wire [2:0] l1i_to_l2_buffer_0_auto_in_c_bits_size; // @[XSTile.scala 103:46]
  wire [1:0] l1i_to_l2_buffer_0_auto_in_c_bits_source; // @[XSTile.scala 103:46]
  wire [35:0] l1i_to_l2_buffer_0_auto_in_c_bits_address; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_0_auto_in_c_bits_echo_blockisdirty; // @[XSTile.scala 103:46]
  wire [255:0] l1i_to_l2_buffer_0_auto_in_c_bits_data; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_0_auto_in_d_ready; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_0_auto_in_d_valid; // @[XSTile.scala 103:46]
  wire [2:0] l1i_to_l2_buffer_0_auto_in_d_bits_opcode; // @[XSTile.scala 103:46]
  wire [1:0] l1i_to_l2_buffer_0_auto_in_d_bits_param; // @[XSTile.scala 103:46]
  wire [1:0] l1i_to_l2_buffer_0_auto_in_d_bits_source; // @[XSTile.scala 103:46]
  wire [3:0] l1i_to_l2_buffer_0_auto_in_d_bits_sink; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_0_auto_in_d_bits_echo_blockisdirty; // @[XSTile.scala 103:46]
  wire [255:0] l1i_to_l2_buffer_0_auto_in_d_bits_data; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_0_auto_in_d_bits_corrupt; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_0_auto_in_e_ready; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_0_auto_in_e_valid; // @[XSTile.scala 103:46]
  wire [3:0] l1i_to_l2_buffer_0_auto_in_e_bits_sink; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_0_auto_out_a_ready; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_0_auto_out_a_valid; // @[XSTile.scala 103:46]
  wire [2:0] l1i_to_l2_buffer_0_auto_out_a_bits_opcode; // @[XSTile.scala 103:46]
  wire [2:0] l1i_to_l2_buffer_0_auto_out_a_bits_param; // @[XSTile.scala 103:46]
  wire [2:0] l1i_to_l2_buffer_0_auto_out_a_bits_size; // @[XSTile.scala 103:46]
  wire [1:0] l1i_to_l2_buffer_0_auto_out_a_bits_source; // @[XSTile.scala 103:46]
  wire [35:0] l1i_to_l2_buffer_0_auto_out_a_bits_address; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_0_auto_out_a_bits_user_preferCache; // @[XSTile.scala 103:46]
  wire [31:0] l1i_to_l2_buffer_0_auto_out_a_bits_mask; // @[XSTile.scala 103:46]
  wire [255:0] l1i_to_l2_buffer_0_auto_out_a_bits_data; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_0_auto_out_bready; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_0_auto_out_bvalid; // @[XSTile.scala 103:46]
  wire [1:0] l1i_to_l2_buffer_0_auto_out_bparam; // @[XSTile.scala 103:46]
  wire [35:0] l1i_to_l2_buffer_0_auto_out_baddress; // @[XSTile.scala 103:46]
  wire [255:0] l1i_to_l2_buffer_0_auto_out_bdata; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_0_auto_out_c_ready; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_0_auto_out_c_valid; // @[XSTile.scala 103:46]
  wire [2:0] l1i_to_l2_buffer_0_auto_out_c_bits_opcode; // @[XSTile.scala 103:46]
  wire [2:0] l1i_to_l2_buffer_0_auto_out_c_bits_param; // @[XSTile.scala 103:46]
  wire [2:0] l1i_to_l2_buffer_0_auto_out_c_bits_size; // @[XSTile.scala 103:46]
  wire [1:0] l1i_to_l2_buffer_0_auto_out_c_bits_source; // @[XSTile.scala 103:46]
  wire [35:0] l1i_to_l2_buffer_0_auto_out_c_bits_address; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_0_auto_out_c_bits_echo_blockisdirty; // @[XSTile.scala 103:46]
  wire [255:0] l1i_to_l2_buffer_0_auto_out_c_bits_data; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_0_auto_out_d_ready; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_0_auto_out_d_valid; // @[XSTile.scala 103:46]
  wire [2:0] l1i_to_l2_buffer_0_auto_out_d_bits_opcode; // @[XSTile.scala 103:46]
  wire [1:0] l1i_to_l2_buffer_0_auto_out_d_bits_param; // @[XSTile.scala 103:46]
  wire [1:0] l1i_to_l2_buffer_0_auto_out_d_bits_source; // @[XSTile.scala 103:46]
  wire [3:0] l1i_to_l2_buffer_0_auto_out_d_bits_sink; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_0_auto_out_d_bits_echo_blockisdirty; // @[XSTile.scala 103:46]
  wire [255:0] l1i_to_l2_buffer_0_auto_out_d_bits_data; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_0_auto_out_d_bits_corrupt; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_0_auto_out_e_ready; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_0_auto_out_e_valid; // @[XSTile.scala 103:46]
  wire [3:0] l1i_to_l2_buffer_0_auto_out_e_bits_sink; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_1_clock; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_1_reset; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_1_auto_in_a_ready; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_1_auto_in_a_valid; // @[XSTile.scala 103:46]
  wire [2:0] l1i_to_l2_buffer_1_auto_in_a_bits_opcode; // @[XSTile.scala 103:46]
  wire [2:0] l1i_to_l2_buffer_1_auto_in_a_bits_param; // @[XSTile.scala 103:46]
  wire [2:0] l1i_to_l2_buffer_1_auto_in_a_bits_size; // @[XSTile.scala 103:46]
  wire [1:0] l1i_to_l2_buffer_1_auto_in_a_bits_source; // @[XSTile.scala 103:46]
  wire [35:0] l1i_to_l2_buffer_1_auto_in_a_bits_address; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_1_auto_in_a_bits_user_preferCache; // @[XSTile.scala 103:46]
  wire [31:0] l1i_to_l2_buffer_1_auto_in_a_bits_mask; // @[XSTile.scala 103:46]
  wire [255:0] l1i_to_l2_buffer_1_auto_in_a_bits_data; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_1_auto_in_bready; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_1_auto_in_bvalid; // @[XSTile.scala 103:46]
  wire [1:0] l1i_to_l2_buffer_1_auto_in_bparam; // @[XSTile.scala 103:46]
  wire [35:0] l1i_to_l2_buffer_1_auto_in_baddress; // @[XSTile.scala 103:46]
  wire [255:0] l1i_to_l2_buffer_1_auto_in_bdata; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_1_auto_in_c_ready; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_1_auto_in_c_valid; // @[XSTile.scala 103:46]
  wire [2:0] l1i_to_l2_buffer_1_auto_in_c_bits_opcode; // @[XSTile.scala 103:46]
  wire [2:0] l1i_to_l2_buffer_1_auto_in_c_bits_param; // @[XSTile.scala 103:46]
  wire [2:0] l1i_to_l2_buffer_1_auto_in_c_bits_size; // @[XSTile.scala 103:46]
  wire [1:0] l1i_to_l2_buffer_1_auto_in_c_bits_source; // @[XSTile.scala 103:46]
  wire [35:0] l1i_to_l2_buffer_1_auto_in_c_bits_address; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_1_auto_in_c_bits_echo_blockisdirty; // @[XSTile.scala 103:46]
  wire [255:0] l1i_to_l2_buffer_1_auto_in_c_bits_data; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_1_auto_in_d_ready; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_1_auto_in_d_valid; // @[XSTile.scala 103:46]
  wire [2:0] l1i_to_l2_buffer_1_auto_in_d_bits_opcode; // @[XSTile.scala 103:46]
  wire [1:0] l1i_to_l2_buffer_1_auto_in_d_bits_param; // @[XSTile.scala 103:46]
  wire [1:0] l1i_to_l2_buffer_1_auto_in_d_bits_source; // @[XSTile.scala 103:46]
  wire [3:0] l1i_to_l2_buffer_1_auto_in_d_bits_sink; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_1_auto_in_d_bits_echo_blockisdirty; // @[XSTile.scala 103:46]
  wire [255:0] l1i_to_l2_buffer_1_auto_in_d_bits_data; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_1_auto_in_d_bits_corrupt; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_1_auto_in_e_ready; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_1_auto_in_e_valid; // @[XSTile.scala 103:46]
  wire [3:0] l1i_to_l2_buffer_1_auto_in_e_bits_sink; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_1_auto_out_a_ready; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_1_auto_out_a_valid; // @[XSTile.scala 103:46]
  wire [2:0] l1i_to_l2_buffer_1_auto_out_a_bits_opcode; // @[XSTile.scala 103:46]
  wire [2:0] l1i_to_l2_buffer_1_auto_out_a_bits_param; // @[XSTile.scala 103:46]
  wire [2:0] l1i_to_l2_buffer_1_auto_out_a_bits_size; // @[XSTile.scala 103:46]
  wire [1:0] l1i_to_l2_buffer_1_auto_out_a_bits_source; // @[XSTile.scala 103:46]
  wire [35:0] l1i_to_l2_buffer_1_auto_out_a_bits_address; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_1_auto_out_a_bits_user_preferCache; // @[XSTile.scala 103:46]
  wire [31:0] l1i_to_l2_buffer_1_auto_out_a_bits_mask; // @[XSTile.scala 103:46]
  wire [255:0] l1i_to_l2_buffer_1_auto_out_a_bits_data; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_1_auto_out_bready; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_1_auto_out_bvalid; // @[XSTile.scala 103:46]
  wire [1:0] l1i_to_l2_buffer_1_auto_out_bparam; // @[XSTile.scala 103:46]
  wire [35:0] l1i_to_l2_buffer_1_auto_out_baddress; // @[XSTile.scala 103:46]
  wire [255:0] l1i_to_l2_buffer_1_auto_out_bdata; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_1_auto_out_c_ready; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_1_auto_out_c_valid; // @[XSTile.scala 103:46]
  wire [2:0] l1i_to_l2_buffer_1_auto_out_c_bits_opcode; // @[XSTile.scala 103:46]
  wire [2:0] l1i_to_l2_buffer_1_auto_out_c_bits_param; // @[XSTile.scala 103:46]
  wire [2:0] l1i_to_l2_buffer_1_auto_out_c_bits_size; // @[XSTile.scala 103:46]
  wire [1:0] l1i_to_l2_buffer_1_auto_out_c_bits_source; // @[XSTile.scala 103:46]
  wire [35:0] l1i_to_l2_buffer_1_auto_out_c_bits_address; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_1_auto_out_c_bits_echo_blockisdirty; // @[XSTile.scala 103:46]
  wire [255:0] l1i_to_l2_buffer_1_auto_out_c_bits_data; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_1_auto_out_d_ready; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_1_auto_out_d_valid; // @[XSTile.scala 103:46]
  wire [2:0] l1i_to_l2_buffer_1_auto_out_d_bits_opcode; // @[XSTile.scala 103:46]
  wire [1:0] l1i_to_l2_buffer_1_auto_out_d_bits_param; // @[XSTile.scala 103:46]
  wire [1:0] l1i_to_l2_buffer_1_auto_out_d_bits_source; // @[XSTile.scala 103:46]
  wire [3:0] l1i_to_l2_buffer_1_auto_out_d_bits_sink; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_1_auto_out_d_bits_echo_blockisdirty; // @[XSTile.scala 103:46]
  wire [255:0] l1i_to_l2_buffer_1_auto_out_d_bits_data; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_1_auto_out_d_bits_corrupt; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_1_auto_out_e_ready; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_1_auto_out_e_valid; // @[XSTile.scala 103:46]
  wire [3:0] l1i_to_l2_buffer_1_auto_out_e_bits_sink; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_2_clock; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_2_reset; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_2_auto_in_a_ready; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_2_auto_in_a_valid; // @[XSTile.scala 103:46]
  wire [2:0] l1i_to_l2_buffer_2_auto_in_a_bits_opcode; // @[XSTile.scala 103:46]
  wire [2:0] l1i_to_l2_buffer_2_auto_in_a_bits_param; // @[XSTile.scala 103:46]
  wire [2:0] l1i_to_l2_buffer_2_auto_in_a_bits_size; // @[XSTile.scala 103:46]
  wire [1:0] l1i_to_l2_buffer_2_auto_in_a_bits_source; // @[XSTile.scala 103:46]
  wire [35:0] l1i_to_l2_buffer_2_auto_in_a_bits_address; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_2_auto_in_a_bits_user_preferCache; // @[XSTile.scala 103:46]
  wire [31:0] l1i_to_l2_buffer_2_auto_in_a_bits_mask; // @[XSTile.scala 103:46]
  wire [255:0] l1i_to_l2_buffer_2_auto_in_a_bits_data; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_2_auto_in_bready; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_2_auto_in_bvalid; // @[XSTile.scala 103:46]
  wire [1:0] l1i_to_l2_buffer_2_auto_in_bparam; // @[XSTile.scala 103:46]
  wire [35:0] l1i_to_l2_buffer_2_auto_in_baddress; // @[XSTile.scala 103:46]
  wire [255:0] l1i_to_l2_buffer_2_auto_in_bdata; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_2_auto_in_c_ready; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_2_auto_in_c_valid; // @[XSTile.scala 103:46]
  wire [2:0] l1i_to_l2_buffer_2_auto_in_c_bits_opcode; // @[XSTile.scala 103:46]
  wire [2:0] l1i_to_l2_buffer_2_auto_in_c_bits_param; // @[XSTile.scala 103:46]
  wire [2:0] l1i_to_l2_buffer_2_auto_in_c_bits_size; // @[XSTile.scala 103:46]
  wire [1:0] l1i_to_l2_buffer_2_auto_in_c_bits_source; // @[XSTile.scala 103:46]
  wire [35:0] l1i_to_l2_buffer_2_auto_in_c_bits_address; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_2_auto_in_c_bits_echo_blockisdirty; // @[XSTile.scala 103:46]
  wire [255:0] l1i_to_l2_buffer_2_auto_in_c_bits_data; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_2_auto_in_d_ready; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_2_auto_in_d_valid; // @[XSTile.scala 103:46]
  wire [2:0] l1i_to_l2_buffer_2_auto_in_d_bits_opcode; // @[XSTile.scala 103:46]
  wire [1:0] l1i_to_l2_buffer_2_auto_in_d_bits_param; // @[XSTile.scala 103:46]
  wire [1:0] l1i_to_l2_buffer_2_auto_in_d_bits_source; // @[XSTile.scala 103:46]
  wire [3:0] l1i_to_l2_buffer_2_auto_in_d_bits_sink; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_2_auto_in_d_bits_echo_blockisdirty; // @[XSTile.scala 103:46]
  wire [255:0] l1i_to_l2_buffer_2_auto_in_d_bits_data; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_2_auto_in_d_bits_corrupt; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_2_auto_in_e_ready; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_2_auto_in_e_valid; // @[XSTile.scala 103:46]
  wire [3:0] l1i_to_l2_buffer_2_auto_in_e_bits_sink; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_2_auto_out_a_ready; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_2_auto_out_a_valid; // @[XSTile.scala 103:46]
  wire [2:0] l1i_to_l2_buffer_2_auto_out_a_bits_opcode; // @[XSTile.scala 103:46]
  wire [2:0] l1i_to_l2_buffer_2_auto_out_a_bits_param; // @[XSTile.scala 103:46]
  wire [2:0] l1i_to_l2_buffer_2_auto_out_a_bits_size; // @[XSTile.scala 103:46]
  wire [1:0] l1i_to_l2_buffer_2_auto_out_a_bits_source; // @[XSTile.scala 103:46]
  wire [35:0] l1i_to_l2_buffer_2_auto_out_a_bits_address; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_2_auto_out_a_bits_user_preferCache; // @[XSTile.scala 103:46]
  wire [31:0] l1i_to_l2_buffer_2_auto_out_a_bits_mask; // @[XSTile.scala 103:46]
  wire [255:0] l1i_to_l2_buffer_2_auto_out_a_bits_data; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_2_auto_out_bready; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_2_auto_out_bvalid; // @[XSTile.scala 103:46]
  wire [1:0] l1i_to_l2_buffer_2_auto_out_bparam; // @[XSTile.scala 103:46]
  wire [35:0] l1i_to_l2_buffer_2_auto_out_baddress; // @[XSTile.scala 103:46]
  wire [255:0] l1i_to_l2_buffer_2_auto_out_bdata; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_2_auto_out_c_ready; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_2_auto_out_c_valid; // @[XSTile.scala 103:46]
  wire [2:0] l1i_to_l2_buffer_2_auto_out_c_bits_opcode; // @[XSTile.scala 103:46]
  wire [2:0] l1i_to_l2_buffer_2_auto_out_c_bits_param; // @[XSTile.scala 103:46]
  wire [2:0] l1i_to_l2_buffer_2_auto_out_c_bits_size; // @[XSTile.scala 103:46]
  wire [1:0] l1i_to_l2_buffer_2_auto_out_c_bits_source; // @[XSTile.scala 103:46]
  wire [35:0] l1i_to_l2_buffer_2_auto_out_c_bits_address; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_2_auto_out_c_bits_echo_blockisdirty; // @[XSTile.scala 103:46]
  wire [255:0] l1i_to_l2_buffer_2_auto_out_c_bits_data; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_2_auto_out_d_ready; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_2_auto_out_d_valid; // @[XSTile.scala 103:46]
  wire [2:0] l1i_to_l2_buffer_2_auto_out_d_bits_opcode; // @[XSTile.scala 103:46]
  wire [1:0] l1i_to_l2_buffer_2_auto_out_d_bits_param; // @[XSTile.scala 103:46]
  wire [1:0] l1i_to_l2_buffer_2_auto_out_d_bits_source; // @[XSTile.scala 103:46]
  wire [3:0] l1i_to_l2_buffer_2_auto_out_d_bits_sink; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_2_auto_out_d_bits_echo_blockisdirty; // @[XSTile.scala 103:46]
  wire [255:0] l1i_to_l2_buffer_2_auto_out_d_bits_data; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_2_auto_out_d_bits_corrupt; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_2_auto_out_e_ready; // @[XSTile.scala 103:46]
  wire  l1i_to_l2_buffer_2_auto_out_e_valid; // @[XSTile.scala 103:46]
  wire [3:0] l1i_to_l2_buffer_2_auto_out_e_bits_sink; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_0_clock; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_0_reset; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_0_auto_in_a_ready; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_0_auto_in_a_valid; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_0_auto_in_a_bits_opcode; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_0_auto_in_a_bits_param; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_0_auto_in_a_bits_size; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_0_auto_in_a_bits_source; // @[XSTile.scala 103:46]
  wire [35:0] ptw_to_l2_buffer_0_auto_in_a_bits_address; // @[XSTile.scala 103:46]
  wire [31:0] ptw_to_l2_buffer_0_auto_in_a_bits_mask; // @[XSTile.scala 103:46]
  wire [255:0] ptw_to_l2_buffer_0_auto_in_a_bits_data; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_0_auto_in_d_ready; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_0_auto_in_d_valid; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_0_auto_in_d_bits_opcode; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_0_auto_in_d_bits_size; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_0_auto_in_d_bits_source; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_0_auto_in_d_bits_denied; // @[XSTile.scala 103:46]
  wire [255:0] ptw_to_l2_buffer_0_auto_in_d_bits_data; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_0_auto_in_d_bits_corrupt; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_0_auto_out_a_ready; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_0_auto_out_a_valid; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_0_auto_out_a_bits_opcode; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_0_auto_out_a_bits_param; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_0_auto_out_a_bits_size; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_0_auto_out_a_bits_source; // @[XSTile.scala 103:46]
  wire [35:0] ptw_to_l2_buffer_0_auto_out_a_bits_address; // @[XSTile.scala 103:46]
  wire [31:0] ptw_to_l2_buffer_0_auto_out_a_bits_mask; // @[XSTile.scala 103:46]
  wire [255:0] ptw_to_l2_buffer_0_auto_out_a_bits_data; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_0_auto_out_d_ready; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_0_auto_out_d_valid; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_0_auto_out_d_bits_opcode; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_0_auto_out_d_bits_size; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_0_auto_out_d_bits_source; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_0_auto_out_d_bits_denied; // @[XSTile.scala 103:46]
  wire [255:0] ptw_to_l2_buffer_0_auto_out_d_bits_data; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_0_auto_out_d_bits_corrupt; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_1_clock; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_1_reset; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_1_auto_in_a_ready; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_1_auto_in_a_valid; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_1_auto_in_a_bits_opcode; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_1_auto_in_a_bits_param; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_1_auto_in_a_bits_size; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_1_auto_in_a_bits_source; // @[XSTile.scala 103:46]
  wire [35:0] ptw_to_l2_buffer_1_auto_in_a_bits_address; // @[XSTile.scala 103:46]
  wire [31:0] ptw_to_l2_buffer_1_auto_in_a_bits_mask; // @[XSTile.scala 103:46]
  wire [255:0] ptw_to_l2_buffer_1_auto_in_a_bits_data; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_1_auto_in_d_ready; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_1_auto_in_d_valid; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_1_auto_in_d_bits_opcode; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_1_auto_in_d_bits_size; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_1_auto_in_d_bits_source; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_1_auto_in_d_bits_denied; // @[XSTile.scala 103:46]
  wire [255:0] ptw_to_l2_buffer_1_auto_in_d_bits_data; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_1_auto_in_d_bits_corrupt; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_1_auto_out_a_ready; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_1_auto_out_a_valid; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_1_auto_out_a_bits_opcode; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_1_auto_out_a_bits_param; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_1_auto_out_a_bits_size; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_1_auto_out_a_bits_source; // @[XSTile.scala 103:46]
  wire [35:0] ptw_to_l2_buffer_1_auto_out_a_bits_address; // @[XSTile.scala 103:46]
  wire [31:0] ptw_to_l2_buffer_1_auto_out_a_bits_mask; // @[XSTile.scala 103:46]
  wire [255:0] ptw_to_l2_buffer_1_auto_out_a_bits_data; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_1_auto_out_d_ready; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_1_auto_out_d_valid; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_1_auto_out_d_bits_opcode; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_1_auto_out_d_bits_size; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_1_auto_out_d_bits_source; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_1_auto_out_d_bits_denied; // @[XSTile.scala 103:46]
  wire [255:0] ptw_to_l2_buffer_1_auto_out_d_bits_data; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_1_auto_out_d_bits_corrupt; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_2_clock; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_2_reset; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_2_auto_in_a_ready; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_2_auto_in_a_valid; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_2_auto_in_a_bits_opcode; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_2_auto_in_a_bits_param; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_2_auto_in_a_bits_size; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_2_auto_in_a_bits_source; // @[XSTile.scala 103:46]
  wire [35:0] ptw_to_l2_buffer_2_auto_in_a_bits_address; // @[XSTile.scala 103:46]
  wire [31:0] ptw_to_l2_buffer_2_auto_in_a_bits_mask; // @[XSTile.scala 103:46]
  wire [255:0] ptw_to_l2_buffer_2_auto_in_a_bits_data; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_2_auto_in_d_ready; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_2_auto_in_d_valid; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_2_auto_in_d_bits_opcode; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_2_auto_in_d_bits_size; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_2_auto_in_d_bits_source; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_2_auto_in_d_bits_denied; // @[XSTile.scala 103:46]
  wire [255:0] ptw_to_l2_buffer_2_auto_in_d_bits_data; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_2_auto_in_d_bits_corrupt; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_2_auto_out_a_ready; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_2_auto_out_a_valid; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_2_auto_out_a_bits_opcode; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_2_auto_out_a_bits_param; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_2_auto_out_a_bits_size; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_2_auto_out_a_bits_source; // @[XSTile.scala 103:46]
  wire [35:0] ptw_to_l2_buffer_2_auto_out_a_bits_address; // @[XSTile.scala 103:46]
  wire [31:0] ptw_to_l2_buffer_2_auto_out_a_bits_mask; // @[XSTile.scala 103:46]
  wire [255:0] ptw_to_l2_buffer_2_auto_out_a_bits_data; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_2_auto_out_d_ready; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_2_auto_out_d_valid; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_2_auto_out_d_bits_opcode; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_2_auto_out_d_bits_size; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_2_auto_out_d_bits_source; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_2_auto_out_d_bits_denied; // @[XSTile.scala 103:46]
  wire [255:0] ptw_to_l2_buffer_2_auto_out_d_bits_data; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_2_auto_out_d_bits_corrupt; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_3_clock; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_3_reset; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_3_auto_in_a_ready; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_3_auto_in_a_valid; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_3_auto_in_a_bits_opcode; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_3_auto_in_a_bits_param; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_3_auto_in_a_bits_size; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_3_auto_in_a_bits_source; // @[XSTile.scala 103:46]
  wire [35:0] ptw_to_l2_buffer_3_auto_in_a_bits_address; // @[XSTile.scala 103:46]
  wire [31:0] ptw_to_l2_buffer_3_auto_in_a_bits_mask; // @[XSTile.scala 103:46]
  wire [255:0] ptw_to_l2_buffer_3_auto_in_a_bits_data; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_3_auto_in_d_ready; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_3_auto_in_d_valid; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_3_auto_in_d_bits_opcode; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_3_auto_in_d_bits_size; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_3_auto_in_d_bits_source; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_3_auto_in_d_bits_denied; // @[XSTile.scala 103:46]
  wire [255:0] ptw_to_l2_buffer_3_auto_in_d_bits_data; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_3_auto_in_d_bits_corrupt; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_3_auto_out_a_ready; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_3_auto_out_a_valid; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_3_auto_out_a_bits_opcode; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_3_auto_out_a_bits_param; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_3_auto_out_a_bits_size; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_3_auto_out_a_bits_source; // @[XSTile.scala 103:46]
  wire [35:0] ptw_to_l2_buffer_3_auto_out_a_bits_address; // @[XSTile.scala 103:46]
  wire [31:0] ptw_to_l2_buffer_3_auto_out_a_bits_mask; // @[XSTile.scala 103:46]
  wire [255:0] ptw_to_l2_buffer_3_auto_out_a_bits_data; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_3_auto_out_d_ready; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_3_auto_out_d_valid; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_3_auto_out_d_bits_opcode; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_3_auto_out_d_bits_size; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_3_auto_out_d_bits_source; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_3_auto_out_d_bits_denied; // @[XSTile.scala 103:46]
  wire [255:0] ptw_to_l2_buffer_3_auto_out_d_bits_data; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_3_auto_out_d_bits_corrupt; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_4_clock; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_4_reset; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_4_auto_in_a_ready; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_4_auto_in_a_valid; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_4_auto_in_a_bits_opcode; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_4_auto_in_a_bits_param; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_4_auto_in_a_bits_size; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_4_auto_in_a_bits_source; // @[XSTile.scala 103:46]
  wire [35:0] ptw_to_l2_buffer_4_auto_in_a_bits_address; // @[XSTile.scala 103:46]
  wire [31:0] ptw_to_l2_buffer_4_auto_in_a_bits_mask; // @[XSTile.scala 103:46]
  wire [255:0] ptw_to_l2_buffer_4_auto_in_a_bits_data; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_4_auto_in_d_ready; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_4_auto_in_d_valid; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_4_auto_in_d_bits_opcode; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_4_auto_in_d_bits_size; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_4_auto_in_d_bits_source; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_4_auto_in_d_bits_denied; // @[XSTile.scala 103:46]
  wire [255:0] ptw_to_l2_buffer_4_auto_in_d_bits_data; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_4_auto_in_d_bits_corrupt; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_4_auto_out_a_ready; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_4_auto_out_a_valid; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_4_auto_out_a_bits_opcode; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_4_auto_out_a_bits_param; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_4_auto_out_a_bits_size; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_4_auto_out_a_bits_source; // @[XSTile.scala 103:46]
  wire [35:0] ptw_to_l2_buffer_4_auto_out_a_bits_address; // @[XSTile.scala 103:46]
  wire [31:0] ptw_to_l2_buffer_4_auto_out_a_bits_mask; // @[XSTile.scala 103:46]
  wire [255:0] ptw_to_l2_buffer_4_auto_out_a_bits_data; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_4_auto_out_d_ready; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_4_auto_out_d_valid; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_4_auto_out_d_bits_opcode; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_4_auto_out_d_bits_size; // @[XSTile.scala 103:46]
  wire [2:0] ptw_to_l2_buffer_4_auto_out_d_bits_source; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_4_auto_out_d_bits_denied; // @[XSTile.scala 103:46]
  wire [255:0] ptw_to_l2_buffer_4_auto_out_d_bits_data; // @[XSTile.scala 103:46]
  wire  ptw_to_l2_buffer_4_auto_out_d_bits_corrupt; // @[XSTile.scala 103:46]
  wire  core_io_reset_vector_delay_clock; // @[Hold.scala 97:23]
  wire [35:0] core_io_reset_vector_delay_io_in; // @[Hold.scala 97:23]
  wire [35:0] core_io_reset_vector_delay_io_out; // @[Hold.scala 97:23]
  wire  resetGen_clock; // @[ResetGen.scala 66:32]
  wire  resetGen_reset; // @[ResetGen.scala 66:32]
  wire  resetGen_o_reset; // @[ResetGen.scala 66:32]
  XSCore core ( // @[XSTile.scala 79:32]
    .clock(core_clock),
    .reset(core_reset),
    .auto_memBlock_uncache_client_out_a_ready(core_auto_memBlock_uncache_client_out_a_ready),
    .auto_memBlock_uncache_client_out_a_valid(core_auto_memBlock_uncache_client_out_a_valid),
    .auto_memBlock_uncache_client_out_a_bits_opcode(core_auto_memBlock_uncache_client_out_a_bits_opcode),
    .auto_memBlock_uncache_client_out_a_bits_size(core_auto_memBlock_uncache_client_out_a_bits_size),
    .auto_memBlock_uncache_client_out_a_bits_source(core_auto_memBlock_uncache_client_out_a_bits_source),
    .auto_memBlock_uncache_client_out_a_bits_address(core_auto_memBlock_uncache_client_out_a_bits_address),
    .auto_memBlock_uncache_client_out_a_bits_mask(core_auto_memBlock_uncache_client_out_a_bits_mask),
    .auto_memBlock_uncache_client_out_a_bits_data(core_auto_memBlock_uncache_client_out_a_bits_data),
    .auto_memBlock_uncache_client_out_d_ready(core_auto_memBlock_uncache_client_out_d_ready),
    .auto_memBlock_uncache_client_out_d_valid(core_auto_memBlock_uncache_client_out_d_valid),
    .auto_memBlock_uncache_client_out_d_bits_opcode(core_auto_memBlock_uncache_client_out_d_bits_opcode),
    .auto_memBlock_uncache_client_out_d_bits_data(core_auto_memBlock_uncache_client_out_d_bits_data),
    .auto_memBlock_dcache_client_out_a_ready(core_auto_memBlock_dcache_client_out_a_ready),
    .auto_memBlock_dcache_client_out_a_valid(core_auto_memBlock_dcache_client_out_a_valid),
    .auto_memBlock_dcache_client_out_a_bits_opcode(core_auto_memBlock_dcache_client_out_a_bits_opcode),
    .auto_memBlock_dcache_client_out_a_bits_param(core_auto_memBlock_dcache_client_out_a_bits_param),
    .auto_memBlock_dcache_client_out_a_bits_size(core_auto_memBlock_dcache_client_out_a_bits_size),
    .auto_memBlock_dcache_client_out_a_bits_source(core_auto_memBlock_dcache_client_out_a_bits_source),
    .auto_memBlock_dcache_client_out_a_bits_address(core_auto_memBlock_dcache_client_out_a_bits_address),
    .auto_memBlock_dcache_client_out_a_bits_mask(core_auto_memBlock_dcache_client_out_a_bits_mask),
    .auto_memBlock_dcache_client_out_bready(core_auto_memBlock_dcache_client_out_bready),
    .auto_memBlock_dcache_client_out_bvalid(core_auto_memBlock_dcache_client_out_bvalid),
    .auto_memBlock_dcache_client_out_bparam(core_auto_memBlock_dcache_client_out_bparam),
    .auto_memBlock_dcache_client_out_baddress(core_auto_memBlock_dcache_client_out_baddress),
    .auto_memBlock_dcache_client_out_bdata(core_auto_memBlock_dcache_client_out_bdata),
    .auto_memBlock_dcache_client_out_c_ready(core_auto_memBlock_dcache_client_out_c_ready),
    .auto_memBlock_dcache_client_out_c_valid(core_auto_memBlock_dcache_client_out_c_valid),
    .auto_memBlock_dcache_client_out_c_bits_opcode(core_auto_memBlock_dcache_client_out_c_bits_opcode),
    .auto_memBlock_dcache_client_out_c_bits_param(core_auto_memBlock_dcache_client_out_c_bits_param),
    .auto_memBlock_dcache_client_out_c_bits_size(core_auto_memBlock_dcache_client_out_c_bits_size),
    .auto_memBlock_dcache_client_out_c_bits_source(core_auto_memBlock_dcache_client_out_c_bits_source),
    .auto_memBlock_dcache_client_out_c_bits_address(core_auto_memBlock_dcache_client_out_c_bits_address),
    .auto_memBlock_dcache_client_out_c_bits_echo_blockisdirty(
      core_auto_memBlock_dcache_client_out_c_bits_echo_blockisdirty),
    .auto_memBlock_dcache_client_out_c_bits_data(core_auto_memBlock_dcache_client_out_c_bits_data),
    .auto_memBlock_dcache_client_out_d_ready(core_auto_memBlock_dcache_client_out_d_ready),
    .auto_memBlock_dcache_client_out_d_valid(core_auto_memBlock_dcache_client_out_d_valid),
    .auto_memBlock_dcache_client_out_d_bits_opcode(core_auto_memBlock_dcache_client_out_d_bits_opcode),
    .auto_memBlock_dcache_client_out_d_bits_param(core_auto_memBlock_dcache_client_out_d_bits_param),
    .auto_memBlock_dcache_client_out_d_bits_size(core_auto_memBlock_dcache_client_out_d_bits_size),
    .auto_memBlock_dcache_client_out_d_bits_source(core_auto_memBlock_dcache_client_out_d_bits_source),
    .auto_memBlock_dcache_client_out_d_bits_sink(core_auto_memBlock_dcache_client_out_d_bits_sink),
    .auto_memBlock_dcache_client_out_d_bits_denied(core_auto_memBlock_dcache_client_out_d_bits_denied),
    .auto_memBlock_dcache_client_out_d_bits_echo_blockisdirty(
      core_auto_memBlock_dcache_client_out_d_bits_echo_blockisdirty),
    .auto_memBlock_dcache_client_out_d_bits_data(core_auto_memBlock_dcache_client_out_d_bits_data),
    .auto_memBlock_dcache_client_out_d_bits_corrupt(core_auto_memBlock_dcache_client_out_d_bits_corrupt),
    .auto_memBlock_dcache_client_out_e_ready(core_auto_memBlock_dcache_client_out_e_ready),
    .auto_memBlock_dcache_client_out_e_valid(core_auto_memBlock_dcache_client_out_e_valid),
    .auto_memBlock_dcache_client_out_e_bits_sink(core_auto_memBlock_dcache_client_out_e_bits_sink),
    .auto_ptw_to_l2_buffer_out_a_ready(core_auto_ptw_to_l2_buffer_out_a_ready),
    .auto_ptw_to_l2_buffer_out_a_valid(core_auto_ptw_to_l2_buffer_out_a_valid),
    .auto_ptw_to_l2_buffer_out_a_bits_opcode(core_auto_ptw_to_l2_buffer_out_a_bits_opcode),
    .auto_ptw_to_l2_buffer_out_a_bits_param(core_auto_ptw_to_l2_buffer_out_a_bits_param),
    .auto_ptw_to_l2_buffer_out_a_bits_size(core_auto_ptw_to_l2_buffer_out_a_bits_size),
    .auto_ptw_to_l2_buffer_out_a_bits_source(core_auto_ptw_to_l2_buffer_out_a_bits_source),
    .auto_ptw_to_l2_buffer_out_a_bits_address(core_auto_ptw_to_l2_buffer_out_a_bits_address),
    .auto_ptw_to_l2_buffer_out_a_bits_mask(core_auto_ptw_to_l2_buffer_out_a_bits_mask),
    .auto_ptw_to_l2_buffer_out_a_bits_data(core_auto_ptw_to_l2_buffer_out_a_bits_data),
    .auto_ptw_to_l2_buffer_out_d_ready(core_auto_ptw_to_l2_buffer_out_d_ready),
    .auto_ptw_to_l2_buffer_out_d_valid(core_auto_ptw_to_l2_buffer_out_d_valid),
    .auto_ptw_to_l2_buffer_out_d_bits_opcode(core_auto_ptw_to_l2_buffer_out_d_bits_opcode),
    .auto_ptw_to_l2_buffer_out_d_bits_size(core_auto_ptw_to_l2_buffer_out_d_bits_size),
    .auto_ptw_to_l2_buffer_out_d_bits_source(core_auto_ptw_to_l2_buffer_out_d_bits_source),
    .auto_ptw_to_l2_buffer_out_d_bits_denied(core_auto_ptw_to_l2_buffer_out_d_bits_denied),
    .auto_ptw_to_l2_buffer_out_d_bits_data(core_auto_ptw_to_l2_buffer_out_d_bits_data),
    .auto_ptw_to_l2_buffer_out_d_bits_corrupt(core_auto_ptw_to_l2_buffer_out_d_bits_corrupt),
    .auto_frontend_icache_client_out_a_ready(core_auto_frontend_icache_client_out_a_ready),
    .auto_frontend_icache_client_out_a_valid(core_auto_frontend_icache_client_out_a_valid),
    .auto_frontend_icache_client_out_a_bits_opcode(core_auto_frontend_icache_client_out_a_bits_opcode),
    .auto_frontend_icache_client_out_a_bits_size(core_auto_frontend_icache_client_out_a_bits_size),
    .auto_frontend_icache_client_out_a_bits_source(core_auto_frontend_icache_client_out_a_bits_source),
    .auto_frontend_icache_client_out_a_bits_address(core_auto_frontend_icache_client_out_a_bits_address),
    .auto_frontend_icache_client_out_a_bits_mask(core_auto_frontend_icache_client_out_a_bits_mask),
    .auto_frontend_icache_client_out_bready(core_auto_frontend_icache_client_out_bready),
    .auto_frontend_icache_client_out_bvalid(core_auto_frontend_icache_client_out_bvalid),
    .auto_frontend_icache_client_out_bparam(core_auto_frontend_icache_client_out_bparam),
    .auto_frontend_icache_client_out_baddress(core_auto_frontend_icache_client_out_baddress),
    .auto_frontend_icache_client_out_bdata(core_auto_frontend_icache_client_out_bdata),
    .auto_frontend_icache_client_out_c_ready(core_auto_frontend_icache_client_out_c_ready),
    .auto_frontend_icache_client_out_c_valid(core_auto_frontend_icache_client_out_c_valid),
    .auto_frontend_icache_client_out_c_bits_opcode(core_auto_frontend_icache_client_out_c_bits_opcode),
    .auto_frontend_icache_client_out_c_bits_param(core_auto_frontend_icache_client_out_c_bits_param),
    .auto_frontend_icache_client_out_c_bits_address(core_auto_frontend_icache_client_out_c_bits_address),
    .auto_frontend_icache_client_out_c_bits_echo_blockisdirty(
      core_auto_frontend_icache_client_out_c_bits_echo_blockisdirty),
    .auto_frontend_icache_client_out_c_bits_data(core_auto_frontend_icache_client_out_c_bits_data),
    .auto_frontend_icache_client_out_d_ready(core_auto_frontend_icache_client_out_d_ready),
    .auto_frontend_icache_client_out_d_valid(core_auto_frontend_icache_client_out_d_valid),
    .auto_frontend_icache_client_out_d_bits_opcode(core_auto_frontend_icache_client_out_d_bits_opcode),
    .auto_frontend_icache_client_out_d_bits_param(core_auto_frontend_icache_client_out_d_bits_param),
    .auto_frontend_icache_client_out_d_bits_source(core_auto_frontend_icache_client_out_d_bits_source),
    .auto_frontend_icache_client_out_d_bits_sink(core_auto_frontend_icache_client_out_d_bits_sink),
    .auto_frontend_icache_client_out_d_bits_echo_blockisdirty(
      core_auto_frontend_icache_client_out_d_bits_echo_blockisdirty),
    .auto_frontend_icache_client_out_d_bits_data(core_auto_frontend_icache_client_out_d_bits_data),
    .auto_frontend_icache_client_out_d_bits_corrupt(core_auto_frontend_icache_client_out_d_bits_corrupt),
    .auto_frontend_icache_client_out_e_ready(core_auto_frontend_icache_client_out_e_ready),
    .auto_frontend_icache_client_out_e_valid(core_auto_frontend_icache_client_out_e_valid),
    .auto_frontend_icache_client_out_e_bits_sink(core_auto_frontend_icache_client_out_e_bits_sink),
    .auto_frontend_instrUncache_client_out_a_ready(core_auto_frontend_instrUncache_client_out_a_ready),
    .auto_frontend_instrUncache_client_out_a_valid(core_auto_frontend_instrUncache_client_out_a_valid),
    .auto_frontend_instrUncache_client_out_a_bits_address(core_auto_frontend_instrUncache_client_out_a_bits_address),
    .auto_frontend_instrUncache_client_out_d_ready(core_auto_frontend_instrUncache_client_out_d_ready),
    .auto_frontend_instrUncache_client_out_d_valid(core_auto_frontend_instrUncache_client_out_d_valid),
    .auto_frontend_instrUncache_client_out_d_bits_source(core_auto_frontend_instrUncache_client_out_d_bits_source),
    .auto_frontend_instrUncache_client_out_d_bits_data(core_auto_frontend_instrUncache_client_out_d_bits_data),
    .auto_plic_int_sink_in_1_0(core_auto_plic_int_sink_in_1_0),
    .auto_plic_int_sink_in_0_0(core_auto_plic_int_sink_in_0_0),
    .auto_debug_int_sink_in_0(core_auto_debug_int_sink_in_0),
    .auto_clint_int_sink_in_0(core_auto_clint_int_sink_in_0),
    .auto_clint_int_sink_in_1(core_auto_clint_int_sink_in_1),
    .io_hartId(core_io_hartId),
    .io_reset_vector(core_io_reset_vector),
    .io_cpu_halt(core_io_cpu_halt),
    .io_beu_errors_icache_ecc_error_valid(core_io_beu_errors_icache_ecc_error_valid),
    .io_beu_errors_icache_ecc_error_bits(core_io_beu_errors_icache_ecc_error_bits),
    .io_beu_errors_dcache_ecc_error_valid(core_io_beu_errors_dcache_ecc_error_valid),
    .io_beu_errors_dcache_ecc_error_bits(core_io_beu_errors_dcache_ecc_error_bits)
  );
  XSTileMisc misc ( // @[XSTile.scala 80:32]
    .clock(misc_clock),
    .reset(misc_reset),
    .auto_buffers_in_1_a_ready(misc_auto_buffers_in_1_a_ready),
    .auto_buffers_in_1_a_valid(misc_auto_buffers_in_1_a_valid),
    .auto_buffers_in_1_a_bits_opcode(misc_auto_buffers_in_1_a_bits_opcode),
    .auto_buffers_in_1_a_bits_size(misc_auto_buffers_in_1_a_bits_size),
    .auto_buffers_in_1_a_bits_source(misc_auto_buffers_in_1_a_bits_source),
    .auto_buffers_in_1_a_bits_address(misc_auto_buffers_in_1_a_bits_address),
    .auto_buffers_in_1_a_bits_mask(misc_auto_buffers_in_1_a_bits_mask),
    .auto_buffers_in_1_a_bits_data(misc_auto_buffers_in_1_a_bits_data),
    .auto_buffers_in_1_d_ready(misc_auto_buffers_in_1_d_ready),
    .auto_buffers_in_1_d_valid(misc_auto_buffers_in_1_d_valid),
    .auto_buffers_in_1_d_bits_opcode(misc_auto_buffers_in_1_d_bits_opcode),
    .auto_buffers_in_1_d_bits_data(misc_auto_buffers_in_1_d_bits_data),
    .auto_buffers_in_0_a_ready(misc_auto_buffers_in_0_a_ready),
    .auto_buffers_in_0_a_valid(misc_auto_buffers_in_0_a_valid),
    .auto_buffers_in_0_a_bits_address(misc_auto_buffers_in_0_a_bits_address),
    .auto_buffers_in_0_d_ready(misc_auto_buffers_in_0_d_ready),
    .auto_buffers_in_0_d_valid(misc_auto_buffers_in_0_d_valid),
    .auto_buffers_in_0_d_bits_source(misc_auto_buffers_in_0_d_bits_source),
    .auto_buffers_in_0_d_bits_data(misc_auto_buffers_in_0_d_bits_data),
    .auto_beu_int_out_0(misc_auto_beu_int_out_0),
    .auto_xbar_in_2_a_ready(misc_auto_xbar_in_2_a_ready),
    .auto_xbar_in_2_a_valid(misc_auto_xbar_in_2_a_valid),
    .auto_xbar_in_2_a_bits_opcode(misc_auto_xbar_in_2_a_bits_opcode),
    .auto_xbar_in_2_a_bits_param(misc_auto_xbar_in_2_a_bits_param),
    .auto_xbar_in_2_a_bits_size(misc_auto_xbar_in_2_a_bits_size),
    .auto_xbar_in_2_a_bits_source(misc_auto_xbar_in_2_a_bits_source),
    .auto_xbar_in_2_a_bits_address(misc_auto_xbar_in_2_a_bits_address),
    .auto_xbar_in_2_a_bits_mask(misc_auto_xbar_in_2_a_bits_mask),
    .auto_xbar_in_2_a_bits_data(misc_auto_xbar_in_2_a_bits_data),
    .auto_xbar_in_2_d_ready(misc_auto_xbar_in_2_d_ready),
    .auto_xbar_in_2_d_valid(misc_auto_xbar_in_2_d_valid),
    .auto_xbar_in_2_d_bits_opcode(misc_auto_xbar_in_2_d_bits_opcode),
    .auto_xbar_in_2_d_bits_size(misc_auto_xbar_in_2_d_bits_size),
    .auto_xbar_in_2_d_bits_source(misc_auto_xbar_in_2_d_bits_source),
    .auto_xbar_in_2_d_bits_denied(misc_auto_xbar_in_2_d_bits_denied),
    .auto_xbar_in_2_d_bits_data(misc_auto_xbar_in_2_d_bits_data),
    .auto_xbar_in_2_d_bits_corrupt(misc_auto_xbar_in_2_d_bits_corrupt),
    .auto_xbar_in_1_a_ready(misc_auto_xbar_in_1_a_ready),
    .auto_xbar_in_1_a_valid(misc_auto_xbar_in_1_a_valid),
    .auto_xbar_in_1_a_bits_opcode(misc_auto_xbar_in_1_a_bits_opcode),
    .auto_xbar_in_1_a_bits_param(misc_auto_xbar_in_1_a_bits_param),
    .auto_xbar_in_1_a_bits_size(misc_auto_xbar_in_1_a_bits_size),
    .auto_xbar_in_1_a_bits_source(misc_auto_xbar_in_1_a_bits_source),
    .auto_xbar_in_1_a_bits_address(misc_auto_xbar_in_1_a_bits_address),
    .auto_xbar_in_1_a_bits_user_preferCache(misc_auto_xbar_in_1_a_bits_user_preferCache),
    .auto_xbar_in_1_a_bits_mask(misc_auto_xbar_in_1_a_bits_mask),
    .auto_xbar_in_1_a_bits_data(misc_auto_xbar_in_1_a_bits_data),
    .auto_xbar_in_1_bready(misc_auto_xbar_in_1_bready),
    .auto_xbar_in_1_bvalid(misc_auto_xbar_in_1_bvalid),
    .auto_xbar_in_1_bparam(misc_auto_xbar_in_1_bparam),
    .auto_xbar_in_1_baddress(misc_auto_xbar_in_1_baddress),
    .auto_xbar_in_1_bdata(misc_auto_xbar_in_1_bdata),
    .auto_xbar_in_1_c_ready(misc_auto_xbar_in_1_c_ready),
    .auto_xbar_in_1_c_valid(misc_auto_xbar_in_1_c_valid),
    .auto_xbar_in_1_c_bits_opcode(misc_auto_xbar_in_1_c_bits_opcode),
    .auto_xbar_in_1_c_bits_param(misc_auto_xbar_in_1_c_bits_param),
    .auto_xbar_in_1_c_bits_size(misc_auto_xbar_in_1_c_bits_size),
    .auto_xbar_in_1_c_bits_source(misc_auto_xbar_in_1_c_bits_source),
    .auto_xbar_in_1_c_bits_address(misc_auto_xbar_in_1_c_bits_address),
    .auto_xbar_in_1_c_bits_echo_blockisdirty(misc_auto_xbar_in_1_c_bits_echo_blockisdirty),
    .auto_xbar_in_1_c_bits_data(misc_auto_xbar_in_1_c_bits_data),
    .auto_xbar_in_1_d_ready(misc_auto_xbar_in_1_d_ready),
    .auto_xbar_in_1_d_valid(misc_auto_xbar_in_1_d_valid),
    .auto_xbar_in_1_d_bits_opcode(misc_auto_xbar_in_1_d_bits_opcode),
    .auto_xbar_in_1_d_bits_param(misc_auto_xbar_in_1_d_bits_param),
    .auto_xbar_in_1_d_bits_source(misc_auto_xbar_in_1_d_bits_source),
    .auto_xbar_in_1_d_bits_sink(misc_auto_xbar_in_1_d_bits_sink),
    .auto_xbar_in_1_d_bits_echo_blockisdirty(misc_auto_xbar_in_1_d_bits_echo_blockisdirty),
    .auto_xbar_in_1_d_bits_data(misc_auto_xbar_in_1_d_bits_data),
    .auto_xbar_in_1_d_bits_corrupt(misc_auto_xbar_in_1_d_bits_corrupt),
    .auto_xbar_in_1_e_ready(misc_auto_xbar_in_1_e_ready),
    .auto_xbar_in_1_e_valid(misc_auto_xbar_in_1_e_valid),
    .auto_xbar_in_1_e_bits_sink(misc_auto_xbar_in_1_e_bits_sink),
    .auto_xbar_in_0_a_ready(misc_auto_xbar_in_0_a_ready),
    .auto_xbar_in_0_a_valid(misc_auto_xbar_in_0_a_valid),
    .auto_xbar_in_0_a_bits_opcode(misc_auto_xbar_in_0_a_bits_opcode),
    .auto_xbar_in_0_a_bits_param(misc_auto_xbar_in_0_a_bits_param),
    .auto_xbar_in_0_a_bits_size(misc_auto_xbar_in_0_a_bits_size),
    .auto_xbar_in_0_a_bits_source(misc_auto_xbar_in_0_a_bits_source),
    .auto_xbar_in_0_a_bits_address(misc_auto_xbar_in_0_a_bits_address),
    .auto_xbar_in_0_a_bits_user_preferCache(misc_auto_xbar_in_0_a_bits_user_preferCache),
    .auto_xbar_in_0_a_bits_mask(misc_auto_xbar_in_0_a_bits_mask),
    .auto_xbar_in_0_a_bits_data(misc_auto_xbar_in_0_a_bits_data),
    .auto_xbar_in_0_bready(misc_auto_xbar_in_0_bready),
    .auto_xbar_in_0_bvalid(misc_auto_xbar_in_0_bvalid),
    .auto_xbar_in_0_bopcode(misc_auto_xbar_in_0_bopcode),
    .auto_xbar_in_0_bparam(misc_auto_xbar_in_0_bparam),
    .auto_xbar_in_0_bsize(misc_auto_xbar_in_0_bsize),
    .auto_xbar_in_0_bsource(misc_auto_xbar_in_0_bsource),
    .auto_xbar_in_0_baddress(misc_auto_xbar_in_0_baddress),
    .auto_xbar_in_0_bmask(misc_auto_xbar_in_0_bmask),
    .auto_xbar_in_0_bdata(misc_auto_xbar_in_0_bdata),
    .auto_xbar_in_0_c_ready(misc_auto_xbar_in_0_c_ready),
    .auto_xbar_in_0_c_valid(misc_auto_xbar_in_0_c_valid),
    .auto_xbar_in_0_c_bits_opcode(misc_auto_xbar_in_0_c_bits_opcode),
    .auto_xbar_in_0_c_bits_param(misc_auto_xbar_in_0_c_bits_param),
    .auto_xbar_in_0_c_bits_size(misc_auto_xbar_in_0_c_bits_size),
    .auto_xbar_in_0_c_bits_source(misc_auto_xbar_in_0_c_bits_source),
    .auto_xbar_in_0_c_bits_address(misc_auto_xbar_in_0_c_bits_address),
    .auto_xbar_in_0_c_bits_echo_blockisdirty(misc_auto_xbar_in_0_c_bits_echo_blockisdirty),
    .auto_xbar_in_0_c_bits_data(misc_auto_xbar_in_0_c_bits_data),
    .auto_xbar_in_0_d_ready(misc_auto_xbar_in_0_d_ready),
    .auto_xbar_in_0_d_valid(misc_auto_xbar_in_0_d_valid),
    .auto_xbar_in_0_d_bits_opcode(misc_auto_xbar_in_0_d_bits_opcode),
    .auto_xbar_in_0_d_bits_param(misc_auto_xbar_in_0_d_bits_param),
    .auto_xbar_in_0_d_bits_size(misc_auto_xbar_in_0_d_bits_size),
    .auto_xbar_in_0_d_bits_source(misc_auto_xbar_in_0_d_bits_source),
    .auto_xbar_in_0_d_bits_sink(misc_auto_xbar_in_0_d_bits_sink),
    .auto_xbar_in_0_d_bits_denied(misc_auto_xbar_in_0_d_bits_denied),
    .auto_xbar_in_0_d_bits_echo_blockisdirty(misc_auto_xbar_in_0_d_bits_echo_blockisdirty),
    .auto_xbar_in_0_d_bits_data(misc_auto_xbar_in_0_d_bits_data),
    .auto_xbar_in_0_d_bits_corrupt(misc_auto_xbar_in_0_d_bits_corrupt),
    .auto_xbar_in_0_e_ready(misc_auto_xbar_in_0_e_ready),
    .auto_xbar_in_0_e_valid(misc_auto_xbar_in_0_e_valid),
    .auto_xbar_in_0_e_bits_sink(misc_auto_xbar_in_0_e_bits_sink),
    .auto_memory_port_out_a_ready(misc_auto_memory_port_out_a_ready),
    .auto_memory_port_out_a_valid(misc_auto_memory_port_out_a_valid),
    .auto_memory_port_out_a_bits_opcode(misc_auto_memory_port_out_a_bits_opcode),
    .auto_memory_port_out_a_bits_param(misc_auto_memory_port_out_a_bits_param),
    .auto_memory_port_out_a_bits_size(misc_auto_memory_port_out_a_bits_size),
    .auto_memory_port_out_a_bits_source(misc_auto_memory_port_out_a_bits_source),
    .auto_memory_port_out_a_bits_address(misc_auto_memory_port_out_a_bits_address),
    .auto_memory_port_out_a_bits_user_preferCache(misc_auto_memory_port_out_a_bits_user_preferCache),
    .auto_memory_port_out_a_bits_mask(misc_auto_memory_port_out_a_bits_mask),
    .auto_memory_port_out_a_bits_data(misc_auto_memory_port_out_a_bits_data),
    .auto_memory_port_out_bready(misc_auto_memory_port_out_bready),
    .auto_memory_port_out_bvalid(misc_auto_memory_port_out_bvalid),
    .auto_memory_port_out_bopcode(misc_auto_memory_port_out_bopcode),
    .auto_memory_port_out_bparam(misc_auto_memory_port_out_bparam),
    .auto_memory_port_out_bsize(misc_auto_memory_port_out_bsize),
    .auto_memory_port_out_bsource(misc_auto_memory_port_out_bsource),
    .auto_memory_port_out_baddress(misc_auto_memory_port_out_baddress),
    .auto_memory_port_out_bmask(misc_auto_memory_port_out_bmask),
    .auto_memory_port_out_bdata(misc_auto_memory_port_out_bdata),
    .auto_memory_port_out_c_ready(misc_auto_memory_port_out_c_ready),
    .auto_memory_port_out_c_valid(misc_auto_memory_port_out_c_valid),
    .auto_memory_port_out_c_bits_opcode(misc_auto_memory_port_out_c_bits_opcode),
    .auto_memory_port_out_c_bits_param(misc_auto_memory_port_out_c_bits_param),
    .auto_memory_port_out_c_bits_size(misc_auto_memory_port_out_c_bits_size),
    .auto_memory_port_out_c_bits_source(misc_auto_memory_port_out_c_bits_source),
    .auto_memory_port_out_c_bits_address(misc_auto_memory_port_out_c_bits_address),
    .auto_memory_port_out_c_bits_echo_blockisdirty(misc_auto_memory_port_out_c_bits_echo_blockisdirty),
    .auto_memory_port_out_c_bits_data(misc_auto_memory_port_out_c_bits_data),
    .auto_memory_port_out_d_ready(misc_auto_memory_port_out_d_ready),
    .auto_memory_port_out_d_valid(misc_auto_memory_port_out_d_valid),
    .auto_memory_port_out_d_bits_opcode(misc_auto_memory_port_out_d_bits_opcode),
    .auto_memory_port_out_d_bits_param(misc_auto_memory_port_out_d_bits_param),
    .auto_memory_port_out_d_bits_size(misc_auto_memory_port_out_d_bits_size),
    .auto_memory_port_out_d_bits_source(misc_auto_memory_port_out_d_bits_source),
    .auto_memory_port_out_d_bits_sink(misc_auto_memory_port_out_d_bits_sink),
    .auto_memory_port_out_d_bits_denied(misc_auto_memory_port_out_d_bits_denied),
    .auto_memory_port_out_d_bits_echo_blockisdirty(misc_auto_memory_port_out_d_bits_echo_blockisdirty),
    .auto_memory_port_out_d_bits_data(misc_auto_memory_port_out_d_bits_data),
    .auto_memory_port_out_d_bits_corrupt(misc_auto_memory_port_out_d_bits_corrupt),
    .auto_memory_port_out_e_ready(misc_auto_memory_port_out_e_ready),
    .auto_memory_port_out_e_valid(misc_auto_memory_port_out_e_valid),
    .auto_memory_port_out_e_bits_sink(misc_auto_memory_port_out_e_bits_sink),
    .auto_mmio_port_out_a_ready(misc_auto_mmio_port_out_a_ready),
    .auto_mmio_port_out_a_valid(misc_auto_mmio_port_out_a_valid),
    .auto_mmio_port_out_a_bits_opcode(misc_auto_mmio_port_out_a_bits_opcode),
    .auto_mmio_port_out_a_bits_size(misc_auto_mmio_port_out_a_bits_size),
    .auto_mmio_port_out_a_bits_source(misc_auto_mmio_port_out_a_bits_source),
    .auto_mmio_port_out_a_bits_address(misc_auto_mmio_port_out_a_bits_address),
    .auto_mmio_port_out_a_bits_mask(misc_auto_mmio_port_out_a_bits_mask),
    .auto_mmio_port_out_a_bits_data(misc_auto_mmio_port_out_a_bits_data),
    .auto_mmio_port_out_d_ready(misc_auto_mmio_port_out_d_ready),
    .auto_mmio_port_out_d_valid(misc_auto_mmio_port_out_d_valid),
    .auto_mmio_port_out_d_bits_opcode(misc_auto_mmio_port_out_d_bits_opcode),
    .auto_mmio_port_out_d_bits_size(misc_auto_mmio_port_out_d_bits_size),
    .auto_mmio_port_out_d_bits_source(misc_auto_mmio_port_out_d_bits_source),
    .auto_mmio_port_out_d_bits_data(misc_auto_mmio_port_out_d_bits_data),
    .beu_errors_icache_ecc_error_valid(misc_beu_errors_icache_ecc_error_valid),
    .beu_errors_icache_ecc_error_bits(misc_beu_errors_icache_ecc_error_bits),
    .beu_errors_dcache_ecc_error_valid(misc_beu_errors_dcache_ecc_error_valid),
    .beu_errors_dcache_ecc_error_bits(misc_beu_errors_dcache_ecc_error_bits)
  );
  TLBuffer_27 buffer ( // @[XSTile.scala 97:28]
    .clock(buffer_clock),
    .reset(buffer_reset),
    .auto_in_a_ready(buffer_auto_in_a_ready),
    .auto_in_a_valid(buffer_auto_in_a_valid),
    .auto_in_a_bits_opcode(buffer_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(buffer_auto_in_a_bits_param),
    .auto_in_a_bits_size(buffer_auto_in_a_bits_size),
    .auto_in_a_bits_source(buffer_auto_in_a_bits_source),
    .auto_in_a_bits_address(buffer_auto_in_a_bits_address),
    .auto_in_a_bits_mask(buffer_auto_in_a_bits_mask),
    .auto_in_bready(buffer_auto_in_bready),
    .auto_in_bvalid(buffer_auto_in_bvalid),
    .auto_in_bparam(buffer_auto_in_bparam),
    .auto_in_baddress(buffer_auto_in_baddress),
    .auto_in_bdata(buffer_auto_in_bdata),
    .auto_in_c_ready(buffer_auto_in_c_ready),
    .auto_in_c_valid(buffer_auto_in_c_valid),
    .auto_in_c_bits_opcode(buffer_auto_in_c_bits_opcode),
    .auto_in_c_bits_param(buffer_auto_in_c_bits_param),
    .auto_in_c_bits_size(buffer_auto_in_c_bits_size),
    .auto_in_c_bits_source(buffer_auto_in_c_bits_source),
    .auto_in_c_bits_address(buffer_auto_in_c_bits_address),
    .auto_in_c_bits_echo_blockisdirty(buffer_auto_in_c_bits_echo_blockisdirty),
    .auto_in_c_bits_data(buffer_auto_in_c_bits_data),
    .auto_in_d_ready(buffer_auto_in_d_ready),
    .auto_in_d_valid(buffer_auto_in_d_valid),
    .auto_in_d_bits_opcode(buffer_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(buffer_auto_in_d_bits_param),
    .auto_in_d_bits_size(buffer_auto_in_d_bits_size),
    .auto_in_d_bits_source(buffer_auto_in_d_bits_source),
    .auto_in_d_bits_sink(buffer_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(buffer_auto_in_d_bits_denied),
    .auto_in_d_bits_echo_blockisdirty(buffer_auto_in_d_bits_echo_blockisdirty),
    .auto_in_d_bits_data(buffer_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(buffer_auto_in_d_bits_corrupt),
    .auto_in_e_ready(buffer_auto_in_e_ready),
    .auto_in_e_valid(buffer_auto_in_e_valid),
    .auto_in_e_bits_sink(buffer_auto_in_e_bits_sink),
    .auto_out_a_ready(buffer_auto_out_a_ready),
    .auto_out_a_valid(buffer_auto_out_a_valid),
    .auto_out_a_bits_opcode(buffer_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(buffer_auto_out_a_bits_param),
    .auto_out_a_bits_size(buffer_auto_out_a_bits_size),
    .auto_out_a_bits_source(buffer_auto_out_a_bits_source),
    .auto_out_a_bits_address(buffer_auto_out_a_bits_address),
    .auto_out_a_bits_user_preferCache(buffer_auto_out_a_bits_user_preferCache),
    .auto_out_a_bits_mask(buffer_auto_out_a_bits_mask),
    .auto_out_a_bits_data(buffer_auto_out_a_bits_data),
    .auto_out_bready(buffer_auto_out_bready),
    .auto_out_bvalid(buffer_auto_out_bvalid),
    .auto_out_bopcode(buffer_auto_out_bopcode),
    .auto_out_bparam(buffer_auto_out_bparam),
    .auto_out_bsize(buffer_auto_out_bsize),
    .auto_out_bsource(buffer_auto_out_bsource),
    .auto_out_baddress(buffer_auto_out_baddress),
    .auto_out_bmask(buffer_auto_out_bmask),
    .auto_out_bdata(buffer_auto_out_bdata),
    .auto_out_c_ready(buffer_auto_out_c_ready),
    .auto_out_c_valid(buffer_auto_out_c_valid),
    .auto_out_c_bits_opcode(buffer_auto_out_c_bits_opcode),
    .auto_out_c_bits_param(buffer_auto_out_c_bits_param),
    .auto_out_c_bits_size(buffer_auto_out_c_bits_size),
    .auto_out_c_bits_source(buffer_auto_out_c_bits_source),
    .auto_out_c_bits_address(buffer_auto_out_c_bits_address),
    .auto_out_c_bits_echo_blockisdirty(buffer_auto_out_c_bits_echo_blockisdirty),
    .auto_out_c_bits_data(buffer_auto_out_c_bits_data),
    .auto_out_d_ready(buffer_auto_out_d_ready),
    .auto_out_d_valid(buffer_auto_out_d_valid),
    .auto_out_d_bits_opcode(buffer_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(buffer_auto_out_d_bits_param),
    .auto_out_d_bits_size(buffer_auto_out_d_bits_size),
    .auto_out_d_bits_source(buffer_auto_out_d_bits_source),
    .auto_out_d_bits_sink(buffer_auto_out_d_bits_sink),
    .auto_out_d_bits_denied(buffer_auto_out_d_bits_denied),
    .auto_out_d_bits_echo_blockisdirty(buffer_auto_out_d_bits_echo_blockisdirty),
    .auto_out_d_bits_data(buffer_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(buffer_auto_out_d_bits_corrupt),
    .auto_out_e_ready(buffer_auto_out_e_ready),
    .auto_out_e_valid(buffer_auto_out_e_valid),
    .auto_out_e_bits_sink(buffer_auto_out_e_bits_sink)
  );
  TLBuffer_28 l1i_to_l2_buffer_0 ( // @[XSTile.scala 103:46]
    .clock(l1i_to_l2_buffer_0_clock),
    .reset(l1i_to_l2_buffer_0_reset),
    .auto_in_a_ready(l1i_to_l2_buffer_0_auto_in_a_ready),
    .auto_in_a_valid(l1i_to_l2_buffer_0_auto_in_a_valid),
    .auto_in_a_bits_opcode(l1i_to_l2_buffer_0_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(l1i_to_l2_buffer_0_auto_in_a_bits_param),
    .auto_in_a_bits_size(l1i_to_l2_buffer_0_auto_in_a_bits_size),
    .auto_in_a_bits_source(l1i_to_l2_buffer_0_auto_in_a_bits_source),
    .auto_in_a_bits_address(l1i_to_l2_buffer_0_auto_in_a_bits_address),
    .auto_in_a_bits_user_preferCache(l1i_to_l2_buffer_0_auto_in_a_bits_user_preferCache),
    .auto_in_a_bits_mask(l1i_to_l2_buffer_0_auto_in_a_bits_mask),
    .auto_in_a_bits_data(l1i_to_l2_buffer_0_auto_in_a_bits_data),
    .auto_in_bready(l1i_to_l2_buffer_0_auto_in_bready),
    .auto_in_bvalid(l1i_to_l2_buffer_0_auto_in_bvalid),
    .auto_in_bparam(l1i_to_l2_buffer_0_auto_in_bparam),
    .auto_in_baddress(l1i_to_l2_buffer_0_auto_in_baddress),
    .auto_in_bdata(l1i_to_l2_buffer_0_auto_in_bdata),
    .auto_in_c_ready(l1i_to_l2_buffer_0_auto_in_c_ready),
    .auto_in_c_valid(l1i_to_l2_buffer_0_auto_in_c_valid),
    .auto_in_c_bits_opcode(l1i_to_l2_buffer_0_auto_in_c_bits_opcode),
    .auto_in_c_bits_param(l1i_to_l2_buffer_0_auto_in_c_bits_param),
    .auto_in_c_bits_size(l1i_to_l2_buffer_0_auto_in_c_bits_size),
    .auto_in_c_bits_source(l1i_to_l2_buffer_0_auto_in_c_bits_source),
    .auto_in_c_bits_address(l1i_to_l2_buffer_0_auto_in_c_bits_address),
    .auto_in_c_bits_echo_blockisdirty(l1i_to_l2_buffer_0_auto_in_c_bits_echo_blockisdirty),
    .auto_in_c_bits_data(l1i_to_l2_buffer_0_auto_in_c_bits_data),
    .auto_in_d_ready(l1i_to_l2_buffer_0_auto_in_d_ready),
    .auto_in_d_valid(l1i_to_l2_buffer_0_auto_in_d_valid),
    .auto_in_d_bits_opcode(l1i_to_l2_buffer_0_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(l1i_to_l2_buffer_0_auto_in_d_bits_param),
    .auto_in_d_bits_source(l1i_to_l2_buffer_0_auto_in_d_bits_source),
    .auto_in_d_bits_sink(l1i_to_l2_buffer_0_auto_in_d_bits_sink),
    .auto_in_d_bits_echo_blockisdirty(l1i_to_l2_buffer_0_auto_in_d_bits_echo_blockisdirty),
    .auto_in_d_bits_data(l1i_to_l2_buffer_0_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(l1i_to_l2_buffer_0_auto_in_d_bits_corrupt),
    .auto_in_e_ready(l1i_to_l2_buffer_0_auto_in_e_ready),
    .auto_in_e_valid(l1i_to_l2_buffer_0_auto_in_e_valid),
    .auto_in_e_bits_sink(l1i_to_l2_buffer_0_auto_in_e_bits_sink),
    .auto_out_a_ready(l1i_to_l2_buffer_0_auto_out_a_ready),
    .auto_out_a_valid(l1i_to_l2_buffer_0_auto_out_a_valid),
    .auto_out_a_bits_opcode(l1i_to_l2_buffer_0_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(l1i_to_l2_buffer_0_auto_out_a_bits_param),
    .auto_out_a_bits_size(l1i_to_l2_buffer_0_auto_out_a_bits_size),
    .auto_out_a_bits_source(l1i_to_l2_buffer_0_auto_out_a_bits_source),
    .auto_out_a_bits_address(l1i_to_l2_buffer_0_auto_out_a_bits_address),
    .auto_out_a_bits_user_preferCache(l1i_to_l2_buffer_0_auto_out_a_bits_user_preferCache),
    .auto_out_a_bits_mask(l1i_to_l2_buffer_0_auto_out_a_bits_mask),
    .auto_out_a_bits_data(l1i_to_l2_buffer_0_auto_out_a_bits_data),
    .auto_out_bready(l1i_to_l2_buffer_0_auto_out_bready),
    .auto_out_bvalid(l1i_to_l2_buffer_0_auto_out_bvalid),
    .auto_out_bparam(l1i_to_l2_buffer_0_auto_out_bparam),
    .auto_out_baddress(l1i_to_l2_buffer_0_auto_out_baddress),
    .auto_out_bdata(l1i_to_l2_buffer_0_auto_out_bdata),
    .auto_out_c_ready(l1i_to_l2_buffer_0_auto_out_c_ready),
    .auto_out_c_valid(l1i_to_l2_buffer_0_auto_out_c_valid),
    .auto_out_c_bits_opcode(l1i_to_l2_buffer_0_auto_out_c_bits_opcode),
    .auto_out_c_bits_param(l1i_to_l2_buffer_0_auto_out_c_bits_param),
    .auto_out_c_bits_size(l1i_to_l2_buffer_0_auto_out_c_bits_size),
    .auto_out_c_bits_source(l1i_to_l2_buffer_0_auto_out_c_bits_source),
    .auto_out_c_bits_address(l1i_to_l2_buffer_0_auto_out_c_bits_address),
    .auto_out_c_bits_echo_blockisdirty(l1i_to_l2_buffer_0_auto_out_c_bits_echo_blockisdirty),
    .auto_out_c_bits_data(l1i_to_l2_buffer_0_auto_out_c_bits_data),
    .auto_out_d_ready(l1i_to_l2_buffer_0_auto_out_d_ready),
    .auto_out_d_valid(l1i_to_l2_buffer_0_auto_out_d_valid),
    .auto_out_d_bits_opcode(l1i_to_l2_buffer_0_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(l1i_to_l2_buffer_0_auto_out_d_bits_param),
    .auto_out_d_bits_source(l1i_to_l2_buffer_0_auto_out_d_bits_source),
    .auto_out_d_bits_sink(l1i_to_l2_buffer_0_auto_out_d_bits_sink),
    .auto_out_d_bits_echo_blockisdirty(l1i_to_l2_buffer_0_auto_out_d_bits_echo_blockisdirty),
    .auto_out_d_bits_data(l1i_to_l2_buffer_0_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(l1i_to_l2_buffer_0_auto_out_d_bits_corrupt),
    .auto_out_e_ready(l1i_to_l2_buffer_0_auto_out_e_ready),
    .auto_out_e_valid(l1i_to_l2_buffer_0_auto_out_e_valid),
    .auto_out_e_bits_sink(l1i_to_l2_buffer_0_auto_out_e_bits_sink)
  );
  TLBuffer_28 l1i_to_l2_buffer_1 ( // @[XSTile.scala 103:46]
    .clock(l1i_to_l2_buffer_1_clock),
    .reset(l1i_to_l2_buffer_1_reset),
    .auto_in_a_ready(l1i_to_l2_buffer_1_auto_in_a_ready),
    .auto_in_a_valid(l1i_to_l2_buffer_1_auto_in_a_valid),
    .auto_in_a_bits_opcode(l1i_to_l2_buffer_1_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(l1i_to_l2_buffer_1_auto_in_a_bits_param),
    .auto_in_a_bits_size(l1i_to_l2_buffer_1_auto_in_a_bits_size),
    .auto_in_a_bits_source(l1i_to_l2_buffer_1_auto_in_a_bits_source),
    .auto_in_a_bits_address(l1i_to_l2_buffer_1_auto_in_a_bits_address),
    .auto_in_a_bits_user_preferCache(l1i_to_l2_buffer_1_auto_in_a_bits_user_preferCache),
    .auto_in_a_bits_mask(l1i_to_l2_buffer_1_auto_in_a_bits_mask),
    .auto_in_a_bits_data(l1i_to_l2_buffer_1_auto_in_a_bits_data),
    .auto_in_bready(l1i_to_l2_buffer_1_auto_in_bready),
    .auto_in_bvalid(l1i_to_l2_buffer_1_auto_in_bvalid),
    .auto_in_bparam(l1i_to_l2_buffer_1_auto_in_bparam),
    .auto_in_baddress(l1i_to_l2_buffer_1_auto_in_baddress),
    .auto_in_bdata(l1i_to_l2_buffer_1_auto_in_bdata),
    .auto_in_c_ready(l1i_to_l2_buffer_1_auto_in_c_ready),
    .auto_in_c_valid(l1i_to_l2_buffer_1_auto_in_c_valid),
    .auto_in_c_bits_opcode(l1i_to_l2_buffer_1_auto_in_c_bits_opcode),
    .auto_in_c_bits_param(l1i_to_l2_buffer_1_auto_in_c_bits_param),
    .auto_in_c_bits_size(l1i_to_l2_buffer_1_auto_in_c_bits_size),
    .auto_in_c_bits_source(l1i_to_l2_buffer_1_auto_in_c_bits_source),
    .auto_in_c_bits_address(l1i_to_l2_buffer_1_auto_in_c_bits_address),
    .auto_in_c_bits_echo_blockisdirty(l1i_to_l2_buffer_1_auto_in_c_bits_echo_blockisdirty),
    .auto_in_c_bits_data(l1i_to_l2_buffer_1_auto_in_c_bits_data),
    .auto_in_d_ready(l1i_to_l2_buffer_1_auto_in_d_ready),
    .auto_in_d_valid(l1i_to_l2_buffer_1_auto_in_d_valid),
    .auto_in_d_bits_opcode(l1i_to_l2_buffer_1_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(l1i_to_l2_buffer_1_auto_in_d_bits_param),
    .auto_in_d_bits_source(l1i_to_l2_buffer_1_auto_in_d_bits_source),
    .auto_in_d_bits_sink(l1i_to_l2_buffer_1_auto_in_d_bits_sink),
    .auto_in_d_bits_echo_blockisdirty(l1i_to_l2_buffer_1_auto_in_d_bits_echo_blockisdirty),
    .auto_in_d_bits_data(l1i_to_l2_buffer_1_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(l1i_to_l2_buffer_1_auto_in_d_bits_corrupt),
    .auto_in_e_ready(l1i_to_l2_buffer_1_auto_in_e_ready),
    .auto_in_e_valid(l1i_to_l2_buffer_1_auto_in_e_valid),
    .auto_in_e_bits_sink(l1i_to_l2_buffer_1_auto_in_e_bits_sink),
    .auto_out_a_ready(l1i_to_l2_buffer_1_auto_out_a_ready),
    .auto_out_a_valid(l1i_to_l2_buffer_1_auto_out_a_valid),
    .auto_out_a_bits_opcode(l1i_to_l2_buffer_1_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(l1i_to_l2_buffer_1_auto_out_a_bits_param),
    .auto_out_a_bits_size(l1i_to_l2_buffer_1_auto_out_a_bits_size),
    .auto_out_a_bits_source(l1i_to_l2_buffer_1_auto_out_a_bits_source),
    .auto_out_a_bits_address(l1i_to_l2_buffer_1_auto_out_a_bits_address),
    .auto_out_a_bits_user_preferCache(l1i_to_l2_buffer_1_auto_out_a_bits_user_preferCache),
    .auto_out_a_bits_mask(l1i_to_l2_buffer_1_auto_out_a_bits_mask),
    .auto_out_a_bits_data(l1i_to_l2_buffer_1_auto_out_a_bits_data),
    .auto_out_bready(l1i_to_l2_buffer_1_auto_out_bready),
    .auto_out_bvalid(l1i_to_l2_buffer_1_auto_out_bvalid),
    .auto_out_bparam(l1i_to_l2_buffer_1_auto_out_bparam),
    .auto_out_baddress(l1i_to_l2_buffer_1_auto_out_baddress),
    .auto_out_bdata(l1i_to_l2_buffer_1_auto_out_bdata),
    .auto_out_c_ready(l1i_to_l2_buffer_1_auto_out_c_ready),
    .auto_out_c_valid(l1i_to_l2_buffer_1_auto_out_c_valid),
    .auto_out_c_bits_opcode(l1i_to_l2_buffer_1_auto_out_c_bits_opcode),
    .auto_out_c_bits_param(l1i_to_l2_buffer_1_auto_out_c_bits_param),
    .auto_out_c_bits_size(l1i_to_l2_buffer_1_auto_out_c_bits_size),
    .auto_out_c_bits_source(l1i_to_l2_buffer_1_auto_out_c_bits_source),
    .auto_out_c_bits_address(l1i_to_l2_buffer_1_auto_out_c_bits_address),
    .auto_out_c_bits_echo_blockisdirty(l1i_to_l2_buffer_1_auto_out_c_bits_echo_blockisdirty),
    .auto_out_c_bits_data(l1i_to_l2_buffer_1_auto_out_c_bits_data),
    .auto_out_d_ready(l1i_to_l2_buffer_1_auto_out_d_ready),
    .auto_out_d_valid(l1i_to_l2_buffer_1_auto_out_d_valid),
    .auto_out_d_bits_opcode(l1i_to_l2_buffer_1_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(l1i_to_l2_buffer_1_auto_out_d_bits_param),
    .auto_out_d_bits_source(l1i_to_l2_buffer_1_auto_out_d_bits_source),
    .auto_out_d_bits_sink(l1i_to_l2_buffer_1_auto_out_d_bits_sink),
    .auto_out_d_bits_echo_blockisdirty(l1i_to_l2_buffer_1_auto_out_d_bits_echo_blockisdirty),
    .auto_out_d_bits_data(l1i_to_l2_buffer_1_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(l1i_to_l2_buffer_1_auto_out_d_bits_corrupt),
    .auto_out_e_ready(l1i_to_l2_buffer_1_auto_out_e_ready),
    .auto_out_e_valid(l1i_to_l2_buffer_1_auto_out_e_valid),
    .auto_out_e_bits_sink(l1i_to_l2_buffer_1_auto_out_e_bits_sink)
  );
  TLBuffer_28 l1i_to_l2_buffer_2 ( // @[XSTile.scala 103:46]
    .clock(l1i_to_l2_buffer_2_clock),
    .reset(l1i_to_l2_buffer_2_reset),
    .auto_in_a_ready(l1i_to_l2_buffer_2_auto_in_a_ready),
    .auto_in_a_valid(l1i_to_l2_buffer_2_auto_in_a_valid),
    .auto_in_a_bits_opcode(l1i_to_l2_buffer_2_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(l1i_to_l2_buffer_2_auto_in_a_bits_param),
    .auto_in_a_bits_size(l1i_to_l2_buffer_2_auto_in_a_bits_size),
    .auto_in_a_bits_source(l1i_to_l2_buffer_2_auto_in_a_bits_source),
    .auto_in_a_bits_address(l1i_to_l2_buffer_2_auto_in_a_bits_address),
    .auto_in_a_bits_user_preferCache(l1i_to_l2_buffer_2_auto_in_a_bits_user_preferCache),
    .auto_in_a_bits_mask(l1i_to_l2_buffer_2_auto_in_a_bits_mask),
    .auto_in_a_bits_data(l1i_to_l2_buffer_2_auto_in_a_bits_data),
    .auto_in_bready(l1i_to_l2_buffer_2_auto_in_bready),
    .auto_in_bvalid(l1i_to_l2_buffer_2_auto_in_bvalid),
    .auto_in_bparam(l1i_to_l2_buffer_2_auto_in_bparam),
    .auto_in_baddress(l1i_to_l2_buffer_2_auto_in_baddress),
    .auto_in_bdata(l1i_to_l2_buffer_2_auto_in_bdata),
    .auto_in_c_ready(l1i_to_l2_buffer_2_auto_in_c_ready),
    .auto_in_c_valid(l1i_to_l2_buffer_2_auto_in_c_valid),
    .auto_in_c_bits_opcode(l1i_to_l2_buffer_2_auto_in_c_bits_opcode),
    .auto_in_c_bits_param(l1i_to_l2_buffer_2_auto_in_c_bits_param),
    .auto_in_c_bits_size(l1i_to_l2_buffer_2_auto_in_c_bits_size),
    .auto_in_c_bits_source(l1i_to_l2_buffer_2_auto_in_c_bits_source),
    .auto_in_c_bits_address(l1i_to_l2_buffer_2_auto_in_c_bits_address),
    .auto_in_c_bits_echo_blockisdirty(l1i_to_l2_buffer_2_auto_in_c_bits_echo_blockisdirty),
    .auto_in_c_bits_data(l1i_to_l2_buffer_2_auto_in_c_bits_data),
    .auto_in_d_ready(l1i_to_l2_buffer_2_auto_in_d_ready),
    .auto_in_d_valid(l1i_to_l2_buffer_2_auto_in_d_valid),
    .auto_in_d_bits_opcode(l1i_to_l2_buffer_2_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(l1i_to_l2_buffer_2_auto_in_d_bits_param),
    .auto_in_d_bits_source(l1i_to_l2_buffer_2_auto_in_d_bits_source),
    .auto_in_d_bits_sink(l1i_to_l2_buffer_2_auto_in_d_bits_sink),
    .auto_in_d_bits_echo_blockisdirty(l1i_to_l2_buffer_2_auto_in_d_bits_echo_blockisdirty),
    .auto_in_d_bits_data(l1i_to_l2_buffer_2_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(l1i_to_l2_buffer_2_auto_in_d_bits_corrupt),
    .auto_in_e_ready(l1i_to_l2_buffer_2_auto_in_e_ready),
    .auto_in_e_valid(l1i_to_l2_buffer_2_auto_in_e_valid),
    .auto_in_e_bits_sink(l1i_to_l2_buffer_2_auto_in_e_bits_sink),
    .auto_out_a_ready(l1i_to_l2_buffer_2_auto_out_a_ready),
    .auto_out_a_valid(l1i_to_l2_buffer_2_auto_out_a_valid),
    .auto_out_a_bits_opcode(l1i_to_l2_buffer_2_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(l1i_to_l2_buffer_2_auto_out_a_bits_param),
    .auto_out_a_bits_size(l1i_to_l2_buffer_2_auto_out_a_bits_size),
    .auto_out_a_bits_source(l1i_to_l2_buffer_2_auto_out_a_bits_source),
    .auto_out_a_bits_address(l1i_to_l2_buffer_2_auto_out_a_bits_address),
    .auto_out_a_bits_user_preferCache(l1i_to_l2_buffer_2_auto_out_a_bits_user_preferCache),
    .auto_out_a_bits_mask(l1i_to_l2_buffer_2_auto_out_a_bits_mask),
    .auto_out_a_bits_data(l1i_to_l2_buffer_2_auto_out_a_bits_data),
    .auto_out_bready(l1i_to_l2_buffer_2_auto_out_bready),
    .auto_out_bvalid(l1i_to_l2_buffer_2_auto_out_bvalid),
    .auto_out_bparam(l1i_to_l2_buffer_2_auto_out_bparam),
    .auto_out_baddress(l1i_to_l2_buffer_2_auto_out_baddress),
    .auto_out_bdata(l1i_to_l2_buffer_2_auto_out_bdata),
    .auto_out_c_ready(l1i_to_l2_buffer_2_auto_out_c_ready),
    .auto_out_c_valid(l1i_to_l2_buffer_2_auto_out_c_valid),
    .auto_out_c_bits_opcode(l1i_to_l2_buffer_2_auto_out_c_bits_opcode),
    .auto_out_c_bits_param(l1i_to_l2_buffer_2_auto_out_c_bits_param),
    .auto_out_c_bits_size(l1i_to_l2_buffer_2_auto_out_c_bits_size),
    .auto_out_c_bits_source(l1i_to_l2_buffer_2_auto_out_c_bits_source),
    .auto_out_c_bits_address(l1i_to_l2_buffer_2_auto_out_c_bits_address),
    .auto_out_c_bits_echo_blockisdirty(l1i_to_l2_buffer_2_auto_out_c_bits_echo_blockisdirty),
    .auto_out_c_bits_data(l1i_to_l2_buffer_2_auto_out_c_bits_data),
    .auto_out_d_ready(l1i_to_l2_buffer_2_auto_out_d_ready),
    .auto_out_d_valid(l1i_to_l2_buffer_2_auto_out_d_valid),
    .auto_out_d_bits_opcode(l1i_to_l2_buffer_2_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(l1i_to_l2_buffer_2_auto_out_d_bits_param),
    .auto_out_d_bits_source(l1i_to_l2_buffer_2_auto_out_d_bits_source),
    .auto_out_d_bits_sink(l1i_to_l2_buffer_2_auto_out_d_bits_sink),
    .auto_out_d_bits_echo_blockisdirty(l1i_to_l2_buffer_2_auto_out_d_bits_echo_blockisdirty),
    .auto_out_d_bits_data(l1i_to_l2_buffer_2_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(l1i_to_l2_buffer_2_auto_out_d_bits_corrupt),
    .auto_out_e_ready(l1i_to_l2_buffer_2_auto_out_e_ready),
    .auto_out_e_valid(l1i_to_l2_buffer_2_auto_out_e_valid),
    .auto_out_e_bits_sink(l1i_to_l2_buffer_2_auto_out_e_bits_sink)
  );
  TLBuffer_13 ptw_to_l2_buffer_0 ( // @[XSTile.scala 103:46]
    .clock(ptw_to_l2_buffer_0_clock),
    .reset(ptw_to_l2_buffer_0_reset),
    .auto_in_a_ready(ptw_to_l2_buffer_0_auto_in_a_ready),
    .auto_in_a_valid(ptw_to_l2_buffer_0_auto_in_a_valid),
    .auto_in_a_bits_opcode(ptw_to_l2_buffer_0_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(ptw_to_l2_buffer_0_auto_in_a_bits_param),
    .auto_in_a_bits_size(ptw_to_l2_buffer_0_auto_in_a_bits_size),
    .auto_in_a_bits_source(ptw_to_l2_buffer_0_auto_in_a_bits_source),
    .auto_in_a_bits_address(ptw_to_l2_buffer_0_auto_in_a_bits_address),
    .auto_in_a_bits_mask(ptw_to_l2_buffer_0_auto_in_a_bits_mask),
    .auto_in_a_bits_data(ptw_to_l2_buffer_0_auto_in_a_bits_data),
    .auto_in_d_ready(ptw_to_l2_buffer_0_auto_in_d_ready),
    .auto_in_d_valid(ptw_to_l2_buffer_0_auto_in_d_valid),
    .auto_in_d_bits_opcode(ptw_to_l2_buffer_0_auto_in_d_bits_opcode),
    .auto_in_d_bits_size(ptw_to_l2_buffer_0_auto_in_d_bits_size),
    .auto_in_d_bits_source(ptw_to_l2_buffer_0_auto_in_d_bits_source),
    .auto_in_d_bits_denied(ptw_to_l2_buffer_0_auto_in_d_bits_denied),
    .auto_in_d_bits_data(ptw_to_l2_buffer_0_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(ptw_to_l2_buffer_0_auto_in_d_bits_corrupt),
    .auto_out_a_ready(ptw_to_l2_buffer_0_auto_out_a_ready),
    .auto_out_a_valid(ptw_to_l2_buffer_0_auto_out_a_valid),
    .auto_out_a_bits_opcode(ptw_to_l2_buffer_0_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(ptw_to_l2_buffer_0_auto_out_a_bits_param),
    .auto_out_a_bits_size(ptw_to_l2_buffer_0_auto_out_a_bits_size),
    .auto_out_a_bits_source(ptw_to_l2_buffer_0_auto_out_a_bits_source),
    .auto_out_a_bits_address(ptw_to_l2_buffer_0_auto_out_a_bits_address),
    .auto_out_a_bits_mask(ptw_to_l2_buffer_0_auto_out_a_bits_mask),
    .auto_out_a_bits_data(ptw_to_l2_buffer_0_auto_out_a_bits_data),
    .auto_out_d_ready(ptw_to_l2_buffer_0_auto_out_d_ready),
    .auto_out_d_valid(ptw_to_l2_buffer_0_auto_out_d_valid),
    .auto_out_d_bits_opcode(ptw_to_l2_buffer_0_auto_out_d_bits_opcode),
    .auto_out_d_bits_size(ptw_to_l2_buffer_0_auto_out_d_bits_size),
    .auto_out_d_bits_source(ptw_to_l2_buffer_0_auto_out_d_bits_source),
    .auto_out_d_bits_denied(ptw_to_l2_buffer_0_auto_out_d_bits_denied),
    .auto_out_d_bits_data(ptw_to_l2_buffer_0_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(ptw_to_l2_buffer_0_auto_out_d_bits_corrupt)
  );
  TLBuffer_13 ptw_to_l2_buffer_1 ( // @[XSTile.scala 103:46]
    .clock(ptw_to_l2_buffer_1_clock),
    .reset(ptw_to_l2_buffer_1_reset),
    .auto_in_a_ready(ptw_to_l2_buffer_1_auto_in_a_ready),
    .auto_in_a_valid(ptw_to_l2_buffer_1_auto_in_a_valid),
    .auto_in_a_bits_opcode(ptw_to_l2_buffer_1_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(ptw_to_l2_buffer_1_auto_in_a_bits_param),
    .auto_in_a_bits_size(ptw_to_l2_buffer_1_auto_in_a_bits_size),
    .auto_in_a_bits_source(ptw_to_l2_buffer_1_auto_in_a_bits_source),
    .auto_in_a_bits_address(ptw_to_l2_buffer_1_auto_in_a_bits_address),
    .auto_in_a_bits_mask(ptw_to_l2_buffer_1_auto_in_a_bits_mask),
    .auto_in_a_bits_data(ptw_to_l2_buffer_1_auto_in_a_bits_data),
    .auto_in_d_ready(ptw_to_l2_buffer_1_auto_in_d_ready),
    .auto_in_d_valid(ptw_to_l2_buffer_1_auto_in_d_valid),
    .auto_in_d_bits_opcode(ptw_to_l2_buffer_1_auto_in_d_bits_opcode),
    .auto_in_d_bits_size(ptw_to_l2_buffer_1_auto_in_d_bits_size),
    .auto_in_d_bits_source(ptw_to_l2_buffer_1_auto_in_d_bits_source),
    .auto_in_d_bits_denied(ptw_to_l2_buffer_1_auto_in_d_bits_denied),
    .auto_in_d_bits_data(ptw_to_l2_buffer_1_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(ptw_to_l2_buffer_1_auto_in_d_bits_corrupt),
    .auto_out_a_ready(ptw_to_l2_buffer_1_auto_out_a_ready),
    .auto_out_a_valid(ptw_to_l2_buffer_1_auto_out_a_valid),
    .auto_out_a_bits_opcode(ptw_to_l2_buffer_1_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(ptw_to_l2_buffer_1_auto_out_a_bits_param),
    .auto_out_a_bits_size(ptw_to_l2_buffer_1_auto_out_a_bits_size),
    .auto_out_a_bits_source(ptw_to_l2_buffer_1_auto_out_a_bits_source),
    .auto_out_a_bits_address(ptw_to_l2_buffer_1_auto_out_a_bits_address),
    .auto_out_a_bits_mask(ptw_to_l2_buffer_1_auto_out_a_bits_mask),
    .auto_out_a_bits_data(ptw_to_l2_buffer_1_auto_out_a_bits_data),
    .auto_out_d_ready(ptw_to_l2_buffer_1_auto_out_d_ready),
    .auto_out_d_valid(ptw_to_l2_buffer_1_auto_out_d_valid),
    .auto_out_d_bits_opcode(ptw_to_l2_buffer_1_auto_out_d_bits_opcode),
    .auto_out_d_bits_size(ptw_to_l2_buffer_1_auto_out_d_bits_size),
    .auto_out_d_bits_source(ptw_to_l2_buffer_1_auto_out_d_bits_source),
    .auto_out_d_bits_denied(ptw_to_l2_buffer_1_auto_out_d_bits_denied),
    .auto_out_d_bits_data(ptw_to_l2_buffer_1_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(ptw_to_l2_buffer_1_auto_out_d_bits_corrupt)
  );
  TLBuffer_13 ptw_to_l2_buffer_2 ( // @[XSTile.scala 103:46]
    .clock(ptw_to_l2_buffer_2_clock),
    .reset(ptw_to_l2_buffer_2_reset),
    .auto_in_a_ready(ptw_to_l2_buffer_2_auto_in_a_ready),
    .auto_in_a_valid(ptw_to_l2_buffer_2_auto_in_a_valid),
    .auto_in_a_bits_opcode(ptw_to_l2_buffer_2_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(ptw_to_l2_buffer_2_auto_in_a_bits_param),
    .auto_in_a_bits_size(ptw_to_l2_buffer_2_auto_in_a_bits_size),
    .auto_in_a_bits_source(ptw_to_l2_buffer_2_auto_in_a_bits_source),
    .auto_in_a_bits_address(ptw_to_l2_buffer_2_auto_in_a_bits_address),
    .auto_in_a_bits_mask(ptw_to_l2_buffer_2_auto_in_a_bits_mask),
    .auto_in_a_bits_data(ptw_to_l2_buffer_2_auto_in_a_bits_data),
    .auto_in_d_ready(ptw_to_l2_buffer_2_auto_in_d_ready),
    .auto_in_d_valid(ptw_to_l2_buffer_2_auto_in_d_valid),
    .auto_in_d_bits_opcode(ptw_to_l2_buffer_2_auto_in_d_bits_opcode),
    .auto_in_d_bits_size(ptw_to_l2_buffer_2_auto_in_d_bits_size),
    .auto_in_d_bits_source(ptw_to_l2_buffer_2_auto_in_d_bits_source),
    .auto_in_d_bits_denied(ptw_to_l2_buffer_2_auto_in_d_bits_denied),
    .auto_in_d_bits_data(ptw_to_l2_buffer_2_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(ptw_to_l2_buffer_2_auto_in_d_bits_corrupt),
    .auto_out_a_ready(ptw_to_l2_buffer_2_auto_out_a_ready),
    .auto_out_a_valid(ptw_to_l2_buffer_2_auto_out_a_valid),
    .auto_out_a_bits_opcode(ptw_to_l2_buffer_2_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(ptw_to_l2_buffer_2_auto_out_a_bits_param),
    .auto_out_a_bits_size(ptw_to_l2_buffer_2_auto_out_a_bits_size),
    .auto_out_a_bits_source(ptw_to_l2_buffer_2_auto_out_a_bits_source),
    .auto_out_a_bits_address(ptw_to_l2_buffer_2_auto_out_a_bits_address),
    .auto_out_a_bits_mask(ptw_to_l2_buffer_2_auto_out_a_bits_mask),
    .auto_out_a_bits_data(ptw_to_l2_buffer_2_auto_out_a_bits_data),
    .auto_out_d_ready(ptw_to_l2_buffer_2_auto_out_d_ready),
    .auto_out_d_valid(ptw_to_l2_buffer_2_auto_out_d_valid),
    .auto_out_d_bits_opcode(ptw_to_l2_buffer_2_auto_out_d_bits_opcode),
    .auto_out_d_bits_size(ptw_to_l2_buffer_2_auto_out_d_bits_size),
    .auto_out_d_bits_source(ptw_to_l2_buffer_2_auto_out_d_bits_source),
    .auto_out_d_bits_denied(ptw_to_l2_buffer_2_auto_out_d_bits_denied),
    .auto_out_d_bits_data(ptw_to_l2_buffer_2_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(ptw_to_l2_buffer_2_auto_out_d_bits_corrupt)
  );
  TLBuffer_13 ptw_to_l2_buffer_3 ( // @[XSTile.scala 103:46]
    .clock(ptw_to_l2_buffer_3_clock),
    .reset(ptw_to_l2_buffer_3_reset),
    .auto_in_a_ready(ptw_to_l2_buffer_3_auto_in_a_ready),
    .auto_in_a_valid(ptw_to_l2_buffer_3_auto_in_a_valid),
    .auto_in_a_bits_opcode(ptw_to_l2_buffer_3_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(ptw_to_l2_buffer_3_auto_in_a_bits_param),
    .auto_in_a_bits_size(ptw_to_l2_buffer_3_auto_in_a_bits_size),
    .auto_in_a_bits_source(ptw_to_l2_buffer_3_auto_in_a_bits_source),
    .auto_in_a_bits_address(ptw_to_l2_buffer_3_auto_in_a_bits_address),
    .auto_in_a_bits_mask(ptw_to_l2_buffer_3_auto_in_a_bits_mask),
    .auto_in_a_bits_data(ptw_to_l2_buffer_3_auto_in_a_bits_data),
    .auto_in_d_ready(ptw_to_l2_buffer_3_auto_in_d_ready),
    .auto_in_d_valid(ptw_to_l2_buffer_3_auto_in_d_valid),
    .auto_in_d_bits_opcode(ptw_to_l2_buffer_3_auto_in_d_bits_opcode),
    .auto_in_d_bits_size(ptw_to_l2_buffer_3_auto_in_d_bits_size),
    .auto_in_d_bits_source(ptw_to_l2_buffer_3_auto_in_d_bits_source),
    .auto_in_d_bits_denied(ptw_to_l2_buffer_3_auto_in_d_bits_denied),
    .auto_in_d_bits_data(ptw_to_l2_buffer_3_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(ptw_to_l2_buffer_3_auto_in_d_bits_corrupt),
    .auto_out_a_ready(ptw_to_l2_buffer_3_auto_out_a_ready),
    .auto_out_a_valid(ptw_to_l2_buffer_3_auto_out_a_valid),
    .auto_out_a_bits_opcode(ptw_to_l2_buffer_3_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(ptw_to_l2_buffer_3_auto_out_a_bits_param),
    .auto_out_a_bits_size(ptw_to_l2_buffer_3_auto_out_a_bits_size),
    .auto_out_a_bits_source(ptw_to_l2_buffer_3_auto_out_a_bits_source),
    .auto_out_a_bits_address(ptw_to_l2_buffer_3_auto_out_a_bits_address),
    .auto_out_a_bits_mask(ptw_to_l2_buffer_3_auto_out_a_bits_mask),
    .auto_out_a_bits_data(ptw_to_l2_buffer_3_auto_out_a_bits_data),
    .auto_out_d_ready(ptw_to_l2_buffer_3_auto_out_d_ready),
    .auto_out_d_valid(ptw_to_l2_buffer_3_auto_out_d_valid),
    .auto_out_d_bits_opcode(ptw_to_l2_buffer_3_auto_out_d_bits_opcode),
    .auto_out_d_bits_size(ptw_to_l2_buffer_3_auto_out_d_bits_size),
    .auto_out_d_bits_source(ptw_to_l2_buffer_3_auto_out_d_bits_source),
    .auto_out_d_bits_denied(ptw_to_l2_buffer_3_auto_out_d_bits_denied),
    .auto_out_d_bits_data(ptw_to_l2_buffer_3_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(ptw_to_l2_buffer_3_auto_out_d_bits_corrupt)
  );
  TLBuffer_13 ptw_to_l2_buffer_4 ( // @[XSTile.scala 103:46]
    .clock(ptw_to_l2_buffer_4_clock),
    .reset(ptw_to_l2_buffer_4_reset),
    .auto_in_a_ready(ptw_to_l2_buffer_4_auto_in_a_ready),
    .auto_in_a_valid(ptw_to_l2_buffer_4_auto_in_a_valid),
    .auto_in_a_bits_opcode(ptw_to_l2_buffer_4_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(ptw_to_l2_buffer_4_auto_in_a_bits_param),
    .auto_in_a_bits_size(ptw_to_l2_buffer_4_auto_in_a_bits_size),
    .auto_in_a_bits_source(ptw_to_l2_buffer_4_auto_in_a_bits_source),
    .auto_in_a_bits_address(ptw_to_l2_buffer_4_auto_in_a_bits_address),
    .auto_in_a_bits_mask(ptw_to_l2_buffer_4_auto_in_a_bits_mask),
    .auto_in_a_bits_data(ptw_to_l2_buffer_4_auto_in_a_bits_data),
    .auto_in_d_ready(ptw_to_l2_buffer_4_auto_in_d_ready),
    .auto_in_d_valid(ptw_to_l2_buffer_4_auto_in_d_valid),
    .auto_in_d_bits_opcode(ptw_to_l2_buffer_4_auto_in_d_bits_opcode),
    .auto_in_d_bits_size(ptw_to_l2_buffer_4_auto_in_d_bits_size),
    .auto_in_d_bits_source(ptw_to_l2_buffer_4_auto_in_d_bits_source),
    .auto_in_d_bits_denied(ptw_to_l2_buffer_4_auto_in_d_bits_denied),
    .auto_in_d_bits_data(ptw_to_l2_buffer_4_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(ptw_to_l2_buffer_4_auto_in_d_bits_corrupt),
    .auto_out_a_ready(ptw_to_l2_buffer_4_auto_out_a_ready),
    .auto_out_a_valid(ptw_to_l2_buffer_4_auto_out_a_valid),
    .auto_out_a_bits_opcode(ptw_to_l2_buffer_4_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(ptw_to_l2_buffer_4_auto_out_a_bits_param),
    .auto_out_a_bits_size(ptw_to_l2_buffer_4_auto_out_a_bits_size),
    .auto_out_a_bits_source(ptw_to_l2_buffer_4_auto_out_a_bits_source),
    .auto_out_a_bits_address(ptw_to_l2_buffer_4_auto_out_a_bits_address),
    .auto_out_a_bits_mask(ptw_to_l2_buffer_4_auto_out_a_bits_mask),
    .auto_out_a_bits_data(ptw_to_l2_buffer_4_auto_out_a_bits_data),
    .auto_out_d_ready(ptw_to_l2_buffer_4_auto_out_d_ready),
    .auto_out_d_valid(ptw_to_l2_buffer_4_auto_out_d_valid),
    .auto_out_d_bits_opcode(ptw_to_l2_buffer_4_auto_out_d_bits_opcode),
    .auto_out_d_bits_size(ptw_to_l2_buffer_4_auto_out_d_bits_size),
    .auto_out_d_bits_source(ptw_to_l2_buffer_4_auto_out_d_bits_source),
    .auto_out_d_bits_denied(ptw_to_l2_buffer_4_auto_out_d_bits_denied),
    .auto_out_d_bits_data(ptw_to_l2_buffer_4_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(ptw_to_l2_buffer_4_auto_out_d_bits_corrupt)
  );
  DelayN_2 core_io_reset_vector_delay ( // @[Hold.scala 97:23]
    .clock(core_io_reset_vector_delay_clock),
    .io_in(core_io_reset_vector_delay_io_in),
    .io_out(core_io_reset_vector_delay_io_out)
  );
  ResetGen resetGen ( // @[ResetGen.scala 66:32]
    .clock(resetGen_clock),
    .reset(resetGen_reset),
    .o_reset(resetGen_o_reset)
  );
  assign auto_misc_beu_int_out_0 = misc_auto_beu_int_out_0; // @[LazyModule.scala 311:12]
  assign auto_misc_memory_port_out_a_valid = misc_auto_memory_port_out_a_valid; // @[LazyModule.scala 311:12]
  assign auto_misc_memory_port_out_a_bits_opcode = misc_auto_memory_port_out_a_bits_opcode; // @[LazyModule.scala 311:12]
  assign auto_misc_memory_port_out_a_bits_param = misc_auto_memory_port_out_a_bits_param; // @[LazyModule.scala 311:12]
  assign auto_misc_memory_port_out_a_bits_size = misc_auto_memory_port_out_a_bits_size; // @[LazyModule.scala 311:12]
  assign auto_misc_memory_port_out_a_bits_source = misc_auto_memory_port_out_a_bits_source; // @[LazyModule.scala 311:12]
  assign auto_misc_memory_port_out_a_bits_address = misc_auto_memory_port_out_a_bits_address; // @[LazyModule.scala 311:12]
  assign auto_misc_memory_port_out_a_bits_user_preferCache = misc_auto_memory_port_out_a_bits_user_preferCache; // @[LazyModule.scala 311:12]
  assign auto_misc_memory_port_out_a_bits_mask = misc_auto_memory_port_out_a_bits_mask; // @[LazyModule.scala 311:12]
  assign auto_misc_memory_port_out_a_bits_data = misc_auto_memory_port_out_a_bits_data; // @[LazyModule.scala 311:12]
  assign auto_misc_memory_port_out_bready = misc_auto_memory_port_out_bready; // @[LazyModule.scala 311:12]
  assign auto_misc_memory_port_out_c_valid = misc_auto_memory_port_out_c_valid; // @[LazyModule.scala 311:12]
  assign auto_misc_memory_port_out_c_bits_opcode = misc_auto_memory_port_out_c_bits_opcode; // @[LazyModule.scala 311:12]
  assign auto_misc_memory_port_out_c_bits_param = misc_auto_memory_port_out_c_bits_param; // @[LazyModule.scala 311:12]
  assign auto_misc_memory_port_out_c_bits_size = misc_auto_memory_port_out_c_bits_size; // @[LazyModule.scala 311:12]
  assign auto_misc_memory_port_out_c_bits_source = misc_auto_memory_port_out_c_bits_source; // @[LazyModule.scala 311:12]
  assign auto_misc_memory_port_out_c_bits_address = misc_auto_memory_port_out_c_bits_address; // @[LazyModule.scala 311:12]
  assign auto_misc_memory_port_out_c_bits_echo_blockisdirty = misc_auto_memory_port_out_c_bits_echo_blockisdirty; // @[LazyModule.scala 311:12]
  assign auto_misc_memory_port_out_c_bits_data = misc_auto_memory_port_out_c_bits_data; // @[LazyModule.scala 311:12]
  assign auto_misc_memory_port_out_d_ready = misc_auto_memory_port_out_d_ready; // @[LazyModule.scala 311:12]
  assign auto_misc_memory_port_out_e_valid = misc_auto_memory_port_out_e_valid; // @[LazyModule.scala 311:12]
  assign auto_misc_memory_port_out_e_bits_sink = misc_auto_memory_port_out_e_bits_sink; // @[LazyModule.scala 311:12]
  assign auto_misc_mmio_port_out_a_valid = misc_auto_mmio_port_out_a_valid; // @[LazyModule.scala 311:12]
  assign auto_misc_mmio_port_out_a_bits_opcode = misc_auto_mmio_port_out_a_bits_opcode; // @[LazyModule.scala 311:12]
  assign auto_misc_mmio_port_out_a_bits_size = misc_auto_mmio_port_out_a_bits_size; // @[LazyModule.scala 311:12]
  assign auto_misc_mmio_port_out_a_bits_source = misc_auto_mmio_port_out_a_bits_source; // @[LazyModule.scala 311:12]
  assign auto_misc_mmio_port_out_a_bits_address = misc_auto_mmio_port_out_a_bits_address; // @[LazyModule.scala 311:12]
  assign auto_misc_mmio_port_out_a_bits_mask = misc_auto_mmio_port_out_a_bits_mask; // @[LazyModule.scala 311:12]
  assign auto_misc_mmio_port_out_a_bits_data = misc_auto_mmio_port_out_a_bits_data; // @[LazyModule.scala 311:12]
  assign auto_misc_mmio_port_out_d_ready = misc_auto_mmio_port_out_d_ready; // @[LazyModule.scala 311:12]
  assign io_cpu_halt = core_io_cpu_halt; // @[XSTile.scala 152:17]
  assign core_clock = clock;
  assign core_reset = resetGen_o_reset; // @[ResetGen.scala 61:24 67:27]
  assign core_auto_memBlock_uncache_client_out_a_ready = misc_auto_buffers_in_1_a_ready; // @[LazyModule.scala 298:16]
  assign core_auto_memBlock_uncache_client_out_d_valid = misc_auto_buffers_in_1_d_valid; // @[LazyModule.scala 298:16]
  assign core_auto_memBlock_uncache_client_out_d_bits_opcode = misc_auto_buffers_in_1_d_bits_opcode; // @[LazyModule.scala 298:16]
  assign core_auto_memBlock_uncache_client_out_d_bits_data = misc_auto_buffers_in_1_d_bits_data; // @[LazyModule.scala 298:16]
  assign core_auto_memBlock_dcache_client_out_a_ready = buffer_auto_in_a_ready; // @[LazyModule.scala 298:16]
  assign core_auto_memBlock_dcache_client_out_bvalid = buffer_auto_in_bvalid; // @[LazyModule.scala 298:16]
  assign core_auto_memBlock_dcache_client_out_bparam = buffer_auto_in_bparam; // @[LazyModule.scala 298:16]
  assign core_auto_memBlock_dcache_client_out_baddress = buffer_auto_in_baddress; // @[LazyModule.scala 298:16]
  assign core_auto_memBlock_dcache_client_out_bdata = buffer_auto_in_bdata; // @[LazyModule.scala 298:16]
  assign core_auto_memBlock_dcache_client_out_c_ready = buffer_auto_in_c_ready; // @[LazyModule.scala 298:16]
  assign core_auto_memBlock_dcache_client_out_d_valid = buffer_auto_in_d_valid; // @[LazyModule.scala 298:16]
  assign core_auto_memBlock_dcache_client_out_d_bits_opcode = buffer_auto_in_d_bits_opcode; // @[LazyModule.scala 298:16]
  assign core_auto_memBlock_dcache_client_out_d_bits_param = buffer_auto_in_d_bits_param; // @[LazyModule.scala 298:16]
  assign core_auto_memBlock_dcache_client_out_d_bits_size = buffer_auto_in_d_bits_size; // @[LazyModule.scala 298:16]
  assign core_auto_memBlock_dcache_client_out_d_bits_source = buffer_auto_in_d_bits_source; // @[LazyModule.scala 298:16]
  assign core_auto_memBlock_dcache_client_out_d_bits_sink = buffer_auto_in_d_bits_sink; // @[LazyModule.scala 298:16]
  assign core_auto_memBlock_dcache_client_out_d_bits_denied = buffer_auto_in_d_bits_denied; // @[LazyModule.scala 298:16]
  assign core_auto_memBlock_dcache_client_out_d_bits_echo_blockisdirty = buffer_auto_in_d_bits_echo_blockisdirty; // @[LazyModule.scala 298:16]
  assign core_auto_memBlock_dcache_client_out_d_bits_data = buffer_auto_in_d_bits_data; // @[LazyModule.scala 298:16]
  assign core_auto_memBlock_dcache_client_out_d_bits_corrupt = buffer_auto_in_d_bits_corrupt; // @[LazyModule.scala 298:16]
  assign core_auto_memBlock_dcache_client_out_e_ready = buffer_auto_in_e_ready; // @[LazyModule.scala 298:16]
  assign core_auto_ptw_to_l2_buffer_out_a_ready = ptw_to_l2_buffer_4_auto_in_a_ready; // @[LazyModule.scala 298:16]
  assign core_auto_ptw_to_l2_buffer_out_d_valid = ptw_to_l2_buffer_4_auto_in_d_valid; // @[LazyModule.scala 298:16]
  assign core_auto_ptw_to_l2_buffer_out_d_bits_opcode = ptw_to_l2_buffer_4_auto_in_d_bits_opcode; // @[LazyModule.scala 298:16]
  assign core_auto_ptw_to_l2_buffer_out_d_bits_size = ptw_to_l2_buffer_4_auto_in_d_bits_size; // @[LazyModule.scala 298:16]
  assign core_auto_ptw_to_l2_buffer_out_d_bits_source = ptw_to_l2_buffer_4_auto_in_d_bits_source; // @[LazyModule.scala 298:16]
  assign core_auto_ptw_to_l2_buffer_out_d_bits_denied = ptw_to_l2_buffer_4_auto_in_d_bits_denied; // @[LazyModule.scala 298:16]
  assign core_auto_ptw_to_l2_buffer_out_d_bits_data = ptw_to_l2_buffer_4_auto_in_d_bits_data; // @[LazyModule.scala 298:16]
  assign core_auto_ptw_to_l2_buffer_out_d_bits_corrupt = ptw_to_l2_buffer_4_auto_in_d_bits_corrupt; // @[LazyModule.scala 298:16]
  assign core_auto_frontend_icache_client_out_a_ready = l1i_to_l2_buffer_2_auto_in_a_ready; // @[LazyModule.scala 298:16]
  assign core_auto_frontend_icache_client_out_bvalid = l1i_to_l2_buffer_2_auto_in_bvalid; // @[LazyModule.scala 298:16]
  assign core_auto_frontend_icache_client_out_bparam = l1i_to_l2_buffer_2_auto_in_bparam; // @[LazyModule.scala 298:16]
  assign core_auto_frontend_icache_client_out_baddress = l1i_to_l2_buffer_2_auto_in_baddress; // @[LazyModule.scala 298:16]
  assign core_auto_frontend_icache_client_out_bdata = l1i_to_l2_buffer_2_auto_in_bdata; // @[LazyModule.scala 298:16]
  assign core_auto_frontend_icache_client_out_c_ready = l1i_to_l2_buffer_2_auto_in_c_ready; // @[LazyModule.scala 298:16]
  assign core_auto_frontend_icache_client_out_d_valid = l1i_to_l2_buffer_2_auto_in_d_valid; // @[LazyModule.scala 298:16]
  assign core_auto_frontend_icache_client_out_d_bits_opcode = l1i_to_l2_buffer_2_auto_in_d_bits_opcode; // @[LazyModule.scala 298:16]
  assign core_auto_frontend_icache_client_out_d_bits_param = l1i_to_l2_buffer_2_auto_in_d_bits_param; // @[LazyModule.scala 298:16]
  assign core_auto_frontend_icache_client_out_d_bits_source = l1i_to_l2_buffer_2_auto_in_d_bits_source; // @[LazyModule.scala 298:16]
  assign core_auto_frontend_icache_client_out_d_bits_sink = l1i_to_l2_buffer_2_auto_in_d_bits_sink; // @[LazyModule.scala 298:16]
  assign core_auto_frontend_icache_client_out_d_bits_echo_blockisdirty =
    l1i_to_l2_buffer_2_auto_in_d_bits_echo_blockisdirty; // @[LazyModule.scala 298:16]
  assign core_auto_frontend_icache_client_out_d_bits_data = l1i_to_l2_buffer_2_auto_in_d_bits_data; // @[LazyModule.scala 298:16]
  assign core_auto_frontend_icache_client_out_d_bits_corrupt = l1i_to_l2_buffer_2_auto_in_d_bits_corrupt; // @[LazyModule.scala 298:16]
  assign core_auto_frontend_icache_client_out_e_ready = l1i_to_l2_buffer_2_auto_in_e_ready; // @[LazyModule.scala 298:16]
  assign core_auto_frontend_instrUncache_client_out_a_ready = misc_auto_buffers_in_0_a_ready; // @[LazyModule.scala 298:16]
  assign core_auto_frontend_instrUncache_client_out_d_valid = misc_auto_buffers_in_0_d_valid; // @[LazyModule.scala 298:16]
  assign core_auto_frontend_instrUncache_client_out_d_bits_source = misc_auto_buffers_in_0_d_bits_source; // @[LazyModule.scala 298:16]
  assign core_auto_frontend_instrUncache_client_out_d_bits_data = misc_auto_buffers_in_0_d_bits_data; // @[LazyModule.scala 298:16]
  assign core_auto_plic_int_sink_in_1_0 = auto_core_plic_int_sink_in_1_0; // @[LazyModule.scala 309:16]
  assign core_auto_plic_int_sink_in_0_0 = auto_core_plic_int_sink_in_0_0; // @[LazyModule.scala 309:16]
  assign core_auto_debug_int_sink_in_0 = auto_core_debug_int_sink_in_0; // @[LazyModule.scala 309:16]
  assign core_auto_clint_int_sink_in_0 = auto_core_clint_int_sink_in_0; // @[LazyModule.scala 309:16]
  assign core_auto_clint_int_sink_in_1 = auto_core_clint_int_sink_in_1; // @[LazyModule.scala 309:16]
  assign core_io_hartId = io_hartId; // @[XSTile.scala 150:27]
  assign core_io_reset_vector = core_io_reset_vector_delay_io_out; // @[XSTile.scala 151:33]
  assign misc_clock = clock;
  assign misc_reset = resetGen_o_reset; // @[ResetGen.scala 61:24 67:27]
  assign misc_auto_buffers_in_1_a_valid = core_auto_memBlock_uncache_client_out_a_valid; // @[LazyModule.scala 298:16]
  assign misc_auto_buffers_in_1_a_bits_opcode = core_auto_memBlock_uncache_client_out_a_bits_opcode; // @[LazyModule.scala 298:16]
  assign misc_auto_buffers_in_1_a_bits_size = core_auto_memBlock_uncache_client_out_a_bits_size; // @[LazyModule.scala 298:16]
  assign misc_auto_buffers_in_1_a_bits_source = core_auto_memBlock_uncache_client_out_a_bits_source; // @[LazyModule.scala 298:16]
  assign misc_auto_buffers_in_1_a_bits_address = core_auto_memBlock_uncache_client_out_a_bits_address; // @[LazyModule.scala 298:16]
  assign misc_auto_buffers_in_1_a_bits_mask = core_auto_memBlock_uncache_client_out_a_bits_mask; // @[LazyModule.scala 298:16]
  assign misc_auto_buffers_in_1_a_bits_data = core_auto_memBlock_uncache_client_out_a_bits_data; // @[LazyModule.scala 298:16]
  assign misc_auto_buffers_in_1_d_ready = core_auto_memBlock_uncache_client_out_d_ready; // @[LazyModule.scala 298:16]
  assign misc_auto_buffers_in_0_a_valid = core_auto_frontend_instrUncache_client_out_a_valid; // @[LazyModule.scala 298:16]
  assign misc_auto_buffers_in_0_a_bits_address = core_auto_frontend_instrUncache_client_out_a_bits_address; // @[LazyModule.scala 298:16]
  assign misc_auto_buffers_in_0_d_ready = core_auto_frontend_instrUncache_client_out_d_ready; // @[LazyModule.scala 298:16]
  assign misc_auto_xbar_in_2_a_valid = ptw_to_l2_buffer_0_auto_out_a_valid; // @[LazyModule.scala 296:16]
  assign misc_auto_xbar_in_2_a_bits_opcode = ptw_to_l2_buffer_0_auto_out_a_bits_opcode; // @[LazyModule.scala 296:16]
  assign misc_auto_xbar_in_2_a_bits_param = ptw_to_l2_buffer_0_auto_out_a_bits_param; // @[LazyModule.scala 296:16]
  assign misc_auto_xbar_in_2_a_bits_size = ptw_to_l2_buffer_0_auto_out_a_bits_size; // @[LazyModule.scala 296:16]
  assign misc_auto_xbar_in_2_a_bits_source = ptw_to_l2_buffer_0_auto_out_a_bits_source; // @[LazyModule.scala 296:16]
  assign misc_auto_xbar_in_2_a_bits_address = ptw_to_l2_buffer_0_auto_out_a_bits_address; // @[LazyModule.scala 296:16]
  assign misc_auto_xbar_in_2_a_bits_mask = ptw_to_l2_buffer_0_auto_out_a_bits_mask; // @[LazyModule.scala 296:16]
  assign misc_auto_xbar_in_2_a_bits_data = ptw_to_l2_buffer_0_auto_out_a_bits_data; // @[LazyModule.scala 296:16]
  assign misc_auto_xbar_in_2_d_ready = ptw_to_l2_buffer_0_auto_out_d_ready; // @[LazyModule.scala 296:16]
  assign misc_auto_xbar_in_1_a_valid = l1i_to_l2_buffer_0_auto_out_a_valid; // @[LazyModule.scala 296:16]
  assign misc_auto_xbar_in_1_a_bits_opcode = l1i_to_l2_buffer_0_auto_out_a_bits_opcode; // @[LazyModule.scala 296:16]
  assign misc_auto_xbar_in_1_a_bits_param = l1i_to_l2_buffer_0_auto_out_a_bits_param; // @[LazyModule.scala 296:16]
  assign misc_auto_xbar_in_1_a_bits_size = l1i_to_l2_buffer_0_auto_out_a_bits_size; // @[LazyModule.scala 296:16]
  assign misc_auto_xbar_in_1_a_bits_source = l1i_to_l2_buffer_0_auto_out_a_bits_source; // @[LazyModule.scala 296:16]
  assign misc_auto_xbar_in_1_a_bits_address = l1i_to_l2_buffer_0_auto_out_a_bits_address; // @[LazyModule.scala 296:16]
  assign misc_auto_xbar_in_1_a_bits_user_preferCache = l1i_to_l2_buffer_0_auto_out_a_bits_user_preferCache; // @[LazyModule.scala 296:16]
  assign misc_auto_xbar_in_1_a_bits_mask = l1i_to_l2_buffer_0_auto_out_a_bits_mask; // @[LazyModule.scala 296:16]
  assign misc_auto_xbar_in_1_a_bits_data = l1i_to_l2_buffer_0_auto_out_a_bits_data; // @[LazyModule.scala 296:16]
  assign misc_auto_xbar_in_1_bready = l1i_to_l2_buffer_0_auto_out_bready; // @[LazyModule.scala 296:16]
  assign misc_auto_xbar_in_1_c_valid = l1i_to_l2_buffer_0_auto_out_c_valid; // @[LazyModule.scala 296:16]
  assign misc_auto_xbar_in_1_c_bits_opcode = l1i_to_l2_buffer_0_auto_out_c_bits_opcode; // @[LazyModule.scala 296:16]
  assign misc_auto_xbar_in_1_c_bits_param = l1i_to_l2_buffer_0_auto_out_c_bits_param; // @[LazyModule.scala 296:16]
  assign misc_auto_xbar_in_1_c_bits_size = l1i_to_l2_buffer_0_auto_out_c_bits_size; // @[LazyModule.scala 296:16]
  assign misc_auto_xbar_in_1_c_bits_source = l1i_to_l2_buffer_0_auto_out_c_bits_source; // @[LazyModule.scala 296:16]
  assign misc_auto_xbar_in_1_c_bits_address = l1i_to_l2_buffer_0_auto_out_c_bits_address; // @[LazyModule.scala 296:16]
  assign misc_auto_xbar_in_1_c_bits_echo_blockisdirty = l1i_to_l2_buffer_0_auto_out_c_bits_echo_blockisdirty; // @[LazyModule.scala 296:16]
  assign misc_auto_xbar_in_1_c_bits_data = l1i_to_l2_buffer_0_auto_out_c_bits_data; // @[LazyModule.scala 296:16]
  assign misc_auto_xbar_in_1_d_ready = l1i_to_l2_buffer_0_auto_out_d_ready; // @[LazyModule.scala 296:16]
  assign misc_auto_xbar_in_1_e_valid = l1i_to_l2_buffer_0_auto_out_e_valid; // @[LazyModule.scala 296:16]
  assign misc_auto_xbar_in_1_e_bits_sink = l1i_to_l2_buffer_0_auto_out_e_bits_sink; // @[LazyModule.scala 296:16]
  assign misc_auto_xbar_in_0_a_valid = buffer_auto_out_a_valid; // @[LazyModule.scala 296:16]
  assign misc_auto_xbar_in_0_a_bits_opcode = buffer_auto_out_a_bits_opcode; // @[LazyModule.scala 296:16]
  assign misc_auto_xbar_in_0_a_bits_param = buffer_auto_out_a_bits_param; // @[LazyModule.scala 296:16]
  assign misc_auto_xbar_in_0_a_bits_size = buffer_auto_out_a_bits_size; // @[LazyModule.scala 296:16]
  assign misc_auto_xbar_in_0_a_bits_source = buffer_auto_out_a_bits_source; // @[LazyModule.scala 296:16]
  assign misc_auto_xbar_in_0_a_bits_address = buffer_auto_out_a_bits_address; // @[LazyModule.scala 296:16]
  assign misc_auto_xbar_in_0_a_bits_user_preferCache = buffer_auto_out_a_bits_user_preferCache; // @[LazyModule.scala 296:16]
  assign misc_auto_xbar_in_0_a_bits_mask = buffer_auto_out_a_bits_mask; // @[LazyModule.scala 296:16]
  assign misc_auto_xbar_in_0_a_bits_data = buffer_auto_out_a_bits_data; // @[LazyModule.scala 296:16]
  assign misc_auto_xbar_in_0_bready = buffer_auto_out_bready; // @[LazyModule.scala 296:16]
  assign misc_auto_xbar_in_0_c_valid = buffer_auto_out_c_valid; // @[LazyModule.scala 296:16]
  assign misc_auto_xbar_in_0_c_bits_opcode = buffer_auto_out_c_bits_opcode; // @[LazyModule.scala 296:16]
  assign misc_auto_xbar_in_0_c_bits_param = buffer_auto_out_c_bits_param; // @[LazyModule.scala 296:16]
  assign misc_auto_xbar_in_0_c_bits_size = buffer_auto_out_c_bits_size; // @[LazyModule.scala 296:16]
  assign misc_auto_xbar_in_0_c_bits_source = buffer_auto_out_c_bits_source; // @[LazyModule.scala 296:16]
  assign misc_auto_xbar_in_0_c_bits_address = buffer_auto_out_c_bits_address; // @[LazyModule.scala 296:16]
  assign misc_auto_xbar_in_0_c_bits_echo_blockisdirty = buffer_auto_out_c_bits_echo_blockisdirty; // @[LazyModule.scala 296:16]
  assign misc_auto_xbar_in_0_c_bits_data = buffer_auto_out_c_bits_data; // @[LazyModule.scala 296:16]
  assign misc_auto_xbar_in_0_d_ready = buffer_auto_out_d_ready; // @[LazyModule.scala 296:16]
  assign misc_auto_xbar_in_0_e_valid = buffer_auto_out_e_valid; // @[LazyModule.scala 296:16]
  assign misc_auto_xbar_in_0_e_bits_sink = buffer_auto_out_e_bits_sink; // @[LazyModule.scala 296:16]
  assign misc_auto_memory_port_out_a_ready = auto_misc_memory_port_out_a_ready; // @[LazyModule.scala 311:12]
  assign misc_auto_memory_port_out_bvalid = auto_misc_memory_port_out_bvalid; // @[LazyModule.scala 311:12]
  assign misc_auto_memory_port_out_bopcode = auto_misc_memory_port_out_bopcode; // @[LazyModule.scala 311:12]
  assign misc_auto_memory_port_out_bparam = auto_misc_memory_port_out_bparam; // @[LazyModule.scala 311:12]
  assign misc_auto_memory_port_out_bsize = auto_misc_memory_port_out_bsize; // @[LazyModule.scala 311:12]
  assign misc_auto_memory_port_out_bsource = auto_misc_memory_port_out_bsource; // @[LazyModule.scala 311:12]
  assign misc_auto_memory_port_out_baddress = auto_misc_memory_port_out_baddress; // @[LazyModule.scala 311:12]
  assign misc_auto_memory_port_out_bmask = auto_misc_memory_port_out_bmask; // @[LazyModule.scala 311:12]
  assign misc_auto_memory_port_out_bdata = auto_misc_memory_port_out_bdata; // @[LazyModule.scala 311:12]
  assign misc_auto_memory_port_out_c_ready = auto_misc_memory_port_out_c_ready; // @[LazyModule.scala 311:12]
  assign misc_auto_memory_port_out_d_valid = auto_misc_memory_port_out_d_valid; // @[LazyModule.scala 311:12]
  assign misc_auto_memory_port_out_d_bits_opcode = auto_misc_memory_port_out_d_bits_opcode; // @[LazyModule.scala 311:12]
  assign misc_auto_memory_port_out_d_bits_param = auto_misc_memory_port_out_d_bits_param; // @[LazyModule.scala 311:12]
  assign misc_auto_memory_port_out_d_bits_size = auto_misc_memory_port_out_d_bits_size; // @[LazyModule.scala 311:12]
  assign misc_auto_memory_port_out_d_bits_source = auto_misc_memory_port_out_d_bits_source; // @[LazyModule.scala 311:12]
  assign misc_auto_memory_port_out_d_bits_sink = auto_misc_memory_port_out_d_bits_sink; // @[LazyModule.scala 311:12]
  assign misc_auto_memory_port_out_d_bits_denied = auto_misc_memory_port_out_d_bits_denied; // @[LazyModule.scala 311:12]
  assign misc_auto_memory_port_out_d_bits_echo_blockisdirty = auto_misc_memory_port_out_d_bits_echo_blockisdirty; // @[LazyModule.scala 311:12]
  assign misc_auto_memory_port_out_d_bits_data = auto_misc_memory_port_out_d_bits_data; // @[LazyModule.scala 311:12]
  assign misc_auto_memory_port_out_d_bits_corrupt = auto_misc_memory_port_out_d_bits_corrupt; // @[LazyModule.scala 311:12]
  assign misc_auto_memory_port_out_e_ready = auto_misc_memory_port_out_e_ready; // @[LazyModule.scala 311:12]
  assign misc_auto_mmio_port_out_a_ready = auto_misc_mmio_port_out_a_ready; // @[LazyModule.scala 311:12]
  assign misc_auto_mmio_port_out_d_valid = auto_misc_mmio_port_out_d_valid; // @[LazyModule.scala 311:12]
  assign misc_auto_mmio_port_out_d_bits_opcode = auto_misc_mmio_port_out_d_bits_opcode; // @[LazyModule.scala 311:12]
  assign misc_auto_mmio_port_out_d_bits_size = auto_misc_mmio_port_out_d_bits_size; // @[LazyModule.scala 311:12]
  assign misc_auto_mmio_port_out_d_bits_source = auto_misc_mmio_port_out_d_bits_source; // @[LazyModule.scala 311:12]
  assign misc_auto_mmio_port_out_d_bits_data = auto_misc_mmio_port_out_d_bits_data; // @[LazyModule.scala 311:12]
  assign misc_beu_errors_icache_ecc_error_valid = core_io_beu_errors_icache_ecc_error_valid; // @[XSTile.scala 160:35]
  assign misc_beu_errors_icache_ecc_error_bits = core_io_beu_errors_icache_ecc_error_bits; // @[XSTile.scala 160:35]
  assign misc_beu_errors_dcache_ecc_error_valid = core_io_beu_errors_dcache_ecc_error_valid; // @[XSTile.scala 161:35]
  assign misc_beu_errors_dcache_ecc_error_bits = core_io_beu_errors_dcache_ecc_error_bits; // @[XSTile.scala 161:35]
  assign buffer_clock = clock;
  assign buffer_reset = resetGen_o_reset; // @[ResetGen.scala 61:24 67:27]
  assign buffer_auto_in_a_valid = core_auto_memBlock_dcache_client_out_a_valid; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_a_bits_opcode = core_auto_memBlock_dcache_client_out_a_bits_opcode; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_a_bits_param = core_auto_memBlock_dcache_client_out_a_bits_param; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_a_bits_size = core_auto_memBlock_dcache_client_out_a_bits_size; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_a_bits_source = core_auto_memBlock_dcache_client_out_a_bits_source; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_a_bits_address = core_auto_memBlock_dcache_client_out_a_bits_address; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_a_bits_mask = core_auto_memBlock_dcache_client_out_a_bits_mask; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_bready = core_auto_memBlock_dcache_client_out_bready; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_c_valid = core_auto_memBlock_dcache_client_out_c_valid; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_c_bits_opcode = core_auto_memBlock_dcache_client_out_c_bits_opcode; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_c_bits_param = core_auto_memBlock_dcache_client_out_c_bits_param; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_c_bits_size = core_auto_memBlock_dcache_client_out_c_bits_size; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_c_bits_source = core_auto_memBlock_dcache_client_out_c_bits_source; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_c_bits_address = core_auto_memBlock_dcache_client_out_c_bits_address; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_c_bits_echo_blockisdirty = core_auto_memBlock_dcache_client_out_c_bits_echo_blockisdirty; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_c_bits_data = core_auto_memBlock_dcache_client_out_c_bits_data; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_d_ready = core_auto_memBlock_dcache_client_out_d_ready; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_e_valid = core_auto_memBlock_dcache_client_out_e_valid; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_e_bits_sink = core_auto_memBlock_dcache_client_out_e_bits_sink; // @[LazyModule.scala 298:16]
  assign buffer_auto_out_a_ready = misc_auto_xbar_in_0_a_ready; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_bvalid = misc_auto_xbar_in_0_bvalid; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_bopcode = misc_auto_xbar_in_0_bopcode; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_bparam = misc_auto_xbar_in_0_bparam; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_bsize = misc_auto_xbar_in_0_bsize; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_bsource = misc_auto_xbar_in_0_bsource; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_baddress = misc_auto_xbar_in_0_baddress; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_bmask = misc_auto_xbar_in_0_bmask; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_bdata = misc_auto_xbar_in_0_bdata; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_c_ready = misc_auto_xbar_in_0_c_ready; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_d_valid = misc_auto_xbar_in_0_d_valid; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_d_bits_opcode = misc_auto_xbar_in_0_d_bits_opcode; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_d_bits_param = misc_auto_xbar_in_0_d_bits_param; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_d_bits_size = misc_auto_xbar_in_0_d_bits_size; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_d_bits_source = misc_auto_xbar_in_0_d_bits_source; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_d_bits_sink = misc_auto_xbar_in_0_d_bits_sink; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_d_bits_denied = misc_auto_xbar_in_0_d_bits_denied; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_d_bits_echo_blockisdirty = misc_auto_xbar_in_0_d_bits_echo_blockisdirty; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_d_bits_data = misc_auto_xbar_in_0_d_bits_data; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_d_bits_corrupt = misc_auto_xbar_in_0_d_bits_corrupt; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_e_ready = misc_auto_xbar_in_0_e_ready; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_0_clock = clock;
  assign l1i_to_l2_buffer_0_reset = resetGen_o_reset; // @[ResetGen.scala 61:24 67:27]
  assign l1i_to_l2_buffer_0_auto_in_a_valid = l1i_to_l2_buffer_1_auto_out_a_valid; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_0_auto_in_a_bits_opcode = l1i_to_l2_buffer_1_auto_out_a_bits_opcode; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_0_auto_in_a_bits_param = l1i_to_l2_buffer_1_auto_out_a_bits_param; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_0_auto_in_a_bits_size = l1i_to_l2_buffer_1_auto_out_a_bits_size; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_0_auto_in_a_bits_source = l1i_to_l2_buffer_1_auto_out_a_bits_source; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_0_auto_in_a_bits_address = l1i_to_l2_buffer_1_auto_out_a_bits_address; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_0_auto_in_a_bits_user_preferCache = l1i_to_l2_buffer_1_auto_out_a_bits_user_preferCache; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_0_auto_in_a_bits_mask = l1i_to_l2_buffer_1_auto_out_a_bits_mask; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_0_auto_in_a_bits_data = l1i_to_l2_buffer_1_auto_out_a_bits_data; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_0_auto_in_bready = l1i_to_l2_buffer_1_auto_out_bready; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_0_auto_in_c_valid = l1i_to_l2_buffer_1_auto_out_c_valid; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_0_auto_in_c_bits_opcode = l1i_to_l2_buffer_1_auto_out_c_bits_opcode; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_0_auto_in_c_bits_param = l1i_to_l2_buffer_1_auto_out_c_bits_param; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_0_auto_in_c_bits_size = l1i_to_l2_buffer_1_auto_out_c_bits_size; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_0_auto_in_c_bits_source = l1i_to_l2_buffer_1_auto_out_c_bits_source; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_0_auto_in_c_bits_address = l1i_to_l2_buffer_1_auto_out_c_bits_address; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_0_auto_in_c_bits_echo_blockisdirty = l1i_to_l2_buffer_1_auto_out_c_bits_echo_blockisdirty; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_0_auto_in_c_bits_data = l1i_to_l2_buffer_1_auto_out_c_bits_data; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_0_auto_in_d_ready = l1i_to_l2_buffer_1_auto_out_d_ready; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_0_auto_in_e_valid = l1i_to_l2_buffer_1_auto_out_e_valid; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_0_auto_in_e_bits_sink = l1i_to_l2_buffer_1_auto_out_e_bits_sink; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_0_auto_out_a_ready = misc_auto_xbar_in_1_a_ready; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_0_auto_out_bvalid = misc_auto_xbar_in_1_bvalid; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_0_auto_out_bparam = misc_auto_xbar_in_1_bparam; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_0_auto_out_baddress = misc_auto_xbar_in_1_baddress; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_0_auto_out_bdata = misc_auto_xbar_in_1_bdata; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_0_auto_out_c_ready = misc_auto_xbar_in_1_c_ready; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_0_auto_out_d_valid = misc_auto_xbar_in_1_d_valid; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_0_auto_out_d_bits_opcode = misc_auto_xbar_in_1_d_bits_opcode; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_0_auto_out_d_bits_param = misc_auto_xbar_in_1_d_bits_param; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_0_auto_out_d_bits_source = misc_auto_xbar_in_1_d_bits_source; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_0_auto_out_d_bits_sink = misc_auto_xbar_in_1_d_bits_sink; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_0_auto_out_d_bits_echo_blockisdirty = misc_auto_xbar_in_1_d_bits_echo_blockisdirty; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_0_auto_out_d_bits_data = misc_auto_xbar_in_1_d_bits_data; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_0_auto_out_d_bits_corrupt = misc_auto_xbar_in_1_d_bits_corrupt; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_0_auto_out_e_ready = misc_auto_xbar_in_1_e_ready; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_1_clock = clock;
  assign l1i_to_l2_buffer_1_reset = resetGen_o_reset; // @[ResetGen.scala 61:24 67:27]
  assign l1i_to_l2_buffer_1_auto_in_a_valid = l1i_to_l2_buffer_2_auto_out_a_valid; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_1_auto_in_a_bits_opcode = l1i_to_l2_buffer_2_auto_out_a_bits_opcode; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_1_auto_in_a_bits_param = l1i_to_l2_buffer_2_auto_out_a_bits_param; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_1_auto_in_a_bits_size = l1i_to_l2_buffer_2_auto_out_a_bits_size; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_1_auto_in_a_bits_source = l1i_to_l2_buffer_2_auto_out_a_bits_source; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_1_auto_in_a_bits_address = l1i_to_l2_buffer_2_auto_out_a_bits_address; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_1_auto_in_a_bits_user_preferCache = l1i_to_l2_buffer_2_auto_out_a_bits_user_preferCache; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_1_auto_in_a_bits_mask = l1i_to_l2_buffer_2_auto_out_a_bits_mask; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_1_auto_in_a_bits_data = l1i_to_l2_buffer_2_auto_out_a_bits_data; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_1_auto_in_bready = l1i_to_l2_buffer_2_auto_out_bready; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_1_auto_in_c_valid = l1i_to_l2_buffer_2_auto_out_c_valid; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_1_auto_in_c_bits_opcode = l1i_to_l2_buffer_2_auto_out_c_bits_opcode; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_1_auto_in_c_bits_param = l1i_to_l2_buffer_2_auto_out_c_bits_param; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_1_auto_in_c_bits_size = l1i_to_l2_buffer_2_auto_out_c_bits_size; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_1_auto_in_c_bits_source = l1i_to_l2_buffer_2_auto_out_c_bits_source; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_1_auto_in_c_bits_address = l1i_to_l2_buffer_2_auto_out_c_bits_address; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_1_auto_in_c_bits_echo_blockisdirty = l1i_to_l2_buffer_2_auto_out_c_bits_echo_blockisdirty; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_1_auto_in_c_bits_data = l1i_to_l2_buffer_2_auto_out_c_bits_data; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_1_auto_in_d_ready = l1i_to_l2_buffer_2_auto_out_d_ready; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_1_auto_in_e_valid = l1i_to_l2_buffer_2_auto_out_e_valid; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_1_auto_in_e_bits_sink = l1i_to_l2_buffer_2_auto_out_e_bits_sink; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_1_auto_out_a_ready = l1i_to_l2_buffer_0_auto_in_a_ready; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_1_auto_out_bvalid = l1i_to_l2_buffer_0_auto_in_bvalid; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_1_auto_out_bparam = l1i_to_l2_buffer_0_auto_in_bparam; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_1_auto_out_baddress = l1i_to_l2_buffer_0_auto_in_baddress; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_1_auto_out_bdata = l1i_to_l2_buffer_0_auto_in_bdata; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_1_auto_out_c_ready = l1i_to_l2_buffer_0_auto_in_c_ready; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_1_auto_out_d_valid = l1i_to_l2_buffer_0_auto_in_d_valid; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_1_auto_out_d_bits_opcode = l1i_to_l2_buffer_0_auto_in_d_bits_opcode; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_1_auto_out_d_bits_param = l1i_to_l2_buffer_0_auto_in_d_bits_param; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_1_auto_out_d_bits_source = l1i_to_l2_buffer_0_auto_in_d_bits_source; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_1_auto_out_d_bits_sink = l1i_to_l2_buffer_0_auto_in_d_bits_sink; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_1_auto_out_d_bits_echo_blockisdirty = l1i_to_l2_buffer_0_auto_in_d_bits_echo_blockisdirty; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_1_auto_out_d_bits_data = l1i_to_l2_buffer_0_auto_in_d_bits_data; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_1_auto_out_d_bits_corrupt = l1i_to_l2_buffer_0_auto_in_d_bits_corrupt; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_1_auto_out_e_ready = l1i_to_l2_buffer_0_auto_in_e_ready; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_2_clock = clock;
  assign l1i_to_l2_buffer_2_reset = resetGen_o_reset; // @[ResetGen.scala 61:24 67:27]
  assign l1i_to_l2_buffer_2_auto_in_a_valid = core_auto_frontend_icache_client_out_a_valid; // @[LazyModule.scala 298:16]
  assign l1i_to_l2_buffer_2_auto_in_a_bits_opcode = core_auto_frontend_icache_client_out_a_bits_opcode; // @[LazyModule.scala 298:16]
  assign l1i_to_l2_buffer_2_auto_in_a_bits_param = 3'h0; // @[LazyModule.scala 298:16]
  assign l1i_to_l2_buffer_2_auto_in_a_bits_size = core_auto_frontend_icache_client_out_a_bits_size; // @[LazyModule.scala 298:16]
  assign l1i_to_l2_buffer_2_auto_in_a_bits_source = core_auto_frontend_icache_client_out_a_bits_source; // @[LazyModule.scala 298:16]
  assign l1i_to_l2_buffer_2_auto_in_a_bits_address = core_auto_frontend_icache_client_out_a_bits_address; // @[LazyModule.scala 298:16]
  assign l1i_to_l2_buffer_2_auto_in_a_bits_user_preferCache = 1'h0; // @[LazyModule.scala 298:16]
  assign l1i_to_l2_buffer_2_auto_in_a_bits_mask = core_auto_frontend_icache_client_out_a_bits_mask; // @[LazyModule.scala 298:16]
  assign l1i_to_l2_buffer_2_auto_in_a_bits_data = 256'h0; // @[LazyModule.scala 298:16]
  assign l1i_to_l2_buffer_2_auto_in_bready = core_auto_frontend_icache_client_out_bready; // @[LazyModule.scala 298:16]
  assign l1i_to_l2_buffer_2_auto_in_c_valid = core_auto_frontend_icache_client_out_c_valid; // @[LazyModule.scala 298:16]
  assign l1i_to_l2_buffer_2_auto_in_c_bits_opcode = core_auto_frontend_icache_client_out_c_bits_opcode; // @[LazyModule.scala 298:16]
  assign l1i_to_l2_buffer_2_auto_in_c_bits_param = core_auto_frontend_icache_client_out_c_bits_param; // @[LazyModule.scala 298:16]
  assign l1i_to_l2_buffer_2_auto_in_c_bits_size = 3'h6; // @[LazyModule.scala 298:16]
  assign l1i_to_l2_buffer_2_auto_in_c_bits_source = 2'h0; // @[LazyModule.scala 298:16]
  assign l1i_to_l2_buffer_2_auto_in_c_bits_address = core_auto_frontend_icache_client_out_c_bits_address; // @[LazyModule.scala 298:16]
  assign l1i_to_l2_buffer_2_auto_in_c_bits_echo_blockisdirty =
    core_auto_frontend_icache_client_out_c_bits_echo_blockisdirty; // @[LazyModule.scala 298:16]
  assign l1i_to_l2_buffer_2_auto_in_c_bits_data = core_auto_frontend_icache_client_out_c_bits_data; // @[LazyModule.scala 298:16]
  assign l1i_to_l2_buffer_2_auto_in_d_ready = core_auto_frontend_icache_client_out_d_ready; // @[LazyModule.scala 298:16]
  assign l1i_to_l2_buffer_2_auto_in_e_valid = core_auto_frontend_icache_client_out_e_valid; // @[LazyModule.scala 298:16]
  assign l1i_to_l2_buffer_2_auto_in_e_bits_sink = core_auto_frontend_icache_client_out_e_bits_sink; // @[LazyModule.scala 298:16]
  assign l1i_to_l2_buffer_2_auto_out_a_ready = l1i_to_l2_buffer_1_auto_in_a_ready; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_2_auto_out_bvalid = l1i_to_l2_buffer_1_auto_in_bvalid; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_2_auto_out_bparam = l1i_to_l2_buffer_1_auto_in_bparam; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_2_auto_out_baddress = l1i_to_l2_buffer_1_auto_in_baddress; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_2_auto_out_bdata = l1i_to_l2_buffer_1_auto_in_bdata; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_2_auto_out_c_ready = l1i_to_l2_buffer_1_auto_in_c_ready; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_2_auto_out_d_valid = l1i_to_l2_buffer_1_auto_in_d_valid; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_2_auto_out_d_bits_opcode = l1i_to_l2_buffer_1_auto_in_d_bits_opcode; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_2_auto_out_d_bits_param = l1i_to_l2_buffer_1_auto_in_d_bits_param; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_2_auto_out_d_bits_source = l1i_to_l2_buffer_1_auto_in_d_bits_source; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_2_auto_out_d_bits_sink = l1i_to_l2_buffer_1_auto_in_d_bits_sink; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_2_auto_out_d_bits_echo_blockisdirty = l1i_to_l2_buffer_1_auto_in_d_bits_echo_blockisdirty; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_2_auto_out_d_bits_data = l1i_to_l2_buffer_1_auto_in_d_bits_data; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_2_auto_out_d_bits_corrupt = l1i_to_l2_buffer_1_auto_in_d_bits_corrupt; // @[LazyModule.scala 296:16]
  assign l1i_to_l2_buffer_2_auto_out_e_ready = l1i_to_l2_buffer_1_auto_in_e_ready; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_0_clock = clock;
  assign ptw_to_l2_buffer_0_reset = resetGen_o_reset; // @[ResetGen.scala 61:24 67:27]
  assign ptw_to_l2_buffer_0_auto_in_a_valid = ptw_to_l2_buffer_1_auto_out_a_valid; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_0_auto_in_a_bits_opcode = ptw_to_l2_buffer_1_auto_out_a_bits_opcode; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_0_auto_in_a_bits_param = ptw_to_l2_buffer_1_auto_out_a_bits_param; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_0_auto_in_a_bits_size = ptw_to_l2_buffer_1_auto_out_a_bits_size; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_0_auto_in_a_bits_source = ptw_to_l2_buffer_1_auto_out_a_bits_source; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_0_auto_in_a_bits_address = ptw_to_l2_buffer_1_auto_out_a_bits_address; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_0_auto_in_a_bits_mask = ptw_to_l2_buffer_1_auto_out_a_bits_mask; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_0_auto_in_a_bits_data = ptw_to_l2_buffer_1_auto_out_a_bits_data; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_0_auto_in_d_ready = ptw_to_l2_buffer_1_auto_out_d_ready; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_0_auto_out_a_ready = misc_auto_xbar_in_2_a_ready; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_0_auto_out_d_valid = misc_auto_xbar_in_2_d_valid; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_0_auto_out_d_bits_opcode = misc_auto_xbar_in_2_d_bits_opcode; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_0_auto_out_d_bits_size = misc_auto_xbar_in_2_d_bits_size; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_0_auto_out_d_bits_source = misc_auto_xbar_in_2_d_bits_source; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_0_auto_out_d_bits_denied = misc_auto_xbar_in_2_d_bits_denied; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_0_auto_out_d_bits_data = misc_auto_xbar_in_2_d_bits_data; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_0_auto_out_d_bits_corrupt = misc_auto_xbar_in_2_d_bits_corrupt; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_1_clock = clock;
  assign ptw_to_l2_buffer_1_reset = resetGen_o_reset; // @[ResetGen.scala 61:24 67:27]
  assign ptw_to_l2_buffer_1_auto_in_a_valid = ptw_to_l2_buffer_2_auto_out_a_valid; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_1_auto_in_a_bits_opcode = ptw_to_l2_buffer_2_auto_out_a_bits_opcode; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_1_auto_in_a_bits_param = ptw_to_l2_buffer_2_auto_out_a_bits_param; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_1_auto_in_a_bits_size = ptw_to_l2_buffer_2_auto_out_a_bits_size; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_1_auto_in_a_bits_source = ptw_to_l2_buffer_2_auto_out_a_bits_source; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_1_auto_in_a_bits_address = ptw_to_l2_buffer_2_auto_out_a_bits_address; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_1_auto_in_a_bits_mask = ptw_to_l2_buffer_2_auto_out_a_bits_mask; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_1_auto_in_a_bits_data = ptw_to_l2_buffer_2_auto_out_a_bits_data; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_1_auto_in_d_ready = ptw_to_l2_buffer_2_auto_out_d_ready; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_1_auto_out_a_ready = ptw_to_l2_buffer_0_auto_in_a_ready; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_1_auto_out_d_valid = ptw_to_l2_buffer_0_auto_in_d_valid; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_1_auto_out_d_bits_opcode = ptw_to_l2_buffer_0_auto_in_d_bits_opcode; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_1_auto_out_d_bits_size = ptw_to_l2_buffer_0_auto_in_d_bits_size; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_1_auto_out_d_bits_source = ptw_to_l2_buffer_0_auto_in_d_bits_source; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_1_auto_out_d_bits_denied = ptw_to_l2_buffer_0_auto_in_d_bits_denied; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_1_auto_out_d_bits_data = ptw_to_l2_buffer_0_auto_in_d_bits_data; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_1_auto_out_d_bits_corrupt = ptw_to_l2_buffer_0_auto_in_d_bits_corrupt; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_2_clock = clock;
  assign ptw_to_l2_buffer_2_reset = resetGen_o_reset; // @[ResetGen.scala 61:24 67:27]
  assign ptw_to_l2_buffer_2_auto_in_a_valid = ptw_to_l2_buffer_3_auto_out_a_valid; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_2_auto_in_a_bits_opcode = ptw_to_l2_buffer_3_auto_out_a_bits_opcode; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_2_auto_in_a_bits_param = ptw_to_l2_buffer_3_auto_out_a_bits_param; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_2_auto_in_a_bits_size = ptw_to_l2_buffer_3_auto_out_a_bits_size; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_2_auto_in_a_bits_source = ptw_to_l2_buffer_3_auto_out_a_bits_source; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_2_auto_in_a_bits_address = ptw_to_l2_buffer_3_auto_out_a_bits_address; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_2_auto_in_a_bits_mask = ptw_to_l2_buffer_3_auto_out_a_bits_mask; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_2_auto_in_a_bits_data = ptw_to_l2_buffer_3_auto_out_a_bits_data; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_2_auto_in_d_ready = ptw_to_l2_buffer_3_auto_out_d_ready; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_2_auto_out_a_ready = ptw_to_l2_buffer_1_auto_in_a_ready; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_2_auto_out_d_valid = ptw_to_l2_buffer_1_auto_in_d_valid; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_2_auto_out_d_bits_opcode = ptw_to_l2_buffer_1_auto_in_d_bits_opcode; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_2_auto_out_d_bits_size = ptw_to_l2_buffer_1_auto_in_d_bits_size; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_2_auto_out_d_bits_source = ptw_to_l2_buffer_1_auto_in_d_bits_source; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_2_auto_out_d_bits_denied = ptw_to_l2_buffer_1_auto_in_d_bits_denied; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_2_auto_out_d_bits_data = ptw_to_l2_buffer_1_auto_in_d_bits_data; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_2_auto_out_d_bits_corrupt = ptw_to_l2_buffer_1_auto_in_d_bits_corrupt; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_3_clock = clock;
  assign ptw_to_l2_buffer_3_reset = resetGen_o_reset; // @[ResetGen.scala 61:24 67:27]
  assign ptw_to_l2_buffer_3_auto_in_a_valid = ptw_to_l2_buffer_4_auto_out_a_valid; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_3_auto_in_a_bits_opcode = ptw_to_l2_buffer_4_auto_out_a_bits_opcode; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_3_auto_in_a_bits_param = ptw_to_l2_buffer_4_auto_out_a_bits_param; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_3_auto_in_a_bits_size = ptw_to_l2_buffer_4_auto_out_a_bits_size; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_3_auto_in_a_bits_source = ptw_to_l2_buffer_4_auto_out_a_bits_source; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_3_auto_in_a_bits_address = ptw_to_l2_buffer_4_auto_out_a_bits_address; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_3_auto_in_a_bits_mask = ptw_to_l2_buffer_4_auto_out_a_bits_mask; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_3_auto_in_a_bits_data = ptw_to_l2_buffer_4_auto_out_a_bits_data; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_3_auto_in_d_ready = ptw_to_l2_buffer_4_auto_out_d_ready; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_3_auto_out_a_ready = ptw_to_l2_buffer_2_auto_in_a_ready; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_3_auto_out_d_valid = ptw_to_l2_buffer_2_auto_in_d_valid; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_3_auto_out_d_bits_opcode = ptw_to_l2_buffer_2_auto_in_d_bits_opcode; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_3_auto_out_d_bits_size = ptw_to_l2_buffer_2_auto_in_d_bits_size; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_3_auto_out_d_bits_source = ptw_to_l2_buffer_2_auto_in_d_bits_source; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_3_auto_out_d_bits_denied = ptw_to_l2_buffer_2_auto_in_d_bits_denied; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_3_auto_out_d_bits_data = ptw_to_l2_buffer_2_auto_in_d_bits_data; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_3_auto_out_d_bits_corrupt = ptw_to_l2_buffer_2_auto_in_d_bits_corrupt; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_4_clock = clock;
  assign ptw_to_l2_buffer_4_reset = resetGen_o_reset; // @[ResetGen.scala 61:24 67:27]
  assign ptw_to_l2_buffer_4_auto_in_a_valid = core_auto_ptw_to_l2_buffer_out_a_valid; // @[LazyModule.scala 298:16]
  assign ptw_to_l2_buffer_4_auto_in_a_bits_opcode = core_auto_ptw_to_l2_buffer_out_a_bits_opcode; // @[LazyModule.scala 298:16]
  assign ptw_to_l2_buffer_4_auto_in_a_bits_param = core_auto_ptw_to_l2_buffer_out_a_bits_param; // @[LazyModule.scala 298:16]
  assign ptw_to_l2_buffer_4_auto_in_a_bits_size = core_auto_ptw_to_l2_buffer_out_a_bits_size; // @[LazyModule.scala 298:16]
  assign ptw_to_l2_buffer_4_auto_in_a_bits_source = core_auto_ptw_to_l2_buffer_out_a_bits_source; // @[LazyModule.scala 298:16]
  assign ptw_to_l2_buffer_4_auto_in_a_bits_address = core_auto_ptw_to_l2_buffer_out_a_bits_address; // @[LazyModule.scala 298:16]
  assign ptw_to_l2_buffer_4_auto_in_a_bits_mask = core_auto_ptw_to_l2_buffer_out_a_bits_mask; // @[LazyModule.scala 298:16]
  assign ptw_to_l2_buffer_4_auto_in_a_bits_data = core_auto_ptw_to_l2_buffer_out_a_bits_data; // @[LazyModule.scala 298:16]
  assign ptw_to_l2_buffer_4_auto_in_d_ready = core_auto_ptw_to_l2_buffer_out_d_ready; // @[LazyModule.scala 298:16]
  assign ptw_to_l2_buffer_4_auto_out_a_ready = ptw_to_l2_buffer_3_auto_in_a_ready; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_4_auto_out_d_valid = ptw_to_l2_buffer_3_auto_in_d_valid; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_4_auto_out_d_bits_opcode = ptw_to_l2_buffer_3_auto_in_d_bits_opcode; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_4_auto_out_d_bits_size = ptw_to_l2_buffer_3_auto_in_d_bits_size; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_4_auto_out_d_bits_source = ptw_to_l2_buffer_3_auto_in_d_bits_source; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_4_auto_out_d_bits_denied = ptw_to_l2_buffer_3_auto_in_d_bits_denied; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_4_auto_out_d_bits_data = ptw_to_l2_buffer_3_auto_in_d_bits_data; // @[LazyModule.scala 296:16]
  assign ptw_to_l2_buffer_4_auto_out_d_bits_corrupt = ptw_to_l2_buffer_3_auto_in_d_bits_corrupt; // @[LazyModule.scala 296:16]
  assign core_io_reset_vector_delay_clock = clock;
  assign core_io_reset_vector_delay_io_in = io_reset_vector; // @[Hold.scala 98:17]
  assign resetGen_clock = clock;
  assign resetGen_reset = reset; // @[ResetGen.scala 61:24 62:24]
endmodule

