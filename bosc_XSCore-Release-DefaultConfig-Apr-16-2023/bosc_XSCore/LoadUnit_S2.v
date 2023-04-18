module LoadUnit_S2(
  input          clock,
  input          io_in_valid,
  input  [9:0]   io_in_bits_uop_cf_foldpc,
  input          io_in_bits_uop_cf_exceptionVec_4,
  input          io_in_bits_uop_cf_exceptionVec_5,
  input          io_in_bits_uop_cf_exceptionVec_13,
  input          io_in_bits_uop_cf_trigger_backendEn_1,
  input          io_in_bits_uop_cf_trigger_backendHit_0,
  input          io_in_bits_uop_cf_trigger_backendHit_1,
  input          io_in_bits_uop_cf_trigger_backendHit_4,
  input          io_in_bits_uop_cf_waitForRobIdx_flag,
  input  [4:0]   io_in_bits_uop_cf_waitForRobIdx_value,
  input          io_in_bits_uop_cf_loadWaitBit,
  input          io_in_bits_uop_cf_loadWaitStrict,
  input          io_in_bits_uop_cf_ftqPtr_flag,
  input  [2:0]   io_in_bits_uop_cf_ftqPtr_value,
  input  [2:0]   io_in_bits_uop_cf_ftqOffset,
  input  [3:0]   io_in_bits_uop_ctrl_fuType,
  input  [6:0]   io_in_bits_uop_ctrl_fuOpType,
  input          io_in_bits_uop_ctrl_rfWen,
  input          io_in_bits_uop_ctrl_fpWen,
  input  [5:0]   io_in_bits_uop_pdest,
  input          io_in_bits_uop_robIdx_flag,
  input  [4:0]   io_in_bits_uop_robIdx_value,
  input          io_in_bits_uop_lqIdx_flag,
  input  [3:0]   io_in_bits_uop_lqIdx_value,
  input          io_in_bits_uop_sqIdx_flag,
  input  [3:0]   io_in_bits_uop_sqIdx_value,
  input  [38:0]  io_in_bits_vaddr,
  input  [35:0]  io_in_bits_paddr,
  input  [15:0]  io_in_bits_mask,
  input          io_in_bits_tlbMiss,
  input          io_in_bits_isPrefetch,
  input          io_in_bits_isHWPrefetch,
  input          io_in_bits_vec128bit,
  input          io_in_bits_isFirstIssue,
  input          io_in_bits_rarAllocated,
  input  [3:0]   io_in_bits_rarIndex,
  input          io_in_bits_rawAllocated,
  input  [2:0]   io_in_bits_rawIndex,
  input          io_in_bits_replayInfo_cause_2,
  input          io_in_bits_replayInfo_cause_4,
  output         io_out_valid,
  output [9:0]   io_out_bits_uop_cf_foldpc,
  output         io_out_bits_uop_cf_exceptionVec_4,
  output         io_out_bits_uop_cf_exceptionVec_5,
  output         io_out_bits_uop_cf_exceptionVec_13,
  output         io_out_bits_uop_cf_trigger_backendEn_1,
  output         io_out_bits_uop_cf_trigger_backendHit_0,
  output         io_out_bits_uop_cf_trigger_backendHit_1,
  output         io_out_bits_uop_cf_trigger_backendHit_4,
  output         io_out_bits_uop_cf_waitForRobIdx_flag,
  output [4:0]   io_out_bits_uop_cf_waitForRobIdx_value,
  output         io_out_bits_uop_cf_loadWaitBit,
  output         io_out_bits_uop_cf_loadWaitStrict,
  output         io_out_bits_uop_cf_ftqPtr_flag,
  output [2:0]   io_out_bits_uop_cf_ftqPtr_value,
  output [2:0]   io_out_bits_uop_cf_ftqOffset,
  output [3:0]   io_out_bits_uop_ctrl_fuType,
  output [6:0]   io_out_bits_uop_ctrl_fuOpType,
  output         io_out_bits_uop_ctrl_rfWen,
  output         io_out_bits_uop_ctrl_fpWen,
  output [5:0]   io_out_bits_uop_pdest,
  output         io_out_bits_uop_robIdx_flag,
  output [4:0]   io_out_bits_uop_robIdx_value,
  output         io_out_bits_uop_lqIdx_flag,
  output [3:0]   io_out_bits_uop_lqIdx_value,
  output         io_out_bits_uop_sqIdx_flag,
  output [3:0]   io_out_bits_uop_sqIdx_value,
  output [38:0]  io_out_bits_vaddr,
  output [35:0]  io_out_bits_paddr,
  output [15:0]  io_out_bits_mask,
  output         io_out_bits_miss,
  output         io_out_bits_tlbMiss,
  output         io_out_bits_mmio,
  output         io_out_bits_isPrefetch,
  output         io_out_bits_isHWPrefetch,
  output         io_out_bits_vec128bit,
  output         io_out_bits_rarAllocated,
  output [3:0]   io_out_bits_rarIndex,
  output         io_out_bits_rawAllocated,
  output [2:0]   io_out_bits_rawIndex,
  output [1:0]   io_out_bits_replayInfo_missMSHRId,
  output         io_out_bits_replayInfo_canForwardFullData,
  output         io_out_bits_replayInfo_dataInvalidSqIdx_flag,
  output [3:0]   io_out_bits_replayInfo_dataInvalidSqIdx_value,
  output         io_out_bits_replayInfo_addrInvalidSqIdx_flag,
  output [3:0]   io_out_bits_replayInfo_addrInvalidSqIdx_value,
  output [7:0]   io_out_bits_replayInfo_replayCarry_real_way_en,
  output         io_out_bits_replayInfo_replayCarry_valid,
  output         io_out_bits_replayInfo_dataInLastBeat,
  output         io_out_bits_replayInfo_cause_0,
  output         io_out_bits_replayInfo_cause_1,
  output         io_out_bits_replayInfo_cause_2,
  output         io_out_bits_replayInfo_cause_4,
  output         io_out_bits_replayInfo_cause_5,
  output         io_out_bits_replayInfo_cause_6,
  output         io_out_bits_replayInfo_cause_7,
  input  [127:0] io_dcacheResp_bits_data_delayed,
  input          io_dcacheResp_bits_miss,
  input          io_dcacheResp_bits_replay,
  input  [7:0]   io_dcacheResp_bits_replayCarry_real_way_en,
  input          io_dcacheResp_bits_replayCarry_valid,
  input          io_dcacheResp_bits_tag_error,
  input  [1:0]   io_dcacheResp_bits_mshr_id,
  input          io_pmpResp_ld,
  input          io_pmpResp_mmio,
  input          io_lsq_forwardMask_0,
  input          io_lsq_forwardMask_1,
  input          io_lsq_forwardMask_2,
  input          io_lsq_forwardMask_3,
  input          io_lsq_forwardMask_4,
  input          io_lsq_forwardMask_5,
  input          io_lsq_forwardMask_6,
  input          io_lsq_forwardMask_7,
  input          io_lsq_forwardMask_8,
  input          io_lsq_forwardMask_9,
  input          io_lsq_forwardMask_10,
  input          io_lsq_forwardMask_11,
  input          io_lsq_forwardMask_12,
  input          io_lsq_forwardMask_13,
  input          io_lsq_forwardMask_14,
  input          io_lsq_forwardMask_15,
  input  [7:0]   io_lsq_forwardData_0,
  input  [7:0]   io_lsq_forwardData_1,
  input  [7:0]   io_lsq_forwardData_2,
  input  [7:0]   io_lsq_forwardData_3,
  input  [7:0]   io_lsq_forwardData_4,
  input  [7:0]   io_lsq_forwardData_5,
  input  [7:0]   io_lsq_forwardData_6,
  input  [7:0]   io_lsq_forwardData_7,
  input  [7:0]   io_lsq_forwardData_8,
  input  [7:0]   io_lsq_forwardData_9,
  input  [7:0]   io_lsq_forwardData_10,
  input  [7:0]   io_lsq_forwardData_11,
  input  [7:0]   io_lsq_forwardData_12,
  input  [7:0]   io_lsq_forwardData_13,
  input  [7:0]   io_lsq_forwardData_14,
  input  [7:0]   io_lsq_forwardData_15,
  input          io_lsq_dataInvalid,
  input          io_lsq_schedWait,
  input          io_dataInvalidSqIdx_flag,
  input  [3:0]   io_dataInvalidSqIdx_value,
  input          io_addrInvalidSqIdx_flag,
  input  [3:0]   io_addrInvalidSqIdx_value,
  input          io_sbuffer_forwardMask_0,
  input          io_sbuffer_forwardMask_1,
  input          io_sbuffer_forwardMask_2,
  input          io_sbuffer_forwardMask_3,
  input          io_sbuffer_forwardMask_4,
  input          io_sbuffer_forwardMask_5,
  input          io_sbuffer_forwardMask_6,
  input          io_sbuffer_forwardMask_7,
  input          io_sbuffer_forwardMask_8,
  input          io_sbuffer_forwardMask_9,
  input          io_sbuffer_forwardMask_10,
  input          io_sbuffer_forwardMask_11,
  input          io_sbuffer_forwardMask_12,
  input          io_sbuffer_forwardMask_13,
  input          io_sbuffer_forwardMask_14,
  input          io_sbuffer_forwardMask_15,
  input  [7:0]   io_sbuffer_forwardData_0,
  input  [7:0]   io_sbuffer_forwardData_1,
  input  [7:0]   io_sbuffer_forwardData_2,
  input  [7:0]   io_sbuffer_forwardData_3,
  input  [7:0]   io_sbuffer_forwardData_4,
  input  [7:0]   io_sbuffer_forwardData_5,
  input  [7:0]   io_sbuffer_forwardData_6,
  input  [7:0]   io_sbuffer_forwardData_7,
  input  [7:0]   io_sbuffer_forwardData_8,
  input  [7:0]   io_sbuffer_forwardData_9,
  input  [7:0]   io_sbuffer_forwardData_10,
  input  [7:0]   io_sbuffer_forwardData_11,
  input  [7:0]   io_sbuffer_forwardData_12,
  input  [7:0]   io_sbuffer_forwardData_13,
  input  [7:0]   io_sbuffer_forwardData_14,
  input  [7:0]   io_sbuffer_forwardData_15,
  output         io_dataForwarded,
  output         io_dcache_kill,
  input          io_correctTableQueryResp_strict,
  output         io_loadLoadViolationQueryReq_valid,
  output         io_loadLoadViolationQueryReq_bits_uop_robIdx_flag,
  output [4:0]   io_loadLoadViolationQueryReq_bits_uop_robIdx_value,
  output         io_loadLoadViolationQueryReq_bits_uop_lqIdx_flag,
  output [3:0]   io_loadLoadViolationQueryReq_bits_uop_lqIdx_value,
  output [3:0]   io_loadLoadViolationQueryReq_bits_index,
  output         io_loadLoadViolationQueryReq_bits_allocated,
  output         io_loadLoadViolationQueryReq_bits_datavalid,
  output         io_loadLoadViolationQueryReq_bits_miss,
  output [35:0]  io_loadLoadViolationQueryReq_bits_paddr,
  output         io_storeLoadViolationQueryReq_valid,
  output [9:0]   io_storeLoadViolationQueryReq_bits_uop_cf_foldpc,
  output         io_storeLoadViolationQueryReq_bits_uop_cf_ftqPtr_flag,
  output [2:0]   io_storeLoadViolationQueryReq_bits_uop_cf_ftqPtr_value,
  output [2:0]   io_storeLoadViolationQueryReq_bits_uop_cf_ftqOffset,
  output         io_storeLoadViolationQueryReq_bits_uop_robIdx_flag,
  output [4:0]   io_storeLoadViolationQueryReq_bits_uop_robIdx_value,
  output         io_storeLoadViolationQueryReq_bits_uop_sqIdx_flag,
  output [3:0]   io_storeLoadViolationQueryReq_bits_uop_sqIdx_value,
  output [2:0]   io_storeLoadViolationQueryReq_bits_index,
  output         io_storeLoadViolationQueryReq_bits_allocated,
  output         io_storeLoadViolationQueryReq_bits_datavalid,
  output [7:0]   io_storeLoadViolationQueryReq_bits_mask,
  output [35:0]  io_storeLoadViolationQueryReq_bits_paddr,
  output         io_correctTableUpdate_valid,
  output [9:0]   io_correctTableUpdate_bits_addr,
  output         io_correctTableUpdate_bits_strict,
  output         io_correctTableUpdate_bits_violation,
  input          io_csrCtrl_cache_error_enable,
  input          io_static_pm_valid,
  input          io_static_pm_bits,
  output [127:0] io_loadDataFromDcache_respDcacheData,
  output         io_loadDataFromDcache_forwardMask_0,
  output         io_loadDataFromDcache_forwardMask_1,
  output         io_loadDataFromDcache_forwardMask_2,
  output         io_loadDataFromDcache_forwardMask_3,
  output         io_loadDataFromDcache_forwardMask_4,
  output         io_loadDataFromDcache_forwardMask_5,
  output         io_loadDataFromDcache_forwardMask_6,
  output         io_loadDataFromDcache_forwardMask_7,
  output         io_loadDataFromDcache_forwardMask_8,
  output         io_loadDataFromDcache_forwardMask_9,
  output         io_loadDataFromDcache_forwardMask_10,
  output         io_loadDataFromDcache_forwardMask_11,
  output         io_loadDataFromDcache_forwardMask_12,
  output         io_loadDataFromDcache_forwardMask_13,
  output         io_loadDataFromDcache_forwardMask_14,
  output         io_loadDataFromDcache_forwardMask_15,
  output [7:0]   io_loadDataFromDcache_forwardData_0,
  output [7:0]   io_loadDataFromDcache_forwardData_1,
  output [7:0]   io_loadDataFromDcache_forwardData_2,
  output [7:0]   io_loadDataFromDcache_forwardData_3,
  output [7:0]   io_loadDataFromDcache_forwardData_4,
  output [7:0]   io_loadDataFromDcache_forwardData_5,
  output [7:0]   io_loadDataFromDcache_forwardData_6,
  output [7:0]   io_loadDataFromDcache_forwardData_7,
  output [7:0]   io_loadDataFromDcache_forwardData_8,
  output [7:0]   io_loadDataFromDcache_forwardData_9,
  output [7:0]   io_loadDataFromDcache_forwardData_10,
  output [7:0]   io_loadDataFromDcache_forwardData_11,
  output [7:0]   io_loadDataFromDcache_forwardData_12,
  output [7:0]   io_loadDataFromDcache_forwardData_13,
  output [7:0]   io_loadDataFromDcache_forwardData_14,
  output [7:0]   io_loadDataFromDcache_forwardData_15,
  output [6:0]   io_loadDataFromDcache_uop_ctrl_fuOpType,
  output         io_loadDataFromDcache_uop_ctrl_fpWen,
  output [3:0]   io_loadDataFromDcache_addrOffset,
  output         io_loadDataFromDcache_forward_D,
  output [7:0]   io_loadDataFromDcache_forwardData_D_0,
  output [7:0]   io_loadDataFromDcache_forwardData_D_1,
  output [7:0]   io_loadDataFromDcache_forwardData_D_2,
  output [7:0]   io_loadDataFromDcache_forwardData_D_3,
  output [7:0]   io_loadDataFromDcache_forwardData_D_4,
  output [7:0]   io_loadDataFromDcache_forwardData_D_5,
  output [7:0]   io_loadDataFromDcache_forwardData_D_6,
  output [7:0]   io_loadDataFromDcache_forwardData_D_7,
  output [7:0]   io_loadDataFromDcache_forwardData_D_8,
  output [7:0]   io_loadDataFromDcache_forwardData_D_9,
  output [7:0]   io_loadDataFromDcache_forwardData_D_10,
  output [7:0]   io_loadDataFromDcache_forwardData_D_11,
  output [7:0]   io_loadDataFromDcache_forwardData_D_12,
  output [7:0]   io_loadDataFromDcache_forwardData_D_13,
  output [7:0]   io_loadDataFromDcache_forwardData_D_14,
  output [7:0]   io_loadDataFromDcache_forwardData_D_15,
  output         io_loadDataFromDcache_forward_mshr,
  output [7:0]   io_loadDataFromDcache_forwardData_mshr_0,
  output [7:0]   io_loadDataFromDcache_forwardData_mshr_1,
  output [7:0]   io_loadDataFromDcache_forwardData_mshr_2,
  output [7:0]   io_loadDataFromDcache_forwardData_mshr_3,
  output [7:0]   io_loadDataFromDcache_forwardData_mshr_4,
  output [7:0]   io_loadDataFromDcache_forwardData_mshr_5,
  output [7:0]   io_loadDataFromDcache_forwardData_mshr_6,
  output [7:0]   io_loadDataFromDcache_forwardData_mshr_7,
  output [7:0]   io_loadDataFromDcache_forwardData_mshr_8,
  output [7:0]   io_loadDataFromDcache_forwardData_mshr_9,
  output [7:0]   io_loadDataFromDcache_forwardData_mshr_10,
  output [7:0]   io_loadDataFromDcache_forwardData_mshr_11,
  output [7:0]   io_loadDataFromDcache_forwardData_mshr_12,
  output [7:0]   io_loadDataFromDcache_forwardData_mshr_13,
  output [7:0]   io_loadDataFromDcache_forwardData_mshr_14,
  output [7:0]   io_loadDataFromDcache_forwardData_mshr_15,
  output         io_loadDataFromDcache_forward_result_valid,
  input          io_reExecuteQuery_0_valid,
  input          io_reExecuteQuery_0_bits_robIdx_flag,
  input  [4:0]   io_reExecuteQuery_0_bits_robIdx_value,
  input  [35:0]  io_reExecuteQuery_0_bits_paddr,
  input  [15:0]  io_reExecuteQuery_0_bits_mask,
  input          io_reExecuteQuery_1_valid,
  input          io_reExecuteQuery_1_bits_robIdx_flag,
  input  [4:0]   io_reExecuteQuery_1_bits_robIdx_value,
  input  [35:0]  io_reExecuteQuery_1_bits_paddr,
  input  [15:0]  io_reExecuteQuery_1_bits_mask,
  input          io_forward_D,
  input  [7:0]   io_forwardData_D_0,
  input  [7:0]   io_forwardData_D_1,
  input  [7:0]   io_forwardData_D_2,
  input  [7:0]   io_forwardData_D_3,
  input  [7:0]   io_forwardData_D_4,
  input  [7:0]   io_forwardData_D_5,
  input  [7:0]   io_forwardData_D_6,
  input  [7:0]   io_forwardData_D_7,
  input  [7:0]   io_forwardData_D_8,
  input  [7:0]   io_forwardData_D_9,
  input  [7:0]   io_forwardData_D_10,
  input  [7:0]   io_forwardData_D_11,
  input  [7:0]   io_forwardData_D_12,
  input  [7:0]   io_forwardData_D_13,
  input  [7:0]   io_forwardData_D_14,
  input  [7:0]   io_forwardData_D_15,
  input          io_forward_mshr,
  input  [7:0]   io_forwardData_mshr_0,
  input  [7:0]   io_forwardData_mshr_1,
  input  [7:0]   io_forwardData_mshr_2,
  input  [7:0]   io_forwardData_mshr_3,
  input  [7:0]   io_forwardData_mshr_4,
  input  [7:0]   io_forwardData_mshr_5,
  input  [7:0]   io_forwardData_mshr_6,
  input  [7:0]   io_forwardData_mshr_7,
  input  [7:0]   io_forwardData_mshr_8,
  input  [7:0]   io_forwardData_mshr_9,
  input  [7:0]   io_forwardData_mshr_10,
  input  [7:0]   io_forwardData_mshr_11,
  input  [7:0]   io_forwardData_mshr_12,
  input  [7:0]   io_forwardData_mshr_13,
  input  [7:0]   io_forwardData_mshr_14,
  input  [7:0]   io_forwardData_mshr_15,
  input          io_forward_result_valid
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
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
`endif // RANDOMIZE_REG_INIT
  wire  pmp_ld = io_static_pm_valid ? 1'h0 : io_pmpResp_ld; // @[LoadUnit.scala 573:29 574:12]
  wire  pmp_mmio = io_static_pm_valid ? io_static_pm_bits : io_pmpResp_mmio; // @[LoadUnit.scala 573:29 577:14]
  wire  forward_D_or_mshr_valid = io_forward_result_valid & (io_forward_D | io_forward_mshr); // @[LoadUnit.scala 583:57]
  wire  s2_exception_vec_4 = io_in_bits_isPrefetch | io_in_bits_tlbMiss ? 1'h0 : io_in_bits_uop_cf_exceptionVec_4; // @[LoadUnit.scala 594:47 595:22]
  wire  s2_exception_vec_5 = io_in_bits_isPrefetch | io_in_bits_tlbMiss ? 1'h0 : io_in_bits_uop_cf_exceptionVec_5 |
    pmp_ld; // @[LoadUnit.scala 594:47 595:22 592:37]
  wire  s2_exception_vec_13 = io_in_bits_isPrefetch | io_in_bits_tlbMiss ? 1'h0 : io_in_bits_uop_cf_exceptionVec_13; // @[LoadUnit.scala 594:47 595:22]
  wire [15:0] _s2_exception_T = {2'h0,s2_exception_vec_13,1'h0,4'h0,2'h0,s2_exception_vec_5,s2_exception_vec_4,4'h0}; // @[LoadUnit.scala 597:71]
  wire  s2_exception = |_s2_exception_T; // @[LoadUnit.scala 597:78]
  wire  _s2_mmio_T = ~io_in_bits_isPrefetch; // @[LoadUnit.scala 620:17]
  wire  _s2_mmio_T_2 = ~s2_exception; // @[LoadUnit.scala 620:53]
  wire  s2_mmio = ~io_in_bits_isPrefetch & pmp_mmio & ~s2_exception; // @[LoadUnit.scala 620:50]
  wire  _s2_cache_miss_T = ~forward_D_or_mshr_valid; // @[LoadUnit.scala 621:50]
  wire  s2_cache_miss = io_dcacheResp_bits_miss & ~forward_D_or_mshr_valid; // @[LoadUnit.scala 621:47]
  wire  s2_cache_replay = io_dcacheResp_bits_replay & _s2_cache_miss_T; // @[LoadUnit.scala 622:51]
  wire  _s2_wait_store_T = io_correctTableQueryResp_strict & io_in_bits_isFirstIssue; // @[LoadUnit.scala 625:55]
  wire  _s2_wait_store_T_1 = _s2_wait_store_T & io_in_bits_uop_cf_loadWaitBit; // @[LoadUnit.scala 626:47]
  wire  s2_wait_store_differentFlag = io_in_bits_uop_cf_waitForRobIdx_flag ^ io_in_bits_uop_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  s2_wait_store_compare = io_in_bits_uop_cf_waitForRobIdx_value > io_in_bits_uop_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _s2_wait_store_T_2 = s2_wait_store_differentFlag ^ s2_wait_store_compare; // @[CircularQueuePtr.scala 88:19]
  wire  _s2_wait_store_T_3 = ~_s2_wait_store_T_2; // @[LoadUnit.scala 628:23]
  wire  _s2_wait_store_T_4 = _s2_wait_store_T_1 & _s2_wait_store_T_3; // @[LoadUnit.scala 627:53]
  wire  s2_wait_store = _s2_wait_store_T_4 & _s2_mmio_T; // @[LoadUnit.scala 628:88]
  wire  s2_data_invalid = io_lsq_dataInvalid & _s2_mmio_T_2; // @[LoadUnit.scala 630:44]
  wire  s2_schedError_differentFlag = io_in_bits_uop_robIdx_flag ^ io_reExecuteQuery_0_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  s2_schedError_compare = io_in_bits_uop_robIdx_value > io_reExecuteQuery_0_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _s2_schedError_T = s2_schedError_differentFlag ^ s2_schedError_compare; // @[CircularQueuePtr.scala 88:19]
  wire  _s2_schedError_T_1 = io_reExecuteQuery_0_valid & _s2_schedError_T; // @[LoadUnit.scala 645:96]
  wire  _s2_schedError_T_4 = io_in_bits_paddr[35:3] == io_reExecuteQuery_0_bits_paddr[35:3]; // @[LoadUnit.scala 647:56]
  wire  _s2_schedError_T_5 = _s2_schedError_T_1 & _s2_schedError_T_4; // @[LoadUnit.scala 646:96]
  wire [15:0] _s2_schedError_T_6 = io_in_bits_mask & io_reExecuteQuery_0_bits_mask; // @[LoadUnit.scala 648:40]
  wire  _s2_schedError_T_7 = |_s2_schedError_T_6; // @[LoadUnit.scala 648:74]
  wire  _s2_schedError_T_8 = _s2_schedError_T_5 & _s2_schedError_T_7; // @[LoadUnit.scala 647:109]
  wire  s2_schedError_differentFlag_1 = io_in_bits_uop_robIdx_flag ^ io_reExecuteQuery_1_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  s2_schedError_compare_1 = io_in_bits_uop_robIdx_value > io_reExecuteQuery_1_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _s2_schedError_T_9 = s2_schedError_differentFlag_1 ^ s2_schedError_compare_1; // @[CircularQueuePtr.scala 88:19]
  wire  _s2_schedError_T_10 = io_reExecuteQuery_1_valid & _s2_schedError_T_9; // @[LoadUnit.scala 645:96]
  wire  _s2_schedError_T_13 = io_in_bits_paddr[35:3] == io_reExecuteQuery_1_bits_paddr[35:3]; // @[LoadUnit.scala 647:56]
  wire  _s2_schedError_T_14 = _s2_schedError_T_10 & _s2_schedError_T_13; // @[LoadUnit.scala 646:96]
  wire [15:0] _s2_schedError_T_15 = io_in_bits_mask & io_reExecuteQuery_1_bits_mask; // @[LoadUnit.scala 648:40]
  wire  _s2_schedError_T_16 = |_s2_schedError_T_15; // @[LoadUnit.scala 648:74]
  wire  _s2_schedError_T_17 = _s2_schedError_T_14 & _s2_schedError_T_16; // @[LoadUnit.scala 647:109]
  wire [1:0] _s2_schedError_T_18 = {_s2_schedError_T_17,_s2_schedError_T_8}; // @[LoadUnit.scala 648:80]
  wire  _s2_schedError_T_20 = ~io_in_bits_tlbMiss; // @[LoadUnit.scala 649:31]
  wire  s2_schedError = |_s2_schedError_T_18 & _s2_schedError_T_20; // @[LoadUnit.scala 648:91]
  wire  _io_loadLoadViolationQueryReq_valid_T_1 = io_in_valid & _s2_schedError_T_20; // @[LoadUnit.scala 658:53]
  wire  _io_loadLoadViolationQueryReq_valid_T_6 = ~s2_mmio; // @[LoadUnit.scala 658:108]
  wire  forwardMask_0 = io_lsq_forwardMask_0 | io_sbuffer_forwardMask_0; // @[LoadUnit.scala 692:45]
  wire  forwardMask_1 = io_lsq_forwardMask_1 | io_sbuffer_forwardMask_1; // @[LoadUnit.scala 692:45]
  wire  forwardMask_2 = io_lsq_forwardMask_2 | io_sbuffer_forwardMask_2; // @[LoadUnit.scala 692:45]
  wire  forwardMask_3 = io_lsq_forwardMask_3 | io_sbuffer_forwardMask_3; // @[LoadUnit.scala 692:45]
  wire  forwardMask_4 = io_lsq_forwardMask_4 | io_sbuffer_forwardMask_4; // @[LoadUnit.scala 692:45]
  wire  forwardMask_5 = io_lsq_forwardMask_5 | io_sbuffer_forwardMask_5; // @[LoadUnit.scala 692:45]
  wire  forwardMask_6 = io_lsq_forwardMask_6 | io_sbuffer_forwardMask_6; // @[LoadUnit.scala 692:45]
  wire  forwardMask_7 = io_lsq_forwardMask_7 | io_sbuffer_forwardMask_7; // @[LoadUnit.scala 692:45]
  wire  forwardMask_8 = io_lsq_forwardMask_8 | io_sbuffer_forwardMask_8; // @[LoadUnit.scala 692:45]
  wire  forwardMask_9 = io_lsq_forwardMask_9 | io_sbuffer_forwardMask_9; // @[LoadUnit.scala 692:45]
  wire  forwardMask_10 = io_lsq_forwardMask_10 | io_sbuffer_forwardMask_10; // @[LoadUnit.scala 692:45]
  wire  forwardMask_11 = io_lsq_forwardMask_11 | io_sbuffer_forwardMask_11; // @[LoadUnit.scala 692:45]
  wire  forwardMask_12 = io_lsq_forwardMask_12 | io_sbuffer_forwardMask_12; // @[LoadUnit.scala 692:45]
  wire  forwardMask_13 = io_lsq_forwardMask_13 | io_sbuffer_forwardMask_13; // @[LoadUnit.scala 692:45]
  wire  forwardMask_14 = io_lsq_forwardMask_14 | io_sbuffer_forwardMask_14; // @[LoadUnit.scala 692:45]
  wire  forwardMask_15 = io_lsq_forwardMask_15 | io_sbuffer_forwardMask_15; // @[LoadUnit.scala 692:45]
  wire [7:0] fullForward_lo = {forwardMask_7,forwardMask_6,forwardMask_5,forwardMask_4,forwardMask_3,forwardMask_2,
    forwardMask_1,forwardMask_0}; // @[LoadUnit.scala 697:36]
  wire [15:0] _fullForward_T = {forwardMask_15,forwardMask_14,forwardMask_13,forwardMask_12,forwardMask_11,
    forwardMask_10,forwardMask_9,forwardMask_8,fullForward_lo}; // @[LoadUnit.scala 697:36]
  wire [15:0] _fullForward_T_1 = ~_fullForward_T; // @[LoadUnit.scala 697:23]
  wire [15:0] _fullForward_T_2 = _fullForward_T_1 & io_in_bits_mask; // @[LoadUnit.scala 697:51]
  wire  fullForward = _fullForward_T_2 == 16'h0 & ~io_lsq_dataInvalid; // @[LoadUnit.scala 697:70]
  wire  _io_out_bits_miss_T_1 = s2_cache_miss & _s2_mmio_T_2; // @[LoadUnit.scala 748:39]
  wire  _io_out_bits_miss_T_3 = _io_out_bits_miss_T_1 & _s2_mmio_T; // @[LoadUnit.scala 749:21]
  reg  r__0; // @[Reg.scala 16:16]
  reg  r__1; // @[Reg.scala 16:16]
  reg  r__2; // @[Reg.scala 16:16]
  reg  r__3; // @[Reg.scala 16:16]
  reg  r__4; // @[Reg.scala 16:16]
  reg  r__5; // @[Reg.scala 16:16]
  reg  r__6; // @[Reg.scala 16:16]
  reg  r__7; // @[Reg.scala 16:16]
  reg  r__8; // @[Reg.scala 16:16]
  reg  r__9; // @[Reg.scala 16:16]
  reg  r__10; // @[Reg.scala 16:16]
  reg  r__11; // @[Reg.scala 16:16]
  reg  r__12; // @[Reg.scala 16:16]
  reg  r__13; // @[Reg.scala 16:16]
  reg  r__14; // @[Reg.scala 16:16]
  reg  r__15; // @[Reg.scala 16:16]
  reg [7:0] r_1_0; // @[Reg.scala 16:16]
  reg [7:0] r_1_1; // @[Reg.scala 16:16]
  reg [7:0] r_1_2; // @[Reg.scala 16:16]
  reg [7:0] r_1_3; // @[Reg.scala 16:16]
  reg [7:0] r_1_4; // @[Reg.scala 16:16]
  reg [7:0] r_1_5; // @[Reg.scala 16:16]
  reg [7:0] r_1_6; // @[Reg.scala 16:16]
  reg [7:0] r_1_7; // @[Reg.scala 16:16]
  reg [7:0] r_1_8; // @[Reg.scala 16:16]
  reg [7:0] r_1_9; // @[Reg.scala 16:16]
  reg [7:0] r_1_10; // @[Reg.scala 16:16]
  reg [7:0] r_1_11; // @[Reg.scala 16:16]
  reg [7:0] r_1_12; // @[Reg.scala 16:16]
  reg [7:0] r_1_13; // @[Reg.scala 16:16]
  reg [7:0] r_1_14; // @[Reg.scala 16:16]
  reg [7:0] r_1_15; // @[Reg.scala 16:16]
  reg [6:0] io_loadDataFromDcache_uop_rctrl_fuOpType; // @[Reg.scala 16:16]
  reg  io_loadDataFromDcache_uop_rctrl_fpWen; // @[Reg.scala 16:16]
  reg [3:0] io_loadDataFromDcache_addrOffset_r; // @[Reg.scala 16:16]
  reg  io_loadDataFromDcache_forward_D_r; // @[Reg.scala 16:16]
  reg [7:0] r_2_0; // @[Reg.scala 16:16]
  reg [7:0] r_2_1; // @[Reg.scala 16:16]
  reg [7:0] r_2_2; // @[Reg.scala 16:16]
  reg [7:0] r_2_3; // @[Reg.scala 16:16]
  reg [7:0] r_2_4; // @[Reg.scala 16:16]
  reg [7:0] r_2_5; // @[Reg.scala 16:16]
  reg [7:0] r_2_6; // @[Reg.scala 16:16]
  reg [7:0] r_2_7; // @[Reg.scala 16:16]
  reg [7:0] r_2_8; // @[Reg.scala 16:16]
  reg [7:0] r_2_9; // @[Reg.scala 16:16]
  reg [7:0] r_2_10; // @[Reg.scala 16:16]
  reg [7:0] r_2_11; // @[Reg.scala 16:16]
  reg [7:0] r_2_12; // @[Reg.scala 16:16]
  reg [7:0] r_2_13; // @[Reg.scala 16:16]
  reg [7:0] r_2_14; // @[Reg.scala 16:16]
  reg [7:0] r_2_15; // @[Reg.scala 16:16]
  reg  io_loadDataFromDcache_forward_mshr_r; // @[Reg.scala 16:16]
  reg [7:0] r_3_0; // @[Reg.scala 16:16]
  reg [7:0] r_3_1; // @[Reg.scala 16:16]
  reg [7:0] r_3_2; // @[Reg.scala 16:16]
  reg [7:0] r_3_3; // @[Reg.scala 16:16]
  reg [7:0] r_3_4; // @[Reg.scala 16:16]
  reg [7:0] r_3_5; // @[Reg.scala 16:16]
  reg [7:0] r_3_6; // @[Reg.scala 16:16]
  reg [7:0] r_3_7; // @[Reg.scala 16:16]
  reg [7:0] r_3_8; // @[Reg.scala 16:16]
  reg [7:0] r_3_9; // @[Reg.scala 16:16]
  reg [7:0] r_3_10; // @[Reg.scala 16:16]
  reg [7:0] r_3_11; // @[Reg.scala 16:16]
  reg [7:0] r_3_12; // @[Reg.scala 16:16]
  reg [7:0] r_3_13; // @[Reg.scala 16:16]
  reg [7:0] r_3_14; // @[Reg.scala 16:16]
  reg [7:0] r_3_15; // @[Reg.scala 16:16]
  reg  io_loadDataFromDcache_forward_result_valid_r; // @[Reg.scala 16:16]
  reg  io_dataForwarded_REG; // @[LoadUnit.scala 804:28]
  wire  _io_dataForwarded_T_3 = fullForward | io_dataForwarded_REG & io_dcacheResp_bits_tag_error; // @[LoadUnit.scala 804:18]
  assign io_out_valid = io_in_valid & ~io_in_bits_isHWPrefetch; // @[LoadUnit.scala 732:31]
  assign io_out_bits_uop_cf_foldpc = io_in_bits_uop_cf_foldpc; // @[LoadUnit.scala 737:15]
  assign io_out_bits_uop_cf_exceptionVec_4 = io_in_bits_isPrefetch | io_in_bits_tlbMiss ? 1'h0 :
    io_in_bits_uop_cf_exceptionVec_4; // @[LoadUnit.scala 594:47 595:22]
  assign io_out_bits_uop_cf_exceptionVec_5 = io_in_bits_isPrefetch | io_in_bits_tlbMiss ? 1'h0 :
    io_in_bits_uop_cf_exceptionVec_5 | pmp_ld; // @[LoadUnit.scala 594:47 595:22 592:37]
  assign io_out_bits_uop_cf_exceptionVec_13 = io_in_bits_isPrefetch | io_in_bits_tlbMiss ? 1'h0 :
    io_in_bits_uop_cf_exceptionVec_13; // @[LoadUnit.scala 594:47 595:22]
  assign io_out_bits_uop_cf_trigger_backendEn_1 = io_in_bits_uop_cf_trigger_backendEn_1; // @[LoadUnit.scala 737:15]
  assign io_out_bits_uop_cf_trigger_backendHit_0 = io_in_bits_uop_cf_trigger_backendHit_0; // @[LoadUnit.scala 737:15]
  assign io_out_bits_uop_cf_trigger_backendHit_1 = io_in_bits_uop_cf_trigger_backendHit_1; // @[LoadUnit.scala 737:15]
  assign io_out_bits_uop_cf_trigger_backendHit_4 = io_in_bits_uop_cf_trigger_backendHit_4; // @[LoadUnit.scala 737:15]
  assign io_out_bits_uop_cf_waitForRobIdx_flag = io_in_bits_uop_cf_waitForRobIdx_flag; // @[LoadUnit.scala 737:15]
  assign io_out_bits_uop_cf_waitForRobIdx_value = io_in_bits_uop_cf_waitForRobIdx_value; // @[LoadUnit.scala 737:15]
  assign io_out_bits_uop_cf_loadWaitBit = io_in_bits_uop_cf_loadWaitBit; // @[LoadUnit.scala 737:15]
  assign io_out_bits_uop_cf_loadWaitStrict = io_in_bits_uop_cf_loadWaitStrict; // @[LoadUnit.scala 737:15]
  assign io_out_bits_uop_cf_ftqPtr_flag = io_in_bits_uop_cf_ftqPtr_flag; // @[LoadUnit.scala 737:15]
  assign io_out_bits_uop_cf_ftqPtr_value = io_in_bits_uop_cf_ftqPtr_value; // @[LoadUnit.scala 737:15]
  assign io_out_bits_uop_cf_ftqOffset = io_in_bits_uop_cf_ftqOffset; // @[LoadUnit.scala 737:15]
  assign io_out_bits_uop_ctrl_fuType = io_in_bits_uop_ctrl_fuType; // @[LoadUnit.scala 737:15]
  assign io_out_bits_uop_ctrl_fuOpType = io_in_bits_uop_ctrl_fuOpType; // @[LoadUnit.scala 737:15]
  assign io_out_bits_uop_ctrl_rfWen = io_in_bits_uop_ctrl_rfWen; // @[LoadUnit.scala 737:15]
  assign io_out_bits_uop_ctrl_fpWen = io_in_bits_uop_ctrl_fpWen & _s2_mmio_T_2; // @[LoadUnit.scala 753:59]
  assign io_out_bits_uop_pdest = io_in_bits_uop_pdest; // @[LoadUnit.scala 737:15]
  assign io_out_bits_uop_robIdx_flag = io_in_bits_uop_robIdx_flag; // @[LoadUnit.scala 737:15]
  assign io_out_bits_uop_robIdx_value = io_in_bits_uop_robIdx_value; // @[LoadUnit.scala 737:15]
  assign io_out_bits_uop_lqIdx_flag = io_in_bits_uop_lqIdx_flag; // @[LoadUnit.scala 737:15]
  assign io_out_bits_uop_lqIdx_value = io_in_bits_uop_lqIdx_value; // @[LoadUnit.scala 737:15]
  assign io_out_bits_uop_sqIdx_flag = io_in_bits_uop_sqIdx_flag; // @[LoadUnit.scala 737:15]
  assign io_out_bits_uop_sqIdx_value = io_in_bits_uop_sqIdx_value; // @[LoadUnit.scala 737:15]
  assign io_out_bits_vaddr = io_in_bits_vaddr; // @[LoadUnit.scala 737:15]
  assign io_out_bits_paddr = io_in_bits_paddr; // @[LoadUnit.scala 737:15]
  assign io_out_bits_mask = io_in_bits_mask; // @[LoadUnit.scala 737:15]
  assign io_out_bits_miss = _io_out_bits_miss_T_3 & _io_loadLoadViolationQueryReq_valid_T_6; // @[LoadUnit.scala 750:23]
  assign io_out_bits_tlbMiss = io_in_bits_tlbMiss; // @[LoadUnit.scala 737:15]
  assign io_out_bits_mmio = ~io_in_bits_isPrefetch & pmp_mmio & ~s2_exception; // @[LoadUnit.scala 620:50]
  assign io_out_bits_isPrefetch = io_in_bits_isPrefetch; // @[LoadUnit.scala 737:15]
  assign io_out_bits_isHWPrefetch = io_in_bits_isHWPrefetch; // @[LoadUnit.scala 737:15]
  assign io_out_bits_vec128bit = io_in_bits_vec128bit; // @[LoadUnit.scala 737:15]
  assign io_out_bits_rarAllocated = io_in_bits_rarAllocated; // @[LoadUnit.scala 737:15]
  assign io_out_bits_rarIndex = io_in_bits_rarIndex; // @[LoadUnit.scala 737:15]
  assign io_out_bits_rawAllocated = io_in_bits_rawAllocated; // @[LoadUnit.scala 737:15]
  assign io_out_bits_rawIndex = io_in_bits_rawIndex; // @[LoadUnit.scala 737:15]
  assign io_out_bits_replayInfo_missMSHRId = io_dcacheResp_bits_mshr_id; // @[LoadUnit.scala 834:37]
  assign io_out_bits_replayInfo_canForwardFullData = io_dataForwarded; // @[LoadUnit.scala 830:45]
  assign io_out_bits_replayInfo_dataInvalidSqIdx_flag = io_dataInvalidSqIdx_flag; // @[LoadUnit.scala 831:43]
  assign io_out_bits_replayInfo_dataInvalidSqIdx_value = io_dataInvalidSqIdx_value; // @[LoadUnit.scala 831:43]
  assign io_out_bits_replayInfo_addrInvalidSqIdx_flag = io_addrInvalidSqIdx_flag; // @[LoadUnit.scala 832:43]
  assign io_out_bits_replayInfo_addrInvalidSqIdx_value = io_addrInvalidSqIdx_value; // @[LoadUnit.scala 832:43]
  assign io_out_bits_replayInfo_replayCarry_real_way_en = io_dcacheResp_bits_replayCarry_real_way_en; // @[LoadUnit.scala 833:38]
  assign io_out_bits_replayInfo_replayCarry_valid = io_dcacheResp_bits_replayCarry_valid; // @[LoadUnit.scala 833:38]
  assign io_out_bits_replayInfo_dataInLastBeat = io_in_bits_paddr[5]; // @[LoadUnit.scala 835:60]
  assign io_out_bits_replayInfo_cause_0 = io_in_bits_tlbMiss; // @[LoadUnit.scala 820:58]
  assign io_out_bits_replayInfo_cause_1 = s2_wait_store & _s2_mmio_T; // @[LoadUnit.scala 822:77]
  assign io_out_bits_replayInfo_cause_2 = (io_in_bits_replayInfo_cause_2 | s2_schedError) & _s2_mmio_T; // @[LoadUnit.scala 821:140]
  assign io_out_bits_replayInfo_cause_4 = io_in_bits_replayInfo_cause_4; // @[LoadUnit.scala 737:15]
  assign io_out_bits_replayInfo_cause_5 = s2_data_invalid & _s2_mmio_T; // @[LoadUnit.scala 829:81]
  assign io_out_bits_replayInfo_cause_6 = ~(~s2_cache_replay | io_in_bits_isPrefetch | s2_mmio | s2_exception |
    io_dataForwarded); // @[LoadUnit.scala 827:68]
  assign io_out_bits_replayInfo_cause_7 = io_out_bits_miss & _io_loadLoadViolationQueryReq_valid_T_6; // @[LoadUnit.scala 823:81]
  assign io_dataForwarded = _io_out_bits_miss_T_1 & _io_dataForwarded_T_3; // @[LoadUnit.scala 803:54]
  assign io_dcache_kill = pmp_ld | pmp_mmio; // @[LoadUnit.scala 634:28]
  assign io_loadLoadViolationQueryReq_valid = io_in_valid & _s2_schedError_T_20 & _s2_mmio_T & _s2_mmio_T_2 & ~s2_mmio; // @[LoadUnit.scala 658:105]
  assign io_loadLoadViolationQueryReq_bits_uop_robIdx_flag = io_in_bits_uop_robIdx_flag; // @[LoadUnit.scala 659:41]
  assign io_loadLoadViolationQueryReq_bits_uop_robIdx_value = io_in_bits_uop_robIdx_value; // @[LoadUnit.scala 659:41]
  assign io_loadLoadViolationQueryReq_bits_uop_lqIdx_flag = io_in_bits_uop_lqIdx_flag; // @[LoadUnit.scala 659:41]
  assign io_loadLoadViolationQueryReq_bits_uop_lqIdx_value = io_in_bits_uop_lqIdx_value; // @[LoadUnit.scala 659:41]
  assign io_loadLoadViolationQueryReq_bits_index = io_in_bits_rarIndex; // @[LoadUnit.scala 669:43]
  assign io_loadLoadViolationQueryReq_bits_allocated = io_in_bits_rarAllocated; // @[LoadUnit.scala 670:47]
  assign io_loadLoadViolationQueryReq_bits_datavalid = ~io_out_bits_miss; // @[LoadUnit.scala 666:52]
  assign io_loadLoadViolationQueryReq_bits_miss = io_out_bits_miss & ~io_dataForwarded; // @[LoadUnit.scala 667:64]
  assign io_loadLoadViolationQueryReq_bits_paddr = io_in_bits_paddr; // @[LoadUnit.scala 661:43]
  assign io_storeLoadViolationQueryReq_valid = _io_loadLoadViolationQueryReq_valid_T_1 & ~s2_schedError & _s2_mmio_T &
    _s2_mmio_T_2 & _io_loadLoadViolationQueryReq_valid_T_6 & ~io_in_bits_replayInfo_cause_2; // @[LoadUnit.scala 674:136]
  assign io_storeLoadViolationQueryReq_bits_uop_cf_foldpc = io_in_bits_uop_cf_foldpc; // @[LoadUnit.scala 675:42]
  assign io_storeLoadViolationQueryReq_bits_uop_cf_ftqPtr_flag = io_in_bits_uop_cf_ftqPtr_flag; // @[LoadUnit.scala 675:42]
  assign io_storeLoadViolationQueryReq_bits_uop_cf_ftqPtr_value = io_in_bits_uop_cf_ftqPtr_value; // @[LoadUnit.scala 675:42]
  assign io_storeLoadViolationQueryReq_bits_uop_cf_ftqOffset = io_in_bits_uop_cf_ftqOffset; // @[LoadUnit.scala 675:42]
  assign io_storeLoadViolationQueryReq_bits_uop_robIdx_flag = io_in_bits_uop_robIdx_flag; // @[LoadUnit.scala 675:42]
  assign io_storeLoadViolationQueryReq_bits_uop_robIdx_value = io_in_bits_uop_robIdx_value; // @[LoadUnit.scala 675:42]
  assign io_storeLoadViolationQueryReq_bits_uop_sqIdx_flag = io_in_bits_uop_sqIdx_flag; // @[LoadUnit.scala 675:42]
  assign io_storeLoadViolationQueryReq_bits_uop_sqIdx_value = io_in_bits_uop_sqIdx_value; // @[LoadUnit.scala 675:42]
  assign io_storeLoadViolationQueryReq_bits_index = io_in_bits_rawIndex; // @[LoadUnit.scala 680:44]
  assign io_storeLoadViolationQueryReq_bits_allocated = io_in_bits_rawAllocated; // @[LoadUnit.scala 681:48]
  assign io_storeLoadViolationQueryReq_bits_datavalid = io_loadLoadViolationQueryReq_bits_datavalid & ~s2_wait_store; // @[LoadUnit.scala 678:95]
  assign io_storeLoadViolationQueryReq_bits_mask = io_in_bits_mask[7:0]; // @[LoadUnit.scala 676:43]
  assign io_storeLoadViolationQueryReq_bits_paddr = io_in_bits_paddr; // @[LoadUnit.scala 677:44]
  assign io_correctTableUpdate_valid = io_in_valid & io_in_bits_isFirstIssue & io_in_bits_uop_cf_loadWaitStrict &
    _s2_mmio_T & _s2_schedError_T_20; // @[LoadUnit.scala 652:128]
  assign io_correctTableUpdate_bits_addr = io_in_bits_uop_cf_foldpc; // @[LoadUnit.scala 653:35]
  assign io_correctTableUpdate_bits_strict = io_lsq_schedWait; // @[LoadUnit.scala 654:37]
  assign io_correctTableUpdate_bits_violation = |_s2_schedError_T_18 & _s2_schedError_T_20; // @[LoadUnit.scala 648:91]
  assign io_loadDataFromDcache_respDcacheData = io_dcacheResp_bits_data_delayed; // @[LoadUnit.scala 767:40]
  assign io_loadDataFromDcache_forwardMask_0 = r__0; // @[LoadUnit.scala 770:37]
  assign io_loadDataFromDcache_forwardMask_1 = r__1; // @[LoadUnit.scala 770:37]
  assign io_loadDataFromDcache_forwardMask_2 = r__2; // @[LoadUnit.scala 770:37]
  assign io_loadDataFromDcache_forwardMask_3 = r__3; // @[LoadUnit.scala 770:37]
  assign io_loadDataFromDcache_forwardMask_4 = r__4; // @[LoadUnit.scala 770:37]
  assign io_loadDataFromDcache_forwardMask_5 = r__5; // @[LoadUnit.scala 770:37]
  assign io_loadDataFromDcache_forwardMask_6 = r__6; // @[LoadUnit.scala 770:37]
  assign io_loadDataFromDcache_forwardMask_7 = r__7; // @[LoadUnit.scala 770:37]
  assign io_loadDataFromDcache_forwardMask_8 = r__8; // @[LoadUnit.scala 770:37]
  assign io_loadDataFromDcache_forwardMask_9 = r__9; // @[LoadUnit.scala 770:37]
  assign io_loadDataFromDcache_forwardMask_10 = r__10; // @[LoadUnit.scala 770:37]
  assign io_loadDataFromDcache_forwardMask_11 = r__11; // @[LoadUnit.scala 770:37]
  assign io_loadDataFromDcache_forwardMask_12 = r__12; // @[LoadUnit.scala 770:37]
  assign io_loadDataFromDcache_forwardMask_13 = r__13; // @[LoadUnit.scala 770:37]
  assign io_loadDataFromDcache_forwardMask_14 = r__14; // @[LoadUnit.scala 770:37]
  assign io_loadDataFromDcache_forwardMask_15 = r__15; // @[LoadUnit.scala 770:37]
  assign io_loadDataFromDcache_forwardData_0 = r_1_0; // @[LoadUnit.scala 771:37]
  assign io_loadDataFromDcache_forwardData_1 = r_1_1; // @[LoadUnit.scala 771:37]
  assign io_loadDataFromDcache_forwardData_2 = r_1_2; // @[LoadUnit.scala 771:37]
  assign io_loadDataFromDcache_forwardData_3 = r_1_3; // @[LoadUnit.scala 771:37]
  assign io_loadDataFromDcache_forwardData_4 = r_1_4; // @[LoadUnit.scala 771:37]
  assign io_loadDataFromDcache_forwardData_5 = r_1_5; // @[LoadUnit.scala 771:37]
  assign io_loadDataFromDcache_forwardData_6 = r_1_6; // @[LoadUnit.scala 771:37]
  assign io_loadDataFromDcache_forwardData_7 = r_1_7; // @[LoadUnit.scala 771:37]
  assign io_loadDataFromDcache_forwardData_8 = r_1_8; // @[LoadUnit.scala 771:37]
  assign io_loadDataFromDcache_forwardData_9 = r_1_9; // @[LoadUnit.scala 771:37]
  assign io_loadDataFromDcache_forwardData_10 = r_1_10; // @[LoadUnit.scala 771:37]
  assign io_loadDataFromDcache_forwardData_11 = r_1_11; // @[LoadUnit.scala 771:37]
  assign io_loadDataFromDcache_forwardData_12 = r_1_12; // @[LoadUnit.scala 771:37]
  assign io_loadDataFromDcache_forwardData_13 = r_1_13; // @[LoadUnit.scala 771:37]
  assign io_loadDataFromDcache_forwardData_14 = r_1_14; // @[LoadUnit.scala 771:37]
  assign io_loadDataFromDcache_forwardData_15 = r_1_15; // @[LoadUnit.scala 771:37]
  assign io_loadDataFromDcache_uop_ctrl_fuOpType = io_loadDataFromDcache_uop_rctrl_fuOpType; // @[LoadUnit.scala 774:29]
  assign io_loadDataFromDcache_uop_ctrl_fpWen = io_loadDataFromDcache_uop_rctrl_fpWen; // @[LoadUnit.scala 774:29]
  assign io_loadDataFromDcache_addrOffset = io_loadDataFromDcache_addrOffset_r; // @[LoadUnit.scala 775:36]
  assign io_loadDataFromDcache_forward_D = io_loadDataFromDcache_forward_D_r; // @[LoadUnit.scala 777:35]
  assign io_loadDataFromDcache_forwardData_D_0 = r_2_0; // @[LoadUnit.scala 778:39]
  assign io_loadDataFromDcache_forwardData_D_1 = r_2_1; // @[LoadUnit.scala 778:39]
  assign io_loadDataFromDcache_forwardData_D_2 = r_2_2; // @[LoadUnit.scala 778:39]
  assign io_loadDataFromDcache_forwardData_D_3 = r_2_3; // @[LoadUnit.scala 778:39]
  assign io_loadDataFromDcache_forwardData_D_4 = r_2_4; // @[LoadUnit.scala 778:39]
  assign io_loadDataFromDcache_forwardData_D_5 = r_2_5; // @[LoadUnit.scala 778:39]
  assign io_loadDataFromDcache_forwardData_D_6 = r_2_6; // @[LoadUnit.scala 778:39]
  assign io_loadDataFromDcache_forwardData_D_7 = r_2_7; // @[LoadUnit.scala 778:39]
  assign io_loadDataFromDcache_forwardData_D_8 = r_2_8; // @[LoadUnit.scala 778:39]
  assign io_loadDataFromDcache_forwardData_D_9 = r_2_9; // @[LoadUnit.scala 778:39]
  assign io_loadDataFromDcache_forwardData_D_10 = r_2_10; // @[LoadUnit.scala 778:39]
  assign io_loadDataFromDcache_forwardData_D_11 = r_2_11; // @[LoadUnit.scala 778:39]
  assign io_loadDataFromDcache_forwardData_D_12 = r_2_12; // @[LoadUnit.scala 778:39]
  assign io_loadDataFromDcache_forwardData_D_13 = r_2_13; // @[LoadUnit.scala 778:39]
  assign io_loadDataFromDcache_forwardData_D_14 = r_2_14; // @[LoadUnit.scala 778:39]
  assign io_loadDataFromDcache_forwardData_D_15 = r_2_15; // @[LoadUnit.scala 778:39]
  assign io_loadDataFromDcache_forward_mshr = io_loadDataFromDcache_forward_mshr_r; // @[LoadUnit.scala 779:38]
  assign io_loadDataFromDcache_forwardData_mshr_0 = r_3_0; // @[LoadUnit.scala 780:42]
  assign io_loadDataFromDcache_forwardData_mshr_1 = r_3_1; // @[LoadUnit.scala 780:42]
  assign io_loadDataFromDcache_forwardData_mshr_2 = r_3_2; // @[LoadUnit.scala 780:42]
  assign io_loadDataFromDcache_forwardData_mshr_3 = r_3_3; // @[LoadUnit.scala 780:42]
  assign io_loadDataFromDcache_forwardData_mshr_4 = r_3_4; // @[LoadUnit.scala 780:42]
  assign io_loadDataFromDcache_forwardData_mshr_5 = r_3_5; // @[LoadUnit.scala 780:42]
  assign io_loadDataFromDcache_forwardData_mshr_6 = r_3_6; // @[LoadUnit.scala 780:42]
  assign io_loadDataFromDcache_forwardData_mshr_7 = r_3_7; // @[LoadUnit.scala 780:42]
  assign io_loadDataFromDcache_forwardData_mshr_8 = r_3_8; // @[LoadUnit.scala 780:42]
  assign io_loadDataFromDcache_forwardData_mshr_9 = r_3_9; // @[LoadUnit.scala 780:42]
  assign io_loadDataFromDcache_forwardData_mshr_10 = r_3_10; // @[LoadUnit.scala 780:42]
  assign io_loadDataFromDcache_forwardData_mshr_11 = r_3_11; // @[LoadUnit.scala 780:42]
  assign io_loadDataFromDcache_forwardData_mshr_12 = r_3_12; // @[LoadUnit.scala 780:42]
  assign io_loadDataFromDcache_forwardData_mshr_13 = r_3_13; // @[LoadUnit.scala 780:42]
  assign io_loadDataFromDcache_forwardData_mshr_14 = r_3_14; // @[LoadUnit.scala 780:42]
  assign io_loadDataFromDcache_forwardData_mshr_15 = r_3_15; // @[LoadUnit.scala 780:42]
  assign io_loadDataFromDcache_forward_result_valid = io_loadDataFromDcache_forward_result_valid_r; // @[LoadUnit.scala 781:46]
  always @(posedge clock) begin
    if (io_in_valid) begin // @[Reg.scala 17:18]
      r__0 <= forwardMask_0; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      r__1 <= forwardMask_1; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      r__2 <= forwardMask_2; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      r__3 <= forwardMask_3; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      r__4 <= forwardMask_4; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      r__5 <= forwardMask_5; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      r__6 <= forwardMask_6; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      r__7 <= forwardMask_7; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      r__8 <= forwardMask_8; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      r__9 <= forwardMask_9; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      r__10 <= forwardMask_10; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      r__11 <= forwardMask_11; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      r__12 <= forwardMask_12; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      r__13 <= forwardMask_13; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      r__14 <= forwardMask_14; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      r__15 <= forwardMask_15; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      if (io_lsq_forwardMask_0) begin // @[LoadUnit.scala 693:26]
        r_1_0 <= io_lsq_forwardData_0;
      end else begin
        r_1_0 <= io_sbuffer_forwardData_0;
      end
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      if (io_lsq_forwardMask_1) begin // @[LoadUnit.scala 693:26]
        r_1_1 <= io_lsq_forwardData_1;
      end else begin
        r_1_1 <= io_sbuffer_forwardData_1;
      end
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      if (io_lsq_forwardMask_2) begin // @[LoadUnit.scala 693:26]
        r_1_2 <= io_lsq_forwardData_2;
      end else begin
        r_1_2 <= io_sbuffer_forwardData_2;
      end
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      if (io_lsq_forwardMask_3) begin // @[LoadUnit.scala 693:26]
        r_1_3 <= io_lsq_forwardData_3;
      end else begin
        r_1_3 <= io_sbuffer_forwardData_3;
      end
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      if (io_lsq_forwardMask_4) begin // @[LoadUnit.scala 693:26]
        r_1_4 <= io_lsq_forwardData_4;
      end else begin
        r_1_4 <= io_sbuffer_forwardData_4;
      end
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      if (io_lsq_forwardMask_5) begin // @[LoadUnit.scala 693:26]
        r_1_5 <= io_lsq_forwardData_5;
      end else begin
        r_1_5 <= io_sbuffer_forwardData_5;
      end
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      if (io_lsq_forwardMask_6) begin // @[LoadUnit.scala 693:26]
        r_1_6 <= io_lsq_forwardData_6;
      end else begin
        r_1_6 <= io_sbuffer_forwardData_6;
      end
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      if (io_lsq_forwardMask_7) begin // @[LoadUnit.scala 693:26]
        r_1_7 <= io_lsq_forwardData_7;
      end else begin
        r_1_7 <= io_sbuffer_forwardData_7;
      end
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      if (io_lsq_forwardMask_8) begin // @[LoadUnit.scala 693:26]
        r_1_8 <= io_lsq_forwardData_8;
      end else begin
        r_1_8 <= io_sbuffer_forwardData_8;
      end
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      if (io_lsq_forwardMask_9) begin // @[LoadUnit.scala 693:26]
        r_1_9 <= io_lsq_forwardData_9;
      end else begin
        r_1_9 <= io_sbuffer_forwardData_9;
      end
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      if (io_lsq_forwardMask_10) begin // @[LoadUnit.scala 693:26]
        r_1_10 <= io_lsq_forwardData_10;
      end else begin
        r_1_10 <= io_sbuffer_forwardData_10;
      end
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      if (io_lsq_forwardMask_11) begin // @[LoadUnit.scala 693:26]
        r_1_11 <= io_lsq_forwardData_11;
      end else begin
        r_1_11 <= io_sbuffer_forwardData_11;
      end
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      if (io_lsq_forwardMask_12) begin // @[LoadUnit.scala 693:26]
        r_1_12 <= io_lsq_forwardData_12;
      end else begin
        r_1_12 <= io_sbuffer_forwardData_12;
      end
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      if (io_lsq_forwardMask_13) begin // @[LoadUnit.scala 693:26]
        r_1_13 <= io_lsq_forwardData_13;
      end else begin
        r_1_13 <= io_sbuffer_forwardData_13;
      end
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      if (io_lsq_forwardMask_14) begin // @[LoadUnit.scala 693:26]
        r_1_14 <= io_lsq_forwardData_14;
      end else begin
        r_1_14 <= io_sbuffer_forwardData_14;
      end
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      if (io_lsq_forwardMask_15) begin // @[LoadUnit.scala 693:26]
        r_1_15 <= io_lsq_forwardData_15;
      end else begin
        r_1_15 <= io_sbuffer_forwardData_15;
      end
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      io_loadDataFromDcache_uop_rctrl_fuOpType <= io_out_bits_uop_ctrl_fuOpType; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      io_loadDataFromDcache_uop_rctrl_fpWen <= io_out_bits_uop_ctrl_fpWen; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      io_loadDataFromDcache_addrOffset_r <= io_in_bits_paddr[3:0]; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      io_loadDataFromDcache_forward_D_r <= io_forward_D; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      r_2_0 <= io_forwardData_D_0; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      r_2_1 <= io_forwardData_D_1; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      r_2_2 <= io_forwardData_D_2; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      r_2_3 <= io_forwardData_D_3; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      r_2_4 <= io_forwardData_D_4; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      r_2_5 <= io_forwardData_D_5; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      r_2_6 <= io_forwardData_D_6; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      r_2_7 <= io_forwardData_D_7; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      r_2_8 <= io_forwardData_D_8; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      r_2_9 <= io_forwardData_D_9; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      r_2_10 <= io_forwardData_D_10; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      r_2_11 <= io_forwardData_D_11; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      r_2_12 <= io_forwardData_D_12; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      r_2_13 <= io_forwardData_D_13; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      r_2_14 <= io_forwardData_D_14; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      r_2_15 <= io_forwardData_D_15; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      io_loadDataFromDcache_forward_mshr_r <= io_forward_mshr; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      r_3_0 <= io_forwardData_mshr_0; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      r_3_1 <= io_forwardData_mshr_1; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      r_3_2 <= io_forwardData_mshr_2; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      r_3_3 <= io_forwardData_mshr_3; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      r_3_4 <= io_forwardData_mshr_4; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      r_3_5 <= io_forwardData_mshr_5; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      r_3_6 <= io_forwardData_mshr_6; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      r_3_7 <= io_forwardData_mshr_7; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      r_3_8 <= io_forwardData_mshr_8; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      r_3_9 <= io_forwardData_mshr_9; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      r_3_10 <= io_forwardData_mshr_10; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      r_3_11 <= io_forwardData_mshr_11; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      r_3_12 <= io_forwardData_mshr_12; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      r_3_13 <= io_forwardData_mshr_13; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      r_3_14 <= io_forwardData_mshr_14; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      r_3_15 <= io_forwardData_mshr_15; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      io_loadDataFromDcache_forward_result_valid_r <= io_forward_result_valid; // @[Reg.scala 17:22]
    end
    io_dataForwarded_REG <= io_csrCtrl_cache_error_enable; // @[LoadUnit.scala 804:28]
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
  r__0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  r__1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  r__2 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  r__3 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  r__4 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  r__5 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  r__6 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  r__7 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  r__8 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  r__9 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  r__10 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  r__11 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  r__12 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  r__13 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  r__14 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  r__15 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  r_1_0 = _RAND_16[7:0];
  _RAND_17 = {1{`RANDOM}};
  r_1_1 = _RAND_17[7:0];
  _RAND_18 = {1{`RANDOM}};
  r_1_2 = _RAND_18[7:0];
  _RAND_19 = {1{`RANDOM}};
  r_1_3 = _RAND_19[7:0];
  _RAND_20 = {1{`RANDOM}};
  r_1_4 = _RAND_20[7:0];
  _RAND_21 = {1{`RANDOM}};
  r_1_5 = _RAND_21[7:0];
  _RAND_22 = {1{`RANDOM}};
  r_1_6 = _RAND_22[7:0];
  _RAND_23 = {1{`RANDOM}};
  r_1_7 = _RAND_23[7:0];
  _RAND_24 = {1{`RANDOM}};
  r_1_8 = _RAND_24[7:0];
  _RAND_25 = {1{`RANDOM}};
  r_1_9 = _RAND_25[7:0];
  _RAND_26 = {1{`RANDOM}};
  r_1_10 = _RAND_26[7:0];
  _RAND_27 = {1{`RANDOM}};
  r_1_11 = _RAND_27[7:0];
  _RAND_28 = {1{`RANDOM}};
  r_1_12 = _RAND_28[7:0];
  _RAND_29 = {1{`RANDOM}};
  r_1_13 = _RAND_29[7:0];
  _RAND_30 = {1{`RANDOM}};
  r_1_14 = _RAND_30[7:0];
  _RAND_31 = {1{`RANDOM}};
  r_1_15 = _RAND_31[7:0];
  _RAND_32 = {1{`RANDOM}};
  io_loadDataFromDcache_uop_rctrl_fuOpType = _RAND_32[6:0];
  _RAND_33 = {1{`RANDOM}};
  io_loadDataFromDcache_uop_rctrl_fpWen = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  io_loadDataFromDcache_addrOffset_r = _RAND_34[3:0];
  _RAND_35 = {1{`RANDOM}};
  io_loadDataFromDcache_forward_D_r = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  r_2_0 = _RAND_36[7:0];
  _RAND_37 = {1{`RANDOM}};
  r_2_1 = _RAND_37[7:0];
  _RAND_38 = {1{`RANDOM}};
  r_2_2 = _RAND_38[7:0];
  _RAND_39 = {1{`RANDOM}};
  r_2_3 = _RAND_39[7:0];
  _RAND_40 = {1{`RANDOM}};
  r_2_4 = _RAND_40[7:0];
  _RAND_41 = {1{`RANDOM}};
  r_2_5 = _RAND_41[7:0];
  _RAND_42 = {1{`RANDOM}};
  r_2_6 = _RAND_42[7:0];
  _RAND_43 = {1{`RANDOM}};
  r_2_7 = _RAND_43[7:0];
  _RAND_44 = {1{`RANDOM}};
  r_2_8 = _RAND_44[7:0];
  _RAND_45 = {1{`RANDOM}};
  r_2_9 = _RAND_45[7:0];
  _RAND_46 = {1{`RANDOM}};
  r_2_10 = _RAND_46[7:0];
  _RAND_47 = {1{`RANDOM}};
  r_2_11 = _RAND_47[7:0];
  _RAND_48 = {1{`RANDOM}};
  r_2_12 = _RAND_48[7:0];
  _RAND_49 = {1{`RANDOM}};
  r_2_13 = _RAND_49[7:0];
  _RAND_50 = {1{`RANDOM}};
  r_2_14 = _RAND_50[7:0];
  _RAND_51 = {1{`RANDOM}};
  r_2_15 = _RAND_51[7:0];
  _RAND_52 = {1{`RANDOM}};
  io_loadDataFromDcache_forward_mshr_r = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  r_3_0 = _RAND_53[7:0];
  _RAND_54 = {1{`RANDOM}};
  r_3_1 = _RAND_54[7:0];
  _RAND_55 = {1{`RANDOM}};
  r_3_2 = _RAND_55[7:0];
  _RAND_56 = {1{`RANDOM}};
  r_3_3 = _RAND_56[7:0];
  _RAND_57 = {1{`RANDOM}};
  r_3_4 = _RAND_57[7:0];
  _RAND_58 = {1{`RANDOM}};
  r_3_5 = _RAND_58[7:0];
  _RAND_59 = {1{`RANDOM}};
  r_3_6 = _RAND_59[7:0];
  _RAND_60 = {1{`RANDOM}};
  r_3_7 = _RAND_60[7:0];
  _RAND_61 = {1{`RANDOM}};
  r_3_8 = _RAND_61[7:0];
  _RAND_62 = {1{`RANDOM}};
  r_3_9 = _RAND_62[7:0];
  _RAND_63 = {1{`RANDOM}};
  r_3_10 = _RAND_63[7:0];
  _RAND_64 = {1{`RANDOM}};
  r_3_11 = _RAND_64[7:0];
  _RAND_65 = {1{`RANDOM}};
  r_3_12 = _RAND_65[7:0];
  _RAND_66 = {1{`RANDOM}};
  r_3_13 = _RAND_66[7:0];
  _RAND_67 = {1{`RANDOM}};
  r_3_14 = _RAND_67[7:0];
  _RAND_68 = {1{`RANDOM}};
  r_3_15 = _RAND_68[7:0];
  _RAND_69 = {1{`RANDOM}};
  io_loadDataFromDcache_forward_result_valid_r = _RAND_69[0:0];
  _RAND_70 = {1{`RANDOM}};
  io_dataForwarded_REG = _RAND_70[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

