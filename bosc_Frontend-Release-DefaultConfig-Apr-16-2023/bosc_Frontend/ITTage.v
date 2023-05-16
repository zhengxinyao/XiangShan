module ITTage(
  input          clock,
  input          reset,
  input  [35:0]  io_reset_vector,
  input  [38:0]  io_in_bits_s0_pc,
  input  [7:0]   io_in_bits_folded_hist_hist_17_folded_hist,
  input  [8:0]   io_in_bits_folded_hist_hist_10_folded_hist,
  input  [7:0]   io_in_bits_folded_hist_hist_8_folded_hist,
  input  [8:0]   io_in_bits_folded_hist_hist_7_folded_hist,
  input  [8:0]   io_in_bits_folded_hist_hist_6_folded_hist,
  input  [3:0]   io_in_bits_folded_hist_hist_4_folded_hist,
  input  [7:0]   io_in_bits_folded_hist_hist_1_folded_hist,
  input  [7:0]   io_in_bits_folded_hist_hist_0_folded_hist,
  input          io_in_bits_resp_in_0_s2_full_pred_br_taken_mask_0,
  input          io_in_bits_resp_in_0_s2_full_pred_br_taken_mask_1,
  input          io_in_bits_resp_in_0_s2_full_pred_slot_valids_0,
  input          io_in_bits_resp_in_0_s2_full_pred_slot_valids_1,
  input  [38:0]  io_in_bits_resp_in_0_s2_full_pred_targets_0,
  input  [38:0]  io_in_bits_resp_in_0_s2_full_pred_targets_1,
  input  [38:0]  io_in_bits_resp_in_0_s2_full_pred_jalr_target,
  input  [2:0]   io_in_bits_resp_in_0_s2_full_pred_offsets_0,
  input  [2:0]   io_in_bits_resp_in_0_s2_full_pred_offsets_1,
  input  [38:0]  io_in_bits_resp_in_0_s2_full_pred_fallThroughAddr,
  input          io_in_bits_resp_in_0_s2_full_pred_fallThroughErr,
  input          io_in_bits_resp_in_0_s2_full_pred_is_jalr,
  input          io_in_bits_resp_in_0_s2_full_pred_is_call,
  input          io_in_bits_resp_in_0_s2_full_pred_is_ret,
  input          io_in_bits_resp_in_0_s2_full_pred_last_may_be_rvi_call,
  input          io_in_bits_resp_in_0_s2_full_pred_is_br_sharing,
  input          io_in_bits_resp_in_0_s2_full_pred_hit,
  input          io_in_bits_resp_in_0_s3_full_pred_br_taken_mask_0,
  input          io_in_bits_resp_in_0_s3_full_pred_br_taken_mask_1,
  input          io_in_bits_resp_in_0_s3_full_pred_slot_valids_0,
  input          io_in_bits_resp_in_0_s3_full_pred_slot_valids_1,
  input  [38:0]  io_in_bits_resp_in_0_s3_full_pred_targets_0,
  input  [38:0]  io_in_bits_resp_in_0_s3_full_pred_targets_1,
  input  [38:0]  io_in_bits_resp_in_0_s3_full_pred_jalr_target,
  input  [2:0]   io_in_bits_resp_in_0_s3_full_pred_offsets_0,
  input  [2:0]   io_in_bits_resp_in_0_s3_full_pred_offsets_1,
  input  [38:0]  io_in_bits_resp_in_0_s3_full_pred_fallThroughAddr,
  input          io_in_bits_resp_in_0_s3_full_pred_fallThroughErr,
  input          io_in_bits_resp_in_0_s3_full_pred_is_jalr,
  input          io_in_bits_resp_in_0_s3_full_pred_is_call,
  input          io_in_bits_resp_in_0_s3_full_pred_is_ret,
  input          io_in_bits_resp_in_0_s3_full_pred_is_br_sharing,
  input          io_in_bits_resp_in_0_s3_full_pred_hit,
  input          io_in_bits_resp_in_0_last_stage_ftb_entry_valid,
  input  [2:0]   io_in_bits_resp_in_0_last_stage_ftb_entry_brSlots_0_offset,
  input  [11:0]  io_in_bits_resp_in_0_last_stage_ftb_entry_brSlots_0_lower,
  input  [1:0]   io_in_bits_resp_in_0_last_stage_ftb_entry_brSlots_0_tarStat,
  input          io_in_bits_resp_in_0_last_stage_ftb_entry_brSlots_0_sharing,
  input          io_in_bits_resp_in_0_last_stage_ftb_entry_brSlots_0_valid,
  input  [2:0]   io_in_bits_resp_in_0_last_stage_ftb_entry_tailSlot_offset,
  input  [19:0]  io_in_bits_resp_in_0_last_stage_ftb_entry_tailSlot_lower,
  input  [1:0]   io_in_bits_resp_in_0_last_stage_ftb_entry_tailSlot_tarStat,
  input          io_in_bits_resp_in_0_last_stage_ftb_entry_tailSlot_sharing,
  input          io_in_bits_resp_in_0_last_stage_ftb_entry_tailSlot_valid,
  input  [2:0]   io_in_bits_resp_in_0_last_stage_ftb_entry_pftAddr,
  input          io_in_bits_resp_in_0_last_stage_ftb_entry_carry,
  input          io_in_bits_resp_in_0_last_stage_ftb_entry_isCall,
  input          io_in_bits_resp_in_0_last_stage_ftb_entry_isRet,
  input          io_in_bits_resp_in_0_last_stage_ftb_entry_isJalr,
  input          io_in_bits_resp_in_0_last_stage_ftb_entry_last_may_be_rvi_call,
  input          io_in_bits_resp_in_0_last_stage_ftb_entry_always_taken_0,
  input          io_in_bits_resp_in_0_last_stage_ftb_entry_always_taken_1,
  output         io_out_s2_full_pred_br_taken_mask_0,
  output         io_out_s2_full_pred_br_taken_mask_1,
  output         io_out_s2_full_pred_slot_valids_0,
  output         io_out_s2_full_pred_slot_valids_1,
  output [38:0]  io_out_s2_full_pred_targets_0,
  output [38:0]  io_out_s2_full_pred_targets_1,
  output [38:0]  io_out_s2_full_pred_jalr_target,
  output [2:0]   io_out_s2_full_pred_offsets_0,
  output [2:0]   io_out_s2_full_pred_offsets_1,
  output [38:0]  io_out_s2_full_pred_fallThroughAddr,
  output         io_out_s2_full_pred_fallThroughErr,
  output         io_out_s2_full_pred_is_jalr,
  output         io_out_s2_full_pred_is_call,
  output         io_out_s2_full_pred_is_ret,
  output         io_out_s2_full_pred_last_may_be_rvi_call,
  output         io_out_s2_full_pred_is_br_sharing,
  output         io_out_s2_full_pred_hit,
  output         io_out_s3_full_pred_br_taken_mask_0,
  output         io_out_s3_full_pred_br_taken_mask_1,
  output         io_out_s3_full_pred_slot_valids_0,
  output         io_out_s3_full_pred_slot_valids_1,
  output [38:0]  io_out_s3_full_pred_targets_0,
  output [38:0]  io_out_s3_full_pred_targets_1,
  output [38:0]  io_out_s3_full_pred_jalr_target,
  output [2:0]   io_out_s3_full_pred_offsets_0,
  output [2:0]   io_out_s3_full_pred_offsets_1,
  output [38:0]  io_out_s3_full_pred_fallThroughAddr,
  output         io_out_s3_full_pred_fallThroughErr,
  output         io_out_s3_full_pred_is_jalr,
  output         io_out_s3_full_pred_is_call,
  output         io_out_s3_full_pred_is_ret,
  output         io_out_s3_full_pred_is_br_sharing,
  output         io_out_s3_full_pred_hit,
  output [255:0] io_out_last_stage_meta,
  output         io_out_last_stage_ftb_entry_valid,
  output [2:0]   io_out_last_stage_ftb_entry_brSlots_0_offset,
  output [11:0]  io_out_last_stage_ftb_entry_brSlots_0_lower,
  output [1:0]   io_out_last_stage_ftb_entry_brSlots_0_tarStat,
  output         io_out_last_stage_ftb_entry_brSlots_0_sharing,
  output         io_out_last_stage_ftb_entry_brSlots_0_valid,
  output [2:0]   io_out_last_stage_ftb_entry_tailSlot_offset,
  output [19:0]  io_out_last_stage_ftb_entry_tailSlot_lower,
  output [1:0]   io_out_last_stage_ftb_entry_tailSlot_tarStat,
  output         io_out_last_stage_ftb_entry_tailSlot_sharing,
  output         io_out_last_stage_ftb_entry_tailSlot_valid,
  output [2:0]   io_out_last_stage_ftb_entry_pftAddr,
  output         io_out_last_stage_ftb_entry_carry,
  output         io_out_last_stage_ftb_entry_isCall,
  output         io_out_last_stage_ftb_entry_isRet,
  output         io_out_last_stage_ftb_entry_isJalr,
  output         io_out_last_stage_ftb_entry_last_may_be_rvi_call,
  output         io_out_last_stage_ftb_entry_always_taken_0,
  output         io_out_last_stage_ftb_entry_always_taken_1,
  input          io_s0_fire,
  input          io_s1_fire,
  input          io_s2_fire,
  input          io_update_valid,
  input  [38:0]  io_update_bits_pc,
  input  [7:0]   io_update_bits_spec_info_folded_hist_hist_17_folded_hist,
  input  [8:0]   io_update_bits_spec_info_folded_hist_hist_10_folded_hist,
  input  [7:0]   io_update_bits_spec_info_folded_hist_hist_8_folded_hist,
  input  [8:0]   io_update_bits_spec_info_folded_hist_hist_7_folded_hist,
  input  [8:0]   io_update_bits_spec_info_folded_hist_hist_6_folded_hist,
  input  [3:0]   io_update_bits_spec_info_folded_hist_hist_4_folded_hist,
  input  [7:0]   io_update_bits_spec_info_folded_hist_hist_1_folded_hist,
  input  [7:0]   io_update_bits_spec_info_folded_hist_hist_0_folded_hist,
  input          io_update_bits_ftb_entry_tailSlot_sharing,
  input          io_update_bits_ftb_entry_tailSlot_valid,
  input          io_update_bits_ftb_entry_isRet,
  input          io_update_bits_ftb_entry_isJalr,
  input          io_update_bits_jmp_taken,
  input          io_update_bits_mispred_mask_2,
  input  [255:0] io_update_bits_meta,
  input  [38:0]  io_update_bits_full_target
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [63:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [63:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [63:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [63:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [63:0] _RAND_22;
  reg [63:0] _RAND_23;
  reg [63:0] _RAND_24;
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
  reg [63:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [63:0] _RAND_38;
  reg [63:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [63:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [63:0] _RAND_49;
  reg [63:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [63:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [63:0] _RAND_60;
  reg [63:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [63:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [63:0] _RAND_72;
  reg [63:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_78;
  reg [63:0] _RAND_79;
  reg [31:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [63:0] _RAND_84;
  reg [63:0] _RAND_85;
  reg [31:0] _RAND_86;
  reg [31:0] _RAND_87;
  reg [31:0] _RAND_88;
  reg [31:0] _RAND_89;
  reg [31:0] _RAND_90;
  reg [63:0] _RAND_91;
  reg [31:0] _RAND_92;
  reg [31:0] _RAND_93;
`endif // RANDOMIZE_REG_INIT
  wire  reset_vector_delay_clock; // @[Hold.scala 97:23]
  wire [35:0] reset_vector_delay_io_in; // @[Hold.scala 97:23]
  wire [35:0] reset_vector_delay_io_out; // @[Hold.scala 97:23]
  wire  tables_0_clock; // @[ITTAGE.scala 366:21]
  wire  tables_0_reset; // @[ITTAGE.scala 366:21]
  wire  tables_0_io_req_ready; // @[ITTAGE.scala 366:21]
  wire  tables_0_io_req_valid; // @[ITTAGE.scala 366:21]
  wire [38:0] tables_0_io_req_bits_pc; // @[ITTAGE.scala 366:21]
  wire [3:0] tables_0_io_req_bits_folded_hist_hist_4_folded_hist; // @[ITTAGE.scala 366:21]
  wire  tables_0_io_resp_valid; // @[ITTAGE.scala 366:21]
  wire [1:0] tables_0_io_resp_bits_ctr; // @[ITTAGE.scala 366:21]
  wire [1:0] tables_0_io_resp_bits_u; // @[ITTAGE.scala 366:21]
  wire [38:0] tables_0_io_resp_bits_target; // @[ITTAGE.scala 366:21]
  wire [38:0] tables_0_io_update_pc; // @[ITTAGE.scala 366:21]
  wire [3:0] tables_0_io_update_folded_hist_hist_4_folded_hist; // @[ITTAGE.scala 366:21]
  wire  tables_0_io_update_valid; // @[ITTAGE.scala 366:21]
  wire  tables_0_io_update_correct; // @[ITTAGE.scala 366:21]
  wire  tables_0_io_update_alloc; // @[ITTAGE.scala 366:21]
  wire [1:0] tables_0_io_update_oldCtr; // @[ITTAGE.scala 366:21]
  wire  tables_0_io_update_uValid; // @[ITTAGE.scala 366:21]
  wire  tables_0_io_update_u; // @[ITTAGE.scala 366:21]
  wire  tables_0_io_update_reset_u; // @[ITTAGE.scala 366:21]
  wire [38:0] tables_0_io_update_target; // @[ITTAGE.scala 366:21]
  wire [38:0] tables_0_io_update_old_target; // @[ITTAGE.scala 366:21]
  wire  tables_1_clock; // @[ITTAGE.scala 366:21]
  wire  tables_1_reset; // @[ITTAGE.scala 366:21]
  wire  tables_1_io_req_ready; // @[ITTAGE.scala 366:21]
  wire  tables_1_io_req_valid; // @[ITTAGE.scala 366:21]
  wire [38:0] tables_1_io_req_bits_pc; // @[ITTAGE.scala 366:21]
  wire [7:0] tables_1_io_req_bits_folded_hist_hist_8_folded_hist; // @[ITTAGE.scala 366:21]
  wire  tables_1_io_resp_valid; // @[ITTAGE.scala 366:21]
  wire [1:0] tables_1_io_resp_bits_ctr; // @[ITTAGE.scala 366:21]
  wire [1:0] tables_1_io_resp_bits_u; // @[ITTAGE.scala 366:21]
  wire [38:0] tables_1_io_resp_bits_target; // @[ITTAGE.scala 366:21]
  wire [38:0] tables_1_io_update_pc; // @[ITTAGE.scala 366:21]
  wire [7:0] tables_1_io_update_folded_hist_hist_8_folded_hist; // @[ITTAGE.scala 366:21]
  wire  tables_1_io_update_valid; // @[ITTAGE.scala 366:21]
  wire  tables_1_io_update_correct; // @[ITTAGE.scala 366:21]
  wire  tables_1_io_update_alloc; // @[ITTAGE.scala 366:21]
  wire [1:0] tables_1_io_update_oldCtr; // @[ITTAGE.scala 366:21]
  wire  tables_1_io_update_uValid; // @[ITTAGE.scala 366:21]
  wire  tables_1_io_update_u; // @[ITTAGE.scala 366:21]
  wire  tables_1_io_update_reset_u; // @[ITTAGE.scala 366:21]
  wire [38:0] tables_1_io_update_target; // @[ITTAGE.scala 366:21]
  wire [38:0] tables_1_io_update_old_target; // @[ITTAGE.scala 366:21]
  wire  tables_2_clock; // @[ITTAGE.scala 366:21]
  wire  tables_2_reset; // @[ITTAGE.scala 366:21]
  wire  tables_2_io_req_ready; // @[ITTAGE.scala 366:21]
  wire  tables_2_io_req_valid; // @[ITTAGE.scala 366:21]
  wire [38:0] tables_2_io_req_bits_pc; // @[ITTAGE.scala 366:21]
  wire [7:0] tables_2_io_req_bits_folded_hist_hist_17_folded_hist; // @[ITTAGE.scala 366:21]
  wire [8:0] tables_2_io_req_bits_folded_hist_hist_6_folded_hist; // @[ITTAGE.scala 366:21]
  wire  tables_2_io_resp_valid; // @[ITTAGE.scala 366:21]
  wire [1:0] tables_2_io_resp_bits_ctr; // @[ITTAGE.scala 366:21]
  wire [1:0] tables_2_io_resp_bits_u; // @[ITTAGE.scala 366:21]
  wire [38:0] tables_2_io_resp_bits_target; // @[ITTAGE.scala 366:21]
  wire [38:0] tables_2_io_update_pc; // @[ITTAGE.scala 366:21]
  wire [7:0] tables_2_io_update_folded_hist_hist_17_folded_hist; // @[ITTAGE.scala 366:21]
  wire [8:0] tables_2_io_update_folded_hist_hist_6_folded_hist; // @[ITTAGE.scala 366:21]
  wire  tables_2_io_update_valid; // @[ITTAGE.scala 366:21]
  wire  tables_2_io_update_correct; // @[ITTAGE.scala 366:21]
  wire  tables_2_io_update_alloc; // @[ITTAGE.scala 366:21]
  wire [1:0] tables_2_io_update_oldCtr; // @[ITTAGE.scala 366:21]
  wire  tables_2_io_update_uValid; // @[ITTAGE.scala 366:21]
  wire  tables_2_io_update_u; // @[ITTAGE.scala 366:21]
  wire  tables_2_io_update_reset_u; // @[ITTAGE.scala 366:21]
  wire [38:0] tables_2_io_update_target; // @[ITTAGE.scala 366:21]
  wire [38:0] tables_2_io_update_old_target; // @[ITTAGE.scala 366:21]
  wire  tables_3_clock; // @[ITTAGE.scala 366:21]
  wire  tables_3_reset; // @[ITTAGE.scala 366:21]
  wire  tables_3_io_req_ready; // @[ITTAGE.scala 366:21]
  wire  tables_3_io_req_valid; // @[ITTAGE.scala 366:21]
  wire [38:0] tables_3_io_req_bits_pc; // @[ITTAGE.scala 366:21]
  wire [8:0] tables_3_io_req_bits_folded_hist_hist_7_folded_hist; // @[ITTAGE.scala 366:21]
  wire [7:0] tables_3_io_req_bits_folded_hist_hist_0_folded_hist; // @[ITTAGE.scala 366:21]
  wire  tables_3_io_resp_valid; // @[ITTAGE.scala 366:21]
  wire [1:0] tables_3_io_resp_bits_ctr; // @[ITTAGE.scala 366:21]
  wire [1:0] tables_3_io_resp_bits_u; // @[ITTAGE.scala 366:21]
  wire [38:0] tables_3_io_resp_bits_target; // @[ITTAGE.scala 366:21]
  wire [38:0] tables_3_io_update_pc; // @[ITTAGE.scala 366:21]
  wire [8:0] tables_3_io_update_folded_hist_hist_7_folded_hist; // @[ITTAGE.scala 366:21]
  wire [7:0] tables_3_io_update_folded_hist_hist_0_folded_hist; // @[ITTAGE.scala 366:21]
  wire  tables_3_io_update_valid; // @[ITTAGE.scala 366:21]
  wire  tables_3_io_update_correct; // @[ITTAGE.scala 366:21]
  wire  tables_3_io_update_alloc; // @[ITTAGE.scala 366:21]
  wire [1:0] tables_3_io_update_oldCtr; // @[ITTAGE.scala 366:21]
  wire  tables_3_io_update_uValid; // @[ITTAGE.scala 366:21]
  wire  tables_3_io_update_u; // @[ITTAGE.scala 366:21]
  wire  tables_3_io_update_reset_u; // @[ITTAGE.scala 366:21]
  wire [38:0] tables_3_io_update_target; // @[ITTAGE.scala 366:21]
  wire [38:0] tables_3_io_update_old_target; // @[ITTAGE.scala 366:21]
  wire  tables_4_clock; // @[ITTAGE.scala 366:21]
  wire  tables_4_reset; // @[ITTAGE.scala 366:21]
  wire  tables_4_io_req_ready; // @[ITTAGE.scala 366:21]
  wire  tables_4_io_req_valid; // @[ITTAGE.scala 366:21]
  wire [38:0] tables_4_io_req_bits_pc; // @[ITTAGE.scala 366:21]
  wire [8:0] tables_4_io_req_bits_folded_hist_hist_10_folded_hist; // @[ITTAGE.scala 366:21]
  wire [7:0] tables_4_io_req_bits_folded_hist_hist_1_folded_hist; // @[ITTAGE.scala 366:21]
  wire  tables_4_io_resp_valid; // @[ITTAGE.scala 366:21]
  wire [1:0] tables_4_io_resp_bits_ctr; // @[ITTAGE.scala 366:21]
  wire [1:0] tables_4_io_resp_bits_u; // @[ITTAGE.scala 366:21]
  wire [38:0] tables_4_io_resp_bits_target; // @[ITTAGE.scala 366:21]
  wire [38:0] tables_4_io_update_pc; // @[ITTAGE.scala 366:21]
  wire [8:0] tables_4_io_update_folded_hist_hist_10_folded_hist; // @[ITTAGE.scala 366:21]
  wire [7:0] tables_4_io_update_folded_hist_hist_1_folded_hist; // @[ITTAGE.scala 366:21]
  wire  tables_4_io_update_valid; // @[ITTAGE.scala 366:21]
  wire  tables_4_io_update_correct; // @[ITTAGE.scala 366:21]
  wire  tables_4_io_update_alloc; // @[ITTAGE.scala 366:21]
  wire [1:0] tables_4_io_update_oldCtr; // @[ITTAGE.scala 366:21]
  wire  tables_4_io_update_uValid; // @[ITTAGE.scala 366:21]
  wire  tables_4_io_update_u; // @[ITTAGE.scala 366:21]
  wire  tables_4_io_update_reset_u; // @[ITTAGE.scala 366:21]
  wire [38:0] tables_4_io_update_target; // @[ITTAGE.scala 366:21]
  wire [38:0] tables_4_io_update_old_target; // @[ITTAGE.scala 366:21]
  reg [7:0] tickCtr; // @[ITTAGE.scala 376:24]
  reg  s2_resps__0_valid; // @[Reg.scala 16:16]
  reg [1:0] s2_resps__0_bits_ctr; // @[Reg.scala 16:16]
  reg [1:0] s2_resps__0_bits_u; // @[Reg.scala 16:16]
  reg [38:0] s2_resps__0_bits_target; // @[Reg.scala 16:16]
  reg  s2_resps__1_valid; // @[Reg.scala 16:16]
  reg [1:0] s2_resps__1_bits_ctr; // @[Reg.scala 16:16]
  reg [1:0] s2_resps__1_bits_u; // @[Reg.scala 16:16]
  reg [38:0] s2_resps__1_bits_target; // @[Reg.scala 16:16]
  reg  s2_resps__2_valid; // @[Reg.scala 16:16]
  reg [1:0] s2_resps__2_bits_ctr; // @[Reg.scala 16:16]
  reg [1:0] s2_resps__2_bits_u; // @[Reg.scala 16:16]
  reg [38:0] s2_resps__2_bits_target; // @[Reg.scala 16:16]
  reg  s2_resps__3_valid; // @[Reg.scala 16:16]
  reg [1:0] s2_resps__3_bits_ctr; // @[Reg.scala 16:16]
  reg [1:0] s2_resps__3_bits_u; // @[Reg.scala 16:16]
  reg [38:0] s2_resps__3_bits_target; // @[Reg.scala 16:16]
  reg  s2_resps__4_valid; // @[Reg.scala 16:16]
  reg [1:0] s2_resps__4_bits_ctr; // @[Reg.scala 16:16]
  reg [1:0] s2_resps__4_bits_u; // @[Reg.scala 16:16]
  reg [38:0] s2_resps__4_bits_target; // @[Reg.scala 16:16]
  wire  s1_resps_0_valid = tables_0_io_resp_valid; // @[ITTAGE.scala 380:{25,25}]
  wire [1:0] s1_resps_0_bits_ctr = tables_0_io_resp_bits_ctr; // @[ITTAGE.scala 380:{25,25}]
  wire [1:0] s1_resps_0_bits_u = tables_0_io_resp_bits_u; // @[ITTAGE.scala 380:{25,25}]
  wire [38:0] s1_resps_0_bits_target = tables_0_io_resp_bits_target; // @[ITTAGE.scala 380:{25,25}]
  wire  s1_resps_1_valid = tables_1_io_resp_valid; // @[ITTAGE.scala 380:{25,25}]
  wire [1:0] s1_resps_1_bits_ctr = tables_1_io_resp_bits_ctr; // @[ITTAGE.scala 380:{25,25}]
  wire [1:0] s1_resps_1_bits_u = tables_1_io_resp_bits_u; // @[ITTAGE.scala 380:{25,25}]
  wire [38:0] s1_resps_1_bits_target = tables_1_io_resp_bits_target; // @[ITTAGE.scala 380:{25,25}]
  wire  s1_resps_2_valid = tables_2_io_resp_valid; // @[ITTAGE.scala 380:{25,25}]
  wire [1:0] s1_resps_2_bits_ctr = tables_2_io_resp_bits_ctr; // @[ITTAGE.scala 380:{25,25}]
  wire [1:0] s1_resps_2_bits_u = tables_2_io_resp_bits_u; // @[ITTAGE.scala 380:{25,25}]
  wire [38:0] s1_resps_2_bits_target = tables_2_io_resp_bits_target; // @[ITTAGE.scala 380:{25,25}]
  wire  s1_resps_3_valid = tables_3_io_resp_valid; // @[ITTAGE.scala 380:{25,25}]
  wire [1:0] s1_resps_3_bits_ctr = tables_3_io_resp_bits_ctr; // @[ITTAGE.scala 380:{25,25}]
  wire [1:0] s1_resps_3_bits_u = tables_3_io_resp_bits_u; // @[ITTAGE.scala 380:{25,25}]
  wire [38:0] s1_resps_3_bits_target = tables_3_io_resp_bits_target; // @[ITTAGE.scala 380:{25,25}]
  wire  s1_resps_4_valid = tables_4_io_resp_valid; // @[ITTAGE.scala 380:{25,25}]
  wire [1:0] s1_resps_4_bits_ctr = tables_4_io_resp_bits_ctr; // @[ITTAGE.scala 380:{25,25}]
  wire [1:0] s1_resps_4_bits_u = tables_4_io_resp_bits_u; // @[ITTAGE.scala 380:{25,25}]
  wire [38:0] s1_resps_4_bits_target = tables_4_io_resp_bits_target; // @[ITTAGE.scala 380:{25,25}]
  reg  s3_tageTaken; // @[Reg.scala 16:16]
  wire  selectedInfo_res_hasOne = s2_resps__4_valid | s2_resps__3_valid; // @[ParallelMux.scala 132:16]
  wire  selectedInfo_res_1_hasOne = s2_resps__1_valid | s2_resps__0_valid; // @[ParallelMux.scala 132:16]
  wire  selectedInfo_res_2_hasOne = s2_resps__2_valid | selectedInfo_res_1_hasOne; // @[ParallelMux.scala 132:16]
  wire  selectedInfo_hasOne = selectedInfo_res_hasOne | selectedInfo_res_2_hasOne; // @[ParallelMux.scala 132:16]
  wire [1:0] selectedInfo_res_first_ctr = s2_resps__4_valid ? s2_resps__4_bits_ctr : s2_resps__3_bits_ctr; // @[ParallelMux.scala 134:10]
  wire [1:0] selectedInfo_res_1_first_ctr = s2_resps__1_valid ? s2_resps__1_bits_ctr : s2_resps__0_bits_ctr; // @[ParallelMux.scala 134:10]
  wire [1:0] selectedInfo_res_2_first_ctr = s2_resps__2_valid ? s2_resps__2_bits_ctr : selectedInfo_res_1_first_ctr; // @[ParallelMux.scala 134:10]
  wire [1:0] selectedInfo_first_ctr = selectedInfo_res_hasOne ? selectedInfo_res_first_ctr :
    selectedInfo_res_2_first_ctr; // @[ParallelMux.scala 134:10]
  wire  providerNull = selectedInfo_first_ctr == 2'h0; // @[ITTAGE.scala 465:39]
  wire  _s2_tageTaken_T_1 = selectedInfo_hasOne & ~providerNull; // @[ITTAGE.scala 471:15]
  wire  selectedInfo_res_hasTwo = s2_resps__4_valid & s2_resps__3_valid; // @[ParallelMux.scala 133:40]
  wire  selectedInfo_res_1_hasTwo = s2_resps__1_valid & s2_resps__0_valid; // @[ParallelMux.scala 133:40]
  wire  selectedInfo_res_2_hasTwo = selectedInfo_res_1_hasTwo | s2_resps__2_valid & selectedInfo_res_1_hasOne; // @[ParallelMux.scala 133:28]
  wire  selectedInfo_hasTwo = selectedInfo_res_hasTwo | selectedInfo_res_2_hasTwo | selectedInfo_res_hasOne &
    selectedInfo_res_2_hasOne; // @[ParallelMux.scala 133:28]
  wire  _s2_tageTaken_T_3 = selectedInfo_hasTwo & providerNull; // @[ITTAGE.scala 472:18]
  wire  _selectedInfo_T_89 = ~selectedInfo_res_hasOne; // @[ParallelMux.scala 136:10]
  wire  _selectedInfo_T_61 = ~s2_resps__2_valid; // @[ParallelMux.scala 136:10]
  wire  _selectedInfo_T_33 = ~s2_resps__1_valid; // @[ParallelMux.scala 136:10]
  wire [1:0] _selectedInfo_T_51 = _selectedInfo_T_33 ? s2_resps__0_bits_ctr : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _selectedInfo_T_52 = s2_resps__1_valid ? s2_resps__0_bits_ctr : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] selectedInfo_res_1_second_ctr = _selectedInfo_T_51 | _selectedInfo_T_52; // @[Mux.scala 27:73]
  wire [1:0] _selectedInfo_T_79 = _selectedInfo_T_61 ? selectedInfo_res_1_second_ctr : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _selectedInfo_T_80 = s2_resps__2_valid ? selectedInfo_res_1_first_ctr : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] selectedInfo_res_2_second_ctr = _selectedInfo_T_79 | _selectedInfo_T_80; // @[Mux.scala 27:73]
  wire [1:0] _selectedInfo_T_107 = _selectedInfo_T_89 ? selectedInfo_res_2_second_ctr : 2'h0; // @[Mux.scala 27:73]
  wire  _selectedInfo_T_91 = selectedInfo_res_hasOne & ~selectedInfo_res_hasTwo; // @[ParallelMux.scala 137:19]
  wire [1:0] _selectedInfo_T_108 = _selectedInfo_T_91 ? selectedInfo_res_2_first_ctr : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _selectedInfo_T_110 = _selectedInfo_T_107 | _selectedInfo_T_108; // @[Mux.scala 27:73]
  wire  _selectedInfo_T_5 = ~s2_resps__4_valid; // @[ParallelMux.scala 136:10]
  wire [1:0] _selectedInfo_T_23 = _selectedInfo_T_5 ? s2_resps__3_bits_ctr : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _selectedInfo_T_24 = s2_resps__4_valid ? s2_resps__3_bits_ctr : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] selectedInfo_res_second_ctr = _selectedInfo_T_23 | _selectedInfo_T_24; // @[Mux.scala 27:73]
  wire [1:0] _selectedInfo_T_109 = selectedInfo_res_hasTwo ? selectedInfo_res_second_ctr : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] selectedInfo_second_ctr = _selectedInfo_T_110 | _selectedInfo_T_109; // @[Mux.scala 27:73]
  wire  _s2_tageTaken_T_5 = ~selectedInfo_hasOne; // @[ITTAGE.scala 473:6]
  wire  s2_tageTaken = _s2_tageTaken_T_1 & selectedInfo_first_ctr[1] | _s2_tageTaken_T_3 & selectedInfo_second_ctr[1] |
    _s2_tageTaken_T_5; // @[Mux.scala 27:73]
  reg [38:0] s3_tageTarget; // @[Reg.scala 16:16]
  wire [38:0] selectedInfo_res_first_target = s2_resps__4_valid ? s2_resps__4_bits_target : s2_resps__3_bits_target; // @[ParallelMux.scala 134:10]
  wire [38:0] selectedInfo_res_1_first_target = s2_resps__1_valid ? s2_resps__1_bits_target : s2_resps__0_bits_target; // @[ParallelMux.scala 134:10]
  wire [38:0] selectedInfo_res_2_first_target = s2_resps__2_valid ? s2_resps__2_bits_target :
    selectedInfo_res_1_first_target; // @[ParallelMux.scala 134:10]
  wire [38:0] selectedInfo_first_target = selectedInfo_res_hasOne ? selectedInfo_res_first_target :
    selectedInfo_res_2_first_target; // @[ParallelMux.scala 134:10]
  wire [38:0] _s2_tageTarget_T_4 = _s2_tageTaken_T_1 ? selectedInfo_first_target : 39'h0; // @[Mux.scala 27:73]
  wire [38:0] _selectedInfo_T_41 = _selectedInfo_T_33 ? s2_resps__0_bits_target : 39'h0; // @[Mux.scala 27:73]
  wire [38:0] _selectedInfo_T_42 = s2_resps__1_valid ? s2_resps__0_bits_target : 39'h0; // @[Mux.scala 27:73]
  wire [38:0] selectedInfo_res_1_second_target = _selectedInfo_T_41 | _selectedInfo_T_42; // @[Mux.scala 27:73]
  wire [38:0] _selectedInfo_T_69 = _selectedInfo_T_61 ? selectedInfo_res_1_second_target : 39'h0; // @[Mux.scala 27:73]
  wire [38:0] _selectedInfo_T_70 = s2_resps__2_valid ? selectedInfo_res_1_first_target : 39'h0; // @[Mux.scala 27:73]
  wire [38:0] selectedInfo_res_2_second_target = _selectedInfo_T_69 | _selectedInfo_T_70; // @[Mux.scala 27:73]
  wire [38:0] _selectedInfo_T_97 = _selectedInfo_T_89 ? selectedInfo_res_2_second_target : 39'h0; // @[Mux.scala 27:73]
  wire [38:0] _selectedInfo_T_98 = _selectedInfo_T_91 ? selectedInfo_res_2_first_target : 39'h0; // @[Mux.scala 27:73]
  wire [38:0] _selectedInfo_T_100 = _selectedInfo_T_97 | _selectedInfo_T_98; // @[Mux.scala 27:73]
  wire [38:0] _selectedInfo_T_13 = _selectedInfo_T_5 ? s2_resps__3_bits_target : 39'h0; // @[Mux.scala 27:73]
  wire [38:0] _selectedInfo_T_14 = s2_resps__4_valid ? s2_resps__3_bits_target : 39'h0; // @[Mux.scala 27:73]
  wire [38:0] selectedInfo_res_second_target = _selectedInfo_T_13 | _selectedInfo_T_14; // @[Mux.scala 27:73]
  wire [38:0] _selectedInfo_T_99 = selectedInfo_res_hasTwo ? selectedInfo_res_second_target : 39'h0; // @[Mux.scala 27:73]
  wire [38:0] selectedInfo_second_target = _selectedInfo_T_100 | _selectedInfo_T_99; // @[Mux.scala 27:73]
  wire [38:0] _s2_tageTarget_T_5 = _s2_tageTaken_T_3 ? selectedInfo_second_target : 39'h0; // @[Mux.scala 27:73]
  wire [38:0] _s2_tageTarget_T_7 = _s2_tageTarget_T_4 | _s2_tageTarget_T_5; // @[Mux.scala 27:73]
  wire [38:0] _s2_tageTarget_T_6 = _s2_tageTaken_T_5 ? io_in_bits_resp_in_0_s2_full_pred_jalr_target : 39'h0; // @[Mux.scala 27:73]
  wire [38:0] s2_tageTarget = _s2_tageTarget_T_7 | _s2_tageTarget_T_6; // @[Mux.scala 27:73]
  reg [38:0] s3_providerTarget; // @[Reg.scala 16:16]
  reg [38:0] s3_altProviderTarget; // @[Reg.scala 16:16]
  reg  s3_provided; // @[Reg.scala 16:16]
  reg [2:0] s3_provider; // @[Reg.scala 16:16]
  wire [2:0] selectedInfo_res_first_tableIdx = s2_resps__4_valid ? 3'h4 : 3'h3; // @[ParallelMux.scala 134:10]
  wire [2:0] selectedInfo_res_1_first_tableIdx = s2_resps__1_valid ? 3'h1 : 3'h0; // @[ParallelMux.scala 134:10]
  wire [2:0] selectedInfo_res_2_first_tableIdx = s2_resps__2_valid ? 3'h2 : selectedInfo_res_1_first_tableIdx; // @[ParallelMux.scala 134:10]
  wire [2:0] selectedInfo_first_tableIdx = selectedInfo_res_hasOne ? selectedInfo_res_first_tableIdx :
    selectedInfo_res_2_first_tableIdx; // @[ParallelMux.scala 134:10]
  reg  s3_altProvided; // @[Reg.scala 16:16]
  reg [2:0] s3_altProvider; // @[Reg.scala 16:16]
  wire [2:0] selectedInfo_res_2_second_tableIdx = s2_resps__2_valid ? selectedInfo_res_1_first_tableIdx : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _selectedInfo_T_92 = _selectedInfo_T_89 ? selectedInfo_res_2_second_tableIdx : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _selectedInfo_T_93 = _selectedInfo_T_91 ? selectedInfo_res_2_first_tableIdx : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _selectedInfo_T_95 = _selectedInfo_T_92 | _selectedInfo_T_93; // @[Mux.scala 27:73]
  wire [2:0] _selectedInfo_T_8 = _selectedInfo_T_5 ? 3'h3 : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _selectedInfo_T_9 = s2_resps__4_valid ? 3'h3 : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] selectedInfo_res_second_tableIdx = _selectedInfo_T_8 | _selectedInfo_T_9; // @[Mux.scala 27:73]
  wire [2:0] _selectedInfo_T_94 = selectedInfo_res_hasTwo ? selectedInfo_res_second_tableIdx : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] selectedInfo_second_tableIdx = _selectedInfo_T_95 | _selectedInfo_T_94; // @[Mux.scala 27:73]
  reg  s3_finalAltPred; // @[Reg.scala 16:16]
  reg  s3_providerU; // @[Reg.scala 16:16]
  wire [1:0] selectedInfo_res_first_u = s2_resps__4_valid ? s2_resps__4_bits_u : s2_resps__3_bits_u; // @[ParallelMux.scala 134:10]
  wire [1:0] selectedInfo_res_1_first_u = s2_resps__1_valid ? s2_resps__1_bits_u : s2_resps__0_bits_u; // @[ParallelMux.scala 134:10]
  wire [1:0] selectedInfo_res_2_first_u = s2_resps__2_valid ? s2_resps__2_bits_u : selectedInfo_res_1_first_u; // @[ParallelMux.scala 134:10]
  wire [1:0] selectedInfo_first_u = selectedInfo_res_hasOne ? selectedInfo_res_first_u : selectedInfo_res_2_first_u; // @[ParallelMux.scala 134:10]
  wire  s2_providerU = selectedInfo_first_u[0]; // @[ITTAGE.scala 396:34 485:21]
  reg [1:0] s3_providerCtr; // @[Reg.scala 16:16]
  reg [1:0] s3_altProviderCtr; // @[Reg.scala 16:16]
  reg  resp_meta_allocate_valid_r; // @[Reg.scala 16:16]
  reg [2:0] resp_meta_allocate_bits_r; // @[Reg.scala 16:16]
  wire [84:0] io_out_last_stage_meta_lo = {s3_altProviderCtr,resp_meta_allocate_valid_r,resp_meta_allocate_bits_r,
    s3_tageTaken,s3_providerTarget,s3_altProviderTarget}; // @[ITTAGE.scala 416:39]
  wire  resp_meta_altDiffers = s3_finalAltPred != s3_tageTaken; // @[ITTAGE.scala 501:50]
  wire [96:0] _io_out_last_stage_meta_T = {s3_provided,s3_provider,s3_altProvided,s3_altProvider,resp_meta_altDiffers,
    s3_providerU,s3_providerCtr,io_out_last_stage_meta_lo}; // @[ITTAGE.scala 416:39]
  wire  _updateValid_T = io_update_bits_ftb_entry_tailSlot_valid & io_update_bits_ftb_entry_isJalr; // @[FrontendBundle.scala 611:42]
  wire  _updateValid_T_1 = io_update_bits_ftb_entry_tailSlot_valid & io_update_bits_ftb_entry_isRet; // @[FrontendBundle.scala 613:41]
  wire  _updateValid_T_6 = io_update_bits_ftb_entry_tailSlot_valid & ~io_update_bits_ftb_entry_tailSlot_sharing; // @[FTB.scala 207:20]
  wire  updateValid = _updateValid_T & ~_updateValid_T_1 & io_update_valid & _updateValid_T_6 & io_update_bits_jmp_taken
    ; // @[ITTAGE.scala 422:78]
  wire [38:0] updateMeta_altProviderTarget = io_update_bits_meta[38:0]; // @[ITTAGE.scala 427:40]
  wire [38:0] updateMeta_providerTarget = io_update_bits_meta[77:39]; // @[ITTAGE.scala 427:40]
  wire [2:0] updateMeta_allocate_bits = io_update_bits_meta[81:79]; // @[ITTAGE.scala 427:40]
  wire  updateMeta_allocate_valid = io_update_bits_meta[82]; // @[ITTAGE.scala 427:40]
  wire [1:0] updateMeta_altProviderCtr = io_update_bits_meta[84:83]; // @[ITTAGE.scala 427:40]
  wire [1:0] updateMeta_providerCtr = io_update_bits_meta[86:85]; // @[ITTAGE.scala 427:40]
  wire  updateMeta_providerU = io_update_bits_meta[87]; // @[ITTAGE.scala 427:40]
  wire  updateMeta_altDiffers = io_update_bits_meta[88]; // @[ITTAGE.scala 427:40]
  wire [2:0] updateMeta_altProvider_bits = io_update_bits_meta[91:89]; // @[ITTAGE.scala 427:40]
  wire  updateMeta_altProvider_valid = io_update_bits_meta[92]; // @[ITTAGE.scala 427:40]
  wire [2:0] updateMeta_provider_bits = io_update_bits_meta[95:93]; // @[ITTAGE.scala 427:40]
  wire  updateMeta_provider_valid = io_update_bits_meta[96]; // @[ITTAGE.scala 427:40]
  wire  _s2_allocatableSlots_T_2 = ~s2_resps__0_valid & s2_resps__0_bits_u == 2'h0; // @[ITTAGE.scala 512:64]
  wire  _s2_allocatableSlots_T_5 = _selectedInfo_T_33 & s2_resps__1_bits_u == 2'h0; // @[ITTAGE.scala 512:64]
  wire  _s2_allocatableSlots_T_8 = _selectedInfo_T_61 & s2_resps__2_bits_u == 2'h0; // @[ITTAGE.scala 512:64]
  wire  _s2_allocatableSlots_T_11 = ~s2_resps__3_valid & s2_resps__3_bits_u == 2'h0; // @[ITTAGE.scala 512:64]
  wire  _s2_allocatableSlots_T_14 = _selectedInfo_T_5 & s2_resps__4_bits_u == 2'h0; // @[ITTAGE.scala 512:64]
  wire [4:0] _s2_allocatableSlots_T_15 = {_s2_allocatableSlots_T_14,_s2_allocatableSlots_T_11,_s2_allocatableSlots_T_8,
    _s2_allocatableSlots_T_5,_s2_allocatableSlots_T_2}; // @[ITTAGE.scala 512:79]
  wire [7:0] _s2_allocatableSlots_T_16 = 8'h1 << selectedInfo_first_tableIdx; // @[OneHot.scala 57:35]
  wire [7:0] _GEN_346 = {{1'd0}, _s2_allocatableSlots_T_16[7:1]}; // @[ParallelMux.scala 36:53]
  wire [7:0] _s2_allocatableSlots_T_22 = _s2_allocatableSlots_T_16 | _GEN_346; // @[ParallelMux.scala 36:53]
  wire [4:0] _GEN_347 = {{1'd0}, _s2_allocatableSlots_T_16[7:4]}; // @[ParallelMux.scala 36:53]
  wire [4:0] _s2_allocatableSlots_T_23 = _s2_allocatableSlots_T_16[7:3] | _GEN_347; // @[ParallelMux.scala 36:53]
  wire [7:0] _s2_allocatableSlots_WIRE_2 = {{3'd0}, _s2_allocatableSlots_T_23}; // @[ParallelMux.scala 36:{73,73}]
  wire [7:0] _GEN_348 = {{2'd0}, _s2_allocatableSlots_T_16[7:2]}; // @[ParallelMux.scala 36:53]
  wire [7:0] _s2_allocatableSlots_T_24 = _GEN_348 | _s2_allocatableSlots_WIRE_2; // @[ParallelMux.scala 36:53]
  wire [7:0] _s2_allocatableSlots_T_25 = _s2_allocatableSlots_T_22 | _s2_allocatableSlots_T_24; // @[ParallelMux.scala 36:53]
  wire [4:0] _s2_allocatableSlots_T_27 = selectedInfo_hasOne ? 5'h1f : 5'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _GEN_349 = {{3'd0}, _s2_allocatableSlots_T_27}; // @[ITTAGE.scala 513:55]
  wire [7:0] _s2_allocatableSlots_T_28 = _s2_allocatableSlots_T_25 & _GEN_349; // @[ITTAGE.scala 513:55]
  wire [7:0] _s2_allocatableSlots_T_29 = ~_s2_allocatableSlots_T_28; // @[ITTAGE.scala 513:5]
  wire [7:0] _GEN_350 = {{3'd0}, _s2_allocatableSlots_T_15}; // @[ITTAGE.scala 512:86]
  wire [7:0] s2_allocatableSlots = _GEN_350 & _s2_allocatableSlots_T_29; // @[ITTAGE.scala 512:86]
  reg [63:0] s2_allocLFSR_lfsr; // @[LFSR64.scala 27:33]
  wire  s2_allocLFSR_xor = s2_allocLFSR_lfsr[0] ^ s2_allocLFSR_lfsr[1] ^ s2_allocLFSR_lfsr[3] ^ s2_allocLFSR_lfsr[4]; // @[LFSR64.scala 29:43]
  wire [63:0] _s2_allocLFSR_lfsr_T_2 = {s2_allocLFSR_xor,s2_allocLFSR_lfsr[63:1]}; // @[Cat.scala 31:58]
  wire [4:0] s2_allocLFSR = s2_allocLFSR_lfsr[4:0]; // @[ITTAGE.scala 514:32]
  wire [2:0] _s2_firstEntry_T_8 = s2_allocatableSlots[6] ? 3'h6 : 3'h7; // @[Mux.scala 47:70]
  wire [2:0] _s2_firstEntry_T_9 = s2_allocatableSlots[5] ? 3'h5 : _s2_firstEntry_T_8; // @[Mux.scala 47:70]
  wire [2:0] _s2_firstEntry_T_10 = s2_allocatableSlots[4] ? 3'h4 : _s2_firstEntry_T_9; // @[Mux.scala 47:70]
  wire [2:0] _s2_firstEntry_T_11 = s2_allocatableSlots[3] ? 3'h3 : _s2_firstEntry_T_10; // @[Mux.scala 47:70]
  wire [2:0] _s2_firstEntry_T_12 = s2_allocatableSlots[2] ? 3'h2 : _s2_firstEntry_T_11; // @[Mux.scala 47:70]
  wire [7:0] _GEN_351 = {{3'd0}, s2_allocLFSR}; // @[ITTAGE.scala 516:60]
  wire [7:0] _s2_maskedEntry_T = s2_allocatableSlots & _GEN_351; // @[ITTAGE.scala 516:60]
  wire [2:0] _s2_maskedEntry_T_9 = _s2_maskedEntry_T[6] ? 3'h6 : 3'h7; // @[Mux.scala 47:70]
  wire [2:0] _s2_maskedEntry_T_10 = _s2_maskedEntry_T[5] ? 3'h5 : _s2_maskedEntry_T_9; // @[Mux.scala 47:70]
  wire [2:0] _s2_maskedEntry_T_11 = _s2_maskedEntry_T[4] ? 3'h4 : _s2_maskedEntry_T_10; // @[Mux.scala 47:70]
  wire [2:0] _s2_maskedEntry_T_12 = _s2_maskedEntry_T[3] ? 3'h3 : _s2_maskedEntry_T_11; // @[Mux.scala 47:70]
  wire [2:0] _s2_maskedEntry_T_13 = _s2_maskedEntry_T[2] ? 3'h2 : _s2_maskedEntry_T_12; // @[Mux.scala 47:70]
  wire [2:0] _s2_maskedEntry_T_14 = _s2_maskedEntry_T[1] ? 3'h1 : _s2_maskedEntry_T_13; // @[Mux.scala 47:70]
  wire [2:0] s2_maskedEntry = _s2_maskedEntry_T[0] ? 3'h0 : _s2_maskedEntry_T_14; // @[Mux.scala 47:70]
  wire [7:0] _s2_allocEntry_T = s2_allocatableSlots >> s2_maskedEntry; // @[ITTAGE.scala 517:47]
  wire  _resp_meta_allocate_valid_T = s2_allocatableSlots != 8'h0; // @[ITTAGE.scala 518:61]
  wire  _usedAltpred_T = updateMeta_providerCtr == 2'h0; // @[ITTAGE.scala 528:80]
  wire  usedAltpred = updateMeta_altProvider_valid & updateMeta_providerCtr == 2'h0; // @[ITTAGE.scala 528:54]
  wire  _GEN_43 = 3'h0 == updateMeta_altProvider_bits; // @[ITTAGE.scala 532:{36,36}]
  wire  _GEN_44 = 3'h1 == updateMeta_altProvider_bits; // @[ITTAGE.scala 532:{36,36}]
  wire  _GEN_45 = 3'h2 == updateMeta_altProvider_bits; // @[ITTAGE.scala 532:{36,36}]
  wire  _GEN_46 = 3'h3 == updateMeta_altProvider_bits; // @[ITTAGE.scala 532:{36,36}]
  wire  _GEN_47 = 3'h4 == updateMeta_altProvider_bits; // @[ITTAGE.scala 532:{36,36}]
  wire  _GEN_78 = usedAltpred & io_update_bits_mispred_mask_2 & _GEN_43; // @[ITTAGE.scala 529:43]
  wire  _GEN_79 = usedAltpred & io_update_bits_mispred_mask_2 & _GEN_44; // @[ITTAGE.scala 529:43]
  wire  _GEN_80 = usedAltpred & io_update_bits_mispred_mask_2 & _GEN_45; // @[ITTAGE.scala 529:43]
  wire  _GEN_81 = usedAltpred & io_update_bits_mispred_mask_2 & _GEN_46; // @[ITTAGE.scala 529:43]
  wire  _GEN_82 = usedAltpred & io_update_bits_mispred_mask_2 & _GEN_47; // @[ITTAGE.scala 529:43]
  wire  _GEN_352 = 3'h0 == updateMeta_provider_bits; // @[ITTAGE.scala 542:{30,30}]
  wire  _GEN_113 = 3'h0 == updateMeta_provider_bits | _GEN_78; // @[ITTAGE.scala 542:{30,30}]
  wire  _GEN_353 = 3'h1 == updateMeta_provider_bits; // @[ITTAGE.scala 542:{30,30}]
  wire  _GEN_114 = 3'h1 == updateMeta_provider_bits | _GEN_79; // @[ITTAGE.scala 542:{30,30}]
  wire  _GEN_354 = 3'h2 == updateMeta_provider_bits; // @[ITTAGE.scala 542:{30,30}]
  wire  _GEN_115 = 3'h2 == updateMeta_provider_bits | _GEN_80; // @[ITTAGE.scala 542:{30,30}]
  wire  _GEN_355 = 3'h3 == updateMeta_provider_bits; // @[ITTAGE.scala 542:{30,30}]
  wire  _GEN_116 = 3'h3 == updateMeta_provider_bits | _GEN_81; // @[ITTAGE.scala 542:{30,30}]
  wire  _GEN_356 = 3'h4 == updateMeta_provider_bits; // @[ITTAGE.scala 542:{30,30}]
  wire  _GEN_117 = 3'h4 == updateMeta_provider_bits | _GEN_82; // @[ITTAGE.scala 542:{30,30}]
  wire  _updateU_T_2 = ~updateMeta_altDiffers ? updateMeta_providerU : ~io_update_bits_mispred_mask_2; // @[ITTAGE.scala 545:31]
  wire  _updateCorrect_T = updateMeta_providerTarget == io_update_bits_full_target; // @[ITTAGE.scala 546:61]
  wire  _GEN_128 = _GEN_352 & updateMeta_providerTarget == io_update_bits_full_target; // @[ITTAGE.scala 546:{32,32}]
  wire  _GEN_129 = _GEN_353 & updateMeta_providerTarget == io_update_bits_full_target; // @[ITTAGE.scala 546:{32,32}]
  wire  _GEN_130 = _GEN_354 & updateMeta_providerTarget == io_update_bits_full_target; // @[ITTAGE.scala 546:{32,32}]
  wire  _GEN_131 = _GEN_355 & updateMeta_providerTarget == io_update_bits_full_target; // @[ITTAGE.scala 546:{32,32}]
  wire  _GEN_132 = _GEN_356 & updateMeta_providerTarget == io_update_bits_full_target; // @[ITTAGE.scala 546:{32,32}]
  wire  _GEN_153 = updateMeta_provider_valid & _GEN_113; // @[ITTAGE.scala 524:38]
  wire  _GEN_154 = updateMeta_provider_valid & _GEN_114; // @[ITTAGE.scala 524:38]
  wire  _GEN_155 = updateMeta_provider_valid & _GEN_115; // @[ITTAGE.scala 524:38]
  wire  _GEN_156 = updateMeta_provider_valid & _GEN_116; // @[ITTAGE.scala 524:38]
  wire  _GEN_157 = updateMeta_provider_valid & _GEN_117; // @[ITTAGE.scala 524:38]
  wire  _GEN_158 = updateMeta_provider_valid & _GEN_352; // @[ITTAGE.scala 524:38]
  wire  _GEN_159 = updateMeta_provider_valid & _GEN_353; // @[ITTAGE.scala 524:38]
  wire  _GEN_160 = updateMeta_provider_valid & _GEN_354; // @[ITTAGE.scala 524:38]
  wire  _GEN_161 = updateMeta_provider_valid & _GEN_355; // @[ITTAGE.scala 524:38]
  wire  _GEN_162 = updateMeta_provider_valid & _GEN_356; // @[ITTAGE.scala 524:38]
  wire  _GEN_193 = updateValid & _GEN_153; // @[ITTAGE.scala 523:22]
  wire  _GEN_194 = updateValid & _GEN_154; // @[ITTAGE.scala 523:22]
  wire  _GEN_195 = updateValid & _GEN_155; // @[ITTAGE.scala 523:22]
  wire  _GEN_196 = updateValid & _GEN_156; // @[ITTAGE.scala 523:22]
  wire  _GEN_197 = updateValid & _GEN_157; // @[ITTAGE.scala 523:22]
  wire  _GEN_198 = updateValid & _GEN_158; // @[ITTAGE.scala 523:22]
  wire  _GEN_199 = updateValid & _GEN_159; // @[ITTAGE.scala 523:22]
  wire  _GEN_200 = updateValid & _GEN_160; // @[ITTAGE.scala 523:22]
  wire  _GEN_201 = updateValid & _GEN_161; // @[ITTAGE.scala 523:22]
  wire  _GEN_202 = updateValid & _GEN_162; // @[ITTAGE.scala 523:22]
  wire  providerCorrect = updateMeta_provider_valid & _updateCorrect_T; // @[ITTAGE.scala 556:51]
  wire  _tickCtr_T = ~updateMeta_allocate_valid; // @[ITTAGE.scala 560:46]
  wire  tickCtr_oldSatTaken = tickCtr == 8'hff; // @[BPU.scala 87:27]
  wire  tickCtr_oldSatNotTaken = tickCtr == 8'h0; // @[BPU.scala 88:30]
  wire [7:0] _tickCtr_T_5 = tickCtr + 8'h1; // @[BPU.scala 91:24]
  wire [7:0] _tickCtr_T_7 = tickCtr - 8'h1; // @[BPU.scala 91:35]
  wire [7:0] _tickCtr_T_8 = _tickCtr_T ? _tickCtr_T_5 : _tickCtr_T_7; // @[BPU.scala 91:12]
  wire  _GEN_362 = 3'h0 == updateMeta_allocate_bits; // @[ITTAGE.scala 563:{34,34}]
  wire  _GEN_233 = 3'h0 == updateMeta_allocate_bits | _GEN_193; // @[ITTAGE.scala 563:{34,34}]
  wire  _GEN_363 = 3'h1 == updateMeta_allocate_bits; // @[ITTAGE.scala 563:{34,34}]
  wire  _GEN_234 = 3'h1 == updateMeta_allocate_bits | _GEN_194; // @[ITTAGE.scala 563:{34,34}]
  wire  _GEN_364 = 3'h2 == updateMeta_allocate_bits; // @[ITTAGE.scala 563:{34,34}]
  wire  _GEN_235 = 3'h2 == updateMeta_allocate_bits | _GEN_195; // @[ITTAGE.scala 563:{34,34}]
  wire  _GEN_365 = 3'h3 == updateMeta_allocate_bits; // @[ITTAGE.scala 563:{34,34}]
  wire  _GEN_236 = 3'h3 == updateMeta_allocate_bits | _GEN_196; // @[ITTAGE.scala 563:{34,34}]
  wire  _GEN_366 = 3'h4 == updateMeta_allocate_bits; // @[ITTAGE.scala 563:{34,34}]
  wire  _GEN_237 = 3'h4 == updateMeta_allocate_bits | _GEN_197; // @[ITTAGE.scala 563:{34,34}]
  wire  _GEN_238 = _GEN_362 | _GEN_128; // @[ITTAGE.scala 564:{36,36}]
  wire  _GEN_239 = _GEN_363 | _GEN_129; // @[ITTAGE.scala 564:{36,36}]
  wire  _GEN_240 = _GEN_364 | _GEN_130; // @[ITTAGE.scala 564:{36,36}]
  wire  _GEN_241 = _GEN_365 | _GEN_131; // @[ITTAGE.scala 564:{36,36}]
  wire  _GEN_242 = _GEN_366 | _GEN_132; // @[ITTAGE.scala 564:{36,36}]
  wire  _GEN_253 = _GEN_362 | _GEN_198; // @[ITTAGE.scala 567:{34,34}]
  wire  _GEN_254 = _GEN_363 | _GEN_199; // @[ITTAGE.scala 567:{34,34}]
  wire  _GEN_255 = _GEN_364 | _GEN_200; // @[ITTAGE.scala 567:{34,34}]
  wire  _GEN_256 = _GEN_365 | _GEN_201; // @[ITTAGE.scala 567:{34,34}]
  wire  _GEN_257 = _GEN_366 | _GEN_202; // @[ITTAGE.scala 567:{34,34}]
  wire  _GEN_278 = updateMeta_allocate_valid & _GEN_362; // @[ITTAGE.scala 561:27]
  wire  _GEN_279 = updateMeta_allocate_valid & _GEN_363; // @[ITTAGE.scala 561:27]
  wire  _GEN_280 = updateMeta_allocate_valid & _GEN_364; // @[ITTAGE.scala 561:27]
  wire  _GEN_281 = updateMeta_allocate_valid & _GEN_365; // @[ITTAGE.scala 561:27]
  wire  _GEN_282 = updateMeta_allocate_valid & _GEN_366; // @[ITTAGE.scala 561:27]
  reg  tables_0_io_update_valid_REG; // @[ITTAGE.scala 582:41]
  reg  tables_0_io_update_correct_REG; // @[ITTAGE.scala 583:43]
  reg [38:0] tables_0_io_update_target_REG; // @[ITTAGE.scala 584:42]
  reg [38:0] tables_0_io_update_old_target_REG; // @[ITTAGE.scala 585:46]
  reg  tables_0_io_update_alloc_REG; // @[ITTAGE.scala 586:41]
  reg [1:0] tables_0_io_update_oldCtr_REG; // @[ITTAGE.scala 587:42]
  reg  tables_0_io_update_reset_u_REG; // @[ITTAGE.scala 589:43]
  reg  tables_0_io_update_uValid_REG; // @[ITTAGE.scala 590:42]
  reg  tables_0_io_update_u_REG; // @[ITTAGE.scala 591:37]
  reg [38:0] tables_0_io_update_pc_REG; // @[ITTAGE.scala 592:38]
  reg [3:0] tables_0_io_update_folded_hist_REG_hist_4_folded_hist; // @[ITTAGE.scala 594:47]
  reg  tables_1_io_update_valid_REG; // @[ITTAGE.scala 582:41]
  reg  tables_1_io_update_correct_REG; // @[ITTAGE.scala 583:43]
  reg [38:0] tables_1_io_update_target_REG; // @[ITTAGE.scala 584:42]
  reg [38:0] tables_1_io_update_old_target_REG; // @[ITTAGE.scala 585:46]
  reg  tables_1_io_update_alloc_REG; // @[ITTAGE.scala 586:41]
  reg [1:0] tables_1_io_update_oldCtr_REG; // @[ITTAGE.scala 587:42]
  reg  tables_1_io_update_reset_u_REG; // @[ITTAGE.scala 589:43]
  reg  tables_1_io_update_uValid_REG; // @[ITTAGE.scala 590:42]
  reg  tables_1_io_update_u_REG; // @[ITTAGE.scala 591:37]
  reg [38:0] tables_1_io_update_pc_REG; // @[ITTAGE.scala 592:38]
  reg [7:0] tables_1_io_update_folded_hist_REG_hist_8_folded_hist; // @[ITTAGE.scala 594:47]
  reg  tables_2_io_update_valid_REG; // @[ITTAGE.scala 582:41]
  reg  tables_2_io_update_correct_REG; // @[ITTAGE.scala 583:43]
  reg [38:0] tables_2_io_update_target_REG; // @[ITTAGE.scala 584:42]
  reg [38:0] tables_2_io_update_old_target_REG; // @[ITTAGE.scala 585:46]
  reg  tables_2_io_update_alloc_REG; // @[ITTAGE.scala 586:41]
  reg [1:0] tables_2_io_update_oldCtr_REG; // @[ITTAGE.scala 587:42]
  reg  tables_2_io_update_reset_u_REG; // @[ITTAGE.scala 589:43]
  reg  tables_2_io_update_uValid_REG; // @[ITTAGE.scala 590:42]
  reg  tables_2_io_update_u_REG; // @[ITTAGE.scala 591:37]
  reg [38:0] tables_2_io_update_pc_REG; // @[ITTAGE.scala 592:38]
  reg [7:0] tables_2_io_update_folded_hist_REG_hist_17_folded_hist; // @[ITTAGE.scala 594:47]
  reg [8:0] tables_2_io_update_folded_hist_REG_hist_6_folded_hist; // @[ITTAGE.scala 594:47]
  reg  tables_3_io_update_valid_REG; // @[ITTAGE.scala 582:41]
  reg  tables_3_io_update_correct_REG; // @[ITTAGE.scala 583:43]
  reg [38:0] tables_3_io_update_target_REG; // @[ITTAGE.scala 584:42]
  reg [38:0] tables_3_io_update_old_target_REG; // @[ITTAGE.scala 585:46]
  reg  tables_3_io_update_alloc_REG; // @[ITTAGE.scala 586:41]
  reg [1:0] tables_3_io_update_oldCtr_REG; // @[ITTAGE.scala 587:42]
  reg  tables_3_io_update_reset_u_REG; // @[ITTAGE.scala 589:43]
  reg  tables_3_io_update_uValid_REG; // @[ITTAGE.scala 590:42]
  reg  tables_3_io_update_u_REG; // @[ITTAGE.scala 591:37]
  reg [38:0] tables_3_io_update_pc_REG; // @[ITTAGE.scala 592:38]
  reg [8:0] tables_3_io_update_folded_hist_REG_hist_7_folded_hist; // @[ITTAGE.scala 594:47]
  reg [7:0] tables_3_io_update_folded_hist_REG_hist_0_folded_hist; // @[ITTAGE.scala 594:47]
  reg  tables_4_io_update_valid_REG; // @[ITTAGE.scala 582:41]
  reg  tables_4_io_update_correct_REG; // @[ITTAGE.scala 583:43]
  reg [38:0] tables_4_io_update_target_REG; // @[ITTAGE.scala 584:42]
  reg [38:0] tables_4_io_update_old_target_REG; // @[ITTAGE.scala 585:46]
  reg  tables_4_io_update_alloc_REG; // @[ITTAGE.scala 586:41]
  reg [1:0] tables_4_io_update_oldCtr_REG; // @[ITTAGE.scala 587:42]
  reg  tables_4_io_update_reset_u_REG; // @[ITTAGE.scala 589:43]
  reg  tables_4_io_update_uValid_REG; // @[ITTAGE.scala 590:42]
  reg  tables_4_io_update_u_REG; // @[ITTAGE.scala 591:37]
  reg [38:0] tables_4_io_update_pc_REG; // @[ITTAGE.scala 592:38]
  reg [8:0] tables_4_io_update_folded_hist_REG_hist_10_folded_hist; // @[ITTAGE.scala 594:47]
  reg [7:0] tables_4_io_update_folded_hist_REG_hist_1_folded_hist; // @[ITTAGE.scala 594:47]
  DelayN_2 reset_vector_delay ( // @[Hold.scala 97:23]
    .clock(reset_vector_delay_clock),
    .io_in(reset_vector_delay_io_in),
    .io_out(reset_vector_delay_io_out)
  );
  ITTageTable tables_0 ( // @[ITTAGE.scala 366:21]
    .clock(tables_0_clock),
    .reset(tables_0_reset),
    .io_req_ready(tables_0_io_req_ready),
    .io_req_valid(tables_0_io_req_valid),
    .io_req_bits_pc(tables_0_io_req_bits_pc),
    .io_req_bits_folded_hist_hist_4_folded_hist(tables_0_io_req_bits_folded_hist_hist_4_folded_hist),
    .io_resp_valid(tables_0_io_resp_valid),
    .io_resp_bits_ctr(tables_0_io_resp_bits_ctr),
    .io_resp_bits_u(tables_0_io_resp_bits_u),
    .io_resp_bits_target(tables_0_io_resp_bits_target),
    .io_update_pc(tables_0_io_update_pc),
    .io_update_folded_hist_hist_4_folded_hist(tables_0_io_update_folded_hist_hist_4_folded_hist),
    .io_update_valid(tables_0_io_update_valid),
    .io_update_correct(tables_0_io_update_correct),
    .io_update_alloc(tables_0_io_update_alloc),
    .io_update_oldCtr(tables_0_io_update_oldCtr),
    .io_update_uValid(tables_0_io_update_uValid),
    .io_update_u(tables_0_io_update_u),
    .io_update_reset_u(tables_0_io_update_reset_u),
    .io_update_target(tables_0_io_update_target),
    .io_update_old_target(tables_0_io_update_old_target)
  );
  ITTageTable_1 tables_1 ( // @[ITTAGE.scala 366:21]
    .clock(tables_1_clock),
    .reset(tables_1_reset),
    .io_req_ready(tables_1_io_req_ready),
    .io_req_valid(tables_1_io_req_valid),
    .io_req_bits_pc(tables_1_io_req_bits_pc),
    .io_req_bits_folded_hist_hist_8_folded_hist(tables_1_io_req_bits_folded_hist_hist_8_folded_hist),
    .io_resp_valid(tables_1_io_resp_valid),
    .io_resp_bits_ctr(tables_1_io_resp_bits_ctr),
    .io_resp_bits_u(tables_1_io_resp_bits_u),
    .io_resp_bits_target(tables_1_io_resp_bits_target),
    .io_update_pc(tables_1_io_update_pc),
    .io_update_folded_hist_hist_8_folded_hist(tables_1_io_update_folded_hist_hist_8_folded_hist),
    .io_update_valid(tables_1_io_update_valid),
    .io_update_correct(tables_1_io_update_correct),
    .io_update_alloc(tables_1_io_update_alloc),
    .io_update_oldCtr(tables_1_io_update_oldCtr),
    .io_update_uValid(tables_1_io_update_uValid),
    .io_update_u(tables_1_io_update_u),
    .io_update_reset_u(tables_1_io_update_reset_u),
    .io_update_target(tables_1_io_update_target),
    .io_update_old_target(tables_1_io_update_old_target)
  );
  ITTageTable_2 tables_2 ( // @[ITTAGE.scala 366:21]
    .clock(tables_2_clock),
    .reset(tables_2_reset),
    .io_req_ready(tables_2_io_req_ready),
    .io_req_valid(tables_2_io_req_valid),
    .io_req_bits_pc(tables_2_io_req_bits_pc),
    .io_req_bits_folded_hist_hist_17_folded_hist(tables_2_io_req_bits_folded_hist_hist_17_folded_hist),
    .io_req_bits_folded_hist_hist_6_folded_hist(tables_2_io_req_bits_folded_hist_hist_6_folded_hist),
    .io_resp_valid(tables_2_io_resp_valid),
    .io_resp_bits_ctr(tables_2_io_resp_bits_ctr),
    .io_resp_bits_u(tables_2_io_resp_bits_u),
    .io_resp_bits_target(tables_2_io_resp_bits_target),
    .io_update_pc(tables_2_io_update_pc),
    .io_update_folded_hist_hist_17_folded_hist(tables_2_io_update_folded_hist_hist_17_folded_hist),
    .io_update_folded_hist_hist_6_folded_hist(tables_2_io_update_folded_hist_hist_6_folded_hist),
    .io_update_valid(tables_2_io_update_valid),
    .io_update_correct(tables_2_io_update_correct),
    .io_update_alloc(tables_2_io_update_alloc),
    .io_update_oldCtr(tables_2_io_update_oldCtr),
    .io_update_uValid(tables_2_io_update_uValid),
    .io_update_u(tables_2_io_update_u),
    .io_update_reset_u(tables_2_io_update_reset_u),
    .io_update_target(tables_2_io_update_target),
    .io_update_old_target(tables_2_io_update_old_target)
  );
  ITTageTable_3 tables_3 ( // @[ITTAGE.scala 366:21]
    .clock(tables_3_clock),
    .reset(tables_3_reset),
    .io_req_ready(tables_3_io_req_ready),
    .io_req_valid(tables_3_io_req_valid),
    .io_req_bits_pc(tables_3_io_req_bits_pc),
    .io_req_bits_folded_hist_hist_7_folded_hist(tables_3_io_req_bits_folded_hist_hist_7_folded_hist),
    .io_req_bits_folded_hist_hist_0_folded_hist(tables_3_io_req_bits_folded_hist_hist_0_folded_hist),
    .io_resp_valid(tables_3_io_resp_valid),
    .io_resp_bits_ctr(tables_3_io_resp_bits_ctr),
    .io_resp_bits_u(tables_3_io_resp_bits_u),
    .io_resp_bits_target(tables_3_io_resp_bits_target),
    .io_update_pc(tables_3_io_update_pc),
    .io_update_folded_hist_hist_7_folded_hist(tables_3_io_update_folded_hist_hist_7_folded_hist),
    .io_update_folded_hist_hist_0_folded_hist(tables_3_io_update_folded_hist_hist_0_folded_hist),
    .io_update_valid(tables_3_io_update_valid),
    .io_update_correct(tables_3_io_update_correct),
    .io_update_alloc(tables_3_io_update_alloc),
    .io_update_oldCtr(tables_3_io_update_oldCtr),
    .io_update_uValid(tables_3_io_update_uValid),
    .io_update_u(tables_3_io_update_u),
    .io_update_reset_u(tables_3_io_update_reset_u),
    .io_update_target(tables_3_io_update_target),
    .io_update_old_target(tables_3_io_update_old_target)
  );
  ITTageTable_4 tables_4 ( // @[ITTAGE.scala 366:21]
    .clock(tables_4_clock),
    .reset(tables_4_reset),
    .io_req_ready(tables_4_io_req_ready),
    .io_req_valid(tables_4_io_req_valid),
    .io_req_bits_pc(tables_4_io_req_bits_pc),
    .io_req_bits_folded_hist_hist_10_folded_hist(tables_4_io_req_bits_folded_hist_hist_10_folded_hist),
    .io_req_bits_folded_hist_hist_1_folded_hist(tables_4_io_req_bits_folded_hist_hist_1_folded_hist),
    .io_resp_valid(tables_4_io_resp_valid),
    .io_resp_bits_ctr(tables_4_io_resp_bits_ctr),
    .io_resp_bits_u(tables_4_io_resp_bits_u),
    .io_resp_bits_target(tables_4_io_resp_bits_target),
    .io_update_pc(tables_4_io_update_pc),
    .io_update_folded_hist_hist_10_folded_hist(tables_4_io_update_folded_hist_hist_10_folded_hist),
    .io_update_folded_hist_hist_1_folded_hist(tables_4_io_update_folded_hist_hist_1_folded_hist),
    .io_update_valid(tables_4_io_update_valid),
    .io_update_correct(tables_4_io_update_correct),
    .io_update_alloc(tables_4_io_update_alloc),
    .io_update_oldCtr(tables_4_io_update_oldCtr),
    .io_update_uValid(tables_4_io_update_uValid),
    .io_update_u(tables_4_io_update_u),
    .io_update_reset_u(tables_4_io_update_reset_u),
    .io_update_target(tables_4_io_update_target),
    .io_update_old_target(tables_4_io_update_old_target)
  );
  assign io_out_s2_full_pred_br_taken_mask_0 = io_in_bits_resp_in_0_s2_full_pred_br_taken_mask_0; // @[BPU.scala 193:10]
  assign io_out_s2_full_pred_br_taken_mask_1 = io_in_bits_resp_in_0_s2_full_pred_br_taken_mask_1; // @[BPU.scala 193:10]
  assign io_out_s2_full_pred_slot_valids_0 = io_in_bits_resp_in_0_s2_full_pred_slot_valids_0; // @[BPU.scala 193:10]
  assign io_out_s2_full_pred_slot_valids_1 = io_in_bits_resp_in_0_s2_full_pred_slot_valids_1; // @[BPU.scala 193:10]
  assign io_out_s2_full_pred_targets_0 = io_in_bits_resp_in_0_s2_full_pred_targets_0; // @[BPU.scala 193:10]
  assign io_out_s2_full_pred_targets_1 = io_in_bits_resp_in_0_s2_full_pred_targets_1; // @[BPU.scala 193:10]
  assign io_out_s2_full_pred_jalr_target = io_in_bits_resp_in_0_s2_full_pred_jalr_target; // @[BPU.scala 193:10]
  assign io_out_s2_full_pred_offsets_0 = io_in_bits_resp_in_0_s2_full_pred_offsets_0; // @[BPU.scala 193:10]
  assign io_out_s2_full_pred_offsets_1 = io_in_bits_resp_in_0_s2_full_pred_offsets_1; // @[BPU.scala 193:10]
  assign io_out_s2_full_pred_fallThroughAddr = io_in_bits_resp_in_0_s2_full_pred_fallThroughAddr; // @[BPU.scala 193:10]
  assign io_out_s2_full_pred_fallThroughErr = io_in_bits_resp_in_0_s2_full_pred_fallThroughErr; // @[BPU.scala 193:10]
  assign io_out_s2_full_pred_is_jalr = io_in_bits_resp_in_0_s2_full_pred_is_jalr; // @[BPU.scala 193:10]
  assign io_out_s2_full_pred_is_call = io_in_bits_resp_in_0_s2_full_pred_is_call; // @[BPU.scala 193:10]
  assign io_out_s2_full_pred_is_ret = io_in_bits_resp_in_0_s2_full_pred_is_ret; // @[BPU.scala 193:10]
  assign io_out_s2_full_pred_last_may_be_rvi_call = io_in_bits_resp_in_0_s2_full_pred_last_may_be_rvi_call; // @[BPU.scala 193:10]
  assign io_out_s2_full_pred_is_br_sharing = io_in_bits_resp_in_0_s2_full_pred_is_br_sharing; // @[BPU.scala 193:10]
  assign io_out_s2_full_pred_hit = io_in_bits_resp_in_0_s2_full_pred_hit; // @[BPU.scala 193:10]
  assign io_out_s3_full_pred_br_taken_mask_0 = io_in_bits_resp_in_0_s3_full_pred_br_taken_mask_0; // @[BPU.scala 193:10]
  assign io_out_s3_full_pred_br_taken_mask_1 = io_in_bits_resp_in_0_s3_full_pred_br_taken_mask_1; // @[BPU.scala 193:10]
  assign io_out_s3_full_pred_slot_valids_0 = io_in_bits_resp_in_0_s3_full_pred_slot_valids_0; // @[BPU.scala 193:10]
  assign io_out_s3_full_pred_slot_valids_1 = io_in_bits_resp_in_0_s3_full_pred_slot_valids_1; // @[BPU.scala 193:10]
  assign io_out_s3_full_pred_targets_0 = io_in_bits_resp_in_0_s3_full_pred_targets_0; // @[BPU.scala 193:10]
  assign io_out_s3_full_pred_targets_1 = io_in_bits_resp_in_0_s3_full_pred_targets_1; // @[BPU.scala 193:10]
  assign io_out_s3_full_pred_jalr_target = s3_tageTaken ? s3_tageTarget : io_in_bits_resp_in_0_s3_full_pred_jalr_target; // @[BPU.scala 193:10 ITTAGE.scala 493:22 494:37]
  assign io_out_s3_full_pred_offsets_0 = io_in_bits_resp_in_0_s3_full_pred_offsets_0; // @[BPU.scala 193:10]
  assign io_out_s3_full_pred_offsets_1 = io_in_bits_resp_in_0_s3_full_pred_offsets_1; // @[BPU.scala 193:10]
  assign io_out_s3_full_pred_fallThroughAddr = io_in_bits_resp_in_0_s3_full_pred_fallThroughAddr; // @[BPU.scala 193:10]
  assign io_out_s3_full_pred_fallThroughErr = io_in_bits_resp_in_0_s3_full_pred_fallThroughErr; // @[BPU.scala 193:10]
  assign io_out_s3_full_pred_is_jalr = io_in_bits_resp_in_0_s3_full_pred_is_jalr; // @[BPU.scala 193:10]
  assign io_out_s3_full_pred_is_call = io_in_bits_resp_in_0_s3_full_pred_is_call; // @[BPU.scala 193:10]
  assign io_out_s3_full_pred_is_ret = io_in_bits_resp_in_0_s3_full_pred_is_ret; // @[BPU.scala 193:10]
  assign io_out_s3_full_pred_is_br_sharing = io_in_bits_resp_in_0_s3_full_pred_is_br_sharing; // @[BPU.scala 193:10]
  assign io_out_s3_full_pred_hit = io_in_bits_resp_in_0_s3_full_pred_hit; // @[BPU.scala 193:10]
  assign io_out_last_stage_meta = {{159'd0}, _io_out_last_stage_meta_T}; // @[ITTAGE.scala 416:26]
  assign io_out_last_stage_ftb_entry_valid = io_in_bits_resp_in_0_last_stage_ftb_entry_valid; // @[BPU.scala 193:10]
  assign io_out_last_stage_ftb_entry_brSlots_0_offset = io_in_bits_resp_in_0_last_stage_ftb_entry_brSlots_0_offset; // @[BPU.scala 193:10]
  assign io_out_last_stage_ftb_entry_brSlots_0_lower = io_in_bits_resp_in_0_last_stage_ftb_entry_brSlots_0_lower; // @[BPU.scala 193:10]
  assign io_out_last_stage_ftb_entry_brSlots_0_tarStat = io_in_bits_resp_in_0_last_stage_ftb_entry_brSlots_0_tarStat; // @[BPU.scala 193:10]
  assign io_out_last_stage_ftb_entry_brSlots_0_sharing = io_in_bits_resp_in_0_last_stage_ftb_entry_brSlots_0_sharing; // @[BPU.scala 193:10]
  assign io_out_last_stage_ftb_entry_brSlots_0_valid = io_in_bits_resp_in_0_last_stage_ftb_entry_brSlots_0_valid; // @[BPU.scala 193:10]
  assign io_out_last_stage_ftb_entry_tailSlot_offset = io_in_bits_resp_in_0_last_stage_ftb_entry_tailSlot_offset; // @[BPU.scala 193:10]
  assign io_out_last_stage_ftb_entry_tailSlot_lower = io_in_bits_resp_in_0_last_stage_ftb_entry_tailSlot_lower; // @[BPU.scala 193:10]
  assign io_out_last_stage_ftb_entry_tailSlot_tarStat = io_in_bits_resp_in_0_last_stage_ftb_entry_tailSlot_tarStat; // @[BPU.scala 193:10]
  assign io_out_last_stage_ftb_entry_tailSlot_sharing = io_in_bits_resp_in_0_last_stage_ftb_entry_tailSlot_sharing; // @[BPU.scala 193:10]
  assign io_out_last_stage_ftb_entry_tailSlot_valid = io_in_bits_resp_in_0_last_stage_ftb_entry_tailSlot_valid; // @[BPU.scala 193:10]
  assign io_out_last_stage_ftb_entry_pftAddr = io_in_bits_resp_in_0_last_stage_ftb_entry_pftAddr; // @[BPU.scala 193:10]
  assign io_out_last_stage_ftb_entry_carry = io_in_bits_resp_in_0_last_stage_ftb_entry_carry; // @[BPU.scala 193:10]
  assign io_out_last_stage_ftb_entry_isCall = io_in_bits_resp_in_0_last_stage_ftb_entry_isCall; // @[BPU.scala 193:10]
  assign io_out_last_stage_ftb_entry_isRet = io_in_bits_resp_in_0_last_stage_ftb_entry_isRet; // @[BPU.scala 193:10]
  assign io_out_last_stage_ftb_entry_isJalr = io_in_bits_resp_in_0_last_stage_ftb_entry_isJalr; // @[BPU.scala 193:10]
  assign io_out_last_stage_ftb_entry_last_may_be_rvi_call =
    io_in_bits_resp_in_0_last_stage_ftb_entry_last_may_be_rvi_call; // @[BPU.scala 193:10]
  assign io_out_last_stage_ftb_entry_always_taken_0 = io_in_bits_resp_in_0_last_stage_ftb_entry_always_taken_0; // @[BPU.scala 193:10]
  assign io_out_last_stage_ftb_entry_always_taken_1 = io_in_bits_resp_in_0_last_stage_ftb_entry_always_taken_1; // @[BPU.scala 193:10]
  assign reset_vector_delay_clock = clock;
  assign reset_vector_delay_io_in = io_reset_vector; // @[Hold.scala 98:17]
  assign tables_0_clock = clock;
  assign tables_0_reset = reset;
  assign tables_0_io_req_valid = io_s0_fire; // @[ITTAGE.scala 367:22]
  assign tables_0_io_req_bits_pc = io_in_bits_s0_pc; // @[ITTAGE.scala 368:24]
  assign tables_0_io_req_bits_folded_hist_hist_4_folded_hist = io_in_bits_folded_hist_hist_4_folded_hist; // @[ITTAGE.scala 369:33]
  assign tables_0_io_update_pc = tables_0_io_update_pc_REG; // @[ITTAGE.scala 592:28]
  assign tables_0_io_update_folded_hist_hist_4_folded_hist = tables_0_io_update_folded_hist_REG_hist_4_folded_hist; // @[ITTAGE.scala 594:37]
  assign tables_0_io_update_valid = tables_0_io_update_valid_REG; // @[ITTAGE.scala 582:31]
  assign tables_0_io_update_correct = tables_0_io_update_correct_REG; // @[ITTAGE.scala 583:33]
  assign tables_0_io_update_alloc = tables_0_io_update_alloc_REG; // @[ITTAGE.scala 586:31]
  assign tables_0_io_update_oldCtr = tables_0_io_update_oldCtr_REG; // @[ITTAGE.scala 587:32]
  assign tables_0_io_update_uValid = tables_0_io_update_uValid_REG; // @[ITTAGE.scala 590:32]
  assign tables_0_io_update_u = tables_0_io_update_u_REG; // @[ITTAGE.scala 591:27]
  assign tables_0_io_update_reset_u = tables_0_io_update_reset_u_REG; // @[ITTAGE.scala 589:33]
  assign tables_0_io_update_target = tables_0_io_update_target_REG; // @[ITTAGE.scala 584:32]
  assign tables_0_io_update_old_target = tables_0_io_update_old_target_REG; // @[ITTAGE.scala 585:36]
  assign tables_1_clock = clock;
  assign tables_1_reset = reset;
  assign tables_1_io_req_valid = io_s0_fire; // @[ITTAGE.scala 367:22]
  assign tables_1_io_req_bits_pc = io_in_bits_s0_pc; // @[ITTAGE.scala 368:24]
  assign tables_1_io_req_bits_folded_hist_hist_8_folded_hist = io_in_bits_folded_hist_hist_8_folded_hist; // @[ITTAGE.scala 369:33]
  assign tables_1_io_update_pc = tables_1_io_update_pc_REG; // @[ITTAGE.scala 592:28]
  assign tables_1_io_update_folded_hist_hist_8_folded_hist = tables_1_io_update_folded_hist_REG_hist_8_folded_hist; // @[ITTAGE.scala 594:37]
  assign tables_1_io_update_valid = tables_1_io_update_valid_REG; // @[ITTAGE.scala 582:31]
  assign tables_1_io_update_correct = tables_1_io_update_correct_REG; // @[ITTAGE.scala 583:33]
  assign tables_1_io_update_alloc = tables_1_io_update_alloc_REG; // @[ITTAGE.scala 586:31]
  assign tables_1_io_update_oldCtr = tables_1_io_update_oldCtr_REG; // @[ITTAGE.scala 587:32]
  assign tables_1_io_update_uValid = tables_1_io_update_uValid_REG; // @[ITTAGE.scala 590:32]
  assign tables_1_io_update_u = tables_1_io_update_u_REG; // @[ITTAGE.scala 591:27]
  assign tables_1_io_update_reset_u = tables_1_io_update_reset_u_REG; // @[ITTAGE.scala 589:33]
  assign tables_1_io_update_target = tables_1_io_update_target_REG; // @[ITTAGE.scala 584:32]
  assign tables_1_io_update_old_target = tables_1_io_update_old_target_REG; // @[ITTAGE.scala 585:36]
  assign tables_2_clock = clock;
  assign tables_2_reset = reset;
  assign tables_2_io_req_valid = io_s0_fire; // @[ITTAGE.scala 367:22]
  assign tables_2_io_req_bits_pc = io_in_bits_s0_pc; // @[ITTAGE.scala 368:24]
  assign tables_2_io_req_bits_folded_hist_hist_17_folded_hist = io_in_bits_folded_hist_hist_17_folded_hist; // @[ITTAGE.scala 369:33]
  assign tables_2_io_req_bits_folded_hist_hist_6_folded_hist = io_in_bits_folded_hist_hist_6_folded_hist; // @[ITTAGE.scala 369:33]
  assign tables_2_io_update_pc = tables_2_io_update_pc_REG; // @[ITTAGE.scala 592:28]
  assign tables_2_io_update_folded_hist_hist_17_folded_hist = tables_2_io_update_folded_hist_REG_hist_17_folded_hist; // @[ITTAGE.scala 594:37]
  assign tables_2_io_update_folded_hist_hist_6_folded_hist = tables_2_io_update_folded_hist_REG_hist_6_folded_hist; // @[ITTAGE.scala 594:37]
  assign tables_2_io_update_valid = tables_2_io_update_valid_REG; // @[ITTAGE.scala 582:31]
  assign tables_2_io_update_correct = tables_2_io_update_correct_REG; // @[ITTAGE.scala 583:33]
  assign tables_2_io_update_alloc = tables_2_io_update_alloc_REG; // @[ITTAGE.scala 586:31]
  assign tables_2_io_update_oldCtr = tables_2_io_update_oldCtr_REG; // @[ITTAGE.scala 587:32]
  assign tables_2_io_update_uValid = tables_2_io_update_uValid_REG; // @[ITTAGE.scala 590:32]
  assign tables_2_io_update_u = tables_2_io_update_u_REG; // @[ITTAGE.scala 591:27]
  assign tables_2_io_update_reset_u = tables_2_io_update_reset_u_REG; // @[ITTAGE.scala 589:33]
  assign tables_2_io_update_target = tables_2_io_update_target_REG; // @[ITTAGE.scala 584:32]
  assign tables_2_io_update_old_target = tables_2_io_update_old_target_REG; // @[ITTAGE.scala 585:36]
  assign tables_3_clock = clock;
  assign tables_3_reset = reset;
  assign tables_3_io_req_valid = io_s0_fire; // @[ITTAGE.scala 367:22]
  assign tables_3_io_req_bits_pc = io_in_bits_s0_pc; // @[ITTAGE.scala 368:24]
  assign tables_3_io_req_bits_folded_hist_hist_7_folded_hist = io_in_bits_folded_hist_hist_7_folded_hist; // @[ITTAGE.scala 369:33]
  assign tables_3_io_req_bits_folded_hist_hist_0_folded_hist = io_in_bits_folded_hist_hist_0_folded_hist; // @[ITTAGE.scala 369:33]
  assign tables_3_io_update_pc = tables_3_io_update_pc_REG; // @[ITTAGE.scala 592:28]
  assign tables_3_io_update_folded_hist_hist_7_folded_hist = tables_3_io_update_folded_hist_REG_hist_7_folded_hist; // @[ITTAGE.scala 594:37]
  assign tables_3_io_update_folded_hist_hist_0_folded_hist = tables_3_io_update_folded_hist_REG_hist_0_folded_hist; // @[ITTAGE.scala 594:37]
  assign tables_3_io_update_valid = tables_3_io_update_valid_REG; // @[ITTAGE.scala 582:31]
  assign tables_3_io_update_correct = tables_3_io_update_correct_REG; // @[ITTAGE.scala 583:33]
  assign tables_3_io_update_alloc = tables_3_io_update_alloc_REG; // @[ITTAGE.scala 586:31]
  assign tables_3_io_update_oldCtr = tables_3_io_update_oldCtr_REG; // @[ITTAGE.scala 587:32]
  assign tables_3_io_update_uValid = tables_3_io_update_uValid_REG; // @[ITTAGE.scala 590:32]
  assign tables_3_io_update_u = tables_3_io_update_u_REG; // @[ITTAGE.scala 591:27]
  assign tables_3_io_update_reset_u = tables_3_io_update_reset_u_REG; // @[ITTAGE.scala 589:33]
  assign tables_3_io_update_target = tables_3_io_update_target_REG; // @[ITTAGE.scala 584:32]
  assign tables_3_io_update_old_target = tables_3_io_update_old_target_REG; // @[ITTAGE.scala 585:36]
  assign tables_4_clock = clock;
  assign tables_4_reset = reset;
  assign tables_4_io_req_valid = io_s0_fire; // @[ITTAGE.scala 367:22]
  assign tables_4_io_req_bits_pc = io_in_bits_s0_pc; // @[ITTAGE.scala 368:24]
  assign tables_4_io_req_bits_folded_hist_hist_10_folded_hist = io_in_bits_folded_hist_hist_10_folded_hist; // @[ITTAGE.scala 369:33]
  assign tables_4_io_req_bits_folded_hist_hist_1_folded_hist = io_in_bits_folded_hist_hist_1_folded_hist; // @[ITTAGE.scala 369:33]
  assign tables_4_io_update_pc = tables_4_io_update_pc_REG; // @[ITTAGE.scala 592:28]
  assign tables_4_io_update_folded_hist_hist_10_folded_hist = tables_4_io_update_folded_hist_REG_hist_10_folded_hist; // @[ITTAGE.scala 594:37]
  assign tables_4_io_update_folded_hist_hist_1_folded_hist = tables_4_io_update_folded_hist_REG_hist_1_folded_hist; // @[ITTAGE.scala 594:37]
  assign tables_4_io_update_valid = tables_4_io_update_valid_REG; // @[ITTAGE.scala 582:31]
  assign tables_4_io_update_correct = tables_4_io_update_correct_REG; // @[ITTAGE.scala 583:33]
  assign tables_4_io_update_alloc = tables_4_io_update_alloc_REG; // @[ITTAGE.scala 586:31]
  assign tables_4_io_update_oldCtr = tables_4_io_update_oldCtr_REG; // @[ITTAGE.scala 587:32]
  assign tables_4_io_update_uValid = tables_4_io_update_uValid_REG; // @[ITTAGE.scala 590:32]
  assign tables_4_io_update_u = tables_4_io_update_u_REG; // @[ITTAGE.scala 591:27]
  assign tables_4_io_update_reset_u = tables_4_io_update_reset_u_REG; // @[ITTAGE.scala 589:33]
  assign tables_4_io_update_target = tables_4_io_update_target_REG; // @[ITTAGE.scala 584:32]
  assign tables_4_io_update_old_target = tables_4_io_update_old_target_REG; // @[ITTAGE.scala 585:36]
  always @(posedge clock) begin
    if (io_s1_fire) begin // @[Reg.scala 17:18]
      s2_resps__0_valid <= s1_resps_0_valid; // @[Reg.scala 17:22]
    end
    if (io_s1_fire) begin // @[Reg.scala 17:18]
      s2_resps__0_bits_ctr <= s1_resps_0_bits_ctr; // @[Reg.scala 17:22]
    end
    if (io_s1_fire) begin // @[Reg.scala 17:18]
      s2_resps__0_bits_u <= s1_resps_0_bits_u; // @[Reg.scala 17:22]
    end
    if (io_s1_fire) begin // @[Reg.scala 17:18]
      s2_resps__0_bits_target <= s1_resps_0_bits_target; // @[Reg.scala 17:22]
    end
    if (io_s1_fire) begin // @[Reg.scala 17:18]
      s2_resps__1_valid <= s1_resps_1_valid; // @[Reg.scala 17:22]
    end
    if (io_s1_fire) begin // @[Reg.scala 17:18]
      s2_resps__1_bits_ctr <= s1_resps_1_bits_ctr; // @[Reg.scala 17:22]
    end
    if (io_s1_fire) begin // @[Reg.scala 17:18]
      s2_resps__1_bits_u <= s1_resps_1_bits_u; // @[Reg.scala 17:22]
    end
    if (io_s1_fire) begin // @[Reg.scala 17:18]
      s2_resps__1_bits_target <= s1_resps_1_bits_target; // @[Reg.scala 17:22]
    end
    if (io_s1_fire) begin // @[Reg.scala 17:18]
      s2_resps__2_valid <= s1_resps_2_valid; // @[Reg.scala 17:22]
    end
    if (io_s1_fire) begin // @[Reg.scala 17:18]
      s2_resps__2_bits_ctr <= s1_resps_2_bits_ctr; // @[Reg.scala 17:22]
    end
    if (io_s1_fire) begin // @[Reg.scala 17:18]
      s2_resps__2_bits_u <= s1_resps_2_bits_u; // @[Reg.scala 17:22]
    end
    if (io_s1_fire) begin // @[Reg.scala 17:18]
      s2_resps__2_bits_target <= s1_resps_2_bits_target; // @[Reg.scala 17:22]
    end
    if (io_s1_fire) begin // @[Reg.scala 17:18]
      s2_resps__3_valid <= s1_resps_3_valid; // @[Reg.scala 17:22]
    end
    if (io_s1_fire) begin // @[Reg.scala 17:18]
      s2_resps__3_bits_ctr <= s1_resps_3_bits_ctr; // @[Reg.scala 17:22]
    end
    if (io_s1_fire) begin // @[Reg.scala 17:18]
      s2_resps__3_bits_u <= s1_resps_3_bits_u; // @[Reg.scala 17:22]
    end
    if (io_s1_fire) begin // @[Reg.scala 17:18]
      s2_resps__3_bits_target <= s1_resps_3_bits_target; // @[Reg.scala 17:22]
    end
    if (io_s1_fire) begin // @[Reg.scala 17:18]
      s2_resps__4_valid <= s1_resps_4_valid; // @[Reg.scala 17:22]
    end
    if (io_s1_fire) begin // @[Reg.scala 17:18]
      s2_resps__4_bits_ctr <= s1_resps_4_bits_ctr; // @[Reg.scala 17:22]
    end
    if (io_s1_fire) begin // @[Reg.scala 17:18]
      s2_resps__4_bits_u <= s1_resps_4_bits_u; // @[Reg.scala 17:22]
    end
    if (io_s1_fire) begin // @[Reg.scala 17:18]
      s2_resps__4_bits_target <= s1_resps_4_bits_target; // @[Reg.scala 17:22]
    end
    if (io_s2_fire) begin // @[Reg.scala 17:18]
      s3_tageTaken <= s2_tageTaken; // @[Reg.scala 17:22]
    end
    if (io_s2_fire) begin // @[Reg.scala 17:18]
      s3_tageTarget <= s2_tageTarget; // @[Reg.scala 17:22]
    end
    if (io_s2_fire) begin // @[Reg.scala 17:18]
      if (selectedInfo_res_hasOne) begin // @[ParallelMux.scala 134:10]
        if (s2_resps__4_valid) begin // @[ParallelMux.scala 134:10]
          s3_providerTarget <= s2_resps__4_bits_target;
        end else begin
          s3_providerTarget <= s2_resps__3_bits_target;
        end
      end else if (s2_resps__2_valid) begin // @[ParallelMux.scala 134:10]
        s3_providerTarget <= s2_resps__2_bits_target;
      end else if (s2_resps__1_valid) begin // @[ParallelMux.scala 134:10]
        s3_providerTarget <= s2_resps__1_bits_target;
      end else begin
        s3_providerTarget <= s2_resps__0_bits_target;
      end
    end
    if (io_s2_fire) begin // @[Reg.scala 17:18]
      s3_altProviderTarget <= selectedInfo_second_target; // @[Reg.scala 17:22]
    end
    if (io_s2_fire) begin // @[Reg.scala 17:18]
      s3_provided <= selectedInfo_hasOne; // @[Reg.scala 17:22]
    end
    if (io_s2_fire) begin // @[Reg.scala 17:18]
      if (selectedInfo_res_hasOne) begin // @[ParallelMux.scala 134:10]
        if (s2_resps__4_valid) begin // @[ParallelMux.scala 134:10]
          s3_provider <= 3'h4;
        end else begin
          s3_provider <= 3'h3;
        end
      end else if (s2_resps__2_valid) begin // @[ParallelMux.scala 134:10]
        s3_provider <= 3'h2;
      end else if (s2_resps__1_valid) begin // @[ParallelMux.scala 134:10]
        s3_provider <= 3'h1;
      end else begin
        s3_provider <= 3'h0;
      end
    end
    if (io_s2_fire) begin // @[Reg.scala 17:18]
      s3_altProvided <= selectedInfo_hasTwo; // @[Reg.scala 17:22]
    end
    if (io_s2_fire) begin // @[Reg.scala 17:18]
      s3_altProvider <= selectedInfo_second_tableIdx; // @[Reg.scala 17:22]
    end
    if (io_s2_fire) begin // @[Reg.scala 17:18]
      if (selectedInfo_hasTwo) begin // @[ITTAGE.scala 480:25]
        s3_finalAltPred <= selectedInfo_second_ctr[1];
      end else begin
        s3_finalAltPred <= 1'h1;
      end
    end
    if (io_s2_fire) begin // @[Reg.scala 17:18]
      s3_providerU <= s2_providerU; // @[Reg.scala 17:22]
    end
    if (io_s2_fire) begin // @[Reg.scala 17:18]
      if (selectedInfo_res_hasOne) begin // @[ParallelMux.scala 134:10]
        if (s2_resps__4_valid) begin // @[ParallelMux.scala 134:10]
          s3_providerCtr <= s2_resps__4_bits_ctr;
        end else begin
          s3_providerCtr <= s2_resps__3_bits_ctr;
        end
      end else if (s2_resps__2_valid) begin // @[ParallelMux.scala 134:10]
        s3_providerCtr <= s2_resps__2_bits_ctr;
      end else if (s2_resps__1_valid) begin // @[ParallelMux.scala 134:10]
        s3_providerCtr <= s2_resps__1_bits_ctr;
      end else begin
        s3_providerCtr <= s2_resps__0_bits_ctr;
      end
    end
    if (io_s2_fire) begin // @[Reg.scala 17:18]
      s3_altProviderCtr <= selectedInfo_second_ctr; // @[Reg.scala 17:22]
    end
    if (io_s2_fire) begin // @[Reg.scala 17:18]
      resp_meta_allocate_valid_r <= _resp_meta_allocate_valid_T; // @[Reg.scala 17:22]
    end
    if (io_s2_fire) begin // @[Reg.scala 17:18]
      if (_s2_allocEntry_T[0]) begin // @[ITTAGE.scala 517:27]
        if (_s2_maskedEntry_T[0]) begin // @[Mux.scala 47:70]
          resp_meta_allocate_bits_r <= 3'h0;
        end else if (_s2_maskedEntry_T[1]) begin // @[Mux.scala 47:70]
          resp_meta_allocate_bits_r <= 3'h1;
        end else begin
          resp_meta_allocate_bits_r <= _s2_maskedEntry_T_13;
        end
      end else if (s2_allocatableSlots[0]) begin // @[Mux.scala 47:70]
        resp_meta_allocate_bits_r <= 3'h0;
      end else if (s2_allocatableSlots[1]) begin // @[Mux.scala 47:70]
        resp_meta_allocate_bits_r <= 3'h1;
      end else begin
        resp_meta_allocate_bits_r <= _s2_firstEntry_T_12;
      end
    end
    if (updateValid & io_update_bits_mispred_mask_2 & ~(providerCorrect & _usedAltpred_T)) begin // @[ITTAGE.scala 558:79]
      if (updateMeta_allocate_valid) begin // @[ITTAGE.scala 561:27]
        tables_0_io_update_valid_REG <= _GEN_233;
      end else begin
        tables_0_io_update_valid_REG <= _GEN_193;
      end
    end else begin
      tables_0_io_update_valid_REG <= _GEN_193;
    end
    if (updateValid & io_update_bits_mispred_mask_2 & ~(providerCorrect & _usedAltpred_T)) begin // @[ITTAGE.scala 558:79]
      if (updateMeta_allocate_valid) begin // @[ITTAGE.scala 561:27]
        tables_0_io_update_correct_REG <= _GEN_238;
      end else begin
        tables_0_io_update_correct_REG <= _GEN_128;
      end
    end else begin
      tables_0_io_update_correct_REG <= _GEN_128;
    end
    tables_0_io_update_target_REG <= io_update_bits_full_target; // @[ITTAGE.scala 558:79]
    if (3'h0 == updateMeta_provider_bits) begin // @[ITTAGE.scala 548:33]
      tables_0_io_update_old_target_REG <= updateMeta_providerTarget; // @[ITTAGE.scala 548:33]
    end else begin
      tables_0_io_update_old_target_REG <= updateMeta_altProviderTarget;
    end
    tables_0_io_update_alloc_REG <= updateValid & io_update_bits_mispred_mask_2 & ~(providerCorrect & _usedAltpred_T) &
      _GEN_278; // @[ITTAGE.scala 558:79]
    if (3'h0 == updateMeta_provider_bits) begin // @[ITTAGE.scala 549:30]
      tables_0_io_update_oldCtr_REG <= updateMeta_providerCtr; // @[ITTAGE.scala 549:30]
    end else begin
      tables_0_io_update_oldCtr_REG <= updateMeta_altProviderCtr;
    end
    tables_0_io_update_reset_u_REG <= tickCtr == 8'hff; // @[ITTAGE.scala 572:17]
    if (updateValid & io_update_bits_mispred_mask_2 & ~(providerCorrect & _usedAltpred_T)) begin // @[ITTAGE.scala 558:79]
      if (updateMeta_allocate_valid) begin // @[ITTAGE.scala 561:27]
        tables_0_io_update_uValid_REG <= _GEN_253;
      end else begin
        tables_0_io_update_uValid_REG <= _GEN_198;
      end
    end else begin
      tables_0_io_update_uValid_REG <= _GEN_198;
    end
    if (updateValid & io_update_bits_mispred_mask_2 & ~(providerCorrect & _usedAltpred_T)) begin // @[ITTAGE.scala 558:79]
      if (updateMeta_allocate_valid) begin // @[ITTAGE.scala 561:27]
        if (3'h0 == updateMeta_allocate_bits) begin // @[ITTAGE.scala 568:30]
          tables_0_io_update_u_REG <= 1'h0; // @[ITTAGE.scala 568:30]
        end else begin
          tables_0_io_update_u_REG <= _updateU_T_2;
        end
      end else begin
        tables_0_io_update_u_REG <= _updateU_T_2;
      end
    end else begin
      tables_0_io_update_u_REG <= _updateU_T_2;
    end
    tables_0_io_update_pc_REG <= io_update_bits_pc; // @[ITTAGE.scala 592:38]
    tables_0_io_update_folded_hist_REG_hist_4_folded_hist <= io_update_bits_spec_info_folded_hist_hist_4_folded_hist; // @[ITTAGE.scala 594:47]
    if (updateValid & io_update_bits_mispred_mask_2 & ~(providerCorrect & _usedAltpred_T)) begin // @[ITTAGE.scala 558:79]
      if (updateMeta_allocate_valid) begin // @[ITTAGE.scala 561:27]
        tables_1_io_update_valid_REG <= _GEN_234;
      end else begin
        tables_1_io_update_valid_REG <= _GEN_194;
      end
    end else begin
      tables_1_io_update_valid_REG <= _GEN_194;
    end
    if (updateValid & io_update_bits_mispred_mask_2 & ~(providerCorrect & _usedAltpred_T)) begin // @[ITTAGE.scala 558:79]
      if (updateMeta_allocate_valid) begin // @[ITTAGE.scala 561:27]
        tables_1_io_update_correct_REG <= _GEN_239;
      end else begin
        tables_1_io_update_correct_REG <= _GEN_129;
      end
    end else begin
      tables_1_io_update_correct_REG <= _GEN_129;
    end
    tables_1_io_update_target_REG <= io_update_bits_full_target; // @[ITTAGE.scala 558:79]
    if (3'h1 == updateMeta_provider_bits) begin // @[ITTAGE.scala 548:33]
      tables_1_io_update_old_target_REG <= updateMeta_providerTarget; // @[ITTAGE.scala 548:33]
    end else begin
      tables_1_io_update_old_target_REG <= updateMeta_altProviderTarget;
    end
    tables_1_io_update_alloc_REG <= updateValid & io_update_bits_mispred_mask_2 & ~(providerCorrect & _usedAltpred_T) &
      _GEN_279; // @[ITTAGE.scala 558:79]
    if (3'h1 == updateMeta_provider_bits) begin // @[ITTAGE.scala 549:30]
      tables_1_io_update_oldCtr_REG <= updateMeta_providerCtr; // @[ITTAGE.scala 549:30]
    end else begin
      tables_1_io_update_oldCtr_REG <= updateMeta_altProviderCtr;
    end
    tables_1_io_update_reset_u_REG <= tickCtr == 8'hff; // @[ITTAGE.scala 572:17]
    if (updateValid & io_update_bits_mispred_mask_2 & ~(providerCorrect & _usedAltpred_T)) begin // @[ITTAGE.scala 558:79]
      if (updateMeta_allocate_valid) begin // @[ITTAGE.scala 561:27]
        tables_1_io_update_uValid_REG <= _GEN_254;
      end else begin
        tables_1_io_update_uValid_REG <= _GEN_199;
      end
    end else begin
      tables_1_io_update_uValid_REG <= _GEN_199;
    end
    if (updateValid & io_update_bits_mispred_mask_2 & ~(providerCorrect & _usedAltpred_T)) begin // @[ITTAGE.scala 558:79]
      if (updateMeta_allocate_valid) begin // @[ITTAGE.scala 561:27]
        if (3'h1 == updateMeta_allocate_bits) begin // @[ITTAGE.scala 568:30]
          tables_1_io_update_u_REG <= 1'h0; // @[ITTAGE.scala 568:30]
        end else begin
          tables_1_io_update_u_REG <= _updateU_T_2;
        end
      end else begin
        tables_1_io_update_u_REG <= _updateU_T_2;
      end
    end else begin
      tables_1_io_update_u_REG <= _updateU_T_2;
    end
    tables_1_io_update_pc_REG <= io_update_bits_pc; // @[ITTAGE.scala 592:38]
    tables_1_io_update_folded_hist_REG_hist_8_folded_hist <= io_update_bits_spec_info_folded_hist_hist_8_folded_hist; // @[ITTAGE.scala 594:47]
    if (updateValid & io_update_bits_mispred_mask_2 & ~(providerCorrect & _usedAltpred_T)) begin // @[ITTAGE.scala 558:79]
      if (updateMeta_allocate_valid) begin // @[ITTAGE.scala 561:27]
        tables_2_io_update_valid_REG <= _GEN_235;
      end else begin
        tables_2_io_update_valid_REG <= _GEN_195;
      end
    end else begin
      tables_2_io_update_valid_REG <= _GEN_195;
    end
    if (updateValid & io_update_bits_mispred_mask_2 & ~(providerCorrect & _usedAltpred_T)) begin // @[ITTAGE.scala 558:79]
      if (updateMeta_allocate_valid) begin // @[ITTAGE.scala 561:27]
        tables_2_io_update_correct_REG <= _GEN_240;
      end else begin
        tables_2_io_update_correct_REG <= _GEN_130;
      end
    end else begin
      tables_2_io_update_correct_REG <= _GEN_130;
    end
    tables_2_io_update_target_REG <= io_update_bits_full_target; // @[ITTAGE.scala 558:79]
    if (3'h2 == updateMeta_provider_bits) begin // @[ITTAGE.scala 548:33]
      tables_2_io_update_old_target_REG <= updateMeta_providerTarget; // @[ITTAGE.scala 548:33]
    end else begin
      tables_2_io_update_old_target_REG <= updateMeta_altProviderTarget;
    end
    tables_2_io_update_alloc_REG <= updateValid & io_update_bits_mispred_mask_2 & ~(providerCorrect & _usedAltpred_T) &
      _GEN_280; // @[ITTAGE.scala 558:79]
    if (3'h2 == updateMeta_provider_bits) begin // @[ITTAGE.scala 549:30]
      tables_2_io_update_oldCtr_REG <= updateMeta_providerCtr; // @[ITTAGE.scala 549:30]
    end else begin
      tables_2_io_update_oldCtr_REG <= updateMeta_altProviderCtr;
    end
    tables_2_io_update_reset_u_REG <= tickCtr == 8'hff; // @[ITTAGE.scala 572:17]
    if (updateValid & io_update_bits_mispred_mask_2 & ~(providerCorrect & _usedAltpred_T)) begin // @[ITTAGE.scala 558:79]
      if (updateMeta_allocate_valid) begin // @[ITTAGE.scala 561:27]
        tables_2_io_update_uValid_REG <= _GEN_255;
      end else begin
        tables_2_io_update_uValid_REG <= _GEN_200;
      end
    end else begin
      tables_2_io_update_uValid_REG <= _GEN_200;
    end
    if (updateValid & io_update_bits_mispred_mask_2 & ~(providerCorrect & _usedAltpred_T)) begin // @[ITTAGE.scala 558:79]
      if (updateMeta_allocate_valid) begin // @[ITTAGE.scala 561:27]
        if (3'h2 == updateMeta_allocate_bits) begin // @[ITTAGE.scala 568:30]
          tables_2_io_update_u_REG <= 1'h0; // @[ITTAGE.scala 568:30]
        end else begin
          tables_2_io_update_u_REG <= _updateU_T_2;
        end
      end else begin
        tables_2_io_update_u_REG <= _updateU_T_2;
      end
    end else begin
      tables_2_io_update_u_REG <= _updateU_T_2;
    end
    tables_2_io_update_pc_REG <= io_update_bits_pc; // @[ITTAGE.scala 592:38]
    tables_2_io_update_folded_hist_REG_hist_17_folded_hist <= io_update_bits_spec_info_folded_hist_hist_17_folded_hist; // @[ITTAGE.scala 594:47]
    tables_2_io_update_folded_hist_REG_hist_6_folded_hist <= io_update_bits_spec_info_folded_hist_hist_6_folded_hist; // @[ITTAGE.scala 594:47]
    if (updateValid & io_update_bits_mispred_mask_2 & ~(providerCorrect & _usedAltpred_T)) begin // @[ITTAGE.scala 558:79]
      if (updateMeta_allocate_valid) begin // @[ITTAGE.scala 561:27]
        tables_3_io_update_valid_REG <= _GEN_236;
      end else begin
        tables_3_io_update_valid_REG <= _GEN_196;
      end
    end else begin
      tables_3_io_update_valid_REG <= _GEN_196;
    end
    if (updateValid & io_update_bits_mispred_mask_2 & ~(providerCorrect & _usedAltpred_T)) begin // @[ITTAGE.scala 558:79]
      if (updateMeta_allocate_valid) begin // @[ITTAGE.scala 561:27]
        tables_3_io_update_correct_REG <= _GEN_241;
      end else begin
        tables_3_io_update_correct_REG <= _GEN_131;
      end
    end else begin
      tables_3_io_update_correct_REG <= _GEN_131;
    end
    tables_3_io_update_target_REG <= io_update_bits_full_target; // @[ITTAGE.scala 558:79]
    if (3'h3 == updateMeta_provider_bits) begin // @[ITTAGE.scala 548:33]
      tables_3_io_update_old_target_REG <= updateMeta_providerTarget; // @[ITTAGE.scala 548:33]
    end else begin
      tables_3_io_update_old_target_REG <= updateMeta_altProviderTarget;
    end
    tables_3_io_update_alloc_REG <= updateValid & io_update_bits_mispred_mask_2 & ~(providerCorrect & _usedAltpred_T) &
      _GEN_281; // @[ITTAGE.scala 558:79]
    if (3'h3 == updateMeta_provider_bits) begin // @[ITTAGE.scala 549:30]
      tables_3_io_update_oldCtr_REG <= updateMeta_providerCtr; // @[ITTAGE.scala 549:30]
    end else begin
      tables_3_io_update_oldCtr_REG <= updateMeta_altProviderCtr;
    end
    tables_3_io_update_reset_u_REG <= tickCtr == 8'hff; // @[ITTAGE.scala 572:17]
    if (updateValid & io_update_bits_mispred_mask_2 & ~(providerCorrect & _usedAltpred_T)) begin // @[ITTAGE.scala 558:79]
      if (updateMeta_allocate_valid) begin // @[ITTAGE.scala 561:27]
        tables_3_io_update_uValid_REG <= _GEN_256;
      end else begin
        tables_3_io_update_uValid_REG <= _GEN_201;
      end
    end else begin
      tables_3_io_update_uValid_REG <= _GEN_201;
    end
    if (updateValid & io_update_bits_mispred_mask_2 & ~(providerCorrect & _usedAltpred_T)) begin // @[ITTAGE.scala 558:79]
      if (updateMeta_allocate_valid) begin // @[ITTAGE.scala 561:27]
        if (3'h3 == updateMeta_allocate_bits) begin // @[ITTAGE.scala 568:30]
          tables_3_io_update_u_REG <= 1'h0; // @[ITTAGE.scala 568:30]
        end else begin
          tables_3_io_update_u_REG <= _updateU_T_2;
        end
      end else begin
        tables_3_io_update_u_REG <= _updateU_T_2;
      end
    end else begin
      tables_3_io_update_u_REG <= _updateU_T_2;
    end
    tables_3_io_update_pc_REG <= io_update_bits_pc; // @[ITTAGE.scala 592:38]
    tables_3_io_update_folded_hist_REG_hist_7_folded_hist <= io_update_bits_spec_info_folded_hist_hist_7_folded_hist; // @[ITTAGE.scala 594:47]
    tables_3_io_update_folded_hist_REG_hist_0_folded_hist <= io_update_bits_spec_info_folded_hist_hist_0_folded_hist; // @[ITTAGE.scala 594:47]
    if (updateValid & io_update_bits_mispred_mask_2 & ~(providerCorrect & _usedAltpred_T)) begin // @[ITTAGE.scala 558:79]
      if (updateMeta_allocate_valid) begin // @[ITTAGE.scala 561:27]
        tables_4_io_update_valid_REG <= _GEN_237;
      end else begin
        tables_4_io_update_valid_REG <= _GEN_197;
      end
    end else begin
      tables_4_io_update_valid_REG <= _GEN_197;
    end
    if (updateValid & io_update_bits_mispred_mask_2 & ~(providerCorrect & _usedAltpred_T)) begin // @[ITTAGE.scala 558:79]
      if (updateMeta_allocate_valid) begin // @[ITTAGE.scala 561:27]
        tables_4_io_update_correct_REG <= _GEN_242;
      end else begin
        tables_4_io_update_correct_REG <= _GEN_132;
      end
    end else begin
      tables_4_io_update_correct_REG <= _GEN_132;
    end
    tables_4_io_update_target_REG <= io_update_bits_full_target; // @[ITTAGE.scala 558:79]
    if (3'h4 == updateMeta_provider_bits) begin // @[ITTAGE.scala 548:33]
      tables_4_io_update_old_target_REG <= updateMeta_providerTarget; // @[ITTAGE.scala 548:33]
    end else begin
      tables_4_io_update_old_target_REG <= updateMeta_altProviderTarget;
    end
    tables_4_io_update_alloc_REG <= updateValid & io_update_bits_mispred_mask_2 & ~(providerCorrect & _usedAltpred_T) &
      _GEN_282; // @[ITTAGE.scala 558:79]
    if (3'h4 == updateMeta_provider_bits) begin // @[ITTAGE.scala 549:30]
      tables_4_io_update_oldCtr_REG <= updateMeta_providerCtr; // @[ITTAGE.scala 549:30]
    end else begin
      tables_4_io_update_oldCtr_REG <= updateMeta_altProviderCtr;
    end
    tables_4_io_update_reset_u_REG <= tickCtr == 8'hff; // @[ITTAGE.scala 572:17]
    if (updateValid & io_update_bits_mispred_mask_2 & ~(providerCorrect & _usedAltpred_T)) begin // @[ITTAGE.scala 558:79]
      if (updateMeta_allocate_valid) begin // @[ITTAGE.scala 561:27]
        tables_4_io_update_uValid_REG <= _GEN_257;
      end else begin
        tables_4_io_update_uValid_REG <= _GEN_202;
      end
    end else begin
      tables_4_io_update_uValid_REG <= _GEN_202;
    end
    if (updateValid & io_update_bits_mispred_mask_2 & ~(providerCorrect & _usedAltpred_T)) begin // @[ITTAGE.scala 558:79]
      if (updateMeta_allocate_valid) begin // @[ITTAGE.scala 561:27]
        if (3'h4 == updateMeta_allocate_bits) begin // @[ITTAGE.scala 568:30]
          tables_4_io_update_u_REG <= 1'h0; // @[ITTAGE.scala 568:30]
        end else begin
          tables_4_io_update_u_REG <= _updateU_T_2;
        end
      end else begin
        tables_4_io_update_u_REG <= _updateU_T_2;
      end
    end else begin
      tables_4_io_update_u_REG <= _updateU_T_2;
    end
    tables_4_io_update_pc_REG <= io_update_bits_pc; // @[ITTAGE.scala 592:38]
    tables_4_io_update_folded_hist_REG_hist_10_folded_hist <= io_update_bits_spec_info_folded_hist_hist_10_folded_hist; // @[ITTAGE.scala 594:47]
    tables_4_io_update_folded_hist_REG_hist_1_folded_hist <= io_update_bits_spec_info_folded_hist_hist_1_folded_hist; // @[ITTAGE.scala 594:47]
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[ITTAGE.scala 572:47]
      tickCtr <= 8'h0; // @[ITTAGE.scala 573:13]
    end else if (tickCtr_oldSatTaken) begin // @[ITTAGE.scala 558:79]
      tickCtr <= 8'h0; // @[BPU.scala 89:8 90:10]
    end else if (updateValid & io_update_bits_mispred_mask_2 & ~(providerCorrect & _usedAltpred_T)) begin // @[ITTAGE.scala 376:24]
      if (tickCtr_oldSatTaken & _tickCtr_T) begin
        tickCtr <= 8'hff;
      end else if (tickCtr_oldSatNotTaken & ~_tickCtr_T) begin
        tickCtr <= 8'h0;
      end else begin
        tickCtr <= _tickCtr_T_8;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LFSR64.scala 31:18]
      s2_allocLFSR_lfsr <= 64'h1234567887654321;
    end else if (s2_allocLFSR_lfsr == 64'h0) begin
      s2_allocLFSR_lfsr <= 64'h1;
    end else begin
      s2_allocLFSR_lfsr <= _s2_allocLFSR_lfsr_T_2;
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
  tickCtr = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  s2_resps__0_valid = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  s2_resps__0_bits_ctr = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  s2_resps__0_bits_u = _RAND_3[1:0];
  _RAND_4 = {2{`RANDOM}};
  s2_resps__0_bits_target = _RAND_4[38:0];
  _RAND_5 = {1{`RANDOM}};
  s2_resps__1_valid = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  s2_resps__1_bits_ctr = _RAND_6[1:0];
  _RAND_7 = {1{`RANDOM}};
  s2_resps__1_bits_u = _RAND_7[1:0];
  _RAND_8 = {2{`RANDOM}};
  s2_resps__1_bits_target = _RAND_8[38:0];
  _RAND_9 = {1{`RANDOM}};
  s2_resps__2_valid = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  s2_resps__2_bits_ctr = _RAND_10[1:0];
  _RAND_11 = {1{`RANDOM}};
  s2_resps__2_bits_u = _RAND_11[1:0];
  _RAND_12 = {2{`RANDOM}};
  s2_resps__2_bits_target = _RAND_12[38:0];
  _RAND_13 = {1{`RANDOM}};
  s2_resps__3_valid = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  s2_resps__3_bits_ctr = _RAND_14[1:0];
  _RAND_15 = {1{`RANDOM}};
  s2_resps__3_bits_u = _RAND_15[1:0];
  _RAND_16 = {2{`RANDOM}};
  s2_resps__3_bits_target = _RAND_16[38:0];
  _RAND_17 = {1{`RANDOM}};
  s2_resps__4_valid = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  s2_resps__4_bits_ctr = _RAND_18[1:0];
  _RAND_19 = {1{`RANDOM}};
  s2_resps__4_bits_u = _RAND_19[1:0];
  _RAND_20 = {2{`RANDOM}};
  s2_resps__4_bits_target = _RAND_20[38:0];
  _RAND_21 = {1{`RANDOM}};
  s3_tageTaken = _RAND_21[0:0];
  _RAND_22 = {2{`RANDOM}};
  s3_tageTarget = _RAND_22[38:0];
  _RAND_23 = {2{`RANDOM}};
  s3_providerTarget = _RAND_23[38:0];
  _RAND_24 = {2{`RANDOM}};
  s3_altProviderTarget = _RAND_24[38:0];
  _RAND_25 = {1{`RANDOM}};
  s3_provided = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  s3_provider = _RAND_26[2:0];
  _RAND_27 = {1{`RANDOM}};
  s3_altProvided = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  s3_altProvider = _RAND_28[2:0];
  _RAND_29 = {1{`RANDOM}};
  s3_finalAltPred = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  s3_providerU = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  s3_providerCtr = _RAND_31[1:0];
  _RAND_32 = {1{`RANDOM}};
  s3_altProviderCtr = _RAND_32[1:0];
  _RAND_33 = {1{`RANDOM}};
  resp_meta_allocate_valid_r = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  resp_meta_allocate_bits_r = _RAND_34[2:0];
  _RAND_35 = {2{`RANDOM}};
  s2_allocLFSR_lfsr = _RAND_35[63:0];
  _RAND_36 = {1{`RANDOM}};
  tables_0_io_update_valid_REG = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  tables_0_io_update_correct_REG = _RAND_37[0:0];
  _RAND_38 = {2{`RANDOM}};
  tables_0_io_update_target_REG = _RAND_38[38:0];
  _RAND_39 = {2{`RANDOM}};
  tables_0_io_update_old_target_REG = _RAND_39[38:0];
  _RAND_40 = {1{`RANDOM}};
  tables_0_io_update_alloc_REG = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  tables_0_io_update_oldCtr_REG = _RAND_41[1:0];
  _RAND_42 = {1{`RANDOM}};
  tables_0_io_update_reset_u_REG = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  tables_0_io_update_uValid_REG = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  tables_0_io_update_u_REG = _RAND_44[0:0];
  _RAND_45 = {2{`RANDOM}};
  tables_0_io_update_pc_REG = _RAND_45[38:0];
  _RAND_46 = {1{`RANDOM}};
  tables_0_io_update_folded_hist_REG_hist_4_folded_hist = _RAND_46[3:0];
  _RAND_47 = {1{`RANDOM}};
  tables_1_io_update_valid_REG = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  tables_1_io_update_correct_REG = _RAND_48[0:0];
  _RAND_49 = {2{`RANDOM}};
  tables_1_io_update_target_REG = _RAND_49[38:0];
  _RAND_50 = {2{`RANDOM}};
  tables_1_io_update_old_target_REG = _RAND_50[38:0];
  _RAND_51 = {1{`RANDOM}};
  tables_1_io_update_alloc_REG = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  tables_1_io_update_oldCtr_REG = _RAND_52[1:0];
  _RAND_53 = {1{`RANDOM}};
  tables_1_io_update_reset_u_REG = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  tables_1_io_update_uValid_REG = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  tables_1_io_update_u_REG = _RAND_55[0:0];
  _RAND_56 = {2{`RANDOM}};
  tables_1_io_update_pc_REG = _RAND_56[38:0];
  _RAND_57 = {1{`RANDOM}};
  tables_1_io_update_folded_hist_REG_hist_8_folded_hist = _RAND_57[7:0];
  _RAND_58 = {1{`RANDOM}};
  tables_2_io_update_valid_REG = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  tables_2_io_update_correct_REG = _RAND_59[0:0];
  _RAND_60 = {2{`RANDOM}};
  tables_2_io_update_target_REG = _RAND_60[38:0];
  _RAND_61 = {2{`RANDOM}};
  tables_2_io_update_old_target_REG = _RAND_61[38:0];
  _RAND_62 = {1{`RANDOM}};
  tables_2_io_update_alloc_REG = _RAND_62[0:0];
  _RAND_63 = {1{`RANDOM}};
  tables_2_io_update_oldCtr_REG = _RAND_63[1:0];
  _RAND_64 = {1{`RANDOM}};
  tables_2_io_update_reset_u_REG = _RAND_64[0:0];
  _RAND_65 = {1{`RANDOM}};
  tables_2_io_update_uValid_REG = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  tables_2_io_update_u_REG = _RAND_66[0:0];
  _RAND_67 = {2{`RANDOM}};
  tables_2_io_update_pc_REG = _RAND_67[38:0];
  _RAND_68 = {1{`RANDOM}};
  tables_2_io_update_folded_hist_REG_hist_17_folded_hist = _RAND_68[7:0];
  _RAND_69 = {1{`RANDOM}};
  tables_2_io_update_folded_hist_REG_hist_6_folded_hist = _RAND_69[8:0];
  _RAND_70 = {1{`RANDOM}};
  tables_3_io_update_valid_REG = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  tables_3_io_update_correct_REG = _RAND_71[0:0];
  _RAND_72 = {2{`RANDOM}};
  tables_3_io_update_target_REG = _RAND_72[38:0];
  _RAND_73 = {2{`RANDOM}};
  tables_3_io_update_old_target_REG = _RAND_73[38:0];
  _RAND_74 = {1{`RANDOM}};
  tables_3_io_update_alloc_REG = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  tables_3_io_update_oldCtr_REG = _RAND_75[1:0];
  _RAND_76 = {1{`RANDOM}};
  tables_3_io_update_reset_u_REG = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  tables_3_io_update_uValid_REG = _RAND_77[0:0];
  _RAND_78 = {1{`RANDOM}};
  tables_3_io_update_u_REG = _RAND_78[0:0];
  _RAND_79 = {2{`RANDOM}};
  tables_3_io_update_pc_REG = _RAND_79[38:0];
  _RAND_80 = {1{`RANDOM}};
  tables_3_io_update_folded_hist_REG_hist_7_folded_hist = _RAND_80[8:0];
  _RAND_81 = {1{`RANDOM}};
  tables_3_io_update_folded_hist_REG_hist_0_folded_hist = _RAND_81[7:0];
  _RAND_82 = {1{`RANDOM}};
  tables_4_io_update_valid_REG = _RAND_82[0:0];
  _RAND_83 = {1{`RANDOM}};
  tables_4_io_update_correct_REG = _RAND_83[0:0];
  _RAND_84 = {2{`RANDOM}};
  tables_4_io_update_target_REG = _RAND_84[38:0];
  _RAND_85 = {2{`RANDOM}};
  tables_4_io_update_old_target_REG = _RAND_85[38:0];
  _RAND_86 = {1{`RANDOM}};
  tables_4_io_update_alloc_REG = _RAND_86[0:0];
  _RAND_87 = {1{`RANDOM}};
  tables_4_io_update_oldCtr_REG = _RAND_87[1:0];
  _RAND_88 = {1{`RANDOM}};
  tables_4_io_update_reset_u_REG = _RAND_88[0:0];
  _RAND_89 = {1{`RANDOM}};
  tables_4_io_update_uValid_REG = _RAND_89[0:0];
  _RAND_90 = {1{`RANDOM}};
  tables_4_io_update_u_REG = _RAND_90[0:0];
  _RAND_91 = {2{`RANDOM}};
  tables_4_io_update_pc_REG = _RAND_91[38:0];
  _RAND_92 = {1{`RANDOM}};
  tables_4_io_update_folded_hist_REG_hist_10_folded_hist = _RAND_92[8:0];
  _RAND_93 = {1{`RANDOM}};
  tables_4_io_update_folded_hist_REG_hist_1_folded_hist = _RAND_93[7:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    tickCtr = 8'h0;
  end
  if (reset) begin
    s2_allocLFSR_lfsr = 64'h1234567887654321;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

