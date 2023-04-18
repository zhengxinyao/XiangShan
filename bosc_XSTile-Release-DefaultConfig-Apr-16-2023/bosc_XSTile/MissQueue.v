module MissQueue(
  input          clock,
  input          reset,
  output         io_req_ready,
  input          io_req_valid,
  input  [3:0]   io_req_bits_source,
  input  [4:0]   io_req_bits_cmd,
  input  [35:0]  io_req_bits_addr,
  input  [38:0]  io_req_bits_vaddr,
  input  [7:0]   io_req_bits_way_en,
  input  [2:0]   io_req_bits_word_idx,
  input  [63:0]  io_req_bits_amo_data,
  input  [7:0]   io_req_bits_amo_mask,
  input  [1:0]   io_req_bits_req_coh_state,
  input  [1:0]   io_req_bits_replace_coh_state,
  input  [23:0]  io_req_bits_replace_tag,
  input  [3:0]   io_req_bits_id,
  input          io_req_bits_cancel,
  input  [511:0] io_req_bits_store_data,
  input  [63:0]  io_req_bits_store_mask,
  output [1:0]   io_resp_id,
  output         io_refill_to_ldq_valid,
  output [1:0]   io_refill_to_ldq_bits_id,
  input          io_mem_acquire_ready,
  output         io_mem_acquire_valid,
  output [2:0]   io_mem_acquire_bits_opcode,
  output [2:0]   io_mem_acquire_bits_param,
  output [2:0]   io_mem_acquire_bits_size,
  output [3:0]   io_mem_acquire_bits_source,
  output [35:0]  io_mem_acquire_bits_address,
  output [31:0]  io_mem_acquire_bits_mask,
  output         io_mem_grant_ready,
  input          io_mem_grant_valid,
  input  [2:0]   io_mem_grant_bits_opcode,
  input  [1:0]   io_mem_grant_bits_param,
  input  [2:0]   io_mem_grant_bits_size,
  input  [3:0]   io_mem_grant_bits_source,
  input  [3:0]   io_mem_grant_bits_sink,
  input          io_mem_grant_bits_denied,
  input          io_mem_grant_bits_echo_blockisdirty,
  input  [255:0] io_mem_grant_bits_data,
  input          io_mem_grant_bits_corrupt,
  input          io_mem_finish_ready,
  output         io_mem_finish_valid,
  output [3:0]   io_mem_finish_bits_sink,
  input          io_refill_pipe_req_ready,
  output         io_refill_pipe_req_valid,
  output [3:0]   io_refill_pipe_req_bits_source,
  output [35:0]  io_refill_pipe_req_bits_addr,
  output [7:0]   io_refill_pipe_req_bits_way_en,
  output [1:0]   io_refill_pipe_req_bits_alias,
  output [1:0]   io_refill_pipe_req_bits_miss_id,
  output [3:0]   io_refill_pipe_req_bits_id,
  output         io_refill_pipe_req_bits_error,
  output         io_refill_pipe_req_bits_prefetch,
  output [7:0]   io_refill_pipe_req_bits_wmask,
  output [63:0]  io_refill_pipe_req_bits_data_0,
  output [63:0]  io_refill_pipe_req_bits_data_1,
  output [63:0]  io_refill_pipe_req_bits_data_2,
  output [63:0]  io_refill_pipe_req_bits_data_3,
  output [63:0]  io_refill_pipe_req_bits_data_4,
  output [63:0]  io_refill_pipe_req_bits_data_5,
  output [63:0]  io_refill_pipe_req_bits_data_6,
  output [63:0]  io_refill_pipe_req_bits_data_7,
  output [1:0]   io_refill_pipe_req_bits_meta_coh_state,
  input          io_refill_pipe_req_dup_0_ready,
  output         io_refill_pipe_req_dup_0_valid,
  output [35:0]  io_refill_pipe_req_dup_0_bits_addr,
  output [7:0]   io_refill_pipe_req_dup_0_bits_way_en,
  output [1:0]   io_refill_pipe_req_dup_0_bits_alias,
  input          io_refill_pipe_req_dup_1_ready,
  output         io_refill_pipe_req_dup_1_valid,
  output [35:0]  io_refill_pipe_req_dup_1_bits_addr,
  output [7:0]   io_refill_pipe_req_dup_1_bits_way_en,
  output [1:0]   io_refill_pipe_req_dup_1_bits_alias,
  input          io_refill_pipe_req_dup_2_ready,
  output         io_refill_pipe_req_dup_2_valid,
  output [35:0]  io_refill_pipe_req_dup_2_bits_addr,
  output [7:0]   io_refill_pipe_req_dup_2_bits_way_en,
  output [1:0]   io_refill_pipe_req_dup_2_bits_alias,
  input          io_refill_pipe_req_dup_3_ready,
  output         io_refill_pipe_req_dup_3_valid,
  output [35:0]  io_refill_pipe_req_dup_3_bits_addr,
  output [7:0]   io_refill_pipe_req_dup_3_bits_way_en,
  output [1:0]   io_refill_pipe_req_dup_3_bits_alias,
  input          io_refill_pipe_req_dup_4_ready,
  output         io_refill_pipe_req_dup_4_valid,
  output [35:0]  io_refill_pipe_req_dup_4_bits_addr,
  output [7:0]   io_refill_pipe_req_dup_4_bits_way_en,
  output [1:0]   io_refill_pipe_req_dup_4_bits_alias,
  input          io_refill_pipe_req_dup_5_ready,
  output         io_refill_pipe_req_dup_5_valid,
  output [35:0]  io_refill_pipe_req_dup_5_bits_addr,
  output [7:0]   io_refill_pipe_req_dup_5_bits_way_en,
  output [1:0]   io_refill_pipe_req_dup_5_bits_alias,
  input          io_refill_pipe_req_dup_6_ready,
  output         io_refill_pipe_req_dup_6_valid,
  output [35:0]  io_refill_pipe_req_dup_6_bits_addr,
  output [7:0]   io_refill_pipe_req_dup_6_bits_way_en,
  output [1:0]   io_refill_pipe_req_dup_6_bits_alias,
  input          io_refill_pipe_req_dup_7_ready,
  output         io_refill_pipe_req_dup_7_valid,
  output [35:0]  io_refill_pipe_req_dup_7_bits_addr,
  output [7:0]   io_refill_pipe_req_dup_7_bits_way_en,
  output [1:0]   io_refill_pipe_req_dup_7_bits_alias,
  input          io_refill_pipe_req_dup_8_ready,
  output         io_refill_pipe_req_dup_8_valid,
  output [35:0]  io_refill_pipe_req_dup_8_bits_addr,
  output [7:0]   io_refill_pipe_req_dup_8_bits_way_en,
  output [1:0]   io_refill_pipe_req_dup_8_bits_alias,
  input          io_refill_pipe_req_dup_9_ready,
  output         io_refill_pipe_req_dup_9_valid,
  output [35:0]  io_refill_pipe_req_dup_9_bits_addr,
  output [7:0]   io_refill_pipe_req_dup_9_bits_way_en,
  output [1:0]   io_refill_pipe_req_dup_9_bits_alias,
  input          io_refill_pipe_req_dup_10_ready,
  output         io_refill_pipe_req_dup_10_valid,
  output [35:0]  io_refill_pipe_req_dup_10_bits_addr,
  output [7:0]   io_refill_pipe_req_dup_10_bits_way_en,
  output [1:0]   io_refill_pipe_req_dup_10_bits_alias,
  input          io_refill_pipe_req_dup_11_ready,
  output         io_refill_pipe_req_dup_11_valid,
  output [35:0]  io_refill_pipe_req_dup_11_bits_addr,
  output [7:0]   io_refill_pipe_req_dup_11_bits_way_en,
  output [1:0]   io_refill_pipe_req_dup_11_bits_alias,
  input          io_refill_pipe_req_dup_12_ready,
  output         io_refill_pipe_req_dup_12_valid,
  output [35:0]  io_refill_pipe_req_dup_12_bits_addr,
  output [7:0]   io_refill_pipe_req_dup_12_bits_way_en,
  output [1:0]   io_refill_pipe_req_dup_12_bits_alias,
  input          io_refill_pipe_req_dup_13_ready,
  output         io_refill_pipe_req_dup_13_valid,
  output [35:0]  io_refill_pipe_req_dup_13_bits_addr,
  output [7:0]   io_refill_pipe_req_dup_13_bits_way_en,
  output [1:0]   io_refill_pipe_req_dup_13_bits_alias,
  input          io_refill_pipe_req_dup_14_ready,
  output         io_refill_pipe_req_dup_14_valid,
  output [35:0]  io_refill_pipe_req_dup_14_bits_addr,
  output [7:0]   io_refill_pipe_req_dup_14_bits_way_en,
  output [1:0]   io_refill_pipe_req_dup_14_bits_alias,
  input          io_refill_pipe_req_dup_15_ready,
  output         io_refill_pipe_req_dup_15_valid,
  output [35:0]  io_refill_pipe_req_dup_15_bits_addr,
  output [7:0]   io_refill_pipe_req_dup_15_bits_way_en,
  output [1:0]   io_refill_pipe_req_dup_15_bits_alias,
  input          io_refill_pipe_req_dup_16_ready,
  output         io_refill_pipe_req_dup_16_valid,
  output [35:0]  io_refill_pipe_req_dup_16_bits_addr,
  output [7:0]   io_refill_pipe_req_dup_16_bits_way_en,
  output [1:0]   io_refill_pipe_req_dup_16_bits_alias,
  input          io_refill_pipe_req_dup_17_ready,
  output         io_refill_pipe_req_dup_17_valid,
  output [35:0]  io_refill_pipe_req_dup_17_bits_addr,
  output [7:0]   io_refill_pipe_req_dup_17_bits_way_en,
  output [1:0]   io_refill_pipe_req_dup_17_bits_alias,
  input          io_refill_pipe_req_dup_18_ready,
  output         io_refill_pipe_req_dup_18_valid,
  output [35:0]  io_refill_pipe_req_dup_18_bits_addr,
  output [7:0]   io_refill_pipe_req_dup_18_bits_way_en,
  output [1:0]   io_refill_pipe_req_dup_18_bits_alias,
  input          io_refill_pipe_req_dup_19_ready,
  output         io_refill_pipe_req_dup_19_valid,
  output [35:0]  io_refill_pipe_req_dup_19_bits_addr,
  output [7:0]   io_refill_pipe_req_dup_19_bits_way_en,
  output [1:0]   io_refill_pipe_req_dup_19_bits_alias,
  input          io_refill_pipe_req_dup_20_ready,
  output         io_refill_pipe_req_dup_20_valid,
  output [35:0]  io_refill_pipe_req_dup_20_bits_addr,
  output [7:0]   io_refill_pipe_req_dup_20_bits_way_en,
  output [1:0]   io_refill_pipe_req_dup_20_bits_alias,
  input          io_refill_pipe_req_dup_21_ready,
  output         io_refill_pipe_req_dup_21_valid,
  output [35:0]  io_refill_pipe_req_dup_21_bits_addr,
  output [7:0]   io_refill_pipe_req_dup_21_bits_way_en,
  output [1:0]   io_refill_pipe_req_dup_21_bits_alias,
  input          io_refill_pipe_req_dup_22_ready,
  output         io_refill_pipe_req_dup_22_valid,
  output [35:0]  io_refill_pipe_req_dup_22_bits_addr,
  output [7:0]   io_refill_pipe_req_dup_22_bits_way_en,
  output [1:0]   io_refill_pipe_req_dup_22_bits_alias,
  input          io_refill_pipe_req_dup_23_ready,
  output         io_refill_pipe_req_dup_23_valid,
  output [35:0]  io_refill_pipe_req_dup_23_bits_addr,
  output [7:0]   io_refill_pipe_req_dup_23_bits_way_en,
  output [1:0]   io_refill_pipe_req_dup_23_bits_alias,
  input          io_refill_pipe_resp_valid,
  input  [1:0]   io_refill_pipe_resp_bits,
  input          io_replace_pipe_req_ready,
  output         io_replace_pipe_req_valid,
  output         io_replace_pipe_req_bits_miss,
  output [1:0]   io_replace_pipe_req_bits_miss_id,
  output [1:0]   io_replace_pipe_req_bits_miss_param,
  output         io_replace_pipe_req_bits_miss_dirty,
  output [7:0]   io_replace_pipe_req_bits_miss_way_en,
  output         io_replace_pipe_req_bits_probe,
  output [1:0]   io_replace_pipe_req_bits_probe_param,
  output         io_replace_pipe_req_bits_probe_need_data,
  output [3:0]   io_replace_pipe_req_bits_source,
  output [4:0]   io_replace_pipe_req_bits_cmd,
  output [38:0]  io_replace_pipe_req_bits_vaddr,
  output [35:0]  io_replace_pipe_req_bits_addr,
  output [511:0] io_replace_pipe_req_bits_store_data,
  output [63:0]  io_replace_pipe_req_bits_store_mask,
  output [2:0]   io_replace_pipe_req_bits_word_idx,
  output [63:0]  io_replace_pipe_req_bits_amo_data,
  output [7:0]   io_replace_pipe_req_bits_amo_mask,
  output         io_replace_pipe_req_bits_error,
  output         io_replace_pipe_req_bits_replace,
  output [7:0]   io_replace_pipe_req_bits_replace_way_en,
  output [3:0]   io_replace_pipe_req_bits_id,
  input          io_replace_pipe_resp_valid,
  input  [1:0]   io_replace_pipe_resp_bits,
  input          io_main_pipe_req_ready,
  output         io_main_pipe_req_valid,
  output         io_main_pipe_req_bits_miss,
  output [1:0]   io_main_pipe_req_bits_miss_id,
  output [1:0]   io_main_pipe_req_bits_miss_param,
  output         io_main_pipe_req_bits_miss_dirty,
  output [7:0]   io_main_pipe_req_bits_miss_way_en,
  output [3:0]   io_main_pipe_req_bits_source,
  output [4:0]   io_main_pipe_req_bits_cmd,
  output [38:0]  io_main_pipe_req_bits_vaddr,
  output [35:0]  io_main_pipe_req_bits_addr,
  output [511:0] io_main_pipe_req_bits_store_data,
  output [63:0]  io_main_pipe_req_bits_store_mask,
  output [2:0]   io_main_pipe_req_bits_word_idx,
  output [63:0]  io_main_pipe_req_bits_amo_data,
  output [7:0]   io_main_pipe_req_bits_amo_mask,
  output         io_main_pipe_req_bits_error,
  output [3:0]   io_main_pipe_req_bits_id,
  input          io_main_pipe_resp_valid,
  input  [1:0]   io_main_pipe_resp_bits_miss_id,
  input          io_main_pipe_resp_bits_ack_miss_queue,
  input  [35:0]  io_probe_addr,
  output         io_probe_block,
  input          io_forward_0_valid,
  input  [1:0]   io_forward_0_mshrid,
  input  [35:0]  io_forward_0_paddr,
  output         io_forward_0_forward_mshr,
  output [7:0]   io_forward_0_forwardData_0,
  output [7:0]   io_forward_0_forwardData_1,
  output [7:0]   io_forward_0_forwardData_2,
  output [7:0]   io_forward_0_forwardData_3,
  output [7:0]   io_forward_0_forwardData_4,
  output [7:0]   io_forward_0_forwardData_5,
  output [7:0]   io_forward_0_forwardData_6,
  output [7:0]   io_forward_0_forwardData_7,
  output [7:0]   io_forward_0_forwardData_8,
  output [7:0]   io_forward_0_forwardData_9,
  output [7:0]   io_forward_0_forwardData_10,
  output [7:0]   io_forward_0_forwardData_11,
  output [7:0]   io_forward_0_forwardData_12,
  output [7:0]   io_forward_0_forwardData_13,
  output [7:0]   io_forward_0_forwardData_14,
  output [7:0]   io_forward_0_forwardData_15,
  output         io_forward_0_forward_result_valid,
  input          io_forward_1_valid,
  input  [1:0]   io_forward_1_mshrid,
  input  [35:0]  io_forward_1_paddr,
  output         io_forward_1_forward_mshr,
  output [7:0]   io_forward_1_forwardData_0,
  output [7:0]   io_forward_1_forwardData_1,
  output [7:0]   io_forward_1_forwardData_2,
  output [7:0]   io_forward_1_forwardData_3,
  output [7:0]   io_forward_1_forwardData_4,
  output [7:0]   io_forward_1_forwardData_5,
  output [7:0]   io_forward_1_forwardData_6,
  output [7:0]   io_forward_1_forwardData_7,
  output [7:0]   io_forward_1_forwardData_8,
  output [7:0]   io_forward_1_forwardData_9,
  output [7:0]   io_forward_1_forwardData_10,
  output [7:0]   io_forward_1_forwardData_11,
  output [7:0]   io_forward_1_forwardData_12,
  output [7:0]   io_forward_1_forwardData_13,
  output [7:0]   io_forward_1_forwardData_14,
  output [7:0]   io_forward_1_forwardData_15,
  output         io_forward_1_forward_result_valid,
  output [5:0]   io_perf_0_value,
  output [5:0]   io_perf_1_value,
  output [5:0]   io_perf_2_value,
  output [5:0]   io_perf_3_value,
  output [5:0]   io_perf_4_value
);
`ifdef RANDOMIZE_REG_INIT
  reg [511:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [63:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
`endif // RANDOMIZE_REG_INIT
  wire  entries_0_clock; // @[MissQueue.scala 620:50]
  wire  entries_0_reset; // @[MissQueue.scala 620:50]
  wire [1:0] entries_0_io_id; // @[MissQueue.scala 620:50]
  wire  entries_0_io_req_valid; // @[MissQueue.scala 620:50]
  wire [3:0] entries_0_io_req_bits_source; // @[MissQueue.scala 620:50]
  wire [4:0] entries_0_io_req_bits_cmd; // @[MissQueue.scala 620:50]
  wire [35:0] entries_0_io_req_bits_addr; // @[MissQueue.scala 620:50]
  wire [38:0] entries_0_io_req_bits_vaddr; // @[MissQueue.scala 620:50]
  wire [7:0] entries_0_io_req_bits_way_en; // @[MissQueue.scala 620:50]
  wire [2:0] entries_0_io_req_bits_word_idx; // @[MissQueue.scala 620:50]
  wire [63:0] entries_0_io_req_bits_amo_data; // @[MissQueue.scala 620:50]
  wire [7:0] entries_0_io_req_bits_amo_mask; // @[MissQueue.scala 620:50]
  wire [1:0] entries_0_io_req_bits_req_coh_state; // @[MissQueue.scala 620:50]
  wire [1:0] entries_0_io_req_bits_replace_coh_state; // @[MissQueue.scala 620:50]
  wire [23:0] entries_0_io_req_bits_replace_tag; // @[MissQueue.scala 620:50]
  wire [3:0] entries_0_io_req_bits_id; // @[MissQueue.scala 620:50]
  wire  entries_0_io_req_bits_cancel; // @[MissQueue.scala 620:50]
  wire [511:0] entries_0_io_req_data_store_data; // @[MissQueue.scala 620:50]
  wire [63:0] entries_0_io_req_data_store_mask; // @[MissQueue.scala 620:50]
  wire  entries_0_io_primary_valid; // @[MissQueue.scala 620:50]
  wire  entries_0_io_primary_ready; // @[MissQueue.scala 620:50]
  wire  entries_0_io_secondary_ready; // @[MissQueue.scala 620:50]
  wire  entries_0_io_secondary_reject; // @[MissQueue.scala 620:50]
  wire  entries_0_io_refill_to_ldq_valid; // @[MissQueue.scala 620:50]
  wire [35:0] entries_0_io_refill_to_ldq_bits_addr; // @[MissQueue.scala 620:50]
  wire [255:0] entries_0_io_refill_to_ldq_bits_data; // @[MissQueue.scala 620:50]
  wire  entries_0_io_refill_to_ldq_bits_error; // @[MissQueue.scala 620:50]
  wire [511:0] entries_0_io_refill_to_ldq_bits_data_raw; // @[MissQueue.scala 620:50]
  wire  entries_0_io_refill_to_ldq_bits_hasdata; // @[MissQueue.scala 620:50]
  wire  entries_0_io_refill_to_ldq_bits_refill_done; // @[MissQueue.scala 620:50]
  wire [1:0] entries_0_io_refill_to_ldq_bits_id; // @[MissQueue.scala 620:50]
  wire  entries_0_io_mem_acquire_ready; // @[MissQueue.scala 620:50]
  wire  entries_0_io_mem_acquire_valid; // @[MissQueue.scala 620:50]
  wire [2:0] entries_0_io_mem_acquire_bits_param; // @[MissQueue.scala 620:50]
  wire [3:0] entries_0_io_mem_acquire_bits_source; // @[MissQueue.scala 620:50]
  wire [35:0] entries_0_io_mem_acquire_bits_address; // @[MissQueue.scala 620:50]
  wire  entries_0_io_mem_grant_ready; // @[MissQueue.scala 620:50]
  wire  entries_0_io_mem_grant_valid; // @[MissQueue.scala 620:50]
  wire [2:0] entries_0_io_mem_grant_bits_opcode; // @[MissQueue.scala 620:50]
  wire [1:0] entries_0_io_mem_grant_bits_param; // @[MissQueue.scala 620:50]
  wire [2:0] entries_0_io_mem_grant_bits_size; // @[MissQueue.scala 620:50]
  wire [3:0] entries_0_io_mem_grant_bits_sink; // @[MissQueue.scala 620:50]
  wire  entries_0_io_mem_grant_bits_denied; // @[MissQueue.scala 620:50]
  wire  entries_0_io_mem_grant_bits_echo_blockisdirty; // @[MissQueue.scala 620:50]
  wire [255:0] entries_0_io_mem_grant_bits_data; // @[MissQueue.scala 620:50]
  wire  entries_0_io_mem_grant_bits_corrupt; // @[MissQueue.scala 620:50]
  wire  entries_0_io_mem_finish_ready; // @[MissQueue.scala 620:50]
  wire  entries_0_io_mem_finish_valid; // @[MissQueue.scala 620:50]
  wire [3:0] entries_0_io_mem_finish_bits_sink; // @[MissQueue.scala 620:50]
  wire  entries_0_io_refill_pipe_req_ready; // @[MissQueue.scala 620:50]
  wire  entries_0_io_refill_pipe_req_valid; // @[MissQueue.scala 620:50]
  wire [3:0] entries_0_io_refill_pipe_req_bits_source; // @[MissQueue.scala 620:50]
  wire [35:0] entries_0_io_refill_pipe_req_bits_addr; // @[MissQueue.scala 620:50]
  wire [7:0] entries_0_io_refill_pipe_req_bits_way_en; // @[MissQueue.scala 620:50]
  wire [1:0] entries_0_io_refill_pipe_req_bits_alias; // @[MissQueue.scala 620:50]
  wire [1:0] entries_0_io_refill_pipe_req_bits_miss_id; // @[MissQueue.scala 620:50]
  wire [3:0] entries_0_io_refill_pipe_req_bits_id; // @[MissQueue.scala 620:50]
  wire  entries_0_io_refill_pipe_req_bits_error; // @[MissQueue.scala 620:50]
  wire  entries_0_io_refill_pipe_req_bits_prefetch; // @[MissQueue.scala 620:50]
  wire [7:0] entries_0_io_refill_pipe_req_bits_wmask; // @[MissQueue.scala 620:50]
  wire [63:0] entries_0_io_refill_pipe_req_bits_data_0; // @[MissQueue.scala 620:50]
  wire [63:0] entries_0_io_refill_pipe_req_bits_data_1; // @[MissQueue.scala 620:50]
  wire [63:0] entries_0_io_refill_pipe_req_bits_data_2; // @[MissQueue.scala 620:50]
  wire [63:0] entries_0_io_refill_pipe_req_bits_data_3; // @[MissQueue.scala 620:50]
  wire [63:0] entries_0_io_refill_pipe_req_bits_data_4; // @[MissQueue.scala 620:50]
  wire [63:0] entries_0_io_refill_pipe_req_bits_data_5; // @[MissQueue.scala 620:50]
  wire [63:0] entries_0_io_refill_pipe_req_bits_data_6; // @[MissQueue.scala 620:50]
  wire [63:0] entries_0_io_refill_pipe_req_bits_data_7; // @[MissQueue.scala 620:50]
  wire [1:0] entries_0_io_refill_pipe_req_bits_meta_coh_state; // @[MissQueue.scala 620:50]
  wire  entries_0_io_refill_pipe_resp; // @[MissQueue.scala 620:50]
  wire  entries_0_io_replace_pipe_req_ready; // @[MissQueue.scala 620:50]
  wire  entries_0_io_replace_pipe_req_valid; // @[MissQueue.scala 620:50]
  wire [1:0] entries_0_io_replace_pipe_req_bits_miss_id; // @[MissQueue.scala 620:50]
  wire [38:0] entries_0_io_replace_pipe_req_bits_vaddr; // @[MissQueue.scala 620:50]
  wire [35:0] entries_0_io_replace_pipe_req_bits_addr; // @[MissQueue.scala 620:50]
  wire [7:0] entries_0_io_replace_pipe_req_bits_replace_way_en; // @[MissQueue.scala 620:50]
  wire  entries_0_io_replace_pipe_resp; // @[MissQueue.scala 620:50]
  wire  entries_0_io_main_pipe_req_ready; // @[MissQueue.scala 620:50]
  wire  entries_0_io_main_pipe_req_valid; // @[MissQueue.scala 620:50]
  wire [1:0] entries_0_io_main_pipe_req_bits_miss_id; // @[MissQueue.scala 620:50]
  wire [1:0] entries_0_io_main_pipe_req_bits_miss_param; // @[MissQueue.scala 620:50]
  wire  entries_0_io_main_pipe_req_bits_miss_dirty; // @[MissQueue.scala 620:50]
  wire [7:0] entries_0_io_main_pipe_req_bits_miss_way_en; // @[MissQueue.scala 620:50]
  wire [3:0] entries_0_io_main_pipe_req_bits_source; // @[MissQueue.scala 620:50]
  wire [4:0] entries_0_io_main_pipe_req_bits_cmd; // @[MissQueue.scala 620:50]
  wire [38:0] entries_0_io_main_pipe_req_bits_vaddr; // @[MissQueue.scala 620:50]
  wire [35:0] entries_0_io_main_pipe_req_bits_addr; // @[MissQueue.scala 620:50]
  wire [511:0] entries_0_io_main_pipe_req_bits_store_data; // @[MissQueue.scala 620:50]
  wire [2:0] entries_0_io_main_pipe_req_bits_word_idx; // @[MissQueue.scala 620:50]
  wire [63:0] entries_0_io_main_pipe_req_bits_amo_data; // @[MissQueue.scala 620:50]
  wire [7:0] entries_0_io_main_pipe_req_bits_amo_mask; // @[MissQueue.scala 620:50]
  wire  entries_0_io_main_pipe_req_bits_error; // @[MissQueue.scala 620:50]
  wire [3:0] entries_0_io_main_pipe_req_bits_id; // @[MissQueue.scala 620:50]
  wire  entries_0_io_main_pipe_resp; // @[MissQueue.scala 620:50]
  wire  entries_0_io_block_addr_valid; // @[MissQueue.scala 620:50]
  wire [35:0] entries_0_io_block_addr_bits; // @[MissQueue.scala 620:50]
  wire  entries_0_io_req_handled_by_this_entry; // @[MissQueue.scala 620:50]
  wire  entries_0_io_forwardInfo_inflight; // @[MissQueue.scala 620:50]
  wire [35:0] entries_0_io_forwardInfo_paddr; // @[MissQueue.scala 620:50]
  wire [255:0] entries_0_io_forwardInfo_raw_data_0; // @[MissQueue.scala 620:50]
  wire [255:0] entries_0_io_forwardInfo_raw_data_1; // @[MissQueue.scala 620:50]
  wire  entries_0_io_forwardInfo_firstbeat_valid; // @[MissQueue.scala 620:50]
  wire  entries_0_io_forwardInfo_lastbeat_valid; // @[MissQueue.scala 620:50]
  wire  entries_1_clock; // @[MissQueue.scala 620:50]
  wire  entries_1_reset; // @[MissQueue.scala 620:50]
  wire [1:0] entries_1_io_id; // @[MissQueue.scala 620:50]
  wire  entries_1_io_req_valid; // @[MissQueue.scala 620:50]
  wire [3:0] entries_1_io_req_bits_source; // @[MissQueue.scala 620:50]
  wire [4:0] entries_1_io_req_bits_cmd; // @[MissQueue.scala 620:50]
  wire [35:0] entries_1_io_req_bits_addr; // @[MissQueue.scala 620:50]
  wire [38:0] entries_1_io_req_bits_vaddr; // @[MissQueue.scala 620:50]
  wire [7:0] entries_1_io_req_bits_way_en; // @[MissQueue.scala 620:50]
  wire [2:0] entries_1_io_req_bits_word_idx; // @[MissQueue.scala 620:50]
  wire [63:0] entries_1_io_req_bits_amo_data; // @[MissQueue.scala 620:50]
  wire [7:0] entries_1_io_req_bits_amo_mask; // @[MissQueue.scala 620:50]
  wire [1:0] entries_1_io_req_bits_req_coh_state; // @[MissQueue.scala 620:50]
  wire [1:0] entries_1_io_req_bits_replace_coh_state; // @[MissQueue.scala 620:50]
  wire [23:0] entries_1_io_req_bits_replace_tag; // @[MissQueue.scala 620:50]
  wire [3:0] entries_1_io_req_bits_id; // @[MissQueue.scala 620:50]
  wire  entries_1_io_req_bits_cancel; // @[MissQueue.scala 620:50]
  wire [511:0] entries_1_io_req_data_store_data; // @[MissQueue.scala 620:50]
  wire [63:0] entries_1_io_req_data_store_mask; // @[MissQueue.scala 620:50]
  wire  entries_1_io_primary_valid; // @[MissQueue.scala 620:50]
  wire  entries_1_io_primary_ready; // @[MissQueue.scala 620:50]
  wire  entries_1_io_secondary_ready; // @[MissQueue.scala 620:50]
  wire  entries_1_io_secondary_reject; // @[MissQueue.scala 620:50]
  wire  entries_1_io_refill_to_ldq_valid; // @[MissQueue.scala 620:50]
  wire [35:0] entries_1_io_refill_to_ldq_bits_addr; // @[MissQueue.scala 620:50]
  wire [255:0] entries_1_io_refill_to_ldq_bits_data; // @[MissQueue.scala 620:50]
  wire  entries_1_io_refill_to_ldq_bits_error; // @[MissQueue.scala 620:50]
  wire [511:0] entries_1_io_refill_to_ldq_bits_data_raw; // @[MissQueue.scala 620:50]
  wire  entries_1_io_refill_to_ldq_bits_hasdata; // @[MissQueue.scala 620:50]
  wire  entries_1_io_refill_to_ldq_bits_refill_done; // @[MissQueue.scala 620:50]
  wire [1:0] entries_1_io_refill_to_ldq_bits_id; // @[MissQueue.scala 620:50]
  wire  entries_1_io_mem_acquire_ready; // @[MissQueue.scala 620:50]
  wire  entries_1_io_mem_acquire_valid; // @[MissQueue.scala 620:50]
  wire [2:0] entries_1_io_mem_acquire_bits_param; // @[MissQueue.scala 620:50]
  wire [3:0] entries_1_io_mem_acquire_bits_source; // @[MissQueue.scala 620:50]
  wire [35:0] entries_1_io_mem_acquire_bits_address; // @[MissQueue.scala 620:50]
  wire  entries_1_io_mem_grant_ready; // @[MissQueue.scala 620:50]
  wire  entries_1_io_mem_grant_valid; // @[MissQueue.scala 620:50]
  wire [2:0] entries_1_io_mem_grant_bits_opcode; // @[MissQueue.scala 620:50]
  wire [1:0] entries_1_io_mem_grant_bits_param; // @[MissQueue.scala 620:50]
  wire [2:0] entries_1_io_mem_grant_bits_size; // @[MissQueue.scala 620:50]
  wire [3:0] entries_1_io_mem_grant_bits_sink; // @[MissQueue.scala 620:50]
  wire  entries_1_io_mem_grant_bits_denied; // @[MissQueue.scala 620:50]
  wire  entries_1_io_mem_grant_bits_echo_blockisdirty; // @[MissQueue.scala 620:50]
  wire [255:0] entries_1_io_mem_grant_bits_data; // @[MissQueue.scala 620:50]
  wire  entries_1_io_mem_grant_bits_corrupt; // @[MissQueue.scala 620:50]
  wire  entries_1_io_mem_finish_ready; // @[MissQueue.scala 620:50]
  wire  entries_1_io_mem_finish_valid; // @[MissQueue.scala 620:50]
  wire [3:0] entries_1_io_mem_finish_bits_sink; // @[MissQueue.scala 620:50]
  wire  entries_1_io_refill_pipe_req_ready; // @[MissQueue.scala 620:50]
  wire  entries_1_io_refill_pipe_req_valid; // @[MissQueue.scala 620:50]
  wire [3:0] entries_1_io_refill_pipe_req_bits_source; // @[MissQueue.scala 620:50]
  wire [35:0] entries_1_io_refill_pipe_req_bits_addr; // @[MissQueue.scala 620:50]
  wire [7:0] entries_1_io_refill_pipe_req_bits_way_en; // @[MissQueue.scala 620:50]
  wire [1:0] entries_1_io_refill_pipe_req_bits_alias; // @[MissQueue.scala 620:50]
  wire [1:0] entries_1_io_refill_pipe_req_bits_miss_id; // @[MissQueue.scala 620:50]
  wire [3:0] entries_1_io_refill_pipe_req_bits_id; // @[MissQueue.scala 620:50]
  wire  entries_1_io_refill_pipe_req_bits_error; // @[MissQueue.scala 620:50]
  wire  entries_1_io_refill_pipe_req_bits_prefetch; // @[MissQueue.scala 620:50]
  wire [7:0] entries_1_io_refill_pipe_req_bits_wmask; // @[MissQueue.scala 620:50]
  wire [63:0] entries_1_io_refill_pipe_req_bits_data_0; // @[MissQueue.scala 620:50]
  wire [63:0] entries_1_io_refill_pipe_req_bits_data_1; // @[MissQueue.scala 620:50]
  wire [63:0] entries_1_io_refill_pipe_req_bits_data_2; // @[MissQueue.scala 620:50]
  wire [63:0] entries_1_io_refill_pipe_req_bits_data_3; // @[MissQueue.scala 620:50]
  wire [63:0] entries_1_io_refill_pipe_req_bits_data_4; // @[MissQueue.scala 620:50]
  wire [63:0] entries_1_io_refill_pipe_req_bits_data_5; // @[MissQueue.scala 620:50]
  wire [63:0] entries_1_io_refill_pipe_req_bits_data_6; // @[MissQueue.scala 620:50]
  wire [63:0] entries_1_io_refill_pipe_req_bits_data_7; // @[MissQueue.scala 620:50]
  wire [1:0] entries_1_io_refill_pipe_req_bits_meta_coh_state; // @[MissQueue.scala 620:50]
  wire  entries_1_io_refill_pipe_resp; // @[MissQueue.scala 620:50]
  wire  entries_1_io_replace_pipe_req_ready; // @[MissQueue.scala 620:50]
  wire  entries_1_io_replace_pipe_req_valid; // @[MissQueue.scala 620:50]
  wire [1:0] entries_1_io_replace_pipe_req_bits_miss_id; // @[MissQueue.scala 620:50]
  wire [38:0] entries_1_io_replace_pipe_req_bits_vaddr; // @[MissQueue.scala 620:50]
  wire [35:0] entries_1_io_replace_pipe_req_bits_addr; // @[MissQueue.scala 620:50]
  wire [7:0] entries_1_io_replace_pipe_req_bits_replace_way_en; // @[MissQueue.scala 620:50]
  wire  entries_1_io_replace_pipe_resp; // @[MissQueue.scala 620:50]
  wire  entries_1_io_main_pipe_req_ready; // @[MissQueue.scala 620:50]
  wire  entries_1_io_main_pipe_req_valid; // @[MissQueue.scala 620:50]
  wire [1:0] entries_1_io_main_pipe_req_bits_miss_id; // @[MissQueue.scala 620:50]
  wire [1:0] entries_1_io_main_pipe_req_bits_miss_param; // @[MissQueue.scala 620:50]
  wire  entries_1_io_main_pipe_req_bits_miss_dirty; // @[MissQueue.scala 620:50]
  wire [7:0] entries_1_io_main_pipe_req_bits_miss_way_en; // @[MissQueue.scala 620:50]
  wire [3:0] entries_1_io_main_pipe_req_bits_source; // @[MissQueue.scala 620:50]
  wire [4:0] entries_1_io_main_pipe_req_bits_cmd; // @[MissQueue.scala 620:50]
  wire [38:0] entries_1_io_main_pipe_req_bits_vaddr; // @[MissQueue.scala 620:50]
  wire [35:0] entries_1_io_main_pipe_req_bits_addr; // @[MissQueue.scala 620:50]
  wire [511:0] entries_1_io_main_pipe_req_bits_store_data; // @[MissQueue.scala 620:50]
  wire [2:0] entries_1_io_main_pipe_req_bits_word_idx; // @[MissQueue.scala 620:50]
  wire [63:0] entries_1_io_main_pipe_req_bits_amo_data; // @[MissQueue.scala 620:50]
  wire [7:0] entries_1_io_main_pipe_req_bits_amo_mask; // @[MissQueue.scala 620:50]
  wire  entries_1_io_main_pipe_req_bits_error; // @[MissQueue.scala 620:50]
  wire [3:0] entries_1_io_main_pipe_req_bits_id; // @[MissQueue.scala 620:50]
  wire  entries_1_io_main_pipe_resp; // @[MissQueue.scala 620:50]
  wire  entries_1_io_block_addr_valid; // @[MissQueue.scala 620:50]
  wire [35:0] entries_1_io_block_addr_bits; // @[MissQueue.scala 620:50]
  wire  entries_1_io_req_handled_by_this_entry; // @[MissQueue.scala 620:50]
  wire  entries_1_io_forwardInfo_inflight; // @[MissQueue.scala 620:50]
  wire [35:0] entries_1_io_forwardInfo_paddr; // @[MissQueue.scala 620:50]
  wire [255:0] entries_1_io_forwardInfo_raw_data_0; // @[MissQueue.scala 620:50]
  wire [255:0] entries_1_io_forwardInfo_raw_data_1; // @[MissQueue.scala 620:50]
  wire  entries_1_io_forwardInfo_firstbeat_valid; // @[MissQueue.scala 620:50]
  wire  entries_1_io_forwardInfo_lastbeat_valid; // @[MissQueue.scala 620:50]
  wire  entries_2_clock; // @[MissQueue.scala 620:50]
  wire  entries_2_reset; // @[MissQueue.scala 620:50]
  wire [1:0] entries_2_io_id; // @[MissQueue.scala 620:50]
  wire  entries_2_io_req_valid; // @[MissQueue.scala 620:50]
  wire [3:0] entries_2_io_req_bits_source; // @[MissQueue.scala 620:50]
  wire [4:0] entries_2_io_req_bits_cmd; // @[MissQueue.scala 620:50]
  wire [35:0] entries_2_io_req_bits_addr; // @[MissQueue.scala 620:50]
  wire [38:0] entries_2_io_req_bits_vaddr; // @[MissQueue.scala 620:50]
  wire [7:0] entries_2_io_req_bits_way_en; // @[MissQueue.scala 620:50]
  wire [2:0] entries_2_io_req_bits_word_idx; // @[MissQueue.scala 620:50]
  wire [63:0] entries_2_io_req_bits_amo_data; // @[MissQueue.scala 620:50]
  wire [7:0] entries_2_io_req_bits_amo_mask; // @[MissQueue.scala 620:50]
  wire [1:0] entries_2_io_req_bits_req_coh_state; // @[MissQueue.scala 620:50]
  wire [1:0] entries_2_io_req_bits_replace_coh_state; // @[MissQueue.scala 620:50]
  wire [23:0] entries_2_io_req_bits_replace_tag; // @[MissQueue.scala 620:50]
  wire [3:0] entries_2_io_req_bits_id; // @[MissQueue.scala 620:50]
  wire  entries_2_io_req_bits_cancel; // @[MissQueue.scala 620:50]
  wire [511:0] entries_2_io_req_data_store_data; // @[MissQueue.scala 620:50]
  wire [63:0] entries_2_io_req_data_store_mask; // @[MissQueue.scala 620:50]
  wire  entries_2_io_primary_valid; // @[MissQueue.scala 620:50]
  wire  entries_2_io_primary_ready; // @[MissQueue.scala 620:50]
  wire  entries_2_io_secondary_ready; // @[MissQueue.scala 620:50]
  wire  entries_2_io_secondary_reject; // @[MissQueue.scala 620:50]
  wire  entries_2_io_refill_to_ldq_valid; // @[MissQueue.scala 620:50]
  wire [35:0] entries_2_io_refill_to_ldq_bits_addr; // @[MissQueue.scala 620:50]
  wire [255:0] entries_2_io_refill_to_ldq_bits_data; // @[MissQueue.scala 620:50]
  wire  entries_2_io_refill_to_ldq_bits_error; // @[MissQueue.scala 620:50]
  wire [511:0] entries_2_io_refill_to_ldq_bits_data_raw; // @[MissQueue.scala 620:50]
  wire  entries_2_io_refill_to_ldq_bits_hasdata; // @[MissQueue.scala 620:50]
  wire  entries_2_io_refill_to_ldq_bits_refill_done; // @[MissQueue.scala 620:50]
  wire [1:0] entries_2_io_refill_to_ldq_bits_id; // @[MissQueue.scala 620:50]
  wire  entries_2_io_mem_acquire_ready; // @[MissQueue.scala 620:50]
  wire  entries_2_io_mem_acquire_valid; // @[MissQueue.scala 620:50]
  wire [2:0] entries_2_io_mem_acquire_bits_param; // @[MissQueue.scala 620:50]
  wire [3:0] entries_2_io_mem_acquire_bits_source; // @[MissQueue.scala 620:50]
  wire [35:0] entries_2_io_mem_acquire_bits_address; // @[MissQueue.scala 620:50]
  wire  entries_2_io_mem_grant_ready; // @[MissQueue.scala 620:50]
  wire  entries_2_io_mem_grant_valid; // @[MissQueue.scala 620:50]
  wire [2:0] entries_2_io_mem_grant_bits_opcode; // @[MissQueue.scala 620:50]
  wire [1:0] entries_2_io_mem_grant_bits_param; // @[MissQueue.scala 620:50]
  wire [2:0] entries_2_io_mem_grant_bits_size; // @[MissQueue.scala 620:50]
  wire [3:0] entries_2_io_mem_grant_bits_sink; // @[MissQueue.scala 620:50]
  wire  entries_2_io_mem_grant_bits_denied; // @[MissQueue.scala 620:50]
  wire  entries_2_io_mem_grant_bits_echo_blockisdirty; // @[MissQueue.scala 620:50]
  wire [255:0] entries_2_io_mem_grant_bits_data; // @[MissQueue.scala 620:50]
  wire  entries_2_io_mem_grant_bits_corrupt; // @[MissQueue.scala 620:50]
  wire  entries_2_io_mem_finish_ready; // @[MissQueue.scala 620:50]
  wire  entries_2_io_mem_finish_valid; // @[MissQueue.scala 620:50]
  wire [3:0] entries_2_io_mem_finish_bits_sink; // @[MissQueue.scala 620:50]
  wire  entries_2_io_refill_pipe_req_ready; // @[MissQueue.scala 620:50]
  wire  entries_2_io_refill_pipe_req_valid; // @[MissQueue.scala 620:50]
  wire [3:0] entries_2_io_refill_pipe_req_bits_source; // @[MissQueue.scala 620:50]
  wire [35:0] entries_2_io_refill_pipe_req_bits_addr; // @[MissQueue.scala 620:50]
  wire [7:0] entries_2_io_refill_pipe_req_bits_way_en; // @[MissQueue.scala 620:50]
  wire [1:0] entries_2_io_refill_pipe_req_bits_alias; // @[MissQueue.scala 620:50]
  wire [1:0] entries_2_io_refill_pipe_req_bits_miss_id; // @[MissQueue.scala 620:50]
  wire [3:0] entries_2_io_refill_pipe_req_bits_id; // @[MissQueue.scala 620:50]
  wire  entries_2_io_refill_pipe_req_bits_error; // @[MissQueue.scala 620:50]
  wire  entries_2_io_refill_pipe_req_bits_prefetch; // @[MissQueue.scala 620:50]
  wire [7:0] entries_2_io_refill_pipe_req_bits_wmask; // @[MissQueue.scala 620:50]
  wire [63:0] entries_2_io_refill_pipe_req_bits_data_0; // @[MissQueue.scala 620:50]
  wire [63:0] entries_2_io_refill_pipe_req_bits_data_1; // @[MissQueue.scala 620:50]
  wire [63:0] entries_2_io_refill_pipe_req_bits_data_2; // @[MissQueue.scala 620:50]
  wire [63:0] entries_2_io_refill_pipe_req_bits_data_3; // @[MissQueue.scala 620:50]
  wire [63:0] entries_2_io_refill_pipe_req_bits_data_4; // @[MissQueue.scala 620:50]
  wire [63:0] entries_2_io_refill_pipe_req_bits_data_5; // @[MissQueue.scala 620:50]
  wire [63:0] entries_2_io_refill_pipe_req_bits_data_6; // @[MissQueue.scala 620:50]
  wire [63:0] entries_2_io_refill_pipe_req_bits_data_7; // @[MissQueue.scala 620:50]
  wire [1:0] entries_2_io_refill_pipe_req_bits_meta_coh_state; // @[MissQueue.scala 620:50]
  wire  entries_2_io_refill_pipe_resp; // @[MissQueue.scala 620:50]
  wire  entries_2_io_replace_pipe_req_ready; // @[MissQueue.scala 620:50]
  wire  entries_2_io_replace_pipe_req_valid; // @[MissQueue.scala 620:50]
  wire [1:0] entries_2_io_replace_pipe_req_bits_miss_id; // @[MissQueue.scala 620:50]
  wire [38:0] entries_2_io_replace_pipe_req_bits_vaddr; // @[MissQueue.scala 620:50]
  wire [35:0] entries_2_io_replace_pipe_req_bits_addr; // @[MissQueue.scala 620:50]
  wire [7:0] entries_2_io_replace_pipe_req_bits_replace_way_en; // @[MissQueue.scala 620:50]
  wire  entries_2_io_replace_pipe_resp; // @[MissQueue.scala 620:50]
  wire  entries_2_io_main_pipe_req_ready; // @[MissQueue.scala 620:50]
  wire  entries_2_io_main_pipe_req_valid; // @[MissQueue.scala 620:50]
  wire [1:0] entries_2_io_main_pipe_req_bits_miss_id; // @[MissQueue.scala 620:50]
  wire [1:0] entries_2_io_main_pipe_req_bits_miss_param; // @[MissQueue.scala 620:50]
  wire  entries_2_io_main_pipe_req_bits_miss_dirty; // @[MissQueue.scala 620:50]
  wire [7:0] entries_2_io_main_pipe_req_bits_miss_way_en; // @[MissQueue.scala 620:50]
  wire [3:0] entries_2_io_main_pipe_req_bits_source; // @[MissQueue.scala 620:50]
  wire [4:0] entries_2_io_main_pipe_req_bits_cmd; // @[MissQueue.scala 620:50]
  wire [38:0] entries_2_io_main_pipe_req_bits_vaddr; // @[MissQueue.scala 620:50]
  wire [35:0] entries_2_io_main_pipe_req_bits_addr; // @[MissQueue.scala 620:50]
  wire [511:0] entries_2_io_main_pipe_req_bits_store_data; // @[MissQueue.scala 620:50]
  wire [2:0] entries_2_io_main_pipe_req_bits_word_idx; // @[MissQueue.scala 620:50]
  wire [63:0] entries_2_io_main_pipe_req_bits_amo_data; // @[MissQueue.scala 620:50]
  wire [7:0] entries_2_io_main_pipe_req_bits_amo_mask; // @[MissQueue.scala 620:50]
  wire  entries_2_io_main_pipe_req_bits_error; // @[MissQueue.scala 620:50]
  wire [3:0] entries_2_io_main_pipe_req_bits_id; // @[MissQueue.scala 620:50]
  wire  entries_2_io_main_pipe_resp; // @[MissQueue.scala 620:50]
  wire  entries_2_io_block_addr_valid; // @[MissQueue.scala 620:50]
  wire [35:0] entries_2_io_block_addr_bits; // @[MissQueue.scala 620:50]
  wire  entries_2_io_req_handled_by_this_entry; // @[MissQueue.scala 620:50]
  wire  entries_2_io_forwardInfo_inflight; // @[MissQueue.scala 620:50]
  wire [35:0] entries_2_io_forwardInfo_paddr; // @[MissQueue.scala 620:50]
  wire [255:0] entries_2_io_forwardInfo_raw_data_0; // @[MissQueue.scala 620:50]
  wire [255:0] entries_2_io_forwardInfo_raw_data_1; // @[MissQueue.scala 620:50]
  wire  entries_2_io_forwardInfo_firstbeat_valid; // @[MissQueue.scala 620:50]
  wire  entries_2_io_forwardInfo_lastbeat_valid; // @[MissQueue.scala 620:50]
  wire  entries_3_clock; // @[MissQueue.scala 620:50]
  wire  entries_3_reset; // @[MissQueue.scala 620:50]
  wire [1:0] entries_3_io_id; // @[MissQueue.scala 620:50]
  wire  entries_3_io_req_valid; // @[MissQueue.scala 620:50]
  wire [3:0] entries_3_io_req_bits_source; // @[MissQueue.scala 620:50]
  wire [4:0] entries_3_io_req_bits_cmd; // @[MissQueue.scala 620:50]
  wire [35:0] entries_3_io_req_bits_addr; // @[MissQueue.scala 620:50]
  wire [38:0] entries_3_io_req_bits_vaddr; // @[MissQueue.scala 620:50]
  wire [7:0] entries_3_io_req_bits_way_en; // @[MissQueue.scala 620:50]
  wire [2:0] entries_3_io_req_bits_word_idx; // @[MissQueue.scala 620:50]
  wire [63:0] entries_3_io_req_bits_amo_data; // @[MissQueue.scala 620:50]
  wire [7:0] entries_3_io_req_bits_amo_mask; // @[MissQueue.scala 620:50]
  wire [1:0] entries_3_io_req_bits_req_coh_state; // @[MissQueue.scala 620:50]
  wire [1:0] entries_3_io_req_bits_replace_coh_state; // @[MissQueue.scala 620:50]
  wire [23:0] entries_3_io_req_bits_replace_tag; // @[MissQueue.scala 620:50]
  wire [3:0] entries_3_io_req_bits_id; // @[MissQueue.scala 620:50]
  wire  entries_3_io_req_bits_cancel; // @[MissQueue.scala 620:50]
  wire [511:0] entries_3_io_req_data_store_data; // @[MissQueue.scala 620:50]
  wire [63:0] entries_3_io_req_data_store_mask; // @[MissQueue.scala 620:50]
  wire  entries_3_io_primary_valid; // @[MissQueue.scala 620:50]
  wire  entries_3_io_primary_ready; // @[MissQueue.scala 620:50]
  wire  entries_3_io_secondary_ready; // @[MissQueue.scala 620:50]
  wire  entries_3_io_secondary_reject; // @[MissQueue.scala 620:50]
  wire  entries_3_io_refill_to_ldq_valid; // @[MissQueue.scala 620:50]
  wire [35:0] entries_3_io_refill_to_ldq_bits_addr; // @[MissQueue.scala 620:50]
  wire [255:0] entries_3_io_refill_to_ldq_bits_data; // @[MissQueue.scala 620:50]
  wire  entries_3_io_refill_to_ldq_bits_error; // @[MissQueue.scala 620:50]
  wire [511:0] entries_3_io_refill_to_ldq_bits_data_raw; // @[MissQueue.scala 620:50]
  wire  entries_3_io_refill_to_ldq_bits_hasdata; // @[MissQueue.scala 620:50]
  wire  entries_3_io_refill_to_ldq_bits_refill_done; // @[MissQueue.scala 620:50]
  wire [1:0] entries_3_io_refill_to_ldq_bits_id; // @[MissQueue.scala 620:50]
  wire  entries_3_io_mem_acquire_ready; // @[MissQueue.scala 620:50]
  wire  entries_3_io_mem_acquire_valid; // @[MissQueue.scala 620:50]
  wire [2:0] entries_3_io_mem_acquire_bits_param; // @[MissQueue.scala 620:50]
  wire [3:0] entries_3_io_mem_acquire_bits_source; // @[MissQueue.scala 620:50]
  wire [35:0] entries_3_io_mem_acquire_bits_address; // @[MissQueue.scala 620:50]
  wire  entries_3_io_mem_grant_ready; // @[MissQueue.scala 620:50]
  wire  entries_3_io_mem_grant_valid; // @[MissQueue.scala 620:50]
  wire [2:0] entries_3_io_mem_grant_bits_opcode; // @[MissQueue.scala 620:50]
  wire [1:0] entries_3_io_mem_grant_bits_param; // @[MissQueue.scala 620:50]
  wire [2:0] entries_3_io_mem_grant_bits_size; // @[MissQueue.scala 620:50]
  wire [3:0] entries_3_io_mem_grant_bits_sink; // @[MissQueue.scala 620:50]
  wire  entries_3_io_mem_grant_bits_denied; // @[MissQueue.scala 620:50]
  wire  entries_3_io_mem_grant_bits_echo_blockisdirty; // @[MissQueue.scala 620:50]
  wire [255:0] entries_3_io_mem_grant_bits_data; // @[MissQueue.scala 620:50]
  wire  entries_3_io_mem_grant_bits_corrupt; // @[MissQueue.scala 620:50]
  wire  entries_3_io_mem_finish_ready; // @[MissQueue.scala 620:50]
  wire  entries_3_io_mem_finish_valid; // @[MissQueue.scala 620:50]
  wire [3:0] entries_3_io_mem_finish_bits_sink; // @[MissQueue.scala 620:50]
  wire  entries_3_io_refill_pipe_req_ready; // @[MissQueue.scala 620:50]
  wire  entries_3_io_refill_pipe_req_valid; // @[MissQueue.scala 620:50]
  wire [3:0] entries_3_io_refill_pipe_req_bits_source; // @[MissQueue.scala 620:50]
  wire [35:0] entries_3_io_refill_pipe_req_bits_addr; // @[MissQueue.scala 620:50]
  wire [7:0] entries_3_io_refill_pipe_req_bits_way_en; // @[MissQueue.scala 620:50]
  wire [1:0] entries_3_io_refill_pipe_req_bits_alias; // @[MissQueue.scala 620:50]
  wire [1:0] entries_3_io_refill_pipe_req_bits_miss_id; // @[MissQueue.scala 620:50]
  wire [3:0] entries_3_io_refill_pipe_req_bits_id; // @[MissQueue.scala 620:50]
  wire  entries_3_io_refill_pipe_req_bits_error; // @[MissQueue.scala 620:50]
  wire  entries_3_io_refill_pipe_req_bits_prefetch; // @[MissQueue.scala 620:50]
  wire [7:0] entries_3_io_refill_pipe_req_bits_wmask; // @[MissQueue.scala 620:50]
  wire [63:0] entries_3_io_refill_pipe_req_bits_data_0; // @[MissQueue.scala 620:50]
  wire [63:0] entries_3_io_refill_pipe_req_bits_data_1; // @[MissQueue.scala 620:50]
  wire [63:0] entries_3_io_refill_pipe_req_bits_data_2; // @[MissQueue.scala 620:50]
  wire [63:0] entries_3_io_refill_pipe_req_bits_data_3; // @[MissQueue.scala 620:50]
  wire [63:0] entries_3_io_refill_pipe_req_bits_data_4; // @[MissQueue.scala 620:50]
  wire [63:0] entries_3_io_refill_pipe_req_bits_data_5; // @[MissQueue.scala 620:50]
  wire [63:0] entries_3_io_refill_pipe_req_bits_data_6; // @[MissQueue.scala 620:50]
  wire [63:0] entries_3_io_refill_pipe_req_bits_data_7; // @[MissQueue.scala 620:50]
  wire [1:0] entries_3_io_refill_pipe_req_bits_meta_coh_state; // @[MissQueue.scala 620:50]
  wire  entries_3_io_refill_pipe_resp; // @[MissQueue.scala 620:50]
  wire  entries_3_io_replace_pipe_req_ready; // @[MissQueue.scala 620:50]
  wire  entries_3_io_replace_pipe_req_valid; // @[MissQueue.scala 620:50]
  wire [1:0] entries_3_io_replace_pipe_req_bits_miss_id; // @[MissQueue.scala 620:50]
  wire [38:0] entries_3_io_replace_pipe_req_bits_vaddr; // @[MissQueue.scala 620:50]
  wire [35:0] entries_3_io_replace_pipe_req_bits_addr; // @[MissQueue.scala 620:50]
  wire [7:0] entries_3_io_replace_pipe_req_bits_replace_way_en; // @[MissQueue.scala 620:50]
  wire  entries_3_io_replace_pipe_resp; // @[MissQueue.scala 620:50]
  wire  entries_3_io_main_pipe_req_ready; // @[MissQueue.scala 620:50]
  wire  entries_3_io_main_pipe_req_valid; // @[MissQueue.scala 620:50]
  wire [1:0] entries_3_io_main_pipe_req_bits_miss_id; // @[MissQueue.scala 620:50]
  wire [1:0] entries_3_io_main_pipe_req_bits_miss_param; // @[MissQueue.scala 620:50]
  wire  entries_3_io_main_pipe_req_bits_miss_dirty; // @[MissQueue.scala 620:50]
  wire [7:0] entries_3_io_main_pipe_req_bits_miss_way_en; // @[MissQueue.scala 620:50]
  wire [3:0] entries_3_io_main_pipe_req_bits_source; // @[MissQueue.scala 620:50]
  wire [4:0] entries_3_io_main_pipe_req_bits_cmd; // @[MissQueue.scala 620:50]
  wire [38:0] entries_3_io_main_pipe_req_bits_vaddr; // @[MissQueue.scala 620:50]
  wire [35:0] entries_3_io_main_pipe_req_bits_addr; // @[MissQueue.scala 620:50]
  wire [511:0] entries_3_io_main_pipe_req_bits_store_data; // @[MissQueue.scala 620:50]
  wire [2:0] entries_3_io_main_pipe_req_bits_word_idx; // @[MissQueue.scala 620:50]
  wire [63:0] entries_3_io_main_pipe_req_bits_amo_data; // @[MissQueue.scala 620:50]
  wire [7:0] entries_3_io_main_pipe_req_bits_amo_mask; // @[MissQueue.scala 620:50]
  wire  entries_3_io_main_pipe_req_bits_error; // @[MissQueue.scala 620:50]
  wire [3:0] entries_3_io_main_pipe_req_bits_id; // @[MissQueue.scala 620:50]
  wire  entries_3_io_main_pipe_resp; // @[MissQueue.scala 620:50]
  wire  entries_3_io_block_addr_valid; // @[MissQueue.scala 620:50]
  wire [35:0] entries_3_io_block_addr_bits; // @[MissQueue.scala 620:50]
  wire  entries_3_io_req_handled_by_this_entry; // @[MissQueue.scala 620:50]
  wire  entries_3_io_forwardInfo_inflight; // @[MissQueue.scala 620:50]
  wire [35:0] entries_3_io_forwardInfo_paddr; // @[MissQueue.scala 620:50]
  wire [255:0] entries_3_io_forwardInfo_raw_data_0; // @[MissQueue.scala 620:50]
  wire [255:0] entries_3_io_forwardInfo_raw_data_1; // @[MissQueue.scala 620:50]
  wire  entries_3_io_forwardInfo_firstbeat_valid; // @[MissQueue.scala 620:50]
  wire  entries_3_io_forwardInfo_lastbeat_valid; // @[MissQueue.scala 620:50]
  wire  refill_pipe_req_arb_io_in_0_ready; // @[DCacheWrapper.scala 208:21]
  wire  refill_pipe_req_arb_io_in_0_valid; // @[DCacheWrapper.scala 208:21]
  wire [3:0] refill_pipe_req_arb_io_in_0_bits_source; // @[DCacheWrapper.scala 208:21]
  wire [35:0] refill_pipe_req_arb_io_in_0_bits_addr; // @[DCacheWrapper.scala 208:21]
  wire [7:0] refill_pipe_req_arb_io_in_0_bits_way_en; // @[DCacheWrapper.scala 208:21]
  wire [1:0] refill_pipe_req_arb_io_in_0_bits_alias; // @[DCacheWrapper.scala 208:21]
  wire [1:0] refill_pipe_req_arb_io_in_0_bits_miss_id; // @[DCacheWrapper.scala 208:21]
  wire [3:0] refill_pipe_req_arb_io_in_0_bits_id; // @[DCacheWrapper.scala 208:21]
  wire  refill_pipe_req_arb_io_in_0_bits_error; // @[DCacheWrapper.scala 208:21]
  wire  refill_pipe_req_arb_io_in_0_bits_prefetch; // @[DCacheWrapper.scala 208:21]
  wire [7:0] refill_pipe_req_arb_io_in_0_bits_wmask; // @[DCacheWrapper.scala 208:21]
  wire [63:0] refill_pipe_req_arb_io_in_0_bits_data_0; // @[DCacheWrapper.scala 208:21]
  wire [63:0] refill_pipe_req_arb_io_in_0_bits_data_1; // @[DCacheWrapper.scala 208:21]
  wire [63:0] refill_pipe_req_arb_io_in_0_bits_data_2; // @[DCacheWrapper.scala 208:21]
  wire [63:0] refill_pipe_req_arb_io_in_0_bits_data_3; // @[DCacheWrapper.scala 208:21]
  wire [63:0] refill_pipe_req_arb_io_in_0_bits_data_4; // @[DCacheWrapper.scala 208:21]
  wire [63:0] refill_pipe_req_arb_io_in_0_bits_data_5; // @[DCacheWrapper.scala 208:21]
  wire [63:0] refill_pipe_req_arb_io_in_0_bits_data_6; // @[DCacheWrapper.scala 208:21]
  wire [63:0] refill_pipe_req_arb_io_in_0_bits_data_7; // @[DCacheWrapper.scala 208:21]
  wire [1:0] refill_pipe_req_arb_io_in_0_bits_meta_coh_state; // @[DCacheWrapper.scala 208:21]
  wire  refill_pipe_req_arb_io_in_1_ready; // @[DCacheWrapper.scala 208:21]
  wire  refill_pipe_req_arb_io_in_1_valid; // @[DCacheWrapper.scala 208:21]
  wire [3:0] refill_pipe_req_arb_io_in_1_bits_source; // @[DCacheWrapper.scala 208:21]
  wire [35:0] refill_pipe_req_arb_io_in_1_bits_addr; // @[DCacheWrapper.scala 208:21]
  wire [7:0] refill_pipe_req_arb_io_in_1_bits_way_en; // @[DCacheWrapper.scala 208:21]
  wire [1:0] refill_pipe_req_arb_io_in_1_bits_alias; // @[DCacheWrapper.scala 208:21]
  wire [1:0] refill_pipe_req_arb_io_in_1_bits_miss_id; // @[DCacheWrapper.scala 208:21]
  wire [3:0] refill_pipe_req_arb_io_in_1_bits_id; // @[DCacheWrapper.scala 208:21]
  wire  refill_pipe_req_arb_io_in_1_bits_error; // @[DCacheWrapper.scala 208:21]
  wire  refill_pipe_req_arb_io_in_1_bits_prefetch; // @[DCacheWrapper.scala 208:21]
  wire [7:0] refill_pipe_req_arb_io_in_1_bits_wmask; // @[DCacheWrapper.scala 208:21]
  wire [63:0] refill_pipe_req_arb_io_in_1_bits_data_0; // @[DCacheWrapper.scala 208:21]
  wire [63:0] refill_pipe_req_arb_io_in_1_bits_data_1; // @[DCacheWrapper.scala 208:21]
  wire [63:0] refill_pipe_req_arb_io_in_1_bits_data_2; // @[DCacheWrapper.scala 208:21]
  wire [63:0] refill_pipe_req_arb_io_in_1_bits_data_3; // @[DCacheWrapper.scala 208:21]
  wire [63:0] refill_pipe_req_arb_io_in_1_bits_data_4; // @[DCacheWrapper.scala 208:21]
  wire [63:0] refill_pipe_req_arb_io_in_1_bits_data_5; // @[DCacheWrapper.scala 208:21]
  wire [63:0] refill_pipe_req_arb_io_in_1_bits_data_6; // @[DCacheWrapper.scala 208:21]
  wire [63:0] refill_pipe_req_arb_io_in_1_bits_data_7; // @[DCacheWrapper.scala 208:21]
  wire [1:0] refill_pipe_req_arb_io_in_1_bits_meta_coh_state; // @[DCacheWrapper.scala 208:21]
  wire  refill_pipe_req_arb_io_in_2_ready; // @[DCacheWrapper.scala 208:21]
  wire  refill_pipe_req_arb_io_in_2_valid; // @[DCacheWrapper.scala 208:21]
  wire [3:0] refill_pipe_req_arb_io_in_2_bits_source; // @[DCacheWrapper.scala 208:21]
  wire [35:0] refill_pipe_req_arb_io_in_2_bits_addr; // @[DCacheWrapper.scala 208:21]
  wire [7:0] refill_pipe_req_arb_io_in_2_bits_way_en; // @[DCacheWrapper.scala 208:21]
  wire [1:0] refill_pipe_req_arb_io_in_2_bits_alias; // @[DCacheWrapper.scala 208:21]
  wire [1:0] refill_pipe_req_arb_io_in_2_bits_miss_id; // @[DCacheWrapper.scala 208:21]
  wire [3:0] refill_pipe_req_arb_io_in_2_bits_id; // @[DCacheWrapper.scala 208:21]
  wire  refill_pipe_req_arb_io_in_2_bits_error; // @[DCacheWrapper.scala 208:21]
  wire  refill_pipe_req_arb_io_in_2_bits_prefetch; // @[DCacheWrapper.scala 208:21]
  wire [7:0] refill_pipe_req_arb_io_in_2_bits_wmask; // @[DCacheWrapper.scala 208:21]
  wire [63:0] refill_pipe_req_arb_io_in_2_bits_data_0; // @[DCacheWrapper.scala 208:21]
  wire [63:0] refill_pipe_req_arb_io_in_2_bits_data_1; // @[DCacheWrapper.scala 208:21]
  wire [63:0] refill_pipe_req_arb_io_in_2_bits_data_2; // @[DCacheWrapper.scala 208:21]
  wire [63:0] refill_pipe_req_arb_io_in_2_bits_data_3; // @[DCacheWrapper.scala 208:21]
  wire [63:0] refill_pipe_req_arb_io_in_2_bits_data_4; // @[DCacheWrapper.scala 208:21]
  wire [63:0] refill_pipe_req_arb_io_in_2_bits_data_5; // @[DCacheWrapper.scala 208:21]
  wire [63:0] refill_pipe_req_arb_io_in_2_bits_data_6; // @[DCacheWrapper.scala 208:21]
  wire [63:0] refill_pipe_req_arb_io_in_2_bits_data_7; // @[DCacheWrapper.scala 208:21]
  wire [1:0] refill_pipe_req_arb_io_in_2_bits_meta_coh_state; // @[DCacheWrapper.scala 208:21]
  wire  refill_pipe_req_arb_io_in_3_ready; // @[DCacheWrapper.scala 208:21]
  wire  refill_pipe_req_arb_io_in_3_valid; // @[DCacheWrapper.scala 208:21]
  wire [3:0] refill_pipe_req_arb_io_in_3_bits_source; // @[DCacheWrapper.scala 208:21]
  wire [35:0] refill_pipe_req_arb_io_in_3_bits_addr; // @[DCacheWrapper.scala 208:21]
  wire [7:0] refill_pipe_req_arb_io_in_3_bits_way_en; // @[DCacheWrapper.scala 208:21]
  wire [1:0] refill_pipe_req_arb_io_in_3_bits_alias; // @[DCacheWrapper.scala 208:21]
  wire [1:0] refill_pipe_req_arb_io_in_3_bits_miss_id; // @[DCacheWrapper.scala 208:21]
  wire [3:0] refill_pipe_req_arb_io_in_3_bits_id; // @[DCacheWrapper.scala 208:21]
  wire  refill_pipe_req_arb_io_in_3_bits_error; // @[DCacheWrapper.scala 208:21]
  wire  refill_pipe_req_arb_io_in_3_bits_prefetch; // @[DCacheWrapper.scala 208:21]
  wire [7:0] refill_pipe_req_arb_io_in_3_bits_wmask; // @[DCacheWrapper.scala 208:21]
  wire [63:0] refill_pipe_req_arb_io_in_3_bits_data_0; // @[DCacheWrapper.scala 208:21]
  wire [63:0] refill_pipe_req_arb_io_in_3_bits_data_1; // @[DCacheWrapper.scala 208:21]
  wire [63:0] refill_pipe_req_arb_io_in_3_bits_data_2; // @[DCacheWrapper.scala 208:21]
  wire [63:0] refill_pipe_req_arb_io_in_3_bits_data_3; // @[DCacheWrapper.scala 208:21]
  wire [63:0] refill_pipe_req_arb_io_in_3_bits_data_4; // @[DCacheWrapper.scala 208:21]
  wire [63:0] refill_pipe_req_arb_io_in_3_bits_data_5; // @[DCacheWrapper.scala 208:21]
  wire [63:0] refill_pipe_req_arb_io_in_3_bits_data_6; // @[DCacheWrapper.scala 208:21]
  wire [63:0] refill_pipe_req_arb_io_in_3_bits_data_7; // @[DCacheWrapper.scala 208:21]
  wire [1:0] refill_pipe_req_arb_io_in_3_bits_meta_coh_state; // @[DCacheWrapper.scala 208:21]
  wire  refill_pipe_req_arb_io_out_ready; // @[DCacheWrapper.scala 208:21]
  wire  refill_pipe_req_arb_io_out_valid; // @[DCacheWrapper.scala 208:21]
  wire [3:0] refill_pipe_req_arb_io_out_bits_source; // @[DCacheWrapper.scala 208:21]
  wire [35:0] refill_pipe_req_arb_io_out_bits_addr; // @[DCacheWrapper.scala 208:21]
  wire [7:0] refill_pipe_req_arb_io_out_bits_way_en; // @[DCacheWrapper.scala 208:21]
  wire [1:0] refill_pipe_req_arb_io_out_bits_alias; // @[DCacheWrapper.scala 208:21]
  wire [1:0] refill_pipe_req_arb_io_out_bits_miss_id; // @[DCacheWrapper.scala 208:21]
  wire [3:0] refill_pipe_req_arb_io_out_bits_id; // @[DCacheWrapper.scala 208:21]
  wire  refill_pipe_req_arb_io_out_bits_error; // @[DCacheWrapper.scala 208:21]
  wire  refill_pipe_req_arb_io_out_bits_prefetch; // @[DCacheWrapper.scala 208:21]
  wire [7:0] refill_pipe_req_arb_io_out_bits_wmask; // @[DCacheWrapper.scala 208:21]
  wire [63:0] refill_pipe_req_arb_io_out_bits_data_0; // @[DCacheWrapper.scala 208:21]
  wire [63:0] refill_pipe_req_arb_io_out_bits_data_1; // @[DCacheWrapper.scala 208:21]
  wire [63:0] refill_pipe_req_arb_io_out_bits_data_2; // @[DCacheWrapper.scala 208:21]
  wire [63:0] refill_pipe_req_arb_io_out_bits_data_3; // @[DCacheWrapper.scala 208:21]
  wire [63:0] refill_pipe_req_arb_io_out_bits_data_4; // @[DCacheWrapper.scala 208:21]
  wire [63:0] refill_pipe_req_arb_io_out_bits_data_5; // @[DCacheWrapper.scala 208:21]
  wire [63:0] refill_pipe_req_arb_io_out_bits_data_6; // @[DCacheWrapper.scala 208:21]
  wire [63:0] refill_pipe_req_arb_io_out_bits_data_7; // @[DCacheWrapper.scala 208:21]
  wire [1:0] refill_pipe_req_arb_io_out_bits_meta_coh_state; // @[DCacheWrapper.scala 208:21]
  wire  pipelineReg_clock; // @[MemCommon.scala 396:29]
  wire  pipelineReg_reset; // @[MemCommon.scala 396:29]
  wire  pipelineReg_io_in_ready; // @[MemCommon.scala 396:29]
  wire  pipelineReg_io_in_valid; // @[MemCommon.scala 396:29]
  wire [35:0] pipelineReg_io_in_bits_addr; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_io_in_bits_way_en; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_io_in_bits_alias; // @[MemCommon.scala 396:29]
  wire  pipelineReg_io_out_ready; // @[MemCommon.scala 396:29]
  wire  pipelineReg_io_out_valid; // @[MemCommon.scala 396:29]
  wire [35:0] pipelineReg_io_out_bits_addr; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_io_out_bits_way_en; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_io_out_bits_alias; // @[MemCommon.scala 396:29]
  wire  pipelineReg_1_clock; // @[MemCommon.scala 396:29]
  wire  pipelineReg_1_reset; // @[MemCommon.scala 396:29]
  wire  pipelineReg_1_io_in_ready; // @[MemCommon.scala 396:29]
  wire  pipelineReg_1_io_in_valid; // @[MemCommon.scala 396:29]
  wire [35:0] pipelineReg_1_io_in_bits_addr; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_1_io_in_bits_way_en; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_1_io_in_bits_alias; // @[MemCommon.scala 396:29]
  wire  pipelineReg_1_io_out_ready; // @[MemCommon.scala 396:29]
  wire  pipelineReg_1_io_out_valid; // @[MemCommon.scala 396:29]
  wire [35:0] pipelineReg_1_io_out_bits_addr; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_1_io_out_bits_way_en; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_1_io_out_bits_alias; // @[MemCommon.scala 396:29]
  wire  pipelineReg_2_clock; // @[MemCommon.scala 396:29]
  wire  pipelineReg_2_reset; // @[MemCommon.scala 396:29]
  wire  pipelineReg_2_io_in_ready; // @[MemCommon.scala 396:29]
  wire  pipelineReg_2_io_in_valid; // @[MemCommon.scala 396:29]
  wire [35:0] pipelineReg_2_io_in_bits_addr; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_2_io_in_bits_way_en; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_2_io_in_bits_alias; // @[MemCommon.scala 396:29]
  wire  pipelineReg_2_io_out_ready; // @[MemCommon.scala 396:29]
  wire  pipelineReg_2_io_out_valid; // @[MemCommon.scala 396:29]
  wire [35:0] pipelineReg_2_io_out_bits_addr; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_2_io_out_bits_way_en; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_2_io_out_bits_alias; // @[MemCommon.scala 396:29]
  wire  pipelineReg_3_clock; // @[MemCommon.scala 396:29]
  wire  pipelineReg_3_reset; // @[MemCommon.scala 396:29]
  wire  pipelineReg_3_io_in_ready; // @[MemCommon.scala 396:29]
  wire  pipelineReg_3_io_in_valid; // @[MemCommon.scala 396:29]
  wire [35:0] pipelineReg_3_io_in_bits_addr; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_3_io_in_bits_way_en; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_3_io_in_bits_alias; // @[MemCommon.scala 396:29]
  wire  pipelineReg_3_io_out_ready; // @[MemCommon.scala 396:29]
  wire  pipelineReg_3_io_out_valid; // @[MemCommon.scala 396:29]
  wire [35:0] pipelineReg_3_io_out_bits_addr; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_3_io_out_bits_way_en; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_3_io_out_bits_alias; // @[MemCommon.scala 396:29]
  wire  pipelineReg_4_clock; // @[MemCommon.scala 396:29]
  wire  pipelineReg_4_reset; // @[MemCommon.scala 396:29]
  wire  pipelineReg_4_io_in_ready; // @[MemCommon.scala 396:29]
  wire  pipelineReg_4_io_in_valid; // @[MemCommon.scala 396:29]
  wire [35:0] pipelineReg_4_io_in_bits_addr; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_4_io_in_bits_way_en; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_4_io_in_bits_alias; // @[MemCommon.scala 396:29]
  wire  pipelineReg_4_io_out_ready; // @[MemCommon.scala 396:29]
  wire  pipelineReg_4_io_out_valid; // @[MemCommon.scala 396:29]
  wire [35:0] pipelineReg_4_io_out_bits_addr; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_4_io_out_bits_way_en; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_4_io_out_bits_alias; // @[MemCommon.scala 396:29]
  wire  pipelineReg_5_clock; // @[MemCommon.scala 396:29]
  wire  pipelineReg_5_reset; // @[MemCommon.scala 396:29]
  wire  pipelineReg_5_io_in_ready; // @[MemCommon.scala 396:29]
  wire  pipelineReg_5_io_in_valid; // @[MemCommon.scala 396:29]
  wire [35:0] pipelineReg_5_io_in_bits_addr; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_5_io_in_bits_way_en; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_5_io_in_bits_alias; // @[MemCommon.scala 396:29]
  wire  pipelineReg_5_io_out_ready; // @[MemCommon.scala 396:29]
  wire  pipelineReg_5_io_out_valid; // @[MemCommon.scala 396:29]
  wire [35:0] pipelineReg_5_io_out_bits_addr; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_5_io_out_bits_way_en; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_5_io_out_bits_alias; // @[MemCommon.scala 396:29]
  wire  pipelineReg_6_clock; // @[MemCommon.scala 396:29]
  wire  pipelineReg_6_reset; // @[MemCommon.scala 396:29]
  wire  pipelineReg_6_io_in_ready; // @[MemCommon.scala 396:29]
  wire  pipelineReg_6_io_in_valid; // @[MemCommon.scala 396:29]
  wire [35:0] pipelineReg_6_io_in_bits_addr; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_6_io_in_bits_way_en; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_6_io_in_bits_alias; // @[MemCommon.scala 396:29]
  wire  pipelineReg_6_io_out_ready; // @[MemCommon.scala 396:29]
  wire  pipelineReg_6_io_out_valid; // @[MemCommon.scala 396:29]
  wire [35:0] pipelineReg_6_io_out_bits_addr; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_6_io_out_bits_way_en; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_6_io_out_bits_alias; // @[MemCommon.scala 396:29]
  wire  pipelineReg_7_clock; // @[MemCommon.scala 396:29]
  wire  pipelineReg_7_reset; // @[MemCommon.scala 396:29]
  wire  pipelineReg_7_io_in_ready; // @[MemCommon.scala 396:29]
  wire  pipelineReg_7_io_in_valid; // @[MemCommon.scala 396:29]
  wire [35:0] pipelineReg_7_io_in_bits_addr; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_7_io_in_bits_way_en; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_7_io_in_bits_alias; // @[MemCommon.scala 396:29]
  wire  pipelineReg_7_io_out_ready; // @[MemCommon.scala 396:29]
  wire  pipelineReg_7_io_out_valid; // @[MemCommon.scala 396:29]
  wire [35:0] pipelineReg_7_io_out_bits_addr; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_7_io_out_bits_way_en; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_7_io_out_bits_alias; // @[MemCommon.scala 396:29]
  wire  pipelineReg_8_clock; // @[MemCommon.scala 396:29]
  wire  pipelineReg_8_reset; // @[MemCommon.scala 396:29]
  wire  pipelineReg_8_io_in_ready; // @[MemCommon.scala 396:29]
  wire  pipelineReg_8_io_in_valid; // @[MemCommon.scala 396:29]
  wire [35:0] pipelineReg_8_io_in_bits_addr; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_8_io_in_bits_way_en; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_8_io_in_bits_alias; // @[MemCommon.scala 396:29]
  wire  pipelineReg_8_io_out_ready; // @[MemCommon.scala 396:29]
  wire  pipelineReg_8_io_out_valid; // @[MemCommon.scala 396:29]
  wire [35:0] pipelineReg_8_io_out_bits_addr; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_8_io_out_bits_way_en; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_8_io_out_bits_alias; // @[MemCommon.scala 396:29]
  wire  pipelineReg_9_clock; // @[MemCommon.scala 396:29]
  wire  pipelineReg_9_reset; // @[MemCommon.scala 396:29]
  wire  pipelineReg_9_io_in_ready; // @[MemCommon.scala 396:29]
  wire  pipelineReg_9_io_in_valid; // @[MemCommon.scala 396:29]
  wire [35:0] pipelineReg_9_io_in_bits_addr; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_9_io_in_bits_way_en; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_9_io_in_bits_alias; // @[MemCommon.scala 396:29]
  wire  pipelineReg_9_io_out_ready; // @[MemCommon.scala 396:29]
  wire  pipelineReg_9_io_out_valid; // @[MemCommon.scala 396:29]
  wire [35:0] pipelineReg_9_io_out_bits_addr; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_9_io_out_bits_way_en; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_9_io_out_bits_alias; // @[MemCommon.scala 396:29]
  wire  pipelineReg_10_clock; // @[MemCommon.scala 396:29]
  wire  pipelineReg_10_reset; // @[MemCommon.scala 396:29]
  wire  pipelineReg_10_io_in_ready; // @[MemCommon.scala 396:29]
  wire  pipelineReg_10_io_in_valid; // @[MemCommon.scala 396:29]
  wire [35:0] pipelineReg_10_io_in_bits_addr; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_10_io_in_bits_way_en; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_10_io_in_bits_alias; // @[MemCommon.scala 396:29]
  wire  pipelineReg_10_io_out_ready; // @[MemCommon.scala 396:29]
  wire  pipelineReg_10_io_out_valid; // @[MemCommon.scala 396:29]
  wire [35:0] pipelineReg_10_io_out_bits_addr; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_10_io_out_bits_way_en; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_10_io_out_bits_alias; // @[MemCommon.scala 396:29]
  wire  pipelineReg_11_clock; // @[MemCommon.scala 396:29]
  wire  pipelineReg_11_reset; // @[MemCommon.scala 396:29]
  wire  pipelineReg_11_io_in_ready; // @[MemCommon.scala 396:29]
  wire  pipelineReg_11_io_in_valid; // @[MemCommon.scala 396:29]
  wire [35:0] pipelineReg_11_io_in_bits_addr; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_11_io_in_bits_way_en; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_11_io_in_bits_alias; // @[MemCommon.scala 396:29]
  wire  pipelineReg_11_io_out_ready; // @[MemCommon.scala 396:29]
  wire  pipelineReg_11_io_out_valid; // @[MemCommon.scala 396:29]
  wire [35:0] pipelineReg_11_io_out_bits_addr; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_11_io_out_bits_way_en; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_11_io_out_bits_alias; // @[MemCommon.scala 396:29]
  wire  pipelineReg_12_clock; // @[MemCommon.scala 396:29]
  wire  pipelineReg_12_reset; // @[MemCommon.scala 396:29]
  wire  pipelineReg_12_io_in_ready; // @[MemCommon.scala 396:29]
  wire  pipelineReg_12_io_in_valid; // @[MemCommon.scala 396:29]
  wire [35:0] pipelineReg_12_io_in_bits_addr; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_12_io_in_bits_way_en; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_12_io_in_bits_alias; // @[MemCommon.scala 396:29]
  wire  pipelineReg_12_io_out_ready; // @[MemCommon.scala 396:29]
  wire  pipelineReg_12_io_out_valid; // @[MemCommon.scala 396:29]
  wire [35:0] pipelineReg_12_io_out_bits_addr; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_12_io_out_bits_way_en; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_12_io_out_bits_alias; // @[MemCommon.scala 396:29]
  wire  pipelineReg_13_clock; // @[MemCommon.scala 396:29]
  wire  pipelineReg_13_reset; // @[MemCommon.scala 396:29]
  wire  pipelineReg_13_io_in_ready; // @[MemCommon.scala 396:29]
  wire  pipelineReg_13_io_in_valid; // @[MemCommon.scala 396:29]
  wire [35:0] pipelineReg_13_io_in_bits_addr; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_13_io_in_bits_way_en; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_13_io_in_bits_alias; // @[MemCommon.scala 396:29]
  wire  pipelineReg_13_io_out_ready; // @[MemCommon.scala 396:29]
  wire  pipelineReg_13_io_out_valid; // @[MemCommon.scala 396:29]
  wire [35:0] pipelineReg_13_io_out_bits_addr; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_13_io_out_bits_way_en; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_13_io_out_bits_alias; // @[MemCommon.scala 396:29]
  wire  pipelineReg_14_clock; // @[MemCommon.scala 396:29]
  wire  pipelineReg_14_reset; // @[MemCommon.scala 396:29]
  wire  pipelineReg_14_io_in_ready; // @[MemCommon.scala 396:29]
  wire  pipelineReg_14_io_in_valid; // @[MemCommon.scala 396:29]
  wire [35:0] pipelineReg_14_io_in_bits_addr; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_14_io_in_bits_way_en; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_14_io_in_bits_alias; // @[MemCommon.scala 396:29]
  wire  pipelineReg_14_io_out_ready; // @[MemCommon.scala 396:29]
  wire  pipelineReg_14_io_out_valid; // @[MemCommon.scala 396:29]
  wire [35:0] pipelineReg_14_io_out_bits_addr; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_14_io_out_bits_way_en; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_14_io_out_bits_alias; // @[MemCommon.scala 396:29]
  wire  pipelineReg_15_clock; // @[MemCommon.scala 396:29]
  wire  pipelineReg_15_reset; // @[MemCommon.scala 396:29]
  wire  pipelineReg_15_io_in_ready; // @[MemCommon.scala 396:29]
  wire  pipelineReg_15_io_in_valid; // @[MemCommon.scala 396:29]
  wire [35:0] pipelineReg_15_io_in_bits_addr; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_15_io_in_bits_way_en; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_15_io_in_bits_alias; // @[MemCommon.scala 396:29]
  wire  pipelineReg_15_io_out_ready; // @[MemCommon.scala 396:29]
  wire  pipelineReg_15_io_out_valid; // @[MemCommon.scala 396:29]
  wire [35:0] pipelineReg_15_io_out_bits_addr; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_15_io_out_bits_way_en; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_15_io_out_bits_alias; // @[MemCommon.scala 396:29]
  wire  pipelineReg_16_clock; // @[MemCommon.scala 396:29]
  wire  pipelineReg_16_reset; // @[MemCommon.scala 396:29]
  wire  pipelineReg_16_io_in_ready; // @[MemCommon.scala 396:29]
  wire  pipelineReg_16_io_in_valid; // @[MemCommon.scala 396:29]
  wire [35:0] pipelineReg_16_io_in_bits_addr; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_16_io_in_bits_way_en; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_16_io_in_bits_alias; // @[MemCommon.scala 396:29]
  wire  pipelineReg_16_io_out_ready; // @[MemCommon.scala 396:29]
  wire  pipelineReg_16_io_out_valid; // @[MemCommon.scala 396:29]
  wire [35:0] pipelineReg_16_io_out_bits_addr; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_16_io_out_bits_way_en; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_16_io_out_bits_alias; // @[MemCommon.scala 396:29]
  wire  pipelineReg_17_clock; // @[MemCommon.scala 396:29]
  wire  pipelineReg_17_reset; // @[MemCommon.scala 396:29]
  wire  pipelineReg_17_io_in_ready; // @[MemCommon.scala 396:29]
  wire  pipelineReg_17_io_in_valid; // @[MemCommon.scala 396:29]
  wire [35:0] pipelineReg_17_io_in_bits_addr; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_17_io_in_bits_way_en; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_17_io_in_bits_alias; // @[MemCommon.scala 396:29]
  wire  pipelineReg_17_io_out_ready; // @[MemCommon.scala 396:29]
  wire  pipelineReg_17_io_out_valid; // @[MemCommon.scala 396:29]
  wire [35:0] pipelineReg_17_io_out_bits_addr; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_17_io_out_bits_way_en; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_17_io_out_bits_alias; // @[MemCommon.scala 396:29]
  wire  pipelineReg_18_clock; // @[MemCommon.scala 396:29]
  wire  pipelineReg_18_reset; // @[MemCommon.scala 396:29]
  wire  pipelineReg_18_io_in_ready; // @[MemCommon.scala 396:29]
  wire  pipelineReg_18_io_in_valid; // @[MemCommon.scala 396:29]
  wire [35:0] pipelineReg_18_io_in_bits_addr; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_18_io_in_bits_way_en; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_18_io_in_bits_alias; // @[MemCommon.scala 396:29]
  wire  pipelineReg_18_io_out_ready; // @[MemCommon.scala 396:29]
  wire  pipelineReg_18_io_out_valid; // @[MemCommon.scala 396:29]
  wire [35:0] pipelineReg_18_io_out_bits_addr; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_18_io_out_bits_way_en; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_18_io_out_bits_alias; // @[MemCommon.scala 396:29]
  wire  pipelineReg_19_clock; // @[MemCommon.scala 396:29]
  wire  pipelineReg_19_reset; // @[MemCommon.scala 396:29]
  wire  pipelineReg_19_io_in_ready; // @[MemCommon.scala 396:29]
  wire  pipelineReg_19_io_in_valid; // @[MemCommon.scala 396:29]
  wire [35:0] pipelineReg_19_io_in_bits_addr; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_19_io_in_bits_way_en; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_19_io_in_bits_alias; // @[MemCommon.scala 396:29]
  wire  pipelineReg_19_io_out_ready; // @[MemCommon.scala 396:29]
  wire  pipelineReg_19_io_out_valid; // @[MemCommon.scala 396:29]
  wire [35:0] pipelineReg_19_io_out_bits_addr; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_19_io_out_bits_way_en; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_19_io_out_bits_alias; // @[MemCommon.scala 396:29]
  wire  pipelineReg_20_clock; // @[MemCommon.scala 396:29]
  wire  pipelineReg_20_reset; // @[MemCommon.scala 396:29]
  wire  pipelineReg_20_io_in_ready; // @[MemCommon.scala 396:29]
  wire  pipelineReg_20_io_in_valid; // @[MemCommon.scala 396:29]
  wire [35:0] pipelineReg_20_io_in_bits_addr; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_20_io_in_bits_way_en; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_20_io_in_bits_alias; // @[MemCommon.scala 396:29]
  wire  pipelineReg_20_io_out_ready; // @[MemCommon.scala 396:29]
  wire  pipelineReg_20_io_out_valid; // @[MemCommon.scala 396:29]
  wire [35:0] pipelineReg_20_io_out_bits_addr; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_20_io_out_bits_way_en; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_20_io_out_bits_alias; // @[MemCommon.scala 396:29]
  wire  pipelineReg_21_clock; // @[MemCommon.scala 396:29]
  wire  pipelineReg_21_reset; // @[MemCommon.scala 396:29]
  wire  pipelineReg_21_io_in_ready; // @[MemCommon.scala 396:29]
  wire  pipelineReg_21_io_in_valid; // @[MemCommon.scala 396:29]
  wire [35:0] pipelineReg_21_io_in_bits_addr; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_21_io_in_bits_way_en; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_21_io_in_bits_alias; // @[MemCommon.scala 396:29]
  wire  pipelineReg_21_io_out_ready; // @[MemCommon.scala 396:29]
  wire  pipelineReg_21_io_out_valid; // @[MemCommon.scala 396:29]
  wire [35:0] pipelineReg_21_io_out_bits_addr; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_21_io_out_bits_way_en; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_21_io_out_bits_alias; // @[MemCommon.scala 396:29]
  wire  pipelineReg_22_clock; // @[MemCommon.scala 396:29]
  wire  pipelineReg_22_reset; // @[MemCommon.scala 396:29]
  wire  pipelineReg_22_io_in_ready; // @[MemCommon.scala 396:29]
  wire  pipelineReg_22_io_in_valid; // @[MemCommon.scala 396:29]
  wire [35:0] pipelineReg_22_io_in_bits_addr; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_22_io_in_bits_way_en; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_22_io_in_bits_alias; // @[MemCommon.scala 396:29]
  wire  pipelineReg_22_io_out_ready; // @[MemCommon.scala 396:29]
  wire  pipelineReg_22_io_out_valid; // @[MemCommon.scala 396:29]
  wire [35:0] pipelineReg_22_io_out_bits_addr; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_22_io_out_bits_way_en; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_22_io_out_bits_alias; // @[MemCommon.scala 396:29]
  wire  pipelineReg_23_clock; // @[MemCommon.scala 396:29]
  wire  pipelineReg_23_reset; // @[MemCommon.scala 396:29]
  wire  pipelineReg_23_io_in_ready; // @[MemCommon.scala 396:29]
  wire  pipelineReg_23_io_in_valid; // @[MemCommon.scala 396:29]
  wire [35:0] pipelineReg_23_io_in_bits_addr; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_23_io_in_bits_way_en; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_23_io_in_bits_alias; // @[MemCommon.scala 396:29]
  wire  pipelineReg_23_io_out_ready; // @[MemCommon.scala 396:29]
  wire  pipelineReg_23_io_out_valid; // @[MemCommon.scala 396:29]
  wire [35:0] pipelineReg_23_io_out_bits_addr; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_23_io_out_bits_way_en; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_23_io_out_bits_alias; // @[MemCommon.scala 396:29]
  wire  pipelineReg_24_clock; // @[MemCommon.scala 396:29]
  wire  pipelineReg_24_reset; // @[MemCommon.scala 396:29]
  wire  pipelineReg_24_io_in_ready; // @[MemCommon.scala 396:29]
  wire  pipelineReg_24_io_in_valid; // @[MemCommon.scala 396:29]
  wire [3:0] pipelineReg_24_io_in_bits_source; // @[MemCommon.scala 396:29]
  wire [35:0] pipelineReg_24_io_in_bits_addr; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_24_io_in_bits_way_en; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_24_io_in_bits_alias; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_24_io_in_bits_miss_id; // @[MemCommon.scala 396:29]
  wire [3:0] pipelineReg_24_io_in_bits_id; // @[MemCommon.scala 396:29]
  wire  pipelineReg_24_io_in_bits_error; // @[MemCommon.scala 396:29]
  wire  pipelineReg_24_io_in_bits_prefetch; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_24_io_in_bits_wmask; // @[MemCommon.scala 396:29]
  wire [63:0] pipelineReg_24_io_in_bits_data_0; // @[MemCommon.scala 396:29]
  wire [63:0] pipelineReg_24_io_in_bits_data_1; // @[MemCommon.scala 396:29]
  wire [63:0] pipelineReg_24_io_in_bits_data_2; // @[MemCommon.scala 396:29]
  wire [63:0] pipelineReg_24_io_in_bits_data_3; // @[MemCommon.scala 396:29]
  wire [63:0] pipelineReg_24_io_in_bits_data_4; // @[MemCommon.scala 396:29]
  wire [63:0] pipelineReg_24_io_in_bits_data_5; // @[MemCommon.scala 396:29]
  wire [63:0] pipelineReg_24_io_in_bits_data_6; // @[MemCommon.scala 396:29]
  wire [63:0] pipelineReg_24_io_in_bits_data_7; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_24_io_in_bits_meta_coh_state; // @[MemCommon.scala 396:29]
  wire  pipelineReg_24_io_out_ready; // @[MemCommon.scala 396:29]
  wire  pipelineReg_24_io_out_valid; // @[MemCommon.scala 396:29]
  wire [3:0] pipelineReg_24_io_out_bits_source; // @[MemCommon.scala 396:29]
  wire [35:0] pipelineReg_24_io_out_bits_addr; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_24_io_out_bits_way_en; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_24_io_out_bits_alias; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_24_io_out_bits_miss_id; // @[MemCommon.scala 396:29]
  wire [3:0] pipelineReg_24_io_out_bits_id; // @[MemCommon.scala 396:29]
  wire  pipelineReg_24_io_out_bits_error; // @[MemCommon.scala 396:29]
  wire  pipelineReg_24_io_out_bits_prefetch; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_24_io_out_bits_wmask; // @[MemCommon.scala 396:29]
  wire [63:0] pipelineReg_24_io_out_bits_data_0; // @[MemCommon.scala 396:29]
  wire [63:0] pipelineReg_24_io_out_bits_data_1; // @[MemCommon.scala 396:29]
  wire [63:0] pipelineReg_24_io_out_bits_data_2; // @[MemCommon.scala 396:29]
  wire [63:0] pipelineReg_24_io_out_bits_data_3; // @[MemCommon.scala 396:29]
  wire [63:0] pipelineReg_24_io_out_bits_data_4; // @[MemCommon.scala 396:29]
  wire [63:0] pipelineReg_24_io_out_bits_data_5; // @[MemCommon.scala 396:29]
  wire [63:0] pipelineReg_24_io_out_bits_data_6; // @[MemCommon.scala 396:29]
  wire [63:0] pipelineReg_24_io_out_bits_data_7; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_24_io_out_bits_meta_coh_state; // @[MemCommon.scala 396:29]
  wire  replace_pipe_req_arb_io_in_0_ready; // @[DCacheWrapper.scala 220:21]
  wire  replace_pipe_req_arb_io_in_0_valid; // @[DCacheWrapper.scala 220:21]
  wire  replace_pipe_req_arb_io_in_0_bits_miss; // @[DCacheWrapper.scala 220:21]
  wire [1:0] replace_pipe_req_arb_io_in_0_bits_miss_id; // @[DCacheWrapper.scala 220:21]
  wire [1:0] replace_pipe_req_arb_io_in_0_bits_miss_param; // @[DCacheWrapper.scala 220:21]
  wire  replace_pipe_req_arb_io_in_0_bits_miss_dirty; // @[DCacheWrapper.scala 220:21]
  wire [7:0] replace_pipe_req_arb_io_in_0_bits_miss_way_en; // @[DCacheWrapper.scala 220:21]
  wire  replace_pipe_req_arb_io_in_0_bits_probe; // @[DCacheWrapper.scala 220:21]
  wire [1:0] replace_pipe_req_arb_io_in_0_bits_probe_param; // @[DCacheWrapper.scala 220:21]
  wire  replace_pipe_req_arb_io_in_0_bits_probe_need_data; // @[DCacheWrapper.scala 220:21]
  wire [3:0] replace_pipe_req_arb_io_in_0_bits_source; // @[DCacheWrapper.scala 220:21]
  wire [4:0] replace_pipe_req_arb_io_in_0_bits_cmd; // @[DCacheWrapper.scala 220:21]
  wire [38:0] replace_pipe_req_arb_io_in_0_bits_vaddr; // @[DCacheWrapper.scala 220:21]
  wire [35:0] replace_pipe_req_arb_io_in_0_bits_addr; // @[DCacheWrapper.scala 220:21]
  wire [511:0] replace_pipe_req_arb_io_in_0_bits_store_data; // @[DCacheWrapper.scala 220:21]
  wire [63:0] replace_pipe_req_arb_io_in_0_bits_store_mask; // @[DCacheWrapper.scala 220:21]
  wire [2:0] replace_pipe_req_arb_io_in_0_bits_word_idx; // @[DCacheWrapper.scala 220:21]
  wire [63:0] replace_pipe_req_arb_io_in_0_bits_amo_data; // @[DCacheWrapper.scala 220:21]
  wire [7:0] replace_pipe_req_arb_io_in_0_bits_amo_mask; // @[DCacheWrapper.scala 220:21]
  wire  replace_pipe_req_arb_io_in_0_bits_error; // @[DCacheWrapper.scala 220:21]
  wire  replace_pipe_req_arb_io_in_0_bits_replace; // @[DCacheWrapper.scala 220:21]
  wire [7:0] replace_pipe_req_arb_io_in_0_bits_replace_way_en; // @[DCacheWrapper.scala 220:21]
  wire [3:0] replace_pipe_req_arb_io_in_0_bits_id; // @[DCacheWrapper.scala 220:21]
  wire  replace_pipe_req_arb_io_in_1_ready; // @[DCacheWrapper.scala 220:21]
  wire  replace_pipe_req_arb_io_in_1_valid; // @[DCacheWrapper.scala 220:21]
  wire  replace_pipe_req_arb_io_in_1_bits_miss; // @[DCacheWrapper.scala 220:21]
  wire [1:0] replace_pipe_req_arb_io_in_1_bits_miss_id; // @[DCacheWrapper.scala 220:21]
  wire [1:0] replace_pipe_req_arb_io_in_1_bits_miss_param; // @[DCacheWrapper.scala 220:21]
  wire  replace_pipe_req_arb_io_in_1_bits_miss_dirty; // @[DCacheWrapper.scala 220:21]
  wire [7:0] replace_pipe_req_arb_io_in_1_bits_miss_way_en; // @[DCacheWrapper.scala 220:21]
  wire  replace_pipe_req_arb_io_in_1_bits_probe; // @[DCacheWrapper.scala 220:21]
  wire [1:0] replace_pipe_req_arb_io_in_1_bits_probe_param; // @[DCacheWrapper.scala 220:21]
  wire  replace_pipe_req_arb_io_in_1_bits_probe_need_data; // @[DCacheWrapper.scala 220:21]
  wire [3:0] replace_pipe_req_arb_io_in_1_bits_source; // @[DCacheWrapper.scala 220:21]
  wire [4:0] replace_pipe_req_arb_io_in_1_bits_cmd; // @[DCacheWrapper.scala 220:21]
  wire [38:0] replace_pipe_req_arb_io_in_1_bits_vaddr; // @[DCacheWrapper.scala 220:21]
  wire [35:0] replace_pipe_req_arb_io_in_1_bits_addr; // @[DCacheWrapper.scala 220:21]
  wire [511:0] replace_pipe_req_arb_io_in_1_bits_store_data; // @[DCacheWrapper.scala 220:21]
  wire [63:0] replace_pipe_req_arb_io_in_1_bits_store_mask; // @[DCacheWrapper.scala 220:21]
  wire [2:0] replace_pipe_req_arb_io_in_1_bits_word_idx; // @[DCacheWrapper.scala 220:21]
  wire [63:0] replace_pipe_req_arb_io_in_1_bits_amo_data; // @[DCacheWrapper.scala 220:21]
  wire [7:0] replace_pipe_req_arb_io_in_1_bits_amo_mask; // @[DCacheWrapper.scala 220:21]
  wire  replace_pipe_req_arb_io_in_1_bits_error; // @[DCacheWrapper.scala 220:21]
  wire  replace_pipe_req_arb_io_in_1_bits_replace; // @[DCacheWrapper.scala 220:21]
  wire [7:0] replace_pipe_req_arb_io_in_1_bits_replace_way_en; // @[DCacheWrapper.scala 220:21]
  wire [3:0] replace_pipe_req_arb_io_in_1_bits_id; // @[DCacheWrapper.scala 220:21]
  wire  replace_pipe_req_arb_io_in_2_ready; // @[DCacheWrapper.scala 220:21]
  wire  replace_pipe_req_arb_io_in_2_valid; // @[DCacheWrapper.scala 220:21]
  wire [1:0] replace_pipe_req_arb_io_in_2_bits_miss_id; // @[DCacheWrapper.scala 220:21]
  wire  replace_pipe_req_arb_io_in_2_bits_probe; // @[DCacheWrapper.scala 220:21]
  wire [1:0] replace_pipe_req_arb_io_in_2_bits_probe_param; // @[DCacheWrapper.scala 220:21]
  wire  replace_pipe_req_arb_io_in_2_bits_probe_need_data; // @[DCacheWrapper.scala 220:21]
  wire [3:0] replace_pipe_req_arb_io_in_2_bits_source; // @[DCacheWrapper.scala 220:21]
  wire [4:0] replace_pipe_req_arb_io_in_2_bits_cmd; // @[DCacheWrapper.scala 220:21]
  wire [38:0] replace_pipe_req_arb_io_in_2_bits_vaddr; // @[DCacheWrapper.scala 220:21]
  wire [35:0] replace_pipe_req_arb_io_in_2_bits_addr; // @[DCacheWrapper.scala 220:21]
  wire [511:0] replace_pipe_req_arb_io_in_2_bits_store_data; // @[DCacheWrapper.scala 220:21]
  wire [63:0] replace_pipe_req_arb_io_in_2_bits_store_mask; // @[DCacheWrapper.scala 220:21]
  wire  replace_pipe_req_arb_io_in_2_bits_replace; // @[DCacheWrapper.scala 220:21]
  wire [7:0] replace_pipe_req_arb_io_in_2_bits_replace_way_en; // @[DCacheWrapper.scala 220:21]
  wire [3:0] replace_pipe_req_arb_io_in_2_bits_id; // @[DCacheWrapper.scala 220:21]
  wire  replace_pipe_req_arb_io_in_3_ready; // @[DCacheWrapper.scala 220:21]
  wire  replace_pipe_req_arb_io_in_3_valid; // @[DCacheWrapper.scala 220:21]
  wire  replace_pipe_req_arb_io_in_3_bits_miss; // @[DCacheWrapper.scala 220:21]
  wire [1:0] replace_pipe_req_arb_io_in_3_bits_miss_id; // @[DCacheWrapper.scala 220:21]
  wire [1:0] replace_pipe_req_arb_io_in_3_bits_miss_param; // @[DCacheWrapper.scala 220:21]
  wire  replace_pipe_req_arb_io_in_3_bits_miss_dirty; // @[DCacheWrapper.scala 220:21]
  wire [7:0] replace_pipe_req_arb_io_in_3_bits_miss_way_en; // @[DCacheWrapper.scala 220:21]
  wire  replace_pipe_req_arb_io_in_3_bits_probe; // @[DCacheWrapper.scala 220:21]
  wire [1:0] replace_pipe_req_arb_io_in_3_bits_probe_param; // @[DCacheWrapper.scala 220:21]
  wire  replace_pipe_req_arb_io_in_3_bits_probe_need_data; // @[DCacheWrapper.scala 220:21]
  wire [3:0] replace_pipe_req_arb_io_in_3_bits_source; // @[DCacheWrapper.scala 220:21]
  wire [4:0] replace_pipe_req_arb_io_in_3_bits_cmd; // @[DCacheWrapper.scala 220:21]
  wire [38:0] replace_pipe_req_arb_io_in_3_bits_vaddr; // @[DCacheWrapper.scala 220:21]
  wire [35:0] replace_pipe_req_arb_io_in_3_bits_addr; // @[DCacheWrapper.scala 220:21]
  wire [511:0] replace_pipe_req_arb_io_in_3_bits_store_data; // @[DCacheWrapper.scala 220:21]
  wire [63:0] replace_pipe_req_arb_io_in_3_bits_store_mask; // @[DCacheWrapper.scala 220:21]
  wire [2:0] replace_pipe_req_arb_io_in_3_bits_word_idx; // @[DCacheWrapper.scala 220:21]
  wire [63:0] replace_pipe_req_arb_io_in_3_bits_amo_data; // @[DCacheWrapper.scala 220:21]
  wire [7:0] replace_pipe_req_arb_io_in_3_bits_amo_mask; // @[DCacheWrapper.scala 220:21]
  wire  replace_pipe_req_arb_io_in_3_bits_error; // @[DCacheWrapper.scala 220:21]
  wire  replace_pipe_req_arb_io_in_3_bits_replace; // @[DCacheWrapper.scala 220:21]
  wire [7:0] replace_pipe_req_arb_io_in_3_bits_replace_way_en; // @[DCacheWrapper.scala 220:21]
  wire [3:0] replace_pipe_req_arb_io_in_3_bits_id; // @[DCacheWrapper.scala 220:21]
  wire  replace_pipe_req_arb_io_out_ready; // @[DCacheWrapper.scala 220:21]
  wire  replace_pipe_req_arb_io_out_valid; // @[DCacheWrapper.scala 220:21]
  wire  replace_pipe_req_arb_io_out_bits_miss; // @[DCacheWrapper.scala 220:21]
  wire [1:0] replace_pipe_req_arb_io_out_bits_miss_id; // @[DCacheWrapper.scala 220:21]
  wire [1:0] replace_pipe_req_arb_io_out_bits_miss_param; // @[DCacheWrapper.scala 220:21]
  wire  replace_pipe_req_arb_io_out_bits_miss_dirty; // @[DCacheWrapper.scala 220:21]
  wire [7:0] replace_pipe_req_arb_io_out_bits_miss_way_en; // @[DCacheWrapper.scala 220:21]
  wire  replace_pipe_req_arb_io_out_bits_probe; // @[DCacheWrapper.scala 220:21]
  wire [1:0] replace_pipe_req_arb_io_out_bits_probe_param; // @[DCacheWrapper.scala 220:21]
  wire  replace_pipe_req_arb_io_out_bits_probe_need_data; // @[DCacheWrapper.scala 220:21]
  wire [3:0] replace_pipe_req_arb_io_out_bits_source; // @[DCacheWrapper.scala 220:21]
  wire [4:0] replace_pipe_req_arb_io_out_bits_cmd; // @[DCacheWrapper.scala 220:21]
  wire [38:0] replace_pipe_req_arb_io_out_bits_vaddr; // @[DCacheWrapper.scala 220:21]
  wire [35:0] replace_pipe_req_arb_io_out_bits_addr; // @[DCacheWrapper.scala 220:21]
  wire [511:0] replace_pipe_req_arb_io_out_bits_store_data; // @[DCacheWrapper.scala 220:21]
  wire [63:0] replace_pipe_req_arb_io_out_bits_store_mask; // @[DCacheWrapper.scala 220:21]
  wire [2:0] replace_pipe_req_arb_io_out_bits_word_idx; // @[DCacheWrapper.scala 220:21]
  wire [63:0] replace_pipe_req_arb_io_out_bits_amo_data; // @[DCacheWrapper.scala 220:21]
  wire [7:0] replace_pipe_req_arb_io_out_bits_amo_mask; // @[DCacheWrapper.scala 220:21]
  wire  replace_pipe_req_arb_io_out_bits_error; // @[DCacheWrapper.scala 220:21]
  wire  replace_pipe_req_arb_io_out_bits_replace; // @[DCacheWrapper.scala 220:21]
  wire [7:0] replace_pipe_req_arb_io_out_bits_replace_way_en; // @[DCacheWrapper.scala 220:21]
  wire [3:0] replace_pipe_req_arb_io_out_bits_id; // @[DCacheWrapper.scala 220:21]
  wire  pipelineReg_25_clock; // @[MemCommon.scala 396:29]
  wire  pipelineReg_25_reset; // @[MemCommon.scala 396:29]
  wire  pipelineReg_25_io_in_ready; // @[MemCommon.scala 396:29]
  wire  pipelineReg_25_io_in_valid; // @[MemCommon.scala 396:29]
  wire  pipelineReg_25_io_in_bits_miss; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_25_io_in_bits_miss_id; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_25_io_in_bits_miss_param; // @[MemCommon.scala 396:29]
  wire  pipelineReg_25_io_in_bits_miss_dirty; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_25_io_in_bits_miss_way_en; // @[MemCommon.scala 396:29]
  wire  pipelineReg_25_io_in_bits_probe; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_25_io_in_bits_probe_param; // @[MemCommon.scala 396:29]
  wire  pipelineReg_25_io_in_bits_probe_need_data; // @[MemCommon.scala 396:29]
  wire [3:0] pipelineReg_25_io_in_bits_source; // @[MemCommon.scala 396:29]
  wire [4:0] pipelineReg_25_io_in_bits_cmd; // @[MemCommon.scala 396:29]
  wire [38:0] pipelineReg_25_io_in_bits_vaddr; // @[MemCommon.scala 396:29]
  wire [35:0] pipelineReg_25_io_in_bits_addr; // @[MemCommon.scala 396:29]
  wire [511:0] pipelineReg_25_io_in_bits_store_data; // @[MemCommon.scala 396:29]
  wire [63:0] pipelineReg_25_io_in_bits_store_mask; // @[MemCommon.scala 396:29]
  wire [2:0] pipelineReg_25_io_in_bits_word_idx; // @[MemCommon.scala 396:29]
  wire [63:0] pipelineReg_25_io_in_bits_amo_data; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_25_io_in_bits_amo_mask; // @[MemCommon.scala 396:29]
  wire  pipelineReg_25_io_in_bits_error; // @[MemCommon.scala 396:29]
  wire  pipelineReg_25_io_in_bits_replace; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_25_io_in_bits_replace_way_en; // @[MemCommon.scala 396:29]
  wire [3:0] pipelineReg_25_io_in_bits_id; // @[MemCommon.scala 396:29]
  wire  pipelineReg_25_io_out_ready; // @[MemCommon.scala 396:29]
  wire  pipelineReg_25_io_out_valid; // @[MemCommon.scala 396:29]
  wire  pipelineReg_25_io_out_bits_miss; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_25_io_out_bits_miss_id; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_25_io_out_bits_miss_param; // @[MemCommon.scala 396:29]
  wire  pipelineReg_25_io_out_bits_miss_dirty; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_25_io_out_bits_miss_way_en; // @[MemCommon.scala 396:29]
  wire  pipelineReg_25_io_out_bits_probe; // @[MemCommon.scala 396:29]
  wire [1:0] pipelineReg_25_io_out_bits_probe_param; // @[MemCommon.scala 396:29]
  wire  pipelineReg_25_io_out_bits_probe_need_data; // @[MemCommon.scala 396:29]
  wire [3:0] pipelineReg_25_io_out_bits_source; // @[MemCommon.scala 396:29]
  wire [4:0] pipelineReg_25_io_out_bits_cmd; // @[MemCommon.scala 396:29]
  wire [38:0] pipelineReg_25_io_out_bits_vaddr; // @[MemCommon.scala 396:29]
  wire [35:0] pipelineReg_25_io_out_bits_addr; // @[MemCommon.scala 396:29]
  wire [511:0] pipelineReg_25_io_out_bits_store_data; // @[MemCommon.scala 396:29]
  wire [63:0] pipelineReg_25_io_out_bits_store_mask; // @[MemCommon.scala 396:29]
  wire [2:0] pipelineReg_25_io_out_bits_word_idx; // @[MemCommon.scala 396:29]
  wire [63:0] pipelineReg_25_io_out_bits_amo_data; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_25_io_out_bits_amo_mask; // @[MemCommon.scala 396:29]
  wire  pipelineReg_25_io_out_bits_error; // @[MemCommon.scala 396:29]
  wire  pipelineReg_25_io_out_bits_replace; // @[MemCommon.scala 396:29]
  wire [7:0] pipelineReg_25_io_out_bits_replace_way_en; // @[MemCommon.scala 396:29]
  wire [3:0] pipelineReg_25_io_out_bits_id; // @[MemCommon.scala 396:29]
  wire  main_pipe_req_arb_clock; // @[DCacheWrapper.scala 260:21]
  wire  main_pipe_req_arb_reset; // @[DCacheWrapper.scala 260:21]
  wire  main_pipe_req_arb_io_in_0_ready; // @[DCacheWrapper.scala 260:21]
  wire  main_pipe_req_arb_io_in_0_valid; // @[DCacheWrapper.scala 260:21]
  wire [1:0] main_pipe_req_arb_io_in_0_bits_miss_id; // @[DCacheWrapper.scala 260:21]
  wire [1:0] main_pipe_req_arb_io_in_0_bits_miss_param; // @[DCacheWrapper.scala 260:21]
  wire  main_pipe_req_arb_io_in_0_bits_miss_dirty; // @[DCacheWrapper.scala 260:21]
  wire [7:0] main_pipe_req_arb_io_in_0_bits_miss_way_en; // @[DCacheWrapper.scala 260:21]
  wire [3:0] main_pipe_req_arb_io_in_0_bits_source; // @[DCacheWrapper.scala 260:21]
  wire [4:0] main_pipe_req_arb_io_in_0_bits_cmd; // @[DCacheWrapper.scala 260:21]
  wire [38:0] main_pipe_req_arb_io_in_0_bits_vaddr; // @[DCacheWrapper.scala 260:21]
  wire [35:0] main_pipe_req_arb_io_in_0_bits_addr; // @[DCacheWrapper.scala 260:21]
  wire [511:0] main_pipe_req_arb_io_in_0_bits_store_data; // @[DCacheWrapper.scala 260:21]
  wire [2:0] main_pipe_req_arb_io_in_0_bits_word_idx; // @[DCacheWrapper.scala 260:21]
  wire [63:0] main_pipe_req_arb_io_in_0_bits_amo_data; // @[DCacheWrapper.scala 260:21]
  wire [7:0] main_pipe_req_arb_io_in_0_bits_amo_mask; // @[DCacheWrapper.scala 260:21]
  wire  main_pipe_req_arb_io_in_0_bits_error; // @[DCacheWrapper.scala 260:21]
  wire [3:0] main_pipe_req_arb_io_in_0_bits_id; // @[DCacheWrapper.scala 260:21]
  wire  main_pipe_req_arb_io_in_1_ready; // @[DCacheWrapper.scala 260:21]
  wire  main_pipe_req_arb_io_in_1_valid; // @[DCacheWrapper.scala 260:21]
  wire [1:0] main_pipe_req_arb_io_in_1_bits_miss_id; // @[DCacheWrapper.scala 260:21]
  wire [1:0] main_pipe_req_arb_io_in_1_bits_miss_param; // @[DCacheWrapper.scala 260:21]
  wire  main_pipe_req_arb_io_in_1_bits_miss_dirty; // @[DCacheWrapper.scala 260:21]
  wire [7:0] main_pipe_req_arb_io_in_1_bits_miss_way_en; // @[DCacheWrapper.scala 260:21]
  wire [3:0] main_pipe_req_arb_io_in_1_bits_source; // @[DCacheWrapper.scala 260:21]
  wire [4:0] main_pipe_req_arb_io_in_1_bits_cmd; // @[DCacheWrapper.scala 260:21]
  wire [38:0] main_pipe_req_arb_io_in_1_bits_vaddr; // @[DCacheWrapper.scala 260:21]
  wire [35:0] main_pipe_req_arb_io_in_1_bits_addr; // @[DCacheWrapper.scala 260:21]
  wire [511:0] main_pipe_req_arb_io_in_1_bits_store_data; // @[DCacheWrapper.scala 260:21]
  wire [2:0] main_pipe_req_arb_io_in_1_bits_word_idx; // @[DCacheWrapper.scala 260:21]
  wire [63:0] main_pipe_req_arb_io_in_1_bits_amo_data; // @[DCacheWrapper.scala 260:21]
  wire [7:0] main_pipe_req_arb_io_in_1_bits_amo_mask; // @[DCacheWrapper.scala 260:21]
  wire  main_pipe_req_arb_io_in_1_bits_error; // @[DCacheWrapper.scala 260:21]
  wire [3:0] main_pipe_req_arb_io_in_1_bits_id; // @[DCacheWrapper.scala 260:21]
  wire  main_pipe_req_arb_io_in_2_ready; // @[DCacheWrapper.scala 260:21]
  wire  main_pipe_req_arb_io_in_2_valid; // @[DCacheWrapper.scala 260:21]
  wire [1:0] main_pipe_req_arb_io_in_2_bits_miss_id; // @[DCacheWrapper.scala 260:21]
  wire [1:0] main_pipe_req_arb_io_in_2_bits_miss_param; // @[DCacheWrapper.scala 260:21]
  wire  main_pipe_req_arb_io_in_2_bits_miss_dirty; // @[DCacheWrapper.scala 260:21]
  wire [7:0] main_pipe_req_arb_io_in_2_bits_miss_way_en; // @[DCacheWrapper.scala 260:21]
  wire [3:0] main_pipe_req_arb_io_in_2_bits_source; // @[DCacheWrapper.scala 260:21]
  wire [4:0] main_pipe_req_arb_io_in_2_bits_cmd; // @[DCacheWrapper.scala 260:21]
  wire [38:0] main_pipe_req_arb_io_in_2_bits_vaddr; // @[DCacheWrapper.scala 260:21]
  wire [35:0] main_pipe_req_arb_io_in_2_bits_addr; // @[DCacheWrapper.scala 260:21]
  wire [511:0] main_pipe_req_arb_io_in_2_bits_store_data; // @[DCacheWrapper.scala 260:21]
  wire [2:0] main_pipe_req_arb_io_in_2_bits_word_idx; // @[DCacheWrapper.scala 260:21]
  wire [63:0] main_pipe_req_arb_io_in_2_bits_amo_data; // @[DCacheWrapper.scala 260:21]
  wire [7:0] main_pipe_req_arb_io_in_2_bits_amo_mask; // @[DCacheWrapper.scala 260:21]
  wire  main_pipe_req_arb_io_in_2_bits_error; // @[DCacheWrapper.scala 260:21]
  wire [3:0] main_pipe_req_arb_io_in_2_bits_id; // @[DCacheWrapper.scala 260:21]
  wire  main_pipe_req_arb_io_in_3_ready; // @[DCacheWrapper.scala 260:21]
  wire  main_pipe_req_arb_io_in_3_valid; // @[DCacheWrapper.scala 260:21]
  wire [1:0] main_pipe_req_arb_io_in_3_bits_miss_id; // @[DCacheWrapper.scala 260:21]
  wire [1:0] main_pipe_req_arb_io_in_3_bits_miss_param; // @[DCacheWrapper.scala 260:21]
  wire  main_pipe_req_arb_io_in_3_bits_miss_dirty; // @[DCacheWrapper.scala 260:21]
  wire [7:0] main_pipe_req_arb_io_in_3_bits_miss_way_en; // @[DCacheWrapper.scala 260:21]
  wire [3:0] main_pipe_req_arb_io_in_3_bits_source; // @[DCacheWrapper.scala 260:21]
  wire [4:0] main_pipe_req_arb_io_in_3_bits_cmd; // @[DCacheWrapper.scala 260:21]
  wire [38:0] main_pipe_req_arb_io_in_3_bits_vaddr; // @[DCacheWrapper.scala 260:21]
  wire [35:0] main_pipe_req_arb_io_in_3_bits_addr; // @[DCacheWrapper.scala 260:21]
  wire [511:0] main_pipe_req_arb_io_in_3_bits_store_data; // @[DCacheWrapper.scala 260:21]
  wire [2:0] main_pipe_req_arb_io_in_3_bits_word_idx; // @[DCacheWrapper.scala 260:21]
  wire [63:0] main_pipe_req_arb_io_in_3_bits_amo_data; // @[DCacheWrapper.scala 260:21]
  wire [7:0] main_pipe_req_arb_io_in_3_bits_amo_mask; // @[DCacheWrapper.scala 260:21]
  wire  main_pipe_req_arb_io_in_3_bits_error; // @[DCacheWrapper.scala 260:21]
  wire [3:0] main_pipe_req_arb_io_in_3_bits_id; // @[DCacheWrapper.scala 260:21]
  wire  main_pipe_req_arb_io_out_ready; // @[DCacheWrapper.scala 260:21]
  wire  main_pipe_req_arb_io_out_valid; // @[DCacheWrapper.scala 260:21]
  wire  main_pipe_req_arb_io_out_bits_miss; // @[DCacheWrapper.scala 260:21]
  wire [1:0] main_pipe_req_arb_io_out_bits_miss_id; // @[DCacheWrapper.scala 260:21]
  wire [1:0] main_pipe_req_arb_io_out_bits_miss_param; // @[DCacheWrapper.scala 260:21]
  wire  main_pipe_req_arb_io_out_bits_miss_dirty; // @[DCacheWrapper.scala 260:21]
  wire [7:0] main_pipe_req_arb_io_out_bits_miss_way_en; // @[DCacheWrapper.scala 260:21]
  wire [3:0] main_pipe_req_arb_io_out_bits_source; // @[DCacheWrapper.scala 260:21]
  wire [4:0] main_pipe_req_arb_io_out_bits_cmd; // @[DCacheWrapper.scala 260:21]
  wire [38:0] main_pipe_req_arb_io_out_bits_vaddr; // @[DCacheWrapper.scala 260:21]
  wire [35:0] main_pipe_req_arb_io_out_bits_addr; // @[DCacheWrapper.scala 260:21]
  wire [511:0] main_pipe_req_arb_io_out_bits_store_data; // @[DCacheWrapper.scala 260:21]
  wire [63:0] main_pipe_req_arb_io_out_bits_store_mask; // @[DCacheWrapper.scala 260:21]
  wire [2:0] main_pipe_req_arb_io_out_bits_word_idx; // @[DCacheWrapper.scala 260:21]
  wire [63:0] main_pipe_req_arb_io_out_bits_amo_data; // @[DCacheWrapper.scala 260:21]
  wire [7:0] main_pipe_req_arb_io_out_bits_amo_mask; // @[DCacheWrapper.scala 260:21]
  wire  main_pipe_req_arb_io_out_bits_error; // @[DCacheWrapper.scala 260:21]
  wire [3:0] main_pipe_req_arb_io_out_bits_id; // @[DCacheWrapper.scala 260:21]
  wire  writer_clock; // @[ChiselDB.scala 132:24]
  wire  writer_reset; // @[ChiselDB.scala 132:24]
  wire  writer_en; // @[ChiselDB.scala 132:24]
  wire [63:0] writer_stamp; // @[ChiselDB.scala 132:24]
  wire [38:0] writer_data_vaddr; // @[ChiselDB.scala 132:24]
  wire [35:0] writer_data_paddr; // @[ChiselDB.scala 132:24]
  wire [3:0] writer_data_source; // @[ChiselDB.scala 132:24]
  wire [38:0] writer_data_pc; // @[ChiselDB.scala 132:24]
  reg [511:0] req_data_buffer_store_data; // @[Reg.scala 16:16]
  reg [63:0] req_data_buffer_store_mask; // @[Reg.scala 16:16]
  wire  probe_block_vec_0 = entries_0_io_block_addr_valid & entries_0_io_block_addr_bits == io_probe_addr; // @[MissQueue.scala 628:71]
  wire  probe_block_vec_1 = entries_1_io_block_addr_valid & entries_1_io_block_addr_bits == io_probe_addr; // @[MissQueue.scala 628:71]
  wire  probe_block_vec_2 = entries_2_io_block_addr_valid & entries_2_io_block_addr_bits == io_probe_addr; // @[MissQueue.scala 628:71]
  wire  probe_block_vec_3 = entries_3_io_block_addr_valid & entries_3_io_block_addr_bits == io_probe_addr; // @[MissQueue.scala 628:71]
  wire [3:0] _merge_T = {entries_0_io_secondary_ready,entries_1_io_secondary_ready,entries_2_io_secondary_ready,
    entries_3_io_secondary_ready}; // @[Cat.scala 31:58]
  wire  merge = |_merge_T; // @[MissQueue.scala 630:40]
  wire [3:0] _reject_T = {entries_0_io_secondary_reject,entries_1_io_secondary_reject,entries_2_io_secondary_reject,
    entries_3_io_secondary_reject}; // @[Cat.scala 31:58]
  wire  reject = |_reject_T; // @[MissQueue.scala 631:42]
  wire  _alloc_T = ~reject; // @[MissQueue.scala 632:15]
  wire  _alloc_T_1 = ~merge; // @[MissQueue.scala 632:26]
  wire [1:0] alloc_hi = {entries_0_io_primary_ready,entries_1_io_primary_ready}; // @[Cat.scala 31:58]
  wire [3:0] _alloc_T_3 = {entries_0_io_primary_ready,entries_1_io_primary_ready,entries_2_io_primary_ready,
    entries_3_io_primary_ready}; // @[Cat.scala 31:58]
  wire  alloc = ~reject & ~merge & |_alloc_T_3; // @[MissQueue.scala 632:33]
  wire [3:0] _io_resp_id_T = {entries_3_io_req_handled_by_this_entry,entries_2_io_req_handled_by_this_entry,
    entries_1_io_req_handled_by_this_entry,entries_0_io_req_handled_by_this_entry}; // @[Cat.scala 31:58]
  wire [1:0] io_resp_id_hi_1 = _io_resp_id_T[3:2]; // @[OneHot.scala 30:18]
  wire [1:0] io_resp_id_lo_1 = _io_resp_id_T[1:0]; // @[OneHot.scala 31:18]
  wire  _io_resp_id_T_1 = |io_resp_id_hi_1; // @[OneHot.scala 32:14]
  wire [1:0] _io_resp_id_T_2 = io_resp_id_hi_1 | io_resp_id_lo_1; // @[OneHot.scala 32:28]
  wire  _all_match_T_1 = ~io_forward_0_paddr[5]; // @[DCacheWrapper.scala 594:53]
  wire  forwardInfo_vec_0_firstbeat_valid = entries_0_io_forwardInfo_firstbeat_valid; // @[MissQueue.scala 639:{32,32}]
  wire  forwardInfo_vec_1_firstbeat_valid = entries_1_io_forwardInfo_firstbeat_valid; // @[MissQueue.scala 639:{32,32}]
  wire  _GEN_3 = 2'h1 == io_forward_0_mshrid ? forwardInfo_vec_1_firstbeat_valid : forwardInfo_vec_0_firstbeat_valid; // @[DCacheWrapper.scala 594:{61,61}]
  wire  forwardInfo_vec_2_firstbeat_valid = entries_2_io_forwardInfo_firstbeat_valid; // @[MissQueue.scala 639:{32,32}]
  wire  _GEN_4 = 2'h2 == io_forward_0_mshrid ? forwardInfo_vec_2_firstbeat_valid : _GEN_3; // @[DCacheWrapper.scala 594:{61,61}]
  wire  forwardInfo_vec_3_firstbeat_valid = entries_3_io_forwardInfo_firstbeat_valid; // @[MissQueue.scala 639:{32,32}]
  wire  _GEN_5 = 2'h3 == io_forward_0_mshrid ? forwardInfo_vec_3_firstbeat_valid : _GEN_4; // @[DCacheWrapper.scala 594:{61,61}]
  wire  forwardInfo_vec_0_lastbeat_valid = entries_0_io_forwardInfo_lastbeat_valid; // @[MissQueue.scala 639:{32,32}]
  wire  forwardInfo_vec_1_lastbeat_valid = entries_1_io_forwardInfo_lastbeat_valid; // @[MissQueue.scala 639:{32,32}]
  wire  _GEN_7 = 2'h1 == io_forward_0_mshrid ? forwardInfo_vec_1_lastbeat_valid : forwardInfo_vec_0_lastbeat_valid; // @[DCacheWrapper.scala 595:{61,61}]
  wire  forwardInfo_vec_2_lastbeat_valid = entries_2_io_forwardInfo_lastbeat_valid; // @[MissQueue.scala 639:{32,32}]
  wire  _GEN_8 = 2'h2 == io_forward_0_mshrid ? forwardInfo_vec_2_lastbeat_valid : _GEN_7; // @[DCacheWrapper.scala 595:{61,61}]
  wire  forwardInfo_vec_3_lastbeat_valid = entries_3_io_forwardInfo_lastbeat_valid; // @[MissQueue.scala 639:{32,32}]
  wire  _GEN_9 = 2'h3 == io_forward_0_mshrid ? forwardInfo_vec_3_lastbeat_valid : _GEN_8; // @[DCacheWrapper.scala 595:{61,61}]
  wire  _all_match_T_5 = io_forward_0_paddr[5] & _GEN_9; // @[DCacheWrapper.scala 595:61]
  reg  forward_mshr; // @[DCacheWrapper.scala 597:31]
  reg [7:0] forwardData__0; // @[DCacheWrapper.scala 598:30]
  reg [7:0] forwardData__1; // @[DCacheWrapper.scala 598:30]
  reg [7:0] forwardData__2; // @[DCacheWrapper.scala 598:30]
  reg [7:0] forwardData__3; // @[DCacheWrapper.scala 598:30]
  reg [7:0] forwardData__4; // @[DCacheWrapper.scala 598:30]
  reg [7:0] forwardData__5; // @[DCacheWrapper.scala 598:30]
  reg [7:0] forwardData__6; // @[DCacheWrapper.scala 598:30]
  reg [7:0] forwardData__7; // @[DCacheWrapper.scala 598:30]
  reg [7:0] forwardData__8; // @[DCacheWrapper.scala 598:30]
  reg [7:0] forwardData__9; // @[DCacheWrapper.scala 598:30]
  reg [7:0] forwardData__10; // @[DCacheWrapper.scala 598:30]
  reg [7:0] forwardData__11; // @[DCacheWrapper.scala 598:30]
  reg [7:0] forwardData__12; // @[DCacheWrapper.scala 598:30]
  reg [7:0] forwardData__13; // @[DCacheWrapper.scala 598:30]
  reg [7:0] forwardData__14; // @[DCacheWrapper.scala 598:30]
  reg [7:0] forwardData__15; // @[DCacheWrapper.scala 598:30]
  wire [1:0] block_idx = io_forward_0_paddr[4:3]; // @[DCacheWrapper.scala 601:30]
  wire [255:0] forwardInfo_vec_0_raw_data_0 = entries_0_io_forwardInfo_raw_data_0; // @[MissQueue.scala 639:{32,32}]
  wire [255:0] forwardInfo_vec_0_raw_data_1 = entries_0_io_forwardInfo_raw_data_1; // @[MissQueue.scala 639:{32,32}]
  wire [255:0] _GEN_11 = 2'h0 == io_forward_0_mshrid & io_forward_0_paddr[5] ? forwardInfo_vec_0_raw_data_1 :
    forwardInfo_vec_0_raw_data_0; // @[DCacheWrapper.scala 604:{33,33}]
  wire [255:0] forwardInfo_vec_1_raw_data_0 = entries_1_io_forwardInfo_raw_data_0; // @[MissQueue.scala 639:{32,32}]
  wire [255:0] _GEN_12 = 2'h1 == io_forward_0_mshrid & _all_match_T_1 ? forwardInfo_vec_1_raw_data_0 : _GEN_11; // @[DCacheWrapper.scala 604:{33,33}]
  wire [255:0] forwardInfo_vec_1_raw_data_1 = entries_1_io_forwardInfo_raw_data_1; // @[MissQueue.scala 639:{32,32}]
  wire [255:0] _GEN_13 = 2'h1 == io_forward_0_mshrid & io_forward_0_paddr[5] ? forwardInfo_vec_1_raw_data_1 : _GEN_12; // @[DCacheWrapper.scala 604:{33,33}]
  wire [255:0] forwardInfo_vec_2_raw_data_0 = entries_2_io_forwardInfo_raw_data_0; // @[MissQueue.scala 639:{32,32}]
  wire [255:0] _GEN_14 = 2'h2 == io_forward_0_mshrid & _all_match_T_1 ? forwardInfo_vec_2_raw_data_0 : _GEN_13; // @[DCacheWrapper.scala 604:{33,33}]
  wire [255:0] forwardInfo_vec_2_raw_data_1 = entries_2_io_forwardInfo_raw_data_1; // @[MissQueue.scala 639:{32,32}]
  wire [255:0] _GEN_15 = 2'h2 == io_forward_0_mshrid & io_forward_0_paddr[5] ? forwardInfo_vec_2_raw_data_1 : _GEN_14; // @[DCacheWrapper.scala 604:{33,33}]
  wire [255:0] forwardInfo_vec_3_raw_data_0 = entries_3_io_forwardInfo_raw_data_0; // @[MissQueue.scala 639:{32,32}]
  wire [255:0] _GEN_16 = 2'h3 == io_forward_0_mshrid & _all_match_T_1 ? forwardInfo_vec_3_raw_data_0 : _GEN_15; // @[DCacheWrapper.scala 604:{33,33}]
  wire [255:0] forwardInfo_vec_3_raw_data_1 = entries_3_io_forwardInfo_raw_data_1; // @[MissQueue.scala 639:{32,32}]
  wire [255:0] _GEN_17 = 2'h3 == io_forward_0_mshrid & io_forward_0_paddr[5] ? forwardInfo_vec_3_raw_data_1 : _GEN_16; // @[DCacheWrapper.scala 604:{33,33}]
  wire [63:0] block_data__0 = _GEN_17[63:0]; // @[DCacheWrapper.scala 604:33]
  wire [63:0] block_data__1 = _GEN_17[127:64]; // @[DCacheWrapper.scala 604:33]
  wire [63:0] block_data__2 = _GEN_17[191:128]; // @[DCacheWrapper.scala 604:33]
  wire [63:0] block_data__3 = _GEN_17[255:192]; // @[DCacheWrapper.scala 604:33]
  wire [63:0] _GEN_19 = 2'h1 == block_idx ? block_data__1 : block_data__0; // @[DCacheWrapper.scala 609:{46,46}]
  wire [63:0] _GEN_20 = 2'h2 == block_idx ? block_data__2 : _GEN_19; // @[DCacheWrapper.scala 609:{46,46}]
  wire [63:0] _GEN_21 = 2'h3 == block_idx ? block_data__3 : _GEN_20; // @[DCacheWrapper.scala 609:{46,46}]
  wire [127:0] _selected_data_T = {_GEN_21, 64'h0}; // @[DCacheWrapper.scala 609:46]
  wire [1:0] _selected_data_T_2 = block_idx + 2'h1; // @[DCacheWrapper.scala 611:49]
  wire [63:0] _GEN_23 = 2'h1 == _selected_data_T_2 ? block_data__1 : block_data__0; // @[Cat.scala 31:{58,58}]
  wire [63:0] _GEN_24 = 2'h2 == _selected_data_T_2 ? block_data__2 : _GEN_23; // @[Cat.scala 31:{58,58}]
  wire [63:0] _GEN_25 = 2'h3 == _selected_data_T_2 ? block_data__3 : _GEN_24; // @[Cat.scala 31:{58,58}]
  wire [127:0] _selected_data_T_3 = {_GEN_25,_GEN_21}; // @[Cat.scala 31:58]
  wire [127:0] selected_data = io_forward_0_paddr[3] ? _selected_data_T : _selected_data_T_3; // @[DCacheWrapper.scala 608:23 609:21 611:21]
  wire  forwardInfo_vec_0_inflight = entries_0_io_forwardInfo_inflight; // @[MissQueue.scala 639:{32,32}]
  wire  forwardInfo_vec_1_inflight = entries_1_io_forwardInfo_inflight; // @[MissQueue.scala 639:{32,32}]
  wire  _GEN_28 = 2'h1 == io_forward_0_mshrid ? forwardInfo_vec_1_inflight : forwardInfo_vec_0_inflight; // @[DCacheWrapper.scala 590:{23,23}]
  wire  forwardInfo_vec_2_inflight = entries_2_io_forwardInfo_inflight; // @[MissQueue.scala 639:{32,32}]
  wire  _GEN_29 = 2'h2 == io_forward_0_mshrid ? forwardInfo_vec_2_inflight : _GEN_28; // @[DCacheWrapper.scala 590:{23,23}]
  wire  forwardInfo_vec_3_inflight = entries_3_io_forwardInfo_inflight; // @[MissQueue.scala 639:{32,32}]
  wire  _GEN_30 = 2'h3 == io_forward_0_mshrid ? forwardInfo_vec_3_inflight : _GEN_29; // @[DCacheWrapper.scala 590:{23,23}]
  wire [35:0] forwardInfo_vec_0_paddr = entries_0_io_forwardInfo_paddr; // @[MissQueue.scala 639:{32,32}]
  wire [35:0] forwardInfo_vec_1_paddr = entries_1_io_forwardInfo_paddr; // @[MissQueue.scala 639:{32,32}]
  wire [35:0] _GEN_32 = 2'h1 == io_forward_0_mshrid ? forwardInfo_vec_1_paddr : forwardInfo_vec_0_paddr; // @[DCacheWrapper.scala 590:{86,86}]
  wire [35:0] forwardInfo_vec_2_paddr = entries_2_io_forwardInfo_paddr; // @[MissQueue.scala 639:{32,32}]
  wire [35:0] _GEN_33 = 2'h2 == io_forward_0_mshrid ? forwardInfo_vec_2_paddr : _GEN_32; // @[DCacheWrapper.scala 590:{86,86}]
  wire [35:0] forwardInfo_vec_3_paddr = entries_3_io_forwardInfo_paddr; // @[MissQueue.scala 639:{32,32}]
  wire [35:0] _GEN_34 = 2'h3 == io_forward_0_mshrid ? forwardInfo_vec_3_paddr : _GEN_33; // @[DCacheWrapper.scala 590:{86,86}]
  reg  io_forward_0_forward_result_valid_REG; // @[DCacheWrapper.scala 590:12]
  wire  _all_match_T_7 = ~io_forward_1_paddr[5]; // @[DCacheWrapper.scala 594:53]
  wire  _GEN_36 = 2'h1 == io_forward_1_mshrid ? forwardInfo_vec_1_firstbeat_valid : forwardInfo_vec_0_firstbeat_valid; // @[DCacheWrapper.scala 594:{61,61}]
  wire  _GEN_37 = 2'h2 == io_forward_1_mshrid ? forwardInfo_vec_2_firstbeat_valid : _GEN_36; // @[DCacheWrapper.scala 594:{61,61}]
  wire  _GEN_38 = 2'h3 == io_forward_1_mshrid ? forwardInfo_vec_3_firstbeat_valid : _GEN_37; // @[DCacheWrapper.scala 594:{61,61}]
  wire  _GEN_40 = 2'h1 == io_forward_1_mshrid ? forwardInfo_vec_1_lastbeat_valid : forwardInfo_vec_0_lastbeat_valid; // @[DCacheWrapper.scala 595:{61,61}]
  wire  _GEN_41 = 2'h2 == io_forward_1_mshrid ? forwardInfo_vec_2_lastbeat_valid : _GEN_40; // @[DCacheWrapper.scala 595:{61,61}]
  wire  _GEN_42 = 2'h3 == io_forward_1_mshrid ? forwardInfo_vec_3_lastbeat_valid : _GEN_41; // @[DCacheWrapper.scala 595:{61,61}]
  wire  _all_match_T_11 = io_forward_1_paddr[5] & _GEN_42; // @[DCacheWrapper.scala 595:61]
  reg  forward_mshr_1; // @[DCacheWrapper.scala 597:31]
  reg [7:0] forwardData_1_0; // @[DCacheWrapper.scala 598:30]
  reg [7:0] forwardData_1_1; // @[DCacheWrapper.scala 598:30]
  reg [7:0] forwardData_1_2; // @[DCacheWrapper.scala 598:30]
  reg [7:0] forwardData_1_3; // @[DCacheWrapper.scala 598:30]
  reg [7:0] forwardData_1_4; // @[DCacheWrapper.scala 598:30]
  reg [7:0] forwardData_1_5; // @[DCacheWrapper.scala 598:30]
  reg [7:0] forwardData_1_6; // @[DCacheWrapper.scala 598:30]
  reg [7:0] forwardData_1_7; // @[DCacheWrapper.scala 598:30]
  reg [7:0] forwardData_1_8; // @[DCacheWrapper.scala 598:30]
  reg [7:0] forwardData_1_9; // @[DCacheWrapper.scala 598:30]
  reg [7:0] forwardData_1_10; // @[DCacheWrapper.scala 598:30]
  reg [7:0] forwardData_1_11; // @[DCacheWrapper.scala 598:30]
  reg [7:0] forwardData_1_12; // @[DCacheWrapper.scala 598:30]
  reg [7:0] forwardData_1_13; // @[DCacheWrapper.scala 598:30]
  reg [7:0] forwardData_1_14; // @[DCacheWrapper.scala 598:30]
  reg [7:0] forwardData_1_15; // @[DCacheWrapper.scala 598:30]
  wire [1:0] block_idx_1 = io_forward_1_paddr[4:3]; // @[DCacheWrapper.scala 601:30]
  wire [255:0] _GEN_44 = 2'h0 == io_forward_1_mshrid & io_forward_1_paddr[5] ? forwardInfo_vec_0_raw_data_1 :
    forwardInfo_vec_0_raw_data_0; // @[DCacheWrapper.scala 604:{33,33}]
  wire [255:0] _GEN_45 = 2'h1 == io_forward_1_mshrid & _all_match_T_7 ? forwardInfo_vec_1_raw_data_0 : _GEN_44; // @[DCacheWrapper.scala 604:{33,33}]
  wire [255:0] _GEN_46 = 2'h1 == io_forward_1_mshrid & io_forward_1_paddr[5] ? forwardInfo_vec_1_raw_data_1 : _GEN_45; // @[DCacheWrapper.scala 604:{33,33}]
  wire [255:0] _GEN_47 = 2'h2 == io_forward_1_mshrid & _all_match_T_7 ? forwardInfo_vec_2_raw_data_0 : _GEN_46; // @[DCacheWrapper.scala 604:{33,33}]
  wire [255:0] _GEN_48 = 2'h2 == io_forward_1_mshrid & io_forward_1_paddr[5] ? forwardInfo_vec_2_raw_data_1 : _GEN_47; // @[DCacheWrapper.scala 604:{33,33}]
  wire [255:0] _GEN_49 = 2'h3 == io_forward_1_mshrid & _all_match_T_7 ? forwardInfo_vec_3_raw_data_0 : _GEN_48; // @[DCacheWrapper.scala 604:{33,33}]
  wire [255:0] _GEN_50 = 2'h3 == io_forward_1_mshrid & io_forward_1_paddr[5] ? forwardInfo_vec_3_raw_data_1 : _GEN_49; // @[DCacheWrapper.scala 604:{33,33}]
  wire [63:0] block_data_1_0 = _GEN_50[63:0]; // @[DCacheWrapper.scala 604:33]
  wire [63:0] block_data_1_1 = _GEN_50[127:64]; // @[DCacheWrapper.scala 604:33]
  wire [63:0] block_data_1_2 = _GEN_50[191:128]; // @[DCacheWrapper.scala 604:33]
  wire [63:0] block_data_1_3 = _GEN_50[255:192]; // @[DCacheWrapper.scala 604:33]
  wire [63:0] _GEN_52 = 2'h1 == block_idx_1 ? block_data_1_1 : block_data_1_0; // @[DCacheWrapper.scala 609:{46,46}]
  wire [63:0] _GEN_53 = 2'h2 == block_idx_1 ? block_data_1_2 : _GEN_52; // @[DCacheWrapper.scala 609:{46,46}]
  wire [63:0] _GEN_54 = 2'h3 == block_idx_1 ? block_data_1_3 : _GEN_53; // @[DCacheWrapper.scala 609:{46,46}]
  wire [127:0] _selected_data_T_4 = {_GEN_54, 64'h0}; // @[DCacheWrapper.scala 609:46]
  wire [1:0] _selected_data_T_6 = block_idx_1 + 2'h1; // @[DCacheWrapper.scala 611:49]
  wire [63:0] _GEN_56 = 2'h1 == _selected_data_T_6 ? block_data_1_1 : block_data_1_0; // @[Cat.scala 31:{58,58}]
  wire [63:0] _GEN_57 = 2'h2 == _selected_data_T_6 ? block_data_1_2 : _GEN_56; // @[Cat.scala 31:{58,58}]
  wire [63:0] _GEN_58 = 2'h3 == _selected_data_T_6 ? block_data_1_3 : _GEN_57; // @[Cat.scala 31:{58,58}]
  wire [127:0] _selected_data_T_7 = {_GEN_58,_GEN_54}; // @[Cat.scala 31:58]
  wire [127:0] selected_data_1 = io_forward_1_paddr[3] ? _selected_data_T_4 : _selected_data_T_7; // @[DCacheWrapper.scala 608:23 609:21 611:21]
  wire  _GEN_61 = 2'h1 == io_forward_1_mshrid ? forwardInfo_vec_1_inflight : forwardInfo_vec_0_inflight; // @[DCacheWrapper.scala 590:{23,23}]
  wire  _GEN_62 = 2'h2 == io_forward_1_mshrid ? forwardInfo_vec_2_inflight : _GEN_61; // @[DCacheWrapper.scala 590:{23,23}]
  wire  _GEN_63 = 2'h3 == io_forward_1_mshrid ? forwardInfo_vec_3_inflight : _GEN_62; // @[DCacheWrapper.scala 590:{23,23}]
  wire [35:0] _GEN_65 = 2'h1 == io_forward_1_mshrid ? forwardInfo_vec_1_paddr : forwardInfo_vec_0_paddr; // @[DCacheWrapper.scala 590:{86,86}]
  wire [35:0] _GEN_66 = 2'h2 == io_forward_1_mshrid ? forwardInfo_vec_2_paddr : _GEN_65; // @[DCacheWrapper.scala 590:{86,86}]
  wire [35:0] _GEN_67 = 2'h3 == io_forward_1_mshrid ? forwardInfo_vec_3_paddr : _GEN_66; // @[DCacheWrapper.scala 590:{86,86}]
  reg  io_forward_1_forward_result_valid_REG; // @[DCacheWrapper.scala 590:12]
  wire  _entries_0_io_primary_valid_T_1 = io_req_valid & _alloc_T_1; // @[MissQueue.scala 684:42]
  wire  _entries_0_io_primary_valid_T_3 = _entries_0_io_primary_valid_T_1 & _alloc_T; // @[MissQueue.scala 685:16]
  wire  _GEN_68 = io_mem_grant_bits_source == 4'h0 & entries_0_io_mem_grant_ready; // @[MissQueue.scala 671:22 694:47 695:24]
  wire  former_primary_ready = |entries_0_io_primary_ready; // @[MissQueue.scala 678:64]
  wire  _entries_1_io_primary_valid_T_4 = ~former_primary_ready; // @[MissQueue.scala 687:9]
  wire  _entries_1_io_primary_valid_T_5 = _entries_0_io_primary_valid_T_3 & _entries_1_io_primary_valid_T_4; // @[MissQueue.scala 686:17]
  wire  _GEN_79 = io_mem_grant_bits_source == 4'h1 ? entries_1_io_mem_grant_ready : _GEN_68; // @[MissQueue.scala 694:47 695:24]
  wire  former_primary_ready_1 = |alloc_hi; // @[MissQueue.scala 678:64]
  wire  _entries_2_io_primary_valid_T_4 = ~former_primary_ready_1; // @[MissQueue.scala 687:9]
  wire  _entries_2_io_primary_valid_T_5 = _entries_0_io_primary_valid_T_3 & _entries_2_io_primary_valid_T_4; // @[MissQueue.scala 686:17]
  wire  _GEN_90 = io_mem_grant_bits_source == 4'h2 ? entries_2_io_mem_grant_ready : _GEN_79; // @[MissQueue.scala 694:47 695:24]
  wire [2:0] _former_primary_ready_T_1 = {entries_0_io_primary_ready,entries_1_io_primary_ready,
    entries_2_io_primary_ready}; // @[Cat.scala 31:58]
  wire  former_primary_ready_2 = |_former_primary_ready_T_1; // @[MissQueue.scala 678:64]
  wire  _entries_3_io_primary_valid_T_4 = ~former_primary_ready_2; // @[MissQueue.scala 687:9]
  wire  _entries_3_io_primary_valid_T_5 = _entries_0_io_primary_valid_T_3 & _entries_3_io_primary_valid_T_4; // @[MissQueue.scala 686:17]
  wire [3:0] _io_refill_to_ldq_valid_T = {entries_0_io_refill_to_ldq_valid,entries_1_io_refill_to_ldq_valid,
    entries_2_io_refill_to_ldq_valid,entries_3_io_refill_to_ldq_valid}; // @[Cat.scala 31:58]
  wire [35:0] io_refill_to_ldq_bits_xs_0_addr = entries_0_io_refill_to_ldq_valid ? entries_0_io_refill_to_ldq_bits_addr
     : 36'h0; // @[ParallelMux.scala 64:44]
  wire [255:0] io_refill_to_ldq_bits_xs_0_data = entries_0_io_refill_to_ldq_valid ? entries_0_io_refill_to_ldq_bits_data
     : 256'h0; // @[ParallelMux.scala 64:44]
  wire  io_refill_to_ldq_bits_xs_0_error = entries_0_io_refill_to_ldq_valid & entries_0_io_refill_to_ldq_bits_error; // @[ParallelMux.scala 64:44]
  wire [511:0] io_refill_to_ldq_bits_xs_0_data_raw = entries_0_io_refill_to_ldq_valid ?
    entries_0_io_refill_to_ldq_bits_data_raw : 512'h0; // @[ParallelMux.scala 64:44]
  wire  io_refill_to_ldq_bits_xs_0_hasdata = entries_0_io_refill_to_ldq_valid & entries_0_io_refill_to_ldq_bits_hasdata; // @[ParallelMux.scala 64:44]
  wire  io_refill_to_ldq_bits_xs_0_refill_done = entries_0_io_refill_to_ldq_valid &
    entries_0_io_refill_to_ldq_bits_refill_done; // @[ParallelMux.scala 64:44]
  wire [1:0] io_refill_to_ldq_bits_xs_0_id = entries_0_io_refill_to_ldq_valid ? entries_0_io_refill_to_ldq_bits_id : 2'h0
    ; // @[ParallelMux.scala 64:44]
  wire [35:0] io_refill_to_ldq_bits_xs_1_addr = entries_1_io_refill_to_ldq_valid ? entries_1_io_refill_to_ldq_bits_addr
     : 36'h0; // @[ParallelMux.scala 64:44]
  wire [255:0] io_refill_to_ldq_bits_xs_1_data = entries_1_io_refill_to_ldq_valid ? entries_1_io_refill_to_ldq_bits_data
     : 256'h0; // @[ParallelMux.scala 64:44]
  wire  io_refill_to_ldq_bits_xs_1_error = entries_1_io_refill_to_ldq_valid & entries_1_io_refill_to_ldq_bits_error; // @[ParallelMux.scala 64:44]
  wire [511:0] io_refill_to_ldq_bits_xs_1_data_raw = entries_1_io_refill_to_ldq_valid ?
    entries_1_io_refill_to_ldq_bits_data_raw : 512'h0; // @[ParallelMux.scala 64:44]
  wire  io_refill_to_ldq_bits_xs_1_hasdata = entries_1_io_refill_to_ldq_valid & entries_1_io_refill_to_ldq_bits_hasdata; // @[ParallelMux.scala 64:44]
  wire  io_refill_to_ldq_bits_xs_1_refill_done = entries_1_io_refill_to_ldq_valid &
    entries_1_io_refill_to_ldq_bits_refill_done; // @[ParallelMux.scala 64:44]
  wire [1:0] io_refill_to_ldq_bits_xs_1_id = entries_1_io_refill_to_ldq_valid ? entries_1_io_refill_to_ldq_bits_id : 2'h0
    ; // @[ParallelMux.scala 64:44]
  wire [35:0] io_refill_to_ldq_bits_xs_2_addr = entries_2_io_refill_to_ldq_valid ? entries_2_io_refill_to_ldq_bits_addr
     : 36'h0; // @[ParallelMux.scala 64:44]
  wire [255:0] io_refill_to_ldq_bits_xs_2_data = entries_2_io_refill_to_ldq_valid ? entries_2_io_refill_to_ldq_bits_data
     : 256'h0; // @[ParallelMux.scala 64:44]
  wire  io_refill_to_ldq_bits_xs_2_error = entries_2_io_refill_to_ldq_valid & entries_2_io_refill_to_ldq_bits_error; // @[ParallelMux.scala 64:44]
  wire [511:0] io_refill_to_ldq_bits_xs_2_data_raw = entries_2_io_refill_to_ldq_valid ?
    entries_2_io_refill_to_ldq_bits_data_raw : 512'h0; // @[ParallelMux.scala 64:44]
  wire  io_refill_to_ldq_bits_xs_2_hasdata = entries_2_io_refill_to_ldq_valid & entries_2_io_refill_to_ldq_bits_hasdata; // @[ParallelMux.scala 64:44]
  wire  io_refill_to_ldq_bits_xs_2_refill_done = entries_2_io_refill_to_ldq_valid &
    entries_2_io_refill_to_ldq_bits_refill_done; // @[ParallelMux.scala 64:44]
  wire [1:0] io_refill_to_ldq_bits_xs_2_id = entries_2_io_refill_to_ldq_valid ? entries_2_io_refill_to_ldq_bits_id : 2'h0
    ; // @[ParallelMux.scala 64:44]
  wire [35:0] io_refill_to_ldq_bits_xs_3_addr = entries_3_io_refill_to_ldq_valid ? entries_3_io_refill_to_ldq_bits_addr
     : 36'h0; // @[ParallelMux.scala 64:44]
  wire [255:0] io_refill_to_ldq_bits_xs_3_data = entries_3_io_refill_to_ldq_valid ? entries_3_io_refill_to_ldq_bits_data
     : 256'h0; // @[ParallelMux.scala 64:44]
  wire  io_refill_to_ldq_bits_xs_3_error = entries_3_io_refill_to_ldq_valid & entries_3_io_refill_to_ldq_bits_error; // @[ParallelMux.scala 64:44]
  wire [511:0] io_refill_to_ldq_bits_xs_3_data_raw = entries_3_io_refill_to_ldq_valid ?
    entries_3_io_refill_to_ldq_bits_data_raw : 512'h0; // @[ParallelMux.scala 64:44]
  wire  io_refill_to_ldq_bits_xs_3_hasdata = entries_3_io_refill_to_ldq_valid & entries_3_io_refill_to_ldq_bits_hasdata; // @[ParallelMux.scala 64:44]
  wire  io_refill_to_ldq_bits_xs_3_refill_done = entries_3_io_refill_to_ldq_valid &
    entries_3_io_refill_to_ldq_bits_refill_done; // @[ParallelMux.scala 64:44]
  wire [1:0] io_refill_to_ldq_bits_xs_3_id = entries_3_io_refill_to_ldq_valid ? entries_3_io_refill_to_ldq_bits_id : 2'h0
    ; // @[ParallelMux.scala 64:44]
  wire [808:0] _io_refill_to_ldq_bits_T = {io_refill_to_ldq_bits_xs_0_addr,io_refill_to_ldq_bits_xs_0_data,
    io_refill_to_ldq_bits_xs_0_error,io_refill_to_ldq_bits_xs_0_data_raw,io_refill_to_ldq_bits_xs_0_hasdata,
    io_refill_to_ldq_bits_xs_0_refill_done,io_refill_to_ldq_bits_xs_0_id}; // @[ParallelMux.scala 36:46]
  wire [808:0] _io_refill_to_ldq_bits_T_1 = {io_refill_to_ldq_bits_xs_1_addr,io_refill_to_ldq_bits_xs_1_data,
    io_refill_to_ldq_bits_xs_1_error,io_refill_to_ldq_bits_xs_1_data_raw,io_refill_to_ldq_bits_xs_1_hasdata,
    io_refill_to_ldq_bits_xs_1_refill_done,io_refill_to_ldq_bits_xs_1_id}; // @[ParallelMux.scala 36:57]
  wire [808:0] _io_refill_to_ldq_bits_T_2 = _io_refill_to_ldq_bits_T | _io_refill_to_ldq_bits_T_1; // @[ParallelMux.scala 36:53]
  wire [808:0] _io_refill_to_ldq_bits_T_10 = {io_refill_to_ldq_bits_xs_2_addr,io_refill_to_ldq_bits_xs_2_data,
    io_refill_to_ldq_bits_xs_2_error,io_refill_to_ldq_bits_xs_2_data_raw,io_refill_to_ldq_bits_xs_2_hasdata,
    io_refill_to_ldq_bits_xs_2_refill_done,io_refill_to_ldq_bits_xs_2_id}; // @[ParallelMux.scala 36:46]
  wire [808:0] _io_refill_to_ldq_bits_T_11 = {io_refill_to_ldq_bits_xs_3_addr,io_refill_to_ldq_bits_xs_3_data,
    io_refill_to_ldq_bits_xs_3_error,io_refill_to_ldq_bits_xs_3_data_raw,io_refill_to_ldq_bits_xs_3_hasdata,
    io_refill_to_ldq_bits_xs_3_refill_done,io_refill_to_ldq_bits_xs_3_id}; // @[ParallelMux.scala 36:57]
  wire [808:0] _io_refill_to_ldq_bits_T_12 = _io_refill_to_ldq_bits_T_10 | _io_refill_to_ldq_bits_T_11; // @[ParallelMux.scala 36:53]
  wire [808:0] _io_refill_to_ldq_bits_T_20 = {_io_refill_to_ldq_bits_T_2[808:773],_io_refill_to_ldq_bits_T_2[772:517],
    _io_refill_to_ldq_bits_T_2[516],_io_refill_to_ldq_bits_T_2[515:4],_io_refill_to_ldq_bits_T_2[3],
    _io_refill_to_ldq_bits_T_2[2],_io_refill_to_ldq_bits_T_2[1:0]}; // @[ParallelMux.scala 36:46]
  wire [808:0] _io_refill_to_ldq_bits_T_21 = {_io_refill_to_ldq_bits_T_12[808:773],_io_refill_to_ldq_bits_T_12[772:517],
    _io_refill_to_ldq_bits_T_12[516],_io_refill_to_ldq_bits_T_12[515:4],_io_refill_to_ldq_bits_T_12[3],
    _io_refill_to_ldq_bits_T_12[2],_io_refill_to_ldq_bits_T_12[1:0]}; // @[ParallelMux.scala 36:57]
  wire [808:0] _io_refill_to_ldq_bits_T_22 = _io_refill_to_ldq_bits_T_20 | _io_refill_to_ldq_bits_T_21; // @[ParallelMux.scala 36:53]
  reg  beatsLeft; // @[Arbiter.scala 87:30]
  wire  idle = ~beatsLeft; // @[Arbiter.scala 88:28]
  wire  latch = idle & io_mem_acquire_ready; // @[Arbiter.scala 89:24]
  wire  out_earlyValid = entries_0_io_mem_acquire_valid; // @[ReadyValidCancel.scala 68:19 69:20]
  wire  out_1_earlyValid = entries_1_io_mem_acquire_valid; // @[ReadyValidCancel.scala 68:19 69:20]
  wire  out_2_earlyValid = entries_2_io_mem_acquire_valid; // @[ReadyValidCancel.scala 68:19 69:20]
  wire  out_3_earlyValid = entries_3_io_mem_acquire_valid; // @[ReadyValidCancel.scala 68:19 69:20]
  wire [3:0] _readys_T = {out_3_earlyValid,out_2_earlyValid,out_1_earlyValid,out_earlyValid}; // @[Cat.scala 31:58]
  wire [4:0] _readys_T_1 = {_readys_T, 1'h0}; // @[package.scala 244:48]
  wire [3:0] _readys_T_3 = _readys_T | _readys_T_1[3:0]; // @[package.scala 244:43]
  wire [5:0] _readys_T_4 = {_readys_T_3, 2'h0}; // @[package.scala 244:48]
  wire [3:0] _readys_T_6 = _readys_T_3 | _readys_T_4[3:0]; // @[package.scala 244:43]
  wire [4:0] _readys_T_8 = {_readys_T_6, 1'h0}; // @[Arbiter.scala 16:78]
  wire [3:0] _readys_T_10 = ~_readys_T_8[3:0]; // @[Arbiter.scala 16:61]
  wire  readys__0 = _readys_T_10[0]; // @[Arbiter.scala 95:86]
  wire  readys__1 = _readys_T_10[1]; // @[Arbiter.scala 95:86]
  wire  readys__2 = _readys_T_10[2]; // @[Arbiter.scala 95:86]
  wire  readys__3 = _readys_T_10[3]; // @[Arbiter.scala 95:86]
  wire  earlyWinner__0 = readys__0 & out_earlyValid; // @[Arbiter.scala 97:79]
  wire  earlyWinner__1 = readys__1 & out_1_earlyValid; // @[Arbiter.scala 97:79]
  wire  earlyWinner__2 = readys__2 & out_2_earlyValid; // @[Arbiter.scala 97:79]
  wire  earlyWinner__3 = readys__3 & out_3_earlyValid; // @[Arbiter.scala 97:79]
  wire  _T_50 = out_earlyValid | out_1_earlyValid | out_2_earlyValid | out_3_earlyValid; // @[Arbiter.scala 107:36]
  reg  state__0; // @[Arbiter.scala 116:26]
  wire  muxStateEarly__0 = idle ? earlyWinner__0 : state__0; // @[Arbiter.scala 117:30]
  reg  state__1; // @[Arbiter.scala 116:26]
  wire  muxStateEarly__1 = idle ? earlyWinner__1 : state__1; // @[Arbiter.scala 117:30]
  reg  state__2; // @[Arbiter.scala 116:26]
  wire  muxStateEarly__2 = idle ? earlyWinner__2 : state__2; // @[Arbiter.scala 117:30]
  reg  state__3; // @[Arbiter.scala 116:26]
  wire  muxStateEarly__3 = idle ? earlyWinner__3 : state__3; // @[Arbiter.scala 117:30]
  wire  _sink_ACancel_earlyValid_T_9 = state__0 & out_earlyValid | state__1 & out_1_earlyValid | state__2 &
    out_2_earlyValid | state__3 & out_3_earlyValid; // @[Mux.scala 27:73]
  wire  sink_ACancel_earlyValid = idle ? _T_50 : _sink_ACancel_earlyValid_T_9; // @[Arbiter.scala 125:29]
  wire  _beatsLeft_T_2 = io_mem_acquire_ready & sink_ACancel_earlyValid; // @[ReadyValidCancel.scala 49:33]
  wire  allowed__0 = idle ? readys__0 : state__0; // @[Arbiter.scala 121:24]
  wire  allowed__1 = idle ? readys__1 : state__1; // @[Arbiter.scala 121:24]
  wire  allowed__2 = idle ? readys__2 : state__2; // @[Arbiter.scala 121:24]
  wire  allowed__3 = idle ? readys__3 : state__3; // @[Arbiter.scala 121:24]
  wire [31:0] _T_84 = muxStateEarly__0 ? 32'hffffffff : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _T_85 = muxStateEarly__1 ? 32'hffffffff : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _T_86 = muxStateEarly__2 ? 32'hffffffff : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _T_87 = muxStateEarly__3 ? 32'hffffffff : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _T_88 = _T_84 | _T_85; // @[Mux.scala 27:73]
  wire [31:0] _T_89 = _T_88 | _T_86; // @[Mux.scala 27:73]
  wire [35:0] out_bits_address = entries_0_io_mem_acquire_bits_address; // @[ReadyValidCancel.scala 68:19 71:14]
  wire [35:0] _T_112 = muxStateEarly__0 ? out_bits_address : 36'h0; // @[Mux.scala 27:73]
  wire [35:0] out_1_bits_address = entries_1_io_mem_acquire_bits_address; // @[ReadyValidCancel.scala 68:19 71:14]
  wire [35:0] _T_113 = muxStateEarly__1 ? out_1_bits_address : 36'h0; // @[Mux.scala 27:73]
  wire [35:0] out_2_bits_address = entries_2_io_mem_acquire_bits_address; // @[ReadyValidCancel.scala 68:19 71:14]
  wire [35:0] _T_114 = muxStateEarly__2 ? out_2_bits_address : 36'h0; // @[Mux.scala 27:73]
  wire [35:0] out_3_bits_address = entries_3_io_mem_acquire_bits_address; // @[ReadyValidCancel.scala 68:19 71:14]
  wire [35:0] _T_115 = muxStateEarly__3 ? out_3_bits_address : 36'h0; // @[Mux.scala 27:73]
  wire [35:0] _T_116 = _T_112 | _T_113; // @[Mux.scala 27:73]
  wire [35:0] _T_117 = _T_116 | _T_114; // @[Mux.scala 27:73]
  wire [3:0] out_bits_source = entries_0_io_mem_acquire_bits_source; // @[ReadyValidCancel.scala 68:19 71:14]
  wire [3:0] _T_119 = muxStateEarly__0 ? out_bits_source : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] out_1_bits_source = entries_1_io_mem_acquire_bits_source; // @[ReadyValidCancel.scala 68:19 71:14]
  wire [3:0] _T_120 = muxStateEarly__1 ? out_1_bits_source : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] out_2_bits_source = entries_2_io_mem_acquire_bits_source; // @[ReadyValidCancel.scala 68:19 71:14]
  wire [3:0] _T_121 = muxStateEarly__2 ? out_2_bits_source : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] out_3_bits_source = entries_3_io_mem_acquire_bits_source; // @[ReadyValidCancel.scala 68:19 71:14]
  wire [3:0] _T_122 = muxStateEarly__3 ? out_3_bits_source : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] _T_123 = _T_119 | _T_120; // @[Mux.scala 27:73]
  wire [3:0] _T_124 = _T_123 | _T_121; // @[Mux.scala 27:73]
  wire [2:0] _T_126 = muxStateEarly__0 ? 3'h6 : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _T_127 = muxStateEarly__1 ? 3'h6 : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _T_128 = muxStateEarly__2 ? 3'h6 : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _T_129 = muxStateEarly__3 ? 3'h6 : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _T_130 = _T_126 | _T_127; // @[Mux.scala 27:73]
  wire [2:0] _T_131 = _T_130 | _T_128; // @[Mux.scala 27:73]
  wire [2:0] out_bits_param = entries_0_io_mem_acquire_bits_param; // @[ReadyValidCancel.scala 68:19 71:14]
  wire [2:0] _T_133 = muxStateEarly__0 ? out_bits_param : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] out_1_bits_param = entries_1_io_mem_acquire_bits_param; // @[ReadyValidCancel.scala 68:19 71:14]
  wire [2:0] _T_134 = muxStateEarly__1 ? out_1_bits_param : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] out_2_bits_param = entries_2_io_mem_acquire_bits_param; // @[ReadyValidCancel.scala 68:19 71:14]
  wire [2:0] _T_135 = muxStateEarly__2 ? out_2_bits_param : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] out_3_bits_param = entries_3_io_mem_acquire_bits_param; // @[ReadyValidCancel.scala 68:19 71:14]
  wire [2:0] _T_136 = muxStateEarly__3 ? out_3_bits_param : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _T_137 = _T_133 | _T_134; // @[Mux.scala 27:73]
  wire [2:0] _T_138 = _T_137 | _T_135; // @[Mux.scala 27:73]
  reg  beatsLeft_1; // @[Arbiter.scala 87:30]
  wire  idle_1 = ~beatsLeft_1; // @[Arbiter.scala 88:28]
  wire  latch_1 = idle_1 & io_mem_finish_ready; // @[Arbiter.scala 89:24]
  wire  out_5_earlyValid = entries_0_io_mem_finish_valid; // @[ReadyValidCancel.scala 68:19 69:20]
  wire  out_6_earlyValid = entries_1_io_mem_finish_valid; // @[ReadyValidCancel.scala 68:19 69:20]
  wire  out_7_earlyValid = entries_2_io_mem_finish_valid; // @[ReadyValidCancel.scala 68:19 69:20]
  wire  out_8_earlyValid = entries_3_io_mem_finish_valid; // @[ReadyValidCancel.scala 68:19 69:20]
  wire [3:0] _readys_T_15 = {out_8_earlyValid,out_7_earlyValid,out_6_earlyValid,out_5_earlyValid}; // @[Cat.scala 31:58]
  wire [4:0] _readys_T_16 = {_readys_T_15, 1'h0}; // @[package.scala 244:48]
  wire [3:0] _readys_T_18 = _readys_T_15 | _readys_T_16[3:0]; // @[package.scala 244:43]
  wire [5:0] _readys_T_19 = {_readys_T_18, 2'h0}; // @[package.scala 244:48]
  wire [3:0] _readys_T_21 = _readys_T_18 | _readys_T_19[3:0]; // @[package.scala 244:43]
  wire [4:0] _readys_T_23 = {_readys_T_21, 1'h0}; // @[Arbiter.scala 16:78]
  wire [3:0] _readys_T_25 = ~_readys_T_23[3:0]; // @[Arbiter.scala 16:61]
  wire  readys_1_0 = _readys_T_25[0]; // @[Arbiter.scala 95:86]
  wire  readys_1_1 = _readys_T_25[1]; // @[Arbiter.scala 95:86]
  wire  readys_1_2 = _readys_T_25[2]; // @[Arbiter.scala 95:86]
  wire  readys_1_3 = _readys_T_25[3]; // @[Arbiter.scala 95:86]
  wire  earlyWinner_1_0 = readys_1_0 & out_5_earlyValid; // @[Arbiter.scala 97:79]
  wire  earlyWinner_1_1 = readys_1_1 & out_6_earlyValid; // @[Arbiter.scala 97:79]
  wire  earlyWinner_1_2 = readys_1_2 & out_7_earlyValid; // @[Arbiter.scala 97:79]
  wire  earlyWinner_1_3 = readys_1_3 & out_8_earlyValid; // @[Arbiter.scala 97:79]
  wire  _T_167 = out_5_earlyValid | out_6_earlyValid | out_7_earlyValid | out_8_earlyValid; // @[Arbiter.scala 107:36]
  reg  state_1_0; // @[Arbiter.scala 116:26]
  wire  muxStateEarly_1_0 = idle_1 ? earlyWinner_1_0 : state_1_0; // @[Arbiter.scala 117:30]
  reg  state_1_1; // @[Arbiter.scala 116:26]
  wire  muxStateEarly_1_1 = idle_1 ? earlyWinner_1_1 : state_1_1; // @[Arbiter.scala 117:30]
  reg  state_1_2; // @[Arbiter.scala 116:26]
  wire  muxStateEarly_1_2 = idle_1 ? earlyWinner_1_2 : state_1_2; // @[Arbiter.scala 117:30]
  reg  state_1_3; // @[Arbiter.scala 116:26]
  wire  muxStateEarly_1_3 = idle_1 ? earlyWinner_1_3 : state_1_3; // @[Arbiter.scala 117:30]
  wire  _sink_ACancel_earlyValid_T_20 = state_1_0 & out_5_earlyValid | state_1_1 & out_6_earlyValid | state_1_2 &
    out_7_earlyValid | state_1_3 & out_8_earlyValid; // @[Mux.scala 27:73]
  wire  sink_ACancel_1_earlyValid = idle_1 ? _T_167 : _sink_ACancel_earlyValid_T_20; // @[Arbiter.scala 125:29]
  wire  _beatsLeft_T_8 = io_mem_finish_ready & sink_ACancel_1_earlyValid; // @[ReadyValidCancel.scala 49:33]
  wire  allowed_1_0 = idle_1 ? readys_1_0 : state_1_0; // @[Arbiter.scala 121:24]
  wire  allowed_1_1 = idle_1 ? readys_1_1 : state_1_1; // @[Arbiter.scala 121:24]
  wire  allowed_1_2 = idle_1 ? readys_1_2 : state_1_2; // @[Arbiter.scala 121:24]
  wire  allowed_1_3 = idle_1 ? readys_1_3 : state_1_3; // @[Arbiter.scala 121:24]
  wire [3:0] out_5_bits_sink = entries_0_io_mem_finish_bits_sink; // @[ReadyValidCancel.scala 68:19 71:14]
  wire [3:0] _T_187 = muxStateEarly_1_0 ? out_5_bits_sink : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] out_6_bits_sink = entries_1_io_mem_finish_bits_sink; // @[ReadyValidCancel.scala 68:19 71:14]
  wire [3:0] _T_188 = muxStateEarly_1_1 ? out_6_bits_sink : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] out_7_bits_sink = entries_2_io_mem_finish_bits_sink; // @[ReadyValidCancel.scala 68:19 71:14]
  wire [3:0] _T_189 = muxStateEarly_1_2 ? out_7_bits_sink : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] out_8_bits_sink = entries_3_io_mem_finish_bits_sink; // @[ReadyValidCancel.scala 68:19 71:14]
  wire [3:0] _T_190 = muxStateEarly_1_3 ? out_8_bits_sink : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] _T_191 = _T_187 | _T_188; // @[Mux.scala 27:73]
  wire [3:0] _T_192 = _T_191 | _T_189; // @[Mux.scala 27:73]
  wire [3:0] _io_probe_block_T = {probe_block_vec_0,probe_block_vec_1,probe_block_vec_2,probe_block_vec_3}; // @[Cat.scala 31:58]
  reg [63:0] cnt; // @[ChiselDB.scala 133:22]
  wire  _perfValidCount_T = ~entries_0_io_primary_ready; // @[MissQueue.scala 774:63]
  wire  _perfValidCount_T_1 = ~entries_1_io_primary_ready; // @[MissQueue.scala 774:63]
  wire  _perfValidCount_T_2 = ~entries_2_io_primary_ready; // @[MissQueue.scala 774:63]
  wire  _perfValidCount_T_3 = ~entries_3_io_primary_ready; // @[MissQueue.scala 774:63]
  wire [1:0] _perfValidCount_T_4 = _perfValidCount_T + _perfValidCount_T_1; // @[Bitwise.scala 48:55]
  wire [1:0] _perfValidCount_T_6 = _perfValidCount_T_2 + _perfValidCount_T_3; // @[Bitwise.scala 48:55]
  reg [2:0] perfValidCount; // @[MissQueue.scala 774:31]
  wire [2:0] _T_222 = 3'h4 / 2'h2; // @[MissQueue.scala 778:116]
  wire [4:0] _T_227 = 3'h4 * 2'h3; // @[MissQueue.scala 779:116]
  wire [4:0] _T_228 = _T_227 / 3'h4; // @[MissQueue.scala 779:120]
  wire [4:0] _GEN_133 = {{2'd0}, perfValidCount}; // @[MissQueue.scala 779:94]
  reg  io_perf_0_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg  io_perf_0_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg  io_perf_1_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg  io_perf_1_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg  io_perf_2_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg  io_perf_2_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg  io_perf_3_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg  io_perf_3_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg  io_perf_4_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg  io_perf_4_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  MissEntry entries_0 ( // @[MissQueue.scala 620:50]
    .clock(entries_0_clock),
    .reset(entries_0_reset),
    .io_id(entries_0_io_id),
    .io_req_valid(entries_0_io_req_valid),
    .io_req_bits_source(entries_0_io_req_bits_source),
    .io_req_bits_cmd(entries_0_io_req_bits_cmd),
    .io_req_bits_addr(entries_0_io_req_bits_addr),
    .io_req_bits_vaddr(entries_0_io_req_bits_vaddr),
    .io_req_bits_way_en(entries_0_io_req_bits_way_en),
    .io_req_bits_word_idx(entries_0_io_req_bits_word_idx),
    .io_req_bits_amo_data(entries_0_io_req_bits_amo_data),
    .io_req_bits_amo_mask(entries_0_io_req_bits_amo_mask),
    .io_req_bits_req_coh_state(entries_0_io_req_bits_req_coh_state),
    .io_req_bits_replace_coh_state(entries_0_io_req_bits_replace_coh_state),
    .io_req_bits_replace_tag(entries_0_io_req_bits_replace_tag),
    .io_req_bits_id(entries_0_io_req_bits_id),
    .io_req_bits_cancel(entries_0_io_req_bits_cancel),
    .io_req_data_store_data(entries_0_io_req_data_store_data),
    .io_req_data_store_mask(entries_0_io_req_data_store_mask),
    .io_primary_valid(entries_0_io_primary_valid),
    .io_primary_ready(entries_0_io_primary_ready),
    .io_secondary_ready(entries_0_io_secondary_ready),
    .io_secondary_reject(entries_0_io_secondary_reject),
    .io_refill_to_ldq_valid(entries_0_io_refill_to_ldq_valid),
    .io_refill_to_ldq_bits_addr(entries_0_io_refill_to_ldq_bits_addr),
    .io_refill_to_ldq_bits_data(entries_0_io_refill_to_ldq_bits_data),
    .io_refill_to_ldq_bits_error(entries_0_io_refill_to_ldq_bits_error),
    .io_refill_to_ldq_bits_data_raw(entries_0_io_refill_to_ldq_bits_data_raw),
    .io_refill_to_ldq_bits_hasdata(entries_0_io_refill_to_ldq_bits_hasdata),
    .io_refill_to_ldq_bits_refill_done(entries_0_io_refill_to_ldq_bits_refill_done),
    .io_refill_to_ldq_bits_id(entries_0_io_refill_to_ldq_bits_id),
    .io_mem_acquire_ready(entries_0_io_mem_acquire_ready),
    .io_mem_acquire_valid(entries_0_io_mem_acquire_valid),
    .io_mem_acquire_bits_param(entries_0_io_mem_acquire_bits_param),
    .io_mem_acquire_bits_source(entries_0_io_mem_acquire_bits_source),
    .io_mem_acquire_bits_address(entries_0_io_mem_acquire_bits_address),
    .io_mem_grant_ready(entries_0_io_mem_grant_ready),
    .io_mem_grant_valid(entries_0_io_mem_grant_valid),
    .io_mem_grant_bits_opcode(entries_0_io_mem_grant_bits_opcode),
    .io_mem_grant_bits_param(entries_0_io_mem_grant_bits_param),
    .io_mem_grant_bits_size(entries_0_io_mem_grant_bits_size),
    .io_mem_grant_bits_sink(entries_0_io_mem_grant_bits_sink),
    .io_mem_grant_bits_denied(entries_0_io_mem_grant_bits_denied),
    .io_mem_grant_bits_echo_blockisdirty(entries_0_io_mem_grant_bits_echo_blockisdirty),
    .io_mem_grant_bits_data(entries_0_io_mem_grant_bits_data),
    .io_mem_grant_bits_corrupt(entries_0_io_mem_grant_bits_corrupt),
    .io_mem_finish_ready(entries_0_io_mem_finish_ready),
    .io_mem_finish_valid(entries_0_io_mem_finish_valid),
    .io_mem_finish_bits_sink(entries_0_io_mem_finish_bits_sink),
    .io_refill_pipe_req_ready(entries_0_io_refill_pipe_req_ready),
    .io_refill_pipe_req_valid(entries_0_io_refill_pipe_req_valid),
    .io_refill_pipe_req_bits_source(entries_0_io_refill_pipe_req_bits_source),
    .io_refill_pipe_req_bits_addr(entries_0_io_refill_pipe_req_bits_addr),
    .io_refill_pipe_req_bits_way_en(entries_0_io_refill_pipe_req_bits_way_en),
    .io_refill_pipe_req_bits_alias(entries_0_io_refill_pipe_req_bits_alias),
    .io_refill_pipe_req_bits_miss_id(entries_0_io_refill_pipe_req_bits_miss_id),
    .io_refill_pipe_req_bits_id(entries_0_io_refill_pipe_req_bits_id),
    .io_refill_pipe_req_bits_error(entries_0_io_refill_pipe_req_bits_error),
    .io_refill_pipe_req_bits_prefetch(entries_0_io_refill_pipe_req_bits_prefetch),
    .io_refill_pipe_req_bits_wmask(entries_0_io_refill_pipe_req_bits_wmask),
    .io_refill_pipe_req_bits_data_0(entries_0_io_refill_pipe_req_bits_data_0),
    .io_refill_pipe_req_bits_data_1(entries_0_io_refill_pipe_req_bits_data_1),
    .io_refill_pipe_req_bits_data_2(entries_0_io_refill_pipe_req_bits_data_2),
    .io_refill_pipe_req_bits_data_3(entries_0_io_refill_pipe_req_bits_data_3),
    .io_refill_pipe_req_bits_data_4(entries_0_io_refill_pipe_req_bits_data_4),
    .io_refill_pipe_req_bits_data_5(entries_0_io_refill_pipe_req_bits_data_5),
    .io_refill_pipe_req_bits_data_6(entries_0_io_refill_pipe_req_bits_data_6),
    .io_refill_pipe_req_bits_data_7(entries_0_io_refill_pipe_req_bits_data_7),
    .io_refill_pipe_req_bits_meta_coh_state(entries_0_io_refill_pipe_req_bits_meta_coh_state),
    .io_refill_pipe_resp(entries_0_io_refill_pipe_resp),
    .io_replace_pipe_req_ready(entries_0_io_replace_pipe_req_ready),
    .io_replace_pipe_req_valid(entries_0_io_replace_pipe_req_valid),
    .io_replace_pipe_req_bits_miss_id(entries_0_io_replace_pipe_req_bits_miss_id),
    .io_replace_pipe_req_bits_vaddr(entries_0_io_replace_pipe_req_bits_vaddr),
    .io_replace_pipe_req_bits_addr(entries_0_io_replace_pipe_req_bits_addr),
    .io_replace_pipe_req_bits_replace_way_en(entries_0_io_replace_pipe_req_bits_replace_way_en),
    .io_replace_pipe_resp(entries_0_io_replace_pipe_resp),
    .io_main_pipe_req_ready(entries_0_io_main_pipe_req_ready),
    .io_main_pipe_req_valid(entries_0_io_main_pipe_req_valid),
    .io_main_pipe_req_bits_miss_id(entries_0_io_main_pipe_req_bits_miss_id),
    .io_main_pipe_req_bits_miss_param(entries_0_io_main_pipe_req_bits_miss_param),
    .io_main_pipe_req_bits_miss_dirty(entries_0_io_main_pipe_req_bits_miss_dirty),
    .io_main_pipe_req_bits_miss_way_en(entries_0_io_main_pipe_req_bits_miss_way_en),
    .io_main_pipe_req_bits_source(entries_0_io_main_pipe_req_bits_source),
    .io_main_pipe_req_bits_cmd(entries_0_io_main_pipe_req_bits_cmd),
    .io_main_pipe_req_bits_vaddr(entries_0_io_main_pipe_req_bits_vaddr),
    .io_main_pipe_req_bits_addr(entries_0_io_main_pipe_req_bits_addr),
    .io_main_pipe_req_bits_store_data(entries_0_io_main_pipe_req_bits_store_data),
    .io_main_pipe_req_bits_word_idx(entries_0_io_main_pipe_req_bits_word_idx),
    .io_main_pipe_req_bits_amo_data(entries_0_io_main_pipe_req_bits_amo_data),
    .io_main_pipe_req_bits_amo_mask(entries_0_io_main_pipe_req_bits_amo_mask),
    .io_main_pipe_req_bits_error(entries_0_io_main_pipe_req_bits_error),
    .io_main_pipe_req_bits_id(entries_0_io_main_pipe_req_bits_id),
    .io_main_pipe_resp(entries_0_io_main_pipe_resp),
    .io_block_addr_valid(entries_0_io_block_addr_valid),
    .io_block_addr_bits(entries_0_io_block_addr_bits),
    .io_req_handled_by_this_entry(entries_0_io_req_handled_by_this_entry),
    .io_forwardInfo_inflight(entries_0_io_forwardInfo_inflight),
    .io_forwardInfo_paddr(entries_0_io_forwardInfo_paddr),
    .io_forwardInfo_raw_data_0(entries_0_io_forwardInfo_raw_data_0),
    .io_forwardInfo_raw_data_1(entries_0_io_forwardInfo_raw_data_1),
    .io_forwardInfo_firstbeat_valid(entries_0_io_forwardInfo_firstbeat_valid),
    .io_forwardInfo_lastbeat_valid(entries_0_io_forwardInfo_lastbeat_valid)
  );
  MissEntry entries_1 ( // @[MissQueue.scala 620:50]
    .clock(entries_1_clock),
    .reset(entries_1_reset),
    .io_id(entries_1_io_id),
    .io_req_valid(entries_1_io_req_valid),
    .io_req_bits_source(entries_1_io_req_bits_source),
    .io_req_bits_cmd(entries_1_io_req_bits_cmd),
    .io_req_bits_addr(entries_1_io_req_bits_addr),
    .io_req_bits_vaddr(entries_1_io_req_bits_vaddr),
    .io_req_bits_way_en(entries_1_io_req_bits_way_en),
    .io_req_bits_word_idx(entries_1_io_req_bits_word_idx),
    .io_req_bits_amo_data(entries_1_io_req_bits_amo_data),
    .io_req_bits_amo_mask(entries_1_io_req_bits_amo_mask),
    .io_req_bits_req_coh_state(entries_1_io_req_bits_req_coh_state),
    .io_req_bits_replace_coh_state(entries_1_io_req_bits_replace_coh_state),
    .io_req_bits_replace_tag(entries_1_io_req_bits_replace_tag),
    .io_req_bits_id(entries_1_io_req_bits_id),
    .io_req_bits_cancel(entries_1_io_req_bits_cancel),
    .io_req_data_store_data(entries_1_io_req_data_store_data),
    .io_req_data_store_mask(entries_1_io_req_data_store_mask),
    .io_primary_valid(entries_1_io_primary_valid),
    .io_primary_ready(entries_1_io_primary_ready),
    .io_secondary_ready(entries_1_io_secondary_ready),
    .io_secondary_reject(entries_1_io_secondary_reject),
    .io_refill_to_ldq_valid(entries_1_io_refill_to_ldq_valid),
    .io_refill_to_ldq_bits_addr(entries_1_io_refill_to_ldq_bits_addr),
    .io_refill_to_ldq_bits_data(entries_1_io_refill_to_ldq_bits_data),
    .io_refill_to_ldq_bits_error(entries_1_io_refill_to_ldq_bits_error),
    .io_refill_to_ldq_bits_data_raw(entries_1_io_refill_to_ldq_bits_data_raw),
    .io_refill_to_ldq_bits_hasdata(entries_1_io_refill_to_ldq_bits_hasdata),
    .io_refill_to_ldq_bits_refill_done(entries_1_io_refill_to_ldq_bits_refill_done),
    .io_refill_to_ldq_bits_id(entries_1_io_refill_to_ldq_bits_id),
    .io_mem_acquire_ready(entries_1_io_mem_acquire_ready),
    .io_mem_acquire_valid(entries_1_io_mem_acquire_valid),
    .io_mem_acquire_bits_param(entries_1_io_mem_acquire_bits_param),
    .io_mem_acquire_bits_source(entries_1_io_mem_acquire_bits_source),
    .io_mem_acquire_bits_address(entries_1_io_mem_acquire_bits_address),
    .io_mem_grant_ready(entries_1_io_mem_grant_ready),
    .io_mem_grant_valid(entries_1_io_mem_grant_valid),
    .io_mem_grant_bits_opcode(entries_1_io_mem_grant_bits_opcode),
    .io_mem_grant_bits_param(entries_1_io_mem_grant_bits_param),
    .io_mem_grant_bits_size(entries_1_io_mem_grant_bits_size),
    .io_mem_grant_bits_sink(entries_1_io_mem_grant_bits_sink),
    .io_mem_grant_bits_denied(entries_1_io_mem_grant_bits_denied),
    .io_mem_grant_bits_echo_blockisdirty(entries_1_io_mem_grant_bits_echo_blockisdirty),
    .io_mem_grant_bits_data(entries_1_io_mem_grant_bits_data),
    .io_mem_grant_bits_corrupt(entries_1_io_mem_grant_bits_corrupt),
    .io_mem_finish_ready(entries_1_io_mem_finish_ready),
    .io_mem_finish_valid(entries_1_io_mem_finish_valid),
    .io_mem_finish_bits_sink(entries_1_io_mem_finish_bits_sink),
    .io_refill_pipe_req_ready(entries_1_io_refill_pipe_req_ready),
    .io_refill_pipe_req_valid(entries_1_io_refill_pipe_req_valid),
    .io_refill_pipe_req_bits_source(entries_1_io_refill_pipe_req_bits_source),
    .io_refill_pipe_req_bits_addr(entries_1_io_refill_pipe_req_bits_addr),
    .io_refill_pipe_req_bits_way_en(entries_1_io_refill_pipe_req_bits_way_en),
    .io_refill_pipe_req_bits_alias(entries_1_io_refill_pipe_req_bits_alias),
    .io_refill_pipe_req_bits_miss_id(entries_1_io_refill_pipe_req_bits_miss_id),
    .io_refill_pipe_req_bits_id(entries_1_io_refill_pipe_req_bits_id),
    .io_refill_pipe_req_bits_error(entries_1_io_refill_pipe_req_bits_error),
    .io_refill_pipe_req_bits_prefetch(entries_1_io_refill_pipe_req_bits_prefetch),
    .io_refill_pipe_req_bits_wmask(entries_1_io_refill_pipe_req_bits_wmask),
    .io_refill_pipe_req_bits_data_0(entries_1_io_refill_pipe_req_bits_data_0),
    .io_refill_pipe_req_bits_data_1(entries_1_io_refill_pipe_req_bits_data_1),
    .io_refill_pipe_req_bits_data_2(entries_1_io_refill_pipe_req_bits_data_2),
    .io_refill_pipe_req_bits_data_3(entries_1_io_refill_pipe_req_bits_data_3),
    .io_refill_pipe_req_bits_data_4(entries_1_io_refill_pipe_req_bits_data_4),
    .io_refill_pipe_req_bits_data_5(entries_1_io_refill_pipe_req_bits_data_5),
    .io_refill_pipe_req_bits_data_6(entries_1_io_refill_pipe_req_bits_data_6),
    .io_refill_pipe_req_bits_data_7(entries_1_io_refill_pipe_req_bits_data_7),
    .io_refill_pipe_req_bits_meta_coh_state(entries_1_io_refill_pipe_req_bits_meta_coh_state),
    .io_refill_pipe_resp(entries_1_io_refill_pipe_resp),
    .io_replace_pipe_req_ready(entries_1_io_replace_pipe_req_ready),
    .io_replace_pipe_req_valid(entries_1_io_replace_pipe_req_valid),
    .io_replace_pipe_req_bits_miss_id(entries_1_io_replace_pipe_req_bits_miss_id),
    .io_replace_pipe_req_bits_vaddr(entries_1_io_replace_pipe_req_bits_vaddr),
    .io_replace_pipe_req_bits_addr(entries_1_io_replace_pipe_req_bits_addr),
    .io_replace_pipe_req_bits_replace_way_en(entries_1_io_replace_pipe_req_bits_replace_way_en),
    .io_replace_pipe_resp(entries_1_io_replace_pipe_resp),
    .io_main_pipe_req_ready(entries_1_io_main_pipe_req_ready),
    .io_main_pipe_req_valid(entries_1_io_main_pipe_req_valid),
    .io_main_pipe_req_bits_miss_id(entries_1_io_main_pipe_req_bits_miss_id),
    .io_main_pipe_req_bits_miss_param(entries_1_io_main_pipe_req_bits_miss_param),
    .io_main_pipe_req_bits_miss_dirty(entries_1_io_main_pipe_req_bits_miss_dirty),
    .io_main_pipe_req_bits_miss_way_en(entries_1_io_main_pipe_req_bits_miss_way_en),
    .io_main_pipe_req_bits_source(entries_1_io_main_pipe_req_bits_source),
    .io_main_pipe_req_bits_cmd(entries_1_io_main_pipe_req_bits_cmd),
    .io_main_pipe_req_bits_vaddr(entries_1_io_main_pipe_req_bits_vaddr),
    .io_main_pipe_req_bits_addr(entries_1_io_main_pipe_req_bits_addr),
    .io_main_pipe_req_bits_store_data(entries_1_io_main_pipe_req_bits_store_data),
    .io_main_pipe_req_bits_word_idx(entries_1_io_main_pipe_req_bits_word_idx),
    .io_main_pipe_req_bits_amo_data(entries_1_io_main_pipe_req_bits_amo_data),
    .io_main_pipe_req_bits_amo_mask(entries_1_io_main_pipe_req_bits_amo_mask),
    .io_main_pipe_req_bits_error(entries_1_io_main_pipe_req_bits_error),
    .io_main_pipe_req_bits_id(entries_1_io_main_pipe_req_bits_id),
    .io_main_pipe_resp(entries_1_io_main_pipe_resp),
    .io_block_addr_valid(entries_1_io_block_addr_valid),
    .io_block_addr_bits(entries_1_io_block_addr_bits),
    .io_req_handled_by_this_entry(entries_1_io_req_handled_by_this_entry),
    .io_forwardInfo_inflight(entries_1_io_forwardInfo_inflight),
    .io_forwardInfo_paddr(entries_1_io_forwardInfo_paddr),
    .io_forwardInfo_raw_data_0(entries_1_io_forwardInfo_raw_data_0),
    .io_forwardInfo_raw_data_1(entries_1_io_forwardInfo_raw_data_1),
    .io_forwardInfo_firstbeat_valid(entries_1_io_forwardInfo_firstbeat_valid),
    .io_forwardInfo_lastbeat_valid(entries_1_io_forwardInfo_lastbeat_valid)
  );
  MissEntry entries_2 ( // @[MissQueue.scala 620:50]
    .clock(entries_2_clock),
    .reset(entries_2_reset),
    .io_id(entries_2_io_id),
    .io_req_valid(entries_2_io_req_valid),
    .io_req_bits_source(entries_2_io_req_bits_source),
    .io_req_bits_cmd(entries_2_io_req_bits_cmd),
    .io_req_bits_addr(entries_2_io_req_bits_addr),
    .io_req_bits_vaddr(entries_2_io_req_bits_vaddr),
    .io_req_bits_way_en(entries_2_io_req_bits_way_en),
    .io_req_bits_word_idx(entries_2_io_req_bits_word_idx),
    .io_req_bits_amo_data(entries_2_io_req_bits_amo_data),
    .io_req_bits_amo_mask(entries_2_io_req_bits_amo_mask),
    .io_req_bits_req_coh_state(entries_2_io_req_bits_req_coh_state),
    .io_req_bits_replace_coh_state(entries_2_io_req_bits_replace_coh_state),
    .io_req_bits_replace_tag(entries_2_io_req_bits_replace_tag),
    .io_req_bits_id(entries_2_io_req_bits_id),
    .io_req_bits_cancel(entries_2_io_req_bits_cancel),
    .io_req_data_store_data(entries_2_io_req_data_store_data),
    .io_req_data_store_mask(entries_2_io_req_data_store_mask),
    .io_primary_valid(entries_2_io_primary_valid),
    .io_primary_ready(entries_2_io_primary_ready),
    .io_secondary_ready(entries_2_io_secondary_ready),
    .io_secondary_reject(entries_2_io_secondary_reject),
    .io_refill_to_ldq_valid(entries_2_io_refill_to_ldq_valid),
    .io_refill_to_ldq_bits_addr(entries_2_io_refill_to_ldq_bits_addr),
    .io_refill_to_ldq_bits_data(entries_2_io_refill_to_ldq_bits_data),
    .io_refill_to_ldq_bits_error(entries_2_io_refill_to_ldq_bits_error),
    .io_refill_to_ldq_bits_data_raw(entries_2_io_refill_to_ldq_bits_data_raw),
    .io_refill_to_ldq_bits_hasdata(entries_2_io_refill_to_ldq_bits_hasdata),
    .io_refill_to_ldq_bits_refill_done(entries_2_io_refill_to_ldq_bits_refill_done),
    .io_refill_to_ldq_bits_id(entries_2_io_refill_to_ldq_bits_id),
    .io_mem_acquire_ready(entries_2_io_mem_acquire_ready),
    .io_mem_acquire_valid(entries_2_io_mem_acquire_valid),
    .io_mem_acquire_bits_param(entries_2_io_mem_acquire_bits_param),
    .io_mem_acquire_bits_source(entries_2_io_mem_acquire_bits_source),
    .io_mem_acquire_bits_address(entries_2_io_mem_acquire_bits_address),
    .io_mem_grant_ready(entries_2_io_mem_grant_ready),
    .io_mem_grant_valid(entries_2_io_mem_grant_valid),
    .io_mem_grant_bits_opcode(entries_2_io_mem_grant_bits_opcode),
    .io_mem_grant_bits_param(entries_2_io_mem_grant_bits_param),
    .io_mem_grant_bits_size(entries_2_io_mem_grant_bits_size),
    .io_mem_grant_bits_sink(entries_2_io_mem_grant_bits_sink),
    .io_mem_grant_bits_denied(entries_2_io_mem_grant_bits_denied),
    .io_mem_grant_bits_echo_blockisdirty(entries_2_io_mem_grant_bits_echo_blockisdirty),
    .io_mem_grant_bits_data(entries_2_io_mem_grant_bits_data),
    .io_mem_grant_bits_corrupt(entries_2_io_mem_grant_bits_corrupt),
    .io_mem_finish_ready(entries_2_io_mem_finish_ready),
    .io_mem_finish_valid(entries_2_io_mem_finish_valid),
    .io_mem_finish_bits_sink(entries_2_io_mem_finish_bits_sink),
    .io_refill_pipe_req_ready(entries_2_io_refill_pipe_req_ready),
    .io_refill_pipe_req_valid(entries_2_io_refill_pipe_req_valid),
    .io_refill_pipe_req_bits_source(entries_2_io_refill_pipe_req_bits_source),
    .io_refill_pipe_req_bits_addr(entries_2_io_refill_pipe_req_bits_addr),
    .io_refill_pipe_req_bits_way_en(entries_2_io_refill_pipe_req_bits_way_en),
    .io_refill_pipe_req_bits_alias(entries_2_io_refill_pipe_req_bits_alias),
    .io_refill_pipe_req_bits_miss_id(entries_2_io_refill_pipe_req_bits_miss_id),
    .io_refill_pipe_req_bits_id(entries_2_io_refill_pipe_req_bits_id),
    .io_refill_pipe_req_bits_error(entries_2_io_refill_pipe_req_bits_error),
    .io_refill_pipe_req_bits_prefetch(entries_2_io_refill_pipe_req_bits_prefetch),
    .io_refill_pipe_req_bits_wmask(entries_2_io_refill_pipe_req_bits_wmask),
    .io_refill_pipe_req_bits_data_0(entries_2_io_refill_pipe_req_bits_data_0),
    .io_refill_pipe_req_bits_data_1(entries_2_io_refill_pipe_req_bits_data_1),
    .io_refill_pipe_req_bits_data_2(entries_2_io_refill_pipe_req_bits_data_2),
    .io_refill_pipe_req_bits_data_3(entries_2_io_refill_pipe_req_bits_data_3),
    .io_refill_pipe_req_bits_data_4(entries_2_io_refill_pipe_req_bits_data_4),
    .io_refill_pipe_req_bits_data_5(entries_2_io_refill_pipe_req_bits_data_5),
    .io_refill_pipe_req_bits_data_6(entries_2_io_refill_pipe_req_bits_data_6),
    .io_refill_pipe_req_bits_data_7(entries_2_io_refill_pipe_req_bits_data_7),
    .io_refill_pipe_req_bits_meta_coh_state(entries_2_io_refill_pipe_req_bits_meta_coh_state),
    .io_refill_pipe_resp(entries_2_io_refill_pipe_resp),
    .io_replace_pipe_req_ready(entries_2_io_replace_pipe_req_ready),
    .io_replace_pipe_req_valid(entries_2_io_replace_pipe_req_valid),
    .io_replace_pipe_req_bits_miss_id(entries_2_io_replace_pipe_req_bits_miss_id),
    .io_replace_pipe_req_bits_vaddr(entries_2_io_replace_pipe_req_bits_vaddr),
    .io_replace_pipe_req_bits_addr(entries_2_io_replace_pipe_req_bits_addr),
    .io_replace_pipe_req_bits_replace_way_en(entries_2_io_replace_pipe_req_bits_replace_way_en),
    .io_replace_pipe_resp(entries_2_io_replace_pipe_resp),
    .io_main_pipe_req_ready(entries_2_io_main_pipe_req_ready),
    .io_main_pipe_req_valid(entries_2_io_main_pipe_req_valid),
    .io_main_pipe_req_bits_miss_id(entries_2_io_main_pipe_req_bits_miss_id),
    .io_main_pipe_req_bits_miss_param(entries_2_io_main_pipe_req_bits_miss_param),
    .io_main_pipe_req_bits_miss_dirty(entries_2_io_main_pipe_req_bits_miss_dirty),
    .io_main_pipe_req_bits_miss_way_en(entries_2_io_main_pipe_req_bits_miss_way_en),
    .io_main_pipe_req_bits_source(entries_2_io_main_pipe_req_bits_source),
    .io_main_pipe_req_bits_cmd(entries_2_io_main_pipe_req_bits_cmd),
    .io_main_pipe_req_bits_vaddr(entries_2_io_main_pipe_req_bits_vaddr),
    .io_main_pipe_req_bits_addr(entries_2_io_main_pipe_req_bits_addr),
    .io_main_pipe_req_bits_store_data(entries_2_io_main_pipe_req_bits_store_data),
    .io_main_pipe_req_bits_word_idx(entries_2_io_main_pipe_req_bits_word_idx),
    .io_main_pipe_req_bits_amo_data(entries_2_io_main_pipe_req_bits_amo_data),
    .io_main_pipe_req_bits_amo_mask(entries_2_io_main_pipe_req_bits_amo_mask),
    .io_main_pipe_req_bits_error(entries_2_io_main_pipe_req_bits_error),
    .io_main_pipe_req_bits_id(entries_2_io_main_pipe_req_bits_id),
    .io_main_pipe_resp(entries_2_io_main_pipe_resp),
    .io_block_addr_valid(entries_2_io_block_addr_valid),
    .io_block_addr_bits(entries_2_io_block_addr_bits),
    .io_req_handled_by_this_entry(entries_2_io_req_handled_by_this_entry),
    .io_forwardInfo_inflight(entries_2_io_forwardInfo_inflight),
    .io_forwardInfo_paddr(entries_2_io_forwardInfo_paddr),
    .io_forwardInfo_raw_data_0(entries_2_io_forwardInfo_raw_data_0),
    .io_forwardInfo_raw_data_1(entries_2_io_forwardInfo_raw_data_1),
    .io_forwardInfo_firstbeat_valid(entries_2_io_forwardInfo_firstbeat_valid),
    .io_forwardInfo_lastbeat_valid(entries_2_io_forwardInfo_lastbeat_valid)
  );
  MissEntry entries_3 ( // @[MissQueue.scala 620:50]
    .clock(entries_3_clock),
    .reset(entries_3_reset),
    .io_id(entries_3_io_id),
    .io_req_valid(entries_3_io_req_valid),
    .io_req_bits_source(entries_3_io_req_bits_source),
    .io_req_bits_cmd(entries_3_io_req_bits_cmd),
    .io_req_bits_addr(entries_3_io_req_bits_addr),
    .io_req_bits_vaddr(entries_3_io_req_bits_vaddr),
    .io_req_bits_way_en(entries_3_io_req_bits_way_en),
    .io_req_bits_word_idx(entries_3_io_req_bits_word_idx),
    .io_req_bits_amo_data(entries_3_io_req_bits_amo_data),
    .io_req_bits_amo_mask(entries_3_io_req_bits_amo_mask),
    .io_req_bits_req_coh_state(entries_3_io_req_bits_req_coh_state),
    .io_req_bits_replace_coh_state(entries_3_io_req_bits_replace_coh_state),
    .io_req_bits_replace_tag(entries_3_io_req_bits_replace_tag),
    .io_req_bits_id(entries_3_io_req_bits_id),
    .io_req_bits_cancel(entries_3_io_req_bits_cancel),
    .io_req_data_store_data(entries_3_io_req_data_store_data),
    .io_req_data_store_mask(entries_3_io_req_data_store_mask),
    .io_primary_valid(entries_3_io_primary_valid),
    .io_primary_ready(entries_3_io_primary_ready),
    .io_secondary_ready(entries_3_io_secondary_ready),
    .io_secondary_reject(entries_3_io_secondary_reject),
    .io_refill_to_ldq_valid(entries_3_io_refill_to_ldq_valid),
    .io_refill_to_ldq_bits_addr(entries_3_io_refill_to_ldq_bits_addr),
    .io_refill_to_ldq_bits_data(entries_3_io_refill_to_ldq_bits_data),
    .io_refill_to_ldq_bits_error(entries_3_io_refill_to_ldq_bits_error),
    .io_refill_to_ldq_bits_data_raw(entries_3_io_refill_to_ldq_bits_data_raw),
    .io_refill_to_ldq_bits_hasdata(entries_3_io_refill_to_ldq_bits_hasdata),
    .io_refill_to_ldq_bits_refill_done(entries_3_io_refill_to_ldq_bits_refill_done),
    .io_refill_to_ldq_bits_id(entries_3_io_refill_to_ldq_bits_id),
    .io_mem_acquire_ready(entries_3_io_mem_acquire_ready),
    .io_mem_acquire_valid(entries_3_io_mem_acquire_valid),
    .io_mem_acquire_bits_param(entries_3_io_mem_acquire_bits_param),
    .io_mem_acquire_bits_source(entries_3_io_mem_acquire_bits_source),
    .io_mem_acquire_bits_address(entries_3_io_mem_acquire_bits_address),
    .io_mem_grant_ready(entries_3_io_mem_grant_ready),
    .io_mem_grant_valid(entries_3_io_mem_grant_valid),
    .io_mem_grant_bits_opcode(entries_3_io_mem_grant_bits_opcode),
    .io_mem_grant_bits_param(entries_3_io_mem_grant_bits_param),
    .io_mem_grant_bits_size(entries_3_io_mem_grant_bits_size),
    .io_mem_grant_bits_sink(entries_3_io_mem_grant_bits_sink),
    .io_mem_grant_bits_denied(entries_3_io_mem_grant_bits_denied),
    .io_mem_grant_bits_echo_blockisdirty(entries_3_io_mem_grant_bits_echo_blockisdirty),
    .io_mem_grant_bits_data(entries_3_io_mem_grant_bits_data),
    .io_mem_grant_bits_corrupt(entries_3_io_mem_grant_bits_corrupt),
    .io_mem_finish_ready(entries_3_io_mem_finish_ready),
    .io_mem_finish_valid(entries_3_io_mem_finish_valid),
    .io_mem_finish_bits_sink(entries_3_io_mem_finish_bits_sink),
    .io_refill_pipe_req_ready(entries_3_io_refill_pipe_req_ready),
    .io_refill_pipe_req_valid(entries_3_io_refill_pipe_req_valid),
    .io_refill_pipe_req_bits_source(entries_3_io_refill_pipe_req_bits_source),
    .io_refill_pipe_req_bits_addr(entries_3_io_refill_pipe_req_bits_addr),
    .io_refill_pipe_req_bits_way_en(entries_3_io_refill_pipe_req_bits_way_en),
    .io_refill_pipe_req_bits_alias(entries_3_io_refill_pipe_req_bits_alias),
    .io_refill_pipe_req_bits_miss_id(entries_3_io_refill_pipe_req_bits_miss_id),
    .io_refill_pipe_req_bits_id(entries_3_io_refill_pipe_req_bits_id),
    .io_refill_pipe_req_bits_error(entries_3_io_refill_pipe_req_bits_error),
    .io_refill_pipe_req_bits_prefetch(entries_3_io_refill_pipe_req_bits_prefetch),
    .io_refill_pipe_req_bits_wmask(entries_3_io_refill_pipe_req_bits_wmask),
    .io_refill_pipe_req_bits_data_0(entries_3_io_refill_pipe_req_bits_data_0),
    .io_refill_pipe_req_bits_data_1(entries_3_io_refill_pipe_req_bits_data_1),
    .io_refill_pipe_req_bits_data_2(entries_3_io_refill_pipe_req_bits_data_2),
    .io_refill_pipe_req_bits_data_3(entries_3_io_refill_pipe_req_bits_data_3),
    .io_refill_pipe_req_bits_data_4(entries_3_io_refill_pipe_req_bits_data_4),
    .io_refill_pipe_req_bits_data_5(entries_3_io_refill_pipe_req_bits_data_5),
    .io_refill_pipe_req_bits_data_6(entries_3_io_refill_pipe_req_bits_data_6),
    .io_refill_pipe_req_bits_data_7(entries_3_io_refill_pipe_req_bits_data_7),
    .io_refill_pipe_req_bits_meta_coh_state(entries_3_io_refill_pipe_req_bits_meta_coh_state),
    .io_refill_pipe_resp(entries_3_io_refill_pipe_resp),
    .io_replace_pipe_req_ready(entries_3_io_replace_pipe_req_ready),
    .io_replace_pipe_req_valid(entries_3_io_replace_pipe_req_valid),
    .io_replace_pipe_req_bits_miss_id(entries_3_io_replace_pipe_req_bits_miss_id),
    .io_replace_pipe_req_bits_vaddr(entries_3_io_replace_pipe_req_bits_vaddr),
    .io_replace_pipe_req_bits_addr(entries_3_io_replace_pipe_req_bits_addr),
    .io_replace_pipe_req_bits_replace_way_en(entries_3_io_replace_pipe_req_bits_replace_way_en),
    .io_replace_pipe_resp(entries_3_io_replace_pipe_resp),
    .io_main_pipe_req_ready(entries_3_io_main_pipe_req_ready),
    .io_main_pipe_req_valid(entries_3_io_main_pipe_req_valid),
    .io_main_pipe_req_bits_miss_id(entries_3_io_main_pipe_req_bits_miss_id),
    .io_main_pipe_req_bits_miss_param(entries_3_io_main_pipe_req_bits_miss_param),
    .io_main_pipe_req_bits_miss_dirty(entries_3_io_main_pipe_req_bits_miss_dirty),
    .io_main_pipe_req_bits_miss_way_en(entries_3_io_main_pipe_req_bits_miss_way_en),
    .io_main_pipe_req_bits_source(entries_3_io_main_pipe_req_bits_source),
    .io_main_pipe_req_bits_cmd(entries_3_io_main_pipe_req_bits_cmd),
    .io_main_pipe_req_bits_vaddr(entries_3_io_main_pipe_req_bits_vaddr),
    .io_main_pipe_req_bits_addr(entries_3_io_main_pipe_req_bits_addr),
    .io_main_pipe_req_bits_store_data(entries_3_io_main_pipe_req_bits_store_data),
    .io_main_pipe_req_bits_word_idx(entries_3_io_main_pipe_req_bits_word_idx),
    .io_main_pipe_req_bits_amo_data(entries_3_io_main_pipe_req_bits_amo_data),
    .io_main_pipe_req_bits_amo_mask(entries_3_io_main_pipe_req_bits_amo_mask),
    .io_main_pipe_req_bits_error(entries_3_io_main_pipe_req_bits_error),
    .io_main_pipe_req_bits_id(entries_3_io_main_pipe_req_bits_id),
    .io_main_pipe_resp(entries_3_io_main_pipe_resp),
    .io_block_addr_valid(entries_3_io_block_addr_valid),
    .io_block_addr_bits(entries_3_io_block_addr_bits),
    .io_req_handled_by_this_entry(entries_3_io_req_handled_by_this_entry),
    .io_forwardInfo_inflight(entries_3_io_forwardInfo_inflight),
    .io_forwardInfo_paddr(entries_3_io_forwardInfo_paddr),
    .io_forwardInfo_raw_data_0(entries_3_io_forwardInfo_raw_data_0),
    .io_forwardInfo_raw_data_1(entries_3_io_forwardInfo_raw_data_1),
    .io_forwardInfo_firstbeat_valid(entries_3_io_forwardInfo_firstbeat_valid),
    .io_forwardInfo_lastbeat_valid(entries_3_io_forwardInfo_lastbeat_valid)
  );
  Arbiter_22 refill_pipe_req_arb ( // @[DCacheWrapper.scala 208:21]
    .io_in_0_ready(refill_pipe_req_arb_io_in_0_ready),
    .io_in_0_valid(refill_pipe_req_arb_io_in_0_valid),
    .io_in_0_bits_source(refill_pipe_req_arb_io_in_0_bits_source),
    .io_in_0_bits_addr(refill_pipe_req_arb_io_in_0_bits_addr),
    .io_in_0_bits_way_en(refill_pipe_req_arb_io_in_0_bits_way_en),
    .io_in_0_bits_alias(refill_pipe_req_arb_io_in_0_bits_alias),
    .io_in_0_bits_miss_id(refill_pipe_req_arb_io_in_0_bits_miss_id),
    .io_in_0_bits_id(refill_pipe_req_arb_io_in_0_bits_id),
    .io_in_0_bits_error(refill_pipe_req_arb_io_in_0_bits_error),
    .io_in_0_bits_prefetch(refill_pipe_req_arb_io_in_0_bits_prefetch),
    .io_in_0_bits_wmask(refill_pipe_req_arb_io_in_0_bits_wmask),
    .io_in_0_bits_data_0(refill_pipe_req_arb_io_in_0_bits_data_0),
    .io_in_0_bits_data_1(refill_pipe_req_arb_io_in_0_bits_data_1),
    .io_in_0_bits_data_2(refill_pipe_req_arb_io_in_0_bits_data_2),
    .io_in_0_bits_data_3(refill_pipe_req_arb_io_in_0_bits_data_3),
    .io_in_0_bits_data_4(refill_pipe_req_arb_io_in_0_bits_data_4),
    .io_in_0_bits_data_5(refill_pipe_req_arb_io_in_0_bits_data_5),
    .io_in_0_bits_data_6(refill_pipe_req_arb_io_in_0_bits_data_6),
    .io_in_0_bits_data_7(refill_pipe_req_arb_io_in_0_bits_data_7),
    .io_in_0_bits_meta_coh_state(refill_pipe_req_arb_io_in_0_bits_meta_coh_state),
    .io_in_1_ready(refill_pipe_req_arb_io_in_1_ready),
    .io_in_1_valid(refill_pipe_req_arb_io_in_1_valid),
    .io_in_1_bits_source(refill_pipe_req_arb_io_in_1_bits_source),
    .io_in_1_bits_addr(refill_pipe_req_arb_io_in_1_bits_addr),
    .io_in_1_bits_way_en(refill_pipe_req_arb_io_in_1_bits_way_en),
    .io_in_1_bits_alias(refill_pipe_req_arb_io_in_1_bits_alias),
    .io_in_1_bits_miss_id(refill_pipe_req_arb_io_in_1_bits_miss_id),
    .io_in_1_bits_id(refill_pipe_req_arb_io_in_1_bits_id),
    .io_in_1_bits_error(refill_pipe_req_arb_io_in_1_bits_error),
    .io_in_1_bits_prefetch(refill_pipe_req_arb_io_in_1_bits_prefetch),
    .io_in_1_bits_wmask(refill_pipe_req_arb_io_in_1_bits_wmask),
    .io_in_1_bits_data_0(refill_pipe_req_arb_io_in_1_bits_data_0),
    .io_in_1_bits_data_1(refill_pipe_req_arb_io_in_1_bits_data_1),
    .io_in_1_bits_data_2(refill_pipe_req_arb_io_in_1_bits_data_2),
    .io_in_1_bits_data_3(refill_pipe_req_arb_io_in_1_bits_data_3),
    .io_in_1_bits_data_4(refill_pipe_req_arb_io_in_1_bits_data_4),
    .io_in_1_bits_data_5(refill_pipe_req_arb_io_in_1_bits_data_5),
    .io_in_1_bits_data_6(refill_pipe_req_arb_io_in_1_bits_data_6),
    .io_in_1_bits_data_7(refill_pipe_req_arb_io_in_1_bits_data_7),
    .io_in_1_bits_meta_coh_state(refill_pipe_req_arb_io_in_1_bits_meta_coh_state),
    .io_in_2_ready(refill_pipe_req_arb_io_in_2_ready),
    .io_in_2_valid(refill_pipe_req_arb_io_in_2_valid),
    .io_in_2_bits_source(refill_pipe_req_arb_io_in_2_bits_source),
    .io_in_2_bits_addr(refill_pipe_req_arb_io_in_2_bits_addr),
    .io_in_2_bits_way_en(refill_pipe_req_arb_io_in_2_bits_way_en),
    .io_in_2_bits_alias(refill_pipe_req_arb_io_in_2_bits_alias),
    .io_in_2_bits_miss_id(refill_pipe_req_arb_io_in_2_bits_miss_id),
    .io_in_2_bits_id(refill_pipe_req_arb_io_in_2_bits_id),
    .io_in_2_bits_error(refill_pipe_req_arb_io_in_2_bits_error),
    .io_in_2_bits_prefetch(refill_pipe_req_arb_io_in_2_bits_prefetch),
    .io_in_2_bits_wmask(refill_pipe_req_arb_io_in_2_bits_wmask),
    .io_in_2_bits_data_0(refill_pipe_req_arb_io_in_2_bits_data_0),
    .io_in_2_bits_data_1(refill_pipe_req_arb_io_in_2_bits_data_1),
    .io_in_2_bits_data_2(refill_pipe_req_arb_io_in_2_bits_data_2),
    .io_in_2_bits_data_3(refill_pipe_req_arb_io_in_2_bits_data_3),
    .io_in_2_bits_data_4(refill_pipe_req_arb_io_in_2_bits_data_4),
    .io_in_2_bits_data_5(refill_pipe_req_arb_io_in_2_bits_data_5),
    .io_in_2_bits_data_6(refill_pipe_req_arb_io_in_2_bits_data_6),
    .io_in_2_bits_data_7(refill_pipe_req_arb_io_in_2_bits_data_7),
    .io_in_2_bits_meta_coh_state(refill_pipe_req_arb_io_in_2_bits_meta_coh_state),
    .io_in_3_ready(refill_pipe_req_arb_io_in_3_ready),
    .io_in_3_valid(refill_pipe_req_arb_io_in_3_valid),
    .io_in_3_bits_source(refill_pipe_req_arb_io_in_3_bits_source),
    .io_in_3_bits_addr(refill_pipe_req_arb_io_in_3_bits_addr),
    .io_in_3_bits_way_en(refill_pipe_req_arb_io_in_3_bits_way_en),
    .io_in_3_bits_alias(refill_pipe_req_arb_io_in_3_bits_alias),
    .io_in_3_bits_miss_id(refill_pipe_req_arb_io_in_3_bits_miss_id),
    .io_in_3_bits_id(refill_pipe_req_arb_io_in_3_bits_id),
    .io_in_3_bits_error(refill_pipe_req_arb_io_in_3_bits_error),
    .io_in_3_bits_prefetch(refill_pipe_req_arb_io_in_3_bits_prefetch),
    .io_in_3_bits_wmask(refill_pipe_req_arb_io_in_3_bits_wmask),
    .io_in_3_bits_data_0(refill_pipe_req_arb_io_in_3_bits_data_0),
    .io_in_3_bits_data_1(refill_pipe_req_arb_io_in_3_bits_data_1),
    .io_in_3_bits_data_2(refill_pipe_req_arb_io_in_3_bits_data_2),
    .io_in_3_bits_data_3(refill_pipe_req_arb_io_in_3_bits_data_3),
    .io_in_3_bits_data_4(refill_pipe_req_arb_io_in_3_bits_data_4),
    .io_in_3_bits_data_5(refill_pipe_req_arb_io_in_3_bits_data_5),
    .io_in_3_bits_data_6(refill_pipe_req_arb_io_in_3_bits_data_6),
    .io_in_3_bits_data_7(refill_pipe_req_arb_io_in_3_bits_data_7),
    .io_in_3_bits_meta_coh_state(refill_pipe_req_arb_io_in_3_bits_meta_coh_state),
    .io_out_ready(refill_pipe_req_arb_io_out_ready),
    .io_out_valid(refill_pipe_req_arb_io_out_valid),
    .io_out_bits_source(refill_pipe_req_arb_io_out_bits_source),
    .io_out_bits_addr(refill_pipe_req_arb_io_out_bits_addr),
    .io_out_bits_way_en(refill_pipe_req_arb_io_out_bits_way_en),
    .io_out_bits_alias(refill_pipe_req_arb_io_out_bits_alias),
    .io_out_bits_miss_id(refill_pipe_req_arb_io_out_bits_miss_id),
    .io_out_bits_id(refill_pipe_req_arb_io_out_bits_id),
    .io_out_bits_error(refill_pipe_req_arb_io_out_bits_error),
    .io_out_bits_prefetch(refill_pipe_req_arb_io_out_bits_prefetch),
    .io_out_bits_wmask(refill_pipe_req_arb_io_out_bits_wmask),
    .io_out_bits_data_0(refill_pipe_req_arb_io_out_bits_data_0),
    .io_out_bits_data_1(refill_pipe_req_arb_io_out_bits_data_1),
    .io_out_bits_data_2(refill_pipe_req_arb_io_out_bits_data_2),
    .io_out_bits_data_3(refill_pipe_req_arb_io_out_bits_data_3),
    .io_out_bits_data_4(refill_pipe_req_arb_io_out_bits_data_4),
    .io_out_bits_data_5(refill_pipe_req_arb_io_out_bits_data_5),
    .io_out_bits_data_6(refill_pipe_req_arb_io_out_bits_data_6),
    .io_out_bits_data_7(refill_pipe_req_arb_io_out_bits_data_7),
    .io_out_bits_meta_coh_state(refill_pipe_req_arb_io_out_bits_meta_coh_state)
  );
  PipelineRegModule pipelineReg ( // @[MemCommon.scala 396:29]
    .clock(pipelineReg_clock),
    .reset(pipelineReg_reset),
    .io_in_ready(pipelineReg_io_in_ready),
    .io_in_valid(pipelineReg_io_in_valid),
    .io_in_bits_addr(pipelineReg_io_in_bits_addr),
    .io_in_bits_way_en(pipelineReg_io_in_bits_way_en),
    .io_in_bits_alias(pipelineReg_io_in_bits_alias),
    .io_out_ready(pipelineReg_io_out_ready),
    .io_out_valid(pipelineReg_io_out_valid),
    .io_out_bits_addr(pipelineReg_io_out_bits_addr),
    .io_out_bits_way_en(pipelineReg_io_out_bits_way_en),
    .io_out_bits_alias(pipelineReg_io_out_bits_alias)
  );
  PipelineRegModule pipelineReg_1 ( // @[MemCommon.scala 396:29]
    .clock(pipelineReg_1_clock),
    .reset(pipelineReg_1_reset),
    .io_in_ready(pipelineReg_1_io_in_ready),
    .io_in_valid(pipelineReg_1_io_in_valid),
    .io_in_bits_addr(pipelineReg_1_io_in_bits_addr),
    .io_in_bits_way_en(pipelineReg_1_io_in_bits_way_en),
    .io_in_bits_alias(pipelineReg_1_io_in_bits_alias),
    .io_out_ready(pipelineReg_1_io_out_ready),
    .io_out_valid(pipelineReg_1_io_out_valid),
    .io_out_bits_addr(pipelineReg_1_io_out_bits_addr),
    .io_out_bits_way_en(pipelineReg_1_io_out_bits_way_en),
    .io_out_bits_alias(pipelineReg_1_io_out_bits_alias)
  );
  PipelineRegModule pipelineReg_2 ( // @[MemCommon.scala 396:29]
    .clock(pipelineReg_2_clock),
    .reset(pipelineReg_2_reset),
    .io_in_ready(pipelineReg_2_io_in_ready),
    .io_in_valid(pipelineReg_2_io_in_valid),
    .io_in_bits_addr(pipelineReg_2_io_in_bits_addr),
    .io_in_bits_way_en(pipelineReg_2_io_in_bits_way_en),
    .io_in_bits_alias(pipelineReg_2_io_in_bits_alias),
    .io_out_ready(pipelineReg_2_io_out_ready),
    .io_out_valid(pipelineReg_2_io_out_valid),
    .io_out_bits_addr(pipelineReg_2_io_out_bits_addr),
    .io_out_bits_way_en(pipelineReg_2_io_out_bits_way_en),
    .io_out_bits_alias(pipelineReg_2_io_out_bits_alias)
  );
  PipelineRegModule pipelineReg_3 ( // @[MemCommon.scala 396:29]
    .clock(pipelineReg_3_clock),
    .reset(pipelineReg_3_reset),
    .io_in_ready(pipelineReg_3_io_in_ready),
    .io_in_valid(pipelineReg_3_io_in_valid),
    .io_in_bits_addr(pipelineReg_3_io_in_bits_addr),
    .io_in_bits_way_en(pipelineReg_3_io_in_bits_way_en),
    .io_in_bits_alias(pipelineReg_3_io_in_bits_alias),
    .io_out_ready(pipelineReg_3_io_out_ready),
    .io_out_valid(pipelineReg_3_io_out_valid),
    .io_out_bits_addr(pipelineReg_3_io_out_bits_addr),
    .io_out_bits_way_en(pipelineReg_3_io_out_bits_way_en),
    .io_out_bits_alias(pipelineReg_3_io_out_bits_alias)
  );
  PipelineRegModule pipelineReg_4 ( // @[MemCommon.scala 396:29]
    .clock(pipelineReg_4_clock),
    .reset(pipelineReg_4_reset),
    .io_in_ready(pipelineReg_4_io_in_ready),
    .io_in_valid(pipelineReg_4_io_in_valid),
    .io_in_bits_addr(pipelineReg_4_io_in_bits_addr),
    .io_in_bits_way_en(pipelineReg_4_io_in_bits_way_en),
    .io_in_bits_alias(pipelineReg_4_io_in_bits_alias),
    .io_out_ready(pipelineReg_4_io_out_ready),
    .io_out_valid(pipelineReg_4_io_out_valid),
    .io_out_bits_addr(pipelineReg_4_io_out_bits_addr),
    .io_out_bits_way_en(pipelineReg_4_io_out_bits_way_en),
    .io_out_bits_alias(pipelineReg_4_io_out_bits_alias)
  );
  PipelineRegModule pipelineReg_5 ( // @[MemCommon.scala 396:29]
    .clock(pipelineReg_5_clock),
    .reset(pipelineReg_5_reset),
    .io_in_ready(pipelineReg_5_io_in_ready),
    .io_in_valid(pipelineReg_5_io_in_valid),
    .io_in_bits_addr(pipelineReg_5_io_in_bits_addr),
    .io_in_bits_way_en(pipelineReg_5_io_in_bits_way_en),
    .io_in_bits_alias(pipelineReg_5_io_in_bits_alias),
    .io_out_ready(pipelineReg_5_io_out_ready),
    .io_out_valid(pipelineReg_5_io_out_valid),
    .io_out_bits_addr(pipelineReg_5_io_out_bits_addr),
    .io_out_bits_way_en(pipelineReg_5_io_out_bits_way_en),
    .io_out_bits_alias(pipelineReg_5_io_out_bits_alias)
  );
  PipelineRegModule pipelineReg_6 ( // @[MemCommon.scala 396:29]
    .clock(pipelineReg_6_clock),
    .reset(pipelineReg_6_reset),
    .io_in_ready(pipelineReg_6_io_in_ready),
    .io_in_valid(pipelineReg_6_io_in_valid),
    .io_in_bits_addr(pipelineReg_6_io_in_bits_addr),
    .io_in_bits_way_en(pipelineReg_6_io_in_bits_way_en),
    .io_in_bits_alias(pipelineReg_6_io_in_bits_alias),
    .io_out_ready(pipelineReg_6_io_out_ready),
    .io_out_valid(pipelineReg_6_io_out_valid),
    .io_out_bits_addr(pipelineReg_6_io_out_bits_addr),
    .io_out_bits_way_en(pipelineReg_6_io_out_bits_way_en),
    .io_out_bits_alias(pipelineReg_6_io_out_bits_alias)
  );
  PipelineRegModule pipelineReg_7 ( // @[MemCommon.scala 396:29]
    .clock(pipelineReg_7_clock),
    .reset(pipelineReg_7_reset),
    .io_in_ready(pipelineReg_7_io_in_ready),
    .io_in_valid(pipelineReg_7_io_in_valid),
    .io_in_bits_addr(pipelineReg_7_io_in_bits_addr),
    .io_in_bits_way_en(pipelineReg_7_io_in_bits_way_en),
    .io_in_bits_alias(pipelineReg_7_io_in_bits_alias),
    .io_out_ready(pipelineReg_7_io_out_ready),
    .io_out_valid(pipelineReg_7_io_out_valid),
    .io_out_bits_addr(pipelineReg_7_io_out_bits_addr),
    .io_out_bits_way_en(pipelineReg_7_io_out_bits_way_en),
    .io_out_bits_alias(pipelineReg_7_io_out_bits_alias)
  );
  PipelineRegModule pipelineReg_8 ( // @[MemCommon.scala 396:29]
    .clock(pipelineReg_8_clock),
    .reset(pipelineReg_8_reset),
    .io_in_ready(pipelineReg_8_io_in_ready),
    .io_in_valid(pipelineReg_8_io_in_valid),
    .io_in_bits_addr(pipelineReg_8_io_in_bits_addr),
    .io_in_bits_way_en(pipelineReg_8_io_in_bits_way_en),
    .io_in_bits_alias(pipelineReg_8_io_in_bits_alias),
    .io_out_ready(pipelineReg_8_io_out_ready),
    .io_out_valid(pipelineReg_8_io_out_valid),
    .io_out_bits_addr(pipelineReg_8_io_out_bits_addr),
    .io_out_bits_way_en(pipelineReg_8_io_out_bits_way_en),
    .io_out_bits_alias(pipelineReg_8_io_out_bits_alias)
  );
  PipelineRegModule pipelineReg_9 ( // @[MemCommon.scala 396:29]
    .clock(pipelineReg_9_clock),
    .reset(pipelineReg_9_reset),
    .io_in_ready(pipelineReg_9_io_in_ready),
    .io_in_valid(pipelineReg_9_io_in_valid),
    .io_in_bits_addr(pipelineReg_9_io_in_bits_addr),
    .io_in_bits_way_en(pipelineReg_9_io_in_bits_way_en),
    .io_in_bits_alias(pipelineReg_9_io_in_bits_alias),
    .io_out_ready(pipelineReg_9_io_out_ready),
    .io_out_valid(pipelineReg_9_io_out_valid),
    .io_out_bits_addr(pipelineReg_9_io_out_bits_addr),
    .io_out_bits_way_en(pipelineReg_9_io_out_bits_way_en),
    .io_out_bits_alias(pipelineReg_9_io_out_bits_alias)
  );
  PipelineRegModule pipelineReg_10 ( // @[MemCommon.scala 396:29]
    .clock(pipelineReg_10_clock),
    .reset(pipelineReg_10_reset),
    .io_in_ready(pipelineReg_10_io_in_ready),
    .io_in_valid(pipelineReg_10_io_in_valid),
    .io_in_bits_addr(pipelineReg_10_io_in_bits_addr),
    .io_in_bits_way_en(pipelineReg_10_io_in_bits_way_en),
    .io_in_bits_alias(pipelineReg_10_io_in_bits_alias),
    .io_out_ready(pipelineReg_10_io_out_ready),
    .io_out_valid(pipelineReg_10_io_out_valid),
    .io_out_bits_addr(pipelineReg_10_io_out_bits_addr),
    .io_out_bits_way_en(pipelineReg_10_io_out_bits_way_en),
    .io_out_bits_alias(pipelineReg_10_io_out_bits_alias)
  );
  PipelineRegModule pipelineReg_11 ( // @[MemCommon.scala 396:29]
    .clock(pipelineReg_11_clock),
    .reset(pipelineReg_11_reset),
    .io_in_ready(pipelineReg_11_io_in_ready),
    .io_in_valid(pipelineReg_11_io_in_valid),
    .io_in_bits_addr(pipelineReg_11_io_in_bits_addr),
    .io_in_bits_way_en(pipelineReg_11_io_in_bits_way_en),
    .io_in_bits_alias(pipelineReg_11_io_in_bits_alias),
    .io_out_ready(pipelineReg_11_io_out_ready),
    .io_out_valid(pipelineReg_11_io_out_valid),
    .io_out_bits_addr(pipelineReg_11_io_out_bits_addr),
    .io_out_bits_way_en(pipelineReg_11_io_out_bits_way_en),
    .io_out_bits_alias(pipelineReg_11_io_out_bits_alias)
  );
  PipelineRegModule pipelineReg_12 ( // @[MemCommon.scala 396:29]
    .clock(pipelineReg_12_clock),
    .reset(pipelineReg_12_reset),
    .io_in_ready(pipelineReg_12_io_in_ready),
    .io_in_valid(pipelineReg_12_io_in_valid),
    .io_in_bits_addr(pipelineReg_12_io_in_bits_addr),
    .io_in_bits_way_en(pipelineReg_12_io_in_bits_way_en),
    .io_in_bits_alias(pipelineReg_12_io_in_bits_alias),
    .io_out_ready(pipelineReg_12_io_out_ready),
    .io_out_valid(pipelineReg_12_io_out_valid),
    .io_out_bits_addr(pipelineReg_12_io_out_bits_addr),
    .io_out_bits_way_en(pipelineReg_12_io_out_bits_way_en),
    .io_out_bits_alias(pipelineReg_12_io_out_bits_alias)
  );
  PipelineRegModule pipelineReg_13 ( // @[MemCommon.scala 396:29]
    .clock(pipelineReg_13_clock),
    .reset(pipelineReg_13_reset),
    .io_in_ready(pipelineReg_13_io_in_ready),
    .io_in_valid(pipelineReg_13_io_in_valid),
    .io_in_bits_addr(pipelineReg_13_io_in_bits_addr),
    .io_in_bits_way_en(pipelineReg_13_io_in_bits_way_en),
    .io_in_bits_alias(pipelineReg_13_io_in_bits_alias),
    .io_out_ready(pipelineReg_13_io_out_ready),
    .io_out_valid(pipelineReg_13_io_out_valid),
    .io_out_bits_addr(pipelineReg_13_io_out_bits_addr),
    .io_out_bits_way_en(pipelineReg_13_io_out_bits_way_en),
    .io_out_bits_alias(pipelineReg_13_io_out_bits_alias)
  );
  PipelineRegModule pipelineReg_14 ( // @[MemCommon.scala 396:29]
    .clock(pipelineReg_14_clock),
    .reset(pipelineReg_14_reset),
    .io_in_ready(pipelineReg_14_io_in_ready),
    .io_in_valid(pipelineReg_14_io_in_valid),
    .io_in_bits_addr(pipelineReg_14_io_in_bits_addr),
    .io_in_bits_way_en(pipelineReg_14_io_in_bits_way_en),
    .io_in_bits_alias(pipelineReg_14_io_in_bits_alias),
    .io_out_ready(pipelineReg_14_io_out_ready),
    .io_out_valid(pipelineReg_14_io_out_valid),
    .io_out_bits_addr(pipelineReg_14_io_out_bits_addr),
    .io_out_bits_way_en(pipelineReg_14_io_out_bits_way_en),
    .io_out_bits_alias(pipelineReg_14_io_out_bits_alias)
  );
  PipelineRegModule pipelineReg_15 ( // @[MemCommon.scala 396:29]
    .clock(pipelineReg_15_clock),
    .reset(pipelineReg_15_reset),
    .io_in_ready(pipelineReg_15_io_in_ready),
    .io_in_valid(pipelineReg_15_io_in_valid),
    .io_in_bits_addr(pipelineReg_15_io_in_bits_addr),
    .io_in_bits_way_en(pipelineReg_15_io_in_bits_way_en),
    .io_in_bits_alias(pipelineReg_15_io_in_bits_alias),
    .io_out_ready(pipelineReg_15_io_out_ready),
    .io_out_valid(pipelineReg_15_io_out_valid),
    .io_out_bits_addr(pipelineReg_15_io_out_bits_addr),
    .io_out_bits_way_en(pipelineReg_15_io_out_bits_way_en),
    .io_out_bits_alias(pipelineReg_15_io_out_bits_alias)
  );
  PipelineRegModule pipelineReg_16 ( // @[MemCommon.scala 396:29]
    .clock(pipelineReg_16_clock),
    .reset(pipelineReg_16_reset),
    .io_in_ready(pipelineReg_16_io_in_ready),
    .io_in_valid(pipelineReg_16_io_in_valid),
    .io_in_bits_addr(pipelineReg_16_io_in_bits_addr),
    .io_in_bits_way_en(pipelineReg_16_io_in_bits_way_en),
    .io_in_bits_alias(pipelineReg_16_io_in_bits_alias),
    .io_out_ready(pipelineReg_16_io_out_ready),
    .io_out_valid(pipelineReg_16_io_out_valid),
    .io_out_bits_addr(pipelineReg_16_io_out_bits_addr),
    .io_out_bits_way_en(pipelineReg_16_io_out_bits_way_en),
    .io_out_bits_alias(pipelineReg_16_io_out_bits_alias)
  );
  PipelineRegModule pipelineReg_17 ( // @[MemCommon.scala 396:29]
    .clock(pipelineReg_17_clock),
    .reset(pipelineReg_17_reset),
    .io_in_ready(pipelineReg_17_io_in_ready),
    .io_in_valid(pipelineReg_17_io_in_valid),
    .io_in_bits_addr(pipelineReg_17_io_in_bits_addr),
    .io_in_bits_way_en(pipelineReg_17_io_in_bits_way_en),
    .io_in_bits_alias(pipelineReg_17_io_in_bits_alias),
    .io_out_ready(pipelineReg_17_io_out_ready),
    .io_out_valid(pipelineReg_17_io_out_valid),
    .io_out_bits_addr(pipelineReg_17_io_out_bits_addr),
    .io_out_bits_way_en(pipelineReg_17_io_out_bits_way_en),
    .io_out_bits_alias(pipelineReg_17_io_out_bits_alias)
  );
  PipelineRegModule pipelineReg_18 ( // @[MemCommon.scala 396:29]
    .clock(pipelineReg_18_clock),
    .reset(pipelineReg_18_reset),
    .io_in_ready(pipelineReg_18_io_in_ready),
    .io_in_valid(pipelineReg_18_io_in_valid),
    .io_in_bits_addr(pipelineReg_18_io_in_bits_addr),
    .io_in_bits_way_en(pipelineReg_18_io_in_bits_way_en),
    .io_in_bits_alias(pipelineReg_18_io_in_bits_alias),
    .io_out_ready(pipelineReg_18_io_out_ready),
    .io_out_valid(pipelineReg_18_io_out_valid),
    .io_out_bits_addr(pipelineReg_18_io_out_bits_addr),
    .io_out_bits_way_en(pipelineReg_18_io_out_bits_way_en),
    .io_out_bits_alias(pipelineReg_18_io_out_bits_alias)
  );
  PipelineRegModule pipelineReg_19 ( // @[MemCommon.scala 396:29]
    .clock(pipelineReg_19_clock),
    .reset(pipelineReg_19_reset),
    .io_in_ready(pipelineReg_19_io_in_ready),
    .io_in_valid(pipelineReg_19_io_in_valid),
    .io_in_bits_addr(pipelineReg_19_io_in_bits_addr),
    .io_in_bits_way_en(pipelineReg_19_io_in_bits_way_en),
    .io_in_bits_alias(pipelineReg_19_io_in_bits_alias),
    .io_out_ready(pipelineReg_19_io_out_ready),
    .io_out_valid(pipelineReg_19_io_out_valid),
    .io_out_bits_addr(pipelineReg_19_io_out_bits_addr),
    .io_out_bits_way_en(pipelineReg_19_io_out_bits_way_en),
    .io_out_bits_alias(pipelineReg_19_io_out_bits_alias)
  );
  PipelineRegModule pipelineReg_20 ( // @[MemCommon.scala 396:29]
    .clock(pipelineReg_20_clock),
    .reset(pipelineReg_20_reset),
    .io_in_ready(pipelineReg_20_io_in_ready),
    .io_in_valid(pipelineReg_20_io_in_valid),
    .io_in_bits_addr(pipelineReg_20_io_in_bits_addr),
    .io_in_bits_way_en(pipelineReg_20_io_in_bits_way_en),
    .io_in_bits_alias(pipelineReg_20_io_in_bits_alias),
    .io_out_ready(pipelineReg_20_io_out_ready),
    .io_out_valid(pipelineReg_20_io_out_valid),
    .io_out_bits_addr(pipelineReg_20_io_out_bits_addr),
    .io_out_bits_way_en(pipelineReg_20_io_out_bits_way_en),
    .io_out_bits_alias(pipelineReg_20_io_out_bits_alias)
  );
  PipelineRegModule pipelineReg_21 ( // @[MemCommon.scala 396:29]
    .clock(pipelineReg_21_clock),
    .reset(pipelineReg_21_reset),
    .io_in_ready(pipelineReg_21_io_in_ready),
    .io_in_valid(pipelineReg_21_io_in_valid),
    .io_in_bits_addr(pipelineReg_21_io_in_bits_addr),
    .io_in_bits_way_en(pipelineReg_21_io_in_bits_way_en),
    .io_in_bits_alias(pipelineReg_21_io_in_bits_alias),
    .io_out_ready(pipelineReg_21_io_out_ready),
    .io_out_valid(pipelineReg_21_io_out_valid),
    .io_out_bits_addr(pipelineReg_21_io_out_bits_addr),
    .io_out_bits_way_en(pipelineReg_21_io_out_bits_way_en),
    .io_out_bits_alias(pipelineReg_21_io_out_bits_alias)
  );
  PipelineRegModule pipelineReg_22 ( // @[MemCommon.scala 396:29]
    .clock(pipelineReg_22_clock),
    .reset(pipelineReg_22_reset),
    .io_in_ready(pipelineReg_22_io_in_ready),
    .io_in_valid(pipelineReg_22_io_in_valid),
    .io_in_bits_addr(pipelineReg_22_io_in_bits_addr),
    .io_in_bits_way_en(pipelineReg_22_io_in_bits_way_en),
    .io_in_bits_alias(pipelineReg_22_io_in_bits_alias),
    .io_out_ready(pipelineReg_22_io_out_ready),
    .io_out_valid(pipelineReg_22_io_out_valid),
    .io_out_bits_addr(pipelineReg_22_io_out_bits_addr),
    .io_out_bits_way_en(pipelineReg_22_io_out_bits_way_en),
    .io_out_bits_alias(pipelineReg_22_io_out_bits_alias)
  );
  PipelineRegModule pipelineReg_23 ( // @[MemCommon.scala 396:29]
    .clock(pipelineReg_23_clock),
    .reset(pipelineReg_23_reset),
    .io_in_ready(pipelineReg_23_io_in_ready),
    .io_in_valid(pipelineReg_23_io_in_valid),
    .io_in_bits_addr(pipelineReg_23_io_in_bits_addr),
    .io_in_bits_way_en(pipelineReg_23_io_in_bits_way_en),
    .io_in_bits_alias(pipelineReg_23_io_in_bits_alias),
    .io_out_ready(pipelineReg_23_io_out_ready),
    .io_out_valid(pipelineReg_23_io_out_valid),
    .io_out_bits_addr(pipelineReg_23_io_out_bits_addr),
    .io_out_bits_way_en(pipelineReg_23_io_out_bits_way_en),
    .io_out_bits_alias(pipelineReg_23_io_out_bits_alias)
  );
  PipelineRegModule_24 pipelineReg_24 ( // @[MemCommon.scala 396:29]
    .clock(pipelineReg_24_clock),
    .reset(pipelineReg_24_reset),
    .io_in_ready(pipelineReg_24_io_in_ready),
    .io_in_valid(pipelineReg_24_io_in_valid),
    .io_in_bits_source(pipelineReg_24_io_in_bits_source),
    .io_in_bits_addr(pipelineReg_24_io_in_bits_addr),
    .io_in_bits_way_en(pipelineReg_24_io_in_bits_way_en),
    .io_in_bits_alias(pipelineReg_24_io_in_bits_alias),
    .io_in_bits_miss_id(pipelineReg_24_io_in_bits_miss_id),
    .io_in_bits_id(pipelineReg_24_io_in_bits_id),
    .io_in_bits_error(pipelineReg_24_io_in_bits_error),
    .io_in_bits_prefetch(pipelineReg_24_io_in_bits_prefetch),
    .io_in_bits_wmask(pipelineReg_24_io_in_bits_wmask),
    .io_in_bits_data_0(pipelineReg_24_io_in_bits_data_0),
    .io_in_bits_data_1(pipelineReg_24_io_in_bits_data_1),
    .io_in_bits_data_2(pipelineReg_24_io_in_bits_data_2),
    .io_in_bits_data_3(pipelineReg_24_io_in_bits_data_3),
    .io_in_bits_data_4(pipelineReg_24_io_in_bits_data_4),
    .io_in_bits_data_5(pipelineReg_24_io_in_bits_data_5),
    .io_in_bits_data_6(pipelineReg_24_io_in_bits_data_6),
    .io_in_bits_data_7(pipelineReg_24_io_in_bits_data_7),
    .io_in_bits_meta_coh_state(pipelineReg_24_io_in_bits_meta_coh_state),
    .io_out_ready(pipelineReg_24_io_out_ready),
    .io_out_valid(pipelineReg_24_io_out_valid),
    .io_out_bits_source(pipelineReg_24_io_out_bits_source),
    .io_out_bits_addr(pipelineReg_24_io_out_bits_addr),
    .io_out_bits_way_en(pipelineReg_24_io_out_bits_way_en),
    .io_out_bits_alias(pipelineReg_24_io_out_bits_alias),
    .io_out_bits_miss_id(pipelineReg_24_io_out_bits_miss_id),
    .io_out_bits_id(pipelineReg_24_io_out_bits_id),
    .io_out_bits_error(pipelineReg_24_io_out_bits_error),
    .io_out_bits_prefetch(pipelineReg_24_io_out_bits_prefetch),
    .io_out_bits_wmask(pipelineReg_24_io_out_bits_wmask),
    .io_out_bits_data_0(pipelineReg_24_io_out_bits_data_0),
    .io_out_bits_data_1(pipelineReg_24_io_out_bits_data_1),
    .io_out_bits_data_2(pipelineReg_24_io_out_bits_data_2),
    .io_out_bits_data_3(pipelineReg_24_io_out_bits_data_3),
    .io_out_bits_data_4(pipelineReg_24_io_out_bits_data_4),
    .io_out_bits_data_5(pipelineReg_24_io_out_bits_data_5),
    .io_out_bits_data_6(pipelineReg_24_io_out_bits_data_6),
    .io_out_bits_data_7(pipelineReg_24_io_out_bits_data_7),
    .io_out_bits_meta_coh_state(pipelineReg_24_io_out_bits_meta_coh_state)
  );
  Arbiter_21 replace_pipe_req_arb ( // @[DCacheWrapper.scala 220:21]
    .io_in_0_ready(replace_pipe_req_arb_io_in_0_ready),
    .io_in_0_valid(replace_pipe_req_arb_io_in_0_valid),
    .io_in_0_bits_miss(replace_pipe_req_arb_io_in_0_bits_miss),
    .io_in_0_bits_miss_id(replace_pipe_req_arb_io_in_0_bits_miss_id),
    .io_in_0_bits_miss_param(replace_pipe_req_arb_io_in_0_bits_miss_param),
    .io_in_0_bits_miss_dirty(replace_pipe_req_arb_io_in_0_bits_miss_dirty),
    .io_in_0_bits_miss_way_en(replace_pipe_req_arb_io_in_0_bits_miss_way_en),
    .io_in_0_bits_probe(replace_pipe_req_arb_io_in_0_bits_probe),
    .io_in_0_bits_probe_param(replace_pipe_req_arb_io_in_0_bits_probe_param),
    .io_in_0_bits_probe_need_data(replace_pipe_req_arb_io_in_0_bits_probe_need_data),
    .io_in_0_bits_source(replace_pipe_req_arb_io_in_0_bits_source),
    .io_in_0_bits_cmd(replace_pipe_req_arb_io_in_0_bits_cmd),
    .io_in_0_bits_vaddr(replace_pipe_req_arb_io_in_0_bits_vaddr),
    .io_in_0_bits_addr(replace_pipe_req_arb_io_in_0_bits_addr),
    .io_in_0_bits_store_data(replace_pipe_req_arb_io_in_0_bits_store_data),
    .io_in_0_bits_store_mask(replace_pipe_req_arb_io_in_0_bits_store_mask),
    .io_in_0_bits_word_idx(replace_pipe_req_arb_io_in_0_bits_word_idx),
    .io_in_0_bits_amo_data(replace_pipe_req_arb_io_in_0_bits_amo_data),
    .io_in_0_bits_amo_mask(replace_pipe_req_arb_io_in_0_bits_amo_mask),
    .io_in_0_bits_error(replace_pipe_req_arb_io_in_0_bits_error),
    .io_in_0_bits_replace(replace_pipe_req_arb_io_in_0_bits_replace),
    .io_in_0_bits_replace_way_en(replace_pipe_req_arb_io_in_0_bits_replace_way_en),
    .io_in_0_bits_id(replace_pipe_req_arb_io_in_0_bits_id),
    .io_in_1_ready(replace_pipe_req_arb_io_in_1_ready),
    .io_in_1_valid(replace_pipe_req_arb_io_in_1_valid),
    .io_in_1_bits_miss(replace_pipe_req_arb_io_in_1_bits_miss),
    .io_in_1_bits_miss_id(replace_pipe_req_arb_io_in_1_bits_miss_id),
    .io_in_1_bits_miss_param(replace_pipe_req_arb_io_in_1_bits_miss_param),
    .io_in_1_bits_miss_dirty(replace_pipe_req_arb_io_in_1_bits_miss_dirty),
    .io_in_1_bits_miss_way_en(replace_pipe_req_arb_io_in_1_bits_miss_way_en),
    .io_in_1_bits_probe(replace_pipe_req_arb_io_in_1_bits_probe),
    .io_in_1_bits_probe_param(replace_pipe_req_arb_io_in_1_bits_probe_param),
    .io_in_1_bits_probe_need_data(replace_pipe_req_arb_io_in_1_bits_probe_need_data),
    .io_in_1_bits_source(replace_pipe_req_arb_io_in_1_bits_source),
    .io_in_1_bits_cmd(replace_pipe_req_arb_io_in_1_bits_cmd),
    .io_in_1_bits_vaddr(replace_pipe_req_arb_io_in_1_bits_vaddr),
    .io_in_1_bits_addr(replace_pipe_req_arb_io_in_1_bits_addr),
    .io_in_1_bits_store_data(replace_pipe_req_arb_io_in_1_bits_store_data),
    .io_in_1_bits_store_mask(replace_pipe_req_arb_io_in_1_bits_store_mask),
    .io_in_1_bits_word_idx(replace_pipe_req_arb_io_in_1_bits_word_idx),
    .io_in_1_bits_amo_data(replace_pipe_req_arb_io_in_1_bits_amo_data),
    .io_in_1_bits_amo_mask(replace_pipe_req_arb_io_in_1_bits_amo_mask),
    .io_in_1_bits_error(replace_pipe_req_arb_io_in_1_bits_error),
    .io_in_1_bits_replace(replace_pipe_req_arb_io_in_1_bits_replace),
    .io_in_1_bits_replace_way_en(replace_pipe_req_arb_io_in_1_bits_replace_way_en),
    .io_in_1_bits_id(replace_pipe_req_arb_io_in_1_bits_id),
    .io_in_2_ready(replace_pipe_req_arb_io_in_2_ready),
    .io_in_2_valid(replace_pipe_req_arb_io_in_2_valid),
    .io_in_2_bits_miss_id(replace_pipe_req_arb_io_in_2_bits_miss_id),
    .io_in_2_bits_probe(replace_pipe_req_arb_io_in_2_bits_probe),
    .io_in_2_bits_probe_param(replace_pipe_req_arb_io_in_2_bits_probe_param),
    .io_in_2_bits_probe_need_data(replace_pipe_req_arb_io_in_2_bits_probe_need_data),
    .io_in_2_bits_source(replace_pipe_req_arb_io_in_2_bits_source),
    .io_in_2_bits_cmd(replace_pipe_req_arb_io_in_2_bits_cmd),
    .io_in_2_bits_vaddr(replace_pipe_req_arb_io_in_2_bits_vaddr),
    .io_in_2_bits_addr(replace_pipe_req_arb_io_in_2_bits_addr),
    .io_in_2_bits_store_data(replace_pipe_req_arb_io_in_2_bits_store_data),
    .io_in_2_bits_store_mask(replace_pipe_req_arb_io_in_2_bits_store_mask),
    .io_in_2_bits_replace(replace_pipe_req_arb_io_in_2_bits_replace),
    .io_in_2_bits_replace_way_en(replace_pipe_req_arb_io_in_2_bits_replace_way_en),
    .io_in_2_bits_id(replace_pipe_req_arb_io_in_2_bits_id),
    .io_in_3_ready(replace_pipe_req_arb_io_in_3_ready),
    .io_in_3_valid(replace_pipe_req_arb_io_in_3_valid),
    .io_in_3_bits_miss(replace_pipe_req_arb_io_in_3_bits_miss),
    .io_in_3_bits_miss_id(replace_pipe_req_arb_io_in_3_bits_miss_id),
    .io_in_3_bits_miss_param(replace_pipe_req_arb_io_in_3_bits_miss_param),
    .io_in_3_bits_miss_dirty(replace_pipe_req_arb_io_in_3_bits_miss_dirty),
    .io_in_3_bits_miss_way_en(replace_pipe_req_arb_io_in_3_bits_miss_way_en),
    .io_in_3_bits_probe(replace_pipe_req_arb_io_in_3_bits_probe),
    .io_in_3_bits_probe_param(replace_pipe_req_arb_io_in_3_bits_probe_param),
    .io_in_3_bits_probe_need_data(replace_pipe_req_arb_io_in_3_bits_probe_need_data),
    .io_in_3_bits_source(replace_pipe_req_arb_io_in_3_bits_source),
    .io_in_3_bits_cmd(replace_pipe_req_arb_io_in_3_bits_cmd),
    .io_in_3_bits_vaddr(replace_pipe_req_arb_io_in_3_bits_vaddr),
    .io_in_3_bits_addr(replace_pipe_req_arb_io_in_3_bits_addr),
    .io_in_3_bits_store_data(replace_pipe_req_arb_io_in_3_bits_store_data),
    .io_in_3_bits_store_mask(replace_pipe_req_arb_io_in_3_bits_store_mask),
    .io_in_3_bits_word_idx(replace_pipe_req_arb_io_in_3_bits_word_idx),
    .io_in_3_bits_amo_data(replace_pipe_req_arb_io_in_3_bits_amo_data),
    .io_in_3_bits_amo_mask(replace_pipe_req_arb_io_in_3_bits_amo_mask),
    .io_in_3_bits_error(replace_pipe_req_arb_io_in_3_bits_error),
    .io_in_3_bits_replace(replace_pipe_req_arb_io_in_3_bits_replace),
    .io_in_3_bits_replace_way_en(replace_pipe_req_arb_io_in_3_bits_replace_way_en),
    .io_in_3_bits_id(replace_pipe_req_arb_io_in_3_bits_id),
    .io_out_ready(replace_pipe_req_arb_io_out_ready),
    .io_out_valid(replace_pipe_req_arb_io_out_valid),
    .io_out_bits_miss(replace_pipe_req_arb_io_out_bits_miss),
    .io_out_bits_miss_id(replace_pipe_req_arb_io_out_bits_miss_id),
    .io_out_bits_miss_param(replace_pipe_req_arb_io_out_bits_miss_param),
    .io_out_bits_miss_dirty(replace_pipe_req_arb_io_out_bits_miss_dirty),
    .io_out_bits_miss_way_en(replace_pipe_req_arb_io_out_bits_miss_way_en),
    .io_out_bits_probe(replace_pipe_req_arb_io_out_bits_probe),
    .io_out_bits_probe_param(replace_pipe_req_arb_io_out_bits_probe_param),
    .io_out_bits_probe_need_data(replace_pipe_req_arb_io_out_bits_probe_need_data),
    .io_out_bits_source(replace_pipe_req_arb_io_out_bits_source),
    .io_out_bits_cmd(replace_pipe_req_arb_io_out_bits_cmd),
    .io_out_bits_vaddr(replace_pipe_req_arb_io_out_bits_vaddr),
    .io_out_bits_addr(replace_pipe_req_arb_io_out_bits_addr),
    .io_out_bits_store_data(replace_pipe_req_arb_io_out_bits_store_data),
    .io_out_bits_store_mask(replace_pipe_req_arb_io_out_bits_store_mask),
    .io_out_bits_word_idx(replace_pipe_req_arb_io_out_bits_word_idx),
    .io_out_bits_amo_data(replace_pipe_req_arb_io_out_bits_amo_data),
    .io_out_bits_amo_mask(replace_pipe_req_arb_io_out_bits_amo_mask),
    .io_out_bits_error(replace_pipe_req_arb_io_out_bits_error),
    .io_out_bits_replace(replace_pipe_req_arb_io_out_bits_replace),
    .io_out_bits_replace_way_en(replace_pipe_req_arb_io_out_bits_replace_way_en),
    .io_out_bits_id(replace_pipe_req_arb_io_out_bits_id)
  );
  PipelineRegModule_25 pipelineReg_25 ( // @[MemCommon.scala 396:29]
    .clock(pipelineReg_25_clock),
    .reset(pipelineReg_25_reset),
    .io_in_ready(pipelineReg_25_io_in_ready),
    .io_in_valid(pipelineReg_25_io_in_valid),
    .io_in_bits_miss(pipelineReg_25_io_in_bits_miss),
    .io_in_bits_miss_id(pipelineReg_25_io_in_bits_miss_id),
    .io_in_bits_miss_param(pipelineReg_25_io_in_bits_miss_param),
    .io_in_bits_miss_dirty(pipelineReg_25_io_in_bits_miss_dirty),
    .io_in_bits_miss_way_en(pipelineReg_25_io_in_bits_miss_way_en),
    .io_in_bits_probe(pipelineReg_25_io_in_bits_probe),
    .io_in_bits_probe_param(pipelineReg_25_io_in_bits_probe_param),
    .io_in_bits_probe_need_data(pipelineReg_25_io_in_bits_probe_need_data),
    .io_in_bits_source(pipelineReg_25_io_in_bits_source),
    .io_in_bits_cmd(pipelineReg_25_io_in_bits_cmd),
    .io_in_bits_vaddr(pipelineReg_25_io_in_bits_vaddr),
    .io_in_bits_addr(pipelineReg_25_io_in_bits_addr),
    .io_in_bits_store_data(pipelineReg_25_io_in_bits_store_data),
    .io_in_bits_store_mask(pipelineReg_25_io_in_bits_store_mask),
    .io_in_bits_word_idx(pipelineReg_25_io_in_bits_word_idx),
    .io_in_bits_amo_data(pipelineReg_25_io_in_bits_amo_data),
    .io_in_bits_amo_mask(pipelineReg_25_io_in_bits_amo_mask),
    .io_in_bits_error(pipelineReg_25_io_in_bits_error),
    .io_in_bits_replace(pipelineReg_25_io_in_bits_replace),
    .io_in_bits_replace_way_en(pipelineReg_25_io_in_bits_replace_way_en),
    .io_in_bits_id(pipelineReg_25_io_in_bits_id),
    .io_out_ready(pipelineReg_25_io_out_ready),
    .io_out_valid(pipelineReg_25_io_out_valid),
    .io_out_bits_miss(pipelineReg_25_io_out_bits_miss),
    .io_out_bits_miss_id(pipelineReg_25_io_out_bits_miss_id),
    .io_out_bits_miss_param(pipelineReg_25_io_out_bits_miss_param),
    .io_out_bits_miss_dirty(pipelineReg_25_io_out_bits_miss_dirty),
    .io_out_bits_miss_way_en(pipelineReg_25_io_out_bits_miss_way_en),
    .io_out_bits_probe(pipelineReg_25_io_out_bits_probe),
    .io_out_bits_probe_param(pipelineReg_25_io_out_bits_probe_param),
    .io_out_bits_probe_need_data(pipelineReg_25_io_out_bits_probe_need_data),
    .io_out_bits_source(pipelineReg_25_io_out_bits_source),
    .io_out_bits_cmd(pipelineReg_25_io_out_bits_cmd),
    .io_out_bits_vaddr(pipelineReg_25_io_out_bits_vaddr),
    .io_out_bits_addr(pipelineReg_25_io_out_bits_addr),
    .io_out_bits_store_data(pipelineReg_25_io_out_bits_store_data),
    .io_out_bits_store_mask(pipelineReg_25_io_out_bits_store_mask),
    .io_out_bits_word_idx(pipelineReg_25_io_out_bits_word_idx),
    .io_out_bits_amo_data(pipelineReg_25_io_out_bits_amo_data),
    .io_out_bits_amo_mask(pipelineReg_25_io_out_bits_amo_mask),
    .io_out_bits_error(pipelineReg_25_io_out_bits_error),
    .io_out_bits_replace(pipelineReg_25_io_out_bits_replace),
    .io_out_bits_replace_way_en(pipelineReg_25_io_out_bits_replace_way_en),
    .io_out_bits_id(pipelineReg_25_io_out_bits_id)
  );
  FastArbiter main_pipe_req_arb ( // @[DCacheWrapper.scala 260:21]
    .clock(main_pipe_req_arb_clock),
    .reset(main_pipe_req_arb_reset),
    .io_in_0_ready(main_pipe_req_arb_io_in_0_ready),
    .io_in_0_valid(main_pipe_req_arb_io_in_0_valid),
    .io_in_0_bits_miss_id(main_pipe_req_arb_io_in_0_bits_miss_id),
    .io_in_0_bits_miss_param(main_pipe_req_arb_io_in_0_bits_miss_param),
    .io_in_0_bits_miss_dirty(main_pipe_req_arb_io_in_0_bits_miss_dirty),
    .io_in_0_bits_miss_way_en(main_pipe_req_arb_io_in_0_bits_miss_way_en),
    .io_in_0_bits_source(main_pipe_req_arb_io_in_0_bits_source),
    .io_in_0_bits_cmd(main_pipe_req_arb_io_in_0_bits_cmd),
    .io_in_0_bits_vaddr(main_pipe_req_arb_io_in_0_bits_vaddr),
    .io_in_0_bits_addr(main_pipe_req_arb_io_in_0_bits_addr),
    .io_in_0_bits_store_data(main_pipe_req_arb_io_in_0_bits_store_data),
    .io_in_0_bits_word_idx(main_pipe_req_arb_io_in_0_bits_word_idx),
    .io_in_0_bits_amo_data(main_pipe_req_arb_io_in_0_bits_amo_data),
    .io_in_0_bits_amo_mask(main_pipe_req_arb_io_in_0_bits_amo_mask),
    .io_in_0_bits_error(main_pipe_req_arb_io_in_0_bits_error),
    .io_in_0_bits_id(main_pipe_req_arb_io_in_0_bits_id),
    .io_in_1_ready(main_pipe_req_arb_io_in_1_ready),
    .io_in_1_valid(main_pipe_req_arb_io_in_1_valid),
    .io_in_1_bits_miss_id(main_pipe_req_arb_io_in_1_bits_miss_id),
    .io_in_1_bits_miss_param(main_pipe_req_arb_io_in_1_bits_miss_param),
    .io_in_1_bits_miss_dirty(main_pipe_req_arb_io_in_1_bits_miss_dirty),
    .io_in_1_bits_miss_way_en(main_pipe_req_arb_io_in_1_bits_miss_way_en),
    .io_in_1_bits_source(main_pipe_req_arb_io_in_1_bits_source),
    .io_in_1_bits_cmd(main_pipe_req_arb_io_in_1_bits_cmd),
    .io_in_1_bits_vaddr(main_pipe_req_arb_io_in_1_bits_vaddr),
    .io_in_1_bits_addr(main_pipe_req_arb_io_in_1_bits_addr),
    .io_in_1_bits_store_data(main_pipe_req_arb_io_in_1_bits_store_data),
    .io_in_1_bits_word_idx(main_pipe_req_arb_io_in_1_bits_word_idx),
    .io_in_1_bits_amo_data(main_pipe_req_arb_io_in_1_bits_amo_data),
    .io_in_1_bits_amo_mask(main_pipe_req_arb_io_in_1_bits_amo_mask),
    .io_in_1_bits_error(main_pipe_req_arb_io_in_1_bits_error),
    .io_in_1_bits_id(main_pipe_req_arb_io_in_1_bits_id),
    .io_in_2_ready(main_pipe_req_arb_io_in_2_ready),
    .io_in_2_valid(main_pipe_req_arb_io_in_2_valid),
    .io_in_2_bits_miss_id(main_pipe_req_arb_io_in_2_bits_miss_id),
    .io_in_2_bits_miss_param(main_pipe_req_arb_io_in_2_bits_miss_param),
    .io_in_2_bits_miss_dirty(main_pipe_req_arb_io_in_2_bits_miss_dirty),
    .io_in_2_bits_miss_way_en(main_pipe_req_arb_io_in_2_bits_miss_way_en),
    .io_in_2_bits_source(main_pipe_req_arb_io_in_2_bits_source),
    .io_in_2_bits_cmd(main_pipe_req_arb_io_in_2_bits_cmd),
    .io_in_2_bits_vaddr(main_pipe_req_arb_io_in_2_bits_vaddr),
    .io_in_2_bits_addr(main_pipe_req_arb_io_in_2_bits_addr),
    .io_in_2_bits_store_data(main_pipe_req_arb_io_in_2_bits_store_data),
    .io_in_2_bits_word_idx(main_pipe_req_arb_io_in_2_bits_word_idx),
    .io_in_2_bits_amo_data(main_pipe_req_arb_io_in_2_bits_amo_data),
    .io_in_2_bits_amo_mask(main_pipe_req_arb_io_in_2_bits_amo_mask),
    .io_in_2_bits_error(main_pipe_req_arb_io_in_2_bits_error),
    .io_in_2_bits_id(main_pipe_req_arb_io_in_2_bits_id),
    .io_in_3_ready(main_pipe_req_arb_io_in_3_ready),
    .io_in_3_valid(main_pipe_req_arb_io_in_3_valid),
    .io_in_3_bits_miss_id(main_pipe_req_arb_io_in_3_bits_miss_id),
    .io_in_3_bits_miss_param(main_pipe_req_arb_io_in_3_bits_miss_param),
    .io_in_3_bits_miss_dirty(main_pipe_req_arb_io_in_3_bits_miss_dirty),
    .io_in_3_bits_miss_way_en(main_pipe_req_arb_io_in_3_bits_miss_way_en),
    .io_in_3_bits_source(main_pipe_req_arb_io_in_3_bits_source),
    .io_in_3_bits_cmd(main_pipe_req_arb_io_in_3_bits_cmd),
    .io_in_3_bits_vaddr(main_pipe_req_arb_io_in_3_bits_vaddr),
    .io_in_3_bits_addr(main_pipe_req_arb_io_in_3_bits_addr),
    .io_in_3_bits_store_data(main_pipe_req_arb_io_in_3_bits_store_data),
    .io_in_3_bits_word_idx(main_pipe_req_arb_io_in_3_bits_word_idx),
    .io_in_3_bits_amo_data(main_pipe_req_arb_io_in_3_bits_amo_data),
    .io_in_3_bits_amo_mask(main_pipe_req_arb_io_in_3_bits_amo_mask),
    .io_in_3_bits_error(main_pipe_req_arb_io_in_3_bits_error),
    .io_in_3_bits_id(main_pipe_req_arb_io_in_3_bits_id),
    .io_out_ready(main_pipe_req_arb_io_out_ready),
    .io_out_valid(main_pipe_req_arb_io_out_valid),
    .io_out_bits_miss(main_pipe_req_arb_io_out_bits_miss),
    .io_out_bits_miss_id(main_pipe_req_arb_io_out_bits_miss_id),
    .io_out_bits_miss_param(main_pipe_req_arb_io_out_bits_miss_param),
    .io_out_bits_miss_dirty(main_pipe_req_arb_io_out_bits_miss_dirty),
    .io_out_bits_miss_way_en(main_pipe_req_arb_io_out_bits_miss_way_en),
    .io_out_bits_source(main_pipe_req_arb_io_out_bits_source),
    .io_out_bits_cmd(main_pipe_req_arb_io_out_bits_cmd),
    .io_out_bits_vaddr(main_pipe_req_arb_io_out_bits_vaddr),
    .io_out_bits_addr(main_pipe_req_arb_io_out_bits_addr),
    .io_out_bits_store_data(main_pipe_req_arb_io_out_bits_store_data),
    .io_out_bits_store_mask(main_pipe_req_arb_io_out_bits_store_mask),
    .io_out_bits_word_idx(main_pipe_req_arb_io_out_bits_word_idx),
    .io_out_bits_amo_data(main_pipe_req_arb_io_out_bits_amo_data),
    .io_out_bits_amo_mask(main_pipe_req_arb_io_out_bits_amo_mask),
    .io_out_bits_error(main_pipe_req_arb_io_out_bits_error),
    .io_out_bits_id(main_pipe_req_arb_io_out_bits_id)
  );
  L1MissQMissTrace_hart0Writer #(.site("MissQueue")) writer ( // @[ChiselDB.scala 132:24]
    .clock(writer_clock),
    .reset(writer_reset),
    .en(writer_en),
    .stamp(writer_stamp),
    .data_vaddr(writer_data_vaddr),
    .data_paddr(writer_data_paddr),
    .data_source(writer_data_source),
    .data_pc(writer_data_pc)
  );
  assign io_req_ready = alloc | merge; // @[MissQueue.scala 633:22]
  assign io_resp_id = {_io_resp_id_T_1,_io_resp_id_T_2[1]}; // @[Cat.scala 31:58]
  assign io_refill_to_ldq_valid = |_io_refill_to_ldq_valid_T; // @[MissQueue.scala 706:72]
  assign io_refill_to_ldq_bits_id = _io_refill_to_ldq_bits_T_22[1:0]; // @[ParallelMux.scala 36:73]
  assign io_mem_acquire_valid = idle ? _T_50 : _sink_ACancel_earlyValid_T_9; // @[Arbiter.scala 125:29]
  assign io_mem_acquire_bits_opcode = _T_131 | _T_129; // @[Mux.scala 27:73]
  assign io_mem_acquire_bits_param = _T_138 | _T_136; // @[Mux.scala 27:73]
  assign io_mem_acquire_bits_size = _T_131 | _T_129; // @[Mux.scala 27:73]
  assign io_mem_acquire_bits_source = _T_124 | _T_122; // @[Mux.scala 27:73]
  assign io_mem_acquire_bits_address = _T_117 | _T_115; // @[Mux.scala 27:73]
  assign io_mem_acquire_bits_mask = _T_89 | _T_87; // @[Mux.scala 27:73]
  assign io_mem_grant_ready = io_mem_grant_bits_source == 4'h3 ? entries_3_io_mem_grant_ready : _GEN_90; // @[MissQueue.scala 694:47 695:24]
  assign io_mem_finish_valid = idle_1 ? _T_167 : _sink_ACancel_earlyValid_T_20; // @[Arbiter.scala 125:29]
  assign io_mem_finish_bits_sink = _T_192 | _T_190; // @[Mux.scala 27:73]
  assign io_refill_pipe_req_valid = pipelineReg_24_io_out_valid; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_bits_source = pipelineReg_24_io_out_bits_source; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_bits_addr = pipelineReg_24_io_out_bits_addr; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_bits_way_en = pipelineReg_24_io_out_bits_way_en; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_bits_alias = pipelineReg_24_io_out_bits_alias; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_bits_miss_id = pipelineReg_24_io_out_bits_miss_id; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_bits_id = pipelineReg_24_io_out_bits_id; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_bits_error = pipelineReg_24_io_out_bits_error; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_bits_prefetch = pipelineReg_24_io_out_bits_prefetch; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_bits_wmask = pipelineReg_24_io_out_bits_wmask; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_bits_data_0 = pipelineReg_24_io_out_bits_data_0; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_bits_data_1 = pipelineReg_24_io_out_bits_data_1; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_bits_data_2 = pipelineReg_24_io_out_bits_data_2; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_bits_data_3 = pipelineReg_24_io_out_bits_data_3; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_bits_data_4 = pipelineReg_24_io_out_bits_data_4; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_bits_data_5 = pipelineReg_24_io_out_bits_data_5; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_bits_data_6 = pipelineReg_24_io_out_bits_data_6; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_bits_data_7 = pipelineReg_24_io_out_bits_data_7; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_bits_meta_coh_state = pipelineReg_24_io_out_bits_meta_coh_state; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_0_valid = pipelineReg_io_out_valid; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_0_bits_addr = pipelineReg_io_out_bits_addr; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_0_bits_way_en = pipelineReg_io_out_bits_way_en; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_0_bits_alias = pipelineReg_io_out_bits_alias; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_1_valid = pipelineReg_1_io_out_valid; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_1_bits_addr = pipelineReg_1_io_out_bits_addr; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_1_bits_way_en = pipelineReg_1_io_out_bits_way_en; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_1_bits_alias = pipelineReg_1_io_out_bits_alias; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_2_valid = pipelineReg_2_io_out_valid; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_2_bits_addr = pipelineReg_2_io_out_bits_addr; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_2_bits_way_en = pipelineReg_2_io_out_bits_way_en; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_2_bits_alias = pipelineReg_2_io_out_bits_alias; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_3_valid = pipelineReg_3_io_out_valid; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_3_bits_addr = pipelineReg_3_io_out_bits_addr; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_3_bits_way_en = pipelineReg_3_io_out_bits_way_en; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_3_bits_alias = pipelineReg_3_io_out_bits_alias; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_4_valid = pipelineReg_4_io_out_valid; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_4_bits_addr = pipelineReg_4_io_out_bits_addr; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_4_bits_way_en = pipelineReg_4_io_out_bits_way_en; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_4_bits_alias = pipelineReg_4_io_out_bits_alias; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_5_valid = pipelineReg_5_io_out_valid; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_5_bits_addr = pipelineReg_5_io_out_bits_addr; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_5_bits_way_en = pipelineReg_5_io_out_bits_way_en; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_5_bits_alias = pipelineReg_5_io_out_bits_alias; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_6_valid = pipelineReg_6_io_out_valid; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_6_bits_addr = pipelineReg_6_io_out_bits_addr; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_6_bits_way_en = pipelineReg_6_io_out_bits_way_en; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_6_bits_alias = pipelineReg_6_io_out_bits_alias; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_7_valid = pipelineReg_7_io_out_valid; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_7_bits_addr = pipelineReg_7_io_out_bits_addr; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_7_bits_way_en = pipelineReg_7_io_out_bits_way_en; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_7_bits_alias = pipelineReg_7_io_out_bits_alias; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_8_valid = pipelineReg_8_io_out_valid; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_8_bits_addr = pipelineReg_8_io_out_bits_addr; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_8_bits_way_en = pipelineReg_8_io_out_bits_way_en; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_8_bits_alias = pipelineReg_8_io_out_bits_alias; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_9_valid = pipelineReg_9_io_out_valid; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_9_bits_addr = pipelineReg_9_io_out_bits_addr; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_9_bits_way_en = pipelineReg_9_io_out_bits_way_en; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_9_bits_alias = pipelineReg_9_io_out_bits_alias; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_10_valid = pipelineReg_10_io_out_valid; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_10_bits_addr = pipelineReg_10_io_out_bits_addr; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_10_bits_way_en = pipelineReg_10_io_out_bits_way_en; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_10_bits_alias = pipelineReg_10_io_out_bits_alias; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_11_valid = pipelineReg_11_io_out_valid; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_11_bits_addr = pipelineReg_11_io_out_bits_addr; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_11_bits_way_en = pipelineReg_11_io_out_bits_way_en; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_11_bits_alias = pipelineReg_11_io_out_bits_alias; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_12_valid = pipelineReg_12_io_out_valid; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_12_bits_addr = pipelineReg_12_io_out_bits_addr; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_12_bits_way_en = pipelineReg_12_io_out_bits_way_en; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_12_bits_alias = pipelineReg_12_io_out_bits_alias; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_13_valid = pipelineReg_13_io_out_valid; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_13_bits_addr = pipelineReg_13_io_out_bits_addr; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_13_bits_way_en = pipelineReg_13_io_out_bits_way_en; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_13_bits_alias = pipelineReg_13_io_out_bits_alias; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_14_valid = pipelineReg_14_io_out_valid; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_14_bits_addr = pipelineReg_14_io_out_bits_addr; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_14_bits_way_en = pipelineReg_14_io_out_bits_way_en; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_14_bits_alias = pipelineReg_14_io_out_bits_alias; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_15_valid = pipelineReg_15_io_out_valid; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_15_bits_addr = pipelineReg_15_io_out_bits_addr; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_15_bits_way_en = pipelineReg_15_io_out_bits_way_en; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_15_bits_alias = pipelineReg_15_io_out_bits_alias; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_16_valid = pipelineReg_16_io_out_valid; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_16_bits_addr = pipelineReg_16_io_out_bits_addr; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_16_bits_way_en = pipelineReg_16_io_out_bits_way_en; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_16_bits_alias = pipelineReg_16_io_out_bits_alias; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_17_valid = pipelineReg_17_io_out_valid; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_17_bits_addr = pipelineReg_17_io_out_bits_addr; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_17_bits_way_en = pipelineReg_17_io_out_bits_way_en; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_17_bits_alias = pipelineReg_17_io_out_bits_alias; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_18_valid = pipelineReg_18_io_out_valid; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_18_bits_addr = pipelineReg_18_io_out_bits_addr; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_18_bits_way_en = pipelineReg_18_io_out_bits_way_en; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_18_bits_alias = pipelineReg_18_io_out_bits_alias; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_19_valid = pipelineReg_19_io_out_valid; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_19_bits_addr = pipelineReg_19_io_out_bits_addr; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_19_bits_way_en = pipelineReg_19_io_out_bits_way_en; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_19_bits_alias = pipelineReg_19_io_out_bits_alias; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_20_valid = pipelineReg_20_io_out_valid; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_20_bits_addr = pipelineReg_20_io_out_bits_addr; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_20_bits_way_en = pipelineReg_20_io_out_bits_way_en; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_20_bits_alias = pipelineReg_20_io_out_bits_alias; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_21_valid = pipelineReg_21_io_out_valid; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_21_bits_addr = pipelineReg_21_io_out_bits_addr; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_21_bits_way_en = pipelineReg_21_io_out_bits_way_en; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_21_bits_alias = pipelineReg_21_io_out_bits_alias; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_22_valid = pipelineReg_22_io_out_valid; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_22_bits_addr = pipelineReg_22_io_out_bits_addr; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_22_bits_way_en = pipelineReg_22_io_out_bits_way_en; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_22_bits_alias = pipelineReg_22_io_out_bits_alias; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_23_valid = pipelineReg_23_io_out_valid; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_23_bits_addr = pipelineReg_23_io_out_bits_addr; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_23_bits_way_en = pipelineReg_23_io_out_bits_way_en; // @[MemCommon.scala 399:11]
  assign io_refill_pipe_req_dup_23_bits_alias = pipelineReg_23_io_out_bits_alias; // @[MemCommon.scala 399:11]
  assign io_replace_pipe_req_valid = pipelineReg_25_io_out_valid; // @[MemCommon.scala 399:11]
  assign io_replace_pipe_req_bits_miss = pipelineReg_25_io_out_bits_miss; // @[MemCommon.scala 399:11]
  assign io_replace_pipe_req_bits_miss_id = pipelineReg_25_io_out_bits_miss_id; // @[MemCommon.scala 399:11]
  assign io_replace_pipe_req_bits_miss_param = pipelineReg_25_io_out_bits_miss_param; // @[MemCommon.scala 399:11]
  assign io_replace_pipe_req_bits_miss_dirty = pipelineReg_25_io_out_bits_miss_dirty; // @[MemCommon.scala 399:11]
  assign io_replace_pipe_req_bits_miss_way_en = pipelineReg_25_io_out_bits_miss_way_en; // @[MemCommon.scala 399:11]
  assign io_replace_pipe_req_bits_probe = pipelineReg_25_io_out_bits_probe; // @[MemCommon.scala 399:11]
  assign io_replace_pipe_req_bits_probe_param = pipelineReg_25_io_out_bits_probe_param; // @[MemCommon.scala 399:11]
  assign io_replace_pipe_req_bits_probe_need_data = pipelineReg_25_io_out_bits_probe_need_data; // @[MemCommon.scala 399:11]
  assign io_replace_pipe_req_bits_source = pipelineReg_25_io_out_bits_source; // @[MemCommon.scala 399:11]
  assign io_replace_pipe_req_bits_cmd = pipelineReg_25_io_out_bits_cmd; // @[MemCommon.scala 399:11]
  assign io_replace_pipe_req_bits_vaddr = pipelineReg_25_io_out_bits_vaddr; // @[MemCommon.scala 399:11]
  assign io_replace_pipe_req_bits_addr = pipelineReg_25_io_out_bits_addr; // @[MemCommon.scala 399:11]
  assign io_replace_pipe_req_bits_store_data = pipelineReg_25_io_out_bits_store_data; // @[MemCommon.scala 399:11]
  assign io_replace_pipe_req_bits_store_mask = pipelineReg_25_io_out_bits_store_mask; // @[MemCommon.scala 399:11]
  assign io_replace_pipe_req_bits_word_idx = pipelineReg_25_io_out_bits_word_idx; // @[MemCommon.scala 399:11]
  assign io_replace_pipe_req_bits_amo_data = pipelineReg_25_io_out_bits_amo_data; // @[MemCommon.scala 399:11]
  assign io_replace_pipe_req_bits_amo_mask = pipelineReg_25_io_out_bits_amo_mask; // @[MemCommon.scala 399:11]
  assign io_replace_pipe_req_bits_error = pipelineReg_25_io_out_bits_error; // @[MemCommon.scala 399:11]
  assign io_replace_pipe_req_bits_replace = pipelineReg_25_io_out_bits_replace; // @[MemCommon.scala 399:11]
  assign io_replace_pipe_req_bits_replace_way_en = pipelineReg_25_io_out_bits_replace_way_en; // @[MemCommon.scala 399:11]
  assign io_replace_pipe_req_bits_id = pipelineReg_25_io_out_bits_id; // @[MemCommon.scala 399:11]
  assign io_main_pipe_req_valid = main_pipe_req_arb_io_out_valid; // @[DCacheWrapper.scala 265:9]
  assign io_main_pipe_req_bits_miss = main_pipe_req_arb_io_out_bits_miss; // @[DCacheWrapper.scala 265:9]
  assign io_main_pipe_req_bits_miss_id = main_pipe_req_arb_io_out_bits_miss_id; // @[DCacheWrapper.scala 265:9]
  assign io_main_pipe_req_bits_miss_param = main_pipe_req_arb_io_out_bits_miss_param; // @[DCacheWrapper.scala 265:9]
  assign io_main_pipe_req_bits_miss_dirty = main_pipe_req_arb_io_out_bits_miss_dirty; // @[DCacheWrapper.scala 265:9]
  assign io_main_pipe_req_bits_miss_way_en = main_pipe_req_arb_io_out_bits_miss_way_en; // @[DCacheWrapper.scala 265:9]
  assign io_main_pipe_req_bits_source = main_pipe_req_arb_io_out_bits_source; // @[DCacheWrapper.scala 265:9]
  assign io_main_pipe_req_bits_cmd = main_pipe_req_arb_io_out_bits_cmd; // @[DCacheWrapper.scala 265:9]
  assign io_main_pipe_req_bits_vaddr = main_pipe_req_arb_io_out_bits_vaddr; // @[DCacheWrapper.scala 265:9]
  assign io_main_pipe_req_bits_addr = main_pipe_req_arb_io_out_bits_addr; // @[DCacheWrapper.scala 265:9]
  assign io_main_pipe_req_bits_store_data = main_pipe_req_arb_io_out_bits_store_data; // @[DCacheWrapper.scala 265:9]
  assign io_main_pipe_req_bits_store_mask = main_pipe_req_arb_io_out_bits_store_mask; // @[DCacheWrapper.scala 265:9]
  assign io_main_pipe_req_bits_word_idx = main_pipe_req_arb_io_out_bits_word_idx; // @[DCacheWrapper.scala 265:9]
  assign io_main_pipe_req_bits_amo_data = main_pipe_req_arb_io_out_bits_amo_data; // @[DCacheWrapper.scala 265:9]
  assign io_main_pipe_req_bits_amo_mask = main_pipe_req_arb_io_out_bits_amo_mask; // @[DCacheWrapper.scala 265:9]
  assign io_main_pipe_req_bits_error = main_pipe_req_arb_io_out_bits_error; // @[DCacheWrapper.scala 265:9]
  assign io_main_pipe_req_bits_id = main_pipe_req_arb_io_out_bits_id; // @[DCacheWrapper.scala 265:9]
  assign io_probe_block = |_io_probe_block_T; // @[MissQueue.scala 730:42]
  assign io_forward_0_forward_mshr = forward_mshr; // @[MissQueue.scala 647:32]
  assign io_forward_0_forwardData_0 = forwardData__0; // @[MissQueue.scala 648:31]
  assign io_forward_0_forwardData_1 = forwardData__1; // @[MissQueue.scala 648:31]
  assign io_forward_0_forwardData_2 = forwardData__2; // @[MissQueue.scala 648:31]
  assign io_forward_0_forwardData_3 = forwardData__3; // @[MissQueue.scala 648:31]
  assign io_forward_0_forwardData_4 = forwardData__4; // @[MissQueue.scala 648:31]
  assign io_forward_0_forwardData_5 = forwardData__5; // @[MissQueue.scala 648:31]
  assign io_forward_0_forwardData_6 = forwardData__6; // @[MissQueue.scala 648:31]
  assign io_forward_0_forwardData_7 = forwardData__7; // @[MissQueue.scala 648:31]
  assign io_forward_0_forwardData_8 = forwardData__8; // @[MissQueue.scala 648:31]
  assign io_forward_0_forwardData_9 = forwardData__9; // @[MissQueue.scala 648:31]
  assign io_forward_0_forwardData_10 = forwardData__10; // @[MissQueue.scala 648:31]
  assign io_forward_0_forwardData_11 = forwardData__11; // @[MissQueue.scala 648:31]
  assign io_forward_0_forwardData_12 = forwardData__12; // @[MissQueue.scala 648:31]
  assign io_forward_0_forwardData_13 = forwardData__13; // @[MissQueue.scala 648:31]
  assign io_forward_0_forwardData_14 = forwardData__14; // @[MissQueue.scala 648:31]
  assign io_forward_0_forwardData_15 = forwardData__15; // @[MissQueue.scala 648:31]
  assign io_forward_0_forward_result_valid = io_forward_0_forward_result_valid_REG; // @[MissQueue.scala 646:40]
  assign io_forward_1_forward_mshr = forward_mshr_1; // @[MissQueue.scala 647:32]
  assign io_forward_1_forwardData_0 = forwardData_1_0; // @[MissQueue.scala 648:31]
  assign io_forward_1_forwardData_1 = forwardData_1_1; // @[MissQueue.scala 648:31]
  assign io_forward_1_forwardData_2 = forwardData_1_2; // @[MissQueue.scala 648:31]
  assign io_forward_1_forwardData_3 = forwardData_1_3; // @[MissQueue.scala 648:31]
  assign io_forward_1_forwardData_4 = forwardData_1_4; // @[MissQueue.scala 648:31]
  assign io_forward_1_forwardData_5 = forwardData_1_5; // @[MissQueue.scala 648:31]
  assign io_forward_1_forwardData_6 = forwardData_1_6; // @[MissQueue.scala 648:31]
  assign io_forward_1_forwardData_7 = forwardData_1_7; // @[MissQueue.scala 648:31]
  assign io_forward_1_forwardData_8 = forwardData_1_8; // @[MissQueue.scala 648:31]
  assign io_forward_1_forwardData_9 = forwardData_1_9; // @[MissQueue.scala 648:31]
  assign io_forward_1_forwardData_10 = forwardData_1_10; // @[MissQueue.scala 648:31]
  assign io_forward_1_forwardData_11 = forwardData_1_11; // @[MissQueue.scala 648:31]
  assign io_forward_1_forwardData_12 = forwardData_1_12; // @[MissQueue.scala 648:31]
  assign io_forward_1_forwardData_13 = forwardData_1_13; // @[MissQueue.scala 648:31]
  assign io_forward_1_forwardData_14 = forwardData_1_14; // @[MissQueue.scala 648:31]
  assign io_forward_1_forwardData_15 = forwardData_1_15; // @[MissQueue.scala 648:31]
  assign io_forward_1_forward_result_valid = io_forward_1_forward_result_valid_REG; // @[MissQueue.scala 646:40]
  assign io_perf_0_value = {{5'd0}, io_perf_0_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_1_value = {{5'd0}, io_perf_1_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_2_value = {{5'd0}, io_perf_2_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_3_value = {{5'd0}, io_perf_3_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_4_value = {{5'd0}, io_perf_4_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign entries_0_clock = clock;
  assign entries_0_reset = reset;
  assign entries_0_io_id = 2'h0; // @[MissQueue.scala 681:15]
  assign entries_0_io_req_valid = io_req_valid; // @[MissQueue.scala 683:22]
  assign entries_0_io_req_bits_source = io_req_bits_source; // @[MissQueue.scala 97:19 98:16]
  assign entries_0_io_req_bits_cmd = io_req_bits_cmd; // @[MissQueue.scala 97:19 99:13]
  assign entries_0_io_req_bits_addr = io_req_bits_addr; // @[MissQueue.scala 100:14 97:19]
  assign entries_0_io_req_bits_vaddr = io_req_bits_vaddr; // @[MissQueue.scala 101:15 97:19]
  assign entries_0_io_req_bits_way_en = io_req_bits_way_en; // @[MissQueue.scala 102:16 97:19]
  assign entries_0_io_req_bits_word_idx = io_req_bits_word_idx; // @[MissQueue.scala 104:18 97:19]
  assign entries_0_io_req_bits_amo_data = io_req_bits_amo_data; // @[MissQueue.scala 105:18 97:19]
  assign entries_0_io_req_bits_amo_mask = io_req_bits_amo_mask; // @[MissQueue.scala 106:18 97:19]
  assign entries_0_io_req_bits_req_coh_state = io_req_bits_req_coh_state; // @[MissQueue.scala 107:17 97:19]
  assign entries_0_io_req_bits_replace_coh_state = io_req_bits_replace_coh_state; // @[MissQueue.scala 97:19 108:21]
  assign entries_0_io_req_bits_replace_tag = io_req_bits_replace_tag; // @[MissQueue.scala 97:19 109:21]
  assign entries_0_io_req_bits_id = io_req_bits_id; // @[MissQueue.scala 110:12 97:19]
  assign entries_0_io_req_bits_cancel = io_req_bits_cancel; // @[MissQueue.scala 111:16 97:19]
  assign entries_0_io_req_data_store_data = req_data_buffer_store_data; // @[MissQueue.scala 690:21]
  assign entries_0_io_req_data_store_mask = req_data_buffer_store_mask; // @[MissQueue.scala 690:21]
  assign entries_0_io_primary_valid = _entries_0_io_primary_valid_T_3 & entries_0_io_primary_ready; // @[MissQueue.scala 687:31]
  assign entries_0_io_mem_acquire_ready = io_mem_acquire_ready & allowed__0; // @[Arbiter.scala 123:31]
  assign entries_0_io_mem_grant_valid = io_mem_grant_bits_source == 4'h0 & io_mem_grant_valid; // @[MissQueue.scala 694:47 695:24 692:28]
  assign entries_0_io_mem_grant_bits_opcode = io_mem_grant_bits_opcode; // @[MissQueue.scala 694:47 695:24]
  assign entries_0_io_mem_grant_bits_param = io_mem_grant_bits_param; // @[MissQueue.scala 694:47 695:24]
  assign entries_0_io_mem_grant_bits_size = io_mem_grant_bits_size; // @[MissQueue.scala 694:47 695:24]
  assign entries_0_io_mem_grant_bits_sink = io_mem_grant_bits_sink; // @[MissQueue.scala 694:47 695:24]
  assign entries_0_io_mem_grant_bits_denied = io_mem_grant_bits_denied; // @[MissQueue.scala 694:47 695:24]
  assign entries_0_io_mem_grant_bits_echo_blockisdirty = io_mem_grant_bits_echo_blockisdirty; // @[MissQueue.scala 694:47 695:24]
  assign entries_0_io_mem_grant_bits_data = io_mem_grant_bits_data; // @[MissQueue.scala 694:47 695:24]
  assign entries_0_io_mem_grant_bits_corrupt = io_mem_grant_bits_corrupt; // @[MissQueue.scala 694:47 695:24]
  assign entries_0_io_mem_finish_ready = io_mem_finish_ready & allowed_1_0; // @[Arbiter.scala 123:31]
  assign entries_0_io_refill_pipe_req_ready = refill_pipe_req_arb_io_in_0_ready; // @[DCacheWrapper.scala 211:9]
  assign entries_0_io_refill_pipe_resp = io_refill_pipe_resp_valid & io_refill_pipe_resp_bits == 2'h0; // @[MissQueue.scala 698:58]
  assign entries_0_io_replace_pipe_req_ready = replace_pipe_req_arb_io_in_0_ready; // @[DCacheWrapper.scala 223:9]
  assign entries_0_io_replace_pipe_resp = io_replace_pipe_resp_valid & io_replace_pipe_resp_bits == 2'h0; // @[MissQueue.scala 699:60]
  assign entries_0_io_main_pipe_req_ready = main_pipe_req_arb_io_in_0_ready; // @[DCacheWrapper.scala 263:9]
  assign entries_0_io_main_pipe_resp = io_main_pipe_resp_valid & io_main_pipe_resp_bits_ack_miss_queue &
    io_main_pipe_resp_bits_miss_id == 2'h0; // @[MissQueue.scala 700:95]
  assign entries_1_clock = clock;
  assign entries_1_reset = reset;
  assign entries_1_io_id = 2'h1; // @[MissQueue.scala 681:15]
  assign entries_1_io_req_valid = io_req_valid; // @[MissQueue.scala 683:22]
  assign entries_1_io_req_bits_source = io_req_bits_source; // @[MissQueue.scala 97:19 98:16]
  assign entries_1_io_req_bits_cmd = io_req_bits_cmd; // @[MissQueue.scala 97:19 99:13]
  assign entries_1_io_req_bits_addr = io_req_bits_addr; // @[MissQueue.scala 100:14 97:19]
  assign entries_1_io_req_bits_vaddr = io_req_bits_vaddr; // @[MissQueue.scala 101:15 97:19]
  assign entries_1_io_req_bits_way_en = io_req_bits_way_en; // @[MissQueue.scala 102:16 97:19]
  assign entries_1_io_req_bits_word_idx = io_req_bits_word_idx; // @[MissQueue.scala 104:18 97:19]
  assign entries_1_io_req_bits_amo_data = io_req_bits_amo_data; // @[MissQueue.scala 105:18 97:19]
  assign entries_1_io_req_bits_amo_mask = io_req_bits_amo_mask; // @[MissQueue.scala 106:18 97:19]
  assign entries_1_io_req_bits_req_coh_state = io_req_bits_req_coh_state; // @[MissQueue.scala 107:17 97:19]
  assign entries_1_io_req_bits_replace_coh_state = io_req_bits_replace_coh_state; // @[MissQueue.scala 97:19 108:21]
  assign entries_1_io_req_bits_replace_tag = io_req_bits_replace_tag; // @[MissQueue.scala 97:19 109:21]
  assign entries_1_io_req_bits_id = io_req_bits_id; // @[MissQueue.scala 110:12 97:19]
  assign entries_1_io_req_bits_cancel = io_req_bits_cancel; // @[MissQueue.scala 111:16 97:19]
  assign entries_1_io_req_data_store_data = req_data_buffer_store_data; // @[MissQueue.scala 690:21]
  assign entries_1_io_req_data_store_mask = req_data_buffer_store_mask; // @[MissQueue.scala 690:21]
  assign entries_1_io_primary_valid = _entries_1_io_primary_valid_T_5 & entries_1_io_primary_ready; // @[MissQueue.scala 687:31]
  assign entries_1_io_mem_acquire_ready = io_mem_acquire_ready & allowed__1; // @[Arbiter.scala 123:31]
  assign entries_1_io_mem_grant_valid = io_mem_grant_bits_source == 4'h1 & io_mem_grant_valid; // @[MissQueue.scala 694:47 695:24 692:28]
  assign entries_1_io_mem_grant_bits_opcode = io_mem_grant_bits_opcode; // @[MissQueue.scala 694:47 695:24]
  assign entries_1_io_mem_grant_bits_param = io_mem_grant_bits_param; // @[MissQueue.scala 694:47 695:24]
  assign entries_1_io_mem_grant_bits_size = io_mem_grant_bits_size; // @[MissQueue.scala 694:47 695:24]
  assign entries_1_io_mem_grant_bits_sink = io_mem_grant_bits_sink; // @[MissQueue.scala 694:47 695:24]
  assign entries_1_io_mem_grant_bits_denied = io_mem_grant_bits_denied; // @[MissQueue.scala 694:47 695:24]
  assign entries_1_io_mem_grant_bits_echo_blockisdirty = io_mem_grant_bits_echo_blockisdirty; // @[MissQueue.scala 694:47 695:24]
  assign entries_1_io_mem_grant_bits_data = io_mem_grant_bits_data; // @[MissQueue.scala 694:47 695:24]
  assign entries_1_io_mem_grant_bits_corrupt = io_mem_grant_bits_corrupt; // @[MissQueue.scala 694:47 695:24]
  assign entries_1_io_mem_finish_ready = io_mem_finish_ready & allowed_1_1; // @[Arbiter.scala 123:31]
  assign entries_1_io_refill_pipe_req_ready = refill_pipe_req_arb_io_in_1_ready; // @[DCacheWrapper.scala 211:9]
  assign entries_1_io_refill_pipe_resp = io_refill_pipe_resp_valid & io_refill_pipe_resp_bits == 2'h1; // @[MissQueue.scala 698:58]
  assign entries_1_io_replace_pipe_req_ready = replace_pipe_req_arb_io_in_1_ready; // @[DCacheWrapper.scala 223:9]
  assign entries_1_io_replace_pipe_resp = io_replace_pipe_resp_valid & io_replace_pipe_resp_bits == 2'h1; // @[MissQueue.scala 699:60]
  assign entries_1_io_main_pipe_req_ready = main_pipe_req_arb_io_in_1_ready; // @[DCacheWrapper.scala 263:9]
  assign entries_1_io_main_pipe_resp = io_main_pipe_resp_valid & io_main_pipe_resp_bits_ack_miss_queue &
    io_main_pipe_resp_bits_miss_id == 2'h1; // @[MissQueue.scala 700:95]
  assign entries_2_clock = clock;
  assign entries_2_reset = reset;
  assign entries_2_io_id = 2'h2; // @[MissQueue.scala 681:15]
  assign entries_2_io_req_valid = io_req_valid; // @[MissQueue.scala 683:22]
  assign entries_2_io_req_bits_source = io_req_bits_source; // @[MissQueue.scala 97:19 98:16]
  assign entries_2_io_req_bits_cmd = io_req_bits_cmd; // @[MissQueue.scala 97:19 99:13]
  assign entries_2_io_req_bits_addr = io_req_bits_addr; // @[MissQueue.scala 100:14 97:19]
  assign entries_2_io_req_bits_vaddr = io_req_bits_vaddr; // @[MissQueue.scala 101:15 97:19]
  assign entries_2_io_req_bits_way_en = io_req_bits_way_en; // @[MissQueue.scala 102:16 97:19]
  assign entries_2_io_req_bits_word_idx = io_req_bits_word_idx; // @[MissQueue.scala 104:18 97:19]
  assign entries_2_io_req_bits_amo_data = io_req_bits_amo_data; // @[MissQueue.scala 105:18 97:19]
  assign entries_2_io_req_bits_amo_mask = io_req_bits_amo_mask; // @[MissQueue.scala 106:18 97:19]
  assign entries_2_io_req_bits_req_coh_state = io_req_bits_req_coh_state; // @[MissQueue.scala 107:17 97:19]
  assign entries_2_io_req_bits_replace_coh_state = io_req_bits_replace_coh_state; // @[MissQueue.scala 97:19 108:21]
  assign entries_2_io_req_bits_replace_tag = io_req_bits_replace_tag; // @[MissQueue.scala 97:19 109:21]
  assign entries_2_io_req_bits_id = io_req_bits_id; // @[MissQueue.scala 110:12 97:19]
  assign entries_2_io_req_bits_cancel = io_req_bits_cancel; // @[MissQueue.scala 111:16 97:19]
  assign entries_2_io_req_data_store_data = req_data_buffer_store_data; // @[MissQueue.scala 690:21]
  assign entries_2_io_req_data_store_mask = req_data_buffer_store_mask; // @[MissQueue.scala 690:21]
  assign entries_2_io_primary_valid = _entries_2_io_primary_valid_T_5 & entries_2_io_primary_ready; // @[MissQueue.scala 687:31]
  assign entries_2_io_mem_acquire_ready = io_mem_acquire_ready & allowed__2; // @[Arbiter.scala 123:31]
  assign entries_2_io_mem_grant_valid = io_mem_grant_bits_source == 4'h2 & io_mem_grant_valid; // @[MissQueue.scala 694:47 695:24 692:28]
  assign entries_2_io_mem_grant_bits_opcode = io_mem_grant_bits_opcode; // @[MissQueue.scala 694:47 695:24]
  assign entries_2_io_mem_grant_bits_param = io_mem_grant_bits_param; // @[MissQueue.scala 694:47 695:24]
  assign entries_2_io_mem_grant_bits_size = io_mem_grant_bits_size; // @[MissQueue.scala 694:47 695:24]
  assign entries_2_io_mem_grant_bits_sink = io_mem_grant_bits_sink; // @[MissQueue.scala 694:47 695:24]
  assign entries_2_io_mem_grant_bits_denied = io_mem_grant_bits_denied; // @[MissQueue.scala 694:47 695:24]
  assign entries_2_io_mem_grant_bits_echo_blockisdirty = io_mem_grant_bits_echo_blockisdirty; // @[MissQueue.scala 694:47 695:24]
  assign entries_2_io_mem_grant_bits_data = io_mem_grant_bits_data; // @[MissQueue.scala 694:47 695:24]
  assign entries_2_io_mem_grant_bits_corrupt = io_mem_grant_bits_corrupt; // @[MissQueue.scala 694:47 695:24]
  assign entries_2_io_mem_finish_ready = io_mem_finish_ready & allowed_1_2; // @[Arbiter.scala 123:31]
  assign entries_2_io_refill_pipe_req_ready = refill_pipe_req_arb_io_in_2_ready; // @[DCacheWrapper.scala 211:9]
  assign entries_2_io_refill_pipe_resp = io_refill_pipe_resp_valid & io_refill_pipe_resp_bits == 2'h2; // @[MissQueue.scala 698:58]
  assign entries_2_io_replace_pipe_req_ready = replace_pipe_req_arb_io_in_2_ready; // @[DCacheWrapper.scala 223:9]
  assign entries_2_io_replace_pipe_resp = io_replace_pipe_resp_valid & io_replace_pipe_resp_bits == 2'h2; // @[MissQueue.scala 699:60]
  assign entries_2_io_main_pipe_req_ready = main_pipe_req_arb_io_in_2_ready; // @[DCacheWrapper.scala 263:9]
  assign entries_2_io_main_pipe_resp = io_main_pipe_resp_valid & io_main_pipe_resp_bits_ack_miss_queue &
    io_main_pipe_resp_bits_miss_id == 2'h2; // @[MissQueue.scala 700:95]
  assign entries_3_clock = clock;
  assign entries_3_reset = reset;
  assign entries_3_io_id = 2'h3; // @[MissQueue.scala 681:15]
  assign entries_3_io_req_valid = io_req_valid; // @[MissQueue.scala 683:22]
  assign entries_3_io_req_bits_source = io_req_bits_source; // @[MissQueue.scala 97:19 98:16]
  assign entries_3_io_req_bits_cmd = io_req_bits_cmd; // @[MissQueue.scala 97:19 99:13]
  assign entries_3_io_req_bits_addr = io_req_bits_addr; // @[MissQueue.scala 100:14 97:19]
  assign entries_3_io_req_bits_vaddr = io_req_bits_vaddr; // @[MissQueue.scala 101:15 97:19]
  assign entries_3_io_req_bits_way_en = io_req_bits_way_en; // @[MissQueue.scala 102:16 97:19]
  assign entries_3_io_req_bits_word_idx = io_req_bits_word_idx; // @[MissQueue.scala 104:18 97:19]
  assign entries_3_io_req_bits_amo_data = io_req_bits_amo_data; // @[MissQueue.scala 105:18 97:19]
  assign entries_3_io_req_bits_amo_mask = io_req_bits_amo_mask; // @[MissQueue.scala 106:18 97:19]
  assign entries_3_io_req_bits_req_coh_state = io_req_bits_req_coh_state; // @[MissQueue.scala 107:17 97:19]
  assign entries_3_io_req_bits_replace_coh_state = io_req_bits_replace_coh_state; // @[MissQueue.scala 97:19 108:21]
  assign entries_3_io_req_bits_replace_tag = io_req_bits_replace_tag; // @[MissQueue.scala 97:19 109:21]
  assign entries_3_io_req_bits_id = io_req_bits_id; // @[MissQueue.scala 110:12 97:19]
  assign entries_3_io_req_bits_cancel = io_req_bits_cancel; // @[MissQueue.scala 111:16 97:19]
  assign entries_3_io_req_data_store_data = req_data_buffer_store_data; // @[MissQueue.scala 690:21]
  assign entries_3_io_req_data_store_mask = req_data_buffer_store_mask; // @[MissQueue.scala 690:21]
  assign entries_3_io_primary_valid = _entries_3_io_primary_valid_T_5 & entries_3_io_primary_ready; // @[MissQueue.scala 687:31]
  assign entries_3_io_mem_acquire_ready = io_mem_acquire_ready & allowed__3; // @[Arbiter.scala 123:31]
  assign entries_3_io_mem_grant_valid = io_mem_grant_bits_source == 4'h3 & io_mem_grant_valid; // @[MissQueue.scala 694:47 695:24 692:28]
  assign entries_3_io_mem_grant_bits_opcode = io_mem_grant_bits_opcode; // @[MissQueue.scala 694:47 695:24]
  assign entries_3_io_mem_grant_bits_param = io_mem_grant_bits_param; // @[MissQueue.scala 694:47 695:24]
  assign entries_3_io_mem_grant_bits_size = io_mem_grant_bits_size; // @[MissQueue.scala 694:47 695:24]
  assign entries_3_io_mem_grant_bits_sink = io_mem_grant_bits_sink; // @[MissQueue.scala 694:47 695:24]
  assign entries_3_io_mem_grant_bits_denied = io_mem_grant_bits_denied; // @[MissQueue.scala 694:47 695:24]
  assign entries_3_io_mem_grant_bits_echo_blockisdirty = io_mem_grant_bits_echo_blockisdirty; // @[MissQueue.scala 694:47 695:24]
  assign entries_3_io_mem_grant_bits_data = io_mem_grant_bits_data; // @[MissQueue.scala 694:47 695:24]
  assign entries_3_io_mem_grant_bits_corrupt = io_mem_grant_bits_corrupt; // @[MissQueue.scala 694:47 695:24]
  assign entries_3_io_mem_finish_ready = io_mem_finish_ready & allowed_1_3; // @[Arbiter.scala 123:31]
  assign entries_3_io_refill_pipe_req_ready = refill_pipe_req_arb_io_in_3_ready; // @[DCacheWrapper.scala 211:9]
  assign entries_3_io_refill_pipe_resp = io_refill_pipe_resp_valid & io_refill_pipe_resp_bits == 2'h3; // @[MissQueue.scala 698:58]
  assign entries_3_io_replace_pipe_req_ready = replace_pipe_req_arb_io_in_3_ready; // @[DCacheWrapper.scala 223:9]
  assign entries_3_io_replace_pipe_resp = io_replace_pipe_resp_valid & io_replace_pipe_resp_bits == 2'h3; // @[MissQueue.scala 699:60]
  assign entries_3_io_main_pipe_req_ready = main_pipe_req_arb_io_in_3_ready; // @[DCacheWrapper.scala 263:9]
  assign entries_3_io_main_pipe_resp = io_main_pipe_resp_valid & io_main_pipe_resp_bits_ack_miss_queue &
    io_main_pipe_resp_bits_miss_id == 2'h3; // @[MissQueue.scala 700:95]
  assign refill_pipe_req_arb_io_in_0_valid = entries_0_io_refill_pipe_req_valid; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_0_bits_source = entries_0_io_refill_pipe_req_bits_source; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_0_bits_addr = entries_0_io_refill_pipe_req_bits_addr; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_0_bits_way_en = entries_0_io_refill_pipe_req_bits_way_en; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_0_bits_alias = entries_0_io_refill_pipe_req_bits_alias; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_0_bits_miss_id = entries_0_io_refill_pipe_req_bits_miss_id; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_0_bits_id = entries_0_io_refill_pipe_req_bits_id; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_0_bits_error = entries_0_io_refill_pipe_req_bits_error; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_0_bits_prefetch = entries_0_io_refill_pipe_req_bits_prefetch; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_0_bits_wmask = entries_0_io_refill_pipe_req_bits_wmask; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_0_bits_data_0 = entries_0_io_refill_pipe_req_bits_data_0; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_0_bits_data_1 = entries_0_io_refill_pipe_req_bits_data_1; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_0_bits_data_2 = entries_0_io_refill_pipe_req_bits_data_2; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_0_bits_data_3 = entries_0_io_refill_pipe_req_bits_data_3; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_0_bits_data_4 = entries_0_io_refill_pipe_req_bits_data_4; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_0_bits_data_5 = entries_0_io_refill_pipe_req_bits_data_5; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_0_bits_data_6 = entries_0_io_refill_pipe_req_bits_data_6; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_0_bits_data_7 = entries_0_io_refill_pipe_req_bits_data_7; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_0_bits_meta_coh_state = entries_0_io_refill_pipe_req_bits_meta_coh_state; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_1_valid = entries_1_io_refill_pipe_req_valid; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_1_bits_source = entries_1_io_refill_pipe_req_bits_source; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_1_bits_addr = entries_1_io_refill_pipe_req_bits_addr; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_1_bits_way_en = entries_1_io_refill_pipe_req_bits_way_en; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_1_bits_alias = entries_1_io_refill_pipe_req_bits_alias; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_1_bits_miss_id = entries_1_io_refill_pipe_req_bits_miss_id; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_1_bits_id = entries_1_io_refill_pipe_req_bits_id; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_1_bits_error = entries_1_io_refill_pipe_req_bits_error; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_1_bits_prefetch = entries_1_io_refill_pipe_req_bits_prefetch; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_1_bits_wmask = entries_1_io_refill_pipe_req_bits_wmask; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_1_bits_data_0 = entries_1_io_refill_pipe_req_bits_data_0; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_1_bits_data_1 = entries_1_io_refill_pipe_req_bits_data_1; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_1_bits_data_2 = entries_1_io_refill_pipe_req_bits_data_2; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_1_bits_data_3 = entries_1_io_refill_pipe_req_bits_data_3; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_1_bits_data_4 = entries_1_io_refill_pipe_req_bits_data_4; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_1_bits_data_5 = entries_1_io_refill_pipe_req_bits_data_5; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_1_bits_data_6 = entries_1_io_refill_pipe_req_bits_data_6; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_1_bits_data_7 = entries_1_io_refill_pipe_req_bits_data_7; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_1_bits_meta_coh_state = entries_1_io_refill_pipe_req_bits_meta_coh_state; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_2_valid = entries_2_io_refill_pipe_req_valid; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_2_bits_source = entries_2_io_refill_pipe_req_bits_source; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_2_bits_addr = entries_2_io_refill_pipe_req_bits_addr; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_2_bits_way_en = entries_2_io_refill_pipe_req_bits_way_en; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_2_bits_alias = entries_2_io_refill_pipe_req_bits_alias; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_2_bits_miss_id = entries_2_io_refill_pipe_req_bits_miss_id; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_2_bits_id = entries_2_io_refill_pipe_req_bits_id; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_2_bits_error = entries_2_io_refill_pipe_req_bits_error; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_2_bits_prefetch = entries_2_io_refill_pipe_req_bits_prefetch; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_2_bits_wmask = entries_2_io_refill_pipe_req_bits_wmask; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_2_bits_data_0 = entries_2_io_refill_pipe_req_bits_data_0; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_2_bits_data_1 = entries_2_io_refill_pipe_req_bits_data_1; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_2_bits_data_2 = entries_2_io_refill_pipe_req_bits_data_2; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_2_bits_data_3 = entries_2_io_refill_pipe_req_bits_data_3; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_2_bits_data_4 = entries_2_io_refill_pipe_req_bits_data_4; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_2_bits_data_5 = entries_2_io_refill_pipe_req_bits_data_5; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_2_bits_data_6 = entries_2_io_refill_pipe_req_bits_data_6; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_2_bits_data_7 = entries_2_io_refill_pipe_req_bits_data_7; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_2_bits_meta_coh_state = entries_2_io_refill_pipe_req_bits_meta_coh_state; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_3_valid = entries_3_io_refill_pipe_req_valid; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_3_bits_source = entries_3_io_refill_pipe_req_bits_source; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_3_bits_addr = entries_3_io_refill_pipe_req_bits_addr; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_3_bits_way_en = entries_3_io_refill_pipe_req_bits_way_en; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_3_bits_alias = entries_3_io_refill_pipe_req_bits_alias; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_3_bits_miss_id = entries_3_io_refill_pipe_req_bits_miss_id; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_3_bits_id = entries_3_io_refill_pipe_req_bits_id; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_3_bits_error = entries_3_io_refill_pipe_req_bits_error; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_3_bits_prefetch = entries_3_io_refill_pipe_req_bits_prefetch; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_3_bits_wmask = entries_3_io_refill_pipe_req_bits_wmask; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_3_bits_data_0 = entries_3_io_refill_pipe_req_bits_data_0; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_3_bits_data_1 = entries_3_io_refill_pipe_req_bits_data_1; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_3_bits_data_2 = entries_3_io_refill_pipe_req_bits_data_2; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_3_bits_data_3 = entries_3_io_refill_pipe_req_bits_data_3; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_3_bits_data_4 = entries_3_io_refill_pipe_req_bits_data_4; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_3_bits_data_5 = entries_3_io_refill_pipe_req_bits_data_5; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_3_bits_data_6 = entries_3_io_refill_pipe_req_bits_data_6; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_3_bits_data_7 = entries_3_io_refill_pipe_req_bits_data_7; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_in_3_bits_meta_coh_state = entries_3_io_refill_pipe_req_bits_meta_coh_state; // @[DCacheWrapper.scala 211:9]
  assign refill_pipe_req_arb_io_out_ready = pipelineReg_24_io_in_ready; // @[MemCommon.scala 398:23 MissQueue.scala 715:33]
  assign pipelineReg_clock = clock;
  assign pipelineReg_reset = reset;
  assign pipelineReg_io_in_valid = refill_pipe_req_arb_io_out_valid; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_io_in_bits_addr = refill_pipe_req_arb_io_out_bits_addr; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_io_in_bits_way_en = refill_pipe_req_arb_io_out_bits_way_en; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_io_in_bits_alias = refill_pipe_req_arb_io_out_bits_alias; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_io_out_ready = io_refill_pipe_req_dup_0_ready; // @[MemCommon.scala 399:11]
  assign pipelineReg_1_clock = clock;
  assign pipelineReg_1_reset = reset;
  assign pipelineReg_1_io_in_valid = refill_pipe_req_arb_io_out_valid; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_1_io_in_bits_addr = refill_pipe_req_arb_io_out_bits_addr; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_1_io_in_bits_way_en = refill_pipe_req_arb_io_out_bits_way_en; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_1_io_in_bits_alias = refill_pipe_req_arb_io_out_bits_alias; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_1_io_out_ready = io_refill_pipe_req_dup_1_ready; // @[MemCommon.scala 399:11]
  assign pipelineReg_2_clock = clock;
  assign pipelineReg_2_reset = reset;
  assign pipelineReg_2_io_in_valid = refill_pipe_req_arb_io_out_valid; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_2_io_in_bits_addr = refill_pipe_req_arb_io_out_bits_addr; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_2_io_in_bits_way_en = refill_pipe_req_arb_io_out_bits_way_en; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_2_io_in_bits_alias = refill_pipe_req_arb_io_out_bits_alias; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_2_io_out_ready = io_refill_pipe_req_dup_2_ready; // @[MemCommon.scala 399:11]
  assign pipelineReg_3_clock = clock;
  assign pipelineReg_3_reset = reset;
  assign pipelineReg_3_io_in_valid = refill_pipe_req_arb_io_out_valid; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_3_io_in_bits_addr = refill_pipe_req_arb_io_out_bits_addr; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_3_io_in_bits_way_en = refill_pipe_req_arb_io_out_bits_way_en; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_3_io_in_bits_alias = refill_pipe_req_arb_io_out_bits_alias; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_3_io_out_ready = io_refill_pipe_req_dup_3_ready; // @[MemCommon.scala 399:11]
  assign pipelineReg_4_clock = clock;
  assign pipelineReg_4_reset = reset;
  assign pipelineReg_4_io_in_valid = refill_pipe_req_arb_io_out_valid; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_4_io_in_bits_addr = refill_pipe_req_arb_io_out_bits_addr; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_4_io_in_bits_way_en = refill_pipe_req_arb_io_out_bits_way_en; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_4_io_in_bits_alias = refill_pipe_req_arb_io_out_bits_alias; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_4_io_out_ready = io_refill_pipe_req_dup_4_ready; // @[MemCommon.scala 399:11]
  assign pipelineReg_5_clock = clock;
  assign pipelineReg_5_reset = reset;
  assign pipelineReg_5_io_in_valid = refill_pipe_req_arb_io_out_valid; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_5_io_in_bits_addr = refill_pipe_req_arb_io_out_bits_addr; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_5_io_in_bits_way_en = refill_pipe_req_arb_io_out_bits_way_en; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_5_io_in_bits_alias = refill_pipe_req_arb_io_out_bits_alias; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_5_io_out_ready = io_refill_pipe_req_dup_5_ready; // @[MemCommon.scala 399:11]
  assign pipelineReg_6_clock = clock;
  assign pipelineReg_6_reset = reset;
  assign pipelineReg_6_io_in_valid = refill_pipe_req_arb_io_out_valid; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_6_io_in_bits_addr = refill_pipe_req_arb_io_out_bits_addr; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_6_io_in_bits_way_en = refill_pipe_req_arb_io_out_bits_way_en; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_6_io_in_bits_alias = refill_pipe_req_arb_io_out_bits_alias; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_6_io_out_ready = io_refill_pipe_req_dup_6_ready; // @[MemCommon.scala 399:11]
  assign pipelineReg_7_clock = clock;
  assign pipelineReg_7_reset = reset;
  assign pipelineReg_7_io_in_valid = refill_pipe_req_arb_io_out_valid; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_7_io_in_bits_addr = refill_pipe_req_arb_io_out_bits_addr; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_7_io_in_bits_way_en = refill_pipe_req_arb_io_out_bits_way_en; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_7_io_in_bits_alias = refill_pipe_req_arb_io_out_bits_alias; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_7_io_out_ready = io_refill_pipe_req_dup_7_ready; // @[MemCommon.scala 399:11]
  assign pipelineReg_8_clock = clock;
  assign pipelineReg_8_reset = reset;
  assign pipelineReg_8_io_in_valid = refill_pipe_req_arb_io_out_valid; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_8_io_in_bits_addr = refill_pipe_req_arb_io_out_bits_addr; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_8_io_in_bits_way_en = refill_pipe_req_arb_io_out_bits_way_en; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_8_io_in_bits_alias = refill_pipe_req_arb_io_out_bits_alias; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_8_io_out_ready = io_refill_pipe_req_dup_8_ready; // @[MemCommon.scala 399:11]
  assign pipelineReg_9_clock = clock;
  assign pipelineReg_9_reset = reset;
  assign pipelineReg_9_io_in_valid = refill_pipe_req_arb_io_out_valid; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_9_io_in_bits_addr = refill_pipe_req_arb_io_out_bits_addr; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_9_io_in_bits_way_en = refill_pipe_req_arb_io_out_bits_way_en; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_9_io_in_bits_alias = refill_pipe_req_arb_io_out_bits_alias; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_9_io_out_ready = io_refill_pipe_req_dup_9_ready; // @[MemCommon.scala 399:11]
  assign pipelineReg_10_clock = clock;
  assign pipelineReg_10_reset = reset;
  assign pipelineReg_10_io_in_valid = refill_pipe_req_arb_io_out_valid; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_10_io_in_bits_addr = refill_pipe_req_arb_io_out_bits_addr; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_10_io_in_bits_way_en = refill_pipe_req_arb_io_out_bits_way_en; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_10_io_in_bits_alias = refill_pipe_req_arb_io_out_bits_alias; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_10_io_out_ready = io_refill_pipe_req_dup_10_ready; // @[MemCommon.scala 399:11]
  assign pipelineReg_11_clock = clock;
  assign pipelineReg_11_reset = reset;
  assign pipelineReg_11_io_in_valid = refill_pipe_req_arb_io_out_valid; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_11_io_in_bits_addr = refill_pipe_req_arb_io_out_bits_addr; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_11_io_in_bits_way_en = refill_pipe_req_arb_io_out_bits_way_en; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_11_io_in_bits_alias = refill_pipe_req_arb_io_out_bits_alias; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_11_io_out_ready = io_refill_pipe_req_dup_11_ready; // @[MemCommon.scala 399:11]
  assign pipelineReg_12_clock = clock;
  assign pipelineReg_12_reset = reset;
  assign pipelineReg_12_io_in_valid = refill_pipe_req_arb_io_out_valid; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_12_io_in_bits_addr = refill_pipe_req_arb_io_out_bits_addr; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_12_io_in_bits_way_en = refill_pipe_req_arb_io_out_bits_way_en; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_12_io_in_bits_alias = refill_pipe_req_arb_io_out_bits_alias; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_12_io_out_ready = io_refill_pipe_req_dup_12_ready; // @[MemCommon.scala 399:11]
  assign pipelineReg_13_clock = clock;
  assign pipelineReg_13_reset = reset;
  assign pipelineReg_13_io_in_valid = refill_pipe_req_arb_io_out_valid; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_13_io_in_bits_addr = refill_pipe_req_arb_io_out_bits_addr; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_13_io_in_bits_way_en = refill_pipe_req_arb_io_out_bits_way_en; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_13_io_in_bits_alias = refill_pipe_req_arb_io_out_bits_alias; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_13_io_out_ready = io_refill_pipe_req_dup_13_ready; // @[MemCommon.scala 399:11]
  assign pipelineReg_14_clock = clock;
  assign pipelineReg_14_reset = reset;
  assign pipelineReg_14_io_in_valid = refill_pipe_req_arb_io_out_valid; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_14_io_in_bits_addr = refill_pipe_req_arb_io_out_bits_addr; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_14_io_in_bits_way_en = refill_pipe_req_arb_io_out_bits_way_en; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_14_io_in_bits_alias = refill_pipe_req_arb_io_out_bits_alias; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_14_io_out_ready = io_refill_pipe_req_dup_14_ready; // @[MemCommon.scala 399:11]
  assign pipelineReg_15_clock = clock;
  assign pipelineReg_15_reset = reset;
  assign pipelineReg_15_io_in_valid = refill_pipe_req_arb_io_out_valid; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_15_io_in_bits_addr = refill_pipe_req_arb_io_out_bits_addr; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_15_io_in_bits_way_en = refill_pipe_req_arb_io_out_bits_way_en; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_15_io_in_bits_alias = refill_pipe_req_arb_io_out_bits_alias; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_15_io_out_ready = io_refill_pipe_req_dup_15_ready; // @[MemCommon.scala 399:11]
  assign pipelineReg_16_clock = clock;
  assign pipelineReg_16_reset = reset;
  assign pipelineReg_16_io_in_valid = refill_pipe_req_arb_io_out_valid; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_16_io_in_bits_addr = refill_pipe_req_arb_io_out_bits_addr; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_16_io_in_bits_way_en = refill_pipe_req_arb_io_out_bits_way_en; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_16_io_in_bits_alias = refill_pipe_req_arb_io_out_bits_alias; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_16_io_out_ready = io_refill_pipe_req_dup_16_ready; // @[MemCommon.scala 399:11]
  assign pipelineReg_17_clock = clock;
  assign pipelineReg_17_reset = reset;
  assign pipelineReg_17_io_in_valid = refill_pipe_req_arb_io_out_valid; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_17_io_in_bits_addr = refill_pipe_req_arb_io_out_bits_addr; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_17_io_in_bits_way_en = refill_pipe_req_arb_io_out_bits_way_en; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_17_io_in_bits_alias = refill_pipe_req_arb_io_out_bits_alias; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_17_io_out_ready = io_refill_pipe_req_dup_17_ready; // @[MemCommon.scala 399:11]
  assign pipelineReg_18_clock = clock;
  assign pipelineReg_18_reset = reset;
  assign pipelineReg_18_io_in_valid = refill_pipe_req_arb_io_out_valid; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_18_io_in_bits_addr = refill_pipe_req_arb_io_out_bits_addr; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_18_io_in_bits_way_en = refill_pipe_req_arb_io_out_bits_way_en; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_18_io_in_bits_alias = refill_pipe_req_arb_io_out_bits_alias; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_18_io_out_ready = io_refill_pipe_req_dup_18_ready; // @[MemCommon.scala 399:11]
  assign pipelineReg_19_clock = clock;
  assign pipelineReg_19_reset = reset;
  assign pipelineReg_19_io_in_valid = refill_pipe_req_arb_io_out_valid; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_19_io_in_bits_addr = refill_pipe_req_arb_io_out_bits_addr; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_19_io_in_bits_way_en = refill_pipe_req_arb_io_out_bits_way_en; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_19_io_in_bits_alias = refill_pipe_req_arb_io_out_bits_alias; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_19_io_out_ready = io_refill_pipe_req_dup_19_ready; // @[MemCommon.scala 399:11]
  assign pipelineReg_20_clock = clock;
  assign pipelineReg_20_reset = reset;
  assign pipelineReg_20_io_in_valid = refill_pipe_req_arb_io_out_valid; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_20_io_in_bits_addr = refill_pipe_req_arb_io_out_bits_addr; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_20_io_in_bits_way_en = refill_pipe_req_arb_io_out_bits_way_en; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_20_io_in_bits_alias = refill_pipe_req_arb_io_out_bits_alias; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_20_io_out_ready = io_refill_pipe_req_dup_20_ready; // @[MemCommon.scala 399:11]
  assign pipelineReg_21_clock = clock;
  assign pipelineReg_21_reset = reset;
  assign pipelineReg_21_io_in_valid = refill_pipe_req_arb_io_out_valid; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_21_io_in_bits_addr = refill_pipe_req_arb_io_out_bits_addr; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_21_io_in_bits_way_en = refill_pipe_req_arb_io_out_bits_way_en; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_21_io_in_bits_alias = refill_pipe_req_arb_io_out_bits_alias; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_21_io_out_ready = io_refill_pipe_req_dup_21_ready; // @[MemCommon.scala 399:11]
  assign pipelineReg_22_clock = clock;
  assign pipelineReg_22_reset = reset;
  assign pipelineReg_22_io_in_valid = refill_pipe_req_arb_io_out_valid; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_22_io_in_bits_addr = refill_pipe_req_arb_io_out_bits_addr; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_22_io_in_bits_way_en = refill_pipe_req_arb_io_out_bits_way_en; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_22_io_in_bits_alias = refill_pipe_req_arb_io_out_bits_alias; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_22_io_out_ready = io_refill_pipe_req_dup_22_ready; // @[MemCommon.scala 399:11]
  assign pipelineReg_23_clock = clock;
  assign pipelineReg_23_reset = reset;
  assign pipelineReg_23_io_in_valid = refill_pipe_req_arb_io_out_valid; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_23_io_in_bits_addr = refill_pipe_req_arb_io_out_bits_addr; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_23_io_in_bits_way_en = refill_pipe_req_arb_io_out_bits_way_en; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_23_io_in_bits_alias = refill_pipe_req_arb_io_out_bits_alias; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_23_io_out_ready = io_refill_pipe_req_dup_23_ready; // @[MemCommon.scala 399:11]
  assign pipelineReg_24_clock = clock;
  assign pipelineReg_24_reset = reset;
  assign pipelineReg_24_io_in_valid = refill_pipe_req_arb_io_out_valid; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_24_io_in_bits_source = refill_pipe_req_arb_io_out_bits_source; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_24_io_in_bits_addr = refill_pipe_req_arb_io_out_bits_addr; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_24_io_in_bits_way_en = refill_pipe_req_arb_io_out_bits_way_en; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_24_io_in_bits_alias = refill_pipe_req_arb_io_out_bits_alias; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_24_io_in_bits_miss_id = refill_pipe_req_arb_io_out_bits_miss_id; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_24_io_in_bits_id = refill_pipe_req_arb_io_out_bits_id; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_24_io_in_bits_error = refill_pipe_req_arb_io_out_bits_error; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_24_io_in_bits_prefetch = refill_pipe_req_arb_io_out_bits_prefetch; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_24_io_in_bits_wmask = refill_pipe_req_arb_io_out_bits_wmask; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_24_io_in_bits_data_0 = refill_pipe_req_arb_io_out_bits_data_0; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_24_io_in_bits_data_1 = refill_pipe_req_arb_io_out_bits_data_1; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_24_io_in_bits_data_2 = refill_pipe_req_arb_io_out_bits_data_2; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_24_io_in_bits_data_3 = refill_pipe_req_arb_io_out_bits_data_3; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_24_io_in_bits_data_4 = refill_pipe_req_arb_io_out_bits_data_4; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_24_io_in_bits_data_5 = refill_pipe_req_arb_io_out_bits_data_5; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_24_io_in_bits_data_6 = refill_pipe_req_arb_io_out_bits_data_6; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_24_io_in_bits_data_7 = refill_pipe_req_arb_io_out_bits_data_7; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_24_io_in_bits_meta_coh_state = refill_pipe_req_arb_io_out_bits_meta_coh_state; // @[MissQueue.scala 715:33 DCacheWrapper.scala 213:9]
  assign pipelineReg_24_io_out_ready = io_refill_pipe_req_ready; // @[MemCommon.scala 399:11]
  assign replace_pipe_req_arb_io_in_0_valid = entries_0_io_replace_pipe_req_valid; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_0_bits_miss = 1'h0; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_0_bits_miss_id = entries_0_io_replace_pipe_req_bits_miss_id; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_0_bits_miss_param = 2'h0; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_0_bits_miss_dirty = 1'h0; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_0_bits_miss_way_en = 8'h0; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_0_bits_probe = 1'h0; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_0_bits_probe_param = 2'h0; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_0_bits_probe_need_data = 1'h0; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_0_bits_source = 4'h0; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_0_bits_cmd = 5'h0; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_0_bits_vaddr = entries_0_io_replace_pipe_req_bits_vaddr; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_0_bits_addr = entries_0_io_replace_pipe_req_bits_addr; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_0_bits_store_data = 512'h0; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_0_bits_store_mask = 64'h0; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_0_bits_word_idx = 3'h0; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_0_bits_amo_data = 64'h0; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_0_bits_amo_mask = 8'h0; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_0_bits_error = 1'h0; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_0_bits_replace = 1'h1; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_0_bits_replace_way_en = entries_0_io_replace_pipe_req_bits_replace_way_en; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_0_bits_id = 4'h0; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_1_valid = entries_1_io_replace_pipe_req_valid; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_1_bits_miss = 1'h0; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_1_bits_miss_id = entries_1_io_replace_pipe_req_bits_miss_id; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_1_bits_miss_param = 2'h0; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_1_bits_miss_dirty = 1'h0; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_1_bits_miss_way_en = 8'h0; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_1_bits_probe = 1'h0; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_1_bits_probe_param = 2'h0; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_1_bits_probe_need_data = 1'h0; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_1_bits_source = 4'h0; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_1_bits_cmd = 5'h0; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_1_bits_vaddr = entries_1_io_replace_pipe_req_bits_vaddr; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_1_bits_addr = entries_1_io_replace_pipe_req_bits_addr; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_1_bits_store_data = 512'h0; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_1_bits_store_mask = 64'h0; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_1_bits_word_idx = 3'h0; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_1_bits_amo_data = 64'h0; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_1_bits_amo_mask = 8'h0; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_1_bits_error = 1'h0; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_1_bits_replace = 1'h1; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_1_bits_replace_way_en = entries_1_io_replace_pipe_req_bits_replace_way_en; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_1_bits_id = 4'h0; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_2_valid = entries_2_io_replace_pipe_req_valid; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_2_bits_miss_id = entries_2_io_replace_pipe_req_bits_miss_id; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_2_bits_probe = 1'h0; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_2_bits_probe_param = 2'h0; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_2_bits_probe_need_data = 1'h0; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_2_bits_source = 4'h0; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_2_bits_cmd = 5'h0; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_2_bits_vaddr = entries_2_io_replace_pipe_req_bits_vaddr; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_2_bits_addr = entries_2_io_replace_pipe_req_bits_addr; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_2_bits_store_data = 512'h0; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_2_bits_store_mask = 64'h0; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_2_bits_replace = 1'h1; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_2_bits_replace_way_en = entries_2_io_replace_pipe_req_bits_replace_way_en; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_2_bits_id = 4'h0; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_3_valid = entries_3_io_replace_pipe_req_valid; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_3_bits_miss = 1'h0; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_3_bits_miss_id = entries_3_io_replace_pipe_req_bits_miss_id; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_3_bits_miss_param = 2'h0; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_3_bits_miss_dirty = 1'h0; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_3_bits_miss_way_en = 8'h0; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_3_bits_probe = 1'h0; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_3_bits_probe_param = 2'h0; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_3_bits_probe_need_data = 1'h0; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_3_bits_source = 4'h0; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_3_bits_cmd = 5'h0; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_3_bits_vaddr = entries_3_io_replace_pipe_req_bits_vaddr; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_3_bits_addr = entries_3_io_replace_pipe_req_bits_addr; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_3_bits_store_data = 512'h0; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_3_bits_store_mask = 64'h0; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_3_bits_word_idx = 3'h0; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_3_bits_amo_data = 64'h0; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_3_bits_amo_mask = 8'h0; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_3_bits_error = 1'h0; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_3_bits_replace = 1'h1; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_3_bits_replace_way_en = entries_3_io_replace_pipe_req_bits_replace_way_en; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_in_3_bits_id = 4'h0; // @[DCacheWrapper.scala 223:9]
  assign replace_pipe_req_arb_io_out_ready = pipelineReg_25_io_in_ready; // @[MemCommon.scala 398:23]
  assign pipelineReg_25_clock = clock;
  assign pipelineReg_25_reset = reset;
  assign pipelineReg_25_io_in_valid = replace_pipe_req_arb_io_out_valid; // @[MemCommon.scala 398:23]
  assign pipelineReg_25_io_in_bits_miss = replace_pipe_req_arb_io_out_bits_miss; // @[MemCommon.scala 398:23]
  assign pipelineReg_25_io_in_bits_miss_id = replace_pipe_req_arb_io_out_bits_miss_id; // @[MemCommon.scala 398:23]
  assign pipelineReg_25_io_in_bits_miss_param = replace_pipe_req_arb_io_out_bits_miss_param; // @[MemCommon.scala 398:23]
  assign pipelineReg_25_io_in_bits_miss_dirty = replace_pipe_req_arb_io_out_bits_miss_dirty; // @[MemCommon.scala 398:23]
  assign pipelineReg_25_io_in_bits_miss_way_en = replace_pipe_req_arb_io_out_bits_miss_way_en; // @[MemCommon.scala 398:23]
  assign pipelineReg_25_io_in_bits_probe = replace_pipe_req_arb_io_out_bits_probe; // @[MemCommon.scala 398:23]
  assign pipelineReg_25_io_in_bits_probe_param = replace_pipe_req_arb_io_out_bits_probe_param; // @[MemCommon.scala 398:23]
  assign pipelineReg_25_io_in_bits_probe_need_data = replace_pipe_req_arb_io_out_bits_probe_need_data; // @[MemCommon.scala 398:23]
  assign pipelineReg_25_io_in_bits_source = replace_pipe_req_arb_io_out_bits_source; // @[MemCommon.scala 398:23]
  assign pipelineReg_25_io_in_bits_cmd = replace_pipe_req_arb_io_out_bits_cmd; // @[MemCommon.scala 398:23]
  assign pipelineReg_25_io_in_bits_vaddr = replace_pipe_req_arb_io_out_bits_vaddr; // @[MemCommon.scala 398:23]
  assign pipelineReg_25_io_in_bits_addr = replace_pipe_req_arb_io_out_bits_addr; // @[MemCommon.scala 398:23]
  assign pipelineReg_25_io_in_bits_store_data = replace_pipe_req_arb_io_out_bits_store_data; // @[MemCommon.scala 398:23]
  assign pipelineReg_25_io_in_bits_store_mask = replace_pipe_req_arb_io_out_bits_store_mask; // @[MemCommon.scala 398:23]
  assign pipelineReg_25_io_in_bits_word_idx = replace_pipe_req_arb_io_out_bits_word_idx; // @[MemCommon.scala 398:23]
  assign pipelineReg_25_io_in_bits_amo_data = replace_pipe_req_arb_io_out_bits_amo_data; // @[MemCommon.scala 398:23]
  assign pipelineReg_25_io_in_bits_amo_mask = replace_pipe_req_arb_io_out_bits_amo_mask; // @[MemCommon.scala 398:23]
  assign pipelineReg_25_io_in_bits_error = replace_pipe_req_arb_io_out_bits_error; // @[MemCommon.scala 398:23]
  assign pipelineReg_25_io_in_bits_replace = replace_pipe_req_arb_io_out_bits_replace; // @[MemCommon.scala 398:23]
  assign pipelineReg_25_io_in_bits_replace_way_en = replace_pipe_req_arb_io_out_bits_replace_way_en; // @[MemCommon.scala 398:23]
  assign pipelineReg_25_io_in_bits_id = replace_pipe_req_arb_io_out_bits_id; // @[MemCommon.scala 398:23]
  assign pipelineReg_25_io_out_ready = io_replace_pipe_req_ready; // @[MemCommon.scala 399:11]
  assign main_pipe_req_arb_clock = clock;
  assign main_pipe_req_arb_reset = reset;
  assign main_pipe_req_arb_io_in_0_valid = entries_0_io_main_pipe_req_valid; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_0_bits_miss_id = entries_0_io_main_pipe_req_bits_miss_id; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_0_bits_miss_param = entries_0_io_main_pipe_req_bits_miss_param; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_0_bits_miss_dirty = entries_0_io_main_pipe_req_bits_miss_dirty; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_0_bits_miss_way_en = entries_0_io_main_pipe_req_bits_miss_way_en; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_0_bits_source = entries_0_io_main_pipe_req_bits_source; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_0_bits_cmd = entries_0_io_main_pipe_req_bits_cmd; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_0_bits_vaddr = entries_0_io_main_pipe_req_bits_vaddr; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_0_bits_addr = entries_0_io_main_pipe_req_bits_addr; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_0_bits_store_data = entries_0_io_main_pipe_req_bits_store_data; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_0_bits_word_idx = entries_0_io_main_pipe_req_bits_word_idx; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_0_bits_amo_data = entries_0_io_main_pipe_req_bits_amo_data; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_0_bits_amo_mask = entries_0_io_main_pipe_req_bits_amo_mask; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_0_bits_error = entries_0_io_main_pipe_req_bits_error; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_0_bits_id = entries_0_io_main_pipe_req_bits_id; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_1_valid = entries_1_io_main_pipe_req_valid; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_1_bits_miss_id = entries_1_io_main_pipe_req_bits_miss_id; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_1_bits_miss_param = entries_1_io_main_pipe_req_bits_miss_param; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_1_bits_miss_dirty = entries_1_io_main_pipe_req_bits_miss_dirty; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_1_bits_miss_way_en = entries_1_io_main_pipe_req_bits_miss_way_en; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_1_bits_source = entries_1_io_main_pipe_req_bits_source; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_1_bits_cmd = entries_1_io_main_pipe_req_bits_cmd; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_1_bits_vaddr = entries_1_io_main_pipe_req_bits_vaddr; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_1_bits_addr = entries_1_io_main_pipe_req_bits_addr; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_1_bits_store_data = entries_1_io_main_pipe_req_bits_store_data; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_1_bits_word_idx = entries_1_io_main_pipe_req_bits_word_idx; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_1_bits_amo_data = entries_1_io_main_pipe_req_bits_amo_data; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_1_bits_amo_mask = entries_1_io_main_pipe_req_bits_amo_mask; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_1_bits_error = entries_1_io_main_pipe_req_bits_error; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_1_bits_id = entries_1_io_main_pipe_req_bits_id; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_2_valid = entries_2_io_main_pipe_req_valid; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_2_bits_miss_id = entries_2_io_main_pipe_req_bits_miss_id; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_2_bits_miss_param = entries_2_io_main_pipe_req_bits_miss_param; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_2_bits_miss_dirty = entries_2_io_main_pipe_req_bits_miss_dirty; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_2_bits_miss_way_en = entries_2_io_main_pipe_req_bits_miss_way_en; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_2_bits_source = entries_2_io_main_pipe_req_bits_source; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_2_bits_cmd = entries_2_io_main_pipe_req_bits_cmd; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_2_bits_vaddr = entries_2_io_main_pipe_req_bits_vaddr; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_2_bits_addr = entries_2_io_main_pipe_req_bits_addr; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_2_bits_store_data = entries_2_io_main_pipe_req_bits_store_data; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_2_bits_word_idx = entries_2_io_main_pipe_req_bits_word_idx; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_2_bits_amo_data = entries_2_io_main_pipe_req_bits_amo_data; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_2_bits_amo_mask = entries_2_io_main_pipe_req_bits_amo_mask; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_2_bits_error = entries_2_io_main_pipe_req_bits_error; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_2_bits_id = entries_2_io_main_pipe_req_bits_id; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_3_valid = entries_3_io_main_pipe_req_valid; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_3_bits_miss_id = entries_3_io_main_pipe_req_bits_miss_id; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_3_bits_miss_param = entries_3_io_main_pipe_req_bits_miss_param; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_3_bits_miss_dirty = entries_3_io_main_pipe_req_bits_miss_dirty; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_3_bits_miss_way_en = entries_3_io_main_pipe_req_bits_miss_way_en; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_3_bits_source = entries_3_io_main_pipe_req_bits_source; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_3_bits_cmd = entries_3_io_main_pipe_req_bits_cmd; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_3_bits_vaddr = entries_3_io_main_pipe_req_bits_vaddr; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_3_bits_addr = entries_3_io_main_pipe_req_bits_addr; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_3_bits_store_data = entries_3_io_main_pipe_req_bits_store_data; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_3_bits_word_idx = entries_3_io_main_pipe_req_bits_word_idx; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_3_bits_amo_data = entries_3_io_main_pipe_req_bits_amo_data; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_3_bits_amo_mask = entries_3_io_main_pipe_req_bits_amo_mask; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_3_bits_error = entries_3_io_main_pipe_req_bits_error; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_in_3_bits_id = entries_3_io_main_pipe_req_bits_id; // @[DCacheWrapper.scala 263:9]
  assign main_pipe_req_arb_io_out_ready = io_main_pipe_req_ready; // @[DCacheWrapper.scala 265:9]
  assign writer_clock = clock; // @[ChiselDB.scala 135:21]
  assign writer_reset = reset; // @[ChiselDB.scala 136:21]
  assign writer_en = io_req_valid & ~io_req_bits_cancel & alloc; // @[MissQueue.scala 742:67]
  assign writer_stamp = cnt; // @[ChiselDB.scala 138:21]
  assign writer_data_vaddr = io_req_bits_vaddr; // @[MissQueue.scala 735:30 736:26]
  assign writer_data_paddr = io_req_bits_addr; // @[MissQueue.scala 735:30 737:26]
  assign writer_data_source = io_req_bits_source; // @[MissQueue.scala 735:30 738:27]
  assign writer_data_pc = 39'h0; // @[MissQueue.scala 735:30 739:23]
  always @(posedge clock) begin
    if (io_req_valid) begin // @[Reg.scala 17:18]
      req_data_buffer_store_data <= io_req_bits_store_data; // @[Reg.scala 17:22]
    end
    if (io_req_valid) begin // @[Reg.scala 17:18]
      req_data_buffer_store_mask <= io_req_bits_store_mask; // @[Reg.scala 17:22]
    end
    io_forward_0_forward_result_valid_REG <= io_forward_0_valid & _GEN_30 & io_forward_0_paddr[35:6] == _GEN_34[35:6]; // @[DCacheWrapper.scala 590:35]
    io_forward_1_forward_result_valid_REG <= io_forward_1_valid & _GEN_63 & io_forward_1_paddr[35:6] == _GEN_67[35:6]; // @[DCacheWrapper.scala 590:35]
    perfValidCount <= _perfValidCount_T_4 + _perfValidCount_T_6; // @[Bitwise.scala 48:55]
    io_perf_0_value_REG <= io_req_ready & io_req_valid; // @[Decoupled.scala 50:35]
    io_perf_0_value_REG_1 <= io_perf_0_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_1_value_REG <= perfValidCount < 3'h1; // @[MissQueue.scala 777:48]
    io_perf_1_value_REG_1 <= io_perf_1_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_2_value_REG <= perfValidCount > 3'h1 & perfValidCount <= _T_222; // @[MissQueue.scala 778:76]
    io_perf_2_value_REG_1 <= io_perf_2_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_3_value_REG <= perfValidCount > _T_222 & _GEN_133 <= _T_228; // @[MissQueue.scala 779:76]
    io_perf_3_value_REG_1 <= io_perf_3_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_4_value_REG <= _GEN_133 > _T_228; // @[MissQueue.scala 780:48]
    io_perf_4_value_REG_1 <= io_perf_4_value_REG; // @[PerfCounterUtils.scala 188:27]
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWrapper.scala 594:81]
      forward_mshr <= 1'h0;
    end else begin
      forward_mshr <= ~io_forward_0_paddr[5] & _GEN_5 | _all_match_T_5;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWrapper.scala 616:38]
      forwardData__0 <= 8'h0;
    end else begin
      forwardData__0 <= selected_data[7:0];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWrapper.scala 616:38]
      forwardData__1 <= 8'h0;
    end else begin
      forwardData__1 <= selected_data[15:8];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWrapper.scala 616:38]
      forwardData__2 <= 8'h0;
    end else begin
      forwardData__2 <= selected_data[23:16];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWrapper.scala 616:38]
      forwardData__3 <= 8'h0;
    end else begin
      forwardData__3 <= selected_data[31:24];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWrapper.scala 616:38]
      forwardData__4 <= 8'h0;
    end else begin
      forwardData__4 <= selected_data[39:32];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWrapper.scala 616:38]
      forwardData__5 <= 8'h0;
    end else begin
      forwardData__5 <= selected_data[47:40];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWrapper.scala 616:38]
      forwardData__6 <= 8'h0;
    end else begin
      forwardData__6 <= selected_data[55:48];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWrapper.scala 616:38]
      forwardData__7 <= 8'h0;
    end else begin
      forwardData__7 <= selected_data[63:56];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWrapper.scala 616:38]
      forwardData__8 <= 8'h0;
    end else begin
      forwardData__8 <= selected_data[71:64];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWrapper.scala 616:38]
      forwardData__9 <= 8'h0;
    end else begin
      forwardData__9 <= selected_data[79:72];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWrapper.scala 616:38]
      forwardData__10 <= 8'h0;
    end else begin
      forwardData__10 <= selected_data[87:80];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWrapper.scala 616:38]
      forwardData__11 <= 8'h0;
    end else begin
      forwardData__11 <= selected_data[95:88];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWrapper.scala 616:38]
      forwardData__12 <= 8'h0;
    end else begin
      forwardData__12 <= selected_data[103:96];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWrapper.scala 616:38]
      forwardData__13 <= 8'h0;
    end else begin
      forwardData__13 <= selected_data[111:104];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWrapper.scala 616:38]
      forwardData__14 <= 8'h0;
    end else begin
      forwardData__14 <= selected_data[119:112];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWrapper.scala 616:38]
      forwardData__15 <= 8'h0;
    end else begin
      forwardData__15 <= selected_data[127:120];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWrapper.scala 594:81]
      forward_mshr_1 <= 1'h0;
    end else begin
      forward_mshr_1 <= ~io_forward_1_paddr[5] & _GEN_38 | _all_match_T_11;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWrapper.scala 616:38]
      forwardData_1_0 <= 8'h0;
    end else begin
      forwardData_1_0 <= selected_data_1[7:0];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWrapper.scala 616:38]
      forwardData_1_1 <= 8'h0;
    end else begin
      forwardData_1_1 <= selected_data_1[15:8];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWrapper.scala 616:38]
      forwardData_1_2 <= 8'h0;
    end else begin
      forwardData_1_2 <= selected_data_1[23:16];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWrapper.scala 616:38]
      forwardData_1_3 <= 8'h0;
    end else begin
      forwardData_1_3 <= selected_data_1[31:24];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWrapper.scala 616:38]
      forwardData_1_4 <= 8'h0;
    end else begin
      forwardData_1_4 <= selected_data_1[39:32];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWrapper.scala 616:38]
      forwardData_1_5 <= 8'h0;
    end else begin
      forwardData_1_5 <= selected_data_1[47:40];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWrapper.scala 616:38]
      forwardData_1_6 <= 8'h0;
    end else begin
      forwardData_1_6 <= selected_data_1[55:48];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWrapper.scala 616:38]
      forwardData_1_7 <= 8'h0;
    end else begin
      forwardData_1_7 <= selected_data_1[63:56];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWrapper.scala 616:38]
      forwardData_1_8 <= 8'h0;
    end else begin
      forwardData_1_8 <= selected_data_1[71:64];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWrapper.scala 616:38]
      forwardData_1_9 <= 8'h0;
    end else begin
      forwardData_1_9 <= selected_data_1[79:72];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWrapper.scala 616:38]
      forwardData_1_10 <= 8'h0;
    end else begin
      forwardData_1_10 <= selected_data_1[87:80];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWrapper.scala 616:38]
      forwardData_1_11 <= 8'h0;
    end else begin
      forwardData_1_11 <= selected_data_1[95:88];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWrapper.scala 616:38]
      forwardData_1_12 <= 8'h0;
    end else begin
      forwardData_1_12 <= selected_data_1[103:96];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWrapper.scala 616:38]
      forwardData_1_13 <= 8'h0;
    end else begin
      forwardData_1_13 <= selected_data_1[111:104];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWrapper.scala 616:38]
      forwardData_1_14 <= 8'h0;
    end else begin
      forwardData_1_14 <= selected_data_1[119:112];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWrapper.scala 616:38]
      forwardData_1_15 <= 8'h0;
    end else begin
      forwardData_1_15 <= selected_data_1[127:120];
    end
  end
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
    if (reset) begin // @[Arbiter.scala 118:30]
      state__2 <= 1'h0;
    end else if (idle) begin
      state__2 <= earlyWinner__2;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Arbiter.scala 118:30]
      state__3 <= 1'h0;
    end else if (idle) begin
      state__3 <= earlyWinner__3;
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
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Arbiter.scala 118:30]
      state_1_2 <= 1'h0;
    end else if (idle_1) begin
      state_1_2 <= earlyWinner_1_2;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Arbiter.scala 118:30]
      state_1_3 <= 1'h0;
    end else if (idle_1) begin
      state_1_3 <= earlyWinner_1_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[ChiselDB.scala 134:16]
      cnt <= 64'h0;
    end else begin
      cnt <= cnt + 64'h1;
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
  _RAND_0 = {16{`RANDOM}};
  req_data_buffer_store_data = _RAND_0[511:0];
  _RAND_1 = {2{`RANDOM}};
  req_data_buffer_store_mask = _RAND_1[63:0];
  _RAND_2 = {1{`RANDOM}};
  forward_mshr = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  forwardData__0 = _RAND_3[7:0];
  _RAND_4 = {1{`RANDOM}};
  forwardData__1 = _RAND_4[7:0];
  _RAND_5 = {1{`RANDOM}};
  forwardData__2 = _RAND_5[7:0];
  _RAND_6 = {1{`RANDOM}};
  forwardData__3 = _RAND_6[7:0];
  _RAND_7 = {1{`RANDOM}};
  forwardData__4 = _RAND_7[7:0];
  _RAND_8 = {1{`RANDOM}};
  forwardData__5 = _RAND_8[7:0];
  _RAND_9 = {1{`RANDOM}};
  forwardData__6 = _RAND_9[7:0];
  _RAND_10 = {1{`RANDOM}};
  forwardData__7 = _RAND_10[7:0];
  _RAND_11 = {1{`RANDOM}};
  forwardData__8 = _RAND_11[7:0];
  _RAND_12 = {1{`RANDOM}};
  forwardData__9 = _RAND_12[7:0];
  _RAND_13 = {1{`RANDOM}};
  forwardData__10 = _RAND_13[7:0];
  _RAND_14 = {1{`RANDOM}};
  forwardData__11 = _RAND_14[7:0];
  _RAND_15 = {1{`RANDOM}};
  forwardData__12 = _RAND_15[7:0];
  _RAND_16 = {1{`RANDOM}};
  forwardData__13 = _RAND_16[7:0];
  _RAND_17 = {1{`RANDOM}};
  forwardData__14 = _RAND_17[7:0];
  _RAND_18 = {1{`RANDOM}};
  forwardData__15 = _RAND_18[7:0];
  _RAND_19 = {1{`RANDOM}};
  io_forward_0_forward_result_valid_REG = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  forward_mshr_1 = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  forwardData_1_0 = _RAND_21[7:0];
  _RAND_22 = {1{`RANDOM}};
  forwardData_1_1 = _RAND_22[7:0];
  _RAND_23 = {1{`RANDOM}};
  forwardData_1_2 = _RAND_23[7:0];
  _RAND_24 = {1{`RANDOM}};
  forwardData_1_3 = _RAND_24[7:0];
  _RAND_25 = {1{`RANDOM}};
  forwardData_1_4 = _RAND_25[7:0];
  _RAND_26 = {1{`RANDOM}};
  forwardData_1_5 = _RAND_26[7:0];
  _RAND_27 = {1{`RANDOM}};
  forwardData_1_6 = _RAND_27[7:0];
  _RAND_28 = {1{`RANDOM}};
  forwardData_1_7 = _RAND_28[7:0];
  _RAND_29 = {1{`RANDOM}};
  forwardData_1_8 = _RAND_29[7:0];
  _RAND_30 = {1{`RANDOM}};
  forwardData_1_9 = _RAND_30[7:0];
  _RAND_31 = {1{`RANDOM}};
  forwardData_1_10 = _RAND_31[7:0];
  _RAND_32 = {1{`RANDOM}};
  forwardData_1_11 = _RAND_32[7:0];
  _RAND_33 = {1{`RANDOM}};
  forwardData_1_12 = _RAND_33[7:0];
  _RAND_34 = {1{`RANDOM}};
  forwardData_1_13 = _RAND_34[7:0];
  _RAND_35 = {1{`RANDOM}};
  forwardData_1_14 = _RAND_35[7:0];
  _RAND_36 = {1{`RANDOM}};
  forwardData_1_15 = _RAND_36[7:0];
  _RAND_37 = {1{`RANDOM}};
  io_forward_1_forward_result_valid_REG = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  beatsLeft = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  state__0 = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  state__1 = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  state__2 = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  state__3 = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  beatsLeft_1 = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  state_1_0 = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  state_1_1 = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  state_1_2 = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  state_1_3 = _RAND_47[0:0];
  _RAND_48 = {2{`RANDOM}};
  cnt = _RAND_48[63:0];
  _RAND_49 = {1{`RANDOM}};
  perfValidCount = _RAND_49[2:0];
  _RAND_50 = {1{`RANDOM}};
  io_perf_0_value_REG = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  io_perf_0_value_REG_1 = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  io_perf_1_value_REG = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  io_perf_1_value_REG_1 = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  io_perf_2_value_REG = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  io_perf_2_value_REG_1 = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  io_perf_3_value_REG = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  io_perf_3_value_REG_1 = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  io_perf_4_value_REG = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  io_perf_4_value_REG_1 = _RAND_59[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    forward_mshr = 1'h0;
  end
  if (reset) begin
    forwardData__0 = 8'h0;
  end
  if (reset) begin
    forwardData__1 = 8'h0;
  end
  if (reset) begin
    forwardData__2 = 8'h0;
  end
  if (reset) begin
    forwardData__3 = 8'h0;
  end
  if (reset) begin
    forwardData__4 = 8'h0;
  end
  if (reset) begin
    forwardData__5 = 8'h0;
  end
  if (reset) begin
    forwardData__6 = 8'h0;
  end
  if (reset) begin
    forwardData__7 = 8'h0;
  end
  if (reset) begin
    forwardData__8 = 8'h0;
  end
  if (reset) begin
    forwardData__9 = 8'h0;
  end
  if (reset) begin
    forwardData__10 = 8'h0;
  end
  if (reset) begin
    forwardData__11 = 8'h0;
  end
  if (reset) begin
    forwardData__12 = 8'h0;
  end
  if (reset) begin
    forwardData__13 = 8'h0;
  end
  if (reset) begin
    forwardData__14 = 8'h0;
  end
  if (reset) begin
    forwardData__15 = 8'h0;
  end
  if (reset) begin
    forward_mshr_1 = 1'h0;
  end
  if (reset) begin
    forwardData_1_0 = 8'h0;
  end
  if (reset) begin
    forwardData_1_1 = 8'h0;
  end
  if (reset) begin
    forwardData_1_2 = 8'h0;
  end
  if (reset) begin
    forwardData_1_3 = 8'h0;
  end
  if (reset) begin
    forwardData_1_4 = 8'h0;
  end
  if (reset) begin
    forwardData_1_5 = 8'h0;
  end
  if (reset) begin
    forwardData_1_6 = 8'h0;
  end
  if (reset) begin
    forwardData_1_7 = 8'h0;
  end
  if (reset) begin
    forwardData_1_8 = 8'h0;
  end
  if (reset) begin
    forwardData_1_9 = 8'h0;
  end
  if (reset) begin
    forwardData_1_10 = 8'h0;
  end
  if (reset) begin
    forwardData_1_11 = 8'h0;
  end
  if (reset) begin
    forwardData_1_12 = 8'h0;
  end
  if (reset) begin
    forwardData_1_13 = 8'h0;
  end
  if (reset) begin
    forwardData_1_14 = 8'h0;
  end
  if (reset) begin
    forwardData_1_15 = 8'h0;
  end
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
    state__2 = 1'h0;
  end
  if (reset) begin
    state__3 = 1'h0;
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
  if (reset) begin
    state_1_2 = 1'h0;
  end
  if (reset) begin
    state_1_3 = 1'h0;
  end
  if (reset) begin
    cnt = 64'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

