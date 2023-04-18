module StoreUnit_S1(
  input         io_in_valid,
  input         io_in_bits_uop_cf_exceptionVec_6,
  input         io_in_bits_uop_cf_trigger_backendEn_0,
  input  [2:0]  io_in_bits_uop_cf_ftqPtr_value,
  input  [2:0]  io_in_bits_uop_cf_ftqOffset,
  input  [6:0]  io_in_bits_uop_ctrl_fuOpType,
  input         io_in_bits_uop_robIdx_flag,
  input  [4:0]  io_in_bits_uop_robIdx_value,
  input         io_in_bits_uop_sqIdx_flag,
  input  [3:0]  io_in_bits_uop_sqIdx_value,
  input  [38:0] io_in_bits_vaddr,
  input  [15:0] io_in_bits_mask,
  input         io_in_bits_wlineflag,
  input  [3:0]  io_in_bits_rsIdx,
  output        io_out_valid,
  output        io_out_bits_uop_cf_exceptionVec_6,
  output        io_out_bits_uop_cf_exceptionVec_7,
  output        io_out_bits_uop_cf_exceptionVec_15,
  output        io_out_bits_uop_cf_trigger_backendEn_0,
  output [2:0]  io_out_bits_uop_cf_ftqPtr_value,
  output [2:0]  io_out_bits_uop_cf_ftqOffset,
  output [6:0]  io_out_bits_uop_ctrl_fuOpType,
  output        io_out_bits_uop_robIdx_flag,
  output [4:0]  io_out_bits_uop_robIdx_value,
  output        io_out_bits_uop_sqIdx_flag,
  output [3:0]  io_out_bits_uop_sqIdx_value,
  output [38:0] io_out_bits_vaddr,
  output [35:0] io_out_bits_paddr,
  output [15:0] io_out_bits_mask,
  output        io_out_bits_wlineflag,
  output        io_out_bits_mmio,
  output        io_out_bits_atomic,
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
  input  [35:0] io_dtlbResp_bits_paddr_0,
  input         io_dtlbResp_bits_miss,
  input         io_dtlbResp_bits_excp_0_pf_st,
  input         io_dtlbResp_bits_excp_0_af_st,
  output        io_rsFeedback_valid,
  output [3:0]  io_rsFeedback_bits_rsIdx,
  output        io_rsFeedback_bits_hit,
  output        io_reExecuteQuery_valid,
  output        io_reExecuteQuery_bits_robIdx_flag,
  output [4:0]  io_reExecuteQuery_bits_robIdx_value,
  output [35:0] io_reExecuteQuery_bits_paddr,
  output [15:0] io_reExecuteQuery_bits_mask
);
  wire  _is_mmio_cbo_T_1 = io_in_bits_uop_ctrl_fuOpType == 7'hd; // @[StoreUnit.scala 118:34]
  wire  _is_mmio_cbo_T_2 = io_in_bits_uop_ctrl_fuOpType == 7'hc | _is_mmio_cbo_T_1; // @[StoreUnit.scala 117:74]
  wire  _is_mmio_cbo_T_3 = io_in_bits_uop_ctrl_fuOpType == 7'he; // @[StoreUnit.scala 119:34]
  wire  _io_reExecuteQuery_valid_T = ~io_dtlbResp_bits_miss; // @[StoreUnit.scala 132:45]
  assign io_out_valid = io_in_valid & _io_reExecuteQuery_valid_T; // @[StoreUnit.scala 153:31]
  assign io_out_bits_uop_cf_exceptionVec_6 = io_in_bits_uop_cf_exceptionVec_6; // @[StoreUnit.scala 154:15]
  assign io_out_bits_uop_cf_exceptionVec_7 = io_dtlbResp_bits_excp_0_af_st; // @[StoreUnit.scala 160:53]
  assign io_out_bits_uop_cf_exceptionVec_15 = io_dtlbResp_bits_excp_0_pf_st; // @[StoreUnit.scala 159:51]
  assign io_out_bits_uop_cf_trigger_backendEn_0 = io_in_bits_uop_cf_trigger_backendEn_0; // @[StoreUnit.scala 154:15]
  assign io_out_bits_uop_cf_ftqPtr_value = io_in_bits_uop_cf_ftqPtr_value; // @[StoreUnit.scala 154:15]
  assign io_out_bits_uop_cf_ftqOffset = io_in_bits_uop_cf_ftqOffset; // @[StoreUnit.scala 154:15]
  assign io_out_bits_uop_ctrl_fuOpType = io_in_bits_uop_ctrl_fuOpType; // @[StoreUnit.scala 154:15]
  assign io_out_bits_uop_robIdx_flag = io_in_bits_uop_robIdx_flag; // @[StoreUnit.scala 154:15]
  assign io_out_bits_uop_robIdx_value = io_in_bits_uop_robIdx_value; // @[StoreUnit.scala 154:15]
  assign io_out_bits_uop_sqIdx_flag = io_in_bits_uop_sqIdx_flag; // @[StoreUnit.scala 154:15]
  assign io_out_bits_uop_sqIdx_value = io_in_bits_uop_sqIdx_value; // @[StoreUnit.scala 154:15]
  assign io_out_bits_vaddr = io_in_bits_vaddr; // @[StoreUnit.scala 154:15]
  assign io_out_bits_paddr = io_dtlbResp_bits_paddr_0; // @[StoreUnit.scala 155:21]
  assign io_out_bits_mask = io_in_bits_mask; // @[StoreUnit.scala 154:15]
  assign io_out_bits_wlineflag = io_in_bits_wlineflag; // @[StoreUnit.scala 154:15]
  assign io_out_bits_mmio = _is_mmio_cbo_T_2 | _is_mmio_cbo_T_3; // @[StoreUnit.scala 118:58]
  assign io_out_bits_atomic = _is_mmio_cbo_T_2 | _is_mmio_cbo_T_3; // @[StoreUnit.scala 118:58]
  assign io_lsq_valid = io_in_valid; // @[StoreUnit.scala 162:16]
  assign io_lsq_bits_uop_cf_ftqPtr_value = io_out_bits_uop_cf_ftqPtr_value; // @[StoreUnit.scala 163:15]
  assign io_lsq_bits_uop_cf_ftqOffset = io_out_bits_uop_cf_ftqOffset; // @[StoreUnit.scala 163:15]
  assign io_lsq_bits_uop_ctrl_fuOpType = io_out_bits_uop_ctrl_fuOpType; // @[StoreUnit.scala 163:15]
  assign io_lsq_bits_uop_robIdx_flag = io_out_bits_uop_robIdx_flag; // @[StoreUnit.scala 163:15]
  assign io_lsq_bits_uop_robIdx_value = io_out_bits_uop_robIdx_value; // @[StoreUnit.scala 163:15]
  assign io_lsq_bits_uop_sqIdx_flag = io_out_bits_uop_sqIdx_flag; // @[StoreUnit.scala 163:15]
  assign io_lsq_bits_uop_sqIdx_value = io_out_bits_uop_sqIdx_value; // @[StoreUnit.scala 163:15]
  assign io_lsq_bits_vaddr = io_out_bits_vaddr; // @[StoreUnit.scala 163:15]
  assign io_lsq_bits_paddr = io_out_bits_paddr; // @[StoreUnit.scala 163:15]
  assign io_lsq_bits_mask = io_out_bits_mask; // @[StoreUnit.scala 163:15]
  assign io_lsq_bits_wlineflag = io_out_bits_wlineflag; // @[StoreUnit.scala 163:15]
  assign io_lsq_bits_miss = io_dtlbResp_bits_miss; // @[StoreUnit.scala 164:20]
  assign io_rsFeedback_valid = io_in_valid; // @[StoreUnit.scala 139:23]
  assign io_rsFeedback_bits_rsIdx = io_in_bits_rsIdx; // @[StoreUnit.scala 142:28]
  assign io_rsFeedback_bits_hit = ~io_dtlbResp_bits_miss; // @[StoreUnit.scala 140:29]
  assign io_reExecuteQuery_valid = io_in_valid & ~io_dtlbResp_bits_miss; // @[StoreUnit.scala 132:42]
  assign io_reExecuteQuery_bits_robIdx_flag = io_in_bits_uop_robIdx_flag; // @[StoreUnit.scala 133:33]
  assign io_reExecuteQuery_bits_robIdx_value = io_in_bits_uop_robIdx_value; // @[StoreUnit.scala 133:33]
  assign io_reExecuteQuery_bits_paddr = io_dtlbResp_bits_paddr_0; // @[StoreUnit.scala 134:32]
  assign io_reExecuteQuery_bits_mask = io_in_bits_mask; // @[StoreUnit.scala 135:31]
endmodule

