module bosc_XSCore(
  input          clock,
  input          reset,
  input          auto_memBlock_uncache_client_out_a_ready,
  output         auto_memBlock_uncache_client_out_a_valid,
  output [2:0]   auto_memBlock_uncache_client_out_a_bits_opcode,
  output [2:0]   auto_memBlock_uncache_client_out_a_bits_size,
  output [1:0]   auto_memBlock_uncache_client_out_a_bits_source,
  output [35:0]  auto_memBlock_uncache_client_out_a_bits_address,
  output [7:0]   auto_memBlock_uncache_client_out_a_bits_mask,
  output [63:0]  auto_memBlock_uncache_client_out_a_bits_data,
  output         auto_memBlock_uncache_client_out_d_ready,
  input          auto_memBlock_uncache_client_out_d_valid,
  input  [2:0]   auto_memBlock_uncache_client_out_d_bits_opcode,
  input  [63:0]  auto_memBlock_uncache_client_out_d_bits_data,
  input          auto_memBlock_dcache_client_out_a_ready,
  output         auto_memBlock_dcache_client_out_a_valid,
  output [2:0]   auto_memBlock_dcache_client_out_a_bits_opcode,
  output [2:0]   auto_memBlock_dcache_client_out_a_bits_param,
  output [2:0]   auto_memBlock_dcache_client_out_a_bits_size,
  output [3:0]   auto_memBlock_dcache_client_out_a_bits_source,
  output [35:0]  auto_memBlock_dcache_client_out_a_bits_address,
  output [31:0]  auto_memBlock_dcache_client_out_a_bits_mask,
  output         auto_memBlock_dcache_client_out_bready,
  input          auto_memBlock_dcache_client_out_bvalid,
  input  [1:0]   auto_memBlock_dcache_client_out_bparam,
  input  [35:0]  auto_memBlock_dcache_client_out_baddress,
  input  [255:0] auto_memBlock_dcache_client_out_bdata,
  input          auto_memBlock_dcache_client_out_c_ready,
  output         auto_memBlock_dcache_client_out_c_valid,
  output [2:0]   auto_memBlock_dcache_client_out_c_bits_opcode,
  output [2:0]   auto_memBlock_dcache_client_out_c_bits_param,
  output [2:0]   auto_memBlock_dcache_client_out_c_bits_size,
  output [3:0]   auto_memBlock_dcache_client_out_c_bits_source,
  output [35:0]  auto_memBlock_dcache_client_out_c_bits_address,
  output         auto_memBlock_dcache_client_out_c_bits_echo_blockisdirty,
  output [255:0] auto_memBlock_dcache_client_out_c_bits_data,
  output         auto_memBlock_dcache_client_out_d_ready,
  input          auto_memBlock_dcache_client_out_d_valid,
  input  [2:0]   auto_memBlock_dcache_client_out_d_bits_opcode,
  input  [1:0]   auto_memBlock_dcache_client_out_d_bits_param,
  input  [2:0]   auto_memBlock_dcache_client_out_d_bits_size,
  input  [3:0]   auto_memBlock_dcache_client_out_d_bits_source,
  input  [3:0]   auto_memBlock_dcache_client_out_d_bits_sink,
  input          auto_memBlock_dcache_client_out_d_bits_denied,
  input          auto_memBlock_dcache_client_out_d_bits_echo_blockisdirty,
  input  [255:0] auto_memBlock_dcache_client_out_d_bits_data,
  input          auto_memBlock_dcache_client_out_d_bits_corrupt,
  input          auto_memBlock_dcache_client_out_e_ready,
  output         auto_memBlock_dcache_client_out_e_valid,
  output [3:0]   auto_memBlock_dcache_client_out_e_bits_sink,
  input          auto_ptw_to_l2_buffer_out_a_ready,
  output         auto_ptw_to_l2_buffer_out_a_valid,
  output [2:0]   auto_ptw_to_l2_buffer_out_a_bits_opcode,
  output [2:0]   auto_ptw_to_l2_buffer_out_a_bits_param,
  output [2:0]   auto_ptw_to_l2_buffer_out_a_bits_size,
  output [2:0]   auto_ptw_to_l2_buffer_out_a_bits_source,
  output [35:0]  auto_ptw_to_l2_buffer_out_a_bits_address,
  output [31:0]  auto_ptw_to_l2_buffer_out_a_bits_mask,
  output [255:0] auto_ptw_to_l2_buffer_out_a_bits_data,
  output         auto_ptw_to_l2_buffer_out_d_ready,
  input          auto_ptw_to_l2_buffer_out_d_valid,
  input  [2:0]   auto_ptw_to_l2_buffer_out_d_bits_opcode,
  input  [2:0]   auto_ptw_to_l2_buffer_out_d_bits_size,
  input  [2:0]   auto_ptw_to_l2_buffer_out_d_bits_source,
  input          auto_ptw_to_l2_buffer_out_d_bits_denied,
  input  [255:0] auto_ptw_to_l2_buffer_out_d_bits_data,
  input          auto_ptw_to_l2_buffer_out_d_bits_corrupt,
  input          auto_frontend_icache_client_out_a_ready,
  output         auto_frontend_icache_client_out_a_valid,
  output [2:0]   auto_frontend_icache_client_out_a_bits_opcode,
  output [2:0]   auto_frontend_icache_client_out_a_bits_size,
  output [1:0]   auto_frontend_icache_client_out_a_bits_source,
  output [35:0]  auto_frontend_icache_client_out_a_bits_address,
  output [31:0]  auto_frontend_icache_client_out_a_bits_mask,
  output         auto_frontend_icache_client_out_bready,
  input          auto_frontend_icache_client_out_bvalid,
  input  [1:0]   auto_frontend_icache_client_out_bparam,
  input  [35:0]  auto_frontend_icache_client_out_baddress,
  input  [255:0] auto_frontend_icache_client_out_bdata,
  input          auto_frontend_icache_client_out_c_ready,
  output         auto_frontend_icache_client_out_c_valid,
  output [2:0]   auto_frontend_icache_client_out_c_bits_opcode,
  output [2:0]   auto_frontend_icache_client_out_c_bits_param,
  output [35:0]  auto_frontend_icache_client_out_c_bits_address,
  output         auto_frontend_icache_client_out_c_bits_echo_blockisdirty,
  output [255:0] auto_frontend_icache_client_out_c_bits_data,
  output         auto_frontend_icache_client_out_d_ready,
  input          auto_frontend_icache_client_out_d_valid,
  input  [2:0]   auto_frontend_icache_client_out_d_bits_opcode,
  input  [1:0]   auto_frontend_icache_client_out_d_bits_param,
  input  [1:0]   auto_frontend_icache_client_out_d_bits_source,
  input  [3:0]   auto_frontend_icache_client_out_d_bits_sink,
  input          auto_frontend_icache_client_out_d_bits_echo_blockisdirty,
  input  [255:0] auto_frontend_icache_client_out_d_bits_data,
  input          auto_frontend_icache_client_out_d_bits_corrupt,
  input          auto_frontend_icache_client_out_e_ready,
  output         auto_frontend_icache_client_out_e_valid,
  output [3:0]   auto_frontend_icache_client_out_e_bits_sink,
  input          auto_frontend_instrUncache_client_out_a_ready,
  output         auto_frontend_instrUncache_client_out_a_valid,
  output [35:0]  auto_frontend_instrUncache_client_out_a_bits_address,
  output         auto_frontend_instrUncache_client_out_d_ready,
  input          auto_frontend_instrUncache_client_out_d_valid,
  input          auto_frontend_instrUncache_client_out_d_bits_source,
  input  [63:0]  auto_frontend_instrUncache_client_out_d_bits_data,
  input          auto_plic_int_sink_in_1_0,
  input          auto_plic_int_sink_in_0_0,
  input          auto_debug_int_sink_in_0,
  input          auto_clint_int_sink_in_0,
  input          auto_clint_int_sink_in_1,
  input  [63:0]  io_hartId,
  input  [35:0]  io_reset_vector,
  output         io_cpu_halt,
  output         io_beu_errors_icache_ecc_error_valid,
  output [35:0]  io_beu_errors_icache_ecc_error_bits,
  output         io_beu_errors_dcache_ecc_error_valid,
  output [35:0]  io_beu_errors_dcache_ecc_error_bits
);
  wire  frontend_clock; // @[XSCore.scala 140:28]
  wire  frontend_reset; // @[XSCore.scala 140:28]
  wire  frontend_auto_icache_client_out_a_ready; // @[XSCore.scala 140:28]
  wire  frontend_auto_icache_client_out_a_valid; // @[XSCore.scala 140:28]
  wire [2:0] frontend_auto_icache_client_out_a_bits_opcode; // @[XSCore.scala 140:28]
  wire [2:0] frontend_auto_icache_client_out_a_bits_size; // @[XSCore.scala 140:28]
  wire [1:0] frontend_auto_icache_client_out_a_bits_source; // @[XSCore.scala 140:28]
  wire [35:0] frontend_auto_icache_client_out_a_bits_address; // @[XSCore.scala 140:28]
  wire [31:0] frontend_auto_icache_client_out_a_bits_mask; // @[XSCore.scala 140:28]
  wire  frontend_auto_icache_client_out_bready; // @[XSCore.scala 140:28]
  wire  frontend_auto_icache_client_out_bvalid; // @[XSCore.scala 140:28]
  wire [1:0] frontend_auto_icache_client_out_bparam; // @[XSCore.scala 140:28]
  wire [35:0] frontend_auto_icache_client_out_baddress; // @[XSCore.scala 140:28]
  wire [255:0] frontend_auto_icache_client_out_bdata; // @[XSCore.scala 140:28]
  wire  frontend_auto_icache_client_out_c_ready; // @[XSCore.scala 140:28]
  wire  frontend_auto_icache_client_out_c_valid; // @[XSCore.scala 140:28]
  wire [2:0] frontend_auto_icache_client_out_c_bits_opcode; // @[XSCore.scala 140:28]
  wire [2:0] frontend_auto_icache_client_out_c_bits_param; // @[XSCore.scala 140:28]
  wire [35:0] frontend_auto_icache_client_out_c_bits_address; // @[XSCore.scala 140:28]
  wire  frontend_auto_icache_client_out_c_bits_echo_blockisdirty; // @[XSCore.scala 140:28]
  wire [255:0] frontend_auto_icache_client_out_c_bits_data; // @[XSCore.scala 140:28]
  wire  frontend_auto_icache_client_out_d_ready; // @[XSCore.scala 140:28]
  wire  frontend_auto_icache_client_out_d_valid; // @[XSCore.scala 140:28]
  wire [2:0] frontend_auto_icache_client_out_d_bits_opcode; // @[XSCore.scala 140:28]
  wire [1:0] frontend_auto_icache_client_out_d_bits_param; // @[XSCore.scala 140:28]
  wire [1:0] frontend_auto_icache_client_out_d_bits_source; // @[XSCore.scala 140:28]
  wire [3:0] frontend_auto_icache_client_out_d_bits_sink; // @[XSCore.scala 140:28]
  wire  frontend_auto_icache_client_out_d_bits_echo_blockisdirty; // @[XSCore.scala 140:28]
  wire [255:0] frontend_auto_icache_client_out_d_bits_data; // @[XSCore.scala 140:28]
  wire  frontend_auto_icache_client_out_d_bits_corrupt; // @[XSCore.scala 140:28]
  wire  frontend_auto_icache_client_out_e_ready; // @[XSCore.scala 140:28]
  wire  frontend_auto_icache_client_out_e_valid; // @[XSCore.scala 140:28]
  wire [3:0] frontend_auto_icache_client_out_e_bits_sink; // @[XSCore.scala 140:28]
  wire  frontend_auto_instrUncache_client_out_a_ready; // @[XSCore.scala 140:28]
  wire  frontend_auto_instrUncache_client_out_a_valid; // @[XSCore.scala 140:28]
  wire [35:0] frontend_auto_instrUncache_client_out_a_bits_address; // @[XSCore.scala 140:28]
  wire  frontend_auto_instrUncache_client_out_d_ready; // @[XSCore.scala 140:28]
  wire  frontend_auto_instrUncache_client_out_d_valid; // @[XSCore.scala 140:28]
  wire  frontend_auto_instrUncache_client_out_d_bits_source; // @[XSCore.scala 140:28]
  wire [63:0] frontend_auto_instrUncache_client_out_d_bits_data; // @[XSCore.scala 140:28]
  wire [35:0] frontend_io_reset_vector; // @[XSCore.scala 140:28]
  wire  frontend_io_ptw_req_0_ready; // @[XSCore.scala 140:28]
  wire  frontend_io_ptw_req_0_valid; // @[XSCore.scala 140:28]
  wire [26:0] frontend_io_ptw_req_0_bits_vpn; // @[XSCore.scala 140:28]
  wire  frontend_io_ptw_req_1_ready; // @[XSCore.scala 140:28]
  wire  frontend_io_ptw_req_1_valid; // @[XSCore.scala 140:28]
  wire [26:0] frontend_io_ptw_req_1_bits_vpn; // @[XSCore.scala 140:28]
  wire  frontend_io_ptw_req_3_ready; // @[XSCore.scala 140:28]
  wire  frontend_io_ptw_req_3_valid; // @[XSCore.scala 140:28]
  wire [26:0] frontend_io_ptw_req_3_bits_vpn; // @[XSCore.scala 140:28]
  wire  frontend_io_ptw_resp_valid; // @[XSCore.scala 140:28]
  wire [26:0] frontend_io_ptw_resp_bits_data_entry_tag; // @[XSCore.scala 140:28]
  wire [15:0] frontend_io_ptw_resp_bits_data_entry_asid; // @[XSCore.scala 140:28]
  wire [23:0] frontend_io_ptw_resp_bits_data_entry_ppn; // @[XSCore.scala 140:28]
  wire  frontend_io_ptw_resp_bits_data_entry_perm_d; // @[XSCore.scala 140:28]
  wire  frontend_io_ptw_resp_bits_data_entry_perm_a; // @[XSCore.scala 140:28]
  wire  frontend_io_ptw_resp_bits_data_entry_perm_g; // @[XSCore.scala 140:28]
  wire  frontend_io_ptw_resp_bits_data_entry_perm_u; // @[XSCore.scala 140:28]
  wire  frontend_io_ptw_resp_bits_data_entry_perm_x; // @[XSCore.scala 140:28]
  wire  frontend_io_ptw_resp_bits_data_entry_perm_w; // @[XSCore.scala 140:28]
  wire  frontend_io_ptw_resp_bits_data_entry_perm_r; // @[XSCore.scala 140:28]
  wire [1:0] frontend_io_ptw_resp_bits_data_entry_level; // @[XSCore.scala 140:28]
  wire  frontend_io_ptw_resp_bits_data_pf; // @[XSCore.scala 140:28]
  wire  frontend_io_ptw_resp_bits_data_af; // @[XSCore.scala 140:28]
  wire  frontend_io_backend_cfVec_0_ready; // @[XSCore.scala 140:28]
  wire  frontend_io_backend_cfVec_0_valid; // @[XSCore.scala 140:28]
  wire [31:0] frontend_io_backend_cfVec_0_bits_instr; // @[XSCore.scala 140:28]
  wire [9:0] frontend_io_backend_cfVec_0_bits_foldpc; // @[XSCore.scala 140:28]
  wire  frontend_io_backend_cfVec_0_bits_exceptionVec_1; // @[XSCore.scala 140:28]
  wire  frontend_io_backend_cfVec_0_bits_exceptionVec_12; // @[XSCore.scala 140:28]
  wire  frontend_io_backend_cfVec_0_bits_trigger_frontendHit_0; // @[XSCore.scala 140:28]
  wire  frontend_io_backend_cfVec_0_bits_trigger_frontendHit_1; // @[XSCore.scala 140:28]
  wire  frontend_io_backend_cfVec_0_bits_trigger_frontendHit_2; // @[XSCore.scala 140:28]
  wire  frontend_io_backend_cfVec_0_bits_trigger_frontendHit_3; // @[XSCore.scala 140:28]
  wire  frontend_io_backend_cfVec_0_bits_trigger_backendEn_0; // @[XSCore.scala 140:28]
  wire  frontend_io_backend_cfVec_0_bits_trigger_backendEn_1; // @[XSCore.scala 140:28]
  wire  frontend_io_backend_cfVec_0_bits_pd_isRVC; // @[XSCore.scala 140:28]
  wire [1:0] frontend_io_backend_cfVec_0_bits_pd_brType; // @[XSCore.scala 140:28]
  wire  frontend_io_backend_cfVec_0_bits_pd_isCall; // @[XSCore.scala 140:28]
  wire  frontend_io_backend_cfVec_0_bits_pd_isRet; // @[XSCore.scala 140:28]
  wire  frontend_io_backend_cfVec_0_bits_pred_taken; // @[XSCore.scala 140:28]
  wire  frontend_io_backend_cfVec_0_bits_crossPageIPFFix; // @[XSCore.scala 140:28]
  wire  frontend_io_backend_cfVec_0_bits_ftqPtr_flag; // @[XSCore.scala 140:28]
  wire [2:0] frontend_io_backend_cfVec_0_bits_ftqPtr_value; // @[XSCore.scala 140:28]
  wire [2:0] frontend_io_backend_cfVec_0_bits_ftqOffset; // @[XSCore.scala 140:28]
  wire  frontend_io_backend_cfVec_1_ready; // @[XSCore.scala 140:28]
  wire  frontend_io_backend_cfVec_1_valid; // @[XSCore.scala 140:28]
  wire [31:0] frontend_io_backend_cfVec_1_bits_instr; // @[XSCore.scala 140:28]
  wire [9:0] frontend_io_backend_cfVec_1_bits_foldpc; // @[XSCore.scala 140:28]
  wire  frontend_io_backend_cfVec_1_bits_exceptionVec_1; // @[XSCore.scala 140:28]
  wire  frontend_io_backend_cfVec_1_bits_exceptionVec_12; // @[XSCore.scala 140:28]
  wire  frontend_io_backend_cfVec_1_bits_trigger_frontendHit_0; // @[XSCore.scala 140:28]
  wire  frontend_io_backend_cfVec_1_bits_trigger_frontendHit_1; // @[XSCore.scala 140:28]
  wire  frontend_io_backend_cfVec_1_bits_trigger_frontendHit_2; // @[XSCore.scala 140:28]
  wire  frontend_io_backend_cfVec_1_bits_trigger_frontendHit_3; // @[XSCore.scala 140:28]
  wire  frontend_io_backend_cfVec_1_bits_trigger_backendEn_0; // @[XSCore.scala 140:28]
  wire  frontend_io_backend_cfVec_1_bits_trigger_backendEn_1; // @[XSCore.scala 140:28]
  wire  frontend_io_backend_cfVec_1_bits_pd_isRVC; // @[XSCore.scala 140:28]
  wire [1:0] frontend_io_backend_cfVec_1_bits_pd_brType; // @[XSCore.scala 140:28]
  wire  frontend_io_backend_cfVec_1_bits_pd_isCall; // @[XSCore.scala 140:28]
  wire  frontend_io_backend_cfVec_1_bits_pd_isRet; // @[XSCore.scala 140:28]
  wire  frontend_io_backend_cfVec_1_bits_pred_taken; // @[XSCore.scala 140:28]
  wire  frontend_io_backend_cfVec_1_bits_crossPageIPFFix; // @[XSCore.scala 140:28]
  wire  frontend_io_backend_cfVec_1_bits_ftqPtr_flag; // @[XSCore.scala 140:28]
  wire [2:0] frontend_io_backend_cfVec_1_bits_ftqPtr_value; // @[XSCore.scala 140:28]
  wire [2:0] frontend_io_backend_cfVec_1_bits_ftqOffset; // @[XSCore.scala 140:28]
  wire  frontend_io_backend_fromFtq_pc_mem_wen; // @[XSCore.scala 140:28]
  wire [2:0] frontend_io_backend_fromFtq_pc_mem_waddr; // @[XSCore.scala 140:28]
  wire [38:0] frontend_io_backend_fromFtq_pc_mem_wdata_startAddr; // @[XSCore.scala 140:28]
  wire [38:0] frontend_io_backend_fromFtq_pc_mem_wdata_nextLineAddr; // @[XSCore.scala 140:28]
  wire  frontend_io_backend_fromFtq_pc_mem_wdata_isNextMask_0; // @[XSCore.scala 140:28]
  wire  frontend_io_backend_fromFtq_pc_mem_wdata_isNextMask_1; // @[XSCore.scala 140:28]
  wire  frontend_io_backend_fromFtq_pc_mem_wdata_isNextMask_2; // @[XSCore.scala 140:28]
  wire  frontend_io_backend_fromFtq_pc_mem_wdata_isNextMask_3; // @[XSCore.scala 140:28]
  wire  frontend_io_backend_fromFtq_pc_mem_wdata_isNextMask_4; // @[XSCore.scala 140:28]
  wire  frontend_io_backend_fromFtq_pc_mem_wdata_isNextMask_5; // @[XSCore.scala 140:28]
  wire  frontend_io_backend_fromFtq_pc_mem_wdata_isNextMask_6; // @[XSCore.scala 140:28]
  wire  frontend_io_backend_fromFtq_pc_mem_wdata_isNextMask_7; // @[XSCore.scala 140:28]
  wire [38:0] frontend_io_backend_fromFtq_newest_entry_target; // @[XSCore.scala 140:28]
  wire  frontend_io_backend_fromFtq_newest_entry_ptr_flag; // @[XSCore.scala 140:28]
  wire [2:0] frontend_io_backend_fromFtq_newest_entry_ptr_value; // @[XSCore.scala 140:28]
  wire  frontend_io_backend_toFtq_rob_commits_0_valid; // @[XSCore.scala 140:28]
  wire [2:0] frontend_io_backend_toFtq_rob_commits_0_bits_commitType; // @[XSCore.scala 140:28]
  wire  frontend_io_backend_toFtq_rob_commits_0_bits_ftqIdx_flag; // @[XSCore.scala 140:28]
  wire [2:0] frontend_io_backend_toFtq_rob_commits_0_bits_ftqIdx_value; // @[XSCore.scala 140:28]
  wire [2:0] frontend_io_backend_toFtq_rob_commits_0_bits_ftqOffset; // @[XSCore.scala 140:28]
  wire  frontend_io_backend_toFtq_rob_commits_1_valid; // @[XSCore.scala 140:28]
  wire [2:0] frontend_io_backend_toFtq_rob_commits_1_bits_commitType; // @[XSCore.scala 140:28]
  wire  frontend_io_backend_toFtq_rob_commits_1_bits_ftqIdx_flag; // @[XSCore.scala 140:28]
  wire [2:0] frontend_io_backend_toFtq_rob_commits_1_bits_ftqIdx_value; // @[XSCore.scala 140:28]
  wire [2:0] frontend_io_backend_toFtq_rob_commits_1_bits_ftqOffset; // @[XSCore.scala 140:28]
  wire  frontend_io_backend_toFtq_redirect_valid; // @[XSCore.scala 140:28]
  wire  frontend_io_backend_toFtq_redirect_bits_ftqIdx_flag; // @[XSCore.scala 140:28]
  wire [2:0] frontend_io_backend_toFtq_redirect_bits_ftqIdx_value; // @[XSCore.scala 140:28]
  wire [2:0] frontend_io_backend_toFtq_redirect_bits_ftqOffset; // @[XSCore.scala 140:28]
  wire  frontend_io_backend_toFtq_redirect_bits_level; // @[XSCore.scala 140:28]
  wire [38:0] frontend_io_backend_toFtq_redirect_bits_cfiUpdate_pc; // @[XSCore.scala 140:28]
  wire  frontend_io_backend_toFtq_redirect_bits_cfiUpdate_pd_isRVC; // @[XSCore.scala 140:28]
  wire [1:0] frontend_io_backend_toFtq_redirect_bits_cfiUpdate_pd_brType; // @[XSCore.scala 140:28]
  wire  frontend_io_backend_toFtq_redirect_bits_cfiUpdate_pd_isCall; // @[XSCore.scala 140:28]
  wire  frontend_io_backend_toFtq_redirect_bits_cfiUpdate_pd_isRet; // @[XSCore.scala 140:28]
  wire [38:0] frontend_io_backend_toFtq_redirect_bits_cfiUpdate_target; // @[XSCore.scala 140:28]
  wire  frontend_io_backend_toFtq_redirect_bits_cfiUpdate_taken; // @[XSCore.scala 140:28]
  wire  frontend_io_backend_toFtq_redirect_bits_cfiUpdate_isMisPred; // @[XSCore.scala 140:28]
  wire  frontend_io_sfence_valid; // @[XSCore.scala 140:28]
  wire  frontend_io_sfence_bits_rs1; // @[XSCore.scala 140:28]
  wire  frontend_io_sfence_bits_rs2; // @[XSCore.scala 140:28]
  wire [38:0] frontend_io_sfence_bits_addr; // @[XSCore.scala 140:28]
  wire [15:0] frontend_io_sfence_bits_asid; // @[XSCore.scala 140:28]
  wire [3:0] frontend_io_tlbCsr_satp_mode; // @[XSCore.scala 140:28]
  wire [15:0] frontend_io_tlbCsr_satp_asid; // @[XSCore.scala 140:28]
  wire [43:0] frontend_io_tlbCsr_satp_ppn; // @[XSCore.scala 140:28]
  wire  frontend_io_tlbCsr_satp_changed; // @[XSCore.scala 140:28]
  wire  frontend_io_tlbCsr_priv_mxr; // @[XSCore.scala 140:28]
  wire  frontend_io_tlbCsr_priv_sum; // @[XSCore.scala 140:28]
  wire [1:0] frontend_io_tlbCsr_priv_imode; // @[XSCore.scala 140:28]
  wire [1:0] frontend_io_tlbCsr_priv_dmode; // @[XSCore.scala 140:28]
  wire  frontend_io_csrCtrl_icache_parity_enable; // @[XSCore.scala 140:28]
  wire  frontend_io_csrCtrl_lvpred_disable; // @[XSCore.scala 140:28]
  wire  frontend_io_csrCtrl_no_spec_load; // @[XSCore.scala 140:28]
  wire  frontend_io_csrCtrl_storeset_wait_store; // @[XSCore.scala 140:28]
  wire [4:0] frontend_io_csrCtrl_lvpred_timeout; // @[XSCore.scala 140:28]
  wire  frontend_io_csrCtrl_bp_ctrl_ubtb_enable; // @[XSCore.scala 140:28]
  wire  frontend_io_csrCtrl_bp_ctrl_btb_enable; // @[XSCore.scala 140:28]
  wire  frontend_io_csrCtrl_bp_ctrl_tage_enable; // @[XSCore.scala 140:28]
  wire  frontend_io_csrCtrl_bp_ctrl_sc_enable; // @[XSCore.scala 140:28]
  wire  frontend_io_csrCtrl_bp_ctrl_ras_enable; // @[XSCore.scala 140:28]
  wire [3:0] frontend_io_csrCtrl_sbuffer_threshold; // @[XSCore.scala 140:28]
  wire  frontend_io_csrCtrl_ldld_vio_check_enable; // @[XSCore.scala 140:28]
  wire  frontend_io_csrCtrl_cache_error_enable; // @[XSCore.scala 140:28]
  wire  frontend_io_csrCtrl_uncache_write_outstanding_enable; // @[XSCore.scala 140:28]
  wire  frontend_io_csrCtrl_fusion_enable; // @[XSCore.scala 140:28]
  wire  frontend_io_csrCtrl_wfi_enable; // @[XSCore.scala 140:28]
  wire  frontend_io_csrCtrl_svinval_enable; // @[XSCore.scala 140:28]
  wire  frontend_io_csrCtrl_distribute_csr_wvalid; // @[XSCore.scala 140:28]
  wire [11:0] frontend_io_csrCtrl_distribute_csr_waddr; // @[XSCore.scala 140:28]
  wire [63:0] frontend_io_csrCtrl_distribute_csr_wdata; // @[XSCore.scala 140:28]
  wire  frontend_io_csrCtrl_singlestep; // @[XSCore.scala 140:28]
  wire  frontend_io_csrCtrl_frontend_trigger_t_valid; // @[XSCore.scala 140:28]
  wire [1:0] frontend_io_csrCtrl_frontend_trigger_t_bits_addr; // @[XSCore.scala 140:28]
  wire [1:0] frontend_io_csrCtrl_frontend_trigger_t_bits_tdata_matchType; // @[XSCore.scala 140:28]
  wire  frontend_io_csrCtrl_frontend_trigger_t_bits_tdata_select; // @[XSCore.scala 140:28]
  wire  frontend_io_csrCtrl_frontend_trigger_t_bits_tdata_timing; // @[XSCore.scala 140:28]
  wire  frontend_io_csrCtrl_frontend_trigger_t_bits_tdata_chain; // @[XSCore.scala 140:28]
  wire [63:0] frontend_io_csrCtrl_frontend_trigger_t_bits_tdata_tdata2; // @[XSCore.scala 140:28]
  wire  frontend_io_csrCtrl_mem_trigger_t_valid; // @[XSCore.scala 140:28]
  wire [2:0] frontend_io_csrCtrl_mem_trigger_t_bits_addr; // @[XSCore.scala 140:28]
  wire [1:0] frontend_io_csrCtrl_mem_trigger_t_bits_tdata_matchType; // @[XSCore.scala 140:28]
  wire  frontend_io_csrCtrl_mem_trigger_t_bits_tdata_select; // @[XSCore.scala 140:28]
  wire  frontend_io_csrCtrl_mem_trigger_t_bits_tdata_chain; // @[XSCore.scala 140:28]
  wire [63:0] frontend_io_csrCtrl_mem_trigger_t_bits_tdata_tdata2; // @[XSCore.scala 140:28]
  wire  frontend_io_csrCtrl_trigger_enable_0; // @[XSCore.scala 140:28]
  wire  frontend_io_csrCtrl_trigger_enable_1; // @[XSCore.scala 140:28]
  wire  frontend_io_csrCtrl_trigger_enable_2; // @[XSCore.scala 140:28]
  wire  frontend_io_csrCtrl_trigger_enable_3; // @[XSCore.scala 140:28]
  wire  frontend_io_csrCtrl_trigger_enable_4; // @[XSCore.scala 140:28]
  wire  frontend_io_csrCtrl_trigger_enable_5; // @[XSCore.scala 140:28]
  wire  frontend_io_csrCtrl_trigger_enable_6; // @[XSCore.scala 140:28]
  wire  frontend_io_csrCtrl_trigger_enable_7; // @[XSCore.scala 140:28]
  wire  frontend_io_csrCtrl_trigger_enable_8; // @[XSCore.scala 140:28]
  wire  frontend_io_csrCtrl_trigger_enable_9; // @[XSCore.scala 140:28]
  wire  frontend_io_csrUpdate_wvalid; // @[XSCore.scala 140:28]
  wire [11:0] frontend_io_csrUpdate_waddr; // @[XSCore.scala 140:28]
  wire [63:0] frontend_io_csrUpdate_wdata; // @[XSCore.scala 140:28]
  wire [35:0] frontend_io_error_paddr; // @[XSCore.scala 140:28]
  wire  frontend_io_error_report_to_beu; // @[XSCore.scala 140:28]
  wire [5:0] frontend_io_perf_0_value; // @[XSCore.scala 140:28]
  wire [5:0] frontend_io_perf_1_value; // @[XSCore.scala 140:28]
  wire [5:0] frontend_io_perf_2_value; // @[XSCore.scala 140:28]
  wire [5:0] frontend_io_perf_3_value; // @[XSCore.scala 140:28]
  wire [5:0] frontend_io_perf_4_value; // @[XSCore.scala 140:28]
  wire [5:0] frontend_io_perf_5_value; // @[XSCore.scala 140:28]
  wire [5:0] frontend_io_perf_6_value; // @[XSCore.scala 140:28]
  wire [5:0] frontend_io_perf_7_value; // @[XSCore.scala 140:28]
  wire  ptw_clock; // @[XSCore.scala 141:23]
  wire  ptw_reset; // @[XSCore.scala 141:23]
  wire  ptw_auto_out_a_ready; // @[XSCore.scala 141:23]
  wire  ptw_auto_out_a_valid; // @[XSCore.scala 141:23]
  wire [2:0] ptw_auto_out_a_bits_source; // @[XSCore.scala 141:23]
  wire [35:0] ptw_auto_out_a_bits_address; // @[XSCore.scala 141:23]
  wire  ptw_auto_out_d_valid; // @[XSCore.scala 141:23]
  wire [2:0] ptw_auto_out_d_bits_opcode; // @[XSCore.scala 141:23]
  wire [2:0] ptw_auto_out_d_bits_size; // @[XSCore.scala 141:23]
  wire [2:0] ptw_auto_out_d_bits_source; // @[XSCore.scala 141:23]
  wire [255:0] ptw_auto_out_d_bits_data; // @[XSCore.scala 141:23]
  wire  ptw_io_tlb_0_req_0_ready; // @[XSCore.scala 141:23]
  wire  ptw_io_tlb_0_req_0_valid; // @[XSCore.scala 141:23]
  wire [26:0] ptw_io_tlb_0_req_0_bits_vpn; // @[XSCore.scala 141:23]
  wire  ptw_io_tlb_0_resp_ready; // @[XSCore.scala 141:23]
  wire  ptw_io_tlb_0_resp_valid; // @[XSCore.scala 141:23]
  wire [26:0] ptw_io_tlb_0_resp_bits_entry_tag; // @[XSCore.scala 141:23]
  wire [15:0] ptw_io_tlb_0_resp_bits_entry_asid; // @[XSCore.scala 141:23]
  wire [23:0] ptw_io_tlb_0_resp_bits_entry_ppn; // @[XSCore.scala 141:23]
  wire  ptw_io_tlb_0_resp_bits_entry_perm_d; // @[XSCore.scala 141:23]
  wire  ptw_io_tlb_0_resp_bits_entry_perm_a; // @[XSCore.scala 141:23]
  wire  ptw_io_tlb_0_resp_bits_entry_perm_g; // @[XSCore.scala 141:23]
  wire  ptw_io_tlb_0_resp_bits_entry_perm_u; // @[XSCore.scala 141:23]
  wire  ptw_io_tlb_0_resp_bits_entry_perm_x; // @[XSCore.scala 141:23]
  wire  ptw_io_tlb_0_resp_bits_entry_perm_w; // @[XSCore.scala 141:23]
  wire  ptw_io_tlb_0_resp_bits_entry_perm_r; // @[XSCore.scala 141:23]
  wire [1:0] ptw_io_tlb_0_resp_bits_entry_level; // @[XSCore.scala 141:23]
  wire  ptw_io_tlb_0_resp_bits_pf; // @[XSCore.scala 141:23]
  wire  ptw_io_tlb_0_resp_bits_af; // @[XSCore.scala 141:23]
  wire  ptw_io_tlb_1_req_0_ready; // @[XSCore.scala 141:23]
  wire  ptw_io_tlb_1_req_0_valid; // @[XSCore.scala 141:23]
  wire [26:0] ptw_io_tlb_1_req_0_bits_vpn; // @[XSCore.scala 141:23]
  wire  ptw_io_tlb_1_resp_ready; // @[XSCore.scala 141:23]
  wire  ptw_io_tlb_1_resp_valid; // @[XSCore.scala 141:23]
  wire [26:0] ptw_io_tlb_1_resp_bits_entry_tag; // @[XSCore.scala 141:23]
  wire [15:0] ptw_io_tlb_1_resp_bits_entry_asid; // @[XSCore.scala 141:23]
  wire [23:0] ptw_io_tlb_1_resp_bits_entry_ppn; // @[XSCore.scala 141:23]
  wire  ptw_io_tlb_1_resp_bits_entry_perm_d; // @[XSCore.scala 141:23]
  wire  ptw_io_tlb_1_resp_bits_entry_perm_a; // @[XSCore.scala 141:23]
  wire  ptw_io_tlb_1_resp_bits_entry_perm_g; // @[XSCore.scala 141:23]
  wire  ptw_io_tlb_1_resp_bits_entry_perm_u; // @[XSCore.scala 141:23]
  wire  ptw_io_tlb_1_resp_bits_entry_perm_x; // @[XSCore.scala 141:23]
  wire  ptw_io_tlb_1_resp_bits_entry_perm_w; // @[XSCore.scala 141:23]
  wire  ptw_io_tlb_1_resp_bits_entry_perm_r; // @[XSCore.scala 141:23]
  wire [1:0] ptw_io_tlb_1_resp_bits_entry_level; // @[XSCore.scala 141:23]
  wire  ptw_io_tlb_1_resp_bits_pf; // @[XSCore.scala 141:23]
  wire  ptw_io_tlb_1_resp_bits_af; // @[XSCore.scala 141:23]
  wire  ptw_io_sfence_valid; // @[XSCore.scala 141:23]
  wire  ptw_io_sfence_bits_rs1; // @[XSCore.scala 141:23]
  wire  ptw_io_sfence_bits_rs2; // @[XSCore.scala 141:23]
  wire [38:0] ptw_io_sfence_bits_addr; // @[XSCore.scala 141:23]
  wire [15:0] ptw_io_sfence_bits_asid; // @[XSCore.scala 141:23]
  wire [15:0] ptw_io_csr_tlb_satp_asid; // @[XSCore.scala 141:23]
  wire [43:0] ptw_io_csr_tlb_satp_ppn; // @[XSCore.scala 141:23]
  wire  ptw_io_csr_tlb_satp_changed; // @[XSCore.scala 141:23]
  wire  ptw_io_csr_distribute_csr_wvalid; // @[XSCore.scala 141:23]
  wire [11:0] ptw_io_csr_distribute_csr_waddr; // @[XSCore.scala 141:23]
  wire [63:0] ptw_io_csr_distribute_csr_wdata; // @[XSCore.scala 141:23]
  wire [5:0] ptw_io_perf_0_value; // @[XSCore.scala 141:23]
  wire [5:0] ptw_io_perf_1_value; // @[XSCore.scala 141:23]
  wire [5:0] ptw_io_perf_2_value; // @[XSCore.scala 141:23]
  wire [5:0] ptw_io_perf_3_value; // @[XSCore.scala 141:23]
  wire [5:0] ptw_io_perf_4_value; // @[XSCore.scala 141:23]
  wire [5:0] ptw_io_perf_5_value; // @[XSCore.scala 141:23]
  wire [5:0] ptw_io_perf_6_value; // @[XSCore.scala 141:23]
  wire [5:0] ptw_io_perf_7_value; // @[XSCore.scala 141:23]
  wire [5:0] ptw_io_perf_8_value; // @[XSCore.scala 141:23]
  wire [5:0] ptw_io_perf_9_value; // @[XSCore.scala 141:23]
  wire [5:0] ptw_io_perf_10_value; // @[XSCore.scala 141:23]
  wire [5:0] ptw_io_perf_11_value; // @[XSCore.scala 141:23]
  wire [5:0] ptw_io_perf_12_value; // @[XSCore.scala 141:23]
  wire [5:0] ptw_io_perf_13_value; // @[XSCore.scala 141:23]
  wire [5:0] ptw_io_perf_14_value; // @[XSCore.scala 141:23]
  wire [5:0] ptw_io_perf_15_value; // @[XSCore.scala 141:23]
  wire [5:0] ptw_io_perf_16_value; // @[XSCore.scala 141:23]
  wire [5:0] ptw_io_perf_17_value; // @[XSCore.scala 141:23]
  wire [5:0] ptw_io_perf_18_value; // @[XSCore.scala 141:23]
  wire  ptw_to_l2_buffer_clock; // @[XSCore.scala 142:61]
  wire  ptw_to_l2_buffer_reset; // @[XSCore.scala 142:61]
  wire  ptw_to_l2_buffer_auto_in_a_ready; // @[XSCore.scala 142:61]
  wire  ptw_to_l2_buffer_auto_in_a_valid; // @[XSCore.scala 142:61]
  wire [2:0] ptw_to_l2_buffer_auto_in_a_bits_opcode; // @[XSCore.scala 142:61]
  wire [2:0] ptw_to_l2_buffer_auto_in_a_bits_param; // @[XSCore.scala 142:61]
  wire [2:0] ptw_to_l2_buffer_auto_in_a_bits_size; // @[XSCore.scala 142:61]
  wire [2:0] ptw_to_l2_buffer_auto_in_a_bits_source; // @[XSCore.scala 142:61]
  wire [35:0] ptw_to_l2_buffer_auto_in_a_bits_address; // @[XSCore.scala 142:61]
  wire [31:0] ptw_to_l2_buffer_auto_in_a_bits_mask; // @[XSCore.scala 142:61]
  wire [255:0] ptw_to_l2_buffer_auto_in_a_bits_data; // @[XSCore.scala 142:61]
  wire  ptw_to_l2_buffer_auto_in_d_ready; // @[XSCore.scala 142:61]
  wire  ptw_to_l2_buffer_auto_in_d_valid; // @[XSCore.scala 142:61]
  wire [2:0] ptw_to_l2_buffer_auto_in_d_bits_opcode; // @[XSCore.scala 142:61]
  wire [2:0] ptw_to_l2_buffer_auto_in_d_bits_size; // @[XSCore.scala 142:61]
  wire [2:0] ptw_to_l2_buffer_auto_in_d_bits_source; // @[XSCore.scala 142:61]
  wire  ptw_to_l2_buffer_auto_in_d_bits_denied; // @[XSCore.scala 142:61]
  wire [255:0] ptw_to_l2_buffer_auto_in_d_bits_data; // @[XSCore.scala 142:61]
  wire  ptw_to_l2_buffer_auto_in_d_bits_corrupt; // @[XSCore.scala 142:61]
  wire  ptw_to_l2_buffer_auto_out_a_ready; // @[XSCore.scala 142:61]
  wire  ptw_to_l2_buffer_auto_out_a_valid; // @[XSCore.scala 142:61]
  wire [2:0] ptw_to_l2_buffer_auto_out_a_bits_opcode; // @[XSCore.scala 142:61]
  wire [2:0] ptw_to_l2_buffer_auto_out_a_bits_param; // @[XSCore.scala 142:61]
  wire [2:0] ptw_to_l2_buffer_auto_out_a_bits_size; // @[XSCore.scala 142:61]
  wire [2:0] ptw_to_l2_buffer_auto_out_a_bits_source; // @[XSCore.scala 142:61]
  wire [35:0] ptw_to_l2_buffer_auto_out_a_bits_address; // @[XSCore.scala 142:61]
  wire [31:0] ptw_to_l2_buffer_auto_out_a_bits_mask; // @[XSCore.scala 142:61]
  wire [255:0] ptw_to_l2_buffer_auto_out_a_bits_data; // @[XSCore.scala 142:61]
  wire  ptw_to_l2_buffer_auto_out_d_ready; // @[XSCore.scala 142:61]
  wire  ptw_to_l2_buffer_auto_out_d_valid; // @[XSCore.scala 142:61]
  wire [2:0] ptw_to_l2_buffer_auto_out_d_bits_opcode; // @[XSCore.scala 142:61]
  wire [2:0] ptw_to_l2_buffer_auto_out_d_bits_size; // @[XSCore.scala 142:61]
  wire [2:0] ptw_to_l2_buffer_auto_out_d_bits_source; // @[XSCore.scala 142:61]
  wire  ptw_to_l2_buffer_auto_out_d_bits_denied; // @[XSCore.scala 142:61]
  wire [255:0] ptw_to_l2_buffer_auto_out_d_bits_data; // @[XSCore.scala 142:61]
  wire  ptw_to_l2_buffer_auto_out_d_bits_corrupt; // @[XSCore.scala 142:61]
  wire  wbArbiter_clock; // @[XSCore.scala 149:29]
  wire  wbArbiter_reset; // @[XSCore.scala 149:29]
  wire [7:0] wbArbiter_io_hartId; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_redirect_valid; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_redirect_bits_robIdx_flag; // @[XSCore.scala 149:29]
  wire [4:0] wbArbiter_io_redirect_bits_robIdx_value; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_redirect_bits_level; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_0_valid; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_0_bits_uop_ctrl_rfWen; // @[XSCore.scala 149:29]
  wire [5:0] wbArbiter_io_in_0_bits_uop_pdest; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_0_bits_uop_robIdx_flag; // @[XSCore.scala 149:29]
  wire [4:0] wbArbiter_io_in_0_bits_uop_robIdx_value; // @[XSCore.scala 149:29]
  wire [63:0] wbArbiter_io_in_0_bits_data; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_0_bits_redirectValid; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_0_bits_redirect_cfiUpdate_isMisPred; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_1_valid; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_1_bits_uop_ctrl_rfWen; // @[XSCore.scala 149:29]
  wire [5:0] wbArbiter_io_in_1_bits_uop_pdest; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_1_bits_uop_robIdx_flag; // @[XSCore.scala 149:29]
  wire [4:0] wbArbiter_io_in_1_bits_uop_robIdx_value; // @[XSCore.scala 149:29]
  wire [63:0] wbArbiter_io_in_1_bits_data; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_1_bits_redirectValid; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_1_bits_redirect_cfiUpdate_isMisPred; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_2_valid; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_2_bits_uop_ctrl_rfWen; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_2_bits_uop_ctrl_fpWen; // @[XSCore.scala 149:29]
  wire [5:0] wbArbiter_io_in_2_bits_uop_pdest; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_2_bits_uop_robIdx_flag; // @[XSCore.scala 149:29]
  wire [4:0] wbArbiter_io_in_2_bits_uop_robIdx_value; // @[XSCore.scala 149:29]
  wire [63:0] wbArbiter_io_in_2_bits_data; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_3_ready; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_3_valid; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_3_bits_uop_cf_exceptionVec_2; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_3_bits_uop_cf_exceptionVec_3; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_3_bits_uop_cf_exceptionVec_8; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_3_bits_uop_cf_exceptionVec_9; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_3_bits_uop_cf_exceptionVec_11; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_3_bits_uop_ctrl_rfWen; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_3_bits_uop_ctrl_fpWen; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_3_bits_uop_ctrl_flushPipe; // @[XSCore.scala 149:29]
  wire [5:0] wbArbiter_io_in_3_bits_uop_pdest; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_3_bits_uop_robIdx_flag; // @[XSCore.scala 149:29]
  wire [4:0] wbArbiter_io_in_3_bits_uop_robIdx_value; // @[XSCore.scala 149:29]
  wire [63:0] wbArbiter_io_in_3_bits_data; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_3_bits_redirectValid; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_3_bits_redirect_cfiUpdate_isMisPred; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_3_bits_debug_isPerfCnt; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_4_valid; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_4_bits_uop_cf_trigger_backendHit_0; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_4_bits_uop_cf_trigger_backendHit_1; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_4_bits_uop_cf_trigger_backendHit_2; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_4_bits_uop_cf_trigger_backendHit_3; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_4_bits_uop_cf_trigger_backendHit_4; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_4_bits_uop_cf_trigger_backendHit_5; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_4_bits_uop_ctrl_rfWen; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_4_bits_uop_ctrl_fpWen; // @[XSCore.scala 149:29]
  wire [5:0] wbArbiter_io_in_4_bits_uop_pdest; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_4_bits_uop_robIdx_flag; // @[XSCore.scala 149:29]
  wire [4:0] wbArbiter_io_in_4_bits_uop_robIdx_value; // @[XSCore.scala 149:29]
  wire [63:0] wbArbiter_io_in_4_bits_data; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_5_ready; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_5_valid; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_5_bits_uop_ctrl_rfWen; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_5_bits_uop_ctrl_fpWen; // @[XSCore.scala 149:29]
  wire [5:0] wbArbiter_io_in_5_bits_uop_pdest; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_5_bits_uop_robIdx_flag; // @[XSCore.scala 149:29]
  wire [4:0] wbArbiter_io_in_5_bits_uop_robIdx_value; // @[XSCore.scala 149:29]
  wire [63:0] wbArbiter_io_in_5_bits_data; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_6_valid; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_6_bits_uop_cf_exceptionVec_4; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_6_bits_uop_cf_exceptionVec_5; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_6_bits_uop_cf_exceptionVec_13; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_6_bits_uop_cf_trigger_backendHit_0; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_6_bits_uop_cf_trigger_backendHit_1; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_6_bits_uop_cf_trigger_backendHit_2; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_6_bits_uop_cf_trigger_backendHit_3; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_6_bits_uop_cf_trigger_backendHit_4; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_6_bits_uop_cf_trigger_backendHit_5; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_6_bits_uop_ctrl_rfWen; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_6_bits_uop_ctrl_fpWen; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_6_bits_uop_ctrl_flushPipe; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_6_bits_uop_ctrl_replayInst; // @[XSCore.scala 149:29]
  wire [5:0] wbArbiter_io_in_6_bits_uop_pdest; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_6_bits_uop_robIdx_flag; // @[XSCore.scala 149:29]
  wire [4:0] wbArbiter_io_in_6_bits_uop_robIdx_value; // @[XSCore.scala 149:29]
  wire [63:0] wbArbiter_io_in_6_bits_data; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_6_bits_debug_isMMIO; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_7_valid; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_7_bits_uop_cf_exceptionVec_4; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_7_bits_uop_cf_exceptionVec_5; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_7_bits_uop_cf_exceptionVec_13; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_7_bits_uop_cf_trigger_backendHit_0; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_7_bits_uop_cf_trigger_backendHit_1; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_7_bits_uop_cf_trigger_backendHit_2; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_7_bits_uop_cf_trigger_backendHit_3; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_7_bits_uop_cf_trigger_backendHit_4; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_7_bits_uop_cf_trigger_backendHit_5; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_7_bits_uop_ctrl_rfWen; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_7_bits_uop_ctrl_fpWen; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_7_bits_uop_ctrl_flushPipe; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_7_bits_uop_ctrl_replayInst; // @[XSCore.scala 149:29]
  wire [5:0] wbArbiter_io_in_7_bits_uop_pdest; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_7_bits_uop_robIdx_flag; // @[XSCore.scala 149:29]
  wire [4:0] wbArbiter_io_in_7_bits_uop_robIdx_value; // @[XSCore.scala 149:29]
  wire [63:0] wbArbiter_io_in_7_bits_data; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_7_bits_debug_isMMIO; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_8_valid; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_8_bits_uop_cf_exceptionVec_4; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_8_bits_uop_cf_exceptionVec_5; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_8_bits_uop_cf_exceptionVec_6; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_8_bits_uop_cf_exceptionVec_7; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_8_bits_uop_cf_exceptionVec_13; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_8_bits_uop_cf_exceptionVec_15; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_8_bits_uop_cf_trigger_backendHit_0; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_8_bits_uop_cf_trigger_backendHit_1; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_8_bits_uop_cf_trigger_backendHit_2; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_8_bits_uop_cf_trigger_backendHit_3; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_8_bits_uop_cf_trigger_backendHit_4; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_8_bits_uop_cf_trigger_backendHit_5; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_8_bits_uop_robIdx_flag; // @[XSCore.scala 149:29]
  wire [4:0] wbArbiter_io_in_8_bits_uop_robIdx_value; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_8_bits_redirectValid; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_8_bits_redirect_cfiUpdate_isMisPred; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_8_bits_debug_isMMIO; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_8_bits_debug_isPerfCnt; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_9_valid; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_9_bits_uop_cf_exceptionVec_4; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_9_bits_uop_cf_exceptionVec_5; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_9_bits_uop_cf_exceptionVec_6; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_9_bits_uop_cf_exceptionVec_7; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_9_bits_uop_cf_exceptionVec_13; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_9_bits_uop_cf_exceptionVec_15; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_9_bits_uop_cf_trigger_backendHit_0; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_9_bits_uop_cf_trigger_backendHit_1; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_9_bits_uop_cf_trigger_backendHit_2; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_9_bits_uop_cf_trigger_backendHit_3; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_9_bits_uop_cf_trigger_backendHit_4; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_9_bits_uop_cf_trigger_backendHit_5; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_9_bits_uop_robIdx_flag; // @[XSCore.scala 149:29]
  wire [4:0] wbArbiter_io_in_9_bits_uop_robIdx_value; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_9_bits_redirectValid; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_9_bits_redirect_cfiUpdate_isMisPred; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_9_bits_debug_isMMIO; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_9_bits_debug_isPerfCnt; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_10_valid; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_10_bits_uop_robIdx_flag; // @[XSCore.scala 149:29]
  wire [4:0] wbArbiter_io_in_10_bits_uop_robIdx_value; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_11_valid; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_in_11_bits_uop_robIdx_flag; // @[XSCore.scala 149:29]
  wire [4:0] wbArbiter_io_in_11_bits_uop_robIdx_value; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_0_valid; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_0_bits_uop_robIdx_flag; // @[XSCore.scala 149:29]
  wire [4:0] wbArbiter_io_out_0_bits_uop_robIdx_value; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_0_bits_redirectValid; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_0_bits_redirect_cfiUpdate_isMisPred; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_1_valid; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_1_bits_uop_robIdx_flag; // @[XSCore.scala 149:29]
  wire [4:0] wbArbiter_io_out_1_bits_uop_robIdx_value; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_1_bits_redirectValid; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_1_bits_redirect_cfiUpdate_isMisPred; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_2_valid; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_2_bits_uop_cf_exceptionVec_4; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_2_bits_uop_cf_exceptionVec_5; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_2_bits_uop_cf_exceptionVec_13; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_2_bits_uop_cf_trigger_backendHit_0; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_2_bits_uop_cf_trigger_backendHit_1; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_2_bits_uop_cf_trigger_backendHit_2; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_2_bits_uop_cf_trigger_backendHit_3; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_2_bits_uop_cf_trigger_backendHit_4; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_2_bits_uop_cf_trigger_backendHit_5; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_2_bits_uop_ctrl_rfWen; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_2_bits_uop_ctrl_fpWen; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_2_bits_uop_ctrl_flushPipe; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_2_bits_uop_ctrl_replayInst; // @[XSCore.scala 149:29]
  wire [5:0] wbArbiter_io_out_2_bits_uop_pdest; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_2_bits_uop_robIdx_flag; // @[XSCore.scala 149:29]
  wire [4:0] wbArbiter_io_out_2_bits_uop_robIdx_value; // @[XSCore.scala 149:29]
  wire [63:0] wbArbiter_io_out_2_bits_data; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_2_bits_debug_isMMIO; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_3_valid; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_3_bits_uop_cf_exceptionVec_4; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_3_bits_uop_cf_exceptionVec_5; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_3_bits_uop_cf_exceptionVec_13; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_3_bits_uop_cf_trigger_backendHit_0; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_3_bits_uop_cf_trigger_backendHit_1; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_3_bits_uop_cf_trigger_backendHit_2; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_3_bits_uop_cf_trigger_backendHit_3; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_3_bits_uop_cf_trigger_backendHit_4; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_3_bits_uop_cf_trigger_backendHit_5; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_3_bits_uop_ctrl_rfWen; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_3_bits_uop_ctrl_fpWen; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_3_bits_uop_ctrl_flushPipe; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_3_bits_uop_ctrl_replayInst; // @[XSCore.scala 149:29]
  wire [5:0] wbArbiter_io_out_3_bits_uop_pdest; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_3_bits_uop_robIdx_flag; // @[XSCore.scala 149:29]
  wire [4:0] wbArbiter_io_out_3_bits_uop_robIdx_value; // @[XSCore.scala 149:29]
  wire [63:0] wbArbiter_io_out_3_bits_data; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_3_bits_debug_isMMIO; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_4_valid; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_4_bits_uop_cf_exceptionVec_2; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_4_bits_uop_cf_exceptionVec_3; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_4_bits_uop_cf_exceptionVec_8; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_4_bits_uop_cf_exceptionVec_9; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_4_bits_uop_cf_exceptionVec_11; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_4_bits_uop_ctrl_rfWen; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_4_bits_uop_ctrl_fpWen; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_4_bits_uop_ctrl_flushPipe; // @[XSCore.scala 149:29]
  wire [5:0] wbArbiter_io_out_4_bits_uop_pdest; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_4_bits_uop_robIdx_flag; // @[XSCore.scala 149:29]
  wire [4:0] wbArbiter_io_out_4_bits_uop_robIdx_value; // @[XSCore.scala 149:29]
  wire [63:0] wbArbiter_io_out_4_bits_data; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_4_bits_redirectValid; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_4_bits_redirect_cfiUpdate_isMisPred; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_4_bits_debug_isPerfCnt; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_5_valid; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_5_bits_uop_cf_trigger_backendHit_0; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_5_bits_uop_cf_trigger_backendHit_1; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_5_bits_uop_cf_trigger_backendHit_2; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_5_bits_uop_cf_trigger_backendHit_3; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_5_bits_uop_cf_trigger_backendHit_4; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_5_bits_uop_cf_trigger_backendHit_5; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_5_bits_uop_ctrl_rfWen; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_5_bits_uop_ctrl_fpWen; // @[XSCore.scala 149:29]
  wire [5:0] wbArbiter_io_out_5_bits_uop_pdest; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_5_bits_uop_robIdx_flag; // @[XSCore.scala 149:29]
  wire [4:0] wbArbiter_io_out_5_bits_uop_robIdx_value; // @[XSCore.scala 149:29]
  wire [63:0] wbArbiter_io_out_5_bits_data; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_6_valid; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_6_bits_uop_ctrl_rfWen; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_6_bits_uop_ctrl_fpWen; // @[XSCore.scala 149:29]
  wire [5:0] wbArbiter_io_out_6_bits_uop_pdest; // @[XSCore.scala 149:29]
  wire [63:0] wbArbiter_io_out_6_bits_data; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_7_valid; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_7_bits_uop_ctrl_rfWen; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_7_bits_uop_ctrl_fpWen; // @[XSCore.scala 149:29]
  wire [5:0] wbArbiter_io_out_7_bits_uop_pdest; // @[XSCore.scala 149:29]
  wire [63:0] wbArbiter_io_out_7_bits_data; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_8_valid; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_8_bits_uop_cf_exceptionVec_2; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_8_bits_uop_cf_exceptionVec_3; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_8_bits_uop_cf_exceptionVec_8; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_8_bits_uop_cf_exceptionVec_9; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_8_bits_uop_cf_exceptionVec_11; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_8_bits_uop_ctrl_rfWen; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_8_bits_uop_ctrl_fpWen; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_8_bits_uop_ctrl_flushPipe; // @[XSCore.scala 149:29]
  wire [5:0] wbArbiter_io_out_8_bits_uop_pdest; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_8_bits_uop_robIdx_flag; // @[XSCore.scala 149:29]
  wire [4:0] wbArbiter_io_out_8_bits_uop_robIdx_value; // @[XSCore.scala 149:29]
  wire [63:0] wbArbiter_io_out_8_bits_data; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_8_bits_redirectValid; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_8_bits_redirect_cfiUpdate_isMisPred; // @[XSCore.scala 149:29]
  wire  wbArbiter_io_out_8_bits_debug_isPerfCnt; // @[XSCore.scala 149:29]
  wire  exuBlocks_clock; // @[XSCore.scala 218:17]
  wire  exuBlocks_reset; // @[XSCore.scala 218:17]
  wire [7:0] exuBlocks_io_hartId; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_redirect_valid; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_redirect_bits_robIdx_flag; // @[XSCore.scala 218:17]
  wire [4:0] exuBlocks_io_redirect_bits_robIdx_value; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_redirect_bits_level; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_allocPregs_0_isInt; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_allocPregs_0_isFp; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_allocPregs_0_preg; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_allocPregs_1_isInt; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_allocPregs_1_isFp; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_allocPregs_1_preg; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_0_valid; // @[XSCore.scala 218:17]
  wire [9:0] exuBlocks_io_in_0_bits_cf_foldpc; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_0_bits_cf_trigger_backendEn_0; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_0_bits_cf_trigger_backendEn_1; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_0_bits_cf_pd_isRVC; // @[XSCore.scala 218:17]
  wire [1:0] exuBlocks_io_in_0_bits_cf_pd_brType; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_0_bits_cf_pd_isCall; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_0_bits_cf_pd_isRet; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_0_bits_cf_pred_taken; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_0_bits_cf_storeSetHit; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_0_bits_cf_waitForRobIdx_flag; // @[XSCore.scala 218:17]
  wire [4:0] exuBlocks_io_in_0_bits_cf_waitForRobIdx_value; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_0_bits_cf_loadWaitBit; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_0_bits_cf_loadWaitStrict; // @[XSCore.scala 218:17]
  wire [4:0] exuBlocks_io_in_0_bits_cf_ssid; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_0_bits_cf_ftqPtr_flag; // @[XSCore.scala 218:17]
  wire [2:0] exuBlocks_io_in_0_bits_cf_ftqPtr_value; // @[XSCore.scala 218:17]
  wire [2:0] exuBlocks_io_in_0_bits_cf_ftqOffset; // @[XSCore.scala 218:17]
  wire [1:0] exuBlocks_io_in_0_bits_ctrl_srcType_0; // @[XSCore.scala 218:17]
  wire [1:0] exuBlocks_io_in_0_bits_ctrl_srcType_1; // @[XSCore.scala 218:17]
  wire [3:0] exuBlocks_io_in_0_bits_ctrl_fuType; // @[XSCore.scala 218:17]
  wire [6:0] exuBlocks_io_in_0_bits_ctrl_fuOpType; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_0_bits_ctrl_rfWen; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_0_bits_ctrl_fpWen; // @[XSCore.scala 218:17]
  wire [3:0] exuBlocks_io_in_0_bits_ctrl_selImm; // @[XSCore.scala 218:17]
  wire [19:0] exuBlocks_io_in_0_bits_ctrl_imm; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_0_bits_ctrl_fpu_isAddSub; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_0_bits_ctrl_fpu_typeTagIn; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_0_bits_ctrl_fpu_typeTagOut; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_0_bits_ctrl_fpu_fromInt; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_0_bits_ctrl_fpu_wflags; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_0_bits_ctrl_fpu_fpWen; // @[XSCore.scala 218:17]
  wire [1:0] exuBlocks_io_in_0_bits_ctrl_fpu_fmaCmd; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_0_bits_ctrl_fpu_div; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_0_bits_ctrl_fpu_sqrt; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_0_bits_ctrl_fpu_fcvt; // @[XSCore.scala 218:17]
  wire [1:0] exuBlocks_io_in_0_bits_ctrl_fpu_typ; // @[XSCore.scala 218:17]
  wire [1:0] exuBlocks_io_in_0_bits_ctrl_fpu_fmt; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_0_bits_ctrl_fpu_ren3; // @[XSCore.scala 218:17]
  wire [2:0] exuBlocks_io_in_0_bits_ctrl_fpu_rm; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_in_0_bits_psrc_0; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_in_0_bits_psrc_1; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_in_0_bits_pdest; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_0_bits_robIdx_flag; // @[XSCore.scala 218:17]
  wire [4:0] exuBlocks_io_in_0_bits_robIdx_value; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_0_bits_lqIdx_flag; // @[XSCore.scala 218:17]
  wire [3:0] exuBlocks_io_in_0_bits_lqIdx_value; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_0_bits_sqIdx_flag; // @[XSCore.scala 218:17]
  wire [3:0] exuBlocks_io_in_0_bits_sqIdx_value; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_1_valid; // @[XSCore.scala 218:17]
  wire [9:0] exuBlocks_io_in_1_bits_cf_foldpc; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_1_bits_cf_trigger_backendEn_0; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_1_bits_cf_trigger_backendEn_1; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_1_bits_cf_pd_isRVC; // @[XSCore.scala 218:17]
  wire [1:0] exuBlocks_io_in_1_bits_cf_pd_brType; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_1_bits_cf_pd_isCall; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_1_bits_cf_pd_isRet; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_1_bits_cf_pred_taken; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_1_bits_cf_storeSetHit; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_1_bits_cf_waitForRobIdx_flag; // @[XSCore.scala 218:17]
  wire [4:0] exuBlocks_io_in_1_bits_cf_waitForRobIdx_value; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_1_bits_cf_loadWaitBit; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_1_bits_cf_loadWaitStrict; // @[XSCore.scala 218:17]
  wire [4:0] exuBlocks_io_in_1_bits_cf_ssid; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_1_bits_cf_ftqPtr_flag; // @[XSCore.scala 218:17]
  wire [2:0] exuBlocks_io_in_1_bits_cf_ftqPtr_value; // @[XSCore.scala 218:17]
  wire [2:0] exuBlocks_io_in_1_bits_cf_ftqOffset; // @[XSCore.scala 218:17]
  wire [1:0] exuBlocks_io_in_1_bits_ctrl_srcType_0; // @[XSCore.scala 218:17]
  wire [1:0] exuBlocks_io_in_1_bits_ctrl_srcType_1; // @[XSCore.scala 218:17]
  wire [3:0] exuBlocks_io_in_1_bits_ctrl_fuType; // @[XSCore.scala 218:17]
  wire [6:0] exuBlocks_io_in_1_bits_ctrl_fuOpType; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_1_bits_ctrl_rfWen; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_1_bits_ctrl_fpWen; // @[XSCore.scala 218:17]
  wire [3:0] exuBlocks_io_in_1_bits_ctrl_selImm; // @[XSCore.scala 218:17]
  wire [19:0] exuBlocks_io_in_1_bits_ctrl_imm; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_in_1_bits_psrc_0; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_in_1_bits_psrc_1; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_in_1_bits_pdest; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_1_bits_robIdx_flag; // @[XSCore.scala 218:17]
  wire [4:0] exuBlocks_io_in_1_bits_robIdx_value; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_1_bits_lqIdx_flag; // @[XSCore.scala 218:17]
  wire [3:0] exuBlocks_io_in_1_bits_lqIdx_value; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_1_bits_sqIdx_flag; // @[XSCore.scala 218:17]
  wire [3:0] exuBlocks_io_in_1_bits_sqIdx_value; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_4_valid; // @[XSCore.scala 218:17]
  wire [9:0] exuBlocks_io_in_4_bits_cf_foldpc; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_4_bits_cf_trigger_backendEn_0; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_4_bits_cf_trigger_backendEn_1; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_4_bits_cf_pd_isRVC; // @[XSCore.scala 218:17]
  wire [1:0] exuBlocks_io_in_4_bits_cf_pd_brType; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_4_bits_cf_pd_isCall; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_4_bits_cf_pd_isRet; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_4_bits_cf_pred_taken; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_4_bits_cf_storeSetHit; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_4_bits_cf_waitForRobIdx_flag; // @[XSCore.scala 218:17]
  wire [4:0] exuBlocks_io_in_4_bits_cf_waitForRobIdx_value; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_4_bits_cf_loadWaitBit; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_4_bits_cf_loadWaitStrict; // @[XSCore.scala 218:17]
  wire [4:0] exuBlocks_io_in_4_bits_cf_ssid; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_4_bits_cf_ftqPtr_flag; // @[XSCore.scala 218:17]
  wire [2:0] exuBlocks_io_in_4_bits_cf_ftqPtr_value; // @[XSCore.scala 218:17]
  wire [2:0] exuBlocks_io_in_4_bits_cf_ftqOffset; // @[XSCore.scala 218:17]
  wire [1:0] exuBlocks_io_in_4_bits_ctrl_srcType_0; // @[XSCore.scala 218:17]
  wire [1:0] exuBlocks_io_in_4_bits_ctrl_srcType_1; // @[XSCore.scala 218:17]
  wire [3:0] exuBlocks_io_in_4_bits_ctrl_fuType; // @[XSCore.scala 218:17]
  wire [6:0] exuBlocks_io_in_4_bits_ctrl_fuOpType; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_4_bits_ctrl_rfWen; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_4_bits_ctrl_fpWen; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_4_bits_ctrl_flushPipe; // @[XSCore.scala 218:17]
  wire [19:0] exuBlocks_io_in_4_bits_ctrl_imm; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_4_bits_ctrl_replayInst; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_in_4_bits_psrc_0; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_in_4_bits_psrc_1; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_in_4_bits_pdest; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_4_bits_robIdx_flag; // @[XSCore.scala 218:17]
  wire [4:0] exuBlocks_io_in_4_bits_robIdx_value; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_5_valid; // @[XSCore.scala 218:17]
  wire [9:0] exuBlocks_io_in_5_bits_cf_foldpc; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_5_bits_cf_trigger_backendEn_0; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_5_bits_cf_trigger_backendEn_1; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_5_bits_cf_pd_isRVC; // @[XSCore.scala 218:17]
  wire [1:0] exuBlocks_io_in_5_bits_cf_pd_brType; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_5_bits_cf_pd_isCall; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_5_bits_cf_pd_isRet; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_5_bits_cf_pred_taken; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_5_bits_cf_storeSetHit; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_5_bits_cf_waitForRobIdx_flag; // @[XSCore.scala 218:17]
  wire [4:0] exuBlocks_io_in_5_bits_cf_waitForRobIdx_value; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_5_bits_cf_loadWaitBit; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_5_bits_cf_loadWaitStrict; // @[XSCore.scala 218:17]
  wire [4:0] exuBlocks_io_in_5_bits_cf_ssid; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_5_bits_cf_ftqPtr_flag; // @[XSCore.scala 218:17]
  wire [2:0] exuBlocks_io_in_5_bits_cf_ftqPtr_value; // @[XSCore.scala 218:17]
  wire [2:0] exuBlocks_io_in_5_bits_cf_ftqOffset; // @[XSCore.scala 218:17]
  wire [1:0] exuBlocks_io_in_5_bits_ctrl_srcType_0; // @[XSCore.scala 218:17]
  wire [1:0] exuBlocks_io_in_5_bits_ctrl_srcType_1; // @[XSCore.scala 218:17]
  wire [3:0] exuBlocks_io_in_5_bits_ctrl_fuType; // @[XSCore.scala 218:17]
  wire [6:0] exuBlocks_io_in_5_bits_ctrl_fuOpType; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_5_bits_ctrl_rfWen; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_5_bits_ctrl_fpWen; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_5_bits_ctrl_flushPipe; // @[XSCore.scala 218:17]
  wire [19:0] exuBlocks_io_in_5_bits_ctrl_imm; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_5_bits_ctrl_replayInst; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_in_5_bits_psrc_0; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_in_5_bits_psrc_1; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_in_5_bits_pdest; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_5_bits_robIdx_flag; // @[XSCore.scala 218:17]
  wire [4:0] exuBlocks_io_in_5_bits_robIdx_value; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_6_valid; // @[XSCore.scala 218:17]
  wire [9:0] exuBlocks_io_in_6_bits_cf_foldpc; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_6_bits_cf_trigger_backendEn_0; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_6_bits_cf_trigger_backendEn_1; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_6_bits_cf_pd_isRVC; // @[XSCore.scala 218:17]
  wire [1:0] exuBlocks_io_in_6_bits_cf_pd_brType; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_6_bits_cf_pd_isCall; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_6_bits_cf_pd_isRet; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_6_bits_cf_pred_taken; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_6_bits_cf_storeSetHit; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_6_bits_cf_waitForRobIdx_flag; // @[XSCore.scala 218:17]
  wire [4:0] exuBlocks_io_in_6_bits_cf_waitForRobIdx_value; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_6_bits_cf_loadWaitBit; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_6_bits_cf_loadWaitStrict; // @[XSCore.scala 218:17]
  wire [4:0] exuBlocks_io_in_6_bits_cf_ssid; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_6_bits_cf_ftqPtr_flag; // @[XSCore.scala 218:17]
  wire [2:0] exuBlocks_io_in_6_bits_cf_ftqPtr_value; // @[XSCore.scala 218:17]
  wire [2:0] exuBlocks_io_in_6_bits_cf_ftqOffset; // @[XSCore.scala 218:17]
  wire [1:0] exuBlocks_io_in_6_bits_ctrl_srcType_0; // @[XSCore.scala 218:17]
  wire [1:0] exuBlocks_io_in_6_bits_ctrl_srcType_1; // @[XSCore.scala 218:17]
  wire [3:0] exuBlocks_io_in_6_bits_ctrl_fuType; // @[XSCore.scala 218:17]
  wire [6:0] exuBlocks_io_in_6_bits_ctrl_fuOpType; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_6_bits_ctrl_rfWen; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_6_bits_ctrl_fpWen; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_6_bits_ctrl_flushPipe; // @[XSCore.scala 218:17]
  wire [19:0] exuBlocks_io_in_6_bits_ctrl_imm; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_6_bits_ctrl_replayInst; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_in_6_bits_psrc_0; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_in_6_bits_psrc_1; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_in_6_bits_pdest; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_6_bits_robIdx_flag; // @[XSCore.scala 218:17]
  wire [4:0] exuBlocks_io_in_6_bits_robIdx_value; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_7_valid; // @[XSCore.scala 218:17]
  wire [9:0] exuBlocks_io_in_7_bits_cf_foldpc; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_7_bits_cf_trigger_backendEn_0; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_7_bits_cf_trigger_backendEn_1; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_7_bits_cf_pd_isRVC; // @[XSCore.scala 218:17]
  wire [1:0] exuBlocks_io_in_7_bits_cf_pd_brType; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_7_bits_cf_pd_isCall; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_7_bits_cf_pd_isRet; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_7_bits_cf_pred_taken; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_7_bits_cf_storeSetHit; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_7_bits_cf_waitForRobIdx_flag; // @[XSCore.scala 218:17]
  wire [4:0] exuBlocks_io_in_7_bits_cf_waitForRobIdx_value; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_7_bits_cf_loadWaitBit; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_7_bits_cf_loadWaitStrict; // @[XSCore.scala 218:17]
  wire [4:0] exuBlocks_io_in_7_bits_cf_ssid; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_7_bits_cf_ftqPtr_flag; // @[XSCore.scala 218:17]
  wire [2:0] exuBlocks_io_in_7_bits_cf_ftqPtr_value; // @[XSCore.scala 218:17]
  wire [2:0] exuBlocks_io_in_7_bits_cf_ftqOffset; // @[XSCore.scala 218:17]
  wire [1:0] exuBlocks_io_in_7_bits_ctrl_srcType_0; // @[XSCore.scala 218:17]
  wire [1:0] exuBlocks_io_in_7_bits_ctrl_srcType_1; // @[XSCore.scala 218:17]
  wire [3:0] exuBlocks_io_in_7_bits_ctrl_fuType; // @[XSCore.scala 218:17]
  wire [6:0] exuBlocks_io_in_7_bits_ctrl_fuOpType; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_7_bits_ctrl_rfWen; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_7_bits_ctrl_fpWen; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_7_bits_ctrl_flushPipe; // @[XSCore.scala 218:17]
  wire [19:0] exuBlocks_io_in_7_bits_ctrl_imm; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_7_bits_ctrl_replayInst; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_in_7_bits_psrc_0; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_in_7_bits_psrc_1; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_in_7_bits_pdest; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_in_7_bits_robIdx_flag; // @[XSCore.scala 218:17]
  wire [4:0] exuBlocks_io_in_7_bits_robIdx_value; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_issue_0_ready; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_issue_0_valid; // @[XSCore.scala 218:17]
  wire [9:0] exuBlocks_io_issue_0_bits_uop_cf_foldpc; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_issue_0_bits_uop_cf_trigger_backendEn_1; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_issue_0_bits_uop_cf_waitForRobIdx_flag; // @[XSCore.scala 218:17]
  wire [4:0] exuBlocks_io_issue_0_bits_uop_cf_waitForRobIdx_value; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_issue_0_bits_uop_cf_loadWaitBit; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_issue_0_bits_uop_cf_loadWaitStrict; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_issue_0_bits_uop_cf_ftqPtr_flag; // @[XSCore.scala 218:17]
  wire [2:0] exuBlocks_io_issue_0_bits_uop_cf_ftqPtr_value; // @[XSCore.scala 218:17]
  wire [2:0] exuBlocks_io_issue_0_bits_uop_cf_ftqOffset; // @[XSCore.scala 218:17]
  wire [3:0] exuBlocks_io_issue_0_bits_uop_ctrl_fuType; // @[XSCore.scala 218:17]
  wire [6:0] exuBlocks_io_issue_0_bits_uop_ctrl_fuOpType; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_issue_0_bits_uop_ctrl_rfWen; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_issue_0_bits_uop_ctrl_fpWen; // @[XSCore.scala 218:17]
  wire [19:0] exuBlocks_io_issue_0_bits_uop_ctrl_imm; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_issue_0_bits_uop_pdest; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_issue_0_bits_uop_robIdx_flag; // @[XSCore.scala 218:17]
  wire [4:0] exuBlocks_io_issue_0_bits_uop_robIdx_value; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_issue_0_bits_uop_lqIdx_flag; // @[XSCore.scala 218:17]
  wire [3:0] exuBlocks_io_issue_0_bits_uop_lqIdx_value; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_issue_0_bits_uop_sqIdx_flag; // @[XSCore.scala 218:17]
  wire [3:0] exuBlocks_io_issue_0_bits_uop_sqIdx_value; // @[XSCore.scala 218:17]
  wire [63:0] exuBlocks_io_issue_0_bits_src_0; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_issue_1_ready; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_issue_1_valid; // @[XSCore.scala 218:17]
  wire [9:0] exuBlocks_io_issue_1_bits_uop_cf_foldpc; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_issue_1_bits_uop_cf_trigger_backendEn_1; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_issue_1_bits_uop_cf_waitForRobIdx_flag; // @[XSCore.scala 218:17]
  wire [4:0] exuBlocks_io_issue_1_bits_uop_cf_waitForRobIdx_value; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_issue_1_bits_uop_cf_loadWaitBit; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_issue_1_bits_uop_cf_loadWaitStrict; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_issue_1_bits_uop_cf_ftqPtr_flag; // @[XSCore.scala 218:17]
  wire [2:0] exuBlocks_io_issue_1_bits_uop_cf_ftqPtr_value; // @[XSCore.scala 218:17]
  wire [2:0] exuBlocks_io_issue_1_bits_uop_cf_ftqOffset; // @[XSCore.scala 218:17]
  wire [3:0] exuBlocks_io_issue_1_bits_uop_ctrl_fuType; // @[XSCore.scala 218:17]
  wire [6:0] exuBlocks_io_issue_1_bits_uop_ctrl_fuOpType; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_issue_1_bits_uop_ctrl_rfWen; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_issue_1_bits_uop_ctrl_fpWen; // @[XSCore.scala 218:17]
  wire [19:0] exuBlocks_io_issue_1_bits_uop_ctrl_imm; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_issue_1_bits_uop_pdest; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_issue_1_bits_uop_robIdx_flag; // @[XSCore.scala 218:17]
  wire [4:0] exuBlocks_io_issue_1_bits_uop_robIdx_value; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_issue_1_bits_uop_lqIdx_flag; // @[XSCore.scala 218:17]
  wire [3:0] exuBlocks_io_issue_1_bits_uop_lqIdx_value; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_issue_1_bits_uop_sqIdx_flag; // @[XSCore.scala 218:17]
  wire [3:0] exuBlocks_io_issue_1_bits_uop_sqIdx_value; // @[XSCore.scala 218:17]
  wire [63:0] exuBlocks_io_issue_1_bits_src_0; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_issue_2_ready; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_issue_2_valid; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_issue_2_bits_uop_cf_trigger_backendEn_0; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_issue_2_bits_uop_cf_trigger_backendEn_1; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_issue_2_bits_uop_cf_storeSetHit; // @[XSCore.scala 218:17]
  wire [4:0] exuBlocks_io_issue_2_bits_uop_cf_ssid; // @[XSCore.scala 218:17]
  wire [2:0] exuBlocks_io_issue_2_bits_uop_cf_ftqPtr_value; // @[XSCore.scala 218:17]
  wire [2:0] exuBlocks_io_issue_2_bits_uop_cf_ftqOffset; // @[XSCore.scala 218:17]
  wire [3:0] exuBlocks_io_issue_2_bits_uop_ctrl_fuType; // @[XSCore.scala 218:17]
  wire [6:0] exuBlocks_io_issue_2_bits_uop_ctrl_fuOpType; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_issue_2_bits_uop_ctrl_rfWen; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_issue_2_bits_uop_ctrl_fpWen; // @[XSCore.scala 218:17]
  wire [19:0] exuBlocks_io_issue_2_bits_uop_ctrl_imm; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_issue_2_bits_uop_pdest; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_issue_2_bits_uop_robIdx_flag; // @[XSCore.scala 218:17]
  wire [4:0] exuBlocks_io_issue_2_bits_uop_robIdx_value; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_issue_2_bits_uop_sqIdx_flag; // @[XSCore.scala 218:17]
  wire [3:0] exuBlocks_io_issue_2_bits_uop_sqIdx_value; // @[XSCore.scala 218:17]
  wire [63:0] exuBlocks_io_issue_2_bits_src_0; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_issue_3_ready; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_issue_3_valid; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_issue_3_bits_uop_cf_trigger_backendEn_0; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_issue_3_bits_uop_cf_trigger_backendEn_1; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_issue_3_bits_uop_cf_storeSetHit; // @[XSCore.scala 218:17]
  wire [4:0] exuBlocks_io_issue_3_bits_uop_cf_ssid; // @[XSCore.scala 218:17]
  wire [2:0] exuBlocks_io_issue_3_bits_uop_cf_ftqPtr_value; // @[XSCore.scala 218:17]
  wire [2:0] exuBlocks_io_issue_3_bits_uop_cf_ftqOffset; // @[XSCore.scala 218:17]
  wire [3:0] exuBlocks_io_issue_3_bits_uop_ctrl_fuType; // @[XSCore.scala 218:17]
  wire [6:0] exuBlocks_io_issue_3_bits_uop_ctrl_fuOpType; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_issue_3_bits_uop_ctrl_rfWen; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_issue_3_bits_uop_ctrl_fpWen; // @[XSCore.scala 218:17]
  wire [19:0] exuBlocks_io_issue_3_bits_uop_ctrl_imm; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_issue_3_bits_uop_pdest; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_issue_3_bits_uop_robIdx_flag; // @[XSCore.scala 218:17]
  wire [4:0] exuBlocks_io_issue_3_bits_uop_robIdx_value; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_issue_3_bits_uop_sqIdx_flag; // @[XSCore.scala 218:17]
  wire [3:0] exuBlocks_io_issue_3_bits_uop_sqIdx_value; // @[XSCore.scala 218:17]
  wire [63:0] exuBlocks_io_issue_3_bits_src_0; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_issue_4_ready; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_issue_4_valid; // @[XSCore.scala 218:17]
  wire [3:0] exuBlocks_io_issue_4_bits_uop_ctrl_fuType; // @[XSCore.scala 218:17]
  wire [6:0] exuBlocks_io_issue_4_bits_uop_ctrl_fuOpType; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_issue_4_bits_uop_robIdx_flag; // @[XSCore.scala 218:17]
  wire [4:0] exuBlocks_io_issue_4_bits_uop_robIdx_value; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_issue_4_bits_uop_sqIdx_flag; // @[XSCore.scala 218:17]
  wire [3:0] exuBlocks_io_issue_4_bits_uop_sqIdx_value; // @[XSCore.scala 218:17]
  wire [63:0] exuBlocks_io_issue_4_bits_src_0; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_issue_5_ready; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_issue_5_valid; // @[XSCore.scala 218:17]
  wire [3:0] exuBlocks_io_issue_5_bits_uop_ctrl_fuType; // @[XSCore.scala 218:17]
  wire [6:0] exuBlocks_io_issue_5_bits_uop_ctrl_fuOpType; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_issue_5_bits_uop_robIdx_flag; // @[XSCore.scala 218:17]
  wire [4:0] exuBlocks_io_issue_5_bits_uop_robIdx_value; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_issue_5_bits_uop_sqIdx_flag; // @[XSCore.scala 218:17]
  wire [3:0] exuBlocks_io_issue_5_bits_uop_sqIdx_value; // @[XSCore.scala 218:17]
  wire [63:0] exuBlocks_io_issue_5_bits_src_0; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_rfWriteback_2_valid; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_rfWriteback_2_bits_uop_ctrl_rfWen; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_rfWriteback_2_bits_uop_ctrl_fpWen; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_rfWriteback_2_bits_uop_pdest; // @[XSCore.scala 218:17]
  wire [63:0] exuBlocks_io_rfWriteback_2_bits_data; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_rfWriteback_3_valid; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_rfWriteback_3_bits_uop_ctrl_rfWen; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_rfWriteback_3_bits_uop_ctrl_fpWen; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_rfWriteback_3_bits_uop_pdest; // @[XSCore.scala 218:17]
  wire [63:0] exuBlocks_io_rfWriteback_3_bits_data; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_rfWriteback_4_valid; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_rfWriteback_4_bits_uop_ctrl_rfWen; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_rfWriteback_4_bits_uop_ctrl_fpWen; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_rfWriteback_4_bits_uop_pdest; // @[XSCore.scala 218:17]
  wire [63:0] exuBlocks_io_rfWriteback_4_bits_data; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_rfWriteback_5_valid; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_rfWriteback_5_bits_uop_ctrl_rfWen; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_rfWriteback_5_bits_uop_ctrl_fpWen; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_rfWriteback_5_bits_uop_pdest; // @[XSCore.scala 218:17]
  wire [63:0] exuBlocks_io_rfWriteback_5_bits_data; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_rfWriteback_6_valid; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_rfWriteback_6_bits_uop_ctrl_rfWen; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_rfWriteback_6_bits_uop_ctrl_fpWen; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_rfWriteback_6_bits_uop_pdest; // @[XSCore.scala 218:17]
  wire [63:0] exuBlocks_io_rfWriteback_6_bits_data; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_rfWriteback_7_valid; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_rfWriteback_7_bits_uop_ctrl_rfWen; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_rfWriteback_7_bits_uop_ctrl_fpWen; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_rfWriteback_7_bits_uop_pdest; // @[XSCore.scala 218:17]
  wire [63:0] exuBlocks_io_rfWriteback_7_bits_data; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_rfWriteback_8_valid; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_rfWriteback_8_bits_uop_ctrl_rfWen; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_rfWriteback_8_bits_uop_ctrl_fpWen; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_rfWriteback_8_bits_uop_pdest; // @[XSCore.scala 218:17]
  wire [63:0] exuBlocks_io_rfWriteback_8_bits_data; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuWriteback_0_valid; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuWriteback_0_bits_uop_ctrl_rfWen; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_fuWriteback_0_bits_uop_pdest; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuWriteback_0_bits_uop_robIdx_flag; // @[XSCore.scala 218:17]
  wire [4:0] exuBlocks_io_fuWriteback_0_bits_uop_robIdx_value; // @[XSCore.scala 218:17]
  wire [63:0] exuBlocks_io_fuWriteback_0_bits_data; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuWriteback_0_bits_redirectValid; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuWriteback_0_bits_redirect_cfiUpdate_isMisPred; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuWriteback_1_valid; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuWriteback_1_bits_uop_ctrl_rfWen; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_fuWriteback_1_bits_uop_pdest; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuWriteback_1_bits_uop_robIdx_flag; // @[XSCore.scala 218:17]
  wire [4:0] exuBlocks_io_fuWriteback_1_bits_uop_robIdx_value; // @[XSCore.scala 218:17]
  wire [63:0] exuBlocks_io_fuWriteback_1_bits_data; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuWriteback_1_bits_redirectValid; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuWriteback_1_bits_redirect_cfiUpdate_isMisPred; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuWriteback_2_valid; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuWriteback_2_bits_uop_ctrl_rfWen; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuWriteback_2_bits_uop_ctrl_fpWen; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_fuWriteback_2_bits_uop_pdest; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuWriteback_2_bits_uop_robIdx_flag; // @[XSCore.scala 218:17]
  wire [4:0] exuBlocks_io_fuWriteback_2_bits_uop_robIdx_value; // @[XSCore.scala 218:17]
  wire [63:0] exuBlocks_io_fuWriteback_2_bits_data; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuWriteback_3_ready; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuWriteback_3_valid; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuWriteback_3_bits_uop_cf_exceptionVec_2; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuWriteback_3_bits_uop_cf_exceptionVec_3; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuWriteback_3_bits_uop_cf_exceptionVec_8; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuWriteback_3_bits_uop_cf_exceptionVec_9; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuWriteback_3_bits_uop_cf_exceptionVec_11; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuWriteback_3_bits_uop_ctrl_rfWen; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuWriteback_3_bits_uop_ctrl_fpWen; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuWriteback_3_bits_uop_ctrl_flushPipe; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_fuWriteback_3_bits_uop_pdest; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuWriteback_3_bits_uop_robIdx_flag; // @[XSCore.scala 218:17]
  wire [4:0] exuBlocks_io_fuWriteback_3_bits_uop_robIdx_value; // @[XSCore.scala 218:17]
  wire [63:0] exuBlocks_io_fuWriteback_3_bits_data; // @[XSCore.scala 218:17]
  wire [4:0] exuBlocks_io_fuWriteback_3_bits_fflags; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuWriteback_3_bits_redirectValid; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuWriteback_3_bits_redirect_cfiUpdate_isMisPred; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuWriteback_3_bits_debug_isPerfCnt; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_scheExtra_rsReady_0; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_scheExtra_rsReady_1; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_scheExtra_rsReady_2; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_scheExtra_rsReady_3; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_scheExtra_rsReady_4; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_scheExtra_rsReady_5; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_scheExtra_rsReady_6; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_scheExtra_rsReady_7; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_scheExtra_feedback_0_feedbackSlow_valid; // @[XSCore.scala 218:17]
  wire [3:0] exuBlocks_io_scheExtra_feedback_0_feedbackSlow_bits_rsIdx; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_scheExtra_feedback_0_feedbackSlow_bits_hit; // @[XSCore.scala 218:17]
  wire [3:0] exuBlocks_io_scheExtra_feedback_0_rsIdx; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_scheExtra_feedback_1_feedbackSlow_valid; // @[XSCore.scala 218:17]
  wire [3:0] exuBlocks_io_scheExtra_feedback_1_feedbackSlow_bits_rsIdx; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_scheExtra_feedback_1_feedbackSlow_bits_hit; // @[XSCore.scala 218:17]
  wire [3:0] exuBlocks_io_scheExtra_feedback_1_rsIdx; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_scheExtra_fpRfReadIn_0_addr; // @[XSCore.scala 218:17]
  wire [63:0] exuBlocks_io_scheExtra_fpRfReadIn_0_data; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_scheExtra_fpRfReadIn_1_addr; // @[XSCore.scala 218:17]
  wire [63:0] exuBlocks_io_scheExtra_fpRfReadIn_1_data; // @[XSCore.scala 218:17]
  wire [1:0] exuBlocks_io_scheExtra_loadFastMatch_0; // @[XSCore.scala 218:17]
  wire [1:0] exuBlocks_io_scheExtra_loadFastMatch_1; // @[XSCore.scala 218:17]
  wire [11:0] exuBlocks_io_scheExtra_loadFastImm_0; // @[XSCore.scala 218:17]
  wire [11:0] exuBlocks_io_scheExtra_loadFastImm_1; // @[XSCore.scala 218:17]
  wire [38:0] exuBlocks_io_scheExtra_jumpPc; // @[XSCore.scala 218:17]
  wire [38:0] exuBlocks_io_scheExtra_jalr_target; // @[XSCore.scala 218:17]
  wire [1:0] exuBlocks_io_scheExtra_lcommit; // @[XSCore.scala 218:17]
  wire [1:0] exuBlocks_io_scheExtra_scommit; // @[XSCore.scala 218:17]
  wire [4:0] exuBlocks_io_scheExtra_lqCancelCnt; // @[XSCore.scala 218:17]
  wire [3:0] exuBlocks_io_scheExtra_sqCancelCnt; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_scheExtra_debug_int_rat_0; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_scheExtra_debug_int_rat_1; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_scheExtra_debug_int_rat_2; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_scheExtra_debug_int_rat_3; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_scheExtra_debug_int_rat_4; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_scheExtra_debug_int_rat_5; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_scheExtra_debug_int_rat_6; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_scheExtra_debug_int_rat_7; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_scheExtra_debug_int_rat_8; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_scheExtra_debug_int_rat_9; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_scheExtra_debug_int_rat_10; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_scheExtra_debug_int_rat_11; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_scheExtra_debug_int_rat_12; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_scheExtra_debug_int_rat_13; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_scheExtra_debug_int_rat_14; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_scheExtra_debug_int_rat_15; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_scheExtra_debug_int_rat_16; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_scheExtra_debug_int_rat_17; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_scheExtra_debug_int_rat_18; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_scheExtra_debug_int_rat_19; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_scheExtra_debug_int_rat_20; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_scheExtra_debug_int_rat_21; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_scheExtra_debug_int_rat_22; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_scheExtra_debug_int_rat_23; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_scheExtra_debug_int_rat_24; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_scheExtra_debug_int_rat_25; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_scheExtra_debug_int_rat_26; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_scheExtra_debug_int_rat_27; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_scheExtra_debug_int_rat_28; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_scheExtra_debug_int_rat_29; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_scheExtra_debug_int_rat_30; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_scheExtra_debug_int_rat_31; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_exuRedirect_0_valid; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_exuRedirect_0_bits_uop_cf_pd_isRVC; // @[XSCore.scala 218:17]
  wire [1:0] exuBlocks_io_fuExtra_exuRedirect_0_bits_uop_cf_pd_brType; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_exuRedirect_0_bits_uop_cf_pd_isCall; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_exuRedirect_0_bits_uop_cf_pd_isRet; // @[XSCore.scala 218:17]
  wire [19:0] exuBlocks_io_fuExtra_exuRedirect_0_bits_uop_ctrl_imm; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_exuRedirect_0_bits_uop_robIdx_flag; // @[XSCore.scala 218:17]
  wire [4:0] exuBlocks_io_fuExtra_exuRedirect_0_bits_uop_robIdx_value; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_exuRedirect_0_bits_redirectValid; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_exuRedirect_0_bits_redirect_robIdx_flag; // @[XSCore.scala 218:17]
  wire [4:0] exuBlocks_io_fuExtra_exuRedirect_0_bits_redirect_robIdx_value; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_exuRedirect_0_bits_redirect_ftqIdx_flag; // @[XSCore.scala 218:17]
  wire [2:0] exuBlocks_io_fuExtra_exuRedirect_0_bits_redirect_ftqIdx_value; // @[XSCore.scala 218:17]
  wire [2:0] exuBlocks_io_fuExtra_exuRedirect_0_bits_redirect_ftqOffset; // @[XSCore.scala 218:17]
  wire [38:0] exuBlocks_io_fuExtra_exuRedirect_0_bits_redirect_cfiUpdate_target; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_exuRedirect_0_bits_redirect_cfiUpdate_isMisPred; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_exuRedirect_1_valid; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_exuRedirect_1_bits_uop_cf_pd_isRVC; // @[XSCore.scala 218:17]
  wire [1:0] exuBlocks_io_fuExtra_exuRedirect_1_bits_uop_cf_pd_brType; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_exuRedirect_1_bits_uop_cf_pd_isCall; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_exuRedirect_1_bits_uop_cf_pd_isRet; // @[XSCore.scala 218:17]
  wire [19:0] exuBlocks_io_fuExtra_exuRedirect_1_bits_uop_ctrl_imm; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_exuRedirect_1_bits_uop_robIdx_flag; // @[XSCore.scala 218:17]
  wire [4:0] exuBlocks_io_fuExtra_exuRedirect_1_bits_uop_robIdx_value; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_exuRedirect_1_bits_redirectValid; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_exuRedirect_1_bits_redirect_robIdx_flag; // @[XSCore.scala 218:17]
  wire [4:0] exuBlocks_io_fuExtra_exuRedirect_1_bits_redirect_robIdx_value; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_exuRedirect_1_bits_redirect_ftqIdx_flag; // @[XSCore.scala 218:17]
  wire [2:0] exuBlocks_io_fuExtra_exuRedirect_1_bits_redirect_ftqIdx_value; // @[XSCore.scala 218:17]
  wire [2:0] exuBlocks_io_fuExtra_exuRedirect_1_bits_redirect_ftqOffset; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_exuRedirect_1_bits_redirect_cfiUpdate_taken; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_exuRedirect_1_bits_redirect_cfiUpdate_isMisPred; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_exuRedirect_2_valid; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_exuRedirect_2_bits_uop_cf_pd_isRVC; // @[XSCore.scala 218:17]
  wire [1:0] exuBlocks_io_fuExtra_exuRedirect_2_bits_uop_cf_pd_brType; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_exuRedirect_2_bits_uop_cf_pd_isCall; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_exuRedirect_2_bits_uop_cf_pd_isRet; // @[XSCore.scala 218:17]
  wire [19:0] exuBlocks_io_fuExtra_exuRedirect_2_bits_uop_ctrl_imm; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_exuRedirect_2_bits_uop_robIdx_flag; // @[XSCore.scala 218:17]
  wire [4:0] exuBlocks_io_fuExtra_exuRedirect_2_bits_uop_robIdx_value; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_exuRedirect_2_bits_redirectValid; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_exuRedirect_2_bits_redirect_robIdx_flag; // @[XSCore.scala 218:17]
  wire [4:0] exuBlocks_io_fuExtra_exuRedirect_2_bits_redirect_robIdx_value; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_exuRedirect_2_bits_redirect_ftqIdx_flag; // @[XSCore.scala 218:17]
  wire [2:0] exuBlocks_io_fuExtra_exuRedirect_2_bits_redirect_ftqIdx_value; // @[XSCore.scala 218:17]
  wire [2:0] exuBlocks_io_fuExtra_exuRedirect_2_bits_redirect_ftqOffset; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_exuRedirect_2_bits_redirect_cfiUpdate_taken; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_exuRedirect_2_bits_redirect_cfiUpdate_isMisPred; // @[XSCore.scala 218:17]
  wire [7:0] exuBlocks_io_fuExtra_csrio_hartId; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_fuExtra_csrio_perf_perfEventsFrontend_0_value; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_fuExtra_csrio_perf_perfEventsFrontend_1_value; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_fuExtra_csrio_perf_perfEventsFrontend_2_value; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_fuExtra_csrio_perf_perfEventsFrontend_3_value; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_fuExtra_csrio_perf_perfEventsFrontend_4_value; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_fuExtra_csrio_perf_perfEventsFrontend_5_value; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_fuExtra_csrio_perf_perfEventsFrontend_6_value; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_fuExtra_csrio_perf_perfEventsFrontend_7_value; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_fuExtra_csrio_perf_perfEventsCtrl_0_value; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_fuExtra_csrio_perf_perfEventsCtrl_1_value; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_fuExtra_csrio_perf_perfEventsCtrl_2_value; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_fuExtra_csrio_perf_perfEventsCtrl_3_value; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_fuExtra_csrio_perf_perfEventsCtrl_4_value; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_fuExtra_csrio_perf_perfEventsCtrl_5_value; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_fuExtra_csrio_perf_perfEventsCtrl_6_value; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_fuExtra_csrio_perf_perfEventsCtrl_7_value; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_fuExtra_csrio_perf_perfEventsLsu_0_value; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_fuExtra_csrio_perf_perfEventsLsu_1_value; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_fuExtra_csrio_perf_perfEventsLsu_2_value; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_fuExtra_csrio_perf_perfEventsLsu_3_value; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_fuExtra_csrio_perf_perfEventsLsu_4_value; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_fuExtra_csrio_perf_perfEventsLsu_5_value; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_fuExtra_csrio_perf_perfEventsLsu_6_value; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_fuExtra_csrio_perf_perfEventsLsu_7_value; // @[XSCore.scala 218:17]
  wire [2:0] exuBlocks_io_fuExtra_csrio_perf_retiredInstr; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_fpu_fflags_valid; // @[XSCore.scala 218:17]
  wire [4:0] exuBlocks_io_fuExtra_csrio_fpu_fflags_bits; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_fpu_dirty_fs; // @[XSCore.scala 218:17]
  wire [2:0] exuBlocks_io_fuExtra_csrio_fpu_frm; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_exception_valid; // @[XSCore.scala 218:17]
  wire [38:0] exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_pc; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_exceptionVec_0; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_exceptionVec_1; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_exceptionVec_2; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_exceptionVec_3; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_exceptionVec_4; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_exceptionVec_5; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_exceptionVec_6; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_exceptionVec_7; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_exceptionVec_8; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_exceptionVec_9; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_exceptionVec_11; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_exceptionVec_12; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_exceptionVec_13; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_exceptionVec_15; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_trigger_frontendHit_0; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_trigger_frontendHit_1; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_trigger_frontendHit_2; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_trigger_frontendHit_3; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_trigger_backendHit_0; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_trigger_backendHit_1; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_trigger_backendHit_2; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_trigger_backendHit_3; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_trigger_backendHit_4; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_trigger_backendHit_5; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_crossPageIPFFix; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_exception_bits_uop_ctrl_singleStep; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_exception_bits_isInterrupt; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_isXRet; // @[XSCore.scala 218:17]
  wire [38:0] exuBlocks_io_fuExtra_csrio_trapTarget; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_interrupt; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_wfi_event; // @[XSCore.scala 218:17]
  wire [38:0] exuBlocks_io_fuExtra_csrio_memExceptionVAddr; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_externalInterrupt_mtip; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_externalInterrupt_msip; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_externalInterrupt_meip; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_externalInterrupt_seip; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_externalInterrupt_debug; // @[XSCore.scala 218:17]
  wire [3:0] exuBlocks_io_fuExtra_csrio_tlb_satp_mode; // @[XSCore.scala 218:17]
  wire [15:0] exuBlocks_io_fuExtra_csrio_tlb_satp_asid; // @[XSCore.scala 218:17]
  wire [43:0] exuBlocks_io_fuExtra_csrio_tlb_satp_ppn; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_tlb_satp_changed; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_tlb_priv_mxr; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_tlb_priv_sum; // @[XSCore.scala 218:17]
  wire [1:0] exuBlocks_io_fuExtra_csrio_tlb_priv_imode; // @[XSCore.scala 218:17]
  wire [1:0] exuBlocks_io_fuExtra_csrio_tlb_priv_dmode; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_customCtrl_icache_parity_enable; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_customCtrl_lvpred_disable; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_customCtrl_no_spec_load; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_customCtrl_storeset_wait_store; // @[XSCore.scala 218:17]
  wire [4:0] exuBlocks_io_fuExtra_csrio_customCtrl_lvpred_timeout; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_customCtrl_bp_ctrl_ubtb_enable; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_customCtrl_bp_ctrl_btb_enable; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_customCtrl_bp_ctrl_tage_enable; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_customCtrl_bp_ctrl_sc_enable; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_customCtrl_bp_ctrl_ras_enable; // @[XSCore.scala 218:17]
  wire [3:0] exuBlocks_io_fuExtra_csrio_customCtrl_sbuffer_threshold; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_customCtrl_ldld_vio_check_enable; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_customCtrl_cache_error_enable; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_customCtrl_uncache_write_outstanding_enable; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_customCtrl_fusion_enable; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_customCtrl_wfi_enable; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_customCtrl_svinval_enable; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_customCtrl_distribute_csr_wvalid; // @[XSCore.scala 218:17]
  wire [11:0] exuBlocks_io_fuExtra_csrio_customCtrl_distribute_csr_waddr; // @[XSCore.scala 218:17]
  wire [63:0] exuBlocks_io_fuExtra_csrio_customCtrl_distribute_csr_wdata; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_customCtrl_singlestep; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_customCtrl_frontend_trigger_t_valid; // @[XSCore.scala 218:17]
  wire [1:0] exuBlocks_io_fuExtra_csrio_customCtrl_frontend_trigger_t_bits_addr; // @[XSCore.scala 218:17]
  wire [1:0] exuBlocks_io_fuExtra_csrio_customCtrl_frontend_trigger_t_bits_tdata_matchType; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_customCtrl_frontend_trigger_t_bits_tdata_select; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_customCtrl_frontend_trigger_t_bits_tdata_timing; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_customCtrl_frontend_trigger_t_bits_tdata_chain; // @[XSCore.scala 218:17]
  wire [63:0] exuBlocks_io_fuExtra_csrio_customCtrl_frontend_trigger_t_bits_tdata_tdata2; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_customCtrl_mem_trigger_t_valid; // @[XSCore.scala 218:17]
  wire [2:0] exuBlocks_io_fuExtra_csrio_customCtrl_mem_trigger_t_bits_addr; // @[XSCore.scala 218:17]
  wire [1:0] exuBlocks_io_fuExtra_csrio_customCtrl_mem_trigger_t_bits_tdata_matchType; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_customCtrl_mem_trigger_t_bits_tdata_select; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_customCtrl_mem_trigger_t_bits_tdata_chain; // @[XSCore.scala 218:17]
  wire [63:0] exuBlocks_io_fuExtra_csrio_customCtrl_mem_trigger_t_bits_tdata_tdata2; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_customCtrl_trigger_enable_0; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_customCtrl_trigger_enable_1; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_customCtrl_trigger_enable_2; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_customCtrl_trigger_enable_3; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_customCtrl_trigger_enable_4; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_customCtrl_trigger_enable_5; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_customCtrl_trigger_enable_6; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_customCtrl_trigger_enable_7; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_customCtrl_trigger_enable_8; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_customCtrl_trigger_enable_9; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_distributedUpdate_0_wvalid; // @[XSCore.scala 218:17]
  wire [11:0] exuBlocks_io_fuExtra_csrio_distributedUpdate_0_waddr; // @[XSCore.scala 218:17]
  wire [63:0] exuBlocks_io_fuExtra_csrio_distributedUpdate_0_wdata; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_csrio_distributedUpdate_1_wvalid; // @[XSCore.scala 218:17]
  wire [11:0] exuBlocks_io_fuExtra_csrio_distributedUpdate_1_waddr; // @[XSCore.scala 218:17]
  wire [63:0] exuBlocks_io_fuExtra_csrio_distributedUpdate_1_wdata; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_fenceio_sfence_valid; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_fenceio_sfence_bits_rs1; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_fenceio_sfence_bits_rs2; // @[XSCore.scala 218:17]
  wire [38:0] exuBlocks_io_fuExtra_fenceio_sfence_bits_addr; // @[XSCore.scala 218:17]
  wire [15:0] exuBlocks_io_fuExtra_fenceio_sfence_bits_asid; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_fenceio_sbuffer_flushSb; // @[XSCore.scala 218:17]
  wire  exuBlocks_io_fuExtra_fenceio_sbuffer_sbIsEmpty; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_perf_0_value; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_perf_1_value; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_perf_2_value; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_perf_3_value; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_perf_4_value; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_perf_5_value; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_perf_6_value; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_perf_7_value; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_perf_8_value; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_perf_9_value; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_perf_10_value; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_io_perf_11_value; // @[XSCore.scala 218:17]
  wire  exuBlocks_1_clock; // @[XSCore.scala 218:17]
  wire  exuBlocks_1_reset; // @[XSCore.scala 218:17]
  wire [7:0] exuBlocks_1_io_hartId; // @[XSCore.scala 218:17]
  wire  exuBlocks_1_io_redirect_valid; // @[XSCore.scala 218:17]
  wire  exuBlocks_1_io_redirect_bits_robIdx_flag; // @[XSCore.scala 218:17]
  wire [4:0] exuBlocks_1_io_redirect_bits_robIdx_value; // @[XSCore.scala 218:17]
  wire  exuBlocks_1_io_redirect_bits_level; // @[XSCore.scala 218:17]
  wire  exuBlocks_1_io_allocPregs_0_isFp; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_1_io_allocPregs_0_preg; // @[XSCore.scala 218:17]
  wire  exuBlocks_1_io_allocPregs_1_isFp; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_1_io_allocPregs_1_preg; // @[XSCore.scala 218:17]
  wire  exuBlocks_1_io_in_0_valid; // @[XSCore.scala 218:17]
  wire  exuBlocks_1_io_in_0_bits_cf_pd_isRVC; // @[XSCore.scala 218:17]
  wire [1:0] exuBlocks_1_io_in_0_bits_cf_pd_brType; // @[XSCore.scala 218:17]
  wire  exuBlocks_1_io_in_0_bits_cf_pd_isCall; // @[XSCore.scala 218:17]
  wire  exuBlocks_1_io_in_0_bits_cf_pd_isRet; // @[XSCore.scala 218:17]
  wire  exuBlocks_1_io_in_0_bits_cf_pred_taken; // @[XSCore.scala 218:17]
  wire  exuBlocks_1_io_in_0_bits_cf_ftqPtr_flag; // @[XSCore.scala 218:17]
  wire [2:0] exuBlocks_1_io_in_0_bits_cf_ftqPtr_value; // @[XSCore.scala 218:17]
  wire [2:0] exuBlocks_1_io_in_0_bits_cf_ftqOffset; // @[XSCore.scala 218:17]
  wire [1:0] exuBlocks_1_io_in_0_bits_ctrl_srcType_0; // @[XSCore.scala 218:17]
  wire [1:0] exuBlocks_1_io_in_0_bits_ctrl_srcType_1; // @[XSCore.scala 218:17]
  wire [1:0] exuBlocks_1_io_in_0_bits_ctrl_srcType_2; // @[XSCore.scala 218:17]
  wire [3:0] exuBlocks_1_io_in_0_bits_ctrl_fuType; // @[XSCore.scala 218:17]
  wire [6:0] exuBlocks_1_io_in_0_bits_ctrl_fuOpType; // @[XSCore.scala 218:17]
  wire  exuBlocks_1_io_in_0_bits_ctrl_rfWen; // @[XSCore.scala 218:17]
  wire  exuBlocks_1_io_in_0_bits_ctrl_fpWen; // @[XSCore.scala 218:17]
  wire [19:0] exuBlocks_1_io_in_0_bits_ctrl_imm; // @[XSCore.scala 218:17]
  wire  exuBlocks_1_io_in_0_bits_ctrl_fpu_isAddSub; // @[XSCore.scala 218:17]
  wire  exuBlocks_1_io_in_0_bits_ctrl_fpu_typeTagIn; // @[XSCore.scala 218:17]
  wire  exuBlocks_1_io_in_0_bits_ctrl_fpu_typeTagOut; // @[XSCore.scala 218:17]
  wire  exuBlocks_1_io_in_0_bits_ctrl_fpu_fromInt; // @[XSCore.scala 218:17]
  wire  exuBlocks_1_io_in_0_bits_ctrl_fpu_wflags; // @[XSCore.scala 218:17]
  wire  exuBlocks_1_io_in_0_bits_ctrl_fpu_fpWen; // @[XSCore.scala 218:17]
  wire [1:0] exuBlocks_1_io_in_0_bits_ctrl_fpu_fmaCmd; // @[XSCore.scala 218:17]
  wire  exuBlocks_1_io_in_0_bits_ctrl_fpu_div; // @[XSCore.scala 218:17]
  wire  exuBlocks_1_io_in_0_bits_ctrl_fpu_sqrt; // @[XSCore.scala 218:17]
  wire  exuBlocks_1_io_in_0_bits_ctrl_fpu_fcvt; // @[XSCore.scala 218:17]
  wire [1:0] exuBlocks_1_io_in_0_bits_ctrl_fpu_typ; // @[XSCore.scala 218:17]
  wire [1:0] exuBlocks_1_io_in_0_bits_ctrl_fpu_fmt; // @[XSCore.scala 218:17]
  wire  exuBlocks_1_io_in_0_bits_ctrl_fpu_ren3; // @[XSCore.scala 218:17]
  wire [2:0] exuBlocks_1_io_in_0_bits_ctrl_fpu_rm; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_1_io_in_0_bits_psrc_0; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_1_io_in_0_bits_psrc_1; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_1_io_in_0_bits_psrc_2; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_1_io_in_0_bits_pdest; // @[XSCore.scala 218:17]
  wire  exuBlocks_1_io_in_0_bits_robIdx_flag; // @[XSCore.scala 218:17]
  wire [4:0] exuBlocks_1_io_in_0_bits_robIdx_value; // @[XSCore.scala 218:17]
  wire  exuBlocks_1_io_fastUopOut_0_valid; // @[XSCore.scala 218:17]
  wire  exuBlocks_1_io_fastUopOut_0_bits_ctrl_fpWen; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_1_io_fastUopOut_0_bits_pdest; // @[XSCore.scala 218:17]
  wire  exuBlocks_1_io_rfWriteback_6_valid; // @[XSCore.scala 218:17]
  wire  exuBlocks_1_io_rfWriteback_6_bits_uop_ctrl_fpWen; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_1_io_rfWriteback_6_bits_uop_pdest; // @[XSCore.scala 218:17]
  wire [63:0] exuBlocks_1_io_rfWriteback_6_bits_data; // @[XSCore.scala 218:17]
  wire  exuBlocks_1_io_rfWriteback_7_valid; // @[XSCore.scala 218:17]
  wire  exuBlocks_1_io_rfWriteback_7_bits_uop_ctrl_fpWen; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_1_io_rfWriteback_7_bits_uop_pdest; // @[XSCore.scala 218:17]
  wire [63:0] exuBlocks_1_io_rfWriteback_7_bits_data; // @[XSCore.scala 218:17]
  wire  exuBlocks_1_io_rfWriteback_8_valid; // @[XSCore.scala 218:17]
  wire  exuBlocks_1_io_rfWriteback_8_bits_uop_ctrl_fpWen; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_1_io_rfWriteback_8_bits_uop_pdest; // @[XSCore.scala 218:17]
  wire [63:0] exuBlocks_1_io_rfWriteback_8_bits_data; // @[XSCore.scala 218:17]
  wire  exuBlocks_1_io_fastUopIn_5_valid; // @[XSCore.scala 218:17]
  wire  exuBlocks_1_io_fastUopIn_5_bits_ctrl_fpWen; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_1_io_fastUopIn_5_bits_pdest; // @[XSCore.scala 218:17]
  wire  exuBlocks_1_io_fuWriteback_0_ready; // @[XSCore.scala 218:17]
  wire  exuBlocks_1_io_fuWriteback_0_valid; // @[XSCore.scala 218:17]
  wire  exuBlocks_1_io_fuWriteback_0_bits_uop_cf_trigger_backendHit_0; // @[XSCore.scala 218:17]
  wire  exuBlocks_1_io_fuWriteback_0_bits_uop_cf_trigger_backendHit_1; // @[XSCore.scala 218:17]
  wire  exuBlocks_1_io_fuWriteback_0_bits_uop_cf_trigger_backendHit_2; // @[XSCore.scala 218:17]
  wire  exuBlocks_1_io_fuWriteback_0_bits_uop_cf_trigger_backendHit_3; // @[XSCore.scala 218:17]
  wire  exuBlocks_1_io_fuWriteback_0_bits_uop_cf_trigger_backendHit_4; // @[XSCore.scala 218:17]
  wire  exuBlocks_1_io_fuWriteback_0_bits_uop_cf_trigger_backendHit_5; // @[XSCore.scala 218:17]
  wire  exuBlocks_1_io_fuWriteback_0_bits_uop_ctrl_rfWen; // @[XSCore.scala 218:17]
  wire  exuBlocks_1_io_fuWriteback_0_bits_uop_ctrl_fpWen; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_1_io_fuWriteback_0_bits_uop_pdest; // @[XSCore.scala 218:17]
  wire  exuBlocks_1_io_fuWriteback_0_bits_uop_robIdx_flag; // @[XSCore.scala 218:17]
  wire [4:0] exuBlocks_1_io_fuWriteback_0_bits_uop_robIdx_value; // @[XSCore.scala 218:17]
  wire [63:0] exuBlocks_1_io_fuWriteback_0_bits_data; // @[XSCore.scala 218:17]
  wire [4:0] exuBlocks_1_io_fuWriteback_0_bits_fflags; // @[XSCore.scala 218:17]
  wire  exuBlocks_1_io_fuWriteback_1_ready; // @[XSCore.scala 218:17]
  wire  exuBlocks_1_io_fuWriteback_1_valid; // @[XSCore.scala 218:17]
  wire  exuBlocks_1_io_fuWriteback_1_bits_uop_ctrl_rfWen; // @[XSCore.scala 218:17]
  wire  exuBlocks_1_io_fuWriteback_1_bits_uop_ctrl_fpWen; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_1_io_fuWriteback_1_bits_uop_pdest; // @[XSCore.scala 218:17]
  wire  exuBlocks_1_io_fuWriteback_1_bits_uop_robIdx_flag; // @[XSCore.scala 218:17]
  wire [4:0] exuBlocks_1_io_fuWriteback_1_bits_uop_robIdx_value; // @[XSCore.scala 218:17]
  wire [63:0] exuBlocks_1_io_fuWriteback_1_bits_data; // @[XSCore.scala 218:17]
  wire [4:0] exuBlocks_1_io_fuWriteback_1_bits_fflags; // @[XSCore.scala 218:17]
  wire  exuBlocks_1_io_scheExtra_rsReady_0; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_1_io_scheExtra_fpRfReadOut_0_addr; // @[XSCore.scala 218:17]
  wire [63:0] exuBlocks_1_io_scheExtra_fpRfReadOut_0_data; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_1_io_scheExtra_fpRfReadOut_1_addr; // @[XSCore.scala 218:17]
  wire [63:0] exuBlocks_1_io_scheExtra_fpRfReadOut_1_data; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_1_io_scheExtra_debug_fp_rat_0; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_1_io_scheExtra_debug_fp_rat_1; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_1_io_scheExtra_debug_fp_rat_2; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_1_io_scheExtra_debug_fp_rat_3; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_1_io_scheExtra_debug_fp_rat_4; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_1_io_scheExtra_debug_fp_rat_5; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_1_io_scheExtra_debug_fp_rat_6; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_1_io_scheExtra_debug_fp_rat_7; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_1_io_scheExtra_debug_fp_rat_8; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_1_io_scheExtra_debug_fp_rat_9; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_1_io_scheExtra_debug_fp_rat_10; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_1_io_scheExtra_debug_fp_rat_11; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_1_io_scheExtra_debug_fp_rat_12; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_1_io_scheExtra_debug_fp_rat_13; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_1_io_scheExtra_debug_fp_rat_14; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_1_io_scheExtra_debug_fp_rat_15; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_1_io_scheExtra_debug_fp_rat_16; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_1_io_scheExtra_debug_fp_rat_17; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_1_io_scheExtra_debug_fp_rat_18; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_1_io_scheExtra_debug_fp_rat_19; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_1_io_scheExtra_debug_fp_rat_20; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_1_io_scheExtra_debug_fp_rat_21; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_1_io_scheExtra_debug_fp_rat_22; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_1_io_scheExtra_debug_fp_rat_23; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_1_io_scheExtra_debug_fp_rat_24; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_1_io_scheExtra_debug_fp_rat_25; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_1_io_scheExtra_debug_fp_rat_26; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_1_io_scheExtra_debug_fp_rat_27; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_1_io_scheExtra_debug_fp_rat_28; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_1_io_scheExtra_debug_fp_rat_29; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_1_io_scheExtra_debug_fp_rat_30; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_1_io_scheExtra_debug_fp_rat_31; // @[XSCore.scala 218:17]
  wire [2:0] exuBlocks_1_io_fuExtra_frm; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_1_io_perf_0_value; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_1_io_perf_1_value; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_1_io_perf_2_value; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_1_io_perf_3_value; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_1_io_perf_4_value; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_1_io_perf_5_value; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_1_io_perf_6_value; // @[XSCore.scala 218:17]
  wire [5:0] exuBlocks_1_io_perf_7_value; // @[XSCore.scala 218:17]
  wire  memBlock_clock; // @[XSCore.scala 221:28]
  wire  memBlock_reset; // @[XSCore.scala 221:28]
  wire  memBlock_auto_uncache_client_out_a_ready; // @[XSCore.scala 221:28]
  wire  memBlock_auto_uncache_client_out_a_valid; // @[XSCore.scala 221:28]
  wire [2:0] memBlock_auto_uncache_client_out_a_bits_opcode; // @[XSCore.scala 221:28]
  wire [2:0] memBlock_auto_uncache_client_out_a_bits_size; // @[XSCore.scala 221:28]
  wire [1:0] memBlock_auto_uncache_client_out_a_bits_source; // @[XSCore.scala 221:28]
  wire [35:0] memBlock_auto_uncache_client_out_a_bits_address; // @[XSCore.scala 221:28]
  wire [7:0] memBlock_auto_uncache_client_out_a_bits_mask; // @[XSCore.scala 221:28]
  wire [63:0] memBlock_auto_uncache_client_out_a_bits_data; // @[XSCore.scala 221:28]
  wire  memBlock_auto_uncache_client_out_d_ready; // @[XSCore.scala 221:28]
  wire  memBlock_auto_uncache_client_out_d_valid; // @[XSCore.scala 221:28]
  wire [2:0] memBlock_auto_uncache_client_out_d_bits_opcode; // @[XSCore.scala 221:28]
  wire [63:0] memBlock_auto_uncache_client_out_d_bits_data; // @[XSCore.scala 221:28]
  wire  memBlock_auto_dcache_client_out_a_ready; // @[XSCore.scala 221:28]
  wire  memBlock_auto_dcache_client_out_a_valid; // @[XSCore.scala 221:28]
  wire [2:0] memBlock_auto_dcache_client_out_a_bits_opcode; // @[XSCore.scala 221:28]
  wire [2:0] memBlock_auto_dcache_client_out_a_bits_param; // @[XSCore.scala 221:28]
  wire [2:0] memBlock_auto_dcache_client_out_a_bits_size; // @[XSCore.scala 221:28]
  wire [3:0] memBlock_auto_dcache_client_out_a_bits_source; // @[XSCore.scala 221:28]
  wire [35:0] memBlock_auto_dcache_client_out_a_bits_address; // @[XSCore.scala 221:28]
  wire [31:0] memBlock_auto_dcache_client_out_a_bits_mask; // @[XSCore.scala 221:28]
  wire  memBlock_auto_dcache_client_out_bready; // @[XSCore.scala 221:28]
  wire  memBlock_auto_dcache_client_out_bvalid; // @[XSCore.scala 221:28]
  wire [1:0] memBlock_auto_dcache_client_out_bparam; // @[XSCore.scala 221:28]
  wire [35:0] memBlock_auto_dcache_client_out_baddress; // @[XSCore.scala 221:28]
  wire [255:0] memBlock_auto_dcache_client_out_bdata; // @[XSCore.scala 221:28]
  wire  memBlock_auto_dcache_client_out_c_ready; // @[XSCore.scala 221:28]
  wire  memBlock_auto_dcache_client_out_c_valid; // @[XSCore.scala 221:28]
  wire [2:0] memBlock_auto_dcache_client_out_c_bits_opcode; // @[XSCore.scala 221:28]
  wire [2:0] memBlock_auto_dcache_client_out_c_bits_param; // @[XSCore.scala 221:28]
  wire [2:0] memBlock_auto_dcache_client_out_c_bits_size; // @[XSCore.scala 221:28]
  wire [3:0] memBlock_auto_dcache_client_out_c_bits_source; // @[XSCore.scala 221:28]
  wire [35:0] memBlock_auto_dcache_client_out_c_bits_address; // @[XSCore.scala 221:28]
  wire  memBlock_auto_dcache_client_out_c_bits_echo_blockisdirty; // @[XSCore.scala 221:28]
  wire [255:0] memBlock_auto_dcache_client_out_c_bits_data; // @[XSCore.scala 221:28]
  wire  memBlock_auto_dcache_client_out_d_ready; // @[XSCore.scala 221:28]
  wire  memBlock_auto_dcache_client_out_d_valid; // @[XSCore.scala 221:28]
  wire [2:0] memBlock_auto_dcache_client_out_d_bits_opcode; // @[XSCore.scala 221:28]
  wire [1:0] memBlock_auto_dcache_client_out_d_bits_param; // @[XSCore.scala 221:28]
  wire [2:0] memBlock_auto_dcache_client_out_d_bits_size; // @[XSCore.scala 221:28]
  wire [3:0] memBlock_auto_dcache_client_out_d_bits_source; // @[XSCore.scala 221:28]
  wire [3:0] memBlock_auto_dcache_client_out_d_bits_sink; // @[XSCore.scala 221:28]
  wire  memBlock_auto_dcache_client_out_d_bits_denied; // @[XSCore.scala 221:28]
  wire  memBlock_auto_dcache_client_out_d_bits_echo_blockisdirty; // @[XSCore.scala 221:28]
  wire [255:0] memBlock_auto_dcache_client_out_d_bits_data; // @[XSCore.scala 221:28]
  wire  memBlock_auto_dcache_client_out_d_bits_corrupt; // @[XSCore.scala 221:28]
  wire  memBlock_auto_dcache_client_out_e_ready; // @[XSCore.scala 221:28]
  wire  memBlock_auto_dcache_client_out_e_valid; // @[XSCore.scala 221:28]
  wire [3:0] memBlock_auto_dcache_client_out_e_bits_sink; // @[XSCore.scala 221:28]
  wire [7:0] memBlock_io_hartId; // @[XSCore.scala 221:28]
  wire  memBlock_io_redirect_valid; // @[XSCore.scala 221:28]
  wire  memBlock_io_redirect_bits_robIdx_flag; // @[XSCore.scala 221:28]
  wire [4:0] memBlock_io_redirect_bits_robIdx_value; // @[XSCore.scala 221:28]
  wire  memBlock_io_redirect_bits_level; // @[XSCore.scala 221:28]
  wire  memBlock_io_issue_0_ready; // @[XSCore.scala 221:28]
  wire  memBlock_io_issue_0_valid; // @[XSCore.scala 221:28]
  wire [9:0] memBlock_io_issue_0_bits_uop_cf_foldpc; // @[XSCore.scala 221:28]
  wire  memBlock_io_issue_0_bits_uop_cf_trigger_backendEn_1; // @[XSCore.scala 221:28]
  wire  memBlock_io_issue_0_bits_uop_cf_waitForRobIdx_flag; // @[XSCore.scala 221:28]
  wire [4:0] memBlock_io_issue_0_bits_uop_cf_waitForRobIdx_value; // @[XSCore.scala 221:28]
  wire  memBlock_io_issue_0_bits_uop_cf_loadWaitBit; // @[XSCore.scala 221:28]
  wire  memBlock_io_issue_0_bits_uop_cf_loadWaitStrict; // @[XSCore.scala 221:28]
  wire  memBlock_io_issue_0_bits_uop_cf_ftqPtr_flag; // @[XSCore.scala 221:28]
  wire [2:0] memBlock_io_issue_0_bits_uop_cf_ftqPtr_value; // @[XSCore.scala 221:28]
  wire [2:0] memBlock_io_issue_0_bits_uop_cf_ftqOffset; // @[XSCore.scala 221:28]
  wire [3:0] memBlock_io_issue_0_bits_uop_ctrl_fuType; // @[XSCore.scala 221:28]
  wire [6:0] memBlock_io_issue_0_bits_uop_ctrl_fuOpType; // @[XSCore.scala 221:28]
  wire  memBlock_io_issue_0_bits_uop_ctrl_rfWen; // @[XSCore.scala 221:28]
  wire  memBlock_io_issue_0_bits_uop_ctrl_fpWen; // @[XSCore.scala 221:28]
  wire [19:0] memBlock_io_issue_0_bits_uop_ctrl_imm; // @[XSCore.scala 221:28]
  wire [5:0] memBlock_io_issue_0_bits_uop_pdest; // @[XSCore.scala 221:28]
  wire  memBlock_io_issue_0_bits_uop_robIdx_flag; // @[XSCore.scala 221:28]
  wire [4:0] memBlock_io_issue_0_bits_uop_robIdx_value; // @[XSCore.scala 221:28]
  wire  memBlock_io_issue_0_bits_uop_lqIdx_flag; // @[XSCore.scala 221:28]
  wire [3:0] memBlock_io_issue_0_bits_uop_lqIdx_value; // @[XSCore.scala 221:28]
  wire  memBlock_io_issue_0_bits_uop_sqIdx_flag; // @[XSCore.scala 221:28]
  wire [3:0] memBlock_io_issue_0_bits_uop_sqIdx_value; // @[XSCore.scala 221:28]
  wire [63:0] memBlock_io_issue_0_bits_src_0; // @[XSCore.scala 221:28]
  wire  memBlock_io_issue_1_ready; // @[XSCore.scala 221:28]
  wire  memBlock_io_issue_1_valid; // @[XSCore.scala 221:28]
  wire [9:0] memBlock_io_issue_1_bits_uop_cf_foldpc; // @[XSCore.scala 221:28]
  wire  memBlock_io_issue_1_bits_uop_cf_trigger_backendEn_1; // @[XSCore.scala 221:28]
  wire  memBlock_io_issue_1_bits_uop_cf_waitForRobIdx_flag; // @[XSCore.scala 221:28]
  wire [4:0] memBlock_io_issue_1_bits_uop_cf_waitForRobIdx_value; // @[XSCore.scala 221:28]
  wire  memBlock_io_issue_1_bits_uop_cf_loadWaitBit; // @[XSCore.scala 221:28]
  wire  memBlock_io_issue_1_bits_uop_cf_loadWaitStrict; // @[XSCore.scala 221:28]
  wire  memBlock_io_issue_1_bits_uop_cf_ftqPtr_flag; // @[XSCore.scala 221:28]
  wire [2:0] memBlock_io_issue_1_bits_uop_cf_ftqPtr_value; // @[XSCore.scala 221:28]
  wire [2:0] memBlock_io_issue_1_bits_uop_cf_ftqOffset; // @[XSCore.scala 221:28]
  wire [3:0] memBlock_io_issue_1_bits_uop_ctrl_fuType; // @[XSCore.scala 221:28]
  wire [6:0] memBlock_io_issue_1_bits_uop_ctrl_fuOpType; // @[XSCore.scala 221:28]
  wire  memBlock_io_issue_1_bits_uop_ctrl_rfWen; // @[XSCore.scala 221:28]
  wire  memBlock_io_issue_1_bits_uop_ctrl_fpWen; // @[XSCore.scala 221:28]
  wire [19:0] memBlock_io_issue_1_bits_uop_ctrl_imm; // @[XSCore.scala 221:28]
  wire [5:0] memBlock_io_issue_1_bits_uop_pdest; // @[XSCore.scala 221:28]
  wire  memBlock_io_issue_1_bits_uop_robIdx_flag; // @[XSCore.scala 221:28]
  wire [4:0] memBlock_io_issue_1_bits_uop_robIdx_value; // @[XSCore.scala 221:28]
  wire  memBlock_io_issue_1_bits_uop_lqIdx_flag; // @[XSCore.scala 221:28]
  wire [3:0] memBlock_io_issue_1_bits_uop_lqIdx_value; // @[XSCore.scala 221:28]
  wire  memBlock_io_issue_1_bits_uop_sqIdx_flag; // @[XSCore.scala 221:28]
  wire [3:0] memBlock_io_issue_1_bits_uop_sqIdx_value; // @[XSCore.scala 221:28]
  wire [63:0] memBlock_io_issue_1_bits_src_0; // @[XSCore.scala 221:28]
  wire  memBlock_io_issue_2_ready; // @[XSCore.scala 221:28]
  wire  memBlock_io_issue_2_valid; // @[XSCore.scala 221:28]
  wire  memBlock_io_issue_2_bits_uop_cf_trigger_backendEn_0; // @[XSCore.scala 221:28]
  wire  memBlock_io_issue_2_bits_uop_cf_trigger_backendEn_1; // @[XSCore.scala 221:28]
  wire  memBlock_io_issue_2_bits_uop_cf_storeSetHit; // @[XSCore.scala 221:28]
  wire [4:0] memBlock_io_issue_2_bits_uop_cf_ssid; // @[XSCore.scala 221:28]
  wire [2:0] memBlock_io_issue_2_bits_uop_cf_ftqPtr_value; // @[XSCore.scala 221:28]
  wire [2:0] memBlock_io_issue_2_bits_uop_cf_ftqOffset; // @[XSCore.scala 221:28]
  wire [3:0] memBlock_io_issue_2_bits_uop_ctrl_fuType; // @[XSCore.scala 221:28]
  wire [6:0] memBlock_io_issue_2_bits_uop_ctrl_fuOpType; // @[XSCore.scala 221:28]
  wire  memBlock_io_issue_2_bits_uop_ctrl_rfWen; // @[XSCore.scala 221:28]
  wire  memBlock_io_issue_2_bits_uop_ctrl_fpWen; // @[XSCore.scala 221:28]
  wire [19:0] memBlock_io_issue_2_bits_uop_ctrl_imm; // @[XSCore.scala 221:28]
  wire [5:0] memBlock_io_issue_2_bits_uop_pdest; // @[XSCore.scala 221:28]
  wire  memBlock_io_issue_2_bits_uop_robIdx_flag; // @[XSCore.scala 221:28]
  wire [4:0] memBlock_io_issue_2_bits_uop_robIdx_value; // @[XSCore.scala 221:28]
  wire  memBlock_io_issue_2_bits_uop_sqIdx_flag; // @[XSCore.scala 221:28]
  wire [3:0] memBlock_io_issue_2_bits_uop_sqIdx_value; // @[XSCore.scala 221:28]
  wire [63:0] memBlock_io_issue_2_bits_src_0; // @[XSCore.scala 221:28]
  wire  memBlock_io_issue_3_ready; // @[XSCore.scala 221:28]
  wire  memBlock_io_issue_3_valid; // @[XSCore.scala 221:28]
  wire  memBlock_io_issue_3_bits_uop_cf_trigger_backendEn_0; // @[XSCore.scala 221:28]
  wire  memBlock_io_issue_3_bits_uop_cf_trigger_backendEn_1; // @[XSCore.scala 221:28]
  wire  memBlock_io_issue_3_bits_uop_cf_storeSetHit; // @[XSCore.scala 221:28]
  wire [4:0] memBlock_io_issue_3_bits_uop_cf_ssid; // @[XSCore.scala 221:28]
  wire [2:0] memBlock_io_issue_3_bits_uop_cf_ftqPtr_value; // @[XSCore.scala 221:28]
  wire [2:0] memBlock_io_issue_3_bits_uop_cf_ftqOffset; // @[XSCore.scala 221:28]
  wire [3:0] memBlock_io_issue_3_bits_uop_ctrl_fuType; // @[XSCore.scala 221:28]
  wire [6:0] memBlock_io_issue_3_bits_uop_ctrl_fuOpType; // @[XSCore.scala 221:28]
  wire  memBlock_io_issue_3_bits_uop_ctrl_rfWen; // @[XSCore.scala 221:28]
  wire  memBlock_io_issue_3_bits_uop_ctrl_fpWen; // @[XSCore.scala 221:28]
  wire [19:0] memBlock_io_issue_3_bits_uop_ctrl_imm; // @[XSCore.scala 221:28]
  wire [5:0] memBlock_io_issue_3_bits_uop_pdest; // @[XSCore.scala 221:28]
  wire  memBlock_io_issue_3_bits_uop_robIdx_flag; // @[XSCore.scala 221:28]
  wire [4:0] memBlock_io_issue_3_bits_uop_robIdx_value; // @[XSCore.scala 221:28]
  wire  memBlock_io_issue_3_bits_uop_sqIdx_flag; // @[XSCore.scala 221:28]
  wire [3:0] memBlock_io_issue_3_bits_uop_sqIdx_value; // @[XSCore.scala 221:28]
  wire [63:0] memBlock_io_issue_3_bits_src_0; // @[XSCore.scala 221:28]
  wire  memBlock_io_issue_4_ready; // @[XSCore.scala 221:28]
  wire  memBlock_io_issue_4_valid; // @[XSCore.scala 221:28]
  wire [3:0] memBlock_io_issue_4_bits_uop_ctrl_fuType; // @[XSCore.scala 221:28]
  wire [6:0] memBlock_io_issue_4_bits_uop_ctrl_fuOpType; // @[XSCore.scala 221:28]
  wire  memBlock_io_issue_4_bits_uop_robIdx_flag; // @[XSCore.scala 221:28]
  wire [4:0] memBlock_io_issue_4_bits_uop_robIdx_value; // @[XSCore.scala 221:28]
  wire  memBlock_io_issue_4_bits_uop_sqIdx_flag; // @[XSCore.scala 221:28]
  wire [3:0] memBlock_io_issue_4_bits_uop_sqIdx_value; // @[XSCore.scala 221:28]
  wire [63:0] memBlock_io_issue_4_bits_src_0; // @[XSCore.scala 221:28]
  wire  memBlock_io_issue_5_ready; // @[XSCore.scala 221:28]
  wire  memBlock_io_issue_5_valid; // @[XSCore.scala 221:28]
  wire [3:0] memBlock_io_issue_5_bits_uop_ctrl_fuType; // @[XSCore.scala 221:28]
  wire [6:0] memBlock_io_issue_5_bits_uop_ctrl_fuOpType; // @[XSCore.scala 221:28]
  wire  memBlock_io_issue_5_bits_uop_robIdx_flag; // @[XSCore.scala 221:28]
  wire [4:0] memBlock_io_issue_5_bits_uop_robIdx_value; // @[XSCore.scala 221:28]
  wire  memBlock_io_issue_5_bits_uop_sqIdx_flag; // @[XSCore.scala 221:28]
  wire [3:0] memBlock_io_issue_5_bits_uop_sqIdx_value; // @[XSCore.scala 221:28]
  wire [63:0] memBlock_io_issue_5_bits_src_0; // @[XSCore.scala 221:28]
  wire [1:0] memBlock_io_loadFastMatch_0; // @[XSCore.scala 221:28]
  wire [1:0] memBlock_io_loadFastMatch_1; // @[XSCore.scala 221:28]
  wire [11:0] memBlock_io_loadFastImm_0; // @[XSCore.scala 221:28]
  wire [11:0] memBlock_io_loadFastImm_1; // @[XSCore.scala 221:28]
  wire  memBlock_io_rsfeedback_0_feedbackSlow_valid; // @[XSCore.scala 221:28]
  wire [3:0] memBlock_io_rsfeedback_0_feedbackSlow_bits_rsIdx; // @[XSCore.scala 221:28]
  wire  memBlock_io_rsfeedback_0_feedbackSlow_bits_hit; // @[XSCore.scala 221:28]
  wire [3:0] memBlock_io_rsfeedback_0_rsIdx; // @[XSCore.scala 221:28]
  wire  memBlock_io_rsfeedback_1_feedbackSlow_valid; // @[XSCore.scala 221:28]
  wire [3:0] memBlock_io_rsfeedback_1_feedbackSlow_bits_rsIdx; // @[XSCore.scala 221:28]
  wire  memBlock_io_rsfeedback_1_feedbackSlow_bits_hit; // @[XSCore.scala 221:28]
  wire [3:0] memBlock_io_rsfeedback_1_rsIdx; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_0_ready; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_0_valid; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_0_bits_uop_cf_exceptionVec_4; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_0_bits_uop_cf_exceptionVec_5; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_0_bits_uop_cf_exceptionVec_13; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_0_bits_uop_cf_trigger_backendEn_1; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_0_bits_uop_cf_trigger_backendHit_0; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_0_bits_uop_cf_trigger_backendHit_1; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_0_bits_uop_cf_trigger_backendHit_2; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_0_bits_uop_cf_trigger_backendHit_3; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_0_bits_uop_cf_trigger_backendHit_4; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_0_bits_uop_cf_trigger_backendHit_5; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_0_bits_uop_ctrl_rfWen; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_0_bits_uop_ctrl_fpWen; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_0_bits_uop_ctrl_flushPipe; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_0_bits_uop_ctrl_replayInst; // @[XSCore.scala 221:28]
  wire [5:0] memBlock_io_writeback_0_bits_uop_pdest; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_0_bits_uop_robIdx_flag; // @[XSCore.scala 221:28]
  wire [4:0] memBlock_io_writeback_0_bits_uop_robIdx_value; // @[XSCore.scala 221:28]
  wire [63:0] memBlock_io_writeback_0_bits_data; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_0_bits_debug_isMMIO; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_1_ready; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_1_valid; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_1_bits_uop_cf_exceptionVec_4; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_1_bits_uop_cf_exceptionVec_5; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_1_bits_uop_cf_exceptionVec_13; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_1_bits_uop_cf_trigger_backendEn_1; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_1_bits_uop_cf_trigger_backendHit_0; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_1_bits_uop_cf_trigger_backendHit_1; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_1_bits_uop_cf_trigger_backendHit_2; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_1_bits_uop_cf_trigger_backendHit_3; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_1_bits_uop_cf_trigger_backendHit_4; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_1_bits_uop_cf_trigger_backendHit_5; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_1_bits_uop_ctrl_rfWen; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_1_bits_uop_ctrl_fpWen; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_1_bits_uop_ctrl_flushPipe; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_1_bits_uop_ctrl_replayInst; // @[XSCore.scala 221:28]
  wire [5:0] memBlock_io_writeback_1_bits_uop_pdest; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_1_bits_uop_robIdx_flag; // @[XSCore.scala 221:28]
  wire [4:0] memBlock_io_writeback_1_bits_uop_robIdx_value; // @[XSCore.scala 221:28]
  wire [63:0] memBlock_io_writeback_1_bits_data; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_1_bits_debug_isMMIO; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_2_ready; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_2_valid; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_2_bits_uop_cf_exceptionVec_4; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_2_bits_uop_cf_exceptionVec_5; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_2_bits_uop_cf_exceptionVec_6; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_2_bits_uop_cf_exceptionVec_7; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_2_bits_uop_cf_exceptionVec_13; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_2_bits_uop_cf_exceptionVec_15; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_2_bits_uop_cf_trigger_backendEn_0; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_2_bits_uop_cf_trigger_backendHit_0; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_2_bits_uop_cf_trigger_backendHit_1; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_2_bits_uop_cf_trigger_backendHit_2; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_2_bits_uop_cf_trigger_backendHit_3; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_2_bits_uop_cf_trigger_backendHit_4; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_2_bits_uop_cf_trigger_backendHit_5; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_2_bits_uop_robIdx_flag; // @[XSCore.scala 221:28]
  wire [4:0] memBlock_io_writeback_2_bits_uop_robIdx_value; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_2_bits_debug_isMMIO; // @[XSCore.scala 221:28]
  wire [38:0] memBlock_io_writeback_2_bits_debug_vaddr; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_3_ready; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_3_valid; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_3_bits_uop_cf_exceptionVec_6; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_3_bits_uop_cf_exceptionVec_7; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_3_bits_uop_cf_exceptionVec_15; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_3_bits_uop_cf_trigger_backendEn_0; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_3_bits_uop_cf_trigger_backendHit_0; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_3_bits_uop_cf_trigger_backendHit_1; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_3_bits_uop_cf_trigger_backendHit_4; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_3_bits_uop_robIdx_flag; // @[XSCore.scala 221:28]
  wire [4:0] memBlock_io_writeback_3_bits_uop_robIdx_value; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_3_bits_debug_isMMIO; // @[XSCore.scala 221:28]
  wire [38:0] memBlock_io_writeback_3_bits_debug_vaddr; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_4_valid; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_4_bits_uop_robIdx_flag; // @[XSCore.scala 221:28]
  wire [4:0] memBlock_io_writeback_4_bits_uop_robIdx_value; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_5_valid; // @[XSCore.scala 221:28]
  wire  memBlock_io_writeback_5_bits_uop_robIdx_flag; // @[XSCore.scala 221:28]
  wire [4:0] memBlock_io_writeback_5_bits_uop_robIdx_value; // @[XSCore.scala 221:28]
  wire  memBlock_io_stIn_0_valid; // @[XSCore.scala 221:28]
  wire  memBlock_io_stIn_0_bits_uop_cf_storeSetHit; // @[XSCore.scala 221:28]
  wire [4:0] memBlock_io_stIn_0_bits_uop_cf_ssid; // @[XSCore.scala 221:28]
  wire [4:0] memBlock_io_stIn_0_bits_uop_robIdx_value; // @[XSCore.scala 221:28]
  wire  memBlock_io_stIn_1_valid; // @[XSCore.scala 221:28]
  wire  memBlock_io_stIn_1_bits_uop_cf_storeSetHit; // @[XSCore.scala 221:28]
  wire [4:0] memBlock_io_stIn_1_bits_uop_cf_ssid; // @[XSCore.scala 221:28]
  wire [4:0] memBlock_io_stIn_1_bits_uop_robIdx_value; // @[XSCore.scala 221:28]
  wire  memBlock_io_memoryViolation_valid; // @[XSCore.scala 221:28]
  wire  memBlock_io_memoryViolation_bits_robIdx_flag; // @[XSCore.scala 221:28]
  wire [4:0] memBlock_io_memoryViolation_bits_robIdx_value; // @[XSCore.scala 221:28]
  wire  memBlock_io_memoryViolation_bits_ftqIdx_flag; // @[XSCore.scala 221:28]
  wire [2:0] memBlock_io_memoryViolation_bits_ftqIdx_value; // @[XSCore.scala 221:28]
  wire [2:0] memBlock_io_memoryViolation_bits_ftqOffset; // @[XSCore.scala 221:28]
  wire [2:0] memBlock_io_memoryViolation_bits_stFtqIdx_value; // @[XSCore.scala 221:28]
  wire [2:0] memBlock_io_memoryViolation_bits_stFtqOffset; // @[XSCore.scala 221:28]
  wire  memBlock_io_ptw_req_0_valid; // @[XSCore.scala 221:28]
  wire [26:0] memBlock_io_ptw_req_0_bits_vpn; // @[XSCore.scala 221:28]
  wire  memBlock_io_ptw_req_1_valid; // @[XSCore.scala 221:28]
  wire [26:0] memBlock_io_ptw_req_1_bits_vpn; // @[XSCore.scala 221:28]
  wire  memBlock_io_ptw_req_2_valid; // @[XSCore.scala 221:28]
  wire [26:0] memBlock_io_ptw_req_2_bits_vpn; // @[XSCore.scala 221:28]
  wire  memBlock_io_ptw_req_3_valid; // @[XSCore.scala 221:28]
  wire [26:0] memBlock_io_ptw_req_3_bits_vpn; // @[XSCore.scala 221:28]
  wire  memBlock_io_ptw_resp_valid; // @[XSCore.scala 221:28]
  wire [26:0] memBlock_io_ptw_resp_bits_data_entry_tag; // @[XSCore.scala 221:28]
  wire [15:0] memBlock_io_ptw_resp_bits_data_entry_asid; // @[XSCore.scala 221:28]
  wire [23:0] memBlock_io_ptw_resp_bits_data_entry_ppn; // @[XSCore.scala 221:28]
  wire  memBlock_io_ptw_resp_bits_data_entry_perm_d; // @[XSCore.scala 221:28]
  wire  memBlock_io_ptw_resp_bits_data_entry_perm_a; // @[XSCore.scala 221:28]
  wire  memBlock_io_ptw_resp_bits_data_entry_perm_g; // @[XSCore.scala 221:28]
  wire  memBlock_io_ptw_resp_bits_data_entry_perm_u; // @[XSCore.scala 221:28]
  wire  memBlock_io_ptw_resp_bits_data_entry_perm_x; // @[XSCore.scala 221:28]
  wire  memBlock_io_ptw_resp_bits_data_entry_perm_w; // @[XSCore.scala 221:28]
  wire  memBlock_io_ptw_resp_bits_data_entry_perm_r; // @[XSCore.scala 221:28]
  wire [1:0] memBlock_io_ptw_resp_bits_data_entry_level; // @[XSCore.scala 221:28]
  wire  memBlock_io_ptw_resp_bits_data_pf; // @[XSCore.scala 221:28]
  wire  memBlock_io_ptw_resp_bits_data_af; // @[XSCore.scala 221:28]
  wire  memBlock_io_ptw_resp_bits_vector_0; // @[XSCore.scala 221:28]
  wire  memBlock_io_ptw_resp_bits_vector_1; // @[XSCore.scala 221:28]
  wire  memBlock_io_ptw_resp_bits_vector_2; // @[XSCore.scala 221:28]
  wire  memBlock_io_ptw_resp_bits_vector_3; // @[XSCore.scala 221:28]
  wire  memBlock_io_ptw_resp_bits_vector_4; // @[XSCore.scala 221:28]
  wire  memBlock_io_sfence_valid; // @[XSCore.scala 221:28]
  wire  memBlock_io_sfence_bits_rs1; // @[XSCore.scala 221:28]
  wire  memBlock_io_sfence_bits_rs2; // @[XSCore.scala 221:28]
  wire [38:0] memBlock_io_sfence_bits_addr; // @[XSCore.scala 221:28]
  wire [15:0] memBlock_io_sfence_bits_asid; // @[XSCore.scala 221:28]
  wire [3:0] memBlock_io_tlbCsr_satp_mode; // @[XSCore.scala 221:28]
  wire [15:0] memBlock_io_tlbCsr_satp_asid; // @[XSCore.scala 221:28]
  wire  memBlock_io_tlbCsr_satp_changed; // @[XSCore.scala 221:28]
  wire  memBlock_io_tlbCsr_priv_mxr; // @[XSCore.scala 221:28]
  wire  memBlock_io_tlbCsr_priv_sum; // @[XSCore.scala 221:28]
  wire [1:0] memBlock_io_tlbCsr_priv_dmode; // @[XSCore.scala 221:28]
  wire  memBlock_io_fenceToSbuffer_flushSb; // @[XSCore.scala 221:28]
  wire  memBlock_io_fenceToSbuffer_sbIsEmpty; // @[XSCore.scala 221:28]
  wire [1:0] memBlock_io_enqLsq_needAlloc_0; // @[XSCore.scala 221:28]
  wire [1:0] memBlock_io_enqLsq_needAlloc_1; // @[XSCore.scala 221:28]
  wire [1:0] memBlock_io_enqLsq_needAlloc_2; // @[XSCore.scala 221:28]
  wire [1:0] memBlock_io_enqLsq_needAlloc_3; // @[XSCore.scala 221:28]
  wire  memBlock_io_enqLsq_req_0_valid; // @[XSCore.scala 221:28]
  wire  memBlock_io_enqLsq_req_0_bits_cf_trigger_backendEn_0; // @[XSCore.scala 221:28]
  wire  memBlock_io_enqLsq_req_0_bits_cf_trigger_backendEn_1; // @[XSCore.scala 221:28]
  wire [6:0] memBlock_io_enqLsq_req_0_bits_ctrl_fuOpType; // @[XSCore.scala 221:28]
  wire  memBlock_io_enqLsq_req_0_bits_ctrl_rfWen; // @[XSCore.scala 221:28]
  wire  memBlock_io_enqLsq_req_0_bits_ctrl_fpWen; // @[XSCore.scala 221:28]
  wire  memBlock_io_enqLsq_req_0_bits_ctrl_flushPipe; // @[XSCore.scala 221:28]
  wire  memBlock_io_enqLsq_req_0_bits_ctrl_replayInst; // @[XSCore.scala 221:28]
  wire [5:0] memBlock_io_enqLsq_req_0_bits_pdest; // @[XSCore.scala 221:28]
  wire  memBlock_io_enqLsq_req_0_bits_robIdx_flag; // @[XSCore.scala 221:28]
  wire [4:0] memBlock_io_enqLsq_req_0_bits_robIdx_value; // @[XSCore.scala 221:28]
  wire [3:0] memBlock_io_enqLsq_req_0_bits_lqIdx_value; // @[XSCore.scala 221:28]
  wire [3:0] memBlock_io_enqLsq_req_0_bits_sqIdx_value; // @[XSCore.scala 221:28]
  wire  memBlock_io_enqLsq_req_1_valid; // @[XSCore.scala 221:28]
  wire  memBlock_io_enqLsq_req_1_bits_cf_trigger_backendEn_0; // @[XSCore.scala 221:28]
  wire  memBlock_io_enqLsq_req_1_bits_cf_trigger_backendEn_1; // @[XSCore.scala 221:28]
  wire [6:0] memBlock_io_enqLsq_req_1_bits_ctrl_fuOpType; // @[XSCore.scala 221:28]
  wire  memBlock_io_enqLsq_req_1_bits_ctrl_rfWen; // @[XSCore.scala 221:28]
  wire  memBlock_io_enqLsq_req_1_bits_ctrl_fpWen; // @[XSCore.scala 221:28]
  wire  memBlock_io_enqLsq_req_1_bits_ctrl_flushPipe; // @[XSCore.scala 221:28]
  wire  memBlock_io_enqLsq_req_1_bits_ctrl_replayInst; // @[XSCore.scala 221:28]
  wire [5:0] memBlock_io_enqLsq_req_1_bits_pdest; // @[XSCore.scala 221:28]
  wire  memBlock_io_enqLsq_req_1_bits_robIdx_flag; // @[XSCore.scala 221:28]
  wire [4:0] memBlock_io_enqLsq_req_1_bits_robIdx_value; // @[XSCore.scala 221:28]
  wire [3:0] memBlock_io_enqLsq_req_1_bits_lqIdx_value; // @[XSCore.scala 221:28]
  wire [3:0] memBlock_io_enqLsq_req_1_bits_sqIdx_value; // @[XSCore.scala 221:28]
  wire  memBlock_io_enqLsq_req_2_valid; // @[XSCore.scala 221:28]
  wire  memBlock_io_enqLsq_req_2_bits_cf_trigger_backendEn_0; // @[XSCore.scala 221:28]
  wire  memBlock_io_enqLsq_req_2_bits_cf_trigger_backendEn_1; // @[XSCore.scala 221:28]
  wire [6:0] memBlock_io_enqLsq_req_2_bits_ctrl_fuOpType; // @[XSCore.scala 221:28]
  wire  memBlock_io_enqLsq_req_2_bits_ctrl_rfWen; // @[XSCore.scala 221:28]
  wire  memBlock_io_enqLsq_req_2_bits_ctrl_fpWen; // @[XSCore.scala 221:28]
  wire  memBlock_io_enqLsq_req_2_bits_ctrl_flushPipe; // @[XSCore.scala 221:28]
  wire  memBlock_io_enqLsq_req_2_bits_ctrl_replayInst; // @[XSCore.scala 221:28]
  wire [5:0] memBlock_io_enqLsq_req_2_bits_pdest; // @[XSCore.scala 221:28]
  wire  memBlock_io_enqLsq_req_2_bits_robIdx_flag; // @[XSCore.scala 221:28]
  wire [4:0] memBlock_io_enqLsq_req_2_bits_robIdx_value; // @[XSCore.scala 221:28]
  wire [3:0] memBlock_io_enqLsq_req_2_bits_lqIdx_value; // @[XSCore.scala 221:28]
  wire [3:0] memBlock_io_enqLsq_req_2_bits_sqIdx_value; // @[XSCore.scala 221:28]
  wire  memBlock_io_enqLsq_req_3_valid; // @[XSCore.scala 221:28]
  wire  memBlock_io_enqLsq_req_3_bits_cf_trigger_backendEn_0; // @[XSCore.scala 221:28]
  wire  memBlock_io_enqLsq_req_3_bits_cf_trigger_backendEn_1; // @[XSCore.scala 221:28]
  wire [6:0] memBlock_io_enqLsq_req_3_bits_ctrl_fuOpType; // @[XSCore.scala 221:28]
  wire  memBlock_io_enqLsq_req_3_bits_ctrl_rfWen; // @[XSCore.scala 221:28]
  wire  memBlock_io_enqLsq_req_3_bits_ctrl_fpWen; // @[XSCore.scala 221:28]
  wire  memBlock_io_enqLsq_req_3_bits_ctrl_flushPipe; // @[XSCore.scala 221:28]
  wire  memBlock_io_enqLsq_req_3_bits_ctrl_replayInst; // @[XSCore.scala 221:28]
  wire [5:0] memBlock_io_enqLsq_req_3_bits_pdest; // @[XSCore.scala 221:28]
  wire  memBlock_io_enqLsq_req_3_bits_robIdx_flag; // @[XSCore.scala 221:28]
  wire [4:0] memBlock_io_enqLsq_req_3_bits_robIdx_value; // @[XSCore.scala 221:28]
  wire [3:0] memBlock_io_enqLsq_req_3_bits_lqIdx_value; // @[XSCore.scala 221:28]
  wire [3:0] memBlock_io_enqLsq_req_3_bits_sqIdx_value; // @[XSCore.scala 221:28]
  wire  memBlock_io_lsqio_exceptionAddr_isStore; // @[XSCore.scala 221:28]
  wire [38:0] memBlock_io_lsqio_exceptionAddr_vaddr; // @[XSCore.scala 221:28]
  wire [1:0] memBlock_io_lsqio_rob_scommit; // @[XSCore.scala 221:28]
  wire  memBlock_io_lsqio_rob_pendingld; // @[XSCore.scala 221:28]
  wire  memBlock_io_lsqio_rob_pendingst; // @[XSCore.scala 221:28]
  wire  memBlock_io_lsqio_rob_commit; // @[XSCore.scala 221:28]
  wire  memBlock_io_lsqio_rob_isMMIO_0; // @[XSCore.scala 221:28]
  wire  memBlock_io_lsqio_rob_isMMIO_1; // @[XSCore.scala 221:28]
  wire [4:0] memBlock_io_lsqio_rob_uop_0_robIdx_value; // @[XSCore.scala 221:28]
  wire [4:0] memBlock_io_lsqio_rob_uop_1_robIdx_value; // @[XSCore.scala 221:28]
  wire  memBlock_io_csrCtrl_icache_parity_enable; // @[XSCore.scala 221:28]
  wire  memBlock_io_csrCtrl_lvpred_disable; // @[XSCore.scala 221:28]
  wire  memBlock_io_csrCtrl_no_spec_load; // @[XSCore.scala 221:28]
  wire  memBlock_io_csrCtrl_storeset_wait_store; // @[XSCore.scala 221:28]
  wire [4:0] memBlock_io_csrCtrl_lvpred_timeout; // @[XSCore.scala 221:28]
  wire  memBlock_io_csrCtrl_bp_ctrl_ubtb_enable; // @[XSCore.scala 221:28]
  wire  memBlock_io_csrCtrl_bp_ctrl_btb_enable; // @[XSCore.scala 221:28]
  wire  memBlock_io_csrCtrl_bp_ctrl_tage_enable; // @[XSCore.scala 221:28]
  wire  memBlock_io_csrCtrl_bp_ctrl_sc_enable; // @[XSCore.scala 221:28]
  wire  memBlock_io_csrCtrl_bp_ctrl_ras_enable; // @[XSCore.scala 221:28]
  wire [3:0] memBlock_io_csrCtrl_sbuffer_threshold; // @[XSCore.scala 221:28]
  wire  memBlock_io_csrCtrl_ldld_vio_check_enable; // @[XSCore.scala 221:28]
  wire  memBlock_io_csrCtrl_cache_error_enable; // @[XSCore.scala 221:28]
  wire  memBlock_io_csrCtrl_uncache_write_outstanding_enable; // @[XSCore.scala 221:28]
  wire  memBlock_io_csrCtrl_fusion_enable; // @[XSCore.scala 221:28]
  wire  memBlock_io_csrCtrl_wfi_enable; // @[XSCore.scala 221:28]
  wire  memBlock_io_csrCtrl_svinval_enable; // @[XSCore.scala 221:28]
  wire  memBlock_io_csrCtrl_distribute_csr_wvalid; // @[XSCore.scala 221:28]
  wire [11:0] memBlock_io_csrCtrl_distribute_csr_waddr; // @[XSCore.scala 221:28]
  wire [63:0] memBlock_io_csrCtrl_distribute_csr_wdata; // @[XSCore.scala 221:28]
  wire  memBlock_io_csrCtrl_singlestep; // @[XSCore.scala 221:28]
  wire  memBlock_io_csrCtrl_frontend_trigger_t_valid; // @[XSCore.scala 221:28]
  wire [1:0] memBlock_io_csrCtrl_frontend_trigger_t_bits_addr; // @[XSCore.scala 221:28]
  wire [1:0] memBlock_io_csrCtrl_frontend_trigger_t_bits_tdata_matchType; // @[XSCore.scala 221:28]
  wire  memBlock_io_csrCtrl_frontend_trigger_t_bits_tdata_select; // @[XSCore.scala 221:28]
  wire  memBlock_io_csrCtrl_frontend_trigger_t_bits_tdata_timing; // @[XSCore.scala 221:28]
  wire  memBlock_io_csrCtrl_frontend_trigger_t_bits_tdata_chain; // @[XSCore.scala 221:28]
  wire [63:0] memBlock_io_csrCtrl_frontend_trigger_t_bits_tdata_tdata2; // @[XSCore.scala 221:28]
  wire  memBlock_io_csrCtrl_mem_trigger_t_valid; // @[XSCore.scala 221:28]
  wire [2:0] memBlock_io_csrCtrl_mem_trigger_t_bits_addr; // @[XSCore.scala 221:28]
  wire [1:0] memBlock_io_csrCtrl_mem_trigger_t_bits_tdata_matchType; // @[XSCore.scala 221:28]
  wire  memBlock_io_csrCtrl_mem_trigger_t_bits_tdata_select; // @[XSCore.scala 221:28]
  wire  memBlock_io_csrCtrl_mem_trigger_t_bits_tdata_chain; // @[XSCore.scala 221:28]
  wire [63:0] memBlock_io_csrCtrl_mem_trigger_t_bits_tdata_tdata2; // @[XSCore.scala 221:28]
  wire  memBlock_io_csrCtrl_trigger_enable_0; // @[XSCore.scala 221:28]
  wire  memBlock_io_csrCtrl_trigger_enable_1; // @[XSCore.scala 221:28]
  wire  memBlock_io_csrCtrl_trigger_enable_2; // @[XSCore.scala 221:28]
  wire  memBlock_io_csrCtrl_trigger_enable_3; // @[XSCore.scala 221:28]
  wire  memBlock_io_csrCtrl_trigger_enable_4; // @[XSCore.scala 221:28]
  wire  memBlock_io_csrCtrl_trigger_enable_5; // @[XSCore.scala 221:28]
  wire  memBlock_io_csrCtrl_trigger_enable_6; // @[XSCore.scala 221:28]
  wire  memBlock_io_csrCtrl_trigger_enable_7; // @[XSCore.scala 221:28]
  wire  memBlock_io_csrCtrl_trigger_enable_8; // @[XSCore.scala 221:28]
  wire  memBlock_io_csrCtrl_trigger_enable_9; // @[XSCore.scala 221:28]
  wire  memBlock_io_csrUpdate_wvalid; // @[XSCore.scala 221:28]
  wire [11:0] memBlock_io_csrUpdate_waddr; // @[XSCore.scala 221:28]
  wire [63:0] memBlock_io_csrUpdate_wdata; // @[XSCore.scala 221:28]
  wire [35:0] memBlock_io_error_paddr; // @[XSCore.scala 221:28]
  wire  memBlock_io_error_report_to_beu; // @[XSCore.scala 221:28]
  wire [5:0] memBlock_io_perfEventsPTW_0_value; // @[XSCore.scala 221:28]
  wire [5:0] memBlock_io_perfEventsPTW_1_value; // @[XSCore.scala 221:28]
  wire [5:0] memBlock_io_perfEventsPTW_2_value; // @[XSCore.scala 221:28]
  wire [5:0] memBlock_io_perfEventsPTW_3_value; // @[XSCore.scala 221:28]
  wire [5:0] memBlock_io_perfEventsPTW_4_value; // @[XSCore.scala 221:28]
  wire [5:0] memBlock_io_perfEventsPTW_5_value; // @[XSCore.scala 221:28]
  wire [5:0] memBlock_io_perfEventsPTW_6_value; // @[XSCore.scala 221:28]
  wire [5:0] memBlock_io_perfEventsPTW_7_value; // @[XSCore.scala 221:28]
  wire [5:0] memBlock_io_perfEventsPTW_8_value; // @[XSCore.scala 221:28]
  wire [5:0] memBlock_io_perfEventsPTW_9_value; // @[XSCore.scala 221:28]
  wire [5:0] memBlock_io_perfEventsPTW_10_value; // @[XSCore.scala 221:28]
  wire [5:0] memBlock_io_perfEventsPTW_11_value; // @[XSCore.scala 221:28]
  wire [5:0] memBlock_io_perfEventsPTW_12_value; // @[XSCore.scala 221:28]
  wire [5:0] memBlock_io_perfEventsPTW_13_value; // @[XSCore.scala 221:28]
  wire [5:0] memBlock_io_perfEventsPTW_14_value; // @[XSCore.scala 221:28]
  wire [5:0] memBlock_io_perfEventsPTW_15_value; // @[XSCore.scala 221:28]
  wire [5:0] memBlock_io_perfEventsPTW_16_value; // @[XSCore.scala 221:28]
  wire [5:0] memBlock_io_perfEventsPTW_17_value; // @[XSCore.scala 221:28]
  wire [5:0] memBlock_io_perfEventsPTW_18_value; // @[XSCore.scala 221:28]
  wire [4:0] memBlock_io_lqCancelCnt; // @[XSCore.scala 221:28]
  wire [3:0] memBlock_io_sqCancelCnt; // @[XSCore.scala 221:28]
  wire [1:0] memBlock_io_sqDeq; // @[XSCore.scala 221:28]
  wire [1:0] memBlock_io_lqDeq; // @[XSCore.scala 221:28]
  wire [5:0] memBlock_io_perf_0_value; // @[XSCore.scala 221:28]
  wire [5:0] memBlock_io_perf_1_value; // @[XSCore.scala 221:28]
  wire [5:0] memBlock_io_perf_2_value; // @[XSCore.scala 221:28]
  wire [5:0] memBlock_io_perf_3_value; // @[XSCore.scala 221:28]
  wire [5:0] memBlock_io_perf_4_value; // @[XSCore.scala 221:28]
  wire [5:0] memBlock_io_perf_5_value; // @[XSCore.scala 221:28]
  wire [5:0] memBlock_io_perf_6_value; // @[XSCore.scala 221:28]
  wire [5:0] memBlock_io_perf_7_value; // @[XSCore.scala 221:28]
  wire  wb2Ctrl_clock; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_reset; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_redirect_valid; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_redirect_bits_robIdx_flag; // @[XSCore.scala 227:27]
  wire [4:0] wb2Ctrl_io_redirect_bits_robIdx_value; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_redirect_bits_level; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_3_ready; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_3_valid; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_3_bits_uop_cf_exceptionVec_2; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_3_bits_uop_cf_exceptionVec_3; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_3_bits_uop_cf_exceptionVec_8; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_3_bits_uop_cf_exceptionVec_9; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_3_bits_uop_cf_exceptionVec_11; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_3_bits_uop_ctrl_flushPipe; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_3_bits_uop_robIdx_flag; // @[XSCore.scala 227:27]
  wire [4:0] wb2Ctrl_io_in_3_bits_uop_robIdx_value; // @[XSCore.scala 227:27]
  wire [4:0] wb2Ctrl_io_in_3_bits_fflags; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_4_ready; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_4_valid; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_4_bits_uop_robIdx_flag; // @[XSCore.scala 227:27]
  wire [4:0] wb2Ctrl_io_in_4_bits_uop_robIdx_value; // @[XSCore.scala 227:27]
  wire [4:0] wb2Ctrl_io_in_4_bits_fflags; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_5_ready; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_5_valid; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_5_bits_uop_robIdx_flag; // @[XSCore.scala 227:27]
  wire [4:0] wb2Ctrl_io_in_5_bits_uop_robIdx_value; // @[XSCore.scala 227:27]
  wire [4:0] wb2Ctrl_io_in_5_bits_fflags; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_6_ready; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_6_valid; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_6_bits_uop_cf_exceptionVec_4; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_6_bits_uop_cf_exceptionVec_5; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_6_bits_uop_cf_exceptionVec_13; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_6_bits_uop_cf_trigger_backendHit_0; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_6_bits_uop_cf_trigger_backendHit_1; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_6_bits_uop_cf_trigger_backendHit_2; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_6_bits_uop_cf_trigger_backendHit_3; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_6_bits_uop_cf_trigger_backendHit_4; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_6_bits_uop_cf_trigger_backendHit_5; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_6_bits_uop_ctrl_flushPipe; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_6_bits_uop_ctrl_replayInst; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_6_bits_uop_robIdx_flag; // @[XSCore.scala 227:27]
  wire [4:0] wb2Ctrl_io_in_6_bits_uop_robIdx_value; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_7_ready; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_7_valid; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_7_bits_uop_cf_exceptionVec_4; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_7_bits_uop_cf_exceptionVec_5; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_7_bits_uop_cf_exceptionVec_13; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_7_bits_uop_cf_trigger_backendHit_0; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_7_bits_uop_cf_trigger_backendHit_1; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_7_bits_uop_cf_trigger_backendHit_2; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_7_bits_uop_cf_trigger_backendHit_3; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_7_bits_uop_cf_trigger_backendHit_4; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_7_bits_uop_cf_trigger_backendHit_5; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_7_bits_uop_ctrl_flushPipe; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_7_bits_uop_ctrl_replayInst; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_7_bits_uop_robIdx_flag; // @[XSCore.scala 227:27]
  wire [4:0] wb2Ctrl_io_in_7_bits_uop_robIdx_value; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_8_ready; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_8_valid; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_8_bits_uop_cf_exceptionVec_4; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_8_bits_uop_cf_exceptionVec_5; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_8_bits_uop_cf_exceptionVec_6; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_8_bits_uop_cf_exceptionVec_7; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_8_bits_uop_cf_exceptionVec_13; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_8_bits_uop_cf_exceptionVec_15; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_8_bits_uop_cf_trigger_backendHit_0; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_8_bits_uop_cf_trigger_backendHit_1; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_8_bits_uop_cf_trigger_backendHit_2; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_8_bits_uop_cf_trigger_backendHit_3; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_8_bits_uop_cf_trigger_backendHit_4; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_8_bits_uop_cf_trigger_backendHit_5; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_8_bits_uop_robIdx_flag; // @[XSCore.scala 227:27]
  wire [4:0] wb2Ctrl_io_in_8_bits_uop_robIdx_value; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_9_ready; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_9_valid; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_9_bits_uop_cf_exceptionVec_6; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_9_bits_uop_cf_exceptionVec_7; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_9_bits_uop_cf_exceptionVec_15; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_9_bits_uop_cf_trigger_backendHit_0; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_9_bits_uop_cf_trigger_backendHit_1; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_9_bits_uop_cf_trigger_backendHit_4; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_in_9_bits_uop_robIdx_flag; // @[XSCore.scala 227:27]
  wire [4:0] wb2Ctrl_io_in_9_bits_uop_robIdx_value; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_3_valid; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_3_bits_uop_cf_exceptionVec_2; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_3_bits_uop_cf_exceptionVec_3; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_3_bits_uop_cf_exceptionVec_8; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_3_bits_uop_cf_exceptionVec_9; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_3_bits_uop_cf_exceptionVec_11; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_3_bits_uop_ctrl_flushPipe; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_3_bits_uop_robIdx_flag; // @[XSCore.scala 227:27]
  wire [4:0] wb2Ctrl_io_out_3_bits_uop_robIdx_value; // @[XSCore.scala 227:27]
  wire [4:0] wb2Ctrl_io_out_3_bits_fflags; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_4_valid; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_4_bits_uop_robIdx_flag; // @[XSCore.scala 227:27]
  wire [4:0] wb2Ctrl_io_out_4_bits_uop_robIdx_value; // @[XSCore.scala 227:27]
  wire [4:0] wb2Ctrl_io_out_4_bits_fflags; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_5_valid; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_5_bits_uop_robIdx_flag; // @[XSCore.scala 227:27]
  wire [4:0] wb2Ctrl_io_out_5_bits_uop_robIdx_value; // @[XSCore.scala 227:27]
  wire [4:0] wb2Ctrl_io_out_5_bits_fflags; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_6_valid; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_6_bits_uop_cf_exceptionVec_4; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_6_bits_uop_cf_exceptionVec_5; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_6_bits_uop_cf_exceptionVec_13; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_6_bits_uop_cf_trigger_backendHit_0; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_6_bits_uop_cf_trigger_backendHit_1; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_6_bits_uop_cf_trigger_backendHit_2; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_6_bits_uop_cf_trigger_backendHit_3; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_6_bits_uop_cf_trigger_backendHit_4; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_6_bits_uop_cf_trigger_backendHit_5; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_6_bits_uop_ctrl_flushPipe; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_6_bits_uop_ctrl_replayInst; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_6_bits_uop_robIdx_flag; // @[XSCore.scala 227:27]
  wire [4:0] wb2Ctrl_io_out_6_bits_uop_robIdx_value; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_7_valid; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_7_bits_uop_cf_exceptionVec_4; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_7_bits_uop_cf_exceptionVec_5; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_7_bits_uop_cf_exceptionVec_13; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_7_bits_uop_cf_trigger_backendHit_0; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_7_bits_uop_cf_trigger_backendHit_1; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_7_bits_uop_cf_trigger_backendHit_2; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_7_bits_uop_cf_trigger_backendHit_3; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_7_bits_uop_cf_trigger_backendHit_4; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_7_bits_uop_cf_trigger_backendHit_5; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_7_bits_uop_ctrl_flushPipe; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_7_bits_uop_ctrl_replayInst; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_7_bits_uop_robIdx_flag; // @[XSCore.scala 227:27]
  wire [4:0] wb2Ctrl_io_out_7_bits_uop_robIdx_value; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_8_valid; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_8_bits_uop_cf_exceptionVec_4; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_8_bits_uop_cf_exceptionVec_5; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_8_bits_uop_cf_exceptionVec_6; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_8_bits_uop_cf_exceptionVec_7; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_8_bits_uop_cf_exceptionVec_13; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_8_bits_uop_cf_exceptionVec_15; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_8_bits_uop_cf_trigger_backendHit_0; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_8_bits_uop_cf_trigger_backendHit_1; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_8_bits_uop_cf_trigger_backendHit_2; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_8_bits_uop_cf_trigger_backendHit_3; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_8_bits_uop_cf_trigger_backendHit_4; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_8_bits_uop_cf_trigger_backendHit_5; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_8_bits_uop_robIdx_flag; // @[XSCore.scala 227:27]
  wire [4:0] wb2Ctrl_io_out_8_bits_uop_robIdx_value; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_9_valid; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_9_bits_uop_cf_exceptionVec_6; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_9_bits_uop_cf_exceptionVec_7; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_9_bits_uop_cf_exceptionVec_15; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_9_bits_uop_cf_trigger_backendHit_0; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_9_bits_uop_cf_trigger_backendHit_1; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_9_bits_uop_cf_trigger_backendHit_4; // @[XSCore.scala 227:27]
  wire  wb2Ctrl_io_out_9_bits_uop_robIdx_flag; // @[XSCore.scala 227:27]
  wire [4:0] wb2Ctrl_io_out_9_bits_uop_robIdx_value; // @[XSCore.scala 227:27]
  wire  ctrlBlock_clock; // @[XSCore.scala 230:29]
  wire  ctrlBlock_reset; // @[XSCore.scala 230:29]
  wire [7:0] ctrlBlock_io_hartId; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_cpu_halt; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_frontend_cfVec_0_ready; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_frontend_cfVec_0_valid; // @[XSCore.scala 230:29]
  wire [31:0] ctrlBlock_io_frontend_cfVec_0_bits_instr; // @[XSCore.scala 230:29]
  wire [9:0] ctrlBlock_io_frontend_cfVec_0_bits_foldpc; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_frontend_cfVec_0_bits_exceptionVec_1; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_frontend_cfVec_0_bits_exceptionVec_12; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_frontend_cfVec_0_bits_trigger_frontendHit_0; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_frontend_cfVec_0_bits_trigger_frontendHit_1; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_frontend_cfVec_0_bits_trigger_frontendHit_2; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_frontend_cfVec_0_bits_trigger_frontendHit_3; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_frontend_cfVec_0_bits_trigger_backendEn_0; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_frontend_cfVec_0_bits_trigger_backendEn_1; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_frontend_cfVec_0_bits_pd_isRVC; // @[XSCore.scala 230:29]
  wire [1:0] ctrlBlock_io_frontend_cfVec_0_bits_pd_brType; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_frontend_cfVec_0_bits_pd_isCall; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_frontend_cfVec_0_bits_pd_isRet; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_frontend_cfVec_0_bits_pred_taken; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_frontend_cfVec_0_bits_crossPageIPFFix; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_frontend_cfVec_0_bits_ftqPtr_flag; // @[XSCore.scala 230:29]
  wire [2:0] ctrlBlock_io_frontend_cfVec_0_bits_ftqPtr_value; // @[XSCore.scala 230:29]
  wire [2:0] ctrlBlock_io_frontend_cfVec_0_bits_ftqOffset; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_frontend_cfVec_1_ready; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_frontend_cfVec_1_valid; // @[XSCore.scala 230:29]
  wire [31:0] ctrlBlock_io_frontend_cfVec_1_bits_instr; // @[XSCore.scala 230:29]
  wire [9:0] ctrlBlock_io_frontend_cfVec_1_bits_foldpc; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_frontend_cfVec_1_bits_exceptionVec_1; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_frontend_cfVec_1_bits_exceptionVec_12; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_frontend_cfVec_1_bits_trigger_frontendHit_0; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_frontend_cfVec_1_bits_trigger_frontendHit_1; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_frontend_cfVec_1_bits_trigger_frontendHit_2; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_frontend_cfVec_1_bits_trigger_frontendHit_3; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_frontend_cfVec_1_bits_trigger_backendEn_0; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_frontend_cfVec_1_bits_trigger_backendEn_1; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_frontend_cfVec_1_bits_pd_isRVC; // @[XSCore.scala 230:29]
  wire [1:0] ctrlBlock_io_frontend_cfVec_1_bits_pd_brType; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_frontend_cfVec_1_bits_pd_isCall; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_frontend_cfVec_1_bits_pd_isRet; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_frontend_cfVec_1_bits_pred_taken; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_frontend_cfVec_1_bits_crossPageIPFFix; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_frontend_cfVec_1_bits_ftqPtr_flag; // @[XSCore.scala 230:29]
  wire [2:0] ctrlBlock_io_frontend_cfVec_1_bits_ftqPtr_value; // @[XSCore.scala 230:29]
  wire [2:0] ctrlBlock_io_frontend_cfVec_1_bits_ftqOffset; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_frontend_fromFtq_pc_mem_wen; // @[XSCore.scala 230:29]
  wire [2:0] ctrlBlock_io_frontend_fromFtq_pc_mem_waddr; // @[XSCore.scala 230:29]
  wire [38:0] ctrlBlock_io_frontend_fromFtq_pc_mem_wdata_startAddr; // @[XSCore.scala 230:29]
  wire [38:0] ctrlBlock_io_frontend_fromFtq_pc_mem_wdata_nextLineAddr; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_frontend_fromFtq_pc_mem_wdata_isNextMask_0; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_frontend_fromFtq_pc_mem_wdata_isNextMask_1; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_frontend_fromFtq_pc_mem_wdata_isNextMask_2; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_frontend_fromFtq_pc_mem_wdata_isNextMask_3; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_frontend_fromFtq_pc_mem_wdata_isNextMask_4; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_frontend_fromFtq_pc_mem_wdata_isNextMask_5; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_frontend_fromFtq_pc_mem_wdata_isNextMask_6; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_frontend_fromFtq_pc_mem_wdata_isNextMask_7; // @[XSCore.scala 230:29]
  wire [38:0] ctrlBlock_io_frontend_fromFtq_newest_entry_target; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_frontend_fromFtq_newest_entry_ptr_flag; // @[XSCore.scala 230:29]
  wire [2:0] ctrlBlock_io_frontend_fromFtq_newest_entry_ptr_value; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_frontend_toFtq_rob_commits_0_valid; // @[XSCore.scala 230:29]
  wire [2:0] ctrlBlock_io_frontend_toFtq_rob_commits_0_bits_commitType; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_frontend_toFtq_rob_commits_0_bits_ftqIdx_flag; // @[XSCore.scala 230:29]
  wire [2:0] ctrlBlock_io_frontend_toFtq_rob_commits_0_bits_ftqIdx_value; // @[XSCore.scala 230:29]
  wire [2:0] ctrlBlock_io_frontend_toFtq_rob_commits_0_bits_ftqOffset; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_frontend_toFtq_rob_commits_1_valid; // @[XSCore.scala 230:29]
  wire [2:0] ctrlBlock_io_frontend_toFtq_rob_commits_1_bits_commitType; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_frontend_toFtq_rob_commits_1_bits_ftqIdx_flag; // @[XSCore.scala 230:29]
  wire [2:0] ctrlBlock_io_frontend_toFtq_rob_commits_1_bits_ftqIdx_value; // @[XSCore.scala 230:29]
  wire [2:0] ctrlBlock_io_frontend_toFtq_rob_commits_1_bits_ftqOffset; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_frontend_toFtq_redirect_valid; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_frontend_toFtq_redirect_bits_ftqIdx_flag; // @[XSCore.scala 230:29]
  wire [2:0] ctrlBlock_io_frontend_toFtq_redirect_bits_ftqIdx_value; // @[XSCore.scala 230:29]
  wire [2:0] ctrlBlock_io_frontend_toFtq_redirect_bits_ftqOffset; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_frontend_toFtq_redirect_bits_level; // @[XSCore.scala 230:29]
  wire [38:0] ctrlBlock_io_frontend_toFtq_redirect_bits_cfiUpdate_pc; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_frontend_toFtq_redirect_bits_cfiUpdate_pd_isRVC; // @[XSCore.scala 230:29]
  wire [1:0] ctrlBlock_io_frontend_toFtq_redirect_bits_cfiUpdate_pd_brType; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_frontend_toFtq_redirect_bits_cfiUpdate_pd_isCall; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_frontend_toFtq_redirect_bits_cfiUpdate_pd_isRet; // @[XSCore.scala 230:29]
  wire [38:0] ctrlBlock_io_frontend_toFtq_redirect_bits_cfiUpdate_target; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_frontend_toFtq_redirect_bits_cfiUpdate_taken; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_frontend_toFtq_redirect_bits_cfiUpdate_isMisPred; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_allocPregs_0_isInt; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_allocPregs_0_isFp; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_allocPregs_0_preg; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_allocPregs_1_isInt; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_allocPregs_1_isFp; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_allocPregs_1_preg; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_0_valid; // @[XSCore.scala 230:29]
  wire [9:0] ctrlBlock_io_dispatch_0_bits_cf_foldpc; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_0_bits_cf_trigger_backendEn_0; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_0_bits_cf_trigger_backendEn_1; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_0_bits_cf_pd_isRVC; // @[XSCore.scala 230:29]
  wire [1:0] ctrlBlock_io_dispatch_0_bits_cf_pd_brType; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_0_bits_cf_pd_isCall; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_0_bits_cf_pd_isRet; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_0_bits_cf_pred_taken; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_0_bits_cf_storeSetHit; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_0_bits_cf_waitForRobIdx_flag; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_dispatch_0_bits_cf_waitForRobIdx_value; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_0_bits_cf_loadWaitBit; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_0_bits_cf_loadWaitStrict; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_dispatch_0_bits_cf_ssid; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_0_bits_cf_ftqPtr_flag; // @[XSCore.scala 230:29]
  wire [2:0] ctrlBlock_io_dispatch_0_bits_cf_ftqPtr_value; // @[XSCore.scala 230:29]
  wire [2:0] ctrlBlock_io_dispatch_0_bits_cf_ftqOffset; // @[XSCore.scala 230:29]
  wire [1:0] ctrlBlock_io_dispatch_0_bits_ctrl_srcType_0; // @[XSCore.scala 230:29]
  wire [1:0] ctrlBlock_io_dispatch_0_bits_ctrl_srcType_1; // @[XSCore.scala 230:29]
  wire [3:0] ctrlBlock_io_dispatch_0_bits_ctrl_fuType; // @[XSCore.scala 230:29]
  wire [6:0] ctrlBlock_io_dispatch_0_bits_ctrl_fuOpType; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_0_bits_ctrl_rfWen; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_0_bits_ctrl_fpWen; // @[XSCore.scala 230:29]
  wire [3:0] ctrlBlock_io_dispatch_0_bits_ctrl_selImm; // @[XSCore.scala 230:29]
  wire [19:0] ctrlBlock_io_dispatch_0_bits_ctrl_imm; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_0_bits_ctrl_fpu_isAddSub; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_0_bits_ctrl_fpu_typeTagIn; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_0_bits_ctrl_fpu_typeTagOut; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_0_bits_ctrl_fpu_fromInt; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_0_bits_ctrl_fpu_wflags; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_0_bits_ctrl_fpu_fpWen; // @[XSCore.scala 230:29]
  wire [1:0] ctrlBlock_io_dispatch_0_bits_ctrl_fpu_fmaCmd; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_0_bits_ctrl_fpu_div; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_0_bits_ctrl_fpu_sqrt; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_0_bits_ctrl_fpu_fcvt; // @[XSCore.scala 230:29]
  wire [1:0] ctrlBlock_io_dispatch_0_bits_ctrl_fpu_typ; // @[XSCore.scala 230:29]
  wire [1:0] ctrlBlock_io_dispatch_0_bits_ctrl_fpu_fmt; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_0_bits_ctrl_fpu_ren3; // @[XSCore.scala 230:29]
  wire [2:0] ctrlBlock_io_dispatch_0_bits_ctrl_fpu_rm; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_dispatch_0_bits_psrc_0; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_dispatch_0_bits_psrc_1; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_dispatch_0_bits_pdest; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_0_bits_robIdx_flag; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_dispatch_0_bits_robIdx_value; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_0_bits_lqIdx_flag; // @[XSCore.scala 230:29]
  wire [3:0] ctrlBlock_io_dispatch_0_bits_lqIdx_value; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_0_bits_sqIdx_flag; // @[XSCore.scala 230:29]
  wire [3:0] ctrlBlock_io_dispatch_0_bits_sqIdx_value; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_1_valid; // @[XSCore.scala 230:29]
  wire [9:0] ctrlBlock_io_dispatch_1_bits_cf_foldpc; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_1_bits_cf_trigger_backendEn_0; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_1_bits_cf_trigger_backendEn_1; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_1_bits_cf_pd_isRVC; // @[XSCore.scala 230:29]
  wire [1:0] ctrlBlock_io_dispatch_1_bits_cf_pd_brType; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_1_bits_cf_pd_isCall; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_1_bits_cf_pd_isRet; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_1_bits_cf_pred_taken; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_1_bits_cf_storeSetHit; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_1_bits_cf_waitForRobIdx_flag; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_dispatch_1_bits_cf_waitForRobIdx_value; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_1_bits_cf_loadWaitBit; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_1_bits_cf_loadWaitStrict; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_dispatch_1_bits_cf_ssid; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_1_bits_cf_ftqPtr_flag; // @[XSCore.scala 230:29]
  wire [2:0] ctrlBlock_io_dispatch_1_bits_cf_ftqPtr_value; // @[XSCore.scala 230:29]
  wire [2:0] ctrlBlock_io_dispatch_1_bits_cf_ftqOffset; // @[XSCore.scala 230:29]
  wire [1:0] ctrlBlock_io_dispatch_1_bits_ctrl_srcType_0; // @[XSCore.scala 230:29]
  wire [1:0] ctrlBlock_io_dispatch_1_bits_ctrl_srcType_1; // @[XSCore.scala 230:29]
  wire [3:0] ctrlBlock_io_dispatch_1_bits_ctrl_fuType; // @[XSCore.scala 230:29]
  wire [6:0] ctrlBlock_io_dispatch_1_bits_ctrl_fuOpType; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_1_bits_ctrl_rfWen; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_1_bits_ctrl_fpWen; // @[XSCore.scala 230:29]
  wire [3:0] ctrlBlock_io_dispatch_1_bits_ctrl_selImm; // @[XSCore.scala 230:29]
  wire [19:0] ctrlBlock_io_dispatch_1_bits_ctrl_imm; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_dispatch_1_bits_psrc_0; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_dispatch_1_bits_psrc_1; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_dispatch_1_bits_pdest; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_1_bits_robIdx_flag; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_dispatch_1_bits_robIdx_value; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_1_bits_lqIdx_flag; // @[XSCore.scala 230:29]
  wire [3:0] ctrlBlock_io_dispatch_1_bits_lqIdx_value; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_1_bits_sqIdx_flag; // @[XSCore.scala 230:29]
  wire [3:0] ctrlBlock_io_dispatch_1_bits_sqIdx_value; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_4_valid; // @[XSCore.scala 230:29]
  wire [9:0] ctrlBlock_io_dispatch_4_bits_cf_foldpc; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_4_bits_cf_trigger_backendEn_0; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_4_bits_cf_trigger_backendEn_1; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_4_bits_cf_pd_isRVC; // @[XSCore.scala 230:29]
  wire [1:0] ctrlBlock_io_dispatch_4_bits_cf_pd_brType; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_4_bits_cf_pd_isCall; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_4_bits_cf_pd_isRet; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_4_bits_cf_pred_taken; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_4_bits_cf_storeSetHit; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_4_bits_cf_waitForRobIdx_flag; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_dispatch_4_bits_cf_waitForRobIdx_value; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_4_bits_cf_loadWaitBit; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_4_bits_cf_loadWaitStrict; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_dispatch_4_bits_cf_ssid; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_4_bits_cf_ftqPtr_flag; // @[XSCore.scala 230:29]
  wire [2:0] ctrlBlock_io_dispatch_4_bits_cf_ftqPtr_value; // @[XSCore.scala 230:29]
  wire [2:0] ctrlBlock_io_dispatch_4_bits_cf_ftqOffset; // @[XSCore.scala 230:29]
  wire [1:0] ctrlBlock_io_dispatch_4_bits_ctrl_srcType_0; // @[XSCore.scala 230:29]
  wire [1:0] ctrlBlock_io_dispatch_4_bits_ctrl_srcType_1; // @[XSCore.scala 230:29]
  wire [3:0] ctrlBlock_io_dispatch_4_bits_ctrl_fuType; // @[XSCore.scala 230:29]
  wire [6:0] ctrlBlock_io_dispatch_4_bits_ctrl_fuOpType; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_4_bits_ctrl_rfWen; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_4_bits_ctrl_fpWen; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_4_bits_ctrl_flushPipe; // @[XSCore.scala 230:29]
  wire [19:0] ctrlBlock_io_dispatch_4_bits_ctrl_imm; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_4_bits_ctrl_replayInst; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_dispatch_4_bits_psrc_0; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_dispatch_4_bits_psrc_1; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_dispatch_4_bits_pdest; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_4_bits_robIdx_flag; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_dispatch_4_bits_robIdx_value; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_5_valid; // @[XSCore.scala 230:29]
  wire [9:0] ctrlBlock_io_dispatch_5_bits_cf_foldpc; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_5_bits_cf_trigger_backendEn_0; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_5_bits_cf_trigger_backendEn_1; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_5_bits_cf_pd_isRVC; // @[XSCore.scala 230:29]
  wire [1:0] ctrlBlock_io_dispatch_5_bits_cf_pd_brType; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_5_bits_cf_pd_isCall; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_5_bits_cf_pd_isRet; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_5_bits_cf_pred_taken; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_5_bits_cf_storeSetHit; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_5_bits_cf_waitForRobIdx_flag; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_dispatch_5_bits_cf_waitForRobIdx_value; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_5_bits_cf_loadWaitBit; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_5_bits_cf_loadWaitStrict; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_dispatch_5_bits_cf_ssid; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_5_bits_cf_ftqPtr_flag; // @[XSCore.scala 230:29]
  wire [2:0] ctrlBlock_io_dispatch_5_bits_cf_ftqPtr_value; // @[XSCore.scala 230:29]
  wire [2:0] ctrlBlock_io_dispatch_5_bits_cf_ftqOffset; // @[XSCore.scala 230:29]
  wire [1:0] ctrlBlock_io_dispatch_5_bits_ctrl_srcType_0; // @[XSCore.scala 230:29]
  wire [1:0] ctrlBlock_io_dispatch_5_bits_ctrl_srcType_1; // @[XSCore.scala 230:29]
  wire [3:0] ctrlBlock_io_dispatch_5_bits_ctrl_fuType; // @[XSCore.scala 230:29]
  wire [6:0] ctrlBlock_io_dispatch_5_bits_ctrl_fuOpType; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_5_bits_ctrl_rfWen; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_5_bits_ctrl_fpWen; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_5_bits_ctrl_flushPipe; // @[XSCore.scala 230:29]
  wire [19:0] ctrlBlock_io_dispatch_5_bits_ctrl_imm; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_5_bits_ctrl_replayInst; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_dispatch_5_bits_psrc_0; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_dispatch_5_bits_psrc_1; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_dispatch_5_bits_pdest; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_5_bits_robIdx_flag; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_dispatch_5_bits_robIdx_value; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_6_valid; // @[XSCore.scala 230:29]
  wire [9:0] ctrlBlock_io_dispatch_6_bits_cf_foldpc; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_6_bits_cf_trigger_backendEn_0; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_6_bits_cf_trigger_backendEn_1; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_6_bits_cf_pd_isRVC; // @[XSCore.scala 230:29]
  wire [1:0] ctrlBlock_io_dispatch_6_bits_cf_pd_brType; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_6_bits_cf_pd_isCall; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_6_bits_cf_pd_isRet; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_6_bits_cf_pred_taken; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_6_bits_cf_storeSetHit; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_6_bits_cf_waitForRobIdx_flag; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_dispatch_6_bits_cf_waitForRobIdx_value; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_6_bits_cf_loadWaitBit; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_6_bits_cf_loadWaitStrict; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_dispatch_6_bits_cf_ssid; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_6_bits_cf_ftqPtr_flag; // @[XSCore.scala 230:29]
  wire [2:0] ctrlBlock_io_dispatch_6_bits_cf_ftqPtr_value; // @[XSCore.scala 230:29]
  wire [2:0] ctrlBlock_io_dispatch_6_bits_cf_ftqOffset; // @[XSCore.scala 230:29]
  wire [1:0] ctrlBlock_io_dispatch_6_bits_ctrl_srcType_0; // @[XSCore.scala 230:29]
  wire [1:0] ctrlBlock_io_dispatch_6_bits_ctrl_srcType_1; // @[XSCore.scala 230:29]
  wire [3:0] ctrlBlock_io_dispatch_6_bits_ctrl_fuType; // @[XSCore.scala 230:29]
  wire [6:0] ctrlBlock_io_dispatch_6_bits_ctrl_fuOpType; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_6_bits_ctrl_rfWen; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_6_bits_ctrl_fpWen; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_6_bits_ctrl_flushPipe; // @[XSCore.scala 230:29]
  wire [19:0] ctrlBlock_io_dispatch_6_bits_ctrl_imm; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_6_bits_ctrl_replayInst; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_dispatch_6_bits_psrc_0; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_dispatch_6_bits_psrc_1; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_dispatch_6_bits_pdest; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_6_bits_robIdx_flag; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_dispatch_6_bits_robIdx_value; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_7_valid; // @[XSCore.scala 230:29]
  wire [9:0] ctrlBlock_io_dispatch_7_bits_cf_foldpc; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_7_bits_cf_trigger_backendEn_0; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_7_bits_cf_trigger_backendEn_1; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_7_bits_cf_pd_isRVC; // @[XSCore.scala 230:29]
  wire [1:0] ctrlBlock_io_dispatch_7_bits_cf_pd_brType; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_7_bits_cf_pd_isCall; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_7_bits_cf_pd_isRet; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_7_bits_cf_pred_taken; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_7_bits_cf_storeSetHit; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_7_bits_cf_waitForRobIdx_flag; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_dispatch_7_bits_cf_waitForRobIdx_value; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_7_bits_cf_loadWaitBit; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_7_bits_cf_loadWaitStrict; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_dispatch_7_bits_cf_ssid; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_7_bits_cf_ftqPtr_flag; // @[XSCore.scala 230:29]
  wire [2:0] ctrlBlock_io_dispatch_7_bits_cf_ftqPtr_value; // @[XSCore.scala 230:29]
  wire [2:0] ctrlBlock_io_dispatch_7_bits_cf_ftqOffset; // @[XSCore.scala 230:29]
  wire [1:0] ctrlBlock_io_dispatch_7_bits_ctrl_srcType_0; // @[XSCore.scala 230:29]
  wire [1:0] ctrlBlock_io_dispatch_7_bits_ctrl_srcType_1; // @[XSCore.scala 230:29]
  wire [3:0] ctrlBlock_io_dispatch_7_bits_ctrl_fuType; // @[XSCore.scala 230:29]
  wire [6:0] ctrlBlock_io_dispatch_7_bits_ctrl_fuOpType; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_7_bits_ctrl_rfWen; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_7_bits_ctrl_fpWen; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_7_bits_ctrl_flushPipe; // @[XSCore.scala 230:29]
  wire [19:0] ctrlBlock_io_dispatch_7_bits_ctrl_imm; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_7_bits_ctrl_replayInst; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_dispatch_7_bits_psrc_0; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_dispatch_7_bits_psrc_1; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_dispatch_7_bits_pdest; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_7_bits_robIdx_flag; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_dispatch_7_bits_robIdx_value; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_8_valid; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_8_bits_cf_pd_isRVC; // @[XSCore.scala 230:29]
  wire [1:0] ctrlBlock_io_dispatch_8_bits_cf_pd_brType; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_8_bits_cf_pd_isCall; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_8_bits_cf_pd_isRet; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_8_bits_cf_pred_taken; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_8_bits_cf_ftqPtr_flag; // @[XSCore.scala 230:29]
  wire [2:0] ctrlBlock_io_dispatch_8_bits_cf_ftqPtr_value; // @[XSCore.scala 230:29]
  wire [2:0] ctrlBlock_io_dispatch_8_bits_cf_ftqOffset; // @[XSCore.scala 230:29]
  wire [1:0] ctrlBlock_io_dispatch_8_bits_ctrl_srcType_0; // @[XSCore.scala 230:29]
  wire [1:0] ctrlBlock_io_dispatch_8_bits_ctrl_srcType_1; // @[XSCore.scala 230:29]
  wire [1:0] ctrlBlock_io_dispatch_8_bits_ctrl_srcType_2; // @[XSCore.scala 230:29]
  wire [3:0] ctrlBlock_io_dispatch_8_bits_ctrl_fuType; // @[XSCore.scala 230:29]
  wire [6:0] ctrlBlock_io_dispatch_8_bits_ctrl_fuOpType; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_8_bits_ctrl_rfWen; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_8_bits_ctrl_fpWen; // @[XSCore.scala 230:29]
  wire [19:0] ctrlBlock_io_dispatch_8_bits_ctrl_imm; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_8_bits_ctrl_fpu_isAddSub; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_8_bits_ctrl_fpu_typeTagIn; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_8_bits_ctrl_fpu_typeTagOut; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_8_bits_ctrl_fpu_fromInt; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_8_bits_ctrl_fpu_wflags; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_8_bits_ctrl_fpu_fpWen; // @[XSCore.scala 230:29]
  wire [1:0] ctrlBlock_io_dispatch_8_bits_ctrl_fpu_fmaCmd; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_8_bits_ctrl_fpu_div; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_8_bits_ctrl_fpu_sqrt; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_8_bits_ctrl_fpu_fcvt; // @[XSCore.scala 230:29]
  wire [1:0] ctrlBlock_io_dispatch_8_bits_ctrl_fpu_typ; // @[XSCore.scala 230:29]
  wire [1:0] ctrlBlock_io_dispatch_8_bits_ctrl_fpu_fmt; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_8_bits_ctrl_fpu_ren3; // @[XSCore.scala 230:29]
  wire [2:0] ctrlBlock_io_dispatch_8_bits_ctrl_fpu_rm; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_dispatch_8_bits_psrc_0; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_dispatch_8_bits_psrc_1; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_dispatch_8_bits_psrc_2; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_dispatch_8_bits_pdest; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_dispatch_8_bits_robIdx_flag; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_dispatch_8_bits_robIdx_value; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_rsReady_0; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_rsReady_1; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_rsReady_2; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_rsReady_3; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_rsReady_4; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_rsReady_5; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_rsReady_6; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_rsReady_7; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_rsReady_8; // @[XSCore.scala 230:29]
  wire [1:0] ctrlBlock_io_enqLsq_needAlloc_0; // @[XSCore.scala 230:29]
  wire [1:0] ctrlBlock_io_enqLsq_needAlloc_1; // @[XSCore.scala 230:29]
  wire [1:0] ctrlBlock_io_enqLsq_needAlloc_2; // @[XSCore.scala 230:29]
  wire [1:0] ctrlBlock_io_enqLsq_needAlloc_3; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_enqLsq_req_0_valid; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_enqLsq_req_0_bits_cf_trigger_backendEn_0; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_enqLsq_req_0_bits_cf_trigger_backendEn_1; // @[XSCore.scala 230:29]
  wire [6:0] ctrlBlock_io_enqLsq_req_0_bits_ctrl_fuOpType; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_enqLsq_req_0_bits_ctrl_rfWen; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_enqLsq_req_0_bits_ctrl_fpWen; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_enqLsq_req_0_bits_ctrl_flushPipe; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_enqLsq_req_0_bits_ctrl_replayInst; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_enqLsq_req_0_bits_pdest; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_enqLsq_req_0_bits_robIdx_flag; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_enqLsq_req_0_bits_robIdx_value; // @[XSCore.scala 230:29]
  wire [3:0] ctrlBlock_io_enqLsq_req_0_bits_lqIdx_value; // @[XSCore.scala 230:29]
  wire [3:0] ctrlBlock_io_enqLsq_req_0_bits_sqIdx_value; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_enqLsq_req_1_valid; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_enqLsq_req_1_bits_cf_trigger_backendEn_0; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_enqLsq_req_1_bits_cf_trigger_backendEn_1; // @[XSCore.scala 230:29]
  wire [6:0] ctrlBlock_io_enqLsq_req_1_bits_ctrl_fuOpType; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_enqLsq_req_1_bits_ctrl_rfWen; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_enqLsq_req_1_bits_ctrl_fpWen; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_enqLsq_req_1_bits_ctrl_flushPipe; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_enqLsq_req_1_bits_ctrl_replayInst; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_enqLsq_req_1_bits_pdest; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_enqLsq_req_1_bits_robIdx_flag; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_enqLsq_req_1_bits_robIdx_value; // @[XSCore.scala 230:29]
  wire [3:0] ctrlBlock_io_enqLsq_req_1_bits_lqIdx_value; // @[XSCore.scala 230:29]
  wire [3:0] ctrlBlock_io_enqLsq_req_1_bits_sqIdx_value; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_enqLsq_req_2_valid; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_enqLsq_req_2_bits_cf_trigger_backendEn_0; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_enqLsq_req_2_bits_cf_trigger_backendEn_1; // @[XSCore.scala 230:29]
  wire [6:0] ctrlBlock_io_enqLsq_req_2_bits_ctrl_fuOpType; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_enqLsq_req_2_bits_ctrl_rfWen; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_enqLsq_req_2_bits_ctrl_fpWen; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_enqLsq_req_2_bits_ctrl_flushPipe; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_enqLsq_req_2_bits_ctrl_replayInst; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_enqLsq_req_2_bits_pdest; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_enqLsq_req_2_bits_robIdx_flag; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_enqLsq_req_2_bits_robIdx_value; // @[XSCore.scala 230:29]
  wire [3:0] ctrlBlock_io_enqLsq_req_2_bits_lqIdx_value; // @[XSCore.scala 230:29]
  wire [3:0] ctrlBlock_io_enqLsq_req_2_bits_sqIdx_value; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_enqLsq_req_3_valid; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_enqLsq_req_3_bits_cf_trigger_backendEn_0; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_enqLsq_req_3_bits_cf_trigger_backendEn_1; // @[XSCore.scala 230:29]
  wire [6:0] ctrlBlock_io_enqLsq_req_3_bits_ctrl_fuOpType; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_enqLsq_req_3_bits_ctrl_rfWen; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_enqLsq_req_3_bits_ctrl_fpWen; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_enqLsq_req_3_bits_ctrl_flushPipe; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_enqLsq_req_3_bits_ctrl_replayInst; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_enqLsq_req_3_bits_pdest; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_enqLsq_req_3_bits_robIdx_flag; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_enqLsq_req_3_bits_robIdx_value; // @[XSCore.scala 230:29]
  wire [3:0] ctrlBlock_io_enqLsq_req_3_bits_lqIdx_value; // @[XSCore.scala 230:29]
  wire [3:0] ctrlBlock_io_enqLsq_req_3_bits_sqIdx_value; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_lqCancelCnt; // @[XSCore.scala 230:29]
  wire [3:0] ctrlBlock_io_sqCancelCnt; // @[XSCore.scala 230:29]
  wire [1:0] ctrlBlock_io_lqDeq; // @[XSCore.scala 230:29]
  wire [1:0] ctrlBlock_io_sqDeq; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_exuRedirect_0_valid; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_exuRedirect_0_bits_uop_cf_pd_isRVC; // @[XSCore.scala 230:29]
  wire [1:0] ctrlBlock_io_exuRedirect_0_bits_uop_cf_pd_brType; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_exuRedirect_0_bits_uop_cf_pd_isCall; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_exuRedirect_0_bits_uop_cf_pd_isRet; // @[XSCore.scala 230:29]
  wire [19:0] ctrlBlock_io_exuRedirect_0_bits_uop_ctrl_imm; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_exuRedirect_0_bits_uop_robIdx_flag; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_exuRedirect_0_bits_uop_robIdx_value; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_exuRedirect_0_bits_redirectValid; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_exuRedirect_0_bits_redirect_robIdx_flag; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_exuRedirect_0_bits_redirect_robIdx_value; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_exuRedirect_0_bits_redirect_ftqIdx_flag; // @[XSCore.scala 230:29]
  wire [2:0] ctrlBlock_io_exuRedirect_0_bits_redirect_ftqIdx_value; // @[XSCore.scala 230:29]
  wire [2:0] ctrlBlock_io_exuRedirect_0_bits_redirect_ftqOffset; // @[XSCore.scala 230:29]
  wire [38:0] ctrlBlock_io_exuRedirect_0_bits_redirect_cfiUpdate_target; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_exuRedirect_0_bits_redirect_cfiUpdate_isMisPred; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_exuRedirect_1_valid; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_exuRedirect_1_bits_uop_cf_pd_isRVC; // @[XSCore.scala 230:29]
  wire [1:0] ctrlBlock_io_exuRedirect_1_bits_uop_cf_pd_brType; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_exuRedirect_1_bits_uop_cf_pd_isCall; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_exuRedirect_1_bits_uop_cf_pd_isRet; // @[XSCore.scala 230:29]
  wire [19:0] ctrlBlock_io_exuRedirect_1_bits_uop_ctrl_imm; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_exuRedirect_1_bits_uop_robIdx_flag; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_exuRedirect_1_bits_uop_robIdx_value; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_exuRedirect_1_bits_redirectValid; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_exuRedirect_1_bits_redirect_robIdx_flag; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_exuRedirect_1_bits_redirect_robIdx_value; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_exuRedirect_1_bits_redirect_ftqIdx_flag; // @[XSCore.scala 230:29]
  wire [2:0] ctrlBlock_io_exuRedirect_1_bits_redirect_ftqIdx_value; // @[XSCore.scala 230:29]
  wire [2:0] ctrlBlock_io_exuRedirect_1_bits_redirect_ftqOffset; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_exuRedirect_1_bits_redirect_cfiUpdate_taken; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_exuRedirect_1_bits_redirect_cfiUpdate_isMisPred; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_exuRedirect_2_valid; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_exuRedirect_2_bits_uop_cf_pd_isRVC; // @[XSCore.scala 230:29]
  wire [1:0] ctrlBlock_io_exuRedirect_2_bits_uop_cf_pd_brType; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_exuRedirect_2_bits_uop_cf_pd_isCall; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_exuRedirect_2_bits_uop_cf_pd_isRet; // @[XSCore.scala 230:29]
  wire [19:0] ctrlBlock_io_exuRedirect_2_bits_uop_ctrl_imm; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_exuRedirect_2_bits_uop_robIdx_flag; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_exuRedirect_2_bits_uop_robIdx_value; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_exuRedirect_2_bits_redirectValid; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_exuRedirect_2_bits_redirect_robIdx_flag; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_exuRedirect_2_bits_redirect_robIdx_value; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_exuRedirect_2_bits_redirect_ftqIdx_flag; // @[XSCore.scala 230:29]
  wire [2:0] ctrlBlock_io_exuRedirect_2_bits_redirect_ftqIdx_value; // @[XSCore.scala 230:29]
  wire [2:0] ctrlBlock_io_exuRedirect_2_bits_redirect_ftqOffset; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_exuRedirect_2_bits_redirect_cfiUpdate_taken; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_exuRedirect_2_bits_redirect_cfiUpdate_isMisPred; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_stIn_0_valid; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_stIn_0_bits_uop_cf_storeSetHit; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_stIn_0_bits_uop_cf_ssid; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_stIn_0_bits_uop_robIdx_value; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_stIn_1_valid; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_stIn_1_bits_uop_cf_storeSetHit; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_stIn_1_bits_uop_cf_ssid; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_stIn_1_bits_uop_robIdx_value; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_memoryViolation_valid; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_memoryViolation_bits_robIdx_flag; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_memoryViolation_bits_robIdx_value; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_memoryViolation_bits_ftqIdx_flag; // @[XSCore.scala 230:29]
  wire [2:0] ctrlBlock_io_memoryViolation_bits_ftqIdx_value; // @[XSCore.scala 230:29]
  wire [2:0] ctrlBlock_io_memoryViolation_bits_ftqOffset; // @[XSCore.scala 230:29]
  wire [2:0] ctrlBlock_io_memoryViolation_bits_stFtqIdx_value; // @[XSCore.scala 230:29]
  wire [2:0] ctrlBlock_io_memoryViolation_bits_stFtqOffset; // @[XSCore.scala 230:29]
  wire [38:0] ctrlBlock_io_jumpPc; // @[XSCore.scala 230:29]
  wire [38:0] ctrlBlock_io_jalr_target; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_robio_toCSR_intrBitSet; // @[XSCore.scala 230:29]
  wire [38:0] ctrlBlock_io_robio_toCSR_trapTarget; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_robio_toCSR_isXRet; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_robio_toCSR_wfiEvent; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_robio_toCSR_fflags_valid; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_robio_toCSR_fflags_bits; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_robio_toCSR_dirty_fs; // @[XSCore.scala 230:29]
  wire [2:0] ctrlBlock_io_robio_toCSR_perfinfo_retiredInstr; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_robio_exception_valid; // @[XSCore.scala 230:29]
  wire [38:0] ctrlBlock_io_robio_exception_bits_uop_cf_pc; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_robio_exception_bits_uop_cf_exceptionVec_0; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_robio_exception_bits_uop_cf_exceptionVec_1; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_robio_exception_bits_uop_cf_exceptionVec_2; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_robio_exception_bits_uop_cf_exceptionVec_3; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_robio_exception_bits_uop_cf_exceptionVec_4; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_robio_exception_bits_uop_cf_exceptionVec_5; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_robio_exception_bits_uop_cf_exceptionVec_6; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_robio_exception_bits_uop_cf_exceptionVec_7; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_robio_exception_bits_uop_cf_exceptionVec_8; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_robio_exception_bits_uop_cf_exceptionVec_9; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_robio_exception_bits_uop_cf_exceptionVec_11; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_robio_exception_bits_uop_cf_exceptionVec_12; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_robio_exception_bits_uop_cf_exceptionVec_13; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_robio_exception_bits_uop_cf_exceptionVec_15; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_robio_exception_bits_uop_cf_trigger_frontendHit_0; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_robio_exception_bits_uop_cf_trigger_frontendHit_1; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_robio_exception_bits_uop_cf_trigger_frontendHit_2; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_robio_exception_bits_uop_cf_trigger_frontendHit_3; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_robio_exception_bits_uop_cf_trigger_backendHit_0; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_robio_exception_bits_uop_cf_trigger_backendHit_1; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_robio_exception_bits_uop_cf_trigger_backendHit_2; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_robio_exception_bits_uop_cf_trigger_backendHit_3; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_robio_exception_bits_uop_cf_trigger_backendHit_4; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_robio_exception_bits_uop_cf_trigger_backendHit_5; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_robio_exception_bits_uop_cf_crossPageIPFFix; // @[XSCore.scala 230:29]
  wire [2:0] ctrlBlock_io_robio_exception_bits_uop_ctrl_commitType; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_robio_exception_bits_uop_ctrl_singleStep; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_robio_exception_bits_isInterrupt; // @[XSCore.scala 230:29]
  wire [1:0] ctrlBlock_io_robio_lsq_scommit; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_robio_lsq_pendingld; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_robio_lsq_pendingst; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_robio_lsq_commit; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_robio_lsq_isMMIO_0; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_robio_lsq_isMMIO_1; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_robio_lsq_uop_0_robIdx_value; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_robio_lsq_uop_1_robIdx_value; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_csrCtrl_lvpred_disable; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_csrCtrl_no_spec_load; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_csrCtrl_storeset_wait_store; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_csrCtrl_lvpred_timeout; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_csrCtrl_fusion_enable; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_csrCtrl_wfi_enable; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_csrCtrl_svinval_enable; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_csrCtrl_distribute_csr_wvalid; // @[XSCore.scala 230:29]
  wire [11:0] ctrlBlock_io_csrCtrl_distribute_csr_waddr; // @[XSCore.scala 230:29]
  wire [63:0] ctrlBlock_io_csrCtrl_distribute_csr_wdata; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_csrCtrl_singlestep; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_0_valid; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_0_bits_uop_robIdx_flag; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_writeback_1_0_bits_uop_robIdx_value; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_0_bits_redirectValid; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_0_bits_redirect_cfiUpdate_isMisPred; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_1_valid; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_1_bits_uop_robIdx_flag; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_writeback_1_1_bits_uop_robIdx_value; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_1_bits_redirectValid; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_1_bits_redirect_cfiUpdate_isMisPred; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_2_valid; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_2_bits_uop_cf_exceptionVec_4; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_2_bits_uop_cf_exceptionVec_5; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_2_bits_uop_cf_exceptionVec_13; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_2_bits_uop_cf_trigger_backendHit_0; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_2_bits_uop_cf_trigger_backendHit_1; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_2_bits_uop_cf_trigger_backendHit_2; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_2_bits_uop_cf_trigger_backendHit_3; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_2_bits_uop_cf_trigger_backendHit_4; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_2_bits_uop_cf_trigger_backendHit_5; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_2_bits_uop_ctrl_flushPipe; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_2_bits_uop_ctrl_replayInst; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_2_bits_uop_robIdx_flag; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_writeback_1_2_bits_uop_robIdx_value; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_2_bits_debug_isMMIO; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_3_valid; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_3_bits_uop_cf_exceptionVec_4; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_3_bits_uop_cf_exceptionVec_5; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_3_bits_uop_cf_exceptionVec_13; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_3_bits_uop_cf_trigger_backendHit_0; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_3_bits_uop_cf_trigger_backendHit_1; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_3_bits_uop_cf_trigger_backendHit_2; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_3_bits_uop_cf_trigger_backendHit_3; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_3_bits_uop_cf_trigger_backendHit_4; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_3_bits_uop_cf_trigger_backendHit_5; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_3_bits_uop_ctrl_flushPipe; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_3_bits_uop_ctrl_replayInst; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_3_bits_uop_robIdx_flag; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_writeback_1_3_bits_uop_robIdx_value; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_3_bits_debug_isMMIO; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_4_valid; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_4_bits_uop_cf_exceptionVec_2; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_4_bits_uop_cf_exceptionVec_3; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_4_bits_uop_cf_exceptionVec_8; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_4_bits_uop_cf_exceptionVec_9; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_4_bits_uop_cf_exceptionVec_11; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_4_bits_uop_ctrl_flushPipe; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_4_bits_uop_robIdx_flag; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_writeback_1_4_bits_uop_robIdx_value; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_4_bits_redirectValid; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_4_bits_redirect_cfiUpdate_isMisPred; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_4_bits_debug_isPerfCnt; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_5_valid; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_5_bits_uop_cf_trigger_backendHit_0; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_5_bits_uop_cf_trigger_backendHit_1; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_5_bits_uop_cf_trigger_backendHit_2; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_5_bits_uop_cf_trigger_backendHit_3; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_5_bits_uop_cf_trigger_backendHit_4; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_5_bits_uop_cf_trigger_backendHit_5; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_5_bits_uop_robIdx_flag; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_writeback_1_5_bits_uop_robIdx_value; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_6_valid; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_6_bits_uop_cf_exceptionVec_2; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_6_bits_uop_cf_exceptionVec_3; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_6_bits_uop_cf_exceptionVec_8; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_6_bits_uop_cf_exceptionVec_9; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_6_bits_uop_cf_exceptionVec_11; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_6_bits_uop_ctrl_flushPipe; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_6_bits_uop_robIdx_flag; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_writeback_1_6_bits_uop_robIdx_value; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_6_bits_redirectValid; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_6_bits_redirect_cfiUpdate_isMisPred; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_6_bits_debug_isPerfCnt; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_7_valid; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_7_bits_uop_cf_exceptionVec_4; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_7_bits_uop_cf_exceptionVec_5; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_7_bits_uop_cf_exceptionVec_6; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_7_bits_uop_cf_exceptionVec_7; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_7_bits_uop_cf_exceptionVec_13; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_7_bits_uop_cf_exceptionVec_15; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_7_bits_uop_cf_trigger_backendHit_0; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_7_bits_uop_cf_trigger_backendHit_1; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_7_bits_uop_cf_trigger_backendHit_2; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_7_bits_uop_cf_trigger_backendHit_3; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_7_bits_uop_cf_trigger_backendHit_4; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_7_bits_uop_cf_trigger_backendHit_5; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_7_bits_uop_robIdx_flag; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_writeback_1_7_bits_uop_robIdx_value; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_7_bits_redirectValid; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_7_bits_redirect_cfiUpdate_isMisPred; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_7_bits_debug_isMMIO; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_7_bits_debug_isPerfCnt; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_8_valid; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_8_bits_uop_cf_exceptionVec_4; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_8_bits_uop_cf_exceptionVec_5; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_8_bits_uop_cf_exceptionVec_6; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_8_bits_uop_cf_exceptionVec_7; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_8_bits_uop_cf_exceptionVec_13; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_8_bits_uop_cf_exceptionVec_15; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_8_bits_uop_cf_trigger_backendHit_0; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_8_bits_uop_cf_trigger_backendHit_1; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_8_bits_uop_cf_trigger_backendHit_2; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_8_bits_uop_cf_trigger_backendHit_3; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_8_bits_uop_cf_trigger_backendHit_4; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_8_bits_uop_cf_trigger_backendHit_5; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_8_bits_uop_robIdx_flag; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_writeback_1_8_bits_uop_robIdx_value; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_8_bits_redirectValid; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_8_bits_redirect_cfiUpdate_isMisPred; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_8_bits_debug_isMMIO; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_8_bits_debug_isPerfCnt; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_9_valid; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_9_bits_uop_robIdx_flag; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_writeback_1_9_bits_uop_robIdx_value; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_10_valid; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_1_10_bits_uop_robIdx_flag; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_writeback_1_10_bits_uop_robIdx_value; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_3_valid; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_3_bits_uop_cf_exceptionVec_2; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_3_bits_uop_cf_exceptionVec_3; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_3_bits_uop_cf_exceptionVec_8; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_3_bits_uop_cf_exceptionVec_9; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_3_bits_uop_cf_exceptionVec_11; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_3_bits_uop_ctrl_flushPipe; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_3_bits_uop_robIdx_flag; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_writeback_0_3_bits_uop_robIdx_value; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_writeback_0_3_bits_fflags; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_4_valid; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_4_bits_uop_robIdx_flag; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_writeback_0_4_bits_uop_robIdx_value; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_writeback_0_4_bits_fflags; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_5_valid; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_5_bits_uop_robIdx_flag; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_writeback_0_5_bits_uop_robIdx_value; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_writeback_0_5_bits_fflags; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_6_valid; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_6_bits_uop_cf_exceptionVec_4; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_6_bits_uop_cf_exceptionVec_5; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_6_bits_uop_cf_exceptionVec_13; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_6_bits_uop_cf_trigger_backendHit_0; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_6_bits_uop_cf_trigger_backendHit_1; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_6_bits_uop_cf_trigger_backendHit_2; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_6_bits_uop_cf_trigger_backendHit_3; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_6_bits_uop_cf_trigger_backendHit_4; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_6_bits_uop_cf_trigger_backendHit_5; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_6_bits_uop_ctrl_flushPipe; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_6_bits_uop_ctrl_replayInst; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_6_bits_uop_robIdx_flag; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_writeback_0_6_bits_uop_robIdx_value; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_7_valid; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_7_bits_uop_cf_exceptionVec_4; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_7_bits_uop_cf_exceptionVec_5; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_7_bits_uop_cf_exceptionVec_13; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_7_bits_uop_cf_trigger_backendHit_0; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_7_bits_uop_cf_trigger_backendHit_1; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_7_bits_uop_cf_trigger_backendHit_2; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_7_bits_uop_cf_trigger_backendHit_3; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_7_bits_uop_cf_trigger_backendHit_4; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_7_bits_uop_cf_trigger_backendHit_5; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_7_bits_uop_ctrl_flushPipe; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_7_bits_uop_ctrl_replayInst; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_7_bits_uop_robIdx_flag; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_writeback_0_7_bits_uop_robIdx_value; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_8_valid; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_8_bits_uop_cf_exceptionVec_4; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_8_bits_uop_cf_exceptionVec_5; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_8_bits_uop_cf_exceptionVec_6; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_8_bits_uop_cf_exceptionVec_7; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_8_bits_uop_cf_exceptionVec_13; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_8_bits_uop_cf_exceptionVec_15; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_8_bits_uop_cf_trigger_backendHit_0; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_8_bits_uop_cf_trigger_backendHit_1; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_8_bits_uop_cf_trigger_backendHit_2; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_8_bits_uop_cf_trigger_backendHit_3; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_8_bits_uop_cf_trigger_backendHit_4; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_8_bits_uop_cf_trigger_backendHit_5; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_8_bits_uop_robIdx_flag; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_writeback_0_8_bits_uop_robIdx_value; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_9_valid; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_9_bits_uop_cf_exceptionVec_6; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_9_bits_uop_cf_exceptionVec_7; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_9_bits_uop_cf_exceptionVec_15; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_9_bits_uop_cf_trigger_backendHit_0; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_9_bits_uop_cf_trigger_backendHit_1; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_9_bits_uop_cf_trigger_backendHit_4; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_writeback_0_9_bits_uop_robIdx_flag; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_writeback_0_9_bits_uop_robIdx_value; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_redirect_valid; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_redirect_bits_robIdx_flag; // @[XSCore.scala 230:29]
  wire [4:0] ctrlBlock_io_redirect_bits_robIdx_value; // @[XSCore.scala 230:29]
  wire  ctrlBlock_io_redirect_bits_level; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_int_rat_0; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_int_rat_1; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_int_rat_2; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_int_rat_3; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_int_rat_4; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_int_rat_5; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_int_rat_6; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_int_rat_7; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_int_rat_8; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_int_rat_9; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_int_rat_10; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_int_rat_11; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_int_rat_12; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_int_rat_13; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_int_rat_14; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_int_rat_15; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_int_rat_16; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_int_rat_17; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_int_rat_18; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_int_rat_19; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_int_rat_20; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_int_rat_21; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_int_rat_22; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_int_rat_23; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_int_rat_24; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_int_rat_25; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_int_rat_26; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_int_rat_27; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_int_rat_28; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_int_rat_29; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_int_rat_30; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_int_rat_31; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_fp_rat_0; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_fp_rat_1; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_fp_rat_2; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_fp_rat_3; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_fp_rat_4; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_fp_rat_5; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_fp_rat_6; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_fp_rat_7; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_fp_rat_8; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_fp_rat_9; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_fp_rat_10; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_fp_rat_11; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_fp_rat_12; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_fp_rat_13; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_fp_rat_14; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_fp_rat_15; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_fp_rat_16; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_fp_rat_17; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_fp_rat_18; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_fp_rat_19; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_fp_rat_20; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_fp_rat_21; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_fp_rat_22; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_fp_rat_23; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_fp_rat_24; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_fp_rat_25; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_fp_rat_26; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_fp_rat_27; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_fp_rat_28; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_fp_rat_29; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_fp_rat_30; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_debug_fp_rat_31; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_perfinfo_perfEventsRs_0_value; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_perfinfo_perfEventsRs_1_value; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_perfinfo_perfEventsRs_2_value; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_perfinfo_perfEventsRs_3_value; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_perfinfo_perfEventsRs_4_value; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_perfinfo_perfEventsRs_5_value; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_perfinfo_perfEventsRs_6_value; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_perfinfo_perfEventsRs_7_value; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_perfinfo_perfEventsEu0_0_value; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_perfinfo_perfEventsEu0_1_value; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_perfinfo_perfEventsEu0_2_value; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_perfinfo_perfEventsEu0_3_value; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_perfinfo_perfEventsEu0_4_value; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_perfinfo_perfEventsEu0_5_value; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_perfinfo_perfEventsEu1_0_value; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_perfinfo_perfEventsEu1_1_value; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_perfinfo_perfEventsEu1_2_value; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_perfinfo_perfEventsEu1_3_value; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_perfinfo_perfEventsEu1_4_value; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_perfinfo_perfEventsEu1_5_value; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_perf_0_value; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_perf_1_value; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_perf_2_value; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_perf_3_value; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_perf_4_value; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_perf_5_value; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_perf_6_value; // @[XSCore.scala 230:29]
  wire [5:0] ctrlBlock_io_perf_7_value; // @[XSCore.scala 230:29]
  wire  itlbRepeater1_clock; // @[Repeater.scala 410:24]
  wire  itlbRepeater1_reset; // @[Repeater.scala 410:24]
  wire  itlbRepeater1_io_sfence_valid; // @[Repeater.scala 410:24]
  wire  itlbRepeater1_io_csr_satp_changed; // @[Repeater.scala 410:24]
  wire  itlbRepeater1_io_tlb_req_0_ready; // @[Repeater.scala 410:24]
  wire  itlbRepeater1_io_tlb_req_0_valid; // @[Repeater.scala 410:24]
  wire [26:0] itlbRepeater1_io_tlb_req_0_bits_vpn; // @[Repeater.scala 410:24]
  wire  itlbRepeater1_io_tlb_req_1_ready; // @[Repeater.scala 410:24]
  wire  itlbRepeater1_io_tlb_req_1_valid; // @[Repeater.scala 410:24]
  wire [26:0] itlbRepeater1_io_tlb_req_1_bits_vpn; // @[Repeater.scala 410:24]
  wire  itlbRepeater1_io_tlb_req_3_ready; // @[Repeater.scala 410:24]
  wire  itlbRepeater1_io_tlb_req_3_valid; // @[Repeater.scala 410:24]
  wire [26:0] itlbRepeater1_io_tlb_req_3_bits_vpn; // @[Repeater.scala 410:24]
  wire  itlbRepeater1_io_tlb_resp_valid; // @[Repeater.scala 410:24]
  wire [26:0] itlbRepeater1_io_tlb_resp_bits_data_entry_tag; // @[Repeater.scala 410:24]
  wire [15:0] itlbRepeater1_io_tlb_resp_bits_data_entry_asid; // @[Repeater.scala 410:24]
  wire [23:0] itlbRepeater1_io_tlb_resp_bits_data_entry_ppn; // @[Repeater.scala 410:24]
  wire  itlbRepeater1_io_tlb_resp_bits_data_entry_perm_d; // @[Repeater.scala 410:24]
  wire  itlbRepeater1_io_tlb_resp_bits_data_entry_perm_a; // @[Repeater.scala 410:24]
  wire  itlbRepeater1_io_tlb_resp_bits_data_entry_perm_g; // @[Repeater.scala 410:24]
  wire  itlbRepeater1_io_tlb_resp_bits_data_entry_perm_u; // @[Repeater.scala 410:24]
  wire  itlbRepeater1_io_tlb_resp_bits_data_entry_perm_x; // @[Repeater.scala 410:24]
  wire  itlbRepeater1_io_tlb_resp_bits_data_entry_perm_w; // @[Repeater.scala 410:24]
  wire  itlbRepeater1_io_tlb_resp_bits_data_entry_perm_r; // @[Repeater.scala 410:24]
  wire [1:0] itlbRepeater1_io_tlb_resp_bits_data_entry_level; // @[Repeater.scala 410:24]
  wire  itlbRepeater1_io_tlb_resp_bits_data_pf; // @[Repeater.scala 410:24]
  wire  itlbRepeater1_io_tlb_resp_bits_data_af; // @[Repeater.scala 410:24]
  wire  itlbRepeater1_io_ptw_req_0_ready; // @[Repeater.scala 410:24]
  wire  itlbRepeater1_io_ptw_req_0_valid; // @[Repeater.scala 410:24]
  wire [26:0] itlbRepeater1_io_ptw_req_0_bits_vpn; // @[Repeater.scala 410:24]
  wire  itlbRepeater1_io_ptw_resp_ready; // @[Repeater.scala 410:24]
  wire  itlbRepeater1_io_ptw_resp_valid; // @[Repeater.scala 410:24]
  wire [26:0] itlbRepeater1_io_ptw_resp_bits_entry_tag; // @[Repeater.scala 410:24]
  wire [15:0] itlbRepeater1_io_ptw_resp_bits_entry_asid; // @[Repeater.scala 410:24]
  wire [23:0] itlbRepeater1_io_ptw_resp_bits_entry_ppn; // @[Repeater.scala 410:24]
  wire  itlbRepeater1_io_ptw_resp_bits_entry_perm_d; // @[Repeater.scala 410:24]
  wire  itlbRepeater1_io_ptw_resp_bits_entry_perm_a; // @[Repeater.scala 410:24]
  wire  itlbRepeater1_io_ptw_resp_bits_entry_perm_g; // @[Repeater.scala 410:24]
  wire  itlbRepeater1_io_ptw_resp_bits_entry_perm_u; // @[Repeater.scala 410:24]
  wire  itlbRepeater1_io_ptw_resp_bits_entry_perm_x; // @[Repeater.scala 410:24]
  wire  itlbRepeater1_io_ptw_resp_bits_entry_perm_w; // @[Repeater.scala 410:24]
  wire  itlbRepeater1_io_ptw_resp_bits_entry_perm_r; // @[Repeater.scala 410:24]
  wire [1:0] itlbRepeater1_io_ptw_resp_bits_entry_level; // @[Repeater.scala 410:24]
  wire  itlbRepeater1_io_ptw_resp_bits_pf; // @[Repeater.scala 410:24]
  wire  itlbRepeater1_io_ptw_resp_bits_af; // @[Repeater.scala 410:24]
  wire  itlbRepeater2_clock; // @[Repeater.scala 383:26]
  wire  itlbRepeater2_reset; // @[Repeater.scala 383:26]
  wire  itlbRepeater2_io_sfence_valid; // @[Repeater.scala 383:26]
  wire  itlbRepeater2_io_csr_satp_changed; // @[Repeater.scala 383:26]
  wire  itlbRepeater2_io_tlb_req_0_ready; // @[Repeater.scala 383:26]
  wire  itlbRepeater2_io_tlb_req_0_valid; // @[Repeater.scala 383:26]
  wire [26:0] itlbRepeater2_io_tlb_req_0_bits_vpn; // @[Repeater.scala 383:26]
  wire  itlbRepeater2_io_tlb_resp_valid; // @[Repeater.scala 383:26]
  wire [26:0] itlbRepeater2_io_tlb_resp_bits_entry_tag; // @[Repeater.scala 383:26]
  wire [15:0] itlbRepeater2_io_tlb_resp_bits_entry_asid; // @[Repeater.scala 383:26]
  wire [23:0] itlbRepeater2_io_tlb_resp_bits_entry_ppn; // @[Repeater.scala 383:26]
  wire  itlbRepeater2_io_tlb_resp_bits_entry_perm_d; // @[Repeater.scala 383:26]
  wire  itlbRepeater2_io_tlb_resp_bits_entry_perm_a; // @[Repeater.scala 383:26]
  wire  itlbRepeater2_io_tlb_resp_bits_entry_perm_g; // @[Repeater.scala 383:26]
  wire  itlbRepeater2_io_tlb_resp_bits_entry_perm_u; // @[Repeater.scala 383:26]
  wire  itlbRepeater2_io_tlb_resp_bits_entry_perm_x; // @[Repeater.scala 383:26]
  wire  itlbRepeater2_io_tlb_resp_bits_entry_perm_w; // @[Repeater.scala 383:26]
  wire  itlbRepeater2_io_tlb_resp_bits_entry_perm_r; // @[Repeater.scala 383:26]
  wire [1:0] itlbRepeater2_io_tlb_resp_bits_entry_level; // @[Repeater.scala 383:26]
  wire  itlbRepeater2_io_tlb_resp_bits_pf; // @[Repeater.scala 383:26]
  wire  itlbRepeater2_io_tlb_resp_bits_af; // @[Repeater.scala 383:26]
  wire  itlbRepeater2_io_ptw_req_0_ready; // @[Repeater.scala 383:26]
  wire  itlbRepeater2_io_ptw_req_0_valid; // @[Repeater.scala 383:26]
  wire [26:0] itlbRepeater2_io_ptw_req_0_bits_vpn; // @[Repeater.scala 383:26]
  wire  itlbRepeater2_io_ptw_resp_ready; // @[Repeater.scala 383:26]
  wire  itlbRepeater2_io_ptw_resp_valid; // @[Repeater.scala 383:26]
  wire [26:0] itlbRepeater2_io_ptw_resp_bits_entry_tag; // @[Repeater.scala 383:26]
  wire [15:0] itlbRepeater2_io_ptw_resp_bits_entry_asid; // @[Repeater.scala 383:26]
  wire [23:0] itlbRepeater2_io_ptw_resp_bits_entry_ppn; // @[Repeater.scala 383:26]
  wire  itlbRepeater2_io_ptw_resp_bits_entry_perm_d; // @[Repeater.scala 383:26]
  wire  itlbRepeater2_io_ptw_resp_bits_entry_perm_a; // @[Repeater.scala 383:26]
  wire  itlbRepeater2_io_ptw_resp_bits_entry_perm_g; // @[Repeater.scala 383:26]
  wire  itlbRepeater2_io_ptw_resp_bits_entry_perm_u; // @[Repeater.scala 383:26]
  wire  itlbRepeater2_io_ptw_resp_bits_entry_perm_x; // @[Repeater.scala 383:26]
  wire  itlbRepeater2_io_ptw_resp_bits_entry_perm_w; // @[Repeater.scala 383:26]
  wire  itlbRepeater2_io_ptw_resp_bits_entry_perm_r; // @[Repeater.scala 383:26]
  wire [1:0] itlbRepeater2_io_ptw_resp_bits_entry_level; // @[Repeater.scala 383:26]
  wire  itlbRepeater2_io_ptw_resp_bits_pf; // @[Repeater.scala 383:26]
  wire  itlbRepeater2_io_ptw_resp_bits_af; // @[Repeater.scala 383:26]
  wire  dtlbRepeater1_clock; // @[Repeater.scala 410:24]
  wire  dtlbRepeater1_reset; // @[Repeater.scala 410:24]
  wire  dtlbRepeater1_io_sfence_valid; // @[Repeater.scala 410:24]
  wire  dtlbRepeater1_io_csr_satp_changed; // @[Repeater.scala 410:24]
  wire  dtlbRepeater1_io_tlb_req_0_valid; // @[Repeater.scala 410:24]
  wire [26:0] dtlbRepeater1_io_tlb_req_0_bits_vpn; // @[Repeater.scala 410:24]
  wire  dtlbRepeater1_io_tlb_req_1_valid; // @[Repeater.scala 410:24]
  wire [26:0] dtlbRepeater1_io_tlb_req_1_bits_vpn; // @[Repeater.scala 410:24]
  wire  dtlbRepeater1_io_tlb_req_2_valid; // @[Repeater.scala 410:24]
  wire [26:0] dtlbRepeater1_io_tlb_req_2_bits_vpn; // @[Repeater.scala 410:24]
  wire  dtlbRepeater1_io_tlb_req_3_valid; // @[Repeater.scala 410:24]
  wire [26:0] dtlbRepeater1_io_tlb_req_3_bits_vpn; // @[Repeater.scala 410:24]
  wire  dtlbRepeater1_io_tlb_resp_valid; // @[Repeater.scala 410:24]
  wire [26:0] dtlbRepeater1_io_tlb_resp_bits_data_entry_tag; // @[Repeater.scala 410:24]
  wire [15:0] dtlbRepeater1_io_tlb_resp_bits_data_entry_asid; // @[Repeater.scala 410:24]
  wire [23:0] dtlbRepeater1_io_tlb_resp_bits_data_entry_ppn; // @[Repeater.scala 410:24]
  wire  dtlbRepeater1_io_tlb_resp_bits_data_entry_perm_d; // @[Repeater.scala 410:24]
  wire  dtlbRepeater1_io_tlb_resp_bits_data_entry_perm_a; // @[Repeater.scala 410:24]
  wire  dtlbRepeater1_io_tlb_resp_bits_data_entry_perm_g; // @[Repeater.scala 410:24]
  wire  dtlbRepeater1_io_tlb_resp_bits_data_entry_perm_u; // @[Repeater.scala 410:24]
  wire  dtlbRepeater1_io_tlb_resp_bits_data_entry_perm_x; // @[Repeater.scala 410:24]
  wire  dtlbRepeater1_io_tlb_resp_bits_data_entry_perm_w; // @[Repeater.scala 410:24]
  wire  dtlbRepeater1_io_tlb_resp_bits_data_entry_perm_r; // @[Repeater.scala 410:24]
  wire [1:0] dtlbRepeater1_io_tlb_resp_bits_data_entry_level; // @[Repeater.scala 410:24]
  wire  dtlbRepeater1_io_tlb_resp_bits_data_pf; // @[Repeater.scala 410:24]
  wire  dtlbRepeater1_io_tlb_resp_bits_data_af; // @[Repeater.scala 410:24]
  wire  dtlbRepeater1_io_tlb_resp_bits_vector_0; // @[Repeater.scala 410:24]
  wire  dtlbRepeater1_io_tlb_resp_bits_vector_1; // @[Repeater.scala 410:24]
  wire  dtlbRepeater1_io_tlb_resp_bits_vector_2; // @[Repeater.scala 410:24]
  wire  dtlbRepeater1_io_tlb_resp_bits_vector_3; // @[Repeater.scala 410:24]
  wire  dtlbRepeater1_io_tlb_resp_bits_vector_4; // @[Repeater.scala 410:24]
  wire  dtlbRepeater1_io_ptw_req_0_ready; // @[Repeater.scala 410:24]
  wire  dtlbRepeater1_io_ptw_req_0_valid; // @[Repeater.scala 410:24]
  wire [26:0] dtlbRepeater1_io_ptw_req_0_bits_vpn; // @[Repeater.scala 410:24]
  wire  dtlbRepeater1_io_ptw_resp_ready; // @[Repeater.scala 410:24]
  wire  dtlbRepeater1_io_ptw_resp_valid; // @[Repeater.scala 410:24]
  wire [26:0] dtlbRepeater1_io_ptw_resp_bits_entry_tag; // @[Repeater.scala 410:24]
  wire [15:0] dtlbRepeater1_io_ptw_resp_bits_entry_asid; // @[Repeater.scala 410:24]
  wire [23:0] dtlbRepeater1_io_ptw_resp_bits_entry_ppn; // @[Repeater.scala 410:24]
  wire  dtlbRepeater1_io_ptw_resp_bits_entry_perm_d; // @[Repeater.scala 410:24]
  wire  dtlbRepeater1_io_ptw_resp_bits_entry_perm_a; // @[Repeater.scala 410:24]
  wire  dtlbRepeater1_io_ptw_resp_bits_entry_perm_g; // @[Repeater.scala 410:24]
  wire  dtlbRepeater1_io_ptw_resp_bits_entry_perm_u; // @[Repeater.scala 410:24]
  wire  dtlbRepeater1_io_ptw_resp_bits_entry_perm_x; // @[Repeater.scala 410:24]
  wire  dtlbRepeater1_io_ptw_resp_bits_entry_perm_w; // @[Repeater.scala 410:24]
  wire  dtlbRepeater1_io_ptw_resp_bits_entry_perm_r; // @[Repeater.scala 410:24]
  wire [1:0] dtlbRepeater1_io_ptw_resp_bits_entry_level; // @[Repeater.scala 410:24]
  wire  dtlbRepeater1_io_ptw_resp_bits_pf; // @[Repeater.scala 410:24]
  wire  dtlbRepeater1_io_ptw_resp_bits_af; // @[Repeater.scala 410:24]
  wire  dtlbRepeater2_clock; // @[Repeater.scala 383:26]
  wire  dtlbRepeater2_reset; // @[Repeater.scala 383:26]
  wire  dtlbRepeater2_io_sfence_valid; // @[Repeater.scala 383:26]
  wire  dtlbRepeater2_io_csr_satp_changed; // @[Repeater.scala 383:26]
  wire  dtlbRepeater2_io_tlb_req_0_ready; // @[Repeater.scala 383:26]
  wire  dtlbRepeater2_io_tlb_req_0_valid; // @[Repeater.scala 383:26]
  wire [26:0] dtlbRepeater2_io_tlb_req_0_bits_vpn; // @[Repeater.scala 383:26]
  wire  dtlbRepeater2_io_tlb_resp_valid; // @[Repeater.scala 383:26]
  wire [26:0] dtlbRepeater2_io_tlb_resp_bits_entry_tag; // @[Repeater.scala 383:26]
  wire [15:0] dtlbRepeater2_io_tlb_resp_bits_entry_asid; // @[Repeater.scala 383:26]
  wire [23:0] dtlbRepeater2_io_tlb_resp_bits_entry_ppn; // @[Repeater.scala 383:26]
  wire  dtlbRepeater2_io_tlb_resp_bits_entry_perm_d; // @[Repeater.scala 383:26]
  wire  dtlbRepeater2_io_tlb_resp_bits_entry_perm_a; // @[Repeater.scala 383:26]
  wire  dtlbRepeater2_io_tlb_resp_bits_entry_perm_g; // @[Repeater.scala 383:26]
  wire  dtlbRepeater2_io_tlb_resp_bits_entry_perm_u; // @[Repeater.scala 383:26]
  wire  dtlbRepeater2_io_tlb_resp_bits_entry_perm_x; // @[Repeater.scala 383:26]
  wire  dtlbRepeater2_io_tlb_resp_bits_entry_perm_w; // @[Repeater.scala 383:26]
  wire  dtlbRepeater2_io_tlb_resp_bits_entry_perm_r; // @[Repeater.scala 383:26]
  wire [1:0] dtlbRepeater2_io_tlb_resp_bits_entry_level; // @[Repeater.scala 383:26]
  wire  dtlbRepeater2_io_tlb_resp_bits_pf; // @[Repeater.scala 383:26]
  wire  dtlbRepeater2_io_tlb_resp_bits_af; // @[Repeater.scala 383:26]
  wire  dtlbRepeater2_io_ptw_req_0_ready; // @[Repeater.scala 383:26]
  wire  dtlbRepeater2_io_ptw_req_0_valid; // @[Repeater.scala 383:26]
  wire [26:0] dtlbRepeater2_io_ptw_req_0_bits_vpn; // @[Repeater.scala 383:26]
  wire  dtlbRepeater2_io_ptw_resp_ready; // @[Repeater.scala 383:26]
  wire  dtlbRepeater2_io_ptw_resp_valid; // @[Repeater.scala 383:26]
  wire [26:0] dtlbRepeater2_io_ptw_resp_bits_entry_tag; // @[Repeater.scala 383:26]
  wire [15:0] dtlbRepeater2_io_ptw_resp_bits_entry_asid; // @[Repeater.scala 383:26]
  wire [23:0] dtlbRepeater2_io_ptw_resp_bits_entry_ppn; // @[Repeater.scala 383:26]
  wire  dtlbRepeater2_io_ptw_resp_bits_entry_perm_d; // @[Repeater.scala 383:26]
  wire  dtlbRepeater2_io_ptw_resp_bits_entry_perm_a; // @[Repeater.scala 383:26]
  wire  dtlbRepeater2_io_ptw_resp_bits_entry_perm_g; // @[Repeater.scala 383:26]
  wire  dtlbRepeater2_io_ptw_resp_bits_entry_perm_u; // @[Repeater.scala 383:26]
  wire  dtlbRepeater2_io_ptw_resp_bits_entry_perm_x; // @[Repeater.scala 383:26]
  wire  dtlbRepeater2_io_ptw_resp_bits_entry_perm_w; // @[Repeater.scala 383:26]
  wire  dtlbRepeater2_io_ptw_resp_bits_entry_perm_r; // @[Repeater.scala 383:26]
  wire [1:0] dtlbRepeater2_io_ptw_resp_bits_entry_level; // @[Repeater.scala 383:26]
  wire  dtlbRepeater2_io_ptw_resp_bits_pf; // @[Repeater.scala 383:26]
  wire  dtlbRepeater2_io_ptw_resp_bits_af; // @[Repeater.scala 383:26]
  wire  resetGen_clock; // @[ResetGen.scala 52:34]
  wire  resetGen_reset; // @[ResetGen.scala 52:34]
  wire  resetGen_o_reset; // @[ResetGen.scala 52:34]
  wire  resetGen_1_clock; // @[ResetGen.scala 52:34]
  wire  resetGen_1_reset; // @[ResetGen.scala 52:34]
  wire  resetGen_1_o_reset; // @[ResetGen.scala 52:34]
  wire  resetGen_2_clock; // @[ResetGen.scala 52:34]
  wire  resetGen_2_reset; // @[ResetGen.scala 52:34]
  wire  resetGen_2_o_reset; // @[ResetGen.scala 52:34]
  wire  resetGen_3_clock; // @[ResetGen.scala 52:34]
  wire  resetGen_3_reset; // @[ResetGen.scala 52:34]
  wire  resetGen_3_o_reset; // @[ResetGen.scala 52:34]
  wire  resetGen_4_clock; // @[ResetGen.scala 52:34]
  wire  resetGen_4_reset; // @[ResetGen.scala 52:34]
  wire  resetGen_4_o_reset; // @[ResetGen.scala 52:34]
  wire  resetGen_5_clock; // @[ResetGen.scala 52:34]
  wire  resetGen_5_reset; // @[ResetGen.scala 52:34]
  wire  resetGen_5_o_reset; // @[ResetGen.scala 52:34]
  Frontend frontend ( // @[XSCore.scala 140:28]
    .clock(frontend_clock),
    .reset(frontend_reset),
    .auto_icache_client_out_a_ready(frontend_auto_icache_client_out_a_ready),
    .auto_icache_client_out_a_valid(frontend_auto_icache_client_out_a_valid),
    .auto_icache_client_out_a_bits_opcode(frontend_auto_icache_client_out_a_bits_opcode),
    .auto_icache_client_out_a_bits_size(frontend_auto_icache_client_out_a_bits_size),
    .auto_icache_client_out_a_bits_source(frontend_auto_icache_client_out_a_bits_source),
    .auto_icache_client_out_a_bits_address(frontend_auto_icache_client_out_a_bits_address),
    .auto_icache_client_out_a_bits_mask(frontend_auto_icache_client_out_a_bits_mask),
    .auto_icache_client_out_bready(frontend_auto_icache_client_out_bready),
    .auto_icache_client_out_bvalid(frontend_auto_icache_client_out_bvalid),
    .auto_icache_client_out_bparam(frontend_auto_icache_client_out_bparam),
    .auto_icache_client_out_baddress(frontend_auto_icache_client_out_baddress),
    .auto_icache_client_out_bdata(frontend_auto_icache_client_out_bdata),
    .auto_icache_client_out_c_ready(frontend_auto_icache_client_out_c_ready),
    .auto_icache_client_out_c_valid(frontend_auto_icache_client_out_c_valid),
    .auto_icache_client_out_c_bits_opcode(frontend_auto_icache_client_out_c_bits_opcode),
    .auto_icache_client_out_c_bits_param(frontend_auto_icache_client_out_c_bits_param),
    .auto_icache_client_out_c_bits_address(frontend_auto_icache_client_out_c_bits_address),
    .auto_icache_client_out_c_bits_echo_blockisdirty(frontend_auto_icache_client_out_c_bits_echo_blockisdirty),
    .auto_icache_client_out_c_bits_data(frontend_auto_icache_client_out_c_bits_data),
    .auto_icache_client_out_d_ready(frontend_auto_icache_client_out_d_ready),
    .auto_icache_client_out_d_valid(frontend_auto_icache_client_out_d_valid),
    .auto_icache_client_out_d_bits_opcode(frontend_auto_icache_client_out_d_bits_opcode),
    .auto_icache_client_out_d_bits_param(frontend_auto_icache_client_out_d_bits_param),
    .auto_icache_client_out_d_bits_source(frontend_auto_icache_client_out_d_bits_source),
    .auto_icache_client_out_d_bits_sink(frontend_auto_icache_client_out_d_bits_sink),
    .auto_icache_client_out_d_bits_echo_blockisdirty(frontend_auto_icache_client_out_d_bits_echo_blockisdirty),
    .auto_icache_client_out_d_bits_data(frontend_auto_icache_client_out_d_bits_data),
    .auto_icache_client_out_d_bits_corrupt(frontend_auto_icache_client_out_d_bits_corrupt),
    .auto_icache_client_out_e_ready(frontend_auto_icache_client_out_e_ready),
    .auto_icache_client_out_e_valid(frontend_auto_icache_client_out_e_valid),
    .auto_icache_client_out_e_bits_sink(frontend_auto_icache_client_out_e_bits_sink),
    .auto_instrUncache_client_out_a_ready(frontend_auto_instrUncache_client_out_a_ready),
    .auto_instrUncache_client_out_a_valid(frontend_auto_instrUncache_client_out_a_valid),
    .auto_instrUncache_client_out_a_bits_address(frontend_auto_instrUncache_client_out_a_bits_address),
    .auto_instrUncache_client_out_d_ready(frontend_auto_instrUncache_client_out_d_ready),
    .auto_instrUncache_client_out_d_valid(frontend_auto_instrUncache_client_out_d_valid),
    .auto_instrUncache_client_out_d_bits_source(frontend_auto_instrUncache_client_out_d_bits_source),
    .auto_instrUncache_client_out_d_bits_data(frontend_auto_instrUncache_client_out_d_bits_data),
    .io_reset_vector(frontend_io_reset_vector),
    .io_ptw_req_0_ready(frontend_io_ptw_req_0_ready),
    .io_ptw_req_0_valid(frontend_io_ptw_req_0_valid),
    .io_ptw_req_0_bits_vpn(frontend_io_ptw_req_0_bits_vpn),
    .io_ptw_req_1_ready(frontend_io_ptw_req_1_ready),
    .io_ptw_req_1_valid(frontend_io_ptw_req_1_valid),
    .io_ptw_req_1_bits_vpn(frontend_io_ptw_req_1_bits_vpn),
    .io_ptw_req_3_ready(frontend_io_ptw_req_3_ready),
    .io_ptw_req_3_valid(frontend_io_ptw_req_3_valid),
    .io_ptw_req_3_bits_vpn(frontend_io_ptw_req_3_bits_vpn),
    .io_ptw_resp_valid(frontend_io_ptw_resp_valid),
    .io_ptw_resp_bits_data_entry_tag(frontend_io_ptw_resp_bits_data_entry_tag),
    .io_ptw_resp_bits_data_entry_asid(frontend_io_ptw_resp_bits_data_entry_asid),
    .io_ptw_resp_bits_data_entry_ppn(frontend_io_ptw_resp_bits_data_entry_ppn),
    .io_ptw_resp_bits_data_entry_perm_d(frontend_io_ptw_resp_bits_data_entry_perm_d),
    .io_ptw_resp_bits_data_entry_perm_a(frontend_io_ptw_resp_bits_data_entry_perm_a),
    .io_ptw_resp_bits_data_entry_perm_g(frontend_io_ptw_resp_bits_data_entry_perm_g),
    .io_ptw_resp_bits_data_entry_perm_u(frontend_io_ptw_resp_bits_data_entry_perm_u),
    .io_ptw_resp_bits_data_entry_perm_x(frontend_io_ptw_resp_bits_data_entry_perm_x),
    .io_ptw_resp_bits_data_entry_perm_w(frontend_io_ptw_resp_bits_data_entry_perm_w),
    .io_ptw_resp_bits_data_entry_perm_r(frontend_io_ptw_resp_bits_data_entry_perm_r),
    .io_ptw_resp_bits_data_entry_level(frontend_io_ptw_resp_bits_data_entry_level),
    .io_ptw_resp_bits_data_pf(frontend_io_ptw_resp_bits_data_pf),
    .io_ptw_resp_bits_data_af(frontend_io_ptw_resp_bits_data_af),
    .io_backend_cfVec_0_ready(frontend_io_backend_cfVec_0_ready),
    .io_backend_cfVec_0_valid(frontend_io_backend_cfVec_0_valid),
    .io_backend_cfVec_0_bits_instr(frontend_io_backend_cfVec_0_bits_instr),
    .io_backend_cfVec_0_bits_foldpc(frontend_io_backend_cfVec_0_bits_foldpc),
    .io_backend_cfVec_0_bits_exceptionVec_1(frontend_io_backend_cfVec_0_bits_exceptionVec_1),
    .io_backend_cfVec_0_bits_exceptionVec_12(frontend_io_backend_cfVec_0_bits_exceptionVec_12),
    .io_backend_cfVec_0_bits_trigger_frontendHit_0(frontend_io_backend_cfVec_0_bits_trigger_frontendHit_0),
    .io_backend_cfVec_0_bits_trigger_frontendHit_1(frontend_io_backend_cfVec_0_bits_trigger_frontendHit_1),
    .io_backend_cfVec_0_bits_trigger_frontendHit_2(frontend_io_backend_cfVec_0_bits_trigger_frontendHit_2),
    .io_backend_cfVec_0_bits_trigger_frontendHit_3(frontend_io_backend_cfVec_0_bits_trigger_frontendHit_3),
    .io_backend_cfVec_0_bits_trigger_backendEn_0(frontend_io_backend_cfVec_0_bits_trigger_backendEn_0),
    .io_backend_cfVec_0_bits_trigger_backendEn_1(frontend_io_backend_cfVec_0_bits_trigger_backendEn_1),
    .io_backend_cfVec_0_bits_pd_isRVC(frontend_io_backend_cfVec_0_bits_pd_isRVC),
    .io_backend_cfVec_0_bits_pd_brType(frontend_io_backend_cfVec_0_bits_pd_brType),
    .io_backend_cfVec_0_bits_pd_isCall(frontend_io_backend_cfVec_0_bits_pd_isCall),
    .io_backend_cfVec_0_bits_pd_isRet(frontend_io_backend_cfVec_0_bits_pd_isRet),
    .io_backend_cfVec_0_bits_pred_taken(frontend_io_backend_cfVec_0_bits_pred_taken),
    .io_backend_cfVec_0_bits_crossPageIPFFix(frontend_io_backend_cfVec_0_bits_crossPageIPFFix),
    .io_backend_cfVec_0_bits_ftqPtr_flag(frontend_io_backend_cfVec_0_bits_ftqPtr_flag),
    .io_backend_cfVec_0_bits_ftqPtr_value(frontend_io_backend_cfVec_0_bits_ftqPtr_value),
    .io_backend_cfVec_0_bits_ftqOffset(frontend_io_backend_cfVec_0_bits_ftqOffset),
    .io_backend_cfVec_1_ready(frontend_io_backend_cfVec_1_ready),
    .io_backend_cfVec_1_valid(frontend_io_backend_cfVec_1_valid),
    .io_backend_cfVec_1_bits_instr(frontend_io_backend_cfVec_1_bits_instr),
    .io_backend_cfVec_1_bits_foldpc(frontend_io_backend_cfVec_1_bits_foldpc),
    .io_backend_cfVec_1_bits_exceptionVec_1(frontend_io_backend_cfVec_1_bits_exceptionVec_1),
    .io_backend_cfVec_1_bits_exceptionVec_12(frontend_io_backend_cfVec_1_bits_exceptionVec_12),
    .io_backend_cfVec_1_bits_trigger_frontendHit_0(frontend_io_backend_cfVec_1_bits_trigger_frontendHit_0),
    .io_backend_cfVec_1_bits_trigger_frontendHit_1(frontend_io_backend_cfVec_1_bits_trigger_frontendHit_1),
    .io_backend_cfVec_1_bits_trigger_frontendHit_2(frontend_io_backend_cfVec_1_bits_trigger_frontendHit_2),
    .io_backend_cfVec_1_bits_trigger_frontendHit_3(frontend_io_backend_cfVec_1_bits_trigger_frontendHit_3),
    .io_backend_cfVec_1_bits_trigger_backendEn_0(frontend_io_backend_cfVec_1_bits_trigger_backendEn_0),
    .io_backend_cfVec_1_bits_trigger_backendEn_1(frontend_io_backend_cfVec_1_bits_trigger_backendEn_1),
    .io_backend_cfVec_1_bits_pd_isRVC(frontend_io_backend_cfVec_1_bits_pd_isRVC),
    .io_backend_cfVec_1_bits_pd_brType(frontend_io_backend_cfVec_1_bits_pd_brType),
    .io_backend_cfVec_1_bits_pd_isCall(frontend_io_backend_cfVec_1_bits_pd_isCall),
    .io_backend_cfVec_1_bits_pd_isRet(frontend_io_backend_cfVec_1_bits_pd_isRet),
    .io_backend_cfVec_1_bits_pred_taken(frontend_io_backend_cfVec_1_bits_pred_taken),
    .io_backend_cfVec_1_bits_crossPageIPFFix(frontend_io_backend_cfVec_1_bits_crossPageIPFFix),
    .io_backend_cfVec_1_bits_ftqPtr_flag(frontend_io_backend_cfVec_1_bits_ftqPtr_flag),
    .io_backend_cfVec_1_bits_ftqPtr_value(frontend_io_backend_cfVec_1_bits_ftqPtr_value),
    .io_backend_cfVec_1_bits_ftqOffset(frontend_io_backend_cfVec_1_bits_ftqOffset),
    .io_backend_fromFtq_pc_mem_wen(frontend_io_backend_fromFtq_pc_mem_wen),
    .io_backend_fromFtq_pc_mem_waddr(frontend_io_backend_fromFtq_pc_mem_waddr),
    .io_backend_fromFtq_pc_mem_wdata_startAddr(frontend_io_backend_fromFtq_pc_mem_wdata_startAddr),
    .io_backend_fromFtq_pc_mem_wdata_nextLineAddr(frontend_io_backend_fromFtq_pc_mem_wdata_nextLineAddr),
    .io_backend_fromFtq_pc_mem_wdata_isNextMask_0(frontend_io_backend_fromFtq_pc_mem_wdata_isNextMask_0),
    .io_backend_fromFtq_pc_mem_wdata_isNextMask_1(frontend_io_backend_fromFtq_pc_mem_wdata_isNextMask_1),
    .io_backend_fromFtq_pc_mem_wdata_isNextMask_2(frontend_io_backend_fromFtq_pc_mem_wdata_isNextMask_2),
    .io_backend_fromFtq_pc_mem_wdata_isNextMask_3(frontend_io_backend_fromFtq_pc_mem_wdata_isNextMask_3),
    .io_backend_fromFtq_pc_mem_wdata_isNextMask_4(frontend_io_backend_fromFtq_pc_mem_wdata_isNextMask_4),
    .io_backend_fromFtq_pc_mem_wdata_isNextMask_5(frontend_io_backend_fromFtq_pc_mem_wdata_isNextMask_5),
    .io_backend_fromFtq_pc_mem_wdata_isNextMask_6(frontend_io_backend_fromFtq_pc_mem_wdata_isNextMask_6),
    .io_backend_fromFtq_pc_mem_wdata_isNextMask_7(frontend_io_backend_fromFtq_pc_mem_wdata_isNextMask_7),
    .io_backend_fromFtq_newest_entry_target(frontend_io_backend_fromFtq_newest_entry_target),
    .io_backend_fromFtq_newest_entry_ptr_flag(frontend_io_backend_fromFtq_newest_entry_ptr_flag),
    .io_backend_fromFtq_newest_entry_ptr_value(frontend_io_backend_fromFtq_newest_entry_ptr_value),
    .io_backend_toFtq_rob_commits_0_valid(frontend_io_backend_toFtq_rob_commits_0_valid),
    .io_backend_toFtq_rob_commits_0_bits_commitType(frontend_io_backend_toFtq_rob_commits_0_bits_commitType),
    .io_backend_toFtq_rob_commits_0_bits_ftqIdx_flag(frontend_io_backend_toFtq_rob_commits_0_bits_ftqIdx_flag),
    .io_backend_toFtq_rob_commits_0_bits_ftqIdx_value(frontend_io_backend_toFtq_rob_commits_0_bits_ftqIdx_value),
    .io_backend_toFtq_rob_commits_0_bits_ftqOffset(frontend_io_backend_toFtq_rob_commits_0_bits_ftqOffset),
    .io_backend_toFtq_rob_commits_1_valid(frontend_io_backend_toFtq_rob_commits_1_valid),
    .io_backend_toFtq_rob_commits_1_bits_commitType(frontend_io_backend_toFtq_rob_commits_1_bits_commitType),
    .io_backend_toFtq_rob_commits_1_bits_ftqIdx_flag(frontend_io_backend_toFtq_rob_commits_1_bits_ftqIdx_flag),
    .io_backend_toFtq_rob_commits_1_bits_ftqIdx_value(frontend_io_backend_toFtq_rob_commits_1_bits_ftqIdx_value),
    .io_backend_toFtq_rob_commits_1_bits_ftqOffset(frontend_io_backend_toFtq_rob_commits_1_bits_ftqOffset),
    .io_backend_toFtq_redirect_valid(frontend_io_backend_toFtq_redirect_valid),
    .io_backend_toFtq_redirect_bits_ftqIdx_flag(frontend_io_backend_toFtq_redirect_bits_ftqIdx_flag),
    .io_backend_toFtq_redirect_bits_ftqIdx_value(frontend_io_backend_toFtq_redirect_bits_ftqIdx_value),
    .io_backend_toFtq_redirect_bits_ftqOffset(frontend_io_backend_toFtq_redirect_bits_ftqOffset),
    .io_backend_toFtq_redirect_bits_level(frontend_io_backend_toFtq_redirect_bits_level),
    .io_backend_toFtq_redirect_bits_cfiUpdate_pc(frontend_io_backend_toFtq_redirect_bits_cfiUpdate_pc),
    .io_backend_toFtq_redirect_bits_cfiUpdate_pd_isRVC(frontend_io_backend_toFtq_redirect_bits_cfiUpdate_pd_isRVC),
    .io_backend_toFtq_redirect_bits_cfiUpdate_pd_brType(frontend_io_backend_toFtq_redirect_bits_cfiUpdate_pd_brType),
    .io_backend_toFtq_redirect_bits_cfiUpdate_pd_isCall(frontend_io_backend_toFtq_redirect_bits_cfiUpdate_pd_isCall),
    .io_backend_toFtq_redirect_bits_cfiUpdate_pd_isRet(frontend_io_backend_toFtq_redirect_bits_cfiUpdate_pd_isRet),
    .io_backend_toFtq_redirect_bits_cfiUpdate_target(frontend_io_backend_toFtq_redirect_bits_cfiUpdate_target),
    .io_backend_toFtq_redirect_bits_cfiUpdate_taken(frontend_io_backend_toFtq_redirect_bits_cfiUpdate_taken),
    .io_backend_toFtq_redirect_bits_cfiUpdate_isMisPred(frontend_io_backend_toFtq_redirect_bits_cfiUpdate_isMisPred),
    .io_sfence_valid(frontend_io_sfence_valid),
    .io_sfence_bits_rs1(frontend_io_sfence_bits_rs1),
    .io_sfence_bits_rs2(frontend_io_sfence_bits_rs2),
    .io_sfence_bits_addr(frontend_io_sfence_bits_addr),
    .io_sfence_bits_asid(frontend_io_sfence_bits_asid),
    .io_tlbCsr_satp_mode(frontend_io_tlbCsr_satp_mode),
    .io_tlbCsr_satp_asid(frontend_io_tlbCsr_satp_asid),
    .io_tlbCsr_satp_ppn(frontend_io_tlbCsr_satp_ppn),
    .io_tlbCsr_satp_changed(frontend_io_tlbCsr_satp_changed),
    .io_tlbCsr_priv_mxr(frontend_io_tlbCsr_priv_mxr),
    .io_tlbCsr_priv_sum(frontend_io_tlbCsr_priv_sum),
    .io_tlbCsr_priv_imode(frontend_io_tlbCsr_priv_imode),
    .io_tlbCsr_priv_dmode(frontend_io_tlbCsr_priv_dmode),
    .io_csrCtrl_icache_parity_enable(frontend_io_csrCtrl_icache_parity_enable),
    .io_csrCtrl_lvpred_disable(frontend_io_csrCtrl_lvpred_disable),
    .io_csrCtrl_no_spec_load(frontend_io_csrCtrl_no_spec_load),
    .io_csrCtrl_storeset_wait_store(frontend_io_csrCtrl_storeset_wait_store),
    .io_csrCtrl_lvpred_timeout(frontend_io_csrCtrl_lvpred_timeout),
    .io_csrCtrl_bp_ctrl_ubtb_enable(frontend_io_csrCtrl_bp_ctrl_ubtb_enable),
    .io_csrCtrl_bp_ctrl_btb_enable(frontend_io_csrCtrl_bp_ctrl_btb_enable),
    .io_csrCtrl_bp_ctrl_tage_enable(frontend_io_csrCtrl_bp_ctrl_tage_enable),
    .io_csrCtrl_bp_ctrl_sc_enable(frontend_io_csrCtrl_bp_ctrl_sc_enable),
    .io_csrCtrl_bp_ctrl_ras_enable(frontend_io_csrCtrl_bp_ctrl_ras_enable),
    .io_csrCtrl_sbuffer_threshold(frontend_io_csrCtrl_sbuffer_threshold),
    .io_csrCtrl_ldld_vio_check_enable(frontend_io_csrCtrl_ldld_vio_check_enable),
    .io_csrCtrl_cache_error_enable(frontend_io_csrCtrl_cache_error_enable),
    .io_csrCtrl_uncache_write_outstanding_enable(frontend_io_csrCtrl_uncache_write_outstanding_enable),
    .io_csrCtrl_fusion_enable(frontend_io_csrCtrl_fusion_enable),
    .io_csrCtrl_wfi_enable(frontend_io_csrCtrl_wfi_enable),
    .io_csrCtrl_svinval_enable(frontend_io_csrCtrl_svinval_enable),
    .io_csrCtrl_distribute_csr_wvalid(frontend_io_csrCtrl_distribute_csr_wvalid),
    .io_csrCtrl_distribute_csr_waddr(frontend_io_csrCtrl_distribute_csr_waddr),
    .io_csrCtrl_distribute_csr_wdata(frontend_io_csrCtrl_distribute_csr_wdata),
    .io_csrCtrl_singlestep(frontend_io_csrCtrl_singlestep),
    .io_csrCtrl_frontend_trigger_t_valid(frontend_io_csrCtrl_frontend_trigger_t_valid),
    .io_csrCtrl_frontend_trigger_t_bits_addr(frontend_io_csrCtrl_frontend_trigger_t_bits_addr),
    .io_csrCtrl_frontend_trigger_t_bits_tdata_matchType(frontend_io_csrCtrl_frontend_trigger_t_bits_tdata_matchType),
    .io_csrCtrl_frontend_trigger_t_bits_tdata_select(frontend_io_csrCtrl_frontend_trigger_t_bits_tdata_select),
    .io_csrCtrl_frontend_trigger_t_bits_tdata_timing(frontend_io_csrCtrl_frontend_trigger_t_bits_tdata_timing),
    .io_csrCtrl_frontend_trigger_t_bits_tdata_chain(frontend_io_csrCtrl_frontend_trigger_t_bits_tdata_chain),
    .io_csrCtrl_frontend_trigger_t_bits_tdata_tdata2(frontend_io_csrCtrl_frontend_trigger_t_bits_tdata_tdata2),
    .io_csrCtrl_mem_trigger_t_valid(frontend_io_csrCtrl_mem_trigger_t_valid),
    .io_csrCtrl_mem_trigger_t_bits_addr(frontend_io_csrCtrl_mem_trigger_t_bits_addr),
    .io_csrCtrl_mem_trigger_t_bits_tdata_matchType(frontend_io_csrCtrl_mem_trigger_t_bits_tdata_matchType),
    .io_csrCtrl_mem_trigger_t_bits_tdata_select(frontend_io_csrCtrl_mem_trigger_t_bits_tdata_select),
    .io_csrCtrl_mem_trigger_t_bits_tdata_chain(frontend_io_csrCtrl_mem_trigger_t_bits_tdata_chain),
    .io_csrCtrl_mem_trigger_t_bits_tdata_tdata2(frontend_io_csrCtrl_mem_trigger_t_bits_tdata_tdata2),
    .io_csrCtrl_trigger_enable_0(frontend_io_csrCtrl_trigger_enable_0),
    .io_csrCtrl_trigger_enable_1(frontend_io_csrCtrl_trigger_enable_1),
    .io_csrCtrl_trigger_enable_2(frontend_io_csrCtrl_trigger_enable_2),
    .io_csrCtrl_trigger_enable_3(frontend_io_csrCtrl_trigger_enable_3),
    .io_csrCtrl_trigger_enable_4(frontend_io_csrCtrl_trigger_enable_4),
    .io_csrCtrl_trigger_enable_5(frontend_io_csrCtrl_trigger_enable_5),
    .io_csrCtrl_trigger_enable_6(frontend_io_csrCtrl_trigger_enable_6),
    .io_csrCtrl_trigger_enable_7(frontend_io_csrCtrl_trigger_enable_7),
    .io_csrCtrl_trigger_enable_8(frontend_io_csrCtrl_trigger_enable_8),
    .io_csrCtrl_trigger_enable_9(frontend_io_csrCtrl_trigger_enable_9),
    .io_csrUpdate_wvalid(frontend_io_csrUpdate_wvalid),
    .io_csrUpdate_waddr(frontend_io_csrUpdate_waddr),
    .io_csrUpdate_wdata(frontend_io_csrUpdate_wdata),
    .io_error_paddr(frontend_io_error_paddr),
    .io_error_report_to_beu(frontend_io_error_report_to_beu),
    .io_perf_0_value(frontend_io_perf_0_value),
    .io_perf_1_value(frontend_io_perf_1_value),
    .io_perf_2_value(frontend_io_perf_2_value),
    .io_perf_3_value(frontend_io_perf_3_value),
    .io_perf_4_value(frontend_io_perf_4_value),
    .io_perf_5_value(frontend_io_perf_5_value),
    .io_perf_6_value(frontend_io_perf_6_value),
    .io_perf_7_value(frontend_io_perf_7_value)
  );
  L2TLBWrapper ptw ( // @[XSCore.scala 141:23]
    .clock(ptw_clock),
    .reset(ptw_reset),
    .auto_out_a_ready(ptw_auto_out_a_ready),
    .auto_out_a_valid(ptw_auto_out_a_valid),
    .auto_out_a_bits_source(ptw_auto_out_a_bits_source),
    .auto_out_a_bits_address(ptw_auto_out_a_bits_address),
    .auto_out_d_valid(ptw_auto_out_d_valid),
    .auto_out_d_bits_opcode(ptw_auto_out_d_bits_opcode),
    .auto_out_d_bits_size(ptw_auto_out_d_bits_size),
    .auto_out_d_bits_source(ptw_auto_out_d_bits_source),
    .auto_out_d_bits_data(ptw_auto_out_d_bits_data),
    .io_tlb_0_req_0_ready(ptw_io_tlb_0_req_0_ready),
    .io_tlb_0_req_0_valid(ptw_io_tlb_0_req_0_valid),
    .io_tlb_0_req_0_bits_vpn(ptw_io_tlb_0_req_0_bits_vpn),
    .io_tlb_0_resp_ready(ptw_io_tlb_0_resp_ready),
    .io_tlb_0_resp_valid(ptw_io_tlb_0_resp_valid),
    .io_tlb_0_resp_bits_entry_tag(ptw_io_tlb_0_resp_bits_entry_tag),
    .io_tlb_0_resp_bits_entry_asid(ptw_io_tlb_0_resp_bits_entry_asid),
    .io_tlb_0_resp_bits_entry_ppn(ptw_io_tlb_0_resp_bits_entry_ppn),
    .io_tlb_0_resp_bits_entry_perm_d(ptw_io_tlb_0_resp_bits_entry_perm_d),
    .io_tlb_0_resp_bits_entry_perm_a(ptw_io_tlb_0_resp_bits_entry_perm_a),
    .io_tlb_0_resp_bits_entry_perm_g(ptw_io_tlb_0_resp_bits_entry_perm_g),
    .io_tlb_0_resp_bits_entry_perm_u(ptw_io_tlb_0_resp_bits_entry_perm_u),
    .io_tlb_0_resp_bits_entry_perm_x(ptw_io_tlb_0_resp_bits_entry_perm_x),
    .io_tlb_0_resp_bits_entry_perm_w(ptw_io_tlb_0_resp_bits_entry_perm_w),
    .io_tlb_0_resp_bits_entry_perm_r(ptw_io_tlb_0_resp_bits_entry_perm_r),
    .io_tlb_0_resp_bits_entry_level(ptw_io_tlb_0_resp_bits_entry_level),
    .io_tlb_0_resp_bits_pf(ptw_io_tlb_0_resp_bits_pf),
    .io_tlb_0_resp_bits_af(ptw_io_tlb_0_resp_bits_af),
    .io_tlb_1_req_0_ready(ptw_io_tlb_1_req_0_ready),
    .io_tlb_1_req_0_valid(ptw_io_tlb_1_req_0_valid),
    .io_tlb_1_req_0_bits_vpn(ptw_io_tlb_1_req_0_bits_vpn),
    .io_tlb_1_resp_ready(ptw_io_tlb_1_resp_ready),
    .io_tlb_1_resp_valid(ptw_io_tlb_1_resp_valid),
    .io_tlb_1_resp_bits_entry_tag(ptw_io_tlb_1_resp_bits_entry_tag),
    .io_tlb_1_resp_bits_entry_asid(ptw_io_tlb_1_resp_bits_entry_asid),
    .io_tlb_1_resp_bits_entry_ppn(ptw_io_tlb_1_resp_bits_entry_ppn),
    .io_tlb_1_resp_bits_entry_perm_d(ptw_io_tlb_1_resp_bits_entry_perm_d),
    .io_tlb_1_resp_bits_entry_perm_a(ptw_io_tlb_1_resp_bits_entry_perm_a),
    .io_tlb_1_resp_bits_entry_perm_g(ptw_io_tlb_1_resp_bits_entry_perm_g),
    .io_tlb_1_resp_bits_entry_perm_u(ptw_io_tlb_1_resp_bits_entry_perm_u),
    .io_tlb_1_resp_bits_entry_perm_x(ptw_io_tlb_1_resp_bits_entry_perm_x),
    .io_tlb_1_resp_bits_entry_perm_w(ptw_io_tlb_1_resp_bits_entry_perm_w),
    .io_tlb_1_resp_bits_entry_perm_r(ptw_io_tlb_1_resp_bits_entry_perm_r),
    .io_tlb_1_resp_bits_entry_level(ptw_io_tlb_1_resp_bits_entry_level),
    .io_tlb_1_resp_bits_pf(ptw_io_tlb_1_resp_bits_pf),
    .io_tlb_1_resp_bits_af(ptw_io_tlb_1_resp_bits_af),
    .io_sfence_valid(ptw_io_sfence_valid),
    .io_sfence_bits_rs1(ptw_io_sfence_bits_rs1),
    .io_sfence_bits_rs2(ptw_io_sfence_bits_rs2),
    .io_sfence_bits_addr(ptw_io_sfence_bits_addr),
    .io_sfence_bits_asid(ptw_io_sfence_bits_asid),
    .io_csr_tlb_satp_asid(ptw_io_csr_tlb_satp_asid),
    .io_csr_tlb_satp_ppn(ptw_io_csr_tlb_satp_ppn),
    .io_csr_tlb_satp_changed(ptw_io_csr_tlb_satp_changed),
    .io_csr_distribute_csr_wvalid(ptw_io_csr_distribute_csr_wvalid),
    .io_csr_distribute_csr_waddr(ptw_io_csr_distribute_csr_waddr),
    .io_csr_distribute_csr_wdata(ptw_io_csr_distribute_csr_wdata),
    .io_perf_0_value(ptw_io_perf_0_value),
    .io_perf_1_value(ptw_io_perf_1_value),
    .io_perf_2_value(ptw_io_perf_2_value),
    .io_perf_3_value(ptw_io_perf_3_value),
    .io_perf_4_value(ptw_io_perf_4_value),
    .io_perf_5_value(ptw_io_perf_5_value),
    .io_perf_6_value(ptw_io_perf_6_value),
    .io_perf_7_value(ptw_io_perf_7_value),
    .io_perf_8_value(ptw_io_perf_8_value),
    .io_perf_9_value(ptw_io_perf_9_value),
    .io_perf_10_value(ptw_io_perf_10_value),
    .io_perf_11_value(ptw_io_perf_11_value),
    .io_perf_12_value(ptw_io_perf_12_value),
    .io_perf_13_value(ptw_io_perf_13_value),
    .io_perf_14_value(ptw_io_perf_14_value),
    .io_perf_15_value(ptw_io_perf_15_value),
    .io_perf_16_value(ptw_io_perf_16_value),
    .io_perf_17_value(ptw_io_perf_17_value),
    .io_perf_18_value(ptw_io_perf_18_value)
  );
  TLBuffer_13 ptw_to_l2_buffer ( // @[XSCore.scala 142:61]
    .clock(ptw_to_l2_buffer_clock),
    .reset(ptw_to_l2_buffer_reset),
    .auto_in_a_ready(ptw_to_l2_buffer_auto_in_a_ready),
    .auto_in_a_valid(ptw_to_l2_buffer_auto_in_a_valid),
    .auto_in_a_bits_opcode(ptw_to_l2_buffer_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(ptw_to_l2_buffer_auto_in_a_bits_param),
    .auto_in_a_bits_size(ptw_to_l2_buffer_auto_in_a_bits_size),
    .auto_in_a_bits_source(ptw_to_l2_buffer_auto_in_a_bits_source),
    .auto_in_a_bits_address(ptw_to_l2_buffer_auto_in_a_bits_address),
    .auto_in_a_bits_mask(ptw_to_l2_buffer_auto_in_a_bits_mask),
    .auto_in_a_bits_data(ptw_to_l2_buffer_auto_in_a_bits_data),
    .auto_in_d_ready(ptw_to_l2_buffer_auto_in_d_ready),
    .auto_in_d_valid(ptw_to_l2_buffer_auto_in_d_valid),
    .auto_in_d_bits_opcode(ptw_to_l2_buffer_auto_in_d_bits_opcode),
    .auto_in_d_bits_size(ptw_to_l2_buffer_auto_in_d_bits_size),
    .auto_in_d_bits_source(ptw_to_l2_buffer_auto_in_d_bits_source),
    .auto_in_d_bits_denied(ptw_to_l2_buffer_auto_in_d_bits_denied),
    .auto_in_d_bits_data(ptw_to_l2_buffer_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(ptw_to_l2_buffer_auto_in_d_bits_corrupt),
    .auto_out_a_ready(ptw_to_l2_buffer_auto_out_a_ready),
    .auto_out_a_valid(ptw_to_l2_buffer_auto_out_a_valid),
    .auto_out_a_bits_opcode(ptw_to_l2_buffer_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(ptw_to_l2_buffer_auto_out_a_bits_param),
    .auto_out_a_bits_size(ptw_to_l2_buffer_auto_out_a_bits_size),
    .auto_out_a_bits_source(ptw_to_l2_buffer_auto_out_a_bits_source),
    .auto_out_a_bits_address(ptw_to_l2_buffer_auto_out_a_bits_address),
    .auto_out_a_bits_mask(ptw_to_l2_buffer_auto_out_a_bits_mask),
    .auto_out_a_bits_data(ptw_to_l2_buffer_auto_out_a_bits_data),
    .auto_out_d_ready(ptw_to_l2_buffer_auto_out_d_ready),
    .auto_out_d_valid(ptw_to_l2_buffer_auto_out_d_valid),
    .auto_out_d_bits_opcode(ptw_to_l2_buffer_auto_out_d_bits_opcode),
    .auto_out_d_bits_size(ptw_to_l2_buffer_auto_out_d_bits_size),
    .auto_out_d_bits_source(ptw_to_l2_buffer_auto_out_d_bits_source),
    .auto_out_d_bits_denied(ptw_to_l2_buffer_auto_out_d_bits_denied),
    .auto_out_d_bits_data(ptw_to_l2_buffer_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(ptw_to_l2_buffer_auto_out_d_bits_corrupt)
  );
  WbArbiterWrapper wbArbiter ( // @[XSCore.scala 149:29]
    .clock(wbArbiter_clock),
    .reset(wbArbiter_reset),
    .io_hartId(wbArbiter_io_hartId),
    .io_redirect_valid(wbArbiter_io_redirect_valid),
    .io_redirect_bits_robIdx_flag(wbArbiter_io_redirect_bits_robIdx_flag),
    .io_redirect_bits_robIdx_value(wbArbiter_io_redirect_bits_robIdx_value),
    .io_redirect_bits_level(wbArbiter_io_redirect_bits_level),
    .io_in_0_valid(wbArbiter_io_in_0_valid),
    .io_in_0_bits_uop_ctrl_rfWen(wbArbiter_io_in_0_bits_uop_ctrl_rfWen),
    .io_in_0_bits_uop_pdest(wbArbiter_io_in_0_bits_uop_pdest),
    .io_in_0_bits_uop_robIdx_flag(wbArbiter_io_in_0_bits_uop_robIdx_flag),
    .io_in_0_bits_uop_robIdx_value(wbArbiter_io_in_0_bits_uop_robIdx_value),
    .io_in_0_bits_data(wbArbiter_io_in_0_bits_data),
    .io_in_0_bits_redirectValid(wbArbiter_io_in_0_bits_redirectValid),
    .io_in_0_bits_redirect_cfiUpdate_isMisPred(wbArbiter_io_in_0_bits_redirect_cfiUpdate_isMisPred),
    .io_in_1_valid(wbArbiter_io_in_1_valid),
    .io_in_1_bits_uop_ctrl_rfWen(wbArbiter_io_in_1_bits_uop_ctrl_rfWen),
    .io_in_1_bits_uop_pdest(wbArbiter_io_in_1_bits_uop_pdest),
    .io_in_1_bits_uop_robIdx_flag(wbArbiter_io_in_1_bits_uop_robIdx_flag),
    .io_in_1_bits_uop_robIdx_value(wbArbiter_io_in_1_bits_uop_robIdx_value),
    .io_in_1_bits_data(wbArbiter_io_in_1_bits_data),
    .io_in_1_bits_redirectValid(wbArbiter_io_in_1_bits_redirectValid),
    .io_in_1_bits_redirect_cfiUpdate_isMisPred(wbArbiter_io_in_1_bits_redirect_cfiUpdate_isMisPred),
    .io_in_2_valid(wbArbiter_io_in_2_valid),
    .io_in_2_bits_uop_ctrl_rfWen(wbArbiter_io_in_2_bits_uop_ctrl_rfWen),
    .io_in_2_bits_uop_ctrl_fpWen(wbArbiter_io_in_2_bits_uop_ctrl_fpWen),
    .io_in_2_bits_uop_pdest(wbArbiter_io_in_2_bits_uop_pdest),
    .io_in_2_bits_uop_robIdx_flag(wbArbiter_io_in_2_bits_uop_robIdx_flag),
    .io_in_2_bits_uop_robIdx_value(wbArbiter_io_in_2_bits_uop_robIdx_value),
    .io_in_2_bits_data(wbArbiter_io_in_2_bits_data),
    .io_in_3_ready(wbArbiter_io_in_3_ready),
    .io_in_3_valid(wbArbiter_io_in_3_valid),
    .io_in_3_bits_uop_cf_exceptionVec_2(wbArbiter_io_in_3_bits_uop_cf_exceptionVec_2),
    .io_in_3_bits_uop_cf_exceptionVec_3(wbArbiter_io_in_3_bits_uop_cf_exceptionVec_3),
    .io_in_3_bits_uop_cf_exceptionVec_8(wbArbiter_io_in_3_bits_uop_cf_exceptionVec_8),
    .io_in_3_bits_uop_cf_exceptionVec_9(wbArbiter_io_in_3_bits_uop_cf_exceptionVec_9),
    .io_in_3_bits_uop_cf_exceptionVec_11(wbArbiter_io_in_3_bits_uop_cf_exceptionVec_11),
    .io_in_3_bits_uop_ctrl_rfWen(wbArbiter_io_in_3_bits_uop_ctrl_rfWen),
    .io_in_3_bits_uop_ctrl_fpWen(wbArbiter_io_in_3_bits_uop_ctrl_fpWen),
    .io_in_3_bits_uop_ctrl_flushPipe(wbArbiter_io_in_3_bits_uop_ctrl_flushPipe),
    .io_in_3_bits_uop_pdest(wbArbiter_io_in_3_bits_uop_pdest),
    .io_in_3_bits_uop_robIdx_flag(wbArbiter_io_in_3_bits_uop_robIdx_flag),
    .io_in_3_bits_uop_robIdx_value(wbArbiter_io_in_3_bits_uop_robIdx_value),
    .io_in_3_bits_data(wbArbiter_io_in_3_bits_data),
    .io_in_3_bits_redirectValid(wbArbiter_io_in_3_bits_redirectValid),
    .io_in_3_bits_redirect_cfiUpdate_isMisPred(wbArbiter_io_in_3_bits_redirect_cfiUpdate_isMisPred),
    .io_in_3_bits_debug_isPerfCnt(wbArbiter_io_in_3_bits_debug_isPerfCnt),
    .io_in_4_valid(wbArbiter_io_in_4_valid),
    .io_in_4_bits_uop_cf_trigger_backendHit_0(wbArbiter_io_in_4_bits_uop_cf_trigger_backendHit_0),
    .io_in_4_bits_uop_cf_trigger_backendHit_1(wbArbiter_io_in_4_bits_uop_cf_trigger_backendHit_1),
    .io_in_4_bits_uop_cf_trigger_backendHit_2(wbArbiter_io_in_4_bits_uop_cf_trigger_backendHit_2),
    .io_in_4_bits_uop_cf_trigger_backendHit_3(wbArbiter_io_in_4_bits_uop_cf_trigger_backendHit_3),
    .io_in_4_bits_uop_cf_trigger_backendHit_4(wbArbiter_io_in_4_bits_uop_cf_trigger_backendHit_4),
    .io_in_4_bits_uop_cf_trigger_backendHit_5(wbArbiter_io_in_4_bits_uop_cf_trigger_backendHit_5),
    .io_in_4_bits_uop_ctrl_rfWen(wbArbiter_io_in_4_bits_uop_ctrl_rfWen),
    .io_in_4_bits_uop_ctrl_fpWen(wbArbiter_io_in_4_bits_uop_ctrl_fpWen),
    .io_in_4_bits_uop_pdest(wbArbiter_io_in_4_bits_uop_pdest),
    .io_in_4_bits_uop_robIdx_flag(wbArbiter_io_in_4_bits_uop_robIdx_flag),
    .io_in_4_bits_uop_robIdx_value(wbArbiter_io_in_4_bits_uop_robIdx_value),
    .io_in_4_bits_data(wbArbiter_io_in_4_bits_data),
    .io_in_5_ready(wbArbiter_io_in_5_ready),
    .io_in_5_valid(wbArbiter_io_in_5_valid),
    .io_in_5_bits_uop_ctrl_rfWen(wbArbiter_io_in_5_bits_uop_ctrl_rfWen),
    .io_in_5_bits_uop_ctrl_fpWen(wbArbiter_io_in_5_bits_uop_ctrl_fpWen),
    .io_in_5_bits_uop_pdest(wbArbiter_io_in_5_bits_uop_pdest),
    .io_in_5_bits_uop_robIdx_flag(wbArbiter_io_in_5_bits_uop_robIdx_flag),
    .io_in_5_bits_uop_robIdx_value(wbArbiter_io_in_5_bits_uop_robIdx_value),
    .io_in_5_bits_data(wbArbiter_io_in_5_bits_data),
    .io_in_6_valid(wbArbiter_io_in_6_valid),
    .io_in_6_bits_uop_cf_exceptionVec_4(wbArbiter_io_in_6_bits_uop_cf_exceptionVec_4),
    .io_in_6_bits_uop_cf_exceptionVec_5(wbArbiter_io_in_6_bits_uop_cf_exceptionVec_5),
    .io_in_6_bits_uop_cf_exceptionVec_13(wbArbiter_io_in_6_bits_uop_cf_exceptionVec_13),
    .io_in_6_bits_uop_cf_trigger_backendHit_0(wbArbiter_io_in_6_bits_uop_cf_trigger_backendHit_0),
    .io_in_6_bits_uop_cf_trigger_backendHit_1(wbArbiter_io_in_6_bits_uop_cf_trigger_backendHit_1),
    .io_in_6_bits_uop_cf_trigger_backendHit_2(wbArbiter_io_in_6_bits_uop_cf_trigger_backendHit_2),
    .io_in_6_bits_uop_cf_trigger_backendHit_3(wbArbiter_io_in_6_bits_uop_cf_trigger_backendHit_3),
    .io_in_6_bits_uop_cf_trigger_backendHit_4(wbArbiter_io_in_6_bits_uop_cf_trigger_backendHit_4),
    .io_in_6_bits_uop_cf_trigger_backendHit_5(wbArbiter_io_in_6_bits_uop_cf_trigger_backendHit_5),
    .io_in_6_bits_uop_ctrl_rfWen(wbArbiter_io_in_6_bits_uop_ctrl_rfWen),
    .io_in_6_bits_uop_ctrl_fpWen(wbArbiter_io_in_6_bits_uop_ctrl_fpWen),
    .io_in_6_bits_uop_ctrl_flushPipe(wbArbiter_io_in_6_bits_uop_ctrl_flushPipe),
    .io_in_6_bits_uop_ctrl_replayInst(wbArbiter_io_in_6_bits_uop_ctrl_replayInst),
    .io_in_6_bits_uop_pdest(wbArbiter_io_in_6_bits_uop_pdest),
    .io_in_6_bits_uop_robIdx_flag(wbArbiter_io_in_6_bits_uop_robIdx_flag),
    .io_in_6_bits_uop_robIdx_value(wbArbiter_io_in_6_bits_uop_robIdx_value),
    .io_in_6_bits_data(wbArbiter_io_in_6_bits_data),
    .io_in_6_bits_debug_isMMIO(wbArbiter_io_in_6_bits_debug_isMMIO),
    .io_in_7_valid(wbArbiter_io_in_7_valid),
    .io_in_7_bits_uop_cf_exceptionVec_4(wbArbiter_io_in_7_bits_uop_cf_exceptionVec_4),
    .io_in_7_bits_uop_cf_exceptionVec_5(wbArbiter_io_in_7_bits_uop_cf_exceptionVec_5),
    .io_in_7_bits_uop_cf_exceptionVec_13(wbArbiter_io_in_7_bits_uop_cf_exceptionVec_13),
    .io_in_7_bits_uop_cf_trigger_backendHit_0(wbArbiter_io_in_7_bits_uop_cf_trigger_backendHit_0),
    .io_in_7_bits_uop_cf_trigger_backendHit_1(wbArbiter_io_in_7_bits_uop_cf_trigger_backendHit_1),
    .io_in_7_bits_uop_cf_trigger_backendHit_2(wbArbiter_io_in_7_bits_uop_cf_trigger_backendHit_2),
    .io_in_7_bits_uop_cf_trigger_backendHit_3(wbArbiter_io_in_7_bits_uop_cf_trigger_backendHit_3),
    .io_in_7_bits_uop_cf_trigger_backendHit_4(wbArbiter_io_in_7_bits_uop_cf_trigger_backendHit_4),
    .io_in_7_bits_uop_cf_trigger_backendHit_5(wbArbiter_io_in_7_bits_uop_cf_trigger_backendHit_5),
    .io_in_7_bits_uop_ctrl_rfWen(wbArbiter_io_in_7_bits_uop_ctrl_rfWen),
    .io_in_7_bits_uop_ctrl_fpWen(wbArbiter_io_in_7_bits_uop_ctrl_fpWen),
    .io_in_7_bits_uop_ctrl_flushPipe(wbArbiter_io_in_7_bits_uop_ctrl_flushPipe),
    .io_in_7_bits_uop_ctrl_replayInst(wbArbiter_io_in_7_bits_uop_ctrl_replayInst),
    .io_in_7_bits_uop_pdest(wbArbiter_io_in_7_bits_uop_pdest),
    .io_in_7_bits_uop_robIdx_flag(wbArbiter_io_in_7_bits_uop_robIdx_flag),
    .io_in_7_bits_uop_robIdx_value(wbArbiter_io_in_7_bits_uop_robIdx_value),
    .io_in_7_bits_data(wbArbiter_io_in_7_bits_data),
    .io_in_7_bits_debug_isMMIO(wbArbiter_io_in_7_bits_debug_isMMIO),
    .io_in_8_valid(wbArbiter_io_in_8_valid),
    .io_in_8_bits_uop_cf_exceptionVec_4(wbArbiter_io_in_8_bits_uop_cf_exceptionVec_4),
    .io_in_8_bits_uop_cf_exceptionVec_5(wbArbiter_io_in_8_bits_uop_cf_exceptionVec_5),
    .io_in_8_bits_uop_cf_exceptionVec_6(wbArbiter_io_in_8_bits_uop_cf_exceptionVec_6),
    .io_in_8_bits_uop_cf_exceptionVec_7(wbArbiter_io_in_8_bits_uop_cf_exceptionVec_7),
    .io_in_8_bits_uop_cf_exceptionVec_13(wbArbiter_io_in_8_bits_uop_cf_exceptionVec_13),
    .io_in_8_bits_uop_cf_exceptionVec_15(wbArbiter_io_in_8_bits_uop_cf_exceptionVec_15),
    .io_in_8_bits_uop_cf_trigger_backendHit_0(wbArbiter_io_in_8_bits_uop_cf_trigger_backendHit_0),
    .io_in_8_bits_uop_cf_trigger_backendHit_1(wbArbiter_io_in_8_bits_uop_cf_trigger_backendHit_1),
    .io_in_8_bits_uop_cf_trigger_backendHit_2(wbArbiter_io_in_8_bits_uop_cf_trigger_backendHit_2),
    .io_in_8_bits_uop_cf_trigger_backendHit_3(wbArbiter_io_in_8_bits_uop_cf_trigger_backendHit_3),
    .io_in_8_bits_uop_cf_trigger_backendHit_4(wbArbiter_io_in_8_bits_uop_cf_trigger_backendHit_4),
    .io_in_8_bits_uop_cf_trigger_backendHit_5(wbArbiter_io_in_8_bits_uop_cf_trigger_backendHit_5),
    .io_in_8_bits_uop_robIdx_flag(wbArbiter_io_in_8_bits_uop_robIdx_flag),
    .io_in_8_bits_uop_robIdx_value(wbArbiter_io_in_8_bits_uop_robIdx_value),
    .io_in_8_bits_redirectValid(wbArbiter_io_in_8_bits_redirectValid),
    .io_in_8_bits_redirect_cfiUpdate_isMisPred(wbArbiter_io_in_8_bits_redirect_cfiUpdate_isMisPred),
    .io_in_8_bits_debug_isMMIO(wbArbiter_io_in_8_bits_debug_isMMIO),
    .io_in_8_bits_debug_isPerfCnt(wbArbiter_io_in_8_bits_debug_isPerfCnt),
    .io_in_9_valid(wbArbiter_io_in_9_valid),
    .io_in_9_bits_uop_cf_exceptionVec_4(wbArbiter_io_in_9_bits_uop_cf_exceptionVec_4),
    .io_in_9_bits_uop_cf_exceptionVec_5(wbArbiter_io_in_9_bits_uop_cf_exceptionVec_5),
    .io_in_9_bits_uop_cf_exceptionVec_6(wbArbiter_io_in_9_bits_uop_cf_exceptionVec_6),
    .io_in_9_bits_uop_cf_exceptionVec_7(wbArbiter_io_in_9_bits_uop_cf_exceptionVec_7),
    .io_in_9_bits_uop_cf_exceptionVec_13(wbArbiter_io_in_9_bits_uop_cf_exceptionVec_13),
    .io_in_9_bits_uop_cf_exceptionVec_15(wbArbiter_io_in_9_bits_uop_cf_exceptionVec_15),
    .io_in_9_bits_uop_cf_trigger_backendHit_0(wbArbiter_io_in_9_bits_uop_cf_trigger_backendHit_0),
    .io_in_9_bits_uop_cf_trigger_backendHit_1(wbArbiter_io_in_9_bits_uop_cf_trigger_backendHit_1),
    .io_in_9_bits_uop_cf_trigger_backendHit_2(wbArbiter_io_in_9_bits_uop_cf_trigger_backendHit_2),
    .io_in_9_bits_uop_cf_trigger_backendHit_3(wbArbiter_io_in_9_bits_uop_cf_trigger_backendHit_3),
    .io_in_9_bits_uop_cf_trigger_backendHit_4(wbArbiter_io_in_9_bits_uop_cf_trigger_backendHit_4),
    .io_in_9_bits_uop_cf_trigger_backendHit_5(wbArbiter_io_in_9_bits_uop_cf_trigger_backendHit_5),
    .io_in_9_bits_uop_robIdx_flag(wbArbiter_io_in_9_bits_uop_robIdx_flag),
    .io_in_9_bits_uop_robIdx_value(wbArbiter_io_in_9_bits_uop_robIdx_value),
    .io_in_9_bits_redirectValid(wbArbiter_io_in_9_bits_redirectValid),
    .io_in_9_bits_redirect_cfiUpdate_isMisPred(wbArbiter_io_in_9_bits_redirect_cfiUpdate_isMisPred),
    .io_in_9_bits_debug_isMMIO(wbArbiter_io_in_9_bits_debug_isMMIO),
    .io_in_9_bits_debug_isPerfCnt(wbArbiter_io_in_9_bits_debug_isPerfCnt),
    .io_in_10_valid(wbArbiter_io_in_10_valid),
    .io_in_10_bits_uop_robIdx_flag(wbArbiter_io_in_10_bits_uop_robIdx_flag),
    .io_in_10_bits_uop_robIdx_value(wbArbiter_io_in_10_bits_uop_robIdx_value),
    .io_in_11_valid(wbArbiter_io_in_11_valid),
    .io_in_11_bits_uop_robIdx_flag(wbArbiter_io_in_11_bits_uop_robIdx_flag),
    .io_in_11_bits_uop_robIdx_value(wbArbiter_io_in_11_bits_uop_robIdx_value),
    .io_out_0_valid(wbArbiter_io_out_0_valid),
    .io_out_0_bits_uop_robIdx_flag(wbArbiter_io_out_0_bits_uop_robIdx_flag),
    .io_out_0_bits_uop_robIdx_value(wbArbiter_io_out_0_bits_uop_robIdx_value),
    .io_out_0_bits_redirectValid(wbArbiter_io_out_0_bits_redirectValid),
    .io_out_0_bits_redirect_cfiUpdate_isMisPred(wbArbiter_io_out_0_bits_redirect_cfiUpdate_isMisPred),
    .io_out_1_valid(wbArbiter_io_out_1_valid),
    .io_out_1_bits_uop_robIdx_flag(wbArbiter_io_out_1_bits_uop_robIdx_flag),
    .io_out_1_bits_uop_robIdx_value(wbArbiter_io_out_1_bits_uop_robIdx_value),
    .io_out_1_bits_redirectValid(wbArbiter_io_out_1_bits_redirectValid),
    .io_out_1_bits_redirect_cfiUpdate_isMisPred(wbArbiter_io_out_1_bits_redirect_cfiUpdate_isMisPred),
    .io_out_2_valid(wbArbiter_io_out_2_valid),
    .io_out_2_bits_uop_cf_exceptionVec_4(wbArbiter_io_out_2_bits_uop_cf_exceptionVec_4),
    .io_out_2_bits_uop_cf_exceptionVec_5(wbArbiter_io_out_2_bits_uop_cf_exceptionVec_5),
    .io_out_2_bits_uop_cf_exceptionVec_13(wbArbiter_io_out_2_bits_uop_cf_exceptionVec_13),
    .io_out_2_bits_uop_cf_trigger_backendHit_0(wbArbiter_io_out_2_bits_uop_cf_trigger_backendHit_0),
    .io_out_2_bits_uop_cf_trigger_backendHit_1(wbArbiter_io_out_2_bits_uop_cf_trigger_backendHit_1),
    .io_out_2_bits_uop_cf_trigger_backendHit_2(wbArbiter_io_out_2_bits_uop_cf_trigger_backendHit_2),
    .io_out_2_bits_uop_cf_trigger_backendHit_3(wbArbiter_io_out_2_bits_uop_cf_trigger_backendHit_3),
    .io_out_2_bits_uop_cf_trigger_backendHit_4(wbArbiter_io_out_2_bits_uop_cf_trigger_backendHit_4),
    .io_out_2_bits_uop_cf_trigger_backendHit_5(wbArbiter_io_out_2_bits_uop_cf_trigger_backendHit_5),
    .io_out_2_bits_uop_ctrl_rfWen(wbArbiter_io_out_2_bits_uop_ctrl_rfWen),
    .io_out_2_bits_uop_ctrl_fpWen(wbArbiter_io_out_2_bits_uop_ctrl_fpWen),
    .io_out_2_bits_uop_ctrl_flushPipe(wbArbiter_io_out_2_bits_uop_ctrl_flushPipe),
    .io_out_2_bits_uop_ctrl_replayInst(wbArbiter_io_out_2_bits_uop_ctrl_replayInst),
    .io_out_2_bits_uop_pdest(wbArbiter_io_out_2_bits_uop_pdest),
    .io_out_2_bits_uop_robIdx_flag(wbArbiter_io_out_2_bits_uop_robIdx_flag),
    .io_out_2_bits_uop_robIdx_value(wbArbiter_io_out_2_bits_uop_robIdx_value),
    .io_out_2_bits_data(wbArbiter_io_out_2_bits_data),
    .io_out_2_bits_debug_isMMIO(wbArbiter_io_out_2_bits_debug_isMMIO),
    .io_out_3_valid(wbArbiter_io_out_3_valid),
    .io_out_3_bits_uop_cf_exceptionVec_4(wbArbiter_io_out_3_bits_uop_cf_exceptionVec_4),
    .io_out_3_bits_uop_cf_exceptionVec_5(wbArbiter_io_out_3_bits_uop_cf_exceptionVec_5),
    .io_out_3_bits_uop_cf_exceptionVec_13(wbArbiter_io_out_3_bits_uop_cf_exceptionVec_13),
    .io_out_3_bits_uop_cf_trigger_backendHit_0(wbArbiter_io_out_3_bits_uop_cf_trigger_backendHit_0),
    .io_out_3_bits_uop_cf_trigger_backendHit_1(wbArbiter_io_out_3_bits_uop_cf_trigger_backendHit_1),
    .io_out_3_bits_uop_cf_trigger_backendHit_2(wbArbiter_io_out_3_bits_uop_cf_trigger_backendHit_2),
    .io_out_3_bits_uop_cf_trigger_backendHit_3(wbArbiter_io_out_3_bits_uop_cf_trigger_backendHit_3),
    .io_out_3_bits_uop_cf_trigger_backendHit_4(wbArbiter_io_out_3_bits_uop_cf_trigger_backendHit_4),
    .io_out_3_bits_uop_cf_trigger_backendHit_5(wbArbiter_io_out_3_bits_uop_cf_trigger_backendHit_5),
    .io_out_3_bits_uop_ctrl_rfWen(wbArbiter_io_out_3_bits_uop_ctrl_rfWen),
    .io_out_3_bits_uop_ctrl_fpWen(wbArbiter_io_out_3_bits_uop_ctrl_fpWen),
    .io_out_3_bits_uop_ctrl_flushPipe(wbArbiter_io_out_3_bits_uop_ctrl_flushPipe),
    .io_out_3_bits_uop_ctrl_replayInst(wbArbiter_io_out_3_bits_uop_ctrl_replayInst),
    .io_out_3_bits_uop_pdest(wbArbiter_io_out_3_bits_uop_pdest),
    .io_out_3_bits_uop_robIdx_flag(wbArbiter_io_out_3_bits_uop_robIdx_flag),
    .io_out_3_bits_uop_robIdx_value(wbArbiter_io_out_3_bits_uop_robIdx_value),
    .io_out_3_bits_data(wbArbiter_io_out_3_bits_data),
    .io_out_3_bits_debug_isMMIO(wbArbiter_io_out_3_bits_debug_isMMIO),
    .io_out_4_valid(wbArbiter_io_out_4_valid),
    .io_out_4_bits_uop_cf_exceptionVec_2(wbArbiter_io_out_4_bits_uop_cf_exceptionVec_2),
    .io_out_4_bits_uop_cf_exceptionVec_3(wbArbiter_io_out_4_bits_uop_cf_exceptionVec_3),
    .io_out_4_bits_uop_cf_exceptionVec_8(wbArbiter_io_out_4_bits_uop_cf_exceptionVec_8),
    .io_out_4_bits_uop_cf_exceptionVec_9(wbArbiter_io_out_4_bits_uop_cf_exceptionVec_9),
    .io_out_4_bits_uop_cf_exceptionVec_11(wbArbiter_io_out_4_bits_uop_cf_exceptionVec_11),
    .io_out_4_bits_uop_ctrl_rfWen(wbArbiter_io_out_4_bits_uop_ctrl_rfWen),
    .io_out_4_bits_uop_ctrl_fpWen(wbArbiter_io_out_4_bits_uop_ctrl_fpWen),
    .io_out_4_bits_uop_ctrl_flushPipe(wbArbiter_io_out_4_bits_uop_ctrl_flushPipe),
    .io_out_4_bits_uop_pdest(wbArbiter_io_out_4_bits_uop_pdest),
    .io_out_4_bits_uop_robIdx_flag(wbArbiter_io_out_4_bits_uop_robIdx_flag),
    .io_out_4_bits_uop_robIdx_value(wbArbiter_io_out_4_bits_uop_robIdx_value),
    .io_out_4_bits_data(wbArbiter_io_out_4_bits_data),
    .io_out_4_bits_redirectValid(wbArbiter_io_out_4_bits_redirectValid),
    .io_out_4_bits_redirect_cfiUpdate_isMisPred(wbArbiter_io_out_4_bits_redirect_cfiUpdate_isMisPred),
    .io_out_4_bits_debug_isPerfCnt(wbArbiter_io_out_4_bits_debug_isPerfCnt),
    .io_out_5_valid(wbArbiter_io_out_5_valid),
    .io_out_5_bits_uop_cf_trigger_backendHit_0(wbArbiter_io_out_5_bits_uop_cf_trigger_backendHit_0),
    .io_out_5_bits_uop_cf_trigger_backendHit_1(wbArbiter_io_out_5_bits_uop_cf_trigger_backendHit_1),
    .io_out_5_bits_uop_cf_trigger_backendHit_2(wbArbiter_io_out_5_bits_uop_cf_trigger_backendHit_2),
    .io_out_5_bits_uop_cf_trigger_backendHit_3(wbArbiter_io_out_5_bits_uop_cf_trigger_backendHit_3),
    .io_out_5_bits_uop_cf_trigger_backendHit_4(wbArbiter_io_out_5_bits_uop_cf_trigger_backendHit_4),
    .io_out_5_bits_uop_cf_trigger_backendHit_5(wbArbiter_io_out_5_bits_uop_cf_trigger_backendHit_5),
    .io_out_5_bits_uop_ctrl_rfWen(wbArbiter_io_out_5_bits_uop_ctrl_rfWen),
    .io_out_5_bits_uop_ctrl_fpWen(wbArbiter_io_out_5_bits_uop_ctrl_fpWen),
    .io_out_5_bits_uop_pdest(wbArbiter_io_out_5_bits_uop_pdest),
    .io_out_5_bits_uop_robIdx_flag(wbArbiter_io_out_5_bits_uop_robIdx_flag),
    .io_out_5_bits_uop_robIdx_value(wbArbiter_io_out_5_bits_uop_robIdx_value),
    .io_out_5_bits_data(wbArbiter_io_out_5_bits_data),
    .io_out_6_valid(wbArbiter_io_out_6_valid),
    .io_out_6_bits_uop_ctrl_rfWen(wbArbiter_io_out_6_bits_uop_ctrl_rfWen),
    .io_out_6_bits_uop_ctrl_fpWen(wbArbiter_io_out_6_bits_uop_ctrl_fpWen),
    .io_out_6_bits_uop_pdest(wbArbiter_io_out_6_bits_uop_pdest),
    .io_out_6_bits_data(wbArbiter_io_out_6_bits_data),
    .io_out_7_valid(wbArbiter_io_out_7_valid),
    .io_out_7_bits_uop_ctrl_rfWen(wbArbiter_io_out_7_bits_uop_ctrl_rfWen),
    .io_out_7_bits_uop_ctrl_fpWen(wbArbiter_io_out_7_bits_uop_ctrl_fpWen),
    .io_out_7_bits_uop_pdest(wbArbiter_io_out_7_bits_uop_pdest),
    .io_out_7_bits_data(wbArbiter_io_out_7_bits_data),
    .io_out_8_valid(wbArbiter_io_out_8_valid),
    .io_out_8_bits_uop_cf_exceptionVec_2(wbArbiter_io_out_8_bits_uop_cf_exceptionVec_2),
    .io_out_8_bits_uop_cf_exceptionVec_3(wbArbiter_io_out_8_bits_uop_cf_exceptionVec_3),
    .io_out_8_bits_uop_cf_exceptionVec_8(wbArbiter_io_out_8_bits_uop_cf_exceptionVec_8),
    .io_out_8_bits_uop_cf_exceptionVec_9(wbArbiter_io_out_8_bits_uop_cf_exceptionVec_9),
    .io_out_8_bits_uop_cf_exceptionVec_11(wbArbiter_io_out_8_bits_uop_cf_exceptionVec_11),
    .io_out_8_bits_uop_ctrl_rfWen(wbArbiter_io_out_8_bits_uop_ctrl_rfWen),
    .io_out_8_bits_uop_ctrl_fpWen(wbArbiter_io_out_8_bits_uop_ctrl_fpWen),
    .io_out_8_bits_uop_ctrl_flushPipe(wbArbiter_io_out_8_bits_uop_ctrl_flushPipe),
    .io_out_8_bits_uop_pdest(wbArbiter_io_out_8_bits_uop_pdest),
    .io_out_8_bits_uop_robIdx_flag(wbArbiter_io_out_8_bits_uop_robIdx_flag),
    .io_out_8_bits_uop_robIdx_value(wbArbiter_io_out_8_bits_uop_robIdx_value),
    .io_out_8_bits_data(wbArbiter_io_out_8_bits_data),
    .io_out_8_bits_redirectValid(wbArbiter_io_out_8_bits_redirectValid),
    .io_out_8_bits_redirect_cfiUpdate_isMisPred(wbArbiter_io_out_8_bits_redirect_cfiUpdate_isMisPred),
    .io_out_8_bits_debug_isPerfCnt(wbArbiter_io_out_8_bits_debug_isPerfCnt)
  );
  ExuBlock exuBlocks ( // @[XSCore.scala 218:17]
    .clock(exuBlocks_clock),
    .reset(exuBlocks_reset),
    .io_hartId(exuBlocks_io_hartId),
    .io_redirect_valid(exuBlocks_io_redirect_valid),
    .io_redirect_bits_robIdx_flag(exuBlocks_io_redirect_bits_robIdx_flag),
    .io_redirect_bits_robIdx_value(exuBlocks_io_redirect_bits_robIdx_value),
    .io_redirect_bits_level(exuBlocks_io_redirect_bits_level),
    .io_allocPregs_0_isInt(exuBlocks_io_allocPregs_0_isInt),
    .io_allocPregs_0_isFp(exuBlocks_io_allocPregs_0_isFp),
    .io_allocPregs_0_preg(exuBlocks_io_allocPregs_0_preg),
    .io_allocPregs_1_isInt(exuBlocks_io_allocPregs_1_isInt),
    .io_allocPregs_1_isFp(exuBlocks_io_allocPregs_1_isFp),
    .io_allocPregs_1_preg(exuBlocks_io_allocPregs_1_preg),
    .io_in_0_valid(exuBlocks_io_in_0_valid),
    .io_in_0_bits_cf_foldpc(exuBlocks_io_in_0_bits_cf_foldpc),
    .io_in_0_bits_cf_trigger_backendEn_0(exuBlocks_io_in_0_bits_cf_trigger_backendEn_0),
    .io_in_0_bits_cf_trigger_backendEn_1(exuBlocks_io_in_0_bits_cf_trigger_backendEn_1),
    .io_in_0_bits_cf_pd_isRVC(exuBlocks_io_in_0_bits_cf_pd_isRVC),
    .io_in_0_bits_cf_pd_brType(exuBlocks_io_in_0_bits_cf_pd_brType),
    .io_in_0_bits_cf_pd_isCall(exuBlocks_io_in_0_bits_cf_pd_isCall),
    .io_in_0_bits_cf_pd_isRet(exuBlocks_io_in_0_bits_cf_pd_isRet),
    .io_in_0_bits_cf_pred_taken(exuBlocks_io_in_0_bits_cf_pred_taken),
    .io_in_0_bits_cf_storeSetHit(exuBlocks_io_in_0_bits_cf_storeSetHit),
    .io_in_0_bits_cf_waitForRobIdx_flag(exuBlocks_io_in_0_bits_cf_waitForRobIdx_flag),
    .io_in_0_bits_cf_waitForRobIdx_value(exuBlocks_io_in_0_bits_cf_waitForRobIdx_value),
    .io_in_0_bits_cf_loadWaitBit(exuBlocks_io_in_0_bits_cf_loadWaitBit),
    .io_in_0_bits_cf_loadWaitStrict(exuBlocks_io_in_0_bits_cf_loadWaitStrict),
    .io_in_0_bits_cf_ssid(exuBlocks_io_in_0_bits_cf_ssid),
    .io_in_0_bits_cf_ftqPtr_flag(exuBlocks_io_in_0_bits_cf_ftqPtr_flag),
    .io_in_0_bits_cf_ftqPtr_value(exuBlocks_io_in_0_bits_cf_ftqPtr_value),
    .io_in_0_bits_cf_ftqOffset(exuBlocks_io_in_0_bits_cf_ftqOffset),
    .io_in_0_bits_ctrl_srcType_0(exuBlocks_io_in_0_bits_ctrl_srcType_0),
    .io_in_0_bits_ctrl_srcType_1(exuBlocks_io_in_0_bits_ctrl_srcType_1),
    .io_in_0_bits_ctrl_fuType(exuBlocks_io_in_0_bits_ctrl_fuType),
    .io_in_0_bits_ctrl_fuOpType(exuBlocks_io_in_0_bits_ctrl_fuOpType),
    .io_in_0_bits_ctrl_rfWen(exuBlocks_io_in_0_bits_ctrl_rfWen),
    .io_in_0_bits_ctrl_fpWen(exuBlocks_io_in_0_bits_ctrl_fpWen),
    .io_in_0_bits_ctrl_selImm(exuBlocks_io_in_0_bits_ctrl_selImm),
    .io_in_0_bits_ctrl_imm(exuBlocks_io_in_0_bits_ctrl_imm),
    .io_in_0_bits_ctrl_fpu_isAddSub(exuBlocks_io_in_0_bits_ctrl_fpu_isAddSub),
    .io_in_0_bits_ctrl_fpu_typeTagIn(exuBlocks_io_in_0_bits_ctrl_fpu_typeTagIn),
    .io_in_0_bits_ctrl_fpu_typeTagOut(exuBlocks_io_in_0_bits_ctrl_fpu_typeTagOut),
    .io_in_0_bits_ctrl_fpu_fromInt(exuBlocks_io_in_0_bits_ctrl_fpu_fromInt),
    .io_in_0_bits_ctrl_fpu_wflags(exuBlocks_io_in_0_bits_ctrl_fpu_wflags),
    .io_in_0_bits_ctrl_fpu_fpWen(exuBlocks_io_in_0_bits_ctrl_fpu_fpWen),
    .io_in_0_bits_ctrl_fpu_fmaCmd(exuBlocks_io_in_0_bits_ctrl_fpu_fmaCmd),
    .io_in_0_bits_ctrl_fpu_div(exuBlocks_io_in_0_bits_ctrl_fpu_div),
    .io_in_0_bits_ctrl_fpu_sqrt(exuBlocks_io_in_0_bits_ctrl_fpu_sqrt),
    .io_in_0_bits_ctrl_fpu_fcvt(exuBlocks_io_in_0_bits_ctrl_fpu_fcvt),
    .io_in_0_bits_ctrl_fpu_typ(exuBlocks_io_in_0_bits_ctrl_fpu_typ),
    .io_in_0_bits_ctrl_fpu_fmt(exuBlocks_io_in_0_bits_ctrl_fpu_fmt),
    .io_in_0_bits_ctrl_fpu_ren3(exuBlocks_io_in_0_bits_ctrl_fpu_ren3),
    .io_in_0_bits_ctrl_fpu_rm(exuBlocks_io_in_0_bits_ctrl_fpu_rm),
    .io_in_0_bits_psrc_0(exuBlocks_io_in_0_bits_psrc_0),
    .io_in_0_bits_psrc_1(exuBlocks_io_in_0_bits_psrc_1),
    .io_in_0_bits_pdest(exuBlocks_io_in_0_bits_pdest),
    .io_in_0_bits_robIdx_flag(exuBlocks_io_in_0_bits_robIdx_flag),
    .io_in_0_bits_robIdx_value(exuBlocks_io_in_0_bits_robIdx_value),
    .io_in_0_bits_lqIdx_flag(exuBlocks_io_in_0_bits_lqIdx_flag),
    .io_in_0_bits_lqIdx_value(exuBlocks_io_in_0_bits_lqIdx_value),
    .io_in_0_bits_sqIdx_flag(exuBlocks_io_in_0_bits_sqIdx_flag),
    .io_in_0_bits_sqIdx_value(exuBlocks_io_in_0_bits_sqIdx_value),
    .io_in_1_valid(exuBlocks_io_in_1_valid),
    .io_in_1_bits_cf_foldpc(exuBlocks_io_in_1_bits_cf_foldpc),
    .io_in_1_bits_cf_trigger_backendEn_0(exuBlocks_io_in_1_bits_cf_trigger_backendEn_0),
    .io_in_1_bits_cf_trigger_backendEn_1(exuBlocks_io_in_1_bits_cf_trigger_backendEn_1),
    .io_in_1_bits_cf_pd_isRVC(exuBlocks_io_in_1_bits_cf_pd_isRVC),
    .io_in_1_bits_cf_pd_brType(exuBlocks_io_in_1_bits_cf_pd_brType),
    .io_in_1_bits_cf_pd_isCall(exuBlocks_io_in_1_bits_cf_pd_isCall),
    .io_in_1_bits_cf_pd_isRet(exuBlocks_io_in_1_bits_cf_pd_isRet),
    .io_in_1_bits_cf_pred_taken(exuBlocks_io_in_1_bits_cf_pred_taken),
    .io_in_1_bits_cf_storeSetHit(exuBlocks_io_in_1_bits_cf_storeSetHit),
    .io_in_1_bits_cf_waitForRobIdx_flag(exuBlocks_io_in_1_bits_cf_waitForRobIdx_flag),
    .io_in_1_bits_cf_waitForRobIdx_value(exuBlocks_io_in_1_bits_cf_waitForRobIdx_value),
    .io_in_1_bits_cf_loadWaitBit(exuBlocks_io_in_1_bits_cf_loadWaitBit),
    .io_in_1_bits_cf_loadWaitStrict(exuBlocks_io_in_1_bits_cf_loadWaitStrict),
    .io_in_1_bits_cf_ssid(exuBlocks_io_in_1_bits_cf_ssid),
    .io_in_1_bits_cf_ftqPtr_flag(exuBlocks_io_in_1_bits_cf_ftqPtr_flag),
    .io_in_1_bits_cf_ftqPtr_value(exuBlocks_io_in_1_bits_cf_ftqPtr_value),
    .io_in_1_bits_cf_ftqOffset(exuBlocks_io_in_1_bits_cf_ftqOffset),
    .io_in_1_bits_ctrl_srcType_0(exuBlocks_io_in_1_bits_ctrl_srcType_0),
    .io_in_1_bits_ctrl_srcType_1(exuBlocks_io_in_1_bits_ctrl_srcType_1),
    .io_in_1_bits_ctrl_fuType(exuBlocks_io_in_1_bits_ctrl_fuType),
    .io_in_1_bits_ctrl_fuOpType(exuBlocks_io_in_1_bits_ctrl_fuOpType),
    .io_in_1_bits_ctrl_rfWen(exuBlocks_io_in_1_bits_ctrl_rfWen),
    .io_in_1_bits_ctrl_fpWen(exuBlocks_io_in_1_bits_ctrl_fpWen),
    .io_in_1_bits_ctrl_selImm(exuBlocks_io_in_1_bits_ctrl_selImm),
    .io_in_1_bits_ctrl_imm(exuBlocks_io_in_1_bits_ctrl_imm),
    .io_in_1_bits_psrc_0(exuBlocks_io_in_1_bits_psrc_0),
    .io_in_1_bits_psrc_1(exuBlocks_io_in_1_bits_psrc_1),
    .io_in_1_bits_pdest(exuBlocks_io_in_1_bits_pdest),
    .io_in_1_bits_robIdx_flag(exuBlocks_io_in_1_bits_robIdx_flag),
    .io_in_1_bits_robIdx_value(exuBlocks_io_in_1_bits_robIdx_value),
    .io_in_1_bits_lqIdx_flag(exuBlocks_io_in_1_bits_lqIdx_flag),
    .io_in_1_bits_lqIdx_value(exuBlocks_io_in_1_bits_lqIdx_value),
    .io_in_1_bits_sqIdx_flag(exuBlocks_io_in_1_bits_sqIdx_flag),
    .io_in_1_bits_sqIdx_value(exuBlocks_io_in_1_bits_sqIdx_value),
    .io_in_4_valid(exuBlocks_io_in_4_valid),
    .io_in_4_bits_cf_foldpc(exuBlocks_io_in_4_bits_cf_foldpc),
    .io_in_4_bits_cf_trigger_backendEn_0(exuBlocks_io_in_4_bits_cf_trigger_backendEn_0),
    .io_in_4_bits_cf_trigger_backendEn_1(exuBlocks_io_in_4_bits_cf_trigger_backendEn_1),
    .io_in_4_bits_cf_pd_isRVC(exuBlocks_io_in_4_bits_cf_pd_isRVC),
    .io_in_4_bits_cf_pd_brType(exuBlocks_io_in_4_bits_cf_pd_brType),
    .io_in_4_bits_cf_pd_isCall(exuBlocks_io_in_4_bits_cf_pd_isCall),
    .io_in_4_bits_cf_pd_isRet(exuBlocks_io_in_4_bits_cf_pd_isRet),
    .io_in_4_bits_cf_pred_taken(exuBlocks_io_in_4_bits_cf_pred_taken),
    .io_in_4_bits_cf_storeSetHit(exuBlocks_io_in_4_bits_cf_storeSetHit),
    .io_in_4_bits_cf_waitForRobIdx_flag(exuBlocks_io_in_4_bits_cf_waitForRobIdx_flag),
    .io_in_4_bits_cf_waitForRobIdx_value(exuBlocks_io_in_4_bits_cf_waitForRobIdx_value),
    .io_in_4_bits_cf_loadWaitBit(exuBlocks_io_in_4_bits_cf_loadWaitBit),
    .io_in_4_bits_cf_loadWaitStrict(exuBlocks_io_in_4_bits_cf_loadWaitStrict),
    .io_in_4_bits_cf_ssid(exuBlocks_io_in_4_bits_cf_ssid),
    .io_in_4_bits_cf_ftqPtr_flag(exuBlocks_io_in_4_bits_cf_ftqPtr_flag),
    .io_in_4_bits_cf_ftqPtr_value(exuBlocks_io_in_4_bits_cf_ftqPtr_value),
    .io_in_4_bits_cf_ftqOffset(exuBlocks_io_in_4_bits_cf_ftqOffset),
    .io_in_4_bits_ctrl_srcType_0(exuBlocks_io_in_4_bits_ctrl_srcType_0),
    .io_in_4_bits_ctrl_srcType_1(exuBlocks_io_in_4_bits_ctrl_srcType_1),
    .io_in_4_bits_ctrl_fuType(exuBlocks_io_in_4_bits_ctrl_fuType),
    .io_in_4_bits_ctrl_fuOpType(exuBlocks_io_in_4_bits_ctrl_fuOpType),
    .io_in_4_bits_ctrl_rfWen(exuBlocks_io_in_4_bits_ctrl_rfWen),
    .io_in_4_bits_ctrl_fpWen(exuBlocks_io_in_4_bits_ctrl_fpWen),
    .io_in_4_bits_ctrl_flushPipe(exuBlocks_io_in_4_bits_ctrl_flushPipe),
    .io_in_4_bits_ctrl_imm(exuBlocks_io_in_4_bits_ctrl_imm),
    .io_in_4_bits_ctrl_replayInst(exuBlocks_io_in_4_bits_ctrl_replayInst),
    .io_in_4_bits_psrc_0(exuBlocks_io_in_4_bits_psrc_0),
    .io_in_4_bits_psrc_1(exuBlocks_io_in_4_bits_psrc_1),
    .io_in_4_bits_pdest(exuBlocks_io_in_4_bits_pdest),
    .io_in_4_bits_robIdx_flag(exuBlocks_io_in_4_bits_robIdx_flag),
    .io_in_4_bits_robIdx_value(exuBlocks_io_in_4_bits_robIdx_value),
    .io_in_5_valid(exuBlocks_io_in_5_valid),
    .io_in_5_bits_cf_foldpc(exuBlocks_io_in_5_bits_cf_foldpc),
    .io_in_5_bits_cf_trigger_backendEn_0(exuBlocks_io_in_5_bits_cf_trigger_backendEn_0),
    .io_in_5_bits_cf_trigger_backendEn_1(exuBlocks_io_in_5_bits_cf_trigger_backendEn_1),
    .io_in_5_bits_cf_pd_isRVC(exuBlocks_io_in_5_bits_cf_pd_isRVC),
    .io_in_5_bits_cf_pd_brType(exuBlocks_io_in_5_bits_cf_pd_brType),
    .io_in_5_bits_cf_pd_isCall(exuBlocks_io_in_5_bits_cf_pd_isCall),
    .io_in_5_bits_cf_pd_isRet(exuBlocks_io_in_5_bits_cf_pd_isRet),
    .io_in_5_bits_cf_pred_taken(exuBlocks_io_in_5_bits_cf_pred_taken),
    .io_in_5_bits_cf_storeSetHit(exuBlocks_io_in_5_bits_cf_storeSetHit),
    .io_in_5_bits_cf_waitForRobIdx_flag(exuBlocks_io_in_5_bits_cf_waitForRobIdx_flag),
    .io_in_5_bits_cf_waitForRobIdx_value(exuBlocks_io_in_5_bits_cf_waitForRobIdx_value),
    .io_in_5_bits_cf_loadWaitBit(exuBlocks_io_in_5_bits_cf_loadWaitBit),
    .io_in_5_bits_cf_loadWaitStrict(exuBlocks_io_in_5_bits_cf_loadWaitStrict),
    .io_in_5_bits_cf_ssid(exuBlocks_io_in_5_bits_cf_ssid),
    .io_in_5_bits_cf_ftqPtr_flag(exuBlocks_io_in_5_bits_cf_ftqPtr_flag),
    .io_in_5_bits_cf_ftqPtr_value(exuBlocks_io_in_5_bits_cf_ftqPtr_value),
    .io_in_5_bits_cf_ftqOffset(exuBlocks_io_in_5_bits_cf_ftqOffset),
    .io_in_5_bits_ctrl_srcType_0(exuBlocks_io_in_5_bits_ctrl_srcType_0),
    .io_in_5_bits_ctrl_srcType_1(exuBlocks_io_in_5_bits_ctrl_srcType_1),
    .io_in_5_bits_ctrl_fuType(exuBlocks_io_in_5_bits_ctrl_fuType),
    .io_in_5_bits_ctrl_fuOpType(exuBlocks_io_in_5_bits_ctrl_fuOpType),
    .io_in_5_bits_ctrl_rfWen(exuBlocks_io_in_5_bits_ctrl_rfWen),
    .io_in_5_bits_ctrl_fpWen(exuBlocks_io_in_5_bits_ctrl_fpWen),
    .io_in_5_bits_ctrl_flushPipe(exuBlocks_io_in_5_bits_ctrl_flushPipe),
    .io_in_5_bits_ctrl_imm(exuBlocks_io_in_5_bits_ctrl_imm),
    .io_in_5_bits_ctrl_replayInst(exuBlocks_io_in_5_bits_ctrl_replayInst),
    .io_in_5_bits_psrc_0(exuBlocks_io_in_5_bits_psrc_0),
    .io_in_5_bits_psrc_1(exuBlocks_io_in_5_bits_psrc_1),
    .io_in_5_bits_pdest(exuBlocks_io_in_5_bits_pdest),
    .io_in_5_bits_robIdx_flag(exuBlocks_io_in_5_bits_robIdx_flag),
    .io_in_5_bits_robIdx_value(exuBlocks_io_in_5_bits_robIdx_value),
    .io_in_6_valid(exuBlocks_io_in_6_valid),
    .io_in_6_bits_cf_foldpc(exuBlocks_io_in_6_bits_cf_foldpc),
    .io_in_6_bits_cf_trigger_backendEn_0(exuBlocks_io_in_6_bits_cf_trigger_backendEn_0),
    .io_in_6_bits_cf_trigger_backendEn_1(exuBlocks_io_in_6_bits_cf_trigger_backendEn_1),
    .io_in_6_bits_cf_pd_isRVC(exuBlocks_io_in_6_bits_cf_pd_isRVC),
    .io_in_6_bits_cf_pd_brType(exuBlocks_io_in_6_bits_cf_pd_brType),
    .io_in_6_bits_cf_pd_isCall(exuBlocks_io_in_6_bits_cf_pd_isCall),
    .io_in_6_bits_cf_pd_isRet(exuBlocks_io_in_6_bits_cf_pd_isRet),
    .io_in_6_bits_cf_pred_taken(exuBlocks_io_in_6_bits_cf_pred_taken),
    .io_in_6_bits_cf_storeSetHit(exuBlocks_io_in_6_bits_cf_storeSetHit),
    .io_in_6_bits_cf_waitForRobIdx_flag(exuBlocks_io_in_6_bits_cf_waitForRobIdx_flag),
    .io_in_6_bits_cf_waitForRobIdx_value(exuBlocks_io_in_6_bits_cf_waitForRobIdx_value),
    .io_in_6_bits_cf_loadWaitBit(exuBlocks_io_in_6_bits_cf_loadWaitBit),
    .io_in_6_bits_cf_loadWaitStrict(exuBlocks_io_in_6_bits_cf_loadWaitStrict),
    .io_in_6_bits_cf_ssid(exuBlocks_io_in_6_bits_cf_ssid),
    .io_in_6_bits_cf_ftqPtr_flag(exuBlocks_io_in_6_bits_cf_ftqPtr_flag),
    .io_in_6_bits_cf_ftqPtr_value(exuBlocks_io_in_6_bits_cf_ftqPtr_value),
    .io_in_6_bits_cf_ftqOffset(exuBlocks_io_in_6_bits_cf_ftqOffset),
    .io_in_6_bits_ctrl_srcType_0(exuBlocks_io_in_6_bits_ctrl_srcType_0),
    .io_in_6_bits_ctrl_srcType_1(exuBlocks_io_in_6_bits_ctrl_srcType_1),
    .io_in_6_bits_ctrl_fuType(exuBlocks_io_in_6_bits_ctrl_fuType),
    .io_in_6_bits_ctrl_fuOpType(exuBlocks_io_in_6_bits_ctrl_fuOpType),
    .io_in_6_bits_ctrl_rfWen(exuBlocks_io_in_6_bits_ctrl_rfWen),
    .io_in_6_bits_ctrl_fpWen(exuBlocks_io_in_6_bits_ctrl_fpWen),
    .io_in_6_bits_ctrl_flushPipe(exuBlocks_io_in_6_bits_ctrl_flushPipe),
    .io_in_6_bits_ctrl_imm(exuBlocks_io_in_6_bits_ctrl_imm),
    .io_in_6_bits_ctrl_replayInst(exuBlocks_io_in_6_bits_ctrl_replayInst),
    .io_in_6_bits_psrc_0(exuBlocks_io_in_6_bits_psrc_0),
    .io_in_6_bits_psrc_1(exuBlocks_io_in_6_bits_psrc_1),
    .io_in_6_bits_pdest(exuBlocks_io_in_6_bits_pdest),
    .io_in_6_bits_robIdx_flag(exuBlocks_io_in_6_bits_robIdx_flag),
    .io_in_6_bits_robIdx_value(exuBlocks_io_in_6_bits_robIdx_value),
    .io_in_7_valid(exuBlocks_io_in_7_valid),
    .io_in_7_bits_cf_foldpc(exuBlocks_io_in_7_bits_cf_foldpc),
    .io_in_7_bits_cf_trigger_backendEn_0(exuBlocks_io_in_7_bits_cf_trigger_backendEn_0),
    .io_in_7_bits_cf_trigger_backendEn_1(exuBlocks_io_in_7_bits_cf_trigger_backendEn_1),
    .io_in_7_bits_cf_pd_isRVC(exuBlocks_io_in_7_bits_cf_pd_isRVC),
    .io_in_7_bits_cf_pd_brType(exuBlocks_io_in_7_bits_cf_pd_brType),
    .io_in_7_bits_cf_pd_isCall(exuBlocks_io_in_7_bits_cf_pd_isCall),
    .io_in_7_bits_cf_pd_isRet(exuBlocks_io_in_7_bits_cf_pd_isRet),
    .io_in_7_bits_cf_pred_taken(exuBlocks_io_in_7_bits_cf_pred_taken),
    .io_in_7_bits_cf_storeSetHit(exuBlocks_io_in_7_bits_cf_storeSetHit),
    .io_in_7_bits_cf_waitForRobIdx_flag(exuBlocks_io_in_7_bits_cf_waitForRobIdx_flag),
    .io_in_7_bits_cf_waitForRobIdx_value(exuBlocks_io_in_7_bits_cf_waitForRobIdx_value),
    .io_in_7_bits_cf_loadWaitBit(exuBlocks_io_in_7_bits_cf_loadWaitBit),
    .io_in_7_bits_cf_loadWaitStrict(exuBlocks_io_in_7_bits_cf_loadWaitStrict),
    .io_in_7_bits_cf_ssid(exuBlocks_io_in_7_bits_cf_ssid),
    .io_in_7_bits_cf_ftqPtr_flag(exuBlocks_io_in_7_bits_cf_ftqPtr_flag),
    .io_in_7_bits_cf_ftqPtr_value(exuBlocks_io_in_7_bits_cf_ftqPtr_value),
    .io_in_7_bits_cf_ftqOffset(exuBlocks_io_in_7_bits_cf_ftqOffset),
    .io_in_7_bits_ctrl_srcType_0(exuBlocks_io_in_7_bits_ctrl_srcType_0),
    .io_in_7_bits_ctrl_srcType_1(exuBlocks_io_in_7_bits_ctrl_srcType_1),
    .io_in_7_bits_ctrl_fuType(exuBlocks_io_in_7_bits_ctrl_fuType),
    .io_in_7_bits_ctrl_fuOpType(exuBlocks_io_in_7_bits_ctrl_fuOpType),
    .io_in_7_bits_ctrl_rfWen(exuBlocks_io_in_7_bits_ctrl_rfWen),
    .io_in_7_bits_ctrl_fpWen(exuBlocks_io_in_7_bits_ctrl_fpWen),
    .io_in_7_bits_ctrl_flushPipe(exuBlocks_io_in_7_bits_ctrl_flushPipe),
    .io_in_7_bits_ctrl_imm(exuBlocks_io_in_7_bits_ctrl_imm),
    .io_in_7_bits_ctrl_replayInst(exuBlocks_io_in_7_bits_ctrl_replayInst),
    .io_in_7_bits_psrc_0(exuBlocks_io_in_7_bits_psrc_0),
    .io_in_7_bits_psrc_1(exuBlocks_io_in_7_bits_psrc_1),
    .io_in_7_bits_pdest(exuBlocks_io_in_7_bits_pdest),
    .io_in_7_bits_robIdx_flag(exuBlocks_io_in_7_bits_robIdx_flag),
    .io_in_7_bits_robIdx_value(exuBlocks_io_in_7_bits_robIdx_value),
    .io_issue_0_ready(exuBlocks_io_issue_0_ready),
    .io_issue_0_valid(exuBlocks_io_issue_0_valid),
    .io_issue_0_bits_uop_cf_foldpc(exuBlocks_io_issue_0_bits_uop_cf_foldpc),
    .io_issue_0_bits_uop_cf_trigger_backendEn_1(exuBlocks_io_issue_0_bits_uop_cf_trigger_backendEn_1),
    .io_issue_0_bits_uop_cf_waitForRobIdx_flag(exuBlocks_io_issue_0_bits_uop_cf_waitForRobIdx_flag),
    .io_issue_0_bits_uop_cf_waitForRobIdx_value(exuBlocks_io_issue_0_bits_uop_cf_waitForRobIdx_value),
    .io_issue_0_bits_uop_cf_loadWaitBit(exuBlocks_io_issue_0_bits_uop_cf_loadWaitBit),
    .io_issue_0_bits_uop_cf_loadWaitStrict(exuBlocks_io_issue_0_bits_uop_cf_loadWaitStrict),
    .io_issue_0_bits_uop_cf_ftqPtr_flag(exuBlocks_io_issue_0_bits_uop_cf_ftqPtr_flag),
    .io_issue_0_bits_uop_cf_ftqPtr_value(exuBlocks_io_issue_0_bits_uop_cf_ftqPtr_value),
    .io_issue_0_bits_uop_cf_ftqOffset(exuBlocks_io_issue_0_bits_uop_cf_ftqOffset),
    .io_issue_0_bits_uop_ctrl_fuType(exuBlocks_io_issue_0_bits_uop_ctrl_fuType),
    .io_issue_0_bits_uop_ctrl_fuOpType(exuBlocks_io_issue_0_bits_uop_ctrl_fuOpType),
    .io_issue_0_bits_uop_ctrl_rfWen(exuBlocks_io_issue_0_bits_uop_ctrl_rfWen),
    .io_issue_0_bits_uop_ctrl_fpWen(exuBlocks_io_issue_0_bits_uop_ctrl_fpWen),
    .io_issue_0_bits_uop_ctrl_imm(exuBlocks_io_issue_0_bits_uop_ctrl_imm),
    .io_issue_0_bits_uop_pdest(exuBlocks_io_issue_0_bits_uop_pdest),
    .io_issue_0_bits_uop_robIdx_flag(exuBlocks_io_issue_0_bits_uop_robIdx_flag),
    .io_issue_0_bits_uop_robIdx_value(exuBlocks_io_issue_0_bits_uop_robIdx_value),
    .io_issue_0_bits_uop_lqIdx_flag(exuBlocks_io_issue_0_bits_uop_lqIdx_flag),
    .io_issue_0_bits_uop_lqIdx_value(exuBlocks_io_issue_0_bits_uop_lqIdx_value),
    .io_issue_0_bits_uop_sqIdx_flag(exuBlocks_io_issue_0_bits_uop_sqIdx_flag),
    .io_issue_0_bits_uop_sqIdx_value(exuBlocks_io_issue_0_bits_uop_sqIdx_value),
    .io_issue_0_bits_src_0(exuBlocks_io_issue_0_bits_src_0),
    .io_issue_1_ready(exuBlocks_io_issue_1_ready),
    .io_issue_1_valid(exuBlocks_io_issue_1_valid),
    .io_issue_1_bits_uop_cf_foldpc(exuBlocks_io_issue_1_bits_uop_cf_foldpc),
    .io_issue_1_bits_uop_cf_trigger_backendEn_1(exuBlocks_io_issue_1_bits_uop_cf_trigger_backendEn_1),
    .io_issue_1_bits_uop_cf_waitForRobIdx_flag(exuBlocks_io_issue_1_bits_uop_cf_waitForRobIdx_flag),
    .io_issue_1_bits_uop_cf_waitForRobIdx_value(exuBlocks_io_issue_1_bits_uop_cf_waitForRobIdx_value),
    .io_issue_1_bits_uop_cf_loadWaitBit(exuBlocks_io_issue_1_bits_uop_cf_loadWaitBit),
    .io_issue_1_bits_uop_cf_loadWaitStrict(exuBlocks_io_issue_1_bits_uop_cf_loadWaitStrict),
    .io_issue_1_bits_uop_cf_ftqPtr_flag(exuBlocks_io_issue_1_bits_uop_cf_ftqPtr_flag),
    .io_issue_1_bits_uop_cf_ftqPtr_value(exuBlocks_io_issue_1_bits_uop_cf_ftqPtr_value),
    .io_issue_1_bits_uop_cf_ftqOffset(exuBlocks_io_issue_1_bits_uop_cf_ftqOffset),
    .io_issue_1_bits_uop_ctrl_fuType(exuBlocks_io_issue_1_bits_uop_ctrl_fuType),
    .io_issue_1_bits_uop_ctrl_fuOpType(exuBlocks_io_issue_1_bits_uop_ctrl_fuOpType),
    .io_issue_1_bits_uop_ctrl_rfWen(exuBlocks_io_issue_1_bits_uop_ctrl_rfWen),
    .io_issue_1_bits_uop_ctrl_fpWen(exuBlocks_io_issue_1_bits_uop_ctrl_fpWen),
    .io_issue_1_bits_uop_ctrl_imm(exuBlocks_io_issue_1_bits_uop_ctrl_imm),
    .io_issue_1_bits_uop_pdest(exuBlocks_io_issue_1_bits_uop_pdest),
    .io_issue_1_bits_uop_robIdx_flag(exuBlocks_io_issue_1_bits_uop_robIdx_flag),
    .io_issue_1_bits_uop_robIdx_value(exuBlocks_io_issue_1_bits_uop_robIdx_value),
    .io_issue_1_bits_uop_lqIdx_flag(exuBlocks_io_issue_1_bits_uop_lqIdx_flag),
    .io_issue_1_bits_uop_lqIdx_value(exuBlocks_io_issue_1_bits_uop_lqIdx_value),
    .io_issue_1_bits_uop_sqIdx_flag(exuBlocks_io_issue_1_bits_uop_sqIdx_flag),
    .io_issue_1_bits_uop_sqIdx_value(exuBlocks_io_issue_1_bits_uop_sqIdx_value),
    .io_issue_1_bits_src_0(exuBlocks_io_issue_1_bits_src_0),
    .io_issue_2_ready(exuBlocks_io_issue_2_ready),
    .io_issue_2_valid(exuBlocks_io_issue_2_valid),
    .io_issue_2_bits_uop_cf_trigger_backendEn_0(exuBlocks_io_issue_2_bits_uop_cf_trigger_backendEn_0),
    .io_issue_2_bits_uop_cf_trigger_backendEn_1(exuBlocks_io_issue_2_bits_uop_cf_trigger_backendEn_1),
    .io_issue_2_bits_uop_cf_storeSetHit(exuBlocks_io_issue_2_bits_uop_cf_storeSetHit),
    .io_issue_2_bits_uop_cf_ssid(exuBlocks_io_issue_2_bits_uop_cf_ssid),
    .io_issue_2_bits_uop_cf_ftqPtr_value(exuBlocks_io_issue_2_bits_uop_cf_ftqPtr_value),
    .io_issue_2_bits_uop_cf_ftqOffset(exuBlocks_io_issue_2_bits_uop_cf_ftqOffset),
    .io_issue_2_bits_uop_ctrl_fuType(exuBlocks_io_issue_2_bits_uop_ctrl_fuType),
    .io_issue_2_bits_uop_ctrl_fuOpType(exuBlocks_io_issue_2_bits_uop_ctrl_fuOpType),
    .io_issue_2_bits_uop_ctrl_rfWen(exuBlocks_io_issue_2_bits_uop_ctrl_rfWen),
    .io_issue_2_bits_uop_ctrl_fpWen(exuBlocks_io_issue_2_bits_uop_ctrl_fpWen),
    .io_issue_2_bits_uop_ctrl_imm(exuBlocks_io_issue_2_bits_uop_ctrl_imm),
    .io_issue_2_bits_uop_pdest(exuBlocks_io_issue_2_bits_uop_pdest),
    .io_issue_2_bits_uop_robIdx_flag(exuBlocks_io_issue_2_bits_uop_robIdx_flag),
    .io_issue_2_bits_uop_robIdx_value(exuBlocks_io_issue_2_bits_uop_robIdx_value),
    .io_issue_2_bits_uop_sqIdx_flag(exuBlocks_io_issue_2_bits_uop_sqIdx_flag),
    .io_issue_2_bits_uop_sqIdx_value(exuBlocks_io_issue_2_bits_uop_sqIdx_value),
    .io_issue_2_bits_src_0(exuBlocks_io_issue_2_bits_src_0),
    .io_issue_3_ready(exuBlocks_io_issue_3_ready),
    .io_issue_3_valid(exuBlocks_io_issue_3_valid),
    .io_issue_3_bits_uop_cf_trigger_backendEn_0(exuBlocks_io_issue_3_bits_uop_cf_trigger_backendEn_0),
    .io_issue_3_bits_uop_cf_trigger_backendEn_1(exuBlocks_io_issue_3_bits_uop_cf_trigger_backendEn_1),
    .io_issue_3_bits_uop_cf_storeSetHit(exuBlocks_io_issue_3_bits_uop_cf_storeSetHit),
    .io_issue_3_bits_uop_cf_ssid(exuBlocks_io_issue_3_bits_uop_cf_ssid),
    .io_issue_3_bits_uop_cf_ftqPtr_value(exuBlocks_io_issue_3_bits_uop_cf_ftqPtr_value),
    .io_issue_3_bits_uop_cf_ftqOffset(exuBlocks_io_issue_3_bits_uop_cf_ftqOffset),
    .io_issue_3_bits_uop_ctrl_fuType(exuBlocks_io_issue_3_bits_uop_ctrl_fuType),
    .io_issue_3_bits_uop_ctrl_fuOpType(exuBlocks_io_issue_3_bits_uop_ctrl_fuOpType),
    .io_issue_3_bits_uop_ctrl_rfWen(exuBlocks_io_issue_3_bits_uop_ctrl_rfWen),
    .io_issue_3_bits_uop_ctrl_fpWen(exuBlocks_io_issue_3_bits_uop_ctrl_fpWen),
    .io_issue_3_bits_uop_ctrl_imm(exuBlocks_io_issue_3_bits_uop_ctrl_imm),
    .io_issue_3_bits_uop_pdest(exuBlocks_io_issue_3_bits_uop_pdest),
    .io_issue_3_bits_uop_robIdx_flag(exuBlocks_io_issue_3_bits_uop_robIdx_flag),
    .io_issue_3_bits_uop_robIdx_value(exuBlocks_io_issue_3_bits_uop_robIdx_value),
    .io_issue_3_bits_uop_sqIdx_flag(exuBlocks_io_issue_3_bits_uop_sqIdx_flag),
    .io_issue_3_bits_uop_sqIdx_value(exuBlocks_io_issue_3_bits_uop_sqIdx_value),
    .io_issue_3_bits_src_0(exuBlocks_io_issue_3_bits_src_0),
    .io_issue_4_ready(exuBlocks_io_issue_4_ready),
    .io_issue_4_valid(exuBlocks_io_issue_4_valid),
    .io_issue_4_bits_uop_ctrl_fuType(exuBlocks_io_issue_4_bits_uop_ctrl_fuType),
    .io_issue_4_bits_uop_ctrl_fuOpType(exuBlocks_io_issue_4_bits_uop_ctrl_fuOpType),
    .io_issue_4_bits_uop_robIdx_flag(exuBlocks_io_issue_4_bits_uop_robIdx_flag),
    .io_issue_4_bits_uop_robIdx_value(exuBlocks_io_issue_4_bits_uop_robIdx_value),
    .io_issue_4_bits_uop_sqIdx_flag(exuBlocks_io_issue_4_bits_uop_sqIdx_flag),
    .io_issue_4_bits_uop_sqIdx_value(exuBlocks_io_issue_4_bits_uop_sqIdx_value),
    .io_issue_4_bits_src_0(exuBlocks_io_issue_4_bits_src_0),
    .io_issue_5_ready(exuBlocks_io_issue_5_ready),
    .io_issue_5_valid(exuBlocks_io_issue_5_valid),
    .io_issue_5_bits_uop_ctrl_fuType(exuBlocks_io_issue_5_bits_uop_ctrl_fuType),
    .io_issue_5_bits_uop_ctrl_fuOpType(exuBlocks_io_issue_5_bits_uop_ctrl_fuOpType),
    .io_issue_5_bits_uop_robIdx_flag(exuBlocks_io_issue_5_bits_uop_robIdx_flag),
    .io_issue_5_bits_uop_robIdx_value(exuBlocks_io_issue_5_bits_uop_robIdx_value),
    .io_issue_5_bits_uop_sqIdx_flag(exuBlocks_io_issue_5_bits_uop_sqIdx_flag),
    .io_issue_5_bits_uop_sqIdx_value(exuBlocks_io_issue_5_bits_uop_sqIdx_value),
    .io_issue_5_bits_src_0(exuBlocks_io_issue_5_bits_src_0),
    .io_rfWriteback_2_valid(exuBlocks_io_rfWriteback_2_valid),
    .io_rfWriteback_2_bits_uop_ctrl_rfWen(exuBlocks_io_rfWriteback_2_bits_uop_ctrl_rfWen),
    .io_rfWriteback_2_bits_uop_ctrl_fpWen(exuBlocks_io_rfWriteback_2_bits_uop_ctrl_fpWen),
    .io_rfWriteback_2_bits_uop_pdest(exuBlocks_io_rfWriteback_2_bits_uop_pdest),
    .io_rfWriteback_2_bits_data(exuBlocks_io_rfWriteback_2_bits_data),
    .io_rfWriteback_3_valid(exuBlocks_io_rfWriteback_3_valid),
    .io_rfWriteback_3_bits_uop_ctrl_rfWen(exuBlocks_io_rfWriteback_3_bits_uop_ctrl_rfWen),
    .io_rfWriteback_3_bits_uop_ctrl_fpWen(exuBlocks_io_rfWriteback_3_bits_uop_ctrl_fpWen),
    .io_rfWriteback_3_bits_uop_pdest(exuBlocks_io_rfWriteback_3_bits_uop_pdest),
    .io_rfWriteback_3_bits_data(exuBlocks_io_rfWriteback_3_bits_data),
    .io_rfWriteback_4_valid(exuBlocks_io_rfWriteback_4_valid),
    .io_rfWriteback_4_bits_uop_ctrl_rfWen(exuBlocks_io_rfWriteback_4_bits_uop_ctrl_rfWen),
    .io_rfWriteback_4_bits_uop_ctrl_fpWen(exuBlocks_io_rfWriteback_4_bits_uop_ctrl_fpWen),
    .io_rfWriteback_4_bits_uop_pdest(exuBlocks_io_rfWriteback_4_bits_uop_pdest),
    .io_rfWriteback_4_bits_data(exuBlocks_io_rfWriteback_4_bits_data),
    .io_rfWriteback_5_valid(exuBlocks_io_rfWriteback_5_valid),
    .io_rfWriteback_5_bits_uop_ctrl_rfWen(exuBlocks_io_rfWriteback_5_bits_uop_ctrl_rfWen),
    .io_rfWriteback_5_bits_uop_ctrl_fpWen(exuBlocks_io_rfWriteback_5_bits_uop_ctrl_fpWen),
    .io_rfWriteback_5_bits_uop_pdest(exuBlocks_io_rfWriteback_5_bits_uop_pdest),
    .io_rfWriteback_5_bits_data(exuBlocks_io_rfWriteback_5_bits_data),
    .io_rfWriteback_6_valid(exuBlocks_io_rfWriteback_6_valid),
    .io_rfWriteback_6_bits_uop_ctrl_rfWen(exuBlocks_io_rfWriteback_6_bits_uop_ctrl_rfWen),
    .io_rfWriteback_6_bits_uop_ctrl_fpWen(exuBlocks_io_rfWriteback_6_bits_uop_ctrl_fpWen),
    .io_rfWriteback_6_bits_uop_pdest(exuBlocks_io_rfWriteback_6_bits_uop_pdest),
    .io_rfWriteback_6_bits_data(exuBlocks_io_rfWriteback_6_bits_data),
    .io_rfWriteback_7_valid(exuBlocks_io_rfWriteback_7_valid),
    .io_rfWriteback_7_bits_uop_ctrl_rfWen(exuBlocks_io_rfWriteback_7_bits_uop_ctrl_rfWen),
    .io_rfWriteback_7_bits_uop_ctrl_fpWen(exuBlocks_io_rfWriteback_7_bits_uop_ctrl_fpWen),
    .io_rfWriteback_7_bits_uop_pdest(exuBlocks_io_rfWriteback_7_bits_uop_pdest),
    .io_rfWriteback_7_bits_data(exuBlocks_io_rfWriteback_7_bits_data),
    .io_rfWriteback_8_valid(exuBlocks_io_rfWriteback_8_valid),
    .io_rfWriteback_8_bits_uop_ctrl_rfWen(exuBlocks_io_rfWriteback_8_bits_uop_ctrl_rfWen),
    .io_rfWriteback_8_bits_uop_ctrl_fpWen(exuBlocks_io_rfWriteback_8_bits_uop_ctrl_fpWen),
    .io_rfWriteback_8_bits_uop_pdest(exuBlocks_io_rfWriteback_8_bits_uop_pdest),
    .io_rfWriteback_8_bits_data(exuBlocks_io_rfWriteback_8_bits_data),
    .io_fuWriteback_0_valid(exuBlocks_io_fuWriteback_0_valid),
    .io_fuWriteback_0_bits_uop_ctrl_rfWen(exuBlocks_io_fuWriteback_0_bits_uop_ctrl_rfWen),
    .io_fuWriteback_0_bits_uop_pdest(exuBlocks_io_fuWriteback_0_bits_uop_pdest),
    .io_fuWriteback_0_bits_uop_robIdx_flag(exuBlocks_io_fuWriteback_0_bits_uop_robIdx_flag),
    .io_fuWriteback_0_bits_uop_robIdx_value(exuBlocks_io_fuWriteback_0_bits_uop_robIdx_value),
    .io_fuWriteback_0_bits_data(exuBlocks_io_fuWriteback_0_bits_data),
    .io_fuWriteback_0_bits_redirectValid(exuBlocks_io_fuWriteback_0_bits_redirectValid),
    .io_fuWriteback_0_bits_redirect_cfiUpdate_isMisPred(exuBlocks_io_fuWriteback_0_bits_redirect_cfiUpdate_isMisPred),
    .io_fuWriteback_1_valid(exuBlocks_io_fuWriteback_1_valid),
    .io_fuWriteback_1_bits_uop_ctrl_rfWen(exuBlocks_io_fuWriteback_1_bits_uop_ctrl_rfWen),
    .io_fuWriteback_1_bits_uop_pdest(exuBlocks_io_fuWriteback_1_bits_uop_pdest),
    .io_fuWriteback_1_bits_uop_robIdx_flag(exuBlocks_io_fuWriteback_1_bits_uop_robIdx_flag),
    .io_fuWriteback_1_bits_uop_robIdx_value(exuBlocks_io_fuWriteback_1_bits_uop_robIdx_value),
    .io_fuWriteback_1_bits_data(exuBlocks_io_fuWriteback_1_bits_data),
    .io_fuWriteback_1_bits_redirectValid(exuBlocks_io_fuWriteback_1_bits_redirectValid),
    .io_fuWriteback_1_bits_redirect_cfiUpdate_isMisPred(exuBlocks_io_fuWriteback_1_bits_redirect_cfiUpdate_isMisPred),
    .io_fuWriteback_2_valid(exuBlocks_io_fuWriteback_2_valid),
    .io_fuWriteback_2_bits_uop_ctrl_rfWen(exuBlocks_io_fuWriteback_2_bits_uop_ctrl_rfWen),
    .io_fuWriteback_2_bits_uop_ctrl_fpWen(exuBlocks_io_fuWriteback_2_bits_uop_ctrl_fpWen),
    .io_fuWriteback_2_bits_uop_pdest(exuBlocks_io_fuWriteback_2_bits_uop_pdest),
    .io_fuWriteback_2_bits_uop_robIdx_flag(exuBlocks_io_fuWriteback_2_bits_uop_robIdx_flag),
    .io_fuWriteback_2_bits_uop_robIdx_value(exuBlocks_io_fuWriteback_2_bits_uop_robIdx_value),
    .io_fuWriteback_2_bits_data(exuBlocks_io_fuWriteback_2_bits_data),
    .io_fuWriteback_3_ready(exuBlocks_io_fuWriteback_3_ready),
    .io_fuWriteback_3_valid(exuBlocks_io_fuWriteback_3_valid),
    .io_fuWriteback_3_bits_uop_cf_exceptionVec_2(exuBlocks_io_fuWriteback_3_bits_uop_cf_exceptionVec_2),
    .io_fuWriteback_3_bits_uop_cf_exceptionVec_3(exuBlocks_io_fuWriteback_3_bits_uop_cf_exceptionVec_3),
    .io_fuWriteback_3_bits_uop_cf_exceptionVec_8(exuBlocks_io_fuWriteback_3_bits_uop_cf_exceptionVec_8),
    .io_fuWriteback_3_bits_uop_cf_exceptionVec_9(exuBlocks_io_fuWriteback_3_bits_uop_cf_exceptionVec_9),
    .io_fuWriteback_3_bits_uop_cf_exceptionVec_11(exuBlocks_io_fuWriteback_3_bits_uop_cf_exceptionVec_11),
    .io_fuWriteback_3_bits_uop_ctrl_rfWen(exuBlocks_io_fuWriteback_3_bits_uop_ctrl_rfWen),
    .io_fuWriteback_3_bits_uop_ctrl_fpWen(exuBlocks_io_fuWriteback_3_bits_uop_ctrl_fpWen),
    .io_fuWriteback_3_bits_uop_ctrl_flushPipe(exuBlocks_io_fuWriteback_3_bits_uop_ctrl_flushPipe),
    .io_fuWriteback_3_bits_uop_pdest(exuBlocks_io_fuWriteback_3_bits_uop_pdest),
    .io_fuWriteback_3_bits_uop_robIdx_flag(exuBlocks_io_fuWriteback_3_bits_uop_robIdx_flag),
    .io_fuWriteback_3_bits_uop_robIdx_value(exuBlocks_io_fuWriteback_3_bits_uop_robIdx_value),
    .io_fuWriteback_3_bits_data(exuBlocks_io_fuWriteback_3_bits_data),
    .io_fuWriteback_3_bits_fflags(exuBlocks_io_fuWriteback_3_bits_fflags),
    .io_fuWriteback_3_bits_redirectValid(exuBlocks_io_fuWriteback_3_bits_redirectValid),
    .io_fuWriteback_3_bits_redirect_cfiUpdate_isMisPred(exuBlocks_io_fuWriteback_3_bits_redirect_cfiUpdate_isMisPred),
    .io_fuWriteback_3_bits_debug_isPerfCnt(exuBlocks_io_fuWriteback_3_bits_debug_isPerfCnt),
    .io_scheExtra_rsReady_0(exuBlocks_io_scheExtra_rsReady_0),
    .io_scheExtra_rsReady_1(exuBlocks_io_scheExtra_rsReady_1),
    .io_scheExtra_rsReady_2(exuBlocks_io_scheExtra_rsReady_2),
    .io_scheExtra_rsReady_3(exuBlocks_io_scheExtra_rsReady_3),
    .io_scheExtra_rsReady_4(exuBlocks_io_scheExtra_rsReady_4),
    .io_scheExtra_rsReady_5(exuBlocks_io_scheExtra_rsReady_5),
    .io_scheExtra_rsReady_6(exuBlocks_io_scheExtra_rsReady_6),
    .io_scheExtra_rsReady_7(exuBlocks_io_scheExtra_rsReady_7),
    .io_scheExtra_feedback_0_feedbackSlow_valid(exuBlocks_io_scheExtra_feedback_0_feedbackSlow_valid),
    .io_scheExtra_feedback_0_feedbackSlow_bits_rsIdx(exuBlocks_io_scheExtra_feedback_0_feedbackSlow_bits_rsIdx),
    .io_scheExtra_feedback_0_feedbackSlow_bits_hit(exuBlocks_io_scheExtra_feedback_0_feedbackSlow_bits_hit),
    .io_scheExtra_feedback_0_rsIdx(exuBlocks_io_scheExtra_feedback_0_rsIdx),
    .io_scheExtra_feedback_1_feedbackSlow_valid(exuBlocks_io_scheExtra_feedback_1_feedbackSlow_valid),
    .io_scheExtra_feedback_1_feedbackSlow_bits_rsIdx(exuBlocks_io_scheExtra_feedback_1_feedbackSlow_bits_rsIdx),
    .io_scheExtra_feedback_1_feedbackSlow_bits_hit(exuBlocks_io_scheExtra_feedback_1_feedbackSlow_bits_hit),
    .io_scheExtra_feedback_1_rsIdx(exuBlocks_io_scheExtra_feedback_1_rsIdx),
    .io_scheExtra_fpRfReadIn_0_addr(exuBlocks_io_scheExtra_fpRfReadIn_0_addr),
    .io_scheExtra_fpRfReadIn_0_data(exuBlocks_io_scheExtra_fpRfReadIn_0_data),
    .io_scheExtra_fpRfReadIn_1_addr(exuBlocks_io_scheExtra_fpRfReadIn_1_addr),
    .io_scheExtra_fpRfReadIn_1_data(exuBlocks_io_scheExtra_fpRfReadIn_1_data),
    .io_scheExtra_loadFastMatch_0(exuBlocks_io_scheExtra_loadFastMatch_0),
    .io_scheExtra_loadFastMatch_1(exuBlocks_io_scheExtra_loadFastMatch_1),
    .io_scheExtra_loadFastImm_0(exuBlocks_io_scheExtra_loadFastImm_0),
    .io_scheExtra_loadFastImm_1(exuBlocks_io_scheExtra_loadFastImm_1),
    .io_scheExtra_jumpPc(exuBlocks_io_scheExtra_jumpPc),
    .io_scheExtra_jalr_target(exuBlocks_io_scheExtra_jalr_target),
    .io_scheExtra_lcommit(exuBlocks_io_scheExtra_lcommit),
    .io_scheExtra_scommit(exuBlocks_io_scheExtra_scommit),
    .io_scheExtra_lqCancelCnt(exuBlocks_io_scheExtra_lqCancelCnt),
    .io_scheExtra_sqCancelCnt(exuBlocks_io_scheExtra_sqCancelCnt),
    .io_scheExtra_debug_int_rat_0(exuBlocks_io_scheExtra_debug_int_rat_0),
    .io_scheExtra_debug_int_rat_1(exuBlocks_io_scheExtra_debug_int_rat_1),
    .io_scheExtra_debug_int_rat_2(exuBlocks_io_scheExtra_debug_int_rat_2),
    .io_scheExtra_debug_int_rat_3(exuBlocks_io_scheExtra_debug_int_rat_3),
    .io_scheExtra_debug_int_rat_4(exuBlocks_io_scheExtra_debug_int_rat_4),
    .io_scheExtra_debug_int_rat_5(exuBlocks_io_scheExtra_debug_int_rat_5),
    .io_scheExtra_debug_int_rat_6(exuBlocks_io_scheExtra_debug_int_rat_6),
    .io_scheExtra_debug_int_rat_7(exuBlocks_io_scheExtra_debug_int_rat_7),
    .io_scheExtra_debug_int_rat_8(exuBlocks_io_scheExtra_debug_int_rat_8),
    .io_scheExtra_debug_int_rat_9(exuBlocks_io_scheExtra_debug_int_rat_9),
    .io_scheExtra_debug_int_rat_10(exuBlocks_io_scheExtra_debug_int_rat_10),
    .io_scheExtra_debug_int_rat_11(exuBlocks_io_scheExtra_debug_int_rat_11),
    .io_scheExtra_debug_int_rat_12(exuBlocks_io_scheExtra_debug_int_rat_12),
    .io_scheExtra_debug_int_rat_13(exuBlocks_io_scheExtra_debug_int_rat_13),
    .io_scheExtra_debug_int_rat_14(exuBlocks_io_scheExtra_debug_int_rat_14),
    .io_scheExtra_debug_int_rat_15(exuBlocks_io_scheExtra_debug_int_rat_15),
    .io_scheExtra_debug_int_rat_16(exuBlocks_io_scheExtra_debug_int_rat_16),
    .io_scheExtra_debug_int_rat_17(exuBlocks_io_scheExtra_debug_int_rat_17),
    .io_scheExtra_debug_int_rat_18(exuBlocks_io_scheExtra_debug_int_rat_18),
    .io_scheExtra_debug_int_rat_19(exuBlocks_io_scheExtra_debug_int_rat_19),
    .io_scheExtra_debug_int_rat_20(exuBlocks_io_scheExtra_debug_int_rat_20),
    .io_scheExtra_debug_int_rat_21(exuBlocks_io_scheExtra_debug_int_rat_21),
    .io_scheExtra_debug_int_rat_22(exuBlocks_io_scheExtra_debug_int_rat_22),
    .io_scheExtra_debug_int_rat_23(exuBlocks_io_scheExtra_debug_int_rat_23),
    .io_scheExtra_debug_int_rat_24(exuBlocks_io_scheExtra_debug_int_rat_24),
    .io_scheExtra_debug_int_rat_25(exuBlocks_io_scheExtra_debug_int_rat_25),
    .io_scheExtra_debug_int_rat_26(exuBlocks_io_scheExtra_debug_int_rat_26),
    .io_scheExtra_debug_int_rat_27(exuBlocks_io_scheExtra_debug_int_rat_27),
    .io_scheExtra_debug_int_rat_28(exuBlocks_io_scheExtra_debug_int_rat_28),
    .io_scheExtra_debug_int_rat_29(exuBlocks_io_scheExtra_debug_int_rat_29),
    .io_scheExtra_debug_int_rat_30(exuBlocks_io_scheExtra_debug_int_rat_30),
    .io_scheExtra_debug_int_rat_31(exuBlocks_io_scheExtra_debug_int_rat_31),
    .io_fuExtra_exuRedirect_0_valid(exuBlocks_io_fuExtra_exuRedirect_0_valid),
    .io_fuExtra_exuRedirect_0_bits_uop_cf_pd_isRVC(exuBlocks_io_fuExtra_exuRedirect_0_bits_uop_cf_pd_isRVC),
    .io_fuExtra_exuRedirect_0_bits_uop_cf_pd_brType(exuBlocks_io_fuExtra_exuRedirect_0_bits_uop_cf_pd_brType),
    .io_fuExtra_exuRedirect_0_bits_uop_cf_pd_isCall(exuBlocks_io_fuExtra_exuRedirect_0_bits_uop_cf_pd_isCall),
    .io_fuExtra_exuRedirect_0_bits_uop_cf_pd_isRet(exuBlocks_io_fuExtra_exuRedirect_0_bits_uop_cf_pd_isRet),
    .io_fuExtra_exuRedirect_0_bits_uop_ctrl_imm(exuBlocks_io_fuExtra_exuRedirect_0_bits_uop_ctrl_imm),
    .io_fuExtra_exuRedirect_0_bits_uop_robIdx_flag(exuBlocks_io_fuExtra_exuRedirect_0_bits_uop_robIdx_flag),
    .io_fuExtra_exuRedirect_0_bits_uop_robIdx_value(exuBlocks_io_fuExtra_exuRedirect_0_bits_uop_robIdx_value),
    .io_fuExtra_exuRedirect_0_bits_redirectValid(exuBlocks_io_fuExtra_exuRedirect_0_bits_redirectValid),
    .io_fuExtra_exuRedirect_0_bits_redirect_robIdx_flag(exuBlocks_io_fuExtra_exuRedirect_0_bits_redirect_robIdx_flag),
    .io_fuExtra_exuRedirect_0_bits_redirect_robIdx_value(exuBlocks_io_fuExtra_exuRedirect_0_bits_redirect_robIdx_value),
    .io_fuExtra_exuRedirect_0_bits_redirect_ftqIdx_flag(exuBlocks_io_fuExtra_exuRedirect_0_bits_redirect_ftqIdx_flag),
    .io_fuExtra_exuRedirect_0_bits_redirect_ftqIdx_value(exuBlocks_io_fuExtra_exuRedirect_0_bits_redirect_ftqIdx_value),
    .io_fuExtra_exuRedirect_0_bits_redirect_ftqOffset(exuBlocks_io_fuExtra_exuRedirect_0_bits_redirect_ftqOffset),
    .io_fuExtra_exuRedirect_0_bits_redirect_cfiUpdate_target(
      exuBlocks_io_fuExtra_exuRedirect_0_bits_redirect_cfiUpdate_target),
    .io_fuExtra_exuRedirect_0_bits_redirect_cfiUpdate_isMisPred(
      exuBlocks_io_fuExtra_exuRedirect_0_bits_redirect_cfiUpdate_isMisPred),
    .io_fuExtra_exuRedirect_1_valid(exuBlocks_io_fuExtra_exuRedirect_1_valid),
    .io_fuExtra_exuRedirect_1_bits_uop_cf_pd_isRVC(exuBlocks_io_fuExtra_exuRedirect_1_bits_uop_cf_pd_isRVC),
    .io_fuExtra_exuRedirect_1_bits_uop_cf_pd_brType(exuBlocks_io_fuExtra_exuRedirect_1_bits_uop_cf_pd_brType),
    .io_fuExtra_exuRedirect_1_bits_uop_cf_pd_isCall(exuBlocks_io_fuExtra_exuRedirect_1_bits_uop_cf_pd_isCall),
    .io_fuExtra_exuRedirect_1_bits_uop_cf_pd_isRet(exuBlocks_io_fuExtra_exuRedirect_1_bits_uop_cf_pd_isRet),
    .io_fuExtra_exuRedirect_1_bits_uop_ctrl_imm(exuBlocks_io_fuExtra_exuRedirect_1_bits_uop_ctrl_imm),
    .io_fuExtra_exuRedirect_1_bits_uop_robIdx_flag(exuBlocks_io_fuExtra_exuRedirect_1_bits_uop_robIdx_flag),
    .io_fuExtra_exuRedirect_1_bits_uop_robIdx_value(exuBlocks_io_fuExtra_exuRedirect_1_bits_uop_robIdx_value),
    .io_fuExtra_exuRedirect_1_bits_redirectValid(exuBlocks_io_fuExtra_exuRedirect_1_bits_redirectValid),
    .io_fuExtra_exuRedirect_1_bits_redirect_robIdx_flag(exuBlocks_io_fuExtra_exuRedirect_1_bits_redirect_robIdx_flag),
    .io_fuExtra_exuRedirect_1_bits_redirect_robIdx_value(exuBlocks_io_fuExtra_exuRedirect_1_bits_redirect_robIdx_value),
    .io_fuExtra_exuRedirect_1_bits_redirect_ftqIdx_flag(exuBlocks_io_fuExtra_exuRedirect_1_bits_redirect_ftqIdx_flag),
    .io_fuExtra_exuRedirect_1_bits_redirect_ftqIdx_value(exuBlocks_io_fuExtra_exuRedirect_1_bits_redirect_ftqIdx_value),
    .io_fuExtra_exuRedirect_1_bits_redirect_ftqOffset(exuBlocks_io_fuExtra_exuRedirect_1_bits_redirect_ftqOffset),
    .io_fuExtra_exuRedirect_1_bits_redirect_cfiUpdate_taken(
      exuBlocks_io_fuExtra_exuRedirect_1_bits_redirect_cfiUpdate_taken),
    .io_fuExtra_exuRedirect_1_bits_redirect_cfiUpdate_isMisPred(
      exuBlocks_io_fuExtra_exuRedirect_1_bits_redirect_cfiUpdate_isMisPred),
    .io_fuExtra_exuRedirect_2_valid(exuBlocks_io_fuExtra_exuRedirect_2_valid),
    .io_fuExtra_exuRedirect_2_bits_uop_cf_pd_isRVC(exuBlocks_io_fuExtra_exuRedirect_2_bits_uop_cf_pd_isRVC),
    .io_fuExtra_exuRedirect_2_bits_uop_cf_pd_brType(exuBlocks_io_fuExtra_exuRedirect_2_bits_uop_cf_pd_brType),
    .io_fuExtra_exuRedirect_2_bits_uop_cf_pd_isCall(exuBlocks_io_fuExtra_exuRedirect_2_bits_uop_cf_pd_isCall),
    .io_fuExtra_exuRedirect_2_bits_uop_cf_pd_isRet(exuBlocks_io_fuExtra_exuRedirect_2_bits_uop_cf_pd_isRet),
    .io_fuExtra_exuRedirect_2_bits_uop_ctrl_imm(exuBlocks_io_fuExtra_exuRedirect_2_bits_uop_ctrl_imm),
    .io_fuExtra_exuRedirect_2_bits_uop_robIdx_flag(exuBlocks_io_fuExtra_exuRedirect_2_bits_uop_robIdx_flag),
    .io_fuExtra_exuRedirect_2_bits_uop_robIdx_value(exuBlocks_io_fuExtra_exuRedirect_2_bits_uop_robIdx_value),
    .io_fuExtra_exuRedirect_2_bits_redirectValid(exuBlocks_io_fuExtra_exuRedirect_2_bits_redirectValid),
    .io_fuExtra_exuRedirect_2_bits_redirect_robIdx_flag(exuBlocks_io_fuExtra_exuRedirect_2_bits_redirect_robIdx_flag),
    .io_fuExtra_exuRedirect_2_bits_redirect_robIdx_value(exuBlocks_io_fuExtra_exuRedirect_2_bits_redirect_robIdx_value),
    .io_fuExtra_exuRedirect_2_bits_redirect_ftqIdx_flag(exuBlocks_io_fuExtra_exuRedirect_2_bits_redirect_ftqIdx_flag),
    .io_fuExtra_exuRedirect_2_bits_redirect_ftqIdx_value(exuBlocks_io_fuExtra_exuRedirect_2_bits_redirect_ftqIdx_value),
    .io_fuExtra_exuRedirect_2_bits_redirect_ftqOffset(exuBlocks_io_fuExtra_exuRedirect_2_bits_redirect_ftqOffset),
    .io_fuExtra_exuRedirect_2_bits_redirect_cfiUpdate_taken(
      exuBlocks_io_fuExtra_exuRedirect_2_bits_redirect_cfiUpdate_taken),
    .io_fuExtra_exuRedirect_2_bits_redirect_cfiUpdate_isMisPred(
      exuBlocks_io_fuExtra_exuRedirect_2_bits_redirect_cfiUpdate_isMisPred),
    .io_fuExtra_csrio_hartId(exuBlocks_io_fuExtra_csrio_hartId),
    .io_fuExtra_csrio_perf_perfEventsFrontend_0_value(exuBlocks_io_fuExtra_csrio_perf_perfEventsFrontend_0_value),
    .io_fuExtra_csrio_perf_perfEventsFrontend_1_value(exuBlocks_io_fuExtra_csrio_perf_perfEventsFrontend_1_value),
    .io_fuExtra_csrio_perf_perfEventsFrontend_2_value(exuBlocks_io_fuExtra_csrio_perf_perfEventsFrontend_2_value),
    .io_fuExtra_csrio_perf_perfEventsFrontend_3_value(exuBlocks_io_fuExtra_csrio_perf_perfEventsFrontend_3_value),
    .io_fuExtra_csrio_perf_perfEventsFrontend_4_value(exuBlocks_io_fuExtra_csrio_perf_perfEventsFrontend_4_value),
    .io_fuExtra_csrio_perf_perfEventsFrontend_5_value(exuBlocks_io_fuExtra_csrio_perf_perfEventsFrontend_5_value),
    .io_fuExtra_csrio_perf_perfEventsFrontend_6_value(exuBlocks_io_fuExtra_csrio_perf_perfEventsFrontend_6_value),
    .io_fuExtra_csrio_perf_perfEventsFrontend_7_value(exuBlocks_io_fuExtra_csrio_perf_perfEventsFrontend_7_value),
    .io_fuExtra_csrio_perf_perfEventsCtrl_0_value(exuBlocks_io_fuExtra_csrio_perf_perfEventsCtrl_0_value),
    .io_fuExtra_csrio_perf_perfEventsCtrl_1_value(exuBlocks_io_fuExtra_csrio_perf_perfEventsCtrl_1_value),
    .io_fuExtra_csrio_perf_perfEventsCtrl_2_value(exuBlocks_io_fuExtra_csrio_perf_perfEventsCtrl_2_value),
    .io_fuExtra_csrio_perf_perfEventsCtrl_3_value(exuBlocks_io_fuExtra_csrio_perf_perfEventsCtrl_3_value),
    .io_fuExtra_csrio_perf_perfEventsCtrl_4_value(exuBlocks_io_fuExtra_csrio_perf_perfEventsCtrl_4_value),
    .io_fuExtra_csrio_perf_perfEventsCtrl_5_value(exuBlocks_io_fuExtra_csrio_perf_perfEventsCtrl_5_value),
    .io_fuExtra_csrio_perf_perfEventsCtrl_6_value(exuBlocks_io_fuExtra_csrio_perf_perfEventsCtrl_6_value),
    .io_fuExtra_csrio_perf_perfEventsCtrl_7_value(exuBlocks_io_fuExtra_csrio_perf_perfEventsCtrl_7_value),
    .io_fuExtra_csrio_perf_perfEventsLsu_0_value(exuBlocks_io_fuExtra_csrio_perf_perfEventsLsu_0_value),
    .io_fuExtra_csrio_perf_perfEventsLsu_1_value(exuBlocks_io_fuExtra_csrio_perf_perfEventsLsu_1_value),
    .io_fuExtra_csrio_perf_perfEventsLsu_2_value(exuBlocks_io_fuExtra_csrio_perf_perfEventsLsu_2_value),
    .io_fuExtra_csrio_perf_perfEventsLsu_3_value(exuBlocks_io_fuExtra_csrio_perf_perfEventsLsu_3_value),
    .io_fuExtra_csrio_perf_perfEventsLsu_4_value(exuBlocks_io_fuExtra_csrio_perf_perfEventsLsu_4_value),
    .io_fuExtra_csrio_perf_perfEventsLsu_5_value(exuBlocks_io_fuExtra_csrio_perf_perfEventsLsu_5_value),
    .io_fuExtra_csrio_perf_perfEventsLsu_6_value(exuBlocks_io_fuExtra_csrio_perf_perfEventsLsu_6_value),
    .io_fuExtra_csrio_perf_perfEventsLsu_7_value(exuBlocks_io_fuExtra_csrio_perf_perfEventsLsu_7_value),
    .io_fuExtra_csrio_perf_retiredInstr(exuBlocks_io_fuExtra_csrio_perf_retiredInstr),
    .io_fuExtra_csrio_fpu_fflags_valid(exuBlocks_io_fuExtra_csrio_fpu_fflags_valid),
    .io_fuExtra_csrio_fpu_fflags_bits(exuBlocks_io_fuExtra_csrio_fpu_fflags_bits),
    .io_fuExtra_csrio_fpu_dirty_fs(exuBlocks_io_fuExtra_csrio_fpu_dirty_fs),
    .io_fuExtra_csrio_fpu_frm(exuBlocks_io_fuExtra_csrio_fpu_frm),
    .io_fuExtra_csrio_exception_valid(exuBlocks_io_fuExtra_csrio_exception_valid),
    .io_fuExtra_csrio_exception_bits_uop_cf_pc(exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_pc),
    .io_fuExtra_csrio_exception_bits_uop_cf_exceptionVec_0(
      exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_exceptionVec_0),
    .io_fuExtra_csrio_exception_bits_uop_cf_exceptionVec_1(
      exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_exceptionVec_1),
    .io_fuExtra_csrio_exception_bits_uop_cf_exceptionVec_2(
      exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_exceptionVec_2),
    .io_fuExtra_csrio_exception_bits_uop_cf_exceptionVec_3(
      exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_exceptionVec_3),
    .io_fuExtra_csrio_exception_bits_uop_cf_exceptionVec_4(
      exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_exceptionVec_4),
    .io_fuExtra_csrio_exception_bits_uop_cf_exceptionVec_5(
      exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_exceptionVec_5),
    .io_fuExtra_csrio_exception_bits_uop_cf_exceptionVec_6(
      exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_exceptionVec_6),
    .io_fuExtra_csrio_exception_bits_uop_cf_exceptionVec_7(
      exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_exceptionVec_7),
    .io_fuExtra_csrio_exception_bits_uop_cf_exceptionVec_8(
      exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_exceptionVec_8),
    .io_fuExtra_csrio_exception_bits_uop_cf_exceptionVec_9(
      exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_exceptionVec_9),
    .io_fuExtra_csrio_exception_bits_uop_cf_exceptionVec_11(
      exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_exceptionVec_11),
    .io_fuExtra_csrio_exception_bits_uop_cf_exceptionVec_12(
      exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_exceptionVec_12),
    .io_fuExtra_csrio_exception_bits_uop_cf_exceptionVec_13(
      exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_exceptionVec_13),
    .io_fuExtra_csrio_exception_bits_uop_cf_exceptionVec_15(
      exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_exceptionVec_15),
    .io_fuExtra_csrio_exception_bits_uop_cf_trigger_frontendHit_0(
      exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_trigger_frontendHit_0),
    .io_fuExtra_csrio_exception_bits_uop_cf_trigger_frontendHit_1(
      exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_trigger_frontendHit_1),
    .io_fuExtra_csrio_exception_bits_uop_cf_trigger_frontendHit_2(
      exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_trigger_frontendHit_2),
    .io_fuExtra_csrio_exception_bits_uop_cf_trigger_frontendHit_3(
      exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_trigger_frontendHit_3),
    .io_fuExtra_csrio_exception_bits_uop_cf_trigger_backendHit_0(
      exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_trigger_backendHit_0),
    .io_fuExtra_csrio_exception_bits_uop_cf_trigger_backendHit_1(
      exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_trigger_backendHit_1),
    .io_fuExtra_csrio_exception_bits_uop_cf_trigger_backendHit_2(
      exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_trigger_backendHit_2),
    .io_fuExtra_csrio_exception_bits_uop_cf_trigger_backendHit_3(
      exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_trigger_backendHit_3),
    .io_fuExtra_csrio_exception_bits_uop_cf_trigger_backendHit_4(
      exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_trigger_backendHit_4),
    .io_fuExtra_csrio_exception_bits_uop_cf_trigger_backendHit_5(
      exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_trigger_backendHit_5),
    .io_fuExtra_csrio_exception_bits_uop_cf_crossPageIPFFix(
      exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_crossPageIPFFix),
    .io_fuExtra_csrio_exception_bits_uop_ctrl_singleStep(exuBlocks_io_fuExtra_csrio_exception_bits_uop_ctrl_singleStep),
    .io_fuExtra_csrio_exception_bits_isInterrupt(exuBlocks_io_fuExtra_csrio_exception_bits_isInterrupt),
    .io_fuExtra_csrio_isXRet(exuBlocks_io_fuExtra_csrio_isXRet),
    .io_fuExtra_csrio_trapTarget(exuBlocks_io_fuExtra_csrio_trapTarget),
    .io_fuExtra_csrio_interrupt(exuBlocks_io_fuExtra_csrio_interrupt),
    .io_fuExtra_csrio_wfi_event(exuBlocks_io_fuExtra_csrio_wfi_event),
    .io_fuExtra_csrio_memExceptionVAddr(exuBlocks_io_fuExtra_csrio_memExceptionVAddr),
    .io_fuExtra_csrio_externalInterrupt_mtip(exuBlocks_io_fuExtra_csrio_externalInterrupt_mtip),
    .io_fuExtra_csrio_externalInterrupt_msip(exuBlocks_io_fuExtra_csrio_externalInterrupt_msip),
    .io_fuExtra_csrio_externalInterrupt_meip(exuBlocks_io_fuExtra_csrio_externalInterrupt_meip),
    .io_fuExtra_csrio_externalInterrupt_seip(exuBlocks_io_fuExtra_csrio_externalInterrupt_seip),
    .io_fuExtra_csrio_externalInterrupt_debug(exuBlocks_io_fuExtra_csrio_externalInterrupt_debug),
    .io_fuExtra_csrio_tlb_satp_mode(exuBlocks_io_fuExtra_csrio_tlb_satp_mode),
    .io_fuExtra_csrio_tlb_satp_asid(exuBlocks_io_fuExtra_csrio_tlb_satp_asid),
    .io_fuExtra_csrio_tlb_satp_ppn(exuBlocks_io_fuExtra_csrio_tlb_satp_ppn),
    .io_fuExtra_csrio_tlb_satp_changed(exuBlocks_io_fuExtra_csrio_tlb_satp_changed),
    .io_fuExtra_csrio_tlb_priv_mxr(exuBlocks_io_fuExtra_csrio_tlb_priv_mxr),
    .io_fuExtra_csrio_tlb_priv_sum(exuBlocks_io_fuExtra_csrio_tlb_priv_sum),
    .io_fuExtra_csrio_tlb_priv_imode(exuBlocks_io_fuExtra_csrio_tlb_priv_imode),
    .io_fuExtra_csrio_tlb_priv_dmode(exuBlocks_io_fuExtra_csrio_tlb_priv_dmode),
    .io_fuExtra_csrio_customCtrl_icache_parity_enable(exuBlocks_io_fuExtra_csrio_customCtrl_icache_parity_enable),
    .io_fuExtra_csrio_customCtrl_lvpred_disable(exuBlocks_io_fuExtra_csrio_customCtrl_lvpred_disable),
    .io_fuExtra_csrio_customCtrl_no_spec_load(exuBlocks_io_fuExtra_csrio_customCtrl_no_spec_load),
    .io_fuExtra_csrio_customCtrl_storeset_wait_store(exuBlocks_io_fuExtra_csrio_customCtrl_storeset_wait_store),
    .io_fuExtra_csrio_customCtrl_lvpred_timeout(exuBlocks_io_fuExtra_csrio_customCtrl_lvpred_timeout),
    .io_fuExtra_csrio_customCtrl_bp_ctrl_ubtb_enable(exuBlocks_io_fuExtra_csrio_customCtrl_bp_ctrl_ubtb_enable),
    .io_fuExtra_csrio_customCtrl_bp_ctrl_btb_enable(exuBlocks_io_fuExtra_csrio_customCtrl_bp_ctrl_btb_enable),
    .io_fuExtra_csrio_customCtrl_bp_ctrl_tage_enable(exuBlocks_io_fuExtra_csrio_customCtrl_bp_ctrl_tage_enable),
    .io_fuExtra_csrio_customCtrl_bp_ctrl_sc_enable(exuBlocks_io_fuExtra_csrio_customCtrl_bp_ctrl_sc_enable),
    .io_fuExtra_csrio_customCtrl_bp_ctrl_ras_enable(exuBlocks_io_fuExtra_csrio_customCtrl_bp_ctrl_ras_enable),
    .io_fuExtra_csrio_customCtrl_sbuffer_threshold(exuBlocks_io_fuExtra_csrio_customCtrl_sbuffer_threshold),
    .io_fuExtra_csrio_customCtrl_ldld_vio_check_enable(exuBlocks_io_fuExtra_csrio_customCtrl_ldld_vio_check_enable),
    .io_fuExtra_csrio_customCtrl_cache_error_enable(exuBlocks_io_fuExtra_csrio_customCtrl_cache_error_enable),
    .io_fuExtra_csrio_customCtrl_uncache_write_outstanding_enable(
      exuBlocks_io_fuExtra_csrio_customCtrl_uncache_write_outstanding_enable),
    .io_fuExtra_csrio_customCtrl_fusion_enable(exuBlocks_io_fuExtra_csrio_customCtrl_fusion_enable),
    .io_fuExtra_csrio_customCtrl_wfi_enable(exuBlocks_io_fuExtra_csrio_customCtrl_wfi_enable),
    .io_fuExtra_csrio_customCtrl_svinval_enable(exuBlocks_io_fuExtra_csrio_customCtrl_svinval_enable),
    .io_fuExtra_csrio_customCtrl_distribute_csr_wvalid(exuBlocks_io_fuExtra_csrio_customCtrl_distribute_csr_wvalid),
    .io_fuExtra_csrio_customCtrl_distribute_csr_waddr(
      exuBlocks_io_fuExtra_csrio_customCtrl_distribute_csr_waddr),
    .io_fuExtra_csrio_customCtrl_distribute_csr_wdata(
      exuBlocks_io_fuExtra_csrio_customCtrl_distribute_csr_wdata),
    .io_fuExtra_csrio_customCtrl_singlestep(exuBlocks_io_fuExtra_csrio_customCtrl_singlestep),
    .io_fuExtra_csrio_customCtrl_frontend_trigger_t_valid(exuBlocks_io_fuExtra_csrio_customCtrl_frontend_trigger_t_valid
      ),
    .io_fuExtra_csrio_customCtrl_frontend_trigger_t_bits_addr(
      exuBlocks_io_fuExtra_csrio_customCtrl_frontend_trigger_t_bits_addr),
    .io_fuExtra_csrio_customCtrl_frontend_trigger_t_bits_tdata_matchType(
      exuBlocks_io_fuExtra_csrio_customCtrl_frontend_trigger_t_bits_tdata_matchType),
    .io_fuExtra_csrio_customCtrl_frontend_trigger_t_bits_tdata_select(
      exuBlocks_io_fuExtra_csrio_customCtrl_frontend_trigger_t_bits_tdata_select),
    .io_fuExtra_csrio_customCtrl_frontend_trigger_t_bits_tdata_timing(
      exuBlocks_io_fuExtra_csrio_customCtrl_frontend_trigger_t_bits_tdata_timing),
    .io_fuExtra_csrio_customCtrl_frontend_trigger_t_bits_tdata_chain(
      exuBlocks_io_fuExtra_csrio_customCtrl_frontend_trigger_t_bits_tdata_chain),
    .io_fuExtra_csrio_customCtrl_frontend_trigger_t_bits_tdata_tdata2(
      exuBlocks_io_fuExtra_csrio_customCtrl_frontend_trigger_t_bits_tdata_tdata2),
    .io_fuExtra_csrio_customCtrl_mem_trigger_t_valid(exuBlocks_io_fuExtra_csrio_customCtrl_mem_trigger_t_valid),
    .io_fuExtra_csrio_customCtrl_mem_trigger_t_bits_addr(exuBlocks_io_fuExtra_csrio_customCtrl_mem_trigger_t_bits_addr),
    .io_fuExtra_csrio_customCtrl_mem_trigger_t_bits_tdata_matchType(
      exuBlocks_io_fuExtra_csrio_customCtrl_mem_trigger_t_bits_tdata_matchType),
    .io_fuExtra_csrio_customCtrl_mem_trigger_t_bits_tdata_select(
      exuBlocks_io_fuExtra_csrio_customCtrl_mem_trigger_t_bits_tdata_select),
    .io_fuExtra_csrio_customCtrl_mem_trigger_t_bits_tdata_chain(
      exuBlocks_io_fuExtra_csrio_customCtrl_mem_trigger_t_bits_tdata_chain),
    .io_fuExtra_csrio_customCtrl_mem_trigger_t_bits_tdata_tdata2(
      exuBlocks_io_fuExtra_csrio_customCtrl_mem_trigger_t_bits_tdata_tdata2),
    .io_fuExtra_csrio_customCtrl_trigger_enable_0(exuBlocks_io_fuExtra_csrio_customCtrl_trigger_enable_0),
    .io_fuExtra_csrio_customCtrl_trigger_enable_1(exuBlocks_io_fuExtra_csrio_customCtrl_trigger_enable_1),
    .io_fuExtra_csrio_customCtrl_trigger_enable_2(exuBlocks_io_fuExtra_csrio_customCtrl_trigger_enable_2),
    .io_fuExtra_csrio_customCtrl_trigger_enable_3(exuBlocks_io_fuExtra_csrio_customCtrl_trigger_enable_3),
    .io_fuExtra_csrio_customCtrl_trigger_enable_4(exuBlocks_io_fuExtra_csrio_customCtrl_trigger_enable_4),
    .io_fuExtra_csrio_customCtrl_trigger_enable_5(exuBlocks_io_fuExtra_csrio_customCtrl_trigger_enable_5),
    .io_fuExtra_csrio_customCtrl_trigger_enable_6(exuBlocks_io_fuExtra_csrio_customCtrl_trigger_enable_6),
    .io_fuExtra_csrio_customCtrl_trigger_enable_7(exuBlocks_io_fuExtra_csrio_customCtrl_trigger_enable_7),
    .io_fuExtra_csrio_customCtrl_trigger_enable_8(exuBlocks_io_fuExtra_csrio_customCtrl_trigger_enable_8),
    .io_fuExtra_csrio_customCtrl_trigger_enable_9(exuBlocks_io_fuExtra_csrio_customCtrl_trigger_enable_9),
    .io_fuExtra_csrio_distributedUpdate_0_wvalid(exuBlocks_io_fuExtra_csrio_distributedUpdate_0_wvalid),
    .io_fuExtra_csrio_distributedUpdate_0_waddr(exuBlocks_io_fuExtra_csrio_distributedUpdate_0_waddr),
    .io_fuExtra_csrio_distributedUpdate_0_wdata(exuBlocks_io_fuExtra_csrio_distributedUpdate_0_wdata),
    .io_fuExtra_csrio_distributedUpdate_1_wvalid(exuBlocks_io_fuExtra_csrio_distributedUpdate_1_wvalid),
    .io_fuExtra_csrio_distributedUpdate_1_waddr(exuBlocks_io_fuExtra_csrio_distributedUpdate_1_waddr),
    .io_fuExtra_csrio_distributedUpdate_1_wdata(exuBlocks_io_fuExtra_csrio_distributedUpdate_1_wdata),
    .io_fuExtra_fenceio_sfence_valid(exuBlocks_io_fuExtra_fenceio_sfence_valid),
    .io_fuExtra_fenceio_sfence_bits_rs1(exuBlocks_io_fuExtra_fenceio_sfence_bits_rs1),
    .io_fuExtra_fenceio_sfence_bits_rs2(exuBlocks_io_fuExtra_fenceio_sfence_bits_rs2),
    .io_fuExtra_fenceio_sfence_bits_addr(exuBlocks_io_fuExtra_fenceio_sfence_bits_addr),
    .io_fuExtra_fenceio_sfence_bits_asid(exuBlocks_io_fuExtra_fenceio_sfence_bits_asid),
    .io_fuExtra_fenceio_sbuffer_flushSb(exuBlocks_io_fuExtra_fenceio_sbuffer_flushSb),
    .io_fuExtra_fenceio_sbuffer_sbIsEmpty(exuBlocks_io_fuExtra_fenceio_sbuffer_sbIsEmpty),
    .io_perf_0_value(exuBlocks_io_perf_0_value),
    .io_perf_1_value(exuBlocks_io_perf_1_value),
    .io_perf_2_value(exuBlocks_io_perf_2_value),
    .io_perf_3_value(exuBlocks_io_perf_3_value),
    .io_perf_4_value(exuBlocks_io_perf_4_value),
    .io_perf_5_value(exuBlocks_io_perf_5_value),
    .io_perf_6_value(exuBlocks_io_perf_6_value),
    .io_perf_7_value(exuBlocks_io_perf_7_value),
    .io_perf_8_value(exuBlocks_io_perf_8_value),
    .io_perf_9_value(exuBlocks_io_perf_9_value),
    .io_perf_10_value(exuBlocks_io_perf_10_value),
    .io_perf_11_value(exuBlocks_io_perf_11_value)
  );
  ExuBlock_1 exuBlocks_1 ( // @[XSCore.scala 218:17]
    .clock(exuBlocks_1_clock),
    .reset(exuBlocks_1_reset),
    .io_hartId(exuBlocks_1_io_hartId),
    .io_redirect_valid(exuBlocks_1_io_redirect_valid),
    .io_redirect_bits_robIdx_flag(exuBlocks_1_io_redirect_bits_robIdx_flag),
    .io_redirect_bits_robIdx_value(exuBlocks_1_io_redirect_bits_robIdx_value),
    .io_redirect_bits_level(exuBlocks_1_io_redirect_bits_level),
    .io_allocPregs_0_isFp(exuBlocks_1_io_allocPregs_0_isFp),
    .io_allocPregs_0_preg(exuBlocks_1_io_allocPregs_0_preg),
    .io_allocPregs_1_isFp(exuBlocks_1_io_allocPregs_1_isFp),
    .io_allocPregs_1_preg(exuBlocks_1_io_allocPregs_1_preg),
    .io_in_0_valid(exuBlocks_1_io_in_0_valid),
    .io_in_0_bits_cf_pd_isRVC(exuBlocks_1_io_in_0_bits_cf_pd_isRVC),
    .io_in_0_bits_cf_pd_brType(exuBlocks_1_io_in_0_bits_cf_pd_brType),
    .io_in_0_bits_cf_pd_isCall(exuBlocks_1_io_in_0_bits_cf_pd_isCall),
    .io_in_0_bits_cf_pd_isRet(exuBlocks_1_io_in_0_bits_cf_pd_isRet),
    .io_in_0_bits_cf_pred_taken(exuBlocks_1_io_in_0_bits_cf_pred_taken),
    .io_in_0_bits_cf_ftqPtr_flag(exuBlocks_1_io_in_0_bits_cf_ftqPtr_flag),
    .io_in_0_bits_cf_ftqPtr_value(exuBlocks_1_io_in_0_bits_cf_ftqPtr_value),
    .io_in_0_bits_cf_ftqOffset(exuBlocks_1_io_in_0_bits_cf_ftqOffset),
    .io_in_0_bits_ctrl_srcType_0(exuBlocks_1_io_in_0_bits_ctrl_srcType_0),
    .io_in_0_bits_ctrl_srcType_1(exuBlocks_1_io_in_0_bits_ctrl_srcType_1),
    .io_in_0_bits_ctrl_srcType_2(exuBlocks_1_io_in_0_bits_ctrl_srcType_2),
    .io_in_0_bits_ctrl_fuType(exuBlocks_1_io_in_0_bits_ctrl_fuType),
    .io_in_0_bits_ctrl_fuOpType(exuBlocks_1_io_in_0_bits_ctrl_fuOpType),
    .io_in_0_bits_ctrl_rfWen(exuBlocks_1_io_in_0_bits_ctrl_rfWen),
    .io_in_0_bits_ctrl_fpWen(exuBlocks_1_io_in_0_bits_ctrl_fpWen),
    .io_in_0_bits_ctrl_imm(exuBlocks_1_io_in_0_bits_ctrl_imm),
    .io_in_0_bits_ctrl_fpu_isAddSub(exuBlocks_1_io_in_0_bits_ctrl_fpu_isAddSub),
    .io_in_0_bits_ctrl_fpu_typeTagIn(exuBlocks_1_io_in_0_bits_ctrl_fpu_typeTagIn),
    .io_in_0_bits_ctrl_fpu_typeTagOut(exuBlocks_1_io_in_0_bits_ctrl_fpu_typeTagOut),
    .io_in_0_bits_ctrl_fpu_fromInt(exuBlocks_1_io_in_0_bits_ctrl_fpu_fromInt),
    .io_in_0_bits_ctrl_fpu_wflags(exuBlocks_1_io_in_0_bits_ctrl_fpu_wflags),
    .io_in_0_bits_ctrl_fpu_fpWen(exuBlocks_1_io_in_0_bits_ctrl_fpu_fpWen),
    .io_in_0_bits_ctrl_fpu_fmaCmd(exuBlocks_1_io_in_0_bits_ctrl_fpu_fmaCmd),
    .io_in_0_bits_ctrl_fpu_div(exuBlocks_1_io_in_0_bits_ctrl_fpu_div),
    .io_in_0_bits_ctrl_fpu_sqrt(exuBlocks_1_io_in_0_bits_ctrl_fpu_sqrt),
    .io_in_0_bits_ctrl_fpu_fcvt(exuBlocks_1_io_in_0_bits_ctrl_fpu_fcvt),
    .io_in_0_bits_ctrl_fpu_typ(exuBlocks_1_io_in_0_bits_ctrl_fpu_typ),
    .io_in_0_bits_ctrl_fpu_fmt(exuBlocks_1_io_in_0_bits_ctrl_fpu_fmt),
    .io_in_0_bits_ctrl_fpu_ren3(exuBlocks_1_io_in_0_bits_ctrl_fpu_ren3),
    .io_in_0_bits_ctrl_fpu_rm(exuBlocks_1_io_in_0_bits_ctrl_fpu_rm),
    .io_in_0_bits_psrc_0(exuBlocks_1_io_in_0_bits_psrc_0),
    .io_in_0_bits_psrc_1(exuBlocks_1_io_in_0_bits_psrc_1),
    .io_in_0_bits_psrc_2(exuBlocks_1_io_in_0_bits_psrc_2),
    .io_in_0_bits_pdest(exuBlocks_1_io_in_0_bits_pdest),
    .io_in_0_bits_robIdx_flag(exuBlocks_1_io_in_0_bits_robIdx_flag),
    .io_in_0_bits_robIdx_value(exuBlocks_1_io_in_0_bits_robIdx_value),
    .io_fastUopOut_0_valid(exuBlocks_1_io_fastUopOut_0_valid),
    .io_fastUopOut_0_bits_ctrl_fpWen(exuBlocks_1_io_fastUopOut_0_bits_ctrl_fpWen),
    .io_fastUopOut_0_bits_pdest(exuBlocks_1_io_fastUopOut_0_bits_pdest),
    .io_rfWriteback_6_valid(exuBlocks_1_io_rfWriteback_6_valid),
    .io_rfWriteback_6_bits_uop_ctrl_fpWen(exuBlocks_1_io_rfWriteback_6_bits_uop_ctrl_fpWen),
    .io_rfWriteback_6_bits_uop_pdest(exuBlocks_1_io_rfWriteback_6_bits_uop_pdest),
    .io_rfWriteback_6_bits_data(exuBlocks_1_io_rfWriteback_6_bits_data),
    .io_rfWriteback_7_valid(exuBlocks_1_io_rfWriteback_7_valid),
    .io_rfWriteback_7_bits_uop_ctrl_fpWen(exuBlocks_1_io_rfWriteback_7_bits_uop_ctrl_fpWen),
    .io_rfWriteback_7_bits_uop_pdest(exuBlocks_1_io_rfWriteback_7_bits_uop_pdest),
    .io_rfWriteback_7_bits_data(exuBlocks_1_io_rfWriteback_7_bits_data),
    .io_rfWriteback_8_valid(exuBlocks_1_io_rfWriteback_8_valid),
    .io_rfWriteback_8_bits_uop_ctrl_fpWen(exuBlocks_1_io_rfWriteback_8_bits_uop_ctrl_fpWen),
    .io_rfWriteback_8_bits_uop_pdest(exuBlocks_1_io_rfWriteback_8_bits_uop_pdest),
    .io_rfWriteback_8_bits_data(exuBlocks_1_io_rfWriteback_8_bits_data),
    .io_fastUopIn_5_valid(exuBlocks_1_io_fastUopIn_5_valid),
    .io_fastUopIn_5_bits_ctrl_fpWen(exuBlocks_1_io_fastUopIn_5_bits_ctrl_fpWen),
    .io_fastUopIn_5_bits_pdest(exuBlocks_1_io_fastUopIn_5_bits_pdest),
    .io_fuWriteback_0_ready(exuBlocks_1_io_fuWriteback_0_ready),
    .io_fuWriteback_0_valid(exuBlocks_1_io_fuWriteback_0_valid),
    .io_fuWriteback_0_bits_uop_cf_trigger_backendHit_0(exuBlocks_1_io_fuWriteback_0_bits_uop_cf_trigger_backendHit_0),
    .io_fuWriteback_0_bits_uop_cf_trigger_backendHit_1(exuBlocks_1_io_fuWriteback_0_bits_uop_cf_trigger_backendHit_1),
    .io_fuWriteback_0_bits_uop_cf_trigger_backendHit_2(exuBlocks_1_io_fuWriteback_0_bits_uop_cf_trigger_backendHit_2),
    .io_fuWriteback_0_bits_uop_cf_trigger_backendHit_3(exuBlocks_1_io_fuWriteback_0_bits_uop_cf_trigger_backendHit_3),
    .io_fuWriteback_0_bits_uop_cf_trigger_backendHit_4(exuBlocks_1_io_fuWriteback_0_bits_uop_cf_trigger_backendHit_4),
    .io_fuWriteback_0_bits_uop_cf_trigger_backendHit_5(exuBlocks_1_io_fuWriteback_0_bits_uop_cf_trigger_backendHit_5),
    .io_fuWriteback_0_bits_uop_ctrl_rfWen(exuBlocks_1_io_fuWriteback_0_bits_uop_ctrl_rfWen),
    .io_fuWriteback_0_bits_uop_ctrl_fpWen(exuBlocks_1_io_fuWriteback_0_bits_uop_ctrl_fpWen),
    .io_fuWriteback_0_bits_uop_pdest(exuBlocks_1_io_fuWriteback_0_bits_uop_pdest),
    .io_fuWriteback_0_bits_uop_robIdx_flag(exuBlocks_1_io_fuWriteback_0_bits_uop_robIdx_flag),
    .io_fuWriteback_0_bits_uop_robIdx_value(exuBlocks_1_io_fuWriteback_0_bits_uop_robIdx_value),
    .io_fuWriteback_0_bits_data(exuBlocks_1_io_fuWriteback_0_bits_data),
    .io_fuWriteback_0_bits_fflags(exuBlocks_1_io_fuWriteback_0_bits_fflags),
    .io_fuWriteback_1_ready(exuBlocks_1_io_fuWriteback_1_ready),
    .io_fuWriteback_1_valid(exuBlocks_1_io_fuWriteback_1_valid),
    .io_fuWriteback_1_bits_uop_ctrl_rfWen(exuBlocks_1_io_fuWriteback_1_bits_uop_ctrl_rfWen),
    .io_fuWriteback_1_bits_uop_ctrl_fpWen(exuBlocks_1_io_fuWriteback_1_bits_uop_ctrl_fpWen),
    .io_fuWriteback_1_bits_uop_pdest(exuBlocks_1_io_fuWriteback_1_bits_uop_pdest),
    .io_fuWriteback_1_bits_uop_robIdx_flag(exuBlocks_1_io_fuWriteback_1_bits_uop_robIdx_flag),
    .io_fuWriteback_1_bits_uop_robIdx_value(exuBlocks_1_io_fuWriteback_1_bits_uop_robIdx_value),
    .io_fuWriteback_1_bits_data(exuBlocks_1_io_fuWriteback_1_bits_data),
    .io_fuWriteback_1_bits_fflags(exuBlocks_1_io_fuWriteback_1_bits_fflags),
    .io_scheExtra_rsReady_0(exuBlocks_1_io_scheExtra_rsReady_0),
    .io_scheExtra_fpRfReadOut_0_addr(exuBlocks_1_io_scheExtra_fpRfReadOut_0_addr),
    .io_scheExtra_fpRfReadOut_0_data(exuBlocks_1_io_scheExtra_fpRfReadOut_0_data),
    .io_scheExtra_fpRfReadOut_1_addr(exuBlocks_1_io_scheExtra_fpRfReadOut_1_addr),
    .io_scheExtra_fpRfReadOut_1_data(exuBlocks_1_io_scheExtra_fpRfReadOut_1_data),
    .io_scheExtra_debug_fp_rat_0(exuBlocks_1_io_scheExtra_debug_fp_rat_0),
    .io_scheExtra_debug_fp_rat_1(exuBlocks_1_io_scheExtra_debug_fp_rat_1),
    .io_scheExtra_debug_fp_rat_2(exuBlocks_1_io_scheExtra_debug_fp_rat_2),
    .io_scheExtra_debug_fp_rat_3(exuBlocks_1_io_scheExtra_debug_fp_rat_3),
    .io_scheExtra_debug_fp_rat_4(exuBlocks_1_io_scheExtra_debug_fp_rat_4),
    .io_scheExtra_debug_fp_rat_5(exuBlocks_1_io_scheExtra_debug_fp_rat_5),
    .io_scheExtra_debug_fp_rat_6(exuBlocks_1_io_scheExtra_debug_fp_rat_6),
    .io_scheExtra_debug_fp_rat_7(exuBlocks_1_io_scheExtra_debug_fp_rat_7),
    .io_scheExtra_debug_fp_rat_8(exuBlocks_1_io_scheExtra_debug_fp_rat_8),
    .io_scheExtra_debug_fp_rat_9(exuBlocks_1_io_scheExtra_debug_fp_rat_9),
    .io_scheExtra_debug_fp_rat_10(exuBlocks_1_io_scheExtra_debug_fp_rat_10),
    .io_scheExtra_debug_fp_rat_11(exuBlocks_1_io_scheExtra_debug_fp_rat_11),
    .io_scheExtra_debug_fp_rat_12(exuBlocks_1_io_scheExtra_debug_fp_rat_12),
    .io_scheExtra_debug_fp_rat_13(exuBlocks_1_io_scheExtra_debug_fp_rat_13),
    .io_scheExtra_debug_fp_rat_14(exuBlocks_1_io_scheExtra_debug_fp_rat_14),
    .io_scheExtra_debug_fp_rat_15(exuBlocks_1_io_scheExtra_debug_fp_rat_15),
    .io_scheExtra_debug_fp_rat_16(exuBlocks_1_io_scheExtra_debug_fp_rat_16),
    .io_scheExtra_debug_fp_rat_17(exuBlocks_1_io_scheExtra_debug_fp_rat_17),
    .io_scheExtra_debug_fp_rat_18(exuBlocks_1_io_scheExtra_debug_fp_rat_18),
    .io_scheExtra_debug_fp_rat_19(exuBlocks_1_io_scheExtra_debug_fp_rat_19),
    .io_scheExtra_debug_fp_rat_20(exuBlocks_1_io_scheExtra_debug_fp_rat_20),
    .io_scheExtra_debug_fp_rat_21(exuBlocks_1_io_scheExtra_debug_fp_rat_21),
    .io_scheExtra_debug_fp_rat_22(exuBlocks_1_io_scheExtra_debug_fp_rat_22),
    .io_scheExtra_debug_fp_rat_23(exuBlocks_1_io_scheExtra_debug_fp_rat_23),
    .io_scheExtra_debug_fp_rat_24(exuBlocks_1_io_scheExtra_debug_fp_rat_24),
    .io_scheExtra_debug_fp_rat_25(exuBlocks_1_io_scheExtra_debug_fp_rat_25),
    .io_scheExtra_debug_fp_rat_26(exuBlocks_1_io_scheExtra_debug_fp_rat_26),
    .io_scheExtra_debug_fp_rat_27(exuBlocks_1_io_scheExtra_debug_fp_rat_27),
    .io_scheExtra_debug_fp_rat_28(exuBlocks_1_io_scheExtra_debug_fp_rat_28),
    .io_scheExtra_debug_fp_rat_29(exuBlocks_1_io_scheExtra_debug_fp_rat_29),
    .io_scheExtra_debug_fp_rat_30(exuBlocks_1_io_scheExtra_debug_fp_rat_30),
    .io_scheExtra_debug_fp_rat_31(exuBlocks_1_io_scheExtra_debug_fp_rat_31),
    .io_fuExtra_frm(exuBlocks_1_io_fuExtra_frm),
    .io_perf_0_value(exuBlocks_1_io_perf_0_value),
    .io_perf_1_value(exuBlocks_1_io_perf_1_value),
    .io_perf_2_value(exuBlocks_1_io_perf_2_value),
    .io_perf_3_value(exuBlocks_1_io_perf_3_value),
    .io_perf_4_value(exuBlocks_1_io_perf_4_value),
    .io_perf_5_value(exuBlocks_1_io_perf_5_value),
    .io_perf_6_value(exuBlocks_1_io_perf_6_value),
    .io_perf_7_value(exuBlocks_1_io_perf_7_value)
  );
  MemBlock memBlock ( // @[XSCore.scala 221:28]
    .clock(memBlock_clock),
    .reset(memBlock_reset),
    .auto_uncache_client_out_a_ready(memBlock_auto_uncache_client_out_a_ready),
    .auto_uncache_client_out_a_valid(memBlock_auto_uncache_client_out_a_valid),
    .auto_uncache_client_out_a_bits_opcode(memBlock_auto_uncache_client_out_a_bits_opcode),
    .auto_uncache_client_out_a_bits_size(memBlock_auto_uncache_client_out_a_bits_size),
    .auto_uncache_client_out_a_bits_source(memBlock_auto_uncache_client_out_a_bits_source),
    .auto_uncache_client_out_a_bits_address(memBlock_auto_uncache_client_out_a_bits_address),
    .auto_uncache_client_out_a_bits_mask(memBlock_auto_uncache_client_out_a_bits_mask),
    .auto_uncache_client_out_a_bits_data(memBlock_auto_uncache_client_out_a_bits_data),
    .auto_uncache_client_out_d_ready(memBlock_auto_uncache_client_out_d_ready),
    .auto_uncache_client_out_d_valid(memBlock_auto_uncache_client_out_d_valid),
    .auto_uncache_client_out_d_bits_opcode(memBlock_auto_uncache_client_out_d_bits_opcode),
    .auto_uncache_client_out_d_bits_data(memBlock_auto_uncache_client_out_d_bits_data),
    .auto_dcache_client_out_a_ready(memBlock_auto_dcache_client_out_a_ready),
    .auto_dcache_client_out_a_valid(memBlock_auto_dcache_client_out_a_valid),
    .auto_dcache_client_out_a_bits_opcode(memBlock_auto_dcache_client_out_a_bits_opcode),
    .auto_dcache_client_out_a_bits_param(memBlock_auto_dcache_client_out_a_bits_param),
    .auto_dcache_client_out_a_bits_size(memBlock_auto_dcache_client_out_a_bits_size),
    .auto_dcache_client_out_a_bits_source(memBlock_auto_dcache_client_out_a_bits_source),
    .auto_dcache_client_out_a_bits_address(memBlock_auto_dcache_client_out_a_bits_address),
    .auto_dcache_client_out_a_bits_mask(memBlock_auto_dcache_client_out_a_bits_mask),
    .auto_dcache_client_out_bready(memBlock_auto_dcache_client_out_bready),
    .auto_dcache_client_out_bvalid(memBlock_auto_dcache_client_out_bvalid),
    .auto_dcache_client_out_bparam(memBlock_auto_dcache_client_out_bparam),
    .auto_dcache_client_out_baddress(memBlock_auto_dcache_client_out_baddress),
    .auto_dcache_client_out_bdata(memBlock_auto_dcache_client_out_bdata),
    .auto_dcache_client_out_c_ready(memBlock_auto_dcache_client_out_c_ready),
    .auto_dcache_client_out_c_valid(memBlock_auto_dcache_client_out_c_valid),
    .auto_dcache_client_out_c_bits_opcode(memBlock_auto_dcache_client_out_c_bits_opcode),
    .auto_dcache_client_out_c_bits_param(memBlock_auto_dcache_client_out_c_bits_param),
    .auto_dcache_client_out_c_bits_size(memBlock_auto_dcache_client_out_c_bits_size),
    .auto_dcache_client_out_c_bits_source(memBlock_auto_dcache_client_out_c_bits_source),
    .auto_dcache_client_out_c_bits_address(memBlock_auto_dcache_client_out_c_bits_address),
    .auto_dcache_client_out_c_bits_echo_blockisdirty(memBlock_auto_dcache_client_out_c_bits_echo_blockisdirty),
    .auto_dcache_client_out_c_bits_data(memBlock_auto_dcache_client_out_c_bits_data),
    .auto_dcache_client_out_d_ready(memBlock_auto_dcache_client_out_d_ready),
    .auto_dcache_client_out_d_valid(memBlock_auto_dcache_client_out_d_valid),
    .auto_dcache_client_out_d_bits_opcode(memBlock_auto_dcache_client_out_d_bits_opcode),
    .auto_dcache_client_out_d_bits_param(memBlock_auto_dcache_client_out_d_bits_param),
    .auto_dcache_client_out_d_bits_size(memBlock_auto_dcache_client_out_d_bits_size),
    .auto_dcache_client_out_d_bits_source(memBlock_auto_dcache_client_out_d_bits_source),
    .auto_dcache_client_out_d_bits_sink(memBlock_auto_dcache_client_out_d_bits_sink),
    .auto_dcache_client_out_d_bits_denied(memBlock_auto_dcache_client_out_d_bits_denied),
    .auto_dcache_client_out_d_bits_echo_blockisdirty(memBlock_auto_dcache_client_out_d_bits_echo_blockisdirty),
    .auto_dcache_client_out_d_bits_data(memBlock_auto_dcache_client_out_d_bits_data),
    .auto_dcache_client_out_d_bits_corrupt(memBlock_auto_dcache_client_out_d_bits_corrupt),
    .auto_dcache_client_out_e_ready(memBlock_auto_dcache_client_out_e_ready),
    .auto_dcache_client_out_e_valid(memBlock_auto_dcache_client_out_e_valid),
    .auto_dcache_client_out_e_bits_sink(memBlock_auto_dcache_client_out_e_bits_sink),
    .io_hartId(memBlock_io_hartId),
    .io_redirect_valid(memBlock_io_redirect_valid),
    .io_redirect_bits_robIdx_flag(memBlock_io_redirect_bits_robIdx_flag),
    .io_redirect_bits_robIdx_value(memBlock_io_redirect_bits_robIdx_value),
    .io_redirect_bits_level(memBlock_io_redirect_bits_level),
    .io_issue_0_ready(memBlock_io_issue_0_ready),
    .io_issue_0_valid(memBlock_io_issue_0_valid),
    .io_issue_0_bits_uop_cf_foldpc(memBlock_io_issue_0_bits_uop_cf_foldpc),
    .io_issue_0_bits_uop_cf_trigger_backendEn_1(memBlock_io_issue_0_bits_uop_cf_trigger_backendEn_1),
    .io_issue_0_bits_uop_cf_waitForRobIdx_flag(memBlock_io_issue_0_bits_uop_cf_waitForRobIdx_flag),
    .io_issue_0_bits_uop_cf_waitForRobIdx_value(memBlock_io_issue_0_bits_uop_cf_waitForRobIdx_value),
    .io_issue_0_bits_uop_cf_loadWaitBit(memBlock_io_issue_0_bits_uop_cf_loadWaitBit),
    .io_issue_0_bits_uop_cf_loadWaitStrict(memBlock_io_issue_0_bits_uop_cf_loadWaitStrict),
    .io_issue_0_bits_uop_cf_ftqPtr_flag(memBlock_io_issue_0_bits_uop_cf_ftqPtr_flag),
    .io_issue_0_bits_uop_cf_ftqPtr_value(memBlock_io_issue_0_bits_uop_cf_ftqPtr_value),
    .io_issue_0_bits_uop_cf_ftqOffset(memBlock_io_issue_0_bits_uop_cf_ftqOffset),
    .io_issue_0_bits_uop_ctrl_fuType(memBlock_io_issue_0_bits_uop_ctrl_fuType),
    .io_issue_0_bits_uop_ctrl_fuOpType(memBlock_io_issue_0_bits_uop_ctrl_fuOpType),
    .io_issue_0_bits_uop_ctrl_rfWen(memBlock_io_issue_0_bits_uop_ctrl_rfWen),
    .io_issue_0_bits_uop_ctrl_fpWen(memBlock_io_issue_0_bits_uop_ctrl_fpWen),
    .io_issue_0_bits_uop_ctrl_imm(memBlock_io_issue_0_bits_uop_ctrl_imm),
    .io_issue_0_bits_uop_pdest(memBlock_io_issue_0_bits_uop_pdest),
    .io_issue_0_bits_uop_robIdx_flag(memBlock_io_issue_0_bits_uop_robIdx_flag),
    .io_issue_0_bits_uop_robIdx_value(memBlock_io_issue_0_bits_uop_robIdx_value),
    .io_issue_0_bits_uop_lqIdx_flag(memBlock_io_issue_0_bits_uop_lqIdx_flag),
    .io_issue_0_bits_uop_lqIdx_value(memBlock_io_issue_0_bits_uop_lqIdx_value),
    .io_issue_0_bits_uop_sqIdx_flag(memBlock_io_issue_0_bits_uop_sqIdx_flag),
    .io_issue_0_bits_uop_sqIdx_value(memBlock_io_issue_0_bits_uop_sqIdx_value),
    .io_issue_0_bits_src_0(memBlock_io_issue_0_bits_src_0),
    .io_issue_1_ready(memBlock_io_issue_1_ready),
    .io_issue_1_valid(memBlock_io_issue_1_valid),
    .io_issue_1_bits_uop_cf_foldpc(memBlock_io_issue_1_bits_uop_cf_foldpc),
    .io_issue_1_bits_uop_cf_trigger_backendEn_1(memBlock_io_issue_1_bits_uop_cf_trigger_backendEn_1),
    .io_issue_1_bits_uop_cf_waitForRobIdx_flag(memBlock_io_issue_1_bits_uop_cf_waitForRobIdx_flag),
    .io_issue_1_bits_uop_cf_waitForRobIdx_value(memBlock_io_issue_1_bits_uop_cf_waitForRobIdx_value),
    .io_issue_1_bits_uop_cf_loadWaitBit(memBlock_io_issue_1_bits_uop_cf_loadWaitBit),
    .io_issue_1_bits_uop_cf_loadWaitStrict(memBlock_io_issue_1_bits_uop_cf_loadWaitStrict),
    .io_issue_1_bits_uop_cf_ftqPtr_flag(memBlock_io_issue_1_bits_uop_cf_ftqPtr_flag),
    .io_issue_1_bits_uop_cf_ftqPtr_value(memBlock_io_issue_1_bits_uop_cf_ftqPtr_value),
    .io_issue_1_bits_uop_cf_ftqOffset(memBlock_io_issue_1_bits_uop_cf_ftqOffset),
    .io_issue_1_bits_uop_ctrl_fuType(memBlock_io_issue_1_bits_uop_ctrl_fuType),
    .io_issue_1_bits_uop_ctrl_fuOpType(memBlock_io_issue_1_bits_uop_ctrl_fuOpType),
    .io_issue_1_bits_uop_ctrl_rfWen(memBlock_io_issue_1_bits_uop_ctrl_rfWen),
    .io_issue_1_bits_uop_ctrl_fpWen(memBlock_io_issue_1_bits_uop_ctrl_fpWen),
    .io_issue_1_bits_uop_ctrl_imm(memBlock_io_issue_1_bits_uop_ctrl_imm),
    .io_issue_1_bits_uop_pdest(memBlock_io_issue_1_bits_uop_pdest),
    .io_issue_1_bits_uop_robIdx_flag(memBlock_io_issue_1_bits_uop_robIdx_flag),
    .io_issue_1_bits_uop_robIdx_value(memBlock_io_issue_1_bits_uop_robIdx_value),
    .io_issue_1_bits_uop_lqIdx_flag(memBlock_io_issue_1_bits_uop_lqIdx_flag),
    .io_issue_1_bits_uop_lqIdx_value(memBlock_io_issue_1_bits_uop_lqIdx_value),
    .io_issue_1_bits_uop_sqIdx_flag(memBlock_io_issue_1_bits_uop_sqIdx_flag),
    .io_issue_1_bits_uop_sqIdx_value(memBlock_io_issue_1_bits_uop_sqIdx_value),
    .io_issue_1_bits_src_0(memBlock_io_issue_1_bits_src_0),
    .io_issue_2_ready(memBlock_io_issue_2_ready),
    .io_issue_2_valid(memBlock_io_issue_2_valid),
    .io_issue_2_bits_uop_cf_trigger_backendEn_0(memBlock_io_issue_2_bits_uop_cf_trigger_backendEn_0),
    .io_issue_2_bits_uop_cf_trigger_backendEn_1(memBlock_io_issue_2_bits_uop_cf_trigger_backendEn_1),
    .io_issue_2_bits_uop_cf_storeSetHit(memBlock_io_issue_2_bits_uop_cf_storeSetHit),
    .io_issue_2_bits_uop_cf_ssid(memBlock_io_issue_2_bits_uop_cf_ssid),
    .io_issue_2_bits_uop_cf_ftqPtr_value(memBlock_io_issue_2_bits_uop_cf_ftqPtr_value),
    .io_issue_2_bits_uop_cf_ftqOffset(memBlock_io_issue_2_bits_uop_cf_ftqOffset),
    .io_issue_2_bits_uop_ctrl_fuType(memBlock_io_issue_2_bits_uop_ctrl_fuType),
    .io_issue_2_bits_uop_ctrl_fuOpType(memBlock_io_issue_2_bits_uop_ctrl_fuOpType),
    .io_issue_2_bits_uop_ctrl_rfWen(memBlock_io_issue_2_bits_uop_ctrl_rfWen),
    .io_issue_2_bits_uop_ctrl_fpWen(memBlock_io_issue_2_bits_uop_ctrl_fpWen),
    .io_issue_2_bits_uop_ctrl_imm(memBlock_io_issue_2_bits_uop_ctrl_imm),
    .io_issue_2_bits_uop_pdest(memBlock_io_issue_2_bits_uop_pdest),
    .io_issue_2_bits_uop_robIdx_flag(memBlock_io_issue_2_bits_uop_robIdx_flag),
    .io_issue_2_bits_uop_robIdx_value(memBlock_io_issue_2_bits_uop_robIdx_value),
    .io_issue_2_bits_uop_sqIdx_flag(memBlock_io_issue_2_bits_uop_sqIdx_flag),
    .io_issue_2_bits_uop_sqIdx_value(memBlock_io_issue_2_bits_uop_sqIdx_value),
    .io_issue_2_bits_src_0(memBlock_io_issue_2_bits_src_0),
    .io_issue_3_ready(memBlock_io_issue_3_ready),
    .io_issue_3_valid(memBlock_io_issue_3_valid),
    .io_issue_3_bits_uop_cf_trigger_backendEn_0(memBlock_io_issue_3_bits_uop_cf_trigger_backendEn_0),
    .io_issue_3_bits_uop_cf_trigger_backendEn_1(memBlock_io_issue_3_bits_uop_cf_trigger_backendEn_1),
    .io_issue_3_bits_uop_cf_storeSetHit(memBlock_io_issue_3_bits_uop_cf_storeSetHit),
    .io_issue_3_bits_uop_cf_ssid(memBlock_io_issue_3_bits_uop_cf_ssid),
    .io_issue_3_bits_uop_cf_ftqPtr_value(memBlock_io_issue_3_bits_uop_cf_ftqPtr_value),
    .io_issue_3_bits_uop_cf_ftqOffset(memBlock_io_issue_3_bits_uop_cf_ftqOffset),
    .io_issue_3_bits_uop_ctrl_fuType(memBlock_io_issue_3_bits_uop_ctrl_fuType),
    .io_issue_3_bits_uop_ctrl_fuOpType(memBlock_io_issue_3_bits_uop_ctrl_fuOpType),
    .io_issue_3_bits_uop_ctrl_rfWen(memBlock_io_issue_3_bits_uop_ctrl_rfWen),
    .io_issue_3_bits_uop_ctrl_fpWen(memBlock_io_issue_3_bits_uop_ctrl_fpWen),
    .io_issue_3_bits_uop_ctrl_imm(memBlock_io_issue_3_bits_uop_ctrl_imm),
    .io_issue_3_bits_uop_pdest(memBlock_io_issue_3_bits_uop_pdest),
    .io_issue_3_bits_uop_robIdx_flag(memBlock_io_issue_3_bits_uop_robIdx_flag),
    .io_issue_3_bits_uop_robIdx_value(memBlock_io_issue_3_bits_uop_robIdx_value),
    .io_issue_3_bits_uop_sqIdx_flag(memBlock_io_issue_3_bits_uop_sqIdx_flag),
    .io_issue_3_bits_uop_sqIdx_value(memBlock_io_issue_3_bits_uop_sqIdx_value),
    .io_issue_3_bits_src_0(memBlock_io_issue_3_bits_src_0),
    .io_issue_4_ready(memBlock_io_issue_4_ready),
    .io_issue_4_valid(memBlock_io_issue_4_valid),
    .io_issue_4_bits_uop_ctrl_fuType(memBlock_io_issue_4_bits_uop_ctrl_fuType),
    .io_issue_4_bits_uop_ctrl_fuOpType(memBlock_io_issue_4_bits_uop_ctrl_fuOpType),
    .io_issue_4_bits_uop_robIdx_flag(memBlock_io_issue_4_bits_uop_robIdx_flag),
    .io_issue_4_bits_uop_robIdx_value(memBlock_io_issue_4_bits_uop_robIdx_value),
    .io_issue_4_bits_uop_sqIdx_flag(memBlock_io_issue_4_bits_uop_sqIdx_flag),
    .io_issue_4_bits_uop_sqIdx_value(memBlock_io_issue_4_bits_uop_sqIdx_value),
    .io_issue_4_bits_src_0(memBlock_io_issue_4_bits_src_0),
    .io_issue_5_ready(memBlock_io_issue_5_ready),
    .io_issue_5_valid(memBlock_io_issue_5_valid),
    .io_issue_5_bits_uop_ctrl_fuType(memBlock_io_issue_5_bits_uop_ctrl_fuType),
    .io_issue_5_bits_uop_ctrl_fuOpType(memBlock_io_issue_5_bits_uop_ctrl_fuOpType),
    .io_issue_5_bits_uop_robIdx_flag(memBlock_io_issue_5_bits_uop_robIdx_flag),
    .io_issue_5_bits_uop_robIdx_value(memBlock_io_issue_5_bits_uop_robIdx_value),
    .io_issue_5_bits_uop_sqIdx_flag(memBlock_io_issue_5_bits_uop_sqIdx_flag),
    .io_issue_5_bits_uop_sqIdx_value(memBlock_io_issue_5_bits_uop_sqIdx_value),
    .io_issue_5_bits_src_0(memBlock_io_issue_5_bits_src_0),
    .io_loadFastMatch_0(memBlock_io_loadFastMatch_0),
    .io_loadFastMatch_1(memBlock_io_loadFastMatch_1),
    .io_loadFastImm_0(memBlock_io_loadFastImm_0),
    .io_loadFastImm_1(memBlock_io_loadFastImm_1),
    .io_rsfeedback_0_feedbackSlow_valid(memBlock_io_rsfeedback_0_feedbackSlow_valid),
    .io_rsfeedback_0_feedbackSlow_bits_rsIdx(memBlock_io_rsfeedback_0_feedbackSlow_bits_rsIdx),
    .io_rsfeedback_0_feedbackSlow_bits_hit(memBlock_io_rsfeedback_0_feedbackSlow_bits_hit),
    .io_rsfeedback_0_rsIdx(memBlock_io_rsfeedback_0_rsIdx),
    .io_rsfeedback_1_feedbackSlow_valid(memBlock_io_rsfeedback_1_feedbackSlow_valid),
    .io_rsfeedback_1_feedbackSlow_bits_rsIdx(memBlock_io_rsfeedback_1_feedbackSlow_bits_rsIdx),
    .io_rsfeedback_1_feedbackSlow_bits_hit(memBlock_io_rsfeedback_1_feedbackSlow_bits_hit),
    .io_rsfeedback_1_rsIdx(memBlock_io_rsfeedback_1_rsIdx),
    .io_writeback_0_ready(memBlock_io_writeback_0_ready),
    .io_writeback_0_valid(memBlock_io_writeback_0_valid),
    .io_writeback_0_bits_uop_cf_exceptionVec_4(memBlock_io_writeback_0_bits_uop_cf_exceptionVec_4),
    .io_writeback_0_bits_uop_cf_exceptionVec_5(memBlock_io_writeback_0_bits_uop_cf_exceptionVec_5),
    .io_writeback_0_bits_uop_cf_exceptionVec_13(memBlock_io_writeback_0_bits_uop_cf_exceptionVec_13),
    .io_writeback_0_bits_uop_cf_trigger_backendEn_1(memBlock_io_writeback_0_bits_uop_cf_trigger_backendEn_1),
    .io_writeback_0_bits_uop_cf_trigger_backendHit_0(memBlock_io_writeback_0_bits_uop_cf_trigger_backendHit_0),
    .io_writeback_0_bits_uop_cf_trigger_backendHit_1(memBlock_io_writeback_0_bits_uop_cf_trigger_backendHit_1),
    .io_writeback_0_bits_uop_cf_trigger_backendHit_2(memBlock_io_writeback_0_bits_uop_cf_trigger_backendHit_2),
    .io_writeback_0_bits_uop_cf_trigger_backendHit_3(memBlock_io_writeback_0_bits_uop_cf_trigger_backendHit_3),
    .io_writeback_0_bits_uop_cf_trigger_backendHit_4(memBlock_io_writeback_0_bits_uop_cf_trigger_backendHit_4),
    .io_writeback_0_bits_uop_cf_trigger_backendHit_5(memBlock_io_writeback_0_bits_uop_cf_trigger_backendHit_5),
    .io_writeback_0_bits_uop_ctrl_rfWen(memBlock_io_writeback_0_bits_uop_ctrl_rfWen),
    .io_writeback_0_bits_uop_ctrl_fpWen(memBlock_io_writeback_0_bits_uop_ctrl_fpWen),
    .io_writeback_0_bits_uop_ctrl_flushPipe(memBlock_io_writeback_0_bits_uop_ctrl_flushPipe),
    .io_writeback_0_bits_uop_ctrl_replayInst(memBlock_io_writeback_0_bits_uop_ctrl_replayInst),
    .io_writeback_0_bits_uop_pdest(memBlock_io_writeback_0_bits_uop_pdest),
    .io_writeback_0_bits_uop_robIdx_flag(memBlock_io_writeback_0_bits_uop_robIdx_flag),
    .io_writeback_0_bits_uop_robIdx_value(memBlock_io_writeback_0_bits_uop_robIdx_value),
    .io_writeback_0_bits_data(memBlock_io_writeback_0_bits_data),
    .io_writeback_0_bits_debug_isMMIO(memBlock_io_writeback_0_bits_debug_isMMIO),
    .io_writeback_1_ready(memBlock_io_writeback_1_ready),
    .io_writeback_1_valid(memBlock_io_writeback_1_valid),
    .io_writeback_1_bits_uop_cf_exceptionVec_4(memBlock_io_writeback_1_bits_uop_cf_exceptionVec_4),
    .io_writeback_1_bits_uop_cf_exceptionVec_5(memBlock_io_writeback_1_bits_uop_cf_exceptionVec_5),
    .io_writeback_1_bits_uop_cf_exceptionVec_13(memBlock_io_writeback_1_bits_uop_cf_exceptionVec_13),
    .io_writeback_1_bits_uop_cf_trigger_backendEn_1(memBlock_io_writeback_1_bits_uop_cf_trigger_backendEn_1),
    .io_writeback_1_bits_uop_cf_trigger_backendHit_0(memBlock_io_writeback_1_bits_uop_cf_trigger_backendHit_0),
    .io_writeback_1_bits_uop_cf_trigger_backendHit_1(memBlock_io_writeback_1_bits_uop_cf_trigger_backendHit_1),
    .io_writeback_1_bits_uop_cf_trigger_backendHit_2(memBlock_io_writeback_1_bits_uop_cf_trigger_backendHit_2),
    .io_writeback_1_bits_uop_cf_trigger_backendHit_3(memBlock_io_writeback_1_bits_uop_cf_trigger_backendHit_3),
    .io_writeback_1_bits_uop_cf_trigger_backendHit_4(memBlock_io_writeback_1_bits_uop_cf_trigger_backendHit_4),
    .io_writeback_1_bits_uop_cf_trigger_backendHit_5(memBlock_io_writeback_1_bits_uop_cf_trigger_backendHit_5),
    .io_writeback_1_bits_uop_ctrl_rfWen(memBlock_io_writeback_1_bits_uop_ctrl_rfWen),
    .io_writeback_1_bits_uop_ctrl_fpWen(memBlock_io_writeback_1_bits_uop_ctrl_fpWen),
    .io_writeback_1_bits_uop_ctrl_flushPipe(memBlock_io_writeback_1_bits_uop_ctrl_flushPipe),
    .io_writeback_1_bits_uop_ctrl_replayInst(memBlock_io_writeback_1_bits_uop_ctrl_replayInst),
    .io_writeback_1_bits_uop_pdest(memBlock_io_writeback_1_bits_uop_pdest),
    .io_writeback_1_bits_uop_robIdx_flag(memBlock_io_writeback_1_bits_uop_robIdx_flag),
    .io_writeback_1_bits_uop_robIdx_value(memBlock_io_writeback_1_bits_uop_robIdx_value),
    .io_writeback_1_bits_data(memBlock_io_writeback_1_bits_data),
    .io_writeback_1_bits_debug_isMMIO(memBlock_io_writeback_1_bits_debug_isMMIO),
    .io_writeback_2_ready(memBlock_io_writeback_2_ready),
    .io_writeback_2_valid(memBlock_io_writeback_2_valid),
    .io_writeback_2_bits_uop_cf_exceptionVec_4(memBlock_io_writeback_2_bits_uop_cf_exceptionVec_4),
    .io_writeback_2_bits_uop_cf_exceptionVec_5(memBlock_io_writeback_2_bits_uop_cf_exceptionVec_5),
    .io_writeback_2_bits_uop_cf_exceptionVec_6(memBlock_io_writeback_2_bits_uop_cf_exceptionVec_6),
    .io_writeback_2_bits_uop_cf_exceptionVec_7(memBlock_io_writeback_2_bits_uop_cf_exceptionVec_7),
    .io_writeback_2_bits_uop_cf_exceptionVec_13(memBlock_io_writeback_2_bits_uop_cf_exceptionVec_13),
    .io_writeback_2_bits_uop_cf_exceptionVec_15(memBlock_io_writeback_2_bits_uop_cf_exceptionVec_15),
    .io_writeback_2_bits_uop_cf_trigger_backendEn_0(memBlock_io_writeback_2_bits_uop_cf_trigger_backendEn_0),
    .io_writeback_2_bits_uop_cf_trigger_backendHit_0(memBlock_io_writeback_2_bits_uop_cf_trigger_backendHit_0),
    .io_writeback_2_bits_uop_cf_trigger_backendHit_1(memBlock_io_writeback_2_bits_uop_cf_trigger_backendHit_1),
    .io_writeback_2_bits_uop_cf_trigger_backendHit_2(memBlock_io_writeback_2_bits_uop_cf_trigger_backendHit_2),
    .io_writeback_2_bits_uop_cf_trigger_backendHit_3(memBlock_io_writeback_2_bits_uop_cf_trigger_backendHit_3),
    .io_writeback_2_bits_uop_cf_trigger_backendHit_4(memBlock_io_writeback_2_bits_uop_cf_trigger_backendHit_4),
    .io_writeback_2_bits_uop_cf_trigger_backendHit_5(memBlock_io_writeback_2_bits_uop_cf_trigger_backendHit_5),
    .io_writeback_2_bits_uop_robIdx_flag(memBlock_io_writeback_2_bits_uop_robIdx_flag),
    .io_writeback_2_bits_uop_robIdx_value(memBlock_io_writeback_2_bits_uop_robIdx_value),
    .io_writeback_2_bits_debug_isMMIO(memBlock_io_writeback_2_bits_debug_isMMIO),
    .io_writeback_2_bits_debug_vaddr(memBlock_io_writeback_2_bits_debug_vaddr),
    .io_writeback_3_ready(memBlock_io_writeback_3_ready),
    .io_writeback_3_valid(memBlock_io_writeback_3_valid),
    .io_writeback_3_bits_uop_cf_exceptionVec_6(memBlock_io_writeback_3_bits_uop_cf_exceptionVec_6),
    .io_writeback_3_bits_uop_cf_exceptionVec_7(memBlock_io_writeback_3_bits_uop_cf_exceptionVec_7),
    .io_writeback_3_bits_uop_cf_exceptionVec_15(memBlock_io_writeback_3_bits_uop_cf_exceptionVec_15),
    .io_writeback_3_bits_uop_cf_trigger_backendEn_0(memBlock_io_writeback_3_bits_uop_cf_trigger_backendEn_0),
    .io_writeback_3_bits_uop_cf_trigger_backendHit_0(memBlock_io_writeback_3_bits_uop_cf_trigger_backendHit_0),
    .io_writeback_3_bits_uop_cf_trigger_backendHit_1(memBlock_io_writeback_3_bits_uop_cf_trigger_backendHit_1),
    .io_writeback_3_bits_uop_cf_trigger_backendHit_4(memBlock_io_writeback_3_bits_uop_cf_trigger_backendHit_4),
    .io_writeback_3_bits_uop_robIdx_flag(memBlock_io_writeback_3_bits_uop_robIdx_flag),
    .io_writeback_3_bits_uop_robIdx_value(memBlock_io_writeback_3_bits_uop_robIdx_value),
    .io_writeback_3_bits_debug_isMMIO(memBlock_io_writeback_3_bits_debug_isMMIO),
    .io_writeback_3_bits_debug_vaddr(memBlock_io_writeback_3_bits_debug_vaddr),
    .io_writeback_4_valid(memBlock_io_writeback_4_valid),
    .io_writeback_4_bits_uop_robIdx_flag(memBlock_io_writeback_4_bits_uop_robIdx_flag),
    .io_writeback_4_bits_uop_robIdx_value(memBlock_io_writeback_4_bits_uop_robIdx_value),
    .io_writeback_5_valid(memBlock_io_writeback_5_valid),
    .io_writeback_5_bits_uop_robIdx_flag(memBlock_io_writeback_5_bits_uop_robIdx_flag),
    .io_writeback_5_bits_uop_robIdx_value(memBlock_io_writeback_5_bits_uop_robIdx_value),
    .io_stIn_0_valid(memBlock_io_stIn_0_valid),
    .io_stIn_0_bits_uop_cf_storeSetHit(memBlock_io_stIn_0_bits_uop_cf_storeSetHit),
    .io_stIn_0_bits_uop_cf_ssid(memBlock_io_stIn_0_bits_uop_cf_ssid),
    .io_stIn_0_bits_uop_robIdx_value(memBlock_io_stIn_0_bits_uop_robIdx_value),
    .io_stIn_1_valid(memBlock_io_stIn_1_valid),
    .io_stIn_1_bits_uop_cf_storeSetHit(memBlock_io_stIn_1_bits_uop_cf_storeSetHit),
    .io_stIn_1_bits_uop_cf_ssid(memBlock_io_stIn_1_bits_uop_cf_ssid),
    .io_stIn_1_bits_uop_robIdx_value(memBlock_io_stIn_1_bits_uop_robIdx_value),
    .io_memoryViolation_valid(memBlock_io_memoryViolation_valid),
    .io_memoryViolation_bits_robIdx_flag(memBlock_io_memoryViolation_bits_robIdx_flag),
    .io_memoryViolation_bits_robIdx_value(memBlock_io_memoryViolation_bits_robIdx_value),
    .io_memoryViolation_bits_ftqIdx_flag(memBlock_io_memoryViolation_bits_ftqIdx_flag),
    .io_memoryViolation_bits_ftqIdx_value(memBlock_io_memoryViolation_bits_ftqIdx_value),
    .io_memoryViolation_bits_ftqOffset(memBlock_io_memoryViolation_bits_ftqOffset),
    .io_memoryViolation_bits_stFtqIdx_value(memBlock_io_memoryViolation_bits_stFtqIdx_value),
    .io_memoryViolation_bits_stFtqOffset(memBlock_io_memoryViolation_bits_stFtqOffset),
    .io_ptw_req_0_valid(memBlock_io_ptw_req_0_valid),
    .io_ptw_req_0_bits_vpn(memBlock_io_ptw_req_0_bits_vpn),
    .io_ptw_req_1_valid(memBlock_io_ptw_req_1_valid),
    .io_ptw_req_1_bits_vpn(memBlock_io_ptw_req_1_bits_vpn),
    .io_ptw_req_2_valid(memBlock_io_ptw_req_2_valid),
    .io_ptw_req_2_bits_vpn(memBlock_io_ptw_req_2_bits_vpn),
    .io_ptw_req_3_valid(memBlock_io_ptw_req_3_valid),
    .io_ptw_req_3_bits_vpn(memBlock_io_ptw_req_3_bits_vpn),
    .io_ptw_resp_valid(memBlock_io_ptw_resp_valid),
    .io_ptw_resp_bits_data_entry_tag(memBlock_io_ptw_resp_bits_data_entry_tag),
    .io_ptw_resp_bits_data_entry_asid(memBlock_io_ptw_resp_bits_data_entry_asid),
    .io_ptw_resp_bits_data_entry_ppn(memBlock_io_ptw_resp_bits_data_entry_ppn),
    .io_ptw_resp_bits_data_entry_perm_d(memBlock_io_ptw_resp_bits_data_entry_perm_d),
    .io_ptw_resp_bits_data_entry_perm_a(memBlock_io_ptw_resp_bits_data_entry_perm_a),
    .io_ptw_resp_bits_data_entry_perm_g(memBlock_io_ptw_resp_bits_data_entry_perm_g),
    .io_ptw_resp_bits_data_entry_perm_u(memBlock_io_ptw_resp_bits_data_entry_perm_u),
    .io_ptw_resp_bits_data_entry_perm_x(memBlock_io_ptw_resp_bits_data_entry_perm_x),
    .io_ptw_resp_bits_data_entry_perm_w(memBlock_io_ptw_resp_bits_data_entry_perm_w),
    .io_ptw_resp_bits_data_entry_perm_r(memBlock_io_ptw_resp_bits_data_entry_perm_r),
    .io_ptw_resp_bits_data_entry_level(memBlock_io_ptw_resp_bits_data_entry_level),
    .io_ptw_resp_bits_data_pf(memBlock_io_ptw_resp_bits_data_pf),
    .io_ptw_resp_bits_data_af(memBlock_io_ptw_resp_bits_data_af),
    .io_ptw_resp_bits_vector_0(memBlock_io_ptw_resp_bits_vector_0),
    .io_ptw_resp_bits_vector_1(memBlock_io_ptw_resp_bits_vector_1),
    .io_ptw_resp_bits_vector_2(memBlock_io_ptw_resp_bits_vector_2),
    .io_ptw_resp_bits_vector_3(memBlock_io_ptw_resp_bits_vector_3),
    .io_ptw_resp_bits_vector_4(memBlock_io_ptw_resp_bits_vector_4),
    .io_sfence_valid(memBlock_io_sfence_valid),
    .io_sfence_bits_rs1(memBlock_io_sfence_bits_rs1),
    .io_sfence_bits_rs2(memBlock_io_sfence_bits_rs2),
    .io_sfence_bits_addr(memBlock_io_sfence_bits_addr),
    .io_sfence_bits_asid(memBlock_io_sfence_bits_asid),
    .io_tlbCsr_satp_mode(memBlock_io_tlbCsr_satp_mode),
    .io_tlbCsr_satp_asid(memBlock_io_tlbCsr_satp_asid),
    .io_tlbCsr_satp_changed(memBlock_io_tlbCsr_satp_changed),
    .io_tlbCsr_priv_mxr(memBlock_io_tlbCsr_priv_mxr),
    .io_tlbCsr_priv_sum(memBlock_io_tlbCsr_priv_sum),
    .io_tlbCsr_priv_dmode(memBlock_io_tlbCsr_priv_dmode),
    .io_fenceToSbuffer_flushSb(memBlock_io_fenceToSbuffer_flushSb),
    .io_fenceToSbuffer_sbIsEmpty(memBlock_io_fenceToSbuffer_sbIsEmpty),
    .io_enqLsq_needAlloc_0(memBlock_io_enqLsq_needAlloc_0),
    .io_enqLsq_needAlloc_1(memBlock_io_enqLsq_needAlloc_1),
    .io_enqLsq_needAlloc_2(memBlock_io_enqLsq_needAlloc_2),
    .io_enqLsq_needAlloc_3(memBlock_io_enqLsq_needAlloc_3),
    .io_enqLsq_req_0_valid(memBlock_io_enqLsq_req_0_valid),
    .io_enqLsq_req_0_bits_cf_trigger_backendEn_0(memBlock_io_enqLsq_req_0_bits_cf_trigger_backendEn_0),
    .io_enqLsq_req_0_bits_cf_trigger_backendEn_1(memBlock_io_enqLsq_req_0_bits_cf_trigger_backendEn_1),
    .io_enqLsq_req_0_bits_ctrl_fuOpType(memBlock_io_enqLsq_req_0_bits_ctrl_fuOpType),
    .io_enqLsq_req_0_bits_ctrl_rfWen(memBlock_io_enqLsq_req_0_bits_ctrl_rfWen),
    .io_enqLsq_req_0_bits_ctrl_fpWen(memBlock_io_enqLsq_req_0_bits_ctrl_fpWen),
    .io_enqLsq_req_0_bits_ctrl_flushPipe(memBlock_io_enqLsq_req_0_bits_ctrl_flushPipe),
    .io_enqLsq_req_0_bits_ctrl_replayInst(memBlock_io_enqLsq_req_0_bits_ctrl_replayInst),
    .io_enqLsq_req_0_bits_pdest(memBlock_io_enqLsq_req_0_bits_pdest),
    .io_enqLsq_req_0_bits_robIdx_flag(memBlock_io_enqLsq_req_0_bits_robIdx_flag),
    .io_enqLsq_req_0_bits_robIdx_value(memBlock_io_enqLsq_req_0_bits_robIdx_value),
    .io_enqLsq_req_0_bits_lqIdx_value(memBlock_io_enqLsq_req_0_bits_lqIdx_value),
    .io_enqLsq_req_0_bits_sqIdx_value(memBlock_io_enqLsq_req_0_bits_sqIdx_value),
    .io_enqLsq_req_1_valid(memBlock_io_enqLsq_req_1_valid),
    .io_enqLsq_req_1_bits_cf_trigger_backendEn_0(memBlock_io_enqLsq_req_1_bits_cf_trigger_backendEn_0),
    .io_enqLsq_req_1_bits_cf_trigger_backendEn_1(memBlock_io_enqLsq_req_1_bits_cf_trigger_backendEn_1),
    .io_enqLsq_req_1_bits_ctrl_fuOpType(memBlock_io_enqLsq_req_1_bits_ctrl_fuOpType),
    .io_enqLsq_req_1_bits_ctrl_rfWen(memBlock_io_enqLsq_req_1_bits_ctrl_rfWen),
    .io_enqLsq_req_1_bits_ctrl_fpWen(memBlock_io_enqLsq_req_1_bits_ctrl_fpWen),
    .io_enqLsq_req_1_bits_ctrl_flushPipe(memBlock_io_enqLsq_req_1_bits_ctrl_flushPipe),
    .io_enqLsq_req_1_bits_ctrl_replayInst(memBlock_io_enqLsq_req_1_bits_ctrl_replayInst),
    .io_enqLsq_req_1_bits_pdest(memBlock_io_enqLsq_req_1_bits_pdest),
    .io_enqLsq_req_1_bits_robIdx_flag(memBlock_io_enqLsq_req_1_bits_robIdx_flag),
    .io_enqLsq_req_1_bits_robIdx_value(memBlock_io_enqLsq_req_1_bits_robIdx_value),
    .io_enqLsq_req_1_bits_lqIdx_value(memBlock_io_enqLsq_req_1_bits_lqIdx_value),
    .io_enqLsq_req_1_bits_sqIdx_value(memBlock_io_enqLsq_req_1_bits_sqIdx_value),
    .io_enqLsq_req_2_valid(memBlock_io_enqLsq_req_2_valid),
    .io_enqLsq_req_2_bits_cf_trigger_backendEn_0(memBlock_io_enqLsq_req_2_bits_cf_trigger_backendEn_0),
    .io_enqLsq_req_2_bits_cf_trigger_backendEn_1(memBlock_io_enqLsq_req_2_bits_cf_trigger_backendEn_1),
    .io_enqLsq_req_2_bits_ctrl_fuOpType(memBlock_io_enqLsq_req_2_bits_ctrl_fuOpType),
    .io_enqLsq_req_2_bits_ctrl_rfWen(memBlock_io_enqLsq_req_2_bits_ctrl_rfWen),
    .io_enqLsq_req_2_bits_ctrl_fpWen(memBlock_io_enqLsq_req_2_bits_ctrl_fpWen),
    .io_enqLsq_req_2_bits_ctrl_flushPipe(memBlock_io_enqLsq_req_2_bits_ctrl_flushPipe),
    .io_enqLsq_req_2_bits_ctrl_replayInst(memBlock_io_enqLsq_req_2_bits_ctrl_replayInst),
    .io_enqLsq_req_2_bits_pdest(memBlock_io_enqLsq_req_2_bits_pdest),
    .io_enqLsq_req_2_bits_robIdx_flag(memBlock_io_enqLsq_req_2_bits_robIdx_flag),
    .io_enqLsq_req_2_bits_robIdx_value(memBlock_io_enqLsq_req_2_bits_robIdx_value),
    .io_enqLsq_req_2_bits_lqIdx_value(memBlock_io_enqLsq_req_2_bits_lqIdx_value),
    .io_enqLsq_req_2_bits_sqIdx_value(memBlock_io_enqLsq_req_2_bits_sqIdx_value),
    .io_enqLsq_req_3_valid(memBlock_io_enqLsq_req_3_valid),
    .io_enqLsq_req_3_bits_cf_trigger_backendEn_0(memBlock_io_enqLsq_req_3_bits_cf_trigger_backendEn_0),
    .io_enqLsq_req_3_bits_cf_trigger_backendEn_1(memBlock_io_enqLsq_req_3_bits_cf_trigger_backendEn_1),
    .io_enqLsq_req_3_bits_ctrl_fuOpType(memBlock_io_enqLsq_req_3_bits_ctrl_fuOpType),
    .io_enqLsq_req_3_bits_ctrl_rfWen(memBlock_io_enqLsq_req_3_bits_ctrl_rfWen),
    .io_enqLsq_req_3_bits_ctrl_fpWen(memBlock_io_enqLsq_req_3_bits_ctrl_fpWen),
    .io_enqLsq_req_3_bits_ctrl_flushPipe(memBlock_io_enqLsq_req_3_bits_ctrl_flushPipe),
    .io_enqLsq_req_3_bits_ctrl_replayInst(memBlock_io_enqLsq_req_3_bits_ctrl_replayInst),
    .io_enqLsq_req_3_bits_pdest(memBlock_io_enqLsq_req_3_bits_pdest),
    .io_enqLsq_req_3_bits_robIdx_flag(memBlock_io_enqLsq_req_3_bits_robIdx_flag),
    .io_enqLsq_req_3_bits_robIdx_value(memBlock_io_enqLsq_req_3_bits_robIdx_value),
    .io_enqLsq_req_3_bits_lqIdx_value(memBlock_io_enqLsq_req_3_bits_lqIdx_value),
    .io_enqLsq_req_3_bits_sqIdx_value(memBlock_io_enqLsq_req_3_bits_sqIdx_value),
    .io_lsqio_exceptionAddr_isStore(memBlock_io_lsqio_exceptionAddr_isStore),
    .io_lsqio_exceptionAddr_vaddr(memBlock_io_lsqio_exceptionAddr_vaddr),
    .io_lsqio_rob_scommit(memBlock_io_lsqio_rob_scommit),
    .io_lsqio_rob_pendingld(memBlock_io_lsqio_rob_pendingld),
    .io_lsqio_rob_pendingst(memBlock_io_lsqio_rob_pendingst),
    .io_lsqio_rob_commit(memBlock_io_lsqio_rob_commit),
    .io_lsqio_rob_isMMIO_0(memBlock_io_lsqio_rob_isMMIO_0),
    .io_lsqio_rob_isMMIO_1(memBlock_io_lsqio_rob_isMMIO_1),
    .io_lsqio_rob_uop_0_robIdx_value(memBlock_io_lsqio_rob_uop_0_robIdx_value),
    .io_lsqio_rob_uop_1_robIdx_value(memBlock_io_lsqio_rob_uop_1_robIdx_value),
    .io_csrCtrl_icache_parity_enable(memBlock_io_csrCtrl_icache_parity_enable),
    .io_csrCtrl_lvpred_disable(memBlock_io_csrCtrl_lvpred_disable),
    .io_csrCtrl_no_spec_load(memBlock_io_csrCtrl_no_spec_load),
    .io_csrCtrl_storeset_wait_store(memBlock_io_csrCtrl_storeset_wait_store),
    .io_csrCtrl_lvpred_timeout(memBlock_io_csrCtrl_lvpred_timeout),
    .io_csrCtrl_bp_ctrl_ubtb_enable(memBlock_io_csrCtrl_bp_ctrl_ubtb_enable),
    .io_csrCtrl_bp_ctrl_btb_enable(memBlock_io_csrCtrl_bp_ctrl_btb_enable),
    .io_csrCtrl_bp_ctrl_tage_enable(memBlock_io_csrCtrl_bp_ctrl_tage_enable),
    .io_csrCtrl_bp_ctrl_sc_enable(memBlock_io_csrCtrl_bp_ctrl_sc_enable),
    .io_csrCtrl_bp_ctrl_ras_enable(memBlock_io_csrCtrl_bp_ctrl_ras_enable),
    .io_csrCtrl_sbuffer_threshold(memBlock_io_csrCtrl_sbuffer_threshold),
    .io_csrCtrl_ldld_vio_check_enable(memBlock_io_csrCtrl_ldld_vio_check_enable),
    .io_csrCtrl_cache_error_enable(memBlock_io_csrCtrl_cache_error_enable),
    .io_csrCtrl_uncache_write_outstanding_enable(memBlock_io_csrCtrl_uncache_write_outstanding_enable),
    .io_csrCtrl_fusion_enable(memBlock_io_csrCtrl_fusion_enable),
    .io_csrCtrl_wfi_enable(memBlock_io_csrCtrl_wfi_enable),
    .io_csrCtrl_svinval_enable(memBlock_io_csrCtrl_svinval_enable),
    .io_csrCtrl_distribute_csr_wvalid(memBlock_io_csrCtrl_distribute_csr_wvalid),
    .io_csrCtrl_distribute_csr_waddr(memBlock_io_csrCtrl_distribute_csr_waddr),
    .io_csrCtrl_distribute_csr_wdata(memBlock_io_csrCtrl_distribute_csr_wdata),
    .io_csrCtrl_singlestep(memBlock_io_csrCtrl_singlestep),
    .io_csrCtrl_frontend_trigger_t_valid(memBlock_io_csrCtrl_frontend_trigger_t_valid),
    .io_csrCtrl_frontend_trigger_t_bits_addr(memBlock_io_csrCtrl_frontend_trigger_t_bits_addr),
    .io_csrCtrl_frontend_trigger_t_bits_tdata_matchType(memBlock_io_csrCtrl_frontend_trigger_t_bits_tdata_matchType),
    .io_csrCtrl_frontend_trigger_t_bits_tdata_select(memBlock_io_csrCtrl_frontend_trigger_t_bits_tdata_select),
    .io_csrCtrl_frontend_trigger_t_bits_tdata_timing(memBlock_io_csrCtrl_frontend_trigger_t_bits_tdata_timing),
    .io_csrCtrl_frontend_trigger_t_bits_tdata_chain(memBlock_io_csrCtrl_frontend_trigger_t_bits_tdata_chain),
    .io_csrCtrl_frontend_trigger_t_bits_tdata_tdata2(memBlock_io_csrCtrl_frontend_trigger_t_bits_tdata_tdata2),
    .io_csrCtrl_mem_trigger_t_valid(memBlock_io_csrCtrl_mem_trigger_t_valid),
    .io_csrCtrl_mem_trigger_t_bits_addr(memBlock_io_csrCtrl_mem_trigger_t_bits_addr),
    .io_csrCtrl_mem_trigger_t_bits_tdata_matchType(memBlock_io_csrCtrl_mem_trigger_t_bits_tdata_matchType),
    .io_csrCtrl_mem_trigger_t_bits_tdata_select(memBlock_io_csrCtrl_mem_trigger_t_bits_tdata_select),
    .io_csrCtrl_mem_trigger_t_bits_tdata_chain(memBlock_io_csrCtrl_mem_trigger_t_bits_tdata_chain),
    .io_csrCtrl_mem_trigger_t_bits_tdata_tdata2(memBlock_io_csrCtrl_mem_trigger_t_bits_tdata_tdata2),
    .io_csrCtrl_trigger_enable_0(memBlock_io_csrCtrl_trigger_enable_0),
    .io_csrCtrl_trigger_enable_1(memBlock_io_csrCtrl_trigger_enable_1),
    .io_csrCtrl_trigger_enable_2(memBlock_io_csrCtrl_trigger_enable_2),
    .io_csrCtrl_trigger_enable_3(memBlock_io_csrCtrl_trigger_enable_3),
    .io_csrCtrl_trigger_enable_4(memBlock_io_csrCtrl_trigger_enable_4),
    .io_csrCtrl_trigger_enable_5(memBlock_io_csrCtrl_trigger_enable_5),
    .io_csrCtrl_trigger_enable_6(memBlock_io_csrCtrl_trigger_enable_6),
    .io_csrCtrl_trigger_enable_7(memBlock_io_csrCtrl_trigger_enable_7),
    .io_csrCtrl_trigger_enable_8(memBlock_io_csrCtrl_trigger_enable_8),
    .io_csrCtrl_trigger_enable_9(memBlock_io_csrCtrl_trigger_enable_9),
    .io_csrUpdate_wvalid(memBlock_io_csrUpdate_wvalid),
    .io_csrUpdate_waddr(memBlock_io_csrUpdate_waddr),
    .io_csrUpdate_wdata(memBlock_io_csrUpdate_wdata),
    .io_error_paddr(memBlock_io_error_paddr),
    .io_error_report_to_beu(memBlock_io_error_report_to_beu),
    .io_perfEventsPTW_0_value(memBlock_io_perfEventsPTW_0_value),
    .io_perfEventsPTW_1_value(memBlock_io_perfEventsPTW_1_value),
    .io_perfEventsPTW_2_value(memBlock_io_perfEventsPTW_2_value),
    .io_perfEventsPTW_3_value(memBlock_io_perfEventsPTW_3_value),
    .io_perfEventsPTW_4_value(memBlock_io_perfEventsPTW_4_value),
    .io_perfEventsPTW_5_value(memBlock_io_perfEventsPTW_5_value),
    .io_perfEventsPTW_6_value(memBlock_io_perfEventsPTW_6_value),
    .io_perfEventsPTW_7_value(memBlock_io_perfEventsPTW_7_value),
    .io_perfEventsPTW_8_value(memBlock_io_perfEventsPTW_8_value),
    .io_perfEventsPTW_9_value(memBlock_io_perfEventsPTW_9_value),
    .io_perfEventsPTW_10_value(memBlock_io_perfEventsPTW_10_value),
    .io_perfEventsPTW_11_value(memBlock_io_perfEventsPTW_11_value),
    .io_perfEventsPTW_12_value(memBlock_io_perfEventsPTW_12_value),
    .io_perfEventsPTW_13_value(memBlock_io_perfEventsPTW_13_value),
    .io_perfEventsPTW_14_value(memBlock_io_perfEventsPTW_14_value),
    .io_perfEventsPTW_15_value(memBlock_io_perfEventsPTW_15_value),
    .io_perfEventsPTW_16_value(memBlock_io_perfEventsPTW_16_value),
    .io_perfEventsPTW_17_value(memBlock_io_perfEventsPTW_17_value),
    .io_perfEventsPTW_18_value(memBlock_io_perfEventsPTW_18_value),
    .io_lqCancelCnt(memBlock_io_lqCancelCnt),
    .io_sqCancelCnt(memBlock_io_sqCancelCnt),
    .io_sqDeq(memBlock_io_sqDeq),
    .io_lqDeq(memBlock_io_lqDeq),
    .io_perf_0_value(memBlock_io_perf_0_value),
    .io_perf_1_value(memBlock_io_perf_1_value),
    .io_perf_2_value(memBlock_io_perf_2_value),
    .io_perf_3_value(memBlock_io_perf_3_value),
    .io_perf_4_value(memBlock_io_perf_4_value),
    .io_perf_5_value(memBlock_io_perf_5_value),
    .io_perf_6_value(memBlock_io_perf_6_value),
    .io_perf_7_value(memBlock_io_perf_7_value)
  );
  Wb2Ctrl wb2Ctrl ( // @[XSCore.scala 227:27]
    .clock(wb2Ctrl_clock),
    .reset(wb2Ctrl_reset),
    .io_redirect_valid(wb2Ctrl_io_redirect_valid),
    .io_redirect_bits_robIdx_flag(wb2Ctrl_io_redirect_bits_robIdx_flag),
    .io_redirect_bits_robIdx_value(wb2Ctrl_io_redirect_bits_robIdx_value),
    .io_redirect_bits_level(wb2Ctrl_io_redirect_bits_level),
    .io_in_3_ready(wb2Ctrl_io_in_3_ready),
    .io_in_3_valid(wb2Ctrl_io_in_3_valid),
    .io_in_3_bits_uop_cf_exceptionVec_2(wb2Ctrl_io_in_3_bits_uop_cf_exceptionVec_2),
    .io_in_3_bits_uop_cf_exceptionVec_3(wb2Ctrl_io_in_3_bits_uop_cf_exceptionVec_3),
    .io_in_3_bits_uop_cf_exceptionVec_8(wb2Ctrl_io_in_3_bits_uop_cf_exceptionVec_8),
    .io_in_3_bits_uop_cf_exceptionVec_9(wb2Ctrl_io_in_3_bits_uop_cf_exceptionVec_9),
    .io_in_3_bits_uop_cf_exceptionVec_11(wb2Ctrl_io_in_3_bits_uop_cf_exceptionVec_11),
    .io_in_3_bits_uop_ctrl_flushPipe(wb2Ctrl_io_in_3_bits_uop_ctrl_flushPipe),
    .io_in_3_bits_uop_robIdx_flag(wb2Ctrl_io_in_3_bits_uop_robIdx_flag),
    .io_in_3_bits_uop_robIdx_value(wb2Ctrl_io_in_3_bits_uop_robIdx_value),
    .io_in_3_bits_fflags(wb2Ctrl_io_in_3_bits_fflags),
    .io_in_4_ready(wb2Ctrl_io_in_4_ready),
    .io_in_4_valid(wb2Ctrl_io_in_4_valid),
    .io_in_4_bits_uop_robIdx_flag(wb2Ctrl_io_in_4_bits_uop_robIdx_flag),
    .io_in_4_bits_uop_robIdx_value(wb2Ctrl_io_in_4_bits_uop_robIdx_value),
    .io_in_4_bits_fflags(wb2Ctrl_io_in_4_bits_fflags),
    .io_in_5_ready(wb2Ctrl_io_in_5_ready),
    .io_in_5_valid(wb2Ctrl_io_in_5_valid),
    .io_in_5_bits_uop_robIdx_flag(wb2Ctrl_io_in_5_bits_uop_robIdx_flag),
    .io_in_5_bits_uop_robIdx_value(wb2Ctrl_io_in_5_bits_uop_robIdx_value),
    .io_in_5_bits_fflags(wb2Ctrl_io_in_5_bits_fflags),
    .io_in_6_ready(wb2Ctrl_io_in_6_ready),
    .io_in_6_valid(wb2Ctrl_io_in_6_valid),
    .io_in_6_bits_uop_cf_exceptionVec_4(wb2Ctrl_io_in_6_bits_uop_cf_exceptionVec_4),
    .io_in_6_bits_uop_cf_exceptionVec_5(wb2Ctrl_io_in_6_bits_uop_cf_exceptionVec_5),
    .io_in_6_bits_uop_cf_exceptionVec_13(wb2Ctrl_io_in_6_bits_uop_cf_exceptionVec_13),
    .io_in_6_bits_uop_cf_trigger_backendHit_0(wb2Ctrl_io_in_6_bits_uop_cf_trigger_backendHit_0),
    .io_in_6_bits_uop_cf_trigger_backendHit_1(wb2Ctrl_io_in_6_bits_uop_cf_trigger_backendHit_1),
    .io_in_6_bits_uop_cf_trigger_backendHit_2(wb2Ctrl_io_in_6_bits_uop_cf_trigger_backendHit_2),
    .io_in_6_bits_uop_cf_trigger_backendHit_3(wb2Ctrl_io_in_6_bits_uop_cf_trigger_backendHit_3),
    .io_in_6_bits_uop_cf_trigger_backendHit_4(wb2Ctrl_io_in_6_bits_uop_cf_trigger_backendHit_4),
    .io_in_6_bits_uop_cf_trigger_backendHit_5(wb2Ctrl_io_in_6_bits_uop_cf_trigger_backendHit_5),
    .io_in_6_bits_uop_ctrl_flushPipe(wb2Ctrl_io_in_6_bits_uop_ctrl_flushPipe),
    .io_in_6_bits_uop_ctrl_replayInst(wb2Ctrl_io_in_6_bits_uop_ctrl_replayInst),
    .io_in_6_bits_uop_robIdx_flag(wb2Ctrl_io_in_6_bits_uop_robIdx_flag),
    .io_in_6_bits_uop_robIdx_value(wb2Ctrl_io_in_6_bits_uop_robIdx_value),
    .io_in_7_ready(wb2Ctrl_io_in_7_ready),
    .io_in_7_valid(wb2Ctrl_io_in_7_valid),
    .io_in_7_bits_uop_cf_exceptionVec_4(wb2Ctrl_io_in_7_bits_uop_cf_exceptionVec_4),
    .io_in_7_bits_uop_cf_exceptionVec_5(wb2Ctrl_io_in_7_bits_uop_cf_exceptionVec_5),
    .io_in_7_bits_uop_cf_exceptionVec_13(wb2Ctrl_io_in_7_bits_uop_cf_exceptionVec_13),
    .io_in_7_bits_uop_cf_trigger_backendHit_0(wb2Ctrl_io_in_7_bits_uop_cf_trigger_backendHit_0),
    .io_in_7_bits_uop_cf_trigger_backendHit_1(wb2Ctrl_io_in_7_bits_uop_cf_trigger_backendHit_1),
    .io_in_7_bits_uop_cf_trigger_backendHit_2(wb2Ctrl_io_in_7_bits_uop_cf_trigger_backendHit_2),
    .io_in_7_bits_uop_cf_trigger_backendHit_3(wb2Ctrl_io_in_7_bits_uop_cf_trigger_backendHit_3),
    .io_in_7_bits_uop_cf_trigger_backendHit_4(wb2Ctrl_io_in_7_bits_uop_cf_trigger_backendHit_4),
    .io_in_7_bits_uop_cf_trigger_backendHit_5(wb2Ctrl_io_in_7_bits_uop_cf_trigger_backendHit_5),
    .io_in_7_bits_uop_ctrl_flushPipe(wb2Ctrl_io_in_7_bits_uop_ctrl_flushPipe),
    .io_in_7_bits_uop_ctrl_replayInst(wb2Ctrl_io_in_7_bits_uop_ctrl_replayInst),
    .io_in_7_bits_uop_robIdx_flag(wb2Ctrl_io_in_7_bits_uop_robIdx_flag),
    .io_in_7_bits_uop_robIdx_value(wb2Ctrl_io_in_7_bits_uop_robIdx_value),
    .io_in_8_ready(wb2Ctrl_io_in_8_ready),
    .io_in_8_valid(wb2Ctrl_io_in_8_valid),
    .io_in_8_bits_uop_cf_exceptionVec_4(wb2Ctrl_io_in_8_bits_uop_cf_exceptionVec_4),
    .io_in_8_bits_uop_cf_exceptionVec_5(wb2Ctrl_io_in_8_bits_uop_cf_exceptionVec_5),
    .io_in_8_bits_uop_cf_exceptionVec_6(wb2Ctrl_io_in_8_bits_uop_cf_exceptionVec_6),
    .io_in_8_bits_uop_cf_exceptionVec_7(wb2Ctrl_io_in_8_bits_uop_cf_exceptionVec_7),
    .io_in_8_bits_uop_cf_exceptionVec_13(wb2Ctrl_io_in_8_bits_uop_cf_exceptionVec_13),
    .io_in_8_bits_uop_cf_exceptionVec_15(wb2Ctrl_io_in_8_bits_uop_cf_exceptionVec_15),
    .io_in_8_bits_uop_cf_trigger_backendHit_0(wb2Ctrl_io_in_8_bits_uop_cf_trigger_backendHit_0),
    .io_in_8_bits_uop_cf_trigger_backendHit_1(wb2Ctrl_io_in_8_bits_uop_cf_trigger_backendHit_1),
    .io_in_8_bits_uop_cf_trigger_backendHit_2(wb2Ctrl_io_in_8_bits_uop_cf_trigger_backendHit_2),
    .io_in_8_bits_uop_cf_trigger_backendHit_3(wb2Ctrl_io_in_8_bits_uop_cf_trigger_backendHit_3),
    .io_in_8_bits_uop_cf_trigger_backendHit_4(wb2Ctrl_io_in_8_bits_uop_cf_trigger_backendHit_4),
    .io_in_8_bits_uop_cf_trigger_backendHit_5(wb2Ctrl_io_in_8_bits_uop_cf_trigger_backendHit_5),
    .io_in_8_bits_uop_robIdx_flag(wb2Ctrl_io_in_8_bits_uop_robIdx_flag),
    .io_in_8_bits_uop_robIdx_value(wb2Ctrl_io_in_8_bits_uop_robIdx_value),
    .io_in_9_ready(wb2Ctrl_io_in_9_ready),
    .io_in_9_valid(wb2Ctrl_io_in_9_valid),
    .io_in_9_bits_uop_cf_exceptionVec_6(wb2Ctrl_io_in_9_bits_uop_cf_exceptionVec_6),
    .io_in_9_bits_uop_cf_exceptionVec_7(wb2Ctrl_io_in_9_bits_uop_cf_exceptionVec_7),
    .io_in_9_bits_uop_cf_exceptionVec_15(wb2Ctrl_io_in_9_bits_uop_cf_exceptionVec_15),
    .io_in_9_bits_uop_cf_trigger_backendHit_0(wb2Ctrl_io_in_9_bits_uop_cf_trigger_backendHit_0),
    .io_in_9_bits_uop_cf_trigger_backendHit_1(wb2Ctrl_io_in_9_bits_uop_cf_trigger_backendHit_1),
    .io_in_9_bits_uop_cf_trigger_backendHit_4(wb2Ctrl_io_in_9_bits_uop_cf_trigger_backendHit_4),
    .io_in_9_bits_uop_robIdx_flag(wb2Ctrl_io_in_9_bits_uop_robIdx_flag),
    .io_in_9_bits_uop_robIdx_value(wb2Ctrl_io_in_9_bits_uop_robIdx_value),
    .io_out_3_valid(wb2Ctrl_io_out_3_valid),
    .io_out_3_bits_uop_cf_exceptionVec_2(wb2Ctrl_io_out_3_bits_uop_cf_exceptionVec_2),
    .io_out_3_bits_uop_cf_exceptionVec_3(wb2Ctrl_io_out_3_bits_uop_cf_exceptionVec_3),
    .io_out_3_bits_uop_cf_exceptionVec_8(wb2Ctrl_io_out_3_bits_uop_cf_exceptionVec_8),
    .io_out_3_bits_uop_cf_exceptionVec_9(wb2Ctrl_io_out_3_bits_uop_cf_exceptionVec_9),
    .io_out_3_bits_uop_cf_exceptionVec_11(wb2Ctrl_io_out_3_bits_uop_cf_exceptionVec_11),
    .io_out_3_bits_uop_ctrl_flushPipe(wb2Ctrl_io_out_3_bits_uop_ctrl_flushPipe),
    .io_out_3_bits_uop_robIdx_flag(wb2Ctrl_io_out_3_bits_uop_robIdx_flag),
    .io_out_3_bits_uop_robIdx_value(wb2Ctrl_io_out_3_bits_uop_robIdx_value),
    .io_out_3_bits_fflags(wb2Ctrl_io_out_3_bits_fflags),
    .io_out_4_valid(wb2Ctrl_io_out_4_valid),
    .io_out_4_bits_uop_robIdx_flag(wb2Ctrl_io_out_4_bits_uop_robIdx_flag),
    .io_out_4_bits_uop_robIdx_value(wb2Ctrl_io_out_4_bits_uop_robIdx_value),
    .io_out_4_bits_fflags(wb2Ctrl_io_out_4_bits_fflags),
    .io_out_5_valid(wb2Ctrl_io_out_5_valid),
    .io_out_5_bits_uop_robIdx_flag(wb2Ctrl_io_out_5_bits_uop_robIdx_flag),
    .io_out_5_bits_uop_robIdx_value(wb2Ctrl_io_out_5_bits_uop_robIdx_value),
    .io_out_5_bits_fflags(wb2Ctrl_io_out_5_bits_fflags),
    .io_out_6_valid(wb2Ctrl_io_out_6_valid),
    .io_out_6_bits_uop_cf_exceptionVec_4(wb2Ctrl_io_out_6_bits_uop_cf_exceptionVec_4),
    .io_out_6_bits_uop_cf_exceptionVec_5(wb2Ctrl_io_out_6_bits_uop_cf_exceptionVec_5),
    .io_out_6_bits_uop_cf_exceptionVec_13(wb2Ctrl_io_out_6_bits_uop_cf_exceptionVec_13),
    .io_out_6_bits_uop_cf_trigger_backendHit_0(wb2Ctrl_io_out_6_bits_uop_cf_trigger_backendHit_0),
    .io_out_6_bits_uop_cf_trigger_backendHit_1(wb2Ctrl_io_out_6_bits_uop_cf_trigger_backendHit_1),
    .io_out_6_bits_uop_cf_trigger_backendHit_2(wb2Ctrl_io_out_6_bits_uop_cf_trigger_backendHit_2),
    .io_out_6_bits_uop_cf_trigger_backendHit_3(wb2Ctrl_io_out_6_bits_uop_cf_trigger_backendHit_3),
    .io_out_6_bits_uop_cf_trigger_backendHit_4(wb2Ctrl_io_out_6_bits_uop_cf_trigger_backendHit_4),
    .io_out_6_bits_uop_cf_trigger_backendHit_5(wb2Ctrl_io_out_6_bits_uop_cf_trigger_backendHit_5),
    .io_out_6_bits_uop_ctrl_flushPipe(wb2Ctrl_io_out_6_bits_uop_ctrl_flushPipe),
    .io_out_6_bits_uop_ctrl_replayInst(wb2Ctrl_io_out_6_bits_uop_ctrl_replayInst),
    .io_out_6_bits_uop_robIdx_flag(wb2Ctrl_io_out_6_bits_uop_robIdx_flag),
    .io_out_6_bits_uop_robIdx_value(wb2Ctrl_io_out_6_bits_uop_robIdx_value),
    .io_out_7_valid(wb2Ctrl_io_out_7_valid),
    .io_out_7_bits_uop_cf_exceptionVec_4(wb2Ctrl_io_out_7_bits_uop_cf_exceptionVec_4),
    .io_out_7_bits_uop_cf_exceptionVec_5(wb2Ctrl_io_out_7_bits_uop_cf_exceptionVec_5),
    .io_out_7_bits_uop_cf_exceptionVec_13(wb2Ctrl_io_out_7_bits_uop_cf_exceptionVec_13),
    .io_out_7_bits_uop_cf_trigger_backendHit_0(wb2Ctrl_io_out_7_bits_uop_cf_trigger_backendHit_0),
    .io_out_7_bits_uop_cf_trigger_backendHit_1(wb2Ctrl_io_out_7_bits_uop_cf_trigger_backendHit_1),
    .io_out_7_bits_uop_cf_trigger_backendHit_2(wb2Ctrl_io_out_7_bits_uop_cf_trigger_backendHit_2),
    .io_out_7_bits_uop_cf_trigger_backendHit_3(wb2Ctrl_io_out_7_bits_uop_cf_trigger_backendHit_3),
    .io_out_7_bits_uop_cf_trigger_backendHit_4(wb2Ctrl_io_out_7_bits_uop_cf_trigger_backendHit_4),
    .io_out_7_bits_uop_cf_trigger_backendHit_5(wb2Ctrl_io_out_7_bits_uop_cf_trigger_backendHit_5),
    .io_out_7_bits_uop_ctrl_flushPipe(wb2Ctrl_io_out_7_bits_uop_ctrl_flushPipe),
    .io_out_7_bits_uop_ctrl_replayInst(wb2Ctrl_io_out_7_bits_uop_ctrl_replayInst),
    .io_out_7_bits_uop_robIdx_flag(wb2Ctrl_io_out_7_bits_uop_robIdx_flag),
    .io_out_7_bits_uop_robIdx_value(wb2Ctrl_io_out_7_bits_uop_robIdx_value),
    .io_out_8_valid(wb2Ctrl_io_out_8_valid),
    .io_out_8_bits_uop_cf_exceptionVec_4(wb2Ctrl_io_out_8_bits_uop_cf_exceptionVec_4),
    .io_out_8_bits_uop_cf_exceptionVec_5(wb2Ctrl_io_out_8_bits_uop_cf_exceptionVec_5),
    .io_out_8_bits_uop_cf_exceptionVec_6(wb2Ctrl_io_out_8_bits_uop_cf_exceptionVec_6),
    .io_out_8_bits_uop_cf_exceptionVec_7(wb2Ctrl_io_out_8_bits_uop_cf_exceptionVec_7),
    .io_out_8_bits_uop_cf_exceptionVec_13(wb2Ctrl_io_out_8_bits_uop_cf_exceptionVec_13),
    .io_out_8_bits_uop_cf_exceptionVec_15(wb2Ctrl_io_out_8_bits_uop_cf_exceptionVec_15),
    .io_out_8_bits_uop_cf_trigger_backendHit_0(wb2Ctrl_io_out_8_bits_uop_cf_trigger_backendHit_0),
    .io_out_8_bits_uop_cf_trigger_backendHit_1(wb2Ctrl_io_out_8_bits_uop_cf_trigger_backendHit_1),
    .io_out_8_bits_uop_cf_trigger_backendHit_2(wb2Ctrl_io_out_8_bits_uop_cf_trigger_backendHit_2),
    .io_out_8_bits_uop_cf_trigger_backendHit_3(wb2Ctrl_io_out_8_bits_uop_cf_trigger_backendHit_3),
    .io_out_8_bits_uop_cf_trigger_backendHit_4(wb2Ctrl_io_out_8_bits_uop_cf_trigger_backendHit_4),
    .io_out_8_bits_uop_cf_trigger_backendHit_5(wb2Ctrl_io_out_8_bits_uop_cf_trigger_backendHit_5),
    .io_out_8_bits_uop_robIdx_flag(wb2Ctrl_io_out_8_bits_uop_robIdx_flag),
    .io_out_8_bits_uop_robIdx_value(wb2Ctrl_io_out_8_bits_uop_robIdx_value),
    .io_out_9_valid(wb2Ctrl_io_out_9_valid),
    .io_out_9_bits_uop_cf_exceptionVec_6(wb2Ctrl_io_out_9_bits_uop_cf_exceptionVec_6),
    .io_out_9_bits_uop_cf_exceptionVec_7(wb2Ctrl_io_out_9_bits_uop_cf_exceptionVec_7),
    .io_out_9_bits_uop_cf_exceptionVec_15(wb2Ctrl_io_out_9_bits_uop_cf_exceptionVec_15),
    .io_out_9_bits_uop_cf_trigger_backendHit_0(wb2Ctrl_io_out_9_bits_uop_cf_trigger_backendHit_0),
    .io_out_9_bits_uop_cf_trigger_backendHit_1(wb2Ctrl_io_out_9_bits_uop_cf_trigger_backendHit_1),
    .io_out_9_bits_uop_cf_trigger_backendHit_4(wb2Ctrl_io_out_9_bits_uop_cf_trigger_backendHit_4),
    .io_out_9_bits_uop_robIdx_flag(wb2Ctrl_io_out_9_bits_uop_robIdx_flag),
    .io_out_9_bits_uop_robIdx_value(wb2Ctrl_io_out_9_bits_uop_robIdx_value)
  );
  CtrlBlock ctrlBlock ( // @[XSCore.scala 230:29]
    .clock(ctrlBlock_clock),
    .reset(ctrlBlock_reset),
    .io_hartId(ctrlBlock_io_hartId),
    .io_cpu_halt(ctrlBlock_io_cpu_halt),
    .io_frontend_cfVec_0_ready(ctrlBlock_io_frontend_cfVec_0_ready),
    .io_frontend_cfVec_0_valid(ctrlBlock_io_frontend_cfVec_0_valid),
    .io_frontend_cfVec_0_bits_instr(ctrlBlock_io_frontend_cfVec_0_bits_instr),
    .io_frontend_cfVec_0_bits_foldpc(ctrlBlock_io_frontend_cfVec_0_bits_foldpc),
    .io_frontend_cfVec_0_bits_exceptionVec_1(ctrlBlock_io_frontend_cfVec_0_bits_exceptionVec_1),
    .io_frontend_cfVec_0_bits_exceptionVec_12(ctrlBlock_io_frontend_cfVec_0_bits_exceptionVec_12),
    .io_frontend_cfVec_0_bits_trigger_frontendHit_0(ctrlBlock_io_frontend_cfVec_0_bits_trigger_frontendHit_0),
    .io_frontend_cfVec_0_bits_trigger_frontendHit_1(ctrlBlock_io_frontend_cfVec_0_bits_trigger_frontendHit_1),
    .io_frontend_cfVec_0_bits_trigger_frontendHit_2(ctrlBlock_io_frontend_cfVec_0_bits_trigger_frontendHit_2),
    .io_frontend_cfVec_0_bits_trigger_frontendHit_3(ctrlBlock_io_frontend_cfVec_0_bits_trigger_frontendHit_3),
    .io_frontend_cfVec_0_bits_trigger_backendEn_0(ctrlBlock_io_frontend_cfVec_0_bits_trigger_backendEn_0),
    .io_frontend_cfVec_0_bits_trigger_backendEn_1(ctrlBlock_io_frontend_cfVec_0_bits_trigger_backendEn_1),
    .io_frontend_cfVec_0_bits_pd_isRVC(ctrlBlock_io_frontend_cfVec_0_bits_pd_isRVC),
    .io_frontend_cfVec_0_bits_pd_brType(ctrlBlock_io_frontend_cfVec_0_bits_pd_brType),
    .io_frontend_cfVec_0_bits_pd_isCall(ctrlBlock_io_frontend_cfVec_0_bits_pd_isCall),
    .io_frontend_cfVec_0_bits_pd_isRet(ctrlBlock_io_frontend_cfVec_0_bits_pd_isRet),
    .io_frontend_cfVec_0_bits_pred_taken(ctrlBlock_io_frontend_cfVec_0_bits_pred_taken),
    .io_frontend_cfVec_0_bits_crossPageIPFFix(ctrlBlock_io_frontend_cfVec_0_bits_crossPageIPFFix),
    .io_frontend_cfVec_0_bits_ftqPtr_flag(ctrlBlock_io_frontend_cfVec_0_bits_ftqPtr_flag),
    .io_frontend_cfVec_0_bits_ftqPtr_value(ctrlBlock_io_frontend_cfVec_0_bits_ftqPtr_value),
    .io_frontend_cfVec_0_bits_ftqOffset(ctrlBlock_io_frontend_cfVec_0_bits_ftqOffset),
    .io_frontend_cfVec_1_ready(ctrlBlock_io_frontend_cfVec_1_ready),
    .io_frontend_cfVec_1_valid(ctrlBlock_io_frontend_cfVec_1_valid),
    .io_frontend_cfVec_1_bits_instr(ctrlBlock_io_frontend_cfVec_1_bits_instr),
    .io_frontend_cfVec_1_bits_foldpc(ctrlBlock_io_frontend_cfVec_1_bits_foldpc),
    .io_frontend_cfVec_1_bits_exceptionVec_1(ctrlBlock_io_frontend_cfVec_1_bits_exceptionVec_1),
    .io_frontend_cfVec_1_bits_exceptionVec_12(ctrlBlock_io_frontend_cfVec_1_bits_exceptionVec_12),
    .io_frontend_cfVec_1_bits_trigger_frontendHit_0(ctrlBlock_io_frontend_cfVec_1_bits_trigger_frontendHit_0),
    .io_frontend_cfVec_1_bits_trigger_frontendHit_1(ctrlBlock_io_frontend_cfVec_1_bits_trigger_frontendHit_1),
    .io_frontend_cfVec_1_bits_trigger_frontendHit_2(ctrlBlock_io_frontend_cfVec_1_bits_trigger_frontendHit_2),
    .io_frontend_cfVec_1_bits_trigger_frontendHit_3(ctrlBlock_io_frontend_cfVec_1_bits_trigger_frontendHit_3),
    .io_frontend_cfVec_1_bits_trigger_backendEn_0(ctrlBlock_io_frontend_cfVec_1_bits_trigger_backendEn_0),
    .io_frontend_cfVec_1_bits_trigger_backendEn_1(ctrlBlock_io_frontend_cfVec_1_bits_trigger_backendEn_1),
    .io_frontend_cfVec_1_bits_pd_isRVC(ctrlBlock_io_frontend_cfVec_1_bits_pd_isRVC),
    .io_frontend_cfVec_1_bits_pd_brType(ctrlBlock_io_frontend_cfVec_1_bits_pd_brType),
    .io_frontend_cfVec_1_bits_pd_isCall(ctrlBlock_io_frontend_cfVec_1_bits_pd_isCall),
    .io_frontend_cfVec_1_bits_pd_isRet(ctrlBlock_io_frontend_cfVec_1_bits_pd_isRet),
    .io_frontend_cfVec_1_bits_pred_taken(ctrlBlock_io_frontend_cfVec_1_bits_pred_taken),
    .io_frontend_cfVec_1_bits_crossPageIPFFix(ctrlBlock_io_frontend_cfVec_1_bits_crossPageIPFFix),
    .io_frontend_cfVec_1_bits_ftqPtr_flag(ctrlBlock_io_frontend_cfVec_1_bits_ftqPtr_flag),
    .io_frontend_cfVec_1_bits_ftqPtr_value(ctrlBlock_io_frontend_cfVec_1_bits_ftqPtr_value),
    .io_frontend_cfVec_1_bits_ftqOffset(ctrlBlock_io_frontend_cfVec_1_bits_ftqOffset),
    .io_frontend_fromFtq_pc_mem_wen(ctrlBlock_io_frontend_fromFtq_pc_mem_wen),
    .io_frontend_fromFtq_pc_mem_waddr(ctrlBlock_io_frontend_fromFtq_pc_mem_waddr),
    .io_frontend_fromFtq_pc_mem_wdata_startAddr(ctrlBlock_io_frontend_fromFtq_pc_mem_wdata_startAddr),
    .io_frontend_fromFtq_pc_mem_wdata_nextLineAddr(ctrlBlock_io_frontend_fromFtq_pc_mem_wdata_nextLineAddr),
    .io_frontend_fromFtq_pc_mem_wdata_isNextMask_0(ctrlBlock_io_frontend_fromFtq_pc_mem_wdata_isNextMask_0),
    .io_frontend_fromFtq_pc_mem_wdata_isNextMask_1(ctrlBlock_io_frontend_fromFtq_pc_mem_wdata_isNextMask_1),
    .io_frontend_fromFtq_pc_mem_wdata_isNextMask_2(ctrlBlock_io_frontend_fromFtq_pc_mem_wdata_isNextMask_2),
    .io_frontend_fromFtq_pc_mem_wdata_isNextMask_3(ctrlBlock_io_frontend_fromFtq_pc_mem_wdata_isNextMask_3),
    .io_frontend_fromFtq_pc_mem_wdata_isNextMask_4(ctrlBlock_io_frontend_fromFtq_pc_mem_wdata_isNextMask_4),
    .io_frontend_fromFtq_pc_mem_wdata_isNextMask_5(ctrlBlock_io_frontend_fromFtq_pc_mem_wdata_isNextMask_5),
    .io_frontend_fromFtq_pc_mem_wdata_isNextMask_6(ctrlBlock_io_frontend_fromFtq_pc_mem_wdata_isNextMask_6),
    .io_frontend_fromFtq_pc_mem_wdata_isNextMask_7(ctrlBlock_io_frontend_fromFtq_pc_mem_wdata_isNextMask_7),
    .io_frontend_fromFtq_newest_entry_target(ctrlBlock_io_frontend_fromFtq_newest_entry_target),
    .io_frontend_fromFtq_newest_entry_ptr_flag(ctrlBlock_io_frontend_fromFtq_newest_entry_ptr_flag),
    .io_frontend_fromFtq_newest_entry_ptr_value(ctrlBlock_io_frontend_fromFtq_newest_entry_ptr_value),
    .io_frontend_toFtq_rob_commits_0_valid(ctrlBlock_io_frontend_toFtq_rob_commits_0_valid),
    .io_frontend_toFtq_rob_commits_0_bits_commitType(ctrlBlock_io_frontend_toFtq_rob_commits_0_bits_commitType),
    .io_frontend_toFtq_rob_commits_0_bits_ftqIdx_flag(ctrlBlock_io_frontend_toFtq_rob_commits_0_bits_ftqIdx_flag),
    .io_frontend_toFtq_rob_commits_0_bits_ftqIdx_value(ctrlBlock_io_frontend_toFtq_rob_commits_0_bits_ftqIdx_value),
    .io_frontend_toFtq_rob_commits_0_bits_ftqOffset(ctrlBlock_io_frontend_toFtq_rob_commits_0_bits_ftqOffset),
    .io_frontend_toFtq_rob_commits_1_valid(ctrlBlock_io_frontend_toFtq_rob_commits_1_valid),
    .io_frontend_toFtq_rob_commits_1_bits_commitType(ctrlBlock_io_frontend_toFtq_rob_commits_1_bits_commitType),
    .io_frontend_toFtq_rob_commits_1_bits_ftqIdx_flag(ctrlBlock_io_frontend_toFtq_rob_commits_1_bits_ftqIdx_flag),
    .io_frontend_toFtq_rob_commits_1_bits_ftqIdx_value(ctrlBlock_io_frontend_toFtq_rob_commits_1_bits_ftqIdx_value),
    .io_frontend_toFtq_rob_commits_1_bits_ftqOffset(ctrlBlock_io_frontend_toFtq_rob_commits_1_bits_ftqOffset),
    .io_frontend_toFtq_redirect_valid(ctrlBlock_io_frontend_toFtq_redirect_valid),
    .io_frontend_toFtq_redirect_bits_ftqIdx_flag(ctrlBlock_io_frontend_toFtq_redirect_bits_ftqIdx_flag),
    .io_frontend_toFtq_redirect_bits_ftqIdx_value(ctrlBlock_io_frontend_toFtq_redirect_bits_ftqIdx_value),
    .io_frontend_toFtq_redirect_bits_ftqOffset(ctrlBlock_io_frontend_toFtq_redirect_bits_ftqOffset),
    .io_frontend_toFtq_redirect_bits_level(ctrlBlock_io_frontend_toFtq_redirect_bits_level),
    .io_frontend_toFtq_redirect_bits_cfiUpdate_pc(ctrlBlock_io_frontend_toFtq_redirect_bits_cfiUpdate_pc),
    .io_frontend_toFtq_redirect_bits_cfiUpdate_pd_isRVC(ctrlBlock_io_frontend_toFtq_redirect_bits_cfiUpdate_pd_isRVC),
    .io_frontend_toFtq_redirect_bits_cfiUpdate_pd_brType(ctrlBlock_io_frontend_toFtq_redirect_bits_cfiUpdate_pd_brType),
    .io_frontend_toFtq_redirect_bits_cfiUpdate_pd_isCall(ctrlBlock_io_frontend_toFtq_redirect_bits_cfiUpdate_pd_isCall),
    .io_frontend_toFtq_redirect_bits_cfiUpdate_pd_isRet(ctrlBlock_io_frontend_toFtq_redirect_bits_cfiUpdate_pd_isRet),
    .io_frontend_toFtq_redirect_bits_cfiUpdate_target(ctrlBlock_io_frontend_toFtq_redirect_bits_cfiUpdate_target),
    .io_frontend_toFtq_redirect_bits_cfiUpdate_taken(ctrlBlock_io_frontend_toFtq_redirect_bits_cfiUpdate_taken),
    .io_frontend_toFtq_redirect_bits_cfiUpdate_isMisPred(ctrlBlock_io_frontend_toFtq_redirect_bits_cfiUpdate_isMisPred),
    .io_allocPregs_0_isInt(ctrlBlock_io_allocPregs_0_isInt),
    .io_allocPregs_0_isFp(ctrlBlock_io_allocPregs_0_isFp),
    .io_allocPregs_0_preg(ctrlBlock_io_allocPregs_0_preg),
    .io_allocPregs_1_isInt(ctrlBlock_io_allocPregs_1_isInt),
    .io_allocPregs_1_isFp(ctrlBlock_io_allocPregs_1_isFp),
    .io_allocPregs_1_preg(ctrlBlock_io_allocPregs_1_preg),
    .io_dispatch_0_valid(ctrlBlock_io_dispatch_0_valid),
    .io_dispatch_0_bits_cf_foldpc(ctrlBlock_io_dispatch_0_bits_cf_foldpc),
    .io_dispatch_0_bits_cf_trigger_backendEn_0(ctrlBlock_io_dispatch_0_bits_cf_trigger_backendEn_0),
    .io_dispatch_0_bits_cf_trigger_backendEn_1(ctrlBlock_io_dispatch_0_bits_cf_trigger_backendEn_1),
    .io_dispatch_0_bits_cf_pd_isRVC(ctrlBlock_io_dispatch_0_bits_cf_pd_isRVC),
    .io_dispatch_0_bits_cf_pd_brType(ctrlBlock_io_dispatch_0_bits_cf_pd_brType),
    .io_dispatch_0_bits_cf_pd_isCall(ctrlBlock_io_dispatch_0_bits_cf_pd_isCall),
    .io_dispatch_0_bits_cf_pd_isRet(ctrlBlock_io_dispatch_0_bits_cf_pd_isRet),
    .io_dispatch_0_bits_cf_pred_taken(ctrlBlock_io_dispatch_0_bits_cf_pred_taken),
    .io_dispatch_0_bits_cf_storeSetHit(ctrlBlock_io_dispatch_0_bits_cf_storeSetHit),
    .io_dispatch_0_bits_cf_waitForRobIdx_flag(ctrlBlock_io_dispatch_0_bits_cf_waitForRobIdx_flag),
    .io_dispatch_0_bits_cf_waitForRobIdx_value(ctrlBlock_io_dispatch_0_bits_cf_waitForRobIdx_value),
    .io_dispatch_0_bits_cf_loadWaitBit(ctrlBlock_io_dispatch_0_bits_cf_loadWaitBit),
    .io_dispatch_0_bits_cf_loadWaitStrict(ctrlBlock_io_dispatch_0_bits_cf_loadWaitStrict),
    .io_dispatch_0_bits_cf_ssid(ctrlBlock_io_dispatch_0_bits_cf_ssid),
    .io_dispatch_0_bits_cf_ftqPtr_flag(ctrlBlock_io_dispatch_0_bits_cf_ftqPtr_flag),
    .io_dispatch_0_bits_cf_ftqPtr_value(ctrlBlock_io_dispatch_0_bits_cf_ftqPtr_value),
    .io_dispatch_0_bits_cf_ftqOffset(ctrlBlock_io_dispatch_0_bits_cf_ftqOffset),
    .io_dispatch_0_bits_ctrl_srcType_0(ctrlBlock_io_dispatch_0_bits_ctrl_srcType_0),
    .io_dispatch_0_bits_ctrl_srcType_1(ctrlBlock_io_dispatch_0_bits_ctrl_srcType_1),
    .io_dispatch_0_bits_ctrl_fuType(ctrlBlock_io_dispatch_0_bits_ctrl_fuType),
    .io_dispatch_0_bits_ctrl_fuOpType(ctrlBlock_io_dispatch_0_bits_ctrl_fuOpType),
    .io_dispatch_0_bits_ctrl_rfWen(ctrlBlock_io_dispatch_0_bits_ctrl_rfWen),
    .io_dispatch_0_bits_ctrl_fpWen(ctrlBlock_io_dispatch_0_bits_ctrl_fpWen),
    .io_dispatch_0_bits_ctrl_selImm(ctrlBlock_io_dispatch_0_bits_ctrl_selImm),
    .io_dispatch_0_bits_ctrl_imm(ctrlBlock_io_dispatch_0_bits_ctrl_imm),
    .io_dispatch_0_bits_ctrl_fpu_isAddSub(ctrlBlock_io_dispatch_0_bits_ctrl_fpu_isAddSub),
    .io_dispatch_0_bits_ctrl_fpu_typeTagIn(ctrlBlock_io_dispatch_0_bits_ctrl_fpu_typeTagIn),
    .io_dispatch_0_bits_ctrl_fpu_typeTagOut(ctrlBlock_io_dispatch_0_bits_ctrl_fpu_typeTagOut),
    .io_dispatch_0_bits_ctrl_fpu_fromInt(ctrlBlock_io_dispatch_0_bits_ctrl_fpu_fromInt),
    .io_dispatch_0_bits_ctrl_fpu_wflags(ctrlBlock_io_dispatch_0_bits_ctrl_fpu_wflags),
    .io_dispatch_0_bits_ctrl_fpu_fpWen(ctrlBlock_io_dispatch_0_bits_ctrl_fpu_fpWen),
    .io_dispatch_0_bits_ctrl_fpu_fmaCmd(ctrlBlock_io_dispatch_0_bits_ctrl_fpu_fmaCmd),
    .io_dispatch_0_bits_ctrl_fpu_div(ctrlBlock_io_dispatch_0_bits_ctrl_fpu_div),
    .io_dispatch_0_bits_ctrl_fpu_sqrt(ctrlBlock_io_dispatch_0_bits_ctrl_fpu_sqrt),
    .io_dispatch_0_bits_ctrl_fpu_fcvt(ctrlBlock_io_dispatch_0_bits_ctrl_fpu_fcvt),
    .io_dispatch_0_bits_ctrl_fpu_typ(ctrlBlock_io_dispatch_0_bits_ctrl_fpu_typ),
    .io_dispatch_0_bits_ctrl_fpu_fmt(ctrlBlock_io_dispatch_0_bits_ctrl_fpu_fmt),
    .io_dispatch_0_bits_ctrl_fpu_ren3(ctrlBlock_io_dispatch_0_bits_ctrl_fpu_ren3),
    .io_dispatch_0_bits_ctrl_fpu_rm(ctrlBlock_io_dispatch_0_bits_ctrl_fpu_rm),
    .io_dispatch_0_bits_psrc_0(ctrlBlock_io_dispatch_0_bits_psrc_0),
    .io_dispatch_0_bits_psrc_1(ctrlBlock_io_dispatch_0_bits_psrc_1),
    .io_dispatch_0_bits_pdest(ctrlBlock_io_dispatch_0_bits_pdest),
    .io_dispatch_0_bits_robIdx_flag(ctrlBlock_io_dispatch_0_bits_robIdx_flag),
    .io_dispatch_0_bits_robIdx_value(ctrlBlock_io_dispatch_0_bits_robIdx_value),
    .io_dispatch_0_bits_lqIdx_flag(ctrlBlock_io_dispatch_0_bits_lqIdx_flag),
    .io_dispatch_0_bits_lqIdx_value(ctrlBlock_io_dispatch_0_bits_lqIdx_value),
    .io_dispatch_0_bits_sqIdx_flag(ctrlBlock_io_dispatch_0_bits_sqIdx_flag),
    .io_dispatch_0_bits_sqIdx_value(ctrlBlock_io_dispatch_0_bits_sqIdx_value),
    .io_dispatch_1_valid(ctrlBlock_io_dispatch_1_valid),
    .io_dispatch_1_bits_cf_foldpc(ctrlBlock_io_dispatch_1_bits_cf_foldpc),
    .io_dispatch_1_bits_cf_trigger_backendEn_0(ctrlBlock_io_dispatch_1_bits_cf_trigger_backendEn_0),
    .io_dispatch_1_bits_cf_trigger_backendEn_1(ctrlBlock_io_dispatch_1_bits_cf_trigger_backendEn_1),
    .io_dispatch_1_bits_cf_pd_isRVC(ctrlBlock_io_dispatch_1_bits_cf_pd_isRVC),
    .io_dispatch_1_bits_cf_pd_brType(ctrlBlock_io_dispatch_1_bits_cf_pd_brType),
    .io_dispatch_1_bits_cf_pd_isCall(ctrlBlock_io_dispatch_1_bits_cf_pd_isCall),
    .io_dispatch_1_bits_cf_pd_isRet(ctrlBlock_io_dispatch_1_bits_cf_pd_isRet),
    .io_dispatch_1_bits_cf_pred_taken(ctrlBlock_io_dispatch_1_bits_cf_pred_taken),
    .io_dispatch_1_bits_cf_storeSetHit(ctrlBlock_io_dispatch_1_bits_cf_storeSetHit),
    .io_dispatch_1_bits_cf_waitForRobIdx_flag(ctrlBlock_io_dispatch_1_bits_cf_waitForRobIdx_flag),
    .io_dispatch_1_bits_cf_waitForRobIdx_value(ctrlBlock_io_dispatch_1_bits_cf_waitForRobIdx_value),
    .io_dispatch_1_bits_cf_loadWaitBit(ctrlBlock_io_dispatch_1_bits_cf_loadWaitBit),
    .io_dispatch_1_bits_cf_loadWaitStrict(ctrlBlock_io_dispatch_1_bits_cf_loadWaitStrict),
    .io_dispatch_1_bits_cf_ssid(ctrlBlock_io_dispatch_1_bits_cf_ssid),
    .io_dispatch_1_bits_cf_ftqPtr_flag(ctrlBlock_io_dispatch_1_bits_cf_ftqPtr_flag),
    .io_dispatch_1_bits_cf_ftqPtr_value(ctrlBlock_io_dispatch_1_bits_cf_ftqPtr_value),
    .io_dispatch_1_bits_cf_ftqOffset(ctrlBlock_io_dispatch_1_bits_cf_ftqOffset),
    .io_dispatch_1_bits_ctrl_srcType_0(ctrlBlock_io_dispatch_1_bits_ctrl_srcType_0),
    .io_dispatch_1_bits_ctrl_srcType_1(ctrlBlock_io_dispatch_1_bits_ctrl_srcType_1),
    .io_dispatch_1_bits_ctrl_fuType(ctrlBlock_io_dispatch_1_bits_ctrl_fuType),
    .io_dispatch_1_bits_ctrl_fuOpType(ctrlBlock_io_dispatch_1_bits_ctrl_fuOpType),
    .io_dispatch_1_bits_ctrl_rfWen(ctrlBlock_io_dispatch_1_bits_ctrl_rfWen),
    .io_dispatch_1_bits_ctrl_fpWen(ctrlBlock_io_dispatch_1_bits_ctrl_fpWen),
    .io_dispatch_1_bits_ctrl_selImm(ctrlBlock_io_dispatch_1_bits_ctrl_selImm),
    .io_dispatch_1_bits_ctrl_imm(ctrlBlock_io_dispatch_1_bits_ctrl_imm),
    .io_dispatch_1_bits_psrc_0(ctrlBlock_io_dispatch_1_bits_psrc_0),
    .io_dispatch_1_bits_psrc_1(ctrlBlock_io_dispatch_1_bits_psrc_1),
    .io_dispatch_1_bits_pdest(ctrlBlock_io_dispatch_1_bits_pdest),
    .io_dispatch_1_bits_robIdx_flag(ctrlBlock_io_dispatch_1_bits_robIdx_flag),
    .io_dispatch_1_bits_robIdx_value(ctrlBlock_io_dispatch_1_bits_robIdx_value),
    .io_dispatch_1_bits_lqIdx_flag(ctrlBlock_io_dispatch_1_bits_lqIdx_flag),
    .io_dispatch_1_bits_lqIdx_value(ctrlBlock_io_dispatch_1_bits_lqIdx_value),
    .io_dispatch_1_bits_sqIdx_flag(ctrlBlock_io_dispatch_1_bits_sqIdx_flag),
    .io_dispatch_1_bits_sqIdx_value(ctrlBlock_io_dispatch_1_bits_sqIdx_value),
    .io_dispatch_4_valid(ctrlBlock_io_dispatch_4_valid),
    .io_dispatch_4_bits_cf_foldpc(ctrlBlock_io_dispatch_4_bits_cf_foldpc),
    .io_dispatch_4_bits_cf_trigger_backendEn_0(ctrlBlock_io_dispatch_4_bits_cf_trigger_backendEn_0),
    .io_dispatch_4_bits_cf_trigger_backendEn_1(ctrlBlock_io_dispatch_4_bits_cf_trigger_backendEn_1),
    .io_dispatch_4_bits_cf_pd_isRVC(ctrlBlock_io_dispatch_4_bits_cf_pd_isRVC),
    .io_dispatch_4_bits_cf_pd_brType(ctrlBlock_io_dispatch_4_bits_cf_pd_brType),
    .io_dispatch_4_bits_cf_pd_isCall(ctrlBlock_io_dispatch_4_bits_cf_pd_isCall),
    .io_dispatch_4_bits_cf_pd_isRet(ctrlBlock_io_dispatch_4_bits_cf_pd_isRet),
    .io_dispatch_4_bits_cf_pred_taken(ctrlBlock_io_dispatch_4_bits_cf_pred_taken),
    .io_dispatch_4_bits_cf_storeSetHit(ctrlBlock_io_dispatch_4_bits_cf_storeSetHit),
    .io_dispatch_4_bits_cf_waitForRobIdx_flag(ctrlBlock_io_dispatch_4_bits_cf_waitForRobIdx_flag),
    .io_dispatch_4_bits_cf_waitForRobIdx_value(ctrlBlock_io_dispatch_4_bits_cf_waitForRobIdx_value),
    .io_dispatch_4_bits_cf_loadWaitBit(ctrlBlock_io_dispatch_4_bits_cf_loadWaitBit),
    .io_dispatch_4_bits_cf_loadWaitStrict(ctrlBlock_io_dispatch_4_bits_cf_loadWaitStrict),
    .io_dispatch_4_bits_cf_ssid(ctrlBlock_io_dispatch_4_bits_cf_ssid),
    .io_dispatch_4_bits_cf_ftqPtr_flag(ctrlBlock_io_dispatch_4_bits_cf_ftqPtr_flag),
    .io_dispatch_4_bits_cf_ftqPtr_value(ctrlBlock_io_dispatch_4_bits_cf_ftqPtr_value),
    .io_dispatch_4_bits_cf_ftqOffset(ctrlBlock_io_dispatch_4_bits_cf_ftqOffset),
    .io_dispatch_4_bits_ctrl_srcType_0(ctrlBlock_io_dispatch_4_bits_ctrl_srcType_0),
    .io_dispatch_4_bits_ctrl_srcType_1(ctrlBlock_io_dispatch_4_bits_ctrl_srcType_1),
    .io_dispatch_4_bits_ctrl_fuType(ctrlBlock_io_dispatch_4_bits_ctrl_fuType),
    .io_dispatch_4_bits_ctrl_fuOpType(ctrlBlock_io_dispatch_4_bits_ctrl_fuOpType),
    .io_dispatch_4_bits_ctrl_rfWen(ctrlBlock_io_dispatch_4_bits_ctrl_rfWen),
    .io_dispatch_4_bits_ctrl_fpWen(ctrlBlock_io_dispatch_4_bits_ctrl_fpWen),
    .io_dispatch_4_bits_ctrl_flushPipe(ctrlBlock_io_dispatch_4_bits_ctrl_flushPipe),
    .io_dispatch_4_bits_ctrl_imm(ctrlBlock_io_dispatch_4_bits_ctrl_imm),
    .io_dispatch_4_bits_ctrl_replayInst(ctrlBlock_io_dispatch_4_bits_ctrl_replayInst),
    .io_dispatch_4_bits_psrc_0(ctrlBlock_io_dispatch_4_bits_psrc_0),
    .io_dispatch_4_bits_psrc_1(ctrlBlock_io_dispatch_4_bits_psrc_1),
    .io_dispatch_4_bits_pdest(ctrlBlock_io_dispatch_4_bits_pdest),
    .io_dispatch_4_bits_robIdx_flag(ctrlBlock_io_dispatch_4_bits_robIdx_flag),
    .io_dispatch_4_bits_robIdx_value(ctrlBlock_io_dispatch_4_bits_robIdx_value),
    .io_dispatch_5_valid(ctrlBlock_io_dispatch_5_valid),
    .io_dispatch_5_bits_cf_foldpc(ctrlBlock_io_dispatch_5_bits_cf_foldpc),
    .io_dispatch_5_bits_cf_trigger_backendEn_0(ctrlBlock_io_dispatch_5_bits_cf_trigger_backendEn_0),
    .io_dispatch_5_bits_cf_trigger_backendEn_1(ctrlBlock_io_dispatch_5_bits_cf_trigger_backendEn_1),
    .io_dispatch_5_bits_cf_pd_isRVC(ctrlBlock_io_dispatch_5_bits_cf_pd_isRVC),
    .io_dispatch_5_bits_cf_pd_brType(ctrlBlock_io_dispatch_5_bits_cf_pd_brType),
    .io_dispatch_5_bits_cf_pd_isCall(ctrlBlock_io_dispatch_5_bits_cf_pd_isCall),
    .io_dispatch_5_bits_cf_pd_isRet(ctrlBlock_io_dispatch_5_bits_cf_pd_isRet),
    .io_dispatch_5_bits_cf_pred_taken(ctrlBlock_io_dispatch_5_bits_cf_pred_taken),
    .io_dispatch_5_bits_cf_storeSetHit(ctrlBlock_io_dispatch_5_bits_cf_storeSetHit),
    .io_dispatch_5_bits_cf_waitForRobIdx_flag(ctrlBlock_io_dispatch_5_bits_cf_waitForRobIdx_flag),
    .io_dispatch_5_bits_cf_waitForRobIdx_value(ctrlBlock_io_dispatch_5_bits_cf_waitForRobIdx_value),
    .io_dispatch_5_bits_cf_loadWaitBit(ctrlBlock_io_dispatch_5_bits_cf_loadWaitBit),
    .io_dispatch_5_bits_cf_loadWaitStrict(ctrlBlock_io_dispatch_5_bits_cf_loadWaitStrict),
    .io_dispatch_5_bits_cf_ssid(ctrlBlock_io_dispatch_5_bits_cf_ssid),
    .io_dispatch_5_bits_cf_ftqPtr_flag(ctrlBlock_io_dispatch_5_bits_cf_ftqPtr_flag),
    .io_dispatch_5_bits_cf_ftqPtr_value(ctrlBlock_io_dispatch_5_bits_cf_ftqPtr_value),
    .io_dispatch_5_bits_cf_ftqOffset(ctrlBlock_io_dispatch_5_bits_cf_ftqOffset),
    .io_dispatch_5_bits_ctrl_srcType_0(ctrlBlock_io_dispatch_5_bits_ctrl_srcType_0),
    .io_dispatch_5_bits_ctrl_srcType_1(ctrlBlock_io_dispatch_5_bits_ctrl_srcType_1),
    .io_dispatch_5_bits_ctrl_fuType(ctrlBlock_io_dispatch_5_bits_ctrl_fuType),
    .io_dispatch_5_bits_ctrl_fuOpType(ctrlBlock_io_dispatch_5_bits_ctrl_fuOpType),
    .io_dispatch_5_bits_ctrl_rfWen(ctrlBlock_io_dispatch_5_bits_ctrl_rfWen),
    .io_dispatch_5_bits_ctrl_fpWen(ctrlBlock_io_dispatch_5_bits_ctrl_fpWen),
    .io_dispatch_5_bits_ctrl_flushPipe(ctrlBlock_io_dispatch_5_bits_ctrl_flushPipe),
    .io_dispatch_5_bits_ctrl_imm(ctrlBlock_io_dispatch_5_bits_ctrl_imm),
    .io_dispatch_5_bits_ctrl_replayInst(ctrlBlock_io_dispatch_5_bits_ctrl_replayInst),
    .io_dispatch_5_bits_psrc_0(ctrlBlock_io_dispatch_5_bits_psrc_0),
    .io_dispatch_5_bits_psrc_1(ctrlBlock_io_dispatch_5_bits_psrc_1),
    .io_dispatch_5_bits_pdest(ctrlBlock_io_dispatch_5_bits_pdest),
    .io_dispatch_5_bits_robIdx_flag(ctrlBlock_io_dispatch_5_bits_robIdx_flag),
    .io_dispatch_5_bits_robIdx_value(ctrlBlock_io_dispatch_5_bits_robIdx_value),
    .io_dispatch_6_valid(ctrlBlock_io_dispatch_6_valid),
    .io_dispatch_6_bits_cf_foldpc(ctrlBlock_io_dispatch_6_bits_cf_foldpc),
    .io_dispatch_6_bits_cf_trigger_backendEn_0(ctrlBlock_io_dispatch_6_bits_cf_trigger_backendEn_0),
    .io_dispatch_6_bits_cf_trigger_backendEn_1(ctrlBlock_io_dispatch_6_bits_cf_trigger_backendEn_1),
    .io_dispatch_6_bits_cf_pd_isRVC(ctrlBlock_io_dispatch_6_bits_cf_pd_isRVC),
    .io_dispatch_6_bits_cf_pd_brType(ctrlBlock_io_dispatch_6_bits_cf_pd_brType),
    .io_dispatch_6_bits_cf_pd_isCall(ctrlBlock_io_dispatch_6_bits_cf_pd_isCall),
    .io_dispatch_6_bits_cf_pd_isRet(ctrlBlock_io_dispatch_6_bits_cf_pd_isRet),
    .io_dispatch_6_bits_cf_pred_taken(ctrlBlock_io_dispatch_6_bits_cf_pred_taken),
    .io_dispatch_6_bits_cf_storeSetHit(ctrlBlock_io_dispatch_6_bits_cf_storeSetHit),
    .io_dispatch_6_bits_cf_waitForRobIdx_flag(ctrlBlock_io_dispatch_6_bits_cf_waitForRobIdx_flag),
    .io_dispatch_6_bits_cf_waitForRobIdx_value(ctrlBlock_io_dispatch_6_bits_cf_waitForRobIdx_value),
    .io_dispatch_6_bits_cf_loadWaitBit(ctrlBlock_io_dispatch_6_bits_cf_loadWaitBit),
    .io_dispatch_6_bits_cf_loadWaitStrict(ctrlBlock_io_dispatch_6_bits_cf_loadWaitStrict),
    .io_dispatch_6_bits_cf_ssid(ctrlBlock_io_dispatch_6_bits_cf_ssid),
    .io_dispatch_6_bits_cf_ftqPtr_flag(ctrlBlock_io_dispatch_6_bits_cf_ftqPtr_flag),
    .io_dispatch_6_bits_cf_ftqPtr_value(ctrlBlock_io_dispatch_6_bits_cf_ftqPtr_value),
    .io_dispatch_6_bits_cf_ftqOffset(ctrlBlock_io_dispatch_6_bits_cf_ftqOffset),
    .io_dispatch_6_bits_ctrl_srcType_0(ctrlBlock_io_dispatch_6_bits_ctrl_srcType_0),
    .io_dispatch_6_bits_ctrl_srcType_1(ctrlBlock_io_dispatch_6_bits_ctrl_srcType_1),
    .io_dispatch_6_bits_ctrl_fuType(ctrlBlock_io_dispatch_6_bits_ctrl_fuType),
    .io_dispatch_6_bits_ctrl_fuOpType(ctrlBlock_io_dispatch_6_bits_ctrl_fuOpType),
    .io_dispatch_6_bits_ctrl_rfWen(ctrlBlock_io_dispatch_6_bits_ctrl_rfWen),
    .io_dispatch_6_bits_ctrl_fpWen(ctrlBlock_io_dispatch_6_bits_ctrl_fpWen),
    .io_dispatch_6_bits_ctrl_flushPipe(ctrlBlock_io_dispatch_6_bits_ctrl_flushPipe),
    .io_dispatch_6_bits_ctrl_imm(ctrlBlock_io_dispatch_6_bits_ctrl_imm),
    .io_dispatch_6_bits_ctrl_replayInst(ctrlBlock_io_dispatch_6_bits_ctrl_replayInst),
    .io_dispatch_6_bits_psrc_0(ctrlBlock_io_dispatch_6_bits_psrc_0),
    .io_dispatch_6_bits_psrc_1(ctrlBlock_io_dispatch_6_bits_psrc_1),
    .io_dispatch_6_bits_pdest(ctrlBlock_io_dispatch_6_bits_pdest),
    .io_dispatch_6_bits_robIdx_flag(ctrlBlock_io_dispatch_6_bits_robIdx_flag),
    .io_dispatch_6_bits_robIdx_value(ctrlBlock_io_dispatch_6_bits_robIdx_value),
    .io_dispatch_7_valid(ctrlBlock_io_dispatch_7_valid),
    .io_dispatch_7_bits_cf_foldpc(ctrlBlock_io_dispatch_7_bits_cf_foldpc),
    .io_dispatch_7_bits_cf_trigger_backendEn_0(ctrlBlock_io_dispatch_7_bits_cf_trigger_backendEn_0),
    .io_dispatch_7_bits_cf_trigger_backendEn_1(ctrlBlock_io_dispatch_7_bits_cf_trigger_backendEn_1),
    .io_dispatch_7_bits_cf_pd_isRVC(ctrlBlock_io_dispatch_7_bits_cf_pd_isRVC),
    .io_dispatch_7_bits_cf_pd_brType(ctrlBlock_io_dispatch_7_bits_cf_pd_brType),
    .io_dispatch_7_bits_cf_pd_isCall(ctrlBlock_io_dispatch_7_bits_cf_pd_isCall),
    .io_dispatch_7_bits_cf_pd_isRet(ctrlBlock_io_dispatch_7_bits_cf_pd_isRet),
    .io_dispatch_7_bits_cf_pred_taken(ctrlBlock_io_dispatch_7_bits_cf_pred_taken),
    .io_dispatch_7_bits_cf_storeSetHit(ctrlBlock_io_dispatch_7_bits_cf_storeSetHit),
    .io_dispatch_7_bits_cf_waitForRobIdx_flag(ctrlBlock_io_dispatch_7_bits_cf_waitForRobIdx_flag),
    .io_dispatch_7_bits_cf_waitForRobIdx_value(ctrlBlock_io_dispatch_7_bits_cf_waitForRobIdx_value),
    .io_dispatch_7_bits_cf_loadWaitBit(ctrlBlock_io_dispatch_7_bits_cf_loadWaitBit),
    .io_dispatch_7_bits_cf_loadWaitStrict(ctrlBlock_io_dispatch_7_bits_cf_loadWaitStrict),
    .io_dispatch_7_bits_cf_ssid(ctrlBlock_io_dispatch_7_bits_cf_ssid),
    .io_dispatch_7_bits_cf_ftqPtr_flag(ctrlBlock_io_dispatch_7_bits_cf_ftqPtr_flag),
    .io_dispatch_7_bits_cf_ftqPtr_value(ctrlBlock_io_dispatch_7_bits_cf_ftqPtr_value),
    .io_dispatch_7_bits_cf_ftqOffset(ctrlBlock_io_dispatch_7_bits_cf_ftqOffset),
    .io_dispatch_7_bits_ctrl_srcType_0(ctrlBlock_io_dispatch_7_bits_ctrl_srcType_0),
    .io_dispatch_7_bits_ctrl_srcType_1(ctrlBlock_io_dispatch_7_bits_ctrl_srcType_1),
    .io_dispatch_7_bits_ctrl_fuType(ctrlBlock_io_dispatch_7_bits_ctrl_fuType),
    .io_dispatch_7_bits_ctrl_fuOpType(ctrlBlock_io_dispatch_7_bits_ctrl_fuOpType),
    .io_dispatch_7_bits_ctrl_rfWen(ctrlBlock_io_dispatch_7_bits_ctrl_rfWen),
    .io_dispatch_7_bits_ctrl_fpWen(ctrlBlock_io_dispatch_7_bits_ctrl_fpWen),
    .io_dispatch_7_bits_ctrl_flushPipe(ctrlBlock_io_dispatch_7_bits_ctrl_flushPipe),
    .io_dispatch_7_bits_ctrl_imm(ctrlBlock_io_dispatch_7_bits_ctrl_imm),
    .io_dispatch_7_bits_ctrl_replayInst(ctrlBlock_io_dispatch_7_bits_ctrl_replayInst),
    .io_dispatch_7_bits_psrc_0(ctrlBlock_io_dispatch_7_bits_psrc_0),
    .io_dispatch_7_bits_psrc_1(ctrlBlock_io_dispatch_7_bits_psrc_1),
    .io_dispatch_7_bits_pdest(ctrlBlock_io_dispatch_7_bits_pdest),
    .io_dispatch_7_bits_robIdx_flag(ctrlBlock_io_dispatch_7_bits_robIdx_flag),
    .io_dispatch_7_bits_robIdx_value(ctrlBlock_io_dispatch_7_bits_robIdx_value),
    .io_dispatch_8_valid(ctrlBlock_io_dispatch_8_valid),
    .io_dispatch_8_bits_cf_pd_isRVC(ctrlBlock_io_dispatch_8_bits_cf_pd_isRVC),
    .io_dispatch_8_bits_cf_pd_brType(ctrlBlock_io_dispatch_8_bits_cf_pd_brType),
    .io_dispatch_8_bits_cf_pd_isCall(ctrlBlock_io_dispatch_8_bits_cf_pd_isCall),
    .io_dispatch_8_bits_cf_pd_isRet(ctrlBlock_io_dispatch_8_bits_cf_pd_isRet),
    .io_dispatch_8_bits_cf_pred_taken(ctrlBlock_io_dispatch_8_bits_cf_pred_taken),
    .io_dispatch_8_bits_cf_ftqPtr_flag(ctrlBlock_io_dispatch_8_bits_cf_ftqPtr_flag),
    .io_dispatch_8_bits_cf_ftqPtr_value(ctrlBlock_io_dispatch_8_bits_cf_ftqPtr_value),
    .io_dispatch_8_bits_cf_ftqOffset(ctrlBlock_io_dispatch_8_bits_cf_ftqOffset),
    .io_dispatch_8_bits_ctrl_srcType_0(ctrlBlock_io_dispatch_8_bits_ctrl_srcType_0),
    .io_dispatch_8_bits_ctrl_srcType_1(ctrlBlock_io_dispatch_8_bits_ctrl_srcType_1),
    .io_dispatch_8_bits_ctrl_srcType_2(ctrlBlock_io_dispatch_8_bits_ctrl_srcType_2),
    .io_dispatch_8_bits_ctrl_fuType(ctrlBlock_io_dispatch_8_bits_ctrl_fuType),
    .io_dispatch_8_bits_ctrl_fuOpType(ctrlBlock_io_dispatch_8_bits_ctrl_fuOpType),
    .io_dispatch_8_bits_ctrl_rfWen(ctrlBlock_io_dispatch_8_bits_ctrl_rfWen),
    .io_dispatch_8_bits_ctrl_fpWen(ctrlBlock_io_dispatch_8_bits_ctrl_fpWen),
    .io_dispatch_8_bits_ctrl_imm(ctrlBlock_io_dispatch_8_bits_ctrl_imm),
    .io_dispatch_8_bits_ctrl_fpu_isAddSub(ctrlBlock_io_dispatch_8_bits_ctrl_fpu_isAddSub),
    .io_dispatch_8_bits_ctrl_fpu_typeTagIn(ctrlBlock_io_dispatch_8_bits_ctrl_fpu_typeTagIn),
    .io_dispatch_8_bits_ctrl_fpu_typeTagOut(ctrlBlock_io_dispatch_8_bits_ctrl_fpu_typeTagOut),
    .io_dispatch_8_bits_ctrl_fpu_fromInt(ctrlBlock_io_dispatch_8_bits_ctrl_fpu_fromInt),
    .io_dispatch_8_bits_ctrl_fpu_wflags(ctrlBlock_io_dispatch_8_bits_ctrl_fpu_wflags),
    .io_dispatch_8_bits_ctrl_fpu_fpWen(ctrlBlock_io_dispatch_8_bits_ctrl_fpu_fpWen),
    .io_dispatch_8_bits_ctrl_fpu_fmaCmd(ctrlBlock_io_dispatch_8_bits_ctrl_fpu_fmaCmd),
    .io_dispatch_8_bits_ctrl_fpu_div(ctrlBlock_io_dispatch_8_bits_ctrl_fpu_div),
    .io_dispatch_8_bits_ctrl_fpu_sqrt(ctrlBlock_io_dispatch_8_bits_ctrl_fpu_sqrt),
    .io_dispatch_8_bits_ctrl_fpu_fcvt(ctrlBlock_io_dispatch_8_bits_ctrl_fpu_fcvt),
    .io_dispatch_8_bits_ctrl_fpu_typ(ctrlBlock_io_dispatch_8_bits_ctrl_fpu_typ),
    .io_dispatch_8_bits_ctrl_fpu_fmt(ctrlBlock_io_dispatch_8_bits_ctrl_fpu_fmt),
    .io_dispatch_8_bits_ctrl_fpu_ren3(ctrlBlock_io_dispatch_8_bits_ctrl_fpu_ren3),
    .io_dispatch_8_bits_ctrl_fpu_rm(ctrlBlock_io_dispatch_8_bits_ctrl_fpu_rm),
    .io_dispatch_8_bits_psrc_0(ctrlBlock_io_dispatch_8_bits_psrc_0),
    .io_dispatch_8_bits_psrc_1(ctrlBlock_io_dispatch_8_bits_psrc_1),
    .io_dispatch_8_bits_psrc_2(ctrlBlock_io_dispatch_8_bits_psrc_2),
    .io_dispatch_8_bits_pdest(ctrlBlock_io_dispatch_8_bits_pdest),
    .io_dispatch_8_bits_robIdx_flag(ctrlBlock_io_dispatch_8_bits_robIdx_flag),
    .io_dispatch_8_bits_robIdx_value(ctrlBlock_io_dispatch_8_bits_robIdx_value),
    .io_rsReady_0(ctrlBlock_io_rsReady_0),
    .io_rsReady_1(ctrlBlock_io_rsReady_1),
    .io_rsReady_2(ctrlBlock_io_rsReady_2),
    .io_rsReady_3(ctrlBlock_io_rsReady_3),
    .io_rsReady_4(ctrlBlock_io_rsReady_4),
    .io_rsReady_5(ctrlBlock_io_rsReady_5),
    .io_rsReady_6(ctrlBlock_io_rsReady_6),
    .io_rsReady_7(ctrlBlock_io_rsReady_7),
    .io_rsReady_8(ctrlBlock_io_rsReady_8),
    .io_enqLsq_needAlloc_0(ctrlBlock_io_enqLsq_needAlloc_0),
    .io_enqLsq_needAlloc_1(ctrlBlock_io_enqLsq_needAlloc_1),
    .io_enqLsq_needAlloc_2(ctrlBlock_io_enqLsq_needAlloc_2),
    .io_enqLsq_needAlloc_3(ctrlBlock_io_enqLsq_needAlloc_3),
    .io_enqLsq_req_0_valid(ctrlBlock_io_enqLsq_req_0_valid),
    .io_enqLsq_req_0_bits_cf_trigger_backendEn_0(ctrlBlock_io_enqLsq_req_0_bits_cf_trigger_backendEn_0),
    .io_enqLsq_req_0_bits_cf_trigger_backendEn_1(ctrlBlock_io_enqLsq_req_0_bits_cf_trigger_backendEn_1),
    .io_enqLsq_req_0_bits_ctrl_fuOpType(ctrlBlock_io_enqLsq_req_0_bits_ctrl_fuOpType),
    .io_enqLsq_req_0_bits_ctrl_rfWen(ctrlBlock_io_enqLsq_req_0_bits_ctrl_rfWen),
    .io_enqLsq_req_0_bits_ctrl_fpWen(ctrlBlock_io_enqLsq_req_0_bits_ctrl_fpWen),
    .io_enqLsq_req_0_bits_ctrl_flushPipe(ctrlBlock_io_enqLsq_req_0_bits_ctrl_flushPipe),
    .io_enqLsq_req_0_bits_ctrl_replayInst(ctrlBlock_io_enqLsq_req_0_bits_ctrl_replayInst),
    .io_enqLsq_req_0_bits_pdest(ctrlBlock_io_enqLsq_req_0_bits_pdest),
    .io_enqLsq_req_0_bits_robIdx_flag(ctrlBlock_io_enqLsq_req_0_bits_robIdx_flag),
    .io_enqLsq_req_0_bits_robIdx_value(ctrlBlock_io_enqLsq_req_0_bits_robIdx_value),
    .io_enqLsq_req_0_bits_lqIdx_value(ctrlBlock_io_enqLsq_req_0_bits_lqIdx_value),
    .io_enqLsq_req_0_bits_sqIdx_value(ctrlBlock_io_enqLsq_req_0_bits_sqIdx_value),
    .io_enqLsq_req_1_valid(ctrlBlock_io_enqLsq_req_1_valid),
    .io_enqLsq_req_1_bits_cf_trigger_backendEn_0(ctrlBlock_io_enqLsq_req_1_bits_cf_trigger_backendEn_0),
    .io_enqLsq_req_1_bits_cf_trigger_backendEn_1(ctrlBlock_io_enqLsq_req_1_bits_cf_trigger_backendEn_1),
    .io_enqLsq_req_1_bits_ctrl_fuOpType(ctrlBlock_io_enqLsq_req_1_bits_ctrl_fuOpType),
    .io_enqLsq_req_1_bits_ctrl_rfWen(ctrlBlock_io_enqLsq_req_1_bits_ctrl_rfWen),
    .io_enqLsq_req_1_bits_ctrl_fpWen(ctrlBlock_io_enqLsq_req_1_bits_ctrl_fpWen),
    .io_enqLsq_req_1_bits_ctrl_flushPipe(ctrlBlock_io_enqLsq_req_1_bits_ctrl_flushPipe),
    .io_enqLsq_req_1_bits_ctrl_replayInst(ctrlBlock_io_enqLsq_req_1_bits_ctrl_replayInst),
    .io_enqLsq_req_1_bits_pdest(ctrlBlock_io_enqLsq_req_1_bits_pdest),
    .io_enqLsq_req_1_bits_robIdx_flag(ctrlBlock_io_enqLsq_req_1_bits_robIdx_flag),
    .io_enqLsq_req_1_bits_robIdx_value(ctrlBlock_io_enqLsq_req_1_bits_robIdx_value),
    .io_enqLsq_req_1_bits_lqIdx_value(ctrlBlock_io_enqLsq_req_1_bits_lqIdx_value),
    .io_enqLsq_req_1_bits_sqIdx_value(ctrlBlock_io_enqLsq_req_1_bits_sqIdx_value),
    .io_enqLsq_req_2_valid(ctrlBlock_io_enqLsq_req_2_valid),
    .io_enqLsq_req_2_bits_cf_trigger_backendEn_0(ctrlBlock_io_enqLsq_req_2_bits_cf_trigger_backendEn_0),
    .io_enqLsq_req_2_bits_cf_trigger_backendEn_1(ctrlBlock_io_enqLsq_req_2_bits_cf_trigger_backendEn_1),
    .io_enqLsq_req_2_bits_ctrl_fuOpType(ctrlBlock_io_enqLsq_req_2_bits_ctrl_fuOpType),
    .io_enqLsq_req_2_bits_ctrl_rfWen(ctrlBlock_io_enqLsq_req_2_bits_ctrl_rfWen),
    .io_enqLsq_req_2_bits_ctrl_fpWen(ctrlBlock_io_enqLsq_req_2_bits_ctrl_fpWen),
    .io_enqLsq_req_2_bits_ctrl_flushPipe(ctrlBlock_io_enqLsq_req_2_bits_ctrl_flushPipe),
    .io_enqLsq_req_2_bits_ctrl_replayInst(ctrlBlock_io_enqLsq_req_2_bits_ctrl_replayInst),
    .io_enqLsq_req_2_bits_pdest(ctrlBlock_io_enqLsq_req_2_bits_pdest),
    .io_enqLsq_req_2_bits_robIdx_flag(ctrlBlock_io_enqLsq_req_2_bits_robIdx_flag),
    .io_enqLsq_req_2_bits_robIdx_value(ctrlBlock_io_enqLsq_req_2_bits_robIdx_value),
    .io_enqLsq_req_2_bits_lqIdx_value(ctrlBlock_io_enqLsq_req_2_bits_lqIdx_value),
    .io_enqLsq_req_2_bits_sqIdx_value(ctrlBlock_io_enqLsq_req_2_bits_sqIdx_value),
    .io_enqLsq_req_3_valid(ctrlBlock_io_enqLsq_req_3_valid),
    .io_enqLsq_req_3_bits_cf_trigger_backendEn_0(ctrlBlock_io_enqLsq_req_3_bits_cf_trigger_backendEn_0),
    .io_enqLsq_req_3_bits_cf_trigger_backendEn_1(ctrlBlock_io_enqLsq_req_3_bits_cf_trigger_backendEn_1),
    .io_enqLsq_req_3_bits_ctrl_fuOpType(ctrlBlock_io_enqLsq_req_3_bits_ctrl_fuOpType),
    .io_enqLsq_req_3_bits_ctrl_rfWen(ctrlBlock_io_enqLsq_req_3_bits_ctrl_rfWen),
    .io_enqLsq_req_3_bits_ctrl_fpWen(ctrlBlock_io_enqLsq_req_3_bits_ctrl_fpWen),
    .io_enqLsq_req_3_bits_ctrl_flushPipe(ctrlBlock_io_enqLsq_req_3_bits_ctrl_flushPipe),
    .io_enqLsq_req_3_bits_ctrl_replayInst(ctrlBlock_io_enqLsq_req_3_bits_ctrl_replayInst),
    .io_enqLsq_req_3_bits_pdest(ctrlBlock_io_enqLsq_req_3_bits_pdest),
    .io_enqLsq_req_3_bits_robIdx_flag(ctrlBlock_io_enqLsq_req_3_bits_robIdx_flag),
    .io_enqLsq_req_3_bits_robIdx_value(ctrlBlock_io_enqLsq_req_3_bits_robIdx_value),
    .io_enqLsq_req_3_bits_lqIdx_value(ctrlBlock_io_enqLsq_req_3_bits_lqIdx_value),
    .io_enqLsq_req_3_bits_sqIdx_value(ctrlBlock_io_enqLsq_req_3_bits_sqIdx_value),
    .io_lqCancelCnt(ctrlBlock_io_lqCancelCnt),
    .io_sqCancelCnt(ctrlBlock_io_sqCancelCnt),
    .io_lqDeq(ctrlBlock_io_lqDeq),
    .io_sqDeq(ctrlBlock_io_sqDeq),
    .io_exuRedirect_0_valid(ctrlBlock_io_exuRedirect_0_valid),
    .io_exuRedirect_0_bits_uop_cf_pd_isRVC(ctrlBlock_io_exuRedirect_0_bits_uop_cf_pd_isRVC),
    .io_exuRedirect_0_bits_uop_cf_pd_brType(ctrlBlock_io_exuRedirect_0_bits_uop_cf_pd_brType),
    .io_exuRedirect_0_bits_uop_cf_pd_isCall(ctrlBlock_io_exuRedirect_0_bits_uop_cf_pd_isCall),
    .io_exuRedirect_0_bits_uop_cf_pd_isRet(ctrlBlock_io_exuRedirect_0_bits_uop_cf_pd_isRet),
    .io_exuRedirect_0_bits_uop_ctrl_imm(ctrlBlock_io_exuRedirect_0_bits_uop_ctrl_imm),
    .io_exuRedirect_0_bits_uop_robIdx_flag(ctrlBlock_io_exuRedirect_0_bits_uop_robIdx_flag),
    .io_exuRedirect_0_bits_uop_robIdx_value(ctrlBlock_io_exuRedirect_0_bits_uop_robIdx_value),
    .io_exuRedirect_0_bits_redirectValid(ctrlBlock_io_exuRedirect_0_bits_redirectValid),
    .io_exuRedirect_0_bits_redirect_robIdx_flag(ctrlBlock_io_exuRedirect_0_bits_redirect_robIdx_flag),
    .io_exuRedirect_0_bits_redirect_robIdx_value(ctrlBlock_io_exuRedirect_0_bits_redirect_robIdx_value),
    .io_exuRedirect_0_bits_redirect_ftqIdx_flag(ctrlBlock_io_exuRedirect_0_bits_redirect_ftqIdx_flag),
    .io_exuRedirect_0_bits_redirect_ftqIdx_value(ctrlBlock_io_exuRedirect_0_bits_redirect_ftqIdx_value),
    .io_exuRedirect_0_bits_redirect_ftqOffset(ctrlBlock_io_exuRedirect_0_bits_redirect_ftqOffset),
    .io_exuRedirect_0_bits_redirect_cfiUpdate_target(ctrlBlock_io_exuRedirect_0_bits_redirect_cfiUpdate_target),
    .io_exuRedirect_0_bits_redirect_cfiUpdate_isMisPred(ctrlBlock_io_exuRedirect_0_bits_redirect_cfiUpdate_isMisPred),
    .io_exuRedirect_1_valid(ctrlBlock_io_exuRedirect_1_valid),
    .io_exuRedirect_1_bits_uop_cf_pd_isRVC(ctrlBlock_io_exuRedirect_1_bits_uop_cf_pd_isRVC),
    .io_exuRedirect_1_bits_uop_cf_pd_brType(ctrlBlock_io_exuRedirect_1_bits_uop_cf_pd_brType),
    .io_exuRedirect_1_bits_uop_cf_pd_isCall(ctrlBlock_io_exuRedirect_1_bits_uop_cf_pd_isCall),
    .io_exuRedirect_1_bits_uop_cf_pd_isRet(ctrlBlock_io_exuRedirect_1_bits_uop_cf_pd_isRet),
    .io_exuRedirect_1_bits_uop_ctrl_imm(ctrlBlock_io_exuRedirect_1_bits_uop_ctrl_imm),
    .io_exuRedirect_1_bits_uop_robIdx_flag(ctrlBlock_io_exuRedirect_1_bits_uop_robIdx_flag),
    .io_exuRedirect_1_bits_uop_robIdx_value(ctrlBlock_io_exuRedirect_1_bits_uop_robIdx_value),
    .io_exuRedirect_1_bits_redirectValid(ctrlBlock_io_exuRedirect_1_bits_redirectValid),
    .io_exuRedirect_1_bits_redirect_robIdx_flag(ctrlBlock_io_exuRedirect_1_bits_redirect_robIdx_flag),
    .io_exuRedirect_1_bits_redirect_robIdx_value(ctrlBlock_io_exuRedirect_1_bits_redirect_robIdx_value),
    .io_exuRedirect_1_bits_redirect_ftqIdx_flag(ctrlBlock_io_exuRedirect_1_bits_redirect_ftqIdx_flag),
    .io_exuRedirect_1_bits_redirect_ftqIdx_value(ctrlBlock_io_exuRedirect_1_bits_redirect_ftqIdx_value),
    .io_exuRedirect_1_bits_redirect_ftqOffset(ctrlBlock_io_exuRedirect_1_bits_redirect_ftqOffset),
    .io_exuRedirect_1_bits_redirect_cfiUpdate_taken(ctrlBlock_io_exuRedirect_1_bits_redirect_cfiUpdate_taken),
    .io_exuRedirect_1_bits_redirect_cfiUpdate_isMisPred(ctrlBlock_io_exuRedirect_1_bits_redirect_cfiUpdate_isMisPred),
    .io_exuRedirect_2_valid(ctrlBlock_io_exuRedirect_2_valid),
    .io_exuRedirect_2_bits_uop_cf_pd_isRVC(ctrlBlock_io_exuRedirect_2_bits_uop_cf_pd_isRVC),
    .io_exuRedirect_2_bits_uop_cf_pd_brType(ctrlBlock_io_exuRedirect_2_bits_uop_cf_pd_brType),
    .io_exuRedirect_2_bits_uop_cf_pd_isCall(ctrlBlock_io_exuRedirect_2_bits_uop_cf_pd_isCall),
    .io_exuRedirect_2_bits_uop_cf_pd_isRet(ctrlBlock_io_exuRedirect_2_bits_uop_cf_pd_isRet),
    .io_exuRedirect_2_bits_uop_ctrl_imm(ctrlBlock_io_exuRedirect_2_bits_uop_ctrl_imm),
    .io_exuRedirect_2_bits_uop_robIdx_flag(ctrlBlock_io_exuRedirect_2_bits_uop_robIdx_flag),
    .io_exuRedirect_2_bits_uop_robIdx_value(ctrlBlock_io_exuRedirect_2_bits_uop_robIdx_value),
    .io_exuRedirect_2_bits_redirectValid(ctrlBlock_io_exuRedirect_2_bits_redirectValid),
    .io_exuRedirect_2_bits_redirect_robIdx_flag(ctrlBlock_io_exuRedirect_2_bits_redirect_robIdx_flag),
    .io_exuRedirect_2_bits_redirect_robIdx_value(ctrlBlock_io_exuRedirect_2_bits_redirect_robIdx_value),
    .io_exuRedirect_2_bits_redirect_ftqIdx_flag(ctrlBlock_io_exuRedirect_2_bits_redirect_ftqIdx_flag),
    .io_exuRedirect_2_bits_redirect_ftqIdx_value(ctrlBlock_io_exuRedirect_2_bits_redirect_ftqIdx_value),
    .io_exuRedirect_2_bits_redirect_ftqOffset(ctrlBlock_io_exuRedirect_2_bits_redirect_ftqOffset),
    .io_exuRedirect_2_bits_redirect_cfiUpdate_taken(ctrlBlock_io_exuRedirect_2_bits_redirect_cfiUpdate_taken),
    .io_exuRedirect_2_bits_redirect_cfiUpdate_isMisPred(ctrlBlock_io_exuRedirect_2_bits_redirect_cfiUpdate_isMisPred),
    .io_stIn_0_valid(ctrlBlock_io_stIn_0_valid),
    .io_stIn_0_bits_uop_cf_storeSetHit(ctrlBlock_io_stIn_0_bits_uop_cf_storeSetHit),
    .io_stIn_0_bits_uop_cf_ssid(ctrlBlock_io_stIn_0_bits_uop_cf_ssid),
    .io_stIn_0_bits_uop_robIdx_value(ctrlBlock_io_stIn_0_bits_uop_robIdx_value),
    .io_stIn_1_valid(ctrlBlock_io_stIn_1_valid),
    .io_stIn_1_bits_uop_cf_storeSetHit(ctrlBlock_io_stIn_1_bits_uop_cf_storeSetHit),
    .io_stIn_1_bits_uop_cf_ssid(ctrlBlock_io_stIn_1_bits_uop_cf_ssid),
    .io_stIn_1_bits_uop_robIdx_value(ctrlBlock_io_stIn_1_bits_uop_robIdx_value),
    .io_memoryViolation_valid(ctrlBlock_io_memoryViolation_valid),
    .io_memoryViolation_bits_robIdx_flag(ctrlBlock_io_memoryViolation_bits_robIdx_flag),
    .io_memoryViolation_bits_robIdx_value(ctrlBlock_io_memoryViolation_bits_robIdx_value),
    .io_memoryViolation_bits_ftqIdx_flag(ctrlBlock_io_memoryViolation_bits_ftqIdx_flag),
    .io_memoryViolation_bits_ftqIdx_value(ctrlBlock_io_memoryViolation_bits_ftqIdx_value),
    .io_memoryViolation_bits_ftqOffset(ctrlBlock_io_memoryViolation_bits_ftqOffset),
    .io_memoryViolation_bits_stFtqIdx_value(ctrlBlock_io_memoryViolation_bits_stFtqIdx_value),
    .io_memoryViolation_bits_stFtqOffset(ctrlBlock_io_memoryViolation_bits_stFtqOffset),
    .io_jumpPc(ctrlBlock_io_jumpPc),
    .io_jalr_target(ctrlBlock_io_jalr_target),
    .io_robio_toCSR_intrBitSet(ctrlBlock_io_robio_toCSR_intrBitSet),
    .io_robio_toCSR_trapTarget(ctrlBlock_io_robio_toCSR_trapTarget),
    .io_robio_toCSR_isXRet(ctrlBlock_io_robio_toCSR_isXRet),
    .io_robio_toCSR_wfiEvent(ctrlBlock_io_robio_toCSR_wfiEvent),
    .io_robio_toCSR_fflags_valid(ctrlBlock_io_robio_toCSR_fflags_valid),
    .io_robio_toCSR_fflags_bits(ctrlBlock_io_robio_toCSR_fflags_bits),
    .io_robio_toCSR_dirty_fs(ctrlBlock_io_robio_toCSR_dirty_fs),
    .io_robio_toCSR_perfinfo_retiredInstr(ctrlBlock_io_robio_toCSR_perfinfo_retiredInstr),
    .io_robio_exception_valid(ctrlBlock_io_robio_exception_valid),
    .io_robio_exception_bits_uop_cf_pc(ctrlBlock_io_robio_exception_bits_uop_cf_pc),
    .io_robio_exception_bits_uop_cf_exceptionVec_0(ctrlBlock_io_robio_exception_bits_uop_cf_exceptionVec_0),
    .io_robio_exception_bits_uop_cf_exceptionVec_1(ctrlBlock_io_robio_exception_bits_uop_cf_exceptionVec_1),
    .io_robio_exception_bits_uop_cf_exceptionVec_2(ctrlBlock_io_robio_exception_bits_uop_cf_exceptionVec_2),
    .io_robio_exception_bits_uop_cf_exceptionVec_3(ctrlBlock_io_robio_exception_bits_uop_cf_exceptionVec_3),
    .io_robio_exception_bits_uop_cf_exceptionVec_4(ctrlBlock_io_robio_exception_bits_uop_cf_exceptionVec_4),
    .io_robio_exception_bits_uop_cf_exceptionVec_5(ctrlBlock_io_robio_exception_bits_uop_cf_exceptionVec_5),
    .io_robio_exception_bits_uop_cf_exceptionVec_6(ctrlBlock_io_robio_exception_bits_uop_cf_exceptionVec_6),
    .io_robio_exception_bits_uop_cf_exceptionVec_7(ctrlBlock_io_robio_exception_bits_uop_cf_exceptionVec_7),
    .io_robio_exception_bits_uop_cf_exceptionVec_8(ctrlBlock_io_robio_exception_bits_uop_cf_exceptionVec_8),
    .io_robio_exception_bits_uop_cf_exceptionVec_9(ctrlBlock_io_robio_exception_bits_uop_cf_exceptionVec_9),
    .io_robio_exception_bits_uop_cf_exceptionVec_11(ctrlBlock_io_robio_exception_bits_uop_cf_exceptionVec_11),
    .io_robio_exception_bits_uop_cf_exceptionVec_12(ctrlBlock_io_robio_exception_bits_uop_cf_exceptionVec_12),
    .io_robio_exception_bits_uop_cf_exceptionVec_13(ctrlBlock_io_robio_exception_bits_uop_cf_exceptionVec_13),
    .io_robio_exception_bits_uop_cf_exceptionVec_15(ctrlBlock_io_robio_exception_bits_uop_cf_exceptionVec_15),
    .io_robio_exception_bits_uop_cf_trigger_frontendHit_0(ctrlBlock_io_robio_exception_bits_uop_cf_trigger_frontendHit_0
      ),
    .io_robio_exception_bits_uop_cf_trigger_frontendHit_1(ctrlBlock_io_robio_exception_bits_uop_cf_trigger_frontendHit_1
      ),
    .io_robio_exception_bits_uop_cf_trigger_frontendHit_2(ctrlBlock_io_robio_exception_bits_uop_cf_trigger_frontendHit_2
      ),
    .io_robio_exception_bits_uop_cf_trigger_frontendHit_3(ctrlBlock_io_robio_exception_bits_uop_cf_trigger_frontendHit_3
      ),
    .io_robio_exception_bits_uop_cf_trigger_backendHit_0(ctrlBlock_io_robio_exception_bits_uop_cf_trigger_backendHit_0),
    .io_robio_exception_bits_uop_cf_trigger_backendHit_1(ctrlBlock_io_robio_exception_bits_uop_cf_trigger_backendHit_1),
    .io_robio_exception_bits_uop_cf_trigger_backendHit_2(ctrlBlock_io_robio_exception_bits_uop_cf_trigger_backendHit_2),
    .io_robio_exception_bits_uop_cf_trigger_backendHit_3(ctrlBlock_io_robio_exception_bits_uop_cf_trigger_backendHit_3),
    .io_robio_exception_bits_uop_cf_trigger_backendHit_4(ctrlBlock_io_robio_exception_bits_uop_cf_trigger_backendHit_4),
    .io_robio_exception_bits_uop_cf_trigger_backendHit_5(ctrlBlock_io_robio_exception_bits_uop_cf_trigger_backendHit_5),
    .io_robio_exception_bits_uop_cf_crossPageIPFFix(ctrlBlock_io_robio_exception_bits_uop_cf_crossPageIPFFix),
    .io_robio_exception_bits_uop_ctrl_commitType(ctrlBlock_io_robio_exception_bits_uop_ctrl_commitType),
    .io_robio_exception_bits_uop_ctrl_singleStep(ctrlBlock_io_robio_exception_bits_uop_ctrl_singleStep),
    .io_robio_exception_bits_isInterrupt(ctrlBlock_io_robio_exception_bits_isInterrupt),
    .io_robio_lsq_scommit(ctrlBlock_io_robio_lsq_scommit),
    .io_robio_lsq_pendingld(ctrlBlock_io_robio_lsq_pendingld),
    .io_robio_lsq_pendingst(ctrlBlock_io_robio_lsq_pendingst),
    .io_robio_lsq_commit(ctrlBlock_io_robio_lsq_commit),
    .io_robio_lsq_isMMIO_0(ctrlBlock_io_robio_lsq_isMMIO_0),
    .io_robio_lsq_isMMIO_1(ctrlBlock_io_robio_lsq_isMMIO_1),
    .io_robio_lsq_uop_0_robIdx_value(ctrlBlock_io_robio_lsq_uop_0_robIdx_value),
    .io_robio_lsq_uop_1_robIdx_value(ctrlBlock_io_robio_lsq_uop_1_robIdx_value),
    .io_csrCtrl_lvpred_disable(ctrlBlock_io_csrCtrl_lvpred_disable),
    .io_csrCtrl_no_spec_load(ctrlBlock_io_csrCtrl_no_spec_load),
    .io_csrCtrl_storeset_wait_store(ctrlBlock_io_csrCtrl_storeset_wait_store),
    .io_csrCtrl_lvpred_timeout(ctrlBlock_io_csrCtrl_lvpred_timeout),
    .io_csrCtrl_fusion_enable(ctrlBlock_io_csrCtrl_fusion_enable),
    .io_csrCtrl_wfi_enable(ctrlBlock_io_csrCtrl_wfi_enable),
    .io_csrCtrl_svinval_enable(ctrlBlock_io_csrCtrl_svinval_enable),
    .io_csrCtrl_distribute_csr_wvalid(ctrlBlock_io_csrCtrl_distribute_csr_wvalid),
    .io_csrCtrl_distribute_csr_waddr(ctrlBlock_io_csrCtrl_distribute_csr_waddr),
    .io_csrCtrl_distribute_csr_wdata(ctrlBlock_io_csrCtrl_distribute_csr_wdata),
    .io_csrCtrl_singlestep(ctrlBlock_io_csrCtrl_singlestep),
    .io_writeback_1_0_valid(ctrlBlock_io_writeback_1_0_valid),
    .io_writeback_1_0_bits_uop_robIdx_flag(ctrlBlock_io_writeback_1_0_bits_uop_robIdx_flag),
    .io_writeback_1_0_bits_uop_robIdx_value(ctrlBlock_io_writeback_1_0_bits_uop_robIdx_value),
    .io_writeback_1_0_bits_redirectValid(ctrlBlock_io_writeback_1_0_bits_redirectValid),
    .io_writeback_1_0_bits_redirect_cfiUpdate_isMisPred(ctrlBlock_io_writeback_1_0_bits_redirect_cfiUpdate_isMisPred),
    .io_writeback_1_1_valid(ctrlBlock_io_writeback_1_1_valid),
    .io_writeback_1_1_bits_uop_robIdx_flag(ctrlBlock_io_writeback_1_1_bits_uop_robIdx_flag),
    .io_writeback_1_1_bits_uop_robIdx_value(ctrlBlock_io_writeback_1_1_bits_uop_robIdx_value),
    .io_writeback_1_1_bits_redirectValid(ctrlBlock_io_writeback_1_1_bits_redirectValid),
    .io_writeback_1_1_bits_redirect_cfiUpdate_isMisPred(ctrlBlock_io_writeback_1_1_bits_redirect_cfiUpdate_isMisPred),
    .io_writeback_1_2_valid(ctrlBlock_io_writeback_1_2_valid),
    .io_writeback_1_2_bits_uop_cf_exceptionVec_4(ctrlBlock_io_writeback_1_2_bits_uop_cf_exceptionVec_4),
    .io_writeback_1_2_bits_uop_cf_exceptionVec_5(ctrlBlock_io_writeback_1_2_bits_uop_cf_exceptionVec_5),
    .io_writeback_1_2_bits_uop_cf_exceptionVec_13(ctrlBlock_io_writeback_1_2_bits_uop_cf_exceptionVec_13),
    .io_writeback_1_2_bits_uop_cf_trigger_backendHit_0(ctrlBlock_io_writeback_1_2_bits_uop_cf_trigger_backendHit_0),
    .io_writeback_1_2_bits_uop_cf_trigger_backendHit_1(ctrlBlock_io_writeback_1_2_bits_uop_cf_trigger_backendHit_1),
    .io_writeback_1_2_bits_uop_cf_trigger_backendHit_2(ctrlBlock_io_writeback_1_2_bits_uop_cf_trigger_backendHit_2),
    .io_writeback_1_2_bits_uop_cf_trigger_backendHit_3(ctrlBlock_io_writeback_1_2_bits_uop_cf_trigger_backendHit_3),
    .io_writeback_1_2_bits_uop_cf_trigger_backendHit_4(ctrlBlock_io_writeback_1_2_bits_uop_cf_trigger_backendHit_4),
    .io_writeback_1_2_bits_uop_cf_trigger_backendHit_5(ctrlBlock_io_writeback_1_2_bits_uop_cf_trigger_backendHit_5),
    .io_writeback_1_2_bits_uop_ctrl_flushPipe(ctrlBlock_io_writeback_1_2_bits_uop_ctrl_flushPipe),
    .io_writeback_1_2_bits_uop_ctrl_replayInst(ctrlBlock_io_writeback_1_2_bits_uop_ctrl_replayInst),
    .io_writeback_1_2_bits_uop_robIdx_flag(ctrlBlock_io_writeback_1_2_bits_uop_robIdx_flag),
    .io_writeback_1_2_bits_uop_robIdx_value(ctrlBlock_io_writeback_1_2_bits_uop_robIdx_value),
    .io_writeback_1_2_bits_debug_isMMIO(ctrlBlock_io_writeback_1_2_bits_debug_isMMIO),
    .io_writeback_1_3_valid(ctrlBlock_io_writeback_1_3_valid),
    .io_writeback_1_3_bits_uop_cf_exceptionVec_4(ctrlBlock_io_writeback_1_3_bits_uop_cf_exceptionVec_4),
    .io_writeback_1_3_bits_uop_cf_exceptionVec_5(ctrlBlock_io_writeback_1_3_bits_uop_cf_exceptionVec_5),
    .io_writeback_1_3_bits_uop_cf_exceptionVec_13(ctrlBlock_io_writeback_1_3_bits_uop_cf_exceptionVec_13),
    .io_writeback_1_3_bits_uop_cf_trigger_backendHit_0(ctrlBlock_io_writeback_1_3_bits_uop_cf_trigger_backendHit_0),
    .io_writeback_1_3_bits_uop_cf_trigger_backendHit_1(ctrlBlock_io_writeback_1_3_bits_uop_cf_trigger_backendHit_1),
    .io_writeback_1_3_bits_uop_cf_trigger_backendHit_2(ctrlBlock_io_writeback_1_3_bits_uop_cf_trigger_backendHit_2),
    .io_writeback_1_3_bits_uop_cf_trigger_backendHit_3(ctrlBlock_io_writeback_1_3_bits_uop_cf_trigger_backendHit_3),
    .io_writeback_1_3_bits_uop_cf_trigger_backendHit_4(ctrlBlock_io_writeback_1_3_bits_uop_cf_trigger_backendHit_4),
    .io_writeback_1_3_bits_uop_cf_trigger_backendHit_5(ctrlBlock_io_writeback_1_3_bits_uop_cf_trigger_backendHit_5),
    .io_writeback_1_3_bits_uop_ctrl_flushPipe(ctrlBlock_io_writeback_1_3_bits_uop_ctrl_flushPipe),
    .io_writeback_1_3_bits_uop_ctrl_replayInst(ctrlBlock_io_writeback_1_3_bits_uop_ctrl_replayInst),
    .io_writeback_1_3_bits_uop_robIdx_flag(ctrlBlock_io_writeback_1_3_bits_uop_robIdx_flag),
    .io_writeback_1_3_bits_uop_robIdx_value(ctrlBlock_io_writeback_1_3_bits_uop_robIdx_value),
    .io_writeback_1_3_bits_debug_isMMIO(ctrlBlock_io_writeback_1_3_bits_debug_isMMIO),
    .io_writeback_1_4_valid(ctrlBlock_io_writeback_1_4_valid),
    .io_writeback_1_4_bits_uop_cf_exceptionVec_2(ctrlBlock_io_writeback_1_4_bits_uop_cf_exceptionVec_2),
    .io_writeback_1_4_bits_uop_cf_exceptionVec_3(ctrlBlock_io_writeback_1_4_bits_uop_cf_exceptionVec_3),
    .io_writeback_1_4_bits_uop_cf_exceptionVec_8(ctrlBlock_io_writeback_1_4_bits_uop_cf_exceptionVec_8),
    .io_writeback_1_4_bits_uop_cf_exceptionVec_9(ctrlBlock_io_writeback_1_4_bits_uop_cf_exceptionVec_9),
    .io_writeback_1_4_bits_uop_cf_exceptionVec_11(ctrlBlock_io_writeback_1_4_bits_uop_cf_exceptionVec_11),
    .io_writeback_1_4_bits_uop_ctrl_flushPipe(ctrlBlock_io_writeback_1_4_bits_uop_ctrl_flushPipe),
    .io_writeback_1_4_bits_uop_robIdx_flag(ctrlBlock_io_writeback_1_4_bits_uop_robIdx_flag),
    .io_writeback_1_4_bits_uop_robIdx_value(ctrlBlock_io_writeback_1_4_bits_uop_robIdx_value),
    .io_writeback_1_4_bits_redirectValid(ctrlBlock_io_writeback_1_4_bits_redirectValid),
    .io_writeback_1_4_bits_redirect_cfiUpdate_isMisPred(ctrlBlock_io_writeback_1_4_bits_redirect_cfiUpdate_isMisPred),
    .io_writeback_1_4_bits_debug_isPerfCnt(ctrlBlock_io_writeback_1_4_bits_debug_isPerfCnt),
    .io_writeback_1_5_valid(ctrlBlock_io_writeback_1_5_valid),
    .io_writeback_1_5_bits_uop_cf_trigger_backendHit_0(ctrlBlock_io_writeback_1_5_bits_uop_cf_trigger_backendHit_0),
    .io_writeback_1_5_bits_uop_cf_trigger_backendHit_1(ctrlBlock_io_writeback_1_5_bits_uop_cf_trigger_backendHit_1),
    .io_writeback_1_5_bits_uop_cf_trigger_backendHit_2(ctrlBlock_io_writeback_1_5_bits_uop_cf_trigger_backendHit_2),
    .io_writeback_1_5_bits_uop_cf_trigger_backendHit_3(ctrlBlock_io_writeback_1_5_bits_uop_cf_trigger_backendHit_3),
    .io_writeback_1_5_bits_uop_cf_trigger_backendHit_4(ctrlBlock_io_writeback_1_5_bits_uop_cf_trigger_backendHit_4),
    .io_writeback_1_5_bits_uop_cf_trigger_backendHit_5(ctrlBlock_io_writeback_1_5_bits_uop_cf_trigger_backendHit_5),
    .io_writeback_1_5_bits_uop_robIdx_flag(ctrlBlock_io_writeback_1_5_bits_uop_robIdx_flag),
    .io_writeback_1_5_bits_uop_robIdx_value(ctrlBlock_io_writeback_1_5_bits_uop_robIdx_value),
    .io_writeback_1_6_valid(ctrlBlock_io_writeback_1_6_valid),
    .io_writeback_1_6_bits_uop_cf_exceptionVec_2(ctrlBlock_io_writeback_1_6_bits_uop_cf_exceptionVec_2),
    .io_writeback_1_6_bits_uop_cf_exceptionVec_3(ctrlBlock_io_writeback_1_6_bits_uop_cf_exceptionVec_3),
    .io_writeback_1_6_bits_uop_cf_exceptionVec_8(ctrlBlock_io_writeback_1_6_bits_uop_cf_exceptionVec_8),
    .io_writeback_1_6_bits_uop_cf_exceptionVec_9(ctrlBlock_io_writeback_1_6_bits_uop_cf_exceptionVec_9),
    .io_writeback_1_6_bits_uop_cf_exceptionVec_11(ctrlBlock_io_writeback_1_6_bits_uop_cf_exceptionVec_11),
    .io_writeback_1_6_bits_uop_ctrl_flushPipe(ctrlBlock_io_writeback_1_6_bits_uop_ctrl_flushPipe),
    .io_writeback_1_6_bits_uop_robIdx_flag(ctrlBlock_io_writeback_1_6_bits_uop_robIdx_flag),
    .io_writeback_1_6_bits_uop_robIdx_value(ctrlBlock_io_writeback_1_6_bits_uop_robIdx_value),
    .io_writeback_1_6_bits_redirectValid(ctrlBlock_io_writeback_1_6_bits_redirectValid),
    .io_writeback_1_6_bits_redirect_cfiUpdate_isMisPred(ctrlBlock_io_writeback_1_6_bits_redirect_cfiUpdate_isMisPred),
    .io_writeback_1_6_bits_debug_isPerfCnt(ctrlBlock_io_writeback_1_6_bits_debug_isPerfCnt),
    .io_writeback_1_7_valid(ctrlBlock_io_writeback_1_7_valid),
    .io_writeback_1_7_bits_uop_cf_exceptionVec_4(ctrlBlock_io_writeback_1_7_bits_uop_cf_exceptionVec_4),
    .io_writeback_1_7_bits_uop_cf_exceptionVec_5(ctrlBlock_io_writeback_1_7_bits_uop_cf_exceptionVec_5),
    .io_writeback_1_7_bits_uop_cf_exceptionVec_6(ctrlBlock_io_writeback_1_7_bits_uop_cf_exceptionVec_6),
    .io_writeback_1_7_bits_uop_cf_exceptionVec_7(ctrlBlock_io_writeback_1_7_bits_uop_cf_exceptionVec_7),
    .io_writeback_1_7_bits_uop_cf_exceptionVec_13(ctrlBlock_io_writeback_1_7_bits_uop_cf_exceptionVec_13),
    .io_writeback_1_7_bits_uop_cf_exceptionVec_15(ctrlBlock_io_writeback_1_7_bits_uop_cf_exceptionVec_15),
    .io_writeback_1_7_bits_uop_cf_trigger_backendHit_0(ctrlBlock_io_writeback_1_7_bits_uop_cf_trigger_backendHit_0),
    .io_writeback_1_7_bits_uop_cf_trigger_backendHit_1(ctrlBlock_io_writeback_1_7_bits_uop_cf_trigger_backendHit_1),
    .io_writeback_1_7_bits_uop_cf_trigger_backendHit_2(ctrlBlock_io_writeback_1_7_bits_uop_cf_trigger_backendHit_2),
    .io_writeback_1_7_bits_uop_cf_trigger_backendHit_3(ctrlBlock_io_writeback_1_7_bits_uop_cf_trigger_backendHit_3),
    .io_writeback_1_7_bits_uop_cf_trigger_backendHit_4(ctrlBlock_io_writeback_1_7_bits_uop_cf_trigger_backendHit_4),
    .io_writeback_1_7_bits_uop_cf_trigger_backendHit_5(ctrlBlock_io_writeback_1_7_bits_uop_cf_trigger_backendHit_5),
    .io_writeback_1_7_bits_uop_robIdx_flag(ctrlBlock_io_writeback_1_7_bits_uop_robIdx_flag),
    .io_writeback_1_7_bits_uop_robIdx_value(ctrlBlock_io_writeback_1_7_bits_uop_robIdx_value),
    .io_writeback_1_7_bits_redirectValid(ctrlBlock_io_writeback_1_7_bits_redirectValid),
    .io_writeback_1_7_bits_redirect_cfiUpdate_isMisPred(ctrlBlock_io_writeback_1_7_bits_redirect_cfiUpdate_isMisPred),
    .io_writeback_1_7_bits_debug_isMMIO(ctrlBlock_io_writeback_1_7_bits_debug_isMMIO),
    .io_writeback_1_7_bits_debug_isPerfCnt(ctrlBlock_io_writeback_1_7_bits_debug_isPerfCnt),
    .io_writeback_1_8_valid(ctrlBlock_io_writeback_1_8_valid),
    .io_writeback_1_8_bits_uop_cf_exceptionVec_4(ctrlBlock_io_writeback_1_8_bits_uop_cf_exceptionVec_4),
    .io_writeback_1_8_bits_uop_cf_exceptionVec_5(ctrlBlock_io_writeback_1_8_bits_uop_cf_exceptionVec_5),
    .io_writeback_1_8_bits_uop_cf_exceptionVec_6(ctrlBlock_io_writeback_1_8_bits_uop_cf_exceptionVec_6),
    .io_writeback_1_8_bits_uop_cf_exceptionVec_7(ctrlBlock_io_writeback_1_8_bits_uop_cf_exceptionVec_7),
    .io_writeback_1_8_bits_uop_cf_exceptionVec_13(ctrlBlock_io_writeback_1_8_bits_uop_cf_exceptionVec_13),
    .io_writeback_1_8_bits_uop_cf_exceptionVec_15(ctrlBlock_io_writeback_1_8_bits_uop_cf_exceptionVec_15),
    .io_writeback_1_8_bits_uop_cf_trigger_backendHit_0(ctrlBlock_io_writeback_1_8_bits_uop_cf_trigger_backendHit_0),
    .io_writeback_1_8_bits_uop_cf_trigger_backendHit_1(ctrlBlock_io_writeback_1_8_bits_uop_cf_trigger_backendHit_1),
    .io_writeback_1_8_bits_uop_cf_trigger_backendHit_2(ctrlBlock_io_writeback_1_8_bits_uop_cf_trigger_backendHit_2),
    .io_writeback_1_8_bits_uop_cf_trigger_backendHit_3(ctrlBlock_io_writeback_1_8_bits_uop_cf_trigger_backendHit_3),
    .io_writeback_1_8_bits_uop_cf_trigger_backendHit_4(ctrlBlock_io_writeback_1_8_bits_uop_cf_trigger_backendHit_4),
    .io_writeback_1_8_bits_uop_cf_trigger_backendHit_5(ctrlBlock_io_writeback_1_8_bits_uop_cf_trigger_backendHit_5),
    .io_writeback_1_8_bits_uop_robIdx_flag(ctrlBlock_io_writeback_1_8_bits_uop_robIdx_flag),
    .io_writeback_1_8_bits_uop_robIdx_value(ctrlBlock_io_writeback_1_8_bits_uop_robIdx_value),
    .io_writeback_1_8_bits_redirectValid(ctrlBlock_io_writeback_1_8_bits_redirectValid),
    .io_writeback_1_8_bits_redirect_cfiUpdate_isMisPred(ctrlBlock_io_writeback_1_8_bits_redirect_cfiUpdate_isMisPred),
    .io_writeback_1_8_bits_debug_isMMIO(ctrlBlock_io_writeback_1_8_bits_debug_isMMIO),
    .io_writeback_1_8_bits_debug_isPerfCnt(ctrlBlock_io_writeback_1_8_bits_debug_isPerfCnt),
    .io_writeback_1_9_valid(ctrlBlock_io_writeback_1_9_valid),
    .io_writeback_1_9_bits_uop_robIdx_flag(ctrlBlock_io_writeback_1_9_bits_uop_robIdx_flag),
    .io_writeback_1_9_bits_uop_robIdx_value(ctrlBlock_io_writeback_1_9_bits_uop_robIdx_value),
    .io_writeback_1_10_valid(ctrlBlock_io_writeback_1_10_valid),
    .io_writeback_1_10_bits_uop_robIdx_flag(ctrlBlock_io_writeback_1_10_bits_uop_robIdx_flag),
    .io_writeback_1_10_bits_uop_robIdx_value(ctrlBlock_io_writeback_1_10_bits_uop_robIdx_value),
    .io_writeback_0_3_valid(ctrlBlock_io_writeback_0_3_valid),
    .io_writeback_0_3_bits_uop_cf_exceptionVec_2(ctrlBlock_io_writeback_0_3_bits_uop_cf_exceptionVec_2),
    .io_writeback_0_3_bits_uop_cf_exceptionVec_3(ctrlBlock_io_writeback_0_3_bits_uop_cf_exceptionVec_3),
    .io_writeback_0_3_bits_uop_cf_exceptionVec_8(ctrlBlock_io_writeback_0_3_bits_uop_cf_exceptionVec_8),
    .io_writeback_0_3_bits_uop_cf_exceptionVec_9(ctrlBlock_io_writeback_0_3_bits_uop_cf_exceptionVec_9),
    .io_writeback_0_3_bits_uop_cf_exceptionVec_11(ctrlBlock_io_writeback_0_3_bits_uop_cf_exceptionVec_11),
    .io_writeback_0_3_bits_uop_ctrl_flushPipe(ctrlBlock_io_writeback_0_3_bits_uop_ctrl_flushPipe),
    .io_writeback_0_3_bits_uop_robIdx_flag(ctrlBlock_io_writeback_0_3_bits_uop_robIdx_flag),
    .io_writeback_0_3_bits_uop_robIdx_value(ctrlBlock_io_writeback_0_3_bits_uop_robIdx_value),
    .io_writeback_0_3_bits_fflags(ctrlBlock_io_writeback_0_3_bits_fflags),
    .io_writeback_0_4_valid(ctrlBlock_io_writeback_0_4_valid),
    .io_writeback_0_4_bits_uop_robIdx_flag(ctrlBlock_io_writeback_0_4_bits_uop_robIdx_flag),
    .io_writeback_0_4_bits_uop_robIdx_value(ctrlBlock_io_writeback_0_4_bits_uop_robIdx_value),
    .io_writeback_0_4_bits_fflags(ctrlBlock_io_writeback_0_4_bits_fflags),
    .io_writeback_0_5_valid(ctrlBlock_io_writeback_0_5_valid),
    .io_writeback_0_5_bits_uop_robIdx_flag(ctrlBlock_io_writeback_0_5_bits_uop_robIdx_flag),
    .io_writeback_0_5_bits_uop_robIdx_value(ctrlBlock_io_writeback_0_5_bits_uop_robIdx_value),
    .io_writeback_0_5_bits_fflags(ctrlBlock_io_writeback_0_5_bits_fflags),
    .io_writeback_0_6_valid(ctrlBlock_io_writeback_0_6_valid),
    .io_writeback_0_6_bits_uop_cf_exceptionVec_4(ctrlBlock_io_writeback_0_6_bits_uop_cf_exceptionVec_4),
    .io_writeback_0_6_bits_uop_cf_exceptionVec_5(ctrlBlock_io_writeback_0_6_bits_uop_cf_exceptionVec_5),
    .io_writeback_0_6_bits_uop_cf_exceptionVec_13(ctrlBlock_io_writeback_0_6_bits_uop_cf_exceptionVec_13),
    .io_writeback_0_6_bits_uop_cf_trigger_backendHit_0(ctrlBlock_io_writeback_0_6_bits_uop_cf_trigger_backendHit_0),
    .io_writeback_0_6_bits_uop_cf_trigger_backendHit_1(ctrlBlock_io_writeback_0_6_bits_uop_cf_trigger_backendHit_1),
    .io_writeback_0_6_bits_uop_cf_trigger_backendHit_2(ctrlBlock_io_writeback_0_6_bits_uop_cf_trigger_backendHit_2),
    .io_writeback_0_6_bits_uop_cf_trigger_backendHit_3(ctrlBlock_io_writeback_0_6_bits_uop_cf_trigger_backendHit_3),
    .io_writeback_0_6_bits_uop_cf_trigger_backendHit_4(ctrlBlock_io_writeback_0_6_bits_uop_cf_trigger_backendHit_4),
    .io_writeback_0_6_bits_uop_cf_trigger_backendHit_5(ctrlBlock_io_writeback_0_6_bits_uop_cf_trigger_backendHit_5),
    .io_writeback_0_6_bits_uop_ctrl_flushPipe(ctrlBlock_io_writeback_0_6_bits_uop_ctrl_flushPipe),
    .io_writeback_0_6_bits_uop_ctrl_replayInst(ctrlBlock_io_writeback_0_6_bits_uop_ctrl_replayInst),
    .io_writeback_0_6_bits_uop_robIdx_flag(ctrlBlock_io_writeback_0_6_bits_uop_robIdx_flag),
    .io_writeback_0_6_bits_uop_robIdx_value(ctrlBlock_io_writeback_0_6_bits_uop_robIdx_value),
    .io_writeback_0_7_valid(ctrlBlock_io_writeback_0_7_valid),
    .io_writeback_0_7_bits_uop_cf_exceptionVec_4(ctrlBlock_io_writeback_0_7_bits_uop_cf_exceptionVec_4),
    .io_writeback_0_7_bits_uop_cf_exceptionVec_5(ctrlBlock_io_writeback_0_7_bits_uop_cf_exceptionVec_5),
    .io_writeback_0_7_bits_uop_cf_exceptionVec_13(ctrlBlock_io_writeback_0_7_bits_uop_cf_exceptionVec_13),
    .io_writeback_0_7_bits_uop_cf_trigger_backendHit_0(ctrlBlock_io_writeback_0_7_bits_uop_cf_trigger_backendHit_0),
    .io_writeback_0_7_bits_uop_cf_trigger_backendHit_1(ctrlBlock_io_writeback_0_7_bits_uop_cf_trigger_backendHit_1),
    .io_writeback_0_7_bits_uop_cf_trigger_backendHit_2(ctrlBlock_io_writeback_0_7_bits_uop_cf_trigger_backendHit_2),
    .io_writeback_0_7_bits_uop_cf_trigger_backendHit_3(ctrlBlock_io_writeback_0_7_bits_uop_cf_trigger_backendHit_3),
    .io_writeback_0_7_bits_uop_cf_trigger_backendHit_4(ctrlBlock_io_writeback_0_7_bits_uop_cf_trigger_backendHit_4),
    .io_writeback_0_7_bits_uop_cf_trigger_backendHit_5(ctrlBlock_io_writeback_0_7_bits_uop_cf_trigger_backendHit_5),
    .io_writeback_0_7_bits_uop_ctrl_flushPipe(ctrlBlock_io_writeback_0_7_bits_uop_ctrl_flushPipe),
    .io_writeback_0_7_bits_uop_ctrl_replayInst(ctrlBlock_io_writeback_0_7_bits_uop_ctrl_replayInst),
    .io_writeback_0_7_bits_uop_robIdx_flag(ctrlBlock_io_writeback_0_7_bits_uop_robIdx_flag),
    .io_writeback_0_7_bits_uop_robIdx_value(ctrlBlock_io_writeback_0_7_bits_uop_robIdx_value),
    .io_writeback_0_8_valid(ctrlBlock_io_writeback_0_8_valid),
    .io_writeback_0_8_bits_uop_cf_exceptionVec_4(ctrlBlock_io_writeback_0_8_bits_uop_cf_exceptionVec_4),
    .io_writeback_0_8_bits_uop_cf_exceptionVec_5(ctrlBlock_io_writeback_0_8_bits_uop_cf_exceptionVec_5),
    .io_writeback_0_8_bits_uop_cf_exceptionVec_6(ctrlBlock_io_writeback_0_8_bits_uop_cf_exceptionVec_6),
    .io_writeback_0_8_bits_uop_cf_exceptionVec_7(ctrlBlock_io_writeback_0_8_bits_uop_cf_exceptionVec_7),
    .io_writeback_0_8_bits_uop_cf_exceptionVec_13(ctrlBlock_io_writeback_0_8_bits_uop_cf_exceptionVec_13),
    .io_writeback_0_8_bits_uop_cf_exceptionVec_15(ctrlBlock_io_writeback_0_8_bits_uop_cf_exceptionVec_15),
    .io_writeback_0_8_bits_uop_cf_trigger_backendHit_0(ctrlBlock_io_writeback_0_8_bits_uop_cf_trigger_backendHit_0),
    .io_writeback_0_8_bits_uop_cf_trigger_backendHit_1(ctrlBlock_io_writeback_0_8_bits_uop_cf_trigger_backendHit_1),
    .io_writeback_0_8_bits_uop_cf_trigger_backendHit_2(ctrlBlock_io_writeback_0_8_bits_uop_cf_trigger_backendHit_2),
    .io_writeback_0_8_bits_uop_cf_trigger_backendHit_3(ctrlBlock_io_writeback_0_8_bits_uop_cf_trigger_backendHit_3),
    .io_writeback_0_8_bits_uop_cf_trigger_backendHit_4(ctrlBlock_io_writeback_0_8_bits_uop_cf_trigger_backendHit_4),
    .io_writeback_0_8_bits_uop_cf_trigger_backendHit_5(ctrlBlock_io_writeback_0_8_bits_uop_cf_trigger_backendHit_5),
    .io_writeback_0_8_bits_uop_robIdx_flag(ctrlBlock_io_writeback_0_8_bits_uop_robIdx_flag),
    .io_writeback_0_8_bits_uop_robIdx_value(ctrlBlock_io_writeback_0_8_bits_uop_robIdx_value),
    .io_writeback_0_9_valid(ctrlBlock_io_writeback_0_9_valid),
    .io_writeback_0_9_bits_uop_cf_exceptionVec_6(ctrlBlock_io_writeback_0_9_bits_uop_cf_exceptionVec_6),
    .io_writeback_0_9_bits_uop_cf_exceptionVec_7(ctrlBlock_io_writeback_0_9_bits_uop_cf_exceptionVec_7),
    .io_writeback_0_9_bits_uop_cf_exceptionVec_15(ctrlBlock_io_writeback_0_9_bits_uop_cf_exceptionVec_15),
    .io_writeback_0_9_bits_uop_cf_trigger_backendHit_0(ctrlBlock_io_writeback_0_9_bits_uop_cf_trigger_backendHit_0),
    .io_writeback_0_9_bits_uop_cf_trigger_backendHit_1(ctrlBlock_io_writeback_0_9_bits_uop_cf_trigger_backendHit_1),
    .io_writeback_0_9_bits_uop_cf_trigger_backendHit_4(ctrlBlock_io_writeback_0_9_bits_uop_cf_trigger_backendHit_4),
    .io_writeback_0_9_bits_uop_robIdx_flag(ctrlBlock_io_writeback_0_9_bits_uop_robIdx_flag),
    .io_writeback_0_9_bits_uop_robIdx_value(ctrlBlock_io_writeback_0_9_bits_uop_robIdx_value),
    .io_redirect_valid(ctrlBlock_io_redirect_valid),
    .io_redirect_bits_robIdx_flag(ctrlBlock_io_redirect_bits_robIdx_flag),
    .io_redirect_bits_robIdx_value(ctrlBlock_io_redirect_bits_robIdx_value),
    .io_redirect_bits_level(ctrlBlock_io_redirect_bits_level),
    .io_debug_int_rat_0(ctrlBlock_io_debug_int_rat_0),
    .io_debug_int_rat_1(ctrlBlock_io_debug_int_rat_1),
    .io_debug_int_rat_2(ctrlBlock_io_debug_int_rat_2),
    .io_debug_int_rat_3(ctrlBlock_io_debug_int_rat_3),
    .io_debug_int_rat_4(ctrlBlock_io_debug_int_rat_4),
    .io_debug_int_rat_5(ctrlBlock_io_debug_int_rat_5),
    .io_debug_int_rat_6(ctrlBlock_io_debug_int_rat_6),
    .io_debug_int_rat_7(ctrlBlock_io_debug_int_rat_7),
    .io_debug_int_rat_8(ctrlBlock_io_debug_int_rat_8),
    .io_debug_int_rat_9(ctrlBlock_io_debug_int_rat_9),
    .io_debug_int_rat_10(ctrlBlock_io_debug_int_rat_10),
    .io_debug_int_rat_11(ctrlBlock_io_debug_int_rat_11),
    .io_debug_int_rat_12(ctrlBlock_io_debug_int_rat_12),
    .io_debug_int_rat_13(ctrlBlock_io_debug_int_rat_13),
    .io_debug_int_rat_14(ctrlBlock_io_debug_int_rat_14),
    .io_debug_int_rat_15(ctrlBlock_io_debug_int_rat_15),
    .io_debug_int_rat_16(ctrlBlock_io_debug_int_rat_16),
    .io_debug_int_rat_17(ctrlBlock_io_debug_int_rat_17),
    .io_debug_int_rat_18(ctrlBlock_io_debug_int_rat_18),
    .io_debug_int_rat_19(ctrlBlock_io_debug_int_rat_19),
    .io_debug_int_rat_20(ctrlBlock_io_debug_int_rat_20),
    .io_debug_int_rat_21(ctrlBlock_io_debug_int_rat_21),
    .io_debug_int_rat_22(ctrlBlock_io_debug_int_rat_22),
    .io_debug_int_rat_23(ctrlBlock_io_debug_int_rat_23),
    .io_debug_int_rat_24(ctrlBlock_io_debug_int_rat_24),
    .io_debug_int_rat_25(ctrlBlock_io_debug_int_rat_25),
    .io_debug_int_rat_26(ctrlBlock_io_debug_int_rat_26),
    .io_debug_int_rat_27(ctrlBlock_io_debug_int_rat_27),
    .io_debug_int_rat_28(ctrlBlock_io_debug_int_rat_28),
    .io_debug_int_rat_29(ctrlBlock_io_debug_int_rat_29),
    .io_debug_int_rat_30(ctrlBlock_io_debug_int_rat_30),
    .io_debug_int_rat_31(ctrlBlock_io_debug_int_rat_31),
    .io_debug_fp_rat_0(ctrlBlock_io_debug_fp_rat_0),
    .io_debug_fp_rat_1(ctrlBlock_io_debug_fp_rat_1),
    .io_debug_fp_rat_2(ctrlBlock_io_debug_fp_rat_2),
    .io_debug_fp_rat_3(ctrlBlock_io_debug_fp_rat_3),
    .io_debug_fp_rat_4(ctrlBlock_io_debug_fp_rat_4),
    .io_debug_fp_rat_5(ctrlBlock_io_debug_fp_rat_5),
    .io_debug_fp_rat_6(ctrlBlock_io_debug_fp_rat_6),
    .io_debug_fp_rat_7(ctrlBlock_io_debug_fp_rat_7),
    .io_debug_fp_rat_8(ctrlBlock_io_debug_fp_rat_8),
    .io_debug_fp_rat_9(ctrlBlock_io_debug_fp_rat_9),
    .io_debug_fp_rat_10(ctrlBlock_io_debug_fp_rat_10),
    .io_debug_fp_rat_11(ctrlBlock_io_debug_fp_rat_11),
    .io_debug_fp_rat_12(ctrlBlock_io_debug_fp_rat_12),
    .io_debug_fp_rat_13(ctrlBlock_io_debug_fp_rat_13),
    .io_debug_fp_rat_14(ctrlBlock_io_debug_fp_rat_14),
    .io_debug_fp_rat_15(ctrlBlock_io_debug_fp_rat_15),
    .io_debug_fp_rat_16(ctrlBlock_io_debug_fp_rat_16),
    .io_debug_fp_rat_17(ctrlBlock_io_debug_fp_rat_17),
    .io_debug_fp_rat_18(ctrlBlock_io_debug_fp_rat_18),
    .io_debug_fp_rat_19(ctrlBlock_io_debug_fp_rat_19),
    .io_debug_fp_rat_20(ctrlBlock_io_debug_fp_rat_20),
    .io_debug_fp_rat_21(ctrlBlock_io_debug_fp_rat_21),
    .io_debug_fp_rat_22(ctrlBlock_io_debug_fp_rat_22),
    .io_debug_fp_rat_23(ctrlBlock_io_debug_fp_rat_23),
    .io_debug_fp_rat_24(ctrlBlock_io_debug_fp_rat_24),
    .io_debug_fp_rat_25(ctrlBlock_io_debug_fp_rat_25),
    .io_debug_fp_rat_26(ctrlBlock_io_debug_fp_rat_26),
    .io_debug_fp_rat_27(ctrlBlock_io_debug_fp_rat_27),
    .io_debug_fp_rat_28(ctrlBlock_io_debug_fp_rat_28),
    .io_debug_fp_rat_29(ctrlBlock_io_debug_fp_rat_29),
    .io_debug_fp_rat_30(ctrlBlock_io_debug_fp_rat_30),
    .io_debug_fp_rat_31(ctrlBlock_io_debug_fp_rat_31),
    .perfinfo_perfEventsRs_0_value(ctrlBlock_perfinfo_perfEventsRs_0_value),
    .perfinfo_perfEventsRs_1_value(ctrlBlock_perfinfo_perfEventsRs_1_value),
    .perfinfo_perfEventsRs_2_value(ctrlBlock_perfinfo_perfEventsRs_2_value),
    .perfinfo_perfEventsRs_3_value(ctrlBlock_perfinfo_perfEventsRs_3_value),
    .perfinfo_perfEventsRs_4_value(ctrlBlock_perfinfo_perfEventsRs_4_value),
    .perfinfo_perfEventsRs_5_value(ctrlBlock_perfinfo_perfEventsRs_5_value),
    .perfinfo_perfEventsRs_6_value(ctrlBlock_perfinfo_perfEventsRs_6_value),
    .perfinfo_perfEventsRs_7_value(ctrlBlock_perfinfo_perfEventsRs_7_value),
    .perfinfo_perfEventsEu0_0_value(ctrlBlock_perfinfo_perfEventsEu0_0_value),
    .perfinfo_perfEventsEu0_1_value(ctrlBlock_perfinfo_perfEventsEu0_1_value),
    .perfinfo_perfEventsEu0_2_value(ctrlBlock_perfinfo_perfEventsEu0_2_value),
    .perfinfo_perfEventsEu0_3_value(ctrlBlock_perfinfo_perfEventsEu0_3_value),
    .perfinfo_perfEventsEu0_4_value(ctrlBlock_perfinfo_perfEventsEu0_4_value),
    .perfinfo_perfEventsEu0_5_value(ctrlBlock_perfinfo_perfEventsEu0_5_value),
    .perfinfo_perfEventsEu1_0_value(ctrlBlock_perfinfo_perfEventsEu1_0_value),
    .perfinfo_perfEventsEu1_1_value(ctrlBlock_perfinfo_perfEventsEu1_1_value),
    .perfinfo_perfEventsEu1_2_value(ctrlBlock_perfinfo_perfEventsEu1_2_value),
    .perfinfo_perfEventsEu1_3_value(ctrlBlock_perfinfo_perfEventsEu1_3_value),
    .perfinfo_perfEventsEu1_4_value(ctrlBlock_perfinfo_perfEventsEu1_4_value),
    .perfinfo_perfEventsEu1_5_value(ctrlBlock_perfinfo_perfEventsEu1_5_value),
    .io_perf_0_value(ctrlBlock_io_perf_0_value),
    .io_perf_1_value(ctrlBlock_io_perf_1_value),
    .io_perf_2_value(ctrlBlock_io_perf_2_value),
    .io_perf_3_value(ctrlBlock_io_perf_3_value),
    .io_perf_4_value(ctrlBlock_io_perf_4_value),
    .io_perf_5_value(ctrlBlock_io_perf_5_value),
    .io_perf_6_value(ctrlBlock_io_perf_6_value),
    .io_perf_7_value(ctrlBlock_io_perf_7_value)
  );
  PTWFilter itlbRepeater1 ( // @[Repeater.scala 410:24]
    .clock(itlbRepeater1_clock),
    .reset(itlbRepeater1_reset),
    .io_sfence_valid(itlbRepeater1_io_sfence_valid),
    .io_csr_satp_changed(itlbRepeater1_io_csr_satp_changed),
    .io_tlb_req_0_ready(itlbRepeater1_io_tlb_req_0_ready),
    .io_tlb_req_0_valid(itlbRepeater1_io_tlb_req_0_valid),
    .io_tlb_req_0_bits_vpn(itlbRepeater1_io_tlb_req_0_bits_vpn),
    .io_tlb_req_1_ready(itlbRepeater1_io_tlb_req_1_ready),
    .io_tlb_req_1_valid(itlbRepeater1_io_tlb_req_1_valid),
    .io_tlb_req_1_bits_vpn(itlbRepeater1_io_tlb_req_1_bits_vpn),
    .io_tlb_req_3_ready(itlbRepeater1_io_tlb_req_3_ready),
    .io_tlb_req_3_valid(itlbRepeater1_io_tlb_req_3_valid),
    .io_tlb_req_3_bits_vpn(itlbRepeater1_io_tlb_req_3_bits_vpn),
    .io_tlb_resp_valid(itlbRepeater1_io_tlb_resp_valid),
    .io_tlb_resp_bits_data_entry_tag(itlbRepeater1_io_tlb_resp_bits_data_entry_tag),
    .io_tlb_resp_bits_data_entry_asid(itlbRepeater1_io_tlb_resp_bits_data_entry_asid),
    .io_tlb_resp_bits_data_entry_ppn(itlbRepeater1_io_tlb_resp_bits_data_entry_ppn),
    .io_tlb_resp_bits_data_entry_perm_d(itlbRepeater1_io_tlb_resp_bits_data_entry_perm_d),
    .io_tlb_resp_bits_data_entry_perm_a(itlbRepeater1_io_tlb_resp_bits_data_entry_perm_a),
    .io_tlb_resp_bits_data_entry_perm_g(itlbRepeater1_io_tlb_resp_bits_data_entry_perm_g),
    .io_tlb_resp_bits_data_entry_perm_u(itlbRepeater1_io_tlb_resp_bits_data_entry_perm_u),
    .io_tlb_resp_bits_data_entry_perm_x(itlbRepeater1_io_tlb_resp_bits_data_entry_perm_x),
    .io_tlb_resp_bits_data_entry_perm_w(itlbRepeater1_io_tlb_resp_bits_data_entry_perm_w),
    .io_tlb_resp_bits_data_entry_perm_r(itlbRepeater1_io_tlb_resp_bits_data_entry_perm_r),
    .io_tlb_resp_bits_data_entry_level(itlbRepeater1_io_tlb_resp_bits_data_entry_level),
    .io_tlb_resp_bits_data_pf(itlbRepeater1_io_tlb_resp_bits_data_pf),
    .io_tlb_resp_bits_data_af(itlbRepeater1_io_tlb_resp_bits_data_af),
    .io_ptw_req_0_ready(itlbRepeater1_io_ptw_req_0_ready),
    .io_ptw_req_0_valid(itlbRepeater1_io_ptw_req_0_valid),
    .io_ptw_req_0_bits_vpn(itlbRepeater1_io_ptw_req_0_bits_vpn),
    .io_ptw_resp_ready(itlbRepeater1_io_ptw_resp_ready),
    .io_ptw_resp_valid(itlbRepeater1_io_ptw_resp_valid),
    .io_ptw_resp_bits_entry_tag(itlbRepeater1_io_ptw_resp_bits_entry_tag),
    .io_ptw_resp_bits_entry_asid(itlbRepeater1_io_ptw_resp_bits_entry_asid),
    .io_ptw_resp_bits_entry_ppn(itlbRepeater1_io_ptw_resp_bits_entry_ppn),
    .io_ptw_resp_bits_entry_perm_d(itlbRepeater1_io_ptw_resp_bits_entry_perm_d),
    .io_ptw_resp_bits_entry_perm_a(itlbRepeater1_io_ptw_resp_bits_entry_perm_a),
    .io_ptw_resp_bits_entry_perm_g(itlbRepeater1_io_ptw_resp_bits_entry_perm_g),
    .io_ptw_resp_bits_entry_perm_u(itlbRepeater1_io_ptw_resp_bits_entry_perm_u),
    .io_ptw_resp_bits_entry_perm_x(itlbRepeater1_io_ptw_resp_bits_entry_perm_x),
    .io_ptw_resp_bits_entry_perm_w(itlbRepeater1_io_ptw_resp_bits_entry_perm_w),
    .io_ptw_resp_bits_entry_perm_r(itlbRepeater1_io_ptw_resp_bits_entry_perm_r),
    .io_ptw_resp_bits_entry_level(itlbRepeater1_io_ptw_resp_bits_entry_level),
    .io_ptw_resp_bits_pf(itlbRepeater1_io_ptw_resp_bits_pf),
    .io_ptw_resp_bits_af(itlbRepeater1_io_ptw_resp_bits_af)
  );
  PTWRepeaterNB itlbRepeater2 ( // @[Repeater.scala 383:26]
    .clock(itlbRepeater2_clock),
    .reset(itlbRepeater2_reset),
    .io_sfence_valid(itlbRepeater2_io_sfence_valid),
    .io_csr_satp_changed(itlbRepeater2_io_csr_satp_changed),
    .io_tlb_req_0_ready(itlbRepeater2_io_tlb_req_0_ready),
    .io_tlb_req_0_valid(itlbRepeater2_io_tlb_req_0_valid),
    .io_tlb_req_0_bits_vpn(itlbRepeater2_io_tlb_req_0_bits_vpn),
    .io_tlb_resp_valid(itlbRepeater2_io_tlb_resp_valid),
    .io_tlb_resp_bits_entry_tag(itlbRepeater2_io_tlb_resp_bits_entry_tag),
    .io_tlb_resp_bits_entry_asid(itlbRepeater2_io_tlb_resp_bits_entry_asid),
    .io_tlb_resp_bits_entry_ppn(itlbRepeater2_io_tlb_resp_bits_entry_ppn),
    .io_tlb_resp_bits_entry_perm_d(itlbRepeater2_io_tlb_resp_bits_entry_perm_d),
    .io_tlb_resp_bits_entry_perm_a(itlbRepeater2_io_tlb_resp_bits_entry_perm_a),
    .io_tlb_resp_bits_entry_perm_g(itlbRepeater2_io_tlb_resp_bits_entry_perm_g),
    .io_tlb_resp_bits_entry_perm_u(itlbRepeater2_io_tlb_resp_bits_entry_perm_u),
    .io_tlb_resp_bits_entry_perm_x(itlbRepeater2_io_tlb_resp_bits_entry_perm_x),
    .io_tlb_resp_bits_entry_perm_w(itlbRepeater2_io_tlb_resp_bits_entry_perm_w),
    .io_tlb_resp_bits_entry_perm_r(itlbRepeater2_io_tlb_resp_bits_entry_perm_r),
    .io_tlb_resp_bits_entry_level(itlbRepeater2_io_tlb_resp_bits_entry_level),
    .io_tlb_resp_bits_pf(itlbRepeater2_io_tlb_resp_bits_pf),
    .io_tlb_resp_bits_af(itlbRepeater2_io_tlb_resp_bits_af),
    .io_ptw_req_0_ready(itlbRepeater2_io_ptw_req_0_ready),
    .io_ptw_req_0_valid(itlbRepeater2_io_ptw_req_0_valid),
    .io_ptw_req_0_bits_vpn(itlbRepeater2_io_ptw_req_0_bits_vpn),
    .io_ptw_resp_ready(itlbRepeater2_io_ptw_resp_ready),
    .io_ptw_resp_valid(itlbRepeater2_io_ptw_resp_valid),
    .io_ptw_resp_bits_entry_tag(itlbRepeater2_io_ptw_resp_bits_entry_tag),
    .io_ptw_resp_bits_entry_asid(itlbRepeater2_io_ptw_resp_bits_entry_asid),
    .io_ptw_resp_bits_entry_ppn(itlbRepeater2_io_ptw_resp_bits_entry_ppn),
    .io_ptw_resp_bits_entry_perm_d(itlbRepeater2_io_ptw_resp_bits_entry_perm_d),
    .io_ptw_resp_bits_entry_perm_a(itlbRepeater2_io_ptw_resp_bits_entry_perm_a),
    .io_ptw_resp_bits_entry_perm_g(itlbRepeater2_io_ptw_resp_bits_entry_perm_g),
    .io_ptw_resp_bits_entry_perm_u(itlbRepeater2_io_ptw_resp_bits_entry_perm_u),
    .io_ptw_resp_bits_entry_perm_x(itlbRepeater2_io_ptw_resp_bits_entry_perm_x),
    .io_ptw_resp_bits_entry_perm_w(itlbRepeater2_io_ptw_resp_bits_entry_perm_w),
    .io_ptw_resp_bits_entry_perm_r(itlbRepeater2_io_ptw_resp_bits_entry_perm_r),
    .io_ptw_resp_bits_entry_level(itlbRepeater2_io_ptw_resp_bits_entry_level),
    .io_ptw_resp_bits_pf(itlbRepeater2_io_ptw_resp_bits_pf),
    .io_ptw_resp_bits_af(itlbRepeater2_io_ptw_resp_bits_af)
  );
  PTWFilter_1 dtlbRepeater1 ( // @[Repeater.scala 410:24]
    .clock(dtlbRepeater1_clock),
    .reset(dtlbRepeater1_reset),
    .io_sfence_valid(dtlbRepeater1_io_sfence_valid),
    .io_csr_satp_changed(dtlbRepeater1_io_csr_satp_changed),
    .io_tlb_req_0_valid(dtlbRepeater1_io_tlb_req_0_valid),
    .io_tlb_req_0_bits_vpn(dtlbRepeater1_io_tlb_req_0_bits_vpn),
    .io_tlb_req_1_valid(dtlbRepeater1_io_tlb_req_1_valid),
    .io_tlb_req_1_bits_vpn(dtlbRepeater1_io_tlb_req_1_bits_vpn),
    .io_tlb_req_2_valid(dtlbRepeater1_io_tlb_req_2_valid),
    .io_tlb_req_2_bits_vpn(dtlbRepeater1_io_tlb_req_2_bits_vpn),
    .io_tlb_req_3_valid(dtlbRepeater1_io_tlb_req_3_valid),
    .io_tlb_req_3_bits_vpn(dtlbRepeater1_io_tlb_req_3_bits_vpn),
    .io_tlb_resp_valid(dtlbRepeater1_io_tlb_resp_valid),
    .io_tlb_resp_bits_data_entry_tag(dtlbRepeater1_io_tlb_resp_bits_data_entry_tag),
    .io_tlb_resp_bits_data_entry_asid(dtlbRepeater1_io_tlb_resp_bits_data_entry_asid),
    .io_tlb_resp_bits_data_entry_ppn(dtlbRepeater1_io_tlb_resp_bits_data_entry_ppn),
    .io_tlb_resp_bits_data_entry_perm_d(dtlbRepeater1_io_tlb_resp_bits_data_entry_perm_d),
    .io_tlb_resp_bits_data_entry_perm_a(dtlbRepeater1_io_tlb_resp_bits_data_entry_perm_a),
    .io_tlb_resp_bits_data_entry_perm_g(dtlbRepeater1_io_tlb_resp_bits_data_entry_perm_g),
    .io_tlb_resp_bits_data_entry_perm_u(dtlbRepeater1_io_tlb_resp_bits_data_entry_perm_u),
    .io_tlb_resp_bits_data_entry_perm_x(dtlbRepeater1_io_tlb_resp_bits_data_entry_perm_x),
    .io_tlb_resp_bits_data_entry_perm_w(dtlbRepeater1_io_tlb_resp_bits_data_entry_perm_w),
    .io_tlb_resp_bits_data_entry_perm_r(dtlbRepeater1_io_tlb_resp_bits_data_entry_perm_r),
    .io_tlb_resp_bits_data_entry_level(dtlbRepeater1_io_tlb_resp_bits_data_entry_level),
    .io_tlb_resp_bits_data_pf(dtlbRepeater1_io_tlb_resp_bits_data_pf),
    .io_tlb_resp_bits_data_af(dtlbRepeater1_io_tlb_resp_bits_data_af),
    .io_tlb_resp_bits_vector_0(dtlbRepeater1_io_tlb_resp_bits_vector_0),
    .io_tlb_resp_bits_vector_1(dtlbRepeater1_io_tlb_resp_bits_vector_1),
    .io_tlb_resp_bits_vector_2(dtlbRepeater1_io_tlb_resp_bits_vector_2),
    .io_tlb_resp_bits_vector_3(dtlbRepeater1_io_tlb_resp_bits_vector_3),
    .io_tlb_resp_bits_vector_4(dtlbRepeater1_io_tlb_resp_bits_vector_4),
    .io_ptw_req_0_ready(dtlbRepeater1_io_ptw_req_0_ready),
    .io_ptw_req_0_valid(dtlbRepeater1_io_ptw_req_0_valid),
    .io_ptw_req_0_bits_vpn(dtlbRepeater1_io_ptw_req_0_bits_vpn),
    .io_ptw_resp_ready(dtlbRepeater1_io_ptw_resp_ready),
    .io_ptw_resp_valid(dtlbRepeater1_io_ptw_resp_valid),
    .io_ptw_resp_bits_entry_tag(dtlbRepeater1_io_ptw_resp_bits_entry_tag),
    .io_ptw_resp_bits_entry_asid(dtlbRepeater1_io_ptw_resp_bits_entry_asid),
    .io_ptw_resp_bits_entry_ppn(dtlbRepeater1_io_ptw_resp_bits_entry_ppn),
    .io_ptw_resp_bits_entry_perm_d(dtlbRepeater1_io_ptw_resp_bits_entry_perm_d),
    .io_ptw_resp_bits_entry_perm_a(dtlbRepeater1_io_ptw_resp_bits_entry_perm_a),
    .io_ptw_resp_bits_entry_perm_g(dtlbRepeater1_io_ptw_resp_bits_entry_perm_g),
    .io_ptw_resp_bits_entry_perm_u(dtlbRepeater1_io_ptw_resp_bits_entry_perm_u),
    .io_ptw_resp_bits_entry_perm_x(dtlbRepeater1_io_ptw_resp_bits_entry_perm_x),
    .io_ptw_resp_bits_entry_perm_w(dtlbRepeater1_io_ptw_resp_bits_entry_perm_w),
    .io_ptw_resp_bits_entry_perm_r(dtlbRepeater1_io_ptw_resp_bits_entry_perm_r),
    .io_ptw_resp_bits_entry_level(dtlbRepeater1_io_ptw_resp_bits_entry_level),
    .io_ptw_resp_bits_pf(dtlbRepeater1_io_ptw_resp_bits_pf),
    .io_ptw_resp_bits_af(dtlbRepeater1_io_ptw_resp_bits_af)
  );
  PTWRepeaterNB dtlbRepeater2 ( // @[Repeater.scala 383:26]
    .clock(dtlbRepeater2_clock),
    .reset(dtlbRepeater2_reset),
    .io_sfence_valid(dtlbRepeater2_io_sfence_valid),
    .io_csr_satp_changed(dtlbRepeater2_io_csr_satp_changed),
    .io_tlb_req_0_ready(dtlbRepeater2_io_tlb_req_0_ready),
    .io_tlb_req_0_valid(dtlbRepeater2_io_tlb_req_0_valid),
    .io_tlb_req_0_bits_vpn(dtlbRepeater2_io_tlb_req_0_bits_vpn),
    .io_tlb_resp_valid(dtlbRepeater2_io_tlb_resp_valid),
    .io_tlb_resp_bits_entry_tag(dtlbRepeater2_io_tlb_resp_bits_entry_tag),
    .io_tlb_resp_bits_entry_asid(dtlbRepeater2_io_tlb_resp_bits_entry_asid),
    .io_tlb_resp_bits_entry_ppn(dtlbRepeater2_io_tlb_resp_bits_entry_ppn),
    .io_tlb_resp_bits_entry_perm_d(dtlbRepeater2_io_tlb_resp_bits_entry_perm_d),
    .io_tlb_resp_bits_entry_perm_a(dtlbRepeater2_io_tlb_resp_bits_entry_perm_a),
    .io_tlb_resp_bits_entry_perm_g(dtlbRepeater2_io_tlb_resp_bits_entry_perm_g),
    .io_tlb_resp_bits_entry_perm_u(dtlbRepeater2_io_tlb_resp_bits_entry_perm_u),
    .io_tlb_resp_bits_entry_perm_x(dtlbRepeater2_io_tlb_resp_bits_entry_perm_x),
    .io_tlb_resp_bits_entry_perm_w(dtlbRepeater2_io_tlb_resp_bits_entry_perm_w),
    .io_tlb_resp_bits_entry_perm_r(dtlbRepeater2_io_tlb_resp_bits_entry_perm_r),
    .io_tlb_resp_bits_entry_level(dtlbRepeater2_io_tlb_resp_bits_entry_level),
    .io_tlb_resp_bits_pf(dtlbRepeater2_io_tlb_resp_bits_pf),
    .io_tlb_resp_bits_af(dtlbRepeater2_io_tlb_resp_bits_af),
    .io_ptw_req_0_ready(dtlbRepeater2_io_ptw_req_0_ready),
    .io_ptw_req_0_valid(dtlbRepeater2_io_ptw_req_0_valid),
    .io_ptw_req_0_bits_vpn(dtlbRepeater2_io_ptw_req_0_bits_vpn),
    .io_ptw_resp_ready(dtlbRepeater2_io_ptw_resp_ready),
    .io_ptw_resp_valid(dtlbRepeater2_io_ptw_resp_valid),
    .io_ptw_resp_bits_entry_tag(dtlbRepeater2_io_ptw_resp_bits_entry_tag),
    .io_ptw_resp_bits_entry_asid(dtlbRepeater2_io_ptw_resp_bits_entry_asid),
    .io_ptw_resp_bits_entry_ppn(dtlbRepeater2_io_ptw_resp_bits_entry_ppn),
    .io_ptw_resp_bits_entry_perm_d(dtlbRepeater2_io_ptw_resp_bits_entry_perm_d),
    .io_ptw_resp_bits_entry_perm_a(dtlbRepeater2_io_ptw_resp_bits_entry_perm_a),
    .io_ptw_resp_bits_entry_perm_g(dtlbRepeater2_io_ptw_resp_bits_entry_perm_g),
    .io_ptw_resp_bits_entry_perm_u(dtlbRepeater2_io_ptw_resp_bits_entry_perm_u),
    .io_ptw_resp_bits_entry_perm_x(dtlbRepeater2_io_ptw_resp_bits_entry_perm_x),
    .io_ptw_resp_bits_entry_perm_w(dtlbRepeater2_io_ptw_resp_bits_entry_perm_w),
    .io_ptw_resp_bits_entry_perm_r(dtlbRepeater2_io_ptw_resp_bits_entry_perm_r),
    .io_ptw_resp_bits_entry_level(dtlbRepeater2_io_ptw_resp_bits_entry_level),
    .io_ptw_resp_bits_pf(dtlbRepeater2_io_ptw_resp_bits_pf),
    .io_ptw_resp_bits_af(dtlbRepeater2_io_ptw_resp_bits_af)
  );
  ResetGen resetGen ( // @[ResetGen.scala 52:34]
    .clock(resetGen_clock),
    .reset(resetGen_reset),
    .o_reset(resetGen_o_reset)
  );
  ResetGen resetGen_1 ( // @[ResetGen.scala 52:34]
    .clock(resetGen_1_clock),
    .reset(resetGen_1_reset),
    .o_reset(resetGen_1_o_reset)
  );
  ResetGen resetGen_2 ( // @[ResetGen.scala 52:34]
    .clock(resetGen_2_clock),
    .reset(resetGen_2_reset),
    .o_reset(resetGen_2_o_reset)
  );
  ResetGen resetGen_3 ( // @[ResetGen.scala 52:34]
    .clock(resetGen_3_clock),
    .reset(resetGen_3_reset),
    .o_reset(resetGen_3_o_reset)
  );
  ResetGen resetGen_4 ( // @[ResetGen.scala 52:34]
    .clock(resetGen_4_clock),
    .reset(resetGen_4_reset),
    .o_reset(resetGen_4_o_reset)
  );
  ResetGen resetGen_5 ( // @[ResetGen.scala 52:34]
    .clock(resetGen_5_clock),
    .reset(resetGen_5_reset),
    .o_reset(resetGen_5_o_reset)
  );
  assign auto_memBlock_uncache_client_out_a_valid = memBlock_auto_uncache_client_out_a_valid; // @[LazyModule.scala 311:12]
  assign auto_memBlock_uncache_client_out_a_bits_opcode = memBlock_auto_uncache_client_out_a_bits_opcode; // @[LazyModule.scala 311:12]
  assign auto_memBlock_uncache_client_out_a_bits_size = memBlock_auto_uncache_client_out_a_bits_size; // @[LazyModule.scala 311:12]
  assign auto_memBlock_uncache_client_out_a_bits_source = memBlock_auto_uncache_client_out_a_bits_source; // @[LazyModule.scala 311:12]
  assign auto_memBlock_uncache_client_out_a_bits_address = memBlock_auto_uncache_client_out_a_bits_address; // @[LazyModule.scala 311:12]
  assign auto_memBlock_uncache_client_out_a_bits_mask = memBlock_auto_uncache_client_out_a_bits_mask; // @[LazyModule.scala 311:12]
  assign auto_memBlock_uncache_client_out_a_bits_data = memBlock_auto_uncache_client_out_a_bits_data; // @[LazyModule.scala 311:12]
  assign auto_memBlock_uncache_client_out_d_ready = memBlock_auto_uncache_client_out_d_ready; // @[LazyModule.scala 311:12]
  assign auto_memBlock_dcache_client_out_a_valid = memBlock_auto_dcache_client_out_a_valid; // @[LazyModule.scala 311:12]
  assign auto_memBlock_dcache_client_out_a_bits_opcode = memBlock_auto_dcache_client_out_a_bits_opcode; // @[LazyModule.scala 311:12]
  assign auto_memBlock_dcache_client_out_a_bits_param = memBlock_auto_dcache_client_out_a_bits_param; // @[LazyModule.scala 311:12]
  assign auto_memBlock_dcache_client_out_a_bits_size = memBlock_auto_dcache_client_out_a_bits_size; // @[LazyModule.scala 311:12]
  assign auto_memBlock_dcache_client_out_a_bits_source = memBlock_auto_dcache_client_out_a_bits_source; // @[LazyModule.scala 311:12]
  assign auto_memBlock_dcache_client_out_a_bits_address = memBlock_auto_dcache_client_out_a_bits_address; // @[LazyModule.scala 311:12]
  assign auto_memBlock_dcache_client_out_a_bits_mask = memBlock_auto_dcache_client_out_a_bits_mask; // @[LazyModule.scala 311:12]
  assign auto_memBlock_dcache_client_out_bready = memBlock_auto_dcache_client_out_bready; // @[LazyModule.scala 311:12]
  assign auto_memBlock_dcache_client_out_c_valid = memBlock_auto_dcache_client_out_c_valid; // @[LazyModule.scala 311:12]
  assign auto_memBlock_dcache_client_out_c_bits_opcode = memBlock_auto_dcache_client_out_c_bits_opcode; // @[LazyModule.scala 311:12]
  assign auto_memBlock_dcache_client_out_c_bits_param = memBlock_auto_dcache_client_out_c_bits_param; // @[LazyModule.scala 311:12]
  assign auto_memBlock_dcache_client_out_c_bits_size = memBlock_auto_dcache_client_out_c_bits_size; // @[LazyModule.scala 311:12]
  assign auto_memBlock_dcache_client_out_c_bits_source = memBlock_auto_dcache_client_out_c_bits_source; // @[LazyModule.scala 311:12]
  assign auto_memBlock_dcache_client_out_c_bits_address = memBlock_auto_dcache_client_out_c_bits_address; // @[LazyModule.scala 311:12]
  assign auto_memBlock_dcache_client_out_c_bits_echo_blockisdirty =
    memBlock_auto_dcache_client_out_c_bits_echo_blockisdirty; // @[LazyModule.scala 311:12]
  assign auto_memBlock_dcache_client_out_c_bits_data = memBlock_auto_dcache_client_out_c_bits_data; // @[LazyModule.scala 311:12]
  assign auto_memBlock_dcache_client_out_d_ready = memBlock_auto_dcache_client_out_d_ready; // @[LazyModule.scala 311:12]
  assign auto_memBlock_dcache_client_out_e_valid = memBlock_auto_dcache_client_out_e_valid; // @[LazyModule.scala 311:12]
  assign auto_memBlock_dcache_client_out_e_bits_sink = memBlock_auto_dcache_client_out_e_bits_sink; // @[LazyModule.scala 311:12]
  assign auto_ptw_to_l2_buffer_out_a_valid = ptw_to_l2_buffer_auto_out_a_valid; // @[LazyModule.scala 311:12]
  assign auto_ptw_to_l2_buffer_out_a_bits_opcode = ptw_to_l2_buffer_auto_out_a_bits_opcode; // @[LazyModule.scala 311:12]
  assign auto_ptw_to_l2_buffer_out_a_bits_param = ptw_to_l2_buffer_auto_out_a_bits_param; // @[LazyModule.scala 311:12]
  assign auto_ptw_to_l2_buffer_out_a_bits_size = ptw_to_l2_buffer_auto_out_a_bits_size; // @[LazyModule.scala 311:12]
  assign auto_ptw_to_l2_buffer_out_a_bits_source = ptw_to_l2_buffer_auto_out_a_bits_source; // @[LazyModule.scala 311:12]
  assign auto_ptw_to_l2_buffer_out_a_bits_address = ptw_to_l2_buffer_auto_out_a_bits_address; // @[LazyModule.scala 311:12]
  assign auto_ptw_to_l2_buffer_out_a_bits_mask = ptw_to_l2_buffer_auto_out_a_bits_mask; // @[LazyModule.scala 311:12]
  assign auto_ptw_to_l2_buffer_out_a_bits_data = ptw_to_l2_buffer_auto_out_a_bits_data; // @[LazyModule.scala 311:12]
  assign auto_ptw_to_l2_buffer_out_d_ready = ptw_to_l2_buffer_auto_out_d_ready; // @[LazyModule.scala 311:12]
  assign auto_frontend_icache_client_out_a_valid = frontend_auto_icache_client_out_a_valid; // @[LazyModule.scala 311:12]
  assign auto_frontend_icache_client_out_a_bits_opcode = frontend_auto_icache_client_out_a_bits_opcode; // @[LazyModule.scala 311:12]
  assign auto_frontend_icache_client_out_a_bits_size = frontend_auto_icache_client_out_a_bits_size; // @[LazyModule.scala 311:12]
  assign auto_frontend_icache_client_out_a_bits_source = frontend_auto_icache_client_out_a_bits_source; // @[LazyModule.scala 311:12]
  assign auto_frontend_icache_client_out_a_bits_address = frontend_auto_icache_client_out_a_bits_address; // @[LazyModule.scala 311:12]
  assign auto_frontend_icache_client_out_a_bits_mask = frontend_auto_icache_client_out_a_bits_mask; // @[LazyModule.scala 311:12]
  assign auto_frontend_icache_client_out_bready = frontend_auto_icache_client_out_bready; // @[LazyModule.scala 311:12]
  assign auto_frontend_icache_client_out_c_valid = frontend_auto_icache_client_out_c_valid; // @[LazyModule.scala 311:12]
  assign auto_frontend_icache_client_out_c_bits_opcode = frontend_auto_icache_client_out_c_bits_opcode; // @[LazyModule.scala 311:12]
  assign auto_frontend_icache_client_out_c_bits_param = frontend_auto_icache_client_out_c_bits_param; // @[LazyModule.scala 311:12]
  assign auto_frontend_icache_client_out_c_bits_address = frontend_auto_icache_client_out_c_bits_address; // @[LazyModule.scala 311:12]
  assign auto_frontend_icache_client_out_c_bits_echo_blockisdirty =
    frontend_auto_icache_client_out_c_bits_echo_blockisdirty; // @[LazyModule.scala 311:12]
  assign auto_frontend_icache_client_out_c_bits_data = frontend_auto_icache_client_out_c_bits_data; // @[LazyModule.scala 311:12]
  assign auto_frontend_icache_client_out_d_ready = frontend_auto_icache_client_out_d_ready; // @[LazyModule.scala 311:12]
  assign auto_frontend_icache_client_out_e_valid = frontend_auto_icache_client_out_e_valid; // @[LazyModule.scala 311:12]
  assign auto_frontend_icache_client_out_e_bits_sink = frontend_auto_icache_client_out_e_bits_sink; // @[LazyModule.scala 311:12]
  assign auto_frontend_instrUncache_client_out_a_valid = frontend_auto_instrUncache_client_out_a_valid; // @[LazyModule.scala 311:12]
  assign auto_frontend_instrUncache_client_out_a_bits_address = frontend_auto_instrUncache_client_out_a_bits_address; // @[LazyModule.scala 311:12]
  assign auto_frontend_instrUncache_client_out_d_ready = frontend_auto_instrUncache_client_out_d_ready; // @[LazyModule.scala 311:12]
  assign io_cpu_halt = ctrlBlock_io_cpu_halt; // @[XSCore.scala 270:15]
  assign io_beu_errors_icache_ecc_error_valid = frontend_io_error_report_to_beu; // @[Bundle.scala 581:24 582:30]
  assign io_beu_errors_icache_ecc_error_bits = frontend_io_error_paddr; // @[Bundle.scala 581:24 583:29]
  assign io_beu_errors_dcache_ecc_error_valid = memBlock_io_error_report_to_beu; // @[Bundle.scala 581:24 582:30]
  assign io_beu_errors_dcache_ecc_error_bits = memBlock_io_error_paddr; // @[Bundle.scala 581:24 583:29]
  assign frontend_clock = clock;
  assign frontend_reset = resetGen_5_o_reset; // @[ResetGen.scala 50:30 53:22]
  assign frontend_auto_icache_client_out_a_ready = auto_frontend_icache_client_out_a_ready; // @[LazyModule.scala 311:12]
  assign frontend_auto_icache_client_out_bvalid = auto_frontend_icache_client_out_bvalid; // @[LazyModule.scala 311:12]
  assign frontend_auto_icache_client_out_bparam = auto_frontend_icache_client_out_bparam; // @[LazyModule.scala 311:12]
  assign frontend_auto_icache_client_out_baddress = auto_frontend_icache_client_out_baddress; // @[LazyModule.scala 311:12]
  assign frontend_auto_icache_client_out_bdata = auto_frontend_icache_client_out_bdata; // @[LazyModule.scala 311:12]
  assign frontend_auto_icache_client_out_c_ready = auto_frontend_icache_client_out_c_ready; // @[LazyModule.scala 311:12]
  assign frontend_auto_icache_client_out_d_valid = auto_frontend_icache_client_out_d_valid; // @[LazyModule.scala 311:12]
  assign frontend_auto_icache_client_out_d_bits_opcode = auto_frontend_icache_client_out_d_bits_opcode; // @[LazyModule.scala 311:12]
  assign frontend_auto_icache_client_out_d_bits_param = auto_frontend_icache_client_out_d_bits_param; // @[LazyModule.scala 311:12]
  assign frontend_auto_icache_client_out_d_bits_source = auto_frontend_icache_client_out_d_bits_source; // @[LazyModule.scala 311:12]
  assign frontend_auto_icache_client_out_d_bits_sink = auto_frontend_icache_client_out_d_bits_sink; // @[LazyModule.scala 311:12]
  assign frontend_auto_icache_client_out_d_bits_echo_blockisdirty =
    auto_frontend_icache_client_out_d_bits_echo_blockisdirty; // @[LazyModule.scala 311:12]
  assign frontend_auto_icache_client_out_d_bits_data = auto_frontend_icache_client_out_d_bits_data; // @[LazyModule.scala 311:12]
  assign frontend_auto_icache_client_out_d_bits_corrupt = auto_frontend_icache_client_out_d_bits_corrupt; // @[LazyModule.scala 311:12]
  assign frontend_auto_icache_client_out_e_ready = auto_frontend_icache_client_out_e_ready; // @[LazyModule.scala 311:12]
  assign frontend_auto_instrUncache_client_out_a_ready = auto_frontend_instrUncache_client_out_a_ready; // @[LazyModule.scala 311:12]
  assign frontend_auto_instrUncache_client_out_d_valid = auto_frontend_instrUncache_client_out_d_valid; // @[LazyModule.scala 311:12]
  assign frontend_auto_instrUncache_client_out_d_bits_source = auto_frontend_instrUncache_client_out_d_bits_source; // @[LazyModule.scala 311:12]
  assign frontend_auto_instrUncache_client_out_d_bits_data = auto_frontend_instrUncache_client_out_d_bits_data; // @[LazyModule.scala 311:12]
  assign frontend_io_reset_vector = io_reset_vector; // @[XSCore.scala 268:28]
  assign frontend_io_ptw_req_0_ready = itlbRepeater1_io_tlb_req_0_ready; // @[Repeater.scala 145:14]
  assign frontend_io_ptw_req_1_ready = itlbRepeater1_io_tlb_req_1_ready; // @[Repeater.scala 145:14]
  assign frontend_io_ptw_req_3_ready = itlbRepeater1_io_tlb_req_3_ready; // @[Repeater.scala 145:14]
  assign frontend_io_ptw_resp_valid = itlbRepeater1_io_tlb_resp_valid; // @[Repeater.scala 145:14]
  assign frontend_io_ptw_resp_bits_data_entry_tag = itlbRepeater1_io_tlb_resp_bits_data_entry_tag; // @[Repeater.scala 145:14]
  assign frontend_io_ptw_resp_bits_data_entry_asid = itlbRepeater1_io_tlb_resp_bits_data_entry_asid; // @[Repeater.scala 145:14]
  assign frontend_io_ptw_resp_bits_data_entry_ppn = itlbRepeater1_io_tlb_resp_bits_data_entry_ppn; // @[Repeater.scala 145:14]
  assign frontend_io_ptw_resp_bits_data_entry_perm_d = itlbRepeater1_io_tlb_resp_bits_data_entry_perm_d; // @[Repeater.scala 145:14]
  assign frontend_io_ptw_resp_bits_data_entry_perm_a = itlbRepeater1_io_tlb_resp_bits_data_entry_perm_a; // @[Repeater.scala 145:14]
  assign frontend_io_ptw_resp_bits_data_entry_perm_g = itlbRepeater1_io_tlb_resp_bits_data_entry_perm_g; // @[Repeater.scala 145:14]
  assign frontend_io_ptw_resp_bits_data_entry_perm_u = itlbRepeater1_io_tlb_resp_bits_data_entry_perm_u; // @[Repeater.scala 145:14]
  assign frontend_io_ptw_resp_bits_data_entry_perm_x = itlbRepeater1_io_tlb_resp_bits_data_entry_perm_x; // @[Repeater.scala 145:14]
  assign frontend_io_ptw_resp_bits_data_entry_perm_w = itlbRepeater1_io_tlb_resp_bits_data_entry_perm_w; // @[Repeater.scala 145:14]
  assign frontend_io_ptw_resp_bits_data_entry_perm_r = itlbRepeater1_io_tlb_resp_bits_data_entry_perm_r; // @[Repeater.scala 145:14]
  assign frontend_io_ptw_resp_bits_data_entry_level = itlbRepeater1_io_tlb_resp_bits_data_entry_level; // @[Repeater.scala 145:14]
  assign frontend_io_ptw_resp_bits_data_pf = itlbRepeater1_io_tlb_resp_bits_data_pf; // @[Repeater.scala 145:14]
  assign frontend_io_ptw_resp_bits_data_af = itlbRepeater1_io_tlb_resp_bits_data_af; // @[Repeater.scala 145:14]
  assign frontend_io_backend_cfVec_0_ready = ctrlBlock_io_frontend_cfVec_0_ready; // @[XSCore.scala 292:23]
  assign frontend_io_backend_cfVec_1_ready = ctrlBlock_io_frontend_cfVec_1_ready; // @[XSCore.scala 292:23]
  assign frontend_io_backend_toFtq_rob_commits_0_valid = ctrlBlock_io_frontend_toFtq_rob_commits_0_valid; // @[XSCore.scala 292:23]
  assign frontend_io_backend_toFtq_rob_commits_0_bits_commitType =
    ctrlBlock_io_frontend_toFtq_rob_commits_0_bits_commitType; // @[XSCore.scala 292:23]
  assign frontend_io_backend_toFtq_rob_commits_0_bits_ftqIdx_flag =
    ctrlBlock_io_frontend_toFtq_rob_commits_0_bits_ftqIdx_flag; // @[XSCore.scala 292:23]
  assign frontend_io_backend_toFtq_rob_commits_0_bits_ftqIdx_value =
    ctrlBlock_io_frontend_toFtq_rob_commits_0_bits_ftqIdx_value; // @[XSCore.scala 292:23]
  assign frontend_io_backend_toFtq_rob_commits_0_bits_ftqOffset =
    ctrlBlock_io_frontend_toFtq_rob_commits_0_bits_ftqOffset; // @[XSCore.scala 292:23]
  assign frontend_io_backend_toFtq_rob_commits_1_valid = ctrlBlock_io_frontend_toFtq_rob_commits_1_valid; // @[XSCore.scala 292:23]
  assign frontend_io_backend_toFtq_rob_commits_1_bits_commitType =
    ctrlBlock_io_frontend_toFtq_rob_commits_1_bits_commitType; // @[XSCore.scala 292:23]
  assign frontend_io_backend_toFtq_rob_commits_1_bits_ftqIdx_flag =
    ctrlBlock_io_frontend_toFtq_rob_commits_1_bits_ftqIdx_flag; // @[XSCore.scala 292:23]
  assign frontend_io_backend_toFtq_rob_commits_1_bits_ftqIdx_value =
    ctrlBlock_io_frontend_toFtq_rob_commits_1_bits_ftqIdx_value; // @[XSCore.scala 292:23]
  assign frontend_io_backend_toFtq_rob_commits_1_bits_ftqOffset =
    ctrlBlock_io_frontend_toFtq_rob_commits_1_bits_ftqOffset; // @[XSCore.scala 292:23]
  assign frontend_io_backend_toFtq_redirect_valid = ctrlBlock_io_frontend_toFtq_redirect_valid; // @[XSCore.scala 292:23]
  assign frontend_io_backend_toFtq_redirect_bits_ftqIdx_flag = ctrlBlock_io_frontend_toFtq_redirect_bits_ftqIdx_flag; // @[XSCore.scala 292:23]
  assign frontend_io_backend_toFtq_redirect_bits_ftqIdx_value = ctrlBlock_io_frontend_toFtq_redirect_bits_ftqIdx_value; // @[XSCore.scala 292:23]
  assign frontend_io_backend_toFtq_redirect_bits_ftqOffset = ctrlBlock_io_frontend_toFtq_redirect_bits_ftqOffset; // @[XSCore.scala 292:23]
  assign frontend_io_backend_toFtq_redirect_bits_level = ctrlBlock_io_frontend_toFtq_redirect_bits_level; // @[XSCore.scala 292:23]
  assign frontend_io_backend_toFtq_redirect_bits_cfiUpdate_pc = ctrlBlock_io_frontend_toFtq_redirect_bits_cfiUpdate_pc; // @[XSCore.scala 292:23]
  assign frontend_io_backend_toFtq_redirect_bits_cfiUpdate_pd_isRVC =
    ctrlBlock_io_frontend_toFtq_redirect_bits_cfiUpdate_pd_isRVC; // @[XSCore.scala 292:23]
  assign frontend_io_backend_toFtq_redirect_bits_cfiUpdate_pd_brType =
    ctrlBlock_io_frontend_toFtq_redirect_bits_cfiUpdate_pd_brType; // @[XSCore.scala 292:23]
  assign frontend_io_backend_toFtq_redirect_bits_cfiUpdate_pd_isCall =
    ctrlBlock_io_frontend_toFtq_redirect_bits_cfiUpdate_pd_isCall; // @[XSCore.scala 292:23]
  assign frontend_io_backend_toFtq_redirect_bits_cfiUpdate_pd_isRet =
    ctrlBlock_io_frontend_toFtq_redirect_bits_cfiUpdate_pd_isRet; // @[XSCore.scala 292:23]
  assign frontend_io_backend_toFtq_redirect_bits_cfiUpdate_target =
    ctrlBlock_io_frontend_toFtq_redirect_bits_cfiUpdate_target; // @[XSCore.scala 292:23]
  assign frontend_io_backend_toFtq_redirect_bits_cfiUpdate_taken =
    ctrlBlock_io_frontend_toFtq_redirect_bits_cfiUpdate_taken; // @[XSCore.scala 292:23]
  assign frontend_io_backend_toFtq_redirect_bits_cfiUpdate_isMisPred =
    ctrlBlock_io_frontend_toFtq_redirect_bits_cfiUpdate_isMisPred; // @[XSCore.scala 292:23]
  assign frontend_io_sfence_valid = exuBlocks_io_fuExtra_fenceio_sfence_valid; // @[XSCore.scala 293:22]
  assign frontend_io_sfence_bits_rs1 = exuBlocks_io_fuExtra_fenceio_sfence_bits_rs1; // @[XSCore.scala 293:22]
  assign frontend_io_sfence_bits_rs2 = exuBlocks_io_fuExtra_fenceio_sfence_bits_rs2; // @[XSCore.scala 293:22]
  assign frontend_io_sfence_bits_addr = exuBlocks_io_fuExtra_fenceio_sfence_bits_addr; // @[XSCore.scala 293:22]
  assign frontend_io_sfence_bits_asid = exuBlocks_io_fuExtra_fenceio_sfence_bits_asid; // @[XSCore.scala 293:22]
  assign frontend_io_tlbCsr_satp_mode = exuBlocks_io_fuExtra_csrio_tlb_satp_mode; // @[XSCore.scala 294:22]
  assign frontend_io_tlbCsr_satp_asid = exuBlocks_io_fuExtra_csrio_tlb_satp_asid; // @[XSCore.scala 294:22]
  assign frontend_io_tlbCsr_satp_ppn = exuBlocks_io_fuExtra_csrio_tlb_satp_ppn; // @[XSCore.scala 294:22]
  assign frontend_io_tlbCsr_satp_changed = exuBlocks_io_fuExtra_csrio_tlb_satp_changed; // @[XSCore.scala 294:22]
  assign frontend_io_tlbCsr_priv_mxr = exuBlocks_io_fuExtra_csrio_tlb_priv_mxr; // @[XSCore.scala 294:22]
  assign frontend_io_tlbCsr_priv_sum = exuBlocks_io_fuExtra_csrio_tlb_priv_sum; // @[XSCore.scala 294:22]
  assign frontend_io_tlbCsr_priv_imode = exuBlocks_io_fuExtra_csrio_tlb_priv_imode; // @[XSCore.scala 294:22]
  assign frontend_io_tlbCsr_priv_dmode = exuBlocks_io_fuExtra_csrio_tlb_priv_dmode; // @[XSCore.scala 294:22]
  assign frontend_io_csrCtrl_icache_parity_enable = exuBlocks_io_fuExtra_csrio_customCtrl_icache_parity_enable; // @[XSCore.scala 295:23]
  assign frontend_io_csrCtrl_lvpred_disable = exuBlocks_io_fuExtra_csrio_customCtrl_lvpred_disable; // @[XSCore.scala 295:23]
  assign frontend_io_csrCtrl_no_spec_load = exuBlocks_io_fuExtra_csrio_customCtrl_no_spec_load; // @[XSCore.scala 295:23]
  assign frontend_io_csrCtrl_storeset_wait_store = exuBlocks_io_fuExtra_csrio_customCtrl_storeset_wait_store; // @[XSCore.scala 295:23]
  assign frontend_io_csrCtrl_lvpred_timeout = exuBlocks_io_fuExtra_csrio_customCtrl_lvpred_timeout; // @[XSCore.scala 295:23]
  assign frontend_io_csrCtrl_bp_ctrl_ubtb_enable = exuBlocks_io_fuExtra_csrio_customCtrl_bp_ctrl_ubtb_enable; // @[XSCore.scala 295:23]
  assign frontend_io_csrCtrl_bp_ctrl_btb_enable = exuBlocks_io_fuExtra_csrio_customCtrl_bp_ctrl_btb_enable; // @[XSCore.scala 295:23]
  assign frontend_io_csrCtrl_bp_ctrl_tage_enable = exuBlocks_io_fuExtra_csrio_customCtrl_bp_ctrl_tage_enable; // @[XSCore.scala 295:23]
  assign frontend_io_csrCtrl_bp_ctrl_sc_enable = exuBlocks_io_fuExtra_csrio_customCtrl_bp_ctrl_sc_enable; // @[XSCore.scala 295:23]
  assign frontend_io_csrCtrl_bp_ctrl_ras_enable = exuBlocks_io_fuExtra_csrio_customCtrl_bp_ctrl_ras_enable; // @[XSCore.scala 295:23]
  assign frontend_io_csrCtrl_sbuffer_threshold = exuBlocks_io_fuExtra_csrio_customCtrl_sbuffer_threshold; // @[XSCore.scala 295:23]
  assign frontend_io_csrCtrl_ldld_vio_check_enable = exuBlocks_io_fuExtra_csrio_customCtrl_ldld_vio_check_enable; // @[XSCore.scala 295:23]
  assign frontend_io_csrCtrl_cache_error_enable = exuBlocks_io_fuExtra_csrio_customCtrl_cache_error_enable; // @[XSCore.scala 295:23]
  assign frontend_io_csrCtrl_uncache_write_outstanding_enable =
    exuBlocks_io_fuExtra_csrio_customCtrl_uncache_write_outstanding_enable; // @[XSCore.scala 295:23]
  assign frontend_io_csrCtrl_fusion_enable = exuBlocks_io_fuExtra_csrio_customCtrl_fusion_enable; // @[XSCore.scala 295:23]
  assign frontend_io_csrCtrl_wfi_enable = exuBlocks_io_fuExtra_csrio_customCtrl_wfi_enable; // @[XSCore.scala 295:23]
  assign frontend_io_csrCtrl_svinval_enable = exuBlocks_io_fuExtra_csrio_customCtrl_svinval_enable; // @[XSCore.scala 295:23]
  assign frontend_io_csrCtrl_distribute_csr_wvalid = exuBlocks_io_fuExtra_csrio_customCtrl_distribute_csr_wvalid; // @[XSCore.scala 295:23]
  assign frontend_io_csrCtrl_distribute_csr_waddr =
    exuBlocks_io_fuExtra_csrio_customCtrl_distribute_csr_waddr; // @[XSCore.scala 295:23]
  assign frontend_io_csrCtrl_distribute_csr_wdata =
    exuBlocks_io_fuExtra_csrio_customCtrl_distribute_csr_wdata; // @[XSCore.scala 295:23]
  assign frontend_io_csrCtrl_singlestep = exuBlocks_io_fuExtra_csrio_customCtrl_singlestep; // @[XSCore.scala 295:23]
  assign frontend_io_csrCtrl_frontend_trigger_t_valid = exuBlocks_io_fuExtra_csrio_customCtrl_frontend_trigger_t_valid; // @[XSCore.scala 295:23]
  assign frontend_io_csrCtrl_frontend_trigger_t_bits_addr =
    exuBlocks_io_fuExtra_csrio_customCtrl_frontend_trigger_t_bits_addr; // @[XSCore.scala 295:23]
  assign frontend_io_csrCtrl_frontend_trigger_t_bits_tdata_matchType =
    exuBlocks_io_fuExtra_csrio_customCtrl_frontend_trigger_t_bits_tdata_matchType; // @[XSCore.scala 295:23]
  assign frontend_io_csrCtrl_frontend_trigger_t_bits_tdata_select =
    exuBlocks_io_fuExtra_csrio_customCtrl_frontend_trigger_t_bits_tdata_select; // @[XSCore.scala 295:23]
  assign frontend_io_csrCtrl_frontend_trigger_t_bits_tdata_timing =
    exuBlocks_io_fuExtra_csrio_customCtrl_frontend_trigger_t_bits_tdata_timing; // @[XSCore.scala 295:23]
  assign frontend_io_csrCtrl_frontend_trigger_t_bits_tdata_chain =
    exuBlocks_io_fuExtra_csrio_customCtrl_frontend_trigger_t_bits_tdata_chain; // @[XSCore.scala 295:23]
  assign frontend_io_csrCtrl_frontend_trigger_t_bits_tdata_tdata2 =
    exuBlocks_io_fuExtra_csrio_customCtrl_frontend_trigger_t_bits_tdata_tdata2; // @[XSCore.scala 295:23]
  assign frontend_io_csrCtrl_mem_trigger_t_valid = exuBlocks_io_fuExtra_csrio_customCtrl_mem_trigger_t_valid; // @[XSCore.scala 295:23]
  assign frontend_io_csrCtrl_mem_trigger_t_bits_addr = exuBlocks_io_fuExtra_csrio_customCtrl_mem_trigger_t_bits_addr; // @[XSCore.scala 295:23]
  assign frontend_io_csrCtrl_mem_trigger_t_bits_tdata_matchType =
    exuBlocks_io_fuExtra_csrio_customCtrl_mem_trigger_t_bits_tdata_matchType; // @[XSCore.scala 295:23]
  assign frontend_io_csrCtrl_mem_trigger_t_bits_tdata_select =
    exuBlocks_io_fuExtra_csrio_customCtrl_mem_trigger_t_bits_tdata_select; // @[XSCore.scala 295:23]
  assign frontend_io_csrCtrl_mem_trigger_t_bits_tdata_chain =
    exuBlocks_io_fuExtra_csrio_customCtrl_mem_trigger_t_bits_tdata_chain; // @[XSCore.scala 295:23]
  assign frontend_io_csrCtrl_mem_trigger_t_bits_tdata_tdata2 =
    exuBlocks_io_fuExtra_csrio_customCtrl_mem_trigger_t_bits_tdata_tdata2; // @[XSCore.scala 295:23]
  assign frontend_io_csrCtrl_trigger_enable_0 = exuBlocks_io_fuExtra_csrio_customCtrl_trigger_enable_0; // @[XSCore.scala 295:23]
  assign frontend_io_csrCtrl_trigger_enable_1 = exuBlocks_io_fuExtra_csrio_customCtrl_trigger_enable_1; // @[XSCore.scala 295:23]
  assign frontend_io_csrCtrl_trigger_enable_2 = exuBlocks_io_fuExtra_csrio_customCtrl_trigger_enable_2; // @[XSCore.scala 295:23]
  assign frontend_io_csrCtrl_trigger_enable_3 = exuBlocks_io_fuExtra_csrio_customCtrl_trigger_enable_3; // @[XSCore.scala 295:23]
  assign frontend_io_csrCtrl_trigger_enable_4 = exuBlocks_io_fuExtra_csrio_customCtrl_trigger_enable_4; // @[XSCore.scala 295:23]
  assign frontend_io_csrCtrl_trigger_enable_5 = exuBlocks_io_fuExtra_csrio_customCtrl_trigger_enable_5; // @[XSCore.scala 295:23]
  assign frontend_io_csrCtrl_trigger_enable_6 = exuBlocks_io_fuExtra_csrio_customCtrl_trigger_enable_6; // @[XSCore.scala 295:23]
  assign frontend_io_csrCtrl_trigger_enable_7 = exuBlocks_io_fuExtra_csrio_customCtrl_trigger_enable_7; // @[XSCore.scala 295:23]
  assign frontend_io_csrCtrl_trigger_enable_8 = exuBlocks_io_fuExtra_csrio_customCtrl_trigger_enable_8; // @[XSCore.scala 295:23]
  assign frontend_io_csrCtrl_trigger_enable_9 = exuBlocks_io_fuExtra_csrio_customCtrl_trigger_enable_9; // @[XSCore.scala 295:23]
  assign ptw_clock = clock;
  assign ptw_reset = resetGen_1_o_reset; // @[ResetGen.scala 50:30 53:22]
  assign ptw_auto_out_a_ready = ptw_to_l2_buffer_auto_in_a_ready; // @[LazyModule.scala 298:16]
  assign ptw_auto_out_d_valid = ptw_to_l2_buffer_auto_in_d_valid; // @[LazyModule.scala 298:16]
  assign ptw_auto_out_d_bits_opcode = ptw_to_l2_buffer_auto_in_d_bits_opcode; // @[LazyModule.scala 298:16]
  assign ptw_auto_out_d_bits_size = ptw_to_l2_buffer_auto_in_d_bits_size; // @[LazyModule.scala 298:16]
  assign ptw_auto_out_d_bits_source = ptw_to_l2_buffer_auto_in_d_bits_source; // @[LazyModule.scala 298:16]
  assign ptw_auto_out_d_bits_data = ptw_to_l2_buffer_auto_in_d_bits_data; // @[LazyModule.scala 298:16]
  assign ptw_io_tlb_0_req_0_valid = itlbRepeater2_io_ptw_req_0_valid; // @[Repeater.scala 35:14]
  assign ptw_io_tlb_0_req_0_bits_vpn = itlbRepeater2_io_ptw_req_0_bits_vpn; // @[Repeater.scala 35:14]
  assign ptw_io_tlb_0_resp_ready = itlbRepeater2_io_ptw_resp_ready; // @[Repeater.scala 35:14]
  assign ptw_io_tlb_1_req_0_valid = dtlbRepeater2_io_ptw_req_0_valid; // @[Repeater.scala 35:14]
  assign ptw_io_tlb_1_req_0_bits_vpn = dtlbRepeater2_io_ptw_req_0_bits_vpn; // @[Repeater.scala 35:14]
  assign ptw_io_tlb_1_resp_ready = dtlbRepeater2_io_ptw_resp_ready; // @[Repeater.scala 35:14]
  assign ptw_io_sfence_valid = exuBlocks_io_fuExtra_fenceio_sfence_valid; // @[XSCore.scala 435:17]
  assign ptw_io_sfence_bits_rs1 = exuBlocks_io_fuExtra_fenceio_sfence_bits_rs1; // @[XSCore.scala 435:17]
  assign ptw_io_sfence_bits_rs2 = exuBlocks_io_fuExtra_fenceio_sfence_bits_rs2; // @[XSCore.scala 435:17]
  assign ptw_io_sfence_bits_addr = exuBlocks_io_fuExtra_fenceio_sfence_bits_addr; // @[XSCore.scala 435:17]
  assign ptw_io_sfence_bits_asid = exuBlocks_io_fuExtra_fenceio_sfence_bits_asid; // @[XSCore.scala 435:17]
  assign ptw_io_csr_tlb_satp_asid = exuBlocks_io_fuExtra_csrio_tlb_satp_asid; // @[XSCore.scala 436:18]
  assign ptw_io_csr_tlb_satp_ppn = exuBlocks_io_fuExtra_csrio_tlb_satp_ppn; // @[XSCore.scala 436:18]
  assign ptw_io_csr_tlb_satp_changed = exuBlocks_io_fuExtra_csrio_tlb_satp_changed; // @[XSCore.scala 436:18]
  assign ptw_io_csr_distribute_csr_wvalid = exuBlocks_io_fuExtra_csrio_customCtrl_distribute_csr_wvalid; // @[XSCore.scala 437:29]
  assign ptw_io_csr_distribute_csr_waddr = exuBlocks_io_fuExtra_csrio_customCtrl_distribute_csr_waddr; // @[XSCore.scala 437:29]
  assign ptw_io_csr_distribute_csr_wdata = exuBlocks_io_fuExtra_csrio_customCtrl_distribute_csr_wdata; // @[XSCore.scala 437:29]
  assign ptw_to_l2_buffer_clock = clock;
  assign ptw_to_l2_buffer_reset = resetGen_1_o_reset; // @[ResetGen.scala 50:30 53:22]
  assign ptw_to_l2_buffer_auto_in_a_valid = ptw_auto_out_a_valid; // @[LazyModule.scala 298:16]
  assign ptw_to_l2_buffer_auto_in_a_bits_opcode = 3'h4; // @[LazyModule.scala 298:16]
  assign ptw_to_l2_buffer_auto_in_a_bits_param = 3'h0; // @[LazyModule.scala 298:16]
  assign ptw_to_l2_buffer_auto_in_a_bits_size = 3'h6; // @[LazyModule.scala 298:16]
  assign ptw_to_l2_buffer_auto_in_a_bits_source = ptw_auto_out_a_bits_source; // @[LazyModule.scala 298:16]
  assign ptw_to_l2_buffer_auto_in_a_bits_address = ptw_auto_out_a_bits_address; // @[LazyModule.scala 298:16]
  assign ptw_to_l2_buffer_auto_in_a_bits_mask = 32'hffffffff; // @[LazyModule.scala 298:16]
  assign ptw_to_l2_buffer_auto_in_a_bits_data = 256'h0; // @[LazyModule.scala 298:16]
  assign ptw_to_l2_buffer_auto_in_d_ready = 1'h1; // @[LazyModule.scala 298:16]
  assign ptw_to_l2_buffer_auto_out_a_ready = auto_ptw_to_l2_buffer_out_a_ready; // @[LazyModule.scala 311:12]
  assign ptw_to_l2_buffer_auto_out_d_valid = auto_ptw_to_l2_buffer_out_d_valid; // @[LazyModule.scala 311:12]
  assign ptw_to_l2_buffer_auto_out_d_bits_opcode = auto_ptw_to_l2_buffer_out_d_bits_opcode; // @[LazyModule.scala 311:12]
  assign ptw_to_l2_buffer_auto_out_d_bits_size = auto_ptw_to_l2_buffer_out_d_bits_size; // @[LazyModule.scala 311:12]
  assign ptw_to_l2_buffer_auto_out_d_bits_source = auto_ptw_to_l2_buffer_out_d_bits_source; // @[LazyModule.scala 311:12]
  assign ptw_to_l2_buffer_auto_out_d_bits_denied = auto_ptw_to_l2_buffer_out_d_bits_denied; // @[LazyModule.scala 311:12]
  assign ptw_to_l2_buffer_auto_out_d_bits_data = auto_ptw_to_l2_buffer_out_d_bits_data; // @[LazyModule.scala 311:12]
  assign ptw_to_l2_buffer_auto_out_d_bits_corrupt = auto_ptw_to_l2_buffer_out_d_bits_corrupt; // @[LazyModule.scala 311:12]
  assign wbArbiter_clock = clock;
  assign wbArbiter_reset = resetGen_3_o_reset; // @[ResetGen.scala 50:30 53:22]
  assign wbArbiter_io_hartId = io_hartId[7:0]; // @[XSCore.scala 267:36]
  assign wbArbiter_io_redirect_valid = ctrlBlock_io_redirect_valid; // @[XSCore.scala 272:38]
  assign wbArbiter_io_redirect_bits_robIdx_flag = ctrlBlock_io_redirect_bits_robIdx_flag; // @[XSCore.scala 272:38]
  assign wbArbiter_io_redirect_bits_robIdx_value = ctrlBlock_io_redirect_bits_robIdx_value; // @[XSCore.scala 272:38]
  assign wbArbiter_io_redirect_bits_level = ctrlBlock_io_redirect_bits_level; // @[XSCore.scala 272:38]
  assign wbArbiter_io_in_0_valid = exuBlocks_io_fuWriteback_0_valid; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_0_bits_uop_ctrl_rfWen = exuBlocks_io_fuWriteback_0_bits_uop_ctrl_rfWen; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_0_bits_uop_pdest = exuBlocks_io_fuWriteback_0_bits_uop_pdest; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_0_bits_uop_robIdx_flag = exuBlocks_io_fuWriteback_0_bits_uop_robIdx_flag; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_0_bits_uop_robIdx_value = exuBlocks_io_fuWriteback_0_bits_uop_robIdx_value; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_0_bits_data = exuBlocks_io_fuWriteback_0_bits_data; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_0_bits_redirectValid = exuBlocks_io_fuWriteback_0_bits_redirectValid; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_0_bits_redirect_cfiUpdate_isMisPred =
    exuBlocks_io_fuWriteback_0_bits_redirect_cfiUpdate_isMisPred; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_1_valid = exuBlocks_io_fuWriteback_1_valid; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_1_bits_uop_ctrl_rfWen = exuBlocks_io_fuWriteback_1_bits_uop_ctrl_rfWen; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_1_bits_uop_pdest = exuBlocks_io_fuWriteback_1_bits_uop_pdest; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_1_bits_uop_robIdx_flag = exuBlocks_io_fuWriteback_1_bits_uop_robIdx_flag; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_1_bits_uop_robIdx_value = exuBlocks_io_fuWriteback_1_bits_uop_robIdx_value; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_1_bits_data = exuBlocks_io_fuWriteback_1_bits_data; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_1_bits_redirectValid = exuBlocks_io_fuWriteback_1_bits_redirectValid; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_1_bits_redirect_cfiUpdate_isMisPred =
    exuBlocks_io_fuWriteback_1_bits_redirect_cfiUpdate_isMisPred; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_2_valid = exuBlocks_io_fuWriteback_2_valid; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_2_bits_uop_ctrl_rfWen = exuBlocks_io_fuWriteback_2_bits_uop_ctrl_rfWen; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_2_bits_uop_ctrl_fpWen = exuBlocks_io_fuWriteback_2_bits_uop_ctrl_fpWen; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_2_bits_uop_pdest = exuBlocks_io_fuWriteback_2_bits_uop_pdest; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_2_bits_uop_robIdx_flag = exuBlocks_io_fuWriteback_2_bits_uop_robIdx_flag; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_2_bits_uop_robIdx_value = exuBlocks_io_fuWriteback_2_bits_uop_robIdx_value; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_2_bits_data = exuBlocks_io_fuWriteback_2_bits_data; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_3_valid = exuBlocks_io_fuWriteback_3_valid; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_3_bits_uop_cf_exceptionVec_2 = exuBlocks_io_fuWriteback_3_bits_uop_cf_exceptionVec_2; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_3_bits_uop_cf_exceptionVec_3 = exuBlocks_io_fuWriteback_3_bits_uop_cf_exceptionVec_3; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_3_bits_uop_cf_exceptionVec_8 = exuBlocks_io_fuWriteback_3_bits_uop_cf_exceptionVec_8; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_3_bits_uop_cf_exceptionVec_9 = exuBlocks_io_fuWriteback_3_bits_uop_cf_exceptionVec_9; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_3_bits_uop_cf_exceptionVec_11 = exuBlocks_io_fuWriteback_3_bits_uop_cf_exceptionVec_11; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_3_bits_uop_ctrl_rfWen = exuBlocks_io_fuWriteback_3_bits_uop_ctrl_rfWen; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_3_bits_uop_ctrl_fpWen = exuBlocks_io_fuWriteback_3_bits_uop_ctrl_fpWen; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_3_bits_uop_ctrl_flushPipe = exuBlocks_io_fuWriteback_3_bits_uop_ctrl_flushPipe; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_3_bits_uop_pdest = exuBlocks_io_fuWriteback_3_bits_uop_pdest; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_3_bits_uop_robIdx_flag = exuBlocks_io_fuWriteback_3_bits_uop_robIdx_flag; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_3_bits_uop_robIdx_value = exuBlocks_io_fuWriteback_3_bits_uop_robIdx_value; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_3_bits_data = exuBlocks_io_fuWriteback_3_bits_data; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_3_bits_redirectValid = exuBlocks_io_fuWriteback_3_bits_redirectValid; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_3_bits_redirect_cfiUpdate_isMisPred =
    exuBlocks_io_fuWriteback_3_bits_redirect_cfiUpdate_isMisPred; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_3_bits_debug_isPerfCnt = exuBlocks_io_fuWriteback_3_bits_debug_isPerfCnt; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_4_valid = exuBlocks_1_io_fuWriteback_0_valid; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_4_bits_uop_cf_trigger_backendHit_0 =
    exuBlocks_1_io_fuWriteback_0_bits_uop_cf_trigger_backendHit_0; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_4_bits_uop_cf_trigger_backendHit_1 =
    exuBlocks_1_io_fuWriteback_0_bits_uop_cf_trigger_backendHit_1; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_4_bits_uop_cf_trigger_backendHit_2 =
    exuBlocks_1_io_fuWriteback_0_bits_uop_cf_trigger_backendHit_2; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_4_bits_uop_cf_trigger_backendHit_3 =
    exuBlocks_1_io_fuWriteback_0_bits_uop_cf_trigger_backendHit_3; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_4_bits_uop_cf_trigger_backendHit_4 =
    exuBlocks_1_io_fuWriteback_0_bits_uop_cf_trigger_backendHit_4; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_4_bits_uop_cf_trigger_backendHit_5 =
    exuBlocks_1_io_fuWriteback_0_bits_uop_cf_trigger_backendHit_5; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_4_bits_uop_ctrl_rfWen = exuBlocks_1_io_fuWriteback_0_bits_uop_ctrl_rfWen; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_4_bits_uop_ctrl_fpWen = exuBlocks_1_io_fuWriteback_0_bits_uop_ctrl_fpWen; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_4_bits_uop_pdest = exuBlocks_1_io_fuWriteback_0_bits_uop_pdest; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_4_bits_uop_robIdx_flag = exuBlocks_1_io_fuWriteback_0_bits_uop_robIdx_flag; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_4_bits_uop_robIdx_value = exuBlocks_1_io_fuWriteback_0_bits_uop_robIdx_value; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_4_bits_data = exuBlocks_1_io_fuWriteback_0_bits_data; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_5_valid = exuBlocks_1_io_fuWriteback_1_valid; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_5_bits_uop_ctrl_rfWen = exuBlocks_1_io_fuWriteback_1_bits_uop_ctrl_rfWen; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_5_bits_uop_ctrl_fpWen = exuBlocks_1_io_fuWriteback_1_bits_uop_ctrl_fpWen; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_5_bits_uop_pdest = exuBlocks_1_io_fuWriteback_1_bits_uop_pdest; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_5_bits_uop_robIdx_flag = exuBlocks_1_io_fuWriteback_1_bits_uop_robIdx_flag; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_5_bits_uop_robIdx_value = exuBlocks_1_io_fuWriteback_1_bits_uop_robIdx_value; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_5_bits_data = exuBlocks_1_io_fuWriteback_1_bits_data; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_6_valid = memBlock_io_writeback_0_valid; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_6_bits_uop_cf_exceptionVec_4 = memBlock_io_writeback_0_bits_uop_cf_exceptionVec_4; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_6_bits_uop_cf_exceptionVec_5 = memBlock_io_writeback_0_bits_uop_cf_exceptionVec_5; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_6_bits_uop_cf_exceptionVec_13 = memBlock_io_writeback_0_bits_uop_cf_exceptionVec_13; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_6_bits_uop_cf_trigger_backendHit_0 = memBlock_io_writeback_0_bits_uop_cf_trigger_backendHit_0; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_6_bits_uop_cf_trigger_backendHit_1 = memBlock_io_writeback_0_bits_uop_cf_trigger_backendHit_1; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_6_bits_uop_cf_trigger_backendHit_2 = memBlock_io_writeback_0_bits_uop_cf_trigger_backendHit_2; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_6_bits_uop_cf_trigger_backendHit_3 = memBlock_io_writeback_0_bits_uop_cf_trigger_backendHit_3; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_6_bits_uop_cf_trigger_backendHit_4 = memBlock_io_writeback_0_bits_uop_cf_trigger_backendHit_4; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_6_bits_uop_cf_trigger_backendHit_5 = memBlock_io_writeback_0_bits_uop_cf_trigger_backendHit_5; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_6_bits_uop_ctrl_rfWen = memBlock_io_writeback_0_bits_uop_ctrl_rfWen; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_6_bits_uop_ctrl_fpWen = memBlock_io_writeback_0_bits_uop_ctrl_fpWen; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_6_bits_uop_ctrl_flushPipe = memBlock_io_writeback_0_bits_uop_ctrl_flushPipe; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_6_bits_uop_ctrl_replayInst = memBlock_io_writeback_0_bits_uop_ctrl_replayInst; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_6_bits_uop_pdest = memBlock_io_writeback_0_bits_uop_pdest; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_6_bits_uop_robIdx_flag = memBlock_io_writeback_0_bits_uop_robIdx_flag; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_6_bits_uop_robIdx_value = memBlock_io_writeback_0_bits_uop_robIdx_value; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_6_bits_data = memBlock_io_writeback_0_bits_data; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_6_bits_debug_isMMIO = memBlock_io_writeback_0_bits_debug_isMMIO; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_7_valid = memBlock_io_writeback_1_valid; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_7_bits_uop_cf_exceptionVec_4 = memBlock_io_writeback_1_bits_uop_cf_exceptionVec_4; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_7_bits_uop_cf_exceptionVec_5 = memBlock_io_writeback_1_bits_uop_cf_exceptionVec_5; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_7_bits_uop_cf_exceptionVec_13 = memBlock_io_writeback_1_bits_uop_cf_exceptionVec_13; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_7_bits_uop_cf_trigger_backendHit_0 = memBlock_io_writeback_1_bits_uop_cf_trigger_backendHit_0; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_7_bits_uop_cf_trigger_backendHit_1 = memBlock_io_writeback_1_bits_uop_cf_trigger_backendHit_1; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_7_bits_uop_cf_trigger_backendHit_2 = memBlock_io_writeback_1_bits_uop_cf_trigger_backendHit_2; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_7_bits_uop_cf_trigger_backendHit_3 = memBlock_io_writeback_1_bits_uop_cf_trigger_backendHit_3; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_7_bits_uop_cf_trigger_backendHit_4 = memBlock_io_writeback_1_bits_uop_cf_trigger_backendHit_4; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_7_bits_uop_cf_trigger_backendHit_5 = memBlock_io_writeback_1_bits_uop_cf_trigger_backendHit_5; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_7_bits_uop_ctrl_rfWen = memBlock_io_writeback_1_bits_uop_ctrl_rfWen; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_7_bits_uop_ctrl_fpWen = memBlock_io_writeback_1_bits_uop_ctrl_fpWen; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_7_bits_uop_ctrl_flushPipe = memBlock_io_writeback_1_bits_uop_ctrl_flushPipe; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_7_bits_uop_ctrl_replayInst = memBlock_io_writeback_1_bits_uop_ctrl_replayInst; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_7_bits_uop_pdest = memBlock_io_writeback_1_bits_uop_pdest; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_7_bits_uop_robIdx_flag = memBlock_io_writeback_1_bits_uop_robIdx_flag; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_7_bits_uop_robIdx_value = memBlock_io_writeback_1_bits_uop_robIdx_value; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_7_bits_data = memBlock_io_writeback_1_bits_data; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_7_bits_debug_isMMIO = memBlock_io_writeback_1_bits_debug_isMMIO; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_8_valid = memBlock_io_writeback_2_valid; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_8_bits_uop_cf_exceptionVec_4 = memBlock_io_writeback_2_bits_uop_cf_exceptionVec_4; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_8_bits_uop_cf_exceptionVec_5 = memBlock_io_writeback_2_bits_uop_cf_exceptionVec_5; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_8_bits_uop_cf_exceptionVec_6 = memBlock_io_writeback_2_bits_uop_cf_exceptionVec_6; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_8_bits_uop_cf_exceptionVec_7 = memBlock_io_writeback_2_bits_uop_cf_exceptionVec_7; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_8_bits_uop_cf_exceptionVec_13 = memBlock_io_writeback_2_bits_uop_cf_exceptionVec_13; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_8_bits_uop_cf_exceptionVec_15 = memBlock_io_writeback_2_bits_uop_cf_exceptionVec_15; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_8_bits_uop_cf_trigger_backendHit_0 = memBlock_io_writeback_2_bits_uop_cf_trigger_backendHit_0; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_8_bits_uop_cf_trigger_backendHit_1 = memBlock_io_writeback_2_bits_uop_cf_trigger_backendHit_1; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_8_bits_uop_cf_trigger_backendHit_2 = memBlock_io_writeback_2_bits_uop_cf_trigger_backendHit_2; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_8_bits_uop_cf_trigger_backendHit_3 = memBlock_io_writeback_2_bits_uop_cf_trigger_backendHit_3; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_8_bits_uop_cf_trigger_backendHit_4 = memBlock_io_writeback_2_bits_uop_cf_trigger_backendHit_4; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_8_bits_uop_cf_trigger_backendHit_5 = memBlock_io_writeback_2_bits_uop_cf_trigger_backendHit_5; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_8_bits_uop_robIdx_flag = memBlock_io_writeback_2_bits_uop_robIdx_flag; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_8_bits_uop_robIdx_value = memBlock_io_writeback_2_bits_uop_robIdx_value; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_8_bits_redirectValid = 1'h0; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_8_bits_redirect_cfiUpdate_isMisPred = 1'h0; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_8_bits_debug_isMMIO = memBlock_io_writeback_2_bits_debug_isMMIO; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_8_bits_debug_isPerfCnt = 1'h0; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_9_valid = memBlock_io_writeback_3_valid; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_9_bits_uop_cf_exceptionVec_4 = 1'h0; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_9_bits_uop_cf_exceptionVec_5 = 1'h0; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_9_bits_uop_cf_exceptionVec_6 = memBlock_io_writeback_3_bits_uop_cf_exceptionVec_6; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_9_bits_uop_cf_exceptionVec_7 = memBlock_io_writeback_3_bits_uop_cf_exceptionVec_7; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_9_bits_uop_cf_exceptionVec_13 = 1'h0; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_9_bits_uop_cf_exceptionVec_15 = memBlock_io_writeback_3_bits_uop_cf_exceptionVec_15; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_9_bits_uop_cf_trigger_backendHit_0 = memBlock_io_writeback_3_bits_uop_cf_trigger_backendHit_0; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_9_bits_uop_cf_trigger_backendHit_1 = memBlock_io_writeback_3_bits_uop_cf_trigger_backendHit_1; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_9_bits_uop_cf_trigger_backendHit_2 = 1'h0; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_9_bits_uop_cf_trigger_backendHit_3 = 1'h0; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_9_bits_uop_cf_trigger_backendHit_4 = memBlock_io_writeback_3_bits_uop_cf_trigger_backendHit_4; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_9_bits_uop_cf_trigger_backendHit_5 = 1'h0; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_9_bits_uop_robIdx_flag = memBlock_io_writeback_3_bits_uop_robIdx_flag; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_9_bits_uop_robIdx_value = memBlock_io_writeback_3_bits_uop_robIdx_value; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_9_bits_redirectValid = 1'h0; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_9_bits_redirect_cfiUpdate_isMisPred = 1'h0; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_9_bits_debug_isMMIO = memBlock_io_writeback_3_bits_debug_isMMIO; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_9_bits_debug_isPerfCnt = 1'h0; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_10_valid = memBlock_io_writeback_4_valid; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_10_bits_uop_robIdx_flag = memBlock_io_writeback_4_bits_uop_robIdx_flag; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_10_bits_uop_robIdx_value = memBlock_io_writeback_4_bits_uop_robIdx_value; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_11_valid = memBlock_io_writeback_5_valid; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_11_bits_uop_robIdx_flag = memBlock_io_writeback_5_bits_uop_robIdx_flag; // @[XSCore.scala 275:32]
  assign wbArbiter_io_in_11_bits_uop_robIdx_value = memBlock_io_writeback_5_bits_uop_robIdx_value; // @[XSCore.scala 275:32]
  assign exuBlocks_clock = clock;
  assign exuBlocks_reset = resetGen_2_o_reset; // @[ResetGen.scala 50:30 53:22]
  assign exuBlocks_io_hartId = io_hartId[7:0]; // @[XSCore.scala 265:33]
  assign exuBlocks_io_redirect_valid = ctrlBlock_io_redirect_valid; // @[XSCore.scala 347:18]
  assign exuBlocks_io_redirect_bits_robIdx_flag = ctrlBlock_io_redirect_bits_robIdx_flag; // @[XSCore.scala 347:18]
  assign exuBlocks_io_redirect_bits_robIdx_value = ctrlBlock_io_redirect_bits_robIdx_value; // @[XSCore.scala 347:18]
  assign exuBlocks_io_redirect_bits_level = ctrlBlock_io_redirect_bits_level; // @[XSCore.scala 347:18]
  assign exuBlocks_io_allocPregs_0_isInt = ctrlBlock_io_allocPregs_0_isInt; // @[XSCore.scala 348:20]
  assign exuBlocks_io_allocPregs_0_isFp = ctrlBlock_io_allocPregs_0_isFp; // @[XSCore.scala 348:20]
  assign exuBlocks_io_allocPregs_0_preg = ctrlBlock_io_allocPregs_0_preg; // @[XSCore.scala 348:20]
  assign exuBlocks_io_allocPregs_1_isInt = ctrlBlock_io_allocPregs_1_isInt; // @[XSCore.scala 348:20]
  assign exuBlocks_io_allocPregs_1_isFp = ctrlBlock_io_allocPregs_1_isFp; // @[XSCore.scala 348:20]
  assign exuBlocks_io_allocPregs_1_preg = ctrlBlock_io_allocPregs_1_preg; // @[XSCore.scala 348:20]
  assign exuBlocks_io_in_0_valid = ctrlBlock_io_dispatch_0_valid; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_0_bits_cf_foldpc = ctrlBlock_io_dispatch_0_bits_cf_foldpc; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_0_bits_cf_trigger_backendEn_0 = ctrlBlock_io_dispatch_0_bits_cf_trigger_backendEn_0; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_0_bits_cf_trigger_backendEn_1 = ctrlBlock_io_dispatch_0_bits_cf_trigger_backendEn_1; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_0_bits_cf_pd_isRVC = ctrlBlock_io_dispatch_0_bits_cf_pd_isRVC; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_0_bits_cf_pd_brType = ctrlBlock_io_dispatch_0_bits_cf_pd_brType; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_0_bits_cf_pd_isCall = ctrlBlock_io_dispatch_0_bits_cf_pd_isCall; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_0_bits_cf_pd_isRet = ctrlBlock_io_dispatch_0_bits_cf_pd_isRet; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_0_bits_cf_pred_taken = ctrlBlock_io_dispatch_0_bits_cf_pred_taken; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_0_bits_cf_storeSetHit = ctrlBlock_io_dispatch_0_bits_cf_storeSetHit; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_0_bits_cf_waitForRobIdx_flag = ctrlBlock_io_dispatch_0_bits_cf_waitForRobIdx_flag; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_0_bits_cf_waitForRobIdx_value = ctrlBlock_io_dispatch_0_bits_cf_waitForRobIdx_value; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_0_bits_cf_loadWaitBit = ctrlBlock_io_dispatch_0_bits_cf_loadWaitBit; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_0_bits_cf_loadWaitStrict = ctrlBlock_io_dispatch_0_bits_cf_loadWaitStrict; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_0_bits_cf_ssid = ctrlBlock_io_dispatch_0_bits_cf_ssid; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_0_bits_cf_ftqPtr_flag = ctrlBlock_io_dispatch_0_bits_cf_ftqPtr_flag; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_0_bits_cf_ftqPtr_value = ctrlBlock_io_dispatch_0_bits_cf_ftqPtr_value; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_0_bits_cf_ftqOffset = ctrlBlock_io_dispatch_0_bits_cf_ftqOffset; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_0_bits_ctrl_srcType_0 = ctrlBlock_io_dispatch_0_bits_ctrl_srcType_0; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_0_bits_ctrl_srcType_1 = ctrlBlock_io_dispatch_0_bits_ctrl_srcType_1; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_0_bits_ctrl_fuType = ctrlBlock_io_dispatch_0_bits_ctrl_fuType; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_0_bits_ctrl_fuOpType = ctrlBlock_io_dispatch_0_bits_ctrl_fuOpType; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_0_bits_ctrl_rfWen = ctrlBlock_io_dispatch_0_bits_ctrl_rfWen; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_0_bits_ctrl_fpWen = ctrlBlock_io_dispatch_0_bits_ctrl_fpWen; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_0_bits_ctrl_selImm = ctrlBlock_io_dispatch_0_bits_ctrl_selImm; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_0_bits_ctrl_imm = ctrlBlock_io_dispatch_0_bits_ctrl_imm; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_0_bits_ctrl_fpu_isAddSub = ctrlBlock_io_dispatch_0_bits_ctrl_fpu_isAddSub; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_0_bits_ctrl_fpu_typeTagIn = ctrlBlock_io_dispatch_0_bits_ctrl_fpu_typeTagIn; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_0_bits_ctrl_fpu_typeTagOut = ctrlBlock_io_dispatch_0_bits_ctrl_fpu_typeTagOut; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_0_bits_ctrl_fpu_fromInt = ctrlBlock_io_dispatch_0_bits_ctrl_fpu_fromInt; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_0_bits_ctrl_fpu_wflags = ctrlBlock_io_dispatch_0_bits_ctrl_fpu_wflags; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_0_bits_ctrl_fpu_fpWen = ctrlBlock_io_dispatch_0_bits_ctrl_fpu_fpWen; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_0_bits_ctrl_fpu_fmaCmd = ctrlBlock_io_dispatch_0_bits_ctrl_fpu_fmaCmd; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_0_bits_ctrl_fpu_div = ctrlBlock_io_dispatch_0_bits_ctrl_fpu_div; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_0_bits_ctrl_fpu_sqrt = ctrlBlock_io_dispatch_0_bits_ctrl_fpu_sqrt; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_0_bits_ctrl_fpu_fcvt = ctrlBlock_io_dispatch_0_bits_ctrl_fpu_fcvt; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_0_bits_ctrl_fpu_typ = ctrlBlock_io_dispatch_0_bits_ctrl_fpu_typ; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_0_bits_ctrl_fpu_fmt = ctrlBlock_io_dispatch_0_bits_ctrl_fpu_fmt; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_0_bits_ctrl_fpu_ren3 = ctrlBlock_io_dispatch_0_bits_ctrl_fpu_ren3; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_0_bits_ctrl_fpu_rm = ctrlBlock_io_dispatch_0_bits_ctrl_fpu_rm; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_0_bits_psrc_0 = ctrlBlock_io_dispatch_0_bits_psrc_0; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_0_bits_psrc_1 = ctrlBlock_io_dispatch_0_bits_psrc_1; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_0_bits_pdest = ctrlBlock_io_dispatch_0_bits_pdest; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_0_bits_robIdx_flag = ctrlBlock_io_dispatch_0_bits_robIdx_flag; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_0_bits_robIdx_value = ctrlBlock_io_dispatch_0_bits_robIdx_value; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_0_bits_lqIdx_flag = ctrlBlock_io_dispatch_0_bits_lqIdx_flag; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_0_bits_lqIdx_value = ctrlBlock_io_dispatch_0_bits_lqIdx_value; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_0_bits_sqIdx_flag = ctrlBlock_io_dispatch_0_bits_sqIdx_flag; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_0_bits_sqIdx_value = ctrlBlock_io_dispatch_0_bits_sqIdx_value; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_1_valid = ctrlBlock_io_dispatch_1_valid; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_1_bits_cf_foldpc = ctrlBlock_io_dispatch_1_bits_cf_foldpc; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_1_bits_cf_trigger_backendEn_0 = ctrlBlock_io_dispatch_1_bits_cf_trigger_backendEn_0; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_1_bits_cf_trigger_backendEn_1 = ctrlBlock_io_dispatch_1_bits_cf_trigger_backendEn_1; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_1_bits_cf_pd_isRVC = ctrlBlock_io_dispatch_1_bits_cf_pd_isRVC; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_1_bits_cf_pd_brType = ctrlBlock_io_dispatch_1_bits_cf_pd_brType; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_1_bits_cf_pd_isCall = ctrlBlock_io_dispatch_1_bits_cf_pd_isCall; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_1_bits_cf_pd_isRet = ctrlBlock_io_dispatch_1_bits_cf_pd_isRet; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_1_bits_cf_pred_taken = ctrlBlock_io_dispatch_1_bits_cf_pred_taken; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_1_bits_cf_storeSetHit = ctrlBlock_io_dispatch_1_bits_cf_storeSetHit; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_1_bits_cf_waitForRobIdx_flag = ctrlBlock_io_dispatch_1_bits_cf_waitForRobIdx_flag; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_1_bits_cf_waitForRobIdx_value = ctrlBlock_io_dispatch_1_bits_cf_waitForRobIdx_value; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_1_bits_cf_loadWaitBit = ctrlBlock_io_dispatch_1_bits_cf_loadWaitBit; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_1_bits_cf_loadWaitStrict = ctrlBlock_io_dispatch_1_bits_cf_loadWaitStrict; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_1_bits_cf_ssid = ctrlBlock_io_dispatch_1_bits_cf_ssid; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_1_bits_cf_ftqPtr_flag = ctrlBlock_io_dispatch_1_bits_cf_ftqPtr_flag; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_1_bits_cf_ftqPtr_value = ctrlBlock_io_dispatch_1_bits_cf_ftqPtr_value; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_1_bits_cf_ftqOffset = ctrlBlock_io_dispatch_1_bits_cf_ftqOffset; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_1_bits_ctrl_srcType_0 = ctrlBlock_io_dispatch_1_bits_ctrl_srcType_0; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_1_bits_ctrl_srcType_1 = ctrlBlock_io_dispatch_1_bits_ctrl_srcType_1; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_1_bits_ctrl_fuType = ctrlBlock_io_dispatch_1_bits_ctrl_fuType; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_1_bits_ctrl_fuOpType = ctrlBlock_io_dispatch_1_bits_ctrl_fuOpType; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_1_bits_ctrl_rfWen = ctrlBlock_io_dispatch_1_bits_ctrl_rfWen; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_1_bits_ctrl_fpWen = ctrlBlock_io_dispatch_1_bits_ctrl_fpWen; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_1_bits_ctrl_selImm = ctrlBlock_io_dispatch_1_bits_ctrl_selImm; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_1_bits_ctrl_imm = ctrlBlock_io_dispatch_1_bits_ctrl_imm; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_1_bits_psrc_0 = ctrlBlock_io_dispatch_1_bits_psrc_0; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_1_bits_psrc_1 = ctrlBlock_io_dispatch_1_bits_psrc_1; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_1_bits_pdest = ctrlBlock_io_dispatch_1_bits_pdest; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_1_bits_robIdx_flag = ctrlBlock_io_dispatch_1_bits_robIdx_flag; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_1_bits_robIdx_value = ctrlBlock_io_dispatch_1_bits_robIdx_value; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_1_bits_lqIdx_flag = ctrlBlock_io_dispatch_1_bits_lqIdx_flag; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_1_bits_lqIdx_value = ctrlBlock_io_dispatch_1_bits_lqIdx_value; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_1_bits_sqIdx_flag = ctrlBlock_io_dispatch_1_bits_sqIdx_flag; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_1_bits_sqIdx_value = ctrlBlock_io_dispatch_1_bits_sqIdx_value; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_4_valid = ctrlBlock_io_dispatch_4_valid; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_4_bits_cf_foldpc = ctrlBlock_io_dispatch_4_bits_cf_foldpc; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_4_bits_cf_trigger_backendEn_0 = ctrlBlock_io_dispatch_4_bits_cf_trigger_backendEn_0; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_4_bits_cf_trigger_backendEn_1 = ctrlBlock_io_dispatch_4_bits_cf_trigger_backendEn_1; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_4_bits_cf_pd_isRVC = ctrlBlock_io_dispatch_4_bits_cf_pd_isRVC; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_4_bits_cf_pd_brType = ctrlBlock_io_dispatch_4_bits_cf_pd_brType; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_4_bits_cf_pd_isCall = ctrlBlock_io_dispatch_4_bits_cf_pd_isCall; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_4_bits_cf_pd_isRet = ctrlBlock_io_dispatch_4_bits_cf_pd_isRet; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_4_bits_cf_pred_taken = ctrlBlock_io_dispatch_4_bits_cf_pred_taken; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_4_bits_cf_storeSetHit = ctrlBlock_io_dispatch_4_bits_cf_storeSetHit; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_4_bits_cf_waitForRobIdx_flag = ctrlBlock_io_dispatch_4_bits_cf_waitForRobIdx_flag; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_4_bits_cf_waitForRobIdx_value = ctrlBlock_io_dispatch_4_bits_cf_waitForRobIdx_value; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_4_bits_cf_loadWaitBit = ctrlBlock_io_dispatch_4_bits_cf_loadWaitBit; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_4_bits_cf_loadWaitStrict = ctrlBlock_io_dispatch_4_bits_cf_loadWaitStrict; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_4_bits_cf_ssid = ctrlBlock_io_dispatch_4_bits_cf_ssid; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_4_bits_cf_ftqPtr_flag = ctrlBlock_io_dispatch_4_bits_cf_ftqPtr_flag; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_4_bits_cf_ftqPtr_value = ctrlBlock_io_dispatch_4_bits_cf_ftqPtr_value; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_4_bits_cf_ftqOffset = ctrlBlock_io_dispatch_4_bits_cf_ftqOffset; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_4_bits_ctrl_srcType_0 = ctrlBlock_io_dispatch_4_bits_ctrl_srcType_0; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_4_bits_ctrl_srcType_1 = ctrlBlock_io_dispatch_4_bits_ctrl_srcType_1; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_4_bits_ctrl_fuType = ctrlBlock_io_dispatch_4_bits_ctrl_fuType; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_4_bits_ctrl_fuOpType = ctrlBlock_io_dispatch_4_bits_ctrl_fuOpType; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_4_bits_ctrl_rfWen = ctrlBlock_io_dispatch_4_bits_ctrl_rfWen; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_4_bits_ctrl_fpWen = ctrlBlock_io_dispatch_4_bits_ctrl_fpWen; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_4_bits_ctrl_flushPipe = ctrlBlock_io_dispatch_4_bits_ctrl_flushPipe; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_4_bits_ctrl_imm = ctrlBlock_io_dispatch_4_bits_ctrl_imm; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_4_bits_ctrl_replayInst = ctrlBlock_io_dispatch_4_bits_ctrl_replayInst; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_4_bits_psrc_0 = ctrlBlock_io_dispatch_4_bits_psrc_0; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_4_bits_psrc_1 = ctrlBlock_io_dispatch_4_bits_psrc_1; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_4_bits_pdest = ctrlBlock_io_dispatch_4_bits_pdest; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_4_bits_robIdx_flag = ctrlBlock_io_dispatch_4_bits_robIdx_flag; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_4_bits_robIdx_value = ctrlBlock_io_dispatch_4_bits_robIdx_value; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_5_valid = ctrlBlock_io_dispatch_5_valid; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_5_bits_cf_foldpc = ctrlBlock_io_dispatch_5_bits_cf_foldpc; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_5_bits_cf_trigger_backendEn_0 = ctrlBlock_io_dispatch_5_bits_cf_trigger_backendEn_0; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_5_bits_cf_trigger_backendEn_1 = ctrlBlock_io_dispatch_5_bits_cf_trigger_backendEn_1; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_5_bits_cf_pd_isRVC = ctrlBlock_io_dispatch_5_bits_cf_pd_isRVC; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_5_bits_cf_pd_brType = ctrlBlock_io_dispatch_5_bits_cf_pd_brType; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_5_bits_cf_pd_isCall = ctrlBlock_io_dispatch_5_bits_cf_pd_isCall; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_5_bits_cf_pd_isRet = ctrlBlock_io_dispatch_5_bits_cf_pd_isRet; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_5_bits_cf_pred_taken = ctrlBlock_io_dispatch_5_bits_cf_pred_taken; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_5_bits_cf_storeSetHit = ctrlBlock_io_dispatch_5_bits_cf_storeSetHit; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_5_bits_cf_waitForRobIdx_flag = ctrlBlock_io_dispatch_5_bits_cf_waitForRobIdx_flag; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_5_bits_cf_waitForRobIdx_value = ctrlBlock_io_dispatch_5_bits_cf_waitForRobIdx_value; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_5_bits_cf_loadWaitBit = ctrlBlock_io_dispatch_5_bits_cf_loadWaitBit; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_5_bits_cf_loadWaitStrict = ctrlBlock_io_dispatch_5_bits_cf_loadWaitStrict; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_5_bits_cf_ssid = ctrlBlock_io_dispatch_5_bits_cf_ssid; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_5_bits_cf_ftqPtr_flag = ctrlBlock_io_dispatch_5_bits_cf_ftqPtr_flag; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_5_bits_cf_ftqPtr_value = ctrlBlock_io_dispatch_5_bits_cf_ftqPtr_value; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_5_bits_cf_ftqOffset = ctrlBlock_io_dispatch_5_bits_cf_ftqOffset; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_5_bits_ctrl_srcType_0 = ctrlBlock_io_dispatch_5_bits_ctrl_srcType_0; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_5_bits_ctrl_srcType_1 = ctrlBlock_io_dispatch_5_bits_ctrl_srcType_1; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_5_bits_ctrl_fuType = ctrlBlock_io_dispatch_5_bits_ctrl_fuType; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_5_bits_ctrl_fuOpType = ctrlBlock_io_dispatch_5_bits_ctrl_fuOpType; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_5_bits_ctrl_rfWen = ctrlBlock_io_dispatch_5_bits_ctrl_rfWen; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_5_bits_ctrl_fpWen = ctrlBlock_io_dispatch_5_bits_ctrl_fpWen; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_5_bits_ctrl_flushPipe = ctrlBlock_io_dispatch_5_bits_ctrl_flushPipe; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_5_bits_ctrl_imm = ctrlBlock_io_dispatch_5_bits_ctrl_imm; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_5_bits_ctrl_replayInst = ctrlBlock_io_dispatch_5_bits_ctrl_replayInst; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_5_bits_psrc_0 = ctrlBlock_io_dispatch_5_bits_psrc_0; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_5_bits_psrc_1 = ctrlBlock_io_dispatch_5_bits_psrc_1; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_5_bits_pdest = ctrlBlock_io_dispatch_5_bits_pdest; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_5_bits_robIdx_flag = ctrlBlock_io_dispatch_5_bits_robIdx_flag; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_5_bits_robIdx_value = ctrlBlock_io_dispatch_5_bits_robIdx_value; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_6_valid = ctrlBlock_io_dispatch_6_valid; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_6_bits_cf_foldpc = ctrlBlock_io_dispatch_6_bits_cf_foldpc; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_6_bits_cf_trigger_backendEn_0 = ctrlBlock_io_dispatch_6_bits_cf_trigger_backendEn_0; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_6_bits_cf_trigger_backendEn_1 = ctrlBlock_io_dispatch_6_bits_cf_trigger_backendEn_1; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_6_bits_cf_pd_isRVC = ctrlBlock_io_dispatch_6_bits_cf_pd_isRVC; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_6_bits_cf_pd_brType = ctrlBlock_io_dispatch_6_bits_cf_pd_brType; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_6_bits_cf_pd_isCall = ctrlBlock_io_dispatch_6_bits_cf_pd_isCall; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_6_bits_cf_pd_isRet = ctrlBlock_io_dispatch_6_bits_cf_pd_isRet; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_6_bits_cf_pred_taken = ctrlBlock_io_dispatch_6_bits_cf_pred_taken; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_6_bits_cf_storeSetHit = ctrlBlock_io_dispatch_6_bits_cf_storeSetHit; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_6_bits_cf_waitForRobIdx_flag = ctrlBlock_io_dispatch_6_bits_cf_waitForRobIdx_flag; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_6_bits_cf_waitForRobIdx_value = ctrlBlock_io_dispatch_6_bits_cf_waitForRobIdx_value; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_6_bits_cf_loadWaitBit = ctrlBlock_io_dispatch_6_bits_cf_loadWaitBit; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_6_bits_cf_loadWaitStrict = ctrlBlock_io_dispatch_6_bits_cf_loadWaitStrict; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_6_bits_cf_ssid = ctrlBlock_io_dispatch_6_bits_cf_ssid; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_6_bits_cf_ftqPtr_flag = ctrlBlock_io_dispatch_6_bits_cf_ftqPtr_flag; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_6_bits_cf_ftqPtr_value = ctrlBlock_io_dispatch_6_bits_cf_ftqPtr_value; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_6_bits_cf_ftqOffset = ctrlBlock_io_dispatch_6_bits_cf_ftqOffset; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_6_bits_ctrl_srcType_0 = ctrlBlock_io_dispatch_6_bits_ctrl_srcType_0; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_6_bits_ctrl_srcType_1 = ctrlBlock_io_dispatch_6_bits_ctrl_srcType_1; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_6_bits_ctrl_fuType = ctrlBlock_io_dispatch_6_bits_ctrl_fuType; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_6_bits_ctrl_fuOpType = ctrlBlock_io_dispatch_6_bits_ctrl_fuOpType; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_6_bits_ctrl_rfWen = ctrlBlock_io_dispatch_6_bits_ctrl_rfWen; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_6_bits_ctrl_fpWen = ctrlBlock_io_dispatch_6_bits_ctrl_fpWen; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_6_bits_ctrl_flushPipe = ctrlBlock_io_dispatch_6_bits_ctrl_flushPipe; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_6_bits_ctrl_imm = ctrlBlock_io_dispatch_6_bits_ctrl_imm; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_6_bits_ctrl_replayInst = ctrlBlock_io_dispatch_6_bits_ctrl_replayInst; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_6_bits_psrc_0 = ctrlBlock_io_dispatch_6_bits_psrc_0; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_6_bits_psrc_1 = ctrlBlock_io_dispatch_6_bits_psrc_1; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_6_bits_pdest = ctrlBlock_io_dispatch_6_bits_pdest; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_6_bits_robIdx_flag = ctrlBlock_io_dispatch_6_bits_robIdx_flag; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_6_bits_robIdx_value = ctrlBlock_io_dispatch_6_bits_robIdx_value; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_7_valid = ctrlBlock_io_dispatch_7_valid; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_7_bits_cf_foldpc = ctrlBlock_io_dispatch_7_bits_cf_foldpc; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_7_bits_cf_trigger_backendEn_0 = ctrlBlock_io_dispatch_7_bits_cf_trigger_backendEn_0; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_7_bits_cf_trigger_backendEn_1 = ctrlBlock_io_dispatch_7_bits_cf_trigger_backendEn_1; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_7_bits_cf_pd_isRVC = ctrlBlock_io_dispatch_7_bits_cf_pd_isRVC; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_7_bits_cf_pd_brType = ctrlBlock_io_dispatch_7_bits_cf_pd_brType; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_7_bits_cf_pd_isCall = ctrlBlock_io_dispatch_7_bits_cf_pd_isCall; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_7_bits_cf_pd_isRet = ctrlBlock_io_dispatch_7_bits_cf_pd_isRet; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_7_bits_cf_pred_taken = ctrlBlock_io_dispatch_7_bits_cf_pred_taken; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_7_bits_cf_storeSetHit = ctrlBlock_io_dispatch_7_bits_cf_storeSetHit; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_7_bits_cf_waitForRobIdx_flag = ctrlBlock_io_dispatch_7_bits_cf_waitForRobIdx_flag; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_7_bits_cf_waitForRobIdx_value = ctrlBlock_io_dispatch_7_bits_cf_waitForRobIdx_value; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_7_bits_cf_loadWaitBit = ctrlBlock_io_dispatch_7_bits_cf_loadWaitBit; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_7_bits_cf_loadWaitStrict = ctrlBlock_io_dispatch_7_bits_cf_loadWaitStrict; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_7_bits_cf_ssid = ctrlBlock_io_dispatch_7_bits_cf_ssid; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_7_bits_cf_ftqPtr_flag = ctrlBlock_io_dispatch_7_bits_cf_ftqPtr_flag; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_7_bits_cf_ftqPtr_value = ctrlBlock_io_dispatch_7_bits_cf_ftqPtr_value; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_7_bits_cf_ftqOffset = ctrlBlock_io_dispatch_7_bits_cf_ftqOffset; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_7_bits_ctrl_srcType_0 = ctrlBlock_io_dispatch_7_bits_ctrl_srcType_0; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_7_bits_ctrl_srcType_1 = ctrlBlock_io_dispatch_7_bits_ctrl_srcType_1; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_7_bits_ctrl_fuType = ctrlBlock_io_dispatch_7_bits_ctrl_fuType; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_7_bits_ctrl_fuOpType = ctrlBlock_io_dispatch_7_bits_ctrl_fuOpType; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_7_bits_ctrl_rfWen = ctrlBlock_io_dispatch_7_bits_ctrl_rfWen; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_7_bits_ctrl_fpWen = ctrlBlock_io_dispatch_7_bits_ctrl_fpWen; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_7_bits_ctrl_flushPipe = ctrlBlock_io_dispatch_7_bits_ctrl_flushPipe; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_7_bits_ctrl_imm = ctrlBlock_io_dispatch_7_bits_ctrl_imm; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_7_bits_ctrl_replayInst = ctrlBlock_io_dispatch_7_bits_ctrl_replayInst; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_7_bits_psrc_0 = ctrlBlock_io_dispatch_7_bits_psrc_0; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_7_bits_psrc_1 = ctrlBlock_io_dispatch_7_bits_psrc_1; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_7_bits_pdest = ctrlBlock_io_dispatch_7_bits_pdest; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_7_bits_robIdx_flag = ctrlBlock_io_dispatch_7_bits_robIdx_flag; // @[XSCore.scala 321:25]
  assign exuBlocks_io_in_7_bits_robIdx_value = ctrlBlock_io_dispatch_7_bits_robIdx_value; // @[XSCore.scala 321:25]
  assign exuBlocks_io_issue_0_ready = memBlock_io_issue_0_ready; // @[XSCore.scala 339:21]
  assign exuBlocks_io_issue_1_ready = memBlock_io_issue_1_ready; // @[XSCore.scala 339:21]
  assign exuBlocks_io_issue_2_ready = memBlock_io_issue_2_ready; // @[XSCore.scala 339:21]
  assign exuBlocks_io_issue_3_ready = memBlock_io_issue_3_ready; // @[XSCore.scala 339:21]
  assign exuBlocks_io_issue_4_ready = memBlock_io_issue_4_ready; // @[XSCore.scala 339:21]
  assign exuBlocks_io_issue_5_ready = memBlock_io_issue_5_ready; // @[XSCore.scala 339:21]
  assign exuBlocks_io_rfWriteback_2_valid = wbArbiter_io_out_2_valid; // @[XSCore.scala 349:21]
  assign exuBlocks_io_rfWriteback_2_bits_uop_ctrl_rfWen = wbArbiter_io_out_2_bits_uop_ctrl_rfWen; // @[XSCore.scala 349:21]
  assign exuBlocks_io_rfWriteback_2_bits_uop_ctrl_fpWen = wbArbiter_io_out_2_bits_uop_ctrl_fpWen; // @[XSCore.scala 349:21]
  assign exuBlocks_io_rfWriteback_2_bits_uop_pdest = wbArbiter_io_out_2_bits_uop_pdest; // @[XSCore.scala 349:21]
  assign exuBlocks_io_rfWriteback_2_bits_data = wbArbiter_io_out_2_bits_data; // @[XSCore.scala 349:21]
  assign exuBlocks_io_rfWriteback_3_valid = wbArbiter_io_out_3_valid; // @[XSCore.scala 349:21]
  assign exuBlocks_io_rfWriteback_3_bits_uop_ctrl_rfWen = wbArbiter_io_out_3_bits_uop_ctrl_rfWen; // @[XSCore.scala 349:21]
  assign exuBlocks_io_rfWriteback_3_bits_uop_ctrl_fpWen = wbArbiter_io_out_3_bits_uop_ctrl_fpWen; // @[XSCore.scala 349:21]
  assign exuBlocks_io_rfWriteback_3_bits_uop_pdest = wbArbiter_io_out_3_bits_uop_pdest; // @[XSCore.scala 349:21]
  assign exuBlocks_io_rfWriteback_3_bits_data = wbArbiter_io_out_3_bits_data; // @[XSCore.scala 349:21]
  assign exuBlocks_io_rfWriteback_4_valid = wbArbiter_io_out_4_valid; // @[XSCore.scala 349:21]
  assign exuBlocks_io_rfWriteback_4_bits_uop_ctrl_rfWen = wbArbiter_io_out_4_bits_uop_ctrl_rfWen; // @[XSCore.scala 349:21]
  assign exuBlocks_io_rfWriteback_4_bits_uop_ctrl_fpWen = wbArbiter_io_out_4_bits_uop_ctrl_fpWen; // @[XSCore.scala 349:21]
  assign exuBlocks_io_rfWriteback_4_bits_uop_pdest = wbArbiter_io_out_4_bits_uop_pdest; // @[XSCore.scala 349:21]
  assign exuBlocks_io_rfWriteback_4_bits_data = wbArbiter_io_out_4_bits_data; // @[XSCore.scala 349:21]
  assign exuBlocks_io_rfWriteback_5_valid = wbArbiter_io_out_5_valid; // @[XSCore.scala 349:21]
  assign exuBlocks_io_rfWriteback_5_bits_uop_ctrl_rfWen = wbArbiter_io_out_5_bits_uop_ctrl_rfWen; // @[XSCore.scala 349:21]
  assign exuBlocks_io_rfWriteback_5_bits_uop_ctrl_fpWen = wbArbiter_io_out_5_bits_uop_ctrl_fpWen; // @[XSCore.scala 349:21]
  assign exuBlocks_io_rfWriteback_5_bits_uop_pdest = wbArbiter_io_out_5_bits_uop_pdest; // @[XSCore.scala 349:21]
  assign exuBlocks_io_rfWriteback_5_bits_data = wbArbiter_io_out_5_bits_data; // @[XSCore.scala 349:21]
  assign exuBlocks_io_rfWriteback_6_valid = wbArbiter_io_out_6_valid; // @[XSCore.scala 349:21]
  assign exuBlocks_io_rfWriteback_6_bits_uop_ctrl_rfWen = wbArbiter_io_out_6_bits_uop_ctrl_rfWen; // @[XSCore.scala 349:21]
  assign exuBlocks_io_rfWriteback_6_bits_uop_ctrl_fpWen = wbArbiter_io_out_6_bits_uop_ctrl_fpWen; // @[XSCore.scala 349:21]
  assign exuBlocks_io_rfWriteback_6_bits_uop_pdest = wbArbiter_io_out_6_bits_uop_pdest; // @[XSCore.scala 349:21]
  assign exuBlocks_io_rfWriteback_6_bits_data = wbArbiter_io_out_6_bits_data; // @[XSCore.scala 349:21]
  assign exuBlocks_io_rfWriteback_7_valid = wbArbiter_io_out_7_valid; // @[XSCore.scala 349:21]
  assign exuBlocks_io_rfWriteback_7_bits_uop_ctrl_rfWen = wbArbiter_io_out_7_bits_uop_ctrl_rfWen; // @[XSCore.scala 349:21]
  assign exuBlocks_io_rfWriteback_7_bits_uop_ctrl_fpWen = wbArbiter_io_out_7_bits_uop_ctrl_fpWen; // @[XSCore.scala 349:21]
  assign exuBlocks_io_rfWriteback_7_bits_uop_pdest = wbArbiter_io_out_7_bits_uop_pdest; // @[XSCore.scala 349:21]
  assign exuBlocks_io_rfWriteback_7_bits_data = wbArbiter_io_out_7_bits_data; // @[XSCore.scala 349:21]
  assign exuBlocks_io_rfWriteback_8_valid = wbArbiter_io_out_8_valid; // @[XSCore.scala 349:21]
  assign exuBlocks_io_rfWriteback_8_bits_uop_ctrl_rfWen = wbArbiter_io_out_8_bits_uop_ctrl_rfWen; // @[XSCore.scala 349:21]
  assign exuBlocks_io_rfWriteback_8_bits_uop_ctrl_fpWen = wbArbiter_io_out_8_bits_uop_ctrl_fpWen; // @[XSCore.scala 349:21]
  assign exuBlocks_io_rfWriteback_8_bits_uop_pdest = wbArbiter_io_out_8_bits_uop_pdest; // @[XSCore.scala 349:21]
  assign exuBlocks_io_rfWriteback_8_bits_data = wbArbiter_io_out_8_bits_data; // @[XSCore.scala 349:21]
  assign exuBlocks_io_fuWriteback_3_ready = wbArbiter_io_in_3_ready; // @[XSCore.scala 275:32]
  assign exuBlocks_io_scheExtra_feedback_0_feedbackSlow_valid = memBlock_io_rsfeedback_0_feedbackSlow_valid; // @[XSCore.scala 417:26]
  assign exuBlocks_io_scheExtra_feedback_0_feedbackSlow_bits_rsIdx = memBlock_io_rsfeedback_0_feedbackSlow_bits_rsIdx; // @[XSCore.scala 417:26]
  assign exuBlocks_io_scheExtra_feedback_0_feedbackSlow_bits_hit = memBlock_io_rsfeedback_0_feedbackSlow_bits_hit; // @[XSCore.scala 417:26]
  assign exuBlocks_io_scheExtra_feedback_1_feedbackSlow_valid = memBlock_io_rsfeedback_1_feedbackSlow_valid; // @[XSCore.scala 417:26]
  assign exuBlocks_io_scheExtra_feedback_1_feedbackSlow_bits_rsIdx = memBlock_io_rsfeedback_1_feedbackSlow_bits_rsIdx; // @[XSCore.scala 417:26]
  assign exuBlocks_io_scheExtra_feedback_1_feedbackSlow_bits_hit = memBlock_io_rsfeedback_1_feedbackSlow_bits_hit; // @[XSCore.scala 417:26]
  assign exuBlocks_io_scheExtra_fpRfReadIn_0_data = exuBlocks_1_io_scheExtra_fpRfReadOut_0_data; // @[XSCore.scala 329:44]
  assign exuBlocks_io_scheExtra_fpRfReadIn_1_data = exuBlocks_1_io_scheExtra_fpRfReadOut_1_data; // @[XSCore.scala 329:44]
  assign exuBlocks_io_scheExtra_jumpPc = ctrlBlock_io_jumpPc; // @[XSCore.scala 351:26]
  assign exuBlocks_io_scheExtra_jalr_target = ctrlBlock_io_jalr_target; // @[XSCore.scala 352:31]
  assign exuBlocks_io_scheExtra_lcommit = memBlock_io_lqDeq; // @[XSCore.scala 305:28]
  assign exuBlocks_io_scheExtra_scommit = memBlock_io_sqDeq; // @[XSCore.scala 306:28]
  assign exuBlocks_io_scheExtra_lqCancelCnt = memBlock_io_lqCancelCnt; // @[XSCore.scala 307:32]
  assign exuBlocks_io_scheExtra_sqCancelCnt = memBlock_io_sqCancelCnt; // @[XSCore.scala 308:32]
  assign exuBlocks_io_scheExtra_debug_int_rat_0 = ctrlBlock_io_debug_int_rat_0; // @[XSCore.scala 355:33]
  assign exuBlocks_io_scheExtra_debug_int_rat_1 = ctrlBlock_io_debug_int_rat_1; // @[XSCore.scala 355:33]
  assign exuBlocks_io_scheExtra_debug_int_rat_2 = ctrlBlock_io_debug_int_rat_2; // @[XSCore.scala 355:33]
  assign exuBlocks_io_scheExtra_debug_int_rat_3 = ctrlBlock_io_debug_int_rat_3; // @[XSCore.scala 355:33]
  assign exuBlocks_io_scheExtra_debug_int_rat_4 = ctrlBlock_io_debug_int_rat_4; // @[XSCore.scala 355:33]
  assign exuBlocks_io_scheExtra_debug_int_rat_5 = ctrlBlock_io_debug_int_rat_5; // @[XSCore.scala 355:33]
  assign exuBlocks_io_scheExtra_debug_int_rat_6 = ctrlBlock_io_debug_int_rat_6; // @[XSCore.scala 355:33]
  assign exuBlocks_io_scheExtra_debug_int_rat_7 = ctrlBlock_io_debug_int_rat_7; // @[XSCore.scala 355:33]
  assign exuBlocks_io_scheExtra_debug_int_rat_8 = ctrlBlock_io_debug_int_rat_8; // @[XSCore.scala 355:33]
  assign exuBlocks_io_scheExtra_debug_int_rat_9 = ctrlBlock_io_debug_int_rat_9; // @[XSCore.scala 355:33]
  assign exuBlocks_io_scheExtra_debug_int_rat_10 = ctrlBlock_io_debug_int_rat_10; // @[XSCore.scala 355:33]
  assign exuBlocks_io_scheExtra_debug_int_rat_11 = ctrlBlock_io_debug_int_rat_11; // @[XSCore.scala 355:33]
  assign exuBlocks_io_scheExtra_debug_int_rat_12 = ctrlBlock_io_debug_int_rat_12; // @[XSCore.scala 355:33]
  assign exuBlocks_io_scheExtra_debug_int_rat_13 = ctrlBlock_io_debug_int_rat_13; // @[XSCore.scala 355:33]
  assign exuBlocks_io_scheExtra_debug_int_rat_14 = ctrlBlock_io_debug_int_rat_14; // @[XSCore.scala 355:33]
  assign exuBlocks_io_scheExtra_debug_int_rat_15 = ctrlBlock_io_debug_int_rat_15; // @[XSCore.scala 355:33]
  assign exuBlocks_io_scheExtra_debug_int_rat_16 = ctrlBlock_io_debug_int_rat_16; // @[XSCore.scala 355:33]
  assign exuBlocks_io_scheExtra_debug_int_rat_17 = ctrlBlock_io_debug_int_rat_17; // @[XSCore.scala 355:33]
  assign exuBlocks_io_scheExtra_debug_int_rat_18 = ctrlBlock_io_debug_int_rat_18; // @[XSCore.scala 355:33]
  assign exuBlocks_io_scheExtra_debug_int_rat_19 = ctrlBlock_io_debug_int_rat_19; // @[XSCore.scala 355:33]
  assign exuBlocks_io_scheExtra_debug_int_rat_20 = ctrlBlock_io_debug_int_rat_20; // @[XSCore.scala 355:33]
  assign exuBlocks_io_scheExtra_debug_int_rat_21 = ctrlBlock_io_debug_int_rat_21; // @[XSCore.scala 355:33]
  assign exuBlocks_io_scheExtra_debug_int_rat_22 = ctrlBlock_io_debug_int_rat_22; // @[XSCore.scala 355:33]
  assign exuBlocks_io_scheExtra_debug_int_rat_23 = ctrlBlock_io_debug_int_rat_23; // @[XSCore.scala 355:33]
  assign exuBlocks_io_scheExtra_debug_int_rat_24 = ctrlBlock_io_debug_int_rat_24; // @[XSCore.scala 355:33]
  assign exuBlocks_io_scheExtra_debug_int_rat_25 = ctrlBlock_io_debug_int_rat_25; // @[XSCore.scala 355:33]
  assign exuBlocks_io_scheExtra_debug_int_rat_26 = ctrlBlock_io_debug_int_rat_26; // @[XSCore.scala 355:33]
  assign exuBlocks_io_scheExtra_debug_int_rat_27 = ctrlBlock_io_debug_int_rat_27; // @[XSCore.scala 355:33]
  assign exuBlocks_io_scheExtra_debug_int_rat_28 = ctrlBlock_io_debug_int_rat_28; // @[XSCore.scala 355:33]
  assign exuBlocks_io_scheExtra_debug_int_rat_29 = ctrlBlock_io_debug_int_rat_29; // @[XSCore.scala 355:33]
  assign exuBlocks_io_scheExtra_debug_int_rat_30 = ctrlBlock_io_debug_int_rat_30; // @[XSCore.scala 355:33]
  assign exuBlocks_io_scheExtra_debug_int_rat_31 = ctrlBlock_io_debug_int_rat_31; // @[XSCore.scala 355:33]
  assign exuBlocks_io_fuExtra_csrio_hartId = io_hartId[7:0]; // @[XSCore.scala 379:18]
  assign exuBlocks_io_fuExtra_csrio_perf_perfEventsFrontend_0_value = frontend_io_perf_0_value; // @[XSCore.scala 386:35]
  assign exuBlocks_io_fuExtra_csrio_perf_perfEventsFrontend_1_value = frontend_io_perf_1_value; // @[XSCore.scala 386:35]
  assign exuBlocks_io_fuExtra_csrio_perf_perfEventsFrontend_2_value = frontend_io_perf_2_value; // @[XSCore.scala 386:35]
  assign exuBlocks_io_fuExtra_csrio_perf_perfEventsFrontend_3_value = frontend_io_perf_3_value; // @[XSCore.scala 386:35]
  assign exuBlocks_io_fuExtra_csrio_perf_perfEventsFrontend_4_value = frontend_io_perf_4_value; // @[XSCore.scala 386:35]
  assign exuBlocks_io_fuExtra_csrio_perf_perfEventsFrontend_5_value = frontend_io_perf_5_value; // @[XSCore.scala 386:35]
  assign exuBlocks_io_fuExtra_csrio_perf_perfEventsFrontend_6_value = frontend_io_perf_6_value; // @[XSCore.scala 386:35]
  assign exuBlocks_io_fuExtra_csrio_perf_perfEventsFrontend_7_value = frontend_io_perf_7_value; // @[XSCore.scala 386:35]
  assign exuBlocks_io_fuExtra_csrio_perf_perfEventsCtrl_0_value = ctrlBlock_io_perf_0_value; // @[XSCore.scala 387:35]
  assign exuBlocks_io_fuExtra_csrio_perf_perfEventsCtrl_1_value = ctrlBlock_io_perf_1_value; // @[XSCore.scala 387:35]
  assign exuBlocks_io_fuExtra_csrio_perf_perfEventsCtrl_2_value = ctrlBlock_io_perf_2_value; // @[XSCore.scala 387:35]
  assign exuBlocks_io_fuExtra_csrio_perf_perfEventsCtrl_3_value = ctrlBlock_io_perf_3_value; // @[XSCore.scala 387:35]
  assign exuBlocks_io_fuExtra_csrio_perf_perfEventsCtrl_4_value = ctrlBlock_io_perf_4_value; // @[XSCore.scala 387:35]
  assign exuBlocks_io_fuExtra_csrio_perf_perfEventsCtrl_5_value = ctrlBlock_io_perf_5_value; // @[XSCore.scala 387:35]
  assign exuBlocks_io_fuExtra_csrio_perf_perfEventsCtrl_6_value = ctrlBlock_io_perf_6_value; // @[XSCore.scala 387:35]
  assign exuBlocks_io_fuExtra_csrio_perf_perfEventsCtrl_7_value = ctrlBlock_io_perf_7_value; // @[XSCore.scala 387:35]
  assign exuBlocks_io_fuExtra_csrio_perf_perfEventsLsu_0_value = memBlock_io_perf_0_value; // @[XSCore.scala 388:35]
  assign exuBlocks_io_fuExtra_csrio_perf_perfEventsLsu_1_value = memBlock_io_perf_1_value; // @[XSCore.scala 388:35]
  assign exuBlocks_io_fuExtra_csrio_perf_perfEventsLsu_2_value = memBlock_io_perf_2_value; // @[XSCore.scala 388:35]
  assign exuBlocks_io_fuExtra_csrio_perf_perfEventsLsu_3_value = memBlock_io_perf_3_value; // @[XSCore.scala 388:35]
  assign exuBlocks_io_fuExtra_csrio_perf_perfEventsLsu_4_value = memBlock_io_perf_4_value; // @[XSCore.scala 388:35]
  assign exuBlocks_io_fuExtra_csrio_perf_perfEventsLsu_5_value = memBlock_io_perf_5_value; // @[XSCore.scala 388:35]
  assign exuBlocks_io_fuExtra_csrio_perf_perfEventsLsu_6_value = memBlock_io_perf_6_value; // @[XSCore.scala 388:35]
  assign exuBlocks_io_fuExtra_csrio_perf_perfEventsLsu_7_value = memBlock_io_perf_7_value; // @[XSCore.scala 388:35]
  assign exuBlocks_io_fuExtra_csrio_perf_retiredInstr = ctrlBlock_io_robio_toCSR_perfinfo_retiredInstr; // @[XSCore.scala 381:29]
  assign exuBlocks_io_fuExtra_csrio_fpu_fflags_valid = ctrlBlock_io_robio_toCSR_fflags_valid; // @[XSCore.scala 391:22]
  assign exuBlocks_io_fuExtra_csrio_fpu_fflags_bits = ctrlBlock_io_robio_toCSR_fflags_bits; // @[XSCore.scala 391:22]
  assign exuBlocks_io_fuExtra_csrio_fpu_dirty_fs = ctrlBlock_io_robio_toCSR_dirty_fs; // @[XSCore.scala 393:24]
  assign exuBlocks_io_fuExtra_csrio_exception_valid = ctrlBlock_io_robio_exception_valid; // @[XSCore.scala 395:21]
  assign exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_pc = ctrlBlock_io_robio_exception_bits_uop_cf_pc; // @[XSCore.scala 395:21]
  assign exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_exceptionVec_0 =
    ctrlBlock_io_robio_exception_bits_uop_cf_exceptionVec_0; // @[XSCore.scala 395:21]
  assign exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_exceptionVec_1 =
    ctrlBlock_io_robio_exception_bits_uop_cf_exceptionVec_1; // @[XSCore.scala 395:21]
  assign exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_exceptionVec_2 =
    ctrlBlock_io_robio_exception_bits_uop_cf_exceptionVec_2; // @[XSCore.scala 395:21]
  assign exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_exceptionVec_3 =
    ctrlBlock_io_robio_exception_bits_uop_cf_exceptionVec_3; // @[XSCore.scala 395:21]
  assign exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_exceptionVec_4 =
    ctrlBlock_io_robio_exception_bits_uop_cf_exceptionVec_4; // @[XSCore.scala 395:21]
  assign exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_exceptionVec_5 =
    ctrlBlock_io_robio_exception_bits_uop_cf_exceptionVec_5; // @[XSCore.scala 395:21]
  assign exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_exceptionVec_6 =
    ctrlBlock_io_robio_exception_bits_uop_cf_exceptionVec_6; // @[XSCore.scala 395:21]
  assign exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_exceptionVec_7 =
    ctrlBlock_io_robio_exception_bits_uop_cf_exceptionVec_7; // @[XSCore.scala 395:21]
  assign exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_exceptionVec_8 =
    ctrlBlock_io_robio_exception_bits_uop_cf_exceptionVec_8; // @[XSCore.scala 395:21]
  assign exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_exceptionVec_9 =
    ctrlBlock_io_robio_exception_bits_uop_cf_exceptionVec_9; // @[XSCore.scala 395:21]
  assign exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_exceptionVec_11 =
    ctrlBlock_io_robio_exception_bits_uop_cf_exceptionVec_11; // @[XSCore.scala 395:21]
  assign exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_exceptionVec_12 =
    ctrlBlock_io_robio_exception_bits_uop_cf_exceptionVec_12; // @[XSCore.scala 395:21]
  assign exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_exceptionVec_13 =
    ctrlBlock_io_robio_exception_bits_uop_cf_exceptionVec_13; // @[XSCore.scala 395:21]
  assign exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_exceptionVec_15 =
    ctrlBlock_io_robio_exception_bits_uop_cf_exceptionVec_15; // @[XSCore.scala 395:21]
  assign exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_trigger_frontendHit_0 =
    ctrlBlock_io_robio_exception_bits_uop_cf_trigger_frontendHit_0; // @[XSCore.scala 395:21]
  assign exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_trigger_frontendHit_1 =
    ctrlBlock_io_robio_exception_bits_uop_cf_trigger_frontendHit_1; // @[XSCore.scala 395:21]
  assign exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_trigger_frontendHit_2 =
    ctrlBlock_io_robio_exception_bits_uop_cf_trigger_frontendHit_2; // @[XSCore.scala 395:21]
  assign exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_trigger_frontendHit_3 =
    ctrlBlock_io_robio_exception_bits_uop_cf_trigger_frontendHit_3; // @[XSCore.scala 395:21]
  assign exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_trigger_backendHit_0 =
    ctrlBlock_io_robio_exception_bits_uop_cf_trigger_backendHit_0; // @[XSCore.scala 395:21]
  assign exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_trigger_backendHit_1 =
    ctrlBlock_io_robio_exception_bits_uop_cf_trigger_backendHit_1; // @[XSCore.scala 395:21]
  assign exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_trigger_backendHit_2 =
    ctrlBlock_io_robio_exception_bits_uop_cf_trigger_backendHit_2; // @[XSCore.scala 395:21]
  assign exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_trigger_backendHit_3 =
    ctrlBlock_io_robio_exception_bits_uop_cf_trigger_backendHit_3; // @[XSCore.scala 395:21]
  assign exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_trigger_backendHit_4 =
    ctrlBlock_io_robio_exception_bits_uop_cf_trigger_backendHit_4; // @[XSCore.scala 395:21]
  assign exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_trigger_backendHit_5 =
    ctrlBlock_io_robio_exception_bits_uop_cf_trigger_backendHit_5; // @[XSCore.scala 395:21]
  assign exuBlocks_io_fuExtra_csrio_exception_bits_uop_cf_crossPageIPFFix =
    ctrlBlock_io_robio_exception_bits_uop_cf_crossPageIPFFix; // @[XSCore.scala 395:21]
  assign exuBlocks_io_fuExtra_csrio_exception_bits_uop_ctrl_singleStep =
    ctrlBlock_io_robio_exception_bits_uop_ctrl_singleStep; // @[XSCore.scala 395:21]
  assign exuBlocks_io_fuExtra_csrio_exception_bits_isInterrupt = ctrlBlock_io_robio_exception_bits_isInterrupt; // @[XSCore.scala 395:21]
  assign exuBlocks_io_fuExtra_csrio_memExceptionVAddr = memBlock_io_lsqio_exceptionAddr_vaddr; // @[XSCore.scala 400:29]
  assign exuBlocks_io_fuExtra_csrio_externalInterrupt_mtip = auto_clint_int_sink_in_1; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign exuBlocks_io_fuExtra_csrio_externalInterrupt_msip = auto_clint_int_sink_in_0; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign exuBlocks_io_fuExtra_csrio_externalInterrupt_meip = auto_plic_int_sink_in_0_0; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign exuBlocks_io_fuExtra_csrio_externalInterrupt_seip = auto_plic_int_sink_in_1_0; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign exuBlocks_io_fuExtra_csrio_externalInterrupt_debug = auto_debug_int_sink_in_0; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign exuBlocks_io_fuExtra_csrio_distributedUpdate_0_wvalid = memBlock_io_csrUpdate_wvalid; // @[XSCore.scala 408:40]
  assign exuBlocks_io_fuExtra_csrio_distributedUpdate_0_waddr = memBlock_io_csrUpdate_waddr; // @[XSCore.scala 409:39]
  assign exuBlocks_io_fuExtra_csrio_distributedUpdate_0_wdata = memBlock_io_csrUpdate_wdata; // @[XSCore.scala 409:39]
  assign exuBlocks_io_fuExtra_csrio_distributedUpdate_1_wvalid = frontend_io_csrUpdate_wvalid; // @[XSCore.scala 410:40]
  assign exuBlocks_io_fuExtra_csrio_distributedUpdate_1_waddr = frontend_io_csrUpdate_waddr; // @[XSCore.scala 411:39]
  assign exuBlocks_io_fuExtra_csrio_distributedUpdate_1_wdata = frontend_io_csrUpdate_wdata; // @[XSCore.scala 411:39]
  assign exuBlocks_io_fuExtra_fenceio_sbuffer_sbIsEmpty = memBlock_io_fenceToSbuffer_sbIsEmpty; // @[XSCore.scala 414:19]
  assign exuBlocks_1_clock = clock;
  assign exuBlocks_1_reset = resetGen_3_o_reset; // @[ResetGen.scala 50:30 53:22]
  assign exuBlocks_1_io_hartId = io_hartId[7:0]; // @[XSCore.scala 265:33]
  assign exuBlocks_1_io_redirect_valid = ctrlBlock_io_redirect_valid; // @[XSCore.scala 347:18]
  assign exuBlocks_1_io_redirect_bits_robIdx_flag = ctrlBlock_io_redirect_bits_robIdx_flag; // @[XSCore.scala 347:18]
  assign exuBlocks_1_io_redirect_bits_robIdx_value = ctrlBlock_io_redirect_bits_robIdx_value; // @[XSCore.scala 347:18]
  assign exuBlocks_1_io_redirect_bits_level = ctrlBlock_io_redirect_bits_level; // @[XSCore.scala 347:18]
  assign exuBlocks_1_io_allocPregs_0_isFp = ctrlBlock_io_allocPregs_0_isFp; // @[XSCore.scala 348:20]
  assign exuBlocks_1_io_allocPregs_0_preg = ctrlBlock_io_allocPregs_0_preg; // @[XSCore.scala 348:20]
  assign exuBlocks_1_io_allocPregs_1_isFp = ctrlBlock_io_allocPregs_1_isFp; // @[XSCore.scala 348:20]
  assign exuBlocks_1_io_allocPregs_1_preg = ctrlBlock_io_allocPregs_1_preg; // @[XSCore.scala 348:20]
  assign exuBlocks_1_io_in_0_valid = ctrlBlock_io_dispatch_8_valid; // @[XSCore.scala 321:25]
  assign exuBlocks_1_io_in_0_bits_cf_pd_isRVC = ctrlBlock_io_dispatch_8_bits_cf_pd_isRVC; // @[XSCore.scala 321:25]
  assign exuBlocks_1_io_in_0_bits_cf_pd_brType = ctrlBlock_io_dispatch_8_bits_cf_pd_brType; // @[XSCore.scala 321:25]
  assign exuBlocks_1_io_in_0_bits_cf_pd_isCall = ctrlBlock_io_dispatch_8_bits_cf_pd_isCall; // @[XSCore.scala 321:25]
  assign exuBlocks_1_io_in_0_bits_cf_pd_isRet = ctrlBlock_io_dispatch_8_bits_cf_pd_isRet; // @[XSCore.scala 321:25]
  assign exuBlocks_1_io_in_0_bits_cf_pred_taken = ctrlBlock_io_dispatch_8_bits_cf_pred_taken; // @[XSCore.scala 321:25]
  assign exuBlocks_1_io_in_0_bits_cf_ftqPtr_flag = ctrlBlock_io_dispatch_8_bits_cf_ftqPtr_flag; // @[XSCore.scala 321:25]
  assign exuBlocks_1_io_in_0_bits_cf_ftqPtr_value = ctrlBlock_io_dispatch_8_bits_cf_ftqPtr_value; // @[XSCore.scala 321:25]
  assign exuBlocks_1_io_in_0_bits_cf_ftqOffset = ctrlBlock_io_dispatch_8_bits_cf_ftqOffset; // @[XSCore.scala 321:25]
  assign exuBlocks_1_io_in_0_bits_ctrl_srcType_0 = ctrlBlock_io_dispatch_8_bits_ctrl_srcType_0; // @[XSCore.scala 321:25]
  assign exuBlocks_1_io_in_0_bits_ctrl_srcType_1 = ctrlBlock_io_dispatch_8_bits_ctrl_srcType_1; // @[XSCore.scala 321:25]
  assign exuBlocks_1_io_in_0_bits_ctrl_srcType_2 = ctrlBlock_io_dispatch_8_bits_ctrl_srcType_2; // @[XSCore.scala 321:25]
  assign exuBlocks_1_io_in_0_bits_ctrl_fuType = ctrlBlock_io_dispatch_8_bits_ctrl_fuType; // @[XSCore.scala 321:25]
  assign exuBlocks_1_io_in_0_bits_ctrl_fuOpType = ctrlBlock_io_dispatch_8_bits_ctrl_fuOpType; // @[XSCore.scala 321:25]
  assign exuBlocks_1_io_in_0_bits_ctrl_rfWen = ctrlBlock_io_dispatch_8_bits_ctrl_rfWen; // @[XSCore.scala 321:25]
  assign exuBlocks_1_io_in_0_bits_ctrl_fpWen = ctrlBlock_io_dispatch_8_bits_ctrl_fpWen; // @[XSCore.scala 321:25]
  assign exuBlocks_1_io_in_0_bits_ctrl_imm = ctrlBlock_io_dispatch_8_bits_ctrl_imm; // @[XSCore.scala 321:25]
  assign exuBlocks_1_io_in_0_bits_ctrl_fpu_isAddSub = ctrlBlock_io_dispatch_8_bits_ctrl_fpu_isAddSub; // @[XSCore.scala 321:25]
  assign exuBlocks_1_io_in_0_bits_ctrl_fpu_typeTagIn = ctrlBlock_io_dispatch_8_bits_ctrl_fpu_typeTagIn; // @[XSCore.scala 321:25]
  assign exuBlocks_1_io_in_0_bits_ctrl_fpu_typeTagOut = ctrlBlock_io_dispatch_8_bits_ctrl_fpu_typeTagOut; // @[XSCore.scala 321:25]
  assign exuBlocks_1_io_in_0_bits_ctrl_fpu_fromInt = ctrlBlock_io_dispatch_8_bits_ctrl_fpu_fromInt; // @[XSCore.scala 321:25]
  assign exuBlocks_1_io_in_0_bits_ctrl_fpu_wflags = ctrlBlock_io_dispatch_8_bits_ctrl_fpu_wflags; // @[XSCore.scala 321:25]
  assign exuBlocks_1_io_in_0_bits_ctrl_fpu_fpWen = ctrlBlock_io_dispatch_8_bits_ctrl_fpu_fpWen; // @[XSCore.scala 321:25]
  assign exuBlocks_1_io_in_0_bits_ctrl_fpu_fmaCmd = ctrlBlock_io_dispatch_8_bits_ctrl_fpu_fmaCmd; // @[XSCore.scala 321:25]
  assign exuBlocks_1_io_in_0_bits_ctrl_fpu_div = ctrlBlock_io_dispatch_8_bits_ctrl_fpu_div; // @[XSCore.scala 321:25]
  assign exuBlocks_1_io_in_0_bits_ctrl_fpu_sqrt = ctrlBlock_io_dispatch_8_bits_ctrl_fpu_sqrt; // @[XSCore.scala 321:25]
  assign exuBlocks_1_io_in_0_bits_ctrl_fpu_fcvt = ctrlBlock_io_dispatch_8_bits_ctrl_fpu_fcvt; // @[XSCore.scala 321:25]
  assign exuBlocks_1_io_in_0_bits_ctrl_fpu_typ = ctrlBlock_io_dispatch_8_bits_ctrl_fpu_typ; // @[XSCore.scala 321:25]
  assign exuBlocks_1_io_in_0_bits_ctrl_fpu_fmt = ctrlBlock_io_dispatch_8_bits_ctrl_fpu_fmt; // @[XSCore.scala 321:25]
  assign exuBlocks_1_io_in_0_bits_ctrl_fpu_ren3 = ctrlBlock_io_dispatch_8_bits_ctrl_fpu_ren3; // @[XSCore.scala 321:25]
  assign exuBlocks_1_io_in_0_bits_ctrl_fpu_rm = ctrlBlock_io_dispatch_8_bits_ctrl_fpu_rm; // @[XSCore.scala 321:25]
  assign exuBlocks_1_io_in_0_bits_psrc_0 = ctrlBlock_io_dispatch_8_bits_psrc_0; // @[XSCore.scala 321:25]
  assign exuBlocks_1_io_in_0_bits_psrc_1 = ctrlBlock_io_dispatch_8_bits_psrc_1; // @[XSCore.scala 321:25]
  assign exuBlocks_1_io_in_0_bits_psrc_2 = ctrlBlock_io_dispatch_8_bits_psrc_2; // @[XSCore.scala 321:25]
  assign exuBlocks_1_io_in_0_bits_pdest = ctrlBlock_io_dispatch_8_bits_pdest; // @[XSCore.scala 321:25]
  assign exuBlocks_1_io_in_0_bits_robIdx_flag = ctrlBlock_io_dispatch_8_bits_robIdx_flag; // @[XSCore.scala 321:25]
  assign exuBlocks_1_io_in_0_bits_robIdx_value = ctrlBlock_io_dispatch_8_bits_robIdx_value; // @[XSCore.scala 321:25]
  assign exuBlocks_1_io_rfWriteback_6_valid = wbArbiter_io_out_6_valid; // @[XSCore.scala 349:21]
  assign exuBlocks_1_io_rfWriteback_6_bits_uop_ctrl_fpWen = wbArbiter_io_out_6_bits_uop_ctrl_fpWen; // @[XSCore.scala 349:21]
  assign exuBlocks_1_io_rfWriteback_6_bits_uop_pdest = wbArbiter_io_out_6_bits_uop_pdest; // @[XSCore.scala 349:21]
  assign exuBlocks_1_io_rfWriteback_6_bits_data = wbArbiter_io_out_6_bits_data; // @[XSCore.scala 349:21]
  assign exuBlocks_1_io_rfWriteback_7_valid = wbArbiter_io_out_7_valid; // @[XSCore.scala 349:21]
  assign exuBlocks_1_io_rfWriteback_7_bits_uop_ctrl_fpWen = wbArbiter_io_out_7_bits_uop_ctrl_fpWen; // @[XSCore.scala 349:21]
  assign exuBlocks_1_io_rfWriteback_7_bits_uop_pdest = wbArbiter_io_out_7_bits_uop_pdest; // @[XSCore.scala 349:21]
  assign exuBlocks_1_io_rfWriteback_7_bits_data = wbArbiter_io_out_7_bits_data; // @[XSCore.scala 349:21]
  assign exuBlocks_1_io_rfWriteback_8_valid = wbArbiter_io_out_8_valid; // @[XSCore.scala 349:21]
  assign exuBlocks_1_io_rfWriteback_8_bits_uop_ctrl_fpWen = wbArbiter_io_out_8_bits_uop_ctrl_fpWen; // @[XSCore.scala 349:21]
  assign exuBlocks_1_io_rfWriteback_8_bits_uop_pdest = wbArbiter_io_out_8_bits_uop_pdest; // @[XSCore.scala 349:21]
  assign exuBlocks_1_io_rfWriteback_8_bits_data = wbArbiter_io_out_8_bits_data; // @[XSCore.scala 349:21]
  assign exuBlocks_1_io_fastUopIn_5_valid = exuBlocks_1_io_fastUopOut_0_valid; // @[XSCore.scala 350:19]
  assign exuBlocks_1_io_fastUopIn_5_bits_ctrl_fpWen = exuBlocks_1_io_fastUopOut_0_bits_ctrl_fpWen; // @[XSCore.scala 350:19]
  assign exuBlocks_1_io_fastUopIn_5_bits_pdest = exuBlocks_1_io_fastUopOut_0_bits_pdest; // @[XSCore.scala 350:19]
  assign exuBlocks_1_io_fuWriteback_0_ready = 1'h1; // @[XSCore.scala 275:32]
  assign exuBlocks_1_io_fuWriteback_1_ready = wbArbiter_io_in_5_ready; // @[XSCore.scala 275:32]
  assign exuBlocks_1_io_scheExtra_fpRfReadOut_0_addr = exuBlocks_io_scheExtra_fpRfReadIn_0_addr; // @[XSCore.scala 329:44]
  assign exuBlocks_1_io_scheExtra_fpRfReadOut_1_addr = exuBlocks_io_scheExtra_fpRfReadIn_1_addr; // @[XSCore.scala 329:44]
  assign exuBlocks_1_io_scheExtra_debug_fp_rat_0 = ctrlBlock_io_debug_fp_rat_0; // @[XSCore.scala 354:32]
  assign exuBlocks_1_io_scheExtra_debug_fp_rat_1 = ctrlBlock_io_debug_fp_rat_1; // @[XSCore.scala 354:32]
  assign exuBlocks_1_io_scheExtra_debug_fp_rat_2 = ctrlBlock_io_debug_fp_rat_2; // @[XSCore.scala 354:32]
  assign exuBlocks_1_io_scheExtra_debug_fp_rat_3 = ctrlBlock_io_debug_fp_rat_3; // @[XSCore.scala 354:32]
  assign exuBlocks_1_io_scheExtra_debug_fp_rat_4 = ctrlBlock_io_debug_fp_rat_4; // @[XSCore.scala 354:32]
  assign exuBlocks_1_io_scheExtra_debug_fp_rat_5 = ctrlBlock_io_debug_fp_rat_5; // @[XSCore.scala 354:32]
  assign exuBlocks_1_io_scheExtra_debug_fp_rat_6 = ctrlBlock_io_debug_fp_rat_6; // @[XSCore.scala 354:32]
  assign exuBlocks_1_io_scheExtra_debug_fp_rat_7 = ctrlBlock_io_debug_fp_rat_7; // @[XSCore.scala 354:32]
  assign exuBlocks_1_io_scheExtra_debug_fp_rat_8 = ctrlBlock_io_debug_fp_rat_8; // @[XSCore.scala 354:32]
  assign exuBlocks_1_io_scheExtra_debug_fp_rat_9 = ctrlBlock_io_debug_fp_rat_9; // @[XSCore.scala 354:32]
  assign exuBlocks_1_io_scheExtra_debug_fp_rat_10 = ctrlBlock_io_debug_fp_rat_10; // @[XSCore.scala 354:32]
  assign exuBlocks_1_io_scheExtra_debug_fp_rat_11 = ctrlBlock_io_debug_fp_rat_11; // @[XSCore.scala 354:32]
  assign exuBlocks_1_io_scheExtra_debug_fp_rat_12 = ctrlBlock_io_debug_fp_rat_12; // @[XSCore.scala 354:32]
  assign exuBlocks_1_io_scheExtra_debug_fp_rat_13 = ctrlBlock_io_debug_fp_rat_13; // @[XSCore.scala 354:32]
  assign exuBlocks_1_io_scheExtra_debug_fp_rat_14 = ctrlBlock_io_debug_fp_rat_14; // @[XSCore.scala 354:32]
  assign exuBlocks_1_io_scheExtra_debug_fp_rat_15 = ctrlBlock_io_debug_fp_rat_15; // @[XSCore.scala 354:32]
  assign exuBlocks_1_io_scheExtra_debug_fp_rat_16 = ctrlBlock_io_debug_fp_rat_16; // @[XSCore.scala 354:32]
  assign exuBlocks_1_io_scheExtra_debug_fp_rat_17 = ctrlBlock_io_debug_fp_rat_17; // @[XSCore.scala 354:32]
  assign exuBlocks_1_io_scheExtra_debug_fp_rat_18 = ctrlBlock_io_debug_fp_rat_18; // @[XSCore.scala 354:32]
  assign exuBlocks_1_io_scheExtra_debug_fp_rat_19 = ctrlBlock_io_debug_fp_rat_19; // @[XSCore.scala 354:32]
  assign exuBlocks_1_io_scheExtra_debug_fp_rat_20 = ctrlBlock_io_debug_fp_rat_20; // @[XSCore.scala 354:32]
  assign exuBlocks_1_io_scheExtra_debug_fp_rat_21 = ctrlBlock_io_debug_fp_rat_21; // @[XSCore.scala 354:32]
  assign exuBlocks_1_io_scheExtra_debug_fp_rat_22 = ctrlBlock_io_debug_fp_rat_22; // @[XSCore.scala 354:32]
  assign exuBlocks_1_io_scheExtra_debug_fp_rat_23 = ctrlBlock_io_debug_fp_rat_23; // @[XSCore.scala 354:32]
  assign exuBlocks_1_io_scheExtra_debug_fp_rat_24 = ctrlBlock_io_debug_fp_rat_24; // @[XSCore.scala 354:32]
  assign exuBlocks_1_io_scheExtra_debug_fp_rat_25 = ctrlBlock_io_debug_fp_rat_25; // @[XSCore.scala 354:32]
  assign exuBlocks_1_io_scheExtra_debug_fp_rat_26 = ctrlBlock_io_debug_fp_rat_26; // @[XSCore.scala 354:32]
  assign exuBlocks_1_io_scheExtra_debug_fp_rat_27 = ctrlBlock_io_debug_fp_rat_27; // @[XSCore.scala 354:32]
  assign exuBlocks_1_io_scheExtra_debug_fp_rat_28 = ctrlBlock_io_debug_fp_rat_28; // @[XSCore.scala 354:32]
  assign exuBlocks_1_io_scheExtra_debug_fp_rat_29 = ctrlBlock_io_debug_fp_rat_29; // @[XSCore.scala 354:32]
  assign exuBlocks_1_io_scheExtra_debug_fp_rat_30 = ctrlBlock_io_debug_fp_rat_30; // @[XSCore.scala 354:32]
  assign exuBlocks_1_io_scheExtra_debug_fp_rat_31 = ctrlBlock_io_debug_fp_rat_31; // @[XSCore.scala 354:32]
  assign exuBlocks_1_io_fuExtra_frm = exuBlocks_io_fuExtra_csrio_fpu_frm; // @[XSCore.scala 394:19]
  assign memBlock_clock = clock;
  assign memBlock_reset = resetGen_o_reset; // @[ResetGen.scala 50:30 53:22]
  assign memBlock_auto_uncache_client_out_a_ready = auto_memBlock_uncache_client_out_a_ready; // @[LazyModule.scala 311:12]
  assign memBlock_auto_uncache_client_out_d_valid = auto_memBlock_uncache_client_out_d_valid; // @[LazyModule.scala 311:12]
  assign memBlock_auto_uncache_client_out_d_bits_opcode = auto_memBlock_uncache_client_out_d_bits_opcode; // @[LazyModule.scala 311:12]
  assign memBlock_auto_uncache_client_out_d_bits_data = auto_memBlock_uncache_client_out_d_bits_data; // @[LazyModule.scala 311:12]
  assign memBlock_auto_dcache_client_out_a_ready = auto_memBlock_dcache_client_out_a_ready; // @[LazyModule.scala 311:12]
  assign memBlock_auto_dcache_client_out_bvalid = auto_memBlock_dcache_client_out_bvalid; // @[LazyModule.scala 311:12]
  assign memBlock_auto_dcache_client_out_bparam = auto_memBlock_dcache_client_out_bparam; // @[LazyModule.scala 311:12]
  assign memBlock_auto_dcache_client_out_baddress = auto_memBlock_dcache_client_out_baddress; // @[LazyModule.scala 311:12]
  assign memBlock_auto_dcache_client_out_bdata = auto_memBlock_dcache_client_out_bdata; // @[LazyModule.scala 311:12]
  assign memBlock_auto_dcache_client_out_c_ready = auto_memBlock_dcache_client_out_c_ready; // @[LazyModule.scala 311:12]
  assign memBlock_auto_dcache_client_out_d_valid = auto_memBlock_dcache_client_out_d_valid; // @[LazyModule.scala 311:12]
  assign memBlock_auto_dcache_client_out_d_bits_opcode = auto_memBlock_dcache_client_out_d_bits_opcode; // @[LazyModule.scala 311:12]
  assign memBlock_auto_dcache_client_out_d_bits_param = auto_memBlock_dcache_client_out_d_bits_param; // @[LazyModule.scala 311:12]
  assign memBlock_auto_dcache_client_out_d_bits_size = auto_memBlock_dcache_client_out_d_bits_size; // @[LazyModule.scala 311:12]
  assign memBlock_auto_dcache_client_out_d_bits_source = auto_memBlock_dcache_client_out_d_bits_source; // @[LazyModule.scala 311:12]
  assign memBlock_auto_dcache_client_out_d_bits_sink = auto_memBlock_dcache_client_out_d_bits_sink; // @[LazyModule.scala 311:12]
  assign memBlock_auto_dcache_client_out_d_bits_denied = auto_memBlock_dcache_client_out_d_bits_denied; // @[LazyModule.scala 311:12]
  assign memBlock_auto_dcache_client_out_d_bits_echo_blockisdirty =
    auto_memBlock_dcache_client_out_d_bits_echo_blockisdirty; // @[LazyModule.scala 311:12]
  assign memBlock_auto_dcache_client_out_d_bits_data = auto_memBlock_dcache_client_out_d_bits_data; // @[LazyModule.scala 311:12]
  assign memBlock_auto_dcache_client_out_d_bits_corrupt = auto_memBlock_dcache_client_out_d_bits_corrupt; // @[LazyModule.scala 311:12]
  assign memBlock_auto_dcache_client_out_e_ready = auto_memBlock_dcache_client_out_e_ready; // @[LazyModule.scala 311:12]
  assign memBlock_io_hartId = io_hartId[7:0]; // @[XSCore.scala 266:22]
  assign memBlock_io_redirect_valid = ctrlBlock_io_redirect_valid; // @[XSCore.scala 416:24]
  assign memBlock_io_redirect_bits_robIdx_flag = ctrlBlock_io_redirect_bits_robIdx_flag; // @[XSCore.scala 416:24]
  assign memBlock_io_redirect_bits_robIdx_value = ctrlBlock_io_redirect_bits_robIdx_value; // @[XSCore.scala 416:24]
  assign memBlock_io_redirect_bits_level = ctrlBlock_io_redirect_bits_level; // @[XSCore.scala 416:24]
  assign memBlock_io_issue_0_valid = exuBlocks_io_issue_0_valid; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_0_bits_uop_cf_foldpc = exuBlocks_io_issue_0_bits_uop_cf_foldpc; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_0_bits_uop_cf_trigger_backendEn_1 = exuBlocks_io_issue_0_bits_uop_cf_trigger_backendEn_1; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_0_bits_uop_cf_waitForRobIdx_flag = exuBlocks_io_issue_0_bits_uop_cf_waitForRobIdx_flag; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_0_bits_uop_cf_waitForRobIdx_value = exuBlocks_io_issue_0_bits_uop_cf_waitForRobIdx_value; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_0_bits_uop_cf_loadWaitBit = exuBlocks_io_issue_0_bits_uop_cf_loadWaitBit; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_0_bits_uop_cf_loadWaitStrict = exuBlocks_io_issue_0_bits_uop_cf_loadWaitStrict; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_0_bits_uop_cf_ftqPtr_flag = exuBlocks_io_issue_0_bits_uop_cf_ftqPtr_flag; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_0_bits_uop_cf_ftqPtr_value = exuBlocks_io_issue_0_bits_uop_cf_ftqPtr_value; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_0_bits_uop_cf_ftqOffset = exuBlocks_io_issue_0_bits_uop_cf_ftqOffset; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_0_bits_uop_ctrl_fuType = exuBlocks_io_issue_0_bits_uop_ctrl_fuType; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_0_bits_uop_ctrl_fuOpType = exuBlocks_io_issue_0_bits_uop_ctrl_fuOpType; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_0_bits_uop_ctrl_rfWen = exuBlocks_io_issue_0_bits_uop_ctrl_rfWen; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_0_bits_uop_ctrl_fpWen = exuBlocks_io_issue_0_bits_uop_ctrl_fpWen; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_0_bits_uop_ctrl_imm = exuBlocks_io_issue_0_bits_uop_ctrl_imm; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_0_bits_uop_pdest = exuBlocks_io_issue_0_bits_uop_pdest; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_0_bits_uop_robIdx_flag = exuBlocks_io_issue_0_bits_uop_robIdx_flag; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_0_bits_uop_robIdx_value = exuBlocks_io_issue_0_bits_uop_robIdx_value; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_0_bits_uop_lqIdx_flag = exuBlocks_io_issue_0_bits_uop_lqIdx_flag; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_0_bits_uop_lqIdx_value = exuBlocks_io_issue_0_bits_uop_lqIdx_value; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_0_bits_uop_sqIdx_flag = exuBlocks_io_issue_0_bits_uop_sqIdx_flag; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_0_bits_uop_sqIdx_value = exuBlocks_io_issue_0_bits_uop_sqIdx_value; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_0_bits_src_0 = exuBlocks_io_issue_0_bits_src_0; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_1_valid = exuBlocks_io_issue_1_valid; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_1_bits_uop_cf_foldpc = exuBlocks_io_issue_1_bits_uop_cf_foldpc; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_1_bits_uop_cf_trigger_backendEn_1 = exuBlocks_io_issue_1_bits_uop_cf_trigger_backendEn_1; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_1_bits_uop_cf_waitForRobIdx_flag = exuBlocks_io_issue_1_bits_uop_cf_waitForRobIdx_flag; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_1_bits_uop_cf_waitForRobIdx_value = exuBlocks_io_issue_1_bits_uop_cf_waitForRobIdx_value; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_1_bits_uop_cf_loadWaitBit = exuBlocks_io_issue_1_bits_uop_cf_loadWaitBit; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_1_bits_uop_cf_loadWaitStrict = exuBlocks_io_issue_1_bits_uop_cf_loadWaitStrict; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_1_bits_uop_cf_ftqPtr_flag = exuBlocks_io_issue_1_bits_uop_cf_ftqPtr_flag; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_1_bits_uop_cf_ftqPtr_value = exuBlocks_io_issue_1_bits_uop_cf_ftqPtr_value; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_1_bits_uop_cf_ftqOffset = exuBlocks_io_issue_1_bits_uop_cf_ftqOffset; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_1_bits_uop_ctrl_fuType = exuBlocks_io_issue_1_bits_uop_ctrl_fuType; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_1_bits_uop_ctrl_fuOpType = exuBlocks_io_issue_1_bits_uop_ctrl_fuOpType; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_1_bits_uop_ctrl_rfWen = exuBlocks_io_issue_1_bits_uop_ctrl_rfWen; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_1_bits_uop_ctrl_fpWen = exuBlocks_io_issue_1_bits_uop_ctrl_fpWen; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_1_bits_uop_ctrl_imm = exuBlocks_io_issue_1_bits_uop_ctrl_imm; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_1_bits_uop_pdest = exuBlocks_io_issue_1_bits_uop_pdest; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_1_bits_uop_robIdx_flag = exuBlocks_io_issue_1_bits_uop_robIdx_flag; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_1_bits_uop_robIdx_value = exuBlocks_io_issue_1_bits_uop_robIdx_value; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_1_bits_uop_lqIdx_flag = exuBlocks_io_issue_1_bits_uop_lqIdx_flag; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_1_bits_uop_lqIdx_value = exuBlocks_io_issue_1_bits_uop_lqIdx_value; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_1_bits_uop_sqIdx_flag = exuBlocks_io_issue_1_bits_uop_sqIdx_flag; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_1_bits_uop_sqIdx_value = exuBlocks_io_issue_1_bits_uop_sqIdx_value; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_1_bits_src_0 = exuBlocks_io_issue_1_bits_src_0; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_2_valid = exuBlocks_io_issue_2_valid; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_2_bits_uop_cf_trigger_backendEn_0 = exuBlocks_io_issue_2_bits_uop_cf_trigger_backendEn_0; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_2_bits_uop_cf_trigger_backendEn_1 = exuBlocks_io_issue_2_bits_uop_cf_trigger_backendEn_1; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_2_bits_uop_cf_storeSetHit = exuBlocks_io_issue_2_bits_uop_cf_storeSetHit; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_2_bits_uop_cf_ssid = exuBlocks_io_issue_2_bits_uop_cf_ssid; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_2_bits_uop_cf_ftqPtr_value = exuBlocks_io_issue_2_bits_uop_cf_ftqPtr_value; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_2_bits_uop_cf_ftqOffset = exuBlocks_io_issue_2_bits_uop_cf_ftqOffset; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_2_bits_uop_ctrl_fuType = exuBlocks_io_issue_2_bits_uop_ctrl_fuType; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_2_bits_uop_ctrl_fuOpType = exuBlocks_io_issue_2_bits_uop_ctrl_fuOpType; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_2_bits_uop_ctrl_rfWen = exuBlocks_io_issue_2_bits_uop_ctrl_rfWen; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_2_bits_uop_ctrl_fpWen = exuBlocks_io_issue_2_bits_uop_ctrl_fpWen; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_2_bits_uop_ctrl_imm = exuBlocks_io_issue_2_bits_uop_ctrl_imm; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_2_bits_uop_pdest = exuBlocks_io_issue_2_bits_uop_pdest; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_2_bits_uop_robIdx_flag = exuBlocks_io_issue_2_bits_uop_robIdx_flag; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_2_bits_uop_robIdx_value = exuBlocks_io_issue_2_bits_uop_robIdx_value; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_2_bits_uop_sqIdx_flag = exuBlocks_io_issue_2_bits_uop_sqIdx_flag; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_2_bits_uop_sqIdx_value = exuBlocks_io_issue_2_bits_uop_sqIdx_value; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_2_bits_src_0 = exuBlocks_io_issue_2_bits_src_0; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_3_valid = exuBlocks_io_issue_3_valid; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_3_bits_uop_cf_trigger_backendEn_0 = exuBlocks_io_issue_3_bits_uop_cf_trigger_backendEn_0; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_3_bits_uop_cf_trigger_backendEn_1 = exuBlocks_io_issue_3_bits_uop_cf_trigger_backendEn_1; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_3_bits_uop_cf_storeSetHit = exuBlocks_io_issue_3_bits_uop_cf_storeSetHit; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_3_bits_uop_cf_ssid = exuBlocks_io_issue_3_bits_uop_cf_ssid; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_3_bits_uop_cf_ftqPtr_value = exuBlocks_io_issue_3_bits_uop_cf_ftqPtr_value; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_3_bits_uop_cf_ftqOffset = exuBlocks_io_issue_3_bits_uop_cf_ftqOffset; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_3_bits_uop_ctrl_fuType = exuBlocks_io_issue_3_bits_uop_ctrl_fuType; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_3_bits_uop_ctrl_fuOpType = exuBlocks_io_issue_3_bits_uop_ctrl_fuOpType; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_3_bits_uop_ctrl_rfWen = exuBlocks_io_issue_3_bits_uop_ctrl_rfWen; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_3_bits_uop_ctrl_fpWen = exuBlocks_io_issue_3_bits_uop_ctrl_fpWen; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_3_bits_uop_ctrl_imm = exuBlocks_io_issue_3_bits_uop_ctrl_imm; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_3_bits_uop_pdest = exuBlocks_io_issue_3_bits_uop_pdest; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_3_bits_uop_robIdx_flag = exuBlocks_io_issue_3_bits_uop_robIdx_flag; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_3_bits_uop_robIdx_value = exuBlocks_io_issue_3_bits_uop_robIdx_value; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_3_bits_uop_sqIdx_flag = exuBlocks_io_issue_3_bits_uop_sqIdx_flag; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_3_bits_uop_sqIdx_value = exuBlocks_io_issue_3_bits_uop_sqIdx_value; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_3_bits_src_0 = exuBlocks_io_issue_3_bits_src_0; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_4_valid = exuBlocks_io_issue_4_valid; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_4_bits_uop_ctrl_fuType = exuBlocks_io_issue_4_bits_uop_ctrl_fuType; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_4_bits_uop_ctrl_fuOpType = exuBlocks_io_issue_4_bits_uop_ctrl_fuOpType; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_4_bits_uop_robIdx_flag = exuBlocks_io_issue_4_bits_uop_robIdx_flag; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_4_bits_uop_robIdx_value = exuBlocks_io_issue_4_bits_uop_robIdx_value; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_4_bits_uop_sqIdx_flag = exuBlocks_io_issue_4_bits_uop_sqIdx_flag; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_4_bits_uop_sqIdx_value = exuBlocks_io_issue_4_bits_uop_sqIdx_value; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_4_bits_src_0 = exuBlocks_io_issue_4_bits_src_0; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_5_valid = exuBlocks_io_issue_5_valid; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_5_bits_uop_ctrl_fuType = exuBlocks_io_issue_5_bits_uop_ctrl_fuType; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_5_bits_uop_ctrl_fuOpType = exuBlocks_io_issue_5_bits_uop_ctrl_fuOpType; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_5_bits_uop_robIdx_flag = exuBlocks_io_issue_5_bits_uop_robIdx_flag; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_5_bits_uop_robIdx_value = exuBlocks_io_issue_5_bits_uop_robIdx_value; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_5_bits_uop_sqIdx_flag = exuBlocks_io_issue_5_bits_uop_sqIdx_flag; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_5_bits_uop_sqIdx_value = exuBlocks_io_issue_5_bits_uop_sqIdx_value; // @[XSCore.scala 339:21]
  assign memBlock_io_issue_5_bits_src_0 = exuBlocks_io_issue_5_bits_src_0; // @[XSCore.scala 339:21]
  assign memBlock_io_loadFastMatch_0 = exuBlocks_io_scheExtra_loadFastMatch_0; // @[XSCore.scala 342:47]
  assign memBlock_io_loadFastMatch_1 = exuBlocks_io_scheExtra_loadFastMatch_1; // @[XSCore.scala 342:47]
  assign memBlock_io_loadFastImm_0 = exuBlocks_io_scheExtra_loadFastImm_0; // @[XSCore.scala 343:45]
  assign memBlock_io_loadFastImm_1 = exuBlocks_io_scheExtra_loadFastImm_1; // @[XSCore.scala 343:45]
  assign memBlock_io_rsfeedback_0_rsIdx = exuBlocks_io_scheExtra_feedback_0_rsIdx; // @[XSCore.scala 417:26]
  assign memBlock_io_rsfeedback_1_rsIdx = exuBlocks_io_scheExtra_feedback_1_rsIdx; // @[XSCore.scala 417:26]
  assign memBlock_io_writeback_0_ready = 1'h1; // @[XSCore.scala 275:32]
  assign memBlock_io_writeback_1_ready = 1'h1; // @[XSCore.scala 275:32]
  assign memBlock_io_writeback_2_ready = 1'h1; // @[XSCore.scala 275:32]
  assign memBlock_io_writeback_3_ready = 1'h1; // @[XSCore.scala 275:32]
  assign memBlock_io_ptw_resp_valid = dtlbRepeater1_io_tlb_resp_valid; // @[Repeater.scala 145:14]
  assign memBlock_io_ptw_resp_bits_data_entry_tag = dtlbRepeater1_io_tlb_resp_bits_data_entry_tag; // @[Repeater.scala 145:14]
  assign memBlock_io_ptw_resp_bits_data_entry_asid = dtlbRepeater1_io_tlb_resp_bits_data_entry_asid; // @[Repeater.scala 145:14]
  assign memBlock_io_ptw_resp_bits_data_entry_ppn = dtlbRepeater1_io_tlb_resp_bits_data_entry_ppn; // @[Repeater.scala 145:14]
  assign memBlock_io_ptw_resp_bits_data_entry_perm_d = dtlbRepeater1_io_tlb_resp_bits_data_entry_perm_d; // @[Repeater.scala 145:14]
  assign memBlock_io_ptw_resp_bits_data_entry_perm_a = dtlbRepeater1_io_tlb_resp_bits_data_entry_perm_a; // @[Repeater.scala 145:14]
  assign memBlock_io_ptw_resp_bits_data_entry_perm_g = dtlbRepeater1_io_tlb_resp_bits_data_entry_perm_g; // @[Repeater.scala 145:14]
  assign memBlock_io_ptw_resp_bits_data_entry_perm_u = dtlbRepeater1_io_tlb_resp_bits_data_entry_perm_u; // @[Repeater.scala 145:14]
  assign memBlock_io_ptw_resp_bits_data_entry_perm_x = dtlbRepeater1_io_tlb_resp_bits_data_entry_perm_x; // @[Repeater.scala 145:14]
  assign memBlock_io_ptw_resp_bits_data_entry_perm_w = dtlbRepeater1_io_tlb_resp_bits_data_entry_perm_w; // @[Repeater.scala 145:14]
  assign memBlock_io_ptw_resp_bits_data_entry_perm_r = dtlbRepeater1_io_tlb_resp_bits_data_entry_perm_r; // @[Repeater.scala 145:14]
  assign memBlock_io_ptw_resp_bits_data_entry_level = dtlbRepeater1_io_tlb_resp_bits_data_entry_level; // @[Repeater.scala 145:14]
  assign memBlock_io_ptw_resp_bits_data_pf = dtlbRepeater1_io_tlb_resp_bits_data_pf; // @[Repeater.scala 145:14]
  assign memBlock_io_ptw_resp_bits_data_af = dtlbRepeater1_io_tlb_resp_bits_data_af; // @[Repeater.scala 145:14]
  assign memBlock_io_ptw_resp_bits_vector_0 = dtlbRepeater1_io_tlb_resp_bits_vector_0; // @[Repeater.scala 145:14]
  assign memBlock_io_ptw_resp_bits_vector_1 = dtlbRepeater1_io_tlb_resp_bits_vector_1; // @[Repeater.scala 145:14]
  assign memBlock_io_ptw_resp_bits_vector_2 = dtlbRepeater1_io_tlb_resp_bits_vector_2; // @[Repeater.scala 145:14]
  assign memBlock_io_ptw_resp_bits_vector_3 = dtlbRepeater1_io_tlb_resp_bits_vector_3; // @[Repeater.scala 145:14]
  assign memBlock_io_ptw_resp_bits_vector_4 = dtlbRepeater1_io_tlb_resp_bits_vector_4; // @[Repeater.scala 145:14]
  assign memBlock_io_sfence_valid = exuBlocks_io_fuExtra_fenceio_sfence_valid; // @[XSCore.scala 413:18]
  assign memBlock_io_sfence_bits_rs1 = exuBlocks_io_fuExtra_fenceio_sfence_bits_rs1; // @[XSCore.scala 413:18]
  assign memBlock_io_sfence_bits_rs2 = exuBlocks_io_fuExtra_fenceio_sfence_bits_rs2; // @[XSCore.scala 413:18]
  assign memBlock_io_sfence_bits_addr = exuBlocks_io_fuExtra_fenceio_sfence_bits_addr; // @[XSCore.scala 413:18]
  assign memBlock_io_sfence_bits_asid = exuBlocks_io_fuExtra_fenceio_sfence_bits_asid; // @[XSCore.scala 413:18]
  assign memBlock_io_tlbCsr_satp_mode = exuBlocks_io_fuExtra_csrio_tlb_satp_mode; // @[XSCore.scala 419:22]
  assign memBlock_io_tlbCsr_satp_asid = exuBlocks_io_fuExtra_csrio_tlb_satp_asid; // @[XSCore.scala 419:22]
  assign memBlock_io_tlbCsr_satp_changed = exuBlocks_io_fuExtra_csrio_tlb_satp_changed; // @[XSCore.scala 419:22]
  assign memBlock_io_tlbCsr_priv_mxr = exuBlocks_io_fuExtra_csrio_tlb_priv_mxr; // @[XSCore.scala 419:22]
  assign memBlock_io_tlbCsr_priv_sum = exuBlocks_io_fuExtra_csrio_tlb_priv_sum; // @[XSCore.scala 419:22]
  assign memBlock_io_tlbCsr_priv_dmode = exuBlocks_io_fuExtra_csrio_tlb_priv_dmode; // @[XSCore.scala 419:22]
  assign memBlock_io_fenceToSbuffer_flushSb = exuBlocks_io_fuExtra_fenceio_sbuffer_flushSb; // @[XSCore.scala 414:19]
  assign memBlock_io_enqLsq_needAlloc_0 = ctrlBlock_io_enqLsq_needAlloc_0; // @[XSCore.scala 323:23]
  assign memBlock_io_enqLsq_needAlloc_1 = ctrlBlock_io_enqLsq_needAlloc_1; // @[XSCore.scala 323:23]
  assign memBlock_io_enqLsq_needAlloc_2 = ctrlBlock_io_enqLsq_needAlloc_2; // @[XSCore.scala 323:23]
  assign memBlock_io_enqLsq_needAlloc_3 = ctrlBlock_io_enqLsq_needAlloc_3; // @[XSCore.scala 323:23]
  assign memBlock_io_enqLsq_req_0_valid = ctrlBlock_io_enqLsq_req_0_valid; // @[XSCore.scala 323:23]
  assign memBlock_io_enqLsq_req_0_bits_cf_trigger_backendEn_0 = ctrlBlock_io_enqLsq_req_0_bits_cf_trigger_backendEn_0; // @[XSCore.scala 323:23]
  assign memBlock_io_enqLsq_req_0_bits_cf_trigger_backendEn_1 = ctrlBlock_io_enqLsq_req_0_bits_cf_trigger_backendEn_1; // @[XSCore.scala 323:23]
  assign memBlock_io_enqLsq_req_0_bits_ctrl_fuOpType = ctrlBlock_io_enqLsq_req_0_bits_ctrl_fuOpType; // @[XSCore.scala 323:23]
  assign memBlock_io_enqLsq_req_0_bits_ctrl_rfWen = ctrlBlock_io_enqLsq_req_0_bits_ctrl_rfWen; // @[XSCore.scala 323:23]
  assign memBlock_io_enqLsq_req_0_bits_ctrl_fpWen = ctrlBlock_io_enqLsq_req_0_bits_ctrl_fpWen; // @[XSCore.scala 323:23]
  assign memBlock_io_enqLsq_req_0_bits_ctrl_flushPipe = ctrlBlock_io_enqLsq_req_0_bits_ctrl_flushPipe; // @[XSCore.scala 323:23]
  assign memBlock_io_enqLsq_req_0_bits_ctrl_replayInst = ctrlBlock_io_enqLsq_req_0_bits_ctrl_replayInst; // @[XSCore.scala 323:23]
  assign memBlock_io_enqLsq_req_0_bits_pdest = ctrlBlock_io_enqLsq_req_0_bits_pdest; // @[XSCore.scala 323:23]
  assign memBlock_io_enqLsq_req_0_bits_robIdx_flag = ctrlBlock_io_enqLsq_req_0_bits_robIdx_flag; // @[XSCore.scala 323:23]
  assign memBlock_io_enqLsq_req_0_bits_robIdx_value = ctrlBlock_io_enqLsq_req_0_bits_robIdx_value; // @[XSCore.scala 323:23]
  assign memBlock_io_enqLsq_req_0_bits_lqIdx_value = ctrlBlock_io_enqLsq_req_0_bits_lqIdx_value; // @[XSCore.scala 323:23]
  assign memBlock_io_enqLsq_req_0_bits_sqIdx_value = ctrlBlock_io_enqLsq_req_0_bits_sqIdx_value; // @[XSCore.scala 323:23]
  assign memBlock_io_enqLsq_req_1_valid = ctrlBlock_io_enqLsq_req_1_valid; // @[XSCore.scala 323:23]
  assign memBlock_io_enqLsq_req_1_bits_cf_trigger_backendEn_0 = ctrlBlock_io_enqLsq_req_1_bits_cf_trigger_backendEn_0; // @[XSCore.scala 323:23]
  assign memBlock_io_enqLsq_req_1_bits_cf_trigger_backendEn_1 = ctrlBlock_io_enqLsq_req_1_bits_cf_trigger_backendEn_1; // @[XSCore.scala 323:23]
  assign memBlock_io_enqLsq_req_1_bits_ctrl_fuOpType = ctrlBlock_io_enqLsq_req_1_bits_ctrl_fuOpType; // @[XSCore.scala 323:23]
  assign memBlock_io_enqLsq_req_1_bits_ctrl_rfWen = ctrlBlock_io_enqLsq_req_1_bits_ctrl_rfWen; // @[XSCore.scala 323:23]
  assign memBlock_io_enqLsq_req_1_bits_ctrl_fpWen = ctrlBlock_io_enqLsq_req_1_bits_ctrl_fpWen; // @[XSCore.scala 323:23]
  assign memBlock_io_enqLsq_req_1_bits_ctrl_flushPipe = ctrlBlock_io_enqLsq_req_1_bits_ctrl_flushPipe; // @[XSCore.scala 323:23]
  assign memBlock_io_enqLsq_req_1_bits_ctrl_replayInst = ctrlBlock_io_enqLsq_req_1_bits_ctrl_replayInst; // @[XSCore.scala 323:23]
  assign memBlock_io_enqLsq_req_1_bits_pdest = ctrlBlock_io_enqLsq_req_1_bits_pdest; // @[XSCore.scala 323:23]
  assign memBlock_io_enqLsq_req_1_bits_robIdx_flag = ctrlBlock_io_enqLsq_req_1_bits_robIdx_flag; // @[XSCore.scala 323:23]
  assign memBlock_io_enqLsq_req_1_bits_robIdx_value = ctrlBlock_io_enqLsq_req_1_bits_robIdx_value; // @[XSCore.scala 323:23]
  assign memBlock_io_enqLsq_req_1_bits_lqIdx_value = ctrlBlock_io_enqLsq_req_1_bits_lqIdx_value; // @[XSCore.scala 323:23]
  assign memBlock_io_enqLsq_req_1_bits_sqIdx_value = ctrlBlock_io_enqLsq_req_1_bits_sqIdx_value; // @[XSCore.scala 323:23]
  assign memBlock_io_enqLsq_req_2_valid = ctrlBlock_io_enqLsq_req_2_valid; // @[XSCore.scala 323:23]
  assign memBlock_io_enqLsq_req_2_bits_cf_trigger_backendEn_0 = ctrlBlock_io_enqLsq_req_2_bits_cf_trigger_backendEn_0; // @[XSCore.scala 323:23]
  assign memBlock_io_enqLsq_req_2_bits_cf_trigger_backendEn_1 = ctrlBlock_io_enqLsq_req_2_bits_cf_trigger_backendEn_1; // @[XSCore.scala 323:23]
  assign memBlock_io_enqLsq_req_2_bits_ctrl_fuOpType = ctrlBlock_io_enqLsq_req_2_bits_ctrl_fuOpType; // @[XSCore.scala 323:23]
  assign memBlock_io_enqLsq_req_2_bits_ctrl_rfWen = ctrlBlock_io_enqLsq_req_2_bits_ctrl_rfWen; // @[XSCore.scala 323:23]
  assign memBlock_io_enqLsq_req_2_bits_ctrl_fpWen = ctrlBlock_io_enqLsq_req_2_bits_ctrl_fpWen; // @[XSCore.scala 323:23]
  assign memBlock_io_enqLsq_req_2_bits_ctrl_flushPipe = ctrlBlock_io_enqLsq_req_2_bits_ctrl_flushPipe; // @[XSCore.scala 323:23]
  assign memBlock_io_enqLsq_req_2_bits_ctrl_replayInst = ctrlBlock_io_enqLsq_req_2_bits_ctrl_replayInst; // @[XSCore.scala 323:23]
  assign memBlock_io_enqLsq_req_2_bits_pdest = ctrlBlock_io_enqLsq_req_2_bits_pdest; // @[XSCore.scala 323:23]
  assign memBlock_io_enqLsq_req_2_bits_robIdx_flag = ctrlBlock_io_enqLsq_req_2_bits_robIdx_flag; // @[XSCore.scala 323:23]
  assign memBlock_io_enqLsq_req_2_bits_robIdx_value = ctrlBlock_io_enqLsq_req_2_bits_robIdx_value; // @[XSCore.scala 323:23]
  assign memBlock_io_enqLsq_req_2_bits_lqIdx_value = ctrlBlock_io_enqLsq_req_2_bits_lqIdx_value; // @[XSCore.scala 323:23]
  assign memBlock_io_enqLsq_req_2_bits_sqIdx_value = ctrlBlock_io_enqLsq_req_2_bits_sqIdx_value; // @[XSCore.scala 323:23]
  assign memBlock_io_enqLsq_req_3_valid = ctrlBlock_io_enqLsq_req_3_valid; // @[XSCore.scala 323:23]
  assign memBlock_io_enqLsq_req_3_bits_cf_trigger_backendEn_0 = ctrlBlock_io_enqLsq_req_3_bits_cf_trigger_backendEn_0; // @[XSCore.scala 323:23]
  assign memBlock_io_enqLsq_req_3_bits_cf_trigger_backendEn_1 = ctrlBlock_io_enqLsq_req_3_bits_cf_trigger_backendEn_1; // @[XSCore.scala 323:23]
  assign memBlock_io_enqLsq_req_3_bits_ctrl_fuOpType = ctrlBlock_io_enqLsq_req_3_bits_ctrl_fuOpType; // @[XSCore.scala 323:23]
  assign memBlock_io_enqLsq_req_3_bits_ctrl_rfWen = ctrlBlock_io_enqLsq_req_3_bits_ctrl_rfWen; // @[XSCore.scala 323:23]
  assign memBlock_io_enqLsq_req_3_bits_ctrl_fpWen = ctrlBlock_io_enqLsq_req_3_bits_ctrl_fpWen; // @[XSCore.scala 323:23]
  assign memBlock_io_enqLsq_req_3_bits_ctrl_flushPipe = ctrlBlock_io_enqLsq_req_3_bits_ctrl_flushPipe; // @[XSCore.scala 323:23]
  assign memBlock_io_enqLsq_req_3_bits_ctrl_replayInst = ctrlBlock_io_enqLsq_req_3_bits_ctrl_replayInst; // @[XSCore.scala 323:23]
  assign memBlock_io_enqLsq_req_3_bits_pdest = ctrlBlock_io_enqLsq_req_3_bits_pdest; // @[XSCore.scala 323:23]
  assign memBlock_io_enqLsq_req_3_bits_robIdx_flag = ctrlBlock_io_enqLsq_req_3_bits_robIdx_flag; // @[XSCore.scala 323:23]
  assign memBlock_io_enqLsq_req_3_bits_robIdx_value = ctrlBlock_io_enqLsq_req_3_bits_robIdx_value; // @[XSCore.scala 323:23]
  assign memBlock_io_enqLsq_req_3_bits_lqIdx_value = ctrlBlock_io_enqLsq_req_3_bits_lqIdx_value; // @[XSCore.scala 323:23]
  assign memBlock_io_enqLsq_req_3_bits_sqIdx_value = ctrlBlock_io_enqLsq_req_3_bits_sqIdx_value; // @[XSCore.scala 323:23]
  assign memBlock_io_lsqio_exceptionAddr_isStore = ctrlBlock_io_robio_exception_bits_uop_ctrl_commitType[0]; // @[package.scala 136:59]
  assign memBlock_io_lsqio_rob_scommit = ctrlBlock_io_robio_lsq_scommit; // @[XSCore.scala 420:25]
  assign memBlock_io_lsqio_rob_pendingld = ctrlBlock_io_robio_lsq_pendingld; // @[XSCore.scala 420:25]
  assign memBlock_io_lsqio_rob_pendingst = ctrlBlock_io_robio_lsq_pendingst; // @[XSCore.scala 420:25]
  assign memBlock_io_lsqio_rob_commit = ctrlBlock_io_robio_lsq_commit; // @[XSCore.scala 420:25]
  assign memBlock_io_csrCtrl_icache_parity_enable = exuBlocks_io_fuExtra_csrio_customCtrl_icache_parity_enable; // @[XSCore.scala 418:23]
  assign memBlock_io_csrCtrl_lvpred_disable = exuBlocks_io_fuExtra_csrio_customCtrl_lvpred_disable; // @[XSCore.scala 418:23]
  assign memBlock_io_csrCtrl_no_spec_load = exuBlocks_io_fuExtra_csrio_customCtrl_no_spec_load; // @[XSCore.scala 418:23]
  assign memBlock_io_csrCtrl_storeset_wait_store = exuBlocks_io_fuExtra_csrio_customCtrl_storeset_wait_store; // @[XSCore.scala 418:23]
  assign memBlock_io_csrCtrl_lvpred_timeout = exuBlocks_io_fuExtra_csrio_customCtrl_lvpred_timeout; // @[XSCore.scala 418:23]
  assign memBlock_io_csrCtrl_bp_ctrl_ubtb_enable = exuBlocks_io_fuExtra_csrio_customCtrl_bp_ctrl_ubtb_enable; // @[XSCore.scala 418:23]
  assign memBlock_io_csrCtrl_bp_ctrl_btb_enable = exuBlocks_io_fuExtra_csrio_customCtrl_bp_ctrl_btb_enable; // @[XSCore.scala 418:23]
  assign memBlock_io_csrCtrl_bp_ctrl_tage_enable = exuBlocks_io_fuExtra_csrio_customCtrl_bp_ctrl_tage_enable; // @[XSCore.scala 418:23]
  assign memBlock_io_csrCtrl_bp_ctrl_sc_enable = exuBlocks_io_fuExtra_csrio_customCtrl_bp_ctrl_sc_enable; // @[XSCore.scala 418:23]
  assign memBlock_io_csrCtrl_bp_ctrl_ras_enable = exuBlocks_io_fuExtra_csrio_customCtrl_bp_ctrl_ras_enable; // @[XSCore.scala 418:23]
  assign memBlock_io_csrCtrl_sbuffer_threshold = exuBlocks_io_fuExtra_csrio_customCtrl_sbuffer_threshold; // @[XSCore.scala 418:23]
  assign memBlock_io_csrCtrl_ldld_vio_check_enable = exuBlocks_io_fuExtra_csrio_customCtrl_ldld_vio_check_enable; // @[XSCore.scala 418:23]
  assign memBlock_io_csrCtrl_cache_error_enable = exuBlocks_io_fuExtra_csrio_customCtrl_cache_error_enable; // @[XSCore.scala 418:23]
  assign memBlock_io_csrCtrl_uncache_write_outstanding_enable =
    exuBlocks_io_fuExtra_csrio_customCtrl_uncache_write_outstanding_enable; // @[XSCore.scala 418:23]
  assign memBlock_io_csrCtrl_fusion_enable = exuBlocks_io_fuExtra_csrio_customCtrl_fusion_enable; // @[XSCore.scala 418:23]
  assign memBlock_io_csrCtrl_wfi_enable = exuBlocks_io_fuExtra_csrio_customCtrl_wfi_enable; // @[XSCore.scala 418:23]
  assign memBlock_io_csrCtrl_svinval_enable = exuBlocks_io_fuExtra_csrio_customCtrl_svinval_enable; // @[XSCore.scala 418:23]
  assign memBlock_io_csrCtrl_distribute_csr_wvalid = exuBlocks_io_fuExtra_csrio_customCtrl_distribute_csr_wvalid; // @[XSCore.scala 418:23]
  assign memBlock_io_csrCtrl_distribute_csr_waddr =
    exuBlocks_io_fuExtra_csrio_customCtrl_distribute_csr_waddr; // @[XSCore.scala 418:23]
  assign memBlock_io_csrCtrl_distribute_csr_wdata =
    exuBlocks_io_fuExtra_csrio_customCtrl_distribute_csr_wdata; // @[XSCore.scala 418:23]
  assign memBlock_io_csrCtrl_singlestep = exuBlocks_io_fuExtra_csrio_customCtrl_singlestep; // @[XSCore.scala 418:23]
  assign memBlock_io_csrCtrl_frontend_trigger_t_valid = exuBlocks_io_fuExtra_csrio_customCtrl_frontend_trigger_t_valid; // @[XSCore.scala 418:23]
  assign memBlock_io_csrCtrl_frontend_trigger_t_bits_addr =
    exuBlocks_io_fuExtra_csrio_customCtrl_frontend_trigger_t_bits_addr; // @[XSCore.scala 418:23]
  assign memBlock_io_csrCtrl_frontend_trigger_t_bits_tdata_matchType =
    exuBlocks_io_fuExtra_csrio_customCtrl_frontend_trigger_t_bits_tdata_matchType; // @[XSCore.scala 418:23]
  assign memBlock_io_csrCtrl_frontend_trigger_t_bits_tdata_select =
    exuBlocks_io_fuExtra_csrio_customCtrl_frontend_trigger_t_bits_tdata_select; // @[XSCore.scala 418:23]
  assign memBlock_io_csrCtrl_frontend_trigger_t_bits_tdata_timing =
    exuBlocks_io_fuExtra_csrio_customCtrl_frontend_trigger_t_bits_tdata_timing; // @[XSCore.scala 418:23]
  assign memBlock_io_csrCtrl_frontend_trigger_t_bits_tdata_chain =
    exuBlocks_io_fuExtra_csrio_customCtrl_frontend_trigger_t_bits_tdata_chain; // @[XSCore.scala 418:23]
  assign memBlock_io_csrCtrl_frontend_trigger_t_bits_tdata_tdata2 =
    exuBlocks_io_fuExtra_csrio_customCtrl_frontend_trigger_t_bits_tdata_tdata2; // @[XSCore.scala 418:23]
  assign memBlock_io_csrCtrl_mem_trigger_t_valid = exuBlocks_io_fuExtra_csrio_customCtrl_mem_trigger_t_valid; // @[XSCore.scala 418:23]
  assign memBlock_io_csrCtrl_mem_trigger_t_bits_addr = exuBlocks_io_fuExtra_csrio_customCtrl_mem_trigger_t_bits_addr; // @[XSCore.scala 418:23]
  assign memBlock_io_csrCtrl_mem_trigger_t_bits_tdata_matchType =
    exuBlocks_io_fuExtra_csrio_customCtrl_mem_trigger_t_bits_tdata_matchType; // @[XSCore.scala 418:23]
  assign memBlock_io_csrCtrl_mem_trigger_t_bits_tdata_select =
    exuBlocks_io_fuExtra_csrio_customCtrl_mem_trigger_t_bits_tdata_select; // @[XSCore.scala 418:23]
  assign memBlock_io_csrCtrl_mem_trigger_t_bits_tdata_chain =
    exuBlocks_io_fuExtra_csrio_customCtrl_mem_trigger_t_bits_tdata_chain; // @[XSCore.scala 418:23]
  assign memBlock_io_csrCtrl_mem_trigger_t_bits_tdata_tdata2 =
    exuBlocks_io_fuExtra_csrio_customCtrl_mem_trigger_t_bits_tdata_tdata2; // @[XSCore.scala 418:23]
  assign memBlock_io_csrCtrl_trigger_enable_0 = exuBlocks_io_fuExtra_csrio_customCtrl_trigger_enable_0; // @[XSCore.scala 418:23]
  assign memBlock_io_csrCtrl_trigger_enable_1 = exuBlocks_io_fuExtra_csrio_customCtrl_trigger_enable_1; // @[XSCore.scala 418:23]
  assign memBlock_io_csrCtrl_trigger_enable_2 = exuBlocks_io_fuExtra_csrio_customCtrl_trigger_enable_2; // @[XSCore.scala 418:23]
  assign memBlock_io_csrCtrl_trigger_enable_3 = exuBlocks_io_fuExtra_csrio_customCtrl_trigger_enable_3; // @[XSCore.scala 418:23]
  assign memBlock_io_csrCtrl_trigger_enable_4 = exuBlocks_io_fuExtra_csrio_customCtrl_trigger_enable_4; // @[XSCore.scala 418:23]
  assign memBlock_io_csrCtrl_trigger_enable_5 = exuBlocks_io_fuExtra_csrio_customCtrl_trigger_enable_5; // @[XSCore.scala 418:23]
  assign memBlock_io_csrCtrl_trigger_enable_6 = exuBlocks_io_fuExtra_csrio_customCtrl_trigger_enable_6; // @[XSCore.scala 418:23]
  assign memBlock_io_csrCtrl_trigger_enable_7 = exuBlocks_io_fuExtra_csrio_customCtrl_trigger_enable_7; // @[XSCore.scala 418:23]
  assign memBlock_io_csrCtrl_trigger_enable_8 = exuBlocks_io_fuExtra_csrio_customCtrl_trigger_enable_8; // @[XSCore.scala 418:23]
  assign memBlock_io_csrCtrl_trigger_enable_9 = exuBlocks_io_fuExtra_csrio_customCtrl_trigger_enable_9; // @[XSCore.scala 418:23]
  assign memBlock_io_perfEventsPTW_0_value = ptw_io_perf_0_value; // @[XSCore.scala 373:31]
  assign memBlock_io_perfEventsPTW_1_value = ptw_io_perf_1_value; // @[XSCore.scala 373:31]
  assign memBlock_io_perfEventsPTW_2_value = ptw_io_perf_2_value; // @[XSCore.scala 373:31]
  assign memBlock_io_perfEventsPTW_3_value = ptw_io_perf_3_value; // @[XSCore.scala 373:31]
  assign memBlock_io_perfEventsPTW_4_value = ptw_io_perf_4_value; // @[XSCore.scala 373:31]
  assign memBlock_io_perfEventsPTW_5_value = ptw_io_perf_5_value; // @[XSCore.scala 373:31]
  assign memBlock_io_perfEventsPTW_6_value = ptw_io_perf_6_value; // @[XSCore.scala 373:31]
  assign memBlock_io_perfEventsPTW_7_value = ptw_io_perf_7_value; // @[XSCore.scala 373:31]
  assign memBlock_io_perfEventsPTW_8_value = ptw_io_perf_8_value; // @[XSCore.scala 373:31]
  assign memBlock_io_perfEventsPTW_9_value = ptw_io_perf_9_value; // @[XSCore.scala 373:31]
  assign memBlock_io_perfEventsPTW_10_value = ptw_io_perf_10_value; // @[XSCore.scala 373:31]
  assign memBlock_io_perfEventsPTW_11_value = ptw_io_perf_11_value; // @[XSCore.scala 373:31]
  assign memBlock_io_perfEventsPTW_12_value = ptw_io_perf_12_value; // @[XSCore.scala 373:31]
  assign memBlock_io_perfEventsPTW_13_value = ptw_io_perf_13_value; // @[XSCore.scala 373:31]
  assign memBlock_io_perfEventsPTW_14_value = ptw_io_perf_14_value; // @[XSCore.scala 373:31]
  assign memBlock_io_perfEventsPTW_15_value = ptw_io_perf_15_value; // @[XSCore.scala 373:31]
  assign memBlock_io_perfEventsPTW_16_value = ptw_io_perf_16_value; // @[XSCore.scala 373:31]
  assign memBlock_io_perfEventsPTW_17_value = ptw_io_perf_17_value; // @[XSCore.scala 373:31]
  assign memBlock_io_perfEventsPTW_18_value = ptw_io_perf_18_value; // @[XSCore.scala 373:31]
  assign wb2Ctrl_clock = clock;
  assign wb2Ctrl_reset = reset;
  assign wb2Ctrl_io_redirect_valid = ctrlBlock_io_redirect_valid; // @[XSCore.scala 281:23]
  assign wb2Ctrl_io_redirect_bits_robIdx_flag = ctrlBlock_io_redirect_bits_robIdx_flag; // @[XSCore.scala 281:23]
  assign wb2Ctrl_io_redirect_bits_robIdx_value = ctrlBlock_io_redirect_bits_robIdx_value; // @[XSCore.scala 281:23]
  assign wb2Ctrl_io_redirect_bits_level = ctrlBlock_io_redirect_bits_level; // @[XSCore.scala 281:23]
  assign wb2Ctrl_io_in_3_ready = exuBlocks_io_fuWriteback_3_ready; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_3_valid = exuBlocks_io_fuWriteback_3_valid; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_3_bits_uop_cf_exceptionVec_2 = exuBlocks_io_fuWriteback_3_bits_uop_cf_exceptionVec_2; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_3_bits_uop_cf_exceptionVec_3 = exuBlocks_io_fuWriteback_3_bits_uop_cf_exceptionVec_3; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_3_bits_uop_cf_exceptionVec_8 = exuBlocks_io_fuWriteback_3_bits_uop_cf_exceptionVec_8; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_3_bits_uop_cf_exceptionVec_9 = exuBlocks_io_fuWriteback_3_bits_uop_cf_exceptionVec_9; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_3_bits_uop_cf_exceptionVec_11 = exuBlocks_io_fuWriteback_3_bits_uop_cf_exceptionVec_11; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_3_bits_uop_ctrl_flushPipe = exuBlocks_io_fuWriteback_3_bits_uop_ctrl_flushPipe; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_3_bits_uop_robIdx_flag = exuBlocks_io_fuWriteback_3_bits_uop_robIdx_flag; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_3_bits_uop_robIdx_value = exuBlocks_io_fuWriteback_3_bits_uop_robIdx_value; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_3_bits_fflags = exuBlocks_io_fuWriteback_3_bits_fflags; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_4_ready = exuBlocks_1_io_fuWriteback_0_ready; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_4_valid = exuBlocks_1_io_fuWriteback_0_valid; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_4_bits_uop_robIdx_flag = exuBlocks_1_io_fuWriteback_0_bits_uop_robIdx_flag; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_4_bits_uop_robIdx_value = exuBlocks_1_io_fuWriteback_0_bits_uop_robIdx_value; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_4_bits_fflags = exuBlocks_1_io_fuWriteback_0_bits_fflags; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_5_ready = exuBlocks_1_io_fuWriteback_1_ready; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_5_valid = exuBlocks_1_io_fuWriteback_1_valid; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_5_bits_uop_robIdx_flag = exuBlocks_1_io_fuWriteback_1_bits_uop_robIdx_flag; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_5_bits_uop_robIdx_value = exuBlocks_1_io_fuWriteback_1_bits_uop_robIdx_value; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_5_bits_fflags = exuBlocks_1_io_fuWriteback_1_bits_fflags; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_6_ready = memBlock_io_writeback_0_ready; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_6_valid = memBlock_io_writeback_0_valid; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_6_bits_uop_cf_exceptionVec_4 = memBlock_io_writeback_0_bits_uop_cf_exceptionVec_4; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_6_bits_uop_cf_exceptionVec_5 = memBlock_io_writeback_0_bits_uop_cf_exceptionVec_5; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_6_bits_uop_cf_exceptionVec_13 = memBlock_io_writeback_0_bits_uop_cf_exceptionVec_13; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_6_bits_uop_cf_trigger_backendHit_0 = memBlock_io_writeback_0_bits_uop_cf_trigger_backendHit_0; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_6_bits_uop_cf_trigger_backendHit_1 = memBlock_io_writeback_0_bits_uop_cf_trigger_backendHit_1; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_6_bits_uop_cf_trigger_backendHit_2 = memBlock_io_writeback_0_bits_uop_cf_trigger_backendHit_2; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_6_bits_uop_cf_trigger_backendHit_3 = memBlock_io_writeback_0_bits_uop_cf_trigger_backendHit_3; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_6_bits_uop_cf_trigger_backendHit_4 = memBlock_io_writeback_0_bits_uop_cf_trigger_backendHit_4; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_6_bits_uop_cf_trigger_backendHit_5 = memBlock_io_writeback_0_bits_uop_cf_trigger_backendHit_5; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_6_bits_uop_ctrl_flushPipe = memBlock_io_writeback_0_bits_uop_ctrl_flushPipe; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_6_bits_uop_ctrl_replayInst = memBlock_io_writeback_0_bits_uop_ctrl_replayInst; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_6_bits_uop_robIdx_flag = memBlock_io_writeback_0_bits_uop_robIdx_flag; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_6_bits_uop_robIdx_value = memBlock_io_writeback_0_bits_uop_robIdx_value; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_7_ready = memBlock_io_writeback_1_ready; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_7_valid = memBlock_io_writeback_1_valid; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_7_bits_uop_cf_exceptionVec_4 = memBlock_io_writeback_1_bits_uop_cf_exceptionVec_4; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_7_bits_uop_cf_exceptionVec_5 = memBlock_io_writeback_1_bits_uop_cf_exceptionVec_5; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_7_bits_uop_cf_exceptionVec_13 = memBlock_io_writeback_1_bits_uop_cf_exceptionVec_13; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_7_bits_uop_cf_trigger_backendHit_0 = memBlock_io_writeback_1_bits_uop_cf_trigger_backendHit_0; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_7_bits_uop_cf_trigger_backendHit_1 = memBlock_io_writeback_1_bits_uop_cf_trigger_backendHit_1; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_7_bits_uop_cf_trigger_backendHit_2 = memBlock_io_writeback_1_bits_uop_cf_trigger_backendHit_2; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_7_bits_uop_cf_trigger_backendHit_3 = memBlock_io_writeback_1_bits_uop_cf_trigger_backendHit_3; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_7_bits_uop_cf_trigger_backendHit_4 = memBlock_io_writeback_1_bits_uop_cf_trigger_backendHit_4; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_7_bits_uop_cf_trigger_backendHit_5 = memBlock_io_writeback_1_bits_uop_cf_trigger_backendHit_5; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_7_bits_uop_ctrl_flushPipe = memBlock_io_writeback_1_bits_uop_ctrl_flushPipe; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_7_bits_uop_ctrl_replayInst = memBlock_io_writeback_1_bits_uop_ctrl_replayInst; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_7_bits_uop_robIdx_flag = memBlock_io_writeback_1_bits_uop_robIdx_flag; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_7_bits_uop_robIdx_value = memBlock_io_writeback_1_bits_uop_robIdx_value; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_8_ready = memBlock_io_writeback_2_ready; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_8_valid = memBlock_io_writeback_2_valid; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_8_bits_uop_cf_exceptionVec_4 = memBlock_io_writeback_2_bits_uop_cf_exceptionVec_4; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_8_bits_uop_cf_exceptionVec_5 = memBlock_io_writeback_2_bits_uop_cf_exceptionVec_5; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_8_bits_uop_cf_exceptionVec_6 = memBlock_io_writeback_2_bits_uop_cf_exceptionVec_6; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_8_bits_uop_cf_exceptionVec_7 = memBlock_io_writeback_2_bits_uop_cf_exceptionVec_7; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_8_bits_uop_cf_exceptionVec_13 = memBlock_io_writeback_2_bits_uop_cf_exceptionVec_13; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_8_bits_uop_cf_exceptionVec_15 = memBlock_io_writeback_2_bits_uop_cf_exceptionVec_15; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_8_bits_uop_cf_trigger_backendHit_0 = memBlock_io_writeback_2_bits_uop_cf_trigger_backendHit_0; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_8_bits_uop_cf_trigger_backendHit_1 = memBlock_io_writeback_2_bits_uop_cf_trigger_backendHit_1; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_8_bits_uop_cf_trigger_backendHit_2 = memBlock_io_writeback_2_bits_uop_cf_trigger_backendHit_2; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_8_bits_uop_cf_trigger_backendHit_3 = memBlock_io_writeback_2_bits_uop_cf_trigger_backendHit_3; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_8_bits_uop_cf_trigger_backendHit_4 = memBlock_io_writeback_2_bits_uop_cf_trigger_backendHit_4; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_8_bits_uop_cf_trigger_backendHit_5 = memBlock_io_writeback_2_bits_uop_cf_trigger_backendHit_5; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_8_bits_uop_robIdx_flag = memBlock_io_writeback_2_bits_uop_robIdx_flag; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_8_bits_uop_robIdx_value = memBlock_io_writeback_2_bits_uop_robIdx_value; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_9_ready = memBlock_io_writeback_3_ready; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_9_valid = memBlock_io_writeback_3_valid; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_9_bits_uop_cf_exceptionVec_6 = memBlock_io_writeback_3_bits_uop_cf_exceptionVec_6; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_9_bits_uop_cf_exceptionVec_7 = memBlock_io_writeback_3_bits_uop_cf_exceptionVec_7; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_9_bits_uop_cf_exceptionVec_15 = memBlock_io_writeback_3_bits_uop_cf_exceptionVec_15; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_9_bits_uop_cf_trigger_backendHit_0 = memBlock_io_writeback_3_bits_uop_cf_trigger_backendHit_0; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_9_bits_uop_cf_trigger_backendHit_1 = memBlock_io_writeback_3_bits_uop_cf_trigger_backendHit_1; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_9_bits_uop_cf_trigger_backendHit_4 = memBlock_io_writeback_3_bits_uop_cf_trigger_backendHit_4; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_9_bits_uop_robIdx_flag = memBlock_io_writeback_3_bits_uop_robIdx_flag; // @[WbArbiter.scala 350:18]
  assign wb2Ctrl_io_in_9_bits_uop_robIdx_value = memBlock_io_writeback_3_bits_uop_robIdx_value; // @[WbArbiter.scala 350:18]
  assign ctrlBlock_clock = clock;
  assign ctrlBlock_reset = resetGen_4_o_reset; // @[ResetGen.scala 50:30 53:22]
  assign ctrlBlock_io_hartId = io_hartId[7:0]; // @[XSCore.scala 264:23]
  assign ctrlBlock_io_frontend_cfVec_0_valid = frontend_io_backend_cfVec_0_valid; // @[XSCore.scala 292:23]
  assign ctrlBlock_io_frontend_cfVec_0_bits_instr = frontend_io_backend_cfVec_0_bits_instr; // @[XSCore.scala 292:23]
  assign ctrlBlock_io_frontend_cfVec_0_bits_foldpc = frontend_io_backend_cfVec_0_bits_foldpc; // @[XSCore.scala 292:23]
  assign ctrlBlock_io_frontend_cfVec_0_bits_exceptionVec_1 = frontend_io_backend_cfVec_0_bits_exceptionVec_1; // @[XSCore.scala 292:23]
  assign ctrlBlock_io_frontend_cfVec_0_bits_exceptionVec_12 = frontend_io_backend_cfVec_0_bits_exceptionVec_12; // @[XSCore.scala 292:23]
  assign ctrlBlock_io_frontend_cfVec_0_bits_trigger_frontendHit_0 =
    frontend_io_backend_cfVec_0_bits_trigger_frontendHit_0; // @[XSCore.scala 292:23]
  assign ctrlBlock_io_frontend_cfVec_0_bits_trigger_frontendHit_1 =
    frontend_io_backend_cfVec_0_bits_trigger_frontendHit_1; // @[XSCore.scala 292:23]
  assign ctrlBlock_io_frontend_cfVec_0_bits_trigger_frontendHit_2 =
    frontend_io_backend_cfVec_0_bits_trigger_frontendHit_2; // @[XSCore.scala 292:23]
  assign ctrlBlock_io_frontend_cfVec_0_bits_trigger_frontendHit_3 =
    frontend_io_backend_cfVec_0_bits_trigger_frontendHit_3; // @[XSCore.scala 292:23]
  assign ctrlBlock_io_frontend_cfVec_0_bits_trigger_backendEn_0 = frontend_io_backend_cfVec_0_bits_trigger_backendEn_0; // @[XSCore.scala 292:23]
  assign ctrlBlock_io_frontend_cfVec_0_bits_trigger_backendEn_1 = frontend_io_backend_cfVec_0_bits_trigger_backendEn_1; // @[XSCore.scala 292:23]
  assign ctrlBlock_io_frontend_cfVec_0_bits_pd_isRVC = frontend_io_backend_cfVec_0_bits_pd_isRVC; // @[XSCore.scala 292:23]
  assign ctrlBlock_io_frontend_cfVec_0_bits_pd_brType = frontend_io_backend_cfVec_0_bits_pd_brType; // @[XSCore.scala 292:23]
  assign ctrlBlock_io_frontend_cfVec_0_bits_pd_isCall = frontend_io_backend_cfVec_0_bits_pd_isCall; // @[XSCore.scala 292:23]
  assign ctrlBlock_io_frontend_cfVec_0_bits_pd_isRet = frontend_io_backend_cfVec_0_bits_pd_isRet; // @[XSCore.scala 292:23]
  assign ctrlBlock_io_frontend_cfVec_0_bits_pred_taken = frontend_io_backend_cfVec_0_bits_pred_taken; // @[XSCore.scala 292:23]
  assign ctrlBlock_io_frontend_cfVec_0_bits_crossPageIPFFix = frontend_io_backend_cfVec_0_bits_crossPageIPFFix; // @[XSCore.scala 292:23]
  assign ctrlBlock_io_frontend_cfVec_0_bits_ftqPtr_flag = frontend_io_backend_cfVec_0_bits_ftqPtr_flag; // @[XSCore.scala 292:23]
  assign ctrlBlock_io_frontend_cfVec_0_bits_ftqPtr_value = frontend_io_backend_cfVec_0_bits_ftqPtr_value; // @[XSCore.scala 292:23]
  assign ctrlBlock_io_frontend_cfVec_0_bits_ftqOffset = frontend_io_backend_cfVec_0_bits_ftqOffset; // @[XSCore.scala 292:23]
  assign ctrlBlock_io_frontend_cfVec_1_valid = frontend_io_backend_cfVec_1_valid; // @[XSCore.scala 292:23]
  assign ctrlBlock_io_frontend_cfVec_1_bits_instr = frontend_io_backend_cfVec_1_bits_instr; // @[XSCore.scala 292:23]
  assign ctrlBlock_io_frontend_cfVec_1_bits_foldpc = frontend_io_backend_cfVec_1_bits_foldpc; // @[XSCore.scala 292:23]
  assign ctrlBlock_io_frontend_cfVec_1_bits_exceptionVec_1 = frontend_io_backend_cfVec_1_bits_exceptionVec_1; // @[XSCore.scala 292:23]
  assign ctrlBlock_io_frontend_cfVec_1_bits_exceptionVec_12 = frontend_io_backend_cfVec_1_bits_exceptionVec_12; // @[XSCore.scala 292:23]
  assign ctrlBlock_io_frontend_cfVec_1_bits_trigger_frontendHit_0 =
    frontend_io_backend_cfVec_1_bits_trigger_frontendHit_0; // @[XSCore.scala 292:23]
  assign ctrlBlock_io_frontend_cfVec_1_bits_trigger_frontendHit_1 =
    frontend_io_backend_cfVec_1_bits_trigger_frontendHit_1; // @[XSCore.scala 292:23]
  assign ctrlBlock_io_frontend_cfVec_1_bits_trigger_frontendHit_2 =
    frontend_io_backend_cfVec_1_bits_trigger_frontendHit_2; // @[XSCore.scala 292:23]
  assign ctrlBlock_io_frontend_cfVec_1_bits_trigger_frontendHit_3 =
    frontend_io_backend_cfVec_1_bits_trigger_frontendHit_3; // @[XSCore.scala 292:23]
  assign ctrlBlock_io_frontend_cfVec_1_bits_trigger_backendEn_0 = frontend_io_backend_cfVec_1_bits_trigger_backendEn_0; // @[XSCore.scala 292:23]
  assign ctrlBlock_io_frontend_cfVec_1_bits_trigger_backendEn_1 = frontend_io_backend_cfVec_1_bits_trigger_backendEn_1; // @[XSCore.scala 292:23]
  assign ctrlBlock_io_frontend_cfVec_1_bits_pd_isRVC = frontend_io_backend_cfVec_1_bits_pd_isRVC; // @[XSCore.scala 292:23]
  assign ctrlBlock_io_frontend_cfVec_1_bits_pd_brType = frontend_io_backend_cfVec_1_bits_pd_brType; // @[XSCore.scala 292:23]
  assign ctrlBlock_io_frontend_cfVec_1_bits_pd_isCall = frontend_io_backend_cfVec_1_bits_pd_isCall; // @[XSCore.scala 292:23]
  assign ctrlBlock_io_frontend_cfVec_1_bits_pd_isRet = frontend_io_backend_cfVec_1_bits_pd_isRet; // @[XSCore.scala 292:23]
  assign ctrlBlock_io_frontend_cfVec_1_bits_pred_taken = frontend_io_backend_cfVec_1_bits_pred_taken; // @[XSCore.scala 292:23]
  assign ctrlBlock_io_frontend_cfVec_1_bits_crossPageIPFFix = frontend_io_backend_cfVec_1_bits_crossPageIPFFix; // @[XSCore.scala 292:23]
  assign ctrlBlock_io_frontend_cfVec_1_bits_ftqPtr_flag = frontend_io_backend_cfVec_1_bits_ftqPtr_flag; // @[XSCore.scala 292:23]
  assign ctrlBlock_io_frontend_cfVec_1_bits_ftqPtr_value = frontend_io_backend_cfVec_1_bits_ftqPtr_value; // @[XSCore.scala 292:23]
  assign ctrlBlock_io_frontend_cfVec_1_bits_ftqOffset = frontend_io_backend_cfVec_1_bits_ftqOffset; // @[XSCore.scala 292:23]
  assign ctrlBlock_io_frontend_fromFtq_pc_mem_wen = frontend_io_backend_fromFtq_pc_mem_wen; // @[XSCore.scala 292:23]
  assign ctrlBlock_io_frontend_fromFtq_pc_mem_waddr = frontend_io_backend_fromFtq_pc_mem_waddr; // @[XSCore.scala 292:23]
  assign ctrlBlock_io_frontend_fromFtq_pc_mem_wdata_startAddr = frontend_io_backend_fromFtq_pc_mem_wdata_startAddr; // @[XSCore.scala 292:23]
  assign ctrlBlock_io_frontend_fromFtq_pc_mem_wdata_nextLineAddr = frontend_io_backend_fromFtq_pc_mem_wdata_nextLineAddr
    ; // @[XSCore.scala 292:23]
  assign ctrlBlock_io_frontend_fromFtq_pc_mem_wdata_isNextMask_0 = frontend_io_backend_fromFtq_pc_mem_wdata_isNextMask_0
    ; // @[XSCore.scala 292:23]
  assign ctrlBlock_io_frontend_fromFtq_pc_mem_wdata_isNextMask_1 = frontend_io_backend_fromFtq_pc_mem_wdata_isNextMask_1
    ; // @[XSCore.scala 292:23]
  assign ctrlBlock_io_frontend_fromFtq_pc_mem_wdata_isNextMask_2 = frontend_io_backend_fromFtq_pc_mem_wdata_isNextMask_2
    ; // @[XSCore.scala 292:23]
  assign ctrlBlock_io_frontend_fromFtq_pc_mem_wdata_isNextMask_3 = frontend_io_backend_fromFtq_pc_mem_wdata_isNextMask_3
    ; // @[XSCore.scala 292:23]
  assign ctrlBlock_io_frontend_fromFtq_pc_mem_wdata_isNextMask_4 = frontend_io_backend_fromFtq_pc_mem_wdata_isNextMask_4
    ; // @[XSCore.scala 292:23]
  assign ctrlBlock_io_frontend_fromFtq_pc_mem_wdata_isNextMask_5 = frontend_io_backend_fromFtq_pc_mem_wdata_isNextMask_5
    ; // @[XSCore.scala 292:23]
  assign ctrlBlock_io_frontend_fromFtq_pc_mem_wdata_isNextMask_6 = frontend_io_backend_fromFtq_pc_mem_wdata_isNextMask_6
    ; // @[XSCore.scala 292:23]
  assign ctrlBlock_io_frontend_fromFtq_pc_mem_wdata_isNextMask_7 = frontend_io_backend_fromFtq_pc_mem_wdata_isNextMask_7
    ; // @[XSCore.scala 292:23]
  assign ctrlBlock_io_frontend_fromFtq_newest_entry_target = frontend_io_backend_fromFtq_newest_entry_target; // @[XSCore.scala 292:23]
  assign ctrlBlock_io_frontend_fromFtq_newest_entry_ptr_flag = frontend_io_backend_fromFtq_newest_entry_ptr_flag; // @[XSCore.scala 292:23]
  assign ctrlBlock_io_frontend_fromFtq_newest_entry_ptr_value = frontend_io_backend_fromFtq_newest_entry_ptr_value; // @[XSCore.scala 292:23]
  assign ctrlBlock_io_rsReady_0 = exuBlocks_io_scheExtra_rsReady_0; // @[XSCore.scala 322:24]
  assign ctrlBlock_io_rsReady_1 = exuBlocks_io_scheExtra_rsReady_1; // @[XSCore.scala 322:24]
  assign ctrlBlock_io_rsReady_2 = exuBlocks_io_scheExtra_rsReady_2; // @[XSCore.scala 322:24]
  assign ctrlBlock_io_rsReady_3 = exuBlocks_io_scheExtra_rsReady_3; // @[XSCore.scala 322:24]
  assign ctrlBlock_io_rsReady_4 = exuBlocks_io_scheExtra_rsReady_4; // @[XSCore.scala 322:24]
  assign ctrlBlock_io_rsReady_5 = exuBlocks_io_scheExtra_rsReady_5; // @[XSCore.scala 322:24]
  assign ctrlBlock_io_rsReady_6 = exuBlocks_io_scheExtra_rsReady_6; // @[XSCore.scala 322:24]
  assign ctrlBlock_io_rsReady_7 = exuBlocks_io_scheExtra_rsReady_7; // @[XSCore.scala 322:24]
  assign ctrlBlock_io_rsReady_8 = exuBlocks_1_io_scheExtra_rsReady_0; // @[XSCore.scala 322:24]
  assign ctrlBlock_io_lqCancelCnt = memBlock_io_lqCancelCnt; // @[XSCore.scala 326:28]
  assign ctrlBlock_io_sqCancelCnt = memBlock_io_sqCancelCnt; // @[XSCore.scala 327:28]
  assign ctrlBlock_io_lqDeq = memBlock_io_lqDeq; // @[XSCore.scala 324:22]
  assign ctrlBlock_io_sqDeq = memBlock_io_sqDeq; // @[XSCore.scala 325:22]
  assign ctrlBlock_io_exuRedirect_0_valid = exuBlocks_io_fuExtra_exuRedirect_0_valid; // @[XSCore.scala 300:28]
  assign ctrlBlock_io_exuRedirect_0_bits_uop_cf_pd_isRVC = exuBlocks_io_fuExtra_exuRedirect_0_bits_uop_cf_pd_isRVC; // @[XSCore.scala 300:28]
  assign ctrlBlock_io_exuRedirect_0_bits_uop_cf_pd_brType = exuBlocks_io_fuExtra_exuRedirect_0_bits_uop_cf_pd_brType; // @[XSCore.scala 300:28]
  assign ctrlBlock_io_exuRedirect_0_bits_uop_cf_pd_isCall = exuBlocks_io_fuExtra_exuRedirect_0_bits_uop_cf_pd_isCall; // @[XSCore.scala 300:28]
  assign ctrlBlock_io_exuRedirect_0_bits_uop_cf_pd_isRet = exuBlocks_io_fuExtra_exuRedirect_0_bits_uop_cf_pd_isRet; // @[XSCore.scala 300:28]
  assign ctrlBlock_io_exuRedirect_0_bits_uop_ctrl_imm = exuBlocks_io_fuExtra_exuRedirect_0_bits_uop_ctrl_imm; // @[XSCore.scala 300:28]
  assign ctrlBlock_io_exuRedirect_0_bits_uop_robIdx_flag = exuBlocks_io_fuExtra_exuRedirect_0_bits_uop_robIdx_flag; // @[XSCore.scala 300:28]
  assign ctrlBlock_io_exuRedirect_0_bits_uop_robIdx_value = exuBlocks_io_fuExtra_exuRedirect_0_bits_uop_robIdx_value; // @[XSCore.scala 300:28]
  assign ctrlBlock_io_exuRedirect_0_bits_redirectValid = exuBlocks_io_fuExtra_exuRedirect_0_bits_redirectValid; // @[XSCore.scala 300:28]
  assign ctrlBlock_io_exuRedirect_0_bits_redirect_robIdx_flag =
    exuBlocks_io_fuExtra_exuRedirect_0_bits_redirect_robIdx_flag; // @[XSCore.scala 300:28]
  assign ctrlBlock_io_exuRedirect_0_bits_redirect_robIdx_value =
    exuBlocks_io_fuExtra_exuRedirect_0_bits_redirect_robIdx_value; // @[XSCore.scala 300:28]
  assign ctrlBlock_io_exuRedirect_0_bits_redirect_ftqIdx_flag =
    exuBlocks_io_fuExtra_exuRedirect_0_bits_redirect_ftqIdx_flag; // @[XSCore.scala 300:28]
  assign ctrlBlock_io_exuRedirect_0_bits_redirect_ftqIdx_value =
    exuBlocks_io_fuExtra_exuRedirect_0_bits_redirect_ftqIdx_value; // @[XSCore.scala 300:28]
  assign ctrlBlock_io_exuRedirect_0_bits_redirect_ftqOffset = exuBlocks_io_fuExtra_exuRedirect_0_bits_redirect_ftqOffset
    ; // @[XSCore.scala 300:28]
  assign ctrlBlock_io_exuRedirect_0_bits_redirect_cfiUpdate_target =
    exuBlocks_io_fuExtra_exuRedirect_0_bits_redirect_cfiUpdate_target; // @[XSCore.scala 300:28]
  assign ctrlBlock_io_exuRedirect_0_bits_redirect_cfiUpdate_isMisPred =
    exuBlocks_io_fuExtra_exuRedirect_0_bits_redirect_cfiUpdate_isMisPred; // @[XSCore.scala 300:28]
  assign ctrlBlock_io_exuRedirect_1_valid = exuBlocks_io_fuExtra_exuRedirect_1_valid; // @[XSCore.scala 300:28]
  assign ctrlBlock_io_exuRedirect_1_bits_uop_cf_pd_isRVC = exuBlocks_io_fuExtra_exuRedirect_1_bits_uop_cf_pd_isRVC; // @[XSCore.scala 300:28]
  assign ctrlBlock_io_exuRedirect_1_bits_uop_cf_pd_brType = exuBlocks_io_fuExtra_exuRedirect_1_bits_uop_cf_pd_brType; // @[XSCore.scala 300:28]
  assign ctrlBlock_io_exuRedirect_1_bits_uop_cf_pd_isCall = exuBlocks_io_fuExtra_exuRedirect_1_bits_uop_cf_pd_isCall; // @[XSCore.scala 300:28]
  assign ctrlBlock_io_exuRedirect_1_bits_uop_cf_pd_isRet = exuBlocks_io_fuExtra_exuRedirect_1_bits_uop_cf_pd_isRet; // @[XSCore.scala 300:28]
  assign ctrlBlock_io_exuRedirect_1_bits_uop_ctrl_imm = exuBlocks_io_fuExtra_exuRedirect_1_bits_uop_ctrl_imm; // @[XSCore.scala 300:28]
  assign ctrlBlock_io_exuRedirect_1_bits_uop_robIdx_flag = exuBlocks_io_fuExtra_exuRedirect_1_bits_uop_robIdx_flag; // @[XSCore.scala 300:28]
  assign ctrlBlock_io_exuRedirect_1_bits_uop_robIdx_value = exuBlocks_io_fuExtra_exuRedirect_1_bits_uop_robIdx_value; // @[XSCore.scala 300:28]
  assign ctrlBlock_io_exuRedirect_1_bits_redirectValid = exuBlocks_io_fuExtra_exuRedirect_1_bits_redirectValid; // @[XSCore.scala 300:28]
  assign ctrlBlock_io_exuRedirect_1_bits_redirect_robIdx_flag =
    exuBlocks_io_fuExtra_exuRedirect_1_bits_redirect_robIdx_flag; // @[XSCore.scala 300:28]
  assign ctrlBlock_io_exuRedirect_1_bits_redirect_robIdx_value =
    exuBlocks_io_fuExtra_exuRedirect_1_bits_redirect_robIdx_value; // @[XSCore.scala 300:28]
  assign ctrlBlock_io_exuRedirect_1_bits_redirect_ftqIdx_flag =
    exuBlocks_io_fuExtra_exuRedirect_1_bits_redirect_ftqIdx_flag; // @[XSCore.scala 300:28]
  assign ctrlBlock_io_exuRedirect_1_bits_redirect_ftqIdx_value =
    exuBlocks_io_fuExtra_exuRedirect_1_bits_redirect_ftqIdx_value; // @[XSCore.scala 300:28]
  assign ctrlBlock_io_exuRedirect_1_bits_redirect_ftqOffset = exuBlocks_io_fuExtra_exuRedirect_1_bits_redirect_ftqOffset
    ; // @[XSCore.scala 300:28]
  assign ctrlBlock_io_exuRedirect_1_bits_redirect_cfiUpdate_taken =
    exuBlocks_io_fuExtra_exuRedirect_1_bits_redirect_cfiUpdate_taken; // @[XSCore.scala 300:28]
  assign ctrlBlock_io_exuRedirect_1_bits_redirect_cfiUpdate_isMisPred =
    exuBlocks_io_fuExtra_exuRedirect_1_bits_redirect_cfiUpdate_isMisPred; // @[XSCore.scala 300:28]
  assign ctrlBlock_io_exuRedirect_2_valid = exuBlocks_io_fuExtra_exuRedirect_2_valid; // @[XSCore.scala 300:28]
  assign ctrlBlock_io_exuRedirect_2_bits_uop_cf_pd_isRVC = exuBlocks_io_fuExtra_exuRedirect_2_bits_uop_cf_pd_isRVC; // @[XSCore.scala 300:28]
  assign ctrlBlock_io_exuRedirect_2_bits_uop_cf_pd_brType = exuBlocks_io_fuExtra_exuRedirect_2_bits_uop_cf_pd_brType; // @[XSCore.scala 300:28]
  assign ctrlBlock_io_exuRedirect_2_bits_uop_cf_pd_isCall = exuBlocks_io_fuExtra_exuRedirect_2_bits_uop_cf_pd_isCall; // @[XSCore.scala 300:28]
  assign ctrlBlock_io_exuRedirect_2_bits_uop_cf_pd_isRet = exuBlocks_io_fuExtra_exuRedirect_2_bits_uop_cf_pd_isRet; // @[XSCore.scala 300:28]
  assign ctrlBlock_io_exuRedirect_2_bits_uop_ctrl_imm = exuBlocks_io_fuExtra_exuRedirect_2_bits_uop_ctrl_imm; // @[XSCore.scala 300:28]
  assign ctrlBlock_io_exuRedirect_2_bits_uop_robIdx_flag = exuBlocks_io_fuExtra_exuRedirect_2_bits_uop_robIdx_flag; // @[XSCore.scala 300:28]
  assign ctrlBlock_io_exuRedirect_2_bits_uop_robIdx_value = exuBlocks_io_fuExtra_exuRedirect_2_bits_uop_robIdx_value; // @[XSCore.scala 300:28]
  assign ctrlBlock_io_exuRedirect_2_bits_redirectValid = exuBlocks_io_fuExtra_exuRedirect_2_bits_redirectValid; // @[XSCore.scala 300:28]
  assign ctrlBlock_io_exuRedirect_2_bits_redirect_robIdx_flag =
    exuBlocks_io_fuExtra_exuRedirect_2_bits_redirect_robIdx_flag; // @[XSCore.scala 300:28]
  assign ctrlBlock_io_exuRedirect_2_bits_redirect_robIdx_value =
    exuBlocks_io_fuExtra_exuRedirect_2_bits_redirect_robIdx_value; // @[XSCore.scala 300:28]
  assign ctrlBlock_io_exuRedirect_2_bits_redirect_ftqIdx_flag =
    exuBlocks_io_fuExtra_exuRedirect_2_bits_redirect_ftqIdx_flag; // @[XSCore.scala 300:28]
  assign ctrlBlock_io_exuRedirect_2_bits_redirect_ftqIdx_value =
    exuBlocks_io_fuExtra_exuRedirect_2_bits_redirect_ftqIdx_value; // @[XSCore.scala 300:28]
  assign ctrlBlock_io_exuRedirect_2_bits_redirect_ftqOffset = exuBlocks_io_fuExtra_exuRedirect_2_bits_redirect_ftqOffset
    ; // @[XSCore.scala 300:28]
  assign ctrlBlock_io_exuRedirect_2_bits_redirect_cfiUpdate_taken =
    exuBlocks_io_fuExtra_exuRedirect_2_bits_redirect_cfiUpdate_taken; // @[XSCore.scala 300:28]
  assign ctrlBlock_io_exuRedirect_2_bits_redirect_cfiUpdate_isMisPred =
    exuBlocks_io_fuExtra_exuRedirect_2_bits_redirect_cfiUpdate_isMisPred; // @[XSCore.scala 300:28]
  assign ctrlBlock_io_stIn_0_valid = memBlock_io_stIn_0_valid; // @[XSCore.scala 301:21]
  assign ctrlBlock_io_stIn_0_bits_uop_cf_storeSetHit = memBlock_io_stIn_0_bits_uop_cf_storeSetHit; // @[XSCore.scala 301:21]
  assign ctrlBlock_io_stIn_0_bits_uop_cf_ssid = memBlock_io_stIn_0_bits_uop_cf_ssid; // @[XSCore.scala 301:21]
  assign ctrlBlock_io_stIn_0_bits_uop_robIdx_value = memBlock_io_stIn_0_bits_uop_robIdx_value; // @[XSCore.scala 301:21]
  assign ctrlBlock_io_stIn_1_valid = memBlock_io_stIn_1_valid; // @[XSCore.scala 301:21]
  assign ctrlBlock_io_stIn_1_bits_uop_cf_storeSetHit = memBlock_io_stIn_1_bits_uop_cf_storeSetHit; // @[XSCore.scala 301:21]
  assign ctrlBlock_io_stIn_1_bits_uop_cf_ssid = memBlock_io_stIn_1_bits_uop_cf_ssid; // @[XSCore.scala 301:21]
  assign ctrlBlock_io_stIn_1_bits_uop_robIdx_value = memBlock_io_stIn_1_bits_uop_robIdx_value; // @[XSCore.scala 301:21]
  assign ctrlBlock_io_memoryViolation_valid = memBlock_io_memoryViolation_valid; // @[XSCore.scala 302:32]
  assign ctrlBlock_io_memoryViolation_bits_robIdx_flag = memBlock_io_memoryViolation_bits_robIdx_flag; // @[XSCore.scala 302:32]
  assign ctrlBlock_io_memoryViolation_bits_robIdx_value = memBlock_io_memoryViolation_bits_robIdx_value; // @[XSCore.scala 302:32]
  assign ctrlBlock_io_memoryViolation_bits_ftqIdx_flag = memBlock_io_memoryViolation_bits_ftqIdx_flag; // @[XSCore.scala 302:32]
  assign ctrlBlock_io_memoryViolation_bits_ftqIdx_value = memBlock_io_memoryViolation_bits_ftqIdx_value; // @[XSCore.scala 302:32]
  assign ctrlBlock_io_memoryViolation_bits_ftqOffset = memBlock_io_memoryViolation_bits_ftqOffset; // @[XSCore.scala 302:32]
  assign ctrlBlock_io_memoryViolation_bits_stFtqIdx_value = memBlock_io_memoryViolation_bits_stFtqIdx_value; // @[XSCore.scala 302:32]
  assign ctrlBlock_io_memoryViolation_bits_stFtqOffset = memBlock_io_memoryViolation_bits_stFtqOffset; // @[XSCore.scala 302:32]
  assign ctrlBlock_io_robio_toCSR_intrBitSet = exuBlocks_io_fuExtra_csrio_interrupt; // @[XSCore.scala 398:21]
  assign ctrlBlock_io_robio_toCSR_trapTarget = exuBlocks_io_fuExtra_csrio_trapTarget; // @[XSCore.scala 397:22]
  assign ctrlBlock_io_robio_toCSR_isXRet = exuBlocks_io_fuExtra_csrio_isXRet; // @[XSCore.scala 396:18]
  assign ctrlBlock_io_robio_toCSR_wfiEvent = exuBlocks_io_fuExtra_csrio_wfi_event; // @[XSCore.scala 399:21]
  assign ctrlBlock_io_robio_lsq_isMMIO_0 = memBlock_io_lsqio_rob_isMMIO_0; // @[XSCore.scala 420:25]
  assign ctrlBlock_io_robio_lsq_isMMIO_1 = memBlock_io_lsqio_rob_isMMIO_1; // @[XSCore.scala 420:25]
  assign ctrlBlock_io_robio_lsq_uop_0_robIdx_value = memBlock_io_lsqio_rob_uop_0_robIdx_value; // @[XSCore.scala 420:25]
  assign ctrlBlock_io_robio_lsq_uop_1_robIdx_value = memBlock_io_lsqio_rob_uop_1_robIdx_value; // @[XSCore.scala 420:25]
  assign ctrlBlock_io_csrCtrl_lvpred_disable = exuBlocks_io_fuExtra_csrio_customCtrl_lvpred_disable; // @[XSCore.scala 298:24]
  assign ctrlBlock_io_csrCtrl_no_spec_load = exuBlocks_io_fuExtra_csrio_customCtrl_no_spec_load; // @[XSCore.scala 298:24]
  assign ctrlBlock_io_csrCtrl_storeset_wait_store = exuBlocks_io_fuExtra_csrio_customCtrl_storeset_wait_store; // @[XSCore.scala 298:24]
  assign ctrlBlock_io_csrCtrl_lvpred_timeout = exuBlocks_io_fuExtra_csrio_customCtrl_lvpred_timeout; // @[XSCore.scala 298:24]
  assign ctrlBlock_io_csrCtrl_fusion_enable = exuBlocks_io_fuExtra_csrio_customCtrl_fusion_enable; // @[XSCore.scala 298:24]
  assign ctrlBlock_io_csrCtrl_wfi_enable = exuBlocks_io_fuExtra_csrio_customCtrl_wfi_enable; // @[XSCore.scala 298:24]
  assign ctrlBlock_io_csrCtrl_svinval_enable = exuBlocks_io_fuExtra_csrio_customCtrl_svinval_enable; // @[XSCore.scala 298:24]
  assign ctrlBlock_io_csrCtrl_distribute_csr_wvalid = exuBlocks_io_fuExtra_csrio_customCtrl_distribute_csr_wvalid; // @[XSCore.scala 298:24]
  assign ctrlBlock_io_csrCtrl_distribute_csr_waddr =
    exuBlocks_io_fuExtra_csrio_customCtrl_distribute_csr_waddr; // @[XSCore.scala 298:24]
  assign ctrlBlock_io_csrCtrl_distribute_csr_wdata =
    exuBlocks_io_fuExtra_csrio_customCtrl_distribute_csr_wdata; // @[XSCore.scala 298:24]
  assign ctrlBlock_io_csrCtrl_singlestep = exuBlocks_io_fuExtra_csrio_customCtrl_singlestep; // @[XSCore.scala 298:24]
  assign ctrlBlock_io_writeback_1_0_valid = wbArbiter_io_out_0_valid; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_0_bits_uop_robIdx_flag = wbArbiter_io_out_0_bits_uop_robIdx_flag; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_0_bits_uop_robIdx_value = wbArbiter_io_out_0_bits_uop_robIdx_value; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_0_bits_redirectValid = wbArbiter_io_out_0_bits_redirectValid; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_0_bits_redirect_cfiUpdate_isMisPred =
    wbArbiter_io_out_0_bits_redirect_cfiUpdate_isMisPred; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_1_valid = wbArbiter_io_out_1_valid; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_1_bits_uop_robIdx_flag = wbArbiter_io_out_1_bits_uop_robIdx_flag; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_1_bits_uop_robIdx_value = wbArbiter_io_out_1_bits_uop_robIdx_value; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_1_bits_redirectValid = wbArbiter_io_out_1_bits_redirectValid; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_1_bits_redirect_cfiUpdate_isMisPred =
    wbArbiter_io_out_1_bits_redirect_cfiUpdate_isMisPred; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_2_valid = wbArbiter_io_in_6_valid; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_1_2_bits_uop_cf_exceptionVec_4 = wbArbiter_io_out_2_bits_uop_cf_exceptionVec_4; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_2_bits_uop_cf_exceptionVec_5 = wbArbiter_io_out_2_bits_uop_cf_exceptionVec_5; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_2_bits_uop_cf_exceptionVec_13 = wbArbiter_io_out_2_bits_uop_cf_exceptionVec_13; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_2_bits_uop_cf_trigger_backendHit_0 =
    wbArbiter_io_out_2_bits_uop_cf_trigger_backendHit_0; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_2_bits_uop_cf_trigger_backendHit_1 =
    wbArbiter_io_out_2_bits_uop_cf_trigger_backendHit_1; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_2_bits_uop_cf_trigger_backendHit_2 =
    wbArbiter_io_out_2_bits_uop_cf_trigger_backendHit_2; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_2_bits_uop_cf_trigger_backendHit_3 =
    wbArbiter_io_out_2_bits_uop_cf_trigger_backendHit_3; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_2_bits_uop_cf_trigger_backendHit_4 =
    wbArbiter_io_out_2_bits_uop_cf_trigger_backendHit_4; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_2_bits_uop_cf_trigger_backendHit_5 =
    wbArbiter_io_out_2_bits_uop_cf_trigger_backendHit_5; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_2_bits_uop_ctrl_flushPipe = wbArbiter_io_out_2_bits_uop_ctrl_flushPipe; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_2_bits_uop_ctrl_replayInst = wbArbiter_io_out_2_bits_uop_ctrl_replayInst; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_2_bits_uop_robIdx_flag = wbArbiter_io_out_2_bits_uop_robIdx_flag; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_2_bits_uop_robIdx_value = wbArbiter_io_out_2_bits_uop_robIdx_value; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_2_bits_debug_isMMIO = wbArbiter_io_out_2_bits_debug_isMMIO; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_3_valid = wbArbiter_io_in_7_valid; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_1_3_bits_uop_cf_exceptionVec_4 = wbArbiter_io_out_3_bits_uop_cf_exceptionVec_4; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_3_bits_uop_cf_exceptionVec_5 = wbArbiter_io_out_3_bits_uop_cf_exceptionVec_5; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_3_bits_uop_cf_exceptionVec_13 = wbArbiter_io_out_3_bits_uop_cf_exceptionVec_13; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_3_bits_uop_cf_trigger_backendHit_0 =
    wbArbiter_io_out_3_bits_uop_cf_trigger_backendHit_0; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_3_bits_uop_cf_trigger_backendHit_1 =
    wbArbiter_io_out_3_bits_uop_cf_trigger_backendHit_1; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_3_bits_uop_cf_trigger_backendHit_2 =
    wbArbiter_io_out_3_bits_uop_cf_trigger_backendHit_2; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_3_bits_uop_cf_trigger_backendHit_3 =
    wbArbiter_io_out_3_bits_uop_cf_trigger_backendHit_3; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_3_bits_uop_cf_trigger_backendHit_4 =
    wbArbiter_io_out_3_bits_uop_cf_trigger_backendHit_4; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_3_bits_uop_cf_trigger_backendHit_5 =
    wbArbiter_io_out_3_bits_uop_cf_trigger_backendHit_5; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_3_bits_uop_ctrl_flushPipe = wbArbiter_io_out_3_bits_uop_ctrl_flushPipe; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_3_bits_uop_ctrl_replayInst = wbArbiter_io_out_3_bits_uop_ctrl_replayInst; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_3_bits_uop_robIdx_flag = wbArbiter_io_out_3_bits_uop_robIdx_flag; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_3_bits_uop_robIdx_value = wbArbiter_io_out_3_bits_uop_robIdx_value; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_3_bits_debug_isMMIO = wbArbiter_io_out_3_bits_debug_isMMIO; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_4_valid = wbArbiter_io_out_4_valid; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_4_bits_uop_cf_exceptionVec_2 = wbArbiter_io_out_4_bits_uop_cf_exceptionVec_2; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_4_bits_uop_cf_exceptionVec_3 = wbArbiter_io_out_4_bits_uop_cf_exceptionVec_3; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_4_bits_uop_cf_exceptionVec_8 = wbArbiter_io_out_4_bits_uop_cf_exceptionVec_8; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_4_bits_uop_cf_exceptionVec_9 = wbArbiter_io_out_4_bits_uop_cf_exceptionVec_9; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_4_bits_uop_cf_exceptionVec_11 = wbArbiter_io_out_4_bits_uop_cf_exceptionVec_11; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_4_bits_uop_ctrl_flushPipe = wbArbiter_io_out_4_bits_uop_ctrl_flushPipe; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_4_bits_uop_robIdx_flag = wbArbiter_io_out_4_bits_uop_robIdx_flag; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_4_bits_uop_robIdx_value = wbArbiter_io_out_4_bits_uop_robIdx_value; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_4_bits_redirectValid = wbArbiter_io_out_4_bits_redirectValid; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_4_bits_redirect_cfiUpdate_isMisPred =
    wbArbiter_io_out_4_bits_redirect_cfiUpdate_isMisPred; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_4_bits_debug_isPerfCnt = wbArbiter_io_out_4_bits_debug_isPerfCnt; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_5_valid = wbArbiter_io_out_5_valid; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_5_bits_uop_cf_trigger_backendHit_0 =
    wbArbiter_io_out_5_bits_uop_cf_trigger_backendHit_0; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_5_bits_uop_cf_trigger_backendHit_1 =
    wbArbiter_io_out_5_bits_uop_cf_trigger_backendHit_1; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_5_bits_uop_cf_trigger_backendHit_2 =
    wbArbiter_io_out_5_bits_uop_cf_trigger_backendHit_2; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_5_bits_uop_cf_trigger_backendHit_3 =
    wbArbiter_io_out_5_bits_uop_cf_trigger_backendHit_3; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_5_bits_uop_cf_trigger_backendHit_4 =
    wbArbiter_io_out_5_bits_uop_cf_trigger_backendHit_4; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_5_bits_uop_cf_trigger_backendHit_5 =
    wbArbiter_io_out_5_bits_uop_cf_trigger_backendHit_5; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_5_bits_uop_robIdx_flag = wbArbiter_io_out_5_bits_uop_robIdx_flag; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_5_bits_uop_robIdx_value = wbArbiter_io_out_5_bits_uop_robIdx_value; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_6_valid = wbArbiter_io_out_8_valid; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_6_bits_uop_cf_exceptionVec_2 = wbArbiter_io_out_8_bits_uop_cf_exceptionVec_2; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_6_bits_uop_cf_exceptionVec_3 = wbArbiter_io_out_8_bits_uop_cf_exceptionVec_3; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_6_bits_uop_cf_exceptionVec_8 = wbArbiter_io_out_8_bits_uop_cf_exceptionVec_8; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_6_bits_uop_cf_exceptionVec_9 = wbArbiter_io_out_8_bits_uop_cf_exceptionVec_9; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_6_bits_uop_cf_exceptionVec_11 = wbArbiter_io_out_8_bits_uop_cf_exceptionVec_11; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_6_bits_uop_ctrl_flushPipe = wbArbiter_io_out_8_bits_uop_ctrl_flushPipe; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_6_bits_uop_robIdx_flag = wbArbiter_io_out_8_bits_uop_robIdx_flag; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_6_bits_uop_robIdx_value = wbArbiter_io_out_8_bits_uop_robIdx_value; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_6_bits_redirectValid = wbArbiter_io_out_8_bits_redirectValid; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_6_bits_redirect_cfiUpdate_isMisPred =
    wbArbiter_io_out_8_bits_redirect_cfiUpdate_isMisPred; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_6_bits_debug_isPerfCnt = wbArbiter_io_out_8_bits_debug_isPerfCnt; // @[WbArbiter.scala 285:{39,39}]
  assign ctrlBlock_io_writeback_1_7_valid = wbArbiter_io_in_8_valid; // @[Scheduler.scala 109:17 110:13]
  assign ctrlBlock_io_writeback_1_7_bits_uop_cf_exceptionVec_4 = wbArbiter_io_in_8_bits_uop_cf_exceptionVec_4; // @[Scheduler.scala 109:17 111:12]
  assign ctrlBlock_io_writeback_1_7_bits_uop_cf_exceptionVec_5 = wbArbiter_io_in_8_bits_uop_cf_exceptionVec_5; // @[Scheduler.scala 109:17 111:12]
  assign ctrlBlock_io_writeback_1_7_bits_uop_cf_exceptionVec_6 = wbArbiter_io_in_8_bits_uop_cf_exceptionVec_6; // @[Scheduler.scala 109:17 111:12]
  assign ctrlBlock_io_writeback_1_7_bits_uop_cf_exceptionVec_7 = wbArbiter_io_in_8_bits_uop_cf_exceptionVec_7; // @[Scheduler.scala 109:17 111:12]
  assign ctrlBlock_io_writeback_1_7_bits_uop_cf_exceptionVec_13 = wbArbiter_io_in_8_bits_uop_cf_exceptionVec_13; // @[Scheduler.scala 109:17 111:12]
  assign ctrlBlock_io_writeback_1_7_bits_uop_cf_exceptionVec_15 = wbArbiter_io_in_8_bits_uop_cf_exceptionVec_15; // @[Scheduler.scala 109:17 111:12]
  assign ctrlBlock_io_writeback_1_7_bits_uop_cf_trigger_backendHit_0 =
    wbArbiter_io_in_8_bits_uop_cf_trigger_backendHit_0; // @[Scheduler.scala 109:17 111:12]
  assign ctrlBlock_io_writeback_1_7_bits_uop_cf_trigger_backendHit_1 =
    wbArbiter_io_in_8_bits_uop_cf_trigger_backendHit_1; // @[Scheduler.scala 109:17 111:12]
  assign ctrlBlock_io_writeback_1_7_bits_uop_cf_trigger_backendHit_2 =
    wbArbiter_io_in_8_bits_uop_cf_trigger_backendHit_2; // @[Scheduler.scala 109:17 111:12]
  assign ctrlBlock_io_writeback_1_7_bits_uop_cf_trigger_backendHit_3 =
    wbArbiter_io_in_8_bits_uop_cf_trigger_backendHit_3; // @[Scheduler.scala 109:17 111:12]
  assign ctrlBlock_io_writeback_1_7_bits_uop_cf_trigger_backendHit_4 =
    wbArbiter_io_in_8_bits_uop_cf_trigger_backendHit_4; // @[Scheduler.scala 109:17 111:12]
  assign ctrlBlock_io_writeback_1_7_bits_uop_cf_trigger_backendHit_5 =
    wbArbiter_io_in_8_bits_uop_cf_trigger_backendHit_5; // @[Scheduler.scala 109:17 111:12]
  assign ctrlBlock_io_writeback_1_7_bits_uop_robIdx_flag = wbArbiter_io_in_8_bits_uop_robIdx_flag; // @[Scheduler.scala 109:17 111:12]
  assign ctrlBlock_io_writeback_1_7_bits_uop_robIdx_value = wbArbiter_io_in_8_bits_uop_robIdx_value; // @[Scheduler.scala 109:17 111:12]
  assign ctrlBlock_io_writeback_1_7_bits_redirectValid = wbArbiter_io_in_8_bits_redirectValid; // @[Scheduler.scala 109:17 111:12]
  assign ctrlBlock_io_writeback_1_7_bits_redirect_cfiUpdate_isMisPred =
    wbArbiter_io_in_8_bits_redirect_cfiUpdate_isMisPred; // @[Scheduler.scala 109:17 111:12]
  assign ctrlBlock_io_writeback_1_7_bits_debug_isMMIO = wbArbiter_io_in_8_bits_debug_isMMIO; // @[Scheduler.scala 109:17 111:12]
  assign ctrlBlock_io_writeback_1_7_bits_debug_isPerfCnt = wbArbiter_io_in_8_bits_debug_isPerfCnt; // @[Scheduler.scala 109:17 111:12]
  assign ctrlBlock_io_writeback_1_8_valid = wbArbiter_io_in_9_valid; // @[Scheduler.scala 109:17 110:13]
  assign ctrlBlock_io_writeback_1_8_bits_uop_cf_exceptionVec_4 = wbArbiter_io_in_9_bits_uop_cf_exceptionVec_4; // @[Scheduler.scala 109:17 111:12]
  assign ctrlBlock_io_writeback_1_8_bits_uop_cf_exceptionVec_5 = wbArbiter_io_in_9_bits_uop_cf_exceptionVec_5; // @[Scheduler.scala 109:17 111:12]
  assign ctrlBlock_io_writeback_1_8_bits_uop_cf_exceptionVec_6 = wbArbiter_io_in_9_bits_uop_cf_exceptionVec_6; // @[Scheduler.scala 109:17 111:12]
  assign ctrlBlock_io_writeback_1_8_bits_uop_cf_exceptionVec_7 = wbArbiter_io_in_9_bits_uop_cf_exceptionVec_7; // @[Scheduler.scala 109:17 111:12]
  assign ctrlBlock_io_writeback_1_8_bits_uop_cf_exceptionVec_13 = wbArbiter_io_in_9_bits_uop_cf_exceptionVec_13; // @[Scheduler.scala 109:17 111:12]
  assign ctrlBlock_io_writeback_1_8_bits_uop_cf_exceptionVec_15 = wbArbiter_io_in_9_bits_uop_cf_exceptionVec_15; // @[Scheduler.scala 109:17 111:12]
  assign ctrlBlock_io_writeback_1_8_bits_uop_cf_trigger_backendHit_0 =
    wbArbiter_io_in_9_bits_uop_cf_trigger_backendHit_0; // @[Scheduler.scala 109:17 111:12]
  assign ctrlBlock_io_writeback_1_8_bits_uop_cf_trigger_backendHit_1 =
    wbArbiter_io_in_9_bits_uop_cf_trigger_backendHit_1; // @[Scheduler.scala 109:17 111:12]
  assign ctrlBlock_io_writeback_1_8_bits_uop_cf_trigger_backendHit_2 =
    wbArbiter_io_in_9_bits_uop_cf_trigger_backendHit_2; // @[Scheduler.scala 109:17 111:12]
  assign ctrlBlock_io_writeback_1_8_bits_uop_cf_trigger_backendHit_3 =
    wbArbiter_io_in_9_bits_uop_cf_trigger_backendHit_3; // @[Scheduler.scala 109:17 111:12]
  assign ctrlBlock_io_writeback_1_8_bits_uop_cf_trigger_backendHit_4 =
    wbArbiter_io_in_9_bits_uop_cf_trigger_backendHit_4; // @[Scheduler.scala 109:17 111:12]
  assign ctrlBlock_io_writeback_1_8_bits_uop_cf_trigger_backendHit_5 =
    wbArbiter_io_in_9_bits_uop_cf_trigger_backendHit_5; // @[Scheduler.scala 109:17 111:12]
  assign ctrlBlock_io_writeback_1_8_bits_uop_robIdx_flag = wbArbiter_io_in_9_bits_uop_robIdx_flag; // @[Scheduler.scala 109:17 111:12]
  assign ctrlBlock_io_writeback_1_8_bits_uop_robIdx_value = wbArbiter_io_in_9_bits_uop_robIdx_value; // @[Scheduler.scala 109:17 111:12]
  assign ctrlBlock_io_writeback_1_8_bits_redirectValid = wbArbiter_io_in_9_bits_redirectValid; // @[Scheduler.scala 109:17 111:12]
  assign ctrlBlock_io_writeback_1_8_bits_redirect_cfiUpdate_isMisPred =
    wbArbiter_io_in_9_bits_redirect_cfiUpdate_isMisPred; // @[Scheduler.scala 109:17 111:12]
  assign ctrlBlock_io_writeback_1_8_bits_debug_isMMIO = wbArbiter_io_in_9_bits_debug_isMMIO; // @[Scheduler.scala 109:17 111:12]
  assign ctrlBlock_io_writeback_1_8_bits_debug_isPerfCnt = wbArbiter_io_in_9_bits_debug_isPerfCnt; // @[Scheduler.scala 109:17 111:12]
  assign ctrlBlock_io_writeback_1_9_valid = wbArbiter_io_in_10_valid; // @[Scheduler.scala 109:17 110:13]
  assign ctrlBlock_io_writeback_1_9_bits_uop_robIdx_flag = wbArbiter_io_in_10_bits_uop_robIdx_flag; // @[Scheduler.scala 109:17 111:12]
  assign ctrlBlock_io_writeback_1_9_bits_uop_robIdx_value = wbArbiter_io_in_10_bits_uop_robIdx_value; // @[Scheduler.scala 109:17 111:12]
  assign ctrlBlock_io_writeback_1_10_valid = wbArbiter_io_in_11_valid; // @[Scheduler.scala 109:17 110:13]
  assign ctrlBlock_io_writeback_1_10_bits_uop_robIdx_flag = wbArbiter_io_in_11_bits_uop_robIdx_flag; // @[Scheduler.scala 109:17 111:12]
  assign ctrlBlock_io_writeback_1_10_bits_uop_robIdx_value = wbArbiter_io_in_11_bits_uop_robIdx_value; // @[Scheduler.scala 109:17 111:12]
  assign ctrlBlock_io_writeback_0_3_valid = wb2Ctrl_io_out_3_valid; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_3_bits_uop_cf_exceptionVec_2 = wb2Ctrl_io_out_3_bits_uop_cf_exceptionVec_2; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_3_bits_uop_cf_exceptionVec_3 = wb2Ctrl_io_out_3_bits_uop_cf_exceptionVec_3; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_3_bits_uop_cf_exceptionVec_8 = wb2Ctrl_io_out_3_bits_uop_cf_exceptionVec_8; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_3_bits_uop_cf_exceptionVec_9 = wb2Ctrl_io_out_3_bits_uop_cf_exceptionVec_9; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_3_bits_uop_cf_exceptionVec_11 = wb2Ctrl_io_out_3_bits_uop_cf_exceptionVec_11; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_3_bits_uop_ctrl_flushPipe = wb2Ctrl_io_out_3_bits_uop_ctrl_flushPipe; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_3_bits_uop_robIdx_flag = wb2Ctrl_io_out_3_bits_uop_robIdx_flag; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_3_bits_uop_robIdx_value = wb2Ctrl_io_out_3_bits_uop_robIdx_value; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_3_bits_fflags = wb2Ctrl_io_out_3_bits_fflags; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_4_valid = wb2Ctrl_io_out_4_valid; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_4_bits_uop_robIdx_flag = wb2Ctrl_io_out_4_bits_uop_robIdx_flag; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_4_bits_uop_robIdx_value = wb2Ctrl_io_out_4_bits_uop_robIdx_value; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_4_bits_fflags = wb2Ctrl_io_out_4_bits_fflags; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_5_valid = wb2Ctrl_io_out_5_valid; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_5_bits_uop_robIdx_flag = wb2Ctrl_io_out_5_bits_uop_robIdx_flag; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_5_bits_uop_robIdx_value = wb2Ctrl_io_out_5_bits_uop_robIdx_value; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_5_bits_fflags = wb2Ctrl_io_out_5_bits_fflags; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_6_valid = wb2Ctrl_io_out_6_valid; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_6_bits_uop_cf_exceptionVec_4 = wb2Ctrl_io_out_6_bits_uop_cf_exceptionVec_4; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_6_bits_uop_cf_exceptionVec_5 = wb2Ctrl_io_out_6_bits_uop_cf_exceptionVec_5; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_6_bits_uop_cf_exceptionVec_13 = wb2Ctrl_io_out_6_bits_uop_cf_exceptionVec_13; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_6_bits_uop_cf_trigger_backendHit_0 = wb2Ctrl_io_out_6_bits_uop_cf_trigger_backendHit_0
    ; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_6_bits_uop_cf_trigger_backendHit_1 = wb2Ctrl_io_out_6_bits_uop_cf_trigger_backendHit_1
    ; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_6_bits_uop_cf_trigger_backendHit_2 = wb2Ctrl_io_out_6_bits_uop_cf_trigger_backendHit_2
    ; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_6_bits_uop_cf_trigger_backendHit_3 = wb2Ctrl_io_out_6_bits_uop_cf_trigger_backendHit_3
    ; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_6_bits_uop_cf_trigger_backendHit_4 = wb2Ctrl_io_out_6_bits_uop_cf_trigger_backendHit_4
    ; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_6_bits_uop_cf_trigger_backendHit_5 = wb2Ctrl_io_out_6_bits_uop_cf_trigger_backendHit_5
    ; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_6_bits_uop_ctrl_flushPipe = wb2Ctrl_io_out_6_bits_uop_ctrl_flushPipe; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_6_bits_uop_ctrl_replayInst = wb2Ctrl_io_out_6_bits_uop_ctrl_replayInst; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_6_bits_uop_robIdx_flag = wb2Ctrl_io_out_6_bits_uop_robIdx_flag; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_6_bits_uop_robIdx_value = wb2Ctrl_io_out_6_bits_uop_robIdx_value; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_7_valid = wb2Ctrl_io_out_7_valid; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_7_bits_uop_cf_exceptionVec_4 = wb2Ctrl_io_out_7_bits_uop_cf_exceptionVec_4; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_7_bits_uop_cf_exceptionVec_5 = wb2Ctrl_io_out_7_bits_uop_cf_exceptionVec_5; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_7_bits_uop_cf_exceptionVec_13 = wb2Ctrl_io_out_7_bits_uop_cf_exceptionVec_13; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_7_bits_uop_cf_trigger_backendHit_0 = wb2Ctrl_io_out_7_bits_uop_cf_trigger_backendHit_0
    ; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_7_bits_uop_cf_trigger_backendHit_1 = wb2Ctrl_io_out_7_bits_uop_cf_trigger_backendHit_1
    ; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_7_bits_uop_cf_trigger_backendHit_2 = wb2Ctrl_io_out_7_bits_uop_cf_trigger_backendHit_2
    ; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_7_bits_uop_cf_trigger_backendHit_3 = wb2Ctrl_io_out_7_bits_uop_cf_trigger_backendHit_3
    ; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_7_bits_uop_cf_trigger_backendHit_4 = wb2Ctrl_io_out_7_bits_uop_cf_trigger_backendHit_4
    ; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_7_bits_uop_cf_trigger_backendHit_5 = wb2Ctrl_io_out_7_bits_uop_cf_trigger_backendHit_5
    ; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_7_bits_uop_ctrl_flushPipe = wb2Ctrl_io_out_7_bits_uop_ctrl_flushPipe; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_7_bits_uop_ctrl_replayInst = wb2Ctrl_io_out_7_bits_uop_ctrl_replayInst; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_7_bits_uop_robIdx_flag = wb2Ctrl_io_out_7_bits_uop_robIdx_flag; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_7_bits_uop_robIdx_value = wb2Ctrl_io_out_7_bits_uop_robIdx_value; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_8_valid = wb2Ctrl_io_out_8_valid; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_8_bits_uop_cf_exceptionVec_4 = wb2Ctrl_io_out_8_bits_uop_cf_exceptionVec_4; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_8_bits_uop_cf_exceptionVec_5 = wb2Ctrl_io_out_8_bits_uop_cf_exceptionVec_5; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_8_bits_uop_cf_exceptionVec_6 = wb2Ctrl_io_out_8_bits_uop_cf_exceptionVec_6; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_8_bits_uop_cf_exceptionVec_7 = wb2Ctrl_io_out_8_bits_uop_cf_exceptionVec_7; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_8_bits_uop_cf_exceptionVec_13 = wb2Ctrl_io_out_8_bits_uop_cf_exceptionVec_13; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_8_bits_uop_cf_exceptionVec_15 = wb2Ctrl_io_out_8_bits_uop_cf_exceptionVec_15; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_8_bits_uop_cf_trigger_backendHit_0 = wb2Ctrl_io_out_8_bits_uop_cf_trigger_backendHit_0
    ; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_8_bits_uop_cf_trigger_backendHit_1 = wb2Ctrl_io_out_8_bits_uop_cf_trigger_backendHit_1
    ; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_8_bits_uop_cf_trigger_backendHit_2 = wb2Ctrl_io_out_8_bits_uop_cf_trigger_backendHit_2
    ; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_8_bits_uop_cf_trigger_backendHit_3 = wb2Ctrl_io_out_8_bits_uop_cf_trigger_backendHit_3
    ; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_8_bits_uop_cf_trigger_backendHit_4 = wb2Ctrl_io_out_8_bits_uop_cf_trigger_backendHit_4
    ; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_8_bits_uop_cf_trigger_backendHit_5 = wb2Ctrl_io_out_8_bits_uop_cf_trigger_backendHit_5
    ; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_8_bits_uop_robIdx_flag = wb2Ctrl_io_out_8_bits_uop_robIdx_flag; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_8_bits_uop_robIdx_value = wb2Ctrl_io_out_8_bits_uop_robIdx_value; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_9_valid = wb2Ctrl_io_out_9_valid; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_9_bits_uop_cf_exceptionVec_6 = wb2Ctrl_io_out_9_bits_uop_cf_exceptionVec_6; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_9_bits_uop_cf_exceptionVec_7 = wb2Ctrl_io_out_9_bits_uop_cf_exceptionVec_7; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_9_bits_uop_cf_exceptionVec_15 = wb2Ctrl_io_out_9_bits_uop_cf_exceptionVec_15; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_9_bits_uop_cf_trigger_backendHit_0 = wb2Ctrl_io_out_9_bits_uop_cf_trigger_backendHit_0
    ; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_9_bits_uop_cf_trigger_backendHit_1 = wb2Ctrl_io_out_9_bits_uop_cf_trigger_backendHit_1
    ; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_9_bits_uop_cf_trigger_backendHit_4 = wb2Ctrl_io_out_9_bits_uop_cf_trigger_backendHit_4
    ; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_9_bits_uop_robIdx_flag = wb2Ctrl_io_out_9_bits_uop_robIdx_flag; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_io_writeback_0_9_bits_uop_robIdx_value = wb2Ctrl_io_out_9_bits_uop_robIdx_value; // @[CtrlBlock.scala 193:87]
  assign ctrlBlock_perfinfo_perfEventsRs_0_value = exuBlocks_io_perf_6_value; // @[XSCore.scala 377:36]
  assign ctrlBlock_perfinfo_perfEventsRs_1_value = exuBlocks_io_perf_7_value; // @[XSCore.scala 377:36]
  assign ctrlBlock_perfinfo_perfEventsRs_2_value = exuBlocks_io_perf_8_value; // @[XSCore.scala 377:36]
  assign ctrlBlock_perfinfo_perfEventsRs_3_value = exuBlocks_io_perf_9_value; // @[XSCore.scala 377:36]
  assign ctrlBlock_perfinfo_perfEventsRs_4_value = exuBlocks_io_perf_10_value; // @[XSCore.scala 377:36]
  assign ctrlBlock_perfinfo_perfEventsRs_5_value = exuBlocks_io_perf_11_value; // @[XSCore.scala 377:36]
  assign ctrlBlock_perfinfo_perfEventsRs_6_value = exuBlocks_1_io_perf_6_value; // @[XSCore.scala 377:36]
  assign ctrlBlock_perfinfo_perfEventsRs_7_value = exuBlocks_1_io_perf_7_value; // @[XSCore.scala 377:36]
  assign ctrlBlock_perfinfo_perfEventsEu0_0_value = exuBlocks_io_perf_0_value; // @[XSCore.scala 370:36]
  assign ctrlBlock_perfinfo_perfEventsEu0_1_value = exuBlocks_io_perf_1_value; // @[XSCore.scala 370:36]
  assign ctrlBlock_perfinfo_perfEventsEu0_2_value = exuBlocks_io_perf_2_value; // @[XSCore.scala 370:36]
  assign ctrlBlock_perfinfo_perfEventsEu0_3_value = exuBlocks_io_perf_3_value; // @[XSCore.scala 370:36]
  assign ctrlBlock_perfinfo_perfEventsEu0_4_value = exuBlocks_io_perf_4_value; // @[XSCore.scala 370:36]
  assign ctrlBlock_perfinfo_perfEventsEu0_5_value = exuBlocks_io_perf_5_value; // @[XSCore.scala 370:36]
  assign ctrlBlock_perfinfo_perfEventsEu1_0_value = exuBlocks_1_io_perf_0_value; // @[XSCore.scala 371:36]
  assign ctrlBlock_perfinfo_perfEventsEu1_1_value = exuBlocks_1_io_perf_1_value; // @[XSCore.scala 371:36]
  assign ctrlBlock_perfinfo_perfEventsEu1_2_value = exuBlocks_1_io_perf_2_value; // @[XSCore.scala 371:36]
  assign ctrlBlock_perfinfo_perfEventsEu1_3_value = exuBlocks_1_io_perf_3_value; // @[XSCore.scala 371:36]
  assign ctrlBlock_perfinfo_perfEventsEu1_4_value = exuBlocks_1_io_perf_4_value; // @[XSCore.scala 371:36]
  assign ctrlBlock_perfinfo_perfEventsEu1_5_value = exuBlocks_1_io_perf_5_value; // @[XSCore.scala 371:36]
  assign itlbRepeater1_clock = clock;
  assign itlbRepeater1_reset = resetGen_5_o_reset; // @[ResetGen.scala 50:30 53:22]
  assign itlbRepeater1_io_sfence_valid = exuBlocks_io_fuExtra_fenceio_sfence_valid; // @[Repeater.scala 146:17]
  assign itlbRepeater1_io_csr_satp_changed = exuBlocks_io_fuExtra_csrio_tlb_satp_changed; // @[Repeater.scala 147:14]
  assign itlbRepeater1_io_tlb_req_0_valid = frontend_io_ptw_req_0_valid; // @[Repeater.scala 145:14]
  assign itlbRepeater1_io_tlb_req_0_bits_vpn = frontend_io_ptw_req_0_bits_vpn; // @[Repeater.scala 145:14]
  assign itlbRepeater1_io_tlb_req_1_valid = frontend_io_ptw_req_1_valid; // @[Repeater.scala 145:14]
  assign itlbRepeater1_io_tlb_req_1_bits_vpn = frontend_io_ptw_req_1_bits_vpn; // @[Repeater.scala 145:14]
  assign itlbRepeater1_io_tlb_req_3_valid = frontend_io_ptw_req_3_valid; // @[Repeater.scala 145:14]
  assign itlbRepeater1_io_tlb_req_3_bits_vpn = frontend_io_ptw_req_3_bits_vpn; // @[Repeater.scala 145:14]
  assign itlbRepeater1_io_ptw_req_0_ready = itlbRepeater2_io_tlb_req_0_ready; // @[Repeater.scala 34:14]
  assign itlbRepeater1_io_ptw_resp_valid = itlbRepeater2_io_tlb_resp_valid; // @[Repeater.scala 34:14]
  assign itlbRepeater1_io_ptw_resp_bits_entry_tag = itlbRepeater2_io_tlb_resp_bits_entry_tag; // @[Repeater.scala 34:14]
  assign itlbRepeater1_io_ptw_resp_bits_entry_asid = itlbRepeater2_io_tlb_resp_bits_entry_asid; // @[Repeater.scala 34:14]
  assign itlbRepeater1_io_ptw_resp_bits_entry_ppn = itlbRepeater2_io_tlb_resp_bits_entry_ppn; // @[Repeater.scala 34:14]
  assign itlbRepeater1_io_ptw_resp_bits_entry_perm_d = itlbRepeater2_io_tlb_resp_bits_entry_perm_d; // @[Repeater.scala 34:14]
  assign itlbRepeater1_io_ptw_resp_bits_entry_perm_a = itlbRepeater2_io_tlb_resp_bits_entry_perm_a; // @[Repeater.scala 34:14]
  assign itlbRepeater1_io_ptw_resp_bits_entry_perm_g = itlbRepeater2_io_tlb_resp_bits_entry_perm_g; // @[Repeater.scala 34:14]
  assign itlbRepeater1_io_ptw_resp_bits_entry_perm_u = itlbRepeater2_io_tlb_resp_bits_entry_perm_u; // @[Repeater.scala 34:14]
  assign itlbRepeater1_io_ptw_resp_bits_entry_perm_x = itlbRepeater2_io_tlb_resp_bits_entry_perm_x; // @[Repeater.scala 34:14]
  assign itlbRepeater1_io_ptw_resp_bits_entry_perm_w = itlbRepeater2_io_tlb_resp_bits_entry_perm_w; // @[Repeater.scala 34:14]
  assign itlbRepeater1_io_ptw_resp_bits_entry_perm_r = itlbRepeater2_io_tlb_resp_bits_entry_perm_r; // @[Repeater.scala 34:14]
  assign itlbRepeater1_io_ptw_resp_bits_entry_level = itlbRepeater2_io_tlb_resp_bits_entry_level; // @[Repeater.scala 34:14]
  assign itlbRepeater1_io_ptw_resp_bits_pf = itlbRepeater2_io_tlb_resp_bits_pf; // @[Repeater.scala 34:14]
  assign itlbRepeater1_io_ptw_resp_bits_af = itlbRepeater2_io_tlb_resp_bits_af; // @[Repeater.scala 34:14]
  assign itlbRepeater2_clock = clock;
  assign itlbRepeater2_reset = resetGen_1_o_reset; // @[ResetGen.scala 50:30 53:22]
  assign itlbRepeater2_io_sfence_valid = exuBlocks_io_fuExtra_fenceio_sfence_valid; // @[Repeater.scala 36:17]
  assign itlbRepeater2_io_csr_satp_changed = exuBlocks_io_fuExtra_csrio_tlb_satp_changed; // @[Repeater.scala 37:14]
  assign itlbRepeater2_io_tlb_req_0_valid = itlbRepeater1_io_ptw_req_0_valid; // @[Repeater.scala 34:14]
  assign itlbRepeater2_io_tlb_req_0_bits_vpn = itlbRepeater1_io_ptw_req_0_bits_vpn; // @[Repeater.scala 34:14]
  assign itlbRepeater2_io_ptw_req_0_ready = ptw_io_tlb_0_req_0_ready; // @[Repeater.scala 35:14]
  assign itlbRepeater2_io_ptw_resp_valid = ptw_io_tlb_0_resp_valid; // @[Repeater.scala 35:14]
  assign itlbRepeater2_io_ptw_resp_bits_entry_tag = ptw_io_tlb_0_resp_bits_entry_tag; // @[Repeater.scala 35:14]
  assign itlbRepeater2_io_ptw_resp_bits_entry_asid = ptw_io_tlb_0_resp_bits_entry_asid; // @[Repeater.scala 35:14]
  assign itlbRepeater2_io_ptw_resp_bits_entry_ppn = ptw_io_tlb_0_resp_bits_entry_ppn; // @[Repeater.scala 35:14]
  assign itlbRepeater2_io_ptw_resp_bits_entry_perm_d = ptw_io_tlb_0_resp_bits_entry_perm_d; // @[Repeater.scala 35:14]
  assign itlbRepeater2_io_ptw_resp_bits_entry_perm_a = ptw_io_tlb_0_resp_bits_entry_perm_a; // @[Repeater.scala 35:14]
  assign itlbRepeater2_io_ptw_resp_bits_entry_perm_g = ptw_io_tlb_0_resp_bits_entry_perm_g; // @[Repeater.scala 35:14]
  assign itlbRepeater2_io_ptw_resp_bits_entry_perm_u = ptw_io_tlb_0_resp_bits_entry_perm_u; // @[Repeater.scala 35:14]
  assign itlbRepeater2_io_ptw_resp_bits_entry_perm_x = ptw_io_tlb_0_resp_bits_entry_perm_x; // @[Repeater.scala 35:14]
  assign itlbRepeater2_io_ptw_resp_bits_entry_perm_w = ptw_io_tlb_0_resp_bits_entry_perm_w; // @[Repeater.scala 35:14]
  assign itlbRepeater2_io_ptw_resp_bits_entry_perm_r = ptw_io_tlb_0_resp_bits_entry_perm_r; // @[Repeater.scala 35:14]
  assign itlbRepeater2_io_ptw_resp_bits_entry_level = ptw_io_tlb_0_resp_bits_entry_level; // @[Repeater.scala 35:14]
  assign itlbRepeater2_io_ptw_resp_bits_pf = ptw_io_tlb_0_resp_bits_pf; // @[Repeater.scala 35:14]
  assign itlbRepeater2_io_ptw_resp_bits_af = ptw_io_tlb_0_resp_bits_af; // @[Repeater.scala 35:14]
  assign dtlbRepeater1_clock = clock;
  assign dtlbRepeater1_reset = resetGen_o_reset; // @[ResetGen.scala 50:30 53:22]
  assign dtlbRepeater1_io_sfence_valid = exuBlocks_io_fuExtra_fenceio_sfence_valid; // @[Repeater.scala 146:17]
  assign dtlbRepeater1_io_csr_satp_changed = exuBlocks_io_fuExtra_csrio_tlb_satp_changed; // @[Repeater.scala 147:14]
  assign dtlbRepeater1_io_tlb_req_0_valid = memBlock_io_ptw_req_0_valid; // @[Repeater.scala 145:14]
  assign dtlbRepeater1_io_tlb_req_0_bits_vpn = memBlock_io_ptw_req_0_bits_vpn; // @[Repeater.scala 145:14]
  assign dtlbRepeater1_io_tlb_req_1_valid = memBlock_io_ptw_req_1_valid; // @[Repeater.scala 145:14]
  assign dtlbRepeater1_io_tlb_req_1_bits_vpn = memBlock_io_ptw_req_1_bits_vpn; // @[Repeater.scala 145:14]
  assign dtlbRepeater1_io_tlb_req_2_valid = memBlock_io_ptw_req_2_valid; // @[Repeater.scala 145:14]
  assign dtlbRepeater1_io_tlb_req_2_bits_vpn = memBlock_io_ptw_req_2_bits_vpn; // @[Repeater.scala 145:14]
  assign dtlbRepeater1_io_tlb_req_3_valid = memBlock_io_ptw_req_3_valid; // @[Repeater.scala 145:14]
  assign dtlbRepeater1_io_tlb_req_3_bits_vpn = memBlock_io_ptw_req_3_bits_vpn; // @[Repeater.scala 145:14]
  assign dtlbRepeater1_io_ptw_req_0_ready = dtlbRepeater2_io_tlb_req_0_ready; // @[Repeater.scala 34:14]
  assign dtlbRepeater1_io_ptw_resp_valid = dtlbRepeater2_io_tlb_resp_valid; // @[Repeater.scala 34:14]
  assign dtlbRepeater1_io_ptw_resp_bits_entry_tag = dtlbRepeater2_io_tlb_resp_bits_entry_tag; // @[Repeater.scala 34:14]
  assign dtlbRepeater1_io_ptw_resp_bits_entry_asid = dtlbRepeater2_io_tlb_resp_bits_entry_asid; // @[Repeater.scala 34:14]
  assign dtlbRepeater1_io_ptw_resp_bits_entry_ppn = dtlbRepeater2_io_tlb_resp_bits_entry_ppn; // @[Repeater.scala 34:14]
  assign dtlbRepeater1_io_ptw_resp_bits_entry_perm_d = dtlbRepeater2_io_tlb_resp_bits_entry_perm_d; // @[Repeater.scala 34:14]
  assign dtlbRepeater1_io_ptw_resp_bits_entry_perm_a = dtlbRepeater2_io_tlb_resp_bits_entry_perm_a; // @[Repeater.scala 34:14]
  assign dtlbRepeater1_io_ptw_resp_bits_entry_perm_g = dtlbRepeater2_io_tlb_resp_bits_entry_perm_g; // @[Repeater.scala 34:14]
  assign dtlbRepeater1_io_ptw_resp_bits_entry_perm_u = dtlbRepeater2_io_tlb_resp_bits_entry_perm_u; // @[Repeater.scala 34:14]
  assign dtlbRepeater1_io_ptw_resp_bits_entry_perm_x = dtlbRepeater2_io_tlb_resp_bits_entry_perm_x; // @[Repeater.scala 34:14]
  assign dtlbRepeater1_io_ptw_resp_bits_entry_perm_w = dtlbRepeater2_io_tlb_resp_bits_entry_perm_w; // @[Repeater.scala 34:14]
  assign dtlbRepeater1_io_ptw_resp_bits_entry_perm_r = dtlbRepeater2_io_tlb_resp_bits_entry_perm_r; // @[Repeater.scala 34:14]
  assign dtlbRepeater1_io_ptw_resp_bits_entry_level = dtlbRepeater2_io_tlb_resp_bits_entry_level; // @[Repeater.scala 34:14]
  assign dtlbRepeater1_io_ptw_resp_bits_pf = dtlbRepeater2_io_tlb_resp_bits_pf; // @[Repeater.scala 34:14]
  assign dtlbRepeater1_io_ptw_resp_bits_af = dtlbRepeater2_io_tlb_resp_bits_af; // @[Repeater.scala 34:14]
  assign dtlbRepeater2_clock = clock;
  assign dtlbRepeater2_reset = resetGen_1_o_reset; // @[ResetGen.scala 50:30 53:22]
  assign dtlbRepeater2_io_sfence_valid = exuBlocks_io_fuExtra_fenceio_sfence_valid; // @[Repeater.scala 36:17]
  assign dtlbRepeater2_io_csr_satp_changed = exuBlocks_io_fuExtra_csrio_tlb_satp_changed; // @[Repeater.scala 37:14]
  assign dtlbRepeater2_io_tlb_req_0_valid = dtlbRepeater1_io_ptw_req_0_valid; // @[Repeater.scala 34:14]
  assign dtlbRepeater2_io_tlb_req_0_bits_vpn = dtlbRepeater1_io_ptw_req_0_bits_vpn; // @[Repeater.scala 34:14]
  assign dtlbRepeater2_io_ptw_req_0_ready = ptw_io_tlb_1_req_0_ready; // @[Repeater.scala 35:14]
  assign dtlbRepeater2_io_ptw_resp_valid = ptw_io_tlb_1_resp_valid; // @[Repeater.scala 35:14]
  assign dtlbRepeater2_io_ptw_resp_bits_entry_tag = ptw_io_tlb_1_resp_bits_entry_tag; // @[Repeater.scala 35:14]
  assign dtlbRepeater2_io_ptw_resp_bits_entry_asid = ptw_io_tlb_1_resp_bits_entry_asid; // @[Repeater.scala 35:14]
  assign dtlbRepeater2_io_ptw_resp_bits_entry_ppn = ptw_io_tlb_1_resp_bits_entry_ppn; // @[Repeater.scala 35:14]
  assign dtlbRepeater2_io_ptw_resp_bits_entry_perm_d = ptw_io_tlb_1_resp_bits_entry_perm_d; // @[Repeater.scala 35:14]
  assign dtlbRepeater2_io_ptw_resp_bits_entry_perm_a = ptw_io_tlb_1_resp_bits_entry_perm_a; // @[Repeater.scala 35:14]
  assign dtlbRepeater2_io_ptw_resp_bits_entry_perm_g = ptw_io_tlb_1_resp_bits_entry_perm_g; // @[Repeater.scala 35:14]
  assign dtlbRepeater2_io_ptw_resp_bits_entry_perm_u = ptw_io_tlb_1_resp_bits_entry_perm_u; // @[Repeater.scala 35:14]
  assign dtlbRepeater2_io_ptw_resp_bits_entry_perm_x = ptw_io_tlb_1_resp_bits_entry_perm_x; // @[Repeater.scala 35:14]
  assign dtlbRepeater2_io_ptw_resp_bits_entry_perm_w = ptw_io_tlb_1_resp_bits_entry_perm_w; // @[Repeater.scala 35:14]
  assign dtlbRepeater2_io_ptw_resp_bits_entry_perm_r = ptw_io_tlb_1_resp_bits_entry_perm_r; // @[Repeater.scala 35:14]
  assign dtlbRepeater2_io_ptw_resp_bits_entry_level = ptw_io_tlb_1_resp_bits_entry_level; // @[Repeater.scala 35:14]
  assign dtlbRepeater2_io_ptw_resp_bits_pf = ptw_io_tlb_1_resp_bits_pf; // @[Repeater.scala 35:14]
  assign dtlbRepeater2_io_ptw_resp_bits_af = ptw_io_tlb_1_resp_bits_af; // @[Repeater.scala 35:14]
  assign resetGen_clock = clock;
  assign resetGen_reset = reset;
  assign resetGen_1_clock = clock;
  assign resetGen_1_reset = resetGen_o_reset; // @[ResetGen.scala 50:30 53:22]
  assign resetGen_2_clock = clock;
  assign resetGen_2_reset = resetGen_o_reset; // @[ResetGen.scala 50:30 53:22]
  assign resetGen_3_clock = clock;
  assign resetGen_3_reset = resetGen_2_o_reset; // @[ResetGen.scala 50:30 53:22]
  assign resetGen_4_clock = clock;
  assign resetGen_4_reset = resetGen_2_o_reset; // @[ResetGen.scala 50:30 53:22]
  assign resetGen_5_clock = clock;
  assign resetGen_5_reset = resetGen_4_o_reset; // @[ResetGen.scala 50:30 53:22]
endmodule

