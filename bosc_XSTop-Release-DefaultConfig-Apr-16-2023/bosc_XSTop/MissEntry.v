module MissEntry(
  input          clock,
  input          reset,
  input  [1:0]   io_id,
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
  input  [511:0] io_req_data_store_data,
  input  [63:0]  io_req_data_store_mask,
  input          io_primary_valid,
  output         io_primary_ready,
  output         io_secondary_ready,
  output         io_secondary_reject,
  output         io_refill_to_ldq_valid,
  output [35:0]  io_refill_to_ldq_bits_addr,
  output [255:0] io_refill_to_ldq_bits_data,
  output         io_refill_to_ldq_bits_error,
  output [511:0] io_refill_to_ldq_bits_data_raw,
  output         io_refill_to_ldq_bits_hasdata,
  output         io_refill_to_ldq_bits_refill_done,
  output [1:0]   io_refill_to_ldq_bits_id,
  input          io_mem_acquire_ready,
  output         io_mem_acquire_valid,
  output [2:0]   io_mem_acquire_bits_param,
  output [3:0]   io_mem_acquire_bits_source,
  output [35:0]  io_mem_acquire_bits_address,
  output         io_mem_grant_ready,
  input          io_mem_grant_valid,
  input  [2:0]   io_mem_grant_bits_opcode,
  input  [1:0]   io_mem_grant_bits_param,
  input  [2:0]   io_mem_grant_bits_size,
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
  input          io_refill_pipe_resp,
  input          io_replace_pipe_req_ready,
  output         io_replace_pipe_req_valid,
  output [1:0]   io_replace_pipe_req_bits_miss_id,
  output [38:0]  io_replace_pipe_req_bits_vaddr,
  output [35:0]  io_replace_pipe_req_bits_addr,
  output [7:0]   io_replace_pipe_req_bits_replace_way_en,
  input          io_replace_pipe_resp,
  input          io_main_pipe_req_ready,
  output         io_main_pipe_req_valid,
  output [1:0]   io_main_pipe_req_bits_miss_id,
  output [1:0]   io_main_pipe_req_bits_miss_param,
  output         io_main_pipe_req_bits_miss_dirty,
  output [7:0]   io_main_pipe_req_bits_miss_way_en,
  output [3:0]   io_main_pipe_req_bits_source,
  output [4:0]   io_main_pipe_req_bits_cmd,
  output [38:0]  io_main_pipe_req_bits_vaddr,
  output [35:0]  io_main_pipe_req_bits_addr,
  output [511:0] io_main_pipe_req_bits_store_data,
  output [2:0]   io_main_pipe_req_bits_word_idx,
  output [63:0]  io_main_pipe_req_bits_amo_data,
  output [7:0]   io_main_pipe_req_bits_amo_mask,
  output         io_main_pipe_req_bits_error,
  output [3:0]   io_main_pipe_req_bits_id,
  input          io_main_pipe_resp,
  output         io_block_addr_valid,
  output [35:0]  io_block_addr_bits,
  output         io_req_handled_by_this_entry,
  output         io_forwardInfo_inflight,
  output [35:0]  io_forwardInfo_paddr,
  output [255:0] io_forwardInfo_raw_data_0,
  output [255:0] io_forwardInfo_raw_data_1,
  output         io_forwardInfo_firstbeat_valid,
  output         io_forwardInfo_lastbeat_valid
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [63:0] _RAND_11;
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
  reg [63:0] _RAND_29;
  reg [63:0] _RAND_30;
  reg [63:0] _RAND_31;
  reg [63:0] _RAND_32;
  reg [63:0] _RAND_33;
  reg [63:0] _RAND_34;
  reg [63:0] _RAND_35;
  reg [63:0] _RAND_36;
  reg [255:0] _RAND_37;
  reg [255:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [63:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] req_source; // @[MissQueue.scala 175:16]
  reg [4:0] req_cmd; // @[MissQueue.scala 175:16]
  reg [35:0] req_addr; // @[MissQueue.scala 175:16]
  reg [38:0] req_vaddr; // @[MissQueue.scala 175:16]
  reg [7:0] req_way_en; // @[MissQueue.scala 175:16]
  reg [2:0] req_word_idx; // @[MissQueue.scala 175:16]
  reg [63:0] req_amo_data; // @[MissQueue.scala 175:16]
  reg [7:0] req_amo_mask; // @[MissQueue.scala 175:16]
  reg [1:0] req_req_coh_state; // @[MissQueue.scala 175:16]
  reg [23:0] req_replace_tag; // @[MissQueue.scala 175:16]
  reg [3:0] req_id; // @[MissQueue.scala 175:16]
  reg [63:0] req_store_mask; // @[MissQueue.scala 176:27]
  reg  req_valid; // @[MissQueue.scala 177:26]
  wire [5:0] set = req_vaddr[11:6]; // @[DCacheWrapper.scala 191:9]
  wire  input_req_is_prefetch = io_req_bits_cmd == 5'h2 | io_req_bits_cmd == 5'h3; // @[CacheConstants.scala 55:45]
  reg  s_acquire; // @[MissQueue.scala 182:26]
  reg  s_grantack; // @[MissQueue.scala 183:27]
  reg  s_replace_req; // @[MissQueue.scala 184:30]
  reg  s_refill; // @[MissQueue.scala 185:25]
  reg  s_mainpipe_req; // @[MissQueue.scala 186:31]
  reg  s_write_storedata; // @[MissQueue.scala 187:34]
  reg  w_grantfirst; // @[MissQueue.scala 189:29]
  reg  w_grantlast; // @[MissQueue.scala 190:28]
  reg  w_replace_resp; // @[MissQueue.scala 191:31]
  reg  w_refill_resp; // @[MissQueue.scala 192:30]
  reg  w_mainpipe_resp; // @[MissQueue.scala 193:32]
  wire  mshr_penalty_sample = s_grantack & w_refill_resp & w_mainpipe_resp; // @[MissQueue.scala 195:51]
  wire  acquire_not_sent = ~s_acquire & ~io_mem_acquire_ready; // @[MissQueue.scala 197:37]
  wire  data_not_refilled = ~w_grantfirst; // @[MissQueue.scala 198:27]
  reg  error; // @[MissQueue.scala 200:22]
  reg  prefetch; // @[MissQueue.scala 201:25]
  reg  should_refill_data_reg; // @[MissQueue.scala 204:36]
  wire  _T_6 = io_mem_grant_ready & io_mem_grant_valid; // @[Decoupled.scala 50:35]
  wire [12:0] _beats1_decode_T_1 = 13'h3f << io_mem_grant_bits_size; // @[package.scala 234:77]
  wire [5:0] _beats1_decode_T_3 = ~_beats1_decode_T_1[5:0]; // @[package.scala 234:46]
  wire  beats1_decode = _beats1_decode_T_3[5]; // @[Edges.scala 219:59]
  wire  beats1_opdata = io_mem_grant_bits_opcode[0]; // @[Edges.scala 105:36]
  wire  beats1 = beats1_opdata & beats1_decode; // @[Edges.scala 220:14]
  reg  counter; // @[Edges.scala 228:27]
  wire  counter1 = counter - 1'h1; // @[Edges.scala 229:28]
  wire  first = ~counter; // @[Edges.scala 230:25]
  wire  last = counter | ~beats1; // @[Edges.scala 231:37]
  wire  refill_done = last & _T_6; // @[Edges.scala 232:22]
  wire  refill_count = beats1 & ~counter1; // @[Edges.scala 233:25]
  reg [1:0] grant_param; // @[MissQueue.scala 211:24]
  reg [63:0] refill_and_store_data_0; // @[MissQueue.scala 216:34]
  reg [63:0] refill_and_store_data_1; // @[MissQueue.scala 216:34]
  reg [63:0] refill_and_store_data_2; // @[MissQueue.scala 216:34]
  reg [63:0] refill_and_store_data_3; // @[MissQueue.scala 216:34]
  reg [63:0] refill_and_store_data_4; // @[MissQueue.scala 216:34]
  reg [63:0] refill_and_store_data_5; // @[MissQueue.scala 216:34]
  reg [63:0] refill_and_store_data_6; // @[MissQueue.scala 216:34]
  reg [63:0] refill_and_store_data_7; // @[MissQueue.scala 216:34]
  reg [255:0] refill_data_raw_0; // @[MissQueue.scala 218:28]
  reg [255:0] refill_data_raw_1; // @[MissQueue.scala 218:28]
  wire  _primary_fire_T_2 = ~io_req_bits_cancel; // @[MissQueue.scala 221:87]
  wire  primary_fire = io_req_valid & io_primary_ready & io_primary_valid & ~io_req_bits_cancel; // @[MissQueue.scala 221:84]
  wire  secondary_fire = io_req_valid & io_secondary_ready & _primary_fire_T_2; // @[MissQueue.scala 223:68]
  wire  _GEN_1 = mshr_penalty_sample & req_valid ? 1'h0 : req_valid; // @[MissQueue.scala 229:37 230:15 177:26]
  wire  _T_9 = ~s_write_storedata & req_valid; // @[MissQueue.scala 233:28]
  wire  _GEN_2 = ~s_write_storedata & req_valid | s_write_storedata; // @[MissQueue.scala 233:42 235:23 187:34]
  wire [35:0] _req_addr_T_1 = {io_req_bits_addr[35:6], 6'h0}; // @[L1Cache.scala 84:59]
  wire  _s_write_storedata_T = io_req_bits_source == 4'h1; // @[MissQueue.scala 70:28]
  wire  _T_14 = io_req_bits_source == 4'h2; // @[MissQueue.scala 71:26]
  wire  _T_15 = ~_T_14; // @[MissQueue.scala 253:11]
  wire  _GEN_3 = ~_T_14 ? 1'h0 : s_refill; // @[MissQueue.scala 253:35 254:16 185:25]
  wire  _GEN_4 = ~_T_14 ? 1'h0 : w_refill_resp; // @[MissQueue.scala 253:35 255:21 192:30]
  wire  _T_16 = io_req_bits_req_coh_state > 2'h0; // @[Metadata.scala 49:45]
  wire  _T_18 = io_req_bits_replace_coh_state > 2'h0; // @[Metadata.scala 49:45]
  wire  _GEN_5 = ~_T_16 & _T_18 & _T_15 ? 1'h0 : s_replace_req; // @[MissQueue.scala 258:92 259:21 184:30]
  wire  _GEN_6 = ~_T_16 & _T_18 & _T_15 ? 1'h0 : w_replace_resp; // @[MissQueue.scala 258:92 260:22 191:31]
  wire  _GEN_7 = _T_14 ? 1'h0 : s_mainpipe_req; // @[MissQueue.scala 263:34 264:22 186:31]
  wire  _GEN_8 = _T_14 ? 1'h0 : w_mainpipe_resp; // @[MissQueue.scala 263:34 265:23 193:32]
  wire  _should_refill_data_reg_T = io_req_bits_source == 4'h0; // @[MissQueue.scala 69:27]
  wire [3:0] _GEN_10 = primary_fire ? io_req_bits_source : req_source; // @[MissQueue.scala 175:16 239:23 241:9]
  wire [4:0] _GEN_11 = primary_fire ? io_req_bits_cmd : req_cmd; // @[MissQueue.scala 175:16 239:23 241:9]
  wire [35:0] _GEN_12 = primary_fire ? _req_addr_T_1 : req_addr; // @[MissQueue.scala 239:23 242:14 175:16]
  wire [38:0] _GEN_13 = primary_fire ? io_req_bits_vaddr : req_vaddr; // @[MissQueue.scala 175:16 239:23 241:9]
  wire [7:0] _GEN_14 = primary_fire ? io_req_bits_way_en : req_way_en; // @[MissQueue.scala 175:16 239:23 241:9]
  wire [2:0] _GEN_17 = primary_fire ? io_req_bits_word_idx : req_word_idx; // @[MissQueue.scala 175:16 239:23 241:9]
  wire [63:0] _GEN_18 = primary_fire ? io_req_bits_amo_data : req_amo_data; // @[MissQueue.scala 175:16 239:23 241:9]
  wire [7:0] _GEN_19 = primary_fire ? io_req_bits_amo_mask : req_amo_mask; // @[MissQueue.scala 175:16 239:23 241:9]
  wire [23:0] _GEN_22 = primary_fire ? io_req_bits_replace_tag : req_replace_tag; // @[MissQueue.scala 175:16 239:23 241:9]
  wire [3:0] _GEN_23 = primary_fire ? io_req_bits_id : req_id; // @[MissQueue.scala 175:16 239:23 241:9]
  wire  _GEN_25 = primary_fire ? 1'h0 : s_acquire; // @[MissQueue.scala 239:23 244:15 182:26]
  wire  _GEN_26 = primary_fire ? 1'h0 : s_grantack; // @[MissQueue.scala 239:23 245:16 183:27]
  wire  _GEN_27 = primary_fire ? 1'h0 : w_grantfirst; // @[MissQueue.scala 239:23 247:18 189:29]
  wire  _GEN_29 = primary_fire ? ~_s_write_storedata_T : _GEN_2; // @[MissQueue.scala 239:23 250:23]
  wire  _GEN_31 = primary_fire ? _GEN_3 : s_refill; // @[MissQueue.scala 239:23 185:25]
  wire  _GEN_32 = primary_fire ? _GEN_4 : w_refill_resp; // @[MissQueue.scala 239:23 192:30]
  wire  _GEN_33 = primary_fire ? _GEN_5 : s_replace_req; // @[MissQueue.scala 239:23 184:30]
  wire  _GEN_34 = primary_fire ? _GEN_6 : w_replace_resp; // @[MissQueue.scala 239:23 191:31]
  wire  _GEN_35 = primary_fire ? _GEN_7 : s_mainpipe_req; // @[MissQueue.scala 239:23 186:31]
  wire  _GEN_36 = primary_fire ? _GEN_8 : w_mainpipe_resp; // @[MissQueue.scala 239:23 193:32]
  wire  _T_40 = io_mem_acquire_ready & io_mem_acquire_valid; // @[Decoupled.scala 50:35]
  wire [63:0] _GEN_81 = _T_9 ? io_req_data_store_data[63:0] : refill_and_store_data_0; // @[MissQueue.scala 302:42 305:32 216:34]
  wire [63:0] _GEN_82 = _T_9 ? io_req_data_store_data[127:64] : refill_and_store_data_1; // @[MissQueue.scala 302:42 305:32 216:34]
  wire [63:0] _GEN_83 = _T_9 ? io_req_data_store_data[191:128] : refill_and_store_data_2; // @[MissQueue.scala 302:42 305:32 216:34]
  wire [63:0] _GEN_84 = _T_9 ? io_req_data_store_data[255:192] : refill_and_store_data_3; // @[MissQueue.scala 302:42 305:32 216:34]
  wire [63:0] _GEN_85 = _T_9 ? io_req_data_store_data[319:256] : refill_and_store_data_4; // @[MissQueue.scala 302:42 305:32 216:34]
  wire [63:0] _GEN_86 = _T_9 ? io_req_data_store_data[383:320] : refill_and_store_data_5; // @[MissQueue.scala 302:42 305:32 216:34]
  wire [63:0] _GEN_87 = _T_9 ? io_req_data_store_data[447:384] : refill_and_store_data_6; // @[MissQueue.scala 302:42 305:32 216:34]
  wire [63:0] _GEN_88 = _T_9 ? io_req_data_store_data[511:448] : refill_and_store_data_7; // @[MissQueue.scala 302:42 305:32 216:34]
  wire  _new_mask_0_T = req_source == 4'h1; // @[MissQueue.scala 70:28]
  wire [7:0] new_mask_0 = _new_mask_0_T ? req_store_mask[7:0] : 8'h0; // @[MissQueue.scala 321:23]
  wire [7:0] new_mask_1 = _new_mask_0_T ? req_store_mask[15:8] : 8'h0; // @[MissQueue.scala 321:23]
  wire [7:0] new_mask_2 = _new_mask_0_T ? req_store_mask[23:16] : 8'h0; // @[MissQueue.scala 321:23]
  wire [7:0] new_mask_3 = _new_mask_0_T ? req_store_mask[31:24] : 8'h0; // @[MissQueue.scala 321:23]
  wire [7:0] new_mask_4 = _new_mask_0_T ? req_store_mask[39:32] : 8'h0; // @[MissQueue.scala 321:23]
  wire [7:0] new_mask_5 = _new_mask_0_T ? req_store_mask[47:40] : 8'h0; // @[MissQueue.scala 321:23]
  wire [7:0] new_mask_6 = _new_mask_0_T ? req_store_mask[55:48] : 8'h0; // @[MissQueue.scala 321:23]
  wire [7:0] new_mask_7 = _new_mask_0_T ? req_store_mask[63:56] : 8'h0; // @[MissQueue.scala 321:23]
  reg  hasData; // @[MissQueue.scala 324:24]
  reg  isDirty; // @[MissQueue.scala 325:24]
  wire [2:0] _idx_T = {refill_count, 2'h0}; // @[MissQueue.scala 332:33]
  wire [3:0] _idx_T_1 = {{1'd0}, _idx_T}; // @[MissQueue.scala 332:57]
  wire [2:0] idx = _idx_T_1[2:0]; // @[MissQueue.scala 332:57]
  wire [63:0] grant_row = io_mem_grant_bits_data[63:0]; // @[MissQueue.scala 333:47]
  wire [7:0] _GEN_90 = 3'h1 == idx ? new_mask_1 : new_mask_0; // @[Bitwise.scala 27:{51,51}]
  wire [7:0] _GEN_91 = 3'h2 == idx ? new_mask_2 : _GEN_90; // @[Bitwise.scala 27:{51,51}]
  wire [7:0] _GEN_92 = 3'h3 == idx ? new_mask_3 : _GEN_91; // @[Bitwise.scala 27:{51,51}]
  wire [7:0] _GEN_93 = 3'h4 == idx ? new_mask_4 : _GEN_92; // @[Bitwise.scala 27:{51,51}]
  wire [7:0] _GEN_94 = 3'h5 == idx ? new_mask_5 : _GEN_93; // @[Bitwise.scala 27:{51,51}]
  wire [7:0] _GEN_95 = 3'h6 == idx ? new_mask_6 : _GEN_94; // @[Bitwise.scala 27:{51,51}]
  wire [7:0] _GEN_96 = 3'h7 == idx ? new_mask_7 : _GEN_95; // @[Bitwise.scala 27:{51,51}]
  wire [7:0] _refill_and_store_data_full_wmask_T_9 = _GEN_96[0] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _refill_and_store_data_full_wmask_T_11 = _GEN_96[1] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _refill_and_store_data_full_wmask_T_13 = _GEN_96[2] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _refill_and_store_data_full_wmask_T_15 = _GEN_96[3] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _refill_and_store_data_full_wmask_T_17 = _GEN_96[4] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _refill_and_store_data_full_wmask_T_19 = _GEN_96[5] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _refill_and_store_data_full_wmask_T_21 = _GEN_96[6] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _refill_and_store_data_full_wmask_T_23 = _GEN_96[7] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [63:0] refill_and_store_data_full_wmask = {_refill_and_store_data_full_wmask_T_23,
    _refill_and_store_data_full_wmask_T_21,_refill_and_store_data_full_wmask_T_19,_refill_and_store_data_full_wmask_T_17
    ,_refill_and_store_data_full_wmask_T_15,_refill_and_store_data_full_wmask_T_13,
    _refill_and_store_data_full_wmask_T_11,_refill_and_store_data_full_wmask_T_9}; // @[Cat.scala 31:58]
  wire [63:0] _refill_and_store_data_T = ~refill_and_store_data_full_wmask; // @[MissQueue.scala 315:6]
  wire [63:0] _refill_and_store_data_T_1 = _refill_and_store_data_T & grant_row; // @[MissQueue.scala 315:18]
  wire [63:0] _GEN_98 = 3'h1 == idx ? refill_and_store_data_1 : refill_and_store_data_0; // @[MissQueue.scala 315:{42,42}]
  wire [63:0] _GEN_99 = 3'h2 == idx ? refill_and_store_data_2 : _GEN_98; // @[MissQueue.scala 315:{42,42}]
  wire [63:0] _GEN_100 = 3'h3 == idx ? refill_and_store_data_3 : _GEN_99; // @[MissQueue.scala 315:{42,42}]
  wire [63:0] _GEN_101 = 3'h4 == idx ? refill_and_store_data_4 : _GEN_100; // @[MissQueue.scala 315:{42,42}]
  wire [63:0] _GEN_102 = 3'h5 == idx ? refill_and_store_data_5 : _GEN_101; // @[MissQueue.scala 315:{42,42}]
  wire [63:0] _GEN_103 = 3'h6 == idx ? refill_and_store_data_6 : _GEN_102; // @[MissQueue.scala 315:{42,42}]
  wire [63:0] _GEN_104 = 3'h7 == idx ? refill_and_store_data_7 : _GEN_103; // @[MissQueue.scala 315:{42,42}]
  wire [63:0] _refill_and_store_data_T_2 = refill_and_store_data_full_wmask & _GEN_104; // @[MissQueue.scala 315:42]
  wire [63:0] _refill_and_store_data_T_3 = _refill_and_store_data_T_1 | _refill_and_store_data_T_2; // @[MissQueue.scala 315:29]
  wire [63:0] _GEN_105 = 3'h0 == idx ? _refill_and_store_data_T_3 : _GEN_81; // @[MissQueue.scala 334:{36,36}]
  wire [63:0] _GEN_106 = 3'h1 == idx ? _refill_and_store_data_T_3 : _GEN_82; // @[MissQueue.scala 334:{36,36}]
  wire [63:0] _GEN_107 = 3'h2 == idx ? _refill_and_store_data_T_3 : _GEN_83; // @[MissQueue.scala 334:{36,36}]
  wire [63:0] _GEN_108 = 3'h3 == idx ? _refill_and_store_data_T_3 : _GEN_84; // @[MissQueue.scala 334:{36,36}]
  wire [63:0] _GEN_109 = 3'h4 == idx ? _refill_and_store_data_T_3 : _GEN_85; // @[MissQueue.scala 334:{36,36}]
  wire [63:0] _GEN_110 = 3'h5 == idx ? _refill_and_store_data_T_3 : _GEN_86; // @[MissQueue.scala 334:{36,36}]
  wire [63:0] _GEN_111 = 3'h6 == idx ? _refill_and_store_data_T_3 : _GEN_87; // @[MissQueue.scala 334:{36,36}]
  wire [63:0] _GEN_112 = 3'h7 == idx ? _refill_and_store_data_T_3 : _GEN_88; // @[MissQueue.scala 334:{36,36}]
  wire [2:0] idx_1 = _idx_T + 3'h1; // @[MissQueue.scala 332:57]
  wire [63:0] grant_row_1 = io_mem_grant_bits_data[127:64]; // @[MissQueue.scala 333:47]
  wire [7:0] _GEN_114 = 3'h1 == idx_1 ? new_mask_1 : new_mask_0; // @[Bitwise.scala 27:{51,51}]
  wire [7:0] _GEN_115 = 3'h2 == idx_1 ? new_mask_2 : _GEN_114; // @[Bitwise.scala 27:{51,51}]
  wire [7:0] _GEN_116 = 3'h3 == idx_1 ? new_mask_3 : _GEN_115; // @[Bitwise.scala 27:{51,51}]
  wire [7:0] _GEN_117 = 3'h4 == idx_1 ? new_mask_4 : _GEN_116; // @[Bitwise.scala 27:{51,51}]
  wire [7:0] _GEN_118 = 3'h5 == idx_1 ? new_mask_5 : _GEN_117; // @[Bitwise.scala 27:{51,51}]
  wire [7:0] _GEN_119 = 3'h6 == idx_1 ? new_mask_6 : _GEN_118; // @[Bitwise.scala 27:{51,51}]
  wire [7:0] _GEN_120 = 3'h7 == idx_1 ? new_mask_7 : _GEN_119; // @[Bitwise.scala 27:{51,51}]
  wire [7:0] _refill_and_store_data_full_wmask_T_33 = _GEN_120[0] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _refill_and_store_data_full_wmask_T_35 = _GEN_120[1] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _refill_and_store_data_full_wmask_T_37 = _GEN_120[2] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _refill_and_store_data_full_wmask_T_39 = _GEN_120[3] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _refill_and_store_data_full_wmask_T_41 = _GEN_120[4] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _refill_and_store_data_full_wmask_T_43 = _GEN_120[5] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _refill_and_store_data_full_wmask_T_45 = _GEN_120[6] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _refill_and_store_data_full_wmask_T_47 = _GEN_120[7] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [63:0] refill_and_store_data_full_wmask_1 = {_refill_and_store_data_full_wmask_T_47,
    _refill_and_store_data_full_wmask_T_45,_refill_and_store_data_full_wmask_T_43,_refill_and_store_data_full_wmask_T_41
    ,_refill_and_store_data_full_wmask_T_39,_refill_and_store_data_full_wmask_T_37,
    _refill_and_store_data_full_wmask_T_35,_refill_and_store_data_full_wmask_T_33}; // @[Cat.scala 31:58]
  wire [63:0] _refill_and_store_data_T_4 = ~refill_and_store_data_full_wmask_1; // @[MissQueue.scala 315:6]
  wire [63:0] _refill_and_store_data_T_5 = _refill_and_store_data_T_4 & grant_row_1; // @[MissQueue.scala 315:18]
  wire [63:0] _GEN_122 = 3'h1 == idx_1 ? refill_and_store_data_1 : refill_and_store_data_0; // @[MissQueue.scala 315:{42,42}]
  wire [63:0] _GEN_123 = 3'h2 == idx_1 ? refill_and_store_data_2 : _GEN_122; // @[MissQueue.scala 315:{42,42}]
  wire [63:0] _GEN_124 = 3'h3 == idx_1 ? refill_and_store_data_3 : _GEN_123; // @[MissQueue.scala 315:{42,42}]
  wire [63:0] _GEN_125 = 3'h4 == idx_1 ? refill_and_store_data_4 : _GEN_124; // @[MissQueue.scala 315:{42,42}]
  wire [63:0] _GEN_126 = 3'h5 == idx_1 ? refill_and_store_data_5 : _GEN_125; // @[MissQueue.scala 315:{42,42}]
  wire [63:0] _GEN_127 = 3'h6 == idx_1 ? refill_and_store_data_6 : _GEN_126; // @[MissQueue.scala 315:{42,42}]
  wire [63:0] _GEN_128 = 3'h7 == idx_1 ? refill_and_store_data_7 : _GEN_127; // @[MissQueue.scala 315:{42,42}]
  wire [63:0] _refill_and_store_data_T_6 = refill_and_store_data_full_wmask_1 & _GEN_128; // @[MissQueue.scala 315:42]
  wire [63:0] _refill_and_store_data_T_7 = _refill_and_store_data_T_5 | _refill_and_store_data_T_6; // @[MissQueue.scala 315:29]
  wire [63:0] _GEN_129 = 3'h0 == idx_1 ? _refill_and_store_data_T_7 : _GEN_105; // @[MissQueue.scala 334:{36,36}]
  wire [63:0] _GEN_130 = 3'h1 == idx_1 ? _refill_and_store_data_T_7 : _GEN_106; // @[MissQueue.scala 334:{36,36}]
  wire [63:0] _GEN_131 = 3'h2 == idx_1 ? _refill_and_store_data_T_7 : _GEN_107; // @[MissQueue.scala 334:{36,36}]
  wire [63:0] _GEN_132 = 3'h3 == idx_1 ? _refill_and_store_data_T_7 : _GEN_108; // @[MissQueue.scala 334:{36,36}]
  wire [63:0] _GEN_133 = 3'h4 == idx_1 ? _refill_and_store_data_T_7 : _GEN_109; // @[MissQueue.scala 334:{36,36}]
  wire [63:0] _GEN_134 = 3'h5 == idx_1 ? _refill_and_store_data_T_7 : _GEN_110; // @[MissQueue.scala 334:{36,36}]
  wire [63:0] _GEN_135 = 3'h6 == idx_1 ? _refill_and_store_data_T_7 : _GEN_111; // @[MissQueue.scala 334:{36,36}]
  wire [63:0] _GEN_136 = 3'h7 == idx_1 ? _refill_and_store_data_T_7 : _GEN_112; // @[MissQueue.scala 334:{36,36}]
  wire [2:0] idx_2 = _idx_T + 3'h2; // @[MissQueue.scala 332:57]
  wire [63:0] grant_row_2 = io_mem_grant_bits_data[191:128]; // @[MissQueue.scala 333:47]
  wire [7:0] _GEN_138 = 3'h1 == idx_2 ? new_mask_1 : new_mask_0; // @[Bitwise.scala 27:{51,51}]
  wire [7:0] _GEN_139 = 3'h2 == idx_2 ? new_mask_2 : _GEN_138; // @[Bitwise.scala 27:{51,51}]
  wire [7:0] _GEN_140 = 3'h3 == idx_2 ? new_mask_3 : _GEN_139; // @[Bitwise.scala 27:{51,51}]
  wire [7:0] _GEN_141 = 3'h4 == idx_2 ? new_mask_4 : _GEN_140; // @[Bitwise.scala 27:{51,51}]
  wire [7:0] _GEN_142 = 3'h5 == idx_2 ? new_mask_5 : _GEN_141; // @[Bitwise.scala 27:{51,51}]
  wire [7:0] _GEN_143 = 3'h6 == idx_2 ? new_mask_6 : _GEN_142; // @[Bitwise.scala 27:{51,51}]
  wire [7:0] _GEN_144 = 3'h7 == idx_2 ? new_mask_7 : _GEN_143; // @[Bitwise.scala 27:{51,51}]
  wire [7:0] _refill_and_store_data_full_wmask_T_57 = _GEN_144[0] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _refill_and_store_data_full_wmask_T_59 = _GEN_144[1] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _refill_and_store_data_full_wmask_T_61 = _GEN_144[2] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _refill_and_store_data_full_wmask_T_63 = _GEN_144[3] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _refill_and_store_data_full_wmask_T_65 = _GEN_144[4] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _refill_and_store_data_full_wmask_T_67 = _GEN_144[5] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _refill_and_store_data_full_wmask_T_69 = _GEN_144[6] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _refill_and_store_data_full_wmask_T_71 = _GEN_144[7] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [63:0] refill_and_store_data_full_wmask_2 = {_refill_and_store_data_full_wmask_T_71,
    _refill_and_store_data_full_wmask_T_69,_refill_and_store_data_full_wmask_T_67,_refill_and_store_data_full_wmask_T_65
    ,_refill_and_store_data_full_wmask_T_63,_refill_and_store_data_full_wmask_T_61,
    _refill_and_store_data_full_wmask_T_59,_refill_and_store_data_full_wmask_T_57}; // @[Cat.scala 31:58]
  wire [63:0] _refill_and_store_data_T_8 = ~refill_and_store_data_full_wmask_2; // @[MissQueue.scala 315:6]
  wire [63:0] _refill_and_store_data_T_9 = _refill_and_store_data_T_8 & grant_row_2; // @[MissQueue.scala 315:18]
  wire [63:0] _GEN_146 = 3'h1 == idx_2 ? refill_and_store_data_1 : refill_and_store_data_0; // @[MissQueue.scala 315:{42,42}]
  wire [63:0] _GEN_147 = 3'h2 == idx_2 ? refill_and_store_data_2 : _GEN_146; // @[MissQueue.scala 315:{42,42}]
  wire [63:0] _GEN_148 = 3'h3 == idx_2 ? refill_and_store_data_3 : _GEN_147; // @[MissQueue.scala 315:{42,42}]
  wire [63:0] _GEN_149 = 3'h4 == idx_2 ? refill_and_store_data_4 : _GEN_148; // @[MissQueue.scala 315:{42,42}]
  wire [63:0] _GEN_150 = 3'h5 == idx_2 ? refill_and_store_data_5 : _GEN_149; // @[MissQueue.scala 315:{42,42}]
  wire [63:0] _GEN_151 = 3'h6 == idx_2 ? refill_and_store_data_6 : _GEN_150; // @[MissQueue.scala 315:{42,42}]
  wire [63:0] _GEN_152 = 3'h7 == idx_2 ? refill_and_store_data_7 : _GEN_151; // @[MissQueue.scala 315:{42,42}]
  wire [63:0] _refill_and_store_data_T_10 = refill_and_store_data_full_wmask_2 & _GEN_152; // @[MissQueue.scala 315:42]
  wire [63:0] _refill_and_store_data_T_11 = _refill_and_store_data_T_9 | _refill_and_store_data_T_10; // @[MissQueue.scala 315:29]
  wire [2:0] idx_3 = _idx_T + 3'h3; // @[MissQueue.scala 332:57]
  wire [63:0] grant_row_3 = io_mem_grant_bits_data[255:192]; // @[MissQueue.scala 333:47]
  wire [7:0] _GEN_162 = 3'h1 == idx_3 ? new_mask_1 : new_mask_0; // @[Bitwise.scala 27:{51,51}]
  wire [7:0] _GEN_163 = 3'h2 == idx_3 ? new_mask_2 : _GEN_162; // @[Bitwise.scala 27:{51,51}]
  wire [7:0] _GEN_164 = 3'h3 == idx_3 ? new_mask_3 : _GEN_163; // @[Bitwise.scala 27:{51,51}]
  wire [7:0] _GEN_165 = 3'h4 == idx_3 ? new_mask_4 : _GEN_164; // @[Bitwise.scala 27:{51,51}]
  wire [7:0] _GEN_166 = 3'h5 == idx_3 ? new_mask_5 : _GEN_165; // @[Bitwise.scala 27:{51,51}]
  wire [7:0] _GEN_167 = 3'h6 == idx_3 ? new_mask_6 : _GEN_166; // @[Bitwise.scala 27:{51,51}]
  wire [7:0] _GEN_168 = 3'h7 == idx_3 ? new_mask_7 : _GEN_167; // @[Bitwise.scala 27:{51,51}]
  wire [7:0] _refill_and_store_data_full_wmask_T_81 = _GEN_168[0] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _refill_and_store_data_full_wmask_T_83 = _GEN_168[1] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _refill_and_store_data_full_wmask_T_85 = _GEN_168[2] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _refill_and_store_data_full_wmask_T_87 = _GEN_168[3] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _refill_and_store_data_full_wmask_T_89 = _GEN_168[4] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _refill_and_store_data_full_wmask_T_91 = _GEN_168[5] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _refill_and_store_data_full_wmask_T_93 = _GEN_168[6] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _refill_and_store_data_full_wmask_T_95 = _GEN_168[7] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [63:0] refill_and_store_data_full_wmask_3 = {_refill_and_store_data_full_wmask_T_95,
    _refill_and_store_data_full_wmask_T_93,_refill_and_store_data_full_wmask_T_91,_refill_and_store_data_full_wmask_T_89
    ,_refill_and_store_data_full_wmask_T_87,_refill_and_store_data_full_wmask_T_85,
    _refill_and_store_data_full_wmask_T_83,_refill_and_store_data_full_wmask_T_81}; // @[Cat.scala 31:58]
  wire [63:0] _refill_and_store_data_T_12 = ~refill_and_store_data_full_wmask_3; // @[MissQueue.scala 315:6]
  wire [63:0] _refill_and_store_data_T_13 = _refill_and_store_data_T_12 & grant_row_3; // @[MissQueue.scala 315:18]
  wire [63:0] _GEN_170 = 3'h1 == idx_3 ? refill_and_store_data_1 : refill_and_store_data_0; // @[MissQueue.scala 315:{42,42}]
  wire [63:0] _GEN_171 = 3'h2 == idx_3 ? refill_and_store_data_2 : _GEN_170; // @[MissQueue.scala 315:{42,42}]
  wire [63:0] _GEN_172 = 3'h3 == idx_3 ? refill_and_store_data_3 : _GEN_171; // @[MissQueue.scala 315:{42,42}]
  wire [63:0] _GEN_173 = 3'h4 == idx_3 ? refill_and_store_data_4 : _GEN_172; // @[MissQueue.scala 315:{42,42}]
  wire [63:0] _GEN_174 = 3'h5 == idx_3 ? refill_and_store_data_5 : _GEN_173; // @[MissQueue.scala 315:{42,42}]
  wire [63:0] _GEN_175 = 3'h6 == idx_3 ? refill_and_store_data_6 : _GEN_174; // @[MissQueue.scala 315:{42,42}]
  wire [63:0] _GEN_176 = 3'h7 == idx_3 ? refill_and_store_data_7 : _GEN_175; // @[MissQueue.scala 315:{42,42}]
  wire [63:0] _refill_and_store_data_T_14 = refill_and_store_data_full_wmask_3 & _GEN_176; // @[MissQueue.scala 315:42]
  wire [63:0] _refill_and_store_data_T_15 = _refill_and_store_data_T_13 | _refill_and_store_data_T_14; // @[MissQueue.scala 315:29]
  wire  _T_47 = io_mem_finish_ready & io_mem_finish_valid; // @[Decoupled.scala 50:35]
  wire  _T_48 = io_replace_pipe_req_ready & io_replace_pipe_req_valid; // @[Decoupled.scala 50:35]
  wire  _T_49 = io_refill_pipe_req_ready & io_refill_pipe_req_valid; // @[Decoupled.scala 50:35]
  wire  _T_50 = io_main_pipe_req_ready & io_main_pipe_req_valid; // @[Decoupled.scala 50:35]
  wire  io_secondary_ready_block_match = req_addr[35:6] == io_req_bits_addr[35:6]; // @[MissQueue.scala 393:43]
  wire  _io_secondary_ready_T = req_source == 4'h0; // @[MissQueue.scala 69:27]
  wire  _io_secondary_ready_T_1 = req_source >= 4'h3; // @[MissQueue.scala 72:31]
  wire  _io_secondary_ready_T_7 = acquire_not_sent & (_io_secondary_ready_T | _io_secondary_ready_T_1) & (
    _should_refill_data_reg_T | _s_write_storedata_T); // @[MissQueue.scala 383:64]
  wire  _io_secondary_ready_T_15 = data_not_refilled & (_io_secondary_ready_T | _new_mask_0_T | _io_secondary_ready_T_1)
     & _should_refill_data_reg_T; // @[MissQueue.scala 387:84]
  wire  _io_secondary_ready_T_16 = _io_secondary_ready_T_7 | _io_secondary_ready_T_15; // @[MissQueue.scala 396:42]
  wire  io_secondary_reject_set_match = set == io_req_bits_vaddr[11:6]; // @[MissQueue.scala 409:25]
  wire  _io_secondary_reject_T_17 = ~_io_secondary_ready_T_15; // @[MissQueue.scala 415:11]
  wire  _io_secondary_reject_T_18 = ~_io_secondary_ready_T_7 & _io_secondary_reject_T_17; // @[MissQueue.scala 414:45]
  wire  _io_secondary_reject_T_20 = io_secondary_reject_set_match & io_req_bits_way_en == req_way_en; // @[MissQueue.scala 416:19]
  wire  _io_secondary_reject_T_21 = io_secondary_ready_block_match ? _io_secondary_reject_T_18 :
    _io_secondary_reject_T_20; // @[MissQueue.scala 412:10]
  wire [255:0] refill_data_splited_data_lo = {refill_and_store_data_3,refill_and_store_data_2,refill_and_store_data_1,
    refill_and_store_data_0}; // @[MissQueue.scala 428:38]
  wire [255:0] refill_data_splited_data_hi = {refill_and_store_data_7,refill_and_store_data_6,refill_and_store_data_5,
    refill_and_store_data_4}; // @[MissQueue.scala 428:38]
  wire [511:0] refill_data_splited_data = {refill_and_store_data_7,refill_and_store_data_6,refill_and_store_data_5,
    refill_and_store_data_4,refill_and_store_data_3,refill_and_store_data_2,refill_and_store_data_1,
    refill_and_store_data_0}; // @[MissQueue.scala 428:38]
  wire [255:0] refill_data_splited_0 = refill_data_splited_data[255:0]; // @[MissQueue.scala 429:9]
  wire [255:0] refill_data_splited_1 = refill_data_splited_data[511:256]; // @[MissQueue.scala 429:9]
  wire  _io_refill_to_ldq_valid_T = ~w_grantlast; // @[MissQueue.scala 432:37]
  reg  io_refill_to_ldq_valid_REG; // @[MissQueue.scala 432:36]
  wire [5:0] _io_refill_to_ldq_bits_addr_T = {refill_count, 5'h0}; // @[MissQueue.scala 433:66]
  wire [35:0] _GEN_230 = {{30'd0}, _io_refill_to_ldq_bits_addr_T}; // @[MissQueue.scala 433:50]
  reg [35:0] io_refill_to_ldq_bits_addr_REG; // @[MissQueue.scala 433:40]
  reg  io_refill_to_ldq_bits_data_REG; // @[MissQueue.scala 434:60]
  reg  io_refill_to_ldq_bits_error_REG; // @[MissQueue.scala 435:41]
  reg  io_refill_to_ldq_bits_refill_done_REG; // @[MissQueue.scala 436:47]
  wire  _grow_param_c_cat_T_5 = req_cmd == 5'h4; // @[package.scala 15:47]
  wire  _grow_param_c_cat_T_6 = req_cmd == 5'h9; // @[package.scala 15:47]
  wire  _grow_param_c_cat_T_7 = req_cmd == 5'ha; // @[package.scala 15:47]
  wire  _grow_param_c_cat_T_8 = req_cmd == 5'hb; // @[package.scala 15:47]
  wire  _grow_param_c_cat_T_11 = _grow_param_c_cat_T_5 | _grow_param_c_cat_T_6 | _grow_param_c_cat_T_7 |
    _grow_param_c_cat_T_8; // @[package.scala 72:59]
  wire  _grow_param_c_cat_T_12 = req_cmd == 5'h8; // @[package.scala 15:47]
  wire  _grow_param_c_cat_T_13 = req_cmd == 5'hc; // @[package.scala 15:47]
  wire  _grow_param_c_cat_T_14 = req_cmd == 5'hd; // @[package.scala 15:47]
  wire  _grow_param_c_cat_T_15 = req_cmd == 5'he; // @[package.scala 15:47]
  wire  _grow_param_c_cat_T_16 = req_cmd == 5'hf; // @[package.scala 15:47]
  wire  _grow_param_c_cat_T_20 = _grow_param_c_cat_T_12 | _grow_param_c_cat_T_13 | _grow_param_c_cat_T_14 |
    _grow_param_c_cat_T_15 | _grow_param_c_cat_T_16; // @[package.scala 72:59]
  wire  _grow_param_c_cat_T_21 = _grow_param_c_cat_T_11 | _grow_param_c_cat_T_20; // @[Consts.scala 82:44]
  wire  _grow_param_c_cat_T_22 = req_cmd == 5'h1 | req_cmd == 5'h11 | req_cmd == 5'h7 | _grow_param_c_cat_T_21; // @[Consts.scala 85:76]
  wire  _grow_param_c_cat_T_49 = _grow_param_c_cat_T_22 | req_cmd == 5'h3 | req_cmd == 5'h6; // @[Consts.scala 86:64]
  wire [3:0] _grow_param_T = {_grow_param_c_cat_T_22,_grow_param_c_cat_T_49,req_req_coh_state}; // @[Cat.scala 31:58]
  wire  _grow_param_T_25 = 4'hc == _grow_param_T; // @[Misc.scala 48:20]
  wire [1:0] _grow_param_T_27 = _grow_param_T_25 ? 2'h1 : 2'h0; // @[Misc.scala 34:36]
  wire  _grow_param_T_28 = 4'hd == _grow_param_T; // @[Misc.scala 48:20]
  wire [1:0] _grow_param_T_30 = _grow_param_T_28 ? 2'h2 : _grow_param_T_27; // @[Misc.scala 34:36]
  wire  _grow_param_T_31 = 4'h4 == _grow_param_T; // @[Misc.scala 48:20]
  wire [1:0] _grow_param_T_33 = _grow_param_T_31 ? 2'h1 : _grow_param_T_30; // @[Misc.scala 34:36]
  wire  _grow_param_T_34 = 4'h5 == _grow_param_T; // @[Misc.scala 48:20]
  wire [1:0] _grow_param_T_36 = _grow_param_T_34 ? 2'h2 : _grow_param_T_33; // @[Misc.scala 34:36]
  wire  _grow_param_T_37 = 4'h0 == _grow_param_T; // @[Misc.scala 48:20]
  wire [1:0] _grow_param_T_39 = _grow_param_T_37 ? 2'h0 : _grow_param_T_36; // @[Misc.scala 34:36]
  wire  _grow_param_T_40 = 4'he == _grow_param_T; // @[Misc.scala 48:20]
  wire [1:0] _grow_param_T_42 = _grow_param_T_40 ? 2'h3 : _grow_param_T_39; // @[Misc.scala 34:36]
  wire  _grow_param_T_43 = 4'hf == _grow_param_T; // @[Misc.scala 48:20]
  wire [1:0] _grow_param_T_45 = _grow_param_T_43 ? 2'h3 : _grow_param_T_42; // @[Misc.scala 34:36]
  wire  _grow_param_T_46 = 4'h6 == _grow_param_T; // @[Misc.scala 48:20]
  wire [1:0] _grow_param_T_48 = _grow_param_T_46 ? 2'h2 : _grow_param_T_45; // @[Misc.scala 34:36]
  wire  _grow_param_T_49 = 4'h7 == _grow_param_T; // @[Misc.scala 48:20]
  wire [1:0] _grow_param_T_51 = _grow_param_T_49 ? 2'h3 : _grow_param_T_48; // @[Misc.scala 34:36]
  wire  _grow_param_T_52 = 4'h1 == _grow_param_T; // @[Misc.scala 48:20]
  wire [1:0] _grow_param_T_54 = _grow_param_T_52 ? 2'h1 : _grow_param_T_51; // @[Misc.scala 34:36]
  wire  _grow_param_T_55 = 4'h2 == _grow_param_T; // @[Misc.scala 48:20]
  wire [1:0] _grow_param_T_57 = _grow_param_T_55 ? 2'h2 : _grow_param_T_54; // @[Misc.scala 34:36]
  wire  _grow_param_T_58 = 4'h3 == _grow_param_T; // @[Misc.scala 48:20]
  wire [1:0] grow_param = _grow_param_T_58 ? 2'h3 : _grow_param_T_57; // @[Misc.scala 34:36]
  reg [3:0] grantack_sink; // @[Reg.scala 16:16]
  wire  _io_refill_pipe_req_bits_wmask_T_1 = hasData | _io_secondary_ready_T; // @[MissQueue.scala 493:13]
  wire [7:0] _io_refill_pipe_req_bits_wmask_T_19 = {|req_store_mask[63:56],|req_store_mask[55:48],|req_store_mask[47:40]
    ,|req_store_mask[39:32],|req_store_mask[31:24],|req_store_mask[23:16],|req_store_mask[15:8],|req_store_mask[7:0]}; // @[MissQueue.scala 495:86]
  wire [4:0] _io_refill_pipe_req_bits_meta_coh_T = {_grow_param_c_cat_T_22,_grow_param_c_cat_T_49,grant_param,isDirty}; // @[Cat.scala 31:58]
  wire [1:0] _io_refill_pipe_req_bits_meta_coh_T_18 = 5'h2 == _io_refill_pipe_req_bits_meta_coh_T ? 2'h1 : 2'h0; // @[Mux.scala 81:58]
  wire [1:0] _io_refill_pipe_req_bits_meta_coh_T_20 = 5'h3 == _io_refill_pipe_req_bits_meta_coh_T ? 2'h1 :
    _io_refill_pipe_req_bits_meta_coh_T_18; // @[Mux.scala 81:58]
  wire [1:0] _io_refill_pipe_req_bits_meta_coh_T_22 = 5'h0 == _io_refill_pipe_req_bits_meta_coh_T ? 2'h2 :
    _io_refill_pipe_req_bits_meta_coh_T_20; // @[Mux.scala 81:58]
  wire [1:0] _io_refill_pipe_req_bits_meta_coh_T_24 = 5'h1 == _io_refill_pipe_req_bits_meta_coh_T ? 2'h3 :
    _io_refill_pipe_req_bits_meta_coh_T_22; // @[Mux.scala 81:58]
  wire [1:0] _io_refill_pipe_req_bits_meta_coh_T_26 = 5'h8 == _io_refill_pipe_req_bits_meta_coh_T ? 2'h2 :
    _io_refill_pipe_req_bits_meta_coh_T_24; // @[Mux.scala 81:58]
  wire [1:0] _io_refill_pipe_req_bits_meta_coh_T_28 = 5'h9 == _io_refill_pipe_req_bits_meta_coh_T ? 2'h3 :
    _io_refill_pipe_req_bits_meta_coh_T_26; // @[Mux.scala 81:58]
  wire [1:0] _io_refill_pipe_req_bits_meta_coh_T_30 = 5'h18 == _io_refill_pipe_req_bits_meta_coh_T ? 2'h3 :
    _io_refill_pipe_req_bits_meta_coh_T_28; // @[Mux.scala 81:58]
  assign io_primary_ready = ~req_valid; // @[MissQueue.scala 420:23]
  assign io_secondary_ready = io_secondary_ready_block_match & _io_secondary_ready_T_16; // @[MissQueue.scala 394:17]
  assign io_secondary_reject = req_valid & _io_secondary_reject_T_21; // @[MissQueue.scala 411:15]
  assign io_refill_to_ldq_valid = io_refill_to_ldq_valid_REG & should_refill_data_reg; // @[MissQueue.scala 432:74]
  assign io_refill_to_ldq_bits_addr = io_refill_to_ldq_bits_addr_REG; // @[MissQueue.scala 433:30]
  assign io_refill_to_ldq_bits_data = io_refill_to_ldq_bits_data_REG ? refill_data_splited_1 : refill_data_splited_0; // @[MissQueue.scala 434:{30,30}]
  assign io_refill_to_ldq_bits_error = io_refill_to_ldq_bits_error_REG; // @[MissQueue.scala 435:31]
  assign io_refill_to_ldq_bits_data_raw = {refill_data_raw_1,refill_data_raw_0}; // @[MissQueue.scala 438:53]
  assign io_refill_to_ldq_bits_hasdata = hasData; // @[MissQueue.scala 437:33]
  assign io_refill_to_ldq_bits_refill_done = io_refill_to_ldq_bits_refill_done_REG; // @[MissQueue.scala 436:37]
  assign io_refill_to_ldq_bits_id = io_id; // @[MissQueue.scala 439:28]
  assign io_mem_acquire_valid = ~s_acquire; // @[MissQueue.scala 441:27]
  assign io_mem_acquire_bits_param = {{1'd0}, grow_param}; // @[Edges.scala 345:17 347:15]
  assign io_mem_acquire_bits_source = {{2'd0}, io_id}; // @[Edges.scala 345:17 349:15]
  assign io_mem_acquire_bits_address = req_addr; // @[MissQueue.scala 455:29]
  assign io_mem_grant_ready = _io_refill_to_ldq_valid_T & s_acquire; // @[MissQueue.scala 464:38]
  assign io_mem_finish_valid = ~s_grantack & w_grantfirst; // @[MissQueue.scala 468:38]
  assign io_mem_finish_bits_sink = grantack_sink; // @[MissQueue.scala 469:22]
  assign io_refill_pipe_req_valid = ~s_refill & w_replace_resp & w_grantlast; // @[MissQueue.scala 487:59]
  assign io_refill_pipe_req_bits_source = req_source; // @[MissQueue.scala 489:17]
  assign io_refill_pipe_req_bits_addr = req_addr; // @[MissQueue.scala 490:15]
  assign io_refill_pipe_req_bits_way_en = req_way_en; // @[MissQueue.scala 491:17]
  assign io_refill_pipe_req_bits_alias = req_vaddr[13:12]; // @[MissQueue.scala 517:28]
  assign io_refill_pipe_req_bits_miss_id = io_id; // @[MissQueue.scala 498:18]
  assign io_refill_pipe_req_bits_id = req_id; // @[MissQueue.scala 499:13]
  assign io_refill_pipe_req_bits_error = error; // @[MissQueue.scala 514:16]
  assign io_refill_pipe_req_bits_prefetch = prefetch; // @[MissQueue.scala 515:19]
  assign io_refill_pipe_req_bits_wmask = _io_refill_pipe_req_bits_wmask_T_1 ? 8'hff :
    _io_refill_pipe_req_bits_wmask_T_19; // @[MissQueue.scala 492:22]
  assign io_refill_pipe_req_bits_data_0 = refill_data_splited_data[63:0]; // @[MissQueue.scala 497:48]
  assign io_refill_pipe_req_bits_data_1 = refill_data_splited_data[127:64]; // @[MissQueue.scala 497:48]
  assign io_refill_pipe_req_bits_data_2 = refill_data_splited_data[191:128]; // @[MissQueue.scala 497:48]
  assign io_refill_pipe_req_bits_data_3 = refill_data_splited_data[255:192]; // @[MissQueue.scala 497:48]
  assign io_refill_pipe_req_bits_data_4 = refill_data_splited_data[319:256]; // @[MissQueue.scala 497:48]
  assign io_refill_pipe_req_bits_data_5 = refill_data_splited_data[383:320]; // @[MissQueue.scala 497:48]
  assign io_refill_pipe_req_bits_data_6 = refill_data_splited_data[447:384]; // @[MissQueue.scala 497:48]
  assign io_refill_pipe_req_bits_data_7 = refill_data_splited_data[511:448]; // @[MissQueue.scala 497:48]
  assign io_refill_pipe_req_bits_meta_coh_state = 5'h19 == _io_refill_pipe_req_bits_meta_coh_T ? 2'h3 :
    _io_refill_pipe_req_bits_meta_coh_T_30; // @[Mux.scala 81:58]
  assign io_replace_pipe_req_valid = ~s_replace_req; // @[MissQueue.scala 471:32]
  assign io_replace_pipe_req_bits_miss_id = io_id; // @[MissQueue.scala 475:19]
  assign io_replace_pipe_req_bits_vaddr = req_vaddr; // @[MissQueue.scala 480:17]
  assign io_replace_pipe_req_bits_addr = {req_replace_tag,12'h0}; // @[Cat.scala 31:58]
  assign io_replace_pipe_req_bits_replace_way_en = req_way_en; // @[MissQueue.scala 484:26]
  assign io_main_pipe_req_valid = ~s_mainpipe_req & w_grantlast; // @[MissQueue.scala 519:45]
  assign io_main_pipe_req_bits_miss_id = io_id; // @[MissQueue.scala 522:33]
  assign io_main_pipe_req_bits_miss_param = grant_param; // @[MissQueue.scala 523:36]
  assign io_main_pipe_req_bits_miss_dirty = isDirty; // @[MissQueue.scala 524:36]
  assign io_main_pipe_req_bits_miss_way_en = req_way_en; // @[MissQueue.scala 525:37]
  assign io_main_pipe_req_bits_source = req_source; // @[MissQueue.scala 527:32]
  assign io_main_pipe_req_bits_cmd = req_cmd; // @[MissQueue.scala 528:29]
  assign io_main_pipe_req_bits_vaddr = req_vaddr; // @[MissQueue.scala 529:31]
  assign io_main_pipe_req_bits_addr = req_addr; // @[MissQueue.scala 530:30]
  assign io_main_pipe_req_bits_store_data = {refill_data_splited_data_hi,refill_data_splited_data_lo}; // @[MissQueue.scala 531:61]
  assign io_main_pipe_req_bits_word_idx = req_word_idx; // @[MissQueue.scala 533:34]
  assign io_main_pipe_req_bits_amo_data = req_amo_data; // @[MissQueue.scala 534:34]
  assign io_main_pipe_req_bits_amo_mask = req_amo_mask; // @[MissQueue.scala 535:34]
  assign io_main_pipe_req_bits_error = error; // @[MissQueue.scala 536:31]
  assign io_main_pipe_req_bits_id = req_id; // @[MissQueue.scala 537:28]
  assign io_block_addr_valid = req_valid & w_grantlast & ~w_refill_resp; // @[MissQueue.scala 539:51]
  assign io_block_addr_bits = req_addr; // @[MissQueue.scala 540:22]
  assign io_req_handled_by_this_entry = primary_fire | secondary_fire; // @[MissQueue.scala 225:48]
  assign io_forwardInfo_inflight = req_valid; // @[DCacheWrapper.scala 581:14]
  assign io_forwardInfo_paddr = req_addr; // @[DCacheWrapper.scala 582:11]
  assign io_forwardInfo_raw_data_0 = refill_data_raw_0; // @[DCacheWrapper.scala 583:14]
  assign io_forwardInfo_raw_data_1 = refill_data_raw_1; // @[DCacheWrapper.scala 583:14]
  assign io_forwardInfo_firstbeat_valid = w_grantfirst; // @[DCacheWrapper.scala 584:21]
  assign io_forwardInfo_lastbeat_valid = w_grantlast; // @[DCacheWrapper.scala 585:20]
  always @(posedge clock) begin
    if (secondary_fire) begin // @[MissQueue.scala 274:25]
      if (_s_write_storedata_T) begin // @[MissQueue.scala 280:36]
        req_source <= io_req_bits_source; // @[MissQueue.scala 281:11]
      end else begin
        req_source <= _GEN_10;
      end
    end else begin
      req_source <= _GEN_10;
    end
    if (secondary_fire) begin // @[MissQueue.scala 274:25]
      if (_s_write_storedata_T) begin // @[MissQueue.scala 280:36]
        req_cmd <= io_req_bits_cmd; // @[MissQueue.scala 281:11]
      end else begin
        req_cmd <= _GEN_11;
      end
    end else begin
      req_cmd <= _GEN_11;
    end
    if (secondary_fire) begin // @[MissQueue.scala 274:25]
      if (_s_write_storedata_T) begin // @[MissQueue.scala 280:36]
        req_addr <= _req_addr_T_1; // @[MissQueue.scala 282:16]
      end else begin
        req_addr <= _GEN_12;
      end
    end else begin
      req_addr <= _GEN_12;
    end
    if (secondary_fire) begin // @[MissQueue.scala 274:25]
      if (_s_write_storedata_T) begin // @[MissQueue.scala 280:36]
        req_vaddr <= io_req_bits_vaddr; // @[MissQueue.scala 281:11]
      end else begin
        req_vaddr <= _GEN_13;
      end
    end else begin
      req_vaddr <= _GEN_13;
    end
    if (secondary_fire) begin // @[MissQueue.scala 274:25]
      if (!(_s_write_storedata_T)) begin // @[MissQueue.scala 280:36]
        req_way_en <= _GEN_14;
      end
    end else begin
      req_way_en <= _GEN_14;
    end
    if (secondary_fire) begin // @[MissQueue.scala 274:25]
      if (_s_write_storedata_T) begin // @[MissQueue.scala 280:36]
        req_word_idx <= io_req_bits_word_idx; // @[MissQueue.scala 281:11]
      end else begin
        req_word_idx <= _GEN_17;
      end
    end else begin
      req_word_idx <= _GEN_17;
    end
    if (secondary_fire) begin // @[MissQueue.scala 274:25]
      if (_s_write_storedata_T) begin // @[MissQueue.scala 280:36]
        req_amo_data <= io_req_bits_amo_data; // @[MissQueue.scala 281:11]
      end else begin
        req_amo_data <= _GEN_18;
      end
    end else begin
      req_amo_data <= _GEN_18;
    end
    if (secondary_fire) begin // @[MissQueue.scala 274:25]
      if (_s_write_storedata_T) begin // @[MissQueue.scala 280:36]
        req_amo_mask <= io_req_bits_amo_mask; // @[MissQueue.scala 281:11]
      end else begin
        req_amo_mask <= _GEN_19;
      end
    end else begin
      req_amo_mask <= _GEN_19;
    end
    if (secondary_fire) begin // @[MissQueue.scala 274:25]
      req_req_coh_state <= io_req_bits_req_coh_state;
    end else if (primary_fire) begin // @[MissQueue.scala 239:23]
      req_req_coh_state <= io_req_bits_req_coh_state; // @[MissQueue.scala 241:9]
    end
    if (secondary_fire) begin // @[MissQueue.scala 274:25]
      if (!(_s_write_storedata_T)) begin // @[MissQueue.scala 280:36]
        req_replace_tag <= _GEN_22;
      end
    end else begin
      req_replace_tag <= _GEN_22;
    end
    if (secondary_fire) begin // @[MissQueue.scala 274:25]
      if (_s_write_storedata_T) begin // @[MissQueue.scala 280:36]
        req_id <= io_req_bits_id; // @[MissQueue.scala 281:11]
      end else begin
        req_id <= _GEN_23;
      end
    end else begin
      req_id <= _GEN_23;
    end
    if (_T_9) begin // @[MissQueue.scala 302:42]
      req_store_mask <= io_req_data_store_mask; // @[MissQueue.scala 303:20]
    end
    if (secondary_fire) begin // @[MissQueue.scala 274:25]
      if (secondary_fire) begin // @[MissQueue.scala 274:25]
        should_refill_data_reg <= should_refill_data_reg | _should_refill_data_reg_T; // @[MissQueue.scala 290:24]
      end
    end else if (primary_fire) begin // @[MissQueue.scala 239:23]
      should_refill_data_reg <= _should_refill_data_reg_T; // @[MissQueue.scala 268:28]
    end
    if (_T_6) begin // @[MissQueue.scala 326:30]
      grant_param <= io_mem_grant_bits_param; // @[MissQueue.scala 328:17]
    end
    if (_T_6) begin // @[MissQueue.scala 326:30]
      if (beats1_opdata) begin // @[MissQueue.scala 329:44]
        if (3'h0 == idx_3) begin // @[MissQueue.scala 334:36]
          refill_and_store_data_0 <= _refill_and_store_data_T_15; // @[MissQueue.scala 334:36]
        end else if (3'h0 == idx_2) begin // @[MissQueue.scala 334:36]
          refill_and_store_data_0 <= _refill_and_store_data_T_11; // @[MissQueue.scala 334:36]
        end else begin
          refill_and_store_data_0 <= _GEN_129;
        end
      end
    end else if (_T_9) begin // @[MissQueue.scala 302:42]
      refill_and_store_data_0 <= io_req_data_store_data[63:0]; // @[MissQueue.scala 305:32]
    end
    if (_T_6) begin // @[MissQueue.scala 326:30]
      if (beats1_opdata) begin // @[MissQueue.scala 329:44]
        if (3'h1 == idx_3) begin // @[MissQueue.scala 334:36]
          refill_and_store_data_1 <= _refill_and_store_data_T_15; // @[MissQueue.scala 334:36]
        end else if (3'h1 == idx_2) begin // @[MissQueue.scala 334:36]
          refill_and_store_data_1 <= _refill_and_store_data_T_11; // @[MissQueue.scala 334:36]
        end else begin
          refill_and_store_data_1 <= _GEN_130;
        end
      end
    end else if (_T_9) begin // @[MissQueue.scala 302:42]
      refill_and_store_data_1 <= io_req_data_store_data[127:64]; // @[MissQueue.scala 305:32]
    end
    if (_T_6) begin // @[MissQueue.scala 326:30]
      if (beats1_opdata) begin // @[MissQueue.scala 329:44]
        if (3'h2 == idx_3) begin // @[MissQueue.scala 334:36]
          refill_and_store_data_2 <= _refill_and_store_data_T_15; // @[MissQueue.scala 334:36]
        end else if (3'h2 == idx_2) begin // @[MissQueue.scala 334:36]
          refill_and_store_data_2 <= _refill_and_store_data_T_11; // @[MissQueue.scala 334:36]
        end else begin
          refill_and_store_data_2 <= _GEN_131;
        end
      end
    end else if (_T_9) begin // @[MissQueue.scala 302:42]
      refill_and_store_data_2 <= io_req_data_store_data[191:128]; // @[MissQueue.scala 305:32]
    end
    if (_T_6) begin // @[MissQueue.scala 326:30]
      if (beats1_opdata) begin // @[MissQueue.scala 329:44]
        if (3'h3 == idx_3) begin // @[MissQueue.scala 334:36]
          refill_and_store_data_3 <= _refill_and_store_data_T_15; // @[MissQueue.scala 334:36]
        end else if (3'h3 == idx_2) begin // @[MissQueue.scala 334:36]
          refill_and_store_data_3 <= _refill_and_store_data_T_11; // @[MissQueue.scala 334:36]
        end else begin
          refill_and_store_data_3 <= _GEN_132;
        end
      end
    end else if (_T_9) begin // @[MissQueue.scala 302:42]
      refill_and_store_data_3 <= io_req_data_store_data[255:192]; // @[MissQueue.scala 305:32]
    end
    if (_T_6) begin // @[MissQueue.scala 326:30]
      if (beats1_opdata) begin // @[MissQueue.scala 329:44]
        if (3'h4 == idx_3) begin // @[MissQueue.scala 334:36]
          refill_and_store_data_4 <= _refill_and_store_data_T_15; // @[MissQueue.scala 334:36]
        end else if (3'h4 == idx_2) begin // @[MissQueue.scala 334:36]
          refill_and_store_data_4 <= _refill_and_store_data_T_11; // @[MissQueue.scala 334:36]
        end else begin
          refill_and_store_data_4 <= _GEN_133;
        end
      end
    end else if (_T_9) begin // @[MissQueue.scala 302:42]
      refill_and_store_data_4 <= io_req_data_store_data[319:256]; // @[MissQueue.scala 305:32]
    end
    if (_T_6) begin // @[MissQueue.scala 326:30]
      if (beats1_opdata) begin // @[MissQueue.scala 329:44]
        if (3'h5 == idx_3) begin // @[MissQueue.scala 334:36]
          refill_and_store_data_5 <= _refill_and_store_data_T_15; // @[MissQueue.scala 334:36]
        end else if (3'h5 == idx_2) begin // @[MissQueue.scala 334:36]
          refill_and_store_data_5 <= _refill_and_store_data_T_11; // @[MissQueue.scala 334:36]
        end else begin
          refill_and_store_data_5 <= _GEN_134;
        end
      end
    end else if (_T_9) begin // @[MissQueue.scala 302:42]
      refill_and_store_data_5 <= io_req_data_store_data[383:320]; // @[MissQueue.scala 305:32]
    end
    if (_T_6) begin // @[MissQueue.scala 326:30]
      if (beats1_opdata) begin // @[MissQueue.scala 329:44]
        if (3'h6 == idx_3) begin // @[MissQueue.scala 334:36]
          refill_and_store_data_6 <= _refill_and_store_data_T_15; // @[MissQueue.scala 334:36]
        end else if (3'h6 == idx_2) begin // @[MissQueue.scala 334:36]
          refill_and_store_data_6 <= _refill_and_store_data_T_11; // @[MissQueue.scala 334:36]
        end else begin
          refill_and_store_data_6 <= _GEN_135;
        end
      end
    end else if (_T_9) begin // @[MissQueue.scala 302:42]
      refill_and_store_data_6 <= io_req_data_store_data[447:384]; // @[MissQueue.scala 305:32]
    end
    if (_T_6) begin // @[MissQueue.scala 326:30]
      if (beats1_opdata) begin // @[MissQueue.scala 329:44]
        if (3'h7 == idx_3) begin // @[MissQueue.scala 334:36]
          refill_and_store_data_7 <= _refill_and_store_data_T_15; // @[MissQueue.scala 334:36]
        end else if (3'h7 == idx_2) begin // @[MissQueue.scala 334:36]
          refill_and_store_data_7 <= _refill_and_store_data_T_11; // @[MissQueue.scala 334:36]
        end else begin
          refill_and_store_data_7 <= _GEN_136;
        end
      end
    end else if (_T_9) begin // @[MissQueue.scala 302:42]
      refill_and_store_data_7 <= io_req_data_store_data[511:448]; // @[MissQueue.scala 305:32]
    end
    if (_T_6) begin // @[MissQueue.scala 326:30]
      if (~refill_count) begin // @[MissQueue.scala 350:35]
        refill_data_raw_0 <= io_mem_grant_bits_data; // @[MissQueue.scala 350:35]
      end
    end
    if (_T_6) begin // @[MissQueue.scala 326:30]
      if (refill_count) begin // @[MissQueue.scala 350:35]
        refill_data_raw_1 <= io_mem_grant_bits_data; // @[MissQueue.scala 350:35]
      end
    end
    io_refill_to_ldq_valid_REG <= ~w_grantlast & _T_6; // @[MissQueue.scala 432:50]
    io_refill_to_ldq_bits_addr_REG <= req_addr + _GEN_230; // @[MissQueue.scala 433:50]
    io_refill_to_ldq_bits_data_REG <= beats1 & ~counter1; // @[Edges.scala 233:25]
    io_refill_to_ldq_bits_error_REG <= io_mem_grant_bits_corrupt | io_mem_grant_bits_denied; // @[MissQueue.scala 435:68]
    io_refill_to_ldq_bits_refill_done_REG <= refill_done & _T_6; // @[MissQueue.scala 436:60]
    if (_T_6) begin // @[Reg.scala 17:18]
      grantack_sink <= io_mem_grant_bits_sink; // @[Reg.scala 17:22]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MissQueue.scala 239:23]
      req_valid <= 1'h0; // @[MissQueue.scala 240:15]
    end else begin
      req_valid <= primary_fire | _GEN_1;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MissQueue.scala 297:32]
      s_acquire <= 1'h1; // @[MissQueue.scala 298:15]
    end else begin
      s_acquire <= _T_40 | _GEN_25;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MissQueue.scala 354:31]
      s_grantack <= 1'h1; // @[MissQueue.scala 355:16]
    end else begin
      s_grantack <= _T_47 | _GEN_26;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MissQueue.scala 358:37]
      s_replace_req <= 1'h1; // @[MissQueue.scala 359:19]
    end else begin
      s_replace_req <= _T_48 | _GEN_33;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MissQueue.scala 366:36]
      s_refill <= 1'h1; // @[MissQueue.scala 367:14]
    end else begin
      s_refill <= _T_49 | _GEN_31;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MissQueue.scala 374:34]
      s_mainpipe_req <= 1'h1; // @[MissQueue.scala 375:20]
    end else begin
      s_mainpipe_req <= _T_50 | _GEN_35;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MissQueue.scala 274:25]
      s_write_storedata <= 1'h1; // @[MissQueue.scala 280:36 286:25]
    end else if (secondary_fire) begin
      if (_s_write_storedata_T) begin
        s_write_storedata <= 1'h0;
      end else begin
        s_write_storedata <= _GEN_29;
      end
    end else begin
      s_write_storedata <= _GEN_29;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MissQueue.scala 326:30]
      w_grantfirst <= 1'h1; // @[MissQueue.scala 327:18]
    end else begin
      w_grantfirst <= _T_6 | _GEN_27;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MissQueue.scala 326:30]
      w_grantlast <= 1'h1; // @[MissQueue.scala 329:44 336:19 344:19]
    end else if (_T_6) begin // @[MissQueue.scala 239:23]
      if (beats1_opdata) begin // @[MissQueue.scala 248:17]
        w_grantlast <= w_grantlast | refill_done;
      end else begin
        w_grantlast <= 1'h1;
      end
    end else if (primary_fire) begin // @[MissQueue.scala 190:28]
      w_grantlast <= 1'h0;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MissQueue.scala 362:31]
      w_replace_resp <= 1'h1; // @[MissQueue.scala 363:20]
    end else begin
      w_replace_resp <= io_replace_pipe_resp | _GEN_34;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MissQueue.scala 370:30]
      w_refill_resp <= 1'h1; // @[MissQueue.scala 371:19]
    end else begin
      w_refill_resp <= io_refill_pipe_resp | _GEN_32;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MissQueue.scala 378:28]
      w_mainpipe_resp <= 1'h1; // @[MissQueue.scala 379:21]
    end else begin
      w_mainpipe_resp <= io_main_pipe_resp | _GEN_36;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MissQueue.scala 326:30]
      error <= 1'h0; // @[MissQueue.scala 348:11]
    end else if (_T_6) begin // @[MissQueue.scala 239:23]
      error <= io_mem_grant_bits_denied | io_mem_grant_bits_corrupt | error; // @[MissQueue.scala 269:11]
    end else if (primary_fire) begin // @[MissQueue.scala 200:22]
      error <= 1'h0;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MissQueue.scala 239:23]
      prefetch <= 1'h0; // @[MissQueue.scala 270:14]
    end else if (primary_fire) begin // @[MissQueue.scala 201:25]
      prefetch <= input_req_is_prefetch;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Edges.scala 234:17]
      counter <= 1'h0; // @[Edges.scala 235:21]
    end else if (_T_6) begin // @[Edges.scala 228:27]
      if (first) begin
        counter <= beats1;
      end else begin
        counter <= counter1;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MissQueue.scala 326:30]
      hasData <= 1'h1;
    end else if (_T_6) begin // @[MissQueue.scala 324:24]
      hasData <= beats1_opdata;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[MissQueue.scala 326:30]
      isDirty <= 1'h0; // @[MissQueue.scala 351:13]
    end else if (_T_6) begin // @[MissQueue.scala 325:24]
      isDirty <= io_mem_grant_bits_echo_blockisdirty;
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
  req_source = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  req_cmd = _RAND_1[4:0];
  _RAND_2 = {2{`RANDOM}};
  req_addr = _RAND_2[35:0];
  _RAND_3 = {2{`RANDOM}};
  req_vaddr = _RAND_3[38:0];
  _RAND_4 = {1{`RANDOM}};
  req_way_en = _RAND_4[7:0];
  _RAND_5 = {1{`RANDOM}};
  req_word_idx = _RAND_5[2:0];
  _RAND_6 = {2{`RANDOM}};
  req_amo_data = _RAND_6[63:0];
  _RAND_7 = {1{`RANDOM}};
  req_amo_mask = _RAND_7[7:0];
  _RAND_8 = {1{`RANDOM}};
  req_req_coh_state = _RAND_8[1:0];
  _RAND_9 = {1{`RANDOM}};
  req_replace_tag = _RAND_9[23:0];
  _RAND_10 = {1{`RANDOM}};
  req_id = _RAND_10[3:0];
  _RAND_11 = {2{`RANDOM}};
  req_store_mask = _RAND_11[63:0];
  _RAND_12 = {1{`RANDOM}};
  req_valid = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  s_acquire = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  s_grantack = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  s_replace_req = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  s_refill = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  s_mainpipe_req = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  s_write_storedata = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  w_grantfirst = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  w_grantlast = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  w_replace_resp = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  w_refill_resp = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  w_mainpipe_resp = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  error = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  prefetch = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  should_refill_data_reg = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  counter = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  grant_param = _RAND_28[1:0];
  _RAND_29 = {2{`RANDOM}};
  refill_and_store_data_0 = _RAND_29[63:0];
  _RAND_30 = {2{`RANDOM}};
  refill_and_store_data_1 = _RAND_30[63:0];
  _RAND_31 = {2{`RANDOM}};
  refill_and_store_data_2 = _RAND_31[63:0];
  _RAND_32 = {2{`RANDOM}};
  refill_and_store_data_3 = _RAND_32[63:0];
  _RAND_33 = {2{`RANDOM}};
  refill_and_store_data_4 = _RAND_33[63:0];
  _RAND_34 = {2{`RANDOM}};
  refill_and_store_data_5 = _RAND_34[63:0];
  _RAND_35 = {2{`RANDOM}};
  refill_and_store_data_6 = _RAND_35[63:0];
  _RAND_36 = {2{`RANDOM}};
  refill_and_store_data_7 = _RAND_36[63:0];
  _RAND_37 = {8{`RANDOM}};
  refill_data_raw_0 = _RAND_37[255:0];
  _RAND_38 = {8{`RANDOM}};
  refill_data_raw_1 = _RAND_38[255:0];
  _RAND_39 = {1{`RANDOM}};
  hasData = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  isDirty = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  io_refill_to_ldq_valid_REG = _RAND_41[0:0];
  _RAND_42 = {2{`RANDOM}};
  io_refill_to_ldq_bits_addr_REG = _RAND_42[35:0];
  _RAND_43 = {1{`RANDOM}};
  io_refill_to_ldq_bits_data_REG = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  io_refill_to_ldq_bits_error_REG = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  io_refill_to_ldq_bits_refill_done_REG = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  grantack_sink = _RAND_46[3:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    req_valid = 1'h0;
  end
  if (reset) begin
    s_acquire = 1'h1;
  end
  if (reset) begin
    s_grantack = 1'h1;
  end
  if (reset) begin
    s_replace_req = 1'h1;
  end
  if (reset) begin
    s_refill = 1'h1;
  end
  if (reset) begin
    s_mainpipe_req = 1'h1;
  end
  if (reset) begin
    s_write_storedata = 1'h1;
  end
  if (reset) begin
    w_grantfirst = 1'h1;
  end
  if (reset) begin
    w_grantlast = 1'h1;
  end
  if (reset) begin
    w_replace_resp = 1'h1;
  end
  if (reset) begin
    w_refill_resp = 1'h1;
  end
  if (reset) begin
    w_mainpipe_resp = 1'h1;
  end
  if (reset) begin
    error = 1'h0;
  end
  if (reset) begin
    prefetch = 1'h0;
  end
  if (reset) begin
    counter = 1'h0;
  end
  if (reset) begin
    hasData = 1'h1;
  end
  if (reset) begin
    isDirty = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

