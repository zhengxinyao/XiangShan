module LoadQueue(
  input         clock,
  input         reset,
  input         io_redirect_valid,
  input         io_redirect_bits_robIdx_flag,
  input  [4:0]  io_redirect_bits_robIdx_value,
  input         io_redirect_bits_level,
  output        io_enq_canAccept,
  input         io_enq_sqCanAccept,
  input         io_enq_req_0_valid,
  input         io_enq_req_0_bits_cf_trigger_backendEn_1,
  input  [6:0]  io_enq_req_0_bits_ctrl_fuOpType,
  input         io_enq_req_0_bits_ctrl_rfWen,
  input         io_enq_req_0_bits_ctrl_fpWen,
  input         io_enq_req_0_bits_ctrl_flushPipe,
  input         io_enq_req_0_bits_ctrl_replayInst,
  input  [5:0]  io_enq_req_0_bits_pdest,
  input         io_enq_req_0_bits_robIdx_flag,
  input  [4:0]  io_enq_req_0_bits_robIdx_value,
  input  [3:0]  io_enq_req_0_bits_lqIdx_value,
  input         io_enq_req_1_valid,
  input         io_enq_req_1_bits_cf_trigger_backendEn_1,
  input  [6:0]  io_enq_req_1_bits_ctrl_fuOpType,
  input         io_enq_req_1_bits_ctrl_rfWen,
  input         io_enq_req_1_bits_ctrl_fpWen,
  input         io_enq_req_1_bits_ctrl_flushPipe,
  input         io_enq_req_1_bits_ctrl_replayInst,
  input  [5:0]  io_enq_req_1_bits_pdest,
  input         io_enq_req_1_bits_robIdx_flag,
  input  [4:0]  io_enq_req_1_bits_robIdx_value,
  input  [3:0]  io_enq_req_1_bits_lqIdx_value,
  input         io_enq_req_2_valid,
  input         io_enq_req_2_bits_cf_trigger_backendEn_1,
  input  [6:0]  io_enq_req_2_bits_ctrl_fuOpType,
  input         io_enq_req_2_bits_ctrl_rfWen,
  input         io_enq_req_2_bits_ctrl_fpWen,
  input         io_enq_req_2_bits_ctrl_flushPipe,
  input         io_enq_req_2_bits_ctrl_replayInst,
  input  [5:0]  io_enq_req_2_bits_pdest,
  input         io_enq_req_2_bits_robIdx_flag,
  input  [4:0]  io_enq_req_2_bits_robIdx_value,
  input  [3:0]  io_enq_req_2_bits_lqIdx_value,
  input         io_enq_req_3_valid,
  input         io_enq_req_3_bits_cf_trigger_backendEn_1,
  input  [6:0]  io_enq_req_3_bits_ctrl_fuOpType,
  input         io_enq_req_3_bits_ctrl_rfWen,
  input         io_enq_req_3_bits_ctrl_fpWen,
  input         io_enq_req_3_bits_ctrl_flushPipe,
  input         io_enq_req_3_bits_ctrl_replayInst,
  input  [5:0]  io_enq_req_3_bits_pdest,
  input         io_enq_req_3_bits_robIdx_flag,
  input  [4:0]  io_enq_req_3_bits_robIdx_value,
  input  [3:0]  io_enq_req_3_bits_lqIdx_value,
  input         io_ldu_s2_storeLoadViolationQuery_0_req_valid,
  input  [9:0]  io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_cf_foldpc,
  input         io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_cf_ftqPtr_flag,
  input  [2:0]  io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_cf_ftqPtr_value,
  input  [2:0]  io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_cf_ftqOffset,
  input         io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_robIdx_flag,
  input  [4:0]  io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_robIdx_value,
  input         io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_sqIdx_flag,
  input  [3:0]  io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_sqIdx_value,
  input  [2:0]  io_ldu_s2_storeLoadViolationQuery_0_req_bits_index,
  input         io_ldu_s2_storeLoadViolationQuery_0_req_bits_allocated,
  input         io_ldu_s2_storeLoadViolationQuery_0_req_bits_datavalid,
  input  [7:0]  io_ldu_s2_storeLoadViolationQuery_0_req_bits_mask,
  input  [35:0] io_ldu_s2_storeLoadViolationQuery_0_req_bits_paddr,
  output [2:0]  io_ldu_s2_storeLoadViolationQuery_0_resp_bits_index,
  output        io_ldu_s2_storeLoadViolationQuery_0_resp_bits_canAccept,
  output        io_ldu_s2_storeLoadViolationQuery_0_resp_bits_allocated,
  input         io_ldu_s2_storeLoadViolationQuery_1_req_valid,
  input  [9:0]  io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_cf_foldpc,
  input         io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_cf_ftqPtr_flag,
  input  [2:0]  io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_cf_ftqPtr_value,
  input  [2:0]  io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_cf_ftqOffset,
  input         io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_robIdx_flag,
  input  [4:0]  io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_robIdx_value,
  input         io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_sqIdx_flag,
  input  [3:0]  io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_sqIdx_value,
  input  [2:0]  io_ldu_s2_storeLoadViolationQuery_1_req_bits_index,
  input         io_ldu_s2_storeLoadViolationQuery_1_req_bits_allocated,
  input         io_ldu_s2_storeLoadViolationQuery_1_req_bits_datavalid,
  input  [7:0]  io_ldu_s2_storeLoadViolationQuery_1_req_bits_mask,
  input  [35:0] io_ldu_s2_storeLoadViolationQuery_1_req_bits_paddr,
  output [2:0]  io_ldu_s2_storeLoadViolationQuery_1_resp_bits_index,
  output        io_ldu_s2_storeLoadViolationQuery_1_resp_bits_canAccept,
  output        io_ldu_s2_storeLoadViolationQuery_1_resp_bits_allocated,
  input         io_ldu_s2_loadLoadViolationQuery_0_req_valid,
  input         io_ldu_s2_loadLoadViolationQuery_0_req_bits_uop_robIdx_flag,
  input  [4:0]  io_ldu_s2_loadLoadViolationQuery_0_req_bits_uop_robIdx_value,
  input         io_ldu_s2_loadLoadViolationQuery_0_req_bits_uop_lqIdx_flag,
  input  [3:0]  io_ldu_s2_loadLoadViolationQuery_0_req_bits_uop_lqIdx_value,
  input  [3:0]  io_ldu_s2_loadLoadViolationQuery_0_req_bits_index,
  input         io_ldu_s2_loadLoadViolationQuery_0_req_bits_allocated,
  input         io_ldu_s2_loadLoadViolationQuery_0_req_bits_datavalid,
  input         io_ldu_s2_loadLoadViolationQuery_0_req_bits_miss,
  input  [35:0] io_ldu_s2_loadLoadViolationQuery_0_req_bits_paddr,
  output        io_ldu_s2_loadLoadViolationQuery_0_resp_valid,
  output [3:0]  io_ldu_s2_loadLoadViolationQuery_0_resp_bits_index,
  output        io_ldu_s2_loadLoadViolationQuery_0_resp_bits_canAccept,
  output        io_ldu_s2_loadLoadViolationQuery_0_resp_bits_allocated,
  output        io_ldu_s2_loadLoadViolationQuery_0_resp_bits_replayFromFetch,
  input         io_ldu_s2_loadLoadViolationQuery_1_req_valid,
  input         io_ldu_s2_loadLoadViolationQuery_1_req_bits_uop_robIdx_flag,
  input  [4:0]  io_ldu_s2_loadLoadViolationQuery_1_req_bits_uop_robIdx_value,
  input         io_ldu_s2_loadLoadViolationQuery_1_req_bits_uop_lqIdx_flag,
  input  [3:0]  io_ldu_s2_loadLoadViolationQuery_1_req_bits_uop_lqIdx_value,
  input  [3:0]  io_ldu_s2_loadLoadViolationQuery_1_req_bits_index,
  input         io_ldu_s2_loadLoadViolationQuery_1_req_bits_allocated,
  input         io_ldu_s2_loadLoadViolationQuery_1_req_bits_datavalid,
  input         io_ldu_s2_loadLoadViolationQuery_1_req_bits_miss,
  input  [35:0] io_ldu_s2_loadLoadViolationQuery_1_req_bits_paddr,
  output        io_ldu_s2_loadLoadViolationQuery_1_resp_valid,
  output [3:0]  io_ldu_s2_loadLoadViolationQuery_1_resp_bits_index,
  output        io_ldu_s2_loadLoadViolationQuery_1_resp_bits_canAccept,
  output        io_ldu_s2_loadLoadViolationQuery_1_resp_bits_allocated,
  output        io_ldu_s2_loadLoadViolationQuery_1_resp_bits_replayFromFetch,
  input         io_ldu_s3_loadIn_0_valid,
  input  [9:0]  io_ldu_s3_loadIn_0_bits_uop_cf_foldpc,
  input         io_ldu_s3_loadIn_0_bits_uop_cf_exceptionVec_4,
  input         io_ldu_s3_loadIn_0_bits_uop_cf_exceptionVec_5,
  input         io_ldu_s3_loadIn_0_bits_uop_cf_exceptionVec_13,
  input         io_ldu_s3_loadIn_0_bits_uop_cf_trigger_backendEn_1,
  input         io_ldu_s3_loadIn_0_bits_uop_cf_trigger_backendHit_0,
  input         io_ldu_s3_loadIn_0_bits_uop_cf_trigger_backendHit_1,
  input         io_ldu_s3_loadIn_0_bits_uop_cf_trigger_backendHit_4,
  input         io_ldu_s3_loadIn_0_bits_uop_cf_waitForRobIdx_flag,
  input  [4:0]  io_ldu_s3_loadIn_0_bits_uop_cf_waitForRobIdx_value,
  input         io_ldu_s3_loadIn_0_bits_uop_cf_loadWaitBit,
  input         io_ldu_s3_loadIn_0_bits_uop_cf_loadWaitStrict,
  input         io_ldu_s3_loadIn_0_bits_uop_cf_ftqPtr_flag,
  input  [2:0]  io_ldu_s3_loadIn_0_bits_uop_cf_ftqPtr_value,
  input  [2:0]  io_ldu_s3_loadIn_0_bits_uop_cf_ftqOffset,
  input  [3:0]  io_ldu_s3_loadIn_0_bits_uop_ctrl_fuType,
  input  [6:0]  io_ldu_s3_loadIn_0_bits_uop_ctrl_fuOpType,
  input         io_ldu_s3_loadIn_0_bits_uop_ctrl_rfWen,
  input         io_ldu_s3_loadIn_0_bits_uop_ctrl_fpWen,
  input         io_ldu_s3_loadIn_0_bits_uop_ctrl_replayInst,
  input  [5:0]  io_ldu_s3_loadIn_0_bits_uop_pdest,
  input         io_ldu_s3_loadIn_0_bits_uop_robIdx_flag,
  input  [4:0]  io_ldu_s3_loadIn_0_bits_uop_robIdx_value,
  input         io_ldu_s3_loadIn_0_bits_uop_lqIdx_flag,
  input  [3:0]  io_ldu_s3_loadIn_0_bits_uop_lqIdx_value,
  input         io_ldu_s3_loadIn_0_bits_uop_sqIdx_flag,
  input  [3:0]  io_ldu_s3_loadIn_0_bits_uop_sqIdx_value,
  input  [38:0] io_ldu_s3_loadIn_0_bits_vaddr,
  input  [35:0] io_ldu_s3_loadIn_0_bits_paddr,
  input  [15:0] io_ldu_s3_loadIn_0_bits_mask,
  input         io_ldu_s3_loadIn_0_bits_miss,
  input         io_ldu_s3_loadIn_0_bits_tlbMiss,
  input         io_ldu_s3_loadIn_0_bits_mmio,
  input         io_ldu_s3_loadIn_0_bits_rarAllocated,
  input  [3:0]  io_ldu_s3_loadIn_0_bits_rarIndex,
  input         io_ldu_s3_loadIn_0_bits_rawAllocated,
  input  [2:0]  io_ldu_s3_loadIn_0_bits_rawIndex,
  input  [1:0]  io_ldu_s3_loadIn_0_bits_replayInfo_missMSHRId,
  input         io_ldu_s3_loadIn_0_bits_replayInfo_canForwardFullData,
  input         io_ldu_s3_loadIn_0_bits_replayInfo_dataInvalidSqIdx_flag,
  input  [3:0]  io_ldu_s3_loadIn_0_bits_replayInfo_dataInvalidSqIdx_value,
  input         io_ldu_s3_loadIn_0_bits_replayInfo_addrInvalidSqIdx_flag,
  input  [3:0]  io_ldu_s3_loadIn_0_bits_replayInfo_addrInvalidSqIdx_value,
  input  [7:0]  io_ldu_s3_loadIn_0_bits_replayInfo_replayCarry_real_way_en,
  input         io_ldu_s3_loadIn_0_bits_replayInfo_replayCarry_valid,
  input         io_ldu_s3_loadIn_0_bits_replayInfo_dataInLastBeat,
  input         io_ldu_s3_loadIn_0_bits_replayInfo_cause_0,
  input         io_ldu_s3_loadIn_0_bits_replayInfo_cause_1,
  input         io_ldu_s3_loadIn_0_bits_replayInfo_cause_2,
  input         io_ldu_s3_loadIn_0_bits_replayInfo_cause_3,
  input         io_ldu_s3_loadIn_0_bits_replayInfo_cause_4,
  input         io_ldu_s3_loadIn_0_bits_replayInfo_cause_5,
  input         io_ldu_s3_loadIn_0_bits_replayInfo_cause_6,
  input         io_ldu_s3_loadIn_0_bits_replayInfo_cause_7,
  input         io_ldu_s3_loadIn_0_bits_lqDataWenDup_1,
  input         io_ldu_s3_loadIn_0_bits_lqDataWenDup_2,
  input         io_ldu_s3_loadIn_0_bits_lqDataWenDup_3,
  input         io_ldu_s3_loadIn_0_bits_lqDataWenDup_5,
  input         io_ldu_s3_loadIn_1_valid,
  input  [9:0]  io_ldu_s3_loadIn_1_bits_uop_cf_foldpc,
  input         io_ldu_s3_loadIn_1_bits_uop_cf_exceptionVec_4,
  input         io_ldu_s3_loadIn_1_bits_uop_cf_exceptionVec_5,
  input         io_ldu_s3_loadIn_1_bits_uop_cf_exceptionVec_13,
  input         io_ldu_s3_loadIn_1_bits_uop_cf_trigger_backendEn_1,
  input         io_ldu_s3_loadIn_1_bits_uop_cf_trigger_backendHit_0,
  input         io_ldu_s3_loadIn_1_bits_uop_cf_trigger_backendHit_1,
  input         io_ldu_s3_loadIn_1_bits_uop_cf_trigger_backendHit_4,
  input         io_ldu_s3_loadIn_1_bits_uop_cf_waitForRobIdx_flag,
  input  [4:0]  io_ldu_s3_loadIn_1_bits_uop_cf_waitForRobIdx_value,
  input         io_ldu_s3_loadIn_1_bits_uop_cf_loadWaitBit,
  input         io_ldu_s3_loadIn_1_bits_uop_cf_loadWaitStrict,
  input         io_ldu_s3_loadIn_1_bits_uop_cf_ftqPtr_flag,
  input  [2:0]  io_ldu_s3_loadIn_1_bits_uop_cf_ftqPtr_value,
  input  [2:0]  io_ldu_s3_loadIn_1_bits_uop_cf_ftqOffset,
  input  [3:0]  io_ldu_s3_loadIn_1_bits_uop_ctrl_fuType,
  input  [6:0]  io_ldu_s3_loadIn_1_bits_uop_ctrl_fuOpType,
  input         io_ldu_s3_loadIn_1_bits_uop_ctrl_rfWen,
  input         io_ldu_s3_loadIn_1_bits_uop_ctrl_fpWen,
  input         io_ldu_s3_loadIn_1_bits_uop_ctrl_replayInst,
  input  [5:0]  io_ldu_s3_loadIn_1_bits_uop_pdest,
  input         io_ldu_s3_loadIn_1_bits_uop_robIdx_flag,
  input  [4:0]  io_ldu_s3_loadIn_1_bits_uop_robIdx_value,
  input         io_ldu_s3_loadIn_1_bits_uop_lqIdx_flag,
  input  [3:0]  io_ldu_s3_loadIn_1_bits_uop_lqIdx_value,
  input         io_ldu_s3_loadIn_1_bits_uop_sqIdx_flag,
  input  [3:0]  io_ldu_s3_loadIn_1_bits_uop_sqIdx_value,
  input  [38:0] io_ldu_s3_loadIn_1_bits_vaddr,
  input  [35:0] io_ldu_s3_loadIn_1_bits_paddr,
  input  [15:0] io_ldu_s3_loadIn_1_bits_mask,
  input         io_ldu_s3_loadIn_1_bits_miss,
  input         io_ldu_s3_loadIn_1_bits_tlbMiss,
  input         io_ldu_s3_loadIn_1_bits_mmio,
  input         io_ldu_s3_loadIn_1_bits_rarAllocated,
  input  [3:0]  io_ldu_s3_loadIn_1_bits_rarIndex,
  input         io_ldu_s3_loadIn_1_bits_rawAllocated,
  input  [2:0]  io_ldu_s3_loadIn_1_bits_rawIndex,
  input  [1:0]  io_ldu_s3_loadIn_1_bits_replayInfo_missMSHRId,
  input         io_ldu_s3_loadIn_1_bits_replayInfo_canForwardFullData,
  input         io_ldu_s3_loadIn_1_bits_replayInfo_dataInvalidSqIdx_flag,
  input  [3:0]  io_ldu_s3_loadIn_1_bits_replayInfo_dataInvalidSqIdx_value,
  input         io_ldu_s3_loadIn_1_bits_replayInfo_addrInvalidSqIdx_flag,
  input  [3:0]  io_ldu_s3_loadIn_1_bits_replayInfo_addrInvalidSqIdx_value,
  input  [7:0]  io_ldu_s3_loadIn_1_bits_replayInfo_replayCarry_real_way_en,
  input         io_ldu_s3_loadIn_1_bits_replayInfo_replayCarry_valid,
  input         io_ldu_s3_loadIn_1_bits_replayInfo_dataInLastBeat,
  input         io_ldu_s3_loadIn_1_bits_replayInfo_cause_0,
  input         io_ldu_s3_loadIn_1_bits_replayInfo_cause_1,
  input         io_ldu_s3_loadIn_1_bits_replayInfo_cause_2,
  input         io_ldu_s3_loadIn_1_bits_replayInfo_cause_3,
  input         io_ldu_s3_loadIn_1_bits_replayInfo_cause_4,
  input         io_ldu_s3_loadIn_1_bits_replayInfo_cause_5,
  input         io_ldu_s3_loadIn_1_bits_replayInfo_cause_6,
  input         io_ldu_s3_loadIn_1_bits_replayInfo_cause_7,
  input         io_ldu_s3_loadIn_1_bits_lqDataWenDup_1,
  input         io_ldu_s3_loadIn_1_bits_lqDataWenDup_2,
  input         io_ldu_s3_loadIn_1_bits_lqDataWenDup_3,
  input         io_ldu_s3_loadIn_1_bits_lqDataWenDup_5,
  input         io_sta_s1_storeAddrIn_0_valid,
  input  [2:0]  io_sta_s1_storeAddrIn_0_bits_uop_cf_ftqPtr_value,
  input  [2:0]  io_sta_s1_storeAddrIn_0_bits_uop_cf_ftqOffset,
  input         io_sta_s1_storeAddrIn_0_bits_uop_robIdx_flag,
  input  [4:0]  io_sta_s1_storeAddrIn_0_bits_uop_robIdx_value,
  input         io_sta_s1_storeAddrIn_0_bits_uop_sqIdx_flag,
  input  [3:0]  io_sta_s1_storeAddrIn_0_bits_uop_sqIdx_value,
  input  [35:0] io_sta_s1_storeAddrIn_0_bits_paddr,
  input  [15:0] io_sta_s1_storeAddrIn_0_bits_mask,
  input         io_sta_s1_storeAddrIn_0_bits_miss,
  input         io_sta_s1_storeAddrIn_1_valid,
  input  [2:0]  io_sta_s1_storeAddrIn_1_bits_uop_cf_ftqPtr_value,
  input  [2:0]  io_sta_s1_storeAddrIn_1_bits_uop_cf_ftqOffset,
  input         io_sta_s1_storeAddrIn_1_bits_uop_robIdx_flag,
  input  [4:0]  io_sta_s1_storeAddrIn_1_bits_uop_robIdx_value,
  input         io_sta_s1_storeAddrIn_1_bits_uop_sqIdx_flag,
  input  [3:0]  io_sta_s1_storeAddrIn_1_bits_uop_sqIdx_value,
  input  [35:0] io_sta_s1_storeAddrIn_1_bits_paddr,
  input  [15:0] io_sta_s1_storeAddrIn_1_bits_mask,
  input         io_sta_s1_storeAddrIn_1_bits_miss,
  input         io_std_s0_storeDataIn_0_valid,
  input         io_std_s0_storeDataIn_0_bits_uop_sqIdx_flag,
  input  [3:0]  io_std_s0_storeDataIn_0_bits_uop_sqIdx_value,
  input         io_std_s0_storeDataIn_1_valid,
  input         io_std_s0_storeDataIn_1_bits_uop_sqIdx_flag,
  input  [3:0]  io_std_s0_storeDataIn_1_bits_uop_sqIdx_value,
  input         io_sq_stAddrReadySqPtr_flag,
  input  [3:0]  io_sq_stAddrReadySqPtr_value,
  input         io_sq_stDataReadySqPtr_flag,
  input  [3:0]  io_sq_stDataReadySqPtr_value,
  input         io_sq_sqEmpty,
  input         io_loadOut_0_ready,
  output        io_loadOut_0_valid,
  output        io_loadOut_0_bits_uop_cf_exceptionVec_4,
  output        io_loadOut_0_bits_uop_cf_exceptionVec_5,
  output        io_loadOut_0_bits_uop_cf_exceptionVec_13,
  output        io_loadOut_0_bits_uop_cf_trigger_backendEn_1,
  output        io_loadOut_0_bits_uop_cf_trigger_backendHit_0,
  output        io_loadOut_0_bits_uop_cf_trigger_backendHit_1,
  output        io_loadOut_0_bits_uop_cf_trigger_backendHit_4,
  output        io_loadOut_0_bits_uop_ctrl_rfWen,
  output        io_loadOut_0_bits_uop_ctrl_fpWen,
  output        io_loadOut_0_bits_uop_ctrl_flushPipe,
  output        io_loadOut_0_bits_uop_ctrl_replayInst,
  output [5:0]  io_loadOut_0_bits_uop_pdest,
  output        io_loadOut_0_bits_uop_robIdx_flag,
  output [4:0]  io_loadOut_0_bits_uop_robIdx_value,
  output [63:0] io_ldRawDataOut_0_lqData,
  output [6:0]  io_ldRawDataOut_0_uop_ctrl_fuOpType,
  output        io_ldRawDataOut_0_uop_ctrl_fpWen,
  output [2:0]  io_ldRawDataOut_0_addrOffset,
  input         io_replay_0_ready,
  output        io_replay_0_valid,
  output [9:0]  io_replay_0_bits_uop_cf_foldpc,
  output        io_replay_0_bits_uop_cf_trigger_backendEn_1,
  output        io_replay_0_bits_uop_cf_trigger_backendHit_0,
  output        io_replay_0_bits_uop_cf_trigger_backendHit_1,
  output        io_replay_0_bits_uop_cf_trigger_backendHit_4,
  output        io_replay_0_bits_uop_cf_waitForRobIdx_flag,
  output [4:0]  io_replay_0_bits_uop_cf_waitForRobIdx_value,
  output        io_replay_0_bits_uop_cf_loadWaitBit,
  output        io_replay_0_bits_uop_cf_loadWaitStrict,
  output        io_replay_0_bits_uop_cf_ftqPtr_flag,
  output [2:0]  io_replay_0_bits_uop_cf_ftqPtr_value,
  output [2:0]  io_replay_0_bits_uop_cf_ftqOffset,
  output [3:0]  io_replay_0_bits_uop_ctrl_fuType,
  output [6:0]  io_replay_0_bits_uop_ctrl_fuOpType,
  output        io_replay_0_bits_uop_ctrl_rfWen,
  output        io_replay_0_bits_uop_ctrl_fpWen,
  output [5:0]  io_replay_0_bits_uop_pdest,
  output        io_replay_0_bits_uop_robIdx_flag,
  output [4:0]  io_replay_0_bits_uop_robIdx_value,
  output        io_replay_0_bits_uop_lqIdx_flag,
  output [3:0]  io_replay_0_bits_uop_lqIdx_value,
  output        io_replay_0_bits_uop_sqIdx_flag,
  output [3:0]  io_replay_0_bits_uop_sqIdx_value,
  output [38:0] io_replay_0_bits_vaddr,
  output        io_replay_0_bits_isFirstIssue,
  output [7:0]  io_replay_0_bits_replayCarry_real_way_en,
  output        io_replay_0_bits_replayCarry_valid,
  output [1:0]  io_replay_0_bits_mshrid,
  output        io_replay_0_bits_forward_tlDchannel,
  output        io_replay_0_bits_rarAllocated,
  output [3:0]  io_replay_0_bits_rarIndex,
  output        io_replay_0_bits_rawAllocated,
  output [2:0]  io_replay_0_bits_rawIndex,
  input         io_replay_1_ready,
  output        io_replay_1_valid,
  output [9:0]  io_replay_1_bits_uop_cf_foldpc,
  output        io_replay_1_bits_uop_cf_trigger_backendEn_1,
  output        io_replay_1_bits_uop_cf_trigger_backendHit_0,
  output        io_replay_1_bits_uop_cf_trigger_backendHit_1,
  output        io_replay_1_bits_uop_cf_trigger_backendHit_4,
  output        io_replay_1_bits_uop_cf_waitForRobIdx_flag,
  output [4:0]  io_replay_1_bits_uop_cf_waitForRobIdx_value,
  output        io_replay_1_bits_uop_cf_loadWaitBit,
  output        io_replay_1_bits_uop_cf_loadWaitStrict,
  output        io_replay_1_bits_uop_cf_ftqPtr_flag,
  output [2:0]  io_replay_1_bits_uop_cf_ftqPtr_value,
  output [2:0]  io_replay_1_bits_uop_cf_ftqOffset,
  output [3:0]  io_replay_1_bits_uop_ctrl_fuType,
  output [6:0]  io_replay_1_bits_uop_ctrl_fuOpType,
  output        io_replay_1_bits_uop_ctrl_rfWen,
  output        io_replay_1_bits_uop_ctrl_fpWen,
  output [5:0]  io_replay_1_bits_uop_pdest,
  output        io_replay_1_bits_uop_robIdx_flag,
  output [4:0]  io_replay_1_bits_uop_robIdx_value,
  output        io_replay_1_bits_uop_lqIdx_flag,
  output [3:0]  io_replay_1_bits_uop_lqIdx_value,
  output        io_replay_1_bits_uop_sqIdx_flag,
  output [3:0]  io_replay_1_bits_uop_sqIdx_value,
  output [38:0] io_replay_1_bits_vaddr,
  output        io_replay_1_bits_isFirstIssue,
  output [7:0]  io_replay_1_bits_replayCarry_real_way_en,
  output        io_replay_1_bits_replayCarry_valid,
  output [1:0]  io_replay_1_bits_mshrid,
  output        io_replay_1_bits_forward_tlDchannel,
  output        io_replay_1_bits_rarAllocated,
  output [3:0]  io_replay_1_bits_rarIndex,
  output        io_replay_1_bits_rawAllocated,
  output [2:0]  io_replay_1_bits_rawIndex,
  input         io_refill_valid,
  input  [1:0]  io_refill_bits_id,
  input         io_release_valid,
  input  [35:0] io_release_bits_paddr,
  output        io_rollback_valid,
  output        io_rollback_bits_robIdx_flag,
  output [4:0]  io_rollback_bits_robIdx_value,
  output        io_rollback_bits_ftqIdx_flag,
  output [2:0]  io_rollback_bits_ftqIdx_value,
  output [2:0]  io_rollback_bits_ftqOffset,
  output [2:0]  io_rollback_bits_stFtqIdx_value,
  output [2:0]  io_rollback_bits_stFtqOffset,
  output        io_correctTableUpdate_valid,
  output [9:0]  io_correctTableUpdate_bits_addr,
  input         io_rob_pendingld,
  input         io_rob_commit,
  output        io_rob_isMMIO_0,
  output        io_rob_isMMIO_1,
  output [4:0]  io_rob_uop_0_robIdx_value,
  output [4:0]  io_rob_uop_1_robIdx_value,
  input         io_uncache_req_ready,
  output        io_uncache_req_valid,
  output [35:0] io_uncache_req_bits_addr,
  output [7:0]  io_uncache_req_bits_mask,
  input         io_uncache_resp_valid,
  input  [63:0] io_uncache_resp_bits_data,
  input         io_trigger_0_hitLoadAddrTriggerHitVec_0,
  input         io_trigger_0_hitLoadAddrTriggerHitVec_1,
  input         io_trigger_0_hitLoadAddrTriggerHitVec_2,
  output        io_trigger_0_lqLoadAddrTriggerHitVec_0,
  output        io_trigger_0_lqLoadAddrTriggerHitVec_1,
  output        io_trigger_0_lqLoadAddrTriggerHitVec_2,
  input         io_trigger_1_hitLoadAddrTriggerHitVec_0,
  input         io_trigger_1_hitLoadAddrTriggerHitVec_1,
  input         io_trigger_1_hitLoadAddrTriggerHitVec_2,
  output [38:0] io_exceptionAddr_vaddr,
  output [1:0]  io_lqDeq,
  output [4:0]  io_lqCancelCnt,
  output        io_lqReplayFull,
  input  [5:0]  io_tlbReplayDelayCycleCtrl_0,
  input  [5:0]  io_tlbReplayDelayCycleCtrl_1,
  input  [5:0]  io_tlbReplayDelayCycleCtrl_2,
  input  [5:0]  io_tlbReplayDelayCycleCtrl_3,
  output [5:0]  io_perf_0_value,
  output [5:0]  io_perf_1_value,
  output [5:0]  io_perf_2_value,
  output [5:0]  io_perf_3_value,
  output [5:0]  io_perf_4_value,
  output [5:0]  io_perf_5_value,
  output [5:0]  io_perf_6_value,
  output [5:0]  io_perf_7_value,
  output [5:0]  io_perf_8_value,
  output [5:0]  io_perf_9_value,
  output [5:0]  io_perf_10_value,
  output [5:0]  io_perf_11_value,
  output [5:0]  io_perf_12_value,
  output [5:0]  io_perf_13_value,
  output [5:0]  io_perf_14_value,
  output [5:0]  io_perf_15_value,
  output [5:0]  io_perf_16_value,
  output [5:0]  io_perf_17_value,
  output [5:0]  io_perf_18_value,
  output [5:0]  io_perf_19_value,
  output [5:0]  io_perf_20_value,
  output [5:0]  io_perf_21_value
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
`endif // RANDOMIZE_REG_INIT
  wire  loadQueueRAR_clock; // @[LoadQueue.scala 133:28]
  wire  loadQueueRAR_reset; // @[LoadQueue.scala 133:28]
  wire  loadQueueRAR_io_redirect_valid; // @[LoadQueue.scala 133:28]
  wire  loadQueueRAR_io_redirect_bits_robIdx_flag; // @[LoadQueue.scala 133:28]
  wire [4:0] loadQueueRAR_io_redirect_bits_robIdx_value; // @[LoadQueue.scala 133:28]
  wire  loadQueueRAR_io_redirect_bits_level; // @[LoadQueue.scala 133:28]
  wire  loadQueueRAR_io_query_0_req_valid; // @[LoadQueue.scala 133:28]
  wire  loadQueueRAR_io_query_0_req_bits_uop_robIdx_flag; // @[LoadQueue.scala 133:28]
  wire [4:0] loadQueueRAR_io_query_0_req_bits_uop_robIdx_value; // @[LoadQueue.scala 133:28]
  wire  loadQueueRAR_io_query_0_req_bits_uop_lqIdx_flag; // @[LoadQueue.scala 133:28]
  wire [3:0] loadQueueRAR_io_query_0_req_bits_uop_lqIdx_value; // @[LoadQueue.scala 133:28]
  wire [3:0] loadQueueRAR_io_query_0_req_bits_index; // @[LoadQueue.scala 133:28]
  wire  loadQueueRAR_io_query_0_req_bits_allocated; // @[LoadQueue.scala 133:28]
  wire  loadQueueRAR_io_query_0_req_bits_datavalid; // @[LoadQueue.scala 133:28]
  wire  loadQueueRAR_io_query_0_req_bits_miss; // @[LoadQueue.scala 133:28]
  wire [35:0] loadQueueRAR_io_query_0_req_bits_paddr; // @[LoadQueue.scala 133:28]
  wire  loadQueueRAR_io_query_0_resp_valid; // @[LoadQueue.scala 133:28]
  wire [3:0] loadQueueRAR_io_query_0_resp_bits_index; // @[LoadQueue.scala 133:28]
  wire  loadQueueRAR_io_query_0_resp_bits_canAccept; // @[LoadQueue.scala 133:28]
  wire  loadQueueRAR_io_query_0_resp_bits_allocated; // @[LoadQueue.scala 133:28]
  wire  loadQueueRAR_io_query_0_resp_bits_replayFromFetch; // @[LoadQueue.scala 133:28]
  wire  loadQueueRAR_io_query_1_req_valid; // @[LoadQueue.scala 133:28]
  wire  loadQueueRAR_io_query_1_req_bits_uop_robIdx_flag; // @[LoadQueue.scala 133:28]
  wire [4:0] loadQueueRAR_io_query_1_req_bits_uop_robIdx_value; // @[LoadQueue.scala 133:28]
  wire  loadQueueRAR_io_query_1_req_bits_uop_lqIdx_flag; // @[LoadQueue.scala 133:28]
  wire [3:0] loadQueueRAR_io_query_1_req_bits_uop_lqIdx_value; // @[LoadQueue.scala 133:28]
  wire [3:0] loadQueueRAR_io_query_1_req_bits_index; // @[LoadQueue.scala 133:28]
  wire  loadQueueRAR_io_query_1_req_bits_allocated; // @[LoadQueue.scala 133:28]
  wire  loadQueueRAR_io_query_1_req_bits_datavalid; // @[LoadQueue.scala 133:28]
  wire  loadQueueRAR_io_query_1_req_bits_miss; // @[LoadQueue.scala 133:28]
  wire [35:0] loadQueueRAR_io_query_1_req_bits_paddr; // @[LoadQueue.scala 133:28]
  wire  loadQueueRAR_io_query_1_resp_valid; // @[LoadQueue.scala 133:28]
  wire [3:0] loadQueueRAR_io_query_1_resp_bits_index; // @[LoadQueue.scala 133:28]
  wire  loadQueueRAR_io_query_1_resp_bits_canAccept; // @[LoadQueue.scala 133:28]
  wire  loadQueueRAR_io_query_1_resp_bits_allocated; // @[LoadQueue.scala 133:28]
  wire  loadQueueRAR_io_query_1_resp_bits_replayFromFetch; // @[LoadQueue.scala 133:28]
  wire  loadQueueRAR_io_release_valid; // @[LoadQueue.scala 133:28]
  wire [35:0] loadQueueRAR_io_release_bits_paddr; // @[LoadQueue.scala 133:28]
  wire  loadQueueRAR_io_ldIssuePtr_flag; // @[LoadQueue.scala 133:28]
  wire [3:0] loadQueueRAR_io_ldIssuePtr_value; // @[LoadQueue.scala 133:28]
  wire [5:0] loadQueueRAR_io_perf_0_value; // @[LoadQueue.scala 133:28]
  wire [5:0] loadQueueRAR_io_perf_1_value; // @[LoadQueue.scala 133:28]
  wire [5:0] loadQueueRAR_io_perf_2_value; // @[LoadQueue.scala 133:28]
  wire  loadQueueRAW_clock; // @[LoadQueue.scala 134:28]
  wire  loadQueueRAW_reset; // @[LoadQueue.scala 134:28]
  wire  loadQueueRAW_io_redirect_valid; // @[LoadQueue.scala 134:28]
  wire  loadQueueRAW_io_redirect_bits_robIdx_flag; // @[LoadQueue.scala 134:28]
  wire [4:0] loadQueueRAW_io_redirect_bits_robIdx_value; // @[LoadQueue.scala 134:28]
  wire  loadQueueRAW_io_redirect_bits_level; // @[LoadQueue.scala 134:28]
  wire  loadQueueRAW_io_query_0_req_valid; // @[LoadQueue.scala 134:28]
  wire [9:0] loadQueueRAW_io_query_0_req_bits_uop_cf_foldpc; // @[LoadQueue.scala 134:28]
  wire  loadQueueRAW_io_query_0_req_bits_uop_cf_ftqPtr_flag; // @[LoadQueue.scala 134:28]
  wire [2:0] loadQueueRAW_io_query_0_req_bits_uop_cf_ftqPtr_value; // @[LoadQueue.scala 134:28]
  wire [2:0] loadQueueRAW_io_query_0_req_bits_uop_cf_ftqOffset; // @[LoadQueue.scala 134:28]
  wire  loadQueueRAW_io_query_0_req_bits_uop_robIdx_flag; // @[LoadQueue.scala 134:28]
  wire [4:0] loadQueueRAW_io_query_0_req_bits_uop_robIdx_value; // @[LoadQueue.scala 134:28]
  wire  loadQueueRAW_io_query_0_req_bits_uop_sqIdx_flag; // @[LoadQueue.scala 134:28]
  wire [3:0] loadQueueRAW_io_query_0_req_bits_uop_sqIdx_value; // @[LoadQueue.scala 134:28]
  wire [2:0] loadQueueRAW_io_query_0_req_bits_index; // @[LoadQueue.scala 134:28]
  wire  loadQueueRAW_io_query_0_req_bits_allocated; // @[LoadQueue.scala 134:28]
  wire  loadQueueRAW_io_query_0_req_bits_datavalid; // @[LoadQueue.scala 134:28]
  wire [7:0] loadQueueRAW_io_query_0_req_bits_mask; // @[LoadQueue.scala 134:28]
  wire [35:0] loadQueueRAW_io_query_0_req_bits_paddr; // @[LoadQueue.scala 134:28]
  wire [2:0] loadQueueRAW_io_query_0_resp_bits_index; // @[LoadQueue.scala 134:28]
  wire  loadQueueRAW_io_query_0_resp_bits_canAccept; // @[LoadQueue.scala 134:28]
  wire  loadQueueRAW_io_query_0_resp_bits_allocated; // @[LoadQueue.scala 134:28]
  wire  loadQueueRAW_io_query_1_req_valid; // @[LoadQueue.scala 134:28]
  wire [9:0] loadQueueRAW_io_query_1_req_bits_uop_cf_foldpc; // @[LoadQueue.scala 134:28]
  wire  loadQueueRAW_io_query_1_req_bits_uop_cf_ftqPtr_flag; // @[LoadQueue.scala 134:28]
  wire [2:0] loadQueueRAW_io_query_1_req_bits_uop_cf_ftqPtr_value; // @[LoadQueue.scala 134:28]
  wire [2:0] loadQueueRAW_io_query_1_req_bits_uop_cf_ftqOffset; // @[LoadQueue.scala 134:28]
  wire  loadQueueRAW_io_query_1_req_bits_uop_robIdx_flag; // @[LoadQueue.scala 134:28]
  wire [4:0] loadQueueRAW_io_query_1_req_bits_uop_robIdx_value; // @[LoadQueue.scala 134:28]
  wire  loadQueueRAW_io_query_1_req_bits_uop_sqIdx_flag; // @[LoadQueue.scala 134:28]
  wire [3:0] loadQueueRAW_io_query_1_req_bits_uop_sqIdx_value; // @[LoadQueue.scala 134:28]
  wire [2:0] loadQueueRAW_io_query_1_req_bits_index; // @[LoadQueue.scala 134:28]
  wire  loadQueueRAW_io_query_1_req_bits_allocated; // @[LoadQueue.scala 134:28]
  wire  loadQueueRAW_io_query_1_req_bits_datavalid; // @[LoadQueue.scala 134:28]
  wire [7:0] loadQueueRAW_io_query_1_req_bits_mask; // @[LoadQueue.scala 134:28]
  wire [35:0] loadQueueRAW_io_query_1_req_bits_paddr; // @[LoadQueue.scala 134:28]
  wire [2:0] loadQueueRAW_io_query_1_resp_bits_index; // @[LoadQueue.scala 134:28]
  wire  loadQueueRAW_io_query_1_resp_bits_canAccept; // @[LoadQueue.scala 134:28]
  wire  loadQueueRAW_io_query_1_resp_bits_allocated; // @[LoadQueue.scala 134:28]
  wire  loadQueueRAW_io_storeIn_0_valid; // @[LoadQueue.scala 134:28]
  wire [2:0] loadQueueRAW_io_storeIn_0_bits_uop_cf_ftqPtr_value; // @[LoadQueue.scala 134:28]
  wire [2:0] loadQueueRAW_io_storeIn_0_bits_uop_cf_ftqOffset; // @[LoadQueue.scala 134:28]
  wire  loadQueueRAW_io_storeIn_0_bits_uop_robIdx_flag; // @[LoadQueue.scala 134:28]
  wire [4:0] loadQueueRAW_io_storeIn_0_bits_uop_robIdx_value; // @[LoadQueue.scala 134:28]
  wire [35:0] loadQueueRAW_io_storeIn_0_bits_paddr; // @[LoadQueue.scala 134:28]
  wire [15:0] loadQueueRAW_io_storeIn_0_bits_mask; // @[LoadQueue.scala 134:28]
  wire  loadQueueRAW_io_storeIn_0_bits_miss; // @[LoadQueue.scala 134:28]
  wire  loadQueueRAW_io_storeIn_1_valid; // @[LoadQueue.scala 134:28]
  wire [2:0] loadQueueRAW_io_storeIn_1_bits_uop_cf_ftqPtr_value; // @[LoadQueue.scala 134:28]
  wire [2:0] loadQueueRAW_io_storeIn_1_bits_uop_cf_ftqOffset; // @[LoadQueue.scala 134:28]
  wire  loadQueueRAW_io_storeIn_1_bits_uop_robIdx_flag; // @[LoadQueue.scala 134:28]
  wire [4:0] loadQueueRAW_io_storeIn_1_bits_uop_robIdx_value; // @[LoadQueue.scala 134:28]
  wire [35:0] loadQueueRAW_io_storeIn_1_bits_paddr; // @[LoadQueue.scala 134:28]
  wire [15:0] loadQueueRAW_io_storeIn_1_bits_mask; // @[LoadQueue.scala 134:28]
  wire  loadQueueRAW_io_storeIn_1_bits_miss; // @[LoadQueue.scala 134:28]
  wire  loadQueueRAW_io_rollback_valid; // @[LoadQueue.scala 134:28]
  wire  loadQueueRAW_io_rollback_bits_robIdx_flag; // @[LoadQueue.scala 134:28]
  wire [4:0] loadQueueRAW_io_rollback_bits_robIdx_value; // @[LoadQueue.scala 134:28]
  wire  loadQueueRAW_io_rollback_bits_ftqIdx_flag; // @[LoadQueue.scala 134:28]
  wire [2:0] loadQueueRAW_io_rollback_bits_ftqIdx_value; // @[LoadQueue.scala 134:28]
  wire [2:0] loadQueueRAW_io_rollback_bits_ftqOffset; // @[LoadQueue.scala 134:28]
  wire [2:0] loadQueueRAW_io_rollback_bits_stFtqIdx_value; // @[LoadQueue.scala 134:28]
  wire [2:0] loadQueueRAW_io_rollback_bits_stFtqOffset; // @[LoadQueue.scala 134:28]
  wire  loadQueueRAW_io_correctTableUpdate_valid; // @[LoadQueue.scala 134:28]
  wire [9:0] loadQueueRAW_io_correctTableUpdate_bits_addr; // @[LoadQueue.scala 134:28]
  wire  loadQueueRAW_io_stAddrReadySqPtr_flag; // @[LoadQueue.scala 134:28]
  wire [3:0] loadQueueRAW_io_stAddrReadySqPtr_value; // @[LoadQueue.scala 134:28]
  wire [5:0] loadQueueRAW_io_perf_0_value; // @[LoadQueue.scala 134:28]
  wire [5:0] loadQueueRAW_io_perf_1_value; // @[LoadQueue.scala 134:28]
  wire [5:0] loadQueueRAW_io_perf_2_value; // @[LoadQueue.scala 134:28]
  wire  loadQueueReplay_clock; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_reset; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_redirect_valid; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_redirect_bits_robIdx_flag; // @[LoadQueue.scala 135:31]
  wire [4:0] loadQueueReplay_io_redirect_bits_robIdx_value; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_redirect_bits_level; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_0_valid; // @[LoadQueue.scala 135:31]
  wire [9:0] loadQueueReplay_io_enq_0_bits_uop_cf_foldpc; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_0_bits_uop_cf_exceptionVec_4; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_0_bits_uop_cf_exceptionVec_5; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_0_bits_uop_cf_exceptionVec_13; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_0_bits_uop_cf_trigger_backendEn_1; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_0_bits_uop_cf_trigger_backendHit_0; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_0_bits_uop_cf_trigger_backendHit_1; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_0_bits_uop_cf_trigger_backendHit_4; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_0_bits_uop_cf_waitForRobIdx_flag; // @[LoadQueue.scala 135:31]
  wire [4:0] loadQueueReplay_io_enq_0_bits_uop_cf_waitForRobIdx_value; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_0_bits_uop_cf_loadWaitBit; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_0_bits_uop_cf_loadWaitStrict; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_0_bits_uop_cf_ftqPtr_flag; // @[LoadQueue.scala 135:31]
  wire [2:0] loadQueueReplay_io_enq_0_bits_uop_cf_ftqPtr_value; // @[LoadQueue.scala 135:31]
  wire [2:0] loadQueueReplay_io_enq_0_bits_uop_cf_ftqOffset; // @[LoadQueue.scala 135:31]
  wire [3:0] loadQueueReplay_io_enq_0_bits_uop_ctrl_fuType; // @[LoadQueue.scala 135:31]
  wire [6:0] loadQueueReplay_io_enq_0_bits_uop_ctrl_fuOpType; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_0_bits_uop_ctrl_rfWen; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_0_bits_uop_ctrl_fpWen; // @[LoadQueue.scala 135:31]
  wire [5:0] loadQueueReplay_io_enq_0_bits_uop_pdest; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_0_bits_uop_robIdx_flag; // @[LoadQueue.scala 135:31]
  wire [4:0] loadQueueReplay_io_enq_0_bits_uop_robIdx_value; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_0_bits_uop_lqIdx_flag; // @[LoadQueue.scala 135:31]
  wire [3:0] loadQueueReplay_io_enq_0_bits_uop_lqIdx_value; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_0_bits_uop_sqIdx_flag; // @[LoadQueue.scala 135:31]
  wire [3:0] loadQueueReplay_io_enq_0_bits_uop_sqIdx_value; // @[LoadQueue.scala 135:31]
  wire [38:0] loadQueueReplay_io_enq_0_bits_vaddr; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_0_bits_tlbMiss; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_0_bits_rarAllocated; // @[LoadQueue.scala 135:31]
  wire [3:0] loadQueueReplay_io_enq_0_bits_rarIndex; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_0_bits_rawAllocated; // @[LoadQueue.scala 135:31]
  wire [2:0] loadQueueReplay_io_enq_0_bits_rawIndex; // @[LoadQueue.scala 135:31]
  wire [1:0] loadQueueReplay_io_enq_0_bits_replayInfo_missMSHRId; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_0_bits_replayInfo_canForwardFullData; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_0_bits_replayInfo_dataInvalidSqIdx_flag; // @[LoadQueue.scala 135:31]
  wire [3:0] loadQueueReplay_io_enq_0_bits_replayInfo_dataInvalidSqIdx_value; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_0_bits_replayInfo_addrInvalidSqIdx_flag; // @[LoadQueue.scala 135:31]
  wire [3:0] loadQueueReplay_io_enq_0_bits_replayInfo_addrInvalidSqIdx_value; // @[LoadQueue.scala 135:31]
  wire [7:0] loadQueueReplay_io_enq_0_bits_replayInfo_replayCarry_real_way_en; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_0_bits_replayInfo_replayCarry_valid; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_0_bits_replayInfo_dataInLastBeat; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_0_bits_replayInfo_cause_0; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_0_bits_replayInfo_cause_1; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_0_bits_replayInfo_cause_2; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_0_bits_replayInfo_cause_3; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_0_bits_replayInfo_cause_4; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_0_bits_replayInfo_cause_5; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_0_bits_replayInfo_cause_6; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_0_bits_replayInfo_cause_7; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_1_valid; // @[LoadQueue.scala 135:31]
  wire [9:0] loadQueueReplay_io_enq_1_bits_uop_cf_foldpc; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_1_bits_uop_cf_exceptionVec_4; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_1_bits_uop_cf_exceptionVec_5; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_1_bits_uop_cf_exceptionVec_13; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_1_bits_uop_cf_trigger_backendEn_1; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_1_bits_uop_cf_trigger_backendHit_0; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_1_bits_uop_cf_trigger_backendHit_1; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_1_bits_uop_cf_trigger_backendHit_4; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_1_bits_uop_cf_waitForRobIdx_flag; // @[LoadQueue.scala 135:31]
  wire [4:0] loadQueueReplay_io_enq_1_bits_uop_cf_waitForRobIdx_value; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_1_bits_uop_cf_loadWaitBit; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_1_bits_uop_cf_loadWaitStrict; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_1_bits_uop_cf_ftqPtr_flag; // @[LoadQueue.scala 135:31]
  wire [2:0] loadQueueReplay_io_enq_1_bits_uop_cf_ftqPtr_value; // @[LoadQueue.scala 135:31]
  wire [2:0] loadQueueReplay_io_enq_1_bits_uop_cf_ftqOffset; // @[LoadQueue.scala 135:31]
  wire [3:0] loadQueueReplay_io_enq_1_bits_uop_ctrl_fuType; // @[LoadQueue.scala 135:31]
  wire [6:0] loadQueueReplay_io_enq_1_bits_uop_ctrl_fuOpType; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_1_bits_uop_ctrl_rfWen; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_1_bits_uop_ctrl_fpWen; // @[LoadQueue.scala 135:31]
  wire [5:0] loadQueueReplay_io_enq_1_bits_uop_pdest; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_1_bits_uop_robIdx_flag; // @[LoadQueue.scala 135:31]
  wire [4:0] loadQueueReplay_io_enq_1_bits_uop_robIdx_value; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_1_bits_uop_lqIdx_flag; // @[LoadQueue.scala 135:31]
  wire [3:0] loadQueueReplay_io_enq_1_bits_uop_lqIdx_value; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_1_bits_uop_sqIdx_flag; // @[LoadQueue.scala 135:31]
  wire [3:0] loadQueueReplay_io_enq_1_bits_uop_sqIdx_value; // @[LoadQueue.scala 135:31]
  wire [38:0] loadQueueReplay_io_enq_1_bits_vaddr; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_1_bits_tlbMiss; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_1_bits_rarAllocated; // @[LoadQueue.scala 135:31]
  wire [3:0] loadQueueReplay_io_enq_1_bits_rarIndex; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_1_bits_rawAllocated; // @[LoadQueue.scala 135:31]
  wire [2:0] loadQueueReplay_io_enq_1_bits_rawIndex; // @[LoadQueue.scala 135:31]
  wire [1:0] loadQueueReplay_io_enq_1_bits_replayInfo_missMSHRId; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_1_bits_replayInfo_canForwardFullData; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_1_bits_replayInfo_dataInvalidSqIdx_flag; // @[LoadQueue.scala 135:31]
  wire [3:0] loadQueueReplay_io_enq_1_bits_replayInfo_dataInvalidSqIdx_value; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_1_bits_replayInfo_addrInvalidSqIdx_flag; // @[LoadQueue.scala 135:31]
  wire [3:0] loadQueueReplay_io_enq_1_bits_replayInfo_addrInvalidSqIdx_value; // @[LoadQueue.scala 135:31]
  wire [7:0] loadQueueReplay_io_enq_1_bits_replayInfo_replayCarry_real_way_en; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_1_bits_replayInfo_replayCarry_valid; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_1_bits_replayInfo_dataInLastBeat; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_1_bits_replayInfo_cause_0; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_1_bits_replayInfo_cause_1; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_1_bits_replayInfo_cause_2; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_1_bits_replayInfo_cause_3; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_1_bits_replayInfo_cause_4; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_1_bits_replayInfo_cause_5; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_1_bits_replayInfo_cause_6; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_enq_1_bits_replayInfo_cause_7; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_storeAddrIn_0_valid; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_storeAddrIn_0_bits_uop_sqIdx_flag; // @[LoadQueue.scala 135:31]
  wire [3:0] loadQueueReplay_io_storeAddrIn_0_bits_uop_sqIdx_value; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_storeAddrIn_0_bits_miss; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_storeAddrIn_1_valid; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_storeAddrIn_1_bits_uop_sqIdx_flag; // @[LoadQueue.scala 135:31]
  wire [3:0] loadQueueReplay_io_storeAddrIn_1_bits_uop_sqIdx_value; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_storeAddrIn_1_bits_miss; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_storeDataIn_0_valid; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_storeDataIn_0_bits_uop_sqIdx_flag; // @[LoadQueue.scala 135:31]
  wire [3:0] loadQueueReplay_io_storeDataIn_0_bits_uop_sqIdx_value; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_storeDataIn_1_valid; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_storeDataIn_1_bits_uop_sqIdx_flag; // @[LoadQueue.scala 135:31]
  wire [3:0] loadQueueReplay_io_storeDataIn_1_bits_uop_sqIdx_value; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_replay_0_ready; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_replay_0_valid; // @[LoadQueue.scala 135:31]
  wire [9:0] loadQueueReplay_io_replay_0_bits_uop_cf_foldpc; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_replay_0_bits_uop_cf_trigger_backendEn_1; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_replay_0_bits_uop_cf_trigger_backendHit_0; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_replay_0_bits_uop_cf_trigger_backendHit_1; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_replay_0_bits_uop_cf_trigger_backendHit_4; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_replay_0_bits_uop_cf_waitForRobIdx_flag; // @[LoadQueue.scala 135:31]
  wire [4:0] loadQueueReplay_io_replay_0_bits_uop_cf_waitForRobIdx_value; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_replay_0_bits_uop_cf_loadWaitBit; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_replay_0_bits_uop_cf_loadWaitStrict; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_replay_0_bits_uop_cf_ftqPtr_flag; // @[LoadQueue.scala 135:31]
  wire [2:0] loadQueueReplay_io_replay_0_bits_uop_cf_ftqPtr_value; // @[LoadQueue.scala 135:31]
  wire [2:0] loadQueueReplay_io_replay_0_bits_uop_cf_ftqOffset; // @[LoadQueue.scala 135:31]
  wire [3:0] loadQueueReplay_io_replay_0_bits_uop_ctrl_fuType; // @[LoadQueue.scala 135:31]
  wire [6:0] loadQueueReplay_io_replay_0_bits_uop_ctrl_fuOpType; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_replay_0_bits_uop_ctrl_rfWen; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_replay_0_bits_uop_ctrl_fpWen; // @[LoadQueue.scala 135:31]
  wire [5:0] loadQueueReplay_io_replay_0_bits_uop_pdest; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_replay_0_bits_uop_robIdx_flag; // @[LoadQueue.scala 135:31]
  wire [4:0] loadQueueReplay_io_replay_0_bits_uop_robIdx_value; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_replay_0_bits_uop_lqIdx_flag; // @[LoadQueue.scala 135:31]
  wire [3:0] loadQueueReplay_io_replay_0_bits_uop_lqIdx_value; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_replay_0_bits_uop_sqIdx_flag; // @[LoadQueue.scala 135:31]
  wire [3:0] loadQueueReplay_io_replay_0_bits_uop_sqIdx_value; // @[LoadQueue.scala 135:31]
  wire [38:0] loadQueueReplay_io_replay_0_bits_vaddr; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_replay_0_bits_isFirstIssue; // @[LoadQueue.scala 135:31]
  wire [7:0] loadQueueReplay_io_replay_0_bits_replayCarry_real_way_en; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_replay_0_bits_replayCarry_valid; // @[LoadQueue.scala 135:31]
  wire [1:0] loadQueueReplay_io_replay_0_bits_mshrid; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_replay_0_bits_forward_tlDchannel; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_replay_0_bits_rarAllocated; // @[LoadQueue.scala 135:31]
  wire [3:0] loadQueueReplay_io_replay_0_bits_rarIndex; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_replay_0_bits_rawAllocated; // @[LoadQueue.scala 135:31]
  wire [2:0] loadQueueReplay_io_replay_0_bits_rawIndex; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_replay_1_ready; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_replay_1_valid; // @[LoadQueue.scala 135:31]
  wire [9:0] loadQueueReplay_io_replay_1_bits_uop_cf_foldpc; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_replay_1_bits_uop_cf_trigger_backendEn_1; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_replay_1_bits_uop_cf_trigger_backendHit_0; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_replay_1_bits_uop_cf_trigger_backendHit_1; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_replay_1_bits_uop_cf_trigger_backendHit_4; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_replay_1_bits_uop_cf_waitForRobIdx_flag; // @[LoadQueue.scala 135:31]
  wire [4:0] loadQueueReplay_io_replay_1_bits_uop_cf_waitForRobIdx_value; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_replay_1_bits_uop_cf_loadWaitBit; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_replay_1_bits_uop_cf_loadWaitStrict; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_replay_1_bits_uop_cf_ftqPtr_flag; // @[LoadQueue.scala 135:31]
  wire [2:0] loadQueueReplay_io_replay_1_bits_uop_cf_ftqPtr_value; // @[LoadQueue.scala 135:31]
  wire [2:0] loadQueueReplay_io_replay_1_bits_uop_cf_ftqOffset; // @[LoadQueue.scala 135:31]
  wire [3:0] loadQueueReplay_io_replay_1_bits_uop_ctrl_fuType; // @[LoadQueue.scala 135:31]
  wire [6:0] loadQueueReplay_io_replay_1_bits_uop_ctrl_fuOpType; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_replay_1_bits_uop_ctrl_rfWen; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_replay_1_bits_uop_ctrl_fpWen; // @[LoadQueue.scala 135:31]
  wire [5:0] loadQueueReplay_io_replay_1_bits_uop_pdest; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_replay_1_bits_uop_robIdx_flag; // @[LoadQueue.scala 135:31]
  wire [4:0] loadQueueReplay_io_replay_1_bits_uop_robIdx_value; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_replay_1_bits_uop_lqIdx_flag; // @[LoadQueue.scala 135:31]
  wire [3:0] loadQueueReplay_io_replay_1_bits_uop_lqIdx_value; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_replay_1_bits_uop_sqIdx_flag; // @[LoadQueue.scala 135:31]
  wire [3:0] loadQueueReplay_io_replay_1_bits_uop_sqIdx_value; // @[LoadQueue.scala 135:31]
  wire [38:0] loadQueueReplay_io_replay_1_bits_vaddr; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_replay_1_bits_isFirstIssue; // @[LoadQueue.scala 135:31]
  wire [7:0] loadQueueReplay_io_replay_1_bits_replayCarry_real_way_en; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_replay_1_bits_replayCarry_valid; // @[LoadQueue.scala 135:31]
  wire [1:0] loadQueueReplay_io_replay_1_bits_mshrid; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_replay_1_bits_forward_tlDchannel; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_replay_1_bits_rarAllocated; // @[LoadQueue.scala 135:31]
  wire [3:0] loadQueueReplay_io_replay_1_bits_rarIndex; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_replay_1_bits_rawAllocated; // @[LoadQueue.scala 135:31]
  wire [2:0] loadQueueReplay_io_replay_1_bits_rawIndex; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_refill_valid; // @[LoadQueue.scala 135:31]
  wire [1:0] loadQueueReplay_io_refill_bits_id; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_stAddrReadySqPtr_flag; // @[LoadQueue.scala 135:31]
  wire [3:0] loadQueueReplay_io_stAddrReadySqPtr_value; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_stDataReadySqPtr_flag; // @[LoadQueue.scala 135:31]
  wire [3:0] loadQueueReplay_io_stDataReadySqPtr_value; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_sqEmpty; // @[LoadQueue.scala 135:31]
  wire  loadQueueReplay_io_lqFull; // @[LoadQueue.scala 135:31]
  wire [5:0] loadQueueReplay_io_tlbReplayDelayCycleCtrl_0; // @[LoadQueue.scala 135:31]
  wire [5:0] loadQueueReplay_io_tlbReplayDelayCycleCtrl_1; // @[LoadQueue.scala 135:31]
  wire [5:0] loadQueueReplay_io_tlbReplayDelayCycleCtrl_2; // @[LoadQueue.scala 135:31]
  wire [5:0] loadQueueReplay_io_tlbReplayDelayCycleCtrl_3; // @[LoadQueue.scala 135:31]
  wire [5:0] loadQueueReplay_io_perf_0_value; // @[LoadQueue.scala 135:31]
  wire [5:0] loadQueueReplay_io_perf_1_value; // @[LoadQueue.scala 135:31]
  wire [5:0] loadQueueReplay_io_perf_2_value; // @[LoadQueue.scala 135:31]
  wire [5:0] loadQueueReplay_io_perf_3_value; // @[LoadQueue.scala 135:31]
  wire [5:0] loadQueueReplay_io_perf_4_value; // @[LoadQueue.scala 135:31]
  wire [5:0] loadQueueReplay_io_perf_5_value; // @[LoadQueue.scala 135:31]
  wire [5:0] loadQueueReplay_io_perf_6_value; // @[LoadQueue.scala 135:31]
  wire [5:0] loadQueueReplay_io_perf_7_value; // @[LoadQueue.scala 135:31]
  wire [5:0] loadQueueReplay_io_perf_8_value; // @[LoadQueue.scala 135:31]
  wire [5:0] loadQueueReplay_io_perf_9_value; // @[LoadQueue.scala 135:31]
  wire [5:0] loadQueueReplay_io_perf_10_value; // @[LoadQueue.scala 135:31]
  wire [5:0] loadQueueReplay_io_perf_11_value; // @[LoadQueue.scala 135:31]
  wire  loadQueueFlag_clock; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_reset; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_redirect_valid; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_redirect_bits_robIdx_flag; // @[LoadQueue.scala 136:29]
  wire [4:0] loadQueueFlag_io_redirect_bits_robIdx_value; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_redirect_bits_level; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_enq_canAccept; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_enq_sqCanAccept; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_enq_req_0_valid; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_enq_req_0_bits_cf_trigger_backendEn_1; // @[LoadQueue.scala 136:29]
  wire [6:0] loadQueueFlag_io_enq_req_0_bits_ctrl_fuOpType; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_enq_req_0_bits_ctrl_rfWen; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_enq_req_0_bits_ctrl_fpWen; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_enq_req_0_bits_ctrl_flushPipe; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_enq_req_0_bits_ctrl_replayInst; // @[LoadQueue.scala 136:29]
  wire [5:0] loadQueueFlag_io_enq_req_0_bits_pdest; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_enq_req_0_bits_robIdx_flag; // @[LoadQueue.scala 136:29]
  wire [4:0] loadQueueFlag_io_enq_req_0_bits_robIdx_value; // @[LoadQueue.scala 136:29]
  wire [3:0] loadQueueFlag_io_enq_req_0_bits_lqIdx_value; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_enq_req_1_valid; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_enq_req_1_bits_cf_trigger_backendEn_1; // @[LoadQueue.scala 136:29]
  wire [6:0] loadQueueFlag_io_enq_req_1_bits_ctrl_fuOpType; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_enq_req_1_bits_ctrl_rfWen; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_enq_req_1_bits_ctrl_fpWen; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_enq_req_1_bits_ctrl_flushPipe; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_enq_req_1_bits_ctrl_replayInst; // @[LoadQueue.scala 136:29]
  wire [5:0] loadQueueFlag_io_enq_req_1_bits_pdest; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_enq_req_1_bits_robIdx_flag; // @[LoadQueue.scala 136:29]
  wire [4:0] loadQueueFlag_io_enq_req_1_bits_robIdx_value; // @[LoadQueue.scala 136:29]
  wire [3:0] loadQueueFlag_io_enq_req_1_bits_lqIdx_value; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_enq_req_2_valid; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_enq_req_2_bits_cf_trigger_backendEn_1; // @[LoadQueue.scala 136:29]
  wire [6:0] loadQueueFlag_io_enq_req_2_bits_ctrl_fuOpType; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_enq_req_2_bits_ctrl_rfWen; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_enq_req_2_bits_ctrl_fpWen; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_enq_req_2_bits_ctrl_flushPipe; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_enq_req_2_bits_ctrl_replayInst; // @[LoadQueue.scala 136:29]
  wire [5:0] loadQueueFlag_io_enq_req_2_bits_pdest; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_enq_req_2_bits_robIdx_flag; // @[LoadQueue.scala 136:29]
  wire [4:0] loadQueueFlag_io_enq_req_2_bits_robIdx_value; // @[LoadQueue.scala 136:29]
  wire [3:0] loadQueueFlag_io_enq_req_2_bits_lqIdx_value; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_enq_req_3_valid; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_enq_req_3_bits_cf_trigger_backendEn_1; // @[LoadQueue.scala 136:29]
  wire [6:0] loadQueueFlag_io_enq_req_3_bits_ctrl_fuOpType; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_enq_req_3_bits_ctrl_rfWen; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_enq_req_3_bits_ctrl_fpWen; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_enq_req_3_bits_ctrl_flushPipe; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_enq_req_3_bits_ctrl_replayInst; // @[LoadQueue.scala 136:29]
  wire [5:0] loadQueueFlag_io_enq_req_3_bits_pdest; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_enq_req_3_bits_robIdx_flag; // @[LoadQueue.scala 136:29]
  wire [4:0] loadQueueFlag_io_enq_req_3_bits_robIdx_value; // @[LoadQueue.scala 136:29]
  wire [3:0] loadQueueFlag_io_enq_req_3_bits_lqIdx_value; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadIn_0_valid; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadIn_0_bits_uop_cf_exceptionVec_4; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadIn_0_bits_uop_cf_exceptionVec_5; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadIn_0_bits_uop_cf_exceptionVec_13; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadIn_0_bits_uop_cf_trigger_backendEn_1; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadIn_0_bits_uop_cf_trigger_backendHit_0; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadIn_0_bits_uop_cf_trigger_backendHit_1; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadIn_0_bits_uop_cf_trigger_backendHit_4; // @[LoadQueue.scala 136:29]
  wire [6:0] loadQueueFlag_io_loadIn_0_bits_uop_ctrl_fuOpType; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadIn_0_bits_uop_ctrl_rfWen; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadIn_0_bits_uop_ctrl_fpWen; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadIn_0_bits_uop_ctrl_replayInst; // @[LoadQueue.scala 136:29]
  wire [5:0] loadQueueFlag_io_loadIn_0_bits_uop_pdest; // @[LoadQueue.scala 136:29]
  wire [4:0] loadQueueFlag_io_loadIn_0_bits_uop_robIdx_value; // @[LoadQueue.scala 136:29]
  wire [3:0] loadQueueFlag_io_loadIn_0_bits_uop_lqIdx_value; // @[LoadQueue.scala 136:29]
  wire [38:0] loadQueueFlag_io_loadIn_0_bits_vaddr; // @[LoadQueue.scala 136:29]
  wire [35:0] loadQueueFlag_io_loadIn_0_bits_paddr; // @[LoadQueue.scala 136:29]
  wire [15:0] loadQueueFlag_io_loadIn_0_bits_mask; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadIn_0_bits_miss; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadIn_0_bits_tlbMiss; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadIn_0_bits_mmio; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadIn_0_bits_replayInfo_cause_0; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadIn_0_bits_replayInfo_cause_1; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadIn_0_bits_replayInfo_cause_2; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadIn_0_bits_replayInfo_cause_3; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadIn_0_bits_replayInfo_cause_4; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadIn_0_bits_replayInfo_cause_5; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadIn_0_bits_replayInfo_cause_6; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadIn_0_bits_replayInfo_cause_7; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadIn_0_bits_lqDataWenDup_1; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadIn_0_bits_lqDataWenDup_2; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadIn_0_bits_lqDataWenDup_3; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadIn_0_bits_lqDataWenDup_5; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadIn_1_valid; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadIn_1_bits_uop_cf_exceptionVec_4; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadIn_1_bits_uop_cf_exceptionVec_5; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadIn_1_bits_uop_cf_exceptionVec_13; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadIn_1_bits_uop_cf_trigger_backendEn_1; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadIn_1_bits_uop_cf_trigger_backendHit_0; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadIn_1_bits_uop_cf_trigger_backendHit_1; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadIn_1_bits_uop_cf_trigger_backendHit_4; // @[LoadQueue.scala 136:29]
  wire [6:0] loadQueueFlag_io_loadIn_1_bits_uop_ctrl_fuOpType; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadIn_1_bits_uop_ctrl_rfWen; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadIn_1_bits_uop_ctrl_fpWen; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadIn_1_bits_uop_ctrl_replayInst; // @[LoadQueue.scala 136:29]
  wire [5:0] loadQueueFlag_io_loadIn_1_bits_uop_pdest; // @[LoadQueue.scala 136:29]
  wire [4:0] loadQueueFlag_io_loadIn_1_bits_uop_robIdx_value; // @[LoadQueue.scala 136:29]
  wire [3:0] loadQueueFlag_io_loadIn_1_bits_uop_lqIdx_value; // @[LoadQueue.scala 136:29]
  wire [38:0] loadQueueFlag_io_loadIn_1_bits_vaddr; // @[LoadQueue.scala 136:29]
  wire [35:0] loadQueueFlag_io_loadIn_1_bits_paddr; // @[LoadQueue.scala 136:29]
  wire [15:0] loadQueueFlag_io_loadIn_1_bits_mask; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadIn_1_bits_miss; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadIn_1_bits_tlbMiss; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadIn_1_bits_mmio; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadIn_1_bits_replayInfo_cause_0; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadIn_1_bits_replayInfo_cause_1; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadIn_1_bits_replayInfo_cause_2; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadIn_1_bits_replayInfo_cause_3; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadIn_1_bits_replayInfo_cause_4; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadIn_1_bits_replayInfo_cause_5; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadIn_1_bits_replayInfo_cause_6; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadIn_1_bits_replayInfo_cause_7; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadIn_1_bits_lqDataWenDup_1; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadIn_1_bits_lqDataWenDup_2; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadIn_1_bits_lqDataWenDup_3; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadIn_1_bits_lqDataWenDup_5; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadOut_0_ready; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadOut_0_valid; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadOut_0_bits_uop_cf_exceptionVec_4; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadOut_0_bits_uop_cf_exceptionVec_5; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadOut_0_bits_uop_cf_exceptionVec_13; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadOut_0_bits_uop_cf_trigger_backendEn_1; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadOut_0_bits_uop_cf_trigger_backendHit_0; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadOut_0_bits_uop_cf_trigger_backendHit_1; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadOut_0_bits_uop_cf_trigger_backendHit_4; // @[LoadQueue.scala 136:29]
  wire [6:0] loadQueueFlag_io_loadOut_0_bits_uop_ctrl_fuOpType; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadOut_0_bits_uop_ctrl_rfWen; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadOut_0_bits_uop_ctrl_fpWen; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadOut_0_bits_uop_ctrl_flushPipe; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadOut_0_bits_uop_ctrl_replayInst; // @[LoadQueue.scala 136:29]
  wire [5:0] loadQueueFlag_io_loadOut_0_bits_uop_pdest; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_loadOut_0_bits_uop_robIdx_flag; // @[LoadQueue.scala 136:29]
  wire [4:0] loadQueueFlag_io_loadOut_0_bits_uop_robIdx_value; // @[LoadQueue.scala 136:29]
  wire [63:0] loadQueueFlag_io_ldRawDataOut_0_lqData; // @[LoadQueue.scala 136:29]
  wire [6:0] loadQueueFlag_io_ldRawDataOut_0_uop_ctrl_fuOpType; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_ldRawDataOut_0_uop_ctrl_fpWen; // @[LoadQueue.scala 136:29]
  wire [2:0] loadQueueFlag_io_ldRawDataOut_0_addrOffset; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_rob_pendingld; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_rob_commit; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_rob_isMMIO_0; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_rob_isMMIO_1; // @[LoadQueue.scala 136:29]
  wire [4:0] loadQueueFlag_io_rob_uop_0_robIdx_value; // @[LoadQueue.scala 136:29]
  wire [4:0] loadQueueFlag_io_rob_uop_1_robIdx_value; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_uncache_req_ready; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_uncache_req_valid; // @[LoadQueue.scala 136:29]
  wire [35:0] loadQueueFlag_io_uncache_req_bits_addr; // @[LoadQueue.scala 136:29]
  wire [7:0] loadQueueFlag_io_uncache_req_bits_mask; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_uncache_resp_ready; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_uncache_resp_valid; // @[LoadQueue.scala 136:29]
  wire [63:0] loadQueueFlag_io_uncache_resp_bits_data; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_trigger_0_hitLoadAddrTriggerHitVec_0; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_trigger_0_hitLoadAddrTriggerHitVec_1; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_trigger_0_hitLoadAddrTriggerHitVec_2; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_trigger_0_lqLoadAddrTriggerHitVec_0; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_trigger_0_lqLoadAddrTriggerHitVec_1; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_trigger_0_lqLoadAddrTriggerHitVec_2; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_trigger_1_hitLoadAddrTriggerHitVec_0; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_trigger_1_hitLoadAddrTriggerHitVec_1; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_trigger_1_hitLoadAddrTriggerHitVec_2; // @[LoadQueue.scala 136:29]
  wire [38:0] loadQueueFlag_io_exceptionAddr_vaddr; // @[LoadQueue.scala 136:29]
  wire  loadQueueFlag_io_ldIssuePtr_flag; // @[LoadQueue.scala 136:29]
  wire [3:0] loadQueueFlag_io_ldIssuePtr_value; // @[LoadQueue.scala 136:29]
  wire [1:0] loadQueueFlag_io_lqDeq; // @[LoadQueue.scala 136:29]
  wire [4:0] loadQueueFlag_io_lqCancelCnt; // @[LoadQueue.scala 136:29]
  wire [5:0] loadQueueFlag_io_perf_0_value; // @[LoadQueue.scala 136:29]
  wire [5:0] loadQueueFlag_io_perf_1_value; // @[LoadQueue.scala 136:29]
  wire [5:0] loadQueueFlag_io_perf_2_value; // @[LoadQueue.scala 136:29]
  wire [5:0] loadQueueFlag_io_perf_3_value; // @[LoadQueue.scala 136:29]
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
  LoadQueueRAR loadQueueRAR ( // @[LoadQueue.scala 133:28]
    .clock(loadQueueRAR_clock),
    .reset(loadQueueRAR_reset),
    .io_redirect_valid(loadQueueRAR_io_redirect_valid),
    .io_redirect_bits_robIdx_flag(loadQueueRAR_io_redirect_bits_robIdx_flag),
    .io_redirect_bits_robIdx_value(loadQueueRAR_io_redirect_bits_robIdx_value),
    .io_redirect_bits_level(loadQueueRAR_io_redirect_bits_level),
    .io_query_0_req_valid(loadQueueRAR_io_query_0_req_valid),
    .io_query_0_req_bits_uop_robIdx_flag(loadQueueRAR_io_query_0_req_bits_uop_robIdx_flag),
    .io_query_0_req_bits_uop_robIdx_value(loadQueueRAR_io_query_0_req_bits_uop_robIdx_value),
    .io_query_0_req_bits_uop_lqIdx_flag(loadQueueRAR_io_query_0_req_bits_uop_lqIdx_flag),
    .io_query_0_req_bits_uop_lqIdx_value(loadQueueRAR_io_query_0_req_bits_uop_lqIdx_value),
    .io_query_0_req_bits_index(loadQueueRAR_io_query_0_req_bits_index),
    .io_query_0_req_bits_allocated(loadQueueRAR_io_query_0_req_bits_allocated),
    .io_query_0_req_bits_datavalid(loadQueueRAR_io_query_0_req_bits_datavalid),
    .io_query_0_req_bits_miss(loadQueueRAR_io_query_0_req_bits_miss),
    .io_query_0_req_bits_paddr(loadQueueRAR_io_query_0_req_bits_paddr),
    .io_query_0_resp_valid(loadQueueRAR_io_query_0_resp_valid),
    .io_query_0_resp_bits_index(loadQueueRAR_io_query_0_resp_bits_index),
    .io_query_0_resp_bits_canAccept(loadQueueRAR_io_query_0_resp_bits_canAccept),
    .io_query_0_resp_bits_allocated(loadQueueRAR_io_query_0_resp_bits_allocated),
    .io_query_0_resp_bits_replayFromFetch(loadQueueRAR_io_query_0_resp_bits_replayFromFetch),
    .io_query_1_req_valid(loadQueueRAR_io_query_1_req_valid),
    .io_query_1_req_bits_uop_robIdx_flag(loadQueueRAR_io_query_1_req_bits_uop_robIdx_flag),
    .io_query_1_req_bits_uop_robIdx_value(loadQueueRAR_io_query_1_req_bits_uop_robIdx_value),
    .io_query_1_req_bits_uop_lqIdx_flag(loadQueueRAR_io_query_1_req_bits_uop_lqIdx_flag),
    .io_query_1_req_bits_uop_lqIdx_value(loadQueueRAR_io_query_1_req_bits_uop_lqIdx_value),
    .io_query_1_req_bits_index(loadQueueRAR_io_query_1_req_bits_index),
    .io_query_1_req_bits_allocated(loadQueueRAR_io_query_1_req_bits_allocated),
    .io_query_1_req_bits_datavalid(loadQueueRAR_io_query_1_req_bits_datavalid),
    .io_query_1_req_bits_miss(loadQueueRAR_io_query_1_req_bits_miss),
    .io_query_1_req_bits_paddr(loadQueueRAR_io_query_1_req_bits_paddr),
    .io_query_1_resp_valid(loadQueueRAR_io_query_1_resp_valid),
    .io_query_1_resp_bits_index(loadQueueRAR_io_query_1_resp_bits_index),
    .io_query_1_resp_bits_canAccept(loadQueueRAR_io_query_1_resp_bits_canAccept),
    .io_query_1_resp_bits_allocated(loadQueueRAR_io_query_1_resp_bits_allocated),
    .io_query_1_resp_bits_replayFromFetch(loadQueueRAR_io_query_1_resp_bits_replayFromFetch),
    .io_release_valid(loadQueueRAR_io_release_valid),
    .io_release_bits_paddr(loadQueueRAR_io_release_bits_paddr),
    .io_ldIssuePtr_flag(loadQueueRAR_io_ldIssuePtr_flag),
    .io_ldIssuePtr_value(loadQueueRAR_io_ldIssuePtr_value),
    .io_perf_0_value(loadQueueRAR_io_perf_0_value),
    .io_perf_1_value(loadQueueRAR_io_perf_1_value),
    .io_perf_2_value(loadQueueRAR_io_perf_2_value)
  );
  LoadQueueRAW loadQueueRAW ( // @[LoadQueue.scala 134:28]
    .clock(loadQueueRAW_clock),
    .reset(loadQueueRAW_reset),
    .io_redirect_valid(loadQueueRAW_io_redirect_valid),
    .io_redirect_bits_robIdx_flag(loadQueueRAW_io_redirect_bits_robIdx_flag),
    .io_redirect_bits_robIdx_value(loadQueueRAW_io_redirect_bits_robIdx_value),
    .io_redirect_bits_level(loadQueueRAW_io_redirect_bits_level),
    .io_query_0_req_valid(loadQueueRAW_io_query_0_req_valid),
    .io_query_0_req_bits_uop_cf_foldpc(loadQueueRAW_io_query_0_req_bits_uop_cf_foldpc),
    .io_query_0_req_bits_uop_cf_ftqPtr_flag(loadQueueRAW_io_query_0_req_bits_uop_cf_ftqPtr_flag),
    .io_query_0_req_bits_uop_cf_ftqPtr_value(loadQueueRAW_io_query_0_req_bits_uop_cf_ftqPtr_value),
    .io_query_0_req_bits_uop_cf_ftqOffset(loadQueueRAW_io_query_0_req_bits_uop_cf_ftqOffset),
    .io_query_0_req_bits_uop_robIdx_flag(loadQueueRAW_io_query_0_req_bits_uop_robIdx_flag),
    .io_query_0_req_bits_uop_robIdx_value(loadQueueRAW_io_query_0_req_bits_uop_robIdx_value),
    .io_query_0_req_bits_uop_sqIdx_flag(loadQueueRAW_io_query_0_req_bits_uop_sqIdx_flag),
    .io_query_0_req_bits_uop_sqIdx_value(loadQueueRAW_io_query_0_req_bits_uop_sqIdx_value),
    .io_query_0_req_bits_index(loadQueueRAW_io_query_0_req_bits_index),
    .io_query_0_req_bits_allocated(loadQueueRAW_io_query_0_req_bits_allocated),
    .io_query_0_req_bits_datavalid(loadQueueRAW_io_query_0_req_bits_datavalid),
    .io_query_0_req_bits_mask(loadQueueRAW_io_query_0_req_bits_mask),
    .io_query_0_req_bits_paddr(loadQueueRAW_io_query_0_req_bits_paddr),
    .io_query_0_resp_bits_index(loadQueueRAW_io_query_0_resp_bits_index),
    .io_query_0_resp_bits_canAccept(loadQueueRAW_io_query_0_resp_bits_canAccept),
    .io_query_0_resp_bits_allocated(loadQueueRAW_io_query_0_resp_bits_allocated),
    .io_query_1_req_valid(loadQueueRAW_io_query_1_req_valid),
    .io_query_1_req_bits_uop_cf_foldpc(loadQueueRAW_io_query_1_req_bits_uop_cf_foldpc),
    .io_query_1_req_bits_uop_cf_ftqPtr_flag(loadQueueRAW_io_query_1_req_bits_uop_cf_ftqPtr_flag),
    .io_query_1_req_bits_uop_cf_ftqPtr_value(loadQueueRAW_io_query_1_req_bits_uop_cf_ftqPtr_value),
    .io_query_1_req_bits_uop_cf_ftqOffset(loadQueueRAW_io_query_1_req_bits_uop_cf_ftqOffset),
    .io_query_1_req_bits_uop_robIdx_flag(loadQueueRAW_io_query_1_req_bits_uop_robIdx_flag),
    .io_query_1_req_bits_uop_robIdx_value(loadQueueRAW_io_query_1_req_bits_uop_robIdx_value),
    .io_query_1_req_bits_uop_sqIdx_flag(loadQueueRAW_io_query_1_req_bits_uop_sqIdx_flag),
    .io_query_1_req_bits_uop_sqIdx_value(loadQueueRAW_io_query_1_req_bits_uop_sqIdx_value),
    .io_query_1_req_bits_index(loadQueueRAW_io_query_1_req_bits_index),
    .io_query_1_req_bits_allocated(loadQueueRAW_io_query_1_req_bits_allocated),
    .io_query_1_req_bits_datavalid(loadQueueRAW_io_query_1_req_bits_datavalid),
    .io_query_1_req_bits_mask(loadQueueRAW_io_query_1_req_bits_mask),
    .io_query_1_req_bits_paddr(loadQueueRAW_io_query_1_req_bits_paddr),
    .io_query_1_resp_bits_index(loadQueueRAW_io_query_1_resp_bits_index),
    .io_query_1_resp_bits_canAccept(loadQueueRAW_io_query_1_resp_bits_canAccept),
    .io_query_1_resp_bits_allocated(loadQueueRAW_io_query_1_resp_bits_allocated),
    .io_storeIn_0_valid(loadQueueRAW_io_storeIn_0_valid),
    .io_storeIn_0_bits_uop_cf_ftqPtr_value(loadQueueRAW_io_storeIn_0_bits_uop_cf_ftqPtr_value),
    .io_storeIn_0_bits_uop_cf_ftqOffset(loadQueueRAW_io_storeIn_0_bits_uop_cf_ftqOffset),
    .io_storeIn_0_bits_uop_robIdx_flag(loadQueueRAW_io_storeIn_0_bits_uop_robIdx_flag),
    .io_storeIn_0_bits_uop_robIdx_value(loadQueueRAW_io_storeIn_0_bits_uop_robIdx_value),
    .io_storeIn_0_bits_paddr(loadQueueRAW_io_storeIn_0_bits_paddr),
    .io_storeIn_0_bits_mask(loadQueueRAW_io_storeIn_0_bits_mask),
    .io_storeIn_0_bits_miss(loadQueueRAW_io_storeIn_0_bits_miss),
    .io_storeIn_1_valid(loadQueueRAW_io_storeIn_1_valid),
    .io_storeIn_1_bits_uop_cf_ftqPtr_value(loadQueueRAW_io_storeIn_1_bits_uop_cf_ftqPtr_value),
    .io_storeIn_1_bits_uop_cf_ftqOffset(loadQueueRAW_io_storeIn_1_bits_uop_cf_ftqOffset),
    .io_storeIn_1_bits_uop_robIdx_flag(loadQueueRAW_io_storeIn_1_bits_uop_robIdx_flag),
    .io_storeIn_1_bits_uop_robIdx_value(loadQueueRAW_io_storeIn_1_bits_uop_robIdx_value),
    .io_storeIn_1_bits_paddr(loadQueueRAW_io_storeIn_1_bits_paddr),
    .io_storeIn_1_bits_mask(loadQueueRAW_io_storeIn_1_bits_mask),
    .io_storeIn_1_bits_miss(loadQueueRAW_io_storeIn_1_bits_miss),
    .io_rollback_valid(loadQueueRAW_io_rollback_valid),
    .io_rollback_bits_robIdx_flag(loadQueueRAW_io_rollback_bits_robIdx_flag),
    .io_rollback_bits_robIdx_value(loadQueueRAW_io_rollback_bits_robIdx_value),
    .io_rollback_bits_ftqIdx_flag(loadQueueRAW_io_rollback_bits_ftqIdx_flag),
    .io_rollback_bits_ftqIdx_value(loadQueueRAW_io_rollback_bits_ftqIdx_value),
    .io_rollback_bits_ftqOffset(loadQueueRAW_io_rollback_bits_ftqOffset),
    .io_rollback_bits_stFtqIdx_value(loadQueueRAW_io_rollback_bits_stFtqIdx_value),
    .io_rollback_bits_stFtqOffset(loadQueueRAW_io_rollback_bits_stFtqOffset),
    .io_correctTableUpdate_valid(loadQueueRAW_io_correctTableUpdate_valid),
    .io_correctTableUpdate_bits_addr(loadQueueRAW_io_correctTableUpdate_bits_addr),
    .io_stAddrReadySqPtr_flag(loadQueueRAW_io_stAddrReadySqPtr_flag),
    .io_stAddrReadySqPtr_value(loadQueueRAW_io_stAddrReadySqPtr_value),
    .io_perf_0_value(loadQueueRAW_io_perf_0_value),
    .io_perf_1_value(loadQueueRAW_io_perf_1_value),
    .io_perf_2_value(loadQueueRAW_io_perf_2_value)
  );
  LoadQueueReplay loadQueueReplay ( // @[LoadQueue.scala 135:31]
    .clock(loadQueueReplay_clock),
    .reset(loadQueueReplay_reset),
    .io_redirect_valid(loadQueueReplay_io_redirect_valid),
    .io_redirect_bits_robIdx_flag(loadQueueReplay_io_redirect_bits_robIdx_flag),
    .io_redirect_bits_robIdx_value(loadQueueReplay_io_redirect_bits_robIdx_value),
    .io_redirect_bits_level(loadQueueReplay_io_redirect_bits_level),
    .io_enq_0_valid(loadQueueReplay_io_enq_0_valid),
    .io_enq_0_bits_uop_cf_foldpc(loadQueueReplay_io_enq_0_bits_uop_cf_foldpc),
    .io_enq_0_bits_uop_cf_exceptionVec_4(loadQueueReplay_io_enq_0_bits_uop_cf_exceptionVec_4),
    .io_enq_0_bits_uop_cf_exceptionVec_5(loadQueueReplay_io_enq_0_bits_uop_cf_exceptionVec_5),
    .io_enq_0_bits_uop_cf_exceptionVec_13(loadQueueReplay_io_enq_0_bits_uop_cf_exceptionVec_13),
    .io_enq_0_bits_uop_cf_trigger_backendEn_1(loadQueueReplay_io_enq_0_bits_uop_cf_trigger_backendEn_1),
    .io_enq_0_bits_uop_cf_trigger_backendHit_0(loadQueueReplay_io_enq_0_bits_uop_cf_trigger_backendHit_0),
    .io_enq_0_bits_uop_cf_trigger_backendHit_1(loadQueueReplay_io_enq_0_bits_uop_cf_trigger_backendHit_1),
    .io_enq_0_bits_uop_cf_trigger_backendHit_4(loadQueueReplay_io_enq_0_bits_uop_cf_trigger_backendHit_4),
    .io_enq_0_bits_uop_cf_waitForRobIdx_flag(loadQueueReplay_io_enq_0_bits_uop_cf_waitForRobIdx_flag),
    .io_enq_0_bits_uop_cf_waitForRobIdx_value(loadQueueReplay_io_enq_0_bits_uop_cf_waitForRobIdx_value),
    .io_enq_0_bits_uop_cf_loadWaitBit(loadQueueReplay_io_enq_0_bits_uop_cf_loadWaitBit),
    .io_enq_0_bits_uop_cf_loadWaitStrict(loadQueueReplay_io_enq_0_bits_uop_cf_loadWaitStrict),
    .io_enq_0_bits_uop_cf_ftqPtr_flag(loadQueueReplay_io_enq_0_bits_uop_cf_ftqPtr_flag),
    .io_enq_0_bits_uop_cf_ftqPtr_value(loadQueueReplay_io_enq_0_bits_uop_cf_ftqPtr_value),
    .io_enq_0_bits_uop_cf_ftqOffset(loadQueueReplay_io_enq_0_bits_uop_cf_ftqOffset),
    .io_enq_0_bits_uop_ctrl_fuType(loadQueueReplay_io_enq_0_bits_uop_ctrl_fuType),
    .io_enq_0_bits_uop_ctrl_fuOpType(loadQueueReplay_io_enq_0_bits_uop_ctrl_fuOpType),
    .io_enq_0_bits_uop_ctrl_rfWen(loadQueueReplay_io_enq_0_bits_uop_ctrl_rfWen),
    .io_enq_0_bits_uop_ctrl_fpWen(loadQueueReplay_io_enq_0_bits_uop_ctrl_fpWen),
    .io_enq_0_bits_uop_pdest(loadQueueReplay_io_enq_0_bits_uop_pdest),
    .io_enq_0_bits_uop_robIdx_flag(loadQueueReplay_io_enq_0_bits_uop_robIdx_flag),
    .io_enq_0_bits_uop_robIdx_value(loadQueueReplay_io_enq_0_bits_uop_robIdx_value),
    .io_enq_0_bits_uop_lqIdx_flag(loadQueueReplay_io_enq_0_bits_uop_lqIdx_flag),
    .io_enq_0_bits_uop_lqIdx_value(loadQueueReplay_io_enq_0_bits_uop_lqIdx_value),
    .io_enq_0_bits_uop_sqIdx_flag(loadQueueReplay_io_enq_0_bits_uop_sqIdx_flag),
    .io_enq_0_bits_uop_sqIdx_value(loadQueueReplay_io_enq_0_bits_uop_sqIdx_value),
    .io_enq_0_bits_vaddr(loadQueueReplay_io_enq_0_bits_vaddr),
    .io_enq_0_bits_tlbMiss(loadQueueReplay_io_enq_0_bits_tlbMiss),
    .io_enq_0_bits_rarAllocated(loadQueueReplay_io_enq_0_bits_rarAllocated),
    .io_enq_0_bits_rarIndex(loadQueueReplay_io_enq_0_bits_rarIndex),
    .io_enq_0_bits_rawAllocated(loadQueueReplay_io_enq_0_bits_rawAllocated),
    .io_enq_0_bits_rawIndex(loadQueueReplay_io_enq_0_bits_rawIndex),
    .io_enq_0_bits_replayInfo_missMSHRId(loadQueueReplay_io_enq_0_bits_replayInfo_missMSHRId),
    .io_enq_0_bits_replayInfo_canForwardFullData(loadQueueReplay_io_enq_0_bits_replayInfo_canForwardFullData),
    .io_enq_0_bits_replayInfo_dataInvalidSqIdx_flag(loadQueueReplay_io_enq_0_bits_replayInfo_dataInvalidSqIdx_flag),
    .io_enq_0_bits_replayInfo_dataInvalidSqIdx_value(loadQueueReplay_io_enq_0_bits_replayInfo_dataInvalidSqIdx_value),
    .io_enq_0_bits_replayInfo_addrInvalidSqIdx_flag(loadQueueReplay_io_enq_0_bits_replayInfo_addrInvalidSqIdx_flag),
    .io_enq_0_bits_replayInfo_addrInvalidSqIdx_value(loadQueueReplay_io_enq_0_bits_replayInfo_addrInvalidSqIdx_value),
    .io_enq_0_bits_replayInfo_replayCarry_real_way_en(loadQueueReplay_io_enq_0_bits_replayInfo_replayCarry_real_way_en),
    .io_enq_0_bits_replayInfo_replayCarry_valid(loadQueueReplay_io_enq_0_bits_replayInfo_replayCarry_valid),
    .io_enq_0_bits_replayInfo_dataInLastBeat(loadQueueReplay_io_enq_0_bits_replayInfo_dataInLastBeat),
    .io_enq_0_bits_replayInfo_cause_0(loadQueueReplay_io_enq_0_bits_replayInfo_cause_0),
    .io_enq_0_bits_replayInfo_cause_1(loadQueueReplay_io_enq_0_bits_replayInfo_cause_1),
    .io_enq_0_bits_replayInfo_cause_2(loadQueueReplay_io_enq_0_bits_replayInfo_cause_2),
    .io_enq_0_bits_replayInfo_cause_3(loadQueueReplay_io_enq_0_bits_replayInfo_cause_3),
    .io_enq_0_bits_replayInfo_cause_4(loadQueueReplay_io_enq_0_bits_replayInfo_cause_4),
    .io_enq_0_bits_replayInfo_cause_5(loadQueueReplay_io_enq_0_bits_replayInfo_cause_5),
    .io_enq_0_bits_replayInfo_cause_6(loadQueueReplay_io_enq_0_bits_replayInfo_cause_6),
    .io_enq_0_bits_replayInfo_cause_7(loadQueueReplay_io_enq_0_bits_replayInfo_cause_7),
    .io_enq_1_valid(loadQueueReplay_io_enq_1_valid),
    .io_enq_1_bits_uop_cf_foldpc(loadQueueReplay_io_enq_1_bits_uop_cf_foldpc),
    .io_enq_1_bits_uop_cf_exceptionVec_4(loadQueueReplay_io_enq_1_bits_uop_cf_exceptionVec_4),
    .io_enq_1_bits_uop_cf_exceptionVec_5(loadQueueReplay_io_enq_1_bits_uop_cf_exceptionVec_5),
    .io_enq_1_bits_uop_cf_exceptionVec_13(loadQueueReplay_io_enq_1_bits_uop_cf_exceptionVec_13),
    .io_enq_1_bits_uop_cf_trigger_backendEn_1(loadQueueReplay_io_enq_1_bits_uop_cf_trigger_backendEn_1),
    .io_enq_1_bits_uop_cf_trigger_backendHit_0(loadQueueReplay_io_enq_1_bits_uop_cf_trigger_backendHit_0),
    .io_enq_1_bits_uop_cf_trigger_backendHit_1(loadQueueReplay_io_enq_1_bits_uop_cf_trigger_backendHit_1),
    .io_enq_1_bits_uop_cf_trigger_backendHit_4(loadQueueReplay_io_enq_1_bits_uop_cf_trigger_backendHit_4),
    .io_enq_1_bits_uop_cf_waitForRobIdx_flag(loadQueueReplay_io_enq_1_bits_uop_cf_waitForRobIdx_flag),
    .io_enq_1_bits_uop_cf_waitForRobIdx_value(loadQueueReplay_io_enq_1_bits_uop_cf_waitForRobIdx_value),
    .io_enq_1_bits_uop_cf_loadWaitBit(loadQueueReplay_io_enq_1_bits_uop_cf_loadWaitBit),
    .io_enq_1_bits_uop_cf_loadWaitStrict(loadQueueReplay_io_enq_1_bits_uop_cf_loadWaitStrict),
    .io_enq_1_bits_uop_cf_ftqPtr_flag(loadQueueReplay_io_enq_1_bits_uop_cf_ftqPtr_flag),
    .io_enq_1_bits_uop_cf_ftqPtr_value(loadQueueReplay_io_enq_1_bits_uop_cf_ftqPtr_value),
    .io_enq_1_bits_uop_cf_ftqOffset(loadQueueReplay_io_enq_1_bits_uop_cf_ftqOffset),
    .io_enq_1_bits_uop_ctrl_fuType(loadQueueReplay_io_enq_1_bits_uop_ctrl_fuType),
    .io_enq_1_bits_uop_ctrl_fuOpType(loadQueueReplay_io_enq_1_bits_uop_ctrl_fuOpType),
    .io_enq_1_bits_uop_ctrl_rfWen(loadQueueReplay_io_enq_1_bits_uop_ctrl_rfWen),
    .io_enq_1_bits_uop_ctrl_fpWen(loadQueueReplay_io_enq_1_bits_uop_ctrl_fpWen),
    .io_enq_1_bits_uop_pdest(loadQueueReplay_io_enq_1_bits_uop_pdest),
    .io_enq_1_bits_uop_robIdx_flag(loadQueueReplay_io_enq_1_bits_uop_robIdx_flag),
    .io_enq_1_bits_uop_robIdx_value(loadQueueReplay_io_enq_1_bits_uop_robIdx_value),
    .io_enq_1_bits_uop_lqIdx_flag(loadQueueReplay_io_enq_1_bits_uop_lqIdx_flag),
    .io_enq_1_bits_uop_lqIdx_value(loadQueueReplay_io_enq_1_bits_uop_lqIdx_value),
    .io_enq_1_bits_uop_sqIdx_flag(loadQueueReplay_io_enq_1_bits_uop_sqIdx_flag),
    .io_enq_1_bits_uop_sqIdx_value(loadQueueReplay_io_enq_1_bits_uop_sqIdx_value),
    .io_enq_1_bits_vaddr(loadQueueReplay_io_enq_1_bits_vaddr),
    .io_enq_1_bits_tlbMiss(loadQueueReplay_io_enq_1_bits_tlbMiss),
    .io_enq_1_bits_rarAllocated(loadQueueReplay_io_enq_1_bits_rarAllocated),
    .io_enq_1_bits_rarIndex(loadQueueReplay_io_enq_1_bits_rarIndex),
    .io_enq_1_bits_rawAllocated(loadQueueReplay_io_enq_1_bits_rawAllocated),
    .io_enq_1_bits_rawIndex(loadQueueReplay_io_enq_1_bits_rawIndex),
    .io_enq_1_bits_replayInfo_missMSHRId(loadQueueReplay_io_enq_1_bits_replayInfo_missMSHRId),
    .io_enq_1_bits_replayInfo_canForwardFullData(loadQueueReplay_io_enq_1_bits_replayInfo_canForwardFullData),
    .io_enq_1_bits_replayInfo_dataInvalidSqIdx_flag(loadQueueReplay_io_enq_1_bits_replayInfo_dataInvalidSqIdx_flag),
    .io_enq_1_bits_replayInfo_dataInvalidSqIdx_value(loadQueueReplay_io_enq_1_bits_replayInfo_dataInvalidSqIdx_value),
    .io_enq_1_bits_replayInfo_addrInvalidSqIdx_flag(loadQueueReplay_io_enq_1_bits_replayInfo_addrInvalidSqIdx_flag),
    .io_enq_1_bits_replayInfo_addrInvalidSqIdx_value(loadQueueReplay_io_enq_1_bits_replayInfo_addrInvalidSqIdx_value),
    .io_enq_1_bits_replayInfo_replayCarry_real_way_en(loadQueueReplay_io_enq_1_bits_replayInfo_replayCarry_real_way_en),
    .io_enq_1_bits_replayInfo_replayCarry_valid(loadQueueReplay_io_enq_1_bits_replayInfo_replayCarry_valid),
    .io_enq_1_bits_replayInfo_dataInLastBeat(loadQueueReplay_io_enq_1_bits_replayInfo_dataInLastBeat),
    .io_enq_1_bits_replayInfo_cause_0(loadQueueReplay_io_enq_1_bits_replayInfo_cause_0),
    .io_enq_1_bits_replayInfo_cause_1(loadQueueReplay_io_enq_1_bits_replayInfo_cause_1),
    .io_enq_1_bits_replayInfo_cause_2(loadQueueReplay_io_enq_1_bits_replayInfo_cause_2),
    .io_enq_1_bits_replayInfo_cause_3(loadQueueReplay_io_enq_1_bits_replayInfo_cause_3),
    .io_enq_1_bits_replayInfo_cause_4(loadQueueReplay_io_enq_1_bits_replayInfo_cause_4),
    .io_enq_1_bits_replayInfo_cause_5(loadQueueReplay_io_enq_1_bits_replayInfo_cause_5),
    .io_enq_1_bits_replayInfo_cause_6(loadQueueReplay_io_enq_1_bits_replayInfo_cause_6),
    .io_enq_1_bits_replayInfo_cause_7(loadQueueReplay_io_enq_1_bits_replayInfo_cause_7),
    .io_storeAddrIn_0_valid(loadQueueReplay_io_storeAddrIn_0_valid),
    .io_storeAddrIn_0_bits_uop_sqIdx_flag(loadQueueReplay_io_storeAddrIn_0_bits_uop_sqIdx_flag),
    .io_storeAddrIn_0_bits_uop_sqIdx_value(loadQueueReplay_io_storeAddrIn_0_bits_uop_sqIdx_value),
    .io_storeAddrIn_0_bits_miss(loadQueueReplay_io_storeAddrIn_0_bits_miss),
    .io_storeAddrIn_1_valid(loadQueueReplay_io_storeAddrIn_1_valid),
    .io_storeAddrIn_1_bits_uop_sqIdx_flag(loadQueueReplay_io_storeAddrIn_1_bits_uop_sqIdx_flag),
    .io_storeAddrIn_1_bits_uop_sqIdx_value(loadQueueReplay_io_storeAddrIn_1_bits_uop_sqIdx_value),
    .io_storeAddrIn_1_bits_miss(loadQueueReplay_io_storeAddrIn_1_bits_miss),
    .io_storeDataIn_0_valid(loadQueueReplay_io_storeDataIn_0_valid),
    .io_storeDataIn_0_bits_uop_sqIdx_flag(loadQueueReplay_io_storeDataIn_0_bits_uop_sqIdx_flag),
    .io_storeDataIn_0_bits_uop_sqIdx_value(loadQueueReplay_io_storeDataIn_0_bits_uop_sqIdx_value),
    .io_storeDataIn_1_valid(loadQueueReplay_io_storeDataIn_1_valid),
    .io_storeDataIn_1_bits_uop_sqIdx_flag(loadQueueReplay_io_storeDataIn_1_bits_uop_sqIdx_flag),
    .io_storeDataIn_1_bits_uop_sqIdx_value(loadQueueReplay_io_storeDataIn_1_bits_uop_sqIdx_value),
    .io_replay_0_ready(loadQueueReplay_io_replay_0_ready),
    .io_replay_0_valid(loadQueueReplay_io_replay_0_valid),
    .io_replay_0_bits_uop_cf_foldpc(loadQueueReplay_io_replay_0_bits_uop_cf_foldpc),
    .io_replay_0_bits_uop_cf_trigger_backendEn_1(loadQueueReplay_io_replay_0_bits_uop_cf_trigger_backendEn_1),
    .io_replay_0_bits_uop_cf_trigger_backendHit_0(loadQueueReplay_io_replay_0_bits_uop_cf_trigger_backendHit_0),
    .io_replay_0_bits_uop_cf_trigger_backendHit_1(loadQueueReplay_io_replay_0_bits_uop_cf_trigger_backendHit_1),
    .io_replay_0_bits_uop_cf_trigger_backendHit_4(loadQueueReplay_io_replay_0_bits_uop_cf_trigger_backendHit_4),
    .io_replay_0_bits_uop_cf_waitForRobIdx_flag(loadQueueReplay_io_replay_0_bits_uop_cf_waitForRobIdx_flag),
    .io_replay_0_bits_uop_cf_waitForRobIdx_value(loadQueueReplay_io_replay_0_bits_uop_cf_waitForRobIdx_value),
    .io_replay_0_bits_uop_cf_loadWaitBit(loadQueueReplay_io_replay_0_bits_uop_cf_loadWaitBit),
    .io_replay_0_bits_uop_cf_loadWaitStrict(loadQueueReplay_io_replay_0_bits_uop_cf_loadWaitStrict),
    .io_replay_0_bits_uop_cf_ftqPtr_flag(loadQueueReplay_io_replay_0_bits_uop_cf_ftqPtr_flag),
    .io_replay_0_bits_uop_cf_ftqPtr_value(loadQueueReplay_io_replay_0_bits_uop_cf_ftqPtr_value),
    .io_replay_0_bits_uop_cf_ftqOffset(loadQueueReplay_io_replay_0_bits_uop_cf_ftqOffset),
    .io_replay_0_bits_uop_ctrl_fuType(loadQueueReplay_io_replay_0_bits_uop_ctrl_fuType),
    .io_replay_0_bits_uop_ctrl_fuOpType(loadQueueReplay_io_replay_0_bits_uop_ctrl_fuOpType),
    .io_replay_0_bits_uop_ctrl_rfWen(loadQueueReplay_io_replay_0_bits_uop_ctrl_rfWen),
    .io_replay_0_bits_uop_ctrl_fpWen(loadQueueReplay_io_replay_0_bits_uop_ctrl_fpWen),
    .io_replay_0_bits_uop_pdest(loadQueueReplay_io_replay_0_bits_uop_pdest),
    .io_replay_0_bits_uop_robIdx_flag(loadQueueReplay_io_replay_0_bits_uop_robIdx_flag),
    .io_replay_0_bits_uop_robIdx_value(loadQueueReplay_io_replay_0_bits_uop_robIdx_value),
    .io_replay_0_bits_uop_lqIdx_flag(loadQueueReplay_io_replay_0_bits_uop_lqIdx_flag),
    .io_replay_0_bits_uop_lqIdx_value(loadQueueReplay_io_replay_0_bits_uop_lqIdx_value),
    .io_replay_0_bits_uop_sqIdx_flag(loadQueueReplay_io_replay_0_bits_uop_sqIdx_flag),
    .io_replay_0_bits_uop_sqIdx_value(loadQueueReplay_io_replay_0_bits_uop_sqIdx_value),
    .io_replay_0_bits_vaddr(loadQueueReplay_io_replay_0_bits_vaddr),
    .io_replay_0_bits_isFirstIssue(loadQueueReplay_io_replay_0_bits_isFirstIssue),
    .io_replay_0_bits_replayCarry_real_way_en(loadQueueReplay_io_replay_0_bits_replayCarry_real_way_en),
    .io_replay_0_bits_replayCarry_valid(loadQueueReplay_io_replay_0_bits_replayCarry_valid),
    .io_replay_0_bits_mshrid(loadQueueReplay_io_replay_0_bits_mshrid),
    .io_replay_0_bits_forward_tlDchannel(loadQueueReplay_io_replay_0_bits_forward_tlDchannel),
    .io_replay_0_bits_rarAllocated(loadQueueReplay_io_replay_0_bits_rarAllocated),
    .io_replay_0_bits_rarIndex(loadQueueReplay_io_replay_0_bits_rarIndex),
    .io_replay_0_bits_rawAllocated(loadQueueReplay_io_replay_0_bits_rawAllocated),
    .io_replay_0_bits_rawIndex(loadQueueReplay_io_replay_0_bits_rawIndex),
    .io_replay_1_ready(loadQueueReplay_io_replay_1_ready),
    .io_replay_1_valid(loadQueueReplay_io_replay_1_valid),
    .io_replay_1_bits_uop_cf_foldpc(loadQueueReplay_io_replay_1_bits_uop_cf_foldpc),
    .io_replay_1_bits_uop_cf_trigger_backendEn_1(loadQueueReplay_io_replay_1_bits_uop_cf_trigger_backendEn_1),
    .io_replay_1_bits_uop_cf_trigger_backendHit_0(loadQueueReplay_io_replay_1_bits_uop_cf_trigger_backendHit_0),
    .io_replay_1_bits_uop_cf_trigger_backendHit_1(loadQueueReplay_io_replay_1_bits_uop_cf_trigger_backendHit_1),
    .io_replay_1_bits_uop_cf_trigger_backendHit_4(loadQueueReplay_io_replay_1_bits_uop_cf_trigger_backendHit_4),
    .io_replay_1_bits_uop_cf_waitForRobIdx_flag(loadQueueReplay_io_replay_1_bits_uop_cf_waitForRobIdx_flag),
    .io_replay_1_bits_uop_cf_waitForRobIdx_value(loadQueueReplay_io_replay_1_bits_uop_cf_waitForRobIdx_value),
    .io_replay_1_bits_uop_cf_loadWaitBit(loadQueueReplay_io_replay_1_bits_uop_cf_loadWaitBit),
    .io_replay_1_bits_uop_cf_loadWaitStrict(loadQueueReplay_io_replay_1_bits_uop_cf_loadWaitStrict),
    .io_replay_1_bits_uop_cf_ftqPtr_flag(loadQueueReplay_io_replay_1_bits_uop_cf_ftqPtr_flag),
    .io_replay_1_bits_uop_cf_ftqPtr_value(loadQueueReplay_io_replay_1_bits_uop_cf_ftqPtr_value),
    .io_replay_1_bits_uop_cf_ftqOffset(loadQueueReplay_io_replay_1_bits_uop_cf_ftqOffset),
    .io_replay_1_bits_uop_ctrl_fuType(loadQueueReplay_io_replay_1_bits_uop_ctrl_fuType),
    .io_replay_1_bits_uop_ctrl_fuOpType(loadQueueReplay_io_replay_1_bits_uop_ctrl_fuOpType),
    .io_replay_1_bits_uop_ctrl_rfWen(loadQueueReplay_io_replay_1_bits_uop_ctrl_rfWen),
    .io_replay_1_bits_uop_ctrl_fpWen(loadQueueReplay_io_replay_1_bits_uop_ctrl_fpWen),
    .io_replay_1_bits_uop_pdest(loadQueueReplay_io_replay_1_bits_uop_pdest),
    .io_replay_1_bits_uop_robIdx_flag(loadQueueReplay_io_replay_1_bits_uop_robIdx_flag),
    .io_replay_1_bits_uop_robIdx_value(loadQueueReplay_io_replay_1_bits_uop_robIdx_value),
    .io_replay_1_bits_uop_lqIdx_flag(loadQueueReplay_io_replay_1_bits_uop_lqIdx_flag),
    .io_replay_1_bits_uop_lqIdx_value(loadQueueReplay_io_replay_1_bits_uop_lqIdx_value),
    .io_replay_1_bits_uop_sqIdx_flag(loadQueueReplay_io_replay_1_bits_uop_sqIdx_flag),
    .io_replay_1_bits_uop_sqIdx_value(loadQueueReplay_io_replay_1_bits_uop_sqIdx_value),
    .io_replay_1_bits_vaddr(loadQueueReplay_io_replay_1_bits_vaddr),
    .io_replay_1_bits_isFirstIssue(loadQueueReplay_io_replay_1_bits_isFirstIssue),
    .io_replay_1_bits_replayCarry_real_way_en(loadQueueReplay_io_replay_1_bits_replayCarry_real_way_en),
    .io_replay_1_bits_replayCarry_valid(loadQueueReplay_io_replay_1_bits_replayCarry_valid),
    .io_replay_1_bits_mshrid(loadQueueReplay_io_replay_1_bits_mshrid),
    .io_replay_1_bits_forward_tlDchannel(loadQueueReplay_io_replay_1_bits_forward_tlDchannel),
    .io_replay_1_bits_rarAllocated(loadQueueReplay_io_replay_1_bits_rarAllocated),
    .io_replay_1_bits_rarIndex(loadQueueReplay_io_replay_1_bits_rarIndex),
    .io_replay_1_bits_rawAllocated(loadQueueReplay_io_replay_1_bits_rawAllocated),
    .io_replay_1_bits_rawIndex(loadQueueReplay_io_replay_1_bits_rawIndex),
    .io_refill_valid(loadQueueReplay_io_refill_valid),
    .io_refill_bits_id(loadQueueReplay_io_refill_bits_id),
    .io_stAddrReadySqPtr_flag(loadQueueReplay_io_stAddrReadySqPtr_flag),
    .io_stAddrReadySqPtr_value(loadQueueReplay_io_stAddrReadySqPtr_value),
    .io_stDataReadySqPtr_flag(loadQueueReplay_io_stDataReadySqPtr_flag),
    .io_stDataReadySqPtr_value(loadQueueReplay_io_stDataReadySqPtr_value),
    .io_sqEmpty(loadQueueReplay_io_sqEmpty),
    .io_lqFull(loadQueueReplay_io_lqFull),
    .io_tlbReplayDelayCycleCtrl_0(loadQueueReplay_io_tlbReplayDelayCycleCtrl_0),
    .io_tlbReplayDelayCycleCtrl_1(loadQueueReplay_io_tlbReplayDelayCycleCtrl_1),
    .io_tlbReplayDelayCycleCtrl_2(loadQueueReplay_io_tlbReplayDelayCycleCtrl_2),
    .io_tlbReplayDelayCycleCtrl_3(loadQueueReplay_io_tlbReplayDelayCycleCtrl_3),
    .io_perf_0_value(loadQueueReplay_io_perf_0_value),
    .io_perf_1_value(loadQueueReplay_io_perf_1_value),
    .io_perf_2_value(loadQueueReplay_io_perf_2_value),
    .io_perf_3_value(loadQueueReplay_io_perf_3_value),
    .io_perf_4_value(loadQueueReplay_io_perf_4_value),
    .io_perf_5_value(loadQueueReplay_io_perf_5_value),
    .io_perf_6_value(loadQueueReplay_io_perf_6_value),
    .io_perf_7_value(loadQueueReplay_io_perf_7_value),
    .io_perf_8_value(loadQueueReplay_io_perf_8_value),
    .io_perf_9_value(loadQueueReplay_io_perf_9_value),
    .io_perf_10_value(loadQueueReplay_io_perf_10_value),
    .io_perf_11_value(loadQueueReplay_io_perf_11_value)
  );
  LoadQueueFlag loadQueueFlag ( // @[LoadQueue.scala 136:29]
    .clock(loadQueueFlag_clock),
    .reset(loadQueueFlag_reset),
    .io_redirect_valid(loadQueueFlag_io_redirect_valid),
    .io_redirect_bits_robIdx_flag(loadQueueFlag_io_redirect_bits_robIdx_flag),
    .io_redirect_bits_robIdx_value(loadQueueFlag_io_redirect_bits_robIdx_value),
    .io_redirect_bits_level(loadQueueFlag_io_redirect_bits_level),
    .io_enq_canAccept(loadQueueFlag_io_enq_canAccept),
    .io_enq_sqCanAccept(loadQueueFlag_io_enq_sqCanAccept),
    .io_enq_req_0_valid(loadQueueFlag_io_enq_req_0_valid),
    .io_enq_req_0_bits_cf_trigger_backendEn_1(loadQueueFlag_io_enq_req_0_bits_cf_trigger_backendEn_1),
    .io_enq_req_0_bits_ctrl_fuOpType(loadQueueFlag_io_enq_req_0_bits_ctrl_fuOpType),
    .io_enq_req_0_bits_ctrl_rfWen(loadQueueFlag_io_enq_req_0_bits_ctrl_rfWen),
    .io_enq_req_0_bits_ctrl_fpWen(loadQueueFlag_io_enq_req_0_bits_ctrl_fpWen),
    .io_enq_req_0_bits_ctrl_flushPipe(loadQueueFlag_io_enq_req_0_bits_ctrl_flushPipe),
    .io_enq_req_0_bits_ctrl_replayInst(loadQueueFlag_io_enq_req_0_bits_ctrl_replayInst),
    .io_enq_req_0_bits_pdest(loadQueueFlag_io_enq_req_0_bits_pdest),
    .io_enq_req_0_bits_robIdx_flag(loadQueueFlag_io_enq_req_0_bits_robIdx_flag),
    .io_enq_req_0_bits_robIdx_value(loadQueueFlag_io_enq_req_0_bits_robIdx_value),
    .io_enq_req_0_bits_lqIdx_value(loadQueueFlag_io_enq_req_0_bits_lqIdx_value),
    .io_enq_req_1_valid(loadQueueFlag_io_enq_req_1_valid),
    .io_enq_req_1_bits_cf_trigger_backendEn_1(loadQueueFlag_io_enq_req_1_bits_cf_trigger_backendEn_1),
    .io_enq_req_1_bits_ctrl_fuOpType(loadQueueFlag_io_enq_req_1_bits_ctrl_fuOpType),
    .io_enq_req_1_bits_ctrl_rfWen(loadQueueFlag_io_enq_req_1_bits_ctrl_rfWen),
    .io_enq_req_1_bits_ctrl_fpWen(loadQueueFlag_io_enq_req_1_bits_ctrl_fpWen),
    .io_enq_req_1_bits_ctrl_flushPipe(loadQueueFlag_io_enq_req_1_bits_ctrl_flushPipe),
    .io_enq_req_1_bits_ctrl_replayInst(loadQueueFlag_io_enq_req_1_bits_ctrl_replayInst),
    .io_enq_req_1_bits_pdest(loadQueueFlag_io_enq_req_1_bits_pdest),
    .io_enq_req_1_bits_robIdx_flag(loadQueueFlag_io_enq_req_1_bits_robIdx_flag),
    .io_enq_req_1_bits_robIdx_value(loadQueueFlag_io_enq_req_1_bits_robIdx_value),
    .io_enq_req_1_bits_lqIdx_value(loadQueueFlag_io_enq_req_1_bits_lqIdx_value),
    .io_enq_req_2_valid(loadQueueFlag_io_enq_req_2_valid),
    .io_enq_req_2_bits_cf_trigger_backendEn_1(loadQueueFlag_io_enq_req_2_bits_cf_trigger_backendEn_1),
    .io_enq_req_2_bits_ctrl_fuOpType(loadQueueFlag_io_enq_req_2_bits_ctrl_fuOpType),
    .io_enq_req_2_bits_ctrl_rfWen(loadQueueFlag_io_enq_req_2_bits_ctrl_rfWen),
    .io_enq_req_2_bits_ctrl_fpWen(loadQueueFlag_io_enq_req_2_bits_ctrl_fpWen),
    .io_enq_req_2_bits_ctrl_flushPipe(loadQueueFlag_io_enq_req_2_bits_ctrl_flushPipe),
    .io_enq_req_2_bits_ctrl_replayInst(loadQueueFlag_io_enq_req_2_bits_ctrl_replayInst),
    .io_enq_req_2_bits_pdest(loadQueueFlag_io_enq_req_2_bits_pdest),
    .io_enq_req_2_bits_robIdx_flag(loadQueueFlag_io_enq_req_2_bits_robIdx_flag),
    .io_enq_req_2_bits_robIdx_value(loadQueueFlag_io_enq_req_2_bits_robIdx_value),
    .io_enq_req_2_bits_lqIdx_value(loadQueueFlag_io_enq_req_2_bits_lqIdx_value),
    .io_enq_req_3_valid(loadQueueFlag_io_enq_req_3_valid),
    .io_enq_req_3_bits_cf_trigger_backendEn_1(loadQueueFlag_io_enq_req_3_bits_cf_trigger_backendEn_1),
    .io_enq_req_3_bits_ctrl_fuOpType(loadQueueFlag_io_enq_req_3_bits_ctrl_fuOpType),
    .io_enq_req_3_bits_ctrl_rfWen(loadQueueFlag_io_enq_req_3_bits_ctrl_rfWen),
    .io_enq_req_3_bits_ctrl_fpWen(loadQueueFlag_io_enq_req_3_bits_ctrl_fpWen),
    .io_enq_req_3_bits_ctrl_flushPipe(loadQueueFlag_io_enq_req_3_bits_ctrl_flushPipe),
    .io_enq_req_3_bits_ctrl_replayInst(loadQueueFlag_io_enq_req_3_bits_ctrl_replayInst),
    .io_enq_req_3_bits_pdest(loadQueueFlag_io_enq_req_3_bits_pdest),
    .io_enq_req_3_bits_robIdx_flag(loadQueueFlag_io_enq_req_3_bits_robIdx_flag),
    .io_enq_req_3_bits_robIdx_value(loadQueueFlag_io_enq_req_3_bits_robIdx_value),
    .io_enq_req_3_bits_lqIdx_value(loadQueueFlag_io_enq_req_3_bits_lqIdx_value),
    .io_loadIn_0_valid(loadQueueFlag_io_loadIn_0_valid),
    .io_loadIn_0_bits_uop_cf_exceptionVec_4(loadQueueFlag_io_loadIn_0_bits_uop_cf_exceptionVec_4),
    .io_loadIn_0_bits_uop_cf_exceptionVec_5(loadQueueFlag_io_loadIn_0_bits_uop_cf_exceptionVec_5),
    .io_loadIn_0_bits_uop_cf_exceptionVec_13(loadQueueFlag_io_loadIn_0_bits_uop_cf_exceptionVec_13),
    .io_loadIn_0_bits_uop_cf_trigger_backendEn_1(loadQueueFlag_io_loadIn_0_bits_uop_cf_trigger_backendEn_1),
    .io_loadIn_0_bits_uop_cf_trigger_backendHit_0(loadQueueFlag_io_loadIn_0_bits_uop_cf_trigger_backendHit_0),
    .io_loadIn_0_bits_uop_cf_trigger_backendHit_1(loadQueueFlag_io_loadIn_0_bits_uop_cf_trigger_backendHit_1),
    .io_loadIn_0_bits_uop_cf_trigger_backendHit_4(loadQueueFlag_io_loadIn_0_bits_uop_cf_trigger_backendHit_4),
    .io_loadIn_0_bits_uop_ctrl_fuOpType(loadQueueFlag_io_loadIn_0_bits_uop_ctrl_fuOpType),
    .io_loadIn_0_bits_uop_ctrl_rfWen(loadQueueFlag_io_loadIn_0_bits_uop_ctrl_rfWen),
    .io_loadIn_0_bits_uop_ctrl_fpWen(loadQueueFlag_io_loadIn_0_bits_uop_ctrl_fpWen),
    .io_loadIn_0_bits_uop_ctrl_replayInst(loadQueueFlag_io_loadIn_0_bits_uop_ctrl_replayInst),
    .io_loadIn_0_bits_uop_pdest(loadQueueFlag_io_loadIn_0_bits_uop_pdest),
    .io_loadIn_0_bits_uop_robIdx_value(loadQueueFlag_io_loadIn_0_bits_uop_robIdx_value),
    .io_loadIn_0_bits_uop_lqIdx_value(loadQueueFlag_io_loadIn_0_bits_uop_lqIdx_value),
    .io_loadIn_0_bits_vaddr(loadQueueFlag_io_loadIn_0_bits_vaddr),
    .io_loadIn_0_bits_paddr(loadQueueFlag_io_loadIn_0_bits_paddr),
    .io_loadIn_0_bits_mask(loadQueueFlag_io_loadIn_0_bits_mask),
    .io_loadIn_0_bits_miss(loadQueueFlag_io_loadIn_0_bits_miss),
    .io_loadIn_0_bits_tlbMiss(loadQueueFlag_io_loadIn_0_bits_tlbMiss),
    .io_loadIn_0_bits_mmio(loadQueueFlag_io_loadIn_0_bits_mmio),
    .io_loadIn_0_bits_replayInfo_cause_0(loadQueueFlag_io_loadIn_0_bits_replayInfo_cause_0),
    .io_loadIn_0_bits_replayInfo_cause_1(loadQueueFlag_io_loadIn_0_bits_replayInfo_cause_1),
    .io_loadIn_0_bits_replayInfo_cause_2(loadQueueFlag_io_loadIn_0_bits_replayInfo_cause_2),
    .io_loadIn_0_bits_replayInfo_cause_3(loadQueueFlag_io_loadIn_0_bits_replayInfo_cause_3),
    .io_loadIn_0_bits_replayInfo_cause_4(loadQueueFlag_io_loadIn_0_bits_replayInfo_cause_4),
    .io_loadIn_0_bits_replayInfo_cause_5(loadQueueFlag_io_loadIn_0_bits_replayInfo_cause_5),
    .io_loadIn_0_bits_replayInfo_cause_6(loadQueueFlag_io_loadIn_0_bits_replayInfo_cause_6),
    .io_loadIn_0_bits_replayInfo_cause_7(loadQueueFlag_io_loadIn_0_bits_replayInfo_cause_7),
    .io_loadIn_0_bits_lqDataWenDup_1(loadQueueFlag_io_loadIn_0_bits_lqDataWenDup_1),
    .io_loadIn_0_bits_lqDataWenDup_2(loadQueueFlag_io_loadIn_0_bits_lqDataWenDup_2),
    .io_loadIn_0_bits_lqDataWenDup_3(loadQueueFlag_io_loadIn_0_bits_lqDataWenDup_3),
    .io_loadIn_0_bits_lqDataWenDup_5(loadQueueFlag_io_loadIn_0_bits_lqDataWenDup_5),
    .io_loadIn_1_valid(loadQueueFlag_io_loadIn_1_valid),
    .io_loadIn_1_bits_uop_cf_exceptionVec_4(loadQueueFlag_io_loadIn_1_bits_uop_cf_exceptionVec_4),
    .io_loadIn_1_bits_uop_cf_exceptionVec_5(loadQueueFlag_io_loadIn_1_bits_uop_cf_exceptionVec_5),
    .io_loadIn_1_bits_uop_cf_exceptionVec_13(loadQueueFlag_io_loadIn_1_bits_uop_cf_exceptionVec_13),
    .io_loadIn_1_bits_uop_cf_trigger_backendEn_1(loadQueueFlag_io_loadIn_1_bits_uop_cf_trigger_backendEn_1),
    .io_loadIn_1_bits_uop_cf_trigger_backendHit_0(loadQueueFlag_io_loadIn_1_bits_uop_cf_trigger_backendHit_0),
    .io_loadIn_1_bits_uop_cf_trigger_backendHit_1(loadQueueFlag_io_loadIn_1_bits_uop_cf_trigger_backendHit_1),
    .io_loadIn_1_bits_uop_cf_trigger_backendHit_4(loadQueueFlag_io_loadIn_1_bits_uop_cf_trigger_backendHit_4),
    .io_loadIn_1_bits_uop_ctrl_fuOpType(loadQueueFlag_io_loadIn_1_bits_uop_ctrl_fuOpType),
    .io_loadIn_1_bits_uop_ctrl_rfWen(loadQueueFlag_io_loadIn_1_bits_uop_ctrl_rfWen),
    .io_loadIn_1_bits_uop_ctrl_fpWen(loadQueueFlag_io_loadIn_1_bits_uop_ctrl_fpWen),
    .io_loadIn_1_bits_uop_ctrl_replayInst(loadQueueFlag_io_loadIn_1_bits_uop_ctrl_replayInst),
    .io_loadIn_1_bits_uop_pdest(loadQueueFlag_io_loadIn_1_bits_uop_pdest),
    .io_loadIn_1_bits_uop_robIdx_value(loadQueueFlag_io_loadIn_1_bits_uop_robIdx_value),
    .io_loadIn_1_bits_uop_lqIdx_value(loadQueueFlag_io_loadIn_1_bits_uop_lqIdx_value),
    .io_loadIn_1_bits_vaddr(loadQueueFlag_io_loadIn_1_bits_vaddr),
    .io_loadIn_1_bits_paddr(loadQueueFlag_io_loadIn_1_bits_paddr),
    .io_loadIn_1_bits_mask(loadQueueFlag_io_loadIn_1_bits_mask),
    .io_loadIn_1_bits_miss(loadQueueFlag_io_loadIn_1_bits_miss),
    .io_loadIn_1_bits_tlbMiss(loadQueueFlag_io_loadIn_1_bits_tlbMiss),
    .io_loadIn_1_bits_mmio(loadQueueFlag_io_loadIn_1_bits_mmio),
    .io_loadIn_1_bits_replayInfo_cause_0(loadQueueFlag_io_loadIn_1_bits_replayInfo_cause_0),
    .io_loadIn_1_bits_replayInfo_cause_1(loadQueueFlag_io_loadIn_1_bits_replayInfo_cause_1),
    .io_loadIn_1_bits_replayInfo_cause_2(loadQueueFlag_io_loadIn_1_bits_replayInfo_cause_2),
    .io_loadIn_1_bits_replayInfo_cause_3(loadQueueFlag_io_loadIn_1_bits_replayInfo_cause_3),
    .io_loadIn_1_bits_replayInfo_cause_4(loadQueueFlag_io_loadIn_1_bits_replayInfo_cause_4),
    .io_loadIn_1_bits_replayInfo_cause_5(loadQueueFlag_io_loadIn_1_bits_replayInfo_cause_5),
    .io_loadIn_1_bits_replayInfo_cause_6(loadQueueFlag_io_loadIn_1_bits_replayInfo_cause_6),
    .io_loadIn_1_bits_replayInfo_cause_7(loadQueueFlag_io_loadIn_1_bits_replayInfo_cause_7),
    .io_loadIn_1_bits_lqDataWenDup_1(loadQueueFlag_io_loadIn_1_bits_lqDataWenDup_1),
    .io_loadIn_1_bits_lqDataWenDup_2(loadQueueFlag_io_loadIn_1_bits_lqDataWenDup_2),
    .io_loadIn_1_bits_lqDataWenDup_3(loadQueueFlag_io_loadIn_1_bits_lqDataWenDup_3),
    .io_loadIn_1_bits_lqDataWenDup_5(loadQueueFlag_io_loadIn_1_bits_lqDataWenDup_5),
    .io_loadOut_0_ready(loadQueueFlag_io_loadOut_0_ready),
    .io_loadOut_0_valid(loadQueueFlag_io_loadOut_0_valid),
    .io_loadOut_0_bits_uop_cf_exceptionVec_4(loadQueueFlag_io_loadOut_0_bits_uop_cf_exceptionVec_4),
    .io_loadOut_0_bits_uop_cf_exceptionVec_5(loadQueueFlag_io_loadOut_0_bits_uop_cf_exceptionVec_5),
    .io_loadOut_0_bits_uop_cf_exceptionVec_13(loadQueueFlag_io_loadOut_0_bits_uop_cf_exceptionVec_13),
    .io_loadOut_0_bits_uop_cf_trigger_backendEn_1(loadQueueFlag_io_loadOut_0_bits_uop_cf_trigger_backendEn_1),
    .io_loadOut_0_bits_uop_cf_trigger_backendHit_0(loadQueueFlag_io_loadOut_0_bits_uop_cf_trigger_backendHit_0),
    .io_loadOut_0_bits_uop_cf_trigger_backendHit_1(loadQueueFlag_io_loadOut_0_bits_uop_cf_trigger_backendHit_1),
    .io_loadOut_0_bits_uop_cf_trigger_backendHit_4(loadQueueFlag_io_loadOut_0_bits_uop_cf_trigger_backendHit_4),
    .io_loadOut_0_bits_uop_ctrl_fuOpType(loadQueueFlag_io_loadOut_0_bits_uop_ctrl_fuOpType),
    .io_loadOut_0_bits_uop_ctrl_rfWen(loadQueueFlag_io_loadOut_0_bits_uop_ctrl_rfWen),
    .io_loadOut_0_bits_uop_ctrl_fpWen(loadQueueFlag_io_loadOut_0_bits_uop_ctrl_fpWen),
    .io_loadOut_0_bits_uop_ctrl_flushPipe(loadQueueFlag_io_loadOut_0_bits_uop_ctrl_flushPipe),
    .io_loadOut_0_bits_uop_ctrl_replayInst(loadQueueFlag_io_loadOut_0_bits_uop_ctrl_replayInst),
    .io_loadOut_0_bits_uop_pdest(loadQueueFlag_io_loadOut_0_bits_uop_pdest),
    .io_loadOut_0_bits_uop_robIdx_flag(loadQueueFlag_io_loadOut_0_bits_uop_robIdx_flag),
    .io_loadOut_0_bits_uop_robIdx_value(loadQueueFlag_io_loadOut_0_bits_uop_robIdx_value),
    .io_ldRawDataOut_0_lqData(loadQueueFlag_io_ldRawDataOut_0_lqData),
    .io_ldRawDataOut_0_uop_ctrl_fuOpType(loadQueueFlag_io_ldRawDataOut_0_uop_ctrl_fuOpType),
    .io_ldRawDataOut_0_uop_ctrl_fpWen(loadQueueFlag_io_ldRawDataOut_0_uop_ctrl_fpWen),
    .io_ldRawDataOut_0_addrOffset(loadQueueFlag_io_ldRawDataOut_0_addrOffset),
    .io_rob_pendingld(loadQueueFlag_io_rob_pendingld),
    .io_rob_commit(loadQueueFlag_io_rob_commit),
    .io_rob_isMMIO_0(loadQueueFlag_io_rob_isMMIO_0),
    .io_rob_isMMIO_1(loadQueueFlag_io_rob_isMMIO_1),
    .io_rob_uop_0_robIdx_value(loadQueueFlag_io_rob_uop_0_robIdx_value),
    .io_rob_uop_1_robIdx_value(loadQueueFlag_io_rob_uop_1_robIdx_value),
    .io_uncache_req_ready(loadQueueFlag_io_uncache_req_ready),
    .io_uncache_req_valid(loadQueueFlag_io_uncache_req_valid),
    .io_uncache_req_bits_addr(loadQueueFlag_io_uncache_req_bits_addr),
    .io_uncache_req_bits_mask(loadQueueFlag_io_uncache_req_bits_mask),
    .io_uncache_resp_ready(loadQueueFlag_io_uncache_resp_ready),
    .io_uncache_resp_valid(loadQueueFlag_io_uncache_resp_valid),
    .io_uncache_resp_bits_data(loadQueueFlag_io_uncache_resp_bits_data),
    .io_trigger_0_hitLoadAddrTriggerHitVec_0(loadQueueFlag_io_trigger_0_hitLoadAddrTriggerHitVec_0),
    .io_trigger_0_hitLoadAddrTriggerHitVec_1(loadQueueFlag_io_trigger_0_hitLoadAddrTriggerHitVec_1),
    .io_trigger_0_hitLoadAddrTriggerHitVec_2(loadQueueFlag_io_trigger_0_hitLoadAddrTriggerHitVec_2),
    .io_trigger_0_lqLoadAddrTriggerHitVec_0(loadQueueFlag_io_trigger_0_lqLoadAddrTriggerHitVec_0),
    .io_trigger_0_lqLoadAddrTriggerHitVec_1(loadQueueFlag_io_trigger_0_lqLoadAddrTriggerHitVec_1),
    .io_trigger_0_lqLoadAddrTriggerHitVec_2(loadQueueFlag_io_trigger_0_lqLoadAddrTriggerHitVec_2),
    .io_trigger_1_hitLoadAddrTriggerHitVec_0(loadQueueFlag_io_trigger_1_hitLoadAddrTriggerHitVec_0),
    .io_trigger_1_hitLoadAddrTriggerHitVec_1(loadQueueFlag_io_trigger_1_hitLoadAddrTriggerHitVec_1),
    .io_trigger_1_hitLoadAddrTriggerHitVec_2(loadQueueFlag_io_trigger_1_hitLoadAddrTriggerHitVec_2),
    .io_exceptionAddr_vaddr(loadQueueFlag_io_exceptionAddr_vaddr),
    .io_ldIssuePtr_flag(loadQueueFlag_io_ldIssuePtr_flag),
    .io_ldIssuePtr_value(loadQueueFlag_io_ldIssuePtr_value),
    .io_lqDeq(loadQueueFlag_io_lqDeq),
    .io_lqCancelCnt(loadQueueFlag_io_lqCancelCnt),
    .io_perf_0_value(loadQueueFlag_io_perf_0_value),
    .io_perf_1_value(loadQueueFlag_io_perf_1_value),
    .io_perf_2_value(loadQueueFlag_io_perf_2_value),
    .io_perf_3_value(loadQueueFlag_io_perf_3_value)
  );
  assign io_enq_canAccept = loadQueueFlag_io_enq_canAccept; // @[LoadQueue.scala 163:24]
  assign io_ldu_s2_storeLoadViolationQuery_0_resp_bits_index = loadQueueRAW_io_query_0_resp_bits_index; // @[LoadQueue.scala 157:25]
  assign io_ldu_s2_storeLoadViolationQuery_0_resp_bits_canAccept = loadQueueRAW_io_query_0_resp_bits_canAccept; // @[LoadQueue.scala 157:25]
  assign io_ldu_s2_storeLoadViolationQuery_0_resp_bits_allocated = loadQueueRAW_io_query_0_resp_bits_allocated; // @[LoadQueue.scala 157:25]
  assign io_ldu_s2_storeLoadViolationQuery_1_resp_bits_index = loadQueueRAW_io_query_1_resp_bits_index; // @[LoadQueue.scala 157:25]
  assign io_ldu_s2_storeLoadViolationQuery_1_resp_bits_canAccept = loadQueueRAW_io_query_1_resp_bits_canAccept; // @[LoadQueue.scala 157:25]
  assign io_ldu_s2_storeLoadViolationQuery_1_resp_bits_allocated = loadQueueRAW_io_query_1_resp_bits_allocated; // @[LoadQueue.scala 157:25]
  assign io_ldu_s2_loadLoadViolationQuery_0_resp_valid = loadQueueRAR_io_query_0_resp_valid; // @[LoadQueue.scala 144:25]
  assign io_ldu_s2_loadLoadViolationQuery_0_resp_bits_index = loadQueueRAR_io_query_0_resp_bits_index; // @[LoadQueue.scala 144:25]
  assign io_ldu_s2_loadLoadViolationQuery_0_resp_bits_canAccept = loadQueueRAR_io_query_0_resp_bits_canAccept; // @[LoadQueue.scala 144:25]
  assign io_ldu_s2_loadLoadViolationQuery_0_resp_bits_allocated = loadQueueRAR_io_query_0_resp_bits_allocated; // @[LoadQueue.scala 144:25]
  assign io_ldu_s2_loadLoadViolationQuery_0_resp_bits_replayFromFetch =
    loadQueueRAR_io_query_0_resp_bits_replayFromFetch; // @[LoadQueue.scala 144:25]
  assign io_ldu_s2_loadLoadViolationQuery_1_resp_valid = loadQueueRAR_io_query_1_resp_valid; // @[LoadQueue.scala 144:25]
  assign io_ldu_s2_loadLoadViolationQuery_1_resp_bits_index = loadQueueRAR_io_query_1_resp_bits_index; // @[LoadQueue.scala 144:25]
  assign io_ldu_s2_loadLoadViolationQuery_1_resp_bits_canAccept = loadQueueRAR_io_query_1_resp_bits_canAccept; // @[LoadQueue.scala 144:25]
  assign io_ldu_s2_loadLoadViolationQuery_1_resp_bits_allocated = loadQueueRAR_io_query_1_resp_bits_allocated; // @[LoadQueue.scala 144:25]
  assign io_ldu_s2_loadLoadViolationQuery_1_resp_bits_replayFromFetch =
    loadQueueRAR_io_query_1_resp_bits_replayFromFetch; // @[LoadQueue.scala 144:25]
  assign io_loadOut_0_valid = loadQueueFlag_io_loadOut_0_valid; // @[LoadQueue.scala 165:28]
  assign io_loadOut_0_bits_uop_cf_exceptionVec_4 = loadQueueFlag_io_loadOut_0_bits_uop_cf_exceptionVec_4; // @[LoadQueue.scala 165:28]
  assign io_loadOut_0_bits_uop_cf_exceptionVec_5 = loadQueueFlag_io_loadOut_0_bits_uop_cf_exceptionVec_5; // @[LoadQueue.scala 165:28]
  assign io_loadOut_0_bits_uop_cf_exceptionVec_13 = loadQueueFlag_io_loadOut_0_bits_uop_cf_exceptionVec_13; // @[LoadQueue.scala 165:28]
  assign io_loadOut_0_bits_uop_cf_trigger_backendEn_1 = loadQueueFlag_io_loadOut_0_bits_uop_cf_trigger_backendEn_1; // @[LoadQueue.scala 165:28]
  assign io_loadOut_0_bits_uop_cf_trigger_backendHit_0 = loadQueueFlag_io_loadOut_0_bits_uop_cf_trigger_backendHit_0; // @[LoadQueue.scala 165:28]
  assign io_loadOut_0_bits_uop_cf_trigger_backendHit_1 = loadQueueFlag_io_loadOut_0_bits_uop_cf_trigger_backendHit_1; // @[LoadQueue.scala 165:28]
  assign io_loadOut_0_bits_uop_cf_trigger_backendHit_4 = loadQueueFlag_io_loadOut_0_bits_uop_cf_trigger_backendHit_4; // @[LoadQueue.scala 165:28]
  assign io_loadOut_0_bits_uop_ctrl_rfWen = loadQueueFlag_io_loadOut_0_bits_uop_ctrl_rfWen; // @[LoadQueue.scala 165:28]
  assign io_loadOut_0_bits_uop_ctrl_fpWen = loadQueueFlag_io_loadOut_0_bits_uop_ctrl_fpWen; // @[LoadQueue.scala 165:28]
  assign io_loadOut_0_bits_uop_ctrl_flushPipe = loadQueueFlag_io_loadOut_0_bits_uop_ctrl_flushPipe; // @[LoadQueue.scala 165:28]
  assign io_loadOut_0_bits_uop_ctrl_replayInst = loadQueueFlag_io_loadOut_0_bits_uop_ctrl_replayInst; // @[LoadQueue.scala 165:28]
  assign io_loadOut_0_bits_uop_pdest = loadQueueFlag_io_loadOut_0_bits_uop_pdest; // @[LoadQueue.scala 165:28]
  assign io_loadOut_0_bits_uop_robIdx_flag = loadQueueFlag_io_loadOut_0_bits_uop_robIdx_flag; // @[LoadQueue.scala 165:28]
  assign io_loadOut_0_bits_uop_robIdx_value = loadQueueFlag_io_loadOut_0_bits_uop_robIdx_value; // @[LoadQueue.scala 165:28]
  assign io_ldRawDataOut_0_lqData = loadQueueFlag_io_ldRawDataOut_0_lqData; // @[LoadQueue.scala 166:33]
  assign io_ldRawDataOut_0_uop_ctrl_fuOpType = loadQueueFlag_io_ldRawDataOut_0_uop_ctrl_fuOpType; // @[LoadQueue.scala 166:33]
  assign io_ldRawDataOut_0_uop_ctrl_fpWen = loadQueueFlag_io_ldRawDataOut_0_uop_ctrl_fpWen; // @[LoadQueue.scala 166:33]
  assign io_ldRawDataOut_0_addrOffset = loadQueueFlag_io_ldRawDataOut_0_addrOffset; // @[LoadQueue.scala 166:33]
  assign io_replay_0_valid = loadQueueReplay_io_replay_0_valid; // @[LoadQueue.scala 182:29]
  assign io_replay_0_bits_uop_cf_foldpc = loadQueueReplay_io_replay_0_bits_uop_cf_foldpc; // @[LoadQueue.scala 182:29]
  assign io_replay_0_bits_uop_cf_trigger_backendEn_1 = loadQueueReplay_io_replay_0_bits_uop_cf_trigger_backendEn_1; // @[LoadQueue.scala 182:29]
  assign io_replay_0_bits_uop_cf_trigger_backendHit_0 = loadQueueReplay_io_replay_0_bits_uop_cf_trigger_backendHit_0; // @[LoadQueue.scala 182:29]
  assign io_replay_0_bits_uop_cf_trigger_backendHit_1 = loadQueueReplay_io_replay_0_bits_uop_cf_trigger_backendHit_1; // @[LoadQueue.scala 182:29]
  assign io_replay_0_bits_uop_cf_trigger_backendHit_4 = loadQueueReplay_io_replay_0_bits_uop_cf_trigger_backendHit_4; // @[LoadQueue.scala 182:29]
  assign io_replay_0_bits_uop_cf_waitForRobIdx_flag = loadQueueReplay_io_replay_0_bits_uop_cf_waitForRobIdx_flag; // @[LoadQueue.scala 182:29]
  assign io_replay_0_bits_uop_cf_waitForRobIdx_value = loadQueueReplay_io_replay_0_bits_uop_cf_waitForRobIdx_value; // @[LoadQueue.scala 182:29]
  assign io_replay_0_bits_uop_cf_loadWaitBit = loadQueueReplay_io_replay_0_bits_uop_cf_loadWaitBit; // @[LoadQueue.scala 182:29]
  assign io_replay_0_bits_uop_cf_loadWaitStrict = loadQueueReplay_io_replay_0_bits_uop_cf_loadWaitStrict; // @[LoadQueue.scala 182:29]
  assign io_replay_0_bits_uop_cf_ftqPtr_flag = loadQueueReplay_io_replay_0_bits_uop_cf_ftqPtr_flag; // @[LoadQueue.scala 182:29]
  assign io_replay_0_bits_uop_cf_ftqPtr_value = loadQueueReplay_io_replay_0_bits_uop_cf_ftqPtr_value; // @[LoadQueue.scala 182:29]
  assign io_replay_0_bits_uop_cf_ftqOffset = loadQueueReplay_io_replay_0_bits_uop_cf_ftqOffset; // @[LoadQueue.scala 182:29]
  assign io_replay_0_bits_uop_ctrl_fuType = loadQueueReplay_io_replay_0_bits_uop_ctrl_fuType; // @[LoadQueue.scala 182:29]
  assign io_replay_0_bits_uop_ctrl_fuOpType = loadQueueReplay_io_replay_0_bits_uop_ctrl_fuOpType; // @[LoadQueue.scala 182:29]
  assign io_replay_0_bits_uop_ctrl_rfWen = loadQueueReplay_io_replay_0_bits_uop_ctrl_rfWen; // @[LoadQueue.scala 182:29]
  assign io_replay_0_bits_uop_ctrl_fpWen = loadQueueReplay_io_replay_0_bits_uop_ctrl_fpWen; // @[LoadQueue.scala 182:29]
  assign io_replay_0_bits_uop_pdest = loadQueueReplay_io_replay_0_bits_uop_pdest; // @[LoadQueue.scala 182:29]
  assign io_replay_0_bits_uop_robIdx_flag = loadQueueReplay_io_replay_0_bits_uop_robIdx_flag; // @[LoadQueue.scala 182:29]
  assign io_replay_0_bits_uop_robIdx_value = loadQueueReplay_io_replay_0_bits_uop_robIdx_value; // @[LoadQueue.scala 182:29]
  assign io_replay_0_bits_uop_lqIdx_flag = loadQueueReplay_io_replay_0_bits_uop_lqIdx_flag; // @[LoadQueue.scala 182:29]
  assign io_replay_0_bits_uop_lqIdx_value = loadQueueReplay_io_replay_0_bits_uop_lqIdx_value; // @[LoadQueue.scala 182:29]
  assign io_replay_0_bits_uop_sqIdx_flag = loadQueueReplay_io_replay_0_bits_uop_sqIdx_flag; // @[LoadQueue.scala 182:29]
  assign io_replay_0_bits_uop_sqIdx_value = loadQueueReplay_io_replay_0_bits_uop_sqIdx_value; // @[LoadQueue.scala 182:29]
  assign io_replay_0_bits_vaddr = loadQueueReplay_io_replay_0_bits_vaddr; // @[LoadQueue.scala 182:29]
  assign io_replay_0_bits_isFirstIssue = loadQueueReplay_io_replay_0_bits_isFirstIssue; // @[LoadQueue.scala 182:29]
  assign io_replay_0_bits_replayCarry_real_way_en = loadQueueReplay_io_replay_0_bits_replayCarry_real_way_en; // @[LoadQueue.scala 182:29]
  assign io_replay_0_bits_replayCarry_valid = loadQueueReplay_io_replay_0_bits_replayCarry_valid; // @[LoadQueue.scala 182:29]
  assign io_replay_0_bits_mshrid = loadQueueReplay_io_replay_0_bits_mshrid; // @[LoadQueue.scala 182:29]
  assign io_replay_0_bits_forward_tlDchannel = loadQueueReplay_io_replay_0_bits_forward_tlDchannel; // @[LoadQueue.scala 182:29]
  assign io_replay_0_bits_rarAllocated = loadQueueReplay_io_replay_0_bits_rarAllocated; // @[LoadQueue.scala 182:29]
  assign io_replay_0_bits_rarIndex = loadQueueReplay_io_replay_0_bits_rarIndex; // @[LoadQueue.scala 182:29]
  assign io_replay_0_bits_rawAllocated = loadQueueReplay_io_replay_0_bits_rawAllocated; // @[LoadQueue.scala 182:29]
  assign io_replay_0_bits_rawIndex = loadQueueReplay_io_replay_0_bits_rawIndex; // @[LoadQueue.scala 182:29]
  assign io_replay_1_valid = loadQueueReplay_io_replay_1_valid; // @[LoadQueue.scala 182:29]
  assign io_replay_1_bits_uop_cf_foldpc = loadQueueReplay_io_replay_1_bits_uop_cf_foldpc; // @[LoadQueue.scala 182:29]
  assign io_replay_1_bits_uop_cf_trigger_backendEn_1 = loadQueueReplay_io_replay_1_bits_uop_cf_trigger_backendEn_1; // @[LoadQueue.scala 182:29]
  assign io_replay_1_bits_uop_cf_trigger_backendHit_0 = loadQueueReplay_io_replay_1_bits_uop_cf_trigger_backendHit_0; // @[LoadQueue.scala 182:29]
  assign io_replay_1_bits_uop_cf_trigger_backendHit_1 = loadQueueReplay_io_replay_1_bits_uop_cf_trigger_backendHit_1; // @[LoadQueue.scala 182:29]
  assign io_replay_1_bits_uop_cf_trigger_backendHit_4 = loadQueueReplay_io_replay_1_bits_uop_cf_trigger_backendHit_4; // @[LoadQueue.scala 182:29]
  assign io_replay_1_bits_uop_cf_waitForRobIdx_flag = loadQueueReplay_io_replay_1_bits_uop_cf_waitForRobIdx_flag; // @[LoadQueue.scala 182:29]
  assign io_replay_1_bits_uop_cf_waitForRobIdx_value = loadQueueReplay_io_replay_1_bits_uop_cf_waitForRobIdx_value; // @[LoadQueue.scala 182:29]
  assign io_replay_1_bits_uop_cf_loadWaitBit = loadQueueReplay_io_replay_1_bits_uop_cf_loadWaitBit; // @[LoadQueue.scala 182:29]
  assign io_replay_1_bits_uop_cf_loadWaitStrict = loadQueueReplay_io_replay_1_bits_uop_cf_loadWaitStrict; // @[LoadQueue.scala 182:29]
  assign io_replay_1_bits_uop_cf_ftqPtr_flag = loadQueueReplay_io_replay_1_bits_uop_cf_ftqPtr_flag; // @[LoadQueue.scala 182:29]
  assign io_replay_1_bits_uop_cf_ftqPtr_value = loadQueueReplay_io_replay_1_bits_uop_cf_ftqPtr_value; // @[LoadQueue.scala 182:29]
  assign io_replay_1_bits_uop_cf_ftqOffset = loadQueueReplay_io_replay_1_bits_uop_cf_ftqOffset; // @[LoadQueue.scala 182:29]
  assign io_replay_1_bits_uop_ctrl_fuType = loadQueueReplay_io_replay_1_bits_uop_ctrl_fuType; // @[LoadQueue.scala 182:29]
  assign io_replay_1_bits_uop_ctrl_fuOpType = loadQueueReplay_io_replay_1_bits_uop_ctrl_fuOpType; // @[LoadQueue.scala 182:29]
  assign io_replay_1_bits_uop_ctrl_rfWen = loadQueueReplay_io_replay_1_bits_uop_ctrl_rfWen; // @[LoadQueue.scala 182:29]
  assign io_replay_1_bits_uop_ctrl_fpWen = loadQueueReplay_io_replay_1_bits_uop_ctrl_fpWen; // @[LoadQueue.scala 182:29]
  assign io_replay_1_bits_uop_pdest = loadQueueReplay_io_replay_1_bits_uop_pdest; // @[LoadQueue.scala 182:29]
  assign io_replay_1_bits_uop_robIdx_flag = loadQueueReplay_io_replay_1_bits_uop_robIdx_flag; // @[LoadQueue.scala 182:29]
  assign io_replay_1_bits_uop_robIdx_value = loadQueueReplay_io_replay_1_bits_uop_robIdx_value; // @[LoadQueue.scala 182:29]
  assign io_replay_1_bits_uop_lqIdx_flag = loadQueueReplay_io_replay_1_bits_uop_lqIdx_flag; // @[LoadQueue.scala 182:29]
  assign io_replay_1_bits_uop_lqIdx_value = loadQueueReplay_io_replay_1_bits_uop_lqIdx_value; // @[LoadQueue.scala 182:29]
  assign io_replay_1_bits_uop_sqIdx_flag = loadQueueReplay_io_replay_1_bits_uop_sqIdx_flag; // @[LoadQueue.scala 182:29]
  assign io_replay_1_bits_uop_sqIdx_value = loadQueueReplay_io_replay_1_bits_uop_sqIdx_value; // @[LoadQueue.scala 182:29]
  assign io_replay_1_bits_vaddr = loadQueueReplay_io_replay_1_bits_vaddr; // @[LoadQueue.scala 182:29]
  assign io_replay_1_bits_isFirstIssue = loadQueueReplay_io_replay_1_bits_isFirstIssue; // @[LoadQueue.scala 182:29]
  assign io_replay_1_bits_replayCarry_real_way_en = loadQueueReplay_io_replay_1_bits_replayCarry_real_way_en; // @[LoadQueue.scala 182:29]
  assign io_replay_1_bits_replayCarry_valid = loadQueueReplay_io_replay_1_bits_replayCarry_valid; // @[LoadQueue.scala 182:29]
  assign io_replay_1_bits_mshrid = loadQueueReplay_io_replay_1_bits_mshrid; // @[LoadQueue.scala 182:29]
  assign io_replay_1_bits_forward_tlDchannel = loadQueueReplay_io_replay_1_bits_forward_tlDchannel; // @[LoadQueue.scala 182:29]
  assign io_replay_1_bits_rarAllocated = loadQueueReplay_io_replay_1_bits_rarAllocated; // @[LoadQueue.scala 182:29]
  assign io_replay_1_bits_rarIndex = loadQueueReplay_io_replay_1_bits_rarIndex; // @[LoadQueue.scala 182:29]
  assign io_replay_1_bits_rawAllocated = loadQueueReplay_io_replay_1_bits_rawAllocated; // @[LoadQueue.scala 182:29]
  assign io_replay_1_bits_rawIndex = loadQueueReplay_io_replay_1_bits_rawIndex; // @[LoadQueue.scala 182:29]
  assign io_rollback_valid = loadQueueRAW_io_rollback_valid; // @[LoadQueue.scala 150:28]
  assign io_rollback_bits_robIdx_flag = loadQueueRAW_io_rollback_bits_robIdx_flag; // @[LoadQueue.scala 150:28]
  assign io_rollback_bits_robIdx_value = loadQueueRAW_io_rollback_bits_robIdx_value; // @[LoadQueue.scala 150:28]
  assign io_rollback_bits_ftqIdx_flag = loadQueueRAW_io_rollback_bits_ftqIdx_flag; // @[LoadQueue.scala 150:28]
  assign io_rollback_bits_ftqIdx_value = loadQueueRAW_io_rollback_bits_ftqIdx_value; // @[LoadQueue.scala 150:28]
  assign io_rollback_bits_ftqOffset = loadQueueRAW_io_rollback_bits_ftqOffset; // @[LoadQueue.scala 150:28]
  assign io_rollback_bits_stFtqIdx_value = loadQueueRAW_io_rollback_bits_stFtqIdx_value; // @[LoadQueue.scala 150:28]
  assign io_rollback_bits_stFtqOffset = loadQueueRAW_io_rollback_bits_stFtqOffset; // @[LoadQueue.scala 150:28]
  assign io_correctTableUpdate_valid = loadQueueRAW_io_correctTableUpdate_valid; // @[LoadQueue.scala 152:38]
  assign io_correctTableUpdate_bits_addr = loadQueueRAW_io_correctTableUpdate_bits_addr; // @[LoadQueue.scala 152:38]
  assign io_rob_isMMIO_0 = loadQueueFlag_io_rob_isMMIO_0; // @[LoadQueue.scala 167:24]
  assign io_rob_isMMIO_1 = loadQueueFlag_io_rob_isMMIO_1; // @[LoadQueue.scala 167:24]
  assign io_rob_uop_0_robIdx_value = loadQueueFlag_io_rob_uop_0_robIdx_value; // @[LoadQueue.scala 167:24]
  assign io_rob_uop_1_robIdx_value = loadQueueFlag_io_rob_uop_1_robIdx_value; // @[LoadQueue.scala 167:24]
  assign io_uncache_req_valid = loadQueueFlag_io_uncache_req_valid; // @[LoadQueue.scala 168:28]
  assign io_uncache_req_bits_addr = loadQueueFlag_io_uncache_req_bits_addr; // @[LoadQueue.scala 168:28]
  assign io_uncache_req_bits_mask = loadQueueFlag_io_uncache_req_bits_mask; // @[LoadQueue.scala 168:28]
  assign io_trigger_0_lqLoadAddrTriggerHitVec_0 = loadQueueFlag_io_trigger_0_lqLoadAddrTriggerHitVec_0; // @[LoadQueue.scala 169:28]
  assign io_trigger_0_lqLoadAddrTriggerHitVec_1 = loadQueueFlag_io_trigger_0_lqLoadAddrTriggerHitVec_1; // @[LoadQueue.scala 169:28]
  assign io_trigger_0_lqLoadAddrTriggerHitVec_2 = loadQueueFlag_io_trigger_0_lqLoadAddrTriggerHitVec_2; // @[LoadQueue.scala 169:28]
  assign io_exceptionAddr_vaddr = loadQueueFlag_io_exceptionAddr_vaddr; // @[LoadQueue.scala 170:34]
  assign io_lqDeq = loadQueueFlag_io_lqDeq; // @[LoadQueue.scala 172:26]
  assign io_lqCancelCnt = loadQueueFlag_io_lqCancelCnt; // @[LoadQueue.scala 173:32]
  assign io_lqReplayFull = loadQueueReplay_io_lqFull; // @[LoadQueue.scala 187:29]
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
  assign loadQueueRAR_clock = clock;
  assign loadQueueRAR_reset = reset;
  assign loadQueueRAR_io_redirect_valid = io_redirect_valid; // @[LoadQueue.scala 141:28]
  assign loadQueueRAR_io_redirect_bits_robIdx_flag = io_redirect_bits_robIdx_flag; // @[LoadQueue.scala 141:28]
  assign loadQueueRAR_io_redirect_bits_robIdx_value = io_redirect_bits_robIdx_value; // @[LoadQueue.scala 141:28]
  assign loadQueueRAR_io_redirect_bits_level = io_redirect_bits_level; // @[LoadQueue.scala 141:28]
  assign loadQueueRAR_io_query_0_req_valid = io_ldu_s2_loadLoadViolationQuery_0_req_valid; // @[LoadQueue.scala 144:25]
  assign loadQueueRAR_io_query_0_req_bits_uop_robIdx_flag = io_ldu_s2_loadLoadViolationQuery_0_req_bits_uop_robIdx_flag; // @[LoadQueue.scala 144:25]
  assign loadQueueRAR_io_query_0_req_bits_uop_robIdx_value =
    io_ldu_s2_loadLoadViolationQuery_0_req_bits_uop_robIdx_value; // @[LoadQueue.scala 144:25]
  assign loadQueueRAR_io_query_0_req_bits_uop_lqIdx_flag = io_ldu_s2_loadLoadViolationQuery_0_req_bits_uop_lqIdx_flag; // @[LoadQueue.scala 144:25]
  assign loadQueueRAR_io_query_0_req_bits_uop_lqIdx_value = io_ldu_s2_loadLoadViolationQuery_0_req_bits_uop_lqIdx_value; // @[LoadQueue.scala 144:25]
  assign loadQueueRAR_io_query_0_req_bits_index = io_ldu_s2_loadLoadViolationQuery_0_req_bits_index; // @[LoadQueue.scala 144:25]
  assign loadQueueRAR_io_query_0_req_bits_allocated = io_ldu_s2_loadLoadViolationQuery_0_req_bits_allocated; // @[LoadQueue.scala 144:25]
  assign loadQueueRAR_io_query_0_req_bits_datavalid = io_ldu_s2_loadLoadViolationQuery_0_req_bits_datavalid; // @[LoadQueue.scala 144:25]
  assign loadQueueRAR_io_query_0_req_bits_miss = io_ldu_s2_loadLoadViolationQuery_0_req_bits_miss; // @[LoadQueue.scala 144:25]
  assign loadQueueRAR_io_query_0_req_bits_paddr = io_ldu_s2_loadLoadViolationQuery_0_req_bits_paddr; // @[LoadQueue.scala 144:25]
  assign loadQueueRAR_io_query_1_req_valid = io_ldu_s2_loadLoadViolationQuery_1_req_valid; // @[LoadQueue.scala 144:25]
  assign loadQueueRAR_io_query_1_req_bits_uop_robIdx_flag = io_ldu_s2_loadLoadViolationQuery_1_req_bits_uop_robIdx_flag; // @[LoadQueue.scala 144:25]
  assign loadQueueRAR_io_query_1_req_bits_uop_robIdx_value =
    io_ldu_s2_loadLoadViolationQuery_1_req_bits_uop_robIdx_value; // @[LoadQueue.scala 144:25]
  assign loadQueueRAR_io_query_1_req_bits_uop_lqIdx_flag = io_ldu_s2_loadLoadViolationQuery_1_req_bits_uop_lqIdx_flag; // @[LoadQueue.scala 144:25]
  assign loadQueueRAR_io_query_1_req_bits_uop_lqIdx_value = io_ldu_s2_loadLoadViolationQuery_1_req_bits_uop_lqIdx_value; // @[LoadQueue.scala 144:25]
  assign loadQueueRAR_io_query_1_req_bits_index = io_ldu_s2_loadLoadViolationQuery_1_req_bits_index; // @[LoadQueue.scala 144:25]
  assign loadQueueRAR_io_query_1_req_bits_allocated = io_ldu_s2_loadLoadViolationQuery_1_req_bits_allocated; // @[LoadQueue.scala 144:25]
  assign loadQueueRAR_io_query_1_req_bits_datavalid = io_ldu_s2_loadLoadViolationQuery_1_req_bits_datavalid; // @[LoadQueue.scala 144:25]
  assign loadQueueRAR_io_query_1_req_bits_miss = io_ldu_s2_loadLoadViolationQuery_1_req_bits_miss; // @[LoadQueue.scala 144:25]
  assign loadQueueRAR_io_query_1_req_bits_paddr = io_ldu_s2_loadLoadViolationQuery_1_req_bits_paddr; // @[LoadQueue.scala 144:25]
  assign loadQueueRAR_io_release_valid = io_release_valid; // @[LoadQueue.scala 142:27]
  assign loadQueueRAR_io_release_bits_paddr = io_release_bits_paddr; // @[LoadQueue.scala 142:27]
  assign loadQueueRAR_io_ldIssuePtr_flag = loadQueueFlag_io_ldIssuePtr_flag; // @[LoadQueue.scala 143:30]
  assign loadQueueRAR_io_ldIssuePtr_value = loadQueueFlag_io_ldIssuePtr_value; // @[LoadQueue.scala 143:30]
  assign loadQueueRAW_clock = clock;
  assign loadQueueRAW_reset = reset;
  assign loadQueueRAW_io_redirect_valid = io_redirect_valid; // @[LoadQueue.scala 149:28]
  assign loadQueueRAW_io_redirect_bits_robIdx_flag = io_redirect_bits_robIdx_flag; // @[LoadQueue.scala 149:28]
  assign loadQueueRAW_io_redirect_bits_robIdx_value = io_redirect_bits_robIdx_value; // @[LoadQueue.scala 149:28]
  assign loadQueueRAW_io_redirect_bits_level = io_redirect_bits_level; // @[LoadQueue.scala 149:28]
  assign loadQueueRAW_io_query_0_req_valid = io_ldu_s2_storeLoadViolationQuery_0_req_valid; // @[LoadQueue.scala 157:25]
  assign loadQueueRAW_io_query_0_req_bits_uop_cf_foldpc = io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_cf_foldpc; // @[LoadQueue.scala 157:25]
  assign loadQueueRAW_io_query_0_req_bits_uop_cf_ftqPtr_flag =
    io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_cf_ftqPtr_flag; // @[LoadQueue.scala 157:25]
  assign loadQueueRAW_io_query_0_req_bits_uop_cf_ftqPtr_value =
    io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_cf_ftqPtr_value; // @[LoadQueue.scala 157:25]
  assign loadQueueRAW_io_query_0_req_bits_uop_cf_ftqOffset =
    io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_cf_ftqOffset; // @[LoadQueue.scala 157:25]
  assign loadQueueRAW_io_query_0_req_bits_uop_robIdx_flag = io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_robIdx_flag
    ; // @[LoadQueue.scala 157:25]
  assign loadQueueRAW_io_query_0_req_bits_uop_robIdx_value =
    io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_robIdx_value; // @[LoadQueue.scala 157:25]
  assign loadQueueRAW_io_query_0_req_bits_uop_sqIdx_flag = io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_sqIdx_flag; // @[LoadQueue.scala 157:25]
  assign loadQueueRAW_io_query_0_req_bits_uop_sqIdx_value = io_ldu_s2_storeLoadViolationQuery_0_req_bits_uop_sqIdx_value
    ; // @[LoadQueue.scala 157:25]
  assign loadQueueRAW_io_query_0_req_bits_index = io_ldu_s2_storeLoadViolationQuery_0_req_bits_index; // @[LoadQueue.scala 157:25]
  assign loadQueueRAW_io_query_0_req_bits_allocated = io_ldu_s2_storeLoadViolationQuery_0_req_bits_allocated; // @[LoadQueue.scala 157:25]
  assign loadQueueRAW_io_query_0_req_bits_datavalid = io_ldu_s2_storeLoadViolationQuery_0_req_bits_datavalid; // @[LoadQueue.scala 157:25]
  assign loadQueueRAW_io_query_0_req_bits_mask = io_ldu_s2_storeLoadViolationQuery_0_req_bits_mask; // @[LoadQueue.scala 157:25]
  assign loadQueueRAW_io_query_0_req_bits_paddr = io_ldu_s2_storeLoadViolationQuery_0_req_bits_paddr; // @[LoadQueue.scala 157:25]
  assign loadQueueRAW_io_query_1_req_valid = io_ldu_s2_storeLoadViolationQuery_1_req_valid; // @[LoadQueue.scala 157:25]
  assign loadQueueRAW_io_query_1_req_bits_uop_cf_foldpc = io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_cf_foldpc; // @[LoadQueue.scala 157:25]
  assign loadQueueRAW_io_query_1_req_bits_uop_cf_ftqPtr_flag =
    io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_cf_ftqPtr_flag; // @[LoadQueue.scala 157:25]
  assign loadQueueRAW_io_query_1_req_bits_uop_cf_ftqPtr_value =
    io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_cf_ftqPtr_value; // @[LoadQueue.scala 157:25]
  assign loadQueueRAW_io_query_1_req_bits_uop_cf_ftqOffset =
    io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_cf_ftqOffset; // @[LoadQueue.scala 157:25]
  assign loadQueueRAW_io_query_1_req_bits_uop_robIdx_flag = io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_robIdx_flag
    ; // @[LoadQueue.scala 157:25]
  assign loadQueueRAW_io_query_1_req_bits_uop_robIdx_value =
    io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_robIdx_value; // @[LoadQueue.scala 157:25]
  assign loadQueueRAW_io_query_1_req_bits_uop_sqIdx_flag = io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_sqIdx_flag; // @[LoadQueue.scala 157:25]
  assign loadQueueRAW_io_query_1_req_bits_uop_sqIdx_value = io_ldu_s2_storeLoadViolationQuery_1_req_bits_uop_sqIdx_value
    ; // @[LoadQueue.scala 157:25]
  assign loadQueueRAW_io_query_1_req_bits_index = io_ldu_s2_storeLoadViolationQuery_1_req_bits_index; // @[LoadQueue.scala 157:25]
  assign loadQueueRAW_io_query_1_req_bits_allocated = io_ldu_s2_storeLoadViolationQuery_1_req_bits_allocated; // @[LoadQueue.scala 157:25]
  assign loadQueueRAW_io_query_1_req_bits_datavalid = io_ldu_s2_storeLoadViolationQuery_1_req_bits_datavalid; // @[LoadQueue.scala 157:25]
  assign loadQueueRAW_io_query_1_req_bits_mask = io_ldu_s2_storeLoadViolationQuery_1_req_bits_mask; // @[LoadQueue.scala 157:25]
  assign loadQueueRAW_io_query_1_req_bits_paddr = io_ldu_s2_storeLoadViolationQuery_1_req_bits_paddr; // @[LoadQueue.scala 157:25]
  assign loadQueueRAW_io_storeIn_0_valid = io_sta_s1_storeAddrIn_0_valid; // @[LoadQueue.scala 151:27]
  assign loadQueueRAW_io_storeIn_0_bits_uop_cf_ftqPtr_value = io_sta_s1_storeAddrIn_0_bits_uop_cf_ftqPtr_value; // @[LoadQueue.scala 151:27]
  assign loadQueueRAW_io_storeIn_0_bits_uop_cf_ftqOffset = io_sta_s1_storeAddrIn_0_bits_uop_cf_ftqOffset; // @[LoadQueue.scala 151:27]
  assign loadQueueRAW_io_storeIn_0_bits_uop_robIdx_flag = io_sta_s1_storeAddrIn_0_bits_uop_robIdx_flag; // @[LoadQueue.scala 151:27]
  assign loadQueueRAW_io_storeIn_0_bits_uop_robIdx_value = io_sta_s1_storeAddrIn_0_bits_uop_robIdx_value; // @[LoadQueue.scala 151:27]
  assign loadQueueRAW_io_storeIn_0_bits_paddr = io_sta_s1_storeAddrIn_0_bits_paddr; // @[LoadQueue.scala 151:27]
  assign loadQueueRAW_io_storeIn_0_bits_mask = io_sta_s1_storeAddrIn_0_bits_mask; // @[LoadQueue.scala 151:27]
  assign loadQueueRAW_io_storeIn_0_bits_miss = io_sta_s1_storeAddrIn_0_bits_miss; // @[LoadQueue.scala 151:27]
  assign loadQueueRAW_io_storeIn_1_valid = io_sta_s1_storeAddrIn_1_valid; // @[LoadQueue.scala 151:27]
  assign loadQueueRAW_io_storeIn_1_bits_uop_cf_ftqPtr_value = io_sta_s1_storeAddrIn_1_bits_uop_cf_ftqPtr_value; // @[LoadQueue.scala 151:27]
  assign loadQueueRAW_io_storeIn_1_bits_uop_cf_ftqOffset = io_sta_s1_storeAddrIn_1_bits_uop_cf_ftqOffset; // @[LoadQueue.scala 151:27]
  assign loadQueueRAW_io_storeIn_1_bits_uop_robIdx_flag = io_sta_s1_storeAddrIn_1_bits_uop_robIdx_flag; // @[LoadQueue.scala 151:27]
  assign loadQueueRAW_io_storeIn_1_bits_uop_robIdx_value = io_sta_s1_storeAddrIn_1_bits_uop_robIdx_value; // @[LoadQueue.scala 151:27]
  assign loadQueueRAW_io_storeIn_1_bits_paddr = io_sta_s1_storeAddrIn_1_bits_paddr; // @[LoadQueue.scala 151:27]
  assign loadQueueRAW_io_storeIn_1_bits_mask = io_sta_s1_storeAddrIn_1_bits_mask; // @[LoadQueue.scala 151:27]
  assign loadQueueRAW_io_storeIn_1_bits_miss = io_sta_s1_storeAddrIn_1_bits_miss; // @[LoadQueue.scala 151:27]
  assign loadQueueRAW_io_stAddrReadySqPtr_flag = io_sq_stAddrReadySqPtr_flag; // @[LoadQueue.scala 153:36]
  assign loadQueueRAW_io_stAddrReadySqPtr_value = io_sq_stAddrReadySqPtr_value; // @[LoadQueue.scala 153:36]
  assign loadQueueReplay_clock = clock;
  assign loadQueueReplay_reset = reset;
  assign loadQueueReplay_io_redirect_valid = io_redirect_valid; // @[LoadQueue.scala 178:31]
  assign loadQueueReplay_io_redirect_bits_robIdx_flag = io_redirect_bits_robIdx_flag; // @[LoadQueue.scala 178:31]
  assign loadQueueReplay_io_redirect_bits_robIdx_value = io_redirect_bits_robIdx_value; // @[LoadQueue.scala 178:31]
  assign loadQueueReplay_io_redirect_bits_level = io_redirect_bits_level; // @[LoadQueue.scala 178:31]
  assign loadQueueReplay_io_enq_0_valid = io_ldu_s3_loadIn_0_valid; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_0_bits_uop_cf_foldpc = io_ldu_s3_loadIn_0_bits_uop_cf_foldpc; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_0_bits_uop_cf_exceptionVec_4 = io_ldu_s3_loadIn_0_bits_uop_cf_exceptionVec_4; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_0_bits_uop_cf_exceptionVec_5 = io_ldu_s3_loadIn_0_bits_uop_cf_exceptionVec_5; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_0_bits_uop_cf_exceptionVec_13 = io_ldu_s3_loadIn_0_bits_uop_cf_exceptionVec_13; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_0_bits_uop_cf_trigger_backendEn_1 = io_ldu_s3_loadIn_0_bits_uop_cf_trigger_backendEn_1; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_0_bits_uop_cf_trigger_backendHit_0 = io_ldu_s3_loadIn_0_bits_uop_cf_trigger_backendHit_0
    ; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_0_bits_uop_cf_trigger_backendHit_1 = io_ldu_s3_loadIn_0_bits_uop_cf_trigger_backendHit_1
    ; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_0_bits_uop_cf_trigger_backendHit_4 = io_ldu_s3_loadIn_0_bits_uop_cf_trigger_backendHit_4
    ; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_0_bits_uop_cf_waitForRobIdx_flag = io_ldu_s3_loadIn_0_bits_uop_cf_waitForRobIdx_flag; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_0_bits_uop_cf_waitForRobIdx_value = io_ldu_s3_loadIn_0_bits_uop_cf_waitForRobIdx_value; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_0_bits_uop_cf_loadWaitBit = io_ldu_s3_loadIn_0_bits_uop_cf_loadWaitBit; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_0_bits_uop_cf_loadWaitStrict = io_ldu_s3_loadIn_0_bits_uop_cf_loadWaitStrict; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_0_bits_uop_cf_ftqPtr_flag = io_ldu_s3_loadIn_0_bits_uop_cf_ftqPtr_flag; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_0_bits_uop_cf_ftqPtr_value = io_ldu_s3_loadIn_0_bits_uop_cf_ftqPtr_value; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_0_bits_uop_cf_ftqOffset = io_ldu_s3_loadIn_0_bits_uop_cf_ftqOffset; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_0_bits_uop_ctrl_fuType = io_ldu_s3_loadIn_0_bits_uop_ctrl_fuType; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_0_bits_uop_ctrl_fuOpType = io_ldu_s3_loadIn_0_bits_uop_ctrl_fuOpType; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_0_bits_uop_ctrl_rfWen = io_ldu_s3_loadIn_0_bits_uop_ctrl_rfWen; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_0_bits_uop_ctrl_fpWen = io_ldu_s3_loadIn_0_bits_uop_ctrl_fpWen; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_0_bits_uop_pdest = io_ldu_s3_loadIn_0_bits_uop_pdest; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_0_bits_uop_robIdx_flag = io_ldu_s3_loadIn_0_bits_uop_robIdx_flag; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_0_bits_uop_robIdx_value = io_ldu_s3_loadIn_0_bits_uop_robIdx_value; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_0_bits_uop_lqIdx_flag = io_ldu_s3_loadIn_0_bits_uop_lqIdx_flag; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_0_bits_uop_lqIdx_value = io_ldu_s3_loadIn_0_bits_uop_lqIdx_value; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_0_bits_uop_sqIdx_flag = io_ldu_s3_loadIn_0_bits_uop_sqIdx_flag; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_0_bits_uop_sqIdx_value = io_ldu_s3_loadIn_0_bits_uop_sqIdx_value; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_0_bits_vaddr = io_ldu_s3_loadIn_0_bits_vaddr; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_0_bits_tlbMiss = io_ldu_s3_loadIn_0_bits_tlbMiss; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_0_bits_rarAllocated = io_ldu_s3_loadIn_0_bits_rarAllocated; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_0_bits_rarIndex = io_ldu_s3_loadIn_0_bits_rarIndex; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_0_bits_rawAllocated = io_ldu_s3_loadIn_0_bits_rawAllocated; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_0_bits_rawIndex = io_ldu_s3_loadIn_0_bits_rawIndex; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_0_bits_replayInfo_missMSHRId = io_ldu_s3_loadIn_0_bits_replayInfo_missMSHRId; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_0_bits_replayInfo_canForwardFullData =
    io_ldu_s3_loadIn_0_bits_replayInfo_canForwardFullData; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_0_bits_replayInfo_dataInvalidSqIdx_flag =
    io_ldu_s3_loadIn_0_bits_replayInfo_dataInvalidSqIdx_flag; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_0_bits_replayInfo_dataInvalidSqIdx_value =
    io_ldu_s3_loadIn_0_bits_replayInfo_dataInvalidSqIdx_value; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_0_bits_replayInfo_addrInvalidSqIdx_flag =
    io_ldu_s3_loadIn_0_bits_replayInfo_addrInvalidSqIdx_flag; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_0_bits_replayInfo_addrInvalidSqIdx_value =
    io_ldu_s3_loadIn_0_bits_replayInfo_addrInvalidSqIdx_value; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_0_bits_replayInfo_replayCarry_real_way_en =
    io_ldu_s3_loadIn_0_bits_replayInfo_replayCarry_real_way_en; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_0_bits_replayInfo_replayCarry_valid =
    io_ldu_s3_loadIn_0_bits_replayInfo_replayCarry_valid; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_0_bits_replayInfo_dataInLastBeat = io_ldu_s3_loadIn_0_bits_replayInfo_dataInLastBeat; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_0_bits_replayInfo_cause_0 = io_ldu_s3_loadIn_0_bits_replayInfo_cause_0; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_0_bits_replayInfo_cause_1 = io_ldu_s3_loadIn_0_bits_replayInfo_cause_1; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_0_bits_replayInfo_cause_2 = io_ldu_s3_loadIn_0_bits_replayInfo_cause_2; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_0_bits_replayInfo_cause_3 = io_ldu_s3_loadIn_0_bits_replayInfo_cause_3; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_0_bits_replayInfo_cause_4 = io_ldu_s3_loadIn_0_bits_replayInfo_cause_4; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_0_bits_replayInfo_cause_5 = io_ldu_s3_loadIn_0_bits_replayInfo_cause_5; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_0_bits_replayInfo_cause_6 = io_ldu_s3_loadIn_0_bits_replayInfo_cause_6; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_0_bits_replayInfo_cause_7 = io_ldu_s3_loadIn_0_bits_replayInfo_cause_7; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_1_valid = io_ldu_s3_loadIn_1_valid; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_1_bits_uop_cf_foldpc = io_ldu_s3_loadIn_1_bits_uop_cf_foldpc; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_1_bits_uop_cf_exceptionVec_4 = io_ldu_s3_loadIn_1_bits_uop_cf_exceptionVec_4; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_1_bits_uop_cf_exceptionVec_5 = io_ldu_s3_loadIn_1_bits_uop_cf_exceptionVec_5; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_1_bits_uop_cf_exceptionVec_13 = io_ldu_s3_loadIn_1_bits_uop_cf_exceptionVec_13; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_1_bits_uop_cf_trigger_backendEn_1 = io_ldu_s3_loadIn_1_bits_uop_cf_trigger_backendEn_1; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_1_bits_uop_cf_trigger_backendHit_0 = io_ldu_s3_loadIn_1_bits_uop_cf_trigger_backendHit_0
    ; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_1_bits_uop_cf_trigger_backendHit_1 = io_ldu_s3_loadIn_1_bits_uop_cf_trigger_backendHit_1
    ; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_1_bits_uop_cf_trigger_backendHit_4 = io_ldu_s3_loadIn_1_bits_uop_cf_trigger_backendHit_4
    ; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_1_bits_uop_cf_waitForRobIdx_flag = io_ldu_s3_loadIn_1_bits_uop_cf_waitForRobIdx_flag; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_1_bits_uop_cf_waitForRobIdx_value = io_ldu_s3_loadIn_1_bits_uop_cf_waitForRobIdx_value; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_1_bits_uop_cf_loadWaitBit = io_ldu_s3_loadIn_1_bits_uop_cf_loadWaitBit; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_1_bits_uop_cf_loadWaitStrict = io_ldu_s3_loadIn_1_bits_uop_cf_loadWaitStrict; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_1_bits_uop_cf_ftqPtr_flag = io_ldu_s3_loadIn_1_bits_uop_cf_ftqPtr_flag; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_1_bits_uop_cf_ftqPtr_value = io_ldu_s3_loadIn_1_bits_uop_cf_ftqPtr_value; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_1_bits_uop_cf_ftqOffset = io_ldu_s3_loadIn_1_bits_uop_cf_ftqOffset; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_1_bits_uop_ctrl_fuType = io_ldu_s3_loadIn_1_bits_uop_ctrl_fuType; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_1_bits_uop_ctrl_fuOpType = io_ldu_s3_loadIn_1_bits_uop_ctrl_fuOpType; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_1_bits_uop_ctrl_rfWen = io_ldu_s3_loadIn_1_bits_uop_ctrl_rfWen; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_1_bits_uop_ctrl_fpWen = io_ldu_s3_loadIn_1_bits_uop_ctrl_fpWen; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_1_bits_uop_pdest = io_ldu_s3_loadIn_1_bits_uop_pdest; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_1_bits_uop_robIdx_flag = io_ldu_s3_loadIn_1_bits_uop_robIdx_flag; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_1_bits_uop_robIdx_value = io_ldu_s3_loadIn_1_bits_uop_robIdx_value; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_1_bits_uop_lqIdx_flag = io_ldu_s3_loadIn_1_bits_uop_lqIdx_flag; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_1_bits_uop_lqIdx_value = io_ldu_s3_loadIn_1_bits_uop_lqIdx_value; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_1_bits_uop_sqIdx_flag = io_ldu_s3_loadIn_1_bits_uop_sqIdx_flag; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_1_bits_uop_sqIdx_value = io_ldu_s3_loadIn_1_bits_uop_sqIdx_value; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_1_bits_vaddr = io_ldu_s3_loadIn_1_bits_vaddr; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_1_bits_tlbMiss = io_ldu_s3_loadIn_1_bits_tlbMiss; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_1_bits_rarAllocated = io_ldu_s3_loadIn_1_bits_rarAllocated; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_1_bits_rarIndex = io_ldu_s3_loadIn_1_bits_rarIndex; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_1_bits_rawAllocated = io_ldu_s3_loadIn_1_bits_rawAllocated; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_1_bits_rawIndex = io_ldu_s3_loadIn_1_bits_rawIndex; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_1_bits_replayInfo_missMSHRId = io_ldu_s3_loadIn_1_bits_replayInfo_missMSHRId; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_1_bits_replayInfo_canForwardFullData =
    io_ldu_s3_loadIn_1_bits_replayInfo_canForwardFullData; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_1_bits_replayInfo_dataInvalidSqIdx_flag =
    io_ldu_s3_loadIn_1_bits_replayInfo_dataInvalidSqIdx_flag; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_1_bits_replayInfo_dataInvalidSqIdx_value =
    io_ldu_s3_loadIn_1_bits_replayInfo_dataInvalidSqIdx_value; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_1_bits_replayInfo_addrInvalidSqIdx_flag =
    io_ldu_s3_loadIn_1_bits_replayInfo_addrInvalidSqIdx_flag; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_1_bits_replayInfo_addrInvalidSqIdx_value =
    io_ldu_s3_loadIn_1_bits_replayInfo_addrInvalidSqIdx_value; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_1_bits_replayInfo_replayCarry_real_way_en =
    io_ldu_s3_loadIn_1_bits_replayInfo_replayCarry_real_way_en; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_1_bits_replayInfo_replayCarry_valid =
    io_ldu_s3_loadIn_1_bits_replayInfo_replayCarry_valid; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_1_bits_replayInfo_dataInLastBeat = io_ldu_s3_loadIn_1_bits_replayInfo_dataInLastBeat; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_1_bits_replayInfo_cause_0 = io_ldu_s3_loadIn_1_bits_replayInfo_cause_0; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_1_bits_replayInfo_cause_1 = io_ldu_s3_loadIn_1_bits_replayInfo_cause_1; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_1_bits_replayInfo_cause_2 = io_ldu_s3_loadIn_1_bits_replayInfo_cause_2; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_1_bits_replayInfo_cause_3 = io_ldu_s3_loadIn_1_bits_replayInfo_cause_3; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_1_bits_replayInfo_cause_4 = io_ldu_s3_loadIn_1_bits_replayInfo_cause_4; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_1_bits_replayInfo_cause_5 = io_ldu_s3_loadIn_1_bits_replayInfo_cause_5; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_1_bits_replayInfo_cause_6 = io_ldu_s3_loadIn_1_bits_replayInfo_cause_6; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_enq_1_bits_replayInfo_cause_7 = io_ldu_s3_loadIn_1_bits_replayInfo_cause_7; // @[LoadQueue.scala 179:26]
  assign loadQueueReplay_io_storeAddrIn_0_valid = io_sta_s1_storeAddrIn_0_valid; // @[LoadQueue.scala 180:34]
  assign loadQueueReplay_io_storeAddrIn_0_bits_uop_sqIdx_flag = io_sta_s1_storeAddrIn_0_bits_uop_sqIdx_flag; // @[LoadQueue.scala 180:34]
  assign loadQueueReplay_io_storeAddrIn_0_bits_uop_sqIdx_value = io_sta_s1_storeAddrIn_0_bits_uop_sqIdx_value; // @[LoadQueue.scala 180:34]
  assign loadQueueReplay_io_storeAddrIn_0_bits_miss = io_sta_s1_storeAddrIn_0_bits_miss; // @[LoadQueue.scala 180:34]
  assign loadQueueReplay_io_storeAddrIn_1_valid = io_sta_s1_storeAddrIn_1_valid; // @[LoadQueue.scala 180:34]
  assign loadQueueReplay_io_storeAddrIn_1_bits_uop_sqIdx_flag = io_sta_s1_storeAddrIn_1_bits_uop_sqIdx_flag; // @[LoadQueue.scala 180:34]
  assign loadQueueReplay_io_storeAddrIn_1_bits_uop_sqIdx_value = io_sta_s1_storeAddrIn_1_bits_uop_sqIdx_value; // @[LoadQueue.scala 180:34]
  assign loadQueueReplay_io_storeAddrIn_1_bits_miss = io_sta_s1_storeAddrIn_1_bits_miss; // @[LoadQueue.scala 180:34]
  assign loadQueueReplay_io_storeDataIn_0_valid = io_std_s0_storeDataIn_0_valid; // @[LoadQueue.scala 181:34]
  assign loadQueueReplay_io_storeDataIn_0_bits_uop_sqIdx_flag = io_std_s0_storeDataIn_0_bits_uop_sqIdx_flag; // @[LoadQueue.scala 181:34]
  assign loadQueueReplay_io_storeDataIn_0_bits_uop_sqIdx_value = io_std_s0_storeDataIn_0_bits_uop_sqIdx_value; // @[LoadQueue.scala 181:34]
  assign loadQueueReplay_io_storeDataIn_1_valid = io_std_s0_storeDataIn_1_valid; // @[LoadQueue.scala 181:34]
  assign loadQueueReplay_io_storeDataIn_1_bits_uop_sqIdx_flag = io_std_s0_storeDataIn_1_bits_uop_sqIdx_flag; // @[LoadQueue.scala 181:34]
  assign loadQueueReplay_io_storeDataIn_1_bits_uop_sqIdx_value = io_std_s0_storeDataIn_1_bits_uop_sqIdx_value; // @[LoadQueue.scala 181:34]
  assign loadQueueReplay_io_replay_0_ready = io_replay_0_ready; // @[LoadQueue.scala 182:29]
  assign loadQueueReplay_io_replay_1_ready = io_replay_1_ready; // @[LoadQueue.scala 182:29]
  assign loadQueueReplay_io_refill_valid = io_refill_valid; // @[LoadQueue.scala 183:29]
  assign loadQueueReplay_io_refill_bits_id = io_refill_bits_id; // @[LoadQueue.scala 183:29]
  assign loadQueueReplay_io_stAddrReadySqPtr_flag = io_sq_stAddrReadySqPtr_flag; // @[LoadQueue.scala 184:39]
  assign loadQueueReplay_io_stAddrReadySqPtr_value = io_sq_stAddrReadySqPtr_value; // @[LoadQueue.scala 184:39]
  assign loadQueueReplay_io_stDataReadySqPtr_flag = io_sq_stDataReadySqPtr_flag; // @[LoadQueue.scala 185:39]
  assign loadQueueReplay_io_stDataReadySqPtr_value = io_sq_stDataReadySqPtr_value; // @[LoadQueue.scala 185:39]
  assign loadQueueReplay_io_sqEmpty = io_sq_sqEmpty; // @[LoadQueue.scala 186:30]
  assign loadQueueReplay_io_tlbReplayDelayCycleCtrl_0 = io_tlbReplayDelayCycleCtrl_0; // @[LoadQueue.scala 188:46]
  assign loadQueueReplay_io_tlbReplayDelayCycleCtrl_1 = io_tlbReplayDelayCycleCtrl_1; // @[LoadQueue.scala 188:46]
  assign loadQueueReplay_io_tlbReplayDelayCycleCtrl_2 = io_tlbReplayDelayCycleCtrl_2; // @[LoadQueue.scala 188:46]
  assign loadQueueReplay_io_tlbReplayDelayCycleCtrl_3 = io_tlbReplayDelayCycleCtrl_3; // @[LoadQueue.scala 188:46]
  assign loadQueueFlag_clock = clock;
  assign loadQueueFlag_reset = reset;
  assign loadQueueFlag_io_redirect_valid = io_redirect_valid; // @[LoadQueue.scala 162:29]
  assign loadQueueFlag_io_redirect_bits_robIdx_flag = io_redirect_bits_robIdx_flag; // @[LoadQueue.scala 162:29]
  assign loadQueueFlag_io_redirect_bits_robIdx_value = io_redirect_bits_robIdx_value; // @[LoadQueue.scala 162:29]
  assign loadQueueFlag_io_redirect_bits_level = io_redirect_bits_level; // @[LoadQueue.scala 162:29]
  assign loadQueueFlag_io_enq_sqCanAccept = io_enq_sqCanAccept; // @[LoadQueue.scala 163:24]
  assign loadQueueFlag_io_enq_req_0_valid = io_enq_req_0_valid; // @[LoadQueue.scala 163:24]
  assign loadQueueFlag_io_enq_req_0_bits_cf_trigger_backendEn_1 = io_enq_req_0_bits_cf_trigger_backendEn_1; // @[LoadQueue.scala 163:24]
  assign loadQueueFlag_io_enq_req_0_bits_ctrl_fuOpType = io_enq_req_0_bits_ctrl_fuOpType; // @[LoadQueue.scala 163:24]
  assign loadQueueFlag_io_enq_req_0_bits_ctrl_rfWen = io_enq_req_0_bits_ctrl_rfWen; // @[LoadQueue.scala 163:24]
  assign loadQueueFlag_io_enq_req_0_bits_ctrl_fpWen = io_enq_req_0_bits_ctrl_fpWen; // @[LoadQueue.scala 163:24]
  assign loadQueueFlag_io_enq_req_0_bits_ctrl_flushPipe = io_enq_req_0_bits_ctrl_flushPipe; // @[LoadQueue.scala 163:24]
  assign loadQueueFlag_io_enq_req_0_bits_ctrl_replayInst = io_enq_req_0_bits_ctrl_replayInst; // @[LoadQueue.scala 163:24]
  assign loadQueueFlag_io_enq_req_0_bits_pdest = io_enq_req_0_bits_pdest; // @[LoadQueue.scala 163:24]
  assign loadQueueFlag_io_enq_req_0_bits_robIdx_flag = io_enq_req_0_bits_robIdx_flag; // @[LoadQueue.scala 163:24]
  assign loadQueueFlag_io_enq_req_0_bits_robIdx_value = io_enq_req_0_bits_robIdx_value; // @[LoadQueue.scala 163:24]
  assign loadQueueFlag_io_enq_req_0_bits_lqIdx_value = io_enq_req_0_bits_lqIdx_value; // @[LoadQueue.scala 163:24]
  assign loadQueueFlag_io_enq_req_1_valid = io_enq_req_1_valid; // @[LoadQueue.scala 163:24]
  assign loadQueueFlag_io_enq_req_1_bits_cf_trigger_backendEn_1 = io_enq_req_1_bits_cf_trigger_backendEn_1; // @[LoadQueue.scala 163:24]
  assign loadQueueFlag_io_enq_req_1_bits_ctrl_fuOpType = io_enq_req_1_bits_ctrl_fuOpType; // @[LoadQueue.scala 163:24]
  assign loadQueueFlag_io_enq_req_1_bits_ctrl_rfWen = io_enq_req_1_bits_ctrl_rfWen; // @[LoadQueue.scala 163:24]
  assign loadQueueFlag_io_enq_req_1_bits_ctrl_fpWen = io_enq_req_1_bits_ctrl_fpWen; // @[LoadQueue.scala 163:24]
  assign loadQueueFlag_io_enq_req_1_bits_ctrl_flushPipe = io_enq_req_1_bits_ctrl_flushPipe; // @[LoadQueue.scala 163:24]
  assign loadQueueFlag_io_enq_req_1_bits_ctrl_replayInst = io_enq_req_1_bits_ctrl_replayInst; // @[LoadQueue.scala 163:24]
  assign loadQueueFlag_io_enq_req_1_bits_pdest = io_enq_req_1_bits_pdest; // @[LoadQueue.scala 163:24]
  assign loadQueueFlag_io_enq_req_1_bits_robIdx_flag = io_enq_req_1_bits_robIdx_flag; // @[LoadQueue.scala 163:24]
  assign loadQueueFlag_io_enq_req_1_bits_robIdx_value = io_enq_req_1_bits_robIdx_value; // @[LoadQueue.scala 163:24]
  assign loadQueueFlag_io_enq_req_1_bits_lqIdx_value = io_enq_req_1_bits_lqIdx_value; // @[LoadQueue.scala 163:24]
  assign loadQueueFlag_io_enq_req_2_valid = io_enq_req_2_valid; // @[LoadQueue.scala 163:24]
  assign loadQueueFlag_io_enq_req_2_bits_cf_trigger_backendEn_1 = io_enq_req_2_bits_cf_trigger_backendEn_1; // @[LoadQueue.scala 163:24]
  assign loadQueueFlag_io_enq_req_2_bits_ctrl_fuOpType = io_enq_req_2_bits_ctrl_fuOpType; // @[LoadQueue.scala 163:24]
  assign loadQueueFlag_io_enq_req_2_bits_ctrl_rfWen = io_enq_req_2_bits_ctrl_rfWen; // @[LoadQueue.scala 163:24]
  assign loadQueueFlag_io_enq_req_2_bits_ctrl_fpWen = io_enq_req_2_bits_ctrl_fpWen; // @[LoadQueue.scala 163:24]
  assign loadQueueFlag_io_enq_req_2_bits_ctrl_flushPipe = io_enq_req_2_bits_ctrl_flushPipe; // @[LoadQueue.scala 163:24]
  assign loadQueueFlag_io_enq_req_2_bits_ctrl_replayInst = io_enq_req_2_bits_ctrl_replayInst; // @[LoadQueue.scala 163:24]
  assign loadQueueFlag_io_enq_req_2_bits_pdest = io_enq_req_2_bits_pdest; // @[LoadQueue.scala 163:24]
  assign loadQueueFlag_io_enq_req_2_bits_robIdx_flag = io_enq_req_2_bits_robIdx_flag; // @[LoadQueue.scala 163:24]
  assign loadQueueFlag_io_enq_req_2_bits_robIdx_value = io_enq_req_2_bits_robIdx_value; // @[LoadQueue.scala 163:24]
  assign loadQueueFlag_io_enq_req_2_bits_lqIdx_value = io_enq_req_2_bits_lqIdx_value; // @[LoadQueue.scala 163:24]
  assign loadQueueFlag_io_enq_req_3_valid = io_enq_req_3_valid; // @[LoadQueue.scala 163:24]
  assign loadQueueFlag_io_enq_req_3_bits_cf_trigger_backendEn_1 = io_enq_req_3_bits_cf_trigger_backendEn_1; // @[LoadQueue.scala 163:24]
  assign loadQueueFlag_io_enq_req_3_bits_ctrl_fuOpType = io_enq_req_3_bits_ctrl_fuOpType; // @[LoadQueue.scala 163:24]
  assign loadQueueFlag_io_enq_req_3_bits_ctrl_rfWen = io_enq_req_3_bits_ctrl_rfWen; // @[LoadQueue.scala 163:24]
  assign loadQueueFlag_io_enq_req_3_bits_ctrl_fpWen = io_enq_req_3_bits_ctrl_fpWen; // @[LoadQueue.scala 163:24]
  assign loadQueueFlag_io_enq_req_3_bits_ctrl_flushPipe = io_enq_req_3_bits_ctrl_flushPipe; // @[LoadQueue.scala 163:24]
  assign loadQueueFlag_io_enq_req_3_bits_ctrl_replayInst = io_enq_req_3_bits_ctrl_replayInst; // @[LoadQueue.scala 163:24]
  assign loadQueueFlag_io_enq_req_3_bits_pdest = io_enq_req_3_bits_pdest; // @[LoadQueue.scala 163:24]
  assign loadQueueFlag_io_enq_req_3_bits_robIdx_flag = io_enq_req_3_bits_robIdx_flag; // @[LoadQueue.scala 163:24]
  assign loadQueueFlag_io_enq_req_3_bits_robIdx_value = io_enq_req_3_bits_robIdx_value; // @[LoadQueue.scala 163:24]
  assign loadQueueFlag_io_enq_req_3_bits_lqIdx_value = io_enq_req_3_bits_lqIdx_value; // @[LoadQueue.scala 163:24]
  assign loadQueueFlag_io_loadIn_0_valid = io_ldu_s3_loadIn_0_valid; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_0_bits_uop_cf_exceptionVec_4 = io_ldu_s3_loadIn_0_bits_uop_cf_exceptionVec_4; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_0_bits_uop_cf_exceptionVec_5 = io_ldu_s3_loadIn_0_bits_uop_cf_exceptionVec_5; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_0_bits_uop_cf_exceptionVec_13 = io_ldu_s3_loadIn_0_bits_uop_cf_exceptionVec_13; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_0_bits_uop_cf_trigger_backendEn_1 = io_ldu_s3_loadIn_0_bits_uop_cf_trigger_backendEn_1; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_0_bits_uop_cf_trigger_backendHit_0 =
    io_ldu_s3_loadIn_0_bits_uop_cf_trigger_backendHit_0; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_0_bits_uop_cf_trigger_backendHit_1 =
    io_ldu_s3_loadIn_0_bits_uop_cf_trigger_backendHit_1; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_0_bits_uop_cf_trigger_backendHit_4 =
    io_ldu_s3_loadIn_0_bits_uop_cf_trigger_backendHit_4; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_0_bits_uop_ctrl_fuOpType = io_ldu_s3_loadIn_0_bits_uop_ctrl_fuOpType; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_0_bits_uop_ctrl_rfWen = io_ldu_s3_loadIn_0_bits_uop_ctrl_rfWen; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_0_bits_uop_ctrl_fpWen = io_ldu_s3_loadIn_0_bits_uop_ctrl_fpWen; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_0_bits_uop_ctrl_replayInst = io_ldu_s3_loadIn_0_bits_uop_ctrl_replayInst; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_0_bits_uop_pdest = io_ldu_s3_loadIn_0_bits_uop_pdest; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_0_bits_uop_robIdx_value = io_ldu_s3_loadIn_0_bits_uop_robIdx_value; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_0_bits_uop_lqIdx_value = io_ldu_s3_loadIn_0_bits_uop_lqIdx_value; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_0_bits_vaddr = io_ldu_s3_loadIn_0_bits_vaddr; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_0_bits_paddr = io_ldu_s3_loadIn_0_bits_paddr; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_0_bits_mask = io_ldu_s3_loadIn_0_bits_mask; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_0_bits_miss = io_ldu_s3_loadIn_0_bits_miss; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_0_bits_tlbMiss = io_ldu_s3_loadIn_0_bits_tlbMiss; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_0_bits_mmio = io_ldu_s3_loadIn_0_bits_mmio; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_0_bits_replayInfo_cause_0 = io_ldu_s3_loadIn_0_bits_replayInfo_cause_0; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_0_bits_replayInfo_cause_1 = io_ldu_s3_loadIn_0_bits_replayInfo_cause_1; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_0_bits_replayInfo_cause_2 = io_ldu_s3_loadIn_0_bits_replayInfo_cause_2; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_0_bits_replayInfo_cause_3 = io_ldu_s3_loadIn_0_bits_replayInfo_cause_3; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_0_bits_replayInfo_cause_4 = io_ldu_s3_loadIn_0_bits_replayInfo_cause_4; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_0_bits_replayInfo_cause_5 = io_ldu_s3_loadIn_0_bits_replayInfo_cause_5; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_0_bits_replayInfo_cause_6 = io_ldu_s3_loadIn_0_bits_replayInfo_cause_6; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_0_bits_replayInfo_cause_7 = io_ldu_s3_loadIn_0_bits_replayInfo_cause_7; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_0_bits_lqDataWenDup_1 = io_ldu_s3_loadIn_0_bits_lqDataWenDup_1; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_0_bits_lqDataWenDup_2 = io_ldu_s3_loadIn_0_bits_lqDataWenDup_2; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_0_bits_lqDataWenDup_3 = io_ldu_s3_loadIn_0_bits_lqDataWenDup_3; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_0_bits_lqDataWenDup_5 = io_ldu_s3_loadIn_0_bits_lqDataWenDup_5; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_1_valid = io_ldu_s3_loadIn_1_valid; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_1_bits_uop_cf_exceptionVec_4 = io_ldu_s3_loadIn_1_bits_uop_cf_exceptionVec_4; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_1_bits_uop_cf_exceptionVec_5 = io_ldu_s3_loadIn_1_bits_uop_cf_exceptionVec_5; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_1_bits_uop_cf_exceptionVec_13 = io_ldu_s3_loadIn_1_bits_uop_cf_exceptionVec_13; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_1_bits_uop_cf_trigger_backendEn_1 = io_ldu_s3_loadIn_1_bits_uop_cf_trigger_backendEn_1; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_1_bits_uop_cf_trigger_backendHit_0 =
    io_ldu_s3_loadIn_1_bits_uop_cf_trigger_backendHit_0; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_1_bits_uop_cf_trigger_backendHit_1 =
    io_ldu_s3_loadIn_1_bits_uop_cf_trigger_backendHit_1; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_1_bits_uop_cf_trigger_backendHit_4 =
    io_ldu_s3_loadIn_1_bits_uop_cf_trigger_backendHit_4; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_1_bits_uop_ctrl_fuOpType = io_ldu_s3_loadIn_1_bits_uop_ctrl_fuOpType; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_1_bits_uop_ctrl_rfWen = io_ldu_s3_loadIn_1_bits_uop_ctrl_rfWen; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_1_bits_uop_ctrl_fpWen = io_ldu_s3_loadIn_1_bits_uop_ctrl_fpWen; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_1_bits_uop_ctrl_replayInst = io_ldu_s3_loadIn_1_bits_uop_ctrl_replayInst; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_1_bits_uop_pdest = io_ldu_s3_loadIn_1_bits_uop_pdest; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_1_bits_uop_robIdx_value = io_ldu_s3_loadIn_1_bits_uop_robIdx_value; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_1_bits_uop_lqIdx_value = io_ldu_s3_loadIn_1_bits_uop_lqIdx_value; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_1_bits_vaddr = io_ldu_s3_loadIn_1_bits_vaddr; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_1_bits_paddr = io_ldu_s3_loadIn_1_bits_paddr; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_1_bits_mask = io_ldu_s3_loadIn_1_bits_mask; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_1_bits_miss = io_ldu_s3_loadIn_1_bits_miss; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_1_bits_tlbMiss = io_ldu_s3_loadIn_1_bits_tlbMiss; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_1_bits_mmio = io_ldu_s3_loadIn_1_bits_mmio; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_1_bits_replayInfo_cause_0 = io_ldu_s3_loadIn_1_bits_replayInfo_cause_0; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_1_bits_replayInfo_cause_1 = io_ldu_s3_loadIn_1_bits_replayInfo_cause_1; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_1_bits_replayInfo_cause_2 = io_ldu_s3_loadIn_1_bits_replayInfo_cause_2; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_1_bits_replayInfo_cause_3 = io_ldu_s3_loadIn_1_bits_replayInfo_cause_3; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_1_bits_replayInfo_cause_4 = io_ldu_s3_loadIn_1_bits_replayInfo_cause_4; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_1_bits_replayInfo_cause_5 = io_ldu_s3_loadIn_1_bits_replayInfo_cause_5; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_1_bits_replayInfo_cause_6 = io_ldu_s3_loadIn_1_bits_replayInfo_cause_6; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_1_bits_replayInfo_cause_7 = io_ldu_s3_loadIn_1_bits_replayInfo_cause_7; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_1_bits_lqDataWenDup_1 = io_ldu_s3_loadIn_1_bits_lqDataWenDup_1; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_1_bits_lqDataWenDup_2 = io_ldu_s3_loadIn_1_bits_lqDataWenDup_2; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_1_bits_lqDataWenDup_3 = io_ldu_s3_loadIn_1_bits_lqDataWenDup_3; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadIn_1_bits_lqDataWenDup_5 = io_ldu_s3_loadIn_1_bits_lqDataWenDup_5; // @[LoadQueue.scala 164:27]
  assign loadQueueFlag_io_loadOut_0_ready = io_loadOut_0_ready; // @[LoadQueue.scala 165:28]
  assign loadQueueFlag_io_rob_pendingld = io_rob_pendingld; // @[LoadQueue.scala 167:24]
  assign loadQueueFlag_io_rob_commit = io_rob_commit; // @[LoadQueue.scala 167:24]
  assign loadQueueFlag_io_uncache_req_ready = io_uncache_req_ready; // @[LoadQueue.scala 168:28]
  assign loadQueueFlag_io_uncache_resp_valid = io_uncache_resp_valid; // @[LoadQueue.scala 168:28]
  assign loadQueueFlag_io_uncache_resp_bits_data = io_uncache_resp_bits_data; // @[LoadQueue.scala 168:28]
  assign loadQueueFlag_io_trigger_0_hitLoadAddrTriggerHitVec_0 = io_trigger_0_hitLoadAddrTriggerHitVec_0; // @[LoadQueue.scala 169:28]
  assign loadQueueFlag_io_trigger_0_hitLoadAddrTriggerHitVec_1 = io_trigger_0_hitLoadAddrTriggerHitVec_1; // @[LoadQueue.scala 169:28]
  assign loadQueueFlag_io_trigger_0_hitLoadAddrTriggerHitVec_2 = io_trigger_0_hitLoadAddrTriggerHitVec_2; // @[LoadQueue.scala 169:28]
  assign loadQueueFlag_io_trigger_1_hitLoadAddrTriggerHitVec_0 = io_trigger_1_hitLoadAddrTriggerHitVec_0; // @[LoadQueue.scala 169:28]
  assign loadQueueFlag_io_trigger_1_hitLoadAddrTriggerHitVec_1 = io_trigger_1_hitLoadAddrTriggerHitVec_1; // @[LoadQueue.scala 169:28]
  assign loadQueueFlag_io_trigger_1_hitLoadAddrTriggerHitVec_2 = io_trigger_1_hitLoadAddrTriggerHitVec_2; // @[LoadQueue.scala 169:28]
  always @(posedge clock) begin
    io_perf_0_value_REG <= loadQueueFlag_io_perf_0_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_0_value_REG_1 <= io_perf_0_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_1_value_REG <= loadQueueFlag_io_perf_1_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_1_value_REG_1 <= io_perf_1_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_2_value_REG <= loadQueueFlag_io_perf_2_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_2_value_REG_1 <= io_perf_2_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_3_value_REG <= loadQueueFlag_io_perf_3_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_3_value_REG_1 <= io_perf_3_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_4_value_REG <= loadQueueRAR_io_perf_0_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_4_value_REG_1 <= io_perf_4_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_5_value_REG <= loadQueueRAR_io_perf_1_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_5_value_REG_1 <= io_perf_5_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_6_value_REG <= loadQueueRAR_io_perf_2_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_6_value_REG_1 <= io_perf_6_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_7_value_REG <= loadQueueRAW_io_perf_0_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_7_value_REG_1 <= io_perf_7_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_8_value_REG <= loadQueueRAW_io_perf_1_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_8_value_REG_1 <= io_perf_8_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_9_value_REG <= loadQueueRAW_io_perf_2_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_9_value_REG_1 <= io_perf_9_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_10_value_REG <= loadQueueReplay_io_perf_0_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_10_value_REG_1 <= io_perf_10_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_11_value_REG <= loadQueueReplay_io_perf_1_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_11_value_REG_1 <= io_perf_11_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_12_value_REG <= loadQueueReplay_io_perf_2_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_12_value_REG_1 <= io_perf_12_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_13_value_REG <= loadQueueReplay_io_perf_3_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_13_value_REG_1 <= io_perf_13_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_14_value_REG <= loadQueueReplay_io_perf_4_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_14_value_REG_1 <= io_perf_14_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_15_value_REG <= loadQueueReplay_io_perf_5_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_15_value_REG_1 <= io_perf_15_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_16_value_REG <= loadQueueReplay_io_perf_6_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_16_value_REG_1 <= io_perf_16_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_17_value_REG <= loadQueueReplay_io_perf_7_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_17_value_REG_1 <= io_perf_17_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_18_value_REG <= loadQueueReplay_io_perf_8_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_18_value_REG_1 <= io_perf_18_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_19_value_REG <= loadQueueReplay_io_perf_9_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_19_value_REG_1 <= io_perf_19_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_20_value_REG <= loadQueueReplay_io_perf_10_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_20_value_REG_1 <= io_perf_20_value_REG; // @[PerfCounterUtils.scala 188:27]
    io_perf_21_value_REG <= loadQueueReplay_io_perf_11_value; // @[PerfCounterUtils.scala 188:35]
    io_perf_21_value_REG_1 <= io_perf_21_value_REG; // @[PerfCounterUtils.scala 188:27]
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
  io_perf_0_value_REG = _RAND_0[5:0];
  _RAND_1 = {1{`RANDOM}};
  io_perf_0_value_REG_1 = _RAND_1[5:0];
  _RAND_2 = {1{`RANDOM}};
  io_perf_1_value_REG = _RAND_2[5:0];
  _RAND_3 = {1{`RANDOM}};
  io_perf_1_value_REG_1 = _RAND_3[5:0];
  _RAND_4 = {1{`RANDOM}};
  io_perf_2_value_REG = _RAND_4[5:0];
  _RAND_5 = {1{`RANDOM}};
  io_perf_2_value_REG_1 = _RAND_5[5:0];
  _RAND_6 = {1{`RANDOM}};
  io_perf_3_value_REG = _RAND_6[5:0];
  _RAND_7 = {1{`RANDOM}};
  io_perf_3_value_REG_1 = _RAND_7[5:0];
  _RAND_8 = {1{`RANDOM}};
  io_perf_4_value_REG = _RAND_8[5:0];
  _RAND_9 = {1{`RANDOM}};
  io_perf_4_value_REG_1 = _RAND_9[5:0];
  _RAND_10 = {1{`RANDOM}};
  io_perf_5_value_REG = _RAND_10[5:0];
  _RAND_11 = {1{`RANDOM}};
  io_perf_5_value_REG_1 = _RAND_11[5:0];
  _RAND_12 = {1{`RANDOM}};
  io_perf_6_value_REG = _RAND_12[5:0];
  _RAND_13 = {1{`RANDOM}};
  io_perf_6_value_REG_1 = _RAND_13[5:0];
  _RAND_14 = {1{`RANDOM}};
  io_perf_7_value_REG = _RAND_14[5:0];
  _RAND_15 = {1{`RANDOM}};
  io_perf_7_value_REG_1 = _RAND_15[5:0];
  _RAND_16 = {1{`RANDOM}};
  io_perf_8_value_REG = _RAND_16[5:0];
  _RAND_17 = {1{`RANDOM}};
  io_perf_8_value_REG_1 = _RAND_17[5:0];
  _RAND_18 = {1{`RANDOM}};
  io_perf_9_value_REG = _RAND_18[5:0];
  _RAND_19 = {1{`RANDOM}};
  io_perf_9_value_REG_1 = _RAND_19[5:0];
  _RAND_20 = {1{`RANDOM}};
  io_perf_10_value_REG = _RAND_20[5:0];
  _RAND_21 = {1{`RANDOM}};
  io_perf_10_value_REG_1 = _RAND_21[5:0];
  _RAND_22 = {1{`RANDOM}};
  io_perf_11_value_REG = _RAND_22[5:0];
  _RAND_23 = {1{`RANDOM}};
  io_perf_11_value_REG_1 = _RAND_23[5:0];
  _RAND_24 = {1{`RANDOM}};
  io_perf_12_value_REG = _RAND_24[5:0];
  _RAND_25 = {1{`RANDOM}};
  io_perf_12_value_REG_1 = _RAND_25[5:0];
  _RAND_26 = {1{`RANDOM}};
  io_perf_13_value_REG = _RAND_26[5:0];
  _RAND_27 = {1{`RANDOM}};
  io_perf_13_value_REG_1 = _RAND_27[5:0];
  _RAND_28 = {1{`RANDOM}};
  io_perf_14_value_REG = _RAND_28[5:0];
  _RAND_29 = {1{`RANDOM}};
  io_perf_14_value_REG_1 = _RAND_29[5:0];
  _RAND_30 = {1{`RANDOM}};
  io_perf_15_value_REG = _RAND_30[5:0];
  _RAND_31 = {1{`RANDOM}};
  io_perf_15_value_REG_1 = _RAND_31[5:0];
  _RAND_32 = {1{`RANDOM}};
  io_perf_16_value_REG = _RAND_32[5:0];
  _RAND_33 = {1{`RANDOM}};
  io_perf_16_value_REG_1 = _RAND_33[5:0];
  _RAND_34 = {1{`RANDOM}};
  io_perf_17_value_REG = _RAND_34[5:0];
  _RAND_35 = {1{`RANDOM}};
  io_perf_17_value_REG_1 = _RAND_35[5:0];
  _RAND_36 = {1{`RANDOM}};
  io_perf_18_value_REG = _RAND_36[5:0];
  _RAND_37 = {1{`RANDOM}};
  io_perf_18_value_REG_1 = _RAND_37[5:0];
  _RAND_38 = {1{`RANDOM}};
  io_perf_19_value_REG = _RAND_38[5:0];
  _RAND_39 = {1{`RANDOM}};
  io_perf_19_value_REG_1 = _RAND_39[5:0];
  _RAND_40 = {1{`RANDOM}};
  io_perf_20_value_REG = _RAND_40[5:0];
  _RAND_41 = {1{`RANDOM}};
  io_perf_20_value_REG_1 = _RAND_41[5:0];
  _RAND_42 = {1{`RANDOM}};
  io_perf_21_value_REG = _RAND_42[5:0];
  _RAND_43 = {1{`RANDOM}};
  io_perf_21_value_REG_1 = _RAND_43[5:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

