module RAS(
  input         clock,
  input         reset,
  input  [35:0] io_reset_vector,
  input  [38:0] io_in_bits_s0_pc,
  input         io_in_bits_resp_in_0_s2_full_pred_br_taken_mask_0,
  input         io_in_bits_resp_in_0_s2_full_pred_br_taken_mask_1,
  input         io_in_bits_resp_in_0_s2_full_pred_slot_valids_0,
  input         io_in_bits_resp_in_0_s2_full_pred_slot_valids_1,
  input  [38:0] io_in_bits_resp_in_0_s2_full_pred_targets_0,
  input  [38:0] io_in_bits_resp_in_0_s2_full_pred_targets_1,
  input  [38:0] io_in_bits_resp_in_0_s2_full_pred_jalr_target,
  input  [2:0]  io_in_bits_resp_in_0_s2_full_pred_offsets_0,
  input  [2:0]  io_in_bits_resp_in_0_s2_full_pred_offsets_1,
  input  [38:0] io_in_bits_resp_in_0_s2_full_pred_fallThroughAddr,
  input         io_in_bits_resp_in_0_s2_full_pred_fallThroughErr,
  input         io_in_bits_resp_in_0_s2_full_pred_is_jalr,
  input         io_in_bits_resp_in_0_s2_full_pred_is_call,
  input         io_in_bits_resp_in_0_s2_full_pred_is_ret,
  input         io_in_bits_resp_in_0_s2_full_pred_last_may_be_rvi_call,
  input         io_in_bits_resp_in_0_s2_full_pred_is_br_sharing,
  input         io_in_bits_resp_in_0_s2_full_pred_hit,
  input         io_in_bits_resp_in_0_s3_full_pred_br_taken_mask_0,
  input         io_in_bits_resp_in_0_s3_full_pred_br_taken_mask_1,
  input         io_in_bits_resp_in_0_s3_full_pred_slot_valids_0,
  input         io_in_bits_resp_in_0_s3_full_pred_slot_valids_1,
  input  [38:0] io_in_bits_resp_in_0_s3_full_pred_targets_0,
  input  [38:0] io_in_bits_resp_in_0_s3_full_pred_targets_1,
  input  [38:0] io_in_bits_resp_in_0_s3_full_pred_jalr_target,
  input  [2:0]  io_in_bits_resp_in_0_s3_full_pred_offsets_0,
  input  [2:0]  io_in_bits_resp_in_0_s3_full_pred_offsets_1,
  input  [38:0] io_in_bits_resp_in_0_s3_full_pred_fallThroughAddr,
  input         io_in_bits_resp_in_0_s3_full_pred_fallThroughErr,
  input         io_in_bits_resp_in_0_s3_full_pred_is_jalr,
  input         io_in_bits_resp_in_0_s3_full_pred_is_call,
  input         io_in_bits_resp_in_0_s3_full_pred_is_ret,
  input         io_in_bits_resp_in_0_s3_full_pred_is_br_sharing,
  input         io_in_bits_resp_in_0_s3_full_pred_hit,
  input         io_in_bits_resp_in_0_last_stage_ftb_entry_valid,
  input  [2:0]  io_in_bits_resp_in_0_last_stage_ftb_entry_brSlots_0_offset,
  input  [11:0] io_in_bits_resp_in_0_last_stage_ftb_entry_brSlots_0_lower,
  input  [1:0]  io_in_bits_resp_in_0_last_stage_ftb_entry_brSlots_0_tarStat,
  input         io_in_bits_resp_in_0_last_stage_ftb_entry_brSlots_0_sharing,
  input         io_in_bits_resp_in_0_last_stage_ftb_entry_brSlots_0_valid,
  input  [2:0]  io_in_bits_resp_in_0_last_stage_ftb_entry_tailSlot_offset,
  input  [19:0] io_in_bits_resp_in_0_last_stage_ftb_entry_tailSlot_lower,
  input  [1:0]  io_in_bits_resp_in_0_last_stage_ftb_entry_tailSlot_tarStat,
  input         io_in_bits_resp_in_0_last_stage_ftb_entry_tailSlot_sharing,
  input         io_in_bits_resp_in_0_last_stage_ftb_entry_tailSlot_valid,
  input  [2:0]  io_in_bits_resp_in_0_last_stage_ftb_entry_pftAddr,
  input         io_in_bits_resp_in_0_last_stage_ftb_entry_carry,
  input         io_in_bits_resp_in_0_last_stage_ftb_entry_isCall,
  input         io_in_bits_resp_in_0_last_stage_ftb_entry_isRet,
  input         io_in_bits_resp_in_0_last_stage_ftb_entry_isJalr,
  input         io_in_bits_resp_in_0_last_stage_ftb_entry_last_may_be_rvi_call,
  input         io_in_bits_resp_in_0_last_stage_ftb_entry_always_taken_0,
  input         io_in_bits_resp_in_0_last_stage_ftb_entry_always_taken_1,
  output [38:0] io_out_s2_pc,
  output        io_out_s2_full_pred_br_taken_mask_0,
  output        io_out_s2_full_pred_br_taken_mask_1,
  output        io_out_s2_full_pred_slot_valids_0,
  output        io_out_s2_full_pred_slot_valids_1,
  output [38:0] io_out_s2_full_pred_targets_0,
  output [38:0] io_out_s2_full_pred_targets_1,
  output [38:0] io_out_s2_full_pred_jalr_target,
  output [2:0]  io_out_s2_full_pred_offsets_0,
  output [2:0]  io_out_s2_full_pred_offsets_1,
  output [38:0] io_out_s2_full_pred_fallThroughAddr,
  output        io_out_s2_full_pred_fallThroughErr,
  output        io_out_s2_full_pred_is_br_sharing,
  output        io_out_s2_full_pred_hit,
  output [38:0] io_out_s3_pc,
  output        io_out_s3_full_pred_br_taken_mask_0,
  output        io_out_s3_full_pred_br_taken_mask_1,
  output        io_out_s3_full_pred_slot_valids_0,
  output        io_out_s3_full_pred_slot_valids_1,
  output [38:0] io_out_s3_full_pred_targets_0,
  output [38:0] io_out_s3_full_pred_targets_1,
  output [38:0] io_out_s3_full_pred_jalr_target,
  output [2:0]  io_out_s3_full_pred_offsets_0,
  output [2:0]  io_out_s3_full_pred_offsets_1,
  output [38:0] io_out_s3_full_pred_fallThroughAddr,
  output        io_out_s3_full_pred_fallThroughErr,
  output        io_out_s3_full_pred_is_br_sharing,
  output        io_out_s3_full_pred_hit,
  output [4:0]  io_out_last_stage_spec_info_rasSp,
  output [38:0] io_out_last_stage_spec_info_rasTop_retAddr,
  output [7:0]  io_out_last_stage_spec_info_rasTop_ctr,
  output        io_out_last_stage_ftb_entry_valid,
  output [2:0]  io_out_last_stage_ftb_entry_brSlots_0_offset,
  output [11:0] io_out_last_stage_ftb_entry_brSlots_0_lower,
  output [1:0]  io_out_last_stage_ftb_entry_brSlots_0_tarStat,
  output        io_out_last_stage_ftb_entry_brSlots_0_sharing,
  output        io_out_last_stage_ftb_entry_brSlots_0_valid,
  output [2:0]  io_out_last_stage_ftb_entry_tailSlot_offset,
  output [19:0] io_out_last_stage_ftb_entry_tailSlot_lower,
  output [1:0]  io_out_last_stage_ftb_entry_tailSlot_tarStat,
  output        io_out_last_stage_ftb_entry_tailSlot_sharing,
  output        io_out_last_stage_ftb_entry_tailSlot_valid,
  output [2:0]  io_out_last_stage_ftb_entry_pftAddr,
  output        io_out_last_stage_ftb_entry_carry,
  output        io_out_last_stage_ftb_entry_isCall,
  output        io_out_last_stage_ftb_entry_isRet,
  output        io_out_last_stage_ftb_entry_isJalr,
  output        io_out_last_stage_ftb_entry_last_may_be_rvi_call,
  output        io_out_last_stage_ftb_entry_always_taken_0,
  output        io_out_last_stage_ftb_entry_always_taken_1,
  input         io_ctrl_ras_enable,
  input         io_s0_fire,
  input         io_s1_fire,
  input         io_s2_fire,
  input         io_s3_fire,
  input         io_s3_redirect,
  input         io_redirect_valid,
  input         io_redirect_bits_level,
  input  [38:0] io_redirect_bits_cfiUpdate_pc,
  input         io_redirect_bits_cfiUpdate_pd_isRVC,
  input         io_redirect_bits_cfiUpdate_pd_isCall,
  input         io_redirect_bits_cfiUpdate_pd_isRet,
  input  [4:0]  io_redirect_bits_cfiUpdate_rasSp,
  input  [38:0] io_redirect_bits_cfiUpdate_rasEntry_retAddr,
  input  [7:0]  io_redirect_bits_cfiUpdate_rasEntry_ctr
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [63:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [63:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [63:0] _RAND_18;
  reg [31:0] _RAND_19;
`endif // RANDOMIZE_REG_INIT
  wire  reset_vector_delay_clock; // @[Hold.scala 97:23]
  wire [35:0] reset_vector_delay_io_in; // @[Hold.scala 97:23]
  wire [35:0] reset_vector_delay_io_out; // @[Hold.scala 97:23]
  wire  spec_clock; // @[RAS.scala 191:20]
  wire  spec_reset; // @[RAS.scala 191:20]
  wire  spec_io_push_valid; // @[RAS.scala 191:20]
  wire  spec_io_pop_valid; // @[RAS.scala 191:20]
  wire [38:0] spec_io_spec_new_addr; // @[RAS.scala 191:20]
  wire [4:0] spec_io_recover_sp; // @[RAS.scala 191:20]
  wire [38:0] spec_io_recover_top_retAddr; // @[RAS.scala 191:20]
  wire [7:0] spec_io_recover_top_ctr; // @[RAS.scala 191:20]
  wire  spec_io_recover_valid; // @[RAS.scala 191:20]
  wire  spec_io_recover_push; // @[RAS.scala 191:20]
  wire  spec_io_recover_pop; // @[RAS.scala 191:20]
  wire [38:0] spec_io_recover_new_addr; // @[RAS.scala 191:20]
  wire [4:0] spec_io_sp; // @[RAS.scala 191:20]
  wire [38:0] spec_io_top_retAddr; // @[RAS.scala 191:20]
  wire [7:0] spec_io_top_ctr; // @[RAS.scala 191:20]
  reg [38:0] s1_pc; // @[Reg.scala 16:16]
  reg [38:0] s2_pc; // @[Reg.scala 16:16]
  reg [38:0] s3_pc; // @[Reg.scala 16:16]
  reg  REG; // @[BPU.scala 209:24]
  reg  REG_1; // @[BPU.scala 209:16]
  wire [1:0] _s2_spec_new_addr_T = io_in_bits_resp_in_0_s2_full_pred_last_may_be_rvi_call ? 2'h2 : 2'h0; // @[RAS.scala 200:60]
  wire [38:0] _GEN_12 = {{37'd0}, _s2_spec_new_addr_T}; // @[RAS.scala 200:55]
  wire [38:0] s2_spec_new_addr = io_in_bits_resp_in_0_s2_full_pred_fallThroughAddr + _GEN_12; // @[RAS.scala 200:55]
  wire  _s2_spec_push_T = io_in_bits_resp_in_0_s2_full_pred_slot_valids_0 &
    io_in_bits_resp_in_0_s2_full_pred_br_taken_mask_0; // @[FrontendBundle.scala 435:69]
  wire  _s2_spec_push_T_2 = ~io_in_bits_resp_in_0_s2_full_pred_is_br_sharing; // @[FrontendBundle.scala 437:50]
  wire  _s2_spec_push_T_3 = io_in_bits_resp_in_0_s2_full_pred_is_br_sharing &
    io_in_bits_resp_in_0_s2_full_pred_br_taken_mask_1 | ~io_in_bits_resp_in_0_s2_full_pred_is_br_sharing; // @[FrontendBundle.scala 437:47]
  wire  _s2_spec_push_T_4 = io_in_bits_resp_in_0_s2_full_pred_slot_valids_1 & _s2_spec_push_T_3; // @[FrontendBundle.scala 436:25]
  wire  _s2_spec_push_T_5 = _s2_spec_push_T & io_in_bits_resp_in_0_s2_full_pred_hit; // @[FrontendBundle.scala 444:38]
  wire  _s2_spec_push_T_6 = _s2_spec_push_T_4 & io_in_bits_resp_in_0_s2_full_pred_hit; // @[FrontendBundle.scala 444:38]
  wire  _s2_spec_push_T_15 = ~_s2_spec_push_T_5 & _s2_spec_push_T_6; // @[FrontendBundle.scala 484:47]
  wire  _s2_spec_push_T_17 = _s2_spec_push_T_15 & _s2_spec_push_T_2; // @[FrontendBundle.scala 485:33]
  wire  _s2_spec_push_T_18 = _s2_spec_push_T_17 & io_in_bits_resp_in_0_s2_full_pred_is_call; // @[FrontendBundle.scala 486:44]
  wire  _s2_spec_push_T_20 = ~io_s3_redirect; // @[RAS.scala 206:67]
  wire  s2_spec_push = io_s2_fire & _s2_spec_push_T_18 & ~io_s3_redirect; // @[RAS.scala 206:64]
  wire  _s2_spec_pop_T_18 = _s2_spec_push_T_17 & io_in_bits_resp_in_0_s2_full_pred_is_ret; // @[FrontendBundle.scala 487:44]
  wire  s2_spec_pop = io_s2_fire & _s2_spec_pop_T_18 & _s2_spec_push_T_20; // @[RAS.scala 207:64]
  reg [38:0] s3_top_retAddr; // @[Reg.scala 16:16]
  reg [7:0] s3_top_ctr; // @[Reg.scala 16:16]
  reg [4:0] s3_sp; // @[Reg.scala 16:16]
  reg [38:0] s3_spec_new_addr; // @[Reg.scala 16:16]
  reg  s3_pushed_in_s2; // @[Reg.scala 16:16]
  reg  s3_popped_in_s2; // @[Reg.scala 16:16]
  wire  _s3_push_T = io_in_bits_resp_in_0_s3_full_pred_slot_valids_0 & io_in_bits_resp_in_0_s3_full_pred_br_taken_mask_0
    ; // @[FrontendBundle.scala 435:69]
  wire  _s3_push_T_2 = ~io_in_bits_resp_in_0_s3_full_pred_is_br_sharing; // @[FrontendBundle.scala 437:50]
  wire  _s3_push_T_3 = io_in_bits_resp_in_0_s3_full_pred_is_br_sharing &
    io_in_bits_resp_in_0_s3_full_pred_br_taken_mask_1 | ~io_in_bits_resp_in_0_s3_full_pred_is_br_sharing; // @[FrontendBundle.scala 437:47]
  wire  _s3_push_T_4 = io_in_bits_resp_in_0_s3_full_pred_slot_valids_1 & _s3_push_T_3; // @[FrontendBundle.scala 436:25]
  wire  _s3_push_T_5 = _s3_push_T & io_in_bits_resp_in_0_s3_full_pred_hit; // @[FrontendBundle.scala 444:38]
  wire  _s3_push_T_6 = _s3_push_T_4 & io_in_bits_resp_in_0_s3_full_pred_hit; // @[FrontendBundle.scala 444:38]
  wire  _s3_push_T_15 = ~_s3_push_T_5 & _s3_push_T_6; // @[FrontendBundle.scala 484:47]
  wire  _s3_push_T_17 = _s3_push_T_15 & _s3_push_T_2; // @[FrontendBundle.scala 485:33]
  wire  s3_push = _s3_push_T_17 & io_in_bits_resp_in_0_s3_full_pred_is_call; // @[FrontendBundle.scala 486:44]
  wire  s3_pop = _s3_push_T_17 & io_in_bits_resp_in_0_s3_full_pred_is_ret; // @[FrontendBundle.scala 487:44]
  wire  s3_recover = io_s3_fire & (s3_pushed_in_s2 != s3_push | s3_popped_in_s2 != s3_pop); // @[RAS.scala 242:31]
  reg  redirect_valid; // @[RAS.scala 247:25]
  reg  redirect_bits_level; // @[RAS.scala 247:25]
  reg [38:0] redirect_bits_cfiUpdate_pc; // @[RAS.scala 247:25]
  reg  redirect_bits_cfiUpdate_pd_isRVC; // @[RAS.scala 247:25]
  reg  redirect_bits_cfiUpdate_pd_isCall; // @[RAS.scala 247:25]
  reg  redirect_bits_cfiUpdate_pd_isRet; // @[RAS.scala 247:25]
  reg [4:0] redirect_bits_cfiUpdate_rasSp; // @[RAS.scala 247:25]
  reg [38:0] redirect_bits_cfiUpdate_rasEntry_retAddr; // @[RAS.scala 247:25]
  reg [7:0] redirect_bits_cfiUpdate_rasEntry_ctr; // @[RAS.scala 247:25]
  wire  do_recover = redirect_valid | s3_recover; // @[RAS.scala 248:35]
  wire  _retMissPred_T_1 = do_recover & ~redirect_bits_level; // @[RAS.scala 251:33]
  wire  retMissPred = do_recover & ~redirect_bits_level & redirect_bits_cfiUpdate_pd_isRet; // @[RAS.scala 251:64]
  wire  callMissPred = _retMissPred_T_1 & redirect_bits_cfiUpdate_pd_isCall; // @[RAS.scala 252:64]
  wire [2:0] _spec_io_recover_new_addr_T = redirect_bits_cfiUpdate_pd_isRVC ? 3'h2 : 3'h4; // @[RAS.scala 261:72]
  wire [38:0] _GEN_13 = {{36'd0}, _spec_io_recover_new_addr_T}; // @[RAS.scala 261:67]
  wire [38:0] _spec_io_recover_new_addr_T_2 = redirect_bits_cfiUpdate_pc + _GEN_13; // @[RAS.scala 261:67]
  DelayN_2 reset_vector_delay ( // @[Hold.scala 97:23]
    .clock(reset_vector_delay_clock),
    .io_in(reset_vector_delay_io_in),
    .io_out(reset_vector_delay_io_out)
  );
  RASStack spec ( // @[RAS.scala 191:20]
    .clock(spec_clock),
    .reset(spec_reset),
    .io_push_valid(spec_io_push_valid),
    .io_pop_valid(spec_io_pop_valid),
    .io_spec_new_addr(spec_io_spec_new_addr),
    .io_recover_sp(spec_io_recover_sp),
    .io_recover_top_retAddr(spec_io_recover_top_retAddr),
    .io_recover_top_ctr(spec_io_recover_top_ctr),
    .io_recover_valid(spec_io_recover_valid),
    .io_recover_push(spec_io_recover_push),
    .io_recover_pop(spec_io_recover_pop),
    .io_recover_new_addr(spec_io_recover_new_addr),
    .io_sp(spec_io_sp),
    .io_top_retAddr(spec_io_top_retAddr),
    .io_top_ctr(spec_io_top_ctr)
  );
  assign io_out_s2_pc = s2_pc; // @[BPU.scala 214:16]
  assign io_out_s2_full_pred_br_taken_mask_0 = io_in_bits_resp_in_0_s2_full_pred_br_taken_mask_0; // @[BPU.scala 193:10]
  assign io_out_s2_full_pred_br_taken_mask_1 = io_in_bits_resp_in_0_s2_full_pred_br_taken_mask_1; // @[BPU.scala 193:10]
  assign io_out_s2_full_pred_slot_valids_0 = io_in_bits_resp_in_0_s2_full_pred_slot_valids_0; // @[BPU.scala 193:10]
  assign io_out_s2_full_pred_slot_valids_1 = io_in_bits_resp_in_0_s2_full_pred_slot_valids_1; // @[BPU.scala 193:10]
  assign io_out_s2_full_pred_targets_0 = io_in_bits_resp_in_0_s2_full_pred_targets_0; // @[BPU.scala 193:10]
  assign io_out_s2_full_pred_targets_1 = io_in_bits_resp_in_0_s2_full_pred_is_jalr ? io_out_s2_full_pred_jalr_target :
    io_in_bits_resp_in_0_s2_full_pred_targets_1; // @[RAS.scala 219:28]
  assign io_out_s2_full_pred_jalr_target = io_in_bits_resp_in_0_s2_full_pred_is_ret & io_ctrl_ras_enable ?
    spec_io_top_retAddr : io_in_bits_resp_in_0_s2_full_pred_jalr_target; // @[BPU.scala 193:10 RAS.scala 215:41 216:20]
  assign io_out_s2_full_pred_offsets_0 = io_in_bits_resp_in_0_s2_full_pred_offsets_0; // @[BPU.scala 193:10]
  assign io_out_s2_full_pred_offsets_1 = io_in_bits_resp_in_0_s2_full_pred_offsets_1; // @[BPU.scala 193:10]
  assign io_out_s2_full_pred_fallThroughAddr = io_in_bits_resp_in_0_s2_full_pred_fallThroughAddr; // @[BPU.scala 193:10]
  assign io_out_s2_full_pred_fallThroughErr = io_in_bits_resp_in_0_s2_full_pred_fallThroughErr; // @[BPU.scala 193:10]
  assign io_out_s2_full_pred_is_br_sharing = io_in_bits_resp_in_0_s2_full_pred_is_br_sharing; // @[BPU.scala 193:10]
  assign io_out_s2_full_pred_hit = io_in_bits_resp_in_0_s2_full_pred_hit; // @[BPU.scala 193:10]
  assign io_out_s3_pc = s3_pc; // @[BPU.scala 215:16]
  assign io_out_s3_full_pred_br_taken_mask_0 = io_in_bits_resp_in_0_s3_full_pred_br_taken_mask_0; // @[BPU.scala 193:10]
  assign io_out_s3_full_pred_br_taken_mask_1 = io_in_bits_resp_in_0_s3_full_pred_br_taken_mask_1; // @[BPU.scala 193:10]
  assign io_out_s3_full_pred_slot_valids_0 = io_in_bits_resp_in_0_s3_full_pred_slot_valids_0; // @[BPU.scala 193:10]
  assign io_out_s3_full_pred_slot_valids_1 = io_in_bits_resp_in_0_s3_full_pred_slot_valids_1; // @[BPU.scala 193:10]
  assign io_out_s3_full_pred_targets_0 = io_in_bits_resp_in_0_s3_full_pred_targets_0; // @[BPU.scala 193:10]
  assign io_out_s3_full_pred_targets_1 = io_in_bits_resp_in_0_s3_full_pred_is_jalr ? io_out_s3_full_pred_jalr_target :
    io_in_bits_resp_in_0_s3_full_pred_targets_1; // @[RAS.scala 235:28]
  assign io_out_s3_full_pred_jalr_target = io_in_bits_resp_in_0_s3_full_pred_is_ret & io_ctrl_ras_enable ?
    s3_top_retAddr : io_in_bits_resp_in_0_s3_full_pred_jalr_target; // @[BPU.scala 193:10 RAS.scala 231:41 232:20]
  assign io_out_s3_full_pred_offsets_0 = io_in_bits_resp_in_0_s3_full_pred_offsets_0; // @[BPU.scala 193:10]
  assign io_out_s3_full_pred_offsets_1 = io_in_bits_resp_in_0_s3_full_pred_offsets_1; // @[BPU.scala 193:10]
  assign io_out_s3_full_pred_fallThroughAddr = io_in_bits_resp_in_0_s3_full_pred_fallThroughAddr; // @[BPU.scala 193:10]
  assign io_out_s3_full_pred_fallThroughErr = io_in_bits_resp_in_0_s3_full_pred_fallThroughErr; // @[BPU.scala 193:10]
  assign io_out_s3_full_pred_is_br_sharing = io_in_bits_resp_in_0_s3_full_pred_is_br_sharing; // @[BPU.scala 193:10]
  assign io_out_s3_full_pred_hit = io_in_bits_resp_in_0_s3_full_pred_hit; // @[BPU.scala 193:10]
  assign io_out_last_stage_spec_info_rasSp = s3_sp; // @[RAS.scala 243:38]
  assign io_out_last_stage_spec_info_rasTop_retAddr = s3_top_retAddr; // @[RAS.scala 244:38]
  assign io_out_last_stage_spec_info_rasTop_ctr = s3_top_ctr; // @[RAS.scala 244:38]
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
  assign spec_clock = clock;
  assign spec_reset = reset;
  assign spec_io_push_valid = io_s2_fire & _s2_spec_push_T_18 & ~io_s3_redirect; // @[RAS.scala 206:64]
  assign spec_io_pop_valid = io_s2_fire & _s2_spec_pop_T_18 & _s2_spec_push_T_20; // @[RAS.scala 207:64]
  assign spec_io_spec_new_addr = io_in_bits_resp_in_0_s2_full_pred_fallThroughAddr + _GEN_12; // @[RAS.scala 200:55]
  assign spec_io_recover_sp = redirect_valid ? redirect_bits_cfiUpdate_rasSp : s3_sp; // @[RAS.scala 259:30]
  assign spec_io_recover_top_retAddr = redirect_valid ? redirect_bits_cfiUpdate_rasEntry_retAddr : s3_top_retAddr; // @[RAS.scala 260:30]
  assign spec_io_recover_top_ctr = redirect_valid ? redirect_bits_cfiUpdate_rasEntry_ctr : s3_top_ctr; // @[RAS.scala 260:30]
  assign spec_io_recover_valid = redirect_valid | s3_recover; // @[RAS.scala 248:35]
  assign spec_io_recover_push = redirect_valid ? callMissPred : s3_push; // @[RAS.scala 256:31]
  assign spec_io_recover_pop = redirect_valid ? retMissPred : s3_pop; // @[RAS.scala 257:31]
  assign spec_io_recover_new_addr = redirect_valid ? _spec_io_recover_new_addr_T_2 : s3_spec_new_addr; // @[RAS.scala 261:35]
  always @(posedge clock) begin
    if (REG_1) begin // @[BPU.scala 209:58]
      s1_pc <= {{3'd0}, reset_vector_delay_io_out}; // @[BPU.scala 210:11]
    end else if (io_s0_fire) begin // @[Reg.scala 17:18]
      s1_pc <= io_in_bits_s0_pc; // @[Reg.scala 17:22]
    end
    if (io_s1_fire) begin // @[Reg.scala 17:18]
      s2_pc <= s1_pc; // @[Reg.scala 17:22]
    end
    if (io_s2_fire) begin // @[Reg.scala 17:18]
      s3_pc <= s2_pc; // @[Reg.scala 17:22]
    end
    REG <= reset; // @[BPU.scala 209:31]
    REG_1 <= REG & ~reset; // @[BPU.scala 209:39]
    if (io_s2_fire) begin // @[Reg.scala 17:18]
      s3_top_retAddr <= spec_io_top_retAddr; // @[Reg.scala 17:22]
    end
    if (io_s2_fire) begin // @[Reg.scala 17:18]
      s3_top_ctr <= spec_io_top_ctr; // @[Reg.scala 17:22]
    end
    if (io_s2_fire) begin // @[Reg.scala 17:18]
      s3_sp <= spec_io_sp; // @[Reg.scala 17:22]
    end
    if (io_s2_fire) begin // @[Reg.scala 17:18]
      s3_spec_new_addr <= s2_spec_new_addr; // @[Reg.scala 17:22]
    end
    if (io_s2_fire) begin // @[Reg.scala 17:18]
      s3_pushed_in_s2 <= s2_spec_push; // @[Reg.scala 17:22]
    end
    if (io_s2_fire) begin // @[Reg.scala 17:18]
      s3_popped_in_s2 <= s2_spec_pop; // @[Reg.scala 17:22]
    end
    redirect_valid <= io_redirect_valid; // @[RAS.scala 247:25]
    redirect_bits_level <= io_redirect_bits_level; // @[RAS.scala 247:25]
    redirect_bits_cfiUpdate_pc <= io_redirect_bits_cfiUpdate_pc; // @[RAS.scala 247:25]
    redirect_bits_cfiUpdate_pd_isRVC <= io_redirect_bits_cfiUpdate_pd_isRVC; // @[RAS.scala 247:25]
    redirect_bits_cfiUpdate_pd_isCall <= io_redirect_bits_cfiUpdate_pd_isCall; // @[RAS.scala 247:25]
    redirect_bits_cfiUpdate_pd_isRet <= io_redirect_bits_cfiUpdate_pd_isRet; // @[RAS.scala 247:25]
    redirect_bits_cfiUpdate_rasSp <= io_redirect_bits_cfiUpdate_rasSp; // @[RAS.scala 247:25]
    redirect_bits_cfiUpdate_rasEntry_retAddr <= io_redirect_bits_cfiUpdate_rasEntry_retAddr; // @[RAS.scala 247:25]
    redirect_bits_cfiUpdate_rasEntry_ctr <= io_redirect_bits_cfiUpdate_rasEntry_ctr; // @[RAS.scala 247:25]
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
  _RAND_0 = {2{`RANDOM}};
  s1_pc = _RAND_0[38:0];
  _RAND_1 = {2{`RANDOM}};
  s2_pc = _RAND_1[38:0];
  _RAND_2 = {2{`RANDOM}};
  s3_pc = _RAND_2[38:0];
  _RAND_3 = {1{`RANDOM}};
  REG = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  REG_1 = _RAND_4[0:0];
  _RAND_5 = {2{`RANDOM}};
  s3_top_retAddr = _RAND_5[38:0];
  _RAND_6 = {1{`RANDOM}};
  s3_top_ctr = _RAND_6[7:0];
  _RAND_7 = {1{`RANDOM}};
  s3_sp = _RAND_7[4:0];
  _RAND_8 = {2{`RANDOM}};
  s3_spec_new_addr = _RAND_8[38:0];
  _RAND_9 = {1{`RANDOM}};
  s3_pushed_in_s2 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  s3_popped_in_s2 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  redirect_valid = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  redirect_bits_level = _RAND_12[0:0];
  _RAND_13 = {2{`RANDOM}};
  redirect_bits_cfiUpdate_pc = _RAND_13[38:0];
  _RAND_14 = {1{`RANDOM}};
  redirect_bits_cfiUpdate_pd_isRVC = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  redirect_bits_cfiUpdate_pd_isCall = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  redirect_bits_cfiUpdate_pd_isRet = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  redirect_bits_cfiUpdate_rasSp = _RAND_17[4:0];
  _RAND_18 = {2{`RANDOM}};
  redirect_bits_cfiUpdate_rasEntry_retAddr = _RAND_18[38:0];
  _RAND_19 = {1{`RANDOM}};
  redirect_bits_cfiUpdate_rasEntry_ctr = _RAND_19[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

