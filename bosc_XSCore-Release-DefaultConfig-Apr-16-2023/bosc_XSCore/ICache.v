module ICache(
  input          clock,
  input          reset,
  input          auto_client_out_a_ready,
  output         auto_client_out_a_valid,
  output [2:0]   auto_client_out_a_bits_opcode,
  output [2:0]   auto_client_out_a_bits_size,
  output [1:0]   auto_client_out_a_bits_source,
  output [35:0]  auto_client_out_a_bits_address,
  output [31:0]  auto_client_out_a_bits_mask,
  output         auto_client_out_bready,
  input          auto_client_out_bvalid,
  input  [1:0]   auto_client_out_bparam,
  input  [35:0]  auto_client_out_baddress,
  input  [255:0] auto_client_out_bdata,
  input          auto_client_out_c_ready,
  output         auto_client_out_c_valid,
  output [2:0]   auto_client_out_c_bits_opcode,
  output [2:0]   auto_client_out_c_bits_param,
  output [35:0]  auto_client_out_c_bits_address,
  output         auto_client_out_c_bits_echo_blockisdirty,
  output [255:0] auto_client_out_c_bits_data,
  output         auto_client_out_d_ready,
  input          auto_client_out_d_valid,
  input  [2:0]   auto_client_out_d_bits_opcode,
  input  [1:0]   auto_client_out_d_bits_param,
  input  [1:0]   auto_client_out_d_bits_source,
  input  [3:0]   auto_client_out_d_bits_sink,
  input          auto_client_out_d_bits_echo_blockisdirty,
  input  [255:0] auto_client_out_d_bits_data,
  input          auto_client_out_d_bits_corrupt,
  input          auto_client_out_e_ready,
  output         auto_client_out_e_valid,
  output [3:0]   auto_client_out_e_bits_sink,
  input          io_stop,
  output         io_fetch_req_ready,
  input          io_fetch_req_valid,
  input  [38:0]  io_fetch_req_bits_pcMemRead_0_startAddr,
  input  [38:0]  io_fetch_req_bits_pcMemRead_0_nextlineStart,
  input  [38:0]  io_fetch_req_bits_pcMemRead_1_startAddr,
  input  [38:0]  io_fetch_req_bits_pcMemRead_1_nextlineStart,
  input  [38:0]  io_fetch_req_bits_pcMemRead_2_startAddr,
  input  [38:0]  io_fetch_req_bits_pcMemRead_2_nextlineStart,
  input  [38:0]  io_fetch_req_bits_pcMemRead_3_startAddr,
  input  [38:0]  io_fetch_req_bits_pcMemRead_3_nextlineStart,
  input  [38:0]  io_fetch_req_bits_pcMemRead_4_startAddr,
  input  [38:0]  io_fetch_req_bits_pcMemRead_4_nextlineStart,
  input          io_fetch_req_bits_readValid_0,
  input          io_fetch_req_bits_readValid_1,
  input          io_fetch_req_bits_readValid_2,
  input          io_fetch_req_bits_readValid_3,
  input          io_fetch_req_bits_readValid_4,
  output         io_fetch_resp_0_valid,
  output [38:0]  io_fetch_resp_0_bits_vaddr,
  output [511:0] io_fetch_resp_0_bits_registerData,
  output [511:0] io_fetch_resp_0_bits_sramData,
  output         io_fetch_resp_0_bits_select,
  output [35:0]  io_fetch_resp_0_bits_paddr,
  output         io_fetch_resp_0_bits_tlbExcp_pageFault,
  output         io_fetch_resp_0_bits_tlbExcp_accessFault,
  output         io_fetch_resp_0_bits_tlbExcp_mmio,
  output         io_fetch_resp_1_valid,
  output [38:0]  io_fetch_resp_1_bits_vaddr,
  output [511:0] io_fetch_resp_1_bits_registerData,
  output [511:0] io_fetch_resp_1_bits_sramData,
  output         io_fetch_resp_1_bits_select,
  output         io_fetch_resp_1_bits_tlbExcp_pageFault,
  output         io_fetch_resp_1_bits_tlbExcp_accessFault,
  output         io_toIFU,
  output [35:0]  io_pmp_0_req_bits_addr,
  input          io_pmp_0_resp_instr,
  input          io_pmp_0_resp_mmio,
  output [35:0]  io_pmp_1_req_bits_addr,
  input          io_pmp_1_resp_instr,
  input          io_itlb_0_req_ready,
  output         io_itlb_0_req_valid,
  output [38:0]  io_itlb_0_req_bits_vaddr,
  output         io_itlb_0_req_bits_kill,
  output         io_itlb_0_resp_ready,
  input          io_itlb_0_resp_valid,
  input  [35:0]  io_itlb_0_resp_bits_paddr_0,
  input          io_itlb_0_resp_bits_excp_0_pf_instr,
  input          io_itlb_0_resp_bits_excp_0_af_instr,
  input          io_itlb_1_req_ready,
  output         io_itlb_1_req_valid,
  output [38:0]  io_itlb_1_req_bits_vaddr,
  output         io_itlb_1_req_bits_kill,
  output         io_itlb_1_resp_ready,
  input          io_itlb_1_resp_valid,
  input  [35:0]  io_itlb_1_resp_bits_paddr_0,
  input          io_itlb_1_resp_bits_excp_0_pf_instr,
  input          io_itlb_1_resp_bits_excp_0_af_instr,
  output         io_perfInfo_only_0_hit,
  output         io_perfInfo_only_0_miss,
  output         io_perfInfo_hit_0_hit_1,
  output         io_perfInfo_hit_0_miss_1,
  output         io_perfInfo_miss_0_hit_1,
  output         io_perfInfo_miss_0_miss_1,
  output         io_perfInfo_hit_0_except_1,
  output         io_perfInfo_miss_0_except_1,
  output         io_perfInfo_except_0,
  output         io_perfInfo_bank_hit_1,
  output         io_perfInfo_hit,
  output         io_error_source_tag,
  output         io_error_source_data,
  output         io_error_source_l2,
  output         io_error_opType_fetch,
  output         io_error_opType_load,
  output         io_error_opType_store,
  output         io_error_opType_probe,
  output         io_error_opType_release,
  output         io_error_opType_atom,
  output [35:0]  io_error_paddr,
  output         io_error_report_to_beu,
  output         io_error_valid,
  input          io_csr_distribute_csr_wvalid,
  input  [11:0]  io_csr_distribute_csr_waddr,
  input  [63:0]  io_csr_distribute_csr_wdata,
  output         io_csr_update_wvalid,
  output [11:0]  io_csr_update_waddr,
  output [63:0]  io_csr_update_wdata,
  input          io_csr_parity_enable
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [511:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [63:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
`endif // RANDOMIZE_REG_INIT
  wire  metaArray_clock; // @[ICache.scala 498:30]
  wire  metaArray_reset; // @[ICache.scala 498:30]
  wire  metaArray_io_write_valid; // @[ICache.scala 498:30]
  wire [5:0] metaArray_io_write_bits_virIdx; // @[ICache.scala 498:30]
  wire [23:0] metaArray_io_write_bits_phyTag; // @[ICache.scala 498:30]
  wire [1:0] metaArray_io_write_bits_coh_state; // @[ICache.scala 498:30]
  wire [7:0] metaArray_io_write_bits_waymask; // @[ICache.scala 498:30]
  wire  metaArray_io_write_bits_bankIdx; // @[ICache.scala 498:30]
  wire  metaArray_io_read_ready; // @[ICache.scala 498:30]
  wire  metaArray_io_read_valid; // @[ICache.scala 498:30]
  wire  metaArray_io_read_bits_isDoubleLine; // @[ICache.scala 498:30]
  wire [5:0] metaArray_io_read_bits_vSetIdx_0; // @[ICache.scala 498:30]
  wire [5:0] metaArray_io_read_bits_vSetIdx_1; // @[ICache.scala 498:30]
  wire [1:0] metaArray_io_readResp_metaData_0_0_coh_state; // @[ICache.scala 498:30]
  wire [23:0] metaArray_io_readResp_metaData_0_0_tag; // @[ICache.scala 498:30]
  wire [1:0] metaArray_io_readResp_metaData_0_1_coh_state; // @[ICache.scala 498:30]
  wire [23:0] metaArray_io_readResp_metaData_0_1_tag; // @[ICache.scala 498:30]
  wire [1:0] metaArray_io_readResp_metaData_0_2_coh_state; // @[ICache.scala 498:30]
  wire [23:0] metaArray_io_readResp_metaData_0_2_tag; // @[ICache.scala 498:30]
  wire [1:0] metaArray_io_readResp_metaData_0_3_coh_state; // @[ICache.scala 498:30]
  wire [23:0] metaArray_io_readResp_metaData_0_3_tag; // @[ICache.scala 498:30]
  wire [1:0] metaArray_io_readResp_metaData_0_4_coh_state; // @[ICache.scala 498:30]
  wire [23:0] metaArray_io_readResp_metaData_0_4_tag; // @[ICache.scala 498:30]
  wire [1:0] metaArray_io_readResp_metaData_0_5_coh_state; // @[ICache.scala 498:30]
  wire [23:0] metaArray_io_readResp_metaData_0_5_tag; // @[ICache.scala 498:30]
  wire [1:0] metaArray_io_readResp_metaData_0_6_coh_state; // @[ICache.scala 498:30]
  wire [23:0] metaArray_io_readResp_metaData_0_6_tag; // @[ICache.scala 498:30]
  wire [1:0] metaArray_io_readResp_metaData_0_7_coh_state; // @[ICache.scala 498:30]
  wire [23:0] metaArray_io_readResp_metaData_0_7_tag; // @[ICache.scala 498:30]
  wire [1:0] metaArray_io_readResp_metaData_1_0_coh_state; // @[ICache.scala 498:30]
  wire [23:0] metaArray_io_readResp_metaData_1_0_tag; // @[ICache.scala 498:30]
  wire [1:0] metaArray_io_readResp_metaData_1_1_coh_state; // @[ICache.scala 498:30]
  wire [23:0] metaArray_io_readResp_metaData_1_1_tag; // @[ICache.scala 498:30]
  wire [1:0] metaArray_io_readResp_metaData_1_2_coh_state; // @[ICache.scala 498:30]
  wire [23:0] metaArray_io_readResp_metaData_1_2_tag; // @[ICache.scala 498:30]
  wire [1:0] metaArray_io_readResp_metaData_1_3_coh_state; // @[ICache.scala 498:30]
  wire [23:0] metaArray_io_readResp_metaData_1_3_tag; // @[ICache.scala 498:30]
  wire [1:0] metaArray_io_readResp_metaData_1_4_coh_state; // @[ICache.scala 498:30]
  wire [23:0] metaArray_io_readResp_metaData_1_4_tag; // @[ICache.scala 498:30]
  wire [1:0] metaArray_io_readResp_metaData_1_5_coh_state; // @[ICache.scala 498:30]
  wire [23:0] metaArray_io_readResp_metaData_1_5_tag; // @[ICache.scala 498:30]
  wire [1:0] metaArray_io_readResp_metaData_1_6_coh_state; // @[ICache.scala 498:30]
  wire [23:0] metaArray_io_readResp_metaData_1_6_tag; // @[ICache.scala 498:30]
  wire [1:0] metaArray_io_readResp_metaData_1_7_coh_state; // @[ICache.scala 498:30]
  wire [23:0] metaArray_io_readResp_metaData_1_7_tag; // @[ICache.scala 498:30]
  wire  metaArray_io_readResp_errors_0_0; // @[ICache.scala 498:30]
  wire  metaArray_io_readResp_errors_0_1; // @[ICache.scala 498:30]
  wire  metaArray_io_readResp_errors_0_2; // @[ICache.scala 498:30]
  wire  metaArray_io_readResp_errors_0_3; // @[ICache.scala 498:30]
  wire  metaArray_io_readResp_errors_0_4; // @[ICache.scala 498:30]
  wire  metaArray_io_readResp_errors_0_5; // @[ICache.scala 498:30]
  wire  metaArray_io_readResp_errors_0_6; // @[ICache.scala 498:30]
  wire  metaArray_io_readResp_errors_0_7; // @[ICache.scala 498:30]
  wire  metaArray_io_readResp_errors_1_0; // @[ICache.scala 498:30]
  wire  metaArray_io_readResp_errors_1_1; // @[ICache.scala 498:30]
  wire  metaArray_io_readResp_errors_1_2; // @[ICache.scala 498:30]
  wire  metaArray_io_readResp_errors_1_3; // @[ICache.scala 498:30]
  wire  metaArray_io_readResp_errors_1_4; // @[ICache.scala 498:30]
  wire  metaArray_io_readResp_errors_1_5; // @[ICache.scala 498:30]
  wire  metaArray_io_readResp_errors_1_6; // @[ICache.scala 498:30]
  wire  metaArray_io_readResp_errors_1_7; // @[ICache.scala 498:30]
  wire  metaArray_io_cacheOp_req_valid; // @[ICache.scala 498:30]
  wire [63:0] metaArray_io_cacheOp_req_bits_wayNum; // @[ICache.scala 498:30]
  wire [63:0] metaArray_io_cacheOp_req_bits_index; // @[ICache.scala 498:30]
  wire [63:0] metaArray_io_cacheOp_req_bits_opCode; // @[ICache.scala 498:30]
  wire [63:0] metaArray_io_cacheOp_req_bits_write_tag_low; // @[ICache.scala 498:30]
  wire  metaArray_io_cacheOp_resp_valid; // @[ICache.scala 498:30]
  wire [63:0] metaArray_io_cacheOp_resp_bits_read_tag_low; // @[ICache.scala 498:30]
  wire  dataArray_clock; // @[ICache.scala 499:30]
  wire  dataArray_reset; // @[ICache.scala 499:30]
  wire  dataArray_io_write_valid; // @[ICache.scala 499:30]
  wire [5:0] dataArray_io_write_bits_virIdx; // @[ICache.scala 499:30]
  wire [511:0] dataArray_io_write_bits_data; // @[ICache.scala 499:30]
  wire [7:0] dataArray_io_write_bits_waymask; // @[ICache.scala 499:30]
  wire  dataArray_io_write_bits_bankIdx; // @[ICache.scala 499:30]
  wire  dataArray_io_read_ready; // @[ICache.scala 499:30]
  wire  dataArray_io_read_valid; // @[ICache.scala 499:30]
  wire  dataArray_io_read_bits_0_isDoubleLine; // @[ICache.scala 499:30]
  wire [5:0] dataArray_io_read_bits_0_vSetIdx_0; // @[ICache.scala 499:30]
  wire [5:0] dataArray_io_read_bits_0_vSetIdx_1; // @[ICache.scala 499:30]
  wire  dataArray_io_read_bits_1_isDoubleLine; // @[ICache.scala 499:30]
  wire [5:0] dataArray_io_read_bits_1_vSetIdx_0; // @[ICache.scala 499:30]
  wire [5:0] dataArray_io_read_bits_1_vSetIdx_1; // @[ICache.scala 499:30]
  wire  dataArray_io_read_bits_2_isDoubleLine; // @[ICache.scala 499:30]
  wire [5:0] dataArray_io_read_bits_2_vSetIdx_0; // @[ICache.scala 499:30]
  wire [5:0] dataArray_io_read_bits_2_vSetIdx_1; // @[ICache.scala 499:30]
  wire  dataArray_io_read_bits_3_isDoubleLine; // @[ICache.scala 499:30]
  wire [5:0] dataArray_io_read_bits_3_vSetIdx_0; // @[ICache.scala 499:30]
  wire [5:0] dataArray_io_read_bits_3_vSetIdx_1; // @[ICache.scala 499:30]
  wire [511:0] dataArray_io_readResp_datas_0_0; // @[ICache.scala 499:30]
  wire [511:0] dataArray_io_readResp_datas_0_1; // @[ICache.scala 499:30]
  wire [511:0] dataArray_io_readResp_datas_0_2; // @[ICache.scala 499:30]
  wire [511:0] dataArray_io_readResp_datas_0_3; // @[ICache.scala 499:30]
  wire [511:0] dataArray_io_readResp_datas_0_4; // @[ICache.scala 499:30]
  wire [511:0] dataArray_io_readResp_datas_0_5; // @[ICache.scala 499:30]
  wire [511:0] dataArray_io_readResp_datas_0_6; // @[ICache.scala 499:30]
  wire [511:0] dataArray_io_readResp_datas_0_7; // @[ICache.scala 499:30]
  wire [511:0] dataArray_io_readResp_datas_1_0; // @[ICache.scala 499:30]
  wire [511:0] dataArray_io_readResp_datas_1_1; // @[ICache.scala 499:30]
  wire [511:0] dataArray_io_readResp_datas_1_2; // @[ICache.scala 499:30]
  wire [511:0] dataArray_io_readResp_datas_1_3; // @[ICache.scala 499:30]
  wire [511:0] dataArray_io_readResp_datas_1_4; // @[ICache.scala 499:30]
  wire [511:0] dataArray_io_readResp_datas_1_5; // @[ICache.scala 499:30]
  wire [511:0] dataArray_io_readResp_datas_1_6; // @[ICache.scala 499:30]
  wire [511:0] dataArray_io_readResp_datas_1_7; // @[ICache.scala 499:30]
  wire [31:0] dataArray_io_readResp_codes_0_0; // @[ICache.scala 499:30]
  wire [31:0] dataArray_io_readResp_codes_0_1; // @[ICache.scala 499:30]
  wire [31:0] dataArray_io_readResp_codes_0_2; // @[ICache.scala 499:30]
  wire [31:0] dataArray_io_readResp_codes_0_3; // @[ICache.scala 499:30]
  wire [31:0] dataArray_io_readResp_codes_0_4; // @[ICache.scala 499:30]
  wire [31:0] dataArray_io_readResp_codes_0_5; // @[ICache.scala 499:30]
  wire [31:0] dataArray_io_readResp_codes_0_6; // @[ICache.scala 499:30]
  wire [31:0] dataArray_io_readResp_codes_0_7; // @[ICache.scala 499:30]
  wire [31:0] dataArray_io_readResp_codes_1_0; // @[ICache.scala 499:30]
  wire [31:0] dataArray_io_readResp_codes_1_1; // @[ICache.scala 499:30]
  wire [31:0] dataArray_io_readResp_codes_1_2; // @[ICache.scala 499:30]
  wire [31:0] dataArray_io_readResp_codes_1_3; // @[ICache.scala 499:30]
  wire [31:0] dataArray_io_readResp_codes_1_4; // @[ICache.scala 499:30]
  wire [31:0] dataArray_io_readResp_codes_1_5; // @[ICache.scala 499:30]
  wire [31:0] dataArray_io_readResp_codes_1_6; // @[ICache.scala 499:30]
  wire [31:0] dataArray_io_readResp_codes_1_7; // @[ICache.scala 499:30]
  wire  dataArray_io_cacheOp_req_valid; // @[ICache.scala 499:30]
  wire [63:0] dataArray_io_cacheOp_req_bits_wayNum; // @[ICache.scala 499:30]
  wire [63:0] dataArray_io_cacheOp_req_bits_index; // @[ICache.scala 499:30]
  wire [63:0] dataArray_io_cacheOp_req_bits_opCode; // @[ICache.scala 499:30]
  wire [63:0] dataArray_io_cacheOp_req_bits_write_data_vec_0; // @[ICache.scala 499:30]
  wire [63:0] dataArray_io_cacheOp_req_bits_write_data_vec_1; // @[ICache.scala 499:30]
  wire [63:0] dataArray_io_cacheOp_req_bits_write_data_vec_2; // @[ICache.scala 499:30]
  wire [63:0] dataArray_io_cacheOp_req_bits_write_data_vec_3; // @[ICache.scala 499:30]
  wire [63:0] dataArray_io_cacheOp_req_bits_write_data_vec_4; // @[ICache.scala 499:30]
  wire [63:0] dataArray_io_cacheOp_req_bits_write_data_vec_5; // @[ICache.scala 499:30]
  wire [63:0] dataArray_io_cacheOp_req_bits_write_data_vec_6; // @[ICache.scala 499:30]
  wire [63:0] dataArray_io_cacheOp_req_bits_write_data_vec_7; // @[ICache.scala 499:30]
  wire [63:0] dataArray_io_cacheOp_req_bits_bank_num; // @[ICache.scala 499:30]
  wire  dataArray_io_cacheOp_resp_valid; // @[ICache.scala 499:30]
  wire [63:0] dataArray_io_cacheOp_resp_bits_read_data_vec_0; // @[ICache.scala 499:30]
  wire [63:0] dataArray_io_cacheOp_resp_bits_read_data_vec_1; // @[ICache.scala 499:30]
  wire [63:0] dataArray_io_cacheOp_resp_bits_read_data_vec_2; // @[ICache.scala 499:30]
  wire [63:0] dataArray_io_cacheOp_resp_bits_read_data_vec_3; // @[ICache.scala 499:30]
  wire [63:0] dataArray_io_cacheOp_resp_bits_read_data_vec_4; // @[ICache.scala 499:30]
  wire [63:0] dataArray_io_cacheOp_resp_bits_read_data_vec_5; // @[ICache.scala 499:30]
  wire [63:0] dataArray_io_cacheOp_resp_bits_read_data_vec_6; // @[ICache.scala 499:30]
  wire [63:0] dataArray_io_cacheOp_resp_bits_read_data_vec_7; // @[ICache.scala 499:30]
  wire  mainPipe_clock; // @[ICache.scala 500:30]
  wire  mainPipe_reset; // @[ICache.scala 500:30]
  wire  mainPipe_io_metaArray_toIMeta_ready; // @[ICache.scala 500:30]
  wire  mainPipe_io_metaArray_toIMeta_valid; // @[ICache.scala 500:30]
  wire  mainPipe_io_metaArray_toIMeta_bits_isDoubleLine; // @[ICache.scala 500:30]
  wire [5:0] mainPipe_io_metaArray_toIMeta_bits_vSetIdx_0; // @[ICache.scala 500:30]
  wire [5:0] mainPipe_io_metaArray_toIMeta_bits_vSetIdx_1; // @[ICache.scala 500:30]
  wire [1:0] mainPipe_io_metaArray_fromIMeta_metaData_0_0_coh_state; // @[ICache.scala 500:30]
  wire [23:0] mainPipe_io_metaArray_fromIMeta_metaData_0_0_tag; // @[ICache.scala 500:30]
  wire [1:0] mainPipe_io_metaArray_fromIMeta_metaData_0_1_coh_state; // @[ICache.scala 500:30]
  wire [23:0] mainPipe_io_metaArray_fromIMeta_metaData_0_1_tag; // @[ICache.scala 500:30]
  wire [1:0] mainPipe_io_metaArray_fromIMeta_metaData_0_2_coh_state; // @[ICache.scala 500:30]
  wire [23:0] mainPipe_io_metaArray_fromIMeta_metaData_0_2_tag; // @[ICache.scala 500:30]
  wire [1:0] mainPipe_io_metaArray_fromIMeta_metaData_0_3_coh_state; // @[ICache.scala 500:30]
  wire [23:0] mainPipe_io_metaArray_fromIMeta_metaData_0_3_tag; // @[ICache.scala 500:30]
  wire [1:0] mainPipe_io_metaArray_fromIMeta_metaData_0_4_coh_state; // @[ICache.scala 500:30]
  wire [23:0] mainPipe_io_metaArray_fromIMeta_metaData_0_4_tag; // @[ICache.scala 500:30]
  wire [1:0] mainPipe_io_metaArray_fromIMeta_metaData_0_5_coh_state; // @[ICache.scala 500:30]
  wire [23:0] mainPipe_io_metaArray_fromIMeta_metaData_0_5_tag; // @[ICache.scala 500:30]
  wire [1:0] mainPipe_io_metaArray_fromIMeta_metaData_0_6_coh_state; // @[ICache.scala 500:30]
  wire [23:0] mainPipe_io_metaArray_fromIMeta_metaData_0_6_tag; // @[ICache.scala 500:30]
  wire [1:0] mainPipe_io_metaArray_fromIMeta_metaData_0_7_coh_state; // @[ICache.scala 500:30]
  wire [23:0] mainPipe_io_metaArray_fromIMeta_metaData_0_7_tag; // @[ICache.scala 500:30]
  wire [1:0] mainPipe_io_metaArray_fromIMeta_metaData_1_0_coh_state; // @[ICache.scala 500:30]
  wire [23:0] mainPipe_io_metaArray_fromIMeta_metaData_1_0_tag; // @[ICache.scala 500:30]
  wire [1:0] mainPipe_io_metaArray_fromIMeta_metaData_1_1_coh_state; // @[ICache.scala 500:30]
  wire [23:0] mainPipe_io_metaArray_fromIMeta_metaData_1_1_tag; // @[ICache.scala 500:30]
  wire [1:0] mainPipe_io_metaArray_fromIMeta_metaData_1_2_coh_state; // @[ICache.scala 500:30]
  wire [23:0] mainPipe_io_metaArray_fromIMeta_metaData_1_2_tag; // @[ICache.scala 500:30]
  wire [1:0] mainPipe_io_metaArray_fromIMeta_metaData_1_3_coh_state; // @[ICache.scala 500:30]
  wire [23:0] mainPipe_io_metaArray_fromIMeta_metaData_1_3_tag; // @[ICache.scala 500:30]
  wire [1:0] mainPipe_io_metaArray_fromIMeta_metaData_1_4_coh_state; // @[ICache.scala 500:30]
  wire [23:0] mainPipe_io_metaArray_fromIMeta_metaData_1_4_tag; // @[ICache.scala 500:30]
  wire [1:0] mainPipe_io_metaArray_fromIMeta_metaData_1_5_coh_state; // @[ICache.scala 500:30]
  wire [23:0] mainPipe_io_metaArray_fromIMeta_metaData_1_5_tag; // @[ICache.scala 500:30]
  wire [1:0] mainPipe_io_metaArray_fromIMeta_metaData_1_6_coh_state; // @[ICache.scala 500:30]
  wire [23:0] mainPipe_io_metaArray_fromIMeta_metaData_1_6_tag; // @[ICache.scala 500:30]
  wire [1:0] mainPipe_io_metaArray_fromIMeta_metaData_1_7_coh_state; // @[ICache.scala 500:30]
  wire [23:0] mainPipe_io_metaArray_fromIMeta_metaData_1_7_tag; // @[ICache.scala 500:30]
  wire  mainPipe_io_metaArray_fromIMeta_errors_0_0; // @[ICache.scala 500:30]
  wire  mainPipe_io_metaArray_fromIMeta_errors_0_1; // @[ICache.scala 500:30]
  wire  mainPipe_io_metaArray_fromIMeta_errors_0_2; // @[ICache.scala 500:30]
  wire  mainPipe_io_metaArray_fromIMeta_errors_0_3; // @[ICache.scala 500:30]
  wire  mainPipe_io_metaArray_fromIMeta_errors_0_4; // @[ICache.scala 500:30]
  wire  mainPipe_io_metaArray_fromIMeta_errors_0_5; // @[ICache.scala 500:30]
  wire  mainPipe_io_metaArray_fromIMeta_errors_0_6; // @[ICache.scala 500:30]
  wire  mainPipe_io_metaArray_fromIMeta_errors_0_7; // @[ICache.scala 500:30]
  wire  mainPipe_io_metaArray_fromIMeta_errors_1_0; // @[ICache.scala 500:30]
  wire  mainPipe_io_metaArray_fromIMeta_errors_1_1; // @[ICache.scala 500:30]
  wire  mainPipe_io_metaArray_fromIMeta_errors_1_2; // @[ICache.scala 500:30]
  wire  mainPipe_io_metaArray_fromIMeta_errors_1_3; // @[ICache.scala 500:30]
  wire  mainPipe_io_metaArray_fromIMeta_errors_1_4; // @[ICache.scala 500:30]
  wire  mainPipe_io_metaArray_fromIMeta_errors_1_5; // @[ICache.scala 500:30]
  wire  mainPipe_io_metaArray_fromIMeta_errors_1_6; // @[ICache.scala 500:30]
  wire  mainPipe_io_metaArray_fromIMeta_errors_1_7; // @[ICache.scala 500:30]
  wire  mainPipe_io_dataArray_toIData_ready; // @[ICache.scala 500:30]
  wire  mainPipe_io_dataArray_toIData_valid; // @[ICache.scala 500:30]
  wire  mainPipe_io_dataArray_toIData_bits_0_isDoubleLine; // @[ICache.scala 500:30]
  wire [5:0] mainPipe_io_dataArray_toIData_bits_0_vSetIdx_0; // @[ICache.scala 500:30]
  wire [5:0] mainPipe_io_dataArray_toIData_bits_0_vSetIdx_1; // @[ICache.scala 500:30]
  wire  mainPipe_io_dataArray_toIData_bits_1_isDoubleLine; // @[ICache.scala 500:30]
  wire [5:0] mainPipe_io_dataArray_toIData_bits_1_vSetIdx_0; // @[ICache.scala 500:30]
  wire [5:0] mainPipe_io_dataArray_toIData_bits_1_vSetIdx_1; // @[ICache.scala 500:30]
  wire  mainPipe_io_dataArray_toIData_bits_2_isDoubleLine; // @[ICache.scala 500:30]
  wire [5:0] mainPipe_io_dataArray_toIData_bits_2_vSetIdx_0; // @[ICache.scala 500:30]
  wire [5:0] mainPipe_io_dataArray_toIData_bits_2_vSetIdx_1; // @[ICache.scala 500:30]
  wire  mainPipe_io_dataArray_toIData_bits_3_isDoubleLine; // @[ICache.scala 500:30]
  wire [5:0] mainPipe_io_dataArray_toIData_bits_3_vSetIdx_0; // @[ICache.scala 500:30]
  wire [5:0] mainPipe_io_dataArray_toIData_bits_3_vSetIdx_1; // @[ICache.scala 500:30]
  wire [511:0] mainPipe_io_dataArray_fromIData_datas_0_0; // @[ICache.scala 500:30]
  wire [511:0] mainPipe_io_dataArray_fromIData_datas_0_1; // @[ICache.scala 500:30]
  wire [511:0] mainPipe_io_dataArray_fromIData_datas_0_2; // @[ICache.scala 500:30]
  wire [511:0] mainPipe_io_dataArray_fromIData_datas_0_3; // @[ICache.scala 500:30]
  wire [511:0] mainPipe_io_dataArray_fromIData_datas_0_4; // @[ICache.scala 500:30]
  wire [511:0] mainPipe_io_dataArray_fromIData_datas_0_5; // @[ICache.scala 500:30]
  wire [511:0] mainPipe_io_dataArray_fromIData_datas_0_6; // @[ICache.scala 500:30]
  wire [511:0] mainPipe_io_dataArray_fromIData_datas_0_7; // @[ICache.scala 500:30]
  wire [511:0] mainPipe_io_dataArray_fromIData_datas_1_0; // @[ICache.scala 500:30]
  wire [511:0] mainPipe_io_dataArray_fromIData_datas_1_1; // @[ICache.scala 500:30]
  wire [511:0] mainPipe_io_dataArray_fromIData_datas_1_2; // @[ICache.scala 500:30]
  wire [511:0] mainPipe_io_dataArray_fromIData_datas_1_3; // @[ICache.scala 500:30]
  wire [511:0] mainPipe_io_dataArray_fromIData_datas_1_4; // @[ICache.scala 500:30]
  wire [511:0] mainPipe_io_dataArray_fromIData_datas_1_5; // @[ICache.scala 500:30]
  wire [511:0] mainPipe_io_dataArray_fromIData_datas_1_6; // @[ICache.scala 500:30]
  wire [511:0] mainPipe_io_dataArray_fromIData_datas_1_7; // @[ICache.scala 500:30]
  wire [31:0] mainPipe_io_dataArray_fromIData_codes_0_0; // @[ICache.scala 500:30]
  wire [31:0] mainPipe_io_dataArray_fromIData_codes_0_1; // @[ICache.scala 500:30]
  wire [31:0] mainPipe_io_dataArray_fromIData_codes_0_2; // @[ICache.scala 500:30]
  wire [31:0] mainPipe_io_dataArray_fromIData_codes_0_3; // @[ICache.scala 500:30]
  wire [31:0] mainPipe_io_dataArray_fromIData_codes_0_4; // @[ICache.scala 500:30]
  wire [31:0] mainPipe_io_dataArray_fromIData_codes_0_5; // @[ICache.scala 500:30]
  wire [31:0] mainPipe_io_dataArray_fromIData_codes_0_6; // @[ICache.scala 500:30]
  wire [31:0] mainPipe_io_dataArray_fromIData_codes_0_7; // @[ICache.scala 500:30]
  wire [31:0] mainPipe_io_dataArray_fromIData_codes_1_0; // @[ICache.scala 500:30]
  wire [31:0] mainPipe_io_dataArray_fromIData_codes_1_1; // @[ICache.scala 500:30]
  wire [31:0] mainPipe_io_dataArray_fromIData_codes_1_2; // @[ICache.scala 500:30]
  wire [31:0] mainPipe_io_dataArray_fromIData_codes_1_3; // @[ICache.scala 500:30]
  wire [31:0] mainPipe_io_dataArray_fromIData_codes_1_4; // @[ICache.scala 500:30]
  wire [31:0] mainPipe_io_dataArray_fromIData_codes_1_5; // @[ICache.scala 500:30]
  wire [31:0] mainPipe_io_dataArray_fromIData_codes_1_6; // @[ICache.scala 500:30]
  wire [31:0] mainPipe_io_dataArray_fromIData_codes_1_7; // @[ICache.scala 500:30]
  wire  mainPipe_io_mshr_0_toMSHR_ready; // @[ICache.scala 500:30]
  wire  mainPipe_io_mshr_0_toMSHR_valid; // @[ICache.scala 500:30]
  wire [35:0] mainPipe_io_mshr_0_toMSHR_bits_paddr; // @[ICache.scala 500:30]
  wire [38:0] mainPipe_io_mshr_0_toMSHR_bits_vaddr; // @[ICache.scala 500:30]
  wire [7:0] mainPipe_io_mshr_0_toMSHR_bits_waymask; // @[ICache.scala 500:30]
  wire  mainPipe_io_mshr_0_fromMSHR_valid; // @[ICache.scala 500:30]
  wire [511:0] mainPipe_io_mshr_0_fromMSHR_bits_data; // @[ICache.scala 500:30]
  wire  mainPipe_io_mshr_0_fromMSHR_bits_corrupt; // @[ICache.scala 500:30]
  wire  mainPipe_io_mshr_1_toMSHR_ready; // @[ICache.scala 500:30]
  wire  mainPipe_io_mshr_1_toMSHR_valid; // @[ICache.scala 500:30]
  wire [35:0] mainPipe_io_mshr_1_toMSHR_bits_paddr; // @[ICache.scala 500:30]
  wire [38:0] mainPipe_io_mshr_1_toMSHR_bits_vaddr; // @[ICache.scala 500:30]
  wire [7:0] mainPipe_io_mshr_1_toMSHR_bits_waymask; // @[ICache.scala 500:30]
  wire  mainPipe_io_mshr_1_fromMSHR_valid; // @[ICache.scala 500:30]
  wire [511:0] mainPipe_io_mshr_1_fromMSHR_bits_data; // @[ICache.scala 500:30]
  wire  mainPipe_io_mshr_1_fromMSHR_bits_corrupt; // @[ICache.scala 500:30]
  wire  mainPipe_io_errors_0_source_tag; // @[ICache.scala 500:30]
  wire  mainPipe_io_errors_0_source_data; // @[ICache.scala 500:30]
  wire  mainPipe_io_errors_0_source_l2; // @[ICache.scala 500:30]
  wire [35:0] mainPipe_io_errors_0_paddr; // @[ICache.scala 500:30]
  wire  mainPipe_io_errors_0_report_to_beu; // @[ICache.scala 500:30]
  wire  mainPipe_io_errors_0_valid; // @[ICache.scala 500:30]
  wire  mainPipe_io_errors_1_source_tag; // @[ICache.scala 500:30]
  wire  mainPipe_io_errors_1_source_data; // @[ICache.scala 500:30]
  wire  mainPipe_io_errors_1_source_l2; // @[ICache.scala 500:30]
  wire [35:0] mainPipe_io_errors_1_paddr; // @[ICache.scala 500:30]
  wire  mainPipe_io_errors_1_report_to_beu; // @[ICache.scala 500:30]
  wire  mainPipe_io_errors_1_valid; // @[ICache.scala 500:30]
  wire  mainPipe_io_fetch_req_ready; // @[ICache.scala 500:30]
  wire  mainPipe_io_fetch_req_valid; // @[ICache.scala 500:30]
  wire [38:0] mainPipe_io_fetch_req_bits_pcMemRead_0_startAddr; // @[ICache.scala 500:30]
  wire [38:0] mainPipe_io_fetch_req_bits_pcMemRead_0_nextlineStart; // @[ICache.scala 500:30]
  wire [38:0] mainPipe_io_fetch_req_bits_pcMemRead_1_startAddr; // @[ICache.scala 500:30]
  wire [38:0] mainPipe_io_fetch_req_bits_pcMemRead_1_nextlineStart; // @[ICache.scala 500:30]
  wire [38:0] mainPipe_io_fetch_req_bits_pcMemRead_2_startAddr; // @[ICache.scala 500:30]
  wire [38:0] mainPipe_io_fetch_req_bits_pcMemRead_2_nextlineStart; // @[ICache.scala 500:30]
  wire [38:0] mainPipe_io_fetch_req_bits_pcMemRead_3_startAddr; // @[ICache.scala 500:30]
  wire [38:0] mainPipe_io_fetch_req_bits_pcMemRead_3_nextlineStart; // @[ICache.scala 500:30]
  wire [38:0] mainPipe_io_fetch_req_bits_pcMemRead_4_startAddr; // @[ICache.scala 500:30]
  wire [38:0] mainPipe_io_fetch_req_bits_pcMemRead_4_nextlineStart; // @[ICache.scala 500:30]
  wire  mainPipe_io_fetch_req_bits_readValid_0; // @[ICache.scala 500:30]
  wire  mainPipe_io_fetch_req_bits_readValid_1; // @[ICache.scala 500:30]
  wire  mainPipe_io_fetch_req_bits_readValid_2; // @[ICache.scala 500:30]
  wire  mainPipe_io_fetch_req_bits_readValid_3; // @[ICache.scala 500:30]
  wire  mainPipe_io_fetch_req_bits_readValid_4; // @[ICache.scala 500:30]
  wire  mainPipe_io_fetch_resp_0_valid; // @[ICache.scala 500:30]
  wire [38:0] mainPipe_io_fetch_resp_0_bits_vaddr; // @[ICache.scala 500:30]
  wire [511:0] mainPipe_io_fetch_resp_0_bits_registerData; // @[ICache.scala 500:30]
  wire [511:0] mainPipe_io_fetch_resp_0_bits_sramData; // @[ICache.scala 500:30]
  wire  mainPipe_io_fetch_resp_0_bits_select; // @[ICache.scala 500:30]
  wire [35:0] mainPipe_io_fetch_resp_0_bits_paddr; // @[ICache.scala 500:30]
  wire  mainPipe_io_fetch_resp_0_bits_tlbExcp_pageFault; // @[ICache.scala 500:30]
  wire  mainPipe_io_fetch_resp_0_bits_tlbExcp_accessFault; // @[ICache.scala 500:30]
  wire  mainPipe_io_fetch_resp_0_bits_tlbExcp_mmio; // @[ICache.scala 500:30]
  wire  mainPipe_io_fetch_resp_1_valid; // @[ICache.scala 500:30]
  wire [38:0] mainPipe_io_fetch_resp_1_bits_vaddr; // @[ICache.scala 500:30]
  wire [511:0] mainPipe_io_fetch_resp_1_bits_registerData; // @[ICache.scala 500:30]
  wire [511:0] mainPipe_io_fetch_resp_1_bits_sramData; // @[ICache.scala 500:30]
  wire  mainPipe_io_fetch_resp_1_bits_select; // @[ICache.scala 500:30]
  wire  mainPipe_io_fetch_resp_1_bits_tlbExcp_pageFault; // @[ICache.scala 500:30]
  wire  mainPipe_io_fetch_resp_1_bits_tlbExcp_accessFault; // @[ICache.scala 500:30]
  wire [35:0] mainPipe_io_pmp_0_req_bits_addr; // @[ICache.scala 500:30]
  wire  mainPipe_io_pmp_0_resp_instr; // @[ICache.scala 500:30]
  wire  mainPipe_io_pmp_0_resp_mmio; // @[ICache.scala 500:30]
  wire [35:0] mainPipe_io_pmp_1_req_bits_addr; // @[ICache.scala 500:30]
  wire  mainPipe_io_pmp_1_resp_instr; // @[ICache.scala 500:30]
  wire  mainPipe_io_itlb_0_req_ready; // @[ICache.scala 500:30]
  wire  mainPipe_io_itlb_0_req_valid; // @[ICache.scala 500:30]
  wire [38:0] mainPipe_io_itlb_0_req_bits_vaddr; // @[ICache.scala 500:30]
  wire  mainPipe_io_itlb_0_req_bits_kill; // @[ICache.scala 500:30]
  wire  mainPipe_io_itlb_0_resp_ready; // @[ICache.scala 500:30]
  wire  mainPipe_io_itlb_0_resp_valid; // @[ICache.scala 500:30]
  wire [35:0] mainPipe_io_itlb_0_resp_bits_paddr_0; // @[ICache.scala 500:30]
  wire  mainPipe_io_itlb_0_resp_bits_excp_0_pf_instr; // @[ICache.scala 500:30]
  wire  mainPipe_io_itlb_0_resp_bits_excp_0_af_instr; // @[ICache.scala 500:30]
  wire  mainPipe_io_itlb_1_req_ready; // @[ICache.scala 500:30]
  wire  mainPipe_io_itlb_1_req_valid; // @[ICache.scala 500:30]
  wire [38:0] mainPipe_io_itlb_1_req_bits_vaddr; // @[ICache.scala 500:30]
  wire  mainPipe_io_itlb_1_req_bits_kill; // @[ICache.scala 500:30]
  wire  mainPipe_io_itlb_1_resp_ready; // @[ICache.scala 500:30]
  wire  mainPipe_io_itlb_1_resp_valid; // @[ICache.scala 500:30]
  wire [35:0] mainPipe_io_itlb_1_resp_bits_paddr_0; // @[ICache.scala 500:30]
  wire  mainPipe_io_itlb_1_resp_bits_excp_0_pf_instr; // @[ICache.scala 500:30]
  wire  mainPipe_io_itlb_1_resp_bits_excp_0_af_instr; // @[ICache.scala 500:30]
  wire  mainPipe_io_respStall; // @[ICache.scala 500:30]
  wire  mainPipe_io_perfInfo_only_0_hit; // @[ICache.scala 500:30]
  wire  mainPipe_io_perfInfo_only_0_miss; // @[ICache.scala 500:30]
  wire  mainPipe_io_perfInfo_hit_0_hit_1; // @[ICache.scala 500:30]
  wire  mainPipe_io_perfInfo_hit_0_miss_1; // @[ICache.scala 500:30]
  wire  mainPipe_io_perfInfo_miss_0_hit_1; // @[ICache.scala 500:30]
  wire  mainPipe_io_perfInfo_miss_0_miss_1; // @[ICache.scala 500:30]
  wire  mainPipe_io_perfInfo_hit_0_except_1; // @[ICache.scala 500:30]
  wire  mainPipe_io_perfInfo_miss_0_except_1; // @[ICache.scala 500:30]
  wire  mainPipe_io_perfInfo_except_0; // @[ICache.scala 500:30]
  wire  mainPipe_io_perfInfo_bank_hit_1; // @[ICache.scala 500:30]
  wire  mainPipe_io_perfInfo_hit; // @[ICache.scala 500:30]
  wire  mainPipe_io_csr_parity_enable; // @[ICache.scala 500:30]
  wire  missUnit_clock; // @[ICache.scala 501:29]
  wire  missUnit_reset; // @[ICache.scala 501:29]
  wire  missUnit_io_req_0_ready; // @[ICache.scala 501:29]
  wire  missUnit_io_req_0_valid; // @[ICache.scala 501:29]
  wire [35:0] missUnit_io_req_0_bits_paddr; // @[ICache.scala 501:29]
  wire [38:0] missUnit_io_req_0_bits_vaddr; // @[ICache.scala 501:29]
  wire [7:0] missUnit_io_req_0_bits_waymask; // @[ICache.scala 501:29]
  wire  missUnit_io_req_1_ready; // @[ICache.scala 501:29]
  wire  missUnit_io_req_1_valid; // @[ICache.scala 501:29]
  wire [35:0] missUnit_io_req_1_bits_paddr; // @[ICache.scala 501:29]
  wire [38:0] missUnit_io_req_1_bits_vaddr; // @[ICache.scala 501:29]
  wire [7:0] missUnit_io_req_1_bits_waymask; // @[ICache.scala 501:29]
  wire  missUnit_io_resp_0_valid; // @[ICache.scala 501:29]
  wire [511:0] missUnit_io_resp_0_bits_data; // @[ICache.scala 501:29]
  wire  missUnit_io_resp_0_bits_corrupt; // @[ICache.scala 501:29]
  wire  missUnit_io_resp_1_valid; // @[ICache.scala 501:29]
  wire [511:0] missUnit_io_resp_1_bits_data; // @[ICache.scala 501:29]
  wire  missUnit_io_resp_1_bits_corrupt; // @[ICache.scala 501:29]
  wire  missUnit_io_mem_acquire_ready; // @[ICache.scala 501:29]
  wire  missUnit_io_mem_acquire_valid; // @[ICache.scala 501:29]
  wire [2:0] missUnit_io_mem_acquire_bits_opcode; // @[ICache.scala 501:29]
  wire [2:0] missUnit_io_mem_acquire_bits_size; // @[ICache.scala 501:29]
  wire [1:0] missUnit_io_mem_acquire_bits_source; // @[ICache.scala 501:29]
  wire [35:0] missUnit_io_mem_acquire_bits_address; // @[ICache.scala 501:29]
  wire [31:0] missUnit_io_mem_acquire_bits_mask; // @[ICache.scala 501:29]
  wire  missUnit_io_mem_grant_valid; // @[ICache.scala 501:29]
  wire [2:0] missUnit_io_mem_grant_bits_opcode; // @[ICache.scala 501:29]
  wire [1:0] missUnit_io_mem_grant_bits_param; // @[ICache.scala 501:29]
  wire [1:0] missUnit_io_mem_grant_bits_source; // @[ICache.scala 501:29]
  wire [3:0] missUnit_io_mem_grant_bits_sink; // @[ICache.scala 501:29]
  wire  missUnit_io_mem_grant_bits_echo_blockisdirty; // @[ICache.scala 501:29]
  wire [255:0] missUnit_io_mem_grant_bits_data; // @[ICache.scala 501:29]
  wire  missUnit_io_mem_grant_bits_corrupt; // @[ICache.scala 501:29]
  wire  missUnit_io_mem_finish_ready; // @[ICache.scala 501:29]
  wire  missUnit_io_mem_finish_valid; // @[ICache.scala 501:29]
  wire [3:0] missUnit_io_mem_finish_bits_sink; // @[ICache.scala 501:29]
  wire  missUnit_io_meta_write_ready; // @[ICache.scala 501:29]
  wire  missUnit_io_meta_write_valid; // @[ICache.scala 501:29]
  wire [5:0] missUnit_io_meta_write_bits_virIdx; // @[ICache.scala 501:29]
  wire [23:0] missUnit_io_meta_write_bits_phyTag; // @[ICache.scala 501:29]
  wire [1:0] missUnit_io_meta_write_bits_coh_state; // @[ICache.scala 501:29]
  wire [7:0] missUnit_io_meta_write_bits_waymask; // @[ICache.scala 501:29]
  wire  missUnit_io_meta_write_bits_bankIdx; // @[ICache.scala 501:29]
  wire  missUnit_io_data_write_valid; // @[ICache.scala 501:29]
  wire [5:0] missUnit_io_data_write_bits_virIdx; // @[ICache.scala 501:29]
  wire [511:0] missUnit_io_data_write_bits_data; // @[ICache.scala 501:29]
  wire [7:0] missUnit_io_data_write_bits_waymask; // @[ICache.scala 501:29]
  wire  missUnit_io_data_write_bits_bankIdx; // @[ICache.scala 501:29]
  wire  missUnit_io_release_req_ready; // @[ICache.scala 501:29]
  wire  missUnit_io_release_req_valid; // @[ICache.scala 501:29]
  wire [35:0] missUnit_io_release_req_bits_paddr; // @[ICache.scala 501:29]
  wire [38:0] missUnit_io_release_req_bits_vaddr; // @[ICache.scala 501:29]
  wire [2:0] missUnit_io_release_req_bits_param; // @[ICache.scala 501:29]
  wire  missUnit_io_release_req_bits_voluntary; // @[ICache.scala 501:29]
  wire  missUnit_io_release_req_bits_needData; // @[ICache.scala 501:29]
  wire [7:0] missUnit_io_release_req_bits_waymask; // @[ICache.scala 501:29]
  wire [4:0] missUnit_io_release_req_bits_id; // @[ICache.scala 501:29]
  wire  missUnit_io_release_resp_valid; // @[ICache.scala 501:29]
  wire [4:0] missUnit_io_release_resp_bits; // @[ICache.scala 501:29]
  wire  missUnit_io_victimInfor_0_valid; // @[ICache.scala 501:29]
  wire [5:0] missUnit_io_victimInfor_0_vidx; // @[ICache.scala 501:29]
  wire  missUnit_io_victimInfor_1_valid; // @[ICache.scala 501:29]
  wire [5:0] missUnit_io_victimInfor_1_vidx; // @[ICache.scala 501:29]
  wire  releaseUnit_clock; // @[ICache.scala 502:30]
  wire  releaseUnit_reset; // @[ICache.scala 502:30]
  wire  releaseUnit_io_req_ready; // @[ICache.scala 502:30]
  wire  releaseUnit_io_req_valid; // @[ICache.scala 502:30]
  wire [35:0] releaseUnit_io_req_bits_addr; // @[ICache.scala 502:30]
  wire [2:0] releaseUnit_io_req_bits_param; // @[ICache.scala 502:30]
  wire  releaseUnit_io_req_bits_voluntary; // @[ICache.scala 502:30]
  wire  releaseUnit_io_req_bits_hasData; // @[ICache.scala 502:30]
  wire  releaseUnit_io_req_bits_dirty; // @[ICache.scala 502:30]
  wire [511:0] releaseUnit_io_req_bits_data; // @[ICache.scala 502:30]
  wire  releaseUnit_io_finish; // @[ICache.scala 502:30]
  wire  releaseUnit_io_mem_release_ready; // @[ICache.scala 502:30]
  wire  releaseUnit_io_mem_release_valid; // @[ICache.scala 502:30]
  wire [2:0] releaseUnit_io_mem_release_bits_opcode; // @[ICache.scala 502:30]
  wire [2:0] releaseUnit_io_mem_release_bits_param; // @[ICache.scala 502:30]
  wire [35:0] releaseUnit_io_mem_release_bits_address; // @[ICache.scala 502:30]
  wire  releaseUnit_io_mem_release_bits_echo_blockisdirty; // @[ICache.scala 502:30]
  wire [255:0] releaseUnit_io_mem_release_bits_data; // @[ICache.scala 502:30]
  wire  releaseUnit_io_mem_grant_ready; // @[ICache.scala 502:30]
  wire  releaseUnit_io_mem_grant_valid; // @[ICache.scala 502:30]
  wire [1:0] releaseUnit_io_mem_grant_bits_source; // @[ICache.scala 502:30]
  wire  replacePipe_clock; // @[ICache.scala 503:31]
  wire  replacePipe_reset; // @[ICache.scala 503:31]
  wire  replacePipe_io_pipe_req_ready; // @[ICache.scala 503:31]
  wire  replacePipe_io_pipe_req_valid; // @[ICache.scala 503:31]
  wire [35:0] replacePipe_io_pipe_req_bits_paddr; // @[ICache.scala 503:31]
  wire [38:0] replacePipe_io_pipe_req_bits_vaddr; // @[ICache.scala 503:31]
  wire [2:0] replacePipe_io_pipe_req_bits_param; // @[ICache.scala 503:31]
  wire  replacePipe_io_pipe_req_bits_voluntary; // @[ICache.scala 503:31]
  wire  replacePipe_io_pipe_req_bits_needData; // @[ICache.scala 503:31]
  wire [7:0] replacePipe_io_pipe_req_bits_waymask; // @[ICache.scala 503:31]
  wire [4:0] replacePipe_io_pipe_req_bits_id; // @[ICache.scala 503:31]
  wire  replacePipe_io_meta_read_ready; // @[ICache.scala 503:31]
  wire  replacePipe_io_meta_read_valid; // @[ICache.scala 503:31]
  wire [5:0] replacePipe_io_meta_read_bits_vSetIdx_0; // @[ICache.scala 503:31]
  wire  replacePipe_io_data_read_ready; // @[ICache.scala 503:31]
  wire  replacePipe_io_data_read_valid; // @[ICache.scala 503:31]
  wire [5:0] replacePipe_io_data_read_bits_0_vSetIdx_0; // @[ICache.scala 503:31]
  wire [5:0] replacePipe_io_data_read_bits_1_vSetIdx_0; // @[ICache.scala 503:31]
  wire [5:0] replacePipe_io_data_read_bits_2_vSetIdx_0; // @[ICache.scala 503:31]
  wire [5:0] replacePipe_io_data_read_bits_3_vSetIdx_0; // @[ICache.scala 503:31]
  wire  replacePipe_io_error_source_tag; // @[ICache.scala 503:31]
  wire  replacePipe_io_error_source_data; // @[ICache.scala 503:31]
  wire  replacePipe_io_error_opType_probe; // @[ICache.scala 503:31]
  wire  replacePipe_io_error_opType_release; // @[ICache.scala 503:31]
  wire [35:0] replacePipe_io_error_paddr; // @[ICache.scala 503:31]
  wire  replacePipe_io_error_report_to_beu; // @[ICache.scala 503:31]
  wire  replacePipe_io_error_valid; // @[ICache.scala 503:31]
  wire [1:0] replacePipe_io_meta_response_metaData_0_0_coh_state; // @[ICache.scala 503:31]
  wire [23:0] replacePipe_io_meta_response_metaData_0_0_tag; // @[ICache.scala 503:31]
  wire [1:0] replacePipe_io_meta_response_metaData_0_1_coh_state; // @[ICache.scala 503:31]
  wire [23:0] replacePipe_io_meta_response_metaData_0_1_tag; // @[ICache.scala 503:31]
  wire [1:0] replacePipe_io_meta_response_metaData_0_2_coh_state; // @[ICache.scala 503:31]
  wire [23:0] replacePipe_io_meta_response_metaData_0_2_tag; // @[ICache.scala 503:31]
  wire [1:0] replacePipe_io_meta_response_metaData_0_3_coh_state; // @[ICache.scala 503:31]
  wire [23:0] replacePipe_io_meta_response_metaData_0_3_tag; // @[ICache.scala 503:31]
  wire [1:0] replacePipe_io_meta_response_metaData_0_4_coh_state; // @[ICache.scala 503:31]
  wire [23:0] replacePipe_io_meta_response_metaData_0_4_tag; // @[ICache.scala 503:31]
  wire [1:0] replacePipe_io_meta_response_metaData_0_5_coh_state; // @[ICache.scala 503:31]
  wire [23:0] replacePipe_io_meta_response_metaData_0_5_tag; // @[ICache.scala 503:31]
  wire [1:0] replacePipe_io_meta_response_metaData_0_6_coh_state; // @[ICache.scala 503:31]
  wire [23:0] replacePipe_io_meta_response_metaData_0_6_tag; // @[ICache.scala 503:31]
  wire [1:0] replacePipe_io_meta_response_metaData_0_7_coh_state; // @[ICache.scala 503:31]
  wire [23:0] replacePipe_io_meta_response_metaData_0_7_tag; // @[ICache.scala 503:31]
  wire  replacePipe_io_meta_response_errors_0_0; // @[ICache.scala 503:31]
  wire  replacePipe_io_meta_response_errors_0_1; // @[ICache.scala 503:31]
  wire  replacePipe_io_meta_response_errors_0_2; // @[ICache.scala 503:31]
  wire  replacePipe_io_meta_response_errors_0_3; // @[ICache.scala 503:31]
  wire  replacePipe_io_meta_response_errors_0_4; // @[ICache.scala 503:31]
  wire  replacePipe_io_meta_response_errors_0_5; // @[ICache.scala 503:31]
  wire  replacePipe_io_meta_response_errors_0_6; // @[ICache.scala 503:31]
  wire  replacePipe_io_meta_response_errors_0_7; // @[ICache.scala 503:31]
  wire [511:0] replacePipe_io_data_response_datas_0_0; // @[ICache.scala 503:31]
  wire [511:0] replacePipe_io_data_response_datas_0_1; // @[ICache.scala 503:31]
  wire [511:0] replacePipe_io_data_response_datas_0_2; // @[ICache.scala 503:31]
  wire [511:0] replacePipe_io_data_response_datas_0_3; // @[ICache.scala 503:31]
  wire [511:0] replacePipe_io_data_response_datas_0_4; // @[ICache.scala 503:31]
  wire [511:0] replacePipe_io_data_response_datas_0_5; // @[ICache.scala 503:31]
  wire [511:0] replacePipe_io_data_response_datas_0_6; // @[ICache.scala 503:31]
  wire [511:0] replacePipe_io_data_response_datas_0_7; // @[ICache.scala 503:31]
  wire [31:0] replacePipe_io_data_response_codes_0_0; // @[ICache.scala 503:31]
  wire [31:0] replacePipe_io_data_response_codes_0_1; // @[ICache.scala 503:31]
  wire [31:0] replacePipe_io_data_response_codes_0_2; // @[ICache.scala 503:31]
  wire [31:0] replacePipe_io_data_response_codes_0_3; // @[ICache.scala 503:31]
  wire [31:0] replacePipe_io_data_response_codes_0_4; // @[ICache.scala 503:31]
  wire [31:0] replacePipe_io_data_response_codes_0_5; // @[ICache.scala 503:31]
  wire [31:0] replacePipe_io_data_response_codes_0_6; // @[ICache.scala 503:31]
  wire [31:0] replacePipe_io_data_response_codes_0_7; // @[ICache.scala 503:31]
  wire  replacePipe_io_meta_write_valid; // @[ICache.scala 503:31]
  wire [5:0] replacePipe_io_meta_write_bits_virIdx; // @[ICache.scala 503:31]
  wire [23:0] replacePipe_io_meta_write_bits_phyTag; // @[ICache.scala 503:31]
  wire [1:0] replacePipe_io_meta_write_bits_coh_state; // @[ICache.scala 503:31]
  wire [7:0] replacePipe_io_meta_write_bits_waymask; // @[ICache.scala 503:31]
  wire  replacePipe_io_meta_write_bits_bankIdx; // @[ICache.scala 503:31]
  wire  replacePipe_io_release_req_ready; // @[ICache.scala 503:31]
  wire  replacePipe_io_release_req_valid; // @[ICache.scala 503:31]
  wire [35:0] replacePipe_io_release_req_bits_addr; // @[ICache.scala 503:31]
  wire [2:0] replacePipe_io_release_req_bits_param; // @[ICache.scala 503:31]
  wire  replacePipe_io_release_req_bits_voluntary; // @[ICache.scala 503:31]
  wire  replacePipe_io_release_req_bits_hasData; // @[ICache.scala 503:31]
  wire  replacePipe_io_release_req_bits_dirty; // @[ICache.scala 503:31]
  wire [511:0] replacePipe_io_release_req_bits_data; // @[ICache.scala 503:31]
  wire  replacePipe_io_release_finish; // @[ICache.scala 503:31]
  wire  replacePipe_io_pipe_resp_valid; // @[ICache.scala 503:31]
  wire [4:0] replacePipe_io_pipe_resp_bits; // @[ICache.scala 503:31]
  wire  replacePipe_io_status_r0_set_valid; // @[ICache.scala 503:31]
  wire [5:0] replacePipe_io_status_r0_set_bits; // @[ICache.scala 503:31]
  wire  replacePipe_io_status_r1_set_valid; // @[ICache.scala 503:31]
  wire [5:0] replacePipe_io_status_r1_set_bits; // @[ICache.scala 503:31]
  wire  replacePipe_io_status_r2_set_valid; // @[ICache.scala 503:31]
  wire [5:0] replacePipe_io_status_r2_set_bits; // @[ICache.scala 503:31]
  wire  replacePipe_io_status_r3_set_valid; // @[ICache.scala 503:31]
  wire [5:0] replacePipe_io_status_r3_set_bits; // @[ICache.scala 503:31]
  wire  replacePipe_io_csr_parity_enable; // @[ICache.scala 503:31]
  wire  probeQueue_clock; // @[ICache.scala 504:30]
  wire  probeQueue_reset; // @[ICache.scala 504:30]
  wire  probeQueue_io_mem_probe_ready; // @[ICache.scala 504:30]
  wire  probeQueue_io_mem_probe_valid; // @[ICache.scala 504:30]
  wire [1:0] probeQueue_io_mem_probe_bits_param; // @[ICache.scala 504:30]
  wire [35:0] probeQueue_io_mem_probe_bits_address; // @[ICache.scala 504:30]
  wire [255:0] probeQueue_io_mem_probe_bits_data; // @[ICache.scala 504:30]
  wire  probeQueue_io_pipe_req_ready; // @[ICache.scala 504:30]
  wire  probeQueue_io_pipe_req_valid; // @[ICache.scala 504:30]
  wire [35:0] probeQueue_io_pipe_req_bits_paddr; // @[ICache.scala 504:30]
  wire [38:0] probeQueue_io_pipe_req_bits_vaddr; // @[ICache.scala 504:30]
  wire [2:0] probeQueue_io_pipe_req_bits_param; // @[ICache.scala 504:30]
  wire  probeQueue_io_pipe_req_bits_needData; // @[ICache.scala 504:30]
  wire [4:0] probeQueue_io_pipe_req_bits_id; // @[ICache.scala 504:30]
  wire  meta_read_arb_io_in_0_ready; // @[ICache.scala 507:31]
  wire  meta_read_arb_io_in_0_valid; // @[ICache.scala 507:31]
  wire [5:0] meta_read_arb_io_in_0_bits_vSetIdx_0; // @[ICache.scala 507:31]
  wire  meta_read_arb_io_in_1_ready; // @[ICache.scala 507:31]
  wire  meta_read_arb_io_in_1_valid; // @[ICache.scala 507:31]
  wire  meta_read_arb_io_in_1_bits_isDoubleLine; // @[ICache.scala 507:31]
  wire [5:0] meta_read_arb_io_in_1_bits_vSetIdx_0; // @[ICache.scala 507:31]
  wire [5:0] meta_read_arb_io_in_1_bits_vSetIdx_1; // @[ICache.scala 507:31]
  wire  meta_read_arb_io_out_ready; // @[ICache.scala 507:31]
  wire  meta_read_arb_io_out_valid; // @[ICache.scala 507:31]
  wire  meta_read_arb_io_out_bits_isDoubleLine; // @[ICache.scala 507:31]
  wire [5:0] meta_read_arb_io_out_bits_vSetIdx_0; // @[ICache.scala 507:31]
  wire [5:0] meta_read_arb_io_out_bits_vSetIdx_1; // @[ICache.scala 507:31]
  wire  data_read_arb_io_in_0_ready; // @[ICache.scala 508:31]
  wire  data_read_arb_io_in_0_valid; // @[ICache.scala 508:31]
  wire [5:0] data_read_arb_io_in_0_bits_0_vSetIdx_0; // @[ICache.scala 508:31]
  wire [5:0] data_read_arb_io_in_0_bits_1_vSetIdx_0; // @[ICache.scala 508:31]
  wire [5:0] data_read_arb_io_in_0_bits_2_vSetIdx_0; // @[ICache.scala 508:31]
  wire [5:0] data_read_arb_io_in_0_bits_3_vSetIdx_0; // @[ICache.scala 508:31]
  wire  data_read_arb_io_in_1_ready; // @[ICache.scala 508:31]
  wire  data_read_arb_io_in_1_valid; // @[ICache.scala 508:31]
  wire  data_read_arb_io_in_1_bits_0_isDoubleLine; // @[ICache.scala 508:31]
  wire [5:0] data_read_arb_io_in_1_bits_0_vSetIdx_0; // @[ICache.scala 508:31]
  wire [5:0] data_read_arb_io_in_1_bits_0_vSetIdx_1; // @[ICache.scala 508:31]
  wire  data_read_arb_io_in_1_bits_1_isDoubleLine; // @[ICache.scala 508:31]
  wire [5:0] data_read_arb_io_in_1_bits_1_vSetIdx_0; // @[ICache.scala 508:31]
  wire [5:0] data_read_arb_io_in_1_bits_1_vSetIdx_1; // @[ICache.scala 508:31]
  wire  data_read_arb_io_in_1_bits_2_isDoubleLine; // @[ICache.scala 508:31]
  wire [5:0] data_read_arb_io_in_1_bits_2_vSetIdx_0; // @[ICache.scala 508:31]
  wire [5:0] data_read_arb_io_in_1_bits_2_vSetIdx_1; // @[ICache.scala 508:31]
  wire  data_read_arb_io_in_1_bits_3_isDoubleLine; // @[ICache.scala 508:31]
  wire [5:0] data_read_arb_io_in_1_bits_3_vSetIdx_0; // @[ICache.scala 508:31]
  wire [5:0] data_read_arb_io_in_1_bits_3_vSetIdx_1; // @[ICache.scala 508:31]
  wire  data_read_arb_io_out_ready; // @[ICache.scala 508:31]
  wire  data_read_arb_io_out_valid; // @[ICache.scala 508:31]
  wire  data_read_arb_io_out_bits_0_isDoubleLine; // @[ICache.scala 508:31]
  wire [5:0] data_read_arb_io_out_bits_0_vSetIdx_0; // @[ICache.scala 508:31]
  wire [5:0] data_read_arb_io_out_bits_0_vSetIdx_1; // @[ICache.scala 508:31]
  wire  data_read_arb_io_out_bits_1_isDoubleLine; // @[ICache.scala 508:31]
  wire [5:0] data_read_arb_io_out_bits_1_vSetIdx_0; // @[ICache.scala 508:31]
  wire [5:0] data_read_arb_io_out_bits_1_vSetIdx_1; // @[ICache.scala 508:31]
  wire  data_read_arb_io_out_bits_2_isDoubleLine; // @[ICache.scala 508:31]
  wire [5:0] data_read_arb_io_out_bits_2_vSetIdx_0; // @[ICache.scala 508:31]
  wire [5:0] data_read_arb_io_out_bits_2_vSetIdx_1; // @[ICache.scala 508:31]
  wire  data_read_arb_io_out_bits_3_isDoubleLine; // @[ICache.scala 508:31]
  wire [5:0] data_read_arb_io_out_bits_3_vSetIdx_0; // @[ICache.scala 508:31]
  wire [5:0] data_read_arb_io_out_bits_3_vSetIdx_1; // @[ICache.scala 508:31]
  wire  meta_write_arb_io_in_0_ready; // @[ICache.scala 509:31]
  wire  meta_write_arb_io_in_0_valid; // @[ICache.scala 509:31]
  wire [5:0] meta_write_arb_io_in_0_bits_virIdx; // @[ICache.scala 509:31]
  wire [23:0] meta_write_arb_io_in_0_bits_phyTag; // @[ICache.scala 509:31]
  wire [1:0] meta_write_arb_io_in_0_bits_coh_state; // @[ICache.scala 509:31]
  wire [7:0] meta_write_arb_io_in_0_bits_waymask; // @[ICache.scala 509:31]
  wire  meta_write_arb_io_in_0_bits_bankIdx; // @[ICache.scala 509:31]
  wire  meta_write_arb_io_in_1_ready; // @[ICache.scala 509:31]
  wire  meta_write_arb_io_in_1_valid; // @[ICache.scala 509:31]
  wire [5:0] meta_write_arb_io_in_1_bits_virIdx; // @[ICache.scala 509:31]
  wire [23:0] meta_write_arb_io_in_1_bits_phyTag; // @[ICache.scala 509:31]
  wire [1:0] meta_write_arb_io_in_1_bits_coh_state; // @[ICache.scala 509:31]
  wire [7:0] meta_write_arb_io_in_1_bits_waymask; // @[ICache.scala 509:31]
  wire  meta_write_arb_io_in_1_bits_bankIdx; // @[ICache.scala 509:31]
  wire  meta_write_arb_io_out_ready; // @[ICache.scala 509:31]
  wire  meta_write_arb_io_out_valid; // @[ICache.scala 509:31]
  wire [5:0] meta_write_arb_io_out_bits_virIdx; // @[ICache.scala 509:31]
  wire [23:0] meta_write_arb_io_out_bits_phyTag; // @[ICache.scala 509:31]
  wire [1:0] meta_write_arb_io_out_bits_coh_state; // @[ICache.scala 509:31]
  wire [7:0] meta_write_arb_io_out_bits_waymask; // @[ICache.scala 509:31]
  wire  meta_write_arb_io_out_bits_bankIdx; // @[ICache.scala 509:31]
  wire  replace_req_arb_io_in_0_ready; // @[ICache.scala 510:31]
  wire  replace_req_arb_io_in_0_valid; // @[ICache.scala 510:31]
  wire [35:0] replace_req_arb_io_in_0_bits_paddr; // @[ICache.scala 510:31]
  wire [38:0] replace_req_arb_io_in_0_bits_vaddr; // @[ICache.scala 510:31]
  wire [2:0] replace_req_arb_io_in_0_bits_param; // @[ICache.scala 510:31]
  wire  replace_req_arb_io_in_0_bits_voluntary; // @[ICache.scala 510:31]
  wire  replace_req_arb_io_in_0_bits_needData; // @[ICache.scala 510:31]
  wire [7:0] replace_req_arb_io_in_0_bits_waymask; // @[ICache.scala 510:31]
  wire [4:0] replace_req_arb_io_in_0_bits_id; // @[ICache.scala 510:31]
  wire  replace_req_arb_io_in_1_ready; // @[ICache.scala 510:31]
  wire  replace_req_arb_io_in_1_valid; // @[ICache.scala 510:31]
  wire [35:0] replace_req_arb_io_in_1_bits_paddr; // @[ICache.scala 510:31]
  wire [38:0] replace_req_arb_io_in_1_bits_vaddr; // @[ICache.scala 510:31]
  wire [2:0] replace_req_arb_io_in_1_bits_param; // @[ICache.scala 510:31]
  wire  replace_req_arb_io_in_1_bits_voluntary; // @[ICache.scala 510:31]
  wire  replace_req_arb_io_in_1_bits_needData; // @[ICache.scala 510:31]
  wire [7:0] replace_req_arb_io_in_1_bits_waymask; // @[ICache.scala 510:31]
  wire [4:0] replace_req_arb_io_in_1_bits_id; // @[ICache.scala 510:31]
  wire  replace_req_arb_io_out_ready; // @[ICache.scala 510:31]
  wire  replace_req_arb_io_out_valid; // @[ICache.scala 510:31]
  wire [35:0] replace_req_arb_io_out_bits_paddr; // @[ICache.scala 510:31]
  wire [38:0] replace_req_arb_io_out_bits_vaddr; // @[ICache.scala 510:31]
  wire [2:0] replace_req_arb_io_out_bits_param; // @[ICache.scala 510:31]
  wire  replace_req_arb_io_out_bits_voluntary; // @[ICache.scala 510:31]
  wire  replace_req_arb_io_out_bits_needData; // @[ICache.scala 510:31]
  wire [7:0] replace_req_arb_io_out_bits_waymask; // @[ICache.scala 510:31]
  wire [4:0] replace_req_arb_io_out_bits_id; // @[ICache.scala 510:31]
  wire  cacheOpDecoder_clock; // @[ICache.scala 690:30]
  wire  cacheOpDecoder_reset; // @[ICache.scala 690:30]
  wire  cacheOpDecoder_io_csr_distribute_csr_wvalid; // @[ICache.scala 690:30]
  wire [11:0] cacheOpDecoder_io_csr_distribute_csr_waddr; // @[ICache.scala 690:30]
  wire [63:0] cacheOpDecoder_io_csr_distribute_csr_wdata; // @[ICache.scala 690:30]
  wire  cacheOpDecoder_io_csr_update_wvalid; // @[ICache.scala 690:30]
  wire [11:0] cacheOpDecoder_io_csr_update_waddr; // @[ICache.scala 690:30]
  wire [63:0] cacheOpDecoder_io_csr_update_wdata; // @[ICache.scala 690:30]
  wire  cacheOpDecoder_io_cache_req_valid; // @[ICache.scala 690:30]
  wire [63:0] cacheOpDecoder_io_cache_req_bits_wayNum; // @[ICache.scala 690:30]
  wire [63:0] cacheOpDecoder_io_cache_req_bits_index; // @[ICache.scala 690:30]
  wire [63:0] cacheOpDecoder_io_cache_req_bits_opCode; // @[ICache.scala 690:30]
  wire [63:0] cacheOpDecoder_io_cache_req_bits_write_tag_low; // @[ICache.scala 690:30]
  wire [63:0] cacheOpDecoder_io_cache_req_bits_write_data_vec_0; // @[ICache.scala 690:30]
  wire [63:0] cacheOpDecoder_io_cache_req_bits_write_data_vec_1; // @[ICache.scala 690:30]
  wire [63:0] cacheOpDecoder_io_cache_req_bits_write_data_vec_2; // @[ICache.scala 690:30]
  wire [63:0] cacheOpDecoder_io_cache_req_bits_write_data_vec_3; // @[ICache.scala 690:30]
  wire [63:0] cacheOpDecoder_io_cache_req_bits_write_data_vec_4; // @[ICache.scala 690:30]
  wire [63:0] cacheOpDecoder_io_cache_req_bits_write_data_vec_5; // @[ICache.scala 690:30]
  wire [63:0] cacheOpDecoder_io_cache_req_bits_write_data_vec_6; // @[ICache.scala 690:30]
  wire [63:0] cacheOpDecoder_io_cache_req_bits_write_data_vec_7; // @[ICache.scala 690:30]
  wire [63:0] cacheOpDecoder_io_cache_req_bits_bank_num; // @[ICache.scala 690:30]
  wire  cacheOpDecoder_io_cache_resp_valid; // @[ICache.scala 690:30]
  wire [63:0] cacheOpDecoder_io_cache_resp_bits_read_tag_low; // @[ICache.scala 690:30]
  wire [63:0] cacheOpDecoder_io_cache_resp_bits_read_data_vec_0; // @[ICache.scala 690:30]
  wire [63:0] cacheOpDecoder_io_cache_resp_bits_read_data_vec_1; // @[ICache.scala 690:30]
  wire [63:0] cacheOpDecoder_io_cache_resp_bits_read_data_vec_2; // @[ICache.scala 690:30]
  wire [63:0] cacheOpDecoder_io_cache_resp_bits_read_data_vec_3; // @[ICache.scala 690:30]
  wire [63:0] cacheOpDecoder_io_cache_resp_bits_read_data_vec_4; // @[ICache.scala 690:30]
  wire [63:0] cacheOpDecoder_io_cache_resp_bits_read_data_vec_5; // @[ICache.scala 690:30]
  wire [63:0] cacheOpDecoder_io_cache_resp_bits_read_data_vec_6; // @[ICache.scala 690:30]
  wire [63:0] cacheOpDecoder_io_cache_resp_bits_read_data_vec_7; // @[ICache.scala 690:30]
  wire  cacheOpDecoder_io_error_source_tag; // @[ICache.scala 690:30]
  wire  cacheOpDecoder_io_error_source_data; // @[ICache.scala 690:30]
  wire  cacheOpDecoder_io_error_source_l2; // @[ICache.scala 690:30]
  wire  cacheOpDecoder_io_error_opType_fetch; // @[ICache.scala 690:30]
  wire  cacheOpDecoder_io_error_opType_load; // @[ICache.scala 690:30]
  wire  cacheOpDecoder_io_error_opType_store; // @[ICache.scala 690:30]
  wire  cacheOpDecoder_io_error_opType_probe; // @[ICache.scala 690:30]
  wire  cacheOpDecoder_io_error_opType_release; // @[ICache.scala 690:30]
  wire  cacheOpDecoder_io_error_opType_atom; // @[ICache.scala 690:30]
  wire [35:0] cacheOpDecoder_io_error_paddr; // @[ICache.scala 690:30]
  wire  cacheOpDecoder_io_error_report_to_beu; // @[ICache.scala 690:30]
  wire  cacheOpDecoder_io_error_valid; // @[ICache.scala 690:30]
  reg  metaArray_io_write_valid_REG; // @[ICache.scala 537:38]
  reg [5:0] metaArray_io_write_bits_REG_virIdx; // @[ICache.scala 538:38]
  reg [23:0] metaArray_io_write_bits_REG_phyTag; // @[ICache.scala 538:38]
  reg [1:0] metaArray_io_write_bits_REG_coh_state; // @[ICache.scala 538:38]
  reg [7:0] metaArray_io_write_bits_REG_waymask; // @[ICache.scala 538:38]
  reg  metaArray_io_write_bits_REG_bankIdx; // @[ICache.scala 538:38]
  reg  dataArray_io_write_valid_REG; // @[ICache.scala 541:38]
  reg [5:0] dataArray_io_write_bits_REG_virIdx; // @[ICache.scala 542:38]
  reg [511:0] dataArray_io_write_bits_REG_data; // @[ICache.scala 542:38]
  reg [7:0] dataArray_io_write_bits_REG_waymask; // @[ICache.scala 542:38]
  reg  dataArray_io_write_bits_REG_bankIdx; // @[ICache.scala 542:38]
  wire [35:0] _io_error_T_10 = mainPipe_io_errors_0_valid ? mainPipe_io_errors_0_paddr : 36'h0; // @[Mux.scala 27:73]
  wire [35:0] _io_error_T_11 = mainPipe_io_errors_1_valid ? mainPipe_io_errors_1_paddr : 36'h0; // @[Mux.scala 27:73]
  wire [35:0] _io_error_T_12 = replacePipe_io_error_valid ? replacePipe_io_error_paddr : 36'h0; // @[Mux.scala 27:73]
  wire [35:0] _io_error_T_13 = _io_error_T_10 | _io_error_T_11; // @[Mux.scala 27:73]
  reg  io_error_REG_source_tag; // @[ICache.scala 623:22]
  reg  io_error_REG_source_data; // @[ICache.scala 623:22]
  reg  io_error_REG_source_l2; // @[ICache.scala 623:22]
  reg  io_error_REG_opType_fetch; // @[ICache.scala 623:22]
  reg  io_error_REG_opType_probe; // @[ICache.scala 623:22]
  reg  io_error_REG_opType_release; // @[ICache.scala 623:22]
  reg [35:0] io_error_REG_paddr; // @[ICache.scala 623:22]
  reg  io_error_REG_report_to_beu; // @[ICache.scala 623:22]
  reg  io_error_REG_valid; // @[ICache.scala 623:22]
  wire [5:0] probeReqVidx = probeQueue_io_pipe_req_bits_vaddr[11:6]; // @[L1Cache.scala 81:33]
  wire  hasVictim_0 = missUnit_io_victimInfor_0_valid; // @[ICache.scala 630:{26,26}]
  wire [5:0] victimSetSeq_0 = missUnit_io_victimInfor_0_vidx; // @[ICache.scala 631:{29,29}]
  wire  hasVictim_1 = missUnit_io_victimInfor_1_valid; // @[ICache.scala 630:{26,26}]
  wire [5:0] victimSetSeq_1 = missUnit_io_victimInfor_1_vidx; // @[ICache.scala 631:{29,29}]
  wire  probeShouldBlock = hasVictim_0 & probeQueue_io_pipe_req_valid & victimSetSeq_0 == probeReqVidx | hasVictim_1 &
    probeQueue_io_pipe_req_valid & victimSetSeq_1 == probeReqVidx; // @[ICache.scala 633:145]
  wire [5:0] releaseReqVidx = missUnit_io_release_req_bits_vaddr[11:6]; // @[L1Cache.scala 81:33]
  wire  hasConflict_0 = replacePipe_io_status_r0_set_valid; // @[ICache.scala 638:{28,28}]
  wire [5:0] conflictIdx_0 = replacePipe_io_status_r0_set_bits; // @[ICache.scala 645:{28,28}]
  wire  hasConflict_1 = replacePipe_io_status_r1_set_valid; // @[ICache.scala 638:{28,28}]
  wire [5:0] conflictIdx_1 = replacePipe_io_status_r1_set_bits; // @[ICache.scala 645:{28,28}]
  wire  hasConflict_2 = replacePipe_io_status_r2_set_valid; // @[ICache.scala 638:{28,28}]
  wire [5:0] conflictIdx_2 = replacePipe_io_status_r2_set_bits; // @[ICache.scala 645:{28,28}]
  wire  hasConflict_3 = replacePipe_io_status_r3_set_valid; // @[ICache.scala 638:{28,28}]
  wire [5:0] conflictIdx_3 = replacePipe_io_status_r3_set_bits; // @[ICache.scala 645:{28,28}]
  wire  releaseShouldBlock = hasConflict_0 & missUnit_io_release_req_valid & conflictIdx_0 == releaseReqVidx |
    hasConflict_1 & missUnit_io_release_req_valid & conflictIdx_1 == releaseReqVidx | hasConflict_2 &
    missUnit_io_release_req_valid & conflictIdx_2 == releaseReqVidx | hasConflict_3 & missUnit_io_release_req_valid &
    conflictIdx_3 == releaseReqVidx; // @[ICache.scala 652:152]
  wire  _GEN_2 = auto_client_out_d_bits_opcode == 3'h6 & releaseUnit_io_mem_grant_ready; // @[ICache.scala 674:15 677:61 678:30]
  wire  _GEN_3 = auto_client_out_d_bits_opcode == 3'h6 & auto_client_out_d_valid; // @[ICache.scala 677:61 678:30 615:34]
  ICacheMetaArray metaArray ( // @[ICache.scala 498:30]
    .clock(metaArray_clock),
    .reset(metaArray_reset),
    .io_write_valid(metaArray_io_write_valid),
    .io_write_bits_virIdx(metaArray_io_write_bits_virIdx),
    .io_write_bits_phyTag(metaArray_io_write_bits_phyTag),
    .io_write_bits_coh_state(metaArray_io_write_bits_coh_state),
    .io_write_bits_waymask(metaArray_io_write_bits_waymask),
    .io_write_bits_bankIdx(metaArray_io_write_bits_bankIdx),
    .io_read_ready(metaArray_io_read_ready),
    .io_read_valid(metaArray_io_read_valid),
    .io_read_bits_isDoubleLine(metaArray_io_read_bits_isDoubleLine),
    .io_read_bits_vSetIdx_0(metaArray_io_read_bits_vSetIdx_0),
    .io_read_bits_vSetIdx_1(metaArray_io_read_bits_vSetIdx_1),
    .io_readResp_metaData_0_0_coh_state(metaArray_io_readResp_metaData_0_0_coh_state),
    .io_readResp_metaData_0_0_tag(metaArray_io_readResp_metaData_0_0_tag),
    .io_readResp_metaData_0_1_coh_state(metaArray_io_readResp_metaData_0_1_coh_state),
    .io_readResp_metaData_0_1_tag(metaArray_io_readResp_metaData_0_1_tag),
    .io_readResp_metaData_0_2_coh_state(metaArray_io_readResp_metaData_0_2_coh_state),
    .io_readResp_metaData_0_2_tag(metaArray_io_readResp_metaData_0_2_tag),
    .io_readResp_metaData_0_3_coh_state(metaArray_io_readResp_metaData_0_3_coh_state),
    .io_readResp_metaData_0_3_tag(metaArray_io_readResp_metaData_0_3_tag),
    .io_readResp_metaData_0_4_coh_state(metaArray_io_readResp_metaData_0_4_coh_state),
    .io_readResp_metaData_0_4_tag(metaArray_io_readResp_metaData_0_4_tag),
    .io_readResp_metaData_0_5_coh_state(metaArray_io_readResp_metaData_0_5_coh_state),
    .io_readResp_metaData_0_5_tag(metaArray_io_readResp_metaData_0_5_tag),
    .io_readResp_metaData_0_6_coh_state(metaArray_io_readResp_metaData_0_6_coh_state),
    .io_readResp_metaData_0_6_tag(metaArray_io_readResp_metaData_0_6_tag),
    .io_readResp_metaData_0_7_coh_state(metaArray_io_readResp_metaData_0_7_coh_state),
    .io_readResp_metaData_0_7_tag(metaArray_io_readResp_metaData_0_7_tag),
    .io_readResp_metaData_1_0_coh_state(metaArray_io_readResp_metaData_1_0_coh_state),
    .io_readResp_metaData_1_0_tag(metaArray_io_readResp_metaData_1_0_tag),
    .io_readResp_metaData_1_1_coh_state(metaArray_io_readResp_metaData_1_1_coh_state),
    .io_readResp_metaData_1_1_tag(metaArray_io_readResp_metaData_1_1_tag),
    .io_readResp_metaData_1_2_coh_state(metaArray_io_readResp_metaData_1_2_coh_state),
    .io_readResp_metaData_1_2_tag(metaArray_io_readResp_metaData_1_2_tag),
    .io_readResp_metaData_1_3_coh_state(metaArray_io_readResp_metaData_1_3_coh_state),
    .io_readResp_metaData_1_3_tag(metaArray_io_readResp_metaData_1_3_tag),
    .io_readResp_metaData_1_4_coh_state(metaArray_io_readResp_metaData_1_4_coh_state),
    .io_readResp_metaData_1_4_tag(metaArray_io_readResp_metaData_1_4_tag),
    .io_readResp_metaData_1_5_coh_state(metaArray_io_readResp_metaData_1_5_coh_state),
    .io_readResp_metaData_1_5_tag(metaArray_io_readResp_metaData_1_5_tag),
    .io_readResp_metaData_1_6_coh_state(metaArray_io_readResp_metaData_1_6_coh_state),
    .io_readResp_metaData_1_6_tag(metaArray_io_readResp_metaData_1_6_tag),
    .io_readResp_metaData_1_7_coh_state(metaArray_io_readResp_metaData_1_7_coh_state),
    .io_readResp_metaData_1_7_tag(metaArray_io_readResp_metaData_1_7_tag),
    .io_readResp_errors_0_0(metaArray_io_readResp_errors_0_0),
    .io_readResp_errors_0_1(metaArray_io_readResp_errors_0_1),
    .io_readResp_errors_0_2(metaArray_io_readResp_errors_0_2),
    .io_readResp_errors_0_3(metaArray_io_readResp_errors_0_3),
    .io_readResp_errors_0_4(metaArray_io_readResp_errors_0_4),
    .io_readResp_errors_0_5(metaArray_io_readResp_errors_0_5),
    .io_readResp_errors_0_6(metaArray_io_readResp_errors_0_6),
    .io_readResp_errors_0_7(metaArray_io_readResp_errors_0_7),
    .io_readResp_errors_1_0(metaArray_io_readResp_errors_1_0),
    .io_readResp_errors_1_1(metaArray_io_readResp_errors_1_1),
    .io_readResp_errors_1_2(metaArray_io_readResp_errors_1_2),
    .io_readResp_errors_1_3(metaArray_io_readResp_errors_1_3),
    .io_readResp_errors_1_4(metaArray_io_readResp_errors_1_4),
    .io_readResp_errors_1_5(metaArray_io_readResp_errors_1_5),
    .io_readResp_errors_1_6(metaArray_io_readResp_errors_1_6),
    .io_readResp_errors_1_7(metaArray_io_readResp_errors_1_7),
    .io_cacheOp_req_valid(metaArray_io_cacheOp_req_valid),
    .io_cacheOp_req_bits_wayNum(metaArray_io_cacheOp_req_bits_wayNum),
    .io_cacheOp_req_bits_index(metaArray_io_cacheOp_req_bits_index),
    .io_cacheOp_req_bits_opCode(metaArray_io_cacheOp_req_bits_opCode),
    .io_cacheOp_req_bits_write_tag_low(metaArray_io_cacheOp_req_bits_write_tag_low),
    .io_cacheOp_resp_valid(metaArray_io_cacheOp_resp_valid),
    .io_cacheOp_resp_bits_read_tag_low(metaArray_io_cacheOp_resp_bits_read_tag_low)
  );
  ICacheDataArray dataArray ( // @[ICache.scala 499:30]
    .clock(dataArray_clock),
    .reset(dataArray_reset),
    .io_write_valid(dataArray_io_write_valid),
    .io_write_bits_virIdx(dataArray_io_write_bits_virIdx),
    .io_write_bits_data(dataArray_io_write_bits_data),
    .io_write_bits_waymask(dataArray_io_write_bits_waymask),
    .io_write_bits_bankIdx(dataArray_io_write_bits_bankIdx),
    .io_read_ready(dataArray_io_read_ready),
    .io_read_valid(dataArray_io_read_valid),
    .io_read_bits_0_isDoubleLine(dataArray_io_read_bits_0_isDoubleLine),
    .io_read_bits_0_vSetIdx_0(dataArray_io_read_bits_0_vSetIdx_0),
    .io_read_bits_0_vSetIdx_1(dataArray_io_read_bits_0_vSetIdx_1),
    .io_read_bits_1_isDoubleLine(dataArray_io_read_bits_1_isDoubleLine),
    .io_read_bits_1_vSetIdx_0(dataArray_io_read_bits_1_vSetIdx_0),
    .io_read_bits_1_vSetIdx_1(dataArray_io_read_bits_1_vSetIdx_1),
    .io_read_bits_2_isDoubleLine(dataArray_io_read_bits_2_isDoubleLine),
    .io_read_bits_2_vSetIdx_0(dataArray_io_read_bits_2_vSetIdx_0),
    .io_read_bits_2_vSetIdx_1(dataArray_io_read_bits_2_vSetIdx_1),
    .io_read_bits_3_isDoubleLine(dataArray_io_read_bits_3_isDoubleLine),
    .io_read_bits_3_vSetIdx_0(dataArray_io_read_bits_3_vSetIdx_0),
    .io_read_bits_3_vSetIdx_1(dataArray_io_read_bits_3_vSetIdx_1),
    .io_readResp_datas_0_0(dataArray_io_readResp_datas_0_0),
    .io_readResp_datas_0_1(dataArray_io_readResp_datas_0_1),
    .io_readResp_datas_0_2(dataArray_io_readResp_datas_0_2),
    .io_readResp_datas_0_3(dataArray_io_readResp_datas_0_3),
    .io_readResp_datas_0_4(dataArray_io_readResp_datas_0_4),
    .io_readResp_datas_0_5(dataArray_io_readResp_datas_0_5),
    .io_readResp_datas_0_6(dataArray_io_readResp_datas_0_6),
    .io_readResp_datas_0_7(dataArray_io_readResp_datas_0_7),
    .io_readResp_datas_1_0(dataArray_io_readResp_datas_1_0),
    .io_readResp_datas_1_1(dataArray_io_readResp_datas_1_1),
    .io_readResp_datas_1_2(dataArray_io_readResp_datas_1_2),
    .io_readResp_datas_1_3(dataArray_io_readResp_datas_1_3),
    .io_readResp_datas_1_4(dataArray_io_readResp_datas_1_4),
    .io_readResp_datas_1_5(dataArray_io_readResp_datas_1_5),
    .io_readResp_datas_1_6(dataArray_io_readResp_datas_1_6),
    .io_readResp_datas_1_7(dataArray_io_readResp_datas_1_7),
    .io_readResp_codes_0_0(dataArray_io_readResp_codes_0_0),
    .io_readResp_codes_0_1(dataArray_io_readResp_codes_0_1),
    .io_readResp_codes_0_2(dataArray_io_readResp_codes_0_2),
    .io_readResp_codes_0_3(dataArray_io_readResp_codes_0_3),
    .io_readResp_codes_0_4(dataArray_io_readResp_codes_0_4),
    .io_readResp_codes_0_5(dataArray_io_readResp_codes_0_5),
    .io_readResp_codes_0_6(dataArray_io_readResp_codes_0_6),
    .io_readResp_codes_0_7(dataArray_io_readResp_codes_0_7),
    .io_readResp_codes_1_0(dataArray_io_readResp_codes_1_0),
    .io_readResp_codes_1_1(dataArray_io_readResp_codes_1_1),
    .io_readResp_codes_1_2(dataArray_io_readResp_codes_1_2),
    .io_readResp_codes_1_3(dataArray_io_readResp_codes_1_3),
    .io_readResp_codes_1_4(dataArray_io_readResp_codes_1_4),
    .io_readResp_codes_1_5(dataArray_io_readResp_codes_1_5),
    .io_readResp_codes_1_6(dataArray_io_readResp_codes_1_6),
    .io_readResp_codes_1_7(dataArray_io_readResp_codes_1_7),
    .io_cacheOp_req_valid(dataArray_io_cacheOp_req_valid),
    .io_cacheOp_req_bits_wayNum(dataArray_io_cacheOp_req_bits_wayNum),
    .io_cacheOp_req_bits_index(dataArray_io_cacheOp_req_bits_index),
    .io_cacheOp_req_bits_opCode(dataArray_io_cacheOp_req_bits_opCode),
    .io_cacheOp_req_bits_write_data_vec_0(dataArray_io_cacheOp_req_bits_write_data_vec_0),
    .io_cacheOp_req_bits_write_data_vec_1(dataArray_io_cacheOp_req_bits_write_data_vec_1),
    .io_cacheOp_req_bits_write_data_vec_2(dataArray_io_cacheOp_req_bits_write_data_vec_2),
    .io_cacheOp_req_bits_write_data_vec_3(dataArray_io_cacheOp_req_bits_write_data_vec_3),
    .io_cacheOp_req_bits_write_data_vec_4(dataArray_io_cacheOp_req_bits_write_data_vec_4),
    .io_cacheOp_req_bits_write_data_vec_5(dataArray_io_cacheOp_req_bits_write_data_vec_5),
    .io_cacheOp_req_bits_write_data_vec_6(dataArray_io_cacheOp_req_bits_write_data_vec_6),
    .io_cacheOp_req_bits_write_data_vec_7(dataArray_io_cacheOp_req_bits_write_data_vec_7),
    .io_cacheOp_req_bits_bank_num(dataArray_io_cacheOp_req_bits_bank_num),
    .io_cacheOp_resp_valid(dataArray_io_cacheOp_resp_valid),
    .io_cacheOp_resp_bits_read_data_vec_0(dataArray_io_cacheOp_resp_bits_read_data_vec_0),
    .io_cacheOp_resp_bits_read_data_vec_1(dataArray_io_cacheOp_resp_bits_read_data_vec_1),
    .io_cacheOp_resp_bits_read_data_vec_2(dataArray_io_cacheOp_resp_bits_read_data_vec_2),
    .io_cacheOp_resp_bits_read_data_vec_3(dataArray_io_cacheOp_resp_bits_read_data_vec_3),
    .io_cacheOp_resp_bits_read_data_vec_4(dataArray_io_cacheOp_resp_bits_read_data_vec_4),
    .io_cacheOp_resp_bits_read_data_vec_5(dataArray_io_cacheOp_resp_bits_read_data_vec_5),
    .io_cacheOp_resp_bits_read_data_vec_6(dataArray_io_cacheOp_resp_bits_read_data_vec_6),
    .io_cacheOp_resp_bits_read_data_vec_7(dataArray_io_cacheOp_resp_bits_read_data_vec_7)
  );
  ICacheMainPipe mainPipe ( // @[ICache.scala 500:30]
    .clock(mainPipe_clock),
    .reset(mainPipe_reset),
    .io_metaArray_toIMeta_ready(mainPipe_io_metaArray_toIMeta_ready),
    .io_metaArray_toIMeta_valid(mainPipe_io_metaArray_toIMeta_valid),
    .io_metaArray_toIMeta_bits_isDoubleLine(mainPipe_io_metaArray_toIMeta_bits_isDoubleLine),
    .io_metaArray_toIMeta_bits_vSetIdx_0(mainPipe_io_metaArray_toIMeta_bits_vSetIdx_0),
    .io_metaArray_toIMeta_bits_vSetIdx_1(mainPipe_io_metaArray_toIMeta_bits_vSetIdx_1),
    .io_metaArray_fromIMeta_metaData_0_0_coh_state(mainPipe_io_metaArray_fromIMeta_metaData_0_0_coh_state),
    .io_metaArray_fromIMeta_metaData_0_0_tag(mainPipe_io_metaArray_fromIMeta_metaData_0_0_tag),
    .io_metaArray_fromIMeta_metaData_0_1_coh_state(mainPipe_io_metaArray_fromIMeta_metaData_0_1_coh_state),
    .io_metaArray_fromIMeta_metaData_0_1_tag(mainPipe_io_metaArray_fromIMeta_metaData_0_1_tag),
    .io_metaArray_fromIMeta_metaData_0_2_coh_state(mainPipe_io_metaArray_fromIMeta_metaData_0_2_coh_state),
    .io_metaArray_fromIMeta_metaData_0_2_tag(mainPipe_io_metaArray_fromIMeta_metaData_0_2_tag),
    .io_metaArray_fromIMeta_metaData_0_3_coh_state(mainPipe_io_metaArray_fromIMeta_metaData_0_3_coh_state),
    .io_metaArray_fromIMeta_metaData_0_3_tag(mainPipe_io_metaArray_fromIMeta_metaData_0_3_tag),
    .io_metaArray_fromIMeta_metaData_0_4_coh_state(mainPipe_io_metaArray_fromIMeta_metaData_0_4_coh_state),
    .io_metaArray_fromIMeta_metaData_0_4_tag(mainPipe_io_metaArray_fromIMeta_metaData_0_4_tag),
    .io_metaArray_fromIMeta_metaData_0_5_coh_state(mainPipe_io_metaArray_fromIMeta_metaData_0_5_coh_state),
    .io_metaArray_fromIMeta_metaData_0_5_tag(mainPipe_io_metaArray_fromIMeta_metaData_0_5_tag),
    .io_metaArray_fromIMeta_metaData_0_6_coh_state(mainPipe_io_metaArray_fromIMeta_metaData_0_6_coh_state),
    .io_metaArray_fromIMeta_metaData_0_6_tag(mainPipe_io_metaArray_fromIMeta_metaData_0_6_tag),
    .io_metaArray_fromIMeta_metaData_0_7_coh_state(mainPipe_io_metaArray_fromIMeta_metaData_0_7_coh_state),
    .io_metaArray_fromIMeta_metaData_0_7_tag(mainPipe_io_metaArray_fromIMeta_metaData_0_7_tag),
    .io_metaArray_fromIMeta_metaData_1_0_coh_state(mainPipe_io_metaArray_fromIMeta_metaData_1_0_coh_state),
    .io_metaArray_fromIMeta_metaData_1_0_tag(mainPipe_io_metaArray_fromIMeta_metaData_1_0_tag),
    .io_metaArray_fromIMeta_metaData_1_1_coh_state(mainPipe_io_metaArray_fromIMeta_metaData_1_1_coh_state),
    .io_metaArray_fromIMeta_metaData_1_1_tag(mainPipe_io_metaArray_fromIMeta_metaData_1_1_tag),
    .io_metaArray_fromIMeta_metaData_1_2_coh_state(mainPipe_io_metaArray_fromIMeta_metaData_1_2_coh_state),
    .io_metaArray_fromIMeta_metaData_1_2_tag(mainPipe_io_metaArray_fromIMeta_metaData_1_2_tag),
    .io_metaArray_fromIMeta_metaData_1_3_coh_state(mainPipe_io_metaArray_fromIMeta_metaData_1_3_coh_state),
    .io_metaArray_fromIMeta_metaData_1_3_tag(mainPipe_io_metaArray_fromIMeta_metaData_1_3_tag),
    .io_metaArray_fromIMeta_metaData_1_4_coh_state(mainPipe_io_metaArray_fromIMeta_metaData_1_4_coh_state),
    .io_metaArray_fromIMeta_metaData_1_4_tag(mainPipe_io_metaArray_fromIMeta_metaData_1_4_tag),
    .io_metaArray_fromIMeta_metaData_1_5_coh_state(mainPipe_io_metaArray_fromIMeta_metaData_1_5_coh_state),
    .io_metaArray_fromIMeta_metaData_1_5_tag(mainPipe_io_metaArray_fromIMeta_metaData_1_5_tag),
    .io_metaArray_fromIMeta_metaData_1_6_coh_state(mainPipe_io_metaArray_fromIMeta_metaData_1_6_coh_state),
    .io_metaArray_fromIMeta_metaData_1_6_tag(mainPipe_io_metaArray_fromIMeta_metaData_1_6_tag),
    .io_metaArray_fromIMeta_metaData_1_7_coh_state(mainPipe_io_metaArray_fromIMeta_metaData_1_7_coh_state),
    .io_metaArray_fromIMeta_metaData_1_7_tag(mainPipe_io_metaArray_fromIMeta_metaData_1_7_tag),
    .io_metaArray_fromIMeta_errors_0_0(mainPipe_io_metaArray_fromIMeta_errors_0_0),
    .io_metaArray_fromIMeta_errors_0_1(mainPipe_io_metaArray_fromIMeta_errors_0_1),
    .io_metaArray_fromIMeta_errors_0_2(mainPipe_io_metaArray_fromIMeta_errors_0_2),
    .io_metaArray_fromIMeta_errors_0_3(mainPipe_io_metaArray_fromIMeta_errors_0_3),
    .io_metaArray_fromIMeta_errors_0_4(mainPipe_io_metaArray_fromIMeta_errors_0_4),
    .io_metaArray_fromIMeta_errors_0_5(mainPipe_io_metaArray_fromIMeta_errors_0_5),
    .io_metaArray_fromIMeta_errors_0_6(mainPipe_io_metaArray_fromIMeta_errors_0_6),
    .io_metaArray_fromIMeta_errors_0_7(mainPipe_io_metaArray_fromIMeta_errors_0_7),
    .io_metaArray_fromIMeta_errors_1_0(mainPipe_io_metaArray_fromIMeta_errors_1_0),
    .io_metaArray_fromIMeta_errors_1_1(mainPipe_io_metaArray_fromIMeta_errors_1_1),
    .io_metaArray_fromIMeta_errors_1_2(mainPipe_io_metaArray_fromIMeta_errors_1_2),
    .io_metaArray_fromIMeta_errors_1_3(mainPipe_io_metaArray_fromIMeta_errors_1_3),
    .io_metaArray_fromIMeta_errors_1_4(mainPipe_io_metaArray_fromIMeta_errors_1_4),
    .io_metaArray_fromIMeta_errors_1_5(mainPipe_io_metaArray_fromIMeta_errors_1_5),
    .io_metaArray_fromIMeta_errors_1_6(mainPipe_io_metaArray_fromIMeta_errors_1_6),
    .io_metaArray_fromIMeta_errors_1_7(mainPipe_io_metaArray_fromIMeta_errors_1_7),
    .io_dataArray_toIData_ready(mainPipe_io_dataArray_toIData_ready),
    .io_dataArray_toIData_valid(mainPipe_io_dataArray_toIData_valid),
    .io_dataArray_toIData_bits_0_isDoubleLine(mainPipe_io_dataArray_toIData_bits_0_isDoubleLine),
    .io_dataArray_toIData_bits_0_vSetIdx_0(mainPipe_io_dataArray_toIData_bits_0_vSetIdx_0),
    .io_dataArray_toIData_bits_0_vSetIdx_1(mainPipe_io_dataArray_toIData_bits_0_vSetIdx_1),
    .io_dataArray_toIData_bits_1_isDoubleLine(mainPipe_io_dataArray_toIData_bits_1_isDoubleLine),
    .io_dataArray_toIData_bits_1_vSetIdx_0(mainPipe_io_dataArray_toIData_bits_1_vSetIdx_0),
    .io_dataArray_toIData_bits_1_vSetIdx_1(mainPipe_io_dataArray_toIData_bits_1_vSetIdx_1),
    .io_dataArray_toIData_bits_2_isDoubleLine(mainPipe_io_dataArray_toIData_bits_2_isDoubleLine),
    .io_dataArray_toIData_bits_2_vSetIdx_0(mainPipe_io_dataArray_toIData_bits_2_vSetIdx_0),
    .io_dataArray_toIData_bits_2_vSetIdx_1(mainPipe_io_dataArray_toIData_bits_2_vSetIdx_1),
    .io_dataArray_toIData_bits_3_isDoubleLine(mainPipe_io_dataArray_toIData_bits_3_isDoubleLine),
    .io_dataArray_toIData_bits_3_vSetIdx_0(mainPipe_io_dataArray_toIData_bits_3_vSetIdx_0),
    .io_dataArray_toIData_bits_3_vSetIdx_1(mainPipe_io_dataArray_toIData_bits_3_vSetIdx_1),
    .io_dataArray_fromIData_datas_0_0(mainPipe_io_dataArray_fromIData_datas_0_0),
    .io_dataArray_fromIData_datas_0_1(mainPipe_io_dataArray_fromIData_datas_0_1),
    .io_dataArray_fromIData_datas_0_2(mainPipe_io_dataArray_fromIData_datas_0_2),
    .io_dataArray_fromIData_datas_0_3(mainPipe_io_dataArray_fromIData_datas_0_3),
    .io_dataArray_fromIData_datas_0_4(mainPipe_io_dataArray_fromIData_datas_0_4),
    .io_dataArray_fromIData_datas_0_5(mainPipe_io_dataArray_fromIData_datas_0_5),
    .io_dataArray_fromIData_datas_0_6(mainPipe_io_dataArray_fromIData_datas_0_6),
    .io_dataArray_fromIData_datas_0_7(mainPipe_io_dataArray_fromIData_datas_0_7),
    .io_dataArray_fromIData_datas_1_0(mainPipe_io_dataArray_fromIData_datas_1_0),
    .io_dataArray_fromIData_datas_1_1(mainPipe_io_dataArray_fromIData_datas_1_1),
    .io_dataArray_fromIData_datas_1_2(mainPipe_io_dataArray_fromIData_datas_1_2),
    .io_dataArray_fromIData_datas_1_3(mainPipe_io_dataArray_fromIData_datas_1_3),
    .io_dataArray_fromIData_datas_1_4(mainPipe_io_dataArray_fromIData_datas_1_4),
    .io_dataArray_fromIData_datas_1_5(mainPipe_io_dataArray_fromIData_datas_1_5),
    .io_dataArray_fromIData_datas_1_6(mainPipe_io_dataArray_fromIData_datas_1_6),
    .io_dataArray_fromIData_datas_1_7(mainPipe_io_dataArray_fromIData_datas_1_7),
    .io_dataArray_fromIData_codes_0_0(mainPipe_io_dataArray_fromIData_codes_0_0),
    .io_dataArray_fromIData_codes_0_1(mainPipe_io_dataArray_fromIData_codes_0_1),
    .io_dataArray_fromIData_codes_0_2(mainPipe_io_dataArray_fromIData_codes_0_2),
    .io_dataArray_fromIData_codes_0_3(mainPipe_io_dataArray_fromIData_codes_0_3),
    .io_dataArray_fromIData_codes_0_4(mainPipe_io_dataArray_fromIData_codes_0_4),
    .io_dataArray_fromIData_codes_0_5(mainPipe_io_dataArray_fromIData_codes_0_5),
    .io_dataArray_fromIData_codes_0_6(mainPipe_io_dataArray_fromIData_codes_0_6),
    .io_dataArray_fromIData_codes_0_7(mainPipe_io_dataArray_fromIData_codes_0_7),
    .io_dataArray_fromIData_codes_1_0(mainPipe_io_dataArray_fromIData_codes_1_0),
    .io_dataArray_fromIData_codes_1_1(mainPipe_io_dataArray_fromIData_codes_1_1),
    .io_dataArray_fromIData_codes_1_2(mainPipe_io_dataArray_fromIData_codes_1_2),
    .io_dataArray_fromIData_codes_1_3(mainPipe_io_dataArray_fromIData_codes_1_3),
    .io_dataArray_fromIData_codes_1_4(mainPipe_io_dataArray_fromIData_codes_1_4),
    .io_dataArray_fromIData_codes_1_5(mainPipe_io_dataArray_fromIData_codes_1_5),
    .io_dataArray_fromIData_codes_1_6(mainPipe_io_dataArray_fromIData_codes_1_6),
    .io_dataArray_fromIData_codes_1_7(mainPipe_io_dataArray_fromIData_codes_1_7),
    .io_mshr_0_toMSHR_ready(mainPipe_io_mshr_0_toMSHR_ready),
    .io_mshr_0_toMSHR_valid(mainPipe_io_mshr_0_toMSHR_valid),
    .io_mshr_0_toMSHR_bits_paddr(mainPipe_io_mshr_0_toMSHR_bits_paddr),
    .io_mshr_0_toMSHR_bits_vaddr(mainPipe_io_mshr_0_toMSHR_bits_vaddr),
    .io_mshr_0_toMSHR_bits_waymask(mainPipe_io_mshr_0_toMSHR_bits_waymask),
    .io_mshr_0_fromMSHR_valid(mainPipe_io_mshr_0_fromMSHR_valid),
    .io_mshr_0_fromMSHR_bits_data(mainPipe_io_mshr_0_fromMSHR_bits_data),
    .io_mshr_0_fromMSHR_bits_corrupt(mainPipe_io_mshr_0_fromMSHR_bits_corrupt),
    .io_mshr_1_toMSHR_ready(mainPipe_io_mshr_1_toMSHR_ready),
    .io_mshr_1_toMSHR_valid(mainPipe_io_mshr_1_toMSHR_valid),
    .io_mshr_1_toMSHR_bits_paddr(mainPipe_io_mshr_1_toMSHR_bits_paddr),
    .io_mshr_1_toMSHR_bits_vaddr(mainPipe_io_mshr_1_toMSHR_bits_vaddr),
    .io_mshr_1_toMSHR_bits_waymask(mainPipe_io_mshr_1_toMSHR_bits_waymask),
    .io_mshr_1_fromMSHR_valid(mainPipe_io_mshr_1_fromMSHR_valid),
    .io_mshr_1_fromMSHR_bits_data(mainPipe_io_mshr_1_fromMSHR_bits_data),
    .io_mshr_1_fromMSHR_bits_corrupt(mainPipe_io_mshr_1_fromMSHR_bits_corrupt),
    .io_errors_0_source_tag(mainPipe_io_errors_0_source_tag),
    .io_errors_0_source_data(mainPipe_io_errors_0_source_data),
    .io_errors_0_source_l2(mainPipe_io_errors_0_source_l2),
    .io_errors_0_paddr(mainPipe_io_errors_0_paddr),
    .io_errors_0_report_to_beu(mainPipe_io_errors_0_report_to_beu),
    .io_errors_0_valid(mainPipe_io_errors_0_valid),
    .io_errors_1_source_tag(mainPipe_io_errors_1_source_tag),
    .io_errors_1_source_data(mainPipe_io_errors_1_source_data),
    .io_errors_1_source_l2(mainPipe_io_errors_1_source_l2),
    .io_errors_1_paddr(mainPipe_io_errors_1_paddr),
    .io_errors_1_report_to_beu(mainPipe_io_errors_1_report_to_beu),
    .io_errors_1_valid(mainPipe_io_errors_1_valid),
    .io_fetch_req_ready(mainPipe_io_fetch_req_ready),
    .io_fetch_req_valid(mainPipe_io_fetch_req_valid),
    .io_fetch_req_bits_pcMemRead_0_startAddr(mainPipe_io_fetch_req_bits_pcMemRead_0_startAddr),
    .io_fetch_req_bits_pcMemRead_0_nextlineStart(mainPipe_io_fetch_req_bits_pcMemRead_0_nextlineStart),
    .io_fetch_req_bits_pcMemRead_1_startAddr(mainPipe_io_fetch_req_bits_pcMemRead_1_startAddr),
    .io_fetch_req_bits_pcMemRead_1_nextlineStart(mainPipe_io_fetch_req_bits_pcMemRead_1_nextlineStart),
    .io_fetch_req_bits_pcMemRead_2_startAddr(mainPipe_io_fetch_req_bits_pcMemRead_2_startAddr),
    .io_fetch_req_bits_pcMemRead_2_nextlineStart(mainPipe_io_fetch_req_bits_pcMemRead_2_nextlineStart),
    .io_fetch_req_bits_pcMemRead_3_startAddr(mainPipe_io_fetch_req_bits_pcMemRead_3_startAddr),
    .io_fetch_req_bits_pcMemRead_3_nextlineStart(mainPipe_io_fetch_req_bits_pcMemRead_3_nextlineStart),
    .io_fetch_req_bits_pcMemRead_4_startAddr(mainPipe_io_fetch_req_bits_pcMemRead_4_startAddr),
    .io_fetch_req_bits_pcMemRead_4_nextlineStart(mainPipe_io_fetch_req_bits_pcMemRead_4_nextlineStart),
    .io_fetch_req_bits_readValid_0(mainPipe_io_fetch_req_bits_readValid_0),
    .io_fetch_req_bits_readValid_1(mainPipe_io_fetch_req_bits_readValid_1),
    .io_fetch_req_bits_readValid_2(mainPipe_io_fetch_req_bits_readValid_2),
    .io_fetch_req_bits_readValid_3(mainPipe_io_fetch_req_bits_readValid_3),
    .io_fetch_req_bits_readValid_4(mainPipe_io_fetch_req_bits_readValid_4),
    .io_fetch_resp_0_valid(mainPipe_io_fetch_resp_0_valid),
    .io_fetch_resp_0_bits_vaddr(mainPipe_io_fetch_resp_0_bits_vaddr),
    .io_fetch_resp_0_bits_registerData(mainPipe_io_fetch_resp_0_bits_registerData),
    .io_fetch_resp_0_bits_sramData(mainPipe_io_fetch_resp_0_bits_sramData),
    .io_fetch_resp_0_bits_select(mainPipe_io_fetch_resp_0_bits_select),
    .io_fetch_resp_0_bits_paddr(mainPipe_io_fetch_resp_0_bits_paddr),
    .io_fetch_resp_0_bits_tlbExcp_pageFault(mainPipe_io_fetch_resp_0_bits_tlbExcp_pageFault),
    .io_fetch_resp_0_bits_tlbExcp_accessFault(mainPipe_io_fetch_resp_0_bits_tlbExcp_accessFault),
    .io_fetch_resp_0_bits_tlbExcp_mmio(mainPipe_io_fetch_resp_0_bits_tlbExcp_mmio),
    .io_fetch_resp_1_valid(mainPipe_io_fetch_resp_1_valid),
    .io_fetch_resp_1_bits_vaddr(mainPipe_io_fetch_resp_1_bits_vaddr),
    .io_fetch_resp_1_bits_registerData(mainPipe_io_fetch_resp_1_bits_registerData),
    .io_fetch_resp_1_bits_sramData(mainPipe_io_fetch_resp_1_bits_sramData),
    .io_fetch_resp_1_bits_select(mainPipe_io_fetch_resp_1_bits_select),
    .io_fetch_resp_1_bits_tlbExcp_pageFault(mainPipe_io_fetch_resp_1_bits_tlbExcp_pageFault),
    .io_fetch_resp_1_bits_tlbExcp_accessFault(mainPipe_io_fetch_resp_1_bits_tlbExcp_accessFault),
    .io_pmp_0_req_bits_addr(mainPipe_io_pmp_0_req_bits_addr),
    .io_pmp_0_resp_instr(mainPipe_io_pmp_0_resp_instr),
    .io_pmp_0_resp_mmio(mainPipe_io_pmp_0_resp_mmio),
    .io_pmp_1_req_bits_addr(mainPipe_io_pmp_1_req_bits_addr),
    .io_pmp_1_resp_instr(mainPipe_io_pmp_1_resp_instr),
    .io_itlb_0_req_ready(mainPipe_io_itlb_0_req_ready),
    .io_itlb_0_req_valid(mainPipe_io_itlb_0_req_valid),
    .io_itlb_0_req_bits_vaddr(mainPipe_io_itlb_0_req_bits_vaddr),
    .io_itlb_0_req_bits_kill(mainPipe_io_itlb_0_req_bits_kill),
    .io_itlb_0_resp_ready(mainPipe_io_itlb_0_resp_ready),
    .io_itlb_0_resp_valid(mainPipe_io_itlb_0_resp_valid),
    .io_itlb_0_resp_bits_paddr_0(mainPipe_io_itlb_0_resp_bits_paddr_0),
    .io_itlb_0_resp_bits_excp_0_pf_instr(mainPipe_io_itlb_0_resp_bits_excp_0_pf_instr),
    .io_itlb_0_resp_bits_excp_0_af_instr(mainPipe_io_itlb_0_resp_bits_excp_0_af_instr),
    .io_itlb_1_req_ready(mainPipe_io_itlb_1_req_ready),
    .io_itlb_1_req_valid(mainPipe_io_itlb_1_req_valid),
    .io_itlb_1_req_bits_vaddr(mainPipe_io_itlb_1_req_bits_vaddr),
    .io_itlb_1_req_bits_kill(mainPipe_io_itlb_1_req_bits_kill),
    .io_itlb_1_resp_ready(mainPipe_io_itlb_1_resp_ready),
    .io_itlb_1_resp_valid(mainPipe_io_itlb_1_resp_valid),
    .io_itlb_1_resp_bits_paddr_0(mainPipe_io_itlb_1_resp_bits_paddr_0),
    .io_itlb_1_resp_bits_excp_0_pf_instr(mainPipe_io_itlb_1_resp_bits_excp_0_pf_instr),
    .io_itlb_1_resp_bits_excp_0_af_instr(mainPipe_io_itlb_1_resp_bits_excp_0_af_instr),
    .io_respStall(mainPipe_io_respStall),
    .io_perfInfo_only_0_hit(mainPipe_io_perfInfo_only_0_hit),
    .io_perfInfo_only_0_miss(mainPipe_io_perfInfo_only_0_miss),
    .io_perfInfo_hit_0_hit_1(mainPipe_io_perfInfo_hit_0_hit_1),
    .io_perfInfo_hit_0_miss_1(mainPipe_io_perfInfo_hit_0_miss_1),
    .io_perfInfo_miss_0_hit_1(mainPipe_io_perfInfo_miss_0_hit_1),
    .io_perfInfo_miss_0_miss_1(mainPipe_io_perfInfo_miss_0_miss_1),
    .io_perfInfo_hit_0_except_1(mainPipe_io_perfInfo_hit_0_except_1),
    .io_perfInfo_miss_0_except_1(mainPipe_io_perfInfo_miss_0_except_1),
    .io_perfInfo_except_0(mainPipe_io_perfInfo_except_0),
    .io_perfInfo_bank_hit_1(mainPipe_io_perfInfo_bank_hit_1),
    .io_perfInfo_hit(mainPipe_io_perfInfo_hit),
    .io_csr_parity_enable(mainPipe_io_csr_parity_enable)
  );
  ICacheMissUnit missUnit ( // @[ICache.scala 501:29]
    .clock(missUnit_clock),
    .reset(missUnit_reset),
    .io_req_0_ready(missUnit_io_req_0_ready),
    .io_req_0_valid(missUnit_io_req_0_valid),
    .io_req_0_bits_paddr(missUnit_io_req_0_bits_paddr),
    .io_req_0_bits_vaddr(missUnit_io_req_0_bits_vaddr),
    .io_req_0_bits_waymask(missUnit_io_req_0_bits_waymask),
    .io_req_1_ready(missUnit_io_req_1_ready),
    .io_req_1_valid(missUnit_io_req_1_valid),
    .io_req_1_bits_paddr(missUnit_io_req_1_bits_paddr),
    .io_req_1_bits_vaddr(missUnit_io_req_1_bits_vaddr),
    .io_req_1_bits_waymask(missUnit_io_req_1_bits_waymask),
    .io_resp_0_valid(missUnit_io_resp_0_valid),
    .io_resp_0_bits_data(missUnit_io_resp_0_bits_data),
    .io_resp_0_bits_corrupt(missUnit_io_resp_0_bits_corrupt),
    .io_resp_1_valid(missUnit_io_resp_1_valid),
    .io_resp_1_bits_data(missUnit_io_resp_1_bits_data),
    .io_resp_1_bits_corrupt(missUnit_io_resp_1_bits_corrupt),
    .io_mem_acquire_ready(missUnit_io_mem_acquire_ready),
    .io_mem_acquire_valid(missUnit_io_mem_acquire_valid),
    .io_mem_acquire_bits_opcode(missUnit_io_mem_acquire_bits_opcode),
    .io_mem_acquire_bits_size(missUnit_io_mem_acquire_bits_size),
    .io_mem_acquire_bits_source(missUnit_io_mem_acquire_bits_source),
    .io_mem_acquire_bits_address(missUnit_io_mem_acquire_bits_address),
    .io_mem_acquire_bits_mask(missUnit_io_mem_acquire_bits_mask),
    .io_mem_grant_valid(missUnit_io_mem_grant_valid),
    .io_mem_grant_bits_opcode(missUnit_io_mem_grant_bits_opcode),
    .io_mem_grant_bits_param(missUnit_io_mem_grant_bits_param),
    .io_mem_grant_bits_source(missUnit_io_mem_grant_bits_source),
    .io_mem_grant_bits_sink(missUnit_io_mem_grant_bits_sink),
    .io_mem_grant_bits_echo_blockisdirty(missUnit_io_mem_grant_bits_echo_blockisdirty),
    .io_mem_grant_bits_data(missUnit_io_mem_grant_bits_data),
    .io_mem_grant_bits_corrupt(missUnit_io_mem_grant_bits_corrupt),
    .io_mem_finish_ready(missUnit_io_mem_finish_ready),
    .io_mem_finish_valid(missUnit_io_mem_finish_valid),
    .io_mem_finish_bits_sink(missUnit_io_mem_finish_bits_sink),
    .io_meta_write_ready(missUnit_io_meta_write_ready),
    .io_meta_write_valid(missUnit_io_meta_write_valid),
    .io_meta_write_bits_virIdx(missUnit_io_meta_write_bits_virIdx),
    .io_meta_write_bits_phyTag(missUnit_io_meta_write_bits_phyTag),
    .io_meta_write_bits_coh_state(missUnit_io_meta_write_bits_coh_state),
    .io_meta_write_bits_waymask(missUnit_io_meta_write_bits_waymask),
    .io_meta_write_bits_bankIdx(missUnit_io_meta_write_bits_bankIdx),
    .io_data_write_valid(missUnit_io_data_write_valid),
    .io_data_write_bits_virIdx(missUnit_io_data_write_bits_virIdx),
    .io_data_write_bits_data(missUnit_io_data_write_bits_data),
    .io_data_write_bits_waymask(missUnit_io_data_write_bits_waymask),
    .io_data_write_bits_bankIdx(missUnit_io_data_write_bits_bankIdx),
    .io_release_req_ready(missUnit_io_release_req_ready),
    .io_release_req_valid(missUnit_io_release_req_valid),
    .io_release_req_bits_paddr(missUnit_io_release_req_bits_paddr),
    .io_release_req_bits_vaddr(missUnit_io_release_req_bits_vaddr),
    .io_release_req_bits_param(missUnit_io_release_req_bits_param),
    .io_release_req_bits_voluntary(missUnit_io_release_req_bits_voluntary),
    .io_release_req_bits_needData(missUnit_io_release_req_bits_needData),
    .io_release_req_bits_waymask(missUnit_io_release_req_bits_waymask),
    .io_release_req_bits_id(missUnit_io_release_req_bits_id),
    .io_release_resp_valid(missUnit_io_release_resp_valid),
    .io_release_resp_bits(missUnit_io_release_resp_bits),
    .io_victimInfor_0_valid(missUnit_io_victimInfor_0_valid),
    .io_victimInfor_0_vidx(missUnit_io_victimInfor_0_vidx),
    .io_victimInfor_1_valid(missUnit_io_victimInfor_1_valid),
    .io_victimInfor_1_vidx(missUnit_io_victimInfor_1_vidx)
  );
  ReleaseUnit releaseUnit ( // @[ICache.scala 502:30]
    .clock(releaseUnit_clock),
    .reset(releaseUnit_reset),
    .io_req_ready(releaseUnit_io_req_ready),
    .io_req_valid(releaseUnit_io_req_valid),
    .io_req_bits_addr(releaseUnit_io_req_bits_addr),
    .io_req_bits_param(releaseUnit_io_req_bits_param),
    .io_req_bits_voluntary(releaseUnit_io_req_bits_voluntary),
    .io_req_bits_hasData(releaseUnit_io_req_bits_hasData),
    .io_req_bits_dirty(releaseUnit_io_req_bits_dirty),
    .io_req_bits_data(releaseUnit_io_req_bits_data),
    .io_finish(releaseUnit_io_finish),
    .io_mem_release_ready(releaseUnit_io_mem_release_ready),
    .io_mem_release_valid(releaseUnit_io_mem_release_valid),
    .io_mem_release_bits_opcode(releaseUnit_io_mem_release_bits_opcode),
    .io_mem_release_bits_param(releaseUnit_io_mem_release_bits_param),
    .io_mem_release_bits_address(releaseUnit_io_mem_release_bits_address),
    .io_mem_release_bits_echo_blockisdirty(releaseUnit_io_mem_release_bits_echo_blockisdirty),
    .io_mem_release_bits_data(releaseUnit_io_mem_release_bits_data),
    .io_mem_grant_ready(releaseUnit_io_mem_grant_ready),
    .io_mem_grant_valid(releaseUnit_io_mem_grant_valid),
    .io_mem_grant_bits_source(releaseUnit_io_mem_grant_bits_source)
  );
  ICacheReplacePipe replacePipe ( // @[ICache.scala 503:31]
    .clock(replacePipe_clock),
    .reset(replacePipe_reset),
    .io_pipe_req_ready(replacePipe_io_pipe_req_ready),
    .io_pipe_req_valid(replacePipe_io_pipe_req_valid),
    .io_pipe_req_bits_paddr(replacePipe_io_pipe_req_bits_paddr),
    .io_pipe_req_bits_vaddr(replacePipe_io_pipe_req_bits_vaddr),
    .io_pipe_req_bits_param(replacePipe_io_pipe_req_bits_param),
    .io_pipe_req_bits_voluntary(replacePipe_io_pipe_req_bits_voluntary),
    .io_pipe_req_bits_needData(replacePipe_io_pipe_req_bits_needData),
    .io_pipe_req_bits_waymask(replacePipe_io_pipe_req_bits_waymask),
    .io_pipe_req_bits_id(replacePipe_io_pipe_req_bits_id),
    .io_meta_read_ready(replacePipe_io_meta_read_ready),
    .io_meta_read_valid(replacePipe_io_meta_read_valid),
    .io_meta_read_bits_vSetIdx_0(replacePipe_io_meta_read_bits_vSetIdx_0),
    .io_data_read_ready(replacePipe_io_data_read_ready),
    .io_data_read_valid(replacePipe_io_data_read_valid),
    .io_data_read_bits_0_vSetIdx_0(replacePipe_io_data_read_bits_0_vSetIdx_0),
    .io_data_read_bits_1_vSetIdx_0(replacePipe_io_data_read_bits_1_vSetIdx_0),
    .io_data_read_bits_2_vSetIdx_0(replacePipe_io_data_read_bits_2_vSetIdx_0),
    .io_data_read_bits_3_vSetIdx_0(replacePipe_io_data_read_bits_3_vSetIdx_0),
    .io_error_source_tag(replacePipe_io_error_source_tag),
    .io_error_source_data(replacePipe_io_error_source_data),
    .io_error_opType_probe(replacePipe_io_error_opType_probe),
    .io_error_opType_release(replacePipe_io_error_opType_release),
    .io_error_paddr(replacePipe_io_error_paddr),
    .io_error_report_to_beu(replacePipe_io_error_report_to_beu),
    .io_error_valid(replacePipe_io_error_valid),
    .io_meta_response_metaData_0_0_coh_state(replacePipe_io_meta_response_metaData_0_0_coh_state),
    .io_meta_response_metaData_0_0_tag(replacePipe_io_meta_response_metaData_0_0_tag),
    .io_meta_response_metaData_0_1_coh_state(replacePipe_io_meta_response_metaData_0_1_coh_state),
    .io_meta_response_metaData_0_1_tag(replacePipe_io_meta_response_metaData_0_1_tag),
    .io_meta_response_metaData_0_2_coh_state(replacePipe_io_meta_response_metaData_0_2_coh_state),
    .io_meta_response_metaData_0_2_tag(replacePipe_io_meta_response_metaData_0_2_tag),
    .io_meta_response_metaData_0_3_coh_state(replacePipe_io_meta_response_metaData_0_3_coh_state),
    .io_meta_response_metaData_0_3_tag(replacePipe_io_meta_response_metaData_0_3_tag),
    .io_meta_response_metaData_0_4_coh_state(replacePipe_io_meta_response_metaData_0_4_coh_state),
    .io_meta_response_metaData_0_4_tag(replacePipe_io_meta_response_metaData_0_4_tag),
    .io_meta_response_metaData_0_5_coh_state(replacePipe_io_meta_response_metaData_0_5_coh_state),
    .io_meta_response_metaData_0_5_tag(replacePipe_io_meta_response_metaData_0_5_tag),
    .io_meta_response_metaData_0_6_coh_state(replacePipe_io_meta_response_metaData_0_6_coh_state),
    .io_meta_response_metaData_0_6_tag(replacePipe_io_meta_response_metaData_0_6_tag),
    .io_meta_response_metaData_0_7_coh_state(replacePipe_io_meta_response_metaData_0_7_coh_state),
    .io_meta_response_metaData_0_7_tag(replacePipe_io_meta_response_metaData_0_7_tag),
    .io_meta_response_errors_0_0(replacePipe_io_meta_response_errors_0_0),
    .io_meta_response_errors_0_1(replacePipe_io_meta_response_errors_0_1),
    .io_meta_response_errors_0_2(replacePipe_io_meta_response_errors_0_2),
    .io_meta_response_errors_0_3(replacePipe_io_meta_response_errors_0_3),
    .io_meta_response_errors_0_4(replacePipe_io_meta_response_errors_0_4),
    .io_meta_response_errors_0_5(replacePipe_io_meta_response_errors_0_5),
    .io_meta_response_errors_0_6(replacePipe_io_meta_response_errors_0_6),
    .io_meta_response_errors_0_7(replacePipe_io_meta_response_errors_0_7),
    .io_data_response_datas_0_0(replacePipe_io_data_response_datas_0_0),
    .io_data_response_datas_0_1(replacePipe_io_data_response_datas_0_1),
    .io_data_response_datas_0_2(replacePipe_io_data_response_datas_0_2),
    .io_data_response_datas_0_3(replacePipe_io_data_response_datas_0_3),
    .io_data_response_datas_0_4(replacePipe_io_data_response_datas_0_4),
    .io_data_response_datas_0_5(replacePipe_io_data_response_datas_0_5),
    .io_data_response_datas_0_6(replacePipe_io_data_response_datas_0_6),
    .io_data_response_datas_0_7(replacePipe_io_data_response_datas_0_7),
    .io_data_response_codes_0_0(replacePipe_io_data_response_codes_0_0),
    .io_data_response_codes_0_1(replacePipe_io_data_response_codes_0_1),
    .io_data_response_codes_0_2(replacePipe_io_data_response_codes_0_2),
    .io_data_response_codes_0_3(replacePipe_io_data_response_codes_0_3),
    .io_data_response_codes_0_4(replacePipe_io_data_response_codes_0_4),
    .io_data_response_codes_0_5(replacePipe_io_data_response_codes_0_5),
    .io_data_response_codes_0_6(replacePipe_io_data_response_codes_0_6),
    .io_data_response_codes_0_7(replacePipe_io_data_response_codes_0_7),
    .io_meta_write_valid(replacePipe_io_meta_write_valid),
    .io_meta_write_bits_virIdx(replacePipe_io_meta_write_bits_virIdx),
    .io_meta_write_bits_phyTag(replacePipe_io_meta_write_bits_phyTag),
    .io_meta_write_bits_coh_state(replacePipe_io_meta_write_bits_coh_state),
    .io_meta_write_bits_waymask(replacePipe_io_meta_write_bits_waymask),
    .io_meta_write_bits_bankIdx(replacePipe_io_meta_write_bits_bankIdx),
    .io_release_req_ready(replacePipe_io_release_req_ready),
    .io_release_req_valid(replacePipe_io_release_req_valid),
    .io_release_req_bits_addr(replacePipe_io_release_req_bits_addr),
    .io_release_req_bits_param(replacePipe_io_release_req_bits_param),
    .io_release_req_bits_voluntary(replacePipe_io_release_req_bits_voluntary),
    .io_release_req_bits_hasData(replacePipe_io_release_req_bits_hasData),
    .io_release_req_bits_dirty(replacePipe_io_release_req_bits_dirty),
    .io_release_req_bits_data(replacePipe_io_release_req_bits_data),
    .io_release_finish(replacePipe_io_release_finish),
    .io_pipe_resp_valid(replacePipe_io_pipe_resp_valid),
    .io_pipe_resp_bits(replacePipe_io_pipe_resp_bits),
    .io_status_r0_set_valid(replacePipe_io_status_r0_set_valid),
    .io_status_r0_set_bits(replacePipe_io_status_r0_set_bits),
    .io_status_r1_set_valid(replacePipe_io_status_r1_set_valid),
    .io_status_r1_set_bits(replacePipe_io_status_r1_set_bits),
    .io_status_r2_set_valid(replacePipe_io_status_r2_set_valid),
    .io_status_r2_set_bits(replacePipe_io_status_r2_set_bits),
    .io_status_r3_set_valid(replacePipe_io_status_r3_set_valid),
    .io_status_r3_set_bits(replacePipe_io_status_r3_set_bits),
    .io_csr_parity_enable(replacePipe_io_csr_parity_enable)
  );
  ICacheProbeQueue probeQueue ( // @[ICache.scala 504:30]
    .clock(probeQueue_clock),
    .reset(probeQueue_reset),
    .io_mem_probe_ready(probeQueue_io_mem_probe_ready),
    .io_mem_probe_valid(probeQueue_io_mem_probe_valid),
    .io_mem_probe_bits_param(probeQueue_io_mem_probe_bits_param),
    .io_mem_probe_bits_address(probeQueue_io_mem_probe_bits_address),
    .io_mem_probe_bits_data(probeQueue_io_mem_probe_bits_data),
    .io_pipe_req_ready(probeQueue_io_pipe_req_ready),
    .io_pipe_req_valid(probeQueue_io_pipe_req_valid),
    .io_pipe_req_bits_paddr(probeQueue_io_pipe_req_bits_paddr),
    .io_pipe_req_bits_vaddr(probeQueue_io_pipe_req_bits_vaddr),
    .io_pipe_req_bits_param(probeQueue_io_pipe_req_bits_param),
    .io_pipe_req_bits_needData(probeQueue_io_pipe_req_bits_needData),
    .io_pipe_req_bits_id(probeQueue_io_pipe_req_bits_id)
  );
  Arbiter_4 meta_read_arb ( // @[ICache.scala 507:31]
    .io_in_0_ready(meta_read_arb_io_in_0_ready),
    .io_in_0_valid(meta_read_arb_io_in_0_valid),
    .io_in_0_bits_vSetIdx_0(meta_read_arb_io_in_0_bits_vSetIdx_0),
    .io_in_1_ready(meta_read_arb_io_in_1_ready),
    .io_in_1_valid(meta_read_arb_io_in_1_valid),
    .io_in_1_bits_isDoubleLine(meta_read_arb_io_in_1_bits_isDoubleLine),
    .io_in_1_bits_vSetIdx_0(meta_read_arb_io_in_1_bits_vSetIdx_0),
    .io_in_1_bits_vSetIdx_1(meta_read_arb_io_in_1_bits_vSetIdx_1),
    .io_out_ready(meta_read_arb_io_out_ready),
    .io_out_valid(meta_read_arb_io_out_valid),
    .io_out_bits_isDoubleLine(meta_read_arb_io_out_bits_isDoubleLine),
    .io_out_bits_vSetIdx_0(meta_read_arb_io_out_bits_vSetIdx_0),
    .io_out_bits_vSetIdx_1(meta_read_arb_io_out_bits_vSetIdx_1)
  );
  Arbiter_5 data_read_arb ( // @[ICache.scala 508:31]
    .io_in_0_ready(data_read_arb_io_in_0_ready),
    .io_in_0_valid(data_read_arb_io_in_0_valid),
    .io_in_0_bits_0_vSetIdx_0(data_read_arb_io_in_0_bits_0_vSetIdx_0),
    .io_in_0_bits_1_vSetIdx_0(data_read_arb_io_in_0_bits_1_vSetIdx_0),
    .io_in_0_bits_2_vSetIdx_0(data_read_arb_io_in_0_bits_2_vSetIdx_0),
    .io_in_0_bits_3_vSetIdx_0(data_read_arb_io_in_0_bits_3_vSetIdx_0),
    .io_in_1_ready(data_read_arb_io_in_1_ready),
    .io_in_1_valid(data_read_arb_io_in_1_valid),
    .io_in_1_bits_0_isDoubleLine(data_read_arb_io_in_1_bits_0_isDoubleLine),
    .io_in_1_bits_0_vSetIdx_0(data_read_arb_io_in_1_bits_0_vSetIdx_0),
    .io_in_1_bits_0_vSetIdx_1(data_read_arb_io_in_1_bits_0_vSetIdx_1),
    .io_in_1_bits_1_isDoubleLine(data_read_arb_io_in_1_bits_1_isDoubleLine),
    .io_in_1_bits_1_vSetIdx_0(data_read_arb_io_in_1_bits_1_vSetIdx_0),
    .io_in_1_bits_1_vSetIdx_1(data_read_arb_io_in_1_bits_1_vSetIdx_1),
    .io_in_1_bits_2_isDoubleLine(data_read_arb_io_in_1_bits_2_isDoubleLine),
    .io_in_1_bits_2_vSetIdx_0(data_read_arb_io_in_1_bits_2_vSetIdx_0),
    .io_in_1_bits_2_vSetIdx_1(data_read_arb_io_in_1_bits_2_vSetIdx_1),
    .io_in_1_bits_3_isDoubleLine(data_read_arb_io_in_1_bits_3_isDoubleLine),
    .io_in_1_bits_3_vSetIdx_0(data_read_arb_io_in_1_bits_3_vSetIdx_0),
    .io_in_1_bits_3_vSetIdx_1(data_read_arb_io_in_1_bits_3_vSetIdx_1),
    .io_out_ready(data_read_arb_io_out_ready),
    .io_out_valid(data_read_arb_io_out_valid),
    .io_out_bits_0_isDoubleLine(data_read_arb_io_out_bits_0_isDoubleLine),
    .io_out_bits_0_vSetIdx_0(data_read_arb_io_out_bits_0_vSetIdx_0),
    .io_out_bits_0_vSetIdx_1(data_read_arb_io_out_bits_0_vSetIdx_1),
    .io_out_bits_1_isDoubleLine(data_read_arb_io_out_bits_1_isDoubleLine),
    .io_out_bits_1_vSetIdx_0(data_read_arb_io_out_bits_1_vSetIdx_0),
    .io_out_bits_1_vSetIdx_1(data_read_arb_io_out_bits_1_vSetIdx_1),
    .io_out_bits_2_isDoubleLine(data_read_arb_io_out_bits_2_isDoubleLine),
    .io_out_bits_2_vSetIdx_0(data_read_arb_io_out_bits_2_vSetIdx_0),
    .io_out_bits_2_vSetIdx_1(data_read_arb_io_out_bits_2_vSetIdx_1),
    .io_out_bits_3_isDoubleLine(data_read_arb_io_out_bits_3_isDoubleLine),
    .io_out_bits_3_vSetIdx_0(data_read_arb_io_out_bits_3_vSetIdx_0),
    .io_out_bits_3_vSetIdx_1(data_read_arb_io_out_bits_3_vSetIdx_1)
  );
  Arbiter_1 meta_write_arb ( // @[ICache.scala 509:31]
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
  Arbiter_3 replace_req_arb ( // @[ICache.scala 510:31]
    .io_in_0_ready(replace_req_arb_io_in_0_ready),
    .io_in_0_valid(replace_req_arb_io_in_0_valid),
    .io_in_0_bits_paddr(replace_req_arb_io_in_0_bits_paddr),
    .io_in_0_bits_vaddr(replace_req_arb_io_in_0_bits_vaddr),
    .io_in_0_bits_param(replace_req_arb_io_in_0_bits_param),
    .io_in_0_bits_voluntary(replace_req_arb_io_in_0_bits_voluntary),
    .io_in_0_bits_needData(replace_req_arb_io_in_0_bits_needData),
    .io_in_0_bits_waymask(replace_req_arb_io_in_0_bits_waymask),
    .io_in_0_bits_id(replace_req_arb_io_in_0_bits_id),
    .io_in_1_ready(replace_req_arb_io_in_1_ready),
    .io_in_1_valid(replace_req_arb_io_in_1_valid),
    .io_in_1_bits_paddr(replace_req_arb_io_in_1_bits_paddr),
    .io_in_1_bits_vaddr(replace_req_arb_io_in_1_bits_vaddr),
    .io_in_1_bits_param(replace_req_arb_io_in_1_bits_param),
    .io_in_1_bits_voluntary(replace_req_arb_io_in_1_bits_voluntary),
    .io_in_1_bits_needData(replace_req_arb_io_in_1_bits_needData),
    .io_in_1_bits_waymask(replace_req_arb_io_in_1_bits_waymask),
    .io_in_1_bits_id(replace_req_arb_io_in_1_bits_id),
    .io_out_ready(replace_req_arb_io_out_ready),
    .io_out_valid(replace_req_arb_io_out_valid),
    .io_out_bits_paddr(replace_req_arb_io_out_bits_paddr),
    .io_out_bits_vaddr(replace_req_arb_io_out_bits_vaddr),
    .io_out_bits_param(replace_req_arb_io_out_bits_param),
    .io_out_bits_voluntary(replace_req_arb_io_out_bits_voluntary),
    .io_out_bits_needData(replace_req_arb_io_out_bits_needData),
    .io_out_bits_waymask(replace_req_arb_io_out_bits_waymask),
    .io_out_bits_id(replace_req_arb_io_out_bits_id)
  );
  CSRCacheOpDecoder cacheOpDecoder ( // @[ICache.scala 690:30]
    .clock(cacheOpDecoder_clock),
    .reset(cacheOpDecoder_reset),
    .io_csr_distribute_csr_wvalid(cacheOpDecoder_io_csr_distribute_csr_wvalid),
    .io_csr_distribute_csr_waddr(cacheOpDecoder_io_csr_distribute_csr_waddr),
    .io_csr_distribute_csr_wdata(cacheOpDecoder_io_csr_distribute_csr_wdata),
    .io_csr_update_wvalid(cacheOpDecoder_io_csr_update_wvalid),
    .io_csr_update_waddr(cacheOpDecoder_io_csr_update_waddr),
    .io_csr_update_wdata(cacheOpDecoder_io_csr_update_wdata),
    .io_cache_req_valid(cacheOpDecoder_io_cache_req_valid),
    .io_cache_req_bits_wayNum(cacheOpDecoder_io_cache_req_bits_wayNum),
    .io_cache_req_bits_index(cacheOpDecoder_io_cache_req_bits_index),
    .io_cache_req_bits_opCode(cacheOpDecoder_io_cache_req_bits_opCode),
    .io_cache_req_bits_write_tag_low(cacheOpDecoder_io_cache_req_bits_write_tag_low),
    .io_cache_req_bits_write_data_vec_0(cacheOpDecoder_io_cache_req_bits_write_data_vec_0),
    .io_cache_req_bits_write_data_vec_1(cacheOpDecoder_io_cache_req_bits_write_data_vec_1),
    .io_cache_req_bits_write_data_vec_2(cacheOpDecoder_io_cache_req_bits_write_data_vec_2),
    .io_cache_req_bits_write_data_vec_3(cacheOpDecoder_io_cache_req_bits_write_data_vec_3),
    .io_cache_req_bits_write_data_vec_4(cacheOpDecoder_io_cache_req_bits_write_data_vec_4),
    .io_cache_req_bits_write_data_vec_5(cacheOpDecoder_io_cache_req_bits_write_data_vec_5),
    .io_cache_req_bits_write_data_vec_6(cacheOpDecoder_io_cache_req_bits_write_data_vec_6),
    .io_cache_req_bits_write_data_vec_7(cacheOpDecoder_io_cache_req_bits_write_data_vec_7),
    .io_cache_req_bits_bank_num(cacheOpDecoder_io_cache_req_bits_bank_num),
    .io_cache_resp_valid(cacheOpDecoder_io_cache_resp_valid),
    .io_cache_resp_bits_read_tag_low(cacheOpDecoder_io_cache_resp_bits_read_tag_low),
    .io_cache_resp_bits_read_data_vec_0(cacheOpDecoder_io_cache_resp_bits_read_data_vec_0),
    .io_cache_resp_bits_read_data_vec_1(cacheOpDecoder_io_cache_resp_bits_read_data_vec_1),
    .io_cache_resp_bits_read_data_vec_2(cacheOpDecoder_io_cache_resp_bits_read_data_vec_2),
    .io_cache_resp_bits_read_data_vec_3(cacheOpDecoder_io_cache_resp_bits_read_data_vec_3),
    .io_cache_resp_bits_read_data_vec_4(cacheOpDecoder_io_cache_resp_bits_read_data_vec_4),
    .io_cache_resp_bits_read_data_vec_5(cacheOpDecoder_io_cache_resp_bits_read_data_vec_5),
    .io_cache_resp_bits_read_data_vec_6(cacheOpDecoder_io_cache_resp_bits_read_data_vec_6),
    .io_cache_resp_bits_read_data_vec_7(cacheOpDecoder_io_cache_resp_bits_read_data_vec_7),
    .io_error_source_tag(cacheOpDecoder_io_error_source_tag),
    .io_error_source_data(cacheOpDecoder_io_error_source_data),
    .io_error_source_l2(cacheOpDecoder_io_error_source_l2),
    .io_error_opType_fetch(cacheOpDecoder_io_error_opType_fetch),
    .io_error_opType_load(cacheOpDecoder_io_error_opType_load),
    .io_error_opType_store(cacheOpDecoder_io_error_opType_store),
    .io_error_opType_probe(cacheOpDecoder_io_error_opType_probe),
    .io_error_opType_release(cacheOpDecoder_io_error_opType_release),
    .io_error_opType_atom(cacheOpDecoder_io_error_opType_atom),
    .io_error_paddr(cacheOpDecoder_io_error_paddr),
    .io_error_report_to_beu(cacheOpDecoder_io_error_report_to_beu),
    .io_error_valid(cacheOpDecoder_io_error_valid)
  );
  assign auto_client_out_a_valid = missUnit_io_mem_acquire_valid; // @[Nodes.scala 1207:84 ICache.scala 604:9]
  assign auto_client_out_a_bits_opcode = missUnit_io_mem_acquire_bits_opcode; // @[Nodes.scala 1207:84 ICache.scala 604:9]
  assign auto_client_out_a_bits_size = missUnit_io_mem_acquire_bits_size; // @[Nodes.scala 1207:84 ICache.scala 604:9]
  assign auto_client_out_a_bits_source = missUnit_io_mem_acquire_bits_source; // @[Nodes.scala 1207:84 ICache.scala 604:9]
  assign auto_client_out_a_bits_address = missUnit_io_mem_acquire_bits_address; // @[Nodes.scala 1207:84 ICache.scala 604:9]
  assign auto_client_out_a_bits_mask = missUnit_io_mem_acquire_bits_mask; // @[Nodes.scala 1207:84 ICache.scala 604:9]
  assign auto_client_out_bready = probeQueue_io_mem_probe_ready; // @[Nodes.scala 1207:84 ICache.scala 619:30]
  assign auto_client_out_c_valid = releaseUnit_io_mem_release_valid; // @[Nodes.scala 1207:84 ICache.scala 609:9]
  assign auto_client_out_c_bits_opcode = releaseUnit_io_mem_release_bits_opcode; // @[Nodes.scala 1207:84 ICache.scala 609:9]
  assign auto_client_out_c_bits_param = releaseUnit_io_mem_release_bits_param; // @[Nodes.scala 1207:84 ICache.scala 609:9]
  assign auto_client_out_c_bits_address = releaseUnit_io_mem_release_bits_address; // @[Nodes.scala 1207:84 ICache.scala 609:9]
  assign auto_client_out_c_bits_echo_blockisdirty = releaseUnit_io_mem_release_bits_echo_blockisdirty; // @[Nodes.scala 1207:84 ICache.scala 609:9]
  assign auto_client_out_c_bits_data = releaseUnit_io_mem_release_bits_data; // @[Nodes.scala 1207:84 ICache.scala 609:9]
  assign auto_client_out_d_ready = auto_client_out_d_bits_opcode == 3'h5 | _GEN_2; // @[ICache.scala 675:54 676:27]
  assign auto_client_out_e_valid = missUnit_io_mem_finish_valid; // @[Nodes.scala 1207:84 ICache.scala 605:9]
  assign auto_client_out_e_bits_sink = missUnit_io_mem_finish_bits_sink; // @[Nodes.scala 1207:84 ICache.scala 605:9]
  assign io_fetch_req_ready = mainPipe_io_fetch_req_ready; // @[ICache.scala 672:25]
  assign io_fetch_resp_0_valid = mainPipe_io_fetch_resp_0_valid; // @[ICache.scala 587:21]
  assign io_fetch_resp_0_bits_vaddr = mainPipe_io_fetch_resp_0_bits_vaddr; // @[ICache.scala 587:21]
  assign io_fetch_resp_0_bits_registerData = mainPipe_io_fetch_resp_0_bits_registerData; // @[ICache.scala 587:21]
  assign io_fetch_resp_0_bits_sramData = mainPipe_io_fetch_resp_0_bits_sramData; // @[ICache.scala 587:21]
  assign io_fetch_resp_0_bits_select = mainPipe_io_fetch_resp_0_bits_select; // @[ICache.scala 587:21]
  assign io_fetch_resp_0_bits_paddr = mainPipe_io_fetch_resp_0_bits_paddr; // @[ICache.scala 587:21]
  assign io_fetch_resp_0_bits_tlbExcp_pageFault = mainPipe_io_fetch_resp_0_bits_tlbExcp_pageFault; // @[ICache.scala 587:21]
  assign io_fetch_resp_0_bits_tlbExcp_accessFault = mainPipe_io_fetch_resp_0_bits_tlbExcp_accessFault; // @[ICache.scala 587:21]
  assign io_fetch_resp_0_bits_tlbExcp_mmio = mainPipe_io_fetch_resp_0_bits_tlbExcp_mmio; // @[ICache.scala 587:21]
  assign io_fetch_resp_1_valid = mainPipe_io_fetch_resp_1_valid; // @[ICache.scala 587:21]
  assign io_fetch_resp_1_bits_vaddr = mainPipe_io_fetch_resp_1_bits_vaddr; // @[ICache.scala 587:21]
  assign io_fetch_resp_1_bits_registerData = mainPipe_io_fetch_resp_1_bits_registerData; // @[ICache.scala 587:21]
  assign io_fetch_resp_1_bits_sramData = mainPipe_io_fetch_resp_1_bits_sramData; // @[ICache.scala 587:21]
  assign io_fetch_resp_1_bits_select = mainPipe_io_fetch_resp_1_bits_select; // @[ICache.scala 587:21]
  assign io_fetch_resp_1_bits_tlbExcp_pageFault = mainPipe_io_fetch_resp_1_bits_tlbExcp_pageFault; // @[ICache.scala 587:21]
  assign io_fetch_resp_1_bits_tlbExcp_accessFault = mainPipe_io_fetch_resp_1_bits_tlbExcp_accessFault; // @[ICache.scala 587:21]
  assign io_toIFU = mainPipe_io_fetch_req_ready; // @[ICache.scala 566:12]
  assign io_pmp_0_req_bits_addr = mainPipe_io_pmp_0_req_bits_addr; // @[ICache.scala 558:13]
  assign io_pmp_1_req_bits_addr = mainPipe_io_pmp_1_req_bits_addr; // @[ICache.scala 559:13]
  assign io_itlb_0_req_valid = mainPipe_io_itlb_0_req_valid; // @[ICache.scala 580:21]
  assign io_itlb_0_req_bits_vaddr = mainPipe_io_itlb_0_req_bits_vaddr; // @[ICache.scala 580:21]
  assign io_itlb_0_req_bits_kill = mainPipe_io_itlb_0_req_bits_kill; // @[ICache.scala 580:21]
  assign io_itlb_0_resp_ready = mainPipe_io_itlb_0_resp_ready; // @[ICache.scala 580:21]
  assign io_itlb_1_req_valid = mainPipe_io_itlb_1_req_valid; // @[ICache.scala 581:21]
  assign io_itlb_1_req_bits_vaddr = mainPipe_io_itlb_1_req_bits_vaddr; // @[ICache.scala 581:21]
  assign io_itlb_1_req_bits_kill = mainPipe_io_itlb_1_req_bits_kill; // @[ICache.scala 581:21]
  assign io_itlb_1_resp_ready = mainPipe_io_itlb_1_resp_ready; // @[ICache.scala 581:21]
  assign io_perfInfo_only_0_hit = mainPipe_io_perfInfo_only_0_hit; // @[ICache.scala 529:15]
  assign io_perfInfo_only_0_miss = mainPipe_io_perfInfo_only_0_miss; // @[ICache.scala 529:15]
  assign io_perfInfo_hit_0_hit_1 = mainPipe_io_perfInfo_hit_0_hit_1; // @[ICache.scala 529:15]
  assign io_perfInfo_hit_0_miss_1 = mainPipe_io_perfInfo_hit_0_miss_1; // @[ICache.scala 529:15]
  assign io_perfInfo_miss_0_hit_1 = mainPipe_io_perfInfo_miss_0_hit_1; // @[ICache.scala 529:15]
  assign io_perfInfo_miss_0_miss_1 = mainPipe_io_perfInfo_miss_0_miss_1; // @[ICache.scala 529:15]
  assign io_perfInfo_hit_0_except_1 = mainPipe_io_perfInfo_hit_0_except_1; // @[ICache.scala 529:15]
  assign io_perfInfo_miss_0_except_1 = mainPipe_io_perfInfo_miss_0_except_1; // @[ICache.scala 529:15]
  assign io_perfInfo_except_0 = mainPipe_io_perfInfo_except_0; // @[ICache.scala 529:15]
  assign io_perfInfo_bank_hit_1 = mainPipe_io_perfInfo_bank_hit_1; // @[ICache.scala 529:15]
  assign io_perfInfo_hit = mainPipe_io_perfInfo_hit; // @[ICache.scala 529:15]
  assign io_error_source_tag = io_error_REG_source_tag; // @[ICache.scala 623:12]
  assign io_error_source_data = io_error_REG_source_data; // @[ICache.scala 623:12]
  assign io_error_source_l2 = io_error_REG_source_l2; // @[ICache.scala 623:12]
  assign io_error_opType_fetch = io_error_REG_opType_fetch; // @[ICache.scala 623:12]
  assign io_error_opType_load = 1'h0; // @[ICache.scala 623:12]
  assign io_error_opType_store = 1'h0; // @[ICache.scala 623:12]
  assign io_error_opType_probe = io_error_REG_opType_probe; // @[ICache.scala 623:12]
  assign io_error_opType_release = io_error_REG_opType_release; // @[ICache.scala 623:12]
  assign io_error_opType_atom = 1'h0; // @[ICache.scala 623:12]
  assign io_error_paddr = io_error_REG_paddr; // @[ICache.scala 623:12]
  assign io_error_report_to_beu = io_error_REG_report_to_beu; // @[ICache.scala 623:12]
  assign io_error_valid = io_error_REG_valid; // @[ICache.scala 623:12]
  assign io_csr_update_wvalid = cacheOpDecoder_io_csr_update_wvalid; // @[ICache.scala 691:25]
  assign io_csr_update_waddr = cacheOpDecoder_io_csr_update_waddr; // @[ICache.scala 691:25]
  assign io_csr_update_wdata = cacheOpDecoder_io_csr_update_wdata; // @[ICache.scala 691:25]
  assign metaArray_clock = clock;
  assign metaArray_reset = reset;
  assign metaArray_io_write_valid = metaArray_io_write_valid_REG; // @[ICache.scala 537:28]
  assign metaArray_io_write_bits_virIdx = metaArray_io_write_bits_REG_virIdx; // @[ICache.scala 538:28]
  assign metaArray_io_write_bits_phyTag = metaArray_io_write_bits_REG_phyTag; // @[ICache.scala 538:28]
  assign metaArray_io_write_bits_coh_state = metaArray_io_write_bits_REG_coh_state; // @[ICache.scala 538:28]
  assign metaArray_io_write_bits_waymask = metaArray_io_write_bits_REG_waymask; // @[ICache.scala 538:28]
  assign metaArray_io_write_bits_bankIdx = metaArray_io_write_bits_REG_bankIdx; // @[ICache.scala 538:28]
  assign metaArray_io_read_valid = meta_read_arb_io_out_valid; // @[ICache.scala 516:41]
  assign metaArray_io_read_bits_isDoubleLine = meta_read_arb_io_out_bits_isDoubleLine; // @[ICache.scala 516:41]
  assign metaArray_io_read_bits_vSetIdx_0 = meta_read_arb_io_out_bits_vSetIdx_0; // @[ICache.scala 516:41]
  assign metaArray_io_read_bits_vSetIdx_1 = meta_read_arb_io_out_bits_vSetIdx_1; // @[ICache.scala 516:41]
  assign metaArray_io_cacheOp_req_valid = cacheOpDecoder_io_cache_req_valid; // @[ICache.scala 693:28]
  assign metaArray_io_cacheOp_req_bits_wayNum = cacheOpDecoder_io_cache_req_bits_wayNum; // @[ICache.scala 693:28]
  assign metaArray_io_cacheOp_req_bits_index = cacheOpDecoder_io_cache_req_bits_index; // @[ICache.scala 693:28]
  assign metaArray_io_cacheOp_req_bits_opCode = cacheOpDecoder_io_cache_req_bits_opCode; // @[ICache.scala 693:28]
  assign metaArray_io_cacheOp_req_bits_write_tag_low = cacheOpDecoder_io_cache_req_bits_write_tag_low; // @[ICache.scala 693:28]
  assign dataArray_clock = clock;
  assign dataArray_reset = reset;
  assign dataArray_io_write_valid = dataArray_io_write_valid_REG; // @[ICache.scala 541:28]
  assign dataArray_io_write_bits_virIdx = dataArray_io_write_bits_REG_virIdx; // @[ICache.scala 542:28]
  assign dataArray_io_write_bits_data = dataArray_io_write_bits_REG_data; // @[ICache.scala 542:28]
  assign dataArray_io_write_bits_waymask = dataArray_io_write_bits_REG_waymask; // @[ICache.scala 542:28]
  assign dataArray_io_write_bits_bankIdx = dataArray_io_write_bits_REG_bankIdx; // @[ICache.scala 542:28]
  assign dataArray_io_read_valid = data_read_arb_io_out_valid; // @[ICache.scala 524:39]
  assign dataArray_io_read_bits_0_isDoubleLine = data_read_arb_io_out_bits_0_isDoubleLine; // @[ICache.scala 524:39]
  assign dataArray_io_read_bits_0_vSetIdx_0 = data_read_arb_io_out_bits_0_vSetIdx_0; // @[ICache.scala 524:39]
  assign dataArray_io_read_bits_0_vSetIdx_1 = data_read_arb_io_out_bits_0_vSetIdx_1; // @[ICache.scala 524:39]
  assign dataArray_io_read_bits_1_isDoubleLine = data_read_arb_io_out_bits_1_isDoubleLine; // @[ICache.scala 524:39]
  assign dataArray_io_read_bits_1_vSetIdx_0 = data_read_arb_io_out_bits_1_vSetIdx_0; // @[ICache.scala 524:39]
  assign dataArray_io_read_bits_1_vSetIdx_1 = data_read_arb_io_out_bits_1_vSetIdx_1; // @[ICache.scala 524:39]
  assign dataArray_io_read_bits_2_isDoubleLine = data_read_arb_io_out_bits_2_isDoubleLine; // @[ICache.scala 524:39]
  assign dataArray_io_read_bits_2_vSetIdx_0 = data_read_arb_io_out_bits_2_vSetIdx_0; // @[ICache.scala 524:39]
  assign dataArray_io_read_bits_2_vSetIdx_1 = data_read_arb_io_out_bits_2_vSetIdx_1; // @[ICache.scala 524:39]
  assign dataArray_io_read_bits_3_isDoubleLine = data_read_arb_io_out_bits_3_isDoubleLine; // @[ICache.scala 524:39]
  assign dataArray_io_read_bits_3_vSetIdx_0 = data_read_arb_io_out_bits_3_vSetIdx_0; // @[ICache.scala 524:39]
  assign dataArray_io_read_bits_3_vSetIdx_1 = data_read_arb_io_out_bits_3_vSetIdx_1; // @[ICache.scala 524:39]
  assign dataArray_io_cacheOp_req_valid = cacheOpDecoder_io_cache_req_valid; // @[ICache.scala 692:28]
  assign dataArray_io_cacheOp_req_bits_wayNum = cacheOpDecoder_io_cache_req_bits_wayNum; // @[ICache.scala 692:28]
  assign dataArray_io_cacheOp_req_bits_index = cacheOpDecoder_io_cache_req_bits_index; // @[ICache.scala 692:28]
  assign dataArray_io_cacheOp_req_bits_opCode = cacheOpDecoder_io_cache_req_bits_opCode; // @[ICache.scala 692:28]
  assign dataArray_io_cacheOp_req_bits_write_data_vec_0 = cacheOpDecoder_io_cache_req_bits_write_data_vec_0; // @[ICache.scala 692:28]
  assign dataArray_io_cacheOp_req_bits_write_data_vec_1 = cacheOpDecoder_io_cache_req_bits_write_data_vec_1; // @[ICache.scala 692:28]
  assign dataArray_io_cacheOp_req_bits_write_data_vec_2 = cacheOpDecoder_io_cache_req_bits_write_data_vec_2; // @[ICache.scala 692:28]
  assign dataArray_io_cacheOp_req_bits_write_data_vec_3 = cacheOpDecoder_io_cache_req_bits_write_data_vec_3; // @[ICache.scala 692:28]
  assign dataArray_io_cacheOp_req_bits_write_data_vec_4 = cacheOpDecoder_io_cache_req_bits_write_data_vec_4; // @[ICache.scala 692:28]
  assign dataArray_io_cacheOp_req_bits_write_data_vec_5 = cacheOpDecoder_io_cache_req_bits_write_data_vec_5; // @[ICache.scala 692:28]
  assign dataArray_io_cacheOp_req_bits_write_data_vec_6 = cacheOpDecoder_io_cache_req_bits_write_data_vec_6; // @[ICache.scala 692:28]
  assign dataArray_io_cacheOp_req_bits_write_data_vec_7 = cacheOpDecoder_io_cache_req_bits_write_data_vec_7; // @[ICache.scala 692:28]
  assign dataArray_io_cacheOp_req_bits_bank_num = cacheOpDecoder_io_cache_req_bits_bank_num; // @[ICache.scala 692:28]
  assign mainPipe_clock = clock;
  assign mainPipe_reset = reset;
  assign mainPipe_io_metaArray_toIMeta_ready = meta_read_arb_io_in_1_ready; // @[ICache.scala 514:41]
  assign mainPipe_io_metaArray_fromIMeta_metaData_0_0_coh_state = metaArray_io_readResp_metaData_0_0_coh_state; // @[ICache.scala 519:41]
  assign mainPipe_io_metaArray_fromIMeta_metaData_0_0_tag = metaArray_io_readResp_metaData_0_0_tag; // @[ICache.scala 519:41]
  assign mainPipe_io_metaArray_fromIMeta_metaData_0_1_coh_state = metaArray_io_readResp_metaData_0_1_coh_state; // @[ICache.scala 519:41]
  assign mainPipe_io_metaArray_fromIMeta_metaData_0_1_tag = metaArray_io_readResp_metaData_0_1_tag; // @[ICache.scala 519:41]
  assign mainPipe_io_metaArray_fromIMeta_metaData_0_2_coh_state = metaArray_io_readResp_metaData_0_2_coh_state; // @[ICache.scala 519:41]
  assign mainPipe_io_metaArray_fromIMeta_metaData_0_2_tag = metaArray_io_readResp_metaData_0_2_tag; // @[ICache.scala 519:41]
  assign mainPipe_io_metaArray_fromIMeta_metaData_0_3_coh_state = metaArray_io_readResp_metaData_0_3_coh_state; // @[ICache.scala 519:41]
  assign mainPipe_io_metaArray_fromIMeta_metaData_0_3_tag = metaArray_io_readResp_metaData_0_3_tag; // @[ICache.scala 519:41]
  assign mainPipe_io_metaArray_fromIMeta_metaData_0_4_coh_state = metaArray_io_readResp_metaData_0_4_coh_state; // @[ICache.scala 519:41]
  assign mainPipe_io_metaArray_fromIMeta_metaData_0_4_tag = metaArray_io_readResp_metaData_0_4_tag; // @[ICache.scala 519:41]
  assign mainPipe_io_metaArray_fromIMeta_metaData_0_5_coh_state = metaArray_io_readResp_metaData_0_5_coh_state; // @[ICache.scala 519:41]
  assign mainPipe_io_metaArray_fromIMeta_metaData_0_5_tag = metaArray_io_readResp_metaData_0_5_tag; // @[ICache.scala 519:41]
  assign mainPipe_io_metaArray_fromIMeta_metaData_0_6_coh_state = metaArray_io_readResp_metaData_0_6_coh_state; // @[ICache.scala 519:41]
  assign mainPipe_io_metaArray_fromIMeta_metaData_0_6_tag = metaArray_io_readResp_metaData_0_6_tag; // @[ICache.scala 519:41]
  assign mainPipe_io_metaArray_fromIMeta_metaData_0_7_coh_state = metaArray_io_readResp_metaData_0_7_coh_state; // @[ICache.scala 519:41]
  assign mainPipe_io_metaArray_fromIMeta_metaData_0_7_tag = metaArray_io_readResp_metaData_0_7_tag; // @[ICache.scala 519:41]
  assign mainPipe_io_metaArray_fromIMeta_metaData_1_0_coh_state = metaArray_io_readResp_metaData_1_0_coh_state; // @[ICache.scala 519:41]
  assign mainPipe_io_metaArray_fromIMeta_metaData_1_0_tag = metaArray_io_readResp_metaData_1_0_tag; // @[ICache.scala 519:41]
  assign mainPipe_io_metaArray_fromIMeta_metaData_1_1_coh_state = metaArray_io_readResp_metaData_1_1_coh_state; // @[ICache.scala 519:41]
  assign mainPipe_io_metaArray_fromIMeta_metaData_1_1_tag = metaArray_io_readResp_metaData_1_1_tag; // @[ICache.scala 519:41]
  assign mainPipe_io_metaArray_fromIMeta_metaData_1_2_coh_state = metaArray_io_readResp_metaData_1_2_coh_state; // @[ICache.scala 519:41]
  assign mainPipe_io_metaArray_fromIMeta_metaData_1_2_tag = metaArray_io_readResp_metaData_1_2_tag; // @[ICache.scala 519:41]
  assign mainPipe_io_metaArray_fromIMeta_metaData_1_3_coh_state = metaArray_io_readResp_metaData_1_3_coh_state; // @[ICache.scala 519:41]
  assign mainPipe_io_metaArray_fromIMeta_metaData_1_3_tag = metaArray_io_readResp_metaData_1_3_tag; // @[ICache.scala 519:41]
  assign mainPipe_io_metaArray_fromIMeta_metaData_1_4_coh_state = metaArray_io_readResp_metaData_1_4_coh_state; // @[ICache.scala 519:41]
  assign mainPipe_io_metaArray_fromIMeta_metaData_1_4_tag = metaArray_io_readResp_metaData_1_4_tag; // @[ICache.scala 519:41]
  assign mainPipe_io_metaArray_fromIMeta_metaData_1_5_coh_state = metaArray_io_readResp_metaData_1_5_coh_state; // @[ICache.scala 519:41]
  assign mainPipe_io_metaArray_fromIMeta_metaData_1_5_tag = metaArray_io_readResp_metaData_1_5_tag; // @[ICache.scala 519:41]
  assign mainPipe_io_metaArray_fromIMeta_metaData_1_6_coh_state = metaArray_io_readResp_metaData_1_6_coh_state; // @[ICache.scala 519:41]
  assign mainPipe_io_metaArray_fromIMeta_metaData_1_6_tag = metaArray_io_readResp_metaData_1_6_tag; // @[ICache.scala 519:41]
  assign mainPipe_io_metaArray_fromIMeta_metaData_1_7_coh_state = metaArray_io_readResp_metaData_1_7_coh_state; // @[ICache.scala 519:41]
  assign mainPipe_io_metaArray_fromIMeta_metaData_1_7_tag = metaArray_io_readResp_metaData_1_7_tag; // @[ICache.scala 519:41]
  assign mainPipe_io_metaArray_fromIMeta_errors_0_0 = metaArray_io_readResp_errors_0_0; // @[ICache.scala 519:41]
  assign mainPipe_io_metaArray_fromIMeta_errors_0_1 = metaArray_io_readResp_errors_0_1; // @[ICache.scala 519:41]
  assign mainPipe_io_metaArray_fromIMeta_errors_0_2 = metaArray_io_readResp_errors_0_2; // @[ICache.scala 519:41]
  assign mainPipe_io_metaArray_fromIMeta_errors_0_3 = metaArray_io_readResp_errors_0_3; // @[ICache.scala 519:41]
  assign mainPipe_io_metaArray_fromIMeta_errors_0_4 = metaArray_io_readResp_errors_0_4; // @[ICache.scala 519:41]
  assign mainPipe_io_metaArray_fromIMeta_errors_0_5 = metaArray_io_readResp_errors_0_5; // @[ICache.scala 519:41]
  assign mainPipe_io_metaArray_fromIMeta_errors_0_6 = metaArray_io_readResp_errors_0_6; // @[ICache.scala 519:41]
  assign mainPipe_io_metaArray_fromIMeta_errors_0_7 = metaArray_io_readResp_errors_0_7; // @[ICache.scala 519:41]
  assign mainPipe_io_metaArray_fromIMeta_errors_1_0 = metaArray_io_readResp_errors_1_0; // @[ICache.scala 519:41]
  assign mainPipe_io_metaArray_fromIMeta_errors_1_1 = metaArray_io_readResp_errors_1_1; // @[ICache.scala 519:41]
  assign mainPipe_io_metaArray_fromIMeta_errors_1_2 = metaArray_io_readResp_errors_1_2; // @[ICache.scala 519:41]
  assign mainPipe_io_metaArray_fromIMeta_errors_1_3 = metaArray_io_readResp_errors_1_3; // @[ICache.scala 519:41]
  assign mainPipe_io_metaArray_fromIMeta_errors_1_4 = metaArray_io_readResp_errors_1_4; // @[ICache.scala 519:41]
  assign mainPipe_io_metaArray_fromIMeta_errors_1_5 = metaArray_io_readResp_errors_1_5; // @[ICache.scala 519:41]
  assign mainPipe_io_metaArray_fromIMeta_errors_1_6 = metaArray_io_readResp_errors_1_6; // @[ICache.scala 519:41]
  assign mainPipe_io_metaArray_fromIMeta_errors_1_7 = metaArray_io_readResp_errors_1_7; // @[ICache.scala 519:41]
  assign mainPipe_io_dataArray_toIData_ready = data_read_arb_io_in_1_ready; // @[ICache.scala 523:39]
  assign mainPipe_io_dataArray_fromIData_datas_0_0 = dataArray_io_readResp_datas_0_0; // @[ICache.scala 526:39]
  assign mainPipe_io_dataArray_fromIData_datas_0_1 = dataArray_io_readResp_datas_0_1; // @[ICache.scala 526:39]
  assign mainPipe_io_dataArray_fromIData_datas_0_2 = dataArray_io_readResp_datas_0_2; // @[ICache.scala 526:39]
  assign mainPipe_io_dataArray_fromIData_datas_0_3 = dataArray_io_readResp_datas_0_3; // @[ICache.scala 526:39]
  assign mainPipe_io_dataArray_fromIData_datas_0_4 = dataArray_io_readResp_datas_0_4; // @[ICache.scala 526:39]
  assign mainPipe_io_dataArray_fromIData_datas_0_5 = dataArray_io_readResp_datas_0_5; // @[ICache.scala 526:39]
  assign mainPipe_io_dataArray_fromIData_datas_0_6 = dataArray_io_readResp_datas_0_6; // @[ICache.scala 526:39]
  assign mainPipe_io_dataArray_fromIData_datas_0_7 = dataArray_io_readResp_datas_0_7; // @[ICache.scala 526:39]
  assign mainPipe_io_dataArray_fromIData_datas_1_0 = dataArray_io_readResp_datas_1_0; // @[ICache.scala 526:39]
  assign mainPipe_io_dataArray_fromIData_datas_1_1 = dataArray_io_readResp_datas_1_1; // @[ICache.scala 526:39]
  assign mainPipe_io_dataArray_fromIData_datas_1_2 = dataArray_io_readResp_datas_1_2; // @[ICache.scala 526:39]
  assign mainPipe_io_dataArray_fromIData_datas_1_3 = dataArray_io_readResp_datas_1_3; // @[ICache.scala 526:39]
  assign mainPipe_io_dataArray_fromIData_datas_1_4 = dataArray_io_readResp_datas_1_4; // @[ICache.scala 526:39]
  assign mainPipe_io_dataArray_fromIData_datas_1_5 = dataArray_io_readResp_datas_1_5; // @[ICache.scala 526:39]
  assign mainPipe_io_dataArray_fromIData_datas_1_6 = dataArray_io_readResp_datas_1_6; // @[ICache.scala 526:39]
  assign mainPipe_io_dataArray_fromIData_datas_1_7 = dataArray_io_readResp_datas_1_7; // @[ICache.scala 526:39]
  assign mainPipe_io_dataArray_fromIData_codes_0_0 = dataArray_io_readResp_codes_0_0; // @[ICache.scala 526:39]
  assign mainPipe_io_dataArray_fromIData_codes_0_1 = dataArray_io_readResp_codes_0_1; // @[ICache.scala 526:39]
  assign mainPipe_io_dataArray_fromIData_codes_0_2 = dataArray_io_readResp_codes_0_2; // @[ICache.scala 526:39]
  assign mainPipe_io_dataArray_fromIData_codes_0_3 = dataArray_io_readResp_codes_0_3; // @[ICache.scala 526:39]
  assign mainPipe_io_dataArray_fromIData_codes_0_4 = dataArray_io_readResp_codes_0_4; // @[ICache.scala 526:39]
  assign mainPipe_io_dataArray_fromIData_codes_0_5 = dataArray_io_readResp_codes_0_5; // @[ICache.scala 526:39]
  assign mainPipe_io_dataArray_fromIData_codes_0_6 = dataArray_io_readResp_codes_0_6; // @[ICache.scala 526:39]
  assign mainPipe_io_dataArray_fromIData_codes_0_7 = dataArray_io_readResp_codes_0_7; // @[ICache.scala 526:39]
  assign mainPipe_io_dataArray_fromIData_codes_1_0 = dataArray_io_readResp_codes_1_0; // @[ICache.scala 526:39]
  assign mainPipe_io_dataArray_fromIData_codes_1_1 = dataArray_io_readResp_codes_1_1; // @[ICache.scala 526:39]
  assign mainPipe_io_dataArray_fromIData_codes_1_2 = dataArray_io_readResp_codes_1_2; // @[ICache.scala 526:39]
  assign mainPipe_io_dataArray_fromIData_codes_1_3 = dataArray_io_readResp_codes_1_3; // @[ICache.scala 526:39]
  assign mainPipe_io_dataArray_fromIData_codes_1_4 = dataArray_io_readResp_codes_1_4; // @[ICache.scala 526:39]
  assign mainPipe_io_dataArray_fromIData_codes_1_5 = dataArray_io_readResp_codes_1_5; // @[ICache.scala 526:39]
  assign mainPipe_io_dataArray_fromIData_codes_1_6 = dataArray_io_readResp_codes_1_6; // @[ICache.scala 526:39]
  assign mainPipe_io_dataArray_fromIData_codes_1_7 = dataArray_io_readResp_codes_1_7; // @[ICache.scala 526:39]
  assign mainPipe_io_mshr_0_toMSHR_ready = missUnit_io_req_0_ready; // @[ICache.scala 590:34]
  assign mainPipe_io_mshr_0_fromMSHR_valid = missUnit_io_resp_0_valid; // @[ICache.scala 591:34]
  assign mainPipe_io_mshr_0_fromMSHR_bits_data = missUnit_io_resp_0_bits_data; // @[ICache.scala 591:34]
  assign mainPipe_io_mshr_0_fromMSHR_bits_corrupt = missUnit_io_resp_0_bits_corrupt; // @[ICache.scala 591:34]
  assign mainPipe_io_mshr_1_toMSHR_ready = missUnit_io_req_1_ready; // @[ICache.scala 590:34]
  assign mainPipe_io_mshr_1_fromMSHR_valid = missUnit_io_resp_1_valid; // @[ICache.scala 591:34]
  assign mainPipe_io_mshr_1_fromMSHR_bits_data = missUnit_io_resp_1_bits_data; // @[ICache.scala 591:34]
  assign mainPipe_io_mshr_1_fromMSHR_bits_corrupt = missUnit_io_resp_1_bits_corrupt; // @[ICache.scala 591:34]
  assign mainPipe_io_fetch_req_valid = io_fetch_req_valid; // @[ICache.scala 672:25]
  assign mainPipe_io_fetch_req_bits_pcMemRead_0_startAddr = io_fetch_req_bits_pcMemRead_0_startAddr; // @[ICache.scala 672:25]
  assign mainPipe_io_fetch_req_bits_pcMemRead_0_nextlineStart = io_fetch_req_bits_pcMemRead_0_nextlineStart; // @[ICache.scala 672:25]
  assign mainPipe_io_fetch_req_bits_pcMemRead_1_startAddr = io_fetch_req_bits_pcMemRead_1_startAddr; // @[ICache.scala 672:25]
  assign mainPipe_io_fetch_req_bits_pcMemRead_1_nextlineStart = io_fetch_req_bits_pcMemRead_1_nextlineStart; // @[ICache.scala 672:25]
  assign mainPipe_io_fetch_req_bits_pcMemRead_2_startAddr = io_fetch_req_bits_pcMemRead_2_startAddr; // @[ICache.scala 672:25]
  assign mainPipe_io_fetch_req_bits_pcMemRead_2_nextlineStart = io_fetch_req_bits_pcMemRead_2_nextlineStart; // @[ICache.scala 672:25]
  assign mainPipe_io_fetch_req_bits_pcMemRead_3_startAddr = io_fetch_req_bits_pcMemRead_3_startAddr; // @[ICache.scala 672:25]
  assign mainPipe_io_fetch_req_bits_pcMemRead_3_nextlineStart = io_fetch_req_bits_pcMemRead_3_nextlineStart; // @[ICache.scala 672:25]
  assign mainPipe_io_fetch_req_bits_pcMemRead_4_startAddr = io_fetch_req_bits_pcMemRead_4_startAddr; // @[ICache.scala 672:25]
  assign mainPipe_io_fetch_req_bits_pcMemRead_4_nextlineStart = io_fetch_req_bits_pcMemRead_4_nextlineStart; // @[ICache.scala 672:25]
  assign mainPipe_io_fetch_req_bits_readValid_0 = io_fetch_req_bits_readValid_0; // @[ICache.scala 672:25]
  assign mainPipe_io_fetch_req_bits_readValid_1 = io_fetch_req_bits_readValid_1; // @[ICache.scala 672:25]
  assign mainPipe_io_fetch_req_bits_readValid_2 = io_fetch_req_bits_readValid_2; // @[ICache.scala 672:25]
  assign mainPipe_io_fetch_req_bits_readValid_3 = io_fetch_req_bits_readValid_3; // @[ICache.scala 672:25]
  assign mainPipe_io_fetch_req_bits_readValid_4 = io_fetch_req_bits_readValid_4; // @[ICache.scala 672:25]
  assign mainPipe_io_pmp_0_resp_instr = io_pmp_0_resp_instr; // @[ICache.scala 558:13]
  assign mainPipe_io_pmp_0_resp_mmio = io_pmp_0_resp_mmio; // @[ICache.scala 558:13]
  assign mainPipe_io_pmp_1_resp_instr = io_pmp_1_resp_instr; // @[ICache.scala 559:13]
  assign mainPipe_io_itlb_0_req_ready = io_itlb_0_req_ready; // @[ICache.scala 580:21]
  assign mainPipe_io_itlb_0_resp_valid = io_itlb_0_resp_valid; // @[ICache.scala 580:21]
  assign mainPipe_io_itlb_0_resp_bits_paddr_0 = io_itlb_0_resp_bits_paddr_0; // @[ICache.scala 580:21]
  assign mainPipe_io_itlb_0_resp_bits_excp_0_pf_instr = io_itlb_0_resp_bits_excp_0_pf_instr; // @[ICache.scala 580:21]
  assign mainPipe_io_itlb_0_resp_bits_excp_0_af_instr = io_itlb_0_resp_bits_excp_0_af_instr; // @[ICache.scala 580:21]
  assign mainPipe_io_itlb_1_req_ready = io_itlb_1_req_ready; // @[ICache.scala 581:21]
  assign mainPipe_io_itlb_1_resp_valid = io_itlb_1_resp_valid; // @[ICache.scala 581:21]
  assign mainPipe_io_itlb_1_resp_bits_paddr_0 = io_itlb_1_resp_bits_paddr_0; // @[ICache.scala 581:21]
  assign mainPipe_io_itlb_1_resp_bits_excp_0_pf_instr = io_itlb_1_resp_bits_excp_0_pf_instr; // @[ICache.scala 581:21]
  assign mainPipe_io_itlb_1_resp_bits_excp_0_af_instr = io_itlb_1_resp_bits_excp_0_af_instr; // @[ICache.scala 581:21]
  assign mainPipe_io_respStall = io_stop; // @[ICache.scala 528:25]
  assign mainPipe_io_csr_parity_enable = io_csr_parity_enable; // @[ICache.scala 545:33]
  assign missUnit_clock = clock;
  assign missUnit_reset = reset;
  assign missUnit_io_req_0_valid = mainPipe_io_mshr_0_toMSHR_valid; // @[ICache.scala 590:34]
  assign missUnit_io_req_0_bits_paddr = mainPipe_io_mshr_0_toMSHR_bits_paddr; // @[ICache.scala 590:34]
  assign missUnit_io_req_0_bits_vaddr = mainPipe_io_mshr_0_toMSHR_bits_vaddr; // @[ICache.scala 590:34]
  assign missUnit_io_req_0_bits_waymask = mainPipe_io_mshr_0_toMSHR_bits_waymask; // @[ICache.scala 590:34]
  assign missUnit_io_req_1_valid = mainPipe_io_mshr_1_toMSHR_valid; // @[ICache.scala 590:34]
  assign missUnit_io_req_1_bits_paddr = mainPipe_io_mshr_1_toMSHR_bits_paddr; // @[ICache.scala 590:34]
  assign missUnit_io_req_1_bits_vaddr = mainPipe_io_mshr_1_toMSHR_bits_vaddr; // @[ICache.scala 590:34]
  assign missUnit_io_req_1_bits_waymask = mainPipe_io_mshr_1_toMSHR_bits_waymask; // @[ICache.scala 590:34]
  assign missUnit_io_mem_acquire_ready = auto_client_out_a_ready; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign missUnit_io_mem_grant_valid = auto_client_out_d_bits_opcode == 3'h5 & auto_client_out_d_valid; // @[ICache.scala 675:54 676:27 612:31]
  assign missUnit_io_mem_grant_bits_opcode = auto_client_out_d_bits_opcode; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign missUnit_io_mem_grant_bits_param = auto_client_out_d_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign missUnit_io_mem_grant_bits_source = auto_client_out_d_bits_source; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign missUnit_io_mem_grant_bits_sink = auto_client_out_d_bits_sink; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign missUnit_io_mem_grant_bits_echo_blockisdirty = auto_client_out_d_bits_echo_blockisdirty; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign missUnit_io_mem_grant_bits_data = auto_client_out_d_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign missUnit_io_mem_grant_bits_corrupt = auto_client_out_d_bits_corrupt; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign missUnit_io_mem_finish_ready = auto_client_out_e_ready; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign missUnit_io_meta_write_ready = meta_write_arb_io_in_1_ready; // @[ICache.scala 532:41]
  assign missUnit_io_release_req_ready = releaseShouldBlock ? 1'h0 : replace_req_arb_io_in_1_ready; // @[ICache.scala 660:27 661:35 656:40]
  assign missUnit_io_release_resp_valid = replacePipe_io_pipe_resp_valid; // @[ICache.scala 669:28]
  assign missUnit_io_release_resp_bits = replacePipe_io_pipe_resp_bits; // @[ICache.scala 669:28]
  assign releaseUnit_clock = clock;
  assign releaseUnit_reset = reset;
  assign releaseUnit_io_req_valid = replacePipe_io_release_req_valid; // @[ICache.scala 607:22]
  assign releaseUnit_io_req_bits_addr = replacePipe_io_release_req_bits_addr; // @[ICache.scala 607:22]
  assign releaseUnit_io_req_bits_param = replacePipe_io_release_req_bits_param; // @[ICache.scala 607:22]
  assign releaseUnit_io_req_bits_voluntary = replacePipe_io_release_req_bits_voluntary; // @[ICache.scala 607:22]
  assign releaseUnit_io_req_bits_hasData = replacePipe_io_release_req_bits_hasData; // @[ICache.scala 607:22]
  assign releaseUnit_io_req_bits_dirty = replacePipe_io_release_req_bits_dirty; // @[ICache.scala 607:22]
  assign releaseUnit_io_req_bits_data = replacePipe_io_release_req_bits_data; // @[ICache.scala 607:22]
  assign releaseUnit_io_mem_release_ready = auto_client_out_c_ready; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign releaseUnit_io_mem_grant_valid = auto_client_out_d_bits_opcode == 3'h5 ? 1'h0 : _GEN_3; // @[ICache.scala 615:34 675:54]
  assign releaseUnit_io_mem_grant_bits_source = auto_client_out_d_bits_source; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign replacePipe_clock = clock;
  assign replacePipe_reset = reset;
  assign replacePipe_io_pipe_req_valid = replace_req_arb_io_out_valid; // @[ICache.scala 658:41]
  assign replacePipe_io_pipe_req_bits_paddr = replace_req_arb_io_out_bits_paddr; // @[ICache.scala 658:41]
  assign replacePipe_io_pipe_req_bits_vaddr = replace_req_arb_io_out_bits_vaddr; // @[ICache.scala 658:41]
  assign replacePipe_io_pipe_req_bits_param = replace_req_arb_io_out_bits_param; // @[ICache.scala 658:41]
  assign replacePipe_io_pipe_req_bits_voluntary = replace_req_arb_io_out_bits_voluntary; // @[ICache.scala 658:41]
  assign replacePipe_io_pipe_req_bits_needData = replace_req_arb_io_out_bits_needData; // @[ICache.scala 658:41]
  assign replacePipe_io_pipe_req_bits_waymask = replace_req_arb_io_out_bits_waymask; // @[ICache.scala 658:41]
  assign replacePipe_io_pipe_req_bits_id = replace_req_arb_io_out_bits_id; // @[ICache.scala 658:41]
  assign replacePipe_io_meta_read_ready = meta_read_arb_io_in_0_ready; // @[ICache.scala 513:41]
  assign replacePipe_io_data_read_ready = data_read_arb_io_in_0_ready; // @[ICache.scala 522:39]
  assign replacePipe_io_meta_response_metaData_0_0_coh_state = metaArray_io_readResp_metaData_0_0_coh_state; // @[ICache.scala 518:41]
  assign replacePipe_io_meta_response_metaData_0_0_tag = metaArray_io_readResp_metaData_0_0_tag; // @[ICache.scala 518:41]
  assign replacePipe_io_meta_response_metaData_0_1_coh_state = metaArray_io_readResp_metaData_0_1_coh_state; // @[ICache.scala 518:41]
  assign replacePipe_io_meta_response_metaData_0_1_tag = metaArray_io_readResp_metaData_0_1_tag; // @[ICache.scala 518:41]
  assign replacePipe_io_meta_response_metaData_0_2_coh_state = metaArray_io_readResp_metaData_0_2_coh_state; // @[ICache.scala 518:41]
  assign replacePipe_io_meta_response_metaData_0_2_tag = metaArray_io_readResp_metaData_0_2_tag; // @[ICache.scala 518:41]
  assign replacePipe_io_meta_response_metaData_0_3_coh_state = metaArray_io_readResp_metaData_0_3_coh_state; // @[ICache.scala 518:41]
  assign replacePipe_io_meta_response_metaData_0_3_tag = metaArray_io_readResp_metaData_0_3_tag; // @[ICache.scala 518:41]
  assign replacePipe_io_meta_response_metaData_0_4_coh_state = metaArray_io_readResp_metaData_0_4_coh_state; // @[ICache.scala 518:41]
  assign replacePipe_io_meta_response_metaData_0_4_tag = metaArray_io_readResp_metaData_0_4_tag; // @[ICache.scala 518:41]
  assign replacePipe_io_meta_response_metaData_0_5_coh_state = metaArray_io_readResp_metaData_0_5_coh_state; // @[ICache.scala 518:41]
  assign replacePipe_io_meta_response_metaData_0_5_tag = metaArray_io_readResp_metaData_0_5_tag; // @[ICache.scala 518:41]
  assign replacePipe_io_meta_response_metaData_0_6_coh_state = metaArray_io_readResp_metaData_0_6_coh_state; // @[ICache.scala 518:41]
  assign replacePipe_io_meta_response_metaData_0_6_tag = metaArray_io_readResp_metaData_0_6_tag; // @[ICache.scala 518:41]
  assign replacePipe_io_meta_response_metaData_0_7_coh_state = metaArray_io_readResp_metaData_0_7_coh_state; // @[ICache.scala 518:41]
  assign replacePipe_io_meta_response_metaData_0_7_tag = metaArray_io_readResp_metaData_0_7_tag; // @[ICache.scala 518:41]
  assign replacePipe_io_meta_response_errors_0_0 = metaArray_io_readResp_errors_0_0; // @[ICache.scala 518:41]
  assign replacePipe_io_meta_response_errors_0_1 = metaArray_io_readResp_errors_0_1; // @[ICache.scala 518:41]
  assign replacePipe_io_meta_response_errors_0_2 = metaArray_io_readResp_errors_0_2; // @[ICache.scala 518:41]
  assign replacePipe_io_meta_response_errors_0_3 = metaArray_io_readResp_errors_0_3; // @[ICache.scala 518:41]
  assign replacePipe_io_meta_response_errors_0_4 = metaArray_io_readResp_errors_0_4; // @[ICache.scala 518:41]
  assign replacePipe_io_meta_response_errors_0_5 = metaArray_io_readResp_errors_0_5; // @[ICache.scala 518:41]
  assign replacePipe_io_meta_response_errors_0_6 = metaArray_io_readResp_errors_0_6; // @[ICache.scala 518:41]
  assign replacePipe_io_meta_response_errors_0_7 = metaArray_io_readResp_errors_0_7; // @[ICache.scala 518:41]
  assign replacePipe_io_data_response_datas_0_0 = dataArray_io_readResp_datas_0_0; // @[ICache.scala 525:39]
  assign replacePipe_io_data_response_datas_0_1 = dataArray_io_readResp_datas_0_1; // @[ICache.scala 525:39]
  assign replacePipe_io_data_response_datas_0_2 = dataArray_io_readResp_datas_0_2; // @[ICache.scala 525:39]
  assign replacePipe_io_data_response_datas_0_3 = dataArray_io_readResp_datas_0_3; // @[ICache.scala 525:39]
  assign replacePipe_io_data_response_datas_0_4 = dataArray_io_readResp_datas_0_4; // @[ICache.scala 525:39]
  assign replacePipe_io_data_response_datas_0_5 = dataArray_io_readResp_datas_0_5; // @[ICache.scala 525:39]
  assign replacePipe_io_data_response_datas_0_6 = dataArray_io_readResp_datas_0_6; // @[ICache.scala 525:39]
  assign replacePipe_io_data_response_datas_0_7 = dataArray_io_readResp_datas_0_7; // @[ICache.scala 525:39]
  assign replacePipe_io_data_response_codes_0_0 = dataArray_io_readResp_codes_0_0; // @[ICache.scala 525:39]
  assign replacePipe_io_data_response_codes_0_1 = dataArray_io_readResp_codes_0_1; // @[ICache.scala 525:39]
  assign replacePipe_io_data_response_codes_0_2 = dataArray_io_readResp_codes_0_2; // @[ICache.scala 525:39]
  assign replacePipe_io_data_response_codes_0_3 = dataArray_io_readResp_codes_0_3; // @[ICache.scala 525:39]
  assign replacePipe_io_data_response_codes_0_4 = dataArray_io_readResp_codes_0_4; // @[ICache.scala 525:39]
  assign replacePipe_io_data_response_codes_0_5 = dataArray_io_readResp_codes_0_5; // @[ICache.scala 525:39]
  assign replacePipe_io_data_response_codes_0_6 = dataArray_io_readResp_codes_0_6; // @[ICache.scala 525:39]
  assign replacePipe_io_data_response_codes_0_7 = dataArray_io_readResp_codes_0_7; // @[ICache.scala 525:39]
  assign replacePipe_io_release_req_ready = releaseUnit_io_req_ready; // @[ICache.scala 607:22]
  assign replacePipe_io_release_finish = releaseUnit_io_finish; // @[ICache.scala 608:33]
  assign replacePipe_io_csr_parity_enable = io_csr_parity_enable; // @[ICache.scala 546:36]
  assign probeQueue_clock = clock;
  assign probeQueue_reset = reset;
  assign probeQueue_io_mem_probe_valid = auto_client_out_bvalid; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign probeQueue_io_mem_probe_bits_param = auto_client_out_bparam; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign probeQueue_io_mem_probe_bits_address = auto_client_out_baddress; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign probeQueue_io_mem_probe_bits_data = auto_client_out_bdata; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign probeQueue_io_pipe_req_ready = probeShouldBlock ? 1'h0 : replace_req_arb_io_in_0_ready; // @[ICache.scala 664:25 665:34 654:41]
  assign meta_read_arb_io_in_0_valid = replacePipe_io_meta_read_valid; // @[ICache.scala 513:41]
  assign meta_read_arb_io_in_0_bits_vSetIdx_0 = replacePipe_io_meta_read_bits_vSetIdx_0; // @[ICache.scala 513:41]
  assign meta_read_arb_io_in_1_valid = mainPipe_io_metaArray_toIMeta_valid; // @[ICache.scala 514:41]
  assign meta_read_arb_io_in_1_bits_isDoubleLine = mainPipe_io_metaArray_toIMeta_bits_isDoubleLine; // @[ICache.scala 514:41]
  assign meta_read_arb_io_in_1_bits_vSetIdx_0 = mainPipe_io_metaArray_toIMeta_bits_vSetIdx_0; // @[ICache.scala 514:41]
  assign meta_read_arb_io_in_1_bits_vSetIdx_1 = mainPipe_io_metaArray_toIMeta_bits_vSetIdx_1; // @[ICache.scala 514:41]
  assign meta_read_arb_io_out_ready = metaArray_io_read_ready; // @[ICache.scala 516:41]
  assign data_read_arb_io_in_0_valid = replacePipe_io_data_read_valid; // @[ICache.scala 522:39]
  assign data_read_arb_io_in_0_bits_0_vSetIdx_0 = replacePipe_io_data_read_bits_0_vSetIdx_0; // @[ICache.scala 522:39]
  assign data_read_arb_io_in_0_bits_1_vSetIdx_0 = replacePipe_io_data_read_bits_1_vSetIdx_0; // @[ICache.scala 522:39]
  assign data_read_arb_io_in_0_bits_2_vSetIdx_0 = replacePipe_io_data_read_bits_2_vSetIdx_0; // @[ICache.scala 522:39]
  assign data_read_arb_io_in_0_bits_3_vSetIdx_0 = replacePipe_io_data_read_bits_3_vSetIdx_0; // @[ICache.scala 522:39]
  assign data_read_arb_io_in_1_valid = mainPipe_io_dataArray_toIData_valid; // @[ICache.scala 523:39]
  assign data_read_arb_io_in_1_bits_0_isDoubleLine = mainPipe_io_dataArray_toIData_bits_0_isDoubleLine; // @[ICache.scala 523:39]
  assign data_read_arb_io_in_1_bits_0_vSetIdx_0 = mainPipe_io_dataArray_toIData_bits_0_vSetIdx_0; // @[ICache.scala 523:39]
  assign data_read_arb_io_in_1_bits_0_vSetIdx_1 = mainPipe_io_dataArray_toIData_bits_0_vSetIdx_1; // @[ICache.scala 523:39]
  assign data_read_arb_io_in_1_bits_1_isDoubleLine = mainPipe_io_dataArray_toIData_bits_1_isDoubleLine; // @[ICache.scala 523:39]
  assign data_read_arb_io_in_1_bits_1_vSetIdx_0 = mainPipe_io_dataArray_toIData_bits_1_vSetIdx_0; // @[ICache.scala 523:39]
  assign data_read_arb_io_in_1_bits_1_vSetIdx_1 = mainPipe_io_dataArray_toIData_bits_1_vSetIdx_1; // @[ICache.scala 523:39]
  assign data_read_arb_io_in_1_bits_2_isDoubleLine = mainPipe_io_dataArray_toIData_bits_2_isDoubleLine; // @[ICache.scala 523:39]
  assign data_read_arb_io_in_1_bits_2_vSetIdx_0 = mainPipe_io_dataArray_toIData_bits_2_vSetIdx_0; // @[ICache.scala 523:39]
  assign data_read_arb_io_in_1_bits_2_vSetIdx_1 = mainPipe_io_dataArray_toIData_bits_2_vSetIdx_1; // @[ICache.scala 523:39]
  assign data_read_arb_io_in_1_bits_3_isDoubleLine = mainPipe_io_dataArray_toIData_bits_3_isDoubleLine; // @[ICache.scala 523:39]
  assign data_read_arb_io_in_1_bits_3_vSetIdx_0 = mainPipe_io_dataArray_toIData_bits_3_vSetIdx_0; // @[ICache.scala 523:39]
  assign data_read_arb_io_in_1_bits_3_vSetIdx_1 = mainPipe_io_dataArray_toIData_bits_3_vSetIdx_1; // @[ICache.scala 523:39]
  assign data_read_arb_io_out_ready = dataArray_io_read_ready; // @[ICache.scala 524:39]
  assign meta_write_arb_io_in_0_valid = replacePipe_io_meta_write_valid; // @[ICache.scala 531:41]
  assign meta_write_arb_io_in_0_bits_virIdx = replacePipe_io_meta_write_bits_virIdx; // @[ICache.scala 531:41]
  assign meta_write_arb_io_in_0_bits_phyTag = replacePipe_io_meta_write_bits_phyTag; // @[ICache.scala 531:41]
  assign meta_write_arb_io_in_0_bits_coh_state = replacePipe_io_meta_write_bits_coh_state; // @[ICache.scala 531:41]
  assign meta_write_arb_io_in_0_bits_waymask = replacePipe_io_meta_write_bits_waymask; // @[ICache.scala 531:41]
  assign meta_write_arb_io_in_0_bits_bankIdx = replacePipe_io_meta_write_bits_bankIdx; // @[ICache.scala 531:41]
  assign meta_write_arb_io_in_1_valid = missUnit_io_meta_write_valid; // @[ICache.scala 532:41]
  assign meta_write_arb_io_in_1_bits_virIdx = missUnit_io_meta_write_bits_virIdx; // @[ICache.scala 532:41]
  assign meta_write_arb_io_in_1_bits_phyTag = missUnit_io_meta_write_bits_phyTag; // @[ICache.scala 532:41]
  assign meta_write_arb_io_in_1_bits_coh_state = missUnit_io_meta_write_bits_coh_state; // @[ICache.scala 532:41]
  assign meta_write_arb_io_in_1_bits_waymask = missUnit_io_meta_write_bits_waymask; // @[ICache.scala 532:41]
  assign meta_write_arb_io_in_1_bits_bankIdx = missUnit_io_meta_write_bits_bankIdx; // @[ICache.scala 532:41]
  assign meta_write_arb_io_out_ready = 1'h1; // @[ICache.scala 539:31]
  assign replace_req_arb_io_in_0_valid = probeQueue_io_pipe_req_valid & ~probeShouldBlock; // @[ICache.scala 655:79]
  assign replace_req_arb_io_in_0_bits_paddr = probeQueue_io_pipe_req_bits_paddr; // @[ICache.scala 654:41]
  assign replace_req_arb_io_in_0_bits_vaddr = probeQueue_io_pipe_req_bits_vaddr; // @[ICache.scala 654:41]
  assign replace_req_arb_io_in_0_bits_param = probeQueue_io_pipe_req_bits_param; // @[ICache.scala 654:41]
  assign replace_req_arb_io_in_0_bits_voluntary = 1'h0; // @[ICache.scala 654:41]
  assign replace_req_arb_io_in_0_bits_needData = probeQueue_io_pipe_req_bits_needData; // @[ICache.scala 654:41]
  assign replace_req_arb_io_in_0_bits_waymask = 8'h0; // @[ICache.scala 654:41]
  assign replace_req_arb_io_in_0_bits_id = probeQueue_io_pipe_req_bits_id; // @[ICache.scala 654:41]
  assign replace_req_arb_io_in_1_valid = missUnit_io_release_req_valid & ~releaseShouldBlock; // @[ICache.scala 657:77]
  assign replace_req_arb_io_in_1_bits_paddr = missUnit_io_release_req_bits_paddr; // @[ICache.scala 656:40]
  assign replace_req_arb_io_in_1_bits_vaddr = missUnit_io_release_req_bits_vaddr; // @[ICache.scala 656:40]
  assign replace_req_arb_io_in_1_bits_param = missUnit_io_release_req_bits_param; // @[ICache.scala 656:40]
  assign replace_req_arb_io_in_1_bits_voluntary = missUnit_io_release_req_bits_voluntary; // @[ICache.scala 656:40]
  assign replace_req_arb_io_in_1_bits_needData = missUnit_io_release_req_bits_needData; // @[ICache.scala 656:40]
  assign replace_req_arb_io_in_1_bits_waymask = missUnit_io_release_req_bits_waymask; // @[ICache.scala 656:40]
  assign replace_req_arb_io_in_1_bits_id = missUnit_io_release_req_bits_id; // @[ICache.scala 656:40]
  assign replace_req_arb_io_out_ready = replacePipe_io_pipe_req_ready; // @[ICache.scala 658:41]
  assign cacheOpDecoder_clock = clock;
  assign cacheOpDecoder_reset = reset;
  assign cacheOpDecoder_io_csr_distribute_csr_wvalid = io_csr_distribute_csr_wvalid; // @[ICache.scala 691:25]
  assign cacheOpDecoder_io_csr_distribute_csr_waddr = io_csr_distribute_csr_waddr; // @[ICache.scala 691:25]
  assign cacheOpDecoder_io_csr_distribute_csr_wdata = io_csr_distribute_csr_wdata; // @[ICache.scala 691:25]
  assign cacheOpDecoder_io_cache_resp_valid = dataArray_io_cacheOp_resp_valid | metaArray_io_cacheOp_resp_valid; // @[ICache.scala 695:37]
  assign cacheOpDecoder_io_cache_resp_bits_read_tag_low = metaArray_io_cacheOp_resp_valid ?
    metaArray_io_cacheOp_resp_bits_read_tag_low : 64'h0; // @[Mux.scala 27:73]
  assign cacheOpDecoder_io_cache_resp_bits_read_data_vec_0 = dataArray_io_cacheOp_resp_valid ?
    dataArray_io_cacheOp_resp_bits_read_data_vec_0 : 64'h0; // @[Mux.scala 27:73]
  assign cacheOpDecoder_io_cache_resp_bits_read_data_vec_1 = dataArray_io_cacheOp_resp_valid ?
    dataArray_io_cacheOp_resp_bits_read_data_vec_1 : 64'h0; // @[Mux.scala 27:73]
  assign cacheOpDecoder_io_cache_resp_bits_read_data_vec_2 = dataArray_io_cacheOp_resp_valid ?
    dataArray_io_cacheOp_resp_bits_read_data_vec_2 : 64'h0; // @[Mux.scala 27:73]
  assign cacheOpDecoder_io_cache_resp_bits_read_data_vec_3 = dataArray_io_cacheOp_resp_valid ?
    dataArray_io_cacheOp_resp_bits_read_data_vec_3 : 64'h0; // @[Mux.scala 27:73]
  assign cacheOpDecoder_io_cache_resp_bits_read_data_vec_4 = dataArray_io_cacheOp_resp_valid ?
    dataArray_io_cacheOp_resp_bits_read_data_vec_4 : 64'h0; // @[Mux.scala 27:73]
  assign cacheOpDecoder_io_cache_resp_bits_read_data_vec_5 = dataArray_io_cacheOp_resp_valid ?
    dataArray_io_cacheOp_resp_bits_read_data_vec_5 : 64'h0; // @[Mux.scala 27:73]
  assign cacheOpDecoder_io_cache_resp_bits_read_data_vec_6 = dataArray_io_cacheOp_resp_valid ?
    dataArray_io_cacheOp_resp_bits_read_data_vec_6 : 64'h0; // @[Mux.scala 27:73]
  assign cacheOpDecoder_io_cache_resp_bits_read_data_vec_7 = dataArray_io_cacheOp_resp_valid ?
    dataArray_io_cacheOp_resp_bits_read_data_vec_7 : 64'h0; // @[Mux.scala 27:73]
  assign cacheOpDecoder_io_error_source_tag = io_error_source_tag; // @[ICache.scala 701:27]
  assign cacheOpDecoder_io_error_source_data = io_error_source_data; // @[ICache.scala 701:27]
  assign cacheOpDecoder_io_error_source_l2 = io_error_source_l2; // @[ICache.scala 701:27]
  assign cacheOpDecoder_io_error_opType_fetch = io_error_opType_fetch; // @[ICache.scala 701:27]
  assign cacheOpDecoder_io_error_opType_load = io_error_opType_load; // @[ICache.scala 701:27]
  assign cacheOpDecoder_io_error_opType_store = io_error_opType_store; // @[ICache.scala 701:27]
  assign cacheOpDecoder_io_error_opType_probe = io_error_opType_probe; // @[ICache.scala 701:27]
  assign cacheOpDecoder_io_error_opType_release = io_error_opType_release; // @[ICache.scala 701:27]
  assign cacheOpDecoder_io_error_opType_atom = io_error_opType_atom; // @[ICache.scala 701:27]
  assign cacheOpDecoder_io_error_paddr = io_error_paddr; // @[ICache.scala 701:27]
  assign cacheOpDecoder_io_error_report_to_beu = io_error_report_to_beu; // @[ICache.scala 701:27]
  assign cacheOpDecoder_io_error_valid = io_error_valid; // @[ICache.scala 701:27]
  always @(posedge clock) begin
    metaArray_io_write_bits_REG_virIdx <= meta_write_arb_io_out_bits_virIdx; // @[ICache.scala 538:38]
    metaArray_io_write_bits_REG_phyTag <= meta_write_arb_io_out_bits_phyTag; // @[ICache.scala 538:38]
    metaArray_io_write_bits_REG_coh_state <= meta_write_arb_io_out_bits_coh_state; // @[ICache.scala 538:38]
    metaArray_io_write_bits_REG_waymask <= meta_write_arb_io_out_bits_waymask; // @[ICache.scala 538:38]
    metaArray_io_write_bits_REG_bankIdx <= meta_write_arb_io_out_bits_bankIdx; // @[ICache.scala 538:38]
    dataArray_io_write_bits_REG_virIdx <= missUnit_io_data_write_bits_virIdx; // @[ICache.scala 542:38]
    dataArray_io_write_bits_REG_data <= missUnit_io_data_write_bits_data; // @[ICache.scala 542:38]
    dataArray_io_write_bits_REG_waymask <= missUnit_io_data_write_bits_waymask; // @[ICache.scala 542:38]
    dataArray_io_write_bits_REG_bankIdx <= missUnit_io_data_write_bits_bankIdx; // @[ICache.scala 542:38]
    io_error_REG_source_tag <= mainPipe_io_errors_0_valid & mainPipe_io_errors_0_source_tag | mainPipe_io_errors_1_valid
       & mainPipe_io_errors_1_source_tag | replacePipe_io_error_valid & replacePipe_io_error_source_tag; // @[Mux.scala 27:73]
    io_error_REG_source_data <= mainPipe_io_errors_0_valid & mainPipe_io_errors_0_source_data |
      mainPipe_io_errors_1_valid & mainPipe_io_errors_1_source_data | replacePipe_io_error_valid &
      replacePipe_io_error_source_data; // @[Mux.scala 27:73]
    io_error_REG_source_l2 <= mainPipe_io_errors_0_valid & mainPipe_io_errors_0_source_l2 | mainPipe_io_errors_1_valid
       & mainPipe_io_errors_1_source_l2; // @[Mux.scala 27:73]
    io_error_REG_opType_fetch <= mainPipe_io_errors_0_valid | mainPipe_io_errors_1_valid | replacePipe_io_error_valid; // @[Mux.scala 27:73]
    io_error_REG_opType_probe <= replacePipe_io_error_valid & replacePipe_io_error_opType_probe; // @[Mux.scala 27:73]
    io_error_REG_opType_release <= replacePipe_io_error_valid & replacePipe_io_error_opType_release; // @[Mux.scala 27:73]
    io_error_REG_paddr <= _io_error_T_13 | _io_error_T_12; // @[Mux.scala 27:73]
    io_error_REG_report_to_beu <= mainPipe_io_errors_0_valid & mainPipe_io_errors_0_report_to_beu |
      mainPipe_io_errors_1_valid & mainPipe_io_errors_1_report_to_beu | replacePipe_io_error_valid &
      replacePipe_io_error_report_to_beu; // @[Mux.scala 27:73]
    io_error_REG_valid <= mainPipe_io_errors_0_valid | mainPipe_io_errors_1_valid | replacePipe_io_error_valid; // @[Mux.scala 27:73]
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[ICache.scala 537:38]
      metaArray_io_write_valid_REG <= 1'h0; // @[ICache.scala 537:38]
    end else begin
      metaArray_io_write_valid_REG <= meta_write_arb_io_out_valid; // @[ICache.scala 537:38]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[ICache.scala 541:38]
      dataArray_io_write_valid_REG <= 1'h0; // @[ICache.scala 541:38]
    end else begin
      dataArray_io_write_valid_REG <= missUnit_io_data_write_valid; // @[ICache.scala 541:38]
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
  metaArray_io_write_valid_REG = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  metaArray_io_write_bits_REG_virIdx = _RAND_1[5:0];
  _RAND_2 = {1{`RANDOM}};
  metaArray_io_write_bits_REG_phyTag = _RAND_2[23:0];
  _RAND_3 = {1{`RANDOM}};
  metaArray_io_write_bits_REG_coh_state = _RAND_3[1:0];
  _RAND_4 = {1{`RANDOM}};
  metaArray_io_write_bits_REG_waymask = _RAND_4[7:0];
  _RAND_5 = {1{`RANDOM}};
  metaArray_io_write_bits_REG_bankIdx = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  dataArray_io_write_valid_REG = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  dataArray_io_write_bits_REG_virIdx = _RAND_7[5:0];
  _RAND_8 = {16{`RANDOM}};
  dataArray_io_write_bits_REG_data = _RAND_8[511:0];
  _RAND_9 = {1{`RANDOM}};
  dataArray_io_write_bits_REG_waymask = _RAND_9[7:0];
  _RAND_10 = {1{`RANDOM}};
  dataArray_io_write_bits_REG_bankIdx = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  io_error_REG_source_tag = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  io_error_REG_source_data = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  io_error_REG_source_l2 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  io_error_REG_opType_fetch = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  io_error_REG_opType_probe = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  io_error_REG_opType_release = _RAND_16[0:0];
  _RAND_17 = {2{`RANDOM}};
  io_error_REG_paddr = _RAND_17[35:0];
  _RAND_18 = {1{`RANDOM}};
  io_error_REG_report_to_beu = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  io_error_REG_valid = _RAND_19[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    metaArray_io_write_valid_REG = 1'h0;
  end
  if (reset) begin
    dataArray_io_write_valid_REG = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

