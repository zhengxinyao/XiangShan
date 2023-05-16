module LoadUnit(
  input          clock,
  input          reset,
  output         io_loadIn_ready,
  input          io_loadIn_valid,
  input  [9:0]   io_loadIn_bits_uop_cf_foldpc,
  input          io_loadIn_bits_uop_cf_trigger_backendEn_1,
  input          io_loadIn_bits_uop_cf_waitForRobIdx_flag,
  input  [4:0]   io_loadIn_bits_uop_cf_waitForRobIdx_value,
  input          io_loadIn_bits_uop_cf_loadWaitBit,
  input          io_loadIn_bits_uop_cf_loadWaitStrict,
  input          io_loadIn_bits_uop_cf_ftqPtr_flag,
  input  [2:0]   io_loadIn_bits_uop_cf_ftqPtr_value,
  input  [2:0]   io_loadIn_bits_uop_cf_ftqOffset,
  input  [3:0]   io_loadIn_bits_uop_ctrl_fuType,
  input  [6:0]   io_loadIn_bits_uop_ctrl_fuOpType,
  input          io_loadIn_bits_uop_ctrl_rfWen,
  input          io_loadIn_bits_uop_ctrl_fpWen,
  input  [19:0]  io_loadIn_bits_uop_ctrl_imm,
  input  [5:0]   io_loadIn_bits_uop_pdest,
  input          io_loadIn_bits_uop_robIdx_flag,
  input  [4:0]   io_loadIn_bits_uop_robIdx_value,
  input          io_loadIn_bits_uop_lqIdx_flag,
  input  [3:0]   io_loadIn_bits_uop_lqIdx_value,
  input          io_loadIn_bits_uop_sqIdx_flag,
  input  [3:0]   io_loadIn_bits_uop_sqIdx_value,
  input  [63:0]  io_loadIn_bits_src_0,
  output         io_VecloadIn_ready,
  input          io_VecloadIn_valid,
  input  [38:0]  io_VecloadIn_bits_vaddr,
  output         io_loadOut_valid,
  output         io_loadOut_bits_uop_cf_exceptionVec_4,
  output         io_loadOut_bits_uop_cf_exceptionVec_5,
  output         io_loadOut_bits_uop_cf_exceptionVec_13,
  output         io_loadOut_bits_uop_cf_trigger_backendEn_1,
  output         io_loadOut_bits_uop_cf_trigger_backendHit_0,
  output         io_loadOut_bits_uop_cf_trigger_backendHit_1,
  output         io_loadOut_bits_uop_cf_trigger_backendHit_4,
  output         io_loadOut_bits_uop_ctrl_rfWen,
  output         io_loadOut_bits_uop_ctrl_fpWen,
  output         io_loadOut_bits_uop_ctrl_flushPipe,
  output         io_loadOut_bits_uop_ctrl_replayInst,
  output [5:0]   io_loadOut_bits_uop_pdest,
  output         io_loadOut_bits_uop_robIdx_flag,
  output [4:0]   io_loadOut_bits_uop_robIdx_value,
  output [63:0]  io_loadOut_bits_data,
  output         io_loadOut_bits_debug_isMMIO,
  input          io_redirect_valid,
  input          io_redirect_bits_robIdx_flag,
  input  [4:0]   io_redirect_bits_robIdx_value,
  input          io_redirect_bits_level,
  input          io_dcache_req_ready,
  output         io_dcache_req_valid,
  output [4:0]   io_dcache_req_bits_cmd,
  output [35:0]  io_dcache_req_bits_addr,
  output [3:0]   io_dcache_req_bits_instrtype,
  output [7:0]   io_dcache_req_bits_replayCarry_real_way_en,
  output         io_dcache_req_bits_replayCarry_valid,
  input  [127:0] io_dcache_resp_bits_data_delayed,
  input          io_dcache_resp_bits_miss,
  input          io_dcache_resp_bits_replay,
  input  [7:0]   io_dcache_resp_bits_replayCarry_real_way_en,
  input          io_dcache_resp_bits_replayCarry_valid,
  input          io_dcache_resp_bits_tag_error,
  input  [1:0]   io_dcache_resp_bits_mshr_id,
  input          io_dcache_resp_bits_error_delayed,
  output         io_dcache_s1_kill,
  output         io_dcache_s2_kill,
  output [35:0]  io_dcache_s1_paddr_dup_lsu,
  output [35:0]  io_dcache_s1_paddr_dup_dcache,
  input          io_dcache_s1_bank_conflict,
  output [38:0]  io_sbuffer_vaddr,
  output [35:0]  io_sbuffer_paddr,
  output         io_sbuffer_valid,
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
  input          io_sbuffer_matchInvalid,
  output         io_lsq_loadIn_valid,
  output [9:0]   io_lsq_loadIn_bits_uop_cf_foldpc,
  output         io_lsq_loadIn_bits_uop_cf_exceptionVec_4,
  output         io_lsq_loadIn_bits_uop_cf_exceptionVec_5,
  output         io_lsq_loadIn_bits_uop_cf_exceptionVec_13,
  output         io_lsq_loadIn_bits_uop_cf_trigger_backendEn_1,
  output         io_lsq_loadIn_bits_uop_cf_trigger_backendHit_0,
  output         io_lsq_loadIn_bits_uop_cf_trigger_backendHit_1,
  output         io_lsq_loadIn_bits_uop_cf_trigger_backendHit_4,
  output         io_lsq_loadIn_bits_uop_cf_waitForRobIdx_flag,
  output [4:0]   io_lsq_loadIn_bits_uop_cf_waitForRobIdx_value,
  output         io_lsq_loadIn_bits_uop_cf_loadWaitBit,
  output         io_lsq_loadIn_bits_uop_cf_loadWaitStrict,
  output         io_lsq_loadIn_bits_uop_cf_ftqPtr_flag,
  output [2:0]   io_lsq_loadIn_bits_uop_cf_ftqPtr_value,
  output [2:0]   io_lsq_loadIn_bits_uop_cf_ftqOffset,
  output [3:0]   io_lsq_loadIn_bits_uop_ctrl_fuType,
  output [6:0]   io_lsq_loadIn_bits_uop_ctrl_fuOpType,
  output         io_lsq_loadIn_bits_uop_ctrl_rfWen,
  output         io_lsq_loadIn_bits_uop_ctrl_fpWen,
  output         io_lsq_loadIn_bits_uop_ctrl_replayInst,
  output [5:0]   io_lsq_loadIn_bits_uop_pdest,
  output         io_lsq_loadIn_bits_uop_robIdx_flag,
  output [4:0]   io_lsq_loadIn_bits_uop_robIdx_value,
  output         io_lsq_loadIn_bits_uop_lqIdx_flag,
  output [3:0]   io_lsq_loadIn_bits_uop_lqIdx_value,
  output         io_lsq_loadIn_bits_uop_sqIdx_flag,
  output [3:0]   io_lsq_loadIn_bits_uop_sqIdx_value,
  output [38:0]  io_lsq_loadIn_bits_vaddr,
  output [35:0]  io_lsq_loadIn_bits_paddr,
  output [15:0]  io_lsq_loadIn_bits_mask,
  output         io_lsq_loadIn_bits_miss,
  output         io_lsq_loadIn_bits_tlbMiss,
  output         io_lsq_loadIn_bits_mmio,
  output         io_lsq_loadIn_bits_rarAllocated,
  output [3:0]   io_lsq_loadIn_bits_rarIndex,
  output         io_lsq_loadIn_bits_rawAllocated,
  output [2:0]   io_lsq_loadIn_bits_rawIndex,
  output         io_lsq_loadIn_bits_canAccept,
  output [1:0]   io_lsq_loadIn_bits_replayInfo_missMSHRId,
  output         io_lsq_loadIn_bits_replayInfo_canForwardFullData,
  output         io_lsq_loadIn_bits_replayInfo_dataInvalidSqIdx_flag,
  output [3:0]   io_lsq_loadIn_bits_replayInfo_dataInvalidSqIdx_value,
  output         io_lsq_loadIn_bits_replayInfo_addrInvalidSqIdx_flag,
  output [3:0]   io_lsq_loadIn_bits_replayInfo_addrInvalidSqIdx_value,
  output [7:0]   io_lsq_loadIn_bits_replayInfo_replayCarry_real_way_en,
  output         io_lsq_loadIn_bits_replayInfo_replayCarry_valid,
  output         io_lsq_loadIn_bits_replayInfo_dataInLastBeat,
  output         io_lsq_loadIn_bits_replayInfo_cause_0,
  output         io_lsq_loadIn_bits_replayInfo_cause_1,
  output         io_lsq_loadIn_bits_replayInfo_cause_2,
  output         io_lsq_loadIn_bits_replayInfo_cause_3,
  output         io_lsq_loadIn_bits_replayInfo_cause_4,
  output         io_lsq_loadIn_bits_replayInfo_cause_5,
  output         io_lsq_loadIn_bits_replayInfo_cause_6,
  output         io_lsq_loadIn_bits_replayInfo_cause_7,
  output         io_lsq_loadIn_bits_lqDataWenDup_1,
  output         io_lsq_loadIn_bits_lqDataWenDup_2,
  output         io_lsq_loadIn_bits_lqDataWenDup_3,
  output         io_lsq_loadIn_bits_lqDataWenDup_5,
  output         io_lsq_loadOut_ready,
  input          io_lsq_loadOut_valid,
  input          io_lsq_loadOut_bits_uop_cf_exceptionVec_4,
  input          io_lsq_loadOut_bits_uop_cf_exceptionVec_5,
  input          io_lsq_loadOut_bits_uop_cf_exceptionVec_13,
  input          io_lsq_loadOut_bits_uop_cf_trigger_backendEn_1,
  input          io_lsq_loadOut_bits_uop_cf_trigger_backendHit_0,
  input          io_lsq_loadOut_bits_uop_cf_trigger_backendHit_1,
  input          io_lsq_loadOut_bits_uop_cf_trigger_backendHit_4,
  input          io_lsq_loadOut_bits_uop_ctrl_rfWen,
  input          io_lsq_loadOut_bits_uop_ctrl_fpWen,
  input          io_lsq_loadOut_bits_uop_ctrl_flushPipe,
  input          io_lsq_loadOut_bits_uop_ctrl_replayInst,
  input  [5:0]   io_lsq_loadOut_bits_uop_pdest,
  input          io_lsq_loadOut_bits_uop_robIdx_flag,
  input  [4:0]   io_lsq_loadOut_bits_uop_robIdx_value,
  input          io_lsq_loadOut_bits_debug_isMMIO,
  input  [63:0]  io_lsq_ldRawData_lqData,
  input  [6:0]   io_lsq_ldRawData_uop_ctrl_fuOpType,
  input          io_lsq_ldRawData_uop_ctrl_fpWen,
  input  [2:0]   io_lsq_ldRawData_addrOffset,
  output [38:0]  io_lsq_forward_vaddr,
  output [35:0]  io_lsq_forward_paddr,
  output         io_lsq_forward_uop_cf_waitForRobIdx_flag,
  output [4:0]   io_lsq_forward_uop_cf_waitForRobIdx_value,
  output         io_lsq_forward_uop_sqIdx_flag,
  output [3:0]   io_lsq_forward_uop_sqIdx_value,
  output         io_lsq_forward_valid,
  input          io_lsq_forward_forwardMask_0,
  input          io_lsq_forward_forwardMask_1,
  input          io_lsq_forward_forwardMask_2,
  input          io_lsq_forward_forwardMask_3,
  input          io_lsq_forward_forwardMask_4,
  input          io_lsq_forward_forwardMask_5,
  input          io_lsq_forward_forwardMask_6,
  input          io_lsq_forward_forwardMask_7,
  input          io_lsq_forward_forwardMask_8,
  input          io_lsq_forward_forwardMask_9,
  input          io_lsq_forward_forwardMask_10,
  input          io_lsq_forward_forwardMask_11,
  input          io_lsq_forward_forwardMask_12,
  input          io_lsq_forward_forwardMask_13,
  input          io_lsq_forward_forwardMask_14,
  input          io_lsq_forward_forwardMask_15,
  input  [7:0]   io_lsq_forward_forwardData_0,
  input  [7:0]   io_lsq_forward_forwardData_1,
  input  [7:0]   io_lsq_forward_forwardData_2,
  input  [7:0]   io_lsq_forward_forwardData_3,
  input  [7:0]   io_lsq_forward_forwardData_4,
  input  [7:0]   io_lsq_forward_forwardData_5,
  input  [7:0]   io_lsq_forward_forwardData_6,
  input  [7:0]   io_lsq_forward_forwardData_7,
  input  [7:0]   io_lsq_forward_forwardData_8,
  input  [7:0]   io_lsq_forward_forwardData_9,
  input  [7:0]   io_lsq_forward_forwardData_10,
  input  [7:0]   io_lsq_forward_forwardData_11,
  input  [7:0]   io_lsq_forward_forwardData_12,
  input  [7:0]   io_lsq_forward_forwardData_13,
  input  [7:0]   io_lsq_forward_forwardData_14,
  input  [7:0]   io_lsq_forward_forwardData_15,
  output         io_lsq_forward_sqIdx_flag,
  input          io_lsq_forward_dataInvalid,
  input          io_lsq_forward_matchInvalid,
  input          io_lsq_forward_schedWait,
  output [11:0]  io_lsq_forward_sqIdxMask,
  input          io_lsq_forward_dataInvalidSqIdx_flag,
  input  [3:0]   io_lsq_forward_dataInvalidSqIdx_value,
  input          io_lsq_forward_addrInvalidSqIdx_flag,
  input  [3:0]   io_lsq_forward_addrInvalidSqIdx_value,
  output         io_lsq_storeLoadViolationQuery_req_valid,
  output [9:0]   io_lsq_storeLoadViolationQuery_req_bits_uop_cf_foldpc,
  output         io_lsq_storeLoadViolationQuery_req_bits_uop_cf_ftqPtr_flag,
  output [2:0]   io_lsq_storeLoadViolationQuery_req_bits_uop_cf_ftqPtr_value,
  output [2:0]   io_lsq_storeLoadViolationQuery_req_bits_uop_cf_ftqOffset,
  output         io_lsq_storeLoadViolationQuery_req_bits_uop_robIdx_flag,
  output [4:0]   io_lsq_storeLoadViolationQuery_req_bits_uop_robIdx_value,
  output         io_lsq_storeLoadViolationQuery_req_bits_uop_sqIdx_flag,
  output [3:0]   io_lsq_storeLoadViolationQuery_req_bits_uop_sqIdx_value,
  output [2:0]   io_lsq_storeLoadViolationQuery_req_bits_index,
  output         io_lsq_storeLoadViolationQuery_req_bits_allocated,
  output         io_lsq_storeLoadViolationQuery_req_bits_datavalid,
  output [7:0]   io_lsq_storeLoadViolationQuery_req_bits_mask,
  output [35:0]  io_lsq_storeLoadViolationQuery_req_bits_paddr,
  input  [2:0]   io_lsq_storeLoadViolationQuery_resp_bits_index,
  input          io_lsq_storeLoadViolationQuery_resp_bits_canAccept,
  input          io_lsq_storeLoadViolationQuery_resp_bits_allocated,
  output         io_lsq_loadLoadViolationQuery_req_valid,
  output         io_lsq_loadLoadViolationQuery_req_bits_uop_robIdx_flag,
  output [4:0]   io_lsq_loadLoadViolationQuery_req_bits_uop_robIdx_value,
  output         io_lsq_loadLoadViolationQuery_req_bits_uop_lqIdx_flag,
  output [3:0]   io_lsq_loadLoadViolationQuery_req_bits_uop_lqIdx_value,
  output [3:0]   io_lsq_loadLoadViolationQuery_req_bits_index,
  output         io_lsq_loadLoadViolationQuery_req_bits_allocated,
  output         io_lsq_loadLoadViolationQuery_req_bits_datavalid,
  output         io_lsq_loadLoadViolationQuery_req_bits_miss,
  output [35:0]  io_lsq_loadLoadViolationQuery_req_bits_paddr,
  input          io_lsq_loadLoadViolationQuery_resp_valid,
  input  [3:0]   io_lsq_loadLoadViolationQuery_resp_bits_index,
  input          io_lsq_loadLoadViolationQuery_resp_bits_canAccept,
  input          io_lsq_loadLoadViolationQuery_resp_bits_allocated,
  input          io_lsq_loadLoadViolationQuery_resp_bits_replayFromFetch,
  output         io_lsq_trigger_hitLoadAddrTriggerHitVec_0,
  output         io_lsq_trigger_hitLoadAddrTriggerHitVec_1,
  output         io_lsq_trigger_hitLoadAddrTriggerHitVec_2,
  input          io_lsq_trigger_lqLoadAddrTriggerHitVec_0,
  input          io_lsq_trigger_lqLoadAddrTriggerHitVec_1,
  input          io_lsq_trigger_lqLoadAddrTriggerHitVec_2,
  input          io_tlDchannel_valid,
  input  [255:0] io_tlDchannel_data,
  input  [1:0]   io_tlDchannel_mshrid,
  input          io_tlDchannel_last,
  output         io_forward_mshr_valid,
  output [1:0]   io_forward_mshr_mshrid,
  output [35:0]  io_forward_mshr_paddr,
  input          io_forward_mshr_forward_mshr,
  input  [7:0]   io_forward_mshr_forwardData_0,
  input  [7:0]   io_forward_mshr_forwardData_1,
  input  [7:0]   io_forward_mshr_forwardData_2,
  input  [7:0]   io_forward_mshr_forwardData_3,
  input  [7:0]   io_forward_mshr_forwardData_4,
  input  [7:0]   io_forward_mshr_forwardData_5,
  input  [7:0]   io_forward_mshr_forwardData_6,
  input  [7:0]   io_forward_mshr_forwardData_7,
  input  [7:0]   io_forward_mshr_forwardData_8,
  input  [7:0]   io_forward_mshr_forwardData_9,
  input  [7:0]   io_forward_mshr_forwardData_10,
  input  [7:0]   io_forward_mshr_forwardData_11,
  input  [7:0]   io_forward_mshr_forwardData_12,
  input  [7:0]   io_forward_mshr_forwardData_13,
  input  [7:0]   io_forward_mshr_forwardData_14,
  input  [7:0]   io_forward_mshr_forwardData_15,
  input          io_forward_mshr_forward_result_valid,
  input  [63:0]  io_trigger_0_tdata2,
  input  [1:0]   io_trigger_0_matchType,
  input          io_trigger_0_tEnable,
  output         io_trigger_0_addrHit,
  input  [63:0]  io_trigger_1_tdata2,
  input  [1:0]   io_trigger_1_matchType,
  input          io_trigger_1_tEnable,
  output         io_trigger_1_addrHit,
  input  [63:0]  io_trigger_2_tdata2,
  input  [1:0]   io_trigger_2_matchType,
  input          io_trigger_2_tEnable,
  output         io_trigger_2_addrHit,
  output         io_tlb_req_valid,
  output [38:0]  io_tlb_req_bits_vaddr,
  output [2:0]   io_tlb_req_bits_cmd,
  output         io_tlb_req_bits_no_translate,
  output         io_tlb_req_kill,
  input  [35:0]  io_tlb_resp_bits_paddr_0,
  input  [35:0]  io_tlb_resp_bits_paddr_1,
  input          io_tlb_resp_bits_miss,
  input          io_tlb_resp_bits_excp_0_pf_ld,
  input          io_tlb_resp_bits_excp_0_af_ld,
  input          io_tlb_resp_bits_static_pm_valid,
  input          io_tlb_resp_bits_static_pm_bits,
  input          io_pmp_ld,
  input          io_pmp_mmio,
  output [63:0]  io_fastpathOut_data,
  output         io_fastpathOut_valid,
  input  [63:0]  io_fastpathIn_data,
  input          io_fastpathIn_valid,
  input          io_loadFastMatch,
  input  [11:0]  io_loadFastImm,
  input          io_csrCtrl_ldld_vio_check_enable,
  input          io_csrCtrl_cache_error_enable,
  output [9:0]   io_correctTableQuery_req_addr,
  input          io_correctTableQuery_resp_strict,
  output         io_correctTableUpdate_valid,
  output [9:0]   io_correctTableUpdate_bits_addr,
  output         io_correctTableUpdate_bits_strict,
  output         io_correctTableUpdate_bits_violation,
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
  output         io_replay_ready,
  input          io_replay_valid,
  input  [9:0]   io_replay_bits_uop_cf_foldpc,
  input          io_replay_bits_uop_cf_trigger_backendEn_1,
  input          io_replay_bits_uop_cf_trigger_backendHit_0,
  input          io_replay_bits_uop_cf_trigger_backendHit_1,
  input          io_replay_bits_uop_cf_trigger_backendHit_4,
  input          io_replay_bits_uop_cf_waitForRobIdx_flag,
  input  [4:0]   io_replay_bits_uop_cf_waitForRobIdx_value,
  input          io_replay_bits_uop_cf_loadWaitBit,
  input          io_replay_bits_uop_cf_loadWaitStrict,
  input          io_replay_bits_uop_cf_ftqPtr_flag,
  input  [2:0]   io_replay_bits_uop_cf_ftqPtr_value,
  input  [2:0]   io_replay_bits_uop_cf_ftqOffset,
  input  [3:0]   io_replay_bits_uop_ctrl_fuType,
  input  [6:0]   io_replay_bits_uop_ctrl_fuOpType,
  input          io_replay_bits_uop_ctrl_rfWen,
  input          io_replay_bits_uop_ctrl_fpWen,
  input  [5:0]   io_replay_bits_uop_pdest,
  input          io_replay_bits_uop_robIdx_flag,
  input  [4:0]   io_replay_bits_uop_robIdx_value,
  input          io_replay_bits_uop_lqIdx_flag,
  input  [3:0]   io_replay_bits_uop_lqIdx_value,
  input          io_replay_bits_uop_sqIdx_flag,
  input  [3:0]   io_replay_bits_uop_sqIdx_value,
  input  [38:0]  io_replay_bits_vaddr,
  input          io_replay_bits_isFirstIssue,
  input  [7:0]   io_replay_bits_replayCarry_real_way_en,
  input          io_replay_bits_replayCarry_valid,
  input  [1:0]   io_replay_bits_mshrid,
  input          io_replay_bits_forward_tlDchannel,
  input          io_replay_bits_rarAllocated,
  input  [3:0]   io_replay_bits_rarIndex,
  input          io_replay_bits_rawAllocated,
  input  [2:0]   io_replay_bits_rawIndex,
  input          io_lqReplayFull,
  output [5:0]   io_perf_0_value,
  output [5:0]   io_perf_1_value,
  output [5:0]   io_perf_2_value,
  output [5:0]   io_perf_3_value,
  output [5:0]   io_perf_4_value,
  output [5:0]   io_perf_5_value,
  output [5:0]   io_perf_6_value
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
  reg [63:0] _RAND_25;
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
  reg [63:0] _RAND_69;
  reg [63:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_76;
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
  reg [63:0] _RAND_134;
  reg [63:0] _RAND_135;
  reg [31:0] _RAND_136;
  reg [31:0] _RAND_137;
  reg [31:0] _RAND_138;
  reg [31:0] _RAND_139;
  reg [31:0] _RAND_140;
  reg [31:0] _RAND_141;
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
  reg [63:0] _RAND_169;
  reg [31:0] _RAND_170;
  reg [31:0] _RAND_171;
  reg [63:0] _RAND_172;
  reg [63:0] _RAND_173;
  reg [31:0] _RAND_174;
  reg [31:0] _RAND_175;
  reg [63:0] _RAND_176;
  reg [63:0] _RAND_177;
  reg [31:0] _RAND_178;
  reg [31:0] _RAND_179;
  reg [63:0] _RAND_180;
  reg [31:0] _RAND_181;
  reg [31:0] _RAND_182;
  reg [31:0] _RAND_183;
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
`endif // RANDOMIZE_REG_INIT
  wire  load_s0_io_in_ready; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_in_valid; // @[LoadUnit.scala 924:23]
  wire [9:0] load_s0_io_in_bits_uop_cf_foldpc; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_in_bits_uop_cf_trigger_backendEn_1; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_in_bits_uop_cf_waitForRobIdx_flag; // @[LoadUnit.scala 924:23]
  wire [4:0] load_s0_io_in_bits_uop_cf_waitForRobIdx_value; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_in_bits_uop_cf_loadWaitBit; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_in_bits_uop_cf_loadWaitStrict; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_in_bits_uop_cf_ftqPtr_flag; // @[LoadUnit.scala 924:23]
  wire [2:0] load_s0_io_in_bits_uop_cf_ftqPtr_value; // @[LoadUnit.scala 924:23]
  wire [2:0] load_s0_io_in_bits_uop_cf_ftqOffset; // @[LoadUnit.scala 924:23]
  wire [3:0] load_s0_io_in_bits_uop_ctrl_fuType; // @[LoadUnit.scala 924:23]
  wire [6:0] load_s0_io_in_bits_uop_ctrl_fuOpType; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_in_bits_uop_ctrl_rfWen; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_in_bits_uop_ctrl_fpWen; // @[LoadUnit.scala 924:23]
  wire [19:0] load_s0_io_in_bits_uop_ctrl_imm; // @[LoadUnit.scala 924:23]
  wire [5:0] load_s0_io_in_bits_uop_pdest; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_in_bits_uop_robIdx_flag; // @[LoadUnit.scala 924:23]
  wire [4:0] load_s0_io_in_bits_uop_robIdx_value; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_in_bits_uop_lqIdx_flag; // @[LoadUnit.scala 924:23]
  wire [3:0] load_s0_io_in_bits_uop_lqIdx_value; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_in_bits_uop_sqIdx_flag; // @[LoadUnit.scala 924:23]
  wire [3:0] load_s0_io_in_bits_uop_sqIdx_value; // @[LoadUnit.scala 924:23]
  wire [63:0] load_s0_io_in_bits_src_0; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_vec_in_ready; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_vec_in_valid; // @[LoadUnit.scala 924:23]
  wire [38:0] load_s0_io_vec_in_bits_vaddr; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_out_ready; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_out_valid; // @[LoadUnit.scala 924:23]
  wire [9:0] load_s0_io_out_bits_uop_cf_foldpc; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_out_bits_uop_cf_exceptionVec_4; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_out_bits_uop_cf_trigger_backendEn_1; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_out_bits_uop_cf_trigger_backendHit_0; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_out_bits_uop_cf_trigger_backendHit_1; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_out_bits_uop_cf_trigger_backendHit_4; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_out_bits_uop_cf_waitForRobIdx_flag; // @[LoadUnit.scala 924:23]
  wire [4:0] load_s0_io_out_bits_uop_cf_waitForRobIdx_value; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_out_bits_uop_cf_loadWaitBit; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_out_bits_uop_cf_loadWaitStrict; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_out_bits_uop_cf_ftqPtr_flag; // @[LoadUnit.scala 924:23]
  wire [2:0] load_s0_io_out_bits_uop_cf_ftqPtr_value; // @[LoadUnit.scala 924:23]
  wire [2:0] load_s0_io_out_bits_uop_cf_ftqOffset; // @[LoadUnit.scala 924:23]
  wire [3:0] load_s0_io_out_bits_uop_ctrl_fuType; // @[LoadUnit.scala 924:23]
  wire [6:0] load_s0_io_out_bits_uop_ctrl_fuOpType; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_out_bits_uop_ctrl_rfWen; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_out_bits_uop_ctrl_fpWen; // @[LoadUnit.scala 924:23]
  wire [5:0] load_s0_io_out_bits_uop_pdest; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_out_bits_uop_robIdx_flag; // @[LoadUnit.scala 924:23]
  wire [4:0] load_s0_io_out_bits_uop_robIdx_value; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_out_bits_uop_lqIdx_flag; // @[LoadUnit.scala 924:23]
  wire [3:0] load_s0_io_out_bits_uop_lqIdx_value; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_out_bits_uop_sqIdx_flag; // @[LoadUnit.scala 924:23]
  wire [3:0] load_s0_io_out_bits_uop_sqIdx_value; // @[LoadUnit.scala 924:23]
  wire [38:0] load_s0_io_out_bits_vaddr; // @[LoadUnit.scala 924:23]
  wire [15:0] load_s0_io_out_bits_mask; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_out_bits_isPrefetch; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_out_bits_isHWPrefetch; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_out_bits_vec128bit; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_out_bits_isFirstIssue; // @[LoadUnit.scala 924:23]
  wire [1:0] load_s0_io_out_bits_mshrid; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_out_bits_forward_tlDchannel; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_out_bits_rarAllocated; // @[LoadUnit.scala 924:23]
  wire [3:0] load_s0_io_out_bits_rarIndex; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_out_bits_rawAllocated; // @[LoadUnit.scala 924:23]
  wire [2:0] load_s0_io_out_bits_rawIndex; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_dtlbReq_valid; // @[LoadUnit.scala 924:23]
  wire [38:0] load_s0_io_dtlbReq_bits_vaddr; // @[LoadUnit.scala 924:23]
  wire [2:0] load_s0_io_dtlbReq_bits_cmd; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_dtlbReq_bits_no_translate; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_dcacheReq_ready; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_dcacheReq_valid; // @[LoadUnit.scala 924:23]
  wire [4:0] load_s0_io_dcacheReq_bits_cmd; // @[LoadUnit.scala 924:23]
  wire [35:0] load_s0_io_dcacheReq_bits_addr; // @[LoadUnit.scala 924:23]
  wire [3:0] load_s0_io_dcacheReq_bits_instrtype; // @[LoadUnit.scala 924:23]
  wire [7:0] load_s0_io_dcacheReq_bits_replayCarry_real_way_en; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_dcacheReq_bits_replayCarry_valid; // @[LoadUnit.scala 924:23]
  wire [63:0] load_s0_io_fastpath_data; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_fastpath_valid; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_s0_kill; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_replay_ready; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_replay_valid; // @[LoadUnit.scala 924:23]
  wire [9:0] load_s0_io_replay_bits_uop_cf_foldpc; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_replay_bits_uop_cf_trigger_backendEn_1; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_replay_bits_uop_cf_trigger_backendHit_0; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_replay_bits_uop_cf_trigger_backendHit_1; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_replay_bits_uop_cf_trigger_backendHit_4; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_replay_bits_uop_cf_waitForRobIdx_flag; // @[LoadUnit.scala 924:23]
  wire [4:0] load_s0_io_replay_bits_uop_cf_waitForRobIdx_value; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_replay_bits_uop_cf_loadWaitBit; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_replay_bits_uop_cf_loadWaitStrict; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_replay_bits_uop_cf_ftqPtr_flag; // @[LoadUnit.scala 924:23]
  wire [2:0] load_s0_io_replay_bits_uop_cf_ftqPtr_value; // @[LoadUnit.scala 924:23]
  wire [2:0] load_s0_io_replay_bits_uop_cf_ftqOffset; // @[LoadUnit.scala 924:23]
  wire [3:0] load_s0_io_replay_bits_uop_ctrl_fuType; // @[LoadUnit.scala 924:23]
  wire [6:0] load_s0_io_replay_bits_uop_ctrl_fuOpType; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_replay_bits_uop_ctrl_rfWen; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_replay_bits_uop_ctrl_fpWen; // @[LoadUnit.scala 924:23]
  wire [5:0] load_s0_io_replay_bits_uop_pdest; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_replay_bits_uop_robIdx_flag; // @[LoadUnit.scala 924:23]
  wire [4:0] load_s0_io_replay_bits_uop_robIdx_value; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_replay_bits_uop_lqIdx_flag; // @[LoadUnit.scala 924:23]
  wire [3:0] load_s0_io_replay_bits_uop_lqIdx_value; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_replay_bits_uop_sqIdx_flag; // @[LoadUnit.scala 924:23]
  wire [3:0] load_s0_io_replay_bits_uop_sqIdx_value; // @[LoadUnit.scala 924:23]
  wire [38:0] load_s0_io_replay_bits_vaddr; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_replay_bits_isFirstIssue; // @[LoadUnit.scala 924:23]
  wire [7:0] load_s0_io_replay_bits_replayCarry_real_way_en; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_replay_bits_replayCarry_valid; // @[LoadUnit.scala 924:23]
  wire [1:0] load_s0_io_replay_bits_mshrid; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_replay_bits_forward_tlDchannel; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_replay_bits_rarAllocated; // @[LoadUnit.scala 924:23]
  wire [3:0] load_s0_io_replay_bits_rarIndex; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_replay_bits_rawAllocated; // @[LoadUnit.scala 924:23]
  wire [2:0] load_s0_io_replay_bits_rawIndex; // @[LoadUnit.scala 924:23]
  wire [3:0] load_s0_io_s0_sqIdx_value; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_l2lForward_select; // @[LoadUnit.scala 924:23]
  wire  load_s0_io_lqReplayFull; // @[LoadUnit.scala 924:23]
  wire  load_s1_io_in_valid; // @[LoadUnit.scala 925:23]
  wire [9:0] load_s1_io_in_bits_uop_cf_foldpc; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_in_bits_uop_cf_exceptionVec_4; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_in_bits_uop_cf_trigger_backendEn_1; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_in_bits_uop_cf_trigger_backendHit_0; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_in_bits_uop_cf_trigger_backendHit_1; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_in_bits_uop_cf_trigger_backendHit_4; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_in_bits_uop_cf_waitForRobIdx_flag; // @[LoadUnit.scala 925:23]
  wire [4:0] load_s1_io_in_bits_uop_cf_waitForRobIdx_value; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_in_bits_uop_cf_loadWaitBit; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_in_bits_uop_cf_loadWaitStrict; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_in_bits_uop_cf_ftqPtr_flag; // @[LoadUnit.scala 925:23]
  wire [2:0] load_s1_io_in_bits_uop_cf_ftqPtr_value; // @[LoadUnit.scala 925:23]
  wire [2:0] load_s1_io_in_bits_uop_cf_ftqOffset; // @[LoadUnit.scala 925:23]
  wire [3:0] load_s1_io_in_bits_uop_ctrl_fuType; // @[LoadUnit.scala 925:23]
  wire [6:0] load_s1_io_in_bits_uop_ctrl_fuOpType; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_in_bits_uop_ctrl_rfWen; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_in_bits_uop_ctrl_fpWen; // @[LoadUnit.scala 925:23]
  wire [5:0] load_s1_io_in_bits_uop_pdest; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_in_bits_uop_robIdx_flag; // @[LoadUnit.scala 925:23]
  wire [4:0] load_s1_io_in_bits_uop_robIdx_value; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_in_bits_uop_lqIdx_flag; // @[LoadUnit.scala 925:23]
  wire [3:0] load_s1_io_in_bits_uop_lqIdx_value; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_in_bits_uop_sqIdx_flag; // @[LoadUnit.scala 925:23]
  wire [3:0] load_s1_io_in_bits_uop_sqIdx_value; // @[LoadUnit.scala 925:23]
  wire [38:0] load_s1_io_in_bits_vaddr; // @[LoadUnit.scala 925:23]
  wire [15:0] load_s1_io_in_bits_mask; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_in_bits_isPrefetch; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_in_bits_isHWPrefetch; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_in_bits_vec128bit; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_in_bits_isFirstIssue; // @[LoadUnit.scala 925:23]
  wire [1:0] load_s1_io_in_bits_mshrid; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_in_bits_forward_tlDchannel; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_in_bits_rarAllocated; // @[LoadUnit.scala 925:23]
  wire [3:0] load_s1_io_in_bits_rarIndex; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_in_bits_rawAllocated; // @[LoadUnit.scala 925:23]
  wire [2:0] load_s1_io_in_bits_rawIndex; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_s1_kill; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_out_valid; // @[LoadUnit.scala 925:23]
  wire [9:0] load_s1_io_out_bits_uop_cf_foldpc; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_out_bits_uop_cf_exceptionVec_4; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_out_bits_uop_cf_exceptionVec_5; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_out_bits_uop_cf_exceptionVec_13; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_out_bits_uop_cf_trigger_backendEn_1; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_out_bits_uop_cf_trigger_backendHit_0; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_out_bits_uop_cf_trigger_backendHit_1; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_out_bits_uop_cf_trigger_backendHit_4; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_out_bits_uop_cf_waitForRobIdx_flag; // @[LoadUnit.scala 925:23]
  wire [4:0] load_s1_io_out_bits_uop_cf_waitForRobIdx_value; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_out_bits_uop_cf_loadWaitBit; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_out_bits_uop_cf_loadWaitStrict; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_out_bits_uop_cf_ftqPtr_flag; // @[LoadUnit.scala 925:23]
  wire [2:0] load_s1_io_out_bits_uop_cf_ftqPtr_value; // @[LoadUnit.scala 925:23]
  wire [2:0] load_s1_io_out_bits_uop_cf_ftqOffset; // @[LoadUnit.scala 925:23]
  wire [3:0] load_s1_io_out_bits_uop_ctrl_fuType; // @[LoadUnit.scala 925:23]
  wire [6:0] load_s1_io_out_bits_uop_ctrl_fuOpType; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_out_bits_uop_ctrl_rfWen; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_out_bits_uop_ctrl_fpWen; // @[LoadUnit.scala 925:23]
  wire [5:0] load_s1_io_out_bits_uop_pdest; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_out_bits_uop_robIdx_flag; // @[LoadUnit.scala 925:23]
  wire [4:0] load_s1_io_out_bits_uop_robIdx_value; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_out_bits_uop_lqIdx_flag; // @[LoadUnit.scala 925:23]
  wire [3:0] load_s1_io_out_bits_uop_lqIdx_value; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_out_bits_uop_sqIdx_flag; // @[LoadUnit.scala 925:23]
  wire [3:0] load_s1_io_out_bits_uop_sqIdx_value; // @[LoadUnit.scala 925:23]
  wire [38:0] load_s1_io_out_bits_vaddr; // @[LoadUnit.scala 925:23]
  wire [35:0] load_s1_io_out_bits_paddr; // @[LoadUnit.scala 925:23]
  wire [15:0] load_s1_io_out_bits_mask; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_out_bits_tlbMiss; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_out_bits_isPrefetch; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_out_bits_isHWPrefetch; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_out_bits_vec128bit; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_out_bits_isFirstIssue; // @[LoadUnit.scala 925:23]
  wire [1:0] load_s1_io_out_bits_mshrid; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_out_bits_forward_tlDchannel; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_out_bits_rarAllocated; // @[LoadUnit.scala 925:23]
  wire [3:0] load_s1_io_out_bits_rarIndex; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_out_bits_rawAllocated; // @[LoadUnit.scala 925:23]
  wire [2:0] load_s1_io_out_bits_rawIndex; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_out_bits_replayInfo_cause_2; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_out_bits_replayInfo_cause_4; // @[LoadUnit.scala 925:23]
  wire [35:0] load_s1_io_dtlbResp_bits_paddr_0; // @[LoadUnit.scala 925:23]
  wire [35:0] load_s1_io_dtlbResp_bits_paddr_1; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_dtlbResp_bits_miss; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_dtlbResp_bits_excp_0_pf_ld; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_dtlbResp_bits_excp_0_af_ld; // @[LoadUnit.scala 925:23]
  wire [35:0] load_s1_io_lsuPAddr; // @[LoadUnit.scala 925:23]
  wire [35:0] load_s1_io_dcachePAddr; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_dcacheKill; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_dcacheBankConflict; // @[LoadUnit.scala 925:23]
  wire [38:0] load_s1_io_sbuffer_vaddr; // @[LoadUnit.scala 925:23]
  wire [35:0] load_s1_io_sbuffer_paddr; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_sbuffer_valid; // @[LoadUnit.scala 925:23]
  wire [38:0] load_s1_io_lsq_vaddr; // @[LoadUnit.scala 925:23]
  wire [35:0] load_s1_io_lsq_paddr; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_lsq_uop_cf_waitForRobIdx_flag; // @[LoadUnit.scala 925:23]
  wire [4:0] load_s1_io_lsq_uop_cf_waitForRobIdx_value; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_lsq_uop_sqIdx_flag; // @[LoadUnit.scala 925:23]
  wire [3:0] load_s1_io_lsq_uop_sqIdx_value; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_lsq_valid; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_lsq_sqIdx_flag; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_reExecuteQuery_0_valid; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_reExecuteQuery_0_bits_robIdx_flag; // @[LoadUnit.scala 925:23]
  wire [4:0] load_s1_io_reExecuteQuery_0_bits_robIdx_value; // @[LoadUnit.scala 925:23]
  wire [35:0] load_s1_io_reExecuteQuery_0_bits_paddr; // @[LoadUnit.scala 925:23]
  wire [15:0] load_s1_io_reExecuteQuery_0_bits_mask; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_reExecuteQuery_1_valid; // @[LoadUnit.scala 925:23]
  wire  load_s1_io_reExecuteQuery_1_bits_robIdx_flag; // @[LoadUnit.scala 925:23]
  wire [4:0] load_s1_io_reExecuteQuery_1_bits_robIdx_value; // @[LoadUnit.scala 925:23]
  wire [35:0] load_s1_io_reExecuteQuery_1_bits_paddr; // @[LoadUnit.scala 925:23]
  wire [15:0] load_s1_io_reExecuteQuery_1_bits_mask; // @[LoadUnit.scala 925:23]
  wire [9:0] load_s1_io_correctTableQueryReq_addr; // @[LoadUnit.scala 925:23]
  wire  load_s2_clock; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_in_valid; // @[LoadUnit.scala 926:23]
  wire [9:0] load_s2_io_in_bits_uop_cf_foldpc; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_in_bits_uop_cf_exceptionVec_4; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_in_bits_uop_cf_exceptionVec_5; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_in_bits_uop_cf_exceptionVec_13; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_in_bits_uop_cf_trigger_backendEn_1; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_in_bits_uop_cf_trigger_backendHit_0; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_in_bits_uop_cf_trigger_backendHit_1; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_in_bits_uop_cf_trigger_backendHit_4; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_in_bits_uop_cf_waitForRobIdx_flag; // @[LoadUnit.scala 926:23]
  wire [4:0] load_s2_io_in_bits_uop_cf_waitForRobIdx_value; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_in_bits_uop_cf_loadWaitBit; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_in_bits_uop_cf_loadWaitStrict; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_in_bits_uop_cf_ftqPtr_flag; // @[LoadUnit.scala 926:23]
  wire [2:0] load_s2_io_in_bits_uop_cf_ftqPtr_value; // @[LoadUnit.scala 926:23]
  wire [2:0] load_s2_io_in_bits_uop_cf_ftqOffset; // @[LoadUnit.scala 926:23]
  wire [3:0] load_s2_io_in_bits_uop_ctrl_fuType; // @[LoadUnit.scala 926:23]
  wire [6:0] load_s2_io_in_bits_uop_ctrl_fuOpType; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_in_bits_uop_ctrl_rfWen; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_in_bits_uop_ctrl_fpWen; // @[LoadUnit.scala 926:23]
  wire [5:0] load_s2_io_in_bits_uop_pdest; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_in_bits_uop_robIdx_flag; // @[LoadUnit.scala 926:23]
  wire [4:0] load_s2_io_in_bits_uop_robIdx_value; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_in_bits_uop_lqIdx_flag; // @[LoadUnit.scala 926:23]
  wire [3:0] load_s2_io_in_bits_uop_lqIdx_value; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_in_bits_uop_sqIdx_flag; // @[LoadUnit.scala 926:23]
  wire [3:0] load_s2_io_in_bits_uop_sqIdx_value; // @[LoadUnit.scala 926:23]
  wire [38:0] load_s2_io_in_bits_vaddr; // @[LoadUnit.scala 926:23]
  wire [35:0] load_s2_io_in_bits_paddr; // @[LoadUnit.scala 926:23]
  wire [15:0] load_s2_io_in_bits_mask; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_in_bits_tlbMiss; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_in_bits_isPrefetch; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_in_bits_isHWPrefetch; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_in_bits_vec128bit; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_in_bits_isFirstIssue; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_in_bits_rarAllocated; // @[LoadUnit.scala 926:23]
  wire [3:0] load_s2_io_in_bits_rarIndex; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_in_bits_rawAllocated; // @[LoadUnit.scala 926:23]
  wire [2:0] load_s2_io_in_bits_rawIndex; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_in_bits_replayInfo_cause_2; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_in_bits_replayInfo_cause_4; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_out_valid; // @[LoadUnit.scala 926:23]
  wire [9:0] load_s2_io_out_bits_uop_cf_foldpc; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_out_bits_uop_cf_exceptionVec_4; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_out_bits_uop_cf_exceptionVec_5; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_out_bits_uop_cf_exceptionVec_13; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_out_bits_uop_cf_trigger_backendEn_1; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_out_bits_uop_cf_trigger_backendHit_0; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_out_bits_uop_cf_trigger_backendHit_1; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_out_bits_uop_cf_trigger_backendHit_4; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_out_bits_uop_cf_waitForRobIdx_flag; // @[LoadUnit.scala 926:23]
  wire [4:0] load_s2_io_out_bits_uop_cf_waitForRobIdx_value; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_out_bits_uop_cf_loadWaitBit; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_out_bits_uop_cf_loadWaitStrict; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_out_bits_uop_cf_ftqPtr_flag; // @[LoadUnit.scala 926:23]
  wire [2:0] load_s2_io_out_bits_uop_cf_ftqPtr_value; // @[LoadUnit.scala 926:23]
  wire [2:0] load_s2_io_out_bits_uop_cf_ftqOffset; // @[LoadUnit.scala 926:23]
  wire [3:0] load_s2_io_out_bits_uop_ctrl_fuType; // @[LoadUnit.scala 926:23]
  wire [6:0] load_s2_io_out_bits_uop_ctrl_fuOpType; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_out_bits_uop_ctrl_rfWen; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_out_bits_uop_ctrl_fpWen; // @[LoadUnit.scala 926:23]
  wire [5:0] load_s2_io_out_bits_uop_pdest; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_out_bits_uop_robIdx_flag; // @[LoadUnit.scala 926:23]
  wire [4:0] load_s2_io_out_bits_uop_robIdx_value; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_out_bits_uop_lqIdx_flag; // @[LoadUnit.scala 926:23]
  wire [3:0] load_s2_io_out_bits_uop_lqIdx_value; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_out_bits_uop_sqIdx_flag; // @[LoadUnit.scala 926:23]
  wire [3:0] load_s2_io_out_bits_uop_sqIdx_value; // @[LoadUnit.scala 926:23]
  wire [38:0] load_s2_io_out_bits_vaddr; // @[LoadUnit.scala 926:23]
  wire [35:0] load_s2_io_out_bits_paddr; // @[LoadUnit.scala 926:23]
  wire [15:0] load_s2_io_out_bits_mask; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_out_bits_miss; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_out_bits_tlbMiss; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_out_bits_mmio; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_out_bits_isPrefetch; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_out_bits_isHWPrefetch; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_out_bits_vec128bit; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_out_bits_rarAllocated; // @[LoadUnit.scala 926:23]
  wire [3:0] load_s2_io_out_bits_rarIndex; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_out_bits_rawAllocated; // @[LoadUnit.scala 926:23]
  wire [2:0] load_s2_io_out_bits_rawIndex; // @[LoadUnit.scala 926:23]
  wire [1:0] load_s2_io_out_bits_replayInfo_missMSHRId; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_out_bits_replayInfo_canForwardFullData; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_out_bits_replayInfo_dataInvalidSqIdx_flag; // @[LoadUnit.scala 926:23]
  wire [3:0] load_s2_io_out_bits_replayInfo_dataInvalidSqIdx_value; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_out_bits_replayInfo_addrInvalidSqIdx_flag; // @[LoadUnit.scala 926:23]
  wire [3:0] load_s2_io_out_bits_replayInfo_addrInvalidSqIdx_value; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_out_bits_replayInfo_replayCarry_real_way_en; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_out_bits_replayInfo_replayCarry_valid; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_out_bits_replayInfo_dataInLastBeat; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_out_bits_replayInfo_cause_0; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_out_bits_replayInfo_cause_1; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_out_bits_replayInfo_cause_2; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_out_bits_replayInfo_cause_4; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_out_bits_replayInfo_cause_5; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_out_bits_replayInfo_cause_6; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_out_bits_replayInfo_cause_7; // @[LoadUnit.scala 926:23]
  wire [127:0] load_s2_io_dcacheResp_bits_data_delayed; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_dcacheResp_bits_miss; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_dcacheResp_bits_replay; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_dcacheResp_bits_replayCarry_real_way_en; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_dcacheResp_bits_replayCarry_valid; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_dcacheResp_bits_tag_error; // @[LoadUnit.scala 926:23]
  wire [1:0] load_s2_io_dcacheResp_bits_mshr_id; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_pmpResp_ld; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_pmpResp_mmio; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_lsq_forwardMask_0; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_lsq_forwardMask_1; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_lsq_forwardMask_2; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_lsq_forwardMask_3; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_lsq_forwardMask_4; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_lsq_forwardMask_5; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_lsq_forwardMask_6; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_lsq_forwardMask_7; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_lsq_forwardMask_8; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_lsq_forwardMask_9; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_lsq_forwardMask_10; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_lsq_forwardMask_11; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_lsq_forwardMask_12; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_lsq_forwardMask_13; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_lsq_forwardMask_14; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_lsq_forwardMask_15; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_lsq_forwardData_0; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_lsq_forwardData_1; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_lsq_forwardData_2; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_lsq_forwardData_3; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_lsq_forwardData_4; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_lsq_forwardData_5; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_lsq_forwardData_6; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_lsq_forwardData_7; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_lsq_forwardData_8; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_lsq_forwardData_9; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_lsq_forwardData_10; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_lsq_forwardData_11; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_lsq_forwardData_12; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_lsq_forwardData_13; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_lsq_forwardData_14; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_lsq_forwardData_15; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_lsq_dataInvalid; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_lsq_schedWait; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_dataInvalidSqIdx_flag; // @[LoadUnit.scala 926:23]
  wire [3:0] load_s2_io_dataInvalidSqIdx_value; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_addrInvalidSqIdx_flag; // @[LoadUnit.scala 926:23]
  wire [3:0] load_s2_io_addrInvalidSqIdx_value; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_sbuffer_forwardMask_0; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_sbuffer_forwardMask_1; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_sbuffer_forwardMask_2; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_sbuffer_forwardMask_3; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_sbuffer_forwardMask_4; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_sbuffer_forwardMask_5; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_sbuffer_forwardMask_6; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_sbuffer_forwardMask_7; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_sbuffer_forwardMask_8; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_sbuffer_forwardMask_9; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_sbuffer_forwardMask_10; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_sbuffer_forwardMask_11; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_sbuffer_forwardMask_12; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_sbuffer_forwardMask_13; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_sbuffer_forwardMask_14; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_sbuffer_forwardMask_15; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_sbuffer_forwardData_0; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_sbuffer_forwardData_1; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_sbuffer_forwardData_2; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_sbuffer_forwardData_3; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_sbuffer_forwardData_4; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_sbuffer_forwardData_5; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_sbuffer_forwardData_6; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_sbuffer_forwardData_7; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_sbuffer_forwardData_8; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_sbuffer_forwardData_9; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_sbuffer_forwardData_10; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_sbuffer_forwardData_11; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_sbuffer_forwardData_12; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_sbuffer_forwardData_13; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_sbuffer_forwardData_14; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_sbuffer_forwardData_15; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_dataForwarded; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_dcache_kill; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_correctTableQueryResp_strict; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_loadLoadViolationQueryReq_valid; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_loadLoadViolationQueryReq_bits_uop_robIdx_flag; // @[LoadUnit.scala 926:23]
  wire [4:0] load_s2_io_loadLoadViolationQueryReq_bits_uop_robIdx_value; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_loadLoadViolationQueryReq_bits_uop_lqIdx_flag; // @[LoadUnit.scala 926:23]
  wire [3:0] load_s2_io_loadLoadViolationQueryReq_bits_uop_lqIdx_value; // @[LoadUnit.scala 926:23]
  wire [3:0] load_s2_io_loadLoadViolationQueryReq_bits_index; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_loadLoadViolationQueryReq_bits_allocated; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_loadLoadViolationQueryReq_bits_datavalid; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_loadLoadViolationQueryReq_bits_miss; // @[LoadUnit.scala 926:23]
  wire [35:0] load_s2_io_loadLoadViolationQueryReq_bits_paddr; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_storeLoadViolationQueryReq_valid; // @[LoadUnit.scala 926:23]
  wire [9:0] load_s2_io_storeLoadViolationQueryReq_bits_uop_cf_foldpc; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_storeLoadViolationQueryReq_bits_uop_cf_ftqPtr_flag; // @[LoadUnit.scala 926:23]
  wire [2:0] load_s2_io_storeLoadViolationQueryReq_bits_uop_cf_ftqPtr_value; // @[LoadUnit.scala 926:23]
  wire [2:0] load_s2_io_storeLoadViolationQueryReq_bits_uop_cf_ftqOffset; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_storeLoadViolationQueryReq_bits_uop_robIdx_flag; // @[LoadUnit.scala 926:23]
  wire [4:0] load_s2_io_storeLoadViolationQueryReq_bits_uop_robIdx_value; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_storeLoadViolationQueryReq_bits_uop_sqIdx_flag; // @[LoadUnit.scala 926:23]
  wire [3:0] load_s2_io_storeLoadViolationQueryReq_bits_uop_sqIdx_value; // @[LoadUnit.scala 926:23]
  wire [2:0] load_s2_io_storeLoadViolationQueryReq_bits_index; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_storeLoadViolationQueryReq_bits_allocated; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_storeLoadViolationQueryReq_bits_datavalid; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_storeLoadViolationQueryReq_bits_mask; // @[LoadUnit.scala 926:23]
  wire [35:0] load_s2_io_storeLoadViolationQueryReq_bits_paddr; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_correctTableUpdate_valid; // @[LoadUnit.scala 926:23]
  wire [9:0] load_s2_io_correctTableUpdate_bits_addr; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_correctTableUpdate_bits_strict; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_correctTableUpdate_bits_violation; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_csrCtrl_cache_error_enable; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_static_pm_valid; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_static_pm_bits; // @[LoadUnit.scala 926:23]
  wire [127:0] load_s2_io_loadDataFromDcache_respDcacheData; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_loadDataFromDcache_forwardMask_0; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_loadDataFromDcache_forwardMask_1; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_loadDataFromDcache_forwardMask_2; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_loadDataFromDcache_forwardMask_3; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_loadDataFromDcache_forwardMask_4; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_loadDataFromDcache_forwardMask_5; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_loadDataFromDcache_forwardMask_6; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_loadDataFromDcache_forwardMask_7; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_loadDataFromDcache_forwardMask_8; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_loadDataFromDcache_forwardMask_9; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_loadDataFromDcache_forwardMask_10; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_loadDataFromDcache_forwardMask_11; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_loadDataFromDcache_forwardMask_12; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_loadDataFromDcache_forwardMask_13; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_loadDataFromDcache_forwardMask_14; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_loadDataFromDcache_forwardMask_15; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_loadDataFromDcache_forwardData_0; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_loadDataFromDcache_forwardData_1; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_loadDataFromDcache_forwardData_2; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_loadDataFromDcache_forwardData_3; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_loadDataFromDcache_forwardData_4; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_loadDataFromDcache_forwardData_5; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_loadDataFromDcache_forwardData_6; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_loadDataFromDcache_forwardData_7; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_loadDataFromDcache_forwardData_8; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_loadDataFromDcache_forwardData_9; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_loadDataFromDcache_forwardData_10; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_loadDataFromDcache_forwardData_11; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_loadDataFromDcache_forwardData_12; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_loadDataFromDcache_forwardData_13; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_loadDataFromDcache_forwardData_14; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_loadDataFromDcache_forwardData_15; // @[LoadUnit.scala 926:23]
  wire [6:0] load_s2_io_loadDataFromDcache_uop_ctrl_fuOpType; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_loadDataFromDcache_uop_ctrl_fpWen; // @[LoadUnit.scala 926:23]
  wire [3:0] load_s2_io_loadDataFromDcache_addrOffset; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_loadDataFromDcache_forward_D; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_loadDataFromDcache_forwardData_D_0; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_loadDataFromDcache_forwardData_D_1; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_loadDataFromDcache_forwardData_D_2; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_loadDataFromDcache_forwardData_D_3; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_loadDataFromDcache_forwardData_D_4; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_loadDataFromDcache_forwardData_D_5; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_loadDataFromDcache_forwardData_D_6; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_loadDataFromDcache_forwardData_D_7; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_loadDataFromDcache_forwardData_D_8; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_loadDataFromDcache_forwardData_D_9; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_loadDataFromDcache_forwardData_D_10; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_loadDataFromDcache_forwardData_D_11; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_loadDataFromDcache_forwardData_D_12; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_loadDataFromDcache_forwardData_D_13; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_loadDataFromDcache_forwardData_D_14; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_loadDataFromDcache_forwardData_D_15; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_loadDataFromDcache_forward_mshr; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_loadDataFromDcache_forwardData_mshr_0; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_loadDataFromDcache_forwardData_mshr_1; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_loadDataFromDcache_forwardData_mshr_2; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_loadDataFromDcache_forwardData_mshr_3; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_loadDataFromDcache_forwardData_mshr_4; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_loadDataFromDcache_forwardData_mshr_5; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_loadDataFromDcache_forwardData_mshr_6; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_loadDataFromDcache_forwardData_mshr_7; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_loadDataFromDcache_forwardData_mshr_8; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_loadDataFromDcache_forwardData_mshr_9; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_loadDataFromDcache_forwardData_mshr_10; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_loadDataFromDcache_forwardData_mshr_11; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_loadDataFromDcache_forwardData_mshr_12; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_loadDataFromDcache_forwardData_mshr_13; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_loadDataFromDcache_forwardData_mshr_14; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_loadDataFromDcache_forwardData_mshr_15; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_loadDataFromDcache_forward_result_valid; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_reExecuteQuery_0_valid; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_reExecuteQuery_0_bits_robIdx_flag; // @[LoadUnit.scala 926:23]
  wire [4:0] load_s2_io_reExecuteQuery_0_bits_robIdx_value; // @[LoadUnit.scala 926:23]
  wire [35:0] load_s2_io_reExecuteQuery_0_bits_paddr; // @[LoadUnit.scala 926:23]
  wire [15:0] load_s2_io_reExecuteQuery_0_bits_mask; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_reExecuteQuery_1_valid; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_reExecuteQuery_1_bits_robIdx_flag; // @[LoadUnit.scala 926:23]
  wire [4:0] load_s2_io_reExecuteQuery_1_bits_robIdx_value; // @[LoadUnit.scala 926:23]
  wire [35:0] load_s2_io_reExecuteQuery_1_bits_paddr; // @[LoadUnit.scala 926:23]
  wire [15:0] load_s2_io_reExecuteQuery_1_bits_mask; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_forward_D; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_forwardData_D_0; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_forwardData_D_1; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_forwardData_D_2; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_forwardData_D_3; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_forwardData_D_4; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_forwardData_D_5; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_forwardData_D_6; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_forwardData_D_7; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_forwardData_D_8; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_forwardData_D_9; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_forwardData_D_10; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_forwardData_D_11; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_forwardData_D_12; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_forwardData_D_13; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_forwardData_D_14; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_forwardData_D_15; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_forward_mshr; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_forwardData_mshr_0; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_forwardData_mshr_1; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_forwardData_mshr_2; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_forwardData_mshr_3; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_forwardData_mshr_4; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_forwardData_mshr_5; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_forwardData_mshr_6; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_forwardData_mshr_7; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_forwardData_mshr_8; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_forwardData_mshr_9; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_forwardData_mshr_10; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_forwardData_mshr_11; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_forwardData_mshr_12; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_forwardData_mshr_13; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_forwardData_mshr_14; // @[LoadUnit.scala 926:23]
  wire [7:0] load_s2_io_forwardData_mshr_15; // @[LoadUnit.scala 926:23]
  wire  load_s2_io_forward_result_valid; // @[LoadUnit.scala 926:23]
  wire [6:0] s0_pointerChasingVAddr = io_fastpathIn_data[5:0] + io_loadFastImm[5:0]; // @[LoadUnit.scala 943:57]
  wire [5:0] _s1_data_flushItself_T_1 = {load_s0_io_out_bits_uop_robIdx_flag,load_s0_io_out_bits_uop_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire [5:0] _s1_data_flushItself_T_2 = {io_redirect_bits_robIdx_flag,io_redirect_bits_robIdx_value}; // @[CircularQueuePtr.scala 61:70]
  wire  _s1_data_flushItself_T_3 = _s1_data_flushItself_T_1 == _s1_data_flushItself_T_2; // @[CircularQueuePtr.scala 61:52]
  wire  s1_data_flushItself = io_redirect_bits_level & _s1_data_flushItself_T_3; // @[Rob.scala 122:51]
  wire  s1_data_differentFlag = load_s0_io_out_bits_uop_robIdx_flag ^ io_redirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  s1_data_compare = load_s0_io_out_bits_uop_robIdx_value > io_redirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _s1_data_T = s1_data_differentFlag ^ s1_data_compare; // @[CircularQueuePtr.scala 88:19]
  wire  _s1_data_T_2 = io_redirect_valid & (s1_data_flushItself | _s1_data_T); // @[Rob.scala 123:20]
  wire  _s1_data_T_4 = _s1_data_T_2 & ~load_s0_io_l2lForward_select; // @[LoadUnit.scala 948:59]
  reg  s1_data_valid; // @[PipelineConnect.scala 108:24]
  wire  s1_data_leftFire = load_s0_io_out_valid; // @[PipelineConnect.scala 109:31]
  reg [9:0] s1_data_uop_cf_foldpc; // @[Reg.scala 16:16]
  reg  s1_data_uop_cf_exceptionVec_4; // @[Reg.scala 16:16]
  reg  s1_data_uop_cf_trigger_backendEn_1; // @[Reg.scala 16:16]
  reg  s1_data_uop_cf_trigger_backendHit_0; // @[Reg.scala 16:16]
  reg  s1_data_uop_cf_trigger_backendHit_1; // @[Reg.scala 16:16]
  reg  s1_data_uop_cf_trigger_backendHit_4; // @[Reg.scala 16:16]
  reg  s1_data_uop_cf_waitForRobIdx_flag; // @[Reg.scala 16:16]
  reg [4:0] s1_data_uop_cf_waitForRobIdx_value; // @[Reg.scala 16:16]
  reg  s1_data_uop_cf_loadWaitBit; // @[Reg.scala 16:16]
  reg  s1_data_uop_cf_loadWaitStrict; // @[Reg.scala 16:16]
  reg  s1_data_uop_cf_ftqPtr_flag; // @[Reg.scala 16:16]
  reg [2:0] s1_data_uop_cf_ftqPtr_value; // @[Reg.scala 16:16]
  reg [2:0] s1_data_uop_cf_ftqOffset; // @[Reg.scala 16:16]
  reg [3:0] s1_data_uop_ctrl_fuType; // @[Reg.scala 16:16]
  reg [6:0] s1_data_uop_ctrl_fuOpType; // @[Reg.scala 16:16]
  reg  s1_data_uop_ctrl_rfWen; // @[Reg.scala 16:16]
  reg  s1_data_uop_ctrl_fpWen; // @[Reg.scala 16:16]
  reg [5:0] s1_data_uop_pdest; // @[Reg.scala 16:16]
  reg  s1_data_uop_robIdx_flag; // @[Reg.scala 16:16]
  reg [4:0] s1_data_uop_robIdx_value; // @[Reg.scala 16:16]
  reg  s1_data_uop_lqIdx_flag; // @[Reg.scala 16:16]
  reg [3:0] s1_data_uop_lqIdx_value; // @[Reg.scala 16:16]
  reg  s1_data_uop_sqIdx_flag; // @[Reg.scala 16:16]
  reg [3:0] s1_data_uop_sqIdx_value; // @[Reg.scala 16:16]
  reg [38:0] s1_data_vaddr; // @[Reg.scala 16:16]
  reg [15:0] s1_data_mask; // @[Reg.scala 16:16]
  reg  s1_data_isPrefetch; // @[Reg.scala 16:16]
  reg  s1_data_isHWPrefetch; // @[Reg.scala 16:16]
  reg  s1_data_vec128bit; // @[Reg.scala 16:16]
  reg  s1_data_isFirstIssue; // @[Reg.scala 16:16]
  reg [1:0] s1_data_mshrid; // @[Reg.scala 16:16]
  reg  s1_data_forward_tlDchannel; // @[Reg.scala 16:16]
  reg  s1_data_rarAllocated; // @[Reg.scala 16:16]
  reg [3:0] s1_data_rarIndex; // @[Reg.scala 16:16]
  reg  s1_data_rawAllocated; // @[Reg.scala 16:16]
  reg [2:0] s1_data_rawIndex; // @[Reg.scala 16:16]
  wire  _load_s1_io_s1_kill_T_1 = io_loadIn_valid | io_replay_valid | io_fastpathIn_valid; // @[LoadUnit.scala 952:99]
  reg  load_s1_io_s1_kill_r; // @[Reg.scala 28:20]
  wire  s0_doTryPointerChasing = load_s0_io_l2lForward_select & load_s0_io_out_ready & load_s0_io_dcacheReq_ready; // @[LoadUnit.scala 970:77]
  reg  s1_tryPointerChasing; // @[LoadUnit.scala 971:37]
  reg [6:0] s1_pointerChasingVAddr; // @[Reg.scala 16:16]
  wire  _addressMisMatch_T_2 = |io_loadFastImm[11:6]; // @[LoadUnit.scala 978:88]
  reg  addressMisMatch_r; // @[Reg.scala 16:16]
  wire  addressMisMatch = s1_pointerChasingVAddr[6] | addressMisMatch_r; // @[LoadUnit.scala 978:53]
  wire  addressNotAligned = |s1_pointerChasingVAddr[2:0]; // @[LoadUnit.scala 980:58]
  wire  fuOpTypeIsNotLd = io_loadIn_bits_uop_ctrl_fuOpType != 7'h3; // @[LoadUnit.scala 981:60]
  wire  _notFastMatch_T = ~io_loadFastMatch; // @[LoadUnit.scala 983:34]
  reg  notFastMatch; // @[Reg.scala 16:16]
  wire  isCancelled = ~io_loadIn_valid; // @[LoadUnit.scala 985:23]
  wire [38:0] vaddr = {s1_data_vaddr[38:6],s1_pointerChasingVAddr[5:3],3'h0}; // @[Cat.scala 31:58]
  wire [35:0] _load_s1_io_dtlbResp_bits_paddr_0_T_2 = {io_tlb_resp_bits_paddr_0[35:6],s1_pointerChasingVAddr[5:3],3'h0}; // @[Cat.scala 31:58]
  wire  cancelPointerChasing = s1_tryPointerChasing & (addressMisMatch | addressNotAligned | fuOpTypeIsNotLd |
    notFastMatch | isCancelled); // @[LoadUnit.scala 986:33 987:28]
  wire  _GEN_328 = s1_tryPointerChasing | load_s0_io_in_ready; // @[LoadUnit.scala 1004:35 1005:25 929:17]
  wire  _T = ~cancelPointerChasing; // @[LoadUnit.scala 1009:70]
  wire [5:0] _flushItself_T_1 = {load_s1_io_out_bits_uop_robIdx_flag,load_s1_io_out_bits_uop_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _flushItself_T_3 = _flushItself_T_1 == _s1_data_flushItself_T_2; // @[CircularQueuePtr.scala 61:52]
  wire  flushItself = io_redirect_bits_level & _flushItself_T_3; // @[Rob.scala 122:51]
  wire  differentFlag = load_s1_io_out_bits_uop_robIdx_flag ^ io_redirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  compare = load_s1_io_out_bits_uop_robIdx_value > io_redirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _T_27 = differentFlag ^ compare; // @[CircularQueuePtr.scala 88:19]
  wire  _T_29 = io_redirect_valid & (flushItself | _T_27); // @[Rob.scala 123:20]
  wire  _T_30 = _T_29 | cancelPointerChasing; // @[LoadUnit.scala 1022:59]
  reg  valid; // @[PipelineConnect.scala 108:24]
  wire  leftFire = load_s1_io_out_valid; // @[PipelineConnect.scala 109:31]
  reg [9:0] data_uop_cf_foldpc; // @[Reg.scala 16:16]
  reg  data_uop_cf_exceptionVec_4; // @[Reg.scala 16:16]
  reg  data_uop_cf_exceptionVec_5; // @[Reg.scala 16:16]
  reg  data_uop_cf_exceptionVec_13; // @[Reg.scala 16:16]
  reg  data_uop_cf_trigger_backendEn_1; // @[Reg.scala 16:16]
  reg  data_uop_cf_trigger_backendHit_0; // @[Reg.scala 16:16]
  reg  data_uop_cf_trigger_backendHit_1; // @[Reg.scala 16:16]
  reg  data_uop_cf_trigger_backendHit_4; // @[Reg.scala 16:16]
  reg  data_uop_cf_waitForRobIdx_flag; // @[Reg.scala 16:16]
  reg [4:0] data_uop_cf_waitForRobIdx_value; // @[Reg.scala 16:16]
  reg  data_uop_cf_loadWaitBit; // @[Reg.scala 16:16]
  reg  data_uop_cf_loadWaitStrict; // @[Reg.scala 16:16]
  reg  data_uop_cf_ftqPtr_flag; // @[Reg.scala 16:16]
  reg [2:0] data_uop_cf_ftqPtr_value; // @[Reg.scala 16:16]
  reg [2:0] data_uop_cf_ftqOffset; // @[Reg.scala 16:16]
  reg [3:0] data_uop_ctrl_fuType; // @[Reg.scala 16:16]
  reg [6:0] data_uop_ctrl_fuOpType; // @[Reg.scala 16:16]
  reg  data_uop_ctrl_rfWen; // @[Reg.scala 16:16]
  reg  data_uop_ctrl_fpWen; // @[Reg.scala 16:16]
  reg [5:0] data_uop_pdest; // @[Reg.scala 16:16]
  reg  data_uop_robIdx_flag; // @[Reg.scala 16:16]
  reg [4:0] data_uop_robIdx_value; // @[Reg.scala 16:16]
  reg  data_uop_lqIdx_flag; // @[Reg.scala 16:16]
  reg [3:0] data_uop_lqIdx_value; // @[Reg.scala 16:16]
  reg  data_uop_sqIdx_flag; // @[Reg.scala 16:16]
  reg [3:0] data_uop_sqIdx_value; // @[Reg.scala 16:16]
  reg [38:0] data_vaddr; // @[Reg.scala 16:16]
  reg [35:0] data_paddr; // @[Reg.scala 16:16]
  reg [15:0] data_mask; // @[Reg.scala 16:16]
  reg  data_tlbMiss; // @[Reg.scala 16:16]
  reg  data_isPrefetch; // @[Reg.scala 16:16]
  reg  data_isHWPrefetch; // @[Reg.scala 16:16]
  reg  data_vec128bit; // @[Reg.scala 16:16]
  reg  data_isFirstIssue; // @[Reg.scala 16:16]
  reg  data_rarAllocated; // @[Reg.scala 16:16]
  reg [3:0] data_rarIndex; // @[Reg.scala 16:16]
  reg  data_rawAllocated; // @[Reg.scala 16:16]
  reg [2:0] data_rawIndex; // @[Reg.scala 16:16]
  reg  data_replayInfo_cause_2; // @[Reg.scala 16:16]
  reg  data_replayInfo_cause_4; // @[Reg.scala 16:16]
  wire  _T_31 = load_s1_io_out_valid & load_s1_io_out_bits_forward_tlDchannel; // @[LoadUnit.scala 1024:79]
  wire  _all_match_T_1 = load_s1_io_out_bits_mshrid == io_tlDchannel_mshrid; // @[DCacheWrapper.scala 545:29]
  wire  _all_match_T_2 = _T_31 & io_tlDchannel_valid & _all_match_T_1; // @[DCacheWrapper.scala 544:40]
  wire  _all_match_T_4 = load_s1_io_out_bits_paddr[5] == io_tlDchannel_last; // @[DCacheWrapper.scala 546:48]
  reg  forward_D; // @[DCacheWrapper.scala 548:28]
  reg [7:0] forwardData_D_0; // @[DCacheWrapper.scala 549:30]
  reg [7:0] forwardData_D_1; // @[DCacheWrapper.scala 549:30]
  reg [7:0] forwardData_D_2; // @[DCacheWrapper.scala 549:30]
  reg [7:0] forwardData_D_3; // @[DCacheWrapper.scala 549:30]
  reg [7:0] forwardData_D_4; // @[DCacheWrapper.scala 549:30]
  reg [7:0] forwardData_D_5; // @[DCacheWrapper.scala 549:30]
  reg [7:0] forwardData_D_6; // @[DCacheWrapper.scala 549:30]
  reg [7:0] forwardData_D_7; // @[DCacheWrapper.scala 549:30]
  reg [7:0] forwardData_D_8; // @[DCacheWrapper.scala 549:30]
  reg [7:0] forwardData_D_9; // @[DCacheWrapper.scala 549:30]
  reg [7:0] forwardData_D_10; // @[DCacheWrapper.scala 549:30]
  reg [7:0] forwardData_D_11; // @[DCacheWrapper.scala 549:30]
  reg [7:0] forwardData_D_12; // @[DCacheWrapper.scala 549:30]
  reg [7:0] forwardData_D_13; // @[DCacheWrapper.scala 549:30]
  reg [7:0] forwardData_D_14; // @[DCacheWrapper.scala 549:30]
  reg [7:0] forwardData_D_15; // @[DCacheWrapper.scala 549:30]
  wire [1:0] block_idx = load_s1_io_out_bits_paddr[4:3]; // @[DCacheWrapper.scala 551:30]
  wire [63:0] block_data_0 = io_tlDchannel_data[63:0]; // @[DCacheWrapper.scala 554:28]
  wire [63:0] block_data_1 = io_tlDchannel_data[127:64]; // @[DCacheWrapper.scala 554:28]
  wire [63:0] block_data_2 = io_tlDchannel_data[191:128]; // @[DCacheWrapper.scala 554:28]
  wire [63:0] block_data_3 = io_tlDchannel_data[255:192]; // @[DCacheWrapper.scala 554:28]
  wire [63:0] _GEN_544 = 2'h1 == block_idx ? block_data_1 : block_data_0; // @[DCacheWrapper.scala 559:{46,46}]
  wire [63:0] _GEN_545 = 2'h2 == block_idx ? block_data_2 : _GEN_544; // @[DCacheWrapper.scala 559:{46,46}]
  wire [63:0] _GEN_546 = 2'h3 == block_idx ? block_data_3 : _GEN_545; // @[DCacheWrapper.scala 559:{46,46}]
  wire [127:0] _selected_data_T = {_GEN_546, 64'h0}; // @[DCacheWrapper.scala 559:46]
  wire [1:0] _selected_data_T_2 = block_idx + 2'h1; // @[DCacheWrapper.scala 561:49]
  wire [63:0] _GEN_548 = 2'h1 == _selected_data_T_2 ? block_data_1 : block_data_0; // @[Cat.scala 31:{58,58}]
  wire [63:0] _GEN_549 = 2'h2 == _selected_data_T_2 ? block_data_2 : _GEN_548; // @[Cat.scala 31:{58,58}]
  wire [63:0] _GEN_550 = 2'h3 == _selected_data_T_2 ? block_data_3 : _GEN_549; // @[Cat.scala 31:{58,58}]
  wire [127:0] _selected_data_T_3 = {_GEN_550,_GEN_546}; // @[Cat.scala 31:58]
  wire [127:0] selected_data = load_s1_io_out_bits_paddr[3] ? _selected_data_T : _selected_data_T_3; // @[DCacheWrapper.scala 558:23 559:21 561:21]
  wire  _io_prefetch_train_valid_T = load_s2_io_in_valid; // @[Decoupled.scala 50:35]
  reg  load_s2_io_static_pm_REG_valid; // @[LoadUnit.scala 1054:34]
  reg  load_s2_io_static_pm_REG_bits; // @[LoadUnit.scala 1054:34]
  reg  io_correctTableUpdate_REG_valid; // @[LoadUnit.scala 1077:35]
  reg [9:0] io_correctTableUpdate_REG_bits_addr; // @[LoadUnit.scala 1077:35]
  reg  io_correctTableUpdate_REG_bits_strict; // @[LoadUnit.scala 1077:35]
  reg  io_correctTableUpdate_REG_bits_violation; // @[LoadUnit.scala 1077:35]
  wire [15:0] _sqIdxMaskReg_T = 16'h1 << load_s0_io_s0_sqIdx_value; // @[OneHot.scala 57:35]
  reg [11:0] sqIdxMaskReg; // @[LoadUnit.scala 1079:29]
  wire [15:0] _io_lsq_forward_sqIdxMask_T = 16'h1 << io_loadIn_bits_uop_sqIdx_value; // @[OneHot.scala 57:35]
  wire [11:0] _io_lsq_forward_sqIdxMask_T_3 = _io_lsq_forward_sqIdxMask_T[11:0] - 12'h1; // @[BitUtils.scala 179:75]
  wire  s2_loadOutValid = load_s2_io_out_valid & ~load_s2_io_out_bits_isHWPrefetch; // @[LoadUnit.scala 1111:46]
  reg [5:0] s2_loadValidVec; // @[LoadUnit.scala 1113:32]
  reg [9:0] s3_loadOutBits_uop_cf_foldpc; // @[Reg.scala 16:16]
  reg  s3_loadOutBits_uop_cf_exceptionVec_4; // @[Reg.scala 16:16]
  reg  s3_loadOutBits_uop_cf_exceptionVec_5; // @[Reg.scala 16:16]
  reg  s3_loadOutBits_uop_cf_exceptionVec_13; // @[Reg.scala 16:16]
  reg  s3_loadOutBits_uop_cf_trigger_backendEn_1; // @[Reg.scala 16:16]
  reg  s3_loadOutBits_uop_cf_trigger_backendHit_0; // @[Reg.scala 16:16]
  reg  s3_loadOutBits_uop_cf_trigger_backendHit_1; // @[Reg.scala 16:16]
  reg  s3_loadOutBits_uop_cf_trigger_backendHit_4; // @[Reg.scala 16:16]
  reg  s3_loadOutBits_uop_cf_waitForRobIdx_flag; // @[Reg.scala 16:16]
  reg [4:0] s3_loadOutBits_uop_cf_waitForRobIdx_value; // @[Reg.scala 16:16]
  reg  s3_loadOutBits_uop_cf_loadWaitBit; // @[Reg.scala 16:16]
  reg  s3_loadOutBits_uop_cf_loadWaitStrict; // @[Reg.scala 16:16]
  reg  s3_loadOutBits_uop_cf_ftqPtr_flag; // @[Reg.scala 16:16]
  reg [2:0] s3_loadOutBits_uop_cf_ftqPtr_value; // @[Reg.scala 16:16]
  reg [2:0] s3_loadOutBits_uop_cf_ftqOffset; // @[Reg.scala 16:16]
  reg [3:0] s3_loadOutBits_uop_ctrl_fuType; // @[Reg.scala 16:16]
  reg [6:0] s3_loadOutBits_uop_ctrl_fuOpType; // @[Reg.scala 16:16]
  reg  s3_loadOutBits_uop_ctrl_rfWen; // @[Reg.scala 16:16]
  reg  s3_loadOutBits_uop_ctrl_fpWen; // @[Reg.scala 16:16]
  reg [5:0] s3_loadOutBits_uop_pdest; // @[Reg.scala 16:16]
  reg  s3_loadOutBits_uop_robIdx_flag; // @[Reg.scala 16:16]
  reg [4:0] s3_loadOutBits_uop_robIdx_value; // @[Reg.scala 16:16]
  reg  s3_loadOutBits_uop_lqIdx_flag; // @[Reg.scala 16:16]
  reg [3:0] s3_loadOutBits_uop_lqIdx_value; // @[Reg.scala 16:16]
  reg  s3_loadOutBits_uop_sqIdx_flag; // @[Reg.scala 16:16]
  reg [3:0] s3_loadOutBits_uop_sqIdx_value; // @[Reg.scala 16:16]
  reg [38:0] s3_loadOutBits_vaddr; // @[Reg.scala 16:16]
  reg [35:0] s3_loadOutBits_paddr; // @[Reg.scala 16:16]
  reg [15:0] s3_loadOutBits_mask; // @[Reg.scala 16:16]
  reg  s3_loadOutBits_miss; // @[Reg.scala 16:16]
  reg  s3_loadOutBits_tlbMiss; // @[Reg.scala 16:16]
  reg  s3_loadOutBits_mmio; // @[Reg.scala 16:16]
  reg  s3_loadOutBits_isPrefetch; // @[Reg.scala 16:16]
  reg  s3_loadOutBits_vec128bit; // @[Reg.scala 16:16]
  reg  s3_loadOutBits_rarAllocated; // @[Reg.scala 16:16]
  reg [3:0] s3_loadOutBits_rarIndex; // @[Reg.scala 16:16]
  reg  s3_loadOutBits_rawAllocated; // @[Reg.scala 16:16]
  reg [2:0] s3_loadOutBits_rawIndex; // @[Reg.scala 16:16]
  reg [1:0] s3_loadOutBits_replayInfo_missMSHRId; // @[Reg.scala 16:16]
  reg  s3_loadOutBits_replayInfo_canForwardFullData; // @[Reg.scala 16:16]
  reg  s3_loadOutBits_replayInfo_dataInvalidSqIdx_flag; // @[Reg.scala 16:16]
  reg [3:0] s3_loadOutBits_replayInfo_dataInvalidSqIdx_value; // @[Reg.scala 16:16]
  reg  s3_loadOutBits_replayInfo_addrInvalidSqIdx_flag; // @[Reg.scala 16:16]
  reg [3:0] s3_loadOutBits_replayInfo_addrInvalidSqIdx_value; // @[Reg.scala 16:16]
  reg [7:0] s3_loadOutBits_replayInfo_replayCarry_real_way_en; // @[Reg.scala 16:16]
  reg  s3_loadOutBits_replayInfo_replayCarry_valid; // @[Reg.scala 16:16]
  reg  s3_loadOutBits_replayInfo_dataInLastBeat; // @[Reg.scala 16:16]
  reg  s3_loadOutBits_replayInfo_cause_0; // @[Reg.scala 16:16]
  reg  s3_loadOutBits_replayInfo_cause_1; // @[Reg.scala 16:16]
  reg  s3_loadOutBits_replayInfo_cause_2; // @[Reg.scala 16:16]
  reg  s3_loadOutBits_replayInfo_cause_4; // @[Reg.scala 16:16]
  reg  s3_loadOutBits_replayInfo_cause_5; // @[Reg.scala 16:16]
  reg  s3_loadOutBits_replayInfo_cause_6; // @[Reg.scala 16:16]
  reg  s3_loadOutBits_replayInfo_cause_7; // @[Reg.scala 16:16]
  reg  s3_loadOutValid_REG; // @[LoadUnit.scala 1126:32]
  wire [5:0] _s3_loadOutValid_flushItself_T_1 = {load_s2_io_out_bits_uop_robIdx_flag,
    load_s2_io_out_bits_uop_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _s3_loadOutValid_flushItself_T_3 = _s3_loadOutValid_flushItself_T_1 == _s1_data_flushItself_T_2; // @[CircularQueuePtr.scala 61:52]
  wire  s3_loadOutValid_flushItself = io_redirect_bits_level & _s3_loadOutValid_flushItself_T_3; // @[Rob.scala 122:51]
  wire  s3_loadOutValid_differentFlag = load_s2_io_out_bits_uop_robIdx_flag ^ io_redirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  s3_loadOutValid_compare = load_s2_io_out_bits_uop_robIdx_value > io_redirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _s3_loadOutValid_T = s3_loadOutValid_differentFlag ^ s3_loadOutValid_compare; // @[CircularQueuePtr.scala 88:19]
  reg  s3_loadOutValid_REG_1; // @[LoadUnit.scala 1126:61]
  wire  s3_loadOutValid = s3_loadOutValid_REG & ~s3_loadOutValid_REG_1; // @[LoadUnit.scala 1126:50]
  reg [5:0] s3_loadValidVec; // @[LoadUnit.scala 1133:28]
  reg  s3_delayedLoadError_REG; // @[LoadUnit.scala 1141:51]
  wire  s3_delayedLoadError = io_dcache_resp_bits_error_delayed & s3_delayedLoadError_REG; // @[LoadUnit.scala 1141:41]
  wire  rarAllocated = ~s3_loadOutBits_rarAllocated & io_lsq_loadLoadViolationQuery_resp_bits_allocated; // @[LoadUnit.scala 1155:51]
  wire  rawAllocated = ~s3_loadOutBits_rawAllocated & io_lsq_storeLoadViolationQuery_resp_bits_allocated; // @[LoadUnit.scala 1156:51]
  reg  s3_forwardFail; // @[LoadUnit.scala 1162:31]
  wire  _s3_ldld_replayFromFetch_T = io_lsq_loadLoadViolationQuery_resp_valid &
    io_lsq_loadLoadViolationQuery_resp_bits_replayFromFetch; // @[LoadUnit.scala 1164:46]
  reg  s3_ldld_replayFromFetch_REG; // @[LoadUnit.scala 1166:12]
  wire  s3_ldld_replayFromFetch = _s3_ldld_replayFromFetch_T & s3_ldld_replayFromFetch_REG; // @[LoadUnit.scala 1165:61]
  wire  s3_schedError_differentFlag = s3_loadOutBits_uop_robIdx_flag ^ io_reExecuteQuery_0_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  s3_schedError_compare = s3_loadOutBits_uop_robIdx_value > io_reExecuteQuery_0_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _s3_schedError_T = s3_schedError_differentFlag ^ s3_schedError_compare; // @[CircularQueuePtr.scala 88:19]
  wire  _s3_schedError_T_1 = io_reExecuteQuery_0_valid & _s3_schedError_T; // @[LoadUnit.scala 1173:32]
  wire  _s3_schedError_T_4 = s3_loadOutBits_paddr[35:3] == io_reExecuteQuery_0_bits_paddr[35:3]; // @[LoadUnit.scala 1175:42]
  wire  _s3_schedError_T_5 = _s3_schedError_T_1 & _s3_schedError_T_4; // @[LoadUnit.scala 1174:74]
  wire [15:0] _s3_schedError_T_6 = s3_loadOutBits_mask & io_reExecuteQuery_0_bits_mask; // @[LoadUnit.scala 1176:26]
  wire  _s3_schedError_T_7 = |_s3_schedError_T_6; // @[LoadUnit.scala 1176:60]
  wire  _s3_schedError_T_8 = _s3_schedError_T_5 & _s3_schedError_T_7; // @[LoadUnit.scala 1175:95]
  wire  s3_schedError_differentFlag_1 = s3_loadOutBits_uop_robIdx_flag ^ io_reExecuteQuery_1_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  s3_schedError_compare_1 = s3_loadOutBits_uop_robIdx_value > io_reExecuteQuery_1_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _s3_schedError_T_9 = s3_schedError_differentFlag_1 ^ s3_schedError_compare_1; // @[CircularQueuePtr.scala 88:19]
  wire  _s3_schedError_T_10 = io_reExecuteQuery_1_valid & _s3_schedError_T_9; // @[LoadUnit.scala 1173:32]
  wire  _s3_schedError_T_13 = s3_loadOutBits_paddr[35:3] == io_reExecuteQuery_1_bits_paddr[35:3]; // @[LoadUnit.scala 1175:42]
  wire  _s3_schedError_T_14 = _s3_schedError_T_10 & _s3_schedError_T_13; // @[LoadUnit.scala 1174:74]
  wire [15:0] _s3_schedError_T_15 = s3_loadOutBits_mask & io_reExecuteQuery_1_bits_mask; // @[LoadUnit.scala 1176:26]
  wire  _s3_schedError_T_16 = |_s3_schedError_T_15; // @[LoadUnit.scala 1176:60]
  wire  _s3_schedError_T_17 = _s3_schedError_T_14 & _s3_schedError_T_16; // @[LoadUnit.scala 1175:95]
  wire [1:0] _s3_schedError_T_18 = {_s3_schedError_T_17,_s3_schedError_T_8}; // @[LoadUnit.scala 1176:66]
  wire  _s3_schedError_T_20 = ~s3_loadOutBits_tlbMiss; // @[LoadUnit.scala 1176:80]
  wire  s3_schedError = |_s3_schedError_T_18 & ~s3_loadOutBits_tlbMiss; // @[LoadUnit.scala 1176:77]
  wire  s3_replayInst = s3_forwardFail | s3_ldld_replayFromFetch; // @[LoadUnit.scala 1181:38]
  wire  _s3_replayCause_3_T_1 = ~s3_loadOutBits_isPrefetch; // @[LoadUnit.scala 1184:85]
  wire  s3_replayCause_3 = ~io_lsq_loadIn_bits_canAccept & ~s3_loadOutBits_isPrefetch; // @[LoadUnit.scala 1184:82]
  wire  s3_replayCause_2 = (s3_loadOutBits_replayInfo_cause_2 | s3_schedError) & _s3_replayCause_3_T_1; // @[LoadUnit.scala 1185:96]
  wire  s3_replayCause_1 = s3_loadOutBits_replayInfo_cause_1 & _s3_replayCause_3_T_1; // @[LoadUnit.scala 1186:76]
  wire  s3_replayCause_5 = s3_loadOutBits_replayInfo_cause_5 & ~s3_ldld_replayFromFetch; // @[LoadUnit.scala 1189:78]
  wire [7:0] _s3_selReplayCause_T = {s3_loadOutBits_replayInfo_cause_7,s3_loadOutBits_replayInfo_cause_6,
    s3_replayCause_5,s3_loadOutBits_replayInfo_cause_4,s3_replayCause_3,s3_replayCause_2,s3_replayCause_1,
    s3_loadOutBits_replayInfo_cause_0}; // @[LoadUnit.scala 1192:60]
  wire [7:0] _s3_selReplayCause_T_9 = _s3_selReplayCause_T[7] ? 8'h80 : 8'h0; // @[Mux.scala 47:70]
  wire [7:0] _s3_selReplayCause_T_10 = _s3_selReplayCause_T[6] ? 8'h40 : _s3_selReplayCause_T_9; // @[Mux.scala 47:70]
  wire [7:0] _s3_selReplayCause_T_11 = _s3_selReplayCause_T[5] ? 8'h20 : _s3_selReplayCause_T_10; // @[Mux.scala 47:70]
  wire [7:0] _s3_selReplayCause_T_12 = _s3_selReplayCause_T[4] ? 8'h10 : _s3_selReplayCause_T_11; // @[Mux.scala 47:70]
  wire [7:0] _s3_selReplayCause_T_13 = _s3_selReplayCause_T[3] ? 8'h8 : _s3_selReplayCause_T_12; // @[Mux.scala 47:70]
  wire [7:0] _s3_selReplayCause_T_14 = _s3_selReplayCause_T[2] ? 8'h4 : _s3_selReplayCause_T_13; // @[Mux.scala 47:70]
  wire [7:0] _s3_selReplayCause_T_15 = _s3_selReplayCause_T[1] ? 8'h2 : _s3_selReplayCause_T_14; // @[Mux.scala 47:70]
  wire [7:0] s3_selReplayCause = _s3_selReplayCause_T[0] ? 8'h1 : _s3_selReplayCause_T_15; // @[Mux.scala 47:70]
  wire  _s3_forceReplay_T_2 = s3_selReplayCause[3] | s3_selReplayCause[2]; // @[LoadUnit.scala 1194:70]
  wire  _s3_forceReplay_T_4 = _s3_forceReplay_T_2 | s3_selReplayCause[1]; // @[LoadUnit.scala 1195:71]
  wire  s3_forceReplay = _s3_forceReplay_T_4 | s3_selReplayCause[0]; // @[LoadUnit.scala 1196:70]
  wire [15:0] _s3_exception_T = {2'h0,s3_loadOutBits_uop_cf_exceptionVec_13,1'h0,4'h0,2'h0,
    s3_loadOutBits_uop_cf_exceptionVec_5,s3_loadOutBits_uop_cf_exceptionVec_4,4'h0}; // @[LoadUnit.scala 1199:89]
  wire  s3_exception = |_s3_exception_T; // @[LoadUnit.scala 1199:96]
  wire [7:0] _hitLoadOut_valid_T = {io_lsq_loadIn_bits_replayInfo_cause_7,io_lsq_loadIn_bits_replayInfo_cause_6,
    io_lsq_loadIn_bits_replayInfo_cause_5,io_lsq_loadIn_bits_replayInfo_cause_4,io_lsq_loadIn_bits_replayInfo_cause_3,
    io_lsq_loadIn_bits_replayInfo_cause_2,io_lsq_loadIn_bits_replayInfo_cause_1,io_lsq_loadIn_bits_replayInfo_cause_0}; // @[LoadUnit.scala 62:29]
  wire  _hitLoadOut_valid_T_1 = |_hitLoadOut_valid_T; // @[LoadUnit.scala 62:36]
  wire  hitLoadOut_valid = s3_loadOutValid & ~_hitLoadOut_valid_T_1 & ~s3_loadOutBits_mmio; // @[LoadUnit.scala 1209:86]
  wire  hitLoadOut_bits_uop_cf_exceptionVec_4 = s3_forceReplay ? 1'h0 : s3_loadOutBits_uop_cf_exceptionVec_4; // @[LoadUnit.scala 1210:23 1224:25 1225:41]
  wire  hitLoadOut_bits_uop_cf_exceptionVec_5 = s3_forceReplay ? 1'h0 : s3_delayedLoadError & _s3_schedError_T_20 |
    s3_loadOutBits_uop_cf_exceptionVec_5; // @[LoadUnit.scala 1224:25 1225:41 1212:56]
  wire  hitLoadOut_bits_uop_cf_exceptionVec_13 = s3_forceReplay ? 1'h0 : s3_loadOutBits_uop_cf_exceptionVec_13; // @[LoadUnit.scala 1210:23 1224:25 1225:41]
  wire  _s3_rdataSelLQ_T_8 = 3'h0 == io_lsq_ldRawData_addrOffset; // @[LookupTree.scala 24:34]
  wire  _s3_rdataSelLQ_T_9 = 3'h1 == io_lsq_ldRawData_addrOffset; // @[LookupTree.scala 24:34]
  wire  _s3_rdataSelLQ_T_10 = 3'h2 == io_lsq_ldRawData_addrOffset; // @[LookupTree.scala 24:34]
  wire  _s3_rdataSelLQ_T_11 = 3'h3 == io_lsq_ldRawData_addrOffset; // @[LookupTree.scala 24:34]
  wire  _s3_rdataSelLQ_T_12 = 3'h4 == io_lsq_ldRawData_addrOffset; // @[LookupTree.scala 24:34]
  wire  _s3_rdataSelLQ_T_13 = 3'h5 == io_lsq_ldRawData_addrOffset; // @[LookupTree.scala 24:34]
  wire  _s3_rdataSelLQ_T_14 = 3'h6 == io_lsq_ldRawData_addrOffset; // @[LookupTree.scala 24:34]
  wire  _s3_rdataSelLQ_T_15 = 3'h7 == io_lsq_ldRawData_addrOffset; // @[LookupTree.scala 24:34]
  wire [63:0] _s3_rdataSelLQ_T_16 = _s3_rdataSelLQ_T_8 ? io_lsq_ldRawData_lqData : 64'h0; // @[Mux.scala 27:73]
  wire [55:0] _s3_rdataSelLQ_T_17 = _s3_rdataSelLQ_T_9 ? io_lsq_ldRawData_lqData[63:8] : 56'h0; // @[Mux.scala 27:73]
  wire [47:0] _s3_rdataSelLQ_T_18 = _s3_rdataSelLQ_T_10 ? io_lsq_ldRawData_lqData[63:16] : 48'h0; // @[Mux.scala 27:73]
  wire [39:0] _s3_rdataSelLQ_T_19 = _s3_rdataSelLQ_T_11 ? io_lsq_ldRawData_lqData[63:24] : 40'h0; // @[Mux.scala 27:73]
  wire [31:0] _s3_rdataSelLQ_T_20 = _s3_rdataSelLQ_T_12 ? io_lsq_ldRawData_lqData[63:32] : 32'h0; // @[Mux.scala 27:73]
  wire [23:0] _s3_rdataSelLQ_T_21 = _s3_rdataSelLQ_T_13 ? io_lsq_ldRawData_lqData[63:40] : 24'h0; // @[Mux.scala 27:73]
  wire [15:0] _s3_rdataSelLQ_T_22 = _s3_rdataSelLQ_T_14 ? io_lsq_ldRawData_lqData[63:48] : 16'h0; // @[Mux.scala 27:73]
  wire [7:0] _s3_rdataSelLQ_T_23 = _s3_rdataSelLQ_T_15 ? io_lsq_ldRawData_lqData[63:56] : 8'h0; // @[Mux.scala 27:73]
  wire [63:0] _GEN_789 = {{8'd0}, _s3_rdataSelLQ_T_17}; // @[Mux.scala 27:73]
  wire [63:0] _s3_rdataSelLQ_T_24 = _s3_rdataSelLQ_T_16 | _GEN_789; // @[Mux.scala 27:73]
  wire [63:0] _GEN_790 = {{16'd0}, _s3_rdataSelLQ_T_18}; // @[Mux.scala 27:73]
  wire [63:0] _s3_rdataSelLQ_T_25 = _s3_rdataSelLQ_T_24 | _GEN_790; // @[Mux.scala 27:73]
  wire [63:0] _GEN_791 = {{24'd0}, _s3_rdataSelLQ_T_19}; // @[Mux.scala 27:73]
  wire [63:0] _s3_rdataSelLQ_T_26 = _s3_rdataSelLQ_T_25 | _GEN_791; // @[Mux.scala 27:73]
  wire [63:0] _GEN_792 = {{32'd0}, _s3_rdataSelLQ_T_20}; // @[Mux.scala 27:73]
  wire [63:0] _s3_rdataSelLQ_T_27 = _s3_rdataSelLQ_T_26 | _GEN_792; // @[Mux.scala 27:73]
  wire [63:0] _GEN_793 = {{40'd0}, _s3_rdataSelLQ_T_21}; // @[Mux.scala 27:73]
  wire [63:0] _s3_rdataSelLQ_T_28 = _s3_rdataSelLQ_T_27 | _GEN_793; // @[Mux.scala 27:73]
  wire [63:0] _GEN_794 = {{48'd0}, _s3_rdataSelLQ_T_22}; // @[Mux.scala 27:73]
  wire [63:0] _s3_rdataSelLQ_T_29 = _s3_rdataSelLQ_T_28 | _GEN_794; // @[Mux.scala 27:73]
  wire [63:0] _GEN_795 = {{56'd0}, _s3_rdataSelLQ_T_23}; // @[Mux.scala 27:73]
  wire [63:0] s3_rdataSelLQ = _s3_rdataSelLQ_T_29 | _GEN_795; // @[Mux.scala 27:73]
  wire  s3_rdataPartialLoadLQ_signBit = s3_rdataSelLQ[7]; // @[BitUtils.scala 80:20]
  wire [55:0] _s3_rdataPartialLoadLQ_T_2 = s3_rdataPartialLoadLQ_signBit ? 56'hffffffffffffff : 56'h0; // @[Bitwise.scala 74:12]
  wire [63:0] _s3_rdataPartialLoadLQ_T_3 = {_s3_rdataPartialLoadLQ_T_2,s3_rdataSelLQ[7:0]}; // @[Cat.scala 31:58]
  wire  s3_rdataPartialLoadLQ_signBit_1 = s3_rdataSelLQ[15]; // @[BitUtils.scala 80:20]
  wire [47:0] _s3_rdataPartialLoadLQ_T_6 = s3_rdataPartialLoadLQ_signBit_1 ? 48'hffffffffffff : 48'h0; // @[Bitwise.scala 74:12]
  wire [63:0] _s3_rdataPartialLoadLQ_T_7 = {_s3_rdataPartialLoadLQ_T_6,s3_rdataSelLQ[15:0]}; // @[Cat.scala 31:58]
  wire [63:0] _s3_rdataPartialLoadLQ_T_11 = {32'hffffffff,s3_rdataSelLQ[31:0]}; // @[Cat.scala 31:58]
  wire  s3_rdataPartialLoadLQ_signBit_2 = s3_rdataSelLQ[31]; // @[BitUtils.scala 80:20]
  wire [31:0] _s3_rdataPartialLoadLQ_T_15 = s3_rdataPartialLoadLQ_signBit_2 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 74:12]
  wire [63:0] _s3_rdataPartialLoadLQ_T_16 = {_s3_rdataPartialLoadLQ_T_15,s3_rdataSelLQ[31:0]}; // @[Cat.scala 31:58]
  wire [63:0] _s3_rdataPartialLoadLQ_T_17 = io_lsq_ldRawData_uop_ctrl_fpWen ? _s3_rdataPartialLoadLQ_T_11 :
    _s3_rdataPartialLoadLQ_T_16; // @[LoadQueue.scala 59:28]
  wire [63:0] _s3_rdataPartialLoadLQ_T_27 = {56'h0,s3_rdataSelLQ[7:0]}; // @[Cat.scala 31:58]
  wire [63:0] _s3_rdataPartialLoadLQ_T_29 = {48'h0,s3_rdataSelLQ[15:0]}; // @[Cat.scala 31:58]
  wire [63:0] _s3_rdataPartialLoadLQ_T_31 = {32'h0,s3_rdataSelLQ[31:0]}; // @[Cat.scala 31:58]
  wire  _s3_rdataPartialLoadLQ_T_32 = 7'h0 == io_lsq_ldRawData_uop_ctrl_fuOpType; // @[LookupTree.scala 24:34]
  wire  _s3_rdataPartialLoadLQ_T_33 = 7'h1 == io_lsq_ldRawData_uop_ctrl_fuOpType; // @[LookupTree.scala 24:34]
  wire  _s3_rdataPartialLoadLQ_T_34 = 7'h2 == io_lsq_ldRawData_uop_ctrl_fuOpType; // @[LookupTree.scala 24:34]
  wire  _s3_rdataPartialLoadLQ_T_35 = 7'h3 == io_lsq_ldRawData_uop_ctrl_fuOpType; // @[LookupTree.scala 24:34]
  wire  _s3_rdataPartialLoadLQ_T_36 = 7'h4 == io_lsq_ldRawData_uop_ctrl_fuOpType; // @[LookupTree.scala 24:34]
  wire  _s3_rdataPartialLoadLQ_T_37 = 7'h5 == io_lsq_ldRawData_uop_ctrl_fuOpType; // @[LookupTree.scala 24:34]
  wire  _s3_rdataPartialLoadLQ_T_38 = 7'h6 == io_lsq_ldRawData_uop_ctrl_fuOpType; // @[LookupTree.scala 24:34]
  wire [63:0] _s3_rdataPartialLoadLQ_T_39 = _s3_rdataPartialLoadLQ_T_32 ? _s3_rdataPartialLoadLQ_T_3 : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _s3_rdataPartialLoadLQ_T_40 = _s3_rdataPartialLoadLQ_T_33 ? _s3_rdataPartialLoadLQ_T_7 : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _s3_rdataPartialLoadLQ_T_41 = _s3_rdataPartialLoadLQ_T_34 ? _s3_rdataPartialLoadLQ_T_17 : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _s3_rdataPartialLoadLQ_T_42 = _s3_rdataPartialLoadLQ_T_35 ? s3_rdataSelLQ : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _s3_rdataPartialLoadLQ_T_43 = _s3_rdataPartialLoadLQ_T_36 ? _s3_rdataPartialLoadLQ_T_27 : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _s3_rdataPartialLoadLQ_T_44 = _s3_rdataPartialLoadLQ_T_37 ? _s3_rdataPartialLoadLQ_T_29 : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _s3_rdataPartialLoadLQ_T_45 = _s3_rdataPartialLoadLQ_T_38 ? _s3_rdataPartialLoadLQ_T_31 : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _s3_rdataPartialLoadLQ_T_46 = _s3_rdataPartialLoadLQ_T_39 | _s3_rdataPartialLoadLQ_T_40; // @[Mux.scala 27:73]
  wire [63:0] _s3_rdataPartialLoadLQ_T_47 = _s3_rdataPartialLoadLQ_T_46 | _s3_rdataPartialLoadLQ_T_41; // @[Mux.scala 27:73]
  wire [63:0] _s3_rdataPartialLoadLQ_T_48 = _s3_rdataPartialLoadLQ_T_47 | _s3_rdataPartialLoadLQ_T_42; // @[Mux.scala 27:73]
  wire [63:0] _s3_rdataPartialLoadLQ_T_49 = _s3_rdataPartialLoadLQ_T_48 | _s3_rdataPartialLoadLQ_T_43; // @[Mux.scala 27:73]
  wire [63:0] _s3_rdataPartialLoadLQ_T_50 = _s3_rdataPartialLoadLQ_T_49 | _s3_rdataPartialLoadLQ_T_44; // @[Mux.scala 27:73]
  wire [63:0] s3_rdataPartialLoadLQ = _s3_rdataPartialLoadLQ_T_50 | _s3_rdataPartialLoadLQ_T_45; // @[Mux.scala 27:73]
  wire  s3_rdataDcache_rdataVec_use_D = load_s2_io_loadDataFromDcache_forward_D &
    load_s2_io_loadDataFromDcache_forward_result_valid; // @[MemCommon.scala 343:27]
  wire  s3_rdataDcache_rdataVec_use_mshr = load_s2_io_loadDataFromDcache_forward_mshr &
    load_s2_io_loadDataFromDcache_forward_result_valid; // @[MemCommon.scala 344:33]
  wire [63:0] s3_rdataDcache_rdataVec_lo = {load_s2_io_loadDataFromDcache_forwardData_D_7,
    load_s2_io_loadDataFromDcache_forwardData_D_6,load_s2_io_loadDataFromDcache_forwardData_D_5,
    load_s2_io_loadDataFromDcache_forwardData_D_4,load_s2_io_loadDataFromDcache_forwardData_D_3,
    load_s2_io_loadDataFromDcache_forwardData_D_2,load_s2_io_loadDataFromDcache_forwardData_D_1,
    load_s2_io_loadDataFromDcache_forwardData_D_0}; // @[MemCommon.scala 345:30]
  wire [127:0] _s3_rdataDcache_rdataVec_T = {load_s2_io_loadDataFromDcache_forwardData_D_15,
    load_s2_io_loadDataFromDcache_forwardData_D_14,load_s2_io_loadDataFromDcache_forwardData_D_13,
    load_s2_io_loadDataFromDcache_forwardData_D_12,load_s2_io_loadDataFromDcache_forwardData_D_11,
    load_s2_io_loadDataFromDcache_forwardData_D_10,load_s2_io_loadDataFromDcache_forwardData_D_9,
    load_s2_io_loadDataFromDcache_forwardData_D_8,s3_rdataDcache_rdataVec_lo}; // @[MemCommon.scala 345:30]
  wire [63:0] s3_rdataDcache_rdataVec_lo_1 = {load_s2_io_loadDataFromDcache_forwardData_mshr_7,
    load_s2_io_loadDataFromDcache_forwardData_mshr_6,load_s2_io_loadDataFromDcache_forwardData_mshr_5,
    load_s2_io_loadDataFromDcache_forwardData_mshr_4,load_s2_io_loadDataFromDcache_forwardData_mshr_3,
    load_s2_io_loadDataFromDcache_forwardData_mshr_2,load_s2_io_loadDataFromDcache_forwardData_mshr_1,
    load_s2_io_loadDataFromDcache_forwardData_mshr_0}; // @[MemCommon.scala 345:69]
  wire [127:0] _s3_rdataDcache_rdataVec_T_1 = {load_s2_io_loadDataFromDcache_forwardData_mshr_15,
    load_s2_io_loadDataFromDcache_forwardData_mshr_14,load_s2_io_loadDataFromDcache_forwardData_mshr_13,
    load_s2_io_loadDataFromDcache_forwardData_mshr_12,load_s2_io_loadDataFromDcache_forwardData_mshr_11,
    load_s2_io_loadDataFromDcache_forwardData_mshr_10,load_s2_io_loadDataFromDcache_forwardData_mshr_9,
    load_s2_io_loadDataFromDcache_forwardData_mshr_8,s3_rdataDcache_rdataVec_lo_1}; // @[MemCommon.scala 345:69]
  wire [127:0] _s3_rdataDcache_rdataVec_T_2 = s3_rdataDcache_rdataVec_use_mshr ? _s3_rdataDcache_rdataVec_T_1 :
    load_s2_io_loadDataFromDcache_respDcacheData; // @[MemCommon.scala 345:41]
  wire [127:0] _s3_rdataDcache_rdataVec_T_3 = s3_rdataDcache_rdataVec_use_D ? _s3_rdataDcache_rdataVec_T :
    _s3_rdataDcache_rdataVec_T_2; // @[MemCommon.scala 345:8]
  wire [7:0] s3_rdataDcache_rdataVec_0 = load_s2_io_loadDataFromDcache_forwardMask_0 ?
    load_s2_io_loadDataFromDcache_forwardData_0 : _s3_rdataDcache_rdataVec_T_3[7:0]; // @[MemCommon.scala 350:10]
  wire [7:0] s3_rdataDcache_rdataVec_1 = load_s2_io_loadDataFromDcache_forwardMask_1 ?
    load_s2_io_loadDataFromDcache_forwardData_1 : _s3_rdataDcache_rdataVec_T_3[15:8]; // @[MemCommon.scala 350:10]
  wire [7:0] s3_rdataDcache_rdataVec_2 = load_s2_io_loadDataFromDcache_forwardMask_2 ?
    load_s2_io_loadDataFromDcache_forwardData_2 : _s3_rdataDcache_rdataVec_T_3[23:16]; // @[MemCommon.scala 350:10]
  wire [7:0] s3_rdataDcache_rdataVec_3 = load_s2_io_loadDataFromDcache_forwardMask_3 ?
    load_s2_io_loadDataFromDcache_forwardData_3 : _s3_rdataDcache_rdataVec_T_3[31:24]; // @[MemCommon.scala 350:10]
  wire [7:0] s3_rdataDcache_rdataVec_4 = load_s2_io_loadDataFromDcache_forwardMask_4 ?
    load_s2_io_loadDataFromDcache_forwardData_4 : _s3_rdataDcache_rdataVec_T_3[39:32]; // @[MemCommon.scala 350:10]
  wire [7:0] s3_rdataDcache_rdataVec_5 = load_s2_io_loadDataFromDcache_forwardMask_5 ?
    load_s2_io_loadDataFromDcache_forwardData_5 : _s3_rdataDcache_rdataVec_T_3[47:40]; // @[MemCommon.scala 350:10]
  wire [7:0] s3_rdataDcache_rdataVec_6 = load_s2_io_loadDataFromDcache_forwardMask_6 ?
    load_s2_io_loadDataFromDcache_forwardData_6 : _s3_rdataDcache_rdataVec_T_3[55:48]; // @[MemCommon.scala 350:10]
  wire [7:0] s3_rdataDcache_rdataVec_7 = load_s2_io_loadDataFromDcache_forwardMask_7 ?
    load_s2_io_loadDataFromDcache_forwardData_7 : _s3_rdataDcache_rdataVec_T_3[63:56]; // @[MemCommon.scala 350:10]
  wire [7:0] s3_rdataDcache_rdataVec_8 = load_s2_io_loadDataFromDcache_forwardMask_8 ?
    load_s2_io_loadDataFromDcache_forwardData_8 : _s3_rdataDcache_rdataVec_T_3[71:64]; // @[MemCommon.scala 350:10]
  wire [7:0] s3_rdataDcache_rdataVec_9 = load_s2_io_loadDataFromDcache_forwardMask_9 ?
    load_s2_io_loadDataFromDcache_forwardData_9 : _s3_rdataDcache_rdataVec_T_3[79:72]; // @[MemCommon.scala 350:10]
  wire [7:0] s3_rdataDcache_rdataVec_10 = load_s2_io_loadDataFromDcache_forwardMask_10 ?
    load_s2_io_loadDataFromDcache_forwardData_10 : _s3_rdataDcache_rdataVec_T_3[87:80]; // @[MemCommon.scala 350:10]
  wire [7:0] s3_rdataDcache_rdataVec_11 = load_s2_io_loadDataFromDcache_forwardMask_11 ?
    load_s2_io_loadDataFromDcache_forwardData_11 : _s3_rdataDcache_rdataVec_T_3[95:88]; // @[MemCommon.scala 350:10]
  wire [7:0] s3_rdataDcache_rdataVec_12 = load_s2_io_loadDataFromDcache_forwardMask_12 ?
    load_s2_io_loadDataFromDcache_forwardData_12 : _s3_rdataDcache_rdataVec_T_3[103:96]; // @[MemCommon.scala 350:10]
  wire [7:0] s3_rdataDcache_rdataVec_13 = load_s2_io_loadDataFromDcache_forwardMask_13 ?
    load_s2_io_loadDataFromDcache_forwardData_13 : _s3_rdataDcache_rdataVec_T_3[111:104]; // @[MemCommon.scala 350:10]
  wire [7:0] s3_rdataDcache_rdataVec_14 = load_s2_io_loadDataFromDcache_forwardMask_14 ?
    load_s2_io_loadDataFromDcache_forwardData_14 : _s3_rdataDcache_rdataVec_T_3[119:112]; // @[MemCommon.scala 350:10]
  wire [7:0] s3_rdataDcache_rdataVec_15 = load_s2_io_loadDataFromDcache_forwardMask_15 ?
    load_s2_io_loadDataFromDcache_forwardData_15 : _s3_rdataDcache_rdataVec_T_3[127:120]; // @[MemCommon.scala 350:10]
  wire [63:0] s3_rdataDcache_lo = {s3_rdataDcache_rdataVec_7,s3_rdataDcache_rdataVec_6,s3_rdataDcache_rdataVec_5,
    s3_rdataDcache_rdataVec_4,s3_rdataDcache_rdataVec_3,s3_rdataDcache_rdataVec_2,s3_rdataDcache_rdataVec_1,
    s3_rdataDcache_rdataVec_0}; // @[MemCommon.scala 352:14]
  wire [127:0] s3_rdataDcache = {s3_rdataDcache_rdataVec_15,s3_rdataDcache_rdataVec_14,s3_rdataDcache_rdataVec_13,
    s3_rdataDcache_rdataVec_12,s3_rdataDcache_rdataVec_11,s3_rdataDcache_rdataVec_10,s3_rdataDcache_rdataVec_9,
    s3_rdataDcache_rdataVec_8,s3_rdataDcache_lo}; // @[MemCommon.scala 352:14]
  wire  _s3_rdataSelDcache_T_16 = 4'h0 == load_s2_io_loadDataFromDcache_addrOffset; // @[LookupTree.scala 24:34]
  wire  _s3_rdataSelDcache_T_17 = 4'h1 == load_s2_io_loadDataFromDcache_addrOffset; // @[LookupTree.scala 24:34]
  wire  _s3_rdataSelDcache_T_18 = 4'h2 == load_s2_io_loadDataFromDcache_addrOffset; // @[LookupTree.scala 24:34]
  wire  _s3_rdataSelDcache_T_19 = 4'h3 == load_s2_io_loadDataFromDcache_addrOffset; // @[LookupTree.scala 24:34]
  wire  _s3_rdataSelDcache_T_20 = 4'h4 == load_s2_io_loadDataFromDcache_addrOffset; // @[LookupTree.scala 24:34]
  wire  _s3_rdataSelDcache_T_21 = 4'h5 == load_s2_io_loadDataFromDcache_addrOffset; // @[LookupTree.scala 24:34]
  wire  _s3_rdataSelDcache_T_22 = 4'h6 == load_s2_io_loadDataFromDcache_addrOffset; // @[LookupTree.scala 24:34]
  wire  _s3_rdataSelDcache_T_23 = 4'h7 == load_s2_io_loadDataFromDcache_addrOffset; // @[LookupTree.scala 24:34]
  wire  _s3_rdataSelDcache_T_24 = 4'h8 == load_s2_io_loadDataFromDcache_addrOffset; // @[LookupTree.scala 24:34]
  wire  _s3_rdataSelDcache_T_25 = 4'h9 == load_s2_io_loadDataFromDcache_addrOffset; // @[LookupTree.scala 24:34]
  wire  _s3_rdataSelDcache_T_26 = 4'ha == load_s2_io_loadDataFromDcache_addrOffset; // @[LookupTree.scala 24:34]
  wire  _s3_rdataSelDcache_T_27 = 4'hb == load_s2_io_loadDataFromDcache_addrOffset; // @[LookupTree.scala 24:34]
  wire  _s3_rdataSelDcache_T_28 = 4'hc == load_s2_io_loadDataFromDcache_addrOffset; // @[LookupTree.scala 24:34]
  wire  _s3_rdataSelDcache_T_29 = 4'hd == load_s2_io_loadDataFromDcache_addrOffset; // @[LookupTree.scala 24:34]
  wire  _s3_rdataSelDcache_T_30 = 4'he == load_s2_io_loadDataFromDcache_addrOffset; // @[LookupTree.scala 24:34]
  wire  _s3_rdataSelDcache_T_31 = 4'hf == load_s2_io_loadDataFromDcache_addrOffset; // @[LookupTree.scala 24:34]
  wire [63:0] _s3_rdataSelDcache_T_32 = _s3_rdataSelDcache_T_16 ? s3_rdataDcache[63:0] : 64'h0; // @[Mux.scala 27:73]
  wire [55:0] _s3_rdataSelDcache_T_33 = _s3_rdataSelDcache_T_17 ? s3_rdataDcache[63:8] : 56'h0; // @[Mux.scala 27:73]
  wire [47:0] _s3_rdataSelDcache_T_34 = _s3_rdataSelDcache_T_18 ? s3_rdataDcache[63:16] : 48'h0; // @[Mux.scala 27:73]
  wire [39:0] _s3_rdataSelDcache_T_35 = _s3_rdataSelDcache_T_19 ? s3_rdataDcache[63:24] : 40'h0; // @[Mux.scala 27:73]
  wire [31:0] _s3_rdataSelDcache_T_36 = _s3_rdataSelDcache_T_20 ? s3_rdataDcache[63:32] : 32'h0; // @[Mux.scala 27:73]
  wire [23:0] _s3_rdataSelDcache_T_37 = _s3_rdataSelDcache_T_21 ? s3_rdataDcache[63:40] : 24'h0; // @[Mux.scala 27:73]
  wire [15:0] _s3_rdataSelDcache_T_38 = _s3_rdataSelDcache_T_22 ? s3_rdataDcache[63:48] : 16'h0; // @[Mux.scala 27:73]
  wire [7:0] _s3_rdataSelDcache_T_39 = _s3_rdataSelDcache_T_23 ? s3_rdataDcache[63:56] : 8'h0; // @[Mux.scala 27:73]
  wire [63:0] _s3_rdataSelDcache_T_40 = _s3_rdataSelDcache_T_24 ? s3_rdataDcache[127:64] : 64'h0; // @[Mux.scala 27:73]
  wire [55:0] _s3_rdataSelDcache_T_41 = _s3_rdataSelDcache_T_25 ? s3_rdataDcache[127:72] : 56'h0; // @[Mux.scala 27:73]
  wire [47:0] _s3_rdataSelDcache_T_42 = _s3_rdataSelDcache_T_26 ? s3_rdataDcache[127:80] : 48'h0; // @[Mux.scala 27:73]
  wire [39:0] _s3_rdataSelDcache_T_43 = _s3_rdataSelDcache_T_27 ? s3_rdataDcache[127:88] : 40'h0; // @[Mux.scala 27:73]
  wire [31:0] _s3_rdataSelDcache_T_44 = _s3_rdataSelDcache_T_28 ? s3_rdataDcache[127:96] : 32'h0; // @[Mux.scala 27:73]
  wire [23:0] _s3_rdataSelDcache_T_45 = _s3_rdataSelDcache_T_29 ? s3_rdataDcache[127:104] : 24'h0; // @[Mux.scala 27:73]
  wire [15:0] _s3_rdataSelDcache_T_46 = _s3_rdataSelDcache_T_30 ? s3_rdataDcache[127:112] : 16'h0; // @[Mux.scala 27:73]
  wire [7:0] _s3_rdataSelDcache_T_47 = _s3_rdataSelDcache_T_31 ? s3_rdataDcache[127:120] : 8'h0; // @[Mux.scala 27:73]
  wire [63:0] _GEN_796 = {{8'd0}, _s3_rdataSelDcache_T_33}; // @[Mux.scala 27:73]
  wire [63:0] _s3_rdataSelDcache_T_48 = _s3_rdataSelDcache_T_32 | _GEN_796; // @[Mux.scala 27:73]
  wire [63:0] _GEN_797 = {{16'd0}, _s3_rdataSelDcache_T_34}; // @[Mux.scala 27:73]
  wire [63:0] _s3_rdataSelDcache_T_49 = _s3_rdataSelDcache_T_48 | _GEN_797; // @[Mux.scala 27:73]
  wire [63:0] _GEN_798 = {{24'd0}, _s3_rdataSelDcache_T_35}; // @[Mux.scala 27:73]
  wire [63:0] _s3_rdataSelDcache_T_50 = _s3_rdataSelDcache_T_49 | _GEN_798; // @[Mux.scala 27:73]
  wire [63:0] _GEN_799 = {{32'd0}, _s3_rdataSelDcache_T_36}; // @[Mux.scala 27:73]
  wire [63:0] _s3_rdataSelDcache_T_51 = _s3_rdataSelDcache_T_50 | _GEN_799; // @[Mux.scala 27:73]
  wire [63:0] _GEN_800 = {{40'd0}, _s3_rdataSelDcache_T_37}; // @[Mux.scala 27:73]
  wire [63:0] _s3_rdataSelDcache_T_52 = _s3_rdataSelDcache_T_51 | _GEN_800; // @[Mux.scala 27:73]
  wire [63:0] _GEN_801 = {{48'd0}, _s3_rdataSelDcache_T_38}; // @[Mux.scala 27:73]
  wire [63:0] _s3_rdataSelDcache_T_53 = _s3_rdataSelDcache_T_52 | _GEN_801; // @[Mux.scala 27:73]
  wire [63:0] _GEN_802 = {{56'd0}, _s3_rdataSelDcache_T_39}; // @[Mux.scala 27:73]
  wire [63:0] _s3_rdataSelDcache_T_54 = _s3_rdataSelDcache_T_53 | _GEN_802; // @[Mux.scala 27:73]
  wire [63:0] _s3_rdataSelDcache_T_55 = _s3_rdataSelDcache_T_54 | _s3_rdataSelDcache_T_40; // @[Mux.scala 27:73]
  wire [63:0] _GEN_803 = {{8'd0}, _s3_rdataSelDcache_T_41}; // @[Mux.scala 27:73]
  wire [63:0] _s3_rdataSelDcache_T_56 = _s3_rdataSelDcache_T_55 | _GEN_803; // @[Mux.scala 27:73]
  wire [63:0] _GEN_804 = {{16'd0}, _s3_rdataSelDcache_T_42}; // @[Mux.scala 27:73]
  wire [63:0] _s3_rdataSelDcache_T_57 = _s3_rdataSelDcache_T_56 | _GEN_804; // @[Mux.scala 27:73]
  wire [63:0] _GEN_805 = {{24'd0}, _s3_rdataSelDcache_T_43}; // @[Mux.scala 27:73]
  wire [63:0] _s3_rdataSelDcache_T_58 = _s3_rdataSelDcache_T_57 | _GEN_805; // @[Mux.scala 27:73]
  wire [63:0] _GEN_806 = {{32'd0}, _s3_rdataSelDcache_T_44}; // @[Mux.scala 27:73]
  wire [63:0] _s3_rdataSelDcache_T_59 = _s3_rdataSelDcache_T_58 | _GEN_806; // @[Mux.scala 27:73]
  wire [63:0] _GEN_807 = {{40'd0}, _s3_rdataSelDcache_T_45}; // @[Mux.scala 27:73]
  wire [63:0] _s3_rdataSelDcache_T_60 = _s3_rdataSelDcache_T_59 | _GEN_807; // @[Mux.scala 27:73]
  wire [63:0] _GEN_808 = {{48'd0}, _s3_rdataSelDcache_T_46}; // @[Mux.scala 27:73]
  wire [63:0] _s3_rdataSelDcache_T_61 = _s3_rdataSelDcache_T_60 | _GEN_808; // @[Mux.scala 27:73]
  wire [63:0] _GEN_809 = {{56'd0}, _s3_rdataSelDcache_T_47}; // @[Mux.scala 27:73]
  wire [63:0] s3_rdataSelDcache = _s3_rdataSelDcache_T_61 | _GEN_809; // @[Mux.scala 27:73]
  wire  s3_rdataPartialLoadDcache_signBit = s3_rdataSelDcache[7]; // @[BitUtils.scala 80:20]
  wire [55:0] _s3_rdataPartialLoadDcache_T_2 = s3_rdataPartialLoadDcache_signBit ? 56'hffffffffffffff : 56'h0; // @[Bitwise.scala 74:12]
  wire [63:0] _s3_rdataPartialLoadDcache_T_3 = {_s3_rdataPartialLoadDcache_T_2,s3_rdataSelDcache[7:0]}; // @[Cat.scala 31:58]
  wire  s3_rdataPartialLoadDcache_signBit_1 = s3_rdataSelDcache[15]; // @[BitUtils.scala 80:20]
  wire [47:0] _s3_rdataPartialLoadDcache_T_6 = s3_rdataPartialLoadDcache_signBit_1 ? 48'hffffffffffff : 48'h0; // @[Bitwise.scala 74:12]
  wire [63:0] _s3_rdataPartialLoadDcache_T_7 = {_s3_rdataPartialLoadDcache_T_6,s3_rdataSelDcache[15:0]}; // @[Cat.scala 31:58]
  wire [63:0] _s3_rdataPartialLoadDcache_T_11 = {32'hffffffff,s3_rdataSelDcache[31:0]}; // @[Cat.scala 31:58]
  wire  s3_rdataPartialLoadDcache_signBit_2 = s3_rdataSelDcache[31]; // @[BitUtils.scala 80:20]
  wire [31:0] _s3_rdataPartialLoadDcache_T_15 = s3_rdataPartialLoadDcache_signBit_2 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 74:12]
  wire [63:0] _s3_rdataPartialLoadDcache_T_16 = {_s3_rdataPartialLoadDcache_T_15,s3_rdataSelDcache[31:0]}; // @[Cat.scala 31:58]
  wire [63:0] _s3_rdataPartialLoadDcache_T_17 = load_s2_io_loadDataFromDcache_uop_ctrl_fpWen ?
    _s3_rdataPartialLoadDcache_T_11 : _s3_rdataPartialLoadDcache_T_16; // @[LoadQueue.scala 59:28]
  wire [63:0] _s3_rdataPartialLoadDcache_T_27 = {56'h0,s3_rdataSelDcache[7:0]}; // @[Cat.scala 31:58]
  wire [63:0] _s3_rdataPartialLoadDcache_T_29 = {48'h0,s3_rdataSelDcache[15:0]}; // @[Cat.scala 31:58]
  wire [63:0] _s3_rdataPartialLoadDcache_T_31 = {32'h0,s3_rdataSelDcache[31:0]}; // @[Cat.scala 31:58]
  wire  _s3_rdataPartialLoadDcache_T_32 = 7'h0 == load_s2_io_loadDataFromDcache_uop_ctrl_fuOpType; // @[LookupTree.scala 24:34]
  wire  _s3_rdataPartialLoadDcache_T_33 = 7'h1 == load_s2_io_loadDataFromDcache_uop_ctrl_fuOpType; // @[LookupTree.scala 24:34]
  wire  _s3_rdataPartialLoadDcache_T_34 = 7'h2 == load_s2_io_loadDataFromDcache_uop_ctrl_fuOpType; // @[LookupTree.scala 24:34]
  wire  _s3_rdataPartialLoadDcache_T_35 = 7'h3 == load_s2_io_loadDataFromDcache_uop_ctrl_fuOpType; // @[LookupTree.scala 24:34]
  wire  _s3_rdataPartialLoadDcache_T_36 = 7'h4 == load_s2_io_loadDataFromDcache_uop_ctrl_fuOpType; // @[LookupTree.scala 24:34]
  wire  _s3_rdataPartialLoadDcache_T_37 = 7'h5 == load_s2_io_loadDataFromDcache_uop_ctrl_fuOpType; // @[LookupTree.scala 24:34]
  wire  _s3_rdataPartialLoadDcache_T_38 = 7'h6 == load_s2_io_loadDataFromDcache_uop_ctrl_fuOpType; // @[LookupTree.scala 24:34]
  wire [63:0] _s3_rdataPartialLoadDcache_T_39 = _s3_rdataPartialLoadDcache_T_32 ? _s3_rdataPartialLoadDcache_T_3 : 64'h0
    ; // @[Mux.scala 27:73]
  wire [63:0] _s3_rdataPartialLoadDcache_T_40 = _s3_rdataPartialLoadDcache_T_33 ? _s3_rdataPartialLoadDcache_T_7 : 64'h0
    ; // @[Mux.scala 27:73]
  wire [63:0] _s3_rdataPartialLoadDcache_T_41 = _s3_rdataPartialLoadDcache_T_34 ? _s3_rdataPartialLoadDcache_T_17 : 64'h0
    ; // @[Mux.scala 27:73]
  wire [63:0] _s3_rdataPartialLoadDcache_T_42 = _s3_rdataPartialLoadDcache_T_35 ? s3_rdataSelDcache : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _s3_rdataPartialLoadDcache_T_43 = _s3_rdataPartialLoadDcache_T_36 ? _s3_rdataPartialLoadDcache_T_27 : 64'h0
    ; // @[Mux.scala 27:73]
  wire [63:0] _s3_rdataPartialLoadDcache_T_44 = _s3_rdataPartialLoadDcache_T_37 ? _s3_rdataPartialLoadDcache_T_29 : 64'h0
    ; // @[Mux.scala 27:73]
  wire [63:0] _s3_rdataPartialLoadDcache_T_45 = _s3_rdataPartialLoadDcache_T_38 ? _s3_rdataPartialLoadDcache_T_31 : 64'h0
    ; // @[Mux.scala 27:73]
  wire [63:0] _s3_rdataPartialLoadDcache_T_46 = _s3_rdataPartialLoadDcache_T_39 | _s3_rdataPartialLoadDcache_T_40; // @[Mux.scala 27:73]
  wire [63:0] _s3_rdataPartialLoadDcache_T_47 = _s3_rdataPartialLoadDcache_T_46 | _s3_rdataPartialLoadDcache_T_41; // @[Mux.scala 27:73]
  wire [63:0] _s3_rdataPartialLoadDcache_T_48 = _s3_rdataPartialLoadDcache_T_47 | _s3_rdataPartialLoadDcache_T_42; // @[Mux.scala 27:73]
  wire [63:0] _s3_rdataPartialLoadDcache_T_49 = _s3_rdataPartialLoadDcache_T_48 | _s3_rdataPartialLoadDcache_T_43; // @[Mux.scala 27:73]
  wire [63:0] _s3_rdataPartialLoadDcache_T_50 = _s3_rdataPartialLoadDcache_T_49 | _s3_rdataPartialLoadDcache_T_44; // @[Mux.scala 27:73]
  wire [63:0] s3_rdataPartialLoadDcache = _s3_rdataPartialLoadDcache_T_50 | _s3_rdataPartialLoadDcache_T_45; // @[Mux.scala 27:73]
  wire [5:0] _io_loadOut_valid_flushItself_T_1 = {io_lsq_loadOut_bits_uop_robIdx_flag,
    io_lsq_loadOut_bits_uop_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _io_loadOut_valid_flushItself_T_3 = _io_loadOut_valid_flushItself_T_1 == _s1_data_flushItself_T_2; // @[CircularQueuePtr.scala 61:52]
  wire  io_loadOut_valid_flushItself = io_redirect_bits_level & _io_loadOut_valid_flushItself_T_3; // @[Rob.scala 122:51]
  wire  io_loadOut_valid_differentFlag = io_lsq_loadOut_bits_uop_robIdx_flag ^ io_redirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  io_loadOut_valid_compare = io_lsq_loadOut_bits_uop_robIdx_value > io_redirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _io_loadOut_valid_T = io_loadOut_valid_differentFlag ^ io_loadOut_valid_compare; // @[CircularQueuePtr.scala 88:19]
  wire  _io_loadOut_valid_T_2 = io_redirect_valid & (io_loadOut_valid_flushItself | _io_loadOut_valid_T); // @[Rob.scala 123:20]
  wire  _io_loadOut_valid_T_6 = io_lsq_loadOut_valid & ~_io_loadOut_valid_T_2 & ~hitLoadOut_valid; // @[LoadUnit.scala 1274:100]
  wire  _io_loadOut_valid_T_7 = hitLoadOut_valid | _io_loadOut_valid_T_6; // @[LoadUnit.scala 1273:42]
  wire  _io_loadOut_valid_T_8 = ~load_s2_io_out_bits_vec128bit; // @[LoadUnit.scala 1275:21]
  reg  io_fastpathOut_valid_REG; // @[LoadUnit.scala 1301:34]
  wire [127:0] _io_fastpathOut_data_T_4 = load_s2_io_loadDataFromDcache_addrOffset[3] ? {{64'd0}, s3_rdataDcache[127:64]
    } : s3_rdataDcache; // @[LoadUnit.scala 1302:29]
  reg [63:0] tdata2; // @[LoadUnit.scala 1310:25]
  reg [1:0] matchType; // @[LoadUnit.scala 1311:28]
  reg  tEnable; // @[LoadUnit.scala 1312:26]
  reg [38:0] hitLoadAddrTriggerHitVec_0_REG; // @[LoadUnit.scala 1314:54]
  wire [63:0] _GEN_810 = {{25'd0}, hitLoadAddrTriggerHitVec_0_REG}; // @[Trigger.scala 27:24]
  wire  hitLoadAddrTriggerHitVec_0_equal = _GEN_810 == tdata2; // @[Trigger.scala 27:24]
  wire  hitLoadAddrTriggerHitVec_0_greater = _GEN_810 >= tdata2; // @[Trigger.scala 28:26]
  wire  hitLoadAddrTriggerHitVec_0_less = _GEN_810 <= tdata2; // @[Trigger.scala 29:23]
  wire  _hitLoadAddrTriggerHitVec_0_res_T_3 = 2'h2 == matchType ? hitLoadAddrTriggerHitVec_0_greater : 2'h0 == matchType
     & hitLoadAddrTriggerHitVec_0_equal; // @[Mux.scala 81:58]
  wire  hitLoadAddrTriggerHitVec_0_res = 2'h3 == matchType ? hitLoadAddrTriggerHitVec_0_less :
    _hitLoadAddrTriggerHitVec_0_res_T_3; // @[Mux.scala 81:58]
  wire  hitLoadAddrTriggerHitVec_0 = hitLoadAddrTriggerHitVec_0_res & tEnable; // @[Trigger.scala 34:9]
  reg [63:0] tdata2_1; // @[LoadUnit.scala 1310:25]
  reg [1:0] matchType_1; // @[LoadUnit.scala 1311:28]
  reg  tEnable_1; // @[LoadUnit.scala 1312:26]
  reg [38:0] hitLoadAddrTriggerHitVec_1_REG; // @[LoadUnit.scala 1314:54]
  wire [63:0] _GEN_813 = {{25'd0}, hitLoadAddrTriggerHitVec_1_REG}; // @[Trigger.scala 27:24]
  wire  hitLoadAddrTriggerHitVec_1_equal = _GEN_813 == tdata2_1; // @[Trigger.scala 27:24]
  wire  hitLoadAddrTriggerHitVec_1_greater = _GEN_813 >= tdata2_1; // @[Trigger.scala 28:26]
  wire  hitLoadAddrTriggerHitVec_1_less = _GEN_813 <= tdata2_1; // @[Trigger.scala 29:23]
  wire  _hitLoadAddrTriggerHitVec_1_res_T_3 = 2'h2 == matchType_1 ? hitLoadAddrTriggerHitVec_1_greater : 2'h0 ==
    matchType_1 & hitLoadAddrTriggerHitVec_1_equal; // @[Mux.scala 81:58]
  wire  hitLoadAddrTriggerHitVec_1_res = 2'h3 == matchType_1 ? hitLoadAddrTriggerHitVec_1_less :
    _hitLoadAddrTriggerHitVec_1_res_T_3; // @[Mux.scala 81:58]
  wire  hitLoadAddrTriggerHitVec_1 = hitLoadAddrTriggerHitVec_1_res & tEnable_1; // @[Trigger.scala 34:9]
  reg [63:0] tdata2_2; // @[LoadUnit.scala 1310:25]
  reg [1:0] matchType_2; // @[LoadUnit.scala 1311:28]
  reg  tEnable_2; // @[LoadUnit.scala 1312:26]
  reg [38:0] hitLoadAddrTriggerHitVec_2_REG; // @[LoadUnit.scala 1314:54]
  wire [63:0] _GEN_816 = {{25'd0}, hitLoadAddrTriggerHitVec_2_REG}; // @[Trigger.scala 27:24]
  wire  hitLoadAddrTriggerHitVec_2_equal = _GEN_816 == tdata2_2; // @[Trigger.scala 27:24]
  wire  hitLoadAddrTriggerHitVec_2_greater = _GEN_816 >= tdata2_2; // @[Trigger.scala 28:26]
  wire  hitLoadAddrTriggerHitVec_2_less = _GEN_816 <= tdata2_2; // @[Trigger.scala 29:23]
  wire  _hitLoadAddrTriggerHitVec_2_res_T_3 = 2'h2 == matchType_2 ? hitLoadAddrTriggerHitVec_2_greater : 2'h0 ==
    matchType_2 & hitLoadAddrTriggerHitVec_2_equal; // @[Mux.scala 81:58]
  wire  hitLoadAddrTriggerHitVec_2_res = 2'h3 == matchType_2 ? hitLoadAddrTriggerHitVec_2_less :
    _hitLoadAddrTriggerHitVec_2_res_T_3; // @[Mux.scala 81:58]
  wire  hitLoadAddrTriggerHitVec_2 = hitLoadAddrTriggerHitVec_2_res & tEnable_2; // @[Trigger.scala 34:9]
  wire  _T_72 = load_s1_io_in_valid; // @[Decoupled.scala 50:35]
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
  reg  io_perf_5_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg  io_perf_5_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg  io_perf_6_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg  io_perf_6_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  LoadUnit_S0 load_s0 ( // @[LoadUnit.scala 924:23]
    .io_in_ready(load_s0_io_in_ready),
    .io_in_valid(load_s0_io_in_valid),
    .io_in_bits_uop_cf_foldpc(load_s0_io_in_bits_uop_cf_foldpc),
    .io_in_bits_uop_cf_trigger_backendEn_1(load_s0_io_in_bits_uop_cf_trigger_backendEn_1),
    .io_in_bits_uop_cf_waitForRobIdx_flag(load_s0_io_in_bits_uop_cf_waitForRobIdx_flag),
    .io_in_bits_uop_cf_waitForRobIdx_value(load_s0_io_in_bits_uop_cf_waitForRobIdx_value),
    .io_in_bits_uop_cf_loadWaitBit(load_s0_io_in_bits_uop_cf_loadWaitBit),
    .io_in_bits_uop_cf_loadWaitStrict(load_s0_io_in_bits_uop_cf_loadWaitStrict),
    .io_in_bits_uop_cf_ftqPtr_flag(load_s0_io_in_bits_uop_cf_ftqPtr_flag),
    .io_in_bits_uop_cf_ftqPtr_value(load_s0_io_in_bits_uop_cf_ftqPtr_value),
    .io_in_bits_uop_cf_ftqOffset(load_s0_io_in_bits_uop_cf_ftqOffset),
    .io_in_bits_uop_ctrl_fuType(load_s0_io_in_bits_uop_ctrl_fuType),
    .io_in_bits_uop_ctrl_fuOpType(load_s0_io_in_bits_uop_ctrl_fuOpType),
    .io_in_bits_uop_ctrl_rfWen(load_s0_io_in_bits_uop_ctrl_rfWen),
    .io_in_bits_uop_ctrl_fpWen(load_s0_io_in_bits_uop_ctrl_fpWen),
    .io_in_bits_uop_ctrl_imm(load_s0_io_in_bits_uop_ctrl_imm),
    .io_in_bits_uop_pdest(load_s0_io_in_bits_uop_pdest),
    .io_in_bits_uop_robIdx_flag(load_s0_io_in_bits_uop_robIdx_flag),
    .io_in_bits_uop_robIdx_value(load_s0_io_in_bits_uop_robIdx_value),
    .io_in_bits_uop_lqIdx_flag(load_s0_io_in_bits_uop_lqIdx_flag),
    .io_in_bits_uop_lqIdx_value(load_s0_io_in_bits_uop_lqIdx_value),
    .io_in_bits_uop_sqIdx_flag(load_s0_io_in_bits_uop_sqIdx_flag),
    .io_in_bits_uop_sqIdx_value(load_s0_io_in_bits_uop_sqIdx_value),
    .io_in_bits_src_0(load_s0_io_in_bits_src_0),
    .io_vec_in_ready(load_s0_io_vec_in_ready),
    .io_vec_in_valid(load_s0_io_vec_in_valid),
    .io_vec_in_bits_vaddr(load_s0_io_vec_in_bits_vaddr),
    .io_out_ready(load_s0_io_out_ready),
    .io_out_valid(load_s0_io_out_valid),
    .io_out_bits_uop_cf_foldpc(load_s0_io_out_bits_uop_cf_foldpc),
    .io_out_bits_uop_cf_exceptionVec_4(load_s0_io_out_bits_uop_cf_exceptionVec_4),
    .io_out_bits_uop_cf_trigger_backendEn_1(load_s0_io_out_bits_uop_cf_trigger_backendEn_1),
    .io_out_bits_uop_cf_trigger_backendHit_0(load_s0_io_out_bits_uop_cf_trigger_backendHit_0),
    .io_out_bits_uop_cf_trigger_backendHit_1(load_s0_io_out_bits_uop_cf_trigger_backendHit_1),
    .io_out_bits_uop_cf_trigger_backendHit_4(load_s0_io_out_bits_uop_cf_trigger_backendHit_4),
    .io_out_bits_uop_cf_waitForRobIdx_flag(load_s0_io_out_bits_uop_cf_waitForRobIdx_flag),
    .io_out_bits_uop_cf_waitForRobIdx_value(load_s0_io_out_bits_uop_cf_waitForRobIdx_value),
    .io_out_bits_uop_cf_loadWaitBit(load_s0_io_out_bits_uop_cf_loadWaitBit),
    .io_out_bits_uop_cf_loadWaitStrict(load_s0_io_out_bits_uop_cf_loadWaitStrict),
    .io_out_bits_uop_cf_ftqPtr_flag(load_s0_io_out_bits_uop_cf_ftqPtr_flag),
    .io_out_bits_uop_cf_ftqPtr_value(load_s0_io_out_bits_uop_cf_ftqPtr_value),
    .io_out_bits_uop_cf_ftqOffset(load_s0_io_out_bits_uop_cf_ftqOffset),
    .io_out_bits_uop_ctrl_fuType(load_s0_io_out_bits_uop_ctrl_fuType),
    .io_out_bits_uop_ctrl_fuOpType(load_s0_io_out_bits_uop_ctrl_fuOpType),
    .io_out_bits_uop_ctrl_rfWen(load_s0_io_out_bits_uop_ctrl_rfWen),
    .io_out_bits_uop_ctrl_fpWen(load_s0_io_out_bits_uop_ctrl_fpWen),
    .io_out_bits_uop_pdest(load_s0_io_out_bits_uop_pdest),
    .io_out_bits_uop_robIdx_flag(load_s0_io_out_bits_uop_robIdx_flag),
    .io_out_bits_uop_robIdx_value(load_s0_io_out_bits_uop_robIdx_value),
    .io_out_bits_uop_lqIdx_flag(load_s0_io_out_bits_uop_lqIdx_flag),
    .io_out_bits_uop_lqIdx_value(load_s0_io_out_bits_uop_lqIdx_value),
    .io_out_bits_uop_sqIdx_flag(load_s0_io_out_bits_uop_sqIdx_flag),
    .io_out_bits_uop_sqIdx_value(load_s0_io_out_bits_uop_sqIdx_value),
    .io_out_bits_vaddr(load_s0_io_out_bits_vaddr),
    .io_out_bits_mask(load_s0_io_out_bits_mask),
    .io_out_bits_isPrefetch(load_s0_io_out_bits_isPrefetch),
    .io_out_bits_isHWPrefetch(load_s0_io_out_bits_isHWPrefetch),
    .io_out_bits_vec128bit(load_s0_io_out_bits_vec128bit),
    .io_out_bits_isFirstIssue(load_s0_io_out_bits_isFirstIssue),
    .io_out_bits_mshrid(load_s0_io_out_bits_mshrid),
    .io_out_bits_forward_tlDchannel(load_s0_io_out_bits_forward_tlDchannel),
    .io_out_bits_rarAllocated(load_s0_io_out_bits_rarAllocated),
    .io_out_bits_rarIndex(load_s0_io_out_bits_rarIndex),
    .io_out_bits_rawAllocated(load_s0_io_out_bits_rawAllocated),
    .io_out_bits_rawIndex(load_s0_io_out_bits_rawIndex),
    .io_dtlbReq_valid(load_s0_io_dtlbReq_valid),
    .io_dtlbReq_bits_vaddr(load_s0_io_dtlbReq_bits_vaddr),
    .io_dtlbReq_bits_cmd(load_s0_io_dtlbReq_bits_cmd),
    .io_dtlbReq_bits_no_translate(load_s0_io_dtlbReq_bits_no_translate),
    .io_dcacheReq_ready(load_s0_io_dcacheReq_ready),
    .io_dcacheReq_valid(load_s0_io_dcacheReq_valid),
    .io_dcacheReq_bits_cmd(load_s0_io_dcacheReq_bits_cmd),
    .io_dcacheReq_bits_addr(load_s0_io_dcacheReq_bits_addr),
    .io_dcacheReq_bits_instrtype(load_s0_io_dcacheReq_bits_instrtype),
    .io_dcacheReq_bits_replayCarry_real_way_en(load_s0_io_dcacheReq_bits_replayCarry_real_way_en),
    .io_dcacheReq_bits_replayCarry_valid(load_s0_io_dcacheReq_bits_replayCarry_valid),
    .io_fastpath_data(load_s0_io_fastpath_data),
    .io_fastpath_valid(load_s0_io_fastpath_valid),
    .io_s0_kill(load_s0_io_s0_kill),
    .io_replay_ready(load_s0_io_replay_ready),
    .io_replay_valid(load_s0_io_replay_valid),
    .io_replay_bits_uop_cf_foldpc(load_s0_io_replay_bits_uop_cf_foldpc),
    .io_replay_bits_uop_cf_trigger_backendEn_1(load_s0_io_replay_bits_uop_cf_trigger_backendEn_1),
    .io_replay_bits_uop_cf_trigger_backendHit_0(load_s0_io_replay_bits_uop_cf_trigger_backendHit_0),
    .io_replay_bits_uop_cf_trigger_backendHit_1(load_s0_io_replay_bits_uop_cf_trigger_backendHit_1),
    .io_replay_bits_uop_cf_trigger_backendHit_4(load_s0_io_replay_bits_uop_cf_trigger_backendHit_4),
    .io_replay_bits_uop_cf_waitForRobIdx_flag(load_s0_io_replay_bits_uop_cf_waitForRobIdx_flag),
    .io_replay_bits_uop_cf_waitForRobIdx_value(load_s0_io_replay_bits_uop_cf_waitForRobIdx_value),
    .io_replay_bits_uop_cf_loadWaitBit(load_s0_io_replay_bits_uop_cf_loadWaitBit),
    .io_replay_bits_uop_cf_loadWaitStrict(load_s0_io_replay_bits_uop_cf_loadWaitStrict),
    .io_replay_bits_uop_cf_ftqPtr_flag(load_s0_io_replay_bits_uop_cf_ftqPtr_flag),
    .io_replay_bits_uop_cf_ftqPtr_value(load_s0_io_replay_bits_uop_cf_ftqPtr_value),
    .io_replay_bits_uop_cf_ftqOffset(load_s0_io_replay_bits_uop_cf_ftqOffset),
    .io_replay_bits_uop_ctrl_fuType(load_s0_io_replay_bits_uop_ctrl_fuType),
    .io_replay_bits_uop_ctrl_fuOpType(load_s0_io_replay_bits_uop_ctrl_fuOpType),
    .io_replay_bits_uop_ctrl_rfWen(load_s0_io_replay_bits_uop_ctrl_rfWen),
    .io_replay_bits_uop_ctrl_fpWen(load_s0_io_replay_bits_uop_ctrl_fpWen),
    .io_replay_bits_uop_pdest(load_s0_io_replay_bits_uop_pdest),
    .io_replay_bits_uop_robIdx_flag(load_s0_io_replay_bits_uop_robIdx_flag),
    .io_replay_bits_uop_robIdx_value(load_s0_io_replay_bits_uop_robIdx_value),
    .io_replay_bits_uop_lqIdx_flag(load_s0_io_replay_bits_uop_lqIdx_flag),
    .io_replay_bits_uop_lqIdx_value(load_s0_io_replay_bits_uop_lqIdx_value),
    .io_replay_bits_uop_sqIdx_flag(load_s0_io_replay_bits_uop_sqIdx_flag),
    .io_replay_bits_uop_sqIdx_value(load_s0_io_replay_bits_uop_sqIdx_value),
    .io_replay_bits_vaddr(load_s0_io_replay_bits_vaddr),
    .io_replay_bits_isFirstIssue(load_s0_io_replay_bits_isFirstIssue),
    .io_replay_bits_replayCarry_real_way_en(load_s0_io_replay_bits_replayCarry_real_way_en),
    .io_replay_bits_replayCarry_valid(load_s0_io_replay_bits_replayCarry_valid),
    .io_replay_bits_mshrid(load_s0_io_replay_bits_mshrid),
    .io_replay_bits_forward_tlDchannel(load_s0_io_replay_bits_forward_tlDchannel),
    .io_replay_bits_rarAllocated(load_s0_io_replay_bits_rarAllocated),
    .io_replay_bits_rarIndex(load_s0_io_replay_bits_rarIndex),
    .io_replay_bits_rawAllocated(load_s0_io_replay_bits_rawAllocated),
    .io_replay_bits_rawIndex(load_s0_io_replay_bits_rawIndex),
    .io_s0_sqIdx_value(load_s0_io_s0_sqIdx_value),
    .io_l2lForward_select(load_s0_io_l2lForward_select),
    .io_lqReplayFull(load_s0_io_lqReplayFull)
  );
  LoadUnit_S1 load_s1 ( // @[LoadUnit.scala 925:23]
    .io_in_valid(load_s1_io_in_valid),
    .io_in_bits_uop_cf_foldpc(load_s1_io_in_bits_uop_cf_foldpc),
    .io_in_bits_uop_cf_exceptionVec_4(load_s1_io_in_bits_uop_cf_exceptionVec_4),
    .io_in_bits_uop_cf_trigger_backendEn_1(load_s1_io_in_bits_uop_cf_trigger_backendEn_1),
    .io_in_bits_uop_cf_trigger_backendHit_0(load_s1_io_in_bits_uop_cf_trigger_backendHit_0),
    .io_in_bits_uop_cf_trigger_backendHit_1(load_s1_io_in_bits_uop_cf_trigger_backendHit_1),
    .io_in_bits_uop_cf_trigger_backendHit_4(load_s1_io_in_bits_uop_cf_trigger_backendHit_4),
    .io_in_bits_uop_cf_waitForRobIdx_flag(load_s1_io_in_bits_uop_cf_waitForRobIdx_flag),
    .io_in_bits_uop_cf_waitForRobIdx_value(load_s1_io_in_bits_uop_cf_waitForRobIdx_value),
    .io_in_bits_uop_cf_loadWaitBit(load_s1_io_in_bits_uop_cf_loadWaitBit),
    .io_in_bits_uop_cf_loadWaitStrict(load_s1_io_in_bits_uop_cf_loadWaitStrict),
    .io_in_bits_uop_cf_ftqPtr_flag(load_s1_io_in_bits_uop_cf_ftqPtr_flag),
    .io_in_bits_uop_cf_ftqPtr_value(load_s1_io_in_bits_uop_cf_ftqPtr_value),
    .io_in_bits_uop_cf_ftqOffset(load_s1_io_in_bits_uop_cf_ftqOffset),
    .io_in_bits_uop_ctrl_fuType(load_s1_io_in_bits_uop_ctrl_fuType),
    .io_in_bits_uop_ctrl_fuOpType(load_s1_io_in_bits_uop_ctrl_fuOpType),
    .io_in_bits_uop_ctrl_rfWen(load_s1_io_in_bits_uop_ctrl_rfWen),
    .io_in_bits_uop_ctrl_fpWen(load_s1_io_in_bits_uop_ctrl_fpWen),
    .io_in_bits_uop_pdest(load_s1_io_in_bits_uop_pdest),
    .io_in_bits_uop_robIdx_flag(load_s1_io_in_bits_uop_robIdx_flag),
    .io_in_bits_uop_robIdx_value(load_s1_io_in_bits_uop_robIdx_value),
    .io_in_bits_uop_lqIdx_flag(load_s1_io_in_bits_uop_lqIdx_flag),
    .io_in_bits_uop_lqIdx_value(load_s1_io_in_bits_uop_lqIdx_value),
    .io_in_bits_uop_sqIdx_flag(load_s1_io_in_bits_uop_sqIdx_flag),
    .io_in_bits_uop_sqIdx_value(load_s1_io_in_bits_uop_sqIdx_value),
    .io_in_bits_vaddr(load_s1_io_in_bits_vaddr),
    .io_in_bits_mask(load_s1_io_in_bits_mask),
    .io_in_bits_isPrefetch(load_s1_io_in_bits_isPrefetch),
    .io_in_bits_isHWPrefetch(load_s1_io_in_bits_isHWPrefetch),
    .io_in_bits_vec128bit(load_s1_io_in_bits_vec128bit),
    .io_in_bits_isFirstIssue(load_s1_io_in_bits_isFirstIssue),
    .io_in_bits_mshrid(load_s1_io_in_bits_mshrid),
    .io_in_bits_forward_tlDchannel(load_s1_io_in_bits_forward_tlDchannel),
    .io_in_bits_rarAllocated(load_s1_io_in_bits_rarAllocated),
    .io_in_bits_rarIndex(load_s1_io_in_bits_rarIndex),
    .io_in_bits_rawAllocated(load_s1_io_in_bits_rawAllocated),
    .io_in_bits_rawIndex(load_s1_io_in_bits_rawIndex),
    .io_s1_kill(load_s1_io_s1_kill),
    .io_out_valid(load_s1_io_out_valid),
    .io_out_bits_uop_cf_foldpc(load_s1_io_out_bits_uop_cf_foldpc),
    .io_out_bits_uop_cf_exceptionVec_4(load_s1_io_out_bits_uop_cf_exceptionVec_4),
    .io_out_bits_uop_cf_exceptionVec_5(load_s1_io_out_bits_uop_cf_exceptionVec_5),
    .io_out_bits_uop_cf_exceptionVec_13(load_s1_io_out_bits_uop_cf_exceptionVec_13),
    .io_out_bits_uop_cf_trigger_backendEn_1(load_s1_io_out_bits_uop_cf_trigger_backendEn_1),
    .io_out_bits_uop_cf_trigger_backendHit_0(load_s1_io_out_bits_uop_cf_trigger_backendHit_0),
    .io_out_bits_uop_cf_trigger_backendHit_1(load_s1_io_out_bits_uop_cf_trigger_backendHit_1),
    .io_out_bits_uop_cf_trigger_backendHit_4(load_s1_io_out_bits_uop_cf_trigger_backendHit_4),
    .io_out_bits_uop_cf_waitForRobIdx_flag(load_s1_io_out_bits_uop_cf_waitForRobIdx_flag),
    .io_out_bits_uop_cf_waitForRobIdx_value(load_s1_io_out_bits_uop_cf_waitForRobIdx_value),
    .io_out_bits_uop_cf_loadWaitBit(load_s1_io_out_bits_uop_cf_loadWaitBit),
    .io_out_bits_uop_cf_loadWaitStrict(load_s1_io_out_bits_uop_cf_loadWaitStrict),
    .io_out_bits_uop_cf_ftqPtr_flag(load_s1_io_out_bits_uop_cf_ftqPtr_flag),
    .io_out_bits_uop_cf_ftqPtr_value(load_s1_io_out_bits_uop_cf_ftqPtr_value),
    .io_out_bits_uop_cf_ftqOffset(load_s1_io_out_bits_uop_cf_ftqOffset),
    .io_out_bits_uop_ctrl_fuType(load_s1_io_out_bits_uop_ctrl_fuType),
    .io_out_bits_uop_ctrl_fuOpType(load_s1_io_out_bits_uop_ctrl_fuOpType),
    .io_out_bits_uop_ctrl_rfWen(load_s1_io_out_bits_uop_ctrl_rfWen),
    .io_out_bits_uop_ctrl_fpWen(load_s1_io_out_bits_uop_ctrl_fpWen),
    .io_out_bits_uop_pdest(load_s1_io_out_bits_uop_pdest),
    .io_out_bits_uop_robIdx_flag(load_s1_io_out_bits_uop_robIdx_flag),
    .io_out_bits_uop_robIdx_value(load_s1_io_out_bits_uop_robIdx_value),
    .io_out_bits_uop_lqIdx_flag(load_s1_io_out_bits_uop_lqIdx_flag),
    .io_out_bits_uop_lqIdx_value(load_s1_io_out_bits_uop_lqIdx_value),
    .io_out_bits_uop_sqIdx_flag(load_s1_io_out_bits_uop_sqIdx_flag),
    .io_out_bits_uop_sqIdx_value(load_s1_io_out_bits_uop_sqIdx_value),
    .io_out_bits_vaddr(load_s1_io_out_bits_vaddr),
    .io_out_bits_paddr(load_s1_io_out_bits_paddr),
    .io_out_bits_mask(load_s1_io_out_bits_mask),
    .io_out_bits_tlbMiss(load_s1_io_out_bits_tlbMiss),
    .io_out_bits_isPrefetch(load_s1_io_out_bits_isPrefetch),
    .io_out_bits_isHWPrefetch(load_s1_io_out_bits_isHWPrefetch),
    .io_out_bits_vec128bit(load_s1_io_out_bits_vec128bit),
    .io_out_bits_isFirstIssue(load_s1_io_out_bits_isFirstIssue),
    .io_out_bits_mshrid(load_s1_io_out_bits_mshrid),
    .io_out_bits_forward_tlDchannel(load_s1_io_out_bits_forward_tlDchannel),
    .io_out_bits_rarAllocated(load_s1_io_out_bits_rarAllocated),
    .io_out_bits_rarIndex(load_s1_io_out_bits_rarIndex),
    .io_out_bits_rawAllocated(load_s1_io_out_bits_rawAllocated),
    .io_out_bits_rawIndex(load_s1_io_out_bits_rawIndex),
    .io_out_bits_replayInfo_cause_2(load_s1_io_out_bits_replayInfo_cause_2),
    .io_out_bits_replayInfo_cause_4(load_s1_io_out_bits_replayInfo_cause_4),
    .io_dtlbResp_bits_paddr_0(load_s1_io_dtlbResp_bits_paddr_0),
    .io_dtlbResp_bits_paddr_1(load_s1_io_dtlbResp_bits_paddr_1),
    .io_dtlbResp_bits_miss(load_s1_io_dtlbResp_bits_miss),
    .io_dtlbResp_bits_excp_0_pf_ld(load_s1_io_dtlbResp_bits_excp_0_pf_ld),
    .io_dtlbResp_bits_excp_0_af_ld(load_s1_io_dtlbResp_bits_excp_0_af_ld),
    .io_lsuPAddr(load_s1_io_lsuPAddr),
    .io_dcachePAddr(load_s1_io_dcachePAddr),
    .io_dcacheKill(load_s1_io_dcacheKill),
    .io_dcacheBankConflict(load_s1_io_dcacheBankConflict),
    .io_sbuffer_vaddr(load_s1_io_sbuffer_vaddr),
    .io_sbuffer_paddr(load_s1_io_sbuffer_paddr),
    .io_sbuffer_valid(load_s1_io_sbuffer_valid),
    .io_lsq_vaddr(load_s1_io_lsq_vaddr),
    .io_lsq_paddr(load_s1_io_lsq_paddr),
    .io_lsq_uop_cf_waitForRobIdx_flag(load_s1_io_lsq_uop_cf_waitForRobIdx_flag),
    .io_lsq_uop_cf_waitForRobIdx_value(load_s1_io_lsq_uop_cf_waitForRobIdx_value),
    .io_lsq_uop_sqIdx_flag(load_s1_io_lsq_uop_sqIdx_flag),
    .io_lsq_uop_sqIdx_value(load_s1_io_lsq_uop_sqIdx_value),
    .io_lsq_valid(load_s1_io_lsq_valid),
    .io_lsq_sqIdx_flag(load_s1_io_lsq_sqIdx_flag),
    .io_reExecuteQuery_0_valid(load_s1_io_reExecuteQuery_0_valid),
    .io_reExecuteQuery_0_bits_robIdx_flag(load_s1_io_reExecuteQuery_0_bits_robIdx_flag),
    .io_reExecuteQuery_0_bits_robIdx_value(load_s1_io_reExecuteQuery_0_bits_robIdx_value),
    .io_reExecuteQuery_0_bits_paddr(load_s1_io_reExecuteQuery_0_bits_paddr),
    .io_reExecuteQuery_0_bits_mask(load_s1_io_reExecuteQuery_0_bits_mask),
    .io_reExecuteQuery_1_valid(load_s1_io_reExecuteQuery_1_valid),
    .io_reExecuteQuery_1_bits_robIdx_flag(load_s1_io_reExecuteQuery_1_bits_robIdx_flag),
    .io_reExecuteQuery_1_bits_robIdx_value(load_s1_io_reExecuteQuery_1_bits_robIdx_value),
    .io_reExecuteQuery_1_bits_paddr(load_s1_io_reExecuteQuery_1_bits_paddr),
    .io_reExecuteQuery_1_bits_mask(load_s1_io_reExecuteQuery_1_bits_mask),
    .io_correctTableQueryReq_addr(load_s1_io_correctTableQueryReq_addr)
  );
  LoadUnit_S2 load_s2 ( // @[LoadUnit.scala 926:23]
    .clock(load_s2_clock),
    .io_in_valid(load_s2_io_in_valid),
    .io_in_bits_uop_cf_foldpc(load_s2_io_in_bits_uop_cf_foldpc),
    .io_in_bits_uop_cf_exceptionVec_4(load_s2_io_in_bits_uop_cf_exceptionVec_4),
    .io_in_bits_uop_cf_exceptionVec_5(load_s2_io_in_bits_uop_cf_exceptionVec_5),
    .io_in_bits_uop_cf_exceptionVec_13(load_s2_io_in_bits_uop_cf_exceptionVec_13),
    .io_in_bits_uop_cf_trigger_backendEn_1(load_s2_io_in_bits_uop_cf_trigger_backendEn_1),
    .io_in_bits_uop_cf_trigger_backendHit_0(load_s2_io_in_bits_uop_cf_trigger_backendHit_0),
    .io_in_bits_uop_cf_trigger_backendHit_1(load_s2_io_in_bits_uop_cf_trigger_backendHit_1),
    .io_in_bits_uop_cf_trigger_backendHit_4(load_s2_io_in_bits_uop_cf_trigger_backendHit_4),
    .io_in_bits_uop_cf_waitForRobIdx_flag(load_s2_io_in_bits_uop_cf_waitForRobIdx_flag),
    .io_in_bits_uop_cf_waitForRobIdx_value(load_s2_io_in_bits_uop_cf_waitForRobIdx_value),
    .io_in_bits_uop_cf_loadWaitBit(load_s2_io_in_bits_uop_cf_loadWaitBit),
    .io_in_bits_uop_cf_loadWaitStrict(load_s2_io_in_bits_uop_cf_loadWaitStrict),
    .io_in_bits_uop_cf_ftqPtr_flag(load_s2_io_in_bits_uop_cf_ftqPtr_flag),
    .io_in_bits_uop_cf_ftqPtr_value(load_s2_io_in_bits_uop_cf_ftqPtr_value),
    .io_in_bits_uop_cf_ftqOffset(load_s2_io_in_bits_uop_cf_ftqOffset),
    .io_in_bits_uop_ctrl_fuType(load_s2_io_in_bits_uop_ctrl_fuType),
    .io_in_bits_uop_ctrl_fuOpType(load_s2_io_in_bits_uop_ctrl_fuOpType),
    .io_in_bits_uop_ctrl_rfWen(load_s2_io_in_bits_uop_ctrl_rfWen),
    .io_in_bits_uop_ctrl_fpWen(load_s2_io_in_bits_uop_ctrl_fpWen),
    .io_in_bits_uop_pdest(load_s2_io_in_bits_uop_pdest),
    .io_in_bits_uop_robIdx_flag(load_s2_io_in_bits_uop_robIdx_flag),
    .io_in_bits_uop_robIdx_value(load_s2_io_in_bits_uop_robIdx_value),
    .io_in_bits_uop_lqIdx_flag(load_s2_io_in_bits_uop_lqIdx_flag),
    .io_in_bits_uop_lqIdx_value(load_s2_io_in_bits_uop_lqIdx_value),
    .io_in_bits_uop_sqIdx_flag(load_s2_io_in_bits_uop_sqIdx_flag),
    .io_in_bits_uop_sqIdx_value(load_s2_io_in_bits_uop_sqIdx_value),
    .io_in_bits_vaddr(load_s2_io_in_bits_vaddr),
    .io_in_bits_paddr(load_s2_io_in_bits_paddr),
    .io_in_bits_mask(load_s2_io_in_bits_mask),
    .io_in_bits_tlbMiss(load_s2_io_in_bits_tlbMiss),
    .io_in_bits_isPrefetch(load_s2_io_in_bits_isPrefetch),
    .io_in_bits_isHWPrefetch(load_s2_io_in_bits_isHWPrefetch),
    .io_in_bits_vec128bit(load_s2_io_in_bits_vec128bit),
    .io_in_bits_isFirstIssue(load_s2_io_in_bits_isFirstIssue),
    .io_in_bits_rarAllocated(load_s2_io_in_bits_rarAllocated),
    .io_in_bits_rarIndex(load_s2_io_in_bits_rarIndex),
    .io_in_bits_rawAllocated(load_s2_io_in_bits_rawAllocated),
    .io_in_bits_rawIndex(load_s2_io_in_bits_rawIndex),
    .io_in_bits_replayInfo_cause_2(load_s2_io_in_bits_replayInfo_cause_2),
    .io_in_bits_replayInfo_cause_4(load_s2_io_in_bits_replayInfo_cause_4),
    .io_out_valid(load_s2_io_out_valid),
    .io_out_bits_uop_cf_foldpc(load_s2_io_out_bits_uop_cf_foldpc),
    .io_out_bits_uop_cf_exceptionVec_4(load_s2_io_out_bits_uop_cf_exceptionVec_4),
    .io_out_bits_uop_cf_exceptionVec_5(load_s2_io_out_bits_uop_cf_exceptionVec_5),
    .io_out_bits_uop_cf_exceptionVec_13(load_s2_io_out_bits_uop_cf_exceptionVec_13),
    .io_out_bits_uop_cf_trigger_backendEn_1(load_s2_io_out_bits_uop_cf_trigger_backendEn_1),
    .io_out_bits_uop_cf_trigger_backendHit_0(load_s2_io_out_bits_uop_cf_trigger_backendHit_0),
    .io_out_bits_uop_cf_trigger_backendHit_1(load_s2_io_out_bits_uop_cf_trigger_backendHit_1),
    .io_out_bits_uop_cf_trigger_backendHit_4(load_s2_io_out_bits_uop_cf_trigger_backendHit_4),
    .io_out_bits_uop_cf_waitForRobIdx_flag(load_s2_io_out_bits_uop_cf_waitForRobIdx_flag),
    .io_out_bits_uop_cf_waitForRobIdx_value(load_s2_io_out_bits_uop_cf_waitForRobIdx_value),
    .io_out_bits_uop_cf_loadWaitBit(load_s2_io_out_bits_uop_cf_loadWaitBit),
    .io_out_bits_uop_cf_loadWaitStrict(load_s2_io_out_bits_uop_cf_loadWaitStrict),
    .io_out_bits_uop_cf_ftqPtr_flag(load_s2_io_out_bits_uop_cf_ftqPtr_flag),
    .io_out_bits_uop_cf_ftqPtr_value(load_s2_io_out_bits_uop_cf_ftqPtr_value),
    .io_out_bits_uop_cf_ftqOffset(load_s2_io_out_bits_uop_cf_ftqOffset),
    .io_out_bits_uop_ctrl_fuType(load_s2_io_out_bits_uop_ctrl_fuType),
    .io_out_bits_uop_ctrl_fuOpType(load_s2_io_out_bits_uop_ctrl_fuOpType),
    .io_out_bits_uop_ctrl_rfWen(load_s2_io_out_bits_uop_ctrl_rfWen),
    .io_out_bits_uop_ctrl_fpWen(load_s2_io_out_bits_uop_ctrl_fpWen),
    .io_out_bits_uop_pdest(load_s2_io_out_bits_uop_pdest),
    .io_out_bits_uop_robIdx_flag(load_s2_io_out_bits_uop_robIdx_flag),
    .io_out_bits_uop_robIdx_value(load_s2_io_out_bits_uop_robIdx_value),
    .io_out_bits_uop_lqIdx_flag(load_s2_io_out_bits_uop_lqIdx_flag),
    .io_out_bits_uop_lqIdx_value(load_s2_io_out_bits_uop_lqIdx_value),
    .io_out_bits_uop_sqIdx_flag(load_s2_io_out_bits_uop_sqIdx_flag),
    .io_out_bits_uop_sqIdx_value(load_s2_io_out_bits_uop_sqIdx_value),
    .io_out_bits_vaddr(load_s2_io_out_bits_vaddr),
    .io_out_bits_paddr(load_s2_io_out_bits_paddr),
    .io_out_bits_mask(load_s2_io_out_bits_mask),
    .io_out_bits_miss(load_s2_io_out_bits_miss),
    .io_out_bits_tlbMiss(load_s2_io_out_bits_tlbMiss),
    .io_out_bits_mmio(load_s2_io_out_bits_mmio),
    .io_out_bits_isPrefetch(load_s2_io_out_bits_isPrefetch),
    .io_out_bits_isHWPrefetch(load_s2_io_out_bits_isHWPrefetch),
    .io_out_bits_vec128bit(load_s2_io_out_bits_vec128bit),
    .io_out_bits_rarAllocated(load_s2_io_out_bits_rarAllocated),
    .io_out_bits_rarIndex(load_s2_io_out_bits_rarIndex),
    .io_out_bits_rawAllocated(load_s2_io_out_bits_rawAllocated),
    .io_out_bits_rawIndex(load_s2_io_out_bits_rawIndex),
    .io_out_bits_replayInfo_missMSHRId(load_s2_io_out_bits_replayInfo_missMSHRId),
    .io_out_bits_replayInfo_canForwardFullData(load_s2_io_out_bits_replayInfo_canForwardFullData),
    .io_out_bits_replayInfo_dataInvalidSqIdx_flag(load_s2_io_out_bits_replayInfo_dataInvalidSqIdx_flag),
    .io_out_bits_replayInfo_dataInvalidSqIdx_value(load_s2_io_out_bits_replayInfo_dataInvalidSqIdx_value),
    .io_out_bits_replayInfo_addrInvalidSqIdx_flag(load_s2_io_out_bits_replayInfo_addrInvalidSqIdx_flag),
    .io_out_bits_replayInfo_addrInvalidSqIdx_value(load_s2_io_out_bits_replayInfo_addrInvalidSqIdx_value),
    .io_out_bits_replayInfo_replayCarry_real_way_en(load_s2_io_out_bits_replayInfo_replayCarry_real_way_en),
    .io_out_bits_replayInfo_replayCarry_valid(load_s2_io_out_bits_replayInfo_replayCarry_valid),
    .io_out_bits_replayInfo_dataInLastBeat(load_s2_io_out_bits_replayInfo_dataInLastBeat),
    .io_out_bits_replayInfo_cause_0(load_s2_io_out_bits_replayInfo_cause_0),
    .io_out_bits_replayInfo_cause_1(load_s2_io_out_bits_replayInfo_cause_1),
    .io_out_bits_replayInfo_cause_2(load_s2_io_out_bits_replayInfo_cause_2),
    .io_out_bits_replayInfo_cause_4(load_s2_io_out_bits_replayInfo_cause_4),
    .io_out_bits_replayInfo_cause_5(load_s2_io_out_bits_replayInfo_cause_5),
    .io_out_bits_replayInfo_cause_6(load_s2_io_out_bits_replayInfo_cause_6),
    .io_out_bits_replayInfo_cause_7(load_s2_io_out_bits_replayInfo_cause_7),
    .io_dcacheResp_bits_data_delayed(load_s2_io_dcacheResp_bits_data_delayed),
    .io_dcacheResp_bits_miss(load_s2_io_dcacheResp_bits_miss),
    .io_dcacheResp_bits_replay(load_s2_io_dcacheResp_bits_replay),
    .io_dcacheResp_bits_replayCarry_real_way_en(load_s2_io_dcacheResp_bits_replayCarry_real_way_en),
    .io_dcacheResp_bits_replayCarry_valid(load_s2_io_dcacheResp_bits_replayCarry_valid),
    .io_dcacheResp_bits_tag_error(load_s2_io_dcacheResp_bits_tag_error),
    .io_dcacheResp_bits_mshr_id(load_s2_io_dcacheResp_bits_mshr_id),
    .io_pmpResp_ld(load_s2_io_pmpResp_ld),
    .io_pmpResp_mmio(load_s2_io_pmpResp_mmio),
    .io_lsq_forwardMask_0(load_s2_io_lsq_forwardMask_0),
    .io_lsq_forwardMask_1(load_s2_io_lsq_forwardMask_1),
    .io_lsq_forwardMask_2(load_s2_io_lsq_forwardMask_2),
    .io_lsq_forwardMask_3(load_s2_io_lsq_forwardMask_3),
    .io_lsq_forwardMask_4(load_s2_io_lsq_forwardMask_4),
    .io_lsq_forwardMask_5(load_s2_io_lsq_forwardMask_5),
    .io_lsq_forwardMask_6(load_s2_io_lsq_forwardMask_6),
    .io_lsq_forwardMask_7(load_s2_io_lsq_forwardMask_7),
    .io_lsq_forwardMask_8(load_s2_io_lsq_forwardMask_8),
    .io_lsq_forwardMask_9(load_s2_io_lsq_forwardMask_9),
    .io_lsq_forwardMask_10(load_s2_io_lsq_forwardMask_10),
    .io_lsq_forwardMask_11(load_s2_io_lsq_forwardMask_11),
    .io_lsq_forwardMask_12(load_s2_io_lsq_forwardMask_12),
    .io_lsq_forwardMask_13(load_s2_io_lsq_forwardMask_13),
    .io_lsq_forwardMask_14(load_s2_io_lsq_forwardMask_14),
    .io_lsq_forwardMask_15(load_s2_io_lsq_forwardMask_15),
    .io_lsq_forwardData_0(load_s2_io_lsq_forwardData_0),
    .io_lsq_forwardData_1(load_s2_io_lsq_forwardData_1),
    .io_lsq_forwardData_2(load_s2_io_lsq_forwardData_2),
    .io_lsq_forwardData_3(load_s2_io_lsq_forwardData_3),
    .io_lsq_forwardData_4(load_s2_io_lsq_forwardData_4),
    .io_lsq_forwardData_5(load_s2_io_lsq_forwardData_5),
    .io_lsq_forwardData_6(load_s2_io_lsq_forwardData_6),
    .io_lsq_forwardData_7(load_s2_io_lsq_forwardData_7),
    .io_lsq_forwardData_8(load_s2_io_lsq_forwardData_8),
    .io_lsq_forwardData_9(load_s2_io_lsq_forwardData_9),
    .io_lsq_forwardData_10(load_s2_io_lsq_forwardData_10),
    .io_lsq_forwardData_11(load_s2_io_lsq_forwardData_11),
    .io_lsq_forwardData_12(load_s2_io_lsq_forwardData_12),
    .io_lsq_forwardData_13(load_s2_io_lsq_forwardData_13),
    .io_lsq_forwardData_14(load_s2_io_lsq_forwardData_14),
    .io_lsq_forwardData_15(load_s2_io_lsq_forwardData_15),
    .io_lsq_dataInvalid(load_s2_io_lsq_dataInvalid),
    .io_lsq_schedWait(load_s2_io_lsq_schedWait),
    .io_dataInvalidSqIdx_flag(load_s2_io_dataInvalidSqIdx_flag),
    .io_dataInvalidSqIdx_value(load_s2_io_dataInvalidSqIdx_value),
    .io_addrInvalidSqIdx_flag(load_s2_io_addrInvalidSqIdx_flag),
    .io_addrInvalidSqIdx_value(load_s2_io_addrInvalidSqIdx_value),
    .io_sbuffer_forwardMask_0(load_s2_io_sbuffer_forwardMask_0),
    .io_sbuffer_forwardMask_1(load_s2_io_sbuffer_forwardMask_1),
    .io_sbuffer_forwardMask_2(load_s2_io_sbuffer_forwardMask_2),
    .io_sbuffer_forwardMask_3(load_s2_io_sbuffer_forwardMask_3),
    .io_sbuffer_forwardMask_4(load_s2_io_sbuffer_forwardMask_4),
    .io_sbuffer_forwardMask_5(load_s2_io_sbuffer_forwardMask_5),
    .io_sbuffer_forwardMask_6(load_s2_io_sbuffer_forwardMask_6),
    .io_sbuffer_forwardMask_7(load_s2_io_sbuffer_forwardMask_7),
    .io_sbuffer_forwardMask_8(load_s2_io_sbuffer_forwardMask_8),
    .io_sbuffer_forwardMask_9(load_s2_io_sbuffer_forwardMask_9),
    .io_sbuffer_forwardMask_10(load_s2_io_sbuffer_forwardMask_10),
    .io_sbuffer_forwardMask_11(load_s2_io_sbuffer_forwardMask_11),
    .io_sbuffer_forwardMask_12(load_s2_io_sbuffer_forwardMask_12),
    .io_sbuffer_forwardMask_13(load_s2_io_sbuffer_forwardMask_13),
    .io_sbuffer_forwardMask_14(load_s2_io_sbuffer_forwardMask_14),
    .io_sbuffer_forwardMask_15(load_s2_io_sbuffer_forwardMask_15),
    .io_sbuffer_forwardData_0(load_s2_io_sbuffer_forwardData_0),
    .io_sbuffer_forwardData_1(load_s2_io_sbuffer_forwardData_1),
    .io_sbuffer_forwardData_2(load_s2_io_sbuffer_forwardData_2),
    .io_sbuffer_forwardData_3(load_s2_io_sbuffer_forwardData_3),
    .io_sbuffer_forwardData_4(load_s2_io_sbuffer_forwardData_4),
    .io_sbuffer_forwardData_5(load_s2_io_sbuffer_forwardData_5),
    .io_sbuffer_forwardData_6(load_s2_io_sbuffer_forwardData_6),
    .io_sbuffer_forwardData_7(load_s2_io_sbuffer_forwardData_7),
    .io_sbuffer_forwardData_8(load_s2_io_sbuffer_forwardData_8),
    .io_sbuffer_forwardData_9(load_s2_io_sbuffer_forwardData_9),
    .io_sbuffer_forwardData_10(load_s2_io_sbuffer_forwardData_10),
    .io_sbuffer_forwardData_11(load_s2_io_sbuffer_forwardData_11),
    .io_sbuffer_forwardData_12(load_s2_io_sbuffer_forwardData_12),
    .io_sbuffer_forwardData_13(load_s2_io_sbuffer_forwardData_13),
    .io_sbuffer_forwardData_14(load_s2_io_sbuffer_forwardData_14),
    .io_sbuffer_forwardData_15(load_s2_io_sbuffer_forwardData_15),
    .io_dataForwarded(load_s2_io_dataForwarded),
    .io_dcache_kill(load_s2_io_dcache_kill),
    .io_correctTableQueryResp_strict(load_s2_io_correctTableQueryResp_strict),
    .io_loadLoadViolationQueryReq_valid(load_s2_io_loadLoadViolationQueryReq_valid),
    .io_loadLoadViolationQueryReq_bits_uop_robIdx_flag(load_s2_io_loadLoadViolationQueryReq_bits_uop_robIdx_flag),
    .io_loadLoadViolationQueryReq_bits_uop_robIdx_value(load_s2_io_loadLoadViolationQueryReq_bits_uop_robIdx_value),
    .io_loadLoadViolationQueryReq_bits_uop_lqIdx_flag(load_s2_io_loadLoadViolationQueryReq_bits_uop_lqIdx_flag),
    .io_loadLoadViolationQueryReq_bits_uop_lqIdx_value(load_s2_io_loadLoadViolationQueryReq_bits_uop_lqIdx_value),
    .io_loadLoadViolationQueryReq_bits_index(load_s2_io_loadLoadViolationQueryReq_bits_index),
    .io_loadLoadViolationQueryReq_bits_allocated(load_s2_io_loadLoadViolationQueryReq_bits_allocated),
    .io_loadLoadViolationQueryReq_bits_datavalid(load_s2_io_loadLoadViolationQueryReq_bits_datavalid),
    .io_loadLoadViolationQueryReq_bits_miss(load_s2_io_loadLoadViolationQueryReq_bits_miss),
    .io_loadLoadViolationQueryReq_bits_paddr(load_s2_io_loadLoadViolationQueryReq_bits_paddr),
    .io_storeLoadViolationQueryReq_valid(load_s2_io_storeLoadViolationQueryReq_valid),
    .io_storeLoadViolationQueryReq_bits_uop_cf_foldpc(load_s2_io_storeLoadViolationQueryReq_bits_uop_cf_foldpc),
    .io_storeLoadViolationQueryReq_bits_uop_cf_ftqPtr_flag(load_s2_io_storeLoadViolationQueryReq_bits_uop_cf_ftqPtr_flag
      ),
    .io_storeLoadViolationQueryReq_bits_uop_cf_ftqPtr_value(
      load_s2_io_storeLoadViolationQueryReq_bits_uop_cf_ftqPtr_value),
    .io_storeLoadViolationQueryReq_bits_uop_cf_ftqOffset(load_s2_io_storeLoadViolationQueryReq_bits_uop_cf_ftqOffset),
    .io_storeLoadViolationQueryReq_bits_uop_robIdx_flag(load_s2_io_storeLoadViolationQueryReq_bits_uop_robIdx_flag),
    .io_storeLoadViolationQueryReq_bits_uop_robIdx_value(load_s2_io_storeLoadViolationQueryReq_bits_uop_robIdx_value),
    .io_storeLoadViolationQueryReq_bits_uop_sqIdx_flag(load_s2_io_storeLoadViolationQueryReq_bits_uop_sqIdx_flag),
    .io_storeLoadViolationQueryReq_bits_uop_sqIdx_value(load_s2_io_storeLoadViolationQueryReq_bits_uop_sqIdx_value),
    .io_storeLoadViolationQueryReq_bits_index(load_s2_io_storeLoadViolationQueryReq_bits_index),
    .io_storeLoadViolationQueryReq_bits_allocated(load_s2_io_storeLoadViolationQueryReq_bits_allocated),
    .io_storeLoadViolationQueryReq_bits_datavalid(load_s2_io_storeLoadViolationQueryReq_bits_datavalid),
    .io_storeLoadViolationQueryReq_bits_mask(load_s2_io_storeLoadViolationQueryReq_bits_mask),
    .io_storeLoadViolationQueryReq_bits_paddr(load_s2_io_storeLoadViolationQueryReq_bits_paddr),
    .io_correctTableUpdate_valid(load_s2_io_correctTableUpdate_valid),
    .io_correctTableUpdate_bits_addr(load_s2_io_correctTableUpdate_bits_addr),
    .io_correctTableUpdate_bits_strict(load_s2_io_correctTableUpdate_bits_strict),
    .io_correctTableUpdate_bits_violation(load_s2_io_correctTableUpdate_bits_violation),
    .io_csrCtrl_cache_error_enable(load_s2_io_csrCtrl_cache_error_enable),
    .io_static_pm_valid(load_s2_io_static_pm_valid),
    .io_static_pm_bits(load_s2_io_static_pm_bits),
    .io_loadDataFromDcache_respDcacheData(load_s2_io_loadDataFromDcache_respDcacheData),
    .io_loadDataFromDcache_forwardMask_0(load_s2_io_loadDataFromDcache_forwardMask_0),
    .io_loadDataFromDcache_forwardMask_1(load_s2_io_loadDataFromDcache_forwardMask_1),
    .io_loadDataFromDcache_forwardMask_2(load_s2_io_loadDataFromDcache_forwardMask_2),
    .io_loadDataFromDcache_forwardMask_3(load_s2_io_loadDataFromDcache_forwardMask_3),
    .io_loadDataFromDcache_forwardMask_4(load_s2_io_loadDataFromDcache_forwardMask_4),
    .io_loadDataFromDcache_forwardMask_5(load_s2_io_loadDataFromDcache_forwardMask_5),
    .io_loadDataFromDcache_forwardMask_6(load_s2_io_loadDataFromDcache_forwardMask_6),
    .io_loadDataFromDcache_forwardMask_7(load_s2_io_loadDataFromDcache_forwardMask_7),
    .io_loadDataFromDcache_forwardMask_8(load_s2_io_loadDataFromDcache_forwardMask_8),
    .io_loadDataFromDcache_forwardMask_9(load_s2_io_loadDataFromDcache_forwardMask_9),
    .io_loadDataFromDcache_forwardMask_10(load_s2_io_loadDataFromDcache_forwardMask_10),
    .io_loadDataFromDcache_forwardMask_11(load_s2_io_loadDataFromDcache_forwardMask_11),
    .io_loadDataFromDcache_forwardMask_12(load_s2_io_loadDataFromDcache_forwardMask_12),
    .io_loadDataFromDcache_forwardMask_13(load_s2_io_loadDataFromDcache_forwardMask_13),
    .io_loadDataFromDcache_forwardMask_14(load_s2_io_loadDataFromDcache_forwardMask_14),
    .io_loadDataFromDcache_forwardMask_15(load_s2_io_loadDataFromDcache_forwardMask_15),
    .io_loadDataFromDcache_forwardData_0(load_s2_io_loadDataFromDcache_forwardData_0),
    .io_loadDataFromDcache_forwardData_1(load_s2_io_loadDataFromDcache_forwardData_1),
    .io_loadDataFromDcache_forwardData_2(load_s2_io_loadDataFromDcache_forwardData_2),
    .io_loadDataFromDcache_forwardData_3(load_s2_io_loadDataFromDcache_forwardData_3),
    .io_loadDataFromDcache_forwardData_4(load_s2_io_loadDataFromDcache_forwardData_4),
    .io_loadDataFromDcache_forwardData_5(load_s2_io_loadDataFromDcache_forwardData_5),
    .io_loadDataFromDcache_forwardData_6(load_s2_io_loadDataFromDcache_forwardData_6),
    .io_loadDataFromDcache_forwardData_7(load_s2_io_loadDataFromDcache_forwardData_7),
    .io_loadDataFromDcache_forwardData_8(load_s2_io_loadDataFromDcache_forwardData_8),
    .io_loadDataFromDcache_forwardData_9(load_s2_io_loadDataFromDcache_forwardData_9),
    .io_loadDataFromDcache_forwardData_10(load_s2_io_loadDataFromDcache_forwardData_10),
    .io_loadDataFromDcache_forwardData_11(load_s2_io_loadDataFromDcache_forwardData_11),
    .io_loadDataFromDcache_forwardData_12(load_s2_io_loadDataFromDcache_forwardData_12),
    .io_loadDataFromDcache_forwardData_13(load_s2_io_loadDataFromDcache_forwardData_13),
    .io_loadDataFromDcache_forwardData_14(load_s2_io_loadDataFromDcache_forwardData_14),
    .io_loadDataFromDcache_forwardData_15(load_s2_io_loadDataFromDcache_forwardData_15),
    .io_loadDataFromDcache_uop_ctrl_fuOpType(load_s2_io_loadDataFromDcache_uop_ctrl_fuOpType),
    .io_loadDataFromDcache_uop_ctrl_fpWen(load_s2_io_loadDataFromDcache_uop_ctrl_fpWen),
    .io_loadDataFromDcache_addrOffset(load_s2_io_loadDataFromDcache_addrOffset),
    .io_loadDataFromDcache_forward_D(load_s2_io_loadDataFromDcache_forward_D),
    .io_loadDataFromDcache_forwardData_D_0(load_s2_io_loadDataFromDcache_forwardData_D_0),
    .io_loadDataFromDcache_forwardData_D_1(load_s2_io_loadDataFromDcache_forwardData_D_1),
    .io_loadDataFromDcache_forwardData_D_2(load_s2_io_loadDataFromDcache_forwardData_D_2),
    .io_loadDataFromDcache_forwardData_D_3(load_s2_io_loadDataFromDcache_forwardData_D_3),
    .io_loadDataFromDcache_forwardData_D_4(load_s2_io_loadDataFromDcache_forwardData_D_4),
    .io_loadDataFromDcache_forwardData_D_5(load_s2_io_loadDataFromDcache_forwardData_D_5),
    .io_loadDataFromDcache_forwardData_D_6(load_s2_io_loadDataFromDcache_forwardData_D_6),
    .io_loadDataFromDcache_forwardData_D_7(load_s2_io_loadDataFromDcache_forwardData_D_7),
    .io_loadDataFromDcache_forwardData_D_8(load_s2_io_loadDataFromDcache_forwardData_D_8),
    .io_loadDataFromDcache_forwardData_D_9(load_s2_io_loadDataFromDcache_forwardData_D_9),
    .io_loadDataFromDcache_forwardData_D_10(load_s2_io_loadDataFromDcache_forwardData_D_10),
    .io_loadDataFromDcache_forwardData_D_11(load_s2_io_loadDataFromDcache_forwardData_D_11),
    .io_loadDataFromDcache_forwardData_D_12(load_s2_io_loadDataFromDcache_forwardData_D_12),
    .io_loadDataFromDcache_forwardData_D_13(load_s2_io_loadDataFromDcache_forwardData_D_13),
    .io_loadDataFromDcache_forwardData_D_14(load_s2_io_loadDataFromDcache_forwardData_D_14),
    .io_loadDataFromDcache_forwardData_D_15(load_s2_io_loadDataFromDcache_forwardData_D_15),
    .io_loadDataFromDcache_forward_mshr(load_s2_io_loadDataFromDcache_forward_mshr),
    .io_loadDataFromDcache_forwardData_mshr_0(load_s2_io_loadDataFromDcache_forwardData_mshr_0),
    .io_loadDataFromDcache_forwardData_mshr_1(load_s2_io_loadDataFromDcache_forwardData_mshr_1),
    .io_loadDataFromDcache_forwardData_mshr_2(load_s2_io_loadDataFromDcache_forwardData_mshr_2),
    .io_loadDataFromDcache_forwardData_mshr_3(load_s2_io_loadDataFromDcache_forwardData_mshr_3),
    .io_loadDataFromDcache_forwardData_mshr_4(load_s2_io_loadDataFromDcache_forwardData_mshr_4),
    .io_loadDataFromDcache_forwardData_mshr_5(load_s2_io_loadDataFromDcache_forwardData_mshr_5),
    .io_loadDataFromDcache_forwardData_mshr_6(load_s2_io_loadDataFromDcache_forwardData_mshr_6),
    .io_loadDataFromDcache_forwardData_mshr_7(load_s2_io_loadDataFromDcache_forwardData_mshr_7),
    .io_loadDataFromDcache_forwardData_mshr_8(load_s2_io_loadDataFromDcache_forwardData_mshr_8),
    .io_loadDataFromDcache_forwardData_mshr_9(load_s2_io_loadDataFromDcache_forwardData_mshr_9),
    .io_loadDataFromDcache_forwardData_mshr_10(load_s2_io_loadDataFromDcache_forwardData_mshr_10),
    .io_loadDataFromDcache_forwardData_mshr_11(load_s2_io_loadDataFromDcache_forwardData_mshr_11),
    .io_loadDataFromDcache_forwardData_mshr_12(load_s2_io_loadDataFromDcache_forwardData_mshr_12),
    .io_loadDataFromDcache_forwardData_mshr_13(load_s2_io_loadDataFromDcache_forwardData_mshr_13),
    .io_loadDataFromDcache_forwardData_mshr_14(load_s2_io_loadDataFromDcache_forwardData_mshr_14),
    .io_loadDataFromDcache_forwardData_mshr_15(load_s2_io_loadDataFromDcache_forwardData_mshr_15),
    .io_loadDataFromDcache_forward_result_valid(load_s2_io_loadDataFromDcache_forward_result_valid),
    .io_reExecuteQuery_0_valid(load_s2_io_reExecuteQuery_0_valid),
    .io_reExecuteQuery_0_bits_robIdx_flag(load_s2_io_reExecuteQuery_0_bits_robIdx_flag),
    .io_reExecuteQuery_0_bits_robIdx_value(load_s2_io_reExecuteQuery_0_bits_robIdx_value),
    .io_reExecuteQuery_0_bits_paddr(load_s2_io_reExecuteQuery_0_bits_paddr),
    .io_reExecuteQuery_0_bits_mask(load_s2_io_reExecuteQuery_0_bits_mask),
    .io_reExecuteQuery_1_valid(load_s2_io_reExecuteQuery_1_valid),
    .io_reExecuteQuery_1_bits_robIdx_flag(load_s2_io_reExecuteQuery_1_bits_robIdx_flag),
    .io_reExecuteQuery_1_bits_robIdx_value(load_s2_io_reExecuteQuery_1_bits_robIdx_value),
    .io_reExecuteQuery_1_bits_paddr(load_s2_io_reExecuteQuery_1_bits_paddr),
    .io_reExecuteQuery_1_bits_mask(load_s2_io_reExecuteQuery_1_bits_mask),
    .io_forward_D(load_s2_io_forward_D),
    .io_forwardData_D_0(load_s2_io_forwardData_D_0),
    .io_forwardData_D_1(load_s2_io_forwardData_D_1),
    .io_forwardData_D_2(load_s2_io_forwardData_D_2),
    .io_forwardData_D_3(load_s2_io_forwardData_D_3),
    .io_forwardData_D_4(load_s2_io_forwardData_D_4),
    .io_forwardData_D_5(load_s2_io_forwardData_D_5),
    .io_forwardData_D_6(load_s2_io_forwardData_D_6),
    .io_forwardData_D_7(load_s2_io_forwardData_D_7),
    .io_forwardData_D_8(load_s2_io_forwardData_D_8),
    .io_forwardData_D_9(load_s2_io_forwardData_D_9),
    .io_forwardData_D_10(load_s2_io_forwardData_D_10),
    .io_forwardData_D_11(load_s2_io_forwardData_D_11),
    .io_forwardData_D_12(load_s2_io_forwardData_D_12),
    .io_forwardData_D_13(load_s2_io_forwardData_D_13),
    .io_forwardData_D_14(load_s2_io_forwardData_D_14),
    .io_forwardData_D_15(load_s2_io_forwardData_D_15),
    .io_forward_mshr(load_s2_io_forward_mshr),
    .io_forwardData_mshr_0(load_s2_io_forwardData_mshr_0),
    .io_forwardData_mshr_1(load_s2_io_forwardData_mshr_1),
    .io_forwardData_mshr_2(load_s2_io_forwardData_mshr_2),
    .io_forwardData_mshr_3(load_s2_io_forwardData_mshr_3),
    .io_forwardData_mshr_4(load_s2_io_forwardData_mshr_4),
    .io_forwardData_mshr_5(load_s2_io_forwardData_mshr_5),
    .io_forwardData_mshr_6(load_s2_io_forwardData_mshr_6),
    .io_forwardData_mshr_7(load_s2_io_forwardData_mshr_7),
    .io_forwardData_mshr_8(load_s2_io_forwardData_mshr_8),
    .io_forwardData_mshr_9(load_s2_io_forwardData_mshr_9),
    .io_forwardData_mshr_10(load_s2_io_forwardData_mshr_10),
    .io_forwardData_mshr_11(load_s2_io_forwardData_mshr_11),
    .io_forwardData_mshr_12(load_s2_io_forwardData_mshr_12),
    .io_forwardData_mshr_13(load_s2_io_forwardData_mshr_13),
    .io_forwardData_mshr_14(load_s2_io_forwardData_mshr_14),
    .io_forwardData_mshr_15(load_s2_io_forwardData_mshr_15),
    .io_forward_result_valid(load_s2_io_forward_result_valid)
  );
  assign io_loadIn_ready = cancelPointerChasing ? load_s0_io_in_ready : _GEN_328; // @[LoadUnit.scala 1000:33 929:17]
  assign io_VecloadIn_ready = load_s0_io_vec_in_ready; // @[LoadUnit.scala 930:21]
  assign io_loadOut_valid = _io_loadOut_valid_T_7 & _io_loadOut_valid_T_8; // @[LoadUnit.scala 1274:122]
  assign io_loadOut_bits_uop_cf_exceptionVec_4 = hitLoadOut_valid ? hitLoadOut_bits_uop_cf_exceptionVec_4 :
    io_lsq_loadOut_bits_uop_cf_exceptionVec_4; // @[LoadUnit.scala 1231:26]
  assign io_loadOut_bits_uop_cf_exceptionVec_5 = hitLoadOut_valid ? hitLoadOut_bits_uop_cf_exceptionVec_5 :
    io_lsq_loadOut_bits_uop_cf_exceptionVec_5; // @[LoadUnit.scala 1231:26]
  assign io_loadOut_bits_uop_cf_exceptionVec_13 = hitLoadOut_valid ? hitLoadOut_bits_uop_cf_exceptionVec_13 :
    io_lsq_loadOut_bits_uop_cf_exceptionVec_13; // @[LoadUnit.scala 1231:26]
  assign io_loadOut_bits_uop_cf_trigger_backendEn_1 = hitLoadOut_valid ? s3_loadOutBits_uop_cf_trigger_backendEn_1 :
    io_lsq_loadOut_bits_uop_cf_trigger_backendEn_1; // @[LoadUnit.scala 1231:26]
  assign io_loadOut_bits_uop_cf_trigger_backendHit_0 = hitLoadOut_valid ? s3_loadOutBits_uop_cf_trigger_backendHit_0 :
    io_lsq_loadOut_bits_uop_cf_trigger_backendHit_0; // @[LoadUnit.scala 1231:26]
  assign io_loadOut_bits_uop_cf_trigger_backendHit_1 = hitLoadOut_valid ? s3_loadOutBits_uop_cf_trigger_backendHit_1 :
    io_lsq_loadOut_bits_uop_cf_trigger_backendHit_1; // @[LoadUnit.scala 1231:26]
  assign io_loadOut_bits_uop_cf_trigger_backendHit_4 = hitLoadOut_valid ? s3_loadOutBits_uop_cf_trigger_backendHit_4 :
    io_lsq_loadOut_bits_uop_cf_trigger_backendHit_4; // @[LoadUnit.scala 1231:26]
  assign io_loadOut_bits_uop_ctrl_rfWen = hitLoadOut_valid ? s3_loadOutBits_uop_ctrl_rfWen :
    io_lsq_loadOut_bits_uop_ctrl_rfWen; // @[LoadUnit.scala 1231:26]
  assign io_loadOut_bits_uop_ctrl_fpWen = hitLoadOut_valid ? s3_loadOutBits_uop_ctrl_fpWen :
    io_lsq_loadOut_bits_uop_ctrl_fpWen; // @[LoadUnit.scala 1231:26]
  assign io_loadOut_bits_uop_ctrl_flushPipe = hitLoadOut_valid ? 1'h0 : io_lsq_loadOut_bits_uop_ctrl_flushPipe; // @[LoadUnit.scala 1231:26]
  assign io_loadOut_bits_uop_ctrl_replayInst = hitLoadOut_valid ? s3_replayInst :
    io_lsq_loadOut_bits_uop_ctrl_replayInst; // @[LoadUnit.scala 1231:26]
  assign io_loadOut_bits_uop_pdest = hitLoadOut_valid ? s3_loadOutBits_uop_pdest : io_lsq_loadOut_bits_uop_pdest; // @[LoadUnit.scala 1231:26]
  assign io_loadOut_bits_uop_robIdx_flag = hitLoadOut_valid ? s3_loadOutBits_uop_robIdx_flag :
    io_lsq_loadOut_bits_uop_robIdx_flag; // @[LoadUnit.scala 1231:26]
  assign io_loadOut_bits_uop_robIdx_value = hitLoadOut_valid ? s3_loadOutBits_uop_robIdx_value :
    io_lsq_loadOut_bits_uop_robIdx_value; // @[LoadUnit.scala 1231:26]
  assign io_loadOut_bits_data = hitLoadOut_valid ? s3_rdataPartialLoadDcache : s3_rdataPartialLoadLQ; // @[LoadUnit.scala 1272:30]
  assign io_loadOut_bits_debug_isMMIO = hitLoadOut_valid ? s3_loadOutBits_mmio : io_lsq_loadOut_bits_debug_isMMIO; // @[LoadUnit.scala 1231:26]
  assign io_dcache_req_valid = load_s0_io_dcacheReq_valid; // @[LoadUnit.scala 932:24]
  assign io_dcache_req_bits_cmd = load_s0_io_dcacheReq_bits_cmd; // @[LoadUnit.scala 932:24]
  assign io_dcache_req_bits_addr = load_s0_io_dcacheReq_bits_addr; // @[LoadUnit.scala 932:24]
  assign io_dcache_req_bits_instrtype = load_s0_io_dcacheReq_bits_instrtype; // @[LoadUnit.scala 932:24]
  assign io_dcache_req_bits_replayCarry_real_way_en = load_s0_io_dcacheReq_bits_replayCarry_real_way_en; // @[LoadUnit.scala 932:24]
  assign io_dcache_req_bits_replayCarry_valid = load_s0_io_dcacheReq_bits_replayCarry_valid; // @[LoadUnit.scala 932:24]
  assign io_dcache_s1_kill = load_s1_io_dcacheKill; // @[LoadUnit.scala 957:25]
  assign io_dcache_s2_kill = load_s2_io_dcache_kill; // @[LoadUnit.scala 1047:21]
  assign io_dcache_s1_paddr_dup_lsu = load_s1_io_lsuPAddr; // @[LoadUnit.scala 955:23]
  assign io_dcache_s1_paddr_dup_dcache = load_s1_io_dcachePAddr; // @[LoadUnit.scala 956:26]
  assign io_sbuffer_vaddr = load_s1_io_sbuffer_vaddr; // @[LoadUnit.scala 958:22]
  assign io_sbuffer_paddr = load_s1_io_sbuffer_paddr; // @[LoadUnit.scala 958:22]
  assign io_sbuffer_valid = load_s1_io_sbuffer_valid; // @[LoadUnit.scala 958:22]
  assign io_lsq_loadIn_valid = s3_loadOutValid & ~s3_loadOutBits_vec128bit; // @[LoadUnit.scala 1127:42]
  assign io_lsq_loadIn_bits_uop_cf_foldpc = s3_loadOutBits_uop_cf_foldpc; // @[LoadUnit.scala 1208:24 1210:23]
  assign io_lsq_loadIn_bits_uop_cf_exceptionVec_4 = s3_forceReplay ? 1'h0 : s3_loadOutBits_uop_cf_exceptionVec_4; // @[LoadUnit.scala 1210:23 1224:25 1225:41]
  assign io_lsq_loadIn_bits_uop_cf_exceptionVec_5 = s3_forceReplay ? 1'h0 : s3_delayedLoadError & _s3_schedError_T_20 |
    s3_loadOutBits_uop_cf_exceptionVec_5; // @[LoadUnit.scala 1224:25 1225:41 1212:56]
  assign io_lsq_loadIn_bits_uop_cf_exceptionVec_13 = s3_forceReplay ? 1'h0 : s3_loadOutBits_uop_cf_exceptionVec_13; // @[LoadUnit.scala 1210:23 1224:25 1225:41]
  assign io_lsq_loadIn_bits_uop_cf_trigger_backendEn_1 = s3_loadOutBits_uop_cf_trigger_backendEn_1; // @[LoadUnit.scala 1208:24 1210:23]
  assign io_lsq_loadIn_bits_uop_cf_trigger_backendHit_0 = s3_loadOutBits_uop_cf_trigger_backendHit_0; // @[LoadUnit.scala 1208:24 1210:23]
  assign io_lsq_loadIn_bits_uop_cf_trigger_backendHit_1 = s3_loadOutBits_uop_cf_trigger_backendHit_1; // @[LoadUnit.scala 1208:24 1210:23]
  assign io_lsq_loadIn_bits_uop_cf_trigger_backendHit_4 = s3_loadOutBits_uop_cf_trigger_backendHit_4; // @[LoadUnit.scala 1208:24 1210:23]
  assign io_lsq_loadIn_bits_uop_cf_waitForRobIdx_flag = s3_loadOutBits_uop_cf_waitForRobIdx_flag; // @[LoadUnit.scala 1208:24 1210:23]
  assign io_lsq_loadIn_bits_uop_cf_waitForRobIdx_value = s3_loadOutBits_uop_cf_waitForRobIdx_value; // @[LoadUnit.scala 1208:24 1210:23]
  assign io_lsq_loadIn_bits_uop_cf_loadWaitBit = s3_loadOutBits_uop_cf_loadWaitBit; // @[LoadUnit.scala 1208:24 1210:23]
  assign io_lsq_loadIn_bits_uop_cf_loadWaitStrict = s3_loadOutBits_uop_cf_loadWaitStrict; // @[LoadUnit.scala 1208:24 1210:23]
  assign io_lsq_loadIn_bits_uop_cf_ftqPtr_flag = s3_loadOutBits_uop_cf_ftqPtr_flag; // @[LoadUnit.scala 1208:24 1210:23]
  assign io_lsq_loadIn_bits_uop_cf_ftqPtr_value = s3_loadOutBits_uop_cf_ftqPtr_value; // @[LoadUnit.scala 1208:24 1210:23]
  assign io_lsq_loadIn_bits_uop_cf_ftqOffset = s3_loadOutBits_uop_cf_ftqOffset; // @[LoadUnit.scala 1208:24 1210:23]
  assign io_lsq_loadIn_bits_uop_ctrl_fuType = s3_loadOutBits_uop_ctrl_fuType; // @[LoadUnit.scala 1208:24 1210:23]
  assign io_lsq_loadIn_bits_uop_ctrl_fuOpType = s3_loadOutBits_uop_ctrl_fuOpType; // @[LoadUnit.scala 1208:24 1210:23]
  assign io_lsq_loadIn_bits_uop_ctrl_rfWen = s3_loadOutBits_uop_ctrl_rfWen; // @[LoadUnit.scala 1208:24 1210:23]
  assign io_lsq_loadIn_bits_uop_ctrl_fpWen = s3_loadOutBits_uop_ctrl_fpWen; // @[LoadUnit.scala 1208:24 1210:23]
  assign io_lsq_loadIn_bits_uop_ctrl_replayInst = s3_forwardFail | s3_ldld_replayFromFetch; // @[LoadUnit.scala 1181:38]
  assign io_lsq_loadIn_bits_uop_pdest = s3_loadOutBits_uop_pdest; // @[LoadUnit.scala 1208:24 1210:23]
  assign io_lsq_loadIn_bits_uop_robIdx_flag = s3_loadOutBits_uop_robIdx_flag; // @[LoadUnit.scala 1208:24 1210:23]
  assign io_lsq_loadIn_bits_uop_robIdx_value = s3_loadOutBits_uop_robIdx_value; // @[LoadUnit.scala 1208:24 1210:23]
  assign io_lsq_loadIn_bits_uop_lqIdx_flag = s3_loadOutBits_uop_lqIdx_flag; // @[LoadUnit.scala 1208:24 1210:23]
  assign io_lsq_loadIn_bits_uop_lqIdx_value = s3_loadOutBits_uop_lqIdx_value; // @[LoadUnit.scala 1208:24 1210:23]
  assign io_lsq_loadIn_bits_uop_sqIdx_flag = s3_loadOutBits_uop_sqIdx_flag; // @[LoadUnit.scala 1208:24 1210:23]
  assign io_lsq_loadIn_bits_uop_sqIdx_value = s3_loadOutBits_uop_sqIdx_value; // @[LoadUnit.scala 1208:24 1210:23]
  assign io_lsq_loadIn_bits_vaddr = s3_loadOutBits_vaddr; // @[LoadUnit.scala 1128:22]
  assign io_lsq_loadIn_bits_paddr = s3_loadOutBits_paddr; // @[LoadUnit.scala 1128:22]
  assign io_lsq_loadIn_bits_mask = s3_loadOutBits_mask; // @[LoadUnit.scala 1128:22]
  assign io_lsq_loadIn_bits_miss = s3_loadOutBits_miss; // @[LoadUnit.scala 1128:22]
  assign io_lsq_loadIn_bits_tlbMiss = s3_loadOutBits_tlbMiss; // @[LoadUnit.scala 1128:22]
  assign io_lsq_loadIn_bits_mmio = s3_loadOutBits_mmio; // @[LoadUnit.scala 1128:22]
  assign io_lsq_loadIn_bits_rarAllocated = s3_loadOutBits_rarAllocated | rarAllocated; // @[LoadUnit.scala 1157:66]
  assign io_lsq_loadIn_bits_rarIndex = s3_loadOutBits_rarAllocated ? s3_loadOutBits_rarIndex :
    io_lsq_loadLoadViolationQuery_resp_bits_index; // @[LoadUnit.scala 1158:37]
  assign io_lsq_loadIn_bits_rawAllocated = s3_loadOutBits_rawAllocated | rawAllocated; // @[LoadUnit.scala 1159:66]
  assign io_lsq_loadIn_bits_rawIndex = s3_loadOutBits_rawAllocated ? s3_loadOutBits_rawIndex :
    io_lsq_storeLoadViolationQuery_resp_bits_index; // @[LoadUnit.scala 1160:37]
  assign io_lsq_loadIn_bits_canAccept = io_lsq_loadLoadViolationQuery_resp_bits_canAccept &
    io_lsq_storeLoadViolationQuery_resp_bits_canAccept; // @[LoadUnit.scala 1152:48]
  assign io_lsq_loadIn_bits_replayInfo_missMSHRId = s3_loadOutBits_replayInfo_missMSHRId; // @[LoadUnit.scala 1128:22]
  assign io_lsq_loadIn_bits_replayInfo_canForwardFullData = s3_loadOutBits_replayInfo_canForwardFullData; // @[LoadUnit.scala 1128:22]
  assign io_lsq_loadIn_bits_replayInfo_dataInvalidSqIdx_flag = s3_loadOutBits_replayInfo_dataInvalidSqIdx_flag; // @[LoadUnit.scala 1128:22]
  assign io_lsq_loadIn_bits_replayInfo_dataInvalidSqIdx_value = s3_loadOutBits_replayInfo_dataInvalidSqIdx_value; // @[LoadUnit.scala 1128:22]
  assign io_lsq_loadIn_bits_replayInfo_addrInvalidSqIdx_flag = s3_loadOutBits_replayInfo_addrInvalidSqIdx_flag; // @[LoadUnit.scala 1128:22]
  assign io_lsq_loadIn_bits_replayInfo_addrInvalidSqIdx_value = s3_loadOutBits_replayInfo_addrInvalidSqIdx_value; // @[LoadUnit.scala 1128:22]
  assign io_lsq_loadIn_bits_replayInfo_replayCarry_real_way_en = s3_loadOutBits_replayInfo_replayCarry_real_way_en; // @[LoadUnit.scala 1128:22]
  assign io_lsq_loadIn_bits_replayInfo_replayCarry_valid = s3_loadOutBits_replayInfo_replayCarry_valid; // @[LoadUnit.scala 1128:22]
  assign io_lsq_loadIn_bits_replayInfo_dataInLastBeat = s3_loadOutBits_replayInfo_dataInLastBeat; // @[LoadUnit.scala 1128:22]
  assign io_lsq_loadIn_bits_replayInfo_cause_0 = (s3_exception | s3_delayedLoadError) & ~s3_forceReplay ? 1'h0 :
    s3_selReplayCause[0]; // @[LoadUnit.scala 1200:67 1201:41 1203:41]
  assign io_lsq_loadIn_bits_replayInfo_cause_1 = (s3_exception | s3_delayedLoadError) & ~s3_forceReplay ? 1'h0 :
    s3_selReplayCause[1]; // @[LoadUnit.scala 1200:67 1201:41 1203:41]
  assign io_lsq_loadIn_bits_replayInfo_cause_2 = (s3_exception | s3_delayedLoadError) & ~s3_forceReplay ? 1'h0 :
    s3_selReplayCause[2]; // @[LoadUnit.scala 1200:67 1201:41 1203:41]
  assign io_lsq_loadIn_bits_replayInfo_cause_3 = (s3_exception | s3_delayedLoadError) & ~s3_forceReplay ? 1'h0 :
    s3_selReplayCause[3]; // @[LoadUnit.scala 1200:67 1201:41 1203:41]
  assign io_lsq_loadIn_bits_replayInfo_cause_4 = (s3_exception | s3_delayedLoadError) & ~s3_forceReplay ? 1'h0 :
    s3_selReplayCause[4]; // @[LoadUnit.scala 1200:67 1201:41 1203:41]
  assign io_lsq_loadIn_bits_replayInfo_cause_5 = (s3_exception | s3_delayedLoadError) & ~s3_forceReplay ? 1'h0 :
    s3_selReplayCause[5]; // @[LoadUnit.scala 1200:67 1201:41 1203:41]
  assign io_lsq_loadIn_bits_replayInfo_cause_6 = (s3_exception | s3_delayedLoadError) & ~s3_forceReplay ? 1'h0 :
    s3_selReplayCause[6]; // @[LoadUnit.scala 1200:67 1201:41 1203:41]
  assign io_lsq_loadIn_bits_replayInfo_cause_7 = (s3_exception | s3_delayedLoadError) & ~s3_forceReplay ? 1'h0 :
    s3_selReplayCause[7]; // @[LoadUnit.scala 1200:67 1201:41 1203:41]
  assign io_lsq_loadIn_bits_lqDataWenDup_1 = s3_loadValidVec[1]; // @[LoadUnit.scala 1135:54]
  assign io_lsq_loadIn_bits_lqDataWenDup_2 = s3_loadValidVec[2]; // @[LoadUnit.scala 1135:54]
  assign io_lsq_loadIn_bits_lqDataWenDup_3 = s3_loadValidVec[3]; // @[LoadUnit.scala 1135:54]
  assign io_lsq_loadIn_bits_lqDataWenDup_5 = s3_loadValidVec[5]; // @[LoadUnit.scala 1135:54]
  assign io_lsq_loadOut_ready = ~hitLoadOut_valid; // @[LoadUnit.scala 1298:27]
  assign io_lsq_forward_vaddr = load_s1_io_lsq_vaddr; // @[LoadUnit.scala 959:18]
  assign io_lsq_forward_paddr = load_s1_io_lsq_paddr; // @[LoadUnit.scala 959:18]
  assign io_lsq_forward_uop_cf_waitForRobIdx_flag = load_s1_io_lsq_uop_cf_waitForRobIdx_flag; // @[LoadUnit.scala 959:18]
  assign io_lsq_forward_uop_cf_waitForRobIdx_value = load_s1_io_lsq_uop_cf_waitForRobIdx_value; // @[LoadUnit.scala 959:18]
  assign io_lsq_forward_uop_sqIdx_flag = load_s1_io_lsq_uop_sqIdx_flag; // @[LoadUnit.scala 959:18]
  assign io_lsq_forward_uop_sqIdx_value = load_s1_io_lsq_uop_sqIdx_value; // @[LoadUnit.scala 959:18]
  assign io_lsq_forward_valid = load_s1_io_lsq_valid; // @[LoadUnit.scala 959:18]
  assign io_lsq_forward_sqIdx_flag = load_s1_io_lsq_sqIdx_flag; // @[LoadUnit.scala 959:18]
  assign io_lsq_forward_sqIdxMask = s1_tryPointerChasing ? _io_lsq_forward_sqIdxMask_T_3 : sqIdxMaskReg; // @[LoadUnit.scala 1083:28 1085:33 1086:32]
  assign io_lsq_storeLoadViolationQuery_req_valid = load_s2_io_storeLoadViolationQueryReq_valid; // @[LoadUnit.scala 1075:41]
  assign io_lsq_storeLoadViolationQuery_req_bits_uop_cf_foldpc =
    load_s2_io_storeLoadViolationQueryReq_bits_uop_cf_foldpc; // @[LoadUnit.scala 1075:41]
  assign io_lsq_storeLoadViolationQuery_req_bits_uop_cf_ftqPtr_flag =
    load_s2_io_storeLoadViolationQueryReq_bits_uop_cf_ftqPtr_flag; // @[LoadUnit.scala 1075:41]
  assign io_lsq_storeLoadViolationQuery_req_bits_uop_cf_ftqPtr_value =
    load_s2_io_storeLoadViolationQueryReq_bits_uop_cf_ftqPtr_value; // @[LoadUnit.scala 1075:41]
  assign io_lsq_storeLoadViolationQuery_req_bits_uop_cf_ftqOffset =
    load_s2_io_storeLoadViolationQueryReq_bits_uop_cf_ftqOffset; // @[LoadUnit.scala 1075:41]
  assign io_lsq_storeLoadViolationQuery_req_bits_uop_robIdx_flag =
    load_s2_io_storeLoadViolationQueryReq_bits_uop_robIdx_flag; // @[LoadUnit.scala 1075:41]
  assign io_lsq_storeLoadViolationQuery_req_bits_uop_robIdx_value =
    load_s2_io_storeLoadViolationQueryReq_bits_uop_robIdx_value; // @[LoadUnit.scala 1075:41]
  assign io_lsq_storeLoadViolationQuery_req_bits_uop_sqIdx_flag =
    load_s2_io_storeLoadViolationQueryReq_bits_uop_sqIdx_flag; // @[LoadUnit.scala 1075:41]
  assign io_lsq_storeLoadViolationQuery_req_bits_uop_sqIdx_value =
    load_s2_io_storeLoadViolationQueryReq_bits_uop_sqIdx_value; // @[LoadUnit.scala 1075:41]
  assign io_lsq_storeLoadViolationQuery_req_bits_index = load_s2_io_storeLoadViolationQueryReq_bits_index; // @[LoadUnit.scala 1075:41]
  assign io_lsq_storeLoadViolationQuery_req_bits_allocated = load_s2_io_storeLoadViolationQueryReq_bits_allocated; // @[LoadUnit.scala 1075:41]
  assign io_lsq_storeLoadViolationQuery_req_bits_datavalid = load_s2_io_storeLoadViolationQueryReq_bits_datavalid; // @[LoadUnit.scala 1075:41]
  assign io_lsq_storeLoadViolationQuery_req_bits_mask = load_s2_io_storeLoadViolationQueryReq_bits_mask; // @[LoadUnit.scala 1075:41]
  assign io_lsq_storeLoadViolationQuery_req_bits_paddr = load_s2_io_storeLoadViolationQueryReq_bits_paddr; // @[LoadUnit.scala 1075:41]
  assign io_lsq_loadLoadViolationQuery_req_valid = load_s2_io_loadLoadViolationQueryReq_valid; // @[LoadUnit.scala 1074:40]
  assign io_lsq_loadLoadViolationQuery_req_bits_uop_robIdx_flag =
    load_s2_io_loadLoadViolationQueryReq_bits_uop_robIdx_flag; // @[LoadUnit.scala 1074:40]
  assign io_lsq_loadLoadViolationQuery_req_bits_uop_robIdx_value =
    load_s2_io_loadLoadViolationQueryReq_bits_uop_robIdx_value; // @[LoadUnit.scala 1074:40]
  assign io_lsq_loadLoadViolationQuery_req_bits_uop_lqIdx_flag =
    load_s2_io_loadLoadViolationQueryReq_bits_uop_lqIdx_flag; // @[LoadUnit.scala 1074:40]
  assign io_lsq_loadLoadViolationQuery_req_bits_uop_lqIdx_value =
    load_s2_io_loadLoadViolationQueryReq_bits_uop_lqIdx_value; // @[LoadUnit.scala 1074:40]
  assign io_lsq_loadLoadViolationQuery_req_bits_index = load_s2_io_loadLoadViolationQueryReq_bits_index; // @[LoadUnit.scala 1074:40]
  assign io_lsq_loadLoadViolationQuery_req_bits_allocated = load_s2_io_loadLoadViolationQueryReq_bits_allocated; // @[LoadUnit.scala 1074:40]
  assign io_lsq_loadLoadViolationQuery_req_bits_datavalid = load_s2_io_loadLoadViolationQueryReq_bits_datavalid; // @[LoadUnit.scala 1074:40]
  assign io_lsq_loadLoadViolationQuery_req_bits_miss = load_s2_io_loadLoadViolationQueryReq_bits_miss; // @[LoadUnit.scala 1074:40]
  assign io_lsq_loadLoadViolationQuery_req_bits_paddr = load_s2_io_loadLoadViolationQueryReq_bits_paddr; // @[LoadUnit.scala 1074:40]
  assign io_lsq_trigger_hitLoadAddrTriggerHitVec_0 = hitLoadAddrTriggerHitVec_0_res & tEnable; // @[Trigger.scala 34:9]
  assign io_lsq_trigger_hitLoadAddrTriggerHitVec_1 = hitLoadAddrTriggerHitVec_1_res & tEnable_1; // @[Trigger.scala 34:9]
  assign io_lsq_trigger_hitLoadAddrTriggerHitVec_2 = hitLoadAddrTriggerHitVec_2_res & tEnable_2; // @[Trigger.scala 34:9]
  assign io_forward_mshr_valid = load_s1_io_out_valid & load_s1_io_out_bits_forward_tlDchannel; // @[LoadUnit.scala 1026:49]
  assign io_forward_mshr_mshrid = load_s1_io_out_bits_mshrid; // @[LoadUnit.scala 1027:26]
  assign io_forward_mshr_paddr = load_s1_io_out_bits_paddr; // @[LoadUnit.scala 1028:25]
  assign io_trigger_0_addrHit = hitLoadOut_valid ? hitLoadAddrTriggerHitVec_0 : io_lsq_trigger_lqLoadAddrTriggerHitVec_0
    ; // @[LoadUnit.scala 1315:33]
  assign io_trigger_1_addrHit = hitLoadOut_valid ? hitLoadAddrTriggerHitVec_1 : io_lsq_trigger_lqLoadAddrTriggerHitVec_1
    ; // @[LoadUnit.scala 1315:33]
  assign io_trigger_2_addrHit = hitLoadOut_valid ? hitLoadAddrTriggerHitVec_2 : io_lsq_trigger_lqLoadAddrTriggerHitVec_2
    ; // @[LoadUnit.scala 1315:33]
  assign io_tlb_req_valid = load_s0_io_dtlbReq_valid; // @[LoadUnit.scala 931:22]
  assign io_tlb_req_bits_vaddr = load_s0_io_dtlbReq_bits_vaddr; // @[LoadUnit.scala 931:22]
  assign io_tlb_req_bits_cmd = load_s0_io_dtlbReq_bits_cmd; // @[LoadUnit.scala 931:22]
  assign io_tlb_req_bits_no_translate = load_s0_io_dtlbReq_bits_no_translate; // @[LoadUnit.scala 931:22]
  assign io_tlb_req_kill = load_s1_io_s1_kill; // @[LoadUnit.scala 953:19]
  assign io_fastpathOut_data = _io_fastpathOut_data_T_4[63:0]; // @[LoadUnit.scala 1302:23]
  assign io_fastpathOut_valid = io_fastpathOut_valid_REG & ~s3_exception; // @[LoadUnit.scala 1301:57]
  assign io_correctTableQuery_req_addr = load_s1_io_correctTableQueryReq_addr; // @[LoadUnit.scala 963:35]
  assign io_correctTableUpdate_valid = io_correctTableUpdate_REG_valid; // @[LoadUnit.scala 1077:25]
  assign io_correctTableUpdate_bits_addr = io_correctTableUpdate_REG_bits_addr; // @[LoadUnit.scala 1077:25]
  assign io_correctTableUpdate_bits_strict = io_correctTableUpdate_REG_bits_strict; // @[LoadUnit.scala 1077:25]
  assign io_correctTableUpdate_bits_violation = io_correctTableUpdate_REG_bits_violation; // @[LoadUnit.scala 1077:25]
  assign io_replay_ready = load_s0_io_replay_ready; // @[LoadUnit.scala 936:21]
  assign io_perf_0_value = {{5'd0}, io_perf_0_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_1_value = {{5'd0}, io_perf_1_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_2_value = {{5'd0}, io_perf_2_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_3_value = {{5'd0}, io_perf_3_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_4_value = {{5'd0}, io_perf_4_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_5_value = {{5'd0}, io_perf_5_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_6_value = {{5'd0}, io_perf_6_value_REG_1}; // @[PerfCounterUtils.scala 188:17]
  assign load_s0_io_in_valid = io_loadIn_valid; // @[LoadUnit.scala 929:17]
  assign load_s0_io_in_bits_uop_cf_foldpc = io_loadIn_bits_uop_cf_foldpc; // @[LoadUnit.scala 929:17]
  assign load_s0_io_in_bits_uop_cf_trigger_backendEn_1 = io_loadIn_bits_uop_cf_trigger_backendEn_1; // @[LoadUnit.scala 929:17]
  assign load_s0_io_in_bits_uop_cf_waitForRobIdx_flag = io_loadIn_bits_uop_cf_waitForRobIdx_flag; // @[LoadUnit.scala 929:17]
  assign load_s0_io_in_bits_uop_cf_waitForRobIdx_value = io_loadIn_bits_uop_cf_waitForRobIdx_value; // @[LoadUnit.scala 929:17]
  assign load_s0_io_in_bits_uop_cf_loadWaitBit = io_loadIn_bits_uop_cf_loadWaitBit; // @[LoadUnit.scala 929:17]
  assign load_s0_io_in_bits_uop_cf_loadWaitStrict = io_loadIn_bits_uop_cf_loadWaitStrict; // @[LoadUnit.scala 929:17]
  assign load_s0_io_in_bits_uop_cf_ftqPtr_flag = io_loadIn_bits_uop_cf_ftqPtr_flag; // @[LoadUnit.scala 929:17]
  assign load_s0_io_in_bits_uop_cf_ftqPtr_value = io_loadIn_bits_uop_cf_ftqPtr_value; // @[LoadUnit.scala 929:17]
  assign load_s0_io_in_bits_uop_cf_ftqOffset = io_loadIn_bits_uop_cf_ftqOffset; // @[LoadUnit.scala 929:17]
  assign load_s0_io_in_bits_uop_ctrl_fuType = io_loadIn_bits_uop_ctrl_fuType; // @[LoadUnit.scala 929:17]
  assign load_s0_io_in_bits_uop_ctrl_fuOpType = io_loadIn_bits_uop_ctrl_fuOpType; // @[LoadUnit.scala 929:17]
  assign load_s0_io_in_bits_uop_ctrl_rfWen = io_loadIn_bits_uop_ctrl_rfWen; // @[LoadUnit.scala 929:17]
  assign load_s0_io_in_bits_uop_ctrl_fpWen = io_loadIn_bits_uop_ctrl_fpWen; // @[LoadUnit.scala 929:17]
  assign load_s0_io_in_bits_uop_ctrl_imm = io_loadIn_bits_uop_ctrl_imm; // @[LoadUnit.scala 929:17]
  assign load_s0_io_in_bits_uop_pdest = io_loadIn_bits_uop_pdest; // @[LoadUnit.scala 929:17]
  assign load_s0_io_in_bits_uop_robIdx_flag = io_loadIn_bits_uop_robIdx_flag; // @[LoadUnit.scala 929:17]
  assign load_s0_io_in_bits_uop_robIdx_value = io_loadIn_bits_uop_robIdx_value; // @[LoadUnit.scala 929:17]
  assign load_s0_io_in_bits_uop_lqIdx_flag = io_loadIn_bits_uop_lqIdx_flag; // @[LoadUnit.scala 929:17]
  assign load_s0_io_in_bits_uop_lqIdx_value = io_loadIn_bits_uop_lqIdx_value; // @[LoadUnit.scala 929:17]
  assign load_s0_io_in_bits_uop_sqIdx_flag = io_loadIn_bits_uop_sqIdx_flag; // @[LoadUnit.scala 929:17]
  assign load_s0_io_in_bits_uop_sqIdx_value = io_loadIn_bits_uop_sqIdx_value; // @[LoadUnit.scala 929:17]
  assign load_s0_io_in_bits_src_0 = io_loadIn_bits_src_0; // @[LoadUnit.scala 929:17]
  assign load_s0_io_vec_in_valid = io_VecloadIn_valid; // @[LoadUnit.scala 930:21]
  assign load_s0_io_vec_in_bits_vaddr = io_VecloadIn_bits_vaddr; // @[LoadUnit.scala 930:21]
  assign load_s0_io_out_ready = 1'h1; // @[PipelineConnect.scala 114:31]
  assign load_s0_io_dcacheReq_ready = io_dcache_req_ready; // @[LoadUnit.scala 932:24]
  assign load_s0_io_fastpath_data = {io_fastpathIn_data[63:6],s0_pointerChasingVAddr[5:0]}; // @[Cat.scala 31:58]
  assign load_s0_io_fastpath_valid = io_fastpathIn_valid; // @[LoadUnit.scala 944:29]
  assign load_s0_io_s0_kill = cancelPointerChasing ? 1'h0 : s1_tryPointerChasing & ~io_replay_valid; // @[LoadUnit.scala 1000:33 935:22 1003:26]
  assign load_s0_io_replay_valid = io_replay_valid; // @[LoadUnit.scala 936:21]
  assign load_s0_io_replay_bits_uop_cf_foldpc = io_replay_bits_uop_cf_foldpc; // @[LoadUnit.scala 936:21]
  assign load_s0_io_replay_bits_uop_cf_trigger_backendEn_1 = io_replay_bits_uop_cf_trigger_backendEn_1; // @[LoadUnit.scala 936:21]
  assign load_s0_io_replay_bits_uop_cf_trigger_backendHit_0 = io_replay_bits_uop_cf_trigger_backendHit_0; // @[LoadUnit.scala 936:21]
  assign load_s0_io_replay_bits_uop_cf_trigger_backendHit_1 = io_replay_bits_uop_cf_trigger_backendHit_1; // @[LoadUnit.scala 936:21]
  assign load_s0_io_replay_bits_uop_cf_trigger_backendHit_4 = io_replay_bits_uop_cf_trigger_backendHit_4; // @[LoadUnit.scala 936:21]
  assign load_s0_io_replay_bits_uop_cf_waitForRobIdx_flag = io_replay_bits_uop_cf_waitForRobIdx_flag; // @[LoadUnit.scala 936:21]
  assign load_s0_io_replay_bits_uop_cf_waitForRobIdx_value = io_replay_bits_uop_cf_waitForRobIdx_value; // @[LoadUnit.scala 936:21]
  assign load_s0_io_replay_bits_uop_cf_loadWaitBit = io_replay_bits_uop_cf_loadWaitBit; // @[LoadUnit.scala 936:21]
  assign load_s0_io_replay_bits_uop_cf_loadWaitStrict = io_replay_bits_uop_cf_loadWaitStrict; // @[LoadUnit.scala 936:21]
  assign load_s0_io_replay_bits_uop_cf_ftqPtr_flag = io_replay_bits_uop_cf_ftqPtr_flag; // @[LoadUnit.scala 936:21]
  assign load_s0_io_replay_bits_uop_cf_ftqPtr_value = io_replay_bits_uop_cf_ftqPtr_value; // @[LoadUnit.scala 936:21]
  assign load_s0_io_replay_bits_uop_cf_ftqOffset = io_replay_bits_uop_cf_ftqOffset; // @[LoadUnit.scala 936:21]
  assign load_s0_io_replay_bits_uop_ctrl_fuType = io_replay_bits_uop_ctrl_fuType; // @[LoadUnit.scala 936:21]
  assign load_s0_io_replay_bits_uop_ctrl_fuOpType = io_replay_bits_uop_ctrl_fuOpType; // @[LoadUnit.scala 936:21]
  assign load_s0_io_replay_bits_uop_ctrl_rfWen = io_replay_bits_uop_ctrl_rfWen; // @[LoadUnit.scala 936:21]
  assign load_s0_io_replay_bits_uop_ctrl_fpWen = io_replay_bits_uop_ctrl_fpWen; // @[LoadUnit.scala 936:21]
  assign load_s0_io_replay_bits_uop_pdest = io_replay_bits_uop_pdest; // @[LoadUnit.scala 936:21]
  assign load_s0_io_replay_bits_uop_robIdx_flag = io_replay_bits_uop_robIdx_flag; // @[LoadUnit.scala 936:21]
  assign load_s0_io_replay_bits_uop_robIdx_value = io_replay_bits_uop_robIdx_value; // @[LoadUnit.scala 936:21]
  assign load_s0_io_replay_bits_uop_lqIdx_flag = io_replay_bits_uop_lqIdx_flag; // @[LoadUnit.scala 936:21]
  assign load_s0_io_replay_bits_uop_lqIdx_value = io_replay_bits_uop_lqIdx_value; // @[LoadUnit.scala 936:21]
  assign load_s0_io_replay_bits_uop_sqIdx_flag = io_replay_bits_uop_sqIdx_flag; // @[LoadUnit.scala 936:21]
  assign load_s0_io_replay_bits_uop_sqIdx_value = io_replay_bits_uop_sqIdx_value; // @[LoadUnit.scala 936:21]
  assign load_s0_io_replay_bits_vaddr = io_replay_bits_vaddr; // @[LoadUnit.scala 936:21]
  assign load_s0_io_replay_bits_isFirstIssue = io_replay_bits_isFirstIssue; // @[LoadUnit.scala 936:21]
  assign load_s0_io_replay_bits_replayCarry_real_way_en = io_replay_bits_replayCarry_real_way_en; // @[LoadUnit.scala 936:21]
  assign load_s0_io_replay_bits_replayCarry_valid = io_replay_bits_replayCarry_valid; // @[LoadUnit.scala 936:21]
  assign load_s0_io_replay_bits_mshrid = io_replay_bits_mshrid; // @[LoadUnit.scala 936:21]
  assign load_s0_io_replay_bits_forward_tlDchannel = io_replay_bits_forward_tlDchannel; // @[LoadUnit.scala 936:21]
  assign load_s0_io_replay_bits_rarAllocated = io_replay_bits_rarAllocated; // @[LoadUnit.scala 936:21]
  assign load_s0_io_replay_bits_rarIndex = io_replay_bits_rarIndex; // @[LoadUnit.scala 936:21]
  assign load_s0_io_replay_bits_rawAllocated = io_replay_bits_rawAllocated; // @[LoadUnit.scala 936:21]
  assign load_s0_io_replay_bits_rawIndex = io_replay_bits_rawIndex; // @[LoadUnit.scala 936:21]
  assign load_s0_io_lqReplayFull = io_lqReplayFull; // @[LoadUnit.scala 937:27]
  assign load_s1_io_in_valid = s1_data_valid; // @[PipelineConnect.scala 117:17]
  assign load_s1_io_in_bits_uop_cf_foldpc = s1_tryPointerChasing ? io_loadIn_bits_uop_cf_foldpc : s1_data_uop_cf_foldpc; // @[LoadUnit.scala 986:33 988:30 PipelineConnect.scala 116:16]
  assign load_s1_io_in_bits_uop_cf_exceptionVec_4 = s1_tryPointerChasing ? 1'h0 : s1_data_uop_cf_exceptionVec_4; // @[LoadUnit.scala 986:33 988:30 PipelineConnect.scala 116:16]
  assign load_s1_io_in_bits_uop_cf_trigger_backendEn_1 = s1_tryPointerChasing ?
    io_loadIn_bits_uop_cf_trigger_backendEn_1 : s1_data_uop_cf_trigger_backendEn_1; // @[LoadUnit.scala 986:33 988:30 PipelineConnect.scala 116:16]
  assign load_s1_io_in_bits_uop_cf_trigger_backendHit_0 = s1_tryPointerChasing ? 1'h0 :
    s1_data_uop_cf_trigger_backendHit_0; // @[LoadUnit.scala 986:33 988:30 PipelineConnect.scala 116:16]
  assign load_s1_io_in_bits_uop_cf_trigger_backendHit_1 = s1_tryPointerChasing ? 1'h0 :
    s1_data_uop_cf_trigger_backendHit_1; // @[LoadUnit.scala 986:33 988:30 PipelineConnect.scala 116:16]
  assign load_s1_io_in_bits_uop_cf_trigger_backendHit_4 = s1_tryPointerChasing ? 1'h0 :
    s1_data_uop_cf_trigger_backendHit_4; // @[LoadUnit.scala 986:33 988:30 PipelineConnect.scala 116:16]
  assign load_s1_io_in_bits_uop_cf_waitForRobIdx_flag = s1_tryPointerChasing ? io_loadIn_bits_uop_cf_waitForRobIdx_flag
     : s1_data_uop_cf_waitForRobIdx_flag; // @[LoadUnit.scala 986:33 988:30 PipelineConnect.scala 116:16]
  assign load_s1_io_in_bits_uop_cf_waitForRobIdx_value = s1_tryPointerChasing ?
    io_loadIn_bits_uop_cf_waitForRobIdx_value : s1_data_uop_cf_waitForRobIdx_value; // @[LoadUnit.scala 986:33 988:30 PipelineConnect.scala 116:16]
  assign load_s1_io_in_bits_uop_cf_loadWaitBit = s1_tryPointerChasing ? io_loadIn_bits_uop_cf_loadWaitBit :
    s1_data_uop_cf_loadWaitBit; // @[LoadUnit.scala 986:33 988:30 PipelineConnect.scala 116:16]
  assign load_s1_io_in_bits_uop_cf_loadWaitStrict = s1_tryPointerChasing ? io_loadIn_bits_uop_cf_loadWaitStrict :
    s1_data_uop_cf_loadWaitStrict; // @[LoadUnit.scala 986:33 988:30 PipelineConnect.scala 116:16]
  assign load_s1_io_in_bits_uop_cf_ftqPtr_flag = s1_tryPointerChasing ? io_loadIn_bits_uop_cf_ftqPtr_flag :
    s1_data_uop_cf_ftqPtr_flag; // @[LoadUnit.scala 986:33 988:30 PipelineConnect.scala 116:16]
  assign load_s1_io_in_bits_uop_cf_ftqPtr_value = s1_tryPointerChasing ? io_loadIn_bits_uop_cf_ftqPtr_value :
    s1_data_uop_cf_ftqPtr_value; // @[LoadUnit.scala 986:33 988:30 PipelineConnect.scala 116:16]
  assign load_s1_io_in_bits_uop_cf_ftqOffset = s1_tryPointerChasing ? io_loadIn_bits_uop_cf_ftqOffset :
    s1_data_uop_cf_ftqOffset; // @[LoadUnit.scala 986:33 988:30 PipelineConnect.scala 116:16]
  assign load_s1_io_in_bits_uop_ctrl_fuType = s1_tryPointerChasing ? io_loadIn_bits_uop_ctrl_fuType :
    s1_data_uop_ctrl_fuType; // @[LoadUnit.scala 986:33 988:30 PipelineConnect.scala 116:16]
  assign load_s1_io_in_bits_uop_ctrl_fuOpType = s1_tryPointerChasing ? io_loadIn_bits_uop_ctrl_fuOpType :
    s1_data_uop_ctrl_fuOpType; // @[LoadUnit.scala 986:33 988:30 PipelineConnect.scala 116:16]
  assign load_s1_io_in_bits_uop_ctrl_rfWen = s1_tryPointerChasing ? io_loadIn_bits_uop_ctrl_rfWen :
    s1_data_uop_ctrl_rfWen; // @[LoadUnit.scala 986:33 988:30 PipelineConnect.scala 116:16]
  assign load_s1_io_in_bits_uop_ctrl_fpWen = s1_tryPointerChasing ? io_loadIn_bits_uop_ctrl_fpWen :
    s1_data_uop_ctrl_fpWen; // @[LoadUnit.scala 986:33 988:30 PipelineConnect.scala 116:16]
  assign load_s1_io_in_bits_uop_pdest = s1_tryPointerChasing ? io_loadIn_bits_uop_pdest : s1_data_uop_pdest; // @[LoadUnit.scala 986:33 988:30 PipelineConnect.scala 116:16]
  assign load_s1_io_in_bits_uop_robIdx_flag = s1_tryPointerChasing ? io_loadIn_bits_uop_robIdx_flag :
    s1_data_uop_robIdx_flag; // @[LoadUnit.scala 986:33 988:30 PipelineConnect.scala 116:16]
  assign load_s1_io_in_bits_uop_robIdx_value = s1_tryPointerChasing ? io_loadIn_bits_uop_robIdx_value :
    s1_data_uop_robIdx_value; // @[LoadUnit.scala 986:33 988:30 PipelineConnect.scala 116:16]
  assign load_s1_io_in_bits_uop_lqIdx_flag = s1_tryPointerChasing ? io_loadIn_bits_uop_lqIdx_flag :
    s1_data_uop_lqIdx_flag; // @[LoadUnit.scala 986:33 988:30 PipelineConnect.scala 116:16]
  assign load_s1_io_in_bits_uop_lqIdx_value = s1_tryPointerChasing ? io_loadIn_bits_uop_lqIdx_value :
    s1_data_uop_lqIdx_value; // @[LoadUnit.scala 986:33 988:30 PipelineConnect.scala 116:16]
  assign load_s1_io_in_bits_uop_sqIdx_flag = s1_tryPointerChasing ? io_loadIn_bits_uop_sqIdx_flag :
    s1_data_uop_sqIdx_flag; // @[LoadUnit.scala 986:33 988:30 PipelineConnect.scala 116:16]
  assign load_s1_io_in_bits_uop_sqIdx_value = s1_tryPointerChasing ? io_loadIn_bits_uop_sqIdx_value :
    s1_data_uop_sqIdx_value; // @[LoadUnit.scala 986:33 988:30 PipelineConnect.scala 116:16]
  assign load_s1_io_in_bits_vaddr = s1_tryPointerChasing ? vaddr : s1_data_vaddr; // @[LoadUnit.scala 986:33 991:32 PipelineConnect.scala 116:16]
  assign load_s1_io_in_bits_mask = s1_data_mask; // @[PipelineConnect.scala 116:16]
  assign load_s1_io_in_bits_isPrefetch = s1_data_isPrefetch; // @[PipelineConnect.scala 116:16]
  assign load_s1_io_in_bits_isHWPrefetch = s1_data_isHWPrefetch; // @[PipelineConnect.scala 116:16]
  assign load_s1_io_in_bits_vec128bit = s1_data_vec128bit; // @[PipelineConnect.scala 116:16]
  assign load_s1_io_in_bits_isFirstIssue = s1_tryPointerChasing | s1_data_isFirstIssue; // @[LoadUnit.scala 986:33 992:39 PipelineConnect.scala 116:16]
  assign load_s1_io_in_bits_mshrid = s1_data_mshrid; // @[PipelineConnect.scala 116:16]
  assign load_s1_io_in_bits_forward_tlDchannel = s1_data_forward_tlDchannel; // @[PipelineConnect.scala 116:16]
  assign load_s1_io_in_bits_rarAllocated = s1_data_rarAllocated; // @[PipelineConnect.scala 116:16]
  assign load_s1_io_in_bits_rarIndex = s1_data_rarIndex; // @[PipelineConnect.scala 116:16]
  assign load_s1_io_in_bits_rawAllocated = s1_data_rawAllocated; // @[PipelineConnect.scala 116:16]
  assign load_s1_io_in_bits_rawIndex = s1_data_rawIndex; // @[PipelineConnect.scala 116:16]
  assign load_s1_io_s1_kill = cancelPointerChasing | load_s1_io_s1_kill_r; // @[LoadUnit.scala 1000:33 1001:26 952:22]
  assign load_s1_io_dtlbResp_bits_paddr_0 = s1_tryPointerChasing ? _load_s1_io_dtlbResp_bits_paddr_0_T_2 :
    io_tlb_resp_bits_paddr_0; // @[LoadUnit.scala 954:23 986:33 995:48]
  assign load_s1_io_dtlbResp_bits_paddr_1 = s1_tryPointerChasing ? _load_s1_io_dtlbResp_bits_paddr_0_T_2 :
    io_tlb_resp_bits_paddr_1; // @[LoadUnit.scala 954:23 986:33 995:48]
  assign load_s1_io_dtlbResp_bits_miss = io_tlb_resp_bits_miss; // @[LoadUnit.scala 954:23]
  assign load_s1_io_dtlbResp_bits_excp_0_pf_ld = io_tlb_resp_bits_excp_0_pf_ld; // @[LoadUnit.scala 954:23]
  assign load_s1_io_dtlbResp_bits_excp_0_af_ld = io_tlb_resp_bits_excp_0_af_ld; // @[LoadUnit.scala 954:23]
  assign load_s1_io_dcacheBankConflict = io_dcache_s1_bank_conflict; // @[LoadUnit.scala 960:33]
  assign load_s1_io_reExecuteQuery_0_valid = io_reExecuteQuery_0_valid; // @[LoadUnit.scala 962:29]
  assign load_s1_io_reExecuteQuery_0_bits_robIdx_flag = io_reExecuteQuery_0_bits_robIdx_flag; // @[LoadUnit.scala 962:29]
  assign load_s1_io_reExecuteQuery_0_bits_robIdx_value = io_reExecuteQuery_0_bits_robIdx_value; // @[LoadUnit.scala 962:29]
  assign load_s1_io_reExecuteQuery_0_bits_paddr = io_reExecuteQuery_0_bits_paddr; // @[LoadUnit.scala 962:29]
  assign load_s1_io_reExecuteQuery_0_bits_mask = io_reExecuteQuery_0_bits_mask; // @[LoadUnit.scala 962:29]
  assign load_s1_io_reExecuteQuery_1_valid = io_reExecuteQuery_1_valid; // @[LoadUnit.scala 962:29]
  assign load_s1_io_reExecuteQuery_1_bits_robIdx_flag = io_reExecuteQuery_1_bits_robIdx_flag; // @[LoadUnit.scala 962:29]
  assign load_s1_io_reExecuteQuery_1_bits_robIdx_value = io_reExecuteQuery_1_bits_robIdx_value; // @[LoadUnit.scala 962:29]
  assign load_s1_io_reExecuteQuery_1_bits_paddr = io_reExecuteQuery_1_bits_paddr; // @[LoadUnit.scala 962:29]
  assign load_s1_io_reExecuteQuery_1_bits_mask = io_reExecuteQuery_1_bits_mask; // @[LoadUnit.scala 962:29]
  assign load_s2_clock = clock;
  assign load_s2_io_in_valid = valid; // @[PipelineConnect.scala 117:17]
  assign load_s2_io_in_bits_uop_cf_foldpc = data_uop_cf_foldpc; // @[PipelineConnect.scala 116:16]
  assign load_s2_io_in_bits_uop_cf_exceptionVec_4 = data_uop_cf_exceptionVec_4; // @[PipelineConnect.scala 116:16]
  assign load_s2_io_in_bits_uop_cf_exceptionVec_5 = data_uop_cf_exceptionVec_5; // @[PipelineConnect.scala 116:16]
  assign load_s2_io_in_bits_uop_cf_exceptionVec_13 = data_uop_cf_exceptionVec_13; // @[PipelineConnect.scala 116:16]
  assign load_s2_io_in_bits_uop_cf_trigger_backendEn_1 = data_uop_cf_trigger_backendEn_1; // @[PipelineConnect.scala 116:16]
  assign load_s2_io_in_bits_uop_cf_trigger_backendHit_0 = data_uop_cf_trigger_backendHit_0; // @[PipelineConnect.scala 116:16]
  assign load_s2_io_in_bits_uop_cf_trigger_backendHit_1 = data_uop_cf_trigger_backendHit_1; // @[PipelineConnect.scala 116:16]
  assign load_s2_io_in_bits_uop_cf_trigger_backendHit_4 = data_uop_cf_trigger_backendHit_4; // @[PipelineConnect.scala 116:16]
  assign load_s2_io_in_bits_uop_cf_waitForRobIdx_flag = data_uop_cf_waitForRobIdx_flag; // @[PipelineConnect.scala 116:16]
  assign load_s2_io_in_bits_uop_cf_waitForRobIdx_value = data_uop_cf_waitForRobIdx_value; // @[PipelineConnect.scala 116:16]
  assign load_s2_io_in_bits_uop_cf_loadWaitBit = data_uop_cf_loadWaitBit; // @[PipelineConnect.scala 116:16]
  assign load_s2_io_in_bits_uop_cf_loadWaitStrict = data_uop_cf_loadWaitStrict; // @[PipelineConnect.scala 116:16]
  assign load_s2_io_in_bits_uop_cf_ftqPtr_flag = data_uop_cf_ftqPtr_flag; // @[PipelineConnect.scala 116:16]
  assign load_s2_io_in_bits_uop_cf_ftqPtr_value = data_uop_cf_ftqPtr_value; // @[PipelineConnect.scala 116:16]
  assign load_s2_io_in_bits_uop_cf_ftqOffset = data_uop_cf_ftqOffset; // @[PipelineConnect.scala 116:16]
  assign load_s2_io_in_bits_uop_ctrl_fuType = data_uop_ctrl_fuType; // @[PipelineConnect.scala 116:16]
  assign load_s2_io_in_bits_uop_ctrl_fuOpType = data_uop_ctrl_fuOpType; // @[PipelineConnect.scala 116:16]
  assign load_s2_io_in_bits_uop_ctrl_rfWen = data_uop_ctrl_rfWen; // @[PipelineConnect.scala 116:16]
  assign load_s2_io_in_bits_uop_ctrl_fpWen = data_uop_ctrl_fpWen; // @[PipelineConnect.scala 116:16]
  assign load_s2_io_in_bits_uop_pdest = data_uop_pdest; // @[PipelineConnect.scala 116:16]
  assign load_s2_io_in_bits_uop_robIdx_flag = data_uop_robIdx_flag; // @[PipelineConnect.scala 116:16]
  assign load_s2_io_in_bits_uop_robIdx_value = data_uop_robIdx_value; // @[PipelineConnect.scala 116:16]
  assign load_s2_io_in_bits_uop_lqIdx_flag = data_uop_lqIdx_flag; // @[PipelineConnect.scala 116:16]
  assign load_s2_io_in_bits_uop_lqIdx_value = data_uop_lqIdx_value; // @[PipelineConnect.scala 116:16]
  assign load_s2_io_in_bits_uop_sqIdx_flag = data_uop_sqIdx_flag; // @[PipelineConnect.scala 116:16]
  assign load_s2_io_in_bits_uop_sqIdx_value = data_uop_sqIdx_value; // @[PipelineConnect.scala 116:16]
  assign load_s2_io_in_bits_vaddr = data_vaddr; // @[PipelineConnect.scala 116:16]
  assign load_s2_io_in_bits_paddr = data_paddr; // @[PipelineConnect.scala 116:16]
  assign load_s2_io_in_bits_mask = data_mask; // @[PipelineConnect.scala 116:16]
  assign load_s2_io_in_bits_tlbMiss = data_tlbMiss; // @[PipelineConnect.scala 116:16]
  assign load_s2_io_in_bits_isPrefetch = data_isPrefetch; // @[PipelineConnect.scala 116:16]
  assign load_s2_io_in_bits_isHWPrefetch = data_isHWPrefetch; // @[PipelineConnect.scala 116:16]
  assign load_s2_io_in_bits_vec128bit = data_vec128bit; // @[PipelineConnect.scala 116:16]
  assign load_s2_io_in_bits_isFirstIssue = data_isFirstIssue; // @[PipelineConnect.scala 116:16]
  assign load_s2_io_in_bits_rarAllocated = data_rarAllocated; // @[PipelineConnect.scala 116:16]
  assign load_s2_io_in_bits_rarIndex = data_rarIndex; // @[PipelineConnect.scala 116:16]
  assign load_s2_io_in_bits_rawAllocated = data_rawAllocated; // @[PipelineConnect.scala 116:16]
  assign load_s2_io_in_bits_rawIndex = data_rawIndex; // @[PipelineConnect.scala 116:16]
  assign load_s2_io_in_bits_replayInfo_cause_2 = data_replayInfo_cause_2; // @[PipelineConnect.scala 116:16]
  assign load_s2_io_in_bits_replayInfo_cause_4 = data_replayInfo_cause_4; // @[PipelineConnect.scala 116:16]
  assign load_s2_io_dcacheResp_bits_data_delayed = io_dcache_resp_bits_data_delayed; // @[LoadUnit.scala 1052:25]
  assign load_s2_io_dcacheResp_bits_miss = io_dcache_resp_bits_miss; // @[LoadUnit.scala 1052:25]
  assign load_s2_io_dcacheResp_bits_replay = io_dcache_resp_bits_replay; // @[LoadUnit.scala 1052:25]
  assign load_s2_io_dcacheResp_bits_replayCarry_real_way_en = io_dcache_resp_bits_replayCarry_real_way_en; // @[LoadUnit.scala 1052:25]
  assign load_s2_io_dcacheResp_bits_replayCarry_valid = io_dcache_resp_bits_replayCarry_valid; // @[LoadUnit.scala 1052:25]
  assign load_s2_io_dcacheResp_bits_tag_error = io_dcache_resp_bits_tag_error; // @[LoadUnit.scala 1052:25]
  assign load_s2_io_dcacheResp_bits_mshr_id = io_dcache_resp_bits_mshr_id; // @[LoadUnit.scala 1052:25]
  assign load_s2_io_pmpResp_ld = io_pmp_ld; // @[LoadUnit.scala 1053:22]
  assign load_s2_io_pmpResp_mmio = io_pmp_mmio; // @[LoadUnit.scala 1053:22]
  assign load_s2_io_lsq_forwardMask_0 = io_lsq_forward_forwardMask_0; // @[LoadUnit.scala 1056:30]
  assign load_s2_io_lsq_forwardMask_1 = io_lsq_forward_forwardMask_1; // @[LoadUnit.scala 1056:30]
  assign load_s2_io_lsq_forwardMask_2 = io_lsq_forward_forwardMask_2; // @[LoadUnit.scala 1056:30]
  assign load_s2_io_lsq_forwardMask_3 = io_lsq_forward_forwardMask_3; // @[LoadUnit.scala 1056:30]
  assign load_s2_io_lsq_forwardMask_4 = io_lsq_forward_forwardMask_4; // @[LoadUnit.scala 1056:30]
  assign load_s2_io_lsq_forwardMask_5 = io_lsq_forward_forwardMask_5; // @[LoadUnit.scala 1056:30]
  assign load_s2_io_lsq_forwardMask_6 = io_lsq_forward_forwardMask_6; // @[LoadUnit.scala 1056:30]
  assign load_s2_io_lsq_forwardMask_7 = io_lsq_forward_forwardMask_7; // @[LoadUnit.scala 1056:30]
  assign load_s2_io_lsq_forwardMask_8 = io_lsq_forward_forwardMask_8; // @[LoadUnit.scala 1056:30]
  assign load_s2_io_lsq_forwardMask_9 = io_lsq_forward_forwardMask_9; // @[LoadUnit.scala 1056:30]
  assign load_s2_io_lsq_forwardMask_10 = io_lsq_forward_forwardMask_10; // @[LoadUnit.scala 1056:30]
  assign load_s2_io_lsq_forwardMask_11 = io_lsq_forward_forwardMask_11; // @[LoadUnit.scala 1056:30]
  assign load_s2_io_lsq_forwardMask_12 = io_lsq_forward_forwardMask_12; // @[LoadUnit.scala 1056:30]
  assign load_s2_io_lsq_forwardMask_13 = io_lsq_forward_forwardMask_13; // @[LoadUnit.scala 1056:30]
  assign load_s2_io_lsq_forwardMask_14 = io_lsq_forward_forwardMask_14; // @[LoadUnit.scala 1056:30]
  assign load_s2_io_lsq_forwardMask_15 = io_lsq_forward_forwardMask_15; // @[LoadUnit.scala 1056:30]
  assign load_s2_io_lsq_forwardData_0 = io_lsq_forward_forwardData_0; // @[LoadUnit.scala 1055:30]
  assign load_s2_io_lsq_forwardData_1 = io_lsq_forward_forwardData_1; // @[LoadUnit.scala 1055:30]
  assign load_s2_io_lsq_forwardData_2 = io_lsq_forward_forwardData_2; // @[LoadUnit.scala 1055:30]
  assign load_s2_io_lsq_forwardData_3 = io_lsq_forward_forwardData_3; // @[LoadUnit.scala 1055:30]
  assign load_s2_io_lsq_forwardData_4 = io_lsq_forward_forwardData_4; // @[LoadUnit.scala 1055:30]
  assign load_s2_io_lsq_forwardData_5 = io_lsq_forward_forwardData_5; // @[LoadUnit.scala 1055:30]
  assign load_s2_io_lsq_forwardData_6 = io_lsq_forward_forwardData_6; // @[LoadUnit.scala 1055:30]
  assign load_s2_io_lsq_forwardData_7 = io_lsq_forward_forwardData_7; // @[LoadUnit.scala 1055:30]
  assign load_s2_io_lsq_forwardData_8 = io_lsq_forward_forwardData_8; // @[LoadUnit.scala 1055:30]
  assign load_s2_io_lsq_forwardData_9 = io_lsq_forward_forwardData_9; // @[LoadUnit.scala 1055:30]
  assign load_s2_io_lsq_forwardData_10 = io_lsq_forward_forwardData_10; // @[LoadUnit.scala 1055:30]
  assign load_s2_io_lsq_forwardData_11 = io_lsq_forward_forwardData_11; // @[LoadUnit.scala 1055:30]
  assign load_s2_io_lsq_forwardData_12 = io_lsq_forward_forwardData_12; // @[LoadUnit.scala 1055:30]
  assign load_s2_io_lsq_forwardData_13 = io_lsq_forward_forwardData_13; // @[LoadUnit.scala 1055:30]
  assign load_s2_io_lsq_forwardData_14 = io_lsq_forward_forwardData_14; // @[LoadUnit.scala 1055:30]
  assign load_s2_io_lsq_forwardData_15 = io_lsq_forward_forwardData_15; // @[LoadUnit.scala 1055:30]
  assign load_s2_io_lsq_dataInvalid = io_lsq_forward_dataInvalid; // @[LoadUnit.scala 1058:30]
  assign load_s2_io_lsq_schedWait = io_lsq_forward_schedWait; // @[LoadUnit.scala 1060:28]
  assign load_s2_io_dataInvalidSqIdx_flag = io_lsq_forward_dataInvalidSqIdx_flag; // @[LoadUnit.scala 1069:31]
  assign load_s2_io_dataInvalidSqIdx_value = io_lsq_forward_dataInvalidSqIdx_value; // @[LoadUnit.scala 1069:31]
  assign load_s2_io_addrInvalidSqIdx_flag = io_lsq_forward_addrInvalidSqIdx_flag; // @[LoadUnit.scala 1070:31]
  assign load_s2_io_addrInvalidSqIdx_value = io_lsq_forward_addrInvalidSqIdx_value; // @[LoadUnit.scala 1070:31]
  assign load_s2_io_sbuffer_forwardMask_0 = io_sbuffer_forwardMask_0; // @[LoadUnit.scala 1063:34]
  assign load_s2_io_sbuffer_forwardMask_1 = io_sbuffer_forwardMask_1; // @[LoadUnit.scala 1063:34]
  assign load_s2_io_sbuffer_forwardMask_2 = io_sbuffer_forwardMask_2; // @[LoadUnit.scala 1063:34]
  assign load_s2_io_sbuffer_forwardMask_3 = io_sbuffer_forwardMask_3; // @[LoadUnit.scala 1063:34]
  assign load_s2_io_sbuffer_forwardMask_4 = io_sbuffer_forwardMask_4; // @[LoadUnit.scala 1063:34]
  assign load_s2_io_sbuffer_forwardMask_5 = io_sbuffer_forwardMask_5; // @[LoadUnit.scala 1063:34]
  assign load_s2_io_sbuffer_forwardMask_6 = io_sbuffer_forwardMask_6; // @[LoadUnit.scala 1063:34]
  assign load_s2_io_sbuffer_forwardMask_7 = io_sbuffer_forwardMask_7; // @[LoadUnit.scala 1063:34]
  assign load_s2_io_sbuffer_forwardMask_8 = io_sbuffer_forwardMask_8; // @[LoadUnit.scala 1063:34]
  assign load_s2_io_sbuffer_forwardMask_9 = io_sbuffer_forwardMask_9; // @[LoadUnit.scala 1063:34]
  assign load_s2_io_sbuffer_forwardMask_10 = io_sbuffer_forwardMask_10; // @[LoadUnit.scala 1063:34]
  assign load_s2_io_sbuffer_forwardMask_11 = io_sbuffer_forwardMask_11; // @[LoadUnit.scala 1063:34]
  assign load_s2_io_sbuffer_forwardMask_12 = io_sbuffer_forwardMask_12; // @[LoadUnit.scala 1063:34]
  assign load_s2_io_sbuffer_forwardMask_13 = io_sbuffer_forwardMask_13; // @[LoadUnit.scala 1063:34]
  assign load_s2_io_sbuffer_forwardMask_14 = io_sbuffer_forwardMask_14; // @[LoadUnit.scala 1063:34]
  assign load_s2_io_sbuffer_forwardMask_15 = io_sbuffer_forwardMask_15; // @[LoadUnit.scala 1063:34]
  assign load_s2_io_sbuffer_forwardData_0 = io_sbuffer_forwardData_0; // @[LoadUnit.scala 1062:34]
  assign load_s2_io_sbuffer_forwardData_1 = io_sbuffer_forwardData_1; // @[LoadUnit.scala 1062:34]
  assign load_s2_io_sbuffer_forwardData_2 = io_sbuffer_forwardData_2; // @[LoadUnit.scala 1062:34]
  assign load_s2_io_sbuffer_forwardData_3 = io_sbuffer_forwardData_3; // @[LoadUnit.scala 1062:34]
  assign load_s2_io_sbuffer_forwardData_4 = io_sbuffer_forwardData_4; // @[LoadUnit.scala 1062:34]
  assign load_s2_io_sbuffer_forwardData_5 = io_sbuffer_forwardData_5; // @[LoadUnit.scala 1062:34]
  assign load_s2_io_sbuffer_forwardData_6 = io_sbuffer_forwardData_6; // @[LoadUnit.scala 1062:34]
  assign load_s2_io_sbuffer_forwardData_7 = io_sbuffer_forwardData_7; // @[LoadUnit.scala 1062:34]
  assign load_s2_io_sbuffer_forwardData_8 = io_sbuffer_forwardData_8; // @[LoadUnit.scala 1062:34]
  assign load_s2_io_sbuffer_forwardData_9 = io_sbuffer_forwardData_9; // @[LoadUnit.scala 1062:34]
  assign load_s2_io_sbuffer_forwardData_10 = io_sbuffer_forwardData_10; // @[LoadUnit.scala 1062:34]
  assign load_s2_io_sbuffer_forwardData_11 = io_sbuffer_forwardData_11; // @[LoadUnit.scala 1062:34]
  assign load_s2_io_sbuffer_forwardData_12 = io_sbuffer_forwardData_12; // @[LoadUnit.scala 1062:34]
  assign load_s2_io_sbuffer_forwardData_13 = io_sbuffer_forwardData_13; // @[LoadUnit.scala 1062:34]
  assign load_s2_io_sbuffer_forwardData_14 = io_sbuffer_forwardData_14; // @[LoadUnit.scala 1062:34]
  assign load_s2_io_sbuffer_forwardData_15 = io_sbuffer_forwardData_15; // @[LoadUnit.scala 1062:34]
  assign load_s2_io_correctTableQueryResp_strict = io_correctTableQuery_resp_strict; // @[LoadUnit.scala 1073:36]
  assign load_s2_io_csrCtrl_cache_error_enable = io_csrCtrl_cache_error_enable; // @[LoadUnit.scala 1071:22]
  assign load_s2_io_static_pm_valid = load_s2_io_static_pm_REG_valid; // @[LoadUnit.scala 1054:24]
  assign load_s2_io_static_pm_bits = load_s2_io_static_pm_REG_bits; // @[LoadUnit.scala 1054:24]
  assign load_s2_io_reExecuteQuery_0_valid = io_reExecuteQuery_0_valid; // @[LoadUnit.scala 1072:29]
  assign load_s2_io_reExecuteQuery_0_bits_robIdx_flag = io_reExecuteQuery_0_bits_robIdx_flag; // @[LoadUnit.scala 1072:29]
  assign load_s2_io_reExecuteQuery_0_bits_robIdx_value = io_reExecuteQuery_0_bits_robIdx_value; // @[LoadUnit.scala 1072:29]
  assign load_s2_io_reExecuteQuery_0_bits_paddr = io_reExecuteQuery_0_bits_paddr; // @[LoadUnit.scala 1072:29]
  assign load_s2_io_reExecuteQuery_0_bits_mask = io_reExecuteQuery_0_bits_mask; // @[LoadUnit.scala 1072:29]
  assign load_s2_io_reExecuteQuery_1_valid = io_reExecuteQuery_1_valid; // @[LoadUnit.scala 1072:29]
  assign load_s2_io_reExecuteQuery_1_bits_robIdx_flag = io_reExecuteQuery_1_bits_robIdx_flag; // @[LoadUnit.scala 1072:29]
  assign load_s2_io_reExecuteQuery_1_bits_robIdx_value = io_reExecuteQuery_1_bits_robIdx_value; // @[LoadUnit.scala 1072:29]
  assign load_s2_io_reExecuteQuery_1_bits_paddr = io_reExecuteQuery_1_bits_paddr; // @[LoadUnit.scala 1072:29]
  assign load_s2_io_reExecuteQuery_1_bits_mask = io_reExecuteQuery_1_bits_mask; // @[LoadUnit.scala 1072:29]
  assign load_s2_io_forward_D = forward_D; // @[LoadUnit.scala 1035:24]
  assign load_s2_io_forwardData_D_0 = forwardData_D_0; // @[LoadUnit.scala 1036:28]
  assign load_s2_io_forwardData_D_1 = forwardData_D_1; // @[LoadUnit.scala 1036:28]
  assign load_s2_io_forwardData_D_2 = forwardData_D_2; // @[LoadUnit.scala 1036:28]
  assign load_s2_io_forwardData_D_3 = forwardData_D_3; // @[LoadUnit.scala 1036:28]
  assign load_s2_io_forwardData_D_4 = forwardData_D_4; // @[LoadUnit.scala 1036:28]
  assign load_s2_io_forwardData_D_5 = forwardData_D_5; // @[LoadUnit.scala 1036:28]
  assign load_s2_io_forwardData_D_6 = forwardData_D_6; // @[LoadUnit.scala 1036:28]
  assign load_s2_io_forwardData_D_7 = forwardData_D_7; // @[LoadUnit.scala 1036:28]
  assign load_s2_io_forwardData_D_8 = forwardData_D_8; // @[LoadUnit.scala 1036:28]
  assign load_s2_io_forwardData_D_9 = forwardData_D_9; // @[LoadUnit.scala 1036:28]
  assign load_s2_io_forwardData_D_10 = forwardData_D_10; // @[LoadUnit.scala 1036:28]
  assign load_s2_io_forwardData_D_11 = forwardData_D_11; // @[LoadUnit.scala 1036:28]
  assign load_s2_io_forwardData_D_12 = forwardData_D_12; // @[LoadUnit.scala 1036:28]
  assign load_s2_io_forwardData_D_13 = forwardData_D_13; // @[LoadUnit.scala 1036:28]
  assign load_s2_io_forwardData_D_14 = forwardData_D_14; // @[LoadUnit.scala 1036:28]
  assign load_s2_io_forwardData_D_15 = forwardData_D_15; // @[LoadUnit.scala 1036:28]
  assign load_s2_io_forward_mshr = io_forward_mshr_forward_mshr; // @[LoadUnit.scala 1038:27]
  assign load_s2_io_forwardData_mshr_0 = io_forward_mshr_forwardData_0; // @[LoadUnit.scala 1039:31]
  assign load_s2_io_forwardData_mshr_1 = io_forward_mshr_forwardData_1; // @[LoadUnit.scala 1039:31]
  assign load_s2_io_forwardData_mshr_2 = io_forward_mshr_forwardData_2; // @[LoadUnit.scala 1039:31]
  assign load_s2_io_forwardData_mshr_3 = io_forward_mshr_forwardData_3; // @[LoadUnit.scala 1039:31]
  assign load_s2_io_forwardData_mshr_4 = io_forward_mshr_forwardData_4; // @[LoadUnit.scala 1039:31]
  assign load_s2_io_forwardData_mshr_5 = io_forward_mshr_forwardData_5; // @[LoadUnit.scala 1039:31]
  assign load_s2_io_forwardData_mshr_6 = io_forward_mshr_forwardData_6; // @[LoadUnit.scala 1039:31]
  assign load_s2_io_forwardData_mshr_7 = io_forward_mshr_forwardData_7; // @[LoadUnit.scala 1039:31]
  assign load_s2_io_forwardData_mshr_8 = io_forward_mshr_forwardData_8; // @[LoadUnit.scala 1039:31]
  assign load_s2_io_forwardData_mshr_9 = io_forward_mshr_forwardData_9; // @[LoadUnit.scala 1039:31]
  assign load_s2_io_forwardData_mshr_10 = io_forward_mshr_forwardData_10; // @[LoadUnit.scala 1039:31]
  assign load_s2_io_forwardData_mshr_11 = io_forward_mshr_forwardData_11; // @[LoadUnit.scala 1039:31]
  assign load_s2_io_forwardData_mshr_12 = io_forward_mshr_forwardData_12; // @[LoadUnit.scala 1039:31]
  assign load_s2_io_forwardData_mshr_13 = io_forward_mshr_forwardData_13; // @[LoadUnit.scala 1039:31]
  assign load_s2_io_forwardData_mshr_14 = io_forward_mshr_forwardData_14; // @[LoadUnit.scala 1039:31]
  assign load_s2_io_forwardData_mshr_15 = io_forward_mshr_forwardData_15; // @[LoadUnit.scala 1039:31]
  assign load_s2_io_forward_result_valid = io_forward_mshr_forward_result_valid; // @[LoadUnit.scala 1037:35]
  always @(posedge clock) begin
    if (s1_data_leftFire) begin // @[Reg.scala 17:18]
      s1_data_uop_cf_foldpc <= load_s0_io_out_bits_uop_cf_foldpc; // @[Reg.scala 17:22]
    end
    if (s1_data_leftFire) begin // @[Reg.scala 17:18]
      s1_data_uop_cf_exceptionVec_4 <= load_s0_io_out_bits_uop_cf_exceptionVec_4; // @[Reg.scala 17:22]
    end
    if (s1_data_leftFire) begin // @[Reg.scala 17:18]
      s1_data_uop_cf_trigger_backendEn_1 <= load_s0_io_out_bits_uop_cf_trigger_backendEn_1; // @[Reg.scala 17:22]
    end
    if (s1_data_leftFire) begin // @[Reg.scala 17:18]
      s1_data_uop_cf_trigger_backendHit_0 <= load_s0_io_out_bits_uop_cf_trigger_backendHit_0; // @[Reg.scala 17:22]
    end
    if (s1_data_leftFire) begin // @[Reg.scala 17:18]
      s1_data_uop_cf_trigger_backendHit_1 <= load_s0_io_out_bits_uop_cf_trigger_backendHit_1; // @[Reg.scala 17:22]
    end
    if (s1_data_leftFire) begin // @[Reg.scala 17:18]
      s1_data_uop_cf_trigger_backendHit_4 <= load_s0_io_out_bits_uop_cf_trigger_backendHit_4; // @[Reg.scala 17:22]
    end
    if (s1_data_leftFire) begin // @[Reg.scala 17:18]
      s1_data_uop_cf_waitForRobIdx_flag <= load_s0_io_out_bits_uop_cf_waitForRobIdx_flag; // @[Reg.scala 17:22]
    end
    if (s1_data_leftFire) begin // @[Reg.scala 17:18]
      s1_data_uop_cf_waitForRobIdx_value <= load_s0_io_out_bits_uop_cf_waitForRobIdx_value; // @[Reg.scala 17:22]
    end
    if (s1_data_leftFire) begin // @[Reg.scala 17:18]
      s1_data_uop_cf_loadWaitBit <= load_s0_io_out_bits_uop_cf_loadWaitBit; // @[Reg.scala 17:22]
    end
    if (s1_data_leftFire) begin // @[Reg.scala 17:18]
      s1_data_uop_cf_loadWaitStrict <= load_s0_io_out_bits_uop_cf_loadWaitStrict; // @[Reg.scala 17:22]
    end
    if (s1_data_leftFire) begin // @[Reg.scala 17:18]
      s1_data_uop_cf_ftqPtr_flag <= load_s0_io_out_bits_uop_cf_ftqPtr_flag; // @[Reg.scala 17:22]
    end
    if (s1_data_leftFire) begin // @[Reg.scala 17:18]
      s1_data_uop_cf_ftqPtr_value <= load_s0_io_out_bits_uop_cf_ftqPtr_value; // @[Reg.scala 17:22]
    end
    if (s1_data_leftFire) begin // @[Reg.scala 17:18]
      s1_data_uop_cf_ftqOffset <= load_s0_io_out_bits_uop_cf_ftqOffset; // @[Reg.scala 17:22]
    end
    if (s1_data_leftFire) begin // @[Reg.scala 17:18]
      s1_data_uop_ctrl_fuType <= load_s0_io_out_bits_uop_ctrl_fuType; // @[Reg.scala 17:22]
    end
    if (s1_data_leftFire) begin // @[Reg.scala 17:18]
      s1_data_uop_ctrl_fuOpType <= load_s0_io_out_bits_uop_ctrl_fuOpType; // @[Reg.scala 17:22]
    end
    if (s1_data_leftFire) begin // @[Reg.scala 17:18]
      s1_data_uop_ctrl_rfWen <= load_s0_io_out_bits_uop_ctrl_rfWen; // @[Reg.scala 17:22]
    end
    if (s1_data_leftFire) begin // @[Reg.scala 17:18]
      s1_data_uop_ctrl_fpWen <= load_s0_io_out_bits_uop_ctrl_fpWen; // @[Reg.scala 17:22]
    end
    if (s1_data_leftFire) begin // @[Reg.scala 17:18]
      s1_data_uop_pdest <= load_s0_io_out_bits_uop_pdest; // @[Reg.scala 17:22]
    end
    if (s1_data_leftFire) begin // @[Reg.scala 17:18]
      s1_data_uop_robIdx_flag <= load_s0_io_out_bits_uop_robIdx_flag; // @[Reg.scala 17:22]
    end
    if (s1_data_leftFire) begin // @[Reg.scala 17:18]
      s1_data_uop_robIdx_value <= load_s0_io_out_bits_uop_robIdx_value; // @[Reg.scala 17:22]
    end
    if (s1_data_leftFire) begin // @[Reg.scala 17:18]
      s1_data_uop_lqIdx_flag <= load_s0_io_out_bits_uop_lqIdx_flag; // @[Reg.scala 17:22]
    end
    if (s1_data_leftFire) begin // @[Reg.scala 17:18]
      s1_data_uop_lqIdx_value <= load_s0_io_out_bits_uop_lqIdx_value; // @[Reg.scala 17:22]
    end
    if (s1_data_leftFire) begin // @[Reg.scala 17:18]
      s1_data_uop_sqIdx_flag <= load_s0_io_out_bits_uop_sqIdx_flag; // @[Reg.scala 17:22]
    end
    if (s1_data_leftFire) begin // @[Reg.scala 17:18]
      s1_data_uop_sqIdx_value <= load_s0_io_out_bits_uop_sqIdx_value; // @[Reg.scala 17:22]
    end
    if (s1_data_leftFire) begin // @[Reg.scala 17:18]
      s1_data_vaddr <= load_s0_io_out_bits_vaddr; // @[Reg.scala 17:22]
    end
    if (s1_data_leftFire) begin // @[Reg.scala 17:18]
      s1_data_mask <= load_s0_io_out_bits_mask; // @[Reg.scala 17:22]
    end
    if (s1_data_leftFire) begin // @[Reg.scala 17:18]
      s1_data_isPrefetch <= load_s0_io_out_bits_isPrefetch; // @[Reg.scala 17:22]
    end
    if (s1_data_leftFire) begin // @[Reg.scala 17:18]
      s1_data_isHWPrefetch <= load_s0_io_out_bits_isHWPrefetch; // @[Reg.scala 17:22]
    end
    if (s1_data_leftFire) begin // @[Reg.scala 17:18]
      s1_data_vec128bit <= load_s0_io_out_bits_vec128bit; // @[Reg.scala 17:22]
    end
    if (s1_data_leftFire) begin // @[Reg.scala 17:18]
      s1_data_isFirstIssue <= load_s0_io_out_bits_isFirstIssue; // @[Reg.scala 17:22]
    end
    if (s1_data_leftFire) begin // @[Reg.scala 17:18]
      s1_data_mshrid <= load_s0_io_out_bits_mshrid; // @[Reg.scala 17:22]
    end
    if (s1_data_leftFire) begin // @[Reg.scala 17:18]
      s1_data_forward_tlDchannel <= load_s0_io_out_bits_forward_tlDchannel; // @[Reg.scala 17:22]
    end
    if (s1_data_leftFire) begin // @[Reg.scala 17:18]
      s1_data_rarAllocated <= load_s0_io_out_bits_rarAllocated; // @[Reg.scala 17:22]
    end
    if (s1_data_leftFire) begin // @[Reg.scala 17:18]
      s1_data_rarIndex <= load_s0_io_out_bits_rarIndex; // @[Reg.scala 17:22]
    end
    if (s1_data_leftFire) begin // @[Reg.scala 17:18]
      s1_data_rawAllocated <= load_s0_io_out_bits_rawAllocated; // @[Reg.scala 17:22]
    end
    if (s1_data_leftFire) begin // @[Reg.scala 17:18]
      s1_data_rawIndex <= load_s0_io_out_bits_rawIndex; // @[Reg.scala 17:22]
    end
    if (s0_doTryPointerChasing) begin // @[Reg.scala 17:18]
      s1_pointerChasingVAddr <= s0_pointerChasingVAddr; // @[Reg.scala 17:22]
    end
    if (s0_doTryPointerChasing) begin // @[Reg.scala 17:18]
      addressMisMatch_r <= _addressMisMatch_T_2; // @[Reg.scala 17:22]
    end
    if (load_s0_io_l2lForward_select) begin // @[Reg.scala 17:18]
      notFastMatch <= _notFastMatch_T; // @[Reg.scala 17:22]
    end
    if (leftFire) begin // @[Reg.scala 17:18]
      data_uop_cf_foldpc <= load_s1_io_out_bits_uop_cf_foldpc; // @[Reg.scala 17:22]
    end
    if (leftFire) begin // @[Reg.scala 17:18]
      data_uop_cf_exceptionVec_4 <= load_s1_io_out_bits_uop_cf_exceptionVec_4; // @[Reg.scala 17:22]
    end
    if (leftFire) begin // @[Reg.scala 17:18]
      data_uop_cf_exceptionVec_5 <= load_s1_io_out_bits_uop_cf_exceptionVec_5; // @[Reg.scala 17:22]
    end
    if (leftFire) begin // @[Reg.scala 17:18]
      data_uop_cf_exceptionVec_13 <= load_s1_io_out_bits_uop_cf_exceptionVec_13; // @[Reg.scala 17:22]
    end
    if (leftFire) begin // @[Reg.scala 17:18]
      data_uop_cf_trigger_backendEn_1 <= load_s1_io_out_bits_uop_cf_trigger_backendEn_1; // @[Reg.scala 17:22]
    end
    if (leftFire) begin // @[Reg.scala 17:18]
      data_uop_cf_trigger_backendHit_0 <= load_s1_io_out_bits_uop_cf_trigger_backendHit_0; // @[Reg.scala 17:22]
    end
    if (leftFire) begin // @[Reg.scala 17:18]
      data_uop_cf_trigger_backendHit_1 <= load_s1_io_out_bits_uop_cf_trigger_backendHit_1; // @[Reg.scala 17:22]
    end
    if (leftFire) begin // @[Reg.scala 17:18]
      data_uop_cf_trigger_backendHit_4 <= load_s1_io_out_bits_uop_cf_trigger_backendHit_4; // @[Reg.scala 17:22]
    end
    if (leftFire) begin // @[Reg.scala 17:18]
      data_uop_cf_waitForRobIdx_flag <= load_s1_io_out_bits_uop_cf_waitForRobIdx_flag; // @[Reg.scala 17:22]
    end
    if (leftFire) begin // @[Reg.scala 17:18]
      data_uop_cf_waitForRobIdx_value <= load_s1_io_out_bits_uop_cf_waitForRobIdx_value; // @[Reg.scala 17:22]
    end
    if (leftFire) begin // @[Reg.scala 17:18]
      data_uop_cf_loadWaitBit <= load_s1_io_out_bits_uop_cf_loadWaitBit; // @[Reg.scala 17:22]
    end
    if (leftFire) begin // @[Reg.scala 17:18]
      data_uop_cf_loadWaitStrict <= load_s1_io_out_bits_uop_cf_loadWaitStrict; // @[Reg.scala 17:22]
    end
    if (leftFire) begin // @[Reg.scala 17:18]
      data_uop_cf_ftqPtr_flag <= load_s1_io_out_bits_uop_cf_ftqPtr_flag; // @[Reg.scala 17:22]
    end
    if (leftFire) begin // @[Reg.scala 17:18]
      data_uop_cf_ftqPtr_value <= load_s1_io_out_bits_uop_cf_ftqPtr_value; // @[Reg.scala 17:22]
    end
    if (leftFire) begin // @[Reg.scala 17:18]
      data_uop_cf_ftqOffset <= load_s1_io_out_bits_uop_cf_ftqOffset; // @[Reg.scala 17:22]
    end
    if (leftFire) begin // @[Reg.scala 17:18]
      data_uop_ctrl_fuType <= load_s1_io_out_bits_uop_ctrl_fuType; // @[Reg.scala 17:22]
    end
    if (leftFire) begin // @[Reg.scala 17:18]
      data_uop_ctrl_fuOpType <= load_s1_io_out_bits_uop_ctrl_fuOpType; // @[Reg.scala 17:22]
    end
    if (leftFire) begin // @[Reg.scala 17:18]
      data_uop_ctrl_rfWen <= load_s1_io_out_bits_uop_ctrl_rfWen; // @[Reg.scala 17:22]
    end
    if (leftFire) begin // @[Reg.scala 17:18]
      data_uop_ctrl_fpWen <= load_s1_io_out_bits_uop_ctrl_fpWen; // @[Reg.scala 17:22]
    end
    if (leftFire) begin // @[Reg.scala 17:18]
      data_uop_pdest <= load_s1_io_out_bits_uop_pdest; // @[Reg.scala 17:22]
    end
    if (leftFire) begin // @[Reg.scala 17:18]
      data_uop_robIdx_flag <= load_s1_io_out_bits_uop_robIdx_flag; // @[Reg.scala 17:22]
    end
    if (leftFire) begin // @[Reg.scala 17:18]
      data_uop_robIdx_value <= load_s1_io_out_bits_uop_robIdx_value; // @[Reg.scala 17:22]
    end
    if (leftFire) begin // @[Reg.scala 17:18]
      data_uop_lqIdx_flag <= load_s1_io_out_bits_uop_lqIdx_flag; // @[Reg.scala 17:22]
    end
    if (leftFire) begin // @[Reg.scala 17:18]
      data_uop_lqIdx_value <= load_s1_io_out_bits_uop_lqIdx_value; // @[Reg.scala 17:22]
    end
    if (leftFire) begin // @[Reg.scala 17:18]
      data_uop_sqIdx_flag <= load_s1_io_out_bits_uop_sqIdx_flag; // @[Reg.scala 17:22]
    end
    if (leftFire) begin // @[Reg.scala 17:18]
      data_uop_sqIdx_value <= load_s1_io_out_bits_uop_sqIdx_value; // @[Reg.scala 17:22]
    end
    if (leftFire) begin // @[Reg.scala 17:18]
      data_vaddr <= load_s1_io_out_bits_vaddr; // @[Reg.scala 17:22]
    end
    if (leftFire) begin // @[Reg.scala 17:18]
      data_paddr <= load_s1_io_out_bits_paddr; // @[Reg.scala 17:22]
    end
    if (leftFire) begin // @[Reg.scala 17:18]
      data_mask <= load_s1_io_out_bits_mask; // @[Reg.scala 17:22]
    end
    if (leftFire) begin // @[Reg.scala 17:18]
      data_tlbMiss <= load_s1_io_out_bits_tlbMiss; // @[Reg.scala 17:22]
    end
    if (leftFire) begin // @[Reg.scala 17:18]
      data_isPrefetch <= load_s1_io_out_bits_isPrefetch; // @[Reg.scala 17:22]
    end
    if (leftFire) begin // @[Reg.scala 17:18]
      data_isHWPrefetch <= load_s1_io_out_bits_isHWPrefetch; // @[Reg.scala 17:22]
    end
    if (leftFire) begin // @[Reg.scala 17:18]
      data_vec128bit <= load_s1_io_out_bits_vec128bit; // @[Reg.scala 17:22]
    end
    if (leftFire) begin // @[Reg.scala 17:18]
      data_isFirstIssue <= load_s1_io_out_bits_isFirstIssue; // @[Reg.scala 17:22]
    end
    if (leftFire) begin // @[Reg.scala 17:18]
      data_rarAllocated <= load_s1_io_out_bits_rarAllocated; // @[Reg.scala 17:22]
    end
    if (leftFire) begin // @[Reg.scala 17:18]
      data_rarIndex <= load_s1_io_out_bits_rarIndex; // @[Reg.scala 17:22]
    end
    if (leftFire) begin // @[Reg.scala 17:18]
      data_rawAllocated <= load_s1_io_out_bits_rawAllocated; // @[Reg.scala 17:22]
    end
    if (leftFire) begin // @[Reg.scala 17:18]
      data_rawIndex <= load_s1_io_out_bits_rawIndex; // @[Reg.scala 17:22]
    end
    if (leftFire) begin // @[Reg.scala 17:18]
      data_replayInfo_cause_2 <= load_s1_io_out_bits_replayInfo_cause_2; // @[Reg.scala 17:22]
    end
    if (leftFire) begin // @[Reg.scala 17:18]
      data_replayInfo_cause_4 <= load_s1_io_out_bits_replayInfo_cause_4; // @[Reg.scala 17:22]
    end
    load_s2_io_static_pm_REG_valid <= io_tlb_resp_bits_static_pm_valid; // @[LoadUnit.scala 1054:34]
    load_s2_io_static_pm_REG_bits <= io_tlb_resp_bits_static_pm_bits; // @[LoadUnit.scala 1054:34]
    io_correctTableUpdate_REG_valid <= load_s2_io_correctTableUpdate_valid; // @[LoadUnit.scala 1077:35]
    io_correctTableUpdate_REG_bits_addr <= load_s2_io_correctTableUpdate_bits_addr; // @[LoadUnit.scala 1077:35]
    io_correctTableUpdate_REG_bits_strict <= load_s2_io_correctTableUpdate_bits_strict; // @[LoadUnit.scala 1077:35]
    io_correctTableUpdate_REG_bits_violation <= load_s2_io_correctTableUpdate_bits_violation; // @[LoadUnit.scala 1077:35]
    sqIdxMaskReg <= _sqIdxMaskReg_T[11:0] - 12'h1; // @[BitUtils.scala 179:75]
    if (s2_loadOutValid) begin // @[Reg.scala 17:18]
      s3_loadOutBits_uop_cf_foldpc <= load_s2_io_out_bits_uop_cf_foldpc; // @[Reg.scala 17:22]
    end
    if (s2_loadOutValid) begin // @[Reg.scala 17:18]
      s3_loadOutBits_uop_cf_exceptionVec_4 <= load_s2_io_out_bits_uop_cf_exceptionVec_4; // @[Reg.scala 17:22]
    end
    if (s2_loadOutValid) begin // @[Reg.scala 17:18]
      s3_loadOutBits_uop_cf_exceptionVec_5 <= load_s2_io_out_bits_uop_cf_exceptionVec_5; // @[Reg.scala 17:22]
    end
    if (s2_loadOutValid) begin // @[Reg.scala 17:18]
      s3_loadOutBits_uop_cf_exceptionVec_13 <= load_s2_io_out_bits_uop_cf_exceptionVec_13; // @[Reg.scala 17:22]
    end
    if (s2_loadOutValid) begin // @[Reg.scala 17:18]
      s3_loadOutBits_uop_cf_trigger_backendEn_1 <= load_s2_io_out_bits_uop_cf_trigger_backendEn_1; // @[Reg.scala 17:22]
    end
    if (s2_loadOutValid) begin // @[Reg.scala 17:18]
      s3_loadOutBits_uop_cf_trigger_backendHit_0 <= load_s2_io_out_bits_uop_cf_trigger_backendHit_0; // @[Reg.scala 17:22]
    end
    if (s2_loadOutValid) begin // @[Reg.scala 17:18]
      s3_loadOutBits_uop_cf_trigger_backendHit_1 <= load_s2_io_out_bits_uop_cf_trigger_backendHit_1; // @[Reg.scala 17:22]
    end
    if (s2_loadOutValid) begin // @[Reg.scala 17:18]
      s3_loadOutBits_uop_cf_trigger_backendHit_4 <= load_s2_io_out_bits_uop_cf_trigger_backendHit_4; // @[Reg.scala 17:22]
    end
    if (s2_loadOutValid) begin // @[Reg.scala 17:18]
      s3_loadOutBits_uop_cf_waitForRobIdx_flag <= load_s2_io_out_bits_uop_cf_waitForRobIdx_flag; // @[Reg.scala 17:22]
    end
    if (s2_loadOutValid) begin // @[Reg.scala 17:18]
      s3_loadOutBits_uop_cf_waitForRobIdx_value <= load_s2_io_out_bits_uop_cf_waitForRobIdx_value; // @[Reg.scala 17:22]
    end
    if (s2_loadOutValid) begin // @[Reg.scala 17:18]
      s3_loadOutBits_uop_cf_loadWaitBit <= load_s2_io_out_bits_uop_cf_loadWaitBit; // @[Reg.scala 17:22]
    end
    if (s2_loadOutValid) begin // @[Reg.scala 17:18]
      s3_loadOutBits_uop_cf_loadWaitStrict <= load_s2_io_out_bits_uop_cf_loadWaitStrict; // @[Reg.scala 17:22]
    end
    if (s2_loadOutValid) begin // @[Reg.scala 17:18]
      s3_loadOutBits_uop_cf_ftqPtr_flag <= load_s2_io_out_bits_uop_cf_ftqPtr_flag; // @[Reg.scala 17:22]
    end
    if (s2_loadOutValid) begin // @[Reg.scala 17:18]
      s3_loadOutBits_uop_cf_ftqPtr_value <= load_s2_io_out_bits_uop_cf_ftqPtr_value; // @[Reg.scala 17:22]
    end
    if (s2_loadOutValid) begin // @[Reg.scala 17:18]
      s3_loadOutBits_uop_cf_ftqOffset <= load_s2_io_out_bits_uop_cf_ftqOffset; // @[Reg.scala 17:22]
    end
    if (s2_loadOutValid) begin // @[Reg.scala 17:18]
      s3_loadOutBits_uop_ctrl_fuType <= load_s2_io_out_bits_uop_ctrl_fuType; // @[Reg.scala 17:22]
    end
    if (s2_loadOutValid) begin // @[Reg.scala 17:18]
      s3_loadOutBits_uop_ctrl_fuOpType <= load_s2_io_out_bits_uop_ctrl_fuOpType; // @[Reg.scala 17:22]
    end
    if (s2_loadOutValid) begin // @[Reg.scala 17:18]
      s3_loadOutBits_uop_ctrl_rfWen <= load_s2_io_out_bits_uop_ctrl_rfWen; // @[Reg.scala 17:22]
    end
    if (s2_loadOutValid) begin // @[Reg.scala 17:18]
      s3_loadOutBits_uop_ctrl_fpWen <= load_s2_io_out_bits_uop_ctrl_fpWen; // @[Reg.scala 17:22]
    end
    if (s2_loadOutValid) begin // @[Reg.scala 17:18]
      s3_loadOutBits_uop_pdest <= load_s2_io_out_bits_uop_pdest; // @[Reg.scala 17:22]
    end
    if (s2_loadOutValid) begin // @[Reg.scala 17:18]
      s3_loadOutBits_uop_robIdx_flag <= load_s2_io_out_bits_uop_robIdx_flag; // @[Reg.scala 17:22]
    end
    if (s2_loadOutValid) begin // @[Reg.scala 17:18]
      s3_loadOutBits_uop_robIdx_value <= load_s2_io_out_bits_uop_robIdx_value; // @[Reg.scala 17:22]
    end
    if (s2_loadOutValid) begin // @[Reg.scala 17:18]
      s3_loadOutBits_uop_lqIdx_flag <= load_s2_io_out_bits_uop_lqIdx_flag; // @[Reg.scala 17:22]
    end
    if (s2_loadOutValid) begin // @[Reg.scala 17:18]
      s3_loadOutBits_uop_lqIdx_value <= load_s2_io_out_bits_uop_lqIdx_value; // @[Reg.scala 17:22]
    end
    if (s2_loadOutValid) begin // @[Reg.scala 17:18]
      s3_loadOutBits_uop_sqIdx_flag <= load_s2_io_out_bits_uop_sqIdx_flag; // @[Reg.scala 17:22]
    end
    if (s2_loadOutValid) begin // @[Reg.scala 17:18]
      s3_loadOutBits_uop_sqIdx_value <= load_s2_io_out_bits_uop_sqIdx_value; // @[Reg.scala 17:22]
    end
    if (s2_loadOutValid) begin // @[Reg.scala 17:18]
      s3_loadOutBits_vaddr <= load_s2_io_out_bits_vaddr; // @[Reg.scala 17:22]
    end
    if (s2_loadOutValid) begin // @[Reg.scala 17:18]
      s3_loadOutBits_paddr <= load_s2_io_out_bits_paddr; // @[Reg.scala 17:22]
    end
    if (s2_loadOutValid) begin // @[Reg.scala 17:18]
      s3_loadOutBits_mask <= load_s2_io_out_bits_mask; // @[Reg.scala 17:22]
    end
    if (s2_loadOutValid) begin // @[Reg.scala 17:18]
      s3_loadOutBits_miss <= load_s2_io_out_bits_miss; // @[Reg.scala 17:22]
    end
    if (s2_loadOutValid) begin // @[Reg.scala 17:18]
      s3_loadOutBits_tlbMiss <= load_s2_io_out_bits_tlbMiss; // @[Reg.scala 17:22]
    end
    if (s2_loadOutValid) begin // @[Reg.scala 17:18]
      s3_loadOutBits_mmio <= load_s2_io_out_bits_mmio; // @[Reg.scala 17:22]
    end
    if (s2_loadOutValid) begin // @[Reg.scala 17:18]
      s3_loadOutBits_isPrefetch <= load_s2_io_out_bits_isPrefetch; // @[Reg.scala 17:22]
    end
    if (s2_loadOutValid) begin // @[Reg.scala 17:18]
      s3_loadOutBits_vec128bit <= load_s2_io_out_bits_vec128bit; // @[Reg.scala 17:22]
    end
    if (s2_loadOutValid) begin // @[Reg.scala 17:18]
      s3_loadOutBits_rarAllocated <= load_s2_io_out_bits_rarAllocated; // @[Reg.scala 17:22]
    end
    if (s2_loadOutValid) begin // @[Reg.scala 17:18]
      s3_loadOutBits_rarIndex <= load_s2_io_out_bits_rarIndex; // @[Reg.scala 17:22]
    end
    if (s2_loadOutValid) begin // @[Reg.scala 17:18]
      s3_loadOutBits_rawAllocated <= load_s2_io_out_bits_rawAllocated; // @[Reg.scala 17:22]
    end
    if (s2_loadOutValid) begin // @[Reg.scala 17:18]
      s3_loadOutBits_rawIndex <= load_s2_io_out_bits_rawIndex; // @[Reg.scala 17:22]
    end
    if (s2_loadOutValid) begin // @[Reg.scala 17:18]
      s3_loadOutBits_replayInfo_missMSHRId <= load_s2_io_out_bits_replayInfo_missMSHRId; // @[Reg.scala 17:22]
    end
    if (s2_loadOutValid) begin // @[Reg.scala 17:18]
      s3_loadOutBits_replayInfo_canForwardFullData <= load_s2_io_out_bits_replayInfo_canForwardFullData; // @[Reg.scala 17:22]
    end
    if (s2_loadOutValid) begin // @[Reg.scala 17:18]
      s3_loadOutBits_replayInfo_dataInvalidSqIdx_flag <= load_s2_io_out_bits_replayInfo_dataInvalidSqIdx_flag; // @[Reg.scala 17:22]
    end
    if (s2_loadOutValid) begin // @[Reg.scala 17:18]
      s3_loadOutBits_replayInfo_dataInvalidSqIdx_value <= load_s2_io_out_bits_replayInfo_dataInvalidSqIdx_value; // @[Reg.scala 17:22]
    end
    if (s2_loadOutValid) begin // @[Reg.scala 17:18]
      s3_loadOutBits_replayInfo_addrInvalidSqIdx_flag <= load_s2_io_out_bits_replayInfo_addrInvalidSqIdx_flag; // @[Reg.scala 17:22]
    end
    if (s2_loadOutValid) begin // @[Reg.scala 17:18]
      s3_loadOutBits_replayInfo_addrInvalidSqIdx_value <= load_s2_io_out_bits_replayInfo_addrInvalidSqIdx_value; // @[Reg.scala 17:22]
    end
    if (s2_loadOutValid) begin // @[Reg.scala 17:18]
      s3_loadOutBits_replayInfo_replayCarry_real_way_en <= load_s2_io_out_bits_replayInfo_replayCarry_real_way_en; // @[Reg.scala 17:22]
    end
    if (s2_loadOutValid) begin // @[Reg.scala 17:18]
      s3_loadOutBits_replayInfo_replayCarry_valid <= load_s2_io_out_bits_replayInfo_replayCarry_valid; // @[Reg.scala 17:22]
    end
    if (s2_loadOutValid) begin // @[Reg.scala 17:18]
      s3_loadOutBits_replayInfo_dataInLastBeat <= load_s2_io_out_bits_replayInfo_dataInLastBeat; // @[Reg.scala 17:22]
    end
    if (s2_loadOutValid) begin // @[Reg.scala 17:18]
      s3_loadOutBits_replayInfo_cause_0 <= load_s2_io_out_bits_replayInfo_cause_0; // @[Reg.scala 17:22]
    end
    if (s2_loadOutValid) begin // @[Reg.scala 17:18]
      s3_loadOutBits_replayInfo_cause_1 <= load_s2_io_out_bits_replayInfo_cause_1; // @[Reg.scala 17:22]
    end
    if (s2_loadOutValid) begin // @[Reg.scala 17:18]
      s3_loadOutBits_replayInfo_cause_2 <= load_s2_io_out_bits_replayInfo_cause_2; // @[Reg.scala 17:22]
    end
    if (s2_loadOutValid) begin // @[Reg.scala 17:18]
      s3_loadOutBits_replayInfo_cause_4 <= load_s2_io_out_bits_replayInfo_cause_4; // @[Reg.scala 17:22]
    end
    if (s2_loadOutValid) begin // @[Reg.scala 17:18]
      s3_loadOutBits_replayInfo_cause_5 <= load_s2_io_out_bits_replayInfo_cause_5; // @[Reg.scala 17:22]
    end
    if (s2_loadOutValid) begin // @[Reg.scala 17:18]
      s3_loadOutBits_replayInfo_cause_6 <= load_s2_io_out_bits_replayInfo_cause_6; // @[Reg.scala 17:22]
    end
    if (s2_loadOutValid) begin // @[Reg.scala 17:18]
      s3_loadOutBits_replayInfo_cause_7 <= load_s2_io_out_bits_replayInfo_cause_7; // @[Reg.scala 17:22]
    end
    s3_loadOutValid_REG <= load_s2_io_out_valid & ~load_s2_io_out_bits_isHWPrefetch; // @[LoadUnit.scala 1111:46]
    s3_loadOutValid_REG_1 <= io_redirect_valid & (s3_loadOutValid_flushItself | _s3_loadOutValid_T); // @[Rob.scala 123:20]
    s3_loadValidVec <= s2_loadValidVec; // @[LoadUnit.scala 1134:19]
    s3_delayedLoadError_REG <= io_csrCtrl_cache_error_enable; // @[LoadUnit.scala 1141:51]
    s3_forwardFail <= io_lsq_forward_matchInvalid | io_sbuffer_matchInvalid; // @[LoadUnit.scala 1162:60]
    s3_ldld_replayFromFetch_REG <= io_csrCtrl_ldld_vio_check_enable; // @[LoadUnit.scala 1166:12]
    io_fastpathOut_valid_REG <= load_s2_io_out_valid; // @[LoadUnit.scala 1301:34]
    tdata2 <= io_trigger_0_tdata2; // @[LoadUnit.scala 1310:25]
    matchType <= io_trigger_0_matchType; // @[LoadUnit.scala 1311:28]
    tEnable <= io_trigger_0_tEnable; // @[LoadUnit.scala 1312:26]
    hitLoadAddrTriggerHitVec_0_REG <= load_s2_io_out_bits_vaddr; // @[LoadUnit.scala 1314:54]
    tdata2_1 <= io_trigger_1_tdata2; // @[LoadUnit.scala 1310:25]
    matchType_1 <= io_trigger_1_matchType; // @[LoadUnit.scala 1311:28]
    tEnable_1 <= io_trigger_1_tEnable; // @[LoadUnit.scala 1312:26]
    hitLoadAddrTriggerHitVec_1_REG <= load_s2_io_out_bits_vaddr; // @[LoadUnit.scala 1314:54]
    tdata2_2 <= io_trigger_2_tdata2; // @[LoadUnit.scala 1310:25]
    matchType_2 <= io_trigger_2_matchType; // @[LoadUnit.scala 1311:28]
    tEnable_2 <= io_trigger_2_tEnable; // @[LoadUnit.scala 1312:26]
    hitLoadAddrTriggerHitVec_2_REG <= load_s2_io_out_bits_vaddr; // @[LoadUnit.scala 1314:54]
    io_perf_0_value_REG <= load_s0_io_in_ready & load_s0_io_in_valid; // @[Decoupled.scala 50:35]
    io_perf_0_value_REG_1 <= io_perf_0_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_1_value_REG <= load_s1_io_out_valid & s1_tryPointerChasing & _T; // @[LoadUnit.scala 1340:79]
    io_perf_1_value_REG_1 <= io_perf_1_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_2_value_REG <= load_s0_io_out_valid & load_s0_io_out_ready & ~load_s0_io_dcacheReq_ready; // @[LoadUnit.scala 1341:79]
    io_perf_2_value_REG_1 <= io_perf_2_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_3_value_REG <= load_s1_io_in_valid; // @[Decoupled.scala 50:35]
    io_perf_3_value_REG_1 <= io_perf_3_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_4_value_REG <= _T_72 & load_s1_io_dtlbResp_bits_miss; // @[LoadUnit.scala 1343:53]
    io_perf_4_value_REG_1 <= io_perf_4_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_5_value_REG <= load_s2_io_in_valid; // @[Decoupled.scala 50:35]
    io_perf_5_value_REG_1 <= io_perf_5_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_6_value_REG <= _io_prefetch_train_valid_T & load_s2_io_dcacheResp_bits_miss; // @[LoadUnit.scala 1345:53]
    io_perf_6_value_REG_1 <= io_perf_6_value_REG; // @[PerfCounterUtils.scala 188:27]
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[PipelineConnect.scala 112:20]
      s1_data_valid <= 1'h0; // @[PipelineConnect.scala 112:28]
    end else if (_s1_data_T_4) begin
      s1_data_valid <= 1'h0;
    end else begin
      s1_data_valid <= s1_data_leftFire;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Reg.scala 29:18]
      load_s1_io_s1_kill_r <= 1'h0; // @[Reg.scala 29:22]
    end else if (_load_s1_io_s1_kill_T_1) begin // @[Reg.scala 28:20]
      load_s1_io_s1_kill_r <= load_s0_io_s0_kill;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadUnit.scala 970:77]
      s1_tryPointerChasing <= 1'h0;
    end else begin
      s1_tryPointerChasing <= load_s0_io_l2lForward_select & load_s0_io_out_ready & load_s0_io_dcacheReq_ready;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[PipelineConnect.scala 112:20]
      valid <= 1'h0; // @[PipelineConnect.scala 112:28]
    end else if (_T_30) begin
      valid <= 1'h0;
    end else begin
      valid <= leftFire;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWrapper.scala 545:40]
      forward_D <= 1'h0;
    end else begin
      forward_D <= _all_match_T_2 & _all_match_T_4;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWrapper.scala 566:38]
      forwardData_D_0 <= 8'h0;
    end else begin
      forwardData_D_0 <= selected_data[7:0];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWrapper.scala 566:38]
      forwardData_D_1 <= 8'h0;
    end else begin
      forwardData_D_1 <= selected_data[15:8];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWrapper.scala 566:38]
      forwardData_D_2 <= 8'h0;
    end else begin
      forwardData_D_2 <= selected_data[23:16];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWrapper.scala 566:38]
      forwardData_D_3 <= 8'h0;
    end else begin
      forwardData_D_3 <= selected_data[31:24];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWrapper.scala 566:38]
      forwardData_D_4 <= 8'h0;
    end else begin
      forwardData_D_4 <= selected_data[39:32];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWrapper.scala 566:38]
      forwardData_D_5 <= 8'h0;
    end else begin
      forwardData_D_5 <= selected_data[47:40];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWrapper.scala 566:38]
      forwardData_D_6 <= 8'h0;
    end else begin
      forwardData_D_6 <= selected_data[55:48];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWrapper.scala 566:38]
      forwardData_D_7 <= 8'h0;
    end else begin
      forwardData_D_7 <= selected_data[63:56];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWrapper.scala 566:38]
      forwardData_D_8 <= 8'h0;
    end else begin
      forwardData_D_8 <= selected_data[71:64];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWrapper.scala 566:38]
      forwardData_D_9 <= 8'h0;
    end else begin
      forwardData_D_9 <= selected_data[79:72];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWrapper.scala 566:38]
      forwardData_D_10 <= 8'h0;
    end else begin
      forwardData_D_10 <= selected_data[87:80];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWrapper.scala 566:38]
      forwardData_D_11 <= 8'h0;
    end else begin
      forwardData_D_11 <= selected_data[95:88];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWrapper.scala 566:38]
      forwardData_D_12 <= 8'h0;
    end else begin
      forwardData_D_12 <= selected_data[103:96];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWrapper.scala 566:38]
      forwardData_D_13 <= 8'h0;
    end else begin
      forwardData_D_13 <= selected_data[111:104];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWrapper.scala 566:38]
      forwardData_D_14 <= 8'h0;
    end else begin
      forwardData_D_14 <= selected_data[119:112];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[DCacheWrapper.scala 566:38]
      forwardData_D_15 <= 8'h0;
    end else begin
      forwardData_D_15 <= selected_data[127:120];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LoadUnit.scala 1118:64]
      s2_loadValidVec <= 6'h0; // @[LoadUnit.scala 1118:82]
    end else if (_T_29) begin // @[LoadUnit.scala 1117:63]
      s2_loadValidVec <= 6'h0; // @[LoadUnit.scala 1117:81]
    end else if (leftFire & ~load_s1_io_out_bits_isHWPrefetch) begin // @[LoadUnit.scala 1116:19]
      s2_loadValidVec <= 6'h3f;
    end else begin
      s2_loadValidVec <= 6'h0;
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
  s1_data_valid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  s1_data_uop_cf_foldpc = _RAND_1[9:0];
  _RAND_2 = {1{`RANDOM}};
  s1_data_uop_cf_exceptionVec_4 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  s1_data_uop_cf_trigger_backendEn_1 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  s1_data_uop_cf_trigger_backendHit_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  s1_data_uop_cf_trigger_backendHit_1 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  s1_data_uop_cf_trigger_backendHit_4 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  s1_data_uop_cf_waitForRobIdx_flag = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  s1_data_uop_cf_waitForRobIdx_value = _RAND_8[4:0];
  _RAND_9 = {1{`RANDOM}};
  s1_data_uop_cf_loadWaitBit = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  s1_data_uop_cf_loadWaitStrict = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  s1_data_uop_cf_ftqPtr_flag = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  s1_data_uop_cf_ftqPtr_value = _RAND_12[2:0];
  _RAND_13 = {1{`RANDOM}};
  s1_data_uop_cf_ftqOffset = _RAND_13[2:0];
  _RAND_14 = {1{`RANDOM}};
  s1_data_uop_ctrl_fuType = _RAND_14[3:0];
  _RAND_15 = {1{`RANDOM}};
  s1_data_uop_ctrl_fuOpType = _RAND_15[6:0];
  _RAND_16 = {1{`RANDOM}};
  s1_data_uop_ctrl_rfWen = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  s1_data_uop_ctrl_fpWen = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  s1_data_uop_pdest = _RAND_18[5:0];
  _RAND_19 = {1{`RANDOM}};
  s1_data_uop_robIdx_flag = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  s1_data_uop_robIdx_value = _RAND_20[4:0];
  _RAND_21 = {1{`RANDOM}};
  s1_data_uop_lqIdx_flag = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  s1_data_uop_lqIdx_value = _RAND_22[3:0];
  _RAND_23 = {1{`RANDOM}};
  s1_data_uop_sqIdx_flag = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  s1_data_uop_sqIdx_value = _RAND_24[3:0];
  _RAND_25 = {2{`RANDOM}};
  s1_data_vaddr = _RAND_25[38:0];
  _RAND_26 = {1{`RANDOM}};
  s1_data_mask = _RAND_26[15:0];
  _RAND_27 = {1{`RANDOM}};
  s1_data_isPrefetch = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  s1_data_isHWPrefetch = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  s1_data_vec128bit = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  s1_data_isFirstIssue = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  s1_data_mshrid = _RAND_31[1:0];
  _RAND_32 = {1{`RANDOM}};
  s1_data_forward_tlDchannel = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  s1_data_rarAllocated = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  s1_data_rarIndex = _RAND_34[3:0];
  _RAND_35 = {1{`RANDOM}};
  s1_data_rawAllocated = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  s1_data_rawIndex = _RAND_36[2:0];
  _RAND_37 = {1{`RANDOM}};
  load_s1_io_s1_kill_r = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  s1_tryPointerChasing = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  s1_pointerChasingVAddr = _RAND_39[6:0];
  _RAND_40 = {1{`RANDOM}};
  addressMisMatch_r = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  notFastMatch = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  valid = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  data_uop_cf_foldpc = _RAND_43[9:0];
  _RAND_44 = {1{`RANDOM}};
  data_uop_cf_exceptionVec_4 = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  data_uop_cf_exceptionVec_5 = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  data_uop_cf_exceptionVec_13 = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  data_uop_cf_trigger_backendEn_1 = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  data_uop_cf_trigger_backendHit_0 = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  data_uop_cf_trigger_backendHit_1 = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  data_uop_cf_trigger_backendHit_4 = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  data_uop_cf_waitForRobIdx_flag = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  data_uop_cf_waitForRobIdx_value = _RAND_52[4:0];
  _RAND_53 = {1{`RANDOM}};
  data_uop_cf_loadWaitBit = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  data_uop_cf_loadWaitStrict = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  data_uop_cf_ftqPtr_flag = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  data_uop_cf_ftqPtr_value = _RAND_56[2:0];
  _RAND_57 = {1{`RANDOM}};
  data_uop_cf_ftqOffset = _RAND_57[2:0];
  _RAND_58 = {1{`RANDOM}};
  data_uop_ctrl_fuType = _RAND_58[3:0];
  _RAND_59 = {1{`RANDOM}};
  data_uop_ctrl_fuOpType = _RAND_59[6:0];
  _RAND_60 = {1{`RANDOM}};
  data_uop_ctrl_rfWen = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  data_uop_ctrl_fpWen = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  data_uop_pdest = _RAND_62[5:0];
  _RAND_63 = {1{`RANDOM}};
  data_uop_robIdx_flag = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  data_uop_robIdx_value = _RAND_64[4:0];
  _RAND_65 = {1{`RANDOM}};
  data_uop_lqIdx_flag = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  data_uop_lqIdx_value = _RAND_66[3:0];
  _RAND_67 = {1{`RANDOM}};
  data_uop_sqIdx_flag = _RAND_67[0:0];
  _RAND_68 = {1{`RANDOM}};
  data_uop_sqIdx_value = _RAND_68[3:0];
  _RAND_69 = {2{`RANDOM}};
  data_vaddr = _RAND_69[38:0];
  _RAND_70 = {2{`RANDOM}};
  data_paddr = _RAND_70[35:0];
  _RAND_71 = {1{`RANDOM}};
  data_mask = _RAND_71[15:0];
  _RAND_72 = {1{`RANDOM}};
  data_tlbMiss = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  data_isPrefetch = _RAND_73[0:0];
  _RAND_74 = {1{`RANDOM}};
  data_isHWPrefetch = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  data_vec128bit = _RAND_75[0:0];
  _RAND_76 = {1{`RANDOM}};
  data_isFirstIssue = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  data_rarAllocated = _RAND_77[0:0];
  _RAND_78 = {1{`RANDOM}};
  data_rarIndex = _RAND_78[3:0];
  _RAND_79 = {1{`RANDOM}};
  data_rawAllocated = _RAND_79[0:0];
  _RAND_80 = {1{`RANDOM}};
  data_rawIndex = _RAND_80[2:0];
  _RAND_81 = {1{`RANDOM}};
  data_replayInfo_cause_2 = _RAND_81[0:0];
  _RAND_82 = {1{`RANDOM}};
  data_replayInfo_cause_4 = _RAND_82[0:0];
  _RAND_83 = {1{`RANDOM}};
  forward_D = _RAND_83[0:0];
  _RAND_84 = {1{`RANDOM}};
  forwardData_D_0 = _RAND_84[7:0];
  _RAND_85 = {1{`RANDOM}};
  forwardData_D_1 = _RAND_85[7:0];
  _RAND_86 = {1{`RANDOM}};
  forwardData_D_2 = _RAND_86[7:0];
  _RAND_87 = {1{`RANDOM}};
  forwardData_D_3 = _RAND_87[7:0];
  _RAND_88 = {1{`RANDOM}};
  forwardData_D_4 = _RAND_88[7:0];
  _RAND_89 = {1{`RANDOM}};
  forwardData_D_5 = _RAND_89[7:0];
  _RAND_90 = {1{`RANDOM}};
  forwardData_D_6 = _RAND_90[7:0];
  _RAND_91 = {1{`RANDOM}};
  forwardData_D_7 = _RAND_91[7:0];
  _RAND_92 = {1{`RANDOM}};
  forwardData_D_8 = _RAND_92[7:0];
  _RAND_93 = {1{`RANDOM}};
  forwardData_D_9 = _RAND_93[7:0];
  _RAND_94 = {1{`RANDOM}};
  forwardData_D_10 = _RAND_94[7:0];
  _RAND_95 = {1{`RANDOM}};
  forwardData_D_11 = _RAND_95[7:0];
  _RAND_96 = {1{`RANDOM}};
  forwardData_D_12 = _RAND_96[7:0];
  _RAND_97 = {1{`RANDOM}};
  forwardData_D_13 = _RAND_97[7:0];
  _RAND_98 = {1{`RANDOM}};
  forwardData_D_14 = _RAND_98[7:0];
  _RAND_99 = {1{`RANDOM}};
  forwardData_D_15 = _RAND_99[7:0];
  _RAND_100 = {1{`RANDOM}};
  load_s2_io_static_pm_REG_valid = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  load_s2_io_static_pm_REG_bits = _RAND_101[0:0];
  _RAND_102 = {1{`RANDOM}};
  io_correctTableUpdate_REG_valid = _RAND_102[0:0];
  _RAND_103 = {1{`RANDOM}};
  io_correctTableUpdate_REG_bits_addr = _RAND_103[9:0];
  _RAND_104 = {1{`RANDOM}};
  io_correctTableUpdate_REG_bits_strict = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  io_correctTableUpdate_REG_bits_violation = _RAND_105[0:0];
  _RAND_106 = {1{`RANDOM}};
  sqIdxMaskReg = _RAND_106[11:0];
  _RAND_107 = {1{`RANDOM}};
  s2_loadValidVec = _RAND_107[5:0];
  _RAND_108 = {1{`RANDOM}};
  s3_loadOutBits_uop_cf_foldpc = _RAND_108[9:0];
  _RAND_109 = {1{`RANDOM}};
  s3_loadOutBits_uop_cf_exceptionVec_4 = _RAND_109[0:0];
  _RAND_110 = {1{`RANDOM}};
  s3_loadOutBits_uop_cf_exceptionVec_5 = _RAND_110[0:0];
  _RAND_111 = {1{`RANDOM}};
  s3_loadOutBits_uop_cf_exceptionVec_13 = _RAND_111[0:0];
  _RAND_112 = {1{`RANDOM}};
  s3_loadOutBits_uop_cf_trigger_backendEn_1 = _RAND_112[0:0];
  _RAND_113 = {1{`RANDOM}};
  s3_loadOutBits_uop_cf_trigger_backendHit_0 = _RAND_113[0:0];
  _RAND_114 = {1{`RANDOM}};
  s3_loadOutBits_uop_cf_trigger_backendHit_1 = _RAND_114[0:0];
  _RAND_115 = {1{`RANDOM}};
  s3_loadOutBits_uop_cf_trigger_backendHit_4 = _RAND_115[0:0];
  _RAND_116 = {1{`RANDOM}};
  s3_loadOutBits_uop_cf_waitForRobIdx_flag = _RAND_116[0:0];
  _RAND_117 = {1{`RANDOM}};
  s3_loadOutBits_uop_cf_waitForRobIdx_value = _RAND_117[4:0];
  _RAND_118 = {1{`RANDOM}};
  s3_loadOutBits_uop_cf_loadWaitBit = _RAND_118[0:0];
  _RAND_119 = {1{`RANDOM}};
  s3_loadOutBits_uop_cf_loadWaitStrict = _RAND_119[0:0];
  _RAND_120 = {1{`RANDOM}};
  s3_loadOutBits_uop_cf_ftqPtr_flag = _RAND_120[0:0];
  _RAND_121 = {1{`RANDOM}};
  s3_loadOutBits_uop_cf_ftqPtr_value = _RAND_121[2:0];
  _RAND_122 = {1{`RANDOM}};
  s3_loadOutBits_uop_cf_ftqOffset = _RAND_122[2:0];
  _RAND_123 = {1{`RANDOM}};
  s3_loadOutBits_uop_ctrl_fuType = _RAND_123[3:0];
  _RAND_124 = {1{`RANDOM}};
  s3_loadOutBits_uop_ctrl_fuOpType = _RAND_124[6:0];
  _RAND_125 = {1{`RANDOM}};
  s3_loadOutBits_uop_ctrl_rfWen = _RAND_125[0:0];
  _RAND_126 = {1{`RANDOM}};
  s3_loadOutBits_uop_ctrl_fpWen = _RAND_126[0:0];
  _RAND_127 = {1{`RANDOM}};
  s3_loadOutBits_uop_pdest = _RAND_127[5:0];
  _RAND_128 = {1{`RANDOM}};
  s3_loadOutBits_uop_robIdx_flag = _RAND_128[0:0];
  _RAND_129 = {1{`RANDOM}};
  s3_loadOutBits_uop_robIdx_value = _RAND_129[4:0];
  _RAND_130 = {1{`RANDOM}};
  s3_loadOutBits_uop_lqIdx_flag = _RAND_130[0:0];
  _RAND_131 = {1{`RANDOM}};
  s3_loadOutBits_uop_lqIdx_value = _RAND_131[3:0];
  _RAND_132 = {1{`RANDOM}};
  s3_loadOutBits_uop_sqIdx_flag = _RAND_132[0:0];
  _RAND_133 = {1{`RANDOM}};
  s3_loadOutBits_uop_sqIdx_value = _RAND_133[3:0];
  _RAND_134 = {2{`RANDOM}};
  s3_loadOutBits_vaddr = _RAND_134[38:0];
  _RAND_135 = {2{`RANDOM}};
  s3_loadOutBits_paddr = _RAND_135[35:0];
  _RAND_136 = {1{`RANDOM}};
  s3_loadOutBits_mask = _RAND_136[15:0];
  _RAND_137 = {1{`RANDOM}};
  s3_loadOutBits_miss = _RAND_137[0:0];
  _RAND_138 = {1{`RANDOM}};
  s3_loadOutBits_tlbMiss = _RAND_138[0:0];
  _RAND_139 = {1{`RANDOM}};
  s3_loadOutBits_mmio = _RAND_139[0:0];
  _RAND_140 = {1{`RANDOM}};
  s3_loadOutBits_isPrefetch = _RAND_140[0:0];
  _RAND_141 = {1{`RANDOM}};
  s3_loadOutBits_vec128bit = _RAND_141[0:0];
  _RAND_142 = {1{`RANDOM}};
  s3_loadOutBits_rarAllocated = _RAND_142[0:0];
  _RAND_143 = {1{`RANDOM}};
  s3_loadOutBits_rarIndex = _RAND_143[3:0];
  _RAND_144 = {1{`RANDOM}};
  s3_loadOutBits_rawAllocated = _RAND_144[0:0];
  _RAND_145 = {1{`RANDOM}};
  s3_loadOutBits_rawIndex = _RAND_145[2:0];
  _RAND_146 = {1{`RANDOM}};
  s3_loadOutBits_replayInfo_missMSHRId = _RAND_146[1:0];
  _RAND_147 = {1{`RANDOM}};
  s3_loadOutBits_replayInfo_canForwardFullData = _RAND_147[0:0];
  _RAND_148 = {1{`RANDOM}};
  s3_loadOutBits_replayInfo_dataInvalidSqIdx_flag = _RAND_148[0:0];
  _RAND_149 = {1{`RANDOM}};
  s3_loadOutBits_replayInfo_dataInvalidSqIdx_value = _RAND_149[3:0];
  _RAND_150 = {1{`RANDOM}};
  s3_loadOutBits_replayInfo_addrInvalidSqIdx_flag = _RAND_150[0:0];
  _RAND_151 = {1{`RANDOM}};
  s3_loadOutBits_replayInfo_addrInvalidSqIdx_value = _RAND_151[3:0];
  _RAND_152 = {1{`RANDOM}};
  s3_loadOutBits_replayInfo_replayCarry_real_way_en = _RAND_152[7:0];
  _RAND_153 = {1{`RANDOM}};
  s3_loadOutBits_replayInfo_replayCarry_valid = _RAND_153[0:0];
  _RAND_154 = {1{`RANDOM}};
  s3_loadOutBits_replayInfo_dataInLastBeat = _RAND_154[0:0];
  _RAND_155 = {1{`RANDOM}};
  s3_loadOutBits_replayInfo_cause_0 = _RAND_155[0:0];
  _RAND_156 = {1{`RANDOM}};
  s3_loadOutBits_replayInfo_cause_1 = _RAND_156[0:0];
  _RAND_157 = {1{`RANDOM}};
  s3_loadOutBits_replayInfo_cause_2 = _RAND_157[0:0];
  _RAND_158 = {1{`RANDOM}};
  s3_loadOutBits_replayInfo_cause_4 = _RAND_158[0:0];
  _RAND_159 = {1{`RANDOM}};
  s3_loadOutBits_replayInfo_cause_5 = _RAND_159[0:0];
  _RAND_160 = {1{`RANDOM}};
  s3_loadOutBits_replayInfo_cause_6 = _RAND_160[0:0];
  _RAND_161 = {1{`RANDOM}};
  s3_loadOutBits_replayInfo_cause_7 = _RAND_161[0:0];
  _RAND_162 = {1{`RANDOM}};
  s3_loadOutValid_REG = _RAND_162[0:0];
  _RAND_163 = {1{`RANDOM}};
  s3_loadOutValid_REG_1 = _RAND_163[0:0];
  _RAND_164 = {1{`RANDOM}};
  s3_loadValidVec = _RAND_164[5:0];
  _RAND_165 = {1{`RANDOM}};
  s3_delayedLoadError_REG = _RAND_165[0:0];
  _RAND_166 = {1{`RANDOM}};
  s3_forwardFail = _RAND_166[0:0];
  _RAND_167 = {1{`RANDOM}};
  s3_ldld_replayFromFetch_REG = _RAND_167[0:0];
  _RAND_168 = {1{`RANDOM}};
  io_fastpathOut_valid_REG = _RAND_168[0:0];
  _RAND_169 = {2{`RANDOM}};
  tdata2 = _RAND_169[63:0];
  _RAND_170 = {1{`RANDOM}};
  matchType = _RAND_170[1:0];
  _RAND_171 = {1{`RANDOM}};
  tEnable = _RAND_171[0:0];
  _RAND_172 = {2{`RANDOM}};
  hitLoadAddrTriggerHitVec_0_REG = _RAND_172[38:0];
  _RAND_173 = {2{`RANDOM}};
  tdata2_1 = _RAND_173[63:0];
  _RAND_174 = {1{`RANDOM}};
  matchType_1 = _RAND_174[1:0];
  _RAND_175 = {1{`RANDOM}};
  tEnable_1 = _RAND_175[0:0];
  _RAND_176 = {2{`RANDOM}};
  hitLoadAddrTriggerHitVec_1_REG = _RAND_176[38:0];
  _RAND_177 = {2{`RANDOM}};
  tdata2_2 = _RAND_177[63:0];
  _RAND_178 = {1{`RANDOM}};
  matchType_2 = _RAND_178[1:0];
  _RAND_179 = {1{`RANDOM}};
  tEnable_2 = _RAND_179[0:0];
  _RAND_180 = {2{`RANDOM}};
  hitLoadAddrTriggerHitVec_2_REG = _RAND_180[38:0];
  _RAND_181 = {1{`RANDOM}};
  io_perf_0_value_REG = _RAND_181[0:0];
  _RAND_182 = {1{`RANDOM}};
  io_perf_0_value_REG_1 = _RAND_182[0:0];
  _RAND_183 = {1{`RANDOM}};
  io_perf_1_value_REG = _RAND_183[0:0];
  _RAND_184 = {1{`RANDOM}};
  io_perf_1_value_REG_1 = _RAND_184[0:0];
  _RAND_185 = {1{`RANDOM}};
  io_perf_2_value_REG = _RAND_185[0:0];
  _RAND_186 = {1{`RANDOM}};
  io_perf_2_value_REG_1 = _RAND_186[0:0];
  _RAND_187 = {1{`RANDOM}};
  io_perf_3_value_REG = _RAND_187[0:0];
  _RAND_188 = {1{`RANDOM}};
  io_perf_3_value_REG_1 = _RAND_188[0:0];
  _RAND_189 = {1{`RANDOM}};
  io_perf_4_value_REG = _RAND_189[0:0];
  _RAND_190 = {1{`RANDOM}};
  io_perf_4_value_REG_1 = _RAND_190[0:0];
  _RAND_191 = {1{`RANDOM}};
  io_perf_5_value_REG = _RAND_191[0:0];
  _RAND_192 = {1{`RANDOM}};
  io_perf_5_value_REG_1 = _RAND_192[0:0];
  _RAND_193 = {1{`RANDOM}};
  io_perf_6_value_REG = _RAND_193[0:0];
  _RAND_194 = {1{`RANDOM}};
  io_perf_6_value_REG_1 = _RAND_194[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    s1_data_valid = 1'h0;
  end
  if (reset) begin
    load_s1_io_s1_kill_r = 1'h0;
  end
  if (reset) begin
    s1_tryPointerChasing = 1'h0;
  end
  if (reset) begin
    valid = 1'h0;
  end
  if (reset) begin
    forward_D = 1'h0;
  end
  if (reset) begin
    forwardData_D_0 = 8'h0;
  end
  if (reset) begin
    forwardData_D_1 = 8'h0;
  end
  if (reset) begin
    forwardData_D_2 = 8'h0;
  end
  if (reset) begin
    forwardData_D_3 = 8'h0;
  end
  if (reset) begin
    forwardData_D_4 = 8'h0;
  end
  if (reset) begin
    forwardData_D_5 = 8'h0;
  end
  if (reset) begin
    forwardData_D_6 = 8'h0;
  end
  if (reset) begin
    forwardData_D_7 = 8'h0;
  end
  if (reset) begin
    forwardData_D_8 = 8'h0;
  end
  if (reset) begin
    forwardData_D_9 = 8'h0;
  end
  if (reset) begin
    forwardData_D_10 = 8'h0;
  end
  if (reset) begin
    forwardData_D_11 = 8'h0;
  end
  if (reset) begin
    forwardData_D_12 = 8'h0;
  end
  if (reset) begin
    forwardData_D_13 = 8'h0;
  end
  if (reset) begin
    forwardData_D_14 = 8'h0;
  end
  if (reset) begin
    forwardData_D_15 = 8'h0;
  end
  if (reset) begin
    s2_loadValidVec = 6'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

