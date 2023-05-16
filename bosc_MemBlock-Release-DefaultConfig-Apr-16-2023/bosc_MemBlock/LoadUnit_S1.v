module LoadUnit_S1(
  input         io_in_valid,
  input  [9:0]  io_in_bits_uop_cf_foldpc,
  input         io_in_bits_uop_cf_exceptionVec_4,
  input         io_in_bits_uop_cf_trigger_backendEn_1,
  input         io_in_bits_uop_cf_trigger_backendHit_0,
  input         io_in_bits_uop_cf_trigger_backendHit_1,
  input         io_in_bits_uop_cf_trigger_backendHit_4,
  input         io_in_bits_uop_cf_waitForRobIdx_flag,
  input  [4:0]  io_in_bits_uop_cf_waitForRobIdx_value,
  input         io_in_bits_uop_cf_loadWaitBit,
  input         io_in_bits_uop_cf_loadWaitStrict,
  input         io_in_bits_uop_cf_ftqPtr_flag,
  input  [2:0]  io_in_bits_uop_cf_ftqPtr_value,
  input  [2:0]  io_in_bits_uop_cf_ftqOffset,
  input  [3:0]  io_in_bits_uop_ctrl_fuType,
  input  [6:0]  io_in_bits_uop_ctrl_fuOpType,
  input         io_in_bits_uop_ctrl_rfWen,
  input         io_in_bits_uop_ctrl_fpWen,
  input  [5:0]  io_in_bits_uop_pdest,
  input         io_in_bits_uop_robIdx_flag,
  input  [4:0]  io_in_bits_uop_robIdx_value,
  input         io_in_bits_uop_lqIdx_flag,
  input  [3:0]  io_in_bits_uop_lqIdx_value,
  input         io_in_bits_uop_sqIdx_flag,
  input  [3:0]  io_in_bits_uop_sqIdx_value,
  input  [38:0] io_in_bits_vaddr,
  input  [15:0] io_in_bits_mask,
  input         io_in_bits_isPrefetch,
  input         io_in_bits_isHWPrefetch,
  input         io_in_bits_vec128bit,
  input         io_in_bits_isFirstIssue,
  input  [1:0]  io_in_bits_mshrid,
  input         io_in_bits_forward_tlDchannel,
  input         io_in_bits_rarAllocated,
  input  [3:0]  io_in_bits_rarIndex,
  input         io_in_bits_rawAllocated,
  input  [2:0]  io_in_bits_rawIndex,
  input         io_s1_kill,
  output        io_out_valid,
  output [9:0]  io_out_bits_uop_cf_foldpc,
  output        io_out_bits_uop_cf_exceptionVec_4,
  output        io_out_bits_uop_cf_exceptionVec_5,
  output        io_out_bits_uop_cf_exceptionVec_13,
  output        io_out_bits_uop_cf_trigger_backendEn_1,
  output        io_out_bits_uop_cf_trigger_backendHit_0,
  output        io_out_bits_uop_cf_trigger_backendHit_1,
  output        io_out_bits_uop_cf_trigger_backendHit_4,
  output        io_out_bits_uop_cf_waitForRobIdx_flag,
  output [4:0]  io_out_bits_uop_cf_waitForRobIdx_value,
  output        io_out_bits_uop_cf_loadWaitBit,
  output        io_out_bits_uop_cf_loadWaitStrict,
  output        io_out_bits_uop_cf_ftqPtr_flag,
  output [2:0]  io_out_bits_uop_cf_ftqPtr_value,
  output [2:0]  io_out_bits_uop_cf_ftqOffset,
  output [3:0]  io_out_bits_uop_ctrl_fuType,
  output [6:0]  io_out_bits_uop_ctrl_fuOpType,
  output        io_out_bits_uop_ctrl_rfWen,
  output        io_out_bits_uop_ctrl_fpWen,
  output [5:0]  io_out_bits_uop_pdest,
  output        io_out_bits_uop_robIdx_flag,
  output [4:0]  io_out_bits_uop_robIdx_value,
  output        io_out_bits_uop_lqIdx_flag,
  output [3:0]  io_out_bits_uop_lqIdx_value,
  output        io_out_bits_uop_sqIdx_flag,
  output [3:0]  io_out_bits_uop_sqIdx_value,
  output [38:0] io_out_bits_vaddr,
  output [35:0] io_out_bits_paddr,
  output [15:0] io_out_bits_mask,
  output        io_out_bits_tlbMiss,
  output        io_out_bits_isPrefetch,
  output        io_out_bits_isHWPrefetch,
  output        io_out_bits_vec128bit,
  output        io_out_bits_isFirstIssue,
  output [1:0]  io_out_bits_mshrid,
  output        io_out_bits_forward_tlDchannel,
  output        io_out_bits_rarAllocated,
  output [3:0]  io_out_bits_rarIndex,
  output        io_out_bits_rawAllocated,
  output [2:0]  io_out_bits_rawIndex,
  output        io_out_bits_replayInfo_cause_2,
  output        io_out_bits_replayInfo_cause_4,
  input  [35:0] io_dtlbResp_bits_paddr_0,
  input  [35:0] io_dtlbResp_bits_paddr_1,
  input         io_dtlbResp_bits_miss,
  input         io_dtlbResp_bits_excp_0_pf_ld,
  input         io_dtlbResp_bits_excp_0_af_ld,
  output [35:0] io_lsuPAddr,
  output [35:0] io_dcachePAddr,
  output        io_dcacheKill,
  input         io_dcacheBankConflict,
  output [38:0] io_sbuffer_vaddr,
  output [35:0] io_sbuffer_paddr,
  output        io_sbuffer_valid,
  output [38:0] io_lsq_vaddr,
  output [35:0] io_lsq_paddr,
  output        io_lsq_uop_cf_waitForRobIdx_flag,
  output [4:0]  io_lsq_uop_cf_waitForRobIdx_value,
  output        io_lsq_uop_sqIdx_flag,
  output [3:0]  io_lsq_uop_sqIdx_value,
  output        io_lsq_valid,
  output        io_lsq_sqIdx_flag,
  input         io_reExecuteQuery_0_valid,
  input         io_reExecuteQuery_0_bits_robIdx_flag,
  input  [4:0]  io_reExecuteQuery_0_bits_robIdx_value,
  input  [35:0] io_reExecuteQuery_0_bits_paddr,
  input  [15:0] io_reExecuteQuery_0_bits_mask,
  input         io_reExecuteQuery_1_valid,
  input         io_reExecuteQuery_1_bits_robIdx_flag,
  input  [4:0]  io_reExecuteQuery_1_bits_robIdx_value,
  input  [35:0] io_reExecuteQuery_1_bits_paddr,
  input  [15:0] io_reExecuteQuery_1_bits_mask,
  output [9:0]  io_correctTableQueryReq_addr
);
  wire [15:0] _s1_exception_T = {2'h0,io_out_bits_uop_cf_exceptionVec_13,1'h0,4'h0,2'h0,
    io_out_bits_uop_cf_exceptionVec_5,io_out_bits_uop_cf_exceptionVec_4,4'h0}; // @[LoadUnit.scala 447:86]
  wire  s1_exception = |_s1_exception_T; // @[LoadUnit.scala 447:93]
  wire  s1_is_sw_prefetch = io_in_bits_isPrefetch & ~io_in_bits_isHWPrefetch; // @[LoadUnit.scala 452:42]
  wire  _T_1 = ~io_dtlbResp_bits_miss; // @[LoadUnit.scala 458:52]
  wire  _io_sbuffer_valid_T_3 = ~(s1_exception | io_dtlbResp_bits_miss | io_s1_kill | io_in_bits_isPrefetch); // @[LoadUnit.scala 470:38]
  wire  s1_schedError_differentFlag = io_in_bits_uop_robIdx_flag ^ io_reExecuteQuery_0_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  s1_schedError_compare = io_in_bits_uop_robIdx_value > io_reExecuteQuery_0_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _s1_schedError_T = s1_schedError_differentFlag ^ s1_schedError_compare; // @[CircularQueuePtr.scala 88:19]
  wire  _s1_schedError_T_1 = io_reExecuteQuery_0_valid & _s1_schedError_T; // @[LoadUnit.scala 488:97]
  wire  _s1_schedError_T_4 = io_dtlbResp_bits_paddr_0[35:3] == io_reExecuteQuery_0_bits_paddr[35:3]; // @[LoadUnit.scala 490:61]
  wire  _s1_schedError_T_5 = _s1_schedError_T_1 & _s1_schedError_T_4; // @[LoadUnit.scala 489:92]
  wire [15:0] _s1_schedError_T_6 = io_in_bits_mask & io_reExecuteQuery_0_bits_mask; // @[LoadUnit.scala 491:36]
  wire  _s1_schedError_T_7 = |_s1_schedError_T_6; // @[LoadUnit.scala 491:70]
  wire  _s1_schedError_T_8 = _s1_schedError_T_5 & _s1_schedError_T_7; // @[LoadUnit.scala 490:114]
  wire  s1_schedError_differentFlag_1 = io_in_bits_uop_robIdx_flag ^ io_reExecuteQuery_1_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  s1_schedError_compare_1 = io_in_bits_uop_robIdx_value > io_reExecuteQuery_1_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _s1_schedError_T_9 = s1_schedError_differentFlag_1 ^ s1_schedError_compare_1; // @[CircularQueuePtr.scala 88:19]
  wire  _s1_schedError_T_10 = io_reExecuteQuery_1_valid & _s1_schedError_T_9; // @[LoadUnit.scala 488:97]
  wire  _s1_schedError_T_13 = io_dtlbResp_bits_paddr_0[35:3] == io_reExecuteQuery_1_bits_paddr[35:3]; // @[LoadUnit.scala 490:61]
  wire  _s1_schedError_T_14 = _s1_schedError_T_10 & _s1_schedError_T_13; // @[LoadUnit.scala 489:92]
  wire [15:0] _s1_schedError_T_15 = io_in_bits_mask & io_reExecuteQuery_1_bits_mask; // @[LoadUnit.scala 491:36]
  wire  _s1_schedError_T_16 = |_s1_schedError_T_15; // @[LoadUnit.scala 491:70]
  wire  _s1_schedError_T_17 = _s1_schedError_T_14 & _s1_schedError_T_16; // @[LoadUnit.scala 490:114]
  wire [1:0] _s1_schedError_T_18 = {_s1_schedError_T_17,_s1_schedError_T_8}; // @[LoadUnit.scala 491:76]
  wire  s1_schedError = |_s1_schedError_T_18 & _T_1; // @[LoadUnit.scala 491:87]
  wire  _io_out_bits_replayInfo_cause_2_T = ~s1_is_sw_prefetch; // @[LoadUnit.scala 508:81]
  assign io_out_valid = io_in_valid & ~io_s1_kill; // @[LoadUnit.scala 501:31]
  assign io_out_bits_uop_cf_foldpc = io_in_bits_uop_cf_foldpc; // @[LoadUnit.scala 455:15]
  assign io_out_bits_uop_cf_exceptionVec_4 = io_in_bits_uop_cf_exceptionVec_4; // @[LoadUnit.scala 455:15]
  assign io_out_bits_uop_cf_exceptionVec_5 = io_dtlbResp_bits_excp_0_af_ld; // @[LoadUnit.scala 515:52]
  assign io_out_bits_uop_cf_exceptionVec_13 = io_dtlbResp_bits_excp_0_pf_ld; // @[LoadUnit.scala 514:50]
  assign io_out_bits_uop_cf_trigger_backendEn_1 = io_in_bits_uop_cf_trigger_backendEn_1; // @[LoadUnit.scala 455:15]
  assign io_out_bits_uop_cf_trigger_backendHit_0 = io_in_bits_uop_cf_trigger_backendHit_0; // @[LoadUnit.scala 455:15]
  assign io_out_bits_uop_cf_trigger_backendHit_1 = io_in_bits_uop_cf_trigger_backendHit_1; // @[LoadUnit.scala 455:15]
  assign io_out_bits_uop_cf_trigger_backendHit_4 = io_in_bits_uop_cf_trigger_backendHit_4; // @[LoadUnit.scala 455:15]
  assign io_out_bits_uop_cf_waitForRobIdx_flag = io_in_bits_uop_cf_waitForRobIdx_flag; // @[LoadUnit.scala 455:15]
  assign io_out_bits_uop_cf_waitForRobIdx_value = io_in_bits_uop_cf_waitForRobIdx_value; // @[LoadUnit.scala 455:15]
  assign io_out_bits_uop_cf_loadWaitBit = io_in_bits_uop_cf_loadWaitBit; // @[LoadUnit.scala 455:15]
  assign io_out_bits_uop_cf_loadWaitStrict = io_in_bits_uop_cf_loadWaitStrict; // @[LoadUnit.scala 455:15]
  assign io_out_bits_uop_cf_ftqPtr_flag = io_in_bits_uop_cf_ftqPtr_flag; // @[LoadUnit.scala 455:15]
  assign io_out_bits_uop_cf_ftqPtr_value = io_in_bits_uop_cf_ftqPtr_value; // @[LoadUnit.scala 455:15]
  assign io_out_bits_uop_cf_ftqOffset = io_in_bits_uop_cf_ftqOffset; // @[LoadUnit.scala 455:15]
  assign io_out_bits_uop_ctrl_fuType = io_in_bits_uop_ctrl_fuType; // @[LoadUnit.scala 455:15]
  assign io_out_bits_uop_ctrl_fuOpType = io_in_bits_uop_ctrl_fuOpType; // @[LoadUnit.scala 455:15]
  assign io_out_bits_uop_ctrl_rfWen = io_in_bits_uop_ctrl_rfWen; // @[LoadUnit.scala 455:15]
  assign io_out_bits_uop_ctrl_fpWen = io_in_bits_uop_ctrl_fpWen; // @[LoadUnit.scala 455:15]
  assign io_out_bits_uop_pdest = io_in_bits_uop_pdest; // @[LoadUnit.scala 455:15]
  assign io_out_bits_uop_robIdx_flag = io_in_bits_uop_robIdx_flag; // @[LoadUnit.scala 455:15]
  assign io_out_bits_uop_robIdx_value = io_in_bits_uop_robIdx_value; // @[LoadUnit.scala 455:15]
  assign io_out_bits_uop_lqIdx_flag = io_in_bits_uop_lqIdx_flag; // @[LoadUnit.scala 455:15]
  assign io_out_bits_uop_lqIdx_value = io_in_bits_uop_lqIdx_value; // @[LoadUnit.scala 455:15]
  assign io_out_bits_uop_sqIdx_flag = io_in_bits_uop_sqIdx_flag; // @[LoadUnit.scala 455:15]
  assign io_out_bits_uop_sqIdx_value = io_in_bits_uop_sqIdx_value; // @[LoadUnit.scala 455:15]
  assign io_out_bits_vaddr = io_in_bits_vaddr; // @[LoadUnit.scala 455:15]
  assign io_out_bits_paddr = io_dtlbResp_bits_paddr_0; // @[LoadUnit.scala 502:21]
  assign io_out_bits_mask = io_in_bits_mask; // @[LoadUnit.scala 455:15]
  assign io_out_bits_tlbMiss = io_dtlbResp_bits_miss; // @[LoadUnit.scala 503:23]
  assign io_out_bits_isPrefetch = io_in_bits_isPrefetch; // @[LoadUnit.scala 455:15]
  assign io_out_bits_isHWPrefetch = io_in_bits_isHWPrefetch; // @[LoadUnit.scala 455:15]
  assign io_out_bits_vec128bit = io_in_bits_vec128bit; // @[LoadUnit.scala 455:15]
  assign io_out_bits_isFirstIssue = io_in_bits_isFirstIssue; // @[LoadUnit.scala 455:15]
  assign io_out_bits_mshrid = io_in_bits_mshrid; // @[LoadUnit.scala 455:15]
  assign io_out_bits_forward_tlDchannel = io_in_bits_forward_tlDchannel; // @[LoadUnit.scala 455:15]
  assign io_out_bits_rarAllocated = io_in_bits_rarAllocated; // @[LoadUnit.scala 455:15]
  assign io_out_bits_rarIndex = io_in_bits_rarIndex; // @[LoadUnit.scala 455:15]
  assign io_out_bits_rawAllocated = io_in_bits_rawAllocated; // @[LoadUnit.scala 455:15]
  assign io_out_bits_rawIndex = io_in_bits_rawIndex; // @[LoadUnit.scala 455:15]
  assign io_out_bits_replayInfo_cause_2 = s1_schedError & ~s1_is_sw_prefetch; // @[LoadUnit.scala 508:78]
  assign io_out_bits_replayInfo_cause_4 = io_dcacheBankConflict & _io_out_bits_replayInfo_cause_2_T; // @[LoadUnit.scala 509:83]
  assign io_lsuPAddr = io_dtlbResp_bits_paddr_0; // @[LoadUnit.scala 465:15]
  assign io_dcachePAddr = io_dtlbResp_bits_paddr_1; // @[LoadUnit.scala 466:18]
  assign io_dcacheKill = io_dtlbResp_bits_miss | s1_exception | io_s1_kill; // @[LoadUnit.scala 468:48]
  assign io_sbuffer_vaddr = io_in_bits_vaddr; // @[LoadUnit.scala 471:20]
  assign io_sbuffer_paddr = io_dtlbResp_bits_paddr_0; // @[LoadUnit.scala 472:20]
  assign io_sbuffer_valid = io_in_valid & ~(s1_exception | io_dtlbResp_bits_miss | io_s1_kill | io_in_bits_isPrefetch); // @[LoadUnit.scala 470:35]
  assign io_lsq_vaddr = io_in_bits_vaddr; // @[LoadUnit.scala 479:16]
  assign io_lsq_paddr = io_dtlbResp_bits_paddr_0; // @[LoadUnit.scala 480:16]
  assign io_lsq_uop_cf_waitForRobIdx_flag = io_in_bits_uop_cf_waitForRobIdx_flag; // @[LoadUnit.scala 481:14]
  assign io_lsq_uop_cf_waitForRobIdx_value = io_in_bits_uop_cf_waitForRobIdx_value; // @[LoadUnit.scala 481:14]
  assign io_lsq_uop_sqIdx_flag = io_in_bits_uop_sqIdx_flag; // @[LoadUnit.scala 481:14]
  assign io_lsq_uop_sqIdx_value = io_in_bits_uop_sqIdx_value; // @[LoadUnit.scala 481:14]
  assign io_lsq_valid = io_in_valid & _io_sbuffer_valid_T_3; // @[LoadUnit.scala 478:31]
  assign io_lsq_sqIdx_flag = io_in_bits_uop_sqIdx_flag; // @[LoadUnit.scala 482:16]
  assign io_correctTableQueryReq_addr = io_in_bits_uop_cf_foldpc; // @[LoadUnit.scala 493:32]
endmodule

