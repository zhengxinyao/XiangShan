module MainPipe(
  input          clock,
  input          reset,
  output         io_probe_req_ready,
  input          io_probe_req_valid,
  input          io_probe_req_bits_miss,
  input  [1:0]   io_probe_req_bits_miss_id,
  input  [1:0]   io_probe_req_bits_miss_param,
  input          io_probe_req_bits_miss_dirty,
  input  [7:0]   io_probe_req_bits_miss_way_en,
  input          io_probe_req_bits_probe,
  input  [1:0]   io_probe_req_bits_probe_param,
  input          io_probe_req_bits_probe_need_data,
  input  [3:0]   io_probe_req_bits_source,
  input  [4:0]   io_probe_req_bits_cmd,
  input  [38:0]  io_probe_req_bits_vaddr,
  input  [35:0]  io_probe_req_bits_addr,
  input  [511:0] io_probe_req_bits_store_data,
  input  [63:0]  io_probe_req_bits_store_mask,
  input  [2:0]   io_probe_req_bits_word_idx,
  input  [63:0]  io_probe_req_bits_amo_data,
  input  [7:0]   io_probe_req_bits_amo_mask,
  input          io_probe_req_bits_error,
  input          io_probe_req_bits_replace,
  input  [7:0]   io_probe_req_bits_replace_way_en,
  input  [3:0]   io_probe_req_bits_id,
  input          io_miss_req_ready,
  output         io_miss_req_valid,
  output [3:0]   io_miss_req_bits_source,
  output [4:0]   io_miss_req_bits_cmd,
  output [35:0]  io_miss_req_bits_addr,
  output [38:0]  io_miss_req_bits_vaddr,
  output [7:0]   io_miss_req_bits_way_en,
  output [2:0]   io_miss_req_bits_word_idx,
  output [63:0]  io_miss_req_bits_amo_data,
  output [7:0]   io_miss_req_bits_amo_mask,
  output [1:0]   io_miss_req_bits_req_coh_state,
  output [1:0]   io_miss_req_bits_replace_coh_state,
  output [23:0]  io_miss_req_bits_replace_tag,
  output [3:0]   io_miss_req_bits_id,
  output [511:0] io_miss_req_bits_store_data,
  output [63:0]  io_miss_req_bits_store_mask,
  output         io_store_req_ready,
  input          io_store_req_valid,
  input  [38:0]  io_store_req_bits_vaddr,
  input  [35:0]  io_store_req_bits_addr,
  input  [511:0] io_store_req_bits_data,
  input  [63:0]  io_store_req_bits_mask,
  input  [3:0]   io_store_req_bits_id,
  output         io_store_replay_resp_valid,
  output [3:0]   io_store_replay_resp_bits_id,
  output         io_store_hit_resp_valid,
  output [3:0]   io_store_hit_resp_bits_id,
  output         io_release_update_valid,
  output [35:0]  io_release_update_bits_addr,
  output [7:0]   io_release_update_bits_mask,
  output [511:0] io_release_update_bits_data,
  output         io_atomic_req_ready,
  input          io_atomic_req_valid,
  input          io_atomic_req_bits_miss,
  input  [1:0]   io_atomic_req_bits_miss_id,
  input  [1:0]   io_atomic_req_bits_miss_param,
  input          io_atomic_req_bits_miss_dirty,
  input  [7:0]   io_atomic_req_bits_miss_way_en,
  input          io_atomic_req_bits_probe,
  input  [1:0]   io_atomic_req_bits_probe_param,
  input          io_atomic_req_bits_probe_need_data,
  input  [3:0]   io_atomic_req_bits_source,
  input  [4:0]   io_atomic_req_bits_cmd,
  input  [38:0]  io_atomic_req_bits_vaddr,
  input  [35:0]  io_atomic_req_bits_addr,
  input  [511:0] io_atomic_req_bits_store_data,
  input  [63:0]  io_atomic_req_bits_store_mask,
  input  [2:0]   io_atomic_req_bits_word_idx,
  input  [63:0]  io_atomic_req_bits_amo_data,
  input  [7:0]   io_atomic_req_bits_amo_mask,
  input          io_atomic_req_bits_error,
  input          io_atomic_req_bits_replace,
  input  [7:0]   io_atomic_req_bits_replace_way_en,
  input  [3:0]   io_atomic_req_bits_id,
  output         io_atomic_resp_valid,
  output [63:0]  io_atomic_resp_bits_data,
  output         io_atomic_resp_bits_miss,
  output [1:0]   io_atomic_resp_bits_miss_id,
  output         io_atomic_resp_bits_replay,
  output         io_atomic_resp_bits_error,
  output         io_atomic_resp_bits_ack_miss_queue,
  output [3:0]   io_atomic_resp_bits_id,
  output         io_replace_req_ready,
  input          io_replace_req_valid,
  input          io_replace_req_bits_miss,
  input  [1:0]   io_replace_req_bits_miss_id,
  input  [1:0]   io_replace_req_bits_miss_param,
  input          io_replace_req_bits_miss_dirty,
  input  [7:0]   io_replace_req_bits_miss_way_en,
  input          io_replace_req_bits_probe,
  input  [1:0]   io_replace_req_bits_probe_param,
  input          io_replace_req_bits_probe_need_data,
  input  [3:0]   io_replace_req_bits_source,
  input  [4:0]   io_replace_req_bits_cmd,
  input  [38:0]  io_replace_req_bits_vaddr,
  input  [35:0]  io_replace_req_bits_addr,
  input  [511:0] io_replace_req_bits_store_data,
  input  [63:0]  io_replace_req_bits_store_mask,
  input  [2:0]   io_replace_req_bits_word_idx,
  input  [63:0]  io_replace_req_bits_amo_data,
  input  [7:0]   io_replace_req_bits_amo_mask,
  input          io_replace_req_bits_error,
  input          io_replace_req_bits_replace,
  input  [7:0]   io_replace_req_bits_replace_way_en,
  input  [3:0]   io_replace_req_bits_id,
  output         io_replace_resp_valid,
  output [1:0]   io_replace_resp_bits,
  input          io_wb_ready,
  output         io_wb_valid,
  output [2:0]   io_wb_bits_param,
  output         io_wb_bits_voluntary,
  output         io_wb_bits_hasData,
  output         io_wb_bits_dirty,
  output         io_wb_bits_delay_release,
  output [1:0]   io_wb_bits_miss_id,
  output [35:0]  io_wb_bits_addr,
  output [511:0] io_wb_bits_data,
  input          io_wb_ready_dup_0,
  input          io_wb_ready_dup_1,
  input          io_wb_ready_dup_2,
  input          io_wb_ready_dup_3,
  input          io_wb_ready_dup_4,
  input          io_wb_ready_dup_5,
  input          io_wb_ready_dup_6,
  input          io_wb_ready_dup_7,
  input          io_wb_ready_dup_8,
  input          io_wb_ready_dup_9,
  input          io_wb_ready_dup_10,
  input          io_wb_ready_dup_11,
  output         io_probe_ttob_check_req_valid,
  output [35:0]  io_probe_ttob_check_req_bits_addr,
  input          io_probe_ttob_check_resp_bits_toN,
  input          io_data_read_ready,
  output         io_data_read_valid,
  output [7:0]   io_data_read_bits_way_en,
  output [35:0]  io_data_read_bits_addr,
  input  [63:0]  io_data_resp_0_raw_data,
  input  [63:0]  io_data_resp_1_raw_data,
  input  [63:0]  io_data_resp_2_raw_data,
  input  [63:0]  io_data_resp_3_raw_data,
  input  [63:0]  io_data_resp_4_raw_data,
  input  [63:0]  io_data_resp_5_raw_data,
  input  [63:0]  io_data_resp_6_raw_data,
  input  [63:0]  io_data_resp_7_raw_data,
  input          io_readline_error_delayed,
  input          io_data_write_ready,
  output         io_data_write_valid,
  output [7:0]   io_data_write_bits_wmask,
  output [63:0]  io_data_write_bits_data_0,
  output [63:0]  io_data_write_bits_data_1,
  output [63:0]  io_data_write_bits_data_2,
  output [63:0]  io_data_write_bits_data_3,
  output [63:0]  io_data_write_bits_data_4,
  output [63:0]  io_data_write_bits_data_5,
  output [63:0]  io_data_write_bits_data_6,
  output [63:0]  io_data_write_bits_data_7,
  output         io_data_write_dup_0_valid,
  output [7:0]   io_data_write_dup_0_bits_way_en,
  output [35:0]  io_data_write_dup_0_bits_addr,
  output         io_data_write_dup_1_valid,
  output [7:0]   io_data_write_dup_1_bits_way_en,
  output [35:0]  io_data_write_dup_1_bits_addr,
  output         io_data_write_dup_2_valid,
  output [7:0]   io_data_write_dup_2_bits_way_en,
  output [35:0]  io_data_write_dup_2_bits_addr,
  output         io_data_write_dup_3_valid,
  output [7:0]   io_data_write_dup_3_bits_way_en,
  output [35:0]  io_data_write_dup_3_bits_addr,
  output         io_data_write_dup_4_valid,
  output [7:0]   io_data_write_dup_4_bits_way_en,
  output [35:0]  io_data_write_dup_4_bits_addr,
  output         io_data_write_dup_5_valid,
  output [7:0]   io_data_write_dup_5_bits_way_en,
  output [35:0]  io_data_write_dup_5_bits_addr,
  output         io_data_write_dup_6_valid,
  output [7:0]   io_data_write_dup_6_bits_way_en,
  output [35:0]  io_data_write_dup_6_bits_addr,
  output         io_data_write_dup_7_valid,
  output [7:0]   io_data_write_dup_7_bits_way_en,
  output [35:0]  io_data_write_dup_7_bits_addr,
  input          io_data_write_ready_dup_0,
  input          io_data_write_ready_dup_1,
  input          io_data_write_ready_dup_2,
  input          io_data_write_ready_dup_3,
  input          io_data_write_ready_dup_4,
  input          io_data_write_ready_dup_5,
  input          io_data_write_ready_dup_6,
  input          io_data_write_ready_dup_7,
  input          io_data_write_ready_dup_8,
  input          io_data_write_ready_dup_9,
  input          io_data_write_ready_dup_10,
  input          io_data_write_ready_dup_11,
  output         io_meta_read_valid,
  output [5:0]   io_meta_read_bits_idx,
  input  [1:0]   io_meta_resp_0_coh_state,
  input  [1:0]   io_meta_resp_1_coh_state,
  input  [1:0]   io_meta_resp_2_coh_state,
  input  [1:0]   io_meta_resp_3_coh_state,
  input  [1:0]   io_meta_resp_4_coh_state,
  input  [1:0]   io_meta_resp_5_coh_state,
  input  [1:0]   io_meta_resp_6_coh_state,
  input  [1:0]   io_meta_resp_7_coh_state,
  output         io_meta_write_valid,
  output [5:0]   io_meta_write_bits_idx,
  output [7:0]   io_meta_write_bits_way_en,
  output [1:0]   io_meta_write_bits_meta_coh_state,
  input          io_extra_meta_resp_0_error,
  input          io_extra_meta_resp_1_error,
  input          io_extra_meta_resp_2_error,
  input          io_extra_meta_resp_3_error,
  input          io_extra_meta_resp_4_error,
  input          io_extra_meta_resp_5_error,
  input          io_extra_meta_resp_6_error,
  input          io_extra_meta_resp_7_error,
  output         io_error_flag_write_valid,
  output [5:0]   io_error_flag_write_bits_idx,
  output [7:0]   io_error_flag_write_bits_way_en,
  output         io_error_flag_write_bits_flag,
  input          io_tag_read_ready,
  output         io_tag_read_valid,
  output [5:0]   io_tag_read_bits_idx,
  input  [29:0]  io_tag_resp_0,
  input  [29:0]  io_tag_resp_1,
  input  [29:0]  io_tag_resp_2,
  input  [29:0]  io_tag_resp_3,
  input  [29:0]  io_tag_resp_4,
  input  [29:0]  io_tag_resp_5,
  input  [29:0]  io_tag_resp_6,
  input  [29:0]  io_tag_resp_7,
  input          io_tag_write_ready,
  output         io_tag_write_valid,
  output [5:0]   io_tag_write_bits_idx,
  output [7:0]   io_tag_write_bits_way_en,
  output [23:0]  io_tag_write_bits_tag,
  input          io_tag_write_ready_dup_0,
  input          io_tag_write_ready_dup_1,
  input          io_tag_write_ready_dup_2,
  input          io_tag_write_ready_dup_3,
  input          io_tag_write_ready_dup_4,
  input          io_tag_write_ready_dup_5,
  input          io_tag_write_ready_dup_6,
  input          io_tag_write_ready_dup_7,
  input          io_tag_write_ready_dup_8,
  input          io_tag_write_ready_dup_9,
  input          io_tag_write_ready_dup_10,
  input          io_tag_write_ready_dup_11,
  output         io_tag_write_intend,
  output         io_replace_access_valid,
  output [5:0]   io_replace_access_bits_set,
  output [2:0]   io_replace_access_bits_way,
  output [5:0]   io_replace_way_set_bits,
  input  [2:0]   io_replace_way_way,
  output         io_status_s1_valid,
  output [5:0]   io_status_s1_bits_set,
  output         io_status_s2_valid,
  output [5:0]   io_status_s2_bits_set,
  output [7:0]   io_status_s2_bits_way_en,
  output         io_status_s3_valid,
  output [5:0]   io_status_s3_bits_set,
  output [7:0]   io_status_s3_bits_way_en,
  output         io_status_dup_0_s1_valid,
  output [5:0]   io_status_dup_0_s1_bits_set,
  output [7:0]   io_status_dup_0_s1_bits_way_en,
  output         io_status_dup_0_s2_valid,
  output [5:0]   io_status_dup_0_s2_bits_set,
  output [7:0]   io_status_dup_0_s2_bits_way_en,
  output         io_status_dup_0_s3_valid,
  output [5:0]   io_status_dup_0_s3_bits_set,
  output [7:0]   io_status_dup_0_s3_bits_way_en,
  output         io_status_dup_1_s1_valid,
  output [5:0]   io_status_dup_1_s1_bits_set,
  output [7:0]   io_status_dup_1_s1_bits_way_en,
  output         io_status_dup_1_s2_valid,
  output [5:0]   io_status_dup_1_s2_bits_set,
  output [7:0]   io_status_dup_1_s2_bits_way_en,
  output         io_status_dup_1_s3_valid,
  output [5:0]   io_status_dup_1_s3_bits_set,
  output [7:0]   io_status_dup_1_s3_bits_way_en,
  output         io_status_dup_2_s1_valid,
  output [5:0]   io_status_dup_2_s1_bits_set,
  output [7:0]   io_status_dup_2_s1_bits_way_en,
  output         io_status_dup_2_s2_valid,
  output [5:0]   io_status_dup_2_s2_bits_set,
  output [7:0]   io_status_dup_2_s2_bits_way_en,
  output         io_status_dup_2_s3_valid,
  output [5:0]   io_status_dup_2_s3_bits_set,
  output [7:0]   io_status_dup_2_s3_bits_way_en,
  output         io_status_dup_3_s1_valid,
  output [5:0]   io_status_dup_3_s1_bits_set,
  output [7:0]   io_status_dup_3_s1_bits_way_en,
  output         io_status_dup_3_s2_valid,
  output [5:0]   io_status_dup_3_s2_bits_set,
  output [7:0]   io_status_dup_3_s2_bits_way_en,
  output         io_status_dup_3_s3_valid,
  output [5:0]   io_status_dup_3_s3_bits_set,
  output [7:0]   io_status_dup_3_s3_bits_way_en,
  output         io_status_dup_4_s1_valid,
  output [5:0]   io_status_dup_4_s1_bits_set,
  output [7:0]   io_status_dup_4_s1_bits_way_en,
  output         io_status_dup_4_s2_valid,
  output [5:0]   io_status_dup_4_s2_bits_set,
  output [7:0]   io_status_dup_4_s2_bits_way_en,
  output         io_status_dup_4_s3_valid,
  output [5:0]   io_status_dup_4_s3_bits_set,
  output [7:0]   io_status_dup_4_s3_bits_way_en,
  output         io_status_dup_5_s1_valid,
  output [5:0]   io_status_dup_5_s1_bits_set,
  output [7:0]   io_status_dup_5_s1_bits_way_en,
  output         io_status_dup_5_s2_valid,
  output [5:0]   io_status_dup_5_s2_bits_set,
  output [7:0]   io_status_dup_5_s2_bits_way_en,
  output         io_status_dup_5_s3_valid,
  output [5:0]   io_status_dup_5_s3_bits_set,
  output [7:0]   io_status_dup_5_s3_bits_way_en,
  output         io_status_dup_6_s1_valid,
  output [5:0]   io_status_dup_6_s1_bits_set,
  output [7:0]   io_status_dup_6_s1_bits_way_en,
  output         io_status_dup_6_s2_valid,
  output [5:0]   io_status_dup_6_s2_bits_set,
  output [7:0]   io_status_dup_6_s2_bits_way_en,
  output         io_status_dup_6_s3_valid,
  output [5:0]   io_status_dup_6_s3_bits_set,
  output [7:0]   io_status_dup_6_s3_bits_way_en,
  output         io_status_dup_7_s1_valid,
  output [5:0]   io_status_dup_7_s1_bits_set,
  output [7:0]   io_status_dup_7_s1_bits_way_en,
  output         io_status_dup_7_s2_valid,
  output [5:0]   io_status_dup_7_s2_bits_set,
  output [7:0]   io_status_dup_7_s2_bits_way_en,
  output         io_status_dup_7_s3_valid,
  output [5:0]   io_status_dup_7_s3_bits_set,
  output [7:0]   io_status_dup_7_s3_bits_way_en,
  output         io_status_dup_8_s1_valid,
  output [5:0]   io_status_dup_8_s1_bits_set,
  output [7:0]   io_status_dup_8_s1_bits_way_en,
  output         io_status_dup_8_s2_valid,
  output [5:0]   io_status_dup_8_s2_bits_set,
  output [7:0]   io_status_dup_8_s2_bits_way_en,
  output         io_status_dup_8_s3_valid,
  output [5:0]   io_status_dup_8_s3_bits_set,
  output [7:0]   io_status_dup_8_s3_bits_way_en,
  output         io_status_dup_9_s1_valid,
  output [5:0]   io_status_dup_9_s1_bits_set,
  output [7:0]   io_status_dup_9_s1_bits_way_en,
  output         io_status_dup_9_s2_valid,
  output [5:0]   io_status_dup_9_s2_bits_set,
  output [7:0]   io_status_dup_9_s2_bits_way_en,
  output         io_status_dup_9_s3_valid,
  output [5:0]   io_status_dup_9_s3_bits_set,
  output [7:0]   io_status_dup_9_s3_bits_way_en,
  output         io_status_dup_10_s1_valid,
  output [5:0]   io_status_dup_10_s1_bits_set,
  output [7:0]   io_status_dup_10_s1_bits_way_en,
  output         io_status_dup_10_s2_valid,
  output [5:0]   io_status_dup_10_s2_bits_set,
  output [7:0]   io_status_dup_10_s2_bits_way_en,
  output         io_status_dup_10_s3_valid,
  output [5:0]   io_status_dup_10_s3_bits_set,
  output [7:0]   io_status_dup_10_s3_bits_way_en,
  output         io_status_dup_11_s1_valid,
  output [5:0]   io_status_dup_11_s1_bits_set,
  output [7:0]   io_status_dup_11_s1_bits_way_en,
  output         io_status_dup_11_s2_valid,
  output [5:0]   io_status_dup_11_s2_bits_set,
  output [7:0]   io_status_dup_11_s2_bits_way_en,
  output         io_status_dup_11_s3_valid,
  output [5:0]   io_status_dup_11_s3_bits_set,
  output [7:0]   io_status_dup_11_s3_bits_way_en,
  output         io_status_dup_12_s1_valid,
  output [5:0]   io_status_dup_12_s1_bits_set,
  output [7:0]   io_status_dup_12_s1_bits_way_en,
  output         io_status_dup_12_s2_valid,
  output [5:0]   io_status_dup_12_s2_bits_set,
  output [7:0]   io_status_dup_12_s2_bits_way_en,
  output         io_status_dup_12_s3_valid,
  output [5:0]   io_status_dup_12_s3_bits_set,
  output [7:0]   io_status_dup_12_s3_bits_way_en,
  output         io_status_dup_13_s1_valid,
  output [5:0]   io_status_dup_13_s1_bits_set,
  output [7:0]   io_status_dup_13_s1_bits_way_en,
  output         io_status_dup_13_s2_valid,
  output [5:0]   io_status_dup_13_s2_bits_set,
  output [7:0]   io_status_dup_13_s2_bits_way_en,
  output         io_status_dup_13_s3_valid,
  output [5:0]   io_status_dup_13_s3_bits_set,
  output [7:0]   io_status_dup_13_s3_bits_way_en,
  output         io_status_dup_14_s1_valid,
  output [5:0]   io_status_dup_14_s1_bits_set,
  output [7:0]   io_status_dup_14_s1_bits_way_en,
  output         io_status_dup_14_s2_valid,
  output [5:0]   io_status_dup_14_s2_bits_set,
  output [7:0]   io_status_dup_14_s2_bits_way_en,
  output         io_status_dup_14_s3_valid,
  output [5:0]   io_status_dup_14_s3_bits_set,
  output [7:0]   io_status_dup_14_s3_bits_way_en,
  output         io_status_dup_15_s1_valid,
  output [5:0]   io_status_dup_15_s1_bits_set,
  output [7:0]   io_status_dup_15_s1_bits_way_en,
  output         io_status_dup_15_s2_valid,
  output [5:0]   io_status_dup_15_s2_bits_set,
  output [7:0]   io_status_dup_15_s2_bits_way_en,
  output         io_status_dup_15_s3_valid,
  output [5:0]   io_status_dup_15_s3_bits_set,
  output [7:0]   io_status_dup_15_s3_bits_way_en,
  output         io_status_dup_16_s1_valid,
  output [5:0]   io_status_dup_16_s1_bits_set,
  output [7:0]   io_status_dup_16_s1_bits_way_en,
  output         io_status_dup_16_s2_valid,
  output [5:0]   io_status_dup_16_s2_bits_set,
  output [7:0]   io_status_dup_16_s2_bits_way_en,
  output         io_status_dup_16_s3_valid,
  output [5:0]   io_status_dup_16_s3_bits_set,
  output [7:0]   io_status_dup_16_s3_bits_way_en,
  output         io_status_dup_17_s1_valid,
  output [5:0]   io_status_dup_17_s1_bits_set,
  output [7:0]   io_status_dup_17_s1_bits_way_en,
  output         io_status_dup_17_s2_valid,
  output [5:0]   io_status_dup_17_s2_bits_set,
  output [7:0]   io_status_dup_17_s2_bits_way_en,
  output         io_status_dup_17_s3_valid,
  output [5:0]   io_status_dup_17_s3_bits_set,
  output [7:0]   io_status_dup_17_s3_bits_way_en,
  output         io_status_dup_18_s1_valid,
  output [5:0]   io_status_dup_18_s1_bits_set,
  output [7:0]   io_status_dup_18_s1_bits_way_en,
  output         io_status_dup_18_s2_valid,
  output [5:0]   io_status_dup_18_s2_bits_set,
  output [7:0]   io_status_dup_18_s2_bits_way_en,
  output         io_status_dup_18_s3_valid,
  output [5:0]   io_status_dup_18_s3_bits_set,
  output [7:0]   io_status_dup_18_s3_bits_way_en,
  output         io_status_dup_19_s1_valid,
  output [5:0]   io_status_dup_19_s1_bits_set,
  output [7:0]   io_status_dup_19_s1_bits_way_en,
  output         io_status_dup_19_s2_valid,
  output [5:0]   io_status_dup_19_s2_bits_set,
  output [7:0]   io_status_dup_19_s2_bits_way_en,
  output         io_status_dup_19_s3_valid,
  output [5:0]   io_status_dup_19_s3_bits_set,
  output [7:0]   io_status_dup_19_s3_bits_way_en,
  output         io_status_dup_20_s1_valid,
  output [5:0]   io_status_dup_20_s1_bits_set,
  output [7:0]   io_status_dup_20_s1_bits_way_en,
  output         io_status_dup_20_s2_valid,
  output [5:0]   io_status_dup_20_s2_bits_set,
  output [7:0]   io_status_dup_20_s2_bits_way_en,
  output         io_status_dup_20_s3_valid,
  output [5:0]   io_status_dup_20_s3_bits_set,
  output [7:0]   io_status_dup_20_s3_bits_way_en,
  output         io_status_dup_21_s1_valid,
  output [5:0]   io_status_dup_21_s1_bits_set,
  output [7:0]   io_status_dup_21_s1_bits_way_en,
  output         io_status_dup_21_s2_valid,
  output [5:0]   io_status_dup_21_s2_bits_set,
  output [7:0]   io_status_dup_21_s2_bits_way_en,
  output         io_status_dup_21_s3_valid,
  output [5:0]   io_status_dup_21_s3_bits_set,
  output [7:0]   io_status_dup_21_s3_bits_way_en,
  output         io_status_dup_22_s1_valid,
  output [5:0]   io_status_dup_22_s1_bits_set,
  output [7:0]   io_status_dup_22_s1_bits_way_en,
  output         io_status_dup_22_s2_valid,
  output [5:0]   io_status_dup_22_s2_bits_set,
  output [7:0]   io_status_dup_22_s2_bits_way_en,
  output         io_status_dup_22_s3_valid,
  output [5:0]   io_status_dup_22_s3_bits_set,
  output [7:0]   io_status_dup_22_s3_bits_way_en,
  output         io_status_dup_23_s1_valid,
  output [5:0]   io_status_dup_23_s1_bits_set,
  output [7:0]   io_status_dup_23_s1_bits_way_en,
  output         io_status_dup_23_s2_valid,
  output [5:0]   io_status_dup_23_s2_bits_set,
  output [7:0]   io_status_dup_23_s2_bits_way_en,
  output         io_status_dup_23_s3_valid,
  output [5:0]   io_status_dup_23_s3_bits_set,
  output [7:0]   io_status_dup_23_s3_bits_way_en,
  output         io_lrsc_locked_block_valid,
  output [35:0]  io_lrsc_locked_block_bits,
  input          io_invalid_resv_set,
  output         io_update_resv_set,
  output         io_block_lr,
  output         io_error_source_tag,
  output         io_error_source_data,
  output         io_error_source_l2,
  output         io_error_opType_store,
  output         io_error_opType_probe,
  output         io_error_opType_release,
  output         io_error_opType_atom,
  output [35:0]  io_error_paddr,
  output         io_error_report_to_beu,
  output         io_error_valid,
  output [5:0]   io_perf_0_value,
  output [5:0]   io_perf_1_value
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [63:0] _RAND_3;
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
  reg [63:0] _RAND_38;
  reg [63:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
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
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [63:0] _RAND_62;
  reg [511:0] _RAND_63;
  reg [63:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [63:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [63:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_78;
  reg [31:0] _RAND_79;
  reg [31:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_85;
  reg [31:0] _RAND_86;
  reg [31:0] _RAND_87;
  reg [31:0] _RAND_88;
  reg [31:0] _RAND_89;
  reg [31:0] _RAND_90;
  reg [31:0] _RAND_91;
  reg [31:0] _RAND_92;
  reg [31:0] _RAND_93;
  reg [31:0] _RAND_94;
  reg [31:0] _RAND_95;
  reg [31:0] _RAND_96;
  reg [31:0] _RAND_97;
  reg [31:0] _RAND_98;
  reg [31:0] _RAND_99;
  reg [31:0] _RAND_100;
  reg [31:0] _RAND_101;
  reg [31:0] _RAND_102;
  reg [31:0] _RAND_103;
  reg [31:0] _RAND_104;
  reg [31:0] _RAND_105;
  reg [31:0] _RAND_106;
  reg [31:0] _RAND_107;
  reg [31:0] _RAND_108;
  reg [31:0] _RAND_109;
  reg [31:0] _RAND_110;
  reg [31:0] _RAND_111;
  reg [31:0] _RAND_112;
  reg [31:0] _RAND_113;
  reg [31:0] _RAND_114;
  reg [31:0] _RAND_115;
  reg [31:0] _RAND_116;
  reg [31:0] _RAND_117;
  reg [31:0] _RAND_118;
  reg [31:0] _RAND_119;
  reg [31:0] _RAND_120;
  reg [31:0] _RAND_121;
  reg [31:0] _RAND_122;
  reg [31:0] _RAND_123;
  reg [31:0] _RAND_124;
  reg [31:0] _RAND_125;
  reg [31:0] _RAND_126;
  reg [31:0] _RAND_127;
  reg [31:0] _RAND_128;
  reg [31:0] _RAND_129;
  reg [31:0] _RAND_130;
  reg [31:0] _RAND_131;
  reg [31:0] _RAND_132;
  reg [31:0] _RAND_133;
  reg [31:0] _RAND_134;
  reg [31:0] _RAND_135;
  reg [31:0] _RAND_136;
  reg [63:0] _RAND_137;
  reg [511:0] _RAND_138;
  reg [63:0] _RAND_139;
  reg [31:0] _RAND_140;
  reg [63:0] _RAND_141;
  reg [31:0] _RAND_142;
  reg [31:0] _RAND_143;
  reg [31:0] _RAND_144;
  reg [31:0] _RAND_145;
  reg [31:0] _RAND_146;
  reg [31:0] _RAND_147;
  reg [31:0] _RAND_148;
  reg [31:0] _RAND_149;
  reg [31:0] _RAND_150;
  reg [31:0] _RAND_151;
  reg [31:0] _RAND_152;
  reg [31:0] _RAND_153;
  reg [31:0] _RAND_154;
  reg [31:0] _RAND_155;
  reg [31:0] _RAND_156;
  reg [31:0] _RAND_157;
  reg [31:0] _RAND_158;
  reg [31:0] _RAND_159;
  reg [31:0] _RAND_160;
  reg [31:0] _RAND_161;
  reg [31:0] _RAND_162;
  reg [31:0] _RAND_163;
  reg [31:0] _RAND_164;
  reg [31:0] _RAND_165;
  reg [31:0] _RAND_166;
  reg [31:0] _RAND_167;
  reg [31:0] _RAND_168;
  reg [31:0] _RAND_169;
  reg [31:0] _RAND_170;
  reg [31:0] _RAND_171;
  reg [31:0] _RAND_172;
  reg [31:0] _RAND_173;
  reg [31:0] _RAND_174;
  reg [31:0] _RAND_175;
  reg [31:0] _RAND_176;
  reg [31:0] _RAND_177;
  reg [31:0] _RAND_178;
  reg [31:0] _RAND_179;
  reg [31:0] _RAND_180;
  reg [31:0] _RAND_181;
  reg [31:0] _RAND_182;
  reg [63:0] _RAND_183;
  reg [31:0] _RAND_184;
  reg [31:0] _RAND_185;
  reg [31:0] _RAND_186;
  reg [31:0] _RAND_187;
  reg [31:0] _RAND_188;
  reg [31:0] _RAND_189;
  reg [31:0] _RAND_190;
  reg [31:0] _RAND_191;
  reg [31:0] _RAND_192;
  reg [31:0] _RAND_193;
  reg [31:0] _RAND_194;
  reg [31:0] _RAND_195;
  reg [63:0] _RAND_196;
  reg [63:0] _RAND_197;
  reg [63:0] _RAND_198;
  reg [63:0] _RAND_199;
  reg [63:0] _RAND_200;
  reg [63:0] _RAND_201;
  reg [63:0] _RAND_202;
  reg [63:0] _RAND_203;
  reg [31:0] _RAND_204;
  reg [31:0] _RAND_205;
  reg [31:0] _RAND_206;
  reg [31:0] _RAND_207;
  reg [31:0] _RAND_208;
  reg [31:0] _RAND_209;
  reg [31:0] _RAND_210;
  reg [63:0] _RAND_211;
  reg [31:0] _RAND_212;
  reg [63:0] _RAND_213;
  reg [31:0] _RAND_214;
  reg [31:0] _RAND_215;
  reg [31:0] _RAND_216;
  reg [31:0] _RAND_217;
  reg [31:0] _RAND_218;
  reg [31:0] _RAND_219;
  reg [63:0] _RAND_220;
  reg [63:0] _RAND_221;
  reg [63:0] _RAND_222;
  reg [63:0] _RAND_223;
  reg [63:0] _RAND_224;
  reg [63:0] _RAND_225;
  reg [63:0] _RAND_226;
  reg [63:0] _RAND_227;
  reg [63:0] _RAND_228;
  reg [63:0] _RAND_229;
  reg [63:0] _RAND_230;
  reg [63:0] _RAND_231;
  reg [63:0] _RAND_232;
  reg [63:0] _RAND_233;
  reg [63:0] _RAND_234;
  reg [63:0] _RAND_235;
  reg [63:0] _RAND_236;
  reg [31:0] _RAND_237;
  reg [31:0] _RAND_238;
  reg [31:0] _RAND_239;
  reg [31:0] _RAND_240;
  reg [31:0] _RAND_241;
  reg [31:0] _RAND_242;
  reg [31:0] _RAND_243;
  reg [31:0] _RAND_244;
  reg [31:0] _RAND_245;
  reg [31:0] _RAND_246;
  reg [31:0] _RAND_247;
  reg [31:0] _RAND_248;
  reg [31:0] _RAND_249;
  reg [31:0] _RAND_250;
  reg [31:0] _RAND_251;
  reg [31:0] _RAND_252;
  reg [31:0] _RAND_253;
  reg [31:0] _RAND_254;
  reg [31:0] _RAND_255;
  reg [31:0] _RAND_256;
  reg [31:0] _RAND_257;
  reg [31:0] _RAND_258;
  reg [31:0] _RAND_259;
  reg [31:0] _RAND_260;
  reg [31:0] _RAND_261;
  reg [31:0] _RAND_262;
  reg [31:0] _RAND_263;
  reg [31:0] _RAND_264;
  reg [31:0] _RAND_265;
  reg [31:0] _RAND_266;
  reg [31:0] _RAND_267;
  reg [31:0] _RAND_268;
  reg [31:0] _RAND_269;
  reg [31:0] _RAND_270;
  reg [31:0] _RAND_271;
  reg [31:0] _RAND_272;
  reg [31:0] _RAND_273;
  reg [31:0] _RAND_274;
  reg [31:0] _RAND_275;
  reg [31:0] _RAND_276;
  reg [31:0] _RAND_277;
  reg [31:0] _RAND_278;
  reg [31:0] _RAND_279;
  reg [31:0] _RAND_280;
  reg [31:0] _RAND_281;
  reg [31:0] _RAND_282;
  reg [31:0] _RAND_283;
  reg [31:0] _RAND_284;
  reg [31:0] _RAND_285;
  reg [63:0] _RAND_286;
  reg [63:0] _RAND_287;
  reg [63:0] _RAND_288;
  reg [31:0] _RAND_289;
  reg [31:0] _RAND_290;
  reg [31:0] _RAND_291;
  reg [31:0] _RAND_292;
  reg [31:0] _RAND_293;
  reg [31:0] _RAND_294;
  reg [31:0] _RAND_295;
  reg [31:0] _RAND_296;
  reg [31:0] _RAND_297;
  reg [31:0] _RAND_298;
  reg [31:0] _RAND_299;
  reg [31:0] _RAND_300;
  reg [31:0] _RAND_301;
  reg [31:0] _RAND_302;
  reg [63:0] _RAND_303;
  reg [31:0] _RAND_304;
  reg [31:0] _RAND_305;
  reg [31:0] _RAND_306;
  reg [63:0] _RAND_307;
  reg [63:0] _RAND_308;
  reg [63:0] _RAND_309;
  reg [63:0] _RAND_310;
  reg [63:0] _RAND_311;
  reg [63:0] _RAND_312;
  reg [63:0] _RAND_313;
  reg [63:0] _RAND_314;
  reg [31:0] _RAND_315;
  reg [31:0] _RAND_316;
  reg [31:0] _RAND_317;
  reg [31:0] _RAND_318;
  reg [31:0] _RAND_319;
  reg [31:0] _RAND_320;
  reg [31:0] _RAND_321;
  reg [31:0] _RAND_322;
  reg [31:0] _RAND_323;
  reg [31:0] _RAND_324;
  reg [31:0] _RAND_325;
  reg [31:0] _RAND_326;
  reg [31:0] _RAND_327;
  reg [31:0] _RAND_328;
  reg [63:0] _RAND_329;
  reg [63:0] _RAND_330;
  reg [31:0] _RAND_331;
  reg [31:0] _RAND_332;
  reg [31:0] _RAND_333;
  reg [31:0] _RAND_334;
  reg [31:0] _RAND_335;
  reg [31:0] _RAND_336;
  reg [31:0] _RAND_337;
  reg [31:0] _RAND_338;
  reg [31:0] _RAND_339;
  reg [31:0] _RAND_340;
  reg [31:0] _RAND_341;
  reg [31:0] _RAND_342;
  reg [31:0] _RAND_343;
  reg [31:0] _RAND_344;
  reg [31:0] _RAND_345;
  reg [63:0] _RAND_346;
  reg [63:0] _RAND_347;
  reg [31:0] _RAND_348;
  reg [31:0] _RAND_349;
  reg [31:0] _RAND_350;
  reg [31:0] _RAND_351;
  reg [31:0] _RAND_352;
  reg [31:0] _RAND_353;
  reg [31:0] _RAND_354;
  reg [31:0] _RAND_355;
  reg [31:0] _RAND_356;
  reg [31:0] _RAND_357;
  reg [31:0] _RAND_358;
  reg [63:0] _RAND_359;
  reg [63:0] _RAND_360;
  reg [31:0] _RAND_361;
  reg [31:0] _RAND_362;
  reg [31:0] _RAND_363;
  reg [31:0] _RAND_364;
  reg [31:0] _RAND_365;
  reg [31:0] _RAND_366;
  reg [31:0] _RAND_367;
  reg [31:0] _RAND_368;
  reg [31:0] _RAND_369;
  reg [31:0] _RAND_370;
  reg [31:0] _RAND_371;
  reg [63:0] _RAND_372;
  reg [63:0] _RAND_373;
  reg [31:0] _RAND_374;
  reg [31:0] _RAND_375;
  reg [31:0] _RAND_376;
  reg [63:0] _RAND_377;
  reg [31:0] _RAND_378;
  reg [31:0] _RAND_379;
  reg [31:0] _RAND_380;
  reg [31:0] _RAND_381;
  reg [31:0] _RAND_382;
  reg [31:0] _RAND_383;
  reg [31:0] _RAND_384;
  reg [31:0] _RAND_385;
  reg [31:0] _RAND_386;
  reg [31:0] _RAND_387;
  reg [31:0] _RAND_388;
  reg [31:0] _RAND_389;
  reg [31:0] _RAND_390;
  reg [31:0] _RAND_391;
  reg [31:0] _RAND_392;
  reg [31:0] _RAND_393;
  reg [31:0] _RAND_394;
  reg [31:0] _RAND_395;
  reg [63:0] _RAND_396;
  reg [63:0] _RAND_397;
  reg [31:0] _RAND_398;
  reg [31:0] _RAND_399;
  reg [63:0] _RAND_400;
  reg [31:0] _RAND_401;
  reg [31:0] _RAND_402;
  reg [31:0] _RAND_403;
  reg [31:0] _RAND_404;
  reg [31:0] _RAND_405;
  reg [31:0] _RAND_406;
  reg [31:0] _RAND_407;
  reg [31:0] _RAND_408;
  reg [31:0] _RAND_409;
  reg [63:0] _RAND_410;
  reg [63:0] _RAND_411;
  reg [31:0] _RAND_412;
  reg [31:0] _RAND_413;
  reg [63:0] _RAND_414;
  reg [31:0] _RAND_415;
  reg [31:0] _RAND_416;
  reg [31:0] _RAND_417;
  reg [31:0] _RAND_418;
  reg [31:0] _RAND_419;
  reg [31:0] _RAND_420;
  reg [31:0] _RAND_421;
  reg [31:0] _RAND_422;
  reg [31:0] _RAND_423;
  reg [63:0] _RAND_424;
  reg [63:0] _RAND_425;
  reg [31:0] _RAND_426;
  reg [31:0] _RAND_427;
  reg [63:0] _RAND_428;
  reg [31:0] _RAND_429;
  reg [31:0] _RAND_430;
  reg [31:0] _RAND_431;
  reg [31:0] _RAND_432;
  reg [31:0] _RAND_433;
  reg [31:0] _RAND_434;
  reg [31:0] _RAND_435;
  reg [31:0] _RAND_436;
  reg [31:0] _RAND_437;
  reg [63:0] _RAND_438;
  reg [63:0] _RAND_439;
  reg [31:0] _RAND_440;
  reg [31:0] _RAND_441;
  reg [63:0] _RAND_442;
  reg [31:0] _RAND_443;
  reg [31:0] _RAND_444;
  reg [31:0] _RAND_445;
  reg [31:0] _RAND_446;
  reg [31:0] _RAND_447;
  reg [31:0] _RAND_448;
  reg [31:0] _RAND_449;
  reg [31:0] _RAND_450;
  reg [31:0] _RAND_451;
  reg [63:0] _RAND_452;
  reg [63:0] _RAND_453;
  reg [31:0] _RAND_454;
  reg [31:0] _RAND_455;
  reg [63:0] _RAND_456;
  reg [31:0] _RAND_457;
  reg [31:0] _RAND_458;
  reg [31:0] _RAND_459;
  reg [31:0] _RAND_460;
  reg [31:0] _RAND_461;
  reg [31:0] _RAND_462;
  reg [31:0] _RAND_463;
  reg [31:0] _RAND_464;
  reg [31:0] _RAND_465;
  reg [63:0] _RAND_466;
  reg [63:0] _RAND_467;
  reg [31:0] _RAND_468;
  reg [31:0] _RAND_469;
  reg [63:0] _RAND_470;
  reg [31:0] _RAND_471;
  reg [31:0] _RAND_472;
  reg [31:0] _RAND_473;
  reg [31:0] _RAND_474;
  reg [31:0] _RAND_475;
  reg [31:0] _RAND_476;
  reg [31:0] _RAND_477;
  reg [31:0] _RAND_478;
  reg [31:0] _RAND_479;
  reg [63:0] _RAND_480;
  reg [63:0] _RAND_481;
  reg [31:0] _RAND_482;
  reg [31:0] _RAND_483;
  reg [63:0] _RAND_484;
  reg [31:0] _RAND_485;
  reg [31:0] _RAND_486;
  reg [31:0] _RAND_487;
  reg [31:0] _RAND_488;
  reg [31:0] _RAND_489;
  reg [31:0] _RAND_490;
  reg [31:0] _RAND_491;
  reg [31:0] _RAND_492;
  reg [31:0] _RAND_493;
  reg [63:0] _RAND_494;
  reg [63:0] _RAND_495;
  reg [31:0] _RAND_496;
  reg [31:0] _RAND_497;
  reg [63:0] _RAND_498;
  reg [31:0] _RAND_499;
  reg [31:0] _RAND_500;
  reg [31:0] _RAND_501;
  reg [31:0] _RAND_502;
  reg [31:0] _RAND_503;
  reg [31:0] _RAND_504;
  reg [31:0] _RAND_505;
  reg [31:0] _RAND_506;
  reg [31:0] _RAND_507;
  reg [31:0] _RAND_508;
  reg [31:0] _RAND_509;
  reg [31:0] _RAND_510;
  reg [63:0] _RAND_511;
  reg [63:0] _RAND_512;
  reg [31:0] _RAND_513;
  reg [31:0] _RAND_514;
  reg [31:0] _RAND_515;
  reg [31:0] _RAND_516;
  reg [31:0] _RAND_517;
  reg [31:0] _RAND_518;
  reg [31:0] _RAND_519;
  reg [31:0] _RAND_520;
  reg [31:0] _RAND_521;
  reg [31:0] _RAND_522;
  reg [31:0] _RAND_523;
  reg [31:0] _RAND_524;
  reg [31:0] _RAND_525;
  reg [31:0] _RAND_526;
  reg [31:0] _RAND_527;
  reg [31:0] _RAND_528;
  reg [31:0] _RAND_529;
  reg [31:0] _RAND_530;
  reg [31:0] _RAND_531;
  reg [31:0] _RAND_532;
  reg [31:0] _RAND_533;
  reg [31:0] _RAND_534;
  reg [31:0] _RAND_535;
  reg [31:0] _RAND_536;
  reg [31:0] _RAND_537;
  reg [31:0] _RAND_538;
  reg [31:0] _RAND_539;
  reg [31:0] _RAND_540;
  reg [31:0] _RAND_541;
  reg [31:0] _RAND_542;
  reg [31:0] _RAND_543;
  reg [31:0] _RAND_544;
  reg [31:0] _RAND_545;
  reg [31:0] _RAND_546;
  reg [31:0] _RAND_547;
  reg [31:0] _RAND_548;
  reg [31:0] _RAND_549;
  reg [31:0] _RAND_550;
  reg [31:0] _RAND_551;
  reg [31:0] _RAND_552;
  reg [31:0] _RAND_553;
  reg [31:0] _RAND_554;
  reg [31:0] _RAND_555;
  reg [31:0] _RAND_556;
  reg [31:0] _RAND_557;
  reg [31:0] _RAND_558;
  reg [31:0] _RAND_559;
  reg [31:0] _RAND_560;
  reg [31:0] _RAND_561;
  reg [31:0] _RAND_562;
  reg [31:0] _RAND_563;
  reg [31:0] _RAND_564;
  reg [31:0] _RAND_565;
  reg [31:0] _RAND_566;
  reg [31:0] _RAND_567;
  reg [31:0] _RAND_568;
  reg [31:0] _RAND_569;
  reg [31:0] _RAND_570;
  reg [31:0] _RAND_571;
  reg [31:0] _RAND_572;
  reg [31:0] _RAND_573;
  reg [31:0] _RAND_574;
  reg [31:0] _RAND_575;
  reg [31:0] _RAND_576;
  reg [31:0] _RAND_577;
  reg [31:0] _RAND_578;
  reg [31:0] _RAND_579;
  reg [31:0] _RAND_580;
  reg [31:0] _RAND_581;
  reg [31:0] _RAND_582;
  reg [31:0] _RAND_583;
  reg [31:0] _RAND_584;
  reg [31:0] _RAND_585;
  reg [31:0] _RAND_586;
  reg [31:0] _RAND_587;
  reg [31:0] _RAND_588;
  reg [31:0] _RAND_589;
  reg [31:0] _RAND_590;
  reg [31:0] _RAND_591;
  reg [31:0] _RAND_592;
  reg [31:0] _RAND_593;
  reg [31:0] _RAND_594;
  reg [31:0] _RAND_595;
  reg [31:0] _RAND_596;
  reg [31:0] _RAND_597;
  reg [31:0] _RAND_598;
  reg [31:0] _RAND_599;
  reg [31:0] _RAND_600;
  reg [31:0] _RAND_601;
  reg [31:0] _RAND_602;
  reg [31:0] _RAND_603;
  reg [31:0] _RAND_604;
  reg [31:0] _RAND_605;
  reg [31:0] _RAND_606;
  reg [31:0] _RAND_607;
  reg [31:0] _RAND_608;
  reg [31:0] _RAND_609;
  reg [31:0] _RAND_610;
  reg [31:0] _RAND_611;
  reg [31:0] _RAND_612;
  reg [31:0] _RAND_613;
  reg [31:0] _RAND_614;
  reg [31:0] _RAND_615;
  reg [31:0] _RAND_616;
  reg [31:0] _RAND_617;
  reg [31:0] _RAND_618;
  reg [31:0] _RAND_619;
  reg [31:0] _RAND_620;
  reg [31:0] _RAND_621;
  reg [31:0] _RAND_622;
  reg [31:0] _RAND_623;
  reg [31:0] _RAND_624;
  reg [31:0] _RAND_625;
  reg [31:0] _RAND_626;
  reg [31:0] _RAND_627;
  reg [31:0] _RAND_628;
  reg [31:0] _RAND_629;
  reg [31:0] _RAND_630;
  reg [31:0] _RAND_631;
  reg [31:0] _RAND_632;
  reg [31:0] _RAND_633;
  reg [31:0] _RAND_634;
  reg [31:0] _RAND_635;
  reg [31:0] _RAND_636;
  reg [31:0] _RAND_637;
  reg [31:0] _RAND_638;
  reg [31:0] _RAND_639;
  reg [31:0] _RAND_640;
  reg [31:0] _RAND_641;
  reg [31:0] _RAND_642;
  reg [31:0] _RAND_643;
  reg [31:0] _RAND_644;
  reg [31:0] _RAND_645;
  reg [31:0] _RAND_646;
  reg [31:0] _RAND_647;
  reg [31:0] _RAND_648;
  reg [31:0] _RAND_649;
  reg [31:0] _RAND_650;
  reg [31:0] _RAND_651;
  reg [31:0] _RAND_652;
  reg [31:0] _RAND_653;
  reg [31:0] _RAND_654;
  reg [31:0] _RAND_655;
  reg [31:0] _RAND_656;
  reg [31:0] _RAND_657;
  reg [31:0] _RAND_658;
  reg [31:0] _RAND_659;
  reg [31:0] _RAND_660;
  reg [31:0] _RAND_661;
  reg [31:0] _RAND_662;
  reg [31:0] _RAND_663;
  reg [31:0] _RAND_664;
  reg [31:0] _RAND_665;
  reg [31:0] _RAND_666;
  reg [31:0] _RAND_667;
  reg [31:0] _RAND_668;
  reg [31:0] _RAND_669;
  reg [31:0] _RAND_670;
  reg [31:0] _RAND_671;
  reg [31:0] _RAND_672;
  reg [31:0] _RAND_673;
  reg [31:0] _RAND_674;
  reg [31:0] _RAND_675;
  reg [31:0] _RAND_676;
  reg [31:0] _RAND_677;
  reg [31:0] _RAND_678;
  reg [31:0] _RAND_679;
  reg [31:0] _RAND_680;
  reg [31:0] _RAND_681;
  reg [31:0] _RAND_682;
  reg [31:0] _RAND_683;
  reg [31:0] _RAND_684;
  reg [31:0] _RAND_685;
  reg [31:0] _RAND_686;
  reg [31:0] _RAND_687;
  reg [31:0] _RAND_688;
  reg [31:0] _RAND_689;
  reg [63:0] _RAND_690;
  reg [31:0] _RAND_691;
  reg [31:0] _RAND_692;
  reg [31:0] _RAND_693;
  reg [31:0] _RAND_694;
  reg [31:0] _RAND_695;
  reg [31:0] _RAND_696;
  reg [31:0] _RAND_697;
  reg [31:0] _RAND_698;
  reg [31:0] _RAND_699;
  reg [31:0] _RAND_700;
`endif // RANDOMIZE_REG_INIT
  wire  main_pipe_req_arb_io_in_0_ready; // @[DCacheWrapper.scala 208:21]
  wire  main_pipe_req_arb_io_in_0_valid; // @[DCacheWrapper.scala 208:21]
  wire  main_pipe_req_arb_io_in_0_bits_miss; // @[DCacheWrapper.scala 208:21]
  wire [1:0] main_pipe_req_arb_io_in_0_bits_miss_id; // @[DCacheWrapper.scala 208:21]
  wire [1:0] main_pipe_req_arb_io_in_0_bits_miss_param; // @[DCacheWrapper.scala 208:21]
  wire  main_pipe_req_arb_io_in_0_bits_miss_dirty; // @[DCacheWrapper.scala 208:21]
  wire [7:0] main_pipe_req_arb_io_in_0_bits_miss_way_en; // @[DCacheWrapper.scala 208:21]
  wire  main_pipe_req_arb_io_in_0_bits_probe; // @[DCacheWrapper.scala 208:21]
  wire [1:0] main_pipe_req_arb_io_in_0_bits_probe_param; // @[DCacheWrapper.scala 208:21]
  wire  main_pipe_req_arb_io_in_0_bits_probe_need_data; // @[DCacheWrapper.scala 208:21]
  wire [3:0] main_pipe_req_arb_io_in_0_bits_source; // @[DCacheWrapper.scala 208:21]
  wire [4:0] main_pipe_req_arb_io_in_0_bits_cmd; // @[DCacheWrapper.scala 208:21]
  wire [38:0] main_pipe_req_arb_io_in_0_bits_vaddr; // @[DCacheWrapper.scala 208:21]
  wire [35:0] main_pipe_req_arb_io_in_0_bits_addr; // @[DCacheWrapper.scala 208:21]
  wire [511:0] main_pipe_req_arb_io_in_0_bits_store_data; // @[DCacheWrapper.scala 208:21]
  wire [63:0] main_pipe_req_arb_io_in_0_bits_store_mask; // @[DCacheWrapper.scala 208:21]
  wire [2:0] main_pipe_req_arb_io_in_0_bits_word_idx; // @[DCacheWrapper.scala 208:21]
  wire [63:0] main_pipe_req_arb_io_in_0_bits_amo_data; // @[DCacheWrapper.scala 208:21]
  wire [7:0] main_pipe_req_arb_io_in_0_bits_amo_mask; // @[DCacheWrapper.scala 208:21]
  wire  main_pipe_req_arb_io_in_0_bits_error; // @[DCacheWrapper.scala 208:21]
  wire  main_pipe_req_arb_io_in_0_bits_replace; // @[DCacheWrapper.scala 208:21]
  wire [7:0] main_pipe_req_arb_io_in_0_bits_replace_way_en; // @[DCacheWrapper.scala 208:21]
  wire [3:0] main_pipe_req_arb_io_in_0_bits_id; // @[DCacheWrapper.scala 208:21]
  wire  main_pipe_req_arb_io_in_1_ready; // @[DCacheWrapper.scala 208:21]
  wire  main_pipe_req_arb_io_in_1_valid; // @[DCacheWrapper.scala 208:21]
  wire  main_pipe_req_arb_io_in_1_bits_miss; // @[DCacheWrapper.scala 208:21]
  wire [1:0] main_pipe_req_arb_io_in_1_bits_miss_id; // @[DCacheWrapper.scala 208:21]
  wire [1:0] main_pipe_req_arb_io_in_1_bits_miss_param; // @[DCacheWrapper.scala 208:21]
  wire  main_pipe_req_arb_io_in_1_bits_miss_dirty; // @[DCacheWrapper.scala 208:21]
  wire [7:0] main_pipe_req_arb_io_in_1_bits_miss_way_en; // @[DCacheWrapper.scala 208:21]
  wire  main_pipe_req_arb_io_in_1_bits_probe; // @[DCacheWrapper.scala 208:21]
  wire [1:0] main_pipe_req_arb_io_in_1_bits_probe_param; // @[DCacheWrapper.scala 208:21]
  wire  main_pipe_req_arb_io_in_1_bits_probe_need_data; // @[DCacheWrapper.scala 208:21]
  wire [3:0] main_pipe_req_arb_io_in_1_bits_source; // @[DCacheWrapper.scala 208:21]
  wire [4:0] main_pipe_req_arb_io_in_1_bits_cmd; // @[DCacheWrapper.scala 208:21]
  wire [38:0] main_pipe_req_arb_io_in_1_bits_vaddr; // @[DCacheWrapper.scala 208:21]
  wire [35:0] main_pipe_req_arb_io_in_1_bits_addr; // @[DCacheWrapper.scala 208:21]
  wire [511:0] main_pipe_req_arb_io_in_1_bits_store_data; // @[DCacheWrapper.scala 208:21]
  wire [63:0] main_pipe_req_arb_io_in_1_bits_store_mask; // @[DCacheWrapper.scala 208:21]
  wire [2:0] main_pipe_req_arb_io_in_1_bits_word_idx; // @[DCacheWrapper.scala 208:21]
  wire [63:0] main_pipe_req_arb_io_in_1_bits_amo_data; // @[DCacheWrapper.scala 208:21]
  wire [7:0] main_pipe_req_arb_io_in_1_bits_amo_mask; // @[DCacheWrapper.scala 208:21]
  wire  main_pipe_req_arb_io_in_1_bits_error; // @[DCacheWrapper.scala 208:21]
  wire  main_pipe_req_arb_io_in_1_bits_replace; // @[DCacheWrapper.scala 208:21]
  wire [7:0] main_pipe_req_arb_io_in_1_bits_replace_way_en; // @[DCacheWrapper.scala 208:21]
  wire [3:0] main_pipe_req_arb_io_in_1_bits_id; // @[DCacheWrapper.scala 208:21]
  wire  main_pipe_req_arb_io_in_2_ready; // @[DCacheWrapper.scala 208:21]
  wire  main_pipe_req_arb_io_in_2_valid; // @[DCacheWrapper.scala 208:21]
  wire [1:0] main_pipe_req_arb_io_in_2_bits_miss_id; // @[DCacheWrapper.scala 208:21]
  wire  main_pipe_req_arb_io_in_2_bits_probe; // @[DCacheWrapper.scala 208:21]
  wire [1:0] main_pipe_req_arb_io_in_2_bits_probe_param; // @[DCacheWrapper.scala 208:21]
  wire  main_pipe_req_arb_io_in_2_bits_probe_need_data; // @[DCacheWrapper.scala 208:21]
  wire [3:0] main_pipe_req_arb_io_in_2_bits_source; // @[DCacheWrapper.scala 208:21]
  wire [4:0] main_pipe_req_arb_io_in_2_bits_cmd; // @[DCacheWrapper.scala 208:21]
  wire [38:0] main_pipe_req_arb_io_in_2_bits_vaddr; // @[DCacheWrapper.scala 208:21]
  wire [35:0] main_pipe_req_arb_io_in_2_bits_addr; // @[DCacheWrapper.scala 208:21]
  wire [511:0] main_pipe_req_arb_io_in_2_bits_store_data; // @[DCacheWrapper.scala 208:21]
  wire [63:0] main_pipe_req_arb_io_in_2_bits_store_mask; // @[DCacheWrapper.scala 208:21]
  wire  main_pipe_req_arb_io_in_2_bits_replace; // @[DCacheWrapper.scala 208:21]
  wire [7:0] main_pipe_req_arb_io_in_2_bits_replace_way_en; // @[DCacheWrapper.scala 208:21]
  wire [3:0] main_pipe_req_arb_io_in_2_bits_id; // @[DCacheWrapper.scala 208:21]
  wire  main_pipe_req_arb_io_in_3_ready; // @[DCacheWrapper.scala 208:21]
  wire  main_pipe_req_arb_io_in_3_valid; // @[DCacheWrapper.scala 208:21]
  wire  main_pipe_req_arb_io_in_3_bits_miss; // @[DCacheWrapper.scala 208:21]
  wire [1:0] main_pipe_req_arb_io_in_3_bits_miss_id; // @[DCacheWrapper.scala 208:21]
  wire [1:0] main_pipe_req_arb_io_in_3_bits_miss_param; // @[DCacheWrapper.scala 208:21]
  wire  main_pipe_req_arb_io_in_3_bits_miss_dirty; // @[DCacheWrapper.scala 208:21]
  wire [7:0] main_pipe_req_arb_io_in_3_bits_miss_way_en; // @[DCacheWrapper.scala 208:21]
  wire  main_pipe_req_arb_io_in_3_bits_probe; // @[DCacheWrapper.scala 208:21]
  wire [1:0] main_pipe_req_arb_io_in_3_bits_probe_param; // @[DCacheWrapper.scala 208:21]
  wire  main_pipe_req_arb_io_in_3_bits_probe_need_data; // @[DCacheWrapper.scala 208:21]
  wire [3:0] main_pipe_req_arb_io_in_3_bits_source; // @[DCacheWrapper.scala 208:21]
  wire [4:0] main_pipe_req_arb_io_in_3_bits_cmd; // @[DCacheWrapper.scala 208:21]
  wire [38:0] main_pipe_req_arb_io_in_3_bits_vaddr; // @[DCacheWrapper.scala 208:21]
  wire [35:0] main_pipe_req_arb_io_in_3_bits_addr; // @[DCacheWrapper.scala 208:21]
  wire [511:0] main_pipe_req_arb_io_in_3_bits_store_data; // @[DCacheWrapper.scala 208:21]
  wire [63:0] main_pipe_req_arb_io_in_3_bits_store_mask; // @[DCacheWrapper.scala 208:21]
  wire [2:0] main_pipe_req_arb_io_in_3_bits_word_idx; // @[DCacheWrapper.scala 208:21]
  wire [63:0] main_pipe_req_arb_io_in_3_bits_amo_data; // @[DCacheWrapper.scala 208:21]
  wire [7:0] main_pipe_req_arb_io_in_3_bits_amo_mask; // @[DCacheWrapper.scala 208:21]
  wire  main_pipe_req_arb_io_in_3_bits_error; // @[DCacheWrapper.scala 208:21]
  wire  main_pipe_req_arb_io_in_3_bits_replace; // @[DCacheWrapper.scala 208:21]
  wire [7:0] main_pipe_req_arb_io_in_3_bits_replace_way_en; // @[DCacheWrapper.scala 208:21]
  wire [3:0] main_pipe_req_arb_io_in_3_bits_id; // @[DCacheWrapper.scala 208:21]
  wire  main_pipe_req_arb_io_out_ready; // @[DCacheWrapper.scala 208:21]
  wire  main_pipe_req_arb_io_out_valid; // @[DCacheWrapper.scala 208:21]
  wire  main_pipe_req_arb_io_out_bits_miss; // @[DCacheWrapper.scala 208:21]
  wire [1:0] main_pipe_req_arb_io_out_bits_miss_id; // @[DCacheWrapper.scala 208:21]
  wire [1:0] main_pipe_req_arb_io_out_bits_miss_param; // @[DCacheWrapper.scala 208:21]
  wire  main_pipe_req_arb_io_out_bits_miss_dirty; // @[DCacheWrapper.scala 208:21]
  wire [7:0] main_pipe_req_arb_io_out_bits_miss_way_en; // @[DCacheWrapper.scala 208:21]
  wire  main_pipe_req_arb_io_out_bits_probe; // @[DCacheWrapper.scala 208:21]
  wire [1:0] main_pipe_req_arb_io_out_bits_probe_param; // @[DCacheWrapper.scala 208:21]
  wire  main_pipe_req_arb_io_out_bits_probe_need_data; // @[DCacheWrapper.scala 208:21]
  wire [3:0] main_pipe_req_arb_io_out_bits_source; // @[DCacheWrapper.scala 208:21]
  wire [4:0] main_pipe_req_arb_io_out_bits_cmd; // @[DCacheWrapper.scala 208:21]
  wire [38:0] main_pipe_req_arb_io_out_bits_vaddr; // @[DCacheWrapper.scala 208:21]
  wire [35:0] main_pipe_req_arb_io_out_bits_addr; // @[DCacheWrapper.scala 208:21]
  wire [511:0] main_pipe_req_arb_io_out_bits_store_data; // @[DCacheWrapper.scala 208:21]
  wire [63:0] main_pipe_req_arb_io_out_bits_store_mask; // @[DCacheWrapper.scala 208:21]
  wire [2:0] main_pipe_req_arb_io_out_bits_word_idx; // @[DCacheWrapper.scala 208:21]
  wire [63:0] main_pipe_req_arb_io_out_bits_amo_data; // @[DCacheWrapper.scala 208:21]
  wire [7:0] main_pipe_req_arb_io_out_bits_amo_mask; // @[DCacheWrapper.scala 208:21]
  wire  main_pipe_req_arb_io_out_bits_error; // @[DCacheWrapper.scala 208:21]
  wire  main_pipe_req_arb_io_out_bits_replace; // @[DCacheWrapper.scala 208:21]
  wire [7:0] main_pipe_req_arb_io_out_bits_replace_way_en; // @[DCacheWrapper.scala 208:21]
  wire [3:0] main_pipe_req_arb_io_out_bits_id; // @[DCacheWrapper.scala 208:21]
  wire [7:0] amoalu_io_mask; // @[MainPipe.scala 619:24]
  wire [4:0] amoalu_io_cmd; // @[MainPipe.scala 619:24]
  wire [63:0] amoalu_io_lhs; // @[MainPipe.scala 619:24]
  wire [63:0] amoalu_io_rhs; // @[MainPipe.scala 619:24]
  wire [63:0] amoalu_io_out; // @[MainPipe.scala 619:24]
  reg  s1_valid_dup_1; // @[MainPipe.scala 251:29]
  wire [38:0] req_bits_vaddr = main_pipe_req_arb_io_out_bits_vaddr; // @[MainPipe.scala 189:17 DCacheWrapper.scala 213:9]
  wire [5:0] s0_idx = req_bits_vaddr[11:6]; // @[L1Cache.scala 81:33]
  reg [38:0] s1_req_vaddr; // @[Reg.scala 16:16]
  wire [5:0] s1_idx = s1_req_vaddr[11:6]; // @[L1Cache.scala 81:33]
  wire  s1_s0_set_conflict = s1_valid_dup_1 & s0_idx == s1_idx; // @[MainPipe.scala 267:41]
  reg  s2_valid_dup_0; // @[MainPipe.scala 365:29]
  reg [38:0] s2_req_vaddr; // @[Reg.scala 16:16]
  wire [5:0] s2_idx = s2_req_vaddr[11:6]; // @[L1Cache.scala 81:33]
  wire  s2_s0_set_conlict = s2_valid_dup_0 & s0_idx == s2_idx; // @[MainPipe.scala 391:40]
  reg  s3_valid_dup_6; // @[MainPipe.scala 472:29]
  reg [5:0] s3_idx_dup_0; // @[Reg.scala 16:16]
  wire  s3_s0_set_conflict = s3_valid_dup_6 & s3_idx_dup_0 == s0_idx; // @[MainPipe.scala 1378:41]
  wire  set_conflict = s1_s0_set_conflict | s2_s0_set_conlict | s3_s0_set_conflict; // @[MainPipe.scala 175:62]
  reg  s1_valid_dup_2; // @[MainPipe.scala 251:29]
  wire [5:0] store_idx = io_store_req_bits_vaddr[11:6]; // @[L1Cache.scala 81:33]
  wire  s1_s0_set_conflict_store = s1_valid_dup_2 & store_idx == s1_idx; // @[MainPipe.scala 268:47]
  reg  s2_valid_dup_1; // @[MainPipe.scala 365:29]
  wire  s2_s0_set_conlict_store = s2_valid_dup_1 & store_idx == s2_idx; // @[MainPipe.scala 392:46]
  reg  s3_valid_dup_7; // @[MainPipe.scala 472:29]
  reg [5:0] s3_idx_dup_1; // @[Reg.scala 16:16]
  wire  s3_s0_set_conflict_store = s3_valid_dup_7 & s3_idx_dup_1 == store_idx; // @[MainPipe.scala 1379:47]
  wire  store_set_conflict = s1_s0_set_conflict_store | s2_s0_set_conlict_store | s3_s0_set_conflict_store; // @[MainPipe.scala 179:80]
  reg  s1_valid_dup_0; // @[MainPipe.scala 251:29]
  reg  s2_valid_dup_3; // @[MainPipe.scala 365:29]
  reg  s2_req_replace_dup_1; // @[Reg.scala 16:16]
  reg  s2_req_probe; // @[Reg.scala 16:16]
  reg  s2_req_miss; // @[Reg.scala 16:16]
  reg [3:0] s2_req_source; // @[Reg.scala 16:16]
  wire  _s2_can_go_to_s3_T_2 = s2_req_source == 4'h1; // @[MainPipe.scala 71:30]
  wire  _s2_can_go_to_s3_T_3 = s2_req_source == 4'h2; // @[MainPipe.scala 72:28]
  reg  s2_tag_match; // @[Reg.scala 16:16]
  reg [4:0] s2_req_cmd; // @[Reg.scala 16:16]
  wire  _c_cat_T_5 = s2_req_cmd == 5'h4; // @[package.scala 15:47]
  wire  _c_cat_T_6 = s2_req_cmd == 5'h9; // @[package.scala 15:47]
  wire  _c_cat_T_7 = s2_req_cmd == 5'ha; // @[package.scala 15:47]
  wire  _c_cat_T_8 = s2_req_cmd == 5'hb; // @[package.scala 15:47]
  wire  _c_cat_T_11 = _c_cat_T_5 | _c_cat_T_6 | _c_cat_T_7 | _c_cat_T_8; // @[package.scala 72:59]
  wire  _c_cat_T_12 = s2_req_cmd == 5'h8; // @[package.scala 15:47]
  wire  _c_cat_T_13 = s2_req_cmd == 5'hc; // @[package.scala 15:47]
  wire  _c_cat_T_14 = s2_req_cmd == 5'hd; // @[package.scala 15:47]
  wire  _c_cat_T_15 = s2_req_cmd == 5'he; // @[package.scala 15:47]
  wire  _c_cat_T_16 = s2_req_cmd == 5'hf; // @[package.scala 15:47]
  wire  _c_cat_T_20 = _c_cat_T_12 | _c_cat_T_13 | _c_cat_T_14 | _c_cat_T_15 | _c_cat_T_16; // @[package.scala 72:59]
  wire  _c_cat_T_21 = _c_cat_T_11 | _c_cat_T_20; // @[Consts.scala 82:44]
  wire  _c_cat_T_22 = s2_req_cmd == 5'h1 | s2_req_cmd == 5'h11 | s2_req_cmd == 5'h7 | _c_cat_T_21; // @[Consts.scala 85:76]
  wire  _c_cat_T_49 = _c_cat_T_22 | s2_req_cmd == 5'h3 | s2_req_cmd == 5'h6; // @[Consts.scala 86:64]
  reg [1:0] s2_hit_coh_state; // @[Reg.scala 16:16]
  wire [3:0] _T_60 = {_c_cat_T_22,_c_cat_T_49,s2_hit_coh_state}; // @[Cat.scala 31:58]
  wire  _T_118 = 4'h3 == _T_60; // @[Misc.scala 48:20]
  wire  _T_115 = 4'h2 == _T_60; // @[Misc.scala 48:20]
  wire  _T_112 = 4'h1 == _T_60; // @[Misc.scala 48:20]
  wire  _T_109 = 4'h7 == _T_60; // @[Misc.scala 48:20]
  wire  _T_106 = 4'h6 == _T_60; // @[Misc.scala 48:20]
  wire  _T_103 = 4'hf == _T_60; // @[Misc.scala 48:20]
  wire  _T_100 = 4'he == _T_60; // @[Misc.scala 48:20]
  wire  _T_97 = 4'h0 == _T_60; // @[Misc.scala 48:20]
  wire  _T_94 = 4'h5 == _T_60; // @[Misc.scala 48:20]
  wire  _T_91 = 4'h4 == _T_60; // @[Misc.scala 48:20]
  wire  _T_88 = 4'hd == _T_60; // @[Misc.scala 48:20]
  wire  _T_85 = 4'hc == _T_60; // @[Misc.scala 48:20]
  wire  s2_has_permission = _T_118 | (_T_115 | (_T_112 | (_T_109 | (_T_106 | (_T_103 | _T_100))))); // @[Misc.scala 34:9]
  wire  s2_hit = s2_tag_match & s2_has_permission; // @[MainPipe.scala 387:29]
  reg  s3_valid_dup_5; // @[MainPipe.scala 472:29]
  reg  s3_req_probe_dup_7; // @[Reg.scala 16:16]
  wire  s3_probe_can_go = s3_req_probe_dup_7 & io_wb_ready; // @[MainPipe.scala 663:45]
  reg  s3_req_probe_dup_0; // @[Reg.scala 16:16]
  reg  s3_tag_match_dup; // @[Reg.scala 16:16]
  reg [1:0] s3_coh_dup_0_state; // @[Reg.scala 16:16]
  reg [1:0] s3_req_probe_param; // @[Reg.scala 16:16]
  reg [1:0] s3_coh_state; // @[Reg.scala 16:16]
  wire [3:0] _probe_new_coh_T = {s3_req_probe_param,s3_coh_state}; // @[Cat.scala 31:58]
  wire  _probe_new_coh_T_57 = 4'h3 == _probe_new_coh_T; // @[Misc.scala 55:20]
  wire  _probe_new_coh_T_53 = 4'h2 == _probe_new_coh_T; // @[Misc.scala 55:20]
  wire  _probe_new_coh_T_49 = 4'h1 == _probe_new_coh_T; // @[Misc.scala 55:20]
  wire  _probe_new_coh_T_45 = 4'h0 == _probe_new_coh_T; // @[Misc.scala 55:20]
  wire  _probe_new_coh_T_41 = 4'h7 == _probe_new_coh_T; // @[Misc.scala 55:20]
  wire  _probe_new_coh_T_37 = 4'h6 == _probe_new_coh_T; // @[Misc.scala 55:20]
  wire  _probe_new_coh_T_33 = 4'h5 == _probe_new_coh_T; // @[Misc.scala 55:20]
  wire [1:0] _probe_new_coh_T_36 = _probe_new_coh_T_33 ? 2'h1 : 2'h0; // @[Misc.scala 37:63]
  wire [1:0] _probe_new_coh_T_40 = _probe_new_coh_T_37 ? 2'h1 : _probe_new_coh_T_36; // @[Misc.scala 37:63]
  wire [1:0] _probe_new_coh_T_44 = _probe_new_coh_T_41 ? 2'h1 : _probe_new_coh_T_40; // @[Misc.scala 37:63]
  wire [1:0] _probe_new_coh_T_48 = _probe_new_coh_T_45 ? 2'h0 : _probe_new_coh_T_44; // @[Misc.scala 37:63]
  wire [1:0] _probe_new_coh_T_52 = _probe_new_coh_T_49 ? 2'h1 : _probe_new_coh_T_48; // @[Misc.scala 37:63]
  wire [1:0] _probe_new_coh_T_56 = _probe_new_coh_T_53 ? 2'h2 : _probe_new_coh_T_52; // @[Misc.scala 37:63]
  wire [1:0] probe_new_coh_state = _probe_new_coh_T_57 ? 2'h2 : _probe_new_coh_T_56; // @[Misc.scala 37:63]
  wire  _probe_update_meta_T_1 = s3_coh_dup_0_state == probe_new_coh_state; // @[Metadata.scala 45:46]
  wire  _probe_update_meta_T_2 = ~_probe_update_meta_T_1; // @[Metadata.scala 46:40]
  wire  probe_update_meta = s3_req_probe_dup_0 & s3_tag_match_dup & _probe_update_meta_T_2; // @[MainPipe.scala 509:67]
  reg [3:0] s3_req_source_dup_1; // @[Reg.scala 16:16]
  reg  s3_req_probe_dup_8; // @[Reg.scala 16:16]
  reg [3:0] s3_req_source; // @[Reg.scala 16:16]
  reg  s3_req_miss_dup_2; // @[Reg.scala 16:16]
  reg  s3_store_hit_dup_0; // @[Reg.scala 16:16]
  reg  s3_req_miss_dup_0; // @[Reg.scala 16:16]
  reg  s3_req_probe_dup_5; // @[Reg.scala 16:16]
  wire  _s3_can_do_amo_T_2 = s3_req_source == 4'h2; // @[MainPipe.scala 72:28]
  reg  s3_amo_hit; // @[Reg.scala 16:16]
  wire  s3_can_do_amo = s3_req_miss_dup_0 & ~s3_req_probe_dup_5 & _s3_can_do_amo_T_2 | s3_amo_hit; // @[MainPipe.scala 545:84]
  reg [4:0] s3_req_cmd_dup_5; // @[Reg.scala 16:16]
  wire  _s3_can_do_amo_write_T_11 = s3_req_cmd_dup_5 == 5'h4 | s3_req_cmd_dup_5 == 5'h9 | s3_req_cmd_dup_5 == 5'ha |
    s3_req_cmd_dup_5 == 5'hb; // @[CacheConstants.scala 52:90]
  wire  _s3_can_do_amo_write_T_20 = s3_req_cmd_dup_5 == 5'h8 | s3_req_cmd_dup_5 == 5'hc | s3_req_cmd_dup_5 == 5'hd |
    s3_req_cmd_dup_5 == 5'he | s3_req_cmd_dup_5 == 5'hf; // @[CacheConstants.scala 53:114]
  wire  _s3_can_do_amo_write_T_21 = _s3_can_do_amo_write_T_11 | _s3_can_do_amo_write_T_20; // @[CacheConstants.scala 54:44]
  wire  _s3_can_do_amo_write_T_22 = s3_req_cmd_dup_5 == 5'h1 | s3_req_cmd_dup_5 == 5'h11 | s3_req_cmd_dup_5 == 5'h7 |
    _s3_can_do_amo_write_T_21; // @[CacheConstants.scala 57:76]
  reg  s3_req_probe_dup_4; // @[Reg.scala 16:16]
  reg [4:0] s3_req_cmd_dup_4; // @[Reg.scala 16:16]
  wire  s3_sc = ~s3_req_probe_dup_4 & _s3_can_do_amo_T_2 & s3_req_cmd_dup_4 == 5'h7; // @[MainPipe.scala 539:52]
  reg [5:0] lrsc_count_dup_0; // @[MainPipe.scala 500:31]
  wire  lrsc_valid_dup_0 = lrsc_count_dup_0 > 6'h8; // @[MainPipe.scala 501:61]
  reg [35:0] lrsc_addr; // @[MainPipe.scala 537:23]
  reg [35:0] s3_req_addr; // @[Reg.scala 16:16]
  wire [35:0] _s3_lrsc_addr_match_T_1 = {s3_req_addr[35:6], 6'h0}; // @[L1Cache.scala 84:59]
  wire  s3_lrsc_addr_match = lrsc_valid_dup_0 & lrsc_addr == _s3_lrsc_addr_match_T_1; // @[MainPipe.scala 540:46]
  wire  s3_sc_fail = s3_sc & ~s3_lrsc_addr_match; // @[MainPipe.scala 541:26]
  wire  _s3_can_do_amo_write_T_24 = ~s3_sc_fail; // @[MainPipe.scala 546:76]
  wire  s3_can_do_amo_write = s3_can_do_amo & _s3_can_do_amo_write_T_22 & ~s3_sc_fail; // @[MainPipe.scala 546:73]
  wire  update_data = s3_req_miss_dup_2 | s3_store_hit_dup_0 | s3_can_do_amo_write; // @[MainPipe.scala 613:63]
  wire  _s3_store_can_go_T_7 = io_data_write_ready | ~update_data; // @[MainPipe.scala 664:159]
  wire  s3_store_can_go = s3_req_source_dup_1 == 4'h1 & ~s3_req_probe_dup_8 & (io_data_write_ready | ~update_data); // @[MainPipe.scala 664:135]
  reg  s3_amo_hit_dup; // @[Reg.scala 16:16]
  reg  s3_s_amoalu_dup_0; // @[MainPipe.scala 493:32]
  reg [4:0] s3_req_cmd_dup_0; // @[Reg.scala 16:16]
  reg [4:0] s3_req_cmd_dup_1; // @[Reg.scala 16:16]
  wire  amo_wait_amoalu = _s3_can_do_amo_T_2 & s3_req_cmd_dup_0 != 5'h6 & s3_req_cmd_dup_1 != 5'h7; // @[MainPipe.scala 512:69]
  wire  _s3_amo_can_go_T_6 = ~amo_wait_amoalu; // @[MainPipe.scala 665:150]
  wire  s3_amo_can_go = s3_amo_hit_dup & _s3_store_can_go_T_7 & (s3_s_amoalu_dup_0 | ~amo_wait_amoalu); // @[MainPipe.scala 665:124]
  reg  s3_req_miss_dup_4; // @[Reg.scala 16:16]
  wire  _s3_miss_can_go_T_5 = s3_req_miss_dup_4 & _s3_store_can_go_T_7; // @[MainPipe.scala 667:47]
  reg  s3_s_amoalu_dup_1; // @[MainPipe.scala 493:32]
  wire  _s3_miss_can_go_T_7 = s3_s_amoalu_dup_1 | _s3_amo_can_go_T_6; // @[MainPipe.scala 669:25]
  wire  _s3_miss_can_go_T_8 = _s3_miss_can_go_T_5 & _s3_miss_can_go_T_7; // @[MainPipe.scala 668:43]
  wire  _s3_miss_can_go_T_9 = _s3_miss_can_go_T_8 & io_tag_write_ready; // @[MainPipe.scala 669:46]
  wire  s3_miss_can_go = _s3_miss_can_go_T_9 & io_wb_ready; // @[MainPipe.scala 670:24]
  reg  s3_req_replace_dup_2; // @[Reg.scala 16:16]
  reg  s3_req_replace_dup_1; // @[Reg.scala 16:16]
  reg [1:0] s3_coh_dup_4_state; // @[Reg.scala 16:16]
  wire  s3_replace_nothing = s3_req_replace_dup_1 & s3_coh_dup_4_state == 2'h0; // @[MainPipe.scala 672:50]
  wire  s3_replace_can_go = s3_req_replace_dup_2 & (s3_replace_nothing | io_wb_ready); // @[MainPipe.scala 673:49]
  wire  s3_can_go = s3_probe_can_go | s3_store_can_go | s3_amo_can_go | s3_miss_can_go | s3_replace_can_go; // @[MainPipe.scala 674:89]
  wire  s3_ready = ~s3_valid_dup_5 | s3_can_go; // @[MainPipe.scala 1377:32]
  wire  s2_can_go_to_s3 = (s2_req_replace_dup_1 | s2_req_probe | s2_req_miss | (_s2_can_go_to_s3_T_2 |
    _s2_can_go_to_s3_T_3) & s2_hit) & s3_ready; // @[MainPipe.scala 395:125]
  reg  s2_can_go_to_mq; // @[Reg.scala 16:16]
  wire  s2_can_go = s2_can_go_to_s3 | s2_can_go_to_mq; // @[MainPipe.scala 398:35]
  wire  s2_ready = ~s2_valid_dup_3 | s2_can_go; // @[MainPipe.scala 410:32]
  reg  s1_need_data; // @[Reg.scala 16:16]
  wire  s1_can_go = s2_ready & (io_data_read_ready | ~s1_need_data); // @[MainPipe.scala 246:28]
  wire  s1_ready = ~s1_valid_dup_0 | s1_can_go; // @[MainPipe.scala 266:32]
  wire  _store_req_ready_T_1 = io_tag_read_ready & s1_ready; // @[MainPipe.scala 204:62]
  wire  _store_req_ready_T_4 = ~io_probe_req_valid; // @[MainPipe.scala 205:5]
  wire  _store_req_ready_T_5 = io_tag_read_ready & s1_ready & ~store_set_conflict & _store_req_ready_T_4; // @[MainPipe.scala 204:97]
  wire  _s0_can_go_T_2 = ~set_conflict; // @[MainPipe.scala 209:74]
  wire  s0_can_go = _store_req_ready_T_1 & ~set_conflict; // @[MainPipe.scala 209:71]
  wire  req_valid = main_pipe_req_arb_io_out_valid; // @[MainPipe.scala 189:17 DCacheWrapper.scala 213:9]
  wire  s0_fire = req_valid & s0_can_go; // @[MainPipe.scala 210:27]
  wire [63:0] req_bits_store_mask = main_pipe_req_arb_io_out_bits_store_mask; // @[MainPipe.scala 189:17 DCacheWrapper.scala 213:9]
  wire [7:0] bank_write = {|req_bits_store_mask[63:56],|req_bits_store_mask[55:48],|req_bits_store_mask[47:40],|
    req_bits_store_mask[39:32],|req_bits_store_mask[31:24],|req_bits_store_mask[23:16],|req_bits_store_mask[15:8],|
    req_bits_store_mask[7:0]}; // @[MainPipe.scala 212:104]
  wire [7:0] bank_full_write = {&req_bits_store_mask[63:56],&req_bits_store_mask[55:48],&req_bits_store_mask[47:40],&
    req_bits_store_mask[39:32],&req_bits_store_mask[31:24],&req_bits_store_mask[23:16],&req_bits_store_mask[15:8],&
    req_bits_store_mask[7:0]}; // @[MainPipe.scala 213:110]
  wire [7:0] _banked_store_rmask_T = ~bank_full_write; // @[MainPipe.scala 216:41]
  wire [7:0] banked_store_rmask = bank_write & _banked_store_rmask_T; // @[MainPipe.scala 216:39]
  wire  req_bits_probe = main_pipe_req_arb_io_out_bits_probe; // @[MainPipe.scala 189:17 DCacheWrapper.scala 213:9]
  wire  _store_need_data_T = ~req_bits_probe; // @[MainPipe.scala 220:25]
  wire [3:0] req_bits_source = main_pipe_req_arb_io_out_bits_source; // @[MainPipe.scala 189:17 DCacheWrapper.scala 213:9]
  wire  _store_need_data_T_1 = req_bits_source == 4'h1; // @[MainPipe.scala 71:30]
  wire  store_need_data = ~req_bits_probe & _store_need_data_T_1 & |banked_store_rmask; // @[MainPipe.scala 220:57]
  wire  _amo_need_data_T_1 = req_bits_source == 4'h2; // @[MainPipe.scala 72:28]
  wire  amo_need_data = _store_need_data_T & _amo_need_data_T_1; // @[MainPipe.scala 222:37]
  wire  req_bits_miss = main_pipe_req_arb_io_out_bits_miss; // @[MainPipe.scala 189:17 DCacheWrapper.scala 213:9]
  wire  req_bits_replace = main_pipe_req_arb_io_out_bits_replace; // @[MainPipe.scala 189:17 DCacheWrapper.scala 213:9]
  wire  banked_need_data = store_need_data | req_bits_probe | amo_need_data | req_bits_miss | req_bits_replace; // @[MainPipe.scala 226:96]
  reg  s1_valid; // @[MainPipe.scala 240:25]
  reg  s1_req_miss; // @[Reg.scala 16:16]
  reg [1:0] s1_req_miss_id; // @[Reg.scala 16:16]
  reg [1:0] s1_req_miss_param; // @[Reg.scala 16:16]
  reg  s1_req_miss_dirty; // @[Reg.scala 16:16]
  reg [7:0] s1_req_miss_way_en; // @[Reg.scala 16:16]
  reg  s1_req_probe; // @[Reg.scala 16:16]
  reg [1:0] s1_req_probe_param; // @[Reg.scala 16:16]
  reg  s1_req_probe_need_data; // @[Reg.scala 16:16]
  reg [3:0] s1_req_source; // @[Reg.scala 16:16]
  reg [4:0] s1_req_cmd; // @[Reg.scala 16:16]
  reg [35:0] s1_req_addr; // @[Reg.scala 16:16]
  reg [511:0] s1_req_store_data; // @[Reg.scala 16:16]
  reg [63:0] s1_req_store_mask; // @[Reg.scala 16:16]
  reg [2:0] s1_req_word_idx; // @[Reg.scala 16:16]
  reg [63:0] s1_req_amo_data; // @[Reg.scala 16:16]
  reg [7:0] s1_req_amo_mask; // @[Reg.scala 16:16]
  reg  s1_req_error; // @[Reg.scala 16:16]
  reg  s1_req_replace; // @[Reg.scala 16:16]
  reg [7:0] s1_req_replace_way_en; // @[Reg.scala 16:16]
  reg [3:0] s1_req_id; // @[Reg.scala 16:16]
  wire [1:0] req_bits_miss_id = main_pipe_req_arb_io_out_bits_miss_id; // @[MainPipe.scala 189:17 DCacheWrapper.scala 213:9]
  wire [1:0] req_bits_miss_param = main_pipe_req_arb_io_out_bits_miss_param; // @[MainPipe.scala 189:17 DCacheWrapper.scala 213:9]
  wire  req_bits_miss_dirty = main_pipe_req_arb_io_out_bits_miss_dirty; // @[MainPipe.scala 189:17 DCacheWrapper.scala 213:9]
  wire [7:0] req_bits_miss_way_en = main_pipe_req_arb_io_out_bits_miss_way_en; // @[MainPipe.scala 189:17 DCacheWrapper.scala 213:9]
  wire [1:0] req_bits_probe_param = main_pipe_req_arb_io_out_bits_probe_param; // @[MainPipe.scala 189:17 DCacheWrapper.scala 213:9]
  wire  req_bits_probe_need_data = main_pipe_req_arb_io_out_bits_probe_need_data; // @[MainPipe.scala 189:17 DCacheWrapper.scala 213:9]
  wire [4:0] req_bits_cmd = main_pipe_req_arb_io_out_bits_cmd; // @[MainPipe.scala 189:17 DCacheWrapper.scala 213:9]
  wire [35:0] req_bits_addr = main_pipe_req_arb_io_out_bits_addr; // @[MainPipe.scala 189:17 DCacheWrapper.scala 213:9]
  wire [511:0] req_bits_store_data = main_pipe_req_arb_io_out_bits_store_data; // @[MainPipe.scala 189:17 DCacheWrapper.scala 213:9]
  wire [2:0] req_bits_word_idx = main_pipe_req_arb_io_out_bits_word_idx; // @[MainPipe.scala 189:17 DCacheWrapper.scala 213:9]
  wire [63:0] req_bits_amo_data = main_pipe_req_arb_io_out_bits_amo_data; // @[MainPipe.scala 189:17 DCacheWrapper.scala 213:9]
  wire [7:0] req_bits_amo_mask = main_pipe_req_arb_io_out_bits_amo_mask; // @[MainPipe.scala 189:17 DCacheWrapper.scala 213:9]
  wire  req_bits_error = main_pipe_req_arb_io_out_bits_error; // @[MainPipe.scala 189:17 DCacheWrapper.scala 213:9]
  wire [7:0] req_bits_replace_way_en = main_pipe_req_arb_io_out_bits_replace_way_en; // @[MainPipe.scala 189:17 DCacheWrapper.scala 213:9]
  wire [3:0] req_bits_id = main_pipe_req_arb_io_out_bits_id; // @[MainPipe.scala 189:17 DCacheWrapper.scala 213:9]
  reg [7:0] s1_banked_store_wmask; // @[Reg.scala 16:16]
  reg  s1_need_tag; // @[Reg.scala 16:16]
  wire  s1_fire = s1_valid & s1_can_go; // @[MainPipe.scala 247:26]
  reg  s1_valid_dup_4; // @[MainPipe.scala 251:29]
  reg  s1_valid_dup_5; // @[MainPipe.scala 251:29]
  reg [38:0] s1_req_vaddr_dup_for_data_read; // @[Reg.scala 16:16]
  reg [5:0] s1_idx_dup_for_replace_way; // @[Reg.scala 16:16]
  reg  s1_valid_dup_for_status_0; // @[MainPipe.scala 255:40]
  reg  s1_valid_dup_for_status_1; // @[MainPipe.scala 255:40]
  reg  s1_valid_dup_for_status_2; // @[MainPipe.scala 255:40]
  reg  s1_valid_dup_for_status_3; // @[MainPipe.scala 255:40]
  reg  s1_valid_dup_for_status_4; // @[MainPipe.scala 255:40]
  reg  s1_valid_dup_for_status_5; // @[MainPipe.scala 255:40]
  reg  s1_valid_dup_for_status_6; // @[MainPipe.scala 255:40]
  reg  s1_valid_dup_for_status_7; // @[MainPipe.scala 255:40]
  reg  s1_valid_dup_for_status_8; // @[MainPipe.scala 255:40]
  reg  s1_valid_dup_for_status_9; // @[MainPipe.scala 255:40]
  reg  s1_valid_dup_for_status_10; // @[MainPipe.scala 255:40]
  reg  s1_valid_dup_for_status_11; // @[MainPipe.scala 255:40]
  reg  s1_valid_dup_for_status_12; // @[MainPipe.scala 255:40]
  reg  s1_valid_dup_for_status_13; // @[MainPipe.scala 255:40]
  reg  s1_valid_dup_for_status_14; // @[MainPipe.scala 255:40]
  reg  s1_valid_dup_for_status_15; // @[MainPipe.scala 255:40]
  reg  s1_valid_dup_for_status_16; // @[MainPipe.scala 255:40]
  reg  s1_valid_dup_for_status_17; // @[MainPipe.scala 255:40]
  reg  s1_valid_dup_for_status_18; // @[MainPipe.scala 255:40]
  reg  s1_valid_dup_for_status_19; // @[MainPipe.scala 255:40]
  reg  s1_valid_dup_for_status_20; // @[MainPipe.scala 255:40]
  reg  s1_valid_dup_for_status_21; // @[MainPipe.scala 255:40]
  reg  s1_valid_dup_for_status_22; // @[MainPipe.scala 255:40]
  reg  s1_valid_dup_for_status_23; // @[MainPipe.scala 255:40]
  wire  _GEN_27 = s1_fire ? 1'h0 : s1_valid; // @[MainPipe.scala 261:24 262:14 240:25]
  wire  _GEN_28 = s1_fire ? 1'h0 : s1_valid_dup_0; // @[MainPipe.scala 261:24 263:28 251:29]
  wire  _GEN_29 = s1_fire ? 1'h0 : s1_valid_dup_1; // @[MainPipe.scala 261:24 263:28 251:29]
  wire  _GEN_30 = s1_fire ? 1'h0 : s1_valid_dup_2; // @[MainPipe.scala 261:24 263:28 251:29]
  wire  _GEN_32 = s1_fire ? 1'h0 : s1_valid_dup_4; // @[MainPipe.scala 261:24 263:28 251:29]
  wire  _GEN_33 = s1_fire ? 1'h0 : s1_valid_dup_5; // @[MainPipe.scala 261:24 263:28 251:29]
  wire  _GEN_34 = s1_fire ? 1'h0 : s1_valid_dup_for_status_0; // @[MainPipe.scala 261:24 264:39 255:40]
  wire  _GEN_35 = s1_fire ? 1'h0 : s1_valid_dup_for_status_1; // @[MainPipe.scala 261:24 264:39 255:40]
  wire  _GEN_36 = s1_fire ? 1'h0 : s1_valid_dup_for_status_2; // @[MainPipe.scala 261:24 264:39 255:40]
  wire  _GEN_37 = s1_fire ? 1'h0 : s1_valid_dup_for_status_3; // @[MainPipe.scala 261:24 264:39 255:40]
  wire  _GEN_38 = s1_fire ? 1'h0 : s1_valid_dup_for_status_4; // @[MainPipe.scala 261:24 264:39 255:40]
  wire  _GEN_39 = s1_fire ? 1'h0 : s1_valid_dup_for_status_5; // @[MainPipe.scala 261:24 264:39 255:40]
  wire  _GEN_40 = s1_fire ? 1'h0 : s1_valid_dup_for_status_6; // @[MainPipe.scala 261:24 264:39 255:40]
  wire  _GEN_41 = s1_fire ? 1'h0 : s1_valid_dup_for_status_7; // @[MainPipe.scala 261:24 264:39 255:40]
  wire  _GEN_42 = s1_fire ? 1'h0 : s1_valid_dup_for_status_8; // @[MainPipe.scala 261:24 264:39 255:40]
  wire  _GEN_43 = s1_fire ? 1'h0 : s1_valid_dup_for_status_9; // @[MainPipe.scala 261:24 264:39 255:40]
  wire  _GEN_44 = s1_fire ? 1'h0 : s1_valid_dup_for_status_10; // @[MainPipe.scala 261:24 264:39 255:40]
  wire  _GEN_45 = s1_fire ? 1'h0 : s1_valid_dup_for_status_11; // @[MainPipe.scala 261:24 264:39 255:40]
  wire  _GEN_46 = s1_fire ? 1'h0 : s1_valid_dup_for_status_12; // @[MainPipe.scala 261:24 264:39 255:40]
  wire  _GEN_47 = s1_fire ? 1'h0 : s1_valid_dup_for_status_13; // @[MainPipe.scala 261:24 264:39 255:40]
  wire  _GEN_48 = s1_fire ? 1'h0 : s1_valid_dup_for_status_14; // @[MainPipe.scala 261:24 264:39 255:40]
  wire  _GEN_49 = s1_fire ? 1'h0 : s1_valid_dup_for_status_15; // @[MainPipe.scala 261:24 264:39 255:40]
  wire  _GEN_50 = s1_fire ? 1'h0 : s1_valid_dup_for_status_16; // @[MainPipe.scala 261:24 264:39 255:40]
  wire  _GEN_51 = s1_fire ? 1'h0 : s1_valid_dup_for_status_17; // @[MainPipe.scala 261:24 264:39 255:40]
  wire  _GEN_52 = s1_fire ? 1'h0 : s1_valid_dup_for_status_18; // @[MainPipe.scala 261:24 264:39 255:40]
  wire  _GEN_53 = s1_fire ? 1'h0 : s1_valid_dup_for_status_19; // @[MainPipe.scala 261:24 264:39 255:40]
  wire  _GEN_54 = s1_fire ? 1'h0 : s1_valid_dup_for_status_20; // @[MainPipe.scala 261:24 264:39 255:40]
  wire  _GEN_55 = s1_fire ? 1'h0 : s1_valid_dup_for_status_21; // @[MainPipe.scala 261:24 264:39 255:40]
  wire  _GEN_56 = s1_fire ? 1'h0 : s1_valid_dup_for_status_22; // @[MainPipe.scala 261:24 264:39 255:40]
  wire  _GEN_57 = s1_fire ? 1'h0 : s1_valid_dup_for_status_23; // @[MainPipe.scala 261:24 264:39 255:40]
  reg  REG_2; // @[MainPipe.scala 273:27]
  reg [1:0] REG_3_0; // @[MainPipe.scala 273:82]
  reg [1:0] REG_3_1; // @[MainPipe.scala 273:82]
  reg [1:0] REG_3_2; // @[MainPipe.scala 273:82]
  reg [1:0] REG_3_3; // @[MainPipe.scala 273:82]
  reg [1:0] REG_3_4; // @[MainPipe.scala 273:82]
  reg [1:0] REG_3_5; // @[MainPipe.scala 273:82]
  reg [1:0] REG_3_6; // @[MainPipe.scala 273:82]
  reg [1:0] REG_3_7; // @[MainPipe.scala 273:82]
  wire [1:0] meta_resp_0 = REG_2 ? io_meta_resp_0_coh_state : REG_3_0; // @[MainPipe.scala 273:19]
  wire [1:0] meta_resp_1 = REG_2 ? io_meta_resp_1_coh_state : REG_3_1; // @[MainPipe.scala 273:19]
  wire [1:0] meta_resp_2 = REG_2 ? io_meta_resp_2_coh_state : REG_3_2; // @[MainPipe.scala 273:19]
  wire [1:0] meta_resp_3 = REG_2 ? io_meta_resp_3_coh_state : REG_3_3; // @[MainPipe.scala 273:19]
  wire [1:0] meta_resp_4 = REG_2 ? io_meta_resp_4_coh_state : REG_3_4; // @[MainPipe.scala 273:19]
  wire [1:0] meta_resp_5 = REG_2 ? io_meta_resp_5_coh_state : REG_3_5; // @[MainPipe.scala 273:19]
  wire [1:0] meta_resp_6 = REG_2 ? io_meta_resp_6_coh_state : REG_3_6; // @[MainPipe.scala 273:19]
  wire [1:0] meta_resp_7 = REG_2 ? io_meta_resp_7_coh_state : REG_3_7; // @[MainPipe.scala 273:19]
  reg  REG_4; // @[MainPipe.scala 274:26]
  reg [23:0] REG_5_0; // @[MainPipe.scala 274:94]
  reg [23:0] REG_5_1; // @[MainPipe.scala 274:94]
  reg [23:0] REG_5_2; // @[MainPipe.scala 274:94]
  reg [23:0] REG_5_3; // @[MainPipe.scala 274:94]
  reg [23:0] REG_5_4; // @[MainPipe.scala 274:94]
  reg [23:0] REG_5_5; // @[MainPipe.scala 274:94]
  reg [23:0] REG_5_6; // @[MainPipe.scala 274:94]
  reg [23:0] REG_5_7; // @[MainPipe.scala 274:94]
  wire [23:0] tag_resp_0 = REG_4 ? io_tag_resp_0[23:0] : REG_5_0; // @[MainPipe.scala 274:18]
  wire [23:0] tag_resp_1 = REG_4 ? io_tag_resp_1[23:0] : REG_5_1; // @[MainPipe.scala 274:18]
  wire [23:0] tag_resp_2 = REG_4 ? io_tag_resp_2[23:0] : REG_5_2; // @[MainPipe.scala 274:18]
  wire [23:0] tag_resp_3 = REG_4 ? io_tag_resp_3[23:0] : REG_5_3; // @[MainPipe.scala 274:18]
  wire [23:0] tag_resp_4 = REG_4 ? io_tag_resp_4[23:0] : REG_5_4; // @[MainPipe.scala 274:18]
  wire [23:0] tag_resp_5 = REG_4 ? io_tag_resp_5[23:0] : REG_5_5; // @[MainPipe.scala 274:18]
  wire [23:0] tag_resp_6 = REG_4 ? io_tag_resp_6[23:0] : REG_5_6; // @[MainPipe.scala 274:18]
  wire [23:0] tag_resp_7 = REG_4 ? io_tag_resp_7[23:0] : REG_5_7; // @[MainPipe.scala 274:18]
  reg  REG_8; // @[MainPipe.scala 277:30]
  reg [29:0] REG_9_0; // @[MainPipe.scala 277:61]
  reg [29:0] REG_9_1; // @[MainPipe.scala 277:61]
  reg [29:0] REG_9_2; // @[MainPipe.scala 277:61]
  reg [29:0] REG_9_3; // @[MainPipe.scala 277:61]
  reg [29:0] REG_9_4; // @[MainPipe.scala 277:61]
  reg [29:0] REG_9_5; // @[MainPipe.scala 277:61]
  reg [29:0] REG_9_6; // @[MainPipe.scala 277:61]
  reg [29:0] REG_9_7; // @[MainPipe.scala 277:61]
  wire [29:0] enc_tag_resp_0 = REG_8 ? io_tag_resp_0 : REG_9_0; // @[MainPipe.scala 277:22]
  wire [29:0] enc_tag_resp_1 = REG_8 ? io_tag_resp_1 : REG_9_1; // @[MainPipe.scala 277:22]
  wire [29:0] enc_tag_resp_2 = REG_8 ? io_tag_resp_2 : REG_9_2; // @[MainPipe.scala 277:22]
  wire [29:0] enc_tag_resp_3 = REG_8 ? io_tag_resp_3 : REG_9_3; // @[MainPipe.scala 277:22]
  wire [29:0] enc_tag_resp_4 = REG_8 ? io_tag_resp_4 : REG_9_4; // @[MainPipe.scala 277:22]
  wire [29:0] enc_tag_resp_5 = REG_8 ? io_tag_resp_5 : REG_9_5; // @[MainPipe.scala 277:22]
  wire [29:0] enc_tag_resp_6 = REG_8 ? io_tag_resp_6 : REG_9_6; // @[MainPipe.scala 277:22]
  wire [29:0] enc_tag_resp_7 = REG_8 ? io_tag_resp_7 : REG_9_7; // @[MainPipe.scala 277:22]
  wire [7:0] s1_tag_eq_way = {tag_resp_7 == s1_req_addr[35:12],tag_resp_6 == s1_req_addr[35:12],tag_resp_5 ==
    s1_req_addr[35:12],tag_resp_4 == s1_req_addr[35:12],tag_resp_3 == s1_req_addr[35:12],tag_resp_2 == s1_req_addr[35:12
    ],tag_resp_1 == s1_req_addr[35:12],tag_resp_0 == s1_req_addr[35:12]}; // @[MainPipe.scala 280:80]
  wire  _s1_tag_match_way_T_1 = meta_resp_0 > 2'h0; // @[Metadata.scala 49:45]
  wire  _s1_tag_match_way_T_2 = s1_tag_eq_way[0] & _s1_tag_match_way_T_1; // @[MainPipe.scala 281:62]
  wire  _s1_tag_match_way_T_4 = meta_resp_1 > 2'h0; // @[Metadata.scala 49:45]
  wire  _s1_tag_match_way_T_5 = s1_tag_eq_way[1] & _s1_tag_match_way_T_4; // @[MainPipe.scala 281:62]
  wire  _s1_tag_match_way_T_7 = meta_resp_2 > 2'h0; // @[Metadata.scala 49:45]
  wire  _s1_tag_match_way_T_8 = s1_tag_eq_way[2] & _s1_tag_match_way_T_7; // @[MainPipe.scala 281:62]
  wire  _s1_tag_match_way_T_10 = meta_resp_3 > 2'h0; // @[Metadata.scala 49:45]
  wire  _s1_tag_match_way_T_11 = s1_tag_eq_way[3] & _s1_tag_match_way_T_10; // @[MainPipe.scala 281:62]
  wire  _s1_tag_match_way_T_13 = meta_resp_4 > 2'h0; // @[Metadata.scala 49:45]
  wire  _s1_tag_match_way_T_14 = s1_tag_eq_way[4] & _s1_tag_match_way_T_13; // @[MainPipe.scala 281:62]
  wire  _s1_tag_match_way_T_16 = meta_resp_5 > 2'h0; // @[Metadata.scala 49:45]
  wire  _s1_tag_match_way_T_17 = s1_tag_eq_way[5] & _s1_tag_match_way_T_16; // @[MainPipe.scala 281:62]
  wire  _s1_tag_match_way_T_19 = meta_resp_6 > 2'h0; // @[Metadata.scala 49:45]
  wire  _s1_tag_match_way_T_20 = s1_tag_eq_way[6] & _s1_tag_match_way_T_19; // @[MainPipe.scala 281:62]
  wire  _s1_tag_match_way_T_22 = meta_resp_7 > 2'h0; // @[Metadata.scala 49:45]
  wire  _s1_tag_match_way_T_23 = s1_tag_eq_way[7] & _s1_tag_match_way_T_22; // @[MainPipe.scala 281:62]
  wire [7:0] s1_tag_match_way = {_s1_tag_match_way_T_23,_s1_tag_match_way_T_20,_s1_tag_match_way_T_17,
    _s1_tag_match_way_T_14,_s1_tag_match_way_T_11,_s1_tag_match_way_T_8,_s1_tag_match_way_T_5,_s1_tag_match_way_T_2}; // @[MainPipe.scala 281:99]
  wire  s1_tag_match = |s1_tag_match_way; // @[MainPipe.scala 282:39]
  wire [23:0] _s1_hit_tag_T_8 = s1_tag_match_way[0] ? tag_resp_0 : 24'h0; // @[Mux.scala 27:73]
  wire [23:0] _s1_hit_tag_T_9 = s1_tag_match_way[1] ? tag_resp_1 : 24'h0; // @[Mux.scala 27:73]
  wire [23:0] _s1_hit_tag_T_10 = s1_tag_match_way[2] ? tag_resp_2 : 24'h0; // @[Mux.scala 27:73]
  wire [23:0] _s1_hit_tag_T_11 = s1_tag_match_way[3] ? tag_resp_3 : 24'h0; // @[Mux.scala 27:73]
  wire [23:0] _s1_hit_tag_T_12 = s1_tag_match_way[4] ? tag_resp_4 : 24'h0; // @[Mux.scala 27:73]
  wire [23:0] _s1_hit_tag_T_13 = s1_tag_match_way[5] ? tag_resp_5 : 24'h0; // @[Mux.scala 27:73]
  wire [23:0] _s1_hit_tag_T_14 = s1_tag_match_way[6] ? tag_resp_6 : 24'h0; // @[Mux.scala 27:73]
  wire [23:0] _s1_hit_tag_T_15 = s1_tag_match_way[7] ? tag_resp_7 : 24'h0; // @[Mux.scala 27:73]
  wire [23:0] _s1_hit_tag_T_16 = _s1_hit_tag_T_8 | _s1_hit_tag_T_9; // @[Mux.scala 27:73]
  wire [23:0] _s1_hit_tag_T_17 = _s1_hit_tag_T_16 | _s1_hit_tag_T_10; // @[Mux.scala 27:73]
  wire [23:0] _s1_hit_tag_T_18 = _s1_hit_tag_T_17 | _s1_hit_tag_T_11; // @[Mux.scala 27:73]
  wire [23:0] _s1_hit_tag_T_19 = _s1_hit_tag_T_18 | _s1_hit_tag_T_12; // @[Mux.scala 27:73]
  wire [23:0] _s1_hit_tag_T_20 = _s1_hit_tag_T_19 | _s1_hit_tag_T_13; // @[Mux.scala 27:73]
  wire [23:0] _s1_hit_tag_T_21 = _s1_hit_tag_T_20 | _s1_hit_tag_T_14; // @[Mux.scala 27:73]
  wire [23:0] _s1_hit_tag_T_22 = _s1_hit_tag_T_21 | _s1_hit_tag_T_15; // @[Mux.scala 27:73]
  wire [23:0] s1_hit_tag = s1_tag_match ? _s1_hit_tag_T_22 : s1_req_addr[35:12]; // @[MainPipe.scala 284:23]
  wire [1:0] _s1_hit_coh_T_8 = s1_tag_match_way[0] ? meta_resp_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _s1_hit_coh_T_9 = s1_tag_match_way[1] ? meta_resp_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _s1_hit_coh_T_10 = s1_tag_match_way[2] ? meta_resp_2 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _s1_hit_coh_T_11 = s1_tag_match_way[3] ? meta_resp_3 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _s1_hit_coh_T_12 = s1_tag_match_way[4] ? meta_resp_4 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _s1_hit_coh_T_13 = s1_tag_match_way[5] ? meta_resp_5 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _s1_hit_coh_T_14 = s1_tag_match_way[6] ? meta_resp_6 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _s1_hit_coh_T_15 = s1_tag_match_way[7] ? meta_resp_7 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _s1_hit_coh_T_16 = _s1_hit_coh_T_8 | _s1_hit_coh_T_9; // @[Mux.scala 27:73]
  wire [1:0] _s1_hit_coh_T_17 = _s1_hit_coh_T_16 | _s1_hit_coh_T_10; // @[Mux.scala 27:73]
  wire [1:0] _s1_hit_coh_T_18 = _s1_hit_coh_T_17 | _s1_hit_coh_T_11; // @[Mux.scala 27:73]
  wire [1:0] _s1_hit_coh_T_19 = _s1_hit_coh_T_18 | _s1_hit_coh_T_12; // @[Mux.scala 27:73]
  wire [1:0] _s1_hit_coh_T_20 = _s1_hit_coh_T_19 | _s1_hit_coh_T_13; // @[Mux.scala 27:73]
  wire [1:0] _s1_hit_coh_T_21 = _s1_hit_coh_T_20 | _s1_hit_coh_T_14; // @[Mux.scala 27:73]
  wire [1:0] _s1_hit_coh_T_22 = _s1_hit_coh_T_21 | _s1_hit_coh_T_15; // @[Mux.scala 27:73]
  wire [1:0] s1_hit_coh_state = s1_tag_match ? _s1_hit_coh_T_22 : 2'h0; // @[MainPipe.scala 285:38]
  wire [29:0] _s1_encTag_T_8 = s1_tag_match_way[0] ? enc_tag_resp_0 : 30'h0; // @[Mux.scala 27:73]
  wire [29:0] _s1_encTag_T_9 = s1_tag_match_way[1] ? enc_tag_resp_1 : 30'h0; // @[Mux.scala 27:73]
  wire [29:0] _s1_encTag_T_10 = s1_tag_match_way[2] ? enc_tag_resp_2 : 30'h0; // @[Mux.scala 27:73]
  wire [29:0] _s1_encTag_T_11 = s1_tag_match_way[3] ? enc_tag_resp_3 : 30'h0; // @[Mux.scala 27:73]
  wire [29:0] _s1_encTag_T_12 = s1_tag_match_way[4] ? enc_tag_resp_4 : 30'h0; // @[Mux.scala 27:73]
  wire [29:0] _s1_encTag_T_13 = s1_tag_match_way[5] ? enc_tag_resp_5 : 30'h0; // @[Mux.scala 27:73]
  wire [29:0] _s1_encTag_T_14 = s1_tag_match_way[6] ? enc_tag_resp_6 : 30'h0; // @[Mux.scala 27:73]
  wire [29:0] _s1_encTag_T_15 = s1_tag_match_way[7] ? enc_tag_resp_7 : 30'h0; // @[Mux.scala 27:73]
  wire [29:0] _s1_encTag_T_16 = _s1_encTag_T_8 | _s1_encTag_T_9; // @[Mux.scala 27:73]
  wire [29:0] _s1_encTag_T_17 = _s1_encTag_T_16 | _s1_encTag_T_10; // @[Mux.scala 27:73]
  wire [29:0] _s1_encTag_T_18 = _s1_encTag_T_17 | _s1_encTag_T_11; // @[Mux.scala 27:73]
  wire [29:0] _s1_encTag_T_19 = _s1_encTag_T_18 | _s1_encTag_T_12; // @[Mux.scala 27:73]
  wire [29:0] _s1_encTag_T_20 = _s1_encTag_T_19 | _s1_encTag_T_13; // @[Mux.scala 27:73]
  wire [29:0] _s1_encTag_T_21 = _s1_encTag_T_20 | _s1_encTag_T_14; // @[Mux.scala 27:73]
  wire [29:0] s1_encTag = _s1_encTag_T_21 | _s1_encTag_T_15; // @[Mux.scala 27:73]
  wire  _s1_flag_error_T_22 = s1_tag_match_way[0] & io_extra_meta_resp_0_error | s1_tag_match_way[1] &
    io_extra_meta_resp_1_error | s1_tag_match_way[2] & io_extra_meta_resp_2_error | s1_tag_match_way[3] &
    io_extra_meta_resp_3_error | s1_tag_match_way[4] & io_extra_meta_resp_4_error | s1_tag_match_way[5] &
    io_extra_meta_resp_5_error | s1_tag_match_way[6] & io_extra_meta_resp_6_error | s1_tag_match_way[7] &
    io_extra_meta_resp_7_error; // @[Mux.scala 27:73]
  wire  s1_flag_error = s1_tag_match & _s1_flag_error_T_22; // @[MainPipe.scala 287:26]
  reg  s1_repl_way_en_REG; // @[MainPipe.scala 296:32]
  wire [7:0] _s1_repl_way_en_T = 8'h1 << io_replace_way_way; // @[OneHot.scala 57:35]
  reg [7:0] s1_repl_way_en_REG_1; // @[MainPipe.scala 296:80]
  wire [7:0] s1_repl_way_en = s1_repl_way_en_REG ? _s1_repl_way_en_T : s1_repl_way_en_REG_1; // @[MainPipe.scala 296:24]
  wire [23:0] _s1_repl_tag_T_8 = s1_repl_way_en[0] ? tag_resp_0 : 24'h0; // @[Mux.scala 27:73]
  wire [23:0] _s1_repl_tag_T_9 = s1_repl_way_en[1] ? tag_resp_1 : 24'h0; // @[Mux.scala 27:73]
  wire [23:0] _s1_repl_tag_T_10 = s1_repl_way_en[2] ? tag_resp_2 : 24'h0; // @[Mux.scala 27:73]
  wire [23:0] _s1_repl_tag_T_11 = s1_repl_way_en[3] ? tag_resp_3 : 24'h0; // @[Mux.scala 27:73]
  wire [23:0] _s1_repl_tag_T_12 = s1_repl_way_en[4] ? tag_resp_4 : 24'h0; // @[Mux.scala 27:73]
  wire [23:0] _s1_repl_tag_T_13 = s1_repl_way_en[5] ? tag_resp_5 : 24'h0; // @[Mux.scala 27:73]
  wire [23:0] _s1_repl_tag_T_14 = s1_repl_way_en[6] ? tag_resp_6 : 24'h0; // @[Mux.scala 27:73]
  wire [23:0] _s1_repl_tag_T_15 = s1_repl_way_en[7] ? tag_resp_7 : 24'h0; // @[Mux.scala 27:73]
  wire [23:0] _s1_repl_tag_T_16 = _s1_repl_tag_T_8 | _s1_repl_tag_T_9; // @[Mux.scala 27:73]
  wire [23:0] _s1_repl_tag_T_17 = _s1_repl_tag_T_16 | _s1_repl_tag_T_10; // @[Mux.scala 27:73]
  wire [23:0] _s1_repl_tag_T_18 = _s1_repl_tag_T_17 | _s1_repl_tag_T_11; // @[Mux.scala 27:73]
  wire [23:0] _s1_repl_tag_T_19 = _s1_repl_tag_T_18 | _s1_repl_tag_T_12; // @[Mux.scala 27:73]
  wire [23:0] _s1_repl_tag_T_20 = _s1_repl_tag_T_19 | _s1_repl_tag_T_13; // @[Mux.scala 27:73]
  wire [23:0] _s1_repl_tag_T_21 = _s1_repl_tag_T_20 | _s1_repl_tag_T_14; // @[Mux.scala 27:73]
  wire [23:0] s1_repl_tag = _s1_repl_tag_T_21 | _s1_repl_tag_T_15; // @[Mux.scala 27:73]
  wire [1:0] _s1_repl_coh_T_8 = s1_repl_way_en[0] ? meta_resp_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _s1_repl_coh_T_9 = s1_repl_way_en[1] ? meta_resp_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _s1_repl_coh_T_10 = s1_repl_way_en[2] ? meta_resp_2 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _s1_repl_coh_T_11 = s1_repl_way_en[3] ? meta_resp_3 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _s1_repl_coh_T_12 = s1_repl_way_en[4] ? meta_resp_4 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _s1_repl_coh_T_13 = s1_repl_way_en[5] ? meta_resp_5 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _s1_repl_coh_T_14 = s1_repl_way_en[6] ? meta_resp_6 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _s1_repl_coh_T_15 = s1_repl_way_en[7] ? meta_resp_7 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _s1_repl_coh_T_16 = _s1_repl_coh_T_8 | _s1_repl_coh_T_9; // @[Mux.scala 27:73]
  wire [1:0] _s1_repl_coh_T_17 = _s1_repl_coh_T_16 | _s1_repl_coh_T_10; // @[Mux.scala 27:73]
  wire [1:0] _s1_repl_coh_T_18 = _s1_repl_coh_T_17 | _s1_repl_coh_T_11; // @[Mux.scala 27:73]
  wire [1:0] _s1_repl_coh_T_19 = _s1_repl_coh_T_18 | _s1_repl_coh_T_12; // @[Mux.scala 27:73]
  wire [1:0] _s1_repl_coh_T_20 = _s1_repl_coh_T_19 | _s1_repl_coh_T_13; // @[Mux.scala 27:73]
  wire [1:0] _s1_repl_coh_T_21 = _s1_repl_coh_T_20 | _s1_repl_coh_T_14; // @[Mux.scala 27:73]
  wire [1:0] s1_repl_coh_state = _s1_repl_coh_T_21 | _s1_repl_coh_T_15; // @[Mux.scala 27:73]
  wire [23:0] _s1_miss_tag_T_8 = s1_req_miss_way_en[0] ? tag_resp_0 : 24'h0; // @[Mux.scala 27:73]
  wire [23:0] _s1_miss_tag_T_9 = s1_req_miss_way_en[1] ? tag_resp_1 : 24'h0; // @[Mux.scala 27:73]
  wire [23:0] _s1_miss_tag_T_10 = s1_req_miss_way_en[2] ? tag_resp_2 : 24'h0; // @[Mux.scala 27:73]
  wire [23:0] _s1_miss_tag_T_11 = s1_req_miss_way_en[3] ? tag_resp_3 : 24'h0; // @[Mux.scala 27:73]
  wire [23:0] _s1_miss_tag_T_12 = s1_req_miss_way_en[4] ? tag_resp_4 : 24'h0; // @[Mux.scala 27:73]
  wire [23:0] _s1_miss_tag_T_13 = s1_req_miss_way_en[5] ? tag_resp_5 : 24'h0; // @[Mux.scala 27:73]
  wire [23:0] _s1_miss_tag_T_14 = s1_req_miss_way_en[6] ? tag_resp_6 : 24'h0; // @[Mux.scala 27:73]
  wire [23:0] _s1_miss_tag_T_15 = s1_req_miss_way_en[7] ? tag_resp_7 : 24'h0; // @[Mux.scala 27:73]
  wire [23:0] _s1_miss_tag_T_16 = _s1_miss_tag_T_8 | _s1_miss_tag_T_9; // @[Mux.scala 27:73]
  wire [23:0] _s1_miss_tag_T_17 = _s1_miss_tag_T_16 | _s1_miss_tag_T_10; // @[Mux.scala 27:73]
  wire [23:0] _s1_miss_tag_T_18 = _s1_miss_tag_T_17 | _s1_miss_tag_T_11; // @[Mux.scala 27:73]
  wire [23:0] _s1_miss_tag_T_19 = _s1_miss_tag_T_18 | _s1_miss_tag_T_12; // @[Mux.scala 27:73]
  wire [23:0] _s1_miss_tag_T_20 = _s1_miss_tag_T_19 | _s1_miss_tag_T_13; // @[Mux.scala 27:73]
  wire [23:0] _s1_miss_tag_T_21 = _s1_miss_tag_T_20 | _s1_miss_tag_T_14; // @[Mux.scala 27:73]
  wire [23:0] s1_miss_tag = _s1_miss_tag_T_21 | _s1_miss_tag_T_15; // @[Mux.scala 27:73]
  wire [1:0] _s1_miss_coh_T_8 = s1_req_miss_way_en[0] ? meta_resp_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _s1_miss_coh_T_9 = s1_req_miss_way_en[1] ? meta_resp_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _s1_miss_coh_T_10 = s1_req_miss_way_en[2] ? meta_resp_2 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _s1_miss_coh_T_11 = s1_req_miss_way_en[3] ? meta_resp_3 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _s1_miss_coh_T_12 = s1_req_miss_way_en[4] ? meta_resp_4 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _s1_miss_coh_T_13 = s1_req_miss_way_en[5] ? meta_resp_5 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _s1_miss_coh_T_14 = s1_req_miss_way_en[6] ? meta_resp_6 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _s1_miss_coh_T_15 = s1_req_miss_way_en[7] ? meta_resp_7 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _s1_miss_coh_T_16 = _s1_miss_coh_T_8 | _s1_miss_coh_T_9; // @[Mux.scala 27:73]
  wire [1:0] _s1_miss_coh_T_17 = _s1_miss_coh_T_16 | _s1_miss_coh_T_10; // @[Mux.scala 27:73]
  wire [1:0] _s1_miss_coh_T_18 = _s1_miss_coh_T_17 | _s1_miss_coh_T_11; // @[Mux.scala 27:73]
  wire [1:0] _s1_miss_coh_T_19 = _s1_miss_coh_T_18 | _s1_miss_coh_T_12; // @[Mux.scala 27:73]
  wire [1:0] _s1_miss_coh_T_20 = _s1_miss_coh_T_19 | _s1_miss_coh_T_13; // @[Mux.scala 27:73]
  wire [1:0] _s1_miss_coh_T_21 = _s1_miss_coh_T_20 | _s1_miss_coh_T_14; // @[Mux.scala 27:73]
  wire [1:0] s1_miss_coh_state = _s1_miss_coh_T_21 | _s1_miss_coh_T_15; // @[Mux.scala 27:73]
  wire  _s1_need_replacement_T = s1_req_source == 4'h1; // @[MainPipe.scala 71:30]
  wire  _s1_need_replacement_T_1 = ~s1_req_probe; // @[MainPipe.scala 305:63]
  wire  s1_need_replacement = (s1_req_miss | _s1_need_replacement_T & ~s1_req_probe) & ~s1_tag_match; // @[MainPipe.scala 305:78]
  wire [7:0] _s1_way_en_T = s1_need_replacement ? s1_repl_way_en : s1_tag_match_way; // @[MainPipe.scala 312:10]
  wire [7:0] _s1_way_en_T_1 = s1_req_miss ? s1_req_miss_way_en : _s1_way_en_T; // @[MainPipe.scala 309:8]
  wire [7:0] s1_way_en = s1_req_replace ? s1_req_replace_way_en : _s1_way_en_T_1; // @[MainPipe.scala 306:22]
  wire [23:0] _s1_tag_T_1 = s1_need_replacement ? s1_repl_tag : s1_hit_tag; // @[MainPipe.scala 326:10]
  wire [23:0] _s1_tag_T_2 = s1_req_miss ? s1_miss_tag : _s1_tag_T_1; // @[MainPipe.scala 323:8]
  wire [23:0] s1_tag = s1_req_replace ? s1_req_addr[35:12] : _s1_tag_T_2; // @[MainPipe.scala 320:19]
  wire [1:0] _s1_coh_T_8 = s1_req_replace_way_en[0] ? meta_resp_0 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _s1_coh_T_9 = s1_req_replace_way_en[1] ? meta_resp_1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _s1_coh_T_10 = s1_req_replace_way_en[2] ? meta_resp_2 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _s1_coh_T_11 = s1_req_replace_way_en[3] ? meta_resp_3 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _s1_coh_T_12 = s1_req_replace_way_en[4] ? meta_resp_4 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _s1_coh_T_13 = s1_req_replace_way_en[5] ? meta_resp_5 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _s1_coh_T_14 = s1_req_replace_way_en[6] ? meta_resp_6 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _s1_coh_T_15 = s1_req_replace_way_en[7] ? meta_resp_7 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _s1_coh_T_16 = _s1_coh_T_8 | _s1_coh_T_9; // @[Mux.scala 27:73]
  wire [1:0] _s1_coh_T_17 = _s1_coh_T_16 | _s1_coh_T_10; // @[Mux.scala 27:73]
  wire [1:0] _s1_coh_T_18 = _s1_coh_T_17 | _s1_coh_T_11; // @[Mux.scala 27:73]
  wire [1:0] _s1_coh_T_19 = _s1_coh_T_18 | _s1_coh_T_12; // @[Mux.scala 27:73]
  wire [1:0] _s1_coh_T_20 = _s1_coh_T_19 | _s1_coh_T_13; // @[Mux.scala 27:73]
  wire [1:0] _s1_coh_T_21 = _s1_coh_T_20 | _s1_coh_T_14; // @[Mux.scala 27:73]
  wire [1:0] _s1_coh_T_22 = _s1_coh_T_21 | _s1_coh_T_15; // @[Mux.scala 27:73]
  wire  _s1_has_permission_c_cat_T_5 = s1_req_cmd == 5'h4; // @[package.scala 15:47]
  wire  _s1_has_permission_c_cat_T_6 = s1_req_cmd == 5'h9; // @[package.scala 15:47]
  wire  _s1_has_permission_c_cat_T_7 = s1_req_cmd == 5'ha; // @[package.scala 15:47]
  wire  _s1_has_permission_c_cat_T_8 = s1_req_cmd == 5'hb; // @[package.scala 15:47]
  wire  _s1_has_permission_c_cat_T_11 = _s1_has_permission_c_cat_T_5 | _s1_has_permission_c_cat_T_6 |
    _s1_has_permission_c_cat_T_7 | _s1_has_permission_c_cat_T_8; // @[package.scala 72:59]
  wire  _s1_has_permission_c_cat_T_12 = s1_req_cmd == 5'h8; // @[package.scala 15:47]
  wire  _s1_has_permission_c_cat_T_13 = s1_req_cmd == 5'hc; // @[package.scala 15:47]
  wire  _s1_has_permission_c_cat_T_14 = s1_req_cmd == 5'hd; // @[package.scala 15:47]
  wire  _s1_has_permission_c_cat_T_15 = s1_req_cmd == 5'he; // @[package.scala 15:47]
  wire  _s1_has_permission_c_cat_T_16 = s1_req_cmd == 5'hf; // @[package.scala 15:47]
  wire  _s1_has_permission_c_cat_T_20 = _s1_has_permission_c_cat_T_12 | _s1_has_permission_c_cat_T_13 |
    _s1_has_permission_c_cat_T_14 | _s1_has_permission_c_cat_T_15 | _s1_has_permission_c_cat_T_16; // @[package.scala 72:59]
  wire  _s1_has_permission_c_cat_T_21 = _s1_has_permission_c_cat_T_11 | _s1_has_permission_c_cat_T_20; // @[Consts.scala 82:44]
  wire  _s1_has_permission_c_cat_T_22 = s1_req_cmd == 5'h1 | s1_req_cmd == 5'h11 | s1_req_cmd == 5'h7 |
    _s1_has_permission_c_cat_T_21; // @[Consts.scala 85:76]
  wire  _s1_has_permission_c_cat_T_49 = _s1_has_permission_c_cat_T_22 | s1_req_cmd == 5'h3 | s1_req_cmd == 5'h6; // @[Consts.scala 86:64]
  wire [3:0] _s1_has_permission_T = {_s1_has_permission_c_cat_T_22,_s1_has_permission_c_cat_T_49,s1_hit_coh_state}; // @[Cat.scala 31:58]
  wire  _s1_has_permission_T_40 = 4'he == _s1_has_permission_T; // @[Misc.scala 48:20]
  wire  _s1_has_permission_T_43 = 4'hf == _s1_has_permission_T; // @[Misc.scala 48:20]
  wire  _s1_has_permission_T_46 = 4'h6 == _s1_has_permission_T; // @[Misc.scala 48:20]
  wire  _s1_has_permission_T_49 = 4'h7 == _s1_has_permission_T; // @[Misc.scala 48:20]
  wire  _s1_has_permission_T_52 = 4'h1 == _s1_has_permission_T; // @[Misc.scala 48:20]
  wire  _s1_has_permission_T_55 = 4'h2 == _s1_has_permission_T; // @[Misc.scala 48:20]
  wire  _s1_has_permission_T_58 = 4'h3 == _s1_has_permission_T; // @[Misc.scala 48:20]
  wire  s1_has_permission = _s1_has_permission_T_58 | (_s1_has_permission_T_55 | (_s1_has_permission_T_52 | (
    _s1_has_permission_T_49 | (_s1_has_permission_T_46 | (_s1_has_permission_T_43 | _s1_has_permission_T_40))))); // @[Misc.scala 34:9]
  wire  s1_hit = s1_tag_match & s1_has_permission; // @[MainPipe.scala 340:29]
  wire  _s1_pregen_can_go_to_mq_T_6 = s1_req_source == 4'h2; // @[MainPipe.scala 72:28]
  wire  s1_pregen_can_go_to_mq = ~s1_req_replace & _s1_need_replacement_T_1 & ~s1_req_miss & (_s1_need_replacement_T |
    _s1_pregen_can_go_to_mq_T_6) & ~s1_hit; // @[MainPipe.scala 341:117]
  wire [35:0] _io_probe_ttob_check_req_bits_addr_T_1 = {s1_tag,s1_req_vaddr[11:0]}; // @[Cat.scala 31:58]
  reg  s2_valid; // @[MainPipe.scala 348:25]
  reg [1:0] s2_req_miss_id; // @[Reg.scala 16:16]
  reg [1:0] s2_req_miss_param; // @[Reg.scala 16:16]
  reg  s2_req_miss_dirty; // @[Reg.scala 16:16]
  reg [1:0] s2_req_probe_param; // @[Reg.scala 16:16]
  reg  s2_req_probe_need_data; // @[Reg.scala 16:16]
  reg [35:0] s2_req_addr; // @[Reg.scala 16:16]
  reg [511:0] s2_req_store_data; // @[Reg.scala 16:16]
  reg [63:0] s2_req_store_mask; // @[Reg.scala 16:16]
  reg [2:0] s2_req_word_idx; // @[Reg.scala 16:16]
  reg [63:0] s2_req_amo_data; // @[Reg.scala 16:16]
  reg [7:0] s2_req_amo_mask; // @[Reg.scala 16:16]
  reg  s2_req_error; // @[Reg.scala 16:16]
  reg  s2_req_replace; // @[Reg.scala 16:16]
  reg [3:0] s2_req_id; // @[Reg.scala 16:16]
  reg [7:0] s2_tag_match_way; // @[Reg.scala 16:16]
  wire [1:0] _T_87 = _T_85 ? 2'h1 : 2'h0; // @[Misc.scala 34:36]
  wire [1:0] _T_90 = _T_88 ? 2'h2 : _T_87; // @[Misc.scala 34:36]
  wire [1:0] _T_93 = _T_91 ? 2'h1 : _T_90; // @[Misc.scala 34:36]
  wire [1:0] _T_96 = _T_94 ? 2'h2 : _T_93; // @[Misc.scala 34:36]
  wire [1:0] _T_99 = _T_97 ? 2'h0 : _T_96; // @[Misc.scala 34:36]
  wire [1:0] _T_102 = _T_100 ? 2'h3 : _T_99; // @[Misc.scala 34:36]
  wire [1:0] _T_105 = _T_103 ? 2'h3 : _T_102; // @[Misc.scala 34:36]
  wire [1:0] _T_108 = _T_106 ? 2'h2 : _T_105; // @[Misc.scala 34:36]
  wire [1:0] _T_111 = _T_109 ? 2'h3 : _T_108; // @[Misc.scala 34:36]
  reg [23:0] s2_repl_tag; // @[Reg.scala 16:16]
  reg [1:0] s2_repl_coh_state; // @[Reg.scala 16:16]
  reg [7:0] s2_repl_way_en; // @[Reg.scala 16:16]
  reg  s2_need_replacement; // @[Reg.scala 16:16]
  reg  s2_need_data; // @[Reg.scala 16:16]
  reg  s2_need_tag; // @[Reg.scala 16:16]
  reg [29:0] s2_encTag; // @[Reg.scala 16:16]
  reg  s2_valid_dup_2; // @[MainPipe.scala 365:29]
  reg  s2_valid_dup_4; // @[MainPipe.scala 365:29]
  reg  s2_valid_dup_5; // @[MainPipe.scala 365:29]
  reg  s2_valid_dup_6; // @[MainPipe.scala 365:29]
  reg  s2_valid_dup_7; // @[MainPipe.scala 365:29]
  reg  s2_valid_dup_for_status_0; // @[MainPipe.scala 366:40]
  reg  s2_valid_dup_for_status_1; // @[MainPipe.scala 366:40]
  reg  s2_valid_dup_for_status_2; // @[MainPipe.scala 366:40]
  reg  s2_valid_dup_for_status_3; // @[MainPipe.scala 366:40]
  reg  s2_valid_dup_for_status_4; // @[MainPipe.scala 366:40]
  reg  s2_valid_dup_for_status_5; // @[MainPipe.scala 366:40]
  reg  s2_valid_dup_for_status_6; // @[MainPipe.scala 366:40]
  reg  s2_valid_dup_for_status_7; // @[MainPipe.scala 366:40]
  reg  s2_valid_dup_for_status_8; // @[MainPipe.scala 366:40]
  reg  s2_valid_dup_for_status_9; // @[MainPipe.scala 366:40]
  reg  s2_valid_dup_for_status_10; // @[MainPipe.scala 366:40]
  reg  s2_valid_dup_for_status_11; // @[MainPipe.scala 366:40]
  reg  s2_valid_dup_for_status_12; // @[MainPipe.scala 366:40]
  reg  s2_valid_dup_for_status_13; // @[MainPipe.scala 366:40]
  reg  s2_valid_dup_for_status_14; // @[MainPipe.scala 366:40]
  reg  s2_valid_dup_for_status_15; // @[MainPipe.scala 366:40]
  reg  s2_valid_dup_for_status_16; // @[MainPipe.scala 366:40]
  reg  s2_valid_dup_for_status_17; // @[MainPipe.scala 366:40]
  reg  s2_valid_dup_for_status_18; // @[MainPipe.scala 366:40]
  reg  s2_valid_dup_for_status_19; // @[MainPipe.scala 366:40]
  reg  s2_valid_dup_for_status_20; // @[MainPipe.scala 366:40]
  reg  s2_valid_dup_for_status_21; // @[MainPipe.scala 366:40]
  reg  s2_valid_dup_for_status_22; // @[MainPipe.scala 366:40]
  reg  s2_valid_dup_for_status_23; // @[MainPipe.scala 366:40]
  reg [38:0] s2_req_vaddr_dup_for_miss_req; // @[Reg.scala 16:16]
  reg [5:0] s2_idx_dup_for_status; // @[Reg.scala 16:16]
  reg [5:0] s2_idx_dup_for_replace_access; // @[Reg.scala 16:16]
  reg  s2_req_replace_dup_2; // @[Reg.scala 16:16]
  reg  s2_can_go_to_mq_dup_0; // @[Reg.scala 16:16]
  reg  s2_can_go_to_mq_dup_1; // @[Reg.scala 16:16]
  reg  s2_can_go_to_mq_dup_2; // @[Reg.scala 16:16]
  reg [7:0] s2_way_en; // @[Reg.scala 16:16]
  reg [23:0] s2_tag; // @[Reg.scala 16:16]
  reg [1:0] s2_coh_state; // @[Reg.scala 16:16]
  reg [7:0] s2_banked_store_wmask; // @[Reg.scala 16:16]
  reg  s2_flag_error; // @[Reg.scala 16:16]
  wire [28:0] _s2_tag_error_syndromeUInt_T = 29'h1aaad5b & s2_encTag[28:0]; // @[ECC.scala 156:66]
  wire [28:0] _s2_tag_error_syndromeUInt_T_2 = 29'h233366d & s2_encTag[28:0]; // @[ECC.scala 156:66]
  wire [28:0] _s2_tag_error_syndromeUInt_T_4 = 29'h4c3c78e & s2_encTag[28:0]; // @[ECC.scala 156:66]
  wire [28:0] _s2_tag_error_syndromeUInt_T_6 = 29'h8fc07f0 & s2_encTag[28:0]; // @[ECC.scala 156:66]
  wire [28:0] _s2_tag_error_syndromeUInt_T_8 = 29'h10fff800 & s2_encTag[28:0]; // @[ECC.scala 156:66]
  wire [4:0] s2_tag_error_syndromeUInt = {^_s2_tag_error_syndromeUInt_T_8,^_s2_tag_error_syndromeUInt_T_6,^
    _s2_tag_error_syndromeUInt_T_4,^_s2_tag_error_syndromeUInt_T_2,^_s2_tag_error_syndromeUInt_T}; // @[ECC.scala 156:78]
  wire  s2_tag_error_correctable = |s2_tag_error_syndromeUInt; // @[ECC.scala 163:36]
  wire  s2_tag_error_uncorrectable_1 = ^s2_encTag; // @[ECC.scala 87:27]
  wire  s2_tag_error_uncorrectable_2 = ~s2_tag_error_uncorrectable_1 & s2_tag_error_correctable; // @[ECC.scala 195:47]
  wire  _s2_tag_error_T_1 = s2_tag_error_uncorrectable_1 | s2_tag_error_uncorrectable_2; // @[ECC.scala 31:27]
  wire  s2_tag_error = _s2_tag_error_T_1 & s2_need_tag; // @[MainPipe.scala 381:71]
  wire  s2_error = s2_flag_error | s2_tag_error | s2_req_error; // @[MainPipe.scala 383:48]
  wire  _s2_amo_hit_T = ~s2_req_probe; // @[MainPipe.scala 388:30]
  wire  _s2_amo_hit_T_3 = s2_hit & ~s2_req_probe & ~s2_req_miss; // @[MainPipe.scala 388:44]
  wire  s2_amo_hit = s2_hit & ~s2_req_probe & ~s2_req_miss & _s2_can_go_to_s3_T_3; // @[MainPipe.scala 388:60]
  wire  s2_store_hit = _s2_amo_hit_T_3 & _s2_can_go_to_s3_T_2; // @[MainPipe.scala 389:62]
  wire  s2_fire = s2_valid & s2_can_go; // @[MainPipe.scala 399:26]
  wire  s2_fire_to_s3 = s2_valid_dup_2 & s2_can_go_to_s3; // @[MainPipe.scala 400:39]
  wire  _GEN_134 = s2_fire ? 1'h0 : s2_valid; // @[MainPipe.scala 405:24 406:14 348:25]
  wire  _GEN_135 = s2_fire ? 1'h0 : s2_valid_dup_0; // @[MainPipe.scala 405:24 407:28 365:29]
  wire  _GEN_136 = s2_fire ? 1'h0 : s2_valid_dup_1; // @[MainPipe.scala 405:24 407:28 365:29]
  wire  _GEN_137 = s2_fire ? 1'h0 : s2_valid_dup_2; // @[MainPipe.scala 405:24 407:28 365:29]
  wire  _GEN_138 = s2_fire ? 1'h0 : s2_valid_dup_3; // @[MainPipe.scala 405:24 407:28 365:29]
  wire  _GEN_139 = s2_fire ? 1'h0 : s2_valid_dup_4; // @[MainPipe.scala 405:24 407:28 365:29]
  wire  _GEN_140 = s2_fire ? 1'h0 : s2_valid_dup_5; // @[MainPipe.scala 405:24 407:28 365:29]
  wire  _GEN_141 = s2_fire ? 1'h0 : s2_valid_dup_6; // @[MainPipe.scala 405:24 407:28 365:29]
  wire  _GEN_142 = s2_fire ? 1'h0 : s2_valid_dup_7; // @[MainPipe.scala 405:24 407:28 365:29]
  wire  _GEN_143 = s2_fire ? 1'h0 : s2_valid_dup_for_status_0; // @[MainPipe.scala 405:24 408:39 366:40]
  wire  _GEN_144 = s2_fire ? 1'h0 : s2_valid_dup_for_status_1; // @[MainPipe.scala 405:24 408:39 366:40]
  wire  _GEN_145 = s2_fire ? 1'h0 : s2_valid_dup_for_status_2; // @[MainPipe.scala 405:24 408:39 366:40]
  wire  _GEN_146 = s2_fire ? 1'h0 : s2_valid_dup_for_status_3; // @[MainPipe.scala 405:24 408:39 366:40]
  wire  _GEN_147 = s2_fire ? 1'h0 : s2_valid_dup_for_status_4; // @[MainPipe.scala 405:24 408:39 366:40]
  wire  _GEN_148 = s2_fire ? 1'h0 : s2_valid_dup_for_status_5; // @[MainPipe.scala 405:24 408:39 366:40]
  wire  _GEN_149 = s2_fire ? 1'h0 : s2_valid_dup_for_status_6; // @[MainPipe.scala 405:24 408:39 366:40]
  wire  _GEN_150 = s2_fire ? 1'h0 : s2_valid_dup_for_status_7; // @[MainPipe.scala 405:24 408:39 366:40]
  wire  _GEN_151 = s2_fire ? 1'h0 : s2_valid_dup_for_status_8; // @[MainPipe.scala 405:24 408:39 366:40]
  wire  _GEN_152 = s2_fire ? 1'h0 : s2_valid_dup_for_status_9; // @[MainPipe.scala 405:24 408:39 366:40]
  wire  _GEN_153 = s2_fire ? 1'h0 : s2_valid_dup_for_status_10; // @[MainPipe.scala 405:24 408:39 366:40]
  wire  _GEN_154 = s2_fire ? 1'h0 : s2_valid_dup_for_status_11; // @[MainPipe.scala 405:24 408:39 366:40]
  wire  _GEN_155 = s2_fire ? 1'h0 : s2_valid_dup_for_status_12; // @[MainPipe.scala 405:24 408:39 366:40]
  wire  _GEN_156 = s2_fire ? 1'h0 : s2_valid_dup_for_status_13; // @[MainPipe.scala 405:24 408:39 366:40]
  wire  _GEN_157 = s2_fire ? 1'h0 : s2_valid_dup_for_status_14; // @[MainPipe.scala 405:24 408:39 366:40]
  wire  _GEN_158 = s2_fire ? 1'h0 : s2_valid_dup_for_status_15; // @[MainPipe.scala 405:24 408:39 366:40]
  wire  _GEN_159 = s2_fire ? 1'h0 : s2_valid_dup_for_status_16; // @[MainPipe.scala 405:24 408:39 366:40]
  wire  _GEN_160 = s2_fire ? 1'h0 : s2_valid_dup_for_status_17; // @[MainPipe.scala 405:24 408:39 366:40]
  wire  _GEN_161 = s2_fire ? 1'h0 : s2_valid_dup_for_status_18; // @[MainPipe.scala 405:24 408:39 366:40]
  wire  _GEN_162 = s2_fire ? 1'h0 : s2_valid_dup_for_status_19; // @[MainPipe.scala 405:24 408:39 366:40]
  wire  _GEN_163 = s2_fire ? 1'h0 : s2_valid_dup_for_status_20; // @[MainPipe.scala 405:24 408:39 366:40]
  wire  _GEN_164 = s2_fire ? 1'h0 : s2_valid_dup_for_status_21; // @[MainPipe.scala 405:24 408:39 366:40]
  wire  _GEN_165 = s2_fire ? 1'h0 : s2_valid_dup_for_status_22; // @[MainPipe.scala 405:24 408:39 366:40]
  wire  _GEN_166 = s2_fire ? 1'h0 : s2_valid_dup_for_status_23; // @[MainPipe.scala 405:24 408:39 366:40]
  wire  replay = ~io_miss_req_ready; // @[MainPipe.scala 411:16]
  reg  REG_12; // @[MainPipe.scala 414:27]
  reg [63:0] REG_13_0_raw_data; // @[MainPipe.scala 414:59]
  reg [63:0] REG_13_1_raw_data; // @[MainPipe.scala 414:59]
  reg [63:0] REG_13_2_raw_data; // @[MainPipe.scala 414:59]
  reg [63:0] REG_13_3_raw_data; // @[MainPipe.scala 414:59]
  reg [63:0] REG_13_4_raw_data; // @[MainPipe.scala 414:59]
  reg [63:0] REG_13_5_raw_data; // @[MainPipe.scala 414:59]
  reg [63:0] REG_13_6_raw_data; // @[MainPipe.scala 414:59]
  reg [63:0] REG_13_7_raw_data; // @[MainPipe.scala 414:59]
  wire [63:0] data_resp_0_raw_data = REG_12 ? io_data_resp_0_raw_data : REG_13_0_raw_data; // @[MainPipe.scala 414:19]
  wire [63:0] data_resp_1_raw_data = REG_12 ? io_data_resp_1_raw_data : REG_13_1_raw_data; // @[MainPipe.scala 414:19]
  wire [63:0] data_resp_2_raw_data = REG_12 ? io_data_resp_2_raw_data : REG_13_2_raw_data; // @[MainPipe.scala 414:19]
  wire [63:0] data_resp_3_raw_data = REG_12 ? io_data_resp_3_raw_data : REG_13_3_raw_data; // @[MainPipe.scala 414:19]
  wire [63:0] data_resp_4_raw_data = REG_12 ? io_data_resp_4_raw_data : REG_13_4_raw_data; // @[MainPipe.scala 414:19]
  wire [63:0] data_resp_5_raw_data = REG_12 ? io_data_resp_5_raw_data : REG_13_5_raw_data; // @[MainPipe.scala 414:19]
  wire [63:0] data_resp_6_raw_data = REG_12 ? io_data_resp_6_raw_data : REG_13_6_raw_data; // @[MainPipe.scala 414:19]
  wire [63:0] data_resp_7_raw_data = REG_12 ? io_data_resp_7_raw_data : REG_13_7_raw_data; // @[MainPipe.scala 414:19]
  wire [63:0] new_data = s2_req_store_data[63:0]; // @[DCacheWrapper.scala 196:9]
  wire [7:0] wmask = s2_amo_hit ? 8'h0 : s2_req_store_mask[7:0]; // @[MainPipe.scala 431:20]
  wire [7:0] _s2_store_data_merged_0_full_wmask_T_9 = wmask[0] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s2_store_data_merged_0_full_wmask_T_11 = wmask[1] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s2_store_data_merged_0_full_wmask_T_13 = wmask[2] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s2_store_data_merged_0_full_wmask_T_15 = wmask[3] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s2_store_data_merged_0_full_wmask_T_17 = wmask[4] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s2_store_data_merged_0_full_wmask_T_19 = wmask[5] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s2_store_data_merged_0_full_wmask_T_21 = wmask[6] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s2_store_data_merged_0_full_wmask_T_23 = wmask[7] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [63:0] s2_store_data_merged_0_full_wmask = {_s2_store_data_merged_0_full_wmask_T_23,
    _s2_store_data_merged_0_full_wmask_T_21,_s2_store_data_merged_0_full_wmask_T_19,
    _s2_store_data_merged_0_full_wmask_T_17,_s2_store_data_merged_0_full_wmask_T_15,
    _s2_store_data_merged_0_full_wmask_T_13,_s2_store_data_merged_0_full_wmask_T_11,
    _s2_store_data_merged_0_full_wmask_T_9}; // @[Cat.scala 31:58]
  wire [63:0] _s2_store_data_merged_0_T = ~s2_store_data_merged_0_full_wmask; // @[MainPipe.scala 419:7]
  wire [63:0] _s2_store_data_merged_0_T_1 = _s2_store_data_merged_0_T & data_resp_0_raw_data; // @[MainPipe.scala 419:19]
  wire [63:0] _s2_store_data_merged_0_T_2 = s2_store_data_merged_0_full_wmask & new_data; // @[MainPipe.scala 419:45]
  wire [63:0] s2_store_data_merged_0 = _s2_store_data_merged_0_T_1 | _s2_store_data_merged_0_T_2; // @[MainPipe.scala 419:31]
  wire [63:0] new_data_1 = s2_req_store_data[127:64]; // @[DCacheWrapper.scala 196:9]
  wire [7:0] wmask_1 = s2_amo_hit ? 8'h0 : s2_req_store_mask[15:8]; // @[MainPipe.scala 431:20]
  wire [7:0] _s2_store_data_merged_1_full_wmask_T_9 = wmask_1[0] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s2_store_data_merged_1_full_wmask_T_11 = wmask_1[1] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s2_store_data_merged_1_full_wmask_T_13 = wmask_1[2] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s2_store_data_merged_1_full_wmask_T_15 = wmask_1[3] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s2_store_data_merged_1_full_wmask_T_17 = wmask_1[4] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s2_store_data_merged_1_full_wmask_T_19 = wmask_1[5] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s2_store_data_merged_1_full_wmask_T_21 = wmask_1[6] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s2_store_data_merged_1_full_wmask_T_23 = wmask_1[7] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [63:0] s2_store_data_merged_1_full_wmask = {_s2_store_data_merged_1_full_wmask_T_23,
    _s2_store_data_merged_1_full_wmask_T_21,_s2_store_data_merged_1_full_wmask_T_19,
    _s2_store_data_merged_1_full_wmask_T_17,_s2_store_data_merged_1_full_wmask_T_15,
    _s2_store_data_merged_1_full_wmask_T_13,_s2_store_data_merged_1_full_wmask_T_11,
    _s2_store_data_merged_1_full_wmask_T_9}; // @[Cat.scala 31:58]
  wire [63:0] _s2_store_data_merged_1_T = ~s2_store_data_merged_1_full_wmask; // @[MainPipe.scala 419:7]
  wire [63:0] _s2_store_data_merged_1_T_1 = _s2_store_data_merged_1_T & data_resp_1_raw_data; // @[MainPipe.scala 419:19]
  wire [63:0] _s2_store_data_merged_1_T_2 = s2_store_data_merged_1_full_wmask & new_data_1; // @[MainPipe.scala 419:45]
  wire [63:0] s2_store_data_merged_1 = _s2_store_data_merged_1_T_1 | _s2_store_data_merged_1_T_2; // @[MainPipe.scala 419:31]
  wire [63:0] new_data_2 = s2_req_store_data[191:128]; // @[DCacheWrapper.scala 196:9]
  wire [7:0] wmask_2 = s2_amo_hit ? 8'h0 : s2_req_store_mask[23:16]; // @[MainPipe.scala 431:20]
  wire [7:0] _s2_store_data_merged_2_full_wmask_T_9 = wmask_2[0] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s2_store_data_merged_2_full_wmask_T_11 = wmask_2[1] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s2_store_data_merged_2_full_wmask_T_13 = wmask_2[2] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s2_store_data_merged_2_full_wmask_T_15 = wmask_2[3] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s2_store_data_merged_2_full_wmask_T_17 = wmask_2[4] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s2_store_data_merged_2_full_wmask_T_19 = wmask_2[5] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s2_store_data_merged_2_full_wmask_T_21 = wmask_2[6] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s2_store_data_merged_2_full_wmask_T_23 = wmask_2[7] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [63:0] s2_store_data_merged_2_full_wmask = {_s2_store_data_merged_2_full_wmask_T_23,
    _s2_store_data_merged_2_full_wmask_T_21,_s2_store_data_merged_2_full_wmask_T_19,
    _s2_store_data_merged_2_full_wmask_T_17,_s2_store_data_merged_2_full_wmask_T_15,
    _s2_store_data_merged_2_full_wmask_T_13,_s2_store_data_merged_2_full_wmask_T_11,
    _s2_store_data_merged_2_full_wmask_T_9}; // @[Cat.scala 31:58]
  wire [63:0] _s2_store_data_merged_2_T = ~s2_store_data_merged_2_full_wmask; // @[MainPipe.scala 419:7]
  wire [63:0] _s2_store_data_merged_2_T_1 = _s2_store_data_merged_2_T & data_resp_2_raw_data; // @[MainPipe.scala 419:19]
  wire [63:0] _s2_store_data_merged_2_T_2 = s2_store_data_merged_2_full_wmask & new_data_2; // @[MainPipe.scala 419:45]
  wire [63:0] s2_store_data_merged_2 = _s2_store_data_merged_2_T_1 | _s2_store_data_merged_2_T_2; // @[MainPipe.scala 419:31]
  wire [63:0] new_data_3 = s2_req_store_data[255:192]; // @[DCacheWrapper.scala 196:9]
  wire [7:0] wmask_3 = s2_amo_hit ? 8'h0 : s2_req_store_mask[31:24]; // @[MainPipe.scala 431:20]
  wire [7:0] _s2_store_data_merged_3_full_wmask_T_9 = wmask_3[0] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s2_store_data_merged_3_full_wmask_T_11 = wmask_3[1] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s2_store_data_merged_3_full_wmask_T_13 = wmask_3[2] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s2_store_data_merged_3_full_wmask_T_15 = wmask_3[3] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s2_store_data_merged_3_full_wmask_T_17 = wmask_3[4] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s2_store_data_merged_3_full_wmask_T_19 = wmask_3[5] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s2_store_data_merged_3_full_wmask_T_21 = wmask_3[6] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s2_store_data_merged_3_full_wmask_T_23 = wmask_3[7] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [63:0] s2_store_data_merged_3_full_wmask = {_s2_store_data_merged_3_full_wmask_T_23,
    _s2_store_data_merged_3_full_wmask_T_21,_s2_store_data_merged_3_full_wmask_T_19,
    _s2_store_data_merged_3_full_wmask_T_17,_s2_store_data_merged_3_full_wmask_T_15,
    _s2_store_data_merged_3_full_wmask_T_13,_s2_store_data_merged_3_full_wmask_T_11,
    _s2_store_data_merged_3_full_wmask_T_9}; // @[Cat.scala 31:58]
  wire [63:0] _s2_store_data_merged_3_T = ~s2_store_data_merged_3_full_wmask; // @[MainPipe.scala 419:7]
  wire [63:0] _s2_store_data_merged_3_T_1 = _s2_store_data_merged_3_T & data_resp_3_raw_data; // @[MainPipe.scala 419:19]
  wire [63:0] _s2_store_data_merged_3_T_2 = s2_store_data_merged_3_full_wmask & new_data_3; // @[MainPipe.scala 419:45]
  wire [63:0] s2_store_data_merged_3 = _s2_store_data_merged_3_T_1 | _s2_store_data_merged_3_T_2; // @[MainPipe.scala 419:31]
  wire [63:0] new_data_4 = s2_req_store_data[319:256]; // @[DCacheWrapper.scala 196:9]
  wire [7:0] wmask_4 = s2_amo_hit ? 8'h0 : s2_req_store_mask[39:32]; // @[MainPipe.scala 431:20]
  wire [7:0] _s2_store_data_merged_4_full_wmask_T_9 = wmask_4[0] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s2_store_data_merged_4_full_wmask_T_11 = wmask_4[1] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s2_store_data_merged_4_full_wmask_T_13 = wmask_4[2] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s2_store_data_merged_4_full_wmask_T_15 = wmask_4[3] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s2_store_data_merged_4_full_wmask_T_17 = wmask_4[4] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s2_store_data_merged_4_full_wmask_T_19 = wmask_4[5] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s2_store_data_merged_4_full_wmask_T_21 = wmask_4[6] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s2_store_data_merged_4_full_wmask_T_23 = wmask_4[7] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [63:0] s2_store_data_merged_4_full_wmask = {_s2_store_data_merged_4_full_wmask_T_23,
    _s2_store_data_merged_4_full_wmask_T_21,_s2_store_data_merged_4_full_wmask_T_19,
    _s2_store_data_merged_4_full_wmask_T_17,_s2_store_data_merged_4_full_wmask_T_15,
    _s2_store_data_merged_4_full_wmask_T_13,_s2_store_data_merged_4_full_wmask_T_11,
    _s2_store_data_merged_4_full_wmask_T_9}; // @[Cat.scala 31:58]
  wire [63:0] _s2_store_data_merged_4_T = ~s2_store_data_merged_4_full_wmask; // @[MainPipe.scala 419:7]
  wire [63:0] _s2_store_data_merged_4_T_1 = _s2_store_data_merged_4_T & data_resp_4_raw_data; // @[MainPipe.scala 419:19]
  wire [63:0] _s2_store_data_merged_4_T_2 = s2_store_data_merged_4_full_wmask & new_data_4; // @[MainPipe.scala 419:45]
  wire [63:0] s2_store_data_merged_4 = _s2_store_data_merged_4_T_1 | _s2_store_data_merged_4_T_2; // @[MainPipe.scala 419:31]
  wire [63:0] new_data_5 = s2_req_store_data[383:320]; // @[DCacheWrapper.scala 196:9]
  wire [7:0] wmask_5 = s2_amo_hit ? 8'h0 : s2_req_store_mask[47:40]; // @[MainPipe.scala 431:20]
  wire [7:0] _s2_store_data_merged_5_full_wmask_T_9 = wmask_5[0] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s2_store_data_merged_5_full_wmask_T_11 = wmask_5[1] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s2_store_data_merged_5_full_wmask_T_13 = wmask_5[2] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s2_store_data_merged_5_full_wmask_T_15 = wmask_5[3] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s2_store_data_merged_5_full_wmask_T_17 = wmask_5[4] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s2_store_data_merged_5_full_wmask_T_19 = wmask_5[5] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s2_store_data_merged_5_full_wmask_T_21 = wmask_5[6] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s2_store_data_merged_5_full_wmask_T_23 = wmask_5[7] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [63:0] s2_store_data_merged_5_full_wmask = {_s2_store_data_merged_5_full_wmask_T_23,
    _s2_store_data_merged_5_full_wmask_T_21,_s2_store_data_merged_5_full_wmask_T_19,
    _s2_store_data_merged_5_full_wmask_T_17,_s2_store_data_merged_5_full_wmask_T_15,
    _s2_store_data_merged_5_full_wmask_T_13,_s2_store_data_merged_5_full_wmask_T_11,
    _s2_store_data_merged_5_full_wmask_T_9}; // @[Cat.scala 31:58]
  wire [63:0] _s2_store_data_merged_5_T = ~s2_store_data_merged_5_full_wmask; // @[MainPipe.scala 419:7]
  wire [63:0] _s2_store_data_merged_5_T_1 = _s2_store_data_merged_5_T & data_resp_5_raw_data; // @[MainPipe.scala 419:19]
  wire [63:0] _s2_store_data_merged_5_T_2 = s2_store_data_merged_5_full_wmask & new_data_5; // @[MainPipe.scala 419:45]
  wire [63:0] s2_store_data_merged_5 = _s2_store_data_merged_5_T_1 | _s2_store_data_merged_5_T_2; // @[MainPipe.scala 419:31]
  wire [63:0] new_data_6 = s2_req_store_data[447:384]; // @[DCacheWrapper.scala 196:9]
  wire [7:0] wmask_6 = s2_amo_hit ? 8'h0 : s2_req_store_mask[55:48]; // @[MainPipe.scala 431:20]
  wire [7:0] _s2_store_data_merged_6_full_wmask_T_9 = wmask_6[0] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s2_store_data_merged_6_full_wmask_T_11 = wmask_6[1] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s2_store_data_merged_6_full_wmask_T_13 = wmask_6[2] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s2_store_data_merged_6_full_wmask_T_15 = wmask_6[3] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s2_store_data_merged_6_full_wmask_T_17 = wmask_6[4] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s2_store_data_merged_6_full_wmask_T_19 = wmask_6[5] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s2_store_data_merged_6_full_wmask_T_21 = wmask_6[6] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s2_store_data_merged_6_full_wmask_T_23 = wmask_6[7] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [63:0] s2_store_data_merged_6_full_wmask = {_s2_store_data_merged_6_full_wmask_T_23,
    _s2_store_data_merged_6_full_wmask_T_21,_s2_store_data_merged_6_full_wmask_T_19,
    _s2_store_data_merged_6_full_wmask_T_17,_s2_store_data_merged_6_full_wmask_T_15,
    _s2_store_data_merged_6_full_wmask_T_13,_s2_store_data_merged_6_full_wmask_T_11,
    _s2_store_data_merged_6_full_wmask_T_9}; // @[Cat.scala 31:58]
  wire [63:0] _s2_store_data_merged_6_T = ~s2_store_data_merged_6_full_wmask; // @[MainPipe.scala 419:7]
  wire [63:0] _s2_store_data_merged_6_T_1 = _s2_store_data_merged_6_T & data_resp_6_raw_data; // @[MainPipe.scala 419:19]
  wire [63:0] _s2_store_data_merged_6_T_2 = s2_store_data_merged_6_full_wmask & new_data_6; // @[MainPipe.scala 419:45]
  wire [63:0] s2_store_data_merged_6 = _s2_store_data_merged_6_T_1 | _s2_store_data_merged_6_T_2; // @[MainPipe.scala 419:31]
  wire [63:0] new_data_7 = s2_req_store_data[511:448]; // @[DCacheWrapper.scala 196:9]
  wire [7:0] wmask_7 = s2_amo_hit ? 8'h0 : s2_req_store_mask[63:56]; // @[MainPipe.scala 431:20]
  wire [7:0] _s2_store_data_merged_7_full_wmask_T_9 = wmask_7[0] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s2_store_data_merged_7_full_wmask_T_11 = wmask_7[1] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s2_store_data_merged_7_full_wmask_T_13 = wmask_7[2] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s2_store_data_merged_7_full_wmask_T_15 = wmask_7[3] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s2_store_data_merged_7_full_wmask_T_17 = wmask_7[4] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s2_store_data_merged_7_full_wmask_T_19 = wmask_7[5] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s2_store_data_merged_7_full_wmask_T_21 = wmask_7[6] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s2_store_data_merged_7_full_wmask_T_23 = wmask_7[7] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [63:0] s2_store_data_merged_7_full_wmask = {_s2_store_data_merged_7_full_wmask_T_23,
    _s2_store_data_merged_7_full_wmask_T_21,_s2_store_data_merged_7_full_wmask_T_19,
    _s2_store_data_merged_7_full_wmask_T_17,_s2_store_data_merged_7_full_wmask_T_15,
    _s2_store_data_merged_7_full_wmask_T_13,_s2_store_data_merged_7_full_wmask_T_11,
    _s2_store_data_merged_7_full_wmask_T_9}; // @[Cat.scala 31:58]
  wire [63:0] _s2_store_data_merged_7_T = ~s2_store_data_merged_7_full_wmask; // @[MainPipe.scala 419:7]
  wire [63:0] _s2_store_data_merged_7_T_1 = _s2_store_data_merged_7_T & data_resp_7_raw_data; // @[MainPipe.scala 419:19]
  wire [63:0] _s2_store_data_merged_7_T_2 = s2_store_data_merged_7_full_wmask & new_data_7; // @[MainPipe.scala 419:45]
  wire [63:0] s2_store_data_merged_7 = _s2_store_data_merged_7_T_1 | _s2_store_data_merged_7_T_2; // @[MainPipe.scala 419:31]
  reg  s2_probe_ttob_check_resp_REG; // @[MainPipe.scala 438:42]
  reg  s2_probe_ttob_check_resp_REG_1_bits_toN; // @[MainPipe.scala 438:86]
  reg  s3_valid; // @[MainPipe.scala 441:25]
  reg [1:0] s3_req_miss_id; // @[Reg.scala 16:16]
  reg [1:0] s3_req_miss_param; // @[Reg.scala 16:16]
  reg  s3_req_miss_dirty; // @[Reg.scala 16:16]
  reg [4:0] s3_req_cmd; // @[Reg.scala 16:16]
  reg [38:0] s3_req_vaddr; // @[Reg.scala 16:16]
  reg [2:0] s3_req_word_idx; // @[Reg.scala 16:16]
  reg [63:0] s3_req_amo_data; // @[Reg.scala 16:16]
  reg [7:0] s3_req_amo_mask; // @[Reg.scala 16:16]
  reg  s3_req_error; // @[Reg.scala 16:16]
  reg [3:0] s3_req_id; // @[Reg.scala 16:16]
  reg  s3_hit; // @[Reg.scala 16:16]
  reg [7:0] s3_way_en; // @[Reg.scala 16:16]
  reg [7:0] s3_banked_store_wmask; // @[Reg.scala 16:16]
  reg [63:0] s3_store_data_merged_0; // @[Reg.scala 16:16]
  reg [63:0] s3_store_data_merged_1; // @[Reg.scala 16:16]
  reg [63:0] s3_store_data_merged_2; // @[Reg.scala 16:16]
  reg [63:0] s3_store_data_merged_3; // @[Reg.scala 16:16]
  reg [63:0] s3_store_data_merged_4; // @[Reg.scala 16:16]
  reg [63:0] s3_store_data_merged_5; // @[Reg.scala 16:16]
  reg [63:0] s3_store_data_merged_6; // @[Reg.scala 16:16]
  reg [63:0] s3_store_data_merged_7; // @[Reg.scala 16:16]
  reg [63:0] s3_data_word; // @[Reg.scala 16:16]
  wire [63:0] _GEN_240 = 3'h1 == s2_req_word_idx ? s2_store_data_merged_1 : s2_store_data_merged_0; // @[Reg.scala 17:{22,22}]
  wire [63:0] _GEN_241 = 3'h2 == s2_req_word_idx ? s2_store_data_merged_2 : _GEN_240; // @[Reg.scala 17:{22,22}]
  wire [63:0] _GEN_242 = 3'h3 == s2_req_word_idx ? s2_store_data_merged_3 : _GEN_241; // @[Reg.scala 17:{22,22}]
  wire [63:0] _GEN_243 = 3'h4 == s2_req_word_idx ? s2_store_data_merged_4 : _GEN_242; // @[Reg.scala 17:{22,22}]
  reg [63:0] s3_data_0; // @[Reg.scala 16:16]
  reg [63:0] s3_data_1; // @[Reg.scala 16:16]
  reg [63:0] s3_data_2; // @[Reg.scala 16:16]
  reg [63:0] s3_data_3; // @[Reg.scala 16:16]
  reg [63:0] s3_data_4; // @[Reg.scala 16:16]
  reg [63:0] s3_data_5; // @[Reg.scala 16:16]
  reg [63:0] s3_data_6; // @[Reg.scala 16:16]
  reg [63:0] s3_data_7; // @[Reg.scala 16:16]
  reg  s3_data_error_REG; // @[MainPipe.scala 460:39]
  reg  s3_data_error_REG_1; // @[MainPipe.scala 460:31]
  reg  s3_data_error_REG_2; // @[MainPipe.scala 461:41]
  wire  _s3_data_error_T = io_readline_error_delayed & s3_data_error_REG_2; // @[MainPipe.scala 461:31]
  reg  s3_data_error_REG_3; // @[MainPipe.scala 462:12]
  wire  s3_data_error = s3_data_error_REG_1 ? _s3_data_error_T : s3_data_error_REG_3; // @[MainPipe.scala 460:23]
  reg  s3_error_r; // @[Reg.scala 16:16]
  wire  s3_error = s3_error_r | s3_data_error; // @[MainPipe.scala 466:53]
  reg  s3_probe_ttob_check_resp_bits_toN; // @[Reg.scala 16:16]
  reg  s3_valid_dup_0; // @[MainPipe.scala 472:29]
  reg  s3_valid_dup_1; // @[MainPipe.scala 472:29]
  reg  s3_valid_dup_3; // @[MainPipe.scala 472:29]
  reg  s3_valid_dup_4; // @[MainPipe.scala 472:29]
  reg  s3_valid_dup_8; // @[MainPipe.scala 472:29]
  reg  s3_valid_dup_9; // @[MainPipe.scala 472:29]
  reg  s3_valid_dup_10; // @[MainPipe.scala 472:29]
  reg  s3_valid_dup_11; // @[MainPipe.scala 472:29]
  reg  s3_valid_dup_for_status_0; // @[MainPipe.scala 473:40]
  reg  s3_valid_dup_for_status_1; // @[MainPipe.scala 473:40]
  reg  s3_valid_dup_for_status_2; // @[MainPipe.scala 473:40]
  reg  s3_valid_dup_for_status_3; // @[MainPipe.scala 473:40]
  reg  s3_valid_dup_for_status_4; // @[MainPipe.scala 473:40]
  reg  s3_valid_dup_for_status_5; // @[MainPipe.scala 473:40]
  reg  s3_valid_dup_for_status_6; // @[MainPipe.scala 473:40]
  reg  s3_valid_dup_for_status_7; // @[MainPipe.scala 473:40]
  reg  s3_valid_dup_for_status_8; // @[MainPipe.scala 473:40]
  reg  s3_valid_dup_for_status_9; // @[MainPipe.scala 473:40]
  reg  s3_valid_dup_for_status_10; // @[MainPipe.scala 473:40]
  reg  s3_valid_dup_for_status_11; // @[MainPipe.scala 473:40]
  reg  s3_valid_dup_for_status_12; // @[MainPipe.scala 473:40]
  reg  s3_valid_dup_for_status_13; // @[MainPipe.scala 473:40]
  reg  s3_valid_dup_for_status_14; // @[MainPipe.scala 473:40]
  reg  s3_valid_dup_for_status_15; // @[MainPipe.scala 473:40]
  reg  s3_valid_dup_for_status_16; // @[MainPipe.scala 473:40]
  reg  s3_valid_dup_for_status_17; // @[MainPipe.scala 473:40]
  reg  s3_valid_dup_for_status_18; // @[MainPipe.scala 473:40]
  reg  s3_valid_dup_for_status_19; // @[MainPipe.scala 473:40]
  reg  s3_valid_dup_for_status_20; // @[MainPipe.scala 473:40]
  reg  s3_valid_dup_for_status_21; // @[MainPipe.scala 473:40]
  reg  s3_valid_dup_for_status_22; // @[MainPipe.scala 473:40]
  reg  s3_valid_dup_for_status_23; // @[MainPipe.scala 473:40]
  reg [7:0] s3_way_en_dup_0; // @[Reg.scala 16:16]
  reg [7:0] s3_way_en_dup_1; // @[Reg.scala 16:16]
  reg [7:0] s3_way_en_dup_2; // @[Reg.scala 16:16]
  reg [5:0] s3_idx_dup_2; // @[Reg.scala 16:16]
  reg [5:0] s3_idx_dup_3; // @[Reg.scala 16:16]
  reg [5:0] s3_idx_dup_4; // @[Reg.scala 16:16]
  reg [5:0] s3_idx_dup_5; // @[Reg.scala 16:16]
  reg  s3_req_replace_dup_3; // @[Reg.scala 16:16]
  reg  s3_req_replace_dup_7; // @[Reg.scala 16:16]
  reg [4:0] s3_req_cmd_dup_2; // @[Reg.scala 16:16]
  reg [4:0] s3_req_cmd_dup_3; // @[Reg.scala 16:16]
  reg [35:0] s3_req_addr_dup_0; // @[Reg.scala 16:16]
  reg [35:0] s3_req_addr_dup_3; // @[Reg.scala 16:16]
  reg [35:0] s3_req_addr_dup_4; // @[Reg.scala 16:16]
  reg  s3_req_probe_dup_3; // @[Reg.scala 16:16]
  reg  s3_req_miss_dup_5; // @[Reg.scala 16:16]
  reg  s3_req_miss_dup_7; // @[Reg.scala 16:16]
  reg [2:0] s3_req_word_idx_dup_0; // @[Reg.scala 16:16]
  reg [2:0] s3_req_word_idx_dup_1; // @[Reg.scala 16:16]
  reg [2:0] s3_req_word_idx_dup_2; // @[Reg.scala 16:16]
  reg [2:0] s3_req_word_idx_dup_3; // @[Reg.scala 16:16]
  reg [2:0] s3_req_word_idx_dup_4; // @[Reg.scala 16:16]
  reg [2:0] s3_req_word_idx_dup_5; // @[Reg.scala 16:16]
  reg [2:0] s3_req_word_idx_dup_6; // @[Reg.scala 16:16]
  reg [2:0] s3_req_word_idx_dup_7; // @[Reg.scala 16:16]
  reg  s3_store_hit_dup_1; // @[Reg.scala 16:16]
  reg [5:0] lrsc_count_dup_1; // @[MainPipe.scala 500:31]
  reg [5:0] lrsc_count_dup_2; // @[MainPipe.scala 500:31]
  wire  lrsc_valid_dup_2 = lrsc_count_dup_2 > 6'h8; // @[MainPipe.scala 501:61]
  reg [35:0] lrsc_addr_dup; // @[MainPipe.scala 502:26]
  wire  _miss_new_coh_c_cat_T_5 = s3_req_cmd_dup_2 == 5'h4; // @[package.scala 15:47]
  wire  _miss_new_coh_c_cat_T_6 = s3_req_cmd_dup_2 == 5'h9; // @[package.scala 15:47]
  wire  _miss_new_coh_c_cat_T_7 = s3_req_cmd_dup_2 == 5'ha; // @[package.scala 15:47]
  wire  _miss_new_coh_c_cat_T_8 = s3_req_cmd_dup_2 == 5'hb; // @[package.scala 15:47]
  wire  _miss_new_coh_c_cat_T_11 = _miss_new_coh_c_cat_T_5 | _miss_new_coh_c_cat_T_6 | _miss_new_coh_c_cat_T_7 |
    _miss_new_coh_c_cat_T_8; // @[package.scala 72:59]
  wire  _miss_new_coh_c_cat_T_12 = s3_req_cmd_dup_2 == 5'h8; // @[package.scala 15:47]
  wire  _miss_new_coh_c_cat_T_13 = s3_req_cmd_dup_2 == 5'hc; // @[package.scala 15:47]
  wire  _miss_new_coh_c_cat_T_14 = s3_req_cmd_dup_2 == 5'hd; // @[package.scala 15:47]
  wire  _miss_new_coh_c_cat_T_15 = s3_req_cmd_dup_2 == 5'he; // @[package.scala 15:47]
  wire  _miss_new_coh_c_cat_T_16 = s3_req_cmd_dup_2 == 5'hf; // @[package.scala 15:47]
  wire  _miss_new_coh_c_cat_T_20 = _miss_new_coh_c_cat_T_12 | _miss_new_coh_c_cat_T_13 | _miss_new_coh_c_cat_T_14 |
    _miss_new_coh_c_cat_T_15 | _miss_new_coh_c_cat_T_16; // @[package.scala 72:59]
  wire  _miss_new_coh_c_cat_T_21 = _miss_new_coh_c_cat_T_11 | _miss_new_coh_c_cat_T_20; // @[Consts.scala 82:44]
  wire  _miss_new_coh_c_cat_T_22 = s3_req_cmd_dup_2 == 5'h1 | s3_req_cmd_dup_2 == 5'h11 | s3_req_cmd_dup_2 == 5'h7 |
    _miss_new_coh_c_cat_T_21; // @[Consts.scala 85:76]
  wire  _miss_new_coh_c_cat_T_49 = _miss_new_coh_c_cat_T_22 | s3_req_cmd_dup_2 == 5'h3 | s3_req_cmd_dup_2 == 5'h6; // @[Consts.scala 86:64]
  wire [4:0] _miss_new_coh_T = {_miss_new_coh_c_cat_T_22,_miss_new_coh_c_cat_T_49,s3_req_miss_param,s3_req_miss_dirty}; // @[Cat.scala 31:58]
  wire [1:0] _miss_new_coh_T_18 = 5'h2 == _miss_new_coh_T ? 2'h1 : 2'h0; // @[Mux.scala 81:58]
  wire [1:0] _miss_new_coh_T_20 = 5'h3 == _miss_new_coh_T ? 2'h1 : _miss_new_coh_T_18; // @[Mux.scala 81:58]
  wire [1:0] _miss_new_coh_T_22 = 5'h0 == _miss_new_coh_T ? 2'h2 : _miss_new_coh_T_20; // @[Mux.scala 81:58]
  wire [1:0] _miss_new_coh_T_24 = 5'h1 == _miss_new_coh_T ? 2'h3 : _miss_new_coh_T_22; // @[Mux.scala 81:58]
  wire [1:0] _miss_new_coh_T_26 = 5'h8 == _miss_new_coh_T ? 2'h2 : _miss_new_coh_T_24; // @[Mux.scala 81:58]
  wire [1:0] _miss_new_coh_T_28 = 5'h9 == _miss_new_coh_T ? 2'h3 : _miss_new_coh_T_26; // @[Mux.scala 81:58]
  wire [1:0] _miss_new_coh_T_30 = 5'h18 == _miss_new_coh_T ? 2'h3 : _miss_new_coh_T_28; // @[Mux.scala 81:58]
  wire [1:0] miss_new_coh_state = 5'h19 == _miss_new_coh_T ? 2'h3 : _miss_new_coh_T_30; // @[Mux.scala 81:58]
  reg [5:0] lrsc_count; // @[MainPipe.scala 535:27]
  wire  s3_lr = ~s3_req_probe_dup_3 & _s3_can_do_amo_T_2 & s3_req_cmd_dup_3 == 5'h6; // @[MainPipe.scala 538:52]
  wire [35:0] _lrsc_addr_T_1 = {s3_req_addr_dup_0[35:6], 6'h0}; // @[L1Cache.scala 84:59]
  wire [5:0] _lrsc_count_T_1 = lrsc_count - 6'h1; // @[MainPipe.scala 564:30]
  wire [5:0] _lrsc_count_dup_0_T_1 = lrsc_count_dup_0 - 6'h1; // @[MainPipe.scala 566:18]
  wire [5:0] _lrsc_count_dup_1_T_1 = lrsc_count_dup_1 - 6'h1; // @[MainPipe.scala 566:18]
  wire [5:0] _lrsc_count_dup_2_T_1 = lrsc_count_dup_2 - 6'h1; // @[MainPipe.scala 566:18]
  reg  io_block_lr_REG; // @[MainPipe.scala 572:25]
  wire [7:0] banked_amo_wmask = 8'h1 << s3_req_word_idx; // @[OneHot.scala 57:35]
  reg  s3_s_amoalu; // @[MainPipe.scala 617:28]
  wire  do_amoalu = amo_wait_amoalu & s3_valid_dup_3 & ~s3_s_amoalu; // @[MainPipe.scala 618:54]
  wire  _wmask_T_8 = s3_req_word_idx_dup_0 == 3'h0; // @[MainPipe.scala 633:30]
  wire [7:0] wmask_8 = _wmask_T_8 ? 8'hff : 8'h0; // @[MainPipe.scala 632:20]
  wire [7:0] _s3_amo_data_merged_0_full_wmask_T_9 = wmask_8[0] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_amo_data_merged_0_full_wmask_T_11 = wmask_8[1] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_amo_data_merged_0_full_wmask_T_13 = wmask_8[2] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_amo_data_merged_0_full_wmask_T_15 = wmask_8[3] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_amo_data_merged_0_full_wmask_T_17 = wmask_8[4] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_amo_data_merged_0_full_wmask_T_19 = wmask_8[5] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_amo_data_merged_0_full_wmask_T_21 = wmask_8[6] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_amo_data_merged_0_full_wmask_T_23 = wmask_8[7] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [63:0] s3_amo_data_merged_0_full_wmask = {_s3_amo_data_merged_0_full_wmask_T_23,
    _s3_amo_data_merged_0_full_wmask_T_21,_s3_amo_data_merged_0_full_wmask_T_19,_s3_amo_data_merged_0_full_wmask_T_17,
    _s3_amo_data_merged_0_full_wmask_T_15,_s3_amo_data_merged_0_full_wmask_T_13,_s3_amo_data_merged_0_full_wmask_T_11,
    _s3_amo_data_merged_0_full_wmask_T_9}; // @[Cat.scala 31:58]
  wire [63:0] _s3_amo_data_merged_0_T = ~s3_amo_data_merged_0_full_wmask; // @[MainPipe.scala 419:7]
  wire [63:0] _s3_amo_data_merged_0_T_1 = _s3_amo_data_merged_0_T & s3_store_data_merged_0; // @[MainPipe.scala 419:19]
  wire [63:0] _s3_amo_data_merged_0_T_2 = s3_amo_data_merged_0_full_wmask & amoalu_io_out; // @[MainPipe.scala 419:45]
  wire [63:0] s3_amo_data_merged_0 = _s3_amo_data_merged_0_T_1 | _s3_amo_data_merged_0_T_2; // @[MainPipe.scala 419:31]
  wire [7:0] _s3_sc_data_merged_0_T_3 = _wmask_T_8 & _s3_can_do_amo_write_T_24 ? s3_req_amo_mask : 8'h0; // @[MainPipe.scala 639:10]
  wire [7:0] _s3_sc_data_merged_0_full_wmask_T_9 = _s3_sc_data_merged_0_T_3[0] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_0_full_wmask_T_11 = _s3_sc_data_merged_0_T_3[1] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_0_full_wmask_T_13 = _s3_sc_data_merged_0_T_3[2] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_0_full_wmask_T_15 = _s3_sc_data_merged_0_T_3[3] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_0_full_wmask_T_17 = _s3_sc_data_merged_0_T_3[4] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_0_full_wmask_T_19 = _s3_sc_data_merged_0_T_3[5] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_0_full_wmask_T_21 = _s3_sc_data_merged_0_T_3[6] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_0_full_wmask_T_23 = _s3_sc_data_merged_0_T_3[7] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [63:0] s3_sc_data_merged_0_full_wmask = {_s3_sc_data_merged_0_full_wmask_T_23,
    _s3_sc_data_merged_0_full_wmask_T_21,_s3_sc_data_merged_0_full_wmask_T_19,_s3_sc_data_merged_0_full_wmask_T_17,
    _s3_sc_data_merged_0_full_wmask_T_15,_s3_sc_data_merged_0_full_wmask_T_13,_s3_sc_data_merged_0_full_wmask_T_11,
    _s3_sc_data_merged_0_full_wmask_T_9}; // @[Cat.scala 31:58]
  wire [63:0] _s3_sc_data_merged_0_T_4 = ~s3_sc_data_merged_0_full_wmask; // @[MainPipe.scala 419:7]
  wire [63:0] _s3_sc_data_merged_0_T_5 = _s3_sc_data_merged_0_T_4 & s3_store_data_merged_0; // @[MainPipe.scala 419:19]
  wire [63:0] _s3_sc_data_merged_0_T_6 = s3_sc_data_merged_0_full_wmask & s3_req_amo_data; // @[MainPipe.scala 419:45]
  wire [63:0] s3_sc_data_merged_0 = _s3_sc_data_merged_0_T_5 | _s3_sc_data_merged_0_T_6; // @[MainPipe.scala 419:31]
  wire  _wmask_T_10 = s3_req_word_idx_dup_1 == 3'h1; // @[MainPipe.scala 633:30]
  wire [7:0] wmask_9 = _wmask_T_10 ? 8'hff : 8'h0; // @[MainPipe.scala 632:20]
  wire [7:0] _s3_amo_data_merged_1_full_wmask_T_9 = wmask_9[0] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_amo_data_merged_1_full_wmask_T_11 = wmask_9[1] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_amo_data_merged_1_full_wmask_T_13 = wmask_9[2] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_amo_data_merged_1_full_wmask_T_15 = wmask_9[3] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_amo_data_merged_1_full_wmask_T_17 = wmask_9[4] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_amo_data_merged_1_full_wmask_T_19 = wmask_9[5] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_amo_data_merged_1_full_wmask_T_21 = wmask_9[6] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_amo_data_merged_1_full_wmask_T_23 = wmask_9[7] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [63:0] s3_amo_data_merged_1_full_wmask = {_s3_amo_data_merged_1_full_wmask_T_23,
    _s3_amo_data_merged_1_full_wmask_T_21,_s3_amo_data_merged_1_full_wmask_T_19,_s3_amo_data_merged_1_full_wmask_T_17,
    _s3_amo_data_merged_1_full_wmask_T_15,_s3_amo_data_merged_1_full_wmask_T_13,_s3_amo_data_merged_1_full_wmask_T_11,
    _s3_amo_data_merged_1_full_wmask_T_9}; // @[Cat.scala 31:58]
  wire [63:0] _s3_amo_data_merged_1_T = ~s3_amo_data_merged_1_full_wmask; // @[MainPipe.scala 419:7]
  wire [63:0] _s3_amo_data_merged_1_T_1 = _s3_amo_data_merged_1_T & s3_store_data_merged_1; // @[MainPipe.scala 419:19]
  wire [63:0] _s3_amo_data_merged_1_T_2 = s3_amo_data_merged_1_full_wmask & amoalu_io_out; // @[MainPipe.scala 419:45]
  wire [63:0] s3_amo_data_merged_1 = _s3_amo_data_merged_1_T_1 | _s3_amo_data_merged_1_T_2; // @[MainPipe.scala 419:31]
  wire [7:0] _s3_sc_data_merged_1_T_3 = _wmask_T_10 & _s3_can_do_amo_write_T_24 ? s3_req_amo_mask : 8'h0; // @[MainPipe.scala 639:10]
  wire [7:0] _s3_sc_data_merged_1_full_wmask_T_9 = _s3_sc_data_merged_1_T_3[0] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_1_full_wmask_T_11 = _s3_sc_data_merged_1_T_3[1] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_1_full_wmask_T_13 = _s3_sc_data_merged_1_T_3[2] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_1_full_wmask_T_15 = _s3_sc_data_merged_1_T_3[3] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_1_full_wmask_T_17 = _s3_sc_data_merged_1_T_3[4] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_1_full_wmask_T_19 = _s3_sc_data_merged_1_T_3[5] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_1_full_wmask_T_21 = _s3_sc_data_merged_1_T_3[6] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_1_full_wmask_T_23 = _s3_sc_data_merged_1_T_3[7] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [63:0] s3_sc_data_merged_1_full_wmask = {_s3_sc_data_merged_1_full_wmask_T_23,
    _s3_sc_data_merged_1_full_wmask_T_21,_s3_sc_data_merged_1_full_wmask_T_19,_s3_sc_data_merged_1_full_wmask_T_17,
    _s3_sc_data_merged_1_full_wmask_T_15,_s3_sc_data_merged_1_full_wmask_T_13,_s3_sc_data_merged_1_full_wmask_T_11,
    _s3_sc_data_merged_1_full_wmask_T_9}; // @[Cat.scala 31:58]
  wire [63:0] _s3_sc_data_merged_1_T_4 = ~s3_sc_data_merged_1_full_wmask; // @[MainPipe.scala 419:7]
  wire [63:0] _s3_sc_data_merged_1_T_5 = _s3_sc_data_merged_1_T_4 & s3_store_data_merged_1; // @[MainPipe.scala 419:19]
  wire [63:0] _s3_sc_data_merged_1_T_6 = s3_sc_data_merged_1_full_wmask & s3_req_amo_data; // @[MainPipe.scala 419:45]
  wire [63:0] s3_sc_data_merged_1 = _s3_sc_data_merged_1_T_5 | _s3_sc_data_merged_1_T_6; // @[MainPipe.scala 419:31]
  wire  _wmask_T_12 = s3_req_word_idx_dup_2 == 3'h2; // @[MainPipe.scala 633:30]
  wire [7:0] wmask_10 = _wmask_T_12 ? 8'hff : 8'h0; // @[MainPipe.scala 632:20]
  wire [7:0] _s3_amo_data_merged_2_full_wmask_T_9 = wmask_10[0] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_amo_data_merged_2_full_wmask_T_11 = wmask_10[1] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_amo_data_merged_2_full_wmask_T_13 = wmask_10[2] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_amo_data_merged_2_full_wmask_T_15 = wmask_10[3] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_amo_data_merged_2_full_wmask_T_17 = wmask_10[4] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_amo_data_merged_2_full_wmask_T_19 = wmask_10[5] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_amo_data_merged_2_full_wmask_T_21 = wmask_10[6] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_amo_data_merged_2_full_wmask_T_23 = wmask_10[7] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [63:0] s3_amo_data_merged_2_full_wmask = {_s3_amo_data_merged_2_full_wmask_T_23,
    _s3_amo_data_merged_2_full_wmask_T_21,_s3_amo_data_merged_2_full_wmask_T_19,_s3_amo_data_merged_2_full_wmask_T_17,
    _s3_amo_data_merged_2_full_wmask_T_15,_s3_amo_data_merged_2_full_wmask_T_13,_s3_amo_data_merged_2_full_wmask_T_11,
    _s3_amo_data_merged_2_full_wmask_T_9}; // @[Cat.scala 31:58]
  wire [63:0] _s3_amo_data_merged_2_T = ~s3_amo_data_merged_2_full_wmask; // @[MainPipe.scala 419:7]
  wire [63:0] _s3_amo_data_merged_2_T_1 = _s3_amo_data_merged_2_T & s3_store_data_merged_2; // @[MainPipe.scala 419:19]
  wire [63:0] _s3_amo_data_merged_2_T_2 = s3_amo_data_merged_2_full_wmask & amoalu_io_out; // @[MainPipe.scala 419:45]
  wire [63:0] s3_amo_data_merged_2 = _s3_amo_data_merged_2_T_1 | _s3_amo_data_merged_2_T_2; // @[MainPipe.scala 419:31]
  wire [7:0] _s3_sc_data_merged_2_T_3 = _wmask_T_12 & _s3_can_do_amo_write_T_24 ? s3_req_amo_mask : 8'h0; // @[MainPipe.scala 639:10]
  wire [7:0] _s3_sc_data_merged_2_full_wmask_T_9 = _s3_sc_data_merged_2_T_3[0] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_2_full_wmask_T_11 = _s3_sc_data_merged_2_T_3[1] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_2_full_wmask_T_13 = _s3_sc_data_merged_2_T_3[2] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_2_full_wmask_T_15 = _s3_sc_data_merged_2_T_3[3] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_2_full_wmask_T_17 = _s3_sc_data_merged_2_T_3[4] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_2_full_wmask_T_19 = _s3_sc_data_merged_2_T_3[5] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_2_full_wmask_T_21 = _s3_sc_data_merged_2_T_3[6] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_2_full_wmask_T_23 = _s3_sc_data_merged_2_T_3[7] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [63:0] s3_sc_data_merged_2_full_wmask = {_s3_sc_data_merged_2_full_wmask_T_23,
    _s3_sc_data_merged_2_full_wmask_T_21,_s3_sc_data_merged_2_full_wmask_T_19,_s3_sc_data_merged_2_full_wmask_T_17,
    _s3_sc_data_merged_2_full_wmask_T_15,_s3_sc_data_merged_2_full_wmask_T_13,_s3_sc_data_merged_2_full_wmask_T_11,
    _s3_sc_data_merged_2_full_wmask_T_9}; // @[Cat.scala 31:58]
  wire [63:0] _s3_sc_data_merged_2_T_4 = ~s3_sc_data_merged_2_full_wmask; // @[MainPipe.scala 419:7]
  wire [63:0] _s3_sc_data_merged_2_T_5 = _s3_sc_data_merged_2_T_4 & s3_store_data_merged_2; // @[MainPipe.scala 419:19]
  wire [63:0] _s3_sc_data_merged_2_T_6 = s3_sc_data_merged_2_full_wmask & s3_req_amo_data; // @[MainPipe.scala 419:45]
  wire [63:0] s3_sc_data_merged_2 = _s3_sc_data_merged_2_T_5 | _s3_sc_data_merged_2_T_6; // @[MainPipe.scala 419:31]
  wire  _wmask_T_14 = s3_req_word_idx_dup_3 == 3'h3; // @[MainPipe.scala 633:30]
  wire [7:0] wmask_11 = _wmask_T_14 ? 8'hff : 8'h0; // @[MainPipe.scala 632:20]
  wire [7:0] _s3_amo_data_merged_3_full_wmask_T_9 = wmask_11[0] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_amo_data_merged_3_full_wmask_T_11 = wmask_11[1] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_amo_data_merged_3_full_wmask_T_13 = wmask_11[2] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_amo_data_merged_3_full_wmask_T_15 = wmask_11[3] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_amo_data_merged_3_full_wmask_T_17 = wmask_11[4] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_amo_data_merged_3_full_wmask_T_19 = wmask_11[5] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_amo_data_merged_3_full_wmask_T_21 = wmask_11[6] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_amo_data_merged_3_full_wmask_T_23 = wmask_11[7] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [63:0] s3_amo_data_merged_3_full_wmask = {_s3_amo_data_merged_3_full_wmask_T_23,
    _s3_amo_data_merged_3_full_wmask_T_21,_s3_amo_data_merged_3_full_wmask_T_19,_s3_amo_data_merged_3_full_wmask_T_17,
    _s3_amo_data_merged_3_full_wmask_T_15,_s3_amo_data_merged_3_full_wmask_T_13,_s3_amo_data_merged_3_full_wmask_T_11,
    _s3_amo_data_merged_3_full_wmask_T_9}; // @[Cat.scala 31:58]
  wire [63:0] _s3_amo_data_merged_3_T = ~s3_amo_data_merged_3_full_wmask; // @[MainPipe.scala 419:7]
  wire [63:0] _s3_amo_data_merged_3_T_1 = _s3_amo_data_merged_3_T & s3_store_data_merged_3; // @[MainPipe.scala 419:19]
  wire [63:0] _s3_amo_data_merged_3_T_2 = s3_amo_data_merged_3_full_wmask & amoalu_io_out; // @[MainPipe.scala 419:45]
  wire [63:0] s3_amo_data_merged_3 = _s3_amo_data_merged_3_T_1 | _s3_amo_data_merged_3_T_2; // @[MainPipe.scala 419:31]
  wire [7:0] _s3_sc_data_merged_3_T_3 = _wmask_T_14 & _s3_can_do_amo_write_T_24 ? s3_req_amo_mask : 8'h0; // @[MainPipe.scala 639:10]
  wire [7:0] _s3_sc_data_merged_3_full_wmask_T_9 = _s3_sc_data_merged_3_T_3[0] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_3_full_wmask_T_11 = _s3_sc_data_merged_3_T_3[1] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_3_full_wmask_T_13 = _s3_sc_data_merged_3_T_3[2] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_3_full_wmask_T_15 = _s3_sc_data_merged_3_T_3[3] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_3_full_wmask_T_17 = _s3_sc_data_merged_3_T_3[4] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_3_full_wmask_T_19 = _s3_sc_data_merged_3_T_3[5] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_3_full_wmask_T_21 = _s3_sc_data_merged_3_T_3[6] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_3_full_wmask_T_23 = _s3_sc_data_merged_3_T_3[7] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [63:0] s3_sc_data_merged_3_full_wmask = {_s3_sc_data_merged_3_full_wmask_T_23,
    _s3_sc_data_merged_3_full_wmask_T_21,_s3_sc_data_merged_3_full_wmask_T_19,_s3_sc_data_merged_3_full_wmask_T_17,
    _s3_sc_data_merged_3_full_wmask_T_15,_s3_sc_data_merged_3_full_wmask_T_13,_s3_sc_data_merged_3_full_wmask_T_11,
    _s3_sc_data_merged_3_full_wmask_T_9}; // @[Cat.scala 31:58]
  wire [63:0] _s3_sc_data_merged_3_T_4 = ~s3_sc_data_merged_3_full_wmask; // @[MainPipe.scala 419:7]
  wire [63:0] _s3_sc_data_merged_3_T_5 = _s3_sc_data_merged_3_T_4 & s3_store_data_merged_3; // @[MainPipe.scala 419:19]
  wire [63:0] _s3_sc_data_merged_3_T_6 = s3_sc_data_merged_3_full_wmask & s3_req_amo_data; // @[MainPipe.scala 419:45]
  wire [63:0] s3_sc_data_merged_3 = _s3_sc_data_merged_3_T_5 | _s3_sc_data_merged_3_T_6; // @[MainPipe.scala 419:31]
  wire  _wmask_T_16 = s3_req_word_idx_dup_4 == 3'h4; // @[MainPipe.scala 633:30]
  wire [7:0] wmask_12 = _wmask_T_16 ? 8'hff : 8'h0; // @[MainPipe.scala 632:20]
  wire [7:0] _s3_amo_data_merged_4_full_wmask_T_9 = wmask_12[0] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_amo_data_merged_4_full_wmask_T_11 = wmask_12[1] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_amo_data_merged_4_full_wmask_T_13 = wmask_12[2] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_amo_data_merged_4_full_wmask_T_15 = wmask_12[3] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_amo_data_merged_4_full_wmask_T_17 = wmask_12[4] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_amo_data_merged_4_full_wmask_T_19 = wmask_12[5] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_amo_data_merged_4_full_wmask_T_21 = wmask_12[6] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_amo_data_merged_4_full_wmask_T_23 = wmask_12[7] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [63:0] s3_amo_data_merged_4_full_wmask = {_s3_amo_data_merged_4_full_wmask_T_23,
    _s3_amo_data_merged_4_full_wmask_T_21,_s3_amo_data_merged_4_full_wmask_T_19,_s3_amo_data_merged_4_full_wmask_T_17,
    _s3_amo_data_merged_4_full_wmask_T_15,_s3_amo_data_merged_4_full_wmask_T_13,_s3_amo_data_merged_4_full_wmask_T_11,
    _s3_amo_data_merged_4_full_wmask_T_9}; // @[Cat.scala 31:58]
  wire [63:0] _s3_amo_data_merged_4_T = ~s3_amo_data_merged_4_full_wmask; // @[MainPipe.scala 419:7]
  wire [63:0] _s3_amo_data_merged_4_T_1 = _s3_amo_data_merged_4_T & s3_store_data_merged_4; // @[MainPipe.scala 419:19]
  wire [63:0] _s3_amo_data_merged_4_T_2 = s3_amo_data_merged_4_full_wmask & amoalu_io_out; // @[MainPipe.scala 419:45]
  wire [63:0] s3_amo_data_merged_4 = _s3_amo_data_merged_4_T_1 | _s3_amo_data_merged_4_T_2; // @[MainPipe.scala 419:31]
  wire [7:0] _s3_sc_data_merged_4_T_3 = _wmask_T_16 & _s3_can_do_amo_write_T_24 ? s3_req_amo_mask : 8'h0; // @[MainPipe.scala 639:10]
  wire [7:0] _s3_sc_data_merged_4_full_wmask_T_9 = _s3_sc_data_merged_4_T_3[0] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_4_full_wmask_T_11 = _s3_sc_data_merged_4_T_3[1] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_4_full_wmask_T_13 = _s3_sc_data_merged_4_T_3[2] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_4_full_wmask_T_15 = _s3_sc_data_merged_4_T_3[3] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_4_full_wmask_T_17 = _s3_sc_data_merged_4_T_3[4] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_4_full_wmask_T_19 = _s3_sc_data_merged_4_T_3[5] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_4_full_wmask_T_21 = _s3_sc_data_merged_4_T_3[6] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_4_full_wmask_T_23 = _s3_sc_data_merged_4_T_3[7] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [63:0] s3_sc_data_merged_4_full_wmask = {_s3_sc_data_merged_4_full_wmask_T_23,
    _s3_sc_data_merged_4_full_wmask_T_21,_s3_sc_data_merged_4_full_wmask_T_19,_s3_sc_data_merged_4_full_wmask_T_17,
    _s3_sc_data_merged_4_full_wmask_T_15,_s3_sc_data_merged_4_full_wmask_T_13,_s3_sc_data_merged_4_full_wmask_T_11,
    _s3_sc_data_merged_4_full_wmask_T_9}; // @[Cat.scala 31:58]
  wire [63:0] _s3_sc_data_merged_4_T_4 = ~s3_sc_data_merged_4_full_wmask; // @[MainPipe.scala 419:7]
  wire [63:0] _s3_sc_data_merged_4_T_5 = _s3_sc_data_merged_4_T_4 & s3_store_data_merged_4; // @[MainPipe.scala 419:19]
  wire [63:0] _s3_sc_data_merged_4_T_6 = s3_sc_data_merged_4_full_wmask & s3_req_amo_data; // @[MainPipe.scala 419:45]
  wire [63:0] s3_sc_data_merged_4 = _s3_sc_data_merged_4_T_5 | _s3_sc_data_merged_4_T_6; // @[MainPipe.scala 419:31]
  wire  _wmask_T_18 = s3_req_word_idx_dup_5 == 3'h5; // @[MainPipe.scala 633:30]
  wire [7:0] wmask_13 = _wmask_T_18 ? 8'hff : 8'h0; // @[MainPipe.scala 632:20]
  wire [7:0] _s3_amo_data_merged_5_full_wmask_T_9 = wmask_13[0] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_amo_data_merged_5_full_wmask_T_11 = wmask_13[1] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_amo_data_merged_5_full_wmask_T_13 = wmask_13[2] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_amo_data_merged_5_full_wmask_T_15 = wmask_13[3] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_amo_data_merged_5_full_wmask_T_17 = wmask_13[4] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_amo_data_merged_5_full_wmask_T_19 = wmask_13[5] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_amo_data_merged_5_full_wmask_T_21 = wmask_13[6] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_amo_data_merged_5_full_wmask_T_23 = wmask_13[7] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [63:0] s3_amo_data_merged_5_full_wmask = {_s3_amo_data_merged_5_full_wmask_T_23,
    _s3_amo_data_merged_5_full_wmask_T_21,_s3_amo_data_merged_5_full_wmask_T_19,_s3_amo_data_merged_5_full_wmask_T_17,
    _s3_amo_data_merged_5_full_wmask_T_15,_s3_amo_data_merged_5_full_wmask_T_13,_s3_amo_data_merged_5_full_wmask_T_11,
    _s3_amo_data_merged_5_full_wmask_T_9}; // @[Cat.scala 31:58]
  wire [63:0] _s3_amo_data_merged_5_T = ~s3_amo_data_merged_5_full_wmask; // @[MainPipe.scala 419:7]
  wire [63:0] _s3_amo_data_merged_5_T_1 = _s3_amo_data_merged_5_T & s3_store_data_merged_5; // @[MainPipe.scala 419:19]
  wire [63:0] _s3_amo_data_merged_5_T_2 = s3_amo_data_merged_5_full_wmask & amoalu_io_out; // @[MainPipe.scala 419:45]
  wire [63:0] s3_amo_data_merged_5 = _s3_amo_data_merged_5_T_1 | _s3_amo_data_merged_5_T_2; // @[MainPipe.scala 419:31]
  wire [7:0] _s3_sc_data_merged_5_T_3 = _wmask_T_18 & _s3_can_do_amo_write_T_24 ? s3_req_amo_mask : 8'h0; // @[MainPipe.scala 639:10]
  wire [7:0] _s3_sc_data_merged_5_full_wmask_T_9 = _s3_sc_data_merged_5_T_3[0] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_5_full_wmask_T_11 = _s3_sc_data_merged_5_T_3[1] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_5_full_wmask_T_13 = _s3_sc_data_merged_5_T_3[2] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_5_full_wmask_T_15 = _s3_sc_data_merged_5_T_3[3] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_5_full_wmask_T_17 = _s3_sc_data_merged_5_T_3[4] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_5_full_wmask_T_19 = _s3_sc_data_merged_5_T_3[5] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_5_full_wmask_T_21 = _s3_sc_data_merged_5_T_3[6] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_5_full_wmask_T_23 = _s3_sc_data_merged_5_T_3[7] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [63:0] s3_sc_data_merged_5_full_wmask = {_s3_sc_data_merged_5_full_wmask_T_23,
    _s3_sc_data_merged_5_full_wmask_T_21,_s3_sc_data_merged_5_full_wmask_T_19,_s3_sc_data_merged_5_full_wmask_T_17,
    _s3_sc_data_merged_5_full_wmask_T_15,_s3_sc_data_merged_5_full_wmask_T_13,_s3_sc_data_merged_5_full_wmask_T_11,
    _s3_sc_data_merged_5_full_wmask_T_9}; // @[Cat.scala 31:58]
  wire [63:0] _s3_sc_data_merged_5_T_4 = ~s3_sc_data_merged_5_full_wmask; // @[MainPipe.scala 419:7]
  wire [63:0] _s3_sc_data_merged_5_T_5 = _s3_sc_data_merged_5_T_4 & s3_store_data_merged_5; // @[MainPipe.scala 419:19]
  wire [63:0] _s3_sc_data_merged_5_T_6 = s3_sc_data_merged_5_full_wmask & s3_req_amo_data; // @[MainPipe.scala 419:45]
  wire [63:0] s3_sc_data_merged_5 = _s3_sc_data_merged_5_T_5 | _s3_sc_data_merged_5_T_6; // @[MainPipe.scala 419:31]
  wire  _wmask_T_20 = s3_req_word_idx_dup_6 == 3'h6; // @[MainPipe.scala 633:30]
  wire [7:0] wmask_14 = _wmask_T_20 ? 8'hff : 8'h0; // @[MainPipe.scala 632:20]
  wire [7:0] _s3_amo_data_merged_6_full_wmask_T_9 = wmask_14[0] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_amo_data_merged_6_full_wmask_T_11 = wmask_14[1] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_amo_data_merged_6_full_wmask_T_13 = wmask_14[2] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_amo_data_merged_6_full_wmask_T_15 = wmask_14[3] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_amo_data_merged_6_full_wmask_T_17 = wmask_14[4] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_amo_data_merged_6_full_wmask_T_19 = wmask_14[5] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_amo_data_merged_6_full_wmask_T_21 = wmask_14[6] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_amo_data_merged_6_full_wmask_T_23 = wmask_14[7] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [63:0] s3_amo_data_merged_6_full_wmask = {_s3_amo_data_merged_6_full_wmask_T_23,
    _s3_amo_data_merged_6_full_wmask_T_21,_s3_amo_data_merged_6_full_wmask_T_19,_s3_amo_data_merged_6_full_wmask_T_17,
    _s3_amo_data_merged_6_full_wmask_T_15,_s3_amo_data_merged_6_full_wmask_T_13,_s3_amo_data_merged_6_full_wmask_T_11,
    _s3_amo_data_merged_6_full_wmask_T_9}; // @[Cat.scala 31:58]
  wire [63:0] _s3_amo_data_merged_6_T = ~s3_amo_data_merged_6_full_wmask; // @[MainPipe.scala 419:7]
  wire [63:0] _s3_amo_data_merged_6_T_1 = _s3_amo_data_merged_6_T & s3_store_data_merged_6; // @[MainPipe.scala 419:19]
  wire [63:0] _s3_amo_data_merged_6_T_2 = s3_amo_data_merged_6_full_wmask & amoalu_io_out; // @[MainPipe.scala 419:45]
  wire [63:0] s3_amo_data_merged_6 = _s3_amo_data_merged_6_T_1 | _s3_amo_data_merged_6_T_2; // @[MainPipe.scala 419:31]
  wire [7:0] _s3_sc_data_merged_6_T_3 = _wmask_T_20 & _s3_can_do_amo_write_T_24 ? s3_req_amo_mask : 8'h0; // @[MainPipe.scala 639:10]
  wire [7:0] _s3_sc_data_merged_6_full_wmask_T_9 = _s3_sc_data_merged_6_T_3[0] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_6_full_wmask_T_11 = _s3_sc_data_merged_6_T_3[1] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_6_full_wmask_T_13 = _s3_sc_data_merged_6_T_3[2] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_6_full_wmask_T_15 = _s3_sc_data_merged_6_T_3[3] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_6_full_wmask_T_17 = _s3_sc_data_merged_6_T_3[4] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_6_full_wmask_T_19 = _s3_sc_data_merged_6_T_3[5] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_6_full_wmask_T_21 = _s3_sc_data_merged_6_T_3[6] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_6_full_wmask_T_23 = _s3_sc_data_merged_6_T_3[7] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [63:0] s3_sc_data_merged_6_full_wmask = {_s3_sc_data_merged_6_full_wmask_T_23,
    _s3_sc_data_merged_6_full_wmask_T_21,_s3_sc_data_merged_6_full_wmask_T_19,_s3_sc_data_merged_6_full_wmask_T_17,
    _s3_sc_data_merged_6_full_wmask_T_15,_s3_sc_data_merged_6_full_wmask_T_13,_s3_sc_data_merged_6_full_wmask_T_11,
    _s3_sc_data_merged_6_full_wmask_T_9}; // @[Cat.scala 31:58]
  wire [63:0] _s3_sc_data_merged_6_T_4 = ~s3_sc_data_merged_6_full_wmask; // @[MainPipe.scala 419:7]
  wire [63:0] _s3_sc_data_merged_6_T_5 = _s3_sc_data_merged_6_T_4 & s3_store_data_merged_6; // @[MainPipe.scala 419:19]
  wire [63:0] _s3_sc_data_merged_6_T_6 = s3_sc_data_merged_6_full_wmask & s3_req_amo_data; // @[MainPipe.scala 419:45]
  wire [63:0] s3_sc_data_merged_6 = _s3_sc_data_merged_6_T_5 | _s3_sc_data_merged_6_T_6; // @[MainPipe.scala 419:31]
  wire  _wmask_T_22 = s3_req_word_idx_dup_7 == 3'h7; // @[MainPipe.scala 633:30]
  wire [7:0] wmask_15 = _wmask_T_22 ? 8'hff : 8'h0; // @[MainPipe.scala 632:20]
  wire [7:0] _s3_amo_data_merged_7_full_wmask_T_9 = wmask_15[0] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_amo_data_merged_7_full_wmask_T_11 = wmask_15[1] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_amo_data_merged_7_full_wmask_T_13 = wmask_15[2] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_amo_data_merged_7_full_wmask_T_15 = wmask_15[3] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_amo_data_merged_7_full_wmask_T_17 = wmask_15[4] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_amo_data_merged_7_full_wmask_T_19 = wmask_15[5] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_amo_data_merged_7_full_wmask_T_21 = wmask_15[6] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_amo_data_merged_7_full_wmask_T_23 = wmask_15[7] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [63:0] s3_amo_data_merged_7_full_wmask = {_s3_amo_data_merged_7_full_wmask_T_23,
    _s3_amo_data_merged_7_full_wmask_T_21,_s3_amo_data_merged_7_full_wmask_T_19,_s3_amo_data_merged_7_full_wmask_T_17,
    _s3_amo_data_merged_7_full_wmask_T_15,_s3_amo_data_merged_7_full_wmask_T_13,_s3_amo_data_merged_7_full_wmask_T_11,
    _s3_amo_data_merged_7_full_wmask_T_9}; // @[Cat.scala 31:58]
  wire [63:0] _s3_amo_data_merged_7_T = ~s3_amo_data_merged_7_full_wmask; // @[MainPipe.scala 419:7]
  wire [63:0] _s3_amo_data_merged_7_T_1 = _s3_amo_data_merged_7_T & s3_store_data_merged_7; // @[MainPipe.scala 419:19]
  wire [63:0] _s3_amo_data_merged_7_T_2 = s3_amo_data_merged_7_full_wmask & amoalu_io_out; // @[MainPipe.scala 419:45]
  wire [63:0] s3_amo_data_merged_7 = _s3_amo_data_merged_7_T_1 | _s3_amo_data_merged_7_T_2; // @[MainPipe.scala 419:31]
  wire [7:0] _s3_sc_data_merged_7_T_3 = _wmask_T_22 & _s3_can_do_amo_write_T_24 ? s3_req_amo_mask : 8'h0; // @[MainPipe.scala 639:10]
  wire [7:0] _s3_sc_data_merged_7_full_wmask_T_9 = _s3_sc_data_merged_7_T_3[0] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_7_full_wmask_T_11 = _s3_sc_data_merged_7_T_3[1] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_7_full_wmask_T_13 = _s3_sc_data_merged_7_T_3[2] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_7_full_wmask_T_15 = _s3_sc_data_merged_7_T_3[3] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_7_full_wmask_T_17 = _s3_sc_data_merged_7_T_3[4] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_7_full_wmask_T_19 = _s3_sc_data_merged_7_T_3[5] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_7_full_wmask_T_21 = _s3_sc_data_merged_7_T_3[6] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_7_full_wmask_T_23 = _s3_sc_data_merged_7_T_3[7] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [63:0] s3_sc_data_merged_7_full_wmask = {_s3_sc_data_merged_7_full_wmask_T_23,
    _s3_sc_data_merged_7_full_wmask_T_21,_s3_sc_data_merged_7_full_wmask_T_19,_s3_sc_data_merged_7_full_wmask_T_17,
    _s3_sc_data_merged_7_full_wmask_T_15,_s3_sc_data_merged_7_full_wmask_T_13,_s3_sc_data_merged_7_full_wmask_T_11,
    _s3_sc_data_merged_7_full_wmask_T_9}; // @[Cat.scala 31:58]
  wire [63:0] _s3_sc_data_merged_7_T_4 = ~s3_sc_data_merged_7_full_wmask; // @[MainPipe.scala 419:7]
  wire [63:0] _s3_sc_data_merged_7_T_5 = _s3_sc_data_merged_7_T_4 & s3_store_data_merged_7; // @[MainPipe.scala 419:19]
  wire [63:0] _s3_sc_data_merged_7_T_6 = s3_sc_data_merged_7_full_wmask & s3_req_amo_data; // @[MainPipe.scala 419:45]
  wire [63:0] s3_sc_data_merged_7 = _s3_sc_data_merged_7_T_5 | _s3_sc_data_merged_7_T_6; // @[MainPipe.scala 419:31]
  reg [63:0] s3_amo_data_merged_reg_0; // @[Reg.scala 16:16]
  reg [63:0] s3_amo_data_merged_reg_1; // @[Reg.scala 16:16]
  reg [63:0] s3_amo_data_merged_reg_2; // @[Reg.scala 16:16]
  reg [63:0] s3_amo_data_merged_reg_3; // @[Reg.scala 16:16]
  reg [63:0] s3_amo_data_merged_reg_4; // @[Reg.scala 16:16]
  reg [63:0] s3_amo_data_merged_reg_5; // @[Reg.scala 16:16]
  reg [63:0] s3_amo_data_merged_reg_6; // @[Reg.scala 16:16]
  reg [63:0] s3_amo_data_merged_reg_7; // @[Reg.scala 16:16]
  wire  _GEN_374 = do_amoalu | s3_s_amoalu; // @[MainPipe.scala 643:18 644:17 617:28]
  wire  _GEN_375 = do_amoalu | s3_s_amoalu_dup_0; // @[MainPipe.scala 643:18 645:31 493:32]
  wire  _GEN_376 = do_amoalu | s3_s_amoalu_dup_1; // @[MainPipe.scala 643:18 645:31 493:32]
  wire  _s3_update_data_cango_T = s3_store_can_go | s3_amo_can_go; // @[MainPipe.scala 675:46]
  reg  miss_update_meta_dup_for_meta_wvalid; // @[Reg.scala 16:16]
  reg  s3_req_probe_dup_for_meta_wvalid; // @[Reg.scala 16:16]
  reg  s3_tag_match_dup_for_meta_wvalid; // @[Reg.scala 16:16]
  reg [1:0] s3_coh_dup_for_meta_wvalid_state; // @[Reg.scala 16:16]
  reg [1:0] s3_req_probe_param_dup_for_meta_wvalid; // @[Reg.scala 16:16]
  wire [3:0] _probe_new_coh_dup_for_meta_wvalid_T = {s3_req_probe_param_dup_for_meta_wvalid,
    s3_coh_dup_for_meta_wvalid_state}; // @[Cat.scala 31:58]
  wire  _probe_new_coh_dup_for_meta_wvalid_T_33 = 4'h5 == _probe_new_coh_dup_for_meta_wvalid_T; // @[Misc.scala 55:20]
  wire [1:0] _probe_new_coh_dup_for_meta_wvalid_T_36 = _probe_new_coh_dup_for_meta_wvalid_T_33 ? 2'h1 : 2'h0; // @[Misc.scala 37:63]
  wire  _probe_new_coh_dup_for_meta_wvalid_T_37 = 4'h6 == _probe_new_coh_dup_for_meta_wvalid_T; // @[Misc.scala 55:20]
  wire [1:0] _probe_new_coh_dup_for_meta_wvalid_T_40 = _probe_new_coh_dup_for_meta_wvalid_T_37 ? 2'h1 :
    _probe_new_coh_dup_for_meta_wvalid_T_36; // @[Misc.scala 37:63]
  wire  _probe_new_coh_dup_for_meta_wvalid_T_41 = 4'h7 == _probe_new_coh_dup_for_meta_wvalid_T; // @[Misc.scala 55:20]
  wire [1:0] _probe_new_coh_dup_for_meta_wvalid_T_44 = _probe_new_coh_dup_for_meta_wvalid_T_41 ? 2'h1 :
    _probe_new_coh_dup_for_meta_wvalid_T_40; // @[Misc.scala 37:63]
  wire  _probe_new_coh_dup_for_meta_wvalid_T_45 = 4'h0 == _probe_new_coh_dup_for_meta_wvalid_T; // @[Misc.scala 55:20]
  wire [1:0] _probe_new_coh_dup_for_meta_wvalid_T_48 = _probe_new_coh_dup_for_meta_wvalid_T_45 ? 2'h0 :
    _probe_new_coh_dup_for_meta_wvalid_T_44; // @[Misc.scala 37:63]
  wire  _probe_new_coh_dup_for_meta_wvalid_T_49 = 4'h1 == _probe_new_coh_dup_for_meta_wvalid_T; // @[Misc.scala 55:20]
  wire [1:0] _probe_new_coh_dup_for_meta_wvalid_T_52 = _probe_new_coh_dup_for_meta_wvalid_T_49 ? 2'h1 :
    _probe_new_coh_dup_for_meta_wvalid_T_48; // @[Misc.scala 37:63]
  wire  _probe_new_coh_dup_for_meta_wvalid_T_53 = 4'h2 == _probe_new_coh_dup_for_meta_wvalid_T; // @[Misc.scala 55:20]
  wire [1:0] _probe_new_coh_dup_for_meta_wvalid_T_56 = _probe_new_coh_dup_for_meta_wvalid_T_53 ? 2'h2 :
    _probe_new_coh_dup_for_meta_wvalid_T_52; // @[Misc.scala 37:63]
  wire  _probe_new_coh_dup_for_meta_wvalid_T_57 = 4'h3 == _probe_new_coh_dup_for_meta_wvalid_T; // @[Misc.scala 55:20]
  wire [1:0] probe_new_coh_dup_for_meta_wvalid_state = _probe_new_coh_dup_for_meta_wvalid_T_57 ? 2'h2 :
    _probe_new_coh_dup_for_meta_wvalid_T_56; // @[Misc.scala 37:63]
  reg [3:0] s3_req_source_dup_for_meta_wvalid; // @[Reg.scala 16:16]
  reg [4:0] s3_req_cmd_dup_for_meta_wvalid; // @[Reg.scala 16:16]
  reg  s3_req_replace_dup_for_meta_wvalid; // @[Reg.scala 16:16]
  reg [1:0] s3_hit_coh_dup_for_meta_wvalid_state; // @[Reg.scala 16:16]
  reg [1:0] s3_new_hit_coh_dup_for_meta_wvalid_state; // @[Reg.scala 16:16]
  wire  _probe_update_meta_dup_for_meta_wvalid_T_1 = s3_coh_dup_for_meta_wvalid_state ==
    probe_new_coh_dup_for_meta_wvalid_state; // @[Metadata.scala 45:46]
  wire  _probe_update_meta_dup_for_meta_wvalid_T_2 = ~_probe_update_meta_dup_for_meta_wvalid_T_1; // @[Metadata.scala 46:40]
  wire  _probe_update_meta_dup_for_meta_wvalid_T_3 = s3_req_probe_dup_for_meta_wvalid &
    s3_tag_match_dup_for_meta_wvalid & _probe_update_meta_dup_for_meta_wvalid_T_2; // @[MainPipe.scala 691:128]
  wire  _store_update_meta_dup_for_meta_wvalid_T_1 = ~s3_req_probe_dup_for_meta_wvalid; // @[MainPipe.scala 693:5]
  wire  _store_update_meta_dup_for_meta_wvalid_T_2 = s3_req_source_dup_for_meta_wvalid == 4'h1 &
    _store_update_meta_dup_for_meta_wvalid_T_1; // @[MainPipe.scala 692:102]
  wire  _store_update_meta_dup_for_meta_wvalid_T_3 = s3_hit_coh_dup_for_meta_wvalid_state ==
    s3_new_hit_coh_dup_for_meta_wvalid_state; // @[Metadata.scala 45:46]
  wire  _store_update_meta_dup_for_meta_wvalid_T_4 = ~_store_update_meta_dup_for_meta_wvalid_T_3; // @[Metadata.scala 46:40]
  wire  store_update_meta_dup_for_meta_wvalid = _store_update_meta_dup_for_meta_wvalid_T_2 &
    _store_update_meta_dup_for_meta_wvalid_T_4; // @[MainPipe.scala 693:40]
  wire  _amo_update_meta_dup_for_meta_wvalid_T = s3_req_source_dup_for_meta_wvalid == 4'h2; // @[MainPipe.scala 695:81]
  wire  _amo_update_meta_dup_for_meta_wvalid_T_2 = s3_req_source_dup_for_meta_wvalid == 4'h2 &
    _store_update_meta_dup_for_meta_wvalid_T_1; // @[MainPipe.scala 695:98]
  wire  amo_update_meta_dup_for_meta_wvalid = _amo_update_meta_dup_for_meta_wvalid_T_2 &
    _store_update_meta_dup_for_meta_wvalid_T_4; // @[MainPipe.scala 696:40]
  wire  _s3_probe_ttob_override_T = s3_valid & s3_probe_ttob_check_resp_bits_toN; // @[MainPipe.scala 771:41]
  wire  _s3_probe_ttob_override_T_1 = s3_coh_dup_for_meta_wvalid_state == 2'h2; // @[Metadata.scala 44:36]
  wire  s3_probe_ttob_override = _s3_probe_ttob_override_T & _s3_probe_ttob_override_T_1; // @[MainPipe.scala 773:39]
  wire  probe_update_meta_dup_for_meta_wvalid = s3_probe_ttob_override | _probe_update_meta_dup_for_meta_wvalid_T_3; // @[MainPipe.scala 780:32 781:44]
  wire  _update_meta_dup_for_meta_wvalid_T = miss_update_meta_dup_for_meta_wvalid |
    probe_update_meta_dup_for_meta_wvalid; // @[MainPipe.scala 699:43]
  wire  _update_meta_dup_for_meta_wvalid_T_1 = _update_meta_dup_for_meta_wvalid_T |
    store_update_meta_dup_for_meta_wvalid; // @[MainPipe.scala 700:44]
  wire  _update_meta_dup_for_meta_wvalid_T_2 = _update_meta_dup_for_meta_wvalid_T_1 |
    amo_update_meta_dup_for_meta_wvalid; // @[MainPipe.scala 701:44]
  wire  update_meta_dup_for_meta_wvalid = _update_meta_dup_for_meta_wvalid_T_2 & ~s3_req_replace_dup_for_meta_wvalid; // @[MainPipe.scala 703:5]
  reg  s3_valid_dup_for_meta_wvalid; // @[MainPipe.scala 705:46]
  reg  s3_amo_hit_dup_for_meta_wvalid; // @[Reg.scala 16:16]
  reg  s3_s_amoalu_dup_for_meta_wvalid; // @[MainPipe.scala 707:49]
  wire  _amo_wait_amoalu_dup_for_meta_wvalid_T_1 = s3_req_cmd_dup_for_meta_wvalid != 5'h6; // @[MainPipe.scala 709:37]
  wire  _amo_wait_amoalu_dup_for_meta_wvalid_T_2 = _amo_update_meta_dup_for_meta_wvalid_T &
    _amo_wait_amoalu_dup_for_meta_wvalid_T_1; // @[MainPipe.scala 708:98]
  wire  _amo_wait_amoalu_dup_for_meta_wvalid_T_3 = s3_req_cmd_dup_for_meta_wvalid != 5'h7; // @[MainPipe.scala 710:37]
  wire  amo_wait_amoalu_dup_for_meta_wvalid = _amo_wait_amoalu_dup_for_meta_wvalid_T_2 &
    _amo_wait_amoalu_dup_for_meta_wvalid_T_3; // @[MainPipe.scala 709:47]
  wire  do_amoalu_dup_for_meta_wvalid = amo_wait_amoalu_dup_for_meta_wvalid & s3_valid_dup_for_meta_wvalid & ~
    s3_s_amoalu_dup_for_meta_wvalid; // @[MainPipe.scala 711:110]
  reg  s3_store_hit_dup_for_meta_wvalid; // @[Reg.scala 16:16]
  reg [35:0] s3_req_addr_dup_for_meta_wvalid; // @[Reg.scala 16:16]
  wire  s3_can_do_amo_dup_for_meta_wvalid = miss_update_meta_dup_for_meta_wvalid &
    _store_update_meta_dup_for_meta_wvalid_T_1 & _amo_update_meta_dup_for_meta_wvalid_T |
    s3_amo_hit_dup_for_meta_wvalid; // @[MainPipe.scala 715:172]
  wire  _s3_lr_dup_for_meta_wvalid_T_2 = _store_update_meta_dup_for_meta_wvalid_T_1 &
    _amo_update_meta_dup_for_meta_wvalid_T; // @[MainPipe.scala 718:71]
  wire  s3_lr_dup_for_meta_wvalid = _store_update_meta_dup_for_meta_wvalid_T_1 &
    _amo_update_meta_dup_for_meta_wvalid_T & s3_req_cmd_dup_for_meta_wvalid == 5'h6; // @[MainPipe.scala 718:126]
  wire  _s3_sc_dup_for_meta_wvalid_T_3 = s3_req_cmd_dup_for_meta_wvalid == 5'h7; // @[MainPipe.scala 719:161]
  wire  s3_sc_dup_for_meta_wvalid = _s3_lr_dup_for_meta_wvalid_T_2 & s3_req_cmd_dup_for_meta_wvalid == 5'h7; // @[MainPipe.scala 719:126]
  reg [35:0] lrsc_addr_dup_for_meta_wvalid; // @[MainPipe.scala 720:43]
  reg [5:0] lrsc_count_dup_for_meta_wvalid; // @[MainPipe.scala 721:48]
  wire [35:0] _lrsc_addr_dup_for_meta_wvalid_T_1 = {s3_req_addr_dup_for_meta_wvalid[35:6], 6'h0}; // @[L1Cache.scala 84:59]
  wire [5:0] _lrsc_count_dup_for_meta_wvalid_T_1 = lrsc_count_dup_for_meta_wvalid - 6'h1; // @[MainPipe.scala 733:72]
  wire  lrsc_valid_dup_for_meta_wvalid = lrsc_count_dup_for_meta_wvalid > 6'h8; // @[MainPipe.scala 736:73]
  wire  s3_lrsc_addr_match_dup_for_meta_wvalid = lrsc_valid_dup_for_meta_wvalid & lrsc_addr_dup_for_meta_wvalid ==
    _lrsc_addr_dup_for_meta_wvalid_T_1; // @[MainPipe.scala 737:81]
  wire  s3_sc_fail_dup_for_meta_wvalid = s3_sc_dup_for_meta_wvalid & ~s3_lrsc_addr_match_dup_for_meta_wvalid; // @[MainPipe.scala 738:68]
  wire  _s3_can_do_amo_write_dup_for_meta_wvalid_T_11 = s3_req_cmd_dup_for_meta_wvalid == 5'h4 |
    s3_req_cmd_dup_for_meta_wvalid == 5'h9 | s3_req_cmd_dup_for_meta_wvalid == 5'ha | s3_req_cmd_dup_for_meta_wvalid
     == 5'hb; // @[CacheConstants.scala 52:90]
  wire  _s3_can_do_amo_write_dup_for_meta_wvalid_T_20 = s3_req_cmd_dup_for_meta_wvalid == 5'h8 |
    s3_req_cmd_dup_for_meta_wvalid == 5'hc | s3_req_cmd_dup_for_meta_wvalid == 5'hd | s3_req_cmd_dup_for_meta_wvalid
     == 5'he | s3_req_cmd_dup_for_meta_wvalid == 5'hf; // @[CacheConstants.scala 53:114]
  wire  _s3_can_do_amo_write_dup_for_meta_wvalid_T_21 = _s3_can_do_amo_write_dup_for_meta_wvalid_T_11 |
    _s3_can_do_amo_write_dup_for_meta_wvalid_T_20; // @[CacheConstants.scala 54:44]
  wire  _s3_can_do_amo_write_dup_for_meta_wvalid_T_22 = s3_req_cmd_dup_for_meta_wvalid == 5'h1 |
    s3_req_cmd_dup_for_meta_wvalid == 5'h11 | _s3_sc_dup_for_meta_wvalid_T_3 |
    _s3_can_do_amo_write_dup_for_meta_wvalid_T_21; // @[CacheConstants.scala 57:76]
  wire  s3_can_do_amo_write_dup_for_meta_wvalid = s3_can_do_amo_dup_for_meta_wvalid &
    _s3_can_do_amo_write_dup_for_meta_wvalid_T_22 & ~s3_sc_fail_dup_for_meta_wvalid; // @[MainPipe.scala 739:129]
  wire  update_data_dup_for_meta_wvalid = miss_update_meta_dup_for_meta_wvalid | s3_store_hit_dup_for_meta_wvalid |
    s3_can_do_amo_write_dup_for_meta_wvalid; // @[MainPipe.scala 740:112]
  wire  s3_probe_can_go_dup_for_meta_wvalid = s3_req_probe_dup_for_meta_wvalid & io_wb_ready_dup_8; // @[MainPipe.scala 742:80]
  wire  _s3_store_can_go_dup_for_meta_wvalid_T_7 = io_data_write_ready_dup_8 | ~update_data_dup_for_meta_wvalid; // @[MainPipe.scala 747:45]
  wire  s3_store_can_go_dup_for_meta_wvalid = _store_update_meta_dup_for_meta_wvalid_T_2 &
    _s3_store_can_go_dup_for_meta_wvalid_T_7; // @[MainPipe.scala 746:70]
  wire  _s3_amo_can_go_dup_for_meta_wvalid_T_5 = s3_amo_hit_dup_for_meta_wvalid &
    _s3_store_can_go_dup_for_meta_wvalid_T_7; // @[MainPipe.scala 749:68]
  wire  _s3_amo_can_go_dup_for_meta_wvalid_T_7 = s3_s_amoalu_dup_for_meta_wvalid | ~
    amo_wait_amoalu_dup_for_meta_wvalid; // @[MainPipe.scala 751:39]
  wire  s3_amo_can_go_dup_for_meta_wvalid = _s3_amo_can_go_dup_for_meta_wvalid_T_5 &
    _s3_amo_can_go_dup_for_meta_wvalid_T_7; // @[MainPipe.scala 750:83]
  wire  _s3_miss_can_go_dup_for_meta_wvalid_T_5 = miss_update_meta_dup_for_meta_wvalid &
    _s3_store_can_go_dup_for_meta_wvalid_T_7; // @[MainPipe.scala 753:68]
  wire  _s3_miss_can_go_dup_for_meta_wvalid_T_8 = _s3_miss_can_go_dup_for_meta_wvalid_T_5 &
    _s3_amo_can_go_dup_for_meta_wvalid_T_7; // @[MainPipe.scala 754:83]
  wire  _s3_miss_can_go_dup_for_meta_wvalid_T_9 = _s3_miss_can_go_dup_for_meta_wvalid_T_8 & io_tag_write_ready_dup_8; // @[MainPipe.scala 755:81]
  wire  s3_miss_can_go_dup_for_meta_wvalid = _s3_miss_can_go_dup_for_meta_wvalid_T_9 & io_wb_ready_dup_8; // @[MainPipe.scala 756:43]
  wire  _s3_replace_can_go_dup_for_meta_wvalid_T_1 = s3_coh_dup_for_meta_wvalid_state == 2'h0 | io_wb_ready_dup_8; // @[MainPipe.scala 759:65]
  wire  s3_replace_can_go_dup_for_meta_wvalid = s3_req_replace_dup_for_meta_wvalid &
    _s3_replace_can_go_dup_for_meta_wvalid_T_1; // @[MainPipe.scala 758:84]
  wire  _s3_can_go_dup_for_meta_wvalid_T = s3_probe_can_go_dup_for_meta_wvalid | s3_store_can_go_dup_for_meta_wvalid; // @[MainPipe.scala 760:77]
  wire  _s3_can_go_dup_for_meta_wvalid_T_1 = _s3_can_go_dup_for_meta_wvalid_T | s3_amo_can_go_dup_for_meta_wvalid; // @[MainPipe.scala 761:42]
  wire  _s3_can_go_dup_for_meta_wvalid_T_2 = _s3_can_go_dup_for_meta_wvalid_T_1 | s3_miss_can_go_dup_for_meta_wvalid; // @[MainPipe.scala 762:40]
  wire  s3_can_go_dup_for_meta_wvalid = _s3_can_go_dup_for_meta_wvalid_T_2 | s3_replace_can_go_dup_for_meta_wvalid; // @[MainPipe.scala 763:41]
  wire  s3_fire_dup_for_meta_wvalid = s3_valid_dup_for_meta_wvalid & s3_can_go_dup_for_meta_wvalid; // @[MainPipe.scala 766:68]
  wire  _GEN_397 = do_amoalu_dup_for_meta_wvalid | s3_s_amoalu_dup_for_meta_wvalid; // @[MainPipe.scala 767:41 707:49 767:76]
  wire [1:0] s3_probe_new_coh_state = s3_probe_ttob_override ? 2'h0 : probe_new_coh_dup_for_meta_wvalid_state; // @[MainPipe.scala 775:29]
  wire  _new_coh_T = store_update_meta_dup_for_meta_wvalid | amo_update_meta_dup_for_meta_wvalid; // @[MainPipe.scala 791:48]
  wire [1:0] _new_coh_T_1_state = _new_coh_T ? s3_new_hit_coh_dup_for_meta_wvalid_state : 2'h0; // @[MainPipe.scala 790:10]
  wire [1:0] _new_coh_T_2_state = probe_update_meta ? s3_probe_new_coh_state : _new_coh_T_1_state; // @[MainPipe.scala 787:8]
  wire  _GEN_400 = s3_fire_dup_for_meta_wvalid ? 1'h0 : s3_valid_dup_for_meta_wvalid; // @[MainPipe.scala 799:44 705:46 799:76]
  reg  miss_update_meta_dup_for_err_wvalid; // @[Reg.scala 16:16]
  reg  s3_req_probe_dup_for_err_wvalid; // @[Reg.scala 16:16]
  reg  s3_tag_match_dup_for_err_wvalid; // @[Reg.scala 16:16]
  reg [1:0] s3_coh_dup_for_err_wvalid_state; // @[Reg.scala 16:16]
  reg [1:0] s3_req_probe_param_dup_for_err_wvalid; // @[Reg.scala 16:16]
  wire [3:0] _probe_new_coh_dup_for_err_wvalid_T = {s3_req_probe_param_dup_for_err_wvalid,
    s3_coh_dup_for_err_wvalid_state}; // @[Cat.scala 31:58]
  wire  _probe_new_coh_dup_for_err_wvalid_T_33 = 4'h5 == _probe_new_coh_dup_for_err_wvalid_T; // @[Misc.scala 55:20]
  wire [1:0] _probe_new_coh_dup_for_err_wvalid_T_36 = _probe_new_coh_dup_for_err_wvalid_T_33 ? 2'h1 : 2'h0; // @[Misc.scala 37:63]
  wire  _probe_new_coh_dup_for_err_wvalid_T_37 = 4'h6 == _probe_new_coh_dup_for_err_wvalid_T; // @[Misc.scala 55:20]
  wire [1:0] _probe_new_coh_dup_for_err_wvalid_T_40 = _probe_new_coh_dup_for_err_wvalid_T_37 ? 2'h1 :
    _probe_new_coh_dup_for_err_wvalid_T_36; // @[Misc.scala 37:63]
  wire  _probe_new_coh_dup_for_err_wvalid_T_41 = 4'h7 == _probe_new_coh_dup_for_err_wvalid_T; // @[Misc.scala 55:20]
  wire [1:0] _probe_new_coh_dup_for_err_wvalid_T_44 = _probe_new_coh_dup_for_err_wvalid_T_41 ? 2'h1 :
    _probe_new_coh_dup_for_err_wvalid_T_40; // @[Misc.scala 37:63]
  wire  _probe_new_coh_dup_for_err_wvalid_T_45 = 4'h0 == _probe_new_coh_dup_for_err_wvalid_T; // @[Misc.scala 55:20]
  wire [1:0] _probe_new_coh_dup_for_err_wvalid_T_48 = _probe_new_coh_dup_for_err_wvalid_T_45 ? 2'h0 :
    _probe_new_coh_dup_for_err_wvalid_T_44; // @[Misc.scala 37:63]
  wire  _probe_new_coh_dup_for_err_wvalid_T_49 = 4'h1 == _probe_new_coh_dup_for_err_wvalid_T; // @[Misc.scala 55:20]
  wire [1:0] _probe_new_coh_dup_for_err_wvalid_T_52 = _probe_new_coh_dup_for_err_wvalid_T_49 ? 2'h1 :
    _probe_new_coh_dup_for_err_wvalid_T_48; // @[Misc.scala 37:63]
  wire  _probe_new_coh_dup_for_err_wvalid_T_53 = 4'h2 == _probe_new_coh_dup_for_err_wvalid_T; // @[Misc.scala 55:20]
  wire [1:0] _probe_new_coh_dup_for_err_wvalid_T_56 = _probe_new_coh_dup_for_err_wvalid_T_53 ? 2'h2 :
    _probe_new_coh_dup_for_err_wvalid_T_52; // @[Misc.scala 37:63]
  wire  _probe_new_coh_dup_for_err_wvalid_T_57 = 4'h3 == _probe_new_coh_dup_for_err_wvalid_T; // @[Misc.scala 55:20]
  wire [1:0] probe_new_coh_dup_for_err_wvalid_state = _probe_new_coh_dup_for_err_wvalid_T_57 ? 2'h2 :
    _probe_new_coh_dup_for_err_wvalid_T_56; // @[Misc.scala 37:63]
  reg [3:0] s3_req_source_dup_for_err_wvalid; // @[Reg.scala 16:16]
  reg [4:0] s3_req_cmd_dup_for_err_wvalid; // @[Reg.scala 16:16]
  reg  s3_req_replace_dup_for_err_wvalid; // @[Reg.scala 16:16]
  reg [1:0] s3_hit_coh_dup_for_err_wvalid_state; // @[Reg.scala 16:16]
  reg [1:0] s3_new_hit_coh_dup_for_err_wvalid_state; // @[Reg.scala 16:16]
  wire  _probe_update_meta_dup_for_err_wvalid_T_1 = s3_coh_dup_for_err_wvalid_state ==
    probe_new_coh_dup_for_err_wvalid_state; // @[Metadata.scala 45:46]
  wire  _probe_update_meta_dup_for_err_wvalid_T_2 = ~_probe_update_meta_dup_for_err_wvalid_T_1; // @[Metadata.scala 46:40]
  wire  probe_update_meta_dup_for_err_wvalid = s3_req_probe_dup_for_err_wvalid & s3_tag_match_dup_for_err_wvalid &
    _probe_update_meta_dup_for_err_wvalid_T_2; // @[MainPipe.scala 816:116]
  wire  _store_update_meta_dup_for_err_wvalid_T_1 = ~s3_req_probe_dup_for_err_wvalid; // @[MainPipe.scala 818:5]
  wire  _store_update_meta_dup_for_err_wvalid_T_2 = s3_req_source_dup_for_err_wvalid == 4'h1 &
    _store_update_meta_dup_for_err_wvalid_T_1; // @[MainPipe.scala 817:100]
  wire  _store_update_meta_dup_for_err_wvalid_T_3 = s3_hit_coh_dup_for_err_wvalid_state ==
    s3_new_hit_coh_dup_for_err_wvalid_state; // @[Metadata.scala 45:46]
  wire  _store_update_meta_dup_for_err_wvalid_T_4 = ~_store_update_meta_dup_for_err_wvalid_T_3; // @[Metadata.scala 46:40]
  wire  store_update_meta_dup_for_err_wvalid = _store_update_meta_dup_for_err_wvalid_T_2 &
    _store_update_meta_dup_for_err_wvalid_T_4; // @[MainPipe.scala 818:39]
  wire  _amo_update_meta_dup_for_err_wvalid_T = s3_req_source_dup_for_err_wvalid == 4'h2; // @[MainPipe.scala 820:79]
  wire  _amo_update_meta_dup_for_err_wvalid_T_2 = s3_req_source_dup_for_err_wvalid == 4'h2 &
    _store_update_meta_dup_for_err_wvalid_T_1; // @[MainPipe.scala 820:96]
  wire  amo_update_meta_dup_for_err_wvalid = _amo_update_meta_dup_for_err_wvalid_T_2 &
    _store_update_meta_dup_for_err_wvalid_T_4; // @[MainPipe.scala 821:39]
  wire  _update_meta_dup_for_err_wvalid_T = miss_update_meta_dup_for_err_wvalid |
    probe_update_meta_dup_for_err_wvalid; // @[MainPipe.scala 824:42]
  wire  _update_meta_dup_for_err_wvalid_T_1 = _update_meta_dup_for_err_wvalid_T |
    store_update_meta_dup_for_err_wvalid; // @[MainPipe.scala 825:43]
  wire  _update_meta_dup_for_err_wvalid_T_2 = _update_meta_dup_for_err_wvalid_T_1 |
    amo_update_meta_dup_for_err_wvalid; // @[MainPipe.scala 826:43]
  wire  update_meta_dup_for_err_wvalid = _update_meta_dup_for_err_wvalid_T_2 & ~s3_req_replace_dup_for_err_wvalid; // @[MainPipe.scala 828:5]
  reg  s3_valid_dup_for_err_wvalid; // @[MainPipe.scala 830:45]
  reg  s3_amo_hit_dup_for_err_wvalid; // @[Reg.scala 16:16]
  reg  s3_s_amoalu_dup_for_err_wvalid; // @[MainPipe.scala 832:48]
  wire  _amo_wait_amoalu_dup_for_err_wvalid_T_1 = s3_req_cmd_dup_for_err_wvalid != 5'h6; // @[MainPipe.scala 834:36]
  wire  _amo_wait_amoalu_dup_for_err_wvalid_T_2 = _amo_update_meta_dup_for_err_wvalid_T &
    _amo_wait_amoalu_dup_for_err_wvalid_T_1; // @[MainPipe.scala 833:96]
  wire  _amo_wait_amoalu_dup_for_err_wvalid_T_3 = s3_req_cmd_dup_for_err_wvalid != 5'h7; // @[MainPipe.scala 835:36]
  wire  amo_wait_amoalu_dup_for_err_wvalid = _amo_wait_amoalu_dup_for_err_wvalid_T_2 &
    _amo_wait_amoalu_dup_for_err_wvalid_T_3; // @[MainPipe.scala 834:46]
  wire  do_amoalu_dup_for_err_wvalid = amo_wait_amoalu_dup_for_err_wvalid & s3_valid_dup_for_err_wvalid & ~
    s3_s_amoalu_dup_for_err_wvalid; // @[MainPipe.scala 836:107]
  reg  s3_store_hit_dup_for_err_wvalid; // @[Reg.scala 16:16]
  reg [35:0] s3_req_addr_dup_for_err_wvalid; // @[Reg.scala 16:16]
  wire  s3_can_do_amo_dup_for_err_wvalid = miss_update_meta_dup_for_err_wvalid &
    _store_update_meta_dup_for_err_wvalid_T_1 & _amo_update_meta_dup_for_err_wvalid_T | s3_amo_hit_dup_for_err_wvalid
    ; // @[MainPipe.scala 840:168]
  wire  _s3_lr_dup_for_err_wvalid_T_2 = _store_update_meta_dup_for_err_wvalid_T_1 &
    _amo_update_meta_dup_for_err_wvalid_T; // @[MainPipe.scala 843:69]
  wire  s3_lr_dup_for_err_wvalid = _store_update_meta_dup_for_err_wvalid_T_1 & _amo_update_meta_dup_for_err_wvalid_T
     & s3_req_cmd_dup_for_err_wvalid == 5'h6; // @[MainPipe.scala 843:123]
  wire  _s3_sc_dup_for_err_wvalid_T_3 = s3_req_cmd_dup_for_err_wvalid == 5'h7; // @[MainPipe.scala 844:157]
  wire  s3_sc_dup_for_err_wvalid = _s3_lr_dup_for_err_wvalid_T_2 & s3_req_cmd_dup_for_err_wvalid == 5'h7; // @[MainPipe.scala 844:123]
  reg [35:0] lrsc_addr_dup_for_err_wvalid; // @[MainPipe.scala 845:42]
  reg [5:0] lrsc_count_dup_for_err_wvalid; // @[MainPipe.scala 846:47]
  wire [35:0] _lrsc_addr_dup_for_err_wvalid_T_1 = {s3_req_addr_dup_for_err_wvalid[35:6], 6'h0}; // @[L1Cache.scala 84:59]
  wire [5:0] _lrsc_count_dup_for_err_wvalid_T_1 = lrsc_count_dup_for_err_wvalid - 6'h1; // @[MainPipe.scala 858:70]
  wire  lrsc_valid_dup_for_err_wvalid = lrsc_count_dup_for_err_wvalid > 6'h8; // @[MainPipe.scala 861:71]
  wire  s3_lrsc_addr_match_dup_for_err_wvalid = lrsc_valid_dup_for_err_wvalid & lrsc_addr_dup_for_err_wvalid ==
    _lrsc_addr_dup_for_err_wvalid_T_1; // @[MainPipe.scala 862:79]
  wire  s3_sc_fail_dup_for_err_wvalid = s3_sc_dup_for_err_wvalid & ~s3_lrsc_addr_match_dup_for_err_wvalid; // @[MainPipe.scala 863:66]
  wire  _s3_can_do_amo_write_dup_for_err_wvalid_T_11 = s3_req_cmd_dup_for_err_wvalid == 5'h4 |
    s3_req_cmd_dup_for_err_wvalid == 5'h9 | s3_req_cmd_dup_for_err_wvalid == 5'ha | s3_req_cmd_dup_for_err_wvalid == 5'hb
    ; // @[CacheConstants.scala 52:90]
  wire  _s3_can_do_amo_write_dup_for_err_wvalid_T_20 = s3_req_cmd_dup_for_err_wvalid == 5'h8 |
    s3_req_cmd_dup_for_err_wvalid == 5'hc | s3_req_cmd_dup_for_err_wvalid == 5'hd | s3_req_cmd_dup_for_err_wvalid == 5'he
     | s3_req_cmd_dup_for_err_wvalid == 5'hf; // @[CacheConstants.scala 53:114]
  wire  _s3_can_do_amo_write_dup_for_err_wvalid_T_21 = _s3_can_do_amo_write_dup_for_err_wvalid_T_11 |
    _s3_can_do_amo_write_dup_for_err_wvalid_T_20; // @[CacheConstants.scala 54:44]
  wire  _s3_can_do_amo_write_dup_for_err_wvalid_T_22 = s3_req_cmd_dup_for_err_wvalid == 5'h1 |
    s3_req_cmd_dup_for_err_wvalid == 5'h11 | _s3_sc_dup_for_err_wvalid_T_3 |
    _s3_can_do_amo_write_dup_for_err_wvalid_T_21; // @[CacheConstants.scala 57:76]
  wire  s3_can_do_amo_write_dup_for_err_wvalid = s3_can_do_amo_dup_for_err_wvalid &
    _s3_can_do_amo_write_dup_for_err_wvalid_T_22 & ~s3_sc_fail_dup_for_err_wvalid; // @[MainPipe.scala 864:126]
  wire  update_data_dup_for_err_wvalid = miss_update_meta_dup_for_err_wvalid | s3_store_hit_dup_for_err_wvalid |
    s3_can_do_amo_write_dup_for_err_wvalid; // @[MainPipe.scala 865:109]
  wire  s3_probe_can_go_dup_for_err_wvalid = s3_req_probe_dup_for_err_wvalid & io_wb_ready_dup_10; // @[MainPipe.scala 867:78]
  wire  _s3_store_can_go_dup_for_err_wvalid_T_7 = io_data_write_ready_dup_10 | ~update_data_dup_for_err_wvalid; // @[MainPipe.scala 872:44]
  wire  s3_store_can_go_dup_for_err_wvalid = _store_update_meta_dup_for_err_wvalid_T_2 &
    _s3_store_can_go_dup_for_err_wvalid_T_7; // @[MainPipe.scala 871:69]
  wire  _s3_amo_can_go_dup_for_err_wvalid_T_5 = s3_amo_hit_dup_for_err_wvalid &
    _s3_store_can_go_dup_for_err_wvalid_T_7; // @[MainPipe.scala 874:67]
  wire  _s3_amo_can_go_dup_for_err_wvalid_T_7 = s3_s_amoalu_dup_for_err_wvalid | ~amo_wait_amoalu_dup_for_err_wvalid; // @[MainPipe.scala 876:38]
  wire  s3_amo_can_go_dup_for_err_wvalid = _s3_amo_can_go_dup_for_err_wvalid_T_5 &
    _s3_amo_can_go_dup_for_err_wvalid_T_7; // @[MainPipe.scala 875:81]
  wire  _s3_miss_can_go_dup_for_err_wvalid_T_5 = miss_update_meta_dup_for_err_wvalid &
    _s3_store_can_go_dup_for_err_wvalid_T_7; // @[MainPipe.scala 878:67]
  wire  _s3_miss_can_go_dup_for_err_wvalid_T_8 = _s3_miss_can_go_dup_for_err_wvalid_T_5 &
    _s3_amo_can_go_dup_for_err_wvalid_T_7; // @[MainPipe.scala 879:81]
  wire  _s3_miss_can_go_dup_for_err_wvalid_T_9 = _s3_miss_can_go_dup_for_err_wvalid_T_8 & io_tag_write_ready_dup_10; // @[MainPipe.scala 880:79]
  wire  s3_miss_can_go_dup_for_err_wvalid = _s3_miss_can_go_dup_for_err_wvalid_T_9 & io_wb_ready_dup_10; // @[MainPipe.scala 881:42]
  wire  _s3_replace_can_go_dup_for_err_wvalid_T_1 = s3_coh_dup_for_err_wvalid_state == 2'h0 | io_wb_ready_dup_10; // @[MainPipe.scala 884:64]
  wire  s3_replace_can_go_dup_for_err_wvalid = s3_req_replace_dup_for_err_wvalid &
    _s3_replace_can_go_dup_for_err_wvalid_T_1; // @[MainPipe.scala 883:82]
  wire  _s3_can_go_dup_for_err_wvalid_T = s3_probe_can_go_dup_for_err_wvalid | s3_store_can_go_dup_for_err_wvalid; // @[MainPipe.scala 885:75]
  wire  _s3_can_go_dup_for_err_wvalid_T_1 = _s3_can_go_dup_for_err_wvalid_T | s3_amo_can_go_dup_for_err_wvalid; // @[MainPipe.scala 886:41]
  wire  _s3_can_go_dup_for_err_wvalid_T_2 = _s3_can_go_dup_for_err_wvalid_T_1 | s3_miss_can_go_dup_for_err_wvalid; // @[MainPipe.scala 887:39]
  wire  s3_can_go_dup_for_err_wvalid = _s3_can_go_dup_for_err_wvalid_T_2 | s3_replace_can_go_dup_for_err_wvalid; // @[MainPipe.scala 888:40]
  wire  s3_fire_dup_for_err_wvalid = s3_valid_dup_for_err_wvalid & s3_can_go_dup_for_err_wvalid; // @[MainPipe.scala 891:66]
  wire  _GEN_421 = do_amoalu_dup_for_err_wvalid | s3_s_amoalu_dup_for_err_wvalid; // @[MainPipe.scala 892:40 832:48 892:74]
  wire  _GEN_423 = s3_fire_dup_for_err_wvalid ? 1'h0 : s3_valid_dup_for_err_wvalid; // @[MainPipe.scala 896:43 830:45 896:74]
  reg  miss_update_meta_dup_for_tag_wvalid; // @[Reg.scala 16:16]
  reg  s3_req_probe_dup_for_tag_wvalid; // @[Reg.scala 16:16]
  reg [1:0] s3_coh_dup_for_tag_wvalid_state; // @[Reg.scala 16:16]
  reg [3:0] s3_req_source_dup_for_tag_wvalid; // @[Reg.scala 16:16]
  reg [4:0] s3_req_cmd_dup_for_tag_wvalid; // @[Reg.scala 16:16]
  reg  s3_req_replace_dup_for_tag_wvalid; // @[Reg.scala 16:16]
  wire  _store_update_meta_dup_for_tag_wvalid_T_1 = ~s3_req_probe_dup_for_tag_wvalid; // @[MainPipe.scala 914:5]
  wire  _store_update_meta_dup_for_tag_wvalid_T_2 = s3_req_source_dup_for_tag_wvalid == 4'h1 &
    _store_update_meta_dup_for_tag_wvalid_T_1; // @[MainPipe.scala 913:100]
  wire  _amo_update_meta_dup_for_tag_wvalid_T = s3_req_source_dup_for_tag_wvalid == 4'h2; // @[MainPipe.scala 916:79]
  reg  s3_valid_dup_for_tag_wvalid; // @[MainPipe.scala 926:45]
  reg  s3_amo_hit_dup_for_tag_wvalid; // @[Reg.scala 16:16]
  reg  s3_s_amoalu_dup_for_tag_wvalid; // @[MainPipe.scala 928:48]
  wire  _amo_wait_amoalu_dup_for_tag_wvalid_T_1 = s3_req_cmd_dup_for_tag_wvalid != 5'h6; // @[MainPipe.scala 930:36]
  wire  _amo_wait_amoalu_dup_for_tag_wvalid_T_2 = _amo_update_meta_dup_for_tag_wvalid_T &
    _amo_wait_amoalu_dup_for_tag_wvalid_T_1; // @[MainPipe.scala 929:96]
  wire  _amo_wait_amoalu_dup_for_tag_wvalid_T_3 = s3_req_cmd_dup_for_tag_wvalid != 5'h7; // @[MainPipe.scala 931:36]
  wire  amo_wait_amoalu_dup_for_tag_wvalid = _amo_wait_amoalu_dup_for_tag_wvalid_T_2 &
    _amo_wait_amoalu_dup_for_tag_wvalid_T_3; // @[MainPipe.scala 930:46]
  wire  do_amoalu_dup_for_tag_wvalid = amo_wait_amoalu_dup_for_tag_wvalid & s3_valid_dup_for_tag_wvalid & ~
    s3_s_amoalu_dup_for_tag_wvalid; // @[MainPipe.scala 932:107]
  reg  s3_store_hit_dup_for_tag_wvalid; // @[Reg.scala 16:16]
  reg [35:0] s3_req_addr_dup_for_tag_wvalid; // @[Reg.scala 16:16]
  wire  s3_can_do_amo_dup_for_tag_wvalid = miss_update_meta_dup_for_tag_wvalid &
    _store_update_meta_dup_for_tag_wvalid_T_1 & _amo_update_meta_dup_for_tag_wvalid_T | s3_amo_hit_dup_for_tag_wvalid
    ; // @[MainPipe.scala 936:168]
  wire  _s3_lr_dup_for_tag_wvalid_T_2 = _store_update_meta_dup_for_tag_wvalid_T_1 &
    _amo_update_meta_dup_for_tag_wvalid_T; // @[MainPipe.scala 939:69]
  wire  s3_lr_dup_for_tag_wvalid = _store_update_meta_dup_for_tag_wvalid_T_1 & _amo_update_meta_dup_for_tag_wvalid_T
     & s3_req_cmd_dup_for_tag_wvalid == 5'h6; // @[MainPipe.scala 939:123]
  wire  _s3_sc_dup_for_tag_wvalid_T_3 = s3_req_cmd_dup_for_tag_wvalid == 5'h7; // @[MainPipe.scala 940:157]
  wire  s3_sc_dup_for_tag_wvalid = _s3_lr_dup_for_tag_wvalid_T_2 & s3_req_cmd_dup_for_tag_wvalid == 5'h7; // @[MainPipe.scala 940:123]
  reg [35:0] lrsc_addr_dup_for_tag_wvalid; // @[MainPipe.scala 941:42]
  reg [5:0] lrsc_count_dup_for_tag_wvalid; // @[MainPipe.scala 942:47]
  wire [35:0] _lrsc_addr_dup_for_tag_wvalid_T_1 = {s3_req_addr_dup_for_tag_wvalid[35:6], 6'h0}; // @[L1Cache.scala 84:59]
  wire [5:0] _lrsc_count_dup_for_tag_wvalid_T_1 = lrsc_count_dup_for_tag_wvalid - 6'h1; // @[MainPipe.scala 954:70]
  wire  lrsc_valid_dup_for_tag_wvalid = lrsc_count_dup_for_tag_wvalid > 6'h8; // @[MainPipe.scala 957:71]
  wire  s3_lrsc_addr_match_dup_for_tag_wvalid = lrsc_valid_dup_for_tag_wvalid & lrsc_addr_dup_for_tag_wvalid ==
    _lrsc_addr_dup_for_tag_wvalid_T_1; // @[MainPipe.scala 958:79]
  wire  s3_sc_fail_dup_for_tag_wvalid = s3_sc_dup_for_tag_wvalid & ~s3_lrsc_addr_match_dup_for_tag_wvalid; // @[MainPipe.scala 959:66]
  wire  _s3_can_do_amo_write_dup_for_tag_wvalid_T_11 = s3_req_cmd_dup_for_tag_wvalid == 5'h4 |
    s3_req_cmd_dup_for_tag_wvalid == 5'h9 | s3_req_cmd_dup_for_tag_wvalid == 5'ha | s3_req_cmd_dup_for_tag_wvalid == 5'hb
    ; // @[CacheConstants.scala 52:90]
  wire  _s3_can_do_amo_write_dup_for_tag_wvalid_T_20 = s3_req_cmd_dup_for_tag_wvalid == 5'h8 |
    s3_req_cmd_dup_for_tag_wvalid == 5'hc | s3_req_cmd_dup_for_tag_wvalid == 5'hd | s3_req_cmd_dup_for_tag_wvalid == 5'he
     | s3_req_cmd_dup_for_tag_wvalid == 5'hf; // @[CacheConstants.scala 53:114]
  wire  _s3_can_do_amo_write_dup_for_tag_wvalid_T_21 = _s3_can_do_amo_write_dup_for_tag_wvalid_T_11 |
    _s3_can_do_amo_write_dup_for_tag_wvalid_T_20; // @[CacheConstants.scala 54:44]
  wire  _s3_can_do_amo_write_dup_for_tag_wvalid_T_22 = s3_req_cmd_dup_for_tag_wvalid == 5'h1 |
    s3_req_cmd_dup_for_tag_wvalid == 5'h11 | _s3_sc_dup_for_tag_wvalid_T_3 |
    _s3_can_do_amo_write_dup_for_tag_wvalid_T_21; // @[CacheConstants.scala 57:76]
  wire  s3_can_do_amo_write_dup_for_tag_wvalid = s3_can_do_amo_dup_for_tag_wvalid &
    _s3_can_do_amo_write_dup_for_tag_wvalid_T_22 & ~s3_sc_fail_dup_for_tag_wvalid; // @[MainPipe.scala 960:126]
  wire  update_data_dup_for_tag_wvalid = miss_update_meta_dup_for_tag_wvalid | s3_store_hit_dup_for_tag_wvalid |
    s3_can_do_amo_write_dup_for_tag_wvalid; // @[MainPipe.scala 961:109]
  wire  s3_probe_can_go_dup_for_tag_wvalid = s3_req_probe_dup_for_tag_wvalid & io_wb_ready_dup_9; // @[MainPipe.scala 963:78]
  wire  _s3_store_can_go_dup_for_tag_wvalid_T_7 = io_data_write_ready_dup_9 | ~update_data_dup_for_tag_wvalid; // @[MainPipe.scala 968:44]
  wire  s3_store_can_go_dup_for_tag_wvalid = _store_update_meta_dup_for_tag_wvalid_T_2 &
    _s3_store_can_go_dup_for_tag_wvalid_T_7; // @[MainPipe.scala 967:69]
  wire  _s3_amo_can_go_dup_for_tag_wvalid_T_5 = s3_amo_hit_dup_for_tag_wvalid &
    _s3_store_can_go_dup_for_tag_wvalid_T_7; // @[MainPipe.scala 970:67]
  wire  _s3_amo_can_go_dup_for_tag_wvalid_T_7 = s3_s_amoalu_dup_for_tag_wvalid | ~amo_wait_amoalu_dup_for_tag_wvalid; // @[MainPipe.scala 972:38]
  wire  s3_amo_can_go_dup_for_tag_wvalid = _s3_amo_can_go_dup_for_tag_wvalid_T_5 &
    _s3_amo_can_go_dup_for_tag_wvalid_T_7; // @[MainPipe.scala 971:81]
  wire  _s3_miss_can_go_dup_for_tag_wvalid_T_5 = miss_update_meta_dup_for_tag_wvalid &
    _s3_store_can_go_dup_for_tag_wvalid_T_7; // @[MainPipe.scala 974:67]
  wire  _s3_miss_can_go_dup_for_tag_wvalid_T_8 = _s3_miss_can_go_dup_for_tag_wvalid_T_5 &
    _s3_amo_can_go_dup_for_tag_wvalid_T_7; // @[MainPipe.scala 975:81]
  wire  _s3_miss_can_go_dup_for_tag_wvalid_T_9 = _s3_miss_can_go_dup_for_tag_wvalid_T_8 & io_tag_write_ready_dup_9; // @[MainPipe.scala 976:79]
  wire  s3_miss_can_go_dup_for_tag_wvalid = _s3_miss_can_go_dup_for_tag_wvalid_T_9 & io_wb_ready_dup_9; // @[MainPipe.scala 977:42]
  wire  _s3_replace_can_go_dup_for_tag_wvalid_T_1 = s3_coh_dup_for_tag_wvalid_state == 2'h0 | io_wb_ready_dup_9; // @[MainPipe.scala 980:64]
  wire  s3_replace_can_go_dup_for_tag_wvalid = s3_req_replace_dup_for_tag_wvalid &
    _s3_replace_can_go_dup_for_tag_wvalid_T_1; // @[MainPipe.scala 979:82]
  wire  _s3_can_go_dup_for_tag_wvalid_T = s3_probe_can_go_dup_for_tag_wvalid | s3_store_can_go_dup_for_tag_wvalid; // @[MainPipe.scala 981:75]
  wire  _s3_can_go_dup_for_tag_wvalid_T_1 = _s3_can_go_dup_for_tag_wvalid_T | s3_amo_can_go_dup_for_tag_wvalid; // @[MainPipe.scala 982:41]
  wire  _s3_can_go_dup_for_tag_wvalid_T_2 = _s3_can_go_dup_for_tag_wvalid_T_1 | s3_miss_can_go_dup_for_tag_wvalid; // @[MainPipe.scala 983:39]
  wire  s3_can_go_dup_for_tag_wvalid = _s3_can_go_dup_for_tag_wvalid_T_2 | s3_replace_can_go_dup_for_tag_wvalid; // @[MainPipe.scala 984:40]
  wire  s3_fire_dup_for_tag_wvalid = s3_valid_dup_for_tag_wvalid & s3_can_go_dup_for_tag_wvalid; // @[MainPipe.scala 987:66]
  wire  _GEN_444 = do_amoalu_dup_for_tag_wvalid | s3_s_amoalu_dup_for_tag_wvalid; // @[MainPipe.scala 988:40 928:48 988:74]
  wire  _GEN_446 = s3_fire_dup_for_tag_wvalid ? 1'h0 : s3_valid_dup_for_tag_wvalid; // @[MainPipe.scala 992:43 926:45 992:74]
  reg  miss_update_meta_dup_for_data_wvalid; // @[Reg.scala 16:16]
  reg  s3_req_probe_dup_for_data_wvalid; // @[Reg.scala 16:16]
  reg [1:0] s3_coh_dup_for_data_wvalid_state; // @[Reg.scala 16:16]
  reg [3:0] s3_req_source_dup_for_data_wvalid; // @[Reg.scala 16:16]
  reg [4:0] s3_req_cmd_dup_for_data_wvalid; // @[Reg.scala 16:16]
  reg  s3_req_replace_dup_for_data_wvalid; // @[Reg.scala 16:16]
  wire  _store_update_meta_dup_for_data_wvalid_T_1 = ~s3_req_probe_dup_for_data_wvalid; // @[MainPipe.scala 1010:5]
  wire  _store_update_meta_dup_for_data_wvalid_T_2 = s3_req_source_dup_for_data_wvalid == 4'h1 &
    _store_update_meta_dup_for_data_wvalid_T_1; // @[MainPipe.scala 1009:102]
  wire  _amo_update_meta_dup_for_data_wvalid_T = s3_req_source_dup_for_data_wvalid == 4'h2; // @[MainPipe.scala 1012:81]
  reg  s3_valid_dup_for_data_wvalid; // @[MainPipe.scala 1022:46]
  reg  s3_amo_hit_dup_for_data_wvalid; // @[Reg.scala 16:16]
  reg  s3_s_amoalu_dup_for_data_wvalid; // @[MainPipe.scala 1024:49]
  wire  _amo_wait_amoalu_dup_for_data_wvalid_T_1 = s3_req_cmd_dup_for_data_wvalid != 5'h6; // @[MainPipe.scala 1026:37]
  wire  _amo_wait_amoalu_dup_for_data_wvalid_T_2 = _amo_update_meta_dup_for_data_wvalid_T &
    _amo_wait_amoalu_dup_for_data_wvalid_T_1; // @[MainPipe.scala 1025:98]
  wire  _amo_wait_amoalu_dup_for_data_wvalid_T_3 = s3_req_cmd_dup_for_data_wvalid != 5'h7; // @[MainPipe.scala 1027:37]
  wire  amo_wait_amoalu_dup_for_data_wvalid = _amo_wait_amoalu_dup_for_data_wvalid_T_2 &
    _amo_wait_amoalu_dup_for_data_wvalid_T_3; // @[MainPipe.scala 1026:47]
  wire  do_amoalu_dup_for_data_wvalid = amo_wait_amoalu_dup_for_data_wvalid & s3_valid_dup_for_data_wvalid & ~
    s3_s_amoalu_dup_for_data_wvalid; // @[MainPipe.scala 1028:110]
  reg  s3_store_hit_dup_for_data_wvalid; // @[Reg.scala 16:16]
  reg [35:0] s3_req_addr_dup_for_data_wvalid; // @[Reg.scala 16:16]
  wire  s3_can_do_amo_dup_for_data_wvalid = miss_update_meta_dup_for_data_wvalid &
    _store_update_meta_dup_for_data_wvalid_T_1 & _amo_update_meta_dup_for_data_wvalid_T |
    s3_amo_hit_dup_for_data_wvalid; // @[MainPipe.scala 1032:172]
  wire  _s3_lr_dup_for_data_wvalid_T_2 = _store_update_meta_dup_for_data_wvalid_T_1 &
    _amo_update_meta_dup_for_data_wvalid_T; // @[MainPipe.scala 1035:71]
  wire  s3_lr_dup_for_data_wvalid = _store_update_meta_dup_for_data_wvalid_T_1 &
    _amo_update_meta_dup_for_data_wvalid_T & s3_req_cmd_dup_for_data_wvalid == 5'h6; // @[MainPipe.scala 1035:126]
  wire  _s3_sc_dup_for_data_wvalid_T_3 = s3_req_cmd_dup_for_data_wvalid == 5'h7; // @[MainPipe.scala 1036:161]
  wire  s3_sc_dup_for_data_wvalid = _s3_lr_dup_for_data_wvalid_T_2 & s3_req_cmd_dup_for_data_wvalid == 5'h7; // @[MainPipe.scala 1036:126]
  reg [35:0] lrsc_addr_dup_for_data_wvalid; // @[MainPipe.scala 1037:43]
  reg [5:0] lrsc_count_dup_for_data_wvalid; // @[MainPipe.scala 1038:48]
  wire [35:0] _lrsc_addr_dup_for_data_wvalid_T_1 = {s3_req_addr_dup_for_data_wvalid[35:6], 6'h0}; // @[L1Cache.scala 84:59]
  wire [5:0] _lrsc_count_dup_for_data_wvalid_T_1 = lrsc_count_dup_for_data_wvalid - 6'h1; // @[MainPipe.scala 1050:72]
  wire  lrsc_valid_dup_for_data_wvalid = lrsc_count_dup_for_data_wvalid > 6'h8; // @[MainPipe.scala 1053:73]
  wire  s3_lrsc_addr_match_dup_for_data_wvalid = lrsc_valid_dup_for_data_wvalid & lrsc_addr_dup_for_data_wvalid ==
    _lrsc_addr_dup_for_data_wvalid_T_1; // @[MainPipe.scala 1054:81]
  wire  s3_sc_fail_dup_for_data_wvalid = s3_sc_dup_for_data_wvalid & ~s3_lrsc_addr_match_dup_for_data_wvalid; // @[MainPipe.scala 1055:68]
  wire  _s3_can_do_amo_write_dup_for_data_wvalid_T_11 = s3_req_cmd_dup_for_data_wvalid == 5'h4 |
    s3_req_cmd_dup_for_data_wvalid == 5'h9 | s3_req_cmd_dup_for_data_wvalid == 5'ha | s3_req_cmd_dup_for_data_wvalid
     == 5'hb; // @[CacheConstants.scala 52:90]
  wire  _s3_can_do_amo_write_dup_for_data_wvalid_T_20 = s3_req_cmd_dup_for_data_wvalid == 5'h8 |
    s3_req_cmd_dup_for_data_wvalid == 5'hc | s3_req_cmd_dup_for_data_wvalid == 5'hd | s3_req_cmd_dup_for_data_wvalid
     == 5'he | s3_req_cmd_dup_for_data_wvalid == 5'hf; // @[CacheConstants.scala 53:114]
  wire  _s3_can_do_amo_write_dup_for_data_wvalid_T_21 = _s3_can_do_amo_write_dup_for_data_wvalid_T_11 |
    _s3_can_do_amo_write_dup_for_data_wvalid_T_20; // @[CacheConstants.scala 54:44]
  wire  _s3_can_do_amo_write_dup_for_data_wvalid_T_22 = s3_req_cmd_dup_for_data_wvalid == 5'h1 |
    s3_req_cmd_dup_for_data_wvalid == 5'h11 | _s3_sc_dup_for_data_wvalid_T_3 |
    _s3_can_do_amo_write_dup_for_data_wvalid_T_21; // @[CacheConstants.scala 57:76]
  wire  _s3_can_do_amo_write_dup_for_data_wvalid_T_24 = ~s3_sc_fail_dup_for_data_wvalid; // @[MainPipe.scala 1056:132]
  wire  s3_can_do_amo_write_dup_for_data_wvalid = s3_can_do_amo_dup_for_data_wvalid &
    _s3_can_do_amo_write_dup_for_data_wvalid_T_22 & ~s3_sc_fail_dup_for_data_wvalid; // @[MainPipe.scala 1056:129]
  wire  update_data_dup_for_data_wvalid = miss_update_meta_dup_for_data_wvalid | s3_store_hit_dup_for_data_wvalid |
    s3_can_do_amo_write_dup_for_data_wvalid; // @[MainPipe.scala 1057:112]
  wire  s3_probe_can_go_dup_for_data_wvalid = s3_req_probe_dup_for_data_wvalid & io_wb_ready_dup_0; // @[MainPipe.scala 1059:80]
  wire  _s3_store_can_go_dup_for_data_wvalid_T_7 = io_data_write_ready_dup_0 | ~update_data_dup_for_data_wvalid; // @[MainPipe.scala 1064:45]
  wire  s3_store_can_go_dup_for_data_wvalid = _store_update_meta_dup_for_data_wvalid_T_2 &
    _s3_store_can_go_dup_for_data_wvalid_T_7; // @[MainPipe.scala 1063:70]
  wire  _s3_amo_can_go_dup_for_data_wvalid_T_5 = s3_amo_hit_dup_for_data_wvalid &
    _s3_store_can_go_dup_for_data_wvalid_T_7; // @[MainPipe.scala 1066:68]
  wire  _s3_amo_can_go_dup_for_data_wvalid_T_7 = s3_s_amoalu_dup_for_data_wvalid | ~
    amo_wait_amoalu_dup_for_data_wvalid; // @[MainPipe.scala 1068:39]
  wire  s3_amo_can_go_dup_for_data_wvalid = _s3_amo_can_go_dup_for_data_wvalid_T_5 &
    _s3_amo_can_go_dup_for_data_wvalid_T_7; // @[MainPipe.scala 1067:83]
  wire  _s3_miss_can_go_dup_for_data_wvalid_T_5 = miss_update_meta_dup_for_data_wvalid &
    _s3_store_can_go_dup_for_data_wvalid_T_7; // @[MainPipe.scala 1070:68]
  wire  _s3_miss_can_go_dup_for_data_wvalid_T_8 = _s3_miss_can_go_dup_for_data_wvalid_T_5 &
    _s3_amo_can_go_dup_for_data_wvalid_T_7; // @[MainPipe.scala 1071:83]
  wire  _s3_miss_can_go_dup_for_data_wvalid_T_9 = _s3_miss_can_go_dup_for_data_wvalid_T_8 & io_tag_write_ready_dup_0; // @[MainPipe.scala 1072:81]
  wire  s3_miss_can_go_dup_for_data_wvalid = _s3_miss_can_go_dup_for_data_wvalid_T_9 & io_wb_ready_dup_0; // @[MainPipe.scala 1073:43]
  wire  _s3_replace_can_go_dup_for_data_wvalid_T_1 = s3_coh_dup_for_data_wvalid_state == 2'h0 | io_wb_ready_dup_0; // @[MainPipe.scala 1076:65]
  wire  s3_replace_can_go_dup_for_data_wvalid = s3_req_replace_dup_for_data_wvalid &
    _s3_replace_can_go_dup_for_data_wvalid_T_1; // @[MainPipe.scala 1075:84]
  wire  _s3_can_go_dup_for_data_wvalid_T = s3_probe_can_go_dup_for_data_wvalid | s3_store_can_go_dup_for_data_wvalid; // @[MainPipe.scala 1077:77]
  wire  _s3_can_go_dup_for_data_wvalid_T_1 = _s3_can_go_dup_for_data_wvalid_T | s3_amo_can_go_dup_for_data_wvalid; // @[MainPipe.scala 1078:42]
  wire  _s3_can_go_dup_for_data_wvalid_T_2 = _s3_can_go_dup_for_data_wvalid_T_1 | s3_miss_can_go_dup_for_data_wvalid; // @[MainPipe.scala 1079:40]
  wire  s3_can_go_dup_for_data_wvalid = _s3_can_go_dup_for_data_wvalid_T_2 | s3_replace_can_go_dup_for_data_wvalid; // @[MainPipe.scala 1080:41]
  wire  s3_update_data_cango_dup_for_data_wvalid = s3_store_can_go_dup_for_data_wvalid |
    s3_amo_can_go_dup_for_data_wvalid | s3_miss_can_go_dup_for_data_wvalid; // @[MainPipe.scala 1082:126]
  wire  s3_fire_dup_for_data_wvalid = s3_valid_dup_for_data_wvalid & s3_can_go_dup_for_data_wvalid; // @[MainPipe.scala 1084:68]
  wire  _GEN_467 = do_amoalu_dup_for_data_wvalid | s3_s_amoalu_dup_for_data_wvalid; // @[MainPipe.scala 1085:41 1024:49 1085:76]
  reg [7:0] s3_banked_store_wmask_dup_for_data_wvalid; // @[Reg.scala 16:16]
  reg [2:0] s3_req_word_idx_dup_for_data_wvalid; // @[Reg.scala 16:16]
  wire [7:0] _banked_wmask_T = 8'h1 << s3_req_word_idx_dup_for_data_wvalid; // @[OneHot.scala 57:35]
  wire [7:0] _banked_wmask_T_1 = s3_can_do_amo_write_dup_for_data_wvalid ? _banked_wmask_T : 8'h0; // @[MainPipe.scala 1096:10]
  wire [7:0] _banked_wmask_T_2 = s3_store_hit_dup_for_data_wvalid ? s3_banked_store_wmask_dup_for_data_wvalid :
    _banked_wmask_T_1; // @[MainPipe.scala 1093:8]
  reg [63:0] s3_req_amo_data_dup_for_data_wvalid; // @[Reg.scala 16:16]
  reg [7:0] s3_req_amo_mask_dup_for_data_wvalid; // @[Reg.scala 16:16]
  wire  _s3_sc_data_merged_dup_for_data_wvalid_0_T_2 = s3_req_word_idx_dup_for_data_wvalid == 3'h0 &
    _s3_can_do_amo_write_dup_for_data_wvalid_T_24; // @[MainPipe.scala 1112:54]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_0_T_3 = _s3_sc_data_merged_dup_for_data_wvalid_0_T_2 ?
    s3_req_amo_mask_dup_for_data_wvalid : 8'h0; // @[MainPipe.scala 1111:10]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_0_full_wmask_T_9 = _s3_sc_data_merged_dup_for_data_wvalid_0_T_3[0]
     ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_0_full_wmask_T_11 = _s3_sc_data_merged_dup_for_data_wvalid_0_T_3[1
    ] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_0_full_wmask_T_13 = _s3_sc_data_merged_dup_for_data_wvalid_0_T_3[2
    ] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_0_full_wmask_T_15 = _s3_sc_data_merged_dup_for_data_wvalid_0_T_3[3
    ] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_0_full_wmask_T_17 = _s3_sc_data_merged_dup_for_data_wvalid_0_T_3[4
    ] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_0_full_wmask_T_19 = _s3_sc_data_merged_dup_for_data_wvalid_0_T_3[5
    ] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_0_full_wmask_T_21 = _s3_sc_data_merged_dup_for_data_wvalid_0_T_3[6
    ] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_0_full_wmask_T_23 = _s3_sc_data_merged_dup_for_data_wvalid_0_T_3[7
    ] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [63:0] s3_sc_data_merged_dup_for_data_wvalid_0_full_wmask = {
    _s3_sc_data_merged_dup_for_data_wvalid_0_full_wmask_T_23,_s3_sc_data_merged_dup_for_data_wvalid_0_full_wmask_T_21,
    _s3_sc_data_merged_dup_for_data_wvalid_0_full_wmask_T_19,_s3_sc_data_merged_dup_for_data_wvalid_0_full_wmask_T_17,
    _s3_sc_data_merged_dup_for_data_wvalid_0_full_wmask_T_15,_s3_sc_data_merged_dup_for_data_wvalid_0_full_wmask_T_13,
    _s3_sc_data_merged_dup_for_data_wvalid_0_full_wmask_T_11,_s3_sc_data_merged_dup_for_data_wvalid_0_full_wmask_T_9}; // @[Cat.scala 31:58]
  wire [63:0] _s3_sc_data_merged_dup_for_data_wvalid_0_T_4 = ~s3_sc_data_merged_dup_for_data_wvalid_0_full_wmask; // @[MainPipe.scala 419:7]
  wire [63:0] _s3_sc_data_merged_dup_for_data_wvalid_0_T_5 = _s3_sc_data_merged_dup_for_data_wvalid_0_T_4 &
    s3_store_data_merged_0; // @[MainPipe.scala 419:19]
  wire [63:0] _s3_sc_data_merged_dup_for_data_wvalid_0_T_6 = s3_sc_data_merged_dup_for_data_wvalid_0_full_wmask &
    s3_req_amo_data_dup_for_data_wvalid; // @[MainPipe.scala 419:45]
  wire [63:0] s3_sc_data_merged_dup_for_data_wvalid_0 = _s3_sc_data_merged_dup_for_data_wvalid_0_T_5 |
    _s3_sc_data_merged_dup_for_data_wvalid_0_T_6; // @[MainPipe.scala 419:31]
  wire  _s3_sc_data_merged_dup_for_data_wvalid_1_T_2 = s3_req_word_idx_dup_for_data_wvalid == 3'h1 &
    _s3_can_do_amo_write_dup_for_data_wvalid_T_24; // @[MainPipe.scala 1112:54]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_1_T_3 = _s3_sc_data_merged_dup_for_data_wvalid_1_T_2 ?
    s3_req_amo_mask_dup_for_data_wvalid : 8'h0; // @[MainPipe.scala 1111:10]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_1_full_wmask_T_9 = _s3_sc_data_merged_dup_for_data_wvalid_1_T_3[0]
     ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_1_full_wmask_T_11 = _s3_sc_data_merged_dup_for_data_wvalid_1_T_3[1
    ] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_1_full_wmask_T_13 = _s3_sc_data_merged_dup_for_data_wvalid_1_T_3[2
    ] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_1_full_wmask_T_15 = _s3_sc_data_merged_dup_for_data_wvalid_1_T_3[3
    ] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_1_full_wmask_T_17 = _s3_sc_data_merged_dup_for_data_wvalid_1_T_3[4
    ] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_1_full_wmask_T_19 = _s3_sc_data_merged_dup_for_data_wvalid_1_T_3[5
    ] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_1_full_wmask_T_21 = _s3_sc_data_merged_dup_for_data_wvalid_1_T_3[6
    ] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_1_full_wmask_T_23 = _s3_sc_data_merged_dup_for_data_wvalid_1_T_3[7
    ] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [63:0] s3_sc_data_merged_dup_for_data_wvalid_1_full_wmask = {
    _s3_sc_data_merged_dup_for_data_wvalid_1_full_wmask_T_23,_s3_sc_data_merged_dup_for_data_wvalid_1_full_wmask_T_21,
    _s3_sc_data_merged_dup_for_data_wvalid_1_full_wmask_T_19,_s3_sc_data_merged_dup_for_data_wvalid_1_full_wmask_T_17,
    _s3_sc_data_merged_dup_for_data_wvalid_1_full_wmask_T_15,_s3_sc_data_merged_dup_for_data_wvalid_1_full_wmask_T_13,
    _s3_sc_data_merged_dup_for_data_wvalid_1_full_wmask_T_11,_s3_sc_data_merged_dup_for_data_wvalid_1_full_wmask_T_9}; // @[Cat.scala 31:58]
  wire [63:0] _s3_sc_data_merged_dup_for_data_wvalid_1_T_4 = ~s3_sc_data_merged_dup_for_data_wvalid_1_full_wmask; // @[MainPipe.scala 419:7]
  wire [63:0] _s3_sc_data_merged_dup_for_data_wvalid_1_T_5 = _s3_sc_data_merged_dup_for_data_wvalid_1_T_4 &
    s3_store_data_merged_1; // @[MainPipe.scala 419:19]
  wire [63:0] _s3_sc_data_merged_dup_for_data_wvalid_1_T_6 = s3_sc_data_merged_dup_for_data_wvalid_1_full_wmask &
    s3_req_amo_data_dup_for_data_wvalid; // @[MainPipe.scala 419:45]
  wire [63:0] s3_sc_data_merged_dup_for_data_wvalid_1 = _s3_sc_data_merged_dup_for_data_wvalid_1_T_5 |
    _s3_sc_data_merged_dup_for_data_wvalid_1_T_6; // @[MainPipe.scala 419:31]
  wire  _s3_sc_data_merged_dup_for_data_wvalid_2_T_2 = s3_req_word_idx_dup_for_data_wvalid == 3'h2 &
    _s3_can_do_amo_write_dup_for_data_wvalid_T_24; // @[MainPipe.scala 1112:54]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_2_T_3 = _s3_sc_data_merged_dup_for_data_wvalid_2_T_2 ?
    s3_req_amo_mask_dup_for_data_wvalid : 8'h0; // @[MainPipe.scala 1111:10]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_2_full_wmask_T_9 = _s3_sc_data_merged_dup_for_data_wvalid_2_T_3[0]
     ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_2_full_wmask_T_11 = _s3_sc_data_merged_dup_for_data_wvalid_2_T_3[1
    ] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_2_full_wmask_T_13 = _s3_sc_data_merged_dup_for_data_wvalid_2_T_3[2
    ] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_2_full_wmask_T_15 = _s3_sc_data_merged_dup_for_data_wvalid_2_T_3[3
    ] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_2_full_wmask_T_17 = _s3_sc_data_merged_dup_for_data_wvalid_2_T_3[4
    ] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_2_full_wmask_T_19 = _s3_sc_data_merged_dup_for_data_wvalid_2_T_3[5
    ] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_2_full_wmask_T_21 = _s3_sc_data_merged_dup_for_data_wvalid_2_T_3[6
    ] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_2_full_wmask_T_23 = _s3_sc_data_merged_dup_for_data_wvalid_2_T_3[7
    ] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [63:0] s3_sc_data_merged_dup_for_data_wvalid_2_full_wmask = {
    _s3_sc_data_merged_dup_for_data_wvalid_2_full_wmask_T_23,_s3_sc_data_merged_dup_for_data_wvalid_2_full_wmask_T_21,
    _s3_sc_data_merged_dup_for_data_wvalid_2_full_wmask_T_19,_s3_sc_data_merged_dup_for_data_wvalid_2_full_wmask_T_17,
    _s3_sc_data_merged_dup_for_data_wvalid_2_full_wmask_T_15,_s3_sc_data_merged_dup_for_data_wvalid_2_full_wmask_T_13,
    _s3_sc_data_merged_dup_for_data_wvalid_2_full_wmask_T_11,_s3_sc_data_merged_dup_for_data_wvalid_2_full_wmask_T_9}; // @[Cat.scala 31:58]
  wire [63:0] _s3_sc_data_merged_dup_for_data_wvalid_2_T_4 = ~s3_sc_data_merged_dup_for_data_wvalid_2_full_wmask; // @[MainPipe.scala 419:7]
  wire [63:0] _s3_sc_data_merged_dup_for_data_wvalid_2_T_5 = _s3_sc_data_merged_dup_for_data_wvalid_2_T_4 &
    s3_store_data_merged_2; // @[MainPipe.scala 419:19]
  wire [63:0] _s3_sc_data_merged_dup_for_data_wvalid_2_T_6 = s3_sc_data_merged_dup_for_data_wvalid_2_full_wmask &
    s3_req_amo_data_dup_for_data_wvalid; // @[MainPipe.scala 419:45]
  wire [63:0] s3_sc_data_merged_dup_for_data_wvalid_2 = _s3_sc_data_merged_dup_for_data_wvalid_2_T_5 |
    _s3_sc_data_merged_dup_for_data_wvalid_2_T_6; // @[MainPipe.scala 419:31]
  wire  _s3_sc_data_merged_dup_for_data_wvalid_3_T_2 = s3_req_word_idx_dup_for_data_wvalid == 3'h3 &
    _s3_can_do_amo_write_dup_for_data_wvalid_T_24; // @[MainPipe.scala 1112:54]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_3_T_3 = _s3_sc_data_merged_dup_for_data_wvalid_3_T_2 ?
    s3_req_amo_mask_dup_for_data_wvalid : 8'h0; // @[MainPipe.scala 1111:10]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_3_full_wmask_T_9 = _s3_sc_data_merged_dup_for_data_wvalid_3_T_3[0]
     ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_3_full_wmask_T_11 = _s3_sc_data_merged_dup_for_data_wvalid_3_T_3[1
    ] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_3_full_wmask_T_13 = _s3_sc_data_merged_dup_for_data_wvalid_3_T_3[2
    ] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_3_full_wmask_T_15 = _s3_sc_data_merged_dup_for_data_wvalid_3_T_3[3
    ] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_3_full_wmask_T_17 = _s3_sc_data_merged_dup_for_data_wvalid_3_T_3[4
    ] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_3_full_wmask_T_19 = _s3_sc_data_merged_dup_for_data_wvalid_3_T_3[5
    ] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_3_full_wmask_T_21 = _s3_sc_data_merged_dup_for_data_wvalid_3_T_3[6
    ] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_3_full_wmask_T_23 = _s3_sc_data_merged_dup_for_data_wvalid_3_T_3[7
    ] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [63:0] s3_sc_data_merged_dup_for_data_wvalid_3_full_wmask = {
    _s3_sc_data_merged_dup_for_data_wvalid_3_full_wmask_T_23,_s3_sc_data_merged_dup_for_data_wvalid_3_full_wmask_T_21,
    _s3_sc_data_merged_dup_for_data_wvalid_3_full_wmask_T_19,_s3_sc_data_merged_dup_for_data_wvalid_3_full_wmask_T_17,
    _s3_sc_data_merged_dup_for_data_wvalid_3_full_wmask_T_15,_s3_sc_data_merged_dup_for_data_wvalid_3_full_wmask_T_13,
    _s3_sc_data_merged_dup_for_data_wvalid_3_full_wmask_T_11,_s3_sc_data_merged_dup_for_data_wvalid_3_full_wmask_T_9}; // @[Cat.scala 31:58]
  wire [63:0] _s3_sc_data_merged_dup_for_data_wvalid_3_T_4 = ~s3_sc_data_merged_dup_for_data_wvalid_3_full_wmask; // @[MainPipe.scala 419:7]
  wire [63:0] _s3_sc_data_merged_dup_for_data_wvalid_3_T_5 = _s3_sc_data_merged_dup_for_data_wvalid_3_T_4 &
    s3_store_data_merged_3; // @[MainPipe.scala 419:19]
  wire [63:0] _s3_sc_data_merged_dup_for_data_wvalid_3_T_6 = s3_sc_data_merged_dup_for_data_wvalid_3_full_wmask &
    s3_req_amo_data_dup_for_data_wvalid; // @[MainPipe.scala 419:45]
  wire [63:0] s3_sc_data_merged_dup_for_data_wvalid_3 = _s3_sc_data_merged_dup_for_data_wvalid_3_T_5 |
    _s3_sc_data_merged_dup_for_data_wvalid_3_T_6; // @[MainPipe.scala 419:31]
  wire  _s3_sc_data_merged_dup_for_data_wvalid_4_T_2 = s3_req_word_idx_dup_for_data_wvalid == 3'h4 &
    _s3_can_do_amo_write_dup_for_data_wvalid_T_24; // @[MainPipe.scala 1112:54]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_4_T_3 = _s3_sc_data_merged_dup_for_data_wvalid_4_T_2 ?
    s3_req_amo_mask_dup_for_data_wvalid : 8'h0; // @[MainPipe.scala 1111:10]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_4_full_wmask_T_9 = _s3_sc_data_merged_dup_for_data_wvalid_4_T_3[0]
     ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_4_full_wmask_T_11 = _s3_sc_data_merged_dup_for_data_wvalid_4_T_3[1
    ] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_4_full_wmask_T_13 = _s3_sc_data_merged_dup_for_data_wvalid_4_T_3[2
    ] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_4_full_wmask_T_15 = _s3_sc_data_merged_dup_for_data_wvalid_4_T_3[3
    ] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_4_full_wmask_T_17 = _s3_sc_data_merged_dup_for_data_wvalid_4_T_3[4
    ] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_4_full_wmask_T_19 = _s3_sc_data_merged_dup_for_data_wvalid_4_T_3[5
    ] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_4_full_wmask_T_21 = _s3_sc_data_merged_dup_for_data_wvalid_4_T_3[6
    ] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_4_full_wmask_T_23 = _s3_sc_data_merged_dup_for_data_wvalid_4_T_3[7
    ] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [63:0] s3_sc_data_merged_dup_for_data_wvalid_4_full_wmask = {
    _s3_sc_data_merged_dup_for_data_wvalid_4_full_wmask_T_23,_s3_sc_data_merged_dup_for_data_wvalid_4_full_wmask_T_21,
    _s3_sc_data_merged_dup_for_data_wvalid_4_full_wmask_T_19,_s3_sc_data_merged_dup_for_data_wvalid_4_full_wmask_T_17,
    _s3_sc_data_merged_dup_for_data_wvalid_4_full_wmask_T_15,_s3_sc_data_merged_dup_for_data_wvalid_4_full_wmask_T_13,
    _s3_sc_data_merged_dup_for_data_wvalid_4_full_wmask_T_11,_s3_sc_data_merged_dup_for_data_wvalid_4_full_wmask_T_9}; // @[Cat.scala 31:58]
  wire [63:0] _s3_sc_data_merged_dup_for_data_wvalid_4_T_4 = ~s3_sc_data_merged_dup_for_data_wvalid_4_full_wmask; // @[MainPipe.scala 419:7]
  wire [63:0] _s3_sc_data_merged_dup_for_data_wvalid_4_T_5 = _s3_sc_data_merged_dup_for_data_wvalid_4_T_4 &
    s3_store_data_merged_4; // @[MainPipe.scala 419:19]
  wire [63:0] _s3_sc_data_merged_dup_for_data_wvalid_4_T_6 = s3_sc_data_merged_dup_for_data_wvalid_4_full_wmask &
    s3_req_amo_data_dup_for_data_wvalid; // @[MainPipe.scala 419:45]
  wire [63:0] s3_sc_data_merged_dup_for_data_wvalid_4 = _s3_sc_data_merged_dup_for_data_wvalid_4_T_5 |
    _s3_sc_data_merged_dup_for_data_wvalid_4_T_6; // @[MainPipe.scala 419:31]
  wire  _s3_sc_data_merged_dup_for_data_wvalid_5_T_2 = s3_req_word_idx_dup_for_data_wvalid == 3'h5 &
    _s3_can_do_amo_write_dup_for_data_wvalid_T_24; // @[MainPipe.scala 1112:54]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_5_T_3 = _s3_sc_data_merged_dup_for_data_wvalid_5_T_2 ?
    s3_req_amo_mask_dup_for_data_wvalid : 8'h0; // @[MainPipe.scala 1111:10]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_5_full_wmask_T_9 = _s3_sc_data_merged_dup_for_data_wvalid_5_T_3[0]
     ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_5_full_wmask_T_11 = _s3_sc_data_merged_dup_for_data_wvalid_5_T_3[1
    ] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_5_full_wmask_T_13 = _s3_sc_data_merged_dup_for_data_wvalid_5_T_3[2
    ] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_5_full_wmask_T_15 = _s3_sc_data_merged_dup_for_data_wvalid_5_T_3[3
    ] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_5_full_wmask_T_17 = _s3_sc_data_merged_dup_for_data_wvalid_5_T_3[4
    ] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_5_full_wmask_T_19 = _s3_sc_data_merged_dup_for_data_wvalid_5_T_3[5
    ] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_5_full_wmask_T_21 = _s3_sc_data_merged_dup_for_data_wvalid_5_T_3[6
    ] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_5_full_wmask_T_23 = _s3_sc_data_merged_dup_for_data_wvalid_5_T_3[7
    ] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [63:0] s3_sc_data_merged_dup_for_data_wvalid_5_full_wmask = {
    _s3_sc_data_merged_dup_for_data_wvalid_5_full_wmask_T_23,_s3_sc_data_merged_dup_for_data_wvalid_5_full_wmask_T_21,
    _s3_sc_data_merged_dup_for_data_wvalid_5_full_wmask_T_19,_s3_sc_data_merged_dup_for_data_wvalid_5_full_wmask_T_17,
    _s3_sc_data_merged_dup_for_data_wvalid_5_full_wmask_T_15,_s3_sc_data_merged_dup_for_data_wvalid_5_full_wmask_T_13,
    _s3_sc_data_merged_dup_for_data_wvalid_5_full_wmask_T_11,_s3_sc_data_merged_dup_for_data_wvalid_5_full_wmask_T_9}; // @[Cat.scala 31:58]
  wire [63:0] _s3_sc_data_merged_dup_for_data_wvalid_5_T_4 = ~s3_sc_data_merged_dup_for_data_wvalid_5_full_wmask; // @[MainPipe.scala 419:7]
  wire [63:0] _s3_sc_data_merged_dup_for_data_wvalid_5_T_5 = _s3_sc_data_merged_dup_for_data_wvalid_5_T_4 &
    s3_store_data_merged_5; // @[MainPipe.scala 419:19]
  wire [63:0] _s3_sc_data_merged_dup_for_data_wvalid_5_T_6 = s3_sc_data_merged_dup_for_data_wvalid_5_full_wmask &
    s3_req_amo_data_dup_for_data_wvalid; // @[MainPipe.scala 419:45]
  wire [63:0] s3_sc_data_merged_dup_for_data_wvalid_5 = _s3_sc_data_merged_dup_for_data_wvalid_5_T_5 |
    _s3_sc_data_merged_dup_for_data_wvalid_5_T_6; // @[MainPipe.scala 419:31]
  wire  _s3_sc_data_merged_dup_for_data_wvalid_6_T_2 = s3_req_word_idx_dup_for_data_wvalid == 3'h6 &
    _s3_can_do_amo_write_dup_for_data_wvalid_T_24; // @[MainPipe.scala 1112:54]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_6_T_3 = _s3_sc_data_merged_dup_for_data_wvalid_6_T_2 ?
    s3_req_amo_mask_dup_for_data_wvalid : 8'h0; // @[MainPipe.scala 1111:10]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_6_full_wmask_T_9 = _s3_sc_data_merged_dup_for_data_wvalid_6_T_3[0]
     ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_6_full_wmask_T_11 = _s3_sc_data_merged_dup_for_data_wvalid_6_T_3[1
    ] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_6_full_wmask_T_13 = _s3_sc_data_merged_dup_for_data_wvalid_6_T_3[2
    ] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_6_full_wmask_T_15 = _s3_sc_data_merged_dup_for_data_wvalid_6_T_3[3
    ] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_6_full_wmask_T_17 = _s3_sc_data_merged_dup_for_data_wvalid_6_T_3[4
    ] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_6_full_wmask_T_19 = _s3_sc_data_merged_dup_for_data_wvalid_6_T_3[5
    ] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_6_full_wmask_T_21 = _s3_sc_data_merged_dup_for_data_wvalid_6_T_3[6
    ] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_6_full_wmask_T_23 = _s3_sc_data_merged_dup_for_data_wvalid_6_T_3[7
    ] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [63:0] s3_sc_data_merged_dup_for_data_wvalid_6_full_wmask = {
    _s3_sc_data_merged_dup_for_data_wvalid_6_full_wmask_T_23,_s3_sc_data_merged_dup_for_data_wvalid_6_full_wmask_T_21,
    _s3_sc_data_merged_dup_for_data_wvalid_6_full_wmask_T_19,_s3_sc_data_merged_dup_for_data_wvalid_6_full_wmask_T_17,
    _s3_sc_data_merged_dup_for_data_wvalid_6_full_wmask_T_15,_s3_sc_data_merged_dup_for_data_wvalid_6_full_wmask_T_13,
    _s3_sc_data_merged_dup_for_data_wvalid_6_full_wmask_T_11,_s3_sc_data_merged_dup_for_data_wvalid_6_full_wmask_T_9}; // @[Cat.scala 31:58]
  wire [63:0] _s3_sc_data_merged_dup_for_data_wvalid_6_T_4 = ~s3_sc_data_merged_dup_for_data_wvalid_6_full_wmask; // @[MainPipe.scala 419:7]
  wire [63:0] _s3_sc_data_merged_dup_for_data_wvalid_6_T_5 = _s3_sc_data_merged_dup_for_data_wvalid_6_T_4 &
    s3_store_data_merged_6; // @[MainPipe.scala 419:19]
  wire [63:0] _s3_sc_data_merged_dup_for_data_wvalid_6_T_6 = s3_sc_data_merged_dup_for_data_wvalid_6_full_wmask &
    s3_req_amo_data_dup_for_data_wvalid; // @[MainPipe.scala 419:45]
  wire [63:0] s3_sc_data_merged_dup_for_data_wvalid_6 = _s3_sc_data_merged_dup_for_data_wvalid_6_T_5 |
    _s3_sc_data_merged_dup_for_data_wvalid_6_T_6; // @[MainPipe.scala 419:31]
  wire  _s3_sc_data_merged_dup_for_data_wvalid_7_T_2 = s3_req_word_idx_dup_for_data_wvalid == 3'h7 &
    _s3_can_do_amo_write_dup_for_data_wvalid_T_24; // @[MainPipe.scala 1112:54]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_7_T_3 = _s3_sc_data_merged_dup_for_data_wvalid_7_T_2 ?
    s3_req_amo_mask_dup_for_data_wvalid : 8'h0; // @[MainPipe.scala 1111:10]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_7_full_wmask_T_9 = _s3_sc_data_merged_dup_for_data_wvalid_7_T_3[0]
     ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_7_full_wmask_T_11 = _s3_sc_data_merged_dup_for_data_wvalid_7_T_3[1
    ] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_7_full_wmask_T_13 = _s3_sc_data_merged_dup_for_data_wvalid_7_T_3[2
    ] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_7_full_wmask_T_15 = _s3_sc_data_merged_dup_for_data_wvalid_7_T_3[3
    ] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_7_full_wmask_T_17 = _s3_sc_data_merged_dup_for_data_wvalid_7_T_3[4
    ] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_7_full_wmask_T_19 = _s3_sc_data_merged_dup_for_data_wvalid_7_T_3[5
    ] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_7_full_wmask_T_21 = _s3_sc_data_merged_dup_for_data_wvalid_7_T_3[6
    ] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _s3_sc_data_merged_dup_for_data_wvalid_7_full_wmask_T_23 = _s3_sc_data_merged_dup_for_data_wvalid_7_T_3[7
    ] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [63:0] s3_sc_data_merged_dup_for_data_wvalid_7_full_wmask = {
    _s3_sc_data_merged_dup_for_data_wvalid_7_full_wmask_T_23,_s3_sc_data_merged_dup_for_data_wvalid_7_full_wmask_T_21,
    _s3_sc_data_merged_dup_for_data_wvalid_7_full_wmask_T_19,_s3_sc_data_merged_dup_for_data_wvalid_7_full_wmask_T_17,
    _s3_sc_data_merged_dup_for_data_wvalid_7_full_wmask_T_15,_s3_sc_data_merged_dup_for_data_wvalid_7_full_wmask_T_13,
    _s3_sc_data_merged_dup_for_data_wvalid_7_full_wmask_T_11,_s3_sc_data_merged_dup_for_data_wvalid_7_full_wmask_T_9}; // @[Cat.scala 31:58]
  wire [63:0] _s3_sc_data_merged_dup_for_data_wvalid_7_T_4 = ~s3_sc_data_merged_dup_for_data_wvalid_7_full_wmask; // @[MainPipe.scala 419:7]
  wire [63:0] _s3_sc_data_merged_dup_for_data_wvalid_7_T_5 = _s3_sc_data_merged_dup_for_data_wvalid_7_T_4 &
    s3_store_data_merged_7; // @[MainPipe.scala 419:19]
  wire [63:0] _s3_sc_data_merged_dup_for_data_wvalid_7_T_6 = s3_sc_data_merged_dup_for_data_wvalid_7_full_wmask &
    s3_req_amo_data_dup_for_data_wvalid; // @[MainPipe.scala 419:45]
  wire [63:0] s3_sc_data_merged_dup_for_data_wvalid_7 = _s3_sc_data_merged_dup_for_data_wvalid_7_T_5 |
    _s3_sc_data_merged_dup_for_data_wvalid_7_T_6; // @[MainPipe.scala 419:31]
  wire  _GEN_473 = s3_fire_dup_for_data_wvalid ? 1'h0 : s3_valid_dup_for_data_wvalid; // @[MainPipe.scala 1120:44 1022:46 1120:76]
  reg  s3_valid_dup_for_data_wbank_0; // @[MainPipe.scala 1122:45]
  reg  s3_valid_dup_for_data_wbank_1; // @[MainPipe.scala 1122:45]
  reg  s3_valid_dup_for_data_wbank_2; // @[MainPipe.scala 1122:45]
  reg  s3_valid_dup_for_data_wbank_3; // @[MainPipe.scala 1122:45]
  reg  s3_valid_dup_for_data_wbank_4; // @[MainPipe.scala 1122:45]
  reg  s3_valid_dup_for_data_wbank_5; // @[MainPipe.scala 1122:45]
  reg  s3_valid_dup_for_data_wbank_6; // @[MainPipe.scala 1122:45]
  reg  s3_valid_dup_for_data_wbank_7; // @[MainPipe.scala 1122:45]
  reg  s3_req_miss_dup_for_data_wbank; // @[Reg.scala 16:16]
  reg  s3_req_probe_dup_for_data_wbank; // @[Reg.scala 16:16]
  reg [1:0] s3_coh_dup_for_data_wbank_state; // @[Reg.scala 16:16]
  reg [3:0] s3_req_source_dup_for_data_wbank; // @[Reg.scala 16:16]
  reg [4:0] s3_req_cmd_dup_for_data_wbank; // @[Reg.scala 16:16]
  reg  s3_req_replace_dup_for_data_wbank; // @[Reg.scala 16:16]
  wire  _store_update_meta_dup_for_data_wbank_T_1 = ~s3_req_probe_dup_for_data_wbank; // @[MainPipe.scala 1142:7]
  wire  _store_update_meta_dup_for_data_wbank_T_2 = s3_req_source_dup_for_data_wbank == 4'h1 &
    _store_update_meta_dup_for_data_wbank_T_1; // @[MainPipe.scala 1141:102]
  wire  _amo_update_meta_dup_for_data_wbank_T = s3_req_source_dup_for_data_wbank == 4'h2; // @[MainPipe.scala 1144:81]
  reg  s3_amo_hit_dup_for_data_wbank; // @[Reg.scala 16:16]
  reg  s3_s_amoalu_dup_for_data_wbank; // @[MainPipe.scala 1155:50]
  wire  _amo_wait_amoalu_dup_for_data_wbank_T_1 = s3_req_cmd_dup_for_data_wbank != 5'h6; // @[MainPipe.scala 1157:38]
  wire  _amo_wait_amoalu_dup_for_data_wbank_T_2 = _amo_update_meta_dup_for_data_wbank_T &
    _amo_wait_amoalu_dup_for_data_wbank_T_1; // @[MainPipe.scala 1156:98]
  wire  _amo_wait_amoalu_dup_for_data_wbank_T_3 = s3_req_cmd_dup_for_data_wbank != 5'h7; // @[MainPipe.scala 1158:38]
  wire  amo_wait_amoalu_dup_for_data_wbank = _amo_wait_amoalu_dup_for_data_wbank_T_2 &
    _amo_wait_amoalu_dup_for_data_wbank_T_3; // @[MainPipe.scala 1157:48]
  wire  do_amoalu_dup_for_data_wbank = amo_wait_amoalu_dup_for_data_wbank & s3_valid_dup_for_data_wbank_0 & ~
    s3_s_amoalu_dup_for_data_wbank; // @[MainPipe.scala 1159:112]
  reg  s3_store_hit_dup_for_data_wbank; // @[Reg.scala 16:16]
  reg [35:0] s3_req_addr_dup_for_data_wbank; // @[Reg.scala 16:16]
  wire  s3_can_do_amo_dup_for_data_wbank = s3_req_miss_dup_for_data_wbank & _store_update_meta_dup_for_data_wbank_T_1
     & _amo_update_meta_dup_for_data_wbank_T | s3_amo_hit_dup_for_data_wbank; // @[MainPipe.scala 1163:170]
  wire  _s3_lr_dup_for_data_wbank_T_2 = _store_update_meta_dup_for_data_wbank_T_1 &
    _amo_update_meta_dup_for_data_wbank_T; // @[MainPipe.scala 1166:71]
  wire  s3_lr_dup_for_data_wbank = _store_update_meta_dup_for_data_wbank_T_1 & _amo_update_meta_dup_for_data_wbank_T
     & s3_req_cmd_dup_for_data_wbank == 5'h6; // @[MainPipe.scala 1166:125]
  wire  _s3_sc_dup_for_data_wbank_T_3 = s3_req_cmd_dup_for_data_wbank == 5'h7; // @[MainPipe.scala 1167:159]
  wire  s3_sc_dup_for_data_wbank = _s3_lr_dup_for_data_wbank_T_2 & s3_req_cmd_dup_for_data_wbank == 5'h7; // @[MainPipe.scala 1167:125]
  reg [35:0] lrsc_addr_dup_for_data_wbank; // @[MainPipe.scala 1168:44]
  reg [5:0] lrsc_count_dup_for_data_wbank; // @[MainPipe.scala 1169:49]
  wire [35:0] _lrsc_addr_dup_for_data_wbank_T_1 = {s3_req_addr_dup_for_data_wbank[35:6], 6'h0}; // @[L1Cache.scala 84:59]
  wire [5:0] _lrsc_count_dup_for_data_wbank_T_1 = lrsc_count_dup_for_data_wbank - 6'h1; // @[MainPipe.scala 1181:72]
  wire  lrsc_valid_dup_for_data_wbank = lrsc_count_dup_for_data_wbank > 6'h8; // @[MainPipe.scala 1184:73]
  wire  s3_lrsc_addr_match_dup_for_data_wbank = lrsc_valid_dup_for_data_wbank & lrsc_addr_dup_for_data_wbank ==
    _lrsc_addr_dup_for_data_wbank_T_1; // @[MainPipe.scala 1185:81]
  wire  s3_sc_fail_dup_for_data_wbank = s3_sc_dup_for_data_wbank & ~s3_lrsc_addr_match_dup_for_data_wbank; // @[MainPipe.scala 1186:68]
  wire  _s3_can_do_amo_write_dup_for_data_wbank_T_11 = s3_req_cmd_dup_for_data_wbank == 5'h4 |
    s3_req_cmd_dup_for_data_wbank == 5'h9 | s3_req_cmd_dup_for_data_wbank == 5'ha | s3_req_cmd_dup_for_data_wbank == 5'hb
    ; // @[CacheConstants.scala 52:90]
  wire  _s3_can_do_amo_write_dup_for_data_wbank_T_20 = s3_req_cmd_dup_for_data_wbank == 5'h8 |
    s3_req_cmd_dup_for_data_wbank == 5'hc | s3_req_cmd_dup_for_data_wbank == 5'hd | s3_req_cmd_dup_for_data_wbank == 5'he
     | s3_req_cmd_dup_for_data_wbank == 5'hf; // @[CacheConstants.scala 53:114]
  wire  _s3_can_do_amo_write_dup_for_data_wbank_T_21 = _s3_can_do_amo_write_dup_for_data_wbank_T_11 |
    _s3_can_do_amo_write_dup_for_data_wbank_T_20; // @[CacheConstants.scala 54:44]
  wire  _s3_can_do_amo_write_dup_for_data_wbank_T_22 = s3_req_cmd_dup_for_data_wbank == 5'h1 |
    s3_req_cmd_dup_for_data_wbank == 5'h11 | _s3_sc_dup_for_data_wbank_T_3 |
    _s3_can_do_amo_write_dup_for_data_wbank_T_21; // @[CacheConstants.scala 57:76]
  wire  s3_can_do_amo_write_dup_for_data_wbank = s3_can_do_amo_dup_for_data_wbank &
    _s3_can_do_amo_write_dup_for_data_wbank_T_22 & ~s3_sc_fail_dup_for_data_wbank; // @[MainPipe.scala 1187:128]
  wire  update_data_dup_for_data_wbank = s3_req_miss_dup_for_data_wbank | s3_store_hit_dup_for_data_wbank |
    s3_can_do_amo_write_dup_for_data_wbank; // @[MainPipe.scala 1188:111]
  wire  s3_probe_can_go_dup_for_data_wbank = s3_req_probe_dup_for_data_wbank & io_wb_ready_dup_0; // @[MainPipe.scala 1190:80]
  wire  _s3_store_can_go_dup_for_data_wbank_T_7 = io_data_write_ready_dup_0 | ~update_data_dup_for_data_wbank; // @[MainPipe.scala 1195:48]
  wire  s3_store_can_go_dup_for_data_wbank = _store_update_meta_dup_for_data_wbank_T_2 &
    _s3_store_can_go_dup_for_data_wbank_T_7; // @[MainPipe.scala 1194:71]
  wire  _s3_amo_can_go_dup_for_data_wbank_T_5 = s3_amo_hit_dup_for_data_wbank &
    _s3_store_can_go_dup_for_data_wbank_T_7; // @[MainPipe.scala 1197:69]
  wire  _s3_amo_can_go_dup_for_data_wbank_T_7 = s3_s_amoalu_dup_for_data_wbank | ~amo_wait_amoalu_dup_for_data_wbank; // @[MainPipe.scala 1199:40]
  wire  s3_amo_can_go_dup_for_data_wbank = _s3_amo_can_go_dup_for_data_wbank_T_5 &
    _s3_amo_can_go_dup_for_data_wbank_T_7; // @[MainPipe.scala 1198:85]
  wire  _s3_miss_can_go_dup_for_data_wbank_T_5 = s3_req_miss_dup_for_data_wbank &
    _s3_store_can_go_dup_for_data_wbank_T_7; // @[MainPipe.scala 1201:69]
  wire  _s3_miss_can_go_dup_for_data_wbank_T_8 = _s3_miss_can_go_dup_for_data_wbank_T_5 &
    _s3_amo_can_go_dup_for_data_wbank_T_7; // @[MainPipe.scala 1202:85]
  wire  _s3_miss_can_go_dup_for_data_wbank_T_9 = _s3_miss_can_go_dup_for_data_wbank_T_8 & io_tag_write_ready_dup_0; // @[MainPipe.scala 1203:81]
  wire  s3_miss_can_go_dup_for_data_wbank = _s3_miss_can_go_dup_for_data_wbank_T_9 & io_wb_ready_dup_0; // @[MainPipe.scala 1204:46]
  wire  _s3_replace_can_go_dup_for_data_wbank_T_1 = s3_coh_dup_for_data_wbank_state == 2'h0 | io_wb_ready_dup_0; // @[MainPipe.scala 1207:66]
  wire  s3_replace_can_go_dup_for_data_wbank = s3_req_replace_dup_for_data_wbank &
    _s3_replace_can_go_dup_for_data_wbank_T_1; // @[MainPipe.scala 1206:84]
  wire  _s3_can_go_dup_for_data_wbank_T = s3_probe_can_go_dup_for_data_wbank | s3_store_can_go_dup_for_data_wbank; // @[MainPipe.scala 1208:77]
  wire  _s3_can_go_dup_for_data_wbank_T_1 = _s3_can_go_dup_for_data_wbank_T | s3_amo_can_go_dup_for_data_wbank; // @[MainPipe.scala 1209:43]
  wire  _s3_can_go_dup_for_data_wbank_T_2 = _s3_can_go_dup_for_data_wbank_T_1 | s3_miss_can_go_dup_for_data_wbank; // @[MainPipe.scala 1210:41]
  wire  s3_can_go_dup_for_data_wbank = _s3_can_go_dup_for_data_wbank_T_2 | s3_replace_can_go_dup_for_data_wbank; // @[MainPipe.scala 1211:42]
  wire  s3_update_data_cango_dup_for_data_wbank = s3_store_can_go_dup_for_data_wbank |
    s3_amo_can_go_dup_for_data_wbank | s3_miss_can_go_dup_for_data_wbank; // @[MainPipe.scala 1213:125]
  wire  s3_fire_dup_for_data_wbank = s3_valid_dup_for_data_wbank_0 & s3_can_go_dup_for_data_wbank; // @[MainPipe.scala 1215:71]
  wire  _GEN_494 = do_amoalu_dup_for_data_wbank | s3_s_amoalu_dup_for_data_wbank; // @[MainPipe.scala 1217:42 1155:50 1217:76]
  wire  _GEN_496 = s3_fire_dup_for_data_wbank ? 1'h0 : s3_valid_dup_for_data_wbank_0; // @[MainPipe.scala 1122:45 1221:{45,79}]
  reg [7:0] io_data_write_dup_0_bits_way_en_r; // @[Reg.scala 16:16]
  reg [38:0] io_data_write_dup_0_bits_addr_r; // @[Reg.scala 16:16]
  reg  s3_req_miss_dup_for_data_wbank_1; // @[Reg.scala 16:16]
  reg  s3_req_probe_dup_for_data_wbank_1; // @[Reg.scala 16:16]
  reg [1:0] s3_coh_dup_for_data_wbank_1_state; // @[Reg.scala 16:16]
  reg [3:0] s3_req_source_dup_for_data_wbank_1; // @[Reg.scala 16:16]
  reg [4:0] s3_req_cmd_dup_for_data_wbank_1; // @[Reg.scala 16:16]
  reg  s3_req_replace_dup_for_data_wbank_1; // @[Reg.scala 16:16]
  wire  _store_update_meta_dup_for_data_wbank_T_6 = ~s3_req_probe_dup_for_data_wbank_1; // @[MainPipe.scala 1142:7]
  wire  _store_update_meta_dup_for_data_wbank_T_7 = s3_req_source_dup_for_data_wbank_1 == 4'h1 &
    _store_update_meta_dup_for_data_wbank_T_6; // @[MainPipe.scala 1141:102]
  wire  _amo_update_meta_dup_for_data_wbank_T_5 = s3_req_source_dup_for_data_wbank_1 == 4'h2; // @[MainPipe.scala 1144:81]
  reg  s3_amo_hit_dup_for_data_wbank_1; // @[Reg.scala 16:16]
  reg  s3_s_amoalu_dup_for_data_wbank_1; // @[MainPipe.scala 1155:50]
  wire  _amo_wait_amoalu_dup_for_data_wbank_T_5 = s3_req_cmd_dup_for_data_wbank_1 != 5'h6; // @[MainPipe.scala 1157:38]
  wire  _amo_wait_amoalu_dup_for_data_wbank_T_6 = _amo_update_meta_dup_for_data_wbank_T_5 &
    _amo_wait_amoalu_dup_for_data_wbank_T_5; // @[MainPipe.scala 1156:98]
  wire  _amo_wait_amoalu_dup_for_data_wbank_T_7 = s3_req_cmd_dup_for_data_wbank_1 != 5'h7; // @[MainPipe.scala 1158:38]
  wire  amo_wait_amoalu_dup_for_data_wbank_1 = _amo_wait_amoalu_dup_for_data_wbank_T_6 &
    _amo_wait_amoalu_dup_for_data_wbank_T_7; // @[MainPipe.scala 1157:48]
  wire  do_amoalu_dup_for_data_wbank_1 = amo_wait_amoalu_dup_for_data_wbank_1 & s3_valid_dup_for_data_wbank_1 & ~
    s3_s_amoalu_dup_for_data_wbank_1; // @[MainPipe.scala 1159:112]
  reg  s3_store_hit_dup_for_data_wbank_1; // @[Reg.scala 16:16]
  reg [35:0] s3_req_addr_dup_for_data_wbank_1; // @[Reg.scala 16:16]
  wire  s3_can_do_amo_dup_for_data_wbank_1 = s3_req_miss_dup_for_data_wbank_1 &
    _store_update_meta_dup_for_data_wbank_T_6 & _amo_update_meta_dup_for_data_wbank_T_5 |
    s3_amo_hit_dup_for_data_wbank_1; // @[MainPipe.scala 1163:170]
  wire  _s3_lr_dup_for_data_wbank_T_6 = _store_update_meta_dup_for_data_wbank_T_6 &
    _amo_update_meta_dup_for_data_wbank_T_5; // @[MainPipe.scala 1166:71]
  wire  s3_lr_dup_for_data_wbank_1 = _store_update_meta_dup_for_data_wbank_T_6 &
    _amo_update_meta_dup_for_data_wbank_T_5 & s3_req_cmd_dup_for_data_wbank_1 == 5'h6; // @[MainPipe.scala 1166:125]
  wire  _s3_sc_dup_for_data_wbank_T_7 = s3_req_cmd_dup_for_data_wbank_1 == 5'h7; // @[MainPipe.scala 1167:159]
  wire  s3_sc_dup_for_data_wbank_1 = _s3_lr_dup_for_data_wbank_T_6 & s3_req_cmd_dup_for_data_wbank_1 == 5'h7; // @[MainPipe.scala 1167:125]
  reg [35:0] lrsc_addr_dup_for_data_wbank_1; // @[MainPipe.scala 1168:44]
  reg [5:0] lrsc_count_dup_for_data_wbank_1; // @[MainPipe.scala 1169:49]
  wire [35:0] _lrsc_addr_dup_for_data_wbank_T_3 = {s3_req_addr_dup_for_data_wbank_1[35:6], 6'h0}; // @[L1Cache.scala 84:59]
  wire [5:0] _lrsc_count_dup_for_data_wbank_T_3 = lrsc_count_dup_for_data_wbank_1 - 6'h1; // @[MainPipe.scala 1181:72]
  wire  lrsc_valid_dup_for_data_wbank_1 = lrsc_count_dup_for_data_wbank_1 > 6'h8; // @[MainPipe.scala 1184:73]
  wire  s3_lrsc_addr_match_dup_for_data_wbank_1 = lrsc_valid_dup_for_data_wbank_1 & lrsc_addr_dup_for_data_wbank_1
     == _lrsc_addr_dup_for_data_wbank_T_3; // @[MainPipe.scala 1185:81]
  wire  s3_sc_fail_dup_for_data_wbank_1 = s3_sc_dup_for_data_wbank_1 & ~s3_lrsc_addr_match_dup_for_data_wbank_1; // @[MainPipe.scala 1186:68]
  wire  _s3_can_do_amo_write_dup_for_data_wbank_T_36 = s3_req_cmd_dup_for_data_wbank_1 == 5'h4 |
    s3_req_cmd_dup_for_data_wbank_1 == 5'h9 | s3_req_cmd_dup_for_data_wbank_1 == 5'ha |
    s3_req_cmd_dup_for_data_wbank_1 == 5'hb; // @[CacheConstants.scala 52:90]
  wire  _s3_can_do_amo_write_dup_for_data_wbank_T_45 = s3_req_cmd_dup_for_data_wbank_1 == 5'h8 |
    s3_req_cmd_dup_for_data_wbank_1 == 5'hc | s3_req_cmd_dup_for_data_wbank_1 == 5'hd |
    s3_req_cmd_dup_for_data_wbank_1 == 5'he | s3_req_cmd_dup_for_data_wbank_1 == 5'hf; // @[CacheConstants.scala 53:114]
  wire  _s3_can_do_amo_write_dup_for_data_wbank_T_46 = _s3_can_do_amo_write_dup_for_data_wbank_T_36 |
    _s3_can_do_amo_write_dup_for_data_wbank_T_45; // @[CacheConstants.scala 54:44]
  wire  _s3_can_do_amo_write_dup_for_data_wbank_T_47 = s3_req_cmd_dup_for_data_wbank_1 == 5'h1 |
    s3_req_cmd_dup_for_data_wbank_1 == 5'h11 | _s3_sc_dup_for_data_wbank_T_7 |
    _s3_can_do_amo_write_dup_for_data_wbank_T_46; // @[CacheConstants.scala 57:76]
  wire  s3_can_do_amo_write_dup_for_data_wbank_1 = s3_can_do_amo_dup_for_data_wbank_1 &
    _s3_can_do_amo_write_dup_for_data_wbank_T_47 & ~s3_sc_fail_dup_for_data_wbank_1; // @[MainPipe.scala 1187:128]
  wire  update_data_dup_for_data_wbank_1 = s3_req_miss_dup_for_data_wbank_1 | s3_store_hit_dup_for_data_wbank_1 |
    s3_can_do_amo_write_dup_for_data_wbank_1; // @[MainPipe.scala 1188:111]
  wire  s3_probe_can_go_dup_for_data_wbank_1 = s3_req_probe_dup_for_data_wbank_1 & io_wb_ready_dup_1; // @[MainPipe.scala 1190:80]
  wire  _s3_store_can_go_dup_for_data_wbank_T_15 = io_data_write_ready_dup_1 | ~update_data_dup_for_data_wbank_1; // @[MainPipe.scala 1195:48]
  wire  s3_store_can_go_dup_for_data_wbank_1 = _store_update_meta_dup_for_data_wbank_T_7 &
    _s3_store_can_go_dup_for_data_wbank_T_15; // @[MainPipe.scala 1194:71]
  wire  _s3_amo_can_go_dup_for_data_wbank_T_13 = s3_amo_hit_dup_for_data_wbank_1 &
    _s3_store_can_go_dup_for_data_wbank_T_15; // @[MainPipe.scala 1197:69]
  wire  _s3_amo_can_go_dup_for_data_wbank_T_15 = s3_s_amoalu_dup_for_data_wbank_1 | ~
    amo_wait_amoalu_dup_for_data_wbank_1; // @[MainPipe.scala 1199:40]
  wire  s3_amo_can_go_dup_for_data_wbank_1 = _s3_amo_can_go_dup_for_data_wbank_T_13 &
    _s3_amo_can_go_dup_for_data_wbank_T_15; // @[MainPipe.scala 1198:85]
  wire  _s3_miss_can_go_dup_for_data_wbank_T_15 = s3_req_miss_dup_for_data_wbank_1 &
    _s3_store_can_go_dup_for_data_wbank_T_15; // @[MainPipe.scala 1201:69]
  wire  _s3_miss_can_go_dup_for_data_wbank_T_18 = _s3_miss_can_go_dup_for_data_wbank_T_15 &
    _s3_amo_can_go_dup_for_data_wbank_T_15; // @[MainPipe.scala 1202:85]
  wire  _s3_miss_can_go_dup_for_data_wbank_T_19 = _s3_miss_can_go_dup_for_data_wbank_T_18 & io_tag_write_ready_dup_1; // @[MainPipe.scala 1203:81]
  wire  s3_miss_can_go_dup_for_data_wbank_1 = _s3_miss_can_go_dup_for_data_wbank_T_19 & io_wb_ready_dup_1; // @[MainPipe.scala 1204:46]
  wire  _s3_replace_can_go_dup_for_data_wbank_T_3 = s3_coh_dup_for_data_wbank_1_state == 2'h0 | io_wb_ready_dup_1; // @[MainPipe.scala 1207:66]
  wire  s3_replace_can_go_dup_for_data_wbank_1 = s3_req_replace_dup_for_data_wbank_1 &
    _s3_replace_can_go_dup_for_data_wbank_T_3; // @[MainPipe.scala 1206:84]
  wire  _s3_can_go_dup_for_data_wbank_T_3 = s3_probe_can_go_dup_for_data_wbank_1 |
    s3_store_can_go_dup_for_data_wbank_1; // @[MainPipe.scala 1208:77]
  wire  _s3_can_go_dup_for_data_wbank_T_4 = _s3_can_go_dup_for_data_wbank_T_3 | s3_amo_can_go_dup_for_data_wbank_1; // @[MainPipe.scala 1209:43]
  wire  _s3_can_go_dup_for_data_wbank_T_5 = _s3_can_go_dup_for_data_wbank_T_4 | s3_miss_can_go_dup_for_data_wbank_1; // @[MainPipe.scala 1210:41]
  wire  s3_can_go_dup_for_data_wbank_1 = _s3_can_go_dup_for_data_wbank_T_5 | s3_replace_can_go_dup_for_data_wbank_1; // @[MainPipe.scala 1211:42]
  wire  s3_update_data_cango_dup_for_data_wbank_1 = s3_store_can_go_dup_for_data_wbank_1 |
    s3_amo_can_go_dup_for_data_wbank_1 | s3_miss_can_go_dup_for_data_wbank_1; // @[MainPipe.scala 1213:125]
  wire  s3_fire_dup_for_data_wbank_1 = s3_valid_dup_for_data_wbank_1 & s3_can_go_dup_for_data_wbank_1; // @[MainPipe.scala 1215:71]
  wire  _GEN_519 = do_amoalu_dup_for_data_wbank_1 | s3_s_amoalu_dup_for_data_wbank_1; // @[MainPipe.scala 1217:42 1155:50 1217:76]
  wire  _GEN_521 = s3_fire_dup_for_data_wbank_1 ? 1'h0 : s3_valid_dup_for_data_wbank_1; // @[MainPipe.scala 1122:45 1221:{45,79}]
  reg [7:0] io_data_write_dup_1_bits_way_en_r; // @[Reg.scala 16:16]
  reg [38:0] io_data_write_dup_1_bits_addr_r; // @[Reg.scala 16:16]
  reg  s3_req_miss_dup_for_data_wbank_2; // @[Reg.scala 16:16]
  reg  s3_req_probe_dup_for_data_wbank_2; // @[Reg.scala 16:16]
  reg [1:0] s3_coh_dup_for_data_wbank_2_state; // @[Reg.scala 16:16]
  reg [3:0] s3_req_source_dup_for_data_wbank_2; // @[Reg.scala 16:16]
  reg [4:0] s3_req_cmd_dup_for_data_wbank_2; // @[Reg.scala 16:16]
  reg  s3_req_replace_dup_for_data_wbank_2; // @[Reg.scala 16:16]
  wire  _store_update_meta_dup_for_data_wbank_T_11 = ~s3_req_probe_dup_for_data_wbank_2; // @[MainPipe.scala 1142:7]
  wire  _store_update_meta_dup_for_data_wbank_T_12 = s3_req_source_dup_for_data_wbank_2 == 4'h1 &
    _store_update_meta_dup_for_data_wbank_T_11; // @[MainPipe.scala 1141:102]
  wire  _amo_update_meta_dup_for_data_wbank_T_10 = s3_req_source_dup_for_data_wbank_2 == 4'h2; // @[MainPipe.scala 1144:81]
  reg  s3_amo_hit_dup_for_data_wbank_2; // @[Reg.scala 16:16]
  reg  s3_s_amoalu_dup_for_data_wbank_2; // @[MainPipe.scala 1155:50]
  wire  _amo_wait_amoalu_dup_for_data_wbank_T_9 = s3_req_cmd_dup_for_data_wbank_2 != 5'h6; // @[MainPipe.scala 1157:38]
  wire  _amo_wait_amoalu_dup_for_data_wbank_T_10 = _amo_update_meta_dup_for_data_wbank_T_10 &
    _amo_wait_amoalu_dup_for_data_wbank_T_9; // @[MainPipe.scala 1156:98]
  wire  _amo_wait_amoalu_dup_for_data_wbank_T_11 = s3_req_cmd_dup_for_data_wbank_2 != 5'h7; // @[MainPipe.scala 1158:38]
  wire  amo_wait_amoalu_dup_for_data_wbank_2 = _amo_wait_amoalu_dup_for_data_wbank_T_10 &
    _amo_wait_amoalu_dup_for_data_wbank_T_11; // @[MainPipe.scala 1157:48]
  wire  do_amoalu_dup_for_data_wbank_2 = amo_wait_amoalu_dup_for_data_wbank_2 & s3_valid_dup_for_data_wbank_2 & ~
    s3_s_amoalu_dup_for_data_wbank_2; // @[MainPipe.scala 1159:112]
  reg  s3_store_hit_dup_for_data_wbank_2; // @[Reg.scala 16:16]
  reg [35:0] s3_req_addr_dup_for_data_wbank_2; // @[Reg.scala 16:16]
  wire  s3_can_do_amo_dup_for_data_wbank_2 = s3_req_miss_dup_for_data_wbank_2 &
    _store_update_meta_dup_for_data_wbank_T_11 & _amo_update_meta_dup_for_data_wbank_T_10 |
    s3_amo_hit_dup_for_data_wbank_2; // @[MainPipe.scala 1163:170]
  wire  _s3_lr_dup_for_data_wbank_T_10 = _store_update_meta_dup_for_data_wbank_T_11 &
    _amo_update_meta_dup_for_data_wbank_T_10; // @[MainPipe.scala 1166:71]
  wire  s3_lr_dup_for_data_wbank_2 = _store_update_meta_dup_for_data_wbank_T_11 &
    _amo_update_meta_dup_for_data_wbank_T_10 & s3_req_cmd_dup_for_data_wbank_2 == 5'h6; // @[MainPipe.scala 1166:125]
  wire  _s3_sc_dup_for_data_wbank_T_11 = s3_req_cmd_dup_for_data_wbank_2 == 5'h7; // @[MainPipe.scala 1167:159]
  wire  s3_sc_dup_for_data_wbank_2 = _s3_lr_dup_for_data_wbank_T_10 & s3_req_cmd_dup_for_data_wbank_2 == 5'h7; // @[MainPipe.scala 1167:125]
  reg [35:0] lrsc_addr_dup_for_data_wbank_2; // @[MainPipe.scala 1168:44]
  reg [5:0] lrsc_count_dup_for_data_wbank_2; // @[MainPipe.scala 1169:49]
  wire [35:0] _lrsc_addr_dup_for_data_wbank_T_5 = {s3_req_addr_dup_for_data_wbank_2[35:6], 6'h0}; // @[L1Cache.scala 84:59]
  wire [5:0] _lrsc_count_dup_for_data_wbank_T_5 = lrsc_count_dup_for_data_wbank_2 - 6'h1; // @[MainPipe.scala 1181:72]
  wire  lrsc_valid_dup_for_data_wbank_2 = lrsc_count_dup_for_data_wbank_2 > 6'h8; // @[MainPipe.scala 1184:73]
  wire  s3_lrsc_addr_match_dup_for_data_wbank_2 = lrsc_valid_dup_for_data_wbank_2 & lrsc_addr_dup_for_data_wbank_2
     == _lrsc_addr_dup_for_data_wbank_T_5; // @[MainPipe.scala 1185:81]
  wire  s3_sc_fail_dup_for_data_wbank_2 = s3_sc_dup_for_data_wbank_2 & ~s3_lrsc_addr_match_dup_for_data_wbank_2; // @[MainPipe.scala 1186:68]
  wire  _s3_can_do_amo_write_dup_for_data_wbank_T_61 = s3_req_cmd_dup_for_data_wbank_2 == 5'h4 |
    s3_req_cmd_dup_for_data_wbank_2 == 5'h9 | s3_req_cmd_dup_for_data_wbank_2 == 5'ha |
    s3_req_cmd_dup_for_data_wbank_2 == 5'hb; // @[CacheConstants.scala 52:90]
  wire  _s3_can_do_amo_write_dup_for_data_wbank_T_70 = s3_req_cmd_dup_for_data_wbank_2 == 5'h8 |
    s3_req_cmd_dup_for_data_wbank_2 == 5'hc | s3_req_cmd_dup_for_data_wbank_2 == 5'hd |
    s3_req_cmd_dup_for_data_wbank_2 == 5'he | s3_req_cmd_dup_for_data_wbank_2 == 5'hf; // @[CacheConstants.scala 53:114]
  wire  _s3_can_do_amo_write_dup_for_data_wbank_T_71 = _s3_can_do_amo_write_dup_for_data_wbank_T_61 |
    _s3_can_do_amo_write_dup_for_data_wbank_T_70; // @[CacheConstants.scala 54:44]
  wire  _s3_can_do_amo_write_dup_for_data_wbank_T_72 = s3_req_cmd_dup_for_data_wbank_2 == 5'h1 |
    s3_req_cmd_dup_for_data_wbank_2 == 5'h11 | _s3_sc_dup_for_data_wbank_T_11 |
    _s3_can_do_amo_write_dup_for_data_wbank_T_71; // @[CacheConstants.scala 57:76]
  wire  s3_can_do_amo_write_dup_for_data_wbank_2 = s3_can_do_amo_dup_for_data_wbank_2 &
    _s3_can_do_amo_write_dup_for_data_wbank_T_72 & ~s3_sc_fail_dup_for_data_wbank_2; // @[MainPipe.scala 1187:128]
  wire  update_data_dup_for_data_wbank_2 = s3_req_miss_dup_for_data_wbank_2 | s3_store_hit_dup_for_data_wbank_2 |
    s3_can_do_amo_write_dup_for_data_wbank_2; // @[MainPipe.scala 1188:111]
  wire  s3_probe_can_go_dup_for_data_wbank_2 = s3_req_probe_dup_for_data_wbank_2 & io_wb_ready_dup_2; // @[MainPipe.scala 1190:80]
  wire  _s3_store_can_go_dup_for_data_wbank_T_23 = io_data_write_ready_dup_2 | ~update_data_dup_for_data_wbank_2; // @[MainPipe.scala 1195:48]
  wire  s3_store_can_go_dup_for_data_wbank_2 = _store_update_meta_dup_for_data_wbank_T_12 &
    _s3_store_can_go_dup_for_data_wbank_T_23; // @[MainPipe.scala 1194:71]
  wire  _s3_amo_can_go_dup_for_data_wbank_T_21 = s3_amo_hit_dup_for_data_wbank_2 &
    _s3_store_can_go_dup_for_data_wbank_T_23; // @[MainPipe.scala 1197:69]
  wire  _s3_amo_can_go_dup_for_data_wbank_T_23 = s3_s_amoalu_dup_for_data_wbank_2 | ~
    amo_wait_amoalu_dup_for_data_wbank_2; // @[MainPipe.scala 1199:40]
  wire  s3_amo_can_go_dup_for_data_wbank_2 = _s3_amo_can_go_dup_for_data_wbank_T_21 &
    _s3_amo_can_go_dup_for_data_wbank_T_23; // @[MainPipe.scala 1198:85]
  wire  _s3_miss_can_go_dup_for_data_wbank_T_25 = s3_req_miss_dup_for_data_wbank_2 &
    _s3_store_can_go_dup_for_data_wbank_T_23; // @[MainPipe.scala 1201:69]
  wire  _s3_miss_can_go_dup_for_data_wbank_T_28 = _s3_miss_can_go_dup_for_data_wbank_T_25 &
    _s3_amo_can_go_dup_for_data_wbank_T_23; // @[MainPipe.scala 1202:85]
  wire  _s3_miss_can_go_dup_for_data_wbank_T_29 = _s3_miss_can_go_dup_for_data_wbank_T_28 & io_tag_write_ready_dup_2; // @[MainPipe.scala 1203:81]
  wire  s3_miss_can_go_dup_for_data_wbank_2 = _s3_miss_can_go_dup_for_data_wbank_T_29 & io_wb_ready_dup_2; // @[MainPipe.scala 1204:46]
  wire  _s3_replace_can_go_dup_for_data_wbank_T_5 = s3_coh_dup_for_data_wbank_2_state == 2'h0 | io_wb_ready_dup_2; // @[MainPipe.scala 1207:66]
  wire  s3_replace_can_go_dup_for_data_wbank_2 = s3_req_replace_dup_for_data_wbank_2 &
    _s3_replace_can_go_dup_for_data_wbank_T_5; // @[MainPipe.scala 1206:84]
  wire  _s3_can_go_dup_for_data_wbank_T_6 = s3_probe_can_go_dup_for_data_wbank_2 |
    s3_store_can_go_dup_for_data_wbank_2; // @[MainPipe.scala 1208:77]
  wire  _s3_can_go_dup_for_data_wbank_T_7 = _s3_can_go_dup_for_data_wbank_T_6 | s3_amo_can_go_dup_for_data_wbank_2; // @[MainPipe.scala 1209:43]
  wire  _s3_can_go_dup_for_data_wbank_T_8 = _s3_can_go_dup_for_data_wbank_T_7 | s3_miss_can_go_dup_for_data_wbank_2; // @[MainPipe.scala 1210:41]
  wire  s3_can_go_dup_for_data_wbank_2 = _s3_can_go_dup_for_data_wbank_T_8 | s3_replace_can_go_dup_for_data_wbank_2; // @[MainPipe.scala 1211:42]
  wire  s3_update_data_cango_dup_for_data_wbank_2 = s3_store_can_go_dup_for_data_wbank_2 |
    s3_amo_can_go_dup_for_data_wbank_2 | s3_miss_can_go_dup_for_data_wbank_2; // @[MainPipe.scala 1213:125]
  wire  s3_fire_dup_for_data_wbank_2 = s3_valid_dup_for_data_wbank_2 & s3_can_go_dup_for_data_wbank_2; // @[MainPipe.scala 1215:71]
  wire  _GEN_544 = do_amoalu_dup_for_data_wbank_2 | s3_s_amoalu_dup_for_data_wbank_2; // @[MainPipe.scala 1217:42 1155:50 1217:76]
  wire  _GEN_546 = s3_fire_dup_for_data_wbank_2 ? 1'h0 : s3_valid_dup_for_data_wbank_2; // @[MainPipe.scala 1122:45 1221:{45,79}]
  reg [7:0] io_data_write_dup_2_bits_way_en_r; // @[Reg.scala 16:16]
  reg [38:0] io_data_write_dup_2_bits_addr_r; // @[Reg.scala 16:16]
  reg  s3_req_miss_dup_for_data_wbank_3; // @[Reg.scala 16:16]
  reg  s3_req_probe_dup_for_data_wbank_3; // @[Reg.scala 16:16]
  reg [1:0] s3_coh_dup_for_data_wbank_3_state; // @[Reg.scala 16:16]
  reg [3:0] s3_req_source_dup_for_data_wbank_3; // @[Reg.scala 16:16]
  reg [4:0] s3_req_cmd_dup_for_data_wbank_3; // @[Reg.scala 16:16]
  reg  s3_req_replace_dup_for_data_wbank_3; // @[Reg.scala 16:16]
  wire  _store_update_meta_dup_for_data_wbank_T_16 = ~s3_req_probe_dup_for_data_wbank_3; // @[MainPipe.scala 1142:7]
  wire  _store_update_meta_dup_for_data_wbank_T_17 = s3_req_source_dup_for_data_wbank_3 == 4'h1 &
    _store_update_meta_dup_for_data_wbank_T_16; // @[MainPipe.scala 1141:102]
  wire  _amo_update_meta_dup_for_data_wbank_T_15 = s3_req_source_dup_for_data_wbank_3 == 4'h2; // @[MainPipe.scala 1144:81]
  reg  s3_amo_hit_dup_for_data_wbank_3; // @[Reg.scala 16:16]
  reg  s3_s_amoalu_dup_for_data_wbank_3; // @[MainPipe.scala 1155:50]
  wire  _amo_wait_amoalu_dup_for_data_wbank_T_13 = s3_req_cmd_dup_for_data_wbank_3 != 5'h6; // @[MainPipe.scala 1157:38]
  wire  _amo_wait_amoalu_dup_for_data_wbank_T_14 = _amo_update_meta_dup_for_data_wbank_T_15 &
    _amo_wait_amoalu_dup_for_data_wbank_T_13; // @[MainPipe.scala 1156:98]
  wire  _amo_wait_amoalu_dup_for_data_wbank_T_15 = s3_req_cmd_dup_for_data_wbank_3 != 5'h7; // @[MainPipe.scala 1158:38]
  wire  amo_wait_amoalu_dup_for_data_wbank_3 = _amo_wait_amoalu_dup_for_data_wbank_T_14 &
    _amo_wait_amoalu_dup_for_data_wbank_T_15; // @[MainPipe.scala 1157:48]
  wire  do_amoalu_dup_for_data_wbank_3 = amo_wait_amoalu_dup_for_data_wbank_3 & s3_valid_dup_for_data_wbank_3 & ~
    s3_s_amoalu_dup_for_data_wbank_3; // @[MainPipe.scala 1159:112]
  reg  s3_store_hit_dup_for_data_wbank_3; // @[Reg.scala 16:16]
  reg [35:0] s3_req_addr_dup_for_data_wbank_3; // @[Reg.scala 16:16]
  wire  s3_can_do_amo_dup_for_data_wbank_3 = s3_req_miss_dup_for_data_wbank_3 &
    _store_update_meta_dup_for_data_wbank_T_16 & _amo_update_meta_dup_for_data_wbank_T_15 |
    s3_amo_hit_dup_for_data_wbank_3; // @[MainPipe.scala 1163:170]
  wire  _s3_lr_dup_for_data_wbank_T_14 = _store_update_meta_dup_for_data_wbank_T_16 &
    _amo_update_meta_dup_for_data_wbank_T_15; // @[MainPipe.scala 1166:71]
  wire  s3_lr_dup_for_data_wbank_3 = _store_update_meta_dup_for_data_wbank_T_16 &
    _amo_update_meta_dup_for_data_wbank_T_15 & s3_req_cmd_dup_for_data_wbank_3 == 5'h6; // @[MainPipe.scala 1166:125]
  wire  _s3_sc_dup_for_data_wbank_T_15 = s3_req_cmd_dup_for_data_wbank_3 == 5'h7; // @[MainPipe.scala 1167:159]
  wire  s3_sc_dup_for_data_wbank_3 = _s3_lr_dup_for_data_wbank_T_14 & s3_req_cmd_dup_for_data_wbank_3 == 5'h7; // @[MainPipe.scala 1167:125]
  reg [35:0] lrsc_addr_dup_for_data_wbank_3; // @[MainPipe.scala 1168:44]
  reg [5:0] lrsc_count_dup_for_data_wbank_3; // @[MainPipe.scala 1169:49]
  wire [35:0] _lrsc_addr_dup_for_data_wbank_T_7 = {s3_req_addr_dup_for_data_wbank_3[35:6], 6'h0}; // @[L1Cache.scala 84:59]
  wire [5:0] _lrsc_count_dup_for_data_wbank_T_7 = lrsc_count_dup_for_data_wbank_3 - 6'h1; // @[MainPipe.scala 1181:72]
  wire  lrsc_valid_dup_for_data_wbank_3 = lrsc_count_dup_for_data_wbank_3 > 6'h8; // @[MainPipe.scala 1184:73]
  wire  s3_lrsc_addr_match_dup_for_data_wbank_3 = lrsc_valid_dup_for_data_wbank_3 & lrsc_addr_dup_for_data_wbank_3
     == _lrsc_addr_dup_for_data_wbank_T_7; // @[MainPipe.scala 1185:81]
  wire  s3_sc_fail_dup_for_data_wbank_3 = s3_sc_dup_for_data_wbank_3 & ~s3_lrsc_addr_match_dup_for_data_wbank_3; // @[MainPipe.scala 1186:68]
  wire  _s3_can_do_amo_write_dup_for_data_wbank_T_86 = s3_req_cmd_dup_for_data_wbank_3 == 5'h4 |
    s3_req_cmd_dup_for_data_wbank_3 == 5'h9 | s3_req_cmd_dup_for_data_wbank_3 == 5'ha |
    s3_req_cmd_dup_for_data_wbank_3 == 5'hb; // @[CacheConstants.scala 52:90]
  wire  _s3_can_do_amo_write_dup_for_data_wbank_T_95 = s3_req_cmd_dup_for_data_wbank_3 == 5'h8 |
    s3_req_cmd_dup_for_data_wbank_3 == 5'hc | s3_req_cmd_dup_for_data_wbank_3 == 5'hd |
    s3_req_cmd_dup_for_data_wbank_3 == 5'he | s3_req_cmd_dup_for_data_wbank_3 == 5'hf; // @[CacheConstants.scala 53:114]
  wire  _s3_can_do_amo_write_dup_for_data_wbank_T_96 = _s3_can_do_amo_write_dup_for_data_wbank_T_86 |
    _s3_can_do_amo_write_dup_for_data_wbank_T_95; // @[CacheConstants.scala 54:44]
  wire  _s3_can_do_amo_write_dup_for_data_wbank_T_97 = s3_req_cmd_dup_for_data_wbank_3 == 5'h1 |
    s3_req_cmd_dup_for_data_wbank_3 == 5'h11 | _s3_sc_dup_for_data_wbank_T_15 |
    _s3_can_do_amo_write_dup_for_data_wbank_T_96; // @[CacheConstants.scala 57:76]
  wire  s3_can_do_amo_write_dup_for_data_wbank_3 = s3_can_do_amo_dup_for_data_wbank_3 &
    _s3_can_do_amo_write_dup_for_data_wbank_T_97 & ~s3_sc_fail_dup_for_data_wbank_3; // @[MainPipe.scala 1187:128]
  wire  update_data_dup_for_data_wbank_3 = s3_req_miss_dup_for_data_wbank_3 | s3_store_hit_dup_for_data_wbank_3 |
    s3_can_do_amo_write_dup_for_data_wbank_3; // @[MainPipe.scala 1188:111]
  wire  s3_probe_can_go_dup_for_data_wbank_3 = s3_req_probe_dup_for_data_wbank_3 & io_wb_ready_dup_3; // @[MainPipe.scala 1190:80]
  wire  _s3_store_can_go_dup_for_data_wbank_T_31 = io_data_write_ready_dup_3 | ~update_data_dup_for_data_wbank_3; // @[MainPipe.scala 1195:48]
  wire  s3_store_can_go_dup_for_data_wbank_3 = _store_update_meta_dup_for_data_wbank_T_17 &
    _s3_store_can_go_dup_for_data_wbank_T_31; // @[MainPipe.scala 1194:71]
  wire  _s3_amo_can_go_dup_for_data_wbank_T_29 = s3_amo_hit_dup_for_data_wbank_3 &
    _s3_store_can_go_dup_for_data_wbank_T_31; // @[MainPipe.scala 1197:69]
  wire  _s3_amo_can_go_dup_for_data_wbank_T_31 = s3_s_amoalu_dup_for_data_wbank_3 | ~
    amo_wait_amoalu_dup_for_data_wbank_3; // @[MainPipe.scala 1199:40]
  wire  s3_amo_can_go_dup_for_data_wbank_3 = _s3_amo_can_go_dup_for_data_wbank_T_29 &
    _s3_amo_can_go_dup_for_data_wbank_T_31; // @[MainPipe.scala 1198:85]
  wire  _s3_miss_can_go_dup_for_data_wbank_T_35 = s3_req_miss_dup_for_data_wbank_3 &
    _s3_store_can_go_dup_for_data_wbank_T_31; // @[MainPipe.scala 1201:69]
  wire  _s3_miss_can_go_dup_for_data_wbank_T_38 = _s3_miss_can_go_dup_for_data_wbank_T_35 &
    _s3_amo_can_go_dup_for_data_wbank_T_31; // @[MainPipe.scala 1202:85]
  wire  _s3_miss_can_go_dup_for_data_wbank_T_39 = _s3_miss_can_go_dup_for_data_wbank_T_38 & io_tag_write_ready_dup_3; // @[MainPipe.scala 1203:81]
  wire  s3_miss_can_go_dup_for_data_wbank_3 = _s3_miss_can_go_dup_for_data_wbank_T_39 & io_wb_ready_dup_3; // @[MainPipe.scala 1204:46]
  wire  _s3_replace_can_go_dup_for_data_wbank_T_7 = s3_coh_dup_for_data_wbank_3_state == 2'h0 | io_wb_ready_dup_3; // @[MainPipe.scala 1207:66]
  wire  s3_replace_can_go_dup_for_data_wbank_3 = s3_req_replace_dup_for_data_wbank_3 &
    _s3_replace_can_go_dup_for_data_wbank_T_7; // @[MainPipe.scala 1206:84]
  wire  _s3_can_go_dup_for_data_wbank_T_9 = s3_probe_can_go_dup_for_data_wbank_3 |
    s3_store_can_go_dup_for_data_wbank_3; // @[MainPipe.scala 1208:77]
  wire  _s3_can_go_dup_for_data_wbank_T_10 = _s3_can_go_dup_for_data_wbank_T_9 | s3_amo_can_go_dup_for_data_wbank_3; // @[MainPipe.scala 1209:43]
  wire  _s3_can_go_dup_for_data_wbank_T_11 = _s3_can_go_dup_for_data_wbank_T_10 | s3_miss_can_go_dup_for_data_wbank_3
    ; // @[MainPipe.scala 1210:41]
  wire  s3_can_go_dup_for_data_wbank_3 = _s3_can_go_dup_for_data_wbank_T_11 | s3_replace_can_go_dup_for_data_wbank_3; // @[MainPipe.scala 1211:42]
  wire  s3_update_data_cango_dup_for_data_wbank_3 = s3_store_can_go_dup_for_data_wbank_3 |
    s3_amo_can_go_dup_for_data_wbank_3 | s3_miss_can_go_dup_for_data_wbank_3; // @[MainPipe.scala 1213:125]
  wire  s3_fire_dup_for_data_wbank_3 = s3_valid_dup_for_data_wbank_3 & s3_can_go_dup_for_data_wbank_3; // @[MainPipe.scala 1215:71]
  wire  _GEN_569 = do_amoalu_dup_for_data_wbank_3 | s3_s_amoalu_dup_for_data_wbank_3; // @[MainPipe.scala 1217:42 1155:50 1217:76]
  wire  _GEN_571 = s3_fire_dup_for_data_wbank_3 ? 1'h0 : s3_valid_dup_for_data_wbank_3; // @[MainPipe.scala 1122:45 1221:{45,79}]
  reg [7:0] io_data_write_dup_3_bits_way_en_r; // @[Reg.scala 16:16]
  reg [38:0] io_data_write_dup_3_bits_addr_r; // @[Reg.scala 16:16]
  reg  s3_req_miss_dup_for_data_wbank_4; // @[Reg.scala 16:16]
  reg  s3_req_probe_dup_for_data_wbank_4; // @[Reg.scala 16:16]
  reg [1:0] s3_coh_dup_for_data_wbank_4_state; // @[Reg.scala 16:16]
  reg [3:0] s3_req_source_dup_for_data_wbank_4; // @[Reg.scala 16:16]
  reg [4:0] s3_req_cmd_dup_for_data_wbank_4; // @[Reg.scala 16:16]
  reg  s3_req_replace_dup_for_data_wbank_4; // @[Reg.scala 16:16]
  wire  _store_update_meta_dup_for_data_wbank_T_21 = ~s3_req_probe_dup_for_data_wbank_4; // @[MainPipe.scala 1142:7]
  wire  _store_update_meta_dup_for_data_wbank_T_22 = s3_req_source_dup_for_data_wbank_4 == 4'h1 &
    _store_update_meta_dup_for_data_wbank_T_21; // @[MainPipe.scala 1141:102]
  wire  _amo_update_meta_dup_for_data_wbank_T_20 = s3_req_source_dup_for_data_wbank_4 == 4'h2; // @[MainPipe.scala 1144:81]
  reg  s3_amo_hit_dup_for_data_wbank_4; // @[Reg.scala 16:16]
  reg  s3_s_amoalu_dup_for_data_wbank_4; // @[MainPipe.scala 1155:50]
  wire  _amo_wait_amoalu_dup_for_data_wbank_T_17 = s3_req_cmd_dup_for_data_wbank_4 != 5'h6; // @[MainPipe.scala 1157:38]
  wire  _amo_wait_amoalu_dup_for_data_wbank_T_18 = _amo_update_meta_dup_for_data_wbank_T_20 &
    _amo_wait_amoalu_dup_for_data_wbank_T_17; // @[MainPipe.scala 1156:98]
  wire  _amo_wait_amoalu_dup_for_data_wbank_T_19 = s3_req_cmd_dup_for_data_wbank_4 != 5'h7; // @[MainPipe.scala 1158:38]
  wire  amo_wait_amoalu_dup_for_data_wbank_4 = _amo_wait_amoalu_dup_for_data_wbank_T_18 &
    _amo_wait_amoalu_dup_for_data_wbank_T_19; // @[MainPipe.scala 1157:48]
  wire  do_amoalu_dup_for_data_wbank_4 = amo_wait_amoalu_dup_for_data_wbank_4 & s3_valid_dup_for_data_wbank_4 & ~
    s3_s_amoalu_dup_for_data_wbank_4; // @[MainPipe.scala 1159:112]
  reg  s3_store_hit_dup_for_data_wbank_4; // @[Reg.scala 16:16]
  reg [35:0] s3_req_addr_dup_for_data_wbank_4; // @[Reg.scala 16:16]
  wire  s3_can_do_amo_dup_for_data_wbank_4 = s3_req_miss_dup_for_data_wbank_4 &
    _store_update_meta_dup_for_data_wbank_T_21 & _amo_update_meta_dup_for_data_wbank_T_20 |
    s3_amo_hit_dup_for_data_wbank_4; // @[MainPipe.scala 1163:170]
  wire  _s3_lr_dup_for_data_wbank_T_18 = _store_update_meta_dup_for_data_wbank_T_21 &
    _amo_update_meta_dup_for_data_wbank_T_20; // @[MainPipe.scala 1166:71]
  wire  s3_lr_dup_for_data_wbank_4 = _store_update_meta_dup_for_data_wbank_T_21 &
    _amo_update_meta_dup_for_data_wbank_T_20 & s3_req_cmd_dup_for_data_wbank_4 == 5'h6; // @[MainPipe.scala 1166:125]
  wire  _s3_sc_dup_for_data_wbank_T_19 = s3_req_cmd_dup_for_data_wbank_4 == 5'h7; // @[MainPipe.scala 1167:159]
  wire  s3_sc_dup_for_data_wbank_4 = _s3_lr_dup_for_data_wbank_T_18 & s3_req_cmd_dup_for_data_wbank_4 == 5'h7; // @[MainPipe.scala 1167:125]
  reg [35:0] lrsc_addr_dup_for_data_wbank_4; // @[MainPipe.scala 1168:44]
  reg [5:0] lrsc_count_dup_for_data_wbank_4; // @[MainPipe.scala 1169:49]
  wire [35:0] _lrsc_addr_dup_for_data_wbank_T_9 = {s3_req_addr_dup_for_data_wbank_4[35:6], 6'h0}; // @[L1Cache.scala 84:59]
  wire [5:0] _lrsc_count_dup_for_data_wbank_T_9 = lrsc_count_dup_for_data_wbank_4 - 6'h1; // @[MainPipe.scala 1181:72]
  wire  lrsc_valid_dup_for_data_wbank_4 = lrsc_count_dup_for_data_wbank_4 > 6'h8; // @[MainPipe.scala 1184:73]
  wire  s3_lrsc_addr_match_dup_for_data_wbank_4 = lrsc_valid_dup_for_data_wbank_4 & lrsc_addr_dup_for_data_wbank_4
     == _lrsc_addr_dup_for_data_wbank_T_9; // @[MainPipe.scala 1185:81]
  wire  s3_sc_fail_dup_for_data_wbank_4 = s3_sc_dup_for_data_wbank_4 & ~s3_lrsc_addr_match_dup_for_data_wbank_4; // @[MainPipe.scala 1186:68]
  wire  _s3_can_do_amo_write_dup_for_data_wbank_T_111 = s3_req_cmd_dup_for_data_wbank_4 == 5'h4 |
    s3_req_cmd_dup_for_data_wbank_4 == 5'h9 | s3_req_cmd_dup_for_data_wbank_4 == 5'ha |
    s3_req_cmd_dup_for_data_wbank_4 == 5'hb; // @[CacheConstants.scala 52:90]
  wire  _s3_can_do_amo_write_dup_for_data_wbank_T_120 = s3_req_cmd_dup_for_data_wbank_4 == 5'h8 |
    s3_req_cmd_dup_for_data_wbank_4 == 5'hc | s3_req_cmd_dup_for_data_wbank_4 == 5'hd |
    s3_req_cmd_dup_for_data_wbank_4 == 5'he | s3_req_cmd_dup_for_data_wbank_4 == 5'hf; // @[CacheConstants.scala 53:114]
  wire  _s3_can_do_amo_write_dup_for_data_wbank_T_121 = _s3_can_do_amo_write_dup_for_data_wbank_T_111 |
    _s3_can_do_amo_write_dup_for_data_wbank_T_120; // @[CacheConstants.scala 54:44]
  wire  _s3_can_do_amo_write_dup_for_data_wbank_T_122 = s3_req_cmd_dup_for_data_wbank_4 == 5'h1 |
    s3_req_cmd_dup_for_data_wbank_4 == 5'h11 | _s3_sc_dup_for_data_wbank_T_19 |
    _s3_can_do_amo_write_dup_for_data_wbank_T_121; // @[CacheConstants.scala 57:76]
  wire  s3_can_do_amo_write_dup_for_data_wbank_4 = s3_can_do_amo_dup_for_data_wbank_4 &
    _s3_can_do_amo_write_dup_for_data_wbank_T_122 & ~s3_sc_fail_dup_for_data_wbank_4; // @[MainPipe.scala 1187:128]
  wire  update_data_dup_for_data_wbank_4 = s3_req_miss_dup_for_data_wbank_4 | s3_store_hit_dup_for_data_wbank_4 |
    s3_can_do_amo_write_dup_for_data_wbank_4; // @[MainPipe.scala 1188:111]
  wire  s3_probe_can_go_dup_for_data_wbank_4 = s3_req_probe_dup_for_data_wbank_4 & io_wb_ready_dup_4; // @[MainPipe.scala 1190:80]
  wire  _s3_store_can_go_dup_for_data_wbank_T_39 = io_data_write_ready_dup_4 | ~update_data_dup_for_data_wbank_4; // @[MainPipe.scala 1195:48]
  wire  s3_store_can_go_dup_for_data_wbank_4 = _store_update_meta_dup_for_data_wbank_T_22 &
    _s3_store_can_go_dup_for_data_wbank_T_39; // @[MainPipe.scala 1194:71]
  wire  _s3_amo_can_go_dup_for_data_wbank_T_37 = s3_amo_hit_dup_for_data_wbank_4 &
    _s3_store_can_go_dup_for_data_wbank_T_39; // @[MainPipe.scala 1197:69]
  wire  _s3_amo_can_go_dup_for_data_wbank_T_39 = s3_s_amoalu_dup_for_data_wbank_4 | ~
    amo_wait_amoalu_dup_for_data_wbank_4; // @[MainPipe.scala 1199:40]
  wire  s3_amo_can_go_dup_for_data_wbank_4 = _s3_amo_can_go_dup_for_data_wbank_T_37 &
    _s3_amo_can_go_dup_for_data_wbank_T_39; // @[MainPipe.scala 1198:85]
  wire  _s3_miss_can_go_dup_for_data_wbank_T_45 = s3_req_miss_dup_for_data_wbank_4 &
    _s3_store_can_go_dup_for_data_wbank_T_39; // @[MainPipe.scala 1201:69]
  wire  _s3_miss_can_go_dup_for_data_wbank_T_48 = _s3_miss_can_go_dup_for_data_wbank_T_45 &
    _s3_amo_can_go_dup_for_data_wbank_T_39; // @[MainPipe.scala 1202:85]
  wire  _s3_miss_can_go_dup_for_data_wbank_T_49 = _s3_miss_can_go_dup_for_data_wbank_T_48 & io_tag_write_ready_dup_4; // @[MainPipe.scala 1203:81]
  wire  s3_miss_can_go_dup_for_data_wbank_4 = _s3_miss_can_go_dup_for_data_wbank_T_49 & io_wb_ready_dup_4; // @[MainPipe.scala 1204:46]
  wire  _s3_replace_can_go_dup_for_data_wbank_T_9 = s3_coh_dup_for_data_wbank_4_state == 2'h0 | io_wb_ready_dup_4; // @[MainPipe.scala 1207:66]
  wire  s3_replace_can_go_dup_for_data_wbank_4 = s3_req_replace_dup_for_data_wbank_4 &
    _s3_replace_can_go_dup_for_data_wbank_T_9; // @[MainPipe.scala 1206:84]
  wire  _s3_can_go_dup_for_data_wbank_T_12 = s3_probe_can_go_dup_for_data_wbank_4 |
    s3_store_can_go_dup_for_data_wbank_4; // @[MainPipe.scala 1208:77]
  wire  _s3_can_go_dup_for_data_wbank_T_13 = _s3_can_go_dup_for_data_wbank_T_12 | s3_amo_can_go_dup_for_data_wbank_4; // @[MainPipe.scala 1209:43]
  wire  _s3_can_go_dup_for_data_wbank_T_14 = _s3_can_go_dup_for_data_wbank_T_13 | s3_miss_can_go_dup_for_data_wbank_4
    ; // @[MainPipe.scala 1210:41]
  wire  s3_can_go_dup_for_data_wbank_4 = _s3_can_go_dup_for_data_wbank_T_14 | s3_replace_can_go_dup_for_data_wbank_4; // @[MainPipe.scala 1211:42]
  wire  s3_update_data_cango_dup_for_data_wbank_4 = s3_store_can_go_dup_for_data_wbank_4 |
    s3_amo_can_go_dup_for_data_wbank_4 | s3_miss_can_go_dup_for_data_wbank_4; // @[MainPipe.scala 1213:125]
  wire  s3_fire_dup_for_data_wbank_4 = s3_valid_dup_for_data_wbank_4 & s3_can_go_dup_for_data_wbank_4; // @[MainPipe.scala 1215:71]
  wire  _GEN_594 = do_amoalu_dup_for_data_wbank_4 | s3_s_amoalu_dup_for_data_wbank_4; // @[MainPipe.scala 1217:42 1155:50 1217:76]
  wire  _GEN_596 = s3_fire_dup_for_data_wbank_4 ? 1'h0 : s3_valid_dup_for_data_wbank_4; // @[MainPipe.scala 1122:45 1221:{45,79}]
  reg [7:0] io_data_write_dup_4_bits_way_en_r; // @[Reg.scala 16:16]
  reg [38:0] io_data_write_dup_4_bits_addr_r; // @[Reg.scala 16:16]
  reg  s3_req_miss_dup_for_data_wbank_5; // @[Reg.scala 16:16]
  reg  s3_req_probe_dup_for_data_wbank_5; // @[Reg.scala 16:16]
  reg [1:0] s3_coh_dup_for_data_wbank_5_state; // @[Reg.scala 16:16]
  reg [3:0] s3_req_source_dup_for_data_wbank_5; // @[Reg.scala 16:16]
  reg [4:0] s3_req_cmd_dup_for_data_wbank_5; // @[Reg.scala 16:16]
  reg  s3_req_replace_dup_for_data_wbank_5; // @[Reg.scala 16:16]
  wire  _store_update_meta_dup_for_data_wbank_T_26 = ~s3_req_probe_dup_for_data_wbank_5; // @[MainPipe.scala 1142:7]
  wire  _store_update_meta_dup_for_data_wbank_T_27 = s3_req_source_dup_for_data_wbank_5 == 4'h1 &
    _store_update_meta_dup_for_data_wbank_T_26; // @[MainPipe.scala 1141:102]
  wire  _amo_update_meta_dup_for_data_wbank_T_25 = s3_req_source_dup_for_data_wbank_5 == 4'h2; // @[MainPipe.scala 1144:81]
  reg  s3_amo_hit_dup_for_data_wbank_5; // @[Reg.scala 16:16]
  reg  s3_s_amoalu_dup_for_data_wbank_5; // @[MainPipe.scala 1155:50]
  wire  _amo_wait_amoalu_dup_for_data_wbank_T_21 = s3_req_cmd_dup_for_data_wbank_5 != 5'h6; // @[MainPipe.scala 1157:38]
  wire  _amo_wait_amoalu_dup_for_data_wbank_T_22 = _amo_update_meta_dup_for_data_wbank_T_25 &
    _amo_wait_amoalu_dup_for_data_wbank_T_21; // @[MainPipe.scala 1156:98]
  wire  _amo_wait_amoalu_dup_for_data_wbank_T_23 = s3_req_cmd_dup_for_data_wbank_5 != 5'h7; // @[MainPipe.scala 1158:38]
  wire  amo_wait_amoalu_dup_for_data_wbank_5 = _amo_wait_amoalu_dup_for_data_wbank_T_22 &
    _amo_wait_amoalu_dup_for_data_wbank_T_23; // @[MainPipe.scala 1157:48]
  wire  do_amoalu_dup_for_data_wbank_5 = amo_wait_amoalu_dup_for_data_wbank_5 & s3_valid_dup_for_data_wbank_5 & ~
    s3_s_amoalu_dup_for_data_wbank_5; // @[MainPipe.scala 1159:112]
  reg  s3_store_hit_dup_for_data_wbank_5; // @[Reg.scala 16:16]
  reg [35:0] s3_req_addr_dup_for_data_wbank_5; // @[Reg.scala 16:16]
  wire  s3_can_do_amo_dup_for_data_wbank_5 = s3_req_miss_dup_for_data_wbank_5 &
    _store_update_meta_dup_for_data_wbank_T_26 & _amo_update_meta_dup_for_data_wbank_T_25 |
    s3_amo_hit_dup_for_data_wbank_5; // @[MainPipe.scala 1163:170]
  wire  _s3_lr_dup_for_data_wbank_T_22 = _store_update_meta_dup_for_data_wbank_T_26 &
    _amo_update_meta_dup_for_data_wbank_T_25; // @[MainPipe.scala 1166:71]
  wire  s3_lr_dup_for_data_wbank_5 = _store_update_meta_dup_for_data_wbank_T_26 &
    _amo_update_meta_dup_for_data_wbank_T_25 & s3_req_cmd_dup_for_data_wbank_5 == 5'h6; // @[MainPipe.scala 1166:125]
  wire  _s3_sc_dup_for_data_wbank_T_23 = s3_req_cmd_dup_for_data_wbank_5 == 5'h7; // @[MainPipe.scala 1167:159]
  wire  s3_sc_dup_for_data_wbank_5 = _s3_lr_dup_for_data_wbank_T_22 & s3_req_cmd_dup_for_data_wbank_5 == 5'h7; // @[MainPipe.scala 1167:125]
  reg [35:0] lrsc_addr_dup_for_data_wbank_5; // @[MainPipe.scala 1168:44]
  reg [5:0] lrsc_count_dup_for_data_wbank_5; // @[MainPipe.scala 1169:49]
  wire [35:0] _lrsc_addr_dup_for_data_wbank_T_11 = {s3_req_addr_dup_for_data_wbank_5[35:6], 6'h0}; // @[L1Cache.scala 84:59]
  wire [5:0] _lrsc_count_dup_for_data_wbank_T_11 = lrsc_count_dup_for_data_wbank_5 - 6'h1; // @[MainPipe.scala 1181:72]
  wire  lrsc_valid_dup_for_data_wbank_5 = lrsc_count_dup_for_data_wbank_5 > 6'h8; // @[MainPipe.scala 1184:73]
  wire  s3_lrsc_addr_match_dup_for_data_wbank_5 = lrsc_valid_dup_for_data_wbank_5 & lrsc_addr_dup_for_data_wbank_5
     == _lrsc_addr_dup_for_data_wbank_T_11; // @[MainPipe.scala 1185:81]
  wire  s3_sc_fail_dup_for_data_wbank_5 = s3_sc_dup_for_data_wbank_5 & ~s3_lrsc_addr_match_dup_for_data_wbank_5; // @[MainPipe.scala 1186:68]
  wire  _s3_can_do_amo_write_dup_for_data_wbank_T_136 = s3_req_cmd_dup_for_data_wbank_5 == 5'h4 |
    s3_req_cmd_dup_for_data_wbank_5 == 5'h9 | s3_req_cmd_dup_for_data_wbank_5 == 5'ha |
    s3_req_cmd_dup_for_data_wbank_5 == 5'hb; // @[CacheConstants.scala 52:90]
  wire  _s3_can_do_amo_write_dup_for_data_wbank_T_145 = s3_req_cmd_dup_for_data_wbank_5 == 5'h8 |
    s3_req_cmd_dup_for_data_wbank_5 == 5'hc | s3_req_cmd_dup_for_data_wbank_5 == 5'hd |
    s3_req_cmd_dup_for_data_wbank_5 == 5'he | s3_req_cmd_dup_for_data_wbank_5 == 5'hf; // @[CacheConstants.scala 53:114]
  wire  _s3_can_do_amo_write_dup_for_data_wbank_T_146 = _s3_can_do_amo_write_dup_for_data_wbank_T_136 |
    _s3_can_do_amo_write_dup_for_data_wbank_T_145; // @[CacheConstants.scala 54:44]
  wire  _s3_can_do_amo_write_dup_for_data_wbank_T_147 = s3_req_cmd_dup_for_data_wbank_5 == 5'h1 |
    s3_req_cmd_dup_for_data_wbank_5 == 5'h11 | _s3_sc_dup_for_data_wbank_T_23 |
    _s3_can_do_amo_write_dup_for_data_wbank_T_146; // @[CacheConstants.scala 57:76]
  wire  s3_can_do_amo_write_dup_for_data_wbank_5 = s3_can_do_amo_dup_for_data_wbank_5 &
    _s3_can_do_amo_write_dup_for_data_wbank_T_147 & ~s3_sc_fail_dup_for_data_wbank_5; // @[MainPipe.scala 1187:128]
  wire  update_data_dup_for_data_wbank_5 = s3_req_miss_dup_for_data_wbank_5 | s3_store_hit_dup_for_data_wbank_5 |
    s3_can_do_amo_write_dup_for_data_wbank_5; // @[MainPipe.scala 1188:111]
  wire  s3_probe_can_go_dup_for_data_wbank_5 = s3_req_probe_dup_for_data_wbank_5 & io_wb_ready_dup_5; // @[MainPipe.scala 1190:80]
  wire  _s3_store_can_go_dup_for_data_wbank_T_47 = io_data_write_ready_dup_5 | ~update_data_dup_for_data_wbank_5; // @[MainPipe.scala 1195:48]
  wire  s3_store_can_go_dup_for_data_wbank_5 = _store_update_meta_dup_for_data_wbank_T_27 &
    _s3_store_can_go_dup_for_data_wbank_T_47; // @[MainPipe.scala 1194:71]
  wire  _s3_amo_can_go_dup_for_data_wbank_T_45 = s3_amo_hit_dup_for_data_wbank_5 &
    _s3_store_can_go_dup_for_data_wbank_T_47; // @[MainPipe.scala 1197:69]
  wire  _s3_amo_can_go_dup_for_data_wbank_T_47 = s3_s_amoalu_dup_for_data_wbank_5 | ~
    amo_wait_amoalu_dup_for_data_wbank_5; // @[MainPipe.scala 1199:40]
  wire  s3_amo_can_go_dup_for_data_wbank_5 = _s3_amo_can_go_dup_for_data_wbank_T_45 &
    _s3_amo_can_go_dup_for_data_wbank_T_47; // @[MainPipe.scala 1198:85]
  wire  _s3_miss_can_go_dup_for_data_wbank_T_55 = s3_req_miss_dup_for_data_wbank_5 &
    _s3_store_can_go_dup_for_data_wbank_T_47; // @[MainPipe.scala 1201:69]
  wire  _s3_miss_can_go_dup_for_data_wbank_T_58 = _s3_miss_can_go_dup_for_data_wbank_T_55 &
    _s3_amo_can_go_dup_for_data_wbank_T_47; // @[MainPipe.scala 1202:85]
  wire  _s3_miss_can_go_dup_for_data_wbank_T_59 = _s3_miss_can_go_dup_for_data_wbank_T_58 & io_tag_write_ready_dup_5; // @[MainPipe.scala 1203:81]
  wire  s3_miss_can_go_dup_for_data_wbank_5 = _s3_miss_can_go_dup_for_data_wbank_T_59 & io_wb_ready_dup_5; // @[MainPipe.scala 1204:46]
  wire  _s3_replace_can_go_dup_for_data_wbank_T_11 = s3_coh_dup_for_data_wbank_5_state == 2'h0 | io_wb_ready_dup_5; // @[MainPipe.scala 1207:66]
  wire  s3_replace_can_go_dup_for_data_wbank_5 = s3_req_replace_dup_for_data_wbank_5 &
    _s3_replace_can_go_dup_for_data_wbank_T_11; // @[MainPipe.scala 1206:84]
  wire  _s3_can_go_dup_for_data_wbank_T_15 = s3_probe_can_go_dup_for_data_wbank_5 |
    s3_store_can_go_dup_for_data_wbank_5; // @[MainPipe.scala 1208:77]
  wire  _s3_can_go_dup_for_data_wbank_T_16 = _s3_can_go_dup_for_data_wbank_T_15 | s3_amo_can_go_dup_for_data_wbank_5; // @[MainPipe.scala 1209:43]
  wire  _s3_can_go_dup_for_data_wbank_T_17 = _s3_can_go_dup_for_data_wbank_T_16 | s3_miss_can_go_dup_for_data_wbank_5
    ; // @[MainPipe.scala 1210:41]
  wire  s3_can_go_dup_for_data_wbank_5 = _s3_can_go_dup_for_data_wbank_T_17 | s3_replace_can_go_dup_for_data_wbank_5; // @[MainPipe.scala 1211:42]
  wire  s3_update_data_cango_dup_for_data_wbank_5 = s3_store_can_go_dup_for_data_wbank_5 |
    s3_amo_can_go_dup_for_data_wbank_5 | s3_miss_can_go_dup_for_data_wbank_5; // @[MainPipe.scala 1213:125]
  wire  s3_fire_dup_for_data_wbank_5 = s3_valid_dup_for_data_wbank_5 & s3_can_go_dup_for_data_wbank_5; // @[MainPipe.scala 1215:71]
  wire  _GEN_619 = do_amoalu_dup_for_data_wbank_5 | s3_s_amoalu_dup_for_data_wbank_5; // @[MainPipe.scala 1217:42 1155:50 1217:76]
  wire  _GEN_621 = s3_fire_dup_for_data_wbank_5 ? 1'h0 : s3_valid_dup_for_data_wbank_5; // @[MainPipe.scala 1122:45 1221:{45,79}]
  reg [7:0] io_data_write_dup_5_bits_way_en_r; // @[Reg.scala 16:16]
  reg [38:0] io_data_write_dup_5_bits_addr_r; // @[Reg.scala 16:16]
  reg  s3_req_miss_dup_for_data_wbank_6; // @[Reg.scala 16:16]
  reg  s3_req_probe_dup_for_data_wbank_6; // @[Reg.scala 16:16]
  reg [1:0] s3_coh_dup_for_data_wbank_6_state; // @[Reg.scala 16:16]
  reg [3:0] s3_req_source_dup_for_data_wbank_6; // @[Reg.scala 16:16]
  reg [4:0] s3_req_cmd_dup_for_data_wbank_6; // @[Reg.scala 16:16]
  reg  s3_req_replace_dup_for_data_wbank_6; // @[Reg.scala 16:16]
  wire  _store_update_meta_dup_for_data_wbank_T_31 = ~s3_req_probe_dup_for_data_wbank_6; // @[MainPipe.scala 1142:7]
  wire  _store_update_meta_dup_for_data_wbank_T_32 = s3_req_source_dup_for_data_wbank_6 == 4'h1 &
    _store_update_meta_dup_for_data_wbank_T_31; // @[MainPipe.scala 1141:102]
  wire  _amo_update_meta_dup_for_data_wbank_T_30 = s3_req_source_dup_for_data_wbank_6 == 4'h2; // @[MainPipe.scala 1144:81]
  reg  s3_amo_hit_dup_for_data_wbank_6; // @[Reg.scala 16:16]
  reg  s3_s_amoalu_dup_for_data_wbank_6; // @[MainPipe.scala 1155:50]
  wire  _amo_wait_amoalu_dup_for_data_wbank_T_25 = s3_req_cmd_dup_for_data_wbank_6 != 5'h6; // @[MainPipe.scala 1157:38]
  wire  _amo_wait_amoalu_dup_for_data_wbank_T_26 = _amo_update_meta_dup_for_data_wbank_T_30 &
    _amo_wait_amoalu_dup_for_data_wbank_T_25; // @[MainPipe.scala 1156:98]
  wire  _amo_wait_amoalu_dup_for_data_wbank_T_27 = s3_req_cmd_dup_for_data_wbank_6 != 5'h7; // @[MainPipe.scala 1158:38]
  wire  amo_wait_amoalu_dup_for_data_wbank_6 = _amo_wait_amoalu_dup_for_data_wbank_T_26 &
    _amo_wait_amoalu_dup_for_data_wbank_T_27; // @[MainPipe.scala 1157:48]
  wire  do_amoalu_dup_for_data_wbank_6 = amo_wait_amoalu_dup_for_data_wbank_6 & s3_valid_dup_for_data_wbank_6 & ~
    s3_s_amoalu_dup_for_data_wbank_6; // @[MainPipe.scala 1159:112]
  reg  s3_store_hit_dup_for_data_wbank_6; // @[Reg.scala 16:16]
  reg [35:0] s3_req_addr_dup_for_data_wbank_6; // @[Reg.scala 16:16]
  wire  s3_can_do_amo_dup_for_data_wbank_6 = s3_req_miss_dup_for_data_wbank_6 &
    _store_update_meta_dup_for_data_wbank_T_31 & _amo_update_meta_dup_for_data_wbank_T_30 |
    s3_amo_hit_dup_for_data_wbank_6; // @[MainPipe.scala 1163:170]
  wire  _s3_lr_dup_for_data_wbank_T_26 = _store_update_meta_dup_for_data_wbank_T_31 &
    _amo_update_meta_dup_for_data_wbank_T_30; // @[MainPipe.scala 1166:71]
  wire  s3_lr_dup_for_data_wbank_6 = _store_update_meta_dup_for_data_wbank_T_31 &
    _amo_update_meta_dup_for_data_wbank_T_30 & s3_req_cmd_dup_for_data_wbank_6 == 5'h6; // @[MainPipe.scala 1166:125]
  wire  _s3_sc_dup_for_data_wbank_T_27 = s3_req_cmd_dup_for_data_wbank_6 == 5'h7; // @[MainPipe.scala 1167:159]
  wire  s3_sc_dup_for_data_wbank_6 = _s3_lr_dup_for_data_wbank_T_26 & s3_req_cmd_dup_for_data_wbank_6 == 5'h7; // @[MainPipe.scala 1167:125]
  reg [35:0] lrsc_addr_dup_for_data_wbank_6; // @[MainPipe.scala 1168:44]
  reg [5:0] lrsc_count_dup_for_data_wbank_6; // @[MainPipe.scala 1169:49]
  wire [35:0] _lrsc_addr_dup_for_data_wbank_T_13 = {s3_req_addr_dup_for_data_wbank_6[35:6], 6'h0}; // @[L1Cache.scala 84:59]
  wire [5:0] _lrsc_count_dup_for_data_wbank_T_13 = lrsc_count_dup_for_data_wbank_6 - 6'h1; // @[MainPipe.scala 1181:72]
  wire  lrsc_valid_dup_for_data_wbank_6 = lrsc_count_dup_for_data_wbank_6 > 6'h8; // @[MainPipe.scala 1184:73]
  wire  s3_lrsc_addr_match_dup_for_data_wbank_6 = lrsc_valid_dup_for_data_wbank_6 & lrsc_addr_dup_for_data_wbank_6
     == _lrsc_addr_dup_for_data_wbank_T_13; // @[MainPipe.scala 1185:81]
  wire  s3_sc_fail_dup_for_data_wbank_6 = s3_sc_dup_for_data_wbank_6 & ~s3_lrsc_addr_match_dup_for_data_wbank_6; // @[MainPipe.scala 1186:68]
  wire  _s3_can_do_amo_write_dup_for_data_wbank_T_161 = s3_req_cmd_dup_for_data_wbank_6 == 5'h4 |
    s3_req_cmd_dup_for_data_wbank_6 == 5'h9 | s3_req_cmd_dup_for_data_wbank_6 == 5'ha |
    s3_req_cmd_dup_for_data_wbank_6 == 5'hb; // @[CacheConstants.scala 52:90]
  wire  _s3_can_do_amo_write_dup_for_data_wbank_T_170 = s3_req_cmd_dup_for_data_wbank_6 == 5'h8 |
    s3_req_cmd_dup_for_data_wbank_6 == 5'hc | s3_req_cmd_dup_for_data_wbank_6 == 5'hd |
    s3_req_cmd_dup_for_data_wbank_6 == 5'he | s3_req_cmd_dup_for_data_wbank_6 == 5'hf; // @[CacheConstants.scala 53:114]
  wire  _s3_can_do_amo_write_dup_for_data_wbank_T_171 = _s3_can_do_amo_write_dup_for_data_wbank_T_161 |
    _s3_can_do_amo_write_dup_for_data_wbank_T_170; // @[CacheConstants.scala 54:44]
  wire  _s3_can_do_amo_write_dup_for_data_wbank_T_172 = s3_req_cmd_dup_for_data_wbank_6 == 5'h1 |
    s3_req_cmd_dup_for_data_wbank_6 == 5'h11 | _s3_sc_dup_for_data_wbank_T_27 |
    _s3_can_do_amo_write_dup_for_data_wbank_T_171; // @[CacheConstants.scala 57:76]
  wire  s3_can_do_amo_write_dup_for_data_wbank_6 = s3_can_do_amo_dup_for_data_wbank_6 &
    _s3_can_do_amo_write_dup_for_data_wbank_T_172 & ~s3_sc_fail_dup_for_data_wbank_6; // @[MainPipe.scala 1187:128]
  wire  update_data_dup_for_data_wbank_6 = s3_req_miss_dup_for_data_wbank_6 | s3_store_hit_dup_for_data_wbank_6 |
    s3_can_do_amo_write_dup_for_data_wbank_6; // @[MainPipe.scala 1188:111]
  wire  s3_probe_can_go_dup_for_data_wbank_6 = s3_req_probe_dup_for_data_wbank_6 & io_wb_ready_dup_6; // @[MainPipe.scala 1190:80]
  wire  _s3_store_can_go_dup_for_data_wbank_T_55 = io_data_write_ready_dup_6 | ~update_data_dup_for_data_wbank_6; // @[MainPipe.scala 1195:48]
  wire  s3_store_can_go_dup_for_data_wbank_6 = _store_update_meta_dup_for_data_wbank_T_32 &
    _s3_store_can_go_dup_for_data_wbank_T_55; // @[MainPipe.scala 1194:71]
  wire  _s3_amo_can_go_dup_for_data_wbank_T_53 = s3_amo_hit_dup_for_data_wbank_6 &
    _s3_store_can_go_dup_for_data_wbank_T_55; // @[MainPipe.scala 1197:69]
  wire  _s3_amo_can_go_dup_for_data_wbank_T_55 = s3_s_amoalu_dup_for_data_wbank_6 | ~
    amo_wait_amoalu_dup_for_data_wbank_6; // @[MainPipe.scala 1199:40]
  wire  s3_amo_can_go_dup_for_data_wbank_6 = _s3_amo_can_go_dup_for_data_wbank_T_53 &
    _s3_amo_can_go_dup_for_data_wbank_T_55; // @[MainPipe.scala 1198:85]
  wire  _s3_miss_can_go_dup_for_data_wbank_T_65 = s3_req_miss_dup_for_data_wbank_6 &
    _s3_store_can_go_dup_for_data_wbank_T_55; // @[MainPipe.scala 1201:69]
  wire  _s3_miss_can_go_dup_for_data_wbank_T_68 = _s3_miss_can_go_dup_for_data_wbank_T_65 &
    _s3_amo_can_go_dup_for_data_wbank_T_55; // @[MainPipe.scala 1202:85]
  wire  _s3_miss_can_go_dup_for_data_wbank_T_69 = _s3_miss_can_go_dup_for_data_wbank_T_68 & io_tag_write_ready_dup_6; // @[MainPipe.scala 1203:81]
  wire  s3_miss_can_go_dup_for_data_wbank_6 = _s3_miss_can_go_dup_for_data_wbank_T_69 & io_wb_ready_dup_6; // @[MainPipe.scala 1204:46]
  wire  _s3_replace_can_go_dup_for_data_wbank_T_13 = s3_coh_dup_for_data_wbank_6_state == 2'h0 | io_wb_ready_dup_6; // @[MainPipe.scala 1207:66]
  wire  s3_replace_can_go_dup_for_data_wbank_6 = s3_req_replace_dup_for_data_wbank_6 &
    _s3_replace_can_go_dup_for_data_wbank_T_13; // @[MainPipe.scala 1206:84]
  wire  _s3_can_go_dup_for_data_wbank_T_18 = s3_probe_can_go_dup_for_data_wbank_6 |
    s3_store_can_go_dup_for_data_wbank_6; // @[MainPipe.scala 1208:77]
  wire  _s3_can_go_dup_for_data_wbank_T_19 = _s3_can_go_dup_for_data_wbank_T_18 | s3_amo_can_go_dup_for_data_wbank_6; // @[MainPipe.scala 1209:43]
  wire  _s3_can_go_dup_for_data_wbank_T_20 = _s3_can_go_dup_for_data_wbank_T_19 | s3_miss_can_go_dup_for_data_wbank_6
    ; // @[MainPipe.scala 1210:41]
  wire  s3_can_go_dup_for_data_wbank_6 = _s3_can_go_dup_for_data_wbank_T_20 | s3_replace_can_go_dup_for_data_wbank_6; // @[MainPipe.scala 1211:42]
  wire  s3_update_data_cango_dup_for_data_wbank_6 = s3_store_can_go_dup_for_data_wbank_6 |
    s3_amo_can_go_dup_for_data_wbank_6 | s3_miss_can_go_dup_for_data_wbank_6; // @[MainPipe.scala 1213:125]
  wire  s3_fire_dup_for_data_wbank_6 = s3_valid_dup_for_data_wbank_6 & s3_can_go_dup_for_data_wbank_6; // @[MainPipe.scala 1215:71]
  wire  _GEN_644 = do_amoalu_dup_for_data_wbank_6 | s3_s_amoalu_dup_for_data_wbank_6; // @[MainPipe.scala 1217:42 1155:50 1217:76]
  wire  _GEN_646 = s3_fire_dup_for_data_wbank_6 ? 1'h0 : s3_valid_dup_for_data_wbank_6; // @[MainPipe.scala 1122:45 1221:{45,79}]
  reg [7:0] io_data_write_dup_6_bits_way_en_r; // @[Reg.scala 16:16]
  reg [38:0] io_data_write_dup_6_bits_addr_r; // @[Reg.scala 16:16]
  reg  s3_req_miss_dup_for_data_wbank_7; // @[Reg.scala 16:16]
  reg  s3_req_probe_dup_for_data_wbank_7; // @[Reg.scala 16:16]
  reg [1:0] s3_coh_dup_for_data_wbank_7_state; // @[Reg.scala 16:16]
  reg [3:0] s3_req_source_dup_for_data_wbank_7; // @[Reg.scala 16:16]
  reg [4:0] s3_req_cmd_dup_for_data_wbank_7; // @[Reg.scala 16:16]
  reg  s3_req_replace_dup_for_data_wbank_7; // @[Reg.scala 16:16]
  wire  _store_update_meta_dup_for_data_wbank_T_36 = ~s3_req_probe_dup_for_data_wbank_7; // @[MainPipe.scala 1142:7]
  wire  _store_update_meta_dup_for_data_wbank_T_37 = s3_req_source_dup_for_data_wbank_7 == 4'h1 &
    _store_update_meta_dup_for_data_wbank_T_36; // @[MainPipe.scala 1141:102]
  wire  _amo_update_meta_dup_for_data_wbank_T_35 = s3_req_source_dup_for_data_wbank_7 == 4'h2; // @[MainPipe.scala 1144:81]
  reg  s3_amo_hit_dup_for_data_wbank_7; // @[Reg.scala 16:16]
  reg  s3_s_amoalu_dup_for_data_wbank_7; // @[MainPipe.scala 1155:50]
  wire  _amo_wait_amoalu_dup_for_data_wbank_T_29 = s3_req_cmd_dup_for_data_wbank_7 != 5'h6; // @[MainPipe.scala 1157:38]
  wire  _amo_wait_amoalu_dup_for_data_wbank_T_30 = _amo_update_meta_dup_for_data_wbank_T_35 &
    _amo_wait_amoalu_dup_for_data_wbank_T_29; // @[MainPipe.scala 1156:98]
  wire  _amo_wait_amoalu_dup_for_data_wbank_T_31 = s3_req_cmd_dup_for_data_wbank_7 != 5'h7; // @[MainPipe.scala 1158:38]
  wire  amo_wait_amoalu_dup_for_data_wbank_7 = _amo_wait_amoalu_dup_for_data_wbank_T_30 &
    _amo_wait_amoalu_dup_for_data_wbank_T_31; // @[MainPipe.scala 1157:48]
  wire  do_amoalu_dup_for_data_wbank_7 = amo_wait_amoalu_dup_for_data_wbank_7 & s3_valid_dup_for_data_wbank_7 & ~
    s3_s_amoalu_dup_for_data_wbank_7; // @[MainPipe.scala 1159:112]
  reg  s3_store_hit_dup_for_data_wbank_7; // @[Reg.scala 16:16]
  reg [35:0] s3_req_addr_dup_for_data_wbank_7; // @[Reg.scala 16:16]
  wire  s3_can_do_amo_dup_for_data_wbank_7 = s3_req_miss_dup_for_data_wbank_7 &
    _store_update_meta_dup_for_data_wbank_T_36 & _amo_update_meta_dup_for_data_wbank_T_35 |
    s3_amo_hit_dup_for_data_wbank_7; // @[MainPipe.scala 1163:170]
  wire  _s3_lr_dup_for_data_wbank_T_30 = _store_update_meta_dup_for_data_wbank_T_36 &
    _amo_update_meta_dup_for_data_wbank_T_35; // @[MainPipe.scala 1166:71]
  wire  s3_lr_dup_for_data_wbank_7 = _store_update_meta_dup_for_data_wbank_T_36 &
    _amo_update_meta_dup_for_data_wbank_T_35 & s3_req_cmd_dup_for_data_wbank_7 == 5'h6; // @[MainPipe.scala 1166:125]
  wire  _s3_sc_dup_for_data_wbank_T_31 = s3_req_cmd_dup_for_data_wbank_7 == 5'h7; // @[MainPipe.scala 1167:159]
  wire  s3_sc_dup_for_data_wbank_7 = _s3_lr_dup_for_data_wbank_T_30 & s3_req_cmd_dup_for_data_wbank_7 == 5'h7; // @[MainPipe.scala 1167:125]
  reg [35:0] lrsc_addr_dup_for_data_wbank_7; // @[MainPipe.scala 1168:44]
  reg [5:0] lrsc_count_dup_for_data_wbank_7; // @[MainPipe.scala 1169:49]
  wire [35:0] _lrsc_addr_dup_for_data_wbank_T_15 = {s3_req_addr_dup_for_data_wbank_7[35:6], 6'h0}; // @[L1Cache.scala 84:59]
  wire [5:0] _lrsc_count_dup_for_data_wbank_T_15 = lrsc_count_dup_for_data_wbank_7 - 6'h1; // @[MainPipe.scala 1181:72]
  wire  lrsc_valid_dup_for_data_wbank_7 = lrsc_count_dup_for_data_wbank_7 > 6'h8; // @[MainPipe.scala 1184:73]
  wire  s3_lrsc_addr_match_dup_for_data_wbank_7 = lrsc_valid_dup_for_data_wbank_7 & lrsc_addr_dup_for_data_wbank_7
     == _lrsc_addr_dup_for_data_wbank_T_15; // @[MainPipe.scala 1185:81]
  wire  s3_sc_fail_dup_for_data_wbank_7 = s3_sc_dup_for_data_wbank_7 & ~s3_lrsc_addr_match_dup_for_data_wbank_7; // @[MainPipe.scala 1186:68]
  wire  _s3_can_do_amo_write_dup_for_data_wbank_T_186 = s3_req_cmd_dup_for_data_wbank_7 == 5'h4 |
    s3_req_cmd_dup_for_data_wbank_7 == 5'h9 | s3_req_cmd_dup_for_data_wbank_7 == 5'ha |
    s3_req_cmd_dup_for_data_wbank_7 == 5'hb; // @[CacheConstants.scala 52:90]
  wire  _s3_can_do_amo_write_dup_for_data_wbank_T_195 = s3_req_cmd_dup_for_data_wbank_7 == 5'h8 |
    s3_req_cmd_dup_for_data_wbank_7 == 5'hc | s3_req_cmd_dup_for_data_wbank_7 == 5'hd |
    s3_req_cmd_dup_for_data_wbank_7 == 5'he | s3_req_cmd_dup_for_data_wbank_7 == 5'hf; // @[CacheConstants.scala 53:114]
  wire  _s3_can_do_amo_write_dup_for_data_wbank_T_196 = _s3_can_do_amo_write_dup_for_data_wbank_T_186 |
    _s3_can_do_amo_write_dup_for_data_wbank_T_195; // @[CacheConstants.scala 54:44]
  wire  _s3_can_do_amo_write_dup_for_data_wbank_T_197 = s3_req_cmd_dup_for_data_wbank_7 == 5'h1 |
    s3_req_cmd_dup_for_data_wbank_7 == 5'h11 | _s3_sc_dup_for_data_wbank_T_31 |
    _s3_can_do_amo_write_dup_for_data_wbank_T_196; // @[CacheConstants.scala 57:76]
  wire  s3_can_do_amo_write_dup_for_data_wbank_7 = s3_can_do_amo_dup_for_data_wbank_7 &
    _s3_can_do_amo_write_dup_for_data_wbank_T_197 & ~s3_sc_fail_dup_for_data_wbank_7; // @[MainPipe.scala 1187:128]
  wire  update_data_dup_for_data_wbank_7 = s3_req_miss_dup_for_data_wbank_7 | s3_store_hit_dup_for_data_wbank_7 |
    s3_can_do_amo_write_dup_for_data_wbank_7; // @[MainPipe.scala 1188:111]
  wire  s3_probe_can_go_dup_for_data_wbank_7 = s3_req_probe_dup_for_data_wbank_7 & io_wb_ready_dup_7; // @[MainPipe.scala 1190:80]
  wire  _s3_store_can_go_dup_for_data_wbank_T_63 = io_data_write_ready_dup_7 | ~update_data_dup_for_data_wbank_7; // @[MainPipe.scala 1195:48]
  wire  s3_store_can_go_dup_for_data_wbank_7 = _store_update_meta_dup_for_data_wbank_T_37 &
    _s3_store_can_go_dup_for_data_wbank_T_63; // @[MainPipe.scala 1194:71]
  wire  _s3_amo_can_go_dup_for_data_wbank_T_61 = s3_amo_hit_dup_for_data_wbank_7 &
    _s3_store_can_go_dup_for_data_wbank_T_63; // @[MainPipe.scala 1197:69]
  wire  _s3_amo_can_go_dup_for_data_wbank_T_63 = s3_s_amoalu_dup_for_data_wbank_7 | ~
    amo_wait_amoalu_dup_for_data_wbank_7; // @[MainPipe.scala 1199:40]
  wire  s3_amo_can_go_dup_for_data_wbank_7 = _s3_amo_can_go_dup_for_data_wbank_T_61 &
    _s3_amo_can_go_dup_for_data_wbank_T_63; // @[MainPipe.scala 1198:85]
  wire  _s3_miss_can_go_dup_for_data_wbank_T_75 = s3_req_miss_dup_for_data_wbank_7 &
    _s3_store_can_go_dup_for_data_wbank_T_63; // @[MainPipe.scala 1201:69]
  wire  _s3_miss_can_go_dup_for_data_wbank_T_78 = _s3_miss_can_go_dup_for_data_wbank_T_75 &
    _s3_amo_can_go_dup_for_data_wbank_T_63; // @[MainPipe.scala 1202:85]
  wire  _s3_miss_can_go_dup_for_data_wbank_T_79 = _s3_miss_can_go_dup_for_data_wbank_T_78 & io_tag_write_ready_dup_7; // @[MainPipe.scala 1203:81]
  wire  s3_miss_can_go_dup_for_data_wbank_7 = _s3_miss_can_go_dup_for_data_wbank_T_79 & io_wb_ready_dup_7; // @[MainPipe.scala 1204:46]
  wire  _s3_replace_can_go_dup_for_data_wbank_T_15 = s3_coh_dup_for_data_wbank_7_state == 2'h0 | io_wb_ready_dup_7; // @[MainPipe.scala 1207:66]
  wire  s3_replace_can_go_dup_for_data_wbank_7 = s3_req_replace_dup_for_data_wbank_7 &
    _s3_replace_can_go_dup_for_data_wbank_T_15; // @[MainPipe.scala 1206:84]
  wire  _s3_can_go_dup_for_data_wbank_T_21 = s3_probe_can_go_dup_for_data_wbank_7 |
    s3_store_can_go_dup_for_data_wbank_7; // @[MainPipe.scala 1208:77]
  wire  _s3_can_go_dup_for_data_wbank_T_22 = _s3_can_go_dup_for_data_wbank_T_21 | s3_amo_can_go_dup_for_data_wbank_7; // @[MainPipe.scala 1209:43]
  wire  _s3_can_go_dup_for_data_wbank_T_23 = _s3_can_go_dup_for_data_wbank_T_22 | s3_miss_can_go_dup_for_data_wbank_7
    ; // @[MainPipe.scala 1210:41]
  wire  s3_can_go_dup_for_data_wbank_7 = _s3_can_go_dup_for_data_wbank_T_23 | s3_replace_can_go_dup_for_data_wbank_7; // @[MainPipe.scala 1211:42]
  wire  s3_update_data_cango_dup_for_data_wbank_7 = s3_store_can_go_dup_for_data_wbank_7 |
    s3_amo_can_go_dup_for_data_wbank_7 | s3_miss_can_go_dup_for_data_wbank_7; // @[MainPipe.scala 1213:125]
  wire  s3_fire_dup_for_data_wbank_7 = s3_valid_dup_for_data_wbank_7 & s3_can_go_dup_for_data_wbank_7; // @[MainPipe.scala 1215:71]
  wire  _GEN_669 = do_amoalu_dup_for_data_wbank_7 | s3_s_amoalu_dup_for_data_wbank_7; // @[MainPipe.scala 1217:42 1155:50 1217:76]
  wire  _GEN_671 = s3_fire_dup_for_data_wbank_7 ? 1'h0 : s3_valid_dup_for_data_wbank_7; // @[MainPipe.scala 1122:45 1221:{45,79}]
  reg [7:0] io_data_write_dup_7_bits_way_en_r; // @[Reg.scala 16:16]
  reg [38:0] io_data_write_dup_7_bits_addr_r; // @[Reg.scala 16:16]
  reg  miss_update_meta_dup_for_wb_valid; // @[Reg.scala 16:16]
  reg  s3_req_probe_dup_for_wb_valid; // @[Reg.scala 16:16]
  reg  s3_tag_match_dup_for_wb_valid; // @[Reg.scala 16:16]
  reg [1:0] s3_coh_dup_for_wb_valid_state; // @[Reg.scala 16:16]
  reg [1:0] s3_req_probe_param_dup_for_wb_valid; // @[Reg.scala 16:16]
  wire [3:0] _probe_new_coh_dup_for_wb_valid_T = {s3_req_probe_param_dup_for_wb_valid,s3_coh_dup_for_wb_valid_state}; // @[Cat.scala 31:58]
  wire  _probe_new_coh_dup_for_wb_valid_T_13 = 4'h8 == _probe_new_coh_dup_for_wb_valid_T; // @[Misc.scala 55:20]
  wire [2:0] _probe_new_coh_dup_for_wb_valid_T_15 = _probe_new_coh_dup_for_wb_valid_T_13 ? 3'h5 : 3'h0; // @[Misc.scala 37:36]
  wire  _probe_new_coh_dup_for_wb_valid_T_17 = 4'h9 == _probe_new_coh_dup_for_wb_valid_T; // @[Misc.scala 55:20]
  wire [2:0] _probe_new_coh_dup_for_wb_valid_T_19 = _probe_new_coh_dup_for_wb_valid_T_17 ? 3'h2 :
    _probe_new_coh_dup_for_wb_valid_T_15; // @[Misc.scala 37:36]
  wire  _probe_new_coh_dup_for_wb_valid_T_21 = 4'ha == _probe_new_coh_dup_for_wb_valid_T; // @[Misc.scala 55:20]
  wire [2:0] _probe_new_coh_dup_for_wb_valid_T_23 = _probe_new_coh_dup_for_wb_valid_T_21 ? 3'h1 :
    _probe_new_coh_dup_for_wb_valid_T_19; // @[Misc.scala 37:36]
  wire  _probe_new_coh_dup_for_wb_valid_T_25 = 4'hb == _probe_new_coh_dup_for_wb_valid_T; // @[Misc.scala 55:20]
  wire [2:0] _probe_new_coh_dup_for_wb_valid_T_27 = _probe_new_coh_dup_for_wb_valid_T_25 ? 3'h1 :
    _probe_new_coh_dup_for_wb_valid_T_23; // @[Misc.scala 37:36]
  wire  _probe_new_coh_dup_for_wb_valid_T_29 = 4'h4 == _probe_new_coh_dup_for_wb_valid_T; // @[Misc.scala 55:20]
  wire [2:0] _probe_new_coh_dup_for_wb_valid_T_31 = _probe_new_coh_dup_for_wb_valid_T_29 ? 3'h5 :
    _probe_new_coh_dup_for_wb_valid_T_27; // @[Misc.scala 37:36]
  wire  _probe_new_coh_dup_for_wb_valid_T_33 = 4'h5 == _probe_new_coh_dup_for_wb_valid_T; // @[Misc.scala 55:20]
  wire [2:0] _probe_new_coh_dup_for_wb_valid_T_35 = _probe_new_coh_dup_for_wb_valid_T_33 ? 3'h4 :
    _probe_new_coh_dup_for_wb_valid_T_31; // @[Misc.scala 37:36]
  wire  _probe_new_coh_dup_for_wb_valid_T_37 = 4'h6 == _probe_new_coh_dup_for_wb_valid_T; // @[Misc.scala 55:20]
  wire [2:0] _probe_new_coh_dup_for_wb_valid_T_39 = _probe_new_coh_dup_for_wb_valid_T_37 ? 3'h0 :
    _probe_new_coh_dup_for_wb_valid_T_35; // @[Misc.scala 37:36]
  wire  _probe_new_coh_dup_for_wb_valid_T_41 = 4'h7 == _probe_new_coh_dup_for_wb_valid_T; // @[Misc.scala 55:20]
  wire [2:0] _probe_new_coh_dup_for_wb_valid_T_43 = _probe_new_coh_dup_for_wb_valid_T_41 ? 3'h0 :
    _probe_new_coh_dup_for_wb_valid_T_39; // @[Misc.scala 37:36]
  wire  _probe_new_coh_dup_for_wb_valid_T_45 = 4'h0 == _probe_new_coh_dup_for_wb_valid_T; // @[Misc.scala 55:20]
  wire [2:0] _probe_new_coh_dup_for_wb_valid_T_47 = _probe_new_coh_dup_for_wb_valid_T_45 ? 3'h5 :
    _probe_new_coh_dup_for_wb_valid_T_43; // @[Misc.scala 37:36]
  wire  _probe_new_coh_dup_for_wb_valid_T_49 = 4'h1 == _probe_new_coh_dup_for_wb_valid_T; // @[Misc.scala 55:20]
  wire [2:0] _probe_new_coh_dup_for_wb_valid_T_51 = _probe_new_coh_dup_for_wb_valid_T_49 ? 3'h4 :
    _probe_new_coh_dup_for_wb_valid_T_47; // @[Misc.scala 37:36]
  wire  _probe_new_coh_dup_for_wb_valid_T_53 = 4'h2 == _probe_new_coh_dup_for_wb_valid_T; // @[Misc.scala 55:20]
  wire [2:0] _probe_new_coh_dup_for_wb_valid_T_55 = _probe_new_coh_dup_for_wb_valid_T_53 ? 3'h3 :
    _probe_new_coh_dup_for_wb_valid_T_51; // @[Misc.scala 37:36]
  wire  _probe_new_coh_dup_for_wb_valid_T_57 = 4'h3 == _probe_new_coh_dup_for_wb_valid_T; // @[Misc.scala 55:20]
  wire [2:0] _probe_new_coh_dup_for_wb_valid_T_59 = _probe_new_coh_dup_for_wb_valid_T_57 ? 3'h3 :
    _probe_new_coh_dup_for_wb_valid_T_55; // @[Misc.scala 37:36]
  reg [3:0] s3_req_source_dup_for_wb_valid; // @[Reg.scala 16:16]
  reg [4:0] s3_req_cmd_dup_for_wb_valid; // @[Reg.scala 16:16]
  reg  s3_req_replace_dup_for_wb_valid; // @[Reg.scala 16:16]
  wire  _store_update_meta_dup_for_wb_valid_T_1 = ~s3_req_probe_dup_for_wb_valid; // @[MainPipe.scala 1245:5]
  wire  _store_update_meta_dup_for_wb_valid_T_2 = s3_req_source_dup_for_wb_valid == 4'h1 &
    _store_update_meta_dup_for_wb_valid_T_1; // @[MainPipe.scala 1244:94]
  wire  _amo_update_meta_dup_for_wb_valid_T = s3_req_source_dup_for_wb_valid == 4'h2; // @[MainPipe.scala 1247:73]
  reg  s3_valid_dup_for_wb_valid; // @[MainPipe.scala 1257:42]
  reg  s3_amo_hit_dup_for_wb_valid; // @[Reg.scala 16:16]
  reg  s3_s_amoalu_dup_for_wb_valid; // @[MainPipe.scala 1259:45]
  wire  _amo_wait_amoalu_dup_for_wb_valid_T_1 = s3_req_cmd_dup_for_wb_valid != 5'h6; // @[MainPipe.scala 1261:33]
  wire  _amo_wait_amoalu_dup_for_wb_valid_T_2 = _amo_update_meta_dup_for_wb_valid_T &
    _amo_wait_amoalu_dup_for_wb_valid_T_1; // @[MainPipe.scala 1260:90]
  wire  _amo_wait_amoalu_dup_for_wb_valid_T_3 = s3_req_cmd_dup_for_wb_valid != 5'h7; // @[MainPipe.scala 1262:33]
  wire  amo_wait_amoalu_dup_for_wb_valid = _amo_wait_amoalu_dup_for_wb_valid_T_2 & _amo_wait_amoalu_dup_for_wb_valid_T_3
    ; // @[MainPipe.scala 1261:43]
  wire  do_amoalu_dup_for_wb_valid = amo_wait_amoalu_dup_for_wb_valid & s3_valid_dup_for_wb_valid & ~
    s3_s_amoalu_dup_for_wb_valid; // @[MainPipe.scala 1263:98]
  reg  s3_store_hit_dup_for_wb_valid; // @[Reg.scala 16:16]
  reg [35:0] s3_req_addr_dup_for_wb_valid; // @[Reg.scala 16:16]
  wire  s3_can_do_amo_dup_for_wb_valid = miss_update_meta_dup_for_wb_valid & _store_update_meta_dup_for_wb_valid_T_1 &
    _amo_update_meta_dup_for_wb_valid_T | s3_amo_hit_dup_for_wb_valid; // @[MainPipe.scala 1267:156]
  wire  _s3_lr_dup_for_wb_valid_T_2 = _store_update_meta_dup_for_wb_valid_T_1 & _amo_update_meta_dup_for_wb_valid_T; // @[MainPipe.scala 1270:63]
  wire  s3_lr_dup_for_wb_valid = _store_update_meta_dup_for_wb_valid_T_1 & _amo_update_meta_dup_for_wb_valid_T &
    s3_req_cmd_dup_for_wb_valid == 5'h6; // @[MainPipe.scala 1270:114]
  wire  _s3_sc_dup_for_wb_valid_T_3 = s3_req_cmd_dup_for_wb_valid == 5'h7; // @[MainPipe.scala 1271:145]
  wire  s3_sc_dup_for_wb_valid = _s3_lr_dup_for_wb_valid_T_2 & s3_req_cmd_dup_for_wb_valid == 5'h7; // @[MainPipe.scala 1271:114]
  reg [35:0] lrsc_addr_dup_for_wb_valid; // @[MainPipe.scala 1272:39]
  reg [5:0] lrsc_count_dup_for_wb_valid; // @[MainPipe.scala 1273:44]
  wire [35:0] _lrsc_addr_dup_for_wb_valid_T_1 = {s3_req_addr_dup_for_wb_valid[35:6], 6'h0}; // @[L1Cache.scala 84:59]
  wire [5:0] _lrsc_count_dup_for_wb_valid_T_1 = lrsc_count_dup_for_wb_valid - 6'h1; // @[MainPipe.scala 1285:64]
  wire  lrsc_valid_dup_for_wb_valid = lrsc_count_dup_for_wb_valid > 6'h8; // @[MainPipe.scala 1288:65]
  wire  s3_lrsc_addr_match_dup_for_wb_valid = lrsc_valid_dup_for_wb_valid & lrsc_addr_dup_for_wb_valid ==
    _lrsc_addr_dup_for_wb_valid_T_1; // @[MainPipe.scala 1289:73]
  wire  s3_sc_fail_dup_for_wb_valid = s3_sc_dup_for_wb_valid & ~s3_lrsc_addr_match_dup_for_wb_valid; // @[MainPipe.scala 1290:60]
  wire  _s3_can_do_amo_write_dup_for_wb_valid_T_11 = s3_req_cmd_dup_for_wb_valid == 5'h4 | s3_req_cmd_dup_for_wb_valid
     == 5'h9 | s3_req_cmd_dup_for_wb_valid == 5'ha | s3_req_cmd_dup_for_wb_valid == 5'hb; // @[CacheConstants.scala 52:90]
  wire  _s3_can_do_amo_write_dup_for_wb_valid_T_20 = s3_req_cmd_dup_for_wb_valid == 5'h8 | s3_req_cmd_dup_for_wb_valid
     == 5'hc | s3_req_cmd_dup_for_wb_valid == 5'hd | s3_req_cmd_dup_for_wb_valid == 5'he | s3_req_cmd_dup_for_wb_valid
     == 5'hf; // @[CacheConstants.scala 53:114]
  wire  _s3_can_do_amo_write_dup_for_wb_valid_T_21 = _s3_can_do_amo_write_dup_for_wb_valid_T_11 |
    _s3_can_do_amo_write_dup_for_wb_valid_T_20; // @[CacheConstants.scala 54:44]
  wire  _s3_can_do_amo_write_dup_for_wb_valid_T_22 = s3_req_cmd_dup_for_wb_valid == 5'h1 | s3_req_cmd_dup_for_wb_valid
     == 5'h11 | _s3_sc_dup_for_wb_valid_T_3 | _s3_can_do_amo_write_dup_for_wb_valid_T_21; // @[CacheConstants.scala 57:76]
  wire  s3_can_do_amo_write_dup_for_wb_valid = s3_can_do_amo_dup_for_wb_valid &
    _s3_can_do_amo_write_dup_for_wb_valid_T_22 & ~s3_sc_fail_dup_for_wb_valid; // @[MainPipe.scala 1291:117]
  wire  update_data_dup_for_wb_valid = miss_update_meta_dup_for_wb_valid | s3_store_hit_dup_for_wb_valid |
    s3_can_do_amo_write_dup_for_wb_valid; // @[MainPipe.scala 1292:100]
  wire  s3_probe_can_go_dup_for_wb_valid = s3_req_probe_dup_for_wb_valid & io_wb_ready_dup_11; // @[MainPipe.scala 1294:72]
  wire  _s3_store_can_go_dup_for_wb_valid_T_7 = io_data_write_ready_dup_11 | ~update_data_dup_for_wb_valid; // @[MainPipe.scala 1299:38]
  wire  s3_store_can_go_dup_for_wb_valid = _store_update_meta_dup_for_wb_valid_T_2 &
    _s3_store_can_go_dup_for_wb_valid_T_7; // @[MainPipe.scala 1298:66]
  wire  _s3_amo_can_go_dup_for_wb_valid_T_5 = s3_amo_hit_dup_for_wb_valid & _s3_store_can_go_dup_for_wb_valid_T_7; // @[MainPipe.scala 1301:64]
  wire  _s3_amo_can_go_dup_for_wb_valid_T_7 = s3_s_amoalu_dup_for_wb_valid | ~amo_wait_amoalu_dup_for_wb_valid; // @[MainPipe.scala 1303:35]
  wire  s3_amo_can_go_dup_for_wb_valid = _s3_amo_can_go_dup_for_wb_valid_T_5 & _s3_amo_can_go_dup_for_wb_valid_T_7; // @[MainPipe.scala 1302:72]
  wire  _s3_miss_can_go_dup_for_wb_valid_T_5 = miss_update_meta_dup_for_wb_valid & _s3_store_can_go_dup_for_wb_valid_T_7
    ; // @[MainPipe.scala 1305:64]
  wire  _s3_miss_can_go_dup_for_wb_valid_T_8 = _s3_miss_can_go_dup_for_wb_valid_T_5 &
    _s3_amo_can_go_dup_for_wb_valid_T_7; // @[MainPipe.scala 1306:72]
  wire  _s3_miss_can_go_dup_for_wb_valid_T_9 = _s3_miss_can_go_dup_for_wb_valid_T_8 & io_tag_write_ready_dup_11; // @[MainPipe.scala 1307:73]
  wire  s3_miss_can_go_dup_for_wb_valid = _s3_miss_can_go_dup_for_wb_valid_T_9 & io_wb_ready_dup_11; // @[MainPipe.scala 1308:36]
  wire  _s3_replace_can_go_dup_for_wb_valid_T = s3_coh_dup_for_wb_valid_state == 2'h0; // @[MainPipe.scala 1311:36]
  wire  _s3_replace_can_go_dup_for_wb_valid_T_1 = s3_coh_dup_for_wb_valid_state == 2'h0 | io_wb_ready_dup_11; // @[MainPipe.scala 1311:61]
  wire  s3_replace_can_go_dup_for_wb_valid = s3_req_replace_dup_for_wb_valid & _s3_replace_can_go_dup_for_wb_valid_T_1; // @[MainPipe.scala 1310:76]
  wire  _s3_can_go_dup_for_wb_valid_T = s3_probe_can_go_dup_for_wb_valid | s3_store_can_go_dup_for_wb_valid; // @[MainPipe.scala 1312:69]
  wire  _s3_can_go_dup_for_wb_valid_T_1 = _s3_can_go_dup_for_wb_valid_T | s3_amo_can_go_dup_for_wb_valid; // @[MainPipe.scala 1313:38]
  wire  _s3_can_go_dup_for_wb_valid_T_2 = _s3_can_go_dup_for_wb_valid_T_1 | s3_miss_can_go_dup_for_wb_valid; // @[MainPipe.scala 1314:36]
  wire  s3_can_go_dup_for_wb_valid = _s3_can_go_dup_for_wb_valid_T_2 | s3_replace_can_go_dup_for_wb_valid; // @[MainPipe.scala 1315:37]
  wire  s3_fire_dup_for_wb_valid = s3_valid_dup_for_wb_valid & s3_can_go_dup_for_wb_valid; // @[MainPipe.scala 1319:60]
  wire  _GEN_694 = do_amoalu_dup_for_wb_valid | s3_s_amoalu_dup_for_wb_valid; // @[MainPipe.scala 1320:37 1259:45 1320:68]
  wire  s3_replace_nothing_dup_for_wb_valid = s3_req_replace_dup_for_wb_valid & _s3_replace_can_go_dup_for_wb_valid_T; // @[MainPipe.scala 1325:77]
  reg  s3_need_replacement_dup_for_wb_valid; // @[Reg.scala 16:16]
  wire  _miss_wb_dup_for_wb_valid_T_1 = s3_coh_dup_for_wb_valid_state != 2'h0; // @[MainPipe.scala 1343:35]
  wire  miss_wb_dup_for_wb_valid = miss_update_meta_dup_for_wb_valid & s3_need_replacement_dup_for_wb_valid &
    _miss_wb_dup_for_wb_valid_T_1; // @[MainPipe.scala 1342:103]
  wire  need_wb_dup_for_wb_valid = miss_wb_dup_for_wb_valid | s3_req_probe_dup_for_wb_valid |
    s3_req_replace_dup_for_wb_valid; // @[MainPipe.scala 1344:92]
  reg [23:0] s3_tag_dup_for_wb_valid; // @[Reg.scala 16:16]
  wire [3:0] _miss_shrink_param_dup_for_wb_valid_T_6 = {2'h2,s3_coh_dup_for_wb_valid_state}; // @[Cat.scala 31:58]
  wire  _miss_shrink_param_dup_for_wb_valid_T_19 = 4'h8 == _miss_shrink_param_dup_for_wb_valid_T_6; // @[Misc.scala 55:20]
  wire [2:0] _miss_shrink_param_dup_for_wb_valid_T_21 = _miss_shrink_param_dup_for_wb_valid_T_19 ? 3'h5 : 3'h0; // @[Misc.scala 37:36]
  wire  _miss_shrink_param_dup_for_wb_valid_T_23 = 4'h9 == _miss_shrink_param_dup_for_wb_valid_T_6; // @[Misc.scala 55:20]
  wire [2:0] _miss_shrink_param_dup_for_wb_valid_T_25 = _miss_shrink_param_dup_for_wb_valid_T_23 ? 3'h2 :
    _miss_shrink_param_dup_for_wb_valid_T_21; // @[Misc.scala 37:36]
  wire  _miss_shrink_param_dup_for_wb_valid_T_27 = 4'ha == _miss_shrink_param_dup_for_wb_valid_T_6; // @[Misc.scala 55:20]
  wire [2:0] _miss_shrink_param_dup_for_wb_valid_T_29 = _miss_shrink_param_dup_for_wb_valid_T_27 ? 3'h1 :
    _miss_shrink_param_dup_for_wb_valid_T_25; // @[Misc.scala 37:36]
  wire  _miss_shrink_param_dup_for_wb_valid_T_31 = 4'hb == _miss_shrink_param_dup_for_wb_valid_T_6; // @[Misc.scala 55:20]
  wire [2:0] _miss_shrink_param_dup_for_wb_valid_T_33 = _miss_shrink_param_dup_for_wb_valid_T_31 ? 3'h1 :
    _miss_shrink_param_dup_for_wb_valid_T_29; // @[Misc.scala 37:36]
  wire  _miss_shrink_param_dup_for_wb_valid_T_35 = 4'h4 == _miss_shrink_param_dup_for_wb_valid_T_6; // @[Misc.scala 55:20]
  wire [2:0] _miss_shrink_param_dup_for_wb_valid_T_37 = _miss_shrink_param_dup_for_wb_valid_T_35 ? 3'h5 :
    _miss_shrink_param_dup_for_wb_valid_T_33; // @[Misc.scala 37:36]
  wire  _miss_shrink_param_dup_for_wb_valid_T_39 = 4'h5 == _miss_shrink_param_dup_for_wb_valid_T_6; // @[Misc.scala 55:20]
  wire [2:0] _miss_shrink_param_dup_for_wb_valid_T_41 = _miss_shrink_param_dup_for_wb_valid_T_39 ? 3'h4 :
    _miss_shrink_param_dup_for_wb_valid_T_37; // @[Misc.scala 37:36]
  wire  _miss_shrink_param_dup_for_wb_valid_T_43 = 4'h6 == _miss_shrink_param_dup_for_wb_valid_T_6; // @[Misc.scala 55:20]
  wire [2:0] _miss_shrink_param_dup_for_wb_valid_T_45 = _miss_shrink_param_dup_for_wb_valid_T_43 ? 3'h0 :
    _miss_shrink_param_dup_for_wb_valid_T_41; // @[Misc.scala 37:36]
  wire  _miss_shrink_param_dup_for_wb_valid_T_47 = 4'h7 == _miss_shrink_param_dup_for_wb_valid_T_6; // @[Misc.scala 55:20]
  wire [2:0] _miss_shrink_param_dup_for_wb_valid_T_49 = _miss_shrink_param_dup_for_wb_valid_T_47 ? 3'h0 :
    _miss_shrink_param_dup_for_wb_valid_T_45; // @[Misc.scala 37:36]
  wire  _miss_shrink_param_dup_for_wb_valid_T_51 = 4'h0 == _miss_shrink_param_dup_for_wb_valid_T_6; // @[Misc.scala 55:20]
  wire [2:0] _miss_shrink_param_dup_for_wb_valid_T_53 = _miss_shrink_param_dup_for_wb_valid_T_51 ? 3'h5 :
    _miss_shrink_param_dup_for_wb_valid_T_49; // @[Misc.scala 37:36]
  wire  _miss_shrink_param_dup_for_wb_valid_T_55 = 4'h1 == _miss_shrink_param_dup_for_wb_valid_T_6; // @[Misc.scala 55:20]
  wire [2:0] _miss_shrink_param_dup_for_wb_valid_T_57 = _miss_shrink_param_dup_for_wb_valid_T_55 ? 3'h4 :
    _miss_shrink_param_dup_for_wb_valid_T_53; // @[Misc.scala 37:36]
  wire  _miss_shrink_param_dup_for_wb_valid_T_59 = 4'h2 == _miss_shrink_param_dup_for_wb_valid_T_6; // @[Misc.scala 55:20]
  wire [2:0] _miss_shrink_param_dup_for_wb_valid_T_61 = _miss_shrink_param_dup_for_wb_valid_T_59 ? 3'h3 :
    _miss_shrink_param_dup_for_wb_valid_T_57; // @[Misc.scala 37:36]
  wire  _miss_shrink_param_dup_for_wb_valid_T_63 = 4'h3 == _miss_shrink_param_dup_for_wb_valid_T_6; // @[Misc.scala 55:20]
  wire [2:0] miss_shrink_param_dup_for_wb_valid = _miss_shrink_param_dup_for_wb_valid_T_63 ? 3'h3 :
    _miss_shrink_param_dup_for_wb_valid_T_61; // @[Misc.scala 37:36]
  reg  writeback_data_dup_for_wb_valid_r; // @[Reg.scala 16:16]
  wire  _writeback_data_dup_for_wb_valid_T_2 = s3_coh_dup_for_wb_valid_state == 2'h3; // @[Metadata.scala 44:36]
  wire  _writeback_data_dup_for_wb_valid_T_3 = s3_tag_match_dup_for_wb_valid & s3_req_probe_dup_for_wb_valid &
    writeback_data_dup_for_wb_valid_r | _writeback_data_dup_for_wb_valid_T_2; // @[MainPipe.scala 1356:120]
  wire  _GEN_703 = s3_fire_dup_for_wb_valid ? 1'h0 : s3_valid_dup_for_wb_valid; // @[MainPipe.scala 1363:40 1257:42 1363:68]
  wire  s3_fire = s3_valid_dup_4 & s3_can_go; // @[MainPipe.scala 1367:33]
  wire  _GEN_705 = s3_fire ? 1'h0 : s3_valid; // @[MainPipe.scala 1372:24 1373:14 441:25]
  wire  _GEN_706 = s3_fire ? 1'h0 : s3_valid_dup_0; // @[MainPipe.scala 1372:24 1374:28 472:29]
  wire  _GEN_707 = s3_fire ? 1'h0 : s3_valid_dup_1; // @[MainPipe.scala 1372:24 1374:28 472:29]
  wire  _GEN_709 = s3_fire ? 1'h0 : s3_valid_dup_3; // @[MainPipe.scala 1372:24 1374:28 472:29]
  wire  _GEN_710 = s3_fire ? 1'h0 : s3_valid_dup_4; // @[MainPipe.scala 1372:24 1374:28 472:29]
  wire  _GEN_711 = s3_fire ? 1'h0 : s3_valid_dup_5; // @[MainPipe.scala 1372:24 1374:28 472:29]
  wire  _GEN_712 = s3_fire ? 1'h0 : s3_valid_dup_6; // @[MainPipe.scala 1372:24 1374:28 472:29]
  wire  _GEN_713 = s3_fire ? 1'h0 : s3_valid_dup_7; // @[MainPipe.scala 1372:24 1374:28 472:29]
  wire  _GEN_714 = s3_fire ? 1'h0 : s3_valid_dup_8; // @[MainPipe.scala 1372:24 1374:28 472:29]
  wire  _GEN_715 = s3_fire ? 1'h0 : s3_valid_dup_9; // @[MainPipe.scala 1372:24 1374:28 472:29]
  wire  _GEN_716 = s3_fire ? 1'h0 : s3_valid_dup_10; // @[MainPipe.scala 1372:24 1374:28 472:29]
  wire  _GEN_717 = s3_fire ? 1'h0 : s3_valid_dup_11; // @[MainPipe.scala 1372:24 1374:28 472:29]
  wire  _GEN_720 = s3_fire ? 1'h0 : s3_valid_dup_for_status_0; // @[MainPipe.scala 1372:24 1375:39 473:40]
  wire  _GEN_721 = s3_fire ? 1'h0 : s3_valid_dup_for_status_1; // @[MainPipe.scala 1372:24 1375:39 473:40]
  wire  _GEN_722 = s3_fire ? 1'h0 : s3_valid_dup_for_status_2; // @[MainPipe.scala 1372:24 1375:39 473:40]
  wire  _GEN_723 = s3_fire ? 1'h0 : s3_valid_dup_for_status_3; // @[MainPipe.scala 1372:24 1375:39 473:40]
  wire  _GEN_724 = s3_fire ? 1'h0 : s3_valid_dup_for_status_4; // @[MainPipe.scala 1372:24 1375:39 473:40]
  wire  _GEN_725 = s3_fire ? 1'h0 : s3_valid_dup_for_status_5; // @[MainPipe.scala 1372:24 1375:39 473:40]
  wire  _GEN_726 = s3_fire ? 1'h0 : s3_valid_dup_for_status_6; // @[MainPipe.scala 1372:24 1375:39 473:40]
  wire  _GEN_727 = s3_fire ? 1'h0 : s3_valid_dup_for_status_7; // @[MainPipe.scala 1372:24 1375:39 473:40]
  wire  _GEN_728 = s3_fire ? 1'h0 : s3_valid_dup_for_status_8; // @[MainPipe.scala 1372:24 1375:39 473:40]
  wire  _GEN_729 = s3_fire ? 1'h0 : s3_valid_dup_for_status_9; // @[MainPipe.scala 1372:24 1375:39 473:40]
  wire  _GEN_730 = s3_fire ? 1'h0 : s3_valid_dup_for_status_10; // @[MainPipe.scala 1372:24 1375:39 473:40]
  wire  _GEN_731 = s3_fire ? 1'h0 : s3_valid_dup_for_status_11; // @[MainPipe.scala 1372:24 1375:39 473:40]
  wire  _GEN_732 = s3_fire ? 1'h0 : s3_valid_dup_for_status_12; // @[MainPipe.scala 1372:24 1375:39 473:40]
  wire  _GEN_733 = s3_fire ? 1'h0 : s3_valid_dup_for_status_13; // @[MainPipe.scala 1372:24 1375:39 473:40]
  wire  _GEN_734 = s3_fire ? 1'h0 : s3_valid_dup_for_status_14; // @[MainPipe.scala 1372:24 1375:39 473:40]
  wire  _GEN_735 = s3_fire ? 1'h0 : s3_valid_dup_for_status_15; // @[MainPipe.scala 1372:24 1375:39 473:40]
  wire  _GEN_736 = s3_fire ? 1'h0 : s3_valid_dup_for_status_16; // @[MainPipe.scala 1372:24 1375:39 473:40]
  wire  _GEN_737 = s3_fire ? 1'h0 : s3_valid_dup_for_status_17; // @[MainPipe.scala 1372:24 1375:39 473:40]
  wire  _GEN_738 = s3_fire ? 1'h0 : s3_valid_dup_for_status_18; // @[MainPipe.scala 1372:24 1375:39 473:40]
  wire  _GEN_739 = s3_fire ? 1'h0 : s3_valid_dup_for_status_19; // @[MainPipe.scala 1372:24 1375:39 473:40]
  wire  _GEN_740 = s3_fire ? 1'h0 : s3_valid_dup_for_status_20; // @[MainPipe.scala 1372:24 1375:39 473:40]
  wire  _GEN_741 = s3_fire ? 1'h0 : s3_valid_dup_for_status_21; // @[MainPipe.scala 1372:24 1375:39 473:40]
  wire  _GEN_742 = s3_fire ? 1'h0 : s3_valid_dup_for_status_22; // @[MainPipe.scala 1372:24 1375:39 473:40]
  wire  _GEN_743 = s3_fire ? 1'h0 : s3_valid_dup_for_status_23; // @[MainPipe.scala 1372:24 1375:39 473:40]
  wire  _io_meta_read_valid_T_2 = req_valid & s1_ready & _s0_can_go_T_2; // @[MainPipe.scala 1389:47]
  wire [63:0] _io_release_update_bits_data_T__0 = s3_sc ? s3_sc_data_merged_0 : s3_store_data_merged_0; // @[MainPipe.scala 1441:8]
  wire [63:0] _io_release_update_bits_data_T__1 = s3_sc ? s3_sc_data_merged_1 : s3_store_data_merged_1; // @[MainPipe.scala 1441:8]
  wire [63:0] _io_release_update_bits_data_T__2 = s3_sc ? s3_sc_data_merged_2 : s3_store_data_merged_2; // @[MainPipe.scala 1441:8]
  wire [63:0] _io_release_update_bits_data_T__3 = s3_sc ? s3_sc_data_merged_3 : s3_store_data_merged_3; // @[MainPipe.scala 1441:8]
  wire [63:0] _io_release_update_bits_data_T__4 = s3_sc ? s3_sc_data_merged_4 : s3_store_data_merged_4; // @[MainPipe.scala 1441:8]
  wire [63:0] _io_release_update_bits_data_T__5 = s3_sc ? s3_sc_data_merged_5 : s3_store_data_merged_5; // @[MainPipe.scala 1441:8]
  wire [63:0] _io_release_update_bits_data_T__6 = s3_sc ? s3_sc_data_merged_6 : s3_store_data_merged_6; // @[MainPipe.scala 1441:8]
  wire [63:0] _io_release_update_bits_data_T__7 = s3_sc ? s3_sc_data_merged_7 : s3_store_data_merged_7; // @[MainPipe.scala 1441:8]
  wire [63:0] _io_release_update_bits_data_T_1_0 = amo_wait_amoalu ? s3_amo_data_merged_reg_0 :
    _io_release_update_bits_data_T__0; // @[MainPipe.scala 1438:37]
  wire [63:0] _io_release_update_bits_data_T_1_1 = amo_wait_amoalu ? s3_amo_data_merged_reg_1 :
    _io_release_update_bits_data_T__1; // @[MainPipe.scala 1438:37]
  wire [63:0] _io_release_update_bits_data_T_1_2 = amo_wait_amoalu ? s3_amo_data_merged_reg_2 :
    _io_release_update_bits_data_T__2; // @[MainPipe.scala 1438:37]
  wire [63:0] _io_release_update_bits_data_T_1_3 = amo_wait_amoalu ? s3_amo_data_merged_reg_3 :
    _io_release_update_bits_data_T__3; // @[MainPipe.scala 1438:37]
  wire [63:0] _io_release_update_bits_data_T_1_4 = amo_wait_amoalu ? s3_amo_data_merged_reg_4 :
    _io_release_update_bits_data_T__4; // @[MainPipe.scala 1438:37]
  wire [63:0] _io_release_update_bits_data_T_1_5 = amo_wait_amoalu ? s3_amo_data_merged_reg_5 :
    _io_release_update_bits_data_T__5; // @[MainPipe.scala 1438:37]
  wire [63:0] _io_release_update_bits_data_T_1_6 = amo_wait_amoalu ? s3_amo_data_merged_reg_6 :
    _io_release_update_bits_data_T__6; // @[MainPipe.scala 1438:37]
  wire [63:0] _io_release_update_bits_data_T_1_7 = amo_wait_amoalu ? s3_amo_data_merged_reg_7 :
    _io_release_update_bits_data_T__7; // @[MainPipe.scala 1438:37]
  wire [255:0] io_release_update_bits_data_lo = {_io_release_update_bits_data_T_1_3,_io_release_update_bits_data_T_1_2,
    _io_release_update_bits_data_T_1_1,_io_release_update_bits_data_T_1_0}; // @[MainPipe.scala 1446:5]
  wire [255:0] io_release_update_bits_data_hi = {_io_release_update_bits_data_T_1_7,_io_release_update_bits_data_T_1_6,
    _io_release_update_bits_data_T_1_5,_io_release_update_bits_data_T_1_4}; // @[MainPipe.scala 1446:5]
  wire [63:0] atomic_hit_resp_data = s3_sc ? {{63'd0}, s3_sc_fail} : s3_data_word; // @[MainPipe.scala 1449:30]
  wire  atomic_replay_resp_valid = s2_valid_dup_6 & s2_can_go_to_mq_dup_2 & replay & _s2_can_go_to_s3_T_3; // @[MainPipe.scala 1464:86]
  wire  atomic_hit_resp_valid = s3_valid_dup_10 & (s3_amo_can_go | s3_miss_can_go & _s3_can_do_amo_T_2); // @[MainPipe.scala 1465:48]
  wire [3:0] atomic_hit_resp_id = {{3'd0}, lrsc_valid_dup_2}; // @[MainPipe.scala 1448:29 1455:22]
  wire [63:0] _T_214_0 = s3_sc_dup_for_data_wvalid ? s3_sc_data_merged_dup_for_data_wvalid_0 : s3_store_data_merged_0; // @[MainPipe.scala 1515:8]
  wire [63:0] _T_214_1 = s3_sc_dup_for_data_wvalid ? s3_sc_data_merged_dup_for_data_wvalid_1 : s3_store_data_merged_1; // @[MainPipe.scala 1515:8]
  wire [63:0] _T_214_2 = s3_sc_dup_for_data_wvalid ? s3_sc_data_merged_dup_for_data_wvalid_2 : s3_store_data_merged_2; // @[MainPipe.scala 1515:8]
  wire [63:0] _T_214_3 = s3_sc_dup_for_data_wvalid ? s3_sc_data_merged_dup_for_data_wvalid_3 : s3_store_data_merged_3; // @[MainPipe.scala 1515:8]
  wire [63:0] _T_214_4 = s3_sc_dup_for_data_wvalid ? s3_sc_data_merged_dup_for_data_wvalid_4 : s3_store_data_merged_4; // @[MainPipe.scala 1515:8]
  wire [63:0] _T_214_5 = s3_sc_dup_for_data_wvalid ? s3_sc_data_merged_dup_for_data_wvalid_5 : s3_store_data_merged_5; // @[MainPipe.scala 1515:8]
  wire [63:0] _T_214_6 = s3_sc_dup_for_data_wvalid ? s3_sc_data_merged_dup_for_data_wvalid_6 : s3_store_data_merged_6; // @[MainPipe.scala 1515:8]
  wire [63:0] _T_214_7 = s3_sc_dup_for_data_wvalid ? s3_sc_data_merged_dup_for_data_wvalid_7 : s3_store_data_merged_7; // @[MainPipe.scala 1515:8]
  wire  _io_wb_valid_T_5 = s3_req_replace_dup_for_wb_valid & ~s3_replace_nothing_dup_for_wb_valid |
    s3_req_probe_dup_for_wb_valid; // @[MainPipe.scala 1527:77]
  wire  _io_wb_valid_T_16 = _io_wb_valid_T_5 | _s3_miss_can_go_dup_for_wb_valid_T_9; // @[MainPipe.scala 1529:99]
  wire  _io_wb_valid_T_17 = s3_valid_dup_for_wb_valid & _io_wb_valid_T_16; // @[MainPipe.scala 1525:44]
  wire [35:0] _io_wb_bits_addr_T_1 = {s3_tag_dup_for_wb_valid,s3_req_vaddr[11:0]}; // @[Cat.scala 31:58]
  wire [255:0] io_wb_bits_data_lo = {s3_data_3,s3_data_2,s3_data_1,s3_data_0}; // @[MainPipe.scala 1543:36]
  wire [255:0] io_wb_bits_data_hi = {s3_data_7,s3_data_6,s3_data_5,s3_data_4}; // @[MainPipe.scala 1543:36]
  reg  io_replace_access_valid_REG; // @[MainPipe.scala 1547:37]
  wire [3:0] io_replace_access_bits_way_hi = s1_way_en[7:4]; // @[OneHot.scala 30:18]
  wire [3:0] io_replace_access_bits_way_lo = s1_way_en[3:0]; // @[OneHot.scala 31:18]
  wire  _io_replace_access_bits_way_T = |io_replace_access_bits_way_hi; // @[OneHot.scala 32:14]
  wire [3:0] _io_replace_access_bits_way_T_1 = io_replace_access_bits_way_hi | io_replace_access_bits_way_lo; // @[OneHot.scala 32:28]
  wire [1:0] io_replace_access_bits_way_hi_1 = _io_replace_access_bits_way_T_1[3:2]; // @[OneHot.scala 30:18]
  wire [1:0] io_replace_access_bits_way_lo_1 = _io_replace_access_bits_way_T_1[1:0]; // @[OneHot.scala 31:18]
  wire  _io_replace_access_bits_way_T_2 = |io_replace_access_bits_way_hi_1; // @[OneHot.scala 32:14]
  wire [1:0] _io_replace_access_bits_way_T_3 = io_replace_access_bits_way_hi_1 | io_replace_access_bits_way_lo_1; // @[OneHot.scala 32:28]
  wire [1:0] _io_replace_access_bits_way_T_5 = {_io_replace_access_bits_way_T_2,_io_replace_access_bits_way_T_3[1]}; // @[Cat.scala 31:58]
  reg [2:0] io_replace_access_bits_way_REG; // @[MainPipe.scala 1549:40]
  reg [5:0] io_status_dup_0_s1_bits_set_r; // @[Reg.scala 16:16]
  reg  io_status_dup_0_s2_valid_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_0_s2_bits_set_r; // @[Reg.scala 16:16]
  reg [7:0] io_status_dup_0_s2_bits_way_en_r; // @[Reg.scala 16:16]
  reg  io_status_dup_0_s3_valid_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_0_s3_bits_set_r; // @[Reg.scala 16:16]
  reg [7:0] io_status_dup_0_s3_bits_way_en_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_1_s1_bits_set_r; // @[Reg.scala 16:16]
  reg  io_status_dup_1_s2_valid_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_1_s2_bits_set_r; // @[Reg.scala 16:16]
  reg [7:0] io_status_dup_1_s2_bits_way_en_r; // @[Reg.scala 16:16]
  reg  io_status_dup_1_s3_valid_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_1_s3_bits_set_r; // @[Reg.scala 16:16]
  reg [7:0] io_status_dup_1_s3_bits_way_en_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_2_s1_bits_set_r; // @[Reg.scala 16:16]
  reg  io_status_dup_2_s2_valid_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_2_s2_bits_set_r; // @[Reg.scala 16:16]
  reg [7:0] io_status_dup_2_s2_bits_way_en_r; // @[Reg.scala 16:16]
  reg  io_status_dup_2_s3_valid_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_2_s3_bits_set_r; // @[Reg.scala 16:16]
  reg [7:0] io_status_dup_2_s3_bits_way_en_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_3_s1_bits_set_r; // @[Reg.scala 16:16]
  reg  io_status_dup_3_s2_valid_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_3_s2_bits_set_r; // @[Reg.scala 16:16]
  reg [7:0] io_status_dup_3_s2_bits_way_en_r; // @[Reg.scala 16:16]
  reg  io_status_dup_3_s3_valid_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_3_s3_bits_set_r; // @[Reg.scala 16:16]
  reg [7:0] io_status_dup_3_s3_bits_way_en_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_4_s1_bits_set_r; // @[Reg.scala 16:16]
  reg  io_status_dup_4_s2_valid_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_4_s2_bits_set_r; // @[Reg.scala 16:16]
  reg [7:0] io_status_dup_4_s2_bits_way_en_r; // @[Reg.scala 16:16]
  reg  io_status_dup_4_s3_valid_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_4_s3_bits_set_r; // @[Reg.scala 16:16]
  reg [7:0] io_status_dup_4_s3_bits_way_en_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_5_s1_bits_set_r; // @[Reg.scala 16:16]
  reg  io_status_dup_5_s2_valid_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_5_s2_bits_set_r; // @[Reg.scala 16:16]
  reg [7:0] io_status_dup_5_s2_bits_way_en_r; // @[Reg.scala 16:16]
  reg  io_status_dup_5_s3_valid_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_5_s3_bits_set_r; // @[Reg.scala 16:16]
  reg [7:0] io_status_dup_5_s3_bits_way_en_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_6_s1_bits_set_r; // @[Reg.scala 16:16]
  reg  io_status_dup_6_s2_valid_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_6_s2_bits_set_r; // @[Reg.scala 16:16]
  reg [7:0] io_status_dup_6_s2_bits_way_en_r; // @[Reg.scala 16:16]
  reg  io_status_dup_6_s3_valid_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_6_s3_bits_set_r; // @[Reg.scala 16:16]
  reg [7:0] io_status_dup_6_s3_bits_way_en_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_7_s1_bits_set_r; // @[Reg.scala 16:16]
  reg  io_status_dup_7_s2_valid_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_7_s2_bits_set_r; // @[Reg.scala 16:16]
  reg [7:0] io_status_dup_7_s2_bits_way_en_r; // @[Reg.scala 16:16]
  reg  io_status_dup_7_s3_valid_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_7_s3_bits_set_r; // @[Reg.scala 16:16]
  reg [7:0] io_status_dup_7_s3_bits_way_en_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_8_s1_bits_set_r; // @[Reg.scala 16:16]
  reg  io_status_dup_8_s2_valid_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_8_s2_bits_set_r; // @[Reg.scala 16:16]
  reg [7:0] io_status_dup_8_s2_bits_way_en_r; // @[Reg.scala 16:16]
  reg  io_status_dup_8_s3_valid_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_8_s3_bits_set_r; // @[Reg.scala 16:16]
  reg [7:0] io_status_dup_8_s3_bits_way_en_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_9_s1_bits_set_r; // @[Reg.scala 16:16]
  reg  io_status_dup_9_s2_valid_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_9_s2_bits_set_r; // @[Reg.scala 16:16]
  reg [7:0] io_status_dup_9_s2_bits_way_en_r; // @[Reg.scala 16:16]
  reg  io_status_dup_9_s3_valid_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_9_s3_bits_set_r; // @[Reg.scala 16:16]
  reg [7:0] io_status_dup_9_s3_bits_way_en_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_10_s1_bits_set_r; // @[Reg.scala 16:16]
  reg  io_status_dup_10_s2_valid_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_10_s2_bits_set_r; // @[Reg.scala 16:16]
  reg [7:0] io_status_dup_10_s2_bits_way_en_r; // @[Reg.scala 16:16]
  reg  io_status_dup_10_s3_valid_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_10_s3_bits_set_r; // @[Reg.scala 16:16]
  reg [7:0] io_status_dup_10_s3_bits_way_en_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_11_s1_bits_set_r; // @[Reg.scala 16:16]
  reg  io_status_dup_11_s2_valid_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_11_s2_bits_set_r; // @[Reg.scala 16:16]
  reg [7:0] io_status_dup_11_s2_bits_way_en_r; // @[Reg.scala 16:16]
  reg  io_status_dup_11_s3_valid_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_11_s3_bits_set_r; // @[Reg.scala 16:16]
  reg [7:0] io_status_dup_11_s3_bits_way_en_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_12_s1_bits_set_r; // @[Reg.scala 16:16]
  reg  io_status_dup_12_s2_valid_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_12_s2_bits_set_r; // @[Reg.scala 16:16]
  reg [7:0] io_status_dup_12_s2_bits_way_en_r; // @[Reg.scala 16:16]
  reg  io_status_dup_12_s3_valid_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_12_s3_bits_set_r; // @[Reg.scala 16:16]
  reg [7:0] io_status_dup_12_s3_bits_way_en_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_13_s1_bits_set_r; // @[Reg.scala 16:16]
  reg  io_status_dup_13_s2_valid_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_13_s2_bits_set_r; // @[Reg.scala 16:16]
  reg [7:0] io_status_dup_13_s2_bits_way_en_r; // @[Reg.scala 16:16]
  reg  io_status_dup_13_s3_valid_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_13_s3_bits_set_r; // @[Reg.scala 16:16]
  reg [7:0] io_status_dup_13_s3_bits_way_en_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_14_s1_bits_set_r; // @[Reg.scala 16:16]
  reg  io_status_dup_14_s2_valid_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_14_s2_bits_set_r; // @[Reg.scala 16:16]
  reg [7:0] io_status_dup_14_s2_bits_way_en_r; // @[Reg.scala 16:16]
  reg  io_status_dup_14_s3_valid_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_14_s3_bits_set_r; // @[Reg.scala 16:16]
  reg [7:0] io_status_dup_14_s3_bits_way_en_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_15_s1_bits_set_r; // @[Reg.scala 16:16]
  reg  io_status_dup_15_s2_valid_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_15_s2_bits_set_r; // @[Reg.scala 16:16]
  reg [7:0] io_status_dup_15_s2_bits_way_en_r; // @[Reg.scala 16:16]
  reg  io_status_dup_15_s3_valid_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_15_s3_bits_set_r; // @[Reg.scala 16:16]
  reg [7:0] io_status_dup_15_s3_bits_way_en_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_16_s1_bits_set_r; // @[Reg.scala 16:16]
  reg  io_status_dup_16_s2_valid_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_16_s2_bits_set_r; // @[Reg.scala 16:16]
  reg [7:0] io_status_dup_16_s2_bits_way_en_r; // @[Reg.scala 16:16]
  reg  io_status_dup_16_s3_valid_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_16_s3_bits_set_r; // @[Reg.scala 16:16]
  reg [7:0] io_status_dup_16_s3_bits_way_en_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_17_s1_bits_set_r; // @[Reg.scala 16:16]
  reg  io_status_dup_17_s2_valid_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_17_s2_bits_set_r; // @[Reg.scala 16:16]
  reg [7:0] io_status_dup_17_s2_bits_way_en_r; // @[Reg.scala 16:16]
  reg  io_status_dup_17_s3_valid_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_17_s3_bits_set_r; // @[Reg.scala 16:16]
  reg [7:0] io_status_dup_17_s3_bits_way_en_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_18_s1_bits_set_r; // @[Reg.scala 16:16]
  reg  io_status_dup_18_s2_valid_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_18_s2_bits_set_r; // @[Reg.scala 16:16]
  reg [7:0] io_status_dup_18_s2_bits_way_en_r; // @[Reg.scala 16:16]
  reg  io_status_dup_18_s3_valid_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_18_s3_bits_set_r; // @[Reg.scala 16:16]
  reg [7:0] io_status_dup_18_s3_bits_way_en_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_19_s1_bits_set_r; // @[Reg.scala 16:16]
  reg  io_status_dup_19_s2_valid_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_19_s2_bits_set_r; // @[Reg.scala 16:16]
  reg [7:0] io_status_dup_19_s2_bits_way_en_r; // @[Reg.scala 16:16]
  reg  io_status_dup_19_s3_valid_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_19_s3_bits_set_r; // @[Reg.scala 16:16]
  reg [7:0] io_status_dup_19_s3_bits_way_en_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_20_s1_bits_set_r; // @[Reg.scala 16:16]
  reg  io_status_dup_20_s2_valid_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_20_s2_bits_set_r; // @[Reg.scala 16:16]
  reg [7:0] io_status_dup_20_s2_bits_way_en_r; // @[Reg.scala 16:16]
  reg  io_status_dup_20_s3_valid_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_20_s3_bits_set_r; // @[Reg.scala 16:16]
  reg [7:0] io_status_dup_20_s3_bits_way_en_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_21_s1_bits_set_r; // @[Reg.scala 16:16]
  reg  io_status_dup_21_s2_valid_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_21_s2_bits_set_r; // @[Reg.scala 16:16]
  reg [7:0] io_status_dup_21_s2_bits_way_en_r; // @[Reg.scala 16:16]
  reg  io_status_dup_21_s3_valid_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_21_s3_bits_set_r; // @[Reg.scala 16:16]
  reg [7:0] io_status_dup_21_s3_bits_way_en_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_22_s1_bits_set_r; // @[Reg.scala 16:16]
  reg  io_status_dup_22_s2_valid_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_22_s2_bits_set_r; // @[Reg.scala 16:16]
  reg [7:0] io_status_dup_22_s2_bits_way_en_r; // @[Reg.scala 16:16]
  reg  io_status_dup_22_s3_valid_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_22_s3_bits_set_r; // @[Reg.scala 16:16]
  reg [7:0] io_status_dup_22_s3_bits_way_en_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_23_s1_bits_set_r; // @[Reg.scala 16:16]
  reg  io_status_dup_23_s2_valid_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_23_s2_bits_set_r; // @[Reg.scala 16:16]
  reg [7:0] io_status_dup_23_s2_bits_way_en_r; // @[Reg.scala 16:16]
  reg  io_status_dup_23_s3_valid_r; // @[Reg.scala 16:16]
  reg [5:0] io_status_dup_23_s3_bits_set_r; // @[Reg.scala 16:16]
  reg [7:0] io_status_dup_23_s3_bits_way_en_r; // @[Reg.scala 16:16]
  reg  io_error_valid_REG; // @[MainPipe.scala 1583:40]
  reg  io_error_report_to_beu_r; // @[Reg.scala 16:16]
  reg  io_error_report_to_beu_REG; // @[MainPipe.scala 1586:91]
  reg [35:0] io_error_paddr_r; // @[Reg.scala 16:16]
  reg  io_error_source_tag_r; // @[Reg.scala 16:16]
  wire  _io_error_source_l2_T = s2_flag_error | s2_req_error; // @[MainPipe.scala 1590:49]
  reg  io_error_source_l2_r; // @[Reg.scala 16:16]
  wire  _io_error_opType_store_T_2 = _s2_can_go_to_s3_T_2 & _s2_amo_hit_T; // @[MainPipe.scala 1591:53]
  reg  io_error_opType_store_r; // @[Reg.scala 16:16]
  reg  io_error_opType_probe_r; // @[Reg.scala 16:16]
  reg  io_error_opType_release_r; // @[Reg.scala 16:16]
  wire  _io_error_opType_atom_T_2 = _s2_can_go_to_s3_T_3 & _s2_amo_hit_T; // @[MainPipe.scala 1594:50]
  reg  io_error_opType_atom_r; // @[Reg.scala 16:16]
  wire [1:0] _T_234 = s0_fire + s1_valid; // @[Bitwise.scala 48:55]
  wire [1:0] _T_236 = s2_valid + s3_valid; // @[Bitwise.scala 48:55]
  reg  io_perf_0_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg  io_perf_0_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg [2:0] io_perf_1_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg [2:0] io_perf_1_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  Arbiter_21 main_pipe_req_arb ( // @[DCacheWrapper.scala 208:21]
    .io_in_0_ready(main_pipe_req_arb_io_in_0_ready),
    .io_in_0_valid(main_pipe_req_arb_io_in_0_valid),
    .io_in_0_bits_miss(main_pipe_req_arb_io_in_0_bits_miss),
    .io_in_0_bits_miss_id(main_pipe_req_arb_io_in_0_bits_miss_id),
    .io_in_0_bits_miss_param(main_pipe_req_arb_io_in_0_bits_miss_param),
    .io_in_0_bits_miss_dirty(main_pipe_req_arb_io_in_0_bits_miss_dirty),
    .io_in_0_bits_miss_way_en(main_pipe_req_arb_io_in_0_bits_miss_way_en),
    .io_in_0_bits_probe(main_pipe_req_arb_io_in_0_bits_probe),
    .io_in_0_bits_probe_param(main_pipe_req_arb_io_in_0_bits_probe_param),
    .io_in_0_bits_probe_need_data(main_pipe_req_arb_io_in_0_bits_probe_need_data),
    .io_in_0_bits_source(main_pipe_req_arb_io_in_0_bits_source),
    .io_in_0_bits_cmd(main_pipe_req_arb_io_in_0_bits_cmd),
    .io_in_0_bits_vaddr(main_pipe_req_arb_io_in_0_bits_vaddr),
    .io_in_0_bits_addr(main_pipe_req_arb_io_in_0_bits_addr),
    .io_in_0_bits_store_data(main_pipe_req_arb_io_in_0_bits_store_data),
    .io_in_0_bits_store_mask(main_pipe_req_arb_io_in_0_bits_store_mask),
    .io_in_0_bits_word_idx(main_pipe_req_arb_io_in_0_bits_word_idx),
    .io_in_0_bits_amo_data(main_pipe_req_arb_io_in_0_bits_amo_data),
    .io_in_0_bits_amo_mask(main_pipe_req_arb_io_in_0_bits_amo_mask),
    .io_in_0_bits_error(main_pipe_req_arb_io_in_0_bits_error),
    .io_in_0_bits_replace(main_pipe_req_arb_io_in_0_bits_replace),
    .io_in_0_bits_replace_way_en(main_pipe_req_arb_io_in_0_bits_replace_way_en),
    .io_in_0_bits_id(main_pipe_req_arb_io_in_0_bits_id),
    .io_in_1_ready(main_pipe_req_arb_io_in_1_ready),
    .io_in_1_valid(main_pipe_req_arb_io_in_1_valid),
    .io_in_1_bits_miss(main_pipe_req_arb_io_in_1_bits_miss),
    .io_in_1_bits_miss_id(main_pipe_req_arb_io_in_1_bits_miss_id),
    .io_in_1_bits_miss_param(main_pipe_req_arb_io_in_1_bits_miss_param),
    .io_in_1_bits_miss_dirty(main_pipe_req_arb_io_in_1_bits_miss_dirty),
    .io_in_1_bits_miss_way_en(main_pipe_req_arb_io_in_1_bits_miss_way_en),
    .io_in_1_bits_probe(main_pipe_req_arb_io_in_1_bits_probe),
    .io_in_1_bits_probe_param(main_pipe_req_arb_io_in_1_bits_probe_param),
    .io_in_1_bits_probe_need_data(main_pipe_req_arb_io_in_1_bits_probe_need_data),
    .io_in_1_bits_source(main_pipe_req_arb_io_in_1_bits_source),
    .io_in_1_bits_cmd(main_pipe_req_arb_io_in_1_bits_cmd),
    .io_in_1_bits_vaddr(main_pipe_req_arb_io_in_1_bits_vaddr),
    .io_in_1_bits_addr(main_pipe_req_arb_io_in_1_bits_addr),
    .io_in_1_bits_store_data(main_pipe_req_arb_io_in_1_bits_store_data),
    .io_in_1_bits_store_mask(main_pipe_req_arb_io_in_1_bits_store_mask),
    .io_in_1_bits_word_idx(main_pipe_req_arb_io_in_1_bits_word_idx),
    .io_in_1_bits_amo_data(main_pipe_req_arb_io_in_1_bits_amo_data),
    .io_in_1_bits_amo_mask(main_pipe_req_arb_io_in_1_bits_amo_mask),
    .io_in_1_bits_error(main_pipe_req_arb_io_in_1_bits_error),
    .io_in_1_bits_replace(main_pipe_req_arb_io_in_1_bits_replace),
    .io_in_1_bits_replace_way_en(main_pipe_req_arb_io_in_1_bits_replace_way_en),
    .io_in_1_bits_id(main_pipe_req_arb_io_in_1_bits_id),
    .io_in_2_ready(main_pipe_req_arb_io_in_2_ready),
    .io_in_2_valid(main_pipe_req_arb_io_in_2_valid),
    .io_in_2_bits_miss_id(main_pipe_req_arb_io_in_2_bits_miss_id),
    .io_in_2_bits_probe(main_pipe_req_arb_io_in_2_bits_probe),
    .io_in_2_bits_probe_param(main_pipe_req_arb_io_in_2_bits_probe_param),
    .io_in_2_bits_probe_need_data(main_pipe_req_arb_io_in_2_bits_probe_need_data),
    .io_in_2_bits_source(main_pipe_req_arb_io_in_2_bits_source),
    .io_in_2_bits_cmd(main_pipe_req_arb_io_in_2_bits_cmd),
    .io_in_2_bits_vaddr(main_pipe_req_arb_io_in_2_bits_vaddr),
    .io_in_2_bits_addr(main_pipe_req_arb_io_in_2_bits_addr),
    .io_in_2_bits_store_data(main_pipe_req_arb_io_in_2_bits_store_data),
    .io_in_2_bits_store_mask(main_pipe_req_arb_io_in_2_bits_store_mask),
    .io_in_2_bits_replace(main_pipe_req_arb_io_in_2_bits_replace),
    .io_in_2_bits_replace_way_en(main_pipe_req_arb_io_in_2_bits_replace_way_en),
    .io_in_2_bits_id(main_pipe_req_arb_io_in_2_bits_id),
    .io_in_3_ready(main_pipe_req_arb_io_in_3_ready),
    .io_in_3_valid(main_pipe_req_arb_io_in_3_valid),
    .io_in_3_bits_miss(main_pipe_req_arb_io_in_3_bits_miss),
    .io_in_3_bits_miss_id(main_pipe_req_arb_io_in_3_bits_miss_id),
    .io_in_3_bits_miss_param(main_pipe_req_arb_io_in_3_bits_miss_param),
    .io_in_3_bits_miss_dirty(main_pipe_req_arb_io_in_3_bits_miss_dirty),
    .io_in_3_bits_miss_way_en(main_pipe_req_arb_io_in_3_bits_miss_way_en),
    .io_in_3_bits_probe(main_pipe_req_arb_io_in_3_bits_probe),
    .io_in_3_bits_probe_param(main_pipe_req_arb_io_in_3_bits_probe_param),
    .io_in_3_bits_probe_need_data(main_pipe_req_arb_io_in_3_bits_probe_need_data),
    .io_in_3_bits_source(main_pipe_req_arb_io_in_3_bits_source),
    .io_in_3_bits_cmd(main_pipe_req_arb_io_in_3_bits_cmd),
    .io_in_3_bits_vaddr(main_pipe_req_arb_io_in_3_bits_vaddr),
    .io_in_3_bits_addr(main_pipe_req_arb_io_in_3_bits_addr),
    .io_in_3_bits_store_data(main_pipe_req_arb_io_in_3_bits_store_data),
    .io_in_3_bits_store_mask(main_pipe_req_arb_io_in_3_bits_store_mask),
    .io_in_3_bits_word_idx(main_pipe_req_arb_io_in_3_bits_word_idx),
    .io_in_3_bits_amo_data(main_pipe_req_arb_io_in_3_bits_amo_data),
    .io_in_3_bits_amo_mask(main_pipe_req_arb_io_in_3_bits_amo_mask),
    .io_in_3_bits_error(main_pipe_req_arb_io_in_3_bits_error),
    .io_in_3_bits_replace(main_pipe_req_arb_io_in_3_bits_replace),
    .io_in_3_bits_replace_way_en(main_pipe_req_arb_io_in_3_bits_replace_way_en),
    .io_in_3_bits_id(main_pipe_req_arb_io_in_3_bits_id),
    .io_out_ready(main_pipe_req_arb_io_out_ready),
    .io_out_valid(main_pipe_req_arb_io_out_valid),
    .io_out_bits_miss(main_pipe_req_arb_io_out_bits_miss),
    .io_out_bits_miss_id(main_pipe_req_arb_io_out_bits_miss_id),
    .io_out_bits_miss_param(main_pipe_req_arb_io_out_bits_miss_param),
    .io_out_bits_miss_dirty(main_pipe_req_arb_io_out_bits_miss_dirty),
    .io_out_bits_miss_way_en(main_pipe_req_arb_io_out_bits_miss_way_en),
    .io_out_bits_probe(main_pipe_req_arb_io_out_bits_probe),
    .io_out_bits_probe_param(main_pipe_req_arb_io_out_bits_probe_param),
    .io_out_bits_probe_need_data(main_pipe_req_arb_io_out_bits_probe_need_data),
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
    .io_out_bits_replace(main_pipe_req_arb_io_out_bits_replace),
    .io_out_bits_replace_way_en(main_pipe_req_arb_io_out_bits_replace_way_en),
    .io_out_bits_id(main_pipe_req_arb_io_out_bits_id)
  );
  AMOALU amoalu ( // @[MainPipe.scala 619:24]
    .io_mask(amoalu_io_mask),
    .io_cmd(amoalu_io_cmd),
    .io_lhs(amoalu_io_lhs),
    .io_rhs(amoalu_io_rhs),
    .io_out(amoalu_io_out)
  );
  assign io_probe_req_ready = main_pipe_req_arb_io_in_0_ready; // @[DCacheWrapper.scala 211:9]
  assign io_miss_req_valid = s2_valid_dup_4 & s2_can_go_to_mq_dup_0; // @[MainPipe.scala 1403:40]
  assign io_miss_req_bits_source = s2_req_source; // @[MainPipe.scala 1406:19]
  assign io_miss_req_bits_cmd = s2_req_cmd; // @[MainPipe.scala 1407:16]
  assign io_miss_req_bits_addr = s2_req_addr; // @[MainPipe.scala 1408:17]
  assign io_miss_req_bits_vaddr = s2_req_vaddr_dup_for_miss_req; // @[MainPipe.scala 1409:18]
  assign io_miss_req_bits_way_en = s2_tag_match ? s2_tag_match_way : s2_repl_way_en; // @[MainPipe.scala 1410:25]
  assign io_miss_req_bits_word_idx = s2_req_word_idx; // @[MainPipe.scala 1413:21]
  assign io_miss_req_bits_amo_data = s2_req_amo_data; // @[MainPipe.scala 1414:21]
  assign io_miss_req_bits_amo_mask = s2_req_amo_mask; // @[MainPipe.scala 1415:21]
  assign io_miss_req_bits_req_coh_state = s2_hit_coh_state; // @[MainPipe.scala 1416:20]
  assign io_miss_req_bits_replace_coh_state = s2_repl_coh_state; // @[MainPipe.scala 1417:24]
  assign io_miss_req_bits_replace_tag = s2_repl_tag; // @[MainPipe.scala 1418:24]
  assign io_miss_req_bits_id = s2_req_id; // @[MainPipe.scala 1419:15]
  assign io_miss_req_bits_store_data = s2_req_store_data; // @[MainPipe.scala 1411:23]
  assign io_miss_req_bits_store_mask = s2_req_store_mask; // @[MainPipe.scala 1412:23]
  assign io_store_req_ready = _store_req_ready_T_5 & ~io_replace_req_valid; // @[MainPipe.scala 205:25]
  assign io_store_replay_resp_valid = s2_valid_dup_5 & s2_can_go_to_mq_dup_1 & replay & _s2_can_go_to_s3_T_2; // @[MainPipe.scala 1423:85]
  assign io_store_replay_resp_bits_id = s2_req_id; // @[MainPipe.scala 1427:32]
  assign io_store_hit_resp_valid = s3_valid_dup_8 & s3_store_can_go; // @[MainPipe.scala 1429:46]
  assign io_store_hit_resp_bits_id = s3_req_id; // @[MainPipe.scala 1433:29]
  assign io_release_update_valid = s3_valid_dup_9 & _s3_update_data_cango_T & s3_hit & update_data; // @[MainPipe.scala 1435:94]
  assign io_release_update_bits_addr = s3_req_addr_dup_3; // @[MainPipe.scala 1436:31]
  assign io_release_update_bits_mask = s3_store_hit_dup_1 ? s3_banked_store_wmask : banked_amo_wmask; // @[MainPipe.scala 1437:37]
  assign io_release_update_bits_data = {io_release_update_bits_data_hi,io_release_update_bits_data_lo}; // @[MainPipe.scala 1446:5]
  assign io_atomic_req_ready = main_pipe_req_arb_io_in_3_ready; // @[DCacheWrapper.scala 211:9]
  assign io_atomic_resp_valid = atomic_replay_resp_valid | atomic_hit_resp_valid; // @[MainPipe.scala 1466:52]
  assign io_atomic_resp_bits_data = atomic_replay_resp_valid ? 64'h0 : atomic_hit_resp_data; // @[MainPipe.scala 1467:29]
  assign io_atomic_resp_bits_miss = s2_valid_dup_6 & s2_can_go_to_mq_dup_2 & replay & _s2_can_go_to_s3_T_3; // @[MainPipe.scala 1464:86]
  assign io_atomic_resp_bits_miss_id = atomic_replay_resp_valid ? 2'h0 : s3_req_miss_id; // @[MainPipe.scala 1467:29]
  assign io_atomic_resp_bits_replay = s2_valid_dup_6 & s2_can_go_to_mq_dup_2 & replay & _s2_can_go_to_s3_T_3; // @[MainPipe.scala 1464:86]
  assign io_atomic_resp_bits_error = atomic_replay_resp_valid ? 1'h0 : s3_error; // @[MainPipe.scala 1467:29]
  assign io_atomic_resp_bits_ack_miss_queue = atomic_replay_resp_valid ? 1'h0 : s3_req_miss_dup_5; // @[MainPipe.scala 1467:29]
  assign io_atomic_resp_bits_id = atomic_replay_resp_valid ? 4'h0 : atomic_hit_resp_id; // @[MainPipe.scala 1467:29]
  assign io_replace_req_ready = main_pipe_req_arb_io_in_1_ready; // @[DCacheWrapper.scala 211:9]
  assign io_replace_resp_valid = s3_fire & s3_req_replace_dup_3; // @[MainPipe.scala 1469:36]
  assign io_replace_resp_bits = s3_req_miss_id; // @[MainPipe.scala 1470:24]
  assign io_wb_valid = _io_wb_valid_T_17 & need_wb_dup_for_wb_valid; // @[MainPipe.scala 1536:7]
  assign io_wb_bits_param = s3_req_probe_dup_for_wb_valid ? _probe_new_coh_dup_for_wb_valid_T_59 :
    miss_shrink_param_dup_for_wb_valid; // @[MainPipe.scala 1350:45]
  assign io_wb_bits_voluntary = miss_update_meta_dup_for_wb_valid | s3_req_replace_dup_for_wb_valid; // @[MainPipe.scala 1540:56]
  assign io_wb_bits_hasData = _writeback_data_dup_for_wb_valid_T_3 | (miss_wb_dup_for_wb_valid |
    s3_req_replace_dup_for_wb_valid) & _miss_wb_dup_for_wb_valid_T_1; // @[MainPipe.scala 1357:54]
  assign io_wb_bits_dirty = s3_coh_dup_for_wb_valid_state == 2'h3; // @[Metadata.scala 44:36]
  assign io_wb_bits_delay_release = s3_req_replace_dup_for_wb_valid; // @[MainPipe.scala 1544:28]
  assign io_wb_bits_miss_id = s3_req_miss_id; // @[MainPipe.scala 1545:22]
  assign io_wb_bits_addr = {_io_wb_bits_addr_T_1[35:6], 6'h0}; // @[L1Cache.scala 84:59]
  assign io_wb_bits_data = {io_wb_bits_data_hi,io_wb_bits_data_lo}; // @[MainPipe.scala 1543:36]
  assign io_probe_ttob_check_req_valid = s1_valid & s1_req_probe & s1_req_probe_param == 2'h1; // @[MainPipe.scala 343:48]
  assign io_probe_ttob_check_req_bits_addr = {_io_probe_ttob_check_req_bits_addr_T_1[35:6], 6'h0}; // @[L1Cache.scala 84:59]
  assign io_data_read_valid = s1_valid_dup_4 & s1_need_data; // @[MainPipe.scala 1398:41]
  assign io_data_read_bits_way_en = s1_req_replace ? s1_req_replace_way_en : _s1_way_en_T_1; // @[MainPipe.scala 306:22]
  assign io_data_read_bits_addr = s1_req_vaddr_dup_for_data_read[35:0]; // @[MainPipe.scala 1401:26]
  assign io_data_write_valid = s3_valid_dup_for_data_wvalid & s3_update_data_cango_dup_for_data_wvalid &
    update_data_dup_for_data_wvalid; // @[MainPipe.scala 1508:101]
  assign io_data_write_bits_wmask = miss_update_meta_dup_for_data_wvalid ? 8'hff : _banked_wmask_T_2; // @[MainPipe.scala 1090:25]
  assign io_data_write_bits_data_0 = amo_wait_amoalu_dup_for_data_wvalid ? s3_amo_data_merged_reg_0 : _T_214_0; // @[MainPipe.scala 1512:33]
  assign io_data_write_bits_data_1 = amo_wait_amoalu_dup_for_data_wvalid ? s3_amo_data_merged_reg_1 : _T_214_1; // @[MainPipe.scala 1512:33]
  assign io_data_write_bits_data_2 = amo_wait_amoalu_dup_for_data_wvalid ? s3_amo_data_merged_reg_2 : _T_214_2; // @[MainPipe.scala 1512:33]
  assign io_data_write_bits_data_3 = amo_wait_amoalu_dup_for_data_wvalid ? s3_amo_data_merged_reg_3 : _T_214_3; // @[MainPipe.scala 1512:33]
  assign io_data_write_bits_data_4 = amo_wait_amoalu_dup_for_data_wvalid ? s3_amo_data_merged_reg_4 : _T_214_4; // @[MainPipe.scala 1512:33]
  assign io_data_write_bits_data_5 = amo_wait_amoalu_dup_for_data_wvalid ? s3_amo_data_merged_reg_5 : _T_214_5; // @[MainPipe.scala 1512:33]
  assign io_data_write_bits_data_6 = amo_wait_amoalu_dup_for_data_wvalid ? s3_amo_data_merged_reg_6 : _T_214_6; // @[MainPipe.scala 1512:33]
  assign io_data_write_bits_data_7 = amo_wait_amoalu_dup_for_data_wvalid ? s3_amo_data_merged_reg_7 : _T_214_7; // @[MainPipe.scala 1512:33]
  assign io_data_write_dup_0_valid = s3_valid_dup_for_data_wbank_0 & s3_update_data_cango_dup_for_data_wbank &
    update_data_dup_for_data_wbank; // @[MainPipe.scala 1223:111]
  assign io_data_write_dup_0_bits_way_en = io_data_write_dup_0_bits_way_en_r; // @[MainPipe.scala 1224:38]
  assign io_data_write_dup_0_bits_addr = io_data_write_dup_0_bits_addr_r[35:0]; // @[MainPipe.scala 1225:36]
  assign io_data_write_dup_1_valid = s3_valid_dup_for_data_wbank_1 & s3_update_data_cango_dup_for_data_wbank_1 &
    update_data_dup_for_data_wbank_1; // @[MainPipe.scala 1223:111]
  assign io_data_write_dup_1_bits_way_en = io_data_write_dup_1_bits_way_en_r; // @[MainPipe.scala 1224:38]
  assign io_data_write_dup_1_bits_addr = io_data_write_dup_1_bits_addr_r[35:0]; // @[MainPipe.scala 1225:36]
  assign io_data_write_dup_2_valid = s3_valid_dup_for_data_wbank_2 & s3_update_data_cango_dup_for_data_wbank_2 &
    update_data_dup_for_data_wbank_2; // @[MainPipe.scala 1223:111]
  assign io_data_write_dup_2_bits_way_en = io_data_write_dup_2_bits_way_en_r; // @[MainPipe.scala 1224:38]
  assign io_data_write_dup_2_bits_addr = io_data_write_dup_2_bits_addr_r[35:0]; // @[MainPipe.scala 1225:36]
  assign io_data_write_dup_3_valid = s3_valid_dup_for_data_wbank_3 & s3_update_data_cango_dup_for_data_wbank_3 &
    update_data_dup_for_data_wbank_3; // @[MainPipe.scala 1223:111]
  assign io_data_write_dup_3_bits_way_en = io_data_write_dup_3_bits_way_en_r; // @[MainPipe.scala 1224:38]
  assign io_data_write_dup_3_bits_addr = io_data_write_dup_3_bits_addr_r[35:0]; // @[MainPipe.scala 1225:36]
  assign io_data_write_dup_4_valid = s3_valid_dup_for_data_wbank_4 & s3_update_data_cango_dup_for_data_wbank_4 &
    update_data_dup_for_data_wbank_4; // @[MainPipe.scala 1223:111]
  assign io_data_write_dup_4_bits_way_en = io_data_write_dup_4_bits_way_en_r; // @[MainPipe.scala 1224:38]
  assign io_data_write_dup_4_bits_addr = io_data_write_dup_4_bits_addr_r[35:0]; // @[MainPipe.scala 1225:36]
  assign io_data_write_dup_5_valid = s3_valid_dup_for_data_wbank_5 & s3_update_data_cango_dup_for_data_wbank_5 &
    update_data_dup_for_data_wbank_5; // @[MainPipe.scala 1223:111]
  assign io_data_write_dup_5_bits_way_en = io_data_write_dup_5_bits_way_en_r; // @[MainPipe.scala 1224:38]
  assign io_data_write_dup_5_bits_addr = io_data_write_dup_5_bits_addr_r[35:0]; // @[MainPipe.scala 1225:36]
  assign io_data_write_dup_6_valid = s3_valid_dup_for_data_wbank_6 & s3_update_data_cango_dup_for_data_wbank_6 &
    update_data_dup_for_data_wbank_6; // @[MainPipe.scala 1223:111]
  assign io_data_write_dup_6_bits_way_en = io_data_write_dup_6_bits_way_en_r; // @[MainPipe.scala 1224:38]
  assign io_data_write_dup_6_bits_addr = io_data_write_dup_6_bits_addr_r[35:0]; // @[MainPipe.scala 1225:36]
  assign io_data_write_dup_7_valid = s3_valid_dup_for_data_wbank_7 & s3_update_data_cango_dup_for_data_wbank_7 &
    update_data_dup_for_data_wbank_7; // @[MainPipe.scala 1223:111]
  assign io_data_write_dup_7_bits_way_en = io_data_write_dup_7_bits_way_en_r; // @[MainPipe.scala 1224:38]
  assign io_data_write_dup_7_bits_addr = io_data_write_dup_7_bits_addr_r[35:0]; // @[MainPipe.scala 1225:36]
  assign io_meta_read_valid = req_valid & s1_ready & _s0_can_go_T_2; // @[MainPipe.scala 1389:47]
  assign io_meta_read_bits_idx = req_bits_vaddr[11:6]; // @[L1Cache.scala 81:33]
  assign io_meta_write_valid = s3_fire_dup_for_meta_wvalid & update_meta_dup_for_meta_wvalid; // @[MainPipe.scala 1472:55]
  assign io_meta_write_bits_idx = s3_idx_dup_2; // @[MainPipe.scala 1473:26]
  assign io_meta_write_bits_way_en = s3_way_en_dup_0; // @[MainPipe.scala 1474:29]
  assign io_meta_write_bits_meta_coh_state = miss_update_meta_dup_for_meta_wvalid ? miss_new_coh_state :
    _new_coh_T_2_state; // @[MainPipe.scala 784:20]
  assign io_error_flag_write_valid = s3_fire_dup_for_err_wvalid & update_meta_dup_for_err_wvalid & s3_req_error; // @[MainPipe.scala 1477:95]
  assign io_error_flag_write_bits_idx = s3_idx_dup_3; // @[MainPipe.scala 1478:32]
  assign io_error_flag_write_bits_way_en = s3_way_en_dup_1; // @[MainPipe.scala 1479:35]
  assign io_error_flag_write_bits_flag = s3_req_error; // @[MainPipe.scala 1480:33]
  assign io_tag_read_valid = _io_meta_read_valid_T_2 & ~req_bits_replace; // @[MainPipe.scala 1393:63]
  assign io_tag_read_bits_idx = req_bits_vaddr[11:6]; // @[L1Cache.scala 81:33]
  assign io_tag_write_valid = s3_fire_dup_for_tag_wvalid & miss_update_meta_dup_for_tag_wvalid; // @[MainPipe.scala 1497:53]
  assign io_tag_write_bits_idx = s3_idx_dup_4; // @[MainPipe.scala 1498:25]
  assign io_tag_write_bits_way_en = s3_way_en_dup_2; // @[MainPipe.scala 1499:28]
  assign io_tag_write_bits_tag = s3_req_addr_dup_4[35:12]; // @[L1Cache.scala 79:41]
  assign io_tag_write_intend = s3_req_miss_dup_7 & s3_valid_dup_11; // @[MainPipe.scala 1502:45]
  assign io_replace_access_valid = io_replace_access_valid_REG; // @[MainPipe.scala 1547:27]
  assign io_replace_access_bits_set = s2_idx_dup_for_replace_access; // @[MainPipe.scala 1548:30]
  assign io_replace_access_bits_way = io_replace_access_bits_way_REG; // @[MainPipe.scala 1549:30]
  assign io_replace_way_set_bits = s1_idx_dup_for_replace_way; // @[MainPipe.scala 1552:27]
  assign io_status_s1_valid = s1_valid_dup_5; // @[MainPipe.scala 1557:22]
  assign io_status_s1_bits_set = s1_req_vaddr[11:6]; // @[L1Cache.scala 81:33]
  assign io_status_s2_valid = s2_valid_dup_7 & ~s2_req_replace_dup_2; // @[MainPipe.scala 1560:41]
  assign io_status_s2_bits_set = s2_idx_dup_for_status; // @[MainPipe.scala 1561:25]
  assign io_status_s2_bits_way_en = s2_way_en; // @[MainPipe.scala 1562:28]
  assign io_status_s3_valid = s3_valid & ~s3_req_replace_dup_7; // @[MainPipe.scala 1563:34]
  assign io_status_s3_bits_set = s3_idx_dup_5; // @[MainPipe.scala 1564:25]
  assign io_status_s3_bits_way_en = s3_way_en; // @[MainPipe.scala 1565:28]
  assign io_status_dup_0_s1_valid = s1_valid_dup_for_status_0; // @[MainPipe.scala 1568:16]
  assign io_status_dup_0_s1_bits_set = io_status_dup_0_s1_bits_set_r; // @[MainPipe.scala 1569:19]
  assign io_status_dup_0_s1_bits_way_en = s1_req_replace ? s1_req_replace_way_en : _s1_way_en_T_1; // @[MainPipe.scala 306:22]
  assign io_status_dup_0_s2_valid = s2_valid_dup_for_status_0 & ~io_status_dup_0_s2_valid_r; // @[MainPipe.scala 1571:46]
  assign io_status_dup_0_s2_bits_set = io_status_dup_0_s2_bits_set_r; // @[MainPipe.scala 1572:19]
  assign io_status_dup_0_s2_bits_way_en = io_status_dup_0_s2_bits_way_en_r; // @[MainPipe.scala 1573:22]
  assign io_status_dup_0_s3_valid = s3_valid_dup_for_status_0 & ~io_status_dup_0_s3_valid_r; // @[MainPipe.scala 1574:46]
  assign io_status_dup_0_s3_bits_set = io_status_dup_0_s3_bits_set_r; // @[MainPipe.scala 1575:19]
  assign io_status_dup_0_s3_bits_way_en = io_status_dup_0_s3_bits_way_en_r; // @[MainPipe.scala 1576:22]
  assign io_status_dup_1_s1_valid = s1_valid_dup_for_status_1; // @[MainPipe.scala 1568:16]
  assign io_status_dup_1_s1_bits_set = io_status_dup_1_s1_bits_set_r; // @[MainPipe.scala 1569:19]
  assign io_status_dup_1_s1_bits_way_en = s1_req_replace ? s1_req_replace_way_en : _s1_way_en_T_1; // @[MainPipe.scala 306:22]
  assign io_status_dup_1_s2_valid = s2_valid_dup_for_status_1 & ~io_status_dup_1_s2_valid_r; // @[MainPipe.scala 1571:46]
  assign io_status_dup_1_s2_bits_set = io_status_dup_1_s2_bits_set_r; // @[MainPipe.scala 1572:19]
  assign io_status_dup_1_s2_bits_way_en = io_status_dup_1_s2_bits_way_en_r; // @[MainPipe.scala 1573:22]
  assign io_status_dup_1_s3_valid = s3_valid_dup_for_status_1 & ~io_status_dup_1_s3_valid_r; // @[MainPipe.scala 1574:46]
  assign io_status_dup_1_s3_bits_set = io_status_dup_1_s3_bits_set_r; // @[MainPipe.scala 1575:19]
  assign io_status_dup_1_s3_bits_way_en = io_status_dup_1_s3_bits_way_en_r; // @[MainPipe.scala 1576:22]
  assign io_status_dup_2_s1_valid = s1_valid_dup_for_status_2; // @[MainPipe.scala 1568:16]
  assign io_status_dup_2_s1_bits_set = io_status_dup_2_s1_bits_set_r; // @[MainPipe.scala 1569:19]
  assign io_status_dup_2_s1_bits_way_en = s1_req_replace ? s1_req_replace_way_en : _s1_way_en_T_1; // @[MainPipe.scala 306:22]
  assign io_status_dup_2_s2_valid = s2_valid_dup_for_status_2 & ~io_status_dup_2_s2_valid_r; // @[MainPipe.scala 1571:46]
  assign io_status_dup_2_s2_bits_set = io_status_dup_2_s2_bits_set_r; // @[MainPipe.scala 1572:19]
  assign io_status_dup_2_s2_bits_way_en = io_status_dup_2_s2_bits_way_en_r; // @[MainPipe.scala 1573:22]
  assign io_status_dup_2_s3_valid = s3_valid_dup_for_status_2 & ~io_status_dup_2_s3_valid_r; // @[MainPipe.scala 1574:46]
  assign io_status_dup_2_s3_bits_set = io_status_dup_2_s3_bits_set_r; // @[MainPipe.scala 1575:19]
  assign io_status_dup_2_s3_bits_way_en = io_status_dup_2_s3_bits_way_en_r; // @[MainPipe.scala 1576:22]
  assign io_status_dup_3_s1_valid = s1_valid_dup_for_status_3; // @[MainPipe.scala 1568:16]
  assign io_status_dup_3_s1_bits_set = io_status_dup_3_s1_bits_set_r; // @[MainPipe.scala 1569:19]
  assign io_status_dup_3_s1_bits_way_en = s1_req_replace ? s1_req_replace_way_en : _s1_way_en_T_1; // @[MainPipe.scala 306:22]
  assign io_status_dup_3_s2_valid = s2_valid_dup_for_status_3 & ~io_status_dup_3_s2_valid_r; // @[MainPipe.scala 1571:46]
  assign io_status_dup_3_s2_bits_set = io_status_dup_3_s2_bits_set_r; // @[MainPipe.scala 1572:19]
  assign io_status_dup_3_s2_bits_way_en = io_status_dup_3_s2_bits_way_en_r; // @[MainPipe.scala 1573:22]
  assign io_status_dup_3_s3_valid = s3_valid_dup_for_status_3 & ~io_status_dup_3_s3_valid_r; // @[MainPipe.scala 1574:46]
  assign io_status_dup_3_s3_bits_set = io_status_dup_3_s3_bits_set_r; // @[MainPipe.scala 1575:19]
  assign io_status_dup_3_s3_bits_way_en = io_status_dup_3_s3_bits_way_en_r; // @[MainPipe.scala 1576:22]
  assign io_status_dup_4_s1_valid = s1_valid_dup_for_status_4; // @[MainPipe.scala 1568:16]
  assign io_status_dup_4_s1_bits_set = io_status_dup_4_s1_bits_set_r; // @[MainPipe.scala 1569:19]
  assign io_status_dup_4_s1_bits_way_en = s1_req_replace ? s1_req_replace_way_en : _s1_way_en_T_1; // @[MainPipe.scala 306:22]
  assign io_status_dup_4_s2_valid = s2_valid_dup_for_status_4 & ~io_status_dup_4_s2_valid_r; // @[MainPipe.scala 1571:46]
  assign io_status_dup_4_s2_bits_set = io_status_dup_4_s2_bits_set_r; // @[MainPipe.scala 1572:19]
  assign io_status_dup_4_s2_bits_way_en = io_status_dup_4_s2_bits_way_en_r; // @[MainPipe.scala 1573:22]
  assign io_status_dup_4_s3_valid = s3_valid_dup_for_status_4 & ~io_status_dup_4_s3_valid_r; // @[MainPipe.scala 1574:46]
  assign io_status_dup_4_s3_bits_set = io_status_dup_4_s3_bits_set_r; // @[MainPipe.scala 1575:19]
  assign io_status_dup_4_s3_bits_way_en = io_status_dup_4_s3_bits_way_en_r; // @[MainPipe.scala 1576:22]
  assign io_status_dup_5_s1_valid = s1_valid_dup_for_status_5; // @[MainPipe.scala 1568:16]
  assign io_status_dup_5_s1_bits_set = io_status_dup_5_s1_bits_set_r; // @[MainPipe.scala 1569:19]
  assign io_status_dup_5_s1_bits_way_en = s1_req_replace ? s1_req_replace_way_en : _s1_way_en_T_1; // @[MainPipe.scala 306:22]
  assign io_status_dup_5_s2_valid = s2_valid_dup_for_status_5 & ~io_status_dup_5_s2_valid_r; // @[MainPipe.scala 1571:46]
  assign io_status_dup_5_s2_bits_set = io_status_dup_5_s2_bits_set_r; // @[MainPipe.scala 1572:19]
  assign io_status_dup_5_s2_bits_way_en = io_status_dup_5_s2_bits_way_en_r; // @[MainPipe.scala 1573:22]
  assign io_status_dup_5_s3_valid = s3_valid_dup_for_status_5 & ~io_status_dup_5_s3_valid_r; // @[MainPipe.scala 1574:46]
  assign io_status_dup_5_s3_bits_set = io_status_dup_5_s3_bits_set_r; // @[MainPipe.scala 1575:19]
  assign io_status_dup_5_s3_bits_way_en = io_status_dup_5_s3_bits_way_en_r; // @[MainPipe.scala 1576:22]
  assign io_status_dup_6_s1_valid = s1_valid_dup_for_status_6; // @[MainPipe.scala 1568:16]
  assign io_status_dup_6_s1_bits_set = io_status_dup_6_s1_bits_set_r; // @[MainPipe.scala 1569:19]
  assign io_status_dup_6_s1_bits_way_en = s1_req_replace ? s1_req_replace_way_en : _s1_way_en_T_1; // @[MainPipe.scala 306:22]
  assign io_status_dup_6_s2_valid = s2_valid_dup_for_status_6 & ~io_status_dup_6_s2_valid_r; // @[MainPipe.scala 1571:46]
  assign io_status_dup_6_s2_bits_set = io_status_dup_6_s2_bits_set_r; // @[MainPipe.scala 1572:19]
  assign io_status_dup_6_s2_bits_way_en = io_status_dup_6_s2_bits_way_en_r; // @[MainPipe.scala 1573:22]
  assign io_status_dup_6_s3_valid = s3_valid_dup_for_status_6 & ~io_status_dup_6_s3_valid_r; // @[MainPipe.scala 1574:46]
  assign io_status_dup_6_s3_bits_set = io_status_dup_6_s3_bits_set_r; // @[MainPipe.scala 1575:19]
  assign io_status_dup_6_s3_bits_way_en = io_status_dup_6_s3_bits_way_en_r; // @[MainPipe.scala 1576:22]
  assign io_status_dup_7_s1_valid = s1_valid_dup_for_status_7; // @[MainPipe.scala 1568:16]
  assign io_status_dup_7_s1_bits_set = io_status_dup_7_s1_bits_set_r; // @[MainPipe.scala 1569:19]
  assign io_status_dup_7_s1_bits_way_en = s1_req_replace ? s1_req_replace_way_en : _s1_way_en_T_1; // @[MainPipe.scala 306:22]
  assign io_status_dup_7_s2_valid = s2_valid_dup_for_status_7 & ~io_status_dup_7_s2_valid_r; // @[MainPipe.scala 1571:46]
  assign io_status_dup_7_s2_bits_set = io_status_dup_7_s2_bits_set_r; // @[MainPipe.scala 1572:19]
  assign io_status_dup_7_s2_bits_way_en = io_status_dup_7_s2_bits_way_en_r; // @[MainPipe.scala 1573:22]
  assign io_status_dup_7_s3_valid = s3_valid_dup_for_status_7 & ~io_status_dup_7_s3_valid_r; // @[MainPipe.scala 1574:46]
  assign io_status_dup_7_s3_bits_set = io_status_dup_7_s3_bits_set_r; // @[MainPipe.scala 1575:19]
  assign io_status_dup_7_s3_bits_way_en = io_status_dup_7_s3_bits_way_en_r; // @[MainPipe.scala 1576:22]
  assign io_status_dup_8_s1_valid = s1_valid_dup_for_status_8; // @[MainPipe.scala 1568:16]
  assign io_status_dup_8_s1_bits_set = io_status_dup_8_s1_bits_set_r; // @[MainPipe.scala 1569:19]
  assign io_status_dup_8_s1_bits_way_en = s1_req_replace ? s1_req_replace_way_en : _s1_way_en_T_1; // @[MainPipe.scala 306:22]
  assign io_status_dup_8_s2_valid = s2_valid_dup_for_status_8 & ~io_status_dup_8_s2_valid_r; // @[MainPipe.scala 1571:46]
  assign io_status_dup_8_s2_bits_set = io_status_dup_8_s2_bits_set_r; // @[MainPipe.scala 1572:19]
  assign io_status_dup_8_s2_bits_way_en = io_status_dup_8_s2_bits_way_en_r; // @[MainPipe.scala 1573:22]
  assign io_status_dup_8_s3_valid = s3_valid_dup_for_status_8 & ~io_status_dup_8_s3_valid_r; // @[MainPipe.scala 1574:46]
  assign io_status_dup_8_s3_bits_set = io_status_dup_8_s3_bits_set_r; // @[MainPipe.scala 1575:19]
  assign io_status_dup_8_s3_bits_way_en = io_status_dup_8_s3_bits_way_en_r; // @[MainPipe.scala 1576:22]
  assign io_status_dup_9_s1_valid = s1_valid_dup_for_status_9; // @[MainPipe.scala 1568:16]
  assign io_status_dup_9_s1_bits_set = io_status_dup_9_s1_bits_set_r; // @[MainPipe.scala 1569:19]
  assign io_status_dup_9_s1_bits_way_en = s1_req_replace ? s1_req_replace_way_en : _s1_way_en_T_1; // @[MainPipe.scala 306:22]
  assign io_status_dup_9_s2_valid = s2_valid_dup_for_status_9 & ~io_status_dup_9_s2_valid_r; // @[MainPipe.scala 1571:46]
  assign io_status_dup_9_s2_bits_set = io_status_dup_9_s2_bits_set_r; // @[MainPipe.scala 1572:19]
  assign io_status_dup_9_s2_bits_way_en = io_status_dup_9_s2_bits_way_en_r; // @[MainPipe.scala 1573:22]
  assign io_status_dup_9_s3_valid = s3_valid_dup_for_status_9 & ~io_status_dup_9_s3_valid_r; // @[MainPipe.scala 1574:46]
  assign io_status_dup_9_s3_bits_set = io_status_dup_9_s3_bits_set_r; // @[MainPipe.scala 1575:19]
  assign io_status_dup_9_s3_bits_way_en = io_status_dup_9_s3_bits_way_en_r; // @[MainPipe.scala 1576:22]
  assign io_status_dup_10_s1_valid = s1_valid_dup_for_status_10; // @[MainPipe.scala 1568:16]
  assign io_status_dup_10_s1_bits_set = io_status_dup_10_s1_bits_set_r; // @[MainPipe.scala 1569:19]
  assign io_status_dup_10_s1_bits_way_en = s1_req_replace ? s1_req_replace_way_en : _s1_way_en_T_1; // @[MainPipe.scala 306:22]
  assign io_status_dup_10_s2_valid = s2_valid_dup_for_status_10 & ~io_status_dup_10_s2_valid_r; // @[MainPipe.scala 1571:46]
  assign io_status_dup_10_s2_bits_set = io_status_dup_10_s2_bits_set_r; // @[MainPipe.scala 1572:19]
  assign io_status_dup_10_s2_bits_way_en = io_status_dup_10_s2_bits_way_en_r; // @[MainPipe.scala 1573:22]
  assign io_status_dup_10_s3_valid = s3_valid_dup_for_status_10 & ~io_status_dup_10_s3_valid_r; // @[MainPipe.scala 1574:46]
  assign io_status_dup_10_s3_bits_set = io_status_dup_10_s3_bits_set_r; // @[MainPipe.scala 1575:19]
  assign io_status_dup_10_s3_bits_way_en = io_status_dup_10_s3_bits_way_en_r; // @[MainPipe.scala 1576:22]
  assign io_status_dup_11_s1_valid = s1_valid_dup_for_status_11; // @[MainPipe.scala 1568:16]
  assign io_status_dup_11_s1_bits_set = io_status_dup_11_s1_bits_set_r; // @[MainPipe.scala 1569:19]
  assign io_status_dup_11_s1_bits_way_en = s1_req_replace ? s1_req_replace_way_en : _s1_way_en_T_1; // @[MainPipe.scala 306:22]
  assign io_status_dup_11_s2_valid = s2_valid_dup_for_status_11 & ~io_status_dup_11_s2_valid_r; // @[MainPipe.scala 1571:46]
  assign io_status_dup_11_s2_bits_set = io_status_dup_11_s2_bits_set_r; // @[MainPipe.scala 1572:19]
  assign io_status_dup_11_s2_bits_way_en = io_status_dup_11_s2_bits_way_en_r; // @[MainPipe.scala 1573:22]
  assign io_status_dup_11_s3_valid = s3_valid_dup_for_status_11 & ~io_status_dup_11_s3_valid_r; // @[MainPipe.scala 1574:46]
  assign io_status_dup_11_s3_bits_set = io_status_dup_11_s3_bits_set_r; // @[MainPipe.scala 1575:19]
  assign io_status_dup_11_s3_bits_way_en = io_status_dup_11_s3_bits_way_en_r; // @[MainPipe.scala 1576:22]
  assign io_status_dup_12_s1_valid = s1_valid_dup_for_status_12; // @[MainPipe.scala 1568:16]
  assign io_status_dup_12_s1_bits_set = io_status_dup_12_s1_bits_set_r; // @[MainPipe.scala 1569:19]
  assign io_status_dup_12_s1_bits_way_en = s1_req_replace ? s1_req_replace_way_en : _s1_way_en_T_1; // @[MainPipe.scala 306:22]
  assign io_status_dup_12_s2_valid = s2_valid_dup_for_status_12 & ~io_status_dup_12_s2_valid_r; // @[MainPipe.scala 1571:46]
  assign io_status_dup_12_s2_bits_set = io_status_dup_12_s2_bits_set_r; // @[MainPipe.scala 1572:19]
  assign io_status_dup_12_s2_bits_way_en = io_status_dup_12_s2_bits_way_en_r; // @[MainPipe.scala 1573:22]
  assign io_status_dup_12_s3_valid = s3_valid_dup_for_status_12 & ~io_status_dup_12_s3_valid_r; // @[MainPipe.scala 1574:46]
  assign io_status_dup_12_s3_bits_set = io_status_dup_12_s3_bits_set_r; // @[MainPipe.scala 1575:19]
  assign io_status_dup_12_s3_bits_way_en = io_status_dup_12_s3_bits_way_en_r; // @[MainPipe.scala 1576:22]
  assign io_status_dup_13_s1_valid = s1_valid_dup_for_status_13; // @[MainPipe.scala 1568:16]
  assign io_status_dup_13_s1_bits_set = io_status_dup_13_s1_bits_set_r; // @[MainPipe.scala 1569:19]
  assign io_status_dup_13_s1_bits_way_en = s1_req_replace ? s1_req_replace_way_en : _s1_way_en_T_1; // @[MainPipe.scala 306:22]
  assign io_status_dup_13_s2_valid = s2_valid_dup_for_status_13 & ~io_status_dup_13_s2_valid_r; // @[MainPipe.scala 1571:46]
  assign io_status_dup_13_s2_bits_set = io_status_dup_13_s2_bits_set_r; // @[MainPipe.scala 1572:19]
  assign io_status_dup_13_s2_bits_way_en = io_status_dup_13_s2_bits_way_en_r; // @[MainPipe.scala 1573:22]
  assign io_status_dup_13_s3_valid = s3_valid_dup_for_status_13 & ~io_status_dup_13_s3_valid_r; // @[MainPipe.scala 1574:46]
  assign io_status_dup_13_s3_bits_set = io_status_dup_13_s3_bits_set_r; // @[MainPipe.scala 1575:19]
  assign io_status_dup_13_s3_bits_way_en = io_status_dup_13_s3_bits_way_en_r; // @[MainPipe.scala 1576:22]
  assign io_status_dup_14_s1_valid = s1_valid_dup_for_status_14; // @[MainPipe.scala 1568:16]
  assign io_status_dup_14_s1_bits_set = io_status_dup_14_s1_bits_set_r; // @[MainPipe.scala 1569:19]
  assign io_status_dup_14_s1_bits_way_en = s1_req_replace ? s1_req_replace_way_en : _s1_way_en_T_1; // @[MainPipe.scala 306:22]
  assign io_status_dup_14_s2_valid = s2_valid_dup_for_status_14 & ~io_status_dup_14_s2_valid_r; // @[MainPipe.scala 1571:46]
  assign io_status_dup_14_s2_bits_set = io_status_dup_14_s2_bits_set_r; // @[MainPipe.scala 1572:19]
  assign io_status_dup_14_s2_bits_way_en = io_status_dup_14_s2_bits_way_en_r; // @[MainPipe.scala 1573:22]
  assign io_status_dup_14_s3_valid = s3_valid_dup_for_status_14 & ~io_status_dup_14_s3_valid_r; // @[MainPipe.scala 1574:46]
  assign io_status_dup_14_s3_bits_set = io_status_dup_14_s3_bits_set_r; // @[MainPipe.scala 1575:19]
  assign io_status_dup_14_s3_bits_way_en = io_status_dup_14_s3_bits_way_en_r; // @[MainPipe.scala 1576:22]
  assign io_status_dup_15_s1_valid = s1_valid_dup_for_status_15; // @[MainPipe.scala 1568:16]
  assign io_status_dup_15_s1_bits_set = io_status_dup_15_s1_bits_set_r; // @[MainPipe.scala 1569:19]
  assign io_status_dup_15_s1_bits_way_en = s1_req_replace ? s1_req_replace_way_en : _s1_way_en_T_1; // @[MainPipe.scala 306:22]
  assign io_status_dup_15_s2_valid = s2_valid_dup_for_status_15 & ~io_status_dup_15_s2_valid_r; // @[MainPipe.scala 1571:46]
  assign io_status_dup_15_s2_bits_set = io_status_dup_15_s2_bits_set_r; // @[MainPipe.scala 1572:19]
  assign io_status_dup_15_s2_bits_way_en = io_status_dup_15_s2_bits_way_en_r; // @[MainPipe.scala 1573:22]
  assign io_status_dup_15_s3_valid = s3_valid_dup_for_status_15 & ~io_status_dup_15_s3_valid_r; // @[MainPipe.scala 1574:46]
  assign io_status_dup_15_s3_bits_set = io_status_dup_15_s3_bits_set_r; // @[MainPipe.scala 1575:19]
  assign io_status_dup_15_s3_bits_way_en = io_status_dup_15_s3_bits_way_en_r; // @[MainPipe.scala 1576:22]
  assign io_status_dup_16_s1_valid = s1_valid_dup_for_status_16; // @[MainPipe.scala 1568:16]
  assign io_status_dup_16_s1_bits_set = io_status_dup_16_s1_bits_set_r; // @[MainPipe.scala 1569:19]
  assign io_status_dup_16_s1_bits_way_en = s1_req_replace ? s1_req_replace_way_en : _s1_way_en_T_1; // @[MainPipe.scala 306:22]
  assign io_status_dup_16_s2_valid = s2_valid_dup_for_status_16 & ~io_status_dup_16_s2_valid_r; // @[MainPipe.scala 1571:46]
  assign io_status_dup_16_s2_bits_set = io_status_dup_16_s2_bits_set_r; // @[MainPipe.scala 1572:19]
  assign io_status_dup_16_s2_bits_way_en = io_status_dup_16_s2_bits_way_en_r; // @[MainPipe.scala 1573:22]
  assign io_status_dup_16_s3_valid = s3_valid_dup_for_status_16 & ~io_status_dup_16_s3_valid_r; // @[MainPipe.scala 1574:46]
  assign io_status_dup_16_s3_bits_set = io_status_dup_16_s3_bits_set_r; // @[MainPipe.scala 1575:19]
  assign io_status_dup_16_s3_bits_way_en = io_status_dup_16_s3_bits_way_en_r; // @[MainPipe.scala 1576:22]
  assign io_status_dup_17_s1_valid = s1_valid_dup_for_status_17; // @[MainPipe.scala 1568:16]
  assign io_status_dup_17_s1_bits_set = io_status_dup_17_s1_bits_set_r; // @[MainPipe.scala 1569:19]
  assign io_status_dup_17_s1_bits_way_en = s1_req_replace ? s1_req_replace_way_en : _s1_way_en_T_1; // @[MainPipe.scala 306:22]
  assign io_status_dup_17_s2_valid = s2_valid_dup_for_status_17 & ~io_status_dup_17_s2_valid_r; // @[MainPipe.scala 1571:46]
  assign io_status_dup_17_s2_bits_set = io_status_dup_17_s2_bits_set_r; // @[MainPipe.scala 1572:19]
  assign io_status_dup_17_s2_bits_way_en = io_status_dup_17_s2_bits_way_en_r; // @[MainPipe.scala 1573:22]
  assign io_status_dup_17_s3_valid = s3_valid_dup_for_status_17 & ~io_status_dup_17_s3_valid_r; // @[MainPipe.scala 1574:46]
  assign io_status_dup_17_s3_bits_set = io_status_dup_17_s3_bits_set_r; // @[MainPipe.scala 1575:19]
  assign io_status_dup_17_s3_bits_way_en = io_status_dup_17_s3_bits_way_en_r; // @[MainPipe.scala 1576:22]
  assign io_status_dup_18_s1_valid = s1_valid_dup_for_status_18; // @[MainPipe.scala 1568:16]
  assign io_status_dup_18_s1_bits_set = io_status_dup_18_s1_bits_set_r; // @[MainPipe.scala 1569:19]
  assign io_status_dup_18_s1_bits_way_en = s1_req_replace ? s1_req_replace_way_en : _s1_way_en_T_1; // @[MainPipe.scala 306:22]
  assign io_status_dup_18_s2_valid = s2_valid_dup_for_status_18 & ~io_status_dup_18_s2_valid_r; // @[MainPipe.scala 1571:46]
  assign io_status_dup_18_s2_bits_set = io_status_dup_18_s2_bits_set_r; // @[MainPipe.scala 1572:19]
  assign io_status_dup_18_s2_bits_way_en = io_status_dup_18_s2_bits_way_en_r; // @[MainPipe.scala 1573:22]
  assign io_status_dup_18_s3_valid = s3_valid_dup_for_status_18 & ~io_status_dup_18_s3_valid_r; // @[MainPipe.scala 1574:46]
  assign io_status_dup_18_s3_bits_set = io_status_dup_18_s3_bits_set_r; // @[MainPipe.scala 1575:19]
  assign io_status_dup_18_s3_bits_way_en = io_status_dup_18_s3_bits_way_en_r; // @[MainPipe.scala 1576:22]
  assign io_status_dup_19_s1_valid = s1_valid_dup_for_status_19; // @[MainPipe.scala 1568:16]
  assign io_status_dup_19_s1_bits_set = io_status_dup_19_s1_bits_set_r; // @[MainPipe.scala 1569:19]
  assign io_status_dup_19_s1_bits_way_en = s1_req_replace ? s1_req_replace_way_en : _s1_way_en_T_1; // @[MainPipe.scala 306:22]
  assign io_status_dup_19_s2_valid = s2_valid_dup_for_status_19 & ~io_status_dup_19_s2_valid_r; // @[MainPipe.scala 1571:46]
  assign io_status_dup_19_s2_bits_set = io_status_dup_19_s2_bits_set_r; // @[MainPipe.scala 1572:19]
  assign io_status_dup_19_s2_bits_way_en = io_status_dup_19_s2_bits_way_en_r; // @[MainPipe.scala 1573:22]
  assign io_status_dup_19_s3_valid = s3_valid_dup_for_status_19 & ~io_status_dup_19_s3_valid_r; // @[MainPipe.scala 1574:46]
  assign io_status_dup_19_s3_bits_set = io_status_dup_19_s3_bits_set_r; // @[MainPipe.scala 1575:19]
  assign io_status_dup_19_s3_bits_way_en = io_status_dup_19_s3_bits_way_en_r; // @[MainPipe.scala 1576:22]
  assign io_status_dup_20_s1_valid = s1_valid_dup_for_status_20; // @[MainPipe.scala 1568:16]
  assign io_status_dup_20_s1_bits_set = io_status_dup_20_s1_bits_set_r; // @[MainPipe.scala 1569:19]
  assign io_status_dup_20_s1_bits_way_en = s1_req_replace ? s1_req_replace_way_en : _s1_way_en_T_1; // @[MainPipe.scala 306:22]
  assign io_status_dup_20_s2_valid = s2_valid_dup_for_status_20 & ~io_status_dup_20_s2_valid_r; // @[MainPipe.scala 1571:46]
  assign io_status_dup_20_s2_bits_set = io_status_dup_20_s2_bits_set_r; // @[MainPipe.scala 1572:19]
  assign io_status_dup_20_s2_bits_way_en = io_status_dup_20_s2_bits_way_en_r; // @[MainPipe.scala 1573:22]
  assign io_status_dup_20_s3_valid = s3_valid_dup_for_status_20 & ~io_status_dup_20_s3_valid_r; // @[MainPipe.scala 1574:46]
  assign io_status_dup_20_s3_bits_set = io_status_dup_20_s3_bits_set_r; // @[MainPipe.scala 1575:19]
  assign io_status_dup_20_s3_bits_way_en = io_status_dup_20_s3_bits_way_en_r; // @[MainPipe.scala 1576:22]
  assign io_status_dup_21_s1_valid = s1_valid_dup_for_status_21; // @[MainPipe.scala 1568:16]
  assign io_status_dup_21_s1_bits_set = io_status_dup_21_s1_bits_set_r; // @[MainPipe.scala 1569:19]
  assign io_status_dup_21_s1_bits_way_en = s1_req_replace ? s1_req_replace_way_en : _s1_way_en_T_1; // @[MainPipe.scala 306:22]
  assign io_status_dup_21_s2_valid = s2_valid_dup_for_status_21 & ~io_status_dup_21_s2_valid_r; // @[MainPipe.scala 1571:46]
  assign io_status_dup_21_s2_bits_set = io_status_dup_21_s2_bits_set_r; // @[MainPipe.scala 1572:19]
  assign io_status_dup_21_s2_bits_way_en = io_status_dup_21_s2_bits_way_en_r; // @[MainPipe.scala 1573:22]
  assign io_status_dup_21_s3_valid = s3_valid_dup_for_status_21 & ~io_status_dup_21_s3_valid_r; // @[MainPipe.scala 1574:46]
  assign io_status_dup_21_s3_bits_set = io_status_dup_21_s3_bits_set_r; // @[MainPipe.scala 1575:19]
  assign io_status_dup_21_s3_bits_way_en = io_status_dup_21_s3_bits_way_en_r; // @[MainPipe.scala 1576:22]
  assign io_status_dup_22_s1_valid = s1_valid_dup_for_status_22; // @[MainPipe.scala 1568:16]
  assign io_status_dup_22_s1_bits_set = io_status_dup_22_s1_bits_set_r; // @[MainPipe.scala 1569:19]
  assign io_status_dup_22_s1_bits_way_en = s1_req_replace ? s1_req_replace_way_en : _s1_way_en_T_1; // @[MainPipe.scala 306:22]
  assign io_status_dup_22_s2_valid = s2_valid_dup_for_status_22 & ~io_status_dup_22_s2_valid_r; // @[MainPipe.scala 1571:46]
  assign io_status_dup_22_s2_bits_set = io_status_dup_22_s2_bits_set_r; // @[MainPipe.scala 1572:19]
  assign io_status_dup_22_s2_bits_way_en = io_status_dup_22_s2_bits_way_en_r; // @[MainPipe.scala 1573:22]
  assign io_status_dup_22_s3_valid = s3_valid_dup_for_status_22 & ~io_status_dup_22_s3_valid_r; // @[MainPipe.scala 1574:46]
  assign io_status_dup_22_s3_bits_set = io_status_dup_22_s3_bits_set_r; // @[MainPipe.scala 1575:19]
  assign io_status_dup_22_s3_bits_way_en = io_status_dup_22_s3_bits_way_en_r; // @[MainPipe.scala 1576:22]
  assign io_status_dup_23_s1_valid = s1_valid_dup_for_status_23; // @[MainPipe.scala 1568:16]
  assign io_status_dup_23_s1_bits_set = io_status_dup_23_s1_bits_set_r; // @[MainPipe.scala 1569:19]
  assign io_status_dup_23_s1_bits_way_en = s1_req_replace ? s1_req_replace_way_en : _s1_way_en_T_1; // @[MainPipe.scala 306:22]
  assign io_status_dup_23_s2_valid = s2_valid_dup_for_status_23 & ~io_status_dup_23_s2_valid_r; // @[MainPipe.scala 1571:46]
  assign io_status_dup_23_s2_bits_set = io_status_dup_23_s2_bits_set_r; // @[MainPipe.scala 1572:19]
  assign io_status_dup_23_s2_bits_way_en = io_status_dup_23_s2_bits_way_en_r; // @[MainPipe.scala 1573:22]
  assign io_status_dup_23_s3_valid = s3_valid_dup_for_status_23 & ~io_status_dup_23_s3_valid_r; // @[MainPipe.scala 1574:46]
  assign io_status_dup_23_s3_bits_set = io_status_dup_23_s3_bits_set_r; // @[MainPipe.scala 1575:19]
  assign io_status_dup_23_s3_bits_way_en = io_status_dup_23_s3_bits_way_en_r; // @[MainPipe.scala 1576:22]
  assign io_lrsc_locked_block_valid = lrsc_count_dup_1 > 6'h8; // @[MainPipe.scala 501:61]
  assign io_lrsc_locked_block_bits = lrsc_addr_dup; // @[MainPipe.scala 571:30]
  assign io_update_resv_set = s3_valid_dup_1 & s3_lr & s3_can_do_amo; // @[MainPipe.scala 577:50]
  assign io_block_lr = io_block_lr_REG; // @[MainPipe.scala 572:15]
  assign io_error_source_tag = io_error_source_tag_r; // @[MainPipe.scala 1588:23]
  assign io_error_source_data = s3_data_error_REG_1 ? _s3_data_error_T : s3_data_error_REG_3; // @[MainPipe.scala 460:23]
  assign io_error_source_l2 = io_error_source_l2_r; // @[MainPipe.scala 1590:22]
  assign io_error_opType_store = io_error_opType_store_r; // @[MainPipe.scala 1591:25]
  assign io_error_opType_probe = io_error_opType_probe_r; // @[MainPipe.scala 1592:25]
  assign io_error_opType_release = io_error_opType_release_r; // @[MainPipe.scala 1593:27]
  assign io_error_opType_atom = io_error_opType_atom_r; // @[MainPipe.scala 1594:24]
  assign io_error_paddr = io_error_paddr_r; // @[MainPipe.scala 1587:18]
  assign io_error_report_to_beu = (io_error_report_to_beu_r | s3_data_error) & io_error_report_to_beu_REG; // @[MainPipe.scala 1586:81]
  assign io_error_valid = s3_error & io_error_valid_REG; // @[MainPipe.scala 1583:30]
  assign io_perf_0_value = {{5'd0}, io_perf_0_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_1_value = {{3'd0}, io_perf_1_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign main_pipe_req_arb_io_in_0_valid = io_probe_req_valid; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_0_bits_miss = io_probe_req_bits_miss; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_0_bits_miss_id = io_probe_req_bits_miss_id; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_0_bits_miss_param = io_probe_req_bits_miss_param; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_0_bits_miss_dirty = io_probe_req_bits_miss_dirty; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_0_bits_miss_way_en = io_probe_req_bits_miss_way_en; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_0_bits_probe = io_probe_req_bits_probe; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_0_bits_probe_param = io_probe_req_bits_probe_param; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_0_bits_probe_need_data = io_probe_req_bits_probe_need_data; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_0_bits_source = io_probe_req_bits_source; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_0_bits_cmd = io_probe_req_bits_cmd; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_0_bits_vaddr = io_probe_req_bits_vaddr; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_0_bits_addr = io_probe_req_bits_addr; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_0_bits_store_data = io_probe_req_bits_store_data; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_0_bits_store_mask = io_probe_req_bits_store_mask; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_0_bits_word_idx = io_probe_req_bits_word_idx; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_0_bits_amo_data = io_probe_req_bits_amo_data; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_0_bits_amo_mask = io_probe_req_bits_amo_mask; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_0_bits_error = io_probe_req_bits_error; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_0_bits_replace = io_probe_req_bits_replace; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_0_bits_replace_way_en = io_probe_req_bits_replace_way_en; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_0_bits_id = io_probe_req_bits_id; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_1_valid = io_replace_req_valid; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_1_bits_miss = io_replace_req_bits_miss; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_1_bits_miss_id = io_replace_req_bits_miss_id; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_1_bits_miss_param = io_replace_req_bits_miss_param; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_1_bits_miss_dirty = io_replace_req_bits_miss_dirty; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_1_bits_miss_way_en = io_replace_req_bits_miss_way_en; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_1_bits_probe = io_replace_req_bits_probe; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_1_bits_probe_param = io_replace_req_bits_probe_param; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_1_bits_probe_need_data = io_replace_req_bits_probe_need_data; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_1_bits_source = io_replace_req_bits_source; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_1_bits_cmd = io_replace_req_bits_cmd; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_1_bits_vaddr = io_replace_req_bits_vaddr; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_1_bits_addr = io_replace_req_bits_addr; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_1_bits_store_data = io_replace_req_bits_store_data; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_1_bits_store_mask = io_replace_req_bits_store_mask; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_1_bits_word_idx = io_replace_req_bits_word_idx; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_1_bits_amo_data = io_replace_req_bits_amo_data; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_1_bits_amo_mask = io_replace_req_bits_amo_mask; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_1_bits_error = io_replace_req_bits_error; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_1_bits_replace = io_replace_req_bits_replace; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_1_bits_replace_way_en = io_replace_req_bits_replace_way_en; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_1_bits_id = io_replace_req_bits_id; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_2_valid = io_store_req_valid; // @[MainPipe.scala 183:23 185:19]
  assign main_pipe_req_arb_io_in_2_bits_miss_id = 2'h0; // @[MainPipe.scala 183:23 184:18]
  assign main_pipe_req_arb_io_in_2_bits_probe = 1'h0; // @[MainPipe.scala 75:19 79:15]
  assign main_pipe_req_arb_io_in_2_bits_probe_param = 2'h0; // @[MainPipe.scala 183:23 184:18]
  assign main_pipe_req_arb_io_in_2_bits_probe_need_data = 1'h0; // @[MainPipe.scala 75:19 80:25]
  assign main_pipe_req_arb_io_in_2_bits_source = 4'h1; // @[MainPipe.scala 75:19 81:16]
  assign main_pipe_req_arb_io_in_2_bits_cmd = 5'h1; // @[MainPipe.scala 75:19 82:13]
  assign main_pipe_req_arb_io_in_2_bits_vaddr = io_store_req_bits_vaddr; // @[MainPipe.scala 75:19 84:15]
  assign main_pipe_req_arb_io_in_2_bits_addr = io_store_req_bits_addr; // @[MainPipe.scala 75:19 83:14]
  assign main_pipe_req_arb_io_in_2_bits_store_data = io_store_req_bits_data; // @[MainPipe.scala 75:19 85:20]
  assign main_pipe_req_arb_io_in_2_bits_store_mask = io_store_req_bits_mask; // @[MainPipe.scala 75:19 86:20]
  assign main_pipe_req_arb_io_in_2_bits_replace = 1'h0; // @[MainPipe.scala 75:19 87:17]
  assign main_pipe_req_arb_io_in_2_bits_replace_way_en = 8'h0; // @[MainPipe.scala 183:23 184:18]
  assign main_pipe_req_arb_io_in_2_bits_id = io_store_req_bits_id; // @[MainPipe.scala 75:19 89:12]
  assign main_pipe_req_arb_io_in_3_valid = io_atomic_req_valid; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_3_bits_miss = io_atomic_req_bits_miss; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_3_bits_miss_id = io_atomic_req_bits_miss_id; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_3_bits_miss_param = io_atomic_req_bits_miss_param; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_3_bits_miss_dirty = io_atomic_req_bits_miss_dirty; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_3_bits_miss_way_en = io_atomic_req_bits_miss_way_en; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_3_bits_probe = io_atomic_req_bits_probe; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_3_bits_probe_param = io_atomic_req_bits_probe_param; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_3_bits_probe_need_data = io_atomic_req_bits_probe_need_data; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_3_bits_source = io_atomic_req_bits_source; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_3_bits_cmd = io_atomic_req_bits_cmd; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_3_bits_vaddr = io_atomic_req_bits_vaddr; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_3_bits_addr = io_atomic_req_bits_addr; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_3_bits_store_data = io_atomic_req_bits_store_data; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_3_bits_store_mask = io_atomic_req_bits_store_mask; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_3_bits_word_idx = io_atomic_req_bits_word_idx; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_3_bits_amo_data = io_atomic_req_bits_amo_data; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_3_bits_amo_mask = io_atomic_req_bits_amo_mask; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_3_bits_error = io_atomic_req_bits_error; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_3_bits_replace = io_atomic_req_bits_replace; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_3_bits_replace_way_en = io_atomic_req_bits_replace_way_en; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_in_3_bits_id = io_atomic_req_bits_id; // @[DCacheWrapper.scala 211:9]
  assign main_pipe_req_arb_io_out_ready = _store_req_ready_T_1 & ~set_conflict; // @[MainPipe.scala 209:71]
  assign amoalu_io_mask = s3_req_amo_mask; // @[MainPipe.scala 620:18]
  assign amoalu_io_cmd = s3_req_cmd; // @[MainPipe.scala 621:18]
  assign amoalu_io_lhs = s3_data_word; // @[MainPipe.scala 622:18]
  assign amoalu_io_rhs = s3_req_amo_data; // @[MainPipe.scala 623:18]
  always @(posedge clock) begin
    if (s0_fire) begin // @[Reg.scala 17:18]
      s1_req_vaddr <= req_bits_vaddr; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      s2_req_vaddr <= s1_req_vaddr; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_idx_dup_0 <= s2_idx; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_idx_dup_1 <= s2_idx; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      s2_req_replace_dup_1 <= s1_req_replace; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      s2_req_probe <= s1_req_probe; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      s2_req_miss <= s1_req_miss; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      s2_req_source <= s1_req_source; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      s2_tag_match <= s1_tag_match; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      s2_req_cmd <= s1_req_cmd; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      if (s1_tag_match) begin // @[MainPipe.scala 285:38]
        s2_hit_coh_state <= _s1_hit_coh_T_22;
      end else begin
        s2_hit_coh_state <= 2'h0;
      end
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_probe_dup_7 <= s2_req_probe; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_probe_dup_0 <= s2_req_probe; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_tag_match_dup <= s2_tag_match; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_coh_dup_0_state <= s2_coh_state; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_probe_param <= s2_req_probe_param; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_coh_state <= s2_coh_state; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_source_dup_1 <= s2_req_source; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_probe_dup_8 <= s2_req_probe; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_source <= s2_req_source; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_miss_dup_2 <= s2_req_miss; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_store_hit_dup_0 <= s2_store_hit; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_miss_dup_0 <= s2_req_miss; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_probe_dup_5 <= s2_req_probe; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_amo_hit <= s2_amo_hit; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_cmd_dup_5 <= s2_req_cmd; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_probe_dup_4 <= s2_req_probe; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_cmd_dup_4 <= s2_req_cmd; // @[Reg.scala 17:22]
    end
    if (s3_valid_dup_0 & (s3_lr | s3_sc)) begin // @[MainPipe.scala 548:46]
      if (s3_can_do_amo & s3_lr) begin // @[MainPipe.scala 549:35]
        lrsc_addr <= _lrsc_addr_T_1; // @[MainPipe.scala 552:17]
      end
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_addr <= s2_req_addr; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_amo_hit_dup <= s2_amo_hit; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_cmd_dup_0 <= s2_req_cmd; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_cmd_dup_1 <= s2_req_cmd; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_miss_dup_4 <= s2_req_miss; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_replace_dup_2 <= s2_req_replace; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_replace_dup_1 <= s2_req_replace; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_coh_dup_4_state <= s2_coh_state; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      s2_can_go_to_mq <= s1_pregen_can_go_to_mq; // @[Reg.scala 17:22]
    end
    if (s0_fire) begin // @[Reg.scala 17:18]
      s1_need_data <= banked_need_data; // @[Reg.scala 17:22]
    end
    if (s0_fire) begin // @[Reg.scala 17:18]
      s1_req_miss <= req_bits_miss; // @[Reg.scala 17:22]
    end
    if (s0_fire) begin // @[Reg.scala 17:18]
      s1_req_miss_id <= req_bits_miss_id; // @[Reg.scala 17:22]
    end
    if (s0_fire) begin // @[Reg.scala 17:18]
      s1_req_miss_param <= req_bits_miss_param; // @[Reg.scala 17:22]
    end
    if (s0_fire) begin // @[Reg.scala 17:18]
      s1_req_miss_dirty <= req_bits_miss_dirty; // @[Reg.scala 17:22]
    end
    if (s0_fire) begin // @[Reg.scala 17:18]
      s1_req_miss_way_en <= req_bits_miss_way_en; // @[Reg.scala 17:22]
    end
    if (s0_fire) begin // @[Reg.scala 17:18]
      s1_req_probe <= req_bits_probe; // @[Reg.scala 17:22]
    end
    if (s0_fire) begin // @[Reg.scala 17:18]
      s1_req_probe_param <= req_bits_probe_param; // @[Reg.scala 17:22]
    end
    if (s0_fire) begin // @[Reg.scala 17:18]
      s1_req_probe_need_data <= req_bits_probe_need_data; // @[Reg.scala 17:22]
    end
    if (s0_fire) begin // @[Reg.scala 17:18]
      s1_req_source <= req_bits_source; // @[Reg.scala 17:22]
    end
    if (s0_fire) begin // @[Reg.scala 17:18]
      s1_req_cmd <= req_bits_cmd; // @[Reg.scala 17:22]
    end
    if (s0_fire) begin // @[Reg.scala 17:18]
      s1_req_addr <= req_bits_addr; // @[Reg.scala 17:22]
    end
    if (s0_fire) begin // @[Reg.scala 17:18]
      s1_req_store_data <= req_bits_store_data; // @[Reg.scala 17:22]
    end
    if (s0_fire) begin // @[Reg.scala 17:18]
      s1_req_store_mask <= req_bits_store_mask; // @[Reg.scala 17:22]
    end
    if (s0_fire) begin // @[Reg.scala 17:18]
      s1_req_word_idx <= req_bits_word_idx; // @[Reg.scala 17:22]
    end
    if (s0_fire) begin // @[Reg.scala 17:18]
      s1_req_amo_data <= req_bits_amo_data; // @[Reg.scala 17:22]
    end
    if (s0_fire) begin // @[Reg.scala 17:18]
      s1_req_amo_mask <= req_bits_amo_mask; // @[Reg.scala 17:22]
    end
    if (s0_fire) begin // @[Reg.scala 17:18]
      s1_req_error <= req_bits_error; // @[Reg.scala 17:22]
    end
    if (s0_fire) begin // @[Reg.scala 17:18]
      s1_req_replace <= req_bits_replace; // @[Reg.scala 17:22]
    end
    if (s0_fire) begin // @[Reg.scala 17:18]
      s1_req_replace_way_en <= req_bits_replace_way_en; // @[Reg.scala 17:22]
    end
    if (s0_fire) begin // @[Reg.scala 17:18]
      s1_req_id <= req_bits_id; // @[Reg.scala 17:22]
    end
    if (s0_fire) begin // @[Reg.scala 17:18]
      s1_banked_store_wmask <= bank_write; // @[Reg.scala 17:22]
    end
    if (s0_fire) begin // @[Reg.scala 17:18]
      s1_need_tag <= io_tag_read_valid; // @[Reg.scala 17:22]
    end
    if (s0_fire) begin // @[Reg.scala 17:18]
      s1_req_vaddr_dup_for_data_read <= req_bits_vaddr; // @[Reg.scala 17:22]
    end
    if (s0_fire) begin // @[Reg.scala 17:18]
      s1_idx_dup_for_replace_way <= s0_idx; // @[Reg.scala 17:22]
    end
    REG_2 <= req_valid & s0_can_go; // @[MainPipe.scala 210:27]
    if (REG_2) begin // @[MainPipe.scala 273:19]
      REG_3_0 <= io_meta_resp_0_coh_state;
    end
    if (REG_2) begin // @[MainPipe.scala 273:19]
      REG_3_1 <= io_meta_resp_1_coh_state;
    end
    if (REG_2) begin // @[MainPipe.scala 273:19]
      REG_3_2 <= io_meta_resp_2_coh_state;
    end
    if (REG_2) begin // @[MainPipe.scala 273:19]
      REG_3_3 <= io_meta_resp_3_coh_state;
    end
    if (REG_2) begin // @[MainPipe.scala 273:19]
      REG_3_4 <= io_meta_resp_4_coh_state;
    end
    if (REG_2) begin // @[MainPipe.scala 273:19]
      REG_3_5 <= io_meta_resp_5_coh_state;
    end
    if (REG_2) begin // @[MainPipe.scala 273:19]
      REG_3_6 <= io_meta_resp_6_coh_state;
    end
    if (REG_2) begin // @[MainPipe.scala 273:19]
      REG_3_7 <= io_meta_resp_7_coh_state;
    end
    REG_4 <= req_valid & s0_can_go; // @[MainPipe.scala 210:27]
    if (REG_4) begin // @[MainPipe.scala 274:18]
      REG_5_0 <= io_tag_resp_0[23:0];
    end
    if (REG_4) begin // @[MainPipe.scala 274:18]
      REG_5_1 <= io_tag_resp_1[23:0];
    end
    if (REG_4) begin // @[MainPipe.scala 274:18]
      REG_5_2 <= io_tag_resp_2[23:0];
    end
    if (REG_4) begin // @[MainPipe.scala 274:18]
      REG_5_3 <= io_tag_resp_3[23:0];
    end
    if (REG_4) begin // @[MainPipe.scala 274:18]
      REG_5_4 <= io_tag_resp_4[23:0];
    end
    if (REG_4) begin // @[MainPipe.scala 274:18]
      REG_5_5 <= io_tag_resp_5[23:0];
    end
    if (REG_4) begin // @[MainPipe.scala 274:18]
      REG_5_6 <= io_tag_resp_6[23:0];
    end
    if (REG_4) begin // @[MainPipe.scala 274:18]
      REG_5_7 <= io_tag_resp_7[23:0];
    end
    REG_8 <= req_valid & s0_can_go; // @[MainPipe.scala 210:27]
    if (REG_8) begin // @[MainPipe.scala 277:22]
      REG_9_0 <= io_tag_resp_0;
    end
    if (REG_8) begin // @[MainPipe.scala 277:22]
      REG_9_1 <= io_tag_resp_1;
    end
    if (REG_8) begin // @[MainPipe.scala 277:22]
      REG_9_2 <= io_tag_resp_2;
    end
    if (REG_8) begin // @[MainPipe.scala 277:22]
      REG_9_3 <= io_tag_resp_3;
    end
    if (REG_8) begin // @[MainPipe.scala 277:22]
      REG_9_4 <= io_tag_resp_4;
    end
    if (REG_8) begin // @[MainPipe.scala 277:22]
      REG_9_5 <= io_tag_resp_5;
    end
    if (REG_8) begin // @[MainPipe.scala 277:22]
      REG_9_6 <= io_tag_resp_6;
    end
    if (REG_8) begin // @[MainPipe.scala 277:22]
      REG_9_7 <= io_tag_resp_7;
    end
    s1_repl_way_en_REG <= req_valid & s0_can_go; // @[MainPipe.scala 210:27]
    if (s1_repl_way_en_REG) begin // @[MainPipe.scala 296:24]
      s1_repl_way_en_REG_1 <= _s1_repl_way_en_T;
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      s2_req_miss_id <= s1_req_miss_id; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      s2_req_miss_param <= s1_req_miss_param; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      s2_req_miss_dirty <= s1_req_miss_dirty; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      s2_req_probe_param <= s1_req_probe_param; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      s2_req_probe_need_data <= s1_req_probe_need_data; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      s2_req_addr <= s1_req_addr; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      s2_req_store_data <= s1_req_store_data; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      s2_req_store_mask <= s1_req_store_mask; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      s2_req_word_idx <= s1_req_word_idx; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      s2_req_amo_data <= s1_req_amo_data; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      s2_req_amo_mask <= s1_req_amo_mask; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      s2_req_error <= s1_req_error; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      s2_req_replace <= s1_req_replace; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      s2_req_id <= s1_req_id; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      s2_tag_match_way <= s1_tag_match_way; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      s2_repl_tag <= s1_repl_tag; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      s2_repl_coh_state <= s1_repl_coh_state; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      if (s1_repl_way_en_REG) begin // @[MainPipe.scala 296:24]
        s2_repl_way_en <= _s1_repl_way_en_T;
      end else begin
        s2_repl_way_en <= s1_repl_way_en_REG_1;
      end
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      s2_need_replacement <= s1_need_replacement; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      s2_need_data <= s1_need_data; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      s2_need_tag <= s1_need_tag; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      s2_encTag <= s1_encTag; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      s2_req_vaddr_dup_for_miss_req <= s1_req_vaddr; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      s2_idx_dup_for_status <= s1_idx; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      s2_idx_dup_for_replace_access <= s1_idx; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      s2_req_replace_dup_2 <= s1_req_replace; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      s2_can_go_to_mq_dup_0 <= s1_pregen_can_go_to_mq; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      s2_can_go_to_mq_dup_1 <= s1_pregen_can_go_to_mq; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      s2_can_go_to_mq_dup_2 <= s1_pregen_can_go_to_mq; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      if (s1_req_replace) begin // @[MainPipe.scala 306:22]
        s2_way_en <= s1_req_replace_way_en;
      end else if (s1_req_miss) begin // @[MainPipe.scala 309:8]
        s2_way_en <= s1_req_miss_way_en;
      end else if (s1_need_replacement) begin // @[MainPipe.scala 312:10]
        s2_way_en <= s1_repl_way_en;
      end else begin
        s2_way_en <= s1_tag_match_way;
      end
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      if (s1_req_replace) begin // @[MainPipe.scala 320:19]
        s2_tag <= s1_req_addr[35:12];
      end else if (s1_req_miss) begin // @[MainPipe.scala 323:8]
        s2_tag <= s1_miss_tag;
      end else if (s1_need_replacement) begin // @[MainPipe.scala 326:10]
        s2_tag <= s1_repl_tag;
      end else begin
        s2_tag <= s1_hit_tag;
      end
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      if (s1_req_replace) begin // @[MainPipe.scala 329:19]
        s2_coh_state <= _s1_coh_T_22;
      end else if (s1_req_miss) begin // @[MainPipe.scala 332:8]
        s2_coh_state <= s1_miss_coh_state;
      end else if (s1_need_replacement) begin // @[MainPipe.scala 335:10]
        s2_coh_state <= s1_repl_coh_state;
      end else begin
        s2_coh_state <= s1_hit_coh_state;
      end
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      s2_banked_store_wmask <= s1_banked_store_wmask; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      s2_flag_error <= s1_flag_error; // @[Reg.scala 17:22]
    end
    REG_12 <= s1_valid & s1_can_go; // @[MainPipe.scala 247:26]
    if (REG_12) begin // @[MainPipe.scala 414:19]
      REG_13_0_raw_data <= io_data_resp_0_raw_data;
    end
    if (REG_12) begin // @[MainPipe.scala 414:19]
      REG_13_1_raw_data <= io_data_resp_1_raw_data;
    end
    if (REG_12) begin // @[MainPipe.scala 414:19]
      REG_13_2_raw_data <= io_data_resp_2_raw_data;
    end
    if (REG_12) begin // @[MainPipe.scala 414:19]
      REG_13_3_raw_data <= io_data_resp_3_raw_data;
    end
    if (REG_12) begin // @[MainPipe.scala 414:19]
      REG_13_4_raw_data <= io_data_resp_4_raw_data;
    end
    if (REG_12) begin // @[MainPipe.scala 414:19]
      REG_13_5_raw_data <= io_data_resp_5_raw_data;
    end
    if (REG_12) begin // @[MainPipe.scala 414:19]
      REG_13_6_raw_data <= io_data_resp_6_raw_data;
    end
    if (REG_12) begin // @[MainPipe.scala 414:19]
      REG_13_7_raw_data <= io_data_resp_7_raw_data;
    end
    s2_probe_ttob_check_resp_REG <= s1_valid & s1_can_go; // @[MainPipe.scala 247:26]
    if (s2_probe_ttob_check_resp_REG) begin // @[MainPipe.scala 438:34]
      s2_probe_ttob_check_resp_REG_1_bits_toN <= io_probe_ttob_check_resp_bits_toN;
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_miss_id <= s2_req_miss_id; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_miss_param <= s2_req_miss_param; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_miss_dirty <= s2_req_miss_dirty; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_cmd <= s2_req_cmd; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_vaddr <= s2_req_vaddr; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_word_idx <= s2_req_word_idx; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_amo_data <= s2_req_amo_data; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_amo_mask <= s2_req_amo_mask; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_error <= s2_req_error; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_id <= s2_req_id; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_hit <= s2_hit; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_way_en <= s2_way_en; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_banked_store_wmask <= s2_banked_store_wmask; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_store_data_merged_0 <= s2_store_data_merged_0; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_store_data_merged_1 <= s2_store_data_merged_1; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_store_data_merged_2 <= s2_store_data_merged_2; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_store_data_merged_3 <= s2_store_data_merged_3; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_store_data_merged_4 <= s2_store_data_merged_4; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_store_data_merged_5 <= s2_store_data_merged_5; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_store_data_merged_6 <= s2_store_data_merged_6; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_store_data_merged_7 <= s2_store_data_merged_7; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      if (3'h7 == s2_req_word_idx) begin // @[Reg.scala 17:22]
        s3_data_word <= s2_store_data_merged_7; // @[Reg.scala 17:22]
      end else if (3'h6 == s2_req_word_idx) begin // @[Reg.scala 17:22]
        s3_data_word <= s2_store_data_merged_6; // @[Reg.scala 17:22]
      end else if (3'h5 == s2_req_word_idx) begin // @[Reg.scala 17:22]
        s3_data_word <= s2_store_data_merged_5; // @[Reg.scala 17:22]
      end else begin
        s3_data_word <= _GEN_243;
      end
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      if (REG_12) begin // @[MainPipe.scala 414:19]
        s3_data_0 <= io_data_resp_0_raw_data;
      end else begin
        s3_data_0 <= REG_13_0_raw_data;
      end
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      if (REG_12) begin // @[MainPipe.scala 414:19]
        s3_data_1 <= io_data_resp_1_raw_data;
      end else begin
        s3_data_1 <= REG_13_1_raw_data;
      end
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      if (REG_12) begin // @[MainPipe.scala 414:19]
        s3_data_2 <= io_data_resp_2_raw_data;
      end else begin
        s3_data_2 <= REG_13_2_raw_data;
      end
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      if (REG_12) begin // @[MainPipe.scala 414:19]
        s3_data_3 <= io_data_resp_3_raw_data;
      end else begin
        s3_data_3 <= REG_13_3_raw_data;
      end
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      if (REG_12) begin // @[MainPipe.scala 414:19]
        s3_data_4 <= io_data_resp_4_raw_data;
      end else begin
        s3_data_4 <= REG_13_4_raw_data;
      end
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      if (REG_12) begin // @[MainPipe.scala 414:19]
        s3_data_5 <= io_data_resp_5_raw_data;
      end else begin
        s3_data_5 <= REG_13_5_raw_data;
      end
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      if (REG_12) begin // @[MainPipe.scala 414:19]
        s3_data_6 <= io_data_resp_6_raw_data;
      end else begin
        s3_data_6 <= REG_13_6_raw_data;
      end
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      if (REG_12) begin // @[MainPipe.scala 414:19]
        s3_data_7 <= io_data_resp_7_raw_data;
      end else begin
        s3_data_7 <= REG_13_7_raw_data;
      end
    end
    s3_data_error_REG <= s1_valid & s1_can_go; // @[MainPipe.scala 247:26]
    s3_data_error_REG_1 <= s3_data_error_REG; // @[MainPipe.scala 460:31]
    s3_data_error_REG_2 <= s2_need_data & s2_coh_state != 2'h0; // @[MainPipe.scala 385:47]
    if (s3_data_error_REG_1) begin // @[MainPipe.scala 460:23]
      s3_data_error_REG_3 <= _s3_data_error_T;
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_error_r <= s2_error; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      if (s2_probe_ttob_check_resp_REG) begin // @[MainPipe.scala 438:34]
        s3_probe_ttob_check_resp_bits_toN <= io_probe_ttob_check_resp_bits_toN;
      end else begin
        s3_probe_ttob_check_resp_bits_toN <= s2_probe_ttob_check_resp_REG_1_bits_toN;
      end
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_way_en_dup_0 <= s2_way_en; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_way_en_dup_1 <= s2_way_en; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_way_en_dup_2 <= s2_way_en; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_idx_dup_2 <= s2_idx; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_idx_dup_3 <= s2_idx; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_idx_dup_4 <= s2_idx; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_idx_dup_5 <= s2_idx; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_replace_dup_3 <= s2_req_replace; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_replace_dup_7 <= s2_req_replace; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_cmd_dup_2 <= s2_req_cmd; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_cmd_dup_3 <= s2_req_cmd; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_addr_dup_0 <= s2_req_addr; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_addr_dup_3 <= s2_req_addr; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_addr_dup_4 <= s2_req_addr; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_probe_dup_3 <= s2_req_probe; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_miss_dup_5 <= s2_req_miss; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_miss_dup_7 <= s2_req_miss; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_word_idx_dup_0 <= s2_req_word_idx; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_word_idx_dup_1 <= s2_req_word_idx; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_word_idx_dup_2 <= s2_req_word_idx; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_word_idx_dup_3 <= s2_req_word_idx; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_word_idx_dup_4 <= s2_req_word_idx; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_word_idx_dup_5 <= s2_req_word_idx; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_word_idx_dup_6 <= s2_req_word_idx; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_word_idx_dup_7 <= s2_req_word_idx; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_store_hit_dup_1 <= s2_store_hit; // @[Reg.scala 17:22]
    end
    if (s3_valid_dup_0 & (s3_lr | s3_sc)) begin // @[MainPipe.scala 548:46]
      if (s3_can_do_amo & s3_lr) begin // @[MainPipe.scala 549:35]
        lrsc_addr_dup <= _lrsc_addr_T_1; // @[MainPipe.scala 553:21]
      end
    end
    io_block_lr_REG <= lrsc_count > 6'h0; // @[MainPipe.scala 572:37]
    if (do_amoalu) begin // @[Reg.scala 17:18]
      s3_amo_data_merged_reg_0 <= s3_amo_data_merged_0; // @[Reg.scala 17:22]
    end
    if (do_amoalu) begin // @[Reg.scala 17:18]
      s3_amo_data_merged_reg_1 <= s3_amo_data_merged_1; // @[Reg.scala 17:22]
    end
    if (do_amoalu) begin // @[Reg.scala 17:18]
      s3_amo_data_merged_reg_2 <= s3_amo_data_merged_2; // @[Reg.scala 17:22]
    end
    if (do_amoalu) begin // @[Reg.scala 17:18]
      s3_amo_data_merged_reg_3 <= s3_amo_data_merged_3; // @[Reg.scala 17:22]
    end
    if (do_amoalu) begin // @[Reg.scala 17:18]
      s3_amo_data_merged_reg_4 <= s3_amo_data_merged_4; // @[Reg.scala 17:22]
    end
    if (do_amoalu) begin // @[Reg.scala 17:18]
      s3_amo_data_merged_reg_5 <= s3_amo_data_merged_5; // @[Reg.scala 17:22]
    end
    if (do_amoalu) begin // @[Reg.scala 17:18]
      s3_amo_data_merged_reg_6 <= s3_amo_data_merged_6; // @[Reg.scala 17:22]
    end
    if (do_amoalu) begin // @[Reg.scala 17:18]
      s3_amo_data_merged_reg_7 <= s3_amo_data_merged_7; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      miss_update_meta_dup_for_meta_wvalid <= s2_req_miss; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_probe_dup_for_meta_wvalid <= s2_req_probe; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_tag_match_dup_for_meta_wvalid <= s2_tag_match; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_coh_dup_for_meta_wvalid_state <= s2_coh_state; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_probe_param_dup_for_meta_wvalid <= s2_req_probe_param; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_source_dup_for_meta_wvalid <= s2_req_source; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_cmd_dup_for_meta_wvalid <= s2_req_cmd; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_replace_dup_for_meta_wvalid <= s2_req_replace; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_hit_coh_dup_for_meta_wvalid_state <= s2_hit_coh_state; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      if (_T_118) begin // @[Misc.scala 34:36]
        s3_new_hit_coh_dup_for_meta_wvalid_state <= 2'h3;
      end else if (_T_115) begin // @[Misc.scala 34:36]
        s3_new_hit_coh_dup_for_meta_wvalid_state <= 2'h2;
      end else if (_T_112) begin // @[Misc.scala 34:36]
        s3_new_hit_coh_dup_for_meta_wvalid_state <= 2'h1;
      end else begin
        s3_new_hit_coh_dup_for_meta_wvalid_state <= _T_111;
      end
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_amo_hit_dup_for_meta_wvalid <= s2_amo_hit; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_store_hit_dup_for_meta_wvalid <= s2_store_hit; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_addr_dup_for_meta_wvalid <= s2_req_addr; // @[Reg.scala 17:22]
    end
    if (s3_valid_dup_for_meta_wvalid & (s3_lr_dup_for_meta_wvalid | s3_sc_dup_for_meta_wvalid)) begin // @[MainPipe.scala 723:102]
      if (s3_can_do_amo_dup_for_meta_wvalid & s3_lr_dup_for_meta_wvalid) begin // @[MainPipe.scala 724:77]
        lrsc_addr_dup_for_meta_wvalid <= _lrsc_addr_dup_for_meta_wvalid_T_1; // @[MainPipe.scala 726:38]
      end
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      miss_update_meta_dup_for_err_wvalid <= s2_req_miss; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_probe_dup_for_err_wvalid <= s2_req_probe; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_tag_match_dup_for_err_wvalid <= s2_tag_match; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_coh_dup_for_err_wvalid_state <= s2_coh_state; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_probe_param_dup_for_err_wvalid <= s2_req_probe_param; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_source_dup_for_err_wvalid <= s2_req_source; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_cmd_dup_for_err_wvalid <= s2_req_cmd; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_replace_dup_for_err_wvalid <= s2_req_replace; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_hit_coh_dup_for_err_wvalid_state <= s2_hit_coh_state; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      if (_T_118) begin // @[Misc.scala 34:36]
        s3_new_hit_coh_dup_for_err_wvalid_state <= 2'h3;
      end else if (_T_115) begin // @[Misc.scala 34:36]
        s3_new_hit_coh_dup_for_err_wvalid_state <= 2'h2;
      end else if (_T_112) begin // @[Misc.scala 34:36]
        s3_new_hit_coh_dup_for_err_wvalid_state <= 2'h1;
      end else begin
        s3_new_hit_coh_dup_for_err_wvalid_state <= _T_111;
      end
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_amo_hit_dup_for_err_wvalid <= s2_amo_hit; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_store_hit_dup_for_err_wvalid <= s2_store_hit; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_addr_dup_for_err_wvalid <= s2_req_addr; // @[Reg.scala 17:22]
    end
    if (s3_valid_dup_for_err_wvalid & (s3_lr_dup_for_err_wvalid | s3_sc_dup_for_err_wvalid)) begin // @[MainPipe.scala 848:99]
      if (s3_can_do_amo_dup_for_err_wvalid & s3_lr_dup_for_err_wvalid) begin // @[MainPipe.scala 849:75]
        lrsc_addr_dup_for_err_wvalid <= _lrsc_addr_dup_for_err_wvalid_T_1; // @[MainPipe.scala 851:37]
      end
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      miss_update_meta_dup_for_tag_wvalid <= s2_req_miss; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_probe_dup_for_tag_wvalid <= s2_req_probe; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_coh_dup_for_tag_wvalid_state <= s2_coh_state; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_source_dup_for_tag_wvalid <= s2_req_source; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_cmd_dup_for_tag_wvalid <= s2_req_cmd; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_replace_dup_for_tag_wvalid <= s2_req_replace; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_amo_hit_dup_for_tag_wvalid <= s2_amo_hit; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_store_hit_dup_for_tag_wvalid <= s2_store_hit; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_addr_dup_for_tag_wvalid <= s2_req_addr; // @[Reg.scala 17:22]
    end
    if (s3_valid_dup_for_tag_wvalid & (s3_lr_dup_for_tag_wvalid | s3_sc_dup_for_tag_wvalid)) begin // @[MainPipe.scala 944:99]
      if (s3_can_do_amo_dup_for_tag_wvalid & s3_lr_dup_for_tag_wvalid) begin // @[MainPipe.scala 945:75]
        lrsc_addr_dup_for_tag_wvalid <= _lrsc_addr_dup_for_tag_wvalid_T_1; // @[MainPipe.scala 947:37]
      end
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      miss_update_meta_dup_for_data_wvalid <= s2_req_miss; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_probe_dup_for_data_wvalid <= s2_req_probe; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_coh_dup_for_data_wvalid_state <= s2_coh_state; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_source_dup_for_data_wvalid <= s2_req_source; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_cmd_dup_for_data_wvalid <= s2_req_cmd; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_replace_dup_for_data_wvalid <= s2_req_replace; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_amo_hit_dup_for_data_wvalid <= s2_amo_hit; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_store_hit_dup_for_data_wvalid <= s2_store_hit; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_addr_dup_for_data_wvalid <= s2_req_addr; // @[Reg.scala 17:22]
    end
    if (s3_valid_dup_for_data_wvalid & (s3_lr_dup_for_data_wvalid | s3_sc_dup_for_data_wvalid)) begin // @[MainPipe.scala 1040:102]
      if (s3_can_do_amo_dup_for_data_wvalid & s3_lr_dup_for_data_wvalid) begin // @[MainPipe.scala 1041:77]
        lrsc_addr_dup_for_data_wvalid <= _lrsc_addr_dup_for_data_wvalid_T_1; // @[MainPipe.scala 1043:38]
      end
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_banked_store_wmask_dup_for_data_wvalid <= s2_banked_store_wmask; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_word_idx_dup_for_data_wvalid <= s2_req_word_idx; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_amo_data_dup_for_data_wvalid <= s2_req_amo_data; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_amo_mask_dup_for_data_wvalid <= s2_req_amo_mask; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_miss_dup_for_data_wbank <= s2_req_miss; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_probe_dup_for_data_wbank <= s2_req_probe; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_coh_dup_for_data_wbank_state <= s2_coh_state; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_source_dup_for_data_wbank <= s2_req_source; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_cmd_dup_for_data_wbank <= s2_req_cmd; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_replace_dup_for_data_wbank <= s2_req_replace; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_amo_hit_dup_for_data_wbank <= s2_amo_hit; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_store_hit_dup_for_data_wbank <= s2_store_hit; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_addr_dup_for_data_wbank <= s2_req_addr; // @[Reg.scala 17:22]
    end
    if (s3_valid_dup_for_data_wbank_0 & (s3_lr_dup_for_data_wbank | s3_sc_dup_for_data_wbank)) begin // @[MainPipe.scala 1171:104]
      if (s3_can_do_amo_dup_for_data_wbank & s3_lr_dup_for_data_wbank) begin // @[MainPipe.scala 1172:77]
        lrsc_addr_dup_for_data_wbank <= _lrsc_addr_dup_for_data_wbank_T_1; // @[MainPipe.scala 1174:39]
      end
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_data_write_dup_0_bits_way_en_r <= s2_way_en; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_data_write_dup_0_bits_addr_r <= s2_req_vaddr; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_miss_dup_for_data_wbank_1 <= s2_req_miss; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_probe_dup_for_data_wbank_1 <= s2_req_probe; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_coh_dup_for_data_wbank_1_state <= s2_coh_state; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_source_dup_for_data_wbank_1 <= s2_req_source; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_cmd_dup_for_data_wbank_1 <= s2_req_cmd; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_replace_dup_for_data_wbank_1 <= s2_req_replace; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_amo_hit_dup_for_data_wbank_1 <= s2_amo_hit; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_store_hit_dup_for_data_wbank_1 <= s2_store_hit; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_addr_dup_for_data_wbank_1 <= s2_req_addr; // @[Reg.scala 17:22]
    end
    if (s3_valid_dup_for_data_wbank_1 & (s3_lr_dup_for_data_wbank_1 | s3_sc_dup_for_data_wbank_1)) begin // @[MainPipe.scala 1171:104]
      if (s3_can_do_amo_dup_for_data_wbank_1 & s3_lr_dup_for_data_wbank_1) begin // @[MainPipe.scala 1172:77]
        lrsc_addr_dup_for_data_wbank_1 <= _lrsc_addr_dup_for_data_wbank_T_3; // @[MainPipe.scala 1174:39]
      end
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_data_write_dup_1_bits_way_en_r <= s2_way_en; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_data_write_dup_1_bits_addr_r <= s2_req_vaddr; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_miss_dup_for_data_wbank_2 <= s2_req_miss; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_probe_dup_for_data_wbank_2 <= s2_req_probe; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_coh_dup_for_data_wbank_2_state <= s2_coh_state; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_source_dup_for_data_wbank_2 <= s2_req_source; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_cmd_dup_for_data_wbank_2 <= s2_req_cmd; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_replace_dup_for_data_wbank_2 <= s2_req_replace; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_amo_hit_dup_for_data_wbank_2 <= s2_amo_hit; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_store_hit_dup_for_data_wbank_2 <= s2_store_hit; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_addr_dup_for_data_wbank_2 <= s2_req_addr; // @[Reg.scala 17:22]
    end
    if (s3_valid_dup_for_data_wbank_2 & (s3_lr_dup_for_data_wbank_2 | s3_sc_dup_for_data_wbank_2)) begin // @[MainPipe.scala 1171:104]
      if (s3_can_do_amo_dup_for_data_wbank_2 & s3_lr_dup_for_data_wbank_2) begin // @[MainPipe.scala 1172:77]
        lrsc_addr_dup_for_data_wbank_2 <= _lrsc_addr_dup_for_data_wbank_T_5; // @[MainPipe.scala 1174:39]
      end
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_data_write_dup_2_bits_way_en_r <= s2_way_en; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_data_write_dup_2_bits_addr_r <= s2_req_vaddr; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_miss_dup_for_data_wbank_3 <= s2_req_miss; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_probe_dup_for_data_wbank_3 <= s2_req_probe; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_coh_dup_for_data_wbank_3_state <= s2_coh_state; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_source_dup_for_data_wbank_3 <= s2_req_source; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_cmd_dup_for_data_wbank_3 <= s2_req_cmd; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_replace_dup_for_data_wbank_3 <= s2_req_replace; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_amo_hit_dup_for_data_wbank_3 <= s2_amo_hit; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_store_hit_dup_for_data_wbank_3 <= s2_store_hit; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_addr_dup_for_data_wbank_3 <= s2_req_addr; // @[Reg.scala 17:22]
    end
    if (s3_valid_dup_for_data_wbank_3 & (s3_lr_dup_for_data_wbank_3 | s3_sc_dup_for_data_wbank_3)) begin // @[MainPipe.scala 1171:104]
      if (s3_can_do_amo_dup_for_data_wbank_3 & s3_lr_dup_for_data_wbank_3) begin // @[MainPipe.scala 1172:77]
        lrsc_addr_dup_for_data_wbank_3 <= _lrsc_addr_dup_for_data_wbank_T_7; // @[MainPipe.scala 1174:39]
      end
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_data_write_dup_3_bits_way_en_r <= s2_way_en; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_data_write_dup_3_bits_addr_r <= s2_req_vaddr; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_miss_dup_for_data_wbank_4 <= s2_req_miss; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_probe_dup_for_data_wbank_4 <= s2_req_probe; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_coh_dup_for_data_wbank_4_state <= s2_coh_state; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_source_dup_for_data_wbank_4 <= s2_req_source; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_cmd_dup_for_data_wbank_4 <= s2_req_cmd; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_replace_dup_for_data_wbank_4 <= s2_req_replace; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_amo_hit_dup_for_data_wbank_4 <= s2_amo_hit; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_store_hit_dup_for_data_wbank_4 <= s2_store_hit; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_addr_dup_for_data_wbank_4 <= s2_req_addr; // @[Reg.scala 17:22]
    end
    if (s3_valid_dup_for_data_wbank_4 & (s3_lr_dup_for_data_wbank_4 | s3_sc_dup_for_data_wbank_4)) begin // @[MainPipe.scala 1171:104]
      if (s3_can_do_amo_dup_for_data_wbank_4 & s3_lr_dup_for_data_wbank_4) begin // @[MainPipe.scala 1172:77]
        lrsc_addr_dup_for_data_wbank_4 <= _lrsc_addr_dup_for_data_wbank_T_9; // @[MainPipe.scala 1174:39]
      end
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_data_write_dup_4_bits_way_en_r <= s2_way_en; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_data_write_dup_4_bits_addr_r <= s2_req_vaddr; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_miss_dup_for_data_wbank_5 <= s2_req_miss; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_probe_dup_for_data_wbank_5 <= s2_req_probe; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_coh_dup_for_data_wbank_5_state <= s2_coh_state; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_source_dup_for_data_wbank_5 <= s2_req_source; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_cmd_dup_for_data_wbank_5 <= s2_req_cmd; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_replace_dup_for_data_wbank_5 <= s2_req_replace; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_amo_hit_dup_for_data_wbank_5 <= s2_amo_hit; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_store_hit_dup_for_data_wbank_5 <= s2_store_hit; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_addr_dup_for_data_wbank_5 <= s2_req_addr; // @[Reg.scala 17:22]
    end
    if (s3_valid_dup_for_data_wbank_5 & (s3_lr_dup_for_data_wbank_5 | s3_sc_dup_for_data_wbank_5)) begin // @[MainPipe.scala 1171:104]
      if (s3_can_do_amo_dup_for_data_wbank_5 & s3_lr_dup_for_data_wbank_5) begin // @[MainPipe.scala 1172:77]
        lrsc_addr_dup_for_data_wbank_5 <= _lrsc_addr_dup_for_data_wbank_T_11; // @[MainPipe.scala 1174:39]
      end
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_data_write_dup_5_bits_way_en_r <= s2_way_en; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_data_write_dup_5_bits_addr_r <= s2_req_vaddr; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_miss_dup_for_data_wbank_6 <= s2_req_miss; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_probe_dup_for_data_wbank_6 <= s2_req_probe; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_coh_dup_for_data_wbank_6_state <= s2_coh_state; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_source_dup_for_data_wbank_6 <= s2_req_source; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_cmd_dup_for_data_wbank_6 <= s2_req_cmd; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_replace_dup_for_data_wbank_6 <= s2_req_replace; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_amo_hit_dup_for_data_wbank_6 <= s2_amo_hit; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_store_hit_dup_for_data_wbank_6 <= s2_store_hit; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_addr_dup_for_data_wbank_6 <= s2_req_addr; // @[Reg.scala 17:22]
    end
    if (s3_valid_dup_for_data_wbank_6 & (s3_lr_dup_for_data_wbank_6 | s3_sc_dup_for_data_wbank_6)) begin // @[MainPipe.scala 1171:104]
      if (s3_can_do_amo_dup_for_data_wbank_6 & s3_lr_dup_for_data_wbank_6) begin // @[MainPipe.scala 1172:77]
        lrsc_addr_dup_for_data_wbank_6 <= _lrsc_addr_dup_for_data_wbank_T_13; // @[MainPipe.scala 1174:39]
      end
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_data_write_dup_6_bits_way_en_r <= s2_way_en; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_data_write_dup_6_bits_addr_r <= s2_req_vaddr; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_miss_dup_for_data_wbank_7 <= s2_req_miss; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_probe_dup_for_data_wbank_7 <= s2_req_probe; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_coh_dup_for_data_wbank_7_state <= s2_coh_state; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_source_dup_for_data_wbank_7 <= s2_req_source; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_cmd_dup_for_data_wbank_7 <= s2_req_cmd; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_replace_dup_for_data_wbank_7 <= s2_req_replace; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_amo_hit_dup_for_data_wbank_7 <= s2_amo_hit; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_store_hit_dup_for_data_wbank_7 <= s2_store_hit; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_addr_dup_for_data_wbank_7 <= s2_req_addr; // @[Reg.scala 17:22]
    end
    if (s3_valid_dup_for_data_wbank_7 & (s3_lr_dup_for_data_wbank_7 | s3_sc_dup_for_data_wbank_7)) begin // @[MainPipe.scala 1171:104]
      if (s3_can_do_amo_dup_for_data_wbank_7 & s3_lr_dup_for_data_wbank_7) begin // @[MainPipe.scala 1172:77]
        lrsc_addr_dup_for_data_wbank_7 <= _lrsc_addr_dup_for_data_wbank_T_15; // @[MainPipe.scala 1174:39]
      end
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_data_write_dup_7_bits_way_en_r <= s2_way_en; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_data_write_dup_7_bits_addr_r <= s2_req_vaddr; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      miss_update_meta_dup_for_wb_valid <= s2_req_miss; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_probe_dup_for_wb_valid <= s2_req_probe; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_tag_match_dup_for_wb_valid <= s2_tag_match; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_coh_dup_for_wb_valid_state <= s2_coh_state; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_probe_param_dup_for_wb_valid <= s2_req_probe_param; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_source_dup_for_wb_valid <= s2_req_source; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_cmd_dup_for_wb_valid <= s2_req_cmd; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_replace_dup_for_wb_valid <= s2_req_replace; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_amo_hit_dup_for_wb_valid <= s2_amo_hit; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_store_hit_dup_for_wb_valid <= s2_store_hit; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_req_addr_dup_for_wb_valid <= s2_req_addr; // @[Reg.scala 17:22]
    end
    if (s3_valid_dup_for_wb_valid & (s3_lr_dup_for_wb_valid | s3_sc_dup_for_wb_valid)) begin // @[MainPipe.scala 1275:90]
      if (s3_can_do_amo_dup_for_wb_valid & s3_lr_dup_for_wb_valid) begin // @[MainPipe.scala 1276:69]
        lrsc_addr_dup_for_wb_valid <= _lrsc_addr_dup_for_wb_valid_T_1; // @[MainPipe.scala 1278:34]
      end
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_need_replacement_dup_for_wb_valid <= s2_need_replacement; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      s3_tag_dup_for_wb_valid <= s2_tag; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      writeback_data_dup_for_wb_valid_r <= s2_req_probe_need_data; // @[Reg.scala 17:22]
    end
    io_replace_access_valid_REG <= s1_fire & (_s1_pregen_can_go_to_mq_T_6 | _s1_need_replacement_T) &
      _s1_need_replacement_T_1; // @[MainPipe.scala 1547:82]
    io_replace_access_bits_way_REG <= {_io_replace_access_bits_way_T,_io_replace_access_bits_way_T_5}; // @[Cat.scala 31:58]
    if (s0_fire) begin // @[Reg.scala 17:18]
      io_status_dup_0_s1_bits_set_r <= s0_idx; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      io_status_dup_0_s2_valid_r <= s1_req_replace; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      io_status_dup_0_s2_bits_set_r <= s1_idx; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      if (s1_req_replace) begin // @[MainPipe.scala 306:22]
        io_status_dup_0_s2_bits_way_en_r <= s1_req_replace_way_en;
      end else if (s1_req_miss) begin // @[MainPipe.scala 309:8]
        io_status_dup_0_s2_bits_way_en_r <= s1_req_miss_way_en;
      end else if (s1_need_replacement) begin // @[MainPipe.scala 312:10]
        io_status_dup_0_s2_bits_way_en_r <= s1_repl_way_en;
      end else begin
        io_status_dup_0_s2_bits_way_en_r <= s1_tag_match_way;
      end
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_0_s3_valid_r <= s2_req_replace; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_0_s3_bits_set_r <= s2_idx; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_0_s3_bits_way_en_r <= s2_way_en; // @[Reg.scala 17:22]
    end
    if (s0_fire) begin // @[Reg.scala 17:18]
      io_status_dup_1_s1_bits_set_r <= s0_idx; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      io_status_dup_1_s2_valid_r <= s1_req_replace; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      io_status_dup_1_s2_bits_set_r <= s1_idx; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      if (s1_req_replace) begin // @[MainPipe.scala 306:22]
        io_status_dup_1_s2_bits_way_en_r <= s1_req_replace_way_en;
      end else if (s1_req_miss) begin // @[MainPipe.scala 309:8]
        io_status_dup_1_s2_bits_way_en_r <= s1_req_miss_way_en;
      end else if (s1_need_replacement) begin // @[MainPipe.scala 312:10]
        io_status_dup_1_s2_bits_way_en_r <= s1_repl_way_en;
      end else begin
        io_status_dup_1_s2_bits_way_en_r <= s1_tag_match_way;
      end
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_1_s3_valid_r <= s2_req_replace; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_1_s3_bits_set_r <= s2_idx; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_1_s3_bits_way_en_r <= s2_way_en; // @[Reg.scala 17:22]
    end
    if (s0_fire) begin // @[Reg.scala 17:18]
      io_status_dup_2_s1_bits_set_r <= s0_idx; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      io_status_dup_2_s2_valid_r <= s1_req_replace; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      io_status_dup_2_s2_bits_set_r <= s1_idx; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      if (s1_req_replace) begin // @[MainPipe.scala 306:22]
        io_status_dup_2_s2_bits_way_en_r <= s1_req_replace_way_en;
      end else if (s1_req_miss) begin // @[MainPipe.scala 309:8]
        io_status_dup_2_s2_bits_way_en_r <= s1_req_miss_way_en;
      end else if (s1_need_replacement) begin // @[MainPipe.scala 312:10]
        io_status_dup_2_s2_bits_way_en_r <= s1_repl_way_en;
      end else begin
        io_status_dup_2_s2_bits_way_en_r <= s1_tag_match_way;
      end
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_2_s3_valid_r <= s2_req_replace; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_2_s3_bits_set_r <= s2_idx; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_2_s3_bits_way_en_r <= s2_way_en; // @[Reg.scala 17:22]
    end
    if (s0_fire) begin // @[Reg.scala 17:18]
      io_status_dup_3_s1_bits_set_r <= s0_idx; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      io_status_dup_3_s2_valid_r <= s1_req_replace; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      io_status_dup_3_s2_bits_set_r <= s1_idx; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      if (s1_req_replace) begin // @[MainPipe.scala 306:22]
        io_status_dup_3_s2_bits_way_en_r <= s1_req_replace_way_en;
      end else if (s1_req_miss) begin // @[MainPipe.scala 309:8]
        io_status_dup_3_s2_bits_way_en_r <= s1_req_miss_way_en;
      end else if (s1_need_replacement) begin // @[MainPipe.scala 312:10]
        io_status_dup_3_s2_bits_way_en_r <= s1_repl_way_en;
      end else begin
        io_status_dup_3_s2_bits_way_en_r <= s1_tag_match_way;
      end
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_3_s3_valid_r <= s2_req_replace; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_3_s3_bits_set_r <= s2_idx; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_3_s3_bits_way_en_r <= s2_way_en; // @[Reg.scala 17:22]
    end
    if (s0_fire) begin // @[Reg.scala 17:18]
      io_status_dup_4_s1_bits_set_r <= s0_idx; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      io_status_dup_4_s2_valid_r <= s1_req_replace; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      io_status_dup_4_s2_bits_set_r <= s1_idx; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      if (s1_req_replace) begin // @[MainPipe.scala 306:22]
        io_status_dup_4_s2_bits_way_en_r <= s1_req_replace_way_en;
      end else if (s1_req_miss) begin // @[MainPipe.scala 309:8]
        io_status_dup_4_s2_bits_way_en_r <= s1_req_miss_way_en;
      end else if (s1_need_replacement) begin // @[MainPipe.scala 312:10]
        io_status_dup_4_s2_bits_way_en_r <= s1_repl_way_en;
      end else begin
        io_status_dup_4_s2_bits_way_en_r <= s1_tag_match_way;
      end
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_4_s3_valid_r <= s2_req_replace; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_4_s3_bits_set_r <= s2_idx; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_4_s3_bits_way_en_r <= s2_way_en; // @[Reg.scala 17:22]
    end
    if (s0_fire) begin // @[Reg.scala 17:18]
      io_status_dup_5_s1_bits_set_r <= s0_idx; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      io_status_dup_5_s2_valid_r <= s1_req_replace; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      io_status_dup_5_s2_bits_set_r <= s1_idx; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      if (s1_req_replace) begin // @[MainPipe.scala 306:22]
        io_status_dup_5_s2_bits_way_en_r <= s1_req_replace_way_en;
      end else if (s1_req_miss) begin // @[MainPipe.scala 309:8]
        io_status_dup_5_s2_bits_way_en_r <= s1_req_miss_way_en;
      end else if (s1_need_replacement) begin // @[MainPipe.scala 312:10]
        io_status_dup_5_s2_bits_way_en_r <= s1_repl_way_en;
      end else begin
        io_status_dup_5_s2_bits_way_en_r <= s1_tag_match_way;
      end
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_5_s3_valid_r <= s2_req_replace; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_5_s3_bits_set_r <= s2_idx; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_5_s3_bits_way_en_r <= s2_way_en; // @[Reg.scala 17:22]
    end
    if (s0_fire) begin // @[Reg.scala 17:18]
      io_status_dup_6_s1_bits_set_r <= s0_idx; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      io_status_dup_6_s2_valid_r <= s1_req_replace; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      io_status_dup_6_s2_bits_set_r <= s1_idx; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      if (s1_req_replace) begin // @[MainPipe.scala 306:22]
        io_status_dup_6_s2_bits_way_en_r <= s1_req_replace_way_en;
      end else if (s1_req_miss) begin // @[MainPipe.scala 309:8]
        io_status_dup_6_s2_bits_way_en_r <= s1_req_miss_way_en;
      end else if (s1_need_replacement) begin // @[MainPipe.scala 312:10]
        io_status_dup_6_s2_bits_way_en_r <= s1_repl_way_en;
      end else begin
        io_status_dup_6_s2_bits_way_en_r <= s1_tag_match_way;
      end
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_6_s3_valid_r <= s2_req_replace; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_6_s3_bits_set_r <= s2_idx; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_6_s3_bits_way_en_r <= s2_way_en; // @[Reg.scala 17:22]
    end
    if (s0_fire) begin // @[Reg.scala 17:18]
      io_status_dup_7_s1_bits_set_r <= s0_idx; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      io_status_dup_7_s2_valid_r <= s1_req_replace; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      io_status_dup_7_s2_bits_set_r <= s1_idx; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      if (s1_req_replace) begin // @[MainPipe.scala 306:22]
        io_status_dup_7_s2_bits_way_en_r <= s1_req_replace_way_en;
      end else if (s1_req_miss) begin // @[MainPipe.scala 309:8]
        io_status_dup_7_s2_bits_way_en_r <= s1_req_miss_way_en;
      end else if (s1_need_replacement) begin // @[MainPipe.scala 312:10]
        io_status_dup_7_s2_bits_way_en_r <= s1_repl_way_en;
      end else begin
        io_status_dup_7_s2_bits_way_en_r <= s1_tag_match_way;
      end
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_7_s3_valid_r <= s2_req_replace; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_7_s3_bits_set_r <= s2_idx; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_7_s3_bits_way_en_r <= s2_way_en; // @[Reg.scala 17:22]
    end
    if (s0_fire) begin // @[Reg.scala 17:18]
      io_status_dup_8_s1_bits_set_r <= s0_idx; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      io_status_dup_8_s2_valid_r <= s1_req_replace; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      io_status_dup_8_s2_bits_set_r <= s1_idx; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      if (s1_req_replace) begin // @[MainPipe.scala 306:22]
        io_status_dup_8_s2_bits_way_en_r <= s1_req_replace_way_en;
      end else if (s1_req_miss) begin // @[MainPipe.scala 309:8]
        io_status_dup_8_s2_bits_way_en_r <= s1_req_miss_way_en;
      end else if (s1_need_replacement) begin // @[MainPipe.scala 312:10]
        io_status_dup_8_s2_bits_way_en_r <= s1_repl_way_en;
      end else begin
        io_status_dup_8_s2_bits_way_en_r <= s1_tag_match_way;
      end
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_8_s3_valid_r <= s2_req_replace; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_8_s3_bits_set_r <= s2_idx; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_8_s3_bits_way_en_r <= s2_way_en; // @[Reg.scala 17:22]
    end
    if (s0_fire) begin // @[Reg.scala 17:18]
      io_status_dup_9_s1_bits_set_r <= s0_idx; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      io_status_dup_9_s2_valid_r <= s1_req_replace; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      io_status_dup_9_s2_bits_set_r <= s1_idx; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      if (s1_req_replace) begin // @[MainPipe.scala 306:22]
        io_status_dup_9_s2_bits_way_en_r <= s1_req_replace_way_en;
      end else if (s1_req_miss) begin // @[MainPipe.scala 309:8]
        io_status_dup_9_s2_bits_way_en_r <= s1_req_miss_way_en;
      end else if (s1_need_replacement) begin // @[MainPipe.scala 312:10]
        io_status_dup_9_s2_bits_way_en_r <= s1_repl_way_en;
      end else begin
        io_status_dup_9_s2_bits_way_en_r <= s1_tag_match_way;
      end
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_9_s3_valid_r <= s2_req_replace; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_9_s3_bits_set_r <= s2_idx; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_9_s3_bits_way_en_r <= s2_way_en; // @[Reg.scala 17:22]
    end
    if (s0_fire) begin // @[Reg.scala 17:18]
      io_status_dup_10_s1_bits_set_r <= s0_idx; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      io_status_dup_10_s2_valid_r <= s1_req_replace; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      io_status_dup_10_s2_bits_set_r <= s1_idx; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      if (s1_req_replace) begin // @[MainPipe.scala 306:22]
        io_status_dup_10_s2_bits_way_en_r <= s1_req_replace_way_en;
      end else if (s1_req_miss) begin // @[MainPipe.scala 309:8]
        io_status_dup_10_s2_bits_way_en_r <= s1_req_miss_way_en;
      end else if (s1_need_replacement) begin // @[MainPipe.scala 312:10]
        io_status_dup_10_s2_bits_way_en_r <= s1_repl_way_en;
      end else begin
        io_status_dup_10_s2_bits_way_en_r <= s1_tag_match_way;
      end
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_10_s3_valid_r <= s2_req_replace; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_10_s3_bits_set_r <= s2_idx; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_10_s3_bits_way_en_r <= s2_way_en; // @[Reg.scala 17:22]
    end
    if (s0_fire) begin // @[Reg.scala 17:18]
      io_status_dup_11_s1_bits_set_r <= s0_idx; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      io_status_dup_11_s2_valid_r <= s1_req_replace; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      io_status_dup_11_s2_bits_set_r <= s1_idx; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      if (s1_req_replace) begin // @[MainPipe.scala 306:22]
        io_status_dup_11_s2_bits_way_en_r <= s1_req_replace_way_en;
      end else if (s1_req_miss) begin // @[MainPipe.scala 309:8]
        io_status_dup_11_s2_bits_way_en_r <= s1_req_miss_way_en;
      end else if (s1_need_replacement) begin // @[MainPipe.scala 312:10]
        io_status_dup_11_s2_bits_way_en_r <= s1_repl_way_en;
      end else begin
        io_status_dup_11_s2_bits_way_en_r <= s1_tag_match_way;
      end
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_11_s3_valid_r <= s2_req_replace; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_11_s3_bits_set_r <= s2_idx; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_11_s3_bits_way_en_r <= s2_way_en; // @[Reg.scala 17:22]
    end
    if (s0_fire) begin // @[Reg.scala 17:18]
      io_status_dup_12_s1_bits_set_r <= s0_idx; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      io_status_dup_12_s2_valid_r <= s1_req_replace; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      io_status_dup_12_s2_bits_set_r <= s1_idx; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      if (s1_req_replace) begin // @[MainPipe.scala 306:22]
        io_status_dup_12_s2_bits_way_en_r <= s1_req_replace_way_en;
      end else if (s1_req_miss) begin // @[MainPipe.scala 309:8]
        io_status_dup_12_s2_bits_way_en_r <= s1_req_miss_way_en;
      end else if (s1_need_replacement) begin // @[MainPipe.scala 312:10]
        io_status_dup_12_s2_bits_way_en_r <= s1_repl_way_en;
      end else begin
        io_status_dup_12_s2_bits_way_en_r <= s1_tag_match_way;
      end
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_12_s3_valid_r <= s2_req_replace; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_12_s3_bits_set_r <= s2_idx; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_12_s3_bits_way_en_r <= s2_way_en; // @[Reg.scala 17:22]
    end
    if (s0_fire) begin // @[Reg.scala 17:18]
      io_status_dup_13_s1_bits_set_r <= s0_idx; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      io_status_dup_13_s2_valid_r <= s1_req_replace; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      io_status_dup_13_s2_bits_set_r <= s1_idx; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      if (s1_req_replace) begin // @[MainPipe.scala 306:22]
        io_status_dup_13_s2_bits_way_en_r <= s1_req_replace_way_en;
      end else if (s1_req_miss) begin // @[MainPipe.scala 309:8]
        io_status_dup_13_s2_bits_way_en_r <= s1_req_miss_way_en;
      end else if (s1_need_replacement) begin // @[MainPipe.scala 312:10]
        io_status_dup_13_s2_bits_way_en_r <= s1_repl_way_en;
      end else begin
        io_status_dup_13_s2_bits_way_en_r <= s1_tag_match_way;
      end
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_13_s3_valid_r <= s2_req_replace; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_13_s3_bits_set_r <= s2_idx; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_13_s3_bits_way_en_r <= s2_way_en; // @[Reg.scala 17:22]
    end
    if (s0_fire) begin // @[Reg.scala 17:18]
      io_status_dup_14_s1_bits_set_r <= s0_idx; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      io_status_dup_14_s2_valid_r <= s1_req_replace; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      io_status_dup_14_s2_bits_set_r <= s1_idx; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      if (s1_req_replace) begin // @[MainPipe.scala 306:22]
        io_status_dup_14_s2_bits_way_en_r <= s1_req_replace_way_en;
      end else if (s1_req_miss) begin // @[MainPipe.scala 309:8]
        io_status_dup_14_s2_bits_way_en_r <= s1_req_miss_way_en;
      end else if (s1_need_replacement) begin // @[MainPipe.scala 312:10]
        io_status_dup_14_s2_bits_way_en_r <= s1_repl_way_en;
      end else begin
        io_status_dup_14_s2_bits_way_en_r <= s1_tag_match_way;
      end
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_14_s3_valid_r <= s2_req_replace; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_14_s3_bits_set_r <= s2_idx; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_14_s3_bits_way_en_r <= s2_way_en; // @[Reg.scala 17:22]
    end
    if (s0_fire) begin // @[Reg.scala 17:18]
      io_status_dup_15_s1_bits_set_r <= s0_idx; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      io_status_dup_15_s2_valid_r <= s1_req_replace; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      io_status_dup_15_s2_bits_set_r <= s1_idx; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      if (s1_req_replace) begin // @[MainPipe.scala 306:22]
        io_status_dup_15_s2_bits_way_en_r <= s1_req_replace_way_en;
      end else if (s1_req_miss) begin // @[MainPipe.scala 309:8]
        io_status_dup_15_s2_bits_way_en_r <= s1_req_miss_way_en;
      end else if (s1_need_replacement) begin // @[MainPipe.scala 312:10]
        io_status_dup_15_s2_bits_way_en_r <= s1_repl_way_en;
      end else begin
        io_status_dup_15_s2_bits_way_en_r <= s1_tag_match_way;
      end
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_15_s3_valid_r <= s2_req_replace; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_15_s3_bits_set_r <= s2_idx; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_15_s3_bits_way_en_r <= s2_way_en; // @[Reg.scala 17:22]
    end
    if (s0_fire) begin // @[Reg.scala 17:18]
      io_status_dup_16_s1_bits_set_r <= s0_idx; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      io_status_dup_16_s2_valid_r <= s1_req_replace; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      io_status_dup_16_s2_bits_set_r <= s1_idx; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      if (s1_req_replace) begin // @[MainPipe.scala 306:22]
        io_status_dup_16_s2_bits_way_en_r <= s1_req_replace_way_en;
      end else if (s1_req_miss) begin // @[MainPipe.scala 309:8]
        io_status_dup_16_s2_bits_way_en_r <= s1_req_miss_way_en;
      end else if (s1_need_replacement) begin // @[MainPipe.scala 312:10]
        io_status_dup_16_s2_bits_way_en_r <= s1_repl_way_en;
      end else begin
        io_status_dup_16_s2_bits_way_en_r <= s1_tag_match_way;
      end
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_16_s3_valid_r <= s2_req_replace; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_16_s3_bits_set_r <= s2_idx; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_16_s3_bits_way_en_r <= s2_way_en; // @[Reg.scala 17:22]
    end
    if (s0_fire) begin // @[Reg.scala 17:18]
      io_status_dup_17_s1_bits_set_r <= s0_idx; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      io_status_dup_17_s2_valid_r <= s1_req_replace; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      io_status_dup_17_s2_bits_set_r <= s1_idx; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      if (s1_req_replace) begin // @[MainPipe.scala 306:22]
        io_status_dup_17_s2_bits_way_en_r <= s1_req_replace_way_en;
      end else if (s1_req_miss) begin // @[MainPipe.scala 309:8]
        io_status_dup_17_s2_bits_way_en_r <= s1_req_miss_way_en;
      end else if (s1_need_replacement) begin // @[MainPipe.scala 312:10]
        io_status_dup_17_s2_bits_way_en_r <= s1_repl_way_en;
      end else begin
        io_status_dup_17_s2_bits_way_en_r <= s1_tag_match_way;
      end
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_17_s3_valid_r <= s2_req_replace; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_17_s3_bits_set_r <= s2_idx; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_17_s3_bits_way_en_r <= s2_way_en; // @[Reg.scala 17:22]
    end
    if (s0_fire) begin // @[Reg.scala 17:18]
      io_status_dup_18_s1_bits_set_r <= s0_idx; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      io_status_dup_18_s2_valid_r <= s1_req_replace; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      io_status_dup_18_s2_bits_set_r <= s1_idx; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      if (s1_req_replace) begin // @[MainPipe.scala 306:22]
        io_status_dup_18_s2_bits_way_en_r <= s1_req_replace_way_en;
      end else if (s1_req_miss) begin // @[MainPipe.scala 309:8]
        io_status_dup_18_s2_bits_way_en_r <= s1_req_miss_way_en;
      end else if (s1_need_replacement) begin // @[MainPipe.scala 312:10]
        io_status_dup_18_s2_bits_way_en_r <= s1_repl_way_en;
      end else begin
        io_status_dup_18_s2_bits_way_en_r <= s1_tag_match_way;
      end
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_18_s3_valid_r <= s2_req_replace; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_18_s3_bits_set_r <= s2_idx; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_18_s3_bits_way_en_r <= s2_way_en; // @[Reg.scala 17:22]
    end
    if (s0_fire) begin // @[Reg.scala 17:18]
      io_status_dup_19_s1_bits_set_r <= s0_idx; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      io_status_dup_19_s2_valid_r <= s1_req_replace; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      io_status_dup_19_s2_bits_set_r <= s1_idx; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      if (s1_req_replace) begin // @[MainPipe.scala 306:22]
        io_status_dup_19_s2_bits_way_en_r <= s1_req_replace_way_en;
      end else if (s1_req_miss) begin // @[MainPipe.scala 309:8]
        io_status_dup_19_s2_bits_way_en_r <= s1_req_miss_way_en;
      end else if (s1_need_replacement) begin // @[MainPipe.scala 312:10]
        io_status_dup_19_s2_bits_way_en_r <= s1_repl_way_en;
      end else begin
        io_status_dup_19_s2_bits_way_en_r <= s1_tag_match_way;
      end
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_19_s3_valid_r <= s2_req_replace; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_19_s3_bits_set_r <= s2_idx; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_19_s3_bits_way_en_r <= s2_way_en; // @[Reg.scala 17:22]
    end
    if (s0_fire) begin // @[Reg.scala 17:18]
      io_status_dup_20_s1_bits_set_r <= s0_idx; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      io_status_dup_20_s2_valid_r <= s1_req_replace; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      io_status_dup_20_s2_bits_set_r <= s1_idx; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      if (s1_req_replace) begin // @[MainPipe.scala 306:22]
        io_status_dup_20_s2_bits_way_en_r <= s1_req_replace_way_en;
      end else if (s1_req_miss) begin // @[MainPipe.scala 309:8]
        io_status_dup_20_s2_bits_way_en_r <= s1_req_miss_way_en;
      end else if (s1_need_replacement) begin // @[MainPipe.scala 312:10]
        io_status_dup_20_s2_bits_way_en_r <= s1_repl_way_en;
      end else begin
        io_status_dup_20_s2_bits_way_en_r <= s1_tag_match_way;
      end
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_20_s3_valid_r <= s2_req_replace; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_20_s3_bits_set_r <= s2_idx; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_20_s3_bits_way_en_r <= s2_way_en; // @[Reg.scala 17:22]
    end
    if (s0_fire) begin // @[Reg.scala 17:18]
      io_status_dup_21_s1_bits_set_r <= s0_idx; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      io_status_dup_21_s2_valid_r <= s1_req_replace; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      io_status_dup_21_s2_bits_set_r <= s1_idx; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      if (s1_req_replace) begin // @[MainPipe.scala 306:22]
        io_status_dup_21_s2_bits_way_en_r <= s1_req_replace_way_en;
      end else if (s1_req_miss) begin // @[MainPipe.scala 309:8]
        io_status_dup_21_s2_bits_way_en_r <= s1_req_miss_way_en;
      end else if (s1_need_replacement) begin // @[MainPipe.scala 312:10]
        io_status_dup_21_s2_bits_way_en_r <= s1_repl_way_en;
      end else begin
        io_status_dup_21_s2_bits_way_en_r <= s1_tag_match_way;
      end
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_21_s3_valid_r <= s2_req_replace; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_21_s3_bits_set_r <= s2_idx; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_21_s3_bits_way_en_r <= s2_way_en; // @[Reg.scala 17:22]
    end
    if (s0_fire) begin // @[Reg.scala 17:18]
      io_status_dup_22_s1_bits_set_r <= s0_idx; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      io_status_dup_22_s2_valid_r <= s1_req_replace; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      io_status_dup_22_s2_bits_set_r <= s1_idx; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      if (s1_req_replace) begin // @[MainPipe.scala 306:22]
        io_status_dup_22_s2_bits_way_en_r <= s1_req_replace_way_en;
      end else if (s1_req_miss) begin // @[MainPipe.scala 309:8]
        io_status_dup_22_s2_bits_way_en_r <= s1_req_miss_way_en;
      end else if (s1_need_replacement) begin // @[MainPipe.scala 312:10]
        io_status_dup_22_s2_bits_way_en_r <= s1_repl_way_en;
      end else begin
        io_status_dup_22_s2_bits_way_en_r <= s1_tag_match_way;
      end
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_22_s3_valid_r <= s2_req_replace; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_22_s3_bits_set_r <= s2_idx; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_22_s3_bits_way_en_r <= s2_way_en; // @[Reg.scala 17:22]
    end
    if (s0_fire) begin // @[Reg.scala 17:18]
      io_status_dup_23_s1_bits_set_r <= s0_idx; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      io_status_dup_23_s2_valid_r <= s1_req_replace; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      io_status_dup_23_s2_bits_set_r <= s1_idx; // @[Reg.scala 17:22]
    end
    if (s1_fire) begin // @[Reg.scala 17:18]
      if (s1_req_replace) begin // @[MainPipe.scala 306:22]
        io_status_dup_23_s2_bits_way_en_r <= s1_req_replace_way_en;
      end else if (s1_req_miss) begin // @[MainPipe.scala 309:8]
        io_status_dup_23_s2_bits_way_en_r <= s1_req_miss_way_en;
      end else if (s1_need_replacement) begin // @[MainPipe.scala 312:10]
        io_status_dup_23_s2_bits_way_en_r <= s1_repl_way_en;
      end else begin
        io_status_dup_23_s2_bits_way_en_r <= s1_tag_match_way;
      end
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_23_s3_valid_r <= s2_req_replace; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_23_s3_bits_set_r <= s2_idx; // @[Reg.scala 17:22]
    end
    if (s2_fire_to_s3) begin // @[Reg.scala 17:18]
      io_status_dup_23_s3_bits_way_en_r <= s2_way_en; // @[Reg.scala 17:22]
    end
    io_error_valid_REG <= s2_valid & s2_can_go; // @[MainPipe.scala 399:26]
    if (s2_fire) begin // @[Reg.scala 17:18]
      io_error_report_to_beu_r <= s2_tag_error; // @[Reg.scala 17:22]
    end
    io_error_report_to_beu_REG <= s2_valid & s2_can_go; // @[MainPipe.scala 399:26]
    if (s2_fire) begin // @[Reg.scala 17:18]
      io_error_paddr_r <= s2_req_addr; // @[Reg.scala 17:22]
    end
    if (s2_fire) begin // @[Reg.scala 17:18]
      io_error_source_tag_r <= s2_tag_error; // @[Reg.scala 17:22]
    end
    if (s2_fire) begin // @[Reg.scala 17:18]
      io_error_source_l2_r <= _io_error_source_l2_T; // @[Reg.scala 17:22]
    end
    if (s2_fire) begin // @[Reg.scala 17:18]
      io_error_opType_store_r <= _io_error_opType_store_T_2; // @[Reg.scala 17:22]
    end
    if (s2_fire) begin // @[Reg.scala 17:18]
      io_error_opType_probe_r <= s2_req_probe; // @[Reg.scala 17:22]
    end
    if (s2_fire) begin // @[Reg.scala 17:18]
      io_error_opType_release_r <= s2_req_replace; // @[Reg.scala 17:22]
    end
    if (s2_fire) begin // @[Reg.scala 17:18]
      io_error_opType_atom_r <= _io_error_opType_atom_T_2; // @[Reg.scala 17:22]
    end
    io_perf_0_value_REG <= req_valid & s0_can_go; // @[MainPipe.scala 210:27]
    io_perf_0_value_REG_1 <= io_perf_0_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_1_value_REG <= _T_234 + _T_236; // @[Bitwise.scala 48:55]
    io_perf_1_value_REG_1 <= io_perf_1_value_REG; // @[PerfCounterUtils.scala 188:27]
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 257:18]
      s1_valid_dup_1 <= 1'h0; // @[MainPipe.scala 259:28]
    end else begin
      s1_valid_dup_1 <= s0_fire | _GEN_29;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 401:18]
      s2_valid_dup_0 <= 1'h0; // @[MainPipe.scala 403:28]
    end else begin
      s2_valid_dup_0 <= s1_fire | _GEN_135;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1368:24]
      s3_valid_dup_6 <= 1'h0; // @[MainPipe.scala 1370:28]
    end else begin
      s3_valid_dup_6 <= s2_fire_to_s3 | _GEN_712;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 257:18]
      s1_valid_dup_2 <= 1'h0; // @[MainPipe.scala 259:28]
    end else begin
      s1_valid_dup_2 <= s0_fire | _GEN_30;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 401:18]
      s2_valid_dup_1 <= 1'h0; // @[MainPipe.scala 403:28]
    end else begin
      s2_valid_dup_1 <= s1_fire | _GEN_136;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1368:24]
      s3_valid_dup_7 <= 1'h0; // @[MainPipe.scala 1370:28]
    end else begin
      s3_valid_dup_7 <= s2_fire_to_s3 | _GEN_713;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 257:18]
      s1_valid_dup_0 <= 1'h0; // @[MainPipe.scala 259:28]
    end else begin
      s1_valid_dup_0 <= s0_fire | _GEN_28;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 401:18]
      s2_valid_dup_3 <= 1'h0; // @[MainPipe.scala 403:28]
    end else begin
      s2_valid_dup_3 <= s1_fire | _GEN_138;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1368:24]
      s3_valid_dup_5 <= 1'h0; // @[MainPipe.scala 1370:28]
    end else begin
      s3_valid_dup_5 <= s2_fire_to_s3 | _GEN_711;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 548:46]
      lrsc_count_dup_0 <= 6'h0; // @[MainPipe.scala 549:35 550:18 555:18]
    end else if (s3_valid_dup_0 & (s3_lr | s3_sc)) begin // @[MainPipe.scala 558:36]
      if (s3_can_do_amo & s3_lr) begin // @[MainPipe.scala 562:30]
        lrsc_count_dup_0 <= 6'h3f;
      end else begin
        lrsc_count_dup_0 <= 6'h0;
      end
    end else if (io_invalid_resv_set) begin // @[MainPipe.scala 563:33]
      lrsc_count_dup_0 <= 6'h0; // @[MainPipe.scala 566:11]
    end else if (lrsc_count > 6'h0) begin // @[MainPipe.scala 500:31]
      lrsc_count_dup_0 <= _lrsc_count_dup_0_T_1;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1382:17]
      s3_s_amoalu_dup_0 <= 1'h0; // @[MainPipe.scala 1384:31]
    end else if (s3_fire) begin
      s3_s_amoalu_dup_0 <= 1'h0;
    end else begin
      s3_s_amoalu_dup_0 <= _GEN_375;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1382:17]
      s3_s_amoalu_dup_1 <= 1'h0; // @[MainPipe.scala 1384:31]
    end else if (s3_fire) begin
      s3_s_amoalu_dup_1 <= 1'h0;
    end else begin
      s3_s_amoalu_dup_1 <= _GEN_376;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 257:18]
      s1_valid <= 1'h0; // @[MainPipe.scala 258:14]
    end else begin
      s1_valid <= s0_fire | _GEN_27;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 257:18]
      s1_valid_dup_4 <= 1'h0; // @[MainPipe.scala 259:28]
    end else begin
      s1_valid_dup_4 <= s0_fire | _GEN_32;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 257:18]
      s1_valid_dup_5 <= 1'h0; // @[MainPipe.scala 259:28]
    end else begin
      s1_valid_dup_5 <= s0_fire | _GEN_33;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 257:18]
      s1_valid_dup_for_status_0 <= 1'h0; // @[MainPipe.scala 260:39]
    end else begin
      s1_valid_dup_for_status_0 <= s0_fire | _GEN_34;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 257:18]
      s1_valid_dup_for_status_1 <= 1'h0; // @[MainPipe.scala 260:39]
    end else begin
      s1_valid_dup_for_status_1 <= s0_fire | _GEN_35;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 257:18]
      s1_valid_dup_for_status_2 <= 1'h0; // @[MainPipe.scala 260:39]
    end else begin
      s1_valid_dup_for_status_2 <= s0_fire | _GEN_36;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 257:18]
      s1_valid_dup_for_status_3 <= 1'h0; // @[MainPipe.scala 260:39]
    end else begin
      s1_valid_dup_for_status_3 <= s0_fire | _GEN_37;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 257:18]
      s1_valid_dup_for_status_4 <= 1'h0; // @[MainPipe.scala 260:39]
    end else begin
      s1_valid_dup_for_status_4 <= s0_fire | _GEN_38;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 257:18]
      s1_valid_dup_for_status_5 <= 1'h0; // @[MainPipe.scala 260:39]
    end else begin
      s1_valid_dup_for_status_5 <= s0_fire | _GEN_39;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 257:18]
      s1_valid_dup_for_status_6 <= 1'h0; // @[MainPipe.scala 260:39]
    end else begin
      s1_valid_dup_for_status_6 <= s0_fire | _GEN_40;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 257:18]
      s1_valid_dup_for_status_7 <= 1'h0; // @[MainPipe.scala 260:39]
    end else begin
      s1_valid_dup_for_status_7 <= s0_fire | _GEN_41;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 257:18]
      s1_valid_dup_for_status_8 <= 1'h0; // @[MainPipe.scala 260:39]
    end else begin
      s1_valid_dup_for_status_8 <= s0_fire | _GEN_42;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 257:18]
      s1_valid_dup_for_status_9 <= 1'h0; // @[MainPipe.scala 260:39]
    end else begin
      s1_valid_dup_for_status_9 <= s0_fire | _GEN_43;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 257:18]
      s1_valid_dup_for_status_10 <= 1'h0; // @[MainPipe.scala 260:39]
    end else begin
      s1_valid_dup_for_status_10 <= s0_fire | _GEN_44;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 257:18]
      s1_valid_dup_for_status_11 <= 1'h0; // @[MainPipe.scala 260:39]
    end else begin
      s1_valid_dup_for_status_11 <= s0_fire | _GEN_45;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 257:18]
      s1_valid_dup_for_status_12 <= 1'h0; // @[MainPipe.scala 260:39]
    end else begin
      s1_valid_dup_for_status_12 <= s0_fire | _GEN_46;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 257:18]
      s1_valid_dup_for_status_13 <= 1'h0; // @[MainPipe.scala 260:39]
    end else begin
      s1_valid_dup_for_status_13 <= s0_fire | _GEN_47;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 257:18]
      s1_valid_dup_for_status_14 <= 1'h0; // @[MainPipe.scala 260:39]
    end else begin
      s1_valid_dup_for_status_14 <= s0_fire | _GEN_48;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 257:18]
      s1_valid_dup_for_status_15 <= 1'h0; // @[MainPipe.scala 260:39]
    end else begin
      s1_valid_dup_for_status_15 <= s0_fire | _GEN_49;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 257:18]
      s1_valid_dup_for_status_16 <= 1'h0; // @[MainPipe.scala 260:39]
    end else begin
      s1_valid_dup_for_status_16 <= s0_fire | _GEN_50;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 257:18]
      s1_valid_dup_for_status_17 <= 1'h0; // @[MainPipe.scala 260:39]
    end else begin
      s1_valid_dup_for_status_17 <= s0_fire | _GEN_51;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 257:18]
      s1_valid_dup_for_status_18 <= 1'h0; // @[MainPipe.scala 260:39]
    end else begin
      s1_valid_dup_for_status_18 <= s0_fire | _GEN_52;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 257:18]
      s1_valid_dup_for_status_19 <= 1'h0; // @[MainPipe.scala 260:39]
    end else begin
      s1_valid_dup_for_status_19 <= s0_fire | _GEN_53;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 257:18]
      s1_valid_dup_for_status_20 <= 1'h0; // @[MainPipe.scala 260:39]
    end else begin
      s1_valid_dup_for_status_20 <= s0_fire | _GEN_54;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 257:18]
      s1_valid_dup_for_status_21 <= 1'h0; // @[MainPipe.scala 260:39]
    end else begin
      s1_valid_dup_for_status_21 <= s0_fire | _GEN_55;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 257:18]
      s1_valid_dup_for_status_22 <= 1'h0; // @[MainPipe.scala 260:39]
    end else begin
      s1_valid_dup_for_status_22 <= s0_fire | _GEN_56;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 257:18]
      s1_valid_dup_for_status_23 <= 1'h0; // @[MainPipe.scala 260:39]
    end else begin
      s1_valid_dup_for_status_23 <= s0_fire | _GEN_57;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 401:18]
      s2_valid <= 1'h0; // @[MainPipe.scala 402:14]
    end else begin
      s2_valid <= s1_fire | _GEN_134;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 401:18]
      s2_valid_dup_2 <= 1'h0; // @[MainPipe.scala 403:28]
    end else begin
      s2_valid_dup_2 <= s1_fire | _GEN_137;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 401:18]
      s2_valid_dup_4 <= 1'h0; // @[MainPipe.scala 403:28]
    end else begin
      s2_valid_dup_4 <= s1_fire | _GEN_139;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 401:18]
      s2_valid_dup_5 <= 1'h0; // @[MainPipe.scala 403:28]
    end else begin
      s2_valid_dup_5 <= s1_fire | _GEN_140;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 401:18]
      s2_valid_dup_6 <= 1'h0; // @[MainPipe.scala 403:28]
    end else begin
      s2_valid_dup_6 <= s1_fire | _GEN_141;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 401:18]
      s2_valid_dup_7 <= 1'h0; // @[MainPipe.scala 403:28]
    end else begin
      s2_valid_dup_7 <= s1_fire | _GEN_142;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 401:18]
      s2_valid_dup_for_status_0 <= 1'h0; // @[MainPipe.scala 404:39]
    end else begin
      s2_valid_dup_for_status_0 <= s1_fire | _GEN_143;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 401:18]
      s2_valid_dup_for_status_1 <= 1'h0; // @[MainPipe.scala 404:39]
    end else begin
      s2_valid_dup_for_status_1 <= s1_fire | _GEN_144;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 401:18]
      s2_valid_dup_for_status_2 <= 1'h0; // @[MainPipe.scala 404:39]
    end else begin
      s2_valid_dup_for_status_2 <= s1_fire | _GEN_145;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 401:18]
      s2_valid_dup_for_status_3 <= 1'h0; // @[MainPipe.scala 404:39]
    end else begin
      s2_valid_dup_for_status_3 <= s1_fire | _GEN_146;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 401:18]
      s2_valid_dup_for_status_4 <= 1'h0; // @[MainPipe.scala 404:39]
    end else begin
      s2_valid_dup_for_status_4 <= s1_fire | _GEN_147;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 401:18]
      s2_valid_dup_for_status_5 <= 1'h0; // @[MainPipe.scala 404:39]
    end else begin
      s2_valid_dup_for_status_5 <= s1_fire | _GEN_148;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 401:18]
      s2_valid_dup_for_status_6 <= 1'h0; // @[MainPipe.scala 404:39]
    end else begin
      s2_valid_dup_for_status_6 <= s1_fire | _GEN_149;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 401:18]
      s2_valid_dup_for_status_7 <= 1'h0; // @[MainPipe.scala 404:39]
    end else begin
      s2_valid_dup_for_status_7 <= s1_fire | _GEN_150;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 401:18]
      s2_valid_dup_for_status_8 <= 1'h0; // @[MainPipe.scala 404:39]
    end else begin
      s2_valid_dup_for_status_8 <= s1_fire | _GEN_151;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 401:18]
      s2_valid_dup_for_status_9 <= 1'h0; // @[MainPipe.scala 404:39]
    end else begin
      s2_valid_dup_for_status_9 <= s1_fire | _GEN_152;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 401:18]
      s2_valid_dup_for_status_10 <= 1'h0; // @[MainPipe.scala 404:39]
    end else begin
      s2_valid_dup_for_status_10 <= s1_fire | _GEN_153;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 401:18]
      s2_valid_dup_for_status_11 <= 1'h0; // @[MainPipe.scala 404:39]
    end else begin
      s2_valid_dup_for_status_11 <= s1_fire | _GEN_154;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 401:18]
      s2_valid_dup_for_status_12 <= 1'h0; // @[MainPipe.scala 404:39]
    end else begin
      s2_valid_dup_for_status_12 <= s1_fire | _GEN_155;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 401:18]
      s2_valid_dup_for_status_13 <= 1'h0; // @[MainPipe.scala 404:39]
    end else begin
      s2_valid_dup_for_status_13 <= s1_fire | _GEN_156;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 401:18]
      s2_valid_dup_for_status_14 <= 1'h0; // @[MainPipe.scala 404:39]
    end else begin
      s2_valid_dup_for_status_14 <= s1_fire | _GEN_157;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 401:18]
      s2_valid_dup_for_status_15 <= 1'h0; // @[MainPipe.scala 404:39]
    end else begin
      s2_valid_dup_for_status_15 <= s1_fire | _GEN_158;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 401:18]
      s2_valid_dup_for_status_16 <= 1'h0; // @[MainPipe.scala 404:39]
    end else begin
      s2_valid_dup_for_status_16 <= s1_fire | _GEN_159;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 401:18]
      s2_valid_dup_for_status_17 <= 1'h0; // @[MainPipe.scala 404:39]
    end else begin
      s2_valid_dup_for_status_17 <= s1_fire | _GEN_160;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 401:18]
      s2_valid_dup_for_status_18 <= 1'h0; // @[MainPipe.scala 404:39]
    end else begin
      s2_valid_dup_for_status_18 <= s1_fire | _GEN_161;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 401:18]
      s2_valid_dup_for_status_19 <= 1'h0; // @[MainPipe.scala 404:39]
    end else begin
      s2_valid_dup_for_status_19 <= s1_fire | _GEN_162;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 401:18]
      s2_valid_dup_for_status_20 <= 1'h0; // @[MainPipe.scala 404:39]
    end else begin
      s2_valid_dup_for_status_20 <= s1_fire | _GEN_163;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 401:18]
      s2_valid_dup_for_status_21 <= 1'h0; // @[MainPipe.scala 404:39]
    end else begin
      s2_valid_dup_for_status_21 <= s1_fire | _GEN_164;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 401:18]
      s2_valid_dup_for_status_22 <= 1'h0; // @[MainPipe.scala 404:39]
    end else begin
      s2_valid_dup_for_status_22 <= s1_fire | _GEN_165;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 401:18]
      s2_valid_dup_for_status_23 <= 1'h0; // @[MainPipe.scala 404:39]
    end else begin
      s2_valid_dup_for_status_23 <= s1_fire | _GEN_166;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1368:24]
      s3_valid <= 1'h0; // @[MainPipe.scala 1369:14]
    end else begin
      s3_valid <= s2_fire_to_s3 | _GEN_705;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1368:24]
      s3_valid_dup_0 <= 1'h0; // @[MainPipe.scala 1370:28]
    end else begin
      s3_valid_dup_0 <= s2_fire_to_s3 | _GEN_706;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1368:24]
      s3_valid_dup_1 <= 1'h0; // @[MainPipe.scala 1370:28]
    end else begin
      s3_valid_dup_1 <= s2_fire_to_s3 | _GEN_707;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1368:24]
      s3_valid_dup_3 <= 1'h0; // @[MainPipe.scala 1370:28]
    end else begin
      s3_valid_dup_3 <= s2_fire_to_s3 | _GEN_709;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1368:24]
      s3_valid_dup_4 <= 1'h0; // @[MainPipe.scala 1370:28]
    end else begin
      s3_valid_dup_4 <= s2_fire_to_s3 | _GEN_710;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1368:24]
      s3_valid_dup_8 <= 1'h0; // @[MainPipe.scala 1370:28]
    end else begin
      s3_valid_dup_8 <= s2_fire_to_s3 | _GEN_714;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1368:24]
      s3_valid_dup_9 <= 1'h0; // @[MainPipe.scala 1370:28]
    end else begin
      s3_valid_dup_9 <= s2_fire_to_s3 | _GEN_715;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1368:24]
      s3_valid_dup_10 <= 1'h0; // @[MainPipe.scala 1370:28]
    end else begin
      s3_valid_dup_10 <= s2_fire_to_s3 | _GEN_716;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1368:24]
      s3_valid_dup_11 <= 1'h0; // @[MainPipe.scala 1370:28]
    end else begin
      s3_valid_dup_11 <= s2_fire_to_s3 | _GEN_717;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1368:24]
      s3_valid_dup_for_status_0 <= 1'h0; // @[MainPipe.scala 1371:39]
    end else begin
      s3_valid_dup_for_status_0 <= s2_fire_to_s3 | _GEN_720;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1368:24]
      s3_valid_dup_for_status_1 <= 1'h0; // @[MainPipe.scala 1371:39]
    end else begin
      s3_valid_dup_for_status_1 <= s2_fire_to_s3 | _GEN_721;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1368:24]
      s3_valid_dup_for_status_2 <= 1'h0; // @[MainPipe.scala 1371:39]
    end else begin
      s3_valid_dup_for_status_2 <= s2_fire_to_s3 | _GEN_722;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1368:24]
      s3_valid_dup_for_status_3 <= 1'h0; // @[MainPipe.scala 1371:39]
    end else begin
      s3_valid_dup_for_status_3 <= s2_fire_to_s3 | _GEN_723;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1368:24]
      s3_valid_dup_for_status_4 <= 1'h0; // @[MainPipe.scala 1371:39]
    end else begin
      s3_valid_dup_for_status_4 <= s2_fire_to_s3 | _GEN_724;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1368:24]
      s3_valid_dup_for_status_5 <= 1'h0; // @[MainPipe.scala 1371:39]
    end else begin
      s3_valid_dup_for_status_5 <= s2_fire_to_s3 | _GEN_725;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1368:24]
      s3_valid_dup_for_status_6 <= 1'h0; // @[MainPipe.scala 1371:39]
    end else begin
      s3_valid_dup_for_status_6 <= s2_fire_to_s3 | _GEN_726;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1368:24]
      s3_valid_dup_for_status_7 <= 1'h0; // @[MainPipe.scala 1371:39]
    end else begin
      s3_valid_dup_for_status_7 <= s2_fire_to_s3 | _GEN_727;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1368:24]
      s3_valid_dup_for_status_8 <= 1'h0; // @[MainPipe.scala 1371:39]
    end else begin
      s3_valid_dup_for_status_8 <= s2_fire_to_s3 | _GEN_728;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1368:24]
      s3_valid_dup_for_status_9 <= 1'h0; // @[MainPipe.scala 1371:39]
    end else begin
      s3_valid_dup_for_status_9 <= s2_fire_to_s3 | _GEN_729;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1368:24]
      s3_valid_dup_for_status_10 <= 1'h0; // @[MainPipe.scala 1371:39]
    end else begin
      s3_valid_dup_for_status_10 <= s2_fire_to_s3 | _GEN_730;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1368:24]
      s3_valid_dup_for_status_11 <= 1'h0; // @[MainPipe.scala 1371:39]
    end else begin
      s3_valid_dup_for_status_11 <= s2_fire_to_s3 | _GEN_731;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1368:24]
      s3_valid_dup_for_status_12 <= 1'h0; // @[MainPipe.scala 1371:39]
    end else begin
      s3_valid_dup_for_status_12 <= s2_fire_to_s3 | _GEN_732;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1368:24]
      s3_valid_dup_for_status_13 <= 1'h0; // @[MainPipe.scala 1371:39]
    end else begin
      s3_valid_dup_for_status_13 <= s2_fire_to_s3 | _GEN_733;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1368:24]
      s3_valid_dup_for_status_14 <= 1'h0; // @[MainPipe.scala 1371:39]
    end else begin
      s3_valid_dup_for_status_14 <= s2_fire_to_s3 | _GEN_734;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1368:24]
      s3_valid_dup_for_status_15 <= 1'h0; // @[MainPipe.scala 1371:39]
    end else begin
      s3_valid_dup_for_status_15 <= s2_fire_to_s3 | _GEN_735;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1368:24]
      s3_valid_dup_for_status_16 <= 1'h0; // @[MainPipe.scala 1371:39]
    end else begin
      s3_valid_dup_for_status_16 <= s2_fire_to_s3 | _GEN_736;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1368:24]
      s3_valid_dup_for_status_17 <= 1'h0; // @[MainPipe.scala 1371:39]
    end else begin
      s3_valid_dup_for_status_17 <= s2_fire_to_s3 | _GEN_737;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1368:24]
      s3_valid_dup_for_status_18 <= 1'h0; // @[MainPipe.scala 1371:39]
    end else begin
      s3_valid_dup_for_status_18 <= s2_fire_to_s3 | _GEN_738;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1368:24]
      s3_valid_dup_for_status_19 <= 1'h0; // @[MainPipe.scala 1371:39]
    end else begin
      s3_valid_dup_for_status_19 <= s2_fire_to_s3 | _GEN_739;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1368:24]
      s3_valid_dup_for_status_20 <= 1'h0; // @[MainPipe.scala 1371:39]
    end else begin
      s3_valid_dup_for_status_20 <= s2_fire_to_s3 | _GEN_740;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1368:24]
      s3_valid_dup_for_status_21 <= 1'h0; // @[MainPipe.scala 1371:39]
    end else begin
      s3_valid_dup_for_status_21 <= s2_fire_to_s3 | _GEN_741;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1368:24]
      s3_valid_dup_for_status_22 <= 1'h0; // @[MainPipe.scala 1371:39]
    end else begin
      s3_valid_dup_for_status_22 <= s2_fire_to_s3 | _GEN_742;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1368:24]
      s3_valid_dup_for_status_23 <= 1'h0; // @[MainPipe.scala 1371:39]
    end else begin
      s3_valid_dup_for_status_23 <= s2_fire_to_s3 | _GEN_743;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 548:46]
      lrsc_count_dup_1 <= 6'h0; // @[MainPipe.scala 549:35 550:18 555:18]
    end else if (s3_valid_dup_0 & (s3_lr | s3_sc)) begin // @[MainPipe.scala 558:36]
      if (s3_can_do_amo & s3_lr) begin // @[MainPipe.scala 562:30]
        lrsc_count_dup_1 <= 6'h3f;
      end else begin
        lrsc_count_dup_1 <= 6'h0;
      end
    end else if (io_invalid_resv_set) begin // @[MainPipe.scala 563:33]
      lrsc_count_dup_1 <= 6'h0; // @[MainPipe.scala 566:11]
    end else if (lrsc_count > 6'h0) begin // @[MainPipe.scala 500:31]
      lrsc_count_dup_1 <= _lrsc_count_dup_1_T_1;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 548:46]
      lrsc_count_dup_2 <= 6'h0; // @[MainPipe.scala 549:35 550:18 555:18]
    end else if (s3_valid_dup_0 & (s3_lr | s3_sc)) begin // @[MainPipe.scala 558:36]
      if (s3_can_do_amo & s3_lr) begin // @[MainPipe.scala 562:30]
        lrsc_count_dup_2 <= 6'h3f;
      end else begin
        lrsc_count_dup_2 <= 6'h0;
      end
    end else if (io_invalid_resv_set) begin // @[MainPipe.scala 563:33]
      lrsc_count_dup_2 <= 6'h0; // @[MainPipe.scala 566:11]
    end else if (lrsc_count > 6'h0) begin // @[MainPipe.scala 500:31]
      lrsc_count_dup_2 <= _lrsc_count_dup_2_T_1;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 548:46]
      lrsc_count <= 6'h0; // @[MainPipe.scala 549:35 550:18 555:18]
    end else if (s3_valid_dup_0 & (s3_lr | s3_sc)) begin // @[MainPipe.scala 558:36]
      if (s3_can_do_amo & s3_lr) begin // @[MainPipe.scala 561:16]
        lrsc_count <= 6'h3f;
      end else begin
        lrsc_count <= 6'h0;
      end
    end else if (io_invalid_resv_set) begin // @[MainPipe.scala 563:33]
      lrsc_count <= 6'h0; // @[MainPipe.scala 564:16]
    end else if (lrsc_count > 6'h0) begin // @[MainPipe.scala 535:27]
      lrsc_count <= _lrsc_count_T_1;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1382:17]
      s3_s_amoalu <= 1'h0; // @[MainPipe.scala 1383:17]
    end else if (s3_fire) begin
      s3_s_amoalu <= 1'h0;
    end else begin
      s3_s_amoalu <= _GEN_374;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 798:24]
      s3_valid_dup_for_meta_wvalid <= 1'h0; // @[MainPipe.scala 798:56]
    end else begin
      s3_valid_dup_for_meta_wvalid <= s2_fire_to_s3 | _GEN_400;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 768:39]
      s3_s_amoalu_dup_for_meta_wvalid <= 1'h0; // @[MainPipe.scala 768:74]
    end else if (s3_fire_dup_for_meta_wvalid) begin
      s3_s_amoalu_dup_for_meta_wvalid <= 1'h0;
    end else begin
      s3_s_amoalu_dup_for_meta_wvalid <= _GEN_397;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 723:102]
      lrsc_count_dup_for_meta_wvalid <= 6'h0; // @[MainPipe.scala 724:77 725:39 728:39]
    end else if (s3_valid_dup_for_meta_wvalid & (s3_lr_dup_for_meta_wvalid | s3_sc_dup_for_meta_wvalid)) begin // @[MainPipe.scala 730:36]
      if (s3_can_do_amo_dup_for_meta_wvalid & s3_lr_dup_for_meta_wvalid) begin // @[MainPipe.scala 731:37]
        lrsc_count_dup_for_meta_wvalid <= 6'h3f;
      end else begin
        lrsc_count_dup_for_meta_wvalid <= 6'h0;
      end
    end else if (io_invalid_resv_set) begin // @[MainPipe.scala 732:54]
      lrsc_count_dup_for_meta_wvalid <= 6'h0; // @[MainPipe.scala 733:37]
    end else if (lrsc_count_dup_for_meta_wvalid > 6'h0) begin // @[MainPipe.scala 721:48]
      lrsc_count_dup_for_meta_wvalid <= _lrsc_count_dup_for_meta_wvalid_T_1;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 895:24]
      s3_valid_dup_for_err_wvalid <= 1'h0; // @[MainPipe.scala 895:55]
    end else begin
      s3_valid_dup_for_err_wvalid <= s2_fire_to_s3 | _GEN_423;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 893:38]
      s3_s_amoalu_dup_for_err_wvalid <= 1'h0; // @[MainPipe.scala 893:72]
    end else if (s3_fire_dup_for_err_wvalid) begin
      s3_s_amoalu_dup_for_err_wvalid <= 1'h0;
    end else begin
      s3_s_amoalu_dup_for_err_wvalid <= _GEN_421;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 848:99]
      lrsc_count_dup_for_err_wvalid <= 6'h0; // @[MainPipe.scala 849:75 850:38 853:38]
    end else if (s3_valid_dup_for_err_wvalid & (s3_lr_dup_for_err_wvalid | s3_sc_dup_for_err_wvalid)) begin // @[MainPipe.scala 855:36]
      if (s3_can_do_amo_dup_for_err_wvalid & s3_lr_dup_for_err_wvalid) begin // @[MainPipe.scala 856:36]
        lrsc_count_dup_for_err_wvalid <= 6'h3f;
      end else begin
        lrsc_count_dup_for_err_wvalid <= 6'h0;
      end
    end else if (io_invalid_resv_set) begin // @[MainPipe.scala 857:53]
      lrsc_count_dup_for_err_wvalid <= 6'h0; // @[MainPipe.scala 858:36]
    end else if (lrsc_count_dup_for_err_wvalid > 6'h0) begin // @[MainPipe.scala 846:47]
      lrsc_count_dup_for_err_wvalid <= _lrsc_count_dup_for_err_wvalid_T_1;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 991:24]
      s3_valid_dup_for_tag_wvalid <= 1'h0; // @[MainPipe.scala 991:55]
    end else begin
      s3_valid_dup_for_tag_wvalid <= s2_fire_to_s3 | _GEN_446;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 989:38]
      s3_s_amoalu_dup_for_tag_wvalid <= 1'h0; // @[MainPipe.scala 989:72]
    end else if (s3_fire_dup_for_tag_wvalid) begin
      s3_s_amoalu_dup_for_tag_wvalid <= 1'h0;
    end else begin
      s3_s_amoalu_dup_for_tag_wvalid <= _GEN_444;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 944:99]
      lrsc_count_dup_for_tag_wvalid <= 6'h0; // @[MainPipe.scala 945:75 946:38 949:38]
    end else if (s3_valid_dup_for_tag_wvalid & (s3_lr_dup_for_tag_wvalid | s3_sc_dup_for_tag_wvalid)) begin // @[MainPipe.scala 951:36]
      if (s3_can_do_amo_dup_for_tag_wvalid & s3_lr_dup_for_tag_wvalid) begin // @[MainPipe.scala 952:36]
        lrsc_count_dup_for_tag_wvalid <= 6'h3f;
      end else begin
        lrsc_count_dup_for_tag_wvalid <= 6'h0;
      end
    end else if (io_invalid_resv_set) begin // @[MainPipe.scala 953:53]
      lrsc_count_dup_for_tag_wvalid <= 6'h0; // @[MainPipe.scala 954:36]
    end else if (lrsc_count_dup_for_tag_wvalid > 6'h0) begin // @[MainPipe.scala 942:47]
      lrsc_count_dup_for_tag_wvalid <= _lrsc_count_dup_for_tag_wvalid_T_1;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1119:24]
      s3_valid_dup_for_data_wvalid <= 1'h0; // @[MainPipe.scala 1119:56]
    end else begin
      s3_valid_dup_for_data_wvalid <= s2_fire_to_s3 | _GEN_473;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1086:39]
      s3_s_amoalu_dup_for_data_wvalid <= 1'h0; // @[MainPipe.scala 1086:74]
    end else if (s3_fire_dup_for_data_wvalid) begin
      s3_s_amoalu_dup_for_data_wvalid <= 1'h0;
    end else begin
      s3_s_amoalu_dup_for_data_wvalid <= _GEN_467;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1040:102]
      lrsc_count_dup_for_data_wvalid <= 6'h0; // @[MainPipe.scala 1041:77 1042:39 1045:39]
    end else if (s3_valid_dup_for_data_wvalid & (s3_lr_dup_for_data_wvalid | s3_sc_dup_for_data_wvalid)) begin // @[MainPipe.scala 1047:36]
      if (s3_can_do_amo_dup_for_data_wvalid & s3_lr_dup_for_data_wvalid) begin // @[MainPipe.scala 1048:37]
        lrsc_count_dup_for_data_wvalid <= 6'h3f;
      end else begin
        lrsc_count_dup_for_data_wvalid <= 6'h0;
      end
    end else if (io_invalid_resv_set) begin // @[MainPipe.scala 1049:54]
      lrsc_count_dup_for_data_wvalid <= 6'h0; // @[MainPipe.scala 1050:37]
    end else if (lrsc_count_dup_for_data_wvalid > 6'h0) begin // @[MainPipe.scala 1038:48]
      lrsc_count_dup_for_data_wvalid <= _lrsc_count_dup_for_data_wvalid_T_1;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1220:26]
      s3_valid_dup_for_data_wbank_0 <= 1'h0; // @[MainPipe.scala 1220:60]
    end else begin
      s3_valid_dup_for_data_wbank_0 <= s2_fire_to_s3 | _GEN_496;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1220:26]
      s3_valid_dup_for_data_wbank_1 <= 1'h0; // @[MainPipe.scala 1220:60]
    end else begin
      s3_valid_dup_for_data_wbank_1 <= s2_fire_to_s3 | _GEN_521;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1220:26]
      s3_valid_dup_for_data_wbank_2 <= 1'h0; // @[MainPipe.scala 1220:60]
    end else begin
      s3_valid_dup_for_data_wbank_2 <= s2_fire_to_s3 | _GEN_546;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1220:26]
      s3_valid_dup_for_data_wbank_3 <= 1'h0; // @[MainPipe.scala 1220:60]
    end else begin
      s3_valid_dup_for_data_wbank_3 <= s2_fire_to_s3 | _GEN_571;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1220:26]
      s3_valid_dup_for_data_wbank_4 <= 1'h0; // @[MainPipe.scala 1220:60]
    end else begin
      s3_valid_dup_for_data_wbank_4 <= s2_fire_to_s3 | _GEN_596;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1220:26]
      s3_valid_dup_for_data_wbank_5 <= 1'h0; // @[MainPipe.scala 1220:60]
    end else begin
      s3_valid_dup_for_data_wbank_5 <= s2_fire_to_s3 | _GEN_621;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1220:26]
      s3_valid_dup_for_data_wbank_6 <= 1'h0; // @[MainPipe.scala 1220:60]
    end else begin
      s3_valid_dup_for_data_wbank_6 <= s2_fire_to_s3 | _GEN_646;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1220:26]
      s3_valid_dup_for_data_wbank_7 <= 1'h0; // @[MainPipe.scala 1220:60]
    end else begin
      s3_valid_dup_for_data_wbank_7 <= s2_fire_to_s3 | _GEN_671;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1218:40]
      s3_s_amoalu_dup_for_data_wbank <= 1'h0; // @[MainPipe.scala 1218:74]
    end else if (s3_fire_dup_for_data_wbank) begin
      s3_s_amoalu_dup_for_data_wbank <= 1'h0;
    end else begin
      s3_s_amoalu_dup_for_data_wbank <= _GEN_494;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1171:104]
      lrsc_count_dup_for_data_wbank <= 6'h0; // @[MainPipe.scala 1172:77 1173:40 1176:40]
    end else if (s3_valid_dup_for_data_wbank_0 & (s3_lr_dup_for_data_wbank | s3_sc_dup_for_data_wbank)) begin // @[MainPipe.scala 1178:38]
      if (s3_can_do_amo_dup_for_data_wbank & s3_lr_dup_for_data_wbank) begin // @[MainPipe.scala 1179:38]
        lrsc_count_dup_for_data_wbank <= 6'h3f;
      end else begin
        lrsc_count_dup_for_data_wbank <= 6'h0;
      end
    end else if (io_invalid_resv_set) begin // @[MainPipe.scala 1180:55]
      lrsc_count_dup_for_data_wbank <= 6'h0; // @[MainPipe.scala 1181:38]
    end else if (lrsc_count_dup_for_data_wbank > 6'h0) begin // @[MainPipe.scala 1169:49]
      lrsc_count_dup_for_data_wbank <= _lrsc_count_dup_for_data_wbank_T_1;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1218:40]
      s3_s_amoalu_dup_for_data_wbank_1 <= 1'h0; // @[MainPipe.scala 1218:74]
    end else if (s3_fire_dup_for_data_wbank_1) begin
      s3_s_amoalu_dup_for_data_wbank_1 <= 1'h0;
    end else begin
      s3_s_amoalu_dup_for_data_wbank_1 <= _GEN_519;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1171:104]
      lrsc_count_dup_for_data_wbank_1 <= 6'h0; // @[MainPipe.scala 1172:77 1173:40 1176:40]
    end else if (s3_valid_dup_for_data_wbank_1 & (s3_lr_dup_for_data_wbank_1 | s3_sc_dup_for_data_wbank_1)) begin // @[MainPipe.scala 1178:38]
      if (s3_can_do_amo_dup_for_data_wbank_1 & s3_lr_dup_for_data_wbank_1) begin // @[MainPipe.scala 1179:38]
        lrsc_count_dup_for_data_wbank_1 <= 6'h3f;
      end else begin
        lrsc_count_dup_for_data_wbank_1 <= 6'h0;
      end
    end else if (io_invalid_resv_set) begin // @[MainPipe.scala 1180:55]
      lrsc_count_dup_for_data_wbank_1 <= 6'h0; // @[MainPipe.scala 1181:38]
    end else if (lrsc_count_dup_for_data_wbank_1 > 6'h0) begin // @[MainPipe.scala 1169:49]
      lrsc_count_dup_for_data_wbank_1 <= _lrsc_count_dup_for_data_wbank_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1218:40]
      s3_s_amoalu_dup_for_data_wbank_2 <= 1'h0; // @[MainPipe.scala 1218:74]
    end else if (s3_fire_dup_for_data_wbank_2) begin
      s3_s_amoalu_dup_for_data_wbank_2 <= 1'h0;
    end else begin
      s3_s_amoalu_dup_for_data_wbank_2 <= _GEN_544;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1171:104]
      lrsc_count_dup_for_data_wbank_2 <= 6'h0; // @[MainPipe.scala 1172:77 1173:40 1176:40]
    end else if (s3_valid_dup_for_data_wbank_2 & (s3_lr_dup_for_data_wbank_2 | s3_sc_dup_for_data_wbank_2)) begin // @[MainPipe.scala 1178:38]
      if (s3_can_do_amo_dup_for_data_wbank_2 & s3_lr_dup_for_data_wbank_2) begin // @[MainPipe.scala 1179:38]
        lrsc_count_dup_for_data_wbank_2 <= 6'h3f;
      end else begin
        lrsc_count_dup_for_data_wbank_2 <= 6'h0;
      end
    end else if (io_invalid_resv_set) begin // @[MainPipe.scala 1180:55]
      lrsc_count_dup_for_data_wbank_2 <= 6'h0; // @[MainPipe.scala 1181:38]
    end else if (lrsc_count_dup_for_data_wbank_2 > 6'h0) begin // @[MainPipe.scala 1169:49]
      lrsc_count_dup_for_data_wbank_2 <= _lrsc_count_dup_for_data_wbank_T_5;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1218:40]
      s3_s_amoalu_dup_for_data_wbank_3 <= 1'h0; // @[MainPipe.scala 1218:74]
    end else if (s3_fire_dup_for_data_wbank_3) begin
      s3_s_amoalu_dup_for_data_wbank_3 <= 1'h0;
    end else begin
      s3_s_amoalu_dup_for_data_wbank_3 <= _GEN_569;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1171:104]
      lrsc_count_dup_for_data_wbank_3 <= 6'h0; // @[MainPipe.scala 1172:77 1173:40 1176:40]
    end else if (s3_valid_dup_for_data_wbank_3 & (s3_lr_dup_for_data_wbank_3 | s3_sc_dup_for_data_wbank_3)) begin // @[MainPipe.scala 1178:38]
      if (s3_can_do_amo_dup_for_data_wbank_3 & s3_lr_dup_for_data_wbank_3) begin // @[MainPipe.scala 1179:38]
        lrsc_count_dup_for_data_wbank_3 <= 6'h3f;
      end else begin
        lrsc_count_dup_for_data_wbank_3 <= 6'h0;
      end
    end else if (io_invalid_resv_set) begin // @[MainPipe.scala 1180:55]
      lrsc_count_dup_for_data_wbank_3 <= 6'h0; // @[MainPipe.scala 1181:38]
    end else if (lrsc_count_dup_for_data_wbank_3 > 6'h0) begin // @[MainPipe.scala 1169:49]
      lrsc_count_dup_for_data_wbank_3 <= _lrsc_count_dup_for_data_wbank_T_7;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1218:40]
      s3_s_amoalu_dup_for_data_wbank_4 <= 1'h0; // @[MainPipe.scala 1218:74]
    end else if (s3_fire_dup_for_data_wbank_4) begin
      s3_s_amoalu_dup_for_data_wbank_4 <= 1'h0;
    end else begin
      s3_s_amoalu_dup_for_data_wbank_4 <= _GEN_594;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1171:104]
      lrsc_count_dup_for_data_wbank_4 <= 6'h0; // @[MainPipe.scala 1172:77 1173:40 1176:40]
    end else if (s3_valid_dup_for_data_wbank_4 & (s3_lr_dup_for_data_wbank_4 | s3_sc_dup_for_data_wbank_4)) begin // @[MainPipe.scala 1178:38]
      if (s3_can_do_amo_dup_for_data_wbank_4 & s3_lr_dup_for_data_wbank_4) begin // @[MainPipe.scala 1179:38]
        lrsc_count_dup_for_data_wbank_4 <= 6'h3f;
      end else begin
        lrsc_count_dup_for_data_wbank_4 <= 6'h0;
      end
    end else if (io_invalid_resv_set) begin // @[MainPipe.scala 1180:55]
      lrsc_count_dup_for_data_wbank_4 <= 6'h0; // @[MainPipe.scala 1181:38]
    end else if (lrsc_count_dup_for_data_wbank_4 > 6'h0) begin // @[MainPipe.scala 1169:49]
      lrsc_count_dup_for_data_wbank_4 <= _lrsc_count_dup_for_data_wbank_T_9;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1218:40]
      s3_s_amoalu_dup_for_data_wbank_5 <= 1'h0; // @[MainPipe.scala 1218:74]
    end else if (s3_fire_dup_for_data_wbank_5) begin
      s3_s_amoalu_dup_for_data_wbank_5 <= 1'h0;
    end else begin
      s3_s_amoalu_dup_for_data_wbank_5 <= _GEN_619;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1171:104]
      lrsc_count_dup_for_data_wbank_5 <= 6'h0; // @[MainPipe.scala 1172:77 1173:40 1176:40]
    end else if (s3_valid_dup_for_data_wbank_5 & (s3_lr_dup_for_data_wbank_5 | s3_sc_dup_for_data_wbank_5)) begin // @[MainPipe.scala 1178:38]
      if (s3_can_do_amo_dup_for_data_wbank_5 & s3_lr_dup_for_data_wbank_5) begin // @[MainPipe.scala 1179:38]
        lrsc_count_dup_for_data_wbank_5 <= 6'h3f;
      end else begin
        lrsc_count_dup_for_data_wbank_5 <= 6'h0;
      end
    end else if (io_invalid_resv_set) begin // @[MainPipe.scala 1180:55]
      lrsc_count_dup_for_data_wbank_5 <= 6'h0; // @[MainPipe.scala 1181:38]
    end else if (lrsc_count_dup_for_data_wbank_5 > 6'h0) begin // @[MainPipe.scala 1169:49]
      lrsc_count_dup_for_data_wbank_5 <= _lrsc_count_dup_for_data_wbank_T_11;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1218:40]
      s3_s_amoalu_dup_for_data_wbank_6 <= 1'h0; // @[MainPipe.scala 1218:74]
    end else if (s3_fire_dup_for_data_wbank_6) begin
      s3_s_amoalu_dup_for_data_wbank_6 <= 1'h0;
    end else begin
      s3_s_amoalu_dup_for_data_wbank_6 <= _GEN_644;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1171:104]
      lrsc_count_dup_for_data_wbank_6 <= 6'h0; // @[MainPipe.scala 1172:77 1173:40 1176:40]
    end else if (s3_valid_dup_for_data_wbank_6 & (s3_lr_dup_for_data_wbank_6 | s3_sc_dup_for_data_wbank_6)) begin // @[MainPipe.scala 1178:38]
      if (s3_can_do_amo_dup_for_data_wbank_6 & s3_lr_dup_for_data_wbank_6) begin // @[MainPipe.scala 1179:38]
        lrsc_count_dup_for_data_wbank_6 <= 6'h3f;
      end else begin
        lrsc_count_dup_for_data_wbank_6 <= 6'h0;
      end
    end else if (io_invalid_resv_set) begin // @[MainPipe.scala 1180:55]
      lrsc_count_dup_for_data_wbank_6 <= 6'h0; // @[MainPipe.scala 1181:38]
    end else if (lrsc_count_dup_for_data_wbank_6 > 6'h0) begin // @[MainPipe.scala 1169:49]
      lrsc_count_dup_for_data_wbank_6 <= _lrsc_count_dup_for_data_wbank_T_13;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1218:40]
      s3_s_amoalu_dup_for_data_wbank_7 <= 1'h0; // @[MainPipe.scala 1218:74]
    end else if (s3_fire_dup_for_data_wbank_7) begin
      s3_s_amoalu_dup_for_data_wbank_7 <= 1'h0;
    end else begin
      s3_s_amoalu_dup_for_data_wbank_7 <= _GEN_669;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1171:104]
      lrsc_count_dup_for_data_wbank_7 <= 6'h0; // @[MainPipe.scala 1172:77 1173:40 1176:40]
    end else if (s3_valid_dup_for_data_wbank_7 & (s3_lr_dup_for_data_wbank_7 | s3_sc_dup_for_data_wbank_7)) begin // @[MainPipe.scala 1178:38]
      if (s3_can_do_amo_dup_for_data_wbank_7 & s3_lr_dup_for_data_wbank_7) begin // @[MainPipe.scala 1179:38]
        lrsc_count_dup_for_data_wbank_7 <= 6'h3f;
      end else begin
        lrsc_count_dup_for_data_wbank_7 <= 6'h0;
      end
    end else if (io_invalid_resv_set) begin // @[MainPipe.scala 1180:55]
      lrsc_count_dup_for_data_wbank_7 <= 6'h0; // @[MainPipe.scala 1181:38]
    end else if (lrsc_count_dup_for_data_wbank_7 > 6'h0) begin // @[MainPipe.scala 1169:49]
      lrsc_count_dup_for_data_wbank_7 <= _lrsc_count_dup_for_data_wbank_T_15;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1362:24]
      s3_valid_dup_for_wb_valid <= 1'h0; // @[MainPipe.scala 1362:52]
    end else begin
      s3_valid_dup_for_wb_valid <= s2_fire_to_s3 | _GEN_703;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1321:35]
      s3_s_amoalu_dup_for_wb_valid <= 1'h0; // @[MainPipe.scala 1321:66]
    end else if (s3_fire_dup_for_wb_valid) begin
      s3_s_amoalu_dup_for_wb_valid <= 1'h0;
    end else begin
      s3_s_amoalu_dup_for_wb_valid <= _GEN_694;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MainPipe.scala 1275:90]
      lrsc_count_dup_for_wb_valid <= 6'h0; // @[MainPipe.scala 1276:69 1277:35 1280:35]
    end else if (s3_valid_dup_for_wb_valid & (s3_lr_dup_for_wb_valid | s3_sc_dup_for_wb_valid)) begin // @[MainPipe.scala 1282:36]
      if (s3_can_do_amo_dup_for_wb_valid & s3_lr_dup_for_wb_valid) begin // @[MainPipe.scala 1283:33]
        lrsc_count_dup_for_wb_valid <= 6'h3f;
      end else begin
        lrsc_count_dup_for_wb_valid <= 6'h0;
      end
    end else if (io_invalid_resv_set) begin // @[MainPipe.scala 1284:50]
      lrsc_count_dup_for_wb_valid <= 6'h0; // @[MainPipe.scala 1285:33]
    end else if (lrsc_count_dup_for_wb_valid > 6'h0) begin // @[MainPipe.scala 1273:44]
      lrsc_count_dup_for_wb_valid <= _lrsc_count_dup_for_wb_valid_T_1;
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
  s1_valid_dup_1 = _RAND_0[0:0];
  _RAND_1 = {2{`RANDOM}};
  s1_req_vaddr = _RAND_1[38:0];
  _RAND_2 = {1{`RANDOM}};
  s2_valid_dup_0 = _RAND_2[0:0];
  _RAND_3 = {2{`RANDOM}};
  s2_req_vaddr = _RAND_3[38:0];
  _RAND_4 = {1{`RANDOM}};
  s3_valid_dup_6 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  s3_idx_dup_0 = _RAND_5[5:0];
  _RAND_6 = {1{`RANDOM}};
  s1_valid_dup_2 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  s2_valid_dup_1 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  s3_valid_dup_7 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  s3_idx_dup_1 = _RAND_9[5:0];
  _RAND_10 = {1{`RANDOM}};
  s1_valid_dup_0 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  s2_valid_dup_3 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  s2_req_replace_dup_1 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  s2_req_probe = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  s2_req_miss = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  s2_req_source = _RAND_15[3:0];
  _RAND_16 = {1{`RANDOM}};
  s2_tag_match = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  s2_req_cmd = _RAND_17[4:0];
  _RAND_18 = {1{`RANDOM}};
  s2_hit_coh_state = _RAND_18[1:0];
  _RAND_19 = {1{`RANDOM}};
  s3_valid_dup_5 = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  s3_req_probe_dup_7 = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  s3_req_probe_dup_0 = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  s3_tag_match_dup = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  s3_coh_dup_0_state = _RAND_23[1:0];
  _RAND_24 = {1{`RANDOM}};
  s3_req_probe_param = _RAND_24[1:0];
  _RAND_25 = {1{`RANDOM}};
  s3_coh_state = _RAND_25[1:0];
  _RAND_26 = {1{`RANDOM}};
  s3_req_source_dup_1 = _RAND_26[3:0];
  _RAND_27 = {1{`RANDOM}};
  s3_req_probe_dup_8 = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  s3_req_source = _RAND_28[3:0];
  _RAND_29 = {1{`RANDOM}};
  s3_req_miss_dup_2 = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  s3_store_hit_dup_0 = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  s3_req_miss_dup_0 = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  s3_req_probe_dup_5 = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  s3_amo_hit = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  s3_req_cmd_dup_5 = _RAND_34[4:0];
  _RAND_35 = {1{`RANDOM}};
  s3_req_probe_dup_4 = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  s3_req_cmd_dup_4 = _RAND_36[4:0];
  _RAND_37 = {1{`RANDOM}};
  lrsc_count_dup_0 = _RAND_37[5:0];
  _RAND_38 = {2{`RANDOM}};
  lrsc_addr = _RAND_38[35:0];
  _RAND_39 = {2{`RANDOM}};
  s3_req_addr = _RAND_39[35:0];
  _RAND_40 = {1{`RANDOM}};
  s3_amo_hit_dup = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  s3_s_amoalu_dup_0 = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  s3_req_cmd_dup_0 = _RAND_42[4:0];
  _RAND_43 = {1{`RANDOM}};
  s3_req_cmd_dup_1 = _RAND_43[4:0];
  _RAND_44 = {1{`RANDOM}};
  s3_req_miss_dup_4 = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  s3_s_amoalu_dup_1 = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  s3_req_replace_dup_2 = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  s3_req_replace_dup_1 = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  s3_coh_dup_4_state = _RAND_48[1:0];
  _RAND_49 = {1{`RANDOM}};
  s2_can_go_to_mq = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  s1_need_data = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  s1_valid = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  s1_req_miss = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  s1_req_miss_id = _RAND_53[1:0];
  _RAND_54 = {1{`RANDOM}};
  s1_req_miss_param = _RAND_54[1:0];
  _RAND_55 = {1{`RANDOM}};
  s1_req_miss_dirty = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  s1_req_miss_way_en = _RAND_56[7:0];
  _RAND_57 = {1{`RANDOM}};
  s1_req_probe = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  s1_req_probe_param = _RAND_58[1:0];
  _RAND_59 = {1{`RANDOM}};
  s1_req_probe_need_data = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  s1_req_source = _RAND_60[3:0];
  _RAND_61 = {1{`RANDOM}};
  s1_req_cmd = _RAND_61[4:0];
  _RAND_62 = {2{`RANDOM}};
  s1_req_addr = _RAND_62[35:0];
  _RAND_63 = {16{`RANDOM}};
  s1_req_store_data = _RAND_63[511:0];
  _RAND_64 = {2{`RANDOM}};
  s1_req_store_mask = _RAND_64[63:0];
  _RAND_65 = {1{`RANDOM}};
  s1_req_word_idx = _RAND_65[2:0];
  _RAND_66 = {2{`RANDOM}};
  s1_req_amo_data = _RAND_66[63:0];
  _RAND_67 = {1{`RANDOM}};
  s1_req_amo_mask = _RAND_67[7:0];
  _RAND_68 = {1{`RANDOM}};
  s1_req_error = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  s1_req_replace = _RAND_69[0:0];
  _RAND_70 = {1{`RANDOM}};
  s1_req_replace_way_en = _RAND_70[7:0];
  _RAND_71 = {1{`RANDOM}};
  s1_req_id = _RAND_71[3:0];
  _RAND_72 = {1{`RANDOM}};
  s1_banked_store_wmask = _RAND_72[7:0];
  _RAND_73 = {1{`RANDOM}};
  s1_need_tag = _RAND_73[0:0];
  _RAND_74 = {1{`RANDOM}};
  s1_valid_dup_4 = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  s1_valid_dup_5 = _RAND_75[0:0];
  _RAND_76 = {2{`RANDOM}};
  s1_req_vaddr_dup_for_data_read = _RAND_76[38:0];
  _RAND_77 = {1{`RANDOM}};
  s1_idx_dup_for_replace_way = _RAND_77[5:0];
  _RAND_78 = {1{`RANDOM}};
  s1_valid_dup_for_status_0 = _RAND_78[0:0];
  _RAND_79 = {1{`RANDOM}};
  s1_valid_dup_for_status_1 = _RAND_79[0:0];
  _RAND_80 = {1{`RANDOM}};
  s1_valid_dup_for_status_2 = _RAND_80[0:0];
  _RAND_81 = {1{`RANDOM}};
  s1_valid_dup_for_status_3 = _RAND_81[0:0];
  _RAND_82 = {1{`RANDOM}};
  s1_valid_dup_for_status_4 = _RAND_82[0:0];
  _RAND_83 = {1{`RANDOM}};
  s1_valid_dup_for_status_5 = _RAND_83[0:0];
  _RAND_84 = {1{`RANDOM}};
  s1_valid_dup_for_status_6 = _RAND_84[0:0];
  _RAND_85 = {1{`RANDOM}};
  s1_valid_dup_for_status_7 = _RAND_85[0:0];
  _RAND_86 = {1{`RANDOM}};
  s1_valid_dup_for_status_8 = _RAND_86[0:0];
  _RAND_87 = {1{`RANDOM}};
  s1_valid_dup_for_status_9 = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  s1_valid_dup_for_status_10 = _RAND_88[0:0];
  _RAND_89 = {1{`RANDOM}};
  s1_valid_dup_for_status_11 = _RAND_89[0:0];
  _RAND_90 = {1{`RANDOM}};
  s1_valid_dup_for_status_12 = _RAND_90[0:0];
  _RAND_91 = {1{`RANDOM}};
  s1_valid_dup_for_status_13 = _RAND_91[0:0];
  _RAND_92 = {1{`RANDOM}};
  s1_valid_dup_for_status_14 = _RAND_92[0:0];
  _RAND_93 = {1{`RANDOM}};
  s1_valid_dup_for_status_15 = _RAND_93[0:0];
  _RAND_94 = {1{`RANDOM}};
  s1_valid_dup_for_status_16 = _RAND_94[0:0];
  _RAND_95 = {1{`RANDOM}};
  s1_valid_dup_for_status_17 = _RAND_95[0:0];
  _RAND_96 = {1{`RANDOM}};
  s1_valid_dup_for_status_18 = _RAND_96[0:0];
  _RAND_97 = {1{`RANDOM}};
  s1_valid_dup_for_status_19 = _RAND_97[0:0];
  _RAND_98 = {1{`RANDOM}};
  s1_valid_dup_for_status_20 = _RAND_98[0:0];
  _RAND_99 = {1{`RANDOM}};
  s1_valid_dup_for_status_21 = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  s1_valid_dup_for_status_22 = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  s1_valid_dup_for_status_23 = _RAND_101[0:0];
  _RAND_102 = {1{`RANDOM}};
  REG_2 = _RAND_102[0:0];
  _RAND_103 = {1{`RANDOM}};
  REG_3_0 = _RAND_103[1:0];
  _RAND_104 = {1{`RANDOM}};
  REG_3_1 = _RAND_104[1:0];
  _RAND_105 = {1{`RANDOM}};
  REG_3_2 = _RAND_105[1:0];
  _RAND_106 = {1{`RANDOM}};
  REG_3_3 = _RAND_106[1:0];
  _RAND_107 = {1{`RANDOM}};
  REG_3_4 = _RAND_107[1:0];
  _RAND_108 = {1{`RANDOM}};
  REG_3_5 = _RAND_108[1:0];
  _RAND_109 = {1{`RANDOM}};
  REG_3_6 = _RAND_109[1:0];
  _RAND_110 = {1{`RANDOM}};
  REG_3_7 = _RAND_110[1:0];
  _RAND_111 = {1{`RANDOM}};
  REG_4 = _RAND_111[0:0];
  _RAND_112 = {1{`RANDOM}};
  REG_5_0 = _RAND_112[23:0];
  _RAND_113 = {1{`RANDOM}};
  REG_5_1 = _RAND_113[23:0];
  _RAND_114 = {1{`RANDOM}};
  REG_5_2 = _RAND_114[23:0];
  _RAND_115 = {1{`RANDOM}};
  REG_5_3 = _RAND_115[23:0];
  _RAND_116 = {1{`RANDOM}};
  REG_5_4 = _RAND_116[23:0];
  _RAND_117 = {1{`RANDOM}};
  REG_5_5 = _RAND_117[23:0];
  _RAND_118 = {1{`RANDOM}};
  REG_5_6 = _RAND_118[23:0];
  _RAND_119 = {1{`RANDOM}};
  REG_5_7 = _RAND_119[23:0];
  _RAND_120 = {1{`RANDOM}};
  REG_8 = _RAND_120[0:0];
  _RAND_121 = {1{`RANDOM}};
  REG_9_0 = _RAND_121[29:0];
  _RAND_122 = {1{`RANDOM}};
  REG_9_1 = _RAND_122[29:0];
  _RAND_123 = {1{`RANDOM}};
  REG_9_2 = _RAND_123[29:0];
  _RAND_124 = {1{`RANDOM}};
  REG_9_3 = _RAND_124[29:0];
  _RAND_125 = {1{`RANDOM}};
  REG_9_4 = _RAND_125[29:0];
  _RAND_126 = {1{`RANDOM}};
  REG_9_5 = _RAND_126[29:0];
  _RAND_127 = {1{`RANDOM}};
  REG_9_6 = _RAND_127[29:0];
  _RAND_128 = {1{`RANDOM}};
  REG_9_7 = _RAND_128[29:0];
  _RAND_129 = {1{`RANDOM}};
  s1_repl_way_en_REG = _RAND_129[0:0];
  _RAND_130 = {1{`RANDOM}};
  s1_repl_way_en_REG_1 = _RAND_130[7:0];
  _RAND_131 = {1{`RANDOM}};
  s2_valid = _RAND_131[0:0];
  _RAND_132 = {1{`RANDOM}};
  s2_req_miss_id = _RAND_132[1:0];
  _RAND_133 = {1{`RANDOM}};
  s2_req_miss_param = _RAND_133[1:0];
  _RAND_134 = {1{`RANDOM}};
  s2_req_miss_dirty = _RAND_134[0:0];
  _RAND_135 = {1{`RANDOM}};
  s2_req_probe_param = _RAND_135[1:0];
  _RAND_136 = {1{`RANDOM}};
  s2_req_probe_need_data = _RAND_136[0:0];
  _RAND_137 = {2{`RANDOM}};
  s2_req_addr = _RAND_137[35:0];
  _RAND_138 = {16{`RANDOM}};
  s2_req_store_data = _RAND_138[511:0];
  _RAND_139 = {2{`RANDOM}};
  s2_req_store_mask = _RAND_139[63:0];
  _RAND_140 = {1{`RANDOM}};
  s2_req_word_idx = _RAND_140[2:0];
  _RAND_141 = {2{`RANDOM}};
  s2_req_amo_data = _RAND_141[63:0];
  _RAND_142 = {1{`RANDOM}};
  s2_req_amo_mask = _RAND_142[7:0];
  _RAND_143 = {1{`RANDOM}};
  s2_req_error = _RAND_143[0:0];
  _RAND_144 = {1{`RANDOM}};
  s2_req_replace = _RAND_144[0:0];
  _RAND_145 = {1{`RANDOM}};
  s2_req_id = _RAND_145[3:0];
  _RAND_146 = {1{`RANDOM}};
  s2_tag_match_way = _RAND_146[7:0];
  _RAND_147 = {1{`RANDOM}};
  s2_repl_tag = _RAND_147[23:0];
  _RAND_148 = {1{`RANDOM}};
  s2_repl_coh_state = _RAND_148[1:0];
  _RAND_149 = {1{`RANDOM}};
  s2_repl_way_en = _RAND_149[7:0];
  _RAND_150 = {1{`RANDOM}};
  s2_need_replacement = _RAND_150[0:0];
  _RAND_151 = {1{`RANDOM}};
  s2_need_data = _RAND_151[0:0];
  _RAND_152 = {1{`RANDOM}};
  s2_need_tag = _RAND_152[0:0];
  _RAND_153 = {1{`RANDOM}};
  s2_encTag = _RAND_153[29:0];
  _RAND_154 = {1{`RANDOM}};
  s2_valid_dup_2 = _RAND_154[0:0];
  _RAND_155 = {1{`RANDOM}};
  s2_valid_dup_4 = _RAND_155[0:0];
  _RAND_156 = {1{`RANDOM}};
  s2_valid_dup_5 = _RAND_156[0:0];
  _RAND_157 = {1{`RANDOM}};
  s2_valid_dup_6 = _RAND_157[0:0];
  _RAND_158 = {1{`RANDOM}};
  s2_valid_dup_7 = _RAND_158[0:0];
  _RAND_159 = {1{`RANDOM}};
  s2_valid_dup_for_status_0 = _RAND_159[0:0];
  _RAND_160 = {1{`RANDOM}};
  s2_valid_dup_for_status_1 = _RAND_160[0:0];
  _RAND_161 = {1{`RANDOM}};
  s2_valid_dup_for_status_2 = _RAND_161[0:0];
  _RAND_162 = {1{`RANDOM}};
  s2_valid_dup_for_status_3 = _RAND_162[0:0];
  _RAND_163 = {1{`RANDOM}};
  s2_valid_dup_for_status_4 = _RAND_163[0:0];
  _RAND_164 = {1{`RANDOM}};
  s2_valid_dup_for_status_5 = _RAND_164[0:0];
  _RAND_165 = {1{`RANDOM}};
  s2_valid_dup_for_status_6 = _RAND_165[0:0];
  _RAND_166 = {1{`RANDOM}};
  s2_valid_dup_for_status_7 = _RAND_166[0:0];
  _RAND_167 = {1{`RANDOM}};
  s2_valid_dup_for_status_8 = _RAND_167[0:0];
  _RAND_168 = {1{`RANDOM}};
  s2_valid_dup_for_status_9 = _RAND_168[0:0];
  _RAND_169 = {1{`RANDOM}};
  s2_valid_dup_for_status_10 = _RAND_169[0:0];
  _RAND_170 = {1{`RANDOM}};
  s2_valid_dup_for_status_11 = _RAND_170[0:0];
  _RAND_171 = {1{`RANDOM}};
  s2_valid_dup_for_status_12 = _RAND_171[0:0];
  _RAND_172 = {1{`RANDOM}};
  s2_valid_dup_for_status_13 = _RAND_172[0:0];
  _RAND_173 = {1{`RANDOM}};
  s2_valid_dup_for_status_14 = _RAND_173[0:0];
  _RAND_174 = {1{`RANDOM}};
  s2_valid_dup_for_status_15 = _RAND_174[0:0];
  _RAND_175 = {1{`RANDOM}};
  s2_valid_dup_for_status_16 = _RAND_175[0:0];
  _RAND_176 = {1{`RANDOM}};
  s2_valid_dup_for_status_17 = _RAND_176[0:0];
  _RAND_177 = {1{`RANDOM}};
  s2_valid_dup_for_status_18 = _RAND_177[0:0];
  _RAND_178 = {1{`RANDOM}};
  s2_valid_dup_for_status_19 = _RAND_178[0:0];
  _RAND_179 = {1{`RANDOM}};
  s2_valid_dup_for_status_20 = _RAND_179[0:0];
  _RAND_180 = {1{`RANDOM}};
  s2_valid_dup_for_status_21 = _RAND_180[0:0];
  _RAND_181 = {1{`RANDOM}};
  s2_valid_dup_for_status_22 = _RAND_181[0:0];
  _RAND_182 = {1{`RANDOM}};
  s2_valid_dup_for_status_23 = _RAND_182[0:0];
  _RAND_183 = {2{`RANDOM}};
  s2_req_vaddr_dup_for_miss_req = _RAND_183[38:0];
  _RAND_184 = {1{`RANDOM}};
  s2_idx_dup_for_status = _RAND_184[5:0];
  _RAND_185 = {1{`RANDOM}};
  s2_idx_dup_for_replace_access = _RAND_185[5:0];
  _RAND_186 = {1{`RANDOM}};
  s2_req_replace_dup_2 = _RAND_186[0:0];
  _RAND_187 = {1{`RANDOM}};
  s2_can_go_to_mq_dup_0 = _RAND_187[0:0];
  _RAND_188 = {1{`RANDOM}};
  s2_can_go_to_mq_dup_1 = _RAND_188[0:0];
  _RAND_189 = {1{`RANDOM}};
  s2_can_go_to_mq_dup_2 = _RAND_189[0:0];
  _RAND_190 = {1{`RANDOM}};
  s2_way_en = _RAND_190[7:0];
  _RAND_191 = {1{`RANDOM}};
  s2_tag = _RAND_191[23:0];
  _RAND_192 = {1{`RANDOM}};
  s2_coh_state = _RAND_192[1:0];
  _RAND_193 = {1{`RANDOM}};
  s2_banked_store_wmask = _RAND_193[7:0];
  _RAND_194 = {1{`RANDOM}};
  s2_flag_error = _RAND_194[0:0];
  _RAND_195 = {1{`RANDOM}};
  REG_12 = _RAND_195[0:0];
  _RAND_196 = {2{`RANDOM}};
  REG_13_0_raw_data = _RAND_196[63:0];
  _RAND_197 = {2{`RANDOM}};
  REG_13_1_raw_data = _RAND_197[63:0];
  _RAND_198 = {2{`RANDOM}};
  REG_13_2_raw_data = _RAND_198[63:0];
  _RAND_199 = {2{`RANDOM}};
  REG_13_3_raw_data = _RAND_199[63:0];
  _RAND_200 = {2{`RANDOM}};
  REG_13_4_raw_data = _RAND_200[63:0];
  _RAND_201 = {2{`RANDOM}};
  REG_13_5_raw_data = _RAND_201[63:0];
  _RAND_202 = {2{`RANDOM}};
  REG_13_6_raw_data = _RAND_202[63:0];
  _RAND_203 = {2{`RANDOM}};
  REG_13_7_raw_data = _RAND_203[63:0];
  _RAND_204 = {1{`RANDOM}};
  s2_probe_ttob_check_resp_REG = _RAND_204[0:0];
  _RAND_205 = {1{`RANDOM}};
  s2_probe_ttob_check_resp_REG_1_bits_toN = _RAND_205[0:0];
  _RAND_206 = {1{`RANDOM}};
  s3_valid = _RAND_206[0:0];
  _RAND_207 = {1{`RANDOM}};
  s3_req_miss_id = _RAND_207[1:0];
  _RAND_208 = {1{`RANDOM}};
  s3_req_miss_param = _RAND_208[1:0];
  _RAND_209 = {1{`RANDOM}};
  s3_req_miss_dirty = _RAND_209[0:0];
  _RAND_210 = {1{`RANDOM}};
  s3_req_cmd = _RAND_210[4:0];
  _RAND_211 = {2{`RANDOM}};
  s3_req_vaddr = _RAND_211[38:0];
  _RAND_212 = {1{`RANDOM}};
  s3_req_word_idx = _RAND_212[2:0];
  _RAND_213 = {2{`RANDOM}};
  s3_req_amo_data = _RAND_213[63:0];
  _RAND_214 = {1{`RANDOM}};
  s3_req_amo_mask = _RAND_214[7:0];
  _RAND_215 = {1{`RANDOM}};
  s3_req_error = _RAND_215[0:0];
  _RAND_216 = {1{`RANDOM}};
  s3_req_id = _RAND_216[3:0];
  _RAND_217 = {1{`RANDOM}};
  s3_hit = _RAND_217[0:0];
  _RAND_218 = {1{`RANDOM}};
  s3_way_en = _RAND_218[7:0];
  _RAND_219 = {1{`RANDOM}};
  s3_banked_store_wmask = _RAND_219[7:0];
  _RAND_220 = {2{`RANDOM}};
  s3_store_data_merged_0 = _RAND_220[63:0];
  _RAND_221 = {2{`RANDOM}};
  s3_store_data_merged_1 = _RAND_221[63:0];
  _RAND_222 = {2{`RANDOM}};
  s3_store_data_merged_2 = _RAND_222[63:0];
  _RAND_223 = {2{`RANDOM}};
  s3_store_data_merged_3 = _RAND_223[63:0];
  _RAND_224 = {2{`RANDOM}};
  s3_store_data_merged_4 = _RAND_224[63:0];
  _RAND_225 = {2{`RANDOM}};
  s3_store_data_merged_5 = _RAND_225[63:0];
  _RAND_226 = {2{`RANDOM}};
  s3_store_data_merged_6 = _RAND_226[63:0];
  _RAND_227 = {2{`RANDOM}};
  s3_store_data_merged_7 = _RAND_227[63:0];
  _RAND_228 = {2{`RANDOM}};
  s3_data_word = _RAND_228[63:0];
  _RAND_229 = {2{`RANDOM}};
  s3_data_0 = _RAND_229[63:0];
  _RAND_230 = {2{`RANDOM}};
  s3_data_1 = _RAND_230[63:0];
  _RAND_231 = {2{`RANDOM}};
  s3_data_2 = _RAND_231[63:0];
  _RAND_232 = {2{`RANDOM}};
  s3_data_3 = _RAND_232[63:0];
  _RAND_233 = {2{`RANDOM}};
  s3_data_4 = _RAND_233[63:0];
  _RAND_234 = {2{`RANDOM}};
  s3_data_5 = _RAND_234[63:0];
  _RAND_235 = {2{`RANDOM}};
  s3_data_6 = _RAND_235[63:0];
  _RAND_236 = {2{`RANDOM}};
  s3_data_7 = _RAND_236[63:0];
  _RAND_237 = {1{`RANDOM}};
  s3_data_error_REG = _RAND_237[0:0];
  _RAND_238 = {1{`RANDOM}};
  s3_data_error_REG_1 = _RAND_238[0:0];
  _RAND_239 = {1{`RANDOM}};
  s3_data_error_REG_2 = _RAND_239[0:0];
  _RAND_240 = {1{`RANDOM}};
  s3_data_error_REG_3 = _RAND_240[0:0];
  _RAND_241 = {1{`RANDOM}};
  s3_error_r = _RAND_241[0:0];
  _RAND_242 = {1{`RANDOM}};
  s3_probe_ttob_check_resp_bits_toN = _RAND_242[0:0];
  _RAND_243 = {1{`RANDOM}};
  s3_valid_dup_0 = _RAND_243[0:0];
  _RAND_244 = {1{`RANDOM}};
  s3_valid_dup_1 = _RAND_244[0:0];
  _RAND_245 = {1{`RANDOM}};
  s3_valid_dup_3 = _RAND_245[0:0];
  _RAND_246 = {1{`RANDOM}};
  s3_valid_dup_4 = _RAND_246[0:0];
  _RAND_247 = {1{`RANDOM}};
  s3_valid_dup_8 = _RAND_247[0:0];
  _RAND_248 = {1{`RANDOM}};
  s3_valid_dup_9 = _RAND_248[0:0];
  _RAND_249 = {1{`RANDOM}};
  s3_valid_dup_10 = _RAND_249[0:0];
  _RAND_250 = {1{`RANDOM}};
  s3_valid_dup_11 = _RAND_250[0:0];
  _RAND_251 = {1{`RANDOM}};
  s3_valid_dup_for_status_0 = _RAND_251[0:0];
  _RAND_252 = {1{`RANDOM}};
  s3_valid_dup_for_status_1 = _RAND_252[0:0];
  _RAND_253 = {1{`RANDOM}};
  s3_valid_dup_for_status_2 = _RAND_253[0:0];
  _RAND_254 = {1{`RANDOM}};
  s3_valid_dup_for_status_3 = _RAND_254[0:0];
  _RAND_255 = {1{`RANDOM}};
  s3_valid_dup_for_status_4 = _RAND_255[0:0];
  _RAND_256 = {1{`RANDOM}};
  s3_valid_dup_for_status_5 = _RAND_256[0:0];
  _RAND_257 = {1{`RANDOM}};
  s3_valid_dup_for_status_6 = _RAND_257[0:0];
  _RAND_258 = {1{`RANDOM}};
  s3_valid_dup_for_status_7 = _RAND_258[0:0];
  _RAND_259 = {1{`RANDOM}};
  s3_valid_dup_for_status_8 = _RAND_259[0:0];
  _RAND_260 = {1{`RANDOM}};
  s3_valid_dup_for_status_9 = _RAND_260[0:0];
  _RAND_261 = {1{`RANDOM}};
  s3_valid_dup_for_status_10 = _RAND_261[0:0];
  _RAND_262 = {1{`RANDOM}};
  s3_valid_dup_for_status_11 = _RAND_262[0:0];
  _RAND_263 = {1{`RANDOM}};
  s3_valid_dup_for_status_12 = _RAND_263[0:0];
  _RAND_264 = {1{`RANDOM}};
  s3_valid_dup_for_status_13 = _RAND_264[0:0];
  _RAND_265 = {1{`RANDOM}};
  s3_valid_dup_for_status_14 = _RAND_265[0:0];
  _RAND_266 = {1{`RANDOM}};
  s3_valid_dup_for_status_15 = _RAND_266[0:0];
  _RAND_267 = {1{`RANDOM}};
  s3_valid_dup_for_status_16 = _RAND_267[0:0];
  _RAND_268 = {1{`RANDOM}};
  s3_valid_dup_for_status_17 = _RAND_268[0:0];
  _RAND_269 = {1{`RANDOM}};
  s3_valid_dup_for_status_18 = _RAND_269[0:0];
  _RAND_270 = {1{`RANDOM}};
  s3_valid_dup_for_status_19 = _RAND_270[0:0];
  _RAND_271 = {1{`RANDOM}};
  s3_valid_dup_for_status_20 = _RAND_271[0:0];
  _RAND_272 = {1{`RANDOM}};
  s3_valid_dup_for_status_21 = _RAND_272[0:0];
  _RAND_273 = {1{`RANDOM}};
  s3_valid_dup_for_status_22 = _RAND_273[0:0];
  _RAND_274 = {1{`RANDOM}};
  s3_valid_dup_for_status_23 = _RAND_274[0:0];
  _RAND_275 = {1{`RANDOM}};
  s3_way_en_dup_0 = _RAND_275[7:0];
  _RAND_276 = {1{`RANDOM}};
  s3_way_en_dup_1 = _RAND_276[7:0];
  _RAND_277 = {1{`RANDOM}};
  s3_way_en_dup_2 = _RAND_277[7:0];
  _RAND_278 = {1{`RANDOM}};
  s3_idx_dup_2 = _RAND_278[5:0];
  _RAND_279 = {1{`RANDOM}};
  s3_idx_dup_3 = _RAND_279[5:0];
  _RAND_280 = {1{`RANDOM}};
  s3_idx_dup_4 = _RAND_280[5:0];
  _RAND_281 = {1{`RANDOM}};
  s3_idx_dup_5 = _RAND_281[5:0];
  _RAND_282 = {1{`RANDOM}};
  s3_req_replace_dup_3 = _RAND_282[0:0];
  _RAND_283 = {1{`RANDOM}};
  s3_req_replace_dup_7 = _RAND_283[0:0];
  _RAND_284 = {1{`RANDOM}};
  s3_req_cmd_dup_2 = _RAND_284[4:0];
  _RAND_285 = {1{`RANDOM}};
  s3_req_cmd_dup_3 = _RAND_285[4:0];
  _RAND_286 = {2{`RANDOM}};
  s3_req_addr_dup_0 = _RAND_286[35:0];
  _RAND_287 = {2{`RANDOM}};
  s3_req_addr_dup_3 = _RAND_287[35:0];
  _RAND_288 = {2{`RANDOM}};
  s3_req_addr_dup_4 = _RAND_288[35:0];
  _RAND_289 = {1{`RANDOM}};
  s3_req_probe_dup_3 = _RAND_289[0:0];
  _RAND_290 = {1{`RANDOM}};
  s3_req_miss_dup_5 = _RAND_290[0:0];
  _RAND_291 = {1{`RANDOM}};
  s3_req_miss_dup_7 = _RAND_291[0:0];
  _RAND_292 = {1{`RANDOM}};
  s3_req_word_idx_dup_0 = _RAND_292[2:0];
  _RAND_293 = {1{`RANDOM}};
  s3_req_word_idx_dup_1 = _RAND_293[2:0];
  _RAND_294 = {1{`RANDOM}};
  s3_req_word_idx_dup_2 = _RAND_294[2:0];
  _RAND_295 = {1{`RANDOM}};
  s3_req_word_idx_dup_3 = _RAND_295[2:0];
  _RAND_296 = {1{`RANDOM}};
  s3_req_word_idx_dup_4 = _RAND_296[2:0];
  _RAND_297 = {1{`RANDOM}};
  s3_req_word_idx_dup_5 = _RAND_297[2:0];
  _RAND_298 = {1{`RANDOM}};
  s3_req_word_idx_dup_6 = _RAND_298[2:0];
  _RAND_299 = {1{`RANDOM}};
  s3_req_word_idx_dup_7 = _RAND_299[2:0];
  _RAND_300 = {1{`RANDOM}};
  s3_store_hit_dup_1 = _RAND_300[0:0];
  _RAND_301 = {1{`RANDOM}};
  lrsc_count_dup_1 = _RAND_301[5:0];
  _RAND_302 = {1{`RANDOM}};
  lrsc_count_dup_2 = _RAND_302[5:0];
  _RAND_303 = {2{`RANDOM}};
  lrsc_addr_dup = _RAND_303[35:0];
  _RAND_304 = {1{`RANDOM}};
  lrsc_count = _RAND_304[5:0];
  _RAND_305 = {1{`RANDOM}};
  io_block_lr_REG = _RAND_305[0:0];
  _RAND_306 = {1{`RANDOM}};
  s3_s_amoalu = _RAND_306[0:0];
  _RAND_307 = {2{`RANDOM}};
  s3_amo_data_merged_reg_0 = _RAND_307[63:0];
  _RAND_308 = {2{`RANDOM}};
  s3_amo_data_merged_reg_1 = _RAND_308[63:0];
  _RAND_309 = {2{`RANDOM}};
  s3_amo_data_merged_reg_2 = _RAND_309[63:0];
  _RAND_310 = {2{`RANDOM}};
  s3_amo_data_merged_reg_3 = _RAND_310[63:0];
  _RAND_311 = {2{`RANDOM}};
  s3_amo_data_merged_reg_4 = _RAND_311[63:0];
  _RAND_312 = {2{`RANDOM}};
  s3_amo_data_merged_reg_5 = _RAND_312[63:0];
  _RAND_313 = {2{`RANDOM}};
  s3_amo_data_merged_reg_6 = _RAND_313[63:0];
  _RAND_314 = {2{`RANDOM}};
  s3_amo_data_merged_reg_7 = _RAND_314[63:0];
  _RAND_315 = {1{`RANDOM}};
  miss_update_meta_dup_for_meta_wvalid = _RAND_315[0:0];
  _RAND_316 = {1{`RANDOM}};
  s3_req_probe_dup_for_meta_wvalid = _RAND_316[0:0];
  _RAND_317 = {1{`RANDOM}};
  s3_tag_match_dup_for_meta_wvalid = _RAND_317[0:0];
  _RAND_318 = {1{`RANDOM}};
  s3_coh_dup_for_meta_wvalid_state = _RAND_318[1:0];
  _RAND_319 = {1{`RANDOM}};
  s3_req_probe_param_dup_for_meta_wvalid = _RAND_319[1:0];
  _RAND_320 = {1{`RANDOM}};
  s3_req_source_dup_for_meta_wvalid = _RAND_320[3:0];
  _RAND_321 = {1{`RANDOM}};
  s3_req_cmd_dup_for_meta_wvalid = _RAND_321[4:0];
  _RAND_322 = {1{`RANDOM}};
  s3_req_replace_dup_for_meta_wvalid = _RAND_322[0:0];
  _RAND_323 = {1{`RANDOM}};
  s3_hit_coh_dup_for_meta_wvalid_state = _RAND_323[1:0];
  _RAND_324 = {1{`RANDOM}};
  s3_new_hit_coh_dup_for_meta_wvalid_state = _RAND_324[1:0];
  _RAND_325 = {1{`RANDOM}};
  s3_valid_dup_for_meta_wvalid = _RAND_325[0:0];
  _RAND_326 = {1{`RANDOM}};
  s3_amo_hit_dup_for_meta_wvalid = _RAND_326[0:0];
  _RAND_327 = {1{`RANDOM}};
  s3_s_amoalu_dup_for_meta_wvalid = _RAND_327[0:0];
  _RAND_328 = {1{`RANDOM}};
  s3_store_hit_dup_for_meta_wvalid = _RAND_328[0:0];
  _RAND_329 = {2{`RANDOM}};
  s3_req_addr_dup_for_meta_wvalid = _RAND_329[35:0];
  _RAND_330 = {2{`RANDOM}};
  lrsc_addr_dup_for_meta_wvalid = _RAND_330[35:0];
  _RAND_331 = {1{`RANDOM}};
  lrsc_count_dup_for_meta_wvalid = _RAND_331[5:0];
  _RAND_332 = {1{`RANDOM}};
  miss_update_meta_dup_for_err_wvalid = _RAND_332[0:0];
  _RAND_333 = {1{`RANDOM}};
  s3_req_probe_dup_for_err_wvalid = _RAND_333[0:0];
  _RAND_334 = {1{`RANDOM}};
  s3_tag_match_dup_for_err_wvalid = _RAND_334[0:0];
  _RAND_335 = {1{`RANDOM}};
  s3_coh_dup_for_err_wvalid_state = _RAND_335[1:0];
  _RAND_336 = {1{`RANDOM}};
  s3_req_probe_param_dup_for_err_wvalid = _RAND_336[1:0];
  _RAND_337 = {1{`RANDOM}};
  s3_req_source_dup_for_err_wvalid = _RAND_337[3:0];
  _RAND_338 = {1{`RANDOM}};
  s3_req_cmd_dup_for_err_wvalid = _RAND_338[4:0];
  _RAND_339 = {1{`RANDOM}};
  s3_req_replace_dup_for_err_wvalid = _RAND_339[0:0];
  _RAND_340 = {1{`RANDOM}};
  s3_hit_coh_dup_for_err_wvalid_state = _RAND_340[1:0];
  _RAND_341 = {1{`RANDOM}};
  s3_new_hit_coh_dup_for_err_wvalid_state = _RAND_341[1:0];
  _RAND_342 = {1{`RANDOM}};
  s3_valid_dup_for_err_wvalid = _RAND_342[0:0];
  _RAND_343 = {1{`RANDOM}};
  s3_amo_hit_dup_for_err_wvalid = _RAND_343[0:0];
  _RAND_344 = {1{`RANDOM}};
  s3_s_amoalu_dup_for_err_wvalid = _RAND_344[0:0];
  _RAND_345 = {1{`RANDOM}};
  s3_store_hit_dup_for_err_wvalid = _RAND_345[0:0];
  _RAND_346 = {2{`RANDOM}};
  s3_req_addr_dup_for_err_wvalid = _RAND_346[35:0];
  _RAND_347 = {2{`RANDOM}};
  lrsc_addr_dup_for_err_wvalid = _RAND_347[35:0];
  _RAND_348 = {1{`RANDOM}};
  lrsc_count_dup_for_err_wvalid = _RAND_348[5:0];
  _RAND_349 = {1{`RANDOM}};
  miss_update_meta_dup_for_tag_wvalid = _RAND_349[0:0];
  _RAND_350 = {1{`RANDOM}};
  s3_req_probe_dup_for_tag_wvalid = _RAND_350[0:0];
  _RAND_351 = {1{`RANDOM}};
  s3_coh_dup_for_tag_wvalid_state = _RAND_351[1:0];
  _RAND_352 = {1{`RANDOM}};
  s3_req_source_dup_for_tag_wvalid = _RAND_352[3:0];
  _RAND_353 = {1{`RANDOM}};
  s3_req_cmd_dup_for_tag_wvalid = _RAND_353[4:0];
  _RAND_354 = {1{`RANDOM}};
  s3_req_replace_dup_for_tag_wvalid = _RAND_354[0:0];
  _RAND_355 = {1{`RANDOM}};
  s3_valid_dup_for_tag_wvalid = _RAND_355[0:0];
  _RAND_356 = {1{`RANDOM}};
  s3_amo_hit_dup_for_tag_wvalid = _RAND_356[0:0];
  _RAND_357 = {1{`RANDOM}};
  s3_s_amoalu_dup_for_tag_wvalid = _RAND_357[0:0];
  _RAND_358 = {1{`RANDOM}};
  s3_store_hit_dup_for_tag_wvalid = _RAND_358[0:0];
  _RAND_359 = {2{`RANDOM}};
  s3_req_addr_dup_for_tag_wvalid = _RAND_359[35:0];
  _RAND_360 = {2{`RANDOM}};
  lrsc_addr_dup_for_tag_wvalid = _RAND_360[35:0];
  _RAND_361 = {1{`RANDOM}};
  lrsc_count_dup_for_tag_wvalid = _RAND_361[5:0];
  _RAND_362 = {1{`RANDOM}};
  miss_update_meta_dup_for_data_wvalid = _RAND_362[0:0];
  _RAND_363 = {1{`RANDOM}};
  s3_req_probe_dup_for_data_wvalid = _RAND_363[0:0];
  _RAND_364 = {1{`RANDOM}};
  s3_coh_dup_for_data_wvalid_state = _RAND_364[1:0];
  _RAND_365 = {1{`RANDOM}};
  s3_req_source_dup_for_data_wvalid = _RAND_365[3:0];
  _RAND_366 = {1{`RANDOM}};
  s3_req_cmd_dup_for_data_wvalid = _RAND_366[4:0];
  _RAND_367 = {1{`RANDOM}};
  s3_req_replace_dup_for_data_wvalid = _RAND_367[0:0];
  _RAND_368 = {1{`RANDOM}};
  s3_valid_dup_for_data_wvalid = _RAND_368[0:0];
  _RAND_369 = {1{`RANDOM}};
  s3_amo_hit_dup_for_data_wvalid = _RAND_369[0:0];
  _RAND_370 = {1{`RANDOM}};
  s3_s_amoalu_dup_for_data_wvalid = _RAND_370[0:0];
  _RAND_371 = {1{`RANDOM}};
  s3_store_hit_dup_for_data_wvalid = _RAND_371[0:0];
  _RAND_372 = {2{`RANDOM}};
  s3_req_addr_dup_for_data_wvalid = _RAND_372[35:0];
  _RAND_373 = {2{`RANDOM}};
  lrsc_addr_dup_for_data_wvalid = _RAND_373[35:0];
  _RAND_374 = {1{`RANDOM}};
  lrsc_count_dup_for_data_wvalid = _RAND_374[5:0];
  _RAND_375 = {1{`RANDOM}};
  s3_banked_store_wmask_dup_for_data_wvalid = _RAND_375[7:0];
  _RAND_376 = {1{`RANDOM}};
  s3_req_word_idx_dup_for_data_wvalid = _RAND_376[2:0];
  _RAND_377 = {2{`RANDOM}};
  s3_req_amo_data_dup_for_data_wvalid = _RAND_377[63:0];
  _RAND_378 = {1{`RANDOM}};
  s3_req_amo_mask_dup_for_data_wvalid = _RAND_378[7:0];
  _RAND_379 = {1{`RANDOM}};
  s3_valid_dup_for_data_wbank_0 = _RAND_379[0:0];
  _RAND_380 = {1{`RANDOM}};
  s3_valid_dup_for_data_wbank_1 = _RAND_380[0:0];
  _RAND_381 = {1{`RANDOM}};
  s3_valid_dup_for_data_wbank_2 = _RAND_381[0:0];
  _RAND_382 = {1{`RANDOM}};
  s3_valid_dup_for_data_wbank_3 = _RAND_382[0:0];
  _RAND_383 = {1{`RANDOM}};
  s3_valid_dup_for_data_wbank_4 = _RAND_383[0:0];
  _RAND_384 = {1{`RANDOM}};
  s3_valid_dup_for_data_wbank_5 = _RAND_384[0:0];
  _RAND_385 = {1{`RANDOM}};
  s3_valid_dup_for_data_wbank_6 = _RAND_385[0:0];
  _RAND_386 = {1{`RANDOM}};
  s3_valid_dup_for_data_wbank_7 = _RAND_386[0:0];
  _RAND_387 = {1{`RANDOM}};
  s3_req_miss_dup_for_data_wbank = _RAND_387[0:0];
  _RAND_388 = {1{`RANDOM}};
  s3_req_probe_dup_for_data_wbank = _RAND_388[0:0];
  _RAND_389 = {1{`RANDOM}};
  s3_coh_dup_for_data_wbank_state = _RAND_389[1:0];
  _RAND_390 = {1{`RANDOM}};
  s3_req_source_dup_for_data_wbank = _RAND_390[3:0];
  _RAND_391 = {1{`RANDOM}};
  s3_req_cmd_dup_for_data_wbank = _RAND_391[4:0];
  _RAND_392 = {1{`RANDOM}};
  s3_req_replace_dup_for_data_wbank = _RAND_392[0:0];
  _RAND_393 = {1{`RANDOM}};
  s3_amo_hit_dup_for_data_wbank = _RAND_393[0:0];
  _RAND_394 = {1{`RANDOM}};
  s3_s_amoalu_dup_for_data_wbank = _RAND_394[0:0];
  _RAND_395 = {1{`RANDOM}};
  s3_store_hit_dup_for_data_wbank = _RAND_395[0:0];
  _RAND_396 = {2{`RANDOM}};
  s3_req_addr_dup_for_data_wbank = _RAND_396[35:0];
  _RAND_397 = {2{`RANDOM}};
  lrsc_addr_dup_for_data_wbank = _RAND_397[35:0];
  _RAND_398 = {1{`RANDOM}};
  lrsc_count_dup_for_data_wbank = _RAND_398[5:0];
  _RAND_399 = {1{`RANDOM}};
  io_data_write_dup_0_bits_way_en_r = _RAND_399[7:0];
  _RAND_400 = {2{`RANDOM}};
  io_data_write_dup_0_bits_addr_r = _RAND_400[38:0];
  _RAND_401 = {1{`RANDOM}};
  s3_req_miss_dup_for_data_wbank_1 = _RAND_401[0:0];
  _RAND_402 = {1{`RANDOM}};
  s3_req_probe_dup_for_data_wbank_1 = _RAND_402[0:0];
  _RAND_403 = {1{`RANDOM}};
  s3_coh_dup_for_data_wbank_1_state = _RAND_403[1:0];
  _RAND_404 = {1{`RANDOM}};
  s3_req_source_dup_for_data_wbank_1 = _RAND_404[3:0];
  _RAND_405 = {1{`RANDOM}};
  s3_req_cmd_dup_for_data_wbank_1 = _RAND_405[4:0];
  _RAND_406 = {1{`RANDOM}};
  s3_req_replace_dup_for_data_wbank_1 = _RAND_406[0:0];
  _RAND_407 = {1{`RANDOM}};
  s3_amo_hit_dup_for_data_wbank_1 = _RAND_407[0:0];
  _RAND_408 = {1{`RANDOM}};
  s3_s_amoalu_dup_for_data_wbank_1 = _RAND_408[0:0];
  _RAND_409 = {1{`RANDOM}};
  s3_store_hit_dup_for_data_wbank_1 = _RAND_409[0:0];
  _RAND_410 = {2{`RANDOM}};
  s3_req_addr_dup_for_data_wbank_1 = _RAND_410[35:0];
  _RAND_411 = {2{`RANDOM}};
  lrsc_addr_dup_for_data_wbank_1 = _RAND_411[35:0];
  _RAND_412 = {1{`RANDOM}};
  lrsc_count_dup_for_data_wbank_1 = _RAND_412[5:0];
  _RAND_413 = {1{`RANDOM}};
  io_data_write_dup_1_bits_way_en_r = _RAND_413[7:0];
  _RAND_414 = {2{`RANDOM}};
  io_data_write_dup_1_bits_addr_r = _RAND_414[38:0];
  _RAND_415 = {1{`RANDOM}};
  s3_req_miss_dup_for_data_wbank_2 = _RAND_415[0:0];
  _RAND_416 = {1{`RANDOM}};
  s3_req_probe_dup_for_data_wbank_2 = _RAND_416[0:0];
  _RAND_417 = {1{`RANDOM}};
  s3_coh_dup_for_data_wbank_2_state = _RAND_417[1:0];
  _RAND_418 = {1{`RANDOM}};
  s3_req_source_dup_for_data_wbank_2 = _RAND_418[3:0];
  _RAND_419 = {1{`RANDOM}};
  s3_req_cmd_dup_for_data_wbank_2 = _RAND_419[4:0];
  _RAND_420 = {1{`RANDOM}};
  s3_req_replace_dup_for_data_wbank_2 = _RAND_420[0:0];
  _RAND_421 = {1{`RANDOM}};
  s3_amo_hit_dup_for_data_wbank_2 = _RAND_421[0:0];
  _RAND_422 = {1{`RANDOM}};
  s3_s_amoalu_dup_for_data_wbank_2 = _RAND_422[0:0];
  _RAND_423 = {1{`RANDOM}};
  s3_store_hit_dup_for_data_wbank_2 = _RAND_423[0:0];
  _RAND_424 = {2{`RANDOM}};
  s3_req_addr_dup_for_data_wbank_2 = _RAND_424[35:0];
  _RAND_425 = {2{`RANDOM}};
  lrsc_addr_dup_for_data_wbank_2 = _RAND_425[35:0];
  _RAND_426 = {1{`RANDOM}};
  lrsc_count_dup_for_data_wbank_2 = _RAND_426[5:0];
  _RAND_427 = {1{`RANDOM}};
  io_data_write_dup_2_bits_way_en_r = _RAND_427[7:0];
  _RAND_428 = {2{`RANDOM}};
  io_data_write_dup_2_bits_addr_r = _RAND_428[38:0];
  _RAND_429 = {1{`RANDOM}};
  s3_req_miss_dup_for_data_wbank_3 = _RAND_429[0:0];
  _RAND_430 = {1{`RANDOM}};
  s3_req_probe_dup_for_data_wbank_3 = _RAND_430[0:0];
  _RAND_431 = {1{`RANDOM}};
  s3_coh_dup_for_data_wbank_3_state = _RAND_431[1:0];
  _RAND_432 = {1{`RANDOM}};
  s3_req_source_dup_for_data_wbank_3 = _RAND_432[3:0];
  _RAND_433 = {1{`RANDOM}};
  s3_req_cmd_dup_for_data_wbank_3 = _RAND_433[4:0];
  _RAND_434 = {1{`RANDOM}};
  s3_req_replace_dup_for_data_wbank_3 = _RAND_434[0:0];
  _RAND_435 = {1{`RANDOM}};
  s3_amo_hit_dup_for_data_wbank_3 = _RAND_435[0:0];
  _RAND_436 = {1{`RANDOM}};
  s3_s_amoalu_dup_for_data_wbank_3 = _RAND_436[0:0];
  _RAND_437 = {1{`RANDOM}};
  s3_store_hit_dup_for_data_wbank_3 = _RAND_437[0:0];
  _RAND_438 = {2{`RANDOM}};
  s3_req_addr_dup_for_data_wbank_3 = _RAND_438[35:0];
  _RAND_439 = {2{`RANDOM}};
  lrsc_addr_dup_for_data_wbank_3 = _RAND_439[35:0];
  _RAND_440 = {1{`RANDOM}};
  lrsc_count_dup_for_data_wbank_3 = _RAND_440[5:0];
  _RAND_441 = {1{`RANDOM}};
  io_data_write_dup_3_bits_way_en_r = _RAND_441[7:0];
  _RAND_442 = {2{`RANDOM}};
  io_data_write_dup_3_bits_addr_r = _RAND_442[38:0];
  _RAND_443 = {1{`RANDOM}};
  s3_req_miss_dup_for_data_wbank_4 = _RAND_443[0:0];
  _RAND_444 = {1{`RANDOM}};
  s3_req_probe_dup_for_data_wbank_4 = _RAND_444[0:0];
  _RAND_445 = {1{`RANDOM}};
  s3_coh_dup_for_data_wbank_4_state = _RAND_445[1:0];
  _RAND_446 = {1{`RANDOM}};
  s3_req_source_dup_for_data_wbank_4 = _RAND_446[3:0];
  _RAND_447 = {1{`RANDOM}};
  s3_req_cmd_dup_for_data_wbank_4 = _RAND_447[4:0];
  _RAND_448 = {1{`RANDOM}};
  s3_req_replace_dup_for_data_wbank_4 = _RAND_448[0:0];
  _RAND_449 = {1{`RANDOM}};
  s3_amo_hit_dup_for_data_wbank_4 = _RAND_449[0:0];
  _RAND_450 = {1{`RANDOM}};
  s3_s_amoalu_dup_for_data_wbank_4 = _RAND_450[0:0];
  _RAND_451 = {1{`RANDOM}};
  s3_store_hit_dup_for_data_wbank_4 = _RAND_451[0:0];
  _RAND_452 = {2{`RANDOM}};
  s3_req_addr_dup_for_data_wbank_4 = _RAND_452[35:0];
  _RAND_453 = {2{`RANDOM}};
  lrsc_addr_dup_for_data_wbank_4 = _RAND_453[35:0];
  _RAND_454 = {1{`RANDOM}};
  lrsc_count_dup_for_data_wbank_4 = _RAND_454[5:0];
  _RAND_455 = {1{`RANDOM}};
  io_data_write_dup_4_bits_way_en_r = _RAND_455[7:0];
  _RAND_456 = {2{`RANDOM}};
  io_data_write_dup_4_bits_addr_r = _RAND_456[38:0];
  _RAND_457 = {1{`RANDOM}};
  s3_req_miss_dup_for_data_wbank_5 = _RAND_457[0:0];
  _RAND_458 = {1{`RANDOM}};
  s3_req_probe_dup_for_data_wbank_5 = _RAND_458[0:0];
  _RAND_459 = {1{`RANDOM}};
  s3_coh_dup_for_data_wbank_5_state = _RAND_459[1:0];
  _RAND_460 = {1{`RANDOM}};
  s3_req_source_dup_for_data_wbank_5 = _RAND_460[3:0];
  _RAND_461 = {1{`RANDOM}};
  s3_req_cmd_dup_for_data_wbank_5 = _RAND_461[4:0];
  _RAND_462 = {1{`RANDOM}};
  s3_req_replace_dup_for_data_wbank_5 = _RAND_462[0:0];
  _RAND_463 = {1{`RANDOM}};
  s3_amo_hit_dup_for_data_wbank_5 = _RAND_463[0:0];
  _RAND_464 = {1{`RANDOM}};
  s3_s_amoalu_dup_for_data_wbank_5 = _RAND_464[0:0];
  _RAND_465 = {1{`RANDOM}};
  s3_store_hit_dup_for_data_wbank_5 = _RAND_465[0:0];
  _RAND_466 = {2{`RANDOM}};
  s3_req_addr_dup_for_data_wbank_5 = _RAND_466[35:0];
  _RAND_467 = {2{`RANDOM}};
  lrsc_addr_dup_for_data_wbank_5 = _RAND_467[35:0];
  _RAND_468 = {1{`RANDOM}};
  lrsc_count_dup_for_data_wbank_5 = _RAND_468[5:0];
  _RAND_469 = {1{`RANDOM}};
  io_data_write_dup_5_bits_way_en_r = _RAND_469[7:0];
  _RAND_470 = {2{`RANDOM}};
  io_data_write_dup_5_bits_addr_r = _RAND_470[38:0];
  _RAND_471 = {1{`RANDOM}};
  s3_req_miss_dup_for_data_wbank_6 = _RAND_471[0:0];
  _RAND_472 = {1{`RANDOM}};
  s3_req_probe_dup_for_data_wbank_6 = _RAND_472[0:0];
  _RAND_473 = {1{`RANDOM}};
  s3_coh_dup_for_data_wbank_6_state = _RAND_473[1:0];
  _RAND_474 = {1{`RANDOM}};
  s3_req_source_dup_for_data_wbank_6 = _RAND_474[3:0];
  _RAND_475 = {1{`RANDOM}};
  s3_req_cmd_dup_for_data_wbank_6 = _RAND_475[4:0];
  _RAND_476 = {1{`RANDOM}};
  s3_req_replace_dup_for_data_wbank_6 = _RAND_476[0:0];
  _RAND_477 = {1{`RANDOM}};
  s3_amo_hit_dup_for_data_wbank_6 = _RAND_477[0:0];
  _RAND_478 = {1{`RANDOM}};
  s3_s_amoalu_dup_for_data_wbank_6 = _RAND_478[0:0];
  _RAND_479 = {1{`RANDOM}};
  s3_store_hit_dup_for_data_wbank_6 = _RAND_479[0:0];
  _RAND_480 = {2{`RANDOM}};
  s3_req_addr_dup_for_data_wbank_6 = _RAND_480[35:0];
  _RAND_481 = {2{`RANDOM}};
  lrsc_addr_dup_for_data_wbank_6 = _RAND_481[35:0];
  _RAND_482 = {1{`RANDOM}};
  lrsc_count_dup_for_data_wbank_6 = _RAND_482[5:0];
  _RAND_483 = {1{`RANDOM}};
  io_data_write_dup_6_bits_way_en_r = _RAND_483[7:0];
  _RAND_484 = {2{`RANDOM}};
  io_data_write_dup_6_bits_addr_r = _RAND_484[38:0];
  _RAND_485 = {1{`RANDOM}};
  s3_req_miss_dup_for_data_wbank_7 = _RAND_485[0:0];
  _RAND_486 = {1{`RANDOM}};
  s3_req_probe_dup_for_data_wbank_7 = _RAND_486[0:0];
  _RAND_487 = {1{`RANDOM}};
  s3_coh_dup_for_data_wbank_7_state = _RAND_487[1:0];
  _RAND_488 = {1{`RANDOM}};
  s3_req_source_dup_for_data_wbank_7 = _RAND_488[3:0];
  _RAND_489 = {1{`RANDOM}};
  s3_req_cmd_dup_for_data_wbank_7 = _RAND_489[4:0];
  _RAND_490 = {1{`RANDOM}};
  s3_req_replace_dup_for_data_wbank_7 = _RAND_490[0:0];
  _RAND_491 = {1{`RANDOM}};
  s3_amo_hit_dup_for_data_wbank_7 = _RAND_491[0:0];
  _RAND_492 = {1{`RANDOM}};
  s3_s_amoalu_dup_for_data_wbank_7 = _RAND_492[0:0];
  _RAND_493 = {1{`RANDOM}};
  s3_store_hit_dup_for_data_wbank_7 = _RAND_493[0:0];
  _RAND_494 = {2{`RANDOM}};
  s3_req_addr_dup_for_data_wbank_7 = _RAND_494[35:0];
  _RAND_495 = {2{`RANDOM}};
  lrsc_addr_dup_for_data_wbank_7 = _RAND_495[35:0];
  _RAND_496 = {1{`RANDOM}};
  lrsc_count_dup_for_data_wbank_7 = _RAND_496[5:0];
  _RAND_497 = {1{`RANDOM}};
  io_data_write_dup_7_bits_way_en_r = _RAND_497[7:0];
  _RAND_498 = {2{`RANDOM}};
  io_data_write_dup_7_bits_addr_r = _RAND_498[38:0];
  _RAND_499 = {1{`RANDOM}};
  miss_update_meta_dup_for_wb_valid = _RAND_499[0:0];
  _RAND_500 = {1{`RANDOM}};
  s3_req_probe_dup_for_wb_valid = _RAND_500[0:0];
  _RAND_501 = {1{`RANDOM}};
  s3_tag_match_dup_for_wb_valid = _RAND_501[0:0];
  _RAND_502 = {1{`RANDOM}};
  s3_coh_dup_for_wb_valid_state = _RAND_502[1:0];
  _RAND_503 = {1{`RANDOM}};
  s3_req_probe_param_dup_for_wb_valid = _RAND_503[1:0];
  _RAND_504 = {1{`RANDOM}};
  s3_req_source_dup_for_wb_valid = _RAND_504[3:0];
  _RAND_505 = {1{`RANDOM}};
  s3_req_cmd_dup_for_wb_valid = _RAND_505[4:0];
  _RAND_506 = {1{`RANDOM}};
  s3_req_replace_dup_for_wb_valid = _RAND_506[0:0];
  _RAND_507 = {1{`RANDOM}};
  s3_valid_dup_for_wb_valid = _RAND_507[0:0];
  _RAND_508 = {1{`RANDOM}};
  s3_amo_hit_dup_for_wb_valid = _RAND_508[0:0];
  _RAND_509 = {1{`RANDOM}};
  s3_s_amoalu_dup_for_wb_valid = _RAND_509[0:0];
  _RAND_510 = {1{`RANDOM}};
  s3_store_hit_dup_for_wb_valid = _RAND_510[0:0];
  _RAND_511 = {2{`RANDOM}};
  s3_req_addr_dup_for_wb_valid = _RAND_511[35:0];
  _RAND_512 = {2{`RANDOM}};
  lrsc_addr_dup_for_wb_valid = _RAND_512[35:0];
  _RAND_513 = {1{`RANDOM}};
  lrsc_count_dup_for_wb_valid = _RAND_513[5:0];
  _RAND_514 = {1{`RANDOM}};
  s3_need_replacement_dup_for_wb_valid = _RAND_514[0:0];
  _RAND_515 = {1{`RANDOM}};
  s3_tag_dup_for_wb_valid = _RAND_515[23:0];
  _RAND_516 = {1{`RANDOM}};
  writeback_data_dup_for_wb_valid_r = _RAND_516[0:0];
  _RAND_517 = {1{`RANDOM}};
  io_replace_access_valid_REG = _RAND_517[0:0];
  _RAND_518 = {1{`RANDOM}};
  io_replace_access_bits_way_REG = _RAND_518[2:0];
  _RAND_519 = {1{`RANDOM}};
  io_status_dup_0_s1_bits_set_r = _RAND_519[5:0];
  _RAND_520 = {1{`RANDOM}};
  io_status_dup_0_s2_valid_r = _RAND_520[0:0];
  _RAND_521 = {1{`RANDOM}};
  io_status_dup_0_s2_bits_set_r = _RAND_521[5:0];
  _RAND_522 = {1{`RANDOM}};
  io_status_dup_0_s2_bits_way_en_r = _RAND_522[7:0];
  _RAND_523 = {1{`RANDOM}};
  io_status_dup_0_s3_valid_r = _RAND_523[0:0];
  _RAND_524 = {1{`RANDOM}};
  io_status_dup_0_s3_bits_set_r = _RAND_524[5:0];
  _RAND_525 = {1{`RANDOM}};
  io_status_dup_0_s3_bits_way_en_r = _RAND_525[7:0];
  _RAND_526 = {1{`RANDOM}};
  io_status_dup_1_s1_bits_set_r = _RAND_526[5:0];
  _RAND_527 = {1{`RANDOM}};
  io_status_dup_1_s2_valid_r = _RAND_527[0:0];
  _RAND_528 = {1{`RANDOM}};
  io_status_dup_1_s2_bits_set_r = _RAND_528[5:0];
  _RAND_529 = {1{`RANDOM}};
  io_status_dup_1_s2_bits_way_en_r = _RAND_529[7:0];
  _RAND_530 = {1{`RANDOM}};
  io_status_dup_1_s3_valid_r = _RAND_530[0:0];
  _RAND_531 = {1{`RANDOM}};
  io_status_dup_1_s3_bits_set_r = _RAND_531[5:0];
  _RAND_532 = {1{`RANDOM}};
  io_status_dup_1_s3_bits_way_en_r = _RAND_532[7:0];
  _RAND_533 = {1{`RANDOM}};
  io_status_dup_2_s1_bits_set_r = _RAND_533[5:0];
  _RAND_534 = {1{`RANDOM}};
  io_status_dup_2_s2_valid_r = _RAND_534[0:0];
  _RAND_535 = {1{`RANDOM}};
  io_status_dup_2_s2_bits_set_r = _RAND_535[5:0];
  _RAND_536 = {1{`RANDOM}};
  io_status_dup_2_s2_bits_way_en_r = _RAND_536[7:0];
  _RAND_537 = {1{`RANDOM}};
  io_status_dup_2_s3_valid_r = _RAND_537[0:0];
  _RAND_538 = {1{`RANDOM}};
  io_status_dup_2_s3_bits_set_r = _RAND_538[5:0];
  _RAND_539 = {1{`RANDOM}};
  io_status_dup_2_s3_bits_way_en_r = _RAND_539[7:0];
  _RAND_540 = {1{`RANDOM}};
  io_status_dup_3_s1_bits_set_r = _RAND_540[5:0];
  _RAND_541 = {1{`RANDOM}};
  io_status_dup_3_s2_valid_r = _RAND_541[0:0];
  _RAND_542 = {1{`RANDOM}};
  io_status_dup_3_s2_bits_set_r = _RAND_542[5:0];
  _RAND_543 = {1{`RANDOM}};
  io_status_dup_3_s2_bits_way_en_r = _RAND_543[7:0];
  _RAND_544 = {1{`RANDOM}};
  io_status_dup_3_s3_valid_r = _RAND_544[0:0];
  _RAND_545 = {1{`RANDOM}};
  io_status_dup_3_s3_bits_set_r = _RAND_545[5:0];
  _RAND_546 = {1{`RANDOM}};
  io_status_dup_3_s3_bits_way_en_r = _RAND_546[7:0];
  _RAND_547 = {1{`RANDOM}};
  io_status_dup_4_s1_bits_set_r = _RAND_547[5:0];
  _RAND_548 = {1{`RANDOM}};
  io_status_dup_4_s2_valid_r = _RAND_548[0:0];
  _RAND_549 = {1{`RANDOM}};
  io_status_dup_4_s2_bits_set_r = _RAND_549[5:0];
  _RAND_550 = {1{`RANDOM}};
  io_status_dup_4_s2_bits_way_en_r = _RAND_550[7:0];
  _RAND_551 = {1{`RANDOM}};
  io_status_dup_4_s3_valid_r = _RAND_551[0:0];
  _RAND_552 = {1{`RANDOM}};
  io_status_dup_4_s3_bits_set_r = _RAND_552[5:0];
  _RAND_553 = {1{`RANDOM}};
  io_status_dup_4_s3_bits_way_en_r = _RAND_553[7:0];
  _RAND_554 = {1{`RANDOM}};
  io_status_dup_5_s1_bits_set_r = _RAND_554[5:0];
  _RAND_555 = {1{`RANDOM}};
  io_status_dup_5_s2_valid_r = _RAND_555[0:0];
  _RAND_556 = {1{`RANDOM}};
  io_status_dup_5_s2_bits_set_r = _RAND_556[5:0];
  _RAND_557 = {1{`RANDOM}};
  io_status_dup_5_s2_bits_way_en_r = _RAND_557[7:0];
  _RAND_558 = {1{`RANDOM}};
  io_status_dup_5_s3_valid_r = _RAND_558[0:0];
  _RAND_559 = {1{`RANDOM}};
  io_status_dup_5_s3_bits_set_r = _RAND_559[5:0];
  _RAND_560 = {1{`RANDOM}};
  io_status_dup_5_s3_bits_way_en_r = _RAND_560[7:0];
  _RAND_561 = {1{`RANDOM}};
  io_status_dup_6_s1_bits_set_r = _RAND_561[5:0];
  _RAND_562 = {1{`RANDOM}};
  io_status_dup_6_s2_valid_r = _RAND_562[0:0];
  _RAND_563 = {1{`RANDOM}};
  io_status_dup_6_s2_bits_set_r = _RAND_563[5:0];
  _RAND_564 = {1{`RANDOM}};
  io_status_dup_6_s2_bits_way_en_r = _RAND_564[7:0];
  _RAND_565 = {1{`RANDOM}};
  io_status_dup_6_s3_valid_r = _RAND_565[0:0];
  _RAND_566 = {1{`RANDOM}};
  io_status_dup_6_s3_bits_set_r = _RAND_566[5:0];
  _RAND_567 = {1{`RANDOM}};
  io_status_dup_6_s3_bits_way_en_r = _RAND_567[7:0];
  _RAND_568 = {1{`RANDOM}};
  io_status_dup_7_s1_bits_set_r = _RAND_568[5:0];
  _RAND_569 = {1{`RANDOM}};
  io_status_dup_7_s2_valid_r = _RAND_569[0:0];
  _RAND_570 = {1{`RANDOM}};
  io_status_dup_7_s2_bits_set_r = _RAND_570[5:0];
  _RAND_571 = {1{`RANDOM}};
  io_status_dup_7_s2_bits_way_en_r = _RAND_571[7:0];
  _RAND_572 = {1{`RANDOM}};
  io_status_dup_7_s3_valid_r = _RAND_572[0:0];
  _RAND_573 = {1{`RANDOM}};
  io_status_dup_7_s3_bits_set_r = _RAND_573[5:0];
  _RAND_574 = {1{`RANDOM}};
  io_status_dup_7_s3_bits_way_en_r = _RAND_574[7:0];
  _RAND_575 = {1{`RANDOM}};
  io_status_dup_8_s1_bits_set_r = _RAND_575[5:0];
  _RAND_576 = {1{`RANDOM}};
  io_status_dup_8_s2_valid_r = _RAND_576[0:0];
  _RAND_577 = {1{`RANDOM}};
  io_status_dup_8_s2_bits_set_r = _RAND_577[5:0];
  _RAND_578 = {1{`RANDOM}};
  io_status_dup_8_s2_bits_way_en_r = _RAND_578[7:0];
  _RAND_579 = {1{`RANDOM}};
  io_status_dup_8_s3_valid_r = _RAND_579[0:0];
  _RAND_580 = {1{`RANDOM}};
  io_status_dup_8_s3_bits_set_r = _RAND_580[5:0];
  _RAND_581 = {1{`RANDOM}};
  io_status_dup_8_s3_bits_way_en_r = _RAND_581[7:0];
  _RAND_582 = {1{`RANDOM}};
  io_status_dup_9_s1_bits_set_r = _RAND_582[5:0];
  _RAND_583 = {1{`RANDOM}};
  io_status_dup_9_s2_valid_r = _RAND_583[0:0];
  _RAND_584 = {1{`RANDOM}};
  io_status_dup_9_s2_bits_set_r = _RAND_584[5:0];
  _RAND_585 = {1{`RANDOM}};
  io_status_dup_9_s2_bits_way_en_r = _RAND_585[7:0];
  _RAND_586 = {1{`RANDOM}};
  io_status_dup_9_s3_valid_r = _RAND_586[0:0];
  _RAND_587 = {1{`RANDOM}};
  io_status_dup_9_s3_bits_set_r = _RAND_587[5:0];
  _RAND_588 = {1{`RANDOM}};
  io_status_dup_9_s3_bits_way_en_r = _RAND_588[7:0];
  _RAND_589 = {1{`RANDOM}};
  io_status_dup_10_s1_bits_set_r = _RAND_589[5:0];
  _RAND_590 = {1{`RANDOM}};
  io_status_dup_10_s2_valid_r = _RAND_590[0:0];
  _RAND_591 = {1{`RANDOM}};
  io_status_dup_10_s2_bits_set_r = _RAND_591[5:0];
  _RAND_592 = {1{`RANDOM}};
  io_status_dup_10_s2_bits_way_en_r = _RAND_592[7:0];
  _RAND_593 = {1{`RANDOM}};
  io_status_dup_10_s3_valid_r = _RAND_593[0:0];
  _RAND_594 = {1{`RANDOM}};
  io_status_dup_10_s3_bits_set_r = _RAND_594[5:0];
  _RAND_595 = {1{`RANDOM}};
  io_status_dup_10_s3_bits_way_en_r = _RAND_595[7:0];
  _RAND_596 = {1{`RANDOM}};
  io_status_dup_11_s1_bits_set_r = _RAND_596[5:0];
  _RAND_597 = {1{`RANDOM}};
  io_status_dup_11_s2_valid_r = _RAND_597[0:0];
  _RAND_598 = {1{`RANDOM}};
  io_status_dup_11_s2_bits_set_r = _RAND_598[5:0];
  _RAND_599 = {1{`RANDOM}};
  io_status_dup_11_s2_bits_way_en_r = _RAND_599[7:0];
  _RAND_600 = {1{`RANDOM}};
  io_status_dup_11_s3_valid_r = _RAND_600[0:0];
  _RAND_601 = {1{`RANDOM}};
  io_status_dup_11_s3_bits_set_r = _RAND_601[5:0];
  _RAND_602 = {1{`RANDOM}};
  io_status_dup_11_s3_bits_way_en_r = _RAND_602[7:0];
  _RAND_603 = {1{`RANDOM}};
  io_status_dup_12_s1_bits_set_r = _RAND_603[5:0];
  _RAND_604 = {1{`RANDOM}};
  io_status_dup_12_s2_valid_r = _RAND_604[0:0];
  _RAND_605 = {1{`RANDOM}};
  io_status_dup_12_s2_bits_set_r = _RAND_605[5:0];
  _RAND_606 = {1{`RANDOM}};
  io_status_dup_12_s2_bits_way_en_r = _RAND_606[7:0];
  _RAND_607 = {1{`RANDOM}};
  io_status_dup_12_s3_valid_r = _RAND_607[0:0];
  _RAND_608 = {1{`RANDOM}};
  io_status_dup_12_s3_bits_set_r = _RAND_608[5:0];
  _RAND_609 = {1{`RANDOM}};
  io_status_dup_12_s3_bits_way_en_r = _RAND_609[7:0];
  _RAND_610 = {1{`RANDOM}};
  io_status_dup_13_s1_bits_set_r = _RAND_610[5:0];
  _RAND_611 = {1{`RANDOM}};
  io_status_dup_13_s2_valid_r = _RAND_611[0:0];
  _RAND_612 = {1{`RANDOM}};
  io_status_dup_13_s2_bits_set_r = _RAND_612[5:0];
  _RAND_613 = {1{`RANDOM}};
  io_status_dup_13_s2_bits_way_en_r = _RAND_613[7:0];
  _RAND_614 = {1{`RANDOM}};
  io_status_dup_13_s3_valid_r = _RAND_614[0:0];
  _RAND_615 = {1{`RANDOM}};
  io_status_dup_13_s3_bits_set_r = _RAND_615[5:0];
  _RAND_616 = {1{`RANDOM}};
  io_status_dup_13_s3_bits_way_en_r = _RAND_616[7:0];
  _RAND_617 = {1{`RANDOM}};
  io_status_dup_14_s1_bits_set_r = _RAND_617[5:0];
  _RAND_618 = {1{`RANDOM}};
  io_status_dup_14_s2_valid_r = _RAND_618[0:0];
  _RAND_619 = {1{`RANDOM}};
  io_status_dup_14_s2_bits_set_r = _RAND_619[5:0];
  _RAND_620 = {1{`RANDOM}};
  io_status_dup_14_s2_bits_way_en_r = _RAND_620[7:0];
  _RAND_621 = {1{`RANDOM}};
  io_status_dup_14_s3_valid_r = _RAND_621[0:0];
  _RAND_622 = {1{`RANDOM}};
  io_status_dup_14_s3_bits_set_r = _RAND_622[5:0];
  _RAND_623 = {1{`RANDOM}};
  io_status_dup_14_s3_bits_way_en_r = _RAND_623[7:0];
  _RAND_624 = {1{`RANDOM}};
  io_status_dup_15_s1_bits_set_r = _RAND_624[5:0];
  _RAND_625 = {1{`RANDOM}};
  io_status_dup_15_s2_valid_r = _RAND_625[0:0];
  _RAND_626 = {1{`RANDOM}};
  io_status_dup_15_s2_bits_set_r = _RAND_626[5:0];
  _RAND_627 = {1{`RANDOM}};
  io_status_dup_15_s2_bits_way_en_r = _RAND_627[7:0];
  _RAND_628 = {1{`RANDOM}};
  io_status_dup_15_s3_valid_r = _RAND_628[0:0];
  _RAND_629 = {1{`RANDOM}};
  io_status_dup_15_s3_bits_set_r = _RAND_629[5:0];
  _RAND_630 = {1{`RANDOM}};
  io_status_dup_15_s3_bits_way_en_r = _RAND_630[7:0];
  _RAND_631 = {1{`RANDOM}};
  io_status_dup_16_s1_bits_set_r = _RAND_631[5:0];
  _RAND_632 = {1{`RANDOM}};
  io_status_dup_16_s2_valid_r = _RAND_632[0:0];
  _RAND_633 = {1{`RANDOM}};
  io_status_dup_16_s2_bits_set_r = _RAND_633[5:0];
  _RAND_634 = {1{`RANDOM}};
  io_status_dup_16_s2_bits_way_en_r = _RAND_634[7:0];
  _RAND_635 = {1{`RANDOM}};
  io_status_dup_16_s3_valid_r = _RAND_635[0:0];
  _RAND_636 = {1{`RANDOM}};
  io_status_dup_16_s3_bits_set_r = _RAND_636[5:0];
  _RAND_637 = {1{`RANDOM}};
  io_status_dup_16_s3_bits_way_en_r = _RAND_637[7:0];
  _RAND_638 = {1{`RANDOM}};
  io_status_dup_17_s1_bits_set_r = _RAND_638[5:0];
  _RAND_639 = {1{`RANDOM}};
  io_status_dup_17_s2_valid_r = _RAND_639[0:0];
  _RAND_640 = {1{`RANDOM}};
  io_status_dup_17_s2_bits_set_r = _RAND_640[5:0];
  _RAND_641 = {1{`RANDOM}};
  io_status_dup_17_s2_bits_way_en_r = _RAND_641[7:0];
  _RAND_642 = {1{`RANDOM}};
  io_status_dup_17_s3_valid_r = _RAND_642[0:0];
  _RAND_643 = {1{`RANDOM}};
  io_status_dup_17_s3_bits_set_r = _RAND_643[5:0];
  _RAND_644 = {1{`RANDOM}};
  io_status_dup_17_s3_bits_way_en_r = _RAND_644[7:0];
  _RAND_645 = {1{`RANDOM}};
  io_status_dup_18_s1_bits_set_r = _RAND_645[5:0];
  _RAND_646 = {1{`RANDOM}};
  io_status_dup_18_s2_valid_r = _RAND_646[0:0];
  _RAND_647 = {1{`RANDOM}};
  io_status_dup_18_s2_bits_set_r = _RAND_647[5:0];
  _RAND_648 = {1{`RANDOM}};
  io_status_dup_18_s2_bits_way_en_r = _RAND_648[7:0];
  _RAND_649 = {1{`RANDOM}};
  io_status_dup_18_s3_valid_r = _RAND_649[0:0];
  _RAND_650 = {1{`RANDOM}};
  io_status_dup_18_s3_bits_set_r = _RAND_650[5:0];
  _RAND_651 = {1{`RANDOM}};
  io_status_dup_18_s3_bits_way_en_r = _RAND_651[7:0];
  _RAND_652 = {1{`RANDOM}};
  io_status_dup_19_s1_bits_set_r = _RAND_652[5:0];
  _RAND_653 = {1{`RANDOM}};
  io_status_dup_19_s2_valid_r = _RAND_653[0:0];
  _RAND_654 = {1{`RANDOM}};
  io_status_dup_19_s2_bits_set_r = _RAND_654[5:0];
  _RAND_655 = {1{`RANDOM}};
  io_status_dup_19_s2_bits_way_en_r = _RAND_655[7:0];
  _RAND_656 = {1{`RANDOM}};
  io_status_dup_19_s3_valid_r = _RAND_656[0:0];
  _RAND_657 = {1{`RANDOM}};
  io_status_dup_19_s3_bits_set_r = _RAND_657[5:0];
  _RAND_658 = {1{`RANDOM}};
  io_status_dup_19_s3_bits_way_en_r = _RAND_658[7:0];
  _RAND_659 = {1{`RANDOM}};
  io_status_dup_20_s1_bits_set_r = _RAND_659[5:0];
  _RAND_660 = {1{`RANDOM}};
  io_status_dup_20_s2_valid_r = _RAND_660[0:0];
  _RAND_661 = {1{`RANDOM}};
  io_status_dup_20_s2_bits_set_r = _RAND_661[5:0];
  _RAND_662 = {1{`RANDOM}};
  io_status_dup_20_s2_bits_way_en_r = _RAND_662[7:0];
  _RAND_663 = {1{`RANDOM}};
  io_status_dup_20_s3_valid_r = _RAND_663[0:0];
  _RAND_664 = {1{`RANDOM}};
  io_status_dup_20_s3_bits_set_r = _RAND_664[5:0];
  _RAND_665 = {1{`RANDOM}};
  io_status_dup_20_s3_bits_way_en_r = _RAND_665[7:0];
  _RAND_666 = {1{`RANDOM}};
  io_status_dup_21_s1_bits_set_r = _RAND_666[5:0];
  _RAND_667 = {1{`RANDOM}};
  io_status_dup_21_s2_valid_r = _RAND_667[0:0];
  _RAND_668 = {1{`RANDOM}};
  io_status_dup_21_s2_bits_set_r = _RAND_668[5:0];
  _RAND_669 = {1{`RANDOM}};
  io_status_dup_21_s2_bits_way_en_r = _RAND_669[7:0];
  _RAND_670 = {1{`RANDOM}};
  io_status_dup_21_s3_valid_r = _RAND_670[0:0];
  _RAND_671 = {1{`RANDOM}};
  io_status_dup_21_s3_bits_set_r = _RAND_671[5:0];
  _RAND_672 = {1{`RANDOM}};
  io_status_dup_21_s3_bits_way_en_r = _RAND_672[7:0];
  _RAND_673 = {1{`RANDOM}};
  io_status_dup_22_s1_bits_set_r = _RAND_673[5:0];
  _RAND_674 = {1{`RANDOM}};
  io_status_dup_22_s2_valid_r = _RAND_674[0:0];
  _RAND_675 = {1{`RANDOM}};
  io_status_dup_22_s2_bits_set_r = _RAND_675[5:0];
  _RAND_676 = {1{`RANDOM}};
  io_status_dup_22_s2_bits_way_en_r = _RAND_676[7:0];
  _RAND_677 = {1{`RANDOM}};
  io_status_dup_22_s3_valid_r = _RAND_677[0:0];
  _RAND_678 = {1{`RANDOM}};
  io_status_dup_22_s3_bits_set_r = _RAND_678[5:0];
  _RAND_679 = {1{`RANDOM}};
  io_status_dup_22_s3_bits_way_en_r = _RAND_679[7:0];
  _RAND_680 = {1{`RANDOM}};
  io_status_dup_23_s1_bits_set_r = _RAND_680[5:0];
  _RAND_681 = {1{`RANDOM}};
  io_status_dup_23_s2_valid_r = _RAND_681[0:0];
  _RAND_682 = {1{`RANDOM}};
  io_status_dup_23_s2_bits_set_r = _RAND_682[5:0];
  _RAND_683 = {1{`RANDOM}};
  io_status_dup_23_s2_bits_way_en_r = _RAND_683[7:0];
  _RAND_684 = {1{`RANDOM}};
  io_status_dup_23_s3_valid_r = _RAND_684[0:0];
  _RAND_685 = {1{`RANDOM}};
  io_status_dup_23_s3_bits_set_r = _RAND_685[5:0];
  _RAND_686 = {1{`RANDOM}};
  io_status_dup_23_s3_bits_way_en_r = _RAND_686[7:0];
  _RAND_687 = {1{`RANDOM}};
  io_error_valid_REG = _RAND_687[0:0];
  _RAND_688 = {1{`RANDOM}};
  io_error_report_to_beu_r = _RAND_688[0:0];
  _RAND_689 = {1{`RANDOM}};
  io_error_report_to_beu_REG = _RAND_689[0:0];
  _RAND_690 = {2{`RANDOM}};
  io_error_paddr_r = _RAND_690[35:0];
  _RAND_691 = {1{`RANDOM}};
  io_error_source_tag_r = _RAND_691[0:0];
  _RAND_692 = {1{`RANDOM}};
  io_error_source_l2_r = _RAND_692[0:0];
  _RAND_693 = {1{`RANDOM}};
  io_error_opType_store_r = _RAND_693[0:0];
  _RAND_694 = {1{`RANDOM}};
  io_error_opType_probe_r = _RAND_694[0:0];
  _RAND_695 = {1{`RANDOM}};
  io_error_opType_release_r = _RAND_695[0:0];
  _RAND_696 = {1{`RANDOM}};
  io_error_opType_atom_r = _RAND_696[0:0];
  _RAND_697 = {1{`RANDOM}};
  io_perf_0_value_REG = _RAND_697[0:0];
  _RAND_698 = {1{`RANDOM}};
  io_perf_0_value_REG_1 = _RAND_698[0:0];
  _RAND_699 = {1{`RANDOM}};
  io_perf_1_value_REG = _RAND_699[2:0];
  _RAND_700 = {1{`RANDOM}};
  io_perf_1_value_REG_1 = _RAND_700[2:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    s1_valid_dup_1 = 1'h0;
  end
  if (reset) begin
    s2_valid_dup_0 = 1'h0;
  end
  if (reset) begin
    s3_valid_dup_6 = 1'h0;
  end
  if (reset) begin
    s1_valid_dup_2 = 1'h0;
  end
  if (reset) begin
    s2_valid_dup_1 = 1'h0;
  end
  if (reset) begin
    s3_valid_dup_7 = 1'h0;
  end
  if (reset) begin
    s1_valid_dup_0 = 1'h0;
  end
  if (reset) begin
    s2_valid_dup_3 = 1'h0;
  end
  if (reset) begin
    s3_valid_dup_5 = 1'h0;
  end
  if (reset) begin
    lrsc_count_dup_0 = 6'h0;
  end
  if (reset) begin
    s3_s_amoalu_dup_0 = 1'h0;
  end
  if (reset) begin
    s3_s_amoalu_dup_1 = 1'h0;
  end
  if (reset) begin
    s1_valid = 1'h0;
  end
  if (reset) begin
    s1_valid_dup_4 = 1'h0;
  end
  if (reset) begin
    s1_valid_dup_5 = 1'h0;
  end
  if (reset) begin
    s1_valid_dup_for_status_0 = 1'h0;
  end
  if (reset) begin
    s1_valid_dup_for_status_1 = 1'h0;
  end
  if (reset) begin
    s1_valid_dup_for_status_2 = 1'h0;
  end
  if (reset) begin
    s1_valid_dup_for_status_3 = 1'h0;
  end
  if (reset) begin
    s1_valid_dup_for_status_4 = 1'h0;
  end
  if (reset) begin
    s1_valid_dup_for_status_5 = 1'h0;
  end
  if (reset) begin
    s1_valid_dup_for_status_6 = 1'h0;
  end
  if (reset) begin
    s1_valid_dup_for_status_7 = 1'h0;
  end
  if (reset) begin
    s1_valid_dup_for_status_8 = 1'h0;
  end
  if (reset) begin
    s1_valid_dup_for_status_9 = 1'h0;
  end
  if (reset) begin
    s1_valid_dup_for_status_10 = 1'h0;
  end
  if (reset) begin
    s1_valid_dup_for_status_11 = 1'h0;
  end
  if (reset) begin
    s1_valid_dup_for_status_12 = 1'h0;
  end
  if (reset) begin
    s1_valid_dup_for_status_13 = 1'h0;
  end
  if (reset) begin
    s1_valid_dup_for_status_14 = 1'h0;
  end
  if (reset) begin
    s1_valid_dup_for_status_15 = 1'h0;
  end
  if (reset) begin
    s1_valid_dup_for_status_16 = 1'h0;
  end
  if (reset) begin
    s1_valid_dup_for_status_17 = 1'h0;
  end
  if (reset) begin
    s1_valid_dup_for_status_18 = 1'h0;
  end
  if (reset) begin
    s1_valid_dup_for_status_19 = 1'h0;
  end
  if (reset) begin
    s1_valid_dup_for_status_20 = 1'h0;
  end
  if (reset) begin
    s1_valid_dup_for_status_21 = 1'h0;
  end
  if (reset) begin
    s1_valid_dup_for_status_22 = 1'h0;
  end
  if (reset) begin
    s1_valid_dup_for_status_23 = 1'h0;
  end
  if (reset) begin
    s2_valid = 1'h0;
  end
  if (reset) begin
    s2_valid_dup_2 = 1'h0;
  end
  if (reset) begin
    s2_valid_dup_4 = 1'h0;
  end
  if (reset) begin
    s2_valid_dup_5 = 1'h0;
  end
  if (reset) begin
    s2_valid_dup_6 = 1'h0;
  end
  if (reset) begin
    s2_valid_dup_7 = 1'h0;
  end
  if (reset) begin
    s2_valid_dup_for_status_0 = 1'h0;
  end
  if (reset) begin
    s2_valid_dup_for_status_1 = 1'h0;
  end
  if (reset) begin
    s2_valid_dup_for_status_2 = 1'h0;
  end
  if (reset) begin
    s2_valid_dup_for_status_3 = 1'h0;
  end
  if (reset) begin
    s2_valid_dup_for_status_4 = 1'h0;
  end
  if (reset) begin
    s2_valid_dup_for_status_5 = 1'h0;
  end
  if (reset) begin
    s2_valid_dup_for_status_6 = 1'h0;
  end
  if (reset) begin
    s2_valid_dup_for_status_7 = 1'h0;
  end
  if (reset) begin
    s2_valid_dup_for_status_8 = 1'h0;
  end
  if (reset) begin
    s2_valid_dup_for_status_9 = 1'h0;
  end
  if (reset) begin
    s2_valid_dup_for_status_10 = 1'h0;
  end
  if (reset) begin
    s2_valid_dup_for_status_11 = 1'h0;
  end
  if (reset) begin
    s2_valid_dup_for_status_12 = 1'h0;
  end
  if (reset) begin
    s2_valid_dup_for_status_13 = 1'h0;
  end
  if (reset) begin
    s2_valid_dup_for_status_14 = 1'h0;
  end
  if (reset) begin
    s2_valid_dup_for_status_15 = 1'h0;
  end
  if (reset) begin
    s2_valid_dup_for_status_16 = 1'h0;
  end
  if (reset) begin
    s2_valid_dup_for_status_17 = 1'h0;
  end
  if (reset) begin
    s2_valid_dup_for_status_18 = 1'h0;
  end
  if (reset) begin
    s2_valid_dup_for_status_19 = 1'h0;
  end
  if (reset) begin
    s2_valid_dup_for_status_20 = 1'h0;
  end
  if (reset) begin
    s2_valid_dup_for_status_21 = 1'h0;
  end
  if (reset) begin
    s2_valid_dup_for_status_22 = 1'h0;
  end
  if (reset) begin
    s2_valid_dup_for_status_23 = 1'h0;
  end
  if (reset) begin
    s3_valid = 1'h0;
  end
  if (reset) begin
    s3_valid_dup_0 = 1'h0;
  end
  if (reset) begin
    s3_valid_dup_1 = 1'h0;
  end
  if (reset) begin
    s3_valid_dup_3 = 1'h0;
  end
  if (reset) begin
    s3_valid_dup_4 = 1'h0;
  end
  if (reset) begin
    s3_valid_dup_8 = 1'h0;
  end
  if (reset) begin
    s3_valid_dup_9 = 1'h0;
  end
  if (reset) begin
    s3_valid_dup_10 = 1'h0;
  end
  if (reset) begin
    s3_valid_dup_11 = 1'h0;
  end
  if (reset) begin
    s3_valid_dup_for_status_0 = 1'h0;
  end
  if (reset) begin
    s3_valid_dup_for_status_1 = 1'h0;
  end
  if (reset) begin
    s3_valid_dup_for_status_2 = 1'h0;
  end
  if (reset) begin
    s3_valid_dup_for_status_3 = 1'h0;
  end
  if (reset) begin
    s3_valid_dup_for_status_4 = 1'h0;
  end
  if (reset) begin
    s3_valid_dup_for_status_5 = 1'h0;
  end
  if (reset) begin
    s3_valid_dup_for_status_6 = 1'h0;
  end
  if (reset) begin
    s3_valid_dup_for_status_7 = 1'h0;
  end
  if (reset) begin
    s3_valid_dup_for_status_8 = 1'h0;
  end
  if (reset) begin
    s3_valid_dup_for_status_9 = 1'h0;
  end
  if (reset) begin
    s3_valid_dup_for_status_10 = 1'h0;
  end
  if (reset) begin
    s3_valid_dup_for_status_11 = 1'h0;
  end
  if (reset) begin
    s3_valid_dup_for_status_12 = 1'h0;
  end
  if (reset) begin
    s3_valid_dup_for_status_13 = 1'h0;
  end
  if (reset) begin
    s3_valid_dup_for_status_14 = 1'h0;
  end
  if (reset) begin
    s3_valid_dup_for_status_15 = 1'h0;
  end
  if (reset) begin
    s3_valid_dup_for_status_16 = 1'h0;
  end
  if (reset) begin
    s3_valid_dup_for_status_17 = 1'h0;
  end
  if (reset) begin
    s3_valid_dup_for_status_18 = 1'h0;
  end
  if (reset) begin
    s3_valid_dup_for_status_19 = 1'h0;
  end
  if (reset) begin
    s3_valid_dup_for_status_20 = 1'h0;
  end
  if (reset) begin
    s3_valid_dup_for_status_21 = 1'h0;
  end
  if (reset) begin
    s3_valid_dup_for_status_22 = 1'h0;
  end
  if (reset) begin
    s3_valid_dup_for_status_23 = 1'h0;
  end
  if (reset) begin
    lrsc_count_dup_1 = 6'h0;
  end
  if (reset) begin
    lrsc_count_dup_2 = 6'h0;
  end
  if (reset) begin
    lrsc_count = 6'h0;
  end
  if (reset) begin
    s3_s_amoalu = 1'h0;
  end
  if (reset) begin
    s3_valid_dup_for_meta_wvalid = 1'h0;
  end
  if (reset) begin
    s3_s_amoalu_dup_for_meta_wvalid = 1'h0;
  end
  if (reset) begin
    lrsc_count_dup_for_meta_wvalid = 6'h0;
  end
  if (reset) begin
    s3_valid_dup_for_err_wvalid = 1'h0;
  end
  if (reset) begin
    s3_s_amoalu_dup_for_err_wvalid = 1'h0;
  end
  if (reset) begin
    lrsc_count_dup_for_err_wvalid = 6'h0;
  end
  if (reset) begin
    s3_valid_dup_for_tag_wvalid = 1'h0;
  end
  if (reset) begin
    s3_s_amoalu_dup_for_tag_wvalid = 1'h0;
  end
  if (reset) begin
    lrsc_count_dup_for_tag_wvalid = 6'h0;
  end
  if (reset) begin
    s3_valid_dup_for_data_wvalid = 1'h0;
  end
  if (reset) begin
    s3_s_amoalu_dup_for_data_wvalid = 1'h0;
  end
  if (reset) begin
    lrsc_count_dup_for_data_wvalid = 6'h0;
  end
  if (reset) begin
    s3_valid_dup_for_data_wbank_0 = 1'h0;
  end
  if (reset) begin
    s3_valid_dup_for_data_wbank_1 = 1'h0;
  end
  if (reset) begin
    s3_valid_dup_for_data_wbank_2 = 1'h0;
  end
  if (reset) begin
    s3_valid_dup_for_data_wbank_3 = 1'h0;
  end
  if (reset) begin
    s3_valid_dup_for_data_wbank_4 = 1'h0;
  end
  if (reset) begin
    s3_valid_dup_for_data_wbank_5 = 1'h0;
  end
  if (reset) begin
    s3_valid_dup_for_data_wbank_6 = 1'h0;
  end
  if (reset) begin
    s3_valid_dup_for_data_wbank_7 = 1'h0;
  end
  if (reset) begin
    s3_s_amoalu_dup_for_data_wbank = 1'h0;
  end
  if (reset) begin
    lrsc_count_dup_for_data_wbank = 6'h0;
  end
  if (reset) begin
    s3_s_amoalu_dup_for_data_wbank_1 = 1'h0;
  end
  if (reset) begin
    lrsc_count_dup_for_data_wbank_1 = 6'h0;
  end
  if (reset) begin
    s3_s_amoalu_dup_for_data_wbank_2 = 1'h0;
  end
  if (reset) begin
    lrsc_count_dup_for_data_wbank_2 = 6'h0;
  end
  if (reset) begin
    s3_s_amoalu_dup_for_data_wbank_3 = 1'h0;
  end
  if (reset) begin
    lrsc_count_dup_for_data_wbank_3 = 6'h0;
  end
  if (reset) begin
    s3_s_amoalu_dup_for_data_wbank_4 = 1'h0;
  end
  if (reset) begin
    lrsc_count_dup_for_data_wbank_4 = 6'h0;
  end
  if (reset) begin
    s3_s_amoalu_dup_for_data_wbank_5 = 1'h0;
  end
  if (reset) begin
    lrsc_count_dup_for_data_wbank_5 = 6'h0;
  end
  if (reset) begin
    s3_s_amoalu_dup_for_data_wbank_6 = 1'h0;
  end
  if (reset) begin
    lrsc_count_dup_for_data_wbank_6 = 6'h0;
  end
  if (reset) begin
    s3_s_amoalu_dup_for_data_wbank_7 = 1'h0;
  end
  if (reset) begin
    lrsc_count_dup_for_data_wbank_7 = 6'h0;
  end
  if (reset) begin
    s3_valid_dup_for_wb_valid = 1'h0;
  end
  if (reset) begin
    s3_s_amoalu_dup_for_wb_valid = 1'h0;
  end
  if (reset) begin
    lrsc_count_dup_for_wb_valid = 6'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

