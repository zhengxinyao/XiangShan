module StoreUnit(
  input         clock,
  input         reset,
  input         io_stin_valid,
  input         io_stin_bits_uop_cf_trigger_backendEn_0,
  input         io_stin_bits_uop_cf_storeSetHit,
  input  [4:0]  io_stin_bits_uop_cf_ssid,
  input  [2:0]  io_stin_bits_uop_cf_ftqPtr_value,
  input  [2:0]  io_stin_bits_uop_cf_ftqOffset,
  input  [6:0]  io_stin_bits_uop_ctrl_fuOpType,
  input  [19:0] io_stin_bits_uop_ctrl_imm,
  input         io_stin_bits_uop_robIdx_flag,
  input  [4:0]  io_stin_bits_uop_robIdx_value,
  input         io_stin_bits_uop_sqIdx_flag,
  input  [3:0]  io_stin_bits_uop_sqIdx_value,
  input  [63:0] io_stin_bits_src_0,
  input         io_redirect_valid,
  input         io_redirect_bits_robIdx_flag,
  input  [4:0]  io_redirect_bits_robIdx_value,
  input         io_redirect_bits_level,
  output        io_feedbackSlow_valid,
  output [3:0]  io_feedbackSlow_bits_rsIdx,
  output        io_feedbackSlow_bits_hit,
  output        io_tlb_req_valid,
  output [38:0] io_tlb_req_bits_vaddr,
  input  [35:0] io_tlb_resp_bits_paddr_0,
  input         io_tlb_resp_bits_miss,
  input         io_tlb_resp_bits_excp_0_pf_st,
  input         io_tlb_resp_bits_excp_0_af_st,
  input         io_tlb_resp_bits_static_pm_valid,
  input         io_tlb_resp_bits_static_pm_bits,
  input         io_pmp_st,
  input         io_pmp_mmio,
  input         io_pmp_atomic,
  input  [3:0]  io_rsIdx,
  output        io_lsq_valid,
  output [2:0]  io_lsq_bits_uop_cf_ftqPtr_value,
  output [2:0]  io_lsq_bits_uop_cf_ftqOffset,
  output [6:0]  io_lsq_bits_uop_ctrl_fuOpType,
  output        io_lsq_bits_uop_robIdx_flag,
  output [4:0]  io_lsq_bits_uop_robIdx_value,
  output        io_lsq_bits_uop_sqIdx_flag,
  output [3:0]  io_lsq_bits_uop_sqIdx_value,
  output [38:0] io_lsq_bits_vaddr,
  output [35:0] io_lsq_bits_paddr,
  output [15:0] io_lsq_bits_mask,
  output        io_lsq_bits_wlineflag,
  output        io_lsq_bits_miss,
  output        io_lsq_replenish_mmio,
  output        io_lsq_replenish_atomic,
  output        io_stout_valid,
  output        io_stout_bits_uop_cf_exceptionVec_6,
  output        io_stout_bits_uop_cf_exceptionVec_7,
  output        io_stout_bits_uop_cf_exceptionVec_15,
  output        io_stout_bits_uop_cf_trigger_backendEn_0,
  output        io_stout_bits_uop_robIdx_flag,
  output [4:0]  io_stout_bits_uop_robIdx_value,
  output        io_stout_bits_debug_isMMIO,
  output [38:0] io_stout_bits_debug_vaddr,
  output        io_storeMaskOut_valid,
  output [3:0]  io_storeMaskOut_bits_sqIdx_value,
  output [15:0] io_storeMaskOut_bits_mask,
  output        io_reExecuteQuery_valid,
  output        io_reExecuteQuery_bits_robIdx_flag,
  output [4:0]  io_reExecuteQuery_bits_robIdx_value,
  output [35:0] io_reExecuteQuery_bits_paddr,
  output [15:0] io_reExecuteQuery_bits_mask,
  output        io_issue_valid,
  output        io_issue_bits_uop_cf_storeSetHit,
  output [4:0]  io_issue_bits_uop_cf_ssid,
  output [4:0]  io_issue_bits_uop_robIdx_value
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
  reg [63:0] _RAND_10;
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
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [63:0] _RAND_39;
  reg [31:0] _RAND_40;
`endif // RANDOMIZE_REG_INIT
  wire  store_s0_io_in_valid; // @[StoreUnit.scala 249:24]
  wire  store_s0_io_in_bits_uop_cf_trigger_backendEn_0; // @[StoreUnit.scala 249:24]
  wire  store_s0_io_in_bits_uop_cf_storeSetHit; // @[StoreUnit.scala 249:24]
  wire [4:0] store_s0_io_in_bits_uop_cf_ssid; // @[StoreUnit.scala 249:24]
  wire [2:0] store_s0_io_in_bits_uop_cf_ftqPtr_value; // @[StoreUnit.scala 249:24]
  wire [2:0] store_s0_io_in_bits_uop_cf_ftqOffset; // @[StoreUnit.scala 249:24]
  wire [6:0] store_s0_io_in_bits_uop_ctrl_fuOpType; // @[StoreUnit.scala 249:24]
  wire [19:0] store_s0_io_in_bits_uop_ctrl_imm; // @[StoreUnit.scala 249:24]
  wire  store_s0_io_in_bits_uop_robIdx_flag; // @[StoreUnit.scala 249:24]
  wire [4:0] store_s0_io_in_bits_uop_robIdx_value; // @[StoreUnit.scala 249:24]
  wire  store_s0_io_in_bits_uop_sqIdx_flag; // @[StoreUnit.scala 249:24]
  wire [3:0] store_s0_io_in_bits_uop_sqIdx_value; // @[StoreUnit.scala 249:24]
  wire [63:0] store_s0_io_in_bits_src_0; // @[StoreUnit.scala 249:24]
  wire [3:0] store_s0_io_rsIdx; // @[StoreUnit.scala 249:24]
  wire  store_s0_io_out_valid; // @[StoreUnit.scala 249:24]
  wire  store_s0_io_out_bits_uop_cf_exceptionVec_6; // @[StoreUnit.scala 249:24]
  wire  store_s0_io_out_bits_uop_cf_trigger_backendEn_0; // @[StoreUnit.scala 249:24]
  wire [2:0] store_s0_io_out_bits_uop_cf_ftqPtr_value; // @[StoreUnit.scala 249:24]
  wire [2:0] store_s0_io_out_bits_uop_cf_ftqOffset; // @[StoreUnit.scala 249:24]
  wire [6:0] store_s0_io_out_bits_uop_ctrl_fuOpType; // @[StoreUnit.scala 249:24]
  wire  store_s0_io_out_bits_uop_robIdx_flag; // @[StoreUnit.scala 249:24]
  wire [4:0] store_s0_io_out_bits_uop_robIdx_value; // @[StoreUnit.scala 249:24]
  wire  store_s0_io_out_bits_uop_sqIdx_flag; // @[StoreUnit.scala 249:24]
  wire [3:0] store_s0_io_out_bits_uop_sqIdx_value; // @[StoreUnit.scala 249:24]
  wire [38:0] store_s0_io_out_bits_vaddr; // @[StoreUnit.scala 249:24]
  wire [15:0] store_s0_io_out_bits_mask; // @[StoreUnit.scala 249:24]
  wire  store_s0_io_out_bits_wlineflag; // @[StoreUnit.scala 249:24]
  wire [3:0] store_s0_io_out_bits_rsIdx; // @[StoreUnit.scala 249:24]
  wire  store_s0_io_dtlbReq_valid; // @[StoreUnit.scala 249:24]
  wire [38:0] store_s0_io_dtlbReq_bits_vaddr; // @[StoreUnit.scala 249:24]
  wire  store_s1_io_in_valid; // @[StoreUnit.scala 250:24]
  wire  store_s1_io_in_bits_uop_cf_exceptionVec_6; // @[StoreUnit.scala 250:24]
  wire  store_s1_io_in_bits_uop_cf_trigger_backendEn_0; // @[StoreUnit.scala 250:24]
  wire [2:0] store_s1_io_in_bits_uop_cf_ftqPtr_value; // @[StoreUnit.scala 250:24]
  wire [2:0] store_s1_io_in_bits_uop_cf_ftqOffset; // @[StoreUnit.scala 250:24]
  wire [6:0] store_s1_io_in_bits_uop_ctrl_fuOpType; // @[StoreUnit.scala 250:24]
  wire  store_s1_io_in_bits_uop_robIdx_flag; // @[StoreUnit.scala 250:24]
  wire [4:0] store_s1_io_in_bits_uop_robIdx_value; // @[StoreUnit.scala 250:24]
  wire  store_s1_io_in_bits_uop_sqIdx_flag; // @[StoreUnit.scala 250:24]
  wire [3:0] store_s1_io_in_bits_uop_sqIdx_value; // @[StoreUnit.scala 250:24]
  wire [38:0] store_s1_io_in_bits_vaddr; // @[StoreUnit.scala 250:24]
  wire [15:0] store_s1_io_in_bits_mask; // @[StoreUnit.scala 250:24]
  wire  store_s1_io_in_bits_wlineflag; // @[StoreUnit.scala 250:24]
  wire [3:0] store_s1_io_in_bits_rsIdx; // @[StoreUnit.scala 250:24]
  wire  store_s1_io_out_valid; // @[StoreUnit.scala 250:24]
  wire  store_s1_io_out_bits_uop_cf_exceptionVec_6; // @[StoreUnit.scala 250:24]
  wire  store_s1_io_out_bits_uop_cf_exceptionVec_7; // @[StoreUnit.scala 250:24]
  wire  store_s1_io_out_bits_uop_cf_exceptionVec_15; // @[StoreUnit.scala 250:24]
  wire  store_s1_io_out_bits_uop_cf_trigger_backendEn_0; // @[StoreUnit.scala 250:24]
  wire [2:0] store_s1_io_out_bits_uop_cf_ftqPtr_value; // @[StoreUnit.scala 250:24]
  wire [2:0] store_s1_io_out_bits_uop_cf_ftqOffset; // @[StoreUnit.scala 250:24]
  wire [6:0] store_s1_io_out_bits_uop_ctrl_fuOpType; // @[StoreUnit.scala 250:24]
  wire  store_s1_io_out_bits_uop_robIdx_flag; // @[StoreUnit.scala 250:24]
  wire [4:0] store_s1_io_out_bits_uop_robIdx_value; // @[StoreUnit.scala 250:24]
  wire  store_s1_io_out_bits_uop_sqIdx_flag; // @[StoreUnit.scala 250:24]
  wire [3:0] store_s1_io_out_bits_uop_sqIdx_value; // @[StoreUnit.scala 250:24]
  wire [38:0] store_s1_io_out_bits_vaddr; // @[StoreUnit.scala 250:24]
  wire [35:0] store_s1_io_out_bits_paddr; // @[StoreUnit.scala 250:24]
  wire [15:0] store_s1_io_out_bits_mask; // @[StoreUnit.scala 250:24]
  wire  store_s1_io_out_bits_wlineflag; // @[StoreUnit.scala 250:24]
  wire  store_s1_io_out_bits_mmio; // @[StoreUnit.scala 250:24]
  wire  store_s1_io_out_bits_atomic; // @[StoreUnit.scala 250:24]
  wire  store_s1_io_lsq_valid; // @[StoreUnit.scala 250:24]
  wire [2:0] store_s1_io_lsq_bits_uop_cf_ftqPtr_value; // @[StoreUnit.scala 250:24]
  wire [2:0] store_s1_io_lsq_bits_uop_cf_ftqOffset; // @[StoreUnit.scala 250:24]
  wire [6:0] store_s1_io_lsq_bits_uop_ctrl_fuOpType; // @[StoreUnit.scala 250:24]
  wire  store_s1_io_lsq_bits_uop_robIdx_flag; // @[StoreUnit.scala 250:24]
  wire [4:0] store_s1_io_lsq_bits_uop_robIdx_value; // @[StoreUnit.scala 250:24]
  wire  store_s1_io_lsq_bits_uop_sqIdx_flag; // @[StoreUnit.scala 250:24]
  wire [3:0] store_s1_io_lsq_bits_uop_sqIdx_value; // @[StoreUnit.scala 250:24]
  wire [38:0] store_s1_io_lsq_bits_vaddr; // @[StoreUnit.scala 250:24]
  wire [35:0] store_s1_io_lsq_bits_paddr; // @[StoreUnit.scala 250:24]
  wire [15:0] store_s1_io_lsq_bits_mask; // @[StoreUnit.scala 250:24]
  wire  store_s1_io_lsq_bits_wlineflag; // @[StoreUnit.scala 250:24]
  wire  store_s1_io_lsq_bits_miss; // @[StoreUnit.scala 250:24]
  wire [35:0] store_s1_io_dtlbResp_bits_paddr_0; // @[StoreUnit.scala 250:24]
  wire  store_s1_io_dtlbResp_bits_miss; // @[StoreUnit.scala 250:24]
  wire  store_s1_io_dtlbResp_bits_excp_0_pf_st; // @[StoreUnit.scala 250:24]
  wire  store_s1_io_dtlbResp_bits_excp_0_af_st; // @[StoreUnit.scala 250:24]
  wire  store_s1_io_rsFeedback_valid; // @[StoreUnit.scala 250:24]
  wire [3:0] store_s1_io_rsFeedback_bits_rsIdx; // @[StoreUnit.scala 250:24]
  wire  store_s1_io_rsFeedback_bits_hit; // @[StoreUnit.scala 250:24]
  wire  store_s1_io_reExecuteQuery_valid; // @[StoreUnit.scala 250:24]
  wire  store_s1_io_reExecuteQuery_bits_robIdx_flag; // @[StoreUnit.scala 250:24]
  wire [4:0] store_s1_io_reExecuteQuery_bits_robIdx_value; // @[StoreUnit.scala 250:24]
  wire [35:0] store_s1_io_reExecuteQuery_bits_paddr; // @[StoreUnit.scala 250:24]
  wire [15:0] store_s1_io_reExecuteQuery_bits_mask; // @[StoreUnit.scala 250:24]
  wire  store_s2_io_in_valid; // @[StoreUnit.scala 251:24]
  wire  store_s2_io_in_bits_uop_cf_exceptionVec_6; // @[StoreUnit.scala 251:24]
  wire  store_s2_io_in_bits_uop_cf_exceptionVec_7; // @[StoreUnit.scala 251:24]
  wire  store_s2_io_in_bits_uop_cf_exceptionVec_15; // @[StoreUnit.scala 251:24]
  wire  store_s2_io_in_bits_uop_cf_trigger_backendEn_0; // @[StoreUnit.scala 251:24]
  wire  store_s2_io_in_bits_uop_robIdx_flag; // @[StoreUnit.scala 251:24]
  wire [4:0] store_s2_io_in_bits_uop_robIdx_value; // @[StoreUnit.scala 251:24]
  wire [38:0] store_s2_io_in_bits_vaddr; // @[StoreUnit.scala 251:24]
  wire  store_s2_io_in_bits_mmio; // @[StoreUnit.scala 251:24]
  wire  store_s2_io_in_bits_atomic; // @[StoreUnit.scala 251:24]
  wire  store_s2_io_pmpResp_st; // @[StoreUnit.scala 251:24]
  wire  store_s2_io_pmpResp_mmio; // @[StoreUnit.scala 251:24]
  wire  store_s2_io_pmpResp_atomic; // @[StoreUnit.scala 251:24]
  wire  store_s2_io_static_pm_valid; // @[StoreUnit.scala 251:24]
  wire  store_s2_io_static_pm_bits; // @[StoreUnit.scala 251:24]
  wire  store_s2_io_out_valid; // @[StoreUnit.scala 251:24]
  wire  store_s2_io_out_bits_uop_cf_exceptionVec_6; // @[StoreUnit.scala 251:24]
  wire  store_s2_io_out_bits_uop_cf_exceptionVec_7; // @[StoreUnit.scala 251:24]
  wire  store_s2_io_out_bits_uop_cf_exceptionVec_15; // @[StoreUnit.scala 251:24]
  wire  store_s2_io_out_bits_uop_cf_trigger_backendEn_0; // @[StoreUnit.scala 251:24]
  wire  store_s2_io_out_bits_uop_robIdx_flag; // @[StoreUnit.scala 251:24]
  wire [4:0] store_s2_io_out_bits_uop_robIdx_value; // @[StoreUnit.scala 251:24]
  wire [38:0] store_s2_io_out_bits_vaddr; // @[StoreUnit.scala 251:24]
  wire  store_s2_io_out_bits_mmio; // @[StoreUnit.scala 251:24]
  wire  store_s2_io_out_bits_atomic; // @[StoreUnit.scala 251:24]
  wire  store_s3_io_in_valid; // @[StoreUnit.scala 252:24]
  wire  store_s3_io_in_bits_uop_cf_exceptionVec_6; // @[StoreUnit.scala 252:24]
  wire  store_s3_io_in_bits_uop_cf_exceptionVec_7; // @[StoreUnit.scala 252:24]
  wire  store_s3_io_in_bits_uop_cf_exceptionVec_15; // @[StoreUnit.scala 252:24]
  wire  store_s3_io_in_bits_uop_cf_trigger_backendEn_0; // @[StoreUnit.scala 252:24]
  wire  store_s3_io_in_bits_uop_robIdx_flag; // @[StoreUnit.scala 252:24]
  wire [4:0] store_s3_io_in_bits_uop_robIdx_value; // @[StoreUnit.scala 252:24]
  wire [38:0] store_s3_io_in_bits_vaddr; // @[StoreUnit.scala 252:24]
  wire  store_s3_io_in_bits_mmio; // @[StoreUnit.scala 252:24]
  wire  store_s3_io_stout_valid; // @[StoreUnit.scala 252:24]
  wire  store_s3_io_stout_bits_uop_cf_exceptionVec_6; // @[StoreUnit.scala 252:24]
  wire  store_s3_io_stout_bits_uop_cf_exceptionVec_7; // @[StoreUnit.scala 252:24]
  wire  store_s3_io_stout_bits_uop_cf_exceptionVec_15; // @[StoreUnit.scala 252:24]
  wire  store_s3_io_stout_bits_uop_cf_trigger_backendEn_0; // @[StoreUnit.scala 252:24]
  wire  store_s3_io_stout_bits_uop_robIdx_flag; // @[StoreUnit.scala 252:24]
  wire [4:0] store_s3_io_stout_bits_uop_robIdx_value; // @[StoreUnit.scala 252:24]
  wire  store_s3_io_stout_bits_debug_isMMIO; // @[StoreUnit.scala 252:24]
  wire [38:0] store_s3_io_stout_bits_debug_vaddr; // @[StoreUnit.scala 252:24]
  wire [5:0] _flushItself_T_1 = {store_s0_io_out_bits_uop_robIdx_flag,store_s0_io_out_bits_uop_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire [5:0] _flushItself_T_2 = {io_redirect_bits_robIdx_flag,io_redirect_bits_robIdx_value}; // @[CircularQueuePtr.scala 61:70]
  wire  _flushItself_T_3 = _flushItself_T_1 == _flushItself_T_2; // @[CircularQueuePtr.scala 61:52]
  wire  flushItself = io_redirect_bits_level & _flushItself_T_3; // @[Rob.scala 122:51]
  wire  differentFlag = store_s0_io_out_bits_uop_robIdx_flag ^ io_redirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  compare = store_s0_io_out_bits_uop_robIdx_value > io_redirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _T = differentFlag ^ compare; // @[CircularQueuePtr.scala 88:19]
  wire  _T_2 = io_redirect_valid & (flushItself | _T); // @[Rob.scala 123:20]
  reg  valid; // @[PipelineConnect.scala 108:24]
  wire  leftFire = store_s0_io_out_valid; // @[PipelineConnect.scala 109:31]
  reg  data_uop_cf_exceptionVec_6; // @[Reg.scala 16:16]
  reg  data_uop_cf_trigger_backendEn_0; // @[Reg.scala 16:16]
  reg [2:0] data_uop_cf_ftqPtr_value; // @[Reg.scala 16:16]
  reg [2:0] data_uop_cf_ftqOffset; // @[Reg.scala 16:16]
  reg [6:0] data_uop_ctrl_fuOpType; // @[Reg.scala 16:16]
  reg  data_uop_robIdx_flag; // @[Reg.scala 16:16]
  reg [4:0] data_uop_robIdx_value; // @[Reg.scala 16:16]
  reg  data_uop_sqIdx_flag; // @[Reg.scala 16:16]
  reg [3:0] data_uop_sqIdx_value; // @[Reg.scala 16:16]
  reg [38:0] data_vaddr; // @[Reg.scala 16:16]
  reg [15:0] data_mask; // @[Reg.scala 16:16]
  reg  data_wlineflag; // @[Reg.scala 16:16]
  reg [3:0] data_rsIdx; // @[Reg.scala 16:16]
  reg  io_issue_bits_ruop_cf_storeSetHit; // @[Reg.scala 16:16]
  reg [4:0] io_issue_bits_ruop_cf_ssid; // @[Reg.scala 16:16]
  reg [4:0] io_issue_bits_ruop_robIdx_value; // @[Reg.scala 16:16]
  wire [5:0] _flushItself_T_5 = {store_s1_io_out_bits_uop_robIdx_flag,store_s1_io_out_bits_uop_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _flushItself_T_7 = _flushItself_T_5 == _flushItself_T_2; // @[CircularQueuePtr.scala 61:52]
  wire  flushItself_1 = io_redirect_bits_level & _flushItself_T_7; // @[Rob.scala 122:51]
  wire  differentFlag_1 = store_s1_io_out_bits_uop_robIdx_flag ^ io_redirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  compare_1 = store_s1_io_out_bits_uop_robIdx_value > io_redirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _T_3 = differentFlag_1 ^ compare_1; // @[CircularQueuePtr.scala 88:19]
  wire  _T_5 = io_redirect_valid & (flushItself_1 | _T_3); // @[Rob.scala 123:20]
  reg  valid_1; // @[PipelineConnect.scala 108:24]
  wire  leftFire_1 = store_s1_io_out_valid; // @[PipelineConnect.scala 109:31]
  reg  data_1_uop_cf_exceptionVec_6; // @[Reg.scala 16:16]
  reg  data_1_uop_cf_exceptionVec_7; // @[Reg.scala 16:16]
  reg  data_1_uop_cf_exceptionVec_15; // @[Reg.scala 16:16]
  reg  data_1_uop_cf_trigger_backendEn_0; // @[Reg.scala 16:16]
  reg  data_1_uop_robIdx_flag; // @[Reg.scala 16:16]
  reg [4:0] data_1_uop_robIdx_value; // @[Reg.scala 16:16]
  reg [38:0] data_1_vaddr; // @[Reg.scala 16:16]
  reg  data_1_mmio; // @[Reg.scala 16:16]
  reg  data_1_atomic; // @[Reg.scala 16:16]
  reg [3:0] io_feedbackSlow_bits_REG_rsIdx; // @[StoreUnit.scala 275:34]
  reg  io_feedbackSlow_bits_REG_hit; // @[StoreUnit.scala 275:34]
  reg  io_feedbackSlow_valid_REG; // @[StoreUnit.scala 276:35]
  reg  store_s2_io_static_pm_REG_valid; // @[StoreUnit.scala 279:35]
  reg  store_s2_io_static_pm_REG_bits; // @[StoreUnit.scala 279:35]
  wire [5:0] _flushItself_T_9 = {store_s2_io_out_bits_uop_robIdx_flag,store_s2_io_out_bits_uop_robIdx_value}; // @[CircularQueuePtr.scala 61:50]
  wire  _flushItself_T_11 = _flushItself_T_9 == _flushItself_T_2; // @[CircularQueuePtr.scala 61:52]
  wire  flushItself_2 = io_redirect_bits_level & _flushItself_T_11; // @[Rob.scala 122:51]
  wire  differentFlag_2 = store_s2_io_out_bits_uop_robIdx_flag ^ io_redirect_bits_robIdx_flag; // @[CircularQueuePtr.scala 86:35]
  wire  compare_2 = store_s2_io_out_bits_uop_robIdx_value > io_redirect_bits_robIdx_value; // @[CircularQueuePtr.scala 87:30]
  wire  _T_6 = differentFlag_2 ^ compare_2; // @[CircularQueuePtr.scala 88:19]
  wire  _T_8 = io_redirect_valid & (flushItself_2 | _T_6); // @[Rob.scala 123:20]
  reg  valid_2; // @[PipelineConnect.scala 108:24]
  wire  leftFire_2 = store_s2_io_out_valid; // @[PipelineConnect.scala 109:31]
  reg  data_2_uop_cf_exceptionVec_6; // @[Reg.scala 16:16]
  reg  data_2_uop_cf_exceptionVec_7; // @[Reg.scala 16:16]
  reg  data_2_uop_cf_exceptionVec_15; // @[Reg.scala 16:16]
  reg  data_2_uop_cf_trigger_backendEn_0; // @[Reg.scala 16:16]
  reg  data_2_uop_robIdx_flag; // @[Reg.scala 16:16]
  reg [4:0] data_2_uop_robIdx_value; // @[Reg.scala 16:16]
  reg [38:0] data_2_vaddr; // @[Reg.scala 16:16]
  reg  data_2_mmio; // @[Reg.scala 16:16]
  StoreUnit_S0 store_s0 ( // @[StoreUnit.scala 249:24]
    .io_in_valid(store_s0_io_in_valid),
    .io_in_bits_uop_cf_trigger_backendEn_0(store_s0_io_in_bits_uop_cf_trigger_backendEn_0),
    .io_in_bits_uop_cf_storeSetHit(store_s0_io_in_bits_uop_cf_storeSetHit),
    .io_in_bits_uop_cf_ssid(store_s0_io_in_bits_uop_cf_ssid),
    .io_in_bits_uop_cf_ftqPtr_value(store_s0_io_in_bits_uop_cf_ftqPtr_value),
    .io_in_bits_uop_cf_ftqOffset(store_s0_io_in_bits_uop_cf_ftqOffset),
    .io_in_bits_uop_ctrl_fuOpType(store_s0_io_in_bits_uop_ctrl_fuOpType),
    .io_in_bits_uop_ctrl_imm(store_s0_io_in_bits_uop_ctrl_imm),
    .io_in_bits_uop_robIdx_flag(store_s0_io_in_bits_uop_robIdx_flag),
    .io_in_bits_uop_robIdx_value(store_s0_io_in_bits_uop_robIdx_value),
    .io_in_bits_uop_sqIdx_flag(store_s0_io_in_bits_uop_sqIdx_flag),
    .io_in_bits_uop_sqIdx_value(store_s0_io_in_bits_uop_sqIdx_value),
    .io_in_bits_src_0(store_s0_io_in_bits_src_0),
    .io_rsIdx(store_s0_io_rsIdx),
    .io_out_valid(store_s0_io_out_valid),
    .io_out_bits_uop_cf_exceptionVec_6(store_s0_io_out_bits_uop_cf_exceptionVec_6),
    .io_out_bits_uop_cf_trigger_backendEn_0(store_s0_io_out_bits_uop_cf_trigger_backendEn_0),
    .io_out_bits_uop_cf_ftqPtr_value(store_s0_io_out_bits_uop_cf_ftqPtr_value),
    .io_out_bits_uop_cf_ftqOffset(store_s0_io_out_bits_uop_cf_ftqOffset),
    .io_out_bits_uop_ctrl_fuOpType(store_s0_io_out_bits_uop_ctrl_fuOpType),
    .io_out_bits_uop_robIdx_flag(store_s0_io_out_bits_uop_robIdx_flag),
    .io_out_bits_uop_robIdx_value(store_s0_io_out_bits_uop_robIdx_value),
    .io_out_bits_uop_sqIdx_flag(store_s0_io_out_bits_uop_sqIdx_flag),
    .io_out_bits_uop_sqIdx_value(store_s0_io_out_bits_uop_sqIdx_value),
    .io_out_bits_vaddr(store_s0_io_out_bits_vaddr),
    .io_out_bits_mask(store_s0_io_out_bits_mask),
    .io_out_bits_wlineflag(store_s0_io_out_bits_wlineflag),
    .io_out_bits_rsIdx(store_s0_io_out_bits_rsIdx),
    .io_dtlbReq_valid(store_s0_io_dtlbReq_valid),
    .io_dtlbReq_bits_vaddr(store_s0_io_dtlbReq_bits_vaddr)
  );
  StoreUnit_S1 store_s1 ( // @[StoreUnit.scala 250:24]
    .io_in_valid(store_s1_io_in_valid),
    .io_in_bits_uop_cf_exceptionVec_6(store_s1_io_in_bits_uop_cf_exceptionVec_6),
    .io_in_bits_uop_cf_trigger_backendEn_0(store_s1_io_in_bits_uop_cf_trigger_backendEn_0),
    .io_in_bits_uop_cf_ftqPtr_value(store_s1_io_in_bits_uop_cf_ftqPtr_value),
    .io_in_bits_uop_cf_ftqOffset(store_s1_io_in_bits_uop_cf_ftqOffset),
    .io_in_bits_uop_ctrl_fuOpType(store_s1_io_in_bits_uop_ctrl_fuOpType),
    .io_in_bits_uop_robIdx_flag(store_s1_io_in_bits_uop_robIdx_flag),
    .io_in_bits_uop_robIdx_value(store_s1_io_in_bits_uop_robIdx_value),
    .io_in_bits_uop_sqIdx_flag(store_s1_io_in_bits_uop_sqIdx_flag),
    .io_in_bits_uop_sqIdx_value(store_s1_io_in_bits_uop_sqIdx_value),
    .io_in_bits_vaddr(store_s1_io_in_bits_vaddr),
    .io_in_bits_mask(store_s1_io_in_bits_mask),
    .io_in_bits_wlineflag(store_s1_io_in_bits_wlineflag),
    .io_in_bits_rsIdx(store_s1_io_in_bits_rsIdx),
    .io_out_valid(store_s1_io_out_valid),
    .io_out_bits_uop_cf_exceptionVec_6(store_s1_io_out_bits_uop_cf_exceptionVec_6),
    .io_out_bits_uop_cf_exceptionVec_7(store_s1_io_out_bits_uop_cf_exceptionVec_7),
    .io_out_bits_uop_cf_exceptionVec_15(store_s1_io_out_bits_uop_cf_exceptionVec_15),
    .io_out_bits_uop_cf_trigger_backendEn_0(store_s1_io_out_bits_uop_cf_trigger_backendEn_0),
    .io_out_bits_uop_cf_ftqPtr_value(store_s1_io_out_bits_uop_cf_ftqPtr_value),
    .io_out_bits_uop_cf_ftqOffset(store_s1_io_out_bits_uop_cf_ftqOffset),
    .io_out_bits_uop_ctrl_fuOpType(store_s1_io_out_bits_uop_ctrl_fuOpType),
    .io_out_bits_uop_robIdx_flag(store_s1_io_out_bits_uop_robIdx_flag),
    .io_out_bits_uop_robIdx_value(store_s1_io_out_bits_uop_robIdx_value),
    .io_out_bits_uop_sqIdx_flag(store_s1_io_out_bits_uop_sqIdx_flag),
    .io_out_bits_uop_sqIdx_value(store_s1_io_out_bits_uop_sqIdx_value),
    .io_out_bits_vaddr(store_s1_io_out_bits_vaddr),
    .io_out_bits_paddr(store_s1_io_out_bits_paddr),
    .io_out_bits_mask(store_s1_io_out_bits_mask),
    .io_out_bits_wlineflag(store_s1_io_out_bits_wlineflag),
    .io_out_bits_mmio(store_s1_io_out_bits_mmio),
    .io_out_bits_atomic(store_s1_io_out_bits_atomic),
    .io_lsq_valid(store_s1_io_lsq_valid),
    .io_lsq_bits_uop_cf_ftqPtr_value(store_s1_io_lsq_bits_uop_cf_ftqPtr_value),
    .io_lsq_bits_uop_cf_ftqOffset(store_s1_io_lsq_bits_uop_cf_ftqOffset),
    .io_lsq_bits_uop_ctrl_fuOpType(store_s1_io_lsq_bits_uop_ctrl_fuOpType),
    .io_lsq_bits_uop_robIdx_flag(store_s1_io_lsq_bits_uop_robIdx_flag),
    .io_lsq_bits_uop_robIdx_value(store_s1_io_lsq_bits_uop_robIdx_value),
    .io_lsq_bits_uop_sqIdx_flag(store_s1_io_lsq_bits_uop_sqIdx_flag),
    .io_lsq_bits_uop_sqIdx_value(store_s1_io_lsq_bits_uop_sqIdx_value),
    .io_lsq_bits_vaddr(store_s1_io_lsq_bits_vaddr),
    .io_lsq_bits_paddr(store_s1_io_lsq_bits_paddr),
    .io_lsq_bits_mask(store_s1_io_lsq_bits_mask),
    .io_lsq_bits_wlineflag(store_s1_io_lsq_bits_wlineflag),
    .io_lsq_bits_miss(store_s1_io_lsq_bits_miss),
    .io_dtlbResp_bits_paddr_0(store_s1_io_dtlbResp_bits_paddr_0),
    .io_dtlbResp_bits_miss(store_s1_io_dtlbResp_bits_miss),
    .io_dtlbResp_bits_excp_0_pf_st(store_s1_io_dtlbResp_bits_excp_0_pf_st),
    .io_dtlbResp_bits_excp_0_af_st(store_s1_io_dtlbResp_bits_excp_0_af_st),
    .io_rsFeedback_valid(store_s1_io_rsFeedback_valid),
    .io_rsFeedback_bits_rsIdx(store_s1_io_rsFeedback_bits_rsIdx),
    .io_rsFeedback_bits_hit(store_s1_io_rsFeedback_bits_hit),
    .io_reExecuteQuery_valid(store_s1_io_reExecuteQuery_valid),
    .io_reExecuteQuery_bits_robIdx_flag(store_s1_io_reExecuteQuery_bits_robIdx_flag),
    .io_reExecuteQuery_bits_robIdx_value(store_s1_io_reExecuteQuery_bits_robIdx_value),
    .io_reExecuteQuery_bits_paddr(store_s1_io_reExecuteQuery_bits_paddr),
    .io_reExecuteQuery_bits_mask(store_s1_io_reExecuteQuery_bits_mask)
  );
  StoreUnit_S2 store_s2 ( // @[StoreUnit.scala 251:24]
    .io_in_valid(store_s2_io_in_valid),
    .io_in_bits_uop_cf_exceptionVec_6(store_s2_io_in_bits_uop_cf_exceptionVec_6),
    .io_in_bits_uop_cf_exceptionVec_7(store_s2_io_in_bits_uop_cf_exceptionVec_7),
    .io_in_bits_uop_cf_exceptionVec_15(store_s2_io_in_bits_uop_cf_exceptionVec_15),
    .io_in_bits_uop_cf_trigger_backendEn_0(store_s2_io_in_bits_uop_cf_trigger_backendEn_0),
    .io_in_bits_uop_robIdx_flag(store_s2_io_in_bits_uop_robIdx_flag),
    .io_in_bits_uop_robIdx_value(store_s2_io_in_bits_uop_robIdx_value),
    .io_in_bits_vaddr(store_s2_io_in_bits_vaddr),
    .io_in_bits_mmio(store_s2_io_in_bits_mmio),
    .io_in_bits_atomic(store_s2_io_in_bits_atomic),
    .io_pmpResp_st(store_s2_io_pmpResp_st),
    .io_pmpResp_mmio(store_s2_io_pmpResp_mmio),
    .io_pmpResp_atomic(store_s2_io_pmpResp_atomic),
    .io_static_pm_valid(store_s2_io_static_pm_valid),
    .io_static_pm_bits(store_s2_io_static_pm_bits),
    .io_out_valid(store_s2_io_out_valid),
    .io_out_bits_uop_cf_exceptionVec_6(store_s2_io_out_bits_uop_cf_exceptionVec_6),
    .io_out_bits_uop_cf_exceptionVec_7(store_s2_io_out_bits_uop_cf_exceptionVec_7),
    .io_out_bits_uop_cf_exceptionVec_15(store_s2_io_out_bits_uop_cf_exceptionVec_15),
    .io_out_bits_uop_cf_trigger_backendEn_0(store_s2_io_out_bits_uop_cf_trigger_backendEn_0),
    .io_out_bits_uop_robIdx_flag(store_s2_io_out_bits_uop_robIdx_flag),
    .io_out_bits_uop_robIdx_value(store_s2_io_out_bits_uop_robIdx_value),
    .io_out_bits_vaddr(store_s2_io_out_bits_vaddr),
    .io_out_bits_mmio(store_s2_io_out_bits_mmio),
    .io_out_bits_atomic(store_s2_io_out_bits_atomic)
  );
  StoreUnit_S3 store_s3 ( // @[StoreUnit.scala 252:24]
    .io_in_valid(store_s3_io_in_valid),
    .io_in_bits_uop_cf_exceptionVec_6(store_s3_io_in_bits_uop_cf_exceptionVec_6),
    .io_in_bits_uop_cf_exceptionVec_7(store_s3_io_in_bits_uop_cf_exceptionVec_7),
    .io_in_bits_uop_cf_exceptionVec_15(store_s3_io_in_bits_uop_cf_exceptionVec_15),
    .io_in_bits_uop_cf_trigger_backendEn_0(store_s3_io_in_bits_uop_cf_trigger_backendEn_0),
    .io_in_bits_uop_robIdx_flag(store_s3_io_in_bits_uop_robIdx_flag),
    .io_in_bits_uop_robIdx_value(store_s3_io_in_bits_uop_robIdx_value),
    .io_in_bits_vaddr(store_s3_io_in_bits_vaddr),
    .io_in_bits_mmio(store_s3_io_in_bits_mmio),
    .io_stout_valid(store_s3_io_stout_valid),
    .io_stout_bits_uop_cf_exceptionVec_6(store_s3_io_stout_bits_uop_cf_exceptionVec_6),
    .io_stout_bits_uop_cf_exceptionVec_7(store_s3_io_stout_bits_uop_cf_exceptionVec_7),
    .io_stout_bits_uop_cf_exceptionVec_15(store_s3_io_stout_bits_uop_cf_exceptionVec_15),
    .io_stout_bits_uop_cf_trigger_backendEn_0(store_s3_io_stout_bits_uop_cf_trigger_backendEn_0),
    .io_stout_bits_uop_robIdx_flag(store_s3_io_stout_bits_uop_robIdx_flag),
    .io_stout_bits_uop_robIdx_value(store_s3_io_stout_bits_uop_robIdx_value),
    .io_stout_bits_debug_isMMIO(store_s3_io_stout_bits_debug_isMMIO),
    .io_stout_bits_debug_vaddr(store_s3_io_stout_bits_debug_vaddr)
  );
  assign io_feedbackSlow_valid = io_feedbackSlow_valid_REG; // @[StoreUnit.scala 276:25]
  assign io_feedbackSlow_bits_rsIdx = io_feedbackSlow_bits_REG_rsIdx; // @[StoreUnit.scala 275:24]
  assign io_feedbackSlow_bits_hit = io_feedbackSlow_bits_REG_hit; // @[StoreUnit.scala 275:24]
  assign io_tlb_req_valid = store_s0_io_dtlbReq_valid; // @[StoreUnit.scala 255:23]
  assign io_tlb_req_bits_vaddr = store_s0_io_dtlbReq_bits_vaddr; // @[StoreUnit.scala 255:23]
  assign io_lsq_valid = store_s1_io_lsq_valid; // @[StoreUnit.scala 269:10]
  assign io_lsq_bits_uop_cf_ftqPtr_value = store_s1_io_lsq_bits_uop_cf_ftqPtr_value; // @[StoreUnit.scala 269:10]
  assign io_lsq_bits_uop_cf_ftqOffset = store_s1_io_lsq_bits_uop_cf_ftqOffset; // @[StoreUnit.scala 269:10]
  assign io_lsq_bits_uop_ctrl_fuOpType = store_s1_io_lsq_bits_uop_ctrl_fuOpType; // @[StoreUnit.scala 269:10]
  assign io_lsq_bits_uop_robIdx_flag = store_s1_io_lsq_bits_uop_robIdx_flag; // @[StoreUnit.scala 269:10]
  assign io_lsq_bits_uop_robIdx_value = store_s1_io_lsq_bits_uop_robIdx_value; // @[StoreUnit.scala 269:10]
  assign io_lsq_bits_uop_sqIdx_flag = store_s1_io_lsq_bits_uop_sqIdx_flag; // @[StoreUnit.scala 269:10]
  assign io_lsq_bits_uop_sqIdx_value = store_s1_io_lsq_bits_uop_sqIdx_value; // @[StoreUnit.scala 269:10]
  assign io_lsq_bits_vaddr = store_s1_io_lsq_bits_vaddr; // @[StoreUnit.scala 269:10]
  assign io_lsq_bits_paddr = store_s1_io_lsq_bits_paddr; // @[StoreUnit.scala 269:10]
  assign io_lsq_bits_mask = store_s1_io_lsq_bits_mask; // @[StoreUnit.scala 269:10]
  assign io_lsq_bits_wlineflag = store_s1_io_lsq_bits_wlineflag; // @[StoreUnit.scala 269:10]
  assign io_lsq_bits_miss = store_s1_io_lsq_bits_miss; // @[StoreUnit.scala 269:10]
  assign io_lsq_replenish_mmio = store_s2_io_out_bits_mmio; // @[StoreUnit.scala 280:20]
  assign io_lsq_replenish_atomic = store_s2_io_out_bits_atomic; // @[StoreUnit.scala 280:20]
  assign io_stout_valid = store_s3_io_stout_valid; // @[StoreUnit.scala 283:21]
  assign io_stout_bits_uop_cf_exceptionVec_6 = store_s3_io_stout_bits_uop_cf_exceptionVec_6; // @[StoreUnit.scala 283:21]
  assign io_stout_bits_uop_cf_exceptionVec_7 = store_s3_io_stout_bits_uop_cf_exceptionVec_7; // @[StoreUnit.scala 283:21]
  assign io_stout_bits_uop_cf_exceptionVec_15 = store_s3_io_stout_bits_uop_cf_exceptionVec_15; // @[StoreUnit.scala 283:21]
  assign io_stout_bits_uop_cf_trigger_backendEn_0 = store_s3_io_stout_bits_uop_cf_trigger_backendEn_0; // @[StoreUnit.scala 283:21]
  assign io_stout_bits_uop_robIdx_flag = store_s3_io_stout_bits_uop_robIdx_flag; // @[StoreUnit.scala 283:21]
  assign io_stout_bits_uop_robIdx_value = store_s3_io_stout_bits_uop_robIdx_value; // @[StoreUnit.scala 283:21]
  assign io_stout_bits_debug_isMMIO = store_s3_io_stout_bits_debug_isMMIO; // @[StoreUnit.scala 283:21]
  assign io_stout_bits_debug_vaddr = store_s3_io_stout_bits_debug_vaddr; // @[StoreUnit.scala 283:21]
  assign io_storeMaskOut_valid = store_s0_io_in_valid; // @[StoreUnit.scala 260:25]
  assign io_storeMaskOut_bits_sqIdx_value = store_s0_io_out_bits_uop_sqIdx_value; // @[StoreUnit.scala 262:30]
  assign io_storeMaskOut_bits_mask = store_s0_io_out_bits_mask; // @[StoreUnit.scala 261:29]
  assign io_reExecuteQuery_valid = store_s1_io_reExecuteQuery_valid; // @[StoreUnit.scala 270:21]
  assign io_reExecuteQuery_bits_robIdx_flag = store_s1_io_reExecuteQuery_bits_robIdx_flag; // @[StoreUnit.scala 270:21]
  assign io_reExecuteQuery_bits_robIdx_value = store_s1_io_reExecuteQuery_bits_robIdx_value; // @[StoreUnit.scala 270:21]
  assign io_reExecuteQuery_bits_paddr = store_s1_io_reExecuteQuery_bits_paddr; // @[StoreUnit.scala 270:21]
  assign io_reExecuteQuery_bits_mask = store_s1_io_reExecuteQuery_bits_mask; // @[StoreUnit.scala 270:21]
  assign io_issue_valid = store_s1_io_in_valid & ~store_s1_io_dtlbResp_bits_miss; // @[StoreUnit.scala 265:42]
  assign io_issue_bits_uop_cf_storeSetHit = io_issue_bits_ruop_cf_storeSetHit; // @[StoreUnit.scala 266:17]
  assign io_issue_bits_uop_cf_ssid = io_issue_bits_ruop_cf_ssid; // @[StoreUnit.scala 266:17]
  assign io_issue_bits_uop_robIdx_value = io_issue_bits_ruop_robIdx_value; // @[StoreUnit.scala 266:17]
  assign store_s0_io_in_valid = io_stin_valid; // @[StoreUnit.scala 254:18]
  assign store_s0_io_in_bits_uop_cf_trigger_backendEn_0 = io_stin_bits_uop_cf_trigger_backendEn_0; // @[StoreUnit.scala 254:18]
  assign store_s0_io_in_bits_uop_cf_storeSetHit = io_stin_bits_uop_cf_storeSetHit; // @[StoreUnit.scala 254:18]
  assign store_s0_io_in_bits_uop_cf_ssid = io_stin_bits_uop_cf_ssid; // @[StoreUnit.scala 254:18]
  assign store_s0_io_in_bits_uop_cf_ftqPtr_value = io_stin_bits_uop_cf_ftqPtr_value; // @[StoreUnit.scala 254:18]
  assign store_s0_io_in_bits_uop_cf_ftqOffset = io_stin_bits_uop_cf_ftqOffset; // @[StoreUnit.scala 254:18]
  assign store_s0_io_in_bits_uop_ctrl_fuOpType = io_stin_bits_uop_ctrl_fuOpType; // @[StoreUnit.scala 254:18]
  assign store_s0_io_in_bits_uop_ctrl_imm = io_stin_bits_uop_ctrl_imm; // @[StoreUnit.scala 254:18]
  assign store_s0_io_in_bits_uop_robIdx_flag = io_stin_bits_uop_robIdx_flag; // @[StoreUnit.scala 254:18]
  assign store_s0_io_in_bits_uop_robIdx_value = io_stin_bits_uop_robIdx_value; // @[StoreUnit.scala 254:18]
  assign store_s0_io_in_bits_uop_sqIdx_flag = io_stin_bits_uop_sqIdx_flag; // @[StoreUnit.scala 254:18]
  assign store_s0_io_in_bits_uop_sqIdx_value = io_stin_bits_uop_sqIdx_value; // @[StoreUnit.scala 254:18]
  assign store_s0_io_in_bits_src_0 = io_stin_bits_src_0; // @[StoreUnit.scala 254:18]
  assign store_s0_io_rsIdx = io_rsIdx; // @[StoreUnit.scala 257:21]
  assign store_s1_io_in_valid = valid; // @[PipelineConnect.scala 117:17]
  assign store_s1_io_in_bits_uop_cf_exceptionVec_6 = data_uop_cf_exceptionVec_6; // @[PipelineConnect.scala 116:16]
  assign store_s1_io_in_bits_uop_cf_trigger_backendEn_0 = data_uop_cf_trigger_backendEn_0; // @[PipelineConnect.scala 116:16]
  assign store_s1_io_in_bits_uop_cf_ftqPtr_value = data_uop_cf_ftqPtr_value; // @[PipelineConnect.scala 116:16]
  assign store_s1_io_in_bits_uop_cf_ftqOffset = data_uop_cf_ftqOffset; // @[PipelineConnect.scala 116:16]
  assign store_s1_io_in_bits_uop_ctrl_fuOpType = data_uop_ctrl_fuOpType; // @[PipelineConnect.scala 116:16]
  assign store_s1_io_in_bits_uop_robIdx_flag = data_uop_robIdx_flag; // @[PipelineConnect.scala 116:16]
  assign store_s1_io_in_bits_uop_robIdx_value = data_uop_robIdx_value; // @[PipelineConnect.scala 116:16]
  assign store_s1_io_in_bits_uop_sqIdx_flag = data_uop_sqIdx_flag; // @[PipelineConnect.scala 116:16]
  assign store_s1_io_in_bits_uop_sqIdx_value = data_uop_sqIdx_value; // @[PipelineConnect.scala 116:16]
  assign store_s1_io_in_bits_vaddr = data_vaddr; // @[PipelineConnect.scala 116:16]
  assign store_s1_io_in_bits_mask = data_mask; // @[PipelineConnect.scala 116:16]
  assign store_s1_io_in_bits_wlineflag = data_wlineflag; // @[PipelineConnect.scala 116:16]
  assign store_s1_io_in_bits_rsIdx = data_rsIdx; // @[PipelineConnect.scala 116:16]
  assign store_s1_io_dtlbResp_bits_paddr_0 = io_tlb_resp_bits_paddr_0; // @[StoreUnit.scala 268:24]
  assign store_s1_io_dtlbResp_bits_miss = io_tlb_resp_bits_miss; // @[StoreUnit.scala 268:24]
  assign store_s1_io_dtlbResp_bits_excp_0_pf_st = io_tlb_resp_bits_excp_0_pf_st; // @[StoreUnit.scala 268:24]
  assign store_s1_io_dtlbResp_bits_excp_0_af_st = io_tlb_resp_bits_excp_0_af_st; // @[StoreUnit.scala 268:24]
  assign store_s2_io_in_valid = valid_1; // @[PipelineConnect.scala 117:17]
  assign store_s2_io_in_bits_uop_cf_exceptionVec_6 = data_1_uop_cf_exceptionVec_6; // @[PipelineConnect.scala 116:16]
  assign store_s2_io_in_bits_uop_cf_exceptionVec_7 = data_1_uop_cf_exceptionVec_7; // @[PipelineConnect.scala 116:16]
  assign store_s2_io_in_bits_uop_cf_exceptionVec_15 = data_1_uop_cf_exceptionVec_15; // @[PipelineConnect.scala 116:16]
  assign store_s2_io_in_bits_uop_cf_trigger_backendEn_0 = data_1_uop_cf_trigger_backendEn_0; // @[PipelineConnect.scala 116:16]
  assign store_s2_io_in_bits_uop_robIdx_flag = data_1_uop_robIdx_flag; // @[PipelineConnect.scala 116:16]
  assign store_s2_io_in_bits_uop_robIdx_value = data_1_uop_robIdx_value; // @[PipelineConnect.scala 116:16]
  assign store_s2_io_in_bits_vaddr = data_1_vaddr; // @[PipelineConnect.scala 116:16]
  assign store_s2_io_in_bits_mmio = data_1_mmio; // @[PipelineConnect.scala 116:16]
  assign store_s2_io_in_bits_atomic = data_1_atomic; // @[PipelineConnect.scala 116:16]
  assign store_s2_io_pmpResp_st = io_pmp_st; // @[StoreUnit.scala 278:23]
  assign store_s2_io_pmpResp_mmio = io_pmp_mmio; // @[StoreUnit.scala 278:23]
  assign store_s2_io_pmpResp_atomic = io_pmp_atomic; // @[StoreUnit.scala 278:23]
  assign store_s2_io_static_pm_valid = store_s2_io_static_pm_REG_valid; // @[StoreUnit.scala 279:25]
  assign store_s2_io_static_pm_bits = store_s2_io_static_pm_REG_bits; // @[StoreUnit.scala 279:25]
  assign store_s3_io_in_valid = valid_2; // @[PipelineConnect.scala 117:17]
  assign store_s3_io_in_bits_uop_cf_exceptionVec_6 = data_2_uop_cf_exceptionVec_6; // @[PipelineConnect.scala 116:16]
  assign store_s3_io_in_bits_uop_cf_exceptionVec_7 = data_2_uop_cf_exceptionVec_7; // @[PipelineConnect.scala 116:16]
  assign store_s3_io_in_bits_uop_cf_exceptionVec_15 = data_2_uop_cf_exceptionVec_15; // @[PipelineConnect.scala 116:16]
  assign store_s3_io_in_bits_uop_cf_trigger_backendEn_0 = data_2_uop_cf_trigger_backendEn_0; // @[PipelineConnect.scala 116:16]
  assign store_s3_io_in_bits_uop_robIdx_flag = data_2_uop_robIdx_flag; // @[PipelineConnect.scala 116:16]
  assign store_s3_io_in_bits_uop_robIdx_value = data_2_uop_robIdx_value; // @[PipelineConnect.scala 116:16]
  assign store_s3_io_in_bits_vaddr = data_2_vaddr; // @[PipelineConnect.scala 116:16]
  assign store_s3_io_in_bits_mmio = data_2_mmio; // @[PipelineConnect.scala 116:16]
  always @(posedge clock) begin
    if (leftFire) begin // @[Reg.scala 17:18]
      data_uop_cf_exceptionVec_6 <= store_s0_io_out_bits_uop_cf_exceptionVec_6; // @[Reg.scala 17:22]
    end
    if (leftFire) begin // @[Reg.scala 17:18]
      data_uop_cf_trigger_backendEn_0 <= store_s0_io_out_bits_uop_cf_trigger_backendEn_0; // @[Reg.scala 17:22]
    end
    if (leftFire) begin // @[Reg.scala 17:18]
      data_uop_cf_ftqPtr_value <= store_s0_io_out_bits_uop_cf_ftqPtr_value; // @[Reg.scala 17:22]
    end
    if (leftFire) begin // @[Reg.scala 17:18]
      data_uop_cf_ftqOffset <= store_s0_io_out_bits_uop_cf_ftqOffset; // @[Reg.scala 17:22]
    end
    if (leftFire) begin // @[Reg.scala 17:18]
      data_uop_ctrl_fuOpType <= store_s0_io_out_bits_uop_ctrl_fuOpType; // @[Reg.scala 17:22]
    end
    if (leftFire) begin // @[Reg.scala 17:18]
      data_uop_robIdx_flag <= store_s0_io_out_bits_uop_robIdx_flag; // @[Reg.scala 17:22]
    end
    if (leftFire) begin // @[Reg.scala 17:18]
      data_uop_robIdx_value <= store_s0_io_out_bits_uop_robIdx_value; // @[Reg.scala 17:22]
    end
    if (leftFire) begin // @[Reg.scala 17:18]
      data_uop_sqIdx_flag <= store_s0_io_out_bits_uop_sqIdx_flag; // @[Reg.scala 17:22]
    end
    if (leftFire) begin // @[Reg.scala 17:18]
      data_uop_sqIdx_value <= store_s0_io_out_bits_uop_sqIdx_value; // @[Reg.scala 17:22]
    end
    if (leftFire) begin // @[Reg.scala 17:18]
      data_vaddr <= store_s0_io_out_bits_vaddr; // @[Reg.scala 17:22]
    end
    if (leftFire) begin // @[Reg.scala 17:18]
      data_mask <= store_s0_io_out_bits_mask; // @[Reg.scala 17:22]
    end
    if (leftFire) begin // @[Reg.scala 17:18]
      data_wlineflag <= store_s0_io_out_bits_wlineflag; // @[Reg.scala 17:22]
    end
    if (leftFire) begin // @[Reg.scala 17:18]
      data_rsIdx <= store_s0_io_out_bits_rsIdx; // @[Reg.scala 17:22]
    end
    if (store_s0_io_in_valid) begin // @[Reg.scala 17:18]
      io_issue_bits_ruop_cf_storeSetHit <= store_s0_io_in_bits_uop_cf_storeSetHit; // @[Reg.scala 17:22]
    end
    if (store_s0_io_in_valid) begin // @[Reg.scala 17:18]
      io_issue_bits_ruop_cf_ssid <= store_s0_io_in_bits_uop_cf_ssid; // @[Reg.scala 17:22]
    end
    if (store_s0_io_in_valid) begin // @[Reg.scala 17:18]
      io_issue_bits_ruop_robIdx_value <= store_s0_io_in_bits_uop_robIdx_value; // @[Reg.scala 17:22]
    end
    if (leftFire_1) begin // @[Reg.scala 17:18]
      data_1_uop_cf_exceptionVec_6 <= store_s1_io_out_bits_uop_cf_exceptionVec_6; // @[Reg.scala 17:22]
    end
    if (leftFire_1) begin // @[Reg.scala 17:18]
      data_1_uop_cf_exceptionVec_7 <= store_s1_io_out_bits_uop_cf_exceptionVec_7; // @[Reg.scala 17:22]
    end
    if (leftFire_1) begin // @[Reg.scala 17:18]
      data_1_uop_cf_exceptionVec_15 <= store_s1_io_out_bits_uop_cf_exceptionVec_15; // @[Reg.scala 17:22]
    end
    if (leftFire_1) begin // @[Reg.scala 17:18]
      data_1_uop_cf_trigger_backendEn_0 <= store_s1_io_out_bits_uop_cf_trigger_backendEn_0; // @[Reg.scala 17:22]
    end
    if (leftFire_1) begin // @[Reg.scala 17:18]
      data_1_uop_robIdx_flag <= store_s1_io_out_bits_uop_robIdx_flag; // @[Reg.scala 17:22]
    end
    if (leftFire_1) begin // @[Reg.scala 17:18]
      data_1_uop_robIdx_value <= store_s1_io_out_bits_uop_robIdx_value; // @[Reg.scala 17:22]
    end
    if (leftFire_1) begin // @[Reg.scala 17:18]
      data_1_vaddr <= store_s1_io_out_bits_vaddr; // @[Reg.scala 17:22]
    end
    if (leftFire_1) begin // @[Reg.scala 17:18]
      data_1_mmio <= store_s1_io_out_bits_mmio; // @[Reg.scala 17:22]
    end
    if (leftFire_1) begin // @[Reg.scala 17:18]
      data_1_atomic <= store_s1_io_out_bits_atomic; // @[Reg.scala 17:22]
    end
    io_feedbackSlow_bits_REG_rsIdx <= store_s1_io_rsFeedback_bits_rsIdx; // @[StoreUnit.scala 275:34]
    io_feedbackSlow_bits_REG_hit <= store_s1_io_rsFeedback_bits_hit; // @[StoreUnit.scala 275:34]
    io_feedbackSlow_valid_REG <= store_s1_io_rsFeedback_valid & ~_T_5; // @[StoreUnit.scala 276:65]
    store_s2_io_static_pm_REG_valid <= io_tlb_resp_bits_static_pm_valid; // @[StoreUnit.scala 279:35]
    store_s2_io_static_pm_REG_bits <= io_tlb_resp_bits_static_pm_bits; // @[StoreUnit.scala 279:35]
    if (leftFire_2) begin // @[Reg.scala 17:18]
      data_2_uop_cf_exceptionVec_6 <= store_s2_io_out_bits_uop_cf_exceptionVec_6; // @[Reg.scala 17:22]
    end
    if (leftFire_2) begin // @[Reg.scala 17:18]
      data_2_uop_cf_exceptionVec_7 <= store_s2_io_out_bits_uop_cf_exceptionVec_7; // @[Reg.scala 17:22]
    end
    if (leftFire_2) begin // @[Reg.scala 17:18]
      data_2_uop_cf_exceptionVec_15 <= store_s2_io_out_bits_uop_cf_exceptionVec_15; // @[Reg.scala 17:22]
    end
    if (leftFire_2) begin // @[Reg.scala 17:18]
      data_2_uop_cf_trigger_backendEn_0 <= store_s2_io_out_bits_uop_cf_trigger_backendEn_0; // @[Reg.scala 17:22]
    end
    if (leftFire_2) begin // @[Reg.scala 17:18]
      data_2_uop_robIdx_flag <= store_s2_io_out_bits_uop_robIdx_flag; // @[Reg.scala 17:22]
    end
    if (leftFire_2) begin // @[Reg.scala 17:18]
      data_2_uop_robIdx_value <= store_s2_io_out_bits_uop_robIdx_value; // @[Reg.scala 17:22]
    end
    if (leftFire_2) begin // @[Reg.scala 17:18]
      data_2_vaddr <= store_s2_io_out_bits_vaddr; // @[Reg.scala 17:22]
    end
    if (leftFire_2) begin // @[Reg.scala 17:18]
      data_2_mmio <= store_s2_io_out_bits_mmio; // @[Reg.scala 17:22]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[PipelineConnect.scala 112:20]
      valid <= 1'h0; // @[PipelineConnect.scala 112:28]
    end else if (_T_2) begin
      valid <= 1'h0;
    end else begin
      valid <= leftFire;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[PipelineConnect.scala 112:20]
      valid_1 <= 1'h0; // @[PipelineConnect.scala 112:28]
    end else if (_T_5) begin
      valid_1 <= 1'h0;
    end else begin
      valid_1 <= leftFire_1;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[PipelineConnect.scala 112:20]
      valid_2 <= 1'h0; // @[PipelineConnect.scala 112:28]
    end else if (_T_8) begin
      valid_2 <= 1'h0;
    end else begin
      valid_2 <= leftFire_2;
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
  valid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  data_uop_cf_exceptionVec_6 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  data_uop_cf_trigger_backendEn_0 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  data_uop_cf_ftqPtr_value = _RAND_3[2:0];
  _RAND_4 = {1{`RANDOM}};
  data_uop_cf_ftqOffset = _RAND_4[2:0];
  _RAND_5 = {1{`RANDOM}};
  data_uop_ctrl_fuOpType = _RAND_5[6:0];
  _RAND_6 = {1{`RANDOM}};
  data_uop_robIdx_flag = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  data_uop_robIdx_value = _RAND_7[4:0];
  _RAND_8 = {1{`RANDOM}};
  data_uop_sqIdx_flag = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  data_uop_sqIdx_value = _RAND_9[3:0];
  _RAND_10 = {2{`RANDOM}};
  data_vaddr = _RAND_10[38:0];
  _RAND_11 = {1{`RANDOM}};
  data_mask = _RAND_11[15:0];
  _RAND_12 = {1{`RANDOM}};
  data_wlineflag = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  data_rsIdx = _RAND_13[3:0];
  _RAND_14 = {1{`RANDOM}};
  io_issue_bits_ruop_cf_storeSetHit = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  io_issue_bits_ruop_cf_ssid = _RAND_15[4:0];
  _RAND_16 = {1{`RANDOM}};
  io_issue_bits_ruop_robIdx_value = _RAND_16[4:0];
  _RAND_17 = {1{`RANDOM}};
  valid_1 = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  data_1_uop_cf_exceptionVec_6 = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  data_1_uop_cf_exceptionVec_7 = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  data_1_uop_cf_exceptionVec_15 = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  data_1_uop_cf_trigger_backendEn_0 = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  data_1_uop_robIdx_flag = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  data_1_uop_robIdx_value = _RAND_23[4:0];
  _RAND_24 = {2{`RANDOM}};
  data_1_vaddr = _RAND_24[38:0];
  _RAND_25 = {1{`RANDOM}};
  data_1_mmio = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  data_1_atomic = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  io_feedbackSlow_bits_REG_rsIdx = _RAND_27[3:0];
  _RAND_28 = {1{`RANDOM}};
  io_feedbackSlow_bits_REG_hit = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  io_feedbackSlow_valid_REG = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  store_s2_io_static_pm_REG_valid = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  store_s2_io_static_pm_REG_bits = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  valid_2 = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  data_2_uop_cf_exceptionVec_6 = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  data_2_uop_cf_exceptionVec_7 = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  data_2_uop_cf_exceptionVec_15 = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  data_2_uop_cf_trigger_backendEn_0 = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  data_2_uop_robIdx_flag = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  data_2_uop_robIdx_value = _RAND_38[4:0];
  _RAND_39 = {2{`RANDOM}};
  data_2_vaddr = _RAND_39[38:0];
  _RAND_40 = {1{`RANDOM}};
  data_2_mmio = _RAND_40[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    valid = 1'h0;
  end
  if (reset) begin
    valid_1 = 1'h0;
  end
  if (reset) begin
    valid_2 = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

