module LsqWrapper(
  input          clock,
  input          reset,
  input          io_brqRedirect_valid,
  input          io_brqRedirect_bits_robIdx_flag,
  input  [4:0]   io_brqRedirect_bits_robIdx_value,
  input          io_brqRedirect_bits_level,
  input  [1:0]   io_enq_needAlloc_0,
  input  [1:0]   io_enq_needAlloc_1,
  input  [1:0]   io_enq_needAlloc_2,
  input  [1:0]   io_enq_needAlloc_3,
  input          io_enq_req_0_valid,
  input          io_enq_req_0_bits_cf_trigger_backendEn_0,
  input          io_enq_req_0_bits_cf_trigger_backendEn_1,
  input  [6:0]   io_enq_req_0_bits_ctrl_fuOpType,
  input          io_enq_req_0_bits_ctrl_rfWen,
  input          io_enq_req_0_bits_ctrl_fpWen,
  input          io_enq_req_0_bits_ctrl_flushPipe,
  input          io_enq_req_0_bits_ctrl_replayInst,
  input  [5:0]   io_enq_req_0_bits_pdest,
  input          io_enq_req_0_bits_robIdx_flag,
  input  [4:0]   io_enq_req_0_bits_robIdx_value,
  input  [3:0]   io_enq_req_0_bits_lqIdx_value,
  input  [3:0]   io_enq_req_0_bits_sqIdx_value,
  input          io_enq_req_1_valid,
  input          io_enq_req_1_bits_cf_trigger_backendEn_0,
  input          io_enq_req_1_bits_cf_trigger_backendEn_1,
  input  [6:0]   io_enq_req_1_bits_ctrl_fuOpType,
  input          io_enq_req_1_bits_ctrl_rfWen,
  input          io_enq_req_1_bits_ctrl_fpWen,
  input          io_enq_req_1_bits_ctrl_flushPipe,
  input          io_enq_req_1_bits_ctrl_replayInst,
  input  [5:0]   io_enq_req_1_bits_pdest,
  input          io_enq_req_1_bits_robIdx_flag,
  input  [4:0]   io_enq_req_1_bits_robIdx_value,
  input  [3:0]   io_enq_req_1_bits_lqIdx_value,
  input  [3:0]   io_enq_req_1_bits_sqIdx_value,
  input          io_enq_req_2_valid,
  input          io_enq_req_2_bits_cf_trigger_backendEn_0,
  input          io_enq_req_2_bits_cf_trigger_backendEn_1,
  input  [6:0]   io_enq_req_2_bits_ctrl_fuOpType,
  input          io_enq_req_2_bits_ctrl_rfWen,
  input          io_enq_req_2_bits_ctrl_fpWen,
  input          io_enq_req_2_bits_ctrl_flushPipe,
  input          io_enq_req_2_bits_ctrl_replayInst,
  input  [5:0]   io_enq_req_2_bits_pdest,
  input          io_enq_req_2_bits_robIdx_flag,
  input  [4:0]   io_enq_req_2_bits_robIdx_value,
  input  [3:0]   io_enq_req_2_bits_lqIdx_value,
  input  [3:0]   io_enq_req_2_bits_sqIdx_value,
  input          io_enq_req_3_valid,
  input          io_enq_req_3_bits_cf_trigger_backendEn_0,
  input          io_enq_req_3_bits_cf_trigger_backendEn_1,
  input  [6:0]   io_enq_req_3_bits_ctrl_fuOpType,
  input          io_enq_req_3_bits_ctrl_rfWen,
  input          io_enq_req_3_bits_ctrl_fpWen,
  input          io_enq_req_3_bits_ctrl_flushPipe,
  input          io_enq_req_3_bits_ctrl_replayInst,
  input  [5:0]   io_enq_req_3_bits_pdest,
  input          io_enq_req_3_bits_robIdx_flag,
  input  [4:0]   io_enq_req_3_bits_robIdx_value,
  input  [3:0]   io_enq_req_3_bits_lqIdx_value,
  input  [3:0]   io_enq_req_3_bits_sqIdx_value,
  input          io_ldu_s2_storeLoadViolationQuery_0_req_valid,
  input  [9:0]   io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_cf_foldpc,
  input          io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_cf_ftqPtr_flag,
  input  [2:0]   io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_cf_ftqPtr_value,
  input  [2:0]   io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_cf_ftqOffset,
  input          io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_robIdx_flag,
  input  [4:0]   io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_robIdx_value,
  input          io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_sqIdx_flag,
  input  [3:0]   io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_sqIdx_value,
  input  [2:0]   io_ldu_s2_storeLoadViolationQuery_0_req_bits_index,
  input          io_ldu_s2_storeLoadViolationQuery_0_req_bits_allocated,
  input          io_ldu_s2_storeLoadViolationQuery_0_req_bits_datavalid,
  input  [7:0]   io_ldu_s2_storeLoadViolationQuery_0_req_bits_mask,
  input  [35:0]  io_ldu_s2_storeLoadViolationQuery_0_req_bits_paddr,
  output [2:0]   io_ldu_s2_storeLoadViolationQuery_0_resp_bits_index,
  output         io_ldu_s2_storeLoadViolationQuery_0_resp_bits_canAccept,
  output         io_ldu_s2_storeLoadViolationQuery_0_resp_bits_allocated,
  input          io_ldu_s2_storeLoadViolationQuery_1_req_valid,
  input  [9:0]   io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_cf_foldpc,
  input          io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_cf_ftqPtr_flag,
  input  [2:0]   io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_cf_ftqPtr_value,
  input  [2:0]   io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_cf_ftqOffset,
  input          io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_robIdx_flag,
  input  [4:0]   io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_robIdx_value,
  input          io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_sqIdx_flag,
  input  [3:0]   io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_sqIdx_value,
  input  [2:0]   io_ldu_s2_storeLoadViolationQuery_1_req_bits_index,
  input          io_ldu_s2_storeLoadViolationQuery_1_req_bits_allocated,
  input          io_ldu_s2_storeLoadViolationQuery_1_req_bits_datavalid,
  input  [7:0]   io_ldu_s2_storeLoadViolationQuery_1_req_bits_mask,
  input  [35:0]  io_ldu_s2_storeLoadViolationQuery_1_req_bits_paddr,
  output [2:0]   io_ldu_s2_storeLoadViolationQuery_1_resp_bits_index,
  output         io_ldu_s2_storeLoadViolationQuery_1_resp_bits_canAccept,
  output         io_ldu_s2_storeLoadViolationQuery_1_resp_bits_allocated,
  input          io_ldu_s2_loadLoadViolationQuery_0_req_valid,
  input          io_ldu_s2_loadLoadViolationQuery_0_req_bits_uop_robIdx_flag,
  input  [4:0]   io_ldu_s2_loadLoadViolationQuery_0_req_bits_uop_robIdx_value,
  input          io_ldu_s2_loadLoadViolationQuery_0_req_bits_uop_lqIdx_flag,
  input  [3:0]   io_ldu_s2_loadLoadViolationQuery_0_req_bits_uop_lqIdx_value,
  input  [3:0]   io_ldu_s2_loadLoadViolationQuery_0_req_bits_index,
  input          io_ldu_s2_loadLoadViolationQuery_0_req_bits_allocated,
  input          io_ldu_s2_loadLoadViolationQuery_0_req_bits_datavalid,
  input          io_ldu_s2_loadLoadViolationQuery_0_req_bits_miss,
  input  [35:0]  io_ldu_s2_loadLoadViolationQuery_0_req_bits_paddr,
  output         io_ldu_s2_loadLoadViolationQuery_0_resp_valid,
  output [3:0]   io_ldu_s2_loadLoadViolationQuery_0_resp_bits_index,
  output         io_ldu_s2_loadLoadViolationQuery_0_resp_bits_canAccept,
  output         io_ldu_s2_loadLoadViolationQuery_0_resp_bits_allocated,
  output         io_ldu_s2_loadLoadViolationQuery_0_resp_bits_replayFromFetch,
  input          io_ldu_s2_loadLoadViolationQuery_1_req_valid,
  input          io_ldu_s2_loadLoadViolationQuery_1_req_bits_uop_robIdx_flag,
  input  [4:0]   io_ldu_s2_loadLoadViolationQuery_1_req_bits_uop_robIdx_value,
  input          io_ldu_s2_loadLoadViolationQuery_1_req_bits_uop_lqIdx_flag,
  input  [3:0]   io_ldu_s2_loadLoadViolationQuery_1_req_bits_uop_lqIdx_value,
  input  [3:0]   io_ldu_s2_loadLoadViolationQuery_1_req_bits_index,
  input          io_ldu_s2_loadLoadViolationQuery_1_req_bits_allocated,
  input          io_ldu_s2_loadLoadViolationQuery_1_req_bits_datavalid,
  input          io_ldu_s2_loadLoadViolationQuery_1_req_bits_miss,
  input  [35:0]  io_ldu_s2_loadLoadViolationQuery_1_req_bits_paddr,
  output         io_ldu_s2_loadLoadViolationQuery_1_resp_valid,
  output [3:0]   io_ldu_s2_loadLoadViolationQuery_1_resp_bits_index,
  output         io_ldu_s2_loadLoadViolationQuery_1_resp_bits_canAccept,
  output         io_ldu_s2_loadLoadViolationQuery_1_resp_bits_allocated,
  output         io_ldu_s2_loadLoadViolationQuery_1_resp_bits_replayFromFetch,
  input          io_ldu_s3_loadIn_0_valid,
  input  [9:0]   io_ldu_s3_loadIn_0_bits_uop_cf_foldpc,
  input          io_ldu_s3_loadIn_0_bits_uop_cf_exceptionVec_4,
  input          io_ldu_s3_loadIn_0_bits_uop_cf_exceptionVec_5,
  input          io_ldu_s3_loadIn_0_bits_uop_cf_exceptionVec_13,
  input          io_ldu_s3_loadIn_0_bits_uop_cf_trigger_backendEn_1,
  input          io_ldu_s3_loadIn_0_bits_uop_cf_trigger_backendHit_0,
  input          io_ldu_s3_loadIn_0_bits_uop_cf_trigger_backendHit_1,
  input          io_ldu_s3_loadIn_0_bits_uop_cf_trigger_backendHit_4,
  input          io_ldu_s3_loadIn_0_bits_uop_cf_waitForRobIdx_flag,
  input  [4:0]   io_ldu_s3_loadIn_0_bits_uop_cf_waitForRobIdx_value,
  input          io_ldu_s3_loadIn_0_bits_uop_cf_loadWaitBit,
  input          io_ldu_s3_loadIn_0_bits_uop_cf_loadWaitStrict,
  input          io_ldu_s3_loadIn_0_bits_uop_cf_ftqPtr_flag,
  input  [2:0]   io_ldu_s3_loadIn_0_bits_uop_cf_ftqPtr_value,
  input  [2:0]   io_ldu_s3_loadIn_0_bits_uop_cf_ftqOffset,
  input  [3:0]   io_ldu_s3_loadIn_0_bits_uop_ctrl_fuType,
  input  [6:0]   io_ldu_s3_loadIn_0_bits_uop_ctrl_fuOpType,
  input          io_ldu_s3_loadIn_0_bits_uop_ctrl_rfWen,
  input          io_ldu_s3_loadIn_0_bits_uop_ctrl_fpWen,
  input          io_ldu_s3_loadIn_0_bits_uop_ctrl_replayInst,
  input  [5:0]   io_ldu_s3_loadIn_0_bits_uop_pdest,
  input          io_ldu_s3_loadIn_0_bits_uop_robIdx_flag,
  input  [4:0]   io_ldu_s3_loadIn_0_bits_uop_robIdx_value,
  input          io_ldu_s3_loadIn_0_bits_uop_lqIdx_flag,
  input  [3:0]   io_ldu_s3_loadIn_0_bits_uop_lqIdx_value,
  input          io_ldu_s3_loadIn_0_bits_uop_sqIdx_flag,
  input  [3:0]   io_ldu_s3_loadIn_0_bits_uop_sqIdx_value,
  input  [38:0]  io_ldu_s3_loadIn_0_bits_vaddr,
  input  [35:0]  io_ldu_s3_loadIn_0_bits_paddr,
  input  [15:0]  io_ldu_s3_loadIn_0_bits_mask,
  input          io_ldu_s3_loadIn_0_bits_miss,
  input          io_ldu_s3_loadIn_0_bits_tlbMiss,
  input          io_ldu_s3_loadIn_0_bits_mmio,
  input          io_ldu_s3_loadIn_0_bits_rarAllocated,
  input  [3:0]   io_ldu_s3_loadIn_0_bits_rarIndex,
  input          io_ldu_s3_loadIn_0_bits_rawAllocated,
  input  [2:0]   io_ldu_s3_loadIn_0_bits_rawIndex,
  input  [1:0]   io_ldu_s3_loadIn_0_bits_replayInfo_missMSHRId,
  input          io_ldu_s3_loadIn_0_bits_replayInfo_canForwardFullData,
  input          io_ldu_s3_loadIn_0_bits_replayInfo_dataInvalidSqIdx_flag,
  input  [3:0]   io_ldu_s3_loadIn_0_bits_replayInfo_dataInvalidSqIdx_value,
  input          io_ldu_s3_loadIn_0_bits_replayInfo_addrInvalidSqIdx_flag,
  input  [3:0]   io_ldu_s3_loadIn_0_bits_replayInfo_addrInvalidSqIdx_value,
  input  [7:0]   io_ldu_s3_loadIn_0_bits_replayInfo_replayCarry_real_way_en,
  input          io_ldu_s3_loadIn_0_bits_replayInfo_replayCarry_valid,
  input          io_ldu_s3_loadIn_0_bits_replayInfo_dataInLastBeat,
  input          io_ldu_s3_loadIn_0_bits_replayInfo_cause_0,
  input          io_ldu_s3_loadIn_0_bits_replayInfo_cause_1,
  input          io_ldu_s3_loadIn_0_bits_replayInfo_cause_2,
  input          io_ldu_s3_loadIn_0_bits_replayInfo_cause_3,
  input          io_ldu_s3_loadIn_0_bits_replayInfo_cause_4,
  input          io_ldu_s3_loadIn_0_bits_replayInfo_cause_5,
  input          io_ldu_s3_loadIn_0_bits_replayInfo_cause_6,
  input          io_ldu_s3_loadIn_0_bits_replayInfo_cause_7,
  input          io_ldu_s3_loadIn_0_bits_lqDataWenDup_1,
  input          io_ldu_s3_loadIn_0_bits_lqDataWenDup_2,
  input          io_ldu_s3_loadIn_0_bits_lqDataWenDup_3,
  input          io_ldu_s3_loadIn_0_bits_lqDataWenDup_5,
  input          io_ldu_s3_loadIn_1_valid,
  input  [9:0]   io_ldu_s3_loadIn_1_bits_uop_cf_foldpc,
  input          io_ldu_s3_loadIn_1_bits_uop_cf_exceptionVec_4,
  input          io_ldu_s3_loadIn_1_bits_uop_cf_exceptionVec_5,
  input          io_ldu_s3_loadIn_1_bits_uop_cf_exceptionVec_13,
  input          io_ldu_s3_loadIn_1_bits_uop_cf_trigger_backendEn_1,
  input          io_ldu_s3_loadIn_1_bits_uop_cf_trigger_backendHit_0,
  input          io_ldu_s3_loadIn_1_bits_uop_cf_trigger_backendHit_1,
  input          io_ldu_s3_loadIn_1_bits_uop_cf_trigger_backendHit_4,
  input          io_ldu_s3_loadIn_1_bits_uop_cf_waitForRobIdx_flag,
  input  [4:0]   io_ldu_s3_loadIn_1_bits_uop_cf_waitForRobIdx_value,
  input          io_ldu_s3_loadIn_1_bits_uop_cf_loadWaitBit,
  input          io_ldu_s3_loadIn_1_bits_uop_cf_loadWaitStrict,
  input          io_ldu_s3_loadIn_1_bits_uop_cf_ftqPtr_flag,
  input  [2:0]   io_ldu_s3_loadIn_1_bits_uop_cf_ftqPtr_value,
  input  [2:0]   io_ldu_s3_loadIn_1_bits_uop_cf_ftqOffset,
  input  [3:0]   io_ldu_s3_loadIn_1_bits_uop_ctrl_fuType,
  input  [6:0]   io_ldu_s3_loadIn_1_bits_uop_ctrl_fuOpType,
  input          io_ldu_s3_loadIn_1_bits_uop_ctrl_rfWen,
  input          io_ldu_s3_loadIn_1_bits_uop_ctrl_fpWen,
  input          io_ldu_s3_loadIn_1_bits_uop_ctrl_replayInst,
  input  [5:0]   io_ldu_s3_loadIn_1_bits_uop_pdest,
  input          io_ldu_s3_loadIn_1_bits_uop_robIdx_flag,
  input  [4:0]   io_ldu_s3_loadIn_1_bits_uop_robIdx_value,
  input          io_ldu_s3_loadIn_1_bits_uop_lqIdx_flag,
  input  [3:0]   io_ldu_s3_loadIn_1_bits_uop_lqIdx_value,
  input          io_ldu_s3_loadIn_1_bits_uop_sqIdx_flag,
  input  [3:0]   io_ldu_s3_loadIn_1_bits_uop_sqIdx_value,
  input  [38:0]  io_ldu_s3_loadIn_1_bits_vaddr,
  input  [35:0]  io_ldu_s3_loadIn_1_bits_paddr,
  input  [15:0]  io_ldu_s3_loadIn_1_bits_mask,
  input          io_ldu_s3_loadIn_1_bits_miss,
  input          io_ldu_s3_loadIn_1_bits_tlbMiss,
  input          io_ldu_s3_loadIn_1_bits_mmio,
  input          io_ldu_s3_loadIn_1_bits_rarAllocated,
  input  [3:0]   io_ldu_s3_loadIn_1_bits_rarIndex,
  input          io_ldu_s3_loadIn_1_bits_rawAllocated,
  input  [2:0]   io_ldu_s3_loadIn_1_bits_rawIndex,
  input  [1:0]   io_ldu_s3_loadIn_1_bits_replayInfo_missMSHRId,
  input          io_ldu_s3_loadIn_1_bits_replayInfo_canForwardFullData,
  input          io_ldu_s3_loadIn_1_bits_replayInfo_dataInvalidSqIdx_flag,
  input  [3:0]   io_ldu_s3_loadIn_1_bits_replayInfo_dataInvalidSqIdx_value,
  input          io_ldu_s3_loadIn_1_bits_replayInfo_addrInvalidSqIdx_flag,
  input  [3:0]   io_ldu_s3_loadIn_1_bits_replayInfo_addrInvalidSqIdx_value,
  input  [7:0]   io_ldu_s3_loadIn_1_bits_replayInfo_replayCarry_real_way_en,
  input          io_ldu_s3_loadIn_1_bits_replayInfo_replayCarry_valid,
  input          io_ldu_s3_loadIn_1_bits_replayInfo_dataInLastBeat,
  input          io_ldu_s3_loadIn_1_bits_replayInfo_cause_0,
  input          io_ldu_s3_loadIn_1_bits_replayInfo_cause_1,
  input          io_ldu_s3_loadIn_1_bits_replayInfo_cause_2,
  input          io_ldu_s3_loadIn_1_bits_replayInfo_cause_3,
  input          io_ldu_s3_loadIn_1_bits_replayInfo_cause_4,
  input          io_ldu_s3_loadIn_1_bits_replayInfo_cause_5,
  input          io_ldu_s3_loadIn_1_bits_replayInfo_cause_6,
  input          io_ldu_s3_loadIn_1_bits_replayInfo_cause_7,
  input          io_ldu_s3_loadIn_1_bits_lqDataWenDup_1,
  input          io_ldu_s3_loadIn_1_bits_lqDataWenDup_2,
  input          io_ldu_s3_loadIn_1_bits_lqDataWenDup_3,
  input          io_ldu_s3_loadIn_1_bits_lqDataWenDup_5,
  input          io_sta_s0_storeMaskIn_0_valid,
  input  [3:0]   io_sta_s0_storeMaskIn_0_bits_sqIdx_value,
  input  [15:0]  io_sta_s0_storeMaskIn_0_bits_mask,
  input          io_sta_s0_storeMaskIn_1_valid,
  input  [3:0]   io_sta_s0_storeMaskIn_1_bits_sqIdx_value,
  input  [15:0]  io_sta_s0_storeMaskIn_1_bits_mask,
  input          io_sta_s1_storeAddrIn_0_valid,
  input  [2:0]   io_sta_s1_storeAddrIn_0_bits_uop_cf_ftqPtr_value,
  input  [2:0]   io_sta_s1_storeAddrIn_0_bits_uop_cf_ftqOffset,
  input  [6:0]   io_sta_s1_storeAddrIn_0_bits_uop_ctrl_fuOpType,
  input          io_sta_s1_storeAddrIn_0_bits_uop_robIdx_flag,
  input  [4:0]   io_sta_s1_storeAddrIn_0_bits_uop_robIdx_value,
  input          io_sta_s1_storeAddrIn_0_bits_uop_sqIdx_flag,
  input  [3:0]   io_sta_s1_storeAddrIn_0_bits_uop_sqIdx_value,
  input  [38:0]  io_sta_s1_storeAddrIn_0_bits_vaddr,
  input  [35:0]  io_sta_s1_storeAddrIn_0_bits_paddr,
  input  [15:0]  io_sta_s1_storeAddrIn_0_bits_mask,
  input          io_sta_s1_storeAddrIn_0_bits_wlineflag,
  input          io_sta_s1_storeAddrIn_0_bits_miss,
  input          io_sta_s1_storeAddrIn_1_valid,
  input  [2:0]   io_sta_s1_storeAddrIn_1_bits_uop_cf_ftqPtr_value,
  input  [2:0]   io_sta_s1_storeAddrIn_1_bits_uop_cf_ftqOffset,
  input  [6:0]   io_sta_s1_storeAddrIn_1_bits_uop_ctrl_fuOpType,
  input          io_sta_s1_storeAddrIn_1_bits_uop_robIdx_flag,
  input  [4:0]   io_sta_s1_storeAddrIn_1_bits_uop_robIdx_value,
  input          io_sta_s1_storeAddrIn_1_bits_uop_sqIdx_flag,
  input  [3:0]   io_sta_s1_storeAddrIn_1_bits_uop_sqIdx_value,
  input  [38:0]  io_sta_s1_storeAddrIn_1_bits_vaddr,
  input  [35:0]  io_sta_s1_storeAddrIn_1_bits_paddr,
  input  [15:0]  io_sta_s1_storeAddrIn_1_bits_mask,
  input          io_sta_s1_storeAddrIn_1_bits_wlineflag,
  input          io_sta_s1_storeAddrIn_1_bits_miss,
  input          io_sta_s2_storeAddrInRe_0_mmio,
  input          io_sta_s2_storeAddrInRe_0_atomic,
  input          io_sta_s2_storeAddrInRe_1_mmio,
  input          io_sta_s2_storeAddrInRe_1_atomic,
  input          io_std_s0_storeDataIn_0_valid,
  input  [6:0]   io_std_s0_storeDataIn_0_bits_uop_ctrl_fuOpType,
  input          io_std_s0_storeDataIn_0_bits_uop_sqIdx_flag,
  input  [3:0]   io_std_s0_storeDataIn_0_bits_uop_sqIdx_value,
  input  [63:0]  io_std_s0_storeDataIn_0_bits_data,
  input          io_std_s0_storeDataIn_1_valid,
  input  [6:0]   io_std_s0_storeDataIn_1_bits_uop_ctrl_fuOpType,
  input          io_std_s0_storeDataIn_1_bits_uop_sqIdx_flag,
  input  [3:0]   io_std_s0_storeDataIn_1_bits_uop_sqIdx_value,
  input  [63:0]  io_std_s0_storeDataIn_1_bits_data,
  input          io_loadOut_0_ready,
  output         io_loadOut_0_valid,
  output         io_loadOut_0_bits_uop_cf_exceptionVec_4,
  output         io_loadOut_0_bits_uop_cf_exceptionVec_5,
  output         io_loadOut_0_bits_uop_cf_exceptionVec_13,
  output         io_loadOut_0_bits_uop_cf_trigger_backendEn_1,
  output         io_loadOut_0_bits_uop_cf_trigger_backendHit_0,
  output         io_loadOut_0_bits_uop_cf_trigger_backendHit_1,
  output         io_loadOut_0_bits_uop_cf_trigger_backendHit_4,
  output         io_loadOut_0_bits_uop_ctrl_rfWen,
  output         io_loadOut_0_bits_uop_ctrl_fpWen,
  output         io_loadOut_0_bits_uop_ctrl_flushPipe,
  output         io_loadOut_0_bits_uop_ctrl_replayInst,
  output [5:0]   io_loadOut_0_bits_uop_pdest,
  output         io_loadOut_0_bits_uop_robIdx_flag,
  output [4:0]   io_loadOut_0_bits_uop_robIdx_value,
  output [63:0]  io_ldRawDataOut_0_lqData,
  output [6:0]   io_ldRawDataOut_0_uop_ctrl_fuOpType,
  output         io_ldRawDataOut_0_uop_ctrl_fpWen,
  output [2:0]   io_ldRawDataOut_0_addrOffset,
  input          io_replay_0_ready,
  output         io_replay_0_valid,
  output [9:0]   io_replay_0_bits_uop_cf_foldpc,
  output         io_replay_0_bits_uop_cf_trigger_backendEn_1,
  output         io_replay_0_bits_uop_cf_trigger_backendHit_0,
  output         io_replay_0_bits_uop_cf_trigger_backendHit_1,
  output         io_replay_0_bits_uop_cf_trigger_backendHit_4,
  output         io_replay_0_bits_uop_cf_waitForRobIdx_flag,
  output [4:0]   io_replay_0_bits_uop_cf_waitForRobIdx_value,
  output         io_replay_0_bits_uop_cf_loadWaitBit,
  output         io_replay_0_bits_uop_cf_loadWaitStrict,
  output         io_replay_0_bits_uop_cf_ftqPtr_flag,
  output [2:0]   io_replay_0_bits_uop_cf_ftqPtr_value,
  output [2:0]   io_replay_0_bits_uop_cf_ftqOffset,
  output [3:0]   io_replay_0_bits_uop_ctrl_fuType,
  output [6:0]   io_replay_0_bits_uop_ctrl_fuOpType,
  output         io_replay_0_bits_uop_ctrl_rfWen,
  output         io_replay_0_bits_uop_ctrl_fpWen,
  output [5:0]   io_replay_0_bits_uop_pdest,
  output         io_replay_0_bits_uop_robIdx_flag,
  output [4:0]   io_replay_0_bits_uop_robIdx_value,
  output         io_replay_0_bits_uop_lqIdx_flag,
  output [3:0]   io_replay_0_bits_uop_lqIdx_value,
  output         io_replay_0_bits_uop_sqIdx_flag,
  output [3:0]   io_replay_0_bits_uop_sqIdx_value,
  output [38:0]  io_replay_0_bits_vaddr,
  output         io_replay_0_bits_isFirstIssue,
  output [7:0]   io_replay_0_bits_replayCarry_real_way_en,
  output         io_replay_0_bits_replayCarry_valid,
  output [1:0]   io_replay_0_bits_mshrid,
  output         io_replay_0_bits_forward_tlDchannel,
  output         io_replay_0_bits_rarAllocated,
  output [3:0]   io_replay_0_bits_rarIndex,
  output         io_replay_0_bits_rawAllocated,
  output [2:0]   io_replay_0_bits_rawIndex,
  input          io_replay_1_ready,
  output         io_replay_1_valid,
  output [9:0]   io_replay_1_bits_uop_cf_foldpc,
  output         io_replay_1_bits_uop_cf_trigger_backendEn_1,
  output         io_replay_1_bits_uop_cf_trigger_backendHit_0,
  output         io_replay_1_bits_uop_cf_trigger_backendHit_1,
  output         io_replay_1_bits_uop_cf_trigger_backendHit_4,
  output         io_replay_1_bits_uop_cf_waitForRobIdx_flag,
  output [4:0]   io_replay_1_bits_uop_cf_waitForRobIdx_value,
  output         io_replay_1_bits_uop_cf_loadWaitBit,
  output         io_replay_1_bits_uop_cf_loadWaitStrict,
  output         io_replay_1_bits_uop_cf_ftqPtr_flag,
  output [2:0]   io_replay_1_bits_uop_cf_ftqPtr_value,
  output [2:0]   io_replay_1_bits_uop_cf_ftqOffset,
  output [3:0]   io_replay_1_bits_uop_ctrl_fuType,
  output [6:0]   io_replay_1_bits_uop_ctrl_fuOpType,
  output         io_replay_1_bits_uop_ctrl_rfWen,
  output         io_replay_1_bits_uop_ctrl_fpWen,
  output [5:0]   io_replay_1_bits_uop_pdest,
  output         io_replay_1_bits_uop_robIdx_flag,
  output [4:0]   io_replay_1_bits_uop_robIdx_value,
  output         io_replay_1_bits_uop_lqIdx_flag,
  output [3:0]   io_replay_1_bits_uop_lqIdx_value,
  output         io_replay_1_bits_uop_sqIdx_flag,
  output [3:0]   io_replay_1_bits_uop_sqIdx_value,
  output [38:0]  io_replay_1_bits_vaddr,
  output         io_replay_1_bits_isFirstIssue,
  output [7:0]   io_replay_1_bits_replayCarry_real_way_en,
  output         io_replay_1_bits_replayCarry_valid,
  output [1:0]   io_replay_1_bits_mshrid,
  output         io_replay_1_bits_forward_tlDchannel,
  output         io_replay_1_bits_rarAllocated,
  output [3:0]   io_replay_1_bits_rarIndex,
  output         io_replay_1_bits_rawAllocated,
  output [2:0]   io_replay_1_bits_rawIndex,
  input          io_sbuffer_0_ready,
  output         io_sbuffer_0_valid,
  output [35:0]  io_sbuffer_0_bits_addr,
  output [127:0] io_sbuffer_0_bits_data,
  output [15:0]  io_sbuffer_0_bits_mask,
  output [38:0]  io_sbuffer_0_bits_vaddr,
  output         io_sbuffer_0_bits_wline,
  input          io_sbuffer_1_ready,
  output         io_sbuffer_1_valid,
  output [35:0]  io_sbuffer_1_bits_addr,
  output [127:0] io_sbuffer_1_bits_data,
  output [15:0]  io_sbuffer_1_bits_mask,
  output [38:0]  io_sbuffer_1_bits_vaddr,
  output         io_sbuffer_1_bits_wline,
  input  [38:0]  io_forward_0_vaddr,
  input  [35:0]  io_forward_0_paddr,
  input          io_forward_0_uop_cf_waitForRobIdx_flag,
  input  [4:0]   io_forward_0_uop_cf_waitForRobIdx_value,
  input          io_forward_0_uop_sqIdx_flag,
  input  [3:0]   io_forward_0_uop_sqIdx_value,
  input          io_forward_0_valid,
  output         io_forward_0_forwardMask_0,
  output         io_forward_0_forwardMask_1,
  output         io_forward_0_forwardMask_2,
  output         io_forward_0_forwardMask_3,
  output         io_forward_0_forwardMask_4,
  output         io_forward_0_forwardMask_5,
  output         io_forward_0_forwardMask_6,
  output         io_forward_0_forwardMask_7,
  output         io_forward_0_forwardMask_8,
  output         io_forward_0_forwardMask_9,
  output         io_forward_0_forwardMask_10,
  output         io_forward_0_forwardMask_11,
  output         io_forward_0_forwardMask_12,
  output         io_forward_0_forwardMask_13,
  output         io_forward_0_forwardMask_14,
  output         io_forward_0_forwardMask_15,
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
  input          io_forward_0_sqIdx_flag,
  output         io_forward_0_dataInvalid,
  output         io_forward_0_matchInvalid,
  output         io_forward_0_schedWait,
  input  [11:0]  io_forward_0_sqIdxMask,
  output         io_forward_0_dataInvalidSqIdx_flag,
  output [3:0]   io_forward_0_dataInvalidSqIdx_value,
  output         io_forward_0_addrInvalidSqIdx_flag,
  output [3:0]   io_forward_0_addrInvalidSqIdx_value,
  input  [38:0]  io_forward_1_vaddr,
  input  [35:0]  io_forward_1_paddr,
  input          io_forward_1_uop_cf_waitForRobIdx_flag,
  input  [4:0]   io_forward_1_uop_cf_waitForRobIdx_value,
  input          io_forward_1_uop_sqIdx_flag,
  input  [3:0]   io_forward_1_uop_sqIdx_value,
  input          io_forward_1_valid,
  output         io_forward_1_forwardMask_0,
  output         io_forward_1_forwardMask_1,
  output         io_forward_1_forwardMask_2,
  output         io_forward_1_forwardMask_3,
  output         io_forward_1_forwardMask_4,
  output         io_forward_1_forwardMask_5,
  output         io_forward_1_forwardMask_6,
  output         io_forward_1_forwardMask_7,
  output         io_forward_1_forwardMask_8,
  output         io_forward_1_forwardMask_9,
  output         io_forward_1_forwardMask_10,
  output         io_forward_1_forwardMask_11,
  output         io_forward_1_forwardMask_12,
  output         io_forward_1_forwardMask_13,
  output         io_forward_1_forwardMask_14,
  output         io_forward_1_forwardMask_15,
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
  input          io_forward_1_sqIdx_flag,
  output         io_forward_1_dataInvalid,
  output         io_forward_1_matchInvalid,
  output         io_forward_1_schedWait,
  input  [11:0]  io_forward_1_sqIdxMask,
  output         io_forward_1_dataInvalidSqIdx_flag,
  output [3:0]   io_forward_1_dataInvalidSqIdx_value,
  output         io_forward_1_addrInvalidSqIdx_flag,
  output [3:0]   io_forward_1_addrInvalidSqIdx_value,
  input  [1:0]   io_rob_scommit,
  input          io_rob_pendingld,
  input          io_rob_pendingst,
  input          io_rob_commit,
  output         io_rob_isMMIO_0,
  output         io_rob_isMMIO_1,
  output [4:0]   io_rob_uop_0_robIdx_value,
  output [4:0]   io_rob_uop_1_robIdx_value,
  output         io_rollback_valid,
  output         io_rollback_bits_robIdx_flag,
  output [4:0]   io_rollback_bits_robIdx_value,
  output         io_rollback_bits_ftqIdx_flag,
  output [2:0]   io_rollback_bits_ftqIdx_value,
  output [2:0]   io_rollback_bits_ftqOffset,
  output [2:0]   io_rollback_bits_stFtqIdx_value,
  output [2:0]   io_rollback_bits_stFtqOffset,
  output         io_correctTableUpdate_valid,
  output [9:0]   io_correctTableUpdate_bits_addr,
  input          io_release_valid,
  input  [35:0]  io_release_bits_paddr,
  input          io_refill_valid,
  input  [1:0]   io_refill_bits_id,
  input          io_uncacheOutstanding,
  input          io_uncache_req_ready,
  output         io_uncache_req_valid,
  output [4:0]   io_uncache_req_bits_cmd,
  output [35:0]  io_uncache_req_bits_addr,
  output [63:0]  io_uncache_req_bits_data,
  output [7:0]   io_uncache_req_bits_mask,
  output         io_uncache_req_bits_atomic,
  output         io_uncache_resp_ready,
  input          io_uncache_resp_valid,
  input  [63:0]  io_uncache_resp_bits_data,
  input          io_mmioStout_ready,
  output         io_mmioStout_valid,
  output         io_mmioStout_bits_uop_cf_trigger_backendEn_0,
  output         io_mmioStout_bits_uop_robIdx_flag,
  output [4:0]   io_mmioStout_bits_uop_robIdx_value,
  output         io_sqEmpty,
  output         io_lqReplayFull,
  output [3:0]   io_sqCancelCnt,
  output [4:0]   io_lqCancelCnt,
  output [1:0]   io_lqDeq,
  output [1:0]   io_sqDeq,
  input          io_exceptionAddr_isStore,
  output [38:0]  io_exceptionAddr_vaddr,
  input          io_trigger_0_hitLoadAddrTriggerHitVec_0,
  input          io_trigger_0_hitLoadAddrTriggerHitVec_1,
  input          io_trigger_0_hitLoadAddrTriggerHitVec_2,
  output         io_trigger_0_lqLoadAddrTriggerHitVec_0,
  output         io_trigger_0_lqLoadAddrTriggerHitVec_1,
  output         io_trigger_0_lqLoadAddrTriggerHitVec_2,
  input          io_trigger_1_hitLoadAddrTriggerHitVec_0,
  input          io_trigger_1_hitLoadAddrTriggerHitVec_1,
  input          io_trigger_1_hitLoadAddrTriggerHitVec_2,
  output [5:0]   io_perf_0_value,
  output [5:0]   io_perf_1_value,
  output [5:0]   io_perf_2_value,
  output [5:0]   io_perf_3_value,
  output [5:0]   io_perf_4_value,
  output [5:0]   io_perf_5_value,
  output [5:0]   io_perf_6_value,
  output [5:0]   io_perf_7_value,
  output [5:0]   io_perf_8_value,
  output [5:0]   io_perf_9_value,
  output [5:0]   io_perf_10_value,
  output [5:0]   io_perf_11_value,
  output [5:0]   io_perf_12_value,
  output [5:0]   io_perf_13_value,
  output [5:0]   io_perf_14_value,
  output [5:0]   io_perf_15_value,
  output [5:0]   io_perf_16_value,
  output [5:0]   io_perf_17_value,
  output [5:0]   io_perf_18_value,
  output [5:0]   io_perf_19_value,
  output [5:0]   io_perf_20_value,
  output [5:0]   io_perf_21_value,
  output [5:0]   io_perf_22_value,
  output [5:0]   io_perf_23_value,
  output [5:0]   io_perf_24_value,
  output [5:0]   io_perf_25_value,
  output [5:0]   io_perf_26_value,
  output [5:0]   io_perf_27_value,
  output [5:0]   io_perf_28_value,
  output [5:0]   io_perf_29_value
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
`endif // RANDOMIZE_REG_INIT
  wire  loadQueue_clock; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_reset; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_redirect_valid; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_redirect_bits_robIdx_flag; // @[LSQWrapper.scala 113:25]
  wire [4:0] loadQueue_io_redirect_bits_robIdx_value; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_redirect_bits_level; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_enq_canAccept; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_enq_sqCanAccept; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_enq_req_0_valid; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_enq_req_0_bits_cf_trigger_backendEn_1; // @[LSQWrapper.scala 113:25]
  wire [6:0] loadQueue_io_enq_req_0_bits_ctrl_fuOpType; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_enq_req_0_bits_ctrl_rfWen; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_enq_req_0_bits_ctrl_fpWen; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_enq_req_0_bits_ctrl_flushPipe; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_enq_req_0_bits_ctrl_replayInst; // @[LSQWrapper.scala 113:25]
  wire [5:0] loadQueue_io_enq_req_0_bits_pdest; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_enq_req_0_bits_robIdx_flag; // @[LSQWrapper.scala 113:25]
  wire [4:0] loadQueue_io_enq_req_0_bits_robIdx_value; // @[LSQWrapper.scala 113:25]
  wire [3:0] loadQueue_io_enq_req_0_bits_lqIdx_value; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_enq_req_1_valid; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_enq_req_1_bits_cf_trigger_backendEn_1; // @[LSQWrapper.scala 113:25]
  wire [6:0] loadQueue_io_enq_req_1_bits_ctrl_fuOpType; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_enq_req_1_bits_ctrl_rfWen; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_enq_req_1_bits_ctrl_fpWen; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_enq_req_1_bits_ctrl_flushPipe; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_enq_req_1_bits_ctrl_replayInst; // @[LSQWrapper.scala 113:25]
  wire [5:0] loadQueue_io_enq_req_1_bits_pdest; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_enq_req_1_bits_robIdx_flag; // @[LSQWrapper.scala 113:25]
  wire [4:0] loadQueue_io_enq_req_1_bits_robIdx_value; // @[LSQWrapper.scala 113:25]
  wire [3:0] loadQueue_io_enq_req_1_bits_lqIdx_value; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_enq_req_2_valid; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_enq_req_2_bits_cf_trigger_backendEn_1; // @[LSQWrapper.scala 113:25]
  wire [6:0] loadQueue_io_enq_req_2_bits_ctrl_fuOpType; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_enq_req_2_bits_ctrl_rfWen; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_enq_req_2_bits_ctrl_fpWen; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_enq_req_2_bits_ctrl_flushPipe; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_enq_req_2_bits_ctrl_replayInst; // @[LSQWrapper.scala 113:25]
  wire [5:0] loadQueue_io_enq_req_2_bits_pdest; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_enq_req_2_bits_robIdx_flag; // @[LSQWrapper.scala 113:25]
  wire [4:0] loadQueue_io_enq_req_2_bits_robIdx_value; // @[LSQWrapper.scala 113:25]
  wire [3:0] loadQueue_io_enq_req_2_bits_lqIdx_value; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_enq_req_3_valid; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_enq_req_3_bits_cf_trigger_backendEn_1; // @[LSQWrapper.scala 113:25]
  wire [6:0] loadQueue_io_enq_req_3_bits_ctrl_fuOpType; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_enq_req_3_bits_ctrl_rfWen; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_enq_req_3_bits_ctrl_fpWen; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_enq_req_3_bits_ctrl_flushPipe; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_enq_req_3_bits_ctrl_replayInst; // @[LSQWrapper.scala 113:25]
  wire [5:0] loadQueue_io_enq_req_3_bits_pdest; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_enq_req_3_bits_robIdx_flag; // @[LSQWrapper.scala 113:25]
  wire [4:0] loadQueue_io_enq_req_3_bits_robIdx_value; // @[LSQWrapper.scala 113:25]
  wire [3:0] loadQueue_io_enq_req_3_bits_lqIdx_value; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s2_storeLoadViolationQuery_0_req_valid; // @[LSQWrapper.scala 113:25]
  wire [9:0] loadQueue_io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_cf_foldpc; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_cf_ftqPtr_flag; // @[LSQWrapper.scala 113:25]
  wire [2:0] loadQueue_io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_cf_ftqPtr_value; // @[LSQWrapper.scala 113:25]
  wire [2:0] loadQueue_io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_cf_ftqOffset; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_robIdx_flag; // @[LSQWrapper.scala 113:25]
  wire [4:0] loadQueue_io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_robIdx_value; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_sqIdx_flag; // @[LSQWrapper.scala 113:25]
  wire [3:0] loadQueue_io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_sqIdx_value; // @[LSQWrapper.scala 113:25]
  wire [2:0] loadQueue_io_ldu_s2_storeLoadViolationQuery_0_req_bits_index; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s2_storeLoadViolationQuery_0_req_bits_allocated; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s2_storeLoadViolationQuery_0_req_bits_datavalid; // @[LSQWrapper.scala 113:25]
  wire [7:0] loadQueue_io_ldu_s2_storeLoadViolationQuery_0_req_bits_mask; // @[LSQWrapper.scala 113:25]
  wire [35:0] loadQueue_io_ldu_s2_storeLoadViolationQuery_0_req_bits_paddr; // @[LSQWrapper.scala 113:25]
  wire [2:0] loadQueue_io_ldu_s2_storeLoadViolationQuery_0_resp_bits_index; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s2_storeLoadViolationQuery_0_resp_bits_canAccept; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s2_storeLoadViolationQuery_0_resp_bits_allocated; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s2_storeLoadViolationQuery_1_req_valid; // @[LSQWrapper.scala 113:25]
  wire [9:0] loadQueue_io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_cf_foldpc; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_cf_ftqPtr_flag; // @[LSQWrapper.scala 113:25]
  wire [2:0] loadQueue_io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_cf_ftqPtr_value; // @[LSQWrapper.scala 113:25]
  wire [2:0] loadQueue_io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_cf_ftqOffset; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_robIdx_flag; // @[LSQWrapper.scala 113:25]
  wire [4:0] loadQueue_io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_robIdx_value; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_sqIdx_flag; // @[LSQWrapper.scala 113:25]
  wire [3:0] loadQueue_io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_sqIdx_value; // @[LSQWrapper.scala 113:25]
  wire [2:0] loadQueue_io_ldu_s2_storeLoadViolationQuery_1_req_bits_index; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s2_storeLoadViolationQuery_1_req_bits_allocated; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s2_storeLoadViolationQuery_1_req_bits_datavalid; // @[LSQWrapper.scala 113:25]
  wire [7:0] loadQueue_io_ldu_s2_storeLoadViolationQuery_1_req_bits_mask; // @[LSQWrapper.scala 113:25]
  wire [35:0] loadQueue_io_ldu_s2_storeLoadViolationQuery_1_req_bits_paddr; // @[LSQWrapper.scala 113:25]
  wire [2:0] loadQueue_io_ldu_s2_storeLoadViolationQuery_1_resp_bits_index; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s2_storeLoadViolationQuery_1_resp_bits_canAccept; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s2_storeLoadViolationQuery_1_resp_bits_allocated; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s2_loadLoadViolationQuery_0_req_valid; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s2_loadLoadViolationQuery_0_req_bits_uop_robIdx_flag; // @[LSQWrapper.scala 113:25]
  wire [4:0] loadQueue_io_ldu_s2_loadLoadViolationQuery_0_req_bits_uop_robIdx_value; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s2_loadLoadViolationQuery_0_req_bits_uop_lqIdx_flag; // @[LSQWrapper.scala 113:25]
  wire [3:0] loadQueue_io_ldu_s2_loadLoadViolationQuery_0_req_bits_uop_lqIdx_value; // @[LSQWrapper.scala 113:25]
  wire [3:0] loadQueue_io_ldu_s2_loadLoadViolationQuery_0_req_bits_index; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s2_loadLoadViolationQuery_0_req_bits_allocated; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s2_loadLoadViolationQuery_0_req_bits_datavalid; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s2_loadLoadViolationQuery_0_req_bits_miss; // @[LSQWrapper.scala 113:25]
  wire [35:0] loadQueue_io_ldu_s2_loadLoadViolationQuery_0_req_bits_paddr; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s2_loadLoadViolationQuery_0_resp_valid; // @[LSQWrapper.scala 113:25]
  wire [3:0] loadQueue_io_ldu_s2_loadLoadViolationQuery_0_resp_bits_index; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s2_loadLoadViolationQuery_0_resp_bits_canAccept; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s2_loadLoadViolationQuery_0_resp_bits_allocated; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s2_loadLoadViolationQuery_0_resp_bits_replayFromFetch; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s2_loadLoadViolationQuery_1_req_valid; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s2_loadLoadViolationQuery_1_req_bits_uop_robIdx_flag; // @[LSQWrapper.scala 113:25]
  wire [4:0] loadQueue_io_ldu_s2_loadLoadViolationQuery_1_req_bits_uop_robIdx_value; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s2_loadLoadViolationQuery_1_req_bits_uop_lqIdx_flag; // @[LSQWrapper.scala 113:25]
  wire [3:0] loadQueue_io_ldu_s2_loadLoadViolationQuery_1_req_bits_uop_lqIdx_value; // @[LSQWrapper.scala 113:25]
  wire [3:0] loadQueue_io_ldu_s2_loadLoadViolationQuery_1_req_bits_index; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s2_loadLoadViolationQuery_1_req_bits_allocated; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s2_loadLoadViolationQuery_1_req_bits_datavalid; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s2_loadLoadViolationQuery_1_req_bits_miss; // @[LSQWrapper.scala 113:25]
  wire [35:0] loadQueue_io_ldu_s2_loadLoadViolationQuery_1_req_bits_paddr; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s2_loadLoadViolationQuery_1_resp_valid; // @[LSQWrapper.scala 113:25]
  wire [3:0] loadQueue_io_ldu_s2_loadLoadViolationQuery_1_resp_bits_index; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s2_loadLoadViolationQuery_1_resp_bits_canAccept; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s2_loadLoadViolationQuery_1_resp_bits_allocated; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s2_loadLoadViolationQuery_1_resp_bits_replayFromFetch; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_0_valid; // @[LSQWrapper.scala 113:25]
  wire [9:0] loadQueue_io_ldu_s3_loadIn_0_bits_uop_cf_foldpc; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_0_bits_uop_cf_exceptionVec_4; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_0_bits_uop_cf_exceptionVec_5; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_0_bits_uop_cf_exceptionVec_13; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_0_bits_uop_cf_trigger_backendEn_1; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_0_bits_uop_cf_trigger_backendHit_0; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_0_bits_uop_cf_trigger_backendHit_1; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_0_bits_uop_cf_trigger_backendHit_4; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_0_bits_uop_cf_waitForRobIdx_flag; // @[LSQWrapper.scala 113:25]
  wire [4:0] loadQueue_io_ldu_s3_loadIn_0_bits_uop_cf_waitForRobIdx_value; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_0_bits_uop_cf_loadWaitBit; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_0_bits_uop_cf_loadWaitStrict; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_0_bits_uop_cf_ftqPtr_flag; // @[LSQWrapper.scala 113:25]
  wire [2:0] loadQueue_io_ldu_s3_loadIn_0_bits_uop_cf_ftqPtr_value; // @[LSQWrapper.scala 113:25]
  wire [2:0] loadQueue_io_ldu_s3_loadIn_0_bits_uop_cf_ftqOffset; // @[LSQWrapper.scala 113:25]
  wire [3:0] loadQueue_io_ldu_s3_loadIn_0_bits_uop_ctrl_fuType; // @[LSQWrapper.scala 113:25]
  wire [6:0] loadQueue_io_ldu_s3_loadIn_0_bits_uop_ctrl_fuOpType; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_0_bits_uop_ctrl_rfWen; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_0_bits_uop_ctrl_fpWen; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_0_bits_uop_ctrl_replayInst; // @[LSQWrapper.scala 113:25]
  wire [5:0] loadQueue_io_ldu_s3_loadIn_0_bits_uop_pdest; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_0_bits_uop_robIdx_flag; // @[LSQWrapper.scala 113:25]
  wire [4:0] loadQueue_io_ldu_s3_loadIn_0_bits_uop_robIdx_value; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_0_bits_uop_lqIdx_flag; // @[LSQWrapper.scala 113:25]
  wire [3:0] loadQueue_io_ldu_s3_loadIn_0_bits_uop_lqIdx_value; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_0_bits_uop_sqIdx_flag; // @[LSQWrapper.scala 113:25]
  wire [3:0] loadQueue_io_ldu_s3_loadIn_0_bits_uop_sqIdx_value; // @[LSQWrapper.scala 113:25]
  wire [38:0] loadQueue_io_ldu_s3_loadIn_0_bits_vaddr; // @[LSQWrapper.scala 113:25]
  wire [35:0] loadQueue_io_ldu_s3_loadIn_0_bits_paddr; // @[LSQWrapper.scala 113:25]
  wire [15:0] loadQueue_io_ldu_s3_loadIn_0_bits_mask; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_0_bits_miss; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_0_bits_tlbMiss; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_0_bits_mmio; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_0_bits_rarAllocated; // @[LSQWrapper.scala 113:25]
  wire [3:0] loadQueue_io_ldu_s3_loadIn_0_bits_rarIndex; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_0_bits_rawAllocated; // @[LSQWrapper.scala 113:25]
  wire [2:0] loadQueue_io_ldu_s3_loadIn_0_bits_rawIndex; // @[LSQWrapper.scala 113:25]
  wire [1:0] loadQueue_io_ldu_s3_loadIn_0_bits_replayInfo_missMSHRId; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_0_bits_replayInfo_canForwardFullData; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_0_bits_replayInfo_dataInvalidSqIdx_flag; // @[LSQWrapper.scala 113:25]
  wire [3:0] loadQueue_io_ldu_s3_loadIn_0_bits_replayInfo_dataInvalidSqIdx_value; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_0_bits_replayInfo_addrInvalidSqIdx_flag; // @[LSQWrapper.scala 113:25]
  wire [3:0] loadQueue_io_ldu_s3_loadIn_0_bits_replayInfo_addrInvalidSqIdx_value; // @[LSQWrapper.scala 113:25]
  wire [7:0] loadQueue_io_ldu_s3_loadIn_0_bits_replayInfo_replayCarry_real_way_en; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_0_bits_replayInfo_replayCarry_valid; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_0_bits_replayInfo_dataInLastBeat; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_0_bits_replayInfo_cause_0; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_0_bits_replayInfo_cause_1; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_0_bits_replayInfo_cause_2; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_0_bits_replayInfo_cause_3; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_0_bits_replayInfo_cause_4; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_0_bits_replayInfo_cause_5; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_0_bits_replayInfo_cause_6; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_0_bits_replayInfo_cause_7; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_0_bits_lqDataWenDup_1; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_0_bits_lqDataWenDup_2; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_0_bits_lqDataWenDup_3; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_0_bits_lqDataWenDup_5; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_1_valid; // @[LSQWrapper.scala 113:25]
  wire [9:0] loadQueue_io_ldu_s3_loadIn_1_bits_uop_cf_foldpc; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_1_bits_uop_cf_exceptionVec_4; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_1_bits_uop_cf_exceptionVec_5; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_1_bits_uop_cf_exceptionVec_13; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_1_bits_uop_cf_trigger_backendEn_1; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_1_bits_uop_cf_trigger_backendHit_0; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_1_bits_uop_cf_trigger_backendHit_1; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_1_bits_uop_cf_trigger_backendHit_4; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_1_bits_uop_cf_waitForRobIdx_flag; // @[LSQWrapper.scala 113:25]
  wire [4:0] loadQueue_io_ldu_s3_loadIn_1_bits_uop_cf_waitForRobIdx_value; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_1_bits_uop_cf_loadWaitBit; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_1_bits_uop_cf_loadWaitStrict; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_1_bits_uop_cf_ftqPtr_flag; // @[LSQWrapper.scala 113:25]
  wire [2:0] loadQueue_io_ldu_s3_loadIn_1_bits_uop_cf_ftqPtr_value; // @[LSQWrapper.scala 113:25]
  wire [2:0] loadQueue_io_ldu_s3_loadIn_1_bits_uop_cf_ftqOffset; // @[LSQWrapper.scala 113:25]
  wire [3:0] loadQueue_io_ldu_s3_loadIn_1_bits_uop_ctrl_fuType; // @[LSQWrapper.scala 113:25]
  wire [6:0] loadQueue_io_ldu_s3_loadIn_1_bits_uop_ctrl_fuOpType; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_1_bits_uop_ctrl_rfWen; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_1_bits_uop_ctrl_fpWen; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_1_bits_uop_ctrl_replayInst; // @[LSQWrapper.scala 113:25]
  wire [5:0] loadQueue_io_ldu_s3_loadIn_1_bits_uop_pdest; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_1_bits_uop_robIdx_flag; // @[LSQWrapper.scala 113:25]
  wire [4:0] loadQueue_io_ldu_s3_loadIn_1_bits_uop_robIdx_value; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_1_bits_uop_lqIdx_flag; // @[LSQWrapper.scala 113:25]
  wire [3:0] loadQueue_io_ldu_s3_loadIn_1_bits_uop_lqIdx_value; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_1_bits_uop_sqIdx_flag; // @[LSQWrapper.scala 113:25]
  wire [3:0] loadQueue_io_ldu_s3_loadIn_1_bits_uop_sqIdx_value; // @[LSQWrapper.scala 113:25]
  wire [38:0] loadQueue_io_ldu_s3_loadIn_1_bits_vaddr; // @[LSQWrapper.scala 113:25]
  wire [35:0] loadQueue_io_ldu_s3_loadIn_1_bits_paddr; // @[LSQWrapper.scala 113:25]
  wire [15:0] loadQueue_io_ldu_s3_loadIn_1_bits_mask; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_1_bits_miss; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_1_bits_tlbMiss; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_1_bits_mmio; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_1_bits_rarAllocated; // @[LSQWrapper.scala 113:25]
  wire [3:0] loadQueue_io_ldu_s3_loadIn_1_bits_rarIndex; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_1_bits_rawAllocated; // @[LSQWrapper.scala 113:25]
  wire [2:0] loadQueue_io_ldu_s3_loadIn_1_bits_rawIndex; // @[LSQWrapper.scala 113:25]
  wire [1:0] loadQueue_io_ldu_s3_loadIn_1_bits_replayInfo_missMSHRId; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_1_bits_replayInfo_canForwardFullData; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_1_bits_replayInfo_dataInvalidSqIdx_flag; // @[LSQWrapper.scala 113:25]
  wire [3:0] loadQueue_io_ldu_s3_loadIn_1_bits_replayInfo_dataInvalidSqIdx_value; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_1_bits_replayInfo_addrInvalidSqIdx_flag; // @[LSQWrapper.scala 113:25]
  wire [3:0] loadQueue_io_ldu_s3_loadIn_1_bits_replayInfo_addrInvalidSqIdx_value; // @[LSQWrapper.scala 113:25]
  wire [7:0] loadQueue_io_ldu_s3_loadIn_1_bits_replayInfo_replayCarry_real_way_en; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_1_bits_replayInfo_replayCarry_valid; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_1_bits_replayInfo_dataInLastBeat; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_1_bits_replayInfo_cause_0; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_1_bits_replayInfo_cause_1; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_1_bits_replayInfo_cause_2; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_1_bits_replayInfo_cause_3; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_1_bits_replayInfo_cause_4; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_1_bits_replayInfo_cause_5; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_1_bits_replayInfo_cause_6; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_1_bits_replayInfo_cause_7; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_1_bits_lqDataWenDup_1; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_1_bits_lqDataWenDup_2; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_1_bits_lqDataWenDup_3; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldu_s3_loadIn_1_bits_lqDataWenDup_5; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_sta_s1_storeAddrIn_0_valid; // @[LSQWrapper.scala 113:25]
  wire [2:0] loadQueue_io_sta_s1_storeAddrIn_0_bits_uop_cf_ftqPtr_value; // @[LSQWrapper.scala 113:25]
  wire [2:0] loadQueue_io_sta_s1_storeAddrIn_0_bits_uop_cf_ftqOffset; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_sta_s1_storeAddrIn_0_bits_uop_robIdx_flag; // @[LSQWrapper.scala 113:25]
  wire [4:0] loadQueue_io_sta_s1_storeAddrIn_0_bits_uop_robIdx_value; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_sta_s1_storeAddrIn_0_bits_uop_sqIdx_flag; // @[LSQWrapper.scala 113:25]
  wire [3:0] loadQueue_io_sta_s1_storeAddrIn_0_bits_uop_sqIdx_value; // @[LSQWrapper.scala 113:25]
  wire [35:0] loadQueue_io_sta_s1_storeAddrIn_0_bits_paddr; // @[LSQWrapper.scala 113:25]
  wire [15:0] loadQueue_io_sta_s1_storeAddrIn_0_bits_mask; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_sta_s1_storeAddrIn_0_bits_miss; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_sta_s1_storeAddrIn_1_valid; // @[LSQWrapper.scala 113:25]
  wire [2:0] loadQueue_io_sta_s1_storeAddrIn_1_bits_uop_cf_ftqPtr_value; // @[LSQWrapper.scala 113:25]
  wire [2:0] loadQueue_io_sta_s1_storeAddrIn_1_bits_uop_cf_ftqOffset; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_sta_s1_storeAddrIn_1_bits_uop_robIdx_flag; // @[LSQWrapper.scala 113:25]
  wire [4:0] loadQueue_io_sta_s1_storeAddrIn_1_bits_uop_robIdx_value; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_sta_s1_storeAddrIn_1_bits_uop_sqIdx_flag; // @[LSQWrapper.scala 113:25]
  wire [3:0] loadQueue_io_sta_s1_storeAddrIn_1_bits_uop_sqIdx_value; // @[LSQWrapper.scala 113:25]
  wire [35:0] loadQueue_io_sta_s1_storeAddrIn_1_bits_paddr; // @[LSQWrapper.scala 113:25]
  wire [15:0] loadQueue_io_sta_s1_storeAddrIn_1_bits_mask; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_sta_s1_storeAddrIn_1_bits_miss; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_std_s0_storeDataIn_0_valid; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_std_s0_storeDataIn_0_bits_uop_sqIdx_flag; // @[LSQWrapper.scala 113:25]
  wire [3:0] loadQueue_io_std_s0_storeDataIn_0_bits_uop_sqIdx_value; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_std_s0_storeDataIn_1_valid; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_std_s0_storeDataIn_1_bits_uop_sqIdx_flag; // @[LSQWrapper.scala 113:25]
  wire [3:0] loadQueue_io_std_s0_storeDataIn_1_bits_uop_sqIdx_value; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_sq_stAddrReadySqPtr_flag; // @[LSQWrapper.scala 113:25]
  wire [3:0] loadQueue_io_sq_stAddrReadySqPtr_value; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_sq_stDataReadySqPtr_flag; // @[LSQWrapper.scala 113:25]
  wire [3:0] loadQueue_io_sq_stDataReadySqPtr_value; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_sq_sqEmpty; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_loadOut_0_ready; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_loadOut_0_valid; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_loadOut_0_bits_uop_cf_exceptionVec_4; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_loadOut_0_bits_uop_cf_exceptionVec_5; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_loadOut_0_bits_uop_cf_exceptionVec_13; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_loadOut_0_bits_uop_cf_trigger_backendEn_1; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_loadOut_0_bits_uop_cf_trigger_backendHit_0; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_loadOut_0_bits_uop_cf_trigger_backendHit_1; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_loadOut_0_bits_uop_cf_trigger_backendHit_4; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_loadOut_0_bits_uop_ctrl_rfWen; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_loadOut_0_bits_uop_ctrl_fpWen; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_loadOut_0_bits_uop_ctrl_flushPipe; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_loadOut_0_bits_uop_ctrl_replayInst; // @[LSQWrapper.scala 113:25]
  wire [5:0] loadQueue_io_loadOut_0_bits_uop_pdest; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_loadOut_0_bits_uop_robIdx_flag; // @[LSQWrapper.scala 113:25]
  wire [4:0] loadQueue_io_loadOut_0_bits_uop_robIdx_value; // @[LSQWrapper.scala 113:25]
  wire [63:0] loadQueue_io_ldRawDataOut_0_lqData; // @[LSQWrapper.scala 113:25]
  wire [6:0] loadQueue_io_ldRawDataOut_0_uop_ctrl_fuOpType; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_ldRawDataOut_0_uop_ctrl_fpWen; // @[LSQWrapper.scala 113:25]
  wire [2:0] loadQueue_io_ldRawDataOut_0_addrOffset; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_replay_0_ready; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_replay_0_valid; // @[LSQWrapper.scala 113:25]
  wire [9:0] loadQueue_io_replay_0_bits_uop_cf_foldpc; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_replay_0_bits_uop_cf_trigger_backendEn_1; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_replay_0_bits_uop_cf_trigger_backendHit_0; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_replay_0_bits_uop_cf_trigger_backendHit_1; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_replay_0_bits_uop_cf_trigger_backendHit_4; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_replay_0_bits_uop_cf_waitForRobIdx_flag; // @[LSQWrapper.scala 113:25]
  wire [4:0] loadQueue_io_replay_0_bits_uop_cf_waitForRobIdx_value; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_replay_0_bits_uop_cf_loadWaitBit; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_replay_0_bits_uop_cf_loadWaitStrict; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_replay_0_bits_uop_cf_ftqPtr_flag; // @[LSQWrapper.scala 113:25]
  wire [2:0] loadQueue_io_replay_0_bits_uop_cf_ftqPtr_value; // @[LSQWrapper.scala 113:25]
  wire [2:0] loadQueue_io_replay_0_bits_uop_cf_ftqOffset; // @[LSQWrapper.scala 113:25]
  wire [3:0] loadQueue_io_replay_0_bits_uop_ctrl_fuType; // @[LSQWrapper.scala 113:25]
  wire [6:0] loadQueue_io_replay_0_bits_uop_ctrl_fuOpType; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_replay_0_bits_uop_ctrl_rfWen; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_replay_0_bits_uop_ctrl_fpWen; // @[LSQWrapper.scala 113:25]
  wire [5:0] loadQueue_io_replay_0_bits_uop_pdest; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_replay_0_bits_uop_robIdx_flag; // @[LSQWrapper.scala 113:25]
  wire [4:0] loadQueue_io_replay_0_bits_uop_robIdx_value; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_replay_0_bits_uop_lqIdx_flag; // @[LSQWrapper.scala 113:25]
  wire [3:0] loadQueue_io_replay_0_bits_uop_lqIdx_value; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_replay_0_bits_uop_sqIdx_flag; // @[LSQWrapper.scala 113:25]
  wire [3:0] loadQueue_io_replay_0_bits_uop_sqIdx_value; // @[LSQWrapper.scala 113:25]
  wire [38:0] loadQueue_io_replay_0_bits_vaddr; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_replay_0_bits_isFirstIssue; // @[LSQWrapper.scala 113:25]
  wire [7:0] loadQueue_io_replay_0_bits_replayCarry_real_way_en; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_replay_0_bits_replayCarry_valid; // @[LSQWrapper.scala 113:25]
  wire [1:0] loadQueue_io_replay_0_bits_mshrid; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_replay_0_bits_forward_tlDchannel; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_replay_0_bits_rarAllocated; // @[LSQWrapper.scala 113:25]
  wire [3:0] loadQueue_io_replay_0_bits_rarIndex; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_replay_0_bits_rawAllocated; // @[LSQWrapper.scala 113:25]
  wire [2:0] loadQueue_io_replay_0_bits_rawIndex; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_replay_1_ready; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_replay_1_valid; // @[LSQWrapper.scala 113:25]
  wire [9:0] loadQueue_io_replay_1_bits_uop_cf_foldpc; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_replay_1_bits_uop_cf_trigger_backendEn_1; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_replay_1_bits_uop_cf_trigger_backendHit_0; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_replay_1_bits_uop_cf_trigger_backendHit_1; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_replay_1_bits_uop_cf_trigger_backendHit_4; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_replay_1_bits_uop_cf_waitForRobIdx_flag; // @[LSQWrapper.scala 113:25]
  wire [4:0] loadQueue_io_replay_1_bits_uop_cf_waitForRobIdx_value; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_replay_1_bits_uop_cf_loadWaitBit; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_replay_1_bits_uop_cf_loadWaitStrict; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_replay_1_bits_uop_cf_ftqPtr_flag; // @[LSQWrapper.scala 113:25]
  wire [2:0] loadQueue_io_replay_1_bits_uop_cf_ftqPtr_value; // @[LSQWrapper.scala 113:25]
  wire [2:0] loadQueue_io_replay_1_bits_uop_cf_ftqOffset; // @[LSQWrapper.scala 113:25]
  wire [3:0] loadQueue_io_replay_1_bits_uop_ctrl_fuType; // @[LSQWrapper.scala 113:25]
  wire [6:0] loadQueue_io_replay_1_bits_uop_ctrl_fuOpType; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_replay_1_bits_uop_ctrl_rfWen; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_replay_1_bits_uop_ctrl_fpWen; // @[LSQWrapper.scala 113:25]
  wire [5:0] loadQueue_io_replay_1_bits_uop_pdest; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_replay_1_bits_uop_robIdx_flag; // @[LSQWrapper.scala 113:25]
  wire [4:0] loadQueue_io_replay_1_bits_uop_robIdx_value; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_replay_1_bits_uop_lqIdx_flag; // @[LSQWrapper.scala 113:25]
  wire [3:0] loadQueue_io_replay_1_bits_uop_lqIdx_value; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_replay_1_bits_uop_sqIdx_flag; // @[LSQWrapper.scala 113:25]
  wire [3:0] loadQueue_io_replay_1_bits_uop_sqIdx_value; // @[LSQWrapper.scala 113:25]
  wire [38:0] loadQueue_io_replay_1_bits_vaddr; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_replay_1_bits_isFirstIssue; // @[LSQWrapper.scala 113:25]
  wire [7:0] loadQueue_io_replay_1_bits_replayCarry_real_way_en; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_replay_1_bits_replayCarry_valid; // @[LSQWrapper.scala 113:25]
  wire [1:0] loadQueue_io_replay_1_bits_mshrid; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_replay_1_bits_forward_tlDchannel; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_replay_1_bits_rarAllocated; // @[LSQWrapper.scala 113:25]
  wire [3:0] loadQueue_io_replay_1_bits_rarIndex; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_replay_1_bits_rawAllocated; // @[LSQWrapper.scala 113:25]
  wire [2:0] loadQueue_io_replay_1_bits_rawIndex; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_refill_valid; // @[LSQWrapper.scala 113:25]
  wire [1:0] loadQueue_io_refill_bits_id; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_release_valid; // @[LSQWrapper.scala 113:25]
  wire [35:0] loadQueue_io_release_bits_paddr; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_rollback_valid; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_rollback_bits_robIdx_flag; // @[LSQWrapper.scala 113:25]
  wire [4:0] loadQueue_io_rollback_bits_robIdx_value; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_rollback_bits_ftqIdx_flag; // @[LSQWrapper.scala 113:25]
  wire [2:0] loadQueue_io_rollback_bits_ftqIdx_value; // @[LSQWrapper.scala 113:25]
  wire [2:0] loadQueue_io_rollback_bits_ftqOffset; // @[LSQWrapper.scala 113:25]
  wire [2:0] loadQueue_io_rollback_bits_stFtqIdx_value; // @[LSQWrapper.scala 113:25]
  wire [2:0] loadQueue_io_rollback_bits_stFtqOffset; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_correctTableUpdate_valid; // @[LSQWrapper.scala 113:25]
  wire [9:0] loadQueue_io_correctTableUpdate_bits_addr; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_rob_pendingld; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_rob_commit; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_rob_isMMIO_0; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_rob_isMMIO_1; // @[LSQWrapper.scala 113:25]
  wire [4:0] loadQueue_io_rob_uop_0_robIdx_value; // @[LSQWrapper.scala 113:25]
  wire [4:0] loadQueue_io_rob_uop_1_robIdx_value; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_uncache_req_ready; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_uncache_req_valid; // @[LSQWrapper.scala 113:25]
  wire [35:0] loadQueue_io_uncache_req_bits_addr; // @[LSQWrapper.scala 113:25]
  wire [7:0] loadQueue_io_uncache_req_bits_mask; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_uncache_resp_valid; // @[LSQWrapper.scala 113:25]
  wire [63:0] loadQueue_io_uncache_resp_bits_data; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_trigger_0_hitLoadAddrTriggerHitVec_0; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_trigger_0_hitLoadAddrTriggerHitVec_1; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_trigger_0_hitLoadAddrTriggerHitVec_2; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_trigger_0_lqLoadAddrTriggerHitVec_0; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_trigger_0_lqLoadAddrTriggerHitVec_1; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_trigger_0_lqLoadAddrTriggerHitVec_2; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_trigger_1_hitLoadAddrTriggerHitVec_0; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_trigger_1_hitLoadAddrTriggerHitVec_1; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_trigger_1_hitLoadAddrTriggerHitVec_2; // @[LSQWrapper.scala 113:25]
  wire [38:0] loadQueue_io_exceptionAddr_vaddr; // @[LSQWrapper.scala 113:25]
  wire [1:0] loadQueue_io_lqDeq; // @[LSQWrapper.scala 113:25]
  wire [4:0] loadQueue_io_lqCancelCnt; // @[LSQWrapper.scala 113:25]
  wire  loadQueue_io_lqReplayFull; // @[LSQWrapper.scala 113:25]
  wire [5:0] loadQueue_io_tlbReplayDelayCycleCtrl_0; // @[LSQWrapper.scala 113:25]
  wire [5:0] loadQueue_io_tlbReplayDelayCycleCtrl_1; // @[LSQWrapper.scala 113:25]
  wire [5:0] loadQueue_io_tlbReplayDelayCycleCtrl_2; // @[LSQWrapper.scala 113:25]
  wire [5:0] loadQueue_io_tlbReplayDelayCycleCtrl_3; // @[LSQWrapper.scala 113:25]
  wire [5:0] loadQueue_io_perf_0_value; // @[LSQWrapper.scala 113:25]
  wire [5:0] loadQueue_io_perf_1_value; // @[LSQWrapper.scala 113:25]
  wire [5:0] loadQueue_io_perf_2_value; // @[LSQWrapper.scala 113:25]
  wire [5:0] loadQueue_io_perf_3_value; // @[LSQWrapper.scala 113:25]
  wire [5:0] loadQueue_io_perf_4_value; // @[LSQWrapper.scala 113:25]
  wire [5:0] loadQueue_io_perf_5_value; // @[LSQWrapper.scala 113:25]
  wire [5:0] loadQueue_io_perf_6_value; // @[LSQWrapper.scala 113:25]
  wire [5:0] loadQueue_io_perf_7_value; // @[LSQWrapper.scala 113:25]
  wire [5:0] loadQueue_io_perf_8_value; // @[LSQWrapper.scala 113:25]
  wire [5:0] loadQueue_io_perf_9_value; // @[LSQWrapper.scala 113:25]
  wire [5:0] loadQueue_io_perf_10_value; // @[LSQWrapper.scala 113:25]
  wire [5:0] loadQueue_io_perf_11_value; // @[LSQWrapper.scala 113:25]
  wire [5:0] loadQueue_io_perf_12_value; // @[LSQWrapper.scala 113:25]
  wire [5:0] loadQueue_io_perf_13_value; // @[LSQWrapper.scala 113:25]
  wire [5:0] loadQueue_io_perf_14_value; // @[LSQWrapper.scala 113:25]
  wire [5:0] loadQueue_io_perf_15_value; // @[LSQWrapper.scala 113:25]
  wire [5:0] loadQueue_io_perf_16_value; // @[LSQWrapper.scala 113:25]
  wire [5:0] loadQueue_io_perf_17_value; // @[LSQWrapper.scala 113:25]
  wire [5:0] loadQueue_io_perf_18_value; // @[LSQWrapper.scala 113:25]
  wire [5:0] loadQueue_io_perf_19_value; // @[LSQWrapper.scala 113:25]
  wire [5:0] loadQueue_io_perf_20_value; // @[LSQWrapper.scala 113:25]
  wire [5:0] loadQueue_io_perf_21_value; // @[LSQWrapper.scala 113:25]
  wire  storeQueue_clock; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_reset; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_enq_canAccept; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_enq_lqCanAccept; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_enq_req_0_valid; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_enq_req_0_bits_cf_trigger_backendEn_0; // @[LSQWrapper.scala 114:26]
  wire [6:0] storeQueue_io_enq_req_0_bits_ctrl_fuOpType; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_enq_req_0_bits_robIdx_flag; // @[LSQWrapper.scala 114:26]
  wire [4:0] storeQueue_io_enq_req_0_bits_robIdx_value; // @[LSQWrapper.scala 114:26]
  wire [3:0] storeQueue_io_enq_req_0_bits_sqIdx_value; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_enq_req_1_valid; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_enq_req_1_bits_cf_trigger_backendEn_0; // @[LSQWrapper.scala 114:26]
  wire [6:0] storeQueue_io_enq_req_1_bits_ctrl_fuOpType; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_enq_req_1_bits_robIdx_flag; // @[LSQWrapper.scala 114:26]
  wire [4:0] storeQueue_io_enq_req_1_bits_robIdx_value; // @[LSQWrapper.scala 114:26]
  wire [3:0] storeQueue_io_enq_req_1_bits_sqIdx_value; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_enq_req_2_valid; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_enq_req_2_bits_cf_trigger_backendEn_0; // @[LSQWrapper.scala 114:26]
  wire [6:0] storeQueue_io_enq_req_2_bits_ctrl_fuOpType; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_enq_req_2_bits_robIdx_flag; // @[LSQWrapper.scala 114:26]
  wire [4:0] storeQueue_io_enq_req_2_bits_robIdx_value; // @[LSQWrapper.scala 114:26]
  wire [3:0] storeQueue_io_enq_req_2_bits_sqIdx_value; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_enq_req_3_valid; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_enq_req_3_bits_cf_trigger_backendEn_0; // @[LSQWrapper.scala 114:26]
  wire [6:0] storeQueue_io_enq_req_3_bits_ctrl_fuOpType; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_enq_req_3_bits_robIdx_flag; // @[LSQWrapper.scala 114:26]
  wire [4:0] storeQueue_io_enq_req_3_bits_robIdx_value; // @[LSQWrapper.scala 114:26]
  wire [3:0] storeQueue_io_enq_req_3_bits_sqIdx_value; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_brqRedirect_valid; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_brqRedirect_bits_robIdx_flag; // @[LSQWrapper.scala 114:26]
  wire [4:0] storeQueue_io_brqRedirect_bits_robIdx_value; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_brqRedirect_bits_level; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_storeAddrIn_0_valid; // @[LSQWrapper.scala 114:26]
  wire [6:0] storeQueue_io_storeAddrIn_0_bits_uop_ctrl_fuOpType; // @[LSQWrapper.scala 114:26]
  wire [3:0] storeQueue_io_storeAddrIn_0_bits_uop_sqIdx_value; // @[LSQWrapper.scala 114:26]
  wire [38:0] storeQueue_io_storeAddrIn_0_bits_vaddr; // @[LSQWrapper.scala 114:26]
  wire [35:0] storeQueue_io_storeAddrIn_0_bits_paddr; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_storeAddrIn_0_bits_wlineflag; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_storeAddrIn_0_bits_miss; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_storeAddrIn_1_valid; // @[LSQWrapper.scala 114:26]
  wire [6:0] storeQueue_io_storeAddrIn_1_bits_uop_ctrl_fuOpType; // @[LSQWrapper.scala 114:26]
  wire [3:0] storeQueue_io_storeAddrIn_1_bits_uop_sqIdx_value; // @[LSQWrapper.scala 114:26]
  wire [38:0] storeQueue_io_storeAddrIn_1_bits_vaddr; // @[LSQWrapper.scala 114:26]
  wire [35:0] storeQueue_io_storeAddrIn_1_bits_paddr; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_storeAddrIn_1_bits_wlineflag; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_storeAddrIn_1_bits_miss; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_storeAddrInRe_0_mmio; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_storeAddrInRe_0_atomic; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_storeAddrInRe_1_mmio; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_storeAddrInRe_1_atomic; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_storeDataIn_0_valid; // @[LSQWrapper.scala 114:26]
  wire [6:0] storeQueue_io_storeDataIn_0_bits_uop_ctrl_fuOpType; // @[LSQWrapper.scala 114:26]
  wire [3:0] storeQueue_io_storeDataIn_0_bits_uop_sqIdx_value; // @[LSQWrapper.scala 114:26]
  wire [63:0] storeQueue_io_storeDataIn_0_bits_data; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_storeDataIn_1_valid; // @[LSQWrapper.scala 114:26]
  wire [6:0] storeQueue_io_storeDataIn_1_bits_uop_ctrl_fuOpType; // @[LSQWrapper.scala 114:26]
  wire [3:0] storeQueue_io_storeDataIn_1_bits_uop_sqIdx_value; // @[LSQWrapper.scala 114:26]
  wire [63:0] storeQueue_io_storeDataIn_1_bits_data; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_storeMaskIn_0_valid; // @[LSQWrapper.scala 114:26]
  wire [3:0] storeQueue_io_storeMaskIn_0_bits_sqIdx_value; // @[LSQWrapper.scala 114:26]
  wire [15:0] storeQueue_io_storeMaskIn_0_bits_mask; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_storeMaskIn_1_valid; // @[LSQWrapper.scala 114:26]
  wire [3:0] storeQueue_io_storeMaskIn_1_bits_sqIdx_value; // @[LSQWrapper.scala 114:26]
  wire [15:0] storeQueue_io_storeMaskIn_1_bits_mask; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_sbuffer_0_ready; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_sbuffer_0_valid; // @[LSQWrapper.scala 114:26]
  wire [35:0] storeQueue_io_sbuffer_0_bits_addr; // @[LSQWrapper.scala 114:26]
  wire [127:0] storeQueue_io_sbuffer_0_bits_data; // @[LSQWrapper.scala 114:26]
  wire [15:0] storeQueue_io_sbuffer_0_bits_mask; // @[LSQWrapper.scala 114:26]
  wire [38:0] storeQueue_io_sbuffer_0_bits_vaddr; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_sbuffer_0_bits_wline; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_sbuffer_1_ready; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_sbuffer_1_valid; // @[LSQWrapper.scala 114:26]
  wire [35:0] storeQueue_io_sbuffer_1_bits_addr; // @[LSQWrapper.scala 114:26]
  wire [127:0] storeQueue_io_sbuffer_1_bits_data; // @[LSQWrapper.scala 114:26]
  wire [15:0] storeQueue_io_sbuffer_1_bits_mask; // @[LSQWrapper.scala 114:26]
  wire [38:0] storeQueue_io_sbuffer_1_bits_vaddr; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_sbuffer_1_bits_wline; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_uncacheOutstanding; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_mmioStout_ready; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_mmioStout_valid; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_mmioStout_bits_uop_cf_trigger_backendEn_0; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_mmioStout_bits_uop_robIdx_flag; // @[LSQWrapper.scala 114:26]
  wire [4:0] storeQueue_io_mmioStout_bits_uop_robIdx_value; // @[LSQWrapper.scala 114:26]
  wire [38:0] storeQueue_io_forward_0_vaddr; // @[LSQWrapper.scala 114:26]
  wire [35:0] storeQueue_io_forward_0_paddr; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_forward_0_uop_cf_waitForRobIdx_flag; // @[LSQWrapper.scala 114:26]
  wire [4:0] storeQueue_io_forward_0_uop_cf_waitForRobIdx_value; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_forward_0_uop_sqIdx_flag; // @[LSQWrapper.scala 114:26]
  wire [3:0] storeQueue_io_forward_0_uop_sqIdx_value; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_forward_0_valid; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_forward_0_forwardMask_0; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_forward_0_forwardMask_1; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_forward_0_forwardMask_2; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_forward_0_forwardMask_3; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_forward_0_forwardMask_4; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_forward_0_forwardMask_5; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_forward_0_forwardMask_6; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_forward_0_forwardMask_7; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_forward_0_forwardMask_8; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_forward_0_forwardMask_9; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_forward_0_forwardMask_10; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_forward_0_forwardMask_11; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_forward_0_forwardMask_12; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_forward_0_forwardMask_13; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_forward_0_forwardMask_14; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_forward_0_forwardMask_15; // @[LSQWrapper.scala 114:26]
  wire [7:0] storeQueue_io_forward_0_forwardData_0; // @[LSQWrapper.scala 114:26]
  wire [7:0] storeQueue_io_forward_0_forwardData_1; // @[LSQWrapper.scala 114:26]
  wire [7:0] storeQueue_io_forward_0_forwardData_2; // @[LSQWrapper.scala 114:26]
  wire [7:0] storeQueue_io_forward_0_forwardData_3; // @[LSQWrapper.scala 114:26]
  wire [7:0] storeQueue_io_forward_0_forwardData_4; // @[LSQWrapper.scala 114:26]
  wire [7:0] storeQueue_io_forward_0_forwardData_5; // @[LSQWrapper.scala 114:26]
  wire [7:0] storeQueue_io_forward_0_forwardData_6; // @[LSQWrapper.scala 114:26]
  wire [7:0] storeQueue_io_forward_0_forwardData_7; // @[LSQWrapper.scala 114:26]
  wire [7:0] storeQueue_io_forward_0_forwardData_8; // @[LSQWrapper.scala 114:26]
  wire [7:0] storeQueue_io_forward_0_forwardData_9; // @[LSQWrapper.scala 114:26]
  wire [7:0] storeQueue_io_forward_0_forwardData_10; // @[LSQWrapper.scala 114:26]
  wire [7:0] storeQueue_io_forward_0_forwardData_11; // @[LSQWrapper.scala 114:26]
  wire [7:0] storeQueue_io_forward_0_forwardData_12; // @[LSQWrapper.scala 114:26]
  wire [7:0] storeQueue_io_forward_0_forwardData_13; // @[LSQWrapper.scala 114:26]
  wire [7:0] storeQueue_io_forward_0_forwardData_14; // @[LSQWrapper.scala 114:26]
  wire [7:0] storeQueue_io_forward_0_forwardData_15; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_forward_0_sqIdx_flag; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_forward_0_dataInvalid; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_forward_0_matchInvalid; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_forward_0_schedWait; // @[LSQWrapper.scala 114:26]
  wire [11:0] storeQueue_io_forward_0_sqIdxMask; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_forward_0_dataInvalidFast; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_forward_0_dataInvalidSqIdx_flag; // @[LSQWrapper.scala 114:26]
  wire [3:0] storeQueue_io_forward_0_dataInvalidSqIdx_value; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_forward_0_addrInvalidSqIdx_flag; // @[LSQWrapper.scala 114:26]
  wire [3:0] storeQueue_io_forward_0_addrInvalidSqIdx_value; // @[LSQWrapper.scala 114:26]
  wire [38:0] storeQueue_io_forward_1_vaddr; // @[LSQWrapper.scala 114:26]
  wire [35:0] storeQueue_io_forward_1_paddr; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_forward_1_uop_cf_waitForRobIdx_flag; // @[LSQWrapper.scala 114:26]
  wire [4:0] storeQueue_io_forward_1_uop_cf_waitForRobIdx_value; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_forward_1_uop_sqIdx_flag; // @[LSQWrapper.scala 114:26]
  wire [3:0] storeQueue_io_forward_1_uop_sqIdx_value; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_forward_1_valid; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_forward_1_forwardMask_0; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_forward_1_forwardMask_1; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_forward_1_forwardMask_2; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_forward_1_forwardMask_3; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_forward_1_forwardMask_4; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_forward_1_forwardMask_5; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_forward_1_forwardMask_6; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_forward_1_forwardMask_7; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_forward_1_forwardMask_8; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_forward_1_forwardMask_9; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_forward_1_forwardMask_10; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_forward_1_forwardMask_11; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_forward_1_forwardMask_12; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_forward_1_forwardMask_13; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_forward_1_forwardMask_14; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_forward_1_forwardMask_15; // @[LSQWrapper.scala 114:26]
  wire [7:0] storeQueue_io_forward_1_forwardData_0; // @[LSQWrapper.scala 114:26]
  wire [7:0] storeQueue_io_forward_1_forwardData_1; // @[LSQWrapper.scala 114:26]
  wire [7:0] storeQueue_io_forward_1_forwardData_2; // @[LSQWrapper.scala 114:26]
  wire [7:0] storeQueue_io_forward_1_forwardData_3; // @[LSQWrapper.scala 114:26]
  wire [7:0] storeQueue_io_forward_1_forwardData_4; // @[LSQWrapper.scala 114:26]
  wire [7:0] storeQueue_io_forward_1_forwardData_5; // @[LSQWrapper.scala 114:26]
  wire [7:0] storeQueue_io_forward_1_forwardData_6; // @[LSQWrapper.scala 114:26]
  wire [7:0] storeQueue_io_forward_1_forwardData_7; // @[LSQWrapper.scala 114:26]
  wire [7:0] storeQueue_io_forward_1_forwardData_8; // @[LSQWrapper.scala 114:26]
  wire [7:0] storeQueue_io_forward_1_forwardData_9; // @[LSQWrapper.scala 114:26]
  wire [7:0] storeQueue_io_forward_1_forwardData_10; // @[LSQWrapper.scala 114:26]
  wire [7:0] storeQueue_io_forward_1_forwardData_11; // @[LSQWrapper.scala 114:26]
  wire [7:0] storeQueue_io_forward_1_forwardData_12; // @[LSQWrapper.scala 114:26]
  wire [7:0] storeQueue_io_forward_1_forwardData_13; // @[LSQWrapper.scala 114:26]
  wire [7:0] storeQueue_io_forward_1_forwardData_14; // @[LSQWrapper.scala 114:26]
  wire [7:0] storeQueue_io_forward_1_forwardData_15; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_forward_1_sqIdx_flag; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_forward_1_dataInvalid; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_forward_1_matchInvalid; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_forward_1_schedWait; // @[LSQWrapper.scala 114:26]
  wire [11:0] storeQueue_io_forward_1_sqIdxMask; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_forward_1_dataInvalidFast; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_forward_1_dataInvalidSqIdx_flag; // @[LSQWrapper.scala 114:26]
  wire [3:0] storeQueue_io_forward_1_dataInvalidSqIdx_value; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_forward_1_addrInvalidSqIdx_flag; // @[LSQWrapper.scala 114:26]
  wire [3:0] storeQueue_io_forward_1_addrInvalidSqIdx_value; // @[LSQWrapper.scala 114:26]
  wire [1:0] storeQueue_io_rob_scommit; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_rob_pendingst; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_uncache_req_ready; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_uncache_req_valid; // @[LSQWrapper.scala 114:26]
  wire [35:0] storeQueue_io_uncache_req_bits_addr; // @[LSQWrapper.scala 114:26]
  wire [63:0] storeQueue_io_uncache_req_bits_data; // @[LSQWrapper.scala 114:26]
  wire [7:0] storeQueue_io_uncache_req_bits_mask; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_uncache_req_bits_atomic; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_uncache_resp_ready; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_uncache_resp_valid; // @[LSQWrapper.scala 114:26]
  wire [38:0] storeQueue_io_exceptionAddr_vaddr; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_sqEmpty; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_stAddrReadySqPtr_flag; // @[LSQWrapper.scala 114:26]
  wire [3:0] storeQueue_io_stAddrReadySqPtr_value; // @[LSQWrapper.scala 114:26]
  wire  storeQueue_io_stDataReadySqPtr_flag; // @[LSQWrapper.scala 114:26]
  wire [3:0] storeQueue_io_stDataReadySqPtr_value; // @[LSQWrapper.scala 114:26]
  wire [3:0] storeQueue_io_sqCancelCnt; // @[LSQWrapper.scala 114:26]
  wire [1:0] storeQueue_io_sqDeq; // @[LSQWrapper.scala 114:26]
  wire [5:0] storeQueue_io_perf_0_value; // @[LSQWrapper.scala 114:26]
  wire [5:0] storeQueue_io_perf_1_value; // @[LSQWrapper.scala 114:26]
  wire [5:0] storeQueue_io_perf_2_value; // @[LSQWrapper.scala 114:26]
  wire [5:0] storeQueue_io_perf_3_value; // @[LSQWrapper.scala 114:26]
  wire [5:0] storeQueue_io_perf_4_value; // @[LSQWrapper.scala 114:26]
  wire [5:0] storeQueue_io_perf_5_value; // @[LSQWrapper.scala 114:26]
  wire [5:0] storeQueue_io_perf_6_value; // @[LSQWrapper.scala 114:26]
  wire [5:0] storeQueue_io_perf_7_value; // @[LSQWrapper.scala 114:26]
  reg  io_exceptionAddr_vaddr_REG; // @[LSQWrapper.scala 194:40]
  reg [1:0] pendingstate; // @[LSQWrapper.scala 198:29]
  wire  _T_1 = io_uncache_req_ready & io_uncache_req_valid; // @[Decoupled.scala 50:35]
  wire  _T_5 = io_uncache_resp_ready & io_uncache_resp_valid; // @[Decoupled.scala 50:35]
  wire [1:0] _GEN_1 = _T_5 ? 2'h0 : pendingstate; // @[LSQWrapper.scala 208:35 209:22 198:29]
  wire  _GEN_19 = pendingstate == 2'h1 & io_uncache_resp_valid; // @[LSQWrapper.scala 231:34 232:23 221:35]
  wire  _GEN_30 = pendingstate == 2'h1 ? 1'h0 : io_uncache_resp_valid; // @[LSQWrapper.scala 231:34 222:36 234:23]
  reg [5:0] io_perf_0_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg [5:0] io_perf_0_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg [5:0] io_perf_1_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg [5:0] io_perf_1_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg [5:0] io_perf_2_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg [5:0] io_perf_2_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg [5:0] io_perf_3_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg [5:0] io_perf_3_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg [5:0] io_perf_4_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg [5:0] io_perf_4_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg [5:0] io_perf_5_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg [5:0] io_perf_5_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg [5:0] io_perf_6_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg [5:0] io_perf_6_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg [5:0] io_perf_7_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg [5:0] io_perf_7_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg [5:0] io_perf_8_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg [5:0] io_perf_8_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg [5:0] io_perf_9_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg [5:0] io_perf_9_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg [5:0] io_perf_10_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg [5:0] io_perf_10_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg [5:0] io_perf_11_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg [5:0] io_perf_11_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg [5:0] io_perf_12_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg [5:0] io_perf_12_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg [5:0] io_perf_13_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg [5:0] io_perf_13_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg [5:0] io_perf_14_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg [5:0] io_perf_14_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg [5:0] io_perf_15_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg [5:0] io_perf_15_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg [5:0] io_perf_16_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg [5:0] io_perf_16_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg [5:0] io_perf_17_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg [5:0] io_perf_17_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg [5:0] io_perf_18_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg [5:0] io_perf_18_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg [5:0] io_perf_19_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg [5:0] io_perf_19_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg [5:0] io_perf_20_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg [5:0] io_perf_20_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg [5:0] io_perf_21_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg [5:0] io_perf_21_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg [5:0] io_perf_22_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg [5:0] io_perf_22_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg [5:0] io_perf_23_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg [5:0] io_perf_23_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg [5:0] io_perf_24_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg [5:0] io_perf_24_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg [5:0] io_perf_25_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg [5:0] io_perf_25_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg [5:0] io_perf_26_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg [5:0] io_perf_26_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg [5:0] io_perf_27_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg [5:0] io_perf_27_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg [5:0] io_perf_28_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg [5:0] io_perf_28_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  reg [5:0] io_perf_29_value_REG; // @[PerfCounterUtils.scala 188:35]
  reg [5:0] io_perf_29_value_REG_1; // @[PerfCounterUtils.scala 188:27]
  LoadQueue loadQueue ( // @[LSQWrapper.scala 113:25]
    .clock(loadQueue_clock),
    .reset(loadQueue_reset),
    .io_redirect_valid(loadQueue_io_redirect_valid),
    .io_redirect_bits_robIdx_flag(loadQueue_io_redirect_bits_robIdx_flag),
    .io_redirect_bits_robIdx_value(loadQueue_io_redirect_bits_robIdx_value),
    .io_redirect_bits_level(loadQueue_io_redirect_bits_level),
    .io_enq_canAccept(loadQueue_io_enq_canAccept),
    .io_enq_sqCanAccept(loadQueue_io_enq_sqCanAccept),
    .io_enq_req_0_valid(loadQueue_io_enq_req_0_valid),
    .io_enq_req_0_bits_cf_trigger_backendEn_1(loadQueue_io_enq_req_0_bits_cf_trigger_backendEn_1),
    .io_enq_req_0_bits_ctrl_fuOpType(loadQueue_io_enq_req_0_bits_ctrl_fuOpType),
    .io_enq_req_0_bits_ctrl_rfWen(loadQueue_io_enq_req_0_bits_ctrl_rfWen),
    .io_enq_req_0_bits_ctrl_fpWen(loadQueue_io_enq_req_0_bits_ctrl_fpWen),
    .io_enq_req_0_bits_ctrl_flushPipe(loadQueue_io_enq_req_0_bits_ctrl_flushPipe),
    .io_enq_req_0_bits_ctrl_replayInst(loadQueue_io_enq_req_0_bits_ctrl_replayInst),
    .io_enq_req_0_bits_pdest(loadQueue_io_enq_req_0_bits_pdest),
    .io_enq_req_0_bits_robIdx_flag(loadQueue_io_enq_req_0_bits_robIdx_flag),
    .io_enq_req_0_bits_robIdx_value(loadQueue_io_enq_req_0_bits_robIdx_value),
    .io_enq_req_0_bits_lqIdx_value(loadQueue_io_enq_req_0_bits_lqIdx_value),
    .io_enq_req_1_valid(loadQueue_io_enq_req_1_valid),
    .io_enq_req_1_bits_cf_trigger_backendEn_1(loadQueue_io_enq_req_1_bits_cf_trigger_backendEn_1),
    .io_enq_req_1_bits_ctrl_fuOpType(loadQueue_io_enq_req_1_bits_ctrl_fuOpType),
    .io_enq_req_1_bits_ctrl_rfWen(loadQueue_io_enq_req_1_bits_ctrl_rfWen),
    .io_enq_req_1_bits_ctrl_fpWen(loadQueue_io_enq_req_1_bits_ctrl_fpWen),
    .io_enq_req_1_bits_ctrl_flushPipe(loadQueue_io_enq_req_1_bits_ctrl_flushPipe),
    .io_enq_req_1_bits_ctrl_replayInst(loadQueue_io_enq_req_1_bits_ctrl_replayInst),
    .io_enq_req_1_bits_pdest(loadQueue_io_enq_req_1_bits_pdest),
    .io_enq_req_1_bits_robIdx_flag(loadQueue_io_enq_req_1_bits_robIdx_flag),
    .io_enq_req_1_bits_robIdx_value(loadQueue_io_enq_req_1_bits_robIdx_value),
    .io_enq_req_1_bits_lqIdx_value(loadQueue_io_enq_req_1_bits_lqIdx_value),
    .io_enq_req_2_valid(loadQueue_io_enq_req_2_valid),
    .io_enq_req_2_bits_cf_trigger_backendEn_1(loadQueue_io_enq_req_2_bits_cf_trigger_backendEn_1),
    .io_enq_req_2_bits_ctrl_fuOpType(loadQueue_io_enq_req_2_bits_ctrl_fuOpType),
    .io_enq_req_2_bits_ctrl_rfWen(loadQueue_io_enq_req_2_bits_ctrl_rfWen),
    .io_enq_req_2_bits_ctrl_fpWen(loadQueue_io_enq_req_2_bits_ctrl_fpWen),
    .io_enq_req_2_bits_ctrl_flushPipe(loadQueue_io_enq_req_2_bits_ctrl_flushPipe),
    .io_enq_req_2_bits_ctrl_replayInst(loadQueue_io_enq_req_2_bits_ctrl_replayInst),
    .io_enq_req_2_bits_pdest(loadQueue_io_enq_req_2_bits_pdest),
    .io_enq_req_2_bits_robIdx_flag(loadQueue_io_enq_req_2_bits_robIdx_flag),
    .io_enq_req_2_bits_robIdx_value(loadQueue_io_enq_req_2_bits_robIdx_value),
    .io_enq_req_2_bits_lqIdx_value(loadQueue_io_enq_req_2_bits_lqIdx_value),
    .io_enq_req_3_valid(loadQueue_io_enq_req_3_valid),
    .io_enq_req_3_bits_cf_trigger_backendEn_1(loadQueue_io_enq_req_3_bits_cf_trigger_backendEn_1),
    .io_enq_req_3_bits_ctrl_fuOpType(loadQueue_io_enq_req_3_bits_ctrl_fuOpType),
    .io_enq_req_3_bits_ctrl_rfWen(loadQueue_io_enq_req_3_bits_ctrl_rfWen),
    .io_enq_req_3_bits_ctrl_fpWen(loadQueue_io_enq_req_3_bits_ctrl_fpWen),
    .io_enq_req_3_bits_ctrl_flushPipe(loadQueue_io_enq_req_3_bits_ctrl_flushPipe),
    .io_enq_req_3_bits_ctrl_replayInst(loadQueue_io_enq_req_3_bits_ctrl_replayInst),
    .io_enq_req_3_bits_pdest(loadQueue_io_enq_req_3_bits_pdest),
    .io_enq_req_3_bits_robIdx_flag(loadQueue_io_enq_req_3_bits_robIdx_flag),
    .io_enq_req_3_bits_robIdx_value(loadQueue_io_enq_req_3_bits_robIdx_value),
    .io_enq_req_3_bits_lqIdx_value(loadQueue_io_enq_req_3_bits_lqIdx_value),
    .io_ldu_s2_storeLoadViolationQuery_0_req_valid(loadQueue_io_ldu_s2_storeLoadViolationQuery_0_req_valid),
    .io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_cf_foldpc(
      loadQueue_io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_cf_foldpc),
    .io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_cf_ftqPtr_flag(
      loadQueue_io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_cf_ftqPtr_flag),
    .io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_cf_ftqPtr_value(
      loadQueue_io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_cf_ftqPtr_value),
    .io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_cf_ftqOffset(
      loadQueue_io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_cf_ftqOffset),
    .io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_robIdx_flag(
      loadQueue_io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_robIdx_flag),
    .io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_robIdx_value(
      loadQueue_io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_robIdx_value),
    .io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_sqIdx_flag(
      loadQueue_io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_sqIdx_flag),
    .io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_sqIdx_value(
      loadQueue_io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_sqIdx_value),
    .io_ldu_s2_storeLoadViolationQuery_0_req_bits_index(loadQueue_io_ldu_s2_storeLoadViolationQuery_0_req_bits_index),
    .io_ldu_s2_storeLoadViolationQuery_0_req_bits_allocated(
      loadQueue_io_ldu_s2_storeLoadViolationQuery_0_req_bits_allocated),
    .io_ldu_s2_storeLoadViolationQuery_0_req_bits_datavalid(
      loadQueue_io_ldu_s2_storeLoadViolationQuery_0_req_bits_datavalid),
    .io_ldu_s2_storeLoadViolationQuery_0_req_bits_mask(loadQueue_io_ldu_s2_storeLoadViolationQuery_0_req_bits_mask),
    .io_ldu_s2_storeLoadViolationQuery_0_req_bits_paddr(loadQueue_io_ldu_s2_storeLoadViolationQuery_0_req_bits_paddr),
    .io_ldu_s2_storeLoadViolationQuery_0_resp_bits_index(loadQueue_io_ldu_s2_storeLoadViolationQuery_0_resp_bits_index),
    .io_ldu_s2_storeLoadViolationQuery_0_resp_bits_canAccept(
      loadQueue_io_ldu_s2_storeLoadViolationQuery_0_resp_bits_canAccept),
    .io_ldu_s2_storeLoadViolationQuery_0_resp_bits_allocated(
      loadQueue_io_ldu_s2_storeLoadViolationQuery_0_resp_bits_allocated),
    .io_ldu_s2_storeLoadViolationQuery_1_req_valid(loadQueue_io_ldu_s2_storeLoadViolationQuery_1_req_valid),
    .io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_cf_foldpc(
      loadQueue_io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_cf_foldpc),
    .io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_cf_ftqPtr_flag(
      loadQueue_io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_cf_ftqPtr_flag),
    .io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_cf_ftqPtr_value(
      loadQueue_io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_cf_ftqPtr_value),
    .io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_cf_ftqOffset(
      loadQueue_io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_cf_ftqOffset),
    .io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_robIdx_flag(
      loadQueue_io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_robIdx_flag),
    .io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_robIdx_value(
      loadQueue_io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_robIdx_value),
    .io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_sqIdx_flag(
      loadQueue_io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_sqIdx_flag),
    .io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_sqIdx_value(
      loadQueue_io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_sqIdx_value),
    .io_ldu_s2_storeLoadViolationQuery_1_req_bits_index(loadQueue_io_ldu_s2_storeLoadViolationQuery_1_req_bits_index),
    .io_ldu_s2_storeLoadViolationQuery_1_req_bits_allocated(
      loadQueue_io_ldu_s2_storeLoadViolationQuery_1_req_bits_allocated),
    .io_ldu_s2_storeLoadViolationQuery_1_req_bits_datavalid(
      loadQueue_io_ldu_s2_storeLoadViolationQuery_1_req_bits_datavalid),
    .io_ldu_s2_storeLoadViolationQuery_1_req_bits_mask(loadQueue_io_ldu_s2_storeLoadViolationQuery_1_req_bits_mask),
    .io_ldu_s2_storeLoadViolationQuery_1_req_bits_paddr(loadQueue_io_ldu_s2_storeLoadViolationQuery_1_req_bits_paddr),
    .io_ldu_s2_storeLoadViolationQuery_1_resp_bits_index(loadQueue_io_ldu_s2_storeLoadViolationQuery_1_resp_bits_index),
    .io_ldu_s2_storeLoadViolationQuery_1_resp_bits_canAccept(
      loadQueue_io_ldu_s2_storeLoadViolationQuery_1_resp_bits_canAccept),
    .io_ldu_s2_storeLoadViolationQuery_1_resp_bits_allocated(
      loadQueue_io_ldu_s2_storeLoadViolationQuery_1_resp_bits_allocated),
    .io_ldu_s2_loadLoadViolationQuery_0_req_valid(loadQueue_io_ldu_s2_loadLoadViolationQuery_0_req_valid),
    .io_ldu_s2_loadLoadViolationQuery_0_req_bits_uop_robIdx_flag(
      loadQueue_io_ldu_s2_loadLoadViolationQuery_0_req_bits_uop_robIdx_flag),
    .io_ldu_s2_loadLoadViolationQuery_0_req_bits_uop_robIdx_value(
      loadQueue_io_ldu_s2_loadLoadViolationQuery_0_req_bits_uop_robIdx_value),
    .io_ldu_s2_loadLoadViolationQuery_0_req_bits_uop_lqIdx_flag(
      loadQueue_io_ldu_s2_loadLoadViolationQuery_0_req_bits_uop_lqIdx_flag),
    .io_ldu_s2_loadLoadViolationQuery_0_req_bits_uop_lqIdx_value(
      loadQueue_io_ldu_s2_loadLoadViolationQuery_0_req_bits_uop_lqIdx_value),
    .io_ldu_s2_loadLoadViolationQuery_0_req_bits_index(loadQueue_io_ldu_s2_loadLoadViolationQuery_0_req_bits_index),
    .io_ldu_s2_loadLoadViolationQuery_0_req_bits_allocated(
      loadQueue_io_ldu_s2_loadLoadViolationQuery_0_req_bits_allocated),
    .io_ldu_s2_loadLoadViolationQuery_0_req_bits_datavalid(
      loadQueue_io_ldu_s2_loadLoadViolationQuery_0_req_bits_datavalid),
    .io_ldu_s2_loadLoadViolationQuery_0_req_bits_miss(loadQueue_io_ldu_s2_loadLoadViolationQuery_0_req_bits_miss),
    .io_ldu_s2_loadLoadViolationQuery_0_req_bits_paddr(loadQueue_io_ldu_s2_loadLoadViolationQuery_0_req_bits_paddr),
    .io_ldu_s2_loadLoadViolationQuery_0_resp_valid(loadQueue_io_ldu_s2_loadLoadViolationQuery_0_resp_valid),
    .io_ldu_s2_loadLoadViolationQuery_0_resp_bits_index(loadQueue_io_ldu_s2_loadLoadViolationQuery_0_resp_bits_index),
    .io_ldu_s2_loadLoadViolationQuery_0_resp_bits_canAccept(
      loadQueue_io_ldu_s2_loadLoadViolationQuery_0_resp_bits_canAccept),
    .io_ldu_s2_loadLoadViolationQuery_0_resp_bits_allocated(
      loadQueue_io_ldu_s2_loadLoadViolationQuery_0_resp_bits_allocated),
    .io_ldu_s2_loadLoadViolationQuery_0_resp_bits_replayFromFetch(
      loadQueue_io_ldu_s2_loadLoadViolationQuery_0_resp_bits_replayFromFetch),
    .io_ldu_s2_loadLoadViolationQuery_1_req_valid(loadQueue_io_ldu_s2_loadLoadViolationQuery_1_req_valid),
    .io_ldu_s2_loadLoadViolationQuery_1_req_bits_uop_robIdx_flag(
      loadQueue_io_ldu_s2_loadLoadViolationQuery_1_req_bits_uop_robIdx_flag),
    .io_ldu_s2_loadLoadViolationQuery_1_req_bits_uop_robIdx_value(
      loadQueue_io_ldu_s2_loadLoadViolationQuery_1_req_bits_uop_robIdx_value),
    .io_ldu_s2_loadLoadViolationQuery_1_req_bits_uop_lqIdx_flag(
      loadQueue_io_ldu_s2_loadLoadViolationQuery_1_req_bits_uop_lqIdx_flag),
    .io_ldu_s2_loadLoadViolationQuery_1_req_bits_uop_lqIdx_value(
      loadQueue_io_ldu_s2_loadLoadViolationQuery_1_req_bits_uop_lqIdx_value),
    .io_ldu_s2_loadLoadViolationQuery_1_req_bits_index(loadQueue_io_ldu_s2_loadLoadViolationQuery_1_req_bits_index),
    .io_ldu_s2_loadLoadViolationQuery_1_req_bits_allocated(
      loadQueue_io_ldu_s2_loadLoadViolationQuery_1_req_bits_allocated),
    .io_ldu_s2_loadLoadViolationQuery_1_req_bits_datavalid(
      loadQueue_io_ldu_s2_loadLoadViolationQuery_1_req_bits_datavalid),
    .io_ldu_s2_loadLoadViolationQuery_1_req_bits_miss(loadQueue_io_ldu_s2_loadLoadViolationQuery_1_req_bits_miss),
    .io_ldu_s2_loadLoadViolationQuery_1_req_bits_paddr(loadQueue_io_ldu_s2_loadLoadViolationQuery_1_req_bits_paddr),
    .io_ldu_s2_loadLoadViolationQuery_1_resp_valid(loadQueue_io_ldu_s2_loadLoadViolationQuery_1_resp_valid),
    .io_ldu_s2_loadLoadViolationQuery_1_resp_bits_index(loadQueue_io_ldu_s2_loadLoadViolationQuery_1_resp_bits_index),
    .io_ldu_s2_loadLoadViolationQuery_1_resp_bits_canAccept(
      loadQueue_io_ldu_s2_loadLoadViolationQuery_1_resp_bits_canAccept),
    .io_ldu_s2_loadLoadViolationQuery_1_resp_bits_allocated(
      loadQueue_io_ldu_s2_loadLoadViolationQuery_1_resp_bits_allocated),
    .io_ldu_s2_loadLoadViolationQuery_1_resp_bits_replayFromFetch(
      loadQueue_io_ldu_s2_loadLoadViolationQuery_1_resp_bits_replayFromFetch),
    .io_ldu_s3_loadIn_0_valid(loadQueue_io_ldu_s3_loadIn_0_valid),
    .io_ldu_s3_loadIn_0_bits_uop_cf_foldpc(loadQueue_io_ldu_s3_loadIn_0_bits_uop_cf_foldpc),
    .io_ldu_s3_loadIn_0_bits_uop_cf_exceptionVec_4(loadQueue_io_ldu_s3_loadIn_0_bits_uop_cf_exceptionVec_4),
    .io_ldu_s3_loadIn_0_bits_uop_cf_exceptionVec_5(loadQueue_io_ldu_s3_loadIn_0_bits_uop_cf_exceptionVec_5),
    .io_ldu_s3_loadIn_0_bits_uop_cf_exceptionVec_13(loadQueue_io_ldu_s3_loadIn_0_bits_uop_cf_exceptionVec_13),
    .io_ldu_s3_loadIn_0_bits_uop_cf_trigger_backendEn_1(loadQueue_io_ldu_s3_loadIn_0_bits_uop_cf_trigger_backendEn_1),
    .io_ldu_s3_loadIn_0_bits_uop_cf_trigger_backendHit_0(loadQueue_io_ldu_s3_loadIn_0_bits_uop_cf_trigger_backendHit_0),
    .io_ldu_s3_loadIn_0_bits_uop_cf_trigger_backendHit_1(loadQueue_io_ldu_s3_loadIn_0_bits_uop_cf_trigger_backendHit_1),
    .io_ldu_s3_loadIn_0_bits_uop_cf_trigger_backendHit_4(loadQueue_io_ldu_s3_loadIn_0_bits_uop_cf_trigger_backendHit_4),
    .io_ldu_s3_loadIn_0_bits_uop_cf_waitForRobIdx_flag(loadQueue_io_ldu_s3_loadIn_0_bits_uop_cf_waitForRobIdx_flag),
    .io_ldu_s3_loadIn_0_bits_uop_cf_waitForRobIdx_value(loadQueue_io_ldu_s3_loadIn_0_bits_uop_cf_waitForRobIdx_value),
    .io_ldu_s3_loadIn_0_bits_uop_cf_loadWaitBit(loadQueue_io_ldu_s3_loadIn_0_bits_uop_cf_loadWaitBit),
    .io_ldu_s3_loadIn_0_bits_uop_cf_loadWaitStrict(loadQueue_io_ldu_s3_loadIn_0_bits_uop_cf_loadWaitStrict),
    .io_ldu_s3_loadIn_0_bits_uop_cf_ftqPtr_flag(loadQueue_io_ldu_s3_loadIn_0_bits_uop_cf_ftqPtr_flag),
    .io_ldu_s3_loadIn_0_bits_uop_cf_ftqPtr_value(loadQueue_io_ldu_s3_loadIn_0_bits_uop_cf_ftqPtr_value),
    .io_ldu_s3_loadIn_0_bits_uop_cf_ftqOffset(loadQueue_io_ldu_s3_loadIn_0_bits_uop_cf_ftqOffset),
    .io_ldu_s3_loadIn_0_bits_uop_ctrl_fuType(loadQueue_io_ldu_s3_loadIn_0_bits_uop_ctrl_fuType),
    .io_ldu_s3_loadIn_0_bits_uop_ctrl_fuOpType(loadQueue_io_ldu_s3_loadIn_0_bits_uop_ctrl_fuOpType),
    .io_ldu_s3_loadIn_0_bits_uop_ctrl_rfWen(loadQueue_io_ldu_s3_loadIn_0_bits_uop_ctrl_rfWen),
    .io_ldu_s3_loadIn_0_bits_uop_ctrl_fpWen(loadQueue_io_ldu_s3_loadIn_0_bits_uop_ctrl_fpWen),
    .io_ldu_s3_loadIn_0_bits_uop_ctrl_replayInst(loadQueue_io_ldu_s3_loadIn_0_bits_uop_ctrl_replayInst),
    .io_ldu_s3_loadIn_0_bits_uop_pdest(loadQueue_io_ldu_s3_loadIn_0_bits_uop_pdest),
    .io_ldu_s3_loadIn_0_bits_uop_robIdx_flag(loadQueue_io_ldu_s3_loadIn_0_bits_uop_robIdx_flag),
    .io_ldu_s3_loadIn_0_bits_uop_robIdx_value(loadQueue_io_ldu_s3_loadIn_0_bits_uop_robIdx_value),
    .io_ldu_s3_loadIn_0_bits_uop_lqIdx_flag(loadQueue_io_ldu_s3_loadIn_0_bits_uop_lqIdx_flag),
    .io_ldu_s3_loadIn_0_bits_uop_lqIdx_value(loadQueue_io_ldu_s3_loadIn_0_bits_uop_lqIdx_value),
    .io_ldu_s3_loadIn_0_bits_uop_sqIdx_flag(loadQueue_io_ldu_s3_loadIn_0_bits_uop_sqIdx_flag),
    .io_ldu_s3_loadIn_0_bits_uop_sqIdx_value(loadQueue_io_ldu_s3_loadIn_0_bits_uop_sqIdx_value),
    .io_ldu_s3_loadIn_0_bits_vaddr(loadQueue_io_ldu_s3_loadIn_0_bits_vaddr),
    .io_ldu_s3_loadIn_0_bits_paddr(loadQueue_io_ldu_s3_loadIn_0_bits_paddr),
    .io_ldu_s3_loadIn_0_bits_mask(loadQueue_io_ldu_s3_loadIn_0_bits_mask),
    .io_ldu_s3_loadIn_0_bits_miss(loadQueue_io_ldu_s3_loadIn_0_bits_miss),
    .io_ldu_s3_loadIn_0_bits_tlbMiss(loadQueue_io_ldu_s3_loadIn_0_bits_tlbMiss),
    .io_ldu_s3_loadIn_0_bits_mmio(loadQueue_io_ldu_s3_loadIn_0_bits_mmio),
    .io_ldu_s3_loadIn_0_bits_rarAllocated(loadQueue_io_ldu_s3_loadIn_0_bits_rarAllocated),
    .io_ldu_s3_loadIn_0_bits_rarIndex(loadQueue_io_ldu_s3_loadIn_0_bits_rarIndex),
    .io_ldu_s3_loadIn_0_bits_rawAllocated(loadQueue_io_ldu_s3_loadIn_0_bits_rawAllocated),
    .io_ldu_s3_loadIn_0_bits_rawIndex(loadQueue_io_ldu_s3_loadIn_0_bits_rawIndex),
    .io_ldu_s3_loadIn_0_bits_replayInfo_missMSHRId(loadQueue_io_ldu_s3_loadIn_0_bits_replayInfo_missMSHRId),
    .io_ldu_s3_loadIn_0_bits_replayInfo_canForwardFullData(
      loadQueue_io_ldu_s3_loadIn_0_bits_replayInfo_canForwardFullData),
    .io_ldu_s3_loadIn_0_bits_replayInfo_dataInvalidSqIdx_flag(
      loadQueue_io_ldu_s3_loadIn_0_bits_replayInfo_dataInvalidSqIdx_flag),
    .io_ldu_s3_loadIn_0_bits_replayInfo_dataInvalidSqIdx_value(
      loadQueue_io_ldu_s3_loadIn_0_bits_replayInfo_dataInvalidSqIdx_value),
    .io_ldu_s3_loadIn_0_bits_replayInfo_addrInvalidSqIdx_flag(
      loadQueue_io_ldu_s3_loadIn_0_bits_replayInfo_addrInvalidSqIdx_flag),
    .io_ldu_s3_loadIn_0_bits_replayInfo_addrInvalidSqIdx_value(
      loadQueue_io_ldu_s3_loadIn_0_bits_replayInfo_addrInvalidSqIdx_value),
    .io_ldu_s3_loadIn_0_bits_replayInfo_replayCarry_real_way_en(
      loadQueue_io_ldu_s3_loadIn_0_bits_replayInfo_replayCarry_real_way_en),
    .io_ldu_s3_loadIn_0_bits_replayInfo_replayCarry_valid(loadQueue_io_ldu_s3_loadIn_0_bits_replayInfo_replayCarry_valid
      ),
    .io_ldu_s3_loadIn_0_bits_replayInfo_dataInLastBeat(loadQueue_io_ldu_s3_loadIn_0_bits_replayInfo_dataInLastBeat),
    .io_ldu_s3_loadIn_0_bits_replayInfo_cause_0(loadQueue_io_ldu_s3_loadIn_0_bits_replayInfo_cause_0),
    .io_ldu_s3_loadIn_0_bits_replayInfo_cause_1(loadQueue_io_ldu_s3_loadIn_0_bits_replayInfo_cause_1),
    .io_ldu_s3_loadIn_0_bits_replayInfo_cause_2(loadQueue_io_ldu_s3_loadIn_0_bits_replayInfo_cause_2),
    .io_ldu_s3_loadIn_0_bits_replayInfo_cause_3(loadQueue_io_ldu_s3_loadIn_0_bits_replayInfo_cause_3),
    .io_ldu_s3_loadIn_0_bits_replayInfo_cause_4(loadQueue_io_ldu_s3_loadIn_0_bits_replayInfo_cause_4),
    .io_ldu_s3_loadIn_0_bits_replayInfo_cause_5(loadQueue_io_ldu_s3_loadIn_0_bits_replayInfo_cause_5),
    .io_ldu_s3_loadIn_0_bits_replayInfo_cause_6(loadQueue_io_ldu_s3_loadIn_0_bits_replayInfo_cause_6),
    .io_ldu_s3_loadIn_0_bits_replayInfo_cause_7(loadQueue_io_ldu_s3_loadIn_0_bits_replayInfo_cause_7),
    .io_ldu_s3_loadIn_0_bits_lqDataWenDup_1(loadQueue_io_ldu_s3_loadIn_0_bits_lqDataWenDup_1),
    .io_ldu_s3_loadIn_0_bits_lqDataWenDup_2(loadQueue_io_ldu_s3_loadIn_0_bits_lqDataWenDup_2),
    .io_ldu_s3_loadIn_0_bits_lqDataWenDup_3(loadQueue_io_ldu_s3_loadIn_0_bits_lqDataWenDup_3),
    .io_ldu_s3_loadIn_0_bits_lqDataWenDup_5(loadQueue_io_ldu_s3_loadIn_0_bits_lqDataWenDup_5),
    .io_ldu_s3_loadIn_1_valid(loadQueue_io_ldu_s3_loadIn_1_valid),
    .io_ldu_s3_loadIn_1_bits_uop_cf_foldpc(loadQueue_io_ldu_s3_loadIn_1_bits_uop_cf_foldpc),
    .io_ldu_s3_loadIn_1_bits_uop_cf_exceptionVec_4(loadQueue_io_ldu_s3_loadIn_1_bits_uop_cf_exceptionVec_4),
    .io_ldu_s3_loadIn_1_bits_uop_cf_exceptionVec_5(loadQueue_io_ldu_s3_loadIn_1_bits_uop_cf_exceptionVec_5),
    .io_ldu_s3_loadIn_1_bits_uop_cf_exceptionVec_13(loadQueue_io_ldu_s3_loadIn_1_bits_uop_cf_exceptionVec_13),
    .io_ldu_s3_loadIn_1_bits_uop_cf_trigger_backendEn_1(loadQueue_io_ldu_s3_loadIn_1_bits_uop_cf_trigger_backendEn_1),
    .io_ldu_s3_loadIn_1_bits_uop_cf_trigger_backendHit_0(loadQueue_io_ldu_s3_loadIn_1_bits_uop_cf_trigger_backendHit_0),
    .io_ldu_s3_loadIn_1_bits_uop_cf_trigger_backendHit_1(loadQueue_io_ldu_s3_loadIn_1_bits_uop_cf_trigger_backendHit_1),
    .io_ldu_s3_loadIn_1_bits_uop_cf_trigger_backendHit_4(loadQueue_io_ldu_s3_loadIn_1_bits_uop_cf_trigger_backendHit_4),
    .io_ldu_s3_loadIn_1_bits_uop_cf_waitForRobIdx_flag(loadQueue_io_ldu_s3_loadIn_1_bits_uop_cf_waitForRobIdx_flag),
    .io_ldu_s3_loadIn_1_bits_uop_cf_waitForRobIdx_value(loadQueue_io_ldu_s3_loadIn_1_bits_uop_cf_waitForRobIdx_value),
    .io_ldu_s3_loadIn_1_bits_uop_cf_loadWaitBit(loadQueue_io_ldu_s3_loadIn_1_bits_uop_cf_loadWaitBit),
    .io_ldu_s3_loadIn_1_bits_uop_cf_loadWaitStrict(loadQueue_io_ldu_s3_loadIn_1_bits_uop_cf_loadWaitStrict),
    .io_ldu_s3_loadIn_1_bits_uop_cf_ftqPtr_flag(loadQueue_io_ldu_s3_loadIn_1_bits_uop_cf_ftqPtr_flag),
    .io_ldu_s3_loadIn_1_bits_uop_cf_ftqPtr_value(loadQueue_io_ldu_s3_loadIn_1_bits_uop_cf_ftqPtr_value),
    .io_ldu_s3_loadIn_1_bits_uop_cf_ftqOffset(loadQueue_io_ldu_s3_loadIn_1_bits_uop_cf_ftqOffset),
    .io_ldu_s3_loadIn_1_bits_uop_ctrl_fuType(loadQueue_io_ldu_s3_loadIn_1_bits_uop_ctrl_fuType),
    .io_ldu_s3_loadIn_1_bits_uop_ctrl_fuOpType(loadQueue_io_ldu_s3_loadIn_1_bits_uop_ctrl_fuOpType),
    .io_ldu_s3_loadIn_1_bits_uop_ctrl_rfWen(loadQueue_io_ldu_s3_loadIn_1_bits_uop_ctrl_rfWen),
    .io_ldu_s3_loadIn_1_bits_uop_ctrl_fpWen(loadQueue_io_ldu_s3_loadIn_1_bits_uop_ctrl_fpWen),
    .io_ldu_s3_loadIn_1_bits_uop_ctrl_replayInst(loadQueue_io_ldu_s3_loadIn_1_bits_uop_ctrl_replayInst),
    .io_ldu_s3_loadIn_1_bits_uop_pdest(loadQueue_io_ldu_s3_loadIn_1_bits_uop_pdest),
    .io_ldu_s3_loadIn_1_bits_uop_robIdx_flag(loadQueue_io_ldu_s3_loadIn_1_bits_uop_robIdx_flag),
    .io_ldu_s3_loadIn_1_bits_uop_robIdx_value(loadQueue_io_ldu_s3_loadIn_1_bits_uop_robIdx_value),
    .io_ldu_s3_loadIn_1_bits_uop_lqIdx_flag(loadQueue_io_ldu_s3_loadIn_1_bits_uop_lqIdx_flag),
    .io_ldu_s3_loadIn_1_bits_uop_lqIdx_value(loadQueue_io_ldu_s3_loadIn_1_bits_uop_lqIdx_value),
    .io_ldu_s3_loadIn_1_bits_uop_sqIdx_flag(loadQueue_io_ldu_s3_loadIn_1_bits_uop_sqIdx_flag),
    .io_ldu_s3_loadIn_1_bits_uop_sqIdx_value(loadQueue_io_ldu_s3_loadIn_1_bits_uop_sqIdx_value),
    .io_ldu_s3_loadIn_1_bits_vaddr(loadQueue_io_ldu_s3_loadIn_1_bits_vaddr),
    .io_ldu_s3_loadIn_1_bits_paddr(loadQueue_io_ldu_s3_loadIn_1_bits_paddr),
    .io_ldu_s3_loadIn_1_bits_mask(loadQueue_io_ldu_s3_loadIn_1_bits_mask),
    .io_ldu_s3_loadIn_1_bits_miss(loadQueue_io_ldu_s3_loadIn_1_bits_miss),
    .io_ldu_s3_loadIn_1_bits_tlbMiss(loadQueue_io_ldu_s3_loadIn_1_bits_tlbMiss),
    .io_ldu_s3_loadIn_1_bits_mmio(loadQueue_io_ldu_s3_loadIn_1_bits_mmio),
    .io_ldu_s3_loadIn_1_bits_rarAllocated(loadQueue_io_ldu_s3_loadIn_1_bits_rarAllocated),
    .io_ldu_s3_loadIn_1_bits_rarIndex(loadQueue_io_ldu_s3_loadIn_1_bits_rarIndex),
    .io_ldu_s3_loadIn_1_bits_rawAllocated(loadQueue_io_ldu_s3_loadIn_1_bits_rawAllocated),
    .io_ldu_s3_loadIn_1_bits_rawIndex(loadQueue_io_ldu_s3_loadIn_1_bits_rawIndex),
    .io_ldu_s3_loadIn_1_bits_replayInfo_missMSHRId(loadQueue_io_ldu_s3_loadIn_1_bits_replayInfo_missMSHRId),
    .io_ldu_s3_loadIn_1_bits_replayInfo_canForwardFullData(
      loadQueue_io_ldu_s3_loadIn_1_bits_replayInfo_canForwardFullData),
    .io_ldu_s3_loadIn_1_bits_replayInfo_dataInvalidSqIdx_flag(
      loadQueue_io_ldu_s3_loadIn_1_bits_replayInfo_dataInvalidSqIdx_flag),
    .io_ldu_s3_loadIn_1_bits_replayInfo_dataInvalidSqIdx_value(
      loadQueue_io_ldu_s3_loadIn_1_bits_replayInfo_dataInvalidSqIdx_value),
    .io_ldu_s3_loadIn_1_bits_replayInfo_addrInvalidSqIdx_flag(
      loadQueue_io_ldu_s3_loadIn_1_bits_replayInfo_addrInvalidSqIdx_flag),
    .io_ldu_s3_loadIn_1_bits_replayInfo_addrInvalidSqIdx_value(
      loadQueue_io_ldu_s3_loadIn_1_bits_replayInfo_addrInvalidSqIdx_value),
    .io_ldu_s3_loadIn_1_bits_replayInfo_replayCarry_real_way_en(
      loadQueue_io_ldu_s3_loadIn_1_bits_replayInfo_replayCarry_real_way_en),
    .io_ldu_s3_loadIn_1_bits_replayInfo_replayCarry_valid(loadQueue_io_ldu_s3_loadIn_1_bits_replayInfo_replayCarry_valid
      ),
    .io_ldu_s3_loadIn_1_bits_replayInfo_dataInLastBeat(loadQueue_io_ldu_s3_loadIn_1_bits_replayInfo_dataInLastBeat),
    .io_ldu_s3_loadIn_1_bits_replayInfo_cause_0(loadQueue_io_ldu_s3_loadIn_1_bits_replayInfo_cause_0),
    .io_ldu_s3_loadIn_1_bits_replayInfo_cause_1(loadQueue_io_ldu_s3_loadIn_1_bits_replayInfo_cause_1),
    .io_ldu_s3_loadIn_1_bits_replayInfo_cause_2(loadQueue_io_ldu_s3_loadIn_1_bits_replayInfo_cause_2),
    .io_ldu_s3_loadIn_1_bits_replayInfo_cause_3(loadQueue_io_ldu_s3_loadIn_1_bits_replayInfo_cause_3),
    .io_ldu_s3_loadIn_1_bits_replayInfo_cause_4(loadQueue_io_ldu_s3_loadIn_1_bits_replayInfo_cause_4),
    .io_ldu_s3_loadIn_1_bits_replayInfo_cause_5(loadQueue_io_ldu_s3_loadIn_1_bits_replayInfo_cause_5),
    .io_ldu_s3_loadIn_1_bits_replayInfo_cause_6(loadQueue_io_ldu_s3_loadIn_1_bits_replayInfo_cause_6),
    .io_ldu_s3_loadIn_1_bits_replayInfo_cause_7(loadQueue_io_ldu_s3_loadIn_1_bits_replayInfo_cause_7),
    .io_ldu_s3_loadIn_1_bits_lqDataWenDup_1(loadQueue_io_ldu_s3_loadIn_1_bits_lqDataWenDup_1),
    .io_ldu_s3_loadIn_1_bits_lqDataWenDup_2(loadQueue_io_ldu_s3_loadIn_1_bits_lqDataWenDup_2),
    .io_ldu_s3_loadIn_1_bits_lqDataWenDup_3(loadQueue_io_ldu_s3_loadIn_1_bits_lqDataWenDup_3),
    .io_ldu_s3_loadIn_1_bits_lqDataWenDup_5(loadQueue_io_ldu_s3_loadIn_1_bits_lqDataWenDup_5),
    .io_sta_s1_storeAddrIn_0_valid(loadQueue_io_sta_s1_storeAddrIn_0_valid),
    .io_sta_s1_storeAddrIn_0_bits_uop_cf_ftqPtr_value(loadQueue_io_sta_s1_storeAddrIn_0_bits_uop_cf_ftqPtr_value),
    .io_sta_s1_storeAddrIn_0_bits_uop_cf_ftqOffset(loadQueue_io_sta_s1_storeAddrIn_0_bits_uop_cf_ftqOffset),
    .io_sta_s1_storeAddrIn_0_bits_uop_robIdx_flag(loadQueue_io_sta_s1_storeAddrIn_0_bits_uop_robIdx_flag),
    .io_sta_s1_storeAddrIn_0_bits_uop_robIdx_value(loadQueue_io_sta_s1_storeAddrIn_0_bits_uop_robIdx_value),
    .io_sta_s1_storeAddrIn_0_bits_uop_sqIdx_flag(loadQueue_io_sta_s1_storeAddrIn_0_bits_uop_sqIdx_flag),
    .io_sta_s1_storeAddrIn_0_bits_uop_sqIdx_value(loadQueue_io_sta_s1_storeAddrIn_0_bits_uop_sqIdx_value),
    .io_sta_s1_storeAddrIn_0_bits_paddr(loadQueue_io_sta_s1_storeAddrIn_0_bits_paddr),
    .io_sta_s1_storeAddrIn_0_bits_mask(loadQueue_io_sta_s1_storeAddrIn_0_bits_mask),
    .io_sta_s1_storeAddrIn_0_bits_miss(loadQueue_io_sta_s1_storeAddrIn_0_bits_miss),
    .io_sta_s1_storeAddrIn_1_valid(loadQueue_io_sta_s1_storeAddrIn_1_valid),
    .io_sta_s1_storeAddrIn_1_bits_uop_cf_ftqPtr_value(loadQueue_io_sta_s1_storeAddrIn_1_bits_uop_cf_ftqPtr_value),
    .io_sta_s1_storeAddrIn_1_bits_uop_cf_ftqOffset(loadQueue_io_sta_s1_storeAddrIn_1_bits_uop_cf_ftqOffset),
    .io_sta_s1_storeAddrIn_1_bits_uop_robIdx_flag(loadQueue_io_sta_s1_storeAddrIn_1_bits_uop_robIdx_flag),
    .io_sta_s1_storeAddrIn_1_bits_uop_robIdx_value(loadQueue_io_sta_s1_storeAddrIn_1_bits_uop_robIdx_value),
    .io_sta_s1_storeAddrIn_1_bits_uop_sqIdx_flag(loadQueue_io_sta_s1_storeAddrIn_1_bits_uop_sqIdx_flag),
    .io_sta_s1_storeAddrIn_1_bits_uop_sqIdx_value(loadQueue_io_sta_s1_storeAddrIn_1_bits_uop_sqIdx_value),
    .io_sta_s1_storeAddrIn_1_bits_paddr(loadQueue_io_sta_s1_storeAddrIn_1_bits_paddr),
    .io_sta_s1_storeAddrIn_1_bits_mask(loadQueue_io_sta_s1_storeAddrIn_1_bits_mask),
    .io_sta_s1_storeAddrIn_1_bits_miss(loadQueue_io_sta_s1_storeAddrIn_1_bits_miss),
    .io_std_s0_storeDataIn_0_valid(loadQueue_io_std_s0_storeDataIn_0_valid),
    .io_std_s0_storeDataIn_0_bits_uop_sqIdx_flag(loadQueue_io_std_s0_storeDataIn_0_bits_uop_sqIdx_flag),
    .io_std_s0_storeDataIn_0_bits_uop_sqIdx_value(loadQueue_io_std_s0_storeDataIn_0_bits_uop_sqIdx_value),
    .io_std_s0_storeDataIn_1_valid(loadQueue_io_std_s0_storeDataIn_1_valid),
    .io_std_s0_storeDataIn_1_bits_uop_sqIdx_flag(loadQueue_io_std_s0_storeDataIn_1_bits_uop_sqIdx_flag),
    .io_std_s0_storeDataIn_1_bits_uop_sqIdx_value(loadQueue_io_std_s0_storeDataIn_1_bits_uop_sqIdx_value),
    .io_sq_stAddrReadySqPtr_flag(loadQueue_io_sq_stAddrReadySqPtr_flag),
    .io_sq_stAddrReadySqPtr_value(loadQueue_io_sq_stAddrReadySqPtr_value),
    .io_sq_stDataReadySqPtr_flag(loadQueue_io_sq_stDataReadySqPtr_flag),
    .io_sq_stDataReadySqPtr_value(loadQueue_io_sq_stDataReadySqPtr_value),
    .io_sq_sqEmpty(loadQueue_io_sq_sqEmpty),
    .io_loadOut_0_ready(loadQueue_io_loadOut_0_ready),
    .io_loadOut_0_valid(loadQueue_io_loadOut_0_valid),
    .io_loadOut_0_bits_uop_cf_exceptionVec_4(loadQueue_io_loadOut_0_bits_uop_cf_exceptionVec_4),
    .io_loadOut_0_bits_uop_cf_exceptionVec_5(loadQueue_io_loadOut_0_bits_uop_cf_exceptionVec_5),
    .io_loadOut_0_bits_uop_cf_exceptionVec_13(loadQueue_io_loadOut_0_bits_uop_cf_exceptionVec_13),
    .io_loadOut_0_bits_uop_cf_trigger_backendEn_1(loadQueue_io_loadOut_0_bits_uop_cf_trigger_backendEn_1),
    .io_loadOut_0_bits_uop_cf_trigger_backendHit_0(loadQueue_io_loadOut_0_bits_uop_cf_trigger_backendHit_0),
    .io_loadOut_0_bits_uop_cf_trigger_backendHit_1(loadQueue_io_loadOut_0_bits_uop_cf_trigger_backendHit_1),
    .io_loadOut_0_bits_uop_cf_trigger_backendHit_4(loadQueue_io_loadOut_0_bits_uop_cf_trigger_backendHit_4),
    .io_loadOut_0_bits_uop_ctrl_rfWen(loadQueue_io_loadOut_0_bits_uop_ctrl_rfWen),
    .io_loadOut_0_bits_uop_ctrl_fpWen(loadQueue_io_loadOut_0_bits_uop_ctrl_fpWen),
    .io_loadOut_0_bits_uop_ctrl_flushPipe(loadQueue_io_loadOut_0_bits_uop_ctrl_flushPipe),
    .io_loadOut_0_bits_uop_ctrl_replayInst(loadQueue_io_loadOut_0_bits_uop_ctrl_replayInst),
    .io_loadOut_0_bits_uop_pdest(loadQueue_io_loadOut_0_bits_uop_pdest),
    .io_loadOut_0_bits_uop_robIdx_flag(loadQueue_io_loadOut_0_bits_uop_robIdx_flag),
    .io_loadOut_0_bits_uop_robIdx_value(loadQueue_io_loadOut_0_bits_uop_robIdx_value),
    .io_ldRawDataOut_0_lqData(loadQueue_io_ldRawDataOut_0_lqData),
    .io_ldRawDataOut_0_uop_ctrl_fuOpType(loadQueue_io_ldRawDataOut_0_uop_ctrl_fuOpType),
    .io_ldRawDataOut_0_uop_ctrl_fpWen(loadQueue_io_ldRawDataOut_0_uop_ctrl_fpWen),
    .io_ldRawDataOut_0_addrOffset(loadQueue_io_ldRawDataOut_0_addrOffset),
    .io_replay_0_ready(loadQueue_io_replay_0_ready),
    .io_replay_0_valid(loadQueue_io_replay_0_valid),
    .io_replay_0_bits_uop_cf_foldpc(loadQueue_io_replay_0_bits_uop_cf_foldpc),
    .io_replay_0_bits_uop_cf_trigger_backendEn_1(loadQueue_io_replay_0_bits_uop_cf_trigger_backendEn_1),
    .io_replay_0_bits_uop_cf_trigger_backendHit_0(loadQueue_io_replay_0_bits_uop_cf_trigger_backendHit_0),
    .io_replay_0_bits_uop_cf_trigger_backendHit_1(loadQueue_io_replay_0_bits_uop_cf_trigger_backendHit_1),
    .io_replay_0_bits_uop_cf_trigger_backendHit_4(loadQueue_io_replay_0_bits_uop_cf_trigger_backendHit_4),
    .io_replay_0_bits_uop_cf_waitForRobIdx_flag(loadQueue_io_replay_0_bits_uop_cf_waitForRobIdx_flag),
    .io_replay_0_bits_uop_cf_waitForRobIdx_value(loadQueue_io_replay_0_bits_uop_cf_waitForRobIdx_value),
    .io_replay_0_bits_uop_cf_loadWaitBit(loadQueue_io_replay_0_bits_uop_cf_loadWaitBit),
    .io_replay_0_bits_uop_cf_loadWaitStrict(loadQueue_io_replay_0_bits_uop_cf_loadWaitStrict),
    .io_replay_0_bits_uop_cf_ftqPtr_flag(loadQueue_io_replay_0_bits_uop_cf_ftqPtr_flag),
    .io_replay_0_bits_uop_cf_ftqPtr_value(loadQueue_io_replay_0_bits_uop_cf_ftqPtr_value),
    .io_replay_0_bits_uop_cf_ftqOffset(loadQueue_io_replay_0_bits_uop_cf_ftqOffset),
    .io_replay_0_bits_uop_ctrl_fuType(loadQueue_io_replay_0_bits_uop_ctrl_fuType),
    .io_replay_0_bits_uop_ctrl_fuOpType(loadQueue_io_replay_0_bits_uop_ctrl_fuOpType),
    .io_replay_0_bits_uop_ctrl_rfWen(loadQueue_io_replay_0_bits_uop_ctrl_rfWen),
    .io_replay_0_bits_uop_ctrl_fpWen(loadQueue_io_replay_0_bits_uop_ctrl_fpWen),
    .io_replay_0_bits_uop_pdest(loadQueue_io_replay_0_bits_uop_pdest),
    .io_replay_0_bits_uop_robIdx_flag(loadQueue_io_replay_0_bits_uop_robIdx_flag),
    .io_replay_0_bits_uop_robIdx_value(loadQueue_io_replay_0_bits_uop_robIdx_value),
    .io_replay_0_bits_uop_lqIdx_flag(loadQueue_io_replay_0_bits_uop_lqIdx_flag),
    .io_replay_0_bits_uop_lqIdx_value(loadQueue_io_replay_0_bits_uop_lqIdx_value),
    .io_replay_0_bits_uop_sqIdx_flag(loadQueue_io_replay_0_bits_uop_sqIdx_flag),
    .io_replay_0_bits_uop_sqIdx_value(loadQueue_io_replay_0_bits_uop_sqIdx_value),
    .io_replay_0_bits_vaddr(loadQueue_io_replay_0_bits_vaddr),
    .io_replay_0_bits_isFirstIssue(loadQueue_io_replay_0_bits_isFirstIssue),
    .io_replay_0_bits_replayCarry_real_way_en(loadQueue_io_replay_0_bits_replayCarry_real_way_en),
    .io_replay_0_bits_replayCarry_valid(loadQueue_io_replay_0_bits_replayCarry_valid),
    .io_replay_0_bits_mshrid(loadQueue_io_replay_0_bits_mshrid),
    .io_replay_0_bits_forward_tlDchannel(loadQueue_io_replay_0_bits_forward_tlDchannel),
    .io_replay_0_bits_rarAllocated(loadQueue_io_replay_0_bits_rarAllocated),
    .io_replay_0_bits_rarIndex(loadQueue_io_replay_0_bits_rarIndex),
    .io_replay_0_bits_rawAllocated(loadQueue_io_replay_0_bits_rawAllocated),
    .io_replay_0_bits_rawIndex(loadQueue_io_replay_0_bits_rawIndex),
    .io_replay_1_ready(loadQueue_io_replay_1_ready),
    .io_replay_1_valid(loadQueue_io_replay_1_valid),
    .io_replay_1_bits_uop_cf_foldpc(loadQueue_io_replay_1_bits_uop_cf_foldpc),
    .io_replay_1_bits_uop_cf_trigger_backendEn_1(loadQueue_io_replay_1_bits_uop_cf_trigger_backendEn_1),
    .io_replay_1_bits_uop_cf_trigger_backendHit_0(loadQueue_io_replay_1_bits_uop_cf_trigger_backendHit_0),
    .io_replay_1_bits_uop_cf_trigger_backendHit_1(loadQueue_io_replay_1_bits_uop_cf_trigger_backendHit_1),
    .io_replay_1_bits_uop_cf_trigger_backendHit_4(loadQueue_io_replay_1_bits_uop_cf_trigger_backendHit_4),
    .io_replay_1_bits_uop_cf_waitForRobIdx_flag(loadQueue_io_replay_1_bits_uop_cf_waitForRobIdx_flag),
    .io_replay_1_bits_uop_cf_waitForRobIdx_value(loadQueue_io_replay_1_bits_uop_cf_waitForRobIdx_value),
    .io_replay_1_bits_uop_cf_loadWaitBit(loadQueue_io_replay_1_bits_uop_cf_loadWaitBit),
    .io_replay_1_bits_uop_cf_loadWaitStrict(loadQueue_io_replay_1_bits_uop_cf_loadWaitStrict),
    .io_replay_1_bits_uop_cf_ftqPtr_flag(loadQueue_io_replay_1_bits_uop_cf_ftqPtr_flag),
    .io_replay_1_bits_uop_cf_ftqPtr_value(loadQueue_io_replay_1_bits_uop_cf_ftqPtr_value),
    .io_replay_1_bits_uop_cf_ftqOffset(loadQueue_io_replay_1_bits_uop_cf_ftqOffset),
    .io_replay_1_bits_uop_ctrl_fuType(loadQueue_io_replay_1_bits_uop_ctrl_fuType),
    .io_replay_1_bits_uop_ctrl_fuOpType(loadQueue_io_replay_1_bits_uop_ctrl_fuOpType),
    .io_replay_1_bits_uop_ctrl_rfWen(loadQueue_io_replay_1_bits_uop_ctrl_rfWen),
    .io_replay_1_bits_uop_ctrl_fpWen(loadQueue_io_replay_1_bits_uop_ctrl_fpWen),
    .io_replay_1_bits_uop_pdest(loadQueue_io_replay_1_bits_uop_pdest),
    .io_replay_1_bits_uop_robIdx_flag(loadQueue_io_replay_1_bits_uop_robIdx_flag),
    .io_replay_1_bits_uop_robIdx_value(loadQueue_io_replay_1_bits_uop_robIdx_value),
    .io_replay_1_bits_uop_lqIdx_flag(loadQueue_io_replay_1_bits_uop_lqIdx_flag),
    .io_replay_1_bits_uop_lqIdx_value(loadQueue_io_replay_1_bits_uop_lqIdx_value),
    .io_replay_1_bits_uop_sqIdx_flag(loadQueue_io_replay_1_bits_uop_sqIdx_flag),
    .io_replay_1_bits_uop_sqIdx_value(loadQueue_io_replay_1_bits_uop_sqIdx_value),
    .io_replay_1_bits_vaddr(loadQueue_io_replay_1_bits_vaddr),
    .io_replay_1_bits_isFirstIssue(loadQueue_io_replay_1_bits_isFirstIssue),
    .io_replay_1_bits_replayCarry_real_way_en(loadQueue_io_replay_1_bits_replayCarry_real_way_en),
    .io_replay_1_bits_replayCarry_valid(loadQueue_io_replay_1_bits_replayCarry_valid),
    .io_replay_1_bits_mshrid(loadQueue_io_replay_1_bits_mshrid),
    .io_replay_1_bits_forward_tlDchannel(loadQueue_io_replay_1_bits_forward_tlDchannel),
    .io_replay_1_bits_rarAllocated(loadQueue_io_replay_1_bits_rarAllocated),
    .io_replay_1_bits_rarIndex(loadQueue_io_replay_1_bits_rarIndex),
    .io_replay_1_bits_rawAllocated(loadQueue_io_replay_1_bits_rawAllocated),
    .io_replay_1_bits_rawIndex(loadQueue_io_replay_1_bits_rawIndex),
    .io_refill_valid(loadQueue_io_refill_valid),
    .io_refill_bits_id(loadQueue_io_refill_bits_id),
    .io_release_valid(loadQueue_io_release_valid),
    .io_release_bits_paddr(loadQueue_io_release_bits_paddr),
    .io_rollback_valid(loadQueue_io_rollback_valid),
    .io_rollback_bits_robIdx_flag(loadQueue_io_rollback_bits_robIdx_flag),
    .io_rollback_bits_robIdx_value(loadQueue_io_rollback_bits_robIdx_value),
    .io_rollback_bits_ftqIdx_flag(loadQueue_io_rollback_bits_ftqIdx_flag),
    .io_rollback_bits_ftqIdx_value(loadQueue_io_rollback_bits_ftqIdx_value),
    .io_rollback_bits_ftqOffset(loadQueue_io_rollback_bits_ftqOffset),
    .io_rollback_bits_stFtqIdx_value(loadQueue_io_rollback_bits_stFtqIdx_value),
    .io_rollback_bits_stFtqOffset(loadQueue_io_rollback_bits_stFtqOffset),
    .io_correctTableUpdate_valid(loadQueue_io_correctTableUpdate_valid),
    .io_correctTableUpdate_bits_addr(loadQueue_io_correctTableUpdate_bits_addr),
    .io_rob_pendingld(loadQueue_io_rob_pendingld),
    .io_rob_commit(loadQueue_io_rob_commit),
    .io_rob_isMMIO_0(loadQueue_io_rob_isMMIO_0),
    .io_rob_isMMIO_1(loadQueue_io_rob_isMMIO_1),
    .io_rob_uop_0_robIdx_value(loadQueue_io_rob_uop_0_robIdx_value),
    .io_rob_uop_1_robIdx_value(loadQueue_io_rob_uop_1_robIdx_value),
    .io_uncache_req_ready(loadQueue_io_uncache_req_ready),
    .io_uncache_req_valid(loadQueue_io_uncache_req_valid),
    .io_uncache_req_bits_addr(loadQueue_io_uncache_req_bits_addr),
    .io_uncache_req_bits_mask(loadQueue_io_uncache_req_bits_mask),
    .io_uncache_resp_valid(loadQueue_io_uncache_resp_valid),
    .io_uncache_resp_bits_data(loadQueue_io_uncache_resp_bits_data),
    .io_trigger_0_hitLoadAddrTriggerHitVec_0(loadQueue_io_trigger_0_hitLoadAddrTriggerHitVec_0),
    .io_trigger_0_hitLoadAddrTriggerHitVec_1(loadQueue_io_trigger_0_hitLoadAddrTriggerHitVec_1),
    .io_trigger_0_hitLoadAddrTriggerHitVec_2(loadQueue_io_trigger_0_hitLoadAddrTriggerHitVec_2),
    .io_trigger_0_lqLoadAddrTriggerHitVec_0(loadQueue_io_trigger_0_lqLoadAddrTriggerHitVec_0),
    .io_trigger_0_lqLoadAddrTriggerHitVec_1(loadQueue_io_trigger_0_lqLoadAddrTriggerHitVec_1),
    .io_trigger_0_lqLoadAddrTriggerHitVec_2(loadQueue_io_trigger_0_lqLoadAddrTriggerHitVec_2),
    .io_trigger_1_hitLoadAddrTriggerHitVec_0(loadQueue_io_trigger_1_hitLoadAddrTriggerHitVec_0),
    .io_trigger_1_hitLoadAddrTriggerHitVec_1(loadQueue_io_trigger_1_hitLoadAddrTriggerHitVec_1),
    .io_trigger_1_hitLoadAddrTriggerHitVec_2(loadQueue_io_trigger_1_hitLoadAddrTriggerHitVec_2),
    .io_exceptionAddr_vaddr(loadQueue_io_exceptionAddr_vaddr),
    .io_lqDeq(loadQueue_io_lqDeq),
    .io_lqCancelCnt(loadQueue_io_lqCancelCnt),
    .io_lqReplayFull(loadQueue_io_lqReplayFull),
    .io_tlbReplayDelayCycleCtrl_0(loadQueue_io_tlbReplayDelayCycleCtrl_0),
    .io_tlbReplayDelayCycleCtrl_1(loadQueue_io_tlbReplayDelayCycleCtrl_1),
    .io_tlbReplayDelayCycleCtrl_2(loadQueue_io_tlbReplayDelayCycleCtrl_2),
    .io_tlbReplayDelayCycleCtrl_3(loadQueue_io_tlbReplayDelayCycleCtrl_3),
    .io_perf_0_value(loadQueue_io_perf_0_value),
    .io_perf_1_value(loadQueue_io_perf_1_value),
    .io_perf_2_value(loadQueue_io_perf_2_value),
    .io_perf_3_value(loadQueue_io_perf_3_value),
    .io_perf_4_value(loadQueue_io_perf_4_value),
    .io_perf_5_value(loadQueue_io_perf_5_value),
    .io_perf_6_value(loadQueue_io_perf_6_value),
    .io_perf_7_value(loadQueue_io_perf_7_value),
    .io_perf_8_value(loadQueue_io_perf_8_value),
    .io_perf_9_value(loadQueue_io_perf_9_value),
    .io_perf_10_value(loadQueue_io_perf_10_value),
    .io_perf_11_value(loadQueue_io_perf_11_value),
    .io_perf_12_value(loadQueue_io_perf_12_value),
    .io_perf_13_value(loadQueue_io_perf_13_value),
    .io_perf_14_value(loadQueue_io_perf_14_value),
    .io_perf_15_value(loadQueue_io_perf_15_value),
    .io_perf_16_value(loadQueue_io_perf_16_value),
    .io_perf_17_value(loadQueue_io_perf_17_value),
    .io_perf_18_value(loadQueue_io_perf_18_value),
    .io_perf_19_value(loadQueue_io_perf_19_value),
    .io_perf_20_value(loadQueue_io_perf_20_value),
    .io_perf_21_value(loadQueue_io_perf_21_value)
  );
  StoreQueue storeQueue ( // @[LSQWrapper.scala 114:26]
    .clock(storeQueue_clock),
    .reset(storeQueue_reset),
    .io_enq_canAccept(storeQueue_io_enq_canAccept),
    .io_enq_lqCanAccept(storeQueue_io_enq_lqCanAccept),
    .io_enq_req_0_valid(storeQueue_io_enq_req_0_valid),
    .io_enq_req_0_bits_cf_trigger_backendEn_0(storeQueue_io_enq_req_0_bits_cf_trigger_backendEn_0),
    .io_enq_req_0_bits_ctrl_fuOpType(storeQueue_io_enq_req_0_bits_ctrl_fuOpType),
    .io_enq_req_0_bits_robIdx_flag(storeQueue_io_enq_req_0_bits_robIdx_flag),
    .io_enq_req_0_bits_robIdx_value(storeQueue_io_enq_req_0_bits_robIdx_value),
    .io_enq_req_0_bits_sqIdx_value(storeQueue_io_enq_req_0_bits_sqIdx_value),
    .io_enq_req_1_valid(storeQueue_io_enq_req_1_valid),
    .io_enq_req_1_bits_cf_trigger_backendEn_0(storeQueue_io_enq_req_1_bits_cf_trigger_backendEn_0),
    .io_enq_req_1_bits_ctrl_fuOpType(storeQueue_io_enq_req_1_bits_ctrl_fuOpType),
    .io_enq_req_1_bits_robIdx_flag(storeQueue_io_enq_req_1_bits_robIdx_flag),
    .io_enq_req_1_bits_robIdx_value(storeQueue_io_enq_req_1_bits_robIdx_value),
    .io_enq_req_1_bits_sqIdx_value(storeQueue_io_enq_req_1_bits_sqIdx_value),
    .io_enq_req_2_valid(storeQueue_io_enq_req_2_valid),
    .io_enq_req_2_bits_cf_trigger_backendEn_0(storeQueue_io_enq_req_2_bits_cf_trigger_backendEn_0),
    .io_enq_req_2_bits_ctrl_fuOpType(storeQueue_io_enq_req_2_bits_ctrl_fuOpType),
    .io_enq_req_2_bits_robIdx_flag(storeQueue_io_enq_req_2_bits_robIdx_flag),
    .io_enq_req_2_bits_robIdx_value(storeQueue_io_enq_req_2_bits_robIdx_value),
    .io_enq_req_2_bits_sqIdx_value(storeQueue_io_enq_req_2_bits_sqIdx_value),
    .io_enq_req_3_valid(storeQueue_io_enq_req_3_valid),
    .io_enq_req_3_bits_cf_trigger_backendEn_0(storeQueue_io_enq_req_3_bits_cf_trigger_backendEn_0),
    .io_enq_req_3_bits_ctrl_fuOpType(storeQueue_io_enq_req_3_bits_ctrl_fuOpType),
    .io_enq_req_3_bits_robIdx_flag(storeQueue_io_enq_req_3_bits_robIdx_flag),
    .io_enq_req_3_bits_robIdx_value(storeQueue_io_enq_req_3_bits_robIdx_value),
    .io_enq_req_3_bits_sqIdx_value(storeQueue_io_enq_req_3_bits_sqIdx_value),
    .io_brqRedirect_valid(storeQueue_io_brqRedirect_valid),
    .io_brqRedirect_bits_robIdx_flag(storeQueue_io_brqRedirect_bits_robIdx_flag),
    .io_brqRedirect_bits_robIdx_value(storeQueue_io_brqRedirect_bits_robIdx_value),
    .io_brqRedirect_bits_level(storeQueue_io_brqRedirect_bits_level),
    .io_storeAddrIn_0_valid(storeQueue_io_storeAddrIn_0_valid),
    .io_storeAddrIn_0_bits_uop_ctrl_fuOpType(storeQueue_io_storeAddrIn_0_bits_uop_ctrl_fuOpType),
    .io_storeAddrIn_0_bits_uop_sqIdx_value(storeQueue_io_storeAddrIn_0_bits_uop_sqIdx_value),
    .io_storeAddrIn_0_bits_vaddr(storeQueue_io_storeAddrIn_0_bits_vaddr),
    .io_storeAddrIn_0_bits_paddr(storeQueue_io_storeAddrIn_0_bits_paddr),
    .io_storeAddrIn_0_bits_wlineflag(storeQueue_io_storeAddrIn_0_bits_wlineflag),
    .io_storeAddrIn_0_bits_miss(storeQueue_io_storeAddrIn_0_bits_miss),
    .io_storeAddrIn_1_valid(storeQueue_io_storeAddrIn_1_valid),
    .io_storeAddrIn_1_bits_uop_ctrl_fuOpType(storeQueue_io_storeAddrIn_1_bits_uop_ctrl_fuOpType),
    .io_storeAddrIn_1_bits_uop_sqIdx_value(storeQueue_io_storeAddrIn_1_bits_uop_sqIdx_value),
    .io_storeAddrIn_1_bits_vaddr(storeQueue_io_storeAddrIn_1_bits_vaddr),
    .io_storeAddrIn_1_bits_paddr(storeQueue_io_storeAddrIn_1_bits_paddr),
    .io_storeAddrIn_1_bits_wlineflag(storeQueue_io_storeAddrIn_1_bits_wlineflag),
    .io_storeAddrIn_1_bits_miss(storeQueue_io_storeAddrIn_1_bits_miss),
    .io_storeAddrInRe_0_mmio(storeQueue_io_storeAddrInRe_0_mmio),
    .io_storeAddrInRe_0_atomic(storeQueue_io_storeAddrInRe_0_atomic),
    .io_storeAddrInRe_1_mmio(storeQueue_io_storeAddrInRe_1_mmio),
    .io_storeAddrInRe_1_atomic(storeQueue_io_storeAddrInRe_1_atomic),
    .io_storeDataIn_0_valid(storeQueue_io_storeDataIn_0_valid),
    .io_storeDataIn_0_bits_uop_ctrl_fuOpType(storeQueue_io_storeDataIn_0_bits_uop_ctrl_fuOpType),
    .io_storeDataIn_0_bits_uop_sqIdx_value(storeQueue_io_storeDataIn_0_bits_uop_sqIdx_value),
    .io_storeDataIn_0_bits_data(storeQueue_io_storeDataIn_0_bits_data),
    .io_storeDataIn_1_valid(storeQueue_io_storeDataIn_1_valid),
    .io_storeDataIn_1_bits_uop_ctrl_fuOpType(storeQueue_io_storeDataIn_1_bits_uop_ctrl_fuOpType),
    .io_storeDataIn_1_bits_uop_sqIdx_value(storeQueue_io_storeDataIn_1_bits_uop_sqIdx_value),
    .io_storeDataIn_1_bits_data(storeQueue_io_storeDataIn_1_bits_data),
    .io_storeMaskIn_0_valid(storeQueue_io_storeMaskIn_0_valid),
    .io_storeMaskIn_0_bits_sqIdx_value(storeQueue_io_storeMaskIn_0_bits_sqIdx_value),
    .io_storeMaskIn_0_bits_mask(storeQueue_io_storeMaskIn_0_bits_mask),
    .io_storeMaskIn_1_valid(storeQueue_io_storeMaskIn_1_valid),
    .io_storeMaskIn_1_bits_sqIdx_value(storeQueue_io_storeMaskIn_1_bits_sqIdx_value),
    .io_storeMaskIn_1_bits_mask(storeQueue_io_storeMaskIn_1_bits_mask),
    .io_sbuffer_0_ready(storeQueue_io_sbuffer_0_ready),
    .io_sbuffer_0_valid(storeQueue_io_sbuffer_0_valid),
    .io_sbuffer_0_bits_addr(storeQueue_io_sbuffer_0_bits_addr),
    .io_sbuffer_0_bits_data(storeQueue_io_sbuffer_0_bits_data),
    .io_sbuffer_0_bits_mask(storeQueue_io_sbuffer_0_bits_mask),
    .io_sbuffer_0_bits_vaddr(storeQueue_io_sbuffer_0_bits_vaddr),
    .io_sbuffer_0_bits_wline(storeQueue_io_sbuffer_0_bits_wline),
    .io_sbuffer_1_ready(storeQueue_io_sbuffer_1_ready),
    .io_sbuffer_1_valid(storeQueue_io_sbuffer_1_valid),
    .io_sbuffer_1_bits_addr(storeQueue_io_sbuffer_1_bits_addr),
    .io_sbuffer_1_bits_data(storeQueue_io_sbuffer_1_bits_data),
    .io_sbuffer_1_bits_mask(storeQueue_io_sbuffer_1_bits_mask),
    .io_sbuffer_1_bits_vaddr(storeQueue_io_sbuffer_1_bits_vaddr),
    .io_sbuffer_1_bits_wline(storeQueue_io_sbuffer_1_bits_wline),
    .io_uncacheOutstanding(storeQueue_io_uncacheOutstanding),
    .io_mmioStout_ready(storeQueue_io_mmioStout_ready),
    .io_mmioStout_valid(storeQueue_io_mmioStout_valid),
    .io_mmioStout_bits_uop_cf_trigger_backendEn_0(storeQueue_io_mmioStout_bits_uop_cf_trigger_backendEn_0),
    .io_mmioStout_bits_uop_robIdx_flag(storeQueue_io_mmioStout_bits_uop_robIdx_flag),
    .io_mmioStout_bits_uop_robIdx_value(storeQueue_io_mmioStout_bits_uop_robIdx_value),
    .io_forward_0_vaddr(storeQueue_io_forward_0_vaddr),
    .io_forward_0_paddr(storeQueue_io_forward_0_paddr),
    .io_forward_0_uop_cf_waitForRobIdx_flag(storeQueue_io_forward_0_uop_cf_waitForRobIdx_flag),
    .io_forward_0_uop_cf_waitForRobIdx_value(storeQueue_io_forward_0_uop_cf_waitForRobIdx_value),
    .io_forward_0_uop_sqIdx_flag(storeQueue_io_forward_0_uop_sqIdx_flag),
    .io_forward_0_uop_sqIdx_value(storeQueue_io_forward_0_uop_sqIdx_value),
    .io_forward_0_valid(storeQueue_io_forward_0_valid),
    .io_forward_0_forwardMask_0(storeQueue_io_forward_0_forwardMask_0),
    .io_forward_0_forwardMask_1(storeQueue_io_forward_0_forwardMask_1),
    .io_forward_0_forwardMask_2(storeQueue_io_forward_0_forwardMask_2),
    .io_forward_0_forwardMask_3(storeQueue_io_forward_0_forwardMask_3),
    .io_forward_0_forwardMask_4(storeQueue_io_forward_0_forwardMask_4),
    .io_forward_0_forwardMask_5(storeQueue_io_forward_0_forwardMask_5),
    .io_forward_0_forwardMask_6(storeQueue_io_forward_0_forwardMask_6),
    .io_forward_0_forwardMask_7(storeQueue_io_forward_0_forwardMask_7),
    .io_forward_0_forwardMask_8(storeQueue_io_forward_0_forwardMask_8),
    .io_forward_0_forwardMask_9(storeQueue_io_forward_0_forwardMask_9),
    .io_forward_0_forwardMask_10(storeQueue_io_forward_0_forwardMask_10),
    .io_forward_0_forwardMask_11(storeQueue_io_forward_0_forwardMask_11),
    .io_forward_0_forwardMask_12(storeQueue_io_forward_0_forwardMask_12),
    .io_forward_0_forwardMask_13(storeQueue_io_forward_0_forwardMask_13),
    .io_forward_0_forwardMask_14(storeQueue_io_forward_0_forwardMask_14),
    .io_forward_0_forwardMask_15(storeQueue_io_forward_0_forwardMask_15),
    .io_forward_0_forwardData_0(storeQueue_io_forward_0_forwardData_0),
    .io_forward_0_forwardData_1(storeQueue_io_forward_0_forwardData_1),
    .io_forward_0_forwardData_2(storeQueue_io_forward_0_forwardData_2),
    .io_forward_0_forwardData_3(storeQueue_io_forward_0_forwardData_3),
    .io_forward_0_forwardData_4(storeQueue_io_forward_0_forwardData_4),
    .io_forward_0_forwardData_5(storeQueue_io_forward_0_forwardData_5),
    .io_forward_0_forwardData_6(storeQueue_io_forward_0_forwardData_6),
    .io_forward_0_forwardData_7(storeQueue_io_forward_0_forwardData_7),
    .io_forward_0_forwardData_8(storeQueue_io_forward_0_forwardData_8),
    .io_forward_0_forwardData_9(storeQueue_io_forward_0_forwardData_9),
    .io_forward_0_forwardData_10(storeQueue_io_forward_0_forwardData_10),
    .io_forward_0_forwardData_11(storeQueue_io_forward_0_forwardData_11),
    .io_forward_0_forwardData_12(storeQueue_io_forward_0_forwardData_12),
    .io_forward_0_forwardData_13(storeQueue_io_forward_0_forwardData_13),
    .io_forward_0_forwardData_14(storeQueue_io_forward_0_forwardData_14),
    .io_forward_0_forwardData_15(storeQueue_io_forward_0_forwardData_15),
    .io_forward_0_sqIdx_flag(storeQueue_io_forward_0_sqIdx_flag),
    .io_forward_0_dataInvalid(storeQueue_io_forward_0_dataInvalid),
    .io_forward_0_matchInvalid(storeQueue_io_forward_0_matchInvalid),
    .io_forward_0_schedWait(storeQueue_io_forward_0_schedWait),
    .io_forward_0_sqIdxMask(storeQueue_io_forward_0_sqIdxMask),
    .io_forward_0_dataInvalidFast(storeQueue_io_forward_0_dataInvalidFast),
    .io_forward_0_dataInvalidSqIdx_flag(storeQueue_io_forward_0_dataInvalidSqIdx_flag),
    .io_forward_0_dataInvalidSqIdx_value(storeQueue_io_forward_0_dataInvalidSqIdx_value),
    .io_forward_0_addrInvalidSqIdx_flag(storeQueue_io_forward_0_addrInvalidSqIdx_flag),
    .io_forward_0_addrInvalidSqIdx_value(storeQueue_io_forward_0_addrInvalidSqIdx_value),
    .io_forward_1_vaddr(storeQueue_io_forward_1_vaddr),
    .io_forward_1_paddr(storeQueue_io_forward_1_paddr),
    .io_forward_1_uop_cf_waitForRobIdx_flag(storeQueue_io_forward_1_uop_cf_waitForRobIdx_flag),
    .io_forward_1_uop_cf_waitForRobIdx_value(storeQueue_io_forward_1_uop_cf_waitForRobIdx_value),
    .io_forward_1_uop_sqIdx_flag(storeQueue_io_forward_1_uop_sqIdx_flag),
    .io_forward_1_uop_sqIdx_value(storeQueue_io_forward_1_uop_sqIdx_value),
    .io_forward_1_valid(storeQueue_io_forward_1_valid),
    .io_forward_1_forwardMask_0(storeQueue_io_forward_1_forwardMask_0),
    .io_forward_1_forwardMask_1(storeQueue_io_forward_1_forwardMask_1),
    .io_forward_1_forwardMask_2(storeQueue_io_forward_1_forwardMask_2),
    .io_forward_1_forwardMask_3(storeQueue_io_forward_1_forwardMask_3),
    .io_forward_1_forwardMask_4(storeQueue_io_forward_1_forwardMask_4),
    .io_forward_1_forwardMask_5(storeQueue_io_forward_1_forwardMask_5),
    .io_forward_1_forwardMask_6(storeQueue_io_forward_1_forwardMask_6),
    .io_forward_1_forwardMask_7(storeQueue_io_forward_1_forwardMask_7),
    .io_forward_1_forwardMask_8(storeQueue_io_forward_1_forwardMask_8),
    .io_forward_1_forwardMask_9(storeQueue_io_forward_1_forwardMask_9),
    .io_forward_1_forwardMask_10(storeQueue_io_forward_1_forwardMask_10),
    .io_forward_1_forwardMask_11(storeQueue_io_forward_1_forwardMask_11),
    .io_forward_1_forwardMask_12(storeQueue_io_forward_1_forwardMask_12),
    .io_forward_1_forwardMask_13(storeQueue_io_forward_1_forwardMask_13),
    .io_forward_1_forwardMask_14(storeQueue_io_forward_1_forwardMask_14),
    .io_forward_1_forwardMask_15(storeQueue_io_forward_1_forwardMask_15),
    .io_forward_1_forwardData_0(storeQueue_io_forward_1_forwardData_0),
    .io_forward_1_forwardData_1(storeQueue_io_forward_1_forwardData_1),
    .io_forward_1_forwardData_2(storeQueue_io_forward_1_forwardData_2),
    .io_forward_1_forwardData_3(storeQueue_io_forward_1_forwardData_3),
    .io_forward_1_forwardData_4(storeQueue_io_forward_1_forwardData_4),
    .io_forward_1_forwardData_5(storeQueue_io_forward_1_forwardData_5),
    .io_forward_1_forwardData_6(storeQueue_io_forward_1_forwardData_6),
    .io_forward_1_forwardData_7(storeQueue_io_forward_1_forwardData_7),
    .io_forward_1_forwardData_8(storeQueue_io_forward_1_forwardData_8),
    .io_forward_1_forwardData_9(storeQueue_io_forward_1_forwardData_9),
    .io_forward_1_forwardData_10(storeQueue_io_forward_1_forwardData_10),
    .io_forward_1_forwardData_11(storeQueue_io_forward_1_forwardData_11),
    .io_forward_1_forwardData_12(storeQueue_io_forward_1_forwardData_12),
    .io_forward_1_forwardData_13(storeQueue_io_forward_1_forwardData_13),
    .io_forward_1_forwardData_14(storeQueue_io_forward_1_forwardData_14),
    .io_forward_1_forwardData_15(storeQueue_io_forward_1_forwardData_15),
    .io_forward_1_sqIdx_flag(storeQueue_io_forward_1_sqIdx_flag),
    .io_forward_1_dataInvalid(storeQueue_io_forward_1_dataInvalid),
    .io_forward_1_matchInvalid(storeQueue_io_forward_1_matchInvalid),
    .io_forward_1_schedWait(storeQueue_io_forward_1_schedWait),
    .io_forward_1_sqIdxMask(storeQueue_io_forward_1_sqIdxMask),
    .io_forward_1_dataInvalidFast(storeQueue_io_forward_1_dataInvalidFast),
    .io_forward_1_dataInvalidSqIdx_flag(storeQueue_io_forward_1_dataInvalidSqIdx_flag),
    .io_forward_1_dataInvalidSqIdx_value(storeQueue_io_forward_1_dataInvalidSqIdx_value),
    .io_forward_1_addrInvalidSqIdx_flag(storeQueue_io_forward_1_addrInvalidSqIdx_flag),
    .io_forward_1_addrInvalidSqIdx_value(storeQueue_io_forward_1_addrInvalidSqIdx_value),
    .io_rob_scommit(storeQueue_io_rob_scommit),
    .io_rob_pendingst(storeQueue_io_rob_pendingst),
    .io_uncache_req_ready(storeQueue_io_uncache_req_ready),
    .io_uncache_req_valid(storeQueue_io_uncache_req_valid),
    .io_uncache_req_bits_addr(storeQueue_io_uncache_req_bits_addr),
    .io_uncache_req_bits_data(storeQueue_io_uncache_req_bits_data),
    .io_uncache_req_bits_mask(storeQueue_io_uncache_req_bits_mask),
    .io_uncache_req_bits_atomic(storeQueue_io_uncache_req_bits_atomic),
    .io_uncache_resp_ready(storeQueue_io_uncache_resp_ready),
    .io_uncache_resp_valid(storeQueue_io_uncache_resp_valid),
    .io_exceptionAddr_vaddr(storeQueue_io_exceptionAddr_vaddr),
    .io_sqEmpty(storeQueue_io_sqEmpty),
    .io_stAddrReadySqPtr_flag(storeQueue_io_stAddrReadySqPtr_flag),
    .io_stAddrReadySqPtr_value(storeQueue_io_stAddrReadySqPtr_value),
    .io_stDataReadySqPtr_flag(storeQueue_io_stDataReadySqPtr_flag),
    .io_stDataReadySqPtr_value(storeQueue_io_stDataReadySqPtr_value),
    .io_sqCancelCnt(storeQueue_io_sqCancelCnt),
    .io_sqDeq(storeQueue_io_sqDeq),
    .io_perf_0_value(storeQueue_io_perf_0_value),
    .io_perf_1_value(storeQueue_io_perf_1_value),
    .io_perf_2_value(storeQueue_io_perf_2_value),
    .io_perf_3_value(storeQueue_io_perf_3_value),
    .io_perf_4_value(storeQueue_io_perf_4_value),
    .io_perf_5_value(storeQueue_io_perf_5_value),
    .io_perf_6_value(storeQueue_io_perf_6_value),
    .io_perf_7_value(storeQueue_io_perf_7_value)
  );
  assign io_ldu_s2_storeLoadViolationQuery_0_resp_bits_index =
    loadQueue_io_ldu_s2_storeLoadViolationQuery_0_resp_bits_index; // @[LSQWrapper.scala 167:20]
  assign io_ldu_s2_storeLoadViolationQuery_0_resp_bits_canAccept =
    loadQueue_io_ldu_s2_storeLoadViolationQuery_0_resp_bits_canAccept; // @[LSQWrapper.scala 167:20]
  assign io_ldu_s2_storeLoadViolationQuery_0_resp_bits_allocated =
    loadQueue_io_ldu_s2_storeLoadViolationQuery_0_resp_bits_allocated; // @[LSQWrapper.scala 167:20]
  assign io_ldu_s2_storeLoadViolationQuery_1_resp_bits_index =
    loadQueue_io_ldu_s2_storeLoadViolationQuery_1_resp_bits_index; // @[LSQWrapper.scala 167:20]
  assign io_ldu_s2_storeLoadViolationQuery_1_resp_bits_canAccept =
    loadQueue_io_ldu_s2_storeLoadViolationQuery_1_resp_bits_canAccept; // @[LSQWrapper.scala 167:20]
  assign io_ldu_s2_storeLoadViolationQuery_1_resp_bits_allocated =
    loadQueue_io_ldu_s2_storeLoadViolationQuery_1_resp_bits_allocated; // @[LSQWrapper.scala 167:20]
  assign io_ldu_s2_loadLoadViolationQuery_0_resp_valid = loadQueue_io_ldu_s2_loadLoadViolationQuery_0_resp_valid; // @[LSQWrapper.scala 167:20]
  assign io_ldu_s2_loadLoadViolationQuery_0_resp_bits_index =
    loadQueue_io_ldu_s2_loadLoadViolationQuery_0_resp_bits_index; // @[LSQWrapper.scala 167:20]
  assign io_ldu_s2_loadLoadViolationQuery_0_resp_bits_canAccept =
    loadQueue_io_ldu_s2_loadLoadViolationQuery_0_resp_bits_canAccept; // @[LSQWrapper.scala 167:20]
  assign io_ldu_s2_loadLoadViolationQuery_0_resp_bits_allocated =
    loadQueue_io_ldu_s2_loadLoadViolationQuery_0_resp_bits_allocated; // @[LSQWrapper.scala 167:20]
  assign io_ldu_s2_loadLoadViolationQuery_0_resp_bits_replayFromFetch =
    loadQueue_io_ldu_s2_loadLoadViolationQuery_0_resp_bits_replayFromFetch; // @[LSQWrapper.scala 167:20]
  assign io_ldu_s2_loadLoadViolationQuery_1_resp_valid = loadQueue_io_ldu_s2_loadLoadViolationQuery_1_resp_valid; // @[LSQWrapper.scala 167:20]
  assign io_ldu_s2_loadLoadViolationQuery_1_resp_bits_index =
    loadQueue_io_ldu_s2_loadLoadViolationQuery_1_resp_bits_index; // @[LSQWrapper.scala 167:20]
  assign io_ldu_s2_loadLoadViolationQuery_1_resp_bits_canAccept =
    loadQueue_io_ldu_s2_loadLoadViolationQuery_1_resp_bits_canAccept; // @[LSQWrapper.scala 167:20]
  assign io_ldu_s2_loadLoadViolationQuery_1_resp_bits_allocated =
    loadQueue_io_ldu_s2_loadLoadViolationQuery_1_resp_bits_allocated; // @[LSQWrapper.scala 167:20]
  assign io_ldu_s2_loadLoadViolationQuery_1_resp_bits_replayFromFetch =
    loadQueue_io_ldu_s2_loadLoadViolationQuery_1_resp_bits_replayFromFetch; // @[LSQWrapper.scala 167:20]
  assign io_loadOut_0_valid = loadQueue_io_loadOut_0_valid; // @[LSQWrapper.scala 168:24]
  assign io_loadOut_0_bits_uop_cf_exceptionVec_4 = loadQueue_io_loadOut_0_bits_uop_cf_exceptionVec_4; // @[LSQWrapper.scala 168:24]
  assign io_loadOut_0_bits_uop_cf_exceptionVec_5 = loadQueue_io_loadOut_0_bits_uop_cf_exceptionVec_5; // @[LSQWrapper.scala 168:24]
  assign io_loadOut_0_bits_uop_cf_exceptionVec_13 = loadQueue_io_loadOut_0_bits_uop_cf_exceptionVec_13; // @[LSQWrapper.scala 168:24]
  assign io_loadOut_0_bits_uop_cf_trigger_backendEn_1 = loadQueue_io_loadOut_0_bits_uop_cf_trigger_backendEn_1; // @[LSQWrapper.scala 168:24]
  assign io_loadOut_0_bits_uop_cf_trigger_backendHit_0 = loadQueue_io_loadOut_0_bits_uop_cf_trigger_backendHit_0; // @[LSQWrapper.scala 168:24]
  assign io_loadOut_0_bits_uop_cf_trigger_backendHit_1 = loadQueue_io_loadOut_0_bits_uop_cf_trigger_backendHit_1; // @[LSQWrapper.scala 168:24]
  assign io_loadOut_0_bits_uop_cf_trigger_backendHit_4 = loadQueue_io_loadOut_0_bits_uop_cf_trigger_backendHit_4; // @[LSQWrapper.scala 168:24]
  assign io_loadOut_0_bits_uop_ctrl_rfWen = loadQueue_io_loadOut_0_bits_uop_ctrl_rfWen; // @[LSQWrapper.scala 168:24]
  assign io_loadOut_0_bits_uop_ctrl_fpWen = loadQueue_io_loadOut_0_bits_uop_ctrl_fpWen; // @[LSQWrapper.scala 168:24]
  assign io_loadOut_0_bits_uop_ctrl_flushPipe = loadQueue_io_loadOut_0_bits_uop_ctrl_flushPipe; // @[LSQWrapper.scala 168:24]
  assign io_loadOut_0_bits_uop_ctrl_replayInst = loadQueue_io_loadOut_0_bits_uop_ctrl_replayInst; // @[LSQWrapper.scala 168:24]
  assign io_loadOut_0_bits_uop_pdest = loadQueue_io_loadOut_0_bits_uop_pdest; // @[LSQWrapper.scala 168:24]
  assign io_loadOut_0_bits_uop_robIdx_flag = loadQueue_io_loadOut_0_bits_uop_robIdx_flag; // @[LSQWrapper.scala 168:24]
  assign io_loadOut_0_bits_uop_robIdx_value = loadQueue_io_loadOut_0_bits_uop_robIdx_value; // @[LSQWrapper.scala 168:24]
  assign io_ldRawDataOut_0_lqData = loadQueue_io_ldRawDataOut_0_lqData; // @[LSQWrapper.scala 169:29]
  assign io_ldRawDataOut_0_uop_ctrl_fuOpType = loadQueue_io_ldRawDataOut_0_uop_ctrl_fuOpType; // @[LSQWrapper.scala 169:29]
  assign io_ldRawDataOut_0_uop_ctrl_fpWen = loadQueue_io_ldRawDataOut_0_uop_ctrl_fpWen; // @[LSQWrapper.scala 169:29]
  assign io_ldRawDataOut_0_addrOffset = loadQueue_io_ldRawDataOut_0_addrOffset; // @[LSQWrapper.scala 169:29]
  assign io_replay_0_valid = loadQueue_io_replay_0_valid; // @[LSQWrapper.scala 173:23]
  assign io_replay_0_bits_uop_cf_foldpc = loadQueue_io_replay_0_bits_uop_cf_foldpc; // @[LSQWrapper.scala 173:23]
  assign io_replay_0_bits_uop_cf_trigger_backendEn_1 = loadQueue_io_replay_0_bits_uop_cf_trigger_backendEn_1; // @[LSQWrapper.scala 173:23]
  assign io_replay_0_bits_uop_cf_trigger_backendHit_0 = loadQueue_io_replay_0_bits_uop_cf_trigger_backendHit_0; // @[LSQWrapper.scala 173:23]
  assign io_replay_0_bits_uop_cf_trigger_backendHit_1 = loadQueue_io_replay_0_bits_uop_cf_trigger_backendHit_1; // @[LSQWrapper.scala 173:23]
  assign io_replay_0_bits_uop_cf_trigger_backendHit_4 = loadQueue_io_replay_0_bits_uop_cf_trigger_backendHit_4; // @[LSQWrapper.scala 173:23]
  assign io_replay_0_bits_uop_cf_waitForRobIdx_flag = loadQueue_io_replay_0_bits_uop_cf_waitForRobIdx_flag; // @[LSQWrapper.scala 173:23]
  assign io_replay_0_bits_uop_cf_waitForRobIdx_value = loadQueue_io_replay_0_bits_uop_cf_waitForRobIdx_value; // @[LSQWrapper.scala 173:23]
  assign io_replay_0_bits_uop_cf_loadWaitBit = loadQueue_io_replay_0_bits_uop_cf_loadWaitBit; // @[LSQWrapper.scala 173:23]
  assign io_replay_0_bits_uop_cf_loadWaitStrict = loadQueue_io_replay_0_bits_uop_cf_loadWaitStrict; // @[LSQWrapper.scala 173:23]
  assign io_replay_0_bits_uop_cf_ftqPtr_flag = loadQueue_io_replay_0_bits_uop_cf_ftqPtr_flag; // @[LSQWrapper.scala 173:23]
  assign io_replay_0_bits_uop_cf_ftqPtr_value = loadQueue_io_replay_0_bits_uop_cf_ftqPtr_value; // @[LSQWrapper.scala 173:23]
  assign io_replay_0_bits_uop_cf_ftqOffset = loadQueue_io_replay_0_bits_uop_cf_ftqOffset; // @[LSQWrapper.scala 173:23]
  assign io_replay_0_bits_uop_ctrl_fuType = loadQueue_io_replay_0_bits_uop_ctrl_fuType; // @[LSQWrapper.scala 173:23]
  assign io_replay_0_bits_uop_ctrl_fuOpType = loadQueue_io_replay_0_bits_uop_ctrl_fuOpType; // @[LSQWrapper.scala 173:23]
  assign io_replay_0_bits_uop_ctrl_rfWen = loadQueue_io_replay_0_bits_uop_ctrl_rfWen; // @[LSQWrapper.scala 173:23]
  assign io_replay_0_bits_uop_ctrl_fpWen = loadQueue_io_replay_0_bits_uop_ctrl_fpWen; // @[LSQWrapper.scala 173:23]
  assign io_replay_0_bits_uop_pdest = loadQueue_io_replay_0_bits_uop_pdest; // @[LSQWrapper.scala 173:23]
  assign io_replay_0_bits_uop_robIdx_flag = loadQueue_io_replay_0_bits_uop_robIdx_flag; // @[LSQWrapper.scala 173:23]
  assign io_replay_0_bits_uop_robIdx_value = loadQueue_io_replay_0_bits_uop_robIdx_value; // @[LSQWrapper.scala 173:23]
  assign io_replay_0_bits_uop_lqIdx_flag = loadQueue_io_replay_0_bits_uop_lqIdx_flag; // @[LSQWrapper.scala 173:23]
  assign io_replay_0_bits_uop_lqIdx_value = loadQueue_io_replay_0_bits_uop_lqIdx_value; // @[LSQWrapper.scala 173:23]
  assign io_replay_0_bits_uop_sqIdx_flag = loadQueue_io_replay_0_bits_uop_sqIdx_flag; // @[LSQWrapper.scala 173:23]
  assign io_replay_0_bits_uop_sqIdx_value = loadQueue_io_replay_0_bits_uop_sqIdx_value; // @[LSQWrapper.scala 173:23]
  assign io_replay_0_bits_vaddr = loadQueue_io_replay_0_bits_vaddr; // @[LSQWrapper.scala 173:23]
  assign io_replay_0_bits_isFirstIssue = loadQueue_io_replay_0_bits_isFirstIssue; // @[LSQWrapper.scala 173:23]
  assign io_replay_0_bits_replayCarry_real_way_en = loadQueue_io_replay_0_bits_replayCarry_real_way_en; // @[LSQWrapper.scala 173:23]
  assign io_replay_0_bits_replayCarry_valid = loadQueue_io_replay_0_bits_replayCarry_valid; // @[LSQWrapper.scala 173:23]
  assign io_replay_0_bits_mshrid = loadQueue_io_replay_0_bits_mshrid; // @[LSQWrapper.scala 173:23]
  assign io_replay_0_bits_forward_tlDchannel = loadQueue_io_replay_0_bits_forward_tlDchannel; // @[LSQWrapper.scala 173:23]
  assign io_replay_0_bits_rarAllocated = loadQueue_io_replay_0_bits_rarAllocated; // @[LSQWrapper.scala 173:23]
  assign io_replay_0_bits_rarIndex = loadQueue_io_replay_0_bits_rarIndex; // @[LSQWrapper.scala 173:23]
  assign io_replay_0_bits_rawAllocated = loadQueue_io_replay_0_bits_rawAllocated; // @[LSQWrapper.scala 173:23]
  assign io_replay_0_bits_rawIndex = loadQueue_io_replay_0_bits_rawIndex; // @[LSQWrapper.scala 173:23]
  assign io_replay_1_valid = loadQueue_io_replay_1_valid; // @[LSQWrapper.scala 173:23]
  assign io_replay_1_bits_uop_cf_foldpc = loadQueue_io_replay_1_bits_uop_cf_foldpc; // @[LSQWrapper.scala 173:23]
  assign io_replay_1_bits_uop_cf_trigger_backendEn_1 = loadQueue_io_replay_1_bits_uop_cf_trigger_backendEn_1; // @[LSQWrapper.scala 173:23]
  assign io_replay_1_bits_uop_cf_trigger_backendHit_0 = loadQueue_io_replay_1_bits_uop_cf_trigger_backendHit_0; // @[LSQWrapper.scala 173:23]
  assign io_replay_1_bits_uop_cf_trigger_backendHit_1 = loadQueue_io_replay_1_bits_uop_cf_trigger_backendHit_1; // @[LSQWrapper.scala 173:23]
  assign io_replay_1_bits_uop_cf_trigger_backendHit_4 = loadQueue_io_replay_1_bits_uop_cf_trigger_backendHit_4; // @[LSQWrapper.scala 173:23]
  assign io_replay_1_bits_uop_cf_waitForRobIdx_flag = loadQueue_io_replay_1_bits_uop_cf_waitForRobIdx_flag; // @[LSQWrapper.scala 173:23]
  assign io_replay_1_bits_uop_cf_waitForRobIdx_value = loadQueue_io_replay_1_bits_uop_cf_waitForRobIdx_value; // @[LSQWrapper.scala 173:23]
  assign io_replay_1_bits_uop_cf_loadWaitBit = loadQueue_io_replay_1_bits_uop_cf_loadWaitBit; // @[LSQWrapper.scala 173:23]
  assign io_replay_1_bits_uop_cf_loadWaitStrict = loadQueue_io_replay_1_bits_uop_cf_loadWaitStrict; // @[LSQWrapper.scala 173:23]
  assign io_replay_1_bits_uop_cf_ftqPtr_flag = loadQueue_io_replay_1_bits_uop_cf_ftqPtr_flag; // @[LSQWrapper.scala 173:23]
  assign io_replay_1_bits_uop_cf_ftqPtr_value = loadQueue_io_replay_1_bits_uop_cf_ftqPtr_value; // @[LSQWrapper.scala 173:23]
  assign io_replay_1_bits_uop_cf_ftqOffset = loadQueue_io_replay_1_bits_uop_cf_ftqOffset; // @[LSQWrapper.scala 173:23]
  assign io_replay_1_bits_uop_ctrl_fuType = loadQueue_io_replay_1_bits_uop_ctrl_fuType; // @[LSQWrapper.scala 173:23]
  assign io_replay_1_bits_uop_ctrl_fuOpType = loadQueue_io_replay_1_bits_uop_ctrl_fuOpType; // @[LSQWrapper.scala 173:23]
  assign io_replay_1_bits_uop_ctrl_rfWen = loadQueue_io_replay_1_bits_uop_ctrl_rfWen; // @[LSQWrapper.scala 173:23]
  assign io_replay_1_bits_uop_ctrl_fpWen = loadQueue_io_replay_1_bits_uop_ctrl_fpWen; // @[LSQWrapper.scala 173:23]
  assign io_replay_1_bits_uop_pdest = loadQueue_io_replay_1_bits_uop_pdest; // @[LSQWrapper.scala 173:23]
  assign io_replay_1_bits_uop_robIdx_flag = loadQueue_io_replay_1_bits_uop_robIdx_flag; // @[LSQWrapper.scala 173:23]
  assign io_replay_1_bits_uop_robIdx_value = loadQueue_io_replay_1_bits_uop_robIdx_value; // @[LSQWrapper.scala 173:23]
  assign io_replay_1_bits_uop_lqIdx_flag = loadQueue_io_replay_1_bits_uop_lqIdx_flag; // @[LSQWrapper.scala 173:23]
  assign io_replay_1_bits_uop_lqIdx_value = loadQueue_io_replay_1_bits_uop_lqIdx_value; // @[LSQWrapper.scala 173:23]
  assign io_replay_1_bits_uop_sqIdx_flag = loadQueue_io_replay_1_bits_uop_sqIdx_flag; // @[LSQWrapper.scala 173:23]
  assign io_replay_1_bits_uop_sqIdx_value = loadQueue_io_replay_1_bits_uop_sqIdx_value; // @[LSQWrapper.scala 173:23]
  assign io_replay_1_bits_vaddr = loadQueue_io_replay_1_bits_vaddr; // @[LSQWrapper.scala 173:23]
  assign io_replay_1_bits_isFirstIssue = loadQueue_io_replay_1_bits_isFirstIssue; // @[LSQWrapper.scala 173:23]
  assign io_replay_1_bits_replayCarry_real_way_en = loadQueue_io_replay_1_bits_replayCarry_real_way_en; // @[LSQWrapper.scala 173:23]
  assign io_replay_1_bits_replayCarry_valid = loadQueue_io_replay_1_bits_replayCarry_valid; // @[LSQWrapper.scala 173:23]
  assign io_replay_1_bits_mshrid = loadQueue_io_replay_1_bits_mshrid; // @[LSQWrapper.scala 173:23]
  assign io_replay_1_bits_forward_tlDchannel = loadQueue_io_replay_1_bits_forward_tlDchannel; // @[LSQWrapper.scala 173:23]
  assign io_replay_1_bits_rarAllocated = loadQueue_io_replay_1_bits_rarAllocated; // @[LSQWrapper.scala 173:23]
  assign io_replay_1_bits_rarIndex = loadQueue_io_replay_1_bits_rarIndex; // @[LSQWrapper.scala 173:23]
  assign io_replay_1_bits_rawAllocated = loadQueue_io_replay_1_bits_rawAllocated; // @[LSQWrapper.scala 173:23]
  assign io_replay_1_bits_rawIndex = loadQueue_io_replay_1_bits_rawIndex; // @[LSQWrapper.scala 173:23]
  assign io_sbuffer_0_valid = storeQueue_io_sbuffer_0_valid; // @[LSQWrapper.scala 152:25]
  assign io_sbuffer_0_bits_addr = storeQueue_io_sbuffer_0_bits_addr; // @[LSQWrapper.scala 152:25]
  assign io_sbuffer_0_bits_data = storeQueue_io_sbuffer_0_bits_data; // @[LSQWrapper.scala 152:25]
  assign io_sbuffer_0_bits_mask = storeQueue_io_sbuffer_0_bits_mask; // @[LSQWrapper.scala 152:25]
  assign io_sbuffer_0_bits_vaddr = storeQueue_io_sbuffer_0_bits_vaddr; // @[LSQWrapper.scala 152:25]
  assign io_sbuffer_0_bits_wline = storeQueue_io_sbuffer_0_bits_wline; // @[LSQWrapper.scala 152:25]
  assign io_sbuffer_1_valid = storeQueue_io_sbuffer_1_valid; // @[LSQWrapper.scala 152:25]
  assign io_sbuffer_1_bits_addr = storeQueue_io_sbuffer_1_bits_addr; // @[LSQWrapper.scala 152:25]
  assign io_sbuffer_1_bits_data = storeQueue_io_sbuffer_1_bits_data; // @[LSQWrapper.scala 152:25]
  assign io_sbuffer_1_bits_mask = storeQueue_io_sbuffer_1_bits_mask; // @[LSQWrapper.scala 152:25]
  assign io_sbuffer_1_bits_vaddr = storeQueue_io_sbuffer_1_bits_vaddr; // @[LSQWrapper.scala 152:25]
  assign io_sbuffer_1_bits_wline = storeQueue_io_sbuffer_1_bits_wline; // @[LSQWrapper.scala 152:25]
  assign io_forward_0_forwardMask_0 = storeQueue_io_forward_0_forwardMask_0; // @[LSQWrapper.scala 160:25]
  assign io_forward_0_forwardMask_1 = storeQueue_io_forward_0_forwardMask_1; // @[LSQWrapper.scala 160:25]
  assign io_forward_0_forwardMask_2 = storeQueue_io_forward_0_forwardMask_2; // @[LSQWrapper.scala 160:25]
  assign io_forward_0_forwardMask_3 = storeQueue_io_forward_0_forwardMask_3; // @[LSQWrapper.scala 160:25]
  assign io_forward_0_forwardMask_4 = storeQueue_io_forward_0_forwardMask_4; // @[LSQWrapper.scala 160:25]
  assign io_forward_0_forwardMask_5 = storeQueue_io_forward_0_forwardMask_5; // @[LSQWrapper.scala 160:25]
  assign io_forward_0_forwardMask_6 = storeQueue_io_forward_0_forwardMask_6; // @[LSQWrapper.scala 160:25]
  assign io_forward_0_forwardMask_7 = storeQueue_io_forward_0_forwardMask_7; // @[LSQWrapper.scala 160:25]
  assign io_forward_0_forwardMask_8 = storeQueue_io_forward_0_forwardMask_8; // @[LSQWrapper.scala 160:25]
  assign io_forward_0_forwardMask_9 = storeQueue_io_forward_0_forwardMask_9; // @[LSQWrapper.scala 160:25]
  assign io_forward_0_forwardMask_10 = storeQueue_io_forward_0_forwardMask_10; // @[LSQWrapper.scala 160:25]
  assign io_forward_0_forwardMask_11 = storeQueue_io_forward_0_forwardMask_11; // @[LSQWrapper.scala 160:25]
  assign io_forward_0_forwardMask_12 = storeQueue_io_forward_0_forwardMask_12; // @[LSQWrapper.scala 160:25]
  assign io_forward_0_forwardMask_13 = storeQueue_io_forward_0_forwardMask_13; // @[LSQWrapper.scala 160:25]
  assign io_forward_0_forwardMask_14 = storeQueue_io_forward_0_forwardMask_14; // @[LSQWrapper.scala 160:25]
  assign io_forward_0_forwardMask_15 = storeQueue_io_forward_0_forwardMask_15; // @[LSQWrapper.scala 160:25]
  assign io_forward_0_forwardData_0 = storeQueue_io_forward_0_forwardData_0; // @[LSQWrapper.scala 160:25]
  assign io_forward_0_forwardData_1 = storeQueue_io_forward_0_forwardData_1; // @[LSQWrapper.scala 160:25]
  assign io_forward_0_forwardData_2 = storeQueue_io_forward_0_forwardData_2; // @[LSQWrapper.scala 160:25]
  assign io_forward_0_forwardData_3 = storeQueue_io_forward_0_forwardData_3; // @[LSQWrapper.scala 160:25]
  assign io_forward_0_forwardData_4 = storeQueue_io_forward_0_forwardData_4; // @[LSQWrapper.scala 160:25]
  assign io_forward_0_forwardData_5 = storeQueue_io_forward_0_forwardData_5; // @[LSQWrapper.scala 160:25]
  assign io_forward_0_forwardData_6 = storeQueue_io_forward_0_forwardData_6; // @[LSQWrapper.scala 160:25]
  assign io_forward_0_forwardData_7 = storeQueue_io_forward_0_forwardData_7; // @[LSQWrapper.scala 160:25]
  assign io_forward_0_forwardData_8 = storeQueue_io_forward_0_forwardData_8; // @[LSQWrapper.scala 160:25]
  assign io_forward_0_forwardData_9 = storeQueue_io_forward_0_forwardData_9; // @[LSQWrapper.scala 160:25]
  assign io_forward_0_forwardData_10 = storeQueue_io_forward_0_forwardData_10; // @[LSQWrapper.scala 160:25]
  assign io_forward_0_forwardData_11 = storeQueue_io_forward_0_forwardData_11; // @[LSQWrapper.scala 160:25]
  assign io_forward_0_forwardData_12 = storeQueue_io_forward_0_forwardData_12; // @[LSQWrapper.scala 160:25]
  assign io_forward_0_forwardData_13 = storeQueue_io_forward_0_forwardData_13; // @[LSQWrapper.scala 160:25]
  assign io_forward_0_forwardData_14 = storeQueue_io_forward_0_forwardData_14; // @[LSQWrapper.scala 160:25]
  assign io_forward_0_forwardData_15 = storeQueue_io_forward_0_forwardData_15; // @[LSQWrapper.scala 160:25]
  assign io_forward_0_dataInvalid = storeQueue_io_forward_0_dataInvalid; // @[LSQWrapper.scala 160:25]
  assign io_forward_0_matchInvalid = storeQueue_io_forward_0_matchInvalid; // @[LSQWrapper.scala 160:25]
  assign io_forward_0_schedWait = storeQueue_io_forward_0_schedWait; // @[LSQWrapper.scala 160:25]
  assign io_forward_0_dataInvalidSqIdx_flag = storeQueue_io_forward_0_dataInvalidSqIdx_flag; // @[LSQWrapper.scala 160:25]
  assign io_forward_0_dataInvalidSqIdx_value = storeQueue_io_forward_0_dataInvalidSqIdx_value; // @[LSQWrapper.scala 160:25]
  assign io_forward_0_addrInvalidSqIdx_flag = storeQueue_io_forward_0_addrInvalidSqIdx_flag; // @[LSQWrapper.scala 160:25]
  assign io_forward_0_addrInvalidSqIdx_value = storeQueue_io_forward_0_addrInvalidSqIdx_value; // @[LSQWrapper.scala 160:25]
  assign io_forward_1_forwardMask_0 = storeQueue_io_forward_1_forwardMask_0; // @[LSQWrapper.scala 160:25]
  assign io_forward_1_forwardMask_1 = storeQueue_io_forward_1_forwardMask_1; // @[LSQWrapper.scala 160:25]
  assign io_forward_1_forwardMask_2 = storeQueue_io_forward_1_forwardMask_2; // @[LSQWrapper.scala 160:25]
  assign io_forward_1_forwardMask_3 = storeQueue_io_forward_1_forwardMask_3; // @[LSQWrapper.scala 160:25]
  assign io_forward_1_forwardMask_4 = storeQueue_io_forward_1_forwardMask_4; // @[LSQWrapper.scala 160:25]
  assign io_forward_1_forwardMask_5 = storeQueue_io_forward_1_forwardMask_5; // @[LSQWrapper.scala 160:25]
  assign io_forward_1_forwardMask_6 = storeQueue_io_forward_1_forwardMask_6; // @[LSQWrapper.scala 160:25]
  assign io_forward_1_forwardMask_7 = storeQueue_io_forward_1_forwardMask_7; // @[LSQWrapper.scala 160:25]
  assign io_forward_1_forwardMask_8 = storeQueue_io_forward_1_forwardMask_8; // @[LSQWrapper.scala 160:25]
  assign io_forward_1_forwardMask_9 = storeQueue_io_forward_1_forwardMask_9; // @[LSQWrapper.scala 160:25]
  assign io_forward_1_forwardMask_10 = storeQueue_io_forward_1_forwardMask_10; // @[LSQWrapper.scala 160:25]
  assign io_forward_1_forwardMask_11 = storeQueue_io_forward_1_forwardMask_11; // @[LSQWrapper.scala 160:25]
  assign io_forward_1_forwardMask_12 = storeQueue_io_forward_1_forwardMask_12; // @[LSQWrapper.scala 160:25]
  assign io_forward_1_forwardMask_13 = storeQueue_io_forward_1_forwardMask_13; // @[LSQWrapper.scala 160:25]
  assign io_forward_1_forwardMask_14 = storeQueue_io_forward_1_forwardMask_14; // @[LSQWrapper.scala 160:25]
  assign io_forward_1_forwardMask_15 = storeQueue_io_forward_1_forwardMask_15; // @[LSQWrapper.scala 160:25]
  assign io_forward_1_forwardData_0 = storeQueue_io_forward_1_forwardData_0; // @[LSQWrapper.scala 160:25]
  assign io_forward_1_forwardData_1 = storeQueue_io_forward_1_forwardData_1; // @[LSQWrapper.scala 160:25]
  assign io_forward_1_forwardData_2 = storeQueue_io_forward_1_forwardData_2; // @[LSQWrapper.scala 160:25]
  assign io_forward_1_forwardData_3 = storeQueue_io_forward_1_forwardData_3; // @[LSQWrapper.scala 160:25]
  assign io_forward_1_forwardData_4 = storeQueue_io_forward_1_forwardData_4; // @[LSQWrapper.scala 160:25]
  assign io_forward_1_forwardData_5 = storeQueue_io_forward_1_forwardData_5; // @[LSQWrapper.scala 160:25]
  assign io_forward_1_forwardData_6 = storeQueue_io_forward_1_forwardData_6; // @[LSQWrapper.scala 160:25]
  assign io_forward_1_forwardData_7 = storeQueue_io_forward_1_forwardData_7; // @[LSQWrapper.scala 160:25]
  assign io_forward_1_forwardData_8 = storeQueue_io_forward_1_forwardData_8; // @[LSQWrapper.scala 160:25]
  assign io_forward_1_forwardData_9 = storeQueue_io_forward_1_forwardData_9; // @[LSQWrapper.scala 160:25]
  assign io_forward_1_forwardData_10 = storeQueue_io_forward_1_forwardData_10; // @[LSQWrapper.scala 160:25]
  assign io_forward_1_forwardData_11 = storeQueue_io_forward_1_forwardData_11; // @[LSQWrapper.scala 160:25]
  assign io_forward_1_forwardData_12 = storeQueue_io_forward_1_forwardData_12; // @[LSQWrapper.scala 160:25]
  assign io_forward_1_forwardData_13 = storeQueue_io_forward_1_forwardData_13; // @[LSQWrapper.scala 160:25]
  assign io_forward_1_forwardData_14 = storeQueue_io_forward_1_forwardData_14; // @[LSQWrapper.scala 160:25]
  assign io_forward_1_forwardData_15 = storeQueue_io_forward_1_forwardData_15; // @[LSQWrapper.scala 160:25]
  assign io_forward_1_dataInvalid = storeQueue_io_forward_1_dataInvalid; // @[LSQWrapper.scala 160:25]
  assign io_forward_1_matchInvalid = storeQueue_io_forward_1_matchInvalid; // @[LSQWrapper.scala 160:25]
  assign io_forward_1_schedWait = storeQueue_io_forward_1_schedWait; // @[LSQWrapper.scala 160:25]
  assign io_forward_1_dataInvalidSqIdx_flag = storeQueue_io_forward_1_dataInvalidSqIdx_flag; // @[LSQWrapper.scala 160:25]
  assign io_forward_1_dataInvalidSqIdx_value = storeQueue_io_forward_1_dataInvalidSqIdx_value; // @[LSQWrapper.scala 160:25]
  assign io_forward_1_addrInvalidSqIdx_flag = storeQueue_io_forward_1_addrInvalidSqIdx_flag; // @[LSQWrapper.scala 160:25]
  assign io_forward_1_addrInvalidSqIdx_value = storeQueue_io_forward_1_addrInvalidSqIdx_value; // @[LSQWrapper.scala 160:25]
  assign io_rob_isMMIO_0 = loadQueue_io_rob_isMMIO_0; // @[LSQWrapper.scala 170:20]
  assign io_rob_isMMIO_1 = loadQueue_io_rob_isMMIO_1; // @[LSQWrapper.scala 170:20]
  assign io_rob_uop_0_robIdx_value = loadQueue_io_rob_uop_0_robIdx_value; // @[LSQWrapper.scala 170:20]
  assign io_rob_uop_1_robIdx_value = loadQueue_io_rob_uop_1_robIdx_value; // @[LSQWrapper.scala 170:20]
  assign io_rollback_valid = loadQueue_io_rollback_valid; // @[LSQWrapper.scala 171:25]
  assign io_rollback_bits_robIdx_flag = loadQueue_io_rollback_bits_robIdx_flag; // @[LSQWrapper.scala 171:25]
  assign io_rollback_bits_robIdx_value = loadQueue_io_rollback_bits_robIdx_value; // @[LSQWrapper.scala 171:25]
  assign io_rollback_bits_ftqIdx_flag = loadQueue_io_rollback_bits_ftqIdx_flag; // @[LSQWrapper.scala 171:25]
  assign io_rollback_bits_ftqIdx_value = loadQueue_io_rollback_bits_ftqIdx_value; // @[LSQWrapper.scala 171:25]
  assign io_rollback_bits_ftqOffset = loadQueue_io_rollback_bits_ftqOffset; // @[LSQWrapper.scala 171:25]
  assign io_rollback_bits_stFtqIdx_value = loadQueue_io_rollback_bits_stFtqIdx_value; // @[LSQWrapper.scala 171:25]
  assign io_rollback_bits_stFtqOffset = loadQueue_io_rollback_bits_stFtqOffset; // @[LSQWrapper.scala 171:25]
  assign io_correctTableUpdate_valid = loadQueue_io_correctTableUpdate_valid; // @[LSQWrapper.scala 172:35]
  assign io_correctTableUpdate_bits_addr = loadQueue_io_correctTableUpdate_bits_addr; // @[LSQWrapper.scala 172:35]
  assign io_uncache_req_valid = loadQueue_io_uncache_req_valid ? loadQueue_io_uncache_req_valid :
    storeQueue_io_uncache_req_valid; // @[LSQWrapper.scala 223:39 224:20 226:20]
  assign io_uncache_req_bits_cmd = loadQueue_io_uncache_req_valid ? 5'h0 : 5'h1; // @[LSQWrapper.scala 223:39 224:20 226:20]
  assign io_uncache_req_bits_addr = loadQueue_io_uncache_req_valid ? loadQueue_io_uncache_req_bits_addr :
    storeQueue_io_uncache_req_bits_addr; // @[LSQWrapper.scala 223:39 224:20 226:20]
  assign io_uncache_req_bits_data = loadQueue_io_uncache_req_valid ? 64'h0 : storeQueue_io_uncache_req_bits_data; // @[LSQWrapper.scala 223:39 224:20 226:20]
  assign io_uncache_req_bits_mask = loadQueue_io_uncache_req_valid ? loadQueue_io_uncache_req_bits_mask :
    storeQueue_io_uncache_req_bits_mask; // @[LSQWrapper.scala 223:39 224:20 226:20]
  assign io_uncache_req_bits_atomic = loadQueue_io_uncache_req_valid | storeQueue_io_uncache_req_bits_atomic; // @[LSQWrapper.scala 223:39 224:20 226:20]
  assign io_uncache_resp_ready = 1'h1; // @[LSQWrapper.scala 228:32 229:21]
  assign io_mmioStout_valid = storeQueue_io_mmioStout_valid; // @[LSQWrapper.scala 153:27]
  assign io_mmioStout_bits_uop_cf_trigger_backendEn_0 = storeQueue_io_mmioStout_bits_uop_cf_trigger_backendEn_0; // @[LSQWrapper.scala 153:27]
  assign io_mmioStout_bits_uop_robIdx_flag = storeQueue_io_mmioStout_bits_uop_robIdx_flag; // @[LSQWrapper.scala 153:27]
  assign io_mmioStout_bits_uop_robIdx_value = storeQueue_io_mmioStout_bits_uop_robIdx_value; // @[LSQWrapper.scala 153:27]
  assign io_sqEmpty = storeQueue_io_sqEmpty; // @[LSQWrapper.scala 161:25]
  assign io_lqReplayFull = loadQueue_io_lqReplayFull; // @[LSQWrapper.scala 185:29]
  assign io_sqCancelCnt = storeQueue_io_sqCancelCnt; // @[LSQWrapper.scala 156:29]
  assign io_lqCancelCnt = loadQueue_io_lqCancelCnt; // @[LSQWrapper.scala 178:28]
  assign io_lqDeq = loadQueue_io_lqDeq; // @[LSQWrapper.scala 186:22]
  assign io_sqDeq = storeQueue_io_sqDeq; // @[LSQWrapper.scala 157:23]
  assign io_exceptionAddr_vaddr = io_exceptionAddr_vaddr_REG ? storeQueue_io_exceptionAddr_vaddr :
    loadQueue_io_exceptionAddr_vaddr; // @[LSQWrapper.scala 194:32]
  assign io_trigger_0_lqLoadAddrTriggerHitVec_0 = loadQueue_io_trigger_0_lqLoadAddrTriggerHitVec_0; // @[LSQWrapper.scala 176:24]
  assign io_trigger_0_lqLoadAddrTriggerHitVec_1 = loadQueue_io_trigger_0_lqLoadAddrTriggerHitVec_1; // @[LSQWrapper.scala 176:24]
  assign io_trigger_0_lqLoadAddrTriggerHitVec_2 = loadQueue_io_trigger_0_lqLoadAddrTriggerHitVec_2; // @[LSQWrapper.scala 176:24]
  assign io_perf_0_value = io_perf_0_value_REG_1; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_1_value = io_perf_1_value_REG_1; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_2_value = io_perf_2_value_REG_1; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_3_value = io_perf_3_value_REG_1; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_4_value = io_perf_4_value_REG_1; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_5_value = io_perf_5_value_REG_1; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_6_value = io_perf_6_value_REG_1; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_7_value = io_perf_7_value_REG_1; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_8_value = io_perf_8_value_REG_1; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_9_value = io_perf_9_value_REG_1; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_10_value = io_perf_10_value_REG_1; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_11_value = io_perf_11_value_REG_1; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_12_value = io_perf_12_value_REG_1; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_13_value = io_perf_13_value_REG_1; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_14_value = io_perf_14_value_REG_1; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_15_value = io_perf_15_value_REG_1; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_16_value = io_perf_16_value_REG_1; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_17_value = io_perf_17_value_REG_1; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_18_value = io_perf_18_value_REG_1; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_19_value = io_perf_19_value_REG_1; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_20_value = io_perf_20_value_REG_1; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_21_value = io_perf_21_value_REG_1; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_22_value = io_perf_22_value_REG_1; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_23_value = io_perf_23_value_REG_1; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_24_value = io_perf_24_value_REG_1; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_25_value = io_perf_25_value_REG_1; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_26_value = io_perf_26_value_REG_1; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_27_value = io_perf_27_value_REG_1; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_28_value = io_perf_28_value_REG_1; // @[PerfCounterUtils.scala 188:17]
  assign io_perf_29_value = io_perf_29_value_REG_1; // @[PerfCounterUtils.scala 188:17]
  assign loadQueue_clock = clock;
  assign loadQueue_reset = reset;
  assign loadQueue_io_redirect_valid = io_brqRedirect_valid; // @[LSQWrapper.scala 166:25]
  assign loadQueue_io_redirect_bits_robIdx_flag = io_brqRedirect_bits_robIdx_flag; // @[LSQWrapper.scala 166:25]
  assign loadQueue_io_redirect_bits_robIdx_value = io_brqRedirect_bits_robIdx_value; // @[LSQWrapper.scala 166:25]
  assign loadQueue_io_redirect_bits_level = io_brqRedirect_bits_level; // @[LSQWrapper.scala 166:25]
  assign loadQueue_io_enq_sqCanAccept = storeQueue_io_enq_canAccept; // @[LSQWrapper.scala 128:32]
  assign loadQueue_io_enq_req_0_valid = io_enq_needAlloc_0[0] & io_enq_req_0_valid; // @[LSQWrapper.scala 132:66]
  assign loadQueue_io_enq_req_0_bits_cf_trigger_backendEn_1 = io_enq_req_0_bits_cf_trigger_backendEn_1; // @[LSQWrapper.scala 133:40]
  assign loadQueue_io_enq_req_0_bits_ctrl_fuOpType = io_enq_req_0_bits_ctrl_fuOpType; // @[LSQWrapper.scala 133:40]
  assign loadQueue_io_enq_req_0_bits_ctrl_rfWen = io_enq_req_0_bits_ctrl_rfWen; // @[LSQWrapper.scala 133:40]
  assign loadQueue_io_enq_req_0_bits_ctrl_fpWen = io_enq_req_0_bits_ctrl_fpWen; // @[LSQWrapper.scala 133:40]
  assign loadQueue_io_enq_req_0_bits_ctrl_flushPipe = io_enq_req_0_bits_ctrl_flushPipe; // @[LSQWrapper.scala 133:40]
  assign loadQueue_io_enq_req_0_bits_ctrl_replayInst = io_enq_req_0_bits_ctrl_replayInst; // @[LSQWrapper.scala 133:40]
  assign loadQueue_io_enq_req_0_bits_pdest = io_enq_req_0_bits_pdest; // @[LSQWrapper.scala 133:40]
  assign loadQueue_io_enq_req_0_bits_robIdx_flag = io_enq_req_0_bits_robIdx_flag; // @[LSQWrapper.scala 133:40]
  assign loadQueue_io_enq_req_0_bits_robIdx_value = io_enq_req_0_bits_robIdx_value; // @[LSQWrapper.scala 133:40]
  assign loadQueue_io_enq_req_0_bits_lqIdx_value = io_enq_req_0_bits_lqIdx_value; // @[LSQWrapper.scala 133:40]
  assign loadQueue_io_enq_req_1_valid = io_enq_needAlloc_1[0] & io_enq_req_1_valid; // @[LSQWrapper.scala 132:66]
  assign loadQueue_io_enq_req_1_bits_cf_trigger_backendEn_1 = io_enq_req_1_bits_cf_trigger_backendEn_1; // @[LSQWrapper.scala 133:40]
  assign loadQueue_io_enq_req_1_bits_ctrl_fuOpType = io_enq_req_1_bits_ctrl_fuOpType; // @[LSQWrapper.scala 133:40]
  assign loadQueue_io_enq_req_1_bits_ctrl_rfWen = io_enq_req_1_bits_ctrl_rfWen; // @[LSQWrapper.scala 133:40]
  assign loadQueue_io_enq_req_1_bits_ctrl_fpWen = io_enq_req_1_bits_ctrl_fpWen; // @[LSQWrapper.scala 133:40]
  assign loadQueue_io_enq_req_1_bits_ctrl_flushPipe = io_enq_req_1_bits_ctrl_flushPipe; // @[LSQWrapper.scala 133:40]
  assign loadQueue_io_enq_req_1_bits_ctrl_replayInst = io_enq_req_1_bits_ctrl_replayInst; // @[LSQWrapper.scala 133:40]
  assign loadQueue_io_enq_req_1_bits_pdest = io_enq_req_1_bits_pdest; // @[LSQWrapper.scala 133:40]
  assign loadQueue_io_enq_req_1_bits_robIdx_flag = io_enq_req_1_bits_robIdx_flag; // @[LSQWrapper.scala 133:40]
  assign loadQueue_io_enq_req_1_bits_robIdx_value = io_enq_req_1_bits_robIdx_value; // @[LSQWrapper.scala 133:40]
  assign loadQueue_io_enq_req_1_bits_lqIdx_value = io_enq_req_1_bits_lqIdx_value; // @[LSQWrapper.scala 133:40]
  assign loadQueue_io_enq_req_2_valid = io_enq_needAlloc_2[0] & io_enq_req_2_valid; // @[LSQWrapper.scala 132:66]
  assign loadQueue_io_enq_req_2_bits_cf_trigger_backendEn_1 = io_enq_req_2_bits_cf_trigger_backendEn_1; // @[LSQWrapper.scala 133:40]
  assign loadQueue_io_enq_req_2_bits_ctrl_fuOpType = io_enq_req_2_bits_ctrl_fuOpType; // @[LSQWrapper.scala 133:40]
  assign loadQueue_io_enq_req_2_bits_ctrl_rfWen = io_enq_req_2_bits_ctrl_rfWen; // @[LSQWrapper.scala 133:40]
  assign loadQueue_io_enq_req_2_bits_ctrl_fpWen = io_enq_req_2_bits_ctrl_fpWen; // @[LSQWrapper.scala 133:40]
  assign loadQueue_io_enq_req_2_bits_ctrl_flushPipe = io_enq_req_2_bits_ctrl_flushPipe; // @[LSQWrapper.scala 133:40]
  assign loadQueue_io_enq_req_2_bits_ctrl_replayInst = io_enq_req_2_bits_ctrl_replayInst; // @[LSQWrapper.scala 133:40]
  assign loadQueue_io_enq_req_2_bits_pdest = io_enq_req_2_bits_pdest; // @[LSQWrapper.scala 133:40]
  assign loadQueue_io_enq_req_2_bits_robIdx_flag = io_enq_req_2_bits_robIdx_flag; // @[LSQWrapper.scala 133:40]
  assign loadQueue_io_enq_req_2_bits_robIdx_value = io_enq_req_2_bits_robIdx_value; // @[LSQWrapper.scala 133:40]
  assign loadQueue_io_enq_req_2_bits_lqIdx_value = io_enq_req_2_bits_lqIdx_value; // @[LSQWrapper.scala 133:40]
  assign loadQueue_io_enq_req_3_valid = io_enq_needAlloc_3[0] & io_enq_req_3_valid; // @[LSQWrapper.scala 132:66]
  assign loadQueue_io_enq_req_3_bits_cf_trigger_backendEn_1 = io_enq_req_3_bits_cf_trigger_backendEn_1; // @[LSQWrapper.scala 133:40]
  assign loadQueue_io_enq_req_3_bits_ctrl_fuOpType = io_enq_req_3_bits_ctrl_fuOpType; // @[LSQWrapper.scala 133:40]
  assign loadQueue_io_enq_req_3_bits_ctrl_rfWen = io_enq_req_3_bits_ctrl_rfWen; // @[LSQWrapper.scala 133:40]
  assign loadQueue_io_enq_req_3_bits_ctrl_fpWen = io_enq_req_3_bits_ctrl_fpWen; // @[LSQWrapper.scala 133:40]
  assign loadQueue_io_enq_req_3_bits_ctrl_flushPipe = io_enq_req_3_bits_ctrl_flushPipe; // @[LSQWrapper.scala 133:40]
  assign loadQueue_io_enq_req_3_bits_ctrl_replayInst = io_enq_req_3_bits_ctrl_replayInst; // @[LSQWrapper.scala 133:40]
  assign loadQueue_io_enq_req_3_bits_pdest = io_enq_req_3_bits_pdest; // @[LSQWrapper.scala 133:40]
  assign loadQueue_io_enq_req_3_bits_robIdx_flag = io_enq_req_3_bits_robIdx_flag; // @[LSQWrapper.scala 133:40]
  assign loadQueue_io_enq_req_3_bits_robIdx_value = io_enq_req_3_bits_robIdx_value; // @[LSQWrapper.scala 133:40]
  assign loadQueue_io_enq_req_3_bits_lqIdx_value = io_enq_req_3_bits_lqIdx_value; // @[LSQWrapper.scala 133:40]
  assign loadQueue_io_ldu_s2_storeLoadViolationQuery_0_req_valid = io_ldu_s2_storeLoadViolationQuery_0_req_valid; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_cf_foldpc =
    io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_cf_foldpc; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_cf_ftqPtr_flag =
    io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_cf_ftqPtr_flag; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_cf_ftqPtr_value =
    io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_cf_ftqPtr_value; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_cf_ftqOffset =
    io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_cf_ftqOffset; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_robIdx_flag =
    io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_robIdx_flag; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_robIdx_value =
    io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_robIdx_value; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_sqIdx_flag =
    io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_sqIdx_flag; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_sqIdx_value =
    io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_sqIdx_value; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s2_storeLoadViolationQuery_0_req_bits_index =
    io_ldu_s2_storeLoadViolationQuery_0_req_bits_index; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s2_storeLoadViolationQuery_0_req_bits_allocated =
    io_ldu_s2_storeLoadViolationQuery_0_req_bits_allocated; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s2_storeLoadViolationQuery_0_req_bits_datavalid =
    io_ldu_s2_storeLoadViolationQuery_0_req_bits_datavalid; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s2_storeLoadViolationQuery_0_req_bits_mask = io_ldu_s2_storeLoadViolationQuery_0_req_bits_mask
    ; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s2_storeLoadViolationQuery_0_req_bits_paddr =
    io_ldu_s2_storeLoadViolationQuery_0_req_bits_paddr; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s2_storeLoadViolationQuery_1_req_valid = io_ldu_s2_storeLoadViolationQuery_1_req_valid; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_cf_foldpc =
    io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_cf_foldpc; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_cf_ftqPtr_flag =
    io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_cf_ftqPtr_flag; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_cf_ftqPtr_value =
    io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_cf_ftqPtr_value; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_cf_ftqOffset =
    io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_cf_ftqOffset; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_robIdx_flag =
    io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_robIdx_flag; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_robIdx_value =
    io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_robIdx_value; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_sqIdx_flag =
    io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_sqIdx_flag; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_sqIdx_value =
    io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_sqIdx_value; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s2_storeLoadViolationQuery_1_req_bits_index =
    io_ldu_s2_storeLoadViolationQuery_1_req_bits_index; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s2_storeLoadViolationQuery_1_req_bits_allocated =
    io_ldu_s2_storeLoadViolationQuery_1_req_bits_allocated; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s2_storeLoadViolationQuery_1_req_bits_datavalid =
    io_ldu_s2_storeLoadViolationQuery_1_req_bits_datavalid; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s2_storeLoadViolationQuery_1_req_bits_mask = io_ldu_s2_storeLoadViolationQuery_1_req_bits_mask
    ; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s2_storeLoadViolationQuery_1_req_bits_paddr =
    io_ldu_s2_storeLoadViolationQuery_1_req_bits_paddr; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s2_loadLoadViolationQuery_0_req_valid = io_ldu_s2_loadLoadViolationQuery_0_req_valid; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s2_loadLoadViolationQuery_0_req_bits_uop_robIdx_flag =
    io_ldu_s2_loadLoadViolationQuery_0_req_bits_uop_robIdx_flag; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s2_loadLoadViolationQuery_0_req_bits_uop_robIdx_value =
    io_ldu_s2_loadLoadViolationQuery_0_req_bits_uop_robIdx_value; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s2_loadLoadViolationQuery_0_req_bits_uop_lqIdx_flag =
    io_ldu_s2_loadLoadViolationQuery_0_req_bits_uop_lqIdx_flag; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s2_loadLoadViolationQuery_0_req_bits_uop_lqIdx_value =
    io_ldu_s2_loadLoadViolationQuery_0_req_bits_uop_lqIdx_value; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s2_loadLoadViolationQuery_0_req_bits_index = io_ldu_s2_loadLoadViolationQuery_0_req_bits_index
    ; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s2_loadLoadViolationQuery_0_req_bits_allocated =
    io_ldu_s2_loadLoadViolationQuery_0_req_bits_allocated; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s2_loadLoadViolationQuery_0_req_bits_datavalid =
    io_ldu_s2_loadLoadViolationQuery_0_req_bits_datavalid; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s2_loadLoadViolationQuery_0_req_bits_miss = io_ldu_s2_loadLoadViolationQuery_0_req_bits_miss; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s2_loadLoadViolationQuery_0_req_bits_paddr = io_ldu_s2_loadLoadViolationQuery_0_req_bits_paddr
    ; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s2_loadLoadViolationQuery_1_req_valid = io_ldu_s2_loadLoadViolationQuery_1_req_valid; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s2_loadLoadViolationQuery_1_req_bits_uop_robIdx_flag =
    io_ldu_s2_loadLoadViolationQuery_1_req_bits_uop_robIdx_flag; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s2_loadLoadViolationQuery_1_req_bits_uop_robIdx_value =
    io_ldu_s2_loadLoadViolationQuery_1_req_bits_uop_robIdx_value; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s2_loadLoadViolationQuery_1_req_bits_uop_lqIdx_flag =
    io_ldu_s2_loadLoadViolationQuery_1_req_bits_uop_lqIdx_flag; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s2_loadLoadViolationQuery_1_req_bits_uop_lqIdx_value =
    io_ldu_s2_loadLoadViolationQuery_1_req_bits_uop_lqIdx_value; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s2_loadLoadViolationQuery_1_req_bits_index = io_ldu_s2_loadLoadViolationQuery_1_req_bits_index
    ; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s2_loadLoadViolationQuery_1_req_bits_allocated =
    io_ldu_s2_loadLoadViolationQuery_1_req_bits_allocated; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s2_loadLoadViolationQuery_1_req_bits_datavalid =
    io_ldu_s2_loadLoadViolationQuery_1_req_bits_datavalid; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s2_loadLoadViolationQuery_1_req_bits_miss = io_ldu_s2_loadLoadViolationQuery_1_req_bits_miss; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s2_loadLoadViolationQuery_1_req_bits_paddr = io_ldu_s2_loadLoadViolationQuery_1_req_bits_paddr
    ; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_valid = io_ldu_s3_loadIn_0_valid; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_uop_cf_foldpc = io_ldu_s3_loadIn_0_bits_uop_cf_foldpc; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_uop_cf_exceptionVec_4 = io_ldu_s3_loadIn_0_bits_uop_cf_exceptionVec_4; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_uop_cf_exceptionVec_5 = io_ldu_s3_loadIn_0_bits_uop_cf_exceptionVec_5; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_uop_cf_exceptionVec_13 = io_ldu_s3_loadIn_0_bits_uop_cf_exceptionVec_13; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_uop_cf_trigger_backendEn_1 =
    io_ldu_s3_loadIn_0_bits_uop_cf_trigger_backendEn_1; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_uop_cf_trigger_backendHit_0 =
    io_ldu_s3_loadIn_0_bits_uop_cf_trigger_backendHit_0; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_uop_cf_trigger_backendHit_1 =
    io_ldu_s3_loadIn_0_bits_uop_cf_trigger_backendHit_1; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_uop_cf_trigger_backendHit_4 =
    io_ldu_s3_loadIn_0_bits_uop_cf_trigger_backendHit_4; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_uop_cf_waitForRobIdx_flag = io_ldu_s3_loadIn_0_bits_uop_cf_waitForRobIdx_flag
    ; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_uop_cf_waitForRobIdx_value =
    io_ldu_s3_loadIn_0_bits_uop_cf_waitForRobIdx_value; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_uop_cf_loadWaitBit = io_ldu_s3_loadIn_0_bits_uop_cf_loadWaitBit; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_uop_cf_loadWaitStrict = io_ldu_s3_loadIn_0_bits_uop_cf_loadWaitStrict; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_uop_cf_ftqPtr_flag = io_ldu_s3_loadIn_0_bits_uop_cf_ftqPtr_flag; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_uop_cf_ftqPtr_value = io_ldu_s3_loadIn_0_bits_uop_cf_ftqPtr_value; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_uop_cf_ftqOffset = io_ldu_s3_loadIn_0_bits_uop_cf_ftqOffset; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_uop_ctrl_fuType = io_ldu_s3_loadIn_0_bits_uop_ctrl_fuType; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_uop_ctrl_fuOpType = io_ldu_s3_loadIn_0_bits_uop_ctrl_fuOpType; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_uop_ctrl_rfWen = io_ldu_s3_loadIn_0_bits_uop_ctrl_rfWen; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_uop_ctrl_fpWen = io_ldu_s3_loadIn_0_bits_uop_ctrl_fpWen; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_uop_ctrl_replayInst = io_ldu_s3_loadIn_0_bits_uop_ctrl_replayInst; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_uop_pdest = io_ldu_s3_loadIn_0_bits_uop_pdest; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_uop_robIdx_flag = io_ldu_s3_loadIn_0_bits_uop_robIdx_flag; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_uop_robIdx_value = io_ldu_s3_loadIn_0_bits_uop_robIdx_value; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_uop_lqIdx_flag = io_ldu_s3_loadIn_0_bits_uop_lqIdx_flag; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_uop_lqIdx_value = io_ldu_s3_loadIn_0_bits_uop_lqIdx_value; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_uop_sqIdx_flag = io_ldu_s3_loadIn_0_bits_uop_sqIdx_flag; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_uop_sqIdx_value = io_ldu_s3_loadIn_0_bits_uop_sqIdx_value; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_vaddr = io_ldu_s3_loadIn_0_bits_vaddr; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_paddr = io_ldu_s3_loadIn_0_bits_paddr; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_mask = io_ldu_s3_loadIn_0_bits_mask; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_miss = io_ldu_s3_loadIn_0_bits_miss; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_tlbMiss = io_ldu_s3_loadIn_0_bits_tlbMiss; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_mmio = io_ldu_s3_loadIn_0_bits_mmio; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_rarAllocated = io_ldu_s3_loadIn_0_bits_rarAllocated; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_rarIndex = io_ldu_s3_loadIn_0_bits_rarIndex; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_rawAllocated = io_ldu_s3_loadIn_0_bits_rawAllocated; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_rawIndex = io_ldu_s3_loadIn_0_bits_rawIndex; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_replayInfo_missMSHRId = io_ldu_s3_loadIn_0_bits_replayInfo_missMSHRId; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_replayInfo_canForwardFullData =
    io_ldu_s3_loadIn_0_bits_replayInfo_canForwardFullData; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_replayInfo_dataInvalidSqIdx_flag =
    io_ldu_s3_loadIn_0_bits_replayInfo_dataInvalidSqIdx_flag; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_replayInfo_dataInvalidSqIdx_value =
    io_ldu_s3_loadIn_0_bits_replayInfo_dataInvalidSqIdx_value; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_replayInfo_addrInvalidSqIdx_flag =
    io_ldu_s3_loadIn_0_bits_replayInfo_addrInvalidSqIdx_flag; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_replayInfo_addrInvalidSqIdx_value =
    io_ldu_s3_loadIn_0_bits_replayInfo_addrInvalidSqIdx_value; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_replayInfo_replayCarry_real_way_en =
    io_ldu_s3_loadIn_0_bits_replayInfo_replayCarry_real_way_en; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_replayInfo_replayCarry_valid =
    io_ldu_s3_loadIn_0_bits_replayInfo_replayCarry_valid; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_replayInfo_dataInLastBeat = io_ldu_s3_loadIn_0_bits_replayInfo_dataInLastBeat
    ; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_replayInfo_cause_0 = io_ldu_s3_loadIn_0_bits_replayInfo_cause_0; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_replayInfo_cause_1 = io_ldu_s3_loadIn_0_bits_replayInfo_cause_1; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_replayInfo_cause_2 = io_ldu_s3_loadIn_0_bits_replayInfo_cause_2; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_replayInfo_cause_3 = io_ldu_s3_loadIn_0_bits_replayInfo_cause_3; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_replayInfo_cause_4 = io_ldu_s3_loadIn_0_bits_replayInfo_cause_4; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_replayInfo_cause_5 = io_ldu_s3_loadIn_0_bits_replayInfo_cause_5; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_replayInfo_cause_6 = io_ldu_s3_loadIn_0_bits_replayInfo_cause_6; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_replayInfo_cause_7 = io_ldu_s3_loadIn_0_bits_replayInfo_cause_7; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_lqDataWenDup_1 = io_ldu_s3_loadIn_0_bits_lqDataWenDup_1; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_lqDataWenDup_2 = io_ldu_s3_loadIn_0_bits_lqDataWenDup_2; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_lqDataWenDup_3 = io_ldu_s3_loadIn_0_bits_lqDataWenDup_3; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_0_bits_lqDataWenDup_5 = io_ldu_s3_loadIn_0_bits_lqDataWenDup_5; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_valid = io_ldu_s3_loadIn_1_valid; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_uop_cf_foldpc = io_ldu_s3_loadIn_1_bits_uop_cf_foldpc; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_uop_cf_exceptionVec_4 = io_ldu_s3_loadIn_1_bits_uop_cf_exceptionVec_4; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_uop_cf_exceptionVec_5 = io_ldu_s3_loadIn_1_bits_uop_cf_exceptionVec_5; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_uop_cf_exceptionVec_13 = io_ldu_s3_loadIn_1_bits_uop_cf_exceptionVec_13; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_uop_cf_trigger_backendEn_1 =
    io_ldu_s3_loadIn_1_bits_uop_cf_trigger_backendEn_1; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_uop_cf_trigger_backendHit_0 =
    io_ldu_s3_loadIn_1_bits_uop_cf_trigger_backendHit_0; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_uop_cf_trigger_backendHit_1 =
    io_ldu_s3_loadIn_1_bits_uop_cf_trigger_backendHit_1; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_uop_cf_trigger_backendHit_4 =
    io_ldu_s3_loadIn_1_bits_uop_cf_trigger_backendHit_4; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_uop_cf_waitForRobIdx_flag = io_ldu_s3_loadIn_1_bits_uop_cf_waitForRobIdx_flag
    ; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_uop_cf_waitForRobIdx_value =
    io_ldu_s3_loadIn_1_bits_uop_cf_waitForRobIdx_value; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_uop_cf_loadWaitBit = io_ldu_s3_loadIn_1_bits_uop_cf_loadWaitBit; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_uop_cf_loadWaitStrict = io_ldu_s3_loadIn_1_bits_uop_cf_loadWaitStrict; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_uop_cf_ftqPtr_flag = io_ldu_s3_loadIn_1_bits_uop_cf_ftqPtr_flag; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_uop_cf_ftqPtr_value = io_ldu_s3_loadIn_1_bits_uop_cf_ftqPtr_value; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_uop_cf_ftqOffset = io_ldu_s3_loadIn_1_bits_uop_cf_ftqOffset; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_uop_ctrl_fuType = io_ldu_s3_loadIn_1_bits_uop_ctrl_fuType; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_uop_ctrl_fuOpType = io_ldu_s3_loadIn_1_bits_uop_ctrl_fuOpType; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_uop_ctrl_rfWen = io_ldu_s3_loadIn_1_bits_uop_ctrl_rfWen; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_uop_ctrl_fpWen = io_ldu_s3_loadIn_1_bits_uop_ctrl_fpWen; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_uop_ctrl_replayInst = io_ldu_s3_loadIn_1_bits_uop_ctrl_replayInst; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_uop_pdest = io_ldu_s3_loadIn_1_bits_uop_pdest; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_uop_robIdx_flag = io_ldu_s3_loadIn_1_bits_uop_robIdx_flag; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_uop_robIdx_value = io_ldu_s3_loadIn_1_bits_uop_robIdx_value; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_uop_lqIdx_flag = io_ldu_s3_loadIn_1_bits_uop_lqIdx_flag; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_uop_lqIdx_value = io_ldu_s3_loadIn_1_bits_uop_lqIdx_value; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_uop_sqIdx_flag = io_ldu_s3_loadIn_1_bits_uop_sqIdx_flag; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_uop_sqIdx_value = io_ldu_s3_loadIn_1_bits_uop_sqIdx_value; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_vaddr = io_ldu_s3_loadIn_1_bits_vaddr; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_paddr = io_ldu_s3_loadIn_1_bits_paddr; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_mask = io_ldu_s3_loadIn_1_bits_mask; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_miss = io_ldu_s3_loadIn_1_bits_miss; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_tlbMiss = io_ldu_s3_loadIn_1_bits_tlbMiss; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_mmio = io_ldu_s3_loadIn_1_bits_mmio; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_rarAllocated = io_ldu_s3_loadIn_1_bits_rarAllocated; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_rarIndex = io_ldu_s3_loadIn_1_bits_rarIndex; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_rawAllocated = io_ldu_s3_loadIn_1_bits_rawAllocated; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_rawIndex = io_ldu_s3_loadIn_1_bits_rawIndex; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_replayInfo_missMSHRId = io_ldu_s3_loadIn_1_bits_replayInfo_missMSHRId; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_replayInfo_canForwardFullData =
    io_ldu_s3_loadIn_1_bits_replayInfo_canForwardFullData; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_replayInfo_dataInvalidSqIdx_flag =
    io_ldu_s3_loadIn_1_bits_replayInfo_dataInvalidSqIdx_flag; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_replayInfo_dataInvalidSqIdx_value =
    io_ldu_s3_loadIn_1_bits_replayInfo_dataInvalidSqIdx_value; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_replayInfo_addrInvalidSqIdx_flag =
    io_ldu_s3_loadIn_1_bits_replayInfo_addrInvalidSqIdx_flag; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_replayInfo_addrInvalidSqIdx_value =
    io_ldu_s3_loadIn_1_bits_replayInfo_addrInvalidSqIdx_value; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_replayInfo_replayCarry_real_way_en =
    io_ldu_s3_loadIn_1_bits_replayInfo_replayCarry_real_way_en; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_replayInfo_replayCarry_valid =
    io_ldu_s3_loadIn_1_bits_replayInfo_replayCarry_valid; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_replayInfo_dataInLastBeat = io_ldu_s3_loadIn_1_bits_replayInfo_dataInLastBeat
    ; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_replayInfo_cause_0 = io_ldu_s3_loadIn_1_bits_replayInfo_cause_0; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_replayInfo_cause_1 = io_ldu_s3_loadIn_1_bits_replayInfo_cause_1; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_replayInfo_cause_2 = io_ldu_s3_loadIn_1_bits_replayInfo_cause_2; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_replayInfo_cause_3 = io_ldu_s3_loadIn_1_bits_replayInfo_cause_3; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_replayInfo_cause_4 = io_ldu_s3_loadIn_1_bits_replayInfo_cause_4; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_replayInfo_cause_5 = io_ldu_s3_loadIn_1_bits_replayInfo_cause_5; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_replayInfo_cause_6 = io_ldu_s3_loadIn_1_bits_replayInfo_cause_6; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_replayInfo_cause_7 = io_ldu_s3_loadIn_1_bits_replayInfo_cause_7; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_lqDataWenDup_1 = io_ldu_s3_loadIn_1_bits_lqDataWenDup_1; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_lqDataWenDup_2 = io_ldu_s3_loadIn_1_bits_lqDataWenDup_2; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_lqDataWenDup_3 = io_ldu_s3_loadIn_1_bits_lqDataWenDup_3; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_ldu_s3_loadIn_1_bits_lqDataWenDup_5 = io_ldu_s3_loadIn_1_bits_lqDataWenDup_5; // @[LSQWrapper.scala 167:20]
  assign loadQueue_io_sta_s1_storeAddrIn_0_valid = io_sta_s1_storeAddrIn_0_valid; // @[LSQWrapper.scala 182:35]
  assign loadQueue_io_sta_s1_storeAddrIn_0_bits_uop_cf_ftqPtr_value = io_sta_s1_storeAddrIn_0_bits_uop_cf_ftqPtr_value; // @[LSQWrapper.scala 182:35]
  assign loadQueue_io_sta_s1_storeAddrIn_0_bits_uop_cf_ftqOffset = io_sta_s1_storeAddrIn_0_bits_uop_cf_ftqOffset; // @[LSQWrapper.scala 182:35]
  assign loadQueue_io_sta_s1_storeAddrIn_0_bits_uop_robIdx_flag = io_sta_s1_storeAddrIn_0_bits_uop_robIdx_flag; // @[LSQWrapper.scala 182:35]
  assign loadQueue_io_sta_s1_storeAddrIn_0_bits_uop_robIdx_value = io_sta_s1_storeAddrIn_0_bits_uop_robIdx_value; // @[LSQWrapper.scala 182:35]
  assign loadQueue_io_sta_s1_storeAddrIn_0_bits_uop_sqIdx_flag = io_sta_s1_storeAddrIn_0_bits_uop_sqIdx_flag; // @[LSQWrapper.scala 182:35]
  assign loadQueue_io_sta_s1_storeAddrIn_0_bits_uop_sqIdx_value = io_sta_s1_storeAddrIn_0_bits_uop_sqIdx_value; // @[LSQWrapper.scala 182:35]
  assign loadQueue_io_sta_s1_storeAddrIn_0_bits_paddr = io_sta_s1_storeAddrIn_0_bits_paddr; // @[LSQWrapper.scala 182:35]
  assign loadQueue_io_sta_s1_storeAddrIn_0_bits_mask = io_sta_s1_storeAddrIn_0_bits_mask; // @[LSQWrapper.scala 182:35]
  assign loadQueue_io_sta_s1_storeAddrIn_0_bits_miss = io_sta_s1_storeAddrIn_0_bits_miss; // @[LSQWrapper.scala 182:35]
  assign loadQueue_io_sta_s1_storeAddrIn_1_valid = io_sta_s1_storeAddrIn_1_valid; // @[LSQWrapper.scala 182:35]
  assign loadQueue_io_sta_s1_storeAddrIn_1_bits_uop_cf_ftqPtr_value = io_sta_s1_storeAddrIn_1_bits_uop_cf_ftqPtr_value; // @[LSQWrapper.scala 182:35]
  assign loadQueue_io_sta_s1_storeAddrIn_1_bits_uop_cf_ftqOffset = io_sta_s1_storeAddrIn_1_bits_uop_cf_ftqOffset; // @[LSQWrapper.scala 182:35]
  assign loadQueue_io_sta_s1_storeAddrIn_1_bits_uop_robIdx_flag = io_sta_s1_storeAddrIn_1_bits_uop_robIdx_flag; // @[LSQWrapper.scala 182:35]
  assign loadQueue_io_sta_s1_storeAddrIn_1_bits_uop_robIdx_value = io_sta_s1_storeAddrIn_1_bits_uop_robIdx_value; // @[LSQWrapper.scala 182:35]
  assign loadQueue_io_sta_s1_storeAddrIn_1_bits_uop_sqIdx_flag = io_sta_s1_storeAddrIn_1_bits_uop_sqIdx_flag; // @[LSQWrapper.scala 182:35]
  assign loadQueue_io_sta_s1_storeAddrIn_1_bits_uop_sqIdx_value = io_sta_s1_storeAddrIn_1_bits_uop_sqIdx_value; // @[LSQWrapper.scala 182:35]
  assign loadQueue_io_sta_s1_storeAddrIn_1_bits_paddr = io_sta_s1_storeAddrIn_1_bits_paddr; // @[LSQWrapper.scala 182:35]
  assign loadQueue_io_sta_s1_storeAddrIn_1_bits_mask = io_sta_s1_storeAddrIn_1_bits_mask; // @[LSQWrapper.scala 182:35]
  assign loadQueue_io_sta_s1_storeAddrIn_1_bits_miss = io_sta_s1_storeAddrIn_1_bits_miss; // @[LSQWrapper.scala 182:35]
  assign loadQueue_io_std_s0_storeDataIn_0_valid = io_std_s0_storeDataIn_0_valid; // @[LSQWrapper.scala 183:35]
  assign loadQueue_io_std_s0_storeDataIn_0_bits_uop_sqIdx_flag = io_std_s0_storeDataIn_0_bits_uop_sqIdx_flag; // @[LSQWrapper.scala 183:35]
  assign loadQueue_io_std_s0_storeDataIn_0_bits_uop_sqIdx_value = io_std_s0_storeDataIn_0_bits_uop_sqIdx_value; // @[LSQWrapper.scala 183:35]
  assign loadQueue_io_std_s0_storeDataIn_1_valid = io_std_s0_storeDataIn_1_valid; // @[LSQWrapper.scala 183:35]
  assign loadQueue_io_std_s0_storeDataIn_1_bits_uop_sqIdx_flag = io_std_s0_storeDataIn_1_bits_uop_sqIdx_flag; // @[LSQWrapper.scala 183:35]
  assign loadQueue_io_std_s0_storeDataIn_1_bits_uop_sqIdx_value = io_std_s0_storeDataIn_1_bits_uop_sqIdx_value; // @[LSQWrapper.scala 183:35]
  assign loadQueue_io_sq_stAddrReadySqPtr_flag = storeQueue_io_stAddrReadySqPtr_flag; // @[LSQWrapper.scala 179:36]
  assign loadQueue_io_sq_stAddrReadySqPtr_value = storeQueue_io_stAddrReadySqPtr_value; // @[LSQWrapper.scala 179:36]
  assign loadQueue_io_sq_stDataReadySqPtr_flag = storeQueue_io_stDataReadySqPtr_flag; // @[LSQWrapper.scala 180:36]
  assign loadQueue_io_sq_stDataReadySqPtr_value = storeQueue_io_stDataReadySqPtr_value; // @[LSQWrapper.scala 180:36]
  assign loadQueue_io_sq_sqEmpty = storeQueue_io_sqEmpty; // @[LSQWrapper.scala 181:27]
  assign loadQueue_io_loadOut_0_ready = io_loadOut_0_ready; // @[LSQWrapper.scala 168:24]
  assign loadQueue_io_replay_0_ready = io_replay_0_ready; // @[LSQWrapper.scala 173:23]
  assign loadQueue_io_replay_1_ready = io_replay_1_ready; // @[LSQWrapper.scala 173:23]
  assign loadQueue_io_refill_valid = io_refill_valid; // @[LSQWrapper.scala 174:23]
  assign loadQueue_io_refill_bits_id = io_refill_bits_id; // @[LSQWrapper.scala 174:23]
  assign loadQueue_io_release_valid = io_release_valid; // @[LSQWrapper.scala 175:24]
  assign loadQueue_io_release_bits_paddr = io_release_bits_paddr; // @[LSQWrapper.scala 175:24]
  assign loadQueue_io_rob_pendingld = io_rob_pendingld; // @[LSQWrapper.scala 170:20]
  assign loadQueue_io_rob_commit = io_rob_commit; // @[LSQWrapper.scala 170:20]
  assign loadQueue_io_uncache_req_ready = io_uncache_req_ready; // @[LSQWrapper.scala 223:39 224:20]
  assign loadQueue_io_uncache_resp_valid = io_uncacheOutstanding ? io_uncache_resp_valid : _GEN_19; // @[LSQWrapper.scala 228:32 229:21]
  assign loadQueue_io_uncache_resp_bits_data = io_uncache_resp_bits_data; // @[LSQWrapper.scala 228:32 229:21]
  assign loadQueue_io_trigger_0_hitLoadAddrTriggerHitVec_0 = io_trigger_0_hitLoadAddrTriggerHitVec_0; // @[LSQWrapper.scala 176:24]
  assign loadQueue_io_trigger_0_hitLoadAddrTriggerHitVec_1 = io_trigger_0_hitLoadAddrTriggerHitVec_1; // @[LSQWrapper.scala 176:24]
  assign loadQueue_io_trigger_0_hitLoadAddrTriggerHitVec_2 = io_trigger_0_hitLoadAddrTriggerHitVec_2; // @[LSQWrapper.scala 176:24]
  assign loadQueue_io_trigger_1_hitLoadAddrTriggerHitVec_0 = io_trigger_1_hitLoadAddrTriggerHitVec_0; // @[LSQWrapper.scala 176:24]
  assign loadQueue_io_trigger_1_hitLoadAddrTriggerHitVec_1 = io_trigger_1_hitLoadAddrTriggerHitVec_1; // @[LSQWrapper.scala 176:24]
  assign loadQueue_io_trigger_1_hitLoadAddrTriggerHitVec_2 = io_trigger_1_hitLoadAddrTriggerHitVec_2; // @[LSQWrapper.scala 176:24]
  assign loadQueue_io_tlbReplayDelayCycleCtrl_0 = 6'hb; // @[LSQWrapper.scala 121:{49,49}]
  assign loadQueue_io_tlbReplayDelayCycleCtrl_1 = 6'h32; // @[LSQWrapper.scala 121:{49,49}]
  assign loadQueue_io_tlbReplayDelayCycleCtrl_2 = 6'h1e; // @[LSQWrapper.scala 121:{49,49}]
  assign loadQueue_io_tlbReplayDelayCycleCtrl_3 = 6'ha; // @[LSQWrapper.scala 121:{49,49}]
  assign storeQueue_clock = clock;
  assign storeQueue_reset = reset;
  assign storeQueue_io_enq_lqCanAccept = loadQueue_io_enq_canAccept; // @[LSQWrapper.scala 129:33]
  assign storeQueue_io_enq_req_0_valid = io_enq_needAlloc_0[1] & io_enq_req_0_valid; // @[LSQWrapper.scala 137:67]
  assign storeQueue_io_enq_req_0_bits_cf_trigger_backendEn_0 = io_enq_req_0_bits_cf_trigger_backendEn_0; // @[LSQWrapper.scala 139:41]
  assign storeQueue_io_enq_req_0_bits_ctrl_fuOpType = io_enq_req_0_bits_ctrl_fuOpType; // @[LSQWrapper.scala 139:41]
  assign storeQueue_io_enq_req_0_bits_robIdx_flag = io_enq_req_0_bits_robIdx_flag; // @[LSQWrapper.scala 139:41]
  assign storeQueue_io_enq_req_0_bits_robIdx_value = io_enq_req_0_bits_robIdx_value; // @[LSQWrapper.scala 139:41]
  assign storeQueue_io_enq_req_0_bits_sqIdx_value = io_enq_req_0_bits_sqIdx_value; // @[LSQWrapper.scala 139:41]
  assign storeQueue_io_enq_req_1_valid = io_enq_needAlloc_1[1] & io_enq_req_1_valid; // @[LSQWrapper.scala 137:67]
  assign storeQueue_io_enq_req_1_bits_cf_trigger_backendEn_0 = io_enq_req_1_bits_cf_trigger_backendEn_0; // @[LSQWrapper.scala 139:41]
  assign storeQueue_io_enq_req_1_bits_ctrl_fuOpType = io_enq_req_1_bits_ctrl_fuOpType; // @[LSQWrapper.scala 139:41]
  assign storeQueue_io_enq_req_1_bits_robIdx_flag = io_enq_req_1_bits_robIdx_flag; // @[LSQWrapper.scala 139:41]
  assign storeQueue_io_enq_req_1_bits_robIdx_value = io_enq_req_1_bits_robIdx_value; // @[LSQWrapper.scala 139:41]
  assign storeQueue_io_enq_req_1_bits_sqIdx_value = io_enq_req_1_bits_sqIdx_value; // @[LSQWrapper.scala 139:41]
  assign storeQueue_io_enq_req_2_valid = io_enq_needAlloc_2[1] & io_enq_req_2_valid; // @[LSQWrapper.scala 137:67]
  assign storeQueue_io_enq_req_2_bits_cf_trigger_backendEn_0 = io_enq_req_2_bits_cf_trigger_backendEn_0; // @[LSQWrapper.scala 139:41]
  assign storeQueue_io_enq_req_2_bits_ctrl_fuOpType = io_enq_req_2_bits_ctrl_fuOpType; // @[LSQWrapper.scala 139:41]
  assign storeQueue_io_enq_req_2_bits_robIdx_flag = io_enq_req_2_bits_robIdx_flag; // @[LSQWrapper.scala 139:41]
  assign storeQueue_io_enq_req_2_bits_robIdx_value = io_enq_req_2_bits_robIdx_value; // @[LSQWrapper.scala 139:41]
  assign storeQueue_io_enq_req_2_bits_sqIdx_value = io_enq_req_2_bits_sqIdx_value; // @[LSQWrapper.scala 139:41]
  assign storeQueue_io_enq_req_3_valid = io_enq_needAlloc_3[1] & io_enq_req_3_valid; // @[LSQWrapper.scala 137:67]
  assign storeQueue_io_enq_req_3_bits_cf_trigger_backendEn_0 = io_enq_req_3_bits_cf_trigger_backendEn_0; // @[LSQWrapper.scala 139:41]
  assign storeQueue_io_enq_req_3_bits_ctrl_fuOpType = io_enq_req_3_bits_ctrl_fuOpType; // @[LSQWrapper.scala 139:41]
  assign storeQueue_io_enq_req_3_bits_robIdx_flag = io_enq_req_3_bits_robIdx_flag; // @[LSQWrapper.scala 139:41]
  assign storeQueue_io_enq_req_3_bits_robIdx_value = io_enq_req_3_bits_robIdx_value; // @[LSQWrapper.scala 139:41]
  assign storeQueue_io_enq_req_3_bits_sqIdx_value = io_enq_req_3_bits_sqIdx_value; // @[LSQWrapper.scala 139:41]
  assign storeQueue_io_brqRedirect_valid = io_brqRedirect_valid; // @[LSQWrapper.scala 147:29]
  assign storeQueue_io_brqRedirect_bits_robIdx_flag = io_brqRedirect_bits_robIdx_flag; // @[LSQWrapper.scala 147:29]
  assign storeQueue_io_brqRedirect_bits_robIdx_value = io_brqRedirect_bits_robIdx_value; // @[LSQWrapper.scala 147:29]
  assign storeQueue_io_brqRedirect_bits_level = io_brqRedirect_bits_level; // @[LSQWrapper.scala 147:29]
  assign storeQueue_io_storeAddrIn_0_valid = io_sta_s1_storeAddrIn_0_valid; // @[LSQWrapper.scala 148:29]
  assign storeQueue_io_storeAddrIn_0_bits_uop_ctrl_fuOpType = io_sta_s1_storeAddrIn_0_bits_uop_ctrl_fuOpType; // @[LSQWrapper.scala 148:29]
  assign storeQueue_io_storeAddrIn_0_bits_uop_sqIdx_value = io_sta_s1_storeAddrIn_0_bits_uop_sqIdx_value; // @[LSQWrapper.scala 148:29]
  assign storeQueue_io_storeAddrIn_0_bits_vaddr = io_sta_s1_storeAddrIn_0_bits_vaddr; // @[LSQWrapper.scala 148:29]
  assign storeQueue_io_storeAddrIn_0_bits_paddr = io_sta_s1_storeAddrIn_0_bits_paddr; // @[LSQWrapper.scala 148:29]
  assign storeQueue_io_storeAddrIn_0_bits_wlineflag = io_sta_s1_storeAddrIn_0_bits_wlineflag; // @[LSQWrapper.scala 148:29]
  assign storeQueue_io_storeAddrIn_0_bits_miss = io_sta_s1_storeAddrIn_0_bits_miss; // @[LSQWrapper.scala 148:29]
  assign storeQueue_io_storeAddrIn_1_valid = io_sta_s1_storeAddrIn_1_valid; // @[LSQWrapper.scala 148:29]
  assign storeQueue_io_storeAddrIn_1_bits_uop_ctrl_fuOpType = io_sta_s1_storeAddrIn_1_bits_uop_ctrl_fuOpType; // @[LSQWrapper.scala 148:29]
  assign storeQueue_io_storeAddrIn_1_bits_uop_sqIdx_value = io_sta_s1_storeAddrIn_1_bits_uop_sqIdx_value; // @[LSQWrapper.scala 148:29]
  assign storeQueue_io_storeAddrIn_1_bits_vaddr = io_sta_s1_storeAddrIn_1_bits_vaddr; // @[LSQWrapper.scala 148:29]
  assign storeQueue_io_storeAddrIn_1_bits_paddr = io_sta_s1_storeAddrIn_1_bits_paddr; // @[LSQWrapper.scala 148:29]
  assign storeQueue_io_storeAddrIn_1_bits_wlineflag = io_sta_s1_storeAddrIn_1_bits_wlineflag; // @[LSQWrapper.scala 148:29]
  assign storeQueue_io_storeAddrIn_1_bits_miss = io_sta_s1_storeAddrIn_1_bits_miss; // @[LSQWrapper.scala 148:29]
  assign storeQueue_io_storeAddrInRe_0_mmio = io_sta_s2_storeAddrInRe_0_mmio; // @[LSQWrapper.scala 149:31]
  assign storeQueue_io_storeAddrInRe_0_atomic = io_sta_s2_storeAddrInRe_0_atomic; // @[LSQWrapper.scala 149:31]
  assign storeQueue_io_storeAddrInRe_1_mmio = io_sta_s2_storeAddrInRe_1_mmio; // @[LSQWrapper.scala 149:31]
  assign storeQueue_io_storeAddrInRe_1_atomic = io_sta_s2_storeAddrInRe_1_atomic; // @[LSQWrapper.scala 149:31]
  assign storeQueue_io_storeDataIn_0_valid = io_std_s0_storeDataIn_0_valid; // @[LSQWrapper.scala 150:29]
  assign storeQueue_io_storeDataIn_0_bits_uop_ctrl_fuOpType = io_std_s0_storeDataIn_0_bits_uop_ctrl_fuOpType; // @[LSQWrapper.scala 150:29]
  assign storeQueue_io_storeDataIn_0_bits_uop_sqIdx_value = io_std_s0_storeDataIn_0_bits_uop_sqIdx_value; // @[LSQWrapper.scala 150:29]
  assign storeQueue_io_storeDataIn_0_bits_data = io_std_s0_storeDataIn_0_bits_data; // @[LSQWrapper.scala 150:29]
  assign storeQueue_io_storeDataIn_1_valid = io_std_s0_storeDataIn_1_valid; // @[LSQWrapper.scala 150:29]
  assign storeQueue_io_storeDataIn_1_bits_uop_ctrl_fuOpType = io_std_s0_storeDataIn_1_bits_uop_ctrl_fuOpType; // @[LSQWrapper.scala 150:29]
  assign storeQueue_io_storeDataIn_1_bits_uop_sqIdx_value = io_std_s0_storeDataIn_1_bits_uop_sqIdx_value; // @[LSQWrapper.scala 150:29]
  assign storeQueue_io_storeDataIn_1_bits_data = io_std_s0_storeDataIn_1_bits_data; // @[LSQWrapper.scala 150:29]
  assign storeQueue_io_storeMaskIn_0_valid = io_sta_s0_storeMaskIn_0_valid; // @[LSQWrapper.scala 151:29]
  assign storeQueue_io_storeMaskIn_0_bits_sqIdx_value = io_sta_s0_storeMaskIn_0_bits_sqIdx_value; // @[LSQWrapper.scala 151:29]
  assign storeQueue_io_storeMaskIn_0_bits_mask = io_sta_s0_storeMaskIn_0_bits_mask; // @[LSQWrapper.scala 151:29]
  assign storeQueue_io_storeMaskIn_1_valid = io_sta_s0_storeMaskIn_1_valid; // @[LSQWrapper.scala 151:29]
  assign storeQueue_io_storeMaskIn_1_bits_sqIdx_value = io_sta_s0_storeMaskIn_1_bits_sqIdx_value; // @[LSQWrapper.scala 151:29]
  assign storeQueue_io_storeMaskIn_1_bits_mask = io_sta_s0_storeMaskIn_1_bits_mask; // @[LSQWrapper.scala 151:29]
  assign storeQueue_io_sbuffer_0_ready = io_sbuffer_0_ready; // @[LSQWrapper.scala 152:25]
  assign storeQueue_io_sbuffer_1_ready = io_sbuffer_1_ready; // @[LSQWrapper.scala 152:25]
  assign storeQueue_io_uncacheOutstanding = io_uncacheOutstanding; // @[LSQWrapper.scala 117:36]
  assign storeQueue_io_mmioStout_ready = io_mmioStout_ready; // @[LSQWrapper.scala 153:27]
  assign storeQueue_io_forward_0_vaddr = io_forward_0_vaddr; // @[LSQWrapper.scala 160:25]
  assign storeQueue_io_forward_0_paddr = io_forward_0_paddr; // @[LSQWrapper.scala 160:25]
  assign storeQueue_io_forward_0_uop_cf_waitForRobIdx_flag = io_forward_0_uop_cf_waitForRobIdx_flag; // @[LSQWrapper.scala 160:25]
  assign storeQueue_io_forward_0_uop_cf_waitForRobIdx_value = io_forward_0_uop_cf_waitForRobIdx_value; // @[LSQWrapper.scala 160:25]
  assign storeQueue_io_forward_0_uop_sqIdx_flag = io_forward_0_uop_sqIdx_flag; // @[LSQWrapper.scala 160:25]
  assign storeQueue_io_forward_0_uop_sqIdx_value = io_forward_0_uop_sqIdx_value; // @[LSQWrapper.scala 160:25]
  assign storeQueue_io_forward_0_valid = io_forward_0_valid; // @[LSQWrapper.scala 160:25]
  assign storeQueue_io_forward_0_sqIdx_flag = io_forward_0_sqIdx_flag; // @[LSQWrapper.scala 160:25]
  assign storeQueue_io_forward_0_sqIdxMask = io_forward_0_sqIdxMask; // @[LSQWrapper.scala 160:25]
  assign storeQueue_io_forward_1_vaddr = io_forward_1_vaddr; // @[LSQWrapper.scala 160:25]
  assign storeQueue_io_forward_1_paddr = io_forward_1_paddr; // @[LSQWrapper.scala 160:25]
  assign storeQueue_io_forward_1_uop_cf_waitForRobIdx_flag = io_forward_1_uop_cf_waitForRobIdx_flag; // @[LSQWrapper.scala 160:25]
  assign storeQueue_io_forward_1_uop_cf_waitForRobIdx_value = io_forward_1_uop_cf_waitForRobIdx_value; // @[LSQWrapper.scala 160:25]
  assign storeQueue_io_forward_1_uop_sqIdx_flag = io_forward_1_uop_sqIdx_flag; // @[LSQWrapper.scala 160:25]
  assign storeQueue_io_forward_1_uop_sqIdx_value = io_forward_1_uop_sqIdx_value; // @[LSQWrapper.scala 160:25]
  assign storeQueue_io_forward_1_valid = io_forward_1_valid; // @[LSQWrapper.scala 160:25]
  assign storeQueue_io_forward_1_sqIdx_flag = io_forward_1_sqIdx_flag; // @[LSQWrapper.scala 160:25]
  assign storeQueue_io_forward_1_sqIdxMask = io_forward_1_sqIdxMask; // @[LSQWrapper.scala 160:25]
  assign storeQueue_io_rob_scommit = io_rob_scommit; // @[LSQWrapper.scala 154:21]
  assign storeQueue_io_rob_pendingst = io_rob_pendingst; // @[LSQWrapper.scala 154:21]
  assign storeQueue_io_uncache_req_ready = io_uncache_req_ready; // @[LSQWrapper.scala 223:39 226:20]
  assign storeQueue_io_uncache_resp_valid = io_uncacheOutstanding ? 1'h0 : _GEN_30; // @[LSQWrapper.scala 228:32 222:36]
  always @(posedge clock) begin
    io_exceptionAddr_vaddr_REG <= io_exceptionAddr_isStore; // @[LSQWrapper.scala 194:40]
    io_perf_0_value_REG <= loadQueue_io_perf_0_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_0_value_REG_1 <= io_perf_0_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_1_value_REG <= loadQueue_io_perf_1_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_1_value_REG_1 <= io_perf_1_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_2_value_REG <= loadQueue_io_perf_2_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_2_value_REG_1 <= io_perf_2_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_3_value_REG <= loadQueue_io_perf_3_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_3_value_REG_1 <= io_perf_3_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_4_value_REG <= loadQueue_io_perf_4_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_4_value_REG_1 <= io_perf_4_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_5_value_REG <= loadQueue_io_perf_5_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_5_value_REG_1 <= io_perf_5_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_6_value_REG <= loadQueue_io_perf_6_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_6_value_REG_1 <= io_perf_6_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_7_value_REG <= loadQueue_io_perf_7_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_7_value_REG_1 <= io_perf_7_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_8_value_REG <= loadQueue_io_perf_8_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_8_value_REG_1 <= io_perf_8_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_9_value_REG <= loadQueue_io_perf_9_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_9_value_REG_1 <= io_perf_9_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_10_value_REG <= loadQueue_io_perf_10_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_10_value_REG_1 <= io_perf_10_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_11_value_REG <= loadQueue_io_perf_11_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_11_value_REG_1 <= io_perf_11_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_12_value_REG <= loadQueue_io_perf_12_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_12_value_REG_1 <= io_perf_12_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_13_value_REG <= loadQueue_io_perf_13_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_13_value_REG_1 <= io_perf_13_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_14_value_REG <= loadQueue_io_perf_14_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_14_value_REG_1 <= io_perf_14_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_15_value_REG <= loadQueue_io_perf_15_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_15_value_REG_1 <= io_perf_15_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_16_value_REG <= loadQueue_io_perf_16_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_16_value_REG_1 <= io_perf_16_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_17_value_REG <= loadQueue_io_perf_17_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_17_value_REG_1 <= io_perf_17_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_18_value_REG <= loadQueue_io_perf_18_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_18_value_REG_1 <= io_perf_18_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_19_value_REG <= loadQueue_io_perf_19_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_19_value_REG_1 <= io_perf_19_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_20_value_REG <= loadQueue_io_perf_20_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_20_value_REG_1 <= io_perf_20_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_21_value_REG <= loadQueue_io_perf_21_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_21_value_REG_1 <= io_perf_21_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_22_value_REG <= storeQueue_io_perf_0_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_22_value_REG_1 <= io_perf_22_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_23_value_REG <= storeQueue_io_perf_1_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_23_value_REG_1 <= io_perf_23_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_24_value_REG <= storeQueue_io_perf_2_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_24_value_REG_1 <= io_perf_24_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_25_value_REG <= storeQueue_io_perf_3_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_25_value_REG_1 <= io_perf_25_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_26_value_REG <= storeQueue_io_perf_4_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_26_value_REG_1 <= io_perf_26_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_27_value_REG <= storeQueue_io_perf_5_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_27_value_REG_1 <= io_perf_27_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_28_value_REG <= storeQueue_io_perf_6_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_28_value_REG_1 <= io_perf_28_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_29_value_REG <= storeQueue_io_perf_7_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_29_value_REG_1 <= io_perf_29_value_REG; // @[PerfCounterUtils.scala 188:27]
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[LSQWrapper.scala 200:23]
      pendingstate <= 2'h0; // @[LSQWrapper.scala 202:60 203:28 198:29 204:30]
    end else if (2'h0 == pendingstate) begin // @[LSQWrapper.scala 200:23]
      if (_T_1 & ~io_uncacheOutstanding) begin
        if (loadQueue_io_uncache_req_valid) begin
          pendingstate <= 2'h1;
        end else if (io_uncacheOutstanding) begin
          pendingstate <= 2'h0;
        end else begin
          pendingstate <= 2'h2;
        end
      end
    end else if (2'h1 == pendingstate) begin // @[LSQWrapper.scala 200:23]
      pendingstate <= _GEN_1;
    end else if (2'h2 == pendingstate) begin // @[LSQWrapper.scala 198:29]
      pendingstate <= _GEN_1;
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
  io_exceptionAddr_vaddr_REG = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  pendingstate = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  io_perf_0_value_REG = _RAND_2[5:0];
  _RAND_3 = {1{`RANDOM}};
  io_perf_0_value_REG_1 = _RAND_3[5:0];
  _RAND_4 = {1{`RANDOM}};
  io_perf_1_value_REG = _RAND_4[5:0];
  _RAND_5 = {1{`RANDOM}};
  io_perf_1_value_REG_1 = _RAND_5[5:0];
  _RAND_6 = {1{`RANDOM}};
  io_perf_2_value_REG = _RAND_6[5:0];
  _RAND_7 = {1{`RANDOM}};
  io_perf_2_value_REG_1 = _RAND_7[5:0];
  _RAND_8 = {1{`RANDOM}};
  io_perf_3_value_REG = _RAND_8[5:0];
  _RAND_9 = {1{`RANDOM}};
  io_perf_3_value_REG_1 = _RAND_9[5:0];
  _RAND_10 = {1{`RANDOM}};
  io_perf_4_value_REG = _RAND_10[5:0];
  _RAND_11 = {1{`RANDOM}};
  io_perf_4_value_REG_1 = _RAND_11[5:0];
  _RAND_12 = {1{`RANDOM}};
  io_perf_5_value_REG = _RAND_12[5:0];
  _RAND_13 = {1{`RANDOM}};
  io_perf_5_value_REG_1 = _RAND_13[5:0];
  _RAND_14 = {1{`RANDOM}};
  io_perf_6_value_REG = _RAND_14[5:0];
  _RAND_15 = {1{`RANDOM}};
  io_perf_6_value_REG_1 = _RAND_15[5:0];
  _RAND_16 = {1{`RANDOM}};
  io_perf_7_value_REG = _RAND_16[5:0];
  _RAND_17 = {1{`RANDOM}};
  io_perf_7_value_REG_1 = _RAND_17[5:0];
  _RAND_18 = {1{`RANDOM}};
  io_perf_8_value_REG = _RAND_18[5:0];
  _RAND_19 = {1{`RANDOM}};
  io_perf_8_value_REG_1 = _RAND_19[5:0];
  _RAND_20 = {1{`RANDOM}};
  io_perf_9_value_REG = _RAND_20[5:0];
  _RAND_21 = {1{`RANDOM}};
  io_perf_9_value_REG_1 = _RAND_21[5:0];
  _RAND_22 = {1{`RANDOM}};
  io_perf_10_value_REG = _RAND_22[5:0];
  _RAND_23 = {1{`RANDOM}};
  io_perf_10_value_REG_1 = _RAND_23[5:0];
  _RAND_24 = {1{`RANDOM}};
  io_perf_11_value_REG = _RAND_24[5:0];
  _RAND_25 = {1{`RANDOM}};
  io_perf_11_value_REG_1 = _RAND_25[5:0];
  _RAND_26 = {1{`RANDOM}};
  io_perf_12_value_REG = _RAND_26[5:0];
  _RAND_27 = {1{`RANDOM}};
  io_perf_12_value_REG_1 = _RAND_27[5:0];
  _RAND_28 = {1{`RANDOM}};
  io_perf_13_value_REG = _RAND_28[5:0];
  _RAND_29 = {1{`RANDOM}};
  io_perf_13_value_REG_1 = _RAND_29[5:0];
  _RAND_30 = {1{`RANDOM}};
  io_perf_14_value_REG = _RAND_30[5:0];
  _RAND_31 = {1{`RANDOM}};
  io_perf_14_value_REG_1 = _RAND_31[5:0];
  _RAND_32 = {1{`RANDOM}};
  io_perf_15_value_REG = _RAND_32[5:0];
  _RAND_33 = {1{`RANDOM}};
  io_perf_15_value_REG_1 = _RAND_33[5:0];
  _RAND_34 = {1{`RANDOM}};
  io_perf_16_value_REG = _RAND_34[5:0];
  _RAND_35 = {1{`RANDOM}};
  io_perf_16_value_REG_1 = _RAND_35[5:0];
  _RAND_36 = {1{`RANDOM}};
  io_perf_17_value_REG = _RAND_36[5:0];
  _RAND_37 = {1{`RANDOM}};
  io_perf_17_value_REG_1 = _RAND_37[5:0];
  _RAND_38 = {1{`RANDOM}};
  io_perf_18_value_REG = _RAND_38[5:0];
  _RAND_39 = {1{`RANDOM}};
  io_perf_18_value_REG_1 = _RAND_39[5:0];
  _RAND_40 = {1{`RANDOM}};
  io_perf_19_value_REG = _RAND_40[5:0];
  _RAND_41 = {1{`RANDOM}};
  io_perf_19_value_REG_1 = _RAND_41[5:0];
  _RAND_42 = {1{`RANDOM}};
  io_perf_20_value_REG = _RAND_42[5:0];
  _RAND_43 = {1{`RANDOM}};
  io_perf_20_value_REG_1 = _RAND_43[5:0];
  _RAND_44 = {1{`RANDOM}};
  io_perf_21_value_REG = _RAND_44[5:0];
  _RAND_45 = {1{`RANDOM}};
  io_perf_21_value_REG_1 = _RAND_45[5:0];
  _RAND_46 = {1{`RANDOM}};
  io_perf_22_value_REG = _RAND_46[5:0];
  _RAND_47 = {1{`RANDOM}};
  io_perf_22_value_REG_1 = _RAND_47[5:0];
  _RAND_48 = {1{`RANDOM}};
  io_perf_23_value_REG = _RAND_48[5:0];
  _RAND_49 = {1{`RANDOM}};
  io_perf_23_value_REG_1 = _RAND_49[5:0];
  _RAND_50 = {1{`RANDOM}};
  io_perf_24_value_REG = _RAND_50[5:0];
  _RAND_51 = {1{`RANDOM}};
  io_perf_24_value_REG_1 = _RAND_51[5:0];
  _RAND_52 = {1{`RANDOM}};
  io_perf_25_value_REG = _RAND_52[5:0];
  _RAND_53 = {1{`RANDOM}};
  io_perf_25_value_REG_1 = _RAND_53[5:0];
  _RAND_54 = {1{`RANDOM}};
  io_perf_26_value_REG = _RAND_54[5:0];
  _RAND_55 = {1{`RANDOM}};
  io_perf_26_value_REG_1 = _RAND_55[5:0];
  _RAND_56 = {1{`RANDOM}};
  io_perf_27_value_REG = _RAND_56[5:0];
  _RAND_57 = {1{`RANDOM}};
  io_perf_27_value_REG_1 = _RAND_57[5:0];
  _RAND_58 = {1{`RANDOM}};
  io_perf_28_value_REG = _RAND_58[5:0];
  _RAND_59 = {1{`RANDOM}};
  io_perf_28_value_REG_1 = _RAND_59[5:0];
  _RAND_60 = {1{`RANDOM}};
  io_perf_29_value_REG = _RAND_60[5:0];
  _RAND_61 = {1{`RANDOM}};
  io_perf_29_value_REG_1 = _RAND_61[5:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    pendingstate = 2'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

